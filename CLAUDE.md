# Lernhelfer – Hinweise für Claude Code

Lernhelfer ist ein Plugin für Claude.ai mit den Skills `lernen`, `verwalten`
und `helfen`. Ihre Markdown-Anweisungen („Fähigkeiten“) schreibst du für eine
**andere** Claude-Instanz in Claude.ai (Browser und Mobil-App). Sie kennt
weder dieses Repository noch diese Datei, nur das Plugin und die
Projektdateien.

## Wegweiser

| Thema | Datei |
|---|---|
| Installation | `README.md` |
| Plugin und Marketplace | `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` |
| Text der Projektanweisungen | `skills/verwalten/projektanweisung.md` |
| Gemeinsam für `lernen` und `verwalten`: Grundregeln, Pfade, Betriebsart, Nachrichten, Formate, Module, Datenquelle (`daten.xml`), Gedächtnis, Benutzererfahrung | `skills/gemeinsam/grundlagen.md` |
| Lernen: Fähigkeiten, Modul bestimmen, Dateiprüfung, Dateien im Chat, PDF-Dateien, Probleme pflegen | `skills/lernen/SKILL.md` |
| Lernmodi und Schwachstellen | `skills/lernen/faehigkeiten/` |
| Verwalten: Fähigkeiten und ihre Verfügbarkeit, Projektstruktur, Dateien der Datenquelle | `skills/verwalten/SKILL.md` |
| Konventionen für Fähigkeiten | `skills/verwalten/faehigkeiten/entwicklung.md`, „Änderungen machen“, Schritt 2 |
| Einrichten, Datenquelle anlegen | `skills/verwalten/faehigkeiten/initialisieren.md` |
| Fächer, Dateien zuordnen, Lernziele | `skills/verwalten/faehigkeiten/modul-bearbeiten.md` |
| Hochladen, Indizieren | `skills/verwalten/faehigkeiten/hochladen.md`, `skills/verwalten/faehigkeiten/indizieren.md` |
| Migrationen | `skills/verwalten/faehigkeiten/migrieren.md` |
| Export | `skills/verwalten/faehigkeiten/entwicklung.md`, „Exportieren“ |
| Annahmen über die Zielumgebung prüfen | `skills/verwalten/faehigkeiten/testen.md`, Ergebnisse unter „Testläufe“ |
| Antworten auf Fragen zum Lernhelfer | `skills/helfen/SKILL.md` |

Lies vor einer Änderung `skills/gemeinsam/grundlagen.md`,
`skills/lernen/SKILL.md`, `skills/verwalten/SKILL.md`, `entwicklung.md` und
alle Dateien, die die Änderung betrifft, vollständig.

## Regeln für dieses Repository

- Die Konventionen in `entwicklung.md` gelten auch für dich.
- Neue Konventionen für Fähigkeiten gehören nach `entwicklung.md`, nicht
  hierher, weil die Entwicklungsinstanz im Projekt nur das Plugin kennt.
- Prüf nach jeder Änderung mit `claude plugin validate .`.
- Trag die Ergebnisse jedes Testlaufs unter „Testläufe“ ein, pass die
  Fähigkeiten an und nimm bestätigte Tests aus `testen.md` heraus
  (Konvention in `entwicklung.md`).
- Diese Stellen sind bewusst doppelt und müssen übereinstimmen:
  - Repository-URL: `README.md`, `plugin.json` (`homepage`, `repository`),
    `projektanweisung.md` und `helfen/SKILL.md`.
  - Pfad der Grundlagen (`skills/gemeinsam/grundlagen.md`): Abschnitt
    „Grundlagen“ in `lernen/SKILL.md` und `verwalten/SKILL.md` (dort auch die
    Fehlermeldung) und `entwicklung.md` („Vorbereiten“, „Exportieren“).
  - Formatnummern: Tabelle „Formate“ und die Vorlagen in `grundlagen.md`,
    dazu die Vorlagen in `modul-bearbeiten.md` und `initialisieren.md`.
  - Zugriff auf die Datenquelle mit git: Vorlage für `daten.xml` in
    `initialisieren.md`, Befehle in `hochladen.md` und `testen.md`, Test 2,
    dort auch das leere Repository (`Not a valid object name HEAD`, dann
    `symbolic-ref HEAD refs/heads/main`).
  - GitHub-Anbindung nur für den Zugriff, nicht für den Klon: `initialisieren.md`
    (Schritt 3, Punkt 4, und Vorlage für `{zugriff}`), `hochladen.md`,
    Schritt 3, und `testen.md`, Test 2.
  - Beschreibung und Lernziele aus dem Modulhandbuch auslesen:
    `indizieren.md`, Schritt 5, und `modul-bearbeiten.md`, „Lernziele
    übernehmen“, Schritte 3 und 4.
  - Erkennen des Modulhandbuchs am Dateinamen („Modulhandbuch“ oder
    „Lehrplan“): `verwalten/SKILL.md` („Dateien der Datenquelle“), die
    Abschlussnachricht in `initialisieren.md`, `modul-bearbeiten.md` und
    `helfen/SKILL.md`.
  - Seiten zählen mit `pdftotext` und `\f`: `lernen/SKILL.md`
    („PDF-Dateien“) und `indizieren.md`, Schritt 4.

## Stand

- Aufbau: Plugin mit drei Skills, kein Lernhelfer-Code mehr im Projekt.
  Was `lernen` und `verwalten` beide brauchen, steht nur einmal in
  `skills/gemeinsam/grundlagen.md` (kein Skill, keine `SKILL.md`). Beide
  `SKILL.md` lassen die Datei vor allem anderen lesen, `helfen` nicht.
  `lernen` arbeitet mit genau einem Modul, liest `module/`, `daten.xml` und
  `daten:` und schreibt nur `gedaechtnis/{modul}/probleme.md` und
  `gedaechtnis/benutzererfahrung.md`. `verwalten` darf überall schreiben und
  mit mehreren Modulen arbeiten. Verweise auf den anderen Skill stehen in
  Nachrichten als „/lernhelfer:{skill} {satz}“.
- Daten im Projekt: `daten.xml`, pro Modul `module/{modul}/info.md`
  (Beschreibung, Lernziele) und `module/{modul}/index.md` (Abschnitt
  „Dateien“ als einzige Zuordnung, Stichwortverzeichnis mit Dateiseiten),
  `gedaechtnis/{modul}/probleme.md` (Thema, Beschreibung, Verstanden,
  Historie) und `gedaechtnis/benutzererfahrung.md`. Alle Formate sind 1, es
  gibt noch keine Migration.
- Datenquelle (`daten:`): freiwillig, zurzeit nur ein GitHub-Repository,
  öffentlich oder privat. `daten.xml` beschreibt den Zugriff in Worten
  (`<art>`, `<identifizieren>`), damit später andere Arten dazukommen
  können, und hält in `<dateien>` den Stand beim letzten Indizieren fest.
  Identifikation ist die Git-Objekt-ID aus `ls-tree` eines Klons mit
  `--depth 1 --filter=blob:none --no-checkout`, die Dateiprüfung liest also
  keine Dateiinhalte. Das Modulhandbuch liegt auch dort und liefert
  `info.md`.
- Indizieren arbeitet immer über alle Module und liest nur neue und
  geänderte Dateien, außer der Nutzer verlangt mehr. Neue Dateien in
  `daten:{modul}/` ordnet es selbst zu. „Datei zuordnen“ entfernt die Datei
  aus `<dateien>`, damit Indizieren sie für alle ihre Module neu liest.
- Hochladen schreibt über die GitHub-Anbindung von Claude.ai (z.B.
  `add_repo`), so hat es der Nutzer entschieden. Ohne Schreibzugriff nennt es
  die Zielpfade zum Hochladen von Hand.
- Lokal geprüft (git 2.43 über `file://`): Commit nach `git reset` und Push
  aus dem Klon ohne Dateiinhalte, ohne Verlust anderer Dateien, auch in ein
  leeres Repository nach `git symbolic-ref HEAD refs/heads/main`.
- Dateien in der Wurzel des Projekts (zurzeit nur `daten.xml`) werden mit
  Schrägstrich geschrieben und gelesen (`/daten.xml`, Regel in
  `grundlagen.md`, „Pfade“). Alternative wäre, `daten.xml` in einen Ordner zu
  legen. Das bräuchte eine Migration.
- Lernmodi (`erlernen.md`, `wiederholen.md`, `ueben.md`) sind Platzhalter, an
  denen der Nutzer arbeitet. Nicht anfassen. Erst sie pflegen
  `probleme.md`, bis dahin bleibt „Schwachstellen listen“ meist leer. Sie
  enthalten nur „NICHT ANFASSEN“, nicht „noch nicht ausgearbeitet“, `lernen`
  erfährt also nicht, dass es sie noch nicht gibt.
- Offen: Was passiert, wenn ein Nutzer trotzdem Dateien über die Projektseite
  hochlädt (dafür gibt es keine Regel mehr).

## Testläufe

Letzter Lauf: 2026-10-16 mit dem Plugin in Claude.ai (Oberfläche nicht
festgehalten), je einmal mit Haiku 5.5 und Opus 5.5, in einem Projekt mit
privater Datenquelle, die anfangs leer war. Davor 2026-10-10 ohne Plugin,
Version 0.11.2 und 0.14.0, im Browser und in der iPad-App.

### Bestätigt

- Plugin: Claude.ai stellt den ganzen Plugin-Ordner unter
  `/mnt/skills/plugin-files/lernhelfer/` bereit, auch `README.md` und
  `CLAUDE.md`. Die Rückmeldung des Werkzeugs `Skill` beginnt mit „Base
  directory for this skill: …/skills/{skill}“, daraus ergeben sich `skill:`
  und `plugin:`, und `../gemeinsam/grundlagen.md` wird gefunden. Installiert
  über `marketplace.json` mit `"source": "./"`.
- Werkzeuge: `curl`, `git` 2.43, `zip`, `unzip`, `file`, `sha256sum`,
  `python3` 3.13, `pdftoppm`, `pdftotext` und `pdfinfo` (poppler 24.02),
  `pypdf`, `pdfplumber`, `pypdfium2`. PyMuPDF fehlt. `gh` ist vorinstalliert.
- Projektdateien: Werkzeug `Projects` mit `method` `project_info`,
  `project_read`, `project_search`, `project_write` (`content` oder
  `local_path`, nur aus `/home/claude`, ersetzt ganze Dateien, meldet
  `replaced`) und `project_delete` (nur Text-Dokumente). Umlaute und
  Sonderzeichen bleiben erhalten, `project_read` liefert kleine Dateien
  inline. `project_info` liefert `instructions` (die Projektanweisung),
  `docs` (eigene Dokumente) und `files` (Uploads der Projektseite), je mit
  `path` und `created_at`, neueste zuerst, ohne Ordner, dazu
  `knowledge_size`. Pfade mit Ordner bleiben, wie geschrieben.
- Dateien ohne Ordner (beobachtet beim Einrichten): `project_write` legt
  `daten.xml` unter `claude/daten.xml` ab, `project_read` findet `daten.xml`
  ohne Schrägstrich nicht. `/daten.xml` klappt beim Schreiben und Lesen und
  steht so in der Übersicht.
- Chat: Angehängte Dateien liegen byte-genau unter
  `/root/.claude/uploads/{sitzung}/{8 Hex-Zeichen}-{name}`. `find /` findet
  dabei auch eigene Dateien in `/home/claude`. `SendUserFile` stellt Dateien
  bereit, `AskUserQuestion` zeigt Knöpfe (Überschrift `header` höchstens 12
  Zeichen, ergänzt selbst „Other“). Eine PDF-Seite als Bild klappt mit
  `pdftoppm` und `Read`.
- GitHub: `add_repo` (`owner`, `repo`, `access` read/push) gibt git über den
  Proxy Zugriff. Ihre Antwort verlangt einen Klon nach `/home/claude/{repo}`
  und den Aufruf von `register_repo_root`. Beides ist unnötig, das Werkzeug
  fehlte sogar. Der Klon nach `arbeit:daten/` mit
  `--depth 1 --filter=blob:none --no-checkout` klappt, ebenso `ls-tree`,
  `checkout` einer Datei (`hash-object` gleich der ID aus `ls-tree`) und ein
  Push in einen neuen Zweig. `git push --delete` lehnt der Proxy mit HTTP 403
  ab. Jeder Push meldet `push negotiation failed`, teils auch
  `fatal: expected 'acknowledgments'`, endet aber mit Exit-Code 0.
  `api.github.com` und Archive über `github.com` liefern HTTP 403.
- Leeres Repository: `ls-remote` gibt nichts aus, endet aber mit Exit-Code 0.
  `ls-tree -r HEAD` meldet `Not a valid object name HEAD`. Der erste
  gepushte Zweig wird Standardzweig. So wurde in diesem Lauf `lernhelfer-test`
  der Standardzweig der Datenquelle, deshalb sah der zweite Lauf nur ihn.
- Indizieren: Haiku und Opus fanden alle erwarteten Einträge mit Dateiseiten,
  auch hinter einer leeren Seite (`pdftotext` gibt für sie ein `\f` aus).
  `pdftotext` macht aus `'` ein `’`. Haiku nahm „Ableitung“ und
  „Ableitungen“ nebeneinander auf.
- Das Werkzeug `Write` entfernt Leerzeichen am Zeilenende.

Folgen des Laufs vom 2026-10-16: „Test“ heißt jetzt „Testen“ und prüft nur
noch Ungeprüftes, der Test-Zweig entfällt. Dazu kamen die Regel für Dateien
ohne Ordner und die neue Suche nach Anhängen in `grundlagen.md`, die
Überschrift für Auswahlfelder, das leere Repository in `initialisieren.md`
(Exit-Code, Vorlage `<art>`) und `hochladen.md` (`main`), die
GitHub-Anbindung nur für den Zugriff und genauere Regeln in
`indizieren.md`, Schritt 4. `projektanweisung.md` liegt nicht mehr in
`faehigkeiten/`.

Grund für die Datenquelle: Von Uploads über die Projektseite liefert
`project_read` nur extrahierten Text, leere Seiten fehlen darin spurlos, und
eine PDF lässt sich nicht wieder lokal herstellen.

### Ungeprüft

- Push in den Hauptzweig, auch in ein leeres Repository (`testen.md`, Test 2).
- Dateien ohne Ordner ersetzen und löschen (`testen.md`, Test 1).
- Das Plugin in der Mobil-App. `testen.md` fragt nach der Oberfläche.
- Wie viel das Lesen großer Modulhandbücher kostet.

Nächster Testlauf: „/lernhelfer:verwalten Teste den Lernhelfer“ in der
Mobil-App, in einem Projekt mit Datenquelle. Danach die Lernmodi.

## Arbeitsweise

- Frag nach, bevor du größere Strukturentscheidungen triffst. Der Nutzer
  entscheidet über Aufbau und Abläufe.
- Kleine Korrekturen (Tippfehler, Konsistenz zwischen Dateien) darfst du
  direkt machen.
- Halte `README.md` kurz. Erklärungen, die Claude nach dem Setup geben kann,
  gehören in die Fähigkeiten, nicht ins README.
- Committe nicht ohne Freigabe des Nutzers.
