# Anleitung: Digitaltechnik

Teil der Anleitung zur LaTeX-Vorlage `uebungsblatt.cls`. Lies zuerst
`ANLEITUNG.md`; ihre Regeln gelten auch hier, vor allem die Goldenen Regeln
(Kapitel 2) und die gemeinsamen Regeln für Abbildungen (Kapitel 7).

---

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

### Lösungen in Zeitdiagrammen und KV-Diagrammen

* `\nurloesung` geht **nicht** in den Zeilen von `zeitdiagramm`.
  Stattdessen in der `loesung` das vollständige Zeitdiagramm wiederholen,
  die gesuchte Zeile mit `[loesung]` beginnen:

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

### Häufige Fehler

| Problem | Ursache / Lösung |
|---|---|
| Zeitdiagramm verrutscht | Alle Zeilen müssen dieselbe Gesamtlänge haben. |
| Zeitdiagramm-Fehler mit `\nurloesung` | In `zeitdiagramm` nicht möglich; vollständige Kopie in die `loesung`. |
