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
| [zeiteisen](#zeiteisen) | Dateien für die Stundenplan-App Zeiteisen |

## Lernhelfer

Macht Claude zur Lernumgebung für Oberstufe, Berufsschule und Studium: Claude
erklärt Themen deiner Fächer, übt mit dir und fragt dich ab, mit deinen eigenen
Skripten, Übungen und Altklausuren.

### Einrichten

1. Installiere aus dem Marketplace das Plugin „lernhelfer“.
2. Erstelle in Claude.ai ein Projekt.
3. Starte darin einen Chat und sende
   `/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein`.
4. Claude fragt nach deiner Datenquelle (freiwillig: ein GitHub-Repository für
   deine Unterlagen, gern noch leer), mit Datenquelle auch nach automatischen
   Anweisungen, die einmal pro Woche kurz vor dem Reset deines Wochenlimits
   indizieren und Übungsblätter vorbereiten, und gibt dir einen Text für die
   Projektanweisungen.

Ohne Projekt hilft der Lernhelfer auch, merkt sich dann aber nichts.

### Hilfe

Frag Claude, z.B. `/lernhelfer:helfen Was kannst du?`.

## Zeiteisen

Der Skill zur Stundenplan-App
[Zeiteisen](https://github.com/ohmtools/zeiteisen) der TH Nürnberg: Claude
macht aus Stundenplänen, Abkürzungslisten, Modulhandbüchern, Studienplänen,
Semesterterminen und Standorten Dateien, die du in Zeiteisen lädst.

Installiere aus dem Marketplace das Plugin „zeiteisen“ und häng z.B. einen
Stundenplan als PDF an. Hast du den Skill vorher als ZIP aus der App
hochgeladen, lösch ihn in Claude.ai, sonst gibt es ihn doppelt.

## Aufbau des Repositorys

Jedes Plugin liegt in einem eigenen Ordner. Claude.ai installiert nur diesen
Ordner. Zeiteisen liegt im Repository der App unter
`skill/zeiteisen-generator/`, `marketplace.json` verweist dorthin. Die Vorlage
der Webseiten, die der Lernhelfer aus Skripten macht, liegt im Repository
[lernhelfer-skript](https://github.com/ohmtools/lernhelfer-skript).

```text
.claude-plugin/marketplace.json   Marketplace mit allen Plugins
lernhelfer/                       Plugin Lernhelfer
lernhelfer/skills/lernen/         Lernen mit dem Nutzer
lernhelfer/skills/verwalten/      Projekt, Fächer, Datenquelle, Entwicklung
lernhelfer/skills/helfen/         Antworten auf Fragen zum Lernhelfer
CLAUDE.md                         Hinweise für Claude Code bei der Entwicklung
LICENSE                           Lizenz
```

## Lizenz

BSD-3-Clause, siehe [LICENSE](LICENSE).
