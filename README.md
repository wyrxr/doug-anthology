# Donations, Death Road, and Dogs
**An Anthology of Critical Douglas Studies**

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Status: Satire](https://img.shields.io/badge/Status-Rigged-red.svg)]()

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
