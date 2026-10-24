% =====================================================================
%  uebungsblatt.cls  –  Vorlage für Übungsblätter zur Prüfungsvorbereitung
% ---------------------------------------------------------------------
%  Ausführliche Anleitung mit Beispielen: ANLEITUNG.md
%  Vollständiges Beispiel:                beispiel.tex
%  Leeres Grundgerüst:                    uebungsblatt.tex
%
%  Farben:                               ohmtools-colors.sty
%
%  Kompilieren: pdfLaTeX, am einfachsten mit  sh build.sh [name]
%  (erzeugt aus EINER Datei Aufgabenblatt und Lösungsvorschlag;
%  Gesamtpunkte, Aufgabenliste und "Seite x / y" brauchen 2 Durchläufe.)
%  uebungsblatt.cls und ohmtools-colors.sty liegen neben dem Blatt.
%
%  GRUNDREGEL: Das Design ist vollständig in dieser Datei festgelegt und
%  folgt dem ohmtools-Design (github.com/ohmtools/design, DESIGN.md,
%  "Documents"): Helvetica, Zahlen als Daten in Schreibmaschinenschrift,
%  Formeln in Computer Modern, sonst Schwarz und Grau; Rot nur für das, was
%  die Lösung hinzufügt. Kein Rahmen, keine Balken, keine Kästen, keine
%  Flächen, keine Großbuchstaben: Linien und Abstand. Im Dokument nur die
%  hier aufgeführten Befehle verwenden, keine eigenen Farben,
%  Schriftgrößen, Abstände oder \newpage/\vspace.
%
%  ---- KURZREFERENZ ---------------------------------------------------
%  Klassenoptionen:  ohnedeckblatt, aufgabenoben, loesung
%
%  Präambel:  \fach{..} \bearbeitungszeit{..} \hilfsmittel{..} \hinweis{..}
%
%  Struktur:  \begin{aufgabe}[Punkte]{Titel} ... \end{aufgabe}
%             \begin{teilaufgaben} \teil{Punkte} Text ... \end{teilaufgaben}
%             \begin{gegeben} \wert[Bedeutung]{U_0 = \qty{12}{V}} \gesucht{I_1} \end{gegeben}
%             \begin{hinweisbox}[Überschrift] ... \end{hinweisbox}
%             \begin{nebeneinander}[0.5] links \spalte rechts \end{nebeneinander}
%             \neueseite
%
%  Abbildungen (letztes Argument = Bildunterschrift, {} = keine):
%             \begin{abbildung}{Unterschrift} ... \end{abbildung}
%             \bild[Breitenanteil]{datei}{Unterschrift}
%             \begin{zeichnung}[tikz-Optionen]{Unterschrift}
%             \begin{schaltung}[circuitikz-Optionen]{Unterschrift}
%             \begin{diagramm}[pgfplots-Optionen]{Unterschrift}
%             \begin{koordinatensystem}[pgfplots-Optionen]{Unterschrift}
%             \begin{zeitdiagramm}[tikz-timing-Optionen]{Unterschrift}
%             \begin{blockdiagramm}[tikz-Optionen]{Unterschrift}
%             \begin{automat}[tikz-Optionen]{Unterschrift}
%             \begin{knotengraph}[tikz-Optionen]{Unterschrift}
%             \kvdiagramm[dontcare={..}, leer, indizes]{A,B,C,D}{Einsen}
%             \register[breite=12mm, hoechstesbit=7]{Name}{Bit7,...,Bit0}
%             \begin{tabelle}{Spaltenformat}{Unterschrift} ... \trennlinie ... \end{tabelle}
%
%  Code:      \begin{codeblock}[Titel]{Sprache} ... \end{codeblock}
%             \codedatei[Titel]{Sprache}{Dateipfad}
%             \code{x = 5}   (Inline-Code im Fließtext)
%             \codetext{x}   (Inline-Code in Argumenten anderer Befehle)
%             Sprachen: python, c, cpp, asm, x86, verilog, vhdl, matlab, text
%
%  Antworten: \begin{antworten}[spalten=2, typ=einfach|mehrfach]
%                \antwort{falsch} \antwort*{richtig} ... \end{antworten}
%             \begin{ankreuzen}[Punkte je Aussage]
%                \aussage[r]{richtige Aussage} \aussage[f]{falsche} \end{ankreuzen}
%             \begin{zuordnung}[Kopf links][Kopf rechts]
%                \paar[k]{links}{rechts} ... \end{zuordnung}   (k = Lösungszeile rechts)
%             \kaestchen  \kreis
%
%  Lösungen:  (unsichtbar im Aufgabenblatt, sichtbar mit Option "loesung")
%             \begin{loesung}[Überschrift] ... \end{loesung}
%             \ergebnis{I = \qty{2}{A}}   \teilpunkt{1}
%             \nurloesung{..}  \nuraufgabe{..}  \ifloesung .. \else .. \fi
%             TikZ/pgfplots-Stile für eingezeichnete Lösungen: [loesung]
%                [loesung hilfslinie]  \node[loesung punkt=below:{..}] at (..) {};
%             Lösungsvorschlag erzeugen: Klassenoption "loesung", z.B. über
%                sh build.sh blatt   oder   \documentclass[loesung]{uebungsblatt}
%
%  Notation:  \kx{Z} \jj \ee \dd \basis{1011}{2} \laplace{..} \laplaceinv{..}
%             \punkte{2}   sowie siunitx: \qty{12}{V} \num{1.5} \unit{mA}
% =====================================================================
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{uebungsblatt}[Uebungsblaetter zur Pruefungsvorbereitung]

\newif\ifub@deckblatt \ub@deckblatttrue
\newif\ifub@zentriert \ub@zentrierttrue
\DeclareOption{ohnedeckblatt}{\ub@deckblattfalse}
\newif\ifloesung \loesungfalse   % öffentlich: \ifloesung ... \else ... \fi
\DeclareOption{aufgabenoben}{\ub@zentriertfalse}
\DeclareOption{loesung}{\loesungtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt,a4paper]{article}

% =====================================================================
% 1. Pakete
% =====================================================================
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
% Ohne deutsche Trennmuster (Paket texlive-lang-german) trennt babel deutsche
% Wörter nach englischen Regeln, dann besser gar nicht trennen.
\@ifundefined{l@ngerman}
  {\AtBeginDocument{\hyphenpenalty=10000 \emergencystretch=2em}}{}
\IfFileExists{ngerman.ldf}
  {\RequirePackage[ngerman]{babel}}
  {\RequirePackage[provide=*,ngerman]{babel}}
\RequirePackage[a4paper,left=17mm,right=17mm,top=27mm,bottom=26mm,
  headheight=17pt,headsep=9mm,footskip=13mm]{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage{ohmtools-colors}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta,positioning,calc,automata,shapes.geometric,backgrounds}
\RequirePackage[european,siunitx]{circuitikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{tikz-timing}
\RequirePackage{siunitx}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{listings}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable,listings}

% =====================================================================
% 2. Schriften
%    Text: Helvetica, wie es das ohmtools-Design für Werkzeuge ohne Geist
%    vorsieht (TeX Live hat Geist nicht). Zahlen, die man als Daten liest
%    (Punkte, Seiten, Werte in Tabellen, Zeiten, Datum), und Code in
%    TX-Typewriter (statt Geist Mono), sonst Courier. Formeln in Computer
%    Modern: kursive Variablen, aufrechte Zahlen und Einheiten.
% =====================================================================
\RequirePackage[scaled=0.92]{helvet}
\renewcommand\familydefault{\sfdefault}
\IfFileExists{t1txtt.fd}{\renewcommand\ttdefault{txtt}}{\RequirePackage{courier}}
\newcommand\ub@code{\ttfamily}
\newcommand\ub@mono{\ttfamily}
\RequirePackage{microtype}
% keine Ligaturen in Schreibmaschinenschrift (sonst wird << zu «, -- zu –)
\DisableLigatures[<,>,-,`,']{encoding = T1, family = tt*}

\sisetup{output-decimal-marker={,}, mode=match, per-mode=symbol,
  exponent-product=\cdot, reset-text-family=false}
% Omega für \ohm: in Formeln das von Computer Modern, im Text das von
% Computer Modern Sans (T1-Textschriften haben kein Omega)
\DeclareSymbolFont{ubgriech}{OT1}{cmss}{m}{n}
\DeclareMathSymbol{\ub@Omega}{\mathord}{ubgriech}{"0A}
\newif\ifub@textzahl   % siunitx setzt gerade in Textschrift (Werte in Tabellen)
\DeclareRobustCommand\ub@ohm{\ifmmode\ifub@textzahl\ub@Omega\else\Omega\fi
  \else\ensuremath{\ub@Omega}\fi}
\DeclareSIUnit\ohm{\ub@ohm}

% =====================================================================
% 3. Farben: nur die Namen aus ohmtools-colors.sty, nie Werte.
%    ohmForeground ist der Text und die kräftigen Linien, ohmMutedForeground
%    das Grau, ohmBorder die feinen Linien, ohmGrid das Millimeterpapier,
%    ohmPrimary (Schwarz) die Buchstaben der Teilaufgaben. Rot steht nur für
%    das, was die Lösung hinzufügt: ohmAccentRed für Linien, Flächen und
%    Markierungen, ohmDestructive für Text.
% =====================================================================

% =====================================================================
% 4. Metadaten (Präambel)
% =====================================================================
\newcommand*\ub@fach{Übungsblatt}
\newcommand*\ub@zeit{}
\newcommand*\ub@hilfsmittel{}
\newcommand*\ub@hinweise{}
\newcommand\fach[1]{\renewcommand*\ub@fach{#1}}
\newcommand\bearbeitungszeit[1]{\renewcommand*\ub@zeit{#1}}
\newcommand\hilfsmittel[1]{\renewcommand*\ub@hilfsmittel{#1}}
\newcommand\hinweis[1]{\g@addto@macro\ub@hinweise{\item #1}}
\newcommand\ub@art{\ifloesung Lösung\else Angabe\fi}
% Zeitpunkt der Erstellung fürs Deckblatt: build.sh übergibt \ubdatum und
% \ubuhrzeit in deutscher Zeit, für beide PDFs gleich; sonst gilt die Uhr
% beim Übersetzen.
\@ifundefined{ubdatum}{%
  \edef\ubdatum{\two@digits\day.\two@digits\month.\the\year}}{}
\@ifundefined{ubuhrzeit}{%
  \@tempcnta\time \divide\@tempcnta 60
  \@tempcntb\numexpr\time-60*\@tempcnta\relax
  \edef\ubuhrzeit{\two@digits\@tempcnta:\two@digits\@tempcntb}}{}

% =====================================================================
% 5. Interne Stilbausteine
%    Maße aus DESIGN.md in px (A4 = 794 px breit, 1 px = 0,75 pt).
% =====================================================================
\newcommand\ub@zahl[1]{\num{#1}}
\newcommand\ub@monozahl[1]{{\ub@mono\ub@zahl{#1}}}
% Link ohne Rahmen, ohne hyperref (nur pdfTeX, sonst nur der Text)
\newcommand\ub@link[2]{\ifdefined\pdfstartlink\pdfstartlink attr{/Border[0 0 0]}
  user{/Subtype/Link/A<</S/URI/URI(#1)>>}#2\pdfendlink\else#2\fi}
\newcommand\ub@label[1]{\leavevmode{\footnotesize\color{ohmMutedForeground}#1}}
\newcommand\ub@punktewort[1]{\ifnum\fpeval{#1==1}=1 Punkt\else Punkte\fi}
\newcommand\ub@unterschrift[2]{% #1 = Kürzel mit Nummer (Abb. 1), #2 = Text
  {\footnotesize\color{ohmMutedForeground}\textbf{\color{ohmForeground}#1}\enspace #2}}
% Linien: 1 px; kräftig in ohmForeground, fein in ohmBorder
\newlength\ub@lw \setlength\ub@lw{0.75pt}
\newcommand\ub@hlinie[1]{{\color{#1}\hrule\@height\ub@lw}}
\newcommand\ub@tablinie[1]{\noalign{\ub@hlinie{#1}}}
% Badges: 20 px hoch, 8 px Rand, Radius 6 px, Schrift 12 px
\tikzset{
  ub badge/.style={rounded corners=1.6mm,minimum height=5.3mm,inner xsep=2.1mm,
    inner ysep=0pt,font=\footnotesize,text depth=0.35ex,text height=1.55ex},
  ub badge outline/.style={ub badge,draw=ohmBorder,line width=\ub@lw,text=ohmForeground},
  ub badge angabe/.style={ub badge,draw=ohmBorder,line width=\ub@lw,fill=ohmMuted,
    text=ohmSecondaryForeground},
  ub badge loesung/.style={ub badge,fill=ohmAccentRed,text=ohmAccentRedForeground},
}
\DeclareRobustCommand\ub@badge[2]{% #1 = Stil (outline, angabe, loesung), #2 = Text
  \tikz[baseline=(b.base)]\node[ub badge #1] (b) {#2};}
\newcommand\ub@artbadge{\ifloesung\ub@badge{loesung}{Lösung}\else\ub@badge{angabe}{Angabe}\fi}

\setlength\parindent{0pt}
\setlength\parskip{2mm plus 1mm}
% Flattersatz: ohne deutsche Trennmuster würde Blocksatz Lücken reißen
\AddToHook{begindocument/end}{\color{ohmForeground}\raggedright}

% =====================================================================
% 6. Kopf- und Fußzeilen
%    Kopf: "OhmTools Lernhelfer", rechts "Übungsblatt" und das Badge
%    (Angabe grau, Lösung rot), darunter eine kräftige Linie. Fuß: Linie,
%    links Fach und Art des Blatts, rechts "Seite x / y".
% =====================================================================
\pagestyle{fancy}
\fancyhf{}
\renewcommand\headrulewidth{0.75pt}
\renewcommand\footrulewidth{0.75pt}
\renewcommand\headrule{{\color{ohmForeground}\hrule\@height\headrulewidth\@width\headwidth}\vskip-\headrulewidth}
\renewcommand\footrule{{\color{ohmForeground}\hrule\@height\footrulewidth\@width\headwidth}\vskip\footruleskip}
\newcommand\ub@kopflinks[1]{{\bfseries #1}\ {\color{ohmMutedForeground}Lernhelfer}}
\newcommand\ub@kopfrechts{{\footnotesize\color{ohmMutedForeground}Übungsblatt}\hspace{2.1mm}\ub@artbadge}
\fancyhead[L]{\ub@kopflinks{OhmTools}}
\fancyhead[R]{\ub@kopfrechts}
\fancyfoot[L]{\footnotesize\color{ohmMutedForeground}\ub@fach\ \textperiodcentered\ \ub@art}
\fancyfoot[R]{\footnotesize\color{ohmMutedForeground}Seite
  {\ub@mono\color{ohmForeground}\thepage\,/\,\pageref{LastPage}}}
\fancypagestyle{deckblatt}{%
  \fancyhead[L]{\ub@kopflinks{\ub@link{https://github.com/ohmtools}{OhmTools}}}}

% =====================================================================
% 7. Punkteverwaltung (über die .aux-Datei)
%    Punkte entstehen NUR durch \teil{..}, \aussage (in ankreuzen) oder
%    das optionale Argument von aufgabe.
% =====================================================================
\newcommand*\ub@pkt{0}
\newcommand*\ub@pktfest{}
\newcommand*\ub@summe{0}
\newcommand*\ub@liste{}
\newcommand\ub@addpkt[1]{\xdef\ub@pkt{\fpeval{\ub@pkt+(#1)}}}
\newcommand\ub@eintrag[3]{%
  \expandafter\xdef\csname ub@pkt@#1\endcsname{#3}%
  \g@addto@macro\ub@liste{\ub@listenzeile{#1}{#2}{#3}}}
\newcommand*\ub@gesamtaux{}
\newcommand*\ub@anzahlaux{}
\newcommand\ub@setgesamt[2]{\gdef\ub@gesamtaux{#1}\gdef\ub@anzahlaux{#2}}
\AtEndDocument{%
  \immediate\write\@auxout{\string\ub@setgesamt{\ub@summe}{\arabic{aufgabe}}}}
\newcommand\ub@kopfpunkte{%
  \ifx\ub@pktfest\@empty
    \ifcsname ub@pkt@\arabic{aufgabe}\endcsname
      \edef\@tempa{\csname ub@pkt@\arabic{aufgabe}\endcsname}%
      \ub@monozahl{\@tempa}~\ub@punktewort{\@tempa}%
    \else {\ub@mono ??}~Punkte\fi
  \else
    \ub@monozahl{\ub@pktfest}~\ub@punktewort{\ub@pktfest}%
  \fi}

% =====================================================================
% 8. Aufgaben
%    \begin{aufgabe}[Punkte]{Titel}  – beginnt auf neuer Seite
%    Vertikale Zentrierung: JEDE Seite (auch Deckblatt, Lösungsseiten,
%    Fortsetzungsseiten) wird über \@texttop/\@textbottom vertikal mittig
%    gesetzt, damit beim digitalen Bearbeiten unter jeder Seite ein Blatt
%    eingefügt werden kann, ohne weit scrollen zu müssen.
%    Klassenoption "aufgabenoben": Inhalt oben statt mittig.
\ifub@zentriert
  \AtBeginDocument{%
    \def\@texttop{\vskip\z@\@plus 1fil\relax}%
    \def\@textbottom{\vskip\z@\@plus 1fil\relax}}
\fi
% =====================================================================
\newcounter{aufgabe}
% Kopf: "Aufgabe 1" klein und grau, darunter der Titel (28 px fett), rechts
% unten das Badge mit den Punkten
\newsavebox\ub@punktebox
\newcommand\ub@aufgabenkopf[1]{%
  \sbox\ub@punktebox{\tikz[baseline=(b.base)]\node[ub badge outline,
    minimum height=6.9mm,inner xsep=2.6mm,font=\small] (b) {\ub@kopfpunkte};}%
  \par\noindent
  \parbox[b]{\dimexpr\linewidth-\wd\ub@punktebox-6mm\relax}{\raggedright
    {\footnotesize\color{ohmMutedForeground}Aufgabe {\ub@mono\arabic{aufgabe}}}\par
    \vspace{0.6mm}%
    {\fontsize{21}{24}\selectfont\bfseries\textls[-20]{#1}\par}}%
  \hfill\usebox\ub@punktebox\par
  \vspace{2mm}}

\NewDocumentEnvironment{aufgabe}{o m}{%
  \clearpage
  \refstepcounter{aufgabe}%
  \gdef\ub@pkt{0}%
  \IfNoValueTF{#1}{\gdef\ub@pktfest{}}{\xdef\ub@pktfest{\fpeval{#1}}}%
  \ub@aufgabenkopf{#2}%
}{%
  \par
  \ifx\ub@pktfest\@empty
    \ifnum\fpeval{\ub@pkt==0}=1
      \ClassWarningNoLine{uebungsblatt}{Aufgabe \arabic{aufgabe} hat 0 Punkte.
        Punkte mit \string\teil{..} oder \string\begin{aufgabe}[..] vergeben}%
    \fi
  \else
    \ifnum\fpeval{\ub@pkt==0 || \ub@pkt==\ub@pktfest}=0
      \ClassWarningNoLine{uebungsblatt}{Aufgabe \arabic{aufgabe}: vorgegebene
        Punkte (\ub@pktfest) passen nicht zur Summe der Teilaufgaben (\ub@pkt)}%
    \fi
    \xdef\ub@pkt{\ub@pktfest}%
  \fi
  \xdef\ub@summe{\fpeval{\ub@summe+\ub@pkt}}%
  \immediate\write\@auxout{\string\ub@eintrag{\arabic{aufgabe}}%
    {\unexpanded{#2}}{\ub@pkt}}%
  \clearpage
}
\newcommand\neueseite{\clearpage}

% Teilaufgaben a), b), ...: der Buchstabe in einer schwarzen Kachel (22 px,
% Radius 6 px), die Punkte rechts am Rand, die Teile durch feine Linien
% getrennt
\DeclareRobustCommand\ub@kachel[1]{\tikz[baseline=(k.base)]\node[fill=ohmPrimary,
  text=ohmPrimaryForeground,rounded corners=1.6mm,minimum size=5.8mm,inner sep=0pt,
  font=\footnotesize\bfseries,text depth=0.3ex,text height=1.6ex] (k) {#1};}
\newlist{teilaufgaben}{enumerate}{1}
\setlist[teilaufgaben]{label=\ub@kachel{\alph*},leftmargin=8.4mm,labelwidth=5.8mm,
  labelsep=2.6mm,align=left,rightmargin=13mm,itemsep=0pt,parsep=1.5mm,topsep=3mm}
\newcommand\ub@randpunkte[1]{%
  \leavevmode\rlap{\hskip\linewidth\hskip\rightmargin
        \llap{\footnotesize\ub@mono\ub@zahl{#1}\,P}}}
\newcommand\ub@teillinie{\par\vspace{3.7mm}\ub@hlinie{ohmBorder}\nobreak\vspace{1.7mm}}
\newcommand\teil[1]{\ub@teillinie\item\ub@addpkt{#1}\ub@randpunkte{#1}\ignorespaces}

% =====================================================================
% 9. Abschnitte: gegeben/gesucht, hinweisbox
%    gegeben: Tabelle "Symbol | Bedeutung | Wert" (ohne Bedeutung zwei
%    Spalten), Symbol in der Formelschrift, Werte in Schreibmaschinenschrift
%    rechtsbündig; darunter die Zeile "Gesucht". Keine Kästen, nur Linien.
% =====================================================================
\newcommand*\ub@werte{}
\newcommand*\ub@gesuchtliste{}
\newif\ifub@mitbedeutung
\newlength\ub@symbolbreite
\newlength\ub@wertbreite
\newlength\ub@tabbreite
\newsavebox\ub@messbox
% Wert in Textschrift, damit Zahl und Einheit in Schreibmaschinenschrift
% stehen; der Rest der Formel bleibt Mathematik
\newcommand\ub@wertsetzen[1]{\text{\ub@textzahltrue\sisetup{mode=text}\ub@mono$#1$}}
\def\ub@wertteilen#1=#2\@nil{\ub@wertzeile{#1}{#2}}
\NewDocumentEnvironment{gegeben}{}{%
  \gdef\ub@werte{}\gdef\ub@gesuchtliste{}\global\ub@mitbedeutungfalse
  \global\setlength\ub@symbolbreite{9mm}\global\setlength\ub@wertbreite{16mm}%
  \par\ignorespaces}{%
  \par\addvspace{3mm}\noindent
  \ifub@mitbedeutung
    \setlength\ub@tabbreite{\ifdim\linewidth>110mm 110mm\else\linewidth\fi}%
  \else
    \setlength\ub@tabbreite{\dimexpr\ub@symbolbreite+\ub@wertbreite+12mm\relax}%
  \fi
  \begingroup
  \setlength\tabcolsep{0pt}\renewcommand\arraystretch{1}%
  \edef\ub@praeambel{@{}>{\noexpand\raggedright\noexpand\arraybackslash}p{\the\dimexpr\ub@symbolbreite+6mm\relax}%
    \ifub@mitbedeutung>{\noexpand\raggedright\noexpand\arraybackslash}%
      p{\the\dimexpr\ub@tabbreite-\ub@symbolbreite-\ub@wertbreite-12mm\relax}\fi
    >{\noexpand\raggedleft\noexpand\arraybackslash}p{\the\dimexpr\ub@wertbreite+6mm\relax}@{}}%
  \expandafter\tabular\expandafter{\ub@praeambel}%
    \ub@kopfzeile Symbol\ub@mitspalte{& Bedeutung} & Wert\\
    \ub@tablinie{ohmForeground}%
    \ub@werte
    \ub@tablinie{ohmForeground}%
  \endtabular\par
  \endgroup
  \ifx\ub@gesuchtliste\@empty\else
    \vspace{1.6mm}\noindent\ub@label{Gesucht}\hspace{3mm}$\ub@gesuchtliste$\par
  \fi
  \addvspace{3mm}}
\newcommand\ub@kopfzeile{\rule[-2.6mm]{0pt}{8.2mm}}
\newcommand\ub@zeilenstrut{\rule[-2.4mm]{0pt}{7mm}}
% \wert[Bedeutung]{Symbol = Wert}; ohne "=" steht alles in der Spalte Symbol
\NewDocumentCommand\wert{o m}{%
  \IfValueT{#1}{\global\ub@mitbedeutungtrue}%
  \gdef\ub@bedeutung{\IfValueT{#1}{#1}}%
  \in@{=}{#2}%
  \ifin@\ub@wertteilen#2\@nil\else\ub@wertzeile{#2}{}\fi
  \ignorespaces}
\newcommand\ub@wertzeile[2]{%
  \sbox\ub@messbox{$#1$}%
  \ifdim\wd\ub@messbox>\ub@symbolbreite\global\setlength\ub@symbolbreite{\wd\ub@messbox}\fi
  \sbox\ub@messbox{\ub@wertsetzen{#2}}%
  \ifdim\wd\ub@messbox>\ub@wertbreite\global\setlength\ub@wertbreite{\wd\ub@messbox}\fi
  \ifx\ub@werte\@empty\else\g@addto@macro\ub@werte{\ub@tablinie{ohmBorder}}\fi
  \expandafter\g@addto@macro\expandafter\ub@werte\expandafter{%
    \expandafter\ub@wertzeilesetzen\expandafter{\ub@bedeutung}{#1}{#2}}}
\newcommand\ub@wertzeilesetzen[3]{% #1 = Bedeutung, #2 = Symbol, #3 = Wert
  \ub@zeilenstrut$#2$\ub@mitspalte{& #1} & \ub@wertsetzen{#3}\\}
\newcommand\ub@mitspalte{\ifub@mitbedeutung\expandafter\@firstofone\else
  \expandafter\@gobble\fi}
\newcommand\gesucht[1]{\gdef\ub@gesuchtliste{#1}\ignorespaces}

% hinweisbox: Überschrift klein und grau, je eine feine Linie darüber und
% darunter
\tcbset{ub box/.style={enhanced,frame hidden,colback=ohmBackground,sharp corners,
  borderline north={\ub@lw}{0pt}{ohmBorder},borderline south={\ub@lw}{0pt}{ohmBorder},
  left=0mm,right=0mm,top=3mm,bottom=3mm,before skip=3mm,after skip=3mm,
  before upper={\setlength\parskip{1.5mm}}}}
\NewDocumentEnvironment{hinweisbox}{O{Hinweis}}{%
  \begin{tcolorbox}[ub box]\ub@label{#1}\par\vspace{0.5mm}}{%
  \end{tcolorbox}}

% =====================================================================
% 10. Zwei Spalten: \begin{nebeneinander}[Anteil links] links \spalte rechts
% =====================================================================
\newcommand\spalte{\ClassError{uebungsblatt}{\string\spalte\space nur innerhalb von nebeneinander}{}}
\def\ub@nb#1#2\spalte#3\spalte#4\@nil{%
  \par\vspace{2mm}\noindent
  \begin{minipage}[t]{\dimexpr#1\linewidth-3mm\relax}\vspace{0pt}\raggedright#2\end{minipage}\hfill
  \begin{minipage}[t]{\dimexpr\linewidth-#1\linewidth-3mm\relax}\vspace{0pt}\raggedright#3\end{minipage}%
  \par\vspace{2mm}}
\NewDocumentEnvironment{nebeneinander}{O{0.5} +b}{\ub@nb{#1}#2\spalte\spalte\@nil}{}

% =====================================================================
% 11. Abbildungen
% =====================================================================
\newcounter{ubabbildung}
\newcounter{ubtabelle}
\newif\ifub@inloesung   % in Lösungen: Abbildungen/Tabellen ohne Nummer
\NewDocumentEnvironment{abbildung}{m}{%
  \par\vspace{4mm}\begin{center}}{%
  \IfBlankF{#1}{\par\vspace{2mm}%
    \ifub@inloesung{\footnotesize\color{ohmMutedForeground}#1}\else
    \refstepcounter{ubabbildung}%
    \ub@unterschrift{Abb.~\theubabbildung}{#1}\fi}%
  \end{center}\vspace{1mm}}

\NewDocumentCommand\bild{O{0.6} m m}{%
  \begin{abbildung}{#3}\includegraphics[width=#1\linewidth]{#2}\end{abbildung}}

% Gemeinsame TikZ-Stile (in allen Zeichnungsumgebungen nutzbar). Linien
% 1,5 px in ohmForeground, Pfeile gefüllt.
\tikzset{
  ub zeichnung/.style={line width=1.1pt,>={Latex[length=2.4mm]},font=\small,
    every node/.append style={text=ohmForeground}},
  % Blockdiagramme / Regelkreise
  block/.style={draw,rectangle,minimum width=16mm,minimum height=10mm,
    align=center,fill=ohmBackground},
  summe/.style={draw,circle,minimum size=5.5mm,inner sep=0pt,fill=ohmBackground},
  verzweigung/.style={circle,fill=ohmForeground,inner sep=1.4pt},
  % Graphen
  knoten/.style={draw,circle,minimum size=8mm,inner sep=1pt,fill=ohmBackground},
  gewicht/.style={font=\footnotesize,fill=ohmBackground,inner sep=1.5pt},
  % Hervorhebung in der Angabe: kräftiger, nie rot (Rot hat nur die Lösung)
  markiert/.style={draw=ohmForeground,line width=1.5pt,fill=ohmMuted,text=ohmForeground},
  akzent/.style={color=ohmForeground,line width=1.5pt},
  hilfslinie/.style={draw=ohmMutedForeground,line width=0.5pt,dashed},
}

\NewDocumentEnvironment{zeichnung}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,#1]}{%
  \end{tikzpicture}\end{abbildung}}

% Schaltzeichen nach DIN EN 60617, Negation als Kreis; Spule und Trafo als
% gefülltes Rechteck (wie an der Schule des Nutzers); Operationsverstärker
% als "en amp", Messgeräte als "rmeter" (ANLEITUNG-schaltungen.md);
% Spannungspfeile gerade neben dem Bauteil statt gebogen
\ctikzset{bipoles/thickness=1, monopoles/ground/width=0.25,
  tripoles/european not symbol=circle, voltage=straight}
\NewDocumentEnvironment{schaltung}{O{} m}{%
  \begin{abbildung}{#2}\begin{circuitikz}[line width=0.9pt,font=\small,#1]}{%
  \end{circuitikz}\end{abbildung}}

\NewDocumentEnvironment{blockdiagramm}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,node distance=14mm,
    every path/.append style={->},#1]}{%
  \end{tikzpicture}\end{abbildung}}

\NewDocumentEnvironment{automat}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,node distance=30mm,auto,
    every state/.style={draw,circle,minimum size=11mm,inner sep=1pt,fill=ohmBackground,
      line width=0.8pt},
    accepting/.style={double,double distance=1.6pt},
    initial text={},every edge/.append style={->},#1]}{%
  \end{tikzpicture}\end{abbildung}}

\NewDocumentEnvironment{knotengraph}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,node distance=22mm,#1]}{%
  \end{tikzpicture}\end{abbildung}}

% ---- Diagramme (pgfplots) -------------------------------------------
% Kurven schwarz, jede weitere mit eigener Strichart; keine Legende, die
% Beschriftung steht an der Kurve. Rot hat nur die Lösung.
\pgfplotscreateplotcyclelist{ub farben}{%
  {ohmForeground,mark=none},{ohmForeground,dashed,mark=none},
  {ohmForeground,dotted,mark=none},{ohmMutedForeground,dashdotted,mark=none}}
\pgfplotsset{/pgf/number format/use comma,/pgf/number format/1000 sep={\,},
  ub achsen/.style={width=0.78\linewidth,height=0.44\linewidth,
    axis line style={ohmForeground,line width=0.75pt},tick style={ohmForeground},
    tick label style={font=\footnotesize},label style={font=\small},
    title style={font=\small\bfseries},
    grid=major,grid style={ohmBorder,line width=0.5pt},
    cycle list name=ub farben,
    every axis plot/.append style={line width=1.1pt},
    legend style={draw=none,fill=ohmBackground,fill opacity=0.85,text opacity=1,font=\small},
    legend cell align=left},
  % Millimeterpapier: feine Linien ohmGrid, jede fünfte ohmBorder, Achsen
  % 1,2 px mit gefüllten Pfeilen, Zahlen klein in Schreibmaschinenschrift
  ub skizze/.style={ub achsen,axis lines=middle,
    axis line style={ohmForeground,line width=0.9pt,-{Latex[length=2.2mm]}},
    grid=both,minor tick num=4,
    major grid style={ohmBorder,line width=0.5pt},
    minor grid style={ohmGrid,line width=0.5pt},
    tick label style={font=\ub@mono\footnotesize,text=ohmHour},
    xticklabel={\pgfmathprintnumber[assume math mode=true]{\tick}},
    yticklabel={\pgfmathprintnumber[assume math mode=true]{\tick}},
    every axis x label/.style={at={(ticklabel* cs:1)},anchor=west},
    every axis y label/.style={at={(ticklabel* cs:1)},anchor=south},
    enlargelimits=false,clip=false},
}
\NewDocumentEnvironment{diagramm}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}\begin{axis}[ub achsen,#1]}{%
  \end{axis}\end{tikzpicture}\end{abbildung}}
\NewDocumentEnvironment{koordinatensystem}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}\begin{axis}[ub skizze,#1]}{%
  \end{axis}\end{tikzpicture}\end{abbildung}}

% ---- Zeitdiagramme (tikz-timing) ------------------------------------
\NewDocumentEnvironment{zeitdiagramm}{O{} m +b}{%
  \begin{abbildung}{#2}%
  \begin{tikztimingtable}[timing/slope=0.08,timing/rowdist=4.4ex,xscale=4,
      yscale=1.6,line width=0.8pt,timing/name/.style={font=\small},
      timing/font=\small,timing/z/.style={ohmMutedForeground},timing/x/.style={ohmMutedForeground},
      timing/u/background/.style={fill=ohmMuted},timing/d/text/.style={font=\scriptsize},#1]
    #3
    \extracode
    \begin{background}[draw=ohmBorder,line width=0.4pt]\vertlines{}\end{background}
  \end{tikztimingtable}%
  \end{abbildung}}{}

% ---- KV-Diagramm ----------------------------------------------------
%  \kvdiagramm[Optionen]{Variablen}{Einsen als Minterm-Indizes}
%  Optionen: dontcare={..}  leer  indizes  groesse=9mm
\newif\ifub@kv@leer
\newif\ifub@kv@idx
\pgfkeys{/ub/kv/.is family,/ub/kv,
  dontcare/.store in=\ub@kv@dc,
  leer/.is if=ub@kv@leer,
  indizes/.is if=ub@kv@idx,
  groesse/.store in=\ub@kv@s}
\def\ub@kv@g#1{\ifcase#1 0\or 1\or 3\or 2\fi}
\def\ub@kv@kopf#1#2{\ifnum#1=2 #2\else\ifcase#2 00\or 01\or 11\or 10\fi\fi}
\NewDocumentCommand\kvdiagramm{O{} m m}{%
  \begingroup
  \def\ub@kv@dc{}\def\ub@kv@s{9mm}\ub@kv@leerfalse\ub@kv@idxfalse
  \pgfkeys{/ub/kv,#1}%
  \gdef\ub@kv@n{0}%
  \foreach \v in {#2}{\xdef\ub@kv@n{\the\numexpr\ub@kv@n+1}%
    \expandafter\xdef\csname ub@kv@v\ub@kv@n\endcsname{\v}}%
  \gdef\ub@kv@eins{,}\foreach \m in {#3}{\xdef\ub@kv@eins{\ub@kv@eins\m,}}%
  \gdef\ub@kv@x{,}\foreach \m in \ub@kv@dc{\xdef\ub@kv@x{\ub@kv@x\m,}}%
  \ifcase\ub@kv@n\or\or
      \def\ub@kv@R{2}\def\ub@kv@C{2}%
      \edef\ub@kv@zv{\csname ub@kv@v1\endcsname}\edef\ub@kv@sv{\csname ub@kv@v2\endcsname}\or
      \def\ub@kv@R{2}\def\ub@kv@C{4}%
      \edef\ub@kv@zv{\csname ub@kv@v1\endcsname}%
      \edef\ub@kv@sv{\csname ub@kv@v2\endcsname\csname ub@kv@v3\endcsname}\or
      \def\ub@kv@R{4}\def\ub@kv@C{4}%
      \edef\ub@kv@zv{\csname ub@kv@v1\endcsname\csname ub@kv@v2\endcsname}%
      \edef\ub@kv@sv{\csname ub@kv@v3\endcsname\csname ub@kv@v4\endcsname}%
    \else\ClassError{uebungsblatt}{\string\kvdiagramm: 2 bis 4 Variablen erlaubt}{}\fi
  \begin{tikzpicture}[x=\ub@kv@s,y=\ub@kv@s,line width=0.6pt,font=\small]
    \pgfmathtruncatemacro\ub@kv@Rm{\ub@kv@R-1}%
    \pgfmathtruncatemacro\ub@kv@Cm{\ub@kv@C-1}%
    \foreach \r in {0,...,\ub@kv@Rm}{%
      \node[font=\small,text=ohmMutedForeground] at (-0.5,-\r-0.5) {\ub@kv@kopf{\ub@kv@R}{\r}};
      \foreach \c in {0,...,\ub@kv@Cm}{%
        \edef\m{\the\numexpr\ub@kv@g{\r}*\ub@kv@C+\ub@kv@g{\c}\relax}%
        \draw[ohmBorder] (\c,-\r) rectangle ++(1,-1);
        \ifub@kv@idx
          \node[font=\tiny,text=ohmMutedForeground,anchor=north east,inner sep=1.2pt]
            at (\c+1,-\r) {\m};\fi
        \ifub@kv@leer\else
          \edef\ub@tmp{\noexpand\in@{,\m,}{\ub@kv@x}}\ub@tmp
          \ifin@ \node at (\c+0.5,-\r-0.5) {X};%
          \else
            \edef\ub@tmp{\noexpand\in@{,\m,}{\ub@kv@eins}}\ub@tmp
            \ifin@ \node[font=\bfseries] at (\c+0.5,-\r-0.5) {1};%
            \else \node[text=ohmMutedForeground] at (\c+0.5,-\r-0.5) {0};\fi
          \fi
        \fi
      }%
    }%
    \foreach \c in {0,...,\ub@kv@Cm}{%
      \node[font=\small,text=ohmMutedForeground] at (\c+0.5,0.5) {\ub@kv@kopf{\ub@kv@C}{\c}};}
    \draw[ohmForeground,line width=0.9pt] (0,0) rectangle (\ub@kv@C,-\ub@kv@R);
    \draw[ohmForeground,line width=0.6pt] (-1,1) -- (0,0);
    \node[anchor=south west,inner sep=1pt] at (-0.55,0.5) {$\ub@kv@sv$};
    \node[anchor=north east,inner sep=1pt] at (-0.45,0.5) {$\ub@kv@zv$};
  \end{tikzpicture}%
  \endgroup}

% ---- Registerdarstellung --------------------------------------------
%  \register[breite=12mm, hoechstesbit=7]{Name}{Bit7,Bit6,...,Bit0}
\pgfkeys{/ub/reg/.is family,/ub/reg,
  breite/.store in=\ub@reg@w, hoechstesbit/.store in=\ub@reg@hb}
\NewDocumentCommand\register{O{} m m}{%
  \begingroup
  \def\ub@reg@w{12mm}\def\ub@reg@hb{}%
  \pgfkeys{/ub/reg,#1}%
  \gdef\ub@reg@n{0}\foreach \b in {#3}{\xdef\ub@reg@n{\the\numexpr\ub@reg@n+1}}%
  \ifx\ub@reg@hb\@empty\edef\ub@reg@hb{\the\numexpr\ub@reg@n-1}\fi
  \begin{tikzpicture}[x=\ub@reg@w,y=7mm,line width=0.7pt]
    \foreach \b [count=\i from 0] in {#3}{%
      \draw[ohmForeground,fill=ohmBackground] (\i,0) rectangle ++(1,1);
      \node[font=\scriptsize] at (\i+0.5,0.5) {\b};
      \pgfmathtruncatemacro\nr{\ub@reg@hb-\i}%
      \node[font=\scriptsize,text=ohmMutedForeground] at (\i+0.5,1.35) {\nr};}
    \node[anchor=east,font=\small\bfseries] at (-0.15,0.5) {#2};
  \end{tikzpicture}%
  \endgroup}

% ---- Tabellen -------------------------------------------------------
% Keine Füllung, keine Linie oben: eine kräftige Linie unter dem Kopf
% (\trennlinie) und am Ende
\setlength\heavyrulewidth{0.75pt}
\setlength\lightrulewidth{0.75pt}
\NewDocumentEnvironment{tabelle}{m m}{%
  \par\vspace{3mm}\begin{center}\renewcommand\arraystretch{1.3}%
  \begin{tabular}{#1}}{%
  \arrayrulecolor{ohmForeground}\bottomrule\end{tabular}%
  \IfBlankF{#2}{\par\vspace{2mm}%
    \ifub@inloesung{\footnotesize\color{ohmMutedForeground}#2}\else
    \refstepcounter{ubtabelle}%
    \ub@unterschrift{Tab.~\theubtabelle}{#2}\fi}%
  \end{center}\vspace{1mm}}
\newcommand\trennlinie{\arrayrulecolor{ohmForeground}\midrule}

% =====================================================================
% 12. Code
% =====================================================================
\lstdefinestyle{ub basis}{%
  basicstyle=\ub@code\small,
  keywordstyle=\color{ohmForeground}\bfseries,
  keywordstyle=[2]\color{ohmForeground},
  commentstyle=\color{ohmMutedForeground}\itshape,
  stringstyle=\color{ohmMutedForeground},
  numbers=left,numberstyle=\ub@code\scriptsize\color{ohmMutedForeground},numbersep=3.5mm,
  xleftmargin=6mm,columns=fullflexible,keepspaces=true,
  showstringspaces=false,tabsize=4,breaklines=true,upquote=true,
  extendedchars=true,
  literate={ä}{{\"a}}1 {ö}{{\"o}}1 {ü}{{\"u}}1 {Ä}{{\"A}}1 {Ö}{{\"O}}1
           {Ü}{{\"U}}1 {ß}{{\ss}}1 {°}{{\textdegree}}1 {µ}{{\textmu}}1
           {€}{{EUR}}3 {←}{{$\leftarrow$}}2 {→}{{$\rightarrow$}}2
           {∞}{{$\infty$}}1 {≤}{{$\le$}}1 {≥}{{$\ge$}}1 {≠}{{$\ne$}}1
           {Ω}{{$\ub@Omega$}}1 {·}{{$\cdot$}}1}
\lstdefinelanguage{ubasm}{%
  sensitive=false,alsoletter={.},
  morekeywords={mov,movs,movw,ldr,ldrb,str,strb,ldi,ld,st,lds,sts,lea,li,la,lw,sw,lb,sb,
    add,adds,adc,addi,sub,subs,sbc,subi,mul,muls,div,udiv,sdiv,inc,dec,neg,
    and,ands,andi,orr,or,ori,eor,xor,xori,not,mvn,com,
    lsl,lsr,asr,ror,rol,shl,shr,sal,sar,
    cmp,cmn,cpi,tst,test,
    b,bl,bx,blx,beq,bne,bgt,blt,bge,ble,bcs,bcc,bhi,bls,beqz,bnez,
    breq,brne,brge,brlt,brcs,brcc,
    jmp,je,jne,jz,jnz,jg,jge,jl,jle,ja,jb,j,jal,jr,jalr,rjmp,rcall,call,ret,reti,
    push,pop,nop,in,out,sbi,cbi,sbic,sbis,sei,cli,halt,hlt,int,swi,svc},
  morekeywords=[2]{.text,.data,.bss,.global,.globl,.section,.word,.byte,.half,
    .equ,.set,.org,.include,.def,.align,.ascii,.asciz,.end,.thumb,.arm},
  morecomment=[l]{;},morecomment=[l]{//},morecomment=[s]{/*}{*/},
  morestring=[b]"}
\lstdefinestyle{ub-python}{style=ub basis,language=Python,
  morekeywords={True,False,None,self,async,await,nonlocal,with,as,yield,assert}}
\lstdefinestyle{ub-c}{style=ub basis,language=C,
  morekeywords={uint8_t,uint16_t,uint32_t,int8_t,int16_t,int32_t,bool,true,false,
    size_t,volatile,inline,NULL}}
\lstdefinestyle{ub-cpp}{style=ub basis,language=C++,
  morekeywords={nullptr,override,constexpr,auto,noexcept,uint8_t,uint16_t,uint32_t,
    int32_t,size_t}}
\lstdefinestyle{ub-asm}{style=ub basis,language=ubasm}
\lstdefinestyle{ub-x86}{style=ub basis,language={[x86masm]Assembler}}
\lstdefinestyle{ub-verilog}{style=ub basis,language=Verilog,
  morekeywords={logic,always_ff,always_comb,localparam,genvar,generate,endgenerate}}
\lstdefinestyle{ub-vhdl}{style=ub basis,language=VHDL,
  morekeywords={std_logic,std_logic_vector,unsigned,signed,rising_edge,falling_edge,
    to_unsigned,to_integer,others}}
\lstdefinestyle{ub-matlab}{style=ub basis,language=Matlab}
\lstdefinestyle{ub-text}{style=ub basis,language={}}
\lstdefinestyle{ub inline}{basicstyle=\ub@code,columns=fullflexible,keepspaces=true,
  upquote=true,language={}}

\@namedef{ub@lang@python}{Python}
\@namedef{ub@lang@c}{C}
\@namedef{ub@lang@cpp}{C++}
\@namedef{ub@lang@asm}{Assembler}
\@namedef{ub@lang@x86}{x86-Assembler}
\@namedef{ub@lang@verilog}{Verilog}
\@namedef{ub@lang@vhdl}{VHDL}
\@namedef{ub@lang@matlab}{MATLAB}
\@namedef{ub@lang@text}{}

\tcbset{ub codebox/.style={enhanced,breakable,listing only,
    frame hidden,colback=ohmBackground,sharp corners,
    borderline north={\ub@lw}{0pt}{ohmBorder},borderline south={\ub@lw}{0pt}{ohmBorder},
    left=0mm,right=0mm,top=2mm,bottom=2mm,before skip=3mm,after skip=3mm},
  ub codekopf/.code 2 args={%
    \edef\ub@ct{\detokenize{#1}}% Titel wörtlich (Unterstriche erlaubt)
    \ifcsname ub@lang@#2\endcsname\edef\ub@cl{\csname ub@lang@#2\endcsname}%
    \else\ClassError{uebungsblatt}{Unbekannte Code-Sprache '#2'. Erlaubt:
      python, c, cpp, asm, x86, verilog, vhdl, matlab, text}{}\def\ub@cl{}\fi
    \ifx\ub@ct\@empty\ifx\ub@cl\@empty\else\pgfkeysalso{/tcb/ub codestreifen}\fi
    \else\pgfkeysalso{/tcb/ub codestreifen}\fi},
  ub codestreifen/.style={top=8mm,
    overlay unbroken and first={%
      \draw[ohmBorder,line width=\ub@lw]
        ([yshift=-6mm]frame.north west) -- ([yshift=-6mm]frame.north east);
      \node[anchor=north west,inner sep=0pt,font=\ub@code\footnotesize\bfseries,text=ohmForeground]
        at ([yshift=-1.8mm]frame.north west) {\ub@ct};
      \node[anchor=north east,inner sep=0pt,font=\footnotesize,text=ohmMutedForeground]
        at ([yshift=-1.8mm]frame.north east) {\ub@cl};}}}

\NewTCBListing{codeblock}{O{} m}{ub codebox,listing options={style=ub-#2},ub codekopf={#1}{#2}}
\NewTCBInputListing{\codedatei}{O{} m m}{ub codebox,listing options={style=ub-#2},
  listing file={#3},ub codekopf={#1}{#2}}
\newcommand\code{\lstinline[style=ub inline]}
\newcommand\codetext[1]{{\ub@code #1}}

% =====================================================================
% 13. Antwortformate
% =====================================================================
% Kästchen und Kreise 16 px mit 1,5 px Rand, Kästchen mit Radius 4 px
\tikzset{ub kaestchen/.style={draw=ohmForeground,line width=1.1pt,rounded corners=1.06mm}}
\newcommand\kaestchen{%
  \tikz[baseline=0pt]\draw[ub kaestchen] (0,-0.9mm) rectangle (4.2mm,3.3mm);}
\newcommand\kreis{%
  \tikz[baseline=0pt]\draw[ohmForeground,line width=1.1pt] (2.1mm,1.2mm) circle (2.1mm);}

% ---- antworten: Multiple/Single Choice -------------------------------
\pgfkeys{/ub/aw/.is family,/ub/aw,
  spalten/.store in=\ub@aw@spalten, typ/.store in=\ub@aw@typ}
\newcounter{ubantwortpos}
\newlength\ub@aw@breite
\NewDocumentEnvironment{antworten}{O{}}{%
  \def\ub@aw@spalten{1}\def\ub@aw@typ{mehrfach}%
  \pgfkeys{/ub/aw,#1}%
  \setcounter{ubantwortpos}{0}%
  \setlength\ub@aw@breite{\dimexpr(\linewidth-6mm*(\ub@aw@spalten-1))/\ub@aw@spalten\relax}%
  \par\vspace{2mm}\rightskip\z@skip\noindent\ignorespaces}{%
  \par\vspace{1mm}}
% \antwort{..} = Antwortmöglichkeit, \antwort*{..} = richtige Antwort
% (wird nur im Lösungsmodus markiert)
\NewDocumentCommand\antwort{s m}{%
  \ifnum\value{ubantwortpos}=\ub@aw@spalten
    \par\vspace{2.4mm}\noindent\setcounter{ubantwortpos}{0}%
  \else\ifnum\value{ubantwortpos}>0 \hspace{6mm}\fi\fi
  \stepcounter{ubantwortpos}%
  \parbox[t]{\ub@aw@breite}{\raggedright\hangindent=7.5mm\hangafter=1\noindent
    \makebox[7.5mm][l]{\ifnum\pdfstrcmp{\ub@aw@typ}{einfach}=0
        \ifloesung\IfBooleanTF{#1}{\kreisvoll}{\kreis}\else\kreis\fi
      \else
        \ifloesung\IfBooleanTF{#1}{\kaestchenkreuz}{\kaestchen}\else\kaestchen\fi
      \fi}%
    \ifloesung\IfBooleanTF{#1}{\ub@richtig{#2}}{#2}\else#2\fi}\ignorespaces}
% richtige Antwort im Lösungsvorschlag: fett und rot
\newcommand\ub@richtig[1]{{\bfseries\color{ohmDestructive}\ignorespaces#1}}

% ---- ankreuzen: Richtig/Falsch-Tabelle --------------------------------
\newcounter{aussage}
\newlength\ub@kreuzbreite \setlength\ub@kreuzbreite{17mm}
\newcommand*\ub@aussagepkt{0}
\newcommand\ub@zeilenoben{\rule{0pt}{\dimexpr\ht\strutbox+2.6mm\relax}}
\newcommand\ub@zeilenunten{\rule[-2.6mm]{0pt}{0pt}}
% \aussage[r]{..} richtige, \aussage[f]{..} falsche Aussage
% (Markierung und Punkte je Aussage erscheinen nur im Lösungsmodus)
\NewDocumentCommand\aussage{o m}{%
  \stepcounter{aussage}\ub@addpkt{\ub@aussagepkt}%
  \IfValueTF{#1}{\xdef\ub@rf{\expandafter\@car#1\@nil}}{\gdef\ub@rf{n}}%
  \ub@zeilenoben{\color{ohmMutedForeground}\alph{aussage})} &
  \ub@zeilenoben #2\ub@zeilenunten &
  \ub@zeilenoben\ub@rfkasten{r} & \ub@zeilenoben\ub@rfkasten{f} &
  \ub@zeilenoben\ifloesung{\footnotesize\ub@mono\color{ohmDestructive}\ub@zahl{\ub@aussagepkt}}\fi\\
  \ub@tablinie{ohmBorder}}
\newcommand\ub@rfkasten[1]{%
  \ifloesung\if#1\ub@rf\kaestchenkreuz\else\kaestchen\fi\else\kaestchen\fi}
\NewDocumentEnvironment{ankreuzen}{O{1}}{%
  \xdef\ub@aussagepkt{\fpeval{#1}}\setcounter{aussage}{0}%
  \par\vspace{2mm}\noindent
  \setlength\tabcolsep{0pt}%
  \begin{tabular}{@{}p{7mm}
    p{\dimexpr\linewidth-7mm-2\ub@kreuzbreite-10mm\relax}
    >{\centering\arraybackslash}p{\ub@kreuzbreite}
    >{\centering\arraybackslash}p{\ub@kreuzbreite}
    >{\raggedleft\arraybackslash}p{10mm}@{}}
  & Aussage & richtig & falsch & \rule[-2.4mm]{0pt}{0pt}\\
  \ub@tablinie{ohmForeground}%
}{%
  \noalign{\vskip-\ub@lw}\ub@tablinie{ohmForeground}%
  \end{tabular}\par}

% ---- zuordnung: Elemente durch Linien verbinden -----------------------
\newcounter{ubzuordnung}
\newcounter{ubzeile}
\newcommand\ub@punkt[1]{\tikz[remember picture,baseline=0pt]
  \node[circle,fill=ohmForeground,inner sep=0pt,minimum size=3.2pt] (#1) at (0,0.65ex) {};}
\newcommand\ub@zlinien{%
  \begin{tikzpicture}[remember picture,overlay]
    \def\ub@zlinie##1##2{\draw[loesung,shorten <=2.5pt,shorten >=2.5pt]
      (zl-\arabic{ubzuordnung}-##1) -- (zr-\arabic{ubzuordnung}-##2);}%
    \ub@zpaare
  \end{tikzpicture}}
\NewDocumentEnvironment{zuordnung}{O{} O{}}{%
  \stepcounter{ubzuordnung}\setcounter{ubzeile}{0}\gdef\ub@zpaare{}%
  \par\vspace{2mm}\noindent
  \setlength\tabcolsep{0pt}\renewcommand\arraystretch{1.15}%
  \begin{tabular}{@{}>{\raggedleft\arraybackslash}p{\dimexpr0.5\linewidth-18mm\relax}
    @{\hspace{3mm}}c@{\hspace{26mm}}c@{\hspace{3mm}}
    >{\raggedright\arraybackslash}p{\dimexpr0.5\linewidth-18mm\relax}@{}}
  \IfBlankF{#1#2}{\ub@label{#1} & & & \ub@label{#2}\\[2mm]}%
}{%
  \end{tabular}\ifloesung\ub@zlinien\fi\par}
% \paar[k]{links}{rechts}: links gehört zum rechten Eintrag in Zeile k
% (Verbindungslinie erscheint nur im Lösungsmodus)
\NewDocumentCommand\paar{o m m}{%
  \stepcounter{ubzeile}%
  \IfValueT{#1}{\edef\@tempa{\noexpand\ub@zlinie{\arabic{ubzeile}}{#1}}%
    \expandafter\g@addto@macro\expandafter\ub@zpaare\expandafter{\@tempa}}%
  #2 & \ub@punkt{zl-\arabic{ubzuordnung}-\arabic{ubzeile}} &
  \ub@punkt{zr-\arabic{ubzuordnung}-\arabic{ubzeile}} & #3\\[3mm]}

% =====================================================================
% 14. Lösungen
%     Klassenoption "loesung": Lösungsvorschlag statt Aufgabenblatt.
%     Ohne die Option sind alle Lösungselemente unsichtbar. Sie sind das
%     einzige Rote auf dem Blatt: das Badge "Lösung", Ergebnisse, Teilpunkte
%     und alles, was in Abbildungen und Antwortformate eingetragen wird.
% =====================================================================
\RequirePackage{verbatim}   % zum Ausblenden der Lösungen (\comment)
\newcommand\kaestchenkreuz{%
  \tikz[baseline=0pt]{\draw[ub kaestchen] (0,-0.9mm) rectangle (4.2mm,3.3mm);
    \draw[ohmAccentRed,line width=1.5pt,line cap=round]
      (1.1mm,0.2mm) -- (3.1mm,2.2mm) (1.1mm,2.2mm) -- (3.1mm,0.2mm);}}
\newcommand\kreisvoll{%
  \tikz[baseline=0pt]{\draw[ohmForeground,line width=1.1pt] (2.1mm,1.2mm) circle (2.1mm);
    \fill[ohmAccentRed] (2.1mm,1.2mm) circle (1.05mm);}}
% Eingezeichnete Lösungen: Kurve 2 px, Hilfslinien 1 px gestrichelt, Punkt
% mit Beschriftung direkt daneben
\tikzset{loesung/.style={draw=ohmAccentRed,text=ohmDestructive,line width=1.5pt},
  loesung hilfslinie/.style={draw=ohmAccentRed,line width=0.75pt,dashed},
  % \node[loesung punkt=below:{$\tau$}] at (..) {};  Beschriftung wie bei label=
  loesung punkt/.style={circle,fill=ohmAccentRed,inner sep=0pt,minimum size=1.9mm,
    label distance=0.6mm,label={[text=ohmDestructive,font=\footnotesize]#1}},
  loesung punkt/.default={}}
% loesung: direkt unter der Teilaufgabe, eingerückt auf ihren Text. Vorn
% das rote Badge "Lösung", alles Weitere fluchtet mit dem Text dahinter.
% Rechts reicht sie bis an die Punkte der Teilaufgaben (\teilpunkt).
% Eine Lösung wird nicht geteilt (sonst stünde ein kleiner Rest allein
% mittig auf der nächsten Seite); sie darf höchstens eine Seite lang sein.
\newsavebox\ub@loesungsbox
\newlength\ub@badgebreite
\AtBeginDocument{\settowidth\ub@badgebreite{\ub@badge{loesung}{Lösung}}}
\ifloesung
  \NewDocumentEnvironment{loesung}{o}{%
    \par\addvspace{2.6mm}%
    \begin{lrbox}{\ub@loesungsbox}%
    \begin{minipage}[t]{\dimexpr\linewidth+\rightmargin\relax}%
    \ub@inloesungtrue\raggedright
    \@fleqntrue\@mathmargin\z@
    \begin{list}{}{\setlength\leftmargin{\dimexpr\ub@badgebreite+2.6mm\relax}%
      \setlength\labelwidth{\ub@badgebreite}\setlength\labelsep{2.6mm}%
      \setlength\topsep{0pt}\setlength\parsep{1.5mm}\setlength\itemsep{0pt}%
      \setlength\rightmargin{0pt}}%
    \item[\ub@badge{loesung}{Lösung}]%
    \IfValueT{#1}{\textbf{#1}\par}\ignorespaces}{%
    \end{list}%
    \end{minipage}%
    \end{lrbox}%
    \noindent\makebox[\linewidth][l]{\usebox\ub@loesungsbox}\par
    \addvspace{1mm}}
\else
  % Lösung überspringen; \end{loesung} darf eingerückt sein
  \newenvironment{loesung}{\comment}{\endcomment}
\fi
% Endergebnis: fett und rot (Argument ist Mathematik)
\newcommand\ub@ergebnis[1]{\text{\color{ohmDestructive}\boldmath
  \sisetup{reset-math-version=false,reset-text-series=false}$\displaystyle #1$}}
\newcommand\ergebnis[1]{\ifmmode\ub@ergebnis{#1}\else$\ub@ergebnis{#1}$\fi}
% Teilpunkte für das Bewertungsschema, rechtsbündig am Zeilenende
\newcommand\ub@tp[1]{{\footnotesize\ub@mono\color{ohmDestructive}\ub@zahl{#1}\,P}}
\newcommand\teilpunkt[1]{%
  \ifmmode\tag*{\ub@tp{#1}}%
  \else\unskip\nobreak\hfil\penalty50\hskip1.5em\null\nobreak\hfill\ub@tp{#1}%
    {\parfillskip=0pt\finalhyphendemerits=0\par}\fi}
% Inhalte nur im Lösungsblatt bzw. nur im Aufgabenblatt
\newcommand\nurloesung[1]{\ifloesung\expandafter\@firstofone\else\expandafter\@gobble\fi{#1}}
\newcommand\nuraufgabe[1]{\ifloesung\expandafter\@gobble\else\expandafter\@firstofone\fi{#1}}

% =====================================================================
% 15. Notation
% =====================================================================
\newcommand\kx[1]{\underline{#1}}                 % komplexe Größe
\newcommand\jj{\mathrm{j}}                         % imaginäre Einheit
\newcommand\ee{\mathrm{e}}                         % Eulersche Zahl
\newcommand\dd{\mathop{}\!\mathrm{d}}              % Differential
\newcommand\basis[2]{\ensuremath{\mathrm{#1}_{#2}}}% Zahl zur Basis
\newcommand\laplace[1]{\mathcal{L}\left\{#1\right\}}
\newcommand\laplaceinv[1]{\mathcal{L}^{-1}\left\{#1\right\}}
\newcommand\punkte[1]{{\color{ohmMutedForeground}({\ub@mono\ub@zahl{#1}\,P})}}

% =====================================================================
% 16. Deckblatt (wird automatisch erzeugt)
%     Titel (das Fach) 46 px fett, darunter "Übungsblatt · n Aufgaben ·
%     m Punkte". Links "Auf einen Blick" (200 px), rechts die Aufgaben als
%     Tabelle mit leerer Spalte "Erreicht" und die Hinweise. Überschriften
%     mit einer roten 2-px-Linie darunter.
% =====================================================================
\newcommand\ub@deckkopf[1]{%
  {\small\bfseries #1\par}\vspace{1.6mm}{\color{ohmAccentRed}\hrule\@height1.5pt}}
\newcommand\ub@deckstrut{\rule[-2.3mm]{0pt}{7.4mm}}
\newcommand\ub@listenzeile[3]{%
  \ub@deckstrut{\ub@mono #1} & #2 & {\ub@mono\ub@zahl{#3}} & \\
  \ub@tablinie{ohmBorder}}
\newif\ifub@ersteblick
\newcommand\ub@blick[2]{% #1 = Bezeichnung, #2 = Wert
  \ifub@ersteblick\global\ub@ersteblickfalse\else\ub@hlinie{ohmBorder}\fi
  \vspace{2.6mm}%
  {\footnotesize\color{ohmMutedForeground}#1\par}\vspace{0.4mm}%
  {\raggedright #2\par}\vspace{2.6mm}}
\newcommand\ub@grosszahl[1]{{\fontsize{13.5}{17}\selectfont\ub@mono #1}}
\DeclareRobustCommand\ub@hinweispunkt{\tikz[baseline=-0.6ex]\fill[ohmRing] (0,0) circle (0.8mm);}
\newcommand\ub@deckblattsetzen{%
  \thispagestyle{deckblatt}%
  \ifub@zentriert\else\null\vspace{19mm}\fi
  {\fontsize{34.5}{37}\selectfont\bfseries\raggedright\textls[-25]{\ub@fach}\par}%
  \vspace{3.2mm}%
  {\fontsize{13.5}{17}\selectfont\color{ohmMutedForeground}Übungsblatt
    \textperiodcentered\ \ifx\ub@anzahlaux\@empty ??\else\ub@anzahlaux\fi\
    \ifnum0\ub@anzahlaux=1 Aufgabe\else Aufgaben\fi\
    \textperiodcentered\ \ifx\ub@gesamtaux\@empty ??~Punkte\else
      \ub@zahl{\ub@gesamtaux}~\ub@punktewort{\ub@gesamtaux}\fi\par}%
  \vspace{14.8mm}%
  \noindent
  \begin{minipage}[t]{53mm}
    \setlength\parskip{0pt}\vspace{0pt}%
    \ub@deckkopf{Auf einen Blick}%
    \global\ub@ersteblicktrue
    \ifx\ub@zeit\@empty\else\ub@blick{Bearbeitungszeit}{\ub@grosszahl{\ub@zeit}}\fi
    \ub@blick{Gesamtpunkte}{\ub@grosszahl{\ifx\ub@gesamtaux\@empty ??\else
      \ub@zahl{\ub@gesamtaux}\fi}}%
    \ub@blick{Aufgaben}{\ub@grosszahl{\ifx\ub@anzahlaux\@empty ??\else\ub@anzahlaux\fi}}%
    \ifx\ub@hilfsmittel\@empty\else\ub@blick{Hilfsmittel}{\ub@hilfsmittel}\fi
    \ub@blick{Erstellt}{{\ub@mono\ubdatum\ \ubuhrzeit}}%
  \end{minipage}\hspace{10.6mm}%
  \begin{minipage}[t]{\dimexpr\linewidth-63.6mm\relax}
    \setlength\parskip{0pt}\vspace{0pt}%
    \setlength\tabcolsep{2.6mm}%
    \begin{tabular}{@{\hspace{2.6mm}}p{7.5mm}
        >{\raggedright\arraybackslash}p{\dimexpr\linewidth-55.8mm\relax}
        >{\raggedleft\arraybackslash}p{11.8mm}
        >{\raggedleft\arraybackslash}p{15.8mm}@{\hspace{2.6mm}}}
      \rule[-3mm]{0pt}{9mm}Nr. & Aufgabe & Punkte & Erreicht\\
      \ub@tablinie{ohmForeground}%
      \ifx\ub@liste\@empty
        \ub@deckstrut & {\color{ohmMutedForeground}(erneut kompilieren)} & & \\
        \ub@tablinie{ohmBorder}%
      \else\ub@liste\fi
      \noalign{\vskip-\ub@lw}\ub@tablinie{ohmForeground}%
      \ub@deckstrut & \textbf{Summe} &
        \textbf{\ub@mono\ifx\ub@gesamtaux\@empty ??\else\ub@zahl{\ub@gesamtaux}\fi} &
        \raisebox{-1mm}{\color{ohmAccentRed}\rule{15.8mm}{1.5pt}}\\
    \end{tabular}\par
    \ifx\ub@hinweise\@empty\else
      \vspace{10.6mm}%
      \ub@deckkopf{Hinweise}\vspace{2.6mm}%
      {\raggedright
      \begin{itemize}[leftmargin=4.2mm,labelsep=2.6mm,itemsep=1.6mm,parsep=0pt,
          topsep=0pt,label=\ub@hinweispunkt]
        \ub@hinweise
      \end{itemize}}%
    \fi
  \end{minipage}
  \clearpage}
\AddToHook{begindocument/end}{\ifub@deckblatt\ub@deckblattsetzen\fi}

\endinput
