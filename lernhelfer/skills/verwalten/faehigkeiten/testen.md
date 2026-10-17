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

## Als automatische Anweisung

Lautet die Anfrage „Teste den Lernhelfer als automatische Anweisung“, läuft
dieser Chat als geplante Anweisung aus Test 2, und niemand liest mit. Führ dann
nur diese Schritte aus, ohne Rückfrage, statt der übrigen Abschnitte:

1. Halte fest: dein Modell, Datum und Uhrzeit, ob du Werkzeuge für
   Projektdateien hast, den Namen des Projekts laut Projektübersicht und wie
   viele Dateien sie nennt.
2. Nur wenn es `projekt:daten.xml` gibt: Hol die Liste der Dateien der
   Datenquelle, wie `projekt:daten.xml` es beschreibt. Notiere, ob das klappt,
   mit Befehlen, Exit-Codes und Fehlermeldungen wörtlich, und nur die Zahl der
   Dateien. Bei einem privaten Repository notiere auch, ob du ein Werkzeug der
   GitHub-Anbindung hattest, und wenn ja, seine vollständige Rückmeldung und
   ob es eine Bestätigung verlangt hat.
3. Schreib alles als Liste nach `projekt:lernhelfer-test-geplant.md`.
4. Antworte:

   ```text
   Test der automatischen Anweisungen fertig. Das Ergebnis liegt in lernhelfer-test-geplant.md.
   ```

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

1. **Projektname:** Davon hängt ab, dass sich die automatischen Anweisungen
   dieses Projekts von denen anderer Projekte unterscheiden lassen
   (`skill:SKILL.md`, Abschnitt „Anweisungen dieses Projekts“).
   1. Such den Namen dieses Projekts in der Projektübersicht, z.B. in einem
      Feld `name` von `project_info`. Die Überschrift der Projektanweisung ist
      es nicht. Notiere das Werkzeug, das Feld und die Namen aller Felder der
      Rückmeldung, ohne ihren Inhalt.
   2. Hast du einen Namen gefunden, stell diese Rückfrage, wobei `{projekt}`
      der Name ist:

      ```auswahl
      Test des Projektnamens: Heißt dieses Projekt in Claude.ai „{projekt}“?
      - Ja
      - Nein
      ```

   3. Hast du keinen Namen gefunden oder stimmt er nicht, frag nach ihm wie in
      `skill:SKILL.md`, Abschnitt „Anweisungen dieses Projekts“. Den Namen
      brauchst du in Test 2.

   `ok`: Du hast einen Namen gefunden, und er stimmt. `fehlgeschlagen`: Du hast
   keinen gefunden, oder er stimmt nicht. Detail: Werkzeug und Feld. Protokoll:
   der Aufruf, die Namen der Felder und die Antwort des Nutzers.
2. **Automatische Anweisungen:** Davon hängt ab, dass „Initialisieren“ und
   „Automatische Anweisungen“ das Modell einer Anweisung setzen können, auch
   erst nach dem Anlegen, und dass der Lauf dann mit diesem Modell arbeitet
   (`skill:SKILL.md`, Abschnitt „Automatische Anweisungen“). Hast du kein
   Werkzeug für geplante Anweisungen, ist der Test `fehlgeschlagen`, Detail
   „kein Werkzeug“.
   1. Stell diese Rückfrage:

      ```auswahl
      Test der automatischen Anweisungen: Ich lege eine Anweisung an, die in etwa fünf Minuten einmal mit Haiku in einem neuen Chat in diesem Projekt läuft, und lösche sie danach wieder. Einverstanden?
      - Ja, mit Haiku
      - Test überspringen
      ```

      Bei „Test überspringen“ ist der Test `übersprungen`.
   2. Gibt es `projekt:daten.xml` und beginnt `<art>` darin mit „Privates
      GitHub-Repository“, hol dir Lesezugriff, wie `<art>` es beschreibt.
   3. Leg die Anweisung an: Name `Lernhelfer-Test ({projekt})` mit dem Namen
      aus Test 1, einmal etwa fünf Minuten nach jetzt, in einem neuen Chat,
      Benachrichtigung push, mit diesem Prompt:

      ```text
      /lernhelfer:verwalten Teste den Lernhelfer als automatische Anweisung
      ```

      Kann das Werkzeug keine einmalige Anweisung, nimm eine wöchentliche zur
      nächsten möglichen Zeit. Merk dir ihre ID. Setz das Modell auf Haiku,
      beim Anlegen oder, wenn das Werkzeug dort kein Modell kennt, gleich
      danach mit dem Werkzeug zum Ändern (z.B. `update_trigger` mit `model`).
      Prüf in der Liste der geplanten Anweisungen, dass sie mit Haiku da ist.
   4. Stell diese Rückfrage, wobei `{uhrzeit}` ihre Zeit ist:

      ```auswahl
      Test der automatischen Anweisungen: Ich habe eine für {uhrzeit} angelegt. Sie läuft in einem neuen Chat in diesem Projekt. Sag mir Bescheid, sobald du den Chat oder eine Benachrichtigung siehst, spätestens nach zehn Minuten.
      - Gelaufen, mit Benachrichtigung
      - Gelaufen, ohne Benachrichtigung
      - Nichts passiert
      ```

   5. Lies `projekt:lernhelfer-test-geplant.md`, bevor du die Anweisung
      löschst, denn das Löschen entfernt auch den Chat ihres Laufs. Lösch sie
      dann anhand ihrer ID. Meldet das Löschen, dass es sie nicht gibt, und
      fehlt sie in der Liste, gilt sie als gelöscht.

   `ok`: Sie ist mit Benachrichtigung gelaufen, und laut
   `projekt:lernhelfer-test-geplant.md` lief sie mit Haiku, im Projekt aus
   Test 1, mit Werkzeugen für Projektdateien und, falls es
   `projekt:daten.xml` gibt, mit Zugriff auf die Datenquelle ohne Bestätigung.
   `teilweise`: Sie ist gelaufen, aber etwas davon fehlt, z.B. lief sie mit
   einem anderen Modell. `fehlgeschlagen`: Sie ließ sich nicht anlegen oder
   ist nicht gelaufen. Detail: das Modell laut Liste und laut Lauf und was
   fehlte. Protokoll: jedes Werkzeug mit allen Parametern und Rückmeldungen,
   die Antwort des Nutzers und den Inhalt von
   `projekt:lernhelfer-test-geplant.md` vollständig.

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
  `| 1 Projektname | ok | project_info, Feld name |`.
- `{umgebung}`: was du in der Vorbereitung notiert hast, als Liste.
- `{protokoll}`: ein Abschnitt `### {name}` für die Vorbereitung, jeden Test
  (z.B. `### 1 Projektname`) und das Aufräumen. Darin die
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
