#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Conclusion

This project investigated the validity and quality of the #acr("CT") adequacy calculations produced by #acr("SECP") Global, comparing them against an independent reference model derived from #acr("IEC") 61869-2, #acr("IEC") TR 61869-100 and the applicable device manuals and assessing the generated reports for traceability, coverage and fitness for customer delivery across three application–device cases.

During the work the focus shifted from the search for isolated calculation errors towards a systematic evaluation methodology — framed as an evaluation study within design-science research, structured as a single-case study and operationalised through research questions, a non-compensatory decision rule, a goal–question–metric measurement scheme and a three-level defect classification. This shift reflected the recognition that a dependable engineering result requires not only a correct final decision but also numerically correct intermediate values, faithful formulae and a traceable, current report.

The central methodological lesson is why numerical output must be checked rather than only final decisions: because the transformer-differential deviation is conservative, every suitability verdict matched the reference and a decision-only check would have reported full agreement while the underlying required value was wrong. Only the comparison against an independent reference, together with the separation of the computation layer from the presentation layer, exposed the defect and identified it as both a correctness and a traceability finding with a single root cause.

Applying the non-compensatory decision rule, #acr("SECP") Global is not releasable without qualification for the planning-phase use case in its present state, though it is already usable for line differential protection; the specific corrections required are set out in the releasability verdict. Beyond these corrections, the project recommends that independent reference calculation and structured, repeatable validation be retained as standing practice whenever #acr("SECP") calculations are relied upon and that the identified findings be treated as software defects to be corrected and retested rather than as isolated observations.
