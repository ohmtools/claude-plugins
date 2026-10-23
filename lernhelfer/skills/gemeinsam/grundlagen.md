# Lernhelfer – Grundlagen

Diese Datei gilt wie ein Teil der `SKILL.md` des Skills, nach dem du gerade
arbeitest („dieser Skill“).

## Grundregeln

- Sprich Deutsch. Fachbegriffe dürfen englisch bleiben, aber bilde keine
  gemischten Satzstrukturen. Das gilt für Antworten und Dateien.
- Lies Projektdateien, die du brauchst, vollständig.
- Ist eine Funktion als „noch nicht ausgearbeitet“ markiert, sag das dem Nutzer
  offen, statt dir einen Ablauf auszudenken.
- Fähigkeiten in `skill:faehigkeiten/` geben dir eine Rolle. Sie gilt nur,
  solange du nach dieser Fähigkeit arbeitest.
- Manche Werkzeuge musst du erst laden, bevor du sie benutzen kannst (z.B.
  mit `ToolSearch`). Such deshalb auch dort nach einem Werkzeug, bevor du nach
  dem Weg ohne Werkzeug arbeitest.

## Pfade

Jeder Pfad in diesem Skill beginnt mit einem Präfix, das sagt, wo die Datei
liegt:

| Präfix | Ort |
|---|---|
| `skill:` | Ordner dieses Skills, in dem auch `skill:SKILL.md` liegt. Lies dort mit deinem Werkzeug zum Lesen von Dateien. Ändern kannst du dort nichts. |
| `plugin:` | Ordner des installierten Plugins, zwei Ebenen über dem Ordner dieses Skills. Darin liegt diese Datei als `plugin:skills/gemeinsam/grundlagen.md`. |
| `projekt:` | Projektdateien des Claude.ai-Projekts. Lies und schreib sie mit den Werkzeugen für Projektdateien (z.B. `Projects` mit `project_info` für die Projektübersicht, `project_read`, `project_write` und `project_delete`). Es gibt sie nur, wenn der Chat Teil eines Projekts ist. |
| `daten:` | Datenquelle des Nutzers mit Skripten, Übungen, Altklausuren und Modulhandbuch, z.B. ein GitHub-Repository. Wie du sie liest, steht in `projekt:daten.xml`. |
| `arbeit:` | Arbeitsverzeichnis deiner Arbeitsumgebung (z.B. `/home/claude`). |

- Das Präfix gehört nicht zum Pfad. Lass es weg, wenn du eine Datei öffnest oder
  schreibst. Nennst du dem Nutzer eine Datei, lass es ebenfalls weg und sag bei
  Bedarf, wo sie liegt: `projekt:` in den Projektdateien, `daten:` in seiner
  Datenquelle.
- Schreib Namen von Dateien und Ordnern, die du in `projekt:` anlegst, klein,
  Wörter mit Bindestrich, ohne Umlaute und ß (ä → ae, ö → oe, ü → ue,
  ß → ss).
- Schreib neue Dateien immer mit vollständigem Pfad (z.B.
  `projekt:module/mathematik/index.md`), nie nur mit Dateinamen.
- Liegt eine Datei in `projekt:` in keinem Ordner (z.B. `projekt:daten.xml`),
  setz beim Schreiben, Lesen und Löschen einen Schrägstrich vor ihren Namen
  (`/daten.xml`). So steht sie auch in der Projektübersicht. Ohne Schrägstrich
  legt das Werkzeug sie im Ordner `claude/` ab und findet sie beim Lesen
  nicht. Pfade mit Ordner schreibst du ohne Schrägstrich am Anfang.
- Im Chat angehängte Dateien liegen in deiner Arbeitsumgebung, meist unter
  `/root/.claude/uploads/{sitzung}/` mit einem Präfix aus acht Hex-Zeichen und
  Bindestrich vor dem Originalnamen (z.B. `7a57d930-Blatt 3.pdf`). Nennt ein
  Hinweis der Umgebung zur Nachricht des Nutzers ihren Pfad, nimm ihn. Sonst
  such sie mit `find /root/.claude/uploads -name '*{name}' 2>/dev/null`, wobei
  `{name}` der Originalname ist. Fotos heißen oft nur `image.jpg`, dann sind
  die aus der letzten Nachricht die neuesten Treffer (`ls -t`). Findest du dort
  nichts, such mit `find / -xdev -name '*{name}' 2>/dev/null` und lass Treffer
  in `arbeit:` weg, die stammen von dir.

## Betriebsart

Bestimme einmal pro Chat, bevor du eine Fähigkeit ausführst, in welcher
Betriebsart du arbeitest:

1. Hast du keine Werkzeuge für Projektdateien (Projektübersicht, Lesen,
   Schreiben), arbeitest du im **Chat**.
2. Sonst hol die Liste aller Projektdateien mit einem Aufruf der
   Projektübersicht und berücksichtige alle ihre Listen. Liegt
   `projekt:gedaechtnis/benutzererfahrung.md` darin, arbeitest du im
   **Projekt**. Sonst ist das Projekt noch nicht als Lernhelfer eingerichtet,
   und du arbeitest im **Chat**.

Im **Projekt** gibt es Module, Index und Gedächtnis, und es kann eine
Datenquelle geben (Abschnitt „Datenquelle“). Im **Chat** gibt es nichts davon:
Du hilfst mit dem Chatverlauf und mit Dateien, die der Nutzer im Chat anhängt,
und schreibst nie ins Projekt. Was dieser Skill im **Chat** tut, steht in
`skill:SKILL.md`.

## Nachrichten und Rückfragen

Nachrichten in `text`-Blöcken einer Fähigkeit gibst du wörtlich aus. Ersetze
nur die Platzhalter in `{geschweiften Klammern}`. Füge nichts hinzu und lass
nichts weg.

Rückfragen mit festen Antworten stehen als `auswahl`-Block:

```auswahl
{frage}
- {option 1}
- {option 2}
```

Stell sie mit den Auswahlfeldern mit Rückfrage (Knöpfe, die der Nutzer antippt,
statt eine Antwort zu tippen). Übernimm Frage und Optionen wörtlich und in
dieser Reihenfolge. Verlangt das Werkzeug zusätzlich eine kurze Überschrift,
nimm ein Stichwort aus der Frage (z.B. „Fach“). Hast du keine Auswahlfelder
oder hat die Rückfrage mehr Optionen, als die Auswahlfelder zulassen (in
Claude.ai höchstens vier), gib die Frage als Text aus und die Optionen als
nummerierte Liste darunter. Warte in
beiden Fällen auf die Antwort. Für Platzhalter gilt dasselbe wie bei
`text`-Blöcken. Folgen mehrere `auswahl`-Blöcke ohne Schritt dazwischen
aufeinander und erlaubt dein Werkzeug mehrere Fragen in einem Aufruf, stell
sie zusammen.

- Bleibt nach dem Einsetzen der Platzhalter nur eine Option übrig, stell die
  Rückfrage nicht und mach weiter, als hätte der Nutzer diese Option gewählt.
- Antwortet der Nutzer mit eigenem Text statt mit einer Option (z.B. über ein
  Feld „Andere“, das das Werkzeug selbst ergänzt), ordne den Text einer Option
  zu. Passt keine, stell die Rückfrage noch einmal.

## Abbruch

Ein Chat kann nach jedem Schritt enden, z.B. wenn das Nutzungslimit erreicht
ist, und du siehst nicht, wie viel davon übrig ist. Schreib deshalb so, dass
in `projekt:` nach einem Abbruch an jeder Stelle nur vollständige Dateien
liegen:

- Schreib eine Datei erst, wenn sie fertig und geprüft ist, und dann mit genau
  einem Aufruf, der sie ganz ersetzt. Zwischenstände, Entwürfe und
  Hilfsdateien gehören nach `arbeit:`, nie nach `projekt:`.
- Liegt eine große Datei schon fertig in `arbeit:`, schreib sie mit Angabe
  ihres Pfads statt mit ihrem Inhalt (z.B. `local_path` bei `project_write`).
  Dann ist der Aufruf kurz und kann nicht mit halbem Inhalt abbrechen.
- Hängen Dateien voneinander ab, schreib sie in einer Reihenfolge, nach der ein
  Abbruch dazwischen höchstens dazu führt, dass Arbeit wiederholt wird, nie
  dazu, dass etwas als erledigt gilt, das fehlt: zuerst die Inhalte, zuletzt
  die Datei, die sie als erledigt kennzeichnet (z.B. erst den Index, dann die
  Identifikation in `projekt:daten.xml`).

## Formate

Jede `.md`-Datei in `projekt:module/` und `projekt:gedaechtnis/` beginnt mit
einem Frontmatter, das ihr Format nennt. In `projekt:daten.xml` steht es im
Attribut `format` des Elements `<daten>`.

```markdown
---
format: 1
---
```

| Datei | Aktuelles Format |
|---|---|
| `projekt:daten.xml` | 1 |
| `projekt:module/{modul}/index.md` | 1 |
| `projekt:module/{modul}/info.md` | 1 |
| `projekt:gedaechtnis/{modul}/probleme.md` | 1 |
| `projekt:gedaechtnis/benutzererfahrung.md` | 1 |

- Schreib beim Anlegen das aktuelle Format aus der Tabelle hinein und behalte
  es beim Zurückschreiben unverändert.
- Schreib nur Dateien im aktuellen Format. Dateien in einem anderen Format
  liest du, schreibst sie aber nicht. Ältere bringt „Daten migrieren“ im Skill
  `verwalten` auf das aktuelle Format.
- Ist das Format niedriger als in der Tabelle, antworte einmal pro Chat, wobei
  `{modulname}` das Modul ist, mit dem du gerade arbeitest. Arbeitest du mit
  keinem Modul, lass den Platzhalter samt Leerzeichen davor weg:

  ```text
  Ein Teil deiner gespeicherten Daten hat noch ein älteres Format. Ich benutze sie, ändere sie aber nicht, bis du sie anpasst. Schreib dafür „/lernhelfer:verwalten Daten migrieren {modulname}“.
  ```

- Ist es höher, antworte einmal pro Chat und Datei:

  ```text
  Die Datei {pfad} hat ein neueres Format, als diese Fassung des Lernhelfers erwartet. Ich benutze sie, ändere sie aber nicht, damit nichts verloren geht. Aktualisiere das Lernhelfer-Plugin, dann kann ich sie wieder ändern.
  ```

## Module

Ein Modul ist ein Fach. Module gibt es nur im **Projekt**. Zu jedem Modul
gehören der Ordner `projekt:module/{modul}/` mit
`projekt:module/{modul}/info.md` und `projekt:module/{modul}/index.md` und der
gleichnamige Ordner `projekt:gedaechtnis/{modul}/` (Abschnitt „Gedächtnis“).
Dazu kann `projekt:vorrat/{modul}/` mit einem vorbereiteten Übungsblatt kommen,
das eine automatische Anweisung anlegt (eine geplante Anweisung des Projekts,
die einmal pro Woche ohne den Nutzer läuft). Die vorhandenen Module sind die
Unterordner von `projekt:module/` in der Projektübersicht. Den Ordnernamen
`{modul}` bildet „Modul bearbeiten“ beim Anlegen nach den Pfadregeln aus dem
Namen (z.B. „Lineare Algebra“ → `lineare-algebra`). Er ändert sich danach nie.
Den Namen `{modulname}`, wie der Nutzer ihn schreibt, enthält die erste
Überschrift jeder Datei des Moduls.

### `projekt:module/{modul}/info.md`

Beschreibt das Modul kurz (1 - 2 Sätze) und nennt seine Lernziele und die
Prüfung. Die Beschreibung hilft, das richtige Modul für eine Anfrage zu finden.
Beschreibung und Lernziele stammen aus dem Modulhandbuch oder vom Nutzer, die
Angaben zur Prüfung aus dem Modulhandbuch.

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

## Prüfung

- Form: Klausur
- Dauer: 90 Minuten
- Hilfsmittel: nicht programmierbarer Taschenrechner, 1 Formelblatt (A4)
```

Ohne Beschreibung steht unter „Beschreibung“ nur `Keine Beschreibung.`, ohne
Lernziele unter „Lernziele“ nur `Keine Lernziele.` Unter „Prüfung“ steht jede
Angabe, die das Modulhandbuch nennt, eine Zeile pro Angabe. Nennt es keine,
steht dort nur `Keine Angaben.`

### `projekt:module/{modul}/index.md`

Verzeichnis der Dateien des Moduls in `daten:` und ihrer Inhalte. Damit findest
du gezielt die Stellen, die du brauchst, statt ganze Dateien zu lesen, was viele
Token kostet. Welche Dateien zum Modul gehören, steht nur im Abschnitt
„Dateien“. Eine Datei darf zu mehreren Modulen gehören.

```markdown
---
format: 1
---

# Index: {modulname}

## Dateien

| Datei | Beschreibung |
|---|---|
| `daten:analysis/skript.pdf` | Skript, Kapitel 1–6 |
| `daten:analysis/Blatt 3.pdf` | Übungsblatt 3, 5 Aufgaben, ohne Lösungen |

## Stichwortverzeichnis

| Stichwort | Datei | Seite |
|---|---|---|
| Ableitung | `daten:analysis/skript.pdf` | 40–52 |
| Kettenregel | `daten:analysis/Blatt 3.pdf` | 2 A3 |
| Kettenregel | `daten:analysis/skript.pdf` | 45, 53 A2 |
```

- `Beschreibung`: Art und Inhalt der Datei in einer Zeile, `-`, solange sie
  noch nicht indiziert ist.
- `Seite`: Seiten der Datei. Die erste Seite ist `1`, unabhängig von der
  aufgedruckten Seitenzahl. Bei Aufgaben folgt die Nummer (`53 A2`). Bei
  Dateien ohne Seiten steht hier die Überschrift des Abschnitts.
- Eine Zeile pro Stichwort und Datei, alphabetisch nach Stichwort.

## Datenquelle

Die Datenquelle (`daten:`) enthält Skripte, Übungen, Altklausuren und das
Modulhandbuch des Nutzers. Sie ist freiwillig. Es gibt sie nur im **Projekt**
und nur, wenn `projekt:daten.xml` vorhanden ist. Ohne sie gibt es keinen Index
und kein Hochladen, Module und Gedächtnis gibt es trotzdem, und Unterlagen
hängt der Nutzer im Chat an. Zurzeit kann sie nur ein GitHub-Repository sein,
öffentlich oder privat.

### `projekt:daten.xml`

```xml
<daten format="1">
  <quelle>
    <art>{art}</art>
    <url>{url}</url>
    <identifizieren>{identifizieren}</identifizieren>
  </quelle>
  <dateien>
    <datei>
      <pfad>analysis/skript.pdf</pfad>
      <identifikation>3b18e512dba79e4c8300dd08aeb37f8e728b8dad</identifikation>
    </datei>
  </dateien>
</daten>
```

- `<quelle>`: was die Datenquelle ist und wie du sie liest (`<art>`), wo sie
  liegt (`<url>`) und wie du die aktuelle Identifikation einer Datei bestimmst
  (`<identifizieren>`). `<art>` und `<identifizieren>` sind Beschreibungen in
  Worten. Folge ihnen genau.
- `<dateien>`: der Stand der Datenquelle beim letzten Indizieren, eine
  `<datei>` pro Datei, mit Pfad ohne Präfix (`<pfad>`) und Identifikation
  (`<identifikation>`). Fehlt eine Datei der Datenquelle hier, ist sie neu.
  Hat sie in der Datenquelle eine andere Identifikation, ist sie geändert, und
  ihre Einträge im Index passen nicht mehr.
- Schreib `&` und `<` in Pfaden als `&amp;` und `&lt;`.

## Gedächtnis

`projekt:gedaechtnis/` spiegelt `projekt:module/`: Zu jedem
`projekt:module/{modul}/` gibt es `projekt:gedaechtnis/{modul}/` mit demselben
Ordnernamen. Dazu kommt `projekt:gedaechtnis/benutzererfahrung.md`, die zu
keinem Modul gehört (Abschnitt „Benutzererfahrung“).

`projekt:gedaechtnis/` ist die maßgebliche Quelle für das, was du über den
Nutzer weißt. Die eingebaute Erinnerungsfunktion von Claude darf aktiv sein,
ist aber nicht Teil des Lernhelfers. Bei Widerspruch gilt
`projekt:gedaechtnis/`.

### `projekt:gedaechtnis/{modul}/probleme.md`

Hält fest, womit der Nutzer im Modul Schwierigkeiten hat oder hatte. Zeilen
werden nie gelöscht, so bleibt der Verlauf erhalten.

```markdown
---
format: 1
---

# Probleme: {modulname}

| Thema | Beschreibung | Ursache | Verstanden | Historie |
|---|---|---|---|---|
| Kettenregel | Vergisst die innere Ableitung, z.B. bei sin(x²). | Erkennt nicht, wann eine Funktion verkettet ist. | - | 2026-10-08, 2026-10-10 |
| Partielle Integration | Wählt u und v' ungünstig, z.B. bei ∫ x·eˣ dx. | Prüft nicht, welcher Faktor durch Ableiten einfacher wird. | 2026-10-12 | 2026-10-05, 2026-10-09 |
| Leistungsanpassung | Versteht Konzept hinter Blindstromkompensation nicht | - | - | 2026-10-09 |
```

- `Ursache`: warum das Problem aus der Beschreibung entsteht, in einem Satz
  (z.B. fehlendes Vorwissen, eine falsche Vorstellung oder eine
  Verwechslung). Solange du sie nicht kennst, steht dort `-`.
- `Verstanden`: das Datum, an dem der Nutzer zuletzt gezeigt hat, dass er das
  Thema verstanden hat, sonst `-`.
- `Historie`: die Tage, an denen der Nutzer mit dem Thema Probleme hatte,
  aufsteigend, jeder Tag einmal.

Fehlt die Datei, gilt sie als leer. Leg sie dann vor dem ersten Eintrag mit
dieser Vorlage an, ohne Zeilen unter der Kopfzeile der Tabelle.

## Benutzererfahrung

### `projekt:gedaechtnis/benutzererfahrung.md`

Hält fest, wo der Umgang mit dem Lernhelfer hakt. Der Nutzer gibt die Datei mit
„Benutzererfahrung teilen“ an die Person weiter, die den Lernhelfer verbessert.
„Initialisieren“ legt sie an, und an ihr erkennst du ein eingerichtetes Projekt
(Abschnitt „Betriebsart“). Jede Fähigkeit außer „Initialisieren“ und „Testen“
pflegt sie im **Projekt**, solange du nach ihr arbeitest. Aufbau:

```markdown
---
format: 1
---

# Benutzererfahrung

| Datum | Fähigkeit | Art | Was passiert ist |
|---|---|---|---|
| 2026-10-10 | Hochladen | Bedienung | Wollte ein Skript hochladen, ohne es im Chat anzuhängen. |
```

- **Eintragen:** Häng eine Zeile an, sobald eines davon passiert:
  - `Bedienung`: Der Nutzer versteht einen Ablauf oder eine Nachricht nicht,
    fragt mehrfach nach, macht etwas anders als vorgesehen oder ist
    unzufrieden.
  - `Anweisung`: Keine Fähigkeit passt zur Anfrage, eine Anweisung ist
    mehrdeutig oder eine vorgegebene Nachricht passt nicht zur Situation.
  - `Technik`: Ein Werkzeug schlägt fehl oder verhält sich anders, als die
    Fähigkeit annimmt.
  - `Wunsch`: Der Nutzer wünscht sich etwas vom Lernhelfer oder schlägt eine
    Verbesserung vor.
- **Inhalt:** `Fähigkeit` mit dem Namen der Fähigkeit, nach der du arbeitest.
  Beschreib in einem oder zwei Sätzen, was passiert ist, so konkret, dass
  jemand ohne den Chat den Lernhelfer gezielt verbessern kann. Schreib keine
  persönlichen Daten und keine Inhalte aus Skripten oder Übungen hinein. Die
  Datei ist zum Weitergeben gedacht.
- **Wann schreiben:** zusammen mit den übrigen Schreibvorgängen der Fähigkeit,
  spätestens an ihrem Ende. Ändere und lösch vorhandene Zeilen nur, wenn eine
  Fähigkeit es verlangt.
