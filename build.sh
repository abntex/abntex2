#!/bin/bash

echo --------------------------------------------------
echo abnteX2 builder script: build zip files for deploy
echo --------------------------------------------------

# initializing: create clean and create directories
rm -rf target
mkdir -p target/abntex2/{tex,doc}

# creating abntex2-doc.zip (only doc files)
zip -j target/abntex2-doc.zip tds/doc/latex/abntex2/* -i \*.tex \*.pdf \*.bib

# creating abntex2-tds.zip (tds directory structure + README)
cd tds
zip -r ../target/abntex2.tds.zip README bibtex doc tex -i \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty README
cd ..

# creating abntex2.zip (tex and doc browsable content + abntex2-tds.zip + README)
cp tds/doc/latex/abntex2/*.tex target/abntex2/doc/
cp tds/doc/latex/abntex2/*.pdf target/abntex2/doc/
cp tds/doc/latex/abntex2/*.bib target/abntex2/doc/
cp tds/tex/latex/abntex2/* target/abntex2/tex/
cp tds/bibtex/bib/abntex2/* target/abntex2/tex/
cp tds/bibtex/bst/abntex2/* target/abntex2/tex/
cp tds/README target/abntex2
cp target/abntex2.tds.zip target/abntex2
cd target
zip -r abntex2.zip abntex2 -x \.DS_Store \*.gz
rm -rf abntex2
cd ..

# creating abntex2-modelo.zip (only example files)
cd tds/doc/latex/abntex2
zip ../../../../target/abntex2-modelo.zip abntex2-modelo* -i \*.pdf \*.tex \*.bib
cd ../../../../

echo --------------------------------------------------
echo Done! target folder created
echo --------------------------------------------------