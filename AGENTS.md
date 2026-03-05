# AGENTS.md - Guide for AI Coding Agents

## Project Overview

abnTeX2 is a LaTeX suite for typesetting technical and scientific Brazilian documents
in compliance with ABNT (Associacao Brasileira de Normas Tecnicas) standards. It extends
the `memoir` document class and provides citation/bibliography packages. The project is
licensed under LPPL v1.3c.

### Core Deliverables (6 files)

| File | Location | Purpose |
|------|----------|---------|
| `abntex2.cls` | `tex/latex/abntex2/` | Main document class (extends memoir) |
| `abntex2cite.sty` | `tex/latex/abntex2/` | Citation package (NBR 10520) |
| `abntex2abrev.sty` | `tex/latex/abntex2/` | Abbreviation macros (NBR 10522) |
| `abntex2-alf.bst` | `bibtex/bst/abntex2/` | Author-date bibliography style |
| `abntex2-num.bst` | `bibtex/bst/abntex2/` | Numeric bibliography style |
| `abntex2-options.bib` | `bibtex/bib/abntex2/` | Default citation options |

### Directory Layout (TDS-compliant)

```
tex/latex/abntex2/       # LaTeX class and style files (.cls, .sty)
bibtex/bst/abntex2/      # BibTeX style files (.bst)
bibtex/bib/abntex2/      # BibTeX database files (.bib)
doc/latex/abntex2/       # Documentation sources (.tex, .bib)
doc/latex/abntex2/examples/  # Template/example documents
```

## Build Commands

### Prerequisites

- TeX Live 2012+ (or MiKTeX/MacTeX equivalent)
- `latexmk` (ships with TeX Live)
- `makeglossaries` (for glossary examples)

### Compile a Single Document

```bash
latexmk -pdf -time -silent <filename-without-extension>
```

The `.latexmkrc` in the project root configures `makeglossaries` support for
`.glo`->`.gls` and `.acn`->`.acr` dependencies automatically.

### Full Release Build

```bash
./build.sh [version]               # Build all PDFs + distribution archives
./build.sh [version] [user] [key]  # Build + deploy to Bintray
```

The build script: initializes `target/`, replaces version placeholders, compiles
all documentation and example PDFs, creates ZIP/TAR distribution packages, then cleans up.

### Install Locally (Unix/TeX Live)

```bash
sudo make install                  # Install to /usr/local/share/texmf
sudo make install PREFIX=/path     # Custom prefix
sudo make uninstall                # Remove installed files
```

Both targets run `texhash` after modifying the TeX tree.

### Compile Individual Examples

Copy class/style/bst/bib files into the examples directory first, then:

```bash
cd doc/latex/abntex2/examples/
cp ../../../tex/latex/abntex2/* .
cp ../../../bibtex/bib/abntex2/* .
cp ../../../bibtex/bst/abntex2/* .
cp ../../../.latexmkrc .
latexmk -pdf -time -silent abntex2-modelo-trabalho-academico
```

### Testing

There is no automated test suite. Verification is done by compiling the documentation
and example documents and checking the PDF output. Key documents to test:

- `doc/latex/abntex2/abntex2.tex` (class documentation)
- `doc/latex/abntex2/abntex2cite.tex` (citation documentation)
- `doc/latex/abntex2/abntex2cite-alf.tex` (author-date citation docs)
- `doc/latex/abntex2/examples/abntex2-modelo-trabalho-academico.tex` (thesis template)
- `doc/latex/abntex2/examples/abntex2-modelo-artigo.tex` (article template)
- `doc/latex/abntex2/examples/abntex2-modelo-glossarios.tex` (glossary template)

## Code Style Guidelines

### File Headers

Every `.cls`, `.sty`, and `.bst` file must start with the LPPL license header:

```latex
%% filename.ext, v<VERSION> laurocesar
%% Copyright 2012-<COPYRIGHT_YEAR> by abnTeX2 group at https://www.abntex.net.br/
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% ...
```

### Version Placeholders

Source files use these placeholders, replaced by `build.sh` at release time:

- `<VERSION>` -- version number (e.g., `1.9.8`)
- `<CURRENT_DATE>` -- build date in `YYYY/MM/DD` format
- `<COPYRIGHT_YEAR>` -- current year

Never hardcode version numbers or dates in source files. Always use the placeholders.

### Section Delimiters

Major sections use double-line box comments; minor sections use `% ---`:

```latex
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Section Title
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Subsection or block description
% ---
```

### Naming Conventions

- **Public commands**: `\ABNTEXchapterfont`, `\imprimircapa`, `\apendices`
  - Use `ABNTEX` prefix for configurable commands
  - Use Portuguese names for user-facing commands (e.g., `\imprimircapa`, not `\printcover`)
- **Private commands**: `\abntex@ifnotempty`, `\abntex@bookmarkcounter`
  - Use `abntex@` prefix (requires `\makeatletter`/`\makeatother` blocks)
- **Private macros in helpers**: `\PRIVATE` prefix (e.g., `\PRIVATEbookmarkthis`)
- **Boolean variables**: `ABNTEXupperchapter`, `abntex@apendiceousecao`
  - Public booleans use `ABNTEX` prefix; private ones use `abntex@`
- **Internal abbreviation macros**: `\@NBR@A@<portuguese-word>` for abbreviations,
  `\@TR@<english-word>` for translations

### Package Requirements

Use `\RequirePackage` (not `\usepackage`) in class/style files:

```latex
\RequirePackage{ifthen}
\RequirePackage{hyperref}
\RequirePackage[brazil]{babel}
```

### Comments

- Write comments in Portuguese for user-facing documentation and UI strings
- Use English for technical comments aimed at developers
- Reference ABNT standards by number (e.g., `% NBR 14724/2011 - 5.1 Formato`)

### Formatting

- Indentation: 2 spaces for `.cls`/`.sty` files (no tabs)
- Use `%` at end of lines to suppress unwanted whitespace in TeX output
- Group related commands with `% ---` delimiters
- Use `\makeatletter`/`\makeatother` blocks when defining commands with `@`

### Error Handling

- Use `\PackageWarning{abntex2}{message}` for non-fatal warnings
- Use `\ifthenelse` from the `ifthen` package for conditionals
- Use `\@ifundefined` to check for existence of commands before using them
- Provide fallback defaults with `\providecommand` where appropriate

### ABNT Standards Compliance

All formatting decisions must reference specific ABNT standards:

- NBR 14724:2011 -- Academic works (margins, spacing, structure)
- NBR 6024:2012 -- Section numbering
- NBR 6027:2012 -- Table of contents
- NBR 10520:2002 -- Citations
- NBR 6023:2018 -- Bibliographic references
- NBR 6022:2018 -- Scientific articles
- NBR 10719:2015 -- Technical reports

### Contribution Guidelines

- Issues are for bugs and feature suggestions only (not usage support)
- Always provide a minimal reproducible example with bug reports
- Include: OS, LaTeX version, customizations, problem description, reproduction steps
- Primary language for code comments and documentation: Portuguese
- Community support: `latex-br` and `abntex2` Google Groups
