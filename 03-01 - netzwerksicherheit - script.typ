#set page(
  paper: "a4",
  margin: (top: 1.8cm, bottom: 1.8cm, left: 2.0cm, right: 2.0cm),
  header: context {
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8.5pt, fill: rgb("#64748b"), weight: "bold")[DHBW Karlsruhe · IT-Sicherheit]],
        align(right)[#text(size: 8.5pt, fill: rgb("#94a3b8"))[03-01 · Netzwerksicherheit]]
      )
      #v(-4pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    ]
  },
  footer: context [
    #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    #v(3pt)
    #grid(
      columns: (1fr, 1fr),
      align(left)[#text(size: 8.5pt, fill: rgb("#94a3b8"))[Lernskript & Klausurvorbereitung]],
      align(right)[
        #let current = counter(page).get().first()
        #let total = counter(page).final().first()
        #text(size: 8.5pt, fill: rgb("#64748b"))[Seite #current von #total]
      ]
    )
  ]
)

#set text(
  font: ("Segoe UI", "Arial"),
  size: 9.75pt,
  lang: "de",
  fill: rgb("#1e293b")
)

#set par(
  justify: true,
  leading: 0.7em,
  spacing: 0.85em
)

#set list(
  spacing: 0.55em,
  marker: ([•], [--], [▸])
)

#show heading.where(level: 1): it => block(
  width: 100%,
  breakable: false,
  inset: (top: 4pt, bottom: 6pt),
)[
  #text(size: 16pt, weight: "bold", fill: rgb("#0f172a"))[#it.body]
  #v(2pt)
  #line(length: 100%, stroke: 1.5pt + rgb("#e2001a"))
  #v(3pt)
]

#show heading.where(level: 2): it => block(
  width: 100%,
  breakable: false,
  inset: (top: 2pt, bottom: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: rgb("#475569"))[#it.body]
]

#show heading.where(level: 3): it => block(
  width: 100%,
  breakable: false,
  inset: (top: 2pt, bottom: 3pt),
)[
  #text(size: 10.5pt, weight: "bold", fill: rgb("#1e293b"))[#it.body]
]

#show figure.where(kind: image): it => align(center)[
  #box(radius: 5pt, clip: true, stroke: 1pt + rgb("#cbd5e1"))[#it.body]
  #if it.caption != none [
    #v(2pt)
    #text(size: 8pt, fill: rgb("#64748b"))[#it.caption]
  ]
]

#set image(width: 38%)

#let didaktik-box(title: none, body) = block(
  width: 100%,
  fill: rgb("#f0f7ff"),
  stroke: (left: 3.5pt + rgb("#0284c7")),
  radius: (right: 4pt),
  inset: (x: 10pt, y: 7.5pt),
  spacing: 8pt,
  breakable: false,
)[
  #if title != none [
    #text(weight: "bold", fill: rgb("#0369a1"), size: 9.75pt)[💡 #title]
    #v(3pt)
  ]
  #body
]

#let exam-box(title: none, body) = block(
  width: 100%,
  fill: rgb("#faf5ff"),
  stroke: (left: 3.5pt + rgb("#7c3aed")),
  radius: (right: 4pt),
  inset: (x: 10pt, y: 7.5pt),
  spacing: 8pt,
  breakable: false,
)[
  #if title != none [
    #text(weight: "bold", fill: rgb("#6d28d9"), size: 9.75pt)[🎯 #title]
    #v(3pt)
  ]
  #body
]

#let quiz-box(title: none, body) = block(
  width: 100%,
  fill: rgb("#f0fdf4"),
  stroke: (left: 3.5pt + rgb("#16a34a")),
  radius: (right: 4pt),
  inset: (x: 10pt, y: 7.5pt),
  spacing: 8pt,
  breakable: false,
)[
  #if title != none [
    #text(weight: "bold", fill: rgb("#15803d"), size: 9.75pt)[❓ #title]
    #v(3pt)
  ]
  #body
]

#let quote-box(body) = block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: (left: 3pt + rgb("#64748b")),
  radius: (right: 4pt),
  inset: (x: 9pt, y: 6.5pt),
  spacing: 7pt,
  breakable: false,
)[
  #text(style: "italic", fill: rgb("#334155"))[#body]
]

= Sicherheit in Netzwerken
<sicherheit-in-netzwerken>
== Risiken verstehen, Schutz erklären, Kunden beraten
<risiken-verstehen-schutz-erklären-kunden-beraten>
#didaktik-box(title: [Das große Ganze])[
Moderne Unternehmen existieren heute nicht mehr ohne Netzwerke: Jede
Bestellung, jeder Zahlungsvorgang und jede E-Mail läuft über digitale
Leitungen. Bricht das Netzwerk zusammen oder wird Kommunikation
manipuliert, steht das gesamte Geschäft still. In dieser Vorlesung
lernst du Netzwerksicherheit nicht als abstrakte Protokoll-Bastelei,
sondern aus der Beratungsperspektive: Welche Geschäftsrisiken drohen und
wie schützt man die Unternehmenswerte?

]
#exam-box(title: [Orientierung])[
Unser roter Faden folgt dem Weg der Daten: vom lokalen Anschluss am
Schreibtisch über die weltweiten Transportwege des Internets bis zur
Anwendung beim Nutzer -- verknüpft mit den drei Schutzzielen der
CIA-Triade (Vertraulichkeit, Integrität, Verfügbarkeit).

]
#quiz-box(title: [Prüfungsfokus])[
In der Klausur musst du Angriffe den Schutzzielen der CIA-Triade
zuordnen, die passende Gegenmaßnahme benennen und erklären können, warum
moderne Sicherheit über reine Burgmauern (Perimeter) hinausgehen muss.

]
#pagebreak(weak: true)
= Agenda
<agenda>
- #strong[Geschäftsrisiken] -- warum Netzwerksicherheit alle Unternehmen
  betrifft
- #strong[Orientierungsmodell] -- wo Kommunikation angegriffen werden
  kann
- #strong[Zugang und lokales Netz] -- wer oder was darf sich verbinden?
- #strong[Datenwege im Internet] -- wem vertrauen wir beim Transport?
- #strong[Verfügbarkeit von Diensten] -- wie entstehen Überlastung und
  Ausfall?
- #strong[Anwendungen und Sitzungen] -- wie werden Nutzer umgeleitet
  oder übernommen?
- #strong[Schutzkonzept und Beratung] -- mehrere Schutzlinien sinnvoll
  kombinieren

#didaktik-box(title: [Strukturüberblick])[
Die Gliederung folgt dem Weg eines Datenpakets: Wir starten bei den
geschäftlichen Risiken, nutzen ein vereinfachtes 3-Stufen-Modell als
Landkarte (Zugang ➔ Transport ➔ Anwendung) und betrachten auf jeder
Ebene Bedrohungen und Schutzprinzipien, bevor wir alles in einem
schlagkräftigen Schutzkonzept (Defense in Depth) zusammenführen.

]
#exam-box(title: [Lern-Strategie])[
- #strong[Grundlagen & Schichten:] Die Dreiteilung (Zugang, Transport,
  Anwendung) als gedankliches Ordnungssystem verinnerlichen.
- #strong[Angriffe & Schutzziele:] Zu jedem Angriff wissen, welches
  Schutzziel verletzt wird (Mitlesen = Vertraulichkeit; Umleitung =
  Integrität; DDoS = Verfügbarkeit).
- #strong[Spezifische Mechanismen:] ARP-Spoofing, SYN-Flood, Session
  Hijacking, DNS-Spoofing sicher erklären können.
- #strong[Architektur & Beratung:] Defense in Depth und Segmentierung
  vs.~Zero Trust sauber abgrenzen.

]
#quiz-box(title: [Typische Klausur-Schwerpunkte])[
Transferfragen lauten häufig: „Ein Kunde klagt über Vorfall X. Auf
welcher Ebene liegt das Problem, welches Schutzziel ist verletzt und
welche zwei Maßnahmen empfehlen Sie?"

]
#pagebreak(weak: true)
= Warum ist Netzwerksicherheit so wichtig?
<warum-ist-netzwerksicherheit-so-wichtig>
== Die Angriffsfläche der vernetzten Welt
<die-angriffsfläche-der-vernetzten-welt>
#didaktik-box(title: [Worum geht es in diesem Kapitel?])[
Wir schaffen das geschäftliche Fundament: Warum reicht das alte Konzept
vom „sicheren Firmennetzwerk" nicht mehr aus? Durch Cloud, Homeoffice
und IoT gibt es keinen geschützten Innenraum mehr. Wir klären die
Schlüsselbegriffe Angriffsfläche (Attack Surface), Perimeter und warum
interne Abschottung lebenswichtig ist.

]
#exam-box(title: [Modul-Lernziel])[
Du kannst den Begriff Angriffsfläche definieren, das Zusammenspiel von
Initial Access und Lateral Movement erklären und begründen, warum die
klassische Perimeter-Sicherheit überholt ist.

]
#quiz-box(title: [Typische Schwerpunkte])[
Definition der Angriffsfläche mit Beispielen, Target-Fallstudie
(Heizungsbauer-Einstieg) und der Paradigmenwechsel vom Burg-Modell zu
Zero Trust.

]
#pagebreak(weak: true)
= Jedes Gerät hängt am Netzwerk
<jedes-gerät-hängt-am-netzwerk>
- Vernetzt sind nicht nur Laptops, sondern auch #strong[Drucker,
  Maschinen, Kameras und Sensoren]
- Cloud-Dienste und Partner schaffen zusätzliche Verbindungen außerhalb
  des Unternehmens
- Jedes Gerät und jede Verbindung erweitert die #strong[Angriffsfläche]
- Ein unauffälliges Gerät kann zum Einstieg in kritische Systeme werden

#quote-box[
#strong[Geschäftsfrage:] Wissen wir, welche Geräte mit unserem Netzwerk
verbunden sind?

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Im Firmennetzwerk hängen heute oft mehr „stumme" Geräte als Computer:
smarte Kaffeemaschinen, Überwachungskameras, Etikettendrucker und
Lüftungssteuerungen. Viele dieser Geräte haben uralte Software,
Standardpasswörter und werden nie aktualisiert. Für Hacker sind sie die
perfekte offene Hintertür, um unbemerkt ins Unternehmensnetzwerk
einzudringen. #emph[Alltagsanalogie:] Du sicherst deine Villa mit einer
Panzerglastür und Alarmanlage ab, lässt aber die kleine Katzenklappe im
Keller sperrangelweit offen. Einbrecher zwängen sich durch die
Katzenklappe und stehen mitten im Haus. #emph[Target-Vorfall 2013:]
Angreifer stahlen Zugangsdaten eines Klimatechnik-Subunternehmers und
erbeuteten über das Lüftungsnetzwerk die Kreditkartendaten von 40
Millionen Kunden!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären können, warum Inventarisierung
  (#strong[Asset Management]) die unverzichtbare Basis ist („Was du
  nicht kennst, kannst du nicht schützen") und wie nicht-patchbare
  Altgeräte abgesichert werden (durch #strong[Netzwerksegmentierung /
  Isolierung]).
- #strong[Typische Klausurfalle:] Annehmen, man müsse nur Laptops und
  Server schützen. IoT- und Haustechnik-Geräte erweitern die
  #strong[Angriffsfläche] massiv!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum stellen smarte IoT-Geräte (z. B. IP-Kameras oder
vernetzte Drucker) ein hohes Sicherheitsrisiko im Unternehmensnetzwerk
dar? Nennen Sie zwei Gründe und eine wirksame Gegenmaßnahme."
#strong[Antwort:]

- #strong[Fehlende Updates / Standardpasswörter:] Geräte erhalten selten
  Sicherheits-Patches und laufen oft mit unsicheren Werkseinstellungen.
- #strong[Vergrößerung der Angriffsfläche:] Jedes zusätzliche Gerät
  bietet Angreifern einen potenziellen Einstiegspunkt (#strong[Initial
  Access]).
- #strong[Gegenmaßnahme:] Konsequente #strong[Netzwerksegmentierung
  (VLANs)], sodass IoT-Geräte in einem isolierten Netzbereich ohne
  Zugriff auf kritische Systeme laufen.

]
#pagebreak(weak: true)
= Zugriff von überall möglich
<zugriff-von-überall-möglich>
- Homeoffice, mobile Geräte und Cloud-Dienste lösen die klassische
  #strong[Unternehmensgrenze] auf
- Angriffe sind weltweit möglich und rund um die Uhr automatisierbar
- Gestohlene Zugangsdaten oder ein ungeschütztes Gerät können den
  Einstieg ermöglichen
- Danach entscheidet die interne Abschottung über das Schadensausmaß

#quote-box[
#strong[Merksatz:] Ein Netzwerk ist nur so sicher wie sein schwächstes
angeschlossenes Gerät.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Ein Cyberangriff läuft fast immer in zwei getrennten Schritten ab:

+ #strong[Initial Access (Erstzugang):] Der Einbrecher gelangt irgendwie
  durch ein Fenster oder eine Tür ins Haus (z. B. Phishing-Mail oder
  gestohlenes Passwort).
+ #strong[Lateral Movement (Seitwärtsbewegung):] Der Einbrecher bewegt
  sich von Zimmer zu Zimmer, bricht Schränke auf und sucht den Tresor.
  #emph[Kernaussage:] Den Initial Access kann man bei tausenden
  Mitarbeitern nie zu 100 % verhindern. Die eigentliche Schadenshöhe
  entscheidet sich beim Lateral Movement: Wenn das Netzwerk intern offen
  ist wie eine Scheune, hat der Angreifer leichtes Spiel.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Phasen #strong[Initial Access] und
  #strong[Lateral Movement] definieren und je eine gezielte
  Schutzmaßnahme zuordnen können.
- #strong[Typische Klausurfalle:] Glauben, dass mit einer Firewall am
  Außenzugang alles erledigt sei. Ein Netzwerk muss #strong[im Inneren]
  gegen Seitwärtsbewegungen abgeschottet sein!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Unterscheiden Sie 'Initial Access' und 'Lateral
Movement' und nennen Sie für jede Phase eine geeignete Schutzmaßnahme."
#strong[Antwort:]

- #strong[Initial Access:] Der erstmalige Einbruch/Zugang in das
  Netzwerk (z. B. via Phishing, kompromittiertes VPN-Passwort). Schutz:
  #strong[Mehrfaktor-Authentifizierung (MFA)] oder #strong[Security
  Awareness].
- #strong[Lateral Movement:] Die unbefugte Weiterverbreitung des
  Angreifers von System zu System innerhalb des internen Netzes. Schutz:
  #strong[Netzwerksegmentierung] und das #strong[Prinzip der minimalen
  Rechte (Least Privilege)].

]
#pagebreak(weak: true)
= Perimeter-Sicherheit reicht nicht mehr
<perimeter-sicherheit-reicht-nicht-mehr>
#grid(columns: (1fr, 1fr), gutter: 14pt, [
=== Früher
<früher>
- Klare Netzwerkgrenze (Perimeter)
- Firewall am Übergang zum Internet
- „Innen sicher, außen unsicher"

], [
=== Heute
<heute>
- Homeoffice, Cloud, mobile Geräte
- Keine klare Grenze mehr
- Prinzip #strong[Zero Trust]: jede Verbindung wird geprüft, egal woher

])
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Das alte Sicherheitsmodell funktionierte wie eine mittelalterliche Burg:
Ein tiefer Graben und dicke Mauern (#strong[Perimeter]). Wer einmal über
die Zugbrücke im Burghof stand, dem wurde blind vertraut. Heute arbeiten
Mitarbeiter im Homeoffice, Server stehen in der Microsoft-/AWS-Cloud und
Mobilgeräte wechseln ständig das Netz -- die Burgmauern existieren nicht
mehr! #emph[Die neue Philosophie -- Zero Trust:] „Vertraue niemandem,
prüfe immer alles nach" (#strong[Never trust, always verify]). Selbst
wenn jemand im internen Büro-WLAN sitzt, wird bei jedem einzelnen Klick
geprüft: Wer bist du? Ist dein Laptop sicher? Darfst du wirklich auf
diese Datei zugreifen?

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Paradigmenwechsel vom
  Burg-/Perimeter-Modell zu #strong[Zero Trust] erklären und begründen,
  warum Standort im internen Netz kein Vertrauensbeweis mehr ist.
- #strong[Typische Klausurfalle:] Zero Trust für ein Software-Produkt
  halten, das man im Laden kauft, oder behaupten, dass Firewalls durch
  Zero Trust überflüssig werden. Firewalls bleiben wichtig, sind aber
  nicht mehr die einzige Vertrauensgrenze!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erläutern Sie den Leitsatz 'Never trust, always verify'
des Zero-Trust-Modells im Vergleich zum traditionellen
Perimeter-Ansatz." #strong[Antwort:]

- #strong[Perimeter-Ansatz:] Basiert auf Standort-Vertrauen („innen
  sicher, außen unsicher"); wer die Firewall passiert hat, genießt
  breites Vertrauen.
- #strong[Zero Trust:] Kein Vertrauensvorschuss aufgrund des
  Netzwerkstandorts; #strong[jeder einzelne Zugriff] auf Ressourcen wird
  dynamisch anhand von #strong[Identität (MFA), Gerätezustand und
  Kontext] authentifiziert und autorisiert.

]
#pagebreak(weak: true)
= Wo Kommunikation angegriffen werden kann
<wo-kommunikation-angegriffen-werden-kann>
== Das OSI-Modell als einfache Landkarte
<das-osi-modell-als-einfache-landkarte>
#didaktik-box(title: [Worum geht es in diesem Kapitel?])[
Wie findet man sich im Dschungel von hunderten Netzwerkprotokollen und
Begriffen zurecht? Wir nutzen das OSI-Schichtenmodell nicht als
akademische Schikane, sondern als praktische Navigationskarte: Es teilt
die Kommunikation logisch auf, damit wir Angriffe und Gegenmaßnahmen
sofort der richtigen Stelle zuordnen können.

]
#exam-box(title: [Modul-Lernziel])[
Du verstehst den Sinn von Schichtenmodellen (Kapselung, Abstraktion) und
kannst nachvollziehen, warum Schutzmaßnahmen immer genau auf der Schicht
wirken müssen, auf der das Risiko entsteht.

]
#quiz-box(title: [Typische Schwerpunkte])[
Sinn eines Schichtenmodells, Kapselungsprinzip und die didaktische
Reduktion auf die drei Bereiche Zugang, Transport und Anwendung.

]
#pagebreak(weak: true)
= Warum ein Schichtenmodell?
<warum-ein-schichtenmodell>
- Netzwerkkommunikation besteht aus mehreren aufeinander aufbauenden
  Aufgaben
- Das #strong[OSI-Modell] ordnet sie vom physischen Zugang bis zur
  Anwendung
- Jede Ebene kann eigene Risiken und Schutzmaßnahmen haben
- Für Beratung und Vertrieb genügt eine vereinfachte Landkarte:
  - #strong[Zugang -- Transport -- Anwendung]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Netzwerkkommunikation ist wie ein Briefversand: Du schreibst den Text
(Anwendung), steckst ihn in einen Umschlag mit Empfängeradresse
(Transport) und der Postbote transportiert ihn per Fahrrad oder LKW über
die Straße (Zugang). Jede Ebene hat ihre eigene Aufgabe. #emph[Warum ist
das für Sicherheit wichtig?] Jede Ebene hat völlig andere
Schwachstellen! Wenn du deinen Brief in feinstem Latein verschlüsselst
(TLS auf Anwendungsebene), kann der Postbote den Umschlag trotzdem
klauen oder an eine falsche Adresse werfen (Transportebene). Eine
Maßnahme schützt immer nur ihre eigene Schicht!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären können, warum keine einzelne
  Schutzmaßnahme alle Ebenen absichern kann (Herleitung für
  #strong[Defense in Depth]).
- #strong[Typische Klausurfalle:] Zu glauben, dass TLS/HTTPS alle
  Netzwerkangriffe abwehrt. TLS schützt die Vertraulichkeit des Inhalts,
  aber nicht gegen Überlastung (DDoS) oder gefälschte Wegweiser (BGP)!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum kann eine Ende-zu-Ende-Verschlüsselung (z. B.
TLS) auf Anwendungsebene einen Denial-of-Service-Angriff auf
Netzwerkebene nicht verhindern?" #strong[Antwort:]

- #strong[Schichtentrennung:] TLS schützt den #strong[Inhalt der
  Nutzdaten] (Vertraulichkeit und Integrität auf Schicht 5--7).
- #strong[Unterschiedliche Angriffsebene:] Ein DoS-Angriff zielt auf die
  #strong[Verfügbarkeit der Transport- oder Vermittlungsschicht]
  (Überflutung von Bandbreite oder Verbindungstabellen), bevor die
  TLS-Verbindung überhaupt verarbeitet werden kann.

]
#pagebreak(weak: true)
= Eine Landkarte in drei Bereichen
<eine-landkarte-in-drei-bereichen>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Bereich], [Worum geht es?], [Typisches Risiko],),
    table.hline(),
    [#strong[Anwendung]], [Webseiten, E-Mail, angemeldete
    Sitzungen], [Täuschung oder Übernahme],
    [#strong[Transport]], [Datenwege und Erreichbarkeit], [Umleitung
    oder Überlastung],
    [#strong[Zugang]], [Geräte, Kabel, WLAN, lokales Netz], [Unbefugte
    Verbindung],
  )]
  , kind: table
  )

#quote-box[
Das technische OSI-Modell verfeinert diese Landkarte in sieben
Schichten.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Das offizielle technische OSI-Modell hat 7 Schichten -- für Management
und Beratung bündeln wir diese in drei intuitive Zonen:

+ #strong[Zugang (Schicht 1 & 2):] Die Hardware und das lokale Netz
  (Kabel, WLAN, Switches, MAC-Adressen). Risiko: Unbefugte stöpseln sich
  ein.
+ #strong[Transport (Schicht 3 & 4):] Der weltweite Datenweg durchs
  Internet (IP, Router, TCP, UDP). Risiko: Daten werden umgeleitet oder
  Server überflutet.
+ #strong[Anwendung (Schicht 5 bis 7):] Die sichtbaren Dienste für
  Menschen (Webseiten, E-Mail, Logins, DNS). Risiko: Nutzer werden
  getäuscht oder Sitzungen gekapert.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Zuordnung der Schichten und Angriffe
  zu den drei Bereichen auswendig beherrschen (MAC/ARP ➔ Zugang;
  IP/BGP/TCP/SYN ➔ Transport; DNS/HTTP/Sessions ➔ Anwendung).
- #strong[Typische Klausurfalle:] Man-in-the-Middle (MITM) einer
  einzelnen Schicht zuzuordnen. MITM ist eine
  #strong[Angreiferposition], die man auf allen drei Ebenen erreichen
  kann!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Ordnen Sie die folgenden Begriffe den drei Bereichen
'Zugang', 'Transport' und 'Anwendung' zu: (1) ARP-Spoofing, (2)
SYN-Flood, (3) Session Hijacking." #strong[Antwort:]

- #block[
  #set enum(numbering: "(1)", start: 1)
  + ARP-Spoofing: #strong[Zugang] (OSI Schicht 2 / lokales Netz).
  ]
- #block[
  #set enum(numbering: "(1)", start: 2)
  + SYN-Flood: #strong[Transport] (OSI Schicht 4 /
    TCP-Verbindungszustand).
  ]
- #block[
  #set enum(numbering: "(1)", start: 3)
  + Session Hijacking: #strong[Anwendung] (OSI Schicht 7 /
    Web-Sitzungstoken).
  ]

]
#pagebreak(weak: true)
= Vier Fragen als roter Faden
<vier-fragen-als-roter-faden>
- #strong[Ereignis:] Was kann bei der Kommunikation schiefgehen?
- #strong[Auswirkung:] Welche Folgen entstehen für Kunden und Geschäft?
- #strong[Schutz:] Welches Sicherheitsprinzip reduziert das Risiko?
- #strong[Beratung:] Welche Frage macht den Handlungsbedarf sichtbar?

#quote-box[
Technische Details erklären das Wie. Für Entscheidungen zählt zuerst das
Warum.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Dieses 4-Fragen-Raster ist dein universelles Denkwerkzeug für jedes
Sicherheitsgespräch und jede Klausuraufgabe:

+ #strong[Ereignis (Bedrohung):] Was passiert technisch? (#emph[„Jemand
  leitet Daten heimlich um"])
+ #strong[Auswirkung (Schaden):] Was bedeutet das für das Geschäft?
  (#emph[„Kundendaten fließen ab, DSGVO-Bußgelder, Vertrauensverlust"])
+ #strong[Schutz (Maßnahme):] Wie verhindern oder erkennen wir das?
  (#emph[„Verschlüsselung, 802.1X, Segmentierung"])
+ #strong[Beratung (Audit):] Welche Frage deckt die Lücke beim Kunden
  auf? (#emph[„Wissen Sie, wer sich im Besprechungsraum ans Kabel
  hängt?"])

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Offene Klausurfragen strukturiert nach
  den Schritten Bedrohung ➔ Auswirkung ➔ Schutzmaßnahme ➔ Risiko
  beantworten können.
- #strong[Typische Klausurfalle:] Bei Prüfungsfragen nur ein Tool zu
  nennen („Kunde braucht Firewall"), ohne die Auswirkung auf das
  Schutzgut und die Geschäftsprozesse zu begründen.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Ein Angreifer fälscht Absender-IP-Adressen im
Firmennetzwerk. Strukturieren Sie die Analyse dieses Vorfalls anhand von
Ereignis, geschäftlicher Auswirkung und technischer Schutzmaßnahme."
#strong[Antwort:]

- #strong[Ereignis:] #strong[IP-Spoofing] (Vortäuschen einer fremden
  Identität auf Vermittlungsebene).
- #strong[Auswirkung:] Umgehung von einfachen IP-Zugangsfiltern,
  mögliche Datenmanipulation oder Nutzung für DoS-Angriffe
  (#strong[Verletzung von Integrität und Authentizität]).
- #strong[Schutzmaßnahme:] #strong[Kryptografische Authentifizierung (z.
  B. 802.1X / IPsec)] und #strong[Ingress Filtering] beim Provider statt
  Vertrauen auf reine IP-Adressen.

]
#pagebreak(weak: true)
= Zugang und lokales Netz
<zugang-und-lokales-netz>
== Wer oder was darf sich verbinden?
<wer-oder-was-darf-sich-verbinden>
#didaktik-box(title: [Worum geht es in diesem Kapitel?])[
Wir beginnen ganz unten auf OSI-Schicht 1 und 2: Wer darf physisch oder
per Funk in unser Netzwerk? Warum vertrauen Geräte im lokalen Netz
einander blind und wie nutzen Angreifer dieses naive Urvertrauen mit
MAC- und ARP-Spoofing aus?

]
#exam-box(title: [Modul-Lernziel])[
Du lernst die Grundlagen von Schicht 1 und 2 kennen, verstehst den
Unterschied zwischen MAC- und IP-Adresse und beherrschst die
Funktionsweise von Network Access Control (802.1X).

]
#quiz-box(title: [Typische Schwerpunkte])[
Unterschied MAC-Adresse vs.~IP-Adresse, Schwachstelle im ARP-Protokoll
und der Ablauf von ARP-Spoofing.

]
#pagebreak(weak: true)
= Physischer Zugang ist Netzwerkzugang
<physischer-zugang-ist-netzwerkzugang>
- Frei zugängliche Netzwerkdosen können interne Verbindungen ermöglichen
- Unsicheres WLAN kann Daten preisgeben oder fremde Geräte hereinlassen
- Serverräume, Verteiler und Leitungen sind Ziele für Diebstahl oder
  Sabotage
- Schutz beginnt deshalb bei #strong[Zutritt, Inventar und sicheren
  Funknetzen]

#quote-box[
#strong[Beratungsfrage:] Welche Netzwerkzugänge sind für Gäste und
Dritte erreichbar?

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Wer physischen Zugriff auf ein Kabel oder Funknetz hat, ist schon halb
im System. Eine offene Netzwerkdose im Besucher-Besprechungsraum oder an
einer Außenfassade kann reichen: Ein Angreifer steckt einen winzigen
Minicomputer (z. B. Raspberry Pi) an und hat dauerhaften Zugriff auf das
Firmennetz. #emph[WLAN-Standards:] Veraltete Verschlüsselungen wie WEP
und WPA sind in Sekunden geknackt. WPA2 ist das Minimum, #strong[WPA3]
der heutige Stand der Technik. #emph[Gegenmaßnahme 802.1X (Network
Access Control):] Der Switch schaltet den Netzwerkport erst frei, wenn
sich das Gerät mit Zertifikat oder Benutzerdaten authentifiziert hat.
Keine Autorisierung = tote Dose!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die WLAN-Standards der Reihe nach
  bewerten können (WEP/WPA = unsicher; WPA2-Enterprise =
  Mindeststandard; WPA3 = aktuell) und #strong[IEEE 802.1X / NAC] als
  Schutzmaßnahme für Switch-Ports nennen können.
- #strong[Typische Klausurfalle:] Vergessen, dass physische Maßnahmen
  (abgeschlossene Verteilerkästen, Port-Abschaltung ungenutzter Dosen)
  vollwertige IT-Sicherheitsmaßnahmen sind!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Ein externer Besucher steckt im Besprechungsraum ein
mitgebrachtes Notebook an eine freie Netzwerkdose. Mit welcher
Technologie lässt sich verhindern, dass dieses fremde Gerät Zugriff auf
das interne Unternehmensnetz erhält?" #strong[Antwort:]

- #strong[Technologie:] #strong[Network Access Control (NAC)] nach dem
  Standard #strong[IEEE 802.1X].
- #strong[Funktionsweise:] Der Switch-Port bleibt standardmäßig
  blockiert; erst nach erfolgreicher Authentifizierung des Geräts (z. B.
  via Zertifikat) am zentralen RADIUS-Server wird der Datenverkehr
  freigegeben (oder in ein isoliertes Gastnetz geleitet).

]
#pagebreak(weak: true)
= Vertrauen im lokalen Netzwerk
<vertrauen-im-lokalen-netzwerk>
- Geräte im selben Netz müssen einander finden und Daten austauschen
- Ältere Netzwerkmechanismen vertrauen vielen Angaben ohne
  Identitätsprüfung
- Ein fremdes Gerät kann sich dadurch als legitimer
  Kommunikationspartner ausgeben
- Mögliche Folgen: #strong[Mitlesen, Manipulation oder Zugriff auf
  weitere Systeme]

#quote-box[
Nähe im Netzwerk ist kein Beweis für Vertrauenswürdigkeit.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Im lokalen Netzwerk (LAN) müssen Computer wissen, welche
Hardware-Adresse (#strong[MAC-Adresse]) zu welcher IP-Adresse gehört.
Dafür gibt es das #strong[Address Resolution Protocol (ARP)]. Wenn dein
PC drucken will, schreit er ins ganze Zimmer: „Wem gehört die IP
192.168.1.50?". Der Drucker antwortet: „Mir, meine MAC-Adresse ist
AA:BB:CC!". #emph[Das Problem:] ARP wurde vor 40 Jahren erfunden, als
sich alle im Netz vertrauten. Es gibt #strong[keine Authentifizierung,
keine Signatur, keine Prüfung]! Jeder kann einfach rufen: „Ich bin der
Drucker!" -- und alle glauben es ungeprüft.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Das Funktionsprinzip von ARP erklären
  und die fundamentale Sicherheitslücke benennen (#strong[fehlende
  Authentifizierung / Vertrauen auf ungeprüfte Broadcast-Antworten]).
- #strong[Typische Klausurfalle:] ARP-Spoofing für einen
  Programmierfehler halten. Es ist ein #strong[Designfehler] eines
  historischen Protokolls, das für geschlossene, vertrauenswürdige Netze
  gebaut wurde!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum ist das Address Resolution Protocol (ARP) im
lokalen Netzwerk anfällig für Manipulationen?" #strong[Antwort:]

- #strong[Fehlende Authentifizierung:] ARP-Nachrichten sind weder
  signiert noch verschlüsselt; die Identität des Absenders wird nicht
  überprüft.
- #strong[Unaufgeforderte Antworten (Gratuitous ARP):] Geräte
  akzeptieren und speichern Antworten im #strong[ARP-Cache], selbst wenn
  sie nie danach gefragt haben.

]
#pagebreak(weak: true)
= Beispiel: Identität im Netzwerk vortäuschen
<beispiel-identität-im-netzwerk-vortäuschen>
- Angreifer gibt sich im lokalen Netz als ein anderes Gerät aus
- Datenverkehr wird unbemerkt über den Angreifer geleitet
- Vergleichbar mit einer gefälschten Nachsendeadresse für Geschäftspost
- Risiken: Zugangsdaten mitlesen, Inhalte verändern, Kommunikation
  stören
- Fachbegriffe: #strong[MAC-Spoofing] und #strong[ARP-Spoofing]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
- #strong[MAC-Spoofing:] Dein PC ändert einfach seine eigene
  Netzwerk-Seriennummer (MAC-Adresse) und gibt sich z. B. als der
  Chef-Laptop oder als Drucker aus, um MAC-Filter zu überlisten.
- #strong[ARP-Spoofing (ARP-Poisoning):] Der Angreifer schickt
  gefälschte Antworten an deinen PC: „Ich bin der Internet-Router!".
  Gleichzeitig sagt er dem Router: „Ich bin der PC!". Ab sofort schicken
  beide ihren gesamten Datenverkehr an den Angreifer, der alles mitliest
  und weiterleitet. #emph[Alltagsanalogie:] Ein Dieb klebt heimlich ein
  Schild über den Briefkasten deines Nachbarn: „Nachsendeauftrag an
  Dieb". Die Post liefert alle Briefe beim Dieb ab, er öffnet sie, liest
  sie durch und wirft sie danach beim echten Nachbarn ein.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] MAC-Spoofing und ARP-Spoofing
  unterscheiden und erklären, wie ARP-Spoofing zu einer
  #strong[Man-in-the-Middle (MITM)-Position] führt.
- #strong[Typische Klausurfalle:] Glauben, ARP-Spoofing funktioniere
  über das weltweite Internet. ARP funktioniert #strong[nur im selben
  lokalen Netzwerksegment (Broadcast-Domäne / Subnetz)]!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erläutern Sie, wie ein Angreifer mittels ARP-Spoofing
eine Man-in-the-Middle-Position im lokalen Netzwerk aufbaut, und nennen
Sie die zwingende Voraussetzung für diesen Angriff." #strong[Antwort:]

- #strong[Ablauf:] Der Angreifer sendet gefälschte ARP-Antworten an das
  Opfer (behauptet, das Gateway zu sein) und an das Gateway (behauptet,
  das Opfer zu sein). Beide tragen die MAC-Adresse des Angreifers in
  ihren #strong[ARP-Cache] ein; der Datenverkehr fließt über den
  Angreifer, der ihn nach dem Mitlesen transparent weiterleitet.
- #strong[Voraussetzung:] Der Angreifer muss sich im #strong[selben
  lokalen Netzwerksegment (Layer 2)] wie die Opfer befinden.

]
#pagebreak(weak: true)
= ARP-Spoofing als Diagramm
<arp-spoofing-als-diagramm>
#figure(image("img/arp-spoofing.svg", alt: "ARP-Spoofing als Diagramm"),
  caption: [
    ARP-Spoofing als Diagramm
  ]
)

#didaktik-box(title: [Was zeigt uns diese Darstellung?])[
Das Diagramm visualisiert die heimliche Umleitung: Ursprünglich floss
der Datenverkehr direkt zwischen dem Client (Opfer) und dem Gateway
(Router). Durch die gefälschte ARP-Meldung schiebt sich der Angreifer
als Dreieck dazwischen. Der Schlüssel zum Erfolg des Angriffs ist die
gestrichelte Linie: Der Angreifer leitet die Pakete weiter, sodass das
Opfer gar nicht merkt, dass jemand dazwischensitzt -- das Internet
funktioniert ja scheinbar normal weiter!

]
#exam-box(title: [Klausurrelevanz (Transferaufgabe!)])[
- #strong[Was du können musst:] Das Diagramm in drei Schritten erklären:
  (1) Gefälschte ARP-Antwort, (2) Umleitung über Angreifer, (3)
  Weiterleitung ans Gateway zur Tarnung.
- #strong[Grenze des Angriffs:] Wenn der Datenverkehr mit TLS (HTTPS)
  verschlüsselt ist, kann der Angreifer nur Metadaten sehen, aber keine
  Passwörter mitlesen (außer das Opfer ignoriert Zertifikatswarnungen).

]
#quiz-box(title: [Typische Fallfrage & Lösung])[
#strong[Frage:] „Welchen Schutz bietet TLS (HTTPS), wenn sich ein
Angreifer im lokalen Netzwerk erfolgreich per ARP-Spoofing zwischen
Client und Gateway positioniert hat?" #strong[Antwort:]

- #strong[Inhaltsschutz:] TLS verschlüsselt die Nutzdaten Ende-zu-Ende;
  der Angreifer sieht nur unleserlichen Chiffretext und kann
  #strong[keine Passwörter oder Inhalte im Klartext abfangen].
- #strong[Sichtbare Metadaten:] Der Angreifer sieht weiterhin
  Verbindungs-Metadaten (z. B. kontaktierte IP-Adressen, Paketgrößen,
  Zeitpunkte).
- #strong[Voraussetzung:] Das Opfer darf gefälschte Zertifikate oder
  Zertifikatswarnungen im Browser #strong[nicht wegklicken].

]
#pagebreak(weak: true)
= Datenwege im Internet
<datenwege-im-internet>
== Wem vertrauen wir beim Transport?
<wem-vertrauen-wir-beim-transport>
#didaktik-box(title: [Worum geht es in diesem Kapitel?])[
Wir verlassen das Bürogebäude und betreten das globale Internet
(OSI-Schicht 3). Sobald ein Datenpaket dein Firmennetz verlässt, reist
es über 10 bis 20 fremde Router auf der ganzen Welt. Wie finden Pakete
ihr Ziel? Was passiert, wenn Absenderadressen gefälscht werden
(IP-Spoofing) oder digitale Wegweiser lügen (BGP-Hijacking)?

]
#exam-box(title: [Modul-Lernziel])[
Du verstehst die Mechanismen der Vermittlungsschicht (IP, Routing), die
Gefahren gefälschter Absender und warum der Transportweg grundsätzlich
als unvertrauenswürdig eingestuft werden muss.

]
#quiz-box(title: [Typische Schwerpunkte])[
IP-Adressierung, IP-Spoofing (UDP vs.~TCP), BGP-Hijacking und das
Prinzip von Amplification- und Reflexionsangriffen.

]
#pagebreak(weak: true)
= Wie Daten ihr Ziel finden
<wie-daten-ihr-ziel-finden>
- Daten werden in kleine Pakete aufgeteilt und über mehrere Stationen
  weitergeleitet
- #strong[IP-Adressen] kennzeichnen Absender und Ziel
- Router wählen den verfügbaren Weg durch verschiedene Netze
- Unternehmen vertrauen dabei auf Infrastruktur außerhalb der eigenen
  Kontrolle

#quote-box[
Schutz muss auch wirken, wenn der Transportweg nicht vertrauenswürdig
ist.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Im Internet wird jede Datei in kleine Datenpakete zerlegt. Jedes Paket
bekommt einen #strong[IP-Header] mit Absender- und Ziel-IP-Adresse.
Router auf der ganzen Welt lesen die Adresse und reichen das Paket
weiter wie bei einer Eimerkette. #emph[Wichtige Erkenntnis:] Das
Internet Protocol (IP) ist #strong[verbindungslos] und garantiert nichts
(„Best Effort"). Vor allem überprüft kein Router im Netz, ob die im
Absenderfeld eingetragene IP-Adresse wirklich die echte Adresse des
Absenders ist! #emph[Schlussfolgerung:] Da der Transportweg fremden
Betreibern gehört und unsicher ist, müssen Daten im Paket selbst
geschützt werden (#strong[Transportverschlüsselung / TLS]).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären können, warum Verschlüsselung
  die einzig verlässliche Antwort auf unkontrollierbare Transportwege
  ist und welche Informationen trotz Verschlüsselung sichtbar bleiben
  (#strong[Metadaten]: Wer spricht mit wem, wann und wie viel?).
- #strong[Typische Klausurfalle:] IP-Adresse als Identitätsnachweis
  ansehen. Eine IP-Adresse ist eine #strong[Wegadresse], kein
  beglaubigter Ausweis!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum kann ein Unternehmen dem Übertragungsweg von
Datenpaketen im öffentlichen Internet grundsätzlich nicht vertrauen und
welche Maßnahme schützt die Dateninhalte?" #strong[Antwort:]

- #strong[Keine Kontrolle über Zwischenstationen:] Datenpakete passieren
  zahlreiche fremde Router und Provider, die manipuliert, abgehört oder
  fehlgeleitet werden können.
- #strong[Schutzmaßnahme:] #strong[Ende-zu-Ende-Verschlüsselung (z. B.
  TLS, IPsec)] schützt Vertraulichkeit und Integrität der Nutzdaten
  unabhängig vom Transportweg.

]
#pagebreak(weak: true)
= Gefälschte Absender
<gefälschte-absender>
- Absenderangaben in Netzwerkpaketen können manipuliert werden
- Angreifer verschleiern damit ihre Herkunft oder missbrauchen Vertrauen
- Gefälschte Adressen können Antworten gezielt an ein Opfer lenken
- Deshalb darf eine Adresse allein keine Identität beweisen

#quote-box[
#strong[Beratungsfrage:] Welche Zugriffe vertrauen nur auf Herkunft oder
Standort?

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Beim #strong[IP-Spoofing] schreibt der Angreifer eine fremde
Absender-IP-Adresse in sein Datenpaket. Das ist so einfach wie eine
falsche Absenderzeile auf einen Briefumschlag zu kritzeln. #emph[Der
Unterschied zwischen UDP und TCP:]

- Bei #strong[UDP] (z. B. DNS, Streaming) braucht der Angreifer keine
  Antwort. Er schickt eine Anfrage mit der IP des Opfers los -- die
  riesige Antwort knallt beim ahnungslosen Opfer ein!
- Bei #strong[TCP] (Web, Mail) braucht man für die Verbindung eine
  Antwort. Bei gefälschtem Absender kommt die Antwort nie beim Angreifer
  an. Daher nutzt man IP-Spoofing bei TCP fast nur zur Verschleierung
  oder für DoS-Floods.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären können, warum IP-Spoofing bei
  #strong[verbindungslosen Protokollen (UDP)] besonders gefährlich ist
  und warum IP-basierte Zugangskontrollen unsicher sind.
- #strong[Typische Klausurfalle:] Zu glauben, Firewalls könnten
  gefälschte IPs immer erkennen. Erst #strong[Ingress Filtering (BCP
  38)] beim Internet-Provider verhindert, dass Pakete mit gefälschten
  fremden IPs überhaupt ins Netz geschickt werden!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum eignet sich das Protokoll UDP im Gegensatz zu TCP
besonders gut für Angriffe mit gefälschten Absender-IP-Adressen
(IP-Spoofing)?" #strong[Antwort:]

- #strong[Verbindungslosigkeit von UDP:] UDP erfordert keinen
  Verbindungsaufbau (Handshake) und keine Rückbestätigung; Pakete werden
  einfach abgeschickt.
- #strong[TCP erfordert Rückkanal:] Bei TCP muss der
  Drei-Wege-Handschlag abgeschlossen werden; Antworten auf gefälschte
  IPs würden das Opfer erreichen, sodass der Angreifer die Verbindung
  nicht aufbauen kann.

]
#pagebreak(weak: true)
= Wenn digitale Wegweiser falsch zeigen
<wenn-digitale-wegweiser-falsch-zeigen>
- Netzbetreiber tauschen Informationen über erreichbare Ziele aus
- Fehlerhafte oder manipulierte Angaben können Verkehr umleiten
- Mögliche Folgen: #strong[Ausfall, Verzögerung, Überwachung oder
  Manipulation]
- Unternehmen reduzieren das Risiko durch Verschlüsselung und belastbare
  Provider
- Fachbeispiel: #strong[BGP-Hijacking]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Große Netzbetreiber (Telekom, Vodafone etc.) müssen wissen, welche
IP-Adressen wo auf der Welt liegen. Dafür nutzen sie das #strong[Border
Gateway Protocol (BGP)] -- das weltweite Navigationssystem des
Internets. Beim #strong[BGP-Hijacking] behauptet ein böswilliger oder
schlampiger Provider plötzlich: „Die IP-Adressen von YouTube / Amazon
liegen bei mir!". Das weltweite Netz glaubt es, und der gesamte Verkehr
wird umgeleitet. #emph[Berühmtes Beispiel 2008:] Pakistan wollte YouTube
im eigenen Land sperren, leitete versehentlich das weltweite Routing um
-- und legte YouTube weltweit für 2 Stunden lahm! 2018 wurde Amazon-DNS
per BGP entführt, um Krypto-Nutzer auf Phishing-Seiten umzuleiten.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Begriff #strong[BGP-Hijacking]
  erklären, als Lieferketten-/Infrastrukturrisiko einordnen und
  Gegenmaßnahmen nennen (#strong[RPKI] = kryptografische Signatur von
  Routing-Routen, redundante Provider).
- #strong[Typische Klausurfalle:] BGP-Hijacking für einen Angriff auf
  den Endkunden-Router halten. BGP läuft auf den #strong[Core-Routern
  der großen Provider]!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Was versteht man unter 'BGP-Hijacking' und welche
geschäftlichen Auswirkungen können für ein betroffenes Unternehmen
entstehen?" #strong[Antwort:]

- #strong[Definition:] Fälschliche oder böswillige Ankündigung fremder
  IP-Adressbereiche im weltweiten Routing-Protokoll (BGP), wodurch
  Datenverkehr global umgeleitet wird.
- #strong[Auswirkungen:] Vollständiger #strong[Ausfall der
  Erreichbarkeit] (Denial of Service) oder unbemerktes #strong[Abfangen
  und Manipulieren von Datenverkehr] (Man-in-the-Middle) durch den
  entführenden Knoten.

]
#pagebreak(weak: true)
= Kleine Anfrage, große Wirkung
<kleine-anfrage-große-wirkung>
- Angreifer nutzen viele fremde Systeme als unbeabsichtigte Verstärker
- Kleine Anfragen erzeugen zahlreiche oder deutlich größere Antworten
- Alle Antworten werden an die gefälschte Adresse des Opfers geschickt
- Ergebnis: Dienste werden langsam oder fallen vollständig aus

#quote-box[
Das Angriffsziel ist #strong[Verfügbarkeit], nicht zwingend der
Datendiebstahl.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Wie kann ein einzelner Angreifer mit einem billigen Laptop einen
Großkonzern lahmlegen? Durch #strong[Verstärkungsangriffe (Amplification
& Reflection)]:

+ #strong[Reflexion:] Der Angreifer schickt Anfragen mit der gefälschten
  Absender-IP des Opfers an Tausende öffentliche Server im Internet (z.
  B. DNS- oder NTP-Server).
+ #strong[Amplifikation (Verstärkung):] Er nutzt Befehle, bei denen eine
  winzige Frage (z. B. 50 Byte) eine gigantische Antwort (z. B. 4.000
  Byte = 80-fache Verstärkung!) erzeugt. #emph[Ergebnis:] Tausende
  Server bombardieren gleichzeitig das Opfer mit einer Lawine von
  Antworten. Der Angreifer schwitzt nicht, das Opfer erstickt im
  Datenmüll.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Begriffe #strong[Reflexion]
  (Verschleierung + Weiterleitung über fremde Reflektoren) und
  #strong[Amplifikation] (Vervielfachung der Datenmenge) trennscharf
  unterscheiden und erklären können.
- #strong[Typische Klausurfalle:] Glauben, das Ziel sei Datendiebstahl.
  Amplification-Angriffe zielen rein auf die #strong[Verfügbarkeit]
  (Überlastung / DoS)!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erklären Sie den Unterschied zwischen 'Reflexion' und
'Amplifikation' bei einem verteilten Denial-of-Service-Angriff (DDoS)."
#strong[Antwort:]

- #strong[Reflexion:] Der Angriff wird über unbeteiligte Drittserver
  reflektiert, indem der Angreifer die #strong[Absender-IP des Opfers
  fälscht]\; dadurch wird die Identität des Angreifers verschleiert und
  das Opfer von tausenden Quellen gleichzeitig attackiert.
- #strong[Amplifikation:] Das Antwortpaket des Drittservers ist
  #strong[um ein Vielfaches größer als die Anfrage] (z. B. Faktor 50 bei
  DNS), wodurch der Datenstrom massiv vervielfacht wird.

]
#pagebreak(weak: true)
= Datenwege kontrollieren
<datenwege-kontrollieren>
- #strong[Firewalls] prüfen Verbindungen anhand festgelegter Regeln
- Nur notwendige Kommunikationswege werden freigegeben
- Verschlüsselung schützt Inhalte auf fremden Transportwegen
- Überwachung erkennt ungewöhnliche Ziele, Mengen oder Muster
- Redundanz hält wichtige Dienste trotz einzelner Ausfälle erreichbar

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Eine #strong[Firewall] ist kein Wundermittel, sondern ein digitaler
Türsteher mit einer strikten Gästeliste (#strong[Access Control Lists /
ACLs]). Das sicherste Grundprinzip lautet #strong[Default Deny]: Alles
ist grundsätzlich verboten, nur ausdrücklich genehmigte Verbindungen
dürfen durch! #emph[Firewall-Evolution:]

- #emph[Paketfilter:] Prüft nur IP-Adresse und Portnummer (simpel,
  dumm).
- #emph[Stateful Firewall:] Merkt sich bestehende Verbindungen und lässt
  Antworten nur durch, wenn vorher von innen gefragt wurde (Standard
  heute).
- #emph[Next Generation Firewall (NGFW):] Schaut tiefer und erkennt
  Anwendungen (z. B. „Erlaube WhatsApp, aber verbiete Datei-Downloads").

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Das Prinzip #strong[Default Deny]
  begründen können und die Schutzziele zuordnen (Firewall =
  Zugangssteuerung; Verschlüsselung = Vertraulichkeit/Integrität;
  Monitoring = Erkennung; Redundanz = Verfügbarkeit).
- #strong[Typische Klausurfalle:] Default Allow als Option akzeptieren.
  Default Allow ist extrem fehleranfällig, weil man jedes neue Risiko
  manuell sperren müsste!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum gilt das Prinzip 'Default Deny' bei der
Konfiguration von Firewall-Regeln als Best Practice im Vergleich zu
'Default Allow'?" #strong[Antwort:]

- #strong[Default Deny:] Alles ist standardmäßig blockiert; nur explizit
  benötigte Ports und Dienste werden freigegeben. Neue, unbekannte
  Bedrohungen oder vergessene Dienste sind #strong[automatisch
  geschützt].
- #strong[Default Allow:] Alles ist erlaubt, nur bekannte Gefahren
  werden gesperrt. Äußerst riskant, da jede neue Schwachstelle oder
  Konfigurationsänderung sofort ungeschützt offensteht.

]
#pagebreak(weak: true)
= Verfügbarkeit von Diensten
<verfügbarkeit-von-diensten>
== Wenn legitime Kommunikation zur Last wird
<wenn-legitime-kommunikation-zur-last-wird>
#didaktik-box(title: [Worum geht es in diesem Kapitel?])[
Wir erreichen die OSI-Transportschicht (Schicht 4) mit TCP und UDP. Hier
geht es um das Schutzziel Verfügbarkeit: Wie unterscheiden sich
zuverlässige Telefonate (TCP) von schnellen Postkarten (UDP)? Warum kann
man Server lahmlegen, ohne viel Bandbreite zu verbrauchen (SYN-Flood),
und wie planen Unternehmen ihre Geschäftskontinuität (DDoS, SLAs, RTO,
RPO)?

]
#exam-box(title: [Modul-Lernziel])[
Du lernst die Unterschiede zwischen TCP und UDP kennen, verstehst
Protokollangriffe (SYN-Flood) und kannst betriebliche Resilienz-Begriffe
definieren.

]
#quiz-box(title: [Typische Schwerpunkte])[
TCP vs.~UDP (Verbindungsorientierung vs.~Zustandslosigkeit),
3-Wege-Handschlag und SYN-Cookies sowie DoS vs.~DDoS und SLAs.

]
#pagebreak(weak: true)
= Zwei Arten der Datenübertragung
<zwei-arten-der-datenübertragung>
#grid(columns: (1fr, 1fr), gutter: 14pt, [
=== TCP
<tcp>
- Wie ein #strong[Telefonat] mit Rückbestätigung
- Verbindung und Vollständigkeit werden geprüft
- Zuverlässig, aber mit zusätzlichem Aufwand
- Typisch für Webseiten und E-Mail

], [
=== UDP
<udp>
- Wie eine #strong[Postkarte] ohne Empfangsbestätigung
- Daten werden direkt versendet
- Schnell, Verluste werden eher akzeptiert
- Typisch für Streaming und Namensabfragen

])
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
- #strong[TCP (Transmission Control Protocol):] Funktioniert wie ein
  Telefonat mit Rückfrage. Erst verbindet man sich (3-Wege-Handschlag:
  „Hallo?" -- „Ja, hallo!" -- „Super, lass reden!"). Geht ein Wort
  verloren, bittet der Empfänger um Wiederholung. Perfekt für Webseiten,
  E-Mails und Banking.
- #strong[UDP (User Datagram Protocol):] Funktioniert wie das Einwerfen
  einer Postkarte in den Briefkasten. Der Absender wirft sie ein und
  vergisst sie. Keine Bestätigung, keine Garantie. Dafür rasend schnell!
  Perfekt für Livestreams, Online-Gaming und DNS. #emph[Die
  Sicherheitsfalle bei TCP:] Weil sich der Server jede offene Verbindung
  merken muss (#strong[Zustand]), kann man seinen Speicher mit
  gefälschten Anfragen vollstopfen!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Gegenüberstellung
  verbindungsorientiert (TCP) vs.~verbindungslos (UDP) mit Vor- und
  Nachteilen und je zwei typischen Protokollen beherrschen.
- #strong[Typische Klausurfalle:] Annehmen, TCP sei immer sicherer als
  UDP. Die Zustandshaltung von TCP erzeugt eine eigene Angriffsfläche
  für Ressourcenerschöpfung (SYN-Flood)!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Vergleichen Sie TCP und UDP anhand von
Verbindungsaufbau, Fehlerkorrektur und typischen Einsatzgebieten."
#strong[Antwort:]

- #strong[TCP:] #strong[Verbindungsorientiert] (Drei-Wege-Handschlag);
  garantiert vollständige und geordnete Übertragung
  (#strong[automatische Fehlerkorrektur]); Einsatz: HTTP/HTTPS, E-Mail,
  Dateiübertragung.
- #strong[UDP:] #strong[Verbindungslos] (kein Handshake); keine
  Zustellgarantie oder Fehlerbehebung (#strong[geringer Overhead,
  minimale Latenz]); Einsatz: Videostreaming, VoIP, DNS.

]
#pagebreak(weak: true)
= Beispiel: Unvollständige Anfragen blockieren
<beispiel-unvollständige-anfragen-blockieren>
- Ein Dienst reserviert Ressourcen für neue Verbindungen
- Angreifer starten massenhaft Verbindungen, führen sie aber nie zu Ende
- Offene Anfragen belegen Speicher und Verarbeitungskapazität
- Legitime Kunden werden langsam oder abgewiesen
- Fachbeispiel: #strong[SYN-Flood]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Eine #strong[SYN-Flood] ist ein fieser Protokollangriff auf TCP: Beim
normalen Drei-Wege-Handschlag schickt der Client ein `SYN` (Anfrage),
der Server reserviert Speicherplatz und antwortet mit `SYN-ACK`
(Bestätigung), und der Client schließt mit `ACK` ab. Bei der SYN-Flood
schickt der Angreifer tausende `SYN`-Pakete mit gefälschten Absender-IPs
los, schickt aber #strong[nie das finale ACK]. Der Server wartet
geduldig, hält den Speicher reserviert, bis seine Verbindungstabelle
platzt -- und echte Kunden werden abgewiesen. #emph[Alltagsanalogie:]
Ein Anrufer reserviert in einem Restaurant unter 50 falschen Namen alle
Tische für heute Abend, taucht aber nie auf. Echte Gäste müssen hungrig
an der Tür abgewiesen werden. #emph[Die Rettung:] #strong[SYN-Cookies]
-- der Server merkt sich gar nichts mehr im Voraus, sondern packt die
Reservierungsnummer verschlüsselt in die Antwort.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die drei Schritte des TCP-Handshakes
  (#strong[SYN ➔ SYN-ACK ➔ ACK]) nennen, die Abbruchstelle des
  Angreifers markieren und #strong[SYN-Cookies] als Gegenmaßnahme
  erklären können.
- #strong[Typische Klausurfalle:] SYN-Flood für einen Bandbreitenangriff
  halten. Es ist ein #strong[Ressourcen-/Zustandsangriff] -- wenige
  Megabit reichen aus!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erläutern Sie die Funktionsweise eines
SYN-Flood-Angriffs und wie 'SYN-Cookies' diesen Angriff abwehren."
#strong[Antwort:]

- #strong[Funktionsweise:] Angreifer sendet massenhaft TCP-`SYN`-Pakete,
  beantwortet die `SYN-ACK`-Pakete des Servers aber nie mit dem
  abschließenden `ACK`. Die #strong[Verbindungstabelle des Servers läuft
  voll], legitime Verbindungen werden blockiert.
- #strong[SYN-Cookies:] Der Server reserviert beim Eintreffen des `SYN`
  #strong[keinen Speicherplatz], sondern kodiert den Verbindungsstatus
  kryptografisch in die Sequenznummer; erst wenn das valide `ACK` des
  Clients eintrifft, wird die Verbindung aufgebaut.

]
#pagebreak(weak: true)
= Aufklärung vor dem Angriff
<aufklärung-vor-dem-angriff>
- Angreifer prüfen systematisch, welche Dienste erreichbar sind
- Vergleichbar mit dem Testen von Türen und Fenstern vor einem Einbruch
- Die Suche ist automatisiert und findet dauerhaft im Internet statt
- Unnötige Dienste vergrößern die Angriffsfläche
- Fachbegriff: #strong[Portscan]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Ein #strong[Port] ist wie eine Zimmernummer in einem Bürogebäude:
IP-Adresse = Hausadresse; Port 80/443 = Webserver; Port 22 = Fernwartung
(SSH); Port 3389 = Windows-Fernzugriff. Beim #strong[Portscan] klopft
ein Angreifer automatisiert an alle 65.535 Türen deines Servers und
lauscht, wer „Herein!" ruft. Meldet sich ein Dienst, liest der Angreifer
oft sogar die genaue Versionsnummer ab (#strong[Banner Grabbing]) und
sucht gezielt nach bekannten Sicherheitslücken. #emph[Verteidigung
(Attack Surface Reduction):] Schließe alle Türen, die du nicht brauchst!
Dienste, die nur intern gebraucht werden, gehören hinter ein VPN und
niemals offen ins Internet.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Begriff Portscan der
  Aufklärungsphase (#strong[Reconnaissance]) zuordnen und das Prinzip
  der Angriffsflächenreduktion (#strong[Attack Surface Reduction])
  erläutern können.
- #strong[Typische Klausurfalle:] Glauben, ein Portscan sei bereits ein
  Einbruch. Er ist reine #strong[Informationsbeschaffung], aber die
  unverzichtbare Vorstufe für gezielte Angriffe!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Was ist das Ziel eines Portscans und welche zwei
Maßnahmen reduzieren die Angriffsfläche gegen automatisierte Scans?"
#strong[Antwort:]

- #strong[Ziel:] Identifikation von #strong[offenen Netzwerkports,
  aktiven Diensten und deren Versionsnummern] zur Ermittlung
  potenzieller Schwachstellen.
- #strong[Maßnahmen zur Reduktion:]
  + #strong[Abschalten nicht benötigter Dienste] (Hardening).
  + #strong[Zugriffsbeschränkung über Firewalls/VPN] (Dienste nur
    autorisierten IPs zugänglich machen, keine öffentliche Exposition).

]
#pagebreak(weak: true)
= Verfügbarkeit ist ein Geschäftsversprechen
<verfügbarkeit-ist-ein-geschäftsversprechen>
- Online-Dienste müssen auch unter hoher Last erreichbar bleiben
- #strong[DDoS-Angriffe] verteilen Überlastung auf viele Quellen
- Folgen: Umsatzverlust, Vertragsverletzungen, Supportaufwand,
  Vertrauensverlust
- Schutz: Kapazitätsreserven, Filterung, Notfallpläne und spezialisierte
  Anbieter

#quote-box[
#strong[Beratungsfrage:] Welche Ausfallzeit kann das Geschäft wirklich
verkraften?

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
- #strong[DoS vs.~DDoS:] DoS kommt von einem einzelnen Rechner.
  #strong[DDoS (Distributed DoS)] nutzt ein weltweites Botnetz aus
  hunderttausenden gekaperten Computern und Routern. Gegen DDoS hilft
  keine einfache IP-Sperre, weil der Angriff von überall gleichzeitig
  strömt!
- #strong[Betriebliche Kennzahlen für Notfälle:]
  - #strong[SLA (Service Level Agreement):] Die vertragliche
    Verfügbarkeitsgarantie (z. B. 99,9 % erlaubt max. 8,8 Stunden
    Ausfall pro Jahr!).
  - #strong[RTO (Recovery Time Objective):] Wie schnell MUSS das System
    nach einem Ausfall wieder laufen? (Zeit bis zum Neustart).
  - #strong[RPO (Recovery Point Objective):] Wie viel Datenverlust ist
    verkraftbar? (Wie alt darf das letzte Backup sein?).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Unterschied zwischen DoS und DDoS
  erklären sowie RTO (Zeit bis Wiederherstellung) und RPO (akzeptabler
  Datenverlust) definieren können.
- #strong[Typische Klausurfalle:] RTO und RPO verwechseln. #strong[RTO =
  Zeit/Dauer des Ausfalls]\; #strong[RPO = Datenstand/Verlustzeitraum]!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Unterscheiden Sie die Kennzahlen RTO (Recovery Time
Objective) und RPO (Recovery Point Objective) anhand eines
Ransomware-Vorfalls." #strong[Antwort:]

- #strong[RTO (Recovery Time Objective):] Die maximal tolerierbare
  Zeitspanne, bis die Systeme nach dem Vorfall #strong[wieder voll
  betriebsbereit sein müssen] (z. B. Wiederanlauf innerhalb von 4
  Stunden).
- #strong[RPO (Recovery Point Objective):] Der maximal tolerierbare
  #strong[Datenverlust], gemessen als Zeitspanne zwischen letztem Backup
  und Vorfall (z. B. maximal 1 Stunde Datenverlust).

]
#pagebreak(weak: true)
= Anwendungen und Sitzungen
<anwendungen-und-sitzungen>
== Wenn vertraute Dienste getäuscht werden
<wenn-vertraute-dienste-getäuscht-werden>
#didaktik-box(title: [Worum geht es in diesem Kapitel?])[
Wir betreten die oberste Ebene (OSI-Schicht 7): Hier arbeiten echte
Menschen mit Browsern, E-Mails und Web-Apps. Hier nützen reine
Netzwerkfilter wenig, weil Angreifer menschliches Vertrauen und
Anwendungslogik ausnutzen. Warum garantiert das Schloss-Symbol im
Browser keine Sicherheit? Wie funktioniert Session Hijacking und warum
ist DNS-Spoofing so gefährlich?

]
#exam-box(title: [Modul-Lernziel])[
Du lernst die Mechanismen der Anwendungsschicht (HTTP-Sitzungen,
Cookies, DNS) kennen und kannst Angriffe auf Vertrauen und Sitzungen von
reinen Transportangriffen unterscheiden.

]
#quiz-box(title: [Typische Schwerpunkte])[
Zustandslosigkeit von HTTP, Schutz von Sitzungstoken (HttpOnly, Secure,
SameSite), DNS-Spoofing vs.~Cache-Poisoning und HTTP-Flood (Layer 7).

]
#pagebreak(weak: true)
= Nach dem Login: die digitale Sitzung
<nach-dem-login-die-digitale-sitzung>
- Nach erfolgreicher Anmeldung merkt sich ein Dienst den Nutzer
- Ein #strong[Sitzungstoken] dient vorübergehend als Nachweis der
  Anmeldung
- Wer dieses Token stiehlt, kann möglicherweise ohne Passwort handeln
- Verschlüsselung schützt das Token auf dem Transportweg
- Kurze Gültigkeit begrenzt den möglichen Schaden

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Das Web-Protokoll HTTP ist #strong[zustandslos]: Nach jedem Klick
vergisst der Server sofort, wer du bist. Damit du dich nicht bei jedem
Seitenwechsel neu einloggen musst, gibt dir der Server beim Login eine
Wartenummer: ein #strong[Sitzungstoken (Session Cookie)]. #emph[Die
Gefahr:] Wer dein Sitzungstoken klaut, ist in den Augen des Servers DU
-- ganz ohne dein Passwort zu kennen! #emph[Die drei Schutzschilde für
Cookies:]

- `HttpOnly`: JavaScript darf das Cookie nicht auslesen (Schutz gegen
  XSS).
- `Secure`: Cookie wird nur über verschlüsselte HTTPS-Verbindungen
  gesendet.
- `SameSite`: Verhindert, dass fremde Webseiten das Cookie ungefragt
  mitsenden (Schutz gegen CSRF).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Begründen können, warum Sitzungstoken
  existieren (Zustandslosigkeit von HTTP) und die drei
  Sicherheitsattribute (`HttpOnly`, `Secure`, `SameSite`) erklären
  können.
- #strong[Typische Klausurfalle:] Glauben, Passwörter seien der einzige
  Angriffspunkt. Nach dem Login ist das #strong[Sitzungstoken] das
  primäre Ziel von Angreifern!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum benötigt das Web-Protokoll HTTP Sitzungstoken und
mit welchen zwei Cookie-Attributen lässt sich das Token gegen Diebstahl
absichern?" #strong[Antwort:]

- #strong[Grund:] HTTP ist ein #strong[zustandsloses Protokoll]\; ohne
  Token kann der Server aufeinanderfolgende Anfragen keinem
  authentifizierten Nutzer zuordnen.
- #strong[Attribute:]
  - `HttpOnly`: Blockiert den Zugriff von clientseitigem JavaScript auf
    das Cookie (verhindert Diebstahl via #strong[Cross-Site Scripting /
    XSS]).
  - `Secure`: Erzwingt die Übertragung des Cookies ausschließlich über
    verschlüsselte #strong[HTTPS-Verbindungen].

]
#pagebreak(weak: true)
= Beispiel: Eine angemeldete Sitzung übernehmen
<beispiel-eine-angemeldete-sitzung-übernehmen>
- Angreifer erbeutet den temporären Nachweis einer Anmeldung
- Der Dienst hält den Angreifer anschließend für den legitimen Nutzer
- Eine starke Anmeldung allein verhindert diesen Missbrauch nicht
- Schutz: verschlüsselte Verbindung, sichere Endgeräte, kurze Sitzungen
- Fachbegriff: #strong[Session Hijacking]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Beim #strong[Session Hijacking] erbeutet ein Angreifer dein gültiges
Sitzungstoken (z. B. durch Schadsoftware auf dem PC oder gefälschte
Anmeldeseiten). Danach surft er mit deinen Rechten im System herum.
#emph[Wichtige Klausur-Erkenntnis:] #strong[MFA
(Zwei-Faktor-Authentifizierung) schützt hier NICHT!] Warum? Weil MFA nur
beim Login an der Haustür geprüft wird. Wenn der Angreifer dir den
Schlüsselbund (das Token) erst #emph[nach] dem Aufschließen aus der
Tasche zieht, ist die Tür bereits offen! #emph[Schutz:] Kurze
Sitzungsdauern, automatische Abmeldung und
#strong[Step-up-Authentifizierung] (für heikle Aktionen wie
Überweisungen muss man nochmals einen Code eingeben).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären können, warum MFA vor Session
  Hijacking nach dem Login nicht schützt, und wirksame Gegenmaßnahmen
  nennen (#strong[kurze Token-Lebensdauer, Re-Authentifizierung /
  Step-up-Auth]).
- #strong[Typische Klausurfalle:] MFA als Allheilmittel für jede Phase
  eines Angriffs bezeichnen. MFA schützt den #strong[Initial Login],
  nicht das gestohlene Token danach!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum kann ein Angreifer eine Web-Sitzung mittels
gestohlenem Session-Cookie übernehmen, selbst wenn das Benutzerkonto
durch Mehrfaktor-Authentifizierung (MFA) geschützt ist?"
#strong[Antwort:]

- #strong[MFA schützt nur den Anmeldevorgang:] Die Zwei-Faktor-Prüfung
  erfolgt einmalig beim Erzeugen der Sitzung.
- #strong[Token ersetzt Authentifizierung:] Das ausgegebene
  Sitzungstoken beweist dem Server den bereits erfolgreichen Login; wer
  das Token besitzt, umgeht alle vorgeschalteten Anmeldeschritte
  (#strong[Session Hijacking]).

]
#pagebreak(weak: true)
= Die Anwendung schafft Vertrauen
<die-anwendung-schafft-vertrauen>
- Nutzer sehen Namen, Inhalte und Marken -- nicht die Netzwerkprotokolle
  dahinter
- Vertraute Oberflächen können Sicherheit vermitteln, aber auch
  gefälscht werden
- Anwendungen verarbeiten wertvolle Daten und geschäftliche
  Transaktionen
- Technik, Prozesse und Aufmerksamkeit der Nutzer müssen zusammenspielen

#quote-box[
Eine funktionierende Verbindung garantiert noch kein vertrauenswürdiges
Gegenüber.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Nutzer achten im Browser auf bekannte Logos, Farben und das grüne
Vorhängeschloss in der Adresszeile. #emph[Der fatale Denkfehler:]
#strong[Das Schloss-Symbol bedeutet NICHT, dass die Webseite seriös
ist!] Es bedeutet ausschließlich: „Die Verbindung zu diesem Server ist
verschlüsselt." Ein Betrüger kann sich in 30 Sekunden ein kostenloses,
offizielles TLS-Zertifikat für `sparkasse-sicherheits-login.de` holen.
Seine Fake-Seite hat ein perfektes Schloss! Sicherheit erfordert daher
immer die Kombination aus technischer Prüfung, eindeutigen Domains und
geschulten Nutzern.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Aussage „Eine verschlüsselte
  Verbindung garantiert kein vertrauenswürdiges Gegenüber" anhand eines
  Beispiels (Phishing-Webseite mit gültigem TLS-Zertifikat) begründen
  können.
- #strong[Typische Klausurfalle:] Vertraulichkeit (Verschlüsselung des
  Kanals) mit Authentizität/Seriosität des Inhabers gleichsetzen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Ein Mitarbeiter behauptet: 'Die Webseite zeigt ein
Schloss-Symbol im Browser, also ist sie sicher und vertrauenswürdig.'
Nehmen Sie kritisch Stellung zu dieser Aussage." #strong[Antwort:]

- #strong[Aussage ist falsch:] Das Schloss-Symbol bestätigt lediglich,
  dass die Verbindung zum aufgerufenen Server per #strong[TLS
  verschlüsselt] ist (#strong[Schutz vor Abhören auf dem Transportweg]).
- #strong[Keine Seriositätsprüfung:] Jeder Angreifer kann für
  betrügerische Domains (z. B. Phishing-Seiten) gültige TLS-Zertifikate
  beantragen; das Schloss sagt nichts über die #strong[Echtheit oder
  Gutartigkeit des Betreibers] aus.

]
#pagebreak(weak: true)
= Beispiel: Der richtige Name, das falsche Ziel
<beispiel-der-richtige-name-das-falsche-ziel>
- Das #strong[Domain Name System (DNS)] übersetzt Namen in technische
  Zieladressen
- Manipulierte Antworten können Nutzer zu einem falschen Dienst leiten
- Der eingegebene Name kann dabei korrekt erscheinen
- Mögliche Folgen: Zugangsdaten- oder Zahlungsdatendiebstahl
- Fachbegriffe: #strong[DNS-Spoofing] und #strong[Cache-Poisoning]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Das #strong[Domain Name System (DNS)] ist das Telefonbuch des Internets:
Du tippst `meinebank.de` ein, und DNS liefert die IP-Adresse
`192.0.2.1`.

- #strong[DNS-Spoofing:] Ein Angreifer im selben Netz fängt deine
  Anfrage ab und ruft schnell: „Die Bank liegt auf meiner IP!". Du
  tippst die richtige Adresse ein, landest aber auf der Betrüger-Kopie.
- #strong[Cache-Poisoning:] Der Angreifer vergiftet den Zwischenspeicher
  (Cache) des Internet-Anbieters. Ab jetzt werden #strong[tausende
  Kunden] tagelang zur gefälschten Bank geleitet! #emph[Die Lösung:]
  #strong[DNSSEC] versieht DNS-Antworten mit einer digitalen Signatur --
  gefälschte Antworten fliegen sofort auf.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] DNS-Spoofing (lokal, einzelnes Opfer)
  und Cache-Poisoning (Resolver-Cache vergiftet, massenhafte Opfer)
  unterscheiden und #strong[DNSSEC] als Schutzmaßnahme nennen können.
- #strong[Typische Klausurfalle:] Den Fehler beim Nutzer suchen. Bei
  DNS-Angriffen gibt der Nutzer die #strong[exakt richtige Webadresse]
  ein -- das System leitet ihn technisch falsch um!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Grenzen Sie 'DNS-Spoofing' von 'DNS-Cache-Poisoning' ab
und nennen Sie die Standardtechnologie zur Absicherung der
Namensauflösung." #strong[Antwort:]

- #strong[DNS-Spoofing:] Fälschen einer einzelnen DNS-Antwort für einen
  bestimmten Client (meist im lokalen Netz).
- #strong[DNS-Cache-Poisoning:] Einschleusen gefälschter DNS-Einträge in
  den #strong[Zwischenspeicher (Cache) eines DNS-Resolvers/Servers],
  wodurch #strong[alle nachfolgenden Nutzer] dieses Servers unbemerkt
  auf gefälschte Zieladressen geleitet werden.
- #strong[Schutztechnologie:] #strong[DNSSEC (Domain Name System
  Security Extensions)] durch kryptografische Signaturen von
  DNS-Einträgen.

]
#pagebreak(weak: true)
= Ein Muster, verschiedene Angriffswege
<ein-muster-verschiedene-angriffswege>
- Angreifer positioniert sich unbemerkt zwischen zwei
  Kommunikationspartnern
- Er kann Daten mitlesen, verändern oder an ein falsches Ziel leiten
- Der Einstieg ist über WLAN, lokales Netz oder Namensauflösung möglich
- #strong[Ende-zu-Ende-Verschlüsselung] schützt den Inhalt über
  unsichere Wege

#quote-box[
Fachbegriff: #strong[Man-in-the-Middle (MITM)]

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
#strong[Man-in-the-Middle (MITM)] -- heute oft neutral
#strong[Adversary-in-the-Middle (AiTM)] genannt -- ist kein einzelnes
Tool, sondern eine strategische #strong[Position]: Der Angreifer sitzt
heimlich zwischen zwei Partnern, liest alles mit oder ändert Nachrichten
nach Belieben. #emph[Viele Wege führen zum selben Ziel:]

- Auf Schicht 2 über #strong[ARP-Spoofing] oder ein gefälschtes WLAN
  (Evil Twin).
- Auf Schicht 3 über #strong[BGP-Hijacking].
- Auf Schicht 7 über #strong[DNS-Spoofing]. #emph[Die stärkste Waffe
  dagegen:] #strong[Ende-zu-Ende-Verschlüsselung mit strikter
  Zertifikatsprüfung (TLS)]. Der Angreifer kann dazwischensitzen wie er
  will -- er hat den privaten Schlüssel nicht und kann die Daten weder
  lesen noch unbemerkt verändern.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] MITM als #strong[übergeordnete Position]
  definieren, mindestens drei verschiedene Wege dorthin aufzählen und
  erklären, wie TLS dagegen schützt.
- #strong[Typische Klausurfalle:] MITM einer einzelnen Schicht zuordnen.
  MITM kann auf #strong[Layer 2, Layer 3 oder Layer 7] entstehen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Nennen Sie drei verschiedene technische Wege auf
unterschiedlichen Netzwerkschichten, über die ein Angreifer eine
Man-in-the-Middle-Position erlangen kann." #strong[Antwort:]

+ #strong[Layer 2 (Zugang):] #strong[ARP-Spoofing] oder Bereitstellung
  eines gefälschten WLAN-Access-Points (#strong[Evil Twin]).
+ #strong[Layer 3 (Transport):] #strong[BGP-Hijacking] (Umleitung des
  IP-Routings im Internet).
+ #strong[Layer 7 (Anwendung):] #strong[DNS-Spoofing / Cache-Poisoning]
  (Fälschung der Namensauflösung).

]
#pagebreak(weak: true)
= Wenn normale Anfragen zum Angriff werden
<wenn-normale-anfragen-zum-angriff-werden>
- Angreifer senden massenhaft scheinbar legitime Anfragen an eine
  Anwendung
- Einzelne Anfragen wirken unauffällig, ihre Menge überlastet den Dienst
- Botnetze verteilen den Verkehr auf viele Geräte und Regionen
- Schutz erfordert Erkennung, Skalierung und klare Prioritäten für
  kritische Dienste
- Fachbeispiel: #strong[HTTP-Flood]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Bei einer #strong[HTTP-Flood] (Layer-7-DDoS) schicken hunderttausende
infizierte Computer (Botnetze) scheinbar völlig normale Anfragen an
einen Webserver -- z. B. starten sie gleichzeitig aufwendige
Datenbank-Suchen oder rufen den Produktkatalog ab. #emph[Warum ist das
so schwer abzuwehren?] Jede einzelne Anfrage ist formal 100 % legal!
Eine normale Firewall sieht ganz normalen Webverkehr auf Port 443. Aber
die Datenbank bricht unter der Last zusammen, weil jede Anfrage viel
Rechenleistung frisst (#strong[Asymmetrie des Aufwands]). #emph[Schutz:]
#strong[Web Application Firewalls (WAF)], Bot-Erkennung (z. B. CAPTCHAs,
Verhaltensanalyse) und Ratenbegrenzung (#strong[Rate Limiting]).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Unterschied zwischen volumetrischen
  Angriffen (Layer 3/4, rohe Bandbreite) und #strong[Layer-7-Angriffen
  (HTTP-Flood, Anwendungsressourcen)] erklären können.
- #strong[Typische Klausurfalle:] Annehmen, eine Netzwerk-Firewall könne
  eine HTTP-Flood stoppen. Eine Layer-3/4-Firewall sieht nur erlaubte
  TCP-Port-443-Pakete -- man braucht eine #strong[WAF]!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum versagt eine klassische Netzwerk-Firewall bei der
Abwehr einer HTTP-Flood und welche spezialisierte Sicherheitskomponente
wird stattdessen benötigt?" #strong[Antwort:]

- #strong[Versagen der Netzwerk-Firewall:] Die Anfragen sind formal
  gültige HTTP/HTTPS-Pakete auf erlaubten Standardports (Port 80/443);
  die Firewall kann bösartige Absichten nicht auf Anwendungsebene
  interpretieren.
- #strong[Lösung:] Eine #strong[Web Application Firewall (WAF)] oder
  spezialisierte DDoS-Schutzdienste, die das Verhalten analysieren,
  Bot-Muster erkennen und #strong[Rate Limiting / Challenge-Response
  (CAPTCHA)] erzwingen.

]
#pagebreak(weak: true)
= Verteidigung im Überblick
<verteidigung-im-überblick>
== Mehrere Schutzlinien gleichzeitig
<mehrere-schutzlinien-gleichzeitig>
#didaktik-box(title: [Worum geht es in diesem Kapitel?])[
Im Finale führen wir alle Puzzleteile zu einem ganzheitlichen
Schutzkonzept zusammen: Kein Produkt der Welt schützt vor allem. Wir
lernen das goldene Prinzip #strong[Defense in Depth] kennen, ordnen
Maßnahmen nach ihrer Wirkung (Vorbeugen, Begrenzen, Erkennen, Reagieren,
Lernen) und klären den Unterschied zwischen Netzwerksegmentierung und
Zero Trust.

]
#exam-box(title: [Modul-Lernziel])[
Du kannst ein mehrschichtiges Sicherheitskonzept nach dem
Defense-in-Depth-Prinzip entwerfen, Schutzmaßnahmen nach technischen,
organisatorischen und personellen Kriterien strukturieren und
Beratungsgespräche führen.

]
#quiz-box(title: [Typische Schwerpunkte])[
Defense in Depth Definition + Schichten, IDS vs.~IPS (Erkennen
vs.~Blockieren), Segmentierung (VLANs, Mikrosegmentierung) und das
5-Stufen-Modell der Wirkung.

]
#pagebreak(weak: true)
= Defense in Depth
<defense-in-depth>
- #strong[Defense in Depth] kombiniert mehrere unabhängige
  Schutzmaßnahmen
- Vorbeugen, Erkennen, Begrenzen und Wiederherstellen ergänzen sich
- Versagt eine Maßnahme, verhindert die nächste den Totalschaden
- Menschen, Prozesse, Technik und Dienstleister tragen gemeinsam bei

#quote-box[
Nicht die Anzahl der Produkte zählt, sondern das Zusammenspiel der
Kontrollen.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
#strong[Defense in Depth] bedeutet: Baue niemals nur eine einzige
Schutzmauer! Wenn du dich nur auf deine Firewall verlässt und sie
versagt, ist sofort alles verloren. Stattdessen staffeln wir unabhängige
Schutzebenen hintereinander: Firewall am Rand ➔ Netzwerksegmentierung im
Inneren ➔ Virenschutz & Patching auf dem PC ➔ Verschlüsselung &
Rechteprüfung an der Datei. #emph[Schweizer-Käse-Modell:] Jede
Sicherheitsschicht hat Löcher (Schwachstellen). Aber wenn man mehrere
Scheiben hintereinanderlegt, deckt eine Scheibe die Löcher der anderen
ab -- ein Angriff dringt nicht bis zu den Kronjuwelen durch.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Das Prinzip #strong[Defense in Depth]
  definieren, von reiner „Produktvielfalt" abgrenzen und die
  Notwendigkeit #strong[unabhängiger Kontrollen] betonen.
- #strong[Typische Klausurfalle:] Drei Firewalls desselben Herstellers
  hintereinander zu schalten. Echte Defense in Depth braucht
  #strong[voneinander unabhängige Kontrollen] auf verschiedenen Ebenen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Definieren Sie das Sicherheitsprinzip 'Defense in
Depth' und erklären Sie, warum die Unabhängigkeit der eingesetzten
Schutzmaßnahmen entscheidend ist." #strong[Antwort:]

- #strong[Definition:] Gestaffeltes Sicherheitskonzept aus
  #strong[mehreren redundanten, aufeinander aufbauenden Schutzschichten]
  (z. B. Perimeter, Netzwerk, Host, Daten), damit das Versagen einer
  Schicht nicht zum Gesamtschaden führt.
- #strong[Unabhängigkeit:] Verhindert einen #strong[Single Point of
  Failure]\; hängen alle Maßnahmen von derselben Technologie oder
  demselben System ab, kann ein einziger Fehler alle Schutzlinien
  gleichzeitig aushebeln.

]
#pagebreak(weak: true)
= Defense in Depth als Diagramm
<defense-in-depth-als-diagramm>
#figure(image("img/defense-in-depth.svg", alt: "Defense in Depth als Diagramm"),
  caption: [
    Defense in Depth als Diagramm
  ]
)

#didaktik-box(title: [Was zeigt uns diese Darstellung?])[
Die Grafik visualisiert Defense in Depth als vier ineinander
verschachtelte Zwiebelschalen:

+ #strong[Perimeter (Außen):] Firewall fängt grobe Angriffe aus dem
  Internet ab.
+ #strong[Netzwerk (Mitte außen):] Segmentierung & VLANs stoppen die
  Ausbreitung (Lateral Movement).
+ #strong[Host (Mitte innen):] Endgeräteschutz (EDR, Patches) sichert
  den einzelnen Laptop/Server.
+ #strong[Daten (Kern):] Starke Verschlüsselung und Zugriffsrechte
  schützen das eigentliche Juwel -- selbst wenn alle drei äußeren Mauern
  gefallen sind!

]
#exam-box(title: [Klausurrelevanz (Transferaufgabe!)])[
- #strong[Was du können musst:] Die vier Schalen von außen nach innen
  benennen und für jede Ebene eine typische Maßnahme sowie deren
  Restrisiko erklären können.
- #strong[Kritische Reflexion:] Das Burg-Modell muss heute durch mobile
  Kontrollen und Zero Trust ergänzt werden, da viele Hosts gar nicht
  mehr hinter dem Perimeter stehen.

]
#quiz-box(title: [Typische Fallfrage & Lösung])[
#strong[Frage:] „Ein Angreifer überwindet die externe Firewall über eine
legitime HTTPS-Verbindung mit gestohlenen Zugangsdaten. Welche zwei
inneren Schutzschichten greifen laut Defense-in-Depth-Modell als
Nächstes?" #strong[Antwort:]

- #strong[Netzwerk-Ebene:] #strong[Segmentierung (VLANs / ACLs)]
  verhindert, dass der kompromittierte Einstiegspunkt andere sensible
  Bereiche (z. B. Datenbanken, Produktionsnetz) erreicht.
- #strong[Host-/Daten-Ebene:] #strong[Least Privilege /
  Autorisierungsprüfung und Verschlüsselung] stellen sicher, dass mit
  den gestohlenen Rechten nur minimale Daten eingesehen werden können.

]
#pagebreak(weak: true)
= Schutzmaßnahmen nach ihrer Wirkung
<schutzmaßnahmen-nach-ihrer-wirkung>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Ziel], [Beispiele], [Nutzen],),
    table.hline(),
    [#strong[Vorbeugen]], [sichere Konfiguration, Firewall,
    Verschlüsselung], [Eintritt erschweren],
    [#strong[Begrenzen]], [Segmentierung, minimale Rechte], [Ausbreitung
    stoppen],
    [#strong[Erkennen]], [Protokollierung,
    Netzwerküberwachung], [Vorfälle sichtbar machen],
    [#strong[Reagieren]], [Notfallplan,
    DDoS-Dienstleister], [Ausfallzeit verkürzen],
    [#strong[Lernen]], [Tests, Übungen,
    Verbesserungsprozess], [Wiederholung vermeiden],
  )]
  , kind: table
  )

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Ein gutes Sicherheitskonzept ist wie eine Notfallkette im Krankenhaus --
es reicht nicht, nur Vitamine zu schlucken (Vorbeugen), man braucht auch
Diagnostik (Erkennen) und eine Notaufnahme (Reagieren):

- #strong[Vorbeugen (Prävention):] Firewall, Verschlüsselung, Härtung
  (Eintritt verhindern).
- #strong[Begrenzen (Kapselung):] Segmentierung, Least Privilege
  (Schaden eindämmen).
- #strong[Erkennen (Detektion):] SIEM, IDS, Logging (Angriff bemerken).
- #strong[Reagieren (Response):] Notfallplan, DDoS-Mitigation (Systeme
  retten).
- #strong[Lernen (Recovery / Review):] Post-Mortem, Backup-Tests (beim
  nächsten Mal besser sein). #emph[Wichtig:] #strong[IDS (Detection)]
  schlägt nur Alarm; #strong[IPS (Prevention)] greift aktiv ein und
  blockiert verdächtigen Verkehr sofort!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Unterschied zwischen #strong[IDS]
  (nur erkennen/melden) und #strong[IPS] (aktiv blockieren) kennen und
  Maßnahmen den 5 Wirkungsstufen zuordnen können.
- #strong[Typische Klausurfalle:] Glauben, Erkennung (Logging/SIEM)
  allein schütze das System. Ohne definierten #strong[Reaktionsprozess]
  verpufft jeder Alarm wirkungslos!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Unterscheiden Sie ein Intrusion Detection System (IDS)
von einem Intrusion Prevention System (IPS) und ordnen Sie beide den
jeweiligen Wirkungskategorien zu." #strong[Antwort:]

- #strong[IDS:] Überwacht den Datenverkehr passiv und generiert Alarme
  bei verdächtigen Mustern; Wirkungskategorie: #strong[Erkennen
  (Detektion)].
- #strong[IPS:] Sitzt aktiv im Datenstrom (inline) und kann verdächtige
  Pakete oder Verbindungen in Echtzeit verwerfen; Wirkungskategorie:
  #strong[Vorbeugen / Abwehren (Prävention)].

]
#pagebreak(weak: true)
= Netzwerksegmentierung & Zero Trust
<netzwerksegmentierung-zero-trust>
- #strong[Segmentierung] trennt Bereiche mit unterschiedlichen Aufgaben
  und Risiken
- Beispiel: Gäste, Büroarbeitsplätze, Produktion und kritische Server
- #strong[Zero Trust] prüft Zugriffe anhand von Identität, Gerät und
  Kontext
- Gemeinsam reduzieren beide die unkontrollierte Ausbreitung eines
  Angriffs

#quote-box[
#strong[Beratungsfrage:] Was kann ein kompromittierter Arbeitsplatz im
internen Netz erreichen?

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
- #strong[Netzwerksegmentierung:] Das Prinzip der
  #strong[Brandschutztüren]. Wenn im Büro ein Feuer ausbricht (ein
  Laptop wird mit Ransomware infiziert), fällt die Brandschutztür zu --
  das Feuer greift nicht auf die Fabrikhalle oder die Finanzdaten über.
  Technisch gelöst über VLANs und interne Firewalls.
- #strong[Zero Trust:] Die Weiterentwicklung. Hier gibt es nicht nur
  Zonen, sondern jede einzelne Ressource verlangt bei jedem Zugriff den
  Ausweis: „Bist du der Admin? Ist dein Virenscanner aktuell? Ja? Dann
  darfst du für 5 Minuten rein." #emph[Zusammenfassung:] Segmentierung
  kontrolliert die #strong[Wege im Netz]\; Zero Trust kontrolliert den
  #strong[Zugriff auf die Ressourcen].

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären können, warum Segmentierung die
  wirksamste Maßnahme gegen #strong[Ransomware-Ausbreitung (Lateral
  Movement)] ist, und Segmentierung sauber von Zero Trust abgrenzen.
- #strong[Typische Klausurfalle:] Behaupten, Segmentierung verhindere
  den Einbruch. Segmentierung verhindert nicht das Feuer, sondern den
  #strong[Flächenbrand]!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum ist die Netzwerksegmentierung eine der
wirksamsten Einzelmaßnahmen zur Begrenzung von Ransomware-Schäden in
Unternehmen?" #strong[Antwort:]

- #strong[Eindämmung von Lateral Movement:] Ransomware breitet sich nach
  dem Erstbefall automatisiert über offene Netzwerkverbindungen im
  lokalen Netz aus.
- #strong[Schadensbegrenzung:] Durch Segmentierung (z. B. Trennung von
  Office-Clients, Servern und Backups) wird die Ausbreitung an internen
  Firewall-Grenzen gestoppt; ein Befall bleibt auf das infizierte
  Subnetz beschränkt (#strong[Brandschutz-Prinzip]).

]
#pagebreak(weak: true)
= Zusammenfassung
<zusammenfassung>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Bereich], [Kernrisiko], [Leitfrage],),
    table.hline(),
    [#strong[Zugang]], [fremde oder kompromittierte Geräte], [Wer oder
    was darf sich verbinden?],
    [#strong[Transport]], [Umleitung, Mitlesen, Überlastung], [Wie
    bleiben Daten und Dienste geschützt?],
    [#strong[Anwendung]], [Täuschung und Sitzungsübernahme], [Ist das
    Gegenüber wirklich vertrauenswürdig?],
    [#strong[Organisation]], [unklare Reaktion und Abhängigkeiten], [Wer
    handelt bei einem Vorfall?],
  )]
  , kind: table
  )

#quote-box[
#strong[Merksatz:] Netzwerksicherheit schützt Geschäftskontinuität,
Daten und Vertrauen.

]
#didaktik-box(title: [Schnell-Check])[
- #strong[Zugang:] Schütze Hardware, Dosen und WLAN (WPA3, 802.1X). Sei
  dir bewusst: ARP und MAC bieten kein Vertrauen!
- #strong[Transport:] Gehe davon aus, dass der Weg durchs Internet
  unsicher ist. Vertraue keiner IP-Adresse blind (IP-Spoofing,
  BGP-Hijacking) und nutze konsequent #strong[TLS].
- #strong[Anwendung:] Schütze Sitzungstoken (HttpOnly, Secure) und
  sichere die Namensauflösung (DNSSEC). Das Schloss im Browser
  garantiert keine Seriosität!
- #strong[Organisation & Architektur:] Setze auf #strong[Defense in
  Depth], #strong[Segmentierung] und #strong[Zero Trust]. Technik ohne
  Notfallprozesse versagt im Ernstfall.

]
#exam-box(title: [Prüfungs-Checkliste])[
- ☐ Kannst du die Angriffe der Dreiteilung #emph[Zugang / Transport /
  Anwendung] zuordnen?
- ☐ Kannst du ARP-Spoofing und SYN-Flood Schritt für Schritt erklären?
- ☐ Weißt du, warum MFA nicht gegen Session Hijacking nach dem Login
  schützt?
- ☐ Beherrschst du die Begriffe #emph[Defense in Depth], #emph[Zero
  Trust], #emph[SLA], #emph[RTO] und #emph[RPO]?
- ☐ Kannst du die Brandschutztüren-Analogie für Netzwerksegmentierung
  erklären?

]
#quiz-box(title: [Blitzfragen zur Selbstkontrolle])[
+ #emph[Welches Schutzziel der CIA-Triade wird bei einem BGP-Hijacking
  verletzt, wenn der Verkehr ins Leere geleitet wird vs.~wenn er
  heimlich mitgelesen wird?] ➔ Ins Leere = #strong[Verfügbarkeit]\;
  Mitlesen = #strong[Vertraulichkeit] (und ggf. Integrität).

+ #emph[Warum hilft DNSSEC gegen Cache-Poisoning?] ➔ Weil DNSSEC die
  DNS-Einträge mit #strong[kryptografischen Signaturen] versieht;
  gefälschte Antworten des Angreifers werden vom Resolver verworfen.

]
#pagebreak(weak: true)
= Diskussionsfragen
<diskussionsfragen>
- Welcher netzwerkbedingte Ausfall hätte bei eurem Partnerunternehmen
  die größten Folgen?
- Mit welchen drei Fragen würdet ihr ein erstes Kundengespräch beginnen?
- Wo könnte sich ein Angreifer nach einem erfolgreichen Einstieg weiter
  ausbreiten?
- Wie würdet ihr den Nutzen von Segmentierung ohne Fachbegriffe
  erklären?
- Welche Schutzmaßnahme benötigt zwingend einen organisatorischen
  Prozess?

#didaktik-box(title: [Beratungs- & Diskussionsfokus])[
Diese Fragen spiegeln reale Kundengespräche im IT-Consulting wider: Ein
Geschäftsführer fragt nicht nach Portnummern, sondern will wissen: „Was
kostet mich ein Tag Stillstand? Warum reichen unsere alten Firewalls
nicht mehr? Wie verhindern wir, dass der Hacker vom Drucker an die
Buchhaltung kommt?"

]
#exam-box(title: [Lernziel (Transfer & Argumentation)])[
Du kannst technische Schutzmaßnahmen in überzeugende geschäftliche
Argumente übersetzen, ohne in unverständlichen Fachjargon zu verfallen.

]
#quiz-box(title: [Typische Beratungsfragen & Kernargumente])[
- #strong[Frage 1: „Wie erkläre ich Segmentierung ohne Fachchinesisch?"]
  ➔ #emph[Kernargument:] #strong[Brandschutztüren-Prinzip.] Wenn in der
  Teeküche ein Papierkorb brennt, brennt nicht gleich das ganze
  Fabrikgebäude ab.

- #strong[Frage 2: „Warum reicht unsere Firewall nicht aus?"] ➔
  #emph[Kernargument:] Die Firewall steht nur am Haupteingang. Wenn der
  Angreifer per Phishing oder über das Homeoffice eines Mitarbeiters
  bereits im Wohnzimmer steht, schützt der Zaun im Vorgarten nicht mehr
  (#strong[Notwendigkeit von Zero Trust & internen Kontrollen]).

]
