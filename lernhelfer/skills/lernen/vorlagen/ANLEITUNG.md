# Anleitung: LaTeX-Vorlage `uebungsblatt.cls`

Diese Anleitung richtet sich an alle, die mit der Vorlage Übungsblätter
und Lösungsvorschläge schreiben, insbesondere an **KI-Modelle, deren Aufgabe
es ist, gute Prüfungsaufgaben zu formulieren**. Du musst nichts über Design wissen:
Schrift, Farben, Abstände, Seitenumbrüche, Punktezählung und Deckblatt
erledigt die Klasse. Deine Aufgabe ist nur der **Inhalt**, ausgedrückt mit
den Befehlen („Primitiven“) aus dieser Anleitung.

---

## Inhalt

1. [Dateien und Kompilieren](#1-dateien-und-kompilieren)
2. [Goldene Regeln](#2-goldene-regeln)
3. [Grundgerüst eines Blatts](#3-grundgerüst-eines-blatts)
4. [Präambel: Angaben zum Blatt](#4-präambel-angaben-zum-blatt)
5. [Aufgaben und Punkte](#5-aufgaben-und-punkte)
6. [Textbausteine: gegeben/gesucht, Hinweise, zwei Spalten](#6-textbausteine)
7. [Abbildungen](#7-abbildungen)
8. [Code](#8-code)
9. [Antwortformate: Multiple Choice, Richtig/Falsch, Zuordnung](#9-antwortformate)
10. [Notation und Zahlen](#10-notation-und-zahlen)
11. [Lösungsvorschlag](#11-lösungsvorschlag)
12. [Welcher Baustein für welchen Inhalt?](#12-welcher-baustein-für-welchen-inhalt)
13. [Häufige Fehler](#13-häufige-fehler)
14. [Checkliste vor der Abgabe](#14-checkliste-vor-der-abgabe)

---

## 1. Dateien und Kompilieren

| Datei | Zweck |
|---|---|
| `uebungsblatt.cls` | Die Vorlage (Klasse). Muss im selben Ordner wie das Blatt liegen. Nicht verändern. |
| `ohmtools-colors.sty` | Die Farben des ohmtools-Designs, von der Klasse geladen. Muss ebenfalls im selben Ordner liegen. Nicht verändern. |
| `uebungsblatt.tex` | Leeres Grundgerüst zum Kopieren. |
| `build.sh` | Übersetzt ein Blatt zu zwei PDFs: Aufgabenblatt und Lösungsvorschlag (Kapitel 11). |
| `beispiel.tex` | Vollständiges Beispiel mit Lösungen, das **jeden** Baustein benutzt. Bei Unklarheiten dort nachsehen. |
| `material/` | Beispieldateien (Bild, C-Datei) für `\bild` und `\codedatei`. |
| `ANLEITUNG-schaltungen.md`, `ANLEITUNG-digitaltechnik.md`, `ANLEITUNG-code.md` | Weitere Bausteine, nur bei Bedarf zu lesen (Kapitel 12). |

Kompilieren mit **pdfLaTeX**, am einfachsten mit `build.sh` (Name des Blatts
ohne `.tex`, ohne Angabe `uebungsblatt`):

```
sh build.sh blatt
```

Das erzeugt aus `blatt.tex` die Dateien `blatt.pdf` (Aufgabenblatt) und
`blatt-loesung.pdf` (Lösungsvorschlag). Gesamtpunkte, Aufgabenliste auf dem
Deckblatt und „Seite x / y“ werden über die `.aux`-Datei gesammelt und
brauchen **zwei Durchläufe**. `build.sh`, latexmk und Overleaf erledigen das
automatisch. Steht auf dem Deckblatt „??“, einfach noch einmal kompilieren.

Benötigte Pakete (in TeX Live enthalten): tikz, circuitikz, pgfplots,
tikz-timing, siunitx, listings, tcolorbox, enumitem, fancyhdr, lastpage,
booktabs, microtype. Schriften: Text in Helvetica, Zahlen als Daten
(Punkte, Seiten, Werte in Tabellen) und Code in TX-Typewriter oder Courier,
Formeln in Computer Modern. Die Klasse trennt keine Wörter und setzt
Flattersatz.

Das Aussehen folgt dem ohmtools-Design: Schwarz und Grau, Linien statt
Kästen, keine Großbuchstaben. Rot steht nur für das, was der
Lösungsvorschlag hinzufügt (Kapitel 11), nie in der Angabe.

---

## 2. Goldene Regeln

1. **Nur die Bausteine aus dieser Anleitung verwenden.** Keine eigenen
   Farben (`\color`, `\textcolor`), Schriftgrößen (`\large`, `\small`),
   Abstände (`\vspace`, `\hspace`, `\\[..]`), Seitenumbrüche (`\newpage`)
   oder Umgebungen wie `figure`, `table`, `tabular`, `itemize` für Aufgaben.
2. **Jede Aufgabe ist eine `aufgabe`-Umgebung.** Sie beginnt automatisch auf
   einer neuen Seite und wird automatisch aufs Deckblatt übernommen.
3. **Punkte vergibst du nur über `\teil{..}`, `ankreuzen` oder
   `\begin{aufgabe}[..]`.** Summen rechnet die Klasse selbst.
4. **Keine leeren Lösungsfelder, Linien oder Kästen zum Hineinschreiben.**
   Das Blatt wird digital (z. B. GoodNotes auf dem iPad) bearbeitet; der
   freie Platz unter der Aufgabe reicht. Erlaubt sind Ankreuzkästchen
   (`antworten`, `ankreuzen`), Zuordnungen und Abbildungen, in die etwas
   eingezeichnet werden soll (z. B. leeres `koordinatensystem`, Zeitdiagramm
   mit fehlender Zeile, `kvdiagramm[leer]`).
5. **Lösungen stehen nur in `loesung`-Umgebungen** und den
   Lösungsmarkierungen (`\antwort*`, `\aussage[r]`, `\paar[k]`,
   `\nurloesung`). Im Aufgabenblatt sind sie automatisch unsichtbar
   (Kapitel 11). Zu jeder Aufgabe gehört eine vollständige Lösung.
6. **Physikalische Größen immer mit siunitx**: `\qty{12}{V}`,
   `\qty{4.7}{k\ohm}`, `\num{1.5}`. Das sorgt für Dezimalkomma und richtige
   Abstände. Dezimalzahlen im Quelltext mit **Punkt** schreiben (`\qty{2.5}{mA}`),
   ausgegeben wird ein Komma.
7. **Variablen kursiv in Mathe** (`$U_0$`), Indizes, die Wörter sind, aufrecht:
   `$R_\mathrm{ges}$`, `$U_\mathrm{eff}$`.
8. Sprache des Blatts: Deutsch, Sie-Form, Imperativ („Berechnen Sie …“).

---

## 3. Grundgerüst eines Blatts

```latex
\documentclass{uebungsblatt}

\fach{Grundlagen der Elektrotechnik}
\bearbeitungszeit{60 min}
\hilfsmittel{Formelsammlung, nicht programmierbarer Taschenrechner}
\hinweis{Rechenweg vollständig angeben}

\begin{document}

\begin{aufgabe}{Titel der ersten Aufgabe}
Angabe (Aufgabentext) ...

\begin{teilaufgaben}
  \teil{3} Erste Teilaufgabe.
    \begin{loesung}
      Lösungsweg ... $x = \ergebnis{\qty{5}{V}}$ \teilpunkt{3}
    \end{loesung}
  \teil{2} Zweite Teilaufgabe.
    \begin{loesung}
      ...
    \end{loesung}
\end{teilaufgaben}
\end{aufgabe}

\begin{aufgabe}{Titel der zweiten Aufgabe}
...
\end{aufgabe}

\end{document}
```

Den Lösungsvorschlag erzeugt dieselbe Datei, nur mit eingeblendeten Lösungen
(siehe Kapitel 11). Eine zweite Datei ist nicht nötig.

Das Deckblatt (Titel, Bearbeitungszeit, Gesamtpunkte, Anzahl Aufgaben,
Aufgabenliste mit Punkten, Hinweise) entsteht **automatisch** am
Dokumentanfang. Schreibe dafür nichts in den Dokumentrumpf.

### Klassenoptionen

| Option | Wirkung |
|---|---|
| *(keine)* | Deckblatt + jede Aufgabe auf eigener Seite, **jede Seite vertikal zentriert** |
| `ohnedeckblatt` | kein Deckblatt |
| `aufgabenoben` | Inhalt oben auf der Seite statt vertikal zentriert |
| `loesung` | Lösungsvorschlag: alle Lösungen sichtbar (Kapitel 11) |

**Warum vertikal zentriert?** Das Blatt wird digital bearbeitet (z. B.
GoodNotes am iPad): Unter jede Seite wird ein leeres Blatt zum Rechnen
eingefügt. Steht der Inhalt in der Seitenmitte, muss man beim Arbeiten nicht
weit nach oben scrollen. Die Zentrierung gilt für **jede** Seite: Deckblatt,
Aufgaben, Seiten nach `\neueseite`, Seiten, auf die eine lange Aufgabe
überläuft, und alle Seiten des Lösungsvorschlags. Du musst dafür nichts tun;
nie selbst `\vfill`, `\vspace` oder `\vspace*{\fill}` einfügen.

Beispiel: `\documentclass[ohnedeckblatt,aufgabenoben]{uebungsblatt}`

---

## 4. Präambel: Angaben zum Blatt

Alle Angaben stehen **vor** `\begin{document}`. Nur `\fach` ist Pflicht.
Übungsblätter haben keine Nummer. Kopfzeile („OhmTools Lernhelfer“, rechts
„Übungsblatt“ mit „Angabe“ bzw. „Lösung“), Fußzeile (Fach und „Seite x /
y“) und auf dem Deckblatt „Auf einen Blick“ mit dem Zeitpunkt der Erstellung
setzt die Klasse selbst.

| Befehl | Bedeutung | Erscheint in |
|---|---|---|
| `\fach{Text}` | Fach / Titel des Blatts | Deckblatt (groß), Fußzeile |
| `\bearbeitungszeit{90 min}` | optional | Deckblatt („Auf einen Blick“) |
| `\hilfsmittel{Text}` | optional | Deckblatt („Auf einen Blick“) |
| `\hinweis{Text}` | beliebig oft, je ein Punkt unter „Hinweise“ | Deckblatt |

---

## 5. Aufgaben und Punkte

### `aufgabe` – eine Aufgabe

```latex
\begin{aufgabe}{Titel}          % Punkte = Summe der \teil-Punkte
...
\end{aufgabe}

\begin{aufgabe}[6]{Titel}       % Punkte fest vorgeben
...
\end{aufgabe}
```

* Beginnt **immer auf einer neuen Seite**; der Inhalt steht vertikal in
  der Seitenmitte (Option `aufgabenoben` ändert das).
* Passt eine Aufgabe nicht auf eine Seite, läuft sie auf die nächste über;
  auch diese Seite ist vertikal zentriert. Besser ist ein gezielter Umbruch
  mit `\neueseite` an einer sinnvollen Stelle (z. B. vor einem zweiten
  Codeblock), damit beide Seiten übersichtlich bleiben.
* Nummer, Titel und Punktzahl werden im Aufgabenkopf gesetzt, Titel und
  Punkte zusätzlich in die Liste auf dem Deckblatt.
* Der Titel ist kurz (1–4 Wörter) und nennt das Thema, nicht die Frage:
  „RC-Tiefpass“, nicht „Berechnen Sie den Tiefpass“.
* `[Punkte]` nur verwenden, wenn die Aufgabe **keine** `\teil`-Punkte hat
  (z. B. eine reine Zuordnungsaufgabe). Stimmen vorgegebene Punkte und
  Summe der Teilaufgaben nicht überein, gibt es eine Warnung.
* Halbe Punkte sind erlaubt: `\teil{1.5}`.
* Wird eine Aufgabe länger als eine Seite, bricht sie automatisch um. Für
  einen gezielten Umbruch innerhalb einer Aufgabe: `\neueseite`.

### `teilaufgaben` und `\teil{Punkte}`

```latex
\begin{teilaufgaben}
  \teil{3} Berechnen Sie den Gesamtwiderstand $R_\mathrm{ges}$.
  \teil{2} Bestimmen Sie den Strom $I_1$.
\end{teilaufgaben}
```

* Erzeugt a, b, c, … mit den Punkten am rechten Rand, die Teilaufgaben
  durch Linien getrennt.
* Der Text der Teilaufgabe folgt **direkt** nach `\teil{..}` (kein Argument).
* In einer Teilaufgabe dürfen weitere Bausteine stehen (z. B. `antworten`,
  `codeblock`, Abbildungen).
* Fortsetzen nach Unterbrechung (z. B. nach einem Codeblock):
  `\begin{teilaufgaben}[resume]` zählt mit c), d), … weiter.

### Inline-Punkte: `\punkte{2}`

Setzt „(2 P)“ im Stil der Vorlage in den Fließtext, z. B. „\punkte{1} je
richtiger Zuordnung“. Zählt **nicht** zur Summe (nur Anzeige).

---

## 6. Textbausteine

### `gegeben` mit `\wert[..]{..}` und `\gesucht{..}`

```latex
\begin{gegeben}
  \wert[Quellenspannung]{U_0 = \qty{12}{V}}
  \wert[Vorwiderstand]{R_1 = \qty{100}{\ohm}}
  \wert[Kapazität]{C = \qty{4.7}{\micro F}}
  \gesucht{R_\mathrm{ges},\; I_1,\; U_2}
\end{gegeben}
```

* Wird eine Tabelle „Symbol | Bedeutung | Wert“, darunter die Zeile
  „Gesucht“.
* `[Bedeutung]` ist ein kurzer Text (1–4 Wörter). Gib sie immer an; fehlt sie
  bei allen Werten, hat die Tabelle nur „Symbol“ und „Wert“.
* Das Pflichtargument ist **automatisch Mathematik**: **keine** `$…$`
  hineinschreiben. Links vom ersten `=` steht das Symbol, rechts der Wert.
* `\gesucht` ist optional und steht am Ende von `gegeben`.

### `hinweisbox` – Hinweis, Formel, Definition

```latex
\begin{hinweisbox}                  % Überschrift „Hinweis“
  Nutzen Sie die Spannungsteilerregel.
\end{hinweisbox}

\begin{hinweisbox}[Stromteilerregel] % eigene Überschrift
  $I_2 = I_1 \cdot \dfrac{R_3}{R_2 + R_3}$
\end{hinweisbox}
```

### `nebeneinander` – zwei Spalten

```latex
\begin{nebeneinander}[0.55]     % Anteil der linken Spalte (Standard 0.5)
  linker Inhalt (z. B. teilaufgaben)
\spalte
  rechter Inhalt (z. B. schaltung)
\end{nebeneinander}
```

* Typisch: Teilaufgaben links, Schaltbild rechts; oder Tabelle neben
  KV-Diagramm.
* **Kein `codeblock` innerhalb von `nebeneinander`** (Code braucht
  wörtlichen Text; das funktioniert dort nicht).
* `\spalte` genau einmal verwenden.

---

## 7. Abbildungen

Gemeinsame Regeln für alle Abbildungs-Bausteine:

* Das **letzte Pflichtargument ist die Bildunterschrift**. Sie wird
  automatisch als „**Abb. n** …“ gesetzt. Leeres Argument `{}` = keine
  Unterschrift (und keine Nummer).
* Verweis: `\label{abb:name}` **in** die Bildunterschrift schreiben und im
  Text `Abb.~\ref{abb:name}` verwenden.
* Das optionale Argument `[..]` reicht Optionen an TikZ / circuitikz /
  pgfplots durch.
* Abbildungen sind immer zentriert. Nicht zusätzlich `center` verwenden.
* Für Hervorhebungen in Zeichnungen gibt es fertige Stile (siehe
  `zeichnung`): **keine eigenen Farben** verwenden.

### `abbildung` – Rahmen für beliebigen Inhalt

```latex
\begin{abbildung}{KV-Diagramm von $f$}
  \kvdiagramm{A,B,C,D}{0,2,8,10}
\end{abbildung}
```

Für alles, was keine eigene Umgebung hat (z. B. `\kvdiagramm`,
`\register`, zwei Bilder nebeneinander).

### `\bild[Breitenanteil]{Datei}{Unterschrift}` – Rastergrafik/PDF

```latex
\bild[0.6]{material/oszi.png}{Oszilloskopbild der Messspannung}
```

`Breitenanteil` = Anteil der Textbreite (Standard `0.6`). Dateiformate:
PNG, JPG, PDF.

### `zeichnung` – freie TikZ-Zeichnung

```latex
\begin{zeichnung}{Aufbau des Plattenkondensators}
  \fill[ohmForeground] (0,0) rectangle (0.15,3);
  \draw[->, akzent] (0.3,1.5) -- (2.8,1.5);
  \draw[<->] (0.15,-0.4) -- node[below] {$d$} (3,-0.4);
\end{zeichnung}
```

Für Zeigerdiagramme, Geometrie, physikalische Aufbauten. Normale
TikZ-Syntax. Einheit: 1 = 1 cm. Pfeilspitzen sind voreingestellt.

**Fertige TikZ-Stile** (in allen Zeichnungsumgebungen nutzbar):

| Stil | Verwendung |
|---|---|
| `akzent` | kräftige schwarze Linie, z. B. Feldlinien: `\draw[->, akzent] …` |
| `markiert` | hervorgehobener Knoten/Block (kräftiger Rahmen, graue Füllung) |
| `hilfslinie` | dünne gestrichelte graue Hilfslinie (Maßlinien, Projektionen) |
| `block` | Rechteck für Blockdiagramme |
| `summe` | Summationsstelle (Kreis) |
| `verzweigung` | Verzweigungspunkt (gefüllter Punkt) |
| `knoten` | Kreisknoten für Graphen |
| `gewicht` | Kantengewicht (kleine Schrift, weißer Hintergrund) |

Farbnamen, falls ausnahmsweise nötig (z. B. Füllung): `ohmForeground`
(Schwarz), `ohmMutedForeground` (Grau), `ohmMuted` (helles Grau für
Flächen), `ohmBorder` (helles Grau für Linien). Keine anderen Farben, nie
Farbwerte und nie Rot in der Angabe; Lösungen zeichnest du mit den Stilen aus
Kapitel 11.

### Weitere Abbildungen

Diese Bausteine stehen in eigenen Dateien neben dieser Anleitung. Lies eine
nur, wenn dein Blatt einen ihrer Bausteine braucht (Kapitel 12):

| Datei | Bausteine |
|---|---|
| `ANLEITUNG-schaltungen.md` | `schaltung`: Schaltbilder mit Zweipolen, Messgeräten, Operationsverstärkern, Transistoren, Transformator und Logikgattern |
| `ANLEITUNG-digitaltechnik.md` | `zeitdiagramm`, `automat`, `\kvdiagramm`, `\register` |
| `ANLEITUNG-code.md` | `codeblock`, `\codedatei`, `\code`, `\codetext` (Kapitel 8) |

### `diagramm` – Funktionsgraphen, Kennlinien, Messkurven (pgfplots)

```latex
\begin{diagramm}[xmin=0, xmax=6, ymin=0, ymax=0.45, domain=0:6,
                 xlabel={$x$}, ylabel={$f(x)$}]
                {Graph von $f$}
  \addplot {x*exp(-x)};
  \addplot coordinates {(0,0) (1,0.2) (2,0.3)};   % Messpunkte
\end{diagramm}
```

* Optionen im ersten Argument sind normale pgfplots-Achsenoptionen:
  `xmin, xmax, ymin, ymax, domain, samples, xlabel, ylabel, xtick, ytick,
  height, width`.
* Logarithmische Achsen (Bode-Diagramm): `xmode=log` (bzw. `ymode=log`).
* Achsenbeschriftung mit Einheit: `xlabel={$f$ in \unit{Hz}}`.
* Kurven sind schwarz; mehrere bekommen automatisch eigene Stricharten
  (durchgezogen, gestrichelt, gepunktet). Keine Legende: Beschrifte jede
  Kurve an der Kurve, z. B.
  `\addplot {..} node[pos=0.8, above] {$U_1$};`.
* pgfplots-Funktionen: `sin(deg(x))` (Winkel in Grad!), `exp(x)`, `ln(x)`,
  `log10(x)`, `sqrt(x)`, `abs(x)`, `x^2`.
* Zahlen an den Achsen erscheinen automatisch mit Dezimalkomma.

### `koordinatensystem` – leeres Achsenkreuz zum Einzeichnen

```latex
\begin{koordinatensystem}[xmin=-1, xmax=6, ymin=-1, ymax=2,
                          xlabel={$t$ in \unit{ms}}, ylabel={$u$ in \unit{V}}]
                         {}
\end{koordinatensystem}
```

Achsen mit Pfeilen durch den Ursprung auf Millimeterpapier (jede fünfte
Linie kräftiger). Für „Skizzieren Sie …“-Aufgaben. Es darf auch ein gegebener
Graph hinein (`\addplot`).

### `blockdiagramm` – Regelkreise, Signalflusspläne

```latex
\begin{blockdiagramm}{Standardregelkreis}
  \node[coordinate]          (w) {};
  \node[summe, right=of w]   (s) {};
  \node[block, right=of s]   (k) {$K$};
  \node[block, right=of k]   (g) {$G(s)$};
  \node[coordinate, right=20mm of g] (y) {};
  \draw (w) -- node[above] {$W(s)$} (s);
  \draw (s) -- node[above] {$E(s)$} (k);
  \draw (k) -- (g);
  \draw (g) -- node[verzweigung, pos=0.35] (v) {} node[above, pos=0.75] {$Y(s)$} (y);
  \draw (v) -- ++(0,-14mm) -| node[pos=0.95, right] {$-$} (s);
\end{blockdiagramm}
```

* Alle Linien bekommen automatisch eine Pfeilspitze am Ende.
* Positionieren mit `right=of x`, `below=of x`, `right=20mm of x`.
* Stile: `block`, `summe`, `verzweigung`, `coordinate` (unsichtbarer Punkt).

### `knotengraph` – Graphen (Netze, kürzeste Wege, Bäume)

```latex
\begin{knotengraph}{Gewichteter Graph}
  \node[knoten, markiert] (A) {A};
  \node[knoten, right=of A] (B) {B};
  \node[knoten, below=of A] (C) {C};
  \draw (A) -- node[gewicht] {4} (B);
  \draw (A) -- node[gewicht] {2} (C);
  \draw[->] (C) -- node[gewicht] {1} (B);   % gerichtete Kante
\end{knotengraph}
```

### `tabelle` – Wertetabellen, Wahrheitstabellen, Datenblattwerte

```latex
\begin{tabelle}{ccc@{\hspace{8mm}}c}{Wahrheitstabelle von $Y$}
  $A$ & $B$ & $C$ & $Y$ \\ \trennlinie
  0 & 0 & 0 & 1 \\
  0 & 0 & 1 & 0 \\
\end{tabelle}
```

* 1. Argument: Spaltenformat wie bei `tabular` (`l`, `c`, `r`,
  `p{3cm}`). **Keine senkrechten Striche `|`.** Einen Abstand vor der
  Ergebnisspalte erzeugt `@{\hspace{8mm}}`.
* 2. Argument: Unterschrift („Tab. n: …“), `{}` = keine.
* Linie unten automatisch; `\trennlinie` unter der Kopfzeile.
* Keine Tabellen mit leeren Zellen zum Ausfüllen.

---

## 8. Code

Quelltext, Code aus Dateien und Code im Fließtext beschreibt
`ANLEITUNG-code.md`. Lies sie, wenn dein Blatt Code enthält.

---

## 9. Antwortformate

### `antworten` – Multiple Choice / Single Choice

```latex
\begin{teilaufgaben}
  \teil{2} Welche Bauelemente sind aktive Bauelemente?
    \begin{antworten}[spalten=2]
      \antwort*{Bipolartransistor}
      \antwort{Kondensator}
      \antwort*{Operationsverstärker}
      \antwort{Ohmscher Widerstand}
    \end{antworten}
  \teil{1} Welchen Wert hat \codetext{eax}?
    \begin{antworten}[spalten=4, typ=einfach]
      \antwort{8} \antwort*{11} \antwort{14} \antwort{6}
    \end{antworten}
\end{teilaufgaben}
```

* Optionen (Schlüssel=Wert):
  `typ=mehrfach` (Standard; eckige Kästchen, mehrere Antworten möglich),
  `typ=einfach` (Kreise, genau eine Antwort richtig);
  `spalten=n` (Standard 1; Antworten füllen die Zeilen von links nach rechts).
* **`\antwort*{..}` kennzeichnet eine richtige Antwort.** Im Aufgabenblatt
  sieht sie aus wie jede andere; im Lösungsvorschlag ist sie angekreuzt.
  Immer alle richtigen Antworten mit `*` kennzeichnen.
* Punkte über das umgebende `\teil{..}` vergeben.
* Im Fragetext angeben, ob Einfach- oder Mehrfachauswahl gilt.
* 3–5 plausible Antwortmöglichkeiten; die richtige Antwort nicht immer an
  dieselbe Stelle setzen.
* In `\antwort{..}` Code nur mit `\codetext{..}`.

### `ankreuzen` – Richtig/Falsch-Tabelle

```latex
\begin{ankreuzen}[1]        % Punkte je Aussage (Standard 1)
  \aussage[r]{Eine ideale Diode hat in Durchlassrichtung den Widerstand $\qty{0}{\ohm}$.}
  \aussage[f]{Doppelter Plattenabstand verdoppelt die Kapazität.}
\end{ankreuzen}
```

* **`[r]` = Aussage ist richtig, `[f]` = falsch.** Die Markierung erscheint
  nur im Lösungsvorschlag. Immer angeben.
* Die Punkte (Anzahl Aussagen × Punkte je Aussage) werden automatisch zur
  Aufgabe addiert.
* Steht direkt in der Aufgabe, **nicht** innerhalb von `teilaufgaben`.
* Aussagen eindeutig richtig oder falsch formulieren; Mischung aus beiden.

### `zuordnung` – Elemente durch Linien verbinden

```latex
\begin{aufgabe}[5]{Kommunikationsnetze}
Ordnen Sie jeder Schicht ein Protokoll zu. \punkte{1} je richtiger Zuordnung.
\begin{zuordnung}[OSI-Schicht][Protokoll]
  \paar[3]{Bitübertragungsschicht}{TCP}
  \paar[1]{Vermittlungsschicht}{Manchester-Kodierung}
  \paar[2]{Transportschicht}{IP}
\end{zuordnung}
\end{aufgabe}
```

* `\paar[k]{links}{rechts}` setzt eine Zeile. **Die rechte Spalte selbst
  mischen** (nicht die richtige Zuordnung in dieselbe Zeile schreiben).
* `[k]` ist die Lösung: Der linke Eintrag dieser Zeile gehört zum
  **rechten Eintrag in Zeile k**. Im obigen Beispiel gehört
  „Bitübertragungsschicht“ (Zeile 1) zu „Manchester-Kodierung“ (Zeile 3).
  Im Lösungsvorschlag werden daraus Verbindungslinien.
* Die beiden optionalen Argumente sind Spaltenüberschriften (dürfen
  fehlen).
* Punkte über `\begin{aufgabe}[n]` oder ein umgebendes `\teil{n}`.

### Einzelne Symbole

`\kaestchen` (Ankreuzkästchen) und `\kreis` (Auswahlkreis) für Sonderfälle
im Text.

---

## 10. Notation und Zahlen

| Befehl | Ergebnis | Hinweis |
|---|---|---|
| `\qty{4.7}{k\ohm}` | 4,7 kΩ | Größe mit Einheit (siunitx) |
| `\qty{8.854e-12}{F/m}` | 8,854 · 10⁻¹² F/m | Exponent mit `e` |
| `\num{1.5}` | 1,5 | Zahl ohne Einheit |
| `\unit{mA}` | mA | nur Einheit (z. B. Achsenbeschriftung) |
| `\ohm`, `\micro`, `\degreeCelsius` | Ω, µ, °C | in `\qty`/`\unit` |
| `$\kx{U}$` | U unterstrichen | komplexe Größe (DIN 1304) |
| `$\jj$` | j (aufrecht) | imaginäre Einheit |
| `$\ee^{-t/\tau}$` | e (aufrecht) | Eulersche Zahl |
| `$\int f(x) \dd x$` | d (aufrecht, richtiger Abstand) | Differential |
| `\basis{1011}{2}`, `\basis{3F}{16}` | 1011₂, 3F₁₆ | Zahl mit Basis, in Text und Mathe |
| `$\laplace{f(t)}$` | ℒ{f(t)} | Laplace-Transformation |
| `$\laplaceinv{F(s)}$` | ℒ⁻¹{F(s)} | Rücktransformation |
| `\punkte{2}` | (2 P) | Punkteanzeige im Text |

Weitere Mathematik mit amsmath wie gewohnt (`\dfrac`, `align*`,
`pmatrix`, `\begin{cases}`). Abgesetzte Formeln mit `\[ … \]`.

Einheiten in siunitx: Präfix + Einheit, z. B. `k\ohm`, `\micro F` oder
`uF`, `nF`, `mA`, `kHz`, `ms`, `dB`, `V/m`, `cm^2`.

---

## 11. Lösungsvorschlag

Aufgaben und Lösungen stehen **in derselben Datei**. Ob die Lösungen
erscheinen, entscheidet allein die Klassenoption `loesung` beim Übersetzen.
Daraus entstehen zwei PDFs:

| PDF | Klassenoption | Lösungen |
|---|---|---|
| Aufgabenblatt `blatt.pdf` | keine | ausgeblendet |
| Lösungsvorschlag `blatt-loesung.pdf` | `loesung` | sichtbar |

`sh build.sh blatt` erzeugt beide auf einmal und setzt die Option selbst,
ohne die Datei zu ändern. Datum und Uhrzeit auf dem Deckblatt sind dabei in
beiden PDFs gleich, in deutscher Zeit. Von Hand (z. B. in Overleaf) schaltest du die
Lösungen mit `\documentclass[loesung]{uebungsblatt}` ein und mit
`\documentclass{uebungsblatt}` wieder aus.

Ausgeblendete Lösungen nehmen **keinen Platz** ein: Das Aufgabenblatt sieht
Pixel für Pixel genauso aus, als stünden sie nicht in der Datei.

Im Lösungsvorschlag ändert sich automatisch: Die Kopfzeile trägt das rote
„Lösung“ statt „Angabe“, alle Seiten bleiben vertikal zentriert, und alles,
was die Lösung hinzufügt, ist rot: das Etikett „Lösung“, Endergebnisse,
Teilpunkte, Kreuze, Linien und Kurven in Abbildungen. Die Angabe selbst
bleibt schwarz.

### `loesung` – die Lösung

```latex
\begin{teilaufgaben}
  \teil{2} Berechnen Sie den Strom $I_1$.
    \begin{loesung}
      Ohmsches Gesetz:
      \[ I_1 = \frac{U_0}{R_\mathrm{ges}} = \frac{\qty{12}{V}}{\qty{220}{\ohm}}
             = \ergebnis{\qty{54.5}{mA}} \teilpunkt{2} \]
    \end{loesung}
  \teil{3} ...
\end{teilaufgaben}
```

* Beginnt mit dem roten Etikett „Lösung“, der Text steht rechts daneben
  und fluchtet in allen weiteren Zeilen. Im Aufgabenblatt komplett
  unsichtbar (auch kein Leerraum).
* Optionale fette Überschrift nach dem Etikett:
  `\begin{loesung}[Bewertungsschema]`, `[Lösungsweg]`, `[Typische Fehler]`,
  `[Begründung]`.
* **Platzierung:** direkt hinter dem Text einer Teilaufgabe (innerhalb von
  `teilaufgaben`, empfohlen) oder als eine Lösung am Ende der Aufgabe für
  alle Teilaufgaben (dann mit **a)**, **b)** … gliedern).
* Innerhalb der Lösung ist alles erlaubt: Text, Formeln, `align*`,
  `codeblock`, `tabelle`, Abbildungen.
* Abbildungen und Tabellen in einer Lösung bekommen **keine Nummer**, damit
  die Nummerierung im Aufgabenblatt und im Lösungsvorschlag gleich bleibt.
* Die Lösung nicht mit einer abgesetzten Formel (`\[`, `align*`) beginnen,
  sondern mit einem kurzen Satz (sonst entsteht oben eine Leerzeile).
* `\end{loesung}` muss allein in einer Zeile stehen (Einrückung erlaubt).
* Eine Lösung wird nie geteilt: Passt sie nicht mehr auf die Seite, beginnt sie
  auf der nächsten. Eine einzelne Lösung darf deshalb **höchstens etwa eine
  halbe bis ganze Seite** lang sein. Längere Lösungen auf mehrere `loesung`
  aufteilen (z. B. eine pro Teilaufgabe).
* **Nicht** innerhalb von `nebeneinander` und nicht in Argumenten anderer
  Befehle. Dann die Lösung hinter `nebeneinander` setzen.

### `\ergebnis{..}` – Endergebnis hervorheben

`\ergebnis{\qty{54.5}{mA}}` setzt das Ergebnis fett und rot (ersetzt das
doppelte Unterstreichen). Das Argument ist **Mathematik** (wie bei `\wert`). Geht im
Fließtext und in Formeln: `$I = \ergebnis{\qty{2}{A}}$`,
`\[ f = \ergebnis{\overline{B}\,\overline{D} + BD} \]`. Pro Rechenweg das
Endergebnis (bzw. jedes Endergebnis) hervorheben, keine Zwischenergebnisse.

### `\teilpunkt{n}` – Bewertungsschema

Setzt „n P“ rechtsbündig ans **Ende der aktuellen Zeile**:

* im Text: `Ansatz über den Spannungsteiler. \teilpunkt{1}` (beendet den
  Absatz, danach beginnt automatisch eine neue Zeile; **kein `\\`
  danach**),
* in einer abgesetzten Formel `\[ … \teilpunkt{2} \]` oder in einer Zeile von
  `align*` (`… \teilpunkt{1} \\`).

Die Teilpunkte einer Teilaufgabe sollen zusammen deren Punkte aus
`\teil{n}` ergeben (das prüft die Klasse nicht). Sie zählen nicht zur
Gesamtpunktzahl.

### Lösungen in Abbildungen

**`\nurloesung{..}`** fügt Inhalt nur im Lösungsvorschlag ein,
**`\nuraufgabe{..}`** nur im Aufgabenblatt. Damit lassen sich Lösungen
direkt in die Abbildung der Aufgabe zeichnen, mit diesen Stilen:

| Stil | Verwendung |
|---|---|
| `loesung` | eingezeichnete Kurve, Linie, Pfeil oder Text (rot, kräftig) |
| `loesung hilfslinie` | gestrichelte rote Hilfslinie, z. B. zum Ablesen |
| `loesung punkt=below:{..}` | roter Punkt mit Beschriftung daneben (wie `label=`) |

```latex
\begin{koordinatensystem}[xmin=0, xmax=6, ymin=-0.4, ymax=1.2]{}
  \nurloesung{\addplot[loesung, domain=0:6] {(1-x)*exp(-x)};
    \draw[loesung hilfslinie] (axis cs:2,0) -- (axis cs:2,-0.135);
    \node[loesung punkt=below:{Minimum}] at (axis cs:2,-0.135) {};}
\end{koordinatensystem}

\begin{schaltung}{Netzwerk}
  \draw (0,0) to[R, l=$R_1$] (3,0);
  \nurloesung{\draw[->, loesung] (0.6,0.7) -- node[above] {$U_1$} (2.4,0.7);}
\end{schaltung}

\begin{knotengraph}{Graph}
  ... Knoten ...
  \nurloesung{\draw[loesung, line width=3pt, opacity=0.35] (A) -- (C) -- (B);}
  ... Kanten ...
\end{knotengraph}
```

* Geht in `schaltung`, `zeichnung`, `diagramm`, `koordinatensystem`,
  `blockdiagramm`, `automat`, `knotengraph` und im Text. Für `zeitdiagramm`
  und `\kvdiagramm` siehe `ANLEITUNG-digitaltechnik.md`.

### Antwortformate

| Format | Lösung angeben mit |
|---|---|
| `antworten` | `\antwort*{..}` für jede richtige Antwort |
| `ankreuzen` | `\aussage[r]{..}` bzw. `\aussage[f]{..}` |
| `zuordnung` | `\paar[k]{..}{..}` (k = Zeile des passenden rechten Eintrags) |

Zusätzlich kann eine `loesung` eine Begründung enthalten.

### Für Sonderfälle: `\ifloesung`

`\ifloesung … \else … \fi` ist eine normale TeX-Bedingung, z. B. für
einen anderen Satz im Aufgabentext. In den allermeisten Fällen reichen
`loesung`, `\nurloesung` und `\nuraufgabe`.

### Anforderungen an einen guten Lösungsvorschlag

* Zu **jeder** Teilaufgabe eine Lösung, auch zu Multiple-Choice-Fragen
  (Sterne setzen) und Zeichenaufgaben (Lösung einzeichnen).
* Rechenweg nachvollziehbar: Ansatz → Formel → eingesetzte Werte mit
  Einheiten → Ergebnis mit `\ergebnis`.
* Bewertungsschema mit `\teilpunkt`, Summe = Punkte der Teilaufgabe.
* Alle Zahlen vorher nachrechnen; sinnvoll runden (3 gültige Ziffern).
* Bei Verständnisfragen kurze Begründung; bei falschen Aussagen sagen,
  was stattdessen gilt.

---

## 12. Welcher Baustein für welchen Inhalt?

| Inhalt | Baustein | Steht in |
|---|---|---|
| Gegebene Größen und gesuchte Größen | `gegeben` + `\wert` + `\gesucht` | hier |
| Formel, Tipp, Definition | `hinweisbox` | hier |
| Gleichstrom-/Wechselstromschaltung, OPV, Transistor | `schaltung` | `ANLEITUNG-schaltungen.md` |
| Logikgatter-Schaltung | `schaltung` mit `and port` usw. | `ANLEITUNG-schaltungen.md` |
| Funktion, Kennlinie, Bode-Diagramm, Messkurve | `diagramm` | hier |
| „Skizzieren Sie …“ | `koordinatensystem` (leer) | hier |
| Takt-/Signalverläufe, Flipflops, Bus-Timing | `zeitdiagramm` | `ANLEITUNG-digitaltechnik.md` |
| KV-Diagramm (gegeben oder leer) | `\kvdiagramm` in `abbildung` | `ANLEITUNG-digitaltechnik.md` |
| Wahrheitstabelle, Wertetabelle | `tabelle` | hier |
| Zustandsautomat, Moore/Mealy | `automat` | `ANLEITUNG-digitaltechnik.md` |
| Regelkreis, Signalflussplan | `blockdiagramm` | hier |
| Graph, Netzwerk, kürzester Weg, Baum | `knotengraph` | hier |
| Registerbelegung | `\register` in `abbildung` | `ANLEITUNG-digitaltechnik.md` |
| Physikalischer Aufbau, Zeigerdiagramm, Geometrie | `zeichnung` | hier |
| Foto, Screenshot, Oszilloskopbild | `\bild` | hier |
| Programmcode | `codeblock` / `\codedatei` | `ANLEITUNG-code.md` |
| Pseudocode, Konsolenausgabe | `codeblock` mit `{text}` | `ANLEITUNG-code.md` |
| Einfach-/Mehrfachauswahl | `antworten` | hier |
| Richtig/Falsch-Aussagen | `ankreuzen` | hier |
| Begriffe zuordnen | `zuordnung` | hier |
| Text neben Abbildung | `nebeneinander` | hier |
| Lösung einer (Teil-)Aufgabe | `loesung` (+ `\ergebnis`, `\teilpunkt`) | hier |
| Lösung in eine Abbildung zeichnen | `\nurloesung{..}` mit Stil `loesung` | hier |

---

## 13. Häufige Fehler

| Problem | Ursache / Lösung |
|---|---|
| Deckblatt zeigt „??“ | Noch einmal kompilieren (bzw. latexmk benutzen). |
| Warnung „Aufgabe n hat 0 Punkte“ | Weder `\teil{..}` noch `[Punkte]` noch `ankreuzen` in der Aufgabe. |
| Warnung „vorgegebene Punkte passen nicht …“ | `[Punkte]` bei `aufgabe` widerspricht der Summe der `\teil`-Punkte; `[..]` entfernen. |
| „Missing $ inserted“ bei `\wert` | `$…$` in `\wert{..}` geschrieben: weglassen, das Argument ist schon Mathe. |
| Sinus in pgfplots falsch | pgfplots rechnet in Grad: `sin(deg(x))`. |
| Ω erscheint falsch | Immer `\ohm` (in `\qty`/`\unit`), nie `$\Omega$`. |
| `\spalte` Fehler | `\spalte` nur innerhalb von `nebeneinander`, genau einmal. |
| „There's no line here to end“ | `\\` direkt nach `\teilpunkt`: weglassen, `\teilpunkt` beendet die Zeile selbst. |
| Lösung erscheint im Aufgabenblatt | Lösung nicht in `loesung` bzw. `\nurloesung` gesetzt. |
| Aufgabenblatt endet plötzlich / Text fehlt | `\end{loesung}` fehlt oder steht nicht allein in seiner Zeile. |
| Lösung ragt unten aus der Seite | Lösung länger als eine Seite: auf mehrere `loesung` aufteilen. |
| Leerzeile neben dem Etikett „Lösung“ | Lösung beginnt mit `\[` oder `align*`: einen kurzen Satz davor schreiben. |

---

## 14. Checkliste vor der Abgabe

- [ ] Jede Aufgabe in `\begin{aufgabe}{Titel} … \end{aufgabe}`, kurzer Titel.
- [ ] Jede Aufgabe hat Punkte; Teilaufgaben mit `\teil{n}`.
- [ ] Alle Größen mit `\qty{..}{..}`, Variablen in `$…$`.
- [ ] Keine eigenen Farben, Größen, Abstände, `\newpage`, `figure`, `table`.
- [ ] Keine Lösungsfelder; Lösungen nur in `loesung`, `\nurloesung` und
      den Markierungen `\antwort*`, `\aussage[r/f]`, `\paar[k]`.
- [ ] Zu jeder Teilaufgabe eine Lösung mit `\ergebnis` und `\teilpunkt`;
      Teilpunkte ergeben die Punkte der Teilaufgabe.
- [ ] Beide PDFs erzeugt und angesehen: Aufgabenblatt ohne jede Lösung,
      Lösungsvorschlag vollständig.
- [ ] Abbildungen mit sinnvoller Unterschrift; Verweise per `\label`/`\ref`.
- [ ] Zweimal kompiliert (`build.sh` oder latexmk): Deckblatt zeigt Gesamtpunkte, keine „??“.
- [ ] Log ohne Fehler; Warnungen der Klasse `uebungsblatt` beachtet.
