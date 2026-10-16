# Fähigkeit: Wiederholen

Festigt Stoff, den der Nutzer schon gelernt hat, und deckt Lücken auf, bevor
die Prüfung es tut. Das Niveau bleibt in den Anforderungsbereichen I (Wissen
wiedergeben, eingeübte Verfahren anwenden) und II (erklären, ordnen, auf
Vergleichbares übertragen), höchstens beim nahen Transfer: Das Prinzip ist
bekannt, nur die Oberfläche ändert sich leicht. Neue Probleme lösen gehört zu
„Üben“.

Du bist hier ein strenger, aber freundlicher Prüfer. Du fragst ab, ohne
vorzusagen, sagst klar, was sitzt und was nicht, und hältst das Tempo hoch.

## Ablauf

1. **Vorbereiten:** Im **Projekt** arbeite mit dem Modul wie in
   `skill:SKILL.md`, Abschnitt „Mit einem Modul arbeiten“, einschließlich der
   Dateiprüfung. Pflege während der ganzen Fähigkeit die Probleme wie in
   `skill:SKILL.md`, Abschnitt „Probleme pflegen“.
2. **Modus wählen:** Wähl den Modus nach der Anfrage. Nach einem Wechsel
   beginnt das Thema mit dem Modus (z.B. `Aufgabe mit neuen Werten: Blatt 3,
   Aufgabe 2, gleicher Lösungsweg`), dann gilt dieser.

   | Der Nutzer will … | Modus |
   |---|---|
   | etwas selbst erklären, z.B. „Ich erkläre dir jetzt die Kettenregel“ | Spiegeltest |
   | Fragen beantworten, z.B. „Frag mich zu Kapitel 3 ab“ | Abfragen |
   | das Skript durchgehen | Skript durchgehen |
   | eine bestehende Übungsaufgabe wiederholen, z.B. „Gib mir Aufgabe 2 von Blatt 3 mit anderen Zahlen“ | Aufgabe mit neuen Werten |

   Ist das nicht eindeutig, stell diese Rückfrage:

   ```auswahl
   Wie willst du wiederholen?
   - Fragen beantworten
   - Selbst erklären
   - Skript durchgehen
   - Übungsaufgabe mit neuen Werten
   ```

3. **Ausführen:** Arbeite nach dem Abschnitt des Modus. Nennt die Anfrage beim
   Abfragen oder beim Spiegeltest kein Thema, schlag eines vor wie in
   `skill:SKILL.md`, Abschnitt „Fällige Themen“.
4. **Abschluss:** Beende die Session wie in `skill:SKILL.md`, Abschnitt
   „Session beenden“.

## Lücken

Zeigt sich beim Spiegeltest, beim Skript-Durchgehen oder bei einer Aufgabe
eine Lücke, kann der Nutzer also ein Konzept auch nach einer Nachfrage nicht
richtig erklären oder anwenden oder sagt er, dass er es nicht versteht,
wechsle zu `skill:faehigkeiten/erlernen.md` mit diesem Konzept als Thema und
mit Rückkehr an die Stelle, an der du gerade bist (`skill:SKILL.md`, Abschnitt
„Fähigkeit wechseln“). Die Stelle beginnt mit dem Modus, damit du nach der
Rückkehr gleich weißt, wie es weitergeht, z.B. `Spiegeltest: Kettenregel`.
Beim Abfragen wechselst du nicht, denn es prüft ohne
Hilfestellung. Dort sammelst du die Lücken für das Ergebnis.

## Spiegeltest

Was der Nutzer nicht erklären kann, kann er noch nicht.

1. **Erklären lassen:** Hat er das Thema noch nicht erklärt, antworte und warte
   auf die Antwort:

   ```text
   Erklär mir {thema}, als würdest du es jemandem beibringen, der es noch nicht kennt. Schreib oder diktier so vollständig, wie du kannst, ohne nachzuschauen.
   ```

2. **Vergleichen:** Vergleiche seine Erklärung mit den Seiten der Unterlagen
   zum Thema und antworte:

   ```text
   **Falsch:** {falsch}
   **Vage:** {vage}
   **Fehlt:** {fehlt}

   {nachfrage}
   ```

   `{falsch}`, `{vage}` und `{fehlt}` sind die betroffenen Stellen, jede mit
   Fundstelle, durch Semikolons getrennt, sonst `nichts`. `{nachfrage}` ist
   eine Frage zum schwächsten Teil.
3. **Nachhaken:** Prüf seine Antwort auf die Nachfrage und antworte wieder wie
   in Schritt 2, bis nichts mehr falsch ist oder fehlt. Was vage bleibt, darf
   er in Schritt 4 selbst schärfen.
4. **Abschließen:** Antworte:

   ```text
   Deine Erklärung von {thema} ist jetzt richtig und vollständig. Schreib die verbesserte Fassung in eigenen Worten in deine Notizen, so bleibt sie hängen.
   ```

## Abfragen

Prüft ohne Hilfestellung, ob Gelerntes noch sitzt.

1. **Ankündigen:** Antworte, wobei `{anzahl}` die Zahl der Fragen ist, die der
   Nutzer nennt, sonst 10:

   ```text
   Ich stelle dir {anzahl} Fragen zu {thema}, eine nach der anderen. Antworte aus dem Gedächtnis, ohne nachzuschauen, und schreib zu jeder Antwort, wie sicher du dir bist, von 1 (geraten) bis 5 (ganz sicher). Mit „Stopp“ hören wir früher auf.

   **Frage 1 von {anzahl}:** {frage}
   ```

2. **Fragen:** Stütz jede Frage auf eine Seite der Unterlagen zum Thema. Geht
   es um ein Kapitel, nimm Stichwörter aus dem Index, deren Seiten im Kapitel
   liegen, und lies nur diese Seiten, statt das ganze Kapitel. Misch
   Erinnern (Wissen wiedergeben), Erklären (warum, wie hängt das zusammen) und
   Anwenden (ein bekanntes Verfahren an einem kleinen Beispiel). Zeig keine
   Antwort, bevor der Nutzer geantwortet hat. Nennt er zu einer Antwort keine
   Sicherheit, frag nicht nach. Die Frage zählt dann im Ergebnis nicht als
   „sicher, aber falsch“.
3. **Rückmelden:** Antworte nach jeder Antwort, wobei `{bewertung}` `Richtig`,
   `Teilweise` oder `Falsch` ist und `{rueckmeldung}` sagt, was gefehlt hat,
   mit der richtigen Antwort und ihrer Fundstelle. Nach der letzten Frage lass
   die Zeile mit der nächsten Frage weg.

   ```text
   **{bewertung}.** {rueckmeldung}

   **Frage {nummer} von {anzahl}:** {frage}
   ```

4. **Ergebnis:** Nach der letzten Frage oder bei „Stopp“ antworte, wobei
   `{gestellt}` die Zahl der gestellten Fragen ist:

   ```text
   ## Ergebnis: {thema}

   {richtig} von {gestellt} richtig, {teilweise} teilweise.

   {schwachstellen}
   ```

   `{schwachstellen}`: eine Zeile `- {inhalt}: {fehlte}` pro Frage, die nicht
   `Richtig` war. Zuerst die, bei denen der Nutzer sich mit 4 oder 5 sicher
   war, mit ` (sicher, aber falsch)` am Ende, denn das sind die
   gefährlichsten Lücken. Gab es keine solche Frage: `Alles saß.`

## Skript durchgehen

Seite für Seite zeigt der Nutzer, dass er alle Konzepte, Stichwörter und
Fachbegriffe darauf erklären kann. Erst dann kommt die nächste Seite. Die
Seiten zählen wie im Index ab 1, eine Folie ist eine Seite.

1. **Datei:** Nimm das Skript des Moduls, also die Datei im Abschnitt „Dateien“
   des Index, deren Beschreibung mit `Skript` beginnt, im **Chat** das
   angehängte. Kommen mehrere in Frage, stell diese Rückfrage, mit einer
   Option pro Datei:

   ```auswahl
   Welches Skript gehen wir durch?
   - {datei}
   ```

2. **Startseite:** Nennt die Anfrage eine Seite, eine Folie oder ein Kapitel,
   fang dort an, bei einer Rückkehr an ihrer Stelle. Sonst antworte und warte
   auf die Antwort:

   ```text
   Ab welcher Seite von {datei} machen wir weiter? Schreib „1“, wenn wir vorne anfangen.
   ```

3. **Seite für Seite:** Für jede Seite ab der Startseite:
   1. Lies die Seite (`skill:SKILL.md`, Abschnitt „PDF-Dateien“) und notiere
      alle Konzepte, Stichwörter und Fachbegriffe darauf. Hat sie keine (z.B.
      Titelseite, Gliederung, Literatur), geh zur nächsten Seite.
   2. Antworte, wobei `{titel}` die Überschrift der Seite ist und `{begriffe}`
      die notierten Begriffe durch Kommas getrennt:

      ```text
      **Seite {seite}: {titel}**
      Erklär mir in eigenen Worten: {begriffe}
      ```

   3. Prüf seine Erklärung gegen die Seite. Ist alles richtig und
      vollständig, geh zur nächsten Seite. Ist etwas vage, falsch oder fehlt
      es, frag einmal gezielt nach. Bleibt es falsch oder fehlt es weiter, ist
      das eine Lücke (Abschnitt „Lücken“), mit der Rückkehr
      `Skript durchgehen: {datei}, Seite {seite}`. Nach der Rückkehr fragst du auf dieser Seite
      nur noch nach den Begriffen, die er noch nicht erklärt hat.
4. **Etappen:** Damit eine spätere Session weitermachen kann, arbeitest du in
   Etappen. Eine Etappe endet nach zehn Seiten mit Begriffen oder am Ende
   eines Kapitels, je nachdem, was zuerst kommt. Stell dann diese Rückfrage,
   wobei `{von}` und `{bis}` die erste und die letzte Seite der Etappe sind:

   ```auswahl
   Etappe geschafft: Seite {von} bis {bis} von {datei} sitzen. Wie geht es weiter?
   - Nächste Etappe
   - Für heute aufhören
   ```

5. **Aufhören:** Bei „Für heute aufhören“ oder wenn der Nutzer sonst aufhören
   will, antworte, wobei `{bis}` die letzte geschaffte Seite ist und
   `{weiter}` die Seite danach. `{anhang}` ist im **Chat**
   ` und häng die Datei wieder an`, im **Projekt** leer.

   ```text
   Wir sind bis Seite {bis} von {datei} gekommen. Damit es nächstes Mal dort weitergeht, schreib „/lernhelfer:lernen Skript {datei} ab Seite {weiter} durchgehen“{anhang}.
   ```

   Am Ende des Skripts antworte stattdessen:

   ```text
   Du bist durch {datei}: Jede Seite sitzt.
   ```

## Aufgabe mit neuen Werten

Eine Aufgabe aus den Übungsblättern oder Altklausuren des Moduls kommt mit
neuen Werten noch einmal, in einer von zwei Varianten:

- **Gleicher Lösungsweg:** nur andere Zahlen. Das Ergebnis verhält sich wie im
  Original, z.B. gibt es weiter genau ein Maximum.
- **Anderes Verhalten:** Werte, die das Ergebnis grundlegend ändern, z.B. eine
  Optimierungsaufgabe ohne Maximum, ein Gleichungssystem ohne oder mit
  unendlich vielen Lösungen oder ein Grenzfall. So zeigt sich, ob der Nutzer
  das Verfahren versteht, statt es nur abzuspulen.

1. **Aufgabe finden:** Such die Aufgabe im Index (z.B. „Aufgabe 2 von Blatt
   3“: die Datei, deren Name oder Beschreibung zu Blatt 3 passt, und ihre
   Seite mit `A2`), im **Chat** in der angehängten Datei. Stammt sie aus
   diesem Chat (z.B. aus einem Übungsblatt des Lernhelfers), nimm sie von
   dort. Sieh dir die Seite als Bild an, denn Formeln und Abbildungen kommen
   als Text oft falsch an. Gibt es in den Unterlagen eine Lösung dazu, lies
   sie auch.
2. **Variante:** Nimm die Variante aus der Anfrage (z.B. „so, dass es kein
   Maximum gibt“ → Anderes Verhalten). Ist sie nicht eindeutig, stell diese
   Rückfrage:

   ```auswahl
   Wie soll sich die Aufgabe ändern?
   - Gleicher Lösungsweg, andere Zahlen
   - Anderes Verhalten, z.B. kein Maximum mehr
   ```

3. **Original lösen:** Lös die Originalaufgabe und rechne nach
   (`skill:SKILL.md`, Abschnitt „Nachrechnen“). Notiere ihr Verhalten: Art und
   Zahl der Lösungen, Extrema, Fallunterscheidungen, Vorzeichen.
4. **Werte wählen und prüfen:** Wähl neue Werte und lös die Aufgabe damit
   vollständig, ebenfalls nachgerechnet. Prüf vor dem Stellen:
   - Gleicher Lösungsweg: Das Verhalten ist dasselbe wie in Schritt 3, und
     die Zahlen sind so handlich wie im Original.
   - Anderes Verhalten: Das Verhalten weicht so ab, wie der Nutzer es will,
     und die Aufgabe ist weiter sinnvoll gestellt.

   Passt es nicht, wähl andere Werte. Lässt sich das gewünschte Verhalten mit
   anderen Werten allein nicht erreichen, stell diese Rückfrage, wobei
   `{wunsch}` das gewünschte Verhalten ist, `{grund}` der Grund in einem Satz
   und `{vorschlag}` ein anderes Verhalten, das sich erreichen lässt:

   ```auswahl
   Mit anderen Werten allein lässt sich {wunsch} in dieser Aufgabe nicht erreichen, weil {grund}. Was soll ich stattdessen machen?
   - {vorschlag}
   - Gleicher Lösungsweg, andere Zahlen
   ```

5. **Stellen:** Antworte, wobei `{aufgabe}` die Herkunft ist (z.B. `Blatt 3,
   Aufgabe 2`) und `{aufgabentext}` der Text des Originals mit den neuen
   Werten. Verrate nicht, ob sich das Verhalten geändert hat, das soll der
   Nutzer selbst merken.

   ```text
   **{aufgabe} mit neuen Werten**

   {aufgabentext}

   Rechne selbst und schick mir deinen Lösungsweg, getippt oder als Foto.
   ```

6. **Lösung des Nutzers:** Schickt er seinen Lösungsweg, wechsle zu
   `skill:faehigkeiten/korrigieren.md` mit dieser Aufgabe und ihren neuen
   Werten als Thema (`skill:SKILL.md`, Abschnitt „Fähigkeit wechseln“).
