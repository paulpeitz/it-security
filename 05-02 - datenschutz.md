---
marp: true
theme: custom
paginate: false
html: true
footer: ![w:280](img/dhbw-ka.svg)
title: Datenschutz und DSGVO
---

<!-- _class: title -->
# Datenschutz und DSGVO

<br><br><br><br><br><br>

## Ein Überblick für die Praxis


<!-- _notes:
Dieser Abschnitt behandelt Ein Überblick für die Praxis. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
<!-- _class: biglist -->
# Agenda

- **Warum Datenschutz?** – Motivation und Grundrecht
- **Grundbegriffe der DSGVO** – Daten, Rollen, Geltungsbereich
- **Die Grundprinzipien** – Sieben Grundsätze der Verarbeitung
- **Rechtsgrundlagen** – Wann darf überhaupt verarbeitet werden?
- **Rechte der betroffenen Personen** – Auskunft, Löschung & Co.
- **Datenschutz in der Softwareentwicklung** – Privacy by Design
- **Wenn's schiefgeht** – Meldepflichten und Bußgelder

<!-- _notes:
Wir starten bei der Motivation, arbeiten uns durch Begriffe und Prinzipien, und enden bei der Frage, was passiert, wenn Datenschutz missachtet wird. Einzelne Artikel der DSGVO werden nur dort erwähnt, wo sie zum Verständnis beitragen – nicht als Selbstzweck.
-->

---
<!-- _class: chapter -->
# Warum Datenschutz?

## Motivation und Grundrecht


<!-- _notes:
Dieser Abschnitt behandelt Motivation und Grundrecht. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Daten sind wertvoll – und verletzlich

- Unternehmen sammeln heute riesige Mengen an **personenbezogenen Daten**: Einkaufsverhalten, Standort, Gesundheitsdaten, Kommunikation

- Diese Daten sind wirtschaftlich wertvoll – Werbung, Profilbildung, KI-Training

- Genau das macht sie auch **missbrauchsanfällig**: Diskriminierung, Überwachung, Identitätsdiebstahl

> **Merksatz:** Daten über Menschen sind kein neutraler Rohstoff – ihr Missbrauch trifft reale Personen.

<!-- _notes:
Einstieg bewusst ohne Paragraphen: Zunächst soll klar werden, warum es Datenschutz überhaupt braucht. Der Bogen "Daten sind wertvoll UND verletzlich" ist die Kernspannung der gesamten Vorlesung.
-->

---
# Datenschutz als Grundrecht

- In der EU ist der Schutz personenbezogener Daten ein **Grundrecht** (Charta der Grundrechte der EU, Art. 8)

- Kerngedanke: **informationelle Selbstbestimmung** – jede Person soll grundsätzlich selbst bestimmen können, wer was über sie weiß und damit macht

- Datenschutz schützt also nicht "Daten" abstrakt, sondern die **Person** dahinter

<!-- _notes:
Wichtig ist die Unterscheidung zu IT-Sicherheit im engeren Sinn: Datenschutz ist kein rein technisches Thema, sondern hat einen grundrechtlichen Kern. Der Begriff "informationelle Selbstbestimmung" stammt ursprünglich aus einem Urteil des deutschen Bundesverfassungsgerichts (Volkszählungsurteil 1983) und ist bis heute die gedankliche Grundlage.
-->

---
# Von nationalen Gesetzen zur DSGVO

- Vor 2018: Datenschutz in der EU war **national unterschiedlich** geregelt – uneinheitliches Schutzniveau, hoher Aufwand für Unternehmen mit EU-weitem Geschäft

- Seit dem 25. Mai 2018: die **Datenschutz-Grundverordnung (DSGVO)** gilt EU-weit einheitlich und unmittelbar

- Ziel: gleiches Schutzniveau für alle EU-Bürger:innen + ein gemeinsamer Rechtsrahmen für Unternehmen

<!-- _notes:
Die Geschichte davor (EU-Datenschutzrichtlinie von 1995) kann in einem Satz erwähnt werden, muss aber nicht vertieft werden – wichtig ist nur der Kontrast "vorher uneinheitlich, seit 2018 einheitlich".
-->

---
# Fallstudie: Cambridge Analytica (2018)

- **Was geschah?**
  - Die Firma **Cambridge Analytica** sammelte über eine Facebook-App Daten von ca. 87 Millionen Nutzer:innen – meist ohne deren Wissen
  - Die Daten wurden genutzt, um politische Werbung gezielt zuzuschneiden (u. a. US-Wahlkampf 2016)

- **Warum ein Datenschutz-Versagen?**
  - Nutzer:innen hatten der App zugestimmt – ihre **Freunde** aber nie
  - Keine transparente, informierte Einwilligung für die tatsächliche Nutzung

- **Konsequenzen:** globale Empörung, Milliarden-Bußgeld durch die US-Handelsbehörde FTC (nicht die DSGVO – der Fall spielte sich vor allem in den USA ab), beschleunigte öffentliche Debatte kurz nach Einführung der DSGVO

> **Einordnung:** Das genannte Bußgeld stammt von einer US-Behörde und ist kein DSGVO-Bußgeld; der Fall illustriert dennoch den Schaden durch intransparente Datennutzung.

<!-- _notes:
Diese Fallstudie eignet sich gut als Einstieg, weil sie zeitlich fast mit dem DSGVO-Start zusammenfällt und vielen noch ein Begriff ist. Das genannte Bußgeld kam von der US-Behörde FTC, nicht von einer DSGVO-Aufsichtsbehörde – der Fall dient hier nur als Motivation, nicht als DSGVO-Bußgeld-Beispiel (die kommen im letzten Kapitel). Der Kernpunkt fürs Verständnis: Es reicht nicht, dass irgendjemand irgendwann zugestimmt hat – die Einwilligung muss zur tatsächlichen Datennutzung passen und die Betroffenen selbst betreffen. Das ist die Brücke zum nächsten Kapitel, in dem wir die Grundbegriffe wie "Einwilligung" und "betroffene Person" sauber definieren.
-->

---
# Zusammenfassung: Warum Datenschutz?

- Personenbezogene Daten sind wertvoll **und** missbrauchsanfällig

- Datenschutz ist ein **Grundrecht**, kein Kann-Thema

- Die DSGVO harmonisiert den Datenschutz EU-weit seit 2018

> **Merksatz:** Datenschutz schützt Menschen – nicht Datenbanken.

<!-- _notes:
Kurze Kapitelzusammenfassung als Brücke zum nächsten, begrifflicheren Kapitel. Der Merksatz fasst die Grundhaltung der gesamten Vorlesung zusammen und darf gerne am Ende noch einmal aufgegriffen werden.
-->

---
<!-- _class: chapter -->
# Grundbegriffe der DSGVO

## Daten, Rollen, Geltungsbereich


<!-- _notes:
Dieser Abschnitt behandelt Daten, Rollen, Geltungsbereich. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Was sind personenbezogene Daten?

- **Personenbezogene Daten**: alle Informationen, die sich auf eine identifizierte oder identifizierbare natürliche Person beziehen

- Klassische Beispiele: Name, Adresse, E-Mail, Geburtsdatum, IP-Adresse

- Auch **indirekt** identifizierbare Daten zählen dazu: Kombination aus Merkmalen, die zusammen auf eine Person schließen lassen

- Besondere Kategorien mit erhöhtem Schutz: Gesundheitsdaten, ethnische Herkunft, religiöse Überzeugung, sexuelle Orientierung

<!-- _notes:
Wichtig ist der Hinweis auf indirekte Identifizierbarkeit: Auch ein scheinbar anonymer Datensatz (z. B. Postleitzahl + Geburtsdatum + Geschlecht) kann in Kombination eine Person eindeutig identifizieren. Die "besonderen Kategorien" nur kurz nennen, ohne die Sonderregeln im Detail zu behandeln – das würde zu tief in juristische Details führen.
-->

---
# Was zählt als Verarbeitung?

- **Verarbeitung**: jeder Umgang mit personenbezogenen Daten – nicht nur Speichern

- Dazu zählen u. a.: Erheben, Erfassen, Speichern, Verändern, Auslesen, Verwenden, Übermitteln, Löschen

- Praktisch bedeutet das: Fast **jede** Software, die mit Nutzerdaten arbeitet, "verarbeitet" im Sinne der DSGVO

<!-- _notes:
Dieser Begriff wird oft unterschätzt, weil man intuitiv nur an "Speichern in einer Datenbank" denkt. Schon das bloße Anzeigen von Nutzerdaten auf einem Dashboard oder das Weiterleiten an einen externen Analytics-Dienst ist eine Verarbeitung. Datenschutz betrifft praktisch jede Anwendung, die mit echten Nutzerdaten arbeitet.
-->

---
<!-- _class: normal -->
# Die Rollen im Datenschutz

<div class="columns">
<div>

### Wer entscheidet?
- **Verantwortlicher**: legt Zweck und Mittel der Verarbeitung fest
- Trägt die Hauptverantwortung
- Beispiel: das Unternehmen, das eine Kunden-App betreibt

</div>
<div>

### Wer führt aus?
- **Auftragsverarbeiter**: verarbeitet Daten im Auftrag, nach Weisung
- Hat keine eigene Zweckhoheit
- Beispiel: ein Cloud-Hosting-Anbieter

</div>
</div>

> **Beispiel:** Ein Online-Shop bestimmt den Zweck der Kundendaten; ein beauftragter Hosting-Dienst verarbeitet sie nach dessen Weisung.

<!-- _notes:
Diese Unterscheidung ist zentral und in der Praxis oft unklar. Ein gutes Beispiel: Ein Online-Shop (Verantwortlicher) nutzt einen externen Newsletter-Dienst (Auftragsverarbeiter) – der Shop entscheidet, wofür die E-Mail-Adressen genutzt werden, der Dienstleister führt nur aus. Zwischen beiden braucht es einen Auftragsverarbeitungsvertrag (AVV), der genau regelt, was der Auftragsverarbeiter darf und muss – Details dazu sind nicht Teil dieser Vorlesung.
-->

---
# Die Rollen im Überblick

- **Betroffene Person**: die Person, um deren Daten es geht
- **Aufsichtsbehörde**: staatliche Stelle, die die Einhaltung der DSGVO kontrolliert (mehr dazu im letzten Kapitel)

![w:600 center](img/datenschutz-rollen.svg)

<!-- _notes:
Dieses Diagramm bringt alle bisher eingeführten Rollen zusammen: Der Verantwortliche entscheidet über Zweck und Mittel und beauftragt ggf. einen Auftragsverarbeiter über einen Auftragsverarbeitungsvertrag (AVV). Beide verarbeiten letztlich Daten der betroffenen Person. Die Aufsichtsbehörde steht außerhalb dieser Beziehung und kontrolliert, ob sich alle Beteiligten an die Regeln halten – dazu kommen wir im letzten Kapitel der Vorlesung noch einmal im Detail.
-->

---
# Geltungsbereich: Für wen gilt die DSGVO?

- **Räumlich**: für alle Unternehmen mit Sitz in der EU

- **Marktortprinzip**: gilt auch für Unternehmen außerhalb der EU, wenn sie EU-Bürger:innen gezielt Waren/Dienste anbieten oder ihr Verhalten beobachten

- Praktische Folge: Auch ein US-Startup ohne EU-Büro muss die DSGVO beachten, sobald es aktiv EU-Kund:innen anspricht

<!-- _notes:
Ein bekanntes Beispiel sind US-Techkonzerne, die trotz Sitz außerhalb der EU DSGVO-Bußgelder erhalten haben – das greift später im Bußgeld-Kapitel nochmal auf.
-->

---
# Zusammenfassung: Grundbegriffe

| Begriff | Kurzdefinition |
|---|---|
| Personenbezogene Daten | Infos, die auf eine Person schließen lassen |
| Verarbeitung | jeder Umgang mit diesen Daten |
| Verantwortlicher | entscheidet über Zweck & Mittel |
| Auftragsverarbeiter | verarbeitet nach Weisung |
| Betroffene Person | die Person, um deren Daten es geht |

<!-- _notes:
Personenbezogene Daten beziehen sich auf eine identifizierte oder identifizierbare Person; Verarbeitung umfasst auch Lesen, Übermitteln und Löschen. Der Verantwortliche legt Zwecke und Mittel fest, der Auftragsverarbeiter verarbeitet nach Weisung, und die betroffene Person ist diejenige, um deren Daten es geht. Diese Rollen bestimmen, wer welche Pflichten erfüllen muss.
-->

---
<!-- _class: chapter -->
# Die Grundprinzipien

## Sieben Grundsätze der Verarbeitung


<!-- _notes:
Dieser Abschnitt behandelt Sieben Grundsätze der Verarbeitung. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Die sieben Grundsätze im Überblick

| Grundsatz | Kurzbeschreibung |
|---|---|
| Rechtmäßigkeit, Treu & Glauben, Transparenz | Verarbeitung braucht eine Grundlage und ist nachvollziehbar |
| Zweckbindung | Daten nur für festgelegte Zwecke nutzen |
| Datenminimierung | nur so viele Daten wie nötig |
| Richtigkeit | Daten müssen korrekt und aktuell sein |
| Speicherbegrenzung | Daten nicht länger als nötig aufbewahren |
| Integrität & Vertraulichkeit | Daten vor Verlust und Missbrauch schützen |
| Rechenschaftspflicht | Verantwortlicher muss Einhaltung nachweisen können |

<!-- _notes:
Betonen, dass diese sieben Grundsätze wie eine Checkliste funktionieren: Jede Verarbeitung personenbezogener Daten sollte sich an ihnen messen lassen. Die genaue Artikel-Nummer ist für diese Vorlesung nicht entscheidend, das Konzept dahinter schon.
-->

---
# Rechtmäßigkeit, Treu & Glauben und Transparenz

- **Rechtmäßigkeit**: Verarbeitung braucht immer eine gültige Rechtsgrundlage (dazu gleich mehr im nächsten Kapitel)

- **Treu und Glauben**: Verarbeitung darf betroffene Personen nicht täuschen oder überrumpeln – sie muss so ablaufen, wie diese es vernünftigerweise erwarten würden

- **Transparenz**: verständliche, leicht zugängliche Information darüber, was mit den Daten passiert – keine versteckten Klauseln in seitenlangen AGB

> **Prüffrage für eine App:** Wofür brauche ich die Daten, welche Rechtsgrundlage gilt, und welche Angaben sind dafür wirklich erforderlich?

<!-- _notes:
"Treu und Glauben" lässt sich gut mit einem Gegenbeispiel greifbar machen: eine Wetter-App, die im Hintergrund permanent den Standort an Werbenetzwerke verkauft, ohne dass Nutzer:innen das erwarten würden – das wäre ein Verstoß gegen Treu und Glauben, auch wenn irgendwo in den AGB ein Hinweis versteckt ist. Transparenz ist die Brücke zu klar verständlichen Datenschutzerklärungen statt juristischem Fließtext.
-->

---
# Zweckbindung und Datenminimierung

- **Zweckbindung**: Daten dürfen nur für den Zweck verwendet werden, für den sie erhoben wurden

  - Beispiel: E-Mail-Adresse für Bestellbestätigung ≠ automatisch Erlaubnis für Werbe-Newsletter

- **Datenminimierung**: nur die Daten erheben, die für den Zweck tatsächlich nötig sind

  - Beispiel: Für eine Newsletter-Anmeldung reicht die E-Mail-Adresse – Geburtsdatum und Adresse sind meist nicht erforderlich

<!-- _notes:
Zweckbindung fragt, wofür Daten erhoben und genutzt werden dürfen. Datenminimierung fragt, welche Angaben für diesen Zweck tatsächlich benötigt werden. Ein Newsletter-Formular benötigt typischerweise eine E-Mail-Adresse; zusätzliche Pflichtfelder müssen für den konkreten Zweck begründet werden.
-->

---
# Speicherbegrenzung und Richtigkeit

- **Speicherbegrenzung**: Daten nicht unbegrenzt aufheben – nur solange, wie es der Zweck erfordert

  - Praxisfolge: Lösch- und Aufbewahrungsfristen im Datenmodell mitdenken, nicht "auf Vorrat" speichern

- **Richtigkeit**: Daten müssen sachlich richtig und, wo nötig, auf dem neuesten Stand sein

  - Praxisfolge: Nutzer:innen brauchen eine Möglichkeit, eigene Daten zu korrigieren

<!-- _notes:
Speicherbegrenzung wird in der Praxis oft vernachlässigt, weil Speicherplatz billig ist und "man die Daten ja vielleicht später noch braucht" – genau das widerspricht dem Grundsatz. Als Beispiel eignen sich Log-Daten, die oft jahrelang unangetastet liegen bleiben, obwohl sie nach einigen Wochen oder Monaten keinen Zweck mehr erfüllen. Richtigkeit hängt eng mit dem später besprochenen Berichtigungsrecht der Betroffenen zusammen.
-->

---
# Integrität, Vertraulichkeit und Rechenschaftspflicht

- **Integrität und Vertraulichkeit**: Daten müssen durch geeignete technische Maßnahmen vor unbefugtem Zugriff, Verlust und Zerstörung geschützt werden

  - Hier trifft Datenschutz direkt auf klassische **IT-Sicherheit** (Verschlüsselung, Zugriffskontrolle, Backups)

- **Rechenschaftspflicht (Accountability)**: der Verantwortliche muss die Einhaltung aller Grundsätze **nachweisen** können – nicht nur einhalten

  - Praxisfolge: Dokumentation, Verfahrensverzeichnisse, Nachweise über getroffene Maßnahmen

<!-- _notes:
Dieser Grundsatz ist die direkte Schnittstelle zur bisherigen IT-Security-Vorlesung – bewusst den Bogen zur CIA-Triade (Confidentiality, Integrity, Availability) aus der ersten Vorlesungseinheit schlagen, falls die Gruppe diese schon behandelt hat. Rechenschaftspflicht ist ein oft unterschätzter Punkt: Es reicht der DSGVO nicht, dass man sich tatsächlich an die Regeln hält – man muss es im Zweifel auch beweisen können, z. B. gegenüber einer Aufsichtsbehörde.
-->

---
# Zusammenfassung: Grundprinzipien

> **Merksatz:** Nur das nötigste, für den erklärten Zweck, so kurz wie möglich, gut geschützt – und das alles nachweisbar.

- Die sieben Grundsätze sind die "Spielregeln" jeder Datenverarbeitung

- Sie gelten unabhängig davon, welche Rechtsgrundlage im Einzelfall greift

<!-- _notes:
Der Merksatz fasst alle sieben Grundsätze in einem Satz zusammen – als Gedächtnisstütze für die Klausur oder spätere Praxis geeignet. Das regeln die Rechtsgrundlagen, die jetzt folgen.
-->

---
<!-- _class: chapter -->
# Rechtsgrundlagen

## Wann darf überhaupt verarbeitet werden?


<!-- _notes:
Dieser Abschnitt behandelt Wann darf überhaupt verarbeitet werden?. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Ohne Rechtsgrundlage keine Verarbeitung

- Die DSGVO folgt einem **Verbotsprinzip mit Erlaubnisvorbehalt**: Verarbeitung ist grundsätzlich verboten, außer es liegt eine Rechtsgrundlage vor

- Es genügt **eine** von mehreren möglichen Rechtsgrundlagen – nicht alle gleichzeitig

- Die bekannteste, aber nicht einzige Rechtsgrundlage: die **Einwilligung**

<!-- _notes:
Dieses Prinzip ("verboten, außer erlaubt") ist ein zentraler Unterschied zu manch anderer Rechtsordnung und lohnt sich als expliziter Merksatz. Viele denken bei Datenschutz ausschließlich an Einwilligungen ("Cookie-Banner"), dabei ist die Einwilligung nur eine von mehreren gleichwertigen Rechtsgrundlagen.
-->

---
# Die Einwilligung

- Eine gültige **Einwilligung** muss sein:
  - **Freiwillig** – ohne Zwang oder Nachteil bei Ablehnung
  - **Informiert** – Person weiß, wofür sie zustimmt
  - **Spezifisch** – bezieht sich auf einen konkreten Zweck
  - **Eindeutig** – aktive Handlung, kein vorausgefülltes Häkchen

- Muss jederzeit **widerrufbar** sein – genauso einfach wie die Erteilung

<!-- _notes:
Das berühmte Beispiel für ungültige Einwilligung: vorausgefüllte Checkboxen oder "Zustimmen"-Buttons, die deutlich prominenter sind als "Ablehnen". Genau das war jahrelang gängige Praxis bei Cookie-Bannern und wurde später von Aufsichtsbehörden beanstandet. Der Cambridge-Analytica-Fall aus dem ersten Kapitel lässt sich hier nochmal aufgreifen: Die Einwilligung der App-Nutzer:innen deckte die Weitergabe von Freundesdaten nicht ab – sie war nicht spezifisch genug.
-->

---
<!-- _class: normal -->
# Weitere Rechtsgrundlagen

<div class="columns">
<div>

### Vertragserfüllung
- Verarbeitung nötig, um einen Vertrag zu erfüllen
- Beispiel: Lieferadresse für einen Online-Kauf

### Rechtliche Pflicht
- Gesetz verlangt die Verarbeitung
- Beispiel: Aufbewahrungspflichten im Steuerrecht

</div>
<div>

### Berechtigtes Interesse
- Abwägung: Interesse des Verantwortlichen vs. Interesse der betroffenen Person
- Beispiel: Betrugsprävention, IT-Sicherheitsmaßnahmen

</div>
</div>

> **Ein Fall, zwei Zwecke:** Die Lieferadresse ist für die Bestellung nötig; Werbung an dieselbe Adresse ist ein eigener Zweck und braucht eine passende Grundlage.

<!-- _notes:
Diese drei Rechtsgrundlagen bewusst nur an je einem griffigen Beispiel festmachen, ohne die exakten Abwägungskriterien beim "berechtigten Interesse" juristisch zu vertiefen – das würde den Rahmen dieser Überblicksvorlesung sprengen. Wichtig fürs Verständnis: Nicht jede Datenverarbeitung braucht eine Einwilligung, wenn eine dieser anderen Grundlagen greift. Genau deshalb sind z. B. Sicherheitslogs oft ohne explizite Einwilligung zulässig, gestützt auf berechtigtes Interesse.
-->

---
# Zusammenfassung: Rechtsgrundlagen

> **Merksatz:** Keine Verarbeitung ohne Rechtsgrundlage – aber Einwilligung ist nur eine von mehreren.

- Einwilligung: freiwillig, informiert, spezifisch, eindeutig, widerrufbar

- Alternativen: Vertragserfüllung, rechtliche Pflicht, berechtigtes Interesse

<!-- _notes:
Kurze Kapitelzusammenfassung, bevor wir die Perspektive wechseln: Bisher ging es darum, was der Verantwortliche beachten muss.
-->

---
<!-- _class: chapter -->
# Rechte der betroffenen Personen

## Auskunft, Löschung & Co.


<!-- _notes:
Dieser Abschnitt behandelt Auskunft, Löschung & Co. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Betroffenenrechte im Überblick

| Recht | Kurzbeschreibung |
|---|---|
| Auskunft | Welche Daten werden über mich verarbeitet? |
| Berichtigung | Falsche Daten korrigieren lassen |
| Löschung | "Recht auf Vergessenwerden" |
| Einschränkung | Verarbeitung vorübergehend "einfrieren" statt löschen, z. B. während ein Streit über die Richtigkeit der Daten geklärt wird |
| Datenübertragbarkeit | eigene Daten in verwendbarem Format erhalten |
| Widerspruch | bestimmter Verarbeitung widersprechen |

> **Unterschied:** Einschränkung stoppt bestimmte Verarbeitungen vorübergehend; Löschung entfernt Daten, soweit keine entgegenstehenden Pflichten bestehen.

<!-- _notes:
Diese sechs Rechte zunächst als Überblickstabelle zeigen, danach die drei praxisrelevantesten (Auskunft, Löschung, Datenübertragbarkeit) etwas vertiefen. Jedes dieser Rechte hat eine konkrete technische Konsequenz für Software, die personenbezogene Daten verwaltet – das greifen wir gleich auf.
-->

---
# Auskunftsrecht und Recht auf Löschung

- **Auskunftsrecht**: jede Person kann jederzeit erfragen, welche Daten ein Unternehmen über sie gespeichert hat und wofür

- **Recht auf Löschung** ("Recht auf Vergessenwerden"): Daten müssen gelöscht werden, wenn z. B. der Zweck entfallen ist oder die Einwilligung widerrufen wurde

- Beide Rechte sind **nicht unbegrenzt**: gesetzliche Aufbewahrungspflichten können einer Löschung entgegenstehen

> **Bei Backups:** Löschkonzepte müssen auch Sicherungen und spätere Wiederherstellungen berücksichtigen; gesetzliche Aufbewahrungspflichten können Grenzen setzen.

<!-- _notes:
Wichtig ist die Einschränkung am Ende: Löschung ist kein absolutes Recht, es kollidiert manchmal mit anderen Pflichten (z. B. Rechnungen müssen aus steuerlichen Gründen oft Jahre aufbewahrt werden). Das verhindert das Missverständnis "ich kann immer sofort alles löschen lassen". Löschrechte und gesetzliche Aufbewahrungspflichten müssen gemeinsam betrachtet werden; eine bloße Deaktivierung ersetzt keine Löschprüfung.
-->

---
# Praxisbezug: Was bedeutet das für Entwickler:innen?

- Auskunftsrecht → Software braucht eine Funktion, um gespeicherte Nutzerdaten **exportierbar** zusammenzustellen

- Löschrecht → Datenmodell muss ein echtes **Löschen** (nicht nur "inaktiv setzen") ermöglichen, inklusive Backups und verbundener Systeme

- Datenübertragbarkeit → Export in einem **gängigen, maschinenlesbaren Format** (z. B. JSON, CSV)

- Widerspruch → Nutzer:innen brauchen eine einfache Möglichkeit, z. B. Profiling-basierte Werbung abzulehnen

<!-- _notes:
Betroffenenrechte werden zu Anforderungen an Software: Auskunft erfordert eine nachvollziehbare Zusammenstellung der Daten, Berichtigung eine Korrekturmöglichkeit und Löschung ein geeignetes Löschkonzept. Daten können in Backups, Zwischenspeichern und angebundenen Systemen liegen; ein Löschantrag muss deshalb über die einzelne Datenbanktabelle hinaus betrachtet werden.
-->

---
# Zusammenfassung: Betroffenenrechte

> **Merksatz:** Betroffenenrechte sind kein Kundenservice-Bonus, sondern gesetzlich verankerte Ansprüche.

- Auskunft, Berichtigung, Löschung, Einschränkung, Übertragbarkeit, Widerspruch

- Jedes Recht hat eine direkte technische Konsequenz für Softwaresysteme

<!-- _notes:
Kurze Zusammenfassung, danach der Wechsel zur zentralen Frage der zweiten Vorlesungshälfte: Wie setzt man das alles technisch in der Softwareentwicklung um? Das ist inhaltlich das Kapitel mit dem stärksten Bezug zur bisherigen IT-Security-Vorlesung.
-->

---
<!-- _class: chapter -->
# Datenschutz in der Softwareentwicklung

## Privacy by Design


<!-- _notes:
Dieser Abschnitt behandelt Privacy by Design. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Privacy by Design und by Default

- **Privacy by Design**: Datenschutz von Anfang an in Architektur und Prozesse einplanen – nicht nachträglich ergänzen

- **Privacy by Default**: datenschutzfreundliche Voreinstellungen – z. B. Profil standardmäßig privat statt öffentlich

- Beide Prinzipien greifen dieselbe Idee auf wie **Shift Left** in der Security-Entwicklung: je früher, desto günstiger und wirksamer

> **Durchgehendes Beispiel:** Bei einer App beginnen datensparsame Voreinstellungen im Design; Schutzmaßnahmen sichern den Betrieb; eine DSFA prüft besondere Risiken vor dem Start.

<!-- _notes:
Privacy by Design berücksichtigt Datenschutz bereits beim Entwurf eines Systems. Privacy by Default verlangt datenschutzfreundliche Voreinstellungen, etwa ein standardmäßig privates Profil oder deaktivierte Standortfreigabe. Die Analogie zu Shift Left lautet: Frühe Schutzentscheidungen lassen sich leichter in Architektur und Prozesse einbauen als nachträgliche Korrekturen.
-->

---
<!-- _class: normal -->
# Pseudonymisierung vs. Anonymisierung

<div class="columns">
<div>

### Pseudonymisierung
- Direkte Identifikatoren durch ein Pseudonym ersetzt
- Re-Identifizierung mit **Zusatzwissen** weiterhin möglich
- Gilt weiterhin als personenbezogenes Datum

</div>
<div>

### Anonymisierung
- Personenbezug **unwiderruflich** entfernt
- Keine Re-Identifizierung mehr möglich
- Fällt **nicht** mehr unter die DSGVO

</div>
</div>

<!-- _notes:
Dieser Unterschied wird in der Praxis häufig verwechselt und ist prüfungsrelevant: Pseudonymisierte Daten (z. B. Kundennummer statt Name, mit einer separat gespeicherten Zuordnungstabelle) bleiben personenbezogen, weil die Re-Identifizierung mit dem richtigen Schlüssel möglich ist. Echte Anonymisierung ist technisch deutlich anspruchsvoller, als sie klingt – schon wenige zusätzliche Merkmale können eine vermeintlich anonyme Person wieder eindeutig machen. Das ist eine gute
-->

---
# Technische und organisatorische Maßnahmen (TOMs)

- **Technische und organisatorische Maßnahmen (TOMs)**: konkrete Schutzmaßnahmen, die ein angemessenes Schutzniveau sicherstellen

- Technisch: Verschlüsselung, Zugriffskontrollen, Pseudonymisierung, Backups, Protokollierung

- Organisatorisch: Schulungen, Berechtigungskonzepte, Vier-Augen-Prinzip, klare Verantwortlichkeiten

- Hier trifft die DSGVO direkt auf bekannte **IT-Security-Grundlagen** aus den vorherigen Kapiteln dieser Vorlesung

<!-- _notes:
Verschlüsselung, Zugriffskontrolle und Protokollierung wurden bereits im Kryptographie- bzw. IAM-Kapitel behandelt – hier zeigt sich, dass diese Maßnahmen nicht nur "guter Stil", sondern eine gesetzliche Erwartung sind. TOMs müssen dem Risiko angemessen sein: Eine Gesundheits-App braucht höhere Schutzmaßnahmen als ein einfaches Newsletter-Tool mit E-Mail-Adressen.
-->

---
# Datenschutz-Folgenabschätzung (DSFA)

- **Datenschutz-Folgenabschätzung (DSFA)**: strukturierte Risikoanalyse vor Beginn einer Verarbeitung mit **hohem Risiko** für betroffene Personen

- Typische Auslöser: große Mengen sensibler Daten, systematische Überwachung, automatisierte Entscheidungen mit rechtlicher Wirkung (z. B. Scoring)

- Ähnliches Prinzip wie **Threat Modeling** in der Security – nur mit Fokus auf Risiken für die betroffene Person statt für das System

<!-- _notes:
Der Vergleich zu Threat Modeling (aus dem SSDLC-Kapitel) ist wieder eine gute fachübergreifende Brücke: Beide Verfahren fragen "was kann hier schiefgehen, bevor wir anfangen" – nur aus unterschiedlicher Perspektive. Nicht jede Verarbeitung braucht eine DSFA, nur risikoreiche. Genaue Kriterien sind Detailwissen und für diese Überblicksvorlesung nicht nötig.
-->

---
# Zusammenfassung: Datenschutz in der Softwareentwicklung

> **Merksatz:** Privacy by Design ist für Datenschutz das, was Shift Left für Security ist.

- Datenschutz früh mitdenken statt nachträglich patchen

- Pseudonymisierung, Anonymisierung, TOMs und DSFA als konkrete Werkzeuge

<!-- _notes:
Kapitelzusammenfassung, danach der Wechsel zum letzten inhaltlichen Kapitel: Was passiert eigentlich, wenn trotz all dieser Maßnahmen etwas schiefgeht – ein Datenschutzverstoß passiert oder Daten verloren gehen?
-->

---
<!-- _class: chapter -->
# Wenn's schiefgeht

## Meldepflichten und Bußgelder


<!-- _notes:
Dieser Abschnitt behandelt Meldepflichten und Bußgelder. Die folgenden Beispiele zeigen, wie sich das Thema auf konkrete Sicherheitsentscheidungen anwenden lässt. Zur Vorbereitung ist wichtig, die verwendeten Begriffe an einem eigenen Beispiel erklären zu können.
-->
---
# Die 72-Stunden-Meldepflicht

- Bei einer **Datenschutzverletzung** (z. B. Datenleck, gehackte Datenbank) muss die Aufsichtsbehörde spätestens **72 Stunden** nach Bekanntwerden informiert werden

- Die Frist beginnt nicht mit dem Vorfall selbst, sondern mit dem Zeitpunkt der **Entdeckung**

- Bei hohem Risiko für die betroffenen Personen müssen zusätzlich **diese** unverzüglich informiert werden

![w:780 center](img/datenschutz-meldefrist.svg)

> **Im Unternehmen:** Verdacht intern sofort an die zuständigen Datenschutz- und Sicherheitsteams melden, damit sie Sachverhalt, Risiko und Meldepflicht prüfen.

<!-- _notes:
Bei einer Datenschutzverletzung muss der Verantwortliche die zuständige Aufsichtsbehörde grundsätzlich innerhalb von 72 Stunden nach Bekanntwerden informieren. Bei hohem Risiko für die betroffenen Personen müssen zusätzlich auch diese unverzüglich informiert werden, z. B. bei gestohlenen Passwörtern oder Gesundheitsdaten. Die Frist beginnt nicht mit dem eigentlichen Vorfall, sondern mit dem Zeitpunkt, an dem er entdeckt bzw. bekannt wird – das unterstreicht, wie wichtig gute Monitoring- und Logging-Praktiken sind, die schon in früheren Kapiteln behandelt wurden.
-->

---
# Wer kontrolliert die Einhaltung?

- In Deutschland: **Aufsichtsbehörden** der Länder sowie der Bundesbeauftragte für den Datenschutz auf Bundesebene

- Aufgaben: Beschwerden von Betroffenen prüfen, Unternehmen kontrollieren, Bußgelder verhängen

- Viele Unternehmen bestellen zusätzlich einen internen **Datenschutzbeauftragten (DSB)** als erste Anlaufstelle

<!-- _notes:
Wichtiger Punkt: Ein interner Datenschutzbeauftragter ersetzt nicht die externe Aufsichtsbehörde, sondern ist eine zusätzliche, unternehmensinterne Instanz.
-->

---
# Bußgelder: Wie hoch kann es werden?

- Die DSGVO erlaubt Bußgelder von bis zu **20 Millionen Euro** oder **4 % des weltweiten Jahresumsatzes** – je nachdem, welcher Betrag höher ist

- Das trifft insbesondere große Konzerne deutlich härter als kleine Unternehmen

- Zusätzlich drohen: Reputationsschaden, Vertrauensverlust bei Kund:innen, zivilrechtliche Schadensersatzforderungen Betroffener

<!-- _notes:
Die Formel "20 Mio. € oder 4 % Jahresumsatz, je nachdem was höher ist" ist bewusst so konstruiert, dass auch finanzstarke Konzerne eine spürbare Strafe bekommen – ein fixer Betrag allein wäre für manche Unternehmen kaum relevant gewesen. Diese Zahl darf ruhig auswendig sitzen bleiben, sie wird in der Praxis häufig zitiert.
-->

---
# Fallstudie: Meta / Facebook (2023)

- **Was geschah?**
  - Rekord-Bußgeld von **1,2 Milliarden Euro** gegen Meta durch die irische Datenschutzbehörde
  - Grund: Übertragung von Nutzerdaten europäischer Facebook-Nutzer:innen in die USA ohne ausreichende Schutzgarantien

- **Warum ein Datenschutz-Versagen?**
  - Fehlende geeignete Rechtsgrundlage für die internationale Datenübermittlung

- **Konsequenzen:** höchstes bisheriges DSGVO-Bußgeld, öffentlicher Druck zur Anpassung der Datenübermittlungspraxis

<!-- _notes:
Dieser Fall zeigt, dass Bußgelder in der Praxis tatsächlich in Milliardenhöhe verhängt werden können und nicht nur theoretisch im Gesetzestext stehen. Bewusst nicht tiefer in die Datentransfer-Mechanismen (z. B. Standardvertragsklauseln) einsteigen, das würde den Überblickscharakter sprengen.
-->

---
# Weitere Bußgelder im Überblick

| Unternehmen | Jahr | Bußgeld (ca.) | Grund |
|---|---|---|---|
| Meta / Facebook | 2023 | 1,2 Mrd. € | Datenübermittlung in die USA |
| Amazon | 2021 | 746 Mio. € | Unzureichende Rechtsgrundlage für Werbung |
| WhatsApp | 2021 | 225 Mio. € | Mangelnde Transparenz |
| H&M | 2020 | 35,3 Mio. € | Unrechtmäßige Mitarbeiterüberwachung |

<!-- _notes:
Diese Tabelle zeigt, dass DSGVO-Verstöße aus ganz unterschiedlichen Bereichen kommen können: Datentransfer, Werbe-Tracking, Transparenzpflichten, aber auch interne Mitarbeiterüberwachung (H&M hatte unter anderem private Lebensumstände von Mitarbeitenden dokumentiert). Der H&M-Fall eignet sich gut, um zu zeigen, dass Datenschutz nicht nur Kund:innen betrifft, sondern genauso die eigene Belegschaft.
-->

---
# Zusammenfassung: Wenn's schiefgeht

> **Merksatz:** 72 Stunden Meldefrist, bis zu 4 % Jahresumsatz Bußgeld – Datenschutzverstöße sind kein Kavaliersdelikt.

- Meldepflicht bei Datenschutzverletzungen (72h)

- Aufsichtsbehörden kontrollieren, Bußgelder können empfindlich hoch ausfallen

<!-- _notes:
Kapitelabschluss vor der Gesamtzusammenfassung der Vorlesung. Der Merksatz verbindet die beiden wichtigsten Zahlen des Kapitels (72 Stunden, 4 %) und eignet sich gut als Merkanker für die Klausur.
-->

---
# Gesamtzusammenfassung

| Kapitel | Kernaussage |
|---|---|
| Warum Datenschutz? | Grundrecht, schützt Menschen statt Daten |
| Grundbegriffe | Personenbezogene Daten, Rollen, Marktortprinzip |
| Grundprinzipien | Zweckbindung, Minimierung, Rechenschaftspflicht u. a. |
| Rechtsgrundlagen | Kein "Verboten, außer erlaubt" ohne Grundlage |
| Betroffenenrechte | Auskunft, Löschung, Übertragbarkeit, Widerspruch |
| Softwareentwicklung | Privacy by Design/Default, TOMs, DSFA |
| Wenn's schiefgeht | 72h-Meldepflicht, Bußgelder bis 4 % Jahresumsatz |

<!-- _notes:
Diese Tabelle als roten Faden der gesamten Vorlesung noch einmal durchgehen – gut geeignet, um am Ende gezielt Rückfragen aus einzelnen Kapiteln aufzugreifen. Betonen, dass Datenschutz kein reines Rechtsthema ist, sondern direkte Konsequenzen für Softwarearchitektur, Datenmodelle und tägliche Entwicklungsarbeit hat.
-->

---
# Diskussionsfragen

- Welche personenbezogenen Daten verarbeitet eine App, die ihr täglich nutzt – und sind das aus eurer Sicht wirklich alle nötig?

- Wo würdet ihr in einem euch bekannten System Privacy by Default vermissen?

- Wie würdet ihr technisch sicherstellen, dass ein Löschantrag auch wirklich **alle** Kopien eines Datensatzes erreicht (inkl. Backups)?

<!-- _notes:
Diese Fragen eignen sich für eine kurze offene Diskussionsrunde zum Abschluss, keine Pflicht zur vollständigen Beantwortung. Besonders die dritte Frage regt zum Nachdenken über die reale technische Komplexität von Löschansprüchen an, die im Gesetzestext einfach klingt, in verteilten Systemen aber durchaus anspruchsvoll ist.
-->
