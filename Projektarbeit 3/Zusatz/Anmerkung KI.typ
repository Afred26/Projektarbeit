#import "@local/templat-projektarbeit:0.1.5": *
#import "acronyms.typ": acronyms

#v(2em)
#text(size: 20pt, weight: "bold", "Anmerkung zur Nutzung von Künstlicher 
Intelligenz")
#v(1em)
#figure(
  caption: "Übersicht über die verwendeten KI-basierten Werkzeuge",
  table(
  columns: (1fr, 4fr),
    inset: 10pt,
    align: horizon,
    fill: (_, y) => if y == 0{ luma(200) }
    else { white },
    //Überschrift
    text("Werkzeug"),   text("Beschreibung der Nutzung"),

    //Körper
    text("ChatGPT"),    text(""),
    text("Copilot"),    text("Nutzung von CoPilot für Korrektur- und Formulierungshilfe"),
    text("Gemini"),     text("Recherche"),
   
  )
)<KI>
