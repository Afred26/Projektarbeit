#import "@local/templat-projektarbeit:0.1.6": *
#import "../../Zusatz/acronyms.typ": acronyms

= Transformation im Engineering
Der Übergang von 2D zu 3D war ein Paradigmenwechsel: Statt flacher Zeichnungen entstehen räumliche Modelle, die Kollisionen frühzeitig erkennen lassen und die Kommunikation zwischen Disziplinen verbessern. #acr("BIM") erweitert diesen Ansatz, indem es nicht nur Geometrie, sondern auch semantische Informationen integriert.
Der digitale Zwilling geht noch einen Schritt weiter: Er bildet das reale Objekt virtuell ab und verknüpft es mit Echtzeitdaten. So können Betriebszustände überwacht, Wartungen geplant und Prozesse optimiert werden. In der Energietechnik ermöglicht dies beispielsweise die Simulation von Lastflüssen oder die vorausschauende Instandhaltung von Netzen.

== Von 2D-#acr("CAD") zu 3D-Modellierung

Die Entwicklung des technischen Designs hat in den vergangenen Jahrzehnten einen tiefgreifenden Wandel erfahren. Während klassische Konstruktion lange Zeit fast ausschließlich anhand zweidimensionaler Zeichnungen erfolgte, setzt die Industrie zunehmend auf durchgängige digitale 3D‑Modelle. Der Übergang von 2D‑CAD zu 3D‑Modelling stellt jedoch weit mehr dar als eine rein grafische Modernisierung – er ist ein zentraler Bestandteil der umfassenden Digitalisierung des Engineering‑Prozesses und bildet die Grundlage für effiziente Planung, verlässliche Datenstrukturen sowie moderne Methoden wie #acrs("BIM").
Die Digitalisierung gilt mittlerweile als ein entscheidender Motor für Produktivität, Qualität und Nachhaltigkeit im Engineering, wie im #acrs("BIM")‑Handbuch betont wird („Der verstärkte Einsatz digitaler Prozesse trägt wesentlich zur wirtschaftlichen, sozialen und ökologischen Zukunft bei.“). #cite(<eubimtg_handbuch_nodate>)
Im Folgenden werden die wichtigsten Vorteile und neuen Möglichkeiten sowie die Auswirkungen auf den Designprozess erläutert.

=== Vorteile und neue Möglichkeiten

==== Ganzheitliche Visualisierung und besseres Verständnis

Während 2D‑Zeichnungen lediglich abstrahierte Projektionen eines Objektes zeigen, bildet ein 3D‑Modell die reale Geometrie vollständig ab. Dadurch entsteht ein tiefes räumliches Verständnis, was insbesondere in komplexen technischen Bereichen wie Energietechnik, Maschinenbau oder Bauwesen essenziell ist.
Im #acrs("BIM")‑Magazin wird betont, dass modellbasierte Arbeit Zusammenhänge deutlich verständlicher macht, da das Modell selbst zum zentralen Kommunikationsmedium wird. #cite(<golinski_bim-magazin_2025>)

==== Kollisions- und Fehlervermeidung

3D‑Modelle ermöglichen automatische Prüfungen, wie Kollisionsanalysen oder geometrische Konsistenzchecks.
Dies wurde in verschiedenen Projekten bestätigt, etwa im Kontext #acrs("BIM")‑basierter Planung, die zeigt, dass Koordinationsprozesse zwischen Gewerken effizienter werden und kritische Punkte frühzeitig erkennbar sind. #cite(<golinski_bim-magazin_2025>)

==== Höhere Datenkonsistenz und Informationsqualität

Ein wesentlicher Vorteil des 3D‑Modellings besteht in der zentralen Datenhaltung. Im 3D‑Modell werden Geometrien und Informationen zu einem konsistenten Dataset zusammengeführt – im Gegensatz zu 2D‑Zeichnungen, bei denen Informationen oft redundant gepflegt werden müssen.
Das #acrs("BIM")‑Handbuch beschreibt, dass eine saubere Datenstruktur die Grundlage für hochwertige Daten und bessere Kostenkontrolle bildet. #cite(<eubimtg_handbuch_nodate>)

==== Automatisierte Auswertungen, Simulationen und Variantenstudien

3D‑Modelle können unmittelbar für Simulationen genutzt werden – z. B. Belastungsanalysen, thermische Berechnungen, Strömungssimulationen oder Schattenstudien im Bauwesen.
Auch automatisierte Mengenermittlungen, Stücklisten und Auswertungen („strukturierte Mengenauswertung über Modellprüfer“) sind direkt aus dem Modell möglich. #cite(<golinski_bim-magazin_2025>)

==== Unterstützung intelligenter Prozesse (Digital Twin & Lifecycle)

Moderne Engineering‑Methoden gehen über das reine Modellieren hinaus. Sie nutzen das 3D‑Modell als Basis für digitale Zwillinge (Digital Twins), also virtuelle Abbilder realer Systeme, die für Betrieb, Wartung und Monitoring eingesetzt werden können.
Das #acrs("BIM")‑Handbuch zeigt, dass der digitale Zwilling eine wesentliche Voraussetzung für eine zukunftsorientierte Gebäudeverwaltung ist und Daten über den gesamten Lebenszyklus bereitstellt. #cite(<eubimtg_handbuch_nodate>)

==== Verbesserte Zusammenarbeit durch gemeinsame Datenumgebungen

3D‑Modelle ermöglichen die Zusammenarbeit vieler Akteure unterschiedlicher Disziplinen in einer gemeinsamen Datenumgebung (Common Data Environment).
Projekte wie „Crossrail“ zeigen, dass ein durchgängig modellbasierter Austausch zu höherer Qualität, weniger Datenverlust und effizienteren Prozessen führt. #cite(<eubimtg_handbuch_nodate>)

=== Auswirkungen auf Designprozesse

Die Transformation hin zum 3D‑Modeling verändert nicht nur Werkzeuge – sie beeinflusst den gesamten Engineering‑Workflow grundlegend.

==== Von der zeichnungsbasierten zur modellbasierten Arbeitsweise

Traditionell entstand das Produkt oder Bauwerk erst in Form von Zeichnungen – das Modell war nur ein geistiges Konstrukt.
Mit dem 3D‑Modelling kehrt sich dieser Ansatz um:
Das Modell wird zur zentralen Quelle aller Informationen.
Zeichnungen sind lediglich abgeleitete Dokumente.
Dieser Wandel wird im #acrs("BIM")‑Magazin hervorgehoben: „Pläne werden künftig weniger erzeugt; stattdessen rückt das digitale Modell als primäre Informationsquelle in den Vordergrund.“ #cite(<golinski_bim-magazin_2025>)

==== Verschiebung von Aufwand und Entscheidungen in frühe Phasen

Die Modellorientierung führt dazu, dass mehr Informationen bereits früher bereitgestellt werden müssen.
Dies hat zwei Folgen:

- Höhere Planungsqualität schon in früheren Phasen
- Strukturelle Anforderungen an Informationsgehalt (Level of Information Needed – LOIN)
- Im BIM‑Magazin wird betont, dass eine „frühzeitige Detaillierung“ oft notwendig ist und zu effizienteren Prozessen führt, aber auch neue Anforderungen an Struktur und Semantik der Modellobjekte stellt. #cite(<golinski_bim-magazin_2025>)

==== Standardisierte Datenstrukturen und offene Formate

Da 3D‑Modelle erheblich datenreicher sind, müssen Austauschformate standardisiert und interoperabel sein.
Das #acrs("BIM")‑Handbuch erklärt, dass IFC als offener Standard wesentlich für die Interoperabilität ist und unterschiedliche Softwarelösungen verbindet.
Dies hat direkte Auswirkungen auf den Designprozess, da Informationen strukturiert erzeugt und gepflegt werden müssen. #cite(<eubimtg_handbuch_nodate>)

==== Interdisziplinäre Koordination wird integraler Bestandteil

Ein 3D‑Modell erfordert einen engen Austausch zwischen allen Gewerken.
Beispielsweise zeigt die Fallstudie „Albano“ aus dem Handbuch, dass klare Regeln zu Informationsentwicklungsgraden und Modellstrukturen notwendig sind, damit die Zusammenarbeit verschiedener Disziplinen funktioniert. #cite(<eubimtg_handbuch_nodate>)

==== Das Modell als Kommunikations-, Prüf- und Entscheidungswerkzeug

3D‑Modelle erleichtern die Abstimmung mit Stakeholdern erheblich.
Visuelle Darstellungen, begehbare Modelle oder VR‑Szenarien schaffen Transparenz.
Daten aus Simulationen, Variantenvergleichen und Qualitätssicherungen lassen sich direkt aus dem Modell ableiten – ein deutlicher Fortschritt gegenüber 2D‑Prozessen, die hierfür oft zusätzliche Arbeitsschritte erfordern.

==== Integration in Bauausführung und Betrieb
Modellbasierte Prozesse enden nicht bei der Planung:

- #acrs("BIM")‑basierte Baustellenlogistik
- modellgestützte Terminplanung
- digitale Qualitätssicherung
- dokumentierte Montageabläufe
- All dies wird laut #acrs("BIM")‑Magazin bereits heute in vielen Projekten genutzt und führt zu nachweislichen Effizienzgewinnen.

== Einführung von #acr("BIM")

=== Prinzipien, Standards (IFC, ISO 19650)
#cite(<iso_iso_2024>) #cite(<iso_iso_2018>)

=== Nutzen für Planung, Ausführung und Betrieb


== Digitaler Zwilling

=== Konzept und Architektur

=== Datenintegration und Echtzeit-Updates

=== Anwendungsfälle