# Anleitung: Schaltungen

Teil der Anleitung zur LaTeX-Vorlage `uebungsblatt.cls`. Lies zuerst
`ANLEITUNG.md`; ihre Regeln gelten auch hier, vor allem die Goldenen Regeln
(Kapitel 2) und die gemeinsamen Regeln für Abbildungen (Kapitel 7).

---

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

* Die Schaltzeichen folgen DIN EN 60617 und sind voreingestellt. Nimm nur
  die hier genannten, andere Namen aus circuitikz zeichnen teils
  amerikanische Symbole (z. B. `op amp` als Dreieck, `ammeter` mit Pfeil).
* Zweipole mit `to[..]`: `R` Widerstand, `C` Kondensator, `L` Spule
  (gefülltes Rechteck), `V` Spannungsquelle, `I` Stromquelle, `sV`
  Wechselspannungsquelle, `battery1`, `D` Diode, `led`, `zD` Z-Diode, `vR`
  verstellbarer Widerstand, `lamp`, `fuse`, `nos`/`ncs` Schalter, `short`
  Leitung, `open` offene Klemmen.
* Messgeräte: `to[rmeter, t=A]` Strommesser, `to[rmeter, t=V]`
  Spannungsmesser.
* Beschriftungen: `l=` (Bauteilname), `l_=` (andere Seite), `v=` / `v^=`
  Spannungspfeil (gerade, neben dem Bauteil), `i=` / `i>_=` Strompfeil,
  `a=` Wert.
* Anschlüsse: `*-*` Knotenpunkte, `o-o` Klemmen, z. B. `to[R, o-*]`.
* Einpolige Symbole: `node[ground]{}`, `node[vcc]{$+\qty{5}{V}$}`.
* Dreipole: Operationsverstärker `node[en amp] (OP) {}` (Rechteck mit
  ▷∞, invertierender Eingang oben, mit `en amp, noinv input up` unten) mit
  Anschlüssen `(OP.-)`, `(OP.+)`, `(OP.out)`; Transistoren `node[npn] (T) {}`
  mit `(T.B)`, `(T.C)`, `(T.E)`; `nmos`, `pmos`; Transformator
  `node[transformer core] (T) {}` mit `(T.A1)`, `(T.A2)` links und `(T.B1)`,
  `(T.B2)` rechts.
* **Logikgatter** (Rechteckform, Negation als Kreis): `node[and port] (U) {}`,
  `or port`, `not port`, `nand port`, `nor port`, `xor port`;
  Eingänge `(U.in 1)`, `(U.in 2)`, Ausgang `(U.out)`. Siehe Aufgabe 3 in
  `beispiel.tex`.
* Soll etwas eingezeichnet werden (Zählpfeile, Ströme), das Schaltbild
  ohne diese Elemente zeichnen und in der Teilaufgabe dazu auffordern.
