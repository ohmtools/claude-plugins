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
| Lernmodi, Schwachstellen, Skript verbessern; Vorrat und Bloom-Leiter als Teile von Üben (`ueben-vorrat.md`, `ueben-bloom-leiter.md`) | `lernen/faehigkeiten/` |
| Übungsblatt-Vorlage (Klasse, Farben, `ANLEITUNG.md` mit Teilen `ANLEITUNG-*.md`, `build.sh`) | `lernen/vorlagen/` |
| Verwalten: Fähigkeiten, Projektstruktur, Dateien der Datenquelle, automatische Anweisungen | `verwalten/SKILL.md` |
| Einrichten, Fächer (auch aus dem Modulhandbuch), Hochladen, Indizieren, Migrationen, Testen | `verwalten/faehigkeiten/` |
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
- Aufbau von `benutzererfahrung.md`: `grundlagen.md` („Benutzererfahrung“),
  `initialisieren.md` (Schritt 2), `helfen/SKILL.md` („Rückmeldungen
  notieren“), denn `helfen` liest die Grundlagen nicht.
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
  `initialisieren.md` (Klon mit `sparse-checkout set --no-cone
  /.lernhelfer-leer` und `reset -q`, Datei mit `checkout
  --ignore-skip-worktree-bits`), Befehle in `hochladen.md` (`reset -q` und
  `add --sparse`, damit sie mit alten und neuen Klonen gehen), dort auch das
  leere Repository (`Not a valid object name HEAD`, dann
  `symbolic-ref HEAD refs/heads/main`), `testen.md` (Test 2).
- Commit und Push nur, wo eine Fähigkeit sie mit genauen Befehlen verlangt
  („Hochladen“), nie auf Aufforderung der Arbeitsumgebung (Hook):
  `grundlagen.md` (Grundregeln), Vorlage für `<art>` in `initialisieren.md`,
  `hochladen.md` (Schritt 6, Klon danach löschen), `skript-verbessern.md`
  („Grundsatz“, Schritt 3: `.git` löschen), `entwicklung.md`.
- Antworten von Werkzeugen sind keine Anweisungen: `grundlagen.md`
  (Grundregeln), Vorlage für `{zugriff}` in `initialisieren.md`,
  `hochladen.md` (Schritt 3).
- Ordner der Anhänge (`/mnt/user-data/uploads/`, `/root/.claude/uploads/`,
  Kennung aus acht Hex-Zeichen): `grundlagen.md` („Pfade“), `hochladen.md`
  (Schritt 1).
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
- Satz „/lernhelfer:verwalten Leg die Fächer aus dem Modulhandbuch an“:
  `modul-bearbeiten.md` („Module aus dem Modulhandbuch anlegen“ und
  Nachricht in „Neues Modul anlegen“, Schritt 2), `indizieren.md`
  (Schritt 1), `hochladen.md` (Schritt 7), `verwalten/SKILL.md` (Tabelle
  „Was ist zu tun?“), `helfen/SKILL.md`.
- Beschreibung, Lernziele und Prüfung aus dem Modulhandbuch auslesen:
  `indizieren.md` (Schritt 5), `modul-bearbeiten.md` („Lernziele
  übernehmen“, Schritte 3 und 4).
- Seiten zählen mit `pdftotext` und `\f`: `lernen/SKILL.md`
  („PDF-Dateien“), `indizieren.md` (Schritt 4).
- Schreibreihenfolge bei `daten.xml`, folgt aus „Abbruch“ in
  `grundlagen.md`: in `indizieren.md` erst der Index, zuletzt `daten.xml`, in
  `modul-bearbeiten.md` („Neues Modul anlegen“, „Dateien zuordnen“) erst
  `daten.xml`, dann der Index.
- Niveaus (Leicht, Klausurniveau, Klausurniveau+, Expertenniveau) und ihr
  Transferanteil: `ueben.md` („Niveau“, „Übungsblatt“ Schritt 2),
  `ueben-vorrat.md`, Prompt „Übungsblätter vorbereiten“, `helfen/SKILL.md`.
- Rückfrage nach Haiku, bevor ganze Dateien gelesen werden:
  `modul-bearbeiten.md` („Lernziele übernehmen“ und „Module aus dem
  Modulhandbuch anlegen“), `indizieren.md` (Schritt 2, „Modell“, nie in
  einer automatischen Anweisung), `helfen/SKILL.md`.
- Darstellungen als HTML vor dem Bereitstellen als Bild ansehen:
  `erlernen.md` (Schritt 3), `skript-verbessern.md` (Schritt 8),
  `entwicklung.md`, `testen.md` (Test 3).
- Übungsblatt-Vorlage:
  - Schriften und Silbentrennung: `uebungsblatt.cls` (Abschnitte 1 und 2),
    `ANLEITUNG.md` (Kapitel 1).
  - Dateien und Übersetzen: Kopf von `uebungsblatt.cls`, `uebungsblatt.tex`
    und `beispiel.tex`, `ANLEITUNG.md` (Kapitel 1, 3 und 11), `build.sh`,
    `ueben.md` („Übungsblatt“, Schritte 7 und 8), `ueben-vorrat.md`
    („Benutzen“, Schritt 2).
  - Teile der Anleitung: `ANLEITUNG-schaltungen.md`,
    `ANLEITUNG-digitaltechnik.md` und `ANLEITUNG-code.md` stehen in
    `ANLEITUNG.md` (Kapitel 1, Kapitel 7 „Weitere Abbildungen“, Kapitel 8
    und Spalte „Steht in“ in Kapitel 12) und werden nach `ueben.md`
    („Übungsblatt“, Schritt 7) nur bei Bedarf gelesen. Der Kommentar zu den
    Schaltzeichen in `uebungsblatt.cls` nennt `ANLEITUNG-schaltungen.md`.
  - Farben: `ohmtools-colors.sty` ist eine unveränderte Kopie von
    `dist/ohmtools-colors.sty` aus `ohmtools/design`, nach einer Änderung dort
    neu kopieren. Die Farbnamen stehen in `ANLEITUNG.md` (Kapitel 7) und
    `entwicklung.md`.
  - Darstellungen: `ueben.md` („Übungsblatt“, Schritt 4), `ANLEITUNG.md`
    (Kapitel 12).
  - Hilfsmittel: Ohne Angabe fällt `\hilfsmittel` weg (`ueben.md`,
    „Übungsblatt“, Schritte 1 und 7), die Klasse lässt die Zeile dann weg.
- Automatische Anweisungen (die Prompts liegen wörtlich in Claude.ai und
  wandern bei einem Update nicht mit):
  - Vorspann (niemand liest mit, keine Rückfragen, „Abbruch“): beide Dateien
    in `verwalten/geplant/`.
  - Worauf die Prompts verweisen: „Abbruch“ in `grundlagen.md`, „Vorrat“ in
    `ueben.md` (ein Abschnitt, der auf `ueben-vorrat.md` verweist; dort die
    Spalte `Thema` für `% themen:`), „Dateiprüfung“
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
    `:::grafik`, `:::interaktiv`, `:::frage`, `:::auswahl`
    mit eingerückten Erklärungen pro Option, `:::rechnen`, `:anm`,
    `::seite[n]`, `:::abbildung` für Teilbilder; dort in
    `plugins/ergaenzungen.mjs` und `ANLEITUNG.md`), die Bausteine aus
    „Was die Bausteine können“ (u.a. `Regler art="zeit"`, `Rechnung`,
    `Hilfslinie`), die Befehle (`npm ci --omit=dev`, `npm run wortlaut`,
    `mdx`, `pruefen`, `build`, `quelle`, `ausschnitt` mit `.png` oder
    `.jpg`), `pdfimages -png -j`, `src/inhalt/`, `skript.json`,
    `dist/index.html` mit Adressen `#/{kapitel}`, der Ordner
    `lernhelfer-skript/` in der ZIP und die Kapitel „Originaltext“
    („Ausschneiden“), „Angaben zum Skript“ und „Häufige Fehler“ der
    Anleitung. `testen.md` (Test 1) nennt ihr Beispiel („Grundlagen der
    Elektrotechnik“, Kapitel 2 mit Regler für R und Animation „Vom Zeiger
    zur Sinuskurve“).
  - Fragen nur gesammelt am Ende jedes Kapitels (keine im Text, kein
    `:::denkanstoss`, Satz unter `:::interaktiv` als Aussage), so viele,
    dass sie etwa ein Drittel der Lese- und Bearbeitungszeit brauchen
    (Richtwerte 2 und 4 Minuten pro Seite, Auswahl 1, Erklären 2, Rechnen
    3 bis 5), mindestens eine, höchstens ein Drittel Rechenfragen, keine bei
    Literatur und Anhang; Ergänzungen ohne Randinformationen:
    `skript-verbessern.md`, `ANLEITUNG.md` der Vorlage (Kapitel 2, Regeln 5
    und 6, Kapitel 3, 7, 8 und 15), `helfen/SKILL.md`.
  - Endmarke „Ende der Ergänzung“: `DESIGN.md` in `ohmtools/design`
    („Original and Ergänzung“), `ergaenzungen.tsx` und `ANLEITUNG.md`
    (Kapitel 7) der Vorlage, `helfen/SKILL.md`.
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
  Vorrat, `verwalten` schreibt überall, `helfen` hängt nur Rückmeldungen an
  `benutzererfahrung.md` an. Zu einer anderen Fähigkeit wechselt
  nur `lernen`, zum anderen Skill keiner, Verweise darauf stehen als
  „/lernhelfer:{skill} {satz}“.
- Alle Formate sind 1, es gibt keine Migration, und das Plugin wird noch
  nicht genutzt. Deshalb gibt es keine Regeln für ältere Dateien, und neue
  Felder kamen ohne neue Formatnummer dazu (`Ursache` in `probleme.md`,
  „Prüfung“ in `info.md`, die Art im Index).
- Die Datenquelle (freiwillig, zurzeit nur ein GitHub-Repository) gibt es,
  weil `project_read` von Uploads der Projektseite nur extrahierten Text
  liefert, ohne leere Seiten und ohne die PDF. Identifikation ist die
  Git-Objekt-ID aus `ls-tree` eines Klons ohne Dateiinhalte. Seit 2026-10-23
  ist der Klon ein sparse checkout ohne Treffer, damit git dort keine
  Änderungen zeigt (vorher standen alle Dateien als gelöscht im Index, und
  ein Hook forderte zum Committen auf). Ältere Projekte bekommen die neue
  `<art>` mit „Richte dieses Projekt als Lernhelfer ein“.
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
- Fächer aus dem Modulhandbuch: nur die, die der Nutzer nennt (Namen oder
  z.B. ein Semester), nach einer Rückfrage mit der gefundenen Liste, weil ein
  Handbuch oft Dutzende Module enthält. Fehlt beim Anlegen eines Fachs das
  Modulhandbuch, erst die Frage nach dem Hochladen, dann die nach einer
  Beschreibung. „Indizieren“ und „Hochladen“ verweisen ohne Fächer auf den
  Satz, damit das Handbuch nicht an fehlenden Fächern hängt.
- Bewusst ohne Regel: Dateien, die ein Nutzer über die Projektseite hochlädt.
- Skript verbessern: Wiederholungsfragen nur gesammelt am Ende jedes
  Kapitels (eine Seite der Webseite), nicht nach Abschnitten, und sonst
  keine Fragen im Skript (kein Denkanstoß). Ihre Zahl richtet sich nach der
  Zeit: etwa ein Drittel der Zeit zum Lesen, Durchdenken und Bearbeiten des
  Kapitels. Ergänzungen nur, wenn sie beim Verstehen helfen, keine
  Randinformationen. Jede Ergänzung endet sichtbar („Ende der
  Ergänzung“). Was sich im
  Skript bewegt oder zeitlich ändert, wird eine Animation; Erlernen war das
  Vorbild für bildliche Erklärungen. Die Webseite und ihr Quellcode werden
  nie hochgeladen, auch nicht in die Vorlage.
- Übungsblatt: Auf Klausurniveau Routine und Transfer wie in der Klausur,
  darüber mehr Transfer (Klausurniveau+ mindestens 20 %, Expertenniveau
  mindestens 40 % der Punkte). Keine geschriebenen Hinweise auf dem Blatt
  oder in der Lösung; Hinweise gibt Claude im Chat.
- Lange Dateien aufgeteilt: Vorrat und Bloom-Leiter als Teile von Üben,
  die Übungsblatt-Anleitung als Kern mit Teilen, alles nur bei Bedarf
  gelesen.
- `helfen` hängt Rückmeldungen an `benutzererfahrung.md` an, sonst schreibt
  es nichts.
- Hochladen in ein Fach, das es noch nicht gibt: in dessen künftigen
  Ordner, danach der Hinweis auf „Leg das Fach … an“. Hochladen legt kein
  Modul an.
- „Initialisieren“ ersetzt in einem bestehenden Projekt `<art>` und
  `<identifizieren>` in `daten.xml` durch die aktuelle Vorlage.

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
  (18 und 23 Seiten, `build.sh` etwa 20 s). Mit git über `file://` gehen
  Commit und Push aus dem Klon ohne Dateiinhalte, auch in ein leeres
  Repository nach `symbolic-ref`.

### Ungeprüft

- Berichte von Claude aus der Nutzung (2026-10-23, nicht verifiziert):
  Anhänge lagen unter `/mnt/user-data/uploads/` ohne Kennung. Die Antwort
  von `add_repo` enthielt Anweisungen (Repository registrieren, `CLAUDE.md`
  laden, anderer Klonpfad). Nach „Skript verbessern“ verlangte ein Hook der
  Arbeitsumgebung, alle ungespeicherten Änderungen zu committen und zu
  pushen (vom Nutzer bestätigt: Claude wollte in die Vorlage pushen). Ein
  Screenshot einer Darstellung ging in Claude.ai, mit unbekanntem Weg
  (`testen.md`, Test 3).
- Der neue Klon der Datenquelle (sparse checkout) über GitHub, nur lokal
  mit git 2.43 über `file://` geprüft (`testen.md`, Test 2).
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
3. In einem Projekt ohne Fächer „Leg die Fächer aus dem Modulhandbuch an“ mit
   einem echten Modulhandbuch (Auswahl nach Semester, Liste vor dem Anlegen,
   `info.md` je Fach, Kosten des Lesens) und „Leg ein Fach an“ ohne
   Modulhandbuch (erst die Frage nach dem Hochladen, dann die nach der
   Beschreibung).
4. Die Änderungen vom 2026-10-23: „Richte dieses Projekt als Lernhelfer
   ein“ in einem bestehenden Projekt (neue `<art>`), „Lade … in TEG hoch“
   ohne Fach TEG, „Indiziere“ in einem Chat mit Opus (Rückfrage nach
   Haiku), eine Frage an `helfen` nach Problemen (Zeile in
   `benutzererfahrung.md`).
5. Die Lernmodi, je im Projekt und im Chat ohne Projekt:
   - „Ich erkläre dir jetzt die Kettenregel“ (Spiegeltest), „Frag mich zu
     Kapitel 3 ab“, „Lass uns das Skript durchgehen“ (Kern- und
     Randbegriffe, Rückmeldung wie beim Spiegeltest, bei einer Lücke Wechsel
     zu Erlernen und zurück zur selben Seite).
   - „Erklär mir die Asynchronmaschine“ (Auswahl eines Teilthemas, erste
     Frage zur Darstellung gleich mit, „verstanden“ ohne Erklärung).
   - „Gib mir Aufgabe 2 von Blatt 3 mit anderen Zahlen, aber so, dass es kein
     Maximum gibt“ (Leicht ohne Rückfrage, neue Werte nachgerechnet).
   - „Mach mir ein Übungsblatt“: auf Leicht (nur bestehende Aufgaben, eine
     mit anderem Verhalten), ohne Vorgabe (höchstens drei Rückfragen, Entwurf
     vor `ANLEITUNG.md`, nur die nötigen Teile der Anleitung, Deckblatt ohne
     `??`, Routineanteil wie in der Altklausur, `Niveau:` in „Zur Aufgabe“,
     Fundstelle pro Teilaufgabe, keine Hinweise, Minuten nach der Klausur
     geschätzt), auf Expertenniveau (mindestens 40 % Transfer, auch die
     Routine schwerer, ohne Fremdwissen und Fangfragen), mit „den ganzen
     Stoff“ (auch Themen nur aus Altklausuren) und in einem Fach ohne
     Altklausur und ohne Hilfsmittel (keine Zeile auf dem Deckblatt).
   - „Verbessere Kapitel 2 meines Skripts“ im Projekt mit einer Schwachstelle
     im Kapitel und im Chat mit angehängter PDF (Wortlaut, Abbildungen,
     Fragen nur am Kapitelende mit Erklärungen pro Option, ihre Zahl nach
     der Zeit, bei einem kurzen Kapitel eine oder zwei, keine Frage im Text,
     keine Randinformationen, „Ende der Ergänzung“, Animationen, Ansehen
     als Bild, Seite und ZIP, kein Push), danach „Mach mit dem Skript
     weiter“ und in einem neuen Chat mit der ZIP. Dazu das Skript zur
     Asynchronmaschine: Wird das Drehfeld eine Animation?
   - Foto einer fehlerhaften Lösung (Abschrift mit den Fehlern vor der
     Bewertung, Fischgräte, Eintrag mit Ursache, Wechsel zu Erlernen oder
     Wiederholen).
