#import "@preview/supercharged-dhbw:3.4.1": *
#import "../Zusatz/acronyms.typ": acronyms

= Funktion
#acr("STATCOM") ist ein fortschrittliches #acr("FACTS")-Betriebsmittel, das zur dynamischen Blindleistungsregelung in elektrischen Energieübertragungssystemen eingesetzt wird. Im Gegensatz zu klassischen Kompensationsanlagen wie #acr("SVC"), bei denen Kompensationsreaktanzen (Kondensatoren oder Drosseln) stufenweise zu- oder abgeschaltet werden, arbeitet der #acr("STATCOM") mit einem selbstgeführten Spannungswechselrichter (Voltage Source Converter, VSC) und einem Energiespeicherkondensator.

Der #acr("STATCOM") wird über einen Netzkupplungstransformator parallel zum Netz geschaltet. Durch Pulsweitenmodulation erzeugt der Wechselrichter ein dreiphasiges, nahezu sinusförmiges Spannungssystem, dessen Betrag und Phasenlage gezielt geregelt werden können. Die Höhe der eingespeisten Blindleistung ergibt sich aus der Differenz zwischen der erzeugten Spannung des #acr("STATCOM") und der Netzspannung, geteilt durch die Kurzschlussreaktanz des Transformators:

$ I_q =  (U_"Netz" - U_"synth") / X_k $

Wenn die #acr("STATCOM")-Ausgangsspannung größer als die Netzspannung ist, fließt ein kapazitiver Blindstrom ins Netz (Erzeugung kapazitiver Blindleistung).
Ist die #acr("STATCOM")-Ausgangsspannung kleiner als die Netzspannung, wird induktive Blindleistung aufgenommen (Erzeugung induktiver Blindleistung).
Der #acr("STATCOM") kann somit sowohl kapazitive als auch induktive Blindleistung sehr schnell und stufenlos bereitstellen. Im Gegensatz zu klassischen SVCs bleibt die maximale Blindleistung auch bei niedrigen Netzspannungen nahezu erhalten, was insbesondere bei Spannungseinbrüchen im Netz ein großer Vorteil ist.

Wesentliche Aufgaben und Vorteile von #acr("STATCOM")-Anlagen:

Schnelle Spannungsregelung in Netzknoten durch Einspeisung oder Aufnahme von Blindleistung.
Stabilisierung der Netzspannung bei Laständerungen oder Netzstörungen.
Dämpfung von Spannungsschwankungen und Verbesserung der Spannungsqualität.
Bereitstellung von Systemdienstleistungen wie Momentanreserve, wenn der Energiespeicher entsprechend ausgelegt ist.
Kompakte Bauweise und hohe Dynamik durch den Einsatz von Leistungselektronik.
#acr("STATCOM")-Anlagen werden zunehmend in Übertragungs- und Verteilnetzen eingesetzt, um die Herausforderungen der Energiewende zu bewältigen