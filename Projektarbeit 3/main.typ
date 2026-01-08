#import "@preview/clean-dhbw:0.3.1": *
#import "glossary.typ": glossary-entries

#show: clean-dhbw.with(
  title: "Evaluation von Typst zur Erstellung einer Abschlussarbeit",
  authors: (
    (name: "Fredrik Schall", student-id: "1194924", course: "TEIT24EE1", course-of-studies: "Elektro- und Informationstechnik", company: (
      (name: "Hitachi Energy Germany AG", post-code: "68309", city: "Mannheim")
    )),
  
  ),
  show-confidentiality-statement: true,
  show-declaration-of-authorship: true,
  type-of-thesis: "Projektarbeit 3",
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("zotero.bib"),
  date: datetime.today(),
  glossary: glossary-entries, // displays the glossary terms defined in "glossary.typ"
  language: "de", // en, de
  supervisor: (company: "Marco Marino", university: "-"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  university-short: "DHBW",
  // for more options check the package documentation (https://typst.app/universe/package/clean-dhbw)
  
  show-table-of-contents: true,
)

