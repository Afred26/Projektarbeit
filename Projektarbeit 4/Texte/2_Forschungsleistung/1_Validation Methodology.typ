#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Methodology

This chapter defines the method used to answer the central question of this thesis, namely whether the #acr("CT") adequacy calculations produced by #acr("SECP") Global can be relied upon for their intended use. Because the object of study is an existing engineering tool rather than a newly constructed one, the work is an evaluation study: #acr("SECP") is treated as a given artefact whose fitness for a defined purpose is assessed against explicit criteria. The chapter first establishes the research design, then formulates the research questions, defines the evaluation context and scope, fixes the decision rule that governs the verdict, operationalises the quality criteria into measurable form, describes the two complementary evaluation strands, specifies the defect-classification scheme and finally discusses the threats to validity and how they are addressed. The subsequent chapters apply this method; the present chapter is the reference that makes those results reproducible and defensible.

== Research Design

The evaluation follows the logic of design-science research, in which an artefact is investigated through a structured cycle of problem investigation, treatment design and treatment evaluation. This thesis is located in the evaluation part of that cycle: it does not develop #acr("SECP") but determines, empirically and against documented criteria, how well the tool solves the dimensioning problem it is intended to solve. #cite(<Hevner_Design_Science>)

Because a single tool is examined in its real engineering setting, the work is organised as a single-case study in the sense of empirical software engineering. The case is #acr("SECP") Global; the units of analysis are individual #acr("CT") adequacy calculations and their generated reports. Adopting an established case-study frame is deliberate: it provides a recognised structure for stating research questions, collecting evidence in a traceable way and, in particular, for discussing the validity of the conclusions. #cite(<Runeson_Case_Study>)

In the terminology of the quality-evaluation framework of #acr("ISO")/#acr("IEC") 25040, the study is a quality evaluation for suitability to a specific use rather than a conformity check against a full requirements specification. This classification matters because it fixes the reference against which #acr("SECP") is judged: the defined intended use, not an abstract notion of software quality. #cite(<ISO_IEC_25040>)

== Research Questions

The central question originates from the practical need that motivated this thesis and is formulated as a releasability question:

The main research question is whether the #acr("CT") adequacy calculations produced by #acr("SECP") Global can be released to the customer for the planning-phase use case; if only conditionally, under which limitations; and, if not, which improvements are required.

This question decomposes into four sub-questions, each of which addresses one property that a releasable result must possess and each of which is answered by a defined part of the method:

RQ1 (correctness): Do the numerical #acr("CT") dimensioning results of #acr("SECP") agree, within a defined tolerance, with an independent reference model derived from the #acr("IEC") 61869 series?

RQ2 (traceability): Do the formulae and calculation steps shown in the generated report correspond to the calculation actually performed and to the applicable standard?

RQ3 (completeness and appropriateness): Does #acr("SECP") cover the required application and relay casesand where only a substitute device is selectable, is its dimensioning basis equivalent to that of the required device?

RQ4 (usability and maintainability): Is the generated report fit for its documentation purposeand can any formatting deficiencies be remedied within an acceptable effort?

== Evaluation Context, Object and Scope

The intended use fixed for this evaluation is the following: a protection engineer performs #acr("CT") adequacy dimensioning during the planning phase using #acr("SECP") Global and the generated calculation report is transmitted to the customer as an auditable design record. Defining the intended use explicitly is a prerequisite for a defensible verdict, because releasability can only be judged relative to a stated purpose and user. #cite(<ISO_IEC_25040>)

The object of study is the #acr("CT") and #acr("VT") adequacy check module of #acr("SECP"), restricted to its #acr("CT") sizing function. #cite(<SECP_User_Manual>)

The evaluation is scoped to three representative application–device cases that dominate the planning work in the relevant setting. The first is transformer differential protection with the RET670, the second is line differential protection with the RED670 and the third is overcurrent protection with a REF650 requirement. The #acr("IEC") and #acr("ISO") standards are treated as the release-relevant normative basis; #acr("IEEE") rules are considered only where #acr("SECP") supports both rule sets and a comparison is informative. The cases are chosen to exercise complementary aspects of the method. The two differential cases are computable in #acr("SECP") and provide the basis for the numerical comparison: the required device is selectable and the calculation completes, so that correctness, traceability and report quality can be examined directly against the reference model. The overcurrent case deliberately targets the coverage question, because the required REF650 is not selectable and the tool offers only the REF630 substitute on a different dimensioning basis; it is therefore assessed through the coverage-and-equivalence analysis rather than through the numerical comparison.

== Releasability Decision Rule

The verdict is governed by a decision rule that is fixed before the assessment is carried out, so that individual findings are judged consistently rather than case by case in hindsight. A result is releasable without qualification if it is correct, complete, traceable and presentable without intervention. A result is releasable with a limitation if it becomes releasable only after a manual workaround, provided that the workaround yields a result of very good quality and requires no more than approximately fifteen to thirty minutes of effort per report; in this case the workaround itself is recorded as the limitation. A result is not releasable and an improvement is required, if no workaround satisfies both of these conditions, whether because the outcome remains deficient, because the required effort clearly exceeds the budget or because no workaround is possible at all. The rule is summarised in @tab-decision-rule.

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

A criterion that only degrades presentation or convenience is treated as a limitation, whereas a criterion that affects the engineering result is treated as a blocker. This distinction is decisive in the planning context, because an undetected result error propagates into specification and procurement, so that correctness and traceability defects are weighted more heavily than purely cosmetic ones.

== Quality Model and Measurement

The properties referenced by the decision rule are anchored in the product quality model of #acr("ISO")/#acr("IEC") 25010, which provides the vocabulary of quality characteristics against which the tool is assessed. #cite(<ISO_IEC_25010>) The four releasable properties map to that model as follows: correctness and completeness are aspects of functional suitability, traceability is treated as an aspect of the report's functional correctness and of analysability and report fitness combines interaction capability with the maintainability of the report artefact.

To make these properties measurable rather than impressionistic, each is operationalised through the goal–question–metric approach, in which an evaluation goal is refined into answerable questions and each question into a concrete metric with an associated decision criterion. #cite(<Basili_GQM>) The resulting operationalisation is given in @tab-gqm and defines, for every sub-question, what is measured and how the outcome feeds the decision rule.

#figure(
  table(
    columns: (auto, 1fr, 1fr),
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

RQ1 is answered by comparing #acr("SECP") against an independent reference. #acr("SECP") is the system under test and a separate reference model, implemented in a spreadsheet and computing the #acr("CT") adequacy quantities directly from the formulae of #acr("IEC") 61869-2 and the guidance of #acr("IEC") TR 61869-100, serves as the test oracle. #cite(<IEC_61869_2>), #cite(<IEC_61869_100>) The reference model is not taken from a single secondary source but derived from the primary standards, so that the comparison rests on the normative basis itself.

The comparison follows the distinction, established in the verification-and-validation literature, between verifying that a model is solved correctly and validating that the correct model is solved. #cite(<Roach_Verification_Validation>), #cite(<Oberkampf_Verification_Validation>) For each test case the same input set is entered into #acr("SECP") and into the reference model, the relevant output quantities are recorded and the relative deviation

$ delta = (q_"SECP" - q_"ref") / q_"ref" $ <eq-deviation>

is evaluated for every quantity $q$, where $q_"SECP"$ is the value produced by #acr("SECP") and $q_"ref"$ the value produced by the reference model. A case satisfies RQ1 if the magnitude of the deviation in @eq-deviation stays within a tolerance that reflects display precision and permissible rounding; a larger deviation is recorded as a discrepancy for further analysis. The residual uncertainty of the reference value itself, arising from rounding and from admissible variants of the standard formulae, is acknowledged in the sense of the guide to the expression of uncertainty in measurement, so that the tolerance is understood as a band rather than an exact threshold. #cite(<JCGM_100_GUM>) Where a validation metric with an associated uncertainty is required for a quantity, the comparison is framed in the manner of the verification-and-validation standard for computational analysis.

The method separates two questions that are easily conflated. The first is whether the numerical output of #acr("SECP") matches the reference, which is the subject of RQ1 and belongs to the computation layer. The second is whether the formula displayed in the report matches the formula that produced that output, which is the subject of RQ2 and belongs to the presentation layer. A case in which the numbers agree while the displayed derivation does not is therefore not a contradiction but a defect confined to the presentation layerand the two layers are recorded independently.

== Structured Quality Assessment

RQ2, RQ3 and RQ4 are assessed by structured examination rather than by numerical comparison. For RQ2 the displayed formulae and calculation steps of the detailed report, whose stated purpose is to present the calculation procedure with formulae and results, are checked against the governing calculation and the applicable clause of the standardand any mismatch is recorded with the location at which it occurs and with an indication of whether it is isolated or systematic. #cite(<SECP_User_Manual>), #cite(<IEC_61869_2>)

For RQ3 the coverage question is separated from the equivalence question. Coverage is established by determining which of the required application–device combinations can actually be represented in #acr("SECP"). Where the required device is not selectable and only a substitute is offered, equivalence is examined by comparing the dimensioning basis that #acr("SECP") applies through the substitute with the #acr("CT") requirement published for the required device in its own documentation. #cite(<REF650_Technical_Guide>), #cite(<RET670_Application_Manual>) The substitute is regarded as equivalent only if it applies the same governing requirement with the same input quantities and is no less onerous than the required device's requirement, so that any #acr("CT") accepted through the substitute would also satisfy the required device. A substitute whose basis is less onerous is treated as unsafe for substitution and therefore as a blocker, because it can lead to an under-dimensioned #acr("CT") while appearing internally consistent.

For RQ4 the generated report is assessed against the releasable properties defined above and, where deficiencies are found, an attempt is made to remedy them within the workaround budget of the decision rule; the outcome of that attempt, rather than an opinion on appearance, determines whether the deficiency is a limitation or a blocker. As a supplementary check that connects to a wider finding of this thesis, the standards cited within #acr("SECP") are compared against their current editions, since a reference to a superseded edition is itself a traceability weakness of the delivered document.

== Defect Classification Scheme

To keep the findings systematic and to connect them to the decision rule, every observation is recorded through a common classification scheme with three levels, shown in @tab-classification. The first level identifies the cause as a software defect and classifies it using the attributes of the standard classification for software anomalies. #cite(<IEEE_1044>) The second level describes the effect as the resulting numerical or metrological deviation, expressed through the deviation of @eq-deviation and its uncertainty. #cite(<JCGM_100_GUM>) The third level evaluates the consequence against the domain benchmark, that is, against the #acr("CT") adequacy criterion of the #acr("IEC") 61869 series. #cite(<IEC_61869_2>), #cite(<IEC_61869_100>) The overall verification-and-validation activity is structured in accordance with the corresponding process standard.

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

Each finding is additionally assigned a severity that reflects whether it affects the engineering result or only the presentation and this severity maps directly onto the blocker-versus-limitation distinction of the decision rule, so that the classification of a finding and its effect on the verdict are consistent by construction.

== Validity Considerations

The credibility of the conclusions is discussed in terms of the four validity aspects used in case-study research. #cite(<Runeson_Case_Study>)

Construct validity concerns whether the criteria actually capture what releasability means to the organisation. It is addressed by defining the intended use explicitly, by deriving the releasable properties from an established quality modeland, where an internal report or quality specification exists, by aligning the criteria with it; the decision rule is fixed in advance to prevent post-hoc adjustment.

Internal validity concerns whether an observed deviation is genuinely attributable to #acr("SECP") rather than to the reference model or to an input error. It is addressed by deriving the reference model from the primary standards, by cross-checking it and by entering identical, documented inputs into both the tool and the reference.

External validity concerns the extent to which the findings generalise. Because only two application–device cases and one tool version are examined, the verdict is reported per case rather than as a single blanket statement; the cases are chosen to represent the dominant planning applications, which bounds but does not eliminate this limitation.

Reliability concerns whether another evaluator would reach the same result. It is addressed by documenting the reference model, the input sets, the decision rule and the classification scheme, so that the evaluation can in principle be repeated independently.
