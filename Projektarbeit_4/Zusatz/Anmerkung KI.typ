#v(2em)
#text(size: 20pt, weight: "bold", "Note on the Use of Artificial Intelligence")
#v(1em)
#figure(
  caption: [Overview of AI-based tools used in this work],
  table(
  columns: (1fr, 4fr),
    inset: 10pt,
    align: horizon,
    fill: (_, y) => if y == 0{ luma(200) }
    else { white },

    //Überschrift
    text("Tool"),             text("usage description"),

    //Körper
    text("Copilot"),              text("Used for correction and phrasing support"),
    text("Copilot"),              text("Searching and summarizing (company) documents"),
    text("Gemini"),               text("Researching general information"),
    text("Google Scholar Labs"),   text("Researching academic literature"),

  )
)<KI>
