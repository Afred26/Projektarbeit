#v(2em)
#text(size: 20pt, weight: "bold", "Anmerkung zur Nutzung von Künstlicher Intelligenz")
#v(1em)
#figure(
  caption: [Übersicht über die verwendeten KI-basierten Werkzeuge],
  table(
  columns: (1fr, 4fr),
    inset: 10pt,
    align: horizon,
    fill: (_, y) => if y == 0{ luma(200) }
    else { white },

    //Überschrift
    text("Werkzeug"),             text("Beschreibung der Nutzung"),

    //Körper
    text("Copilot"),              text("Nutzung für Korrektur- und Formulierungshilfe"),
    text("Copilot"),              text("Durchsuchen und Zusammenfassen von (Firmen-)Dokumenten"),
    text("Gemini"),               text("Recherche von allgemeinen Informationen"),
    text("Google Scholar Labs"),   text("Recherche von Fachtexten"),

  )
)<KI>
