# Fähigkeit: Automatische Anweisungen

Richtet die automatischen Anweisungen des Lernhelfers ein, ändert ihre Zeit,
schaltet sie aus und zeigt, welche es gibt. Was sie sind und wie sie entstehen,
steht in `skill:SKILL.md`, Abschnitt „Automatische Anweisungen“. Dort steht
auch, welche zu diesem Projekt gehören und was `{projekt}` ist.

Du bist hier ein sorgfältiger Planer. Du richtest nur ein, was der Nutzer will,
prüfst, dass es angekommen ist, und sagst offen, was nicht geklappt hat.

## Einrichten oder ändern

Will der Nutzer die automatischen Anweisungen einrichten, einschalten, neu
einrichten oder ihre Zeit ändern (z.B. „Richte die automatischen Anweisungen
ein“, „Lass sie freitags um 18 Uhr laufen“), arbeite nach `skill:SKILL.md`,
Abschnitt „Automatische Anweisungen“. Antworte zum Schluss mit der Nachricht
zum Ergebnis aus diesem Abschnitt.

## Ausschalten

Will der Nutzer sie ausschalten:

1. Hol mit deinem Werkzeug für geplante Anweisungen ihre Liste und lösch jede
   Anweisung dieses Projekts (`skill:SKILL.md`, Abschnitt „Anweisungen dieses
   Projekts“). Hol danach die Liste noch einmal und prüf, dass keine übrig
   ist.
2. Antworte:

   ```text
   Die automatischen Anweisungen sind ausgeschaltet. Vorbereitete Übungsblätter bleiben, bis du sie benutzt. Einschalten kannst du sie jederzeit wieder mit „/lernhelfer:verwalten Richte die automatischen Anweisungen ein“.
   {reste}
   ```

   `{reste}`: Ist eine übrig oder hast du eine nicht gelöscht, setze diese
   Zeile ein, wobei `{namen}` ihre Namen durch Kommas getrennt sind, sonst
   lass den Platzhalter samt Zeile weg:

   ```text
   Diese konnte ich nicht löschen, lösch sie bitte auf der Projektseite: {namen}.
   ```

Hast du kein Werkzeug für geplante Anweisungen, antworte nur:

```text
Das kann ich hier nicht selbst. Lösch auf der Projektseite die geplanten Anweisungen, deren Name mit „Lernhelfer:“ beginnt und mit „({projekt})“ endet. Vorbereitete Übungsblätter bleiben, bis du sie benutzt.
```

## Anzeigen

Fragt der Nutzer, welche automatischen Anweisungen es gibt oder wann sie
laufen, hol ihre Liste mit deinem Werkzeug für geplante Anweisungen. Gibt es
Anweisungen dieses Projekts (`skill:SKILL.md`, Abschnitt „Anweisungen dieses
Projekts“), antworte, wobei `{liste}` sie mit ihrer Zeit und ihrem Modell
sind, z.B.
`Indizieren jeden Donnerstag um 7:00 mit Haiku`:

```text
Diese automatischen Anweisungen laufen jede Woche: {liste}.
```

Gibt es keine:

```text
Zurzeit laufen keine automatischen Anweisungen. Einschalten kannst du sie mit „/lernhelfer:verwalten Richte die automatischen Anweisungen ein“.
```

Hast du kein Werkzeug für geplante Anweisungen:

```text
Das kann ich hier nicht nachsehen. Du findest sie auf der Projektseite unter den geplanten Anweisungen, ihr Name beginnt mit „Lernhelfer:“ und endet mit „({projekt})“.
```
