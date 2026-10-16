#!/bin/sh
# Erzeugt uebungsblatt.pdf (Angabe) und uebungsblatt-loesung.pdf (Lösung)
set -e
for i in 1 2 3; do pdflatex -interaction=nonstopmode uebungsblatt.tex >/dev/null; done
for i in 1 2 3; do pdflatex -interaction=nonstopmode -jobname=uebungsblatt-loesung "\def\mitloesung{}\input{uebungsblatt.tex}" >/dev/null; done
