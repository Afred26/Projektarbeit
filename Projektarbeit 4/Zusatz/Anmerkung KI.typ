#figure(
  caption: [Overview of AI-based tools used in this thesis],
  table(
  columns: (1.1fr, 4fr),
    inset: 7pt,
    align: horizon,
    fill: (_, y) => if y == 0{ luma(200) }
    else { white },
    table.header([*Tool*], [*Usage descriptions*]),

    [Copilot],                  [Language correction, phrasing support and assistance in searching and summarising company documents],
    [Google Scholar Labs],      [Researching academic literature],
    [Gemini],                   [Research support for general information],
    [Claude Code],              [Adjusting the document template],
  )
)<KI>