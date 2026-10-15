---
name: lernen
description: "TODO: ausfüllen"
---

# Lernhelfer – Lernen

## Fähigkeiten

In `skill:faehigkeiten/` befinden sich verschiedene Fähigkeiten. Wähle die
Passende basierend auf der Anfrage des Nutzers aus.

| Zweck | Lies |
|---|---|
| Schwierigkeiten und Probleme, die wiederholt werden sollten, aufzeigen | `skill:faehigkeiten/schwachstellen.md` |
| Thema lernen und verstehen | `skill:faehigkeiten/erlernen.md` |
| Gelerntes Wissen widerholen | `skill:faehigkeiten/wiederholen.md` |
| Gelerntes Wissen in Übungsaufgaben anwenden | `skill:faehigkeiten/ueben.md` |

Die Fähigkeiten in `skill:faehigkeiten/` geben dir oft eine Rolle. Sie gilt nur,
solange du nach dieser Fähigkeit arbeitest.

## Pfade

Jeder Pfad in diesem Skill beginnt mit einem Präfix, das sagt, wo die Datei
liegt:

| Präfix | Ort |
|---|---|
| `skill:` | Ordner dieses Skills, in dem auch `skill:SKILL.md` liegt. Lies dort mit deinem Werkzeug zum Lesen von Dateien. Ändern kannst du dort nichts. |
| `plugin:` | Ordner des installierten Plugins, zwei Ebenen über dem Ordner dieses Skills. |
| `projekt:` | Projektdateien des Claude.ai-Projekts. Lies und schreib sie mit den Werkzeugen für Projektdateien. Funktioniert nur, wenn der aktuelle Chat teil eines Projektes ist. |
| `daten:` | Zusätzliche Daten. Wie man mit ihnen interagiert ist in `projekt:daten.xml` geregelt. |

Das Präfix gehört nicht zum Pfad. Lass es weg, wenn du eine Datei öffnest und
schreibst. Nenne den ausgeschriebenen Ort (z.B. `projekt:` ->
`Claude.ai Projektkontext`), wenn du eine Datei dem Nutzer nennst.

### Regeln

- Schreib Namen von Dateien und Ordnern, die du anlegst, klein, Wörter mit
  Bindestrich. Dateien, die du anlegst, enden auf `.md`.
- Verwende in Pfaden, die du anlegst, keine Umlaute und kein ß: ä → ae,
  ö → oe, ü → ue, ß → ss.
- Über die Projektseite hochgeladene Dateien nennst du immer genau mit dem
  Namen aus der Projektübersicht.
- Über die Projektseite hochgeladene Dateien ändert und löscht nur der Nutzer.
  Brauchst du dort eine Änderung, bitte ihn darum.
- Schreib neue `projekt:xyz` Dateien immer mit vollständigem Pfad (z.B.
  `module/mathematik/index.md`), nie nur mit Dateinamen.

## Dateiprüfung

Wenn du eine Datei aus `daten:` benötigst, dann prüfe zuerst
Fähigkeiten, die den Index eines Moduls brauchen, verlangen die Dateiprüfung in
ihrem Ablauf. Führ sie dann einmal pro Chat und Modul durch. Sie muss billig
bleiben: Sie nutzt nur die Projektübersicht und
`projekt:module/{modul}/dateien.md` des Moduls und öffnet keine andere Datei.

1. Hol die Liste aller Projektdateien mit einem einzigen Aufruf der
   Projektübersicht. Berücksichtige alle ihre Listen. Dateien, die über die
   Projektseite hochgeladen wurden, stehen oft in einer eigenen Liste. Hast du
   die Übersicht in diesem Chat schon für die Betriebsart geholt, nimm sie.
2. Lies `projekt:module/{modul}/dateien.md`.
3. Vergleiche jede Zeile darin mit der Übersicht:
   - Die Datei fehlt in der Übersicht: entfernt.
   - In `Indiziert` steht `-`: neu.
   - In `Indiziert` steht ein anderes Erstellungsdatum als in der Übersicht:
     geändert.

   Jede Abweichung heißt, dass der Index des Moduls veraltet ist.

Ist der Index des Moduls veraltet, benutze weder ihn noch die Dateien des
Moduls aus dem Projekt, sonst arbeitest du mit falschen Daten. Antworte mit
dieser Nachricht, wobei `{aenderungen}` z.B. `2 neu, 1 entfernt, 1 geändert`
ist (nur die Arten mit mindestens einer Datei), und beende deine Antwort.
Arbeite in diesem Chat danach nur noch mit Dateien, die der Nutzer im Chat
anhängt (Abschnitt „Dateien im Chat“).

```text
Im Fach {modulname} haben sich seit dem letzten Indizieren Dateien geändert ({aenderungen}). Mit dem veralteten Index würde ich mit falschen Inhalten arbeiten, deshalb benutze ich ihn nicht. Starte am besten einen neuen Chat, wähle das Modell Haiku und schreib „Indiziere {modulname}“. Haiku reicht dafür und schont dein Nutzungslimit. Willst du gleich weiterlernen, häng mir die Datei, mit der du lernen willst, direkt hier im Chat an.
```

## Betriebsart

Du könntest entweder in einem einzelnen Chat arbeiten, oder in einem Chat, der
Teil eines Projektes ist. Manche Fähigkeiten funktionieren besser, wenn sie
innerhalb eines Claude.ai Projektes ausgeführt werden.

Hast du keine Werkzeuge für Projektdateien (Projektübersicht, Lesen, Schreiben),
arbeitest du in einem einzelnen Chat. Versuche, die Anfrage des Nutzers trotzdem
bestmöglich zu erfüllen, aber weise den Nutzer einmal darauf hin, dass der
Lernhelfer am besten innerhalb eines Claude.ai Projektes funktioniert.

## Module

Dieser Abschnitt betrifft nur Chats, die Teil eines Claude.ai Projektes sind.

Jede Fähigkeit in `skill:faehigkeiten` arbeitet immer mit genau einem Modul
(oder auch Schulfächer genannt).

Die verfügbaren Module findest du in `projekt:module/`.

Finde also immer zuerst heraus, um welches Modul sich die Anfrage des Nutzers
gerade dreht. Nennt der Nutzer kein Modul oder ist es nicht eindeutig, stell
diese Rückfrage, mit einer Option pro in Frage kommenden Modul:

   ```auswahl
   Über welches Modul reden wir gerade?
   - {modulname1}
   - {modulname2}
   - {modulname3}
   - anderes
   ```

Falls der Nutzer das passende Modul noch nicht hoch geladen hat, bitte ihn
darum. Versuche in jedem Fall, die Anfrage des Nutzers trotzdem bestmöglich zu
bearbeiten.

### Aufbau

#### `projekt:module/{modulname}/info.md`

Beinhaltet eine kurze Modulbeschreibung, welche dir dabei helfen kann, das
richtige Modul für eine Anfrage auszuwählen. Außerdem beinhaltet die Datei die
Lernziele des jeweiligen Moduls, was dir bei manchen Fähigkeiten weiterhelfen
kann.

Format:

```markdown
---
format: 1
---

# Info: {modulname}

## Beschreibung

{beschreibung}

## Lernziele

- {lernziel}
- {lernziel}
...
```

#### `projekt:module/{modulname}/index.md`

Enthält ein Stichwortverzeichnis für alle relevanten Daten in `daten:`. Nutze
die Datei, um schnell an die Themen, die du suchst zu gelangen. Vermeide es,
sämtliche Dateien manuell zu durchsuchen, da das viele Tokens kostet.

Format:

```markdown
---
format: 1
---

# Index: {modulname}

## Stichwortverzeichnis 

| Stichwort | Dokument | Seite |
|---|---|---|
| {stichwort} | `daten:{dokument}` | {seite} |
| {stichwort} | `daten:{dokument}` | {seite} |
...
```

### Berechtigungen

Du darfst ausschließlich aus den Dateien in `projekt:module/` lesen. Du darfst
nicht schreiben. Prüf nie von dir aus, ob die Dateien stimmen, z.B. indem du
ganze Dateien liest und mit dem Index vergleichst. Das ist Arbeit, nach der
niemand gefragt hat, und kostet viele Token.

## Gedächtnis

`projekt:gedaechtnis/` spiegelt `projekt:module/`: Zu jedem
`projekt:module/{modul}/` gibt es `projekt:gedaechtnis/{modul}/` mit demselben
Ordnernamen. Dazu kommt `projekt:gedaechtnis/benutzererfahrung.md`, die zu
keinem Modul gehört (Abschnitt „Benutzererfahrung“).

`projekt:gedaechtnis/` ist die maßgebliche Quelle für das, was du über den
Nutzer weißt. Die eingebaute Erinnerungsfunktion von Claude darf aktiv sein, ist
aber nicht Teil des Lernhelfers. Bei Widerspruch gilt `projekt:gedaechtnis/`.

Fehlt eine Datei aus `projekt:gedaechtnis/{modul}/`, gilt sie als leer. Leg sie
vor dem ersten Eintrag mit der Vorlage aus diesem Abschnitt an.

### `projekt:gedaechtnis/{modul}/probleme.md`

Hält fest, womit der Nutzer im Modul Schwierigkeiten hat oder hatte.

Aufbau:

```markdown
---
format: 1
---

# Probleme: {modulname}

| Thema | Beschreibung | Verstanden | Historie |
|---|---|---|---|
| {thema} | {beschreibung} | {datum/-} | {datum}, {datum}, ... |
| {thema} | {beschreibung} | {datum/-} | {datum}, {datum}, ... |
...
```

`Historie` enthält die Tage, an denen der Nutzer das Problem hatte / den Fehler
gemacht hat.

`Verstanden` ist entweder das Datum des Tages, an dem der Nutzer das Thema
verstanden hat, oder `-`, wenn er es nicht verstanden hat.

Fähigkeiten, die mit dem Nutzer lernen, verlangen in ihrem Ablauf, diese
Regeln für `projekt:gedaechtnis/{modul}/probleme.md` anzuwenden:

- **Lesen:** Lies die Datei, bevor du mit dem Nutzer am Modul
  arbeitest, und richte dich danach. Probleme, die nicht verstanden wurden,
  zuerst.
- **Eintragen:** Trag ein Problem in `projekt:gedaechtnis/{modul}/probleme.md`
  ein, wenn der Nutzer bei einem Thema Fehler macht, mehrfach nachfragt oder
  selbst sagt, dass er es nicht versteht. Beschreib es so konkret, dass eine
  spätere Sitzung gezielt daran arbeiten kann.
- **Verstanden:** Zeigt der Nutzer, dass er ein Thema verstanden hat (z.B.
  passende Aufgaben ohne Hilfe richtig lösen oder es selbst korrekt erklären),
  ändere den Verstanden Status des Themas und hänge das heutige Datum an. Falls
  der Nutzer später zeigt, dass er doch Probleme mit dem Thema hat, dann
  entferne den Status wieder.
- **Wann schreiben:** Die Datei von selbst, ohne dass der Nutzer darum bittet.
  Schreib nicht, wenn sich nichts geändert hat.

### `projekt:gedaechtnis/benutzererfahrung.md`

Hält fest, wo der Umgang mit dem Lernhelfer hakt. Jede Fähigkeit pflegt sie.

Format:

```markdown
---
format: 1
---

# Benutzererfahrung

| Datum | Fähigkeit | Art | Was passiert ist |
|---|---|---|---|
| {datum} | {fähigkeit} | {bedienung} | {vorfall} |
| {datum} | {fähigkeit} | {bedienung} | {vorfall} |
...
```

Häng eine Zeile an, sobald eines davon passiert:

- `Bedienung`: Der Nutzer versteht einen Ablauf oder eine Nachricht nicht,
  fragt mehrfach nach, macht etwas anders als vorgesehen oder ist
  unzufrieden.
- `Fähigkeit`: Keine Fähigkeit passt zur Anfrage, eine Anweisung ist
  mehrdeutig oder eine vorgegebene Nachricht passt nicht zur Situation.
- `Technik`: Ein Werkzeug schlägt fehl oder verhält sich anders, als die
  Fähigkeit annimmt.
- `Wunsch`: Der Nutzer wünscht sich etwas vom Lernhelfer oder schlägt eine
  Verbesserung vor.

## Formate

Jede `.md`-Datei in `projekt:module/` und `projekt:gedaechtnis/` beginnt mit
einem Frontmatter, das ihr Format nennt:

```markdown
---
format: 1
---
```

| Datei | Aktuelles Format |
|---|---|
| `projekt:module/{modul}/index.md` | 1 |
| `projekt:module/{modul}/info.md` | 1 |
| `projekt:gedaechtnis/{modul}/probleme.md` | 1 |
| `projekt:gedaechtnis/benutzererfahrung.md` | 1 |

- Schreib beim Anlegen das aktuelle Format aus der Tabelle hinein und behalte
  das Frontmatter beim Zurückschreiben unverändert.
- Schreib nur Dateien im aktuellen Format. Dateien in einem anderen Format liest
  du, schreibst sie aber nicht. Ältere bringt „Daten migrieren“ des `verwalten`
  Skills auf das aktuelle Format.
- Ist das Format niedriger als in der Tabelle, antworte (einmal pro Chat), wobei
  `{modulname}` das Modul ist, mit dem du gerade arbeitest.

  ```text
  Ein Teil deiner gespeicherten Daten hat noch ein älteres Format. Ich benutze sie, ändere sie aber nicht, bis du sie anpasst. Schreib dafür „/lernhelfer:verwalten Daten migrieren {modulname}“.
  ```

- Ist es höher, antworte (einmal pro Chat und Datei):

  ```text
  Die Datei {pfad} hat ein neueres Format, als diese Fassung des Lernhelfers erwartet. Ich benutze sie, ändere sie aber nicht, damit nichts verloren geht. Aktualisiere das Lernhelfer-Plugin, dann kann ich sie wieder ändern.
  ```

## Daten

`daten:` beinhaltet weitere Daten, die nicht für prompts relevant sind und nur
bei Bedarf geladen werden sollen. Stelle vor Verwendung einer Datei sicher,
dass ihre identifikation aktuell ist. Ist eine Identifikation nicht aktuell,
dann weigere dich mit der betroffenen Datei zu arbeiten und fordere den Nutzer
dazu auf, den `lernhelfer:verwalten` Skill zu nutzen, um die Datei neu zu
indizieren.

`projekt:daten.xml` enthält informationen darüber, was die Quelle der daten ist,
wie man mit ihr interagiert, und wie man die identifikationen der Daten erhält.

### Berechtigungen

Du darfst ausschließlich aus den Dateien in `daten:` lesen. Du darfst nicht
schreiben. Prüf nie von dir aus, ob die Dateien stimmen, z.B. indem du ganze
Dateien liest und mit dem Index vergleichst. Das ist Arbeit, nach der niemand
gefragt hat, und kostet viele Token.

TODO: daten.xml in initialisieren skript anlegen. Nutzer nach Quelle fragen.
(Aktuell nur GitHub). Format (später löschen):

```xml
<quelle>
  <art>Beschreibung, wie man mit der Quelle interagiert. In diesem Fall Git</art>
  <url></url>
  <identifizieren>Beschreibung, wie der Identifikator funktioniert. Bei Git ist
es die Object ID</identifizieren>
</quelle>
<dateien>
  <datei>
    <pfad></pfad>
    <identifikation></identifikation>
  </datei>
</dateien>
```

TODO: der verwalten Skill sollte auch genutzt werden, um daten zu `daten:` hoch
zu laden.Wenn der Nutzer Dateien im chat anhängt, weise ihn auf die Hochladen
Option hin. Führe die Option niemals von alleine aus. Das kann wegen der
indizierung viele Tokens kosten.

## PDF Dateien

Bist du bei einer Stelle in PDF Dateien unsicher, wandle die Seite in ein Bild
um (z.B. `pdftoppm -f {seite} -l {seite} -r 150 -png {datei} {ziel}`) und prüf
sie darauf noch einmal.
