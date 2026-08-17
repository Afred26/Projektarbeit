#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms
#import "@preview/rexllent:0.4.1": xlsx-parser

= Excel Calculation <Excel_Calc>
#xlsx-parser(read("CT Calculation EXCEL vs SECP.xlsx", encoding: none), sheet-index: 2,parse-table-style: false)
#pagebreak()
#xlsx-parser(read("CT Calculation EXCEL vs SECP.xlsx", encoding: none), sheet-index: 3,parse-table-style: false)
#pagebreak()
#xlsx-parser(
  read("CT Calculation EXCEL vs SECP.xlsx", encoding: none),
  sheet-index: 4,
  parse-header: false,
  parse-stroke: true,
  prepend-elems: (table.hline()),
  stroke: (_, y) => {
    if y == 0 {
      return (bottom: black)
    }
  },
  table.hline(),
)

= #acr("SECP") Report <SECP_Rep>