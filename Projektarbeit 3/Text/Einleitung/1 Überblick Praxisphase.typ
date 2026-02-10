#import "@local/templat-projektarbeit:0.1.2": *
#import "../../Zusatz/acronyms.typ": acronyms
= Überblick Tätigkeit der Praxisphase
Die Projektarbeit beschreibt Inhalte aus der 3. Praxisphasen.


#figure(
  caption: "Überblick Praxisphase 3 ",
  table(
    column-gutter: 0%,
    inset: 10pt,
    align: horizon,
    fill: (_, y) => if y == 0 or y == 5 { luma(200) }
    else { white },
    
    text("Tätigkeiten des Studenten während des Praxiseinsatzes:"),
    text("Einarbeitung in das Projektwendungsbereiche"),
    text("DIN VDE 0100-600 Messprotokolle erstellt"),
    text("Revisionspläne erstellt"),
    text("Vorlage Abnahmeprotokoll erstellt"),
    
    text("Baustellen-Phase:"),
    text("Bei Trafo-Umschwenkung geholfen"),
    text("Neuaufstellung Trafo"),
    text("DIN VDE 0100-600 Messung"),
    text("110/10 kV und 20kV/400V Trafo getestet"),
  ),
)<überblick>