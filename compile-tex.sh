#!/bin/sh

LOG="$(echo "$1" | sed 's/\.tex/.log/g')"
BIB="$(echo "$1" | sed 's/\.tex//g')"
PDF="$(echo "$1" | sed 's/\.tex/.pdf/g')"
TEXS="$(echo "$*" | tr ' ' '\n' | grep \\.tex$)"

test -f $BIB.bbl && test $BIB.bbl -nt $BIB.bib || bibtex $BIB

pdflatex $TEXS &&
if grep -e "Citation.*undefined" < $LOG > /dev/null
then
	bibtex $BIB &&
	echo Bibtex finished &&
	pdflatex $TEXS
fi &&
while grep -e "Rerun to get " < $LOG > /dev/null
do
	pdflatex $TEXS
done ||
echo "Something went wrong!"
