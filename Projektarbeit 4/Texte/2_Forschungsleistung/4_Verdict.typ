#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Releasability Verdict

This chapter consolidates the assessment results into a releasability verdict, applying the decision rule fixed in the methodology to each case, appraising the reference-model approach and answering the main research question. Because the decision rule is non-compensatory, a strong result in one case cannot offset a blocking finding in another.

== Per-Case Verdict via the Decision Rule

Each case is judged against the three outcomes of the decision rule; a finding that only affects presentation is treated as a limitation, whereas one that affects the engineering result is treated as a blocker. The outcomes are summarised in @tab-verdict and explained below.

The *line differential* case is releasable. The criterion applied by #acr("SECP") is correctly formed, the suitability decision matches the reference model in all ten cases and the only deviation is the small conservative difference in lead resistance arising from the cable-resistance basis (mean approximately 0.49%), which changes no decision and lies within the tolerance defined for the comparison. The single condition attached to release is that this deviation be disclosed in the delivered document.

The *transformer differential* case is not releasable as generated and requires an improvement. The suitability decisions are consistent with the reference model, but the required value is numerically incorrect: the tool counts the secondary lead resistance twice, evaluating the criterion with $R_"ct" + 2 R_"lead" + R_"relay"$ although $R_"lead"$ is already a loop resistance, over-estimating the required #acr("emf") by a mean of approximately 8.79% and by up to 21.98%. The defect is conservative, so in the interim the results are safe in the sense that an inadequate #acr("CT") cannot be accepted; but the printed value is wrong, departs from the RET670 requirement the report itself cites and resides in the tool rather than any single report. No manual workaround within the effort budget of the decision rule can correct it, so the outcome is an improvement required, not a documentable limitation. The improvement is precise and small in scope: the lead resistance must enter the transformer-differential criterion once rather than twice.

The *overcurrent* case is not releasable and requires an improvement for a different reason. The device required for the planning work, the REF650, is not selectable in the #acr("CT") and #acr("VT") adequacy-check module and the only overcurrent option offered is the REF630, whose dimensioning basis is a burden-corrected accuracy limit factor rather than the required secondary limiting #acr("emf") of the REF650. Because the substitute is not shown to be at least as onerous as the required device, its use could accept an under-dimensioned #acr("CT") while appearing internally consistent, which is a blocker under the decision rule. Release therefore requires either that the REF650 be made selectable or that the equivalence of the REF630 substitute be demonstrated formally through the conversion between the two dimensioning bases.

#figure(
  table(
    columns: (100pt, 100pt, 1fr),
    inset: 7pt,
    align: (left + horizon, left + horizon, left + horizon),
    table.header([*Case*], [*Verdict*], [*Basis*]),
    [Line differential (RED670)],
      [Yes],
      [Correctly formed criterion; decision matches reference in all cases; only a small conservative cable-resistance deviation, to be disclosed.],
    [Transformer differential (RET670)],
      [No, improvement required],
      [Lead-resistance double-count over-estimates the required value; conservative but numerically incorrect and standard-inconsistent; a tool-level fix, not a per-report workaround.],
    [Overcurrent (REF650)],
      [No, improvement required],
      [Required device not selectable; REF630 substitute uses a different basis not shown to be at least as onerous; coverage-and-equivalence blocker.],
  ),
  caption: [Per-case releasability verdict under the decision rule.],
) <tab-verdict>

A supersession finding applies across all cases: every generated report cites #acr("IEC") 61869-1:2007, a withdrawn edition of the general-requirements standard. This weakens the delivered document as an auditable reference and should be corrected, but it is a documentation-level matter separate from the two engineering findings above.

== Evaluation of the Reference-Model Approach

The reference-model approach proved effective for its purpose. By comparing #acr("SECP") against an independent implementation derived from #acr("IEC") 61869-2, #acr("IEC") TR 61869-100 and the device manuals, it isolated a defect that a decision-only check would have missed entirely: because the transformer-differential deviation is conservative, every suitability decision agreed with the reference, yet the required value was numerically wrong. Comparing numerical outputs rather than only verdicts was therefore decisive and separating the computation layer from the presentation layer allowed the same root cause to be recognised as both a correctness and a traceability finding.

The approach also has limits that bound the conclusions. The reference model is itself only partially verified: its transformer-differential and line-differential criteria and its cable-resistance relationship reproduce the workbook outputs exactly and are traceable to the device manuals, but documented benchmark calculations, acceptance tolerances and an independent review are not available and the cable reference resistivity is inferred rather than stated. The evaluation is further bounded to two computable application–device cases, one tool version and the operating points in the supplied dataset. The verdict is consequently reported per case and its generalisation beyond the tested configurations is deliberately not claimed.

== Answer to the Main Research Question

The main research question asked whether the #acr("CT") adequacy calculations produced by #acr("SECP") Global can be released to the customer for the planning-phase use case, under which limitations and, if not, which improvements are required. The answer is conditional and function-specific, as set out per case in @tab-verdict: line differential protection is releasable subject to disclosing the small conservative deviation; transformer differential protection is not releasable as generated, the required improvement being to apply the lead resistance once rather than twice; and overcurrent protection cannot be released with the required device, the required improvement being to make the REF650 selectable or to demonstrate the equivalence of the REF630 substitute.

Because the decision rule is non-compensatory, the strong line-differential result does not lift the overall verdict. #acr("SECP") Global is therefore not releasable without qualification for the planning-phase use case in its present state. It is usable now for line differential protection and its transformer-differential results are safe to rely on in the conservative direction while the formula defect is outstanding; but unqualified release depends on correcting the transformer-differential lead-resistance term, closing the overcurrent coverage gap and updating the superseded normative reference carried in every report.
