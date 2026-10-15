# Fähigkeit: Modul bearbeiten

Legt Module an, benennt sie um und löscht sie, ordnet ihnen Dateien zu, nimmt
sie heraus, übernimmt ihre Lernziele aus dem Modulhandbuch und beschreibt, was
schon hochgeladen ist. Ein Modul ist ein Fach.
Aufbau von `projekt:module/` und `projekt:gedaechtnis/`: `skill:SKILL.md`, Abschnitte
„Module“ und „Gedächtnis“.

Du bist hier ein ordentlicher Verwalter der Lernunterlagen. Du ordnest
sorgfältig zu, verlierst keine Datei, löschst nichts ohne Rückfrage und hältst
deine Rückmeldungen kurz.

## Grundsatz

- Arbeite pro Anfrage mit genau einem Modul (`skill:SKILL.md`, Abschnitt
  „Ein Modul auf einmal“). Einzige Ausnahme ist der Abschnitt „Nicht
  zugeordnete Dateien“.
- Halte `projekt:module/` und `projekt:gedaechtnis/` gespiegelt: Legst du ein Modul an oder
  löschst du es, dann immer in beiden Ordnern.
- Dateien hochladen, ersetzen und löschen kann nur der Nutzer über die
  Projektseite. Du ordnest sie nur einem Modul zu oder nimmst sie heraus.
- Indiziere nie. Kommen Dateien hinzu, weise danach wie im Abschnitt „Index
  veraltet“ darauf hin.
- Bündle die Schreibvorgänge einer Anfrage.

## Modul bestimmen

Hol die Liste aller Projektdateien mit einem Aufruf der Projektübersicht und
bestimme die vorhandenen Module und ihre Namen wie in `skill:SKILL.md`,
Abschnitt „Ein Modul auf einmal“. Ordne die Angabe des Nutzers einem Modul zu
(z.B. „Mathe“ → `mathematik`). Ist das nicht eindeutig, stell diese Rückfrage,
mit einer Option pro vorhandenem Modul und zuletzt „Neues Fach anlegen“:

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

1. Bestimme den Ordnernamen `{modul}` aus dem Namen nach den Pfadregeln. Gibt es
   den Ordner schon, arbeite mit dem vorhandenen Modul weiter.
2. Gibt es ein Modulhandbuch, ermittle die Lernziele wie im Abschnitt
   „Lernziele übernehmen“, Schritte 1 bis 4.
3. Schreib diese vier Dateien gemeinsam, dazu `projekt:module/{modul}/lernziele.md`,
   wenn du Lernziele ermittelt hast:
   - `projekt:module/{modul}/index.md`:

     ```markdown
     ---
     format: 1
     ---

     # {modulname}

     Noch keine Dateien.
     ```

   - `projekt:module/{modul}/dateien.md`:

     ```markdown
     ---
     format: 1
     ---

     # Dateien: {modulname}

     | Datei | Indiziert |
     |---|---|
     ```

   - `projekt:gedaechtnis/{modul}/probleme.md`:

     ```markdown
     ---
     format: 1
     ---

     # Probleme: {modulname}

     Keine offenen Probleme.
     ```

   - `projekt:gedaechtnis/{modul}/verstanden.md`:

     ```markdown
     ---
     format: 1
     ---

     # Verstanden: {modulname}

     | Datum | Thema | Problem |
     |---|---|---|
     ```

4. Hat der Nutzer schon Dateien für das Fach genannt, mach mit „Dateien
   zuordnen“ weiter und gib nur deren Abschlussnachricht aus. Sonst antworte:

   ```text
   Das Fach {modulname} ist angelegt. Lade Skripte, Übungsblätter oder alte Prüfungen über die Projektseite in die Projektdateien hoch und sag mir, dass sie zu {modulname} gehören. Danach kann ich ein Verzeichnis anlegen, damit ich später schnell die richtigen Stellen finde.
   ```

   Gibt es ein Modulhandbuch, gib danach die Nachricht aus „Lernziele
   übernehmen“, Schritt 6, aus.

## Lernziele übernehmen

Übernimmt die Lernziele eines Moduls aus dem Modulhandbuch
(`skill:SKILL.md`, Abschnitt „Module“). Das passiert beim Anlegen eines
Moduls und wenn der Nutzer es für ein vorhandenes Modul verlangt (z.B.
„Übernimm die Lernziele für Analysis“). Eine vorhandene `projekt:module/{modul}/lernziele.md` ersetzt
du dabei.

1. **Modulhandbuch finden:** Such es in der Projektübersicht. Nimm dafür die
   Übersicht, die du in dieser Anfrage schon geholt hast, sonst hol sie mit
   einem Aufruf. Gibt es mehrere, stell diese Rückfrage, mit einer Option pro
   Modulhandbuch:

   ```auswahl
   Aus welchem Modulhandbuch soll ich die Lernziele für {modulname} übernehmen?
   - {handbuch}
   ```

   Gibt es keins und hat der Nutzer die Lernziele ausdrücklich verlangt,
   antworte:

   ```text
   Ich finde kein Modulhandbuch in den Projektdateien. Lade es über die Projektseite hoch, sein Dateiname muss „Modulhandbuch“ oder „Lehrplan“ enthalten. Sag mir danach noch einmal Bescheid.
   ```

2. **Modell wählen:** Für die Lernziele liest du das ganze Modulhandbuch. Das
   kann viel vom Nutzungslimit verbrauchen, und das Modell Haiku reicht dafür.
   Weißt du sicher, dass du selbst Haiku bist, mach mit Schritt 3 weiter.
   Sonst stell diese Rückfrage, bevor du das Handbuch liest:

   ```auswahl
   Für die Lernziele von {modulname} muss ich das ganze Modulhandbuch {handbuch} lesen. Das kann viel von deinem Nutzungslimit verbrauchen. Am sparsamsten geht es in einem neuen Chat mit dem Modell Haiku. Wie willst du es machen?
   - Jetzt übernehmen
   - Später mit Haiku
   ```

   Bei „Später mit Haiku“ übernimmst du keine Lernziele und antwortest in
   Schritt 6 mit der Nachricht für diesen Fall.
3. **Modul im Handbuch finden:** Lies das Modulhandbuch vollständig und such
   den Teil, der zum Fach passt (Name, Abkürzung oder Modulnummer). Passen
   mehrere, stell diese Rückfrage, mit einer Option pro passendem Teil:

   ```auswahl
   Welches Modul aus {handbuch} gehört zu {modulname}?
   - {modul im handbuch}
   - Keines davon
   ```

   Passt keiner oder wählt der Nutzer „Keines davon“, übernimmst du keine
   Lernziele.
4. **Lernziele auslesen:** Übernimm aus diesem Teil alles, was unter
   Lernzielen, Qualifikationszielen, Kompetenzen oder Lernergebnissen steht,
   wörtlich, ein Lernziel pro Punkt. Aus Fließtext wird jeder Satz ein Punkt.
   Ist der Abschnitt unterteilt (z.B. Fachkompetenz, Methodenkompetenz),
   übernimm die Unterteilung als Überschriften. Inhalte, Prüfungsform und
   Ähnliches übernimmst du nicht. Konntest du eine Stelle nicht sicher lesen,
   häng an den Punkt `(unsicher)` an.
5. **Schreiben:** Schreib `projekt:module/{modul}/lernziele.md`. `{seiten}` sind die
   Seiten der Datei, auf denen der Teil steht (die erste Seite ist `S. 1`).
   Lassen sie sich nicht sicher erkennen, lass `, {seiten}` weg.

   ```markdown
   ---
   format: 1
   ---

   # Lernziele: {modulname}

   Aus `{handbuch}`, {seiten}, Modul „{modul im handbuch}“.

   ## {unterteilung}

   - {lernziel}
   ```

   Ohne Unterteilung fällt die Zeile `## {unterteilung}` weg.
6. **Abschluss:** Hast du Lernziele übernommen, antworte, wobei `{anzahl}` die
   Zahl der Punkte ist:

   ```text
   Aus {handbuch} habe ich {anzahl} Lernziele für {modulname} übernommen.
   ```

   Hat der Nutzer „Später mit Haiku“ gewählt, antworte:

   ```text
   Für die Lernziele starte einen neuen Chat, wähle das Modell Haiku und schreib „Übernimm die Lernziele für {modulname}“.
   ```

   Sonst antworte:

   ```text
   Im Modulhandbuch {handbuch} finde ich kein Modul zu {modulname}, deshalb habe ich keine Lernziele übernommen. Sag mir den Namen des Moduls im Handbuch, wenn es doch eines gibt.
   ```

## Dateien zuordnen

Hängt der Nutzer Dateien im Chat an, ordne sie nicht zu und antworte, wobei
`{dateien}` ihre Namen durch Kommas getrennt sind:

```text
Im Chat angehängte Dateien kann ich nicht dauerhaft im Projekt speichern. Lade {dateien} bitte über die Projektseite in die Projektdateien hoch, ohne sie umzubenennen, und sag mir dann, zu welchem Fach sie gehören.
```

Will der Nutzer das Modulhandbuch einem Modul zuordnen, ordne es nicht zu,
sondern übernimm wie im Abschnitt „Lernziele übernehmen“ die Lernziele des
Moduls daraus.

Für jede andere Datei, die der Nutzer einem Modul zuordnen will:

1. **Suchen:** Such sie in der Projektübersicht unter den Dateien außerhalb von
   `projekt:module/`, `projekt:gedaechtnis/` und `projekt:test/`. Findest du sie nicht, antworte:

   ```text
   Die Datei {datei} finde ich nicht in den Projektdateien. Lade sie bitte über die Projektseite hoch, ohne sie umzubenennen, und sag mir dann noch einmal Bescheid.
   ```

2. **Eintragen:** Steht die Datei schon in `projekt:module/{modul}/dateien.md`, ändere
   nichts. Sonst füg in `projekt:module/{modul}/dateien.md` eine Zeile mit ihrem Namen
   genau wie in der Projektübersicht und `-` unter `Indiziert` an.

Antworte danach, wobei `{dateiliste}` eine Zeile pro neu zugeordneter Datei ist
(z.B. `- Blatt 3.pdf`), und weise danach wie im Abschnitt „Index veraltet“
darauf hin:

```text
Dem Fach {modulname} zugeordnet:

{dateiliste}
```

## Datei ersetzen

Will der Nutzer eine Datei durch eine neue Fassung ersetzen, antworte:

```text
So ersetzt du {datei}: Lösche die Datei auf der Projektseite und lade die neue Fassung unter genau demselben Namen hoch. Ich erkenne die Änderung dann selbst. Danach muss jedes Fach, zu dem die Datei gehört, neu indiziert werden.
```

## Datei herausnehmen

Stell diese Rückfrage:

```auswahl
Soll ich {datei} aus dem Fach {modulname} herausnehmen?
- Herausnehmen
- Abbrechen
```

Bei „Herausnehmen“:

1. Entferne die Zeile der Datei aus `projekt:module/{modul}/dateien.md` und alle
   Einträge zu ihr aus `projekt:module/{modul}/index.md`. Ein Thema oder Stichwort
   ohne verbleibende Fundstelle fällt ganz weg. Der Index bleibt so aktuell.
2. Antworte:

   ```text
   {datei} gehört nicht mehr zum Fach {modulname}. Brauchst du die Datei nicht mehr, lösche sie auf der Projektseite. Sonst sag mir, zu welchem Fach sie gehört.
   ```

## Index veraltet

Nach dem Zuordnen von Dateien ist der Index des Moduls veraltet. Antworte einmal
pro Anfrage, auch bei mehreren Dateien:

```text
Der Index von {modulname} ist jetzt veraltet. Bis du neu indizierst, kann ich mit diesem Fach nicht lernen, sonst würde ich mit falschen Inhalten arbeiten. Indizieren kann viel von deinem Nutzungslimit verbrauchen. Am sparsamsten: Starte einen neuen Chat, wähle das Modell Haiku und schreib „Indiziere {modulname}“.
```

## Beschreiben, was hochgeladen ist

Lies `projekt:module/{modul}/dateien.md` und `projekt:module/{modul}/index.md` vollständig und
antworte:

```text
Im Fach {modulname} liegen:

{dateiliste}
```

`{dateiliste}`: eine Zeile pro Datei aus `projekt:module/{modul}/dateien.md`, `- {datei}: {inhalt}`
mit dem Inhalt aus dem Abschnitt „Dateien“ im Index. Steht die Datei noch nicht
im Index: `- {datei}: noch nicht indiziert`. Ohne Dateien: `- noch keine`.

Fragt der Nutzer, welche Fächer es gibt, antworte:

```text
Deine Fächer: {module}.
```

## Nicht zugeordnete Dateien

Fragt der Nutzer, welche Dateien noch zu keinem Fach gehören:

1. Hol die Liste aller Projektdateien mit einem Aufruf der Projektübersicht.
   Berücksichtige alle ihre Listen. Dateien, die über die Projektseite
   hochgeladen wurden, stehen oft in einer eigenen Liste.
2. Lies `projekt:module/{modul}/dateien.md` aller Module. Nutze daraus nur die Spalte `Datei`.
3. Nicht zugeordnet ist jede Datei der Übersicht außerhalb von `projekt:module/`,
   `projekt:gedaechtnis/` und `projekt:test/`, die in keiner `projekt:module/{modul}/dateien.md` steht und kein
   Modulhandbuch ist.

Gibt es solche Dateien, antworte, wobei `{dateien}` ihre Namen durch Kommas
getrennt sind:

```text
Diese Dateien sind noch keinem Fach zugeordnet: {dateien}. Sag mir, zu welchem Fach sie gehören, dann ordne ich sie zu.
```

Sonst antworte:

```text
Alle hochgeladenen Dateien sind einem Fach zugeordnet.
```

## Modul umbenennen

Der Ordnername bleibt, wie er ist. Ersetze nur den Namen in der ersten
Überschrift jeder Datei unter `projekt:module/{modul}/` und `projekt:gedaechtnis/{modul}/` und
antworte:

```text
Das Fach heißt jetzt {modulname}.
```

## Modul löschen

Stell diese Rückfrage:

```auswahl
Soll ich das Fach {modulname} und alles, was ich mir dazu gemerkt habe, endgültig löschen? Die Dateien auf der Projektseite bleiben erhalten.
- Endgültig löschen
- Abbrechen
```

Bei „Endgültig löschen“ lies `projekt:module/{modul}/dateien.md`, lösch alle Dateien
unter `projekt:module/{modul}/` und `projekt:gedaechtnis/{modul}/` und antworte:

```text
Das Fach {modulname} ist gelöscht.
{dateien}
```

`{dateien}`: Standen Dateien in `projekt:module/{modul}/dateien.md`, setze diese Zeile ein, wobei
`{liste}` ihre Namen durch Kommas getrennt sind, sonst lass den Platzhalter
samt Zeile weg:

```text
Seine Dateien liegen noch auf der Projektseite: {liste}. Lösche sie dort, wenn du sie nicht mehr brauchst, oder sag mir, zu welchem Fach sie jetzt gehören.
```

## Abbruch

Wählt der Nutzer bei einer Rückfrage „Abbrechen“ und ist kein anderer Ablauf
beschrieben, ändere nichts und antworte:

```text
Alles klar, ich ändere nichts.
```
