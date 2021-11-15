#!/bin/bash

## Get project name
DEFAULTNAME="notes"
projectname=${1:-$DEFAULTNAME}

## It should create a project directory called $1
mkdir "./$projectname"
cd "./$projectname"

## It should create a file inside of it called $1.md
touch ./$projectname.md

## It should create a folder called images
mkdir ./images

## It should create a binary that woud:
#### run typora2tex in default settings to compile everything
#### then additionally run pdflatex to get the pdf
touch compile.sh

{ echo "#!/bin/bash" | tee -a ./compile.sh
echo " " | tee -a ./compile.sh
echo "typora2tex $projectname.md" | tee -a ./compile.sh
echo "pdflatex $projectname.tex > /dev/null 2>&1" | tee -a ./compile.sh
} > /dev/null 2>&1

chmod +x ./compile.sh


