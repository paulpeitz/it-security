---
marp: true
theme: custom
paginate: false
html: true
footer: ![w:280](img/dhbw-ka.svg)
title: IoT-Sicherheit
---

<!-- _class: title -->
# IoT-Sicherheit

<br><br><br>

## Wenn Dinge zur Bedrohung werden


<!-- _notes:
Dieser Abschnitt behandelt Wenn Dinge zur Bedrohung werden. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
<!-- _class: biglist -->
# Agenda

- **Industrieanlagen im Visier** – Stuxnet und die Besonderheiten von OT
- **Das Smart Home** – Mirai-Botnet und Consumer-IoT-Risiken
- **OWASP IoT Top 10** – die wichtigsten Schwachstellenkategorien

<!-- _notes:
Kurze, kompakte Einheit zum Internet of Things (IoT) – die inhaltliche Fortsetzung der Netzwerksicherheits-Vorlesung, diesmal mit Fokus auf die Geräte selbst statt auf das Netzwerk drumherum. Danach wechseln wir in den Consumer-Bereich mit dem Smart Home und schauen uns das Mirai-Botnet, das schon aus der letzten Vorlesung bekannt ist, diesmal aus der Geräte-Perspektive genauer an. Zum Schluss ordnen wir alles mit den OWASP IoT Top 10 strukturiert ein.
-->

---
<!-- _class: chapter -->
# Industrieanlagen im Visier

## Wenn ein Cyberangriff Maschinen zerstört


<!-- _notes:
Dieser Abschnitt behandelt Wenn ein Cyberangriff Maschinen zerstört. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Fallstudie: Stuxnet (2010)

- **Was geschah?**
  - Hochkomplexe Schadsoftware infizierte die Steuerungssysteme der iranischen Urananreicherungsanlage Natanz
  - Manipulierte gezielt die Drehzahl der Zentrifugen – mal zu schnell, mal zu langsam – und zeigte den Betreibern gleichzeitig **normale Messwerte** an
  - Ergebnis: rund 1.000 Zentrifugen physisch zerstört, ohne dass die Ursache zunächst erkennbar war

<!-- _notes:
Stuxnet gilt als erste bekannte Cyberwaffe, die gezielt physische Zerstörung verursacht hat. Besonders perfide: Die Schadsoftware hat den Bedienern über gefälschte Sensorwerte vorgegaukelt, alles laufe normal – ein Angriff nicht nur auf die Anlage, sondern auch auf die Wahrnehmung der Betreiber. Kurz erwähnen, dass die Urheberschaft bis heute nicht offiziell bestätigt ist, aber breit ein staatlicher Akteur vermutet wird. Der Fall verbindet Schadsoftware mit Manipulation physischer Steuerungen; verfälschte Messwerte erschweren die Erkennung.
-->

---
# Wie kam die Schadsoftware in die Anlage?

- Die Anlage war **air-gapped** – keine direkte Verbindung zum Internet
- Verbreitung über infizierte **USB-Sticks**, vermutlich über Zulieferer oder Mitarbeitende eingeschleust
- Nutzte **vier Zero-Day-Schwachstellen** in Windows gleichzeitig – ein Aufwand, der auf staatliche Ressourcen hindeutet
- Zielte gezielt auf **SPS (speicherprogrammierbare Steuerungen)** von Siemens einer bestimmten Konfiguration

> **Merksatz:** Ein Air Gap schützt nicht vor USB-Sticks und Menschen.

> **Zero-Day:** Sicherheitslücke, für die noch kein Patch verfügbar ist. **SPS** ist die deutsche Bezeichnung für **PLC** (Programmable Logic Controller).

<!-- _notes:
Wichtige Lehre: „Air Gap" wird oft als vermeintlich perfekter Schutz verkauft, aber Stuxnet zeigt, dass physische Trennung vom Internet nicht bedeutet, dass ein System unerreichbar ist. Der Angriffsweg über USB-Sticks ist bis heute eine der häufigsten Methoden, um air-gapped Systeme zu kompromittieren. Der Aufwand mit vier gleichzeitig genutzten Zero-Days war zum Zeitpunkt der Entdeckung beispiellos und ist bis heute selten.
-->

---
# Was ist an Industrieanlagen besonders?

- **Operational Technology (OT)**: Hard- und Software, die physische Prozesse steuert und überwacht (Maschinen, Ventile, Motoren)
  - Abgrenzung zur klassischen **Information Technology (IT)**, die primär Daten verarbeitet

- Typische OT-Begriffe:
  - **ICS (Industrial Control Systems)**: Sammelbegriff für Steuerungssysteme in der Industrie
  - **SCADA (Supervisory Control and Data Acquisition)**: Systeme zur Fernüberwachung und -steuerung
  - **SPS / PLC (Programmable Logic Controller)**: steuert einzelne Maschinen oder Anlagenteile direkt

> **OT (Operational Technology)** steuert physische Prozesse; **ICS** bezeichnet industrielle Steuerungssysteme, **SCADA** übergeordnete Überwachung und **SPS/PLC** die Steuerung einzelner Maschinen.

<!-- _notes:
Diese Begriffe fallen in der Praxis häufig, daher hier kurz sauber einführen. Wichtig ist die Abgrenzung IT vs. OT: IT verarbeitet und transportiert Daten, OT steuert reale, physische Prozesse. Genau diese physische Komponente macht OT-Sicherheit so besonders – ein Fehler wirkt sich nicht nur auf Bits und Bytes aus, sondern auf reale Maschinen, wie Stuxnet gerade gezeigt hat.
-->

---
<!-- _class: normal -->
# IT und OT ticken unterschiedlich

<div class="columns">
<div>

### IT-Systeme
- Priorität: **Vertraulichkeit** zuerst
- Kurze Update-Zyklen (Tage/Wochen)
- Lebensdauer: 3–5 Jahre
- Ausfall = ärgerlich, aber selten gefährlich

</div>
<div>

### OT / ICS
- Priorität: **Verfügbarkeit** zuerst
- Patches oft erst bei geplantem Stillstand
- Lebensdauer: 15–20+ Jahre
- Ausfall = Produktionsstopp oder **physischer Schaden**

</div>
</div>

> **Abwägung:** Ein sofortiger Neustart für einen Patch kann eine laufende Produktionsanlage stoppen; ein Aufschub lässt die Schwachstelle länger offen.

<!-- _notes:
Security-Konzepte aus der klassischen IT lassen sich nicht 1:1 auf OT übertragen. Eine Anlage einfach neu zu starten, um einen Patch einzuspielen, ist in der Fertigung oft undenkbar, weil es Produktionsausfälle in Millionenhöhe verursachen kann. Deshalb laufen in der Industrie noch Systeme mit jahrzehntealten Betriebssystemen, die in der klassischen IT längst ausgemustert wären.
-->

---
# Die CIA-Reihenfolge kehrt sich um

![w:1240 center](img/it-vs-ot-prioritaet.svg)

<!-- _notes:
Aus der ersten Vorlesung kennen wir die CIA-Triade: Vertraulichkeit, Integrität, Verfügbarkeit. In der klassischen IT wird sie meist in dieser Reihenfolge priorisiert. In der OT-Welt kehrt sich das faktisch um: Verfügbarkeit steht an erster Stelle, weil ein Stillstand der Anlage sofort teuer oder gefährlich wird. Das beeinflusst ganz praktische Entscheidungen, z. B. ob ein verdächtiges System sofort vom Netz genommen wird (typischer IT-Reflex) oder erst nach Schichtende (OT-Realität).
-->

---
# Weitere Besonderheiten von OT-Umgebungen

- **Fernwartungszugänge**: Hersteller warten Anlagen zunehmend per Fernzugriff – zusätzliche Angriffsfläche
- **Industrie 4.0 / IIoT**: bisher isolierte Anlagen werden zur Vernetzung mit der Büro-IT und dem Internet verbunden
- Ein erfolgreicher Angriff wirkt sich **physisch** aus: Maschinenschäden, Produktionsausfälle, im Extremfall Gefahr für Menschen

> **Merksatz:** In der IT verliert man Daten – in der OT können Maschinen explodieren.

<!-- _notes:
Die zunehmende Vernetzung von OT-Umgebungen (Stichwort Industrie 4.0) bedeutet, dass die einst klare Trennung zwischen isolierter Fabrikhalle und offenem Internet verschwimmt – genau wie beim Smart Home, das jetzt folgt, nur mit anderen Konsequenzen. Der Merksatz überspitzt bewusst, um den Unterschied zwischen digitalem und physischem Schaden greifbar zu machen.
-->

---
<!-- _class: chapter -->
# Das Smart Home

## Consumer-IoT und das Mirai-Botnet


<!-- _notes:
Dieser Abschnitt behandelt Consumer-IoT und das Mirai-Botnet. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Was ist Consumer-IoT / Smart Home?

- **Internet of Things (IoT)**: Alltagsgegenstände mit Internetverbindung, Sensorik und eigener Intelligenz
- Typische Smart-Home-Geräte: IP-Kameras, smarte Steckdosen, Türschlösser, Lautsprecher, Router, Babyphones
- Gemeinsamkeit: **billig, massenhaft verkauft, dauerhaft online**
- Im Gegensatz zur Industrieanlage: kein Sicherheitsteam, kein IT-Admin – der Nutzer selbst ist verantwortlich

<!-- _notes:
Der Kontrast zum vorherigen Kapitel ist bewusst gewählt: Bei Industrieanlagen gibt es zumindest theoretisch Fachpersonal, Wartungsverträge und Prozesse. Beim Smart-Home-Gerät für 20 Euro aus dem Elektronikmarkt gibt es das in aller Regel nicht. Genau das macht Consumer-IoT zu einem eigenen Risikofeld.
-->

---
# Warum Smart-Home-Geräte so anfällig sind

- **Kostendruck**: Sicherheit kostet Entwicklungszeit – bei Billigware oft die erste Einsparung
- **Keine Update-Mechanismen**: viele Geräte erhalten nie ein Sicherheitsupdate, manche Hersteller existieren nach Jahren nicht mehr
- **Monokultur**: dieselbe Firmware steckt in tausenden baugleichen Geräten weltweit – eine Schwachstelle betrifft alle gleichzeitig
- **Immer online**: Geräte laufen 24/7 und sind oft direkt aus dem Internet erreichbar

<!-- _notes:
Diese vier Punkte sind der rote Faden für praktisch jeden IoT-Sicherheitsvorfall im Consumer-Bereich. Die Probleme verstärken sich gegenseitig – ein Gerät ohne Update-Mechanismus, das obendrein baugleich in Millionen Haushalten steht, ist ein perfektes Ziel für automatisierte Massenangriffe.
-->

---
# Fallstudie: Mirai-Botnet (2016)

- **Was geschah?**
  - Schadsoftware scannte automatisiert das Internet nach IoT-Geräten mit offenem **Telnet-Zugang**
  - Testete dabei eine Liste von rund **60 Standard-Benutzername/Passwort-Kombinationen** (z. B. `admin`/`admin`)
  - Infizierte so hunderttausende Kameras, Router und Digitalrekorder – ganz ohne komplexe Exploits

> **Telnet:** älterer Fernzugangsdienst zur Anmeldung am Gerät. Standard-Zugangsdaten erlaubten Mirai, sich an schlecht gesicherten Geräten anzumelden.

<!-- _notes:
Mirai war technisch bewusst simpel gehalten – kein Zero-Day, kein Exploit, sondern schlicht das Ausprobieren von Werksvorgaben, die Nutzer nie geändert hatten. Das zeigt: Für einen erfolgreichen Massenangriff braucht es keine Raffinesse, wenn Grundlagen wie Passwort-Hygiene fehlen.
-->

---
# Mirai-Botnet als Diagramm

![w:1240 center](img/mirai-botnet.svg)

<!-- _notes:
Die dargestellten Elemente sind den vollständigen Ablauf: Vom automatisierten Scan über die Infektion bis zum eigentlichen Ziel des Angriffs – einem DDoS gegen den DNS-Anbieter Dyn, wodurch große Teile des Internets (Twitter, Netflix, Reddit) zeitweise nicht erreichbar waren. Die IoT-Geräte selbst waren für die Angreifer uninteressant – sie dienten nur als Werkzeug, um ein ganz anderes Ziel zu treffen. Die Besitzer der Kameras haben von der Infektion oft nichts bemerkt.
-->

---
# Konsequenzen & Lehren aus Mirai

- **Konsequenzen**: großflächiger Ausfall bekannter Internetdienste, verstärkte regulatorische Debatten über IoT-Mindeststandards
- Der Quellcode wurde veröffentlicht – seither Basis unzähliger Varianten und Nachfolge-Botnetze
- **Lehre**: Ein einzelnes unsicheres Gerät gefährdet nicht nur seinen Besitzer, sondern potenziell das gesamte Internet

> **Merksatz:** Das schwächste Glied im IoT ist selten das Gerät selbst – es ist das Standardpasswort.

<!-- _notes:
Der veröffentlichte Quellcode ist ein wichtiger Punkt: Mirai ist kein einmaliger Vorfall geblieben, sondern die technische Grundlage für viele spätere IoT-Botnetze. Die Übertreibung im Merksatz führt direkt zur OWASP-Top-10-Liste über, in der „Weak, Guessable, or Hardcoded Passwords" nicht zufällig auf Platz 1 steht. Mirai nutzte erreichbare Fernzugänge und Standard-Zugangsdaten; komplexe Zero-Day-Exploits waren dafür nicht erforderlich.
-->

---
<!-- _class: chapter -->
# OWASP IoT Top 10

## Die häufigsten Schwachstellenkategorien im Überblick


<!-- _notes:
Dieser Abschnitt behandelt Die häufigsten Schwachstellenkategorien im Überblick. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können. Die Top-10-Kategorien ordnen typische Schwächen; I1 betrifft Zugangsdaten und I4 fehlende sichere Updates.
-->
---
# Die OWASP IoT Top 10 (2018)

| # | Kategorie |
|---|---|
| I1 | Schwache, erratbare oder fest codierte Passwörter |
| I2 | Unsichere Netzwerkdienste |
| I3 | Unsichere Ecosystem-Schnittstellen (App, Cloud, API) |
| I4 | Fehlender sicherer Update-Mechanismus |
| I5 | Einsatz unsicherer oder veralteter Komponenten |


> **Beispiel für I3:** Eine sichere Kamera hilft wenig, wenn ihre Smartphone-App oder Cloud-Schnittstelle unberechtigt auf Aufnahmen zugreifen lässt.

<!-- _notes:
Analog zur OWASP Top 10 für Webanwendungen aus dem SSDLC-Kapitel gibt es eine eigene Liste speziell für IoT-Geräte. Zwei Punkte greifen wir vertiefend heraus, weil wir sie in den Fallstudien bereits gesehen haben. Die Top-10-Kategorien ordnen typische Schwächen; I1 betrifft Zugangsdaten und I4 fehlende sichere Updates.
-->
---
# Die OWASP IoT Top 10 (2018)

| # | Kategorie |
|---|---|
| I6 | Unzureichender Datenschutz |
| I7 | Unsichere Datenübertragung & -speicherung |
| I8 | Fehlendes Geräte-Management |
| I9 | Unsichere Standardeinstellungen |
| I10 | Fehlende physische Absicherung |


<!-- _notes:
Die Kategorien I6 bis I10 betreffen unterschiedliche Stellen im Lebenszyklus eines Geräts: Datenschutz bei erhobenen Informationen, Schutz von Übertragung und Speicherung, Verwaltung im Betrieb, sichere Voreinstellungen und Schutz vor physischem Zugriff. Ein Beispiel für I9 ist ein unverändertes Standardpasswort; I10 kann einen frei zugänglichen Wartungsanschluss betreffen. Die Top-10-Kategorien ordnen typische Schwächen; I1 betrifft Zugangsdaten und I4 fehlende sichere Updates.
-->
---
# Vertiefung: I1 – Schwache/fest codierte Passwörter

- Geräte werden mit **Standard-Zugangsdaten** ausgeliefert, die Nutzer selten ändern
- Manche Geräte haben zusätzlich **fest codierte** (hardcoded) Zugänge, die sich gar nicht ändern lassen
- **Bereits gesehen bei:** Mirai-Botnet – Infektion allein über ausprobierte Standard-Logins

<!-- _notes:
Direkter Rückgriff auf die Mirai-Fallstudie: Genau diese Kategorie war der Türöffner für hunderttausende Infektionen. Erwähnenswert: Manche Hersteller bauen zusätzlich versteckte, fest einprogrammierte Zugänge für den Support ein – diese lassen sich vom Nutzer oft gar nicht deaktivieren, selbst wenn er sein eigenes Passwort ändert.
-->

---
# Vertiefung: I4 – Fehlender sicherer Update-Mechanismus

- Viele IoT-Geräte haben **keinen** oder nur einen unsicheren Weg, um Sicherheitsupdates zu erhalten
- Betrifft Consumer-Geräte (nie ein Update) **und** Industrieanlagen (Updates nur im geplanten Stillstand)
- Ohne Update-Mechanismus bleibt eine einmal bekannte Schwachstelle **dauerhaft** ausnutzbar

<!-- _notes:
Diese Kategorie verbindet beide Fallstudien der Vorlesung: Bei Stuxnet-artigen OT-Umgebungen verhindert der nötige Anlagenstillstand schnelle Patches, bei Smart-Home-Geräten fehlt oft von vornherein jede Update-Funktion. In beiden Fällen bleibt eine bekannte Schwachstelle jahrelang offen – ein Zustand, der in der klassischen Server- oder Client-IT so kaum toleriert würde.
-->

---
# Zusammenfassung

| Bereich | Kernrisiko | Beispiel |
|---|---|---|
| Industrieanlagen (OT) | Verfügbarkeit vor Vertraulichkeit, lange Lebensdauer | Stuxnet |
| Smart Home (Consumer-IoT) | Kostendruck, keine Updates, Monokultur | Mirai-Botnet |
| OWASP IoT Top 10 | Strukturierte Übersicht typischer Schwachstellen | I1, I4 |

> **Merksatz:** IoT-Sicherheit bedeutet, Sicherheit für Geräte zu denken, die niemand administriert.


<!-- _notes:
Der Merksatz fasst den roten Faden der gesamten Vorlesung zusammen: Ob Industrieanlage oder Kamera im Wohnzimmer – IoT-Geräte haben oft keinen Administrator, der sich aktiv um Patches, Konfiguration und Überwachung kümmert, im Gegensatz zu klassischen IT-Systemen in einem Unternehmensnetz.
-->

---
# Diskussionsfragen

- Wer sollte verantwortlich sein, wenn ein günstiges IoT-Gerät nie ein Sicherheitsupdate erhält – Hersteller, Händler oder Nutzer?
- Sollten Industrieanlagen gesetzlich verpflichtet werden, Sicherheitsupdates auch außerhalb geplanter Stillstände einzuspielen?

<!-- _notes:
Diese Fragen eignen sich für eine kurze Abschlussdiskussion, falls noch Zeit bleibt. Bei der ersten Frage lohnt sich der Verweis auf aktuelle Regulierung wie den EU Cyber Resilience Act, der Herstellern erstmals verbindliche Update-Pflichten auferlegt. Bei der zweiten Frage kann der Zielkonflikt zwischen Sicherheit und Produktionsverfügbarkeit aus dem OT-Kapitel nochmal aufgegriffen werden.
-->
