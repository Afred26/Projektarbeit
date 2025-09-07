#import "@preview/supercharged-dhbw:3.4.1": *
#import "../Zusatz/acronyms.typ": acronyms

= Health and Safety in der Inbertriebnahme

== Gefahren

=== Allgemeine elektrische Gefahren auf Baustellen
Elektrische Gefahren gehören zu den gravierendsten Risiken auf Baustellen. Offene Stromquellen, beschädigte Kabel oder unsachgemäß benutzung von Anlagen können zu Stromunfällen führen. Besonders kritisch sind Situationen, in denen Stromleitungen nicht ausreichend gekennzeichnet oder gegen unbeabsichtigten Kontakt gesichert sind. Wobei die Gößte Gefaht von den Sekunärunfällen ausgeht. Diese sind die Unfälle die Aufgrund eines Stromunfalls geschehen, wie das herunterfallen von einer Leiter nach einem Stromschlag.

=== Verstärkte Risiken durch Umgebungsbedingungen
Feuchtigkeit, metallische Werkzeuge, fehlende Konzentration und beengte Arbeitsbereiche erhöhen die Gefahr elektrischer Unfälle erheblich. In solchen Umgebungen kann bereits eine geringe Spannung ausreichen, um schwere Verletzungen zu verursachen. Auch temporäre Stromversorgungen, wie Baustellenverteiler, stellen ein erhöhtes Risiko dar, wenn sie nicht regelmäßig geprüft und gewartet werden.

=== Folgen und typische Unfallarten
Zu den häufigsten Unfallarten zählen Stromschläge, Lichtbogenverletzungen und Brände durch Kurzschlüsse. Diese können nicht nur Personen gefährden, sondern auch erhebliche Sachschäden verursachen. Die Folgen reichen von leichten Verbrennungen bis hin zu tödlichen Verletzungen, weshalb elektrische Gefahren auf Baustellen niemals unterschätzt werden dürfen.

== Die 5 Sicherheitsregeln
Um das Risiko von Stromunfällen zu minimieren, hat der #acr("VDE") die 5 Sicherheitsregeln eingeführt.
Diese Regeln dienen dem Schutz vor elektrischen Gefährdungen und müssen nach #acr("DIN") #acr("VDE") 0105 Teil 100 #cite(<noauthor_din_2015>) in der angegebenen Reihenfolge durchgeführt werden:

=== Freischalten <freischalten>
Das Freischalten ist der erste und wichtigste Schritt, um eine elektrische Anlage spannungsfrei zu machen. Dabei wird die Anlage oder der Anlagenteil, an dem gearbeitet werden soll, vollständig von allen Stromquellen getrennt. Dies wird realisiert, in dem man alle aktiven Leiter (Außen- & Neutralleiter) an einer frühstmöglichen Trennstelle abschaltet. Zum Beispiel durch das Öffnen von Leistungsschaltern, das Ziehen von Sicherungen oder das Trennen von Steckverbindungen. Die Trennstellen müssen sichtbar oder eindeutig identifizierbar sein und eine ausreichende Isolationsstrecke aufweisen, um Lichtbögen zu verhindern. Auch Hilfsenergiequellen (z. B. Steuerstromkreise, Notstromaggregate, #acrs("PV")-Anlagen) müssen ebenfalls abgeschaltet werden.

=== Gegen Wiedereinschalten sichern
Nach dem Freischalten muss sichergestellt werden, dass die Anlage nicht unbeabsichtigt wieder eingeschaltet werden kann. Das wird sichergestellt durch:
- Sperren von Schaltgeräten (z. B. mit Vorhängeschlössern oder Sperrvorrichtungen).
- Anbringen von Warnschildern wie „Nicht schalten – Es wird gearbeitet!“.
- Entfernen von Sicherungseinsätzen oder das Einsetzen von Blindeinsätzen, die nur mit Spezialwerkzeug entfernt werden können.
- Hilfsenergiequellen deaktivieren, z. B. Steuerstromkreise spannungsfrei schalten.

#grid(
  columns: (190pt,1fr,190pt),
  rows: auto,
  figure(caption: "Blindeinsatz für NH-Sicherungen", image(height: 130pt ,"../Bilder/HSE/Blindeinsatz_NH-Sicherung.png")),
  align: right,
  text(""),
  figure(caption: "Sticker: Nicht Schalten Es wird gearbeitet", image(height: 130pt, "../Bilder/HSE/Nicht_Schalten_Kleber.png"))
)<Maßnahmen_gegen_Einschalten>

=== Spannungsfreiheit feststellen
Bevor mit der Arbeit begonnen wird, muss überprüft werden, ob die Anlage tatsächlich spannungsfrei ist. Dies muss mit einerm Zweipoligen-Spannungsprüfer nach #acr("DIN") EN 61243-3 (#acr("VDE") 0682-401) geschehen. Die Spannungsfreiheit muss an allen aktiven Leitern (Außen- & Neutralleiter) und so nah wie möglich an der Arbeitsstelle festgestellt werden. Der Spannungsprüfer muss vor und nach der Prüfung auf Funktion getestet werden. Zudem darf die Spannungsfreiheit nur von einer Elektrofachkraft oder einer elektrotechnisch unterwiesenen Person festgestellt werden.

=== Erden und kurzschließen
Nachdem die Spannungsfreiheit festgestellt wurde, wird die freigeschalteten Anlagenteile geerdet und kurzgeschlossen. Das Erden und kurzschließen muss nur bei Anlagen über 1#acrs("k")#acrs("V") gemacht werden oder bei Niederspannungsanlagen bei denen das Risiko besteht, dass die Anlage durch Rückeinspeisung unter Spannung gesetzt wird. Diese Maßnahme schützt vor gefährlichen Spannungen, die durch unbeabsichtigtes Wiedereinschalten oder durch Rückwirkungen (z. B. kapazitive Aufladungen, Induktion) entstehen können.
Das bedeute, es wird eine leitende Verbindung zwischen den aktiven Leitern der Anlage und dem Erdpotential hergestellt. Gleichzeitig wird ein Kurzschluss zwischen den aktiven Leitern erzeugt, um sicherzustellen, dass bei einer versehentlichen Einspeisung sofort ein Schutzmechanismus (z. B. Sicherung) auslöst. Um ein sicheres Anbringen der Erdungs- & Kurzschließvorrichtung zu gewährleisten, wird es zuerst an der Erde angebracht und dann mit den aktiven Leitern. Zudem muss es möglicht nach oder in Sicht des Arbeitsplatzes angebracht werden.

=== Unter Spannung stehende Teile abschranken
Wenn sich in der Nähe der Arbeitsstelle noch unter Spannung stehende Teile befinden, die nicht freigeschaltet werden können, da nicht die gesammte Anlage abgeschalten werden konnte, müssen diese sicher abgeschirmt werden.

Mögliche Maßnahmen sind, Isolierende Abdeckungen oder Mechanische Abschrankungen, die mechanisch stabil und elektrisch isolierend sind.


// die 5 Sicherheitsregeln von Hitachi
== Die weiteren 5 Sicherheitsregeln von Hitachi
Da Sicherheit ein zentrales Bestandteil der Unternehmenskultur bei Hitachi Energy ist haben wir noch 5 weitere Sicherheitsregeln. Die 5 Sicherheitsregeln sind allgemeine Grundprinzipien, die für alle Tätigkeiten gelten – unabhängig von der konkreten Aufgabe oder dem Arbeitsumfeld. Sie dienen dem Schutz der Mitarbeitenden, der Anlagen und der Qualität der Arbeit. @kober_elektrosicherheit_handout_2022_2022

=== Arbeiten mit klarem Auftrag – und wissen, wer die Verantwortung trägt
Ein zentraler Grundsatz ist die Notwendigkeit klarer Kommunikation und Verantwortungszuweisung. Bevor eine Tätigkeit begonnen wird, muss eindeutig geklärt sein:

- Was genau zu tun ist
- Wer die Aufgabe freigegeben hat
- Wer die Verantwortung für die Durchführung trägt

Unklare Zuständigkeiten führen häufig zu Fehlern oder gefährlichen Situationen. Deshalb ist es essenziell, dass jede*r Mitarbeitende weiß, in welchem Rahmen er oder sie handelt – und wann Rücksprache gehalten werden muss.

=== Arbeiten nur ausführen, wenn man dafür geschult und berechtigt ist
Nur qualifiziertes Personal darf sicherheitsrelevante Tätigkeiten ausführen – das schützt alle Beteiligten. Deshalb ist es wichtig, dass nur qualifiziertes Personal mit entsprechender Schulung und Freigabe sicherheitsrelevante Tätigkeiten ausführt. Dazu zählen:

- Fachkenntnisse über das System oder Gerät
- Kenntnisse über Gefahrenquellen
- Nachweis über absolvierte Schulungen oder Unterweisungen

Diese Regel schützt nicht nur die ausführende Person, sondern auch Kolleg*innen und das Unternehmen vor vermeidbaren Risiken.

=== Nur mit sicheren und intakten Arbeitsmitteln arbeiten
Werkzeuge, Prüfgeräte und #acr("PSA") müssen regelmäßig geprüft und in einwandfreiem Zustand sein. Defekte oder manipulierte Arbeitsmittel stellen ein erhebliches Risiko dar. Vor Arbeitsbeginn ist daher zu prüfen:

- Ist das Werkzeug vollständig und funktionstüchtig?
- Sind Kabel, Stecker und Gehäuse unbeschädigt?
- Ist das Gerät kalibriert und zugelassen?

Nur wenn diese Fragen mit „Ja“ beantwortet werden können, darf das Arbeitsmittel verwendet werden.

=== Persönliche Schutzausrüstung (PSA) tragen
Die #acr("PSA") ist die letzte Schutzbarriere zwischen Mensch und Gefahr. Sie muss:

- zur Tätigkeit passen (z. B. Helm, Schutzbrille, isolierende Handschuhe)
- korrekt getragen werden
- regelmäßig geprüft und gewartet werden

#acr("PSA") schützt. Sie ist kein Zusatz, sondern Pflicht. Helm, Handschuhe und Schutzbrille sind Lebensretter.

=== Anlagen nur in Betrieb nehmen, wenn die vorgeschriebenen Kontrollen vorgenommen wurden
Bevor eine Anlage eingeschaltet oder in Betrieb genommen wird, müssen alle sicherheitsrelevanten Prüfungen abgeschlossen sein. Dazu gehören:

- Sichtprüfung auf Schäden oder lose Verbindungen
- Kontrolle der Erdung und Isolation
- Funktionstest der Schutzsysteme

Diese Regel verhindert, dass unvollständige oder fehlerhafte Systeme in Betrieb gehen – was zu schweren Unfällen oder Sachschäden führen könnte.
