#set page(
  paper: "a4",
  margin: (top: 1.8cm, bottom: 1.8cm, left: 2.0cm, right: 2.0cm),
  header: context {
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8.5pt, fill: rgb("#64748b"), weight: "bold")[DHBW Karlsruhe · IT-Sicherheit]],
        align(right)[#text(size: 8.5pt, fill: rgb("#94a3b8"))[01-01 · Cia-triade]]
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

= IT-Security
<it-security>
#didaktik-box(title: [Das große Ganze (Warum IT-Sicherheit jeden betrifft)])[
IT-Sicherheit ist längst kein reines Technik-Thema mehr für Spezialisten
im Serverraum, sondern das Fundament jeder modernen Organisation. Wenn
IT-Systeme ausfallen oder Daten manipuliert werden, stehen
Produktionsbänder still, Krankenhäuser können keine Notfallpatienten
versorgen und Unternehmen droht der Ruin. #emph[Wichtiges Grundprinzip:]
IT-Sicherheit ist kein fertiges Produkt, das man kauft („wir stellen
jetzt eine Firewall hin und sind sicher"), sondern ein permanenter
Prozess aus Technik, Organisation und dem Faktor Mensch.

]
#exam-box(title: [Orientierung & Roter Faden])[
Diese Einführungsvorlesung spannt den Bogen von einem realen
historischen Weckruf (dem ILOVEYOU-Wurm) hin zum wichtigsten
theoretischen Denkwerkzeug der gesamten Cybersicherheit: der
#strong[CIA-Triade] (Vertraulichkeit, Integrität, Verfügbarkeit). Alle
nachfolgenden Vorlesungsthemen (Kryptographie, IAM, Netzwerke, ISMS)
bauen direkt auf diesen Schutzzielen auf.

]
#quiz-box(title: [Prüfungsfokus])[
Die drei Schutzziele der CIA-Triade bilden die absolute Basiskompetenz
der Klausur. Du musst sie auf Deutsch und Englisch benennen, voneinander
abgrenzen und in vorgegebenen Praxisszenarien (z. B. Webshop,
Online-Banking) sofort bestimmen können, welches Schutzziel bedroht oder
verletzt wurde.

]
#pagebreak(weak: true)
= Inhalte
<inhalte>
- CIA-Triade und Grundbegriffe
- Kryptographie
- Identity & Access Management (IAM)
- Secure Software Development Lifecycle (SSDLC)
- Netzwerk- und IoT-Sicherheit
- ISMS - Information Security Management System
- Schwachstellen- und Patchmanagement
- KI-Sicherheit

#didaktik-box(title: [Strukturüberblick (Der Vorlesungsfahrplan)])[
Die Vorlesung betrachtet IT-Sicherheit schichtweise von den Grundlagen
bis zum Gesamtunternehmen:

- #strong[Kryptographie & IAM:] Die handwerklichen Werkzeuge
  (Verschlüsselung, Signaturen, Identitätsprüfung).
- #strong[SSDLC:] Sicherheit von Anfang an in Software einbauen statt
  hinterher flicken (#emph[Security by Design]).
- #strong[Netzwerk, IoT & KI:] Spezifische Technologien und ihre
  besonderen Angriffsflächen.
- #strong[ISMS & Patchmanagement:] Die organisatorische Klammer, damit
  Sicherheit im Unternehmen dauerhaft gelebt wird.

]
#exam-box(title: [Lern-Strategie])[
- #strong[Fundament (Höchste Priorität):] CIA-Triade,
  Kryptographie-Grundlagen und Identity & Access Management. Diese
  Konzepte sind die Vokabeln, ohne die du spätere Themen nicht
  verstehst.
- #strong[Prozess- & Governance-Ebene:] ISMS, SSDLC und
  Schwachstellenmanagement erfordern Verständnis von Abläufen und
  Verantwortlichkeiten (#emph[Defense in Depth]).

]
#quiz-box(title: [Typische Klausurverknüpfung])[
Prüfer verknüpfen Vorlesungsthemen gerne mit den Schutzzielen: Du musst
erklären können, welches CIA-Ziel durch welche Maßnahme geschützt wird
(z. B. TLS/Verschlüsselung $arrow.r$ Vertraulichkeit; Code
Signing/Prüfsumme $arrow.r$ Integrität; Server-Redundanz/Cluster
$arrow.r$ Verfügbarkeit).

]
#pagebreak(weak: true)
= Sicherheitsmaßnahmen im Unternehmen
<sicherheitsmaßnahmen-im-unternehmen>
Welche Maßnahmen (Prozesse, Regeln, Tools, Schulungen,… ) werden in
Ihrem Unternehmen ergriffen, um sich vor IT-Sicherheitsvorfällen zu
schützen?

#quote-box[
#strong[Denkanstoß:] Welche Maßnahme verhindert einen Angriff, welche
erkennt ihn und welche begrenzt den Schaden?

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Sicherheit stützt sich nie auf eine einzelne Mauer, sondern auf
gestaffelte Verteidigungslinien (#strong[Defense in Depth]).
#emph[Alltagsvergleich:] Eine mittelalterliche Burg verlässt sich nicht
nur auf das Burgtor. Es gibt einen Wassergraben, eine Zugbrücke,
Außenmauern, Fallgitter und den Burgfried. Versagt eine Schicht, hält
die nächste den Angreifer auf. Dazu unterscheiden wir Maßnahmen nach
ihrem Wirkungszeitpunkt:

+ #strong[Präventiv (Verhindern):] Bevor etwas passiert (z. B. Firewall,
  Berechtigungsregeln, Mitarbeiterschulung).
+ #strong[Detektiv (Erkennen):] Während etwas passiert (z. B.
  Einbruchserkennung/IDS, Alarmierung bei Logins nachts um 3 Uhr).
+ #strong[Reaktiv (Beheben):] Nachdem etwas passiert ist (z. B.
  Notfallplan, befallene Rechner isolieren, Backup einspielen).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Sicherheitsmaßnahmen den drei
  Zeitpunkten (präventiv, detektiv, reaktiv) sowie den drei Dimensionen
  (technisch, organisatorisch, personell / TOMs) fehlerfrei zuordnen.
- #strong[Typische Klausurfalle:] Ein Backup wird oft fälschlicherweise
  als „präventiv" bezeichnet. Ein Backup verhindert aber keinen
  Cyberangriff! Es ist eine #strong[reaktive Maßnahme], um nach einem
  Vorfall die Verfügbarkeit der Daten wiederherzustellen.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Nennen Sie für ein Unternehmensnetzwerk je eine
technische präventive, eine technische detektive und eine
organisatorische reaktive Maßnahme und erläutern Sie kurz deren
jeweilige Funktion." #strong[Antwort:]

- #strong[Technisch präventiv:] #strong[Firewall /
  Multifaktor-Authentifizierung (MFA)] -- blockiert unberechtigte
  Verbindungen bzw. verhindert unbefugten Zugriff im Vorfeld.
- #strong[Technisch detektiv:] #strong[SIEM / IDS (Intrusion Detection
  System)] -- überwacht Protokolldaten in Echtzeit und schlägt bei
  verdächtigen Anomalien Alarm.
- #strong[Organisatorisch reaktiv:] #strong[Incident-Response-Plan
  (Notfallhandbuch)] -- definiert feste Zuständigkeiten und
  Prozessschritte für das Krisenteam zur schnellen Schadensbegrenzung
  nach einem Vorfall.

]
#pagebreak(weak: true)
= ILOVEYOU
<iloveyou>
== Der Urknall der IT-Sicherheit
<der-urknall-der-it-sicherheit>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Der Urknall)])[
Der Fall ILOVEYOU aus dem Jahr 2000 ist der Prototyp eines verheerenden
Sicherheitsvorfalls. Er zeigt eindrucksvoll: Ein Angriff braucht oft gar
keine genialen Hackerfähigkeiten, wenn menschliche Neugier, fatale
Systemeinstellungen und unbeschränkte Schnittstellen perfekt
ineinandergreifen. #emph[Die Kernaussage:] Ein einzelner Faktor hätte
die Welt nicht lahmgelegt -- erst die unglückliche Kette aus Mensch,
Betriebssystem und Mailprogramm führte zur Katastrophe.

]
#exam-box(title: [Modul-Lernziel])[
Du verstehst anhand dieses Falls, wie Angreifer Schwachstellenketten
(#emph[Kill Chains]) ausnutzen. Du lernst zu analysieren, wo der Mensch
manipuliert wurde (Social Engineering), wo die Software versagte
(Dateiendungen, fehlende Sandbox) und warum Schnittstellen (APIs)
geschützt werden müssen.

]
#quiz-box(title: [Typische Schwerpunkte])[
In Prüfungen werden Fallstudien als Szenarioaufgaben genutzt: Du musst
die einzelnen Stationen der Angriffskette skizzieren und für jede
Station begründen können, mit welcher modernen Kontrollmaßnahme man die
Kette heute unterbrechen würde.

]
#pagebreak(weak: true)
= Steckbrief: VBS.LoveLetter.A
<steckbrief-vbs.loveletter.a>
- #strong[Datum:] 4. Mai 2000 (Ausgangspunkt: Philippinen)

- #strong[Schaden & Ausmaß:] 5--10 Mrd. USD Schaden, \~10 % aller
  Rechner weltweit infiziert

- #strong[Datei & UI-Falle:] `LOVE-LETTER-FOR-YOU.TXT.vbs` \ (Endung
  `.vbs` standardmäßig ausgeblendet $arrow.r$ wirkte wie `.TXT`)

- #strong[System:] Windows Script Host (WSH) führte VBScript direkt ohne
  Sandbox aus

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Zwei fatale Fehlkonstruktionen machten diesen Wurm weltweit so
zerstörerisch:

+ #strong[Die optische Täuschung:] Windows blendete Dateiendungen
  standardmäßig aus. Aus der gefährlichen Datei
  `LOVE-LETTER-FOR-YOU.TXT.vbs` wurde im Dateimanager optisch ein
  harmloser `LOVE-LETTER-FOR-YOU.TXT`. Die Nutzer dachten, sie öffnen
  ein einfaches Textdokument!
+ #strong[Keine Sandbox:] Der #emph[Windows Script Host] führte das
  VBScript sofort und ohne jede Isolierung mit vollen Benutzerrechten
  aus -- das Skript durfte ungefragt Dateien löschen und E-Mails
  verschicken. #emph[Alltagsvergleich:] Jemand schickt dir ein Paket mit
  der Aufschrift „Buchgeschenk". Beim Aufmachen entpuppt es sich als
  automatische Farbbombe, die dein ganzes Haus vollkleckert und sich
  sofort selbst an alle Kontakte in deinem Notizbuch weiterschickt.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Unterschied zwischen einem
  #strong[Virus] (benötigt ein Wirtsprogramm/eine Wirtsdatei) und einem
  #strong[Wurm] (eigenständiges Schadprogramm, verbreitet sich
  selbstständig über Netzwerke) kennen.
- #strong[Typische Klausurfalle:] Zu behaupten, der Wurm habe eine
  Sicherheitslücke im Code ausgenutzt. Falsch: Er nutzte #emph[reguläre,
  vorgesehene Betriebssystemfunktionen] (VBScript, unbeschränkte
  Script-Ausführung), die schlicht ab Werk unsicher konfiguriert waren!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Grenzen Sie die Begriffe Computerwurm und Computervirus
voneinander ab. Erläutern Sie anhand des ILOVEYOU-Steckbriefs, welches
Feature des Betriebssystems maßgeblich dazu beitrug, dass Nutzer die
Datei bedenkenlos öffneten." #strong[Antwort:]

- #strong[Virus vs.~Wurm:] Ein Virus heftet sich an eine bestehende
  Wirtsdatei an und wird nur aktiv, wenn der Wirt gestartet wird. Ein
  Wurm ist ein eigenständiges Programm, das sich aktiv über Netzwerke
  und Kommunikationsdienste weiterverbreitet.
- #strong[Betriebssystem-Feature:] Das #strong[automatische Ausblenden
  bekannter Dateiendungen] in Windows. Dadurch wurde die Skript-Endung
  `.vbs` verborgen und die Datei wirkte optisch wie eine harmlose
  Textdatei (`.TXT`).

]
#pagebreak(weak: true)
= Die Köder-Mail
<die-köder-mail>
#figure(image("./img/iloveyou.jpg", alt: "Die Köder-Mail"),
  caption: [
    Die Köder-Mail
  ]
)

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Hier sehen wir ein Paradebeispiel für #strong[Social Engineering] -- die
gezielte Manipulation menschlicher Verhaltensweisen:

- #strong[Der emotionale Köder:] Neugier und Eitelkeit („Wer gesteht mir
  hier seine Liebe?"). Wer klickt da nicht?
- #strong[Falsches Vertrauen:] Die E-Mail kam nicht von einem fremden
  Betrüger, sondern von einem echten Kollegen oder Freund, weil der Wurm
  dessen Outlook gekapert hatte! #emph[Alltagsvergleich:] Wenn dir ein
  Fremder auf der Straße einen Zettel zusteckt, bist du misstrauisch.
  Wenn dir dein bester Freund denselben Zettel in die Hand drückt, liest
  du ihn sofort. #emph[\(Bildhinweis: Zu sehen ist ein
  Outlook-E-Mail-Fenster mit dem Betreff „ILOVEYOU" und dem Anhang
  `LOVE-LETTER-FOR-YOU.TXT.vbs` mit Skript-Icon).]

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die psychologischen Faktoren von
  Phishing analysieren und begründen können, warum reines
  Awareness-Training (Mitarbeiterschulung) niemals ausreicht, sondern
  durch technische Barrieren flankiert werden muss.
- #strong[Typische Klausurfalle:] Annehmen, man könne Angriffe allein
  durch Mitarbeiterschulung verhindern. Menschen machen Fehler --
  deshalb müssen technische Systeme fehlerverzeihend gebaut sein
  (#emph[Defense in Depth]).

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Nennen Sie zwei psychologische Faktoren, die die
ILOVEYOU-Mail so erfolgreich machten. Welche moderne technische Maßnahme
auf dem E-Mail-Server verhindert heute, dass solche Anhänge überhaupt im
Postfach landen?" #strong[Antwort:]

- #strong[Psychologische Faktoren:]
  + #strong[Emotionale Neugier / Verlockung:] Reißerischer Betreff
    („ILOVEYOU") verleitet zum unüberlegten Klick.
  + #strong[Vertrauensvorschuss:] Die Mail stammte scheinbar von
    bekannten Kontakten aus dem persönlichen Adressbuch.
- #strong[Technische Maßnahme:] #strong[Content-Filtering /
  Anhänge-Blockade am E-Mail-Gateway]: Gefährliche ausführbare
  Dateitypen (z. B. `.vbs`, `.bat`, `.exe`) werden serverseitig
  herausgefiltert oder in einer Quarantäne-Sandbox isoliert.

]
#pagebreak(weak: true)
= Funktionsweise des Wurms
<funktionsweise-des-wurms>
- #strong[\1. Persistenz:]
  - Schreibt sich in den Registry-Autostart (`HKLM\...\Run`)
  - Kopiert sich als `MSKernel32.vbs` ins Windows-Systemverzeichnis
- #strong[\2. Schneeball-Verbreitung:]
  - Liest Outlook-Adressbuch (MAPI) aus und mailt sich an alle Kontakte
  - Führte weltweit zum Zusammenbruch von Mail-Servern
- #strong[\3. Zerstörung:]
  - Überschreibt Multimediadateien & Skripte (`.jpg`, `.js`, …) mit
    eigenem Code
  - Versteckt `.mp3`-Dateien und ersetzt sie durch Wurm-Kopien

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Der Wurm arbeitete in drei fatalen Schritten:

+ #strong[Persistenz (Einnisten):] Er kopierte sich als angebliche
  Systemdatei `MSKernel32.vbs` ins System und trug sich in den
  Windows-Autostart ein, damit er jeden Computerneustart überlebte.
+ #strong[Schneeball-Effekt (Verbreitung):] Er zapfte die
  Outlook-Schnittstelle (MAPI) an und verschickte sich an das gesamte
  Adressbuch -- was weltweit Firmen-Mailserver unter der Last
  zusammenbrechen ließ.
+ #strong[Payload (Zerstörung):] Er überschrieb persönliche Fotos
  (`.jpg`), Webdateien und Skripte gnadenlos mit seinem eigenen Code.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die drei Phasen (#emph[Persistenz],
  #emph[Verbreitung / Propagation], #emph[Payload / Schadwirkung])
  unterscheiden und den Auswirkungen die verletzten
  #strong[CIA-Schutzziele] zuordnen.
- #strong[Typische Klausurfalle:] #emph[Persistenz] mit
  #emph[Ausführung] verwechseln! Ausführung ist der Doppelklick im
  Moment; Persistenz bedeutet: Die Schadsoftware bleibt auch nach
  Herunterfahren und Neustart des Rechners dauerhaft aktiv.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Der ILOVEYOU-Wurm überschrieb lokale Multimediadateien
(`.jpg`) und legte gleichzeitig durch millionenfachen Mailversand
E-Mail-Server lahm. Welche zwei Schutzziele der CIA-Triade wurden durch
diese beiden Schadwirkungen jeweils verletzt? Begründen Sie kurz."
#strong[Antwort:]

- #strong[Integrität verletzt:] Durch das Überschreiben der
  `.jpg`-Bilder mit Schadcode wurden Originaldaten unwiederbringlich
  verfälscht und vernichtet (Verlust der Korrektheit und
  Unversehrtheit).
- #strong[Verfügbarkeit verletzt:] Durch die E-Mail-Flut brachen
  Mailserver zusammen, sodass legitime Nutzer den Dienst nicht mehr
  nutzen konnten (Ausfall der Erreichbarkeit/Downtime).

]
#pagebreak(weak: true)
= Täter & Rechtliches Nachspiel
<täter-rechtliches-nachspiel>
- #strong[Täter & Motiv:]
  - Onel de Guzman (24, Informatikstudent in Manila)
  - Ziel: Passwörter für kostenlosen Internetzugang abgreifen
- #strong[Rechtsvakuum:]
  - Keine Cybercrime-Gesetze auf den Philippinen im Mai 2000
  - Weder klassischer Diebstahl noch Sachbeschädigung lag juristisch vor
- #strong[Konsequenz:]
  - Anklage fallen gelassen (#emph[Nulla poena sine lege])
  - Beschleunigte Verabschiedung des #emph[E-Commerce Act (RA 8792)]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Der Programmierer richtete Milliardenschäden an -- wurde aber niemals
verurteilt! Warum? Im Mai 2000 gab es auf den Philippinen schlicht kein
Gesetz gegen Computer-Kriminalität. Klassischer Diebstahl scheiterte
juristisch, weil man Daten nicht wie ein Fahrrad „wegtragen" kann (Daten
sind unkörperlich). Klassische Sachbeschädigung scheiterte, weil die
Computer physisch heil blieben. Es griff der fundamentale
Rechtsgrundsatz: #strong[„Nulla poena sine lege"] (Keine Strafe ohne
Gesetz). Wenn eine Tat zum Zeitpunkt der Ausführung nicht ausdrücklich
gesetzlich verboten ist, darf niemand dafür bestraft werden -- auch
nicht rückwirkend! #emph[Alltagsvergleich:] Wenn es in einer Stadt kein
Gesetz gegen das Fahren mit einem elektrischen Hoverboard gibt, kann die
Polizei dich nicht bestrafen, egal wie sehr sich andere Fußgänger
geärgert haben.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Das juristische Prinzip #emph[„Nulla
  poena sine lege"] auf Cybercrime-Vorfälle anwenden und begründen
  können, warum traditionelle Eigentumsdelikte bei digitalen Daten ohne
  spezifische IT-Strafgesetze (z. B. § 202a StGB Ausspähen von Daten, §
  303a StGB Datenveränderung) scheitern.
- #strong[Typische Klausurfalle:] Argumentieren, dass „doch
  offensichtlich ein Schaden entstanden ist". Im Strafrecht gilt ein
  striktes Analogie- und Rückwirkungsverbot zum Schutz der Bürger.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum konnte der Schöpfer des ILOVEYOU-Wurms im Jahr
2000 nicht wegen Diebstahls oder Sachbeschädigung verurteilt werden?
Nennen Sie das zugrundeliegende Rechtsprinzip." #strong[Antwort:]

- #strong[Rechtsgrundsatz:] #strong[Nulla poena sine lege] (Keine Strafe
  ohne vorheriges Gesetz / Verbot von Rückwirkung und strafbegründender
  Analogie).
- #strong[Begründung:] Klassischer Diebstahl erfordert die Wegnahme
  einer #emph[körperlichen Sache] (digitale Daten sind unkörperlich).
  Sachbeschädigung erfordert physische Beschädigung von Gegenständen
  (Hardware blieb intakt). Da keine speziellen Gesetze gegen
  Computerviren existierten, war die Tat straffrei.

]
#pagebreak(weak: true)
= Fazit & Lehren
<fazit-lehren>
- #strong[Secure by Default:] Gefährliche Skripte dürfen nicht
  standardmäßig per Doppelklick starten
- #strong[UI-Design ist Security:] Das Verstecken von Dateiendungen
  täuscht Anwender
- #strong[Schnittstellensicherheit:] Unbeschränkter API-Zugriff (wie
  Outlook MAPI) ist fatal
- #strong[Awareness:] Technik versagt, wenn Nutzer emotional manipuliert
  werden

#didaktik-box(title: [Schnell-Check (Die 4 Kernlehren)])[
+ #strong[Secure by Default:] Ein System muss ab Werk sicher sein --
  Skripte dürfen nicht einfach per Doppelklick starten!
+ #strong[UI-Design ist Security:] Software darf Nutzer nicht belügen
  oder täuschen (z. B. Dateiendungen niemals verstecken).
+ #strong[Schnittstellensicherheit (API-Security):] Programme dürfen
  fremden Code nicht unbeschränkt auf E-Mails oder Kontakte zugreifen
  lassen.
+ #strong[Awareness & Defense in Depth:] Den Menschen schulen, aber das
  System so absichern, dass ein Klick nicht die Firma lahmlegt.

]
#exam-box(title: [Prüfungs-Checkliste])[
- #emph[Definieren können:] Das Prinzip #strong[Secure by Default]
  (Sicherheit ist die Werkseinstellung, ohne dass der Nutzer erst
  manuell Haken setzen muss).
- #emph[Anwenden können:] Zu jeder der 4 Lehren eine moderne
  Gegenmaßnahme nennen (z. B. Application Allowlisting, Endungsanzeige
  im Explorer, OAuth-API-Berechtigungen, Phishing-Simulationen).

]
#quiz-box(title: [Blitzfragen zur Selbstkontrolle])[
#strong[Frage 1:] Was bedeutet das Sicherheitsprinzip „Secure by
Default" an einem konkreten Beispiel? \ #emph[Lösung:] Eine Software
wird in der sichersten Konfiguration ausgeliefert (z. B. Ports
standardmäßig geschlossen, Skriptausführung deaktiviert,
Standardpasswörter müssen beim ersten Login zwingend geändert werden). \
#strong[Frage 2:] Warum ist das Ausblenden von Dateiendungen im
Betriebssystem ein gravierendes Sicherheitsrisiko? \ #emph[Lösung:] Weil
Angreifer über doppelte Dateiendungen (z. B. `rechnung.pdf.exe`)
bösartige Programme als harmlose Dokumente tarnen können.

]
#pagebreak(weak: true)
= Die CIA-Triade
<die-cia-triade>
== Schutzziele & Sicherheitsbegriffe
<schutzziele-sicherheitsbegriffe>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Die CIA-Triade)])[
Jetzt steigen wir in das Herzstück der IT-Sicherheit ein: die
#strong[CIA-Triade] (#strong[C]onfidentiality, #strong[I]ntegrity,
#strong[A]vailability). Sie ist das wichtigste Werkzeug für jeden
Sicherheitsverantwortlichen: Egal, welches System du betrachtest -- vom
Herzschrittmacher bis zum Online-Banking --, mit der CIA-Triade kannst
du sofort analysieren: #emph[Was muss hier eigentlich vor wem geschützt
werden?]

]
#exam-box(title: [Modul-Lernziel])[
Du beherrschst die Definitionen der drei Schutzziele und ihrer
Erweiterungen (Authentizität, Zurechenbarkeit), kannst reale
Schutzmaßnahmen exakt zuordnen und verstehst, warum die drei Ziele in
der Praxis oft in harter Konkurrenz zueinander stehen
(#emph[Trade-offs]).

]
#quiz-box(title: [Typische Schwerpunkte])[
- Die drei Begriffe auf Deutsch und Englisch nennen und definieren.
- Szenario-Zuordnung: Gegeben ist ein Vorfall (z. B. Ransomware,
  SQL-Injection, DoS-Attacke) $arrow.r$ Welches Schutzziel wurde
  verletzt?
- Die Balance: Zielkonflikte zwischen Vertraulichkeit und Verfügbarkeit
  erklären (z. B. Notfallzugriff im Krankenhaus).

]
#pagebreak(weak: true)
= Angreifer & Motivationen
<angreifer-motivationen>
#grid(columns: (1fr, 1fr), gutter: 14pt, [
#strong[Wer greift an?]

- #strong[Cyberkriminelle:] Finanzieller Profit, RaaS, Erpressung
- #strong[Staaten (APTs):] Spionage, Geopolitik, Sabotage
- #strong[Insider:] Sabotage, Datendiebstahl, Rache
- #strong[Hacktivisten & Script Kiddies:] Protest, Aufmerksamkeit,
  Spieltrieb

], [
#strong[Was sind die Ziele?]

- #strong[Finanzen:] Lösegeld (Ransomware), Konten
- #strong[Know-how:] Wirtschaftsspionage, IP-Diebstahl
- #strong[Disruption:] Produktionsausfall, DoS
- #strong[Macht & Kontrolle:] Botnetze, Persistenz

])
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Wer greift uns eigentlich an und warum? Sicherheitsexperten müssen das
Täterprofil kennen, um die Verteidigung richtig zu dimensionieren:

- #strong[Cyberkriminelle:] Wollen Geld! Sie setzen auf Ransomware oder
  Erpressung (#emph[Ransomware as a Service]).
- #strong[APTs (Advanced Persistent Threats):] Meist staatlich
  finanzierte Elite-Spione. Sie haben praktisch unbegrenzte Zeit und
  Mittel und wollen jahrelang unentdeckt im Netz bleiben.
- #strong[Insider:] Eigene Mitarbeiter. Extrem gefährlich, weil sie
  schon Schlüssel und Passwörter haben!
- #strong[Script Kiddies / Hacktivisten:] Nutzen fertige Tools aus
  Neugier, Protest oder Prahlerei. #emph[Achtung Begriffsfalle:]
  #strong[IP-Diebstahl] meint #strong[Intellectual Property] (geistiges
  Eigentum: Rezepte, Patente, Konstruktionspläne), NICHT die IP-Adresse
  des Computers!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Angreifergruppen nach Motivation,
  Ressourcen und typischen Zielen unterscheiden.
- #strong[Typische Klausurfalle:] Eine APT mit einem gewöhnlichen
  Ransomware-Kriminellen gleichsetzen. APTs wollen #strong[gerade keinen
  Lärm machen], sondern unbemerkt spionieren!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Was versteht man unter einer APT (Advanced Persistent
Threat) und wodurch unterscheidet sich deren Vorgehensweise grundlegend
von typischen Ransomware-Cyberkriminellen?" #strong[Antwort:]

- #strong[Definition APT:] Eine hochgerüstete, oft staatlich geförderte
  Angreifergruppe mit enormen Ressourcen, die gezielt und über lange
  Zeiträume in sensible Netze eindringt.
- #strong[Unterschied im Vorgehen:]
  - #strong[Ransomware-Kriminelle:] Machen absichtlich sofort Lärm
    (Dateien verschlüsseln, Lösegeldforderung anzeigen), um schnell
    finanziellen Profit zu erzielen.
  - #strong[APTs:] Arbeiten extrem verdeckt (#emph[stealth]), nisten
    sich dauerhaft ein (#emph[Persistenz]) und wollen über Monate oder
    Jahre unbemerkt Daten abfließen lassen (Spionage).

]
#pagebreak(weak: true)
= Die CIA-Triade -- Überblick
<die-cia-triade-überblick>
- #strong[Confidentiality (Vertraulichkeit):] Schutz vor unbefugter
  Offenlegung (#emph[Nur wer darf, liest mit]).
- #strong[Integrity (Integrität):] Schutz vor unbefugter Modifikation
  (#emph[Daten bleiben korrekt & unverfälscht]).
- #strong[Availability (Verfügbarkeit):] Gewährleistung des Zugriffs
  (#emph[Systeme stehen bei Bedarf bereit]).

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die CIA-Triade fasst die drei elementaren Schutzziele zusammen:

- #strong[Confidentiality (Vertraulichkeit):] Nur wer darf, liest mit.
  Schutz vor neugierigen Blicken (#emph[Geheimhaltung]).

- #strong[Integrity (Integrität):] Daten bleiben korrekt und
  unverändert. Schutz vor heimlicher Manipulation (#emph[Echtheit &
  Richtigkeit]).

- #strong[Availability (Verfügbarkeit):] Systeme funktionieren, wenn man
  sie braucht (#emph[Zuverlässigkeit]). #emph[Alltagsanalogie:] Ein
  versiegelter Liebesbrief im Umschlag:

- #emph[Vertraulichkeit:] Niemand öffnet den Umschlag heimlich auf dem
  Weg.

- #emph[Integrität:] Niemand radiert Wörter aus oder fälscht den Inhalt.

- #emph[Verfügbarkeit:] Der Briefträger stellt den Brief rechtzeitig zu,
  statt ihn in den Papierkorb zu werfen. #emph[\(Merkhilfe: Hat nichts
  mit dem US-Geheimdienst CIA zu tun!)]

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die 3 Begriffe auf Deutsch und Englisch
  fehlerfrei nennen und für jede beliebige IT-Anwendung definieren
  können.
- #strong[Typische Klausurfalle:] Integrität mit Vertraulichkeit
  verwechseln. Wenn ein Angreifer eine Datenbank manipuliert und
  Kontostände ändert, verletzt er die #strong[Integrität] (auch wenn er
  die Daten gar nicht veröffentlicht)!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Nennen Sie die drei Schutzziele der CIA-Triade (Deutsch
und Englisch). Welches Schutzziel wird verletzt, wenn ein DoS-Angriff
den Webserver einer Fluggesellschaft blockiert?" #strong[Antwort:]

- #strong[Die drei Schutzziele:]
  + #strong[Confidentiality] (Vertraulichkeit)
  + #strong[Integrity] (Integrität)
  + #strong[Availability] (Verfügbarkeit)
- #strong[Szenario-Zuordnung:] Es wird die #strong[Verfügbarkeit]
  verletzt, da berechtigte Kunden den Buchungsdienst temporär nicht mehr
  erreichen können.

]
#pagebreak(weak: true)
= C: Vertraulichkeit (Confidentiality)
<c-vertraulichkeit-confidentiality>
- #strong[Ziel:] Schutz sensibler Informationen vor unbefugtem Zugriff &
  Abfluss
- #strong[Verschlüsselung in 3 Zuständen:]
  - #emph[Data in Transit:] TLS, HTTPS, VPN (Schutz vor Abhören /
    Sniffing)
  - #emph[Data at Rest:] AES-256, BitLocker (Schutz bei physischem
    Verlust / Diebstahl)
  - #emph[Data in Use:] Secure Enclaves / Confidential Computing
- #strong[Schutzmaßnahmen:]
  - #strong[Least Privilege:] Zugriffsberechtigungen auf das absolute
    Minimum beschränken
  - #strong[Authentifizierung & MFA:] Strenge Identitätsprüfung vor
    Freigabe
  - #strong[Klassifizierung:] Öffentlich $arrow.r$ Intern $arrow.r$
    Vertraulich $arrow.r$ Streng vertraulich

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Vertraulichkeit bedeutet: Daten dürfen nicht in falsche Hände geraten.
Um Daten zu schützen, muss man ihre drei Lebenszustände kennen:

+ #strong[Data in Transit (unterwegs):] Daten reisen durchs Internet
  (wie ein Postbrief im Lkw). Schutz: TLS / HTTPS / VPN (verschlossener
  Briefumschlag).
+ #strong[Data at Rest (gespeichert):] Daten liegen auf Festplatten oder
  USB-Sticks (wie Akten im Tresor). Schutz: BitLocker / AES-256 (starkes
  Tresorschloss).
+ #strong[Data in Use (in Bearbeitung):] Daten liegen offen im
  Arbeitsspeicher der CPU (wie Akten ausgebreitet auf dem Schreibtisch).
  Schutz: #emph[Confidential Computing / Secure Enclaves]
  (Sichtschutzblende direkt am Prozessor). #emph[Wichtiges Prinzip Least
  Privilege:] Mitarbeiter bekommen nur exakt die Zugriffsrechte, die sie
  für ihre aktuelle Arbeit zwingend brauchen -- keinen Ordner mehr!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die 3 Datenzustände (#emph[in Transit],
  #emph[at Rest], #emph[in Use]) nennen, den Unterschied erklären und
  für jeden Zustand eine konkrete technische Maßnahme angeben.
- #strong[Typische Klausurfalle:] Glauben, dass
  BitLocker-Festplattenverschlüsselung vor Hackern schützt, während man
  am PC arbeitet! BitLocker schützt nur im ausgeschalteten Zustand vor
  Diebstahl des Laptops (#emph[Data at Rest]). Ist Windows gestartet,
  sind die Daten transparent entschlüsselt.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erläutern Sie den Unterschied zwischen ‚Data in
Transit' und ‚Data at Rest'. Nennen Sie für jeden Zustand eine typische
Schutzmaßnahme zur Gewährleistung der Vertraulichkeit."
#strong[Antwort:]

- #strong[Data in Transit:] Daten befinden sich während der Übertragung
  über ein Netzwerk in Bewegung (z. B. WLAN, Internet). \
  #emph[Maßnahme:] #strong[TLS / HTTPS / VPN]
  (Transportverschlüsselung).

- #strong[Data at Rest:] Ruhende Daten, die auf einem Speichermedium
  abgelegt sind (z. B. SSD, Festplatte, Backup-Band). \ #emph[Maßnahme:]
  #strong[AES-256 / BitLocker] (Festplatten- bzw.
  Speicherverschlüsselung).

]
#pagebreak(weak: true)
= I: Integrität (Integrity)
<i-integrität-integrity>
- #strong[Ziel:] Korrektheit, Vollständigkeit und Unverfälschtheit von
  Daten & Systemen
- #strong[Kryptographische Schutzmechanismen:]
  - #strong[Kryptographische Hashes (z.B. SHA-256):] Eindeutige
    Prüfsummen gegen Manipulation
  - #strong[Digitale Signaturen:] Hash + Asymmetrische Kryptographie
    (Beweis für Urheberschaft & Unversehrtheit)
  - #strong[Code Signing & SBOM:] Schutz der Software-Lieferkette vor
    Schadcode
- #strong[Systemische Kontrollen:]
  - Schreib-Zugriffskontrolle & strikte Eingabevalidierung (Input
    Validation)
  - Transaktionssicherheit (ACID) & revisionssicheres Logging

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Integrität garantiert: Daten sind unverfälscht, vollständig und korrekt.
#emph[Alltagsanalogien zur Differenzierung:]

- #strong[Hash-Funktion (Prüfsumme):] Wie ein digitaler Fingerabdruck.
  Ein Fleischwolf macht aus Fleisch Hackfleisch. Ändert man nur ein
  Staubkorn im Fleisch, sieht das Hackfleisch völlig anders aus
  (#emph[Avalanche-Effekt]). Aber: Ein Hash sagt dir NICHT, von wem die
  Datei stammt!
- #strong[Digitale Signatur:] Ein Wachssiegel mit dem unverkennbaren
  Siegelring des Absenders. Sie beweist zweierlei: Niemand hat den Text
  verändert (Integrität) UND der Brief stammt wirklich vom Absender
  (Authentizität).
- #strong[ACID-Transaktion:] Bei einer Banküberweisung muss das Geld auf
  Konto A abgebucht UND auf Konto B gutgeschrieben werden. Bricht die
  Leitung ab, wird alles auf Anfang zurückgesetzt -- es geht kein Cent
  verloren.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Unterschied zwischen einem reinen
  #strong[Hash] (prüft nur Unverändertheit) und einer #strong[digitalen
  Signatur] (prüft Unverändertheit + Urheberschaft) erklären können.
- #strong[Typische Klausurfalle:] Einen Hash als „Verschlüsselung"
  bezeichnen. Ein Hash ist eine #strong[Einwegfunktion] -- man kann aus
  dem Hash niemals den Originaltext zurückrechnen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum reicht ein bloßer Hashwert (z. B. SHA-256) auf
einer Download-Webseite nicht aus, um die Integrität einer Software
gegen einen Angreifer im Netzwerk (Man-in-the-Middle) abzusichern?
Welche Technologie löst dieses Problem?" #strong[Antwort:]

- #strong[Problem des einfachen Hashs:] Wenn ein Angreifer den
  Download-Verkehr manipuliert, kann er die Software mit Schadcode
  versehen und gleichzeitig den auf der Website angezeigten Hashwert
  durch den Hash seiner manipulierten Datei ersetzen.
- #strong[Lösung:] #strong[Digitale Signatur (Code Signing)]: Die Datei
  wird mit dem geheimen privaten Schlüssel des Herstellers signiert. Der
  Empfänger verifiziert die Signatur über das Zertifikat des
  Herstellers. Der Angreifer besitzt den privaten Herstellerschlüssel
  nicht und kann keine gültige Signatur erzeugen.

]
#pagebreak(weak: true)
= A: Verfügbarkeit (Availability)
<a-verfügbarkeit-availability>
- #strong[Ziel:] Zeitgerechte und verlässliche Erreichbarkeit von Daten
  und Systemen
- #strong[Wichtige Metriken:]
  - #strong[SLA & Uptime:] 99,9 % (\~8,7 h Downtime/Jahr) bis 99,999 %
    („Five Nines")
  - #strong[RPO & RTO:] Akzeptabler Datenverlust (RPO) und maximale
    Wiederanlaufzeit (RTO)
- #strong[Maßnahmen zur Ausfallsicherheit:]
  - #strong[Redundanz:] RAID, Load Balancer, Active/Active-Cluster,
    Geo-Redundanz
  - #strong[3-2-1-Backup-Regel:] 3 Kopien, 2 verschiedene Medientypen, 1
    Offsite (+ Unveränderbarkeit)
  - #strong[DDoS-Abwehr:] Anycast-Netzwerke, Traffic Scrubbing, WAF &
    Rate Limiting

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Verfügbarkeit heißt: Systeme und Daten sind genau dann erreichbar, wenn
man sie braucht. #emph[Zwei essentielle Kennzahlen für die
Notfallplanung:]

- #strong[RPO (Recovery Point Objective):] #emph[„Wie viel Datenverlust
  verkraften wir?"] Maximal tolerierter Zeitraum verlorener Daten (z. B.
  tägliches Backup um 24:00 Uhr $arrow.r$ maximal 24 Stunden
  Datenverlust bei Crash um 23:59 Uhr).
- #strong[RTO (Recovery Time Objective):] #emph[„Wie lange darf die
  Reparatur dauern?"] Maximal akzeptierte Ausfallzeit bis zum
  Wiederanlauf des Betriebs (z. B. RTO = 4 Stunden). #emph[Goldene
  Grundregel:] #strong[Ein RAID ist KEIN Backup!] Ein RAID spiegelt
  Festplatten nur im laufenden Betrieb. Wenn ein Mitarbeiter
  versehentlich eine Datenbank löscht oder Ransomware alles
  verschlüsselt, wird dieser Fehler im selben Wimpernschlag auf die
  gespiegelte Platte geschrieben!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] RPO und RTO an einem Zeitstrahl
  definieren, die 3-2-1-Backup-Regel erklären (3 Kopien, 2 Medientypen,
  1 Kopie außer Haus) und begründen, warum RAID kein Backup ersetzt.
- #strong[Typische Klausurfalle:] RPO und RTO vertauschen: #strong[RPO
  blickt zurück in die Vergangenheit] (wie alt dürfen die
  wiederhergestellten Daten sein?); #strong[RTO blickt nach vorn in die
  Zukunft] (wie viele Stunden dauert der Wiederanlauf?).

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Ein IT-Leiter verzichtet auf Backups mit der
Begründung: ‚Unsere Server nutzen RAID-1-Spiegelung, wir sind gegen
Datenverlust abgesichert.' Beurteilen Sie diese Entscheidung kritisch."
#strong[Antwort:]

- Die Entscheidung ist #strong[fachlich falsch und hochgefährlich].
- #strong[RAID] bietet lediglich #strong[Hardware-Redundanz] beim
  Ausfall einzelner Datenträger für den unterbrechungsfreien Betrieb.
- Es bietet #strong[keinen Schutz vor logischen Datenverlusten]: Bei
  versehentlichem Löschen, Softwarefehlern oder Ransomware-Infektionen
  wird die Löschung/Verschlüsselung #strong[sofort synchron auf die
  gespiegelte Platte übertragen].
- Schutz bietet ausschließlich ein echtes, getrenntes und
  versionsbasiertes #strong[Backup] (z. B. nach 3-2-1-Regel mit
  unveränderbarer Kopie).

]
#pagebreak(weak: true)
= Der Balanceakt (CIA-Trade-Offs)
<der-balanceakt-cia-trade-offs>
Die Schutzziele stehen häufig in natürlicher Konkurrenz:

#grid(columns: (1fr, 1fr), gutter: 14pt, [
- #strong[C vs.~A:] \ Strikte Verschlüsselung & Isolation verlangsamt
  oder blockiert Zugriff im Notfall.

], [
- #strong[I vs.~A:] \ Aufwendige Prüfungen und Sperren belasten die
  Systemperformance.

])
#quote-box[
#strong[Beispiel:] Ein Notfallzugang verbessert die Verfügbarkeit, kann
aber die Vertraulichkeit schwächen. Deshalb braucht er enge Rechte und
Protokollierung.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
In der Realität kann man selten alle drei Schutzziele gleichzeitig auf
Anschlag drehen -- sie stehen oft in natürlicher Konkurrenz zueinander
(#strong[Trade-offs]):

- #strong[Vertraulichkeit vs.~Verfügbarkeit (C vs.~A):] Je mehr
  Passwörter, MFA-Abfragen und Verschlüsselungsschichten ich einbaue
  (maximale Vertraulichkeit), desto langsamer und umständlicher wird der
  Zugriff im Notfall (Verfügbarkeit leidet). #emph[Klassiker im
  Krankenhaus (Das „Break-Glass"-Prinzip):] Wenn ein Patient in der
  Notaufnahme reanimiert wird, darf der Notarzt nicht erst 10 Minuten
  auf Freigaben für die Patientenakte warten. Die Verfügbarkeit hat hier
  absolute Priorität! Der Notarzt darf die Akte per Notfall-Knopf sofort
  öffnen. #emph[Die Lösung des Konflikts:] Wir lockern die
  Vertraulichkeit für den Notfall, sichern uns aber durch
  #strong[revisionssichere Protokollierung (Logging)] ab -- jeder
  Notfallzugriff wird registriert und im Nachgang zwingend auditiert.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Zielkonflikt zwischen
  Vertraulichkeit und Verfügbarkeit an einem praktischen Szenario
  erläutern und erklären, wie #strong[kompensierende Maßnahmen] (z. B.
  Audit-Logs) den Konflikt lösen.
- #strong[Typische Klausurfalle:] Annehmen, dass Vertraulichkeit
  #emph[immer] das wichtigste Ziel sei. Im medizinischen Notfall oder
  bei industriellen Steuerungsanlagen (z. B. Kraftwerk) steht
  #strong[Verfügbarkeit] über allem!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erläutern Sie den Zielkonflikt zwischen Vertraulichkeit
und Verfügbarkeit am Beispiel des Notfallzugriffs (‚Break-Glass') im
Krankenhaus. Welche Sicherheitsmaßnahme kompensiert die vorübergehend
gelockerte Vertraulichkeit?" #strong[Antwort:]

- #strong[Zielkonflikt:] Strikte Zugriffskontrollen schützen
  Patientendaten vor unbefugter Einsicht (Vertraulichkeit), verhindern
  im akuten Lebensnotfall aber schnellen Datenzugriff für das
  medizinische Personal (Verfügbarkeit).
- #strong[Kompensierende Maßnahme:] #strong[Vollständiges,
  revisionssicheres Logging / Auditing]: Der Notfallzugriff wird mit
  Zeitstempel, Benutzer-ID und Begründung protokolliert und löst eine
  Benachrichtigung an den Datenschutzbeauftragten zur nachträglichen
  Prüfung aus.

]
#pagebreak(weak: true)
= Erweiterte Schutzziele
<erweiterte-schutzziele>
Moderne Sicherheitsmodelle ergänzen die CIA-Triade um zwei Kernaspekte:

- #strong[Authentizität (Authenticity):]
  - #emph[Echtheit der Identität und des Ursprungs]
  - „Bist du wirklich derjenige, für den du dich ausgibst?" (MFA,
    Zertifikate)
- #strong[Zurechenbarkeit / Nicht-Abstreitbarkeit (Non-Repudiation):]
  - #emph[Beweiskraft von Handlungen]
  - Niemand kann eine getätigte Transaktion leugnen (Signaturen,
    Audit-Logs)

#quote-box[
#strong[Einordnung:] CIA beschreibt drei grundlegende Schutzziele;
Authentizität und Zurechenbarkeit ergänzen das Modell, ersetzen es aber
nicht.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die klassische CIA-Triade wird in der modernen Praxis um zwei
wesentliche Schutzziele erweitert:

+ #strong[Authentizität (Echtheit):] Ist der Absender wirklich der, für
  den er sich ausgibt? \ #emph[Alltagsvergleich:] Jemand zeigt dir an
  der Tür seinen echten Personalausweis vor.

+ #strong[Zurechenbarkeit / Nicht-Abstreitbarkeit (Non-Repudiation):]
  Niemand kann eine getätigte Aktion hinterher leugnen. \
  #emph[Alltagsvergleich:] Ein notariell beglaubigter Vertrag oder ein
  Einschreiben mit Rückschein. Wenn du im Online-Banking 5.000 €
  überweist, darfst du hinterher nicht behaupten: „Das war ich nicht,
  das System hat gesponnen!" #emph[Die 3 magischen A-Begriffe (Häufige
  Verwechslungsgefahr!):]

- #strong[Authentisierung:] Du weist deine Identität nach (z. B.
  Passwort eingeben, Fingerabdruck auflegen).
- #strong[Authentifizierung:] Das System überprüft deinen Nachweis
  (Passwort-Hash prüfen).
- #strong[Autorisierung:] Das System weist dir Rechte zu (was darfst du
  tun? z. B. Leserechte ja, Löschrechte nein).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Authentizität und Nicht-Abstreitbarkeit
  definieren und die Begriffskette #emph[Authentisierung $arrow.r$
  Authentifizierung $arrow.r$ Autorisierung] trennscharf an einem
  Beispiel (z. B. Login im Portal) erklären.
- #strong[Typische Klausurfalle:] Authentifizierung mit Autorisierung
  verwechseln! Einloggen ist Authentifizierung; prüfen, ob du
  Admin-Rechte hast, ist Autorisierung.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Unterscheiden Sie die Begriffe Authentifizierung und
Autorisierung anhand eines Online-Banking-Systems. Erläutern Sie zudem,
was unter Nicht-Abstreitbarkeit (Non-Repudiation) verstanden wird."
#strong[Antwort:]

- #strong[Authentifizierung:] Prüfung der Identität des Anwenders beim
  Login (z. B. Benutzername + Passwort + Bestätigung in der
  Banking-App).
- #strong[Autorisierung:] Festlegung und Prüfung der erlaubten Aktionen
  nach erfolgreicher Authentifizierung (z. B. Darf Kontostände einsehen
  und Überweisungen bis zum Tageslimit tätigen, aber keine fremden
  Konten verwalten).
- #strong[Nicht-Abstreitbarkeit (Non-Repudiation):] Technische und
  rechtliche Unanfechtbarkeit einer ausgeführten Handlung (z. B. durch
  digitale Signaturen und manipulationssichere Transaktionsprotokolle),
  sodass der Urheber die Durchführung nicht glaubhaft leugnen kann.

]
