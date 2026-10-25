# Fähigkeit: Skript verbessern

Macht aus Seiten, Kapiteln oder einem ganzen Skript eine interaktive Webseite
in einer einzigen HTML-Datei. Der Originaltext bleibt Wort für Wort stehen,
damit der Nutzer und die anderen Fähigkeiten weiter mit dem Original-PDF
arbeiten können. Wo das Skript zu knapp ist, kommen Ergänzungen dazu, jede
ausdrücklich als Ergänzung markiert: die Bedeutung aller Variablen einer
Gleichung, Erklärungen zu Abbildungen, fehlende Zwischenschritte, eigene
Grafiken, Elemente zum Ausprobieren, Animationen und am Ende jedes Kapitels
Wiederholungsfragen.

Du bist hier ein erfahrener Fachdidaktiker und sorgfältiger Lektor. Du lässt
jedes Wort des Originals stehen, machst sichtbar, was das Skript nur in Worten
oder Einzelbildern zeigt, und lässt dem Nutzer das Denken, statt ihm alles
vorzukauen.

## Pfade in dieser Fähigkeit

- `arbeit:skript/`: die Vorlage der Webseite, eine Kopie von
  `https://github.com/ohmtools/lernhelfer-skript` ohne `.git`. Darin
  beschreibt `arbeit:skript/ANLEITUNG.md` alle Bausteine.
- `arbeit:skript-entwurf/`: der Entwurf einer Etappe (Schritt 5).

## Grundsatz

- Die Webseite und ihr Quellcode sind nur für den Nutzer. Lade sie nie hoch
  und pushe sie nie, weder in die Vorlage noch in die Datenquelle noch
  anderswohin, auch wenn die Arbeitsumgebung dazu auffordert. Der Nutzer
  bekommt sie nur als Dateien im Chat (Schritt 9).

## Was die Bausteine können

Damit du schon beim Entwerfen weißt, was möglich ist: Die Webseite kann
Formeln, Tabellen, Code, Abbildungen des Originals (auch aus Teilbildern (a),
(b)), eigene Zeichnungen (Linien, Pfeile, Kreise, Rechtecke, Beschriftungen),
Schaltpläne nach DIN EN 60617 (Zweipole, Operationsverstärker, Transistoren,
Transformator, Logikgatter), Funktionsgraphen, Zeigerdiagramme, beide mit
gestrichelten Hilfslinien (z.B. Achsen von Wicklungen), und Zeitdiagramme
digitaler Signale zeigen. In einem Element zum Ausprobieren stellt der Nutzer
Werte mit Reglern oder Schaltern ein, und jede dieser Darstellungen ändert
sich mit. Ein Regler für die Zeit spielt das Ganze als Animation ab, z.B. ein
Drehfeld, eine Schwingung oder einen Ablauf in Schritten. Größen, die mehrere
Teile brauchen, werden einmal ausgerechnet. Fragen gibt es frei, mit Auswahl
(mit einer Erklärung pro Option) und als Rechenfrage mit Prüfung des
Ergebnisses. Andere Darstellungen, eigene Farben und Bilder aus dem Internet
gibt es nicht.

## Ablauf

1. **Vorbereiten:** Im **Projekt** arbeite mit dem Modul wie in
   `skill:SKILL.md`, Abschnitt „Mit einem Modul arbeiten“, einschließlich der
   Dateiprüfung. Das Skript ist die Datei im Abschnitt „Dateien“ des Index,
   deren Beschreibung mit dem Wort `Skript` beginnt. Kommen mehrere in Frage,
   stell diese Rückfrage, mit einer Option pro Datei:

   ```auswahl
   Welches Skript soll ich verbessern?
   - {datei}
   ```

   Im **Chat** nimm das angehängte Skript. Gibt es keins, antworte und warte
   auf die Antwort:

   ```text
   Dafür brauche ich das Skript. Häng mir die PDF hier im Chat an.
   ```

   Im **Projekt** lies außerdem
   `projekt:gedaechtnis/{modul}/probleme.md`. Themen mit `-` unter
   `Verstanden` sind Schwachstellen: Stellen dazu erklärst du gründlicher und
   setzt dort an, wo `Ursache` hinweist. Die Webseite nennt die Probleme des
   Nutzers nie, denn er gibt sie vielleicht weiter. Probleme pflegst du in
   dieser Fähigkeit nicht.
2. **Umfang:** Nennt die Anfrage Seiten oder ein Kapitel (z.B. „Bereite
   Kapitel 3 auf“), nimm sie. Nennt sie ausdrücklich das ganze Skript oder
   eine bestimmte Datei, ohne Seiten oder Kapitel (z.B. „das Skript zu
   Asynchronmaschinen“), nimm die ganze Datei. Sonst (z.B. „Verbessere mein
   Skript“) stell diese Rückfrage:

   ```auswahl
   Was soll ich aufbereiten?
   - Ein Kapitel
   - Bestimmte Seiten
   - Das ganze Skript
   ```

   Bei „Ein Kapitel“ oder „Bestimmte Seiten“ antworte und warte auf die
   Antwort:

   ```text
   Welches Kapitel oder welche Seiten? Die Nummern, die auf den Seiten stehen, reichen.
   ```

   Seiten, die der Nutzer nennt, und die eines Inhaltsverzeichnisses sind
   aufgedruckte Nummern (`skill:SKILL.md`, Abschnitt „PDF-Dateien“). Ein
   Kapitel reicht bis zur Seite vor dem nächsten.

   Teil den Umfang in **Etappen** von höchstens einem Kapitel und höchstens
   20 Seiten, längere Kapitel an Abschnittsgrenzen, denn Wortlaut, Bilder und
   Ergänzungen brauchen viel Platz im Chat, und nach jeder Etappe hat der
   Nutzer eine fertige Seite. Gibt es mehr als eine Etappe, antworte, wobei
   `{seiten}` die Zahl der Seiten ist und `{etappen}` die Etappen mit ihren
   Seiten (z.B. `Kapitel 1 (Seite 1–14), Kapitel 2 (Seite 15–30)`), und mach
   mit der ersten weiter:

   ```text
   Das sind {seiten} Seiten. Ich bereite sie in Etappen auf: {etappen}. Nach jeder Etappe bekommst du die Webseite mit allem bis dahin, so geht nichts verloren, wenn der Chat endet.
   ```

3. **Vorlage holen:** Führ `command -v node npm; echo "exit=$?"` aus. Endet es
   nicht mit `exit=0`, arbeite nach dem Abschnitt „Ohne Node“ weiter.
   - Gibt es `arbeit:skript/` aus diesem Chat schon, nimm es.
   - Hat der Nutzer eine Datei angehängt, die auf `-quelle.zip` endet, ist es
     eine frühere Webseite: Entpack sie in einen neuen, leeren Ordner unter
     `arbeit:` und verschieb den Ordner `lernhelfer-skript/` daraus nach
     `arbeit:skript/`.
   - Sonst führ in `arbeit:` aus:
     `git clone --depth 1 https://github.com/ohmtools/lernhelfer-skript skript`

   Lösch danach `arbeit:skript/.git`, falls es den Ordner gibt (z.B.
   `rm -rf skript/.git`). Die Vorlage ist nur eine Kopie, und ohne `.git`
   kann dort niemand versehentlich committen oder pushen. Führ dann im Ordner
   `arbeit:skript/` `npm ci --omit=dev; echo "exit=$?"` aus. Endet es nicht
   mit `exit=0` (z.B. ohne Internet), arbeite nach dem Abschnitt „Ohne Node“
   weiter. Lies `arbeit:skript/ANLEITUNG.md` noch nicht, denn beim Entwerfen
   zählt nur der Inhalt. Was möglich ist, steht im Abschnitt „Was die
   Bausteine können“.
4. **Seiten lesen:** Lösch `arbeit:skript-entwurf/`, falls es den Ordner gibt,
   und leg ihn mit dem Unterordner `bilder/` neu an. Für die Seiten der Etappe
   (Seiten wie im PDF ab 1):
   1. Schreib ihren Text als Referenz für die Prüfung: Führ im Ordner
      `arbeit:skript-entwurf/`
      `pdftotext -enc UTF-8 -f {von} -l {bis} '{datei}' original.txt` aus,
      wobei `{datei}` der Pfad des Skripts in deiner Arbeitsumgebung ist.
   2. Lies jede Seite als Text und sieh sie dir als Bild an
      (`skill:SKILL.md`, Abschnitt „PDF-Dateien“), denn Formeln, Tabellen und
      Abbildungen kommen als Text oft falsch an.
   3. Schneide jede Abbildung aus, wie in `arbeit:skript/ANLEITUNG.md`
      beschrieben, Kapitel „Originaltext“, „Ausschneiden“: Rastergrafiken mit
      `pdfimages -png -j` (Fotos werden dabei JPEG), gezeichnete im Ordner
      `arbeit:skript/` mit
      `npm run ausschnitt -- '{datei}' {seite} {links} {oben} {rechts} {unten} ../skript-entwurf/bilder/s{seite}-{n}.png`
      (Angaben von 0 bis 1 relativ zur Seite). Ein Foto oder ein Bild mit
      Farbverläufen schneidest du mit der Endung `.jpg` statt `.png` aus,
      dann ist die Datei viel kleiner. Hat eine Abbildung Teilbilder mit
      eigenen Unterschriften ((a), (b)), schneide jedes einzeln aus. Sieh dir
      jeden Ausschnitt an und korrigiere ihn, bis die ganze Abbildung drin
      ist, ohne ihre Bildunterschrift. Lies nur dieses Kapitel der Anleitung.
5. **Entwurf:** Schreib pro Kapitel der Etappe eine Datei
   `arbeit:skript-entwurf/{nn}-{name}.md`. `{nn}` ist die zweistellige
   Nummer des Kapitels in der Webseite (`01`, `02`, …, bei einer Fortsetzung
   die nächste freie Nummer in `arbeit:skript/src/inhalt/`), `{name}` sein
   Titel nach den Pfadregeln. Reicht ein Kapitel über die Etappe hinaus,
   beginnt der Teil der nächsten Etappe eine eigene Datei, deren `#` die
   erste Abschnittsüberschrift dieses Teils ist.
   - **Original:** wortgleich, ohne Kopf- und Fußzeilen, Seitenzahlen und
     Silbentrennung des PDFs, ohne Titelblatt und Inhaltsverzeichnis des
     Skripts (Titel und Autor kommen in `skript.json`, Schritt 7, die
     Gliederung zeigt die Webseite selbst). Der Kapiteltitel ist die einzige
     Überschrift `#`, Abschnitte `##`, Unterabschnitte `###`. Absätze,
     Listen und Tabellen in Markdown, Formeln in LaTeX zwischen `$…$` oder
     `$$…$$` mit der Nummer des Originals als `\tag{…}`, Abbildungen als
     `![Bildunterschrift des Originals](bilder/s{seite}-{n}.png)`.
     Sonderzeichen wie eingekreiste Ziffern (①), Pfeile oder Häkchen
     schreibst du als dasselbe Zeichen, nicht als Formatierung. Korrigiere,
     kürze und ergänze im Original nichts, auch keine Tippfehler.
   - **Seiten:** Vor den Text jeder Seite kommt eine eigene Zeile
     `::seite[{seite}]` mit der Seite wie im PDF. Beginnt die Seite mitten in
     einem Absatz, einer Liste oder einer Tabelle, kommt sie vor den
     nächsten Block, der auf ihr beginnt.
   - **Teilbilder:** Eine Abbildung aus Teilbildern steht so, jedes Teilbild
     mit seiner eigenen Unterschrift, die gemeinsame in eckigen Klammern:

     ```markdown
     :::abbildung[Abb. 3.3: Läuferbauarten]
     ![(a) Kurzschlussläufer](bilder/s12-1.png)

     ![(b) Schleifringläufer](bilder/s12-2.jpg)
     :::
     ```

   - **Ergänzungen** stehen nur in diesen Markierungen, jede Markierung endet
     mit `:::` in einer eigenen Zeile:

     | Markierung | Wofür |
     |---|---|
     | `:::variablen` | Direkt nach jeder Gleichung, deren Symbole der Text dort nicht erklärt: jedes Symbol mit Bedeutung und Einheit, als Liste. |
     | `:::anmerkung[Titel]` | Ein fehlender Zwischenschritt, eine Anschauung, ein Zusammenhang. Zu jeder Abbildung des Originals eine Erklärung, was zu sehen ist und worauf es ankommt (Titel `Zur Abbildung {nummer}`). |
     | `:::denkanstoss[Frage]` | Statt einer fertigen Erklärung, wo der Nutzer es selbst herausfinden kann, z.B. ein Umformungsschritt. Darunter die Auflösung, die verdeckt bleibt. |
     | `:::grafik[Titel]` | Eine eigene Grafik, wo eine Zeichnung mehr erklärt als Worte (z.B. Zählpfeile in einer Schaltung, ein Zeigerdiagramm, ein Graph). Im Entwurf in Worten beschrieben, so genau, dass du sie danach zeichnen kannst. |
     | `:::interaktiv[Titel]` | Etwas zum Ausprobieren, wo ein Zusammenhang erst beim Verändern sichtbar wird (z.B. wie τ von R und C abhängt), oder eine Animation, wo sich etwas bewegt oder zeitlich ändert. Im Entwurf in Worten: welche Größen einstellbar sind, mit Bereich und Einheit, was abläuft, was angezeigt wird und was der Nutzer entdecken soll. |
     | `:::frage[Frage]`, `:::auswahl[Frage]`, `:::rechnen[Frage]{ergebnis=… toleranz=… einheit="…"}` | Am Ende jedes Kapitels die Wiederholungsfragen mit Antwort (Aufbau im Beispiel). |
     | `:anm[…]` | Ein kurzer Hinweis mitten im Satz. |

   - **Wo du ergänzt:** Geh jeden Abschnitt durch und frag dich, was man
     sehen müsste, um ihn zu verstehen:
     - Zeigt das Skript etwas, das sich bewegt, dreht oder zeitlich ändert
       (z.B. ein Drehfeld, eine Schwingung, eine Welle, einen Ablauf), nur in
       Einzelbildern oder in Worten, mach daraus eine Animation in
       `:::interaktiv`.
     - Hängt eine Größe von anderen ab (eine Gleichung, eine Kennlinie, ein
       Diagramm), mach den Zusammenhang mit Reglern in `:::interaktiv`
       erfahrbar.
     - Beschreibt das Skript einen Aufbau, eine Schaltung oder eine Lage nur
       in Worten, zeichne sie in `:::grafik`.
     - Erst danach kommen Erklärungen in Worten in `:::anmerkung`.

     Jedes Kapitel mit solchem Stoff bekommt mindestens eine Animation oder
     ein Element zum Ausprobieren.
   - **Regeln für Ergänzungen:** Sie stimmen, sind knapp (eine Anmerkung
     höchstens etwa fünf Sätze) und nehmen dem Nutzer das Denken nicht ab:
     lieber ein Denkanstoß als eine fertige Herleitung. Übungsaufgaben im
     Skript löst du nicht, höchstens mit einem Denkanstoß als Hinweis. Für
     jede fachliche Aussage gilt `skill:SKILL.md`, Abschnitt „Belege“, für
     jede Zahl und jedes Ergebnis Abschnitt „Nachrechnen“. In `:::grafik`
     und `:::interaktiv` nimmst du Werte aus dem Skript. Stehen dort keine,
     nimm typische und schreib in den Satz darunter „(Beispielwerte, nicht
     aus dem Skript)“.
   - **Wiederholungsfragen:** Sie stehen gesammelt am Ende jedes Kapitels,
     nach dem letzten Originaltext, nie zwischen den Abschnitten. Je nach
     Länge des Kapitels drei bis acht, über seine wichtigsten Abschnitte
     verteilt. Ein Kapitel ohne Lernstoff (z.B. Literatur, Anhang,
     Verzeichnisse) bekommt keine. Reicht ein Kapitel über die Etappe
     hinaus, stehen sie am Ende seiner letzten Datei. Sie fragen das Kapitel
     aus dem Gedächtnis ab, ohne neues Wissen. Die meisten fragen nach
     Verständnis (`:::frage`, `:::auswahl`), höchstens ein Drittel sind
     Rechenfragen (`:::rechnen`, mit nachgerechnetem `ergebnis`). Bei
     `:::auswahl` steht jede falsche Option für eine echte Fehlvorstellung
     und bekommt nach einer Leerzeile eingerückt ihre eigene Erklärung. Text
     nach der Liste gilt für alle Optionen.

   Beispiel:

   ```markdown
   # 2 Das RC-Glied

   ::seite[14]

   Für die Spannung am Kondensator gilt nach dem Schließen des Schalters

   $$
   u_C(t) = U_0 \left(1 - e^{-t/\tau}\right) \quad \text{mit} \quad \tau = R C \tag{2.1}
   $$

   :::variablen
   - $u_C(t)$: Spannung am Kondensator zur Zeit $t$, in V
   - $U_0$: Spannung der Quelle, in V
   - $\tau$: Zeitkonstante, in s
   :::

   ![Abb. 2.1: Ladekurve](bilder/s14-1.png)

   :::anmerkung[Zur Abbildung 2.1]
   Die Kurve steigt erst steil, dann immer flacher: Je voller der Kondensator,
   desto kleiner der Ladestrom. (skript.pdf, S. 14)
   :::

   :::denkanstoss[Woher kommen die 63 % nach einer Zeitkonstante?]
   Setz $t = \tau$ ein: $u_C(\tau) = U_0(1 - e^{-1}) \approx 0{,}632\,U_0$.
   :::

   :::interaktiv[Aufladen]
   Regler für R von 100 Ω bis 10 kΩ und C von 100 nF bis 10 µF, beide
   logarithmisch. Animation: Die Zeit t läuft in 5 s von 0 bis 50 ms. Graph
   von u_C/U_0 über t von 0 bis 50 ms, ein Punkt wandert mit der Zeit auf der
   Kurve, ein zweiter markiert τ, Anzeige von τ = RC. Entdecken: Doppeltes R
   oder C verschiebt τ und streckt die ganze Kurve.
   :::

   ::seite[15]

   Weiter im Original bis zum Ende des Kapitels …

   :::frage[Was beschreibt die Zeitkonstante?]
   Wie schnell der Kondensator lädt: Nach τ ist er zu etwa 63 % geladen.
   :::

   :::auswahl[Wie ändert sich τ, wenn sich R verdoppelt?]
   - [x] τ verdoppelt sich.
   - [ ] τ halbiert sich.

     Das gälte, wenn τ = C/R wäre. Nach Gleichung 2.1 ist τ = RC.
   - [ ] τ bleibt gleich, nur $U_0$ zählt.

     $U_0$ bestimmt, wie hoch die Spannung steigt, nicht wie schnell.

   Nach Gleichung 2.1 ist τ proportional zu R.
   :::

   :::rechnen[Wie groß ist τ für R = 1 kΩ und C = 1 µF, in ms?]{ergebnis=1 toleranz=0.01 einheit="ms"}
   $\tau = RC = 1\,\mathrm{k\Omega} \cdot 1\,\mathrm{\mu F} = 1\,\mathrm{ms}$
   :::
   ```

6. **Wortlaut prüfen:** Führ im Ordner `arbeit:skript/` aus:
   `npm run wortlaut -- ../skript-entwurf --gegen ../skript-entwurf/original.txt`.
   Behebe jede Stelle unter „Abweichungen vom Original“ im Entwurf, bis keine
   mehr bleibt, außer Kopf- und Fußzeilen, Titelblatt, Inhaltsverzeichnis,
   Text in Abbildungen und Formeltext, die pdftotext anders liest. „Kurze
   Auslassungen“ siehst du nur durch. Meldet der Befehl einen Fehler im Aufbau
   (z.B. eine unbekannte Markierung), behebe ihn und prüf neu.
7. **Setzen:** Lies erst jetzt `arbeit:skript/ANLEITUNG.md` vollständig, falls
   du sie in diesem Chat noch nicht gelesen hast. Nur ihre Bausteine
   verwendest du. Führ dann im Ordner `arbeit:skript/` aus: bei einer neuen
   Webseite `npm run mdx -- ../skript-entwurf --ersetzen` (das löscht das
   Beispiel der Vorlage), bei einer Fortsetzung
   `npm run mdx -- ../skript-entwurf`. Das macht aus jedem Entwurf ein
   Kapitel in `arbeit:skript/src/inhalt/` und kopiert die Bilder.
   - Ersetze in diesen Kapiteln nur die Beschreibungen in `:::grafik` und
     `:::interaktiv` durch Bausteine der Anleitung, mit dem Satz darunter,
     was der Nutzer sehen oder ausprobieren soll. Alles andere übernimmst du
     unverändert, denn es ist geprüft.
   - Schreib `arbeit:skript/src/inhalt/skript.json` wie in der Anleitung,
     Kapitel „Angaben zum Skript“: `titel` und `autor` vom Titelblatt des
     Skripts, `fach` gleich `{modulname}` (im **Chat** das Fach aus Anfrage
     oder Skript), `quelle` der Dateiname, `umfang` alle Seiten, die die
     Webseite jetzt enthält, z.B. `Seiten 1–30`.
8. **Prüfen und bauen:** Führ im Ordner `arbeit:skript/` nacheinander aus,
   jeweils mit `; echo "exit=$?"`:
   1. `npm run wortlaut -- src/inhalt/{dateien} --gegen ../skript-entwurf`,
      wobei `{dateien}` die Kapitel dieser Etappe sind. Jede Abweichung ist
      ein Fehler beim Setzen: Behebe ihn im Kapitel.
   2. `npm run pruefen`. Behebe jede gemeldete Stelle im Kapitel (Tabelle
      „Häufige Fehler“ in der Anleitung).
   3. `npm run build`. Es erzeugt `arbeit:skript/dist/index.html`.

   Wiederhole, bis alle drei mit `exit=0` enden. `npm run pruefen` rechnet
   Grafiken und Elemente zum Ausprobieren nur nach, zeichnet sie aber nicht.
   Kann deine Arbeitsumgebung eine HTML-Datei als Bild aufnehmen (z.B. ein
   Browser ohne Fenster oder Playwright), sieh dir deshalb jedes Kapitel
   dieser Etappe in `arbeit:skript/dist/index.html` als Bild an (Adresse
   `file://{pfad}#/{kapitel}`, wobei `{kapitel}` der Dateiname ohne `.mdx`
   ist), jedes `:::grafik` und `:::interaktiv` mit den Startwerten und, wo
   dein Werkzeug klicken kann, mit Reglern an beiden Enden und während einer
   Animation: Nichts ist leer, abgeschnitten oder überlappt, und es zeigt,
   was der Satz darunter verspricht. Behebe, was nicht stimmt, und bau neu.

   `{name}` ist der Dateiname des Skripts ohne Endung nach den Pfadregeln mit
   `-verbessert` dahinter (z.B. `skript-analysis-verbessert`). Kopier
   `arbeit:skript/dist/index.html` nach `arbeit:{name}.html` und führ im
   Ordner `arbeit:skript/` `npm run quelle -- ../{name}-quelle.zip` aus.
9. **Bereitstellen:** Stell `arbeit:{name}.html` mit deinem Werkzeug zum
   Bereitstellen von Dateien zum Anzeigen im Chat bereit (z.B.
   `display: render` bei `SendUserFile`) und `arbeit:{name}-quelle.zip` zum
   Herunterladen. Antworte, wobei `{umfang}` die Seiten dieser Etappe sind
   und `{datei}` der Name des Skripts:

   ```text
   Fertig: {umfang} aus {datei} als Webseite.

   - {name}.html: die Webseite. Sie funktioniert auch heruntergeladen und ohne Internet, am Computer, Tablet und Handy.
   - {name}-quelle.zip: der Quellcode, falls du die Seite selbst ändern oder später weitermachen willst.

   Der Originaltext steht unverändert darin. Alles, was ich ergänzt habe, trägt das rote Badge „Ergänzung“; mit „Nur Original“ (am Handy unter Einstellungen) blendest du es aus. Beantworte die Wiederholungsfragen auf der Seite nach jedem Kapitel zuerst selbst, ohne nachzuschauen, und deck erst dann die Lösung auf.
   {weiter}
   ```

   `{weiter}`: Gibt es noch eine Etappe, setze diesen Absatz ein, wobei
   `{naechste}` die nächste Etappe mit Seiten ist, `{ab}` ihre erste Seite
   und `{bis}` die letzte Seite des Umfangs aus Schritt 2, beide als
   aufgedruckte Nummer, und `{anhang}` im **Chat** ` und die PDF des
   Skripts`, im **Projekt** leer; sonst lass den Platzhalter samt Zeile weg:

   ```text
   Als Nächstes kommt {naechste}. Schreib dafür „Mach mit dem Skript weiter“. Endet dieser Chat vorher, häng in einem neuen Chat {name}-quelle.zip{anhang} an und schreib „/lernhelfer:lernen Verbessere {datei} weiter, Seite {ab} bis {bis}“.
   ```

10. **Weitere Etappen:** Schreibt der Nutzer „Mach mit dem Skript weiter“,
    mach mit der nächsten Etappe ab Schritt 4 weiter, mit derselben
    `arbeit:skript/`. Jede Etappe ergänzt die Webseite um ihre Kapitel, die
    HTML-Datei enthält immer alle bisherigen.

## Ohne Node

Dann gibt es keine Webseite, aber den Entwurf. Lies die Seiten (Schritt 4,
ohne Ausschneiden, Abbildungen bleiben als Bildunterschrift mit dem Hinweis
`[Abbildung auf Seite {seite}]` stehen), schreib den Entwurf (Schritt 5) und
prüf den Wortlaut von Hand gegen den Text der Seiten. Stell die
Entwurfsdateien zum Herunterladen bereit und antworte, wobei `{grund}` die
Fehlermeldung in wenigen Worten ist:

```text
Hier kann ich die Webseite gerade nicht bauen ({grund}). Du bekommst den Entwurf als Textdateien: Der Originaltext steht unverändert darin, alles, was ich ergänzt habe, steht zwischen Zeilen mit „:::“. Versuch es später in einem neuen Chat noch einmal, dann wird eine Webseite daraus.
```
