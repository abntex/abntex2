#!/bin/bash

echo
echo -----------------------------------------------------
echo abnTeX2 BUILDER SCRIPT
echo https://www.abntex.net.br/
echo build compressed files and deploy them on Bintray.com
echo -----------------------------------------------------

VERSAO=""
ZIP_DOC=""
ZIP_TDS=""
ZIP_MODELO=""
ZIP_CTAN="target/abntex2.zip"
TAR_FILE=""

# compile LaTeX
# $1 main latex file without extension
function compileLaTeX(){
#        pdflatex -interaction=nonstopmode $1
#        bibtex $1
#        makeindex $1.idx
#        makeindex $1.nlo -s nomencl.ist -o $1.nls
#    	 makeglossaries $1
#        pdflatex -interaction=nonstopmode $1
#        pdflatex -interaction=nonstopmode $1
		latexmk -pdf -time -silent $1
}

# initialize directories
function initialize(){
       
        # initializing: create empty directories
        rm -rf target

        # creating directories for CTAN zip
        mkdir -p target/abntex2/{tex,doc}
       
        # copying all abntex2source files
        mkdir -p target/abntex2source/
        cp -rf Makefile doc tex bibtex target/abntex2source/
       
        # creating doc directory (only documentation, without examples)
        mkdir -p target/doc
}

# generate LaTeXFiles
function buildPdf(){

        echo "Building PDF files with pdflatex"

        echo "copying abnTeX2 files to doc files"
        cp -rf target/abntex2source/tex/latex/abntex2/* target/abntex2source/doc/latex/abntex2
        cp -rf target/abntex2source/bibtex/bib/abntex2/* target/abntex2source/doc/latex/abntex2
        cp -rf target/abntex2source/bibtex/bst/abntex2/* target/abntex2source/doc/latex/abntex2
        cp -rf target/abntex2source/tex/latex/abntex2/* target/abntex2source/doc/latex/abntex2/examples
        cp -rf target/abntex2source/bibtex/bib/abntex2/* target/abntex2source/doc/latex/abntex2/examples
        cp -rf target/abntex2source/bibtex/bst/abntex2/* target/abntex2source/doc/latex/abntex2/examples
        cp -rf .latexmkrc target/abntex2source/doc/latex/abntex2/examples

   
    echo "Compiling base documentation"
       
        cd target/abntex2source/doc/latex/abntex2/
   
    echo "Compiling abntex2"
        compileLaTeX abntex2
       
        echo "Compiling abntex2cite"
        compileLaTeX abntex2cite
       
        echo "Compiling abntex2cite-alf"
        compileLaTeX abntex2cite-alf
       
   
    echo "Compiling examples"
   
        cd examples/
               
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

        echo "Compiling abntex2-modelo-livro"
        compileLaTeX abntex2-modelo-livro

        echo "Compiling abntex2-modelo-slides"
        compileLaTeX abntex2-modelo-slides
       
       
        cd ../../../../../../
       
        echo "removing abnTeX2 files from doc files"
        rm -rf target/abntex2source/doc/latex/abntex2/*.cls
        rm -rf target/abntex2source/doc/latex/abntex2/*.sty
        rm -rf target/abntex2source/doc/latex/abntex2/*.bst
        rm -rf target/abntex2source/doc/latex/abntex2/abntex2-options.bib
        rm -rf target/abntex2source/doc/latex/abntex2/examples/*.cls
        rm -rf target/abntex2source/doc/latex/abntex2/examples/*.sty
        rm -rf target/abntex2source/doc/latex/abntex2/examples/*.bst
        rm -rf target/abntex2source/doc/latex/abntex2/examples/abntex2-options.bib
}

# change permissions of folders and files
function changePermissions(){
        find target/abntex2source/ -type d -exec chmod 755 {} \;
        
        find target/abntex2source/ -type f -exec chmod 644 {} \;
}

# generate compressed files
function buildCompressed(){

        echo "$ZIP_DOC (only doc files):"
        cp target/abntex2source/doc/latex/abntex2/* target/doc
        cd target/doc
        zip -j ../../$ZIP_DOC * -i *README \*.tex \*.pdf \*.bib
        cd ../..
       
        echo "$ZIP_TDS (tds directory structure):"
        cd target/abntex2source
        zip -r ../../$ZIP_TDS bibtex doc tex -i *README \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty \*.jpg
        cd ../..
       
        echo "$ZIP_CTAN (tex and doc browsable content + abntex2-tds.zip + README):"
        cp $ZIP_TDS target/abntex2.tds.zip
        cp -rf target/abntex2source/tex/latex/abntex2/* target/abntex2/tex
        cp -rf target/abntex2source/bibtex/bib/abntex2/* target/abntex2/tex
        cp -rf target/abntex2source/bibtex/bst/abntex2/* target/abntex2/tex
        cp -rf target/abntex2source/doc/latex/abntex2/* target/abntex2/doc
        mv target/abntex2/doc/README target/abntex2/README
        cd target
        zip -r ../$ZIP_CTAN abntex2 -i *README \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty \*.jpg
        zip ../$ZIP_CTAN abntex2.tds.zip
        cd ..
       
        echo "$ZIP_TDS - add Makefile to existing file:"
        cd target/abntex2source
        zip ../../$ZIP_TDS Makefile
        cd ../..

        echo "$ZIP_MODELO (only example files):"
        cd target/abntex2source/doc/latex/abntex2/examples
        zip ../../../../../../$ZIP_MODELO abntex2-modelo* -i \*.pdf \*.tex \*.bib \*.jpg
        cd ../../../../../..

        echo "$TAR_FILE (tds directory structure + MakeFile):"
        cd target/abntex2source
        find . -type f -name '*.tex' -o -name '*.pdf' -o -name '*.bib' -o -name '*.bst' -o -name '*.cls' -o -name '*.sty' -o -name '*.jpg' -o -name README -o -name Makefile | sed 's/^..//' | tar cfvz ../../$TAR_FILE --files-from -
        cd ../..
}

# clean temp files
function clean() {
        rm -rf target/abntex2
        rm -rf target/doc
        rm -rf target/abntex2source
        rm -rf target/abntex2.tds.zip
}

# replace tokens in the source files
function replaceTokens(){
		# replace version number in all files with <VERSION> string
        find target/abntex2source \( -name *.sty -or -name *.cls -or -name *.tex -or -name README -or -name *.bst \) | xargs sed -i -e "s/<VERSION>/$VERSAO/g"  
        
        # replace current date in all files with <CURRENT_DATE> string
        CURRENT_DATE=`date +'%Y\/%m\/%d'`
        find target/abntex2source \( -name *.sty -or -name *.cls -or -name *.tex -or -name README -or -name *.bst \) | xargs sed -i -e "s/<CURRENT_DATE>/$CURRENT_DATE/g"
        
        # replace copyright year in all files with <COPYRIGHT_YEAR> string
        CURRENT_YEAR=`date +'%Y'`
        find target/abntex2source \( -name *.sty -or -name *.cls -or -name *.tex -or -name README -or -name *.bst \) | xargs sed -i -e "s/<COPYRIGHT_YEAR>/$CURRENT_YEAR/g"
}

# build compressed files
function buildAll(){

        # setting versions numbers
        echo
        echo Building compressed files version: $VERSAO
        echo

        # setting names
        ZIP_DOC=target/abntex2-doc$VERSAO.zip
        ZIP_TDS=target/abntex2.tds$VERSAO.zip
        ZIP_MODELO=target/abntex2-modelos$VERSAO.zip
        TAR_FILE=target/abntex2.tds$VERSAO.tar.gz

        # initializing files
        initialize
       
        # update version number in files
        replaceTokens
       
        # compile latex
        buildPdf
        
        # change permissions of folders and files in the target directory
        changePermissions
       
        # building compressed files
        buildCompressed
       
        # clean temp files
        clean
}

# deploy in bintray.com
# $1 = Google Code user (mandatory arg)
# $2 = Google Code password (mandatory arg)
function deploy(){

        echo
        echo Deploying on bintray.com
        echo

        ZIP_DOC_BASENAME=`basename $ZIP_DOC`
        ZIP_TDS_BASENAME=`basename $ZIP_TDS`
        ZIP_MODELO_BASENAME=`basename $ZIP_MODELO`
        TAR_FILE_BASENAME=`basename $TAR_FILE`

        echo
        echo Deploying $TAR_FILE
		curl -T $TAR_FILE -u$1:$2 https://api.bintray.com/content/laurocesar/generic/abntex2-releases/${VERSAO:1}/$TAR_FILE_BASENAME

        echo
        echo Deploying $ZIP_TDS
		curl -T $ZIP_TDS -u$1:$2 https://api.bintray.com/content/laurocesar/generic/abntex2-releases/${VERSAO:1}/$ZIP_TDS_BASENAME

        echo
        echo Deploying $ZIP_DOC
		curl -T $ZIP_DOC -u$1:$2 https://api.bintray.com/content/laurocesar/generic/abntex2-releases/${VERSAO:1}/$ZIP_DOC_BASENAME

        echo
        echo Deploying $ZIP_MODELO
		curl -T $ZIP_MODELO -u$1:$2 https://api.bintray.com/content/laurocesar/generic/abntex2-releases/${VERSAO:1}/$ZIP_MODELO_BASENAME

		echo
		echo Publishing all files
		curl -u$1:$2 --request POST https://api.bintray.com/content/laurocesar/generic/abntex2-releases/${VERSAO:1}/publish
		echo

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
        echo $TAR_FILE
        echo
        echo Remember: You should follow the steps in:
        echo https://github.com/abntex/abntex2/wiki/DisponibilizarNovoRelease
        echo
        echo If you need help, contact us: http://groups.google.com/group/abntex2
        echo --------------------------------------------------
}

# usage information
function printUsage(){
        echo
        echo "Usage: ./build.sh ([version] [(user password)]) | [--help]"
        echo
        echo "  version  : Build compressed file with version number"
        echo "  user     : (deploy) User name on Bintray"
        echo "  password : (deploy) API Key on Bintray (https://bintray.com/profile/edit)"
        echo "  --help   : Show this help message"
        echo
        echo "IMPORTANT: Don't put your user and password, unless you really want to "
        echo " release and deploy a new version."
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