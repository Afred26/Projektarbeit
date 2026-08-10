#import "@local/templat-projektarbeit:0.1.17": *
#import "Zusatz/acronyms.typ": acronyms

#show: supercharged-dhbw.with(
  title: "Validation and Quality Assessment of CT Calculations in SECP Global",
  authors: (
    (name: "Fredrik Schall", student-id: "1194924", course: "TEIT24EE1", course-of-studies: "Elektro- & Informationstechnik", company: (name: "Hitachi Energy The Netherlands B.V.", post-code: "3068 AX", city: "Rotterdam", country: "Netherlands")
    ),
  ),
  acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("Zusatz/zotero.bib"),
  date: datetime.today(),
  language: "en", // en, de
  ki-anmerkung-content: include "Zusatz/Anmerkung KI.typ",
  // Vorwort einfügen (optional):
  foreword: include "Texte/0_Einleitung/0_Vorwort.typ",
  supervisor: (company: "Marco Van-Rosmalen"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  university-short: "DHBW",
  font: "Hitachi Sans",
  logo-right: image("Bilder/Hitachi_Global_Logo_Black_RGB.svg"),
  titlepage-content: {
    set page(margin: 0pt)
    image("Bilder/Deckblatt.pdf")},
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)

//Einleitung
#include "Texte/0_Einleitung/1_Introduction.typ"

//Theorieteil
#include "Texte/1_Theorieteil/0_Theoretical Background.typ"

//Forschungsleistung

#include "Texte/2_Forschungsleistung/0_Existing SECP.typ"
#include "Texte/2_Forschungsleistung/1_Validation Methodology.typ"
#include "Texte/2_Forschungsleistung/2_Model for Verification.typ"
#include "Texte/2_Forschungsleistung/3_Assessment Results.typ"
#include "Texte/2_Forschungsleistung/4_Verdict.typ"

//Zusammenfassung
#include "Texte/3_Zusammenfassung/0_Conclusion.typ"