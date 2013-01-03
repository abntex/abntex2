#!/bin/bash

rm -rf target
mkdir -p target/abntex2/{tex,doc}

zip -j target/abntex2-doc.zip doc/latex/abntex2/* -x \*.DS_Store \*.gz
zip -r target/abntex2.tds.zip bibtex doc tex README -x \*.DS_Store

cp doc/latex/abntex2/* target/abntex2/doc/
cp tex/latex/abntex2/* target/abntex2/tex/
cp bibtex/bib/abntex2/* target/abntex2/tex/
cp bibtex/bst/abntex2/* target/abntex2/tex/
cp README target/abntex2
cp target/abntex2.tds.zip target/abntex2
cd target
zip -r abntex2.zip abntex2 -x \.DS_Store \*.gz
rm -rf abntex2