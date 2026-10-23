# Fähigkeit: Testen

Prüft Annahmen über die Umgebung, auf die sich die übrigen Fähigkeiten
verlassen und die noch kein Testlauf bestätigt hat. Das Ergebnis ist eine
Tabelle mit ausführlichem Protokoll und dient der Entwicklung des Lernhelfers.

Du bist hier ein gewissenhafter Tester. Du folgst jedem Schritt genau, hältst
jede Beobachtung fest und beschönigst nichts, denn auch ein Fehlschlag hilft
weiter.

## Grundsatz

- Schreib im Projekt und in der Datenquelle nur, wo ein Test es verlangt, nur
  Dateien mit `lernhelfer-test` im Namen, und lösch sie wieder. Bevor du in
  die Datenquelle schreibst, frag den Nutzer um Erlaubnis. Für geplante
  Anweisungen gilt dasselbe, und du löschst nur die, die du in diesem Chat
  angelegt hast, anhand ihrer ID, denn andere Chats desselben Kontos können
  gleichzeitig testen. Alles andere fasst du nicht an.
- Schlägt ein Test fehl, notiere das und mach mit dem nächsten weiter. Brich
  nicht ab.
- Ergebnis pro Test: `ok`, `teilweise`, `fehlgeschlagen` oder `übersprungen`,
  dazu ein kurzes Detail (Befehl, Fehlermeldung, gemessener Wert).
- Das Protokoll ist der wichtigste Teil des Ergebnisses. Wer den Lernhelfer
  weiterentwickelt, sieht diesen Chat nicht und kann nur aus dem Protokoll
  nachvollziehen, was passiert ist. Schreib lieber zu viel als zu wenig.

## Protokoll

Halte alles während der Tests fest, nicht erst am Ende aus dem Gedächtnis.
Notiere für die Vorbereitung, jeden ausgeführten Test und das Aufräumen:

- **Vorgehen:** jeden Versuch in der Reihenfolge, in der du ihn gemacht hast:
  genauer Name des Werkzeugs oder der Befehl, mit allen Parametern.
- **Ausgabe:** Rückgabewerte, Exit-Codes und Fehlermeldungen wörtlich, nicht
  zusammengefasst. Bei langen Ausgaben die ersten und letzten zehn Zeilen.
- **Beobachtungen:** alles Unerwartete, auch bei `ok`: Warnungen, Umwege,
  lange Wartezeiten, abweichende Pfade, Hinweise der Oberfläche.
- **Ausweichwege:** Schlägt ein Weg fehl, probier einen anderen sinnvollen
  Weg, solange du dabei nur dort schreibst, wo dieser Test es erlaubt. Notiere
  jeden mit Ergebnis. Wiederhol nichts, das mit HTTP 403 abgelehnt wurde, das
  ist eine Sperre der Arbeitsumgebung.
- **Ursache:** deine Vermutung, warum etwas nicht geklappt hat, und woran du
  sie festmachst. Kennzeichne Vermutungen als Vermutungen.
- **Offen:** was du nicht prüfen oder nicht sicher feststellen konntest, und
  warum.
- **Folgen:** welche Fähigkeit (Datei und Abschnitt) betroffen ist und was dort
  geändert werden sollte.

Nenne im Protokoll nur Dateien, die der Test selbst anlegt, und Dateien des
Plugins. Von allen anderen Dateien im Projekt und in der Datenquelle nennst du
nur die Anzahl, ebenso von geplanten Anweisungen, die kein Test dieses Chats
angelegt hat. Sie gehören dem Nutzer.

## Vorbereitung

Stell diese Rückfrage:

```auswahl
Wo läuft dieser Chat gerade?
- Im Browser
- In der Claude-App auf Handy oder Tablet
- In der Claude-App am Computer
```

Halte danach fest:

- Modell, Datum und die Antwort auf die Rückfrage.
- Die Betriebsart (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt
  „Betriebsart“) und ob es `projekt:daten.xml` gibt.
- Die Werkzeuge für Projektdateien, Rückfragen, Dateien im Chat, die Shell,
  die Websuche, die GitHub-Anbindung und geplante Anweisungen mit genauem
  Namen und ihren Parametern. Alle übrigen Werkzeuge nur als Anzahl.
- Arbeitsumgebung: Ausgabe von `uname -a`, `pwd` und `df -h .`.

## Tests

1. **Webseite:** Davon hängt „Skript verbessern“ ab: Node und npm, der Klon
   der Vorlage, die Installation ihrer Pakete, das Bauen, `pdfimages` zum
   Ausschneiden von Abbildungen und die Anzeige der HTML-Datei im Chat. Alles
   geschieht in `arbeit:lernhelfer-test-webseite/`, nichts im Projekt oder in
   der Datenquelle.
   1. Führ aus und notiere Ausgabe, Exit-Code und Dauer (z.B. mit
      `date +%s.%N` davor und danach):
      `node --version`, `npm --version`, `command -v pdfimages`, dann in
      `arbeit:lernhelfer-test-webseite/`
      `git clone --depth 1 https://github.com/ohmtools/lernhelfer-skript skript`,
      dann im Ordner `skript/` `npm ci --omit=dev`, `du -sh node_modules`,
      `df -h .`, `npm run pruefen` und `npm run build`, zuletzt
      `ls -l dist/index.html`. Schlägt ein Schritt fehl, mach mit dem
      nächsten weiter, soweit er nicht von ihm abhängt.
   2. Gibt es `dist/index.html`, kopier sie nach
      `arbeit:lernhelfer-test-webseite/lernhelfer-test-webseite.html`, stell
      sie mit deinem Werkzeug zum Bereitstellen von Dateien zum Anzeigen im
      Chat bereit (z.B. `display: render` bei `SendUserFile`) und stell diese
      Rückfrage:

      ```auswahl
      Test der Webseite: Erscheint die Seite „Grundlagen der Elektrotechnik“? Probier: ein anderes Kapitel öffnen, in Kapitel 2 den Regler für R bewegen und eine Lösung aufdecken.
      - Erscheint, alles bedienbar
      - Erscheint, aber etwas geht nicht
      - Erscheint nicht
      ```

      Bei „Erscheint, aber etwas geht nicht“ antworte und warte auf die
      Antwort:

      ```text
      Was geht nicht? Beschreib kurz, was du gemacht hast und was passiert ist.
      ```

   `ok`: Alle Befehle enden mit Exit-Code 0, und die Seite erscheint und ist
   bedienbar. `teilweise`: Die Seite entsteht, aber `pdfimages` fehlt, oder
   sie erscheint nicht oder nur eingeschränkt. `fehlgeschlagen`: Ein Befehl
   bricht ab, und es gibt keine Seite. Detail: die Node-Version, die Dauer
   von `npm ci` und `npm run build`, die Größe der HTML-Datei, ob es
   `pdfimages` gibt, und was nicht ging. Protokoll: jeder Befehl mit Ausgabe
   (bei langen die ersten und letzten zehn Zeilen), Exit-Code und Dauer, das
   Werkzeug zum Bereitstellen mit Parametern und Rückmeldung und die
   Antworten des Nutzers. Lösch danach `arbeit:lernhelfer-test-webseite/`.

## Aufräumen

Lösch jede Datei, die ein Test im Projekt oder in der Datenquelle angelegt hat,
und jede geplante Anweisung, die ein Test angelegt hat, anhand ihrer ID, und
prüf, dass nichts davon übrig ist. Bleibt etwas übrig, nenne es in
`{reste}`, eine Datei der Datenquelle mit `{url}`. Protokoll: jeden
Löschversuch mit Werkzeug oder Befehl und Rückmeldung. Hat kein Test etwas
angelegt, notiere nur das.

## Ergebnis

Schreib die folgende Nachricht in die Datei
`arbeit:lernhelfer-testergebnis.md`, stell sie zum Herunterladen bereit und
antworte mit derselben Nachricht. Kürze sie nicht, auch wenn sie lang wird.

- `{modell}` und `{oberflaeche}`: Modell und Antwort aus der Vorbereitung.
- `{zeilen}`: eine Tabellenzeile pro Test in der Reihenfolge oben, z.B.
  `| 1 Webseite | ok | Node v22.22.0, npm ci 36 s, … |`.
- `{umgebung}`: was du in der Vorbereitung notiert hast, als Liste.
- `{protokoll}`: ein Abschnitt `### {name}` für die Vorbereitung, jeden Test
  (z.B. `### 1 Webseite`) und das Aufräumen. Darin die
  Punkte aus dem Abschnitt „Protokoll“ als Liste. Lass Punkte ohne Inhalt weg.
  Für übersprungene Tests nur der Grund.
- `{vorschlaege}`: eine nummerierte Liste konkreter Änderungen am
  Lernhelfer, je mit Datei und Abschnitt, Begründung und dem Test, auf den sie
  sich stützt. Nimm auch Unklarheiten in dieser Fähigkeit auf und alles, was
  dir außerhalb der Tests aufgefallen ist. Gibt es keine: `Keine.`
- `{reste}`: Ist nach dem Aufräumen etwas übrig, setze diese Zeile ein, wobei
  `{dateien}` die Reste aus dem Aufräumen sind, sonst lass den Platzhalter
  samt Zeile weg:

  ```text
  Diese Testdateien konnte ich nicht löschen, entferne sie bitte selbst: {dateien}
  ```

```text
Testergebnis für den Lernhelfer mit {modell}, {oberflaeche}:

| Test | Ergebnis | Detail |
|---|---|---|
{zeilen}

## Umgebung

{umgebung}

## Protokoll

{protokoll}

## Vorschläge

{vorschlaege}

{reste}
Das Ergebnis liegt auch als Datei lernhelfer-testergebnis.md zum Herunterladen bereit. Gib es an die Person weiter, die den Lernhelfer entwickelt.
```
