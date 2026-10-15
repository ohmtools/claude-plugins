---
name: verwalten
description: "Verwaltung des Lernhelfers (Lernumgebung für die Schule), nur in Claude.ai-Projekten: richtet ein Claude.ai-Projekt als Lernhelfer ein, passt gespeicherte Daten an ein neues Format an, gibt die notierten Erfahrungen mit dem Lernhelfer als Datei weiter, testet, ob der Lernhelfer in der Umgebung funktioniert, und entwickelt ihn weiter. Verwende diesen Skill, wenn der Nutzer schreibt „Richte dieses Projekt als Lernhelfer ein“, „Daten migrieren“, „Benutzererfahrung teilen“, „Teste den Lernhelfer“, „Teste das Indizieren“, „Exportieren“ oder den Lernhelfer selbst ändern will."
---

# Lernhelfer – Verwalten

Dieser Skill verwaltet das Projekt und den Lernhelfer selbst. Er steht nur in
einem Claude.ai-Projekt zur Verfügung, ob es schon als Lernhelfer
eingerichtet ist oder nicht.

Hast du keine Werkzeuge für Projektdateien (Projektübersicht, Lesen,
Schreiben), führ keine Fähigkeit dieses Skills aus und antworte:

```text
Das geht nur in einem Claude.ai-Projekt. Erstelle in Claude.ai ein Projekt, starte darin einen neuen Chat und schreib „Richte dieses Projekt als Lernhelfer ein“. Hier im Chat helfe ich dir trotzdem beim Lernen, häng mir dafür einfach deine Unterlagen an.
```

## Was ist zu tun?

Lies die passende Fähigkeit vollständig und führe sie aus. Braucht sie ein
eingerichtetes Projekt und arbeitest du im Chat, antworte wie im Abschnitt
„Betriebsart“.

| Situation | Fähigkeit | Lies | Verfügbar |
|---|---|---|---|
| Projekt als Lernhelfer einrichten („Richte dieses Projekt als Lernhelfer ein“) | Initialisieren | `skill:referenzen/initialisieren.md` | immer |
| Gespeicherte Daten an ein neues Format anpassen („Daten migrieren“) | Daten migrieren | `skill:referenzen/migrieren.md` | eingerichtetes Projekt |
| Benutzererfahrung teilen | Benutzererfahrung teilen | `skill:referenzen/benutzererfahrung-teilen.md` | eingerichtetes Projekt |
| Den Lernhelfer selbst verbessern oder exportieren | Entwicklung | `skill:referenzen/entwicklung.md` | immer |
| Testen, ob der Lernhelfer in dieser Umgebung funktioniert, oder nur das Indizieren testen | Test | `skill:referenzen/test.md` | eingerichtetes Projekt |

## Pfade

Jeder Pfad in diesem Skill beginnt mit einem Präfix, das sagt, wo die Datei
liegt:

| Präfix | Ort |
|---|---|
| `skill:` | Ordner dieses Skills, in dem auch `skill:SKILL.md` liegt. Lies dort mit deinem Werkzeug zum Lesen von Dateien. Ändern kannst du dort nichts. |
| `projekt:` | Projektdateien des Claude.ai-Projekts. Lies und schreib sie mit den Werkzeugen für Projektdateien. Über die Projektseite hochgeladene Dateien liegen dort unter ihrem Namen (`projekt:{name}`). |
| `plugin:` | Ordner des installierten Plugins, zwei Ebenen über dem Ordner dieses Skills. |
| `arbeit:` | Arbeitsverzeichnis deiner Arbeitsumgebung (z.B. `/home/claude`). |

Das Präfix gehört nicht zum Pfad. Lass es weg, wenn du eine Datei öffnest,
schreibst oder dem Nutzer nennst.

## Betriebsart

Du arbeitest in einer von zwei Betriebsarten. Bestimme sie einmal pro Chat,
bevor du eine Fähigkeit ausführst, die laut Tabelle „Was ist zu tun?“ ein
eingerichtetes Projekt braucht, oder bevor du beim Lernen mit einem Fach
arbeitest.
„Initialisieren“ prüft die Ausgangslage selbst.

1. Hast du keine Werkzeuge für Projektdateien (Projektübersicht, Lesen,
   Schreiben), arbeitest du im **Chat**.
2. Sonst hol die Liste aller Projektdateien mit einem Aufruf der
   Projektübersicht und berücksichtige alle ihre Listen. Liegt
   `projekt:gedaechtnis/benutzererfahrung.md` darin, arbeitest du im **Projekt**.
   Sonst ist das Projekt noch nicht eingerichtet, und du arbeitest im
   **Chat**.

Im **Projekt** steht alles zur Verfügung. Im **Chat** gibt es keine Fächer,
keinen Index und kein Gedächtnis: Du hilfst beim Lernen mit Dateien, die der
Nutzer im Chat anhängt. Du schreibst dann nie ins Projekt.

Verlangt der Nutzer im **Chat** eine Fähigkeit, die ein eingerichtetes Projekt
braucht, führ sie nicht aus und antworte. Ohne Werkzeuge für Projektdateien:

```text
Das geht nur in einem Claude.ai-Projekt, das als Lernhelfer eingerichtet ist. Dort merke ich mir deine Fächer, Unterlagen und Schwierigkeiten. Erstelle dafür in Claude.ai ein Projekt, starte darin einen neuen Chat und schreib „Richte dieses Projekt als Lernhelfer ein“. Hier im Chat helfe ich dir trotzdem beim Lernen, häng mir dafür einfach deine Unterlagen an.
```

In einem Projekt, das noch nicht eingerichtet ist:

```text
Dieses Projekt ist noch nicht als Lernhelfer eingerichtet. Schreib „Richte dieses Projekt als Lernhelfer ein“, dann merke ich mir hier deine Fächer, Unterlagen und Schwierigkeiten. Bis dahin helfe ich dir mit Dateien, die du mir im Chat anhängst.
```

## Projektstruktur

| Ordner | Inhalt |
|---|---|
| `projekt:module/` | Ein Modul pro Fach: welche Dateien dazugehören, Index, Lernziele |
| `projekt:gedaechtnis/` | Was du dir pro Modul über den Nutzer merkst, dazu Erfahrungen mit dem Lernhelfer |
| `projekt:test/` | Nur während eines Tests, danach gelöscht |
| ohne Ordner | Skripte, Übungen und Modulhandbuch, über die Projektseite hochgeladen |

Wer wohin schreibt:

- Ins Projekt schreibst du nur im **Projekt**.
- Fähigkeiten des Skills `verwalten` dürfen überall im Projekt schreiben.
  „Test“ schreibt nur in `projekt:test/`.
- Fähigkeiten des Skills `lernen` arbeiten mit höchstens einem Modul
  (Abschnitt „Ein Modul auf einmal“).
- Jede Fähigkeit außer „Initialisieren“ und „Test“ hängt Zeilen an
  `projekt:gedaechtnis/benutzererfahrung.md` an (Abschnitt „Benutzererfahrung“).
- Über die Projektseite hochgeladene Dateien ändert und löscht nur der Nutzer.
  Brauchst du dort eine Änderung, bitte ihn darum.

## Grundregeln

- Sprich Deutsch. Fachbegriffe dürfen englisch bleiben, aber bilde keine
  gemischten Satzstrukturen. Das gilt für Antworten und Dateien.
- Lies Dateien, die du brauchst, vollständig. Suchtreffer dienen nur dazu, die
  richtige Datei zu finden.
- Die Dateien der Skills kannst du nicht ändern. Den Lernhelfer selbst ändert
  nur „Entwicklung“ im Skill `verwalten`, und zwar an einer Kopie.
- Ist eine Funktion als „noch nicht ausgearbeitet“ markiert, sag das dem Nutzer
  offen, statt dir einen Ablauf auszudenken.
- Fähigkeiten in `skill:referenzen/` geben dir eine Rolle. Sie gilt nur, solange du
  nach dieser Fähigkeit arbeitest.

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

- Schreib Namen von Dateien und Ordnern, die du anlegst, klein, Wörter mit
  Bindestrich. Dateien, die du anlegst, enden auf `.md`.
- Verwende in Pfaden, die du anlegst, keine Umlaute und kein ß: ä → ae,
  ö → oe, ü → ue, ß → ss.
- Über die Projektseite hochgeladene Dateien nennst du immer genau mit dem
  Namen aus der Projektübersicht.
- Ordner entstehen, sobald die erste Datei darin geschrieben wird. Leg keine
  Dateien an, nur damit ein Ordner entsteht.
- Schreib neue Dateien immer mit vollständigem Pfad (z.B.
  `projekt:module/mathematik/index.md`), nie nur mit Dateinamen.
- Leg Arbeitsordner und Dateien zum Herunterladen unter `arbeit:` an, nicht in
  `/tmp`.

## Schreiben

- Jede Änderung an einer Projektdatei kostet Kontext-Cache für alle Chats im
  Projekt. Bündle deshalb Änderungen, statt nach jeder Nachricht zu schreiben,
  z.B. am Ende eines Lernblocks.
- Lies vor dem Schreiben die aktuelle Fassung und schreib sie vollständig
  zurück. Verlier nichts, was nicht bewusst entfernt werden soll.

## Formate

Jede `.md`-Datei in `projekt:module/` und `projekt:gedaechtnis/` beginnt mit einem
Frontmatter, das ihr Format nennt:

```markdown
---
format: 1
---
```

| Datei | Aktuelles Format |
|---|---|
| `projekt:module/{modul}/index.md` | 1 |
| `projekt:module/{modul}/dateien.md` | 1 |
| `projekt:module/{modul}/lernziele.md` | 1 |
| `projekt:gedaechtnis/{modul}/probleme.md` | 1 |
| `projekt:gedaechtnis/{modul}/verstanden.md` | 1 |
| `projekt:gedaechtnis/benutzererfahrung.md` | 1 |

- Schreib beim Anlegen das aktuelle Format aus der Tabelle hinein und behalte
  das Frontmatter beim Zurückschreiben unverändert.
- Schreib nur Dateien im aktuellen Format. Dateien in einem anderen Format
  liest du, schreibst sie aber nicht. Ältere bringt „Daten migrieren“ auf das
  aktuelle Format.
- Ist das Format niedriger als in der Tabelle, antworte (einmal pro Chat), wobei
  `{modulname}` das Modul ist, mit dem du gerade arbeitest. Arbeitest du mit
  keinem Modul, lass den Platzhalter samt Leerzeichen davor weg:

  ```text
  Ein Teil deiner gespeicherten Daten hat noch ein älteres Format. Ich benutze sie, ändere sie aber nicht, bis du sie anpasst. Schreib dafür „Daten migrieren {modulname}“.
  ```

- Ist es höher, antworte (einmal pro Chat und Datei):

  ```text
  Die Datei {pfad} hat ein neueres Format, als diese Fassung des Lernhelfers erwartet. Ich benutze sie, ändere sie aber nicht, damit nichts verloren geht. Aktualisiere das Lernhelfer-Plugin, dann kann ich sie wieder ändern.
  ```

## Ein Modul auf einmal

Ein Modul ist ein Fach. Seine Daten liegen in `projekt:module/{modul}/` und
`projekt:gedaechtnis/{modul}/`, und es gibt Module nur im **Projekt**. Fähigkeiten des
Skills `lernen` und „Daten migrieren“ arbeiten immer mit höchstens einem
Modul. Sie lesen und schreiben nur Dateien in `projekt:module/{modul}/` und
`projekt:gedaechtnis/{modul}/` dieses Moduls, dazu `projekt:gedaechtnis/benutzererfahrung.md`. Lesen dürfen sie außerdem die Dateien aus
`projekt:module/{modul}/dateien.md` des Moduls und das Modulhandbuch, aus dem sie nur den Teil zu
diesem Modul nutzen. Eine Datei darf zu mehreren Modulen gehören.

- **Modul bestimmen:** Die vorhandenen Module sind die Unterordner von
  `projekt:module/` in der Projektübersicht. Ihre Namen stehen in der ersten
  Überschrift von `projekt:module/{modul}/dateien.md` (`# Dateien: {modulname}`). Nur
  dafür darfst du `projekt:module/{modul}/dateien.md` anderer Module lesen und nutzt nichts außer der
  Überschrift. Was bei einem unklaren Modul zu tun ist, steht in der
  jeweiligen Fähigkeit.
- **Nicht zugeordnete Dateien:** Nur um auf Nachfrage des Nutzers die Dateien
  zu finden, die noch zu keinem Modul gehören, darfst du die Spalte `Datei` in
  `projekt:module/{modul}/dateien.md` aller Module lesen.
- **Mehrere Module in einer Anfrage:** Bearbeite nur das zuerst genannte und
  beende deine Antwort mit dieser Nachricht, wobei `{module}` die übrigen Namen
  durch Kommas getrennt sind:

  ```text
  Ich arbeite immer nur mit einem Fach auf einmal. Sag mir danach noch einmal Bescheid für {module}.
  ```

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
| 2026-10-10 | Modul bearbeiten | Bedienung | Hängte ein Skript zweimal im Chat an, statt es über die Projektseite hochzuladen. |
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
