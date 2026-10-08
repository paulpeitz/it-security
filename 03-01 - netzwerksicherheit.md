---
marp: true
theme: custom
paginate: false
html: true
footer: ![w:280](img/dhbw-ka.svg)
title: Sicherheit in Netzwerken
---

<!-- _class: title -->
# Sicherheit in Netzwerken

<br><br><br><br><br><br>

## Risiken verstehen, Schutz erklären, Kunden beraten


<!-- _notes:
Netzwerksicherheit ist kein reines Technikthema: Ausfälle, Datendiebstahl und manipulierte Kommunikation wirken direkt auf Umsatz, Vertrauen und Lieferfähigkeit. Ziel der Vorlesung ist deshalb nicht, Netzwerkprotokolle konfigurieren zu können. Die Studierenden sollen Risiken verständlich einordnen, den Nutzen von Schutzmaßnahmen erklären und in Kundengesprächen die richtigen Fragen stellen können. Technische Begriffe dienen dabei nur als Orientierung und werden in den Notes vertieft.

Inhaltlich knüpft die Vorlesung direkt an die CIA-Triade an: Mitlesen von Datenverkehr verletzt die Vertraulichkeit, manipulierte Umleitungen die Integrität und Überlastungsangriffe die Verfügbarkeit. Jeder in dieser Vorlesung behandelte Angriff lässt sich genau einem oder mehreren dieser drei Schutzziele zuordnen; das ist der rote Faden, an dem sich die gesamte Stoffmenge ordnen lässt.

**Klausurvorbereitung:** Für jeden später genannten Angriff benennen können, welches Schutzziel der CIA-Triade primär betroffen ist und welche Geschäftsauswirkung daraus entsteht.
-->
---
<!-- _class: biglist -->
# Agenda

- **Geschäftsrisiken** – warum Netzwerksicherheit alle Unternehmen betrifft
- **Orientierungsmodell** – wo Kommunikation angegriffen werden kann
- **Zugang und lokales Netz** – wer oder was darf sich verbinden?
- **Datenwege im Internet** – wem vertrauen wir beim Transport?
- **Verfügbarkeit von Diensten** – wie entstehen Überlastung und Ausfall?
- **Anwendungen und Sitzungen** – wie werden Nutzer umgeleitet oder übernommen?
- **Schutzkonzept und Beratung** – mehrere Schutzlinien sinnvoll kombinieren

<!-- _notes:
Die Agenda folgt einer Beratungsperspektive: Zuerst betrachten wir Auswirkungen auf das Geschäft, danach typische Angriffspunkte und schließlich geeignete Schutzprinzipien. Das OSI-Modell bleibt als Landkarte erhalten, muss aber weder auswendig gelernt noch technisch beherrscht werden. Für jede Station helfen vier Fragen: Was kann passieren? Welche Folgen hat das? Welches Schutzprinzip hilft? Welche Frage sollte man einem Kunden stellen?

Die Reihenfolge der Kapitel ist bewusst gewählt und entspricht dem Weg eines Datenpakets: vom Gerät im lokalen Netz über den Transport durch fremde Netze bis zur Anwendung, mit der ein Mensch arbeitet. Wer diese Reihenfolge im Kopf behält, kann jeden Angriffsbegriff später an der richtigen Stelle einsortieren, auch wenn der Begriff selbst in der Vorlesung nicht vorkam.

**Klausurvorbereitung:** Die sieben Kapitelüberschriften als Gliederung einer freien Antwort nutzen können. Eine Transferfrage lässt sich fast immer beantworten, indem man Zugang, Transport, Anwendung und Organisation nacheinander durchgeht und für jeden Bereich Risiko und Maßnahme nennt.
-->

---
<!-- _class: chapter -->
# Warum ist Netzwerksicherheit so wichtig?

## Die Angriffsfläche der vernetzten Welt


<!-- _notes:
Dieses Kapitel schafft den geschäftlichen Kontext für alle späteren Konzepte. Vernetzung ermöglicht digitale Prozesse, vergrößert aber zugleich die Zahl möglicher Einstiege und Abhängigkeiten. Die Studierenden sollen erklären können, warum Cloud, Homeoffice und vernetzte Geräte die klassische Unternehmensgrenze auflösen. Dabei geht es noch nicht um einzelne Produkte, sondern um Angriffsfläche, Schadensausmaß und Verantwortung.

Drei Begriffe werden hier eingeführt und im weiteren Verlauf vorausgesetzt. Die **Angriffsfläche** ist die Summe aller Punkte, an denen ein Angreifer mit einem System interagieren kann; sie wächst mit jedem Gerät, jedem offenen Dienst und jeder Schnittstelle zu Dritten. Der **Perimeter** ist die gedachte Außengrenze des eigenen Netzes. **Zero Trust** ist die Gegenthese dazu: Vertrauen entsteht nicht durch den Standort im Netz, sondern wird bei jedem Zugriff neu geprüft.

**Klausurvorbereitung:** Den Begriff Angriffsfläche definieren und mit drei konkreten Beispielen belegen können, die über klassische PCs hinausgehen. Außerdem erklären können, warum eine größere Angriffsfläche nicht automatisch mehr Schwachstellen bedeutet, aber mehr Prüf- und Pflegeaufwand erzeugt.
-->
---
# Jedes Gerät hängt am Netzwerk

- Vernetzt sind nicht nur Laptops, sondern auch **Drucker, Maschinen, Kameras und Sensoren**
- Cloud-Dienste und Partner schaffen zusätzliche Verbindungen außerhalb des Unternehmens
- Jedes Gerät und jede Verbindung erweitert die **Angriffsfläche**
- Ein unauffälliges Gerät kann zum Einstieg in kritische Systeme werden

> **Geschäftsfrage:** Wissen wir, welche Geräte mit unserem Netzwerk verbunden sind?

<!-- _notes:
Netzwerksicherheit betrifft jedes Gerät, das Daten sendet oder empfängt, nicht nur klassische Computer. In vielen Unternehmen gibt es mehr technische Geräte als Mitarbeitende, gleichzeitig werden alte oder selten beachtete Geräte weniger konsequent aktualisiert. Dadurch kann etwa ein Drucker oder eine Kamera zum Ausgangspunkt für weitere Angriffe werden.

Besonders kritisch sind Geräte, für die niemand im Unternehmen verantwortlich ist: Netzwerkdrucker mit Standardpasswort, Überwachungskameras mit jahrelang nicht aktualisierter Firmware, Klimasteuerungen oder Produktionsmaschinen, die aus Gewährleistungsgründen nicht gepatcht werden dürfen. Solche Geräte lassen sich oft nicht aktualisieren und müssen deshalb durch Segmentierung isoliert werden. Ein bekanntes reales Beispiel ist der Target-Vorfall von 2013, bei dem Angreifer über die Zugangsdaten eines Klimatechnik-Dienstleisters ins Netz gelangten und am Ende Kreditkartendaten von rund 40 Millionen Kunden abflossen. Der Einstiegspunkt war also ein völlig unscheinbarer Nebenbereich.

**Klausurvorbereitung:** Erklären können, warum Inventarisierung (Asset Management) die Grundlage jeder weiteren Schutzmaßnahme ist, und zwei Gründe nennen, warum ein nicht patchbares Gerät trotzdem sicher betrieben werden kann. Merksatz: Was nicht bekannt ist, kann weder bewertet noch zuverlässig geschützt werden.
-->

---
# Zugriff von überall möglich

- Homeoffice, mobile Geräte und Cloud-Dienste lösen die klassische **Unternehmensgrenze** auf
- Angriffe sind weltweit möglich und rund um die Uhr automatisierbar
- Gestohlene Zugangsdaten oder ein ungeschütztes Gerät können den Einstieg ermöglichen
- Danach entscheidet die interne Abschottung über das Schadensausmaß

> **Merksatz:** Ein Netzwerk ist nur so sicher wie sein schwächstes angeschlossenes Gerät.

<!-- _notes:
Früher wurde Netzwerksicherheit häufig als Burg mit Mauer gedacht: innen vertrauenswürdig, außen gefährlich. Cloud, Homeoffice und Dienstleister durchqueren diese Grenze jedoch täglich. Ein kompromittierter Drucker oder Laptop darf daher nicht automatisch auf sensible Systeme zugreifen können.

Zwei Begriffe helfen beim Verständnis des Schadensverlaufs. Der **Initial Access** ist der erste erfolgreiche Einstieg, etwa über gestohlene Zugangsdaten, eine Phishing-Mail oder ein verwundbares, aus dem Internet erreichbares System. Die **Lateral Movement** genannte Phase beschreibt die anschließende Ausbreitung von System zu System innerhalb des Netzes. Fast jeder große Vorfall besteht aus diesen beiden Phasen, und die Schadenshöhe wird überwiegend in der zweiten Phase entschieden. Genau deshalb ist interne Abschottung mindestens so wichtig wie die Absicherung nach außen: Der Einstieg lässt sich nie vollständig verhindern, die Ausbreitung dagegen schon stark begrenzen.

**Klausurvorbereitung:** Initial Access und Lateral Movement unterscheiden und je eine Maßnahme nennen können, die gezielt gegen die jeweilige Phase wirkt (z. B. MFA gegen Initial Access, Segmentierung und minimale Rechte gegen Lateral Movement).
-->

---
<!-- _class: normal -->
# Perimeter-Sicherheit reicht nicht mehr

<div class="columns">
<div>

### Früher
- Klare Netzwerkgrenze (Perimeter)
- Firewall am Übergang zum Internet
- „Innen sicher, außen unsicher"

</div>
<div>

### Heute
- Homeoffice, Cloud, mobile Geräte
- Keine klare Grenze mehr
- Prinzip **Zero Trust**: jede Verbindung wird geprüft, egal woher

</div>
</div>

<!-- _notes:
Die Gegenüberstellung zeigt einen Strategiewechsel, keinen einzelnen Kaufartikel. Zero Trust bedeutet, dass ein Zugriff nicht allein wegen seines Standorts als vertrauenswürdig gilt. Bewertet werden Identität, Berechtigung, Gerätezustand und Auffälligkeiten bei jedem einzelnen Zugriff, nicht nur einmalig beim Betreten des Netzes.

Der Leitsatz lautet "never trust, always verify". Praktisch umgesetzt wird er über drei Bausteine: starke Authentifizierung der Identität (typischerweise Mehrfaktor-Authentifizierung), Prüfung des Gerätezustands (Patchstand, Verschlüsselung, Virenschutz) und eine Autorisierungsentscheidung pro Ressource statt pro Netzzone. Das klassische VPN ist dafür ein gutes Gegenbeispiel: Es authentifiziert einmal beim Verbindungsaufbau und gewährt danach oft breiten Netzzugang.

Wichtige Einordnung: Perimeterschutz wird durch Zero Trust nicht ersetzt, sondern ergänzt. Eine Firewall bleibt sinnvoll, sie ist nur nicht mehr die einzige Vertrauensgrenze.

**Klausurvorbereitung:** Den Unterschied zwischen Perimetermodell und Zero Trust in eigenen Worten erklären und begründen können, warum "im internen Netz" kein ausreichendes Kriterium für Vertrauen mehr ist. Typische Fehlannahme in Prüfungen: Zero Trust sei ein Produkt oder mache Firewalls überflüssig.
-->

---
<!-- _class: chapter -->
# Wo Kommunikation angegriffen werden kann

## Das OSI-Modell als einfache Landkarte


<!-- _notes:
Das OSI-Modell ordnet Netzwerkkommunikation in sieben Ebenen. Für diese Zielgruppe dient es ausschließlich als Landkarte: vom physischen Zugang über den Transportweg bis zur Anwendung. Entscheidend ist die Erkenntnis, dass Risiken an verschiedenen Stellen entstehen und unterschiedliche Maßnahmen erfordern.

Der eigentliche Nutzen eines Schichtenmodells liegt in der Entkopplung: Jede Schicht erbringt eine Leistung für die darüberliegende und nutzt die Leistung der darunterliegenden, ohne deren interne Funktionsweise zu kennen. Deshalb kann dieselbe Webseite über WLAN, Mobilfunk oder Kabel übertragen werden. Sicherheitstechnisch folgt daraus eine wichtige Konsequenz: Eine Schutzmaßnahme wirkt immer nur auf der Schicht, auf der sie ansetzt. TLS schützt den Inhalt, verhindert aber keine Überlastung; eine Firewall filtert Verbindungen, erkennt aber keinen gestohlenen Sitzungstoken.

**Klausurvorbereitung:** Begründen können, warum keine einzelne Maßnahme alle Schichten absichert. Das ist die direkte fachliche Herleitung des später behandelten Prinzips Defense in Depth.
-->
---
<!-- _class: biglist -->
# Warum ein Schichtenmodell?

- Netzwerkkommunikation besteht aus mehreren aufeinander aufbauenden Aufgaben
- Das **OSI-Modell** ordnet sie vom physischen Zugang bis zur Anwendung
- Jede Ebene kann eigene Risiken und Schutzmaßnahmen haben
- Für Beratung und Vertrieb genügt eine vereinfachte Landkarte:
  - **Zugang – Transport – Anwendung**

<!-- _notes:
Das vollständige OSI-Modell umfasst sieben Schichten und ermöglicht Fachleuten eine präzise Zuordnung technischer Aufgaben. Für das konzeptionelle Verständnis werden diese hier zu drei Bereichen gebündelt. Zugang umfasst Geräte und lokale Verbindungen, Transport den Weg der Daten und Anwendung die Dienste, mit denen Menschen arbeiten.

Technisch funktioniert das Modell über Kapselung: Jede Schicht verpackt die Daten der darüberliegenden Schicht in einen eigenen Umschlag mit eigenem Kopfteil (Header). Beim Empfänger wird in umgekehrter Reihenfolge wieder ausgepackt. Die Briefanalogie passt gut: Der Brieftext ist die Anwendungsschicht, der Umschlag mit Adresse die Vermittlungsschicht, der Postweg die Bitübertragung. Wer den Umschlag fälscht, ändert den Weg, nicht den Inhalt; wer den Inhalt verschlüsselt, schützt ihn unabhängig vom Weg.

Das OSI-Modell ist ein Referenzmodell und bildet die Realität nicht exakt ab. In der Praxis wird häufiger das vierschichtige TCP/IP-Modell verwendet (Netzzugang, Internet, Transport, Anwendung), das die OSI-Schichten 5 bis 7 zu einer einzigen Anwendungsschicht zusammenfasst.

**Klausurvorbereitung:** Die Dreiteilung Zugang / Transport / Anwendung sicher beherrschen und einen genannten Angriff dem richtigen Bereich zuordnen können. Die exakte Nummerierung der sieben Schichten ist nachrangig, die Funktion der Bereiche dagegen prüfungsrelevant.
-->

---
# Eine Landkarte in drei Bereichen

| Bereich | Worum geht es? | Typisches Risiko |
|---|---|---|
| **Anwendung** | Webseiten, E-Mail, angemeldete Sitzungen | Täuschung oder Übernahme |
| **Transport** | Datenwege und Erreichbarkeit | Umleitung oder Überlastung |
| **Zugang** | Geräte, Kabel, WLAN, lokales Netz | Unbefugte Verbindung |

> Das technische OSI-Modell verfeinert diese Landkarte in sieben Schichten.

<!-- _notes:
Diese Dreiteilung ist die zentrale Lernhilfe der Vorlesung. Die sieben OSI-Schichten lauten von unten nach oben: Bitübertragung (1), Sicherung (2), Vermittlung (3), Transport (4), Sitzung (5), Darstellung (6) und Anwendung (7). Die vereinfachte Landkarte fasst Schicht 1 und 2 als Zugang, Schicht 3 und 4 als Transport sowie Schicht 5 bis 7 als Anwendung zusammen.

Zur Einordnung der späteren Folien: MAC- und ARP-Spoofing gehören zum Zugang, IP-Spoofing und BGP-Hijacking zum Transport (Schicht 3), SYN-Flood und Portscans ebenfalls zum Transport (Schicht 4), DNS-Spoofing, Session Hijacking und HTTP-Flood zur Anwendung. Man-in-the-Middle ist bewusst keine Schicht zugeordnet: Es ist eine Angreiferposition, die aus allen drei Bereichen heraus erreicht werden kann.

**Klausurvorbereitung:** Die Tabelle als Antwortgerüst nutzen. Bei einer Zuordnungsaufgabe genügt oft die Frage, ob der Angriff am Gerät ansetzt (Zugang), am Weg der Daten (Transport) oder an dem Dienst, mit dem der Nutzer interagiert (Anwendung). Merksatz: Wer darf hinein, wie reisen die Daten und welchem Dienst vertraut der Nutzer?
-->

---
# Vier Fragen als roter Faden

- **Ereignis:** Was kann bei der Kommunikation schiefgehen?
- **Auswirkung:** Welche Folgen entstehen für Kunden und Geschäft?
- **Schutz:** Welches Sicherheitsprinzip reduziert das Risiko?
- **Beratung:** Welche Frage macht den Handlungsbedarf sichtbar?

> Technische Details erklären das Wie. Für Entscheidungen zählt zuerst das Warum.

<!-- _notes:
Dieses Raster ist wichtiger als die Namen einzelner Protokolle und lässt sich auf jede Prüfungsfrage anwenden, auch auf unbekannte Angriffe. Beispiel: Wird Datenverkehr unbemerkt umgeleitet, können vertrauliche Informationen offengelegt oder verändert werden; Verschlüsselung und sichere Zugänge reduzieren das Risiko. Eine passende Beratungsfrage wäre: "Wie schützen Sie Mitarbeitende in fremden WLAN-Netzen?"

Das Raster entspricht fachlich dem Aufbau einer Risikobetrachtung: Ereignis entspricht der Bedrohung, Auswirkung dem Schadensausmaß, Schutz der Maßnahme (Control) und die Beratungsfrage der Erhebung des Ist-Zustands. Ergänzend gehört zu einer vollständigen Risikobewertung die Eintrittswahrscheinlichkeit; erst Schadensausmaß mal Wahrscheinlichkeit ergibt das Risiko. Deshalb ist nicht jeder technisch mögliche Angriff auch geschäftlich relevant, und umgekehrt kann ein simpler Angriff mit hoher Häufigkeit teurer sein als ein spektakulärer Einzelfall.

**Klausurvorbereitung:** Eine offene Transferfrage immer in diesen vier Schritten beantworten. Wer Ereignis, Auswirkung, Schutz und Beratungsfrage sauber trennt, erhält auch bei unbekanntem Angriffsnamen eine vollständige Antwortstruktur.
-->

---
<!-- _class: chapter -->
# Zugang und lokales Netz

## Wer oder was darf sich verbinden?


<!-- _notes:
Der erste Bereich umfasst physischen Zugang, WLAN und die Kommunikation im lokalen Netzwerk. Aus Geschäftssicht geht es um die Frage, welche Personen und Geräte überhaupt eine Verbindung herstellen dürfen. Ein Angreifer benötigt nicht immer eine komplizierte Schwachstelle; manchmal genügen eine frei zugängliche Netzwerkdose oder ein schlecht geschütztes Gast-WLAN.

Technisch entsprechen diesem Bereich die OSI-Schichten 1 (Bitübertragung: Kabel, Funk, Signale) und 2 (Sicherung: Switches, MAC-Adressen, ARP). Eine **MAC-Adresse** ist die 48 Bit lange Hardwareadresse einer Netzwerkschnittstelle und gilt nur innerhalb des lokalen Netzsegments; sie wird beim Übergang über einen Router ersetzt. Das ist der zentrale Unterschied zur IP-Adresse, die ende-zu-ende gültig bleibt.

Die wichtigste Schutzmaßnahme dieses Bereichs heißt **Network Access Control (NAC)**, häufig umgesetzt über den Standard IEEE 802.1X: Ein Gerät muss sich am Switch oder Access Point authentifizieren, bevor der Port überhaupt Datenverkehr durchlässt.

**Klausurvorbereitung:** MAC-Adresse und IP-Adresse sicher unterscheiden können (lokal vs. netzübergreifend) und 802.1X als Antwort auf die Frage "Wer darf sich überhaupt verbinden?" nennen können.
-->
---
# Physischer Zugang ist Netzwerkzugang

- Frei zugängliche Netzwerkdosen können interne Verbindungen ermöglichen
- Unsicheres WLAN kann Daten preisgeben oder fremde Geräte hereinlassen
- Serverräume, Verteiler und Leitungen sind Ziele für Diebstahl oder Sabotage
- Schutz beginnt deshalb bei **Zutritt, Inventar und sicheren Funknetzen**

> **Beratungsfrage:** Welche Netzwerkzugänge sind für Gäste und Dritte erreichbar?

<!-- _notes:
Auf der physischen OSI-Schicht werden Bits über Kabel, Glasfaser oder Funk übertragen. Ein erreichbarer Anschluss kann einem fremden Gerät den Zugang zum internen Netz eröffnen, sofern keine zusätzliche Prüfung stattfindet. Funkverbindungen reichen zudem über Gebäudewände hinaus und benötigen daher starke Verschlüsselung und sichere Konfiguration.

Typische Angriffswege auf dieser Ebene sind: eine freie Netzwerkdose in Empfang, Besprechungsraum oder Parkhaus; ein präpariertes Gerät, das unauffällig hinter einem Drucker eingesteckt wird; ein gefälschter WLAN-Zugangspunkt mit dem Namen des Firmen-WLANs (sogenannter Evil Twin oder Rogue Access Point); sowie das Abgreifen von Signalen über unverschlüsselte Funkstrecken. Bei WLAN gilt: WEP und WPA sind gebrochen und dürfen nicht mehr eingesetzt werden, WPA2 mit AES ist der heutige Mindeststandard, WPA3 der aktuelle Stand mit verbessertem Schutz gegen das Offline-Erraten von Passwörtern.

Organisatorische Maßnahmen ergänzen die Technik: Besucherregelungen, Begleitpflicht für Fremdpersonal, verschlossene Technikräume, Abschaltung ungenutzter Switchports und ein getrenntes Gast-WLAN ohne Zugriff auf interne Systeme.

**Klausurvorbereitung:** Die WLAN-Verschlüsselungsstandards in der richtigen Reihenfolge einordnen können und begründen, warum physische Sicherheit Teil der IT-Sicherheit ist. Merksatz: Cybersecurity beginnt nicht erst in Software.
-->

---
# Vertrauen im lokalen Netzwerk

- Geräte im selben Netz müssen einander finden und Daten austauschen
- Ältere Netzwerkmechanismen vertrauen vielen Angaben ohne Identitätsprüfung
- Ein fremdes Gerät kann sich dadurch als legitimer Kommunikationspartner ausgeben
- Mögliche Folgen: **Mitlesen, Manipulation oder Zugriff auf weitere Systeme**

> Nähe im Netzwerk ist kein Beweis für Vertrauenswürdigkeit.

<!-- _notes:
Technisch beschreibt diese Folie die OSI-Sicherungsschicht. Switches leiten Daten im lokalen Netz anhand von MAC-Adressen weiter; das **Address Resolution Protocol (ARP)** ordnet IP-Adressen diesen Geräteadressen zu. ARP besitzt im Grunddesign keine Authentifizierung, weshalb gefälschte Antworten akzeptiert werden können.

Der Ablauf im Detail: Will ein Rechner ein Paket an die IP-Adresse 192.168.1.1 senden, fragt er per Broadcast ins gesamte Segment "Wem gehört 192.168.1.1?". Das zuständige Gerät antwortet mit seiner MAC-Adresse, und der Fragende speichert die Zuordnung im ARP-Cache. Das Problem: Ein Gerät akzeptiert auch Antworten, die es nie angefordert hat, und überschreibt damit bestehende Einträge. Es gibt weder Signatur noch Herkunftsprüfung.

Dieses implizite Vertrauen ist kein Programmierfehler, sondern eine Entwurfsentscheidung aus einer Zeit, in der lokale Netze als geschlossene, vertrauenswürdige Umgebungen galten. Dasselbe Muster findet sich bei vielen alten Protokollen wie DHCP, DNS in der Urform oder SMTP. Da ARP nicht nachträglich abgesichert werden kann, liegt der Schutz in kompensierenden Maßnahmen: Segmentierung, Dynamic ARP Inspection auf Switches, 802.1X und vor allem Ende-zu-Ende-Verschlüsselung der Anwendungen.

**Klausurvorbereitung:** Erklären können, warum ARP keine Authentifizierung besitzt und welche Konsequenz das für das Vertrauen in interne Netze hat. Merksatz: Nähe im Netzwerk ist kein Beweis für Vertrauenswürdigkeit.
-->

---
# Beispiel: Identität im Netzwerk vortäuschen

- Angreifer gibt sich im lokalen Netz als ein anderes Gerät aus
- Datenverkehr wird unbemerkt über den Angreifer geleitet
- Vergleichbar mit einer gefälschten Nachsendeadresse für Geschäftspost
- Risiken: Zugangsdaten mitlesen, Inhalte verändern, Kommunikation stören
- Fachbegriffe: **MAC-Spoofing** und **ARP-Spoofing**

<!-- _notes:
**MAC-Spoofing** bezeichnet das Vortäuschen einer fremden Geräteadresse, beispielsweise um eine Zugangsbeschränkung auf Basis von MAC-Adressfiltern zu umgehen. Beim **ARP-Spoofing** (auch ARP-Poisoning) sendet ein Angreifer gefälschte Zuordnungen und positioniert sich so zwischen Opfer und Netzübergang.

Wichtig für das Verständnis ist die Voraussetzung: Der Angreifer muss sich bereits im selben lokalen Netzsegment befinden, etwa über ein schlecht geschütztes WLAN, eine offene Netzwerkdose oder einen bereits kompromittierten Rechner eines Kollegen. ARP-Spoofing ist damit typischerweise kein Erstzugang, sondern ein Werkzeug der Lateral-Movement-Phase. Da MAC-Adressen an Routergrenzen ersetzt werden, funktioniert der Angriff nicht über das Internet hinweg.

Wirkung und Grenzen: Der Angreifer sieht den gesamten Datenverkehr des Opfers. Ist dieser per TLS verschlüsselt, kann er Metadaten auswerten (welche Ziele werden kontaktiert, wie viel Datenvolumen), die Inhalte jedoch nicht lesen, solange das Opfer Zertifikatswarnungen nicht wegklickt. Unverschlüsselte Protokolle wie HTTP, FTP oder Telnet geben dagegen Zugangsdaten im Klartext preis.

**Klausurvorbereitung:** Die Voraussetzung (gleiches lokales Netz) sowie die Grenze des Angriffs (TLS schützt den Inhalt) nennen können. Kurzformel: Falsche Identität führt zu falschem Datenweg.
-->

---
# ARP-Spoofing als Diagramm

![w:1280 center](img/arp-spoofing.svg)

<!-- _notes:
Das Diagramm visualisiert die gefälschte Nachsendeadresse: Der Angreifer behauptet gegenüber dem Client, der Weg ins Internet führe über ihn. Gleichzeitig kann er sich gegenüber dem Gateway als Client ausgeben. Die Kommunikation funktioniert weiter, weshalb der zusätzliche Zwischenstopp oft unbemerkt bleibt; technisch entsteht so eine Man-in-the-Middle-Position.

**Bildbeschreibung:** Das Diagramm zeigt drei Kreise bzw. Kästen. Links oben steht in einem blau hinterlegten Kasten der "Client (Opfer)", rechts oben in einem grün hinterlegten Kasten das "Gateway", also der reguläre Übergang ins Internet. Unten in der Mitte befindet sich ein rot hinterlegter Kasten mit der Beschriftung "Angreifer". Vom Client führt ein roter Pfeil nach unten zum Angreifer, beschriftet mit der gefälschten Behauptung "Ich bin der Gateway". Vom Angreifer führt ein roter gestrichelter Pfeil nach oben rechts zum Gateway mit der Beschriftung "leitet Verkehr weiter". Die gestrichelte Linie verdeutlicht, dass der Angreifer den Verkehr nach dem Mitlesen weiterreicht, sodass die Verbindung aus Sicht des Opfers normal funktioniert. Die Bildunterschrift fasst zusammen: "Gefälschte ARP-Antwort lenkt den gesamten Verkehr des Clients über den Angreifer um." Auffällig ist, dass es keine direkte Verbindung mehr zwischen Client und Gateway gibt: Der ursprünglich direkte Weg ist durch den Umweg über den Angreifer ersetzt worden.

**Klausurvorbereitung:** Das Diagramm als dreistufigen Ablauf beschreiben können: (1) Täuschung durch gefälschte ARP-Antwort, (2) Umleitung des Datenverkehrs über den Angreifer, (3) Weiterleitung an das echte Gateway, damit der Angriff unbemerkt bleibt. Wichtig ist der Hinweis, dass Schritt 3 der Grund für die schlechte Erkennbarkeit ist.
-->

---
<!-- _class: chapter -->
# Datenwege im Internet

## Wem vertrauen wir beim Transport?


<!-- _notes:
Dieses Kapitel betrachtet den Weg von Daten über Netzwerkgrenzen hinweg. Unternehmen steuern nicht jede Zwischenstation selbst und sind deshalb auf Provider, korrekte Wegweiser und sichere Ende-zu-Ende-Verbindungen angewiesen. Für Beratung und Vertrieb ist entscheidend, Abhängigkeiten und Auswirkungen zu verstehen, nicht Routingtabellen zu konfigurieren.

Technisch gehört dieser Bereich zur OSI-Vermittlungsschicht (Schicht 3). Der entscheidende Unterschied zum vorherigen Kapitel: Im lokalen Netz kennt man alle Beteiligten, im Internet dagegen durchläuft ein Paket typischerweise 10 bis 20 fremde Zwischenstationen, die unterschiedlichen Unternehmen und Staaten gehören. Daraus folgt die Grundannahme der modernen Netzwerksicherheit: Der Transportweg ist grundsätzlich als unsicher zu behandeln, Schutz muss deshalb im Inhalt selbst liegen.

**Klausurvorbereitung:** Als Leitfrage des Kapitels merken: Was passiert, wenn Absender oder Wegweiser lügen? Daraus ergeben sich die beiden Hauptrisiken IP-Spoofing (gefälschter Absender) und BGP-Hijacking (gefälschter Wegweiser).
-->
---
# Wie Daten ihr Ziel finden

- Daten werden in kleine Pakete aufgeteilt und über mehrere Stationen weitergeleitet
- **IP-Adressen** kennzeichnen Absender und Ziel
- Router wählen den verfügbaren Weg durch verschiedene Netze
- Unternehmen vertrauen dabei auf Infrastruktur außerhalb der eigenen Kontrolle

> Schutz muss auch wirken, wenn der Transportweg nicht vertrauenswürdig ist.

<!-- _notes:
Auf der OSI-Vermittlungsschicht übernimmt das **Internet Protocol (IP)** die Adressierung von Paketen. Router lesen die Zieladresse und reichen Pakete über mehrere Netze weiter. Der konkrete Weg kann sich ändern und gehört nur teilweise dem eigenen Unternehmen.

Drei Eigenschaften von IP sind sicherheitsrelevant. Erstens ist IP **verbindungslos**: Jedes Paket wird einzeln weitergeleitet, es gibt keinen festen Kanal. Zweitens arbeitet IP nach dem **Best-Effort-Prinzip**: Es gibt keine Garantie für Zustellung, Reihenfolge oder Zeitpunkt; dafür sind höhere Schichten zuständig. Drittens enthält der IP-Header die Absenderadresse als reine Angabe des Senders, ohne jede Prüfung durch das Netz. Genau diese dritte Eigenschaft ermöglicht die auf der nächsten Folie behandelte Fälschung.

Die Postanalogie trägt hier weit: Die Adresse steuert den Weg, jede Poststelle sieht Absender und Empfänger, aber nur ein verschlossener Umschlag schützt den Inhalt. Transportverschlüsselung wie TLS entspricht diesem Umschlag und wirkt unabhängig davon, wie viele fremde Stationen das Paket passiert. Was TLS allerdings nicht verbirgt, sind die Metadaten: Wer mit wem kommuniziert, bleibt auf dem Weg sichtbar.

**Klausurvorbereitung:** Erklären können, warum Verschlüsselung die logische Antwort auf einen nicht kontrollierbaren Transportweg ist, und benennen können, welche Information trotz Verschlüsselung sichtbar bleibt (Absender, Ziel, Datenmenge, Zeitpunkt).
-->

---
# Gefälschte Absender

- Absenderangaben in Netzwerkpaketen können manipuliert werden
- Angreifer verschleiern damit ihre Herkunft oder missbrauchen Vertrauen
- Gefälschte Adressen können Antworten gezielt an ein Opfer lenken
- Deshalb darf eine Adresse allein keine Identität beweisen

> **Beratungsfrage:** Welche Zugriffe vertrauen nur auf Herkunft oder Standort?

<!-- _notes:
Der technische Begriff lautet **IP-Spoofing**. Ein Paket enthält eine behauptete Absenderadresse, die bei bestimmten Kommunikationsformen nicht automatisch bestätigt wird. Das ähnelt einer frei wählbaren Absenderzeile auf einem Briefumschlag.

Entscheidend für das Verständnis ist, wann IP-Spoofing funktioniert und wann nicht. Bei **verbindungslosen Protokollen wie UDP** ist die Fälschung einfach, weil der Angreifer keine Antwort benötigt; er will die Antwort ja gerade woanders hinlenken. Bei **TCP** ist die Fälschung schwierig, weil der Verbindungsaufbau eine Antwort erfordert, die der Angreifer bei gefälschtem Absender nicht erhält. Deshalb werden Verstärkungsangriffe praktisch immer über UDP gefahren, während TCP-basierte Angriffe wie die SYN-Flood die Fälschung nur zur Verschleierung nutzen.

Als Gegenmaßnahme auf Netzebene existiert das **Ingress Filtering** nach BCP 38: Ein Provider verwirft Pakete, deren Absenderadresse nicht aus dem Netzbereich des Kunden stammen kann. Die Maßnahme ist seit 2000 bekannt, wird aber bis heute nicht flächendeckend umgesetzt, weshalb Spoofing weiterhin möglich ist.

**Klausurvorbereitung:** Den Merksatz sicher begründen können: Eine IP-Adresse ist eine Wegangabe, kein Identitätsnachweis. Als Konsequenz dürfen Zugriffsentscheidungen nicht allein auf Herkunftsadressen beruhen, sondern benötigen kryptografisch gesicherte Authentifizierung.
-->

---
# Wenn digitale Wegweiser falsch zeigen

- Netzbetreiber tauschen Informationen über erreichbare Ziele aus
- Fehlerhafte oder manipulierte Angaben können Verkehr umleiten
- Mögliche Folgen: **Ausfall, Verzögerung, Überwachung oder Manipulation**
- Unternehmen reduzieren das Risiko durch Verschlüsselung und belastbare Provider
- Fachbeispiel: **BGP-Hijacking**

<!-- _notes:
Das **Border Gateway Protocol (BGP)** ist das Wegweisersystem zwischen großen Netzbetreibern. Diese Betreiber heißen autonome Systeme (AS) und kündigen einander an, für welche IP-Bereiche sie zuständig sind. Beim **BGP-Hijacking** kündigt ein Netz fälschlich an, für fremde IP-Bereiche zuständig zu sein; da das Protokoll solche Ankündigungen traditionell ohne Prüfung übernimmt, kann der Datenverkehr fehlgeleitet oder unterbrochen werden, obwohl beim Kunden selbst nichts verändert wurde.

BGP beruht historisch auf gegenseitigem Vertrauen zwischen Betreibern und zeigt damit dasselbe Grundmuster wie ARP, nur auf globaler Ebene. Ein häufig zitiertes Beispiel ist der Vorfall von 2008, bei dem Pakistan Telecom durch eine fehlerhafte Ankündigung YouTube für rund zwei Stunden weltweit unerreichbar machte; die Ursache war eine nationale Sperrverfügung, deren Ankündigung versehentlich nach außen gelangte. 2018 wurde über einen BGP-Hijack der Amazon-DNS-Dienst umgeleitet, um Nutzer einer Kryptowährungsbörse auf eine gefälschte Seite zu lenken. Beide Fälle zeigen die Bandbreite: unbeabsichtigter Ausfall und gezielter Betrug.

Als Gegenmaßnahmen existieren RPKI (kryptografisch signierte Zuordnung von IP-Bereichen zu autonomen Systemen) und Routing-Monitoring. Diese Maßnahmen liegen beim Provider, nicht beim Kunden.

**Klausurvorbereitung:** BGP-Hijacking als Lieferanten- und Resilienzrisiko einordnen. Die kundenseitig möglichen Antworten sind Providerauswahl, Redundanz über mehrere Provider, Monitoring und konsequente Verschlüsselung, nicht die eigene BGP-Konfiguration.
-->

---
# Kleine Anfrage, große Wirkung

- Angreifer nutzen viele fremde Systeme als unbeabsichtigte Verstärker
- Kleine Anfragen erzeugen zahlreiche oder deutlich größere Antworten
- Alle Antworten werden an die gefälschte Adresse des Opfers geschickt
- Ergebnis: Dienste werden langsam oder fallen vollständig aus

> Das Angriffsziel ist **Verfügbarkeit**, nicht zwingend der Datendiebstahl.

<!-- _notes:
Das historische Beispiel heißt **Smurf-Angriff** und missbraucht das Diagnoseprotokoll ICMP: Der Angreifer sendet eine Ping-Anfrage mit der Absenderadresse des Opfers an die Broadcast-Adresse eines ganzen Netzes, sodass alle dortigen Geräte gleichzeitig dem Opfer antworten. Moderne Varianten nutzen DNS-, NTP- oder Memcached-Dienste, das Grundprinzip bleibt jedoch gleich: gefälschter Absender plus Verstärkung.

Zwei Kennzahlen beschreiben die Wirkung. Der **Amplification-Faktor** gibt an, um wie viel größer die Antwort als die Anfrage ist: bei DNS etwa 50-fach, bei NTP (Kommando monlist) bis 500-fach, bei Memcached in Extremfällen über 50.000-fach. Der zweite Effekt ist die **Reflexion**: Das Opfer sieht nicht den Angreifer, sondern Tausende legitimer Server als scheinbare Quelle, was die Filterung erschwert und die wahre Herkunft verschleiert. Der GitHub-Angriff von 2018 erreichte auf diesem Weg 1,35 Terabit pro Sekunde, ohne dass der Angreifer selbst nennenswerte Bandbreite besaß.

Voraussetzung für solche Angriffe sind erstens die Möglichkeit zum IP-Spoofing und zweitens offen erreichbare, antwortfreudige UDP-Dienste im Internet. Beide Voraussetzungen lassen sich abstellen: Ingress Filtering beim Provider und korrekt konfigurierte, nicht öffentlich antwortende Dienste.

**Klausurvorbereitung:** Reflexion und Amplifikation unterscheiden können (Verschleierung der Herkunft vs. Vergrößerung des Volumens) und erklären, warum fast immer UDP und nicht TCP genutzt wird. Angriffsziel ist die Verfügbarkeit, nicht der Datendiebstahl.
-->

---
# Datenwege kontrollieren

- **Firewalls** prüfen Verbindungen anhand festgelegter Regeln
- Nur notwendige Kommunikationswege werden freigegeben
- Verschlüsselung schützt Inhalte auf fremden Transportwegen
- Überwachung erkennt ungewöhnliche Ziele, Mengen oder Muster
- Redundanz hält wichtige Dienste trotz einzelner Ausfälle erreichbar

<!-- _notes:
Eine Firewall ist kein allgemeines Schutzschild, sondern setzt Regeln für erlaubte Kommunikation durch. **Access Control Lists (ACLs)** sind technische Regellisten auf Netzwerkkomponenten. Dahinter steht dasselbe Prinzip wie im IAM: nur notwendige Rechte und Wege freigeben.

Für die Einordnung hilft die Unterscheidung der Firewall-Generationen. Ein **Paketfilter** entscheidet allein anhand von Quell- und Zieladresse sowie Portnummer. Eine **Stateful Firewall** merkt sich zusätzlich bestehende Verbindungen und lässt nur Antworten auf selbst initiierte Verbindungen durch; das ist heute der Standard. Eine **Next Generation Firewall (NGFW)** erkennt darüber hinaus Anwendungen und Nutzeridentitäten unabhängig vom Port. Eine **Web Application Firewall (WAF)** arbeitet dagegen auf der Anwendungsschicht und prüft HTTP-Inhalte, etwa auf SQL-Injection.

Ein zentrales Entwurfsprinzip ist **Default Deny**: Alles, was nicht ausdrücklich erlaubt ist, wird verboten. Die Gegenvariante Default Allow gilt als unsicher, weil jede neue Bedrohung eine zusätzliche Regel erfordert. Wichtig ist zudem die Grenze der Maßnahme: Eine Firewall sieht in verschlüsselten Verbindungen nur Metadaten und kann legitime, aber missbrauchte Kommunikation kaum unterscheiden.

**Klausurvorbereitung:** Jede Maßnahme einem Schutzziel zuordnen können: Firewall und ACL steuern den Zugang, Verschlüsselung schützt die Vertraulichkeit und Integrität des Inhalts, Monitoring dient der Erkennung und Redundanz der Verfügbarkeit. Die Maßnahmen sind nicht austauschbar.
-->

---
<!-- _class: chapter -->
# Verfügbarkeit von Diensten

## Wenn legitime Kommunikation zur Last wird


<!-- _notes:
Dieses Kapitel behandelt die zuverlässige Übertragung und die Verfügbarkeit von Diensten. Technisch liegt der Schwerpunkt auf der OSI-Transportschicht (Schicht 4) mit TCP und UDP. Für die Zielgruppe ist vor allem wichtig, dass unterschiedliche Kommunikationsarten verschiedene Missbrauchsmöglichkeiten schaffen.

Die Transportschicht führt zwei Konzepte ein, die vorher nicht existierten. Erstens **Ports**: Eine IP-Adresse adressiert ein Gerät, die Portnummer adressiert den einzelnen Dienst auf diesem Gerät. Zweitens **Zustand**: TCP merkt sich den Stand jeder Verbindung, und genau dieses Merken verbraucht endliche Ressourcen, die angegriffen werden können.

Daraus ergeben sich zwei grundsätzlich verschiedene Angriffsarten auf die Verfügbarkeit. **Volumetrische Angriffe** überlasten die Bandbreite durch schiere Datenmenge. **Protokoll- und Ressourcenangriffe** wie die SYN-Flood benötigen kaum Bandbreite, erschöpfen aber Verbindungstabellen oder Rechenzeit. Die Unterscheidung ist praktisch relevant, weil die Gegenmaßnahmen verschieden sind.

**Klausurvorbereitung:** Bei jedem Überlastungsangriff benennen können, welche Ressource erschöpft wird: Bandbreite, Verbindungstabelle, Arbeitsspeicher, Rechenleistung oder Datenbankzugriffe. Daraus folgt direkt die passende Gegenmaßnahme.
-->
---
<!-- _class: normal -->
# Zwei Arten der Datenübertragung

<div class="columns">
<div>

### TCP
- Wie ein **Telefonat** mit Rückbestätigung
- Verbindung und Vollständigkeit werden geprüft
- Zuverlässig, aber mit zusätzlichem Aufwand
- Typisch für Webseiten und E-Mail

</div>
<div>

### UDP
- Wie eine **Postkarte** ohne Empfangsbestätigung
- Daten werden direkt versendet
- Schnell, Verluste werden eher akzeptiert
- Typisch für Streaming und Namensabfragen

</div>
</div>

<!-- _notes:
**TCP (Transmission Control Protocol)** baut eine bestätigte, zuverlässige Verbindung auf und garantiert Vollständigkeit sowie Reihenfolge der Daten; verlorene Pakete werden erneut gesendet. **UDP (User Datagram Protocol)** sendet einzelne Nachrichten ohne vorherigen Verbindungsaufbau, ohne Bestätigung und ohne Wiederholung.

Der sicherheitsrelevante Unterschied liegt im Zustand. TCP führt eine Tabelle aller offenen Verbindungen; diese Tabelle ist endlich und damit ein Angriffsziel (SYN-Flood). TCP erschwert zugleich IP-Spoofing, weil der Verbindungsaufbau eine Antwort an den angeblichen Absender erfordert. UDP kennt keinen Zustand, ist deshalb nicht über Verbindungstabellen angreifbar, erlaubt dafür aber einfaches Spoofing und eignet sich als Basis für Amplification-Angriffe.

Typische Zuordnung: TCP nutzen HTTP/HTTPS, E-Mail (SMTP, IMAP), SSH und Dateitransfer. UDP nutzen DNS, NTP, DHCP, VoIP und Videostreaming. Das moderne QUIC-Protokoll, auf dem HTTP/3 basiert, setzt allerdings auf UDP auf und baut Zuverlässigkeit und Verschlüsselung selbst darauf; die Analogien vereinfachen also bewusst.

**Klausurvorbereitung:** Die Begriffe verbindungsorientiert und verbindungslos sicher zuordnen und erklären können, warum die Zuverlässigkeit von TCP zugleich eine Angriffsfläche schafft. Das ist der häufigste Transfergedanke zu diesem Thema.
-->

---
# Beispiel: Unvollständige Anfragen blockieren

- Ein Dienst reserviert Ressourcen für neue Verbindungen
- Angreifer starten massenhaft Verbindungen, führen sie aber nie zu Ende
- Offene Anfragen belegen Speicher und Verarbeitungskapazität
- Legitime Kunden werden langsam oder abgewiesen
- Fachbeispiel: **SYN-Flood**

<!-- _notes:
TCP beginnt eine Verbindung mit dem sogenannten Drei-Wege-Handschlag: Der Client sendet SYN, der Server antwortet mit SYN-ACK und reserviert dabei bereits Ressourcen für die halboffene Verbindung, und der Client bestätigt mit ACK. Bei einer **SYN-Flood** sendet der Angreifer viele SYN-Pakete, häufig mit gefälschten Absenderadressen, und schickt das abschließende ACK nie.

Der Server hält dadurch zahlreiche halboffene Verbindungen in seiner Verbindungstabelle vor und wartet auf eine Bestätigung, die nie kommt, bis ein Zeitlimit abläuft. Ist die Tabelle voll, werden neue, legitime Verbindungsversuche abgewiesen. Der Angriff ist deshalb so wirkungsvoll, weil er asymmetrisch ist: Der Angreifer muss sich nichts merken, der Server dagegen schon. Mit wenigen Megabit pro Sekunde lassen sich so Server lahmlegen, die ein volumetrischer Angriff erst bei Gigabit-Raten beeindrucken würde.

Gegenmaßnahmen sind **SYN-Cookies** (der Server kodiert den Verbindungszustand kryptografisch in die Sequenznummer und muss deshalb vor dem ACK nichts speichern), kürzere Zeitlimits, Begrenzung der Verbindungsrate pro Quelle sowie vorgeschaltete DDoS-Schutzdienste.

**Klausurvorbereitung:** Die drei Schritte SYN, SYN-ACK und ACK in der richtigen Reihenfolge nennen und markieren können, an welcher Stelle der Angreifer abbricht. Restaurantanalogie: Viele falsche Reservierungen blockieren Tische für echte Gäste.
-->

---
# Aufklärung vor dem Angriff

- Angreifer prüfen systematisch, welche Dienste erreichbar sind
- Vergleichbar mit dem Testen von Türen und Fenstern vor einem Einbruch
- Die Suche ist automatisiert und findet dauerhaft im Internet statt
- Unnötige Dienste vergrößern die Angriffsfläche
- Fachbegriff: **Portscan**

<!-- _notes:
Ein **Port** ist eine nummerierte logische Anschlussstelle für einen Dienst. Die Ports 0 bis 1023 sind standardisierte Well-Known Ports, etwa 80 für HTTP, 443 für HTTPS, 22 für SSH, 53 für DNS und 3389 für Remote Desktop. Ein **Portscan** fragt automatisiert ab, welche dieser Anschlussstellen antworten.

Der Scan gehört zur Phase **Reconnaissance**, also Aufklärung, und ist der erste Schritt nahezu jeder Angriffskette. Aus den Antworten lässt sich oft nicht nur ableiten, welcher Dienst läuft, sondern über sogenannte Banner auch dessen Version, und daraus wiederum, welche bekannten Schwachstellen in Frage kommen. Werkzeuge wie Nmap automatisieren das, Suchmaschinen wie Shodan halten die Ergebnisse für das gesamte Internet dauerhaft vor. Ein aus dem Internet erreichbarer Dienst wird innerhalb von Minuten nach Inbetriebnahme erstmals gescannt; das ist kein gezielter Angriff, sondern Hintergrundrauschen.

Fachlich wichtig ist die Abgrenzung: Ein Scan ist Informationsbeschaffung und noch kein Einbruch. Er ist rechtlich dennoch nicht harmlos und ohne Beauftragung nicht zulässig. Die Verteidigung besteht weniger im Blockieren des Scans als in der Reduktion dessen, was er finden kann.

**Klausurvorbereitung:** Den Begriff **Attack Surface Reduction** erklären können: nicht benötigte Dienste abschalten, benötigte Dienste nicht öffentlich erreichbar machen, Versionsinformationen reduzieren und verbleibende Dienste überwachen und patchen.
-->

---
# Verfügbarkeit ist ein Geschäftsversprechen

- Online-Dienste müssen auch unter hoher Last erreichbar bleiben
- **DDoS-Angriffe** verteilen Überlastung auf viele Quellen
- Folgen: Umsatzverlust, Vertragsverletzungen, Supportaufwand, Vertrauensverlust
- Schutz: Kapazitätsreserven, Filterung, Notfallpläne und spezialisierte Anbieter

> **Beratungsfrage:** Welche Ausfallzeit kann das Geschäft wirklich verkraften?

<!-- _notes:
**DoS (Denial of Service)** bedeutet die Verweigerung eines Dienstes durch Überlastung; das vorangestellte zweite D in **DDoS (Distributed Denial of Service)** steht für verteilt: Viele Quellen, meist ein Botnetz aus übernommenen Rechnern und IoT-Geräten, überlasten gemeinsam ein Ziel. Die Verteilung macht die Abwehr schwer, weil sich die Quellen nicht einfach sperren lassen.

Drei Begriffe gehören zur geschäftlichen Bewertung. Das **Service Level Agreement (SLA)** legt vertraglich die zugesagte Verfügbarkeit fest; 99,9 Prozent erlauben rund 8,8 Stunden Ausfall pro Jahr, 99,99 Prozent nur noch etwa 53 Minuten. Die **Recovery Time Objective (RTO)** beschreibt, wie lange die Wiederherstellung maximal dauern darf. Das **Recovery Point Objective (RPO)** beschreibt, wie viel Datenverlust akzeptabel ist. Diese Größen müssen vor einem Vorfall festgelegt sein, nicht währenddessen.

Die technische Abwehr liegt häufig teilweise außerhalb des Unternehmens: Scrubbing Center filtern den Verkehr, Content Delivery Networks verteilen Last geografisch, Anycast streut den Angriff auf viele Standorte. Ergänzend sind Ratenbegrenzung, Autoskalierung und ein Notfallplan mit klaren Entscheidungsbefugnissen nötig.

**Klausurvorbereitung:** DoS und DDoS unterscheiden sowie RTO und RPO korrekt zuordnen können. Merkhilfe: Resilienz verbindet Technik, Vertrag und Notfallorganisation; ein Angriff auf die Verfügbarkeit ist nicht allein ein technisches Problem.
-->

---
<!-- _class: chapter -->
# Anwendungen und Sitzungen

## Wenn vertraute Dienste getäuscht werden


<!-- _notes:
Dieses Kapitel betrachtet die Ebene, die Nutzer unmittelbar wahrnehmen: Webseiten, E-Mail, Anmeldungen und laufende Sitzungen. Hier können technisch funktionierende Verbindungen trotzdem zu einem falschen Ziel führen oder von Unbefugten übernommen werden. Die OSI-Schichten 5 bis 7 unterscheiden Sitzung, Darstellung und Anwendung; in modernen Systemen und im TCP/IP-Modell werden sie gemeinsam betrachtet.

Der entscheidende Unterschied zu den vorherigen Kapiteln: Auf den unteren Schichten greift man Technik an, auf dieser Ebene häufig die Erwartung des Menschen. Eine Verbindung kann kryptografisch einwandfrei sein und trotzdem zum falschen Gegenüber führen. Das ist der Grund, warum Phishing und DNS-Manipulation nicht durch mehr Verschlüsselung allein zu lösen sind.

Außerdem wird hier der häufigste Denkfehler aufgelöst: Das Schloss-Symbol im Browser bestätigt nur, dass die Verbindung zu *dieser* Domain verschlüsselt ist. Es sagt nichts darüber aus, ob die Domain seriös ist. Kostenlose Zertifikate sind für jede Domain verfügbar, auch für betrügerische.

**Klausurvorbereitung:** Sicheren Transport und vertrauenswürdigen Inhalt sauber trennen können. Lernziel des Kapitels ist zudem, Umleitung (DNS-Spoofing), Sitzungsübernahme (Session Hijacking) und Überlastung (HTTP-Flood) als drei verschiedene Angriffsarten auf derselben Schicht zu unterscheiden.
-->
---
# Nach dem Login: die digitale Sitzung

- Nach erfolgreicher Anmeldung merkt sich ein Dienst den Nutzer
- Ein **Sitzungstoken** dient vorübergehend als Nachweis der Anmeldung
- Wer dieses Token stiehlt, kann möglicherweise ohne Passwort handeln
- Verschlüsselung schützt das Token auf dem Transportweg
- Kurze Gültigkeit begrenzt den möglichen Schaden

<!-- _notes:
Eine digitale Sitzung verbindet mehrere einzelne Anfragen mit einer bereits geprüften Identität. Notwendig ist das, weil HTTP **zustandslos** ist: Jede Anfrage steht für sich, der Server würde den Nutzer ohne zusätzlichen Mechanismus nach jedem Klick erneut nicht kennen. Webanwendungen verwenden dafür häufig ein Cookie mit einem zufällig erzeugten **Sitzungstoken**.

Dieses Token ist zeitweise so wertvoll wie die Anmeldung selbst und muss entsprechend geschützt werden. Drei Cookie-Attribute sind dafür prüfungsrelevant: **HttpOnly** verhindert den Zugriff per JavaScript und damit den Diebstahl über Cross-Site-Scripting, **Secure** erlaubt die Übertragung nur über HTTPS, und **SameSite** schränkt das Mitsenden bei Anfragen von fremden Seiten ein und schützt so gegen Cross-Site Request Forgery.

Ebenso wichtig ist der Lebenszyklus: ausreichend zufällige Token (nicht vorhersagbar), begrenzte Gültigkeitsdauer, Wechsel des Tokens nach dem Login (gegen Session Fixation) und serverseitige Ungültigkeitserklärung beim Logout. Ein reines Entfernen im Browser genügt nicht, wenn der Server das Token weiterhin akzeptiert.

**Klausurvorbereitung:** Erklären können, warum Sitzungen überhaupt existieren (Zustandslosigkeit von HTTP) und drei konkrete Schutzmaßnahmen für Sitzungstoken nennen. TLS schützt den Transport, rettet aber kein bereits auf dem Endgerät gestohlenes Token.
-->

---
# Beispiel: Eine angemeldete Sitzung übernehmen

- Angreifer erbeutet den temporären Nachweis einer Anmeldung
- Der Dienst hält den Angreifer anschließend für den legitimen Nutzer
- Eine starke Anmeldung allein verhindert diesen Missbrauch nicht
- Schutz: verschlüsselte Verbindung, sichere Endgeräte, kurze Sitzungen
- Fachbegriff: **Session Hijacking**

<!-- _notes:
**Session Hijacking** bedeutet die Übernahme einer bereits authentifizierten Sitzung, häufig durch ein gestohlenes Cookie. Typische Diebstahlwege sind Cross-Site-Scripting in der Webanwendung, Schadsoftware auf dem Endgerät (sogenannte Infostealer), das Mitlesen unverschlüsselter Verbindungen sowie der Zugriff auf ein unbeaufsichtigtes, entsperrtes Gerät.

Besonders prüfungsrelevant ist die Einsicht, dass **Mehrfaktor-Authentifizierung diesen Angriff nicht verhindert**. MFA schützt den Anmeldevorgang; wird das Token erst danach gestohlen, ist die Prüfung bereits abgeschlossen und der Angreifer überspringt sie schlicht. Genau dieses Vorgehen hat sich in den letzten Jahren stark verbreitet, etwa über Phishing-Seiten, die eine echte Anmeldung in Echtzeit weiterreichen und das resultierende Token abgreifen (Adversary-in-the-Middle-Phishing).

Wirksam sind deshalb ergänzende Maßnahmen: Bindung des Tokens an Gerät oder Client-Zertifikat, Erkennung ungewöhnlicher Standort- oder Gerätewechsel während einer Sitzung, kurze Gültigkeitsdauern sowie **Step-up-Authentifizierung**, also eine erneute Identitätsprüfung vor besonders kritischen Aktionen wie Änderung der Bankverbindung oder Freigabe einer Zahlung.

**Klausurvorbereitung:** Begründen können, warum eine starke Anmeldung allein nicht genügt, und die drei Ebenen benennen, die zusammenwirken müssen: Identitätsschutz, Endgerätesicherheit und Sitzungsmanagement.
-->

---
# Die Anwendung schafft Vertrauen

- Nutzer sehen Namen, Inhalte und Marken – nicht die Netzwerkprotokolle dahinter
- Vertraute Oberflächen können Sicherheit vermitteln, aber auch gefälscht werden
- Anwendungen verarbeiten wertvolle Daten und geschäftliche Transaktionen
- Technik, Prozesse und Aufmerksamkeit der Nutzer müssen zusammenspielen

> Eine funktionierende Verbindung garantiert noch kein vertrauenswürdiges Gegenüber.

<!-- _notes:
Die OSI-Anwendungsschicht umfasst Protokolle wie **HTTP** für Webseiten, **DNS** für Namensauflösung und **SMTP** für E-Mail. Hier treffen technische Kommunikation und menschliche Wahrnehmung aufeinander, weshalb Angreifer sowohl Softwarefehler als auch überzeugende Täuschung nutzen.

Viele dieser Protokolle stammen aus einer Zeit ohne Sicherheitsanforderungen und wurden nachträglich abgesichert: HTTP durch HTTPS, SMTP durch STARTTLS sowie die Absenderprüfverfahren SPF, DKIM und DMARC, DNS durch DNSSEC und DNS over HTTPS. Diese Nachrüstungen sind jeweils optional, was erklärt, warum Fälschungen weiterhin funktionieren, wenn eine Seite sie nicht nutzt.

Typische Täuschungsmuster auf dieser Ebene sind ähnlich aussehende Domainnamen (Typosquatting wie "rnicrosoft" statt "microsoft"), internationalisierte Zeichen, die lateinischen Buchstaben gleichen (Homoglyphen), gefälschte Absenderadressen in E-Mails und nachgebaute Anmeldeseiten. In allen Fällen ist die Technik korrekt, nur das Gegenüber ist es nicht.

**Klausurvorbereitung:** Den Satz "Eine funktionierende, verschlüsselte Verbindung garantiert kein vertrauenswürdiges Gegenüber" mit einem Beispiel belegen können. Auch eine betrügerische Domain kann ein gültiges TLS-Zertifikat besitzen.
-->

---
# Beispiel: Der richtige Name, das falsche Ziel

- Das **Domain Name System (DNS)** übersetzt Namen in technische Zieladressen
- Manipulierte Antworten können Nutzer zu einem falschen Dienst leiten
- Der eingegebene Name kann dabei korrekt erscheinen
- Mögliche Folgen: Zugangsdaten- oder Zahlungsdatendiebstahl
- Fachbegriffe: **DNS-Spoofing** und **Cache-Poisoning**

<!-- _notes:
DNS funktioniert wie ein Adressverzeichnis: Es ordnet einem lesbaren Namen eine IP-Adresse zu. Die Auflösung läuft hierarchisch über Root-, Top-Level-Domain- und autoritative Nameserver; dazwischen speichert ein Resolver die Antworten zwischen, um Anfragen zu beschleunigen. Genau dieser Zwischenspeicher ist das Angriffsziel.

Beim **DNS-Spoofing** erhält ein Nutzer eine gefälschte Antwort, etwa von einem Angreifer im selben Netz, der schneller antwortet als der echte Server. Beim **Cache-Poisoning** wird eine solche gefälschte Zuordnung im Zwischenspeicher eines Resolvers abgelegt und betrifft dadurch alle Nutzer, die diesen Resolver verwenden, oft über Stunden hinweg. Möglich ist das, weil klassisches DNS über UDP läuft, unverschlüsselt ist und Antworten nicht signiert sind, also dasselbe Vertrauensproblem wie ARP aufweist.

Schutzmechanismen: **DNSSEC** signiert DNS-Antworten kryptografisch und macht Fälschungen erkennbar. **DNS over HTTPS (DoH)** und **DNS over TLS (DoT)** verschlüsseln den Transport zum Resolver, schützen aber nicht vor einem manipulierten Resolver selbst. Ergänzend prüft TLS die Identität des Zielservers: Landet der Nutzer auf einem falschen Server, kann dieser kein gültiges Zertifikat für die echte Domain vorweisen, und der Browser warnt.

**Klausurvorbereitung:** Den Unterschied zwischen DNS-Spoofing (ein Opfer) und Cache-Poisoning (viele Opfer über den Resolver) erklären können. Wichtig ist zudem: Der Nutzer macht nichts falsch, er gibt die richtige Adresse ein; deshalb hilft Awareness-Schulung hier weniger als bei Phishing, technische Kontrollen und klare Meldewege bei Zertifikatswarnungen dagegen schon.
-->

---
# Ein Muster, verschiedene Angriffswege

- Angreifer positioniert sich unbemerkt zwischen zwei Kommunikationspartnern
- Er kann Daten mitlesen, verändern oder an ein falsches Ziel leiten
- Der Einstieg ist über WLAN, lokales Netz oder Namensauflösung möglich
- **Ende-zu-Ende-Verschlüsselung** schützt den Inhalt über unsichere Wege

> Fachbegriff: **Man-in-the-Middle (MITM)**

<!-- _notes:
**Man-in-the-Middle (MITM)** beschreibt eine Position des Angreifers und keine einzelne Technik. Diese Folie ist deshalb die Klammer des bisherigen Stoffs: ARP-Spoofing (Zugang), ein bösartiger WLAN-Zugangspunkt (Zugang), BGP-Hijacking (Transport) oder manipuliertes DNS (Anwendung) können alle zur selben Position führen.

In der aktuellen Fachliteratur wird zunehmend der neutrale Begriff **Adversary-in-the-Middle (AiTM)** verwendet. Zu unterscheiden sind zwei Ausprägungen: Beim **passiven** Mitlesen beobachtet der Angreifer nur, was die Vertraulichkeit verletzt; beim **aktiven** Eingriff verändert er Inhalte, was zusätzlich die Integrität verletzt.

Korrekt geprüfte TLS-Verbindungen schützen Vertraulichkeit und Integrität auch dann, wenn jemand den Datenverkehr transportiert, denn der Angreifer besitzt keinen gültigen privaten Schlüssel für die Zieldomain. Der Angriff verlagert sich dadurch auf das Umgehen dieser Prüfung: Zertifikatswarnungen wegklicken lassen, ein eigenes Wurzelzertifikat auf dem Gerät installieren oder den Nutzer auf eine ähnlich lautende Domain locken, für die ein gültiges Zertifikat existiert. Deshalb dürfen Zertifikatswarnungen nicht routinemäßig ignoriert werden.

**Klausurvorbereitung:** MITM als Position und nicht als Technik beschreiben, mindestens drei Wege zu dieser Position nennen und erklären können, warum TLS wirksam ist, solange die Zertifikatsprüfung nicht umgangen wird.
-->

---
# Wenn normale Anfragen zum Angriff werden

- Angreifer senden massenhaft scheinbar legitime Anfragen an eine Anwendung
- Einzelne Anfragen wirken unauffällig, ihre Menge überlastet den Dienst
- Botnetze verteilen den Verkehr auf viele Geräte und Regionen
- Schutz erfordert Erkennung, Skalierung und klare Prioritäten für kritische Dienste
- Fachbeispiel: **HTTP-Flood**

<!-- _notes:
Bei einer **HTTP-Flood** rufen viele Quellen wiederholt aufwendige Funktionen einer Webanwendung auf, etwa eine Volltextsuche, einen Produktfilter oder einen Login mit Passwortprüfung. Jede einzelne Anfrage ist formal korrekt, weshalb einfache Netzwerkfilter nicht ausreichen.

Der Unterschied zu volumetrischen Angriffen ist entscheidend: Hier zählt nicht die Bandbreite, sondern die Asymmetrie des Aufwands. Eine Anfrage von wenigen hundert Byte kann serverseitig mehrere Datenbankabfragen auslösen. Deshalb genügen vergleichsweise wenige Anfragen pro Sekunde, um eine Anwendung lahmzulegen, während die Netzwerkauslastung unauffällig bleibt. Man spricht von einem Layer-7-Angriff, im Gegensatz zu Layer-3/4-Angriffen wie SYN-Flood oder Amplification.

Botnetze wie **Mirai** liefern die benötigte Verteilung: Mirai übernahm 2016 hunderttausende IoT-Geräte wie Kameras und Router über werkseitige Standardpasswörter und legte unter anderem den DNS-Dienstleister Dyn lahm, wodurch zahlreiche bekannte Webdienste in Teilen der USA nicht mehr erreichbar waren. Das ist zugleich die Brücke zur IoT-Sicherheit.

Schutzmaßnahmen sind **Web Application Firewalls**, Verhaltensanalyse und Bot-Erkennung, Ratenbegrenzung pro Nutzer oder Sitzung, Caching, Lastverteilung sowie spezialisierte DDoS-Dienste.

**Klausurvorbereitung:** Layer-7-Angriffe von volumetrischen Angriffen abgrenzen und begründen können, warum eine klassische Firewall hier wenig hilft: Die Anfragen sind technisch legitim, nur ihre Menge und Absicht sind es nicht.
-->

---
<!-- _class: chapter -->
# Verteidigung im Überblick

## Mehrere Schutzlinien gleichzeitig


<!-- _notes:
Dieses Abschlusskapitel führt die einzelnen Risiken zu einem Schutzkonzept zusammen. Keine Maßnahme deckt Zugang, Transport, Anwendung und Wiederherstellung gleichzeitig ab. Die Studierenden sollen Schutzmaßnahmen deshalb nach ihrer Wirkung einordnen und ihr Zusammenspiel erklären können.

Für die Systematik hilft eine zweite Einteilung neben der Wirkung: Kontrollen lassen sich auch nach ihrer Art unterscheiden in **technisch** (Firewall, Verschlüsselung, Protokollierung), **organisatorisch** (Richtlinien, Prozesse, Verträge, Verantwortlichkeiten) und **personell** (Schulung, Sensibilisierung). Eine rein technische Absicherung bleibt unvollständig, weil fast jede technische Kontrolle einen Prozess zur Auswertung und Pflege benötigt.

**Klausurvorbereitung:** Bei der Frage nach einem Schutzkonzept nie nur Produkte aufzählen, sondern zwei Dimensionen kombinieren: Wirkung (vorbeugen, begrenzen, erkennen, reagieren, lernen) und Art (technisch, organisatorisch, personell). Diese Struktur liefert auch bei unbekannten Szenarien eine vollständige Antwort.
-->
---
# Defense in Depth

- **Defense in Depth** kombiniert mehrere unabhängige Schutzmaßnahmen
- Vorbeugen, Erkennen, Begrenzen und Wiederherstellen ergänzen sich
- Versagt eine Maßnahme, verhindert die nächste den Totalschaden
- Menschen, Prozesse, Technik und Dienstleister tragen gemeinsam bei

> Nicht die Anzahl der Produkte zählt, sondern das Zusammenspiel der Kontrollen.

<!-- _notes:
**Defense in Depth** ist das Leitprinzip der gesamten Vorlesung. Eine Firewall verhindert weder den Diebstahl eines Sitzungstokens auf einem Endgerät noch ersetzt Verschlüsselung einen Notfallplan. Mehrere Kontrollen sollten unterschiedliche Fehler abdecken und möglichst unabhängig voneinander wirken.

Der Begriff stammt ursprünglich aus der Militärstrategie und bezeichnet dort gestaffelte Verteidigungslinien, die einen Angreifer verlangsamen, statt ihn an einer einzigen Linie aufhalten zu wollen. Übertragen auf IT-Sicherheit bedeutet das: Der Einstieg wird als möglich unterstellt, und der Wert der Verteidigung liegt in der gewonnenen Zeit zur Erkennung und Reaktion.

Entscheidend für die Wirksamkeit ist die **Unabhängigkeit** der Kontrollen. Drei Maßnahmen, die alle am selben zentralen Verzeichnisdienst hängen, fallen bei dessen Kompromittierung gemeinsam aus; man spricht von einem Single Point of Failure oder von korrelierten Kontrollen. Eine verwandte Denkfigur ist das **Swiss-Cheese-Modell**: Jede Schicht hat Löcher, aber ein Vorfall entsteht erst, wenn die Löcher mehrerer Schichten zufällig übereinanderliegen.

**Klausurvorbereitung:** Defense in Depth definieren, von bloßer Produktvielfalt abgrenzen und an einem Beispiel zeigen können, wie mehrere Kontrollen nacheinander greifen. Merksatz: Nicht die Anzahl der Produkte zählt, sondern das Zusammenspiel unabhängiger Kontrollen.
-->

---
# Defense in Depth als Diagramm

![w:1200 center](img/defense-in-depth.svg)

<!-- _notes:
Das Diagramm zeigt gestaffelte Schutzebenen vom Perimeter bis zu den Daten. Dieses Bild ist nützlich, darf aber nicht als starre Burg verstanden werden, weil Cloud und Homeoffice den klassischen Rand auflösen. Entscheidend bleibt die Idee, dass ein Angreifer nach dem Überwinden einer Kontrolle auf weitere Hürden trifft.

**Bildbeschreibung:** Die Grafik besteht aus vier ineinander verschachtelten Rechtecken, die von außen nach innen immer kleiner werden. Das äußerste, grau hinterlegte Rechteck trägt die Beschriftung "Perimeter (Firewall)" und steht für die Außengrenze des Unternehmensnetzes. Darin liegt ein orange hinterlegtes Rechteck mit der Beschriftung "Netzwerk (Segmentierung, VLANs)"; es steht für die interne Aufteilung des Netzes in getrennte Zonen. Im nächsten, blau hinterlegten Rechteck steht "Host (Endgeräteschutz)", also Maßnahmen auf dem einzelnen Rechner oder Server wie Virenschutz, Festplattenverschlüsselung und Patchstand. Das innerste, grün hinterlegte Rechteck trägt die Beschriftung "Daten" mit dem Zusatz "(Verschlüsselung, TLS)" und stellt das eigentliche Schutzgut dar. Die Verschachtelung verdeutlicht, dass ein Angreifer von außen nacheinander vier unabhängige Ebenen überwinden muss, um an die Daten zu gelangen, und dass die innerste Ebene auch dann noch schützt, wenn alle äußeren bereits durchbrochen sind.

**Klausurvorbereitung:** Zu jeder der vier Ebenen eine konkrete Maßnahme und ihr verbleibendes Restrisiko nennen können. Beispiel: Die Firewall schützt nicht vor einem Angriff, der über eine erlaubte HTTPS-Verbindung hereinkommt. Wichtig ist zudem der kritische Hinweis, dass das Burgmodell die moderne Realität mit Cloud und mobilen Geräten nur noch eingeschränkt abbildet; Datenverschlüsselung, Zugriffsprüfung und Überwachung müssen auch innerhalb des Netzes wirken.
-->

---
# Schutzmaßnahmen nach ihrer Wirkung

| Ziel | Beispiele | Nutzen |
|---|---|---|
| **Vorbeugen** | sichere Konfiguration, Firewall, Verschlüsselung | Eintritt erschweren |
| **Begrenzen** | Segmentierung, minimale Rechte | Ausbreitung stoppen |
| **Erkennen** | Protokollierung, Netzwerküberwachung | Vorfälle sichtbar machen |
| **Reagieren** | Notfallplan, DDoS-Dienstleister | Ausfallzeit verkürzen |
| **Lernen** | Tests, Übungen, Verbesserungsprozess | Wiederholung vermeiden |

<!-- _notes:
Die Einteilung nach Wirkung verhindert eine reine Produktliste und entspricht fachlich den fünf Funktionen des NIST Cybersecurity Framework (Identify, Protect, Detect, Respond, Recover). Ein ausgewogenes Konzept deckt alle fünf Ziele ab und benennt für jedes einen Verantwortlichen.

Zur Einordnung der genannten Technologien: **Intrusion Detection Systems (IDS)** erkennen verdächtigen Verkehr und melden ihn, **Intrusion Prevention Systems (IPS)** können ihn zusätzlich blockieren; der Unterschied liegt also darin, ob das System nur beobachtet oder aktiv eingreift. Beide arbeiten entweder signaturbasiert (bekannte Muster, wenig Fehlalarme, blind für Neues) oder anomaliebasiert (Abweichung vom Normalzustand, erkennt Unbekanntes, erzeugt mehr Fehlalarme). Ein **SIEM (Security Information and Event Management)** sammelt und korreliert Protokolldaten aus vielen Quellen und gehört ebenfalls zur Erkennung.

Wichtig ist die Einsicht, dass Erkennung ohne Reaktionsprozess wertlos ist: Ein Alarm, den niemand bearbeitet, erhöht die Sicherheit nicht. Deshalb gehört zu jeder detektiven Maßnahme zwingend eine organisatorische Zuständigkeit mit definierten Reaktionszeiten.

**Klausurvorbereitung:** IDS und IPS sicher unterscheiden sowie jede genannte Maßnahme der richtigen Wirkungskategorie zuordnen können. Die Tabelle eignet sich zugleich als Lückenanalyse: Fehlt eine ganze Zeile, ist das Konzept unvollständig.
-->

---
# Netzwerksegmentierung & Zero Trust

- **Segmentierung** trennt Bereiche mit unterschiedlichen Aufgaben und Risiken
- Beispiel: Gäste, Büroarbeitsplätze, Produktion und kritische Server
- **Zero Trust** prüft Zugriffe anhand von Identität, Gerät und Kontext
- Gemeinsam reduzieren beide die unkontrollierte Ausbreitung eines Angriffs

> **Beratungsfrage:** Was kann ein kompromittierter Arbeitsplatz im internen Netz erreichen?

<!-- _notes:
**Segmentierung** teilt ein Netzwerk in getrennte Zonen und kontrolliert die Kommunikation dazwischen. VLANs und Firewallregeln sind mögliche technische Mittel, die fachliche Grundlage ist jedoch die Trennung nach Schutzbedarf und Geschäftsaufgabe. Die konsequenteste Form ist die **Mikrosegmentierung**, bei der die Kommunikation bis auf Ebene einzelner Anwendungen oder Arbeitslasten geregelt wird.

Der Nutzen lässt sich präzise benennen: Segmentierung verhindert keinen Einbruch, sondern begrenzt die **Lateral Movement** genannte Ausbreitung nach einem Einbruch. Die Brandschutztüren-Analogie passt genau: Sie verhindern kein Feuer, aber den Flächenbrand. Besonders relevant ist das bei Ransomware, deren Schaden fast vollständig davon abhängt, wie viele Systeme von einem kompromittierten Arbeitsplatz aus erreichbar sind. Ein typisches Pflichtbeispiel ist die Trennung von Büro-IT und Produktionsnetz (OT), außerdem Gast-WLAN, Geräteverwaltung und Finanzsysteme.

**Zero Trust** ergänzt dies durch eine laufende Prüfung von Identität, Gerät, Berechtigung und Kontext. Die Konzepte sind verwandt, aber nicht identisch: Segmentierung begrenzt **Wege** auf Netzebene, Zero Trust bewertet **Zugriffe** auf Ressourcenebene. Zero Trust ohne Segmentierung bleibt lückenhaft, Segmentierung ohne Identitätsprüfung ebenfalls.

**Klausurvorbereitung:** Begründen können, warum Segmentierung die wirksamste Einzelmaßnahme gegen großflächige Schadensausbreitung ist, und Segmentierung sauber von Zero Trust abgrenzen.
-->

---
# Zusammenfassung

| Bereich | Kernrisiko | Leitfrage |
|---|---|---|
| **Zugang** | fremde oder kompromittierte Geräte | Wer oder was darf sich verbinden? |
| **Transport** | Umleitung, Mitlesen, Überlastung | Wie bleiben Daten und Dienste geschützt? |
| **Anwendung** | Täuschung und Sitzungsübernahme | Ist das Gegenüber wirklich vertrauenswürdig? |
| **Organisation** | unklare Reaktion und Abhängigkeiten | Wer handelt bei einem Vorfall? |

> **Merksatz:** Netzwerksicherheit schützt Geschäftskontinuität, Daten und Vertrauen.

<!-- _notes:
Diese Tabelle ersetzt das Auswendiglernen einzelner Angriffsbezeichnungen durch vier dauerhaft nutzbare Leitfragen. Zugang, Transport und Anwendung entsprechen der vereinfachten Landkarte vom Beginn. Die Organisation kommt hinzu, weil technische Kontrollen ohne Verantwortlichkeiten, Verträge und Notfallprozesse unvollständig bleiben.

Als Wiederholung die Zuordnung aller behandelten Angriffe: **Zugang** umfasst MAC-Spoofing und ARP-Spoofing sowie unbefugten physischen Netzzugang. **Transport** umfasst IP-Spoofing, BGP-Hijacking, Amplification- bzw. Reflexionsangriffe, SYN-Flood und Portscans. **Anwendung** umfasst DNS-Spoofing und Cache-Poisoning, Session Hijacking und HTTP-Flood. **Man-in-the-Middle** ist die Position, die aus mehreren dieser Angriffe hervorgehen kann. Die zugehörigen Kernmaßnahmen sind 802.1X und physische Sicherheit, Verschlüsselung und Firewall-Regeln, sichere Sitzungsverwaltung und Zertifikatsprüfung sowie übergreifend Segmentierung, Monitoring und Notfallplanung.

Zur CIA-Triade: Mitlesen verletzt die Vertraulichkeit, Umleitung und Manipulation die Integrität, Überlastung die Verfügbarkeit. Session Hijacking verletzt zusätzlich die Authentizität.

**Klausurvorbereitung:** Zu jeder Tabellenzeile ein Beispiel, eine Geschäftsauswirkung und eine passende Maßnahme erklären können. Die zentrale Aussage der Vorlesung lautet: Netzwerksicherheit ist Risikomanagement und nicht nur Netzwerkbetrieb.
-->

---
# Diskussionsfragen

- Welcher netzwerkbedingte Ausfall hätte bei eurem Partnerunternehmen die größten Folgen?
- Mit welchen drei Fragen würdet ihr ein erstes Kundengespräch beginnen?
- Wo könnte sich ein Angreifer nach einem erfolgreichen Einstieg weiter ausbreiten?
- Wie würdet ihr den Nutzen von Segmentierung ohne Fachbegriffe erklären?
- Welche Schutzmaßnahme benötigt zwingend einen organisatorischen Prozess?

<!-- _notes:
Die Fragen eignen sich für eine Abschlussdiskussion aus Beratungs- und Vertriebsperspektive. Gute Antworten verbinden ein konkretes Geschäftsszenario mit Schutzzielen und vermeiden vorschnelle Produktnennungen.

Hinweise zu den einzelnen Fragen: Bei Frage 1 sollte zwischen tolerierbarer und existenzbedrohender Ausfallzeit unterschieden werden; Produktion, Logistik und Online-Vertrieb reagieren sehr unterschiedlich. Bei Frage 2 sind kritische Dienste, tolerierbare Ausfallzeit, externe Abhängigkeiten und vorhandene Notfallwege sinnvolle Themen. Frage 3 zielt auf Lateral Movement und damit auf Segmentierung und minimale Rechte. Frage 4 lässt sich als Brandschutztüren-Prinzip beantworten: Ein Vorfall bleibt auf einen Bereich begrenzt. Frage 5 verdeutlicht, dass etwa Überwachung, Protokollierung oder ein DDoS-Schutzvertrag ohne geregelte Alarmbearbeitung und Zuständigkeit wenig Nutzen schaffen.

**Klausurvorbereitung:** Diese fünf Fragen eignen sich als Selbsttest. Wer sie frei und mit Beispielen beantworten kann, beherrscht den Stoff auf Transferniveau. Empfehlenswert ist, die Antworten laut zu formulieren, da Prüfungsfragen häufig genau in dieser Form gestellt werden: Szenario, Risiko, Maßnahme, Begründung.
-->
