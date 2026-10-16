# Fähigkeit: Testen

Prüft Annahmen über die Umgebung, auf die sich die übrigen Fähigkeiten
verlassen und die noch kein Testlauf bestätigt hat. Das Ergebnis ist eine
Tabelle mit ausführlichem Protokoll und dient der Entwicklung des Lernhelfers.

Du bist hier ein gewissenhafter Tester. Du folgst jedem Schritt genau, hältst
jede Beobachtung fest und beschönigst nichts, denn auch ein Fehlschlag hilft
weiter.

## Grundsatz

- Im Projekt schreibst du nur `projekt:lernhelfer-test.md`, in der Datenquelle
  nur `daten:lernhelfer-test.md`. Beide löschst du wieder. Alles andere fasst
  du nicht an.
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
nur die Anzahl. Sie gehören dem Nutzer.

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
- Alle Werkzeuge, die dir zur Verfügung stehen, mit genauem Namen. Bei den
  Werkzeugen für Projektdateien und bei der GitHub-Anbindung zusätzlich ihre
  Parameter.
- Arbeitsumgebung: Ausgabe von `uname -a`, `pwd` und `df -h .`.

## Tests

1. **Datei ohne Ordner im Projekt:** Davon hängt `projekt:daten.xml` ab
   (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Pfade“). Führ mit den
   Werkzeugen für Projektdateien nacheinander aus:
   1. Schreib `/lernhelfer-test.md` mit dem Inhalt `Lernhelfer-Test 1`.
   2. Ruf die Projektübersicht auf. Erwartet: ein Eintrag
      `/lernhelfer-test.md`, keiner unter `claude/`.
   3. Lies `/lernhelfer-test.md`. Erwartet: `Lernhelfer-Test 1`.
   4. Lies `lernhelfer-test.md` ohne Schrägstrich. Erwartet: Die Datei wird
      nicht gefunden.
   5. Schreib `/lernhelfer-test.md` noch einmal, mit dem Inhalt
      `Lernhelfer-Test 2`. Erwartet: Die Rückmeldung meldet, dass die Datei
      ersetzt wurde.
   6. Ruf die Projektübersicht auf und lies `/lernhelfer-test.md`. Erwartet:
      genau ein Eintrag `/lernhelfer-test.md`, Inhalt `Lernhelfer-Test 2`.

   `ok`: alles wie erwartet. `teilweise`: Schreiben, Lesen und Ersetzen mit
   Schrägstrich klappen, aber Punkt 2 oder 4 weicht ab. `fehlgeschlagen`:
   Lesen mit Schrägstrich klappt nicht, oder Punkt 5 legt eine zweite Datei
   an. Detail: was abweicht. Protokoll: bei jedem Punkt Werkzeug mit allen
   Parametern und vollständiger Rückmeldung, aus der Projektübersicht nur die
   Einträge mit `lernhelfer-test.md`, wörtlich.
2. **Hochladen in den Hauptzweig:** Nur wenn es `projekt:daten.xml` gibt,
   sonst `übersprungen`. Davon hängt „Hochladen“ ab
   (`skill:faehigkeiten/hochladen.md`). Geprüft ist bisher nur ein Push in
   einen neuen Zweig. Stell diese Rückfrage:

   ```auswahl
   Für den nächsten Test lege ich in deiner Datenquelle die Datei lernhelfer-test.md an und lösche sie gleich danach wieder. In der Versionsgeschichte bleiben dabei zwei kleine Commits stehen, deine übrigen Dateien bleiben unberührt. Einverstanden?
   - Einverstanden
   - Überspringen
   ```

   Bei „Überspringen“: `übersprungen`. Bei „Einverstanden“, wobei `{url}` aus
   `projekt:daten.xml` stammt:
   1. Hol dir über die GitHub-Anbindung deiner Arbeitsumgebung (z.B. ein
      Werkzeug `add_repo`) Schreibzugriff auf `{url}`. Aus ihrer Antwort zählt
      nur, ob du Zugriff hast. Klone nicht nach ihrer Anleitung.
   2. Klone die Datenquelle, wie `projekt:daten.xml` es beschreibt, und hol
      die Liste ihrer Dateien. Meldet `ls-tree` `Not a valid object name HEAD`,
      ist die Datenquelle leer. Führ dann
      `git -C daten symbolic-ref HEAD refs/heads/main` aus.
   3. Führ im Ordner `arbeit:` aus und notiere nach jedem Befehl den Exit-Code:

      ```bash
      git -C daten reset -q
      printf 'Lernhelfer-Test %s\n' "$(date -u +%FT%TZ)" > daten/lernhelfer-test.md
      git -C daten add -- lernhelfer-test.md
      git -C daten -c user.name="Lernhelfer" -c user.email="lernhelfer@example.invalid" commit -q -m "Lernhelfer: Test"
      git -C daten push origin HEAD
      git ls-remote {url}.git HEAD
      git -C daten rev-parse HEAD
      git -C daten rm -q -- lernhelfer-test.md
      git -C daten -c user.name="Lernhelfer" -c user.email="lernhelfer@example.invalid" commit -q -m "Lernhelfer: Test entfernt"
      git -C daten push origin HEAD
      git ls-remote {url}.git
      git -C daten rev-parse HEAD
      git -C daten -c core.quotepath=off ls-tree -r --name-only HEAD
      ```

   `ok`: Beide Pushes enden mit Exit-Code 0, jedes `ls-remote` zeigt für
   `HEAD` dieselbe ID wie das `rev-parse` danach, und `lernhelfer-test.md`
   fehlt am Ende in der Liste von `ls-tree`. War die Datenquelle leer, zeigt
   das zweite `ls-remote` außerdem `refs/heads/main`. `teilweise`: Anlegen
   klappt, Entfernen nicht. `fehlgeschlagen`: Es gibt keine GitHub-Anbindung
   oder der erste Push klappt nicht. Dann kann „Hochladen“ nicht selbst
   hochladen. Detail: ob die Datenquelle leer war, Name der GitHub-Anbindung
   und wo es hakt. Protokoll: Werkzeug mit Parametern und vollständiger
   Rückmeldung, alle Befehle mit Ausgabe und Exit-Code, Warnungen von git
   wörtlich, Zahl der Dateien vor und nach dem Test.

## Aufräumen

Lösch `/lernhelfer-test.md` aus dem Projekt und prüf in der Projektübersicht,
dass weder `/lernhelfer-test.md` noch `claude/lernhelfer-test.md` übrig ist.
Liegt `daten:lernhelfer-test.md` nach Test 2 noch in der Datenquelle, führ die
Befehle ab `git -C daten rm` einmal aus. Bleibt etwas übrig, nenne es in
`{reste}`, eine Datei der Datenquelle mit `{url}` und der ID aus dem letzten
`rev-parse`. Protokoll: jeden Löschversuch mit Werkzeug oder Befehl und
Rückmeldung.

## Ergebnis

Schreib die folgende Nachricht in die Datei
`arbeit:lernhelfer-testergebnis.md`, stell sie zum Herunterladen bereit und
antworte mit derselben Nachricht. Kürze sie nicht, auch wenn sie lang wird.

- `{modell}` und `{oberflaeche}`: Modell und Antwort aus der Vorbereitung.
- `{zeilen}`: eine Tabellenzeile pro Test in der Reihenfolge oben, z.B.
  `| 1 Datei ohne Ordner | ok | Lesen nur mit Schrägstrich, Ersetzen ok |`.
- `{umgebung}`: was du in der Vorbereitung notiert hast, als Liste.
- `{protokoll}`: ein Abschnitt `### {name}` für die Vorbereitung, jeden Test
  (z.B. `### 2 Hochladen in den Hauptzweig`) und das Aufräumen. Darin die
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
