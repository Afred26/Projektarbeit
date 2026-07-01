#figure(
  caption: [Overview of AI-based tools used in this work],
  table(
  columns: (1.1fr, 4fr),
    inset: 10pt,
    align: horizon,
    fill: (_, y) => if y == 0{ luma(200) }
    else { white },

    //Überschrift
    text("Tool"),             text("Usage descriptions"),

    //Körper
    text("Copilot"),              text("Used for correction and phrasing support"),
    text("Copilot"),              text("Searching and summarizing (company) documents"),
    text("Gemini"),               text("Researching general information"),
    text("Google Scholar Labs"),   text("Researching academic literature"),

  )
)<KI>
