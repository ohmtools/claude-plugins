# claude-plugins – Hinweise für Claude Code

Dieses Repository ist der Marketplace `ohmtools` mit Plugins für Claude.ai, die
bei Hochschule und Ausbildung helfen. Jedes Plugin liegt in einem eigenen
Ordner, den Claude.ai als Ganzes bereitstellt (`source` in
`.claude-plugin/marketplace.json`). `README.md` und diese Datei liegen deshalb
außerhalb dieser Ordner. Das README dokumentiert zuerst das allgemeine Setup,
danach jedes Plugin in einem eigenen Abschnitt. Ein neues Plugin bekommt einen
eigenen Ordner (liegt es in einem anderen Repository, eine Quelle
`git-subdir`), einen Eintrag in `marketplace.json` und einen Abschnitt im
README. Zurzeit gibt es zwei Plugins:

- Zeiteisen: der Skill `zeiteisen-generator` der Stundenplan-App, aus
  `ohmtools/zeiteisen`, Ordner `skill/zeiteisen-generator/`, als Quelle
  `git-subdir` ohne `ref`, also immer vom Hauptzweig (so hat es der Nutzer am
  2026-10-17 statt eines Submodules entschieden). Hier stehen nur der Eintrag
  in `marketplace.json` (Name, Quelle, Beschreibung) und der Abschnitt im
  README. Das Manifest liegt in zeiteisen unter
  `skill/zeiteisen-generator/.claude-plugin/plugin.json`, mit
  `"skills": ["./"]`, weil die `SKILL.md` direkt im Ordner liegt. Ohne
  `plugin.json` lehnte Claude.ai das Plugin ab („requires
  .claude-plugin/plugin.json or a top-level SKILL.md declaring plugin
  components“), obwohl Claude Code den Skill fand. `"strict": false` im
  Eintrag hätte es laut Fehlermeldung auch gelöst, der Nutzer wollte es am 2026-10-17 nicht.
  Änderungen am Skill gehören nach zeiteisen.
  Die vier `schema.json` erzeugt dort `npm run skill`, sie sind dafür
  committet (ohmtools/zeiteisen#1). Mit Claude Code lokal geprüft: Die
  Installation lädt nur den Ordner samt Schemas und findet einen Skill
  (`zeiteisen-generator`, auch mit `plugin.json`).
  Ungeprüft ist, ob Claude.ai das Plugin mit `plugin.json` annimmt.
- Lernhelfer, um den es im Rest dieser Datei geht. Die Vorlage seiner
  Webseiten liegt in `ohmtools/lernhelfer-skript` (eigene `CLAUDE.md`).

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
| Vorlagen für Ausgaben (Übungsblatt: LaTeX-Klasse mit Farben, Anleitung und `build.sh`) | `lernhelfer/skills/lernen/vorlagen/`, Konvention in `entwicklung.md` |
| Verwalten: Fähigkeiten und ihre Verfügbarkeit, Projektstruktur, Dateien der Datenquelle, automatische Anweisungen einrichten | `lernhelfer/skills/verwalten/SKILL.md` |
| Automatische Anweisungen (geplante Anweisungen in Claude.ai): Prompts, Name mit Projekt, Einrichten, Ausschalten | `lernhelfer/skills/verwalten/geplant/`, `lernhelfer/skills/verwalten/faehigkeiten/automatische-anweisungen.md` |
| Skript als Webseite aufbereiten | `lernhelfer/skills/lernen/faehigkeiten/skript-verbessern.md`, Vorlage in `ohmtools/lernhelfer-skript` (dort `ANLEITUNG.md` und `CLAUDE.md`) |
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
- Die Übungsblatt-Vorlage folgt dem ohmtools-Design:
  https://github.com/ohmtools/design, Regeln in dessen DESIGN.md (Abschnitt
  „Documents“: Inter, sonst die serifenlose Schrift des Werkzeugs, Rot als
  einzige Akzentfarbe, keine Großbuchstaben, Linien statt Kästen, eckige
  Ecken). Farben nur über dessen Tokens. Vor jeder sichtbaren Änderung
  DESIGN.md lesen; eine Regel, die sich ändern soll, wird zuerst dort
  geändert, für alle Apps.
- Neue Konventionen für Fähigkeiten gehören nach `entwicklung.md`, nicht
  hierher, weil die Entwicklungsinstanz im Projekt nur das Plugin kennt.
- Prüf nach jeder Änderung mit `claude plugin validate .`. Gewollt sind die
  Warnung zur fehlenden `version` in `plugin.json` (sonst kämen Commits erst
  nach einer neuen Version an, Regel in `entwicklung.md`) und, falls er kommt,
  der Hinweis auf eine Installationszeile für Claude Code im README (der
  Lernhelfer ist für Claude.ai gebaut; seit dem Eintrag für Zeiteisen fehlt
  er).
- Trag die Ergebnisse jedes Testlaufs unter „Testläufe“ ein, pass die
  Fähigkeiten an und nimm bestätigte Tests aus `testen.md` heraus
  (Konvention in `entwicklung.md`).
- Diese Stellen sind bewusst doppelt und müssen übereinstimmen:
  - Repository-URL: `README.md`, `plugin.json` (`homepage`, `repository`),
    `projektanweisung.md` und `helfen/SKILL.md`.
  - Lizenz BSD-3-Clause: `LICENSE`, `plugin.json` (`license`) und Abschnitt
    „Lizenz“ im README.
  - Beschreibung des Plugins Zeiteisen: `marketplace.json` und in
    ohmtools/zeiteisen `skill/zeiteisen-generator/.claude-plugin/plugin.json`.
  - Pfad des Zeiteisen-Skills `skill/zeiteisen-generator`: `marketplace.json`,
    Abschnitt „Aufbau des Repositorys“ im README und in ohmtools/zeiteisen
    `CLAUDE.md` und `scripts/NOTES.md`.
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
  - GitHub-Anbindung nur für den Zugriff, nicht für den Klon: `initialisieren.md`
    (Schritt 3, Punkt 4, und Vorlage für `{zugriff}`) und `hochladen.md`,
    Schritt 3.
  - Lesezugriff auf ein privates Repository vor dem Anlegen automatischer
    Anweisungen, weil ein Lauf keine GitHub-Anbindung hat: `verwalten/SKILL.md`
    („Automatische Anweisungen“, „Einrichten“, Schritt 3) und die Vorlage
    für `{zugriff}` in `initialisieren.md` (ohne Werkzeug direkt klonen).
  - Beschreibung, Lernziele und Angaben zur Prüfung aus dem Modulhandbuch
    auslesen: `indizieren.md`, Schritt 5, und `modul-bearbeiten.md`,
    „Lernziele übernehmen“, Schritte 3 und 4.
  - Aufbau von `info.md` (Abschnitte Beschreibung, Lernziele, Prüfung):
    Vorlagen in `grundlagen.md` und `modul-bearbeiten.md`. `ueben.md`
    („Übungsblatt“, Schritt 1) liest `Dauer` und `Hilfsmittel` daraus.
  - Schriften und Silbentrennung der Übungsblatt-Vorlage: Abschnitte 1 und 2
    von `lernen/vorlagen/uebungsblatt.cls` und `ANLEITUNG.md`, Kapitel 1.
  - Dateien und Übersetzen der Übungsblatt-Vorlage: Kopf von
    `uebungsblatt.cls`, `uebungsblatt.tex` und `beispiel.tex`,
    `ANLEITUNG.md` (Kapitel 1, 3 und 11), `build.sh` und `ueben.md`
    („Übungsblatt“, Schritte 7 und 8, und „Vorrat“, „Benutzen“, Schritt 2).
  - Farben der Übungsblatt-Vorlage: `lernen/vorlagen/ohmtools-colors.sty` ist
    eine unveränderte Kopie von `dist/ohmtools-colors.sty` aus
    `ohmtools/design`; nach einer Änderung dort neu kopieren. Die Farbnamen
    für Dokumente stehen in `ANLEITUNG.md`, Kapitel 7, und `entwicklung.md`.
  - Darstellungen der Übungsblatt-Vorlage: `ueben.md` („Übungsblatt“,
    Schritt 4) und `ANLEITUNG.md`, Kapitel 12.
  - Erkennen des Modulhandbuchs am Dateinamen („Modulhandbuch“ oder
    „Lehrplan“): `verwalten/SKILL.md` („Dateien der Datenquelle“), die
    Abschlussnachricht in `initialisieren.md`, `modul-bearbeiten.md` und
    `helfen/SKILL.md`.
  - Seiten zählen mit `pdftotext` und `\f`: `lernen/SKILL.md`
    („PDF-Dateien“) und `indizieren.md`, Schritt 4.
  - Vorspann der automatischen Anweisungen (niemand liest mit, keine
    Rückfragen, „Abbruch“): beide Dateien in `verwalten/geplant/`.
  - Namen von Abschnitten, auf die die Prompts in `verwalten/geplant/`
    verweisen: „Abbruch“ in `grundlagen.md`; „Vorrat“ in `ueben.md` (dort
    auch die Spalte `Thema` für `% themen:`);
    „Dateiprüfung“ und „Session beenden“ in `lernen/SKILL.md`; die Spalte
    `Historie` von `probleme.md` in `grundlagen.md`. Dazu muss die
    Anfrage im Prompt „Übungsblätter vorbereiten“ (Stoff, Umfang, Niveau,
    „ohne Vorrat“) zu den Rückfragen in `ueben.md` passen („Übungsblatt“,
    Schritt 2). Die Prompts liegen wörtlich in Claude.ai und wandern bei
    einem Update nicht mit.
  - Namen der Niveaus (Leicht, Klausurniveau, Klausurniveau+,
    Expertenniveau):
    `ueben.md` (Abschnitt „Niveau“, Rückfrage in „Übungsblatt“, Schritt 2,
    und „Vorrat“), Prompt „Übungsblätter vorbereiten“ und `helfen/SKILL.md`.
  - Nach einem Update die automatischen Anweisungen neu einrichten:
    `entwicklung.md` („Exportieren“, `{automatik-hinweis}`) und
    `helfen/SKILL.md`.
  - Name der automatischen Anweisungen `Lernhelfer: {name} ({projekt})` mit
    dem Projektnamen aus der Projektübersicht: `verwalten/SKILL.md`
    („Automatische Anweisungen“), die Nachrichten ohne Werkzeug in
    `automatische-anweisungen.md` und `helfen/SKILL.md`.
  - Schreibreihenfolge bei `daten.xml`: in `indizieren.md` zuerst der Index,
    zuletzt `daten.xml`, in `modul-bearbeiten.md` („Neues Modul anlegen“,
    „Dateien zuordnen“) zuerst `daten.xml`, dann der Index. Beides folgt aus
    „Abbruch“ in `grundlagen.md`.
  - Mehrere Module nur in automatischen Anweisungen: `lernen/SKILL.md` („Mit
    einem Modul arbeiten“) und `entwicklung.md`.
  - URL der Vorlage für „Skript verbessern“
    (`https://github.com/ohmtools/lernhelfer-skript`):
    `skript-verbessern.md`, `entwicklung.md` (Konvention „Vorlagen“),
    `testen.md` (Test 1), `helfen/SKILL.md` und README.
  - Was `skript-verbessern.md` von der Vorlage benutzt, muss zu ihr passen,
    denn sie wird immer vom Hauptzweig geklont: die Markierungen der
    Ergänzungen (`:::variablen`, `:::anmerkung`, `:::denkanstoss`,
    `:::grafik`, `:::interaktiv`, `:::frage`, `:::auswahl`, `:::rechnen`,
    `:anm`, `::seite[n]`; dort in `plugins/ergaenzungen.mjs` und
    `ANLEITUNG.md`), die Befehle (`npm ci --omit=dev`, `npm run wortlaut`,
    `mdx`, `pruefen`, `build`, `quelle`, `ausschnitt`), `src/inhalt/`,
    `skript.json`, `dist/index.html`, der Ordner `lernhelfer-skript/` in der
    ZIP und die Kapitel „Originaltext“ („Ausschneiden“), „Angaben zum
    Skript“ und „Häufige Fehler“ der Anleitung. `testen.md`, Test 1, nennt
    das Beispiel der Vorlage („Grundlagen der Elektrotechnik“, Kapitel 2 mit
    Regler für R).
  - Etappen von „Skript verbessern“ (höchstens ein Kapitel und 20 Seiten,
    ZIP `{name}-quelle.zip` zum Weitermachen): `skript-verbessern.md` und
    `helfen/SKILL.md`.
  - Arten als erstes Wort der Beschreibung im Index (`Skript`,
    `Übungsblatt`, `Altklausur`, `Lösung`, `Formelsammlung`, `Sonstiges`):
    Vorlage für `index.md` in `grundlagen.md` und `indizieren.md`,
    Schritt 4. Darauf verlassen sich `wiederholen.md` („Skript
    durchgehen“), `skript-verbessern.md` (Schritt 1) und `ueben.md`
    („Klausurprofil“, „Aufgaben mit neuen Werten“).

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
  (`vorrat/{modul}/uebungsblatt-{erstellt}.tex`). Nur eine automatische Anweisung lässt
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
  „Dateien“ als einzige Zuordnung, Beschreibung beginnt mit der Art der
  Datei, Stichwortverzeichnis mit Dateiseiten),
  `gedaechtnis/{modul}/probleme.md` (Thema, Beschreibung, Ursache,
  Verstanden, Historie), `gedaechtnis/benutzererfahrung.md` und der Vorrat
  `vorrat/{modul}/uebungsblatt-{erstellt}.tex` (ohne Eintrag in „Formate“). Alle Formate
  sind 1, es gibt noch keine Migration. Das Plugin wird noch nicht genutzt.
  Deshalb gibt es keine Regeln für ältere Dateien, und die Spalte `Ursache`
  in `probleme.md` (Fehlerursache, Fischgräte, gefüllt von „Korrigieren“) und
  der Abschnitt „Prüfung“ in `info.md` (Form, Dauer, Hilfsmittel aus dem
  Modulhandbuch, für den Kopf des Übungsblatts) kamen ohne neue Formatnummer
  dazu, ebenso die Art am Anfang der Beschreibung im Index (seit 2026-10-23,
  damit Haiku nicht z.B. „Vorlesungsfolien“ schreibt und „Skript durchgehen“
  das Skript nicht findet).
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
    Abfragen mit Sicherheit 1 bis 5, Skript Seite für Seite in Etappen. Den
    Fortschritt im Skript speichert der Lernhelfer bewusst nicht. Am Ende
    einer Etappe nennt er den Satz zum Weitermachen. „Aufgabe mit neuen
    Werten“ ist seit 2026-10-17 das Niveau Leicht in Üben (Wunsch des
    Nutzers).
  - Üben: Übungsblatt (erst ein Entwurf in Markdown, dann zwei PDFs aus
    `vorlagen/uebungsblatt.tex` mit der Klasse `uebungsblatt.cls`, ihren
    Farben `ohmtools-colors.sty` und `build.sh`, ohne LaTeX zwei
    Markdown-Dateien) oder Bloom-Leiter im Chat
    (AFB II und III, Transferaufgaben nach dem Transfer-Prompt des
    Playbooks). Das Übungsblatt richtet sich nach der typischen Klausur (so
    hat es der Nutzer am 2026-10-17 entschieden): Klausurprofil aus der
    neuesten Altklausur (Routineanteil, Aufgabenarten, Führung), ohne
    Altklausur ein Drittel Routine und ein geschätztes Niveau.
    Routineaufgaben fallen nie ganz weg, damit der Nutzer sie nicht
    verlernt. Niveau als Rückfrage: Leicht (nur bestehende Aufgaben aus
    Übungen und Altklausuren mit neuen Werten, gleicher Lösungsweg oder
    anderes Verhalten, vorher nachgerechnet, ohne Vorgabe der Anfrage
    gemischt mit mindestens einer Aufgabe mit anderem Verhalten), Klausurniveau,
    Klausurniveau+ (Schwachstellen auf Klausurniveau, alles andere darüber,
    nur im Projekt) und Expertenniveau (alles darüber, auch die Routine, deren
    Anteil bleibt). Nennt die Anfrage bestimmte Aufgaben mit neuen Werten,
    gibt es ohne Rückfrage ein Blatt auf Leicht mit genau diesen, auch bei
    einer Aufgabe als PDF (Wunsch des Nutzers, kein Sonderfall im Chat).
    „Über Klausurniveau“ heißt mindestens zwei Hebel
    (Führung, Denkschritte, Verknüpfung, Sonderfälle, Transfer) über der
    Vergleichsaufgabe, nie mit Fremdwissen, Fangfragen oder mehr Rechnen.
    Das Niveau jeder Aufgabe steht mit ihrer Vergleichsaufgabe in „Zur
    Aufgabe“. Nennt bei einer Schwachstelle `Ursache` eine Arbeitsweise
    (Flüchtigkeit, Aufgabe falsch gelesen, Zeitdruck), bekommt eine Aufgabe
    eine Stelle, an der genau dieser Fehler naheliegt. Deshalb trägt
    Korrigieren auch solche Fehler in `probleme.md` ein (so hat es der Nutzer
    am 2026-10-23 entschieden).
  - Korrigieren: bei einer angehängten Lösung zuerst eine wörtliche Abschrift
    des Gelesenen, auch mit den Fehlern, damit der Nutzer Lesefehler
    erkennt (Wunsch des Nutzers vom 2026-10-22), strenger Prüfer, Punkte als
    Schätzung, Hinweise statt
    Lösung, Fehlerursachen nach Fischgräte mit bis zu fünfmal „Warum?“,
    danach Wechsel zu Erlernen (Verständnis, Vorwissen) oder zu Wiederholen
    mit einem Spiegeltest zur Regel hinter dem Fehler (Rechentechnik), sonst
    Session beenden (Aufgabe falsch gelesen, Zeitdruck, Flüchtigkeit). Zu Üben
    wechselt Korrigieren nicht (so hat es der Nutzer am 2026-10-17
    entschieden).
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
  GoodNotes, ohne Scrollen arbeitet, ohne deutsche Trennmuster keine
  Silbentrennung im Blocksatz, so hat es der Nutzer am 2026-10-17
  entschieden), `ANLEITUNG.md` mit allen Befehlen für KI-Modelle,
  `beispiel.tex` mit `material/` als Beispiel für jeden Befehl. Aufgaben und Lösungen stehen in
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
  Kapitel 1, 3 und 11 der Anleitung beschreiben `build.sh`, und die Klasse
  prüft `t1txtt.fd` statt `t1xtt.fd` (Tippfehler, dadurch immer Courier) und
  trennt ohne `\l@ngerman` nicht. Die mitgelieferten PDFs sind nicht im
  Plugin. Seit dem 2026-10-17 folgt die Vorlage dem ohmtools-Design (Wunsch
  des Nutzers): Schrift Inter (Paket `inter` mit `ly1`, beide in
  texlive-fonts-extra, halbfett, proportionale Ziffern, µ aus LGR, weil
  Inters TS1 kein `\textmu` hat), sonst Helvetica, Code in TX-Typewriter,
  Farben aus `ohmtools-colors.sty`, Rot als einzige Akzentfarbe auch für
  Lösungen (vorher Grün), Diagrammkurven in Rottönen mit eigener Strichart,
  `gegeben`, `hinweisbox` und Code zwischen zwei Linien, Lösungen mit einer
  roten Linie links statt Kästen, keine Großbuchstaben und Sperrungen, eckige
  Ecken. `\akzentfarbe` und die Farbnamen `ub…` sind entfallen.
  Seit dem 2026-10-22 haben Blätter keine Nummer mehr (Wunsch des Nutzers,
  damit Claude keine suchen muss): `\blatt`, `\untertitel` und `\kopfzusatz`
  sind entfallen. Kopf „Übungsblatt · Angabe“ bzw. „· Lösung“, rechts das
  Fach, auf dem Deckblatt der Link „OhmTools“ (github.com/ohmtools, mit
  `\pdfstartlink` statt hyperref), Marke „Angabe“ bzw. „Lösung“ ohne roten
  Balken davor, statt des Untertitels „Erstellt am {datum} um {hh:mm}“, im
  Fuß nur „Seite x / y“. `build.sh` übergibt Datum und Uhrzeit einmal in
  deutscher Zeit (POSIX-TZ, ohne tzdata) als `\ubdatum` und `\ubuhrzeit`,
  ohne `build.sh` gilt die Uhr beim Übersetzen.
  Schaltzeichen nach DIN EN 60617 (Wunsch des Nutzers vom 2026-10-22):
  Negation an Gattern als Kreis, gerade Spannungspfeile (`voltage=straight`,
  circuitikz biegt sie sonst), Spule und Transformator aber als gefülltes
  Rechteck wie an der Schule des Nutzers (nicht die Halbkreisbögen der Norm), in `ANLEITUNG.md` (Kapitel 7, `schaltung`)
  Operationsverstärker `en amp` statt `op amp` und Messgeräte `rmeter`
  statt `ammeter`/`voltmeter` (mit Pfeil). Mit circuitikz 1.6.6 geprüft.
- Übungsblatt in zwei Phasen (Wunsch des Nutzers, damit die Qualität der
  Aufgaben nicht unter vielen geladenen Regeln leidet): `ueben.md` lässt
  erst Aufgaben und Lösungen als `arbeit:uebungsblatt/entwurf.md` schreiben
  (Markdown, Punkte pro Kriterium, Abbildungen in Worten) und liest die
  Anleitung erst danach, zum Setzen in LaTeX. Was das PDF darstellen kann,
  steht deshalb kurz in `ueben.md`, Schritt 4. Ohne LaTeX (`command -v
  pdflatex` vor dem Lesen der Anleitung) werden aus dem Entwurf die zwei
  Markdown-Dateien.
- Skript verbessern (seit 2026-10-22, Wunsch des Nutzers): `lernen` macht aus
  Seiten, Kapiteln oder dem ganzen Skript eine interaktive Webseite in einer
  einzigen HTML-Datei, gezeigt mit `SendUserFile` (`display: render`), dazu
  der Quellcode als ZIP. Originaltext wortgleich (damit die anderen
  Fähigkeiten weiter mit dem PDF arbeiten), Ergänzungen nur in Markierungen
  (`:::variablen`, `:::anmerkung`, `:::denkanstoss`, `:::grafik`,
  `:::interaktiv`, Fragen `:::frage`/`:::auswahl`/`:::rechnen` am Ende jedes
  Abschnitts, `:anm`), rot markiert und mit „Nur Original“ ausblendbar.
  Schwachstellen aus `probleme.md` werden gründlicher erklärt, die Seite
  nennt sie nicht. Kein Lernmodus, pflegt keine Probleme, schreibt nichts
  ins Projekt. Zwei Phasen wie beim Übungsblatt: Entwurf in Markdown mit
  denselben Markierungen, Prüfung des Wortlauts gegen `pdftotext`
  (`npm run wortlaut`), erst dann `ANLEITUNG.md` der Vorlage lesen, Entwurf
  mit `npm run mdx` umwandeln (kein Abschreiben) und nur Grafiken und
  Experimente als Bausteine setzen, Wortlaut gegen den Entwurf, `npm run
  pruefen` (übersetzt und rendert jedes Kapitel), `npm run build`. Etappen
  von höchstens einem Kapitel und 20 Seiten; weiter im selben Chat oder in
  einem neuen mit der ZIP. Ohne Node gibt es den Entwurf als Markdown.
  Die Vorlage ist das öffentliche Repository `ohmtools/lernhelfer-skript`
  (Vite, React, shadcn base-sera, MDX mit remark-math/rehype-katex,
  vite-plugin-singlefile, Mafs für Graphen, eigene SVG-Schaltzeichen nach DIN
  EN 60617, weil keine JS-Bibliothek sie zeichnet; so hat es der Nutzer am
  2026-10-22 entschieden). Layout: am Desktop fumadocs-artig (Kapitelbaum
  mit Suche, Kapitel, „Auf dieser Seite“), am Handy die Tab-Leiste wie
  Zeiteisen (DESIGN.md bleibt), ein Kapitel pro Seite (Entscheidungen des
  Nutzers). Die Fähigkeit klont immer den Hauptzweig, wie Zeiteisen ohne
  `ref`. In „Dateien im Chat“ fragt `lernen` nur noch bei Unterlagen nach dem
  Hochladen, damit eine angehängte ZIP (oder ein Foto einer Lösung) keinen
  Upload-Vorschlag auslöst.
- Bewusst ohne Regel: Dateien, die ein Nutzer trotzdem über die Projektseite
  hochlädt.
- Automatische Anweisungen: geplante Anweisungen des Claude.ai-Projekts,
  einmal pro Woche, jeder Lauf ein neuer Chat. Damit übrige Nutzung nicht
  verfällt, empfiehlt Claude zwei Stunden vor dem Reset des Wochenlimits (der
  Nutzer nennt den Reset aus Settings > Usage, Zeitzone `Europe/Berlin`). Jede
  Datei in `lernhelfer/skills/verwalten/geplant/` wird eine Anweisung
  `Lernhelfer: {name} ({projekt})`: Frontmatter `name`, `modell` (nur die
  Reihe, gemeint ist die neueste Fassung) und `benachrichtigung` (`push`,
  `email`, `slack` oder `keine`), danach der Prompt. Der Projektname steht im
  Namen, weil die Liste die Anweisungen aller Projekte ohne ihr Projekt zeigt.
  Claude nimmt ihn aus der Projektübersicht (so hat es der Nutzer am
  2026-10-17 entschieden, ohne ihn zu speichern), sonst fragt es. Eine
  Anweisung läuft im Projekt des anlegenden Chats, mit dessen Plugin und
  GitHub-Zugriff, deshalb holt Claude vor dem Anlegen Lesezugriff auf ein
  privates Repository. Kennt das Werkzeug beim Anlegen kein Modell, setzt
  Claude es danach (`update_trigger`). Der Prompt kommt wörtlich in
  Claude.ai, so hat es der Nutzer entschieden, deshalb nach Updates neu
  einrichten. Die
  Nummer im Dateinamen gibt die Reihenfolge, 30 Minuten Abstand. Zurzeit:
  Indizieren (Haiku) und Übungsblätter vorbereiten (Opus), beide mit `push`.
  „Initialisieren“ fragt danach, wenn es eine Datenquelle einrichtet, sonst
  „Automatische Anweisungen“ (einrichten, Zeit ändern, ausschalten,
  anzeigen). Neue Anweisungen werden vor dem Löschen der alten angelegt, die
  alten löscht Claude anhand ihrer ID. Das Löschen entfernt auch die Chats
  ihrer Läufe, der Nutzer wollte am 2026-10-17 trotzdem kein Ändern der
  vorhandenen. Ohne Werkzeug nennt Claude die Einstellungen zum Anlegen von
  Hand.
- Vorrat: pro Modul beliebig viele Übungsblätter (seit 2026-10-23, Wunsch
  des Nutzers, vorher höchstens eins), je 45 Minuten, Klausurniveau+,
  Schwachstellen und fällige Themen (so hat es der Nutzer entschieden), als
  LaTeX-Quelltext `uebungsblatt-{erstellt}.tex` (am selben Tag mit `-2`
  usw.), weil PDFs nicht in die Projektdateien passen, deshalb ohne eigene
  Dateien (`\bild`, `\codedatei`). Beim Benutzen kommen
  `uebungsblatt.cls`, `ohmtools-colors.sty` und `build.sh` aus der Vorlage
  dazu. Kopf mit `erstellt`, Dauer, Aufgaben, Punkten und `themen` (genau wie
  in der Spalte `Thema` von `probleme.md`). Das Niveau steht nicht im Kopf,
  weil der Vorrat nur Klausurniveau+ hält. Ein Blatt wird vor dem Speichern
  geprüft und danach nie wieder (Entscheidung des Nutzers vom 2026-10-23),
  deshalb gibt es keine Gültigkeit, kein `format`, keine `quelle` und keine
  Schlusszeile mehr, und Üben braucht für den Vorrat keine Datenquelle.
  `vorrat/{modul}/uebersicht.md` hält Datei, Datum, Dauer, Aufgaben, Punkte
  und Themen jedes Blatts, damit Üben zum Auswählen nicht alle Blätter liest
  (je etwa 25 KB). Speichern schreibt erst das Blatt, dann seine Zeile,
  Benutzen löscht erst die Zeile, dann das Blatt. Ein Blatt ohne Zeile bietet
  Üben nie an. Üben wählt aus der Übersicht (bei bestimmten Themen nur Blätter,
  die alle enthalten), bietet das mit den meisten heute offenen oder fälligen
  Themen als erste Rückfrage an (bei Gleichstand das neueste), übersetzt es,
  löscht es und stellt es dann bereit. Scheitert das Übersetzen, löscht es das
  Blatt, außer bei `not found` (dann fehlen nur LaTeX oder ein Paket).
  Ausschalten der automatischen Anweisungen lässt den Vorrat unberührt.
  Module ohne Schwachstellen und ohne fällige Themen bekommen
  kein Blatt. Ein Blatt für den Vorrat bindet keine eigenen Dateien ein. Der Prompt
  beschreibt keinen Ablauf von „Üben“ (Wunsch des Nutzers, Konvention in
  `entwicklung.md`): Er ruft „Üben“ bei jedem Lauf für jedes Modul mit
  Schwachstellen oder fälligen Themen wie ein Nutzer auf („… auf
  Klausurniveau+, als LaTeX-Quelltext, ohne Vorrat“), auch wenn es schon
  Blätter hat, und speichert den Quelltext. Vorhandene Blätter bleiben, auch
  wenn ihre Schwachstellen inzwischen verstanden sind.
  Module mit dem spätesten Datum unter `Historie` kommen zuerst dran. Entsteht
  kein übersetzter Quelltext, hört der Lauf ganz auf und speichert nichts.
  Das ist gewollt, damit z.B. am Nutzungslimit nichts Halbes in den Vorrat
  kommt (Entscheidung des Nutzers vom 2026-10-23).
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

Mit dem Plugin am 2026-10-23: „Testen“ im Browser mit Opus 5.5 (Tests 1 bis
3), in einem Projekt mit leerer privater Datenquelle, dazu ein Lauf der
Testanweisung mit Haiku 5.5. Am 2026-10-17: „Testen“ im Browser und in der
iPad-App, je mit Opus 5.5 (Tests 1 bis 8), gleichzeitig in zwei Projekten
desselben Kontos mit derselben privaten Datenquelle, dazu „Initialisieren“ in
drei Projekten (Browser mit Haiku 5.5 und Opus 5.5, iPad-App mit Opus 5.5).
Am 2026-10-16 erst im Browser je einmal mit Haiku 5.5 und Opus 5.5 (alle
damaligen Tests), dann in der iPad-App mit Opus 5.5 (Dateien ohne Ordner,
Hochladen in den Hauptzweig), in einem Projekt mit privater Datenquelle. Davor
2026-10-10 ohne Plugin, Version 0.11.2 und 0.14.0, im Browser und in der
iPad-App.

### Bestätigt

- Plugin: läuft im Browser und in der iPad-App. Claude.ai stellt den ganzen
  Plugin-Ordner unter `/mnt/skills/plugin-files/lernhelfer/` bereit, auch
  `README.md` und `CLAUDE.md`. Die Rückmeldung des Werkzeugs `Skill` beginnt
  mit „Base directory for this skill: …/skills/{skill}“, daraus ergeben sich
  `skill:` und `plugin:`, und `../gemeinsam/grundlagen.md` wird gefunden.
  Installiert über `marketplace.json` mit `"source": "./"`. In einer
  geplanten Anweisung liegt es unter `/root/.claude/plugins/synced/…/lernhelfer/`,
  und der Skill kommt über den Befehl im Prompt, nicht über das Werkzeug
  `Skill`.
- Werkzeuge: `curl`, `git` 2.43, `zip`, `unzip`, `file`, `sha256sum`,
  `python3` 3.13, `pdftoppm`, `pdftotext` und `pdfinfo` (poppler 24.02),
  `pypdf`, `pdfplumber`, `pypdfium2`. PyMuPDF fehlt. `gh` ist vorinstalliert.
  NumPy 2.5.3 und SciPy 1.18.1 sind da, SymPy fehlt, `pip install sympy`
  klappt ohne `--break-system-packages` (SymPy 1.14.0). Websuche mit
  `WebSearch` und `WebFetch`. Node v22.22.0 und npm 10.9.4. Manche Werkzeuge
  sind nur nachladbar (`ToolSearch` mit `select:…`), z.B. `list_triggers`,
  `update_trigger`, `delete_trigger`, `fire_trigger` und `list_repos`.
- LaTeX: pdfTeX 1.40.25 (TeX Live 2023/Debian) mit texlive-base, -binaries,
  -fonts-recommended, -lang-greek, -latex-base, -latex-extra,
  -latex-recommended, -pictures, -science und -xetex, ohne -fonts-extra (kein
  IBM Plex) und -lang-german (`ngerman.ldf` und deutsche Trennmuster fehlen,
  babel trennt mit `provide=*` nach englischen Regeln). Ein Testdokument mit
  den Paketen der Vorlage wurde ohne Fehler übersetzt (`NimbusSanL`,
  `NimbusMonL`). Lokal mit denselben Paketen aus Ubuntu 24.04 geprüft: Mit
  `t1txtt.fd` setzt die Klasse Code in TX-Typewriter (`t1xtt`), ohne
  Trennmuster trennt sie nicht, das Beispiel hat (seit dem ohmtools-Design)
  18 und 22 Seiten ohne Overfull-Box, `build.sh` braucht dafür etwa 20 s.
  Mit Inter aus texlive-fonts-extra nennt `pdffonts` `Inter-Regular`,
  `Inter-SemiBold` und `Inter-Italic` und keine Type-3-Schrift, ebenfalls
  18 und 22 Seiten.
- Projektdateien: Werkzeug `Projects` mit `method` `project_info`,
  `project_read`, `project_search`, `project_write` (`content` oder
  `local_path`, nur aus `/home/claude`, ersetzt ganze Dateien, meldet
  `replaced`), `project_delete` (nur Text-Dokumente), `project_memory_list`
  und `project_memory_read`. Umlaute und Sonderzeichen bleiben erhalten,
  `project_read` liefert kleine Dateien inline. `project_info` liefert `instructions` (die Projektanweisung),
  `docs` (eigene Dokumente) und `files` (Uploads der Projektseite), je mit
  `path` und `created_at`, neueste zuerst, ohne Ordner, dazu
  `knowledge_size`. Am 2026-10-23 hatte die Rückmeldung die Felder `method`,
  `name`, `description`, `instructions`, `docs`, `files`, `sync_sources` und
  `knowledge`. Der Name des Projekts steht in `name` (Opus und Haiku fanden
  ihn dort) und im Hinweis der Umgebung „This session is attached to the
  Project "{name}"“. Pfade mit Ordner bleiben, wie geschrieben. Ersetzen mit
  `project_write` behält `doc_uuid` und `created_at` (über die Projektseite
  ändert sich `created_at`). Eine `.tex`-Datei mit 403 Zeilen (25 KB) aus
  `local_path` liefert `project_read` unverändert inline im Feld `content`,
  nicht als Datei, `project_delete` löscht sie.
- Dateien ohne Ordner: Laut Beschreibung von `project_write` landet ein Pfad
  ohne `/` unter `claude/`. Mit Schrägstrich (`/daten.xml`) klappen
  Schreiben, Lesen, Ersetzen (`replaced: true`, kein zweiter Eintrag) und
  Löschen, und die Übersicht zeigt die Datei so. Lesen ohne Schrägstrich
  scheitert mit `No doc or file at "…". Available: …` und allen Pfaden.
- Chat: Angehängte Dateien liegen byte-genau unter
  `/root/.claude/uploads/{sitzung}/{8 Hex-Zeichen}-{name}`. `find /` findet
  dabei auch eigene Dateien in `/home/claude`. Fotos kommen als JPEG an
  (Browser 2576×1932, iPad-App 1999×999), heißen meist `image.jpg`, stehen
  auch direkt im Chat, und ein Hinweis der Umgebung zur Nachricht nennt ihren
  Pfad. Handschrift war lesbar. `SendUserFile` stellt Dateien bereit
  (`display` `render` oder `attach`). Eine HTML-Datei mit SVG und Knopf
  funktioniert im Browser und in der iPad-App. `AskUserQuestion` zeigt Knöpfe
  (1 bis 4 Fragen, je 2 bis 4 Optionen, Überschrift `header` höchstens 12
  Zeichen, ergänzt selbst „Other“). Fünf oder eine Option lehnt es mit
  `InputValidationError` ab, der Nutzer sieht dann nichts. Eine PDF-Seite als
  Bild klappt mit `pdftoppm` und `Read`.
- Webseite (Vorlage von „Skript verbessern“, im Browser): Klon von
  `ohmtools/lernhelfer-skript` 0,8 s, `npm ci --omit=dev` 36 s (545 Pakete,
  331 MB, Warnung `ERESOLVE overriding peer dependency`: `mafs@0.21.0` bringt
  `use-resize-observer@9.1.0` mit, das React 16.8 bis 18 verlangt, die
  Vorlage hat React 19.3.1), `npm run pruefen` 2,4 s, `npm run build` 1,8 s,
  `dist/index.html` 1,5 MB. `SendUserFile` mit `display: render` zeigt sie,
  Kapitelwechsel, Regler und Aufdecken gehen.
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
  `api.github.com` und Archive über `github.com` liefern HTTP 403. Ein nicht
  vorhandenes und ein privates Repository ohne Freischaltung enden bei
  `ls-remote` gleich (`could not read Username …`, Exit-Code 128). Nach
  `add_repo` (ohne Bestätigung des Nutzers) endet das private mit 0, das nicht
  vorhandene weiter mit 128.
- Geplante Anweisungen: `mcp__claude-code-remote__create_trigger` (`name`,
  `prompt`, `initiation`, `cron_expression` mit `CRON_TZ=` oder
  `run_once_at`, `notifications` nur `push` und `email`, `permission_mode`,
  `environment_id`, `folders`, `requires_local_device`), ohne Modell und ohne
  Projekt. Dazu `list_triggers`, `update_trigger` (auch `model`, laut
  Beschreibung nur auf ausdrückliche Bitte des Nutzers), `delete_trigger`
  (löscht auch die Chats der Läufe) und `fire_trigger`. Eine Anweisung bekommt
  das Modell des anlegenden Chats. Ihr Lauf ist ein neuer Chat im Projekt des
  anlegenden Chats, ohne Rückfragen (auto mode), mit Plugin, Projektwerkzeugen,
  `pdflatex` und dem GitHub-Zugriff des anlegenden Chats, aber ohne
  `add_repo`, obwohl `create_trigger` `enabled_plugins: []` meldet. Die
  Push-Benachrichtigung kommt. `list_triggers` zeigt die Anweisungen aller
  Projekte des Kontos und bei keiner das Projekt. Löschen einer schon
  gelöschten meldet „not found“. Der Server verschiebt Startzeiten um einige
  Minuten (am 2026-10-23 um 5,5 Minuten bei einer einmaligen Anweisung).
  `update_trigger` mit `model` setzt das Modell nach dem Anlegen, die Liste
  zeigt es, und der Lauf nennt es als sein Modell (`claude-haiku-5-5`). Opus
  setzte es nach einer Rückfrage, die das Modell nannte, wie die beim
  Einrichten. Ein Lauf klont ein privates Repository ohne Bestätigung. Seine
  Shell beginnt im Ordner, den `add_repo` im anlegenden Chat nannte
  (`/home/claude/{repo}`), dort liegt dann `arbeit:`, was nicht stört.
  `list_triggers` nennt `enabled`, `ended_reason` (z.B. `run_once_fired`,
  `auto_disabled_install_removed`) und `last_run` mit Status und Sitzung.
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

Folgen der Läufe vom 2026-10-17: Die drei Initialisierungen und beide Tests
liefen gleichzeitig in mehreren Projekten eines Kontos. Haiku hielt dabei die
automatischen Anweisungen eines anderen Projekts für die eigenen, legte keine
an und meldete trotzdem „eingerichtet“. Opus in der iPad-App hielt sie für
eine doppelt gesendete Nachricht, Opus im Browser löschte beim Aufräumen die
Testanweisung des iPad-Tests samt Chat (dort deshalb „not found“). Dazu kamen:
- in `verwalten/SKILL.md`, „Automatische Anweisungen“: der Projektname im
  Namen, der Lauf im Projekt des anlegenden Chats, Lesezugriff vor dem
  Anlegen, das Modell nach dem Anlegen, alte nur anhand ihrer ID löschen,
  `{liste}` nur mit in diesem Chat angelegten Anweisungen und ihrem Modell;
- in `initialisieren.md`, Vorlage für `{zugriff}`: ohne Werkzeug der
  GitHub-Anbindung direkt klonen;
- in `uebungsblatt.cls` und `ANLEITUNG.md`, Kapitel 1: TX-Typewriter für
  Code, keine Trennung ohne deutsche Trennmuster;
- in `grundlagen.md`: der Pfad aus dem Hinweis der Umgebung, Fotos als
  `image.jpg`, höchstens vier Optionen;
- in `lernen/SKILL.md`, „Nachrechnen“: SymPy vor dem ersten Nachrechnen
  installieren; in `erlernen.md`: `display: render`;
- in `projektanweisung.md`: „für Oberstufe, Berufsschule und Studium“ statt
  „für die Schule“, das Opus als Widerspruch las;
- in `testen.md`: die Tests 1 bis 6 und 8 sind heraus, neu sind Test 1
  (Projektname) und Test 2 (Modell nach dem Anlegen), Testanweisungen löscht
  Claude nur anhand ihrer ID.
Die Testprojekte vom 2026-10-17 haben noch `daten.xml` mit dem alten
`<art>` und, im Projekt von Opus im Browser, Anweisungen ohne Projektnamen.

Folgen des Laufs vom 2026-10-23: Alle drei Tests waren `ok`. Der Lauf der
Testanweisung (Haiku) meldete „kein Werkzeug“ für geplante Anweisungen,
vermutlich weil sie nur nachladbar waren. Dazu kamen:
- in `grundlagen.md`, „Grundregeln“: erst unter den nachladbaren Werkzeugen
  suchen (z.B. `ToolSearch`), dann ohne Werkzeug arbeiten;
- in `automatische-anweisungen.md`, „Anzeigen“: ausgeschaltete Anweisungen
  zählen nicht als laufend;
- in `testen.md`: Tests 1 und 2 und „Als automatische Anweisung“ sind
  heraus, „Webseite“ ist jetzt Test 1, prüft auch `pdfimages` und misst die
  Dauer beliebig.
Bewusst nicht übernommen: `arbeit:` als fester Pfad (der andere Ordner im
Lauf stört nicht), ein Hinweis auf `register_repo_root` (`<art>` lässt schon
nur den Zugriff zählen). Die Peer-Warnung von `npm ci` gehört nach
`ohmtools/lernhelfer-skript`.

Grund für die Datenquelle: Von Uploads über die Projektseite liefert
`project_read` nur extrahierten Text, leere Seiten fehlen darin spurlos, und
eine PDF lässt sich nicht wieder lokal herstellen.

### Ungeprüft

- Push großer Dateien (die Antwort von `add_repo` nennt HTTP 413). Zeigt sich
  beim ersten Hochladen eines echten Skripts, „Hochladen“ nennt dann die
  Zielpfade zum Hochladen von Hand.
- Push in ein Repository ganz ohne Commit nach `symbolic-ref` (nur lokal
  geprüft, der Push in einen neuen Zweig eines leeren Repositorys klappte in
  Claude.ai).
- Wie viel das Lesen großer Modulhandbücher kostet.
- Wöchentliche Läufe mit `CRON_TZ=Europe/Berlin` (nur einmalige geprüft) und
  Benachrichtigung per E-Mail.
- `checkout` einer Datei in einem Lauf (nur im Chat geprüft, im Test vom
  2026-10-23 war die Datenquelle leer). Zeigt sich beim ersten Lauf von
  „Indizieren“.
- Warum zwei ältere geplante Anweisungen des Kontos mit `ended_reason`
  `auto_disabled_install_removed` ausgeschaltet sind. Vermutung: Eine
  Neuinstallation des Plugins schaltet Anweisungen aus, die es benutzen. Dann
  sollte `helfen/SKILL.md` das Neueinrichten auch dafür nennen.
- Ein Kamerafoto direkt aus der iPad- oder iPhone-App (HEIC?). Das Foto aus
  der iPad-App war vermutlich eine digitale Notiz.
- Ob ein Abbruch am Nutzungslimit mitten in einem Aufruf zum Schreiben
  passieren kann. Mit `local_path` unkritisch.
- Ob Settings > Usage in Claude.ai den Reset des Wochenlimits zeigt.
- Ob `SendUserFile` mit `display: render` die Webseite (1,5 MB mit
  Skripten) in der iPad-App zeigt, ob dort Regler per Touch gehen und ob
  `pdfimages` da ist (`testen.md`, Test 1).

Nächster Testlauf: „/lernhelfer:verwalten Teste den Lernhelfer“ als erste
Nachricht in einem neuen Chat in der iPad-App (Test 1). Danach in einem
Projekt mit privater Datenquelle, in der schon Dateien liegen (Skript,
Altklausur, Modulhandbuch), „/lernhelfer:verwalten Richte die automatischen
Anweisungen ein“ und den ersten wöchentlichen Lauf beider Anweisungen
abwarten (Index mit Dateiinhalten, Vorrat, Benachrichtigung, Modell,
Startzeit mit `CRON_TZ`), dann „Mach mir ein Übungsblatt“ mit vorbereitetem
Blatt (Code in TX-Typewriter, keine Silbentrennung).
Danach die Lernmodi, je im Projekt und im Chat ohne Projekt, mit diesen
Fällen:
- „Ich erkläre dir jetzt die Kettenregel“ (Spiegeltest)
- „Frag mich zu Kapitel 3 ab“ (Abfragen)
- „Lass uns das Skript durchgehen“ (Seite für Seite, bei einer Lücke
  angekündigter Wechsel zu Erlernen und zurück zur selben Seite)
- „Gib mir Aufgabe 2 von Blatt 3 mit anderen Zahlen, aber so, dass es kein
  Maximum gibt“ (Übungsblatt auf Leicht ohne Rückfrage, eine Aufgabe als
  PDF, neue Werte vorher nachgerechnet)
- „Mach mir ein Übungsblatt“ mit dem Niveau Leicht (nur bestehende Aufgaben,
  mindestens eine mit anderem Verhalten, das die Angabe nicht verrät)
- „Mach mir ein Übungsblatt“ (höchstens drei Rückfragen, Angabe- und
  Lösungs-PDF mit nachgerechneten Lösungen, Entwurf vor dem Lesen von
  `ANLEITUNG.md`, Deckblatt ohne `??`, jede Aufgabe auf einer eigenen Seite,
  nur Befehle aus `ANLEITUNG.md`, Routineanteil wie in der Altklausur, Zeile
  `Niveau:` in „Zur Aufgabe“)
- „Mach mir ein Übungsblatt auf Expertenniveau“ (auch die Routineaufgaben
  schwerer als ihre Vergleichsaufgabe, ohne Fremdwissen und Fangfragen),
  dazu einmal in einem Fach ohne Altklausur (Hinweis auf das geschätzte
  Niveau)
- „Verbessere Kapitel 2 meines Skripts“, im Projekt mit einer Schwachstelle
  im Kapitel und im Chat mit angehängter PDF (Wortlaut ohne Abweichungen,
  jede Gleichung mit Variablen, jede Abbildung ausgeschnitten und erklärt,
  Fragen am Ende jedes Abschnitts, Seite und ZIP bereitgestellt, Darstellung
  im Browser und in der iPad-App); danach „Mach mit dem Skript weiter“ und
  in einem neuen Chat mit der ZIP weitermachen
- Foto einer fehlerhaften Lösung (Abschrift vor der Bewertung, Fehler darin
  unverändert, Bewertung, Fischgräte, Eintrag mit Ursache
  in `probleme.md`, danach Wechsel zu Erlernen oder bei Rechentechnik zu
  Wiederholen mit einem Spiegeltest zur Regel)

## Arbeitsweise

- Frag nach, bevor du größere Strukturentscheidungen triffst. Der Nutzer
  entscheidet über Aufbau und Abläufe.
- Kleine Korrekturen (Tippfehler, Konsistenz zwischen Dateien) darfst du
  direkt machen.
- Halte `README.md` kurz. Erklärungen, die Claude nach dem Setup geben kann,
  gehören in die Fähigkeiten, nicht ins README.
- Committe nicht ohne Freigabe des Nutzers.
