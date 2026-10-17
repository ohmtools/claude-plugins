% =====================================================================
%  uebungsblatt.cls  –  Vorlage für Übungsblätter zur Prüfungsvorbereitung
% ---------------------------------------------------------------------
%  Ausführliche Anleitung mit Beispielen: ANLEITUNG.md
%  Vollständiges Beispiel:                beispiel.tex
%  Leeres Grundgerüst:                    uebungsblatt.tex
%
%  Kompilieren: pdfLaTeX, am einfachsten mit  sh build.sh [name]
%  (erzeugt aus EINER Datei Aufgabenblatt und Lösungsvorschlag;
%  Gesamtpunkte, Aufgabenliste und "Seite x / y" brauchen 2 Durchläufe.)
%
%  GRUNDREGEL: Das Design ist vollständig in dieser Datei festgelegt.
%  Im Dokument nur die hier aufgeführten Befehle verwenden, keine
%  eigenen Farben, Schriftgrößen, Abstände oder \newpage/\vspace.
%
%  ---- KURZREFERENZ ---------------------------------------------------
%  Klassenoptionen:  ohnedeckblatt, aufgabenoben, loesung
%
%  Präambel:  \fach{..} \blatt{..} \untertitel{..} \kopfzusatz{..}
%             \bearbeitungszeit{..} \hilfsmittel{..} \hinweis{..}
%             \akzentfarbe{HEX}
%
%  Struktur:  \begin{aufgabe}[Punkte]{Titel} ... \end{aufgabe}
%             \begin{teilaufgaben} \teil{Punkte} Text ... \end{teilaufgaben}
%             \begin{gegeben} \wert{U_0 = \qty{12}{V}} \gesucht{I_1} \end{gegeben}
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
%             TikZ/pgfplots-Stil für eingezeichnete Lösungen: [loesung]
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
\IfFileExists{ngerman.ldf}
  {\RequirePackage[ngerman]{babel}}
  {\RequirePackage[provide=*,ngerman]{babel}}
\RequirePackage[a4paper,left=17mm,right=17mm,top=27mm,bottom=26mm,
  headheight=15pt,headsep=9mm,footskip=13mm]{geometry}
\RequirePackage[table]{xcolor}
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
%    Text: IBM Plex Sans (Paket "plex"), sonst Helvetica.
%    Code: IBM Plex Mono, sonst TX-Typewriter, sonst Courier.
% =====================================================================
\IfFileExists{plex-sans.sty}{%
  \RequirePackage[sfdefault]{plex-sans}%
}{%
  \ClassWarningNoLine{uebungsblatt}{IBM Plex Sans nicht gefunden, verwende Helvetica}%
  \RequirePackage[scaled=0.92]{helvet}%
  \renewcommand\familydefault{\sfdefault}%
}
\IfFileExists{plex-mono.sty}{%
  \RequirePackage[scale=0.95]{plex-mono}%
  \newcommand\ub@mono{\ttfamily}%
}{%
  \IfFileExists{t1xtt.fd}{\renewcommand\ttdefault{txtt}}{\RequirePackage{courier}}%
  \newcommand\ub@mono{\sffamily}%
}
\newcommand\ub@code{\ttfamily}
\RequirePackage[italic,defaultmathsizes]{mathastext}
\RequirePackage[letterspace=90]{microtype}
% keine Ligaturen in Schreibmaschinenschrift (sonst wird << zu «, -- zu –)
\DisableLigatures[<,>,-,`,']{encoding = T1, family = tt*}

\sisetup{output-decimal-marker={,}, mode=match, per-mode=symbol,
  exponent-product=\cdot}
% Omega für \ohm aus Computer Modern Sans (T1-Textschriften haben kein Omega)
\DeclareSymbolFont{ubgriech}{OT1}{cmss}{m}{n}
\DeclareMathSymbol{\ub@Omega}{\mathord}{ubgriech}{"0A}
\DeclareSIUnit\ohm{\ub@Omega}

% =====================================================================
% 3. Farben (nur über \akzentfarbe ändern)
% =====================================================================
\definecolor{ubakzent}{HTML}{2450B8}
\definecolor{ubtinte}{HTML}{15171C}
\definecolor{ubgrau}{HTML}{5A6170}
\definecolor{ublinie}{HTML}{C9CED7}
\definecolor{ubhell}{HTML}{E1E4EA}
\definecolor{ubflaeche}{HTML}{F3F5F8}
\definecolor{ubteal}{HTML}{0F7B6C}
\definecolor{uborange}{HTML}{C2410C}
\definecolor{ubloesung}{HTML}{0F7B6C}   % Farbe aller Lösungselemente
\newcommand\akzentfarbe[1]{\definecolor{ubakzent}{HTML}{#1}}

% =====================================================================
% 4. Metadaten (Präambel)
% =====================================================================
\newcommand*\ub@fach{Übungsblatt}
\newcommand*\ub@blatt{}
\newcommand*\ub@untertitel{}
\newcommand*\ub@kopfzusatz{Prüfungsvorbereitung}
\newcommand*\ub@zeit{}
\newcommand*\ub@hilfsmittel{}
\newcommand*\ub@hinweise{}
\newcommand\fach[1]{\renewcommand*\ub@fach{#1}}
\newcommand\blatt[1]{\renewcommand*\ub@blatt{#1}}
\newcommand\untertitel[1]{\renewcommand*\ub@untertitel{#1}}
\newcommand\kopfzusatz[1]{\renewcommand*\ub@kopfzusatz{#1}}
\newcommand\bearbeitungszeit[1]{\renewcommand*\ub@zeit{#1}}
\newcommand\hilfsmittel[1]{\renewcommand*\ub@hilfsmittel{#1}}
\newcommand\hinweis[1]{\g@addto@macro\ub@hinweise{\item #1}}
\newcommand\ub@blattname{Übungsblatt\ifx\ub@blatt\@empty\else\ \ub@blatt\fi}
\newcommand\ub@kopfname{\ub@blattname\ifloesung\ \textperiodcentered\ Lösung\fi}

% =====================================================================
% 5. Interne Stilbausteine
% =====================================================================
\newcommand\ub@zahl[1]{\num{#1}}
\newcommand\ub@kicker[1]{\leavevmode{\ub@mono\footnotesize\bfseries\color{ubakzent}\textls{\MakeUppercase{#1}}}}
\newcommand\ub@label[1]{\leavevmode{\scriptsize\bfseries\color{ubgrau}\textls[60]{\MakeUppercase{#1}}}}
\newcommand\ub@punktewort[1]{\ifnum\fpeval{#1==1}=1 Punkt\else Punkte\fi}
\newcommand\ub@unterschrift[2]{% #1 = Kürzel (Abb./Tab.), #2 = Text
  {\small\color{ubgrau}#1: #2}}

\setlength\parindent{0pt}
\setlength\parskip{2mm plus 1mm}
\AddToHook{begindocument/end}{\color{ubtinte}}

% =====================================================================
% 6. Kopf- und Fußzeilen
% =====================================================================
\pagestyle{fancy}
\fancyhf{}
\renewcommand\headrulewidth{1.2pt}
\renewcommand\footrulewidth{0.5pt}
\renewcommand\headrule{{\color{ubtinte}\hrule\@height\headrulewidth\@width\headwidth}\vskip-\headrulewidth}
\renewcommand\footrule{{\color{ublinie}\hrule\@height\footrulewidth\@width\headwidth}\vskip\footruleskip}
\newcommand\ub@fuss{%
  \fancyfoot[L]{\ub@mono\footnotesize\color{ubgrau}\ub@kopfname\ \textperiodcentered\ \ub@fach}%
  \fancyfoot[R]{\ub@mono\footnotesize\color{ubgrau}Seite \thepage\ / \pageref{LastPage}}}
\fancyhead[L]{\ub@kicker{\ub@kopfname}}
\fancyhead[R]{\footnotesize\color{ubgrau}\ub@fach}
\ub@fuss
\fancypagestyle{deckblatt}{%
  \fancyhf{}%
  \fancyhead[L]{\ub@kicker{\ub@kopfname}}%
  \fancyhead[R]{\ub@mono\footnotesize\color{ubgrau}\ub@kopfzusatz}%
  \ub@fuss}

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
      \ub@zahl{\@tempa}~\ub@punktewort{\@tempa}%
    \else ?? Punkte\fi
  \else
    \ub@zahl{\ub@pktfest}~\ub@punktewort{\ub@pktfest}%
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
\newcommand\ub@nummer[1]{%
  \begin{tikzpicture}[baseline=(n.base)]
    \node[fill=ubakzent,text=white,rounded corners=1.8pt,minimum size=7.2mm,
          inner sep=0pt,font=\ub@mono\bfseries\small] (n) {#1};
  \end{tikzpicture}}

\NewDocumentEnvironment{aufgabe}{o m}{%
  \clearpage
  \refstepcounter{aufgabe}%
  \gdef\ub@pkt{0}%
  \IfNoValueTF{#1}{\gdef\ub@pktfest{}}{\xdef\ub@pktfest{\fpeval{#1}}}%
  \par\noindent
  \ub@nummer{\arabic{aufgabe}}\hspace{3mm}%
  {\large\bfseries #2}\hfill{\ub@mono\small\ub@kopfpunkte}\par
  \vspace{1.5mm}%
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

% Teilaufgaben a), b), ... mit Punkten am rechten Rand
\newlist{teilaufgaben}{enumerate}{1}
\setlist[teilaufgaben]{label=\textbf{\alph*)},leftmargin=7mm,labelwidth=5mm,
  labelsep=2mm,align=left,rightmargin=14mm,itemsep=2.5mm,parsep=1.5mm,topsep=3mm}
\newcommand\ub@randpunkte[1]{%
  \leavevmode\rlap{\hskip\linewidth\hskip\rightmargin
        \llap{\ub@mono\small\color{ubgrau}\ub@zahl{#1}\,P}}}
\newcommand\teil[1]{\item\ub@addpkt{#1}\ub@randpunkte{#1}\ignorespaces}

% =====================================================================
% 9. Boxen: gegeben/gesucht, hinweisbox
% =====================================================================
\tcbset{ub box/.style={enhanced,colback=ubflaeche,colframe=ubflaeche,boxrule=0pt,
  arc=1.2mm,left=4mm,right=4mm,top=3mm,bottom=3mm,before skip=3mm,after skip=3mm,
  before upper={\setlength\parskip{1.5mm}}}}

\NewDocumentEnvironment{gegeben}{}{%
  \begin{tcolorbox}[ub box]\raggedright\ub@label{Gegeben}\par\vspace{0.5mm}}{%
  \end{tcolorbox}}
\newcommand\wert[1]{\mbox{$#1$}\hspace{8mm plus 2mm minus 2mm}\ignorespaces}
\newcommand\gesucht[1]{\par\vspace{1.5mm}\ub@label{Gesucht}\par\vspace{0.5mm}%
  $#1$\par}

\NewDocumentEnvironment{hinweisbox}{O{Hinweis}}{%
  \begin{tcolorbox}[ub box]\ub@label{#1}\par\vspace{0.5mm}}{%
  \end{tcolorbox}}

% =====================================================================
% 10. Zwei Spalten: \begin{nebeneinander}[Anteil links] links \spalte rechts
% =====================================================================
\newcommand\spalte{\ClassError{uebungsblatt}{\string\spalte\space nur innerhalb von nebeneinander}{}}
\def\ub@nb#1#2\spalte#3\spalte#4\@nil{%
  \par\vspace{2mm}\noindent
  \begin{minipage}[t]{\dimexpr#1\linewidth-3mm\relax}\vspace{0pt}#2\end{minipage}\hfill
  \begin{minipage}[t]{\dimexpr\linewidth-#1\linewidth-3mm\relax}\vspace{0pt}#3\end{minipage}%
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
    \ifub@inloesung{\small\color{ubgrau}#1}\else
    \refstepcounter{ubabbildung}%
    \ub@unterschrift{Abb.~\theubabbildung}{#1}\fi}%
  \end{center}\vspace{1mm}}

\NewDocumentCommand\bild{O{0.6} m m}{%
  \begin{abbildung}{#3}\includegraphics[width=#1\linewidth]{#2}\end{abbildung}}

% Gemeinsame TikZ-Stile (in allen Zeichnungsumgebungen nutzbar)
\tikzset{
  ub zeichnung/.style={line width=0.8pt,>={Latex[length=2.4mm]},font=\small,
    every node/.append style={text=ubtinte}},
  % Blockdiagramme / Regelkreise
  block/.style={draw,rectangle,minimum width=16mm,minimum height=10mm,
    align=center,fill=white},
  summe/.style={draw,circle,minimum size=5.5mm,inner sep=0pt,fill=white},
  verzweigung/.style={circle,fill=ubtinte,inner sep=1.4pt},
  % Graphen
  knoten/.style={draw,circle,minimum size=8mm,inner sep=1pt,fill=white},
  gewicht/.style={font=\footnotesize,fill=white,inner sep=1.5pt},
  % Hervorhebung
  markiert/.style={draw=ubakzent,fill=ubakzent!12,text=ubtinte},
  akzent/.style={color=ubakzent},
  hilfslinie/.style={draw=ublinie,line width=0.5pt,dashed},
}

\NewDocumentEnvironment{zeichnung}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,#1]}{%
  \end{tikzpicture}\end{abbildung}}

\ctikzset{bipoles/thickness=1, monopoles/ground/width=0.25}
\NewDocumentEnvironment{schaltung}{O{} m}{%
  \begin{abbildung}{#2}\begin{circuitikz}[line width=0.7pt,font=\small,#1]}{%
  \end{circuitikz}\end{abbildung}}

\NewDocumentEnvironment{blockdiagramm}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,node distance=14mm,
    every path/.append style={->},#1]}{%
  \end{tikzpicture}\end{abbildung}}

\NewDocumentEnvironment{automat}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,node distance=30mm,auto,
    every state/.style={draw,circle,minimum size=11mm,inner sep=1pt,fill=white,
      line width=0.8pt},
    accepting/.style={double,double distance=1.6pt},
    initial text={},every edge/.append style={->},#1]}{%
  \end{tikzpicture}\end{abbildung}}

\NewDocumentEnvironment{knotengraph}{O{} m}{%
  \begin{abbildung}{#2}\begin{tikzpicture}[ub zeichnung,node distance=22mm,#1]}{%
  \end{tikzpicture}\end{abbildung}}

% ---- Diagramme (pgfplots) -------------------------------------------
\pgfplotscreateplotcyclelist{ub farben}{%
  {ubakzent,mark=none},{ubteal,mark=none},{uborange,mark=none},
  {ubgrau,dashed,mark=none}}
\pgfplotsset{/pgf/number format/use comma,/pgf/number format/1000 sep={\,},
  ub achsen/.style={width=0.78\linewidth,height=0.44\linewidth,
    axis line style={ubtinte,line width=0.6pt},tick style={ubtinte},
    tick label style={font=\small},label style={font=\small},
    title style={font=\small\bfseries},
    grid=major,grid style={ubhell,line width=0.4pt},
    cycle list name=ub farben,
    every axis plot/.append style={line width=1.1pt},
    legend style={draw=none,fill=white,fill opacity=0.85,text opacity=1,font=\small},
    legend cell align=left},
  ub skizze/.style={ub achsen,axis lines=middle,
    axis line style={-{Latex[length=2.2mm]}},grid=both,minor tick num=1,
    minor grid style={ubhell!55,line width=0.3pt},
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
      timing/font=\small,timing/z/.style={ubgrau},timing/x/.style={uborange},
      timing/u/background/.style={fill=ubhell},timing/d/text/.style={font=\scriptsize},#1]
    #3
    \extracode
    \begin{background}[draw=ubhell,line width=0.4pt]\vertlines{}\end{background}
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
      \node[font=\ub@mono\small,text=ubgrau] at (-0.5,-\r-0.5) {\ub@kv@kopf{\ub@kv@R}{\r}};
      \foreach \c in {0,...,\ub@kv@Cm}{%
        \edef\m{\the\numexpr\ub@kv@g{\r}*\ub@kv@C+\ub@kv@g{\c}\relax}%
        \draw[ublinie] (\c,-\r) rectangle ++(1,-1);
        \ifub@kv@idx
          \node[font=\ub@mono\tiny,text=ubgrau,anchor=north east,inner sep=1.2pt]
            at (\c+1,-\r) {\m};\fi
        \ifub@kv@leer\else
          \edef\ub@tmp{\noexpand\in@{,\m,}{\ub@kv@x}}\ub@tmp
          \ifin@ \node[font=\ub@mono] at (\c+0.5,-\r-0.5) {X};%
          \else
            \edef\ub@tmp{\noexpand\in@{,\m,}{\ub@kv@eins}}\ub@tmp
            \ifin@ \node[font=\ub@mono\bfseries] at (\c+0.5,-\r-0.5) {1};%
            \else \node[font=\ub@mono,text=ubgrau] at (\c+0.5,-\r-0.5) {0};\fi
          \fi
        \fi
      }%
    }%
    \foreach \c in {0,...,\ub@kv@Cm}{%
      \node[font=\ub@mono\small,text=ubgrau] at (\c+0.5,0.5) {\ub@kv@kopf{\ub@kv@C}{\c}};}
    \draw[ubtinte,line width=0.9pt] (0,0) rectangle (\ub@kv@C,-\ub@kv@R);
    \draw[ubtinte,line width=0.6pt] (-1,1) -- (0,0);
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
      \draw[ubtinte,fill=white] (\i,0) rectangle ++(1,1);
      \node[font=\ub@mono\scriptsize] at (\i+0.5,0.5) {\b};
      \pgfmathtruncatemacro\nr{\ub@reg@hb-\i}%
      \node[font=\ub@mono\scriptsize,text=ubgrau] at (\i+0.5,1.35) {\nr};}
    \node[anchor=east,font=\small\bfseries] at (-0.15,0.5) {#2};
  \end{tikzpicture}%
  \endgroup}

% ---- Tabellen -------------------------------------------------------
\setlength\heavyrulewidth{0.9pt}
\setlength\lightrulewidth{0.5pt}
\NewDocumentEnvironment{tabelle}{m m}{%
  \par\vspace{3mm}\begin{center}\renewcommand\arraystretch{1.25}%
  \begin{tabular}{#1}\arrayrulecolor{ubtinte}\toprule}{%
  \arrayrulecolor{ubtinte}\bottomrule\end{tabular}%
  \IfBlankF{#2}{\par\vspace{2mm}%
    \ifub@inloesung{\small\color{ubgrau}#2}\else
    \refstepcounter{ubtabelle}%
    \ub@unterschrift{Tab.~\theubtabelle}{#2}\fi}%
  \end{center}\vspace{1mm}}
\newcommand\trennlinie{\arrayrulecolor{ublinie}\midrule}

% =====================================================================
% 12. Code
% =====================================================================
\lstdefinestyle{ub basis}{%
  basicstyle=\ub@code\small,
  keywordstyle=\color{ubakzent}\bfseries,
  keywordstyle=[2]\color{ubteal},
  commentstyle=\color{ubgrau}\itshape,
  stringstyle=\color{ubteal},
  numbers=left,numberstyle=\ub@code\scriptsize\color{ubgrau},numbersep=3.5mm,
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
    colback=ubflaeche,colframe=ubflaeche,boxrule=0pt,arc=1.2mm,
    left=1mm,right=3mm,top=2mm,bottom=2mm,before skip=3mm,after skip=3mm},
  ub codekopf/.code 2 args={%
    \edef\ub@ct{\detokenize{#1}}% Titel wörtlich (Unterstriche erlaubt)
    \ifcsname ub@lang@#2\endcsname\edef\ub@cl{\csname ub@lang@#2\endcsname}%
    \else\ClassError{uebungsblatt}{Unbekannte Code-Sprache '#2'. Erlaubt:
      python, c, cpp, asm, x86, verilog, vhdl, matlab, text}{}\def\ub@cl{}\fi
    \ifx\ub@ct\@empty\ifx\ub@cl\@empty\else\pgfkeysalso{/tcb/ub codestreifen}\fi
    \else\pgfkeysalso{/tcb/ub codestreifen}\fi},
  ub codestreifen/.style={top=8mm,
    overlay unbroken and first={%
      \draw[ubhell,line width=0.5pt]
        ([xshift=2mm,yshift=-6mm]frame.north west) -- ([xshift=-2mm,yshift=-6mm]frame.north east);
      \node[anchor=north west,inner sep=0pt,font=\ub@code\footnotesize\bfseries,text=ubtinte]
        at ([xshift=4mm,yshift=-1.8mm]frame.north west) {\ub@ct};
      \node[anchor=north east,inner sep=0pt,font=\ub@mono\scriptsize\bfseries,text=ubgrau]
        at ([xshift=-4mm,yshift=-2mm]frame.north east) {\textls[60]{\MakeUppercase{\ub@cl}}};}}}

\NewTCBListing{codeblock}{O{} m}{ub codebox,listing options={style=ub-#2},ub codekopf={#1}{#2}}
\NewTCBInputListing{\codedatei}{O{} m m}{ub codebox,listing options={style=ub-#2},
  listing file={#3},ub codekopf={#1}{#2}}
\newcommand\code{\lstinline[style=ub inline]}
\newcommand\codetext[1]{{\ub@code #1}}

% =====================================================================
% 13. Antwortformate
% =====================================================================
\newcommand\kaestchen{%
  \tikz[baseline=0pt]\draw[ubtinte,line width=0.75pt,rounded corners=0.8pt]
    (0,-1.1mm) rectangle (4.4mm,3.3mm);}
\newcommand\kreis{%
  \tikz[baseline=0pt]\draw[ubtinte,line width=0.75pt] (2.2mm,1.1mm) circle (2.2mm);}

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
  \par\vspace{2mm}\noindent\ignorespaces}{%
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
    \ignorespaces#2}\ignorespaces}

% ---- ankreuzen: Richtig/Falsch-Tabelle --------------------------------
\newcounter{aussage}
\newlength\ub@kreuzbreite \setlength\ub@kreuzbreite{17mm}
\newcommand*\ub@aussagepkt{0}
\newcommand\ub@zeilenoben{\rule{0pt}{\dimexpr\ht\strutbox+2.6mm\relax}}
\newcommand\ub@zeilenunten{\rule[-2.6mm]{0pt}{0pt}}
% \aussage[r]{..} richtige, \aussage[f]{..} falsche Aussage
% (Markierung erscheint nur im Lösungsmodus)
\NewDocumentCommand\aussage{o m}{%
  \stepcounter{aussage}\ub@addpkt{\ub@aussagepkt}%
  \IfValueTF{#1}{\xdef\ub@rf{\expandafter\@car#1\@nil}}{\gdef\ub@rf{n}}%
  \ub@zeilenoben\textbf{\alph{aussage})} &
  \ub@zeilenoben #2\ub@zeilenunten &
  \ub@zeilenoben\ub@rfkasten{r} & \ub@zeilenoben\ub@rfkasten{f} \\
  \noalign{{\color{ubhell}\hrule height 0.5pt}}}
\newcommand\ub@rfkasten[1]{%
  \ifloesung\if#1\ub@rf\kaestchenkreuz\else\kaestchen\fi\else\kaestchen\fi}
\NewDocumentEnvironment{ankreuzen}{O{1}}{%
  \xdef\ub@aussagepkt{\fpeval{#1}}\setcounter{aussage}{0}%
  \par\vspace{2mm}\noindent
  \setlength\tabcolsep{0pt}%
  \begin{tabular}{@{}p{7mm}
    p{\dimexpr\linewidth-7mm-2\ub@kreuzbreite\relax}
    >{\centering\arraybackslash}p{\ub@kreuzbreite}
    >{\centering\arraybackslash}p{\ub@kreuzbreite}@{}}
  & \ub@label{Aussage} & \ub@label{Richtig} & \ub@label{Falsch}\rule[-1.6mm]{0pt}{0pt}\\
  \noalign{{\color{ubtinte}\hrule height 0.9pt}}%
}{%
  \end{tabular}\par}

% ---- zuordnung: Elemente durch Linien verbinden -----------------------
\newcounter{ubzuordnung}
\newcounter{ubzeile}
\newcommand\ub@punkt[1]{\tikz[remember picture,baseline=0pt]
  \node[circle,fill=ubtinte,inner sep=0pt,minimum size=3.2pt] (#1) at (0,0.65ex) {};}
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
%     Ohne die Option sind alle Lösungselemente unsichtbar.
% =====================================================================
\RequirePackage{verbatim}   % zum Ausblenden der Lösungen (\comment)
\newcommand\kaestchenkreuz{%
  \tikz[baseline=0pt]{\draw[ubtinte,line width=0.75pt,rounded corners=0.8pt]
      (0,-1.1mm) rectangle (4.4mm,3.3mm);
    \draw[ubloesung,line width=1.3pt,line cap=round]
      (0.9mm,-0.2mm) -- (3.5mm,2.4mm) (0.9mm,2.4mm) -- (3.5mm,-0.2mm);}}
\newcommand\kreisvoll{%
  \tikz[baseline=0pt]{\draw[ubtinte,line width=0.75pt] (2.2mm,1.1mm) circle (2.2mm);
    \fill[ubloesung] (2.2mm,1.1mm) circle (1.3mm);}}
\tikzset{loesung/.style={draw=ubloesung,text=ubloesung,line width=1.1pt}}
\newcommand\ub@loesungslabel[1]{\leavevmode
  {\scriptsize\bfseries\color{ubloesung}\textls[60]{\MakeUppercase{#1}}}}
% Lösungsboxen werden nicht geteilt (sonst stünde ein kleiner Rest allein
% mittig auf der nächsten Seite); eine Box darf höchstens eine Seite lang sein.
\tcbset{ub loesungsbox/.style={enhanced,colback=ubloesung!7,
  colframe=ubloesung!7,boxrule=0pt,arc=1.2mm,left=4mm,right=4mm,top=3mm,
  bottom=3mm,before skip=3mm,after skip=3mm,
  before upper={\setlength\parskip{1.5mm}}}}
\ifloesung
  \NewDocumentEnvironment{loesung}{O{Lösung}}{%
    \begin{tcolorbox}[ub loesungsbox]\ub@inloesungtrue
    \ub@loesungslabel{#1}\par\vspace{0.5mm}}{%
    \end{tcolorbox}}
\else
  % Lösung überspringen; \end{loesung} darf eingerückt sein
  \newenvironment{loesung}{\comment}{\endcomment}
\fi
% Endergebnis hervorheben (Argument ist Mathematik)
\newcommand\ub@ergebnis[1]{{\setlength\fboxsep{2.6pt}\setlength\fboxrule{0.9pt}%
  \fcolorbox{ubloesung}{white}{$\displaystyle #1$}}}
\newcommand\ergebnis[1]{\ifmmode\text{\ub@ergebnis{#1}}\else\ub@ergebnis{#1}\fi}
% Teilpunkte für das Bewertungsschema, rechtsbündig am Zeilenende
\newcommand\ub@tp[1]{{\ub@mono\small\color{ubloesung}\ub@zahl{#1}\,P}}
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
\newcommand\punkte[1]{{\ub@mono\small\color{ubgrau}(\ub@zahl{#1}\,P)}}

% =====================================================================
% 16. Deckblatt (wird automatisch erzeugt)
% =====================================================================
\newcommand\ub@listenzeile[3]{%
  \parbox[t]{6mm}{\leavevmode\ub@mono\bfseries\color{ubakzent}#1}%
  \parbox[t]{\dimexpr\linewidth-6mm-14mm\relax}{\raggedright #2}%
  \parbox[t]{14mm}{\raggedleft\leavevmode\ub@mono\color{ubgrau}\ub@zahl{#3}\,P}\par
  \vspace{1.6mm}{\color{ubhell}\hrule height 0.5pt}\vspace{1.6mm}}
\newcommand\ub@stat[2]{%
  \begin{minipage}[t]{0.3\linewidth}
    {\ub@mono\fontsize{21}{25}\selectfont #1}\par\vspace{0.8mm}
    {\small\color{ubgrau}#2}
  \end{minipage}}
\newcommand\ub@hinweisblock{%
  \ub@label{Hinweise}\par\vspace{3mm}
  {\small\raggedright\color{ubtinte!85}\setlength\parskip{0pt}%
  \begin{itemize}[leftmargin=4.5mm,itemsep=1.5mm,parsep=0pt,topsep=0pt,
                  label={\color{ubakzent}\textbullet}]
    \ifx\ub@hilfsmittel\@empty\else\item\textbf{Hilfsmittel:} \ub@hilfsmittel\fi
    \ub@hinweise
  \end{itemize}}}
\newcommand\ub@deckblattsetzen{%
  \thispagestyle{deckblatt}%
  \ifub@zentriert\else\null\vspace{48mm}\fi
  \tikz\fill[ubakzent,rounded corners=0.8mm] (0,0) rectangle (12mm,1.6mm);%
  \ifloesung\hspace{4mm}\tikz[baseline=-0.4mm]\node[fill=ubloesung,text=white,
    rounded corners=1mm,inner xsep=2.2mm,inner ysep=1.4mm,font=\ub@mono\scriptsize\bfseries]
    {\textls[80]{LÖSUNGSVORSCHLAG}};\fi\par
  \vspace{4mm}%
  {\fontsize{32}{37}\selectfont\bfseries\raggedright\ub@fach\par}%
  \vspace{3mm}%
  {\large\color{ubgrau}%
    \ifx\ub@untertitel\@empty
      \ifloesung Lösungsvorschlag zu \ub@blattname\else\ub@blattname\ zur Prüfungsvorbereitung\fi
    \else\ub@untertitel\fi\par}%
  \vspace{11mm}%
  {\color{ublinie}\hrule height 0.5pt}\vspace{5mm}%
  \noindent
  \ifx\ub@zeit\@empty\else\ub@stat{\ub@zeit}{Bearbeitungszeit}\hfill\fi
  \ub@stat{\ifx\ub@gesamtaux\@empty ??\else\ub@zahl{\ub@gesamtaux}\fi\ P}{Gesamtpunkte}\hfill
  \ub@stat{\ifx\ub@anzahlaux\@empty ??\else\ub@anzahlaux\fi}{Aufgaben}%
  \ifx\ub@zeit\@empty\hfill\hspace*{0.3\linewidth}\fi\par
  \vspace{5mm}{\color{ublinie}\hrule height 0.5pt}%
  \vspace{10mm}%
  \noindent
  \begin{minipage}[t]{0.48\linewidth}
    \setlength\parskip{0pt}%
    \ub@label{Aufgaben}\par\vspace{3mm}
    {\small\ifx\ub@liste\@empty\color{ubgrau}(erneut kompilieren)\else\ub@liste\fi}
  \end{minipage}\hfill
  \begin{minipage}[t]{0.44\linewidth}
    \setlength\parskip{0pt}%
    \ifx\ub@hinweise\@empty\ifx\ub@hilfsmittel\@empty\else\ub@hinweisblock\fi
    \else\ub@hinweisblock\fi
  \end{minipage}
  \clearpage}
\AddToHook{begindocument/end}{\ifub@deckblatt\ub@deckblattsetzen\fi}

\endinput
