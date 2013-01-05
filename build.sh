#!/bin/bash

echo
echo --------------------------------------------------
echo            abnTeX2 BUILDER SCRIPT
echo --------------------------------------------------
echo                build zip files
echo           deploy them on Google Code   
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
	echo Building zip files version: $VERSION
	echo

	# setting names
	ZIP_DOC=target/abntex2-doc$VERSAO.zip
	ZIP_TDS=target/abntex2.tds$VERSAO.zip
	ZIP_MODELO=target/abntex2-modelo$VERSAO.zip


	# initializing: create clean directories
	rm -rf target
	mkdir -p target/abntex2/{tex,doc}
	
	# creating abntex2-doc.zip (only doc files)
	zip -j $ZIP_DOC tds/doc/latex/abntex2/* -i \*.tex \*.pdf \*.bib
	
	# creating abntex2-tds.zip (tds directory structure + README)
	cd tds
	zip -r ../$ZIP_TDS README bibtex doc tex -i \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty README
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
	zip -r ../$ZIP_CTAN abntex2 -x \.DS_Store \*.gz
	rm -rf abntex2
	cd ..
	
	# creating abntex2-modelo.zip (only example files)
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

# usage information
function printUsage(){
	echo 
	echo Usage:
	echo 
	echo  ./build.sh                   : Build zip file with no version number
	echo  ./build.sh version           : Build zip file with version number
	echo  ./build.sh --help            : Show this help message
	echo  ./build.sh version user password  : Build and deploy on Google Code
	echo
}


# MAIN

if test -z "$1"
then
	printUsage
	build
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
	fi
fi


# ending...
echo --------------------------------------------------
echo Done! 
echo --------------------------------------------------