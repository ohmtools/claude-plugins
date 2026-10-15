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
| Text der Projektanweisungen | `skills/verwalten/faehigkeiten/projektanweisung.md` |
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
| Annahmen über die Zielumgebung prüfen | `skills/verwalten/faehigkeiten/test.md` |
| Antworten auf Fragen zum Lernhelfer | `skills/helfen/SKILL.md` |

Lies vor einer Änderung `skills/gemeinsam/grundlagen.md`,
`skills/lernen/SKILL.md`, `skills/verwalten/SKILL.md`, `entwicklung.md` und
alle Dateien, die die Änderung betrifft, vollständig.

## Regeln für dieses Repository

- Die Konventionen in `entwicklung.md` gelten auch für dich.
- Neue Konventionen für Fähigkeiten gehören nach `entwicklung.md`, nicht
  hierher, weil die Entwicklungsinstanz im Projekt nur das Plugin kennt.
- Prüf nach jeder Änderung mit `claude plugin validate .`.
- Diese Stellen sind bewusst doppelt und müssen übereinstimmen:
  - Repository-URL: `README.md`, `plugin.json` (`homepage`, `repository`),
    `projektanweisung.md` und `helfen/SKILL.md`.
  - Pfad der Grundlagen (`skills/gemeinsam/grundlagen.md`): Abschnitt
    „Grundlagen“ in `lernen/SKILL.md` und `verwalten/SKILL.md` (dort auch die
    Fehlermeldung), `entwicklung.md` („Vorbereiten“, „Exportieren“) und
    `test.md`, Test 2.
  - Formatnummern: Tabelle „Formate“ und die Vorlagen in `grundlagen.md`,
    dazu die Vorlagen in `modul-bearbeiten.md` und `initialisieren.md`.
  - Zugriff auf die Datenquelle mit git: Vorlage für `daten.xml` in
    `initialisieren.md`, Befehle in `hochladen.md`, Tests 8 und 9 in
    `test.md`.
  - Beschreibung und Lernziele aus dem Modulhandbuch auslesen:
    `indizieren.md`, Schritt 5, und `modul-bearbeiten.md`, „Lernziele
    übernehmen“, Schritte 3 und 4.
  - Erkennen des Modulhandbuchs am Dateinamen („Modulhandbuch“ oder
    „Lehrplan“): `verwalten/SKILL.md` („Dateien der Datenquelle“), die
    Abschlussnachricht in `initialisieren.md`, `modul-bearbeiten.md` und
    `helfen/SKILL.md`.
  - Seiten zählen mit `pdftotext` und `\f`: `lernen/SKILL.md`
    („PDF-Dateien“), `indizieren.md`, Schritt 4, und `test.md`, Test 11.

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
- Lokal geprüft (git 2.43 über `file://`, poppler 24.02): Klon ohne
  Dateiinhalte, `ls-tree`, einzelne Datei mit `checkout`, Commit nach
  `git reset` und Push aus diesem Klon ohne Verlust anderer Dateien;
  `pdftotext` beendet jede Seite mit `\f`, auch leere. In Claude.ai
  ungeprüft: ob Claude.ai den ganzen Plugin-Ordner bereitstellt, sodass
  `lernen` und `verwalten` `skills/gemeinsam/grundlagen.md` finden (Test 2,
  sonst sind beide Skills unbrauchbar), Klon mit `--filter` über den Proxy,
  die GitHub-Anbindung zum Lesen privater Repositorys und zum Pushen,
  Installation über `marketplace.json` mit `"source": "./"` (besteht
  `claude plugin validate`).
- Lernmodi (`erlernen.md`, `wiederholen.md`, `ueben.md`) sind Platzhalter, an
  denen der Nutzer arbeitet. Nicht anfassen. Erst sie pflegen
  `probleme.md`, bis dahin bleibt „Schwachstellen listen“ meist leer.
- Offen: Was passiert, wenn ein Nutzer trotzdem Dateien über die Projektseite
  hochlädt (dafür gibt es keine Regel mehr).

### Frühere Testläufe (vor dem Plugin, Version 0.11.2 und 0.14.0)

Noch gültig:

- Werkzeuge: `curl`, `git`, `zip`, `unzip`, `file`, `sha256sum`, `python3`,
  `pdftoppm`, `pdftotext`, `pypdf`, `pdfplumber` und `pypdfium2` vorhanden,
  PyMuPDF fehlt.
- `api.github.com` und Archive über `github.com` liefern HTTP 403 (Proxy,
  Meldung verweist auf `add_repo`). `git clone`, `git ls-remote` und
  `raw.githubusercontent.com` klappen.
- Hochladen ins Projekt (`project_write` mit `local_path`) nur aus
  `/home/claude`, nicht aus `/tmp`. Das Werkzeug `Write` entfernt Leerzeichen
  am Zeilenende.
- Projektübersicht (`project_info`): Uploads in `files`, eigene Dokumente in
  `docs`, pro Datei nur `path` und `created_at`.
- Im Chat angehängte Dateien liegen unter `/root/.claude/uploads/{sitzung}/`
  mit Präfix aus acht Hex-Zeichen und Bindestrich.
- Auswahlfelder (`AskUserQuestion`, Kurztitel höchstens 12 Zeichen, ergänzt
  selbst „Andere“), PDF-Seite als Bild und Dateien zum Herunterladen
  (`SendUserFile`) klappen, auch in der iPad-App.
- Haiku und Opus fanden beim Indizieren alle erwarteten Einträge.

Grund für die Datenquelle: Von Uploads über die Projektseite liefert
`project_read` nur extrahierten Text, leere Seiten fehlen darin spurlos, und
eine PDF lässt sich nicht wieder lokal herstellen.

Nächster Testlauf: „/lernhelfer:verwalten Teste den Lernhelfer“ in einem
Projekt mit Datenquelle (vor allem Tests 2, 8 und 9), danach „Teste das
Indizieren“ mit Haiku. Danach die Lernmodi.

## Arbeitsweise

- Frag nach, bevor du größere Strukturentscheidungen triffst. Der Nutzer
  entscheidet über Aufbau und Abläufe.
- Kleine Korrekturen (Tippfehler, Konsistenz zwischen Dateien) darfst du
  direkt machen.
- Halte `README.md` kurz. Erklärungen, die Claude nach dem Setup geben kann,
  gehören in die Fähigkeiten, nicht ins README.
- Committe nicht ohne Freigabe des Nutzers.
