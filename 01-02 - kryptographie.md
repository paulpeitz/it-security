---
marp: true
theme: custom
paginate: false
html: true
footer: ![w:280](img/dhbw-ka.svg)
title: Kryptographie
---

<!-- _class: title -->
# Kryptographie


<br><br><br><br><br><br>

## Von Caesar bis Post-Quantum


<!-- _notes:
Diese Vorlesung spannt den Bogen von historischen Chiffren bis zu Verfahren, die auch gegen künftige Quantencomputer bestehen sollen. Für die Klausur ist nicht das Auswendiglernen mathematischer Herleitungen entscheidend, sondern die Fähigkeit, kryptographische Bausteine nach Zweck, Schlüsselart und Sicherheitsziel zu unterscheiden. Studierende sollten insbesondere erklären können, warum moderne Systeme mehrere Verfahren kombinieren und weshalb ein starker Algorithmus allein noch kein sicheres Gesamtsystem ergibt.

**Klausurvorbereitung:** Beim Wiederholen eine eigene Übersicht anlegen: Verfahren, symmetrisch oder asymmetrisch, zentraler Einsatzzweck, geschütztes Sicherheitsziel und typische Schwäche.
-->
---
<!-- _class: biglist -->
# Agenda

- **Grundlagen & Begriffe** – Was ist Krypto, Kerckhoffs, Sym vs. Asym
- **Klassische Verfahren** – Caesar, Vigenère, Kryptoanalyse
- **Exkurs Enigma** – Geniale Maschine, fatale Schwächen
- **Symmetrisch heute** – AES & warum der Modus zählt
- **Schlüsselaustausch & Asymmetrie** – Diffie-Hellman, RSA
- **Kryptographie in der Praxis** – Hybrid, Hashes, Signaturen, PKI
- **Ausblick** – Post-Quantum-Kryptographie

<!-- _notes:
Kurzer Einstieg: Kryptographie ist das Fundament fast aller Sicherheitsmechanismen, die wir in der CIA-Vorlesung kennengelernt haben – TLS, VPN, digitale Signaturen. Roter Faden: Wir folgen der historischen Evolution, weil sich daran die immer gleichen Prinzipien und Fehler am besten zeigen lassen. Überblick, keine Mathe-Vorlesung.

**Klausurvorbereitung:** Die Kapitel bilden zugleich eine Lernstruktur: erst Begriffe und Ziele, dann historische Angriffe, anschließend moderne Verfahren und schließlich deren Kombination in realen Systemen. Zu jedem Kapitel sollte mindestens ein Verfahren, sein Zweck und eine typische Grenze erklärt werden können.
-->

---
<!-- _class: chapter -->
# Grundlagen & Begriffe

## Worum geht es eigentlich?


<!-- _notes:
Kryptographie ist kein Selbstzweck, sondern stellt technische Mechanismen für Schutzziele wie Vertraulichkeit, Integrität und Authentizität bereit. Dabei muss immer zwischen dem mathematischen Verfahren und seiner Einbettung in ein Gesamtsystem unterschieden werden: Sichere Kryptographie kann durch schlechte Schlüsselverwaltung oder falsche Anwendung wirkungslos werden. Das Kapitel schafft deshalb die Begriffe, mit denen spätere Verfahren systematisch eingeordnet werden.

**Klausurvorbereitung:** Grundbegriffe nicht nur definieren, sondern an einem durchgängigen Beispiel wie einer verschlüsselten Nachricht korrekt verwenden können.
-->
---
# Kryptographie vs. Kryptoanalyse

- **Kryptographie**: Wissenschaft vom *Entwerfen* sicherer Verfahren
  - Ziel: Nachrichten so schützen, dass Unbefugte sie nicht lesen/verändern können

- **Kryptoanalyse**: Wissenschaft vom *Brechen* dieser Verfahren
  - Ziel: Schwächen finden, Klartext ohne Schlüssel rekonstruieren

- **Kryptologie**: Oberbegriff für beide Disziplinen

> **Merksatz:** Gute Kryptographie entsteht nur im ständigen Wettstreit mit der Kryptoanalyse.

<!-- _notes:
Wichtig für das Verständnis: Die beiden Seiten sind kein Widerspruch, sondern bedingen einander. Ein Verfahren gilt erst dann als sicher, wenn viele kluge Köpfe erfolglos versucht haben, es zu brechen. Analogie: Ein Schloss wird nicht dadurch besser, dass der Hersteller es geheim hält, sondern dadurch, dass Einbrecher weltweit daran gescheitert sind. Das leitet direkt zu Kerckhoffs über.

Kryptoanalyse umfasst mehr als das vollständige Durchprobieren aller Schlüssel: Sie nutzt unter anderem statistische Muster, mathematische Schwächen, Implementierungsfehler und Seitenkanäle. Kryptologie bezeichnet das gemeinsame Fachgebiet aus Konstruktion und Analyse kryptographischer Verfahren.

**Klausurvorbereitung:** Die drei Begriffe Kryptographie, Kryptoanalyse und Kryptologie sauber voneinander abgrenzen und erklären können, warum öffentliche Analyse Vertrauen schafft.
-->

---
# Ein paar Grundbegriffe

- **Klartext (plaintext)**: die lesbare Ausgangsnachricht
- **Geheimtext (ciphertext)**: die verschlüsselte, unlesbare Form
- **Verschlüsseln / Entschlüsseln**: Umwandlung in beide Richtungen
- **Schlüssel (key)**: geheime Information, die den Vorgang steuert
- **Chiffre (cipher)**: der Algorithmus/das Verfahren selbst

$$\text{Klartext} \xrightarrow[\text{Schl\"ussel}]{\text{Verschl\"usseln}} \text{Geheimtext} \xrightarrow[\text{Schl\"ussel}]{\text{Entschl\"usseln}} \text{Klartext}$$


<!-- _notes:
Diese Begriffe brauchen wir für den Rest der Vorlesung durchgehend. Betonen: Der Algorithmus (Chiffre) und der Schlüssel sind zwei getrennte Dinge. Beispiel geben: Bei einem Zahlenschloss ist der Mechanismus (drehen) bekannt, geheim ist nur die Zahlenkombination.

Formal kann man Verschlüsselung als $c = E_k(m)$ und Entschlüsselung als $m = D_k(c)$ schreiben. Ein korrektes Verfahren muss für zulässige Nachrichten und Schlüssel stets $D_k(E_k(m)) = m$ erfüllen. Der Geheimtext darf ohne den passenden Schlüssel keine praktisch verwertbaren Informationen über den Klartext offenbaren.

**Klausurvorbereitung:** In einem Beispiel Klartext, Geheimtext, Chiffre und Schlüssel eindeutig zuordnen; Algorithmus und Schlüssel nicht verwechseln.
-->

---
# Was Kryptographie leisten soll

Vier Schutzziele – direkte Verbindung zur CIA-Triade:

- **Vertraulichkeit**: Nur Befugte können mitlesen *(Confidentiality)*
- **Integrität**: Manipulation wird erkannt *(Integrity)*
- **Authentizität**: Der Absender ist wirklich, wer er vorgibt
- **Nicht-Abstreitbarkeit**: Handlungen sind nachweisbar zurechenbar

> Verschlüsselung schützt Vertraulichkeit – aber Integrität, Authentizität & Zurechenbarkeit brauchen *zusätzliche* Bausteine (Hashes, Signaturen).

<!-- _notes:
Ein Angreifer kann verschlüsselte Daten immer noch verändern oder sich als jemand anderes ausgeben. Diese vier Ziele sind der Fahrplan – jeden Baustein (Hash, Signatur) ordnen wir später einem Ziel zu. Rückbezug auf CIA-Vorlesung schafft Anknüpfung.

Vertraulichkeit beantwortet die Frage „Wer darf lesen?“, Integrität „Wurde etwas verändert?“ und Authentizität „Von wem stammt es?“. Nicht-Abstreitbarkeit geht darüber hinaus: Eine Handlung soll einer Person später beweisbar zugeordnet werden können. In realen Protokollen werden diese Ziele durch mehrere Bausteine gemeinsam erreicht.

**Klausurvorbereitung:** Für ein Szenario entscheiden können, welches Schutzziel verletzt ist und warum reine Verschlüsselung nicht automatisch Integrität oder Authentizität liefert.
-->

---
# Kerckhoffs' Prinzip (1883)

- **Kernaussage**: Die Sicherheit eines Verfahrens darf **nur vom Schlüssel** abhängen – nicht von der Geheimhaltung des Algorithmus.

- Der Algorithmus darf öffentlich bekannt sein, ohne dass die Sicherheit leidet.

- **Gegenteil**: „Security by Obscurity" – Sicherheit durch Verschleierung

> **Shannon's Maxime:** „Der Feind kennt das System."

<!-- _notes:
Das ist eines der wichtigsten Prinzipien der Vorlesung. Algorithmen lassen sich durch Reverse Engineering rekonstruieren, Quellcode kann veröffentlicht werden und Mitarbeiter können Wissen weitergeben. Ein kompromittierter Schlüssel lässt sich austauschen; ein kompromittiertes geheimes Verfahren müsste dagegen vollständig ersetzt werden. Moderne Standards wie AES sind öffentlich dokumentiert und gewinnen gerade durch langjährige unabhängige Prüfung Vertrauen. „Security by Obscurity“ kann Angriffe erschweren, darf aber niemals die tragende Sicherheitsannahme sein.

**Klausurvorbereitung:** Kerckhoffs' Prinzip in eigenen Worten erklären und auf ein proprietäres Verschlüsselungsverfahren anwenden können.
-->

---
<!-- _class: normal -->
# Symmetrisch vs. Asymmetrisch

<div class="columns">
<div>

### Symmetrisch
- **Ein** gemeinsamer Schlüssel
- Ver- und Entschlüsseln mit demselben Geheimnis
- Sehr **schnell**
- Problem: Wie tauscht man den Schlüssel sicher aus?
- Beispiel: **AES**

</div>
<div>

### Asymmetrisch
- **Schlüsselpaar**: öffentlich + privat
- Öffentlicher verschlüsselt, privater entschlüsselt
- Deutlich **langsamer**
- Löst das Austauschproblem
- Beispiel: **RSA**

</div>
</div>

<!-- _notes:
Das ist die zentrale Unterscheidung der Vorlesung. Analogie symmetrisch: ein Schlüssel für ein Vorhängeschloss, den beide Seiten besitzen – aber wie bekommt der Empfänger den Schlüssel, ohne dass ihn unterwegs jemand kopiert? Analogie asymmetrisch: ein offener Briefkasten, in den jeder einwerfen kann (öffentlicher Schlüssel), aber nur der Besitzer hat den Schlüssel zum Leeren (privater Schlüssel). Dieses Bild später bei RSA wieder aufgreifen. Ankündigen: Wir starten symmetrisch (historisch und praktisch der Ausgangspunkt) und lösen das Austauschproblem später mit Asymmetrie.

Symmetrische Verfahren eignen sich wegen ihrer Geschwindigkeit für große Datenmengen. Asymmetrische Verfahren erleichtern Schlüsselverteilung und ermöglichen Signaturen, benötigen aber deutlich mehr Rechenzeit und größere Schlüssel. In der Praxis ersetzt daher keine Kategorie die andere; beide werden in hybriden Verfahren kombiniert.

**Klausurvorbereitung:** Beide Kategorien anhand von Schlüsselanzahl, Geschwindigkeit, Verteilung und typischem Einsatz vergleichen können.
-->

---
# Symmetrisch vs. Asymmetrisch – Bild

![w:960 center](img/sym-vs-asym.svg)

<!-- _notes:
Die Grafik nochmal in Ruhe erklären: Links teilen sich beide denselben Schlüssel (rot), rechts hat jeder Empfänger ein Paar. Der Knackpunkt links ist der unsichere Kanal, über den der geteilte Schlüssel irgendwie hinkommen muss. Genau dieses Problem motiviert später Diffie-Hellman und RSA. Kurz halten, dient nur der Visualisierung.

**Bildbeschreibung:** Die linke Hälfte zeigt symmetrische Verschlüsselung: Sender und Empfänger verwenden dasselbe gemeinsame Geheimnis zum Ver- und Entschlüsseln. Die rechte Hälfte zeigt asymmetrische Verschlüsselung mit einem öffentlichen und einem privaten Schlüssel; der öffentliche Schlüssel darf verteilt werden, während der private beim Besitzer bleibt. Pfeile verdeutlichen jeweils, welcher Schlüssel in welcher Richtung eingesetzt wird.

**Klausurvorbereitung:** Die Grafik ohne Beschriftung erklären und daraus das Schlüsselverteilungsproblem der symmetrischen Kryptographie ableiten können.
-->

---
<!-- _class: chapter -->
# Klassische Verfahren

## Wie alles begann


<!-- _notes:
Historische Chiffren sind didaktisch wichtig, weil ihre Schwächen ohne komplexe Mathematik nachvollziehbar sind. Caesar zeigt einen zu kleinen Schlüsselraum, monoalphabetische Substitution verrät Sprachstatistik und Vigenère scheitert an periodischer Wiederholung. Damit werden bereits drei grundlegende Angriffsideen sichtbar: vollständiges Durchprobieren, Ausnutzen statistischer Struktur und Erkennen wiederkehrender Muster.

**Klausurvorbereitung:** Zu jedem klassischen Verfahren Funktionsprinzip, Schlüssel und entscheidenden Angriff nennen können.
-->
---
# Die Caesar-Chiffre

- Jeder Buchstabe wird um eine **feste Zahl** verschoben
- Julius Caesar nutzte eine Verschiebung um **3**

$$\text{A} \rightarrow \text{D}, \quad \text{B} \rightarrow \text{E}, \quad \text{C} \rightarrow \text{F} \ldots$$

- **Beispiel** (Verschiebung 3):
  - Klartext: `HALLO`
  - Geheimtext: `KDOOR`

- **Schlüssel**: die Verschiebung (nur 25 sinnvolle Möglichkeiten!)

<!-- _notes:
Die Antwort: einfach alle 25 Verschiebungen durchprobieren (Brute Force). Das führt zum Begriff des Schlüsselraums – hier winzig. Betonen, dass die Idee der Substitution bis heute in komplexer Form weiterlebt, aber ein zu kleiner Schlüsselraum jedes Verfahren wertlos macht. Eine feste Verschiebung hat nur wenige mögliche Schlüssel; Häufigkeitsanalyse nutzt zusätzlich statistische Eigenschaften der Sprache.

Beim Brute-Force-Angriff werden alle möglichen Schlüssel getestet, bis ein plausibler Klartext entsteht. Da eine Verschiebung um 0 keine Verschlüsselung bewirkt, bleiben beim lateinischen Alphabet nur 25 sinnvolle Schlüssel. Die Caesar-Chiffre bietet daher weder gegen systematisches Probieren noch gegen Sprachstatistik ausreichenden Schutz.

**Klausurvorbereitung:** Eine kurze Nachricht mit gegebener Verschiebung ver- und entschlüsseln sowie die Größe des Schlüsselraums begründen können.
-->

---
# Monoalphabetische Substitution

- Statt fester Verschiebung: **jeder Buchstabe** wird durch einen beliebigen anderen ersetzt
- Schlüsselraum: $26! \approx 4 \times 10^{26}$ Möglichkeiten – riesig!

- **Trotzdem leicht zu brechen.** Warum?
  - Die Struktur der Sprache bleibt erhalten
  - Häufige Buchstaben bleiben häufig – nur unter anderem Namen

<!-- _notes:
Brute Force ist hier unmöglich (10^26!), aber es gibt einen viel klügeren Angriff. Das ist eine der wichtigsten Lektionen der Kryptoanalyse: Man greift nicht die Menge der Schlüssel an, sondern die Struktur des Verfahrens.

Eine monoalphabetische Substitution verwendet zwar eine beliebige Permutation des Alphabets und besitzt deshalb einen riesigen Schlüsselraum. Dennoch wird jeder Klartextbuchstabe immer auf denselben Geheimtextbuchstaben abgebildet. Dadurch bleiben Häufigkeiten, Wortlängen, Doppelbuchstaben und typische Buchstabenkombinationen erhalten. Sicherheit hängt also nicht allein von der Anzahl möglicher Schlüssel ab.

**Klausurvorbereitung:** Erklären können, warum ein großer Schlüsselraum notwendig, aber nicht hinreichend für Sicherheit ist.
-->

---
# Kryptoanalyse: Häufigkeitsanalyse

- Jede Sprache hat eine **typische Buchstabenverteilung**
- Im Deutschen: **E** ist mit Abstand am häufigsten (~17 %), dann N, I, S, R
- Der häufigste Buchstabe im Geheimtext ist also vermutlich das **E**

- **Vorgehen**:
  - Buchstaben im Geheimtext zählen
  - Mit bekannter Sprachstatistik abgleichen
  - Schritt für Schritt das Alphabet rekonstruieren

> Erstmals dokumentiert vom Gelehrten **al-Kindī** (9. Jh.) – die Geburt der Kryptoanalyse.



<!-- _notes:
Die Häufigkeitsanalyse nutzt statistische Merkmale natürlicher Sprache: Im Deutschen tritt beispielsweise E häufig auf. Häufige Zeichen im Geheimtext können daher Hinweise auf Klartextbuchstaben liefern. Ein einzelnes Zeichen beweist noch nichts; weitere Muster wie kurze Wörter und Doppelbuchstaben stützen oder widerlegen die Vermutung.

Der Angriff funktioniert besonders gut bei längeren Texten, weil sich die beobachtete Verteilung dann der typischen Sprachverteilung annähert. Bei kurzen Texten sind Vermutungen unsicherer, weshalb zusätzliche Muster wie „EN“, „ER“ oder doppelte Buchstaben wichtig werden. Das Verfahren zeigt, dass Redundanz natürlicher Sprache für die Kryptoanalyse nutzbar ist.

**Klausurvorbereitung:** Den Ablauf einer Häufigkeitsanalyse beschreiben und erklären können, weshalb Textlänge und Sprache das Ergebnis beeinflussen.
-->

---
# Die Vigenère-Chiffre

- **Idee**: Verschiebung wechselt pro Buchstabe – gesteuert durch ein **Schlüsselwort**
- Gilt lange als „le chiffre indéchiffrable" (die unknackbare Chiffre)

- **Beispiel** mit Schlüssel `KEY`:

| Klartext | H | A | L | L | O |
|---|---|---|---|---|---|
| Schlüssel | K | E | Y | K | E |
| Geheimtext | R | E | J | V | S |

- Gleicher Klartextbuchstabe → **unterschiedliche** Geheimtextbuchstaben

<!-- _notes:
Der Fortschritt: Das erste L wird zu J, das zweite L zu V – die Häufigkeitsanalyse in ihrer einfachen Form läuft ins Leere, weil E nicht mehr immer gleich aussieht. Man nennt das polyalphabetisch. Das Verfahren galt rund 300 Jahre als sicher. Aber: Es hat eine versteckte Schwäche – das Schlüsselwort wiederholt sich. Genau da setzt der Angriff an.

Das Schlüsselwort wird so oft wiederholt, bis es die Länge des Klartexts erreicht. Jeder Schlüsselbuchstabe steht für eine eigene Caesar-Verschiebung; dadurch kann derselbe Klartextbuchstabe abhängig von seiner Position verschieden verschlüsselt werden. Die Sprachstatistik wird verteilt, verschwindet jedoch nicht vollständig, weil die Schlüsselpositionen periodisch wiederkehren.

**Klausurvorbereitung:** Den Unterschied zwischen monoalphabetischer und polyalphabetischer Substitution erklären und eine Tabellenzeile des Beispiels nachvollziehen können.
-->

---
# Auch Vigenère fällt

- **Schwäche**: Das Schlüsselwort **wiederholt sich** periodisch
- Findet man die **Schlüssellänge**, zerfällt Vigenère in mehrere *Caesar*-Chiffren
- Jede davon ist per Häufigkeitsanalyse angreifbar

- **Kasiski-Test (1863)**: Wiederkehrende Muster im Geheimtext verraten die Schlüssellänge

> **Lehre:** „Unknackbar" bedeutet meist nur „noch nicht geknackt".

> **Mini-Beispiel:** Wiederholen sich auffällige Zeichenfolgen im Abstand von 6 und 12 Zeichen, ist eine Schlüssellänge von 3 oder 6 ein möglicher Kandidat.

<!-- _notes:
Wichtige Meta-Lektion: In der Kryptographie ist Vorsicht bei dem Wort "unknackbar" geboten. Vigenère hielt 300 Jahre, dann fand Kasiski (und unabhängig Babbage) die Lücke. Sobald man die Schlüssellänge n kennt, nimmt man jeden n-ten Buchstaben – diese Gruppe wurde mit derselben Verschiebung chiffriert, also wieder simple Häufigkeitsanalyse. Das Muster "clevere Idee, jahrelang sicher, dann doch gebrochen" wird sich bei Enigma wiederholen.

Der Kasiski-Test sucht wiederholte Zeichenfolgen und untersucht die Abstände zwischen ihren Vorkommen. Gemeinsame Teiler dieser Abstände liefern Kandidaten für die Schlüssellänge. Ist eine Länge $n$ bekannt, werden die Zeichen nach ihrer Position modulo $n$ gruppiert; jede Gruppe entspricht dann einer Caesar-Chiffre. Der Angriff zerlegt somit ein komplex wirkendes Problem in mehrere bekannte Teilprobleme.

**Klausurvorbereitung:** Die Angriffskette „Muster finden → Schlüssellänge bestimmen → Teiltexte bilden → Häufigkeitsanalyse“ in der richtigen Reihenfolge erläutern können.
-->

---
<!-- _class: chapter -->
# Exkurs: Die Enigma

## Geniale Maschine, fatale Schwächen


<!-- _notes:
Die Enigma verbindet die bisherigen Konzepte mit einem realen historischen System. Ihr Beispiel zeigt, dass ein großer Schlüsselraum allein nicht genügt, wenn Konstruktion, Betriebsabläufe und menschliches Verhalten zusätzliche Informationen preisgeben. Für die Bewertung eines Kryptosystems muss deshalb immer das vollständige soziotechnische System betrachtet werden.

**Klausurvorbereitung:** Die Schwächen der Enigma den Kategorien Konstruktion, Schlüsselmanagement und Bedienung zuordnen können.
-->
---
<!-- _class: biglist -->
# Enigma – Kontext & Bedeutung

- Deutsche Rotor-Chiffriermaschine, im **2. Weltkrieg** militärisch eingesetzt
- Elektromechanische Umsetzung einer **polyalphabetischen** Chiffre
- Galt als praktisch unknackbar – Schlüsselraum von rund $10^{23}$
- Ihr Bruch durch die Alliierten hatte **kriegsentscheidende** Bedeutung

<!-- _notes:
Historischer Rahmen: Die Enigma ist das perfekte Fallbeispiel, weil sie mathematisch enorm stark war, aber durch Konstruktions- und Bedienfehler brach. Der Bruch verkürzte laut Historikern den Krieg um schätzungsweise zwei Jahre. Das Thema ist auch popkulturell bekannt (Film "The Imitation Game") – daran anknüpfen.

Die rotierenden Walzen änderten die Substitution nach jedem Tastendruck und erzeugten damit eine polyalphabetische Chiffre. Das Steckerbrett vergrößerte den Schlüsselraum zusätzlich. Trotzdem ist die Zahl $10^{23}$ kein Sicherheitsbeweis, denn Kryptoanalyse muss nicht jede mögliche Einstellung einzeln testen.

**Klausurvorbereitung:** Erklären können, weshalb die Enigma trotz sehr großen Schlüsselraums gebrochen werden konnte.
-->

---
# Enigma – Tagesschlüssel

- Sicherheit hing an der **Grundeinstellung** (dem „Tagesschlüssel"):
  - Auswahl & Reihenfolge der Walzen
  - Startposition jeder Walze
  - Steckerbrett-Verbindungen

- Verteilt über **gedruckte Codebücher** an alle Funkstellen
- Schlüsselwechsel täglich um Mitternacht

> Kerckhoffs in Reinform: Die Maschine war den Alliierten bekannt – geheim war nur der Tagesschlüssel.

<!-- _notes:
Perfekte Illustration von Kerckhoffs: Die Alliierten besaßen erbeutete Enigmas, kannten also den Algorithmus vollständig. Die Sicherheit ruhte allein auf dem Tagesschlüssel. Das Problem: Diese Schlüssel mussten physisch in Codebüchern verteilt werden – erbeutete Bücher (z.B. von U-Booten) waren Gold wert.

Der Tagesschlüssel konfigurierte die Maschine für ein gesamtes Kommunikationsnetz und war damit ein besonders wertvolles Geheimnis. Seine zentrale Erzeugung, physische Verteilung und tägliche Nutzung bildeten einen eigenen Angriffsbereich. Ein erbeutetes Codebuch kompromittierte nicht die Maschine dauerhaft, aber die darin enthaltenen Schlüssel für den jeweiligen Zeitraum.

**Klausurvorbereitung:** Kerckhoffs' Prinzip am Beispiel von Maschine und Tagesschlüssel erläutern und das Risiko zentral verteilter Schlüssel bewerten können.
-->

---
# Enigma – Die Schwächen

- **Konstruktionsfehler Reflektor**: Kein Buchstabe konnte auf **sich selbst** abgebildet werden
  - Ein A wurde nie zu einem A → wertvoller Ansatzpunkt für Angreifer

- **Bedienfehler**:
  - Vorhersehbare Nachrichten („Wetterbericht", „Keine besonderen Vorkommnisse")
  - Wiederholte Standardfloskeln als **Cribs** (vermutete Klartextstücke)
  - Schwache, wiederholte Spruchschlüssel der Funker

- **Menschliche Routine** unterlief die geniale Technik

<!-- _notes:
Das ist die Kernbotschaft des Exkurses: Nicht die Mathematik brach, sondern das Drumherum. Die "kein Buchstabe auf sich selbst"-Eigenschaft erlaubte es, falsche Positionen für einen vermuteten Klartext (Crib) schnell auszuschließen. Die berühmten "cribs" wie das tägliche "WETTERBERICHT" gaben den Codebreakern bekannte Klartext-Geheimtext-Paare. Analogie zu heute: Auch modernste Verschlüsselung nützt nichts, wenn Passwörter "123456" sind oder Menschen vorhersehbar handeln. Der Mensch ist oft die schwächste Stelle.

Ein Crib ist ein vermutetes Klartextstück, das an verschiedenen Positionen gegen den Geheimtext gelegt wird. Sobald dabei ein Buchstabe auf sich selbst abgebildet werden müsste, konnte diese Position wegen der Reflektoreigenschaft ausgeschlossen werden. Standardisierte Meldungen und wiederkehrende Formulierungen lieferten besonders zuverlässige Cribs. Heute entspricht dies dem allgemeinen Prinzip, vorhersehbare Eingaben und Protokollstrukturen in ein Angriffsmodell einzubeziehen.

**Klausurvorbereitung:** Die Begriffe Crib und Known-Plaintext-Angriff erklären sowie Konstruktions- und Bedienfehler getrennt benennen können.
-->

---
<!-- _class: biglist -->
# Enigma – Bletchley Park & Turing

- Britisches Entschlüsselungszentrum **Bletchley Park**
- **Alan Turing** entwickelte die elektromechanische **„Bombe"**
  - Testete systematisch Rotorstellungen und schloss Widersprüche aus
  - Nutzte Cribs, um den Suchraum drastisch zu verkleinern
- Vorarbeiten polnischer Mathematiker (u. a. **Marian Rejewski**)
- Ergebnis: **„Ultra"** – ein entscheidender alliierter Nachrichtenvorteil

<!-- _notes:
Würdigen: Die polnischen Mathematiker um Rejewski hatten die Enigma schon in den 1930ern teilweise gebrochen und ihr Wissen 1939 an Briten und Franzosen weitergegeben – ein oft vergessener Beitrag. Turings Bombe war keine Brute-Force-Maschine, sondern nutzte logische Widersprüche (dank der Reflektor-Schwäche und Cribs), um Millionen Stellungen pro Schritt auszuschließen. Bletchley Park war zugleich die Geburtsstunde der modernen Informatik. Guter Moment für den Filmbezug "The Imitation Game", aber betonen, dass Teamarbeit tausender Menschen dahinterstand.

Die Bombe entschlüsselte Nachrichten nicht direkt, sondern suchte automatisiert nach Rotorstellungen, die zu einem Crib widerspruchsfrei passten. Dadurch wurde der Suchraum stark reduziert; verbleibende Kandidaten mussten anschließend geprüft werden. Der Erfolg beruhte auf Mathematik, Geheimdienstinformationen, erbeutetem Material, Technik und organisierter Teamarbeit.

**Klausurvorbereitung:** Die Bombe nicht als bloße Brute-Force-Maschine beschreiben, sondern ihren Ausschluss logischer Widersprüche hervorheben.
-->

---
<!-- _class: biglist -->
# Enigma – Was wir lernen

- **Kerckhoffs bestätigt**: Sicherheit lag im Schlüssel, nicht in der geheimen Maschine
- **Komplexität ≠ Sicherheit**: $10^{23}$ Kombinationen halfen nicht gegen kluge Angriffe
- **Der Mensch ist das Risiko**: Bedienfehler brachen die Chiffre, nicht die Mathematik
- **Bekannter Klartext ist gefährlich**: Cribs sind ein realer Angriffsvektor – bis heute

<!-- _notes:
Diese vier Lehren sind zeitlos und gelten für moderne Verfahren genauso. Der "Known-Plaintext-Angriff" (Crib) ist bis heute ein Standard-Angriffsmodell, gegen das moderne Chiffren beweisbar resistent sein müssen. Brücke zur Gegenwart schlagen: Nach dem Krieg wurde klar, dass man Verschlüsselung auf ein solides, öffentlich geprüftes, mathematisches Fundament stellen muss – nicht auf mechanische Tricks. Das führt uns zum modernen symmetrischen Standard: AES.

„Komplex“ und „sicher“ sind keine Synonyme: Entscheidend ist, ob ein Angreifer eine Abkürzung gegenüber dem vollständigen Durchprobieren findet. Moderne Verfahren werden daher gegen definierte Angriffsmodelle geprüft. Ebenso wichtig sind zufällige Schlüssel, sichere Implementierungen und Betriebsprozesse, die keine vorhersehbaren Muster erzeugen.

**Klausurvorbereitung:** Aus dem Fall Enigma mindestens drei allgemeine Lehren ableiten und auf ein heutiges IT-System übertragen können.
-->

---
<!-- _class: chapter -->
# Symmetrische Verschlüsselung heute

## Der Standard: AES


<!-- _notes:
AES steht exemplarisch für moderne symmetrische Kryptographie: öffentlich standardisiert, intensiv analysiert und effizient implementierbar. Das Kapitel trennt die Sicherheit der Blockchiffre von ihrer korrekten praktischen Nutzung. Neben Algorithmus und Schlüssellänge sind Betriebsmodus, zufällige Zusatzwerte und Schlüsselverwaltung entscheidend.

**Klausurvorbereitung:** AES als symmetrische Blockchiffre einordnen und erklären können, weshalb der Algorithmus allein noch keine vollständige Verschlüsselungslösung ist.
-->
---

# AES – Advanced Encryption Standard

- **2001** vom US-Institut NIST standardisiert (Vorgänger: DES)
- Gewinner eines **offenen, öffentlichen** Wettbewerbs (Algorithmus „Rijndael")
- **Blockchiffre**: verschlüsselt Daten in Blöcken zu 128 Bit
- Schlüssellängen: **128, 192 oder 256 Bit**
- Weltweiter Standard: TLS, VPN, WLAN (WPA2/3), Festplatten, Messenger

> **Vor dem Modus:** Längere Nachrichten bestehen aus mehreren 128-Bit-Blöcken. Ein Betriebsmodus legt fest, wie diese Blöcke zusammen verarbeitet werden.

<!-- _notes:
AES ist gelebtes Kerckhoffs-Prinzip: Der Algorithmus wurde in einem offenen Wettbewerb ausgewählt, ist vollständig öffentlich und wird seit über 20 Jahren weltweit von den besten Kryptoanalytikern attackiert – ohne praktisch relevanten Erfolg. Anschaulich: Ein Brute-Force-Angriff auf AES-128 würde selbst mit allen Computern der Welt länger dauern als das Universum alt ist.

Die Blockgröße von 128 Bit ist bei allen drei AES-Varianten gleich; nur die Schlüssellänge und damit auch die Zahl interner Runden unterscheiden sich. Eine Blockchiffre verarbeitet zunächst genau einen Block, während Anwendungen meist Nachrichten beliebiger Länge schützen müssen. Ein Betriebsmodus regelt deshalb die Verkettung mehrerer Blöcke und sollte heute zusätzlich Authentizität liefern, etwa durch ein AEAD-Verfahren wie GCM.

**Klausurvorbereitung:** Blockgröße und Schlüssellänge nicht verwechseln; die Werte 128 Bit Blockgröße sowie 128, 192 oder 256 Bit Schlüssel kennen.
-->

---
<!-- _class: biglist -->
# AES – warum so vertrauenswürdig?

- **Offen & geprüft**: Über 20 Jahre weltweite Kryptoanalyse ohne praktischen Bruch
- **Schnell**: Moderne CPUs haben AES **in Hardware** eingebaut (AES-NI)
- **Skalierbar**: 128 Bit für fast alles, 256 Bit für höchste Ansprüche
- **Brute Force chancenlos**: $2^{128}$ Schlüssel – astronomisch groß


<!-- _notes:
Der Punkt: AES selbst ist exzellent, aber ein Klartext ist meist länger als 128 Bit. Man muss also viele Blöcke nacheinander verschlüsseln – und WIE man das tut (der "Modus"), ist sicherheitskritisch. Ein perfekter Algorithmus im falschen Modus ist unsicher.

AES-NI beschleunigt AES-Operationen direkt in moderner Prozessorhardware und erschwert zugleich bestimmte zeitbasierte Seitenkanäle gegenüber Tabellenimplementierungen. Die theoretische Zahl $2^{128}$ beschreibt mögliche Schlüssel bei idealer zufälliger Erzeugung. Schwache Passwörter oder schlecht erzeugte Schlüssel reduzieren diese effektive Sicherheit drastisch, auch wenn AES selbst unverändert stark bleibt.

**Klausurvorbereitung:** Begründen können, warum ein 128-Bit-Schlüssel nicht mit einem Passwort von geringer Entropie gleichzusetzen ist und warum der Betriebsmodus sicherheitsrelevant bleibt.
-->

---
# Das Schlüsselverteilungsproblem

- AES ist schnell und sicher – aber **beide Seiten brauchen denselben Schlüssel**
- Wie kommt der Schlüssel sicher zum Empfänger?
  - Persönlich übergeben? Unpraktisch bei Millionen Nutzern
  - Über das Internet schicken? Dann kann ihn jeder abfangen

- Bei $n$ Teilnehmern: $\frac{n(n-1)}{2}$ Schlüssel nötig
  - 1.000 Nutzer → ~500.000 Schlüssel

> **Das zentrale Dilemma der symmetrischen Kryptographie.**

<!-- _notes:
Das ist der Cliffhanger, der die zweite Hälfte der Vorlesung motiviert. Zwei Probleme: (1) Man kann den geheimen Schlüssel nicht sicher über einen unsicheren Kanal schicken – ein Henne-Ei-Problem. (2) Die Zahl der Schlüssel explodiert bei vielen Teilnehmern. Beispiel greifbar machen: Wenn jeder mit jedem sicher kommunizieren will, braucht es quadratisch viele Schlüssel. Genau diese beiden Probleme lösten Mitte der 1970er Jahre zwei bahnbrechende Ideen: Diffie-Hellman und asymmetrische Kryptographie. Das ist einer der größten Durchbrüche der Informatikgeschichte.

Die Formel zählt für jedes ungeordnete Teilnehmerpaar genau einen eigenen symmetrischen Schlüssel. Für $n=1000$ ergibt sich $1000 \cdot 999 / 2 = 499.500$. Zusätzlich zur sicheren Erstverteilung müssen diese Schlüssel gespeichert, rotiert und bei Kompromittierung ersetzt werden.

**Klausurvorbereitung:** Die Formel $n(n-1)/2$ anwenden und sowohl das Transport- als auch das Skalierungsproblem beschreiben können.
-->

---
<!-- _class: chapter -->
# Schlüsselaustausch & Asymmetrie

## Der Durchbruch der 1970er


<!-- _notes:
Die Verfahren dieses Kapitels lösen unterschiedliche Teile des Schlüsselverteilungsproblems. Diffie-Hellman vereinbart ein gemeinsames Geheimnis, asymmetrische Verschlüsselung arbeitet mit einem öffentlichen und einem privaten Schlüssel, und RSA ist ein konkretes Verfahren für asymmetrische Operationen. Diese Begriffe dürfen nicht synonym verwendet werden.

**Klausurvorbereitung:** Diffie-Hellman, das allgemeine Prinzip asymmetrischer Kryptographie und RSA fachlich voneinander abgrenzen können.
-->
---
<!-- _class: biglist -->
# Diffie-Hellman – die Idee

- **Problem gelöst 1976**: Zwei Parteien vereinbaren über einen **öffentlichen** Kanal einen **gemeinsamen geheimen** Schlüssel
- Ein Lauscher, der alles mithört, kann das Geheimnis **trotzdem nicht** berechnen
- Grundlage: eine mathematische **Einwegfunktion** (leicht vorwärts, praktisch unmöglich rückwärts)

> Kein Schlüssel wird je übertragen – er wird auf beiden Seiten **berechnet**.

<!-- _notes:
Zwei Leute schreien sich über einen Marktplatz Zahlen zu, und am Ende teilen sie ein Geheimnis, das keiner der Zuhörer kennt. Der Trick ist eine Einwegfunktion: leicht in eine Richtung zu rechnen, praktisch unmöglich umzukehren (hier: diskreter Logarithmus). Wichtig für die Einordnung: DH tauscht keinen fertigen Schlüssel aus, sondern beide Seiten mischen ihre Geheimnisse so, dass am Ende dasselbe herauskommt.

Beide Parteien wählen je einen privaten Wert und berechnen daraus öffentliche Werte. Aus dem fremden öffentlichen und dem eigenen privaten Wert entsteht auf beiden Seiten dasselbe gemeinsame Geheimnis. Ein passiver Lauscher kennt nur die öffentlichen Werte; ohne einen privaten Wert müsste er das zugrunde liegende schwierige mathematische Problem lösen. Reines Diffie-Hellman authentifiziert die Kommunikationspartner jedoch nicht und ist deshalb ohne zusätzliche Absicherung für Man-in-the-Middle-Angriffe anfällig.

**Klausurvorbereitung:** Erklären können, was öffentlich übertragen wird, was geheim bleibt und welche Sicherheitsleistung Diffie-Hellman nicht erbringt.
-->

---
# Diffie-Hellman – die Farb-Analogie

![w:720 center](img/diffie-hellman.svg)

- Öffentliche Farbe + je eine **geheime** Farbe → gemischt ausgetauscht
- Beide mischen ihre geheime Farbe dazu → **identische** Endmischung
- Lauscher sieht nur die Mischungen – **Farben trennen ist unmöglich**

<!-- _notes:
Die Analogie Schritt für Schritt: (1) Beide einigen sich öffentlich auf eine gemeinsame Grundfarbe (z.B. Gelb) – das darf jeder wissen. (2) Jeder wählt eine geheime Farbe und mischt sie mit Gelb. (3) Die Mischungen werden öffentlich getauscht. (4) Jeder gibt seine geheime Farbe zur empfangenen Mischung – beide erhalten dieselbe Endfarbe. Der Lauscher hat zwar beide Mischungen, kann aber Farben nicht wieder auftrennen (das ist die Einwegfunktion). In echt sind es keine Farben, sondern modulare Potenzen, aber das Prinzip ist identisch. Hinweis: DH schützt nur den Austausch, authentifiziert die Partner aber nicht – das leistet später die Signatur.

**Bildbeschreibung:** Das Diagramm zeigt zwei Kommunikationspartner mit einer gemeinsamen öffentlichen Ausgangsfarbe und je einer privaten Geheimfarbe. Beide senden nur ihre gemischten Zwischenfarben über den beobachtbaren Kanal. Nach dem Hinzufügen der jeweils eigenen Geheimfarbe entsteht auf beiden Seiten dieselbe Endfarbe; der Lauscher sieht die Zwischenwerte, kann die Mischungen aber nicht in ihre Bestandteile zerlegen.

**Klausurvorbereitung:** Die Elemente der Farbanalogie den realen Größen zuordnen: öffentliche Grundparameter, privater Wert, öffentlicher Zwischenwert und gemeinsames Geheimnis. Die Analogie erklärt Vertraulichkeit gegenüber passivem Mithören, aber keine Authentifizierung.
-->

---
# Asymmetrische Kryptographie – das Prinzip

- **Schlüsselpaar** pro Person: öffentlicher + privater Schlüssel
- Mathematisch verbunden, aber der private lässt sich **nicht** aus dem öffentlichen berechnen

- **Öffentlicher Schlüssel**: darf jeder kennen (verschlüsselt Nachrichten an mich)
- **Privater Schlüssel**: bleibt geheim (nur ich kann entschlüsseln)

> **Briefkasten-Analogie**: Einwurf kann jeder (öffentlich), leeren nur der Besitzer (privat).

<!-- _notes:
Der Einwurfschlitz ist öffentlich (jeder kann eine Nachricht einwerfen = verschlüsseln), aber nur der Besitzer hat den Schlüssel zum Leeren (= entschlüsseln). Das löst das Verteilungsproblem elegant: Man muss nur seinen öffentlichen Schlüssel verteilen, und der darf ruhig abgehört werden. Kein gemeinsames Geheimnis mehr nötig. Diese Idee (Diffie, Hellman, Merkle) war revolutionär, weil sie jahrhundertealte Annahmen über den Haufen warf. Das konkreteste Verfahren dafür ist RSA.

Die mathematische Verbindung des Schlüsselpaars erlaubt komplementäre Operationen, ohne dass der private Schlüssel aus dem öffentlichen praktisch berechnet werden kann. Der private Schlüssel muss gegen Diebstahl geschützt werden; sein Verlust gefährdet je nach Verfahren Entschlüsselung oder Signaturen. Der öffentliche Schlüssel muss nicht geheim, aber authentisch sein, denn ein untergeschobener Schlüssel ermöglicht einen Man-in-the-Middle-Angriff.

**Klausurvorbereitung:** Geheimhaltung und Authentizität unterscheiden: Der öffentliche Schlüssel darf bekannt sein, seine korrekte Zuordnung zu einer Identität muss aber geprüft werden.
-->

---
# RSA – die Grundidee

- Benannt nach **Rivest, Shamir, Adleman** (1977)
- Sicherheit beruht auf: **Zwei große Primzahlen multiplizieren ist leicht – das Produkt wieder zerlegen ist praktisch unmöglich**

- Vereinfacht:
  - Verschlüsseln mit öffentlichem Schlüssel: $c = m^e \bmod n$
  - Entschlüsseln mit privatem Schlüssel: $m = c^d \bmod n$

- Das große $n$ (Produkt zweier Primzahlen) ist öffentlich – seine **Faktoren** sind das Geheimnis

<!-- _notes:
Bewusst nur die Grundidee, keine Herleitung. Kern in einem Satz: Multiplizieren ist leicht, Faktorisieren ist schwer. Beispiel: 17 × 23 = 391 rechnet jeder schnell; aber gegeben nur 391, die beiden Faktoren zu finden ist mühsam – und bei Zahlen mit 600+ Stellen für klassische Computer praktisch unmöglich. Die beiden Formeln nur zeigen, um die Symmetrie zu illustrieren (e öffentlich, d privat), NICHT durchrechnen. Wichtige Einordnung: RSA ist langsam, deshalb verschlüsselt man damit in der Praxis keine großen Datenmengen – das führt direkt zur hybriden Verschlüsselung.

Das öffentliche RSA-Schlüsselpaar enthält insbesondere $n$ und den öffentlichen Exponenten $e$; der private Exponent $d$ wird aus geheimen Informationen abgeleitet. Die Sicherheit realer RSA-Nutzung benötigt zusätzlich sichere Schlüssellängen und ein korrektes Padding wie OAEP für Verschlüsselung oder PSS für Signaturen. „Lehrbuch-RSA“ ohne Padding ist deterministisch und nicht sicher für die Praxis.

**Klausurvorbereitung:** Die Sicherheitsannahme Faktorisierung und die Rollen von $e$, $d$ und $n$ grob zuordnen; keine mathematische Herleitung auswendig lernen.
-->

---
<!-- _class: biglist -->
# RSA – wofür man es nutzt

- **Verschlüsselung** kleiner Datenmengen (z. B. eines AES-Schlüssels)
- **Digitale Signaturen** (dazu gleich mehr)
- **Langsam** im Vergleich zu AES → nicht für große Datenmengen geeignet

> **Konsequenz**: In der Praxis kombiniert man beide Welten → **hybride Verschlüsselung**.

<!-- _notes:
RSA-Operationen mit großen Ganzzahlen sind erheblich teurer als symmetrische Verschlüsselung. Man nutzt RSA daher nicht, um ganze Dateien zu verschlüsseln, sondern für kleine Datenmengen wie einen zufälligen Sitzungsschlüssel oder für digitale Signaturen. Moderne TLS-Verbindungen verwenden für den Schlüsselaustausch meist ephemeres Diffie-Hellman statt RSA-Schlüsseltransport, RSA kann dort aber weiterhin zur Authentifizierung durch Signaturen dienen.

**Klausurvorbereitung:** Für RSA die drei Punkte „asymmetrisch, langsam, für kleine Daten oder Signaturen“ sicher nennen und vom Einsatz von AES abgrenzen können.
-->

---
<!-- _class: chapter -->
# Kryptographie in der Praxis

## So funktioniert es wirklich


<!-- _notes:
Reale Sicherheitsprotokolle kombinieren spezialisierte kryptographische Bausteine. Ein Verfahren schützt Daten effizient, ein anderes vereinbart Schlüssel, Hashfunktionen verdichten Nachrichten, Signaturen sichern Herkunft und Integrität, und Zertifikate schaffen Vertrauen in öffentliche Schlüssel. Die Sicherheit entsteht aus dem korrekten Zusammenspiel dieser Komponenten.

**Klausurvorbereitung:** Für HTTPS oder einen Messenger eine plausible Kette aus Schlüsselaustausch, symmetrischer Verschlüsselung, Signatur und Zertifikatsprüfung beschreiben können.
-->
---
# Hybride Verschlüsselung

![w:620 center](img/hybrid.svg)

- **Asymmetrisch** (RSA/DH) transportiert sicher einen zufälligen **AES-Schlüssel**
- **Symmetrisch** (AES) verschlüsselt dann die eigentlichen Daten – schnell

> Das Beste aus beiden Welten: Sicherheit des Austauschs **+** Geschwindigkeit von AES.

<!-- _notes:
Das ist das "Aha, so hängt alles zusammen"-Moment. Ablauf: (1) Absender erzeugt einen zufälligen AES-Sitzungsschlüssel. (2) Dieser AES-Schlüssel wird mit dem öffentlichen RSA-Schlüssel des Empfängers verschlüsselt und mitgeschickt. (3) Die eigentliche Nachricht/Datei wird schnell mit AES verschlüsselt. (4) Der Empfänger entschlüsselt mit seinem privaten Schlüssel zuerst den AES-Schlüssel, dann damit die Daten. Genau so funktioniert TLS/HTTPS bei jedem Webseitenaufruf und jeder Messenger. Betonen: Das ist keine Theorie, sondern läuft milliardenfach täglich.

Ein Sitzungsschlüssel gilt typischerweise nur für eine Verbindung oder einen begrenzten Zeitraum. Das reduziert die Folgen einer späteren Kompromittierung und ermöglicht regelmäßigen Schlüsselwechsel. In modernen Protokollen kann Diffie-Hellman das gemeinsame Geheimnis vereinbaren; die Grundidee der Hybridität bleibt dieselbe: asymmetrisch aushandeln oder schützen, symmetrisch Massendaten verarbeiten.

**Bildbeschreibung:** Das Diagramm trennt den Ablauf in zwei Ebenen. Ein kleiner zufälliger Sitzungsschlüssel wird mit einem asymmetrischen Verfahren geschützt oder vereinbart; die deutlich größere Nutzlast wird anschließend mit diesem gemeinsamen symmetrischen Schlüssel ver- und entschlüsselt. Pfeile zeigen die Reihenfolge vom Schlüsselschutz zur schnellen Datenverschlüsselung.

**Klausurvorbereitung:** Die Reihenfolge der Schritte und die Begründung nennen können: Asymmetrie löst Verteilung beziehungsweise Aushandlung, Symmetrie liefert Effizienz.
-->

---
# Kryptographische Hashfunktionen

- Bilden beliebig lange Daten auf einen **festen, kurzen** Wert ab (den „Fingerabdruck")
- **Einwegfunktion**: aus dem Hash lässt sich das Original nicht rekonstruieren
- Kleinste Änderung am Input → **völlig anderer** Hash (Lawineneffekt)
- **Kollisionsresistent**: kaum zwei Eingaben mit gleichem Hash

- Standards: **SHA-256, SHA-3** (nicht mehr: MD5, SHA-1 – gebrochen)

> Anwendung: Integritätsprüfung, Passwortspeicherung, Signaturen, Blockchain.

<!-- _notes:
Hashing ist KEINE Verschlüsselung – es gibt keinen Schlüssel und keinen Weg zurück. Analogie: Ein Fingerabdruck identifiziert eine Person eindeutig, aber aus dem Fingerabdruck lässt sich die Person nicht "rekonstruieren". Der Lawineneffekt ist eindrücklich: "Hallo" und "hallo" ergeben komplett verschiedene Hashes. Praxisbezug: Download-Prüfsummen, Passwörter werden nie im Klartext gespeichert, sondern als (gesalzener) Hash. MD5/SHA-1 sind gebrochen, weil man Kollisionen erzeugen kann – nicht mehr verwenden.

Wichtige Sicherheitseigenschaften sind Urbildresistenz, Zweiturbildresistenz und Kollisionsresistenz. Wegen des festen Ausgaberaums müssen mathematisch Kollisionen existieren; sicher bedeutet, dass sie praktisch nicht gezielt gefunden werden können. Passwörter sollten nicht mit einer schnellen allgemeinen Hashfunktion allein gespeichert werden, sondern mit Salt und einer langsamen Passwort-Hashfunktion wie Argon2id, scrypt oder bcrypt.

**Klausurvorbereitung:** Hashing von Verschlüsselung unterscheiden, Lawineneffekt und Kollision erklären sowie den Zweck eines Salts benennen können.
-->

---
# Digitale Signaturen

![w:720 center](img/signatur.svg)

- **Signieren**: Hash der Nachricht mit dem **privaten** Schlüssel verschlüsseln
- **Prüfen**: Empfänger vergleicht mit dem **öffentlichen** Schlüssel
- Umgekehrte Nutzung der Asymmetrie: privat signiert, öffentlich prüft

<!-- _notes:
Bei der Signatur nutzt man den PRIVATEN Schlüssel zum Signieren – denn nur der Besitzer soll signieren können, aber jeder soll prüfen können. Ablauf: Absender bildet den Hash der Nachricht und "verschlüsselt" ihn mit seinem privaten Schlüssel = Signatur. Der Empfänger entschlüsselt die Signatur mit dem öffentlichen Schlüssel und vergleicht mit dem selbst berechneten Hash. Stimmen sie überein, ist bewiesen: (1) Nachricht unverändert (Integrität), (2) sie stammt vom Absender (Authentizität), (3) er kann es nicht leugnen (Nicht-Abstreitbarkeit). Drei Schutzziele auf einmal!

Die Formulierung „Hash mit dem privaten Schlüssel verschlüsseln“ ist ein vereinfachtes Anschauungsmodell und trifft nicht auf jedes Signaturverfahren technisch exakt zu. Entscheidend ist: Nur der private Schlüssel kann eine gültige Signatur erzeugen, der zugehörige öffentliche Schlüssel kann sie prüfen. Eine gültige Prüfung ist nur dann einer Person zurechenbar, wenn der öffentliche Schlüssel verlässlich dieser Person zugeordnet wurde.

**Bildbeschreibung:** Die Grafik zeigt zunächst die Bildung eines Hashwerts aus der Nachricht und anschließend die Signaturerzeugung mit dem privaten Schlüssel des Absenders. Auf Empfängerseite werden die empfangene Nachricht erneut gehasht und die Signatur mit dem öffentlichen Schlüssel geprüft. Stimmen beide Prüfergebnisse überein, gelten Nachricht und Signatur als zusammengehörig und unverändert.

**Klausurvorbereitung:** Signieren und Verschlüsseln nicht verwechseln: privat signieren, öffentlich prüfen; öffentlich verschlüsseln, privat entschlüsseln.
-->

---
<!-- _class: biglist -->
# Signaturen – welche Ziele werden erfüllt?

- **Integrität**: jede Änderung ändert den Hash → Signatur passt nicht mehr
- **Authentizität**: nur der Inhaber des privaten Schlüssels konnte signieren
- **Nicht-Abstreitbarkeit**: der Absender kann die Signatur nicht leugnen

> Verschlüsselung schützt Vertraulichkeit – **Signaturen** schützen Integrität, Authentizität & Zurechenbarkeit.

<!-- _notes:
Verschlüsselung und Signatur sind komplementär: die eine verbirgt den Inhalt, die andere garantiert Herkunft und Unversehrtheit. In der Praxis werden oft beide kombiniert (z.B. bei E-Mail-Verschlüsselung, signierten Software-Updates, elektronischen Verträgen). Offene Frage im Raum: Woher weiß ich eigentlich, dass ein öffentlicher Schlüssel wirklich zu der Person gehört, die er zu sein behauptet? Das führt zum letzten praktischen Baustein: PKI.

Eine Signatur macht den Inhalt nicht geheim; jeder kann eine signierte, aber unverschlüsselte Nachricht lesen. Umgekehrt beweist Verschlüsselung allein nicht, wer die Nachricht erstellt hat. Nicht-Abstreitbarkeit setzt außerdem voraus, dass der private Schlüssel ausschließlich unter Kontrolle des behaupteten Unterzeichners stand und die Zuordnung seiner Identität belastbar ist.

**Klausurvorbereitung:** Für jedes der vier Schutzziele entscheiden können, ob Verschlüsselung, Signatur oder eine Kombination erforderlich ist.
-->

---
# Das Vertrauensproblem: PKI

- Woher weiß ich, dass ein **öffentlicher Schlüssel** wirklich der richtigen Person gehört?
- Gefahr: Ein Angreifer schiebt **seinen** Schlüssel unter (Man-in-the-Middle)

- **Public Key Infrastructure (PKI)**:
  - **Zertifikate** binden einen Schlüssel an eine Identität
  - **Certificate Authority (CA)**: vertrauenswürdige Stelle, die Zertifikate signiert
  - Browser vertrauen einer Liste bekannter CAs

> Das **Schloss-Symbol** im Browser = ein gültiges, von einer CA signiertes Zertifikat.

<!-- _notes:
Das schließt die letzte Lücke. Diffie-Hellman und RSA lösen die Vertraulichkeit, aber nicht die Frage "mit wem rede ich eigentlich?". Ohne Identitätsprüfung könnte sich ein Angreifer dazwischenschalten (Man-in-the-Middle) und seinen eigenen öffentlichen Schlüssel liefern. Lösung: eine Vertrauenskette. Let's Encrypt, DigiCert) prüft die Identität und signiert das Zertifikat digital – mit genau der Signatur-Technik von eben. Der Browser bringt ab Werk eine Liste vertrauenswürdiger CAs mit.

Ein Zertifikat enthält unter anderem den öffentlichen Schlüssel, Angaben zum Inhaber, einen Gültigkeitszeitraum und die Signatur der ausstellenden CA. Der Browser prüft die Signaturkette bis zu einer lokal vertrauten Root-CA, den Namen der aufgerufenen Domain und die zeitliche Gültigkeit. Das Schloss-Symbol bedeutet daher primär, dass die Verbindung verschlüsselt ist und das präsentierte Zertifikat erfolgreich geprüft wurde; es garantiert nicht, dass die Website inhaltlich seriös ist.

**Klausurvorbereitung:** Eine Zertifikatskette von Serverzertifikat über Zwischen-CA bis Root-CA erklären und die Grenzen des Browser-Schlosses benennen können.
-->

---
<!-- _class: chapter -->
# Ausblick

## Post-Quantum-Kryptographie


<!-- _notes:
Post-Quantum-Kryptographie reagiert auf eine Veränderung der Angreifermodelle: Ein hinreichend leistungsfähiger Quantencomputer würde bestimmte heute schwierige mathematische Probleme effizient lösen. Das betrifft vor allem asymmetrische Verfahren, nicht jedoch alle kryptographischen Bausteine gleichermaßen. Migration bedeutet daher einen gezielten Austausch gefährdeter Schlüsselvereinbarungs- und Signaturverfahren.

**Klausurvorbereitung:** Betroffene und weniger betroffene Verfahrensklassen unterscheiden und begründen können, warum die Umstellung bereits vor einem praktisch relevanten Quantencomputer beginnt.
-->
---
# Die Quanten-Bedrohung

- **Quantencomputer** nutzen andere Rechenprinzipien als klassische Rechner
- Der **Shor-Algorithmus** könnte Faktorisierung & diskreten Logarithmus effizient lösen
- **Betroffen**: RSA und Diffie-Hellman wären damit gebrochen
- **Weniger betroffen**: AES (längere Schlüssel genügen) und Hashfunktionen

> **„Harvest now, decrypt later"**: Verschlüsselte Daten werden heute schon gesammelt, um sie später zu entschlüsseln.

<!-- _notes:
Realistisch einordnen: Es gibt heute noch keinen Quantencomputer, der RSA brechen kann – das ist Jahre bis Jahrzehnte entfernt und technisch extrem schwer. Aber die Bedrohung ist ernst genug, um jetzt zu handeln. Der Grund ist "Harvest now, decrypt later": Angreifer (v.a. Staaten) speichern heute abgefangene verschlüsselte Daten, um sie zu entschlüsseln, sobald Quantencomputer verfügbar sind. Für langfristig sensible Daten (Staatsgeheimnisse, Gesundheitsdaten) ist das relevant. Die asymmetrischen Verfahren sind bedroht, die symmetrischen (AES) und Hashes nur abgeschwächt – man verdoppelt einfach die Schlüssellänge.

Shors Algorithmus bedroht Faktorisierung und diskrete Logarithmen und damit unter anderem RSA, klassisches Diffie-Hellman und elliptische Kurvenverfahren. Grovers Algorithmus beschleunigt die Schlüsselsuche nur quadratisch; vereinfacht sinkt die effektive Sicherheit eines idealen $n$-Bit-Schlüssels auf etwa $n/2$ Bit. Deshalb gilt AES-256 als robuste Wahl für langfristigen Schutz, während asymmetrische Verfahren grundsätzlich ersetzt werden müssen.

**Klausurvorbereitung:** Shor und Grover nicht verwechseln: Shor bricht zentrale asymmetrische Annahmen grundlegend, Grover reduziert bei symmetrischen Schlüsseln näherungsweise die effektive Bit-Sicherheit.
-->

---
# Post-Quantum-Kryptographie (PQC)

- Neue Verfahren, die auch **Quantencomputern** standhalten
- Basieren auf anderen mathematischen Problemen (z. B. **Gitter / Lattices**)
- **NIST** hat 2024 erste Standards veröffentlicht (u. a. **ML-KEM / Kyber**)
- Laufen auf **klassischen** Computern – kein Quantencomputer nötig
- Migration hat begonnen (Browser, Messenger, VPNs)

> Kryptographie ist nie „fertig" – sie entwickelt sich mit den Angriffen weiter.

> **Einordnung:** ML-KEM ist ein standardisiertes Verfahren zum Vereinbaren eines gemeinsamen Geheimnisses; „Kyber“ bezeichnet die zugrunde liegende Verfahrensfamilie.

<!-- _notes:
Beruhigend abschließen: Die Lösung existiert bereits und läuft auf normalen Computern. PQC ersetzt nicht AES oder Hashes, sondern die bedrohten asymmetrischen Teile (Schlüsselaustausch, Signaturen). NIST hat nach mehrjährigem offenen Wettbewerb – wieder Kerckhoffs! – 2024 die ersten Standards finalisiert. Große Anbieter (Google, Apple, Signal) rollen PQC bereits aus, oft in Kombination mit klassischen Verfahren (hybrid), um auf Nummer sicher zu gehen. Kernbotschaft der ganzen Vorlesung: Kryptographie ist ein ewiger Wettlauf zwischen Machern und Brechern – genau wie am Anfang gesagt.

ML-KEM ist ein Key Encapsulation Mechanism: Es erzeugt beziehungsweise kapselt ein gemeinsames Geheimnis, mit dem anschließend symmetrisch verschlüsselt werden kann. Für digitale Signaturen existieren eigene PQC-Standards; Schlüsselaustausch und Signatur bleiben also getrennte Aufgaben. Hybride Übergangsverfahren kombinieren klassische und post-quanten-sichere Komponenten, damit die Verbindung sicher bleibt, solange mindestens eine Komponente standhält.

**Klausurvorbereitung:** PQC nicht mit Quantenkryptographie verwechseln: PQC läuft auf klassischen Rechnern und basiert auf Problemen, für die keine effizienten klassischen oder Quantenangriffe bekannt sind.
-->

---
<!-- _class: chapter -->
# Zusammenfassung 
| Baustein | Typ | Schützt vor allem |
|---|---|---|
| **AES** | Symmetrisch | Vertraulichkeit (schnell, Massendaten) |
| **Diffie-Hellman** | Asymmetrisch | Sicherer Schlüsselaustausch |
| **RSA** | Asymmetrisch | Schlüsseltransport & Signaturen |
| **Hashfunktion** | Einweg | Integrität (Fingerabdruck) |
| **Digitale Signatur** | Asymmetrisch | Authentizität, Integrität, Zurechenbarkeit |
| **PKI / Zertifikate** | Infrastruktur | Vertrauen in öffentliche Schlüssel |

<!-- _notes:
Die Bausteine erfüllen unterschiedliche Aufgaben: AES verschlüsselt große Datenmengen schnell, Diffie-Hellman vereinbart Schlüssel, Hashfunktionen bilden Prüfsummen, Signaturen belegen Integrität und Herkunft, Zertifikate binden öffentliche Schlüssel an Identitäten. Ein Praxisverfahren kombiniert häufig mehrere dieser Bausteine.

RSA kann je nach Protokoll für Schlüsseltransport oder Signaturen eingesetzt werden, ist aber nicht gleichbedeutend mit asymmetrischer Kryptographie insgesamt. Eine Hashfunktion allein authentifiziert keinen Absender, weil jeder einen neuen Hash berechnen könnte; erst eine Signatur oder ein MAC bindet die Prüfinformation an ein Geheimnis beziehungsweise einen privaten Schlüssel. PKI ist kein einzelner Algorithmus, sondern eine organisatorische und technische Infrastruktur zur Verwaltung von Vertrauen.

**Klausurvorbereitung:** Die Tabelle aus dem Gedächtnis rekonstruieren und für jeden Baustein Typ, Hauptaufgabe und mindestens eine Grenze nennen können.
-->

---
<!-- _class: biglist -->
# Die zeitlosen Lehren

- **Kerckhoffs' Prinzip**: Sicherheit steckt im Schlüssel, nicht im Geheimnis des Verfahrens
- **Offenheit schafft Vertrauen**: Nur öffentlich geprüfte Verfahren sind vertrauenswürdig
- **Der Mensch ist oft die Schwachstelle** – nicht die Mathematik
- **Richtige Anwendung zählt**: Der beste Algorithmus versagt im falschen Modus
- **Kryptographie ist ein Wettlauf** – sie entwickelt sich immer weiter

<!-- _notes:
Die Meta-Ebene zum Abschluss. Diese fünf Lehren ziehen sich durch die ganze Geschichte: von der Enigma (Mensch als Schwachstelle, Kerckhoffs) über den ECB-Pinguin (Anwendung zählt) bis Post-Quantum (ewiger Wettlauf). Das sind die Erkenntnisse, die auch in 20 Jahren noch gelten, wenn die konkreten Algorithmen längst ausgetauscht sind. Guter Punkt, um zu den Diskussionsfragen überzuleiten.

Sicherheit muss als Eigenschaft des Gesamtsystems bewertet werden: Algorithmus, Modus, Zufallszahlenerzeugung, Implementierung, Schlüsselverwaltung und menschliche Prozesse wirken zusammen. Offene Standards und unabhängige Analyse reduzieren unbekannte Schwächen, garantieren aber keine fehlerfreie Nutzung. Kryptographische Agilität bezeichnet die Fähigkeit, veraltete Verfahren kontrolliert durch neue zu ersetzen.

**Klausurvorbereitung:** Zu jeder zeitlosen Lehre ein Beispiel aus der Vorlesung nennen und auf ein neues Szenario übertragen können.
-->

---
<!-- _class: biglist -->
# Diskussion

- Sollten Behörden **Hintertüren** in Verschlüsselung fordern dürfen?
- Wie geht ihr im Alltag mit **Ende-zu-Ende-Verschlüsselung** um?
- Wo begegnet euch Kryptographie in eurem **Unternehmen**?

<!-- _notes:
Eine Hintertür in Verschlüsselung würde auch eine zusätzliche Angriffsfläche schaffen. Bei Ende-zu-Ende-Verschlüsselung können nur die vorgesehenen Kommunikationspartner Inhalte entschlüsseln; die Frage nach Hintertüren ist deshalb eine Abwägung zwischen Zugriffsinteressen und Schutz vertraulicher Kommunikation. Ein gutes Argument nennt beide Seiten und eine mögliche Folge.

Ende-zu-Ende-Verschlüsselung schützt Inhalte auch gegenüber dem Betreiber des Kommunikationsdienstes, sofern Schlüssel und Endgeräte nicht kompromittiert sind. Eine technische Hintertür müsste bestimmten Dritten Zugriff ermöglichen und schafft damit zugleich einen Mechanismus, der missbraucht oder entwendet werden kann. Unternehmensbeispiele können Festplattenverschlüsselung, TLS, VPN, Code-Signaturen, Zertifikate oder verschlüsselte Backups umfassen.

**Klausurvorbereitung:** Bei einer offenen Bewertungsfrage erst Schutzziele und Akteure benennen, dann Nutzen, Risiken und technische Folgen einer Position nachvollziehbar abwägen.
-->
