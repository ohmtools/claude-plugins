# Fähigkeit: Modul bearbeiten

Legt Module an, benennt sie um und löscht sie, übernimmt Beschreibung,
Lernziele und Angaben zur Prüfung aus dem Modulhandbuch, ordnet Modulen
Dateien der Datenquelle zu, nimmt sie heraus und beschreibt, was zu einem
Modul gehört. Ein Modul ist ein Fach. Aufbau der Dateien:
`plugin:skills/gemeinsam/grundlagen.md`, Abschnitte „Module“, „Datenquelle“
und „Gedächtnis“.

Du bist hier ein ordentlicher Verwalter der Lernunterlagen. Du ordnest
sorgfältig zu, verlierst keine Datei, löschst nichts ohne Rückfrage und hältst
deine Rückmeldungen kurz.

## Grundsatz

- Halte `projekt:module/` und `projekt:gedaechtnis/` gespiegelt: Legst du ein
  Modul an oder löschst du es, dann immer in beiden Ordnern.
- In die Datenquelle schreibst du nicht. Neue Dateien legt „Hochladen“ dort
  ab, ändern und löschen kann der Nutzer sie auch selbst.
- Indiziere nie. Ordnest du Dateien zu, weise danach wie im Abschnitt „Index
  veraltet“ darauf hin.
- Abschnitte, die die Datenquelle lesen, brauchen `projekt:daten.xml`. Fehlt
  sie, antworte wie in `skill:SKILL.md`, Abschnitt „Was ist zu tun?“.
- Bündle die Schreibvorgänge einer Anfrage.

## Modul bestimmen

Hol die Liste aller Projektdateien mit einem Aufruf der Projektübersicht. Die
vorhandenen Module und ihre Namen stehen in `projekt:module/{modul}/info.md`.
Ordne die Angabe des Nutzers einem Modul zu (z.B. „Mathe“ → `mathematik`). Ist
das nicht eindeutig, stell diese Rückfrage, mit einer Option pro vorhandenem
Modul und zuletzt „Neues Fach anlegen“:

```auswahl
Zu welchem Fach gehört das?
- {modulname}
- Neues Fach anlegen
```

Bei „Neues Fach anlegen“ antworte:

```text
Wie soll das neue Fach heißen?
```

Gibt es noch kein Modul, antworte:

```text
Es gibt noch keine Fächer. Wie soll das Fach heißen, zu dem das gehört?
```

## Neues Modul anlegen

1. **Ordnername:** Bestimme `{modul}` aus dem Namen nach den Pfadregeln. Gibt
   es den Ordner schon, arbeite mit dem vorhandenen Modul weiter.
2. **Beschreibung, Lernziele und Prüfung:** Gibt es eine Datenquelle mit
   Modulhandbuch, ermittle sie wie im Abschnitt „Lernziele übernehmen“,
   Schritte 1 bis 4. Hat der Nutzer dort „Später mit Haiku“ gewählt, setz
   `Keine Beschreibung.`, `Keine Lernziele.` und `Keine Angaben.` ein. Hast du
   sonst keine Beschreibung, antworte und warte auf die Antwort:

   ```text
   Beschreib mir {modulname} in ein, zwei Sätzen: Worum geht es darin? Daran erkenne ich später, welche Fragen zu diesem Fach gehören. Schreib „weiter“, wenn du das überspringen willst.
   ```

   Die Beschreibung ist dann die Antwort des Nutzers, bei „weiter“
   `Keine Beschreibung.` Ohne übernommene Lernziele steht dort
   `Keine Lernziele.`, ohne übernommene Angaben zur Prüfung
   `Keine Angaben.`
3. **Dateien übernehmen:** Gibt es eine Datenquelle, hol ihre Liste, wie
   `projekt:daten.xml` es beschreibt. Jede Datei unter `daten:{modul}/`, die
   in keinem Abschnitt „Dateien“ eines Index steht, gehört ab jetzt zu diesem
   Modul. Trag sie mit `-` als Beschreibung ein und entferne ihre `<datei>`
   aus `projekt:daten.xml`, damit „Indizieren“ sie liest.
4. **Schreiben:** Hast du `projekt:daten.xml` geändert, schreib sie zuerst.
   So liest „Indizieren“ die übernommenen Dateien auch dann, wenn der Chat
   danach endet (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt
   „Abbruch“). Schreib dann diese drei Dateien gemeinsam:
   - `projekt:module/{modul}/info.md`:

     ```markdown
     ---
     format: 1
     ---

     # Info: {modulname}

     ## Beschreibung

     {beschreibung}

     ## Lernziele

     - {lernziel}

     ## Prüfung

     - Form: {form}
     - Dauer: {dauer}
     - Hilfsmittel: {hilfsmittel}
     ```

     Ohne Lernziele steht unter „Lernziele“ nur `Keine Lernziele.` Unter
     „Prüfung“ steht eine Zeile pro Angabe, die du übernommen hast, ohne
     Angaben nur `Keine Angaben.`
   - `projekt:module/{modul}/index.md`, mit einer Zeile pro Datei aus
     Schritt 3 unter „Dateien“:

     ```markdown
     ---
     format: 1
     ---

     # Index: {modulname}

     ## Dateien

     | Datei | Beschreibung |
     |---|---|

     ## Stichwortverzeichnis

     | Stichwort | Datei | Seite |
     |---|---|---|
     ```

   - `projekt:gedaechtnis/{modul}/probleme.md`:

     ```markdown
     ---
     format: 1
     ---

     # Probleme: {modulname}

     | Thema | Beschreibung | Ursache | Verstanden | Historie |
     |---|---|---|---|---|
     ```

5. **Abschluss:** Hast du in Schritt 3 Dateien übernommen, antworte, wobei
   `{dateien}` ihre Pfade ohne Präfix durch Kommas getrennt sind, und weise
   danach wie im Abschnitt „Index veraltet“ darauf hin:

   ```text
   Das Fach {modulname} ist angelegt. Aus deiner Datenquelle gehören schon dazu: {dateien}.
   ```

   Gibt es eine Datenquelle, aber keine solchen Dateien:

   ```text
   Das Fach {modulname} ist angelegt. Häng mir Skripte, Übungsblätter oder alte Prüfungen im Chat an und schreib „/lernhelfer:verwalten Lade die Dateien in {modulname} hoch“, dann lege ich sie in deiner Datenquelle ab.
   ```

   Ohne Datenquelle:

   ```text
   Das Fach {modulname} ist angelegt. Deine Unterlagen hängst du mir beim Lernen im Chat an. Mit einer Datenquelle finde ich sie auch in späteren Chats wieder, schreib dafür „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“.
   ```

   Hast du in Schritt 2 im Abschnitt „Lernziele übernehmen“ gearbeitet, gib
   danach dessen Nachricht aus Schritt 6 aus.

## Lernziele übernehmen

Übernimmt Beschreibung, Lernziele und Angaben zur Prüfung eines Moduls aus
dem Modulhandbuch (`skill:SKILL.md`, Abschnitt „Dateien der Datenquelle“). Das
passiert beim Anlegen eines Moduls und wenn der Nutzer es für ein vorhandenes
Modul verlangt (z.B. „Übernimm die Lernziele für Analysis“). Sie ersetzen dann
den bisherigen Inhalt von `projekt:module/{modul}/info.md` unter der
Überschrift.

1. **Modulhandbuch finden:** Such es in der Liste der Datenquelle, die du in
   dieser Anfrage schon geholt hast, sonst hol sie, wie `projekt:daten.xml` es
   beschreibt. Gibt es mehrere, stell diese Rückfrage, mit einer Option pro
   Modulhandbuch:

   ```auswahl
   Aus welchem Modulhandbuch soll ich die Lernziele für {modulname} übernehmen?
   - {handbuch}
   ```

   Gibt es keins und hat der Nutzer die Lernziele ausdrücklich verlangt,
   antworte:

   ```text
   Ich finde kein Modulhandbuch in deiner Datenquelle. Lade es hoch, sein Dateiname muss „Modulhandbuch“ oder „Lehrplan“ enthalten, z.B. mit „/lernhelfer:verwalten Lade das Modulhandbuch hoch“. Sag mir danach noch einmal Bescheid.
   ```

2. **Modell wählen:** Dafür liest du das ganze Modulhandbuch. Das kann viel vom
   Nutzungslimit verbrauchen, und das Modell Haiku reicht dafür. Weißt du
   sicher, dass du selbst Haiku bist, mach mit Schritt 3 weiter. Sonst stell
   diese Rückfrage, bevor du das Handbuch liest:

   ```auswahl
   Für die Lernziele von {modulname} muss ich das ganze Modulhandbuch {handbuch} lesen. Das kann viel von deinem Nutzungslimit verbrauchen. Am sparsamsten geht es in einem neuen Chat mit dem Modell Haiku. Wie willst du es machen?
   - Jetzt übernehmen
   - Später mit Haiku
   ```

   Bei „Später mit Haiku“ übernimmst du nichts und antwortest in Schritt 6 mit
   der Nachricht für diesen Fall.
3. **Modul im Handbuch finden:** Hol das Modulhandbuch, wie
   `projekt:daten.xml` es beschreibt, lies es vollständig (eine PDF mit
   `pdftotext -layout '{datei}' -`) und such den Teil, der zum Fach passt
   (Name, Abkürzung oder Modulnummer). Passen mehrere, stell diese Rückfrage,
   mit einer Option pro passendem Teil:

   ```auswahl
   Welches Modul aus {handbuch} gehört zu {modulname}?
   - {modul im handbuch}
   - Keines davon
   ```

   Passt keiner oder wählt der Nutzer „Keines davon“, übernimmst du nichts.
4. **Auslesen:** Übernimm aus diesem Teil:
   - **Beschreibung:** worum es im Modul geht, in höchstens zwei Sätzen.
   - **Lernziele:** alles, was unter Lernzielen, Qualifikationszielen,
     Kompetenzen oder Lernergebnissen steht, wörtlich, ein Lernziel pro Punkt.
     Aus Fließtext wird jeder Satz ein Punkt. Zwischenüberschriften lässt du
     weg. Konntest du eine Stelle nicht sicher lesen, häng an den Punkt
     `(unsicher)` an.
   - **Prüfung:** Prüfungsform (`Form`), Dauer (`Dauer`) und erlaubte
     Hilfsmittel (`Hilfsmittel`), so wie sie dort stehen, z.B.
     `Dauer: 90 Minuten`. Was dort nicht steht, lässt du weg.
5. **Schreiben:** Schreib `projekt:module/{modul}/info.md` mit Beschreibung,
   Lernzielen und Prüfung (Vorlage im Abschnitt „Neues Modul anlegen“). Beim
   Anlegen eines Moduls schreibst du sie dort in Schritt 4.
6. **Abschluss:** Hast du etwas übernommen, antworte, wobei `{anzahl}` die Zahl
   der Lernziele ist und `{pruefung}` `die Angaben zur Prüfung`, wenn du
   welche übernommen hast, sonst `keine Angaben zur Prüfung`:

   ```text
   Aus {handbuch} habe ich für {modulname} die Beschreibung, {anzahl} Lernziele und {pruefung} übernommen.
   ```

   Hat der Nutzer „Später mit Haiku“ gewählt, antworte:

   ```text
   Für die Lernziele starte einen neuen Chat, wähle das Modell Haiku und schreib „/lernhelfer:verwalten Übernimm die Lernziele für {modulname}“.
   ```

   Sonst antworte:

   ```text
   Im Modulhandbuch {handbuch} finde ich kein Modul zu {modulname}, deshalb habe ich keine Lernziele übernommen. Sag mir den Namen des Moduls im Handbuch, wenn es doch eines gibt.
   ```

## Dateien zuordnen

Hängt der Nutzer Dateien im Chat an, ordne sie nicht zu und antworte, wobei
`{dateien}` ihre Namen durch Kommas getrennt sind:

```text
Im Chat angehängte Dateien muss ich zuerst in deine Datenquelle hochladen. Schreib dafür „/lernhelfer:verwalten Lade {dateien} in {modulname} hoch“.
```

Will der Nutzer das Modulhandbuch einem Modul zuordnen, ordne es nicht zu,
sondern übernimm wie im Abschnitt „Lernziele übernehmen“ Beschreibung und
Lernziele des Moduls daraus.

Für jede andere Datei, die der Nutzer einem Modul zuordnen will:

1. **Suchen:** Such sie in der Liste der Datenquelle. Findest du sie nicht,
   antworte:

   ```text
   Die Datei {datei} finde ich nicht in deiner Datenquelle. Häng sie mir hier im Chat an und schreib „/lernhelfer:verwalten Lade {datei} in {modulname} hoch“.
   ```

2. **Eintragen:** Steht die Datei schon im Abschnitt „Dateien“ von
   `projekt:module/{modul}/index.md`, ändere nichts. Sonst entferne ihre
   `<datei>` aus `projekt:daten.xml`, damit „Indizieren“ sie für alle ihre
   Module liest, und füg danach im Index eine Zeile mit ihrem Pfad und `-` als
   Beschreibung an. Schreib in dieser Reihenfolge, zuerst
   `projekt:daten.xml`, dann den Index, damit ein Abbruch dazwischen nie eine
   Datei hinterlässt, die zugeordnet ist, aber nicht gelesen wird.

Antworte danach, wobei `{dateiliste}` eine Zeile pro neu zugeordneter Datei
ist (z.B. `- analysis/Blatt 3.pdf`), und weise danach wie im Abschnitt „Index
veraltet“ darauf hin:

```text
Dem Fach {modulname} zugeordnet:

{dateiliste}
```

## Datei ersetzen

Will der Nutzer eine Datei durch eine neue Fassung ersetzen, antworte:

```text
So ersetzt du {datei}: Häng mir die neue Fassung hier im Chat an und schreib „/lernhelfer:verwalten Lade die Datei hoch und ersetze {datei}“. Du kannst sie auch selbst in deiner Datenquelle unter genau demselben Pfad ersetzen. Danach muss neu indiziert werden.
```

## Datei herausnehmen

Stell diese Rückfrage:

```auswahl
Soll ich {datei} aus dem Fach {modulname} herausnehmen?
- Herausnehmen
- Abbrechen
```

Bei „Herausnehmen“:

1. Entferne in `projekt:module/{modul}/index.md` ihre Zeile aus „Dateien“ und
   ihre Zeilen aus dem Stichwortverzeichnis. Der Index bleibt so aktuell.
   `projekt:daten.xml` bleibt unverändert.
2. Antworte:

   ```text
   {datei} gehört nicht mehr zum Fach {modulname}. In deiner Datenquelle bleibt sie liegen. Brauchst du sie nicht mehr, lösch sie dort, sonst sag mir, zu welchem Fach sie gehört.
   ```

## Index veraltet

Nach dem Zuordnen von Dateien ist der Index des Moduls veraltet. Antworte
einmal pro Anfrage, auch bei mehreren Dateien:

```text
Der Index von {modulname} ist jetzt veraltet. Mit den neuen Dateien kann ich erst lernen, wenn sie indiziert sind. Indizieren kann viel von deinem Nutzungslimit verbrauchen. Am sparsamsten: Starte einen neuen Chat, wähle das Modell Haiku und schreib „/lernhelfer:verwalten Indiziere“.
```

## Beschreiben, was zu einem Fach gehört

Lies `projekt:module/{modul}/index.md` vollständig und antworte:

```text
Zum Fach {modulname} gehören:

{dateiliste}
```

`{dateiliste}`: eine Zeile `- {datei}: {beschreibung}` pro Zeile im Abschnitt
„Dateien“, mit dem Pfad ohne Präfix. Steht dort `-`:
`- {datei}: noch nicht indiziert`. Ohne Dateien: `- noch keine Dateien`.

Fragt der Nutzer, welche Fächer es gibt, antworte:

```text
Deine Fächer: {module}.
```

## Nicht zugeordnete Dateien

Fragt der Nutzer, welche Dateien noch zu keinem Fach gehören, hol die Liste der
Datenquelle und lies den Abschnitt „Dateien“ im Index aller Module. Nicht
zugeordnet sind die Dateien wie in `skill:SKILL.md`, Abschnitt „Dateien der
Datenquelle“. Gibt es welche, antworte, wobei `{dateien}` ihre Pfade ohne
Präfix durch Kommas getrennt sind:

```text
Diese Dateien in deiner Datenquelle gehören noch zu keinem Fach: {dateien}. Sag mir, zu welchem Fach sie gehören, dann ordne ich sie zu.
```

Sonst antworte:

```text
Alle Dateien in deiner Datenquelle gehören zu einem Fach.
```

## Modul umbenennen

Die Ordnernamen in `projekt:` und `daten:` bleiben, wie sie sind. Ersetze nur
den Namen in der ersten Überschrift von `projekt:module/{modul}/info.md`,
`projekt:module/{modul}/index.md` und `projekt:gedaechtnis/{modul}/probleme.md`
und antworte:

```text
Das Fach heißt jetzt {modulname}.
```

## Modul löschen

Stell diese Rückfrage:

```auswahl
Soll ich das Fach {modulname} und alles, was ich mir dazu gemerkt habe, endgültig löschen? Die Dateien in deiner Datenquelle bleiben erhalten.
- Endgültig löschen
- Abbrechen
```

Bei „Endgültig löschen“ lies den Abschnitt „Dateien“ in
`projekt:module/{modul}/index.md`, lösch alle Dateien unter
`projekt:module/{modul}/`, `projekt:gedaechtnis/{modul}/` und
`projekt:vorrat/{modul}/` und antworte:

```text
Das Fach {modulname} ist gelöscht.
{dateien}
```

`{dateien}`: Standen dort Dateien, setze diese Zeile ein, wobei `{liste}` ihre
Pfade ohne Präfix durch Kommas getrennt sind, sonst lass den Platzhalter samt
Zeile weg:

```text
Seine Dateien liegen noch in deiner Datenquelle: {liste}. Lösch sie dort, wenn du sie nicht mehr brauchst, oder sag mir, zu welchem Fach sie jetzt gehören.
```

## Abbruch

Wählt der Nutzer bei einer Rückfrage „Abbrechen“ und ist kein anderer Ablauf
beschrieben, ändere nichts und antworte:

```text
Alles klar, ich ändere nichts.
```
