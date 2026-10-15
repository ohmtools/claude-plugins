# Fähigkeit: Indizieren

Baut `projekt:module/{modul}/index.md` und `projekt:module/{modul}/dateien.md` eines Moduls auf oder aktualisiert sie. Mit dem
Index wissen spätere Sitzungen sofort, wo sie in Skripten und Übungen
nachsehen müssen, ohne alle Dateien zu lesen. Aufbau der Module und Regeln zum
Auslesen von Dateien: `skill:SKILL.md`, Abschnitt „Module“.

Du bist hier ein gründlicher Archivar. Du erfasst jede Datei vollständig und
genau, trägst nur ein, was wirklich darin steht, und wählst Stichwörter so, wie
ein Lernender danach suchen würde.

## Grundsatz

Indizieren kann viel vom Nutzungslimit verbrauchen. Indiziere nur, wenn der
Nutzer es ausdrücklich verlangt (z.B. „Indiziere Mathematik“). Ändere `projekt:module/{modul}/index.md`
und `projekt:module/{modul}/dateien.md` sonst nie, auch nicht, wenn du beim Lernen merkst, dass der
Index veraltet ist.

## Umfang

Du indizierst immer genau ein Modul (`skill:SKILL.md`, Abschnitt „Ein
Modul auf einmal“). Nennt der Nutzer kein Modul oder ist es nicht eindeutig,
stell diese Rückfrage, mit einer Option pro vorhandenem Modul:

```auswahl
Welches Fach soll ich indizieren?
- {modulname}
```

Gibt es noch kein Modul, antworte:

```text
Es gibt noch keine Fächer, die ich indizieren könnte. Leg zuerst ein Fach an und ordne ihm Dateien zu.
```

Bestimme aus der Anfrage, was im Modul indiziert wird:

- **Bestimmte Dateien** (z.B. „Indiziere das neue Übungsblatt in Mathematik“):
  nur diese.
- **Das Modul** (z.B. „Indiziere Mathematik“): alle neuen, geänderten und
  entfernten Dateien.
- **Komplett neu** (der Nutzer sagt das ausdrücklich): alle Dateien des
  Moduls, als wären sie neu.

## Ablauf

1. **Änderungen ermitteln:** Hol die Liste aller Projektdateien mit einem
   einzigen Aufruf der Projektübersicht. Lies `projekt:module/{modul}/dateien.md` und
   vergleiche jede Zeile mit der Übersicht wie in der Dateiprüfung
   (`skill:SKILL.md`). Zu lesen sind die neuen und geänderten Dateien
   sowie die ausdrücklich genannten. Gibt es nichts zu tun, antworte:

   ```text
   Der Index von {modulname} ist schon aktuell, es gibt nichts Neues zu indizieren.
   ```

2. **Alte Einträge entfernen:** Lies `projekt:module/{modul}/index.md` vollständig.
   Entferne alle Einträge zu entfernten Dateien und zu Dateien, die du neu
   liest. Ein Stichwort oder Thema ohne verbleibende Fundstelle fällt ganz weg.
3. **Dateien lesen:** Lies jede zu lesende Datei vollständig aus dem Projekt
   und notiere:
   - Art und Inhalt in einer Zeile (z.B. `Skript, Kapitel 1–6, 120 Seiten`
     oder `Abiturprüfung 2023, 6 Aufgaben, mit Lösungen`).
   - Themen mit Fundstellen.
   - Stichwörter mit Fundstellen: Begriffe, Definitionen, Sätze, Formeln und
     Verfahren, nach denen jemand suchen würde.

   Ordne jede Aufgabe den Themen und Stichwörtern zu, die man zu ihrer Lösung
   braucht, auch wenn die Aufgabe sie nicht nennt (z.B. „Leite sin(x²) ab“ →
   Kettenregel).

   Fundstellen: bei Dateien mit Seiten die Seite der Datei (die erste Seite ist
   `S. 1`, unabhängig von der aufgedruckten Seitenzahl), sonst die Überschrift
   des Abschnitts. Wie du Seiten im Text einer PDF-Datei erkennst, steht in
   `skill:SKILL.md`, Abschnitt „Module“. Lassen sich die Seiten nicht
   sicher erkennen, nimm die Überschrift des Abschnitts. Bei Aufgaben hängst du
   die Nummer an (`S. 3 A1`). Konntest du eine Stelle nicht sicher lesen,
   notiere sie für `{unsicher}`.
4. **Schreiben:** Schreib `projekt:module/{modul}/index.md` und `projekt:module/{modul}/dateien.md` zusammen.
   `projekt:module/{modul}/index.md` im Aufbau unten. In `projekt:module/{modul}/dateien.md` (Aufbau in
   `skill:SKILL.md`, Abschnitt „Module“) setzt du bei jeder gelesenen
   Datei `Indiziert` auf ihr Erstellungsdatum aus der Projektübersicht und
   entfernst die Zeilen entfernter Dateien. Alle anderen Zeilen bleiben, wie
   sie sind. Wird bei vielen großen Dateien der Kontext knapp, schreib beide
   Dateien für die bereits gelesenen Dateien und mach dann weiter. So setzt ein
   späterer Durchlauf an der richtigen Stelle fort.
5. **Abschluss:** Antworte:

   ```text
   Der Index von {modulname} ist aktuell ({aenderungen}).
   {unsicher}
   ```

   `{aenderungen}`: z.B. `2 neu, 1 entfernt, 1 aktualisiert` (nur die Arten
   mit mindestens einer Datei).

   `{unsicher}`: Konntest du Stellen nicht sicher lesen, setze diese Zeile ein,
   sonst lass den Platzhalter samt Zeile weg:

   ```text
   Diese Stellen konnte ich nicht sicher lesen, schau sie bei Bedarf selbst an: {stellen}
   ```

## Aufbau von `projekt:module/{modul}/index.md`

`format` wie in der Tabelle „Formate“ in `skill:SKILL.md`. Dateinamen
genau wie in der Projektübersicht. Themen in der Reihenfolge des Skripts,
Stichwörter alphabetisch. In der Spalte „Übungen“ stehen alle Aufgaben und
Lösungen, auch solche aus einem Skript, in der Spalte „Skript“ alle übrigen
Fundstellen. Der Index verweist nur auf Fundstellen, er erklärt keine Inhalte.

```markdown
---
format: 1
---

# {modulname}

## Dateien

| Datei | Inhalt |
|---|---|
| `Analysis Skript.pdf` | Skript, Kapitel 1–6, 120 Seiten |
| `Blatt 3.pdf` | Übungsblatt 3, 5 Aufgaben, ohne Lösungen |

## Themen

| Thema | Skript | Übungen |
|---|---|---|
| Ableitungen | `Analysis Skript.pdf` S. 40–52 | `Analysis Skript.pdf` S. 53 A1–A4; `Blatt 3.pdf` S. 1 A1–A5 |

## Stichwörter

| Stichwort | Fundstellen |
|---|---|
| Kettenregel | `Analysis Skript.pdf` S. 45, S. 53 A2; `Blatt 3.pdf` S. 2 A3 |
```
