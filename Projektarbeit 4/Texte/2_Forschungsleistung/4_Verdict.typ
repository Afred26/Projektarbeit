#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Releasability Verdict

This chapter consolidates the assessment results into a releasability verdict. The decision rule fixed in the methodology is applied to each case, the reference-model approach is appraised and the main research question is answered.

== Per-Case Verdict via the Decision Rule

Each investigated application–device case is evaluated using the non-compensatory decision rule defined in @Decision_Rule; the corresponding decision process is illustrated in @Decision_process. Because the rule is non-compensatory, neither a strong result in another assessment category nor a high weighted score in the supplementary decision matrix can override a finding that affects the correctness or technical applicability of the engineering result.

#figure(caption: [Decision process for determining the releasability of an evaluated #acr("CT") calculation case],
  image("../../Bilder/main/Decision process.png"),
)<Decision_process>

=== Line Differential Protection

The line differential case is releasable. The criterion applied by #acr("SECP") is correctly formed, and the suitability decision agrees with the independent reference calculation in all ten evaluated cases. The remaining numerical difference is small and conservative and does not change any pass or fail decision in the investigated dataset.

Under the decision process shown in @Decision_process, this finding does not constitute an engineering blocker. The deviation should nevertheless be disclosed in the delivered documentation to ensure complete transparency.

=== Transformer Differential Protection

The transformer differential case is not releasable as generated and requires an improvement. Although the suitability decisions agree with the independent reference calculation in all evaluated cases, #acr("SECP") counts the secondary lead resistance twice when determining the required equivalent limiting secondary e.m.f.

The defect affects the numerical engineering result and originates in the tool-level calculation rather than in the presentation of an individual report. It therefore does not satisfy the first decision stage shown in @Decision_process. Since correcting the formula within every generated report is not an appropriate per-report workaround, the case proceeds to the “Improvement required” outcome.

The required improvement is to apply the complete secondary cable-loop resistance once rather than twice in the transformer differential criterion.

=== Overcurrent Protection

The overcurrent case is also classified as not releasable and requires an improvement. The required REF650 is not selectable in #acr("SECP"), while the available REF630 substitute applies a different dimensioning basis. The available evidence does not demonstrate that the substitute is equivalent to or more onerous than the requirement of the REF650.

Consequently, the evaluated case does not fulfil the completeness and applicability conditions in the first decision stage of @Decision_process. No documented workaround establishes equivalence within the defined process. Release therefore requires either implementation of the REF650 or a formal demonstration that the substitute calculation is sufficiently conservative for the same input conditions.

== Evaluation of the Reference-Model Approach

The reference-model approach proved effective for its purpose. By comparing #acr("SECP") against an independent implementation derived from #acr("IEC") 61869-2, #acr("IEC") TR 61869-100 and the device manuals, it isolated a defect that a decision-only check would have missed entirely: because the transformer-differential deviation is conservative, every suitability decision agreed with the reference, yet the required value was numerically wrong. Comparing numerical outputs rather than only verdicts was therefore decisive. Separating the computation layer from the presentation layer additionally allowed the same root cause to be recognised as both a correctness and a traceability finding.

The approach also has limits that bound the conclusions. The reference model is itself only partially verified: its transformer-differential and line-differential criteria and its cable-resistance relationship reproduce the workbook outputs exactly and are traceable to the device manuals, but documented benchmark calculations, acceptance tolerances and an independent review are not available and the cable reference resistivity is inferred rather than stated. The evaluation is further bounded to two computable application–device cases, one tool version and the operating points in the supplied dataset. The verdict is consequently reported per case and no generalisation beyond the tested configurations is claimed.

== Answer to the Main Research Question

The main research question asked whether the #acr("CT") adequacy calculations produced by #acr("SECP") Global can be released to the customer for the planning-phase use case, under which limitations and, if not, which improvements are required. The answer is conditional and function-specific, as set out per case in @Decision_process: line differential protection is releasable subject to disclosing the small conservative deviation; transformer differential protection is not releasable as generated, the required improvement being to apply the lead resistance once rather than twice; and overcurrent protection cannot be released with the required device, the required improvement being to make the REF650 selectable or to demonstrate the equivalence of the REF630 substitute.

Because the decision rule is non-compensatory, the strong line-differential result does not lift the overall verdict. #acr("SECP") Global is therefore not releasable without qualification for the planning-phase use case in its present state. It is usable now for line differential protection and its transformer-differential results are safe to rely on in the conservative direction while the formula defect is outstanding. Unqualified release, however, depends on correcting the transformer-differential lead-resistance term, closing the overcurrent coverage gap and updating the superseded normative reference carried in every report.
