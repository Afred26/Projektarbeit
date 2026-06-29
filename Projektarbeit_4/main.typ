#import "@local/templat-projektarbeit:0.1.11": *
#import "Zusatz/acronyms.typ": acronyms

#show: supercharged-dhbw.with(
  title: "Validation and Assessment of CT and VT Calculations in SECP Global: Development of a User Guide and Independent Verification Tool",
  authors: (
    (name: "Fredrik Schall", student-id: "1194924", course: "TEIT24EE1", course-of-studies: "Elektro- & Informationstechnik", company: (name: "Hitachi Energy The Netherlands B.V.", post-code: "3068 AX", city: "Rotterdam", country: "Netherlands")
    ),
  ),
  acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("Zusatz/zotero.bib"),
  date: datetime.today(),
  language: "en", // en, de
  ki-anmerkung-content: include "Anmerkung KI.typ",
  supervisor: (company: "Marco Van-Rosmalen"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  university-short: "DHBW",
  font: "Hitachi Sans",
  logo-right: image("Bilder/Hitachi_Global_Logo_Black_RGB.svg"),
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)

// Einleitung
#include "Text/Einleitung/0 Vorwort.typ"

#include "Text/Einleitung/1 Überblick Praxisphase.typ"

// Hauptteil
#include "Text/Hauptteil/0.typ"


//
#include "Text/Schluss/0.typ"
