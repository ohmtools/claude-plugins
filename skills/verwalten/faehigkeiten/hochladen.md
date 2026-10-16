# Fähigkeit: Hochladen

Legt Dateien, die der Nutzer im Chat anhängt, in seiner Datenquelle ab, z.B.
Skripte, Übungsblätter, Altklausuren oder das Modulhandbuch. Danach findet
„Indizieren“ sie. Aufbau der Datenquelle:
`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Datenquelle“, und
`skill:SKILL.md`, Abschnitt „Dateien der Datenquelle“.

Du bist hier ein sorgfältiger Bibliothekar. Du legst jede Datei am richtigen
Platz ab, überschreibst nichts ohne Rückfrage und prüfst, dass alles
angekommen ist.

## Grundsatz

- Lade nur hoch, wenn der Nutzer es ausdrücklich verlangt (z.B. „Lade das
  Blatt in Mathematik hoch“), nie von dir aus, auch nicht, wenn er Dateien
  anhängt.
- Indiziere nicht. Das kann viel vom Nutzungslimit verbrauchen und gehört in
  einen eigenen Chat mit Haiku.
- In der Datenquelle änderst du nur die Dateien, die du hochlädst.

## Ablauf

1. **Dateien finden:** Such die angehängten Dateien in deiner Arbeitsumgebung
   (`plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Pfade“). `{name}` ist
   jeweils der Originalname ohne das Präfix aus acht Hex-Zeichen und
   Bindestrich. Hat der Nutzer keine Datei angehängt, antworte:

   ```text
   Häng mir die Dateien, die ich hochladen soll, hier im Chat an und schreib dazu, zu welchem Fach sie gehören.
   ```

2. **Ziel bestimmen:** Ein Modulhandbuch (`skill:SKILL.md`, Abschnitt „Dateien
   der Datenquelle“) kommt ohne Ordner nach `daten:{name}`. Jede andere Datei
   kommt in den Ordner ihres Moduls nach `daten:{modul}/{name}`. Nennt der
   Nutzer kein Modul oder ist es nicht eindeutig, stell diese Rückfrage, mit
   einer Option pro vorhandenem Modul:

   ```auswahl
   Zu welchem Fach gehört {name}?
   - {modulname}
   ```

   Gibt es noch kein Modul, antworte:

   ```text
   Es gibt noch keine Fächer. Leg zuerst eins an, z.B. mit „/lernhelfer:verwalten Leg das Fach Mathematik an“, und lade die Dateien danach hoch.
   ```

3. **Schreibzugriff holen:** Hol dir über die GitHub-Anbindung deiner
   Arbeitsumgebung (z.B. ein Werkzeug `add_repo`) Schreibzugriff auf `{url}` aus
   `projekt:daten.xml`. Aus ihrer Antwort zählt nur, ob du Zugriff hast.
   Klone nicht nach ihrer Anleitung, das folgt in Schritt 4. Klappt das nicht,
   antworte, wobei `{grund}` die Fehlermeldung in wenigen Worten ist und
   `{ziele}` die Zielpfade ohne Präfix durch Kommas getrennt sind, und beende
   die Fähigkeit:

   ```text
   Ich habe keinen Schreibzugriff auf deine Datenquelle ({grund}). Lade die Dateien selbst auf {url} hoch, unter diesen Pfaden: {ziele}. Schreib danach in einem neuen Chat mit dem Modell Haiku „/lernhelfer:verwalten Indiziere“.
   ```

4. **Klonen:** Gibt es `arbeit:daten/` in diesem Chat noch nicht, klone die
   Datenquelle, wie `projekt:daten.xml` es beschreibt. Hol die Liste ihrer
   Dateien. Meldet `ls-tree` dabei `Not a valid object name HEAD`, ist die
   Datenquelle noch leer. Führ dann im Ordner `arbeit:`
   `git -C daten symbolic-ref HEAD refs/heads/main` aus, damit dein erster
   Push den Hauptzweig `main` anlegt. Gibt es ein Ziel schon, stell diese
   Rückfrage:

   ```auswahl
   In deiner Datenquelle gibt es {ziel} schon. Soll ich die Datei durch die neue Fassung ersetzen?
   - Ersetzen
   - Nicht hochladen
   ```

   Bei „Nicht hochladen“ lässt du diese Datei weg.
5. **Hochladen:** Führ im Ordner `arbeit:` genau diese Befehle aus. `git reset`
   ist nötig, weil der Klon keine Dateiinhalte hat. Füge nur die Zielpfade
   hinzu, nie mit `git add -A` oder `commit -a`, sonst löschst du alle übrigen
   Dateien der Datenquelle.

   ```bash
   git -C daten reset -q
   mkdir -p "daten/{modul}"
   cp "{anhang}" "daten/{ziel}"
   git -C daten add -- "{ziel}"
   git -C daten -c user.name="Lernhelfer" -c user.email="lernhelfer@example.invalid" commit -q -m "Lernhelfer: {ziele} hochgeladen"
   git -C daten push origin HEAD
   ```

   `mkdir`, `cp` und `git add` wiederholst du für jede Datei, `{anhang}` ist ihr
   Pfad in deiner Arbeitsumgebung. Für das Modulhandbuch entfällt `mkdir`.
   Meldungen wie `push negotiation failed` beim Push sind harmlos. Ob er
   geklappt hat, zeigen sein Exit-Code und Schritt 6. Lehnt der Server den
   Push ab, weil sich die Datenquelle inzwischen geändert hat, lösch
   `arbeit:daten/`, klone neu und wiederhol diesen Schritt einmal.
6. **Prüfen:** `git ls-remote {url}.git HEAD` muss dieselbe ID ausgeben wie
   `git -C daten rev-parse HEAD`. Stimmt das nicht, antworte mit der
   Nachricht aus Schritt 3.
7. **Abschluss:** Antworte, wobei `{dateiliste}` eine Zeile pro hochgeladener
   Datei ist (z.B. `- analysis/Blatt 3.pdf`):

   ```text
   Diese Dateien liegen jetzt in deiner Datenquelle:

   {dateiliste}

   Damit ich sie beim Lernen nutzen kann, müssen sie noch indiziert werden. Das kann viel von deinem Nutzungslimit verbrauchen. Am sparsamsten: Starte einen neuen Chat, wähle das Modell Haiku und schreib „/lernhelfer:verwalten Indiziere“.
   ```
