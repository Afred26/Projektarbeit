#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Methodology

This chapter defines the method used to answer the central question of this thesis: whether the #acr("CT") adequacy calculations produced by #acr("SECP") Global can be relied upon for their intended use. Because the object is an existing engineering tool rather than a newly constructed one, the work is an evaluation study — #acr("SECP") is treated as a given artefact whose fitness for a defined purpose is assessed against explicit criteria — and the present chapter is the reference that makes the subsequent results reproducible and defensible.

== Research Design

The evaluation follows design-science research, in which an artefact is investigated through problem investigation, treatment design and treatment evaluation; this thesis occupies the evaluation part of that cycle and determines, against documented criteria, how well #acr("SECP") solves the dimensioning problem it is intended to solve rather than developing it. #cite(<Hevner_Design_Science>) Because a single tool is examined in its real engineering setting, the work is organised as a single-case study in the sense of empirical software engineering: the case is #acr("SECP") Global and the units of analysis are individual #acr("CT") adequacy calculations and their generated reports, a frame that provides a recognised structure for research questions, traceable evidence and the discussion of validity. #cite(<Runeson_Case_Study>) In the terminology of #acr("ISO")/#acr("IEC") 25040, the study is a quality evaluation for suitability to a specific use rather than a conformity check against a full requirements specification, which fixes the reference against which #acr("SECP") is judged as the defined intended use. #cite(<ISO_IEC_25040>)

== Research Questions

The central question is a releasability question: whether the #acr("CT") adequacy calculations produced by #acr("SECP") Global can be released to the customer for the planning-phase use case; if only conditionally, under which limitations; and, if not, which improvements are required. It decomposes into four sub-questions, each addressing one property a releasable result must possess:

RQ1 (correctness): Do the numerical #acr("CT") dimensioning results of #acr("SECP") agree, within a defined tolerance, with an independent reference model derived from the #acr("IEC") 61869 series?

RQ2 (traceability): Do the formulae and calculation steps shown in the generated report correspond to the calculation actually performed and to the applicable standard?

RQ3 (coverage and appropriateness): Does #acr("SECP") cover the required application and relay cases and where only a substitute device is selectable, is its dimensioning basis equivalent to that of the required device?

RQ4 (report fitness): Is the generated report fit for its documentation purpose and can any formatting deficiencies be remedied within an acceptable effort?

== Evaluation Context, Object and Scope

The intended use fixed for this evaluation is that a protection engineer performs #acr("CT") adequacy dimensioning during the planning phase using #acr("SECP") Global and the generated report is transmitted to the customer as an auditable design record; releasability can only be judged relative to this stated purpose. #cite(<ISO_IEC_25040>) The object of study is the #acr("CT") and #acr("VT") adequacy-check module of #acr("SECP"), restricted to its #acr("CT") sizing function. #cite(<SECP_User_Manual>)

The evaluation is scoped to three representative application–device cases: transformer differential protection with the RET670, line differential protection with the RED670 and overcurrent protection with a REF650 requirement. The #acr("IEC") and #acr("ISO") standards are treated as the release-relevant normative basis; #acr("IEEE") rules are considered only where #acr("SECP") supports both rule sets and a comparison is informative. The two differential cases are computable in #acr("SECP"): the required device is selectable and the calculation completes, so correctness, traceability and report quality can be examined directly against the reference model. The overcurrent case deliberately targets the coverage question, because the required REF650 is not selectable and the tool offers only the REF630 substitute on a different dimensioning basis; it is therefore assessed through the coverage-and-equivalence analysis rather than the numerical comparison.

== Releasability Decision Rule

The verdict is governed by a decision rule fixed before the assessment, so findings are judged consistently rather than case by case in hindsight. A result is releasable without qualification if it is correct, complete, traceable and presentable without intervention; releasable with a limitation if it becomes releasable only after a manual workaround that yields a very good result within approximately fifteen to thirty minutes per report, the workaround itself being recorded as the limitation; and not releasable, requiring an improvement, if no workaround satisfies both conditions. The rule is summarised in @tab-decision-rule.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 7pt,
    align: (left + horizon, left + horizon),
    table.header([*Verdict*], [*Condition*]),
    [Yes], [Report is correct, complete, traceable and presentable without intervention.],
    [Yes, with limitation], [Report becomes releasable only after a manual workaround that yields a very good result within approximately 15–30 minutes per report. The workaround is documented as the limitation.],
    [No, improvement required], [No workaround satisfies both the quality and the effort condition or no workaround is possible.],
  ),
  caption: [Releasability decision rule applied to each evaluated case.],
) <tab-decision-rule>

A criterion that only degrades presentation is treated as a limitation, whereas one that affects the engineering result is a blocker. This distinction is decisive in the planning context, because an undetected result error propagates into specification and procurement, so correctness and traceability defects weigh more heavily than cosmetic ones.

== Quality Model and Measurement

The properties referenced by the decision rule are anchored in the #acr("ISO")/#acr("IEC") 25010 product quality model. #cite(<ISO_IEC_25010>) Correctness and completeness are aspects of functional suitability, traceability is treated as an aspect of functional correctness and analysability and report fitness combines interaction capability with the maintainability of the report artefact. To make these measurable rather than impressionistic, each is operationalised through the goal–question–metric approach, in which a goal is refined into questions and each question into a metric with a decision criterion, as given in @tab-gqm. #cite(<Basili_GQM>)

#figure(
  table(
    columns: (auto, 1.2fr, 1fr),
    inset: 7pt,
    align: (left + horizon, left + horizon, left + horizon),
    table.header([*RQ*], [*Metric*], [*Decision criterion*]),
    [RQ1], [Deviation between the #acr("SECP") result and the reference-model result for each dimensioning quantity.], [Deviation within the defined tolerance for all quantities.],
    [RQ2], [Agreement between the formula shown in the report and the formula governing the performed calculation and the standard.], [Displayed formula matches the governing formula.],
    [RQ3], [Availability of the required device and equivalence of the substitute's dimensioning basis to the required device's published requirement.], [Required device selectable or substitute demonstrably equivalent.],
    [RQ4], [Fitness of the report for transmission and effort required to reach a very good state.], [Fit as generated or fit within the workaround budget.],
  ),
  caption: [Operationalisation of the sub-questions following the goal–question–metric approach.],
) <tab-gqm>

== Validation by Reference-Model Comparison

RQ1 is answered by comparing #acr("SECP") against an independent reference. #acr("SECP") is the system under test; a separate reference model, implemented in a spreadsheet and computing the #acr("CT") adequacy quantities directly from #acr("IEC") 61869-2 and #acr("IEC") TR 61869-100, serves as the test oracle, so the comparison rests on the primary normative basis itself. #cite(<IEC_61869_2>), #cite(<IEC_61869_100>) Following the verification-and-validation distinction between solving a model correctly and solving the correct model, the same input set is entered into both, the output quantities are recorded and the relative deviation #cite(<Roach_Verification_Validation>), #cite(<Oberkampf_Verification_Validation>)

$ delta = (q_"SECP" - q_"ref") / q_"ref" $ <eq-deviation>

is evaluated for every quantity $q$. A case satisfies RQ1 if the magnitude of the deviation in @eq-deviation stays within a tolerance reflecting display precision and permissible rounding; a larger deviation is recorded as a discrepancy. The residual uncertainty of the reference value itself, arising from rounding and admissible formula variants, is acknowledged in the sense of the guide to the expression of uncertainty in measurement, so the tolerance is understood as a band rather than an exact threshold. #cite(<JCGM_100_GUM>)

The method separates two questions easily conflated: whether the numerical output of #acr("SECP") matches the reference (RQ1, the computation layer) and whether the formula displayed in the report matches the formula that produced that output (RQ2, the presentation layer). A case in which the numbers agree while the displayed derivation does not is therefore not a contradiction but a defect confined to the presentation layer and the two layers are recorded independently.

== Structured Quality Assessment

RQ2, RQ3 and RQ4 are assessed by structured examination rather than numerical comparison. For RQ2 the displayed formulae and steps of the detailed report are checked against the governing calculation and the applicable clause of the standard and any mismatch is recorded with its location and whether it is isolated or systematic. #cite(<SECP_User_Manual>), #cite(<IEC_61869_2>) For RQ3 coverage is separated from equivalence: coverage is established by which application–device combinations can be represented in #acr("SECP") and where only a substitute is offered, equivalence is examined by comparing the dimensioning basis #acr("SECP") applies through the substitute with the #acr("CT") requirement published for the required device. #cite(<REF650_Technical_Guide>), #cite(<RET670_Application_Manual>) The substitute is regarded as equivalent only if it applies the same governing requirement with the same input quantities and is no less onerous than the required device; a less onerous basis is treated as a blocker, because it can under-dimension a #acr("CT") while appearing internally consistent. For RQ4 the report is assessed against the releasable properties and, where deficient, an attempt is made to remedy it within the workaround budget; the outcome of that attempt determines whether the deficiency is a limitation or a blocker. As a supplementary check, the standards cited within #acr("SECP") are compared against their current editions, since a reference to a superseded edition is itself a traceability weakness of the delivered document.

== Defect Classification Scheme

Every observation is recorded through a common three-level scheme, shown in @tab-classification. The cause level classifies the software defect using the standard classification for software anomalies; #cite(<IEEE_1044>) the effect level expresses the resulting numerical or metrological deviation through @eq-deviation and its uncertainty; #cite(<JCGM_100_GUM>) and the benchmark level evaluates the consequence against the #acr("CT") adequacy criterion of the #acr("IEC") 61869 series. #cite(<IEC_61869_2>), #cite(<IEC_61869_100>)

#figure(
  table(
    columns: (auto, 1fr, auto),
    inset: 7pt,
    align: (left + horizon, left + horizon, left + horizon),
    table.header([*Level*], [*Question*], [*Basis*]),
    [Cause], [Which software defect produced the observation and where does it reside?], [#acr("IEEE") 1044],
    [Effect], [What numerical or metrological deviation results?], [ASME V\&V 20, GUM],
    [Benchmark], [How does the consequence rate against the adequacy criterion?], [#acr("IEC") 61869],
  ),
  caption: [Three-level classification applied to each finding.],
) <tab-classification>

Each finding is additionally assigned a severity reflecting whether it affects the engineering result or only the presentation, mapping directly onto the blocker-versus-limitation distinction so that a finding's classification and its effect on the verdict are consistent by construction.

== Validity Considerations

The credibility of the conclusions is discussed through the four validity aspects of case-study research. #cite(<Runeson_Case_Study>) Construct validity — whether the criteria capture what releasability means to the organisation — is addressed by defining the intended use explicitly, deriving the releasable properties from an established quality model and fixing the decision rule in advance. Internal validity — whether an observed deviation is genuinely attributable to #acr("SECP") rather than to the reference model or an input error — is addressed by deriving the reference model from the primary standards, cross-checking it and entering identical, documented inputs into both. External validity is bounded, because only three application–device cases and one tool version are examined; the verdict is therefore reported per case and the cases are chosen to represent the dominant planning applications. Reliability is addressed by documenting the reference model, the input sets, the decision rule and the classification scheme, so the evaluation can in principle be repeated independently.
