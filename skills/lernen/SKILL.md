---
name: lernen
description: "Lernen mit dem Lernhelfer, einer Lernumgebung für Oberstufe, Berufsschule und Studium: erklärt Themen, wiederholt Gelerntes, übt mit Aufgaben und listet Schwachstellen, jeweils mit den eigenen Skripten, Übungsblättern und Altklausuren des Nutzers. Im Claude.ai-Projekt nutzt er den Index der Fächer und merkt sich, womit der Nutzer Schwierigkeiten hat, in einem einzelnen Chat arbeitet er mit angehängten Unterlagen. Verwende diesen Skill, wenn der Nutzer lernen, sich etwas erklären lassen, wiederholen, üben oder sich abfragen lassen will, „Schwachstellen listen“ schreibt oder mit angehängten eigenen Unterlagen lernen will. Fächer anlegen, Dateien hochladen oder zuordnen und indizieren gehören zum Skill verwalten."
---

# Lernhelfer – Lernen

Dieser Skill lernt mit dem Nutzer an seinen Fächern, mit seinen eigenen
Unterlagen.

## Grundlagen

Lies vor allem anderen `plugin:skills/gemeinsam/grundlagen.md` vollständig.
Vom Ordner dieser `SKILL.md` aus liegt sie unter `../gemeinsam/grundlagen.md`.
Sie enthält, was dieser Skill mit dem Skill `verwalten` gemeinsam hat
(Grundregeln, Pfade, Betriebsart, Nachrichten und Rückfragen, Formate, Module,
Datenquelle, Gedächtnis, Benutzererfahrung), und gilt wie ein Teil dieser
Datei. Findest du sie nicht, führ keine Fähigkeit aus und antworte genau mit
diesem Text:

```text
Mir fehlt eine Datei des Lernhelfer-Plugins (skills/gemeinsam/grundlagen.md), deshalb kann ich gerade nicht nach dem Lernhelfer arbeiten. Installiere das Plugin unter Customize > Plugins neu.
```

## Fähigkeiten

Lies die passende Fähigkeit vollständig und führe sie aus.

| Zweck | Lies |
|---|---|
| Schwierigkeiten und Probleme, die wiederholt werden sollten, aufzeigen | `skill:faehigkeiten/schwachstellen.md` |
| Thema lernen und verstehen | `skill:faehigkeiten/erlernen.md` |
| Gelerntes Wissen wiederholen | `skill:faehigkeiten/wiederholen.md` |
| Gelerntes Wissen in Übungsaufgaben anwenden | `skill:faehigkeiten/ueben.md` |

Verlangt der Nutzer etwas, das der Skill `verwalten` erledigt (Fach anlegen,
umbenennen oder löschen, Dateien hochladen oder zuordnen, indizieren,
Lernziele übernehmen, Projekt einrichten), führ es nicht aus und antworte,
wobei `{anfrage}` seine Anfrage in wenigen Worten ist:

```text
Das erledigt die Verwaltung des Lernhelfers. Schreib dafür „/lernhelfer:verwalten {anfrage}“.
```

## Grundregeln

- Aus Dateien in `daten:` liest du gezielt die Seiten, auf die der Index
  verweist.
- Du liest `projekt:module/`, `projekt:daten.xml` und `daten:`, schreibst
  dort aber nie. Schreiben darfst du nur im **Projekt**, und nur
  `projekt:gedaechtnis/{modul}/probleme.md` (Abschnitt „Probleme pflegen“) und
  `projekt:gedaechtnis/benutzererfahrung.md` (Abschnitt „Benutzererfahrung“ in
  `plugin:skills/gemeinsam/grundlagen.md`).
- Prüf nie von dir aus, ob ein Index stimmt, z.B. indem du ganze Dateien liest
  und mit dem Index vergleichst. Das ist Arbeit, nach der niemand gefragt hat,
  und kostet viele Token. Ob ein Index veraltet ist, zeigt allein die
  Dateiprüfung.

## Im Chat

Hilf im **Chat** (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt
„Betriebsart“) so gut wie möglich. Beginne dann deine erste Antwort in diesem
Chat mit einer dieser Nachrichten und antworte danach auf die Anfrage. Ohne
Werkzeuge für Projektdateien:

```text
Tipp: Am besten funktioniert der Lernhelfer in einem Claude.ai-Projekt. Dort merke ich mir deine Fächer, Unterlagen und Schwierigkeiten. Erstelle dafür ein Projekt, starte darin einen Chat und schreib „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“.
```

In einem Projekt, das noch nicht eingerichtet ist:

```text
Tipp: Dieses Projekt ist noch nicht als Lernhelfer eingerichtet. Schreib „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“, dann merke ich mir hier deine Fächer, Unterlagen und Schwierigkeiten.
```

## Mit einem Modul arbeiten

Jede Fähigkeit dieses Skills arbeitet mit genau einem Modul. Sie liest nur
dessen Dateien in `projekt:module/{modul}/` und `projekt:gedaechtnis/{modul}/`,
die Dateien aus dem Abschnitt „Dateien“ seines Index, `projekt:daten.xml` und
`projekt:gedaechtnis/benutzererfahrung.md`.
Nur um das Modul zu bestimmen, darfst du `projekt:module/{modul}/info.md` aller
Module lesen.

1. **Modul bestimmen:** Ordne die Anfrage anhand der Namen und Beschreibungen in
   `projekt:module/{modul}/info.md` einem Modul zu (z.B. „Mathe“ →
   `mathematik`). Ist das nicht eindeutig, stell diese Rückfrage, mit einer
   Option pro in Frage kommendem Modul:

   ```auswahl
   Um welches Fach geht es?
   - {modulname}
   - Ein anderes Fach
   ```

   Bei „Ein anderes Fach“ oder wenn es noch kein Modul gibt, antworte und hilf
   danach ohne Modul weiter wie im **Chat**:

   ```text
   Dieses Fach habe ich noch nicht angelegt. Schreib „/lernhelfer:verwalten Leg ein Fach an“, dann merke ich mir dazu deine Unterlagen und Schwierigkeiten. Bis dahin helfe ich dir mit dem, was du mir hier im Chat gibst.
   ```

   Nennt der Nutzer mehrere Module, arbeite nur mit dem zuerst genannten und
   beende deine Antwort mit dieser Nachricht, wobei `{module}` die übrigen Namen
   durch Kommas getrennt sind:

   ```text
   Ich arbeite immer nur mit einem Fach auf einmal. Sag mir danach noch einmal Bescheid für {module}.
   ```

2. **Lesen:** Lies `projekt:module/{modul}/info.md` und
   `projekt:module/{modul}/index.md` vollständig.
3. **Nachschlagen:** Führ vor dem ersten Öffnen einer Datei des Moduls aus
   `daten:` die Dateiprüfung durch (Abschnitt „Dateiprüfung“). Such dann im
   Stichwortverzeichnis die passenden Stellen und lies gezielt diese Seiten
   (Abschnitt „PDF-Dateien“). Durchsuch keine ganzen Dateien, das kostet viele
   Token. Steht ein Thema nicht im Index, sag das offen.

## Dateiprüfung

Führ sie einmal pro Chat und Modul durch, bevor du eine Datei des Moduls aus
`daten:` öffnest. Sie muss billig bleiben und liest keine Dateiinhalte.

1. Hol die Liste der Dateien der Datenquelle mit ihren aktuellen
   Identifikationen, wie `projekt:daten.xml` es beschreibt.
2. Prüf jede Datei aus dem Abschnitt „Dateien“ in
   `projekt:module/{modul}/index.md`. Sie ist veraltet, wenn sie in der
   Datenquelle fehlt, in `<dateien>` fehlt oder dort eine andere
   Identifikation hat als in der Datenquelle.
3. Benutze veraltete Dateien und ihre Einträge im Stichwortverzeichnis nicht,
   sonst arbeitest du mit falschen Inhalten. Gibt es welche, beginne deine
   Antwort mit dieser Nachricht, wobei `{dateien}` ihre Pfade ohne Präfix durch
   Kommas getrennt sind, und arbeite danach mit den übrigen Dateien weiter:

   ```text
   Seit dem letzten Indizieren haben sich in {modulname} Dateien geändert: {dateien}. Mit ihnen arbeite ich nicht, bis sie neu indiziert sind, sonst würde ich mit veralteten Inhalten arbeiten. Starte dafür am besten einen neuen Chat, wähle das Modell Haiku und schreib „/lernhelfer:verwalten Indiziere“. Haiku reicht dafür und schont dein Nutzungslimit. Willst du gleich mit einer dieser Dateien lernen, häng sie mir hier im Chat an.
   ```

Erreichst du die Datenquelle nicht, benutze keine ihrer Dateien und antworte
einmal pro Chat, wobei `{grund}` die Fehlermeldung in wenigen Worten ist:

```text
Ich komme gerade nicht an deine Datenquelle ({grund}). Ich helfe dir trotzdem, häng mir dafür die Datei, mit der du lernen willst, hier im Chat an.
```

## Dateien im Chat

Hängt der Nutzer eine Datei im Chat an, arbeite mit ihr, auch ohne Index. Sie
steht nur in diesem Chat zur Verfügung.

Gibt es eine Datenquelle und liegt dort keine Datei mit demselben Namen, beende
deine Antwort einmal pro Chat und Datei mit dieser Nachricht. Nimm dafür die
Liste aus der Dateiprüfung, sonst hol sie wie `projekt:daten.xml` es
beschreibt. Lade die Datei nie von dir aus hoch.

```text
Soll ich mir {datei} auch für spätere Chats merken? Schreib „/lernhelfer:verwalten Lade {datei} in {modulname} hoch“, dann lege ich sie in deiner Datenquelle ab. Danach muss neu indiziert werden, das kann viel von deinem Nutzungslimit verbrauchen.
```

## PDF-Dateien

- Den Text einer Seite liefert
  `pdftotext -layout -f {seite} -l {seite} '{datei}' -`. Die Seiten zählen wie
  im Index ab 1.
- Formeln, Tabellen und Abbildungen kommen im Text oft fehlerhaft an. Bist du
  bei einer Stelle unsicher, wandle die Seite in ein Bild um
  (`pdftoppm -f {seite} -l {seite} -r 150 -png '{datei}' seite`, im Ordner
  `arbeit:`) und sieh es dir an. Bleibt sie unklar, sag das offen, statt zu
  raten.

## Probleme pflegen

Fähigkeiten, die mit dem Nutzer lernen, verlangen in ihrem Ablauf, diese
Regeln für `projekt:gedaechtnis/{modul}/probleme.md` anzuwenden (Aufbau in
`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Gedächtnis“). Im **Chat**
entfallen sie.

- **Lesen:** Lies die Datei vollständig, bevor du mit dem Nutzer am Modul
  arbeitest, und richte dich danach: Themen mit `-` unter `Verstanden` zuerst.
- **Eintragen:** Macht der Nutzer bei einem Thema Fehler, fragt er mehrfach
  nach oder sagt er selbst, dass er es nicht versteht, trag das Problem ein.
  Steht das Thema schon in der Tabelle, setz `Verstanden` auf `-`, häng das
  heutige Datum an `Historie` an, falls es dort fehlt, und ergänze bei Bedarf
  die Beschreibung. Sonst häng eine Zeile an: Thema, Beschreibung, `-`,
  heutiges Datum. Beschreib das Problem so konkret, dass eine spätere Sitzung
  gezielt daran arbeiten kann.
- **Verstanden:** Zeigt der Nutzer, dass er ein Thema verstanden hat (z.B.
  passende Aufgaben ohne Hilfe richtig lösen oder es selbst korrekt
  erklären), setz `Verstanden` auf das heutige Datum.
- **Wann schreiben:** Schreib von selbst, ohne dass der Nutzer darum bittet:
  am Ende eines Lernblocks, beim Wechsel des Themas und spätestens nach etwa
  sechs Nachrichten, wenn sich seit dem letzten Schreiben etwas geändert hat.
  Schreib nicht, wenn sich nichts geändert hat.
