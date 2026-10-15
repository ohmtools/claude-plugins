# Fähigkeit: Test

Prüft, ob die Umgebung alles kann, worauf sich die übrigen Fähigkeiten
verlassen, und gibt das Ergebnis als Tabelle mit ausführlichem Protokoll aus.
Das Ergebnis dient der Entwicklung des Lernhelfers.

## Grundsatz

- Schreib im Projekt nur in den Ordner `projekt:test/` und lösch ihn am Ende
  vollständig. In der Datenquelle schreibst du nur in Test 9, nur in den Zweig
  `lernhelfer-test`, und löschst ihn gleich danach. Alles andere fasst du
  nicht an.
- Beschönige nichts. Auch ein Fehlschlag ist ein wertvolles Ergebnis.
- Schlägt ein Test fehl, notiere das und mach mit dem nächsten weiter. Brich
  nicht ab.
- Ergebnis pro Test: `ok`, `teilweise`, `fehlgeschlagen` oder `übersprungen`,
  dazu ein kurzes Detail (Befehl, Fehlermeldung, gemessener Wert).
- Das Protokoll ist der wichtigste Teil des Ergebnisses. Wer den Lernhelfer
  weiterentwickelt, sieht diesen Chat nicht und kann nur aus dem Protokoll
  nachvollziehen, was passiert ist. Schreib lieber zu viel als zu wenig.

## Protokoll

Halte alles während der Tests fest, nicht erst am Ende aus dem Gedächtnis.
Notiere für die Vorbereitung, jeden ausgeführten Test und das Aufräumen:

- **Vorgehen:** jeden Versuch in der Reihenfolge, in der du ihn gemacht hast:
  genauer Name des Werkzeugs oder der Befehl, mit allen Parametern. Lass
  Dateiinhalte weg, nenne nur Pfad und Größe.
- **Ausgabe:** Rückgabewerte, HTTP-Status, Exit-Codes und Fehlermeldungen
  wörtlich, nicht zusammengefasst. Bei langen Ausgaben die ersten und letzten
  zehn Zeilen.
- **Beobachtungen:** alles Unerwartete, auch bei `ok`: Warnungen, Umwege,
  lange Wartezeiten, abweichende Pfade oder Dateinamen, Hinweise der
  Oberfläche, Einschränkungen, die in der Beschreibung eines Werkzeugs stehen.
- **Ausweichwege:** Schlägt ein Weg fehl, probier mindestens einen anderen
  sinnvollen Weg, solange du dabei nur dort schreibst, wo dieser Test es
  erlaubt. Notiere jeden mit Ergebnis.
- **Ursache:** deine Vermutung, warum etwas nicht geklappt hat, und woran du
  sie festmachst. Kennzeichne Vermutungen als Vermutungen.
- **Offen:** was du nicht prüfen oder nicht sicher feststellen konntest, und
  warum.
- **Folgen:** welche Fähigkeit (Datei und Abschnitt) betroffen ist und was dort
  geändert werden sollte.

Nenne im Protokoll nur Dateien, die der Test selbst anlegt, und Dateien des
Plugins. Von allen anderen Dateien im Projekt und in der Datenquelle nennst du
nur die Anzahl. Sie gehören dem Nutzer.

## Umfang

- **Alles** (Standard): Tests 1 bis 11.
- **Nur Indizieren** (z.B. „Teste das Indizieren“, typischerweise in einem Chat
  mit Haiku): Vorbereitung, Test 1, Test 11, Aufräumen.

## Vorbereitung

### Umgebung erfassen

Halte vor dem ersten Test fest:

- Modell, Datum und, soweit erkennbar, die Oberfläche (Browser oder App).
- Die Betriebsart (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt
  „Betriebsart“) und woran du sie erkannt hast, und ob es `projekt:daten.xml`
  gibt.
- Alle Werkzeuge, die dir zur Verfügung stehen, mit genauem Namen und einer
  Zeile zum Zweck. Bei Werkzeugen für Projektdateien, Dateien im Chat,
  Rückfragen und GitHub zusätzlich ihre Parameter.
- Arbeitsumgebung: Ausgabe von `uname -a`, `python3 --version`, `pwd` und
  `df -h .`.

### Test-PDFs erzeugen

Leg den neuen, leeren Ordner `arbeit:lernhelfer-test/` an und erzeuge darin
mit den beiden Skripten unten die Dateien
`arbeit:lernhelfer-test/lernhelfer-test.pdf` und
`arbeit:lernhelfer-test/lernhelfer-test-2.pdf`. Ändere die
Skripte nicht, Test 11 vergleicht mit genau diesem Inhalt. Notiere jeweils
Größe in Bytes und SHA-256 (`sha256sum`). Weicht eine Datei von der Erwartung
ab, notiere es bei Test 1 und mach mit deiner Datei weiter.

`arbeit:lernhelfer-test/lernhelfer-test.pdf`, drei Seiten mit unkomprimiertem
Inhalt:

```python
seiten = [
    ["Testskript Lernhelfer", "Kapitel 1: Ableitungen",
     "Kettenregel: (f(g(x)))' = f'(g(x)) * g'(x)",
     "Produktregel: (u*v)' = u'*v + u*v'", "- 7 -"],
    ["Kapitel 2: Integrale",
     "Partielle Integration: Int u'*v dx = u*v - Int u*v' dx",
     "Substitution: Int f(g(x))*g'(x) dx = Int f(t) dt", "- 8 -"],
    ["Uebungen", "Aufgabe 1: Leite sin(x^2) ab.",
     "Aufgabe 2: Berechne Int x*e^x dx.",
     "Aufgabe 3: Berechne Int 2x*cos(x^2) dx.", "- 9 -"],
]

def text(s):
    return s.replace("\\", "\\\\").replace("(", "\\(").replace(")", "\\)")

n = len(seiten)
objs = [
    "<< /Type /Catalog /Pages 2 0 R >>",
    "<< /Type /Pages /Kids [%s] /Count %d >>"
    % (" ".join("%d 0 R" % (4 + 2 * i) for i in range(n)), n),
    "<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>",
]
for i, zeilen in enumerate(seiten):
    ops = ["BT /F1 14 Tf 72 %d Td (%s) Tj ET" % (780 - 28 * k, text(z))
           for k, z in enumerate(zeilen[:-1])]
    ops.append("BT /F1 10 Tf 285 40 Td (%s) Tj ET" % text(zeilen[-1]))
    stream = "\n".join(ops)
    objs.append("<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] "
                "/Resources << /Font << /F1 3 0 R >> >> /Contents %d 0 R >>"
                % (5 + 2 * i))
    objs.append("<< /Length %d >>\nstream\n%s\nendstream" % (len(stream), stream))

out = b"%PDF-1.4\n"
offsets = []
for k, o in enumerate(objs, 1):
    offsets.append(len(out))
    out += ("%d 0 obj\n%s\nendobj\n" % (k, o)).encode("latin-1")
xref = len(out)
out += ("xref\n0 %d\n0000000000 65535 f \n" % (len(objs) + 1)).encode()
for o in offsets:
    out += ("%010d 00000 n \n" % o).encode()
out += ("trailer\n<< /Size %d /Root 1 0 R >>\nstartxref\n%d\n%%%%EOF\n"
        % (len(objs) + 1, xref)).encode()
open("lernhelfer-test.pdf", "wb").write(out)
```

Erwartet: 1830 Bytes, SHA-256
`0e11d6991b58e2131b25b8365c36f90bbdc132cdbd68ecc2a009e807e47fdc99`.

`arbeit:lernhelfer-test/lernhelfer-test-2.pdf`, vier Seiten mit komprimiertem
Inhalt wie in echten Skripten. Seite 2 ist leer, Seite 3 hat keine aufgedruckte
Seitenzahl:

```python
import zlib

seiten = [
    ["Testskript Lernhelfer 2", "Kapitel 3: Grenzwerte",
     "Regel von L'Hospital: lim f/g = lim f'/g'", "- 21 -"],
    [],
    ["Kapitel 4: Reihen",
     "Geometrische Reihe: Sum q^k = 1/(1-q) fuer |q| < 1", ""],
    ["Uebungen", "Aufgabe 1: Berechne lim sin(x)/x fuer x gegen 0.",
     "Aufgabe 2: Berechne Sum (1/2)^k.", "- 24 -"],
]

def text(s):
    return s.replace("\\", "\\\\").replace("(", "\\(").replace(")", "\\)")

n = len(seiten)
objs = [
    b"<< /Type /Catalog /Pages 2 0 R >>",
    ("<< /Type /Pages /Kids [%s] /Count %d >>"
     % (" ".join("%d 0 R" % (4 + 2 * i) for i in range(n)), n)).encode(),
    b"<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>",
]
for i, zeilen in enumerate(seiten):
    ops = ["BT /F1 14 Tf 72 %d Td (%s) Tj ET" % (780 - 28 * k, text(z))
           for k, z in enumerate(zeilen[:-1])]
    if zeilen and zeilen[-1]:
        ops.append("BT /F1 10 Tf 285 40 Td (%s) Tj ET" % text(zeilen[-1]))
    stream = zlib.compress("\n".join(ops).encode("latin-1"), 9)
    objs.append(("<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] "
                 "/Resources << /Font << /F1 3 0 R >> >> /Contents %d 0 R >>"
                 % (5 + 2 * i)).encode())
    objs.append(b"<< /Length %d /Filter /FlateDecode >>\nstream\n"
                % len(stream) + stream + b"\nendstream")

out = b"%PDF-1.4\n"
offsets = []
for k, o in enumerate(objs, 1):
    offsets.append(len(out))
    out += b"%d 0 obj\n" % k + o + b"\nendobj\n"
xref = len(out)
out += b"xref\n0 %d\n0000000000 65535 f \n" % (len(objs) + 1)
for o in offsets:
    out += b"%010d 00000 n \n" % o
out += (b"trailer\n<< /Size %d /Root 1 0 R >>\nstartxref\n%d\n%%%%EOF\n"
        % (len(objs) + 1, xref))
open("lernhelfer-test-2.pdf", "wb").write(out)
```

Erwartet: 1715 Bytes, SHA-256
`38f83595d9105052c5563fc51369209a034c7e0b98aaf1fa1a899099232efa4e`. Eine andere
zlib-Version kann hier eine Abweichung erklären. Notiere dazu die Ausgabe von
`python3 -c "import zlib; print(zlib.ZLIB_RUNTIME_VERSION)"`.

## Tests

1. **Werkzeuge:** Prüf mit `command -v` `curl`, `git`, `unzip`, `zip`,
   `file`, `sha256sum`, `python3`, `pdftoppm`, `pdftotext` und `pdfinfo`.
   Detail: was fehlt. Protokoll: Pfad und Version jedes vorhandenen Werkzeugs
   (z.B. `git --version`, `pdftoppm -v`).
2. **Plugin-Ordner:** Ermittle die Ordner hinter `skill:` und `plugin:`
   (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Pfade“). Davon hängen
   ab, dass `lernen` und `verwalten` ihre Grundlagen finden und „Entwicklung“
   die Dateien des Lernhelfers. Liste `plugin:` mit `find {ordner} -type f`.
   `ok`: Es gibt `plugin:.claude-plugin/plugin.json`,
   `plugin:skills/gemeinsam/grundlagen.md`, `plugin:skills/helfen/SKILL.md`,
   `plugin:skills/verwalten/SKILL.md` und `plugin:skills/lernen/SKILL.md`, alle
   Dateien aus den Tabellen „Was ist zu tun?“ in
   `plugin:skills/verwalten/SKILL.md` und „Fähigkeiten“ in
   `plugin:skills/lernen/SKILL.md` liegen dort und lassen sich lesen, und dein
   Werkzeug für Skills listet `lernhelfer:helfen`, `lernhelfer:verwalten` und
   `lernhelfer:lernen`. `teilweise`: Die Skills stehen zur Verfügung, aber
   Dateien fehlen oder `plugin:` ist nicht zu finden. Detail: echter Pfad
   hinter `plugin:`. Protokoll: wie du die Ordner gefunden hast, die
   vollständige Ausgabe von `find`, die ersten zehn Zeilen jeder `SKILL.md`
   wörtlich, Name und Rückmeldung des Werkzeugs für Skills und welche
   Werkzeuge oder Hinweise zu Skills und Plugins dir sonst zur Verfügung
   stehen.
3. **Schreiben:** Erzeuge im Ordner hinter `arbeit:` mit
   `printf '# Testdatei\n\nUmlaute: äöü ÄÖÜ ß\nZeichen: – „Zitat“ €\n' > schreiben.md`
   die Datei `arbeit:schreiben.md` (erwartet: 68 Bytes, SHA-256
   `4e38bdc931afcef744a6d5f9ceedab1a8ca26d286ce0b1ea538f3676d49f113e`).
   Schreib denselben Inhalt als Text nach `projekt:test/fach/schreiben.md` ins
   Projekt, so wie alle Fähigkeiten ins Projekt schreiben. Protokoll: Werkzeug
   mit allen Parametern außer dem Inhalt und seine vollständige Rückmeldung.
4. **Zurücklesen:** Lies `projekt:test/fach/schreiben.md` aus dem Projekt und
   vergleiche den Inhalt Zeichen für Zeichen mit `arbeit:schreiben.md`. Schreib
   den gelesenen Text dafür nicht mit dem Schreibwerkzeug in eine Datei, es
   entfernt Leerzeichen am Zeilenende. `ok`: identisch. Detail: wie der Inhalt
   ankam (inline oder als lokale Datei). Protokoll: Werkzeug, Rückgabe
   wörtlich, bei Abweichung welche Zeichen sich unterscheiden. Eine Abweichung
   ist schwerwiegend: Alle Fähigkeiten verlassen sich darauf, dass Umlaute und
   Sonderzeichen beim Schreiben ins Projekt erhalten bleiben.
5. **Projektübersicht:** Ruf einmal die Projektübersicht auf. `ok`: Die Datei
   liegt genau unter `projekt:test/fach/schreiben.md`. Ein veränderter Pfad ist
   `fehlgeschlagen`. Detail: welche Angaben die Übersicht pro Datei liefert.
   Protokoll: den Eintrag für `projekt:test/fach/schreiben.md` wörtlich, Name
   des Werkzeugs und wie die Übersicht aufgebaut ist (Listen, Felder,
   Sortierung, ob Ordner vorkommen, ob sie abgeschnitten wird). Andere Dateien
   nur als Anzahl.
6. **PDF als Bild:** Wandle Seite 1 von
   `arbeit:lernhelfer-test/lernhelfer-test.pdf` in ein Bild um
   (`pdftoppm -f 1 -l 1 -r 100 -png`) und sieh es dir an. `ok`: Du liest
   darauf „Kapitel 1: Ableitungen“. Detail: welches Werkzeug. Protokoll:
   Befehl, Größe des Bildes in Bytes und Pixeln, wie du es dir angesehen hast
   (Werkzeug) und alles, was du darauf liest. Klappt das Ansehen nicht,
   notiere die Meldung.
7. **Herunterladen und Auswahlfelder:** Stell
   `arbeit:lernhelfer-test/lernhelfer-test.pdf` und
   `arbeit:lernhelfer-test/lernhelfer-test-2.pdf` dem Nutzer im Chat zum
   Herunterladen bereit. Stell danach diese Rückfrage:

   ```auswahl
   Ich habe dir die Dateien lernhelfer-test.pdf und lernhelfer-test-2.pdf zum Herunterladen bereitgestellt. Lade bitte lernhelfer-test.pdf herunter, du brauchst sie für einen späteren Test. Klappt das?
   - Heruntergeladen
   - Herunterladen klappt nicht
   - Überspringen
   ```

   - Auswahlfelder: `ok`, wenn du sie als Knöpfe anzeigen konntest, sonst
     `fehlgeschlagen`.
   - Herunterladen: `fehlgeschlagen` bei „Herunterladen klappt nicht“,
     `übersprungen` bei „Überspringen“, sonst `ok`.
   - Protokoll: Werkzeuge, Parameter und Rückmeldungen, gewählte Antwort
     wörtlich. Schreibt der Nutzer zusätzlich etwas, übernimm es wörtlich.
8. **Datenquelle lesen:** Nur wenn es `projekt:daten.xml` gibt, sonst
   `übersprungen`. Lies `projekt:daten.xml` und folge `<art>`: Klone die
   Datenquelle nach `arbeit:daten/` und miss die Dauer (`time`). Hol die Liste
   der Dateien, dann die erste Datei der Liste wie beschrieben, und
   vergleiche `git -C daten hash-object '{pfad}'` mit ihrer Identifikation
   laut `<identifizieren>`. `ok`: Klonen, Liste und Holen
   klappen, und beide IDs sind gleich. `teilweise`: Es klappt nur auf einem
   anderen Weg (z.B. ohne `--filter=blob:none` oder nur nach Hinweis der
   GitHub-Anbindung). Detail: Dauer, Größe von `arbeit:daten/` (`du -sh`),
   Zahl der Dateien. Protokoll: alle Befehle mit Ausgabe, Warnungen von git
   wörtlich, ob und wie du die GitHub-Anbindung benutzt hast.
9. **In die Datenquelle schreiben:** Nur wenn es `projekt:daten.xml` gibt,
   sonst `übersprungen`. Stell diese Rückfrage:

   ```auswahl
   Für den nächsten Test lege ich in deiner Datenquelle den Zweig lernhelfer-test mit einer kleinen Testdatei an und lösche ihn gleich danach wieder. Deine Dateien im Hauptzweig bleiben unberührt. Einverstanden?
   - Einverstanden
   - Überspringen
   ```

   Bei „Überspringen“: `übersprungen`. Bei „Einverstanden“ hol dir über die
   GitHub-Anbindung deiner Arbeitsumgebung (z.B. ein Werkzeug `add_repo`)
   Schreibzugriff und folge ihrer Anleitung. Führ danach im Ordner `arbeit:`
   aus, wobei `{url}` aus `projekt:daten.xml` stammt:

   ```bash
   git -C daten reset -q
   cp schreiben.md daten/lernhelfer-test.md
   git -C daten add -- lernhelfer-test.md
   git -C daten -c user.name="Lernhelfer" -c user.email="lernhelfer@example.invalid" commit -q -m "Lernhelfer: Test"
   git -C daten push origin HEAD:refs/heads/lernhelfer-test
   git ls-remote {url}.git refs/heads/lernhelfer-test
   git -C daten rev-parse HEAD
   git -C daten push origin --delete lernhelfer-test
   git ls-remote {url}.git refs/heads/lernhelfer-test
   ```

   `ok`: Der Push klappt, das erste `ls-remote` gibt dieselbe ID aus wie
   `rev-parse`, und nach dem Löschen gibt es den Zweig nicht mehr.
   `fehlgeschlagen`: Es gibt keine GitHub-Anbindung oder der Push klappt
   nicht. Dann kann „Hochladen“ nicht selbst hochladen. Detail: Name der
   GitHub-Anbindung und wo es hakt. Protokoll: Werkzeug mit Parametern und
   vollständiger Rückmeldung, alle Befehle mit Ausgabe.
10. **Anhang im Chat:** Nur nach „Heruntergeladen“ in Test 7, sonst
    `übersprungen`. Antworte:

    ```text
    Häng bitte lernhelfer-test.pdf hier im Chat an und schick die Nachricht ohne weiteren Text. Geht das nicht, schreib „geht nicht“.
    ```

    Warte auf die Antwort. Such danach die angehängte Datei in deiner
    Arbeitsumgebung, nicht `arbeit:lernhelfer-test/lernhelfer-test.pdf`, mit
    `find / -xdev -name '*lernhelfer-test*' 2>/dev/null`. `ok`: Sie liegt als
    PDF-Datei vor (`file`), ihr SHA-256 stimmt mit
    `arbeit:lernhelfer-test/lernhelfer-test.pdf` überein, und `pdftoppm` macht
    aus Seite 1 ein Bild, auf dem du „Kapitel 1: Ableitungen“ liest.
    `teilweise`: Der Inhalt kommt nur im Chat an (z.B. als Text oder Bilder der
    Seiten), nicht als Datei. `fehlgeschlagen` bei „geht nicht“. Detail: Pfad
    der Datei. Protokoll: alle Befehle mit Ausgabe, Pfad, Größe, SHA-256,
    Ausgabe von `file` und wie der Anhang bei dir ankam (Text, Bilder, Hinweis
    auf einen Pfad).
11. **Indizieren:** Lies die Fähigkeit „Indizieren“
    (`skill:faehigkeiten/indizieren.md`) vollständig. Lies danach
    `arbeit:lernhelfer-test/lernhelfer-test.pdf` und
    `arbeit:lernhelfer-test/lernhelfer-test-2.pdf` so, wie Schritt 4 dort es
    beschreibt, und mach dieselben Notizen. Schreib nichts. Vergleiche mit
    dieser Erwartung:

    | Datei | Stichwort | Erwartete Seiten |
    |---|---|---|
    | `lernhelfer-test.pdf` | Ableitungen | 1, 3 A1 |
    | `lernhelfer-test.pdf` | Integrale | 2, 3 A2, 3 A3 |
    | `lernhelfer-test.pdf` | Kettenregel | 1, 3 A1 |
    | `lernhelfer-test.pdf` | Produktregel | 1 |
    | `lernhelfer-test.pdf` | Partielle Integration | 2, 3 A2 |
    | `lernhelfer-test.pdf` | Substitution | 2, 3 A3 |
    | `lernhelfer-test-2.pdf` | Grenzwerte | 1, 4 A1 |
    | `lernhelfer-test-2.pdf` | Reihen | 3, 4 A2 |
    | `lernhelfer-test-2.pdf` | Regel von L'Hospital | 1, 4 A1 |
    | `lernhelfer-test-2.pdf` | Geometrische Reihe | 3, 4 A2 |

    `ok`: alle Einträge mit richtigen Seiten. Häufigste Fehler: die
    aufgedruckten statt der Dateiseiten (7 bis 9, 21 und 24) und in
    `lernhelfer-test-2.pdf` die leere Seite nicht mitgezählt (2 statt 3, 3
    statt 4). Detail: Modell, gefundene und fehlende Einträge, falsche Seiten.

    Protokoll:
    - Befehl und Zahl der Seitenvorschübe (`\f`) pro Datei, wie die leere
      Seite erscheint.
    - Den gelesenen Text von Seite 1 jeder Datei wörtlich.
    - Wie du die Seitennummern bestimmt hast.
    - Deine vollständige Notiz: Beschreibung und alle Stichwörter mit Seiten,
      auch die, die nicht in der Erwartung stehen.
    - Stellen in der Fähigkeit „Indizieren“, die du unklar fandest.

## Aufräumen

Lösch alle Dateien unter `projekt:test/`. Prüf in der Projektübersicht, dass
nichts davon übrig ist. Gibt es den Zweig `lernhelfer-test` aus Test 9 noch,
lösch ihn. Bleibt etwas übrig, nenne es in `{reste}`. Protokoll: jeden
Löschversuch mit Werkzeug und Rückmeldung.

## Ergebnis

Antworte mit der folgenden Nachricht. Kürze sie nicht, auch wenn sie lang
wird.

- `{zeilen}`: eine Tabellenzeile pro Test, den du ausgeführt hast, in der
  Reihenfolge oben, z.B.
  `| 5 Projektübersicht | ok | Pfad exakt, Felder path und created_at |`.
  Test 7 bekommt die zwei Zeilen „Herunterladen“ und „Auswahlfelder“.
- `{umgebung}`: was du unter „Umgebung erfassen“ notiert hast, als Liste.
- `{protokoll}`: ein Abschnitt `### {name}` für die Vorbereitung, jeden
  ausgeführten Test (z.B. `### 4 Zurücklesen`) und das
  Aufräumen. Darin die Punkte aus dem Abschnitt „Protokoll“ als Liste. Lass
  Punkte ohne Inhalt weg. Für übersprungene Tests nur der Grund.
- `{vorschlaege}`: eine nummerierte Liste konkreter Änderungen am
  Lernhelfer, je mit Datei und Abschnitt, Begründung und dem Test, auf den sie
  sich stützt. Nimm auch Unklarheiten in dieser Fähigkeit auf und alles, was
  dir außerhalb der Tests aufgefallen ist. Gibt es keine: `Keine.`

```text
Testergebnis für den Lernhelfer mit {modell}:

| Test | Ergebnis | Detail |
|---|---|---|
{zeilen}

## Umgebung

{umgebung}

## Protokoll

{protokoll}

## Vorschläge

{vorschlaege}

{reste}
Kopiere dieses Ergebnis, wenn du es für die Weiterentwicklung des Lernhelfers brauchst.
```

War das Herunterladen in Test 7 `ok`, schreib die Nachricht zusätzlich in die
Datei `arbeit:lernhelfer-testergebnis.md`, stell sie zum Herunterladen bereit
und häng an:

```text
Das Ergebnis liegt auch als Datei lernhelfer-testergebnis.md zum Herunterladen bereit.
```

`{reste}`: Ist nach dem Aufräumen etwas übrig, setze diese Zeile ein, sonst
lass den Platzhalter samt Zeile weg:

```text
Diese Testdateien konnte ich nicht löschen, entferne sie bitte selbst: {dateien}
```

Lief nur der Indizieren-Test und war das Modell nicht Haiku, häng an:

```text
Wiederhole diesen Test am besten in einem neuen Chat mit dem Modell Haiku: Schreib dort „/lernhelfer:verwalten Teste das Indizieren“.
```
