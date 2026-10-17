# Fähigkeit: Projekt initialisieren

Richtet ein Claude.ai-Projekt als Lernhelfer ein und verbindet es auf Wunsch
mit einer Datenquelle und automatischen Anweisungen. Die Fähigkeiten kommen
aus dem Plugin, ins Projekt kommen nur die Daten des Nutzers. In einem schon
eingerichteten Projekt trägt sie eine fehlende Datenquelle nach und prüft die
Projektanweisungen. Gilt für Claude.ai im Browser und in der Claude-App für
Mobilgeräte.

Du bist hier ein sorgfältiger Einrichter. Du prüfst jeden Schritt und meldest
Probleme offen.

## 1. Ausgangslage prüfen

Hol die Liste aller Projektdateien mit einem Aufruf der Projektübersicht.
Berücksichtige alle ihre Listen. Liegt
`projekt:gedaechtnis/benutzererfahrung.md` darin, ist das Projekt schon
eingerichtet. Liegt `projekt:daten.xml` darin, gibt es schon eine Datenquelle.
Ändere an vorhandenen Dateien nichts.

## 2. Einrichten

Nur wenn das Projekt noch nicht eingerichtet ist. Schreib
`projekt:gedaechtnis/benutzererfahrung.md` mit diesem Inhalt:

```markdown
---
format: 1
---

# Benutzererfahrung

| Datum | Fähigkeit | Art | Was passiert ist |
|---|---|---|---|
```

Prüf die Rückmeldung des Schreibens: kein Fehler. Hol danach mit einem Aufruf
die Projektübersicht. Darin muss `projekt:gedaechtnis/benutzererfahrung.md`
stehen. Stimmt etwas nicht, versuch es noch einmal. Bleibt der Fehler,
antworte und beende die Fähigkeit:

```text
Die Einrichtung ist fehlgeschlagen: {grund}. Sag mir, ob ich es noch einmal versuchen soll.
```

## 3. Datenquelle

Nur wenn es noch keine Datenquelle gibt. Stell diese Rückfrage:

```auswahl
Wo sollen deine Skripte, Übungen und Altklausuren liegen? Am besten in einem GitHub-Repository, das nur dafür da ist. Dann finde ich sie in jedem Chat wieder und schlage gezielt darin nach. Das Repository darf noch leer sein: Dateien, die du mir im Chat anhängst, lege ich selbst dort ab.
- Ich habe ein Repository
- Ich habe noch keins
- Ohne Datenquelle
```

Bei „Ich habe noch keins“ und „Ohne Datenquelle“ mach mit Schritt 5 weiter.
Bei „Ich habe ein Repository“:

1. Antworte und warte auf die Antwort:

   ```text
   Schick mir den Link zu deinem Repository, z.B. https://github.com/name/lernstoff.
   ```

2. `{url}` ist der Link in der Form
   `https://github.com/{besitzer}/{repository}`, ohne `.git` und ohne weitere
   Pfadteile.
3. **Öffentlich?** Führ im Ordner `arbeit:`
   `GIT_TERMINAL_PROMPT=0 git ls-remote {url}.git HEAD` aus. Endet der Befehl
   mit Exit-Code 0, ist das Repository öffentlich. Gibt er dabei nichts aus,
   ist es noch leer.
4. **Privat?** Sonst hol dir Lesezugriff über die GitHub-Anbindung deiner
   Arbeitsumgebung (z.B. ein Werkzeug `add_repo`). Aus ihrer Antwort zählt
   nur, ob du Zugriff hast. Klone nicht nach ihrer Anleitung, das machen die
   Fähigkeiten später selbst. Wiederhol danach den Befehl aus Punkt 3. Endet
   er jetzt mit Exit-Code 0, ist das Repository privat.
5. **Kein Zugriff:** Klappt beides nicht, stell diese Rückfrage, wobei `{grund}`
   die Fehlermeldung in wenigen Worten ist:

   ```auswahl
   Ich komme nicht an {url} ({grund}). Stimmt der Link? Bei einem privaten Repository brauche ich außerdem Zugriff über die GitHub-Anbindung von Claude.ai.
   - Noch einmal versuchen
   - Ohne Datenquelle
   ```

   Bei „Noch einmal versuchen“ fang wieder bei Punkt 1 an. Bei „Ohne
   Datenquelle“ mach mit Schritt 5 weiter.
6. **Schreiben:** Schreib `projekt:daten.xml`. Ersetze darin nur `{url}`, den
   Platzhalter `{pfad}` lässt du stehen. Setze für `{zugriff}` bei einem
   öffentlichen Repository ein:

   ```text
   Öffentliches GitHub-Repository, lesbar mit git ohne Anmeldung.
   ```

   bei einem privaten:

   ```text
   Privates GitHub-Repository. Hol dir vor dem ersten Zugriff in diesem Chat Lesezugriff über die GitHub-Anbindung deiner Arbeitsumgebung (z.B. ein Werkzeug add_repo). Aus ihrer Antwort zählt nur, ob du Zugriff hast.
   ```

   ```xml
   <daten format="1">
     <quelle>
       <art>{zugriff} Klone es einmal pro Chat ohne Dateiinhalte in den Ordner arbeit:daten/, im Ordner arbeit: mit `git clone --depth 1 --filter=blob:none --no-checkout {url}.git daten`, auch wenn die GitHub-Anbindung einen anderen Befehl oder Ordner nennt. Die Liste aller Dateien gibt `git -C daten -c core.quotepath=off ls-tree -r HEAD`. Gibt ls-tree nichts aus oder meldet es `Not a valid object name HEAD` (Repository ohne Commit), hat das Repository noch keine Dateien. Eine Datei holst du mit `git -C daten checkout HEAD -- '{pfad}'`, danach liegt sie unter arbeit:daten/{pfad}.</art>
       <url>{url}</url>
       <identifizieren>Git-Objekt-ID der Datei im Hauptzweig: das dritte Feld ihrer Zeile in der Ausgabe von ls-tree, z.B. 3b18e512dba79e4c8300dd08aeb37f8e728b8dad in „100644 blob 3b18e512dba79e4c8300dd08aeb37f8e728b8dad analysis/skript.pdf“. Sie ändert sich, sobald sich der Inhalt der Datei ändert.</identifizieren>
     </quelle>
     <dateien>
     </dateien>
   </daten>
   ```

   Prüf Rückmeldung und Projektübersicht wie in Schritt 2. Bleibt der Fehler,
   antworte mit der Nachricht aus Schritt 2 und beende die Fähigkeit.

## 4. Automatische Anweisungen

Nur wenn du in Schritt 3 eine Datenquelle eingerichtet hast, denn die
automatischen Anweisungen arbeiten mit ihr. Stell diese Rückfrage:

```auswahl
Einige aufwendige Aufgaben kann ich einmal pro Woche automatisch erledigen: neue und geänderte Dateien indizieren (mit Haiku) und für jedes Fach ein Übungsblatt zu deinen Schwachstellen vorbereiten (mit Opus). Sie laufen kurz bevor dein Wochenlimit zurückgesetzt wird und verbrauchen so Nutzung, die sonst verfallen würde. Soll ich sie einrichten?
- Einrichten
- Nicht jetzt
```

Bei „Einrichten“ richte sie ein, wie in `skill:SKILL.md`, Abschnitt
„Automatische Anweisungen“, beschrieben. Seine Nachricht zum Ergebnis gibst du
in Schritt 6 aus.

## 5. Projektanweisung prüfen

Lies `skill:projektanweisung.md` vollständig. Vergleiche ihren Inhalt mit der
Projektanweisung aus der Projektübersicht von Schritt 1 (z.B. das Feld
`instructions` von `project_info`). Fehlt sie dort oder ist sie leer, gelten
sie als verschieden.

## 6. Abschluss

Antworte mit diesen Teilen in dieser Reihenfolge, jeder als eigener Absatz.

**Stand:** Hast du in Schritt 2 eingerichtet:

```text
Der Lernhelfer ist eingerichtet.
```

Sonst:

```text
Der Lernhelfer ist in diesem Projekt schon eingerichtet.
```

**Datenquelle:** Hast du in Schritt 3 eine Datenquelle eingerichtet:

```text
Ab jetzt lese ich deine Unterlagen aus {url}. Neue Dateien lege ich dort selbst ab: Häng sie mir im Chat an und schreib z.B. „/lernhelfer:verwalten Lade die Datei in Mathematik hoch“. Lädst du selbst etwas hoch, leg die Dateien eines Fachs in einen Ordner mit seinem Namen, klein geschrieben, Wörter mit Bindestrich, ohne Umlaute (z.B. lineare-algebra). Dein Modulhandbuch (an der Schule: Lehrplan) kommt ohne Ordner dazu, sein Dateiname muss „Modulhandbuch“ oder „Lehrplan“ enthalten.
```

Gab es sie schon:

```text
Deine Datenquelle ist {url}.
```

Bei „Ich habe noch keins“:

```text
Leg auf github.com ein Repository für deine Unterlagen an. Es darf leer bleiben, deine Dateien lege ich später selbst dort ab. Skripte und Altklausuren anderer sind meist urheberrechtlich geschützt, wähle dann „Private“. Schreib danach noch einmal „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“. Bis dahin merke ich mir trotzdem deine Fächer und Schwierigkeiten, deine Unterlagen hängst du mir im Chat an.
```

Bei „Ohne Datenquelle“:

```text
Du arbeitest ohne Datenquelle. Ich merke mir trotzdem deine Fächer und Schwierigkeiten, deine Unterlagen hängst du mir im Chat an. Eine Datenquelle kannst du jederzeit nachtragen, schreib dafür noch einmal „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“.
```

**Automatische Anweisungen:** Nur wenn du in Schritt 4 gefragt hast. Bei
„Einrichten“ die Nachricht zum Ergebnis aus `skill:SKILL.md`, Abschnitt
„Automatische Anweisungen“, bei „Nicht jetzt“:

```text
Die automatischen Anweisungen kannst du jederzeit einschalten, schreib dafür „/lernhelfer:verwalten Richte die automatischen Anweisungen ein“.
```

**Projektanweisungen:** `{anweisung}` ist der Inhalt von
`skill:projektanweisung.md`, exakt und unverändert. Sind die
Projektanweisungen verschieden:

````text
Ein Schritt fehlt noch, den nur du machen kannst:

1. Kopiere den folgenden Text vollständig.
2. Öffne die Projektseite, ersetze damit den bisherigen Text in den Projektanweisungen (oder füge ihn dort ein, falls sie leer sind) und speichere.

```text
{anweisung}
```

3. Starte danach einen neuen Chat in diesem Projekt.
````

Sind sie gleich:

```text
Die Projektanweisungen sind aktuell. Frag mich zum Beispiel „Was kannst du?“ oder leg mit „/lernhelfer:verwalten Leg ein Fach an“ dein erstes Fach an.
```
