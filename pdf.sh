#!/bin/bash

prefixe=${1%.*}

./preprocesseur "$1" && pandoc "$1".md -o "$prefixe".pdf -N -V documentclass=scrreprt -V papersize=letter -H preambule.txt --pdf-engine=xelatex --listings --citeproc
