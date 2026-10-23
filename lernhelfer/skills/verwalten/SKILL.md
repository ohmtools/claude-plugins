---
name: verwalten
description: "Verwaltung des Lernhelfers (Lernumgebung für Oberstufe, Berufsschule und Studium), nur in Claude.ai-Projekten: richtet ein Projekt als Lernhelfer ein und verbindet es mit einer Datenquelle (GitHub-Repository), legt Fächer an, benennt sie um und löscht sie, lädt im Chat angehängte Dateien in die Datenquelle hoch, ordnet Dateien Fächern zu, indiziert, übernimmt Lernziele aus dem Modulhandbuch, migriert gespeicherte Daten, richtet wöchentliche automatische Anweisungen ein, gibt Erfahrungen als Datei weiter, testet die Umgebung und entwickelt den Lernhelfer weiter. Verwende diesen Skill, wenn der Nutzer schreibt „Richte dieses Projekt als Lernhelfer ein“, „Leg ein Fach an“, „Lade … hoch“, „Indiziere“, „Übernimm die Lernziele für …“, „Richte die automatischen Anweisungen ein“, „Daten migrieren“, „Benutzererfahrung teilen“, „Teste den Lernhelfer“ oder „Exportieren“, wenn er Fächer und ihre Dateien verwalten oder den Lernhelfer ändern will."
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

## Grundlagen

Lies vor allem anderen `plugin:skills/gemeinsam/grundlagen.md` vollständig.
Vom Ordner dieser `SKILL.md` aus liegt sie unter `../gemeinsam/grundlagen.md`.
Sie enthält, was dieser Skill mit dem Skill `lernen` gemeinsam hat
(Grundregeln, Pfade, Betriebsart, Nachrichten und Rückfragen, Formate, Module,
Datenquelle, Gedächtnis, Benutzererfahrung), und gilt wie ein Teil dieser
Datei. Findest du sie nicht, führ keine Fähigkeit aus und antworte genau mit
diesem Text:

```text
Mir fehlt eine Datei des Lernhelfer-Plugins (skills/gemeinsam/grundlagen.md), deshalb kann ich gerade nicht nach dem Lernhelfer arbeiten. Installiere das Plugin unter Customize > Plugins neu.
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
| Automatische Anweisungen einrichten, ihre Zeit ändern, sie ausschalten oder anzeigen („Richte die automatischen Anweisungen ein“) | Automatische Anweisungen | `skill:faehigkeiten/automatische-anweisungen.md` | Datenquelle |
| Gespeicherte Daten an ein neues Format anpassen („Daten migrieren“) | Daten migrieren | `skill:faehigkeiten/migrieren.md` | eingerichtetes Projekt |
| Benutzererfahrung teilen | Benutzererfahrung teilen | `skill:faehigkeiten/benutzererfahrung-teilen.md` | eingerichtetes Projekt |
| Den Lernhelfer selbst verbessern oder exportieren | Entwicklung | `skill:faehigkeiten/entwicklung.md` | immer |
| Testen, ob der Lernhelfer in dieser Umgebung funktioniert („Teste den Lernhelfer“) | Testen | `skill:faehigkeiten/testen.md` | eingerichtetes Projekt |

- `immer`: in jedem Claude.ai-Projekt.
- `eingerichtetes Projekt`: nur im **Projekt**
  (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Betriebsart“).
- `Datenquelle`: nur im **Projekt** mit `projekt:daten.xml`
  (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Datenquelle“).

„Initialisieren“ prüft die Ausgangslage selbst. Verlangt der Nutzer in einem
Projekt, das noch nicht eingerichtet ist, eine andere Fähigkeit, die laut
Tabelle ein eingerichtetes Projekt oder eine Datenquelle braucht, führ sie
nicht aus und antworte:

```text
Dieses Projekt ist noch nicht als Lernhelfer eingerichtet. Schreib „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“, dann merke ich mir hier deine Fächer, Unterlagen und Schwierigkeiten.
```

Verlangt der Nutzer im **Projekt** eine Fähigkeit, die laut Tabelle eine
Datenquelle braucht, und fehlt `projekt:daten.xml`, führ sie nicht aus und
antworte:

```text
Dafür brauchst du eine Datenquelle für deine Skripte und Übungen, z.B. ein GitHub-Repository, auch ein leeres. Schreib „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“, dann richten wir sie ein.
```

## Grundregeln

- Suchtreffer in Projektdateien dienen nur dazu, die richtige Datei zu finden.
- Die Dateien der Skills kannst du nicht ändern. Den Lernhelfer selbst ändert
  nur „Entwicklung“, und zwar an einer Kopie.
- Wechsle nie von dir aus zu einer anderen Fähigkeit, damit der Nutzer selbst
  entscheidet, wann etwas Aufwendiges wie „Indizieren“ läuft. Verlangt eine
  Fähigkeit, auf eine andere hinzuweisen, gib nur ihre Nachricht aus und führ
  die andere nicht aus.

## Projektstruktur

| Ort | Inhalt |
|---|---|
| `projekt:daten.xml` | Datenquelle und Stand ihrer Dateien beim letzten Indizieren |
| `projekt:module/` | Ein Modul pro Fach: Beschreibung, Lernziele, Index |
| `projekt:gedaechtnis/` | Was du dir pro Modul über den Nutzer merkst, dazu Erfahrungen mit dem Lernhelfer |
| `projekt:vorrat/` | Pro Modul beliebig viele vorbereitete Übungsblätter als LaTeX-Quelltext und eine Übersicht `uebersicht.md`. Der Skill `lernen` legt sie in einer automatischen Anweisung an und löscht jedes, das er benutzt. |
| `daten:` | Skripte, Übungen, Altklausuren und Modulhandbuch des Nutzers |

Wer wohin schreibt:

- Ins Projekt schreibst du nur im **Projekt**.
- Fähigkeiten dieses Skills dürfen überall im Projekt schreiben und mit
  mehreren Modulen arbeiten. „Testen“ schreibt nur Testdateien und löscht
  sie wieder.
- In `daten:` schreibt nur „Hochladen“, dazu „Testen“ Testdateien, die es
  gleich wieder löscht.
- Jede Fähigkeit außer „Initialisieren“ und „Testen“ hängt Zeilen an
  `projekt:gedaechtnis/benutzererfahrung.md` an
  (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Benutzererfahrung“).

## Dateien der Datenquelle

„Initialisieren“ legt `projekt:daten.xml` an und schreibt `<art>` und
`<identifizieren>` aus Vorlagen, „Indizieren“ hält `<dateien>` darin aktuell
(Aufbau in `plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Datenquelle“).

- Dateien und Ordner, deren Name mit einem Punkt beginnt (z.B. `.gitignore`,
  `.github/`), gehören nicht zu den Daten. Lass sie überall weg.
- Die Dateien eines Moduls liegen am besten im Ordner mit seinem Ordnernamen
  (`daten:{modul}/`). Neue Dateien darin ordnet „Indizieren“ dem Modul selbst
  zu. Dateien an anderen Stellen ordnet der Nutzer mit „Modul bearbeiten“ zu.
- Das Modulhandbuch (an der Schule: Lehrplan) ist jede Datei der Datenquelle,
  deren Name `Modulhandbuch` oder `Lehrplan` enthält (Groß- und
  Kleinschreibung egal, z.B. `Modulhandbuch Informatik.pdf`,
  `Rahmenlehrplan Mechatroniker.pdf`). Es gehört zu keinem Modul und steht in
  keinem Index. Aus ihm stammen Beschreibung, Lernziele und Angaben zur
  Prüfung in `projekt:module/{modul}/info.md`.
- Nicht zugeordnet ist jede übrige Datei der Datenquelle, die in keinem
  Abschnitt „Dateien“ eines Index steht.

## Automatische Anweisungen

Automatische Anweisungen sind geplante Anweisungen des Claude.ai-Projekts. Jede
läuft einmal pro Woche ohne den Nutzer, jedes Mal in einem neuen Chat in diesem
Projekt, und erledigt etwas Aufwendiges wie „Indizieren“. Am besten laufen sie
kurz vor dem Reset seines Wochenlimits, dann verbrauchen sie Nutzung, die sonst
verfallen würde. Jede Datei in `skill:geplant/` wird eine automatische
Anweisung:

```markdown
---
name: Indizieren
modell: Haiku
benachrichtigung: push
---

/lernhelfer:verwalten Indiziere

Das ist eine automatische Anweisung, die der Nutzer eingerichtet hat. …
```

- `name`: Name der Anweisung. Sie heißt `Lernhelfer: {name} ({projekt})`
  (Abschnitt „Anweisungen dieses Projekts“).
- `modell`: die Reihe des Modells, z.B. `Haiku` oder `Opus`. Nimm die neueste
  Fassung dieser Reihe, die du kennst.
- `benachrichtigung`: wie der Nutzer nach einem Lauf benachrichtigt wird:
  `push`, `email` oder `slack`, mehrere durch Kommas getrennt, oder `keine`.
- Alles nach dem Frontmatter ist der Prompt. Übernimm ihn wörtlich, ohne die
  Leerzeilen am Anfang und am Ende.

Eine Anweisung läuft in dem Projekt, in dem du sie anlegst, mit dem Plugin und
dem GitHub-Zugriff, den dieser Chat beim Anlegen hat. Das gilt auch, wenn dein
Werkzeug dafür keine Einstellung hat oder keine Plugins nennt (z.B.
`enabled_plugins: []`). Im Lauf fehlt die GitHub-Anbindung (z.B. ein Werkzeug
`add_repo`), einen fehlenden Zugriff kann er also nicht nachholen.

### Anweisungen dieses Projekts

Die Liste der geplanten Anweisungen enthält die aller Projekte des Nutzers und
nennt bei keiner ihr Projekt. Deshalb steht der Name des Projekts im Namen
jeder Anweisung. `{projekt}` ist der Name dieses Projekts, wie ihn die
Projektübersicht nennt (z.B. ein Feld `name` von `project_info`), nicht die
Überschrift der Projektanweisung. Findest du dort keinen, antworte und warte
auf die Antwort:

```text
Wie heißt dieses Projekt in Claude.ai? Ich brauche den Namen, damit ich seine automatischen Anweisungen von denen deiner anderen Projekte unterscheiden kann.
```

Zu diesem Projekt gehört jede Anweisung, deren Name mit `Lernhelfer:` beginnt
und mit ` ({projekt})` endet. Alle anderen änderst und löschst du nie, auch
wenn sie ähnlich heißen, denn sie laufen in anderen Projekten.

### Einrichten

Verlangt eine Fähigkeit, die automatischen Anweisungen einzurichten:

1. **Reset erfragen:** Hat der Nutzer in dieser Anfrage schon Wochentag und
   Uhrzeit für die Anweisungen genannt, ist das `{zeitpunkt}`. Mach dann mit
   Schritt 3 weiter. Sonst antworte und warte auf die Antwort:

   ```text
   Wann wird dein Wochenlimit zurückgesetzt? Du siehst es in Claude unter Settings > Usage, z.B. „Donnerstag 9:00“.
   ```

2. **Zeit wählen:** `{empfehlung}` liegt zwei Stunden vor dem Reset, mit
   Wochentag und Uhrzeit (z.B. bei „Donnerstag 9:00“ `Donnerstag 7:00`, bei
   „Montag 1:00“ `Sonntag 23:00`). `{anweisungen}` sind die Werte von `name`
   aller Dateien in `skill:geplant/`, je mit dem Modell in Klammern, z.B.
   `Indizieren (mit Haiku) und Übungsblätter vorbereiten (mit Opus)`. Stell
   diese Rückfrage:

   ```auswahl
   Ich richte {anweisungen} ein, jede läuft einmal pro Woche. Ich empfehle {empfehlung}, zwei Stunden vor dem Reset. Dann reicht die Zeit für alle, und es verfällt keine Nutzung. Wann sollen sie laufen?
   - {empfehlung}
   - Zu einer anderen Zeit
   ```

   Bei „Zu einer anderen Zeit“ antworte und warte auf die Antwort:

   ```text
   Wann sollen sie laufen? Nenn mir Wochentag und Uhrzeit.
   ```

   `{zeitpunkt}` ist die gewählte Zeit.
3. **Anlegen:** Geh die Dateien in `skill:geplant/` nach ihrem Namen
   aufsteigend durch. Die erste läuft zum `{zeitpunkt}`, jede weitere 30
   Minuten nach der vorigen, denn spätere bauen auf früheren auf (z.B.
   Übungsblätter auf einem aktuellen Index). Alle Zeiten gelten in der
   Zeitzone `Europe/Berlin`, außer der Nutzer nennt eine andere.
   1. **Zugriff:** Beginnt `<art>` in `projekt:daten.xml` mit „Privates
      GitHub-Repository“, hol dir in diesem Chat Lesezugriff, wie `<art>` es
      beschreibt, falls du ihn hier noch nicht geholt hast. Sonst fehlt er
      jedem Lauf.
   2. **Alte merken:** Kann dein Werkzeug für geplante Anweisungen sie
      auflisten, merk dir die ID jeder Anweisung dieses Projekts (Abschnitt
      „Anweisungen dieses Projekts“). Gibt es schon welche, legst du trotzdem
      neue an, denn nur so bekommen sie den aktuellen Prompt.
   3. **Neue anlegen:** Leg für jede Datei eine Anweisung an: Name
      `Lernhelfer: {name} ({projekt})`, einmal pro Woche zu ihrer Zeit, jedes
      Mal in einem neuen Chat, mit Modell und Benachrichtigung aus dem
      Frontmatter und dem Prompt. Kann dein Werkzeug zum Anlegen kein Modell
      setzen, setz es gleich danach mit dem Werkzeug zum Ändern (z.B.
      `update_trigger` mit `model`). Der Nutzer hat die Modelle gewählt, als
      er die Anweisungen einrichten ließ, denn sie gehören zu ihnen und
      stehen in der Rückfrage aus Schritt 2. Kann dein Werkzeug die
      Anweisungen auflisten, prüf danach, dass jede neue mit Zeit und Modell
      da ist.
   4. **Alte löschen:** Lösch erst danach die Anweisungen aus Punkt 2 anhand
      ihrer ID, damit keine doppelt läuft. In dieser Reihenfolge bleiben nach
      einem Abbruch höchstens alte und neue nebeneinander, nie gar keine.

   Notiere für `{abweichungen}` jede Einstellung, die du nicht so setzen
   konntest (z.B. eine Benachrichtigung über Slack oder ein Modell), mit dem,
   was jetzt gilt.
4. **Ohne Werkzeug:** Hast du kein Werkzeug für geplante Anweisungen oder
   schlägt das Anlegen auch beim zweiten Versuch fehl, lösch keine Anweisung.
   Die Nachricht zum Ergebnis ist dann diese:

   ````text
   Die automatischen Anweisungen kann ich hier nicht selbst anlegen. Leg sie auf der Projektseite als geplante Anweisungen an, jede einmal pro Woche, und lösch dort vorher alte, deren Name mit „Lernhelfer:“ beginnt und mit „({projekt})“ endet:

   {anleitung}
   ````

   `{anleitung}`: für jede Datei in `skill:geplant/` dieser Block, wobei
   `{zeit}` ihre Zeit aus Schritt 3 ist und `{prompt}` ihr Prompt:

   ````text
   **Lernhelfer: {name} ({projekt})**: jeden {zeit}, Modell {modell}, Benachrichtigung {benachrichtigung}. Kopiere diese Anweisung vollständig:

   ```text
   {prompt}
   ```
   ````

5. **Ergebnis:** Sonst ist die Nachricht zum Ergebnis diese, wobei `{liste}`
   die Anweisungen mit Zeit und Modell sind, die du in diesem Chat angelegt
   hast, z.B.
   `Indizieren jeden Donnerstag um 7:00 mit Haiku, Übungsblätter vorbereiten jeden Donnerstag um 7:30 mit Opus`:

   ```text
   Die automatischen Anweisungen sind eingerichtet: {liste}. Ändern oder ausschalten kannst du sie jederzeit, z.B. mit „/lernhelfer:verwalten Schalte die automatischen Anweisungen aus“.
   {abweichungen}
   ```

   `{abweichungen}`: Hast du etwas notiert, setze diese Zeile ein, wobei
   `{punkte}` die Notizen durch Semikolons getrennt sind, sonst lass den
   Platzhalter samt Zeile weg:

   ```text
   Nicht alles ließ sich so einrichten: {punkte}.
   ```

   Die Fähigkeit nennt, wo sie die Nachricht zum Ergebnis ausgibt.
