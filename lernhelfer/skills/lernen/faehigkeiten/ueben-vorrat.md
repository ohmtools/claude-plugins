# Fähigkeit: Üben – Vorrat

Teil der Fähigkeit „Üben“ in `skill:faehigkeiten/ueben.md`. Rolle und Regeln
von dort gelten weiter. Steht hier „Schritt“ mit einer Nummer, ist ein Schritt
des Abschnitts „Übungsblatt“ dort gemeint. Auch die übrigen Abschnitte, die
hier ohne Datei stehen (z.B. „Niveau“), stehen dort.

## Vorrat

Im **Projekt** kann es pro Modul vorbereitete Übungsblätter geben, beliebig
viele, jedes etwa 45 Minuten auf Klausurniveau+ zu den Schwachstellen und
fälligen Themen. Die automatische Anweisung „Übungsblätter vorbereiten“, die
der Nutzer einrichten kann, legt bei jedem Lauf einmal pro Woche ein weiteres
an, wenn übrige Nutzung sonst verfallen würde. Der Nutzer bekommt es dann
sofort, und es kostet nur einen Bruchteil eines neuen Blatts, vor allem das
Abschreiben des Quelltexts. Gespeichert ist nur der LaTeX-Quelltext aus dem
Abschnitt „Übungsblatt“, denn PDFs lassen sich nicht in den Projektdateien
ablegen, als `projekt:vorrat/{modul}/uebungsblatt-{erstellt}.tex`. Davor steht
ein Kopf:

```latex
% Lernhelfer-Vorrat
% erstellt: 2026-10-22
% dauer: 45 Minuten
% aufgaben: 3
% punkte: 45
% themen: Kettenregel, Partielle Integration
% =====================================================================
%  uebungsblatt.tex – leeres Grundgerüst für ein neues Übungsblatt
…
\end{document}
```

- `{erstellt}` und `erstellt`: der Tag der Erstellung. Gibt es für das Modul
  an diesem Tag schon ein Blatt, bekommt der Dateiname `-2`, `-3` usw.
  angehängt (z.B. `uebungsblatt-2026-10-22-2.tex`).
- `dauer`, `aufgaben` und `punkte`: wie `{dauer}`, `{anzahl}` und `{punkte}`
  in Schritt 10.
- `themen`: die Schwachstellen und fälligen Themen, die das Blatt abdeckt,
  durch Kommas getrennt und genau so geschrieben wie in der Spalte `Thema` von
  `projekt:gedaechtnis/{modul}/probleme.md`, damit du sie beim Auswählen
  wiederfindest.

Ein Blatt im Vorrat wurde vor dem Speichern vollständig geprüft. Prüf es
danach nicht noch einmal, auch nicht gegen die Datenquelle.

Damit du zum Auswählen nicht jedes Blatt lesen musst, was bei vielen Blättern
viele Token kostet, steht jedes Blatt mit den Angaben aus seinem Kopf auch in
`projekt:vorrat/{modul}/uebersicht.md`. Fehlt die Datei, gilt sie als leer.
Ein Blatt ohne Zeile darin bietest du nie an.

```markdown
# Vorrat

| Datei | Erstellt | Dauer | Aufgaben | Punkte | Themen |
|---|---|---|---|---|---|
| uebungsblatt-2026-10-22.tex | 2026-10-22 | 45 Minuten | 3 | 45 | Kettenregel, Partielle Integration |
```

## Speichern

Nur die automatische Anweisung speichert Blätter, nur auf Klausurniveau+ und
erst, wenn das Blatt Schritt 9 („Prüfen“) bestanden hat. So kommt nie ein
halbes Blatt in den Vorrat (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt
„Abbruch“). Ein Blatt, das eigene Dateien einbindet (z.B. mit `\bild` oder
`\codedatei`), speicherst du nicht, denn der Vorrat hält nur den Quelltext.

1. Bestimm den Dateinamen aus dem heutigen Datum und den Blättern, die schon
   in `projekt:vorrat/{modul}/` liegen. Schreib den Kopf mit dem heutigen
   Datum unter `erstellt` nach `arbeit:uebungsblatt/kopf.tex`. Führ dann im
   Ordner `arbeit:uebungsblatt/` aus:

   ```bash
   cat kopf.tex uebungsblatt.tex > vorrat.tex
   tail -n 1 vorrat.tex
   ```

2. Prüf, dass `tail` `\end{document}` ausgibt.
3. Schreib `arbeit:uebungsblatt/vorrat.tex` mit einem einzigen Aufruf unter
   dem Dateinamen nach `projekt:vorrat/{modul}/`, mit Angabe ihres Pfads statt
   ihres Inhalts (z.B. `local_path` bei `project_write`).
4. Lies erst danach `projekt:vorrat/{modul}/uebersicht.md`, fehlt sie, nimm
   die Vorlage ohne Zeilen unter der Kopfzeile. Häng eine Zeile mit dem
   Dateinamen und den Angaben aus dem Kopf an und schreib die Datei. In dieser
   Reihenfolge bleibt nach einem Abbruch höchstens ein Blatt ohne Zeile übrig,
   nie eine Zeile ohne Blatt.

## Auswählen

1. Lies `projekt:vorrat/{modul}/uebersicht.md`, nicht die Blätter. In Frage
   kommt jede Zeile, deren Datei in der Projektübersicht liegt. Nennt die
   Anfrage bestimmte Themen, kommen nur Zeilen in Frage, deren `Themen` alle
   diese Themen enthalten.
2. Zähl für jede, wie viele ihrer `Themen` heute Schwachstellen sind
   (Abschnitt „Niveau“, „Niveau des Blatts“) oder fällig (`skill:SKILL.md`,
   Abschnitt „Fällige Themen“).
3. Nimm das Blatt mit der höchsten Zahl, bei Gleichstand das neueste (das
   späteste Datum unter `Erstellt`, dann die höchste Nummer im Dateinamen),
   denn es kennt die neuesten Probleme. Für die Rückfrage ist `{vorrat-dauer}`
   der Wert unter `Dauer` in seiner Zeile und `{themen}` der unter `Themen`.

## Benutzen

1. Lies das Blatt aus „Auswählen“.
2. Lösch `arbeit:uebungsblatt/`, falls es den Ordner aus diesem Chat schon
   gibt, leg ihn neu an und kopiere `skill:vorlagen/uebungsblatt.cls`,
   `skill:vorlagen/ohmtools-colors.sty` und `skill:vorlagen/build.sh` hinein.
   Liefert dein Werkzeug die gelesene Datei als Datei, kopiere sie nach
   `arbeit:uebungsblatt/uebungsblatt.tex`, sonst schreib ihren Inhalt
   dorthin, Zeichen für Zeichen unverändert. Setz darin
   `\fach` auf `{modulname}`, denn das Fach kann inzwischen anders heißen.
3. Übersetze wie in Schritt 8. Endet es nicht mit `exit=0`, benutze das Blatt
   nicht und mach mit den übrigen Rückfragen in Schritt 2 weiter wie ohne
   Vorrat. Lösch es dann aus dem Vorrat wie in Punkt 5, außer eine Meldung
   enthält `not found` (z.B. `pdflatex: not found` oder `File … not found`),
   denn dann fehlen hier nur LaTeX oder ein Paket.
4. Schritt 9 entfällt, das Blatt wurde vor dem Speichern geprüft.
5. Lösch das Blatt aus dem Vorrat, bevor du die PDFs bereitstellst: Entferne
   zuerst seine Zeile aus `projekt:vorrat/{modul}/uebersicht.md` und schreib
   die Datei, lösch dann das Blatt selbst. So bekommt der Nutzer kein Blatt
   zweimal, auch wenn der Chat dazwischen endet.
6. Mach mit Schritt 10 weiter, mit `{dauer}`, `{anzahl}` und `{punkte}` aus
   `dauer`, `aufgaben` und `punkte` im Kopf und `Klausurniveau+` als
   `{niveau}`. `{ohne-klausur}` entfällt, denn die Lösung nennt den Maßstab
   selbst. Mach danach mit Schritt 11 weiter.
