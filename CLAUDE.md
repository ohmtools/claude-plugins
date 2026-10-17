# claude-plugins – Hinweise für Claude Code

Dieses Repository ist der Marketplace `ohmtools` mit Plugins für Claude.ai, die
bei Hochschule und Ausbildung helfen. Jedes Plugin liegt in einem eigenen
Ordner, den Claude.ai als Ganzes bereitstellt (`source` in
`.claude-plugin/marketplace.json`). `README.md` und diese Datei liegen deshalb
außerhalb dieser Ordner. Das README dokumentiert zuerst das allgemeine Setup,
danach jedes Plugin in einem eigenen Abschnitt. Ein neues Plugin bekommt einen
eigenen Ordner, einen Eintrag in `marketplace.json` und einen Abschnitt im
README. Zurzeit gibt es nur den Lernhelfer, um den es im Rest dieser Datei
geht.

Lernhelfer (`lernhelfer/`) ist ein Plugin für Claude.ai mit den Skills
`lernen`, `verwalten` und `helfen`. Ihre Markdown-Anweisungen („Fähigkeiten“)
schreibst du für eine **andere** Claude-Instanz in Claude.ai (Browser und
Mobil-App). Sie kennt weder dieses Repository noch diese Datei, nur das Plugin
und die Projektdateien.

## Wegweiser

| Thema | Datei |
|---|---|
| Installation | `README.md`, Abschnitte „Setup“ und „Lernhelfer“ |
| Plugin und Marketplace | `lernhelfer/.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` |
| Text der Projektanweisungen | `lernhelfer/skills/verwalten/projektanweisung.md` |
| Gemeinsam für `lernen` und `verwalten`: Grundregeln, Pfade, Betriebsart, Nachrichten, Abbruch (nur fertige Dateien ins Projekt), Formate, Module, Datenquelle (`daten.xml`), Gedächtnis, Benutzererfahrung | `lernhelfer/skills/gemeinsam/grundlagen.md` |
| Lernen: Fähigkeiten, Fähigkeit wechseln, Modul bestimmen, Dateiprüfung, Dateien im Chat, PDF-Dateien, Probleme pflegen, gemeinsame Regeln der Lernmodi (Unterlagen, Belege, Nachrechnen, Leitplanken, fällige Themen, Session beenden) | `lernhelfer/skills/lernen/SKILL.md` |
| Lernmodi (Erlernen, Wiederholen, Üben, Korrigieren) und Schwachstellen | `lernhelfer/skills/lernen/faehigkeiten/` |
| Vorlagen für Ausgaben (Übungsblatt: LaTeX-Klasse mit Anleitung und `build.sh`) | `lernhelfer/skills/lernen/vorlagen/`, Konvention in `entwicklung.md` |
| Verwalten: Fähigkeiten und ihre Verfügbarkeit, Projektstruktur, Dateien der Datenquelle, automatische Anweisungen einrichten | `lernhelfer/skills/verwalten/SKILL.md` |
| Automatische Anweisungen (geplante Anweisungen in Claude.ai): Prompts, Einrichten, Ausschalten | `lernhelfer/skills/verwalten/geplant/`, `lernhelfer/skills/verwalten/faehigkeiten/automatische-anweisungen.md` |
| Vorrat an Übungsblättern (`projekt:vorrat/`) | `lernhelfer/skills/lernen/faehigkeiten/ueben.md`, „Vorrat“, und `lernhelfer/skills/verwalten/geplant/2-uebungsblaetter-vorbereiten.md` |
| Konventionen für Fähigkeiten | `lernhelfer/skills/verwalten/faehigkeiten/entwicklung.md`, „Änderungen machen“, Schritt 2 |
| Einrichten, Datenquelle anlegen | `lernhelfer/skills/verwalten/faehigkeiten/initialisieren.md` |
| Fächer, Dateien zuordnen, Lernziele | `lernhelfer/skills/verwalten/faehigkeiten/modul-bearbeiten.md` |
| Hochladen, Indizieren | `lernhelfer/skills/verwalten/faehigkeiten/hochladen.md`, `lernhelfer/skills/verwalten/faehigkeiten/indizieren.md` |
| Migrationen | `lernhelfer/skills/verwalten/faehigkeiten/migrieren.md` |
| Export | `lernhelfer/skills/verwalten/faehigkeiten/entwicklung.md`, „Exportieren“ |
| Annahmen über die Zielumgebung prüfen | `lernhelfer/skills/verwalten/faehigkeiten/testen.md`, Ergebnisse unter „Testläufe“ |
| Antworten auf Fragen zum Lernhelfer | `lernhelfer/skills/helfen/SKILL.md` |

Lies vor einer Änderung `lernhelfer/skills/gemeinsam/grundlagen.md`,
`lernhelfer/skills/lernen/SKILL.md`,
`lernhelfer/skills/verwalten/SKILL.md`, `entwicklung.md` und alle Dateien, die
die Änderung betrifft, vollständig.

## Regeln für dieses Repository

- Die Konventionen in `entwicklung.md` gelten auch für dich.
- Neue Konventionen für Fähigkeiten gehören nach `entwicklung.md`, nicht
  hierher, weil die Entwicklungsinstanz im Projekt nur das Plugin kennt.
- Prüf nach jeder Änderung mit `claude plugin validate .`. Zwei Meldungen
  sind gewollt: die Warnung zur fehlenden `version` in `plugin.json` (sonst
  kämen Commits erst nach einer neuen Version an, Regel in `entwicklung.md`)
  und der Hinweis auf eine Installationszeile für Claude Code im README (der
  Lernhelfer ist für Claude.ai gebaut).
- Trag die Ergebnisse jedes Testlaufs unter „Testläufe“ ein, pass die
  Fähigkeiten an und nimm bestätigte Tests aus `testen.md` heraus
  (Konvention in `entwicklung.md`).
- Diese Stellen sind bewusst doppelt und müssen übereinstimmen:
  - Repository-URL: `README.md`, `plugin.json` (`homepage`, `repository`),
    `projektanweisung.md` und `helfen/SKILL.md`.
  - Pfad der Grundlagen im Plugin (`skills/gemeinsam/grundlagen.md`):
    Abschnitt „Grundlagen“ in `lernen/SKILL.md` und `verwalten/SKILL.md` (dort
    auch die Fehlermeldung) und `entwicklung.md` („Vorbereiten“,
    „Exportieren“).
  - Formatnummern: Tabelle „Formate“ und die Vorlagen in `grundlagen.md`,
    dazu die Vorlagen in `modul-bearbeiten.md` und `initialisieren.md`.
  - Spalten von `probleme.md`: Vorlagen in `grundlagen.md` und
    `modul-bearbeiten.md`.
  - Wechsel zwischen Fähigkeiten: Konvention in `entwicklung.md`, Abschnitt
    „Fähigkeit wechseln“ in `lernen/SKILL.md` und Grundregel in
    `verwalten/SKILL.md`.
  - Zugriff auf die Datenquelle mit git: Vorlage für `daten.xml` in
    `initialisieren.md` und Befehle in `hochladen.md`, dort auch das leere
    Repository (`Not a valid object name HEAD`, dann
    `symbolic-ref HEAD refs/heads/main`).
  - Zugriff am Exit-Code von `ls-remote` erkennen: `initialisieren.md`,
    Schritt 3, und `testen.md`, Test 1.
  - GitHub-Anbindung nur für den Zugriff, nicht für den Klon: `initialisieren.md`
    (Schritt 3, Punkt 4, und Vorlage für `{zugriff}`), `hochladen.md`,
    Schritt 3, und `testen.md`, Test 1.
  - Beschreibung, Lernziele und Angaben zur Prüfung aus dem Modulhandbuch
    auslesen: `indizieren.md`, Schritt 5, und `modul-bearbeiten.md`,
    „Lernziele übernehmen“, Schritte 3 und 4.
  - Aufbau von `info.md` (Abschnitte Beschreibung, Lernziele, Prüfung):
    Vorlagen in `grundlagen.md` und `modul-bearbeiten.md`. `ueben.md`
    („Übungsblatt“, Schritt 1) liest `Dauer` und `Hilfsmittel` daraus.
  - Pakete und Schriften der Übungsblatt-Vorlage: Abschnitte 1 und 2 von
    `lernen/vorlagen/uebungsblatt.cls` und Testdokument in `testen.md`,
    Test 3. Das Testdokument liest die Vorlage nicht selbst, weil ein Skill
    keine Dateien eines anderen Skills liest.
  - Dateien und Übersetzen der Übungsblatt-Vorlage: Kopf von
    `uebungsblatt.cls`, `uebungsblatt.tex` und `beispiel.tex`,
    `ANLEITUNG.md` (Kapitel 1, 3 und 11), `build.sh` und `ueben.md`
    („Übungsblatt“, Schritte 7 und 8).
  - Darstellungen der Übungsblatt-Vorlage: `ueben.md` („Übungsblatt“,
    Schritt 4) und `ANLEITUNG.md`, Kapitel 12.
  - SymPy, NumPy und SciPy nachinstallieren mit `pip install`:
    `lernen/SKILL.md` („Nachrechnen“) und `testen.md`, Test 4.
  - Darstellung als HTML-Datei ohne Dateien aus dem Internet: `erlernen.md`,
    Schritt 3, und `testen.md`, Test 5.
  - Erkennen des Modulhandbuchs am Dateinamen („Modulhandbuch“ oder
    „Lehrplan“): `verwalten/SKILL.md` („Dateien der Datenquelle“), die
    Abschlussnachricht in `initialisieren.md`, `modul-bearbeiten.md` und
    `helfen/SKILL.md`.
  - Seiten zählen mit `pdftotext` und `\f`: `lernen/SKILL.md`
    („PDF-Dateien“) und `indizieren.md`, Schritt 4.
  - Vorspann der automatischen Anweisungen (niemand liest mit, keine
    Rückfragen, „Abbruch“): beide Dateien in `verwalten/geplant/`.
  - Namen von Abschnitten und Schritten, auf die die Prompts in
    `verwalten/geplant/` verweisen: „Abbruch“ in `grundlagen.md`; „Vorrat“,
    „Übungsblatt“, „Prüfen“, „Ohne LaTeX“ und die Optionen für Stoff und
    Umfang in `ueben.md`; „Session beenden“ in `lernen/SKILL.md`. Die Prompts
    liegen wörtlich in Claude.ai und wandern bei einem Update nicht mit.
  - Nach einem Update die automatischen Anweisungen neu einrichten:
    `entwicklung.md` („Exportieren“, `{automatik-hinweis}`) und
    `helfen/SKILL.md`.
  - Schlusszeile `% Ende des Lernhelfer-Vorrats`: `ueben.md` („Vorrat“) und
    `testen.md`, Test 8.
  - Schreibreihenfolge bei `daten.xml`: in `indizieren.md` zuerst der Index,
    zuletzt `daten.xml`, in `modul-bearbeiten.md` („Neues Modul anlegen“,
    „Dateien zuordnen“) zuerst `daten.xml`, dann der Index. Beides folgt aus
    „Abbruch“ in `grundlagen.md`.
  - Mehrere Module nur in automatischen Anweisungen: `lernen/SKILL.md` („Mit
    einem Modul arbeiten“) und `entwicklung.md`.

## Stand

- Aufbau: Plugin mit drei Skills, kein Lernhelfer-Code mehr im Projekt.
  Das Plugin liegt in `lernhelfer/` (`marketplace.json` mit
  `"source": "./lernhelfer"`), damit Claude.ai nur `plugin.json` und
  `skills/` bereitstellt, nicht `README.md` und `CLAUDE.md`. „Entwicklung“
  arbeitet deshalb mit `kopie:` = `arbeit:lernhelfer-entwicklung/lernhelfer/`,
  die Dateien des Repositorys liegen nur mit angehängtem Archiv eine Ebene
  darüber.
  Was `lernen` und `verwalten` beide brauchen, steht nur einmal in
  `lernhelfer/skills/gemeinsam/grundlagen.md` (kein Skill, keine `SKILL.md`).
  Beide `SKILL.md` lassen die Datei vor allem anderen lesen, `helfen` nicht.
  `lernen` arbeitet mit genau einem Modul, liest `module/`, `daten.xml` und
  `daten:` und schreibt nur `gedaechtnis/{modul}/probleme.md`,
  `gedaechtnis/benutzererfahrung.md` und in „Üben“ den Vorrat
  (`vorrat/{modul}/uebungsblatt.tex`). Nur eine automatische Anweisung lässt
  `lernen` mehrere Module nacheinander bearbeiten, jedes für sich.
  `verwalten` darf überall schreiben und mit mehreren Modulen arbeiten.
  Verweise auf den anderen Skill stehen in Nachrichten als
  „/lernhelfer:{skill} {satz}“.
- Wechsel zu einer anderen Fähigkeit desselben Skills: in `lernen` erlaubt,
  z.B. bei einer Lücke zurück zu „Erlernen“, in `verwalten` verboten, dort
  weist eine Fähigkeit nur mit einer Nachricht auf eine andere hin. Zum
  anderen Skill wechselt keiner.
- Daten im Projekt: `daten.xml`, pro Modul `module/{modul}/info.md`
  (Beschreibung, Lernziele, Prüfung) und `module/{modul}/index.md` (Abschnitt
  „Dateien“ als einzige Zuordnung, Stichwortverzeichnis mit Dateiseiten),
  `gedaechtnis/{modul}/probleme.md` (Thema, Beschreibung, Ursache,
  Verstanden, Historie), `gedaechtnis/benutzererfahrung.md` und der Vorrat
  `vorrat/{modul}/uebungsblatt.tex` (ohne Eintrag in „Formate“). Alle Formate
  sind 1, es gibt noch keine Migration. Das Plugin wird noch nicht genutzt.
  Deshalb gibt es keine Regeln für ältere Dateien, und die Spalte `Ursache`
  in `probleme.md` (Fehlerursache, Fischgräte, gefüllt von „Korrigieren“) und
  der Abschnitt „Prüfung“ in `info.md` (Form, Dauer, Hilfsmittel aus dem
  Modulhandbuch, für den Kopf des Übungsblatts) kamen ohne neue Formatnummer
  dazu.
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
  Schrägstrich geschrieben, gelesen und gelöscht (`/daten.xml`, Regel in
  `grundlagen.md`, „Pfade“). Alternative wäre, `daten.xml` in einen Ordner zu
  legen. Das bräuchte eine Migration.
- Lernmodi: Erlernen, Wiederholen, Üben und Korrigieren, fachlich aus dem
  „AI Study Playbook“ des Nutzers übernommen (Claude in Claude.ai kennt es
  nicht, alles Nötige steht im Plugin). Gemeinsame Regeln stehen in
  `lernen/SKILL.md`, Abschnitt „Lernmodi“: Unterlagen anfordern, Belege
  (Unterlagen, dann Websuche, sonst „nicht belegt“), Nachrechnen mit SymPy,
  NumPy und SciPy, Leitplanken (Hinweise statt Lösungen, Arbeit nicht
  umschreiben, ehrlich statt gefällig), fällige Themen 1, 3 und 7 Tage nach
  dem letzten Problem (nur aus `Historie` und `Verstanden`) und eine
  Abrufaufgabe ohne KI am Ende jeder Session.
  - Erlernen: sokratischer Tutor, bei räumlichen oder strukturellen Themen
    eine HTML-Darstellung, die der Nutzer danach ohne Vorlage nachzeichnet.
  - Wiederholen (AFB I und II, höchstens naher Transfer): Spiegeltest,
    Abfragen mit Sicherheit 1 bis 5, Skript Seite für Seite in Etappen,
    bestehende Aufgabe mit neuen Werten (gleicher Lösungsweg oder anderes
    Verhalten, vorher nachgerechnet). Den Fortschritt im Skript speichert der
    Lernhelfer bewusst nicht. Am Ende einer Etappe nennt er den Satz zum
    Weitermachen.
  - Üben (AFB II und III, Schwerpunkt ferner Transfer): Transferaufgaben nach
    dem Transfer-Prompt des Playbooks, als Übungsblatt (erst ein Entwurf in
    Markdown, dann zwei PDFs aus `vorlagen/uebungsblatt.tex` mit der Klasse
    `uebungsblatt.cls` und `build.sh`, ohne LaTeX zwei Markdown-Dateien) oder
    Bloom-Leiter im Chat.
  - Korrigieren: strenger Prüfer, Punkte als Schätzung, Hinweise statt
    Lösung, Fehlerursachen nach Fischgräte mit bis zu fünfmal „Warum?“,
    danach Wechsel zu Erlernen (Verständnis, Vorwissen) oder zu Wiederholen
    mit derselben Aufgabe und neuen Werten (alle übrigen Ursachen). Üben kam
    dafür nicht in Frage: Transferaufgaben helfen bei Flüchtigkeit und
    Zeitdruck wenig und wären nach einer Wiederholen-Aufgabe ein Sprung im
    Niveau.
  Wechsel innerhalb von `lernen` kündigt eine feste Nachricht an, mit
  optionaler Rückkehr (z.B. vom Skript zu Erlernen und zurück zur selben
  Seite).
- Seitenzahlen: Der Lernhelfer zählt Seiten überall wie ein PDF-Programm ab
  1 (Index, Fundstellen, Rückkehr). Zahlen, die der Nutzer nennt, und die
  eines Inhaltsverzeichnisses gelten als aufgedruckte Nummern. Claude sucht
  sie mit `pdftotext` auf bis zu fünf Seiten davor und danach. Der Satz zum
  Weitermachen im Skript enthält die Überschrift als Anker
  (`lernen/SKILL.md`, „PDF-Dateien“).
- Vorlagen: `lernen/vorlagen/` mit der Übungsblatt-Vorlage des Nutzers vom
  2026-10-16, die es vor allem fürs Design gibt: Klasse `uebungsblatt.cls`
  (Deckblatt mit Punkten und Aufgabenliste, jede Aufgabe auf einer eigenen
  Seite, jede Seite vertikal zentriert, damit man am Tablet, z.B. in
  GoodNotes, ohne Scrollen arbeitet, Schrift IBM Plex, sonst Helvetica),
  `ANLEITUNG.md` mit allen Befehlen für KI-Modelle, `beispiel.tex` mit
  `material/` als Beispiel für jeden Befehl. Aufgaben und Lösungen stehen in
  einer Datei: `build.sh [name]` erzeugt daraus `{name}.pdf` ohne und
  `{name}-loesung.pdf` mit Lösungen (Klassenoption `loesung` über
  `-jobname` und `\PassOptionsToClass`, je zwei Durchläufe `pdflatex`,
  latexmk ist ungeprüft). Ausgeblendete Lösungen (`verbatim`-`comment`)
  belegen keinen Platz: Lokal sind die Angaben von `beispiel.tex` und eines
  Probeblatts pixelgleich mit denselben Dateien ohne `loesung` und
  `\nurloesung`. Geändert gegenüber dem Original: `vorlage.tex` heißt
  `uebungsblatt.tex`, die Hilfsdateien `vorlage-loesung.tex` und
  `beispiel-loesung.tex` sind entfallen, die Versionsangabe der Klasse ist
  entfernt (Konvention), Kopf von Klasse, Vorlage und Beispiel und die
  Kapitel 1, 3 und 11 der Anleitung beschreiben `build.sh`. Die
  mitgelieferten PDFs sind nicht im Plugin.
- Übungsblatt in zwei Phasen (Wunsch des Nutzers, damit die Qualität der
  Aufgaben nicht unter vielen geladenen Regeln leidet): `ueben.md` lässt
  erst Aufgaben und Lösungen als `arbeit:uebungsblatt/entwurf.md` schreiben
  (Markdown, Punkte pro Kriterium, Abbildungen in Worten) und liest die
  Anleitung erst danach, zum Setzen in LaTeX. Was das PDF darstellen kann,
  steht deshalb kurz in `ueben.md`, Schritt 4. Ohne LaTeX (`command -v
  pdflatex` vor dem Lesen der Anleitung) werden aus dem Entwurf die zwei
  Markdown-Dateien.
- Bewusst ohne Regel: Dateien, die ein Nutzer trotzdem über die Projektseite
  hochlädt.
- Automatische Anweisungen: geplante Anweisungen des Claude.ai-Projekts,
  einmal pro Woche, jeder Lauf ein neuer Chat. Damit übrige Nutzung nicht
  verfällt, empfiehlt Claude zwei Stunden vor dem Reset des Wochenlimits (der
  Nutzer nennt den Reset aus Settings > Usage, Zeitzone `Europe/Berlin`). Jede
  Datei in `lernhelfer/skills/verwalten/geplant/` wird eine Anweisung
  `Lernhelfer: {name}`: Frontmatter `name`, `modell` (nur die Reihe, gemeint
  ist die neueste Fassung) und `benachrichtigung` (`push`, `email`, `slack`
  oder `keine`), danach der Prompt. Der Prompt kommt wörtlich in Claude.ai, so
  hat es der Nutzer entschieden, deshalb nach Updates neu einrichten. Die
  Nummer im Dateinamen gibt die Reihenfolge, 30 Minuten Abstand. Zurzeit:
  Indizieren (Haiku) und Übungsblätter vorbereiten (Opus), beide mit `push`.
  „Initialisieren“ fragt danach, wenn es eine Datenquelle einrichtet, sonst
  „Automatische Anweisungen“ (einrichten, Zeit ändern, ausschalten,
  anzeigen). Neue Anweisungen werden vor dem Löschen der alten angelegt. Ohne
  Werkzeug nennt Claude die Einstellungen zum Anlegen von Hand.
- Vorrat: pro Modul höchstens ein Übungsblatt, 45 Minuten, Schwachstellen und
  fällige Themen (so hat es der Nutzer entschieden), als LaTeX-Quelltext,
  weil PDFs nicht in die Projektdateien passen, deshalb ohne eigene Dateien
  (`\bild`, `\codedatei`). Beim Benutzen kommen `uebungsblatt.cls` und
  `build.sh` aus der Vorlage dazu. Kopf mit `format`, Themen und
  `quelle` (Identifikation und Pfad jeder gelesenen Datei), Schlusszeile
  `% Ende des Lernhelfer-Vorrats`. Üben bietet ein gültiges Blatt als erste
  Rückfrage an, übersetzt es, löscht es und stellt es dann bereit. Ungültige
  löscht erst der nächste Lauf. Ein geänderter Kopf erhöht `% format:` statt
  einer Migration. Module ohne Schwachstellen bekommen kein Blatt.
- Abbruch: Claude sieht das restliche Limit nicht, ein Chat kann nach jedem
  Schritt enden. Ins Projekt kommen nur fertige Dateien, je mit einem Aufruf,
  große aus `arbeit:` mit `local_path`. Abhängige Dateien werden so
  geschrieben, dass ein Abbruch nur Arbeit wiederholt: Indizieren schreibt nach
  jeder Datei erst die Indexe, dann ihre Identifikation in `daten.xml` (die
  Dateiprüfung blendet halb indizierte Dateien aus). Die Regel „wird der
  Kontext knapp …“ ist dadurch entfallen.
- Rückfragen: Mehr Optionen, als die Auswahlfelder zulassen, gehen als Text
  mit nummerierter Liste raus, bei nur einer Option entfällt die Rückfrage,
  eigenen Text ordnet Claude einer Option zu (`grundlagen.md`, „Nachrichten
  und Rückfragen“).

## Testläufe

Mit dem Plugin am 2026-10-16: erst im Browser je einmal mit Haiku 5.5 und
Opus 5.5 (alle damaligen Tests), dann in der iPad-App mit Opus 5.5 (Dateien
ohne Ordner, Hochladen in den Hauptzweig), in einem Projekt mit privater
Datenquelle. Davor 2026-10-10 ohne Plugin, Version 0.11.2 und 0.14.0, im
Browser und in der iPad-App.

### Bestätigt

- Plugin: läuft im Browser und in der iPad-App. Claude.ai stellt den ganzen
  Plugin-Ordner unter `/mnt/skills/plugin-files/lernhelfer/` bereit, auch
  `README.md` und `CLAUDE.md`. Die Rückmeldung des Werkzeugs `Skill` beginnt
  mit „Base directory for this skill: …/skills/{skill}“, daraus ergeben sich
  `skill:` und `plugin:`, und `../gemeinsam/grundlagen.md` wird gefunden.
  Installiert über `marketplace.json` mit `"source": "./"`.
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
  `knowledge_size`. Pfade mit Ordner bleiben, wie geschrieben. Ersetzen mit
  `project_write` behält `doc_uuid` und `created_at` (über die Projektseite
  ändert sich `created_at`).
- Dateien ohne Ordner: Laut Beschreibung von `project_write` landet ein Pfad
  ohne `/` unter `claude/`. Mit Schrägstrich (`/daten.xml`) klappen
  Schreiben, Lesen, Ersetzen (`replaced: true`, kein zweiter Eintrag) und
  Löschen, und die Übersicht zeigt die Datei so. Lesen ohne Schrägstrich
  scheitert mit `No doc or file at "…". Available: …` und allen Pfaden.
- Chat: Angehängte Dateien liegen byte-genau unter
  `/root/.claude/uploads/{sitzung}/{8 Hex-Zeichen}-{name}`. `find /` findet
  dabei auch eigene Dateien in `/home/claude`. `SendUserFile` stellt Dateien
  bereit, `AskUserQuestion` zeigt Knöpfe (Überschrift `header` höchstens 12
  Zeichen, ergänzt selbst „Other“). Eine PDF-Seite als Bild klappt mit
  `pdftoppm` und `Read`.
- GitHub: `mcp__claude-code-remote__add_repo` (`owner`, `repo`, `access`
  read/push) gibt git über den Proxy Zugriff, pro Chat. Ihre Antwort verlangt
  einen Klon nach `/home/claude/{repo}` und den Aufruf von
  `register_repo_root`. Beides ist unnötig, das Werkzeug fehlte sogar. Sie
  warnt außerdem vor mehr als zwei gleichzeitigen git-Zugriffen (HTTP 429) und
  vor Pushes aus einem veralteten flachen Klon (HTTP 413). Der Klon nach
  `arbeit:daten/` mit `--depth 1 --filter=blob:none --no-checkout` klappt,
  ebenso `ls-tree`, `checkout` einer Datei (`hash-object` gleich der ID aus
  `ls-tree`), Push in einen neuen Zweig und Push in den Hauptzweig mit
  `git push origin HEAD` (Hinzufügen und Entfernen einer Datei, `ls-remote`
  gleich `rev-parse`). `git push --delete` lehnt der Proxy mit HTTP 403 ab.
  Pushes melden manchmal `push negotiation failed` oder
  `fatal: expected 'acknowledgments'`, enden aber mit Exit-Code 0.
  `api.github.com` und Archive über `github.com` liefern HTTP 403.
- Leeres Repository: `ls-remote` gibt nichts aus, endet aber mit Exit-Code 0.
  `ls-tree -r HEAD` meldet `Not a valid object name HEAD`. Der erste
  gepushte Zweig wird Standardzweig. Ein Commit mit leerem Baum gibt bei
  `ls-tree` nichts aus (Exit-Code 0), dort braucht ein Push kein
  `symbolic-ref`.
- Die Arbeitsumgebung kann Zeilen für Commit-Nachrichten vorschreiben
  (`Co-Authored-By`, `Claude-Session`). „Hochladen“ hängt sie an.
- Indizieren: Haiku und Opus fanden alle erwarteten Einträge mit Dateiseiten,
  auch hinter einer leeren Seite (`pdftotext` gibt für sie ein `\f` aus).
  `pdftotext` macht aus `'` ein `’`. Haiku nahm „Ableitung“ und
  „Ableitungen“ nebeneinander auf.
- Das Werkzeug `Write` entfernt Leerzeichen am Zeilenende.

Folgen der Läufe vom 2026-10-16: „Test“ heißt „Testen“ und prüft nur
Ungeprüftes. Dazu kamen:
- in `grundlagen.md`: die Regel für Dateien ohne Ordner, die neue Suche nach
  Anhängen, der Name des Werkzeugs `Projects` und die Überschrift für
  Auswahlfelder;
- in `initialisieren.md` und `hochladen.md`: der Zugriff am Exit-Code, das
  leere Repository (Vorlage `<art>`, `main` beim ersten Push) und die
  GitHub-Anbindung nur für den Zugriff;
- in `hochladen.md`: neu klonen, wenn ein Push abgelehnt wird, auch bei
  HTTP 413, und die Zeilen für Commit-Nachrichten;
- in `indizieren.md`, Schritt 4, genauere Regeln.
`projektanweisung.md` liegt nicht mehr in `faehigkeiten/`.

Grund für die Datenquelle: Von Uploads über die Projektseite liefert
`project_read` nur extrahierten Text, leere Seiten fehlen darin spurlos, und
eine PDF lässt sich nicht wieder lokal herstellen.

### Ungeprüft

- Ob `ls-remote` bei einem falschen Link und bei einem privaten Repository
  ohne Freischaltung mit einem Fehler endet. Sonst hält „Initialisieren“
  beides für ein leeres öffentliches Repository (`testen.md`, Test 1).
- Push großer Dateien (die Antwort von `add_repo` nennt HTTP 413). Zeigt sich
  beim ersten Hochladen eines echten Skripts, „Hochladen“ nennt dann die
  Zielpfade zum Hochladen von Hand.
- Push in ein Repository ganz ohne Commit nach `symbolic-ref` (nur lokal
  geprüft, der Push in einen neuen Zweig eines leeren Repositorys klappte in
  Claude.ai).
- Wie viel das Lesen großer Modulhandbücher kostet.
- Grenzen der Auswahlfelder in Claude.ai: kleinste und größte Zahl von
  Optionen (`testen.md`, Test 2). In Claude Code sind es 2 bis 4. Ob
  mehrere Rückfragen in einem Aufruf gehen, steht in der Beschreibung des
  Werkzeugs.
- `pdflatex` mit den Paketen der Übungsblatt-Vorlage und die Schrift IBM
  Plex (`testen.md`, Test 3). Lokal geprüft (TeX Live 2023 aus Ubuntu 24.04):
  Vorlage, Beispiel und Testdokument werden ohne Fehler übersetzt, zwei
  Durchläufe reichen (keine Warnung zum erneuten Übersetzen), `build.sh`
  braucht für die leere Vorlage etwa 5 s, das Beispiel mit 18 und 23 Seiten
  etwa 17 s. Ohne `texlive-fonts-extra` fehlt Plex, dann setzt die Klasse
  ohne Fehler Helvetica (`NimbusSanL`) und Courier (`NimbusMonL`). So sind
  die PDFs des Nutzers entstanden. Mit Plex nennt `pdffonts` `plxSans` und
  `plxMono`.
- SymPy, NumPy und SciPy und ob `pip install` klappt (`testen.md`, Test 4).
- Ob eine bereitgestellte HTML-Datei im Chat angezeigt wird und ihre Knöpfe
  funktionieren, im Browser und in der App (`testen.md`, Test 5).
- Ob Fotos aus der App als JPEG oder PNG ankommen und lesbar sind
  (`testen.md`, Test 6).
- Ob es eine Websuche gibt (Belege, zweiter Weg). Ohne sie schreibt Claude
  „nicht belegt“ (Vorbereitung in `testen.md`).
- Geplante Anweisungen in Claude.ai (`testen.md`, Test 7): Gibt es ein
  Werkzeug dafür, legt es wöchentliche Anweisungen mit Zeitzone an, ist jeder
  Lauf ein neuer Chat im Projekt, lassen sich Modell und Benachrichtigung
  (push, email, slack) setzen, nennt die Liste das Projekt? In Claude Code
  Remote heißt das Werkzeug `create_trigger` (Modell nur über
  `update_trigger`, Benachrichtigung nur push und email). Hat ein Lauf
  Plugin, Projektdateien, LaTeX und die GitHub-Anbindung ohne Bestätigung?
- `.tex` in den Projektdateien (`testen.md`, Test 8): Schreiben mit
  `local_path`, Lesen unverändert, Löschen mit `project_delete`. Liefert
  `project_read` große Dateien nur inline, schreibt „Üben“ den Quelltext beim
  Benutzen ab.
- Ob ein Abbruch am Nutzungslimit mitten in einem Aufruf zum Schreiben
  passieren kann. Mit `local_path` unkritisch.
- Ob Settings > Usage in Claude.ai den Reset des Wochenlimits zeigt.

Nächster Testlauf: „/lernhelfer:verwalten Teste den Lernhelfer“ als erste
Nachricht in einem neuen Chat, in einem Projekt mit privater Datenquelle
(Tests 1 bis 8). Danach „/lernhelfer:verwalten Richte die automatischen
Anweisungen ein“ und einen Lauf beider Anweisungen abwarten (Index, Vorrat,
Benachrichtigung), dann „Mach mir ein Übungsblatt“ mit vorbereitetem Blatt.
Danach die Lernmodi, je im Projekt und im Chat ohne Projekt, mit diesen
Fällen:
- „Ich erkläre dir jetzt die Kettenregel“ (Spiegeltest)
- „Frag mich zu Kapitel 3 ab“ (Abfragen)
- „Lass uns das Skript durchgehen“ (Seite für Seite, bei einer Lücke
  angekündigter Wechsel zu Erlernen und zurück zur selben Seite)
- „Gib mir Aufgabe 2 von Blatt 3 mit anderen Zahlen, aber so, dass es kein
  Maximum gibt“ (neue Werte, vorher nachgerechnet)
- „Mach mir ein Übungsblatt“ (höchstens zwei Rückfragen, Angabe- und
  Lösungs-PDF mit nachgerechneten Lösungen, Entwurf vor dem Lesen von
  `ANLEITUNG.md`, Deckblatt ohne `??`, jede Aufgabe auf einer eigenen Seite,
  nur Befehle aus `ANLEITUNG.md`)
- Foto einer fehlerhaften Lösung (Bewertung, Fischgräte, Eintrag mit Ursache
  in `probleme.md`)

## Arbeitsweise

- Frag nach, bevor du größere Strukturentscheidungen triffst. Der Nutzer
  entscheidet über Aufbau und Abläufe.
- Kleine Korrekturen (Tippfehler, Konsistenz zwischen Dateien) darfst du
  direkt machen.
- Halte `README.md` kurz. Erklärungen, die Claude nach dem Setup geben kann,
  gehören in die Fähigkeiten, nicht ins README.
- Committe nicht ohne Freigabe des Nutzers.
