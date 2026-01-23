# Donations, Death Road, and Dogs

**An Anthology of Critical Douglas Studies**

[![License: CC BY-SA 4.0](https://img.shields.io/badge/Content%20License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![License: GPL v3](https://img.shields.io/badge/Code%20License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Status: Satire](https://img.shields.io/badge/Status-ROGGED-red.svg)](https://youtu.be/DHk8qpAmTOo?si=X7UY9i2n8tc7dkyC)

> "DougDoug may or may not be real. Douglas Studies is only real insofar as this anthology has made it so." — *Nathaniel Ingle, Editor-in-Chief*

## 📜 About the Project

This repository contains the full LaTeX source code for **Donations, Death Roads, and Dogs**, a satirical academic anthology published by the fictional **Saint Rosa's Cathedral Press**.

The book treats the content of the Twitch streamer/YouTuber [DougDoug](https://www.youtube.com/@DougDoug) as a subject of serious critical theory, applying rigorous academic analysis to topics such as:

- The unpaid labor of chat-generated jokes and content.
- The psychoanalytic explanations for chat's obsession with "baldness".
- The anthropomorphic fallacy applied to LLMs with their temperature parameters set too high.

## 🛠️ How to Build the Book

This project builds a PDF from LaTeX. Some content may be drafted in Markdown and converted into `.tex` files via Pandoc.

### Prerequisites

Install:

- A TeX distribution (TeX Live, MacTeX, or MiKTeX)
- `pandoc`
- `biber` (often included with full TeX installs)

This project also uses common LaTeX packages (names vary by distribution), including:

- `biblatex` (citations)
- `imakeidx` (index)
- `ccicons` (copyright page)

### Quick Start (Recommended)

Build everything (convert Markdown drafts + compile the PDF):

```bash
./build.sh
```

Other useful commands:

```bash
./build.sh pandoc   # only convert markdown-drafts/*.md -> .tex
./build.sh pdf      # only compile main.tex -> main.pdf
./build.sh clean    # remove common LaTeX build artifacts
```

### Manual Compilation (What the Script Runs)

If you prefer to compile by hand, run:

```bash
lualatex main
biber main
lualatex main
lualatex main
```

*Note: Tools like `latexmk` or the VimTeX plugin can also manage this sequence automatically.*

### Troubleshooting

- If bibliography updates don’t appear, try:

  ```bash
  ./build.sh clean
  ./build.sh
  ```

- If `biber` is not found, install it via your TeX distribution (TeX Live / MacTeX / MiKTeX packages differ).

## 📂 Project Structure

- `main.tex` — The root file that orchestrates the entire book.
- `preamble.tex` — Contains all packages, custom commands, and style definitions.
- `references.bib` — The database of fictional (and real) citations.
- `build.sh` — Build helper (Pandoc conversion + LaTeX/biber compilation).
- `markdown-drafts/` — Markdown drafts that are converted to `.tex`.
- `frontmatter/` — Front matter `.tex` files (some may be generated from Markdown).
- `articles/` — Individual chapter files (e.g., `the-bit.tex`).
- `images/` — Graphics, woodcut logos, and charts.
- `pandoc-map.tsv` — Routes drafts to `articles/` vs `frontmatter/`.

## ⚖️ Licensing

This project is **dual-licensed** to support both open creativity and open code.

### 1. The Content (Text & Art)

**License:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/)

The narrative text, fictional articles, jokes, characters, and the final compiled PDF are open content. You are free to:

- **Share:** Copy and redistribute the material in any medium.
- **Adapt:** Remix, transform, and build upon the material (even commercially).

**Condition:** You must give appropriate credit to **Nathaniel Ingle** and distribute your contributions under the same license.

### 2. The Source Code (LaTeX Templates, Build Scripts)

**License:** [GNU General Public License v3.0 (GPLv3)](https://www.gnu.org/licenses/gpl-3.0)

The LaTeX logic, formatting macros, styling code, and build scripts are free software.

- If you use this repository's layout code to create your own project, you must preserve the license and open-source your modifications to the code.

---

**Saint Rosa's Cathedral Press** *Est. 1751*
