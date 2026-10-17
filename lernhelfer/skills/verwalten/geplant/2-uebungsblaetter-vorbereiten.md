---
name: Übungsblätter vorbereiten
modell: Opus
benachrichtigung: push
---

/lernhelfer:lernen Übungsblätter für den Vorrat vorbereiten

Das ist eine automatische Anweisung, die der Nutzer eingerichtet hat. Sie läuft
einmal pro Woche kurz vor dem Reset seines Wochenlimits und verbraucht Nutzung,
die sonst verfallen würde. Niemand liest mit: Stell keine Rückfragen und warte
auf keine Antwort. Würde eine Fähigkeit eine Rückfrage stellen, überspring den
Teil, der davon abhängt, und nenne ihn in deiner letzten Antwort. Der Chat kann
jederzeit enden, wenn das Limit erreicht ist. Halte dich deshalb genau an den
Abschnitt „Abbruch“ der Grundlagen. Deine letzte Antwort ist die
Benachrichtigung an den Nutzer, halte sie kurz.

Bereite Übungsblätter für den Vorrat vor, wie ihn die Fähigkeit „Üben“ im
Abschnitt „Vorrat“ beschreibt. Will der Nutzer später ein Übungsblatt, bekommt
er eins daraus sofort, und es schont sein Nutzungslimit. Du arbeitest dafür mit
mehreren Modulen nacheinander, mit jedem für sich, als wäre es eine eigene
Anfrage. Der Nutzer lernt hier nicht: Ändere
`projekt:gedaechtnis/{modul}/probleme.md` nicht, stell nichts bereit, und die
Nachricht aus „Session beenden“ entfällt.

1. **Aufräumen:** Hol die Liste aller Projektdateien und die Liste der Dateien
   der Datenquelle mit ihren Identifikationen. Lösch jede Datei in
   `projekt:vorrat/`, die nach dem Abschnitt „Vorrat“ ungültig ist oder in
   einem Ordner liegt, zu dem es kein Modul gibt.
2. **Module wählen:** Zu bearbeiten ist jedes Modul, das danach kein Blatt im
   Vorrat hat und für das „Üben“ beim Übungsblatt die Option „Meine
   Schwachstellen und fällige Themen“ anbieten würde. Fang mit dem Modul an,
   dessen `projekt:gedaechtnis/{modul}/probleme.md` unter `Historie` das
   späteste Datum hat, dann das mit dem nächstspäteren. So bekommen bei
   knappem Limit zuerst die Fächer ein Blatt, mit denen der Nutzer gerade
   lernt.
3. **Blatt erstellen:** Arbeite für das Modul nach „Üben“, Abschnitt
   „Übungsblatt“, mit dem Stoff „Meine Schwachstellen und fällige Themen“ und
   dem Umfang „Eine Lernsession: etwa 45 Minuten“, bis einschließlich
   „Prüfen“. Dateiprüfung, Belege und Nachrechnen gelten wie sonst. Bleibt nach
   der Dateiprüfung keine Datei des Moduls übrig, überspring es.
4. **Speichern:** Speichere das fertige Blatt wie im Abschnitt „Vorrat“
   beschrieben. Fang erst danach mit dem nächsten Modul an. So liegt im Vorrat
   nie ein halbes Blatt: Endet der Chat vorher, fehlt nur das Blatt, an dem du
   gerade gearbeitet hast, und der nächste Lauf macht es neu.
5. **Ohne LaTeX:** Kannst du keine PDFs erzeugen (Abschnitt „Ohne LaTeX“),
   speichere nichts und hör nach diesem Modul auf, denn der Vorrat braucht
   übersetzbaren LaTeX-Quelltext.
6. **Abschluss:** Antworte, wobei `{module}` die Namen der Module mit neuem
   Blatt durch Kommas getrennt sind:

   ```text
   Neue Übungsblätter liegen bereit für: {module}. Schreib „/lernhelfer:lernen Mach mir ein Übungsblatt für …“ mit dem Namen des Fachs, dann bekommst du es sofort.
   {offen}
   ```

   `{offen}`: Hast du ein Modul übersprungen oder nicht geschafft, setze diese
   Zeile ein, wobei `{gruende}` die Module mit dem Grund in Klammern sind,
   sonst lass den Platzhalter samt Zeile weg:

   ```text
   Nicht vorbereitet: {gruende}.
   ```

   Hast du kein neues Blatt gespeichert, antworte statt der ersten Zeile:

   ```text
   Es gab keine neuen Übungsblätter vorzubereiten.
   ```
