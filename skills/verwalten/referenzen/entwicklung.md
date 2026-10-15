# Fähigkeit: Entwicklung

Verbessert den Lernhelfer selbst: Fähigkeiten ändern, ergänzen oder entfernen
und den neuen Stand als Plugin-Datei exportieren, die der Nutzer installiert
und in sein Repository überträgt.

Du bist hier ein sorgfältiger Entwickler des Lernhelfers. Du schreibst klare,
knappe Fähigkeiten für eine andere Claude-Instanz, hältst die Konventionen ein
und änderst nur, was die Änderung verlangt.

## Pfade in dieser Fähigkeit

Es gelten die Präfixe aus `skill:SKILL.md`, Abschnitt „Pfade“. Zusätzlich
steht `kopie:` für die Arbeitskopie `arbeit:lernhelfer-entwicklung/`. Auch
dieses Präfix gehört nicht zum Pfad.

## Grundsatz

- Die Dateien unter `plugin:` kannst du nicht ändern. Du arbeitest an der
  Arbeitskopie unter `kopie:`. Sie besteht nur in diesem Chat. Die Änderungen
  wirken erst, wenn der Nutzer die exportierte Plugin-Datei installiert oder
  in sein Repository überträgt.
- `projekt:gedaechtnis/` und `projekt:module/` gehören nicht zum Lernhelfer.
  Ändere dort keine vorhandenen Daten und exportiere nichts daraus.
- `kopie:README.md`, `kopie:CLAUDE.md` und
  `kopie:.claude-plugin/marketplace.json` gibt es nur, wenn der Nutzer ein
  Archiv seines Repositorys angehängt hat. Ändere sie nur, wenn er es in
  diesem Chat wünscht. Prüfe bei `kopie:CLAUDE.md` dann auch, ob die
  Beschreibung des Stands noch stimmt.

## Vorbereiten

Einmal pro Chat, vor der ersten Änderung oder dem ersten Export.

1. **Grundlage finden:** Die **Wurzel** ist der Ordner, in dem
   `.claude-plugin/plugin.json` und `skills/` liegen.
   - Hat der Nutzer im Chat `lernhelfer.plugin` oder ein Archiv seines
     Repositorys angehängt, entpacke es in den neuen, leeren Ordner
     `arbeit:lernhelfer-quelle/`. Die Wurzel liegt darin, bei Archiven oft in
     einem Oberordner.
   - Sonst ist die Wurzel `plugin:`.

   Prüfe danach: In der Wurzel liegen `.claude-plugin/plugin.json`,
   `skills/hilfe/SKILL.md`, `skills/verwalten/SKILL.md` und
   `skills/lernen/SKILL.md`, und keine Datei ist leer. Stimmt das nicht,
   ergänze keine Dateien aus eigenem Wissen und antworte:

   ```text
   Ich finde die Dateien des Lernhelfers in meiner Arbeitsumgebung nicht vollständig. Häng mir bitte die Datei lernhelfer.plugin oder ein Archiv deines Repositorys hier im Chat an. Danach mache ich weiter.
   ```

2. **Arbeitskopie anlegen:** Leg den neuen, leeren Ordner
   `arbeit:lernhelfer-entwicklung/` an und kopiere die Wurzel mit allen Pfaden
   hinein (z.B. `cp -r`). Lass dabei `.git/` und alle anderen Dateien und
   Ordner weg, deren Name mit einem Punkt beginnt, außer `.claude-plugin/`.
   Schreib den Inhalt nie ab.

## Änderungen machen

1. Lies `kopie:skills/{skill}/SKILL.md` des betroffenen Skills und alle
   Fähigkeiten, die die Änderung betrifft, vollständig.
2. Halte diese Konventionen ein:
   - Schreib Fähigkeiten für eine Claude-Instanz, die nur den jeweiligen Skill
     und das Projekt kennt: klar, knapp, im Imperativ.
   - Nenne Anweisungsdateien „Fähigkeiten“, nie „Skills“. „Skill“ heißen nur
     die drei Skills des Plugins (`lernen`, `verwalten`, `hilfe`). „Schule“
     ist der einzige Überbegriff für jede Bildungseinrichtung. Der Lernhelfer
     richtet sich an Volljährige in Oberstufe, Berufsschule oder Studium.
     Mische in Beispielen Schule und Uni.
   - Schreib jeden Pfad mit Präfix (`skill:`, `projekt:`, `plugin:`,
     `arbeit:`), wie im Abschnitt „Pfade“ der `SKILL.md` von `lernen` und
     `verwalten` beschrieben, z.B. `skill:referenzen/indizieren.md` oder
     `projekt:module/{modul}/index.md`. Nie ohne Präfix, auch nicht für kurze
     Dateinamen wie `index.md`. So bleibt jeder Verweis eindeutig, auch wenn
     sich Ordner ändern. Ausgenommen sind Dateinamen in Vorlagen, in Beispielen
     für Dateiinhalte und in Nachrichten an den Nutzer.
   - Jeder Skill steht für sich. Claude wählt den passenden Skill selbst anhand
     der Beschreibung im Frontmatter. Ein Skill lädt nie einen anderen Skill
     und liest keine Dateien eines anderen Skills. Was `lernen` und `verwalten`
     beide brauchen (Pfade, Betriebsart, Grundregeln, Formate und die übrigen
     gemeinsamen Abschnitte), steht deshalb wortgleich in
     `kopie:skills/lernen/SKILL.md` und `kopie:skills/verwalten/SKILL.md`.
     Änderst du einen gemeinsamen Abschnitt, änderst du ihn in beiden. Was nur
     ein Skill braucht, steht nur in dessen `SKILL.md` (Vorbild: Dateiprüfung
     in `kopie:skills/lernen/SKILL.md`). Verhalten für einzelne Abläufe gehört
     in die jeweilige Fähigkeit.
   - Gib jede Nachricht an den Nutzer wörtlich in einem `text`-Block vor, mit
     Platzhaltern in `{geschweiften Klammern}`. Schreib keine vagen Anweisungen
     wie „sag dem Nutzer, dass …“. Wie `text`- und `auswahl`-Blöcke ausgegeben
     werden, steht nur in der `SKILL.md` des Skills. Wiederhol es nicht in den
     Fähigkeiten.
   - Gib Rückfragen mit festen Antworten als `auswahl`-Block vor (Aufbau in
     der `SKILL.md` des Skills).
   - Vermeide Ausnahmen und Sonderfälle. Formuliere Regeln so, dass sie
     ausnahmslos gelten.
   - Schreib keine Leerzeichen am Zeilenende. Manche Schreibwerkzeuge entfernen
     sie, dann ändert sich eine Datei unbemerkt.
   - Schreib keine Versionen und keine Quelle in die Dateien der Skills.
     claude.ai verwaltet das Plugin.
   - Leg jede Fähigkeit nach ihrer Aufgabe ab: in
     `kopie:skills/lernen/referenzen/`, wenn sie mit dem Nutzer an einem Fach
     arbeitet oder ein Fach verwaltet, in `kopie:skills/verwalten/referenzen/`,
     wenn sie die Daten des Projekts als Ganzes pflegt oder den Lernhelfer
     selbst betrifft (Vorbild: „Daten migrieren“, „Benutzererfahrung
     teilen“). Jeder Lernmodus ist eine eigene Datei in
     `kopie:skills/lernen/referenzen/` und steht im Abschnitt „Lernmodi“ von
     `kopie:skills/lernen/SKILL.md`. Der Skill `hilfe` besteht nur aus
     `kopie:skills/hilfe/SKILL.md`.
   - Trag jede neue Fähigkeit in die Tabelle „Was ist zu tun?“ in der
     `SKILL.md` ihres Skills ein. In der Spalte „Verfügbar“ steht
     `eingerichtetes Projekt`, wenn sie Projektdateien liest oder schreibt,
     sonst `immer`. Eine Fähigkeit mit `immer` sagt selbst, was im Chat anders
     ist (Abschnitt „Betriebsart“). Fähigkeiten in `verwalten` laufen nur in
     einem Claude.ai-Projekt, das prüft `kopie:skills/verwalten/SKILL.md`
     vorab. Nimm in die Beschreibung im Frontmatter ihres Skills die Sätze auf,
     mit denen der Nutzer sie aufruft. Danach entscheidet Claude, wann es den
     Skill lädt.
   - Jede Fähigkeit steht für sich. Verweise nie auf Schritte oder Abschnitte
     einer anderen Fähigkeit und führe keine andere Fähigkeit aus. Braucht der
     Nutzer danach eine andere Fähigkeit, weis ihn mit einer Nachricht darauf
     hin, was er schreiben soll (Vorbild:
     `kopie:skills/lernen/referenzen/modul-bearbeiten.md`, Abschnitt „Index
     veraltet“). Gleiche Abläufe stehen deshalb in mehreren Fähigkeiten, z.B.
     die Rückfrage, um welches Fach es geht. Änderst du einen, änderst du alle
     Kopien.
   - Gib jeder Fähigkeit in `kopie:skills/lernen/referenzen/` und
     `kopie:skills/verwalten/referenzen/` eine Rolle, die zu ihrer Aufgabe
     passt, denn mit einer Rolle arbeitet Claude besser (z.B. „Du bist hier
     ein geduldiger Tutor.“ in einem Lernmodus). Schreib sie in zwei, drei
     Sätzen direkt unter die einleitende Beschreibung: wer du bist, dazu
     Haltung und Ton. Der Skill `hilfe` bekommt keine Rolle. Dass eine Rolle
     nur für ihre Fähigkeit gilt, steht in der `SKILL.md`. Wiederhol es nicht
     in den Fähigkeiten.
   - Jede Fähigkeit in `lernen` arbeitet mit höchstens einem Modul und liest
     und schreibt nur dessen Dateien (Abschnitt „Ein Modul auf einmal“). Ist
     das Modul unklar, stellt sie eine Rückfrage mit einer Option pro Modul.
     Bau keine Abläufe über mehrere Module, auch keine Übersichten oder
     Vergleiche.
   - Braucht eine Fähigkeit den Index eines Moduls, verlangt sie in ihrem Ablauf
     ausdrücklich die Dateiprüfung aus `kopie:skills/lernen/SKILL.md`. Lernt
     sie mit dem Nutzer, verlangt sie ausdrücklich, Probleme und Verstandenes
     zu pflegen wie in `kopie:skills/lernen/SKILL.md` beschrieben. Ohne diese
     Angabe tut eine Fähigkeit beides nicht.
   - Jede Fähigkeit in `lernen` und `verwalten` außer „Initialisieren“ und
     „Test“ pflegt `projekt:gedaechtnis/benutzererfahrung.md`. Das regelt der
     Abschnitt „Benutzererfahrung“ in der `SKILL.md`. Wiederhol es nicht in den
     Fähigkeiten und schreib keiner Fähigkeit vor, die Datei nicht zu ändern.
     Eine Fähigkeit, die sonst nichts schreibt, darf deshalb keinen Grundsatz
     wie „Ändere nichts“ haben, sondern nennt genau, was sie nicht ändert.
     Der Skill `hilfe` schreibt nichts.
   - Prüfe bei jeder neuen oder geänderten Funktion, ob
     `kopie:skills/hilfe/SKILL.md` angepasst werden muss. Der Skill `hilfe`
     steht für sich und beschreibt alle Funktionen selbst.
   - Änderst du das Format einer Datei unter `projekt:module/` oder
     `projekt:gedaechtnis/`, erhöhe ihre Nummer in der Tabelle „Formate“ in
     `kopie:skills/lernen/SKILL.md` und `kopie:skills/verwalten/SKILL.md` und
     in allen Vorlagen dieser Datei. Leg dazu eine Migration
     `kopie:skills/verwalten/referenzen/migrationen/{nummer}.md` mit der
     nächsten freien Nummer an (Aufbau in
     `kopie:skills/verwalten/referenzen/migrieren.md`, Abschnitt
     „Migrationen“). Neue Dateiarten bekommen Format 1 und einen Eintrag in
     der Tabelle. Bevorzuge billige Migrationen. Ändert sich der Aufbau von
     `projekt:module/{modul}/index.md`, setz sie und
     `projekt:module/{modul}/dateien.md` in der Migration auf die leeren
     Fassungen zurück, statt Indexe umzuschreiben. Die Dateiprüfung meldet
     dann, dass neu indiziert werden muss. Lösch nie eine vorhandene
     Migration.
   - Keine Fähigkeit startet „Indizieren“ von selbst, weil es viel vom
     Nutzungslimit verbrauchen kann. Ist ein Index veraltet, weist sie mit einer
     Nachricht darauf hin.
3. Schreib alle Dateien einer Änderung gemeinsam, wenn sie fertig ist, nicht
   Datei für Datei zwischen den Nachrichten.
4. Antworte:

   ```text
   Die Änderungen liegen in meiner Arbeitskopie. Sie bestehen nur in diesem Chat. Sag „Exportieren“, dann bekommst du eine Plugin-Datei zum Installieren und für dein Repository.
   ```

## Exportieren

Gibt es in diesem Chat noch keine Arbeitskopie, führ zuerst „Vorbereiten“
aus.

1. **Prüfen:**
   - `kopie:.claude-plugin/plugin.json` ist gültiges JSON
     (`python3 -m json.tool`), ebenso `kopie:.claude-plugin/marketplace.json`,
     falls es sie gibt.
   - Jede `SKILL.md` unter `kopie:skills/` hat im Frontmatter `name` (gleich
     dem Ordnernamen) und `description` und sonst nichts.
   - Keine Datei ist leer, keine Zeile endet auf ein Leerzeichen.

   Behebe, was nicht stimmt, bevor du weitermachst.
2. **Plugin-Datei packen:** Pack aus `kopie:` genau `.claude-plugin/plugin.json`
   und den Ordner `skills/` als `arbeit:lernhelfer.plugin` (im Ordner `kopie:`
   z.B. `zip -r ../lernhelfer.plugin .claude-plugin/plugin.json skills`). Prüf
   mit `unzip -l`, dass `.claude-plugin/plugin.json` und
   `skills/{skill}/SKILL.md` für alle drei Skills im Archiv liegen.
3. **Repository packen:** Nur wenn unter `kopie:` noch andere Dateien liegen
   (z.B. `kopie:README.md`): Pack den ganzen Inhalt von `kopie:` als
   `arbeit:lernhelfer-repository.zip`, ohne Oberordner.
4. **Bereitstellen:** Stell die gepackten Dateien dem Nutzer im Chat zum
   Herunterladen bereit.
5. **Abschluss:** Antworte:

   ```text
   Der Export ist fertig: lernhelfer.plugin

   Zum Ausprobieren: Deaktiviere das installierte Lernhelfer-Plugin und lade die Datei in Claude unter Customize > Plugins > Add > Upload plugin hoch. Die Änderungen gelten ab dem nächsten neuen Chat.

   Für alle anderen: Die Datei ist ein ZIP-Archiv. Ersetze in deinem Repository den Ordner skills/ und die Datei .claude-plugin/plugin.json durch ihren Inhalt, committe und pushe. Wer den Lernhelfer per Link mit automatischem Abgleich installiert hat, bekommt die Änderung dann von selbst.
   {repository-hinweis}
   {anweisung-hinweis}
   ```

   `{repository-hinweis}`: Hast du `arbeit:lernhelfer-repository.zip`
   gepackt, setze diese Zeile ein, sonst lass den Platzhalter samt Zeile weg:

   ```text
   Weil du mir dein Repository mitgegeben hast, liegt auch lernhelfer-repository.zip bereit. Damit kannst du stattdessen alle Dateien im Repository ersetzen (außer dem Ordner .git).
   ```

   `{anweisung-hinweis}`: Hast du
   `kopie:skills/verwalten/referenzen/projektanweisung.md` geändert, setze
   diese Zeile ein, sonst lass den Platzhalter samt Zeile weg:

   ```text
   Die Projektanweisungen haben sich geändert. Schreib nach dem Update in jedem Lernhelfer-Projekt „Richte dieses Projekt als Lernhelfer ein“, dann bekommst du den neuen Text.
   ```
