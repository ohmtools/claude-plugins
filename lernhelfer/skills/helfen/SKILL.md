---
name: helfen
description: "Hilfe zum Lernhelfer, einer Lernumgebung für Oberstufe, Berufsschule und Studium: erklärt, was der Lernhelfer kann, wie man ihn installiert, einrichtet, aktualisiert und benutzt, was die Datenquelle ist, wo die Daten liegen und wie man Rückmeldung gibt. Verwende diesen Skill, wenn der Nutzer Fragen zum Lernhelfer selbst stellt, z.B. „Was kannst du?“, „Wie funktioniert der Lernhelfer?“, „Brauche ich ein Projekt?“, „Brauche ich GitHub?“, „Wie aktualisiere ich?“, oder um Hilfe oder Info zum Lernhelfer bittet."
---

# Lernhelfer – Helfen

Beantwortet Fragen des Nutzers zum Lernhelfer selbst: was er kann, wie man ihn
benutzt und wie man ihn installiert und aktualisiert.

## Grundsatz

- Antworte nur auf Basis dieses Skills. Erfinde keine Funktionen. Ist etwas
  als „noch nicht ausgearbeitet“ markiert, sag das offen.
- Schreib nichts ins Projekt.
- Pfade mit dem Präfix `projekt:` liegen in den Projektdateien. Nennst du sie
  dem Nutzer, dann lass das Präfix weg.
- Sprich Deutsch. Fachbegriffe dürfen englisch bleiben, aber bilde keine
  gemischten Satzstrukturen.

## Antworten

1. Such dir die passenden Einträge unter „Häufige Fragen“ heraus. Die
   Antworten dort sind Fakten für dich, keine wörtlichen Nachrichten.
2. Antworte knapp und für jemanden ohne technisches Vorwissen. Nenne
   Dateipfade nur, wenn der Nutzer danach fragt. Sag bei Funktionen, die es
   nur in einem eingerichteten Projekt gibt, dass sie eines brauchen.
3. Schließe mit einem konkreten nächsten Schritt, den der Nutzer direkt im
   Chat schreiben kann.

## Häufige Fragen

<faq>
    <eintrag>
        <frage>Was kann der Lernhelfer?</frage>
        <antwort>
Er besteht aus drei Skills:
- Lernen: Claude erklärt Themen, wiederholt Gelerntes und übt mit Aufgaben, mit
  den eigenen Skripten, Übungsblättern und Altklausuren des Nutzers.
  „Schwachstellen listen“ zeigt, womit der Nutzer in einem Fach noch
  Schwierigkeiten hat. Die Lernmodi Erlernen, Wiederholen und Üben sind noch
  nicht ausgearbeitet.
- Verwalten, nur in einem Claude.ai-Projekt: Projekt einrichten und mit einer
  Datenquelle verbinden, Fächer anlegen, umbenennen und löschen, Dateien
  hochladen und Fächern zuordnen, indizieren, Lernziele aus dem Modulhandbuch
  übernehmen, gespeicherte Daten an ein neues Format anpassen, Rückmeldung
  geben, die Umgebung testen und den Lernhelfer weiterentwickeln.
- Helfen: diese Antworten.
„Entwicklung“ nennst du nur als Möglichkeit für Fortgeschrittene, die ein
eigenes Repository pflegen.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Brauche ich ein Projekt?</frage>
        <antwort>
Der Lernhelfer ist ein Plugin und steht in jedem Chat zur Verfügung. Am besten
funktioniert er in einem Claude.ai-Projekt, das als Lernhelfer eingerichtet ist:
Nur dort merkt sich Claude die Fächer, ein Verzeichnis ihrer Unterlagen und
womit der Nutzer Schwierigkeiten hat. In einem einzelnen Chat hilft Claude mit
den Unterlagen, die der Nutzer im Chat anhängt, vergisst aber alles, sobald der
Chat endet. Zum Einrichten erstellt der Nutzer ein Projekt, startet darin einen
Chat und schreibt „/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer
ein“. Danach fügt er den Text, den Claude ihm gibt, in die Projektanweisungen
ein.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Was ist die Datenquelle, und brauche ich GitHub?</frage>
        <antwort>
Die Datenquelle ist der Ort, an dem Skripte, Übungsblätter, Altklausuren und das
Modulhandbuch liegen. Zurzeit kann das nur ein GitHub-Repository sein,
öffentlich oder privat. Skripte und Altklausuren anderer sind meist
urheberrechtlich geschützt und gehören deshalb in ein privates Repository. Für
ein privates Repository und fürs Hochladen braucht Claude Zugriff über die
GitHub-Anbindung von Claude.ai. Die Datenquelle ist freiwillig. Ohne sie merkt
sich Claude trotzdem die Fächer und Schwierigkeiten, die Unterlagen hängt der
Nutzer dann im Chat an. Mit ihr legt Claude ein Verzeichnis an, findet in jedem
Chat gezielt die richtigen Seiten und kann neue Dateien selbst dort ablegen.
Einrichten oder nachtragen lässt sie sich mit „/lernhelfer:verwalten Richte
dieses Projekt als Lernhelfer ein“. Darin liegt am besten pro Fach ein Ordner
(Name klein geschrieben, Wörter mit Bindestrich, ohne Umlaute, z.B.
lineare-algebra), das Modulhandbuch ohne Ordner.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Wie installiere und aktualisiere ich den Lernhelfer?</frage>
        <antwort>
Claude.ai verwaltet das Plugin unter Customize > Plugins. Am einfachsten fügt
der Nutzer dort über Add > Add marketplace den Link
<https://github.com/ohmtools/claude-plugins> hinzu, installiert daraus das
Plugin „lernhelfer“ und schaltet den automatischen Abgleich ein. Dann bekommt er neue Fassungen von selbst. Wer das Plugin als
Datei hochgeladen hat, lädt eine neue Datei hoch. Welche Fassung installiert
ist, weiß der Lernhelfer selbst nicht. Fächer, Datenquelle und alles, was Claude
sich gemerkt hat, bleiben bei einem Update erhalten. Braucht eine neue Fassung
ein anderes Format für die gespeicherten Daten, sagt Claude das. Der Nutzer
schreibt dann „/lernhelfer:verwalten Daten migrieren“ und den Namen eines Fachs,
für jedes Fach einmal. Nach einem Update kann er in jedem Lernhelfer-Projekt
„/lernhelfer:verwalten Richte dieses Projekt als Lernhelfer ein“ schreiben.
Claude prüft dann, ob die Projektanweisungen noch passen, und gibt bei Bedarf
den neuen Text.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Wie lege ich ein Fach an und füge Unterlagen hinzu?</frage>
        <antwort>
Nur im Projekt. Der Nutzer schreibt z.B. „/lernhelfer:verwalten Leg das Fach
Mathematik an“. Gibt es ein Modulhandbuch, übernimmt Claude daraus Beschreibung
und Lernziele, sonst fragt es nach einer kurzen Beschreibung. Unterlagen hängt
der Nutzer im Chat an und schreibt „/lernhelfer:verwalten Lade die Dateien in
Mathematik hoch“. Claude legt sie dann im Ordner des Fachs in der Datenquelle
ab. Der Nutzer kann sie auch selbst dort ablegen: Dateien im Ordner eines Fachs
ordnet Claude beim nächsten Indizieren von selbst zu, Dateien an anderen Stellen
mit z.B. „/lernhelfer:verwalten Blatt 3.pdf gehört zu Mathematik“. Eine Datei
darf zu mehreren Fächern gehören. Welche Dateien noch zu keinem Fach gehören,
sagt Claude auf Nachfrage. Zum Ersetzen lädt der Nutzer die neue Fassung unter
demselben Namen hoch. Nach dem Hochladen oder Zuordnen müssen die Dateien noch
indiziert werden, bevor Claude beim Lernen damit arbeitet.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Was passiert mit dem Modulhandbuch?</frage>
        <antwort>
Nur im Projekt mit Datenquelle. Das Modulhandbuch (an der Schule: Lehrplan)
liegt ohne Ordner in der Datenquelle, sein Dateiname muss „Modulhandbuch“ oder
„Lehrplan“ enthalten. Legt der Nutzer ein Fach an, sucht Claude darin den Teil
zu diesem Fach und übernimmt eine kurze Beschreibung und die Lernziele wörtlich.
Weil Claude dafür das ganze Handbuch liest, fragt es vorher, ob der Nutzer das
lieber in einem neuen Chat mit Haiku erledigt, um sein Nutzungslimit zu schonen.
Ist das Handbuch neu oder geändert, aktualisiert „Indizieren“ Beschreibung und
Lernziele aller Fächer. Für ein einzelnes Fach schreibt der Nutzer
„/lernhelfer:verwalten Übernimm die Lernziele für Mathematik“. Das Handbuch
selbst gehört zu keinem Fach.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Was heißt indizieren, und warum Haiku?</frage>
        <antwort>
Nur im Projekt mit Datenquelle. Beim Indizieren liest Claude neue und geänderte
Dateien aller Fächer einmal vollständig und legt pro Fach ein Verzeichnis an:
welche Dateien dazugehören und welche Stichwörter auf welchen Seiten stehen.
Spätere Chats finden die richtigen Stellen dann schnell, ohne alles neu zu
lesen. Dateien, die sich nicht geändert haben, liest Claude nicht noch einmal,
außer der Nutzer will es ausdrücklich (z.B. „Indiziere alles neu“). Das
Indizieren ist aufwendig, aber einfach, deshalb reicht das Modell Haiku und
schont das Nutzungslimit. Der Nutzer startet dazu einen neuen Chat mit Haiku und
schreibt „/lernhelfer:verwalten Indiziere“. Claude indiziert nur, wenn der
Nutzer es verlangt. Hat sich eine Datei seit dem letzten Indizieren geändert,
lernt Claude nicht mit ihr, sondern sagt Bescheid, damit es nicht mit falschen
Inhalten arbeitet. Bis dahin kann der Nutzer die Datei direkt im Chat anhängen.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Wo liegen meine Daten?</frage>
        <antwort>
Der Lernhelfer selbst steckt im Plugin, nicht im Projekt. Die Unterlagen liegen
in der Datenquelle. In den Projektdateien liegen nur die Daten des Nutzers:
- `projekt:daten.xml`: wo die Datenquelle ist und welchen Stand ihre Dateien
  beim letzten Indizieren hatten.
- `projekt:module/`: pro Fach eine Beschreibung mit Lernzielen (`info.md`) und
  das Verzeichnis der Unterlagen (`index.md`).
- `projekt:gedaechtnis/`: pro Fach, womit der Nutzer Schwierigkeiten hat oder
  hatte und woran es liegt (`probleme.md`), dazu `benutzererfahrung.md` mit
  Notizen, wo der Umgang mit dem Lernhelfer hakt.
Ein Update des Plugins ändert diese Daten nie. Braucht eine neue Fassung ein
anderes Format, passt „Daten migrieren“ sie an. In einem Chat ohne Projekt
speichert der Lernhelfer nichts.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Warum arbeitet Claude beim Lernen immer nur mit einem Fach?</frage>
        <antwort>
Jedes Fach steht für sich. Beim Lernen arbeitet Claude immer mit genau einem
Fach, so bleibt der Aufwand klein und nichts vermischt sich. Nennt der Nutzer
mehrere Fächer, bearbeitet Claude das erste und sagt, wofür er danach noch
einmal Bescheid geben soll. Beim Verwalten, z.B. beim Indizieren, arbeitet
Claude auch mit allen Fächern auf einmal.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Womit habe ich Schwierigkeiten?</frage>
        <antwort>
Der Nutzer schreibt „/lernhelfer:lernen Schwachstellen listen“ und den Namen
eines Fachs. Claude zählt die offenen Probleme in diesem Fach auf, wenn bekannt
mit ihrer Ursache, und gibt eine kurze Statistik: wie viele Probleme es
insgesamt notiert hat, wie viele inzwischen verstanden sind und wie viele an
mehreren Tagen ein Problem waren.
Nach diesen älteren Problemen kann der Nutzer danach gezielt fragen. Die
Probleme notieren die Lernmodi. Solange sie nicht ausgearbeitet sind, bleibt die
Liste meist leer. In einem Chat ohne Projekt nimmt Claude die Schwachstellen aus
dem bisherigen Chat.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Wie gebe ich Rückmeldung zum Lernhelfer?</frage>
        <antwort>
Im Projekt notiert Claude beim Lernen und Verwalten von selbst, wo der Umgang
mit dem Lernhelfer hakt: Unklarheiten, Fehler, Wünsche, ohne persönliche Daten
und ohne Inhalte der Unterlagen. Mit „/lernhelfer:verwalten Benutzererfahrung
teilen“ bekommt der Nutzer diese Notizen als Datei, die er an die Person
schickt, von der er den Lernhelfer hat. Danach kann Claude die geteilten
Einträge löschen.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Kann ich den Lernhelfer selbst verbessern?</frage>
        <antwort>
Am einfachsten mit Rückmeldung über „Benutzererfahrung teilen“.
Fortgeschrittene, die ein eigenes Repository pflegen, können ihn auch selbst
ändern: Der Nutzer beschreibt in einem Chat in einem Claude.ai-Projekt, was er
am Lernhelfer ändern will. Claude ändert eine Kopie, die nur in diesem Chat
besteht. Mit „/lernhelfer:verwalten Exportieren“ bekommt der Nutzer eine neue
Plugin-Datei, die er zum Ausprobieren hochlädt und in sein Repository überträgt.
        </antwort>
    </eintrag>
    <eintrag>
        <frage>Funktioniert der Lernhelfer bei mir?</frage>
        <antwort>
Der Nutzer schreibt „/lernhelfer:verwalten Teste den Lernhelfer“ in einem
eingerichteten Projekt. Claude prüft dann, ob die Umgebung kann, was der
Lernhelfer braucht und was frühere Tests noch nicht bestätigt haben.
Testdateien löscht es danach wieder, und bevor es in die Datenquelle schreibt,
fragt es um Erlaubnis. Am Ende gibt Claude eine
Ergebnistabelle aus, dazu ein ausführliches Protokoll und Vorschläge zur
Verbesserung, auch als Datei zum Herunterladen. Das Ergebnis ist für die
Weiterentwicklung gedacht.
        </antwort>
    </eintrag>
</faq>
