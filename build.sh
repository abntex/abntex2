#!/bin/bash

echo
echo --------------------------------------------------
echo abnTeX2 BUILDER SCRIPT
echo http://code.google.com/p/abntex2/
echo build zip files and deploy them on Google Code   
echo --------------------------------------------------

VERSAO=""
ZIP_DOC=""
ZIP_TDS=""
ZIP_MODELO=""
ZIP_CTAN=target/abntex2.zip

# build ZIP files
function build(){

	# setting versions numbers
	echo 
	echo Building zip files version: $VERSAO
	echo

	# setting names
	ZIP_DOC=target/abntex2-doc$VERSAO.zip
	ZIP_TDS=target/abntex2.tds$VERSAO.zip
	ZIP_MODELO=target/abntex2-modelo$VERSAO.zip


	# initializing: create clean directories
	rm -rf target
	mkdir -p target/abntex2/{tex,doc}
	
	echo "$ZIP_DOC (only doc files):"
	zip -j $ZIP_DOC tds/doc/latex/abntex2/* -i *README \*.tex \*.pdf \*.bib 
	
	echo "$ZIP_TDS (tds directory structure):"
	cd tds
	zip -r ../$ZIP_TDS bibtex doc tex -i *README \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty 
	cd ..
	
	echo "$ZIP_CTAN (tex and doc browsable content + abntex2-tds.zip + README):"
	cp tds/doc/latex/abntex2/*.tex target/abntex2/doc/
	cp tds/doc/latex/abntex2/*.pdf target/abntex2/doc/
	cp tds/doc/latex/abntex2/*.bib target/abntex2/doc/
	cp tds/tex/latex/abntex2/* target/abntex2/tex/
	cp tds/bibtex/bib/abntex2/* target/abntex2/tex/
	cp tds/bibtex/bst/abntex2/* target/abntex2/tex/
	cp tds/doc/latex/abntex2/README target/abntex2/
	cp $ZIP_TDS target/abntex2
	cd target
	zip -r ../$ZIP_CTAN abntex2 -x \.DS_Store \*.gz
	rm -rf abntex2
	cd ..
	
	echo "$ZIP_MODELO (only example files):"
	cd tds/doc/latex/abntex2
	zip ../../../../$ZIP_MODELO abntex2-modelo* -i \*.pdf \*.tex \*.bib
	cd ../../../../
	
}

# deploy with googlecode_upload.py script
# $1 = Google Code user (mandatory arg)
# $2 = Google Code password (mandatory arg)
function deploy(){

	echo
	echo Deploying on GoogleCode…
	echo

	LABELS='Featured,Type-Package,OpSys-All'
	PREFIX="abnTeX2 $VERSAO -"


	echo
	echo Deploying $ZIP_TDS
	./googlecode_upload.py -s \'"$PREFIX Arquivos de instalação do abnTeX2"\' -p abntex2 -u $1 -w $2 -l $LABELS $ZIP_TDS

	echo 
	echo Deploying $ZIP_DOC
	./googlecode_upload.py -s \'"$PREFIX Manuais de uso"\' -p abntex2 -u $1 -w $2 -l $LABELS $ZIP_DOC

	echo
	echo Deploying $ZIP_MODELO
	./googlecode_upload.py -s \'"$PREFIX Modelo de trabalho acadêmico com abnTeX2"\' -p abntex2 -u $1 -w $2 -l $LABELS $ZIP_MODELO
}

# ending information after build
function printEndingInformation(){
	echo --------------------------------------------------
	echo Done! The following files were generated:
	echo
	echo $ZIP_DOC
	echo $ZIP_TDS
	echo $ZIP_MODELO
	echo $ZIP_CTAN
	echo 
	echo Remember: you need upload $ZIP_CTAN on CTAN
	echo at http://www.ctan.org/upload
	echo
	echo If you need change any information on CTAN, contact:
	echo rainer@dante.de - Rainer Schöpf,
	echo robin.fairbairns@cl.cam.ac.uk - Robin Fairbairns,
	echo gene@gerd-neugebauer.de - Gerd Neugebauer and 
	echo ctan@dante.de.
	echo --------------------------------------------------
}

# usage information
function printUsage(){
	echo
	echo "Usage: ./build.sh ([version] [(user password)]) | [--help]"
	echo 
	echo "  version : Build zip file with version number"
	echo "  user : User name on Google Code for project abntex2"
	echo "  password : Password on Google Code for project abntex2"
	echo "  --help : Show this help message"
	echo 
}


# MAIN

if test -z "$1"
then
	printUsage
	build
	printEndingInformation
else
	if [ $1 == "--help" ] ; then
		printUsage
	else
		VERSAO="-$1"
		build 

		if test -z "$2"
		then
			echo
			echo There is no deployment to be done...
			echo
		else
			deploy $2 $3
		fi
		
		printEndingInformation
	fi
fi




# ending...
