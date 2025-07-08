#import "@preview/supercharged-dhbw:3.4.1": *
#import "Zusatz/acronyms.typ": acronyms

#show: supercharged-dhbw.with(
  title: "Inbetriebnahme von Hochspannungs-Anlagen",
  authors: (
    (name: "Fredrik Schall", student-id: "1194924", course: "TEIT24A", course-of-studies: "Elektro-Technik", company: (
      (name: "Hitachi Energy Germany AG", post-code: "68309", city: "Mannheim")
    )),
  ),
  acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("zotero.bib"),
  date: datetime.today(),
  language: "de", // en, de
  supervisor: (company: "Stefan Cosmus"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  university-short: "DHBW",
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)

// Edit this content to your liking

//= Introduction

//#lorem(100)

//= Examples

//#lorem(30)

//== Acronyms

//Use the `acr` function to insert acronyms, which looks like this #acr("Abt").

//#acrlpl("DIN") are used to define the interaction between different software systems.

//#acrs("IBN") is an architectural style for networked applications.

//== Glossary

//Use the `gls` function to insert glossary terms, which looks like this:

//A #gls("Vulnerability") is a weakness in a system that can be exploited.

//== Lists

//Create bullet lists or numbered lists.

//- This
//- is a
//- bullet list

//+ It also
//+ works with
//+ numbered lists!

//== Figures and Tables

//Create figures or tables like this:

//=== Figures

//#figure(caption: "Image Example", image(width: 4cm, "assets/ts.svg"))

//=== Tables

//#figure(
 // caption: "Table Example",
 // table(
  //  columns: (1fr, 50%, auto),
//    inset: 10pt,
//    align: horizon,
//    table.header(
//      [],
//      [*Area*],
//      [*Parameters*],
//    ),

//    text("cylinder.svg"),
//    $ pi h (D^2 - d^2) / 4 $,
//    [
//      $h$: height \
//      $D$: outer radius \
//      $d$: inner radius
//    ],

//    text("tetrahedron.svg"), $ sqrt(2) / 12 a^3 $, [$a$: edge length],
//  ),
//)<tabele_ref>


//== References

//Cite like this #cite(form: "prose", <iso18004>).
//Or like this @iso18004.

//You can also reference by adding `<ref>` with the desired name after figures or headings.

//For example this @tabele_ref references the table on the previous page.


//Vorwort
#include "Zusatz/Vorwort.typ"

#include "Zusatz/Überblick Praxisphase.typ"


//Haupteil 1
#include "Text PA1/Abt. Commissioning.typ";

#include "Text PA1/UW_Waldheim.typ";

#include "Text PA1/Messung.typ";

#include "Text PA1/Transformator.typ"


//Hauptteil 2



//Schluss
#include "Zusatz/Schluss.typ"

