# Kryptographie

## Von Caesar bis Post-Quantum

### 💡 Das große Ganze (Warum Kryptographie das Fundament ist)
Ohne Kryptographie gäbe es kein Online-Banking, kein E-Commerce, keine sichere E-Mail und keine Privatsphäre im digitalen Raum. Das Internet wurde ursprünglich für den vertrauensvollen Austausch zwischen Universitäten entwickelt – völlig unverschlüsselt. Kryptographie verwandelt unsichere, öffentliche Datenleitungen in abhör- und manipulationssichere Schutzkanäle.
*Wichtiges Grundprinzip:* Kryptographie ist die mathematische Basis für fast alle Schutzziele der IT-Sicherheit. Aber: Ein mathematisch perfekter Algorithmus schützt nichts, wenn die Schlüssel falsch verwaltet werden oder der Mensch Fehler macht.

### 🎯 Orientierung & Roter Faden
Diese Vorlesung führt dich chronologisch von den einfachen Anfängen der Antike (Caesar) über mechanische Chiffriermaschinen (Enigma) bis hin zu modernen Algorithmen (AES, RSA, ECC) und dem Quantenzeitalter (PQC). An jedem historischen Schritt lernen wir genau die Schwachstellen kennen, die schließlich zur nächsten Entwicklungsstufe geführt haben.

### ❓ Prüfungsfokus
In der Klausur musst du keine komplexen mathematischen Beweise führen! Entscheidend ist das **Baukasten-Verständnis**: Welches Verfahren (symmetrisch vs. asymmetrisch vs. Hash) wird für welches Schutzziel eingesetzt, wo liegen typische Grenzen und warum kombiniert man sie in der Praxis (hybride Verschlüsselung)?

---

# Agenda

- **Grundlagen & Begriffe** – Was ist Krypto, Kerckhoffs, Sym vs. Asym
- **Klassische Verfahren** – Caesar, Vigenère, Kryptoanalyse
- **Exkurs Enigma** – Geniale Maschine, fatale Schwächen
- **Symmetrisch heute** – AES & warum der Modus zählt
- **Schlüsselaustausch & Asymmetrie** – Diffie-Hellman, RSA
- **Kryptographie in der Praxis** – Hybrid, Hashes, Signaturen, PKI
- **Ausblick** – Post-Quantum-Kryptographie

### 💡 Strukturüberblick (Der Vorlesungsfahrplan)
Die Vorlesung gliedert sich in drei große Phasen:
1. **Die Evolution der Chiffren:** Von antiken Textverschiebungen über die Enigma zum heutigen symmetrischen Weltstandard (AES).
2. **Die Asymmetrie-Revolution:** Wie Diffie-Hellman und RSA in den 1970ern das jahrtausendealte Schlüsselverteilungsproblem lösten.
3. **Reale Sicherheitssysteme:** Wie Hybridverschlüsselung, Hashes, digitale Signaturen und PKI/Zertifikate gemeinsam das Internet absichern – und wie sich die Krypto gegen künftige Quantencomputer wappnet.

### 🎯 Lern-Strategie
- **Fundament (Höchste Klausurrelevanz):** Kerckhoffs' Prinzip, Symmetrisch vs. Asymmetrisch (Vor-/Nachteile), Hybride Verschlüsselung, Digitale Signaturen und Hashfunktionen.
- **Verständnis & Transfer:** Enigma-Lehren (Mensch als Schwachstelle, Cribs), Diffie-Hellman-Idee, PKI/Zertifikatsketten und Post-Quantum-Einordnung.

### ❓ Typische Klausurverknüpfung
Prüfer verlangen häufig, ein konkretes Praxisszenario (z. B. „Ein Nutzer bestellt verbindlich und vertraulich in einem Webshop“) in kryptographische Bausteine zu zerlegen: Du musst genau benennen können, wo AES, RSA/DH, Hashing, Signaturen und Zertifikate greifen.

---

# Grundlagen & Begriffe

## Worum geht es eigentlich?

### 💡 Worum geht es in diesem Kapitel? (Die Sprache der Kryptographie)
Bevor wir konkrete Algorithmen analysieren, müssen wir das Begriffsinventar schärfen. Begriffe wie Chiffre, Schlüssel, Klartext und Geheimtext klingen im Alltag ähnlich, bezeichnen aber völlig unterschiedliche Rollen. Zudem klären wir das oberste Sicherheitsgesetz: Kerckhoffs' Prinzip.

### 🎯 Modul-Lernziel
Du kannst die Kernbegriffe präzise definieren, den Unterschied zwischen Entwurf (Kryptographie) und Brechen (Kryptoanalyse) erklären und den fundamentalen Unterschied zwischen symmetrischer und asymmetrischer Verschlüsselung auf den Punkt bringen.

### ❓ Typische Schwerpunkte
Besonders beliebt in Prüfungen: Kerckhoffs' Prinzip im Vergleich zu „Security by Obscurity“ sowie der systematische Vergleich von symmetrischen und asymmetrischen Verfahren (Vor- und Nachteile in einer Tabelle).

---

# Kryptographie vs. Kryptoanalyse

- **Kryptographie**: Wissenschaft vom *Entwerfen* sicherer Verfahren
  - Ziel: Nachrichten so schützen, dass Unbefugte sie nicht lesen/verändern können

- **Kryptoanalyse**: Wissenschaft vom *Brechen* dieser Verfahren
  - Ziel: Schwächen finden, Klartext ohne Schlüssel rekonstruieren

- **Kryptologie**: Oberbegriff für beide Disziplinen

> **Merksatz:** Gute Kryptographie entsteht nur im ständigen Wettstreit mit der Kryptoanalyse.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Kryptographie und Kryptoanalyse sind zwei Seiten derselben Medaille.
*Alltagsvergleich Tresor:* Die Kryptographen bauen immer dickere Tresore mit komplexeren Schließmechanismen. Die Kryptoanalytiker versuchen mit Stethoskop, Brechstange und Schweißbrenner Schwachstellen zu finden. Erst wenn die weltbesten Einbrecher jahrelang vergeblich versucht haben, den Tresor zu öffnen, gilt er in der Fachwelt als wirklich sicher.
*Kryptologie* ist schlicht der wissenschaftliche Oberbegriff, der beide Disziplinen zusammenfasst.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die drei Begriffe sauber voneinander abgrenzen und begründen können, warum ein Verfahren erst durch das Scheitern offener Kryptoanalyse Vertrauen gewinnt.
- **Typische Klausurfalle:** Kryptoanalyse mit simplem „Schlüssel-Erraten“ gleichzusetzen. Kryptoanalyse sucht gezielt nach mathematischen, statistischen oder logischen Konstruktionsfehlern – nicht nur nach Brute Force!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Definieren Sie die Begriffe Kryptographie, Kryptoanalyse und Kryptologie und begründen Sie, warum Kryptographie auf Kryptoanalyse angewiesen ist.“
**Antwort:**
- **Kryptographie:** Wissenschaft vom Entwurf und der Konstruktion sicherer Verfahren zum Schutz von Informationen.
- **Kryptoanalyse:** Wissenschaft von der Untersuchung und dem Brechen kryptographischer Verfahren (Auffinden von Schwachstellen ohne Kenntnis des Schlüssels).
- **Kryptologie:** Wissenschaftlicher Oberbegriff, der Konstruktion und Analyse vereint.
- **Begründung:** Ein Verfahren gilt erst dann als praxistauglich und vertrauenswürdig, wenn es intensiver, offener Kryptoanalyse durch unabhängige Experten standgehalten hat (**Wettstreit-Prinzip**).

---

# Ein paar Grundbegriffe

- **Klartext (plaintext)**: die lesbare Ausgangsnachricht
- **Geheimtext (ciphertext)**: die verschlüsselte, unlesbare Form
- **Verschlüsseln / Entschlüsseln**: Umwandlung in beide Richtungen
- **Schlüssel (key)**: geheime Information, die den Vorgang steuert
- **Chiffre (cipher)**: der Algorithmus/das Verfahren selbst

$$\text{Klartext} \xrightarrow[\text{Schl\"ussel}]{\text{Verschl\"usseln}} \text{Geheimtext} \xrightarrow[\text{Schl\"ussel}]{\text{Entschl\"usseln}} \text{Klartext}$$

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Hier geht es um die Grundformel jeder Verschlüsselung.
*Alltagsvergleich Zahlenschloss:* 
- Die **Chiffre** ist die Mechanik des Drehschlosses (sie ist bekannt und bei allen Schlössern gleicher Bauart identisch).
- Der **Schlüssel** ist deine geheime Zahlenkombination (z. B. `4-8-1`), die du geheim hältst.
- Der **Klartext** ist deine offene Tasche, der **Geheimtext** die sicher verschlossene Tasche.
*Zentraler Merksatz:* Die Chiffre ist das Werkzeug, der Schlüssel ist das Geheimnis, das den Vorgang steuert!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Begriffe Klartext, Geheimtext, Chiffre und Schlüssel in einem Anwendungsbeispiel fehlerfrei zuordnen und formal korrekt verwenden ($c = E_k(m)$, $m = D_k(c)$).
- **Typische Klausurfalle:** Chiffre (das Verfahren) und Schlüssel (der geheime Wert) verwechseln. Der Algorithmus ist das Kochrezept, der Schlüssel die geheime Zutat!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Erklären Sie den Unterschied zwischen einer Chiffre und einem kryptographischen Schlüssel anhand eines Beispiels aus dem Alltag.“
**Antwort:**
- **Chiffre:** Das mathematische Verfahren bzw. der Algorithmus zur Transformation (die Bauart / der Mechanismus).
- **Schlüssel:** Der geheime Parameter, der die genaue Transformation steuert und zum Ver- bzw. Entschlüsseln zwingend erforderlich ist.
- **Alltagsbeispiel:** Ein Tresorschloss: Die Mechanik der Bolzen und Zahnräder ist die Chiffre (jedem bekannt); die geheime Zahlenkombination zum Öffnen ist der Schlüssel.

---

# Was Kryptographie leisten soll

Vier Schutzziele – direkte Verbindung zur CIA-Triade:

- **Vertraulichkeit**: Nur Befugte können mitlesen *(Confidentiality)*
- **Integrität**: Manipulation wird erkannt *(Integrity)*
- **Authentizität**: Der Absender ist wirklich, wer er vorgibt
- **Nicht-Abstreitbarkeit**: Handlungen sind nachweisbar zurechenbar

> Verschlüsselung schützt Vertraulichkeit – aber Integrität, Authentizität & Zurechenbarkeit brauchen *zusätzliche* Bausteine (Hashes, Signaturen).

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Viele Menschen glauben: „Wenn Daten verschlüsselt sind, ist alles sicher.“ Das ist ein fataler Trugschluss!
*Alltagsvergleich Brief:* Ein blickdichter Briefumschlag schützt die **Vertraulichkeit** (niemand kann von außen mitlesen). Aber ein böswilliger Postbote könnte den Brief öffnen, den Inhalt austauschen oder manipulieren (**Integritätsverlust**) oder einen gefälschten Absender draufschreiben (**Authentizitätsverlust**).
*Merksatz:* Reine Verschlüsselung schützt *nur* vor dem Mitlesen! Für Unverfälschtheit und echte Herkunft braucht man zusätzliche Werkzeuge wie Hashes und digitale Signaturen.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die 4 Schutzziele (Vertraulichkeit, Integrität, Authentizität, Nicht-Abstreitbarkeit) nennen und erklären können, warum reine Verschlüsselung nicht alle Schutzziele abdeckt.
- **Typische Klausurfalle:** Zu glauben, dass verschlüsselte Daten nicht manipuliert werden können. Ein Angreifer kann Bits im Geheimtext kippen (Bit-Flipping), wodurch der entschlüsselte Text verfälscht wird – ohne dass der Angreifer den Schlüssel kennen muss!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Ein Unternehmen verschlüsselt seine E-Mails mit AES. Schützt dies automatisch davor, dass ein Angreifer eine gefälschte Rechnung im Namen der Geschäftsführung einschleust? Begründen Sie Ihre Antwort.“
**Antwort:**
- **Nein.** Verschlüsselung schützt primär die **Vertraulichkeit** (Schutz vor unbefugtem Mitlesen).
- Sie beweist weder die echte Identität des Absenders (**Authentizität**) noch schützt sie per se vor unbemerkter Veränderung (**Integrität**).
- Um Fälschungen zu verhindern und den Absender nachweisbar zu binden, ist eine **digitale Signatur** erforderlich.

---

# Kerckhoffs' Prinzip (1883)

- **Kernaussage**: Die Sicherheit eines Verfahrens darf **nur vom Schlüssel** abhängen – nicht von der Geheimhaltung des Algorithmus.

- Der Algorithmus darf öffentlich bekannt sein, ohne dass die Sicherheit leidet.

- **Gegenteil**: „Security by Obscurity" – Sicherheit durch Verschleierung

> **Shannon's Maxime:** „Der Feind kennt das System."

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Das Prinzip von Auguste Kerckhoffs ist das oberste Gesetz moderner IT-Sicherheit: Ein Haustürschloss ist sicher, weil der Schlüsselbart komplex ist – nicht weil die Einbrecher nicht wissen, wie ein Schloss von innen funktioniert.
*Warum Geheimhaltung des Algorithmus scheitert:* Geheim gehaltene Algorithmen fliegen früher oder später immer auf (durch Reverse Engineering, Quellcode-Leaks oder Spionage). Wenn die Sicherheit von der Geheimhaltung des Verfahrens abhing, ist das Gesamtsystem sofort tot. Bei Kerckhoffs tauscht man bei einem Vorfall einfach den Schlüssel aus – das System bleibt sicher!
*Security by Obscurity:* Das Gegenteil – der naive Glaube, man sei sicher, nur weil niemand weiß, wie man Daten versteckt hat.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Kerckhoffs' Prinzip präzise wiedergeben („Sicherheit hängt nur vom Schlüssel ab“) und den Unterschied zu „Security by Obscurity“ erklären.
- **Typische Klausurfalle:** Zu behaupten, nach Kerckhoffs dürfe alles öffentlich sein. Falsch: Nur das **Verfahren / der Algorithmus** ist öffentlich – der **Schlüssel** muss absolut geheim bleiben!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Ein Software-Entwickler schlägt vor, einen eigenen, geheimen Verschlüsselungsalgorithmus zu entwickeln, da ein geheimer Code schwerer anzugreifen sei. Bewerten Sie diesen Vorschlag anhand von Kerckhoffs' Prinzip.“
**Antwort:**
- Der Vorschlag basiert auf dem fehlerhaften Ansatz **„Security by Obscurity“** und widerspricht direkt **Kerckhoffs' Prinzip**.
- **Kritik:** Sicherheit darf niemals auf der Geheimhaltung des Algorithmus beruhen, da proprietärer Code dekompiliert, geleakt oder durch Insider verraten werden kann. Wird der Algorithmus bekannt, ist das gesamte System kompromittiert.
- **Best Practice:** Einsatz offener, weltweit geprüfter Standards (wie AES). Bei einem Sicherheitsvorfall muss lediglich der **Schlüssel gewechselt** werden, nicht das Verfahren.

---

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

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Die fundamentale Weichenstellung der Kryptographie:
- **Symmetrisch (Geldkassette):** Es gibt genau einen Schlüssel, der zu- und aufsperrt. Alice sperrt zu, Bob sperrt auf. *Problem:* Wie bekommt Bob den Schlüssel, ohne dass ihn unterwegs jemand abfängt?
- **Asymmetrisch (Briefkasten / Vorhängeschloss):** Es gibt ein Schlüsselpaar. Bob verteilt offene Vorhängeschlösser (*Public Key*). Jeder darf ein Schloss zuschnappen lassen (verschlüsseln). Aber nur Bob hat den einzigen passenden Schlüssel (*Private Key*), um das Schloss wieder zu öffnen!
*Der Haken:* Asymmetrische Krypto erfordert gigantische mathematische Berechnungen und ist bis zu 1.000-mal langsamer als symmetrische Verschlüsselung.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die beiden Verfahrensklassen anhand von 4 Dimensionen vergleichen: Schlüsselanzahl, Rechengeschwindigkeit, Schlüsselverteilung und typische Algorithmen.
- **Typische Klausurfalle:** Annehmen, asymmetrische Krypto habe symmetrische Krypto komplett ersetzt. Falsch: Wegen des enormen Geschwindigkeitsvorteils von symmetrischer Krypto nutzt man in der Praxis **hybride Verfahren** (beide kombiniert)!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Vergleichen Sie symmetrische und asymmetrische Verschlüsselung anhand von Schlüsselanzahl, Geschwindigkeit, dem Schlüsselverteilungsproblem und je einem Standardbeispiel.“
**Antwort:**
- **Schlüsselanzahl:** Symmetrisch: **1 gemeinsamer geheimer Schlüssel**; Asymmetrisch: **Schlüsselpaar** (öffentlicher Public Key + privater Private Key).
- **Geschwindigkeit:** Symmetrisch: **Sehr schnell** (Hardware-beschleunigt); Asymmetrisch: **Deutlich langsamer** (hohe CPU-Last).
- **Schlüsselverteilung:** Symmetrisch: **Kritisches Problem** (sicherer Vorabaustausch nötig); Asymmetrisch: **Gelöst** (Public Key darf über unsichere Leitungen verteilt werden).
- **Beispiele:** Symmetrisch: **AES**; Asymmetrisch: **RSA / ECC**.

---

# Symmetrisch vs. Asymmetrisch – Bild

![Symmetrisch vs. Asymmetrisch](img/sym-vs-asym.svg)

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Dieses Schaubild verdeutlicht den Daten- und Schlüsselfluss:
- **Links (Symmetrisch):** Beide Seiten nutzen denselben roten Schlüssel. Das Kernproblem ist der unsichere Kanal dazwischen: Wie gelangt der rote Schlüssel überhaupt ungesehen zu Bob?
- **Rechts (Asymmetrisch):** Bob erzeugt zwei Schlüssel: grün (öffentlich) und rot (privat). Alice nutzt Bobs grünen Schlüssel zum Verschlüsseln. Nur Bobs roter Schlüssel kann entschlüsseln. Niemand muss vorab ein Geheimnis austauschen!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Rollenverteilung im asymmetrischen Modell fehlerfrei beschreiben können.
- **Typische Klausurfalle:** Den *Public Key des Absenders* zum Verschlüsseln verwenden. Fatale Verwechslung: Alice muss zwingend den **Public Key des Empfängers (Bob)** nutzen, denn nur der Empfänger besitzt den passenden Private Key zum Lesen!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Alice möchte Bob eine geheime Nachricht per asymmetrischer Verschlüsselung zukommen lassen. Welchen Schlüssel verwendet Alice zum Verschlüsseln und welchen Schlüssel verwendet Bob zum Entschlüsseln?“
**Antwort:**
- Alice verschlüsselt die Nachricht mit dem **öffentlichen Schlüssel von Bob (Public Key Empfänger)**.
- Bob entschlüsselt die Nachricht mit seinem **privaten Schlüssel (Private Key Empfänger)**.
- *(Alices eigene Schlüssel spielen beim reinen Verschlüsseln keine Rolle!)*

---

# Klassische Verfahren

## Wie alles begann

### 💡 Worum geht es in diesem Kapitel? (Historische Chiffren)
Wir reisen zu den Wurzeln der Kryptographie: Caesar, monoalphabetische Ersetzung und Vigenère. Warum behandeln wir das in einer modernen IT-Vorlesung? Weil an diesen historischen Beispielen die fundamentalen Prinzipien der Kryptoanalyse erfunden wurden: vollständiges Durchprobieren (**Brute Force**), **Häufigkeitsanalyse** und **Mustererkennung**.

### 🎯 Modul-Lernziel
Du verstehst, warum ein mathematisch gigantischer Schlüsselraum wertlos ist, wenn die statistische Struktur der Sprache erhalten bleibt, und wie der Übergang von mono- zu polyalphabetischer Verschlüsselung funktionierte.

### ❓ Typische Schwerpunkte
Größe des Schlüsselraums bei Caesar (25 sinnvolle Schlüssel), Häufigkeitsanalyse bei monoalphabetischer Ersetzung (E-Laut im Deutschen) und Kasiski-Test bei Vigenère.

---

# Die Caesar-Chiffre

- Jeder Buchstabe wird um eine **feste Zahl** verschoben
- Julius Caesar nutzte eine Verschiebung um **3**

$$\text{A} \rightarrow \text{D}, \quad \text{B} \rightarrow \text{E}, \quad \text{C} \rightarrow \text{F} \ldots$$

- **Beispiel** (Verschiebung 3):
  - Klartext: `HALLO`
  - Geheimtext: `KDOOR`

- **Schlüssel**: die Verschiebung (nur 25 sinnvolle Möglichkeiten!)

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Die Caesar-Chiffre ist das einfachste symmetrische Verfahren der Geschichte: Man verschiebt alle Buchstaben des Alphabets um eine feste Schrittzahl im Kreis weiter (z. B. Verschiebung 3: A $\rightarrow$ D, B $\rightarrow$ E).
*Warum ist das heute völlig wertlos?* Bei 26 Buchstaben des Alphabets gibt es genau 25 sinnvolle Verschiebungen (Schritt 0 oder 26 ändert nichts). Ein Angreifer muss lediglich 25 Zeilen aufschreiben – nach zwei Minuten ist der Klartext gefunden! Das ist die Urform des **Brute-Force-Angriffs**.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Ein kurzes Wort (z. B. 4–5 Buchstaben) per Hand mit vorgegebener Verschiebung ver- und entschlüsseln können und die Schwäche des winzigen Schlüsselraums begründen.
- **Typische Klausurfalle:** 26 statt 25 Schlüssel angeben (eine Verschiebung um 0 verschlüsselt nicht) oder den zyklischen Übertrag am Ende des Alphabets (z. B. Z $\rightarrow$ C) vergessen.

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Gegeben ist der Geheimtext 'KDOOR', der mit der Caesar-Chiffre (Verschiebung um 3) erzeugt wurde. Entschlüsseln Sie das Wort und begründen Sie, warum Caesar nach heutigen IT-Standards völlig unsicher ist.“
**Antwort:**
- **Entschlüsselung:** Jeden Buchstaben um 3 Stellen im Alphabet zurückschieben: K $\rightarrow$ H, D $\rightarrow$ A, O $\rightarrow$ L, O $\rightarrow$ L, R $\rightarrow$ O $\rightarrow$ Klartext: **HALLO**.
- **Begründung:** Der Schlüsselraum umfasst lediglich **25 sinnvolle Schlüssel**. Ein Angreifer kann alle Möglichkeiten innerhalb von Sekundenbruchteilen durch vollständiges Ausprobieren (**Brute-Force-Angriff**) brechen.

---

# Monoalphabetische Substitution

- Statt fester Verschiebung: **jeder Buchstabe** wird durch einen beliebigen anderen ersetzt
- Schlüsselraum: $26! \approx 4 \times 10^{26}$ Möglichkeiten – riesig!

- **Trotzdem leicht zu brechen.** Warum?
  - Die Struktur der Sprache bleibt erhalten
  - Häufige Buchstaben bleiben häufig – nur unter anderem Namen

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Um Caesars Brute-Force-Schwäche zu beheben, dachte man sich: Weisen wir doch jedem Buchstaben einen zufälligen Tauschpartner zu (z. B. A $\rightarrow$ Q, B $\rightarrow$ Z)!
*Das scheinbare Wunder:* Die Anzahl möglicher Tausch-Alphabete beträgt $26! \approx 4 \times 10^{26}$. Das sind mehr Schlüssel als Sekunden seit dem Urknall! Brute Force ist absolut chancenlos.
*Das fatale Problem:* Das Verfahren ist **monoalphabetisch** (ein festes Tausch-Alphabet). Jedes `E` im Klartext wird *immer* zum selben Geheimtextzeichen. Die natürliche Struktur der Sprache bleibt 1:1 erhalten!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die zentrale Krypto-Lektion formulieren: *Ein riesiger Schlüsselraum ist eine notwendige, aber keine hinreichende Bedingung für Sicherheit!*
- **Typische Klausurfalle:** Annehmen, dass $10^{26}$ Kombinationen Sicherheit garantieren. Findet die Kryptoanalyse eine strukturelle Abkürzung, bricht das Verfahren trotz Riesen-Schlüsselraum zusammen!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Warum kann ein Verschlüsselungsverfahren trotz eines astronomisch großen Schlüsselraums von $4 \cdot 10^{26}$ Möglichkeiten leicht gebrochen werden? Erläutern Sie dies am Beispiel der monoalphabetischen Substitution.“
**Antwort:**
- Ein großer Schlüsselraum schützt lediglich vor vollständigem Durchprobieren (**Brute Force**).
- Bei der monoalphabetischen Substitution bleibt jedoch die **statistische Struktur der natürlichen Sprache** vollständig erhalten.
- Ein Angreifer muss nicht den Schlüsselraum durchsuchen, sondern nutzt eine **Abkürzung (Häufigkeitsanalyse)**, um die Buchstabenpaarungen schrittweise zu rekonstruieren.

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

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Die Häufigkeitsanalyse nutzt aus, dass menschliche Sprachen feste statistische Fingerabdrücke haben. Im Deutschen ist der Buchstabe **E** mit ca. 17 % der unangefochtene Spitzenreiter – fast jeder sechste Buchstabe ist ein E!
*Alltagsvergleich:* Stell dir eine Gruppe Verkleideter vor. Selbst wenn alle Masken tragen: Die Person, die 17-mal so oft zu sehen ist wie alle anderen, ist mit Sicherheit das E. Findet man dann noch typische Paare wie „EN“ oder Dreierketten wie „SCH“, zerfällt die Verschlüsselung wie ein Kreuzworträtsel.
Erfunden wurde diese Methode bereits im 9. Jahrhundert vom arabischen Gelehrten al-Kindī.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Den Ablauf der Häufigkeitsanalyse beschreiben und erklären, warum längere Texte deutlich leichter zu brechen sind als kurze Sätze.
- **Typische Klausurfalle:** Zu glauben, dass der häufigste Buchstabe immer zwingend das E ist. Bei sehr kurzen Texten (z. B. kurzen Funksprüchen) kann die Statistik schwanken – erst bei ausreichender Textlänge nähert sich die Verteilung der Sprachstatistik an!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Erläutern Sie das Funktionsprinzip der Häufigkeitsanalyse und nennen Sie zwei Bedingungen, die ihren Erfolg begünstigen.“
**Antwort:**
- **Funktionsprinzip:** Man zählt die relative Häufigkeit aller Zeichen im Geheimtext und vergleicht sie mit der bekannten Buchstabenverteilung der Zielsprache (z. B. Deutsch: E $\approx$ 17 %, gefolgt von N, I, S).
- **Bedingung 1 (Textlänge):** Ein möglichst langer Geheimtext, da sich die relative Häufigkeit erst mit wachsender Textlänge der Normalverteilung angleicht.
- **Bedingung 2 (Sprachkenntnis):** Kenntnis der verwendeten Klartextsprache und des Fachgebiets (z. B. militärische Abkürzungen).

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

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Blaise de Vigenère fand die Antwort auf die Häufigkeitsanalyse: Wenn ein einziges Tausch-Alphabet verräterisch ist, nutzen wir eben mehrere im Wechsel (**polyalphabetische Chiffre**)!
*Wie funktioniert es?* Man wählt ein Schlüsselwort (z. B. `KEY`) und schreibt es wiederholt über den Klartext. Der 1. Buchstabe wird mit `K` verschoben, der 2. mit `E`, der 3. mit `Y`, der 4. wieder mit `K`...
*Der geniale Effekt:* Im Wort `HALLO` wird das erste `L` mit `Y` verschoben (ergibt `J`), das zweite `L` mit `K` (ergibt `V`). Derselbe Buchstabe wird an verschiedenen Stellen zu völlig anderen Geheimtextzeichen! Die einfache Häufigkeitsanalyse läuft komplett ins Leere.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Den Unterschied zwischen monoalphabetischer und polyalphabetischer Substitution erklären und an einem Tabellenbeispiel nachvollziehen.
- **Typische Klausurfalle:** Annehmen, Vigenère sei tatsächlich unknackbar (galt 300 Jahre lang so!). Das Verfahren hat eine versteckte Sollbruchstelle: die zyklische Wiederholung des Schlüsselworts!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Warum versagt eine einfache Häufigkeitsanalyse bei der Vigenère-Chiffre? Erläutern Sie das Prinzip anhand des Begriffs 'polyalphabetisch'.“
**Antwort:**
- Vigenère ist eine **polyalphabetische Chiffre**: Die Verschiebung wechselt zeichenweise anhand eines zyklisch wiederholten Schlüsselworts.
- Dadurch wird derselbe Klartextbuchstabe an verschiedenen Textstellen auf **unterschiedliche Geheimtextbuchstaben** abgebildet.
- Die statistischen Spitzen der Buchstabenhäufigkeit werden im Geheimtext **„eingeebnet“ / verschmiert**, sodass ein direkter Abgleich mit der Sprachstatistik scheitert.

---

# Auch Vigenère fällt

- **Schwäche**: Das Schlüsselwort **wiederholt sich** periodisch
- Findet man die **Schlüssellänge**, zerfällt Vigenère in mehrere *Caesar*-Chiffren
- Jede davon ist per Häufigkeitsanalyse angreifbar

- **Kasiski-Test (1863)**: Wiederkehrende Muster im Geheimtext verraten die Schlüssellänge

> **Lehre:** „Unknackbar" bedeutet meist nur „noch nicht geknackt".

> **Mini-Beispiel:** Wiederholen sich auffällige Zeichenfolgen im Abstand von 6 und 12 Zeichen, ist eine Schlüssellänge von 3 oder 6 ein möglicher Kandidat.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Warum fiel auch Vigenère? Wegen der periodischen Wiederholung des Schlüsselworts!
*Kasiski-Test (1863):* Wenn zufällig dieselbe Buchstabengruppe im Klartext (z. B. „UND“) auf denselben Teil des Schlüsselworts trifft, entsteht im Geheimtext exakt dieselbe Buchstabenkombination. Misst man den Abstand zwischen diesen Wiederholungen (z. B. 12, 18, 24 Zeichen), liefert der gemeinsame Teiler (hier: 6) mit hoher Wahrscheinlichkeit die **Schlüssellänge**!
Sobald man weiß: „Das Schlüsselwort ist 6 Buchstaben lang“, zerlegt man den Geheimtext in 6 Stapel. Jeder Stapel für sich ist eine stinknormale Caesar-Chiffre – und wird mit Häufigkeitsanalyse geknackt!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die 3 Schritte des Kasiski-Tests skizzieren: Wiederholungen finden $\rightarrow$ Schlüssellänge bestimmen $\rightarrow$ in Caesar-Teilchiffren zerlegen.
- **Typische Klausurfalle:** Zu glauben, der Kasiski-Test liefere direkt das Schlüsselwort. Falsch: Er liefert nur die **Länge** des Schlüssels! Das Wort selbst wird anschließend per Häufigkeitsanalyse ermittelt.

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Skizzieren Sie das Vorgehen des Kasiski-Tests zur Kryptoanalyse der Vigenère-Chiffre in drei Schritten.“
**Antwort:**
- 1. **Mustererkennung:** Auffinden identischer Zeichenfolgen, die sich im Geheimtext wiederholen.
- 2. **Abstandsanalyse:** Ermittlung der Abstände zwischen den Wiederholungen und Bestimmung des größten gemeinsamen Teilers $\rightarrow$ Kandidat für die **Schlüssellänge $n$**.
- 3. **Zerlegung:** Aufteilung des Texts in $n$ Teiltexte (jeder $n$-te Buchstabe). Jeder Teiltext entspricht einer simplen Caesar-Chiffre und wird per **Häufigkeitsanalyse** gebrochen.

---

# Exkurs: Die Enigma

## Geniale Maschine, fatale Schwächen

### 💡 Worum geht es in diesem Kapitel? (Der Enigma-Exkurs)
Die Enigma ist das faszinierendste historische Beispiel für das Scheitern eines scheinbar perfekten Kryptosystems. Sie war eine ingenieurtechnische Meisterleistung mit rund $10^{23}$ Kombinationen. Dennoch wurde sie geknackt – nicht durch rohe Rechengewalt, sondern durch Konstruktionsfehler und menschliche Routine im militärischen Alltag.

### 🎯 Modul-Lernziel
Du begreifst Kryptographie als **soziotechnisches Gesamtsystem**: Sicherheit scheitert fast nie an der reinen Rechenleistung des Angreifers, sondern am Zusammenspiel aus fehlerhafter Konstruktion, schwachem Schlüsselmanagement und vorhersehbarem Benutzerverhalten.

### ❓ Typische Schwerpunkte
Der Konstruktionsfehler des Reflektors („Kein Buchstabe wird auf sich selbst abgebildet“), die Bedeutung von Cribs (Known-Plaintext-Angriff) und die Rolle von Bletchley Park / Alan Turing.

---

# Enigma – Kontext & Bedeutung

- Deutsche Rotor-Chiffriermaschine, im **2. Weltkrieg** militärisch eingesetzt
- Elektromechanische Umsetzung einer **polyalphabetischen** Chiffre
- Galt als praktisch unknackbar – Schlüsselraum von rund $10^{23}$
- Ihr Bruch durch die Alliierten hatte **kriegsentscheidende** Bedeutung

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Die Enigma übertrug die Idee der polyalphabetischen Verschlüsselung in ein mechanisches Wunderwerk: Bei jedem Tastendruck drehten sich Zahnräder (Rotoren) weiter. Dadurch änderte sich der interne Stromfluss und somit das Verschlüsselungsalphabet nach jedem einzelnen Buchstaben.
Mit 3 bis 4 Walzen und einem Steckerbrett besaß sie rund $10^{23}$ mögliche Einstellungen – mehr als Sandkörner auf der Erde! Das deutsche Militär hielt die Maschine für absolut unknackbar. Ihr Bruch durch polnische und britische Codebreaker verkürzte den Zweiten Weltkrieg um schätzungsweise zwei Jahre.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Enigma als elektromechanische polyalphabetische Rotor-Chiffre einordnen und erklären, warum der riesige Schlüsselraum ($10^{23}$) allein keinen Sicherheitsbeweis darstellt.
- **Typische Klausurfalle:** Die Enigma als digitalen Computer bezeichnen. Sie war ein rein elektromechanisches Gerät (Tastatur, Walzen, Glühlämpchen, Batterie).

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Auf welchem Prinzip basierte die Enigma-Chiffriermaschine und warum garantierte ihr Schlüsselraum von ca. $10^{23}$ Möglichkeiten keine dauerhafte Sicherheit?“
**Antwort:**
- **Prinzip:** Elektromechanische **polyalphabetische Substitution**; rotierende Walzen und ein Steckerbrett veränderten den Stromkreis nach jedem Tastenanschlag.
- **Warum nicht sicher:** Kryptoanalytiker mussten den Schlüsselraum nicht vollständig durchprobieren (**kein Brute Force nötig**), da Konstruktionsmängel und menschliche Bedienfehler logische Abkürzungen boten.

---

# Enigma – Tagesschlüssel

- Sicherheit hing an der **Grundeinstellung** (dem „Tagesschlüssel"):
  - Auswahl & Reihenfolge der Walzen
  - Startposition jeder Walze
  - Steckerbrett-Verbindungen

- Verteilt über **gedruckte Codebücher** an alle Funkstellen
- Schlüsselwechsel täglich um Mitternacht

> Kerckhoffs in Reinform: Die Maschine war den Alliierten bekannt – geheim war nur der Tagesschlüssel.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Die Enigma ist gelebtes Kerckhoffs-Prinzip: Die Maschine selbst war den Alliierten bekannt (erbeutete Exemplare). Die Sicherheit ruhte ausschließlich auf dem **Tagesschlüssel**: Welche Walzen kommen in welcher Reihenfolge hinein? Welche Stecker werden gesteckt? Wie stehen die Ringe?
*Das fatale Verteilungsproblem:* Diese Tagesschlüssel mussten auf Papier in dicken **Codebüchern** monatlich an alle U-Boote und Funkstellen verteilt werden. Wurde ein einziges Codebuch von einem sinkenden U-Boot erbeutet, war der Funkverkehr eines ganzen Monats für die Alliierten im Klartext lesbar!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Bestandteile des Tagesschlüssels benennen, Kerckhoffs' Prinzip darauf anwenden und die Gefahren physischer Schlüsselverteilung aufzeigen.
- **Typische Klausurfalle:** Tagesschlüssel mit der Maschine verwechseln. Die Maschine ist der Algorithmus (Chiffre), die Codebucheinstellung ist der geheime Schlüssel!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Inwiefern illustriert der Einsatz der Enigma Kerckhoffs' Prinzip, und welches fundamentale Sicherheitsproblem entstand durch die Nutzung von Tagesschlüsseln?“
**Antwort:**
- **Kerckhoffs' Prinzip:** Der Aufbau der Maschine war den Alliierten bekannt; die Geheimhaltung lag ausschließlich in der täglichen Einstellung (**Tagesschlüssel**).
- **Sicherheitsproblem:** Die Tagesschlüssel mussten physisch über gedruckte **Codebücher** an hunderte Funkstellen verteilt werden. Ein erbeutetes Codebuch kompromittierte das gesamte Kommunikationsnetzwerk für den entsprechenden Zeitraum.

---

# Enigma – Die Schwächen

- **Konstruktionsfehler Reflektor**: Kein Buchstabe konnte auf **sich selbst** abgebildet werden
  - Ein A wurde nie zu einem A → wertvoller Ansatzpunkt für Angreifer

- **Bedienfehler**:
  - Vorhersehbare Nachrichten („Wetterbericht", „Keine besonderen Vorkommnisse")
  - Wiederholte Standardfloskeln als **Cribs** (vermutete Klartextstücke)
  - Schwache, wiederholte Spruchschlüssel der Funker

- **Menschliche Routine** unterlief die geniale Technik

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Zwei verhängnisvolle Faktoren brachten die Enigma zu Fall:
1. **Der Konstruktionsfehler (Reflektor):** Durch die elektrische Rückführung konnte **ein Buchstabe niemals auf sich selbst verschlüsselt werden** (ein A wurde nie zu einem A!).
2. **Die menschliche Routine (Cribs):** Deutsche Funker sendeten jeden Morgen pünktlich Standardmeldungen mit identischem Wortlaut (z. B. `WETTERBERICHT`).
*Der geniale Hebel:* Die Codebreaker legten das Wort `WETTERBERICHT` an jede Position des Geheimtexts. Sobald an einer Stelle derselbe Buchstabe auftauchte (z. B. Geheimtext hat an Stelle 3 ein `T`), wusste man: *Diese Position ist unmöglich!* So wurden Millionen Stellungen in Sekunden verworfen.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die beiden Schwachstellen (Konstruktion vs. Bedienung) trennen und den Begriff **Crib** als vermuteten Klartextteil (**Known-Plaintext-Angriff**) erklären.
- **Typische Klausurfalle:** Annehmen, die Alliierten hätten bloß geraten. Es war systematische Ausnutzung von Konstruktionsfehlern und Bedienroutinen!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Erläutern Sie, warum die Reflektor-Eigenschaft der Enigma ('kein Buchstabe wird auf sich selbst abgebildet') in Kombination mit vorhersehbaren Funksprüchen (Cribs) einen fatalen Angriffspunkt bot.“
**Antwort:**
- **Ausschlusskriterium:** Wenn kein Buchstabe auf sich selbst abgebildet werden kann, lässt sich jede Ausrichtung eines vermuteten Klartexts (**Crib**, z. B. 'WETTERBERICHT') sofort verwerfen, bei der ein Klartextbuchstabe mit dem Geheimtextbuchstaben übereinstimmt.
- **Suchraum-Reduktion:** Dadurch konnten Kryptoanalytiker falsche Walzenstellungen massenhaft und automatisiert ausschließen, ohne sie aufwendig durchrechnen zu müssen.

---

# Enigma – Bletchley Park & Turing

- Britisches Entschlüsselungszentrum **Bletchley Park**
- **Alan Turing** entwickelte die elektromechanische **„Bombe"**
  - Testete systematisch Rotorstellungen und schloss Widersprüche aus
  - Nutzte Cribs, um den Suchraum drastisch zu verkleinern
- Vorarbeiten polnischer Mathematiker (u. a. **Marian Rejewski**)
- Ergebnis: **„Ultra"** – ein entscheidender alliierter Nachrichtenvorteil

### 💡 Auf den Punkt gebracht (Einfach erklärt)
In Bletchley Park bündelten die Briten tausende Denker. Alan Turing entwickelte elektromechanische Großrechner – die berühmten **„Bomben“**.
*Wichtige Klarstellung:* Turings Bombe war **keine** Brute-Force-Maschine! Alle $10^{23}$ Kombinationen durchzuprobieren hätte Jahrhunderte gedauert. Stattdessen verdrahtete die Bombe die logischen Bedingungen eines Cribs. Trat ein elektrischer Widerspruch auf, schloss sie blitzschnell ganze Walzenkonfigurationen aus, bis nur wenige Kandidaten übrig blieben.
*Historische Gerechtigkeit:* Die theoretischen Grundlagen und die erste Rekonstruktion der Enigma stammten von genialen polnischen Mathematikern um **Marian Rejewski**, die ihr Wissen 1939 weitergaben!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Funktionsweise von Turings „Bombe“ als **logisches Ausschlussverfahren** beschreiben und die Rolle polnischer Vorarbeiten kennen.
- **Typische Klausurfalle:** Turing als alleinigen Erfinder darzustellen, der einen modernen Computer gebaut habe. Es war eine elektromechanische Maschine, die auf polnischen mathematischen Vorarbeiten aufbaute!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „War Alan Turings 'Bombe' in Bletchley Park eine reine Brute-Force-Maschine? Erläutern Sie ihre tatsächliche Funktionsweise kurz.“
**Antwort:**
- **Nein.** Ein vollständiges Durchprobieren von $10^{23}$ Möglichkeiten wäre selbst elektromechanisch viel zu langsam gewesen.
- Die Bombe nutzte **logische Ausschlussverfahren**: Auf Basis vermuteter Klartexte (Cribs) suchte sie nach elektrischen Widersprüchen und verwarf fehlerhafte Rotorstellungen blockweise in Sekundenbruchteilen.

---

# Enigma – Was wir lernen

- **Kerckhoffs bestätigt**: Sicherheit lag im Schlüssel, nicht in der geheimen Maschine
- **Komplexität ≠ Sicherheit**: $10^{23}$ Kombinationen halfen nicht gegen kluge Angriffe
- **Der Mensch ist das Risiko**: Bedienfehler brachen die Chiffre, nicht die Mathematik
- **Bekannter Klartext ist gefährlich**: Cribs sind ein realer Angriffsvektor – bis heute

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Vier zeitlose Lehren, die 1:1 für moderne IT-Systeme gelten:
1. **Kerckhoffs bestätigt:** Sobald der Feind die Maschine kennt, hängt alles am sicheren Schlüssel.
2. **Komplexität schützt nicht:** Große Schlüsselräume nützen nichts, wenn mathematische Abkürzungen existieren.
3. **Der Mensch ist die Schwachstelle:** Bequemlichkeit, schlechte Passwörter und Standardroutinen brechen die beste Kryptographie.
4. **Known Plaintext ist real:** Angreifer kennen oft Teile der Nachricht (z. B. HTML-Tags, Dateiköpfe von PDFs). Moderne Algorithmen müssen mathematisch beweisen, dass sie selbst bei bekanntem Klartext sicher sind!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die 4 Lehren der Enigma auf moderne IT-Szenarien übertragen können (z. B. Known-Plaintext-Angriffe auf Protokolle).
- **Typische Klausurfalle:** Historische Fehler als „von gestern“ abzutun. Vorhersehbare Dateiformate (z. B. PDF- oder PNG-Header) sind exakt die modernen Cribs heutiger Hacker!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Nennen Sie zwei zeitlose Lehren aus dem Bruch der Enigma und übertragen Sie eine davon auf ein modernes IT-Sicherheitsszenario.“
**Antwort:**
- **Lehre 1:** **Komplexität garantiert keine Sicherheit** (ein großer Schlüsselraum schützt nicht vor strukturellen Konstruktionsmängeln).
- **Lehre 2:** **Menschliche Routine untergräbt Sicherheit** (Bedienfehler und vorhersehbare Abläufe brechen starke Chiffren).
- **Transfer:** In modernen Netzwerken sind Dateiköpfe (z. B. standardisierte HTTP-Header oder Bilddateien) für Angreifer bekannt (**Known Plaintext / moderner Crib**). Verschlüsselungsverfahren müssen daher mathematisch beweisbar resistent gegen Known-Plaintext-Angriffe sein.

---

# Symmetrische Verschlüsselung heute

## Der Standard: AES

### 💡 Worum geht es in diesem Kapitel? (Moderner Standard AES)
Wir verlassen die Geschichte und kommen im Hier und Jetzt an. Nach den Lehren der Vergangenheit und der Schwächung des alten DES-Standards suchte die Welt einen unzerstörbaren, offenen Standard für symmetrische Verschlüsselung. Das Ergebnis heißt AES (Advanced Encryption Standard).

### 🎯 Modul-Lernziel
Du verstehst AES als weltweiten De-facto-Standard für symmetrische Blockchiffren, kennst die standardisierten Schlüssellängen (128, 192, 256 Bit) und begreifst das grundlegende Dilemma aller symmetrischen Systeme: das Schlüsselverteilungsproblem.

### ❓ Typische Schwerpunkte
Unterscheidung von Blockgröße (immer 128 Bit) vs. Schlüssellänge (128, 192, 256 Bit), offener Standardisierungsprozess des NIST und die Berechnungsformel des Schlüsselverteilungsproblems ($n(n-1)/2$).

---

# AES – Advanced Encryption Standard

- **2001** vom US-Institut NIST standardisiert (Vorgänger: DES)
- Gewinner eines **offenen, öffentlichen** Wettbewerbs (Algorithmus „Rijndael")
- **Blockchiffre**: verschlüsselt Daten in Blöcken zu 128 Bit
- Schlüssellängen: **128, 192 oder 256 Bit**
- Weltweiter Standard: TLS, VPN, WLAN (WPA2/3), Festplatten, Messenger

> **Vor dem Modus:** Längere Nachrichten bestehen aus mehreren 128-Bit-Blöcken. Ein Betriebsmodus legt fest, wie diese Blöcke zusammen verarbeitet werden.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
AES ist das unangefochtene Arbeitspferd der weltweiten Datenverschlüsselung: TLS/HTTPS, WLAN (WPA2/3), Festplattenverschlüsselung (BitLocker), WhatsApp – überall rechnet AES.
*Was bedeutet Blockchiffre?* AES verschlüsselt Daten nicht kontinuierlich Bit für Bit, sondern zerlegt Nachrichten in feste Datenblöcke von genau **128 Bit** (16 Byte). Jeder Block wird in mehreren mathematischen Runden (Substitutions- und Permutationsschritte) gründlich durchgemischt.
*Schlüssellängen:* 128 Bit reicht für praktisch alle kommerziellen Zwecke; 256 Bit wird für höchste Geheimhaltungsstufen und Post-Quantum-Schutz genutzt.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Kernfakten von AES kennen: Symmetrische Blockchiffre, feste Blockgröße (128 Bit) und drei standardisierte Schlüssellängen (128, 192, 256 Bit).
- **Typische Klausurfalle:** Blockgröße und Schlüssellänge verwechseln! Die Blockgröße ist bei AES **immer 128 Bit** – egal wie lang der Schlüssel ist!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Nennen Sie den Chiffrentyp von AES (Block- oder Stromchiffre), die feste Blockgröße sowie die drei standardisierten Schlüssellängen.“
**Antwort:**
- **Chiffrentyp:** Symmetrische **Blockchiffre**.
- **Blockgröße:** Immer **128 Bit** (16 Bytes).
- **Schlüssellängen:** **128 Bit, 192 Bit oder 256 Bit**.

---

# AES – warum so vertrauenswürdig?

- **Offen & geprüft**: Über 20 Jahre weltweite Kryptoanalyse ohne praktischen Bruch
- **Schnell**: Moderne CPUs haben AES **in Hardware** eingebaut (AES-NI)
- **Skalierbar**: 128 Bit für fast alles, 256 Bit für höchste Ansprüche
- **Brute Force chancenlos**: $2^{128}$ Schlüssel – astronomisch groß

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Warum vertraut die ganze Welt ihre intimsten Daten AES an?
1. **Offenheit (Kerckhoffs):** Der Algorithmus (Rijndael) gewann einen weltweiten, offenen Wettbewerb des US-NIST. Seit über 20 Jahren attackieren die besten Kryptoanalytiker weltweit AES – ohne praktischen Erfolg!
2. **Hardware-Turbo:** Moderne CPUs (Intel, AMD, Apple) haben spezielle Befehlssätze (**AES-NI**). Dadurch verschlüsselt dein Rechner Gigabytes pro Sekunde, ohne spürbare CPU-Last.
3. **Astronomischer Schlüsselraum:** $2^{128}$ Schlüssel sind so gigantisch, dass selbst alle Supercomputer der Welt seit Entstehung des Universums nur einen winzigen Bruchteil hätten testen können!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die drei Säulen des Vertrauens in AES erläutern (offener Standard, fehlender mathematischer Bruch, Hardwarebeschleunigung via AES-NI).
- **Typische Klausurfalle:** Einen 128-Bit-AES-Schlüssel mit einem 128-Zeichen-Passwort gleichzusetzen. Ein kryptographischer Schlüssel ist eine rein zufällige Folge von 128 Bits mit maximaler Entropie!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Warum gilt ein Brute-Force-Angriff auf einen 128-Bit-AES-Schlüssel nach heutigem Stand der Wissenschaft als unmöglich?“
**Antwort:**
- Ein 128-Bit-Schlüsselraum umfasst $2^{128} \approx 3{,}4 \cdot 10^{38}$ mögliche Schlüssel.
- Selbst wenn Milliarden Hochleistungsrechner parallel Milliarden Schlüssel pro Sekunde prüfen würden, würde das vollständige Durchprobieren **Milliarden von Jahren** (länger als das Alter des Universums) dauern.

---

# Das Schlüsselverteilungsproblem

- AES ist schnell und sicher – aber **beide Seiten brauchen denselben Schlüssel**
- Wie kommt der Schlüssel sicher zum Empfänger?
  - Persönlich übergeben? Unpraktisch bei Millionen Nutzern
  - Über das Internet schicken? Dann kann ihn jeder abfangen

- Bei $n$ Teilnehmern: $\frac{n(n-1)}{2}$ Schlüssel nötig
  - 1.000 Nutzer → ~500.000 Schlüssel

> **Das zentrale Dilemma der symmetrischen Kryptographie.**

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Hier ist das zentrale Dilemma der symmetrischen Kryptographie:
AES ist unknackbar und rasend schnell – aber wie bekommen zwei Personen überhaupt denselben geheimen Schlüssel?
*Das Henne-Ei-Problem:* Wenn Alice und Bob über das Internet kommunizieren, können sie den Schlüssel nicht einfach unverschlüsselt schicken – ein Angreifer würde ihn abfangen! Um den Schlüssel sicher zu übertragen, bräuchten sie bereits einen sicheren Kanal.
*Die Schlüsselextrapolation:* Bei $n$ Teilnehmern braucht jedes Paar einen eigenen Schlüssel:
$$\frac{n(n-1)}{2}$$
Bei nur 1.000 Nutzern sind das bereits knapp **500.000 Schlüssel**! Wer soll die sicher verwalten?

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die zwei Facetten des Problems benennen (Austausch über unsicheren Kanal + quadratische Explosion der Schlüsselanzahl) und die Formel $n(n-1)/2$ anwenden können.
- **Typische Klausurfalle:** Die Division durch 2 in der Formel vergessen. Ohne geteilt durch 2 zählt man jedes Schlüsselpaar doppelt!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „In einem Unternehmen mit 200 Mitarbeitern soll jeder mit jedem symmetrisch verschlüsselt kommunizieren. Wie viele Schlüssel werden benötigt und welches fundamentale Sicherheitsproblem entsteht?“
**Antwort:**
- **Berechnung:** $\frac{n(n-1)}{2} = \frac{200 \cdot 199}{2} = 19.900$ Schlüssel.
- **Fundamentales Problem (Schlüsselverteilungsproblem):**
  1. **Skalierungsproblem:** Die Anzahl der Schlüssel wächst quadratisch mit der Teilnehmerzahl ($O(n^2)$).
  2. **Austauschproblem:** Wie werden diese 19.900 geheimen Schlüssel sicher an die Teilnehmer verteilt, ohne dass sie auf dem Übertragungsweg abgefangen werden?

---

# Schlüsselaustausch & Asymmetrie

## Der Durchbruch der 1970er

### 💡 Worum geht es in diesem Kapitel? (Die Krypto-Revolution)
Bis Mitte der 1970er Jahre galt es als physikalisches Gesetz: Wer sicher kommunizieren will, muss sich vorher heimlich getroffen haben, um einen Schlüssel auszutauschen. Dann kamen Whitfield Diffie, Martin Hellman, Ralph Merkle sowie Rivest, Shamir und Adleman (RSA). Sie stellten die Krypto-Welt auf den Kopf!

### 🎯 Modul-Lernziel
Du verstehst, wie man über einen völlig unsicheren, abgehörten Kanal ein gemeinsames Geheimnis erzeugt (Diffie-Hellman), wie das Prinzip der asymmetrischen Schlüsselpaare funktioniert und warum RSA auf Primfaktorzerlegung beruht.

### ❓ Typische Schwerpunkte
Ablauf von Diffie-Hellman (Farbanalogie), Funktionsweise von Public & Private Key, mathematische Grundlage von RSA und die Verwundbarkeit von reinem DH gegen Man-in-the-Middle-Angriffe.

---

# Diffie-Hellman – die Idee

- **Problem gelöst 1976**: Zwei Parteien vereinbaren über einen **öffentlichen** Kanal einen **gemeinsamen geheimen** Schlüssel
- Ein Lauscher, der alles mithört, kann das Geheimnis **trotzdem nicht** berechnen
- Grundlage: eine mathematische **Einwegfunktion** (leicht vorwärts, praktisch unmöglich rückwärts)

> Kein Schlüssel wird je übertragen – er wird auf beiden Seiten **berechnet**.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Stell dir vor: Alice und Bob stehen auf einem belebten Marktplatz und rufen sich laut Zahlen zu. Tausende Menschen hören jedes Wort mit. Am Ende teilen Alice und Bob ein gemeinsames Geheimnis, das niemand auf dem Marktplatz kennt!
*Wie ist das möglich?* Diffie-Hellman überträgt **niemals den fertigen Schlüssel** über die Leitung! Stattdessen tauschen beide Seiten Zwischenergebnisse einer mathematischen **Einwegfunktion** aus (leicht vorwärts zu berechnen, praktisch unmöglich rückwärts). Beide kombinieren das fremde Zwischenergebnis mit ihrem eigenen privaten Geheimnis – und kommen auf dieselbe Endzahl!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Erklären, was Diffie-Hellman tut (Schlüsselvereinbarung, KEIN Datentransport) und warum ein Lauscher das Geheimnis nicht berechnen kann.
- **Typische Klausurfalle:** Glauben, mit Diffie-Hellman könne man Textnachrichten verschlüsseln. Falsch: Diffie-Hellman ist ein reines **Schlüsselvereinbarungsverfahren**! Verschlüsselt wird danach symmetrisch mit AES.

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Wird beim Diffie-Hellman-Verfahren ein geheimer Schlüssel über das Netzwerk übertragen? Erläutern Sie das Kernprinzip in einem Satz.“
**Antwort:**
- **Nein.** Es wird zu keinem Zeitpunkt ein geheimer Schlüssel übertragen.
- **Kernprinzip:** Beide Parteien tauschen lediglich öffentlich berechnete Zwischenwerte aus und berechnen daraus auf Basis ihrer jeweiligen privaten Geheimnisse unabhängig voneinander dasselbe gemeinsame Geheimnis (**Schlüsselvereinbarung**).

---

# Diffie-Hellman – die Farb-Analogie

![Diffie-Hellman – die Farb-Analogie](img/diffie-hellman.svg)

- Öffentliche Farbe + je eine **geheime** Farbe → gemischt ausgetauscht
- Beide mischen ihre geheime Farbe dazu → **identische** Endmischung
- Lauscher sieht nur die Mischungen – **Farben trennen ist unmöglich**

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Die Farbanalogie macht die mathematische Einwegfunktion (diskreter Logarithmus) sofort begreifbar:
1. **Öffentliche Ausgangsfarbe:** Alice und Bob einigen sich laut auf Gelb. Jeder Lauscher sieht Gelb.
2. **Geheime Einzelfarbe:** Alice wählt geheim Rot, Bob wählt geheim Blau.
3. **Mischung:** Alice mischt Gelb + Rot = Orange. Bob mischt Gelb + Blau = Hellblau.
4. **Öffentlicher Tausch:** Alice sendet Orange an Bob, Bob sendet Hellblau an Alice. Der Lauscher sieht Orange und Hellblau – aber er kann gemischte Farben nicht entmischen (Einwegfunktion!).
5. **Gemeinsames Geheimnis:** Alice kippt ihr geheimes Rot in Bobs Hellblau $\rightarrow$ Braun. Bob kippt sein geheimes Blau in Alices Orange $\rightarrow$ dieselbe Endfarbe Braun!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Schritte der Farbanalogie auf die technischen Begriffe abbilden (öffentliche Parameter, private Werte, öffentliche Zwischenwerte, Sitzungsgeheimnis).
- **Typische Klausurfalle:** Annehmen, dass DH gegen Man-in-the-Middle schützt. Ein Angreifer in der Leitung könnte mit Alice und Bob separate Farben mischen! DH schützt vor passivem Abhören, liefert aber **keine Authentifizierung**.

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Übertragen Sie die vier Elemente der Diffie-Hellman-Farbanalogie (Ausgangsfarbe, geheime Farbe, Farbmischung, Endfarbe) auf die technischen kryptographischen Begriffe.“
**Antwort:**
- **Gemeinsame Ausgangsfarbe:** Öffentliche Grundparameter (Primzahl $p$ und Basis/Generator $g$).
- **Geheime Einzelfarbe:** Privater geheimer Zufallswert der jeweiligen Partei ($a$ bzw. $b$).
- **Übertragene Farbmischung:** Öffentlicher Zwischenwert ($A = g^a \bmod p$ bzw. $B = g^b \bmod p$).
- **Identische Endfarbe:** Das gemeinsam berechnete symmetrische Sitzungsgeheimnis ($K = g^{ab} \bmod p$).

---

# Asymmetrische Kryptographie – das Prinzip

- **Schlüsselpaar** pro Person: öffentlicher + privater Schlüssel
- Mathematisch verbunden, aber der private lässt sich **nicht** aus dem öffentlichen berechnen

- **Öffentlicher Schlüssel**: darf jeder kennen (verschlüsselt Nachrichten an mich)
- **Privater Schlüssel**: bleibt geheim (nur ich kann entschlüsseln)

> **Briefkasten-Analogie**: Einwurf kann jeder (öffentlich), leeren nur der Besitzer (privat).

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Das asymmetrische Prinzip entkoppelt das Verschlüsseln vom Entschlüsseln.
*Die Briefkasten-Analogie:* Der Einwurfschlitz deines Hausbriefkastens ist der **Public Key**. Jeder Nachbar, Postbote oder Fremde darf Briefe einwerfen (verschlüsseln). Sobald der Brief im Kasten liegt, kommt niemand mehr heran. Nur du besitzt den Schlüssel zum Kasten (**Private Key**) und kannst ihn leeren (entschlüsseln).
*Der Durchbruch:* Du kannst deinen Public Key weltweit verteilen – auf Webseiten, Visitenkarten, Plakaten. Die Vertraulichkeit ist niemals bedroht, solange dein Private Key geheim bleibt!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Rollen von Public Key und Private Key beim Verschlüsseln fehlerfrei erklären: Wer verschlüsselt womit? Wer entschlüsselt womit?
- **Typische Klausurfalle:** Public Key und Private Key vertauschen. Zum *Verschlüsseln* nutzt der Sender immer den *öffentlichen Schlüssel des Empfängers*. Zum *Entschlüsseln* nutzt der Empfänger seinen *privaten Schlüssel*.

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Warum muss der öffentliche Schlüssel (Public Key) bei asymmetrischer Verschlüsselung nicht geheim gehalten werden, und welches Schutzziel wird dennoch gewährleistet?“
**Antwort:**
- Der öffentliche Schlüssel dient ausschließlich zum **Verschlüsseln** von Nachrichten.
- Die mathematische Einwegfunktion stellt sicher, dass aus dem öffentlichen Schlüssel **kein Rückschluss auf den privaten Schlüssel** gezogen werden kann.
- Das Schutzziel **Vertraulichkeit** bleibt gewahrt, da ausschließlich der Inhaber des zugehörigen geheimen privaten Schlüssels die Nachricht entschlüsseln kann.

---

# RSA – die Grundidee

- Benannt nach **Rivest, Shamir, Adleman** (1977)
- Sicherheit beruht auf: **Zwei große Primzahlen multiplizieren ist leicht – das Produkt wieder zerlegen ist praktisch unmöglich**

- Vereinfacht:
  - Verschlüsseln mit öffentlichem Schlüssel: $c = m^e \bmod n$
  - Entschlüsseln mit privatem Schlüssel: $m = c^d \bmod n$

- Das große $n$ (Produkt zweier Primzahlen) ist öffentlich – seine **Faktoren** sind das Geheimnis

### 💡 Auf den Punkt gebracht (Einfach erklärt)
RSA (benannt nach Rivest, Shamir und Adleman, 1977) war das erste vollwertige asymmetrische Verfahren. Seine Sicherheit beruht auf einem einfachen mathematischen Ungleichgewicht:
- **Multiplizieren ist kinderleicht:** Nimm zwei Primzahlen wie 17 und 23 $\rightarrow$ $17 \times 23 = 391$. Das rechnet jeder Taschenrechner in Mikrosekunden.
- **Primfaktorzerlegung ist bockschwer:** Wenn ich dir nur die Zahl 391 gebe und sage: „Finde die beiden Primfaktoren!“, musst du mühsam probieren.
Nimmt man zwei Primzahlen mit jeweils hunderten von Dezimalstellen, dauert das Zerlegen auf normalen Computern Millionen Jahre! Das Produkt $n$ ist öffentlich, die Primfaktoren $p$ und $q$ sind das Geheimnis.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Das mathematische Fundament von RSA benennen (**Schwierigkeit der Primfaktorzerlegung / Faktorisierung großer Zahlen**) und die Parameter grob einordnen ($n$ öffentlich, Faktoren geheim).
- **Typische Klausurfalle:** Zu glauben, man müsse die RSA-Formel in der Klausur mit Zahlen herleiten. Nein: Nur das Prinzip (Produkt leicht, Faktoren schwer) und der Einsatzzweck zählen!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Auf welchem mathematischen Problem beruht die Sicherheit des RSA-Verfahrens? Erläutern Sie das Prinzip in zwei Sätzen.“
**Antwort:**
- Die Sicherheit von RSA beruht auf der **Schwierigkeit der Faktorisierung (Primfaktorzerlegung)** sehr großer Zahlen.
- Während die Multiplikation zweier großer Primzahlen $p$ und $q$ zum Modul $n$ rechnerisch trivial ist, ist die Rekonstruktion von $p$ und $q$ aus $n$ ohne Zusatzwissen mit klassischen Rechnern in praktischer Zeit unlösbar.

---

# RSA – wofür man es nutzt

- **Verschlüsselung** kleiner Datenmengen (z. B. eines AES-Schlüssels)
- **Digitale Signaturen** (dazu gleich mehr)
- **Langsam** im Vergleich zu AES → nicht für große Datenmengen geeignet

> **Konsequenz**: In der Praxis kombiniert man beide Welten → **hybride Verschlüsselung**.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Warum verschlüsseln wir nicht einfach das gesamte Internet mit RSA und vergessen AES?
Weil RSA eine Rechen-Schnecke ist! Das Rechnen mit riesigen 2048- oder 4096-Bit-Zahlen verbraucht enorm viel Prozessorleistung. Ein 100-MB-Video mit RSA zu verschlüsseln würde Server überlasten und Akkus leersaugen.
Deshalb nutzt man RSA in der Praxis nur für zwei gezielte Aufgaben:
1. Um winzige Datenmengen zu verschlüsseln (konkret: einen zufälligen symmetrischen AES-Schlüssel!).
2. Um Dokumente digital zu unterschreiben (digitale Signaturen).

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Begründen können, warum RSA niemals für Massendaten eingesetzt wird, und die Brücke zur hybriden Verschlüsselung schlagen.
- **Typische Klausurfalle:** Annehmen, dass Webseiten oder Datenbanken direkt mit RSA verschlüsselt werden. Nutzdaten werden fast ausnahmslos symmetrisch (AES) verschlüsselt!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Warum wird RSA in der Praxis nicht zur direkten Verschlüsselung großer Nutzdaten (z. B. Backups oder Videostreams) eingesetzt? Wie löst die Praxis dieses Problem?“
**Antwort:**
- **Problem:** RSA erfordert extrem rechenaufwändige modulare Arithmetik mit riesigen Zahlen und ist um ein Vielfaches **langsamer als symmetrische Chiffren** (hohe Latenz, hohe CPU-Last).
- **Lösung:** Einsatz von **hybrider Verschlüsselung**: Die großen Nutzdaten werden schnell und effizient symmetrisch (z. B. AES) verschlüsselt; RSA verschlüsselt lediglich diesen kleinen symmetrischen Sitzungsschlüssel.

---

# Kryptographie in der Praxis

## So funktioniert es wirklich

### 💡 Worum geht es in diesem Kapitel? (Das Zusammenspiel in der Praxis)
Jetzt fügen sich alle Puzzleteile zusammen! In der realen Welt existiert kein isolierter Algorithmus. Sichere Protokolle wie HTTPS (TLS), Signal oder Online-Banking kombinieren symmetrische Verschlüsselung, asymmetrischen Schlüsselaustausch, Hashes, digitale Signaturen und PKI-Zertifikate zu einem lückenlosen Schutzschild.

### 🎯 Modul-Lernziel
Du beherrschst das Zusammenspiel der Bausteine: Wie hybride Verschlüsselung Effizienz und Schlüsselaustausch vereint, wie Hashfunktionen Manipulationen entlarven, wie digitale Signaturen Echtheit garantieren und wie PKI das Vertrauen in öffentliche Schlüssel sichert.

### ❓ Typische Schwerpunkte
Ablauf hybrider Verschlüsselung (Schritt 1 bis 4), Eigenschaften von Hashfunktionen (Einweg, Lawineneffekt, Kollision), Signatur-Prüfkette und Funktion von Zertifizierungsstellen (CAs).

---

# Hybride Verschlüsselung

![Hybride Verschlüsselung](img/hybrid.svg)

- **Asymmetrisch** (RSA/DH) transportiert sicher einen zufälligen **AES-Schlüssel**
- **Symmetrisch** (AES) verschlüsselt dann die eigentlichen Daten – schnell

> Das Beste aus beiden Welten: Sicherheit des Austauschs **+** Geschwindigkeit von AES.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Hybride Verschlüsselung ist der absolute Königsweg moderner IT-Sicherheit: Sie kombiniert die Geschwindigkeit von AES mit der Eleganz von asymmetrischer Krypto.
*Der 4-Schritte-Ablauf:*
1. Alice erzeugt auf ihrem Rechner einen zufälligen, einmaligen AES-Schlüssel (**Session Key**).
2. Alice verschlüsselt ihre eigentlichen Daten (z. B. ein 50 MB PDF) mit diesem AES-Schlüssel $\rightarrow$ blitzschnell!
3. Alice nimmt Bobs öffentlichen RSA-Schlüssel und verschlüsselt damit *nur den kleinen AES-Schlüssel*.
4. Alice sendet beides an Bob. Bob entschlüsselt mit seinem privaten Schlüssel den AES-Schlüssel – und öffnet damit die Daten!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die 4 Schritte der hybriden Verschlüsselung in der korrekten Reihenfolge aufschreiben und die Begründung liefern (Asymmetrie löst Verteilung, Symmetrie liefert Geschwindigkeit).
- **Typische Klausurfalle:** Verwechseln, welcher Schlüssel womit verschlüsselt wird. Die Nutzdaten werden **symmetrisch** verschlüsselt; der symmetrische Schlüssel wird **asymmetrisch** verschlüsselt!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Skizzieren Sie die vier Schritte einer hybriden Verschlüsselung beim Senden einer vertraulichen Datei von Alice an Bob und begründen Sie den Vorteil.“
**Antwort:**
- 1. Alice erzeugt einen zufälligen symmetrischen Sitzungsschlüssel (**Session Key**, z. B. AES).
- 2. Die Nutzdaten werden mit dem Session Key **symmetrisch verschlüsselt**.
- 3. Der Session Key wird mit Bobs **öffentlichem Schlüssel asymmetrisch verschlüsselt**.
- 4. Alice sendet verschlüsselte Nutzdaten und verschlüsselten Session Key an Bob. Bob entschlüsselt mit seinem **privaten Schlüssel** den Session Key und damit die Nutzdaten.
- **Vorteil:** Löst das Schlüsselverteilungsproblem (dank Asymmetrie) und bewahrt maximale Verarbeitungsgeschwindigkeit bei Massendaten (dank Symmetrie).

---

# Kryptographische Hashfunktionen

- Bilden beliebig lange Daten auf einen **festen, kurzen** Wert ab (den „Fingerabdruck")
- **Einwegfunktion**: aus dem Hash lässt sich das Original nicht rekonstruieren
- Kleinste Änderung am Input → **völlig anderer** Hash (Lawineneffekt)
- **Kollisionsresistent**: kaum zwei Eingaben mit gleichem Hash

- Standards: **SHA-256, SHA-3** (nicht mehr: MD5, SHA-1 – gebrochen)

> Anwendung: Integritätsprüfung, Passwortspeicherung, Signaturen, Blockchain.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Eine Hashfunktion ist wie ein digitaler Fleischwolf oder ein unnachahmlicher Fingerabdruck.
*Alltagsvergleich Fleischwolf:* Man kann aus einem Steak mühelos Hackfleisch machen (Einwegfunktion: vorwärts leicht). Aber man kann aus Hackfleisch unmöglich wieder das ursprüngliche Steak rekonstruieren (rückwärts unmöglich!).
*Der Lawineneffekt:* Ändert man in einem riesigen Dokument auch nur ein einziges Leerzeichen, verändert sich der Hashwert komplett!
*Häufigster Denkfehler:* **Hashing ist KEINE Verschlüsselung!** Es gibt keinen Schlüssel und keine Entschlüsselung. Ein Hash ist eine irreversible mathematische Prüfsumme.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die drei Haupteigenschaften nennen (feste Ausgabelänge, Einwegfunktion, Lawineneffekt/Kollisionsresistenz) und veraltete (MD5, SHA-1) von aktuellen Standards (SHA-256, SHA-3) unterscheiden.
- **Typische Klausurfalle:** Hashen als „Einweg-Verschlüsselung“ bezeichnen. Verschlüsselung ist per Definition umkehrbar; Hashing ist eine irreversible Einwegfunktion!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Nennen Sie die drei wesentlichen Eigenschaften einer kryptographischen Hashfunktion und grenzen Sie Hashing klar von Verschlüsselung ab.“
**Antwort:**
- 1. **Einwegfunktion (Urbildresistenz):** Aus dem Hashwert kann die ursprüngliche Eingabe praktisch nicht rekonstruiert werden.
- 2. **Feste Ausgabelänge:** Liefert unabhängig von der Eingabegröße stets einen Ausgabewert fester Bitlänge (z. B. 256 Bit bei SHA-256).
- 3. **Lawineneffekt & Kollisionsresistenz:** Minimale Eingabeänderungen erzeugen völlig andere Hashes; es ist praktisch unmöglich, zwei verschiedene Eingaben mit gleichem Hash zu finden.
- **Abgrenzung:** Verschlüsselung ist ein **umkehrbarer Vorgang mit Schlüssel** (Schutzziel Vertraulichkeit); Hashing ist eine **schlüssellose, irreversible Einwegfunktion** (Schutzziel Integrität).

---

# Digitale Signaturen

![Digitale Signaturen](img/signatur.svg)

- **Signieren**: Hash der Nachricht mit dem **privaten** Schlüssel verschlüsseln
- **Prüfen**: Empfänger vergleicht mit dem **öffentlichen** Schlüssel
- Umgekehrte Nutzung der Asymmetrie: privat signiert, öffentlich prüft

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Eine digitale Signatur ist die fälschungssichere Unterschrift unter ein Dokument.
*Die geniale Umkehrung der Asymmetrie:*
- Beim *Verschlüsseln* nutzt man den *Public Key des Empfängers*, damit nur dieser lesen kann.
- Beim *Signieren* nutzt Alice ihren **eigenen Private Key**! Warum? Weil nur Alice ihren Private Key besitzt. Wenn die Welt mit Alices **Public Key** prüfen kann, dass die Signatur passt, ist zweifelsfrei bewiesen: Diese Nachricht stammt garantiert von Alice!
*Ablauf:* Man signiert nicht die riesige Datei selbst, sondern berechnet ihren kleinen Hashwert und verschlüsselt diesen mit dem Private Key. Der Empfänger prüft die Signatur mit Alices Public Key.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Schlüsselrollen beim Signieren und Prüfen exakt benennen: *Privater Schlüssel des Absenders signiert*, *öffentlicher Schlüssel des Absenders prüft*!
- **Typische Klausurfalle:** Die Schlüssel des Empfängers für die Signatur heranziehen. Völlig falsch: Die Signatur beweist die Urheberschaft des **Absenders**, also werden ausschließlich die Schlüssel des **Absenders** verwendet!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Alice möchte ein Dokument digital signieren und an Bob senden. Welche Schlüssel von wem werden beim Erzeugen der Signatur und beim späteren Prüfen durch Bob verwendet?“
**Antwort:**
- **Erzeugen der Signatur (Alice):** Alice verwendet ihren **eigenen privaten Schlüssel (Private Key Absender)**, um den Hashwert des Dokuments zu signieren.
- **Prüfen der Signatur (Bob):** Bob verwendet den **öffentlichen Schlüssel von Alice (Public Key Absender)**, um die Signatur zu verifizieren und mit dem neu berechneten Hashwert des Dokuments abzugleichen.
- *(Bobs Schlüssel kommen beim reinen Signieren überhaupt nicht zum Einsatz!)*

---

# Signaturen – welche Ziele werden erfüllt?

- **Integrität**: jede Änderung ändert den Hash → Signatur passt nicht mehr
- **Authentizität**: nur der Inhaber des privaten Schlüssels konnte signieren
- **Nicht-Abstreitbarkeit**: der Absender kann die Signatur nicht leugnen

> Verschlüsselung schützt Vertraulichkeit – **Signaturen** schützen Integrität, Authentizität & Zurechenbarkeit.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Digitale Signaturen erfüllen drei fundamentale Schutzziele auf einen Schlag:
1. **Integrität (Unverändert):** Ändert jemand auch nur einen Cent-Betrag in einem Vertrag, passt der Hashwert nicht mehr zur Signatur $\rightarrow$ Manipulation fliegt sofort auf!
2. **Authentizität (Echtheit):** Nur wer den geheimen Private Key besitzt, konnte die Signatur erzeugen $\rightarrow$ die Nachricht stammt garantiert vom Absender.
3. **Nicht-Abstreitbarkeit (Verbindlichkeit):** Der Absender kann vor Gericht nicht behaupten: „Das war ich nicht!“, denn niemand sonst hat Zugriff auf seinen Private Key.
*Zentraler Merksatz:* Eine Signatur macht ein Dokument **nicht geheim**! Ein unterschriebener Vertrag ist für jeden lesbar, aber manipulations- und fälschungssicher.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die drei erfüllten Schutzziele benennen und begründen können, warum eine Signatur **keine Vertraulichkeit** bietet.
- **Typische Klausurfalle:** Annehmen, eine signierte E-Mail sei automatisch verschlüsselt. Nein: Jeder kann eine signierte Nachricht mitlesen, wenn sie nicht zusätzlich verschlüsselt wurde!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Welche drei Schutzziele werden durch eine digitale Signatur erfüllt, und welches Schutzziel leistet sie explizit NICHT?“
**Antwort:**
- **Erfüllte Schutzziele:**
  1. **Integrität:** Nachweis, dass die Daten auf dem Übertragungsweg nicht manipuliert wurden.
  2. **Authentizität:** Nachweis der echten Identität des Absenders/Unterzeichners.
  3. **Nicht-Abstreitbarkeit (Verbindlichkeit):** Der Absender kann die Urheberschaft rechtlich nicht leugnen.
- **Nicht erfüllt:** **Vertraulichkeit** (der Inhalt bleibt für jeden lesbar, sofern er nicht separat verschlüsselt wird).

---

# Das Vertrauensproblem: PKI

- Woher weiß ich, dass ein **öffentlicher Schlüssel** wirklich der richtigen Person gehört?
- Gefahr: Ein Angreifer schiebt **seinen** Schlüssel unter (Man-in-the-Middle)

- **Public Key Infrastructure (PKI)**:
  - **Zertifikate** binden einen Schlüssel an eine Identität
  - **Certificate Authority (CA)**: vertrauenswürdige Stelle, die Zertifikate signiert
  - Browser vertrauen einer Liste bekannter CAs

> Das **Schloss-Symbol** im Browser = ein gültiges, von einer CA signiertes Zertifikat.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Hier schließt sich die letzte Sicherheitslücke der Asymmetrie:
Woher weiß Alice, dass ein Public Key wirklich zu ihrer Bank gehört?
*Die Man-in-the-Middle-Gefahr:* Ein Angreifer in der Leitung fängt Alices Anfrage ab und schickt ihr *seinen* Public Key. Alice verschlüsselt ihr Passwort mit dem Hackerschlüssel – und der Angreifer liest alles mit!
*Die Lösung (PKI & Zertifikate):* Ein digitales Zertifikat ist ein digitaler Personalausweis. Eine vertrauenswürdige Zertifizierungsstelle (**Certificate Authority / CA**, z. B. Let's Encrypt, DigiCert) prüft die Identität der Bank und signiert deren Public Key digital. Dein Browser bringt eine Liste vertrauenswürdiger Root-CAs mit und prüft die Signaturkette. Ist alles gültig, erscheint das Schloss-Symbol!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Die Aufgabe einer PKI und der CA erklären und begründen können, warum das Browser-Schloss nur die verschlüsselte Verbindung zur verifizierten Domain bestätigt, nicht aber die kriminelle Absicht des Betreibers!
- **Typische Klausurfalle:** Glauben, eine Website mit Schloss-Symbol sei garantiert seriös. Auch Phishing-Seiten können sich kostenlose TLS-Zertifikate für gefälschte Domains holen!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Welches Problem löst eine Public Key Infrastructure (PKI) und vor welcher konkreten Angriffsart schützt sie bei HTTPS-Verbindungen?“
**Antwort:**
- **Problem:** Das Authentizitätsproblem öffentlicher Schlüssel: Man kann ohne Überprüfung nicht wissen, ob ein Public Key tatsächlich der angegebenen Person/Domain gehört.
- **Schutzwirkung:** Ein digitales Zertifikat bindet einen Public Key durch die digitale Signatur einer vertrauenswürdigen Zertifizierungsstelle (**CA**) verbindlich an eine Identität/Domain.
- Dies schützt vor **Man-in-the-Middle-Angriffen**, bei denen ein Angreifer einen gefälschten öffentlichen Schlüssel unterschiebt.

---

# Ausblick

## Post-Quantum-Kryptographie

### 💡 Worum geht es in diesem Kapitel? (Das Quantenzeitalter)
Kryptographie ist niemals abgeschlossen. Die nächste technologische Zäsur – funktionierende Quantencomputer – bedroht die mathematischen Grundfesten, auf denen das heutige Internet ruht. Wir beleuchten, warum RSA und ECC wackeln, warum AES standhält und welche neuen mathematischen Verfahren uns künftig schützen werden.

### 🎯 Modul-Lernziel
Du verstehst die unterschiedlichen Auswirkungen von Quantencomputern auf asymmetrische Verfahren (Shor bricht RSA/DH komplett) vs. symmetrische Verfahren (Grover schwächt AES nur ab) und begreifst das Bedrohungsszenario *Harvest now, decrypt later*.

### ❓ Typische Schwerpunkte
Unterschied zwischen den Auswirkungen auf asymmetrische vs. symmetrische Krypto, Definition des Angriffsmodells „Harvest now, decrypt later“ und Einordnung von PQC (Algorithmen laufen auf normalen PCs!).

---

# Die Quanten-Bedrohung

- **Quantencomputer** nutzen andere Rechenprinzipien als klassische Rechner
- Der **Shor-Algorithmus** könnte Faktorisierung & diskreten Logarithmus effizient lösen
- **Betroffen**: RSA und Diffie-Hellman wären damit gebrochen
- **Weniger betroffen**: AES (längere Schlüssel genügen) und Hashfunktionen

> **„Harvest now, decrypt later"**: Verschlüsselte Daten werden heute schon gesammelt, um sie später zu entschlüsseln.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Warum versetzen Quantencomputer Kryptographen in Alarmbereitschaft?
Ein Quantencomputer rechnet mit Qubits und kann bestimmte Rechenprobleme lösen, an denen klassische Supercomputer scheitern:
- **Shor-Algorithmus:** Löst Primfaktorzerlegung und diskrete Logarithmen in Sekundenschnelle. Das bedeutet das **sofortige Aus für RSA, Diffie-Hellman und ECC**!
- **AES & Hashes:** Werden durch den Grover-Algorithmus nur quadratisch beschleunigt. Bei AES-256 halbiert sich die effektive Sicherheit auf 128 Bit – das ist immer noch astronomisch sicher!
*Warum handeln wir heute schon?* Wegen **„Harvest now, decrypt later“**: Angreifer schneiden heute weltweit verschlüsselte Datenströme mit und speichern sie. Sobald in 10 Jahren ein Quantencomputer existiert, entschlüsseln sie alle heutigen Betriebs- und Staatsgeheimnisse rückwirkend!

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** Erklären, warum asymmetrische Krypto existentiell bedroht ist, symmetrische Krypto (AES-256) standhält und was *Harvest now, decrypt later* bedeutet.
- **Typische Klausurfalle:** Shor-Algorithmus (bricht asymmetrische Verfahren komplett) mit Grover-Algorithmus (schwächt symmetrische Verfahren nur ab) verwechseln!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Warum müssen Unternehmen ihre Verschlüsselung bereits heute auf Post-Quantum-Verfahren umstellen, obwohl es noch gar keine praxistauglichen krypto-relevanten Quantencomputer gibt?“
**Antwort:**
- Grund ist das Angriffsmodell **„Harvest now, decrypt later“**: Angreifer fangen heute verschlüsselten Datenverkehr ab und speichern ihn auf Vorrat.
- Sobald ein krypto-relevanter Quantencomputer existiert, können diese gespeicherten Daten nachträglich mit dem **Shor-Algorithmus** gebrochen werden.
- Bei Daten mit langer Vertraulichkeitsdauer (z. B. 10–30 Jahre für Patientendaten, Patente) muss die Verschlüsselung **bereits heute präventiv geschützt** werden.

---

# Post-Quantum-Kryptographie (PQC)

- Neue Verfahren, die auch **Quantencomputern** standhalten
- Basieren auf anderen mathematischen Problemen (z. B. **Gitter / Lattices**)
- **NIST** hat 2024 erste Standards veröffentlicht (u. a. **ML-KEM / Kyber**)
- Laufen auf **klassischen** Computern – kein Quantencomputer nötig
- Migration hat begonnen (Browser, Messenger, VPNs)

> Kryptographie ist nie „fertig" – sie entwickelt sich mit den Angriffen weiter.

> **Einordnung:** ML-KEM ist ein standardisiertes Verfahren zum Vereinbaren eines gemeinsamen Geheimnisses; „Kyber“ bezeichnet die zugrunde liegende Verfahrensfamilie.

### 💡 Auf den Punkt gebracht (Einfach erklärt)
Was genau ist Post-Quantum-Kryptographie (PQC)?
*Häufigster Denkfehler aufgeklärt:* PQC bedeutet **nicht**, dass man einen Quantencomputer braucht, um damit zu arbeiten! PQC sind mathematische Algorithmen, die auf ganz normalen Laptops, Smartphones und Servern laufen.
Der Trick: Statt auf Primzahlen basieren sie auf mehrdimensionalen geometrischen Gittern (**Lattices**). An diesen Gitterproblemen scheitern Quantencomputer genauso wie klassische Rechner!
Das US-NIST hat 2024 die ersten weltweiten Standards festgelegt (u. a. **ML-KEM / Kyber** für Schlüsselaustausch). Moderne Browser und Messenger rollen PQC bereits im hybriden Doppelpack (klassisches Verfahren + PQC) aus.

### 🎯 Klausurrelevanz & Lernziel
- **Was du können musst:** PQC von Quantenkryptographie abgrenzen und erklären, dass PQC auf klassischer Hardware ausgeführt wird und auf gitterbasierten Problemen basiert.
- **Typische Klausurfalle:** PQC mit Quantencomputern verwechseln (glauben, PQC brauche Quanten-Hardware). PQC läuft auf normaler Hardware!

### ❓ Mögliche Klausurfrage & Antwortskizze
**Frage:** „Was versteht man unter Post-Quantum-Kryptographie (PQC) und auf welcher Hardware wird sie ausgeführt? Grenzen Sie den Begriff kurz ab.“
**Antwort:**
- **Definition:** Kryptographische Algorithmen (z. B. gitterbasierte Verfahren wie ML-KEM), die gegen Angriffe durch Quantencomputer (insb. Shor-Algorithmus) mathematisch resistent sind.
- **Hardware:** PQC läuft auf **ganz herkömmlichen, klassischen Rechnern** (PCs, Servern, Smartphones).
- **Abgrenzung:** Nicht zu verwechseln mit *Quantenkryptographie (wie QKD)*, die spezielle physikalische Quantengeräte und Glasfaser-Hardware erfordert.

---

# Zusammenfassung 
| Baustein | Typ | Schützt vor allem |
|---|---|---|
| **AES** | Symmetrisch | Vertraulichkeit (schnell, Massendaten) |
| **Diffie-Hellman** | Asymmetrisch | Sicherer Schlüsselaustausch |
| **RSA** | Asymmetrisch | Schlüsseltransport & Signaturen |
| **Hashfunktion** | Einweg | Integrität (Fingerabdruck) |
| **Digitale Signatur** | Asymmetrisch | Authentizität, Integrität, Zurechenbarkeit |
| **PKI / Zertifikate** | Infrastruktur | Vertrauen in öffentliche Schlüssel |

### 💡 Schnell-Check (Die 6 Krypto-Werkzeuge im Werkzeugkasten)
Jeder kryptographische Baustein hat genau eine Kernaufgabe – kein Baustein kann alles allein:
1. **AES:** Der Hochgeschwindigkeitszug für große Datenmengen (schützt *Vertraulichkeit*).
2. **Diffie-Hellman:** Der gemeinsame Nenner über offene Leitungen (*Schlüsselvereinbarung*).
3. **RSA:** Der Allrounder der Asymmetrie (*Schlüsseltransport & Signatur*).
4. **Hashfunktion:** Das unbestechliche Siegel (*Integrität*).
5. **Digitale Signatur:** Die rechtssichere digitale Unterschrift (*Authentizität, Integrität, Zurechenbarkeit*).
6. **PKI:** Das Einwohnermeldeamt des Internets (*Vertrauen in öffentliche Schlüssel*).

### 🎯 Prüfungs-Checkliste (Was du parat haben musst)
- Zu jedem der 6 Bausteine: Typ (symmetrisch / asymmetrisch / Einweg / Infrastruktur) und Haupt-Schutzziel fehlerfrei benennen können.
- Erklären können, warum ein sicheres Protokoll (wie HTTPS/TLS) mindestens 4 dieser Bausteine gleichzeitig kombinieren muss.

### ❓ Blitzfragen zur Selbstkontrolle
1. *Frage:* Schützt eine Hashfunktion vor unbefugtem Mitlesen? $\rightarrow$ *Antwort:* Nein! Hashes schützen ausschließlich Integrität, niemals Vertraulichkeit.
2. *Frage:* Warum reicht Diffie-Hellman allein nicht gegen Man-in-the-Middle? $\rightarrow$ *Antwort:* Weil DH keine Authentifizierung liefert – dazu braucht man Signaturen und Zertifikate (PKI)!

---

# Die zeitlosen Lehren

- **Kerckhoffs' Prinzip**: Sicherheit steckt im Schlüssel, nicht im Geheimnis des Verfahrens
- **Offenheit schafft Vertrauen**: Nur öffentlich geprüfte Verfahren sind vertrauenswürdig
- **Der Mensch ist oft die Schwachstelle** – nicht die Mathematik
- **Richtige Anwendung zählt**: Der beste Algorithmus versagt im falschen Modus
- **Kryptographie ist ein Wettlauf** – sie entwickelt sich immer weiter

### 💡 Didaktischer Kern (Die 5 goldenen Regeln)
Diese Folie fasst die Kernbotschaften der gesamten Vorlesung zusammen. Algorithmen ändern sich im Laufe der Jahrzehnte – von Caesar über Enigma zu PQC –, aber diese fünf Prinzipien bleiben unveränderlich wahr:
- Vertraue niemals geheimen Firmen-Algorithmen (Kerckhoffs).
- Offenheit und weltweite Prüfung schaffen Sicherheit.
- Der Mensch ist und bleibt die größte Schwachstelle (Passwörter, Routinen, Phishing).
- Ein starker Algorithmus ist im falschen Betriebsmodus wirkungslos (z. B. AES im ECB-Modus).
- Kryptographie ist ein ewiger Wettlauf zwischen Konstrukteuren und Analytikern.

### 🎯 Klausurrelevanz & Transferkompetenz
- **Was du können musst:** Die fünf Lehren anhand von konkreten Beispielen aus der Vorlesung belegen können (z. B. Enigma $\rightarrow$ Mensch als Schwachstelle & Kerckhoffs; PQC $\rightarrow$ ewiger Wettlauf).
- **Typische Klausurfalle:** Abstrakte Lehren ohne greifbaren Praxisbezug aufzuzählen. Immer ein konkretes Vorlesungsbeispiel parat haben!

### ❓ Mögliche Transferaufgabe & Antwortskizze
**Frage:** „Erläutern Sie die Lehre 'Der beste Algorithmus versagt bei falscher Anwendung' anhand eines konkreten Beispiels aus der Vorlesung.“
**Antwort:**
- **Beispiel AES im ECB-Modus:** AES selbst ist mathematisch unknackbar. Wird jedoch der unsichere ECB-Modus verwendet, wird jeder identische 128-Bit-Klartextblock zum exakt selben Geheimtextblock verschlüsselt. Bei Grafiken (z. B. dem Tux-Pinguin) bleiben Konturen im Chiffretext vollständig sichtbar.
- **Erkenntnis:** Ein mathematisch perfekter Algorithmus bietet bei fehlerhaftem Betriebsmodus keinen Schutz der Vertraulichkeit.

---

# Diskussion

- Sollten Behörden **Hintertüren** in Verschlüsselung fordern dürfen?
- Wie geht ihr im Alltag mit **Ende-zu-Ende-Verschlüsselung** um?
- Wo begegnet euch Kryptographie in eurem **Unternehmen**?

### 💡 Didaktischer Kern & Diskussionsimpulse
Hier schlagen wir die Brücke zur gesellschaftlichen, unternehmerischen und ethischen Realität:
- **Staatliche Hintertüren (Crypto Wars):** Politiker fordern oft „Generalschlüssel für die Polizei“. Mathematisch gilt: Es gibt keine Hintertür, die nur von den „Guten“ genutzt werden kann. Jede Schwachstelle wird unweigerlich auch von Kriminellen und feindlichen Staaten entdeckt und missbraucht.
- **Ende-zu-Ende-Verschlüsselung (E2EE):** Bei WhatsApp oder Signal können selbst die Serverbetreiber nicht mitlesen – ein unverzichtbarer Schutz für Journalisten, Firmen und Bürger.
- **Unternehmensalltag:** Festplattenverschlüsselung (BitLocker), VPN-Tunnel, TLS 1.3, Code-Signing, Smartcards / FIDO2-Sticks.

### 🎯 Klausurrelevanz (Transfer- & Urteilskompetenz)
- **Was du können musst:** In Diskussions- und Essayaufgaben fundiert mit Schutzielen argumentieren können (z. B. Spannungsverhältnis zwischen Strafverfolgung und informationeller Selbstbestimmung).
- **Typische Klausurfalle:** Einseitig emotional argumentieren. Gute Antworten beleuchten beide Seiten sachlich mit IT-Sicherheitsbegriffen.

### ❓ Mögliche Klausuraufgabe & Diskussionsleitfaden
**Frage:** „Nehmen Sie aus IT-sicherheitstechnischer Sicht Stellung zur politischen Forderung nach behördlichen Hintertüren in Ende-zu-Ende-verschlüsselten Messenger-Diensten.“
**Antwort:**
- **Argumentation der Befürworter:** Notwendigkeit effektiver Strafverfolgung und Terrorismusabwehr.
- **Sicherheitstechnische Gegenargumente:**
  1. Eine Hintertür schwächt die mathematische Architektur grundsätzlich; es gibt **keine selektive Hintertür nur für Befugte**.
  2. Der Generalschlüssel / die Hintertür wird zum lukrativsten Ziel für Cyberkriminelle und Spionage (**Single Point of Complete Failure**).
  3. Kriminelle weichen sofort auf eigene, unregulierte Open-Source-Krypto-Tools aus, während die breite Wirtschaft und Bürger schutzlos gegenüber Abhören werden.
