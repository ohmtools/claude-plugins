# Fähigkeit: Testen

Prüft Annahmen über die Umgebung, auf die sich die übrigen Fähigkeiten
verlassen und die noch kein Testlauf bestätigt hat. Das Ergebnis ist eine
Tabelle mit ausführlichem Protokoll und dient der Entwicklung des Lernhelfers.

Du bist hier ein gewissenhafter Tester. Du folgst jedem Schritt genau, hältst
jede Beobachtung fest und beschönigst nichts, denn auch ein Fehlschlag hilft
weiter.

## Grundsatz

- Schreib im Projekt und in der Datenquelle nur, wo ein Test es verlangt, nur
  Dateien mit `lernhelfer-test` im Namen, und lösch sie wieder. Dasselbe gilt
  für geplante Anweisungen. Bevor du in die Datenquelle schreibst, frag den
  Nutzer um Erlaubnis. Alles andere fasst du nicht an.
- Schlägt ein Test fehl, notiere das und mach mit dem nächsten weiter. Brich
  nicht ab.
- Ergebnis pro Test: `ok`, `teilweise`, `fehlgeschlagen` oder `übersprungen`,
  dazu ein kurzes Detail (Befehl, Fehlermeldung, gemessener Wert).
- Das Protokoll ist der wichtigste Teil des Ergebnisses. Wer den Lernhelfer
  weiterentwickelt, sieht diesen Chat nicht und kann nur aus dem Protokoll
  nachvollziehen, was passiert ist. Schreib lieber zu viel als zu wenig.

## Als automatische Anweisung

Lautet die Anfrage „Teste den Lernhelfer als automatische Anweisung“, läuft
dieser Chat als geplante Anweisung aus Test 7, und niemand liest mit. Führ dann
nur diese Schritte aus, ohne Rückfrage, statt der übrigen Abschnitte:

1. Halte fest: dein Modell, Datum und Uhrzeit, ob du Werkzeuge für
   Projektdateien hast und wie viele Dateien die Projektübersicht nennt, die
   erste Zeile der Rückmeldung des Werkzeugs `Skill` und die Ausgabe von
   `pdflatex --version | head -1; echo "exit=$?"`.
2. Nur wenn es `projekt:daten.xml` gibt: Hol die Liste der Dateien der
   Datenquelle, wie `projekt:daten.xml` es beschreibt. Notiere, ob das klappt,
   mit Befehlen, Exit-Codes und Fehlermeldungen wörtlich, und nur die Zahl der
   Dateien. Bei einem privaten Repository notiere auch die vollständige
   Rückmeldung der GitHub-Anbindung und ob sie eine Bestätigung verlangt hat.
3. Schreib alles als Liste nach `projekt:lernhelfer-test-geplant.md`.
4. Antworte:

   ```text
   Test der automatischen Anweisungen fertig. Das Ergebnis liegt in lernhelfer-test-geplant.md.
   ```

## Protokoll

Halte alles während der Tests fest, nicht erst am Ende aus dem Gedächtnis.
Notiere für die Vorbereitung, jeden ausgeführten Test und das Aufräumen:

- **Vorgehen:** jeden Versuch in der Reihenfolge, in der du ihn gemacht hast:
  genauer Name des Werkzeugs oder der Befehl, mit allen Parametern.
- **Ausgabe:** Rückgabewerte, Exit-Codes und Fehlermeldungen wörtlich, nicht
  zusammengefasst. Bei langen Ausgaben die ersten und letzten zehn Zeilen.
- **Beobachtungen:** alles Unerwartete, auch bei `ok`: Warnungen, Umwege,
  lange Wartezeiten, abweichende Pfade, Hinweise der Oberfläche.
- **Ausweichwege:** Schlägt ein Weg fehl, probier einen anderen sinnvollen
  Weg, solange du dabei nur dort schreibst, wo dieser Test es erlaubt. Notiere
  jeden mit Ergebnis. Wiederhol nichts, das mit HTTP 403 abgelehnt wurde, das
  ist eine Sperre der Arbeitsumgebung.
- **Ursache:** deine Vermutung, warum etwas nicht geklappt hat, und woran du
  sie festmachst. Kennzeichne Vermutungen als Vermutungen.
- **Offen:** was du nicht prüfen oder nicht sicher feststellen konntest, und
  warum.
- **Folgen:** welche Fähigkeit (Datei und Abschnitt) betroffen ist und was dort
  geändert werden sollte.

Nenne im Protokoll nur Dateien, die der Test selbst anlegt, und Dateien des
Plugins. Von allen anderen Dateien im Projekt und in der Datenquelle nennst du
nur die Anzahl. Sie gehören dem Nutzer.

## Vorbereitung

Stell diese Rückfrage:

```auswahl
Wo läuft dieser Chat gerade?
- Im Browser
- In der Claude-App auf Handy oder Tablet
- In der Claude-App am Computer
```

Halte danach fest:

- Modell, Datum und die Antwort auf die Rückfrage.
- Die Betriebsart (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt
  „Betriebsart“) und ob es `projekt:daten.xml` gibt.
- Die Werkzeuge für Projektdateien, Rückfragen, Dateien im Chat, die Shell,
  die Websuche, die GitHub-Anbindung und geplante Anweisungen mit genauem
  Namen und ihren Parametern. Alle übrigen Werkzeuge nur als Anzahl.
- Arbeitsumgebung: Ausgabe von `uname -a`, `pwd` und `df -h .`.

## Tests

1. **Zugriff ohne Freischaltung:** Nur wenn es `projekt:daten.xml` gibt, sonst
   `übersprungen`. Davon hängt ab, dass „Initialisieren“ einen falschen Link
   und ein privates Repository nicht für ein leeres öffentliches hält
   (`skill:faehigkeiten/initialisieren.md`, Schritt 3). Hast du in diesem Chat
   schon die GitHub-Anbindung benutzt, ist der Test `übersprungen`, Detail
   „GitHub-Anbindung schon benutzt, in einem neuen Chat wiederholen“. Sonst
   führ ihn vor jedem anderen Zugriff auf die Datenquelle aus. `{url}` stammt
   aus `projekt:daten.xml`, `{besitzer}` ist der Teil nach `https://github.com/`
   bis zum nächsten `/`.
   1. Führ im Ordner `arbeit:` aus:

      ```bash
      GIT_TERMINAL_PROMPT=0 git ls-remote https://github.com/{besitzer}/lernhelfer-test-gibt-es-nicht.git HEAD; echo "exit=$?"
      GIT_TERMINAL_PROMPT=0 git ls-remote {url}.git HEAD; echo "exit=$?"
      ```

      Erwartet: Der erste Befehl endet mit einem Exit-Code ungleich 0. Der
      zweite endet bei einem öffentlichen Repository mit 0, bei einem privaten
      (`<art>` beginnt mit „Privates GitHub-Repository“) mit einem Exit-Code
      ungleich 0.
   2. Nur bei einem privaten Repository: Hol dir über die GitHub-Anbindung
      deiner Arbeitsumgebung (z.B. ein Werkzeug `add_repo`) Lesezugriff auf
      `{url}`. Aus ihrer Antwort zählt nur, ob du Zugriff hast. Klone nicht
      nach ihrer Anleitung. Wiederhol danach den zweiten Befehl. Erwartet:
      Exit-Code 0.

   `ok`: alles wie erwartet. `fehlgeschlagen`: Ein Befehl, der laut Erwartung
   mit einem Exit-Code ungleich 0 enden soll, endet mit 0. Dann hält
   „Initialisieren“ einen falschen Link oder ein privates Repository ohne
   Zugriff für ein leeres öffentliches Repository. `teilweise`: jede andere
   Abweichung. Detail: öffentlich oder privat und die Exit-Codes. Protokoll:
   jeder Befehl mit vollständiger Ausgabe und Exit-Code, das Werkzeug der
   GitHub-Anbindung mit Parametern und vollständiger Rückmeldung.
2. **Grenzen der Auswahlfelder:** Davon hängt die Regel für Rückfragen mit
   vielen oder nur einer Option ab (`plugin:skills/gemeinsam/grundlagen.md`,
   Abschnitt „Nachrichten und Rückfragen“). Hast du keine Auswahlfelder, ist
   der Test `übersprungen`.
   1. Notiere aus der Beschreibung des Werkzeugs für Auswahlfelder die
      kleinste und die größte erlaubte Zahl von Optionen und ob es selbst ein
      Feld für eigenen Text ergänzt.
   2. Ruf das Werkzeug mit der Frage „Test der Auswahlfelder: Wähl bitte die
      letzte Option.“ und den fünf Optionen „Eins“ bis „Fünf“ auf, auch wenn
      die Beschreibung weniger erlaubt. Erwartet: Erlaubt die Beschreibung
      höchstens vier Optionen, lehnt das Werkzeug den Aufruf ab. Sonst sieht
      der Nutzer fünf Knöpfe und wählt „Fünf“.
   3. Ruf es mit derselben Frage und nur der Option „Eins“ auf. Erwartet:
      Verlangt die Beschreibung mindestens zwei Optionen, lehnt das Werkzeug
      den Aufruf ab. Sonst sieht der Nutzer einen Knopf.

   `ok`: Beide Aufrufe verhalten sich wie die Beschreibung. `teilweise`: jede
   Abweichung. Detail: kleinste und größte Zahl, Ergebnis beider Aufrufe.
   Protokoll: beide Aufrufe mit Parametern und vollständiger Rückmeldung.
3. **LaTeX:** Davon hängt ab, dass „Üben“ im Skill `lernen` Übungsblätter als
   PDF erzeugt. Das Testdokument lädt dieselben Pakete und Schriften wie die
   Klasse der Vorlage für Übungsblätter.
   1. Leg den Ordner `arbeit:lernhelfer-test/` an und schreib darin
      `lernhelfer-test.tex` mit diesem Inhalt:

      ```latex
      \NeedsTeXFormat{LaTeX2e}[2022/06/01]
      \documentclass[11pt,a4paper]{article}
      \usepackage[T1]{fontenc}
      \usepackage[utf8]{inputenc}
      \IfFileExists{ngerman.ldf}{\usepackage[ngerman]{babel}}{\usepackage[provide=*,ngerman]{babel}}
      \usepackage{geometry,array,booktabs,amsmath,amssymb,graphicx}
      \usepackage[table]{xcolor}
      \usepackage{tikz}
      \usetikzlibrary{arrows.meta,positioning,calc,automata,shapes.geometric,backgrounds}
      \usepackage[european,siunitx]{circuitikz}
      \usepackage{pgfplots}
      \pgfplotsset{compat=1.18}
      \usepackage{tikz-timing,siunitx,enumitem,fancyhdr,lastpage,listings,verbatim}
      \usepackage{tcolorbox}
      \tcbuselibrary{skins,breakable,listings}
      \IfFileExists{plex-sans.sty}{\usepackage[sfdefault]{plex-sans}}{\usepackage[scaled=0.92]{helvet}\renewcommand\familydefault{\sfdefault}}
      \IfFileExists{plex-mono.sty}{\usepackage[scale=0.95]{plex-mono}}{\IfFileExists{t1xtt.fd}{\renewcommand\ttdefault{txtt}}{\usepackage{courier}}}
      \usepackage[italic,defaultmathsizes]{mathastext}
      \usepackage[letterspace=90]{microtype}
      \lstset{basicstyle=\ttfamily}
      \begin{document}
      \begin{tcolorbox}Größe: \qty{12}{\volt}, $\int_0^1 x\,\mathrm{d}x = \fpeval{1/2}$\end{tcolorbox}
      \begin{lstlisting}[language=Python]
      def f(n): return n
      \end{lstlisting}
      \begin{circuitikz}\draw (0,0) to[R, l=$R_1$] (2,0);\end{circuitikz}
      \begin{tikzpicture}\begin{axis}[width=5cm]\addplot {x^2};\end{axis}\end{tikzpicture}
      \begin{tikztimingtable}CLK & L 4{C} \\\end{tikztimingtable}
      Seite \thepage\ / \pageref{LastPage}
      \end{document}
      ```

   2. Führ im Ordner `arbeit:lernhelfer-test/` aus:

      ```bash
      pdflatex --version | head -1
      kpsewhich plex-sans.sty plex-mono.sty ngerman.ldf
      pdflatex -interaction=nonstopmode -halt-on-error lernhelfer-test.tex > /dev/null; echo "exit=$?"
      pdflatex -interaction=nonstopmode -halt-on-error lernhelfer-test.tex > /dev/null; echo "exit=$?"
      grep -A2 '^!' lernhelfer-test.log
      grep -E 'Font shape .* undefined|You have requested' lernhelfer-test.log
      pdffonts lernhelfer-test.pdf
      pdftoppm -r 80 -png lernhelfer-test.pdf seite
      ```

      Erwartet: `kpsewhich` gibt drei Pfade aus, beide Durchläufe enden mit
      `exit=0`, es gibt keine Zeile mit `!`, keine Warnung
      `Font shape … undefined` und keine Warnung `You have requested release`
      (dann ist LaTeX älter als die Klasse verlangt). `pdffonts` nennt
      Schriften mit `plxSans` und `plxMono` im Namen. Fehlt das Paket plex
      (IBM Plex), setzt die Klasse ohne Fehlermeldung Helvetica und eine
      andere Schreibmaschinenschrift. Dann fehlt `plex-sans.sty` in der
      Ausgabe von `kpsewhich`, und `pdffonts` nennt z.B. `NimbusSanL`.
   3. Sieh dir das Bild der Seite an. Erwartet: ein Kasten mit „Größe: 12 V“
      und einem Integral mit „= 0.5“, die Codezeile in Schreibmaschinenschrift
      (alle Zeichen gleich breit), ein Widerstand mit „R1“, eine Parabel, ein
      Taktsignal mit „CLK“ und „Seite 1 / 1“.

   `ok`: alles wie erwartet. `teilweise`: Das Dokument wird übersetzt, aber
   etwas anderes weicht ab, z.B. fehlt IBM Plex. `fehlgeschlagen`: `pdflatex`
   fehlt oder bricht mit einem Fehler ab. Detail: Version, Exit-Code, die
   Schriften und jede fehlende Datei (`File … not found`). Protokoll: alle
   Befehle mit Ausgabe, die Schriften aus `pdffonts` und was das Bild zeigt.
4. **Rechnen mit Python:** Davon hängt ab, dass die Lernmodi Ergebnisse mit
   SymPy, NumPy und SciPy nachrechnen (Skill `lernen`, Abschnitt
   „Nachrechnen“).
   1. Führ aus:

      ```bash
      python3 -c "import sympy, numpy, scipy; print(sympy.__version__, numpy.__version__, scipy.__version__)"; echo "exit=$?"
      python3 -c "import sympy as sp; x = sp.symbols('x'); print(sp.diff(sp.sin(x**2), x))"
      ```

      Erwartet: drei Versionsnummern, `exit=0` und `2*x*cos(x**2)`.
   2. Nur wenn ein Paket fehlt (`ModuleNotFoundError`): Führ
      `pip install sympy numpy scipy; echo "exit=$?"` aus und wiederhol
      Punkt 1.

   `ok`: Punkt 1 klappt ohne Installation. `teilweise`: Er klappt erst nach
   `pip install`. `fehlgeschlagen`: Er klappt auch danach nicht. Detail:
   Versionen oder fehlende Pakete. Protokoll: alle Befehle mit Ausgabe.
5. **Darstellung im Chat:** Davon hängt ab, dass „Erlernen“ im Skill `lernen`
   Darstellungen als HTML-Datei zeigt.
   1. Schreib `arbeit:lernhelfer-test.html` mit diesem Inhalt und stell die
      Datei mit deinem Werkzeug zum Bereitstellen von Dateien bereit:

      ```html
      <!doctype html>
      <html lang="de"><meta charset="utf-8"><title>Lernhelfer-Test</title>
      <svg width="200" height="120"><circle id="k" cx="100" cy="60" r="40" fill="steelblue"/></svg>
      <p><button onclick="document.getElementById('k').setAttribute('fill','orange')">Färben</button></p>
      </html>
      ```

   2. Stell diese Rückfrage:

      ```auswahl
      Test der Darstellung: Ich habe dir lernhelfer-test.html bereitgestellt. Was siehst du, wenn du sie öffnest und auf „Färben“ tippst?
      - Der Kreis wird orange
      - Kreis da, Knopf ohne Wirkung
      - Ich kann sie nicht öffnen
      ```

   `ok`: „Der Kreis wird orange“. `teilweise`: jede andere Antwort. Detail: die
   Antwort und die Oberfläche aus der Vorbereitung. Protokoll: Werkzeug mit
   Parametern und Rückmeldung, die Antwort des Nutzers und ob die Datei im Chat
   selbst oder erst nach dem Herunterladen zu sehen war, falls er das sagt.
6. **Fotos im Chat:** Davon hängt ab, dass „Korrigieren“ im Skill `lernen`
   Fotos handschriftlicher Lösungen lesen kann. Stell diese Rückfrage:

   ```auswahl
   Test der Fotos: Häng mir in deiner nächsten Nachricht ein Foto an, am besten direkt aus der Kamera und von etwas Handschriftlichem. Machst du mit?
   - Ich schicke ein Foto
   - Test überspringen
   ```

   Bei „Test überspringen“ ist der Test `übersprungen`. Sonst such die Datei
   wie in `plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Pfade“, führ
   `file '{datei}'` aus und sieh sie dir mit deinem Werkzeug zum Lesen von
   Dateien an. Erwartet: JPEG oder PNG, und du kannst die Handschrift lesen.
   `ok`: alles wie erwartet. `teilweise`: ein anderes Format (z.B. HEIC) oder
   unleserlich. `fehlgeschlagen`: Du findest die Datei nicht oder kannst sie
   nicht ansehen. Detail: Format und Lesbarkeit. Protokoll: Pfad, Ausgabe von
   `file`, wie du sie angesehen hast und was du lesen konntest, ohne den Inhalt
   wiederzugeben.
7. **Automatische Anweisungen:** Davon hängt ab, dass „Initialisieren“ und
   „Automatische Anweisungen“ geplante Anweisungen anlegen und dass diese ohne
   den Nutzer laufen (`skill:SKILL.md`, Abschnitt „Automatische
   Anweisungen“). Hast du kein Werkzeug für geplante Anweisungen, ist der Test
   `fehlgeschlagen`, Detail „kein Werkzeug“.
   1. Notiere aus der Beschreibung des Werkzeugs: ob es Anweisungen einmal pro
      Woche zu einer Uhrzeit in einer Zeitzone anlegt, ob jeder Lauf ein neuer
      Chat in diesem Projekt sein kann, ob sich das Modell setzen lässt, welche
      Benachrichtigungen es gibt (push, email, slack), ob es Anweisungen
      auflisten und löschen kann und ob die Liste das Projekt nennt.
   2. Leg eine Anweisung an, die einmal etwa drei Minuten nach jetzt läuft:
      Name `Lernhelfer-Test`, in einem neuen Chat in diesem Projekt, Modell
      Haiku, Benachrichtigung push, mit diesem Prompt:

      ```text
      /lernhelfer:verwalten Teste den Lernhelfer als automatische Anweisung
      ```

      Kann das Werkzeug keine einmalige Anweisung, nimm eine wöchentliche zur
      nächsten möglichen Zeit.
   3. Stell diese Rückfrage, wobei `{uhrzeit}` ihre Zeit ist:

      ```auswahl
      Test der automatischen Anweisungen: Ich habe eine für {uhrzeit} angelegt. Sie läuft in einem neuen Chat in diesem Projekt. Sag mir Bescheid, sobald du den Chat oder eine Benachrichtigung siehst, spätestens nach zehn Minuten.
      - Gelaufen, mit Benachrichtigung
      - Gelaufen, ohne Benachrichtigung
      - Nichts passiert
      ```

   4. Lies `projekt:lernhelfer-test-geplant.md`, hol die Liste der geplanten
      Anweisungen und lösch `Lernhelfer-Test`.

   `ok`: Sie ist mit Benachrichtigung gelaufen, und laut
   `projekt:lernhelfer-test-geplant.md` lief sie mit Haiku, hatte Werkzeuge für
   Projektdateien, den Skill, `pdflatex` und, falls es `projekt:daten.xml`
   gibt, Zugriff auf die Datenquelle ohne Bestätigung. `teilweise`: Sie ist
   gelaufen, aber etwas davon fehlt. `fehlgeschlagen`: Sie ließ sich nicht
   anlegen oder ist nicht gelaufen. Detail: Werkzeug und was fehlte.
   Protokoll: das Werkzeug mit allen Parametern und Rückmeldungen, die Antwort
   des Nutzers und den Inhalt von `projekt:lernhelfer-test-geplant.md`
   vollständig.
8. **LaTeX-Quelltext in den Projektdateien:** Davon hängt der Vorrat an
   Übungsblättern ab (Skill `lernen`, Fähigkeit „Üben“, Abschnitt „Vorrat“),
   den „Üben“ mit Angabe des Pfads statt des Inhalts schreibt
   (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Abbruch“).
   1. Führ im Ordner `arbeit:` aus:

      ```bash
      mkdir -p lernhelfer-test
      python3 - <<'EOF'
      zeilen = ['% Lernhelfer-Test: Umlaute äöüß, Prozent %, Backslash \\ und {Klammern}']
      zeilen += [f'\\section{{Abschnitt {i}}} $\\int_0^1 x\\,\\mathrm{{d}}x$ = 0,5 äöü' for i in range(1, 401)]
      zeilen += ['\\end{document}', '% Ende des Lernhelfer-Vorrats']
      with open('lernhelfer-test/lernhelfer-test.tex', 'w', encoding='utf-8') as f:
          f.write('\n'.join(zeilen) + '\n')
      EOF
      wc -lc lernhelfer-test/lernhelfer-test.tex
      sha256sum lernhelfer-test/lernhelfer-test.tex
      ```

      Erwartet: 403 Zeilen, etwa 25 KB.
   2. Schreib die Datei mit dem Werkzeug für Projektdateien und Angabe ihres
      Pfads (z.B. `local_path` bei `project_write`) nach
      `projekt:lernhelfer-test/lernhelfer-test.tex`.
   3. Lies sie mit dem Werkzeug wieder. Liefert es eine Datei, vergleiche sie
      mit `sha256sum`. Liefert es den Inhalt im Chat, prüf darin die erste
      Zeile, die Zeilen mit `Abschnitt 200` und `Abschnitt 400` und die
      letzten beiden Zeilen Zeichen für Zeichen.
   4. Lösch sie mit dem Werkzeug wieder und prüf in der Projektübersicht, dass
      sie fehlt.

   `ok`: Die Datei kommt unverändert zurück und lässt sich löschen.
   `teilweise`: Sie kommt verändert oder gekürzt zurück, oder Schreiben mit
   Pfad klappt nicht, nur mit Inhalt. `fehlgeschlagen`: Sie lässt sich nicht
   schreiben oder nicht löschen. Detail: wie das Werkzeug sie liefert (Datei
   oder Inhalt) und was abweicht. Protokoll: alle Aufrufe mit Parametern und
   Rückmeldungen, ohne den Inhalt der Datei.

## Aufräumen

Lösch jede Datei, die ein Test im Projekt oder in der Datenquelle angelegt hat,
und jede geplante Anweisung, die ein Test angelegt hat, und prüf, dass nichts
davon übrig ist. Bleibt etwas übrig, nenne es in
`{reste}`, eine Datei der Datenquelle mit `{url}`. Protokoll: jeden
Löschversuch mit Werkzeug oder Befehl und Rückmeldung. Hat kein Test etwas
angelegt, notiere nur das.

## Ergebnis

Schreib die folgende Nachricht in die Datei
`arbeit:lernhelfer-testergebnis.md`, stell sie zum Herunterladen bereit und
antworte mit derselben Nachricht. Kürze sie nicht, auch wenn sie lang wird.

- `{modell}` und `{oberflaeche}`: Modell und Antwort aus der Vorbereitung.
- `{zeilen}`: eine Tabellenzeile pro Test in der Reihenfolge oben, z.B.
  `| 1 Zugriff ohne Freischaltung | ok | privat, Exit-Codes 128, 128, 0 |`.
- `{umgebung}`: was du in der Vorbereitung notiert hast, als Liste.
- `{protokoll}`: ein Abschnitt `### {name}` für die Vorbereitung, jeden Test
  (z.B. `### 1 Zugriff ohne Freischaltung`) und das Aufräumen. Darin die
  Punkte aus dem Abschnitt „Protokoll“ als Liste. Lass Punkte ohne Inhalt weg.
  Für übersprungene Tests nur der Grund.
- `{vorschlaege}`: eine nummerierte Liste konkreter Änderungen am
  Lernhelfer, je mit Datei und Abschnitt, Begründung und dem Test, auf den sie
  sich stützt. Nimm auch Unklarheiten in dieser Fähigkeit auf und alles, was
  dir außerhalb der Tests aufgefallen ist. Gibt es keine: `Keine.`
- `{reste}`: Ist nach dem Aufräumen etwas übrig, setze diese Zeile ein, wobei
  `{dateien}` die Reste aus dem Aufräumen sind, sonst lass den Platzhalter
  samt Zeile weg:

  ```text
  Diese Testdateien konnte ich nicht löschen, entferne sie bitte selbst: {dateien}
  ```

```text
Testergebnis für den Lernhelfer mit {modell}, {oberflaeche}:

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
Das Ergebnis liegt auch als Datei lernhelfer-testergebnis.md zum Herunterladen bereit. Gib es an die Person weiter, die den Lernhelfer entwickelt.
```
