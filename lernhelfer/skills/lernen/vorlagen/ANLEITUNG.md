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
| `uebungsblatt.tex` | Leeres Grundgerüst zum Kopieren. |
| `build.sh` | Übersetzt ein Blatt zu zwei PDFs: Aufgabenblatt und Lösungsvorschlag (Kapitel 11). |
| `beispiel.tex` | Vollständiges Beispiel mit Lösungen, das **jeden** Baustein benutzt. Bei Unklarheiten dort nachsehen. |
| `material/` | Beispieldateien (Bild, C-Datei) für `\bild` und `\codedatei`. |

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
booktabs, mathastext, microtype. Schrift: IBM Plex (Paket `plex`); fehlt es,
wird automatisch Helvetica benutzt.

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
\blatt{04}
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

| Befehl | Bedeutung | Erscheint in |
|---|---|---|
| `\fach{Text}` | Fach / Titel des Blatts | Deckblatt (groß), Kopf- und Fußzeile |
| `\blatt{07}` | Nummer des Übungsblatts | „Übungsblatt 07“ in Kopf/Fuß/Deckblatt |
| `\untertitel{Text}` | Untertitel (Standard: „Übungsblatt 07 zur Prüfungsvorbereitung“) | Deckblatt |
| `\kopfzusatz{Text}` | rechts oben auf dem Deckblatt (Standard: „Prüfungsvorbereitung“) | Deckblatt |
| `\bearbeitungszeit{90 min}` | optional | Deckblatt |
| `\hilfsmittel{Text}` | optional, erscheint als erster Hinweis | Deckblatt |
| `\hinweis{Text}` | beliebig oft, je ein Punkt in der Hinweisliste | Deckblatt |
| `\akzentfarbe{0F7B6C}` | Akzentfarbe als HTML-Hex ohne `#` (Standard `2450B8`, Blau) | überall |

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

* Erzeugt a), b), c), … mit den Punkten am rechten Rand.
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

### `gegeben` mit `\wert{..}` und `\gesucht{..}`

```latex
\begin{gegeben}
  \wert{U_0 = \qty{12}{V}}
  \wert{R_1 = \qty{100}{\ohm}}
  \wert{C = \qty{4.7}{\micro F}}
  \gesucht{R_\mathrm{ges},\; I_1,\; U_2}
\end{gegeben}
```

* Graue Box mit der Überschrift GEGEBEN; die Werte fließen nebeneinander.
* Das Argument von `\wert` und `\gesucht` ist **automatisch Mathematik**:
  **keine** `$…$` hineinschreiben. Text in Mathe mit `\text{..}`.
* `\gesucht` ist optional und steht am Ende der Box.

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
  automatisch als „Abb. n: …“ gesetzt. Leeres Argument `{}` = keine
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
  \fill[ubtinte] (0,0) rectangle (0.15,3);
  \draw[->, akzent] (0.3,1.5) -- (2.8,1.5);
  \draw[<->] (0.15,-0.4) -- node[below] {$d$} (3,-0.4);
\end{zeichnung}
```

Für Zeigerdiagramme, Geometrie, physikalische Aufbauten. Normale
TikZ-Syntax. Einheit: 1 = 1 cm. Pfeilspitzen sind voreingestellt.

**Fertige TikZ-Stile** (in allen Zeichnungsumgebungen nutzbar):

| Stil | Verwendung |
|---|---|
| `akzent` | Linie/Text in Akzentfarbe, z. B. Feldlinien: `\draw[->, akzent] …` |
| `markiert` | hervorgehobener Knoten/Block (Akzentrahmen, leichte Füllung) |
| `hilfslinie` | dünne gestrichelte graue Hilfslinie (Maßlinien, Projektionen) |
| `block` | Rechteck für Blockdiagramme |
| `summe` | Summationsstelle (Kreis) |
| `verzweigung` | Verzweigungspunkt (gefüllter Punkt) |
| `knoten` | Kreisknoten für Graphen |
| `gewicht` | Kantengewicht (kleine Schrift, weißer Hintergrund) |

Farbnamen, falls ausnahmsweise nötig (z. B. Füllung): `ubtinte` (Schwarz),
`ubgrau`, `ubakzent`, `ubteal`, `uborange`. Keine anderen Farben.

### `schaltung` – Schaltbilder (circuitikz)

```latex
\begin{schaltung}{Gleichstromnetzwerk}
  \draw (0,0) to[V, l=$U_0$] (0,3)
        to[R, l=$R_1$, i>^=$I_1$] (3,3) -- (5,3);
  \draw (3,3) to[R, l_=$R_2$, *-*] (3,0);
  \draw (5,3) to[C, l_=$C$] (5,0);
  \draw (0,0) -- (5,0);
\end{schaltung}
```

* Europäische Symbole (DIN/IEC) sind voreingestellt.
* Zweipole mit `to[..]`: `R` Widerstand, `C` Kondensator, `L` Spule,
  `V` Spannungsquelle, `I` Stromquelle, `battery1`, `D` Diode, `led`,
  `zD` Z-Diode, `vR` verstellbarer Widerstand, `lamp`, `fuse`,
  `nos`/`ncs` Schalter, `short` Leitung, `open` offene Klemmen.
* Beschriftungen: `l=` (Bauteilname), `l_=` (andere Seite), `v=` / `v^=`
  Spannungspfeil, `i=` / `i>_=` Strompfeil, `a=` Wert.
* Anschlüsse: `*-*` Knotenpunkte, `o-o` Klemmen, z. B. `to[R, o-*]`.
* Einpolige Symbole: `node[ground]{}`, `node[vcc]{$+\qty{5}{V}$}`.
* Dreipole: `node[op amp] (OP) {}` mit Anschlüssen `(OP.-)`, `(OP.+)`,
  `(OP.out)`; Transistoren `node[npn] (T) {}` mit `(T.B)`, `(T.C)`, `(T.E)`;
  `nmos`, `pmos`.
* **Logikgatter** (IEC-Rechteckform): `node[and port] (U) {}`,
  `or port`, `not port`, `nand port`, `nor port`, `xor port`;
  Eingänge `(U.in 1)`, `(U.in 2)`, Ausgang `(U.out)`. Siehe Aufgabe 3 in
  `beispiel.tex`.
* Soll etwas eingezeichnet werden (Zählpfeile, Ströme), das Schaltbild
  ohne diese Elemente zeichnen und in der Teilaufgabe dazu auffordern.

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
  legend pos, height, width`.
* Logarithmische Achsen (Bode-Diagramm): `xmode=log` (bzw. `ymode=log`).
* Achsenbeschriftung mit Einheit: `xlabel={$f$ in \unit{Hz}}`.
* Mehrere Kurven bekommen automatisch unterschiedliche Farben; Legende mit
  `\legend{$U_1$, $U_2$}`.
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

Achsen mit Pfeilen durch den Ursprung und feines Raster. Für „Skizzieren
Sie …“-Aufgaben. Es darf auch ein gegebener Graph hinein (`\addplot`).

### `zeitdiagramm` – Digitale Signalverläufe (tikz-timing)

```latex
\begin{zeitdiagramm}{Eingangssignale des D-Flipflops}
  CLK & L 8{C} \\
  D   & 2L 3H 2L 2H \\
  Q   & L 8S \\
\end{zeitdiagramm}
```

* Jede Zeile: `Name & Signalfolge \\`.
* Zeichen: `L` low, `H` high, `C` Taktflanke (wechselt jedes Mal),
  `Z` hochohmig, `X` undefiniert, `S` leer (nichts gezeichnet),
  `D{Text}` Datenwort/Bus (z. B. `2D{0x3F}`), `U` unbekannt.
* Eine Zahl davor = Länge in Zeiteinheiten: `3H` = 3 Einheiten high.
  `8{C}` = 8 Taktwechsel. **Alle Zeilen gleich lang machen.**
* Zum Einzeichnen lassen: Zeile mit `S` füllen (z. B. `Q & L 8S \\`).

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

### `automat` – Zustandsautomaten (Moore/Mealy, DEA)

```latex
\begin{automat}{Moore-Automat}
  \node[state, initial]                 (s0) {$S_0/0$};
  \node[state, right=of s0]             (s1) {$S_1/0$};
  \node[state, accepting, right=of s1]  (s2) {$S_2/1$};
  \path (s0) edge[loop above]   node {0} (s0)
             edge[bend left]    node {1} (s1)
        (s1) edge[bend left]    node {0} (s0)
             edge               node {1} (s2)
        (s2) edge[loop above]   node {1} (s2)
             edge[bend left=50] node {0} (s0);
\end{automat}
```

* `state` = Zustand, `initial` = Startpfeil, `accepting` = Endzustand
  (doppelter Rand).
* Übergänge mit `\path (a) edge[..] node {Beschriftung} (b);` –
  `loop above/below/left/right`, `bend left`, `bend right`, `bend left=50`.
* Mealy-Beschriftung: `node {$1/0$}`.

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

### `\kvdiagramm[Optionen]{Variablen}{Einsen}` – KV-Diagramm

```latex
\begin{abbildung}{KV-Diagramm von $f$}
  \kvdiagramm[dontcare={6}, indizes]{A,B,C,D}{0,2,5,7,8,10,13,15}
\end{abbildung}
```

* **Variablen**: 2, 3 oder 4, durch Kommas getrennt. Die erste Variable
  ist das höchstwertige Bit.
* **Einsen**: Minterm-Indizes, an denen die Funktion 1 ist. Index =
  Binärzahl der Variablen in der angegebenen Reihenfolge, z. B. bei
  `A,B,C,D`: A=1, B=0, C=1, D=1 → 1011₂ = 11.
* Alle übrigen Felder zeigen 0.
* Optionen:
  `dontcare={..}` Indizes mit beliebigem Wert (zeigt X),
  `indizes` kleine Minterm-Nummern in jedem Feld,
  `leer` keine Werte (zum Ausfüllen durch die Studierenden),
  `groesse=9mm` Feldgröße.
* Aufteilung: 2 Var. → Zeile A, Spalte B; 3 Var. → Zeile A, Spalten BC;
  4 Var. → Zeilen AB, Spalten CD (jeweils Gray-Code 00, 01, 11, 10).
* Ohne Unterschrift kann `\kvdiagramm` auch direkt im Text stehen; mit
  Unterschrift in `abbildung` einbetten.

### `\register[Optionen]{Name}{Bits}` – Registerbelegung (Mikrocontroller)

```latex
\begin{abbildung}{Register TCCR0B}
  \register{TCCR0B}{FOC0A,FOC0B,--,--,WGM02,CS02,CS01,CS00}
\end{abbildung}
```

* Bits vom höchstwertigen zum niederwertigsten angeben (links → rechts).
  Die Bitnummern stehen automatisch darüber.
* Unbenutzte Bits: `--`.
* Optionen: `breite=14mm` (Breite eines Bitfelds, Standard 12 mm; bei
  langen Namen erhöhen), `hoechstesbit=15` (Nummer des linken Bits, z. B.
  für die obere Hälfte eines 16-Bit-Registers).

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
* Linien oben und unten automatisch; `\trennlinie` unter der Kopfzeile.
* Keine Tabellen mit leeren Zellen zum Ausfüllen.

---

## 8. Code

### `codeblock` – Quelltext mit Syntaxhervorhebung

```latex
\begin{codeblock}[mittelwert.py]{python}
def mittelwert(werte):
    return sum(werte) / len(werte)
\end{codeblock}
```

* `[Titel]` optional (meist Dateiname); erscheint links oben. Wird
  wörtlich gesetzt, Unterstriche sind erlaubt.
* `{Sprache}` Pflicht, eine von:

| Wert | Sprache |
|---|---|
| `python` | Python |
| `c` | C (inkl. `uint8_t` usw.) |
| `cpp` | C++ |
| `asm` | Assembler allgemein (AVR, ARM, RISC-V; Kommentare mit `;` oder `//`) |
| `x86` | x86-Assembler (MASM-Syntax) |
| `verilog` | Verilog / SystemVerilog |
| `vhdl` | VHDL |
| `matlab` | MATLAB / Octave |
| `text` | ohne Hervorhebung (Pseudocode, Konsolenausgabe, Datenformate) |

* Der Code steht **wörtlich** zwischen `\begin{codeblock}` und
  `\end{codeblock}`: keine Maskierung von `_`, `%`, `#`, `&`, `{` nötig.
  Umlaute und `← → ∞ ≤ ≥ ≠ Ω ·` funktionieren.
* Zeilennummern kommen automatisch. In Teilaufgaben auf Zeilen verweisen:
  „In Zeile 5 …“.
* Leerzeichen am Zeilenanfang (Einrückung) bleiben erhalten. Tabs werden
  zu 4 Leerzeichen.
* `\end{codeblock}` muss **allein am Zeilenanfang** stehen.
* Lange Codeblöcke dürfen über eine Seitengrenze laufen.
* Nicht innerhalb von `nebeneinander` oder in Argumenten anderer Befehle.

### `\codedatei[Titel]{Sprache}{Pfad}` – Code aus Datei

```latex
\codedatei[blink.c]{c}{material/blink.c}
```

### Code im Fließtext

| Befehl | Wo | Beispiel |
|---|---|---|
| `\code{..}` | normaler Text, Teilaufgabentexte | `\code{PORTB ^= (1 << LED_PIN);}` – wörtlich, keine Maskierung |
| `\codetext{..}` | **in Argumenten** anderer Befehle (`\aussage`, `\antwort`, `\wert`, Titel) | `\antwort{\codetext{PORTB \&= 0x08;}}` – Sonderzeichen maskieren: `\_ \& \% \# \{ \}` |

Wenn der Code selbst `{` oder `}` enthält, im Fließtext `\code|a{b}|` mit
`|` als Begrenzer schreiben.

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
ohne die Datei zu ändern. Von Hand (z. B. in Overleaf) schaltest du die
Lösungen mit `\documentclass[loesung]{uebungsblatt}` ein und mit
`\documentclass{uebungsblatt}` wieder aus.

Ausgeblendete Lösungen nehmen **keinen Platz** ein: Das Aufgabenblatt sieht
Pixel für Pixel genauso aus, als stünden sie nicht in der Datei.

Im Lösungsvorschlag ändert sich automatisch: Kopf- und Fußzeile tragen
„Lösung“, das Deckblatt zeigt die Marke LÖSUNGSVORSCHLAG und den
Untertitel „Lösungsvorschlag zu Übungsblatt …“, alle Seiten bleiben
vertikal zentriert, alle Lösungselemente erscheinen in
der Lösungsfarbe (Grün).

### `loesung` – die Lösungsbox

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

* Grüne Box mit der Überschrift LÖSUNG. Im Aufgabenblatt komplett
  unsichtbar (auch kein Leerraum).
* Optionale Überschrift: `\begin{loesung}[Lösung mit Bewertungsschema]`,
  `[Lösungsweg]`, `[Typische Fehler]`, `[Begründung]`.
* **Platzierung:** direkt hinter dem Text einer Teilaufgabe (innerhalb von
  `teilaufgaben`, empfohlen) oder als eine Box am Ende der Aufgabe für
  alle Teilaufgaben (dann mit **a)**, **b)** … gliedern).
* Innerhalb der Box ist alles erlaubt: Text, Formeln, `align*`,
  `codeblock`, `tabelle`, Abbildungen.
* Abbildungen und Tabellen in einer Lösung bekommen **keine Nummer**, damit
  die Nummerierung im Aufgabenblatt und im Lösungsvorschlag gleich bleibt.
* Die Box nicht mit einer abgesetzten Formel (`\[`, `align*`) beginnen,
  sondern mit einem kurzen Satz (sonst entsteht oben eine Leerzeile).
* `\end{loesung}` muss allein in einer Zeile stehen (Einrückung erlaubt).
* Eine Box wird nie geteilt: Passt sie nicht mehr auf die Seite, beginnt sie
  auf der nächsten. Eine einzelne Box darf deshalb **höchstens etwa eine
  halbe bis ganze Seite** lang sein. Längere Lösungen auf mehrere Boxen
  aufteilen (z. B. eine Box pro Teilaufgabe).
* **Nicht** innerhalb von `nebeneinander` und nicht in Argumenten anderer
  Befehle. Dann die Box hinter `nebeneinander` setzen.

### `\ergebnis{..}` – Endergebnis hervorheben

`\ergebnis{\qty{54.5}{mA}}` umrahmt das Ergebnis (ersetzt das doppelte
Unterstreichen). Das Argument ist **Mathematik** (wie bei `\wert`). Geht im
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
direkt in die Abbildung der Aufgabe zeichnen. Stil `loesung` verwenden:

```latex
\begin{koordinatensystem}[xmin=0, xmax=6, ymin=-0.4, ymax=1.2]{}
  \nurloesung{\addplot[loesung, domain=0:6] {(1-x)*exp(-x)};}
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
  `blockdiagramm`, `automat`, `knotengraph` und im Text.
* **Nicht** in den Zeilen von `zeitdiagramm`. Stattdessen in der
  `loesung`-Box das vollständige Zeitdiagramm wiederholen, die gesuchte
  Zeile mit `[loesung]` beginnen:

```latex
\begin{loesung}
  $Q$ übernimmt bei jeder steigenden Flanke den Wert von $D$.
  \begin{zeitdiagramm}{Vollständiges Zeitdiagramm}
    CLK & L 8{C} \\
    D   & 2L 4H 2L 1H \\
    Q   & [loesung] 3L 4H 2L \\
  \end{zeitdiagramm}
\end{loesung}
```

* Ebenso für ein auszufüllendes KV-Diagramm: in der Lösung
  `\kvdiagramm{..}{Einsen}` mit den richtigen Werten zeigen und die Blöcke
  im Text nennen.

### Antwortformate

| Format | Lösung angeben mit |
|---|---|
| `antworten` | `\antwort*{..}` für jede richtige Antwort |
| `ankreuzen` | `\aussage[r]{..}` bzw. `\aussage[f]{..}` |
| `zuordnung` | `\paar[k]{..}{..}` (k = Zeile des passenden rechten Eintrags) |

Zusätzlich kann eine `loesung`-Box eine Begründung enthalten.

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

| Inhalt | Baustein |
|---|---|
| Gegebene Größen und gesuchte Größen | `gegeben` + `\wert` + `\gesucht` |
| Formel, Tipp, Definition | `hinweisbox` |
| Gleichstrom-/Wechselstromschaltung, OPV, Transistor | `schaltung` |
| Logikgatter-Schaltung | `schaltung` mit `and port` usw. |
| Funktion, Kennlinie, Bode-Diagramm, Messkurve | `diagramm` |
| „Skizzieren Sie …“ | `koordinatensystem` (leer) |
| Takt-/Signalverläufe, Flipflops, Bus-Timing | `zeitdiagramm` |
| KV-Diagramm (gegeben oder leer) | `\kvdiagramm` in `abbildung` |
| Wahrheitstabelle, Wertetabelle | `tabelle` |
| Zustandsautomat, Moore/Mealy | `automat` |
| Regelkreis, Signalflussplan | `blockdiagramm` |
| Graph, Netzwerk, kürzester Weg, Baum | `knotengraph` |
| Registerbelegung | `\register` in `abbildung` |
| Physikalischer Aufbau, Zeigerdiagramm, Geometrie | `zeichnung` |
| Foto, Screenshot, Oszilloskopbild | `\bild` |
| Programmcode | `codeblock` / `\codedatei` |
| Pseudocode, Konsolenausgabe | `codeblock` mit `{text}` |
| Einfach-/Mehrfachauswahl | `antworten` |
| Richtig/Falsch-Aussagen | `ankreuzen` |
| Begriffe zuordnen | `zuordnung` |
| Text neben Abbildung | `nebeneinander` |
| Lösung einer (Teil-)Aufgabe | `loesung` (+ `\ergebnis`, `\teilpunkt`) |
| Lösung in eine Abbildung zeichnen | `\nurloesung{..}` mit Stil `loesung` |

---

## 13. Häufige Fehler

| Problem | Ursache / Lösung |
|---|---|
| Deckblatt zeigt „??“ | Noch einmal kompilieren (bzw. latexmk benutzen). |
| Warnung „Aufgabe n hat 0 Punkte“ | Weder `\teil{..}` noch `[Punkte]` noch `ankreuzen` in der Aufgabe. |
| Warnung „vorgegebene Punkte passen nicht …“ | `[Punkte]` bei `aufgabe` widerspricht der Summe der `\teil`-Punkte; `[..]` entfernen. |
| „Missing $ inserted“ bei `\wert` | `$…$` in `\wert{..}` geschrieben: weglassen, das Argument ist schon Mathe. |
| „Missing $ inserted“ bei `\codetext` | `_` nicht maskiert: `\codetext{LED\_PIN}`. |
| „Unbekannte Code-Sprache“ | Sprache nicht in der Liste; `text` verwenden. |
| Code in `nebeneinander` / `\antwort` geht kaputt | Codeblöcke nur direkt in der Aufgabe oder in `teilaufgaben`; in Argumenten `\codetext`. |
| `\end{codeblock}` wird nicht erkannt | Muss allein am Zeilenanfang stehen. |
| Zeitdiagramm verrutscht | Alle Zeilen müssen dieselbe Gesamtlänge haben. |
| Sinus in pgfplots falsch | pgfplots rechnet in Grad: `sin(deg(x))`. |
| Ω erscheint falsch | Immer `\ohm` (in `\qty`/`\unit`), nie `$\Omega$`. |
| `\spalte` Fehler | `\spalte` nur innerhalb von `nebeneinander`, genau einmal. |
| „There's no line here to end“ | `\\` direkt nach `\teilpunkt`: weglassen, `\teilpunkt` beendet die Zeile selbst. |
| Lösung erscheint im Aufgabenblatt | Lösung nicht in `loesung` bzw. `\nurloesung` gesetzt. |
| Aufgabenblatt endet plötzlich / Text fehlt | `\end{loesung}` fehlt oder steht nicht allein in seiner Zeile. |
| Lösungsbox ragt unten aus der Seite | Box länger als eine Seite: auf mehrere `loesung`-Boxen aufteilen. |
| Leerzeile oben in der Lösungsbox | Box beginnt mit `\[` oder `align*`: einen kurzen Satz davor schreiben. |
| Zeitdiagramm-Fehler mit `\nurloesung` | In `zeitdiagramm` nicht möglich; vollständige Kopie in die `loesung`-Box. |

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
