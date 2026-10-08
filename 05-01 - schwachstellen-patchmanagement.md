---
marp: true
html: true
theme: custom
paginate: false
footer: ![w:280](img/dhbw-ka.svg)
title: Schwachstellen- und Patchmanagement
---

<!-- _class: title -->
# Schwachstellen- und Patchmanagement

<br><br><br><br><br><br>

## IT-Sicherheit – von der Entdeckung bis zum Rollout

<!-- _notes:
Willkommen zum Thema Schwachstellen- und Patchmanagement. Die Leitfrage der gesamten Vorlesung ist: Eine Sicherheitslücke wird irgendwo entdeckt – wie kommt man von dort bis zu dem Punkt, an dem der Fehler auf allen betroffenen Systemen wirklich behoben ist? Ihr braucht kein Vorwissen zum Thema – alle Fachbegriffe führen wir unterwegs ein.

Diese Kette hat drei sehr unterschiedliche Abschnitte: einen technischen (wie findet und bewertet man eine Lücke?), einen rechtlich-organisatorischen (wie und wann meldet und veröffentlicht man sie?) und einen betrieblichen (wie bringt man die Korrektur auf tausende Systeme?). In der Praxis reißt die Kette fast immer am letzten Glied – deshalb der zentrale Satz dieser Vorlesung: Ein verfügbarer Patch schützt erst nach erfolgreichem Rollout und anschließender Verifikation. Ein Patch, der im Downloadverzeichnis liegt, hat noch niemanden geschützt.

**Klausurvorbereitung:** Den Weg einer Schwachstelle von der Entdeckung bis zur verifizierten Behebung durchgängig in eigenen Worten beschreiben und begründen können, warum die bloße Verfügbarkeit eines Patches noch keinen Schutz bedeutet.
-->

---

<!-- _class: biglist -->
# Agenda

- **Grundlagen** – Begriffe, Lebenszyklus einer Schwachstelle
- **Finden von Schwachstellen** – wer, warum, wie
- **Bug-Bounty-Programme** – Schwachstellen als Markt
- **Responsible Disclosure** – Meldung und Veröffentlichung
- **CVSS** – Schwachstellen bewerten
- **Patchmanagement** – Organisation im Unternehmen

<!-- _notes:
Die Agenda folgt bewusst dem Lebensweg einer Schwachstelle und nicht einer thematischen Sortierung – jedes Kapitel knüpft am vorherigen an. Zuerst klären wir Begriffe und den Lebenszyklus, also das Vokabular. Dann sehen wir, wer Schwachstellen überhaupt findet und mit welchen Methoden. Danach betrachten wir zwei Wege, auf denen ein Fund beim Hersteller landet: legale Bug-Bounty-Programme als bezahlter Kanal und die geordnete Offenlegung (Responsible Disclosure) als Meldeweg mit Frist. Anschließend lernen wir mit CVSS ein Bewertungssystem kennen, das die Frage "wie schlimm ist das?" beantwortbar macht, und schließen mit dem Patchmanagement – also der Frage, wie ein Unternehmen aus einer bekannten Lücke einen ausgerollten und verifizierten Patch macht.

Für die Klausur lohnt es sich, diese Gliederung als Merkkette zu lernen: Begriffe – Finden – Melden – Bewerten – Beheben. Nahezu jede Prüfungsfrage lässt sich einer dieser fünf Stationen zuordnen, und wer die Station erkennt, weiß sofort, welche Fachbegriffe gefragt sind.

**Klausurvorbereitung:** Die fünf Stationen in der richtigen Reihenfolge nennen und jeder Station mindestens ein zentrales Konzept zuordnen können (z. B. Zero-Day, Fuzzing, Responsible Disclosure, CVSS, SLA).
-->

---

<!-- _class: chapter -->

# Grundlagen

## Begriffe und Lebenszyklus

<!-- _notes:
Ziel dieses Blocks: Ihr könnt Schwachstelle, Exploit, Zero-Day, N-Day und Patch klar auseinanderhalten, kennt die Kennungssysteme CVE und CWE und versteht, warum zwischen "Patch existiert" und "Patch ist eingespielt" oft ein gefährliches Zeitfenster liegt.

Dieses Kapitel ist das Fundament für alles Weitere: Die Bewertung mit CVSS setzt voraus, dass ihr wisst, was eine Schwachstelle von einem Exploit unterscheidet; das Patchmanagement setzt voraus, dass ihr das Angriffsfenster verstanden habt. Begriffsfragen sind in Klausuren außerdem die am leichtesten zu punktende Kategorie – vorausgesetzt, die Definitionen sitzen wirklich trennscharf.

**Klausurvorbereitung:** Nach diesem Kapitel die fünf Grundbegriffe definieren, CVE von CWE abgrenzen und das Angriffsfenster im Lebenszyklus verorten können.
-->

---

# Begriffe

- **Schwachstelle (Vulnerability)**: Fehler in Software, Hardware oder Konfiguration, der Sicherheitsziele gefährdet
- **Exploit**: Code oder Technik, die eine Schwachstelle ausnutzt
- **Zero-Day**: Schwachstelle, für die noch **kein Patch** verfügbar ist – unabhängig davon, ob sie schon ausgenutzt wird
- **N-Day**: öffentlich bekannte Schwachstelle, für die bereits ein **Patch existiert**
- **Patch**: Korrektur des Herstellers

<!-- _notes:
Diese fünf Begriffe werden in Prüfungen regelmäßig verwechselt – deshalb sauber trennen. Eine Schwachstelle ist eine Eigenschaft eines Systems: ein Programmierfehler, ein Designfehler oder eine unsichere Konfiguration, die Sicherheitsziele gefährden kann. Sie ist zunächst nur eine Möglichkeit und tut von allein nichts. Ein Exploit ist der konkrete Code oder die konkrete Technik, die diese Möglichkeit in einen funktionierenden Angriff übersetzt. Für viele Schwachstellen existiert nie ein Exploit, weil die Ausnutzung praktisch zu aufwendig oder zu unzuverlässig wäre – "Schwachstelle vorhanden" ist also nicht gleichbedeutend mit "angreifbar".

Beim Zero-Day ist das entscheidende Merkmal: Der Hersteller hat noch keine Abhilfe bereitgestellt. Ob die Lücke schon aktiv ausgenutzt wird, ist eine zweite, davon unabhängige Frage – ein Zero-Day ist also nicht automatisch ein laufender Angriff. Der Name kommt daher, dass der Verteidiger "null Tage" Zeit zur Vorbereitung hatte. Wird ein Zero-Day tatsächlich genutzt, spricht man präzisierend von einem Zero-Day-Exploit oder Zero-Day-Angriff.

N-Day ist das Gegenstück: Die Lücke ist öffentlich bekannt und ein Patch ist verfügbar – das "N" steht für die Zahl der Tage, die seit der Veröffentlichung vergangen sind. Ein auf den ersten Blick überraschender Punkt, der sich gut als Prüfungsfrage eignet: Für die meisten Organisationen sind N-Days gefährlicher als Zero-Days. Denn mit der Veröffentlichung werden Details und oft fertiger Angriffscode für jeden verfügbar, während das Einspielen des Patches Tage bis Monate dauert. Zero-Days sind teuer und werden gezielt gegen wenige Ziele eingesetzt; N-Days werden massenhaft und automatisiert ausgenutzt. Der Patch schließlich ist die Korrektur des Herstellers – und damit das Ende der Zero-Day-Phase, aber noch lange nicht das Ende des Risikos.

**Klausurvorbereitung:** Schwachstelle, Exploit, Zero-Day, N-Day und Patch je in einem Satz definieren und gegeneinander abgrenzen können; erklären können, warum ein Zero-Day nicht gleichbedeutend mit einem laufenden Angriff ist und warum N-Days in der Breite häufiger ausgenutzt werden.
-->

---

# Kennungen und Datenbanken

- **Common Vulnerabilities and Exposures (CVE)**: eindeutige ID, z. B. CVE-2017-0144
- **Common Weakness Enumeration (CWE)**: Katalog von Schwachstellenklassen
- **National Vulnerability Database (NVD)**: Datenbank mit Beschreibung und Bewertung

> **Merksatz:** CVE benennt den Einzelfall – CWE beschreibt die Fehlerklasse.

> **Konkretes Beispiel:** CVE-2017-0144 (EternalBlue) ist ein Einzelfall der Fehlerklasse CWE-119 (Buffer Overflow); in der NVD ist beides verknüpft und mit CVSS bewertet.

<!-- _notes:
Damit weltweit alle über dieselbe Lücke reden, gibt es eindeutige Kennungen. Eine CVE-Nummer ist wie eine Aktenzeichen-ID für genau eine konkrete Schwachstelle in einem bestimmten Produkt. Der Aufbau ist immer gleich: CVE, Jahr der Vergabe, laufende Nummer – im Beispiel CVE-2017-0144, die später bei WannaCry eine Rolle spielt. Vergeben werden CVE-IDs nicht von einer einzigen Stelle, sondern von autorisierten Organisationen, den CVE Numbering Authorities (CNAs); dazu gehören auch große Hersteller, die IDs für ihre eigenen Produkte ausgeben.

Eine CWE dagegen benennt nicht den Einzelfall, sondern die Fehler-Kategorie dahinter, etwa SQL-Injection oder Pufferüberlauf; viele hundert verschiedene CVEs gehören zur selben CWE. Der praktische Nutzen von CWE liegt im Erkennen von Mustern: Häufen sich bei einem Hersteller CVEs derselben CWE, ist das kein Einzelfallproblem mehr, sondern ein systematisches Problem in Ausbildung, Werkzeugen oder Entwicklungsprozess – genau dort setzt man dann an, statt immer nur den nächsten Einzelfehler zu korrigieren.

Die NVD ist die große US-Datenbank, betrieben vom NIST, die CVEs anreichert – mit Beschreibung, betroffenen Produktversionen, Links auf Herstellerhinweise und einer CVSS-Bewertung, die wir im vierten Kapitel noch genauer ansehen. Wichtig zur Einordnung: Der reine CVE-Eintrag enthält nur Kennung und Kurzbeschreibung; die Bewertung und die strukturierten Zusatzinformationen entstehen erst durch die NVD oder den Hersteller. Der Merksatz fasst die prüfungsrelevante Unterscheidung zusammen: Einzelfall versus Fehlerklasse.

**Klausurvorbereitung:** CVE, CWE und NVD jeweils definieren, am Beispiel zuordnen können, welche Information in welcher Quelle steht, und den Aufbau einer CVE-ID erklären können.
-->

---

# Lebenszyklus einer Schwachstelle

![w:1200 center](img/schwachstellen-lebenszyklus.svg)

> **Kernproblem:** Zwischen Patch-Release und Rollout liegt das Angriffsfenster.

> **Vereinfachter Ablauf:** Ein Exploit kann schon vor der Meldung oder vor einem Patch existieren. Das gezeigte Angriffsfenster ist nicht die einzige gefährliche Phase.

<!-- _notes:
Die dargestellte Abfolge zeigt den idealtypischen Ablauf: Entdeckung, Meldung, Patch-Release, Exploit und schließlich Rollout beim Anwender. In der Realität ist diese Reihenfolge nicht garantiert. Ein Exploit kann auch schon vor der Meldung oder vor dem Patch existieren – dann sprechen wir vom Zero-Day-Fall, und das Angriffsfenster beginnt entsprechend früher. Die Darstellung ist also eine Vereinfachung, um das Kernproblem sichtbar zu machen.

Das Kernproblem lautet: Mit der Veröffentlichung eines Patches wird die Lücke zwangsläufig öffentlich. Angreifer analysieren den Patch, vergleichen ihn mit der Vorgängerversion und rekonstruieren daraus die Schwachstelle – dieses Vorgehen heißt Patch Diffing und funktioniert oft innerhalb weniger Stunden bis Tage. Der Patch ist für Angreifer also gleichzeitig eine Bauanleitung. Deshalb steigt das Risiko unmittelbar nach dem Patch-Release zunächst an, obwohl die Lösung bereits existiert.

Genau diese Spanne zwischen "Patch verfügbar" und "Patch eingespielt" ist das Angriffsfenster. Es ist der Abschnitt, den die Verteidigung tatsächlich selbst beeinflussen kann: Entdeckung und Patch-Entwicklung liegen beim Hersteller, der Rollout aber liegt beim Anwenderunternehmen. Das gesamte Kapitel Patchmanagement am Ende der Vorlesung beschäftigt sich ausschließlich damit, dieses Fenster so klein wie möglich zu halten.

**Bildbeschreibung:** Die Grafik zeigt einen waagerechten Zeitstrahl mit Pfeilspitze nach rechts. Auf ihm liegen fünf Punkte in zeitlicher Reihenfolge: Entdeckung, Meldung, Patch-Release, Exploit und Rollout. Die Punkte sind farblich unterschieden – Entdeckung und Meldung blau (neutrale Ereignisse), Patch-Release und Rollout grün (Schutzmaßnahmen), Exploit rot (Bedrohung). Unterhalb des Zeitstrahls verbindet eine rote Klammer den Punkt "Patch-Release" mit dem Punkt "Rollout"; darunter steht in einem rot umrandeten Kasten die Beschriftung "Angriffsfenster". Die Klammer macht sichtbar, dass dieses Fenster erst mit der Veröffentlichung des Patches beginnt und erst mit dem tatsächlichen Rollout endet – und dass der Exploit genau in diese Phase fällt.

**Klausurvorbereitung:** Die fünf Stationen des Lebenszyklus in der richtigen Reihenfolge skizzieren, das Angriffsfenster korrekt eingrenzen und erklären können, warum ein veröffentlichter Patch das Risiko kurzfristig sogar erhöhen kann.
-->

---

# Fallstudie: WannaCry (2017)

- **Was geschah?**
  - Ransomware nutzte EternalBlue (SMBv1), weltweit über 200.000 Systeme in ca. 150 Ländern, u. a. Krankenhäuser (NHS)

- **Warum Versagen der Verfügbarkeit?**
  - Patch (MS17-010) lag zwei Monate vor dem Angriff vor – wurde jedoch nicht eingespielt

- **Konsequenzen:**
  - Betriebsausfälle, Milliardenschäden, Debatte über Patch-Disziplin


<!-- _notes:
WannaCry aus dem Jahr 2017 ist das Lehrbuchbeispiel für ein zu großes Angriffsfenster. Die Ransomware nutzte die Schwachstelle EternalBlue (CVE-2017-0144) im veralteten Netzwerkprotokoll SMBv1 – einem Dateifreigabe-Protokoll, das in vielen Unternehmensnetzen aus Kompatibilitätsgründen aktiviert blieb. Entscheidend für die Wucht des Angriffs: WannaCry war nicht nur Ransomware, sondern verhielt sich wie ein Wurm. Nach der Infektion eines Rechners suchte er selbstständig im Netz nach weiteren verwundbaren Systemen. Deshalb genügte ein einziger ungepatchter Rechner, um ein ganzes Netzwerk zu kompromittieren – ohne dass noch jemand auf etwas klicken musste.

Weltweit wurden über 200.000 Systeme in rund 150 Ländern verschlüsselt, besonders sichtbar im britischen Gesundheitssystem NHS, wo Operationen abgesagt und Patienten verlegt werden mussten. Der entscheidende Punkt für unser Thema: Microsoft hatte den passenden Patch MS17-010 bereits im März 2017 bereitgestellt, der Angriff lief im Mai – rund zwei Monate später. Die Lücke war also kein Zero-Day mehr, sondern ein N-Day. Die betroffenen Organisationen hatten den Patch schlicht nicht eingespielt, häufig wegen veralteter Betriebssysteme, fehlender Wartungsfenster oder unklarer Zuständigkeiten.

In der Systematik der CIA-Triade ordnen wir den Fall als Versagen der Verfügbarkeit ein: Die Daten wurden nicht gestohlen, sondern unbrauchbar gemacht und ganze Betriebe lahmgelegt – obwohl die Lösung längst existierte. Haltet diesen Fall als Standardbeispiel bereit, wenn in einer Klausur nach den Folgen mangelnder Patch-Disziplin oder nach einem Verfügbarkeitsvorfall gefragt wird.

**Klausurvorbereitung:** WannaCry nach dem Schema Was – Warum – Folgen wiedergeben, die Zuordnung zum Schutzziel Verfügbarkeit begründen und den Fall korrekt als N-Day-Ausnutzung einordnen können.
-->

---

<!-- _class: chapter -->

# Finden von Schwachstellen

## Wer sucht, warum und wie

<!-- _notes:
Wichtig ist die Erkenntnis, dass dieselbe Tätigkeit – das Suchen von Lücken – sowohl der Verteidigung als auch dem Angriff dienen kann. Technisch unterscheidet sich ein Pentester kaum von einem Angreifer; er nutzt dieselben Werkzeuge und dieselben Methoden. Der Unterschied liegt ausschließlich in drei Dingen: Auftrag, Erlaubnis und Ziel. Genau diese Dreiteilung ist auch juristisch der entscheidende Maßstab, wie wir im Disclosure-Kapitel noch sehen werden.

In diesem Block lernt ihr zwei Dimensionen kennen: die Akteure mit ihren Motiven (wer sucht und warum) und die Methoden (wie wird gesucht). Beide werden in Klausuren gern kombiniert abgefragt, etwa: Welche Methode passt zu welchem Akteur, und warum?

**Klausurvorbereitung:** Begründen können, warum sich offensive und defensive Schwachstellensuche technisch nicht, aber rechtlich und zielbezogen sehr wohl unterscheiden.
-->

---

# Wer findet Schwachstellen?

- Hersteller (interne Tests, Code-Review)
- Pentester und Red Teams
- Sicherheitsforschende und Bug Hunter
- Kriminelle Gruppen
- Staatliche Akteure
- Zufallsfunde von Anwendern

<!-- _notes:
Die Liste reicht bewusst von "gut" bis "böse" – merkt sie euch als Spektrum, nicht als zwei Lager. Hersteller finden Lücken im eigenen Produkt durch interne Tests und Code-Reviews; das ist der billigste Zeitpunkt, weil noch kein Kunde betroffen ist. Pentester und Red Teams suchen im Auftrag und mit schriftlicher Erlaubnis. Der Unterschied zwischen beiden: Ein Pentest prüft systematisch und möglichst vollständig einen definierten Bereich, ein Red Team simuliert dagegen einen realen Angreifer über alle Wege hinweg – inklusive Social Engineering und physischem Zutritt – und prüft damit vor allem, ob die Verteidigung den Angriff überhaupt bemerkt.

Sicherheitsforschende und Bug Hunter arbeiten oft freiwillig, aus Neugier oder im Rahmen von Bug-Bounty-Programmen; sie sind für viele Hersteller faktisch die größte externe Qualitätssicherung. Auf der anderen Seite stehen kriminelle Gruppen, die Lücken für Erpressung, Betrug oder Datendiebstahl nutzen und dabei zunehmend arbeitsteilig und professionell vorgehen. Staatliche Akteure – also Geheimdienste und militärische Einheiten – horten Schwachstellen teils über Jahre für Spionage oder Sabotage. Das ist besonders heikel, weil eine gehortete Lücke ungepatcht bleibt und damit auch gegen die eigene Bevölkerung verwundbar macht; EternalBlue bei WannaCry stammte genau aus einem solchen staatlichen Arsenal.

Und nicht zu vergessen: Viele Lücken werden schlicht zufällig von normalen Anwendern entdeckt, die etwas Ungewöhnliches bemerken. Deshalb braucht jede Organisation einen niedrigschwelligen Meldeweg – auch für Menschen, die gar nicht gesucht haben.

**Klausurvorbereitung:** Mindestens vier Akteursgruppen nennen, jeweils Auftrag und Ziel beschreiben, Pentest und Red Team unterscheiden und erklären können, warum das Horten von Schwachstellen durch staatliche Stellen sicherheitspolitisch umstritten ist.
-->

---

<!-- _class: normal -->
# Motive

<div class="columns">
<div>

### Defensiv
- Reputation und Karriere
- Belohnung (Bounty)
- Neugier, Forschung
- Vertragliche Prüfung

</div>
<div>

### Offensiv
- Finanzieller Gewinn
- Spionage
- Sabotage
- Handel über Broker

</div>
</div>

<!-- _notes:
Die Motive spiegeln die Akteure der vorigen Folie – prägt euch die Gegenüberstellung als Zweispalter ein, das ist ein typisches Klausurformat. Auf der defensiven Seite geht es um Reputation und Karriere: Ein gefundener Bug in einem bekannten Produkt ist ein Karriere-Sprungbrett und in der Szene eine harte Währung. Dazu kommen Bounty-Zahlungen, reine Neugier und Forschungsinteresse sowie vertraglich beauftragte Prüfungen, bei denen das Finden schlicht die bezahlte Arbeitsleistung ist.

Offensiv dominieren finanzieller Gewinn – heute vor allem durch Ransomware und Datenerpressung –, Spionage zur Informationsbeschaffung und Sabotage zur Störung von Betrieb oder Infrastruktur. Der Punkt "Handel über Broker" ist erklärungsbedürftig: Exploit-Broker kaufen funktionierende Angriffstechniken auf und verkaufen sie weiter, etwa an staatliche Kunden. Das bewegt sich zwischen legalem Graubereich und Schwarzmarkt und ist in vielen Ländern kaum reguliert.

Die zentrale Einsicht für das nächste Kapitel: Weil Motive steuerbar sind, kann man Verhalten steuern. Bug-Bounty-Programme sind genau der Versuch, Talente über Geld, Anerkennung und Rechtssicherheit auf die defensive Seite zu ziehen – sie konkurrieren bewusst mit den offensiven Motiven.

**Klausurvorbereitung:** Je drei defensive und offensive Motive nennen, die Rolle von Exploit-Brokern erklären und begründen können, wie Bug-Bounty-Programme gezielt an diesen Motiven ansetzen.
-->

---

# Methoden

- **Manuell**: Code-Review, Pentest, Reverse Engineering
- **Statisch**: Static Application Security Testing (SAST) – Code lesen, ohne ihn auszuführen
- **Dynamisch**: Dynamic Application Security Testing (DAST), Schwachstellen-Scanner – laufende Anwendung testen
- **Fuzzing**: automatisierte Zufallseingaben, um Abstürze zu provozieren
- **Software Composition Analysis (SCA)**: verwundbare Fremd-Abhängigkeiten finden

<!-- _notes:
Manuelle Verfahren – Code-Review, Pentest, Reverse Engineering – sind gründlich und finden auch Logikfehler, die kein Werkzeug erkennt, sind aber teuer und nicht skalierbar. Reverse Engineering bedeutet dabei, aus einem fertigen Programm ohne Quellcode die Funktionsweise zurückzugewinnen; das ist der typische Weg, wenn man fremde Software oder einen Patch analysiert.

SAST steht für statische Analyse: Man untersucht den Quellcode, ohne das Programm auszuführen. Vorteil: sehr früh im Entwicklungsprozess einsetzbar, findet die Fundstelle zeilengenau und lässt sich automatisch in die Build-Pipeline einbauen. Nachteil: viele False Positives, also Fehlalarme, weil das Werkzeug den Laufzeitkontext nicht kennt. DAST ist das Gegenteil: Man testet die laufende Anwendung von außen, wie ein Angreifer. Vorteil: findet nur real erreichbare Probleme und damit kaum Fehlalarme. Nachteil: setzt ein lauffähiges System voraus, greift also erst spät, und sieht nur das, was von außen erreichbar ist – man spricht deshalb auch vom Black-Box-Test. Merkt euch das Gegensatzpaar: SAST früh und vollständig, aber ungenau; DAST spät und unvollständig, aber präzise.

Fuzzing wirft massenhaft zufällige oder gezielt ungültige Eingaben auf ein Programm und beobachtet, ob es abstürzt oder sich unerwartet verhält – ein Absturz ist oft der Hinweis auf einen Speicherfehler und damit auf eine ausnutzbare Lücke. Besonders wirksam ist das bei Parsern und Dateiformaten, also überall dort, wo Software fremde Eingaben interpretiert. SCA schließlich prüft nicht den eigenen Code, sondern die eingebundenen Fremdbibliotheken gegen bekannte CVEs. Das ist heute besonders wichtig, weil moderne Anwendungen größtenteils aus Abhängigkeiten bestehen – SCA findet also keine neuen Lücken, sondern bereits bekannte in übernommenen Bausteinen. Die Grundlage dafür ist die SBOM, die wir im Patchmanagement-Kapitel noch behandeln.

**Klausurvorbereitung:** SAST, DAST, Fuzzing und SCA voneinander abgrenzen, für jede Methode je einen Vor- und Nachteil nennen und zu einer gegebenen Situation die passende Methode auswählen und begründen können.
-->

---

<!-- _class: chapter -->

# Bug-Bounty-Programme

## Schwachstellen als Markt

<!-- _notes:
Bug-Bounty-Programme sind der Versuch, das Finden von Schwachstellen in geordnete, legale Bahnen zu lenken und dafür zu bezahlen. Die Grundidee: Statt dass Forschende ihre Funde auf dem Schwarzmarkt verkaufen oder aus Angst vor rechtlichen Folgen gar nichts melden, schafft man einen legalen Kanal mit klaren Regeln und fairer Vergütung.

Ökonomisch betrachtet ist das ein Anreizsystem: Die Organisation macht den legalen Weg attraktiver als den illegalen – nicht unbedingt über den höchsten Preis, sondern über Rechtssicherheit, Reputation und schnelle, respektvolle Bearbeitung. Achtet in diesem Kapitel auf drei prüfungsrelevante Begriffe, die gleich kommen: Scope, Triage und Duplikat.

**Klausurvorbereitung:** Die Grundidee eines Bug-Bounty-Programms als Anreizsystem erklären und von einem beauftragten Pentest abgrenzen können.
-->

---
<!-- _class: biglist -->
# Prinzip

- Organisation lädt Externe zur Suche ein und **zahlt für valide Funde**
- Klarer **Scope**: welche Systeme, welche Methoden erlaubt
- Vergütung nach Schweregrad
- Plattformen: HackerOne, Bugcrowd, Intigriti, YesWeHack

> Die Testfreigabe gilt für die ausdrücklich genannten Systeme und Methoden, nicht für beliebige Konten oder Produktivdaten.

<!-- _notes:
Das Prinzip: Eine Organisation lädt externe Forschende ein, ihre Systeme zu testen, und zahlt nur für valide, neue Funde. Darin steckt ein wesentlicher Unterschied zum Pentest: Beim Pentest bezahlt man Aufwand (Tage), beim Bug Bounty bezahlt man Ergebnisse (Funde). Beides ergänzt sich, ersetzt sich aber nicht.

Drei Elemente müsst ihr kennen. Erstens der Scope – die Spielregeln, welche Systeme getestet werden dürfen und welche Methoden erlaubt sind. Typisch ausgeschlossen sind etwa Denial-of-Service-Tests, Social Engineering gegen Mitarbeitende oder der Zugriff auf echte Kundendaten. Alles außerhalb des Scope ist tabu und kann strafbar sein; der Scope ist damit gleichzeitig die rechtliche Grundlage des Testens.

Zweitens die Triage: Jeder eingehende Report wird geprüft – ist die Lücke echt, ist sie reproduzierbar, liegt sie im Scope, und wurde sie nicht schon gemeldet? Duplikate werden nicht doppelt bezahlt, was für Forschende frustrierend sein kann und deshalb transparente Kommunikation erfordert. Drittens die Vergütung nach Schweregrad: Die Prämienhöhe wird typischerweise mit dem CVSS-Score begründet, den wir im nächsten Kapitel kennenlernen – das verbindet die beiden Themen direkt miteinander. Plattformen wie HackerOne, Bugcrowd, Intigriti oder YesWeHack vermitteln zwischen Unternehmen und Forschenden, stellen die Infrastruktur bereit und übernehmen auf Wunsch die Triage und die Auszahlung.

**Klausurvorbereitung:** Scope, Triage, Duplikat und schweregradabhängige Vergütung erklären können; begründen können, warum der Scope zugleich die rechtliche Absicherung der Forschenden darstellt.
-->

---

<!-- _class: normal -->
# Vorteile und Grenzen

<div class="columns">
<div>

### Vorteile
- Viele unterschiedliche Blickwinkel
- Bezahlung nur für Ergebnisse
- Legaler Kanal für Forschende

</div>
<div>

### Grenzen
- Report-Flut, Duplikate, Fehlmeldungen
- Triage-Aufwand
- Reife Prozesse zum Patchen nötig
- Konkurrenz zum Schwarzmarkt

</div>
</div>

<!-- _notes:
Der größte Vorteil ist die Vielfalt: Hunderte unterschiedliche Köpfe schauen aus Blickwinkeln auf ein System, die ein internes Team nie alle abdecken könnte – unterschiedliche Spezialisierungen, unterschiedliche Werkzeuge, unterschiedliche Denkweisen. Dazu kommt das erfolgsabhängige Kostenmodell: Man zahlt für Ergebnisse, nicht für Aufwand, und hat damit kalkulierbares Risiko. Und es ist ein legaler, geschützter Kanal, der Forschenden eine Alternative zum Schwarzmarkt und zum Schweigen bietet.

Die Grenzen sind in der Praxis mindestens so wichtig. Ein offenes Programm erzeugt eine Flut an Reports, darunter viele Duplikate, Fehlmeldungen und Funde ohne echte Sicherheitsrelevanz – jeder davon muss trotzdem gesichtet und beantwortet werden. Dieser Triage-Aufwand wird regelmäßig unterschätzt und bindet genau die erfahrenen Sicherheitsleute, die ohnehin knapp sind. Vor allem aber nützt ein Bug-Bounty nichts, wenn die Organisation die gemeldeten Lücken nicht zügig patchen kann: Ein Programm ohne reifen Patch-Prozess produziert nur einen dokumentierten Stapel bekannter, offener Probleme – und erhöht damit sogar die Haftungsrisiken, weil die Kenntnis der Lücke nachweisbar ist. Deshalb gilt die Faustregel: Erst Patchmanagement aufbauen, dann Bug Bounty öffnen.

**Klausurvorbereitung:** Je drei Vorteile und Grenzen nennen und begründen können, warum ein Bug-Bounty-Programm ohne funktionierenden Patch-Prozess kontraproduktiv ist.
-->

---

# Bounty vs. Markt

- Bounty-Höhen liegen **je nach Fall** oft unter den Preisen, die **Exploit-Broker** (Händler, die funktionierende Angriffstechniken auf- und weiterverkaufen, z. B. an staatliche Kunden) für Zero-Days zahlen
- Motivation daher auch Anerkennung (Hall of Fame) und Karriere
- Voraussetzung für Erfolg: klare Regeln, faire Bewertung, schnelle Reaktion

> **Entscheidend:** Ein Bug-Bounty-Programm bietet einen autorisierten Meldeweg; ein Verkauf an einen Exploit-Broker folgt anderen Regeln und Interessen.

<!-- _notes:
Für besonders begehrte Zero-Days – etwa in weit verbreiteten Betriebssystemen, Browsern oder Messengern – zahlen spezialisierte Exploit-Broker teils deutlich mehr als offizielle Bounty-Programme. Der Grund ist die Exklusivität: Ein Bounty-Programm bezahlt dafür, dass die Lücke geschlossen wird; ein Broker bezahlt dafür, dass sie offen bleibt und nur sein Kunde sie kennt. Diese Aussage gilt aber nicht pauschal – sie hängt stark vom Produkt und von der Art der Lücke ab, und die große Mehrheit gewöhnlicher Funde wird überhaupt nicht am Schwarzmarkt gehandelt.

Warum entscheiden sich Forschende trotzdem häufig für den legalen Weg? Weil Geld nicht das einzige Motiv ist – das knüpft direkt an die Motivfolie an. Anerkennung in einer "Hall of Fame", ein sauberer Lebenslauf, die Möglichkeit, über den Fund öffentlich zu sprechen, und vor allem Rechtssicherheit wiegen für viele schwerer als der höchstmögliche Preis. Hinzu kommt: Der Verkauf an einen Broker bedeutet Intransparenz, mögliche rechtliche Risiken und ein ethisches Problem, weil man nicht kontrolliert, gegen wen der Exploit eingesetzt wird.

Damit der legale Weg attraktiv bleibt, muss die Herstellerseite liefern: klare Regeln, faire und nachvollziehbare Bewertung und vor allem schnelle Reaktion. Ein Programm, das Reports monatelang unbeantwortet lässt oder Schweregrade kleinrechnet, um Prämien zu sparen, beschädigt seinen eigenen Zweck.

**Klausurvorbereitung:** Erklären können, warum Exploit-Broker für bestimmte Zero-Days mehr zahlen als Bounty-Programme, und mindestens drei nichtmonetäre Gründe nennen können, die Forschende dennoch zum legalen Meldeweg bewegen.
-->

---

<!-- _class: chapter -->

# Responsible Disclosure

## Meldung und Veröffentlichung

<!-- _notes:
Responsible Disclosure beantwortet die Frage: Ich habe eine Lücke gefunden – was jetzt? Sofort veröffentlichen wäre unverantwortlich, denn dann könnten Angreifer die Lücke ausnutzen, bevor ein Patch existiert. Gar nichts sagen wäre aber auch falsch, weil die Lücke dann nie behoben wird und andere sie unabhängig wiederentdecken können – Mehrfachentdeckungen sind keineswegs selten.

In diesem Kapitel geht es um den geordneten Mittelweg und seinen rechtlichen Rahmen. Koordinierte Offenlegung soll Hersteller, Forschende und gegebenenfalls weitere Betroffene auf eine abgestimmte Veröffentlichung vorbereiten. Im Kern ist das ein Interessenausgleich zwischen drei Parteien: Der Finder will Anerkennung und will nicht blockiert werden, der Hersteller will Zeit für eine saubere Korrektur, und die Nutzer wollen so kurz wie möglich ungeschützt sein. Jedes Disclosure-Modell gewichtet diese drei Interessen anders – genau daran könnt ihr die Modelle in der Klausur auseinanderhalten.

**Klausurvorbereitung:** Den Interessenkonflikt zwischen Finder, Hersteller und Nutzern benennen und erklären können, warum weder sofortige Veröffentlichung noch vollständiges Schweigen eine gute Lösung ist.
-->

---

# Disclosure-Modelle

| Modell | Kern |
|---|---|
| **Full Disclosure** | sofortige Veröffentlichung, Druck auf Hersteller |
| **Non-Disclosure** | keine Veröffentlichung, Weitergabe nur intern |
| **Responsible Disclosure** | erst Hersteller informieren, Veröffentlichung nach Behebung |
| **Coordinated Disclosure** | mehrere Parteien (Hersteller, CERT/BSI) stimmen einen gemeinsamen Termin ab |


<!-- _notes:
Full Disclosure bedeutet: alles sofort veröffentlichen, inklusive technischer Details und oft eines funktionierenden Proof-of-Concept. Das erzeugt maximalen Druck auf den Hersteller und wird historisch damit begründet, dass viele Hersteller früher gar nicht reagierten, solange nichts öffentlich war. Der Preis dafür: Die Nutzer sind bis zum Patch schutzlos und die Angreifer bekommen die Anleitung frei Haus.

Non-Disclosure ist das andere Extrem: Man behält die Lücke für sich oder gibt sie nur intern weiter – typisch für staatliche Akteure und für Broker-Käufer. Das Problem haben wir bei den Akteuren schon gesehen: Eine zurückgehaltene Lücke bleibt ungepatcht und schadet potenziell allen, auch der eigenen Seite.

Die beiden mittleren Modelle werden im Alltag oft synonym verwendet, unterscheiden sich aber im Detail – und genau dieser Unterschied ist prüfungsrelevant. Bei Responsible Disclosure informiert der Finder zuerst den Hersteller und veröffentlicht erst, nachdem die Lücke behoben ist; die Steuerung liegt im Kern beim Finder, der auch die Frist setzt. Coordinated Disclosure geht einen Schritt weiter: Mehrere Parteien – Hersteller, oft eine Koordinierungsstelle wie das BSI, manchmal mehrere betroffene Anbieter – stimmen gemeinsam einen Veröffentlichungstermin ab. Das ist nötig, wenn eine Lücke viele Produkte gleichzeitig betrifft, etwa bei einer weit verbreiteten Bibliothek oder einem Protokollfehler: Veröffentlicht man zu früh, sind alle noch verwundbar; wartet man auf den langsamsten Hersteller, bleiben die schnellen unnötig lange still.

**Klausurvorbereitung:** Die vier Modelle in einer Tabelle gegenüberstellen, Responsible und Coordinated Disclosure sauber unterscheiden (Steuerung durch den Finder vs. Abstimmung mehrerer Parteien) und für eine gegebene Situation das passende Modell begründet auswählen können.
-->

---
<!-- _class: biglist -->
# Ablauf und Fristen

- Meldung an Hersteller (PSIRT, `security.txt`) oder Koordinierungsstelle (CERT/CC, BSI)
- Bestätigung, Analyse, Patch-Entwicklung
- Übliche Frist: **90 Tage** als Beispiel einer Offenlegungs-Policy (z. B. Google Project Zero)
- Veröffentlichung mit Advisory und CVE


<!-- _notes:
Der typische Ablauf in vier Schritten. Zuerst braucht man einen Meldeweg. Viele größere Hersteller haben ein PSIRT – ein Product Security Incident Response Team, also die Stelle, die ausschließlich Sicherheitsmeldungen zu den eigenen Produkten bearbeitet. Abzugrenzen davon ist das CSIRT oder CERT, das Vorfälle in der eigenen Infrastruktur behandelt. Wo man meldet, steht idealerweise in der standardisierten Datei security.txt, die unter einem festen Pfad auf der Website liegt und Kontaktadresse, Richtlinie und bevorzugte Sprache nennt. Findet man keinen Ansprechpartner – oder reagiert der Hersteller nicht –, wendet man sich an eine Koordinierungsstelle wie das CERT/CC oder das BSI, die dann vermittelt.

Dann folgen Bestätigung, Analyse und Patch-Entwicklung durch den Hersteller. Die Bestätigung ist wichtiger, als sie klingt: Sie gibt dem Finder die Sicherheit, dass die Meldung angekommen ist, und markiert den Startpunkt der Frist. Die Patch-Entwicklung dauert oft länger als erwartet, weil der Fehler nicht nur korrigiert, sondern auch auf alle unterstützten Versionen zurückportiert und getestet werden muss.

Zur Frist: Die 90 Tage sind kein Gesetz, sondern das bekannteste Beispiel einer selbst gesetzten Offenlegungs-Policy, populär gemacht von Googles Project Zero. Andere Programme nutzen andere Fristen, und die meisten Policies kennen Ausnahmen: eine Verlängerung, wenn der Patch kurz bevorsteht, und eine drastische Verkürzung auf wenige Tage, wenn die Lücke bereits aktiv ausgenutzt wird. Am Ende steht die Veröffentlichung in Form eines Advisory – einer strukturierten Sicherheitsmeldung mit betroffenen Versionen, Auswirkung und Abhilfe – zusammen mit der vergebenen CVE-ID.

**Klausurvorbereitung:** Den vierstufigen Ablauf wiedergeben, PSIRT und CERT unterscheiden, die Funktion von security.txt erklären und einordnen können, dass die 90-Tage-Frist eine freiwillige Policy und keine gesetzliche Vorgabe ist.
-->

---

# Ablauf im Zeitstrahl

![w:1200 center](img/schwachstellen-disclosure-zeitstrahl.svg)

<!-- _notes:
Der Zeitstrahl visualisiert den eben beschriebenen Ablauf noch einmal und macht vor allem die zeitliche Gewichtung sichtbar: Der mit Abstand längste Abschnitt ist die Patch-Entwicklung, nicht die Meldung oder die Veröffentlichung. Wichtig zum Mitnehmen: Diese Zeitachse ist ein Aushandlungsprozess, kein starrer Fahrplan. Reagiert der Hersteller zügig und ist der Patch früher fertig, wird oft vor Ablauf der Frist veröffentlicht; braucht er länger, wird im Rahmen der Policy manchmal verlängert. Umgekehrt kann die Frist drastisch verkürzt werden, wenn die Lücke bereits ausgenutzt wird.

Verknüpft den Zeitstrahl gedanklich mit dem Lebenszyklus vom Anfang der Vorlesung: Was hier als "Veröffentlichung" endet, ist dort der Startpunkt des Angriffsfensters. Die Disclosure-Phase schützt die Nutzer also nur bis zu dem Moment, in dem die Verantwortung auf die Anwenderunternehmen übergeht.

**Bildbeschreibung:** Die Grafik zeigt vier nebeneinander angeordnete, abgerundete Kästen, die durch Pfeile von links nach rechts verbunden sind. Der erste Kasten ist blau und mit "Meldung (Tag 0)" beschriftet, der zweite orange mit "Bestätigung", der dritte grün mit "Patch-Entwicklung" (der breiteste Kasten) und der vierte rot mit "Veröffentlichung". Unterhalb der Kette verläuft eine durchgehende waagerechte Linie über die gesamte Breite, beschriftet mit "Frist: üblicherweise 90 Tage bis zur Veröffentlichung". Die Linie verdeutlicht, dass die gesamte Abfolge innerhalb dieses Zeitraums abgeschlossen sein soll.

**Klausurvorbereitung:** Den Zeitstrahl aus dem Gedächtnis skizzieren, Tag 0 korrekt zuordnen und benennen können, unter welchen Umständen die 90-Tage-Frist verlängert oder verkürzt wird.
-->

---

# Rechtliche Lage

- **§ 202c StGB** („Hackerparagraph“): stellt bestimmte **Vorbereitungshandlungen** unter Strafe – der Kontext entscheidet
- Unbefugter Zugriff bleibt strafbar, auch bei guter Absicht
- **Safe Harbor**: vertragliche Zusicherung des Herstellers, Forschende bei regelkonformem Testen nicht zu belangen – schafft Rechtssicherheit, aber nur, wenn die Regeln der Policy **eingehalten** werden
- Herstellerseite: Meldende nicht bedrohen, transparent kommunizieren

> **Wichtig:** Eine Meldemöglichkeit oder Safe-Harbor-Regel ist keine pauschale Erlaubnis, beliebige Systeme zu testen; maßgeblich sind die konkreten Freigaben.

<!-- _notes:
Ein kurzer, bewusst vorsichtiger Blick auf die Rechtslage – das ist keine Rechtsberatung, aber die Grundlinien solltet ihr kennen. Der § 202c StGB, umgangssprachlich "Hackerparagraph", verbietet nicht pauschal jedes Sicherheitswerkzeug. Er stellt bestimmte Vorbereitungshandlungen unter Strafe – etwa das Herstellen oder Verschaffen von Programmen zum Ausspähen von Daten –, und ob eine Handlung darunter fällt, hängt stark vom Kontext und der Absicht ab. Dieselben Werkzeuge, die ein Angreifer nutzt, braucht auch die legitime Sicherheitsforschung; ein pauschales Verbot wäre deshalb praxisfern. Verwandt sind § 202a (Ausspähen von Daten) und § 303a/b (Datenveränderung, Computersabotage).

Ganz wichtig und oft übersehen: Ein unbefugter Zugriff auf fremde Systeme bleibt strafbar, selbst wenn man es nur gut meinte und die Lücke danach melden wollte. Gute Absicht ist kein Rechtfertigungsgrund. Das betrifft auch scheinbar harmlose Fälle – etwa das "nur mal Ausprobieren" eines gefundenen Zugangs oder das Herunterladen eines Datensatzes als Beweis.

Genau hier setzt ein Safe Harbor an: Eine Bug-Bounty- oder Disclosure-Policy kann Forschenden ausdrücklich zusichern, dass der Betreiber bei regelkonformem Testen keine zivil- oder strafrechtlichen Schritte einleitet. Aber dieser Schutz hat zwei Grenzen, die ihr kennen müsst: Er gilt nur, solange man sich exakt an Scope und Regeln hält – und er bindet nur den Betreiber selbst, nicht automatisch Dritte, deren Systeme oder Daten mitbetroffen sind. Auf der Herstellerseite gehört zur guten Praxis, Meldende nicht mit rechtlichen Schritten einzuschüchtern, sondern transparent zu kommunizieren – Drohungen gegen Melder führen regelmäßig zu Reputationsschaden und dazu, dass künftige Funde lieber veröffentlicht oder verkauft als gemeldet werden.

**Klausurvorbereitung:** Erklären können, was § 202c StGB regelt und warum der Kontext entscheidend ist; begründen können, warum gute Absicht einen unbefugten Zugriff nicht rechtfertigt; Zweck und Grenzen einer Safe-Harbor-Klausel darstellen können.
-->

---

<!-- _class: chapter -->

# Beurteilung: CVSS

## Common Vulnerability Scoring System

<!-- _notes:
CVSS – das Common Vulnerability Scoring System – ist der Versuch, die Schwere einer Schwachstelle in einer einzigen Zahl von 0 bis 10 auszudrücken, damit man Lücken vergleichen und priorisieren kann. Es wird vom FIRST gepflegt, ist herstellerunabhängig und frei verwendbar – genau deshalb hat es sich als gemeinsame Sprache zwischen Herstellern, Datenbanken, Bug-Bounty-Programmen und Unternehmen durchgesetzt.

Die wichtigste Botschaft dieses Kapitels steht am Anfang und am Ende: CVSS beschreibt die technische Schwere einer Schwachstelle, nicht das Risiko für eure Organisation. Die Priorität ergibt sich zusätzlich aus Exposition und Bedeutung des betroffenen Systems sowie daraus, ob die Lücke tatsächlich ausgenutzt wird. Wer diese Unterscheidung sauber erklären kann, hat die häufigste Prüfungsfrage zu CVSS bereits beantwortet.

**Klausurvorbereitung:** Zweck und Wertebereich von CVSS nennen und den Unterschied zwischen Schwere (CVSS) und Risiko (Kontext) als Leitsatz des Kapitels erklären können.
-->

---

# Aufbau CVSS 4.0

- **Base**: Eigenschaften der Schwachstelle, konstant
- **Threat**: Ausnutzungsreife (Exploit Maturity), zeitabhängig
- **Environmental**: Anpassung an die eigene Umgebung
- **Supplemental**: Zusatzinfos (z. B. Automatable, Safety), ohne Score-Einfluss

<!-- _notes:
CVSS 4.0 besteht aus vier Metrikgruppen, die man sich als Schichten vorstellen kann – von "gilt für alle" bis "gilt nur für mich". Die Base-Metriken beschreiben die Schwachstelle selbst und ändern sich nicht: Sie liefern den Grundwert, den man in NVD, Advisories und Pressemeldungen sieht. Weil sie konstant sind, können sie den Kontext naturgemäß nicht berücksichtigen.

Die Threat-Gruppe berücksichtigt, wie ausgereift ein Exploit schon ist (Exploit Maturity), und ist damit zeitabhängig: Eine Lücke, für die nur ein theoretischer Nachweis existiert, ist weniger gefährlich als eine, für die fertiger, automatisierter Angriffscode kursiert. Derselbe Basiswert kann über die Zeit also unterschiedlich dringend sein. Die Environmental-Metriken erlauben es, den Wert an die eigene Umgebung anzupassen – sowohl nach unten als auch nach oben: Ein System ohne sensible Daten entschärft eine an sich kritische Vertraulichkeitslücke, während ein hochkritischer Produktionsserver sie verschärft. Hier bildet man auch bereits vorhandene Schutzmaßnahmen ab.

Die Supplemental-Gruppe liefert nur Zusatzinformationen – etwa ob ein Angriff automatisierbar ist (Automatable) oder ob physische Sicherheitsrisiken für Menschen bestehen (Safety) – und fließt bewusst nicht in den Score ein; sie soll die Entscheidung unterstützen, ohne die Vergleichbarkeit der Zahl zu zerstören. In der Praxis wird meist nur der Base-Score kommuniziert, obwohl erst Threat und Environmental das echte Bild liefern – das ist eine der häufigsten Fehlanwendungen von CVSS.

Neu in Version 4.0 gegenüber 3.1 sind unter anderem die Umbenennung der Temporal- zur Threat-Gruppe, die zusätzliche Metrik Attack Requirements und die getrennte Betrachtung von Folgesystemen. Die Namenskonvention CVSS-B, CVSS-BT und CVSS-BTE macht außerdem sichtbar, welche Gruppen in einen genannten Wert eingeflossen sind.

**Klausurvorbereitung:** Die vier Metrikgruppen benennen, ihre jeweilige Funktion erklären, angeben können, welche Gruppe nicht in den Score einfließt, und begründen können, warum die alleinige Kommunikation des Base-Scores irreführend sein kann.
-->

---

# Base-Metriken

| Gruppe | Metriken |
|---|---|
| Ausnutzbarkeit | Attack Vector (AV), Attack Complexity (AC), Attack Requirements (AT) |
| Voraussetzungen | Privileges Required (PR), User Interaction (UI) |
| Auswirkung | Vertraulichkeit, Integrität, Verfügbarkeit (VC/VI/VA), Folgesysteme (SC/SI/SA) |

> **Lesebeispiel:** AV:N = Angriff über das Netzwerk; PR:N = keine vorherigen Rechte; UI:N = keine Mitwirkung eines Nutzers erforderlich.

<!-- _notes:
Diese Tabelle müsst ihr nicht auswendig können – sie zeigt die Logik hinter der Base-Bewertung, und zwar in drei intuitiven Fragen. Erstens Ausnutzbarkeit: Wie leicht ist der Angriff? Der Attack Vector fragt, von wo aus angegriffen werden kann – die Stufen reichen von Network (über das Internet, am schlimmsten) über Adjacent (nur im selben Netzsegment) und Local (lokaler Zugang oder Benutzerkonto) bis Physical (Gerät in der Hand, am harmlosesten). Attack Complexity erfasst, ob der Angreifer Schutzmechanismen umgehen muss, Attack Requirements, ob bestimmte günstige Umstände vorliegen müssen, etwa ein Race-Condition-Zeitfenster oder eine spezielle Konfiguration.

Zweitens Voraussetzungen: Braucht der Angreifer bereits Rechte auf dem System (Privileges Required: None, Low, High) oder muss ein Nutzer mitwirken, etwa auf einen Link klicken (User Interaction: None, Passive, Active)? Je weniger nötig ist, desto gefährlicher – und desto höher der Score. Eine Lücke, die ohne Anmeldung und ohne Nutzermitwirkung über das Netz ausgenutzt werden kann, ist der klassische Wurm-Kandidat; genau diese Kombination machte EternalBlue und damit WannaCry so wirksam.

Drittens Auswirkung: Hier wird auf die CIA-Triade zurückgegriffen – Vertraulichkeit, Integrität und Verfügbarkeit, in CVSS 4.0 als VC, VI und VA abgekürzt. Neu und wichtig ist die Trennung in verwundbares System und Folgesysteme (SC, SI, SA): Wenn ein kompromittierter Webserver als Sprungbrett in das dahinterliegende Netz dient, wird dieser Übergriff jetzt eigenständig bewertet. In CVSS 3.1 wurde das noch unpräzise über die Metrik "Scope" abgebildet.

**Klausurvorbereitung:** Die drei Fragestellungen (Ausnutzbarkeit, Voraussetzungen, Auswirkung) erläutern, die Auswirkungsmetriken der CIA-Triade zuordnen und erklären können, warum AV:N, PR:N und UI:N zusammen besonders hohe Scores erzeugen.
-->

---

# Vektor lesen und Schweregrad

`CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N` → **9.3**

| Score | Schweregrad |
|---|---|
| 0.0 | None |
| 0.1 – 3.9 | Low |
| 4.0 – 6.9 | Medium |
| 7.0 – 8.9 | High |
| 9.0 – 10.0 | Critical |

> **Vektor lesen:** `AV:N` Netzwerk, `PR:N` ohne Anmeldung, `UI:N` ohne Nutzeraktion. Erst danach den Score als Schweregrad einordnen.

<!-- _notes:
Ein CVSS-Vektor ist kein Geheimcode, sondern eine Liste von Abkürzungen nach dem Muster Metrik:Wert, getrennt durch Schrägstriche. Man liest ihn von links nach rechts durch. AV:N heißt Attack Vector Network, also übers Netz angreifbar – der schlimmste Fall. AC:L bedeutet niedrige Komplexität, AT:N keine besonderen Anforderungen; der Angriff gelingt also zuverlässig und ohne günstige Umstände. PR:N heißt keine Rechte nötig und UI:N keine Nutzerinteraktion – der Angreifer braucht niemanden, der mitmacht. VC:H, VI:H und VA:H bedeuten hohe Auswirkung auf Vertraulichkeit, Integrität und Verfügbarkeit des verwundbaren Systems; SC:N, SI:N und SA:N bedeuten, dass keine Folgesysteme betroffen sind.

Übers Netz, ohne Hürden, mit vollem Schaden – kein Wunder, dass daraus ein sehr hoher Wert von 9,3 und die Stufe "Critical" entsteht. Änderte man einen einzigen Teil, etwa PR auf High oder AV auf Local, sänke der Score deutlich. Genau solche Änderungen eignen sich gut als Prüfungsfrage: Ihr müsst nicht rechnen können, aber die Richtung der Änderung begründen.

Die Einstufungstabelle übersetzt den Zahlenwert in eine Sprachstufe von None bis Critical. Beachtet die Logik der Grenzen: Ab 7.0 gilt High, ab 9.0 Critical – und viele Unternehmen knüpfen genau an diese Schwellen ihre Patch-Fristen. Deshalb hat die Frage, ob ein Score 8,9 oder 9,0 beträgt, in der Praxis reale Konsequenzen, obwohl der technische Unterschied minimal ist. Das ist ein bekannter Kritikpunkt an schwellenbasierter Priorisierung.

**Klausurvorbereitung:** Einen vorgegebenen CVSS-Vektor Metrik für Metrik in Klartext übersetzen, den Score der richtigen Schweregradstufe zuordnen und angeben können, wie sich eine geänderte Einzelmetrik auf den Score auswirken würde.
-->

---

# Grenzen von CVSS

- Score misst **Schwere**, nicht **Risiko**
- Kontext fehlt: Exposition, Kritikalität des Systems, Ausnutzung in freier Wildbahn

- **EPSS**: Wahrscheinlichkeit einer Ausnutzung in den nächsten 30 Tagen
- **CISA KEV**: Katalog nachweislich ausgenutzter Schwachstellen
- **SSVC**: Entscheidungsbaum (Track, Attend, Act)

<!-- _notes:
Risiko entsteht erst im Kontext – wie exponiert ist das System, wie kritisch ist es fürs Geschäft, und wird die Lücke tatsächlich ausgenutzt? Eine nur mittelschwere Lücke auf einem direkt aus dem Internet erreichbaren Server kann in der Praxis dringender sein als eine als "kritisch" bewertete Lücke auf einem abgeschotteten Testsystem, das niemand erreicht. Hinzu kommt ein statistisches Problem: Ein großer Teil aller veröffentlichten CVEs trägt einen Score von 7 oder höher. Wer rein nach CVSS priorisiert, erhält deshalb eine unüberschaubar lange Liste "wichtiger" Lücken und damit faktisch gar keine Priorisierung.

Deshalb ergänzt man CVSS mit weiteren Signalen. EPSS – das Exploit Prediction Scoring System – schätzt datenbasiert die Wahrscheinlichkeit, dass eine Lücke in den nächsten 30 Tagen ausgenutzt wird, und liefert einen Wert zwischen 0 und 1. Es ist eine Prognose, also zukunftsgerichtet und unsicher, aber sehr wirksam zur Verkleinerung der Arbeitsliste. Die KEV-Liste (Known Exploited Vulnerabilities) der US-Behörde CISA ist das Gegenstück: Sie sammelt Lücken, für die eine Ausnutzung nachweislich beobachtet wurde – also Vergangenheit statt Prognose. Steht eine Lücke dort, sollte man sofort handeln, unabhängig vom CVSS-Wert; für US-Bundesbehörden ist das sogar verpflichtend mit festen Fristen.

SSVC schließlich (Stakeholder-Specific Vulnerability Categorization) verzichtet bewusst auf eine Zahl und arbeitet stattdessen mit einem Entscheidungsbaum, der zu einer Handlungsempfehlung führt: Track (beobachten), Attend (zeitnah bearbeiten) oder Act (sofort handeln). Der Vorteil: Das Ergebnis ist direkt eine Entscheidung und keine Zahl, die erst noch interpretiert werden muss.

**Klausurvorbereitung:** Den Unterschied zwischen Schwere und Risiko an einem Beispiel erläutern, EPSS (Prognose), KEV (nachgewiesene Ausnutzung) und SSVC (Entscheidungsbaum) voneinander abgrenzen und den Merksatz "CVSS sagt, wie schlimm es sein könnte – EPSS und KEV sagen, ob es passiert" erklären können.
-->

---

<!-- _class: chapter -->

# Patchmanagement

## Organisation im Unternehmen

<!-- _notes:
Die letzte offene Frage ist die praktischste: Wie schafft es ein Unternehmen mit tausenden Systemen, aus einer bekannten Lücke tatsächlich einen ausgerollten und verifizierten Patch zu machen? Das ist überwiegend Organisation und nicht Technik – und genau da scheitert es in der Praxis am häufigsten, wie wir gleich bei Equifax sehen werden.

Merkt euch die Gliederung dieses Kapitels als Ablauf: erst Voraussetzungen (was muss vorhanden sein, bevor man überhaupt patchen kann?), dann der Prozess, dann Priorisierung und Rollout, dann der Umgang mit Ausnahmen, und schließlich die Messung. Der zentrale Satz bleibt derselbe wie zu Beginn: Ein verfügbarer Patch schützt erst nach erfolgreichem Rollout und anschließender Verifikation.

**Klausurvorbereitung:** Patchmanagement als organisatorischen Prozess einordnen und die Teilschritte Voraussetzungen – Prozess – Priorisierung – Rollout – Ausnahmen – Kennzahlen aufzählen können.
-->

---

# Voraussetzungen

- **Asset-Inventar / Configuration Management Database (CMDB)**: zentrales Verzeichnis, welche Systeme überhaupt im Einsatz sind
- **Software Bill of Materials (SBOM)**: Stückliste, welche Komponenten und Bibliotheken in einer Software stecken
- Klare **Verantwortlichkeiten** je System
- Quellen: Herstellerhinweise, CERT-Bund, CVE-Feeds, Scanner

<!-- _notes:
Bevor man irgendetwas patchen kann, muss man wissen, was man überhaupt besitzt – das klingt banal, ist aber in der Praxis der häufigste Bruchpunkt. Die CMDB, die Configuration Management Database, ist das zentrale Verzeichnis aller Systeme: Server, Clients, Netzwerkgeräte, jeweils mit installierter Software, Version, Standort und Verantwortlichem. Ohne ein solches Inventar bekommt man einen CVE-Alarm für eine bestimmte Softwareversion und weiß schlicht nicht, auf welchen Systemen im Unternehmen diese Version überhaupt läuft. Die typische Schwachstelle einer CMDB ist die Aktualität: Ein Inventar, das nur einmal jährlich manuell gepflegt wird, ist im Ernstfall wertlos – deshalb kombiniert man es mit automatischer Erkennung (Discovery).

Die SBOM ergänzt das auf Code-Ebene: Sie listet maschinenlesbar, welche Bibliotheken und Komponenten in einer einzelnen Anwendung stecken, inklusive Version und Herkunft. Das ist die Grundlage, um bei einer neuen CVE in einer Fremdbibliothek überhaupt zu wissen, welche eigenen Produkte betroffen sind – ähnlich wie wir es bei SCA schon gesehen haben. Wie wichtig das ist, hat Log4Shell 2021 gezeigt: Viele Organisationen konnten tagelang nicht beantworten, ob und wo sie die betroffene Log4j-Bibliothek einsetzten. Merkt euch die Arbeitsteilung: CMDB beantwortet "welche Systeme habe ich?", SBOM beantwortet "was steckt in dieser Anwendung drin?".

Dazu kommen klare Verantwortlichkeiten: Für jedes System muss namentlich jemand zuständig sein, sonst bleibt ein Patch-Hinweis liegen, weil sich niemand angesprochen fühlt. Und schließlich die Quellen, aus denen man überhaupt von einer Lücke erfährt: Herstellerhinweise und Advisories, die Warnmeldungen von CERT-Bund, automatisierte CVE-Feeds und die eigenen Schwachstellenscanner, die den Ist-Zustand der Systeme prüfen.

**Klausurvorbereitung:** CMDB und SBOM unterscheiden und je einen Anwendungsfall nennen, begründen können, warum ein unvollständiges Inventar jeden Patch-Prozess aushöhlt, und mindestens drei Informationsquellen für neue Schwachstellen aufzählen können.
-->

---

# Der Patch-Prozess

![w:1200 center](img/schwachstellen-patchprozess.svg)

> **Wichtig:** Ohne Verifikation (Scan nach Rollout) ist ein Patch nur „angenommen“, nicht „wirksam“.

<!-- _notes:
Die dargestellte Abfolge zeigt den Prozess als geschlossenen Kreislauf mit sechs Schritten – und der Kreislauf ist hier kein Zufall: Patchmanagement ist keine Projektaufgabe mit Ende, sondern ein dauerhaft laufender Betriebsprozess.

Erkennen und Bewerten kennt ihr schon aus den vorherigen Kapiteln: die Kombination aus CVE-Feed, Scanner und CMDB auf der einen, CVSS plus EPSS/KEV auf der anderen Seite. Priorisieren übersetzt die Bewertung in eine Reihenfolge und eine Frist. Testen und Freigeben bedeutet, den Patch erst in einer Testumgebung zu prüfen, bevor er produktiv geht – ein fehlerhafter Patch kann selbst zum Verfügbarkeitsproblem werden, und es gibt zahlreiche Fälle, in denen ein Sicherheitsupdate ganze Systemlandschaften lahmgelegt hat. Ausrollen ist die eigentliche Verteilung auf die Zielsysteme.

Und der letzte, in der Praxis am häufigsten vergessene Schritt ist Verifizieren: ein erneuter Scan nach dem Rollout, der bestätigt, dass die Lücke tatsächlich geschlossen ist. Warum ist das so wichtig? Weil zwischen "Patch verteilt" und "Patch wirksam" viel passieren kann: Systeme waren ausgeschaltet, der erforderliche Neustart blieb aus, der Patch schlug fehl, ein Dienst läuft noch in der alten Version, oder ein Backup hat einen alten Zustand wiederhergestellt. Ohne Verifikation ist ein Patch nur "angenommen", nicht "wirksam" – und das Ergebnis der Verifikation fließt wieder in das Erkennen ein und schließt damit den Kreis.

**Bildbeschreibung:** Die Grafik zeigt sechs gleich große, abgerundete Kästen in zwei Reihen zu je drei, die durch Pfeile zu einem Kreislauf verbunden sind. Die obere Reihe verläuft von links nach rechts: "Erkennen" (blau), "Bewerten" (blau), "Priorisieren" (orange). Vom rechten oberen Kasten führt ein Pfeil nach unten zu "Testen / Freigeben" (orange). Die untere Reihe verläuft dann von rechts nach links weiter über "Ausrollen" (grün) zu "Verifizieren" (grün). Vom Kasten "Verifizieren" führt ein Pfeil wieder nach oben zu "Erkennen" und schließt den Kreislauf. Die Farbgebung markiert die drei Phasen: Analyse (blau), Entscheidung und Vorbereitung (orange), Umsetzung und Kontrolle (grün).

**Klausurvorbereitung:** Die sechs Prozessschritte in der richtigen Reihenfolge nennen, den Kreislaufcharakter begründen und mindestens drei Gründe angeben können, warum ein ausgerollter Patch trotzdem unwirksam sein kann.
-->

---
<!-- _class: biglist -->
# Priorisierung und SLAs

- Kriterien: CVSS, EPSS/KEV, Kritikalität, Exposition (Internet vs. intern)
- **Service Level Agreements (SLAs) nach Schweregrad**, z. B. kritisch in Tagen, niedrig im regulären Zyklus
- **Emergency Patching** für aktiv ausgenutzte Lücken außerhalb des Wartungsfensters

<!-- _notes:
Kein Unternehmen kann alle Lücken gleichzeitig schließen, also braucht man eine Reihenfolge. Die Kriterien kombinieren genau das, was wir im CVSS-Kapitel gelernt haben: den CVSS-Schweregrad als technische Basis, die Ausnutzungssignale EPSS und KEV als Realitätscheck, dazu wie kritisch das betroffene System fürs Geschäft ist und ob es aus dem Internet erreichbar ist oder nur intern. Exposition ist dabei oft das wirksamste Einzelkriterium: Ein internetexponierter Dienst wird innerhalb von Stunden automatisiert gescannt, ein internes System nicht.

Ein Service Level Agreement, kurz SLA, ist hier eine verbindliche Zielvorgabe mit Frist – also eine Selbstverpflichtung, kritische Lücken zum Beispiel innerhalb von 7 Tagen zu schließen, hohe innerhalb von 30 Tagen, während niedrige Schweregrade im normalen, geplanten Patch-Zyklus mitlaufen dürfen. Der Nutzen eines SLA liegt weniger in der konkreten Zahl als darin, dass die Frist überhaupt definiert, dokumentiert und damit messbar ist: Erst dann kann man feststellen, ob man zu langsam ist. Die Fristen müssen realistisch sein – ein SLA, das strukturell nicht eingehalten werden kann, wird schnell ignoriert.

Für den Ausnahmefall gibt es Emergency Patching: Wird eine Lücke bereits aktiv ausgenutzt – Stichwort CISA KEV aus dem letzten Kapitel –, wartet man nicht auf das nächste geplante Wartungsfenster, sondern patcht sofort, mit allen Risiken, die ein verkürzt getesteter Notfall-Rollout mit sich bringt. Das ist eine bewusste Abwägung: Man akzeptiert ein höheres Risiko von Betriebsstörungen, um ein noch höheres Risiko einer laufenden Kompromittierung zu vermeiden. Wichtig ist, dass dieser Ausnahmeweg vorher definiert ist – inklusive der Frage, wer ihn auslösen darf.

**Klausurvorbereitung:** Vier Priorisierungskriterien nennen, ein SLA im Patchkontext definieren, Regel- und Notfallpfad unterscheiden und begründen können, warum Exposition ein besonders wirksames Kriterium ist.
-->

---

# Priorisierungsmatrix

![w:1200 center](img/schwachstellen-priorisierungsmatrix.svg)

<!-- _notes:
Die Matrix spannt die zwei wichtigsten Achsen aus dem CVSS-Kapitel gegeneinander auf: horizontal der CVSS-Schweregrad, vertikal die tatsächliche Ausnutzung laut EPSS oder KEV. Daraus ergeben sich vier Handlungsfelder – das ist das praktische Ergebnis des gesamten Bewertungskapitels und ein sehr wahrscheinlicher Klausurgegenstand, weil sich daran Transferfragen gut stellen lassen.

Unten links, niedriger Schweregrad und keine bekannte Ausnutzung: regulärer Patch-Zyklus, keine Eile – das ist der mit Abstand größte Teil aller Findings. Unten rechts, hoher Schweregrad, aber (noch) keine bekannte Ausnutzung: nach SLA einplanen, also mit definierter Frist, aber nicht sofort und außer der Reihe. Oben links, niedriger CVSS-Wert, aber bereits aktive Ausnutzung: trotzdem prüfen – genau der Fall, den wir im CVSS-Kapitel als Beispiel hatten; eine formal nur mittelschwere Lücke kann durch aktive Ausnutzung oder durch Kombination mit anderen Lücken (Exploit Chain) plötzlich brisant werden. Oben rechts, hoher Schweregrad und aktive Ausnutzung: sofort patchen, Emergency-Pfad, ohne Warten auf das Wartungsfenster.

Die Kernaussage der Matrix: Eine einzelne Zahl genügt nicht für eine Entscheidung. Erst die Kombination aus "wie schlimm" und "passiert es" ergibt eine sinnvolle Dringlichkeit.

**Bildbeschreibung:** Die Grafik zeigt eine Vier-Felder-Matrix. Die waagerechte Achse ist mit "CVSS-Schweregrad" beschriftet und verläuft von "niedrig" links nach "hoch" rechts; die senkrechte Achse ist mit "Ausnutzung (EPSS / KEV)" beschriftet und steigt nach oben an. Das Feld unten links ist grau und trägt die Beschriftung "Regulärer Patch-Zyklus". Unten rechts steht orange hinterlegt "Nach SLA einplanen". Oben links, ebenfalls orange, steht "Trotz niedrigem CVSS prüfen". Oben rechts ist das Feld rot hinterlegt und trägt in Fettschrift "Sofort patchen (Emergency)". Die Farbintensität nimmt also von unten links (unkritisch) nach oben rechts (höchste Dringlichkeit) zu.

**Klausurvorbereitung:** Die Matrix mit beiden Achsen aus dem Gedächtnis zeichnen, alle vier Felder korrekt beschriften und für ein vorgegebenes Fallbeispiel (CVSS-Wert plus KEV-Status) das passende Feld und die Handlungsempfehlung begründet bestimmen können.
-->

---

# Rollout-Strategien

- **Testringe**: Test → Pilotgruppe → Breite → Kritische Systeme
- Wartungsfenster und Abstimmung mit Fachbereichen
- **Rollback-Plan** vor jedem Rollout
- Automatisierung (Patch-Tools, Configuration Management)

<!-- _notes:
Ist die Priorität geklärt, muss der Patch noch sicher auf die Systeme kommen. Testringe sind das zentrale Prinzip: Man rollt nicht auf einmal überall aus, sondern stufenweise – zuerst eine reine Testumgebung, dann eine kleine Pilotgruppe echter Nutzer, dann die breite Belegschaft und erst zuletzt die kritischsten Systeme, wo ein Fehler am teuersten wäre. Dahinter steckt eine bewusste Abwägung zwischen zwei Risiken: Je langsamer der Rollout, desto länger das Angriffsfenster – je schneller, desto größer der Schaden durch einen fehlerhaften Patch. Testringe begrenzen das zweite Risiko, ohne das erste unvertretbar zu vergrößern.

Wartungsfenster sind mit den Fachbereichen abgestimmte Zeitfenster, in denen ein Neustart oder eine kurze Downtime tolerierbar ist – ein Produktionssystem patcht man nicht einfach mitten im laufenden Betrieb. Deshalb ist Patchmanagement immer auch Kommunikationsarbeit zwischen IT und Fachbereich; der häufigste Grund für verschleppte Patches ist nicht technische Unfähigkeit, sondern ein Fachbereich, der die Downtime nicht freigibt.

Ein Rollback-Plan muss vor jedem Rollout stehen: Für den Fall, dass der Patch selbst Probleme verursacht, muss vorher klar sein, wie man zur vorherigen Version zurückkommt – über Snapshots, Images oder getestete Deinstallationsroutinen – und zwar schnell und ohne Datenverlust. Ein Rollback-Plan, der erst im Fehlerfall erdacht wird, ist keiner. Und weil sich das bei tausenden Systemen nicht mehr manuell abbilden lässt, übernehmen Patch-Tools und Configuration-Management-Systeme die eigentliche Verteilung automatisiert und protokollieren zugleich, welches System welchen Stand hat – was wiederum die Verifikation und die Kennzahlen speist.

**Klausurvorbereitung:** Das Prinzip der Testringe inklusive Reihenfolge erklären, den Zielkonflikt zwischen Rollout-Geschwindigkeit und Stabilität beschreiben und begründen können, warum ein Rollback-Plan vor und nicht nach dem Rollout erstellt wird.
-->

---

<!-- _class: normal -->
# Wenn Patchen nicht geht

<div class="columns">
<div>

### Typische Fälle
- Legacy-Systeme, End of Life
- OT / IoT, Medizingeräte
- Herstellerfreigabe fehlt
- Hohe Verfügbarkeitsanforderung

</div>
<div>

### Kompensierende Maßnahmen
- Netzwerksegmentierung
- Virtual Patching (WAF, IPS)
- Dienst deaktivieren
- Dokumentierte **Risikoakzeptanz**

</div>
</div>

> **Virtual Patching:** WAF/IPS können bestimmte Angriffsversuche abfangen; die Schwachstelle in der Software bleibt bestehen und braucht weiter eine dauerhafte Lösung.

<!-- _notes:
In der Realität lässt sich nicht jede Lücke einfach patchen – diese Folie ist deshalb besonders praxisrelevant und eignet sich gut für Transferfragen. Typische Fälle: Legacy-Systeme, für die der Support ausgelaufen ist (End of Life) und für die es schlicht keinen Patch mehr gibt; OT-Systeme, IoT-Geräte und Medizingeräte, die wir aus dem IoT-Kapitel kennen und die oft nicht ohne Weiteres neu gestartet oder verändert werden dürfen; Fälle, in denen der Hersteller einen Patch noch nicht freigegeben hat – bei zertifizierten Medizin- oder Industriegeräten würde ein eigenmächtiges Update sogar die Zulassung oder die Gewährleistung gefährden; oder Systeme mit so hoher Verfügbarkeitsanforderung, dass selbst ein kurzes Wartungsfenster nicht tragbar ist, etwa in der Produktion oder im OP-Betrieb.

Für diese Fälle gibt es kompensierende Maßnahmen – englisch compensating controls. Merkt euch die Definition: Sie schließen die Lücke nicht, sondern senken die Eintrittswahrscheinlichkeit oder die Auswirkung. Netzwerksegmentierung isoliert das verwundbare System, sodass es nur noch von wenigen definierten Stellen erreichbar ist – das reduziert die Angriffsfläche, ohne die Software anzufassen. Virtual Patching über eine Web Application Firewall (WAF) oder ein Intrusion Prevention System (IPS) blockiert den bekannten Angriffsweg auf dem Transportweg, ist aber umgehbar, sobald Angreifer eine Variante des Angriffs finden – es ist also ein Zeitgewinn, keine Lösung. Das Deaktivieren des betroffenen Dienstes oder Features ist die wirksamste Variante, wenn die Funktion verzichtbar ist.

Bleibt ein Restrisiko, muss es bewusst akzeptiert und dokumentiert werden. Wichtig sind dabei drei Dinge: Die Risikoakzeptanz muss von einer entscheidungsbefugten Person aus dem Fachbereich getragen werden, nicht von der IT allein; sie muss begründet und befristet sein; und sie muss regelmäßig erneut geprüft werden. Damit bleibt die Entscheidung nachvollziehbar und wirkt nicht wie ein "Vergessen" – genau das ist auch auditrelevant.

**Klausurvorbereitung:** Vier Gründe nennen können, warum ein Patch nicht einspielbar ist; vier kompensierende Maßnahmen beschreiben und von einer echten Behebung abgrenzen; erklären können, warum Virtual Patching nur eine Zwischenlösung ist und wer eine Risikoakzeptanz verantworten muss.
-->

---

# Kennzahlen und Rahmenwerke

- **Time-to-Patch**, Patch-Quote, offene kritische Findings, SLA-Einhaltung
- **ISO 27001:2022**: Control A.8.8 (technische Schwachstellen)
- **BSI IT-Grundschutz**: OPS.1.1.3 Patch- und Änderungsmanagement
- **NIS2**: Pflicht zum Schwachstellenmanagement

> **Messfrage:** Neben der Patch-Quote auch prüfen, wie viele kritische Lücken nach Ablauf der vereinbarten Frist noch offen sind.

<!-- _notes:
Damit ein Patch-Prozess nicht nur auf dem Papier existiert, misst man ihn – nach dem Grundsatz, dass nur gesteuert werden kann, was auch gemessen wird. Time-to-Patch ist die Zeit vom Bekanntwerden einer Lücke bis zum eingespielten und verifizierten Patch; genau diese Zeitspanne war bei WannaCry zwei Monate zu lang. Die Patch-Quote zeigt, wie viel Prozent der betroffenen Systeme fristgerecht gepatcht wurden. Achtung bei dieser Kennzahl: Eine Quote von 98 Prozent klingt gut, bedeutet bei 10.000 Systemen aber 200 ungepatchte Rechner – und ein einziger davon genügte bei WannaCry, um das ganze Netz zu infizieren. Deshalb ergänzt man sie um die Zahl offener kritischer Findings, die den absoluten Rückstand sichtbar macht, und um die SLA-Einhaltung, die misst, ob die selbst gesetzten Fristen tatsächlich gehalten werden.

Diese Kennzahlen sind zunehmend nicht mehr freiwillig. Die ISO 27001:2022 verlangt im Control A.8.8 "Management of technical vulnerabilities" explizit den geregelten Umgang mit technischen Schwachstellen – wer nach ISO 27001 zertifiziert ist, muss das im Audit nachweisen. Der deutsche BSI IT-Grundschutz beschreibt dasselbe im Baustein OPS.1.1.3 Patch- und Änderungsmanagement sehr konkret mit einzelnen Anforderungen. Und die europäische NIS2-Richtlinie verpflichtet Unternehmen bestimmter Größen und Sektoren – unter anderem Energie, Verkehr, Gesundheit, digitale Infrastruktur – gesetzlich zu einem funktionierenden Schwachstellenmanagement, mit Haftungsfolgen bis in die Geschäftsleitung hinein.

Die Entwicklung, die ihr euch merken solltet: Aus einer guten Praxis wird zunehmend eine rechtliche Pflicht – und damit verschiebt sich Patchmanagement von einer rein technischen zu einer Compliance- und Leitungsaufgabe.

**Klausurvorbereitung:** Vier Kennzahlen des Patchmanagements nennen und interpretieren, die Schwäche der Patch-Quote erklären und ISO 27001 A.8.8, BSI OPS.1.1.3 und NIS2 jeweils korrekt als Standard, Baustein bzw. Richtlinie zuordnen können.
-->

---

# Fallstudie: Equifax (2017)

- **Was geschah?**
  - Angriff über Apache Struts (CVE-2017-5638), Daten von rund 147 Mio. Personen abgeflossen

- **Warum Versagen der Vertraulichkeit?**
  - Patch war verfügbar, System wurde nicht gepatcht, Inventar und Scans lückenhaft

- **Konsequenzen:**
  - Hohe Vergleichszahlungen, Rücktritte, regulatorische Folgen

<!-- _notes:
Equifax ist das Gegenstück zu WannaCry: gleiches Grundmuster – ein verfügbarer Patch wurde nicht eingespielt –, aber ein anderes Schutzziel ist verletzt. Diese Parallele ist der Grund, warum beide Fälle in dieser Vorlesung stehen; in einer Klausur lassen sie sich hervorragend vergleichen.

Die US-Kreditauskunftei Equifax wurde 2017 über eine Schwachstelle in der Webanwendungs-Bibliothek Apache Struts angegriffen, CVE-2017-5638. Über diese Lücke griffen Angreifer auf die dahinterliegenden Datenbanken zu und erbeuteten sensible Daten von rund 147 Millionen Menschen, unter anderem Sozialversicherungsnummern, Geburtsdaten und Adressen – also genau die Daten, mit denen sich Identitätsdiebstahl betreiben lässt. Besonders bitter: Die Betroffenen waren nicht einmal Kunden, sondern Personen, über die Equifax Daten sammelte.

Der Patch war bereits verfügbar, bevor der Angriff begann – aber das betroffene System stand offenbar nicht vollständig im Inventar, und die eigenen Scans hatten die Lücke nicht zuverlässig erkannt. Das ist genau das Voraussetzungen-Problem von vorhin: Ohne belastbare CMDB und funktionierende, verifizierte Scans weiß man nicht, wo man verwundbar ist – und patcht dann eben nur das, was man kennt. Verstärkt wurde der Schaden dadurch, dass der Einbruch über Wochen unbemerkt blieb. Weil hier nicht die Verfügbarkeit wie bei WannaCry, sondern die Vertraulichkeit der Daten verletzt wurde, ordnen wir den Fall entsprechend ein. Die Folgen gingen weit über die IT hinaus: hohe Vergleichszahlungen, Rücktritte in der Unternehmensführung und regulatorische Konsequenzen.

**Klausurvorbereitung:** Equifax nach dem Schema Was – Warum – Folgen wiedergeben, die Zuordnung zum Schutzziel Vertraulichkeit begründen und den Fall mit WannaCry vergleichen können (gleiche Ursache, unterschiedliches verletztes Schutzziel).
-->

---

# Zusammenfassung

| Thema | Kernaussage |
|---|---|
| Finden | Viele Akteure mit gegensätzlichen Motiven |
| Bug Bounty | Legaler Kanal, braucht Triage- und Patch-Prozess |
| Disclosure | Koordiniert und mit Frist, rechtlich abgesichert |
| CVSS | Schwere ≠ Risiko, mit EPSS/KEV ergänzen |
| Patchmanagement | Inventar, Priorisierung, Verifikation, Ausnahmen steuern |

<!-- _notes:
Vom Finden über die zwei Wege der Meldung – Bug Bounty und Disclosure – bis zur Bewertung mit CVSS und schließlich der eigentlichen Organisation im Patchmanagement: Das ist die durchgehende Kette von der Entdeckung bis zum Rollout, die uns die ganze Vorlesung begleitet hat. Nutzt diese Tabelle als Gerüst für die Klausurvorbereitung und hängt an jede Zeile die zugehörigen Fachbegriffe: Finden – Akteure, Motive, SAST/DAST/Fuzzing/SCA. Bug Bounty – Scope, Triage, Safe Harbor. Disclosure – die vier Modelle, PSIRT, security.txt, 90 Tage. CVSS – vier Metrikgruppen, Vektor lesen, Schweregradstufen, EPSS und KEV. Patchmanagement – CMDB, SBOM, sechsstufiger Kreislauf, SLA, Testringe, kompensierende Maßnahmen, Kennzahlen.

Die beiden Fallstudien, WannaCry und Equifax, zeigen denselben Kernfehler aus zwei Blickwinkeln: Ein verfügbarer Patch nützt nichts, wenn er nicht eingespielt und verifiziert wird – einmal trifft es die Verfügbarkeit, einmal die Vertraulichkeit. Wenn ihr aus dieser Vorlesung einen Satz mitnehmt, dann diesen. Bevor wir Schluss machen, wollen wir die gelernten Konzepte noch an ein paar offenen Fragen ausprobieren.

**Klausurvorbereitung:** Die fünf Kernaussagen der Tabelle frei wiedergeben und zu jeder Zeile mindestens drei zugehörige Fachbegriffe nennen und erklären können.
-->

---

# Diskussionsfragen

- Wann ist eine Veröffentlichung ohne Patch vertretbar?
- Lohnt sich ein eigenes Bug-Bounty-Programm für ein mittelständisches Unternehmen?
- Kritische Lücke im Produktivsystem, Patch aber nicht sofort möglich: Was tun?

<!-- _notes:
Diese drei Fragen haben bewusst keine eindeutig richtige Antwort – sie sollen zur Diskussion anregen und die Konzepte aus der Vorlesung auf konkrete Situationen anwenden. Genau so sind auch Transferfragen in Klausuren gebaut: Bewertet wird nicht die Antwort selbst, sondern die Begründung mit den Fachbegriffen der Vorlesung.

Bei der ersten Frage geht es um den Interessenkonflikt aus dem Disclosure-Kapitel: Argumente für eine Veröffentlichung ohne Patch sind ein nicht reagierender Hersteller, eine bereits aktiv ausgenutzte Lücke oder die Möglichkeit für Betroffene, sich mit kompensierenden Maßnahmen selbst zu schützen; dagegen spricht, dass Angreifer die Information ebenfalls erhalten. Bei der zweiten Frage denkt an die Vorteile und Grenzen von Bug Bounty: Ein Programm bringt nur etwas, wenn der eigene Patch-Prozess reif genug ist, die eingehenden Reports zeitnah zu bearbeiten – ist das bei einem mittelständischen Unternehmen mit begrenzten IT-Ressourcen realistisch, oder wäre ein beauftragter Pentest plus eine schlichte Meldeadresse (security.txt) der bessere erste Schritt?

Die dritte Frage ist genau der Fall aus dem Kapitel "Wenn Patchen nicht geht": Welche kompensierenden Maßnahmen würdet ihr wählen – Segmentierung, Virtual Patching, Abschalten des Dienstes –, in welcher Reihenfolge, und wer müsste die Risikoakzeptanz am Ende unterschreiben? Nehmt diese Fragen gerne mit in die Übung oder die nächste Diskussionsrunde.

**Klausurvorbereitung:** Zu jeder der drei Fragen eine eigene Position formulieren und mit mindestens zwei Fachbegriffen aus der Vorlesung begründen können – das ist das typische Format einer Transferaufgabe.
-->

