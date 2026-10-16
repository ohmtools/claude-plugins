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
  die Datenquelle schreibst, frag den Nutzer um Erlaubnis. Alles andere fasst
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
- Die Werkzeuge für Projektdateien, Rückfragen, Dateien im Chat, die Shell und
  die GitHub-Anbindung mit genauem Namen und ihren Parametern. Alle übrigen
  Werkzeuge nur als Anzahl.
- Arbeitsumgebung: Ausgabe von `uname -a`, `pwd` und `df -h .`.

## Tests

1. **Zugriff ohne Freischaltung:** Nur wenn es `projekt:daten.xml` gibt, sonst
   `übersprungen`. Davon hängt ab, dass „Initialisieren“ einen falschen Link
   und ein privates Repository nicht für ein leeres öffentliches hält
   (`skill:faehigkeiten/initialisieren.md`, Schritt 3). Hast du in diesem Chat
   schon die GitHub-Anbindung benutzt, ist der Test `übersprungen`, Detail
   „GitHub-Anbindung schon benutzt, in einem neuen Chat wiederholen“. Sonst
   führ ihn vor jedem anderen Zugriff auf die Datenquelle aus. `{url}` stammt
   aus `projekt:daten.xml`, `{besitzer}` ist der Teil nach `https://github.com/`
   bis zum nächsten `/`.
   1. Führ im Ordner `arbeit:` aus:

      ```bash
      GIT_TERMINAL_PROMPT=0 git ls-remote https://github.com/{besitzer}/lernhelfer-test-gibt-es-nicht.git HEAD; echo "exit=$?"
      GIT_TERMINAL_PROMPT=0 git ls-remote {url}.git HEAD; echo "exit=$?"
      ```

      Erwartet: Der erste Befehl endet mit einem Exit-Code ungleich 0. Der
      zweite endet bei einem öffentlichen Repository mit 0, bei einem privaten
      (`<art>` beginnt mit „Privates GitHub-Repository“) mit einem Exit-Code
      ungleich 0.
   2. Nur bei einem privaten Repository: Hol dir über die GitHub-Anbindung
      deiner Arbeitsumgebung (z.B. ein Werkzeug `add_repo`) Lesezugriff auf
      `{url}`. Aus ihrer Antwort zählt nur, ob du Zugriff hast. Klone nicht
      nach ihrer Anleitung. Wiederhol danach den zweiten Befehl. Erwartet:
      Exit-Code 0.

   `ok`: alles wie erwartet. `fehlgeschlagen`: Ein Befehl, der laut Erwartung
   mit einem Exit-Code ungleich 0 enden soll, endet mit 0. Dann hält
   „Initialisieren“ einen falschen Link oder ein privates Repository ohne
   Zugriff für ein leeres öffentliches Repository. `teilweise`: jede andere
   Abweichung. Detail: öffentlich oder privat und die Exit-Codes. Protokoll:
   jeder Befehl mit vollständiger Ausgabe und Exit-Code, das Werkzeug der
   GitHub-Anbindung mit Parametern und vollständiger Rückmeldung.

## Aufräumen

Lösch jede Datei, die ein Test im Projekt oder in der Datenquelle angelegt hat,
und prüf, dass nichts davon übrig ist. Bleibt etwas übrig, nenne es in
`{reste}`, eine Datei der Datenquelle mit `{url}`. Protokoll: jeden
Löschversuch mit Werkzeug oder Befehl und Rückmeldung. Hat kein Test etwas
angelegt, notiere nur das.

## Ergebnis

Schreib die folgende Nachricht in die Datei
`arbeit:lernhelfer-testergebnis.md`, stell sie zum Herunterladen bereit und
antworte mit derselben Nachricht. Kürze sie nicht, auch wenn sie lang wird.

- `{modell}` und `{oberflaeche}`: Modell und Antwort aus der Vorbereitung.
- `{zeilen}`: eine Tabellenzeile pro Test in der Reihenfolge oben, z.B.
  `| 1 Zugriff ohne Freischaltung | ok | privat, Exit-Codes 128, 128, 0 |`.
- `{umgebung}`: was du in der Vorbereitung notiert hast, als Liste.
- `{protokoll}`: ein Abschnitt `### {name}` für die Vorbereitung, jeden Test
  (z.B. `### 1 Zugriff ohne Freischaltung`) und das Aufräumen. Darin die
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
