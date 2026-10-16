# Fähigkeit: Testen

Prüft Annahmen über die Umgebung, auf die sich die übrigen Fähigkeiten
verlassen und die noch kein Testlauf bestätigt hat. Das Ergebnis ist eine
Tabelle mit ausführlichem Protokoll und dient der Entwicklung des Lernhelfers.

Du bist hier ein gewissenhafter Tester. Du folgst jedem Schritt genau, hältst
jede Beobachtung fest und beschönigst nichts, denn auch ein Fehlschlag hilft
weiter.

## Grundsatz

- Schreib im Projekt und in der Datenquelle nur, wo ein Test es verlangt, nur
  Dateien mit `lernhelfer-test` im Namen, und lösch sie wieder. Bevor du in
  die Datenquelle schreibst, frag den Nutzer um Erlaubnis. Alles andere fasst
  du nicht an.
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
  die Websuche und die GitHub-Anbindung mit genauem Namen und ihren
  Parametern. Alle übrigen Werkzeuge nur als Anzahl.
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
   PDF erzeugt. Das Testdokument lädt dieselben Pakete wie die Vorlage für
   Übungsblätter.
   1. Leg den Ordner `arbeit:lernhelfer-test/` an und schreib darin
      `lernhelfer-test.tex` mit diesem Inhalt:

      ```latex
      \documentclass[11pt,a4paper]{exam}
      \usepackage[T1]{fontenc}
      \usepackage[ngerman]{babel}
      \usepackage[sc]{mathpazo}
      \usepackage{tgpagella}
      \usepackage[scale=0.92]{tgheros}
      \renewcommand{\ttdefault}{lmtt}
      \usepackage{microtype,amsmath,amssymb,xcolor,needspace}
      \usepackage[most]{tcolorbox}
      \usepackage{siunitx}
      \usepackage{pgfplots}
      \pgfplotsset{compat=1.18}
      \usepackage[european]{circuitikz}
      \usepackage{listings}
      \lstset{basicstyle=\ttfamily}
      \usepackage[hidelinks]{hyperref}
      \begin{document}
      \begin{tcolorbox}Größe: \qty{12}{\volt}, $\int_0^1 x\,\mathrm{d}x$\end{tcolorbox}
      \begin{lstlisting}[language=Python]
      def f(n): return n
      \end{lstlisting}
      \begin{circuitikz}\draw (0,0) to[R, l=$R_1$] (2,0);\end{circuitikz}
      \begin{tikzpicture}\begin{axis}[width=5cm]\addplot {x^2};\end{axis}\end{tikzpicture}
      \end{document}
      ```

   2. Führ im Ordner `arbeit:lernhelfer-test/` aus:

      ```bash
      pdflatex --version | head -1
      pdflatex -interaction=nonstopmode -halt-on-error lernhelfer-test.tex > /dev/null; echo "exit=$?"
      grep -A2 '^!' lernhelfer-test.log
      grep 'Font shape .* undefined' lernhelfer-test.log
      pdffonts lernhelfer-test.pdf
      pdftoppm -r 80 -png lernhelfer-test.pdf seite
      ```

      Erwartet: `exit=0`, keine Zeile mit `!` und keine Warnung
      `Font shape … undefined`. `pdffonts` nennt eine Schrift mit `LMMono`
      im Namen. Fehlt das Paket lmodern, setzt LaTeX den Code ohne
      Fehlermeldung in einer Serifenschrift. Dann fehlt `LMMono`, und das Log
      warnt vor `T1/lmtt`.
   3. Sieh dir das Bild der Seite an. Erwartet: ein Kasten mit „Größe: 12 V“
      und einem Integral, die Codezeile in Schreibmaschinenschrift (alle
      Zeichen gleich breit), ein Widerstand mit „R1“ und eine Parabel.

   `ok`: alles wie erwartet. `teilweise`: Das Dokument wird übersetzt, aber
   etwas anderes weicht ab, z.B. die Schrift des Codes. `fehlgeschlagen`:
   `pdflatex` fehlt oder bricht mit einem Fehler ab. Detail: Version, Exit-Code
   und jede fehlende Datei (`File … not found`). Protokoll: alle Befehle mit
   Ausgabe, die Schriften aus `pdffonts` und was das Bild zeigt.
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

## Aufräumen

Lösch jede Datei, die ein Test im Projekt oder in der Datenquelle angelegt hat,
und prüf, dass nichts davon übrig ist. Bleibt etwas übrig, nenne es in
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
