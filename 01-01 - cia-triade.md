---
marp: true
theme: custom
footer: ![w:280](img/dhbw-ka.svg)

---

<!-- _class: title -->
# IT-Security

<!-- _notes:
IT-Sicherheit schützt Informationen, Systeme und Geschäftsprozesse vor unbeabsichtigten Ereignissen ebenso wie vor gezielten Angriffen. Ausgangspunkt der Vorlesungsreihe sind die Schutzziele Vertraulichkeit, Integrität und Verfügbarkeit, weil sich mit ihnen Risiken und Gegenmaßnahmen systematisch einordnen lassen. Sicherheit ist dabei kein einzelnes Produkt, sondern entsteht aus dem Zusammenspiel von Technik, Organisation und Menschen.

**Klausurvorbereitung:** Die drei Schutzziele der CIA-Triade auf Deutsch und Englisch nennen und an einem einfachen IT-System jeweils eine mögliche Verletzung erläutern können.
-->

---
<!-- _class: biglist -->
# Inhalte

- CIA-Triade und Grundbegriffe
- Kryptographie
- Identity & Access Management (IAM)
- Secure Software Development Lifecycle (SSDLC)
- Netzwerk- und IoT-Sicherheit
- ISMS - Information Security Management System
- Schwachstellen- und Patchmanagement
- KI-Sicherheit

<!-- _notes:
Die Themen der Vorlesungsreihe betrachten IT-Sicherheit aus unterschiedlichen Perspektiven. Kryptographie liefert technische Schutzmechanismen, IAM steuert Identitäten und Berechtigungen, SSDLC verankert Sicherheit in der Softwareentwicklung und ein ISMS organisiert Sicherheit auf Unternehmensebene. Netzwerk-, IoT-, Schwachstellen-, Patch- und KI-Sicherheit wenden diese Grundideen auf spezielle Technologien und Prozesse an. Datenschutz überschneidet sich mit IT-Sicherheit, verfolgt aber zusätzlich rechtliche Ziele zum Schutz personenbezogener Daten.

**Klausurvorbereitung:** Zu jedem Themenblock eine Verbindung zur CIA-Triade herstellen können, beispielsweise Verschlüsselung zur Vertraulichkeit, Code Signing zur Integrität und Redundanz zur Verfügbarkeit.
-->

---
<!-- _class: huge -->
# Sicherheitsmaßnahmen im Unternehmen

Welche Maßnahmen (Prozesse, Regeln, Tools, Schulungen,... ) werden in Ihrem Unternehmen ergriffen, um sich vor IT-Sicherheitsvorfällen zu schützen?


> **Denkanstoß:** Welche Maßnahme verhindert einen Angriff, welche erkennt ihn und welche begrenzt den Schaden?

<!-- _notes:
Wirksame IT-Sicherheit beruht auf mehreren Verteidigungsebenen, dem sogenannten Defense-in-Depth-Prinzip. Maßnahmen lassen sich organisatorischen, technischen und personellen Bereichen sowie den Funktionen Prävention, Detektion und Reaktion zuordnen. Eine Firewall kann unerwünschte Kommunikation verhindern, Monitoring erkennt Auffälligkeiten, ein Incident-Response-Prozess begrenzt Schäden und Backups ermöglichen die Wiederherstellung. Weil jede Kontrolle ausfallen oder umgangen werden kann, sollten sich Maßnahmen ergänzen und nicht von einem einzigen Schutzmechanismus abhängen.

**Klausurvorbereitung:** Für ein Unternehmensbeispiel mindestens je eine präventive, detektive und reaktive Maßnahme nennen, deren Wirkungsweise erklären und sie einem oder mehreren CIA-Schutzzielen zuordnen können.
-->

---

<!-- _class: chapter -->
# ILOVEYOU
## Der Urknall der IT-Sicherheit


<!-- _notes:
Der ILOVEYOU-Wurm ist ein anschauliches Beispiel dafür, dass große Sicherheitsvorfälle selten nur eine Ursache haben. Social Engineering brachte Menschen zum Öffnen des Anhangs, die Benutzeroberfläche verbarg die gefährliche Dateiendung, der Windows Script Host führte den Code mit weitreichenden Rechten aus und Outlook stellte das Adressbuch zur automatischen Weiterverbreitung bereit. Die Fallstudie verbindet damit menschliche, technische und organisatorische Schwächen.

**Klausurvorbereitung:** Die Angriffskette von der Köder-Mail bis zur weltweiten Verbreitung in der richtigen Reihenfolge erklären und für jeden Schritt eine passende Gegenmaßnahme nennen können.
-->
---
<!-- _class: biglist -->
# Steckbrief: VBS.LoveLetter.A

- **Datum:** 4. Mai 2000 (Ausgangspunkt: Philippinen)
- **Schaden & Ausmaß:** 5–10 Mrd. USD Schaden, ~10 % aller Rechner weltweit infiziert
- **Datei & UI-Falle:** `LOVE-LETTER-FOR-YOU.TXT.vbs`  
  (Endung `.vbs` standardmäßig ausgeblendet $\rightarrow$ wirkte wie `.TXT`)
- **System:** Windows Script Host (WSH) führte VBScript direkt ohne Sandbox aus

<!-- _notes:
VBS.LoveLetter.A war ein in Visual Basic Script geschriebener E-Mail-Wurm. Ein Wurm kann sich selbstständig weiterverbreiten, während ein klassischer Virus normalerweise eine Wirtsdatei benötigt; beim ILOVEYOU-Wurm musste allerdings zunächst ein Mensch den Anhang öffnen. Windows blendete bekannte Dateiendungen standardmäßig aus, sodass `LOVE-LETTER-FOR-YOU.TXT.vbs` wie eine harmlose Textdatei wirkte. Nach dem Start führte der Windows Script Host das Skript ohne wirksame Isolation mit den Rechten des angemeldeten Benutzers aus. Eine Sandbox hätte den Zugriff auf Dateien, Registry und andere Programme begrenzen können.

**Klausurvorbereitung:** Wurm und Virus voneinander abgrenzen sowie erklären können, warum die Kombination aus versteckter Dateiendung, Social Engineering und fehlender Sandbox gefährlicher war als jede einzelne Schwäche für sich.
-->

---

# Die Köder-Mail

<style scoped>
p { text-align: center; }
</style>
![w:500](./img/iloveyou.jpg)

<!-- _notes:
Die Nachricht ist ein frühes Beispiel für Social Engineering: Betreff und Text sprechen Emotionen und Neugier an, statt eine technische Schwachstelle allein auszunutzen. Weil die Nachricht häufig von einer bekannten Person aus dem eigenen Adressbuch kam, wirkte sie zusätzlich vertrauenswürdig. Die dargestellte Datei heißt vollständig `LOVE-LETTER-FOR-YOU.TXT.vbs`; durch das Ausblenden der letzten Erweiterung konnte sie als Textdatei erscheinen, obwohl sie ausführbaren Skriptcode enthielt. Technische Schutzmaßnahmen müssen deshalb auch irreführende Darstellung und vorhersehbares Nutzerverhalten berücksichtigen.

**Bildbeschreibung:** Der Screenshot zeigt ein geöffnetes E-Mail-Fenster im Stil von Microsoft Outlook um das Jahr 2000. Betreff und Fenstertitel lauten „ILOVEYOU“. Im Nachrichtentext steht die Aufforderung „kindly check the attached LOVELETTER coming from me“, darunter befindet sich ein Anhang mit Skript-Symbol und dem über mehrere Zeilen umbrochenen Namen `LOVE-LETTER-FOR-YOU.TXT.vbs`. Die schlichte Nachricht und der persönlich wirkende Betreff verdeutlichen den Köder des Angriffs.

**Klausurvorbereitung:** Am Screenshot mindestens drei Social-Engineering- oder UI-Merkmale identifizieren und erklären können, welche technische Kontrolle jeweils das Risiko reduziert hätte.
-->

---

# Funktionsweise des Wurms

- **1. Persistenz:**
  - Schreibt sich in den Registry-Autostart (`HKLM\...\Run`)
  - Kopiert sich als `MSKernel32.vbs` ins Windows-Systemverzeichnis
- **2. Schneeball-Verbreitung:**
  - Liest Outlook-Adressbuch (MAPI) aus und mailt sich an alle Kontakte
  - Führte weltweit zum Zusammenbruch von Mail-Servern
- **3. Zerstörung:**
  - Überschreibt Multimediadateien & Skripte (`.jpg`, `.js`, ...) mit eigenem Code
  - Versteckt `.mp3`-Dateien und ersetzt sie durch Wurm-Kopien

<!-- _notes:
Nach der Ausführung etablierte der Wurm Persistenz, damit er nach einem Neustart erneut aktiv wurde. Dazu kopierte er sich in das Windows-Systemverzeichnis und legte einen Autostart-Eintrag in der Registry an. Über MAPI, die Messaging Application Programming Interface, griff er auf Outlook und das Adressbuch zu und versendete sich an gespeicherte Kontakte. Dieses Vertrauen in bekannte Absender erzeugte zusammen mit der automatisierten Massenverbreitung einen Schneeballeffekt. Zusätzlich überschrieben oder versteckten die Schadfunktionen Dateien; damit verletzte der Wurm nicht nur die Verfügbarkeit, sondern auch die Integrität der Daten.

**Klausurvorbereitung:** Die Phasen Persistenz, Verbreitung und Schadwirkung unterscheiden, die jeweilige technische Funktion beschreiben und den Auswirkungen passende CIA-Schutzziele zuordnen können.
-->

---

# Täter & Rechtliches Nachspiel

- **Täter & Motiv:** 
  - Onel de Guzman (24, Informatikstudent in Manila)
  - Ziel: Passwörter für kostenlosen Internetzugang abgreifen
- **Rechtsvakuum:**
  - Keine Cybercrime-Gesetze auf den Philippinen im Mai 2000
  - Weder klassischer Diebstahl noch Sachbeschädigung lag juristisch vor
- **Konsequenz:**
  - Anklage fallen gelassen (*Nulla poena sine lege*)
  - Beschleunigte Verabschiedung des *E-Commerce Act (RA 8792)*

<!-- _notes:
Onel de Guzman entwickelte den Wurm ursprünglich im Umfeld einer Abschlussarbeit und wollte nach eigener Aussage Zugangsdaten für kostenfreien Internetzugang erlangen. Die Ermittlungen stießen auf eine Gesetzeslücke: Das damalige philippinische Recht erfasste die konkrete Verbreitung von Schadsoftware nicht ausreichend. Nach dem Grundsatz „nulla poena sine lege“ darf eine Tat nur bestraft werden, wenn sie zum Tatzeitpunkt gesetzlich bestimmt war. Der kurz darauf verabschiedete E-Commerce Act, Republic Act No. 8792, schuf unter anderem rechtliche Grundlagen für die Ahndung entsprechender Computerstraftaten. Der Fall zeigt, dass technische, organisatorische und rechtliche Reaktionen auf neue Angriffsformen zusammenspielen müssen.

**Klausurvorbereitung:** Den Grundsatz „nulla poena sine lege“ auf den Fall anwenden und erklären können, weshalb eine moralisch und wirtschaftlich schädliche Handlung ohne passende Strafnorm nicht rückwirkend bestraft werden darf.
-->

---
<!-- _class: biglist -->
# Fazit & Lehren

- **Secure by Default:** Gefährliche Skripte dürfen nicht standardmäßig per Doppelklick starten
- **UI-Design ist Security:** Das Verstecken von Dateiendungen täuscht Anwender
- **Schnittstellensicherheit:** Unbeschränkter API-Zugriff (wie Outlook MAPI) ist fatal
- **Awareness:** Technik versagt, wenn Nutzer emotional manipuliert werden

<!-- _notes:
Secure by Default verlangt sichere Voreinstellungen: Ausführbare Anhänge sollten blockiert, Dateiendungen sichtbar und gefährliche Funktionen nur nach bewusster Freigabe verfügbar sein. Aussagekräftige Benutzeroberflächen sind selbst eine Sicherheitskontrolle, weil Nutzer nur auf Basis der angezeigten Informationen entscheiden können. Schnittstellen wie MAPI benötigen minimale Berechtigungen und Schutz vor automatisiertem Missbrauch. Awareness kann verdächtige Nachrichten erkennbar machen, darf aber nicht die einzige Barriere sein; nach Defense in Depth müssen technische Kontrollen Fehler auffangen. Moderne E-Mail-Filter, Application Allowlisting, Makro- und Skriptbeschränkungen sowie Endpoint Detection hätten einzelne Glieder der Angriffskette unterbrechen können.

**Klausurvorbereitung:** Die vier Lehren jeweils mit einer konkreten heutigen Maßnahme erläutern und begründen können, an welcher Stelle diese Maßnahme die ILOVEYOU-Angriffskette unterbricht.
-->

---
<!-- _class: chapter -->
# Die CIA-Triade
## Schutzziele & Sicherheitsbegriffe


<!-- _notes:
Die CIA-Triade ist ein Modell zur strukturierten Beschreibung dessen, was geschützt werden soll. Confidentiality steht für Vertraulichkeit, Integrity für Integrität und Availability für Verfügbarkeit. Die Ziele helfen bei Risikoanalysen, bei der Auswahl von Kontrollen und bei der Bewertung von Vorfällen. Ein Ereignis kann mehrere Ziele zugleich verletzen: Ransomware verändert oder verschlüsselt Daten und macht sie gleichzeitig unzugänglich. Das Modell priorisiert keine der drei Dimensionen pauschal; ihre Bedeutung hängt vom jeweiligen Geschäftsprozess ab.

**Klausurvorbereitung:** CIA ausschreiben, übersetzen und für ein vorgegebenes Angriffsszenario begründet entscheiden können, welche Schutzziele betroffen sind.
-->
---
# Angreifer & Motivationen

<div class="columns">
<div>

**Wer greift an?**
- **Cyberkriminelle:** Finanzieller Profit, RaaS, Erpressung
- **Staaten (APTs):** Spionage, Geopolitik, Sabotage
- **Insider:** Sabotage, Datendiebstahl, Rache
- **Hacktivisten & Script Kiddies:** Protest, Aufmerksamkeit, Spieltrieb

</div>
<div>

**Was sind die Ziele?**
- **Finanzen:** Lösegeld (Ransomware), Konten
- **Know-how:** Wirtschaftsspionage, IP-Diebstahl
- **Disruption:** Produktionsausfall, DoS
- **Macht & Kontrolle:** Botnetze, Persistenz

</div>
</div>



<!-- _notes:
Für die Risikobewertung reicht es nicht, nur technische Angriffsmethoden zu kennen; Fähigkeiten, Ressourcen, Zugänge und Motive der Akteure bestimmen Wahrscheinlichkeit und Auswirkung. Cyberkriminelle monetarisieren Angriffe etwa durch Betrug oder Ransomware as a Service (RaaS). Advanced Persistent Threats (APTs) sind typischerweise gut ausgestattete, langfristig und zielgerichtet operierende Gruppen, oft mit staatlichem Bezug. Insider besitzen bereits legitimen Zugang und können absichtlich handeln oder unbeabsichtigt Schäden verursachen. „IP-Diebstahl“ meint Intellectual Property, also geistiges Eigentum wie Quellcode, Patente oder Konstruktionsdaten. Script Kiddies verwenden meist vorhandene Werkzeuge ohne tiefes technisches Verständnis, können aber dennoch erhebliche Schäden verursachen.

**Klausurvorbereitung:** Angreifertyp, Motivation und Angriffsziel nicht gleichsetzen: Zu drei Angreifertypen jeweils ein plausibles Motiv, ein Ziel und eine typische Vorgehensweise herleiten können.
-->

---
# Die CIA-Triade – Überblick

- **Confidentiality (Vertraulichkeit):** Schutz vor unbefugter Offenlegung (*Nur wer darf, liest mit*).
- **Integrity (Integrität):** Schutz vor unbefugter Modifikation (*Daten bleiben korrekt & unverfälscht*).
- **Availability (Verfügbarkeit):** Gewährleistung des Zugriffs (*Systeme stehen bei Bedarf bereit*).

<!-- _notes:
Vertraulichkeit begrenzt die Offenlegung von Informationen auf berechtigte Personen, Systeme oder Prozesse. Integrität verlangt, dass Daten und Systeme korrekt, vollständig und gegen unautorisierte Änderungen geschützt sind; dazu gehört auch, Manipulationen erkennen zu können. Verfügbarkeit bedeutet, dass berechtigte Nutzer innerhalb der benötigten Zeit auf Systeme und Daten zugreifen können. Entscheidend ist der Kontext: Bei einer Patientenakte sind alle drei Ziele hoch, während bei einer öffentlichen Website meist Integrität und Verfügbarkeit stärker im Vordergrund stehen als die Vertraulichkeit der veröffentlichten Inhalte. CIA bezeichnet hier das Sicherheitsmodell und nicht den US-Nachrichtendienst.

**Klausurvorbereitung:** Die drei Definitionen präzise wiedergeben und in Fallbeispielen nicht nur die Maßnahme, sondern das tatsächlich geschützte Ziel begründen können.
-->

---
# C: Vertraulichkeit (Confidentiality)

- **Ziel:** Schutz sensibler Informationen vor unbefugtem Zugriff & Abfluss
- **Verschlüsselung in 3 Zuständen:**
  - *Data in Transit:* TLS, HTTPS, VPN (Schutz vor Abhören / Sniffing)
  - *Data at Rest:* AES-256, BitLocker (Schutz bei physischem Verlust / Diebstahl)
  - *Data in Use:* Secure Enclaves / Confidential Computing
- **Schutzmaßnahmen:**
  - **Least Privilege:** Zugriffsberechtigungen auf das absolute Minimum beschränken
  - **Authentifizierung & MFA:** Strenge Identitätsprüfung vor Freigabe
  - **Klassifizierung:** Öffentlich $\rightarrow$ Intern $\rightarrow$ Vertraulich $\rightarrow$ Streng vertraulich

<!-- _notes:
Vertraulichkeit beantwortet die Frage, wer Informationen sehen oder erfahren darf. Daten benötigen in jedem Zustand eigenen Schutz: TLS schützt sie bei der Übertragung, Festplatten- oder Datenbankverschlüsselung bei der Speicherung und Confidential Computing kann sie während der Verarbeitung in isolierten Ausführungsbereichen schützen. Verschlüsselung ist jedoch nur so wirksam wie das Schlüsselmanagement; hat ein Angreifer Schlüssel oder ein bereits entsperrtes Benutzerkonto, kann er Daten trotz starker Algorithmen lesen. Least Privilege begrenzt deshalb Zugriffe auf das notwendige Minimum, MFA erschwert die Übernahme von Konten und Klassifizierung legt den angemessenen Schutzbedarf fest. Vertraulichkeit kann außerdem durch unbeabsichtigte Offenlegung, etwa falsch adressierte E-Mails oder offene Cloud-Speicher, verletzt werden.

**Klausurvorbereitung:** Data in Transit, Data at Rest und Data in Use unterscheiden, jeweils eine Schutzmaßnahme nennen und erklären können, warum Verschlüsselung ohne Zugriffskontrolle und Schlüsselmanagement nicht genügt.
-->

---
# I: Integrität (Integrity)

- **Ziel:** Korrektheit, Vollständigkeit und Unverfälschtheit von Daten & Systemen
- **Kryptographische Schutzmechanismen:**
  - **Kryptographische Hashes (z.B. SHA-256):** Eindeutige Prüfsummen gegen Manipulation
  - **Digitale Signaturen:** Hash + Asymmetrische Kryptographie (Beweis für Urheberschaft & Unversehrtheit)
  - **Code Signing & SBOM:** Schutz der Software-Lieferkette vor Schadcode
- **Systemische Kontrollen:**
  - Schreib-Zugriffskontrolle & strikte Eingabevalidierung (Input Validation)
  - Transaktionssicherheit (ACID) & revisionssicheres Logging

<!-- _notes:
Integrität umfasst die Korrektheit, Vollständigkeit und Unverfälschtheit von Informationen und Systemzuständen. Ein kryptographischer Hash bildet Daten auf einen festen Prüfwert ab und macht Änderungen erkennbar, beweist allein aber weder den Urheber noch Schutz gegen einen Angreifer, der Daten und Hash austauschen kann. Digitale Signaturen verbinden den Hash mit einem privaten Schlüssel und unterstützen dadurch Integrität und Authentizität. Code Signing prüft die Herkunft von Software; eine Software Bill of Materials (SBOM) dokumentiert enthaltene Komponenten, garantiert aber für sich allein weder deren Sicherheit noch ihre Unverändertheit. Zugriffskontrollen verhindern unberechtigte Änderungen, Eingabevalidierung schützt die Verarbeitung und revisionssichere Logs machen Änderungen nachvollziehbar. ACID bedeutet Atomicity, Consistency, Isolation und Durability und verhindert unter anderem unvollständige Datenbanktransaktionen.

**Klausurvorbereitung:** Hash, digitale Signatur, Code Signing und SBOM nach Zweck und Aussagekraft abgrenzen sowie am Überweisungsbeispiel erklären können, wie ACID die Integrität unterstützt.
-->

---
# A: Verfügbarkeit (Availability)

- **Ziel:** Zeitgerechte und verlässliche Erreichbarkeit von Daten und Systemen
- **Wichtige Metriken:**
  - **SLA & Uptime:** 99,9 % (~8,7 h Downtime/Jahr) bis 99,999 % („Five Nines“)
  - **RPO & RTO:** Akzeptabler Datenverlust (RPO) und maximale Wiederanlaufzeit (RTO)
- **Maßnahmen zur Ausfallsicherheit:**
  - **Redundanz:** RAID, Load Balancer, Active/Active-Cluster, Geo-Redundanz
  - **3-2-1-Backup-Regel:** 3 Kopien, 2 verschiedene Medientypen, 1 Offsite (+ Unveränderbarkeit)
  - **DDoS-Abwehr:** Anycast-Netzwerke, Traffic Scrubbing, WAF & Rate Limiting

<!-- _notes:
Verfügbarkeit ist immer an einen Bedarf und einen Zeitraum gebunden: Ein System kann technisch erreichbar sein und dennoch als nicht verfügbar gelten, wenn Antworten für den Geschäftsprozess zu spät kommen. Ein Service Level Agreement (SLA) definiert zugesicherte Leistungswerte; 99,9 Prozent Uptime erlauben rund 8 Stunden und 46 Minuten Ausfall pro Jahr, 99,999 Prozent nur rund 5 Minuten und 15 Sekunden. Das Recovery Point Objective (RPO) beschreibt den maximal akzeptierten Datenverlust in Zeit, das Recovery Time Objective (RTO) die maximal akzeptierte Wiederanlaufzeit. Redundanz hält Dienste bei Komponentenausfällen am Laufen, ersetzt aber kein Backup, weil Fehler oder Ransomware auf redundante Systeme repliziert werden können. Die 3-2-1-Regel fordert drei Datenkopien auf zwei unterschiedlichen Medientypen, davon eine Kopie außerhalb des Standorts; unveränderbare Kopien erhöhen den Schutz vor Manipulation.

**Klausurvorbereitung:** SLA/Uptime, RPO und RTO voneinander abgrenzen, einfache Ausfallzeiten berechnen und begründen können, warum RAID oder Replikation kein Backup ersetzt.
-->

---
# Der Balanceakt (CIA-Trade-Offs)

Die Schutzziele stehen häufig in natürlicher Konkurrenz:



<div class="columns">
<div>

- **C vs. A:**  
  Strikte Verschlüsselung & Isolation verlangsamt oder blockiert Zugriff im Notfall.

</div>
<div>

- **I vs. A:**  
  Aufwendige Prüfungen und Sperren belasten die Systemperformance.

</div>
</div>

> **Beispiel:** Ein Notfallzugang verbessert die Verfügbarkeit, kann aber die Vertraulichkeit schwächen. Deshalb braucht er enge Rechte und Protokollierung.

<!-- _notes:
Schutzziele werden nicht isoliert maximiert, sondern entsprechend Risiko und Geschäftsbedarf ausbalanciert. Starke Isolation und zusätzliche Freigaben verbessern häufig die Vertraulichkeit, können aber den Zugriff verzögern und damit die Verfügbarkeit senken. Umfangreiche Integritätsprüfungen, Sperren oder Konsensverfahren benötigen Zeit und Rechenleistung. Umgekehrt kann ein leicht zugänglicher Notfallzugang die Verfügbarkeit erhöhen, zugleich aber Missbrauch und Datenoffenlegung erleichtern. Im Krankenhaus kann ein Break-Glass-Zugang deshalb sofortigen Zugriff gewähren, sollte aber eng begrenzt, besonders authentifiziert, vollständig protokolliert und nachträglich geprüft werden. Der Trade-off wird damit risikobasiert gestaltet, nicht einfach zugunsten eines Ziels aufgelöst.

**Klausurvorbereitung:** Für einen Zielkonflikt die beteiligten CIA-Ziele, die konkrete Abwägung und kompensierende Kontrollen erläutern; das Krankenhausbeispiel eignet sich als Musterfall.
-->

---
# Erweiterte Schutzziele

Moderne Sicherheitsmodelle ergänzen die CIA-Triade um zwei Kernaspekte:

- **Authentizität (Authenticity):**  
  - *Echtheit der Identität und des Ursprungs*
  - „Bist du wirklich derjenige, für den du dich ausgibst?“ (MFA, Zertifikate)
- **Zurechenbarkeit / Nicht-Abstreitbarkeit (Non-Repudiation):**  
  - *Beweiskraft von Handlungen*
  - Niemand kann eine getätigte Transaktion leugnen (Signaturen, Audit-Logs)

> **Einordnung:** CIA beschreibt drei grundlegende Schutzziele; Authentizität und Zurechenbarkeit ergänzen das Modell, ersetzen es aber nicht.

<!-- _notes:
Authentizität beantwortet, ob eine Identität, Nachricht oder Quelle tatsächlich echt ist. Ein Passwort oder MFA kann die Identität eines Benutzers prüfen, ein Zertifikat bindet einen öffentlichen Schlüssel an eine Identität und eine digitale Signatur kann den Ursprung einer Nachricht bestätigen. Nicht-Abstreitbarkeit beziehungsweise Zurechenbarkeit verlangt darüber hinaus belastbare Belege dafür, wer eine Handlung ausgeführt hat. Digitale Signaturen und manipulationsgeschützte Audit-Logs können dies unterstützen, die Beweiskraft hängt jedoch auch von sicher verwahrten Schlüsseln, eindeutigen Identitäten, Zeitstempeln und rechtlichen Rahmenbedingungen ab. Authentifizierung ist der Prüfprozess, Authentizität die dabei angestrebte Eigenschaft; Autorisierung entscheidet anschließend, was eine bestätigte Identität tun darf.

**Klausurvorbereitung:** Authentizität, Authentifizierung, Autorisierung und Nicht-Abstreitbarkeit sauber unterscheiden und erklären können, welche Aussagen digitale Signaturen und Audit-Logs jeweils ermöglichen und wo ihre Grenzen liegen.
-->



