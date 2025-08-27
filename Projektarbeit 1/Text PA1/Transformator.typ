#import "@preview/supercharged-dhbw:3.4.1": *
#import "../Zusatz/acronyms.typ": acronyms

= Transformator
Das Umspannwerk versorgt die Rechenzentren über je 4 Y(N)yn0(d) #acr("Trafo") eingespeist. 
#figure(caption: [Transformator], image("../Bilder/UW Waldheim/Tansformator.jpg"))<transformer>

== Aufbau und Typ des Transformators
Die Transformerbezeichnung Y(N)yn0(d) steht für:

- Y: Spulen der #acr("OS") in Stern-Verdrahtung verschaltet
- (N): Sternpunkt der #acr("OS") herausgeführt 
- y: Spulen der #acr("US") in Stern-Verdrahtung verschaltet
- n: Sternpunkt der #acr("US") herausgeführt
- 0: Phasenverschiebung zwischen #acr("OS") und #acr("US") (in Vielfachen von 30°)
- (d): Tertiärspule Dreieck-Verdrahtung verschalten

Für die bereitgestellten 340 #acr("MVA") für die Rechenzentren (170#acr("MVA") pro Rechenzentrum) wurden 4x 50#acr("MVA") und 4x 35#acr("MVA") #acrpl("Trafo") verwendet. 

== Kühlung und Isolierung
Die Transformatoren sind ölgekühlt und ölisoliert.
Transformatoröl besitzt eine hohe dielektrische Festigkeit und gute thermische Leitfähigkeit, was es ideal für die Kühlung und Isolierung macht.
Zusätzlich ermöglicht die Analyse des Öls Rückschlüsse auf den Zustand des Transformators.
Veränderungen in Reinheit oder chemischer Zusammensetzung können auf Alterung, Überlastung oder interne Fehler hinweisen.

== Schutz- und Überwachungseinrichtungen
Zum Schutz der Transformatoren kommen verschiedene Einrichtungen zum Einsatz:

- Buchholzrelais zur Detektion von Gasbildung im Öl bei internen Fehlern
- Temperaturüberwachung zur Vermeidung thermischer Überlastung
- Differenzialschutz zur Erkennung von Kurzschlüssen innerhalb des Transformators

Diese Schutzsysteme gewährleisten einen sicheren Betrieb und verlängern die Lebensdauer der Anlage.

== Stufenschalter
Da die Spannung im Netz und die Last der Anlage nicht konstant sind, wird zur Stabilisierung der Spannung ein Stufenschalter an die #acr("OS") des Transformators eingebaut.
Ein Stufenschalter in einem Transformator dient zur Regelung der Ausgangsspannung.
Er ermöglicht es, die Windungszahl der #acr("OS") zu verändern, womit das Wicklungsverhältnis $N_"OS"/N_"US"$ und daraus folgend das Spannungsverhältnis $U_"OS"/U_"US"$  verändert werden kann.
Dies ist besonders wichtig, um Schwankungen im Stromnetz auszugleichen und eine konstante Spannung zu gewährleisten.

Durch die Verwendung der Stufenschaltern können Transformatoren effizienter arbeiten und die Lebensdauer elektrischer Geräte verlängern, indem sie eine stabile Spannungsversorgung sicherstellen. 
Bei der Verwendung von Stufenschaltern muss immer das Interesse des Netzbetreibens (möglichst wenig Schaltvorgänge) und das des Kunden (möglichst stabile Spannung) abgewägt werden.
Dazu wird die Spannung auf der #acr("US") mit einem Spannungsregler überwacht und über verschiedene Grenzwerte und Schaltfunktionen ein optimales Ergebnis für Netzbetreiber und Kunde erreicht.
