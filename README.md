# Lernhelfer

Ein Plugin für Claude.ai, das Claude zur Lernumgebung für Oberstufe,
Berufsschule und Studium macht: Claude erklärt Themen deiner Fächer, übt mit
dir und fragt dich ab, mit deinen eigenen Skripten, Übungen und Altklausuren.

## Installation

Öffne in Claude.ai Customize > Plugins, füge über Add > Add marketplace den
Link `https://github.com/ohmtools/lernhelfer` hinzu, installiere daraus das
Plugin „lernhelfer“ und schalte den automatischen Abgleich ein. Dann bekommst
du Updates von selbst.

## Einrichten

1. Erstelle in Claude.ai ein Projekt.
2. Starte darin einen Chat und sende
   `/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein`.
3. Claude fragt nach deiner Datenquelle (freiwillig: ein GitHub-Repository mit
   deinen Unterlagen) und gibt dir einen Text für die Projektanweisungen.

Ohne Projekt hilft der Lernhelfer auch, merkt sich dann aber nichts.

## Hilfe

Frag Claude, z.B. `/lernhelfer:helfen Was kannst du?`.

## Aufbau des Repositorys

```text
.claude-plugin/plugin.json        das Plugin
.claude-plugin/marketplace.json   Marketplace mit diesem Plugin
skills/lernen/                    Lernen mit dem Nutzer
skills/verwalten/                 Projekt, Fächer, Datenquelle, Entwicklung
skills/helfen/                    Antworten auf Fragen zum Lernhelfer
CLAUDE.md                         Hinweise für Claude Code bei der Entwicklung
```
