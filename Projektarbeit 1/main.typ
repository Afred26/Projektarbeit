#import "@preview/supercharged-dhbw:3.4.1": *
#import "Zusatz/acronyms.typ": acronyms

#show: supercharged-dhbw.with(
  title: "Inbetriebnahme von Hochspannungs-Anlagen",
  authors: (
    (name: "Fredrik Schall", student-id: "1194924", course: "TEIT24A", course-of-studies: "Elektrotechnik", company: (
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

// Ziel sind 25-35 Seiten

//Einleitung
#include "Zusatz/Vorwort.typ"

#include "Zusatz/Überblick Praxisphase.typ"


//Haupteil 1
#include "Text PA1/Abt. Commissioning.typ";

#include "Text PA1/UW_Waldheim.typ";

#include "Text PA1/Messung.typ";

#include "Text PA1/Transformator.typ"


//Hauptteil 2

#include "Text PA2/HSE.typ"

#include "Text PA2/STATCOM.typ"

#include "Text PA2/Marienstraße.typ"

//Schluss
//#include "Zusatz/Schluss.typ"
