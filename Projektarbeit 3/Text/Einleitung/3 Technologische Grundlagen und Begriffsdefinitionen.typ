#import "@local/templat-projektarbeit:0.1.6": *
#import "../../Zusatz/acronyms.typ": acronyms


= Technologische Grundlagen

#acrs("CAD")-Systeme entstanden in den 1960er Jahren als Werkzeuge zur digitalen Zeichnungserstellung #cite(<sutherland_sketch_1964>).
Anfangs beschränkten sie sich auf zweidimensionale Darstellungen, die den klassischen Papierzeichnungen entsprachen. Mit zunehmender Rechenleistung und Softwareentwicklung wurde die 3D-Modellierung möglich, die eine realitätsnähere Darstellung von Bauteilen und Systemen erlaubt.
#acrs("BIM") geht über die reine Geometrie hinaus: Es integriert Informationen zu Materialien, Kosten und Zeitplänen und schafft so ein umfassendes Datenmodell. Der digitale Zwilling schließlich verbindet physische Objekte mit virtuellen Modellen in Echtzeit und ermöglicht Simulationen, Zustandsüberwachung und vorausschauende Wartung.

== Definitionen

=== #acrs("CAD") 

#acrf("CAD") bezeichnet die rechnergestützte Erstellung, Bearbeitung, Analyse und Optimierung von technischen Zeichnungen und digitalen Modellen. #acrs("CAD")-Systeme werden vor allem im Maschinenbau, in der Elektrotechnik, im Bauwesen und in der Produktentwicklung eingesetzt. Sie ermöglichen die präzise Konstruktion von Bauteilen, Baugruppen oder ganzen Anlagen in zwei- oder dreidimensionaler Form. Im Vergleich zur manuellen Zeichnung bieten #acrs("CAD")-Programme eine deutlich höhere Genauigkeit, bessere Änderbarkeit und eine effiziente Wiederverwendung von Konstruktionsdaten. Zusätzlich können physikalische Eigenschaften wie Maße, Toleranzen oder Materialien direkt im Modell hinterlegt werden. #acrs("CAD") bildet damit die Grundlage für nachgelagerte Prozesse wie Simulation, Fertigung und Dokumentation und ist ein zentrales Werkzeug moderner Ingenieur- und Konstruktionsarbeit.

=== #acrs("BIM")

#acrf("BIM") bezeichnet eine digitale Arbeitsmethode zur vernetzten Planung, Ausführung und Bewirtschaftung von Bauwerken. Im Mittelpunkt steht ein intelligentes, dreidimensionales Gebäudemodell, das neben der geometrischen Darstellung auch alle relevanten Informationen wie Materialien, Kosten, Termine und technische Eigenschaften enthält. #acrs("BIM") ermöglicht die Zusammenarbeit aller am Bauprozess beteiligten Fachdisziplinen auf einer gemeinsamen Datenbasis über den gesamten Lebenszyklus eines Bauwerks hinweg. Änderungen werden zentral im Modell vorgenommen und automatisch für alle Beteiligten aktualisiert, wodurch Planungsfehler und Informationsverluste reduziert werden. #acrs("BIM") verbessert somit Transparenz, Qualität und Effizienz in der Bauplanung und gilt als zentrale Methode des digitalen Bauens.

=== Digitaler Zwilling

Der Digitale Zwilling ist ein virtuelles, digitales Abbild eines realen Produkts, Systems oder Prozesses, das dessen Eigenschaften, Zustände und Verhalten möglichst realitätsnah widerspiegelt. Er wird kontinuierlich mit Daten aus der realen Welt, zum Beispiel über Sensoren oder Messsysteme, aktualisiert. Dadurch lassen sich Betrieb, Zustand und Leistung des realen Objekts überwachen, analysieren und simulieren. Digitale Zwillinge werden unter anderem im Maschinen- und Anlagenbau, in der Energietechnik sowie im Bauwesen eingesetzt. Sie ermöglichen die frühzeitige Erkennung von Fehlern, die Optimierung von Abläufen und fundierte Prognosen über Wartung, Lebensdauer oder Effizienz. Der Digitale Zwilling unterstützt somit datenbasierte Entscheidungen über den gesamten Lebenszyklus eines Systems hinweg.

== Unterschiede und Gemeinsamkeiten

#acrs("CAD"), #acrs("BIM") und der digitale Zwilling sind digitale Methoden zur Modellierung und Beschreibung technischer oder baulicher Objekte, unterscheiden sich jedoch deutlich in Zielsetzung, Informationsgehalt und Einsatzbereich. Gemeinsam ist allen drei Ansätzen, dass sie digitale Modelle verwenden, um reale Objekte oder Systeme zu planen, darzustellen und zu analysieren. Sie dienen als Grundlage für bessere Planung, Visualisierung und Entscheidungsfindung und werden häufig kombiniert eingesetzt.

#acrs("CAD") ist die älteste der drei Methoden und konzentriert sich primär auf die geometrische Darstellung von Bauteilen in Form von 2D‑Zeichnungen oder 3D‑Modellen. Der Fokus liegt auf Maßhaltigkeit und konstruktiver Genauigkeit, beispielsweise für technische Zeichnungen oder Ausführungspläne. CAD-Modelle enthalten jedoch in der Regel nur wenige zusätzliche Informationen und bilden keine funktionalen oder zeitlichen Zusammenhänge ab.

#acrs("BIM") geht über #acrs("CAD") hinaus und stellt nicht nur die Geometrie, sondern auch strukturierte Informationen zu Bauteilen bereit, etwa zu Materialien, Kosten, Terminen oder dem Lebenszyklus eines Bauwerks. #acrs("BIM") ist weniger als reine Software zu verstehen, sondern als kooperative Arbeitsmethode, die den gesamten Planungs‑, Bau‑ und teilweise auch Betriebsprozess unterstützt. Änderungen an einem Bauteil wirken sich automatisch auf alle zugehörigen Pläne und Auswertungen aus, was die Koordination erheblich verbessert.

Der digitale Zwilling stellt die Weiterentwicklung dieser Ansätze dar. Er basiert häufig auf einem #acrs("BIM")‑Modell, wird jedoch zusätzlich mit Echtzeitdaten aus dem Betrieb verknüpft, beispielsweise durch Sensoren. Dadurch entsteht ein dynamisches, kontinuierlich aktualisiertes Abbild eines realen Systems, das Analysen, Simulationen und Prognosen ermöglicht. Digitale Zwillinge werden insbesondere in der Betriebs‑ und Nutzungsphase eingesetzt, etwa zur Zustandsüberwachung, Optimierung oder Wartungsplanung.

Zusammenfassend lässt sich sagen: #acrs("CAD") beschreibt vor allem Geometrie, #acrs("BIM") verwaltet Informationen über den Lebenszyklus, und der digitale Zwilling verbindet digitale Modelle mit der realen Welt in Echtzeit. In der Praxis ergänzen sich diese Konzepte und bauen häufig aufeinander auf

//== Technologische Treiber: #acrs("IoT"), Cloud, #acrs("KI"), Big Data