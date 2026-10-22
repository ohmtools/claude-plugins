#!/bin/sh
# Erzeugt aus einer Datei zwei PDFs: {name}.pdf (Aufgabenblatt, Lösungen
# ausgeblendet, ohne Platz zu belegen) und {name}-loesung.pdf (Lösungsvorschlag,
# Klassenoption "loesung"). Aufruf: sh build.sh [name], ohne Name: uebungsblatt.
# Je zwei Durchläufe, weil Deckblatt, Verweise und "Seite x / y" die .aux-Datei brauchen.
# Datum und Uhrzeit fürs Deckblatt einmal in deutscher Zeit (ohne tzdata), für beide gleich.
set -e
name=${1:-uebungsblatt}
tz='CET-1CEST,M3.5.0,M10.5.0/3'
zeit="\def\ubdatum{$(TZ=$tz date +%d.%m.%Y)}\def\ubuhrzeit{$(TZ=$tz date +%H:%M)}"
for i in 1 2; do
  pdflatex -interaction=nonstopmode -jobname="$name" "$zeit\input{$name}" >/dev/null
done
for i in 1 2; do
  pdflatex -interaction=nonstopmode -jobname="$name-loesung" \
    "$zeit\PassOptionsToClass{loesung}{uebungsblatt}\input{$name}" >/dev/null
done
