# Donations, Death Road, and Dogs
**An Anthology of Critical Douglas Studies**

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Status: Satire](https://img.shields.io/badge/Status-ROGGED-red.svg)](https://youtu.be/DHk8qpAmTOo?si=X7UY9i2n8tc7dkyC)

> "DougDoug may or may not be real. Douglas Studies is only real insofar as this anthology has made it so." — *Nathaniel Ingle, Editor-in-Chief*

## 📜 About the Project

This repository contains the full LaTeX source code for **Donations, Death Roads, and Dogs**, a satirical academic anthology published by the fictional **Saint Rosa's Cathedral Press**.

The book treats the content of the Twitch streamer/YouTuber [DougDoug](https://www.youtube.com/@DougDoug) as a subject of serious critical theory, applying rigorous academic analysis to topics such as:
* The unpaid labor of chat-generated jokes and content.
* The psychoanalytic explanations for chat's obsession with "baldness".
* The anthropomorphic fallacy applied to LLMs with their temperature parameters set too high.

## 🛠️ How to Build the Book

To compile the PDF from source, you will need a standard TeX distribution (TeX Live, MacTeX, or MiKTeX) installed on your machine.

### Prerequisites
Ensure you have the following packages installed (standard in most full distributions):
* `biblatex` (for citations)
* `biber` (backend for bibliography)
* `imakeidx` (for the index)
* `ccicons` (for the copyright page)

### Compilation Steps
This project uses `biber` for bibliography management and `imakeidx` for indexing. You must run the compilation commands in a specific order to generate all cross-references correctly:

```bash
# 1. Initial build (generates .aux and .idx files)
pdflatex main

# 2. Sort the bibliography and index
biber main

# 3. Apply the bibliography and index to the document
pdflatex main

# 4. Final polish (resolves page numbers and labels)
pdflatex main
```

*Note: If you use a tool like `latexmk` or the VimTeX plugin, it should handle this sequence automatically.*

## 📂 Project Structure

* `main.tex` - The root file that orchestrates the entire book.
* `preamble.tex` - Contains all packages, custom commands, and style definitions.
* `references.bib` - The database of fictional (and real) citations.
* `articles/` - Individual chapter files (e.g., `article-01-the-bit.tex`).
* `images/` - Graphics, woodcut logos, and charts.

## ⚖️ Licensing

This project is **Dual Licensed** to support both open creativity and open code.

### 1. The Content (Text & Art)

**License:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](http://creativecommons.org/licenses/by-sa/4.0/)

The narrative text, fictional articles, jokes, characters, and the final compiled PDF are open content. You are free to:

* **Share:** Copy and redistribute the material in any medium.
* **Adapt:** Remix, transform, and build upon the material (even commercially).

**Condition:** You must give appropriate credit to **Nathaniel Ingle** and distribute your contributions under the same license.

### 2. The Source Code (LaTeX Templates)

**License:** [GNU General Public License v3.0 (GPLv3)](https://www.gnu.org/licenses/gpl-3.0)

The LaTeX logic, formatting macros, styling code, and build scripts are free software.

* If you use this repository's layout code to create your own project, you must preserve the license and open-source your modifications to the code.

---

**Saint Rosa's Cathedral Press** *Est. 1751*