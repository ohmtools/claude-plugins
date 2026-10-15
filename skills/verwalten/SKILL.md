---
name: verwalten
description: "Verwaltung des Lernhelfers (Lernumgebung für Oberstufe, Berufsschule und Studium), nur in Claude.ai-Projekten: richtet ein Projekt als Lernhelfer ein und verbindet es mit einer Datenquelle (GitHub-Repository), legt Fächer an, benennt sie um und löscht sie, lädt im Chat angehängte Dateien in die Datenquelle hoch, ordnet Dateien Fächern zu, indiziert, übernimmt Lernziele aus dem Modulhandbuch, passt gespeicherte Daten an ein neues Format an, gibt Erfahrungen mit dem Lernhelfer als Datei weiter, testet die Umgebung und entwickelt den Lernhelfer weiter. Verwende diesen Skill, wenn der Nutzer schreibt „Richte dieses Projekt als Lernhelfer ein“, „Leg ein Fach an“, „Lade … hoch“, „Indiziere“, „Übernimm die Lernziele für …“, „Daten migrieren“, „Benutzererfahrung teilen“, „Teste den Lernhelfer“, „Teste das Indizieren“ oder „Exportieren“, wenn er ein Fach oder dessen Dateien verwalten oder den Lernhelfer selbst ändern will."
---

# Lernhelfer – Verwalten

Dieser Skill verwaltet das Projekt, seine Fächer, die Datenquelle und den
Lernhelfer selbst. Er steht nur in einem Claude.ai-Projekt zur Verfügung, ob
es schon als Lernhelfer eingerichtet ist oder nicht.

Hast du keine Werkzeuge für Projektdateien (Projektübersicht, Lesen,
Schreiben), führ keine Fähigkeit dieses Skills aus und antworte:

```text
Das geht nur in einem Claude.ai-Projekt. Erstelle in Claude.ai ein Projekt, starte darin einen neuen Chat und schreib „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“. Hier im Chat helfe ich dir trotzdem beim Lernen, häng mir dafür einfach deine Unterlagen an.
```

## Was ist zu tun?

Lies die passende Fähigkeit vollständig und führe sie aus, wenn sie laut
Spalte „Verfügbar“ zur Verfügung steht.

| Situation | Fähigkeit | Lies | Verfügbar |
|---|---|---|---|
| Projekt als Lernhelfer einrichten oder eine Datenquelle nachtragen („Richte dieses Projekt als Lernhelfer ein“) | Initialisieren | `skill:faehigkeiten/initialisieren.md` | immer |
| Fach anlegen, umbenennen oder löschen, Lernziele aus dem Modulhandbuch übernehmen, Dateien einem Fach zuordnen, ersetzen oder herausnehmen, fragen, welche Fächer es gibt, was zu einem Fach gehört oder welche Dateien zu keinem Fach gehören | Modul bearbeiten | `skill:faehigkeiten/modul-bearbeiten.md` | eingerichtetes Projekt |
| Im Chat angehängte Dateien in die Datenquelle hochladen („Lade … hoch“) | Hochladen | `skill:faehigkeiten/hochladen.md` | Datenquelle |
| Neue und geänderte Dateien der Datenquelle indizieren („Indiziere“) | Indizieren | `skill:faehigkeiten/indizieren.md` | Datenquelle |
| Gespeicherte Daten an ein neues Format anpassen („Daten migrieren“) | Daten migrieren | `skill:faehigkeiten/migrieren.md` | eingerichtetes Projekt |
| Benutzererfahrung teilen | Benutzererfahrung teilen | `skill:faehigkeiten/benutzererfahrung-teilen.md` | eingerichtetes Projekt |
| Den Lernhelfer selbst verbessern oder exportieren | Entwicklung | `skill:faehigkeiten/entwicklung.md` | immer |
| Testen, ob der Lernhelfer in dieser Umgebung funktioniert, oder nur das Indizieren testen | Test | `skill:faehigkeiten/test.md` | eingerichtetes Projekt |

- `immer`: in jedem Claude.ai-Projekt.
- `eingerichtetes Projekt`: nur im **Projekt** (Abschnitt „Betriebsart“).
- `Datenquelle`: nur im **Projekt** mit `projekt:daten.xml` (Abschnitt
  „Datenquelle“).

## Grundregeln

- Sprich Deutsch. Fachbegriffe dürfen englisch bleiben, aber bilde keine
  gemischten Satzstrukturen. Das gilt für Antworten und Dateien.
- Lies Projektdateien, die du brauchst, vollständig. Suchtreffer dienen nur
  dazu, die richtige Datei zu finden.
- Die Dateien der Skills kannst du nicht ändern. Den Lernhelfer selbst ändert
  nur „Entwicklung“, und zwar an einer Kopie.
- Ist eine Funktion als „noch nicht ausgearbeitet“ markiert, sag das dem Nutzer
  offen, statt dir einen Ablauf auszudenken.
- Fähigkeiten in `skill:faehigkeiten/` geben dir eine Rolle. Sie gilt nur,
  solange du nach dieser Fähigkeit arbeitest.

## Pfade

Jeder Pfad in diesem Skill beginnt mit einem Präfix, das sagt, wo die Datei
liegt:

| Präfix | Ort |
|---|---|
| `skill:` | Ordner dieses Skills, in dem auch `skill:SKILL.md` liegt. Lies dort mit deinem Werkzeug zum Lesen von Dateien. Ändern kannst du dort nichts. |
| `plugin:` | Ordner des installierten Plugins, zwei Ebenen über dem Ordner dieses Skills. |
| `projekt:` | Projektdateien des Claude.ai-Projekts. Lies und schreib sie mit den Werkzeugen für Projektdateien. Es gibt sie nur, wenn der Chat Teil eines Projekts ist. |
| `daten:` | Datenquelle des Nutzers mit Skripten, Übungen, Altklausuren und Modulhandbuch, z.B. ein GitHub-Repository. Wie du sie liest, steht in `projekt:daten.xml`. |
| `arbeit:` | Arbeitsverzeichnis deiner Arbeitsumgebung (z.B. `/home/claude`). |

Das Präfix gehört nicht zum Pfad. Lass es weg, wenn du eine Datei öffnest oder
schreibst. Nennst du dem Nutzer eine Datei, lass es ebenfalls weg und sag bei
Bedarf, wo sie liegt: `projekt:` in den Projektdateien, `daten:` in seiner
Datenquelle.

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
und schreibst nie ins Projekt.

„Initialisieren“ prüft die Ausgangslage selbst. Verlangt der Nutzer in einem
Projekt, das noch nicht eingerichtet ist, eine andere Fähigkeit, die laut
Tabelle „Was ist zu tun?“ ein eingerichtetes Projekt oder eine Datenquelle
braucht, führ sie nicht aus und antworte:

```text
Dieses Projekt ist noch nicht als Lernhelfer eingerichtet. Schreib „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“, dann merke ich mir hier deine Fächer, Unterlagen und Schwierigkeiten.
```

## Projektstruktur

| Ort | Inhalt |
|---|---|
| `projekt:daten.xml` | Datenquelle und Stand ihrer Dateien beim letzten Indizieren |
| `projekt:module/` | Ein Modul pro Fach: Beschreibung, Lernziele, Index |
| `projekt:gedaechtnis/` | Was du dir pro Modul über den Nutzer merkst, dazu Erfahrungen mit dem Lernhelfer |
| `projekt:test/` | Nur während eines Tests, danach gelöscht |
| `daten:` | Skripte, Übungen, Altklausuren und Modulhandbuch des Nutzers |

Wer wohin schreibt:

- Ins Projekt schreibst du nur im **Projekt**.
- Fähigkeiten dieses Skills dürfen überall im Projekt schreiben und mit
  mehreren Modulen arbeiten. „Test“ schreibt nur in `projekt:test/`.
- In `daten:` schreibt nur „Hochladen“, dazu „Test“ in einem eigenen Zweig,
  den er wieder löscht.
- Der Skill `lernen` schreibt nur `projekt:gedaechtnis/{modul}/probleme.md`
  und `projekt:gedaechtnis/benutzererfahrung.md`.
- Jede Fähigkeit außer „Initialisieren“ und „Test“ hängt Zeilen an
  `projekt:gedaechtnis/benutzererfahrung.md` an (Abschnitt
  „Benutzererfahrung“).

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
dieser Reihenfolge. Hast du keine Auswahlfelder, gib die Frage als Text aus und
die Optionen als nummerierte Liste darunter. Warte in beiden Fällen auf die
Antwort. Für Platzhalter gilt dasselbe wie bei `text`-Blöcken.

## Dateien und Pfade

- Schreib Namen von Dateien und Ordnern, die du in `projekt:` anlegst, klein,
  Wörter mit Bindestrich, ohne Umlaute und ß (ä → ae, ö → oe, ü → ue,
  ß → ss). Sie enden auf `.md`, nur `projekt:daten.xml` nicht.
- Schreib neue Projektdateien immer mit vollständigem Pfad (z.B.
  `projekt:module/mathematik/index.md`), nie nur mit Dateinamen.
- Ordner entstehen, sobald die erste Datei darin geschrieben wird. Leg keine
  Dateien an, nur damit ein Ordner entsteht.
- Nenne Dateien in `daten:` immer genau mit ihrem Pfad in der Datenquelle
  (z.B. `daten:analysis/Blatt 3.pdf`).
- Leg Arbeitsordner und Dateien zum Herunterladen unter `arbeit:` an, nicht in
  `/tmp`.
- Im Chat angehängte Dateien liegen in deiner Arbeitsumgebung, meist unter
  `/root/.claude/uploads/` mit einem Präfix aus acht Hex-Zeichen und
  Bindestrich vor dem Originalnamen (z.B. `7a57d930-Blatt 3.pdf`). Such sie
  z.B. mit `find / -xdev -name '*{name}' 2>/dev/null`.

## Schreiben

- Jede Änderung an einer Projektdatei kostet Kontext-Cache für alle Chats im
  Projekt. Bündle deshalb Änderungen, statt nach jeder Nachricht zu schreiben,
  z.B. am Ende eines Lernblocks.
- Lies vor dem Schreiben die aktuelle Fassung und schreib sie vollständig
  zurück. Verlier nichts, was nicht bewusst entfernt werden soll.

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
Die vorhandenen Module sind die Unterordner von `projekt:module/` in der
Projektübersicht. Den Ordnernamen `{modul}` bildet „Modul bearbeiten“ beim
Anlegen nach den Pfadregeln aus dem Namen (z.B. „Lineare Algebra“ →
`lineare-algebra`). Er ändert sich danach nie. Den Namen `{modulname}`, wie der
Nutzer ihn schreibt, enthält die erste Überschrift jeder Datei des Moduls.

### `projekt:module/{modul}/info.md`

Beschreibt das Modul kurz und nennt seine Lernziele. Die Beschreibung hilft,
das richtige Modul für eine Anfrage zu finden. Beides stammt aus dem
Modulhandbuch oder vom Nutzer.

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
```

Ohne Beschreibung steht unter „Beschreibung“ nur `Keine Beschreibung.`, ohne
Lernziele unter „Lernziele“ nur `Keine Lernziele.`

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
| `daten:analysis/skript.pdf` | Skript, Kapitel 1–6, 120 Seiten |
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

Die Datenquelle (`daten:`) enthält die Dateien des Nutzers. Sie ist optional:
Ohne sie gibt es keinen Index und kein Hochladen, Module und Gedächtnis gibt
es trotzdem. Zurzeit kann sie nur ein GitHub-Repository sein, öffentlich oder
privat. „Initialisieren“ legt `projekt:daten.xml` an, „Indizieren“ hält
`<dateien>` darin aktuell.

Verlangt der Nutzer im **Projekt** eine Fähigkeit, die laut Tabelle „Was ist
zu tun?“ eine Datenquelle braucht, und fehlt `projekt:daten.xml`, führ sie
nicht aus und antworte:

```text
Dafür brauchst du eine Datenquelle, in der deine Skripte und Übungen liegen, z.B. ein GitHub-Repository. Schreib „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“, dann richten wir sie ein.
```

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

- `<art>` und `<identifizieren>` beschreiben in Worten, wie du die
  Datenquelle liest und die aktuelle Identifikation einer Datei bestimmst.
  „Initialisieren“ schreibt sie aus Vorlagen. Folge ihnen genau.
- `<dateien>` ist der Stand der Datenquelle beim letzten Indizieren: eine
  `<datei>` pro Datei, mit Pfad ohne Präfix und Identifikation. Fehlt eine
  Datei der Datenquelle hier, ist sie neu. Hat sie in der Datenquelle eine
  andere Identifikation, ist sie geändert.
- Schreib `&` und `<` in Pfaden als `&amp;` und `&lt;`.

### Dateien der Datenquelle

- Dateien und Ordner, deren Name mit einem Punkt beginnt (z.B. `.gitignore`,
  `.github/`), gehören nicht zu den Daten. Lass sie überall weg.
- Die Dateien eines Moduls liegen am besten im Ordner mit seinem Ordnernamen
  (`daten:{modul}/`). Neue Dateien darin ordnet „Indizieren“ dem Modul selbst
  zu. Dateien an anderen Stellen ordnet der Nutzer mit „Modul bearbeiten“ zu.
- Das Modulhandbuch (an der Schule: Lehrplan) ist jede Datei der Datenquelle,
  deren Name `Modulhandbuch` oder `Lehrplan` enthält (Groß- und
  Kleinschreibung egal, z.B. `Modulhandbuch Informatik.pdf`,
  `Rahmenlehrplan Mechatroniker.pdf`). Es gehört zu keinem Modul und steht in
  keinem Index. Aus ihm stammen Beschreibung und Lernziele in
  `projekt:module/{modul}/info.md`.
- Nicht zugeordnet ist jede übrige Datei der Datenquelle, die in keinem
  Abschnitt „Dateien“ eines Index steht.

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

| Thema | Beschreibung | Verstanden | Historie |
|---|---|---|---|
| Kettenregel | Vergisst die innere Ableitung, z.B. bei sin(x²). | - | 2026-10-08, 2026-10-10 |
| Partielle Integration | Wählt u und v' ungünstig, z.B. bei ∫ x·eˣ dx. | 2026-10-12 | 2026-10-05, 2026-10-09 |
```

- `Verstanden`: das Datum, an dem der Nutzer zuletzt gezeigt hat, dass er das
  Thema verstanden hat, sonst `-`.
- `Historie`: die Tage, an denen der Nutzer mit dem Thema Probleme hatte,
  aufsteigend, jeder Tag einmal.

Fehlt die Datei, gilt sie als leer. Leg sie dann vor dem ersten Eintrag mit
dieser Vorlage an, ohne Zeilen unter der Kopfzeile.

## Benutzererfahrung

`projekt:gedaechtnis/benutzererfahrung.md` hält fest, wo der Umgang mit dem
Lernhelfer hakt. Der Nutzer gibt die Datei mit „Benutzererfahrung teilen“ an
die Person weiter, die den Lernhelfer verbessert. „Initialisieren“ legt sie
an, und an ihr erkennst du ein eingerichtetes Projekt (Abschnitt
„Betriebsart“). Jede Fähigkeit außer „Initialisieren“ und „Test“ pflegt sie im
**Projekt**, solange du nach ihr arbeitest. Aufbau:

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
  - `Fähigkeit`: Keine Fähigkeit passt zur Anfrage, eine Anweisung ist
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
