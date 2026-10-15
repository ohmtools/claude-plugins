# Fähigkeit: Projekt initialisieren

Richtet ein Claude.ai-Projekt als Lernhelfer ein. Die Fähigkeiten kommen aus
dem Plugin, ins Projekt kommen nur die Daten des Nutzers. Gilt für Claude.ai
im Browser und in der Claude-App für Mobilgeräte.

Du bist hier ein sorgfältiger Einrichter. Du prüfst jeden Schritt und meldest
Probleme offen.

## 1. Ausgangslage prüfen

Hol die Liste aller Projektdateien mit einem Aufruf der Projektübersicht.
Berücksichtige alle ihre Listen. Liegt `projekt:gedaechtnis/benutzererfahrung.md`
darin, ist das Projekt schon eingerichtet. Ändere dann nichts und mach mit
Schritt 3 weiter. Sonst mach mit Schritt 2 weiter.

## 2. Einrichten

Ein Projekt gilt als eingerichtet, sobald `projekt:gedaechtnis/benutzererfahrung.md`
darin liegt. Schreib sie mit diesem Inhalt:

```markdown
---
format: 1
---

# Benutzererfahrung

| Datum | Fähigkeit | Art | Was passiert ist |
|---|---|---|---|
```

Prüf die Rückmeldung des Schreibens: kein Fehler. Hol danach mit einem Aufruf
die Projektübersicht. Darin muss `projekt:gedaechtnis/benutzererfahrung.md` stehen.
Stimmt etwas nicht, versuch es noch einmal. Bleibt der Fehler, antworte:

```text
Die Einrichtung ist fehlgeschlagen: {grund}. Sag mir, ob ich es noch einmal versuchen soll.
```

## 3. Projektanweisung prüfen

Lies `skill:referenzen/projektanweisung.md` vollständig. Vergleiche ihren Inhalt mit
der Projektanweisung, die dir in diesem Chat vorliegt. Liegt dir keine vor,
gelten sie als verschieden.

## 4. Abschluss

`{anweisung}` ist der Inhalt von `skill:referenzen/projektanweisung.md`, exakt und
unverändert.

War das Projekt schon eingerichtet und sind die Projektanweisungen gleich,
antworte:

```text
Der Lernhelfer ist in diesem Projekt schon eingerichtet und die Projektanweisungen sind aktuell. Neue Fassungen bekommst du, indem du das Lernhelfer-Plugin aktualisierst.
```

War das Projekt schon eingerichtet und sind die Projektanweisungen
verschieden, antworte:

````text
Der Lernhelfer ist in diesem Projekt schon eingerichtet, aber die Projektanweisungen passen nicht zur installierten Fassung des Plugins. Ein Schritt fehlt noch, den nur du machen kannst:

1. Kopiere den folgenden Text vollständig.
2. Öffne die Projektseite, ersetze damit den bisherigen Text in den Projektanweisungen und speichere.

```text
{anweisung}
```

3. Starte danach einen neuen Chat in diesem Projekt.
````

Hast du in Schritt 2 eingerichtet und sind die Projektanweisungen verschieden,
antworte:

````text
Der Lernhelfer ist eingerichtet. Ein Schritt fehlt noch, den nur du machen kannst:

1. Kopiere den folgenden Text vollständig.
2. Öffne die Projektseite, füge ihn bei den Projektanweisungen ein und speichere.

```text
{anweisung}
```

3. Hast du ein Modulhandbuch (an der Schule: Lehrplan)? Lade es auf der Projektseite in die Projektdateien hoch. Sein Dateiname muss „Modulhandbuch“ oder „Lehrplan“ enthalten, damit ich es finde. Legst du später ein Fach an, übernehme ich daraus dessen Lernziele.
4. Starte danach einen neuen Chat in diesem Projekt. Erst dort ist der Lernhelfer aktiv. Frag dort zum Beispiel „Was kannst du?“.
````

Hast du in Schritt 2 eingerichtet und sind die Projektanweisungen gleich,
antworte:

```text
Der Lernhelfer ist eingerichtet.

1. Hast du ein Modulhandbuch (an der Schule: Lehrplan)? Lade es auf der Projektseite in die Projektdateien hoch. Sein Dateiname muss „Modulhandbuch“ oder „Lehrplan“ enthalten, damit ich es finde. Legst du später ein Fach an, übernehme ich daraus dessen Lernziele.
2. Starte danach einen neuen Chat in diesem Projekt. Erst dort ist der Lernhelfer aktiv. Frag dort zum Beispiel „Was kannst du?“.
```
