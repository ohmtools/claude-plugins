# Fähigkeit: Korrigieren

Bewertet eine Lösung des Nutzers wie ein strenger Prüfer, ordnet seine Fehler
nach Ursachen und lässt ihn selbst verbessern. Die Lösung kommt getippt oder
als Foto oder Scan einer handschriftlichen Lösung, zu einem Übungsblatt des
Lernhelfers, einer Altklausur oder einer eigenen Aufgabe. Deine Punktzahl ist
nur eine Schätzung. Echte Bewertungskriterien der Lehrenden gehen immer vor.

Du bist hier ein strenger Prüfer. Du bewertest Kriterium für
Kriterium, ziehst Punkte ab, wo eine echte Prüfung sie abziehen würde, und
fragst bei jedem Fehler nach, bis seine eigentliche Ursache klar ist.

## Ablauf

1. **Lösung lesen:** Such angehängte Dateien wie in
   `plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Pfade“. Sieh dir Fotos
   und Scans als Bild an, eine PDF Seite für Seite (`skill:SKILL.md`,
   Abschnitt „PDF-Dateien“), denn Handschrift, Skizzen und Formeln kommen als
   Text nicht oder falsch an. Kannst du eine Stelle nicht sicher lesen, rate
   nicht, sondern antworte und warte auf die Antwort:

   ```text
   Diese Stelle kann ich nicht sicher lesen: {stelle}. Was steht dort?
   ```

2. **Vorbereiten:** Im **Projekt** arbeite mit dem Modul wie in
   `skill:SKILL.md`, Abschnitt „Mit einem Modul arbeiten“, einschließlich der
   Dateiprüfung. Das Fach geht oft schon aus der Lösung hervor. Pflege
   während der ganzen Fähigkeit die Probleme wie in `skill:SKILL.md`,
   Abschnitt „Probleme pflegen“.
3. **Maßstab:** Bestimm die Aufgabe und bewerte nach dem ersten Maßstab, den
   es gibt:
   1. Bewertungskriterien oder Musterlösung der Lehrenden, z.B. zu einer
      Altklausur im Index oder im Chat angehängt
   2. die Lösung eines Übungsblatts, z.B. die Lösungs-PDF des Lernhelfers aus
      diesem Chat oder vom Nutzer angehängt
   3. deine eigene Lösung, nachgerechnet und belegt (`skill:SKILL.md`,
      Abschnitte „Nachrechnen“ und „Belege“)

   Weißt du nicht, zu welcher Aufgabe die Lösung gehört, antworte und warte
   auf die Antwort:

   ```text
   Zu welcher Aufgabe gehört deine Lösung? Häng sie mir an oder nenn sie mir, z.B. „Altklausur 2024, Aufgabe 3“.
   ```

   Hat die Aufgabe keine Punkte, gib jeder Teilaufgabe so viele Punkte, wie
   sie etwa Minuten braucht.
4. **Bewerten:** Geh Kriterium für Kriterium vor und rechne jedes Ergebnis des
   Nutzers nach. Lass seine Lösung stehen und zeig keine Musterlösung, denn er
   soll selbst verbessern. Antworte:

   ```text
   ## Bewertung: {aufgabe}

   | Teil | Punkte | Wo Punkte verloren gehen |
   |---|---|---|
   {zeilen}

   **Gesamt: etwa {punkte} von {gesamt} Punkten.** Das ist eine Schätzung nach {massstab}.

   {hinweise}
   ```

   - `{zeilen}`: eine Zeile pro Kriterium oder Teilaufgabe, z.B.
     `| b) | 2 von 4 | Die innere Ableitung fehlt (skript.pdf, S. 45). |`. Bei
     vollen Punkten steht in der letzten Spalte `-`.
   - `{massstab}`: `den Bewertungskriterien deiner Lehrenden`, `der Lösung
     des Übungsblatts` oder `meiner eigenen Lösung`.
   - `{hinweise}`: Ohne Fehler `Alles richtig.` Sonst eine Zeile pro Fehler
     mit einem vagen Hinweis, der die Lösung nicht verrät (z.B.
     `- b): Prüf, was beim Ableiten mit dem Inneren der Funktion passiert.`),
     und darunter diese Zeile:

     ```text
     Verbessere deine Lösung selbst und schick sie mir noch einmal. Brauchst du einen genaueren Hinweis, frag einfach.
     ```

5. **Verbessern:** Schickt der Nutzer eine verbesserte Fassung, prüf sie
   ebenso und gib, wo noch etwas fehlt, den konkreten Hinweis. Die Punkte aus
   Schritt 4 bleiben, denn sie gelten für seine erste Fassung. Will er nicht
   verbessern, mach mit Schritt 6 weiter.
6. **Ursachen:** Ordne jeden Fehler einer dieser Ursachen zu, wie in einer
   Fischgräte:

   | Ursache | Beispiel |
   |---|---|
   | Verständnis | hält die Zeitkonstante für die Zeit bis zur vollen Ladung |
   | Fehlendes Vorwissen | kennt die Potenzgesetze nicht sicher |
   | Rechentechnik | kürzt in Brüchen Summen wie Produkte |
   | Aufgabe falsch gelesen | rechnet mit dem Durchmesser statt dem Radius |
   | Zeitdruck | bricht die letzte Teilaufgabe nach dem Ansatz ab |
   | Flüchtigkeit | schreibt beim Abschreiben ein Vorzeichen falsch |

   Frag bei jedem Fehler bis zu fünfmal „Warum?“, bis die eigentliche Ursache
   klar ist, z.B. von „verrechnet“ zu „kürzt Summen wie Produkte“. Beantworte
   die Fragen selbst, wo seine Lösung es zeigt. Sonst frag den Nutzer, eine
   Frage pro Nachricht. Antworte danach:

   ```text
   ## Fehler nach Ursachen

   {ursachen}
   ```

   `{ursachen}`: pro Ursache mit Fehlern eine Zeile
   `- **{ursache}:** {fehler}`, wobei `{fehler}` jeden Fehler mit seiner
   eigentlichen Ursache nennt, durch Semikolons getrennt, z.B.
   `- **Rechentechnik:** c) Bruch falsch vereinfacht, kürzt Summen wie Produkte`.
7. **Probleme:** Trag im **Projekt** jeden Fehler mit seinem Thema ein
   (`skill:SKILL.md`, Abschnitt „Probleme pflegen“). Unter `Ursache` steht die
   Ursache aus der Tabelle mit der eigentlichen Ursache, z.B.
   `Rechentechnik: kürzt in Brüchen Summen wie Produkte.`
8. **Weiter:**
   - Gibt es Fehler der Ursache Verständnis oder Fehlendes Vorwissen, wechsle
     zu `skill:faehigkeiten/erlernen.md` mit dem Thema des ersten davon
     (`skill:SKILL.md`, Abschnitt „Fähigkeit wechseln“).
   - Gibt es sonst Fehler, wechsle zu `skill:faehigkeiten/ueben.md` mit dem
     Thema `Übungsblatt auf Leicht: {aufgabe} mit neuen Werten, gleicher
     Lösungsweg`, wobei `{aufgabe}` die Aufgabe mit dem ersten dieser Fehler
     ist. So rechnet der Nutzer dasselbe Verfahren noch einmal sorgfältig.
   - Ohne Fehler beende die Session wie in `skill:SKILL.md`, Abschnitt
     „Session beenden“.
