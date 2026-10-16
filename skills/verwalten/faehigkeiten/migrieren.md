# Fähigkeit: Daten migrieren

Passt die Dateien eines Moduls in `projekt:module/` und `projekt:gedaechtnis/`
an das aktuelle Format an, wenn ein Update das Format geändert hat, dazu
`projekt:gedaechtnis/benutzererfahrung.md` und `projekt:daten.xml`. Inhalte
gehen dabei nicht verloren. Formate: `plugin:skills/gemeinsam/grundlagen.md`,
Abschnitt „Formate“.

Du bist hier ein behutsamer Restaurator. Du überträgst alte Dateien ins neue
Format, ohne etwas vom Inhalt zu verlieren, und lässt eine Datei lieber
unverändert, als zu raten.

## Grundsatz

- Arbeite pro Durchlauf mit genau einem Modul, damit der Aufwand klein
  bleibt. Die vorhandenen Module und ihre Namen bestimmst du wie in
  `plugin:skills/gemeinsam/grundlagen.md`, Abschnitt „Module“.
- Wandle nur Dateien um, deren `format` niedriger ist als in der Tabelle
  „Formate“.
- Lösch Dateien nur, wenn eine Migration es verlangt.

## Migrationen

Ändert sich das Format einer Datei in `projekt:module/`, `projekt:gedaechtnis/`
oder von `projekt:daten.xml`, kommt eine Migration dazu:
`skill:faehigkeiten/migrationen/{nummer}.md`. Die Nummern zählen ab 1 hoch, in
der Reihenfolge, in der die Migrationen entstanden sind. Eine Migration passt
vorhandene Dateien an das neue Format an. Migrationen werden nie gelöscht,
weil Nutzer Updates überspringen können.

Aufbau einer Migration:

```markdown
# Migration {nummer}

## Betrifft

{Pfadmuster, z.B. `gedaechtnis/*/probleme.md`}, Format {von} → {nach}

## Umwandeln

{Schritte}

## Nachricht

{Ein Satz für den Nutzer, was angepasst wurde}
```

## Ablauf

1. **Modul bestimmen:** Hol die Liste aller Projektdateien mit einem Aufruf der
   Projektübersicht. Nennt der Nutzer kein Modul oder ist es nicht eindeutig,
   stell diese Rückfrage, mit einer Option pro vorhandenem Modul:

   ```auswahl
   Für welches Fach soll ich die gespeicherten Daten anpassen?
   - {modulname}
   ```

   Gibt es kein Modul, passt du nur `projekt:gedaechtnis/benutzererfahrung.md`
   und `projekt:daten.xml` an. `{bereich}` ist in den Nachrichten unten
   `das Fach {modulname}`, ohne Modul `den Lernhelfer`.
2. **Betroffene Dateien bestimmen:** Lies alle Migrationen unter
   `skill:faehigkeiten/migrationen/` vollständig und sortiere sie aufsteigend
   nach ihrer Nummer (als Zahl). Gibt es den Ordner nicht, gibt es keine
   Migrationen. In Frage kommen nur Dateien unter `projekt:module/{modul}/` und
   `projekt:gedaechtnis/{modul}/` sowie
   `projekt:gedaechtnis/benutzererfahrung.md` und `projekt:daten.xml`. Lies jede
   davon, die zu einem Pfadmuster unter „Betrifft“ passt, vollständig. Betroffen
   ist sie, wenn ihr `format` niedriger ist als in der Tabelle „Formate“. Gibt
   es keine betroffene Datei, antworte:

   ```text
   Deine gespeicherten Daten für {bereich} haben schon das aktuelle Format. Es gibt nichts anzupassen.
   {weitere}
   ```

3. **Umwandeln:** Wende auf jede betroffene Datei die passenden Migrationen in
   aufsteigender Reihenfolge an, eine Migration aber nur, wenn `format` der
   Datei gleich `{von}` ist. Setze danach `format` auf `{nach}`. Fehlt für ein
   Format die passende Migration oder lässt sich eine Datei nicht umwandeln
   (z.B. unerwarteter Inhalt), lass sie ganz unverändert und notiere ihren Pfad
   für `{dateien}`.
4. **Schreiben:** Schreib jede geänderte Datei nur einmal, mit dem Ergebnis
   aller Migrationen, und alle Dateien gemeinsam.
5. **Abschluss:** `{nachrichten}` sind die Nachrichten der angewandten
   Migrationen, durch Leerzeichen getrennt. Antworte:

   ```text
   Deine gespeicherten Daten für {bereich} sind an das neue Format angepasst: {nachrichten}
   {fehler}
   {weitere}
   ```

   `{fehler}`: Blieben Dateien unverändert, setze diese Zeile ein, wobei
   `{dateien}` die Pfade durch Kommas getrennt sind, sonst lass den Platzhalter
   samt Zeile weg:

   ```text
   Diese Dateien konnte ich nicht anpassen: {dateien}. Sie bleiben, wie sie sind. Ich benutze sie weiter, ändere sie aber nicht.
   ```

   `{weitere}`: Gibt es außer dem bearbeiteten Modul weitere Module, setze diese
   Zeile ein, wobei `{module}` ihre Namen durch Kommas getrennt sind, sonst lass
   den Platzhalter samt Zeile weg:

   ```text
   Ich passe immer nur ein Fach auf einmal an. Schreib für jedes weitere Fach „/lernhelfer:verwalten Daten migrieren“ und seinen Namen: {module}.
   ```

   Hast du gar keine Datei angepasst, antworte nur mit den Nachrichten aus
   `{fehler}` und `{weitere}`.
