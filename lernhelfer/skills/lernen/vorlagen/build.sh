#!/bin/sh
# Erzeugt aus einer Datei zwei PDFs: {name}.pdf (Aufgabenblatt, Lösungen
# ausgeblendet, ohne Platz zu belegen) und {name}-loesung.pdf (Lösungsvorschlag,
# Klassenoption "loesung"). Aufruf: sh build.sh [name], ohne Name: uebungsblatt.
# Je zwei Durchläufe, weil Deckblatt, Verweise und "Seite x / y" die .aux-Datei brauchen.
set -e
name=${1:-uebungsblatt}
for i in 1 2; do
  pdflatex -interaction=nonstopmode "$name.tex" >/dev/null
done
for i in 1 2; do
  pdflatex -interaction=nonstopmode -jobname="$name-loesung" \
    "\PassOptionsToClass{loesung}{uebungsblatt}\input{$name}" >/dev/null
done
