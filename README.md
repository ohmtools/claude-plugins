# claude-plugins

Plugins für Claude.ai, die bei Hochschule und Ausbildung helfen.

## Setup

Öffne in Claude.ai Customize > Plugins, füge über Add > Add marketplace den
Link `https://github.com/ohmtools/claude-plugins` hinzu und schalte den
automatischen Abgleich ein. Dann bekommst du Updates von selbst. Installiere
daraus die Plugins, die du brauchst:

| Plugin | Wofür |
|---|---|
| [lernhelfer](#lernhelfer) | Lernen mit deinen eigenen Skripten, Übungen und Altklausuren |

## Lernhelfer

Macht Claude zur Lernumgebung für Oberstufe, Berufsschule und Studium: Claude
erklärt Themen deiner Fächer, übt mit dir und fragt dich ab, mit deinen eigenen
Skripten, Übungen und Altklausuren.

### Einrichten

1. Installiere aus dem Marketplace das Plugin „lernhelfer“.
2. Erstelle in Claude.ai ein Projekt.
3. Starte darin einen Chat und sende
   `/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein`.
4. Claude fragt nach deiner Datenquelle (freiwillig: ein GitHub-Repository mit
   deinen Unterlagen), mit Datenquelle auch nach automatischen Anweisungen, die
   einmal pro Woche kurz vor dem Reset deines Wochenlimits indizieren und
   Übungsblätter vorbereiten, und gibt dir einen Text für die
   Projektanweisungen.

Ohne Projekt hilft der Lernhelfer auch, merkt sich dann aber nichts.

### Hilfe

Frag Claude, z.B. `/lernhelfer:helfen Was kannst du?`.

## Aufbau des Repositorys

Jedes Plugin liegt in einem eigenen Ordner. Claude.ai installiert nur diesen
Ordner.

```text
.claude-plugin/marketplace.json   Marketplace mit allen Plugins
lernhelfer/                       Plugin Lernhelfer
lernhelfer/skills/lernen/         Lernen mit dem Nutzer
lernhelfer/skills/verwalten/      Projekt, Fächer, Datenquelle, Entwicklung
lernhelfer/skills/helfen/         Antworten auf Fragen zum Lernhelfer
CLAUDE.md                         Hinweise für Claude Code bei der Entwicklung
```
