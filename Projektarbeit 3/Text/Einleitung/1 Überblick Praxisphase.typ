#import "@local/templat-projektarbeit:0.1.5": *
#import "../../Zusatz/acronyms.typ": acronyms

= Überblick Tätigkeit der Praxisphase
Beschreibung der Inhalte aus der 3. Praxisphasen.


#figure(
  caption: "Überblick Praxisphase 3",
  table(
    column-gutter: 0%,
    inset: 10pt,
    align: horizon,
    fill: (_, y) => if y == 0 { luma(200) }
    else { white },
    //Übeschrift
    text("Tätigkeiten des Studenten während des Praxiseinsatzes:"),

    //Body
    text("Einarbeiten in Autodesk Revit"),
    text("Erstellen und Anpassen der Atribute nach Kundenwünschen"),
    text("Erstellen eines Skriptes zur Automatisierung von Atributanpassungen"),
    text("Erstellen und Pflegen eine strukturierte Skill‑Matrix zur präzisen Erfassung, Bewertung und Visualisierung technischer Team‑Kompetenzen"),
  

  ),
)<überblick>