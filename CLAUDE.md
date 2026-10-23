# claude-plugins – Hinweise für Claude Code

Dieses Repository ist der Marketplace `ohmtools` mit Plugins für Claude.ai, die
bei Hochschule und Ausbildung helfen. Jedes Plugin liegt in einem eigenen
Ordner, den Claude.ai als Ganzes bereitstellt (`source` in
`.claude-plugin/marketplace.json`). `README.md` und diese Datei liegen deshalb
außerhalb. Ein neues Plugin bekommt einen Ordner (liegt es in einem anderen
Repository, eine Quelle `git-subdir`), einen Eintrag in `marketplace.json` und
einen Abschnitt im README.

- **Zeiteisen:** der Skill `zeiteisen-generator` aus `ohmtools/zeiteisen`,
  Ordner `skill/zeiteisen-generator/`, Quelle `git-subdir` ohne `ref`, also
  immer vom Hauptzweig. Hier stehen nur der Eintrag in `marketplace.json` und
  der Abschnitt im README. Änderungen am Skill gehören nach zeiteisen, auch an
  seinem Manifest `.claude-plugin/plugin.json` (`"skills": ["./"]`, ohne
  Manifest lehnte Claude.ai das Plugin ab). Ungeprüft ist, ob Claude.ai es
  damit annimmt.
- **Lernhelfer** (`lernhelfer/`): um ihn geht es im Rest dieser Datei.

## Lernhelfer

Ein Plugin mit den Skills `lernen`, `verwalten` und `helfen`. Ihre
Anweisungen („Fähigkeiten“) schreibst du für eine **andere** Claude-Instanz in
Claude.ai (Browser und App). Sie kennt weder dieses Repository noch diese
Datei, nur das Plugin und die Projektdateien.

Pfade gelten ab `lernhelfer/skills/`, Fähigkeiten stehen nur mit Dateinamen
(z.B. `ueben.md`). Lies vor einer Änderung `gemeinsam/grundlagen.md`,
`lernen/SKILL.md`, `verwalten/SKILL.md`, `entwicklung.md` und alle Dateien,
die die Änderung betrifft, vollständig.

| Thema | Datei |
|---|---|
| Gemeinsam für `lernen` und `verwalten`: Pfade, Betriebsart, Nachrichten, Abbruch, Formate, Module, Datenquelle, Gedächtnis | `gemeinsam/grundlagen.md` |
| Lernen: Fähigkeiten und Wechsel, Modul, Dateiprüfung, PDF-Dateien, Probleme pflegen, Regeln der Lernmodi | `lernen/SKILL.md` |
| Lernmodi, Schwachstellen, Skript verbessern, Vorrat (in `ueben.md`) | `lernen/faehigkeiten/` |
| Übungsblatt-Vorlage (Klasse, Farben, `ANLEITUNG.md`, `build.sh`) | `lernen/vorlagen/` |
| Verwalten: Fähigkeiten, Projektstruktur, Dateien der Datenquelle, automatische Anweisungen | `verwalten/SKILL.md` |
| Einrichten, Fächer, Hochladen, Indizieren, Migrationen, Testen | `verwalten/faehigkeiten/` |
| Konventionen für Fähigkeiten, Export | `entwicklung.md` |
| Prompts der automatischen Anweisungen | `verwalten/geplant/` |
| Text der Projektanweisungen | `verwalten/projektanweisung.md` |
| Fragen zum Lernhelfer | `helfen/SKILL.md` |
| Vorlage der Webseite von „Skript verbessern“ | Repository `ohmtools/lernhelfer-skript` (eigene `CLAUDE.md`) |

## Regeln

- Die Konventionen in `entwicklung.md` gelten auch für dich. Neue gehören
  dorthin, nicht hierher, denn die Entwicklungsinstanz im Projekt kennt nur
  das Plugin.
- Die Übungsblatt-Vorlage folgt dem ohmtools-Design: `DESIGN.md` in
  https://github.com/ohmtools/design, Abschnitt „Documents“, Farben nur über
  dessen Tokens. Lies es vor jeder sichtbaren Änderung. Eine Regel, die sich
  ändern soll, wird zuerst dort geändert, für alle Apps.
- Prüf nach jeder Änderung mit `claude plugin validate .`. Gewollt sind die
  Warnung zur fehlenden `version` in `plugin.json` (Regel in `entwicklung.md`)
  und, falls er kommt, der Hinweis auf eine Installationszeile für Claude Code
  im README.
- Trag nach jedem Testlauf die Ergebnisse unter „Testläufe“ ein, pass die
  Fähigkeiten an und nimm bestätigte Tests aus `testen.md` heraus.
- Frag nach, bevor du größere Strukturentscheidungen triffst. Der Nutzer
  entscheidet über Aufbau und Abläufe. Kleine Korrekturen (Tippfehler,
  Konsistenz zwischen Dateien) darfst du direkt machen.
- Halte `README.md` kurz. Was Claude nach dem Setup erklären kann, gehört in
  die Fähigkeiten.
- Committe nicht ohne Freigabe des Nutzers.

### Doppelte Stellen

Diese Stellen sind bewusst doppelt und müssen übereinstimmen:

- Repository-URL: `README.md`, `plugin.json` (`homepage`, `repository`),
  `projektanweisung.md`, `helfen/SKILL.md`.
- Lizenz BSD-3-Clause: `LICENSE`, `plugin.json` (`license`), README „Lizenz“.
- Zeiteisen: die Beschreibung in `marketplace.json` und in zeiteisen
  `skill/zeiteisen-generator/.claude-plugin/plugin.json`; der Pfad
  `skill/zeiteisen-generator` in `marketplace.json`, README „Aufbau des
  Repositorys“ und in zeiteisen `CLAUDE.md` und `scripts/NOTES.md`.
- Pfad `skills/gemeinsam/grundlagen.md`: „Grundlagen“ in `lernen/SKILL.md`
  und `verwalten/SKILL.md` (samt Fehlermeldung), `entwicklung.md`
  („Vorbereiten“, „Exportieren“).
- Formatnummern: „Formate“ und Vorlagen in `grundlagen.md`, Vorlagen in
  `modul-bearbeiten.md` und `initialisieren.md`.
- Spalten von `probleme.md` und Aufbau von `info.md` (Beschreibung,
  Lernziele, Prüfung): Vorlagen in `grundlagen.md` und `modul-bearbeiten.md`.
  `ueben.md` („Übungsblatt“, Schritt 1) liest `Dauer` und `Hilfsmittel`.
- Arten am Anfang der Beschreibung im Index (`Skript`, `Übungsblatt`,
  `Altklausur`, `Lösung`, `Formelsammlung`, `Sonstiges`): `grundlagen.md`
  (Vorlage `index.md`), `indizieren.md` (Schritt 4). Darauf verlassen sich
  `wiederholen.md` („Skript durchgehen“), `skript-verbessern.md` (Schritt 1)
  und `ueben.md` („Klausurprofil“, „Aufgaben mit neuen Werten“).
- Wechsel zwischen Fähigkeiten: `entwicklung.md`, „Fähigkeit wechseln“ in
  `lernen/SKILL.md`, Grundregel in `verwalten/SKILL.md`.
- Mehrere Module nur in automatischen Anweisungen: `lernen/SKILL.md` („Mit
  einem Modul arbeiten“), `entwicklung.md`.
- Zugriff auf die Datenquelle mit git: Vorlage für `daten.xml` in
  `initialisieren.md`, Befehle in `hochladen.md`, dort auch das leere
  Repository (`Not a valid object name HEAD`, dann
  `symbolic-ref HEAD refs/heads/main`).
- GitHub-Anbindung nur für den Zugriff, nicht für den Klon:
  `initialisieren.md` (Schritt 3, Punkt 4, und Vorlage für `{zugriff}`),
  `hochladen.md` (Schritt 3).
- Lesezugriff auf ein privates Repository vor dem Anlegen automatischer
  Anweisungen, weil ein Lauf keine GitHub-Anbindung hat: `verwalten/SKILL.md`
  („Einrichten“, Schritt 3), Vorlage für `{zugriff}` in `initialisieren.md`
  (ohne Werkzeug direkt klonen).
- Modulhandbuch am Dateinamen erkennen („Modulhandbuch“ oder „Lehrplan“):
  `verwalten/SKILL.md` („Dateien der Datenquelle“), Abschlussnachricht in
  `initialisieren.md`, `modul-bearbeiten.md`, `helfen/SKILL.md`.
- Beschreibung, Lernziele und Prüfung aus dem Modulhandbuch auslesen:
  `indizieren.md` (Schritt 5), `modul-bearbeiten.md` („Lernziele
  übernehmen“, Schritte 3 und 4).
- Seiten zählen mit `pdftotext` und `\f`: `lernen/SKILL.md`
  („PDF-Dateien“), `indizieren.md` (Schritt 4).
- Schreibreihenfolge bei `daten.xml`, folgt aus „Abbruch“ in
  `grundlagen.md`: in `indizieren.md` erst der Index, zuletzt `daten.xml`, in
  `modul-bearbeiten.md` („Neues Modul anlegen“, „Dateien zuordnen“) erst
  `daten.xml`, dann der Index.
- Niveaus (Leicht, Klausurniveau, Klausurniveau+, Expertenniveau): `ueben.md`
  („Niveau“, „Übungsblatt“ Schritt 2, „Vorrat“), Prompt „Übungsblätter
  vorbereiten“, `helfen/SKILL.md`.
- Übungsblatt-Vorlage:
  - Schriften und Silbentrennung: `uebungsblatt.cls` (Abschnitte 1 und 2),
    `ANLEITUNG.md` (Kapitel 1).
  - Dateien und Übersetzen: Kopf von `uebungsblatt.cls`, `uebungsblatt.tex`
    und `beispiel.tex`, `ANLEITUNG.md` (Kapitel 1, 3 und 11), `build.sh`,
    `ueben.md` („Übungsblatt“, Schritte 7 und 8, und „Vorrat“, „Benutzen“,
    Schritt 2).
  - Farben: `ohmtools-colors.sty` ist eine unveränderte Kopie von
    `dist/ohmtools-colors.sty` aus `ohmtools/design`, nach einer Änderung dort
    neu kopieren. Die Farbnamen stehen in `ANLEITUNG.md` (Kapitel 7) und
    `entwicklung.md`.
  - Darstellungen: `ueben.md` („Übungsblatt“, Schritt 4), `ANLEITUNG.md`
    (Kapitel 12).
- Automatische Anweisungen (die Prompts liegen wörtlich in Claude.ai und
  wandern bei einem Update nicht mit):
  - Vorspann (niemand liest mit, keine Rückfragen, „Abbruch“): beide Dateien
    in `verwalten/geplant/`.
  - Worauf die Prompts verweisen: „Abbruch“ in `grundlagen.md`, „Vorrat“ in
    `ueben.md` (dort auch die Spalte `Thema` für `% themen:`), „Dateiprüfung“
    und „Session beenden“ in `lernen/SKILL.md`, die Spalte `Historie` von
    `probleme.md` in `grundlagen.md`. Die Anfrage im Prompt „Übungsblätter
    vorbereiten“ (Stoff, Umfang, Niveau, „ohne Vorrat“) passt zu den
    Rückfragen in `ueben.md` („Übungsblatt“, Schritt 2).
  - Nach einem Update neu einrichten: `entwicklung.md` („Exportieren“,
    `{automatik-hinweis}`), `helfen/SKILL.md`.
  - Name `Lernhelfer: {name} ({projekt})` mit dem Projektnamen aus der
    Projektübersicht: `verwalten/SKILL.md`, Nachrichten ohne Werkzeug in
    `automatische-anweisungen.md`, `helfen/SKILL.md`.
- Skript verbessern:
  - URL der Vorlage `https://github.com/ohmtools/lernhelfer-skript`:
    `skript-verbessern.md`, `entwicklung.md` („Vorlagen“), `testen.md`
    (Test 1), `helfen/SKILL.md`, README.
  - Was `skript-verbessern.md` von der Vorlage benutzt, muss zu ihrem
    Hauptzweig passen: die Markierungen (`:::variablen`, `:::anmerkung`,
    `:::denkanstoss`, `:::grafik`, `:::interaktiv`, `:::frage`, `:::auswahl`,
    `:::rechnen`, `:anm`, `::seite[n]`; dort in `plugins/ergaenzungen.mjs` und
    `ANLEITUNG.md`), die Befehle (`npm ci --omit=dev`, `npm run wortlaut`,
    `mdx`, `pruefen`, `build`, `quelle`, `ausschnitt`), `src/inhalt/`,
    `skript.json`, `dist/index.html`, der Ordner `lernhelfer-skript/` in der
    ZIP und die Kapitel „Originaltext“ („Ausschneiden“), „Angaben zum Skript“
    und „Häufige Fehler“ der Anleitung. `testen.md` (Test 1) nennt ihr
    Beispiel („Grundlagen der Elektrotechnik“, Kapitel 2 mit Regler für R).
  - Etappen (höchstens ein Kapitel und 20 Seiten, ZIP `{name}-quelle.zip`
    zum Weitermachen): `skript-verbessern.md`, `helfen/SKILL.md`.

## Stand

- Das Plugin liegt in `lernhelfer/` (`"source": "./lernhelfer"`), damit
  Claude.ai nur `plugin.json` und `skills/` bereitstellt. „Entwicklung“
  arbeitet deshalb mit `kopie:` = `arbeit:lernhelfer-entwicklung/lernhelfer/`,
  die Dateien des Repositorys liegen nur mit angehängtem Archiv eine Ebene
  darüber.
- Was `lernen` und `verwalten` beide brauchen, steht nur in
  `gemeinsam/grundlagen.md` (kein Skill). `lernen` arbeitet mit genau einem
  Modul und schreibt nur `probleme.md`, `benutzererfahrung.md` und den
  Vorrat, `verwalten` schreibt überall. Zu einer anderen Fähigkeit wechselt
  nur `lernen`, zum anderen Skill keiner, Verweise darauf stehen als
  „/lernhelfer:{skill} {satz}“.
- Alle Formate sind 1, es gibt keine Migration, und das Plugin wird noch
  nicht genutzt. Deshalb gibt es keine Regeln für ältere Dateien, und neue
  Felder kamen ohne neue Formatnummer dazu (`Ursache` in `probleme.md`,
  „Prüfung“ in `info.md`, die Art im Index).
- Die Datenquelle (freiwillig, zurzeit nur ein GitHub-Repository) gibt es,
  weil `project_read` von Uploads der Projektseite nur extrahierten Text
  liefert, ohne leere Seiten und ohne die PDF. Identifikation ist die
  Git-Objekt-ID aus `ls-tree` eines Klons ohne Dateiinhalte.
- Die Lernmodi stammen fachlich aus dem „AI Study Playbook“ des Nutzers.
  Claude in Claude.ai kennt es nicht, alles Nötige steht im Plugin.

### Entscheidungen des Nutzers

Nicht ohne Rückfrage ändern:

- Zeiteisen als `git-subdir` statt Submodule, mit `plugin.json` statt
  `"strict": false`.
- „Hochladen“ schreibt über die GitHub-Anbindung von Claude.ai.
- Automatische Anweisungen: Der Prompt kommt wörtlich in Claude.ai, nach
  Updates neu einrichten. Neue anlegen und alte anhand ihrer ID löschen statt
  sie zu ändern, obwohl das die Chats ihrer Läufe entfernt. Den Projektnamen
  aus der Projektübersicht nehmen, nicht speichern. Ein Prompt ruft
  Fähigkeiten wie ein Nutzer auf und beschreibt keinen Ablauf.
- Übungsblatt: erst ein Entwurf in Markdown, dann `ANLEITUNG.md` und LaTeX,
  damit die Aufgaben nicht unter vielen Regeln leiden. Es richtet sich nach
  der typischen Klausur, Routineaufgaben fallen nie ganz weg. „Aufgabe mit
  neuen Werten“ ist das Niveau Leicht. Nennt die Anfrage bestimmte Aufgaben,
  gibt es ohne Rückfrage ein Blatt auf Leicht, auch mit nur einer.
- Übungsblatt-Vorlage: keine Nummer, jede Aufgabe auf einer eigenen,
  vertikal zentrierten Seite (am Tablet ohne Scrollen), ohne deutsche
  Trennmuster keine Silbentrennung, Schaltzeichen nach DIN EN 60617, aber
  Spule und Transformator als gefülltes Rechteck.
- Vorrat: beliebig viele Blätter pro Modul auf Klausurniveau+, vor dem
  Speichern geprüft und danach nie wieder. Entsteht im Lauf kein übersetzter
  Quelltext, hört er ganz auf und speichert nichts.
- Korrigieren: erst eine wörtliche Abschrift einer angehängten Lösung, auch
  mit den Fehlern. Auch Fehler der Arbeitsweise (Flüchtigkeit, Zeitdruck)
  kommen in `probleme.md`. Zu Üben wechselt es nie.
- Wiederholen speichert den Fortschritt im Skript nicht, sondern nennt einen
  Satz zum Weitermachen.
- Skript verbessern: Vorlage im eigenen Repository, immer vom Hauptzweig,
  Originaltext wortgleich, Ergänzungen nur in Markierungen.
- `daten.xml` liegt in der Wurzel und heißt beim Zugriff `/daten.xml`. Ein
  Ordner bräuchte eine Migration.
- Bewusst ohne Regel: Dateien, die ein Nutzer über die Projektseite hochlädt.

## Testläufe

Bisher vom 2026-10-10 bis 2026-10-23 im Browser und in der iPad-App, mit Haiku
5.5 und Opus 5.5, zuletzt „Testen“ (Tests 1 bis 3) und ein Lauf einer
Testanweisung. Was sie bestätigt haben, steht in den Fähigkeiten. Einzelheiten
und frühere Folgen stehen im Verlauf dieser Datei (`git log -p -- CLAUDE.md`).

### Bestätigt

- Plugin: Claude.ai stellt den Ordner unter
  `/mnt/skills/plugin-files/lernhelfer/` bereit. `Skill` meldet „Base
  directory for this skill: …/skills/{skill}“, daraus ergeben sich `skill:` und
  `plugin:`. In einer geplanten Anweisung liegt es unter
  `/root/.claude/plugins/synced/…/lernhelfer/`, der Skill kommt dort über den
  Befehl im Prompt.
- Werkzeuge: `git` 2.43, `python3` 3.13 mit NumPy und SciPy (SymPy mit
  `pip install sympy`), poppler 24.02, `pypdf`, `pdfplumber`, Node 22, npm 10,
  `zip`, `curl`, `gh`, Websuche. PyMuPDF fehlt. pdfTeX aus TeX Live 2023
  ohne `texlive-fonts-extra` (kein Inter) und `texlive-lang-german`. Manche
  Werkzeuge sind nur nachladbar (`ToolSearch`).
- Projektdateien: Werkzeug `Projects` (`project_info` mit `name`, `docs` und
  `files`, `project_read`, `project_write` mit `content` oder `local_path` nur
  aus `/home/claude`, `project_delete`). Dateien ohne Ordner gehen nur mit
  Schrägstrich davor.
- Chat: Anhänge liegen byte-genau unter `/root/.claude/uploads/…`.
  `AskUserQuestion` nimmt 2 bis 4 Optionen, sonst `InputValidationError`, und
  der Nutzer sieht nichts. `SendUserFile` mit `display: render` zeigt die
  Webseite von „Skript verbessern“ im Browser.
- GitHub: `add_repo` gibt git über den Proxy Zugriff, pro Chat. Klon ohne
  Dateiinhalte, `checkout` einer Datei und Push gehen. `api.github.com`,
  Archive über `github.com` und `git push --delete` liefern HTTP 403. Pushes
  melden manchmal `push negotiation failed`, enden aber mit Exit-Code 0.
- Geplante Anweisungen: `create_trigger` kennt weder Modell noch Projekt, das
  Modell setzt `update_trigger`. Ein Lauf ist ein neuer Chat im Projekt des
  anlegenden Chats, mit Plugin, Projektwerkzeugen, `pdflatex` und dessen
  GitHub-Zugriff, aber ohne `add_repo`. `list_triggers` zeigt die Anweisungen
  aller Projekte ohne ihr Projekt, `delete_trigger` löscht auch die Chats der
  Läufe. Startzeiten verschieben sich um einige Minuten.
- `Write` entfernt Leerzeichen am Zeilenende.
- Lokal: Die Übungsblatt-Vorlage übersetzt das Beispiel ohne Overfull-Box
  (18 und 22 Seiten, `build.sh` etwa 20 s). Mit git über `file://` gehen
  Commit und Push aus dem Klon ohne Dateiinhalte, auch in ein leeres
  Repository nach `symbolic-ref`.

### Ungeprüft

- Push großer Dateien (die Antwort von `add_repo` nennt HTTP 413). Zeigt sich
  beim ersten Hochladen eines echten Skripts.
- Push in ein Repository ganz ohne Commit nach `symbolic-ref` (nur lokal).
- Wie viel das Lesen großer Modulhandbücher kostet.
- Wöchentliche Läufe mit `CRON_TZ=Europe/Berlin`, Benachrichtigung per
  E-Mail und `checkout` einer Datei in einem Lauf.
- Warum zwei ältere geplante Anweisungen mit `ended_reason`
  `auto_disabled_install_removed` ausgeschaltet sind. Vermutung: Eine
  Neuinstallation des Plugins schaltet sie aus. Dann sollte `helfen/SKILL.md`
  das Neueinrichten auch dafür nennen.
- Ein Kamerafoto direkt aus der iPad- oder iPhone-App (HEIC?).
- Ob ein Abbruch am Nutzungslimit mitten in einem Aufruf zum Schreiben
  passieren kann.
- Ob Settings > Usage den Reset des Wochenlimits zeigt.
- Die Webseite von „Skript verbessern“ in der iPad-App (Anzeige, Regler per
  Touch, `pdfimages`; `testen.md`, Test 1).

### Nächster Testlauf

1. „/lernhelfer:verwalten Teste den Lernhelfer“ als erste Nachricht in einem
   neuen Chat in der iPad-App.
2. In einem Projekt mit privater Datenquelle mit Skript, Altklausur und
   Modulhandbuch „/lernhelfer:verwalten Richte die automatischen Anweisungen
   ein“, den ersten wöchentlichen Lauf beider Anweisungen abwarten (Index mit
   Dateiinhalten, Vorrat, Benachrichtigung, Modell, Startzeit), dann „Mach mir
   ein Übungsblatt“ mit vorbereitetem Blatt.
3. Die Lernmodi, je im Projekt und im Chat ohne Projekt:
   - „Ich erkläre dir jetzt die Kettenregel“ (Spiegeltest), „Frag mich zu
     Kapitel 3 ab“, „Lass uns das Skript durchgehen“ (bei einer Lücke Wechsel
     zu Erlernen und zurück zur selben Seite).
   - „Gib mir Aufgabe 2 von Blatt 3 mit anderen Zahlen, aber so, dass es kein
     Maximum gibt“ (Leicht ohne Rückfrage, neue Werte nachgerechnet).
   - „Mach mir ein Übungsblatt“: auf Leicht (nur bestehende Aufgaben, eine
     mit anderem Verhalten), ohne Vorgabe (höchstens drei Rückfragen, Entwurf
     vor `ANLEITUNG.md`, Deckblatt ohne `??`, Routineanteil wie in der
     Altklausur, `Niveau:` in „Zur Aufgabe“), auf Expertenniveau (auch die
     Routine schwerer, ohne Fremdwissen und Fangfragen) und in einem Fach ohne
     Altklausur.
   - „Verbessere Kapitel 2 meines Skripts“ im Projekt mit einer Schwachstelle
     im Kapitel und im Chat mit angehängter PDF (Wortlaut, Abbildungen,
     Fragen, Seite und ZIP), danach „Mach mit dem Skript weiter“ und in einem
     neuen Chat mit der ZIP.
   - Foto einer fehlerhaften Lösung (Abschrift mit den Fehlern vor der
     Bewertung, Fischgräte, Eintrag mit Ursache, Wechsel zu Erlernen oder
     Wiederholen).
