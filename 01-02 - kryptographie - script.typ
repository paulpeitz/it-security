#set page(
  paper: "a4",
  margin: (top: 1.8cm, bottom: 1.8cm, left: 2.0cm, right: 2.0cm),
  header: context {
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8.5pt, fill: rgb("#64748b"), weight: "bold")[DHBW Karlsruhe · IT-Sicherheit]],
        align(right)[#text(size: 8.5pt, fill: rgb("#94a3b8"))[01-02 · Kryptographie]]
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

= Kryptographie
<kryptographie>
== Von Caesar bis Post-Quantum
<von-caesar-bis-post-quantum>
#didaktik-box(title: [Das große Ganze (Warum Kryptographie das Fundament ist)])[
Ohne Kryptographie gäbe es kein Online-Banking, kein E-Commerce, keine
sichere E-Mail und keine Privatsphäre im digitalen Raum. Das Internet
wurde ursprünglich für den vertrauensvollen Austausch zwischen
Universitäten entwickelt -- völlig unverschlüsselt. Kryptographie
verwandelt unsichere, öffentliche Datenleitungen in abhör- und
manipulationssichere Schutzkanäle. #emph[Wichtiges Grundprinzip:]
Kryptographie ist die mathematische Basis für fast alle Schutzziele der
IT-Sicherheit. Aber: Ein mathematisch perfekter Algorithmus schützt
nichts, wenn die Schlüssel falsch verwaltet werden oder der Mensch
Fehler macht.

]
#exam-box(title: [Orientierung & Roter Faden])[
Diese Vorlesung führt dich chronologisch von den einfachen Anfängen der
Antike (Caesar) über mechanische Chiffriermaschinen (Enigma) bis hin zu
modernen Algorithmen (AES, RSA, ECC) und dem Quantenzeitalter (PQC). An
jedem historischen Schritt lernen wir genau die Schwachstellen kennen,
die schließlich zur nächsten Entwicklungsstufe geführt haben.

]
#quiz-box(title: [Prüfungsfokus])[
In der Klausur musst du keine komplexen mathematischen Beweise führen!
Entscheidend ist das #strong[Baukasten-Verständnis]: Welches Verfahren
(symmetrisch vs.~asymmetrisch vs.~Hash) wird für welches Schutzziel
eingesetzt, wo liegen typische Grenzen und warum kombiniert man sie in
der Praxis (hybride Verschlüsselung)?

]
#pagebreak(weak: true)
= Agenda
<agenda>
- #strong[Grundlagen & Begriffe] -- Was ist Krypto, Kerckhoffs, Sym
  vs.~Asym
- #strong[Klassische Verfahren] -- Caesar, Vigenère, Kryptoanalyse
- #strong[Exkurs Enigma] -- Geniale Maschine, fatale Schwächen
- #strong[Symmetrisch heute] -- AES & warum der Modus zählt
- #strong[Schlüsselaustausch & Asymmetrie] -- Diffie-Hellman, RSA
- #strong[Kryptographie in der Praxis] -- Hybrid, Hashes, Signaturen,
  PKI
- #strong[Ausblick] -- Post-Quantum-Kryptographie

#didaktik-box(title: [Strukturüberblick (Der Vorlesungsfahrplan)])[
Die Vorlesung gliedert sich in drei große Phasen:

+ #strong[Die Evolution der Chiffren:] Von antiken Textverschiebungen
  über die Enigma zum heutigen symmetrischen Weltstandard (AES).
+ #strong[Die Asymmetrie-Revolution:] Wie Diffie-Hellman und RSA in den
  1970ern das jahrtausendealte Schlüsselverteilungsproblem lösten.
+ #strong[Reale Sicherheitssysteme:] Wie Hybridverschlüsselung, Hashes,
  digitale Signaturen und PKI/Zertifikate gemeinsam das Internet
  absichern -- und wie sich die Krypto gegen künftige Quantencomputer
  wappnet.

]
#exam-box(title: [Lern-Strategie])[
- #strong[Fundament (Höchste Klausurrelevanz):] Kerckhoffs' Prinzip,
  Symmetrisch vs.~Asymmetrisch (Vor-/Nachteile), Hybride
  Verschlüsselung, Digitale Signaturen und Hashfunktionen.
- #strong[Verständnis & Transfer:] Enigma-Lehren (Mensch als
  Schwachstelle, Cribs), Diffie-Hellman-Idee, PKI/Zertifikatsketten und
  Post-Quantum-Einordnung.

]
#quiz-box(title: [Typische Klausurverknüpfung])[
Prüfer verlangen häufig, ein konkretes Praxisszenario (z. B. „Ein Nutzer
bestellt verbindlich und vertraulich in einem Webshop") in
kryptographische Bausteine zu zerlegen: Du musst genau benennen können,
wo AES, RSA/DH, Hashing, Signaturen und Zertifikate greifen.

]
#pagebreak(weak: true)
= Grundlagen & Begriffe
<grundlagen-begriffe>
== Worum geht es eigentlich?
<worum-geht-es-eigentlich>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Die Sprache der Kryptographie)])[
Bevor wir konkrete Algorithmen analysieren, müssen wir das
Begriffsinventar schärfen. Begriffe wie Chiffre, Schlüssel, Klartext und
Geheimtext klingen im Alltag ähnlich, bezeichnen aber völlig
unterschiedliche Rollen. Zudem klären wir das oberste Sicherheitsgesetz:
Kerckhoffs' Prinzip.

]
#exam-box(title: [Modul-Lernziel])[
Du kannst die Kernbegriffe präzise definieren, den Unterschied zwischen
Entwurf (Kryptographie) und Brechen (Kryptoanalyse) erklären und den
fundamentalen Unterschied zwischen symmetrischer und asymmetrischer
Verschlüsselung auf den Punkt bringen.

]
#quiz-box(title: [Typische Schwerpunkte])[
Besonders beliebt in Prüfungen: Kerckhoffs' Prinzip im Vergleich zu
„Security by Obscurity" sowie der systematische Vergleich von
symmetrischen und asymmetrischen Verfahren (Vor- und Nachteile in einer
Tabelle).

]
#pagebreak(weak: true)
= Kryptographie vs.~Kryptoanalyse
<kryptographie-vs.-kryptoanalyse>
- #strong[Kryptographie]: Wissenschaft vom #emph[Entwerfen] sicherer
  Verfahren
  - Ziel: Nachrichten so schützen, dass Unbefugte sie nicht
    lesen/verändern können
- #strong[Kryptoanalyse]: Wissenschaft vom #emph[Brechen] dieser
  Verfahren
  - Ziel: Schwächen finden, Klartext ohne Schlüssel rekonstruieren
- #strong[Kryptologie]: Oberbegriff für beide Disziplinen

#quote-box[
#strong[Merksatz:] Gute Kryptographie entsteht nur im ständigen
Wettstreit mit der Kryptoanalyse.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Kryptographie und Kryptoanalyse sind zwei Seiten derselben Medaille.
#emph[Alltagsvergleich Tresor:] Die Kryptographen bauen immer dickere
Tresore mit komplexeren Schließmechanismen. Die Kryptoanalytiker
versuchen mit Stethoskop, Brechstange und Schweißbrenner Schwachstellen
zu finden. Erst wenn die weltbesten Einbrecher jahrelang vergeblich
versucht haben, den Tresor zu öffnen, gilt er in der Fachwelt als
wirklich sicher. #emph[Kryptologie] ist schlicht der wissenschaftliche
Oberbegriff, der beide Disziplinen zusammenfasst.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die drei Begriffe sauber voneinander
  abgrenzen und begründen können, warum ein Verfahren erst durch das
  Scheitern offener Kryptoanalyse Vertrauen gewinnt.
- #strong[Typische Klausurfalle:] Kryptoanalyse mit simplem
  „Schlüssel-Erraten" gleichzusetzen. Kryptoanalyse sucht gezielt nach
  mathematischen, statistischen oder logischen Konstruktionsfehlern --
  nicht nur nach Brute Force!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Definieren Sie die Begriffe Kryptographie,
Kryptoanalyse und Kryptologie und begründen Sie, warum Kryptographie auf
Kryptoanalyse angewiesen ist." #strong[Antwort:]

- #strong[Kryptographie:] Wissenschaft vom Entwurf und der Konstruktion
  sicherer Verfahren zum Schutz von Informationen.
- #strong[Kryptoanalyse:] Wissenschaft von der Untersuchung und dem
  Brechen kryptographischer Verfahren (Auffinden von Schwachstellen ohne
  Kenntnis des Schlüssels).
- #strong[Kryptologie:] Wissenschaftlicher Oberbegriff, der Konstruktion
  und Analyse vereint.
- #strong[Begründung:] Ein Verfahren gilt erst dann als praxistauglich
  und vertrauenswürdig, wenn es intensiver, offener Kryptoanalyse durch
  unabhängige Experten standgehalten hat (#strong[Wettstreit-Prinzip]).

]
#pagebreak(weak: true)
= Ein paar Grundbegriffe
<ein-paar-grundbegriffe>
- #strong[Klartext (plaintext)]: die lesbare Ausgangsnachricht
- #strong[Geheimtext (ciphertext)]: die verschlüsselte, unlesbare Form
- #strong[Verschlüsseln / Entschlüsseln]: Umwandlung in beide Richtungen
- #strong[Schlüssel (key)]: geheime Information, die den Vorgang steuert
- #strong[Chiffre (cipher)]: der Algorithmus/das Verfahren selbst

$ upright("Klartext") arrow.r_(upright("Schlüssel"))^(upright("Verschlüsseln")) upright("Geheimtext") arrow.r_(upright("Schlüssel"))^(upright("Entschlüsseln")) upright("Klartext") $

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Hier geht es um die Grundformel jeder Verschlüsselung.
#emph[Alltagsvergleich Zahlenschloss:]

- Die #strong[Chiffre] ist die Mechanik des Drehschlosses (sie ist
  bekannt und bei allen Schlössern gleicher Bauart identisch).
- Der #strong[Schlüssel] ist deine geheime Zahlenkombination (z. B.
  `4-8-1`), die du geheim hältst.
- Der #strong[Klartext] ist deine offene Tasche, der #strong[Geheimtext]
  die sicher verschlossene Tasche. #emph[Zentraler Merksatz:] Die
  Chiffre ist das Werkzeug, der Schlüssel ist das Geheimnis, das den
  Vorgang steuert!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Begriffe Klartext, Geheimtext,
  Chiffre und Schlüssel in einem Anwendungsbeispiel fehlerfrei zuordnen
  und formal korrekt verwenden ($c = E_k\(m\)$, $m = D_k\(c\)$).
- #strong[Typische Klausurfalle:] Chiffre (das Verfahren) und Schlüssel
  (der geheime Wert) verwechseln. Der Algorithmus ist das Kochrezept,
  der Schlüssel die geheime Zutat!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erklären Sie den Unterschied zwischen einer Chiffre und
einem kryptographischen Schlüssel anhand eines Beispiels aus dem
Alltag." #strong[Antwort:]

- #strong[Chiffre:] Das mathematische Verfahren bzw. der Algorithmus zur
  Transformation (die Bauart / der Mechanismus).
- #strong[Schlüssel:] Der geheime Parameter, der die genaue
  Transformation steuert und zum Ver- bzw. Entschlüsseln zwingend
  erforderlich ist.
- #strong[Alltagsbeispiel:] Ein Tresorschloss: Die Mechanik der Bolzen
  und Zahnräder ist die Chiffre (jedem bekannt); die geheime
  Zahlenkombination zum Öffnen ist der Schlüssel.

]
#pagebreak(weak: true)
= Was Kryptographie leisten soll
<was-kryptographie-leisten-soll>
Vier Schutzziele -- direkte Verbindung zur CIA-Triade:

- #strong[Vertraulichkeit]: Nur Befugte können mitlesen
  #emph[\(Confidentiality)]
- #strong[Integrität]: Manipulation wird erkannt #emph[\(Integrity)]
- #strong[Authentizität]: Der Absender ist wirklich, wer er vorgibt
- #strong[Nicht-Abstreitbarkeit]: Handlungen sind nachweisbar
  zurechenbar

#quote-box[
Verschlüsselung schützt Vertraulichkeit -- aber Integrität,
Authentizität & Zurechenbarkeit brauchen #emph[zusätzliche] Bausteine
(Hashes, Signaturen).

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Viele Menschen glauben: „Wenn Daten verschlüsselt sind, ist alles
sicher." Das ist ein fataler Trugschluss! #emph[Alltagsvergleich Brief:]
Ein blickdichter Briefumschlag schützt die #strong[Vertraulichkeit]
(niemand kann von außen mitlesen). Aber ein böswilliger Postbote könnte
den Brief öffnen, den Inhalt austauschen oder manipulieren
(#strong[Integritätsverlust]) oder einen gefälschten Absender
draufschreiben (#strong[Authentizitätsverlust]). #emph[Merksatz:] Reine
Verschlüsselung schützt #emph[nur] vor dem Mitlesen! Für
Unverfälschtheit und echte Herkunft braucht man zusätzliche Werkzeuge
wie Hashes und digitale Signaturen.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die 4 Schutzziele (Vertraulichkeit,
  Integrität, Authentizität, Nicht-Abstreitbarkeit) nennen und erklären
  können, warum reine Verschlüsselung nicht alle Schutzziele abdeckt.
- #strong[Typische Klausurfalle:] Zu glauben, dass verschlüsselte Daten
  nicht manipuliert werden können. Ein Angreifer kann Bits im Geheimtext
  kippen (Bit-Flipping), wodurch der entschlüsselte Text verfälscht wird
  -- ohne dass der Angreifer den Schlüssel kennen muss!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Ein Unternehmen verschlüsselt seine E-Mails mit AES.
Schützt dies automatisch davor, dass ein Angreifer eine gefälschte
Rechnung im Namen der Geschäftsführung einschleust? Begründen Sie Ihre
Antwort." #strong[Antwort:]

- #strong[Nein.] Verschlüsselung schützt primär die
  #strong[Vertraulichkeit] (Schutz vor unbefugtem Mitlesen).
- Sie beweist weder die echte Identität des Absenders
  (#strong[Authentizität]) noch schützt sie per se vor unbemerkter
  Veränderung (#strong[Integrität]).
- Um Fälschungen zu verhindern und den Absender nachweisbar zu binden,
  ist eine #strong[digitale Signatur] erforderlich.

]
#pagebreak(weak: true)
= Kerckhoffs' Prinzip (1883)
<kerckhoffs-prinzip-1883>
- #strong[Kernaussage]: Die Sicherheit eines Verfahrens darf #strong[nur
  vom Schlüssel] abhängen -- nicht von der Geheimhaltung des
  Algorithmus.

- Der Algorithmus darf öffentlich bekannt sein, ohne dass die Sicherheit
  leidet.

- #strong[Gegenteil]: „Security by Obscurity" -- Sicherheit durch
  Verschleierung

#quote-box[
#strong[Shannon's Maxime:] „Der Feind kennt das System."

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Das Prinzip von Auguste Kerckhoffs ist das oberste Gesetz moderner
IT-Sicherheit: Ein Haustürschloss ist sicher, weil der Schlüsselbart
komplex ist -- nicht weil die Einbrecher nicht wissen, wie ein Schloss
von innen funktioniert. #emph[Warum Geheimhaltung des Algorithmus
scheitert:] Geheim gehaltene Algorithmen fliegen früher oder später
immer auf (durch Reverse Engineering, Quellcode-Leaks oder Spionage).
Wenn die Sicherheit von der Geheimhaltung des Verfahrens abhing, ist das
Gesamtsystem sofort tot. Bei Kerckhoffs tauscht man bei einem Vorfall
einfach den Schlüssel aus -- das System bleibt sicher! #emph[Security by
Obscurity:] Das Gegenteil -- der naive Glaube, man sei sicher, nur weil
niemand weiß, wie man Daten versteckt hat.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Kerckhoffs' Prinzip präzise wiedergeben
  („Sicherheit hängt nur vom Schlüssel ab") und den Unterschied zu
  „Security by Obscurity" erklären.
- #strong[Typische Klausurfalle:] Zu behaupten, nach Kerckhoffs dürfe
  alles öffentlich sein. Falsch: Nur das #strong[Verfahren / der
  Algorithmus] ist öffentlich -- der #strong[Schlüssel] muss absolut
  geheim bleiben!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Ein Software-Entwickler schlägt vor, einen eigenen,
geheimen Verschlüsselungsalgorithmus zu entwickeln, da ein geheimer Code
schwerer anzugreifen sei. Bewerten Sie diesen Vorschlag anhand von
Kerckhoffs' Prinzip." #strong[Antwort:]

- Der Vorschlag basiert auf dem fehlerhaften Ansatz #strong[„Security by
  Obscurity"] und widerspricht direkt #strong[Kerckhoffs' Prinzip].
- #strong[Kritik:] Sicherheit darf niemals auf der Geheimhaltung des
  Algorithmus beruhen, da proprietärer Code dekompiliert, geleakt oder
  durch Insider verraten werden kann. Wird der Algorithmus bekannt, ist
  das gesamte System kompromittiert.
- #strong[Best Practice:] Einsatz offener, weltweit geprüfter Standards
  (wie AES). Bei einem Sicherheitsvorfall muss lediglich der
  #strong[Schlüssel gewechselt] werden, nicht das Verfahren.

]
#pagebreak(weak: true)
= Symmetrisch vs.~Asymmetrisch
<symmetrisch-vs.-asymmetrisch>
#grid(columns: (1fr, 1fr), gutter: 14pt, [
=== Symmetrisch
<symmetrisch>
- #strong[Ein] gemeinsamer Schlüssel
- Ver- und Entschlüsseln mit demselben Geheimnis
- Sehr #strong[schnell]
- Problem: Wie tauscht man den Schlüssel sicher aus?
- Beispiel: #strong[AES]

], [
=== Asymmetrisch
<asymmetrisch>
- #strong[Schlüsselpaar]: öffentlich + privat
- Öffentlicher verschlüsselt, privater entschlüsselt
- Deutlich #strong[langsamer]
- Löst das Austauschproblem
- Beispiel: #strong[RSA]

])
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die fundamentale Weichenstellung der Kryptographie:

- #strong[Symmetrisch (Geldkassette):] Es gibt genau einen Schlüssel,
  der zu- und aufsperrt. Alice sperrt zu, Bob sperrt auf.
  #emph[Problem:] Wie bekommt Bob den Schlüssel, ohne dass ihn unterwegs
  jemand abfängt?
- #strong[Asymmetrisch (Briefkasten / Vorhängeschloss):] Es gibt ein
  Schlüsselpaar. Bob verteilt offene Vorhängeschlösser (#emph[Public
  Key]). Jeder darf ein Schloss zuschnappen lassen (verschlüsseln). Aber
  nur Bob hat den einzigen passenden Schlüssel (#emph[Private Key]), um
  das Schloss wieder zu öffnen! #emph[Der Haken:] Asymmetrische Krypto
  erfordert gigantische mathematische Berechnungen und ist bis zu
  1.000-mal langsamer als symmetrische Verschlüsselung.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die beiden Verfahrensklassen anhand von
  4 Dimensionen vergleichen: Schlüsselanzahl, Rechengeschwindigkeit,
  Schlüsselverteilung und typische Algorithmen.
- #strong[Typische Klausurfalle:] Annehmen, asymmetrische Krypto habe
  symmetrische Krypto komplett ersetzt. Falsch: Wegen des enormen
  Geschwindigkeitsvorteils von symmetrischer Krypto nutzt man in der
  Praxis #strong[hybride Verfahren] (beide kombiniert)!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Vergleichen Sie symmetrische und asymmetrische
Verschlüsselung anhand von Schlüsselanzahl, Geschwindigkeit, dem
Schlüsselverteilungsproblem und je einem Standardbeispiel."
#strong[Antwort:]

- #strong[Schlüsselanzahl:] Symmetrisch: #strong[1 gemeinsamer geheimer
  Schlüssel]\; Asymmetrisch: #strong[Schlüsselpaar] (öffentlicher Public
  Key + privater Private Key).
- #strong[Geschwindigkeit:] Symmetrisch: #strong[Sehr schnell]
  (Hardware-beschleunigt); Asymmetrisch: #strong[Deutlich langsamer]
  (hohe CPU-Last).
- #strong[Schlüsselverteilung:] Symmetrisch: #strong[Kritisches Problem]
  (sicherer Vorabaustausch nötig); Asymmetrisch: #strong[Gelöst] (Public
  Key darf über unsichere Leitungen verteilt werden).
- #strong[Beispiele:] Symmetrisch: #strong[AES]\; Asymmetrisch:
  #strong[RSA / ECC].

]
#pagebreak(weak: true)
= Symmetrisch vs.~Asymmetrisch -- Bild
<symmetrisch-vs.-asymmetrisch-bild>
#figure(image("img/sym-vs-asym.svg", alt: "Symmetrisch vs. Asymmetrisch"),
  caption: [
    Symmetrisch vs.~Asymmetrisch
  ]
)

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Dieses Schaubild verdeutlicht den Daten- und Schlüsselfluss:

- #strong[Links (Symmetrisch):] Beide Seiten nutzen denselben roten
  Schlüssel. Das Kernproblem ist der unsichere Kanal dazwischen: Wie
  gelangt der rote Schlüssel überhaupt ungesehen zu Bob?
- #strong[Rechts (Asymmetrisch):] Bob erzeugt zwei Schlüssel: grün
  (öffentlich) und rot (privat). Alice nutzt Bobs grünen Schlüssel zum
  Verschlüsseln. Nur Bobs roter Schlüssel kann entschlüsseln. Niemand
  muss vorab ein Geheimnis austauschen!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Rollenverteilung im asymmetrischen
  Modell fehlerfrei beschreiben können.
- #strong[Typische Klausurfalle:] Den #emph[Public Key des Absenders]
  zum Verschlüsseln verwenden. Fatale Verwechslung: Alice muss zwingend
  den #strong[Public Key des Empfängers (Bob)] nutzen, denn nur der
  Empfänger besitzt den passenden Private Key zum Lesen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Alice möchte Bob eine geheime Nachricht per
asymmetrischer Verschlüsselung zukommen lassen. Welchen Schlüssel
verwendet Alice zum Verschlüsseln und welchen Schlüssel verwendet Bob
zum Entschlüsseln?" #strong[Antwort:]

- Alice verschlüsselt die Nachricht mit dem #strong[öffentlichen
  Schlüssel von Bob (Public Key Empfänger)].
- Bob entschlüsselt die Nachricht mit seinem #strong[privaten Schlüssel
  (Private Key Empfänger)].
- #emph[\(Alices eigene Schlüssel spielen beim reinen Verschlüsseln
  keine Rolle!)]

]
#pagebreak(weak: true)
= Klassische Verfahren
<klassische-verfahren>
== Wie alles begann
<wie-alles-begann>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Historische Chiffren)])[
Wir reisen zu den Wurzeln der Kryptographie: Caesar, monoalphabetische
Ersetzung und Vigenère. Warum behandeln wir das in einer modernen
IT-Vorlesung? Weil an diesen historischen Beispielen die fundamentalen
Prinzipien der Kryptoanalyse erfunden wurden: vollständiges
Durchprobieren (#strong[Brute Force]), #strong[Häufigkeitsanalyse] und
#strong[Mustererkennung].

]
#exam-box(title: [Modul-Lernziel])[
Du verstehst, warum ein mathematisch gigantischer Schlüsselraum wertlos
ist, wenn die statistische Struktur der Sprache erhalten bleibt, und wie
der Übergang von mono- zu polyalphabetischer Verschlüsselung
funktionierte.

]
#quiz-box(title: [Typische Schwerpunkte])[
Größe des Schlüsselraums bei Caesar (25 sinnvolle Schlüssel),
Häufigkeitsanalyse bei monoalphabetischer Ersetzung (E-Laut im
Deutschen) und Kasiski-Test bei Vigenère.

]
#pagebreak(weak: true)
= Die Caesar-Chiffre
<die-caesar-chiffre>
- Jeder Buchstabe wird um eine #strong[feste Zahl] verschoben
- Julius Caesar nutzte eine Verschiebung um #strong[3]

$ upright("A") arrow.r upright("D")\,quad upright("B") arrow.r upright("E")\,quad upright("C") arrow.r upright("F") dots.h $

- #strong[Beispiel] (Verschiebung 3):
  - Klartext: `HALLO`
  - Geheimtext: `KDOOR`
- #strong[Schlüssel]: die Verschiebung (nur 25 sinnvolle Möglichkeiten!)

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die Caesar-Chiffre ist das einfachste symmetrische Verfahren der
Geschichte: Man verschiebt alle Buchstaben des Alphabets um eine feste
Schrittzahl im Kreis weiter (z. B. Verschiebung 3: A $arrow.r$ D, B
$arrow.r$ E). #emph[Warum ist das heute völlig wertlos?] Bei 26
Buchstaben des Alphabets gibt es genau 25 sinnvolle Verschiebungen
(Schritt 0 oder 26 ändert nichts). Ein Angreifer muss lediglich 25
Zeilen aufschreiben -- nach zwei Minuten ist der Klartext gefunden! Das
ist die Urform des #strong[Brute-Force-Angriffs].

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Ein kurzes Wort (z. B. 4--5 Buchstaben)
  per Hand mit vorgegebener Verschiebung ver- und entschlüsseln können
  und die Schwäche des winzigen Schlüsselraums begründen.
- #strong[Typische Klausurfalle:] 26 statt 25 Schlüssel angeben (eine
  Verschiebung um 0 verschlüsselt nicht) oder den zyklischen Übertrag am
  Ende des Alphabets (z. B. Z $arrow.r$ C) vergessen.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Gegeben ist der Geheimtext 'KDOOR', der mit der
Caesar-Chiffre (Verschiebung um 3) erzeugt wurde. Entschlüsseln Sie das
Wort und begründen Sie, warum Caesar nach heutigen IT-Standards völlig
unsicher ist." #strong[Antwort:]

- #strong[Entschlüsselung:] Jeden Buchstaben um 3 Stellen im Alphabet
  zurückschieben: K $arrow.r$ H, D $arrow.r$ A, O $arrow.r$ L, O
  $arrow.r$ L, R $arrow.r$ O $arrow.r$ Klartext: #strong[HALLO].
- #strong[Begründung:] Der Schlüsselraum umfasst lediglich #strong[25
  sinnvolle Schlüssel]. Ein Angreifer kann alle Möglichkeiten innerhalb
  von Sekundenbruchteilen durch vollständiges Ausprobieren
  (#strong[Brute-Force-Angriff]) brechen.

]
#pagebreak(weak: true)
= Monoalphabetische Substitution
<monoalphabetische-substitution>
- Statt fester Verschiebung: #strong[jeder Buchstabe] wird durch einen
  beliebigen anderen ersetzt

- Schlüsselraum: $26 ! approx 4 times 10^26$ Möglichkeiten -- riesig!

- #strong[Trotzdem leicht zu brechen.] Warum?

  - Die Struktur der Sprache bleibt erhalten
  - Häufige Buchstaben bleiben häufig -- nur unter anderem Namen

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Um Caesars Brute-Force-Schwäche zu beheben, dachte man sich: Weisen wir
doch jedem Buchstaben einen zufälligen Tauschpartner zu (z. B. A
$arrow.r$ Q, B $arrow.r$ Z)! #emph[Das scheinbare Wunder:] Die Anzahl
möglicher Tausch-Alphabete beträgt $26 ! approx 4 times 10^26$. Das sind
mehr Schlüssel als Sekunden seit dem Urknall! Brute Force ist absolut
chancenlos. #emph[Das fatale Problem:] Das Verfahren ist
#strong[monoalphabetisch] (ein festes Tausch-Alphabet). Jedes `E` im
Klartext wird #emph[immer] zum selben Geheimtextzeichen. Die natürliche
Struktur der Sprache bleibt 1:1 erhalten!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die zentrale Krypto-Lektion formulieren:
  #emph[Ein riesiger Schlüsselraum ist eine notwendige, aber keine
  hinreichende Bedingung für Sicherheit!]
- #strong[Typische Klausurfalle:] Annehmen, dass $10^26$ Kombinationen
  Sicherheit garantieren. Findet die Kryptoanalyse eine strukturelle
  Abkürzung, bricht das Verfahren trotz Riesen-Schlüsselraum zusammen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum kann ein Verschlüsselungsverfahren trotz eines
astronomisch großen Schlüsselraums von $4 dot.op 10^26$ Möglichkeiten
leicht gebrochen werden? Erläutern Sie dies am Beispiel der
monoalphabetischen Substitution." #strong[Antwort:]

- Ein großer Schlüsselraum schützt lediglich vor vollständigem
  Durchprobieren (#strong[Brute Force]).
- Bei der monoalphabetischen Substitution bleibt jedoch die
  #strong[statistische Struktur der natürlichen Sprache] vollständig
  erhalten.
- Ein Angreifer muss nicht den Schlüsselraum durchsuchen, sondern nutzt
  eine #strong[Abkürzung (Häufigkeitsanalyse)], um die
  Buchstabenpaarungen schrittweise zu rekonstruieren.

]
#pagebreak(weak: true)
= Kryptoanalyse: Häufigkeitsanalyse
<kryptoanalyse-häufigkeitsanalyse>
- Jede Sprache hat eine #strong[typische Buchstabenverteilung]

- Im Deutschen: #strong[E] ist mit Abstand am häufigsten (\~17 %), dann
  N, I, S, R

- Der häufigste Buchstabe im Geheimtext ist also vermutlich das
  #strong[E]

- #strong[Vorgehen]:

  - Buchstaben im Geheimtext zählen
  - Mit bekannter Sprachstatistik abgleichen
  - Schritt für Schritt das Alphabet rekonstruieren

#quote-box[
Erstmals dokumentiert vom Gelehrten #strong[al-Kindī] (9. Jh.) -- die
Geburt der Kryptoanalyse.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die Häufigkeitsanalyse nutzt aus, dass menschliche Sprachen feste
statistische Fingerabdrücke haben. Im Deutschen ist der Buchstabe
#strong[E] mit ca. 17 % der unangefochtene Spitzenreiter -- fast jeder
sechste Buchstabe ist ein E! #emph[Alltagsvergleich:] Stell dir eine
Gruppe Verkleideter vor. Selbst wenn alle Masken tragen: Die Person, die
17-mal so oft zu sehen ist wie alle anderen, ist mit Sicherheit das E.
Findet man dann noch typische Paare wie „EN" oder Dreierketten wie
„SCH", zerfällt die Verschlüsselung wie ein Kreuzworträtsel. Erfunden
wurde diese Methode bereits im 9. Jahrhundert vom arabischen Gelehrten
al-Kindī.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Ablauf der Häufigkeitsanalyse
  beschreiben und erklären, warum längere Texte deutlich leichter zu
  brechen sind als kurze Sätze.
- #strong[Typische Klausurfalle:] Zu glauben, dass der häufigste
  Buchstabe immer zwingend das E ist. Bei sehr kurzen Texten (z. B.
  kurzen Funksprüchen) kann die Statistik schwanken -- erst bei
  ausreichender Textlänge nähert sich die Verteilung der Sprachstatistik
  an!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erläutern Sie das Funktionsprinzip der
Häufigkeitsanalyse und nennen Sie zwei Bedingungen, die ihren Erfolg
begünstigen." #strong[Antwort:]

- #strong[Funktionsprinzip:] Man zählt die relative Häufigkeit aller
  Zeichen im Geheimtext und vergleicht sie mit der bekannten
  Buchstabenverteilung der Zielsprache (z. B. Deutsch: E $approx$ 17 %,
  gefolgt von N, I, S).
- #strong[Bedingung 1 (Textlänge):] Ein möglichst langer Geheimtext, da
  sich die relative Häufigkeit erst mit wachsender Textlänge der
  Normalverteilung angleicht.
- #strong[Bedingung 2 (Sprachkenntnis):] Kenntnis der verwendeten
  Klartextsprache und des Fachgebiets (z. B. militärische Abkürzungen).

]
#pagebreak(weak: true)
= Die Vigenère-Chiffre
<die-vigenère-chiffre>
- #strong[Idee]: Verschiebung wechselt pro Buchstabe -- gesteuert durch
  ein #strong[Schlüsselwort]

- Gilt lange als „le chiffre indéchiffrable" (die unknackbare Chiffre)

- #strong[Beispiel] mit Schlüssel `KEY`:

#figure(
  align(center)[#table(
    columns: 6,
    align: (auto,auto,auto,auto,auto,auto,),
    table.header([Klartext], [H], [A], [L], [L], [O],),
    table.hline(),
    [Schlüssel], [K], [E], [Y], [K], [E],
    [Geheimtext], [R], [E], [J], [V], [S],
  )]
  , kind: table
  )

- Gleicher Klartextbuchstabe → #strong[unterschiedliche]
  Geheimtextbuchstaben

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Blaise de Vigenère fand die Antwort auf die Häufigkeitsanalyse: Wenn ein
einziges Tausch-Alphabet verräterisch ist, nutzen wir eben mehrere im
Wechsel (#strong[polyalphabetische Chiffre])! #emph[Wie funktioniert
es?] Man wählt ein Schlüsselwort (z. B. `KEY`) und schreibt es
wiederholt über den Klartext. Der 1. Buchstabe wird mit `K` verschoben,
der 2. mit `E`, der 3. mit `Y`, der 4. wieder mit `K`… #emph[Der geniale
Effekt:] Im Wort `HALLO` wird das erste `L` mit `Y` verschoben (ergibt
`J`), das zweite `L` mit `K` (ergibt `V`). Derselbe Buchstabe wird an
verschiedenen Stellen zu völlig anderen Geheimtextzeichen! Die einfache
Häufigkeitsanalyse läuft komplett ins Leere.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Den Unterschied zwischen
  monoalphabetischer und polyalphabetischer Substitution erklären und an
  einem Tabellenbeispiel nachvollziehen.
- #strong[Typische Klausurfalle:] Annehmen, Vigenère sei tatsächlich
  unknackbar (galt 300 Jahre lang so!). Das Verfahren hat eine
  versteckte Sollbruchstelle: die zyklische Wiederholung des
  Schlüsselworts!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum versagt eine einfache Häufigkeitsanalyse bei der
Vigenère-Chiffre? Erläutern Sie das Prinzip anhand des Begriffs
'polyalphabetisch'\." #strong[Antwort:]

- Vigenère ist eine #strong[polyalphabetische Chiffre]: Die Verschiebung
  wechselt zeichenweise anhand eines zyklisch wiederholten
  Schlüsselworts.
- Dadurch wird derselbe Klartextbuchstabe an verschiedenen Textstellen
  auf #strong[unterschiedliche Geheimtextbuchstaben] abgebildet.
- Die statistischen Spitzen der Buchstabenhäufigkeit werden im
  Geheimtext #strong[„eingeebnet" / verschmiert], sodass ein direkter
  Abgleich mit der Sprachstatistik scheitert.

]
#pagebreak(weak: true)
= Auch Vigenère fällt
<auch-vigenère-fällt>
- #strong[Schwäche]: Das Schlüsselwort #strong[wiederholt sich]
  periodisch

- Findet man die #strong[Schlüssellänge], zerfällt Vigenère in mehrere
  #emph[Caesar]-Chiffren

- Jede davon ist per Häufigkeitsanalyse angreifbar

- #strong[Kasiski-Test (1863)]: Wiederkehrende Muster im Geheimtext
  verraten die Schlüssellänge

#quote-box[
#strong[Lehre:] „Unknackbar" bedeutet meist nur „noch nicht geknackt".

]
#quote-box[
#strong[Mini-Beispiel:] Wiederholen sich auffällige Zeichenfolgen im
Abstand von 6 und 12 Zeichen, ist eine Schlüssellänge von 3 oder 6 ein
möglicher Kandidat.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Warum fiel auch Vigenère? Wegen der periodischen Wiederholung des
Schlüsselworts! #emph[Kasiski-Test (1863):] Wenn zufällig dieselbe
Buchstabengruppe im Klartext (z. B. „UND") auf denselben Teil des
Schlüsselworts trifft, entsteht im Geheimtext exakt dieselbe
Buchstabenkombination. Misst man den Abstand zwischen diesen
Wiederholungen (z. B. 12, 18, 24 Zeichen), liefert der gemeinsame Teiler
(hier: 6) mit hoher Wahrscheinlichkeit die #strong[Schlüssellänge]!
Sobald man weiß: „Das Schlüsselwort ist 6 Buchstaben lang", zerlegt man
den Geheimtext in 6 Stapel. Jeder Stapel für sich ist eine stinknormale
Caesar-Chiffre -- und wird mit Häufigkeitsanalyse geknackt!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die 3 Schritte des Kasiski-Tests
  skizzieren: Wiederholungen finden $arrow.r$ Schlüssellänge bestimmen
  $arrow.r$ in Caesar-Teilchiffren zerlegen.
- #strong[Typische Klausurfalle:] Zu glauben, der Kasiski-Test liefere
  direkt das Schlüsselwort. Falsch: Er liefert nur die #strong[Länge]
  des Schlüssels! Das Wort selbst wird anschließend per
  Häufigkeitsanalyse ermittelt.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Skizzieren Sie das Vorgehen des Kasiski-Tests zur
Kryptoanalyse der Vigenère-Chiffre in drei Schritten." #strong[Antwort:]

- + #strong[Mustererkennung:] Auffinden identischer Zeichenfolgen, die
    sich im Geheimtext wiederholen.
- #block[
  #set enum(numbering: "1.", start: 2)
  + #strong[Abstandsanalyse:] Ermittlung der Abstände zwischen den
    Wiederholungen und Bestimmung des größten gemeinsamen Teilers
    $arrow.r$ Kandidat für die #strong[Schlüssellänge $n$].
  ]
- #block[
  #set enum(numbering: "1.", start: 3)
  + #strong[Zerlegung:] Aufteilung des Texts in $n$ Teiltexte (jeder
    $n$-te Buchstabe). Jeder Teiltext entspricht einer simplen
    Caesar-Chiffre und wird per #strong[Häufigkeitsanalyse] gebrochen.
  ]

]
#pagebreak(weak: true)
= Exkurs: Die Enigma
<exkurs-die-enigma>
== Geniale Maschine, fatale Schwächen
<geniale-maschine-fatale-schwächen>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Der Enigma-Exkurs)])[
Die Enigma ist das faszinierendste historische Beispiel für das
Scheitern eines scheinbar perfekten Kryptosystems. Sie war eine
ingenieurtechnische Meisterleistung mit rund $10^23$ Kombinationen.
Dennoch wurde sie geknackt -- nicht durch rohe Rechengewalt, sondern
durch Konstruktionsfehler und menschliche Routine im militärischen
Alltag.

]
#exam-box(title: [Modul-Lernziel])[
Du begreifst Kryptographie als #strong[soziotechnisches Gesamtsystem]:
Sicherheit scheitert fast nie an der reinen Rechenleistung des
Angreifers, sondern am Zusammenspiel aus fehlerhafter Konstruktion,
schwachem Schlüsselmanagement und vorhersehbarem Benutzerverhalten.

]
#quiz-box(title: [Typische Schwerpunkte])[
Der Konstruktionsfehler des Reflektors („Kein Buchstabe wird auf sich
selbst abgebildet"), die Bedeutung von Cribs (Known-Plaintext-Angriff)
und die Rolle von Bletchley Park / Alan Turing.

]
#pagebreak(weak: true)
= Enigma -- Kontext & Bedeutung
<enigma-kontext-bedeutung>
- Deutsche Rotor-Chiffriermaschine, im #strong[\2. Weltkrieg]
  militärisch eingesetzt
- Elektromechanische Umsetzung einer #strong[polyalphabetischen] Chiffre
- Galt als praktisch unknackbar -- Schlüsselraum von rund $10^23$
- Ihr Bruch durch die Alliierten hatte #strong[kriegsentscheidende]
  Bedeutung

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die Enigma übertrug die Idee der polyalphabetischen Verschlüsselung in
ein mechanisches Wunderwerk: Bei jedem Tastendruck drehten sich
Zahnräder (Rotoren) weiter. Dadurch änderte sich der interne Stromfluss
und somit das Verschlüsselungsalphabet nach jedem einzelnen Buchstaben.
Mit 3 bis 4 Walzen und einem Steckerbrett besaß sie rund $10^23$
mögliche Einstellungen -- mehr als Sandkörner auf der Erde! Das deutsche
Militär hielt die Maschine für absolut unknackbar. Ihr Bruch durch
polnische und britische Codebreaker verkürzte den Zweiten Weltkrieg um
schätzungsweise zwei Jahre.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Enigma als elektromechanische
  polyalphabetische Rotor-Chiffre einordnen und erklären, warum der
  riesige Schlüsselraum ($10^23$) allein keinen Sicherheitsbeweis
  darstellt.
- #strong[Typische Klausurfalle:] Die Enigma als digitalen Computer
  bezeichnen. Sie war ein rein elektromechanisches Gerät (Tastatur,
  Walzen, Glühlämpchen, Batterie).

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Auf welchem Prinzip basierte die
Enigma-Chiffriermaschine und warum garantierte ihr Schlüsselraum von ca.
$10^23$ Möglichkeiten keine dauerhafte Sicherheit?" #strong[Antwort:]

- #strong[Prinzip:] Elektromechanische #strong[polyalphabetische
  Substitution]\; rotierende Walzen und ein Steckerbrett veränderten den
  Stromkreis nach jedem Tastenanschlag.
- #strong[Warum nicht sicher:] Kryptoanalytiker mussten den
  Schlüsselraum nicht vollständig durchprobieren (#strong[kein Brute
  Force nötig]), da Konstruktionsmängel und menschliche Bedienfehler
  logische Abkürzungen boten.

]
#pagebreak(weak: true)
= Enigma -- Tagesschlüssel
<enigma-tagesschlüssel>
- Sicherheit hing an der #strong[Grundeinstellung] (dem
  „Tagesschlüssel"):
  - Auswahl & Reihenfolge der Walzen
  - Startposition jeder Walze
  - Steckerbrett-Verbindungen
- Verteilt über #strong[gedruckte Codebücher] an alle Funkstellen
- Schlüsselwechsel täglich um Mitternacht

#quote-box[
Kerckhoffs in Reinform: Die Maschine war den Alliierten bekannt --
geheim war nur der Tagesschlüssel.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die Enigma ist gelebtes Kerckhoffs-Prinzip: Die Maschine selbst war den
Alliierten bekannt (erbeutete Exemplare). Die Sicherheit ruhte
ausschließlich auf dem #strong[Tagesschlüssel]: Welche Walzen kommen in
welcher Reihenfolge hinein? Welche Stecker werden gesteckt? Wie stehen
die Ringe? #emph[Das fatale Verteilungsproblem:] Diese Tagesschlüssel
mussten auf Papier in dicken #strong[Codebüchern] monatlich an alle
U-Boote und Funkstellen verteilt werden. Wurde ein einziges Codebuch von
einem sinkenden U-Boot erbeutet, war der Funkverkehr eines ganzen Monats
für die Alliierten im Klartext lesbar!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Bestandteile des Tagesschlüssels
  benennen, Kerckhoffs' Prinzip darauf anwenden und die Gefahren
  physischer Schlüsselverteilung aufzeigen.
- #strong[Typische Klausurfalle:] Tagesschlüssel mit der Maschine
  verwechseln. Die Maschine ist der Algorithmus (Chiffre), die
  Codebucheinstellung ist der geheime Schlüssel!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Inwiefern illustriert der Einsatz der Enigma
Kerckhoffs' Prinzip, und welches fundamentale Sicherheitsproblem
entstand durch die Nutzung von Tagesschlüsseln?" #strong[Antwort:]

- #strong[Kerckhoffs' Prinzip:] Der Aufbau der Maschine war den
  Alliierten bekannt; die Geheimhaltung lag ausschließlich in der
  täglichen Einstellung (#strong[Tagesschlüssel]).
- #strong[Sicherheitsproblem:] Die Tagesschlüssel mussten physisch über
  gedruckte #strong[Codebücher] an hunderte Funkstellen verteilt werden.
  Ein erbeutetes Codebuch kompromittierte das gesamte
  Kommunikationsnetzwerk für den entsprechenden Zeitraum.

]
#pagebreak(weak: true)
= Enigma -- Die Schwächen
<enigma-die-schwächen>
- #strong[Konstruktionsfehler Reflektor]: Kein Buchstabe konnte auf
  #strong[sich selbst] abgebildet werden
  - Ein A wurde nie zu einem A → wertvoller Ansatzpunkt für Angreifer
- #strong[Bedienfehler]:
  - Vorhersehbare Nachrichten („Wetterbericht", „Keine besonderen
    Vorkommnisse")
  - Wiederholte Standardfloskeln als #strong[Cribs] (vermutete
    Klartextstücke)
  - Schwache, wiederholte Spruchschlüssel der Funker
- #strong[Menschliche Routine] unterlief die geniale Technik

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Zwei verhängnisvolle Faktoren brachten die Enigma zu Fall:

+ #strong[Der Konstruktionsfehler (Reflektor):] Durch die elektrische
  Rückführung konnte #strong[ein Buchstabe niemals auf sich selbst
  verschlüsselt werden] (ein A wurde nie zu einem A!).
+ #strong[Die menschliche Routine (Cribs):] Deutsche Funker sendeten
  jeden Morgen pünktlich Standardmeldungen mit identischem Wortlaut (z.
  B. `WETTERBERICHT`). #emph[Der geniale Hebel:] Die Codebreaker legten
  das Wort `WETTERBERICHT` an jede Position des Geheimtexts. Sobald an
  einer Stelle derselbe Buchstabe auftauchte (z. B. Geheimtext hat an
  Stelle 3 ein `T`), wusste man: #emph[Diese Position ist unmöglich!] So
  wurden Millionen Stellungen in Sekunden verworfen.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die beiden Schwachstellen (Konstruktion
  vs.~Bedienung) trennen und den Begriff #strong[Crib] als vermuteten
  Klartextteil (#strong[Known-Plaintext-Angriff]) erklären.
- #strong[Typische Klausurfalle:] Annehmen, die Alliierten hätten bloß
  geraten. Es war systematische Ausnutzung von Konstruktionsfehlern und
  Bedienroutinen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Erläutern Sie, warum die Reflektor-Eigenschaft der
Enigma ('kein Buchstabe wird auf sich selbst abgebildet') in Kombination
mit vorhersehbaren Funksprüchen (Cribs) einen fatalen Angriffspunkt
bot." #strong[Antwort:]

- #strong[Ausschlusskriterium:] Wenn kein Buchstabe auf sich selbst
  abgebildet werden kann, lässt sich jede Ausrichtung eines vermuteten
  Klartexts (#strong[Crib], z. B. 'WETTERBERICHT') sofort verwerfen, bei
  der ein Klartextbuchstabe mit dem Geheimtextbuchstaben übereinstimmt.
- #strong[Suchraum-Reduktion:] Dadurch konnten Kryptoanalytiker falsche
  Walzenstellungen massenhaft und automatisiert ausschließen, ohne sie
  aufwendig durchrechnen zu müssen.

]
#pagebreak(weak: true)
= Enigma -- Bletchley Park & Turing
<enigma-bletchley-park-turing>
- Britisches Entschlüsselungszentrum #strong[Bletchley Park]
- #strong[Alan Turing] entwickelte die elektromechanische
  #strong[„Bombe"]
  - Testete systematisch Rotorstellungen und schloss Widersprüche aus
  - Nutzte Cribs, um den Suchraum drastisch zu verkleinern
- Vorarbeiten polnischer Mathematiker (u. a. #strong[Marian Rejewski])
- Ergebnis: #strong[„Ultra"] -- ein entscheidender alliierter
  Nachrichtenvorteil

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
In Bletchley Park bündelten die Briten tausende Denker. Alan Turing
entwickelte elektromechanische Großrechner -- die berühmten
#strong[„Bomben"]. #emph[Wichtige Klarstellung:] Turings Bombe war
#strong[keine] Brute-Force-Maschine! Alle $10^23$ Kombinationen
durchzuprobieren hätte Jahrhunderte gedauert. Stattdessen verdrahtete
die Bombe die logischen Bedingungen eines Cribs. Trat ein elektrischer
Widerspruch auf, schloss sie blitzschnell ganze Walzenkonfigurationen
aus, bis nur wenige Kandidaten übrig blieben. #emph[Historische
Gerechtigkeit:] Die theoretischen Grundlagen und die erste
Rekonstruktion der Enigma stammten von genialen polnischen Mathematikern
um #strong[Marian Rejewski], die ihr Wissen 1939 weitergaben!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Funktionsweise von Turings „Bombe"
  als #strong[logisches Ausschlussverfahren] beschreiben und die Rolle
  polnischer Vorarbeiten kennen.
- #strong[Typische Klausurfalle:] Turing als alleinigen Erfinder
  darzustellen, der einen modernen Computer gebaut habe. Es war eine
  elektromechanische Maschine, die auf polnischen mathematischen
  Vorarbeiten aufbaute!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „War Alan Turings 'Bombe' in Bletchley Park eine reine
Brute-Force-Maschine? Erläutern Sie ihre tatsächliche Funktionsweise
kurz." #strong[Antwort:]

- #strong[Nein.] Ein vollständiges Durchprobieren von $10^23$
  Möglichkeiten wäre selbst elektromechanisch viel zu langsam gewesen.
- Die Bombe nutzte #strong[logische Ausschlussverfahren]: Auf Basis
  vermuteter Klartexte (Cribs) suchte sie nach elektrischen
  Widersprüchen und verwarf fehlerhafte Rotorstellungen blockweise in
  Sekundenbruchteilen.

]
#pagebreak(weak: true)
= Enigma -- Was wir lernen
<enigma-was-wir-lernen>
- #strong[Kerckhoffs bestätigt]: Sicherheit lag im Schlüssel, nicht in
  der geheimen Maschine
- #strong[Komplexität ≠ Sicherheit]: $10^23$ Kombinationen halfen nicht
  gegen kluge Angriffe
- #strong[Der Mensch ist das Risiko]: Bedienfehler brachen die Chiffre,
  nicht die Mathematik
- #strong[Bekannter Klartext ist gefährlich]: Cribs sind ein realer
  Angriffsvektor -- bis heute

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Vier zeitlose Lehren, die 1:1 für moderne IT-Systeme gelten:

+ #strong[Kerckhoffs bestätigt:] Sobald der Feind die Maschine kennt,
  hängt alles am sicheren Schlüssel.
+ #strong[Komplexität schützt nicht:] Große Schlüsselräume nützen
  nichts, wenn mathematische Abkürzungen existieren.
+ #strong[Der Mensch ist die Schwachstelle:] Bequemlichkeit, schlechte
  Passwörter und Standardroutinen brechen die beste Kryptographie.
+ #strong[Known Plaintext ist real:] Angreifer kennen oft Teile der
  Nachricht (z. B. HTML-Tags, Dateiköpfe von PDFs). Moderne Algorithmen
  müssen mathematisch beweisen, dass sie selbst bei bekanntem Klartext
  sicher sind!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die 4 Lehren der Enigma auf moderne
  IT-Szenarien übertragen können (z. B. Known-Plaintext-Angriffe auf
  Protokolle).
- #strong[Typische Klausurfalle:] Historische Fehler als „von gestern"
  abzutun. Vorhersehbare Dateiformate (z. B. PDF- oder PNG-Header) sind
  exakt die modernen Cribs heutiger Hacker!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Nennen Sie zwei zeitlose Lehren aus dem Bruch der
Enigma und übertragen Sie eine davon auf ein modernes
IT-Sicherheitsszenario." #strong[Antwort:]

- #strong[Lehre 1:] #strong[Komplexität garantiert keine Sicherheit]
  (ein großer Schlüsselraum schützt nicht vor strukturellen
  Konstruktionsmängeln).
- #strong[Lehre 2:] #strong[Menschliche Routine untergräbt Sicherheit]
  (Bedienfehler und vorhersehbare Abläufe brechen starke Chiffren).
- #strong[Transfer:] In modernen Netzwerken sind Dateiköpfe (z. B.
  standardisierte HTTP-Header oder Bilddateien) für Angreifer bekannt
  (#strong[Known Plaintext / moderner Crib]). Verschlüsselungsverfahren
  müssen daher mathematisch beweisbar resistent gegen
  Known-Plaintext-Angriffe sein.

]
#pagebreak(weak: true)
= Symmetrische Verschlüsselung heute
<symmetrische-verschlüsselung-heute>
== Der Standard: AES
<der-standard-aes>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Moderner Standard AES)])[
Wir verlassen die Geschichte und kommen im Hier und Jetzt an. Nach den
Lehren der Vergangenheit und der Schwächung des alten DES-Standards
suchte die Welt einen unzerstörbaren, offenen Standard für symmetrische
Verschlüsselung. Das Ergebnis heißt AES (Advanced Encryption Standard).

]
#exam-box(title: [Modul-Lernziel])[
Du verstehst AES als weltweiten De-facto-Standard für symmetrische
Blockchiffren, kennst die standardisierten Schlüssellängen (128, 192,
256 Bit) und begreifst das grundlegende Dilemma aller symmetrischen
Systeme: das Schlüsselverteilungsproblem.

]
#quiz-box(title: [Typische Schwerpunkte])[
Unterscheidung von Blockgröße (immer 128 Bit) vs.~Schlüssellänge (128,
192, 256 Bit), offener Standardisierungsprozess des NIST und die
Berechnungsformel des Schlüsselverteilungsproblems ($n\(n - 1\)\/2$).

]
#pagebreak(weak: true)
= AES -- Advanced Encryption Standard
<aes-advanced-encryption-standard>
- #strong[2001] vom US-Institut NIST standardisiert (Vorgänger: DES)
- Gewinner eines #strong[offenen, öffentlichen] Wettbewerbs (Algorithmus
  „Rijndael")
- #strong[Blockchiffre]: verschlüsselt Daten in Blöcken zu 128 Bit
- Schlüssellängen: #strong[128, 192 oder 256 Bit]
- Weltweiter Standard: TLS, VPN, WLAN (WPA2/3), Festplatten, Messenger

#quote-box[
#strong[Vor dem Modus:] Längere Nachrichten bestehen aus mehreren
128-Bit-Blöcken. Ein Betriebsmodus legt fest, wie diese Blöcke zusammen
verarbeitet werden.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
AES ist das unangefochtene Arbeitspferd der weltweiten
Datenverschlüsselung: TLS/HTTPS, WLAN (WPA2/3),
Festplattenverschlüsselung (BitLocker), WhatsApp -- überall rechnet AES.
#emph[Was bedeutet Blockchiffre?] AES verschlüsselt Daten nicht
kontinuierlich Bit für Bit, sondern zerlegt Nachrichten in feste
Datenblöcke von genau #strong[128 Bit] (16 Byte). Jeder Block wird in
mehreren mathematischen Runden (Substitutions- und Permutationsschritte)
gründlich durchgemischt. #emph[Schlüssellängen:] 128 Bit reicht für
praktisch alle kommerziellen Zwecke; 256 Bit wird für höchste
Geheimhaltungsstufen und Post-Quantum-Schutz genutzt.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Kernfakten von AES kennen:
  Symmetrische Blockchiffre, feste Blockgröße (128 Bit) und drei
  standardisierte Schlüssellängen (128, 192, 256 Bit).
- #strong[Typische Klausurfalle:] Blockgröße und Schlüssellänge
  verwechseln! Die Blockgröße ist bei AES #strong[immer 128 Bit] -- egal
  wie lang der Schlüssel ist!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Nennen Sie den Chiffrentyp von AES (Block- oder
Stromchiffre), die feste Blockgröße sowie die drei standardisierten
Schlüssellängen." #strong[Antwort:]

- #strong[Chiffrentyp:] Symmetrische #strong[Blockchiffre].
- #strong[Blockgröße:] Immer #strong[128 Bit] (16 Bytes).
- #strong[Schlüssellängen:] #strong[128 Bit, 192 Bit oder 256 Bit].

]
#pagebreak(weak: true)
= AES -- warum so vertrauenswürdig?
<aes-warum-so-vertrauenswürdig>
- #strong[Offen & geprüft]: Über 20 Jahre weltweite Kryptoanalyse ohne
  praktischen Bruch
- #strong[Schnell]: Moderne CPUs haben AES #strong[in Hardware]
  eingebaut (AES-NI)
- #strong[Skalierbar]: 128 Bit für fast alles, 256 Bit für höchste
  Ansprüche
- #strong[Brute Force chancenlos]: $2^128$ Schlüssel -- astronomisch
  groß

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Warum vertraut die ganze Welt ihre intimsten Daten AES an?

+ #strong[Offenheit (Kerckhoffs):] Der Algorithmus (Rijndael) gewann
  einen weltweiten, offenen Wettbewerb des US-NIST. Seit über 20 Jahren
  attackieren die besten Kryptoanalytiker weltweit AES -- ohne
  praktischen Erfolg!
+ #strong[Hardware-Turbo:] Moderne CPUs (Intel, AMD, Apple) haben
  spezielle Befehlssätze (#strong[AES-NI]). Dadurch verschlüsselt dein
  Rechner Gigabytes pro Sekunde, ohne spürbare CPU-Last.
+ #strong[Astronomischer Schlüsselraum:] $2^128$ Schlüssel sind so
  gigantisch, dass selbst alle Supercomputer der Welt seit Entstehung
  des Universums nur einen winzigen Bruchteil hätten testen können!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die drei Säulen des Vertrauens in AES
  erläutern (offener Standard, fehlender mathematischer Bruch,
  Hardwarebeschleunigung via AES-NI).
- #strong[Typische Klausurfalle:] Einen 128-Bit-AES-Schlüssel mit einem
  128-Zeichen-Passwort gleichzusetzen. Ein kryptographischer Schlüssel
  ist eine rein zufällige Folge von 128 Bits mit maximaler Entropie!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum gilt ein Brute-Force-Angriff auf einen
128-Bit-AES-Schlüssel nach heutigem Stand der Wissenschaft als
unmöglich?" #strong[Antwort:]

- Ein 128-Bit-Schlüsselraum umfasst $2^128 approx 3\,4 dot.op 10^38$
  mögliche Schlüssel.
- Selbst wenn Milliarden Hochleistungsrechner parallel Milliarden
  Schlüssel pro Sekunde prüfen würden, würde das vollständige
  Durchprobieren #strong[Milliarden von Jahren] (länger als das Alter
  des Universums) dauern.

]
#pagebreak(weak: true)
= Das Schlüsselverteilungsproblem
<das-schlüsselverteilungsproblem>
- AES ist schnell und sicher -- aber #strong[beide Seiten brauchen
  denselben Schlüssel]
- Wie kommt der Schlüssel sicher zum Empfänger?
  - Persönlich übergeben? Unpraktisch bei Millionen Nutzern
  - Über das Internet schicken? Dann kann ihn jeder abfangen
- Bei $n$ Teilnehmern: $frac(n\(n - 1\), 2)$ Schlüssel nötig
  - 1.000 Nutzer → \~500.000 Schlüssel

#quote-box[
#strong[Das zentrale Dilemma der symmetrischen Kryptographie.]

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Hier ist das zentrale Dilemma der symmetrischen Kryptographie: AES ist
unknackbar und rasend schnell -- aber wie bekommen zwei Personen
überhaupt denselben geheimen Schlüssel? #emph[Das Henne-Ei-Problem:]
Wenn Alice und Bob über das Internet kommunizieren, können sie den
Schlüssel nicht einfach unverschlüsselt schicken -- ein Angreifer würde
ihn abfangen! Um den Schlüssel sicher zu übertragen, bräuchten sie
bereits einen sicheren Kanal. #emph[Die Schlüsselextrapolation:] Bei $n$
Teilnehmern braucht jedes Paar einen eigenen Schlüssel:
$ frac(n\(n - 1\), 2) $ Bei nur 1.000 Nutzern sind das bereits knapp
#strong[500.000 Schlüssel]! Wer soll die sicher verwalten?

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die zwei Facetten des Problems benennen
  (Austausch über unsicheren Kanal + quadratische Explosion der
  Schlüsselanzahl) und die Formel $n\(n - 1\)\/2$ anwenden können.
- #strong[Typische Klausurfalle:] Die Division durch 2 in der Formel
  vergessen. Ohne geteilt durch 2 zählt man jedes Schlüsselpaar doppelt!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „In einem Unternehmen mit 200 Mitarbeitern soll jeder
mit jedem symmetrisch verschlüsselt kommunizieren. Wie viele Schlüssel
werden benötigt und welches fundamentale Sicherheitsproblem entsteht?"
#strong[Antwort:]

- #strong[Berechnung:]
  $frac(n\(n - 1\), 2) = frac(200 dot.op 199, 2) = 19.900$ Schlüssel.
- #strong[Fundamentales Problem (Schlüsselverteilungsproblem):]
  + #strong[Skalierungsproblem:] Die Anzahl der Schlüssel wächst
    quadratisch mit der Teilnehmerzahl ($O\(n^2\)$).
  + #strong[Austauschproblem:] Wie werden diese 19.900 geheimen
    Schlüssel sicher an die Teilnehmer verteilt, ohne dass sie auf dem
    Übertragungsweg abgefangen werden?

]
#pagebreak(weak: true)
= Schlüsselaustausch & Asymmetrie
<schlüsselaustausch-asymmetrie>
== Der Durchbruch der 1970er
<der-durchbruch-der-1970er>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Die Krypto-Revolution)])[
Bis Mitte der 1970er Jahre galt es als physikalisches Gesetz: Wer sicher
kommunizieren will, muss sich vorher heimlich getroffen haben, um einen
Schlüssel auszutauschen. Dann kamen Whitfield Diffie, Martin Hellman,
Ralph Merkle sowie Rivest, Shamir und Adleman (RSA). Sie stellten die
Krypto-Welt auf den Kopf!

]
#exam-box(title: [Modul-Lernziel])[
Du verstehst, wie man über einen völlig unsicheren, abgehörten Kanal ein
gemeinsames Geheimnis erzeugt (Diffie-Hellman), wie das Prinzip der
asymmetrischen Schlüsselpaare funktioniert und warum RSA auf
Primfaktorzerlegung beruht.

]
#quiz-box(title: [Typische Schwerpunkte])[
Ablauf von Diffie-Hellman (Farbanalogie), Funktionsweise von Public &
Private Key, mathematische Grundlage von RSA und die Verwundbarkeit von
reinem DH gegen Man-in-the-Middle-Angriffe.

]
#pagebreak(weak: true)
= Diffie-Hellman -- die Idee
<diffie-hellman-die-idee>
- #strong[Problem gelöst 1976]: Zwei Parteien vereinbaren über einen
  #strong[öffentlichen] Kanal einen #strong[gemeinsamen geheimen]
  Schlüssel
- Ein Lauscher, der alles mithört, kann das Geheimnis #strong[trotzdem
  nicht] berechnen
- Grundlage: eine mathematische #strong[Einwegfunktion] (leicht
  vorwärts, praktisch unmöglich rückwärts)

#quote-box[
Kein Schlüssel wird je übertragen -- er wird auf beiden Seiten
#strong[berechnet].

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Stell dir vor: Alice und Bob stehen auf einem belebten Marktplatz und
rufen sich laut Zahlen zu. Tausende Menschen hören jedes Wort mit. Am
Ende teilen Alice und Bob ein gemeinsames Geheimnis, das niemand auf dem
Marktplatz kennt! #emph[Wie ist das möglich?] Diffie-Hellman überträgt
#strong[niemals den fertigen Schlüssel] über die Leitung! Stattdessen
tauschen beide Seiten Zwischenergebnisse einer mathematischen
#strong[Einwegfunktion] aus (leicht vorwärts zu berechnen, praktisch
unmöglich rückwärts). Beide kombinieren das fremde Zwischenergebnis mit
ihrem eigenen privaten Geheimnis -- und kommen auf dieselbe Endzahl!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären, was Diffie-Hellman tut
  (Schlüsselvereinbarung, KEIN Datentransport) und warum ein Lauscher
  das Geheimnis nicht berechnen kann.
- #strong[Typische Klausurfalle:] Glauben, mit Diffie-Hellman könne man
  Textnachrichten verschlüsseln. Falsch: Diffie-Hellman ist ein reines
  #strong[Schlüsselvereinbarungsverfahren]! Verschlüsselt wird danach
  symmetrisch mit AES.

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Wird beim Diffie-Hellman-Verfahren ein geheimer
Schlüssel über das Netzwerk übertragen? Erläutern Sie das Kernprinzip in
einem Satz." #strong[Antwort:]

- #strong[Nein.] Es wird zu keinem Zeitpunkt ein geheimer Schlüssel
  übertragen.
- #strong[Kernprinzip:] Beide Parteien tauschen lediglich öffentlich
  berechnete Zwischenwerte aus und berechnen daraus auf Basis ihrer
  jeweiligen privaten Geheimnisse unabhängig voneinander dasselbe
  gemeinsame Geheimnis (#strong[Schlüsselvereinbarung]).

]
#pagebreak(weak: true)
= Diffie-Hellman -- die Farb-Analogie
<diffie-hellman-die-farb-analogie>
#figure(image("img/diffie-hellman.svg", alt: "Diffie-Hellman – die Farb-Analogie"),
  caption: [
    Diffie-Hellman -- die Farb-Analogie
  ]
)

- Öffentliche Farbe + je eine #strong[geheime] Farbe → gemischt
  ausgetauscht
- Beide mischen ihre geheime Farbe dazu → #strong[identische]
  Endmischung
- Lauscher sieht nur die Mischungen -- #strong[Farben trennen ist
  unmöglich]

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Die Farbanalogie macht die mathematische Einwegfunktion (diskreter
Logarithmus) sofort begreifbar:

+ #strong[Öffentliche Ausgangsfarbe:] Alice und Bob einigen sich laut
  auf Gelb. Jeder Lauscher sieht Gelb.
+ #strong[Geheime Einzelfarbe:] Alice wählt geheim Rot, Bob wählt geheim
  Blau.
+ #strong[Mischung:] Alice mischt Gelb + Rot = Orange. Bob mischt Gelb +
  Blau = Hellblau.
+ #strong[Öffentlicher Tausch:] Alice sendet Orange an Bob, Bob sendet
  Hellblau an Alice. Der Lauscher sieht Orange und Hellblau -- aber er
  kann gemischte Farben nicht entmischen (Einwegfunktion!).
+ #strong[Gemeinsames Geheimnis:] Alice kippt ihr geheimes Rot in Bobs
  Hellblau $arrow.r$ Braun. Bob kippt sein geheimes Blau in Alices
  Orange $arrow.r$ dieselbe Endfarbe Braun!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Schritte der Farbanalogie auf die
  technischen Begriffe abbilden (öffentliche Parameter, private Werte,
  öffentliche Zwischenwerte, Sitzungsgeheimnis).
- #strong[Typische Klausurfalle:] Annehmen, dass DH gegen
  Man-in-the-Middle schützt. Ein Angreifer in der Leitung könnte mit
  Alice und Bob separate Farben mischen! DH schützt vor passivem
  Abhören, liefert aber #strong[keine Authentifizierung].

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Übertragen Sie die vier Elemente der
Diffie-Hellman-Farbanalogie (Ausgangsfarbe, geheime Farbe, Farbmischung,
Endfarbe) auf die technischen kryptographischen Begriffe."
#strong[Antwort:]

- #strong[Gemeinsame Ausgangsfarbe:] Öffentliche Grundparameter
  (Primzahl $p$ und Basis/Generator $g$).
- #strong[Geheime Einzelfarbe:] Privater geheimer Zufallswert der
  jeweiligen Partei ($a$ bzw. $b$).
- #strong[Übertragene Farbmischung:] Öffentlicher Zwischenwert
  ($A = g^a med mod med p$ bzw. $B = g^b med mod med p$).
- #strong[Identische Endfarbe:] Das gemeinsam berechnete symmetrische
  Sitzungsgeheimnis ($K = g^(a b) med mod med p$).

]
#pagebreak(weak: true)
= Asymmetrische Kryptographie -- das Prinzip
<asymmetrische-kryptographie-das-prinzip>
- #strong[Schlüsselpaar] pro Person: öffentlicher + privater Schlüssel

- Mathematisch verbunden, aber der private lässt sich #strong[nicht] aus
  dem öffentlichen berechnen

- #strong[Öffentlicher Schlüssel]: darf jeder kennen (verschlüsselt
  Nachrichten an mich)

- #strong[Privater Schlüssel]: bleibt geheim (nur ich kann
  entschlüsseln)

#quote-box[
#strong[Briefkasten-Analogie]: Einwurf kann jeder (öffentlich), leeren
nur der Besitzer (privat).

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Das asymmetrische Prinzip entkoppelt das Verschlüsseln vom
Entschlüsseln. #emph[Die Briefkasten-Analogie:] Der Einwurfschlitz
deines Hausbriefkastens ist der #strong[Public Key]. Jeder Nachbar,
Postbote oder Fremde darf Briefe einwerfen (verschlüsseln). Sobald der
Brief im Kasten liegt, kommt niemand mehr heran. Nur du besitzt den
Schlüssel zum Kasten (#strong[Private Key]) und kannst ihn leeren
(entschlüsseln). #emph[Der Durchbruch:] Du kannst deinen Public Key
weltweit verteilen -- auf Webseiten, Visitenkarten, Plakaten. Die
Vertraulichkeit ist niemals bedroht, solange dein Private Key geheim
bleibt!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Rollen von Public Key und Private
  Key beim Verschlüsseln fehlerfrei erklären: Wer verschlüsselt womit?
  Wer entschlüsselt womit?
- #strong[Typische Klausurfalle:] Public Key und Private Key
  vertauschen. Zum #emph[Verschlüsseln] nutzt der Sender immer den
  #emph[öffentlichen Schlüssel des Empfängers]. Zum #emph[Entschlüsseln]
  nutzt der Empfänger seinen #emph[privaten Schlüssel].

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum muss der öffentliche Schlüssel (Public Key) bei
asymmetrischer Verschlüsselung nicht geheim gehalten werden, und welches
Schutzziel wird dennoch gewährleistet?" #strong[Antwort:]

- Der öffentliche Schlüssel dient ausschließlich zum
  #strong[Verschlüsseln] von Nachrichten.
- Die mathematische Einwegfunktion stellt sicher, dass aus dem
  öffentlichen Schlüssel #strong[kein Rückschluss auf den privaten
  Schlüssel] gezogen werden kann.
- Das Schutzziel #strong[Vertraulichkeit] bleibt gewahrt, da
  ausschließlich der Inhaber des zugehörigen geheimen privaten
  Schlüssels die Nachricht entschlüsseln kann.

]
#pagebreak(weak: true)
= RSA -- die Grundidee
<rsa-die-grundidee>
- Benannt nach #strong[Rivest, Shamir, Adleman] (1977)

- Sicherheit beruht auf: #strong[Zwei große Primzahlen multiplizieren
  ist leicht -- das Produkt wieder zerlegen ist praktisch unmöglich]

- Vereinfacht:

  - Verschlüsseln mit öffentlichem Schlüssel: $c = m^e med mod med n$
  - Entschlüsseln mit privatem Schlüssel: $m = c^d med mod med n$

- Das große $n$ (Produkt zweier Primzahlen) ist öffentlich -- seine
  #strong[Faktoren] sind das Geheimnis

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
RSA (benannt nach Rivest, Shamir und Adleman, 1977) war das erste
vollwertige asymmetrische Verfahren. Seine Sicherheit beruht auf einem
einfachen mathematischen Ungleichgewicht:

- #strong[Multiplizieren ist kinderleicht:] Nimm zwei Primzahlen wie 17
  und 23 $arrow.r$ $17 times 23 = 391$. Das rechnet jeder Taschenrechner
  in Mikrosekunden.
- #strong[Primfaktorzerlegung ist bockschwer:] Wenn ich dir nur die Zahl
  391 gebe und sage: „Finde die beiden Primfaktoren!", musst du mühsam
  probieren. Nimmt man zwei Primzahlen mit jeweils hunderten von
  Dezimalstellen, dauert das Zerlegen auf normalen Computern Millionen
  Jahre! Das Produkt $n$ ist öffentlich, die Primfaktoren $p$ und $q$
  sind das Geheimnis.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Das mathematische Fundament von RSA
  benennen (#strong[Schwierigkeit der Primfaktorzerlegung /
  Faktorisierung großer Zahlen]) und die Parameter grob einordnen ($n$
  öffentlich, Faktoren geheim).
- #strong[Typische Klausurfalle:] Zu glauben, man müsse die RSA-Formel
  in der Klausur mit Zahlen herleiten. Nein: Nur das Prinzip (Produkt
  leicht, Faktoren schwer) und der Einsatzzweck zählen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Auf welchem mathematischen Problem beruht die
Sicherheit des RSA-Verfahrens? Erläutern Sie das Prinzip in zwei
Sätzen." #strong[Antwort:]

- Die Sicherheit von RSA beruht auf der #strong[Schwierigkeit der
  Faktorisierung (Primfaktorzerlegung)] sehr großer Zahlen.
- Während die Multiplikation zweier großer Primzahlen $p$ und $q$ zum
  Modul $n$ rechnerisch trivial ist, ist die Rekonstruktion von $p$ und
  $q$ aus $n$ ohne Zusatzwissen mit klassischen Rechnern in praktischer
  Zeit unlösbar.

]
#pagebreak(weak: true)
= RSA -- wofür man es nutzt
<rsa-wofür-man-es-nutzt>
- #strong[Verschlüsselung] kleiner Datenmengen (z. B. eines
  AES-Schlüssels)
- #strong[Digitale Signaturen] (dazu gleich mehr)
- #strong[Langsam] im Vergleich zu AES → nicht für große Datenmengen
  geeignet

#quote-box[
#strong[Konsequenz]: In der Praxis kombiniert man beide Welten →
#strong[hybride Verschlüsselung].

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Warum verschlüsseln wir nicht einfach das gesamte Internet mit RSA und
vergessen AES? Weil RSA eine Rechen-Schnecke ist! Das Rechnen mit
riesigen 2048- oder 4096-Bit-Zahlen verbraucht enorm viel
Prozessorleistung. Ein 100-MB-Video mit RSA zu verschlüsseln würde
Server überlasten und Akkus leersaugen. Deshalb nutzt man RSA in der
Praxis nur für zwei gezielte Aufgaben:

+ Um winzige Datenmengen zu verschlüsseln (konkret: einen zufälligen
  symmetrischen AES-Schlüssel!).
+ Um Dokumente digital zu unterschreiben (digitale Signaturen).

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Begründen können, warum RSA niemals für
  Massendaten eingesetzt wird, und die Brücke zur hybriden
  Verschlüsselung schlagen.
- #strong[Typische Klausurfalle:] Annehmen, dass Webseiten oder
  Datenbanken direkt mit RSA verschlüsselt werden. Nutzdaten werden fast
  ausnahmslos symmetrisch (AES) verschlüsselt!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum wird RSA in der Praxis nicht zur direkten
Verschlüsselung großer Nutzdaten (z. B. Backups oder Videostreams)
eingesetzt? Wie löst die Praxis dieses Problem?" #strong[Antwort:]

- #strong[Problem:] RSA erfordert extrem rechenaufwändige modulare
  Arithmetik mit riesigen Zahlen und ist um ein Vielfaches
  #strong[langsamer als symmetrische Chiffren] (hohe Latenz, hohe
  CPU-Last).
- #strong[Lösung:] Einsatz von #strong[hybrider Verschlüsselung]: Die
  großen Nutzdaten werden schnell und effizient symmetrisch (z. B. AES)
  verschlüsselt; RSA verschlüsselt lediglich diesen kleinen
  symmetrischen Sitzungsschlüssel.

]
#pagebreak(weak: true)
= Kryptographie in der Praxis
<kryptographie-in-der-praxis>
== So funktioniert es wirklich
<so-funktioniert-es-wirklich>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Das Zusammenspiel in der Praxis)])[
Jetzt fügen sich alle Puzzleteile zusammen! In der realen Welt existiert
kein isolierter Algorithmus. Sichere Protokolle wie HTTPS (TLS), Signal
oder Online-Banking kombinieren symmetrische Verschlüsselung,
asymmetrischen Schlüsselaustausch, Hashes, digitale Signaturen und
PKI-Zertifikate zu einem lückenlosen Schutzschild.

]
#exam-box(title: [Modul-Lernziel])[
Du beherrschst das Zusammenspiel der Bausteine: Wie hybride
Verschlüsselung Effizienz und Schlüsselaustausch vereint, wie
Hashfunktionen Manipulationen entlarven, wie digitale Signaturen
Echtheit garantieren und wie PKI das Vertrauen in öffentliche Schlüssel
sichert.

]
#quiz-box(title: [Typische Schwerpunkte])[
Ablauf hybrider Verschlüsselung (Schritt 1 bis 4), Eigenschaften von
Hashfunktionen (Einweg, Lawineneffekt, Kollision), Signatur-Prüfkette
und Funktion von Zertifizierungsstellen (CAs).

]
#pagebreak(weak: true)
= Hybride Verschlüsselung
<hybride-verschlüsselung>
#figure(image("img/hybrid.svg", alt: "Hybride Verschlüsselung"),
  caption: [
    Hybride Verschlüsselung
  ]
)

- #strong[Asymmetrisch] (RSA/DH) transportiert sicher einen zufälligen
  #strong[AES-Schlüssel]
- #strong[Symmetrisch] (AES) verschlüsselt dann die eigentlichen Daten
  -- schnell

#quote-box[
Das Beste aus beiden Welten: Sicherheit des Austauschs #strong[\+]
Geschwindigkeit von AES.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Hybride Verschlüsselung ist der absolute Königsweg moderner
IT-Sicherheit: Sie kombiniert die Geschwindigkeit von AES mit der
Eleganz von asymmetrischer Krypto. #emph[Der 4-Schritte-Ablauf:]

+ Alice erzeugt auf ihrem Rechner einen zufälligen, einmaligen
  AES-Schlüssel (#strong[Session Key]).
+ Alice verschlüsselt ihre eigentlichen Daten (z. B. ein 50 MB PDF) mit
  diesem AES-Schlüssel $arrow.r$ blitzschnell!
+ Alice nimmt Bobs öffentlichen RSA-Schlüssel und verschlüsselt damit
  #emph[nur den kleinen AES-Schlüssel].
+ Alice sendet beides an Bob. Bob entschlüsselt mit seinem privaten
  Schlüssel den AES-Schlüssel -- und öffnet damit die Daten!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die 4 Schritte der hybriden
  Verschlüsselung in der korrekten Reihenfolge aufschreiben und die
  Begründung liefern (Asymmetrie löst Verteilung, Symmetrie liefert
  Geschwindigkeit).
- #strong[Typische Klausurfalle:] Verwechseln, welcher Schlüssel womit
  verschlüsselt wird. Die Nutzdaten werden #strong[symmetrisch]
  verschlüsselt; der symmetrische Schlüssel wird #strong[asymmetrisch]
  verschlüsselt!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Skizzieren Sie die vier Schritte einer hybriden
Verschlüsselung beim Senden einer vertraulichen Datei von Alice an Bob
und begründen Sie den Vorteil." #strong[Antwort:]

- + Alice erzeugt einen zufälligen symmetrischen Sitzungsschlüssel
    (#strong[Session Key], z. B. AES).
- #block[
  #set enum(numbering: "1.", start: 2)
  + Die Nutzdaten werden mit dem Session Key #strong[symmetrisch
    verschlüsselt].
  ]
- #block[
  #set enum(numbering: "1.", start: 3)
  + Der Session Key wird mit Bobs #strong[öffentlichem Schlüssel
    asymmetrisch verschlüsselt].
  ]
- #block[
  #set enum(numbering: "1.", start: 4)
  + Alice sendet verschlüsselte Nutzdaten und verschlüsselten Session
    Key an Bob. Bob entschlüsselt mit seinem #strong[privaten Schlüssel]
    den Session Key und damit die Nutzdaten.
  ]
- #strong[Vorteil:] Löst das Schlüsselverteilungsproblem (dank
  Asymmetrie) und bewahrt maximale Verarbeitungsgeschwindigkeit bei
  Massendaten (dank Symmetrie).

]
#pagebreak(weak: true)
= Kryptographische Hashfunktionen
<kryptographische-hashfunktionen>
- Bilden beliebig lange Daten auf einen #strong[festen, kurzen] Wert ab
  (den „Fingerabdruck")

- #strong[Einwegfunktion]: aus dem Hash lässt sich das Original nicht
  rekonstruieren

- Kleinste Änderung am Input → #strong[völlig anderer] Hash
  (Lawineneffekt)

- #strong[Kollisionsresistent]: kaum zwei Eingaben mit gleichem Hash

- Standards: #strong[SHA-256, SHA-3] (nicht mehr: MD5, SHA-1 --
  gebrochen)

#quote-box[
Anwendung: Integritätsprüfung, Passwortspeicherung, Signaturen,
Blockchain.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Eine Hashfunktion ist wie ein digitaler Fleischwolf oder ein
unnachahmlicher Fingerabdruck. #emph[Alltagsvergleich Fleischwolf:] Man
kann aus einem Steak mühelos Hackfleisch machen (Einwegfunktion:
vorwärts leicht). Aber man kann aus Hackfleisch unmöglich wieder das
ursprüngliche Steak rekonstruieren (rückwärts unmöglich!). #emph[Der
Lawineneffekt:] Ändert man in einem riesigen Dokument auch nur ein
einziges Leerzeichen, verändert sich der Hashwert komplett!
#emph[Häufigster Denkfehler:] #strong[Hashing ist KEINE
Verschlüsselung!] Es gibt keinen Schlüssel und keine Entschlüsselung.
Ein Hash ist eine irreversible mathematische Prüfsumme.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die drei Haupteigenschaften nennen
  (feste Ausgabelänge, Einwegfunktion,
  Lawineneffekt/Kollisionsresistenz) und veraltete (MD5, SHA-1) von
  aktuellen Standards (SHA-256, SHA-3) unterscheiden.
- #strong[Typische Klausurfalle:] Hashen als „Einweg-Verschlüsselung"
  bezeichnen. Verschlüsselung ist per Definition umkehrbar; Hashing ist
  eine irreversible Einwegfunktion!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Nennen Sie die drei wesentlichen Eigenschaften einer
kryptographischen Hashfunktion und grenzen Sie Hashing klar von
Verschlüsselung ab." #strong[Antwort:]

- + #strong[Einwegfunktion (Urbildresistenz):] Aus dem Hashwert kann die
    ursprüngliche Eingabe praktisch nicht rekonstruiert werden.
- #block[
  #set enum(numbering: "1.", start: 2)
  + #strong[Feste Ausgabelänge:] Liefert unabhängig von der Eingabegröße
    stets einen Ausgabewert fester Bitlänge (z. B. 256 Bit bei SHA-256).
  ]
- #block[
  #set enum(numbering: "1.", start: 3)
  + #strong[Lawineneffekt & Kollisionsresistenz:] Minimale
    Eingabeänderungen erzeugen völlig andere Hashes; es ist praktisch
    unmöglich, zwei verschiedene Eingaben mit gleichem Hash zu finden.
  ]
- #strong[Abgrenzung:] Verschlüsselung ist ein #strong[umkehrbarer
  Vorgang mit Schlüssel] (Schutzziel Vertraulichkeit); Hashing ist eine
  #strong[schlüssellose, irreversible Einwegfunktion] (Schutzziel
  Integrität).

]
#pagebreak(weak: true)
= Digitale Signaturen
<digitale-signaturen>
#figure(image("img/signatur.svg", alt: "Digitale Signaturen"),
  caption: [
    Digitale Signaturen
  ]
)

- #strong[Signieren]: Hash der Nachricht mit dem #strong[privaten]
  Schlüssel verschlüsseln
- #strong[Prüfen]: Empfänger vergleicht mit dem #strong[öffentlichen]
  Schlüssel
- Umgekehrte Nutzung der Asymmetrie: privat signiert, öffentlich prüft

#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Eine digitale Signatur ist die fälschungssichere Unterschrift unter ein
Dokument. #emph[Die geniale Umkehrung der Asymmetrie:]

- Beim #emph[Verschlüsseln] nutzt man den #emph[Public Key des
  Empfängers], damit nur dieser lesen kann.
- Beim #emph[Signieren] nutzt Alice ihren #strong[eigenen Private Key]!
  Warum? Weil nur Alice ihren Private Key besitzt. Wenn die Welt mit
  Alices #strong[Public Key] prüfen kann, dass die Signatur passt, ist
  zweifelsfrei bewiesen: Diese Nachricht stammt garantiert von Alice!
  #emph[Ablauf:] Man signiert nicht die riesige Datei selbst, sondern
  berechnet ihren kleinen Hashwert und verschlüsselt diesen mit dem
  Private Key. Der Empfänger prüft die Signatur mit Alices Public Key.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Schlüsselrollen beim Signieren und
  Prüfen exakt benennen: #emph[Privater Schlüssel des Absenders
  signiert], #emph[öffentlicher Schlüssel des Absenders prüft]!
- #strong[Typische Klausurfalle:] Die Schlüssel des Empfängers für die
  Signatur heranziehen. Völlig falsch: Die Signatur beweist die
  Urheberschaft des #strong[Absenders], also werden ausschließlich die
  Schlüssel des #strong[Absenders] verwendet!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Alice möchte ein Dokument digital signieren und an Bob
senden. Welche Schlüssel von wem werden beim Erzeugen der Signatur und
beim späteren Prüfen durch Bob verwendet?" #strong[Antwort:]

- #strong[Erzeugen der Signatur (Alice):] Alice verwendet ihren
  #strong[eigenen privaten Schlüssel (Private Key Absender)], um den
  Hashwert des Dokuments zu signieren.
- #strong[Prüfen der Signatur (Bob):] Bob verwendet den
  #strong[öffentlichen Schlüssel von Alice (Public Key Absender)], um
  die Signatur zu verifizieren und mit dem neu berechneten Hashwert des
  Dokuments abzugleichen.
- #emph[\(Bobs Schlüssel kommen beim reinen Signieren überhaupt nicht
  zum Einsatz!)]

]
#pagebreak(weak: true)
= Signaturen -- welche Ziele werden erfüllt?
<signaturen-welche-ziele-werden-erfüllt>
- #strong[Integrität]: jede Änderung ändert den Hash → Signatur passt
  nicht mehr
- #strong[Authentizität]: nur der Inhaber des privaten Schlüssels konnte
  signieren
- #strong[Nicht-Abstreitbarkeit]: der Absender kann die Signatur nicht
  leugnen

#quote-box[
Verschlüsselung schützt Vertraulichkeit -- #strong[Signaturen] schützen
Integrität, Authentizität & Zurechenbarkeit.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Digitale Signaturen erfüllen drei fundamentale Schutzziele auf einen
Schlag:

+ #strong[Integrität (Unverändert):] Ändert jemand auch nur einen
  Cent-Betrag in einem Vertrag, passt der Hashwert nicht mehr zur
  Signatur $arrow.r$ Manipulation fliegt sofort auf!
+ #strong[Authentizität (Echtheit):] Nur wer den geheimen Private Key
  besitzt, konnte die Signatur erzeugen $arrow.r$ die Nachricht stammt
  garantiert vom Absender.
+ #strong[Nicht-Abstreitbarkeit (Verbindlichkeit):] Der Absender kann
  vor Gericht nicht behaupten: „Das war ich nicht!", denn niemand sonst
  hat Zugriff auf seinen Private Key. #emph[Zentraler Merksatz:] Eine
  Signatur macht ein Dokument #strong[nicht geheim]! Ein
  unterschriebener Vertrag ist für jeden lesbar, aber manipulations- und
  fälschungssicher.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die drei erfüllten Schutzziele benennen
  und begründen können, warum eine Signatur #strong[keine
  Vertraulichkeit] bietet.
- #strong[Typische Klausurfalle:] Annehmen, eine signierte E-Mail sei
  automatisch verschlüsselt. Nein: Jeder kann eine signierte Nachricht
  mitlesen, wenn sie nicht zusätzlich verschlüsselt wurde!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Welche drei Schutzziele werden durch eine digitale
Signatur erfüllt, und welches Schutzziel leistet sie explizit NICHT?"
#strong[Antwort:]

- #strong[Erfüllte Schutzziele:]
  + #strong[Integrität:] Nachweis, dass die Daten auf dem
    Übertragungsweg nicht manipuliert wurden.
  + #strong[Authentizität:] Nachweis der echten Identität des
    Absenders/Unterzeichners.
  + #strong[Nicht-Abstreitbarkeit (Verbindlichkeit):] Der Absender kann
    die Urheberschaft rechtlich nicht leugnen.
- #strong[Nicht erfüllt:] #strong[Vertraulichkeit] (der Inhalt bleibt
  für jeden lesbar, sofern er nicht separat verschlüsselt wird).

]
#pagebreak(weak: true)
= Das Vertrauensproblem: PKI
<das-vertrauensproblem-pki>
- Woher weiß ich, dass ein #strong[öffentlicher Schlüssel] wirklich der
  richtigen Person gehört?

- Gefahr: Ein Angreifer schiebt #strong[seinen] Schlüssel unter
  (Man-in-the-Middle)

- #strong[Public Key Infrastructure (PKI)]:

  - #strong[Zertifikate] binden einen Schlüssel an eine Identität
  - #strong[Certificate Authority (CA)]: vertrauenswürdige Stelle, die
    Zertifikate signiert
  - Browser vertrauen einer Liste bekannter CAs

#quote-box[
Das #strong[Schloss-Symbol] im Browser = ein gültiges, von einer CA
signiertes Zertifikat.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Hier schließt sich die letzte Sicherheitslücke der Asymmetrie: Woher
weiß Alice, dass ein Public Key wirklich zu ihrer Bank gehört? #emph[Die
Man-in-the-Middle-Gefahr:] Ein Angreifer in der Leitung fängt Alices
Anfrage ab und schickt ihr #emph[seinen] Public Key. Alice verschlüsselt
ihr Passwort mit dem Hackerschlüssel -- und der Angreifer liest alles
mit! #emph[Die Lösung (PKI & Zertifikate):] Ein digitales Zertifikat ist
ein digitaler Personalausweis. Eine vertrauenswürdige
Zertifizierungsstelle (#strong[Certificate Authority / CA], z. B. Let's
Encrypt, DigiCert) prüft die Identität der Bank und signiert deren
Public Key digital. Dein Browser bringt eine Liste vertrauenswürdiger
Root-CAs mit und prüft die Signaturkette. Ist alles gültig, erscheint
das Schloss-Symbol!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Die Aufgabe einer PKI und der CA
  erklären und begründen können, warum das Browser-Schloss nur die
  verschlüsselte Verbindung zur verifizierten Domain bestätigt, nicht
  aber die kriminelle Absicht des Betreibers!
- #strong[Typische Klausurfalle:] Glauben, eine Website mit
  Schloss-Symbol sei garantiert seriös. Auch Phishing-Seiten können sich
  kostenlose TLS-Zertifikate für gefälschte Domains holen!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Welches Problem löst eine Public Key Infrastructure
(PKI) und vor welcher konkreten Angriffsart schützt sie bei
HTTPS-Verbindungen?" #strong[Antwort:]

- #strong[Problem:] Das Authentizitätsproblem öffentlicher Schlüssel:
  Man kann ohne Überprüfung nicht wissen, ob ein Public Key tatsächlich
  der angegebenen Person/Domain gehört.
- #strong[Schutzwirkung:] Ein digitales Zertifikat bindet einen Public
  Key durch die digitale Signatur einer vertrauenswürdigen
  Zertifizierungsstelle (#strong[CA]) verbindlich an eine
  Identität/Domain.
- Dies schützt vor #strong[Man-in-the-Middle-Angriffen], bei denen ein
  Angreifer einen gefälschten öffentlichen Schlüssel unterschiebt.

]
#pagebreak(weak: true)
= Ausblick
<ausblick>
== Post-Quantum-Kryptographie
<post-quantum-kryptographie>
#didaktik-box(title: [Worum geht es in diesem Kapitel? (Das Quantenzeitalter)])[
Kryptographie ist niemals abgeschlossen. Die nächste technologische
Zäsur -- funktionierende Quantencomputer -- bedroht die mathematischen
Grundfesten, auf denen das heutige Internet ruht. Wir beleuchten, warum
RSA und ECC wackeln, warum AES standhält und welche neuen mathematischen
Verfahren uns künftig schützen werden.

]
#exam-box(title: [Modul-Lernziel])[
Du verstehst die unterschiedlichen Auswirkungen von Quantencomputern auf
asymmetrische Verfahren (Shor bricht RSA/DH komplett) vs.~symmetrische
Verfahren (Grover schwächt AES nur ab) und begreifst das
Bedrohungsszenario #emph[Harvest now, decrypt later].

]
#quiz-box(title: [Typische Schwerpunkte])[
Unterschied zwischen den Auswirkungen auf asymmetrische vs.~symmetrische
Krypto, Definition des Angriffsmodells „Harvest now, decrypt later" und
Einordnung von PQC (Algorithmen laufen auf normalen PCs!).

]
#pagebreak(weak: true)
= Die Quanten-Bedrohung
<die-quanten-bedrohung>
- #strong[Quantencomputer] nutzen andere Rechenprinzipien als klassische
  Rechner
- Der #strong[Shor-Algorithmus] könnte Faktorisierung & diskreten
  Logarithmus effizient lösen
- #strong[Betroffen]: RSA und Diffie-Hellman wären damit gebrochen
- #strong[Weniger betroffen]: AES (längere Schlüssel genügen) und
  Hashfunktionen

#quote-box[
#strong[„Harvest now, decrypt later"]: Verschlüsselte Daten werden heute
schon gesammelt, um sie später zu entschlüsseln.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Warum versetzen Quantencomputer Kryptographen in Alarmbereitschaft? Ein
Quantencomputer rechnet mit Qubits und kann bestimmte Rechenprobleme
lösen, an denen klassische Supercomputer scheitern:

- #strong[Shor-Algorithmus:] Löst Primfaktorzerlegung und diskrete
  Logarithmen in Sekundenschnelle. Das bedeutet das #strong[sofortige
  Aus für RSA, Diffie-Hellman und ECC]!
- #strong[AES & Hashes:] Werden durch den Grover-Algorithmus nur
  quadratisch beschleunigt. Bei AES-256 halbiert sich die effektive
  Sicherheit auf 128 Bit -- das ist immer noch astronomisch sicher!
  #emph[Warum handeln wir heute schon?] Wegen #strong[„Harvest now,
  decrypt later"]: Angreifer schneiden heute weltweit verschlüsselte
  Datenströme mit und speichern sie. Sobald in 10 Jahren ein
  Quantencomputer existiert, entschlüsseln sie alle heutigen Betriebs-
  und Staatsgeheimnisse rückwirkend!

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] Erklären, warum asymmetrische Krypto
  existentiell bedroht ist, symmetrische Krypto (AES-256) standhält und
  was #emph[Harvest now, decrypt later] bedeutet.
- #strong[Typische Klausurfalle:] Shor-Algorithmus (bricht asymmetrische
  Verfahren komplett) mit Grover-Algorithmus (schwächt symmetrische
  Verfahren nur ab) verwechseln!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Warum müssen Unternehmen ihre Verschlüsselung bereits
heute auf Post-Quantum-Verfahren umstellen, obwohl es noch gar keine
praxistauglichen krypto-relevanten Quantencomputer gibt?"
#strong[Antwort:]

- Grund ist das Angriffsmodell #strong[„Harvest now, decrypt later"]:
  Angreifer fangen heute verschlüsselten Datenverkehr ab und speichern
  ihn auf Vorrat.
- Sobald ein krypto-relevanter Quantencomputer existiert, können diese
  gespeicherten Daten nachträglich mit dem #strong[Shor-Algorithmus]
  gebrochen werden.
- Bei Daten mit langer Vertraulichkeitsdauer (z. B. 10--30 Jahre für
  Patientendaten, Patente) muss die Verschlüsselung #strong[bereits
  heute präventiv geschützt] werden.

]
#pagebreak(weak: true)
= Post-Quantum-Kryptographie (PQC)
<post-quantum-kryptographie-pqc>
- Neue Verfahren, die auch #strong[Quantencomputern] standhalten
- Basieren auf anderen mathematischen Problemen (z. B. #strong[Gitter /
  Lattices])
- #strong[NIST] hat 2024 erste Standards veröffentlicht (u. a.
  #strong[ML-KEM / Kyber])
- Laufen auf #strong[klassischen] Computern -- kein Quantencomputer
  nötig
- Migration hat begonnen (Browser, Messenger, VPNs)

#quote-box[
Kryptographie ist nie „fertig" -- sie entwickelt sich mit den Angriffen
weiter.

]
#quote-box[
#strong[Einordnung:] ML-KEM ist ein standardisiertes Verfahren zum
Vereinbaren eines gemeinsamen Geheimnisses; „Kyber" bezeichnet die
zugrunde liegende Verfahrensfamilie.

]
#didaktik-box(title: [Auf den Punkt gebracht (Einfach erklärt)])[
Was genau ist Post-Quantum-Kryptographie (PQC)? #emph[Häufigster
Denkfehler aufgeklärt:] PQC bedeutet #strong[nicht], dass man einen
Quantencomputer braucht, um damit zu arbeiten! PQC sind mathematische
Algorithmen, die auf ganz normalen Laptops, Smartphones und Servern
laufen. Der Trick: Statt auf Primzahlen basieren sie auf
mehrdimensionalen geometrischen Gittern (#strong[Lattices]). An diesen
Gitterproblemen scheitern Quantencomputer genauso wie klassische
Rechner! Das US-NIST hat 2024 die ersten weltweiten Standards festgelegt
(u. a. #strong[ML-KEM / Kyber] für Schlüsselaustausch). Moderne Browser
und Messenger rollen PQC bereits im hybriden Doppelpack (klassisches
Verfahren + PQC) aus.

]
#exam-box(title: [Klausurrelevanz & Lernziel])[
- #strong[Was du können musst:] PQC von Quantenkryptographie abgrenzen
  und erklären, dass PQC auf klassischer Hardware ausgeführt wird und
  auf gitterbasierten Problemen basiert.
- #strong[Typische Klausurfalle:] PQC mit Quantencomputern verwechseln
  (glauben, PQC brauche Quanten-Hardware). PQC läuft auf normaler
  Hardware!

]
#quiz-box(title: [Mögliche Klausurfrage & Antwortskizze])[
#strong[Frage:] „Was versteht man unter Post-Quantum-Kryptographie (PQC)
und auf welcher Hardware wird sie ausgeführt? Grenzen Sie den Begriff
kurz ab." #strong[Antwort:]

- #strong[Definition:] Kryptographische Algorithmen (z. B.
  gitterbasierte Verfahren wie ML-KEM), die gegen Angriffe durch
  Quantencomputer (insb. Shor-Algorithmus) mathematisch resistent sind.
- #strong[Hardware:] PQC läuft auf #strong[ganz herkömmlichen,
  klassischen Rechnern] (PCs, Servern, Smartphones).
- #strong[Abgrenzung:] Nicht zu verwechseln mit
  #emph[Quantenkryptographie (wie QKD)], die spezielle physikalische
  Quantengeräte und Glasfaser-Hardware erfordert.

]
#pagebreak(weak: true)
= Zusammenfassung
<zusammenfassung>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Baustein], [Typ], [Schützt vor allem],),
    table.hline(),
    [#strong[AES]], [Symmetrisch], [Vertraulichkeit (schnell,
    Massendaten)],
    [#strong[Diffie-Hellman]], [Asymmetrisch], [Sicherer
    Schlüsselaustausch],
    [#strong[RSA]], [Asymmetrisch], [Schlüsseltransport & Signaturen],
    [#strong[Hashfunktion]], [Einweg], [Integrität (Fingerabdruck)],
    [#strong[Digitale Signatur]], [Asymmetrisch], [Authentizität,
    Integrität, Zurechenbarkeit],
    [#strong[PKI / Zertifikate]], [Infrastruktur], [Vertrauen in
    öffentliche Schlüssel],
  )]
  , kind: table
  )

#didaktik-box(title: [Schnell-Check (Die 6 Krypto-Werkzeuge im Werkzeugkasten)])[
Jeder kryptographische Baustein hat genau eine Kernaufgabe -- kein
Baustein kann alles allein:

+ #strong[AES:] Der Hochgeschwindigkeitszug für große Datenmengen
  (schützt #emph[Vertraulichkeit]).
+ #strong[Diffie-Hellman:] Der gemeinsame Nenner über offene Leitungen
  (#emph[Schlüsselvereinbarung]).
+ #strong[RSA:] Der Allrounder der Asymmetrie (#emph[Schlüsseltransport
  & Signatur]).
+ #strong[Hashfunktion:] Das unbestechliche Siegel (#emph[Integrität]).
+ #strong[Digitale Signatur:] Die rechtssichere digitale Unterschrift
  (#emph[Authentizität, Integrität, Zurechenbarkeit]).
+ #strong[PKI:] Das Einwohnermeldeamt des Internets (#emph[Vertrauen in
  öffentliche Schlüssel]).

]
#exam-box(title: [Prüfungs-Checkliste (Was du parat haben musst)])[
- Zu jedem der 6 Bausteine: Typ (symmetrisch / asymmetrisch / Einweg /
  Infrastruktur) und Haupt-Schutzziel fehlerfrei benennen können.
- Erklären können, warum ein sicheres Protokoll (wie HTTPS/TLS)
  mindestens 4 dieser Bausteine gleichzeitig kombinieren muss.

]
#quiz-box(title: [Blitzfragen zur Selbstkontrolle])[
+ #emph[Frage:] Schützt eine Hashfunktion vor unbefugtem Mitlesen?
  $arrow.r$ #emph[Antwort:] Nein! Hashes schützen ausschließlich
  Integrität, niemals Vertraulichkeit.
+ #emph[Frage:] Warum reicht Diffie-Hellman allein nicht gegen
  Man-in-the-Middle? $arrow.r$ #emph[Antwort:] Weil DH keine
  Authentifizierung liefert -- dazu braucht man Signaturen und
  Zertifikate (PKI)!

]
#pagebreak(weak: true)
= Die zeitlosen Lehren
<die-zeitlosen-lehren>
- #strong[Kerckhoffs' Prinzip]: Sicherheit steckt im Schlüssel, nicht im
  Geheimnis des Verfahrens
- #strong[Offenheit schafft Vertrauen]: Nur öffentlich geprüfte
  Verfahren sind vertrauenswürdig
- #strong[Der Mensch ist oft die Schwachstelle] -- nicht die Mathematik
- #strong[Richtige Anwendung zählt]: Der beste Algorithmus versagt im
  falschen Modus
- #strong[Kryptographie ist ein Wettlauf] -- sie entwickelt sich immer
  weiter

#didaktik-box(title: [Didaktischer Kern (Die 5 goldenen Regeln)])[
Diese Folie fasst die Kernbotschaften der gesamten Vorlesung zusammen.
Algorithmen ändern sich im Laufe der Jahrzehnte -- von Caesar über
Enigma zu PQC --, aber diese fünf Prinzipien bleiben unveränderlich
wahr:

- Vertraue niemals geheimen Firmen-Algorithmen (Kerckhoffs).
- Offenheit und weltweite Prüfung schaffen Sicherheit.
- Der Mensch ist und bleibt die größte Schwachstelle (Passwörter,
  Routinen, Phishing).
- Ein starker Algorithmus ist im falschen Betriebsmodus wirkungslos (z.
  B. AES im ECB-Modus).
- Kryptographie ist ein ewiger Wettlauf zwischen Konstrukteuren und
  Analytikern.

]
#exam-box(title: [Klausurrelevanz & Transferkompetenz])[
- #strong[Was du können musst:] Die fünf Lehren anhand von konkreten
  Beispielen aus der Vorlesung belegen können (z. B. Enigma $arrow.r$
  Mensch als Schwachstelle & Kerckhoffs; PQC $arrow.r$ ewiger Wettlauf).
- #strong[Typische Klausurfalle:] Abstrakte Lehren ohne greifbaren
  Praxisbezug aufzuzählen. Immer ein konkretes Vorlesungsbeispiel parat
  haben!

]
#quiz-box(title: [Mögliche Transferaufgabe & Antwortskizze])[
#strong[Frage:] „Erläutern Sie die Lehre 'Der beste Algorithmus versagt
bei falscher Anwendung' anhand eines konkreten Beispiels aus der
Vorlesung." #strong[Antwort:]

- #strong[Beispiel AES im ECB-Modus:] AES selbst ist mathematisch
  unknackbar. Wird jedoch der unsichere ECB-Modus verwendet, wird jeder
  identische 128-Bit-Klartextblock zum exakt selben Geheimtextblock
  verschlüsselt. Bei Grafiken (z. B. dem Tux-Pinguin) bleiben Konturen
  im Chiffretext vollständig sichtbar.
- #strong[Erkenntnis:] Ein mathematisch perfekter Algorithmus bietet bei
  fehlerhaftem Betriebsmodus keinen Schutz der Vertraulichkeit.

]
#pagebreak(weak: true)
= Diskussion
<diskussion>
- Sollten Behörden #strong[Hintertüren] in Verschlüsselung fordern
  dürfen?
- Wie geht ihr im Alltag mit #strong[Ende-zu-Ende-Verschlüsselung] um?
- Wo begegnet euch Kryptographie in eurem #strong[Unternehmen]?

#didaktik-box(title: [Didaktischer Kern & Diskussionsimpulse])[
Hier schlagen wir die Brücke zur gesellschaftlichen, unternehmerischen
und ethischen Realität:

- #strong[Staatliche Hintertüren (Crypto Wars):] Politiker fordern oft
  „Generalschlüssel für die Polizei". Mathematisch gilt: Es gibt keine
  Hintertür, die nur von den „Guten" genutzt werden kann. Jede
  Schwachstelle wird unweigerlich auch von Kriminellen und feindlichen
  Staaten entdeckt und missbraucht.
- #strong[Ende-zu-Ende-Verschlüsselung (E2EE):] Bei WhatsApp oder Signal
  können selbst die Serverbetreiber nicht mitlesen -- ein
  unverzichtbarer Schutz für Journalisten, Firmen und Bürger.
- #strong[Unternehmensalltag:] Festplattenverschlüsselung (BitLocker),
  VPN-Tunnel, TLS 1.3, Code-Signing, Smartcards / FIDO2-Sticks.

]
#exam-box(title: [Klausurrelevanz (Transfer- & Urteilskompetenz)])[
- #strong[Was du können musst:] In Diskussions- und Essayaufgaben
  fundiert mit Schutzielen argumentieren können (z. B.
  Spannungsverhältnis zwischen Strafverfolgung und informationeller
  Selbstbestimmung).
- #strong[Typische Klausurfalle:] Einseitig emotional argumentieren.
  Gute Antworten beleuchten beide Seiten sachlich mit
  IT-Sicherheitsbegriffen.

]
#quiz-box(title: [Mögliche Klausuraufgabe & Diskussionsleitfaden])[
#strong[Frage:] „Nehmen Sie aus IT-sicherheitstechnischer Sicht Stellung
zur politischen Forderung nach behördlichen Hintertüren in
Ende-zu-Ende-verschlüsselten Messenger-Diensten." #strong[Antwort:]

- #strong[Argumentation der Befürworter:] Notwendigkeit effektiver
  Strafverfolgung und Terrorismusabwehr.
- #strong[Sicherheitstechnische Gegenargumente:]
  + Eine Hintertür schwächt die mathematische Architektur grundsätzlich;
    es gibt #strong[keine selektive Hintertür nur für Befugte].
  + Der Generalschlüssel / die Hintertür wird zum lukrativsten Ziel für
    Cyberkriminelle und Spionage (#strong[Single Point of Complete
    Failure]).
  + Kriminelle weichen sofort auf eigene, unregulierte
    Open-Source-Krypto-Tools aus, während die breite Wirtschaft und
    Bürger schutzlos gegenüber Abhören werden.

]
