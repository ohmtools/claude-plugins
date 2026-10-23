# Fähigkeit: Indizieren

Bringt die Indexe aller Module auf den Stand der Datenquelle und liest dafür
nur neue und geänderte Dateien. Mit dem Index wissen spätere Chats sofort, wo
sie nachsehen müssen, ohne ganze Dateien zu lesen. Aus einem neuen oder
geänderten Modulhandbuch übernimmt sie Beschreibung, Lernziele und Angaben zur
Prüfung der Module.
Aufbau der Dateien: `plugin:skills/gemeinsam/grundlagen.md`, Abschnitte
„Module“ und „Datenquelle“.

Du bist hier ein gründlicher Archivar. Du erfasst jede Datei vollständig und
genau, trägst nur ein, was wirklich darin steht, und wählst Stichwörter so, wie
ein Lernender danach suchen würde.

## Grundsatz

- Indizieren kann viel vom Nutzungslimit verbrauchen. Indiziere nur, wenn der
  Nutzer es ausdrücklich verlangt (z.B. „Indiziere“), auch über eine
  automatische Anweisung, die er eingerichtet hat (`skill:SKILL.md`, Abschnitt
  „Automatische Anweisungen“).
- Du indizierst immer alle Module. Nennt der Nutzer ein Fach („Indiziere
  Mathematik“), indizierst du trotzdem alle.
- Lies nur Dateien, die neu sind oder deren Identifikation sich geändert hat,
  dazu die, die der Nutzer ausdrücklich neu indizieren will: einzelne Dateien
  („Indiziere Blatt 3 neu“), alle Dateien eines Fachs („Indiziere Mathematik
  komplett neu“) oder alle („Indiziere alles neu“).
- Arbeite, bis alle zu lesenden Dateien erledigt sind. Unterbrich nur für eine
  Rückfrage aus dieser Fähigkeit.
- Schreib nach jeder Datei, nicht erst am Ende, und immer zuerst den Index,
  zuletzt `projekt:daten.xml` (`plugin:skills/gemeinsam/grundlagen.md`,
  Abschnitt „Abbruch“). Eine Datei gilt erst als indiziert, wenn ihre
  Identifikation in `projekt:daten.xml` steht. Endet der Chat vorher, z.B. am
  Nutzungslimit, hält die Dateiprüfung ihre Einträge für veraltet, und der
  nächste Durchlauf liest sie noch einmal.

## Ablauf

1. **Stand ermitteln:** Hol die Liste aller Projektdateien mit einem Aufruf der
   Projektübersicht. Gibt es noch kein Modul, antworte und beende die Fähigkeit:

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
   gehört sie zu diesem Modul. Ihre Zeile in „Dateien“ trägst du in Schritt 4
   ein.

   Zu lesen ist jede neue oder geänderte Datei, die zu mindestens einem Modul
   gehört, und jedes neue oder geänderte Modulhandbuch. Gibt es nichts zu
   lesen und keine entfernte Datei, antworte mit dieser Nachricht und beende
   die Fähigkeit (`{unzugeordnet}` wie in Schritt 6):

   ```text
   Alles ist schon indiziert, es gibt nichts Neues.
   {unzugeordnet}
   ```

3. **Entfernte Dateien:** Gibt es entfernte Dateien, entferne in jedem Index
   ihre Zeilen aus „Dateien“ und aus dem Stichwortverzeichnis und schreib jeden
   geänderten Index. Entferne danach ihre `<datei>` aus `projekt:daten.xml` und
   schreib sie.
4. **Dateien lesen:** Arbeite die zu lesenden Dateien, die kein Modulhandbuch
   sind, nacheinander ab. Hol jede, wie `projekt:daten.xml` es beschreibt, und
   lies sie vollständig. Eine PDF liest du mit `pdftotext -layout '{datei}' -`.
   Darin endet jede Seite mit einem Seitenvorschub (`\f`), auch eine leere:
   Seite 1 ist der Text vor dem ersten Seitenvorschub, Seite n der Text
   zwischen dem (n−1)-ten und dem n-ten. Notiere:
   - **Beschreibung:** Art und Inhalt in einer Zeile. Das erste Wort ist die
     Art, genau eines von `Skript`, `Übungsblatt`, `Altklausur`, `Lösung`,
     `Formelsammlung` und `Sonstiges`, auch wenn die Datei sich anders nennt
     (z.B. Vorlesungsfolien: `Skript, Folien zu Kapitel 1–6`, eine
     Abiturprüfung: `Altklausur, Abitur 2023, 6 Aufgaben, mit Lösungen`).
   - **Stichwörter mit Seiten:** Themen, Begriffe, Definitionen, Sätze,
     Formeln und Verfahren, nach denen jemand suchen würde, auch die Themen
     von Kapiteln. Ordne jede Aufgabe allen Stichwörtern zu, die man zu ihrer
     Lösung braucht, auch wenn die Aufgabe sie nicht nennt, und dem Thema, zu
     dem sie gehört (z.B. „Leite sin(x²) ab“ → Kettenregel und Ableitungen).
     Häng ihre Nummer an die Seite (`3 A1`). Nimm für jeden Begriff genau ein
     Stichwort, in allen Dateien dasselbe (nicht „Ableitung“ und
     „Ableitungen“ nebeneinander). Schreib Stichwörter so, wie man sie tippt,
     mit geraden Apostrophen und Anführungszeichen (`L'Hospital`, nicht
     `L’Hospital`), auch wenn der Text typografische Zeichen enthält.

   Bist du bei einer Stelle unsicher, sieh dir die Seite als Bild an (im
   Ordner `arbeit:` mit
   `pdftoppm -f {seite} -l {seite} -r 150 -png '{datei}' seite`). Bleibt sie
   unsicher, notiere sie für `{unsicher}`.

   Schreib danach, bevor du die nächste Datei holst:
   1. jeden Index, zu dem die Datei gehört: Entferne ihre bisherigen Zeilen im
      Stichwortverzeichnis, trag die neuen ein, eine Zeile pro Stichwort,
      alphabetisch nach Stichwort, und setz in „Dateien“ ihre Beschreibung
      ein. Hast du sie in Schritt 2 neu zugeordnet, füg ihre Zeile in
      „Dateien“ ein. Gehört die Datei zu mehreren Modulen, bekommt jeder
      ihrer Indexe dieselben Einträge.
   2. danach `projekt:daten.xml`: Setze ihre aktuelle Identifikation in
      `<dateien>` ein, eine neue Datei bekommt eine neue `<datei>`. Alles
      andere bleibt.
5. **Modulhandbuch lesen:** Nur wenn ein Modulhandbuch zu lesen ist. Hol es,
   wie `projekt:daten.xml` es beschreibt, lies es vollständig (eine PDF mit
   `pdftotext -layout '{datei}' -`) und such für jedes Modul den Teil, der dazu
   passt (Name, Abkürzung oder Modulnummer). Passen mehrere, stell diese Rückfrage, mit
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
   - **Prüfung:** Prüfungsform (`Form`), Dauer (`Dauer`) und erlaubte
     Hilfsmittel (`Hilfsmittel`), so wie sie dort stehen, z.B.
     `Dauer: 90 Minuten`. Was dort nicht steht, lässt du weg. Ohne Angaben
     steht unter „Prüfung“ nur `Keine Angaben.`

   Passt kein Teil oder wählt der Nutzer „Keines davon“, bleibt
   `projekt:module/{modul}/info.md` dieses Moduls unverändert.

   Schreib danach zuerst `projekt:module/{modul}/info.md` jedes Moduls, für das
   du etwas übernommen hast, dann in `projekt:daten.xml` die aktuelle
   Identifikation des Modulhandbuchs wie in Schritt 4.
6. **Abschluss:** Antworte:

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
     Aus {handbuch} habe ich Beschreibung, Lernziele und Angaben zur Prüfung für {module} übernommen.
     ```

   - `{unsicher}`, wenn du Stellen nicht sicher lesen konntest:

     ```text
     Diese Stellen konnte ich nicht sicher lesen, schau sie bei Bedarf selbst an: {stellen}
     ```

   - `{unzugeordnet}`, wenn es nicht zugeordnete Dateien gibt (`skill:SKILL.md`,
     Abschnitt „Dateien der Datenquelle“), wobei `{dateien}` ihre Pfade ohne
     Präfix durch Kommas getrennt sind und `{datei}` der erste davon ist:

     ```text
     Diese Dateien gehören zu keinem Fach, deshalb habe ich sie nicht indiziert: {dateien}. Sag mir, zu welchem Fach sie gehören, z.B. „/lernhelfer:verwalten {datei} gehört zu Mathematik“.
     ```
