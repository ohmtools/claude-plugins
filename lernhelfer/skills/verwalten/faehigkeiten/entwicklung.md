# Fähigkeit: Entwicklung

Verbessert den Lernhelfer selbst: Fähigkeiten ändern, ergänzen oder entfernen
und den neuen Stand als Plugin-Datei exportieren, die der Nutzer installiert
und in sein Repository überträgt.

Du bist hier ein sorgfältiger Entwickler des Lernhelfers. Du schreibst klare,
knappe Fähigkeiten für eine andere Claude-Instanz, hältst die Konventionen ein
und änderst nur, was die Änderung verlangt.

## Pfade in dieser Fähigkeit

Es gelten die Präfixe aus `plugin:skills/gemeinsam/grundlagen.md`, Abschnitt
„Pfade“. Zusätzlich steht `kopie:` für die Arbeitskopie des Plugins
`arbeit:lernhelfer-entwicklung/lernhelfer/`. Auch dieses Präfix gehört nicht
zum Pfad.

## Grundsatz

- Die Dateien unter `plugin:` kannst du nicht ändern. Du arbeitest an der
  Arbeitskopie unter `kopie:`. Sie besteht nur in diesem Chat. Die Änderungen
  wirken erst, wenn der Nutzer die exportierte Plugin-Datei installiert oder
  in sein Repository überträgt.
- `projekt:gedaechtnis/`, `projekt:module/`, `projekt:vorrat/`,
  `projekt:daten.xml` und `daten:` gehören nicht zum Lernhelfer. Ändere dort
  keine vorhandenen Daten und exportiere nichts daraus.
- `arbeit:lernhelfer-entwicklung/README.md`,
  `arbeit:lernhelfer-entwicklung/CLAUDE.md` und
  `arbeit:lernhelfer-entwicklung/.claude-plugin/marketplace.json` gibt es nur,
  wenn der Nutzer ein Archiv seines Repositorys angehängt hat. Ändere sie nur,
  wenn er es in diesem Chat wünscht. Prüfe bei
  `arbeit:lernhelfer-entwicklung/CLAUDE.md` dann auch, ob die Beschreibung des
  Stands noch stimmt.

## Vorbereiten

Einmal pro Chat, vor der ersten Änderung oder dem ersten Export.

1. **Grundlage finden:** Die **Wurzel** ist der Ordner, in dem
   `.claude-plugin/plugin.json` und `skills/` liegen.
   - Hat der Nutzer im Chat `lernhelfer.plugin` oder ein Archiv seines
     Repositorys angehängt, entpacke es in den neuen, leeren Ordner
     `arbeit:lernhelfer-quelle/`. Die Wurzel liegt darin, bei
     `lernhelfer.plugin` ganz oben, bei einem Archiv des Repositorys im Ordner
     `lernhelfer/`, oft unter einem Oberordner. Der Ordner, in dem dieses
     `lernhelfer/` liegt, ist dann die **Repository-Wurzel**.
   - Sonst ist die Wurzel `plugin:`.

   Prüfe danach: In der Wurzel liegen `.claude-plugin/plugin.json`,
   `skills/gemeinsam/grundlagen.md`, `skills/helfen/SKILL.md`,
   `skills/verwalten/SKILL.md` und `skills/lernen/SKILL.md`, und keine Datei
   ist leer. Stimmt das nicht, ergänze keine Dateien aus eigenem Wissen und
   antworte:

   ```text
   Ich finde die Dateien des Lernhelfers in meiner Arbeitsumgebung nicht vollständig. Häng mir bitte die Datei lernhelfer.plugin oder ein Archiv deines Repositorys hier im Chat an. Danach mache ich weiter.
   ```

2. **Arbeitskopie anlegen:** Leg den neuen, leeren Ordner
   `arbeit:lernhelfer-entwicklung/` an. Gibt es eine Repository-Wurzel,
   kopiere sie mit allen Pfaden hinein, sonst kopiere die Wurzel nach
   `kopie:` (z.B. mit `cp -r`). Danach liegt das Plugin in beiden Fällen unter
   `kopie:`. Lass dabei `.git/` und alle anderen Dateien und Ordner weg, deren
   Name mit einem Punkt beginnt, außer `.claude-plugin/`. Schreib den Inhalt
   nie ab.

## Änderungen machen

1. Lies `kopie:skills/gemeinsam/grundlagen.md`,
   `kopie:skills/{skill}/SKILL.md` des betroffenen Skills und alle
   Fähigkeiten, die die Änderung betrifft, vollständig.
2. Halte diese Konventionen ein:
   - Schreib Fähigkeiten für eine Claude-Instanz, die nur den jeweiligen Skill,
     die Grundlagen und das Projekt kennt: klar, knapp, im Imperativ, mit
     nummerierten Schritten, wo die Reihenfolge zählt. Begründe eine Regel in
     einem Halbsatz, wenn ihr Zweck nicht offensichtlich ist (z.B. „das kostet
     viele Token“). Schreib so genau, dass auch Haiku dem Ablauf folgen kann,
     und zeig jedes Dateiformat an einem Beispiel.
   - Nenne Anweisungsdateien „Fähigkeiten“, nie „Skills“. „Skill“ heißen nur
     die drei Skills des Plugins (`lernen`, `verwalten`, `helfen`). In
     Anweisungen heißt ein Fach „Modul“, in Nachrichten an den Nutzer „Fach“.
     „Schule“ ist der einzige Überbegriff für jede Bildungseinrichtung. Der
     Lernhelfer richtet sich an Volljährige in Oberstufe, Berufsschule oder
     Studium. Mische in Beispielen Schule und Uni.
   - Schreib jeden Pfad mit Präfix (`skill:`, `plugin:`, `projekt:`, `daten:`,
     `arbeit:`), wie im Abschnitt „Pfade“ von
     `kopie:skills/gemeinsam/grundlagen.md` beschrieben, z.B.
     `skill:faehigkeiten/indizieren.md` oder
     `projekt:module/{modul}/index.md`. Nie ohne Präfix, auch nicht für kurze
     Dateinamen wie `index.md`. So bleibt jeder Verweis eindeutig, auch wenn
     sich Ordner ändern. Ausgenommen sind Dateinamen in Vorlagen, in Beispielen
     für Dateiinhalte, in Befehlen und in Nachrichten an den Nutzer.
   - Jeder Skill steht für sich. Claude wählt den passenden Skill selbst anhand
     der Beschreibung im Frontmatter. Ein Skill lädt nie einen anderen Skill
     und liest keine Dateien eines anderen Skills. Was `lernen` und `verwalten`
     beide brauchen, steht nur einmal in
     `kopie:skills/gemeinsam/grundlagen.md`. Der Ordner `gemeinsam` ist kein
     Skill, hat keine `SKILL.md` und keine Fähigkeiten. Beide `SKILL.md`
     verlangen im Abschnitt „Grundlagen“, die Datei vor allem anderen zu
     lesen. Was nur ein Skill braucht, steht nur in dessen `SKILL.md`
     (Vorbild: „Dateiprüfung“ in `lernen`, „Dateien der Datenquelle“ in
     `verwalten`), nie in den Grundlagen. Verhalten für einzelne Abläufe
     gehört in die jeweilige Fähigkeit. Der Skill `helfen` liest die
     Grundlagen nicht.
   - Gib jede Nachricht an den Nutzer wörtlich in einem `text`-Block vor, mit
     Platzhaltern in `{geschweiften Klammern}`, und erkläre jeden Platzhalter.
     Schreib keine vagen Anweisungen wie „sag dem Nutzer, dass …“. Wie `text`-
     und `auswahl`-Blöcke ausgegeben werden, steht nur in
     `kopie:skills/gemeinsam/grundlagen.md`. Wiederhol es nicht in den
     Fähigkeiten.
   - Gib Rückfragen mit festen Antworten als `auswahl`-Block vor (Aufbau in
     `kopie:skills/gemeinsam/grundlagen.md`).
   - Braucht der Nutzer eine Funktion des anderen Skills, nenne in der
     Nachricht den Satz mit Präfix, z.B. „/lernhelfer:verwalten Indiziere“.
   - Vermeide Ausnahmen und Sonderfälle. Formuliere Regeln so, dass sie
     ausnahmslos gelten.
   - Schreib keine Leerzeichen am Zeilenende. Manche Schreibwerkzeuge entfernen
     sie, dann ändert sich eine Datei unbemerkt.
   - Schreib keine Versionsnummern, Autoren oder Änderungsdaten in die Dateien
     der Skills. Claude.ai verwaltet das Plugin. Auch
     `kopie:.claude-plugin/plugin.json` bekommt kein Feld `version`: Ohne
     Version zählt jeder Commit als Update, mit Version bekäme niemand ein
     Update, bis sie erhöht wird.
   - Leg jede Fähigkeit nach ihrer Aufgabe ab: in
     `kopie:skills/lernen/faehigkeiten/`, wenn sie mit dem Nutzer an einem
     Fach lernt, in `kopie:skills/verwalten/faehigkeiten/`, wenn sie Fächer,
     Datenquelle, Projekt oder den Lernhelfer selbst verwaltet (Vorbild:
     „Indizieren“, „Modul bearbeiten“). Der Skill `helfen` besteht nur aus
     `kopie:skills/helfen/SKILL.md`.
   - Trag jede neue Fähigkeit in die Tabelle ihres Skills ein: in `lernen` in
     „Fähigkeiten“, in `verwalten` in „Was ist zu tun?“. Dort steht in der
     Spalte „Verfügbar“ `Datenquelle`, wenn sie `daten:` braucht,
     `eingerichtetes Projekt`, wenn sie sonst Projektdateien liest oder
     schreibt, und sonst `immer`. Fähigkeiten in `lernen` sagen selbst, was im
     **Chat** anders ist (Abschnitt „Betriebsart“ in
     `kopie:skills/gemeinsam/grundlagen.md`). Nimm in die Beschreibung im
     Frontmatter ihres Skills die Sätze auf, mit denen der Nutzer sie aufruft.
     Danach entscheidet Claude, wann es den Skill lädt. Die Beschreibung hat
     höchstens 1024 Zeichen, sonst speichert Claude.ai sie gekürzt. Kürze
     lieber die Aufzählung davor als diese Sätze.
   - Jede Fähigkeit steht für sich. Verweise nie auf Schritte oder Abschnitte
     einer anderen Fähigkeit und führe keine andere Fähigkeit als Teil deines
     Ablaufs aus. Gleiche Abläufe stehen deshalb in mehreren Fähigkeiten, z.B.
     das Auslesen der Lernziele in „Indizieren“ und „Modul bearbeiten“.
     Änderst du einen, änderst du alle Kopien.
   - Wechsel zu einer anderen Fähigkeit desselben Skills:
     - In `lernen` erlaubt, damit das Lernen nicht unterbrochen wird (z.B. von
       „Üben“ zurück zu „Erlernen“, wenn sich eine Lücke zeigt). Die
       Fähigkeit endet damit. Verlang den Wechsel im Ablauf ausdrücklich, mit
       dem Pfad der neuen Fähigkeit, dem Thema und, wenn es danach in der
       bisherigen Fähigkeit weitergehen soll, der Stelle für die Rückkehr.
       Verweis dabei auf den Abschnitt „Fähigkeit wechseln“ in
       `kopie:skills/lernen/SKILL.md`, nie auf Schritte der neuen Fähigkeit.
       Dort steht auch die Nachricht, mit der jeder Wechsel angekündigt
       wird.
     - In `verwalten` verboten, damit der Nutzer selbst entscheidet, wann
       etwas Aufwendiges wie „Indizieren“ läuft (Grundregel in
       `kopie:skills/verwalten/SKILL.md`). Braucht der Nutzer danach eine
       andere Fähigkeit, weis ihn mit einer Nachricht darauf hin, was er
       schreiben soll (Vorbild:
       `kopie:skills/verwalten/faehigkeiten/modul-bearbeiten.md`, Abschnitt
       „Index veraltet“).
   - Gib jeder Fähigkeit in `kopie:skills/lernen/faehigkeiten/` und
     `kopie:skills/verwalten/faehigkeiten/` eine Rolle, die zu ihrer Aufgabe
     passt, denn mit einer Rolle arbeitet Claude besser (z.B. „Du bist hier
     ein geduldiger Tutor.“). Schreib sie in zwei, drei Sätzen direkt unter
     die einleitende Beschreibung: wer du bist, dazu Haltung und Ton. Der Skill
     `helfen` bekommt keine Rolle. Dass eine Rolle nur für ihre Fähigkeit gilt,
     steht in `kopie:skills/gemeinsam/grundlagen.md`. Wiederhol es nicht in
     den Fähigkeiten.
   - Erlernen, Wiederholen, Üben und Korrigieren sind Lernmodi. Was mehrere
     Lernmodi brauchen (z.B. Belege, Nachrechnen, Leitplanken), steht einmal
     im Abschnitt „Lernmodi“ von `kopie:skills/lernen/SKILL.md`, was nur einer
     braucht, nur in seiner Fähigkeit. Ein neuer Lernmodus kommt in die
     Aufzählung unter der Tabelle „Fähigkeiten“.
   - Vorlagen, aus denen Fähigkeiten Ausgaben erzeugen (z.B. ein Übungsblatt
     als PDF), liegen im Ordner `vorlagen/` des Skills, z.B.
     `kopie:skills/lernen/vorlagen/uebungsblatt.tex`, und heißen in
     Fähigkeiten `skill:vorlagen/{datei}`. Eine Vorlage ist eine fertige,
     lauffähige Datei mit Beispielinhalt. Was davon die Fähigkeit ersetzt,
     steht in der Fähigkeit, nicht in der Vorlage. Hilfsdateien wie eine
     LaTeX-Klasse, ein Build-Skript oder eine Anleitung zu den Befehlen der
     Vorlage liegen daneben. Weil `skill:` schreibgeschützt ist, kopiert die
     Fähigkeit die Vorlage samt den Hilfsdateien, die sie zum Übersetzen
     braucht, zuerst in einen eigenen Ordner unter `arbeit:` und füllt und
     übersetzt sie nur dort. Den Inhalt schreibt die Fähigkeit vorher als
     Entwurf in einem einfachen Format (z.B. Markdown) und liest die
     Anleitung der Vorlage erst danach, damit deren viele Regeln nicht von
     der Qualität des Inhalts ablenken (Vorbild: „Übungsblatt“ in
     `kopie:skills/lernen/faehigkeiten/ueben.md`). Braucht eine Vorlage
     Programme oder Pakete, die kein Testlauf bestätigt hat, nimm dafür einen
     Test auf.
   - Vorlagen folgen dem ohmtools-Design (`DESIGN.md` im Repository
     `github.com/ohmtools/design`, Abschnitt „Documents“): Schrift Inter,
     sonst die serifenlose Schrift des Werkzeugs, Rot als einzige
     Akzentfarbe, keine Großbuchstaben und keine gesperrte Schrift, Linien
     statt Kästen, eckige Ecken. Farben stehen nur mit ihren Namen aus
     `kopie:skills/lernen/vorlagen/ohmtools-colors.sty` (z.B. `ohmPrimary`),
     nie mit Werten. Diese Datei ist eine unveränderte Kopie aus dem
     Design-Repository, ändere sie nicht.
   - Jede Fähigkeit in `lernen` arbeitet mit genau einem Modul. Sie liest nur
     dessen Dateien, `projekt:daten.xml` und `daten:` und schreibt nur
     `projekt:gedaechtnis/{modul}/probleme.md` und
     `projekt:gedaechtnis/benutzererfahrung.md`, dazu „Üben“ den Vorrat in
     `projekt:vorrat/{modul}/` (Abschnitt „Vorrat“ in
     `kopie:skills/lernen/faehigkeiten/ueben.md`). Bau dort keine Abläufe über
     mehrere Module, auch keine Übersichten oder Vergleiche. Nur eine
     automatische Anweisung darf verlangen, mehrere Module nacheinander zu
     bearbeiten, jedes für sich. Fähigkeiten in `verwalten` dürfen mit
     mehreren Modulen arbeiten.
   - Liest eine Fähigkeit in `lernen` Dateien aus `daten:`, verlangt sie in
     ihrem Ablauf ausdrücklich die Dateiprüfung aus
     `kopie:skills/lernen/SKILL.md`. Lernt sie mit dem Nutzer, verlangt sie
     ausdrücklich, Probleme zu pflegen wie dort beschrieben. Ohne diese Angabe
     tut eine Fähigkeit beides nicht.
   - Auf `daten:` greifen Fähigkeiten nur so zu, wie es `projekt:daten.xml`
     beschreibt. Schreiben in `daten:` darf nur „Hochladen“, dazu „Testen“
     seine Testdateien. Eine neue Art von Datenquelle bekommt Vorlagen für
     `<art>` und `<identifizieren>` in
     `kopie:skills/verwalten/faehigkeiten/initialisieren.md`.
   - Jede Fähigkeit in `lernen` und `verwalten` außer „Initialisieren“ und
     „Testen“ pflegt `projekt:gedaechtnis/benutzererfahrung.md`. Das regelt der
     Abschnitt „Benutzererfahrung“ in `kopie:skills/gemeinsam/grundlagen.md`.
     Wiederhol es nicht in den Fähigkeiten und schreib keiner Fähigkeit vor,
     die Datei nicht zu ändern. Eine Fähigkeit, die sonst nichts schreibt, darf
     deshalb keinen Grundsatz wie „Ändere nichts“ haben, sondern nennt genau,
     was sie nicht ändert. Der Skill `helfen` schreibt nichts.
   - Prüfe bei jeder neuen oder geänderten Funktion, ob
     `kopie:skills/helfen/SKILL.md` angepasst werden muss. Der Skill `helfen`
     steht für sich und beschreibt alle Funktionen selbst.
   - Änderst du das Format einer Datei unter `projekt:module/`,
     `projekt:gedaechtnis/` oder von `projekt:daten.xml`, erhöhe ihre Nummer in
     der Tabelle „Formate“ in `kopie:skills/gemeinsam/grundlagen.md` und in
     allen Vorlagen dieser Datei. Leg dazu eine Migration
     `kopie:skills/verwalten/faehigkeiten/migrationen/{nummer}.md` mit der
     nächsten freien Nummer an (Aufbau in
     `kopie:skills/verwalten/faehigkeiten/migrieren.md`, Abschnitt
     „Migrationen“). Neue Dateiarten bekommen Format 1 und einen Eintrag in der
     Tabelle. Bevorzuge billige Migrationen. Ändert sich der Aufbau des Index,
     leere in der Migration das Stichwortverzeichnis, setz in „Dateien“ jede
     Beschreibung auf `-` und entferne alle `<datei>` aus `projekt:daten.xml`,
     statt Indexe umzuschreiben. Die Dateiprüfung meldet dann, dass neu
     indiziert werden muss. Lösch nie eine vorhandene Migration.
   - Keine Fähigkeit startet „Indizieren“ von selbst, weil es viel vom
     Nutzungslimit verbrauchen kann. Ist ein Index veraltet, weist sie mit einer
     Nachricht darauf hin. Das Gleiche gilt für alles andere Aufwendige. Von
     selbst läuft es nur als automatische Anweisung, die der Nutzer
     eingerichtet hat.
   - Jede Fähigkeit schreibt ins Projekt, wie es der Abschnitt „Abbruch“ in
     `kopie:skills/gemeinsam/grundlagen.md` verlangt, denn ein Chat kann nach
     jedem Schritt am Nutzungslimit enden. Schreibt sie mehrere Dateien, die
     voneinander abhängen, nennt sie die Reihenfolge ausdrücklich (Vorbild:
     `kopie:skills/verwalten/faehigkeiten/indizieren.md`, Schritt 4).
   - Jede Datei in `kopie:skills/verwalten/geplant/` wird beim Einrichten eine
     automatische Anweisung (Aufbau und Ablauf in
     `kopie:skills/verwalten/SKILL.md`, Abschnitt „Automatische Anweisungen“).
     Ihr Dateiname beginnt mit einer Nummer, die die Reihenfolge festlegt
     (z.B. `1-indizieren.md`). Ihr Prompt kommt wörtlich in Claude.ai und
     ändert sich mit einem Update nicht von selbst. Er beginnt mit dem Satz,
     der den Skill aufruft (z.B. „/lernhelfer:verwalten Indiziere“), sagt,
     dass niemand mitliest und keine Rückfragen kommen, und verweist auf den
     Abschnitt „Abbruch“. Er beschreibt keinen Ablauf einer Fähigkeit,
     sondern ruft sie mit einer Anfrage auf, wie sie der Nutzer schreiben
     würde, und sagt nur, was mit dem Ergebnis geschieht (Vorbild:
     `kopie:skills/verwalten/geplant/2-uebungsblaetter-vorbereiten.md`). So
     bleibt er gültig, wenn sich die Fähigkeit ändert. Auf Fähigkeiten, Abschnitte und Schritte verweist er
     nur mit ihrem Namen, nie mit einer Nummer. Benennst du etwas um, auf das
     ein Prompt verweist, pass den Prompt an.
   - Ändert sich der Aufbau der Blätter im Vorrat
     (`kopie:skills/lernen/faehigkeiten/ueben.md`, Abschnitt „Vorrat“),
     erhöhe dort die Nummer in `% format:`. Ältere Blätter gelten dann als
     ungültig, und die automatische Anweisung löscht sie. Eine Migration
     braucht es dafür nicht, denn der Vorrat ist nur ein Zwischenspeicher.
   - „Testen“ (`kopie:skills/verwalten/faehigkeiten/testen.md`) prüft nur
     Annahmen über die Umgebung, die noch kein Testlauf bestätigt hat, damit
     ein Testlauf kurz bleibt. Verlässt sich eine Änderung auf etwas
     Ungeprüftes (z.B. ein Werkzeug, einen Befehl oder ein Verhalten der
     Oberfläche), nimm dafür einen Test auf. Hat ein Testlauf eine Annahme
     bestätigt, nimm ihren Test heraus.
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
     (`python3 -m json.tool`), ebenso
     `arbeit:lernhelfer-entwicklung/.claude-plugin/marketplace.json`, falls es
     sie gibt.
   - Jede `SKILL.md` unter `kopie:skills/` hat im Frontmatter `name` (gleich
     dem Ordnernamen) und `description` mit höchstens 1024 Zeichen und sonst
     nichts.
   - Keine Datei ist leer, keine Zeile endet auf ein Leerzeichen.

   Behebe, was nicht stimmt, bevor du weitermachst.
2. **Plugin-Datei packen:** Pack aus `kopie:` genau `.claude-plugin/plugin.json`
   und den Ordner `skills/` als `arbeit:lernhelfer.plugin` (im Ordner `kopie:`
   z.B. `zip -r ../../lernhelfer.plugin .claude-plugin/plugin.json skills`). Prüf
   mit `unzip -l`, dass `.claude-plugin/plugin.json`,
   `skills/gemeinsam/grundlagen.md` und `skills/{skill}/SKILL.md` für alle
   drei Skills im Archiv liegen.
3. **Repository packen:** Nur wenn es `arbeit:lernhelfer-entwicklung/README.md`
   gibt: Pack den ganzen Inhalt von `arbeit:lernhelfer-entwicklung/` als
   `arbeit:lernhelfer-repository.zip`, ohne Oberordner.
4. **Bereitstellen:** Stell die gepackten Dateien dem Nutzer im Chat zum
   Herunterladen bereit.
5. **Abschluss:** Antworte:

   ```text
   Der Export ist fertig: lernhelfer.plugin

   Zum Ausprobieren: Deaktiviere das installierte Lernhelfer-Plugin und lade die Datei in Claude unter Customize > Plugins > Add > Upload plugin hoch. Die Änderungen gelten ab dem nächsten neuen Chat.

   Für alle anderen: Die Datei ist ein ZIP-Archiv. Ersetze in deinem Repository den Ordner lernhelfer/skills/ und die Datei lernhelfer/.claude-plugin/plugin.json durch ihren Inhalt, committe und pushe. Wer den Lernhelfer per Link mit automatischem Abgleich installiert hat, bekommt die Änderung dann von selbst.
   {repository-hinweis}
   {anweisung-hinweis}
   {automatik-hinweis}
   ```

   `{repository-hinweis}`: Hast du `arbeit:lernhelfer-repository.zip` gepackt,
   setze diese Zeile ein, sonst lass den Platzhalter samt Zeile weg:

   ```text
   Weil du mir dein Repository mitgegeben hast, liegt auch lernhelfer-repository.zip bereit. Damit kannst du stattdessen alle Dateien im Repository ersetzen (außer dem Ordner .git).
   ```

   `{anweisung-hinweis}`: Hast du
   `kopie:skills/verwalten/projektanweisung.md` geändert, setze
   diese Zeile ein, sonst lass den Platzhalter samt Zeile weg:

   ```text
   Die Projektanweisungen haben sich geändert. Schreib nach dem Update in jedem Lernhelfer-Projekt „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“, dann bekommst du den neuen Text.
   ```

   `{automatik-hinweis}`: Hast du eine Datei in
   `kopie:skills/verwalten/geplant/` geändert, ergänzt oder entfernt, setze
   diese Zeile ein, sonst lass den Platzhalter samt Zeile weg:

   ```text
   Die automatischen Anweisungen haben sich geändert. Schreib nach dem Update in jedem Lernhelfer-Projekt, in dem sie laufen, „/lernhelfer:verwalten Richte die automatischen Anweisungen ein“, dann bekommen sie den neuen Text.
   ```
