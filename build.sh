#!/usr/bin/env bash
set -euo pipefail

# --------- config ----------
MAIN_TEX="${MAIN_TEX:-main}"            # main.tex without extension
DRAFTS_DIR="${DRAFTS_DIR:-markdown-drafts}"
ARTICLES_DIR="${ARTICLES_DIR:-articles}"
FRONTMATTER_DIR="${FRONTMATTER_DIR:-frontmatter}"
MAP_FILE="${MAP_FILE:-pandoc-map.tsv}"  # optional: "file.md<TAB>articles|frontmatter"

# Pandoc config
PANDOC_FROM="${PANDOC_FROM:-markdown}"
PANDOC_TO="${PANDOC_TO:-latex}"
# Commonly useful: make sure we get LaTeX fragments appropriate for \input
PANDOC_OPTS=(
  --standalone=false
)

# --------- helpers ----------
need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Error: missing dependency: $1" >&2
    exit 1
  }
}

dest_for() {
  # Determine output directory for a given markdown filename (basename.md)
  # Priority:
  #  1) MAP_FILE if present and has an entry
  #  2) naming convention: fm-*.md -> frontmatter, else articles
  local base="$1"

  if [[ -f "$MAP_FILE" ]]; then
    local found
    found="$(
      awk -F'\t' -v f="$base" '
        $0 ~ /^[[:space:]]*#/ { next }
        $0 ~ /^[[:space:]]*$/ { next }
        $1 == f { print $2; exit }
      ' "$MAP_FILE"
    )"
    if [[ -n "${found:-}" ]]; then
      case "$found" in
        articles) echo "$ARTICLES_DIR"; return 0 ;;
        frontmatter) echo "$FRONTMATTER_DIR"; return 0 ;;
        *)
          echo "Error: $MAP_FILE route for $base must be 'articles' or 'frontmatter' (got '$found')" >&2
          exit 1
          ;;
      esac
    fi
  fi

  if [[ "$base" == fm-* ]]; then
    echo "$FRONTMATTER_DIR"
  else
    echo "$ARTICLES_DIR"
  fi
}

run_pandoc() {
  mkdir -p "$ARTICLES_DIR" "$FRONTMATTER_DIR"

  shopt -s nullglob
  local files=("$DRAFTS_DIR"/*.md)
  shopt -u nullglob

  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No markdown drafts found in $DRAFTS_DIR/ (skipping pandoc step)."
    return 0
  fi

  for f in "${files[@]}"; do
    local base stem outdir out
    base="$(basename "$f")"
    stem="${base%.md}"
    outdir="$(dest_for "$base")"
    out="$outdir/$stem.tex"

      echo "pandoc: $f -> $out"
      {
	echo '% This file was generated automatically by pandoc. Do not edit manually.'
	echo '%-----------------------------------------------------------------------'
	echo
        pandoc "$f" \
          -f "$PANDOC_FROM" \
          -t "$PANDOC_TO" \
          "${PANDOC_OPTS[@]}"
      } > "$out"
  done
}

run_latex() {
  local tex="${MAIN_TEX}.tex"
  if [[ ! -f "$tex" ]]; then
    echo "Error: could not find $tex" >&2
    exit 1
  fi

  echo "pdflatex: pass 1"
  pdflatex -interaction=nonstopmode -halt-on-error "$MAIN_TEX"

  # If biblatex/biber is used, .bcf is produced.
  if [[ -f "${MAIN_TEX}.bcf" ]]; then
    echo "biber: ${MAIN_TEX}"
    biber "$MAIN_TEX"
  else
    echo "biber: skipped (no ${MAIN_TEX}.bcf found)"
  fi

  echo "pdflatex: pass 2"
  pdflatex -interaction=nonstopmode -halt-on-error "$MAIN_TEX"

  echo "pdflatex: pass 3"
  pdflatex -interaction=nonstopmode -halt-on-error "$MAIN_TEX"
}

clean() {
  rm -f \
    "${MAIN_TEX}.aux" "${MAIN_TEX}.bbl" "${MAIN_TEX}.bcf" "${MAIN_TEX}.blg" \
    "${MAIN_TEX}.log" "${MAIN_TEX}.out" "${MAIN_TEX}.run.xml" \
    "${MAIN_TEX}.toc" "${MAIN_TEX}.lof" "${MAIN_TEX}.lot" \
    "${MAIN_TEX}.synctex.gz" \
    *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.toc *.lof *.lot
  echo "Cleaned build artifacts."
}

usage() {
  cat <<'EOF'
Usage:
  ./build.sh [command]

Commands:
  all        Run pandoc routing + build PDF (default)
  pandoc     Only run pandoc step
  pdf        Only run LaTeX/biber build
  clean      Remove common LaTeX build artifacts

Routing rules:
  - If pandoc-map.tsv exists, it controls destination:
      filename.md<TAB>articles|frontmatter
  - Otherwise, files named fm-*.md go to frontmatter/, all others to articles/.

Notes:
  - Outputs are .tex files (same stem as the .md input).
  - Designed for \input{articles/foo} / \input{frontmatter/bar}

Environment overrides:
  MAIN_TEX=main
  DRAFTS_DIR=markdown-drafts
  ARTICLES_DIR=articles
  FRONTMATTER_DIR=frontmatter
  MAP_FILE=pandoc-map.tsv
EOF
}

main() {
  need pandoc
  need pdflatex
  need biber

  local cmd="${1:-all}"
  case "$cmd" in
    all)
      run_pandoc
      run_latex
      ;;
    pandoc)
      run_pandoc
      ;;
    pdf)
      run_latex
      ;;
    clean)
      clean
      ;;
    -h|--help|help)
      usage
      ;;
    *)
      echo "Unknown command: $cmd" >&2
      usage >&2
      exit 1
      ;;
  esac
}

main "$@"
