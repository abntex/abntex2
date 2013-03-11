#!/bin/bash

echo
echo --------------------------------------------------
echo abnTeX2 BUILDER SCRIPT
echo http://abntex2.googlecode.com/
echo build zip files and deploy them on Google Code   
echo --------------------------------------------------

VERSAO=""
ZIP_DOC=""
ZIP_TDS=""
ZIP_MODELO=""
ZIP_CTAN=target/abntex2.zip

# compile LaTeX
# $1 main latex file without extension
function compileLaTeX(){
	pdflatex -interaction=nonstopmode $1
	bibtex $1
	makeindex $1.idx 
	makeindex $1.nlo -s nomencl.ist -o $1.nls
    makeglossaries $1
	pdflatex -interaction=nonstopmode $1
	pdflatex -interaction=nonstopmode $1
}

# initialize directories
function initialize(){
	
	# initializing: create clean directories
	rm -rf target

	# creating directories for CTAN zip
	mkdir -p target/abntex2/{tex,doc}
	
	# copying all abntex2source files
	mkdir -p target/abntex2source/
	cp -rf doc tex bibtex target/abntex2source/
	
	# creating doc directory 
	mkdir -p target/doc
}

# generate LaTeXFiles
function buildPdf(){

	echo "Building PDF files with pdflatex"

	echo "copying abnTeX2 files to doc files"
	cp -rf target/abntex2source/tex/latex/abntex2/* target/abntex2source/doc/latex/abntex2
	cp -rf target/abntex2source/bibtex/bib/abntex2/* target/abntex2source/doc/latex/abntex2
	cp -rf target/abntex2source/bibtex/bst/abntex2/* target/abntex2source/doc/latex/abntex2

	cd target/abntex2source/doc/latex/abntex2/	
	echo "Compiling abntex2-modelo-relatorio-tecnico"
	compileLaTeX abntex2-modelo-relatorio-tecnico
	
	echo "Compiling abntex2-modelo-trabalho-academico"
	compileLaTeX abntex2-modelo-trabalho-academico
	
	echo "Compiling abntex2-modelo-glossarios"
	compileLaTeX abntex2-modelo-glossarios
	
	echo "Compiling abntex2-modelo-modelo-artigo"
	compileLaTeX abntex2-modelo-artigo
	
	echo "Compiling abntex2-modelo-projeto-pesquisa"
	compileLaTeX abntex2-modelo-projeto-pesquisa
	
	echo "Compiling abntex2"
	compileLaTeX abntex2
	
	echo "Compiling abntex2cite"
	compileLaTeX abntex2cite
	
	echo "Compiling abntex2cite-alf"
	compileLaTeX abntex2cite-alf
	
	cd ../../../../../
	
	echo "removing abnTeX2 files to doc files" 
	rm -rf target/abntex2source/doc/latex/abntex2/*.cls
	rm -rf target/abntex2source/doc/latex/abntex2/*.sty
	rm -rf target/abntex2source/doc/latex/abntex2/*.bst
	rm -rf target/abntex2source/doc/latex/abntex2/abntex2-options.bib
}

# generete zip files
function buildZip(){

	echo "$ZIP_DOC (only doc files):"
	cp target/abntex2source/doc/latex/abntex2/* target/doc
	rm target/doc/abntex2-modelo*
	cd target/doc
	zip -j ../../$ZIP_DOC * -i *README \*.tex \*.pdf \*.bib
	cd ../..
	
	echo "$ZIP_TDS (tds directory structure):"
	cd target/abntex2source
	zip -r ../../$ZIP_TDS bibtex doc tex -i *README \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty
	cd ../..
	
	echo "$ZIP_CTAN (tex and doc browsable content + abntex2-tds.zip + README):"
	cp $ZIP_TDS target/abntex2/abntex2.tds.zip
	cp -rf target/abntex2source/tex/latex/abntex2/* target/abntex2/tex
	cp -rf target/abntex2source/bibtex/bib/abntex2/* target/abntex2/tex
	cp -rf target/abntex2source/bibtex/bst/abntex2/* target/abntex2/tex
	cp -rf target/abntex2source/doc/latex/abntex2/* target/abntex2/doc
	mv target/abntex2/doc/README target/abntex2/README
	cd target 
	zip -r ../$ZIP_CTAN abntex2 -i *README \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty \*.zip
	cd ..
	
	echo "$ZIP_MODELO (only example files):"
	cd target/abntex2source/doc/latex/abntex2
	zip ../../../../../$ZIP_MODELO abntex2-modelo* -i \*.pdf \*.tex \*.bib
	cd ../../../../..
}

# clean temp files
function clean() {
	rm -rf target/abntex2
	rm -rf target/doc
	rm -rf target/abntex2source
}

# replace version number in all files with <VERSION> string
function replaceVersion(){
	find target/abntex2source \( -name *.sty -or -name *.cls -or -name *.tex -or -name README \) | xargs sed -i -e "s/<VERSION>/$VERSAO/g"   
}

# build ZIP files
function buildAll(){

	# setting versions numbers
	echo 
	echo Building zip files version: $VERSAO
	echo

	# setting names
	ZIP_DOC=target/abntex2-doc$VERSAO.zip
	ZIP_TDS=target/abntex2.tds$VERSAO.zip
	ZIP_MODELO=target/abntex2-modelos$VERSAO.zip

	# initializing files
	initialize
	
	# update version number in files
	replaceVersion
	
	# compile latex
	buildPdf
	
	# building zip files
	buildZip
	
	# clean temp files
	clean
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
	./googlecode_upload.py -s \'"$PREFIX Arquivos de instalação"\' -p abntex2 -u $1 -w $2 -l $LABELS $ZIP_TDS

	echo 
	echo Deploying $ZIP_DOC
	./googlecode_upload.py -s \'"$PREFIX Manuais de uso"\' -p abntex2 -u $1 -w $2 -l $LABELS $ZIP_DOC

	echo
	echo Deploying $ZIP_MODELO
	./googlecode_upload.py -s \'"$PREFIX Modelos de documentos"\' -p abntex2 -u $1 -w $2 -l $LABELS $ZIP_MODELO
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
	echo Remember: 
	echo "1) you have to upload $ZIP_CTAN to CTAN: http://www.ctan.org/upload"
	echo "2) you have to update Wikipedia: http://pt.wikipedia.org/wiki/AbnTeX"
	echo
	echo If you need change any information on CTAN, contact:
	echo rainer@dante.de - Rainer Schöpf,
	echo robin.fairbairns@cl.cam.ac.uk - Robin Fairbairns,
	echo gene@gerd-neugebauer.de - Gerd Neugebauer and 
	echo ctan@dante.de.
	echo
	echo If you need help, contact us: http://groups.google.com/group/abntex2
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
	echo "IMPORTANT: Don't put your user and password, unless you really want to "
	echo " release a new version to CTAN."
	echo
}


# MAIN

if test -z "$1"
then
	printUsage
	buildAll
	printEndingInformation
else
	if [ $1 == "--help" ] ; then
		printUsage
	else
		VERSAO="-$1"
		buildAll

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
