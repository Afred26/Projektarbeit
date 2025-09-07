#import "@preview/supercharged-dhbw:3.4.1": *
#import "../Zusatz/acronyms.typ": acronyms

= STATCOM
#acr("STATCOM") ist ein fortschrittliches #acr("FACTS")-Betriebsmittel, das zur dynamischen Blindleistungsregelung in elektrischen Energieübertragungssystemen eingesetzt wird. Im Gegensatz zu klassischen Kompensationsanlagen wie #acr("SVC"), bei denen Kompensationsreaktanzen (Kondensatoren oder Drosseln) stufenweise zu- oder abgeschaltet werden, arbeitet der #acr("STATCOM") mit einem selbstgeführten Spannungswechselrichter (#acr("VSC")) und einem Energiespeicherkondensator. @schwab_elektroenergiesysteme_2022

#grid(
  columns: (220pt,1fr,220pt),
  rows: auto,
  figure(caption: "Kondensator", image(height: 130pt ,"../Bilder/STATCOM/Kondensator.jpg")),
  align: right,
  text(""),
  figure(caption: "Ventiel", image(height: 130pt, "../Bilder/STATCOM/Ventile.jpg"))
)

Die #acr("STATCOM") wird über einen #acrl("Trafo") parallel zum Netz geschaltet. Durch #acr("PWM") erzeugen die Wechselrichter ein dreiphasiges, nahezu sinusförmiges Spannungssystem, dessen Betrag und Phasenlage gezielt geregelt werden kan. Die Höhe der eingespeisten Blindleistung ist proportional zum eigespeisten Blindstrom $I_q$ und ergibt sich aus der Differenz zwischen der erzeugten Spannung $U_"synth"$ der #acr("STATCOM") und der Netzspannung $U_"Netz"$, geteilt durch die Kurzschlussreaktanz $X_k$ des Transformators: @schwab_elektroenergiesysteme_2022

$ I_q =  (U_"Netz" - U_"synth") / X_k $
#pagebreak()

Wenn die #acr("STATCOM")-Ausgangsspannung größer als die Netzspannung ist, fließt ein kapazitiver Blindstrom ins Netz (Erzeugung kapazitiver Blindleistung).
Ist die #acr("STATCOM")-Ausgangsspannung kleiner als die Netzspannung, wird induktive Blindleistung aufgenommen (Erzeugung induktiver Blindleistung).
Die #acr("STATCOM") kann somit sowohl kapazitive als auch induktive Blindleistung sehr schnell und stufenlos bereitstellen. Im Gegensatz zu klassischen #acrpl("SVC") bleibt die maximale Blindleistung auch bei niedrigen Netzspannungen nahezu erhalten, was insbesondere bei Spannungseinbrüchen im Netz ein großer Vorteil ist.

Wesentliche Aufgaben und Vorteile von #acr("STATCOM")-Anlagen sind:

- Schnelle Spannungsregelung in Netzknoten durch Einspeisung oder Aufnahme von Blindleistung.
- Stabilisierung der Netzspannung bei Laständerungen oder Netzstörungen.
- Dämpfung von Spannungsschwankungen und Verbesserung der Spannungsqualität.
- Bereitstellung von Systemdienstleistungen wie Momentanreserve, wenn der Energiespeicher entsprechend ausgelegt ist.
- Kompakte Bauweise und hohe Dynamik durch den Einsatz von Leistungselektronik.
#acr("STATCOM")-Anlagen werden zunehmend in Übertragungs- und Verteilnetzen eingesetzt, um die Herausforderungen der Energiewende zu bewältigen