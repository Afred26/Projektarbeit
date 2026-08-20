#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms
#set text(hyphenate: false)

= Methodology <Methodology>

This chapter defines the method used to answer the central question of this thesis: Whether the #acr("CT") adequacy calculations produced by #acr("SECP") Global can be relied upon for their intended use. Since the object of the investigation is an existing engineering tool and not a newly developed one, the work is an evaluation study. #acr("SECP") is treated as a given artefact whose fitness for a defined purpose is assessed against explicit criteria.

== Research Questions

The central question of the project is a releasability question: Can the #acr("CT") adequacy calculations produced by #acr("SECP") Global be released to the customer for the planning phase use case, if only conditionally, under which limitations and if not, which improvements are required? It is broken down into four sub questions, each addressing one property a releasable result must have:
#set terms(hanging-indent: 18pt, separator: [*:* ])
/ RQ1 (correctness): Do the numerical #acr("CT") dimensioning results of #acr("SECP") agree, within a defined tolerance, with an independent reference calculation derived from the #acr("IEC") 61869 series and the application manuals?

/ RQ2 (traceability): Do the formulae and calculation steps shown in the generated report correspond to the calculation actually performed and to the applicable standard?

/ RQ3 (coverage and appropriateness): Does #acr("SECP") cover the required application and relay cases and where only a substitute device is selectable, is its dimensioning basis equivalent to that of the required device?

/ RQ4 (report fitness): Is the generated report fit for its documentation purpose and can any formatting deficiencies be remedied within an acceptable effort?

== Evaluation Context, Object and Scope

The intended use for this evaluation is the following: A protection engineer performs #acr("CT") adequacy dimensioning during the planning phase using #acr("SECP") Global and the generated report is transmitted to the customer as an auditable design record. Releasability can only be judged relative to this stated purpose #cite(<ISO_IEC_25040>). The object of study is the #acr("CT") and #acr("VT") adequacy check module of #acr("SECP"), restricted to its #acr("CT") sizing function. #cite(<SECP_User_Manual>)

The evaluation is scoped to three representative application device cases: 
- Transformer differential protection with the RET670
- Line differential protection with the RED670 
- Overcurrent protection with a REF650 requirement. 

The #acr("IEC") and #acr("ISO") standards are treated as the release relevant normative basis, #acr("IEEE") rules are considered only where #acr("SECP") supports both rule sets and a comparison is informative. The two differential cases are computable in #acr("SECP"). But the overcurrent case deliberately targets the coverage question. Here the required REF650 is not selectable and the tool offers only the REF630 substitute on a different dimensioning basis, so this case is assessed through the coverage and equivalence analysis instead of the numerical comparison.

== Quality Model and Measurement

The properties referenced by the decision rule are anchored in the #acr("ISO")/#acr("IEC") 25010 product quality model #cite(<ISO_IEC_25010>). Correctness and completeness are aspects of functional suitability, traceability is treated as an aspect of functional correctness and analysability and report fitness combines interaction capability with the maintainability of the report artefact. To make these properties measurable, each of them is operationalised with the goal question metric approach: A goal is refined into questions and each question into a metric with a decision criterion, as given in @tab-gqm. #cite(<Basili_GQM>)


#figure(
  table(
    
    columns: (39pt, 1.25fr, 1fr),
    inset: 7pt,
    align: (left + horizon, left + horizon, left + horizon),
    table.header([*RQ*], [*Metric*], [*Decision criterion*]),
    [RQ1], [Deviation between the #acr("SECP") result and the reference calculation result for each dimensioning quantity.], [Deviation within 5% of the reference calculation.],
    [RQ2], [Agreement between the formula shown in the report and the formula governing the performed calculation and the standard.], [Displayed formula matches the governing formula.],
    [RQ3], [Availability of the required device and equivalence of the substitute's dimensioning basis to the required device's published requirement.], [Required device selectable or substitute demonstrably equivalent.],
    [RQ4], [Fitness of the report for transmission and effort required to reach a very good state.], [Fit as generated or fit within the workaround budget.],
  ),
  caption: [Operationalisation of the sub questions following the goal question metric approach.],
) <tab-gqm>

== Validation by Reference Calculation Comparison

RQ1 is answered by comparing #acr("SECP") with an independent reference calculation implemented in Microsoft Excel.

 An identical input dataset is entered into both calculation paths. Both calculation paths determine the required #acr("CT") performance, the available #acr("CT") capability and the final suitability decision. Their outputs are subsequently compared at the numerical and decision levels.

The comparison follows the distinction between solving a calculation correctly and applying the correct calculation basis. The independent calculation implements the relevant requirements from the device applicable manuals together with the #acr("CT") quantities and relationships defined in #acr("IEC") 61869-2 and #acr("IEC") TR 61869-100. It therefore provides a transparent basis against which the #acr("SECP") results can be examined.

For every evaluated quantity $q$, the relative deviation is calculated as

$ delta = (q_"SECP" - q_"ref") / q_"ref" $ <eq-deviation>

A positive value indicates that #acr("SECP") produces a higher result than the independent reference calculation, whereas a negative value indicates a lower result. The numerical comparison is supplemented by a comparison of the resulting pass or fail decisions. This separation is necessary because a numerical deviation does not necessarily change the final suitability classification. The direction of the deviation is nevertheless important for its engineering interpretation. 

A higher required #acr("CT") performance calculated by #acr("SECP") is conservative from a protection perspective, because the adequacy condition becomes more difficult to satisfy and an insufficient #acr("CT") is not falsely accepted. However, this does not make the deviation harmless. It may lead to the rejection of an otherwise adequate #acr("CT") or to the selection of an unnecessarily larger #acr("CT"), resulting in increased project cost, space requirements or procurement effort. It may also indicate that previous designs based on similar assumptions were more conservative than technically required. 

A lower required #acr("CT") performance calculated by #acr("SECP") is more critical, because the adequacy condition becomes easier to satisfy and a #acr("CT") may be classified as suitable although its actual performance is insufficient for the protection application. Such an underestimation can directly affect the dependability or stability of the protection function. Therefore, higher #acr("SECP") values are mainly treated as a cost and over dimensioning risk, whereas lower #acr("SECP") values are treated as a potential safety and protection reliability risk.

== Structured Quality Assessment

RQ2, RQ3 and RQ4 are assessed by structured examination rather than numerical comparison. For RQ2 the displayed formulae and steps of the detailed report are checked against the governing calculation and the applicable clause of the standard. Any mismatch is recorded together with its location and with the note whether it is isolated or systematic. #cite(<SECP_User_Manual>) #cite(<IEC_61869_2>) 

For RQ3 coverage is separated from equivalence. Coverage is established by which application device combinations can be represented in #acr("SECP") at all. Where only a substitute is offered, equivalence is examined by comparing the dimensioning basis #acr("SECP") applies through the substitute with the #acr("CT") requirement published for the required device #cite(<REF650_Technical_Guide>). The substitute is regarded as equivalent only if it applies the same governing requirement with the same input quantities and provides a level of performance that is at least equivalent to that of the required device. A less stringent basis is treated as a blocker, because it can under dimension a #acr("CT") while appearing internally consistent. 

For RQ4 the report is assessed against the releasable properties and where deficient, an attempt is made to remedy it within the workaround budget. The outcome of that attempt determines whether the deficiency is a limitation or a blocker. As a supplementary check, the standards cited within #acr("SECP") are compared against their current editions, since a reference to a superseded edition already weakens the traceability of the delivered document.

== Validity Considerations
The credibility of the conclusions is discussed through the four validity aspects of case study research #cite(<Runeson_Case_Study>). Construct validity concerns whether the criteria capture what releasability means to the organization. It is addressed by stating the intended use explicitly, deriving the releasable properties from an established quality model and fixing the evaluation criteria before the assessment. Internal validity concerns whether an observed deviation is genuinely attributable to #acr("SECP") rather than to the reference calculation or an input error. It is addressed by deriving the reference calculation from the device manuals and the #acr("IEC") 61869 series, by manually reproducing selected reference results and by entering identical, documented inputs into both calculation paths.

External validity is limited, because the evaluation covers two computable application–device cases with ten input cases each across three voltage levels, one overcurrent case assessed only through the coverage analysis and a single tool version. The findings therefore hold for the investigated planning applications and operating points rather than for #acr("SECP") as a whole. 
