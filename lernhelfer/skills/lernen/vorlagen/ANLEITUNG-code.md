# Anleitung: Code

Teil der Anleitung zur LaTeX-Vorlage `uebungsblatt.cls`. Lies zuerst
`ANLEITUNG.md`; ihre Regeln gelten auch hier, vor allem die Goldenen Regeln
(Kapitel 2) und die gemeinsamen Regeln für Abbildungen (Kapitel 7).

---

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

### Häufige Fehler

| Problem | Ursache / Lösung |
|---|---|
| „Missing $ inserted“ bei `\codetext` | `_` nicht maskiert: `\codetext{LED\_PIN}`. |
| „Unbekannte Code-Sprache“ | Sprache nicht in der Liste; `text` verwenden. |
| Code in `nebeneinander` / `\antwort` geht kaputt | Codeblöcke nur direkt in der Aufgabe oder in `teilaufgaben`; in Argumenten `\codetext`. |
| `\end{codeblock}` wird nicht erkannt | Muss allein am Zeilenanfang stehen. |
