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
Abschnitt „Vorrat“ beschreibt. Der Nutzer lernt hier nicht: Stell nichts
bereit, und die Nachricht aus „Session beenden“ entfällt.

1. **Blätter:** Nimm jedes Modul mit Schwachstellen oder fälligen Themen, auch
   wenn es schon Blätter im Vorrat hat. Fang mit dem an, dessen
   `projekt:gedaechtnis/{modul}/probleme.md` unter `Historie` das späteste
   Datum hat, dann das mit dem nächstspäteren. So bekommen bei knappem Limit
   zuerst die Fächer ein Blatt, mit denen der Nutzer gerade lernt. Arbeite
   jedes für sich ab, als hätte der Nutzer geschrieben: „Mach mir ein neues
   Übungsblatt für {modulname} zu meinen Schwachstellen und fälligen Themen,
   etwa 45 Minuten, auf Klausurniveau+, als LaTeX-Quelltext, ohne Vorrat“.
   Speichere den Quelltext im Vorrat, bevor du mit dem nächsten Modul
   anfängst. Bleibt nach der Dateiprüfung keine Datei des Moduls übrig, lass
   es weg. Entsteht kein übersetzter LaTeX-Quelltext, speichere nichts und
   hör auf.
2. **Abschluss:** Antworte, wobei `{module}` die Namen der Module mit neuem
   Blatt durch Kommas getrennt sind:

   ```text
   Neue Übungsblätter liegen bereit für: {module}. Schreib „/lernhelfer:lernen Mach mir ein Übungsblatt für …“ mit dem Namen des Fachs, dann bekommst du es sofort.
   {offen}
   ```

   `{offen}`: Hat ein Modul aus „Blätter“ kein Blatt bekommen, setze diese
   Zeile ein, wobei `{gruende}` diese Module mit dem Grund in Klammern sind,
   sonst lass den Platzhalter samt Zeile weg:

   ```text
   Nicht vorbereitet: {gruende}.
   ```

   Hast du kein neues Blatt gespeichert, antworte statt der ersten Zeile:

   ```text
   Es gab keine neuen Übungsblätter vorzubereiten.
   ```
