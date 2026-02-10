#import "@local/templat-projektarbeit:0.1.2": *
#import "Zusatz/acronyms.typ": acronyms

#show: supercharged-dhbw.with(
  title: "Transformation im Engineering: Von 2D-CAD Design über 3D - BIM Modellierung zum digitalen Zwilling",
  authors: (
    (name: "Fredrik Schall", student-id: "1194924", course: "TEIT24EE1", course-of-studies: "Elektro- & Informationstechnik", company: (
      (name: "Hitachi Energy Germany AG", post-code: "68309", city: "Mannheim")
    )),
  ),
  acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("Zusatz/zotero.bib"),
  date: datetime.today(),
  language: "de", // en, de
  supervisor: (company: "Marco Marino"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  university-short: "DHBW",
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)

// Einleitung
#include "Text/Einleitung/0 Vorwort.typ"

#include "Text/Einleitung/1 Überblick Praxisphase.typ"

// Hauptteil
#include "Text/Hauptteil/0.typ"


// 
#include "Text/Schluss/0.typ"