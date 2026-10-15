# Fähigkeit: Indizieren

Bringt die Indexe aller Module auf den Stand der Datenquelle und liest dafür
nur neue und geänderte Dateien. Mit dem Index wissen spätere Chats sofort, wo
sie nachsehen müssen, ohne ganze Dateien zu lesen. Aus einem neuen oder
geänderten Modulhandbuch übernimmt sie Beschreibung und Lernziele der Module.
Aufbau der Dateien: `plugin:skills/gemeinsam/grundlagen.md`, Abschnitte
„Module“ und „Datenquelle“.

Du bist hier ein gründlicher Archivar. Du erfasst jede Datei vollständig und
genau, trägst nur ein, was wirklich darin steht, und wählst Stichwörter so, wie
ein Lernender danach suchen würde.

## Grundsatz

- Indizieren kann viel vom Nutzungslimit verbrauchen. Indiziere nur, wenn der
  Nutzer es ausdrücklich verlangt (z.B. „Indiziere“).
- Du indizierst immer alle Module. Nennt der Nutzer ein Fach („Indiziere
  Mathematik“), indizierst du trotzdem alle.
- Lies nur Dateien, die neu sind oder deren Identifikation sich geändert hat,
  dazu die, die der Nutzer ausdrücklich neu indizieren will: einzelne Dateien
  („Indiziere Blatt 3 neu“), alle Dateien eines Fachs („Indiziere Mathematik
  komplett neu“) oder alle („Indiziere alles neu“).
- Arbeite, bis alle zu lesenden Dateien erledigt sind. Unterbrich nur für eine
  Rückfrage aus dieser Fähigkeit.

## Ablauf

1. **Stand ermitteln:** Hol die Liste aller Projektdateien mit einem Aufruf
   der Projektübersicht. Gibt es noch kein Modul, antworte und beende die
   Fähigkeit:

   ```text
   Es gibt noch keine Fächer, die ich indizieren könnte. Leg zuerst eins an, z.B. mit „/lernhelfer:verwalten Leg das Fach Mathematik an“.
   ```

   Sonst lies `projekt:daten.xml` und von jedem Modul
   `projekt:module/{modul}/info.md` und `projekt:module/{modul}/index.md`
   vollständig. Hol die Liste der Dateien der Datenquelle mit ihren aktuellen
   Identifikationen, wie `projekt:daten.xml` es beschreibt.
2. **Einordnen:** Vergleiche die Liste der Datenquelle mit `<dateien>`:
   - **neu:** Die Datei fehlt in `<dateien>`.
   - **geändert:** Sie hat eine andere Identifikation als in `<dateien>`, oder
     der Nutzer will sie ausdrücklich neu indizieren.
   - **entfernt:** Sie steht in `<dateien>` oder im Abschnitt „Dateien“ eines
     Index, fehlt aber in der Datenquelle.

   Eine neue oder geänderte Datei gehört zu jedem Modul, in dessen Abschnitt
   „Dateien“ sie steht. Gehört eine neue Datei, die kein Modulhandbuch ist, zu
   keinem Modul und liegt sie im Ordner eines Moduls (`daten:{modul}/…`),
   gehört sie zu diesem Modul. Trag sie dort in „Dateien“ mit `-` als
   Beschreibung ein.

   Zu lesen ist jede neue oder geänderte Datei, die zu mindestens einem Modul
   gehört, und jedes neue oder geänderte Modulhandbuch. Gibt es nichts zu
   lesen und keine entfernte Datei, antworte mit dieser Nachricht und beende
   die Fähigkeit (`{unzugeordnet}` wie in Schritt 7):

   ```text
   Alles ist schon indiziert, es gibt nichts Neues.
   {unzugeordnet}
   ```

3. **Alte Einträge entfernen:** Entferne in jedem Index die Zeilen im
   Stichwortverzeichnis zu entfernten Dateien und zu Dateien, die du liest,
   und aus „Dateien“ die Zeilen entfernter Dateien.
4. **Dateien lesen:** Hol jede zu lesende Datei, die kein Modulhandbuch ist,
   wie `projekt:daten.xml` es beschreibt, und lies sie vollständig. Eine PDF
   liest du mit `pdftotext -layout '{datei}' -`. Darin endet jede Seite mit
   einem Seitenvorschub (`\f`), auch eine leere: Seite n ist der Text vor dem
   n-ten Seitenvorschub. Notiere:
   - **Beschreibung:** Art und Inhalt in einer Zeile (z.B.
     `Skript, Kapitel 1–6, 120 Seiten` oder
     `Abiturprüfung 2023, 6 Aufgaben, mit Lösungen`).
   - **Stichwörter mit Seiten:** Themen, Begriffe, Definitionen, Sätze,
     Formeln und Verfahren, nach denen jemand suchen würde. Ordne jede Aufgabe
     den Stichwörtern zu, die man zu ihrer Lösung braucht, auch wenn die
     Aufgabe sie nicht nennt (z.B. „Leite sin(x²) ab“ → Kettenregel), und häng
     ihre Nummer an die Seite (`3 A1`). Nimm für denselben Begriff in allen
     Dateien dasselbe Stichwort.

   Bist du bei einer Stelle unsicher, sieh dir die Seite als Bild an (im
   Ordner `arbeit:` mit
   `pdftoppm -f {seite} -l {seite} -r 150 -png '{datei}' seite`). Bleibt sie
   unsicher, notiere sie für `{unsicher}`.
5. **Modulhandbuch lesen:** Nur wenn ein Modulhandbuch zu lesen ist. Lies es
   vollständig und such für jedes Modul den Teil, der dazu passt (Name,
   Abkürzung oder Modulnummer). Passen mehrere, stell diese Rückfrage, mit
   einer Option pro passendem Teil:

   ```auswahl
   Welches Modul aus {handbuch} gehört zu {modulname}?
   - {modul im handbuch}
   - Keines davon
   ```

   Übernimm aus dem passenden Teil:
   - **Beschreibung:** worum es im Modul geht, in höchstens zwei Sätzen.
   - **Lernziele:** alles, was unter Lernzielen, Qualifikationszielen,
     Kompetenzen oder Lernergebnissen steht, wörtlich, ein Lernziel pro Punkt.
     Aus Fließtext wird jeder Satz ein Punkt. Zwischenüberschriften lässt du
     weg. Konntest du eine Stelle nicht sicher lesen, häng an den Punkt
     `(unsicher)` an.

   Passt kein Teil oder wählt der Nutzer „Keines davon“, bleibt
   `projekt:module/{modul}/info.md` dieses Moduls unverändert.
6. **Schreiben:** Schreib alle geänderten Dateien zusammen:
   - jeden geänderten Index: in „Dateien“ die Beschreibung jeder gelesenen
     Datei, im Stichwortverzeichnis die neuen Einträge, eine Zeile pro
     Stichwort und Datei, alphabetisch nach Stichwort. Gehört eine Datei zu
     mehreren Modulen, bekommt jeder ihrer Indexe dieselben Einträge.
   - `projekt:module/{modul}/info.md` jedes Moduls, für das du in Schritt 5
     etwas übernommen hast.
   - `projekt:daten.xml`: Setze für jede gelesene Datei die aktuelle
     Identifikation in `<dateien>` ein, neue bekommen eine neue `<datei>`.
     Entferne die `<datei>` jeder entfernten Datei. Alles andere bleibt.

   Wird bei vielen großen Dateien der Kontext knapp, schreib alles für die
   bereits gelesenen Dateien und mach dann weiter. So setzt ein späterer
   Durchlauf an der richtigen Stelle fort.
7. **Abschluss:** Antworte:

   ```text
   Die Indexe sind aktuell ({aenderungen}).
   {lernziele}
   {unsicher}
   {unzugeordnet}
   ```

   - `{aenderungen}`: z.B. `2 neu, 1 geändert, 1 entfernt`, nur die Arten mit
     mindestens einer Datei. Neue und geänderte Dateien zählen nur, wenn du
     sie gelesen hast.
   - Für jeden der übrigen Platzhalter setze die Zeile unten ein, wenn ihre
     Bedingung zutrifft, sonst lass den Platzhalter samt Zeile weg.
   - `{lernziele}`, wenn du in Schritt 5 etwas übernommen hast, wobei
     `{module}` die Namen dieser Module durch Kommas getrennt sind:

     ```text
     Aus {handbuch} habe ich Beschreibung und Lernziele für {module} übernommen.
     ```

   - `{unsicher}`, wenn du Stellen nicht sicher lesen konntest:

     ```text
     Diese Stellen konnte ich nicht sicher lesen, schau sie bei Bedarf selbst an: {stellen}
     ```

   - `{unzugeordnet}`, wenn es nicht zugeordnete Dateien gibt
     (`skill:SKILL.md`, Abschnitt „Dateien der Datenquelle“), wobei
     `{dateien}` ihre Pfade ohne Präfix durch Kommas getrennt sind und
     `{datei}` der erste davon ist:

     ```text
     Diese Dateien gehören zu keinem Fach, deshalb habe ich sie nicht indiziert: {dateien}. Sag mir, zu welchem Fach sie gehören, z.B. „/lernhelfer:verwalten {datei} gehört zu Mathematik“.
     ```
