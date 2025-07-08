= Umspannwerk Waldheim

In meiner Praxisphase habe ich mich hauptsächlich mit dem Umspannwerk Waldheim (UWW) beschäftigt.
Das UWW wir in Zukunft 340MVA Leistung für ein zwei neue Rechenzentren zu Verfügung stellen.
#figure(caption: "GIS Gebäude Umspannwerk Waldheim", image("../Bilder/UW Waldheim/GIS_Gebäude_UWW.jpg", height: auto))
Das UW besteht grobgesagt aus 3 Teilen: Schaltraum A, Schaltraum B und der Steuerung der Anlage.
Schaltraum A und B sind ähnlich aufgebaut mit kleinen Unterschieden in der GIS.
#figure(caption: "Gasisolierte Schaltanlage im Schaltraum B (Seitenansicht)", image("../Bilder/UW Waldheim/GIS_seite.jpg", height: auto))
Die Steuerung der GIS erfolgt über den SCADA Raum. In diesem Laufen sämtliche Messwerte und Meldungen zusammen, werden verarbeitet und an die Leitstelle zu auswerten geschickt.
Mit den Messdaten kann die Leitstelle entscheiden über welche Sammelschiene die Trafos des Rechenzentrums gespeist werden sollen.
Dies ist wichtig, um einen möglichst symmetrische Belastung des Stromnetzes zu erreichen. 
== Gasisolierte Schaltanlage
Bei einer GIS werden die spannungsführenden Leiter durch ein Schutzgas voneinander isoliert.
Im Vergleich zu Freiluftanlagen kann so ca. 90% des Platzes eingespart werden.
Da das Schutzgas SF6 23.500-mal schädlicher als CO2 ist, wird derzeit an Alternativen wie Vakuumschaltern und Stickstoff als Ersatz geforscht.
Trotz der Umweltbedenken werden Schaltanlagen heutzutage noch mit SF6 isoliert. 
#figure(caption: "Gasisolierte Schaltanlage im Schaltraum B (Frontansicht)", image("../Bilder/UW Waldheim/GIS_front.jpg"))
Die beiden Röhern an der Vorderseite der GIS sind die Sammelschienen, welche die einzelnen Felder verbinden.
Es sind zwei Sammelschienen verbaut, um die Möglichkeit zu haben einzelne Teile der Sammelscheine abzuschalten, um Messungen und Tests durchzuführen, um Lasten besser zu verteilen oder falls ein Fehler auftritt und ohne Ausfall der Stromnetzes Reparaturen durchgeführt werden müssen. 

An die Sammelschienen sind die Felder der GIS angeschlossen. Die Schaltanlage hat vier verschiedene Typen an Schaltfeldern:

+ Die Längskupplung verbindet Sammelschiene zwischen den Schalträumen A und B.
+ Die Querkupplung verbindet die beiden Sammelschienen untereinander.
+ Am Schaltfeld Trafo sind die Transformatoren für die Serverzentren angeschlossen.
+ Die Schaltfelder Freileitung sind die Verbindung der GIS an das Örtliche Stromnetz. Auf den Schaltfeldern sind zusätzlich auch Überspannungsableiter angebracht

== Steuerung der GIS
Die Steuerung einer GIS umfasst eine Vielzahl von Komponenten und Prozessen, die zusammenarbeiten, um eine sichere und effiziente Verteilung elektrischer Energie zu gewährleisten.
Die Steuerung erfolgt über ein zentrales Leitsystem, das die Überwachung und Regelung der Schaltgeräte, wie Leistungsschalter, Trennschalter und Erdungsschalter, ermöglicht. 
#figure(caption: "Steuerschränke Schaltraum A", image("../Bilder/UW Waldheim/Steuerschrank_GIS.jpg"))
Jedes Feld der GIS hat einen eigenen Steuerschrank, in dem die Schaltbefehle aus der Netzleitwarte verarbeitet werden, zudem sind auch die Messgeräte für unteranderem Differenzialstrommessung, Distanzschutz, Überstromschutz und viele mehr eingebaut sind.
Diese Messgeräte analysieren die Daten und geben entsprechende Schaltbefehle aus, um den Betrieb zu optimieren und Störungen zu vermeiden.
Zudem ist in jedem Schrank ein Schalter eingebaut, welcher den Fernbetrieb deaktiviert, damit sicher an der Anlage gearbeitet werden kann.
Darüber hinaus sind moderne GIS mit Schutz- und Automatisierungsfunktionen ausgestattet, die eine schnelle Fehlererkennung und -behebung ermöglichen.
Dies trägt nicht nur zur Betriebssicherheit bei, sondern auch zur Verlängerung der Lebensdauer der Anlage und zur Reduzierung von Wartungskosten.

Zur Steuerung der Schaltanlage gehört auch ein SCADA-Raum. Dort werden alle elektrischen Signale der Anlage gebündelt und an die Netzleitstelle weitergeleitet und die Schaltanfragen der Netzleitstelle an die einzelnen Steuereinheiten gesendet.

== Stromversorgung
Eine 110kV GIS braucht eine Zusätzlicher Stromversorgung, da alle Steuer- und Überwachungsgeräte mit 400V AC oder 110V DC versorgt werden müsse.
Dazu wir ein Eigenbedarf Trafo ans örtliche 10kV Netz angeschlossen.
#figure(caption: "Eigenbedarf Transformator 10kV/400V", image("../Bilder/UW Waldheim/Eigenbedarfs_Trafo.jpg"))
Von dem Trafo geht es zur Niederspannung Hauptverteilung. Von dort wir dann die redundant Batteriegesicherte DC-Versorgung gespeist.
#figure(caption: "Eigenbedarf DC-Verteilung", image("../Bilder/UW Waldheim/Eigenbedarf_DC.jpg"))
#figure(caption: "Eigenbedarf AC-Verteilung", image("../Bilder/UW Waldheim/Eigenbedarf_AC.jpg"))
