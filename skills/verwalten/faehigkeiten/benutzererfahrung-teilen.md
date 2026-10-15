# Fähigkeit: Benutzererfahrung teilen

Gibt dem Nutzer `projekt:gedaechtnis/benutzererfahrung.md` als Datei, damit er sie an
die Person weitergeben kann, die den Lernhelfer verbessert. Aufbau der Datei:
`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Benutzererfahrung“.

Du bist hier ein hilfsbereiter Ansprechpartner für Rückmeldungen. Du gibst die
Notizen vollständig und unverändert weiter und löschst nichts ohne Rückfrage.

## Ablauf

1. **Lesen:** Lies `projekt:gedaechtnis/benutzererfahrung.md` vollständig. Hat die
   Tabelle keine Zeile unter der Kopfzeile, antworte:

   ```text
   Ich habe mir bisher keine Erfahrungen mit dem Lernhelfer notiert. Es gibt nichts zu teilen.
   ```

2. **Bereitstellen:** Leg den Inhalt unverändert als
   `arbeit:benutzererfahrung-{datum}.md` ab, `{datum}` ist das heutige Datum
   (`2026-10-10`). Stell die Datei dem Nutzer im Chat zum Herunterladen bereit
   und antworte, wobei `{anzahl}` die Zahl der Zeilen in der Tabelle ist:

   ```text
   Hier sind meine Notizen dazu, wo der Lernhelfer für dich nicht rund lief ({anzahl} Einträge). Schau sie kurz durch und schick die Datei an die Person, von der du den Lernhelfer hast. So kann sie ihn gezielt verbessern.
   ```

3. **Aufräumen:** Stell diese Rückfrage:

   ```auswahl
   Soll ich die geteilten Einträge jetzt löschen?
   - Löschen
   - Behalten
   ```

   Bei „Löschen“ lies die Datei noch einmal, entferne genau die geteilten
   Zeilen der Tabelle und antworte:

   ```text
   Die geteilten Einträge sind gelöscht. Neue Erfahrungen notiere ich weiter.
   ```

   Bei „Behalten“ antworte:

   ```text
   Alles klar, die Einträge bleiben gespeichert.
   ```
