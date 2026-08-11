#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Assessment Results

This chapter presents the results of the assessment of current-transformer calculations performed in #acr("SECP") Global. The evaluation is organised by the four research questions and closes with a cross-cutting review of the normative references used by #acr("SECP"). Three application–device cases are examined: transformer differential protection with the RET670, line differential protection with the RED670 and overcurrent protection with a REF650 requirement. The first two are computable in #acr("SECP") and are assessed against an independent reference model; the third exercises the coverage question and is assessed through RQ3.

Two sources of evidence are used. The first is the comparison workbook @Excel_Calc, which contains ten evaluated transformer-differential cases and ten line-differential cases together with their #acr("SECP") counterparts. The second is a #acr("SECP") detailed calculation report, which exposes the formulae, intermediate values and normative references actually printed by the tool and thereby makes the traceability and report-quality questions answerable. In line with the methodology, the releasability of each case is decided by the non-compensatory decision rule; the weighted decision matrix contained in the workbook is retained only as a supplementary, data-driven indicator and does not by itself determine the verdict.

== RQ1 – Numerical Correctness

=== Comparison approach

Numerical correctness is assessed by comparing the required equivalent limiting secondary #acr("emf") computed by #acr("SECP") with the value computed by the independent reference model for the same input set. For each case two criteria are evaluated, the governing value is taken as the larger of the two and the resulting pass/fail decision is compared in addition to the numerical values. The available dataset covers configurations at 220 kV, 150 kV and 33 kV. The assessment is limited to these operating points; the supplied material does not establish that they span the complete range of applications processed in #acr("SECP").

=== Transformer differential protection

For transformer differential protection, #acr("SECP") returns higher required values than the reference model in all ten evaluated cases. The deviation of the governing criterion ranges from approximately 2.68% to 21.98%, with a mean of approximately 8.79%. The largest deviation occurs in case 33-5, where the governing reference value is 85.06 V against 109.02 V in #acr("SECP"); the smallest occurs in case 33-1, with 332.30 V against 341.45 V. The final suitability classification is nevertheless identical in every case: both methods classify all ten transformer-differential cases as passing, so the numerical deviation does not change any suitability decision in the dataset.

The detailed #acr("SECP") report identifies the cause of this deviation. #acr("SECP") evaluates the governing transformer-differential criterion with a secondary-loop resistance of the form $R_"ct" + 2 R_"lead" + R_"relay"$, whereas the reference model and the underlying RET670 requirement use a single lead resistance, $R_"ct" + R_L + S_R \/ I_r^2$. #cite(<RET670_Application_Manual>) The quantity $R_"lead"$ printed by #acr("SECP") is already computed as a loop resistance over twice the cable length; applying the further factor of two in the criterion therefore counts the lead resistance twice. For case 220-1, the report evaluates $30 dot 577.35 dot (1\/800) dot (7 + 2 dot 1.0092 + 0.02) = 195.69 \" V\"$, against the reference value of $172.72 \" V\"$ obtained with a single lead resistance, a difference of 13.3%. The effect scales with the ratio of lead resistance to winding resistance, which explains why the deviation is largest in the 33 kV cases, where the winding resistance is comparatively small.

The defect is confined to the transformer-differential branch: as shown below, the line-differential calculation applies the lead resistance once. It is also conservative in direction, because an over-estimated required value can only reject an adequate #acr("CT") or demand a larger one and can never accept an inadequate #acr("CT"). Classified according to the three-level scheme of the methodology, the finding is a computational defect in the transformer-differential secondary-loop term at the cause level (#acr("IEEE") 1044), a positive relative deviation of the governing criterion of up to approximately 22% at the effect level and a bias towards safety at the #acr("IEC") 61869 benchmark level, since the adequacy inequality $E_"al" >= E_"al,req"$ is only ever made harder to satisfy. #cite(<IEEE_1044>), #cite(<IEC_61869_2>)

=== Line differential protection

For line differential protection, #acr("SECP") also returns slightly higher required values than the reference in all ten cases, but the deviations are far smaller: a minimum of approximately 0.10%, a mean of approximately 0.49% and a maximum of approximately 1.45%, the maximum occurring in case 33-5. The pass/fail decision agrees in all ten cases, with 220-1, 150-1 and 150-2 classified as failing by both methods and the remaining seven as passing.

The detailed report shows that the line-differential criterion applies the lead resistance once, $R_"ct" + R_L + S_R \/ I_r^2$, in agreement with the RED670 requirement and the reference model; the residual deviation is attributable to the cable-resistance basis rather than to the loop term. #cite(<RED670_Application_Manual>) #acr("SECP") derives the lead resistance from a rated d.c. resistance of 4.61 Ω/km with the temperature correction of #acr("IEC") 60287-1, whereas the reference model uses a marginally lower reference resistivity; this accounts for the systematic difference of roughly five percent in the lead resistance, whose effect on the governing criterion is small because the lead resistance is only a minor part of the total secondary-loop resistance in the line-differential cases.

=== Overcurrent protection

Overcurrent protection cannot be compared numerically in the same way, because the required device (REF650, expressed as a required secondary #acr("emf")) is not selectable in #acr("SECP") and the tool computes the case through the REF630 substitute using a burden-corrected accuracy limit factor. The two methods do not produce the same quantity, so a direct deviation is not meaningful. This case is therefore assessed through the coverage-and-equivalence analysis of RQ3 rather than through the reference-model comparison.

=== Answer to RQ1

Within the investigated dataset, #acr("SECP") preserves the final suitability decision in all twenty compared cases. Line-differential results agree closely with the reference. Transformer-differential results deviate by a mean of approximately 8.79% and up to 21.98% and the cause is now identified: an isolated formula defect in the transformer-differential branch that counts the lead resistance twice. The deviation is conservative and does not flip any decision in the dataset, but the reported required value is numerically incorrect and the absence of a decision change does not guarantee that a case situated close to the suitability threshold would be unaffected. Numerical accuracy and decision consistency must therefore be reported separately: the transformer-differential calculation is decision-consistent but not numerically correct.

== RQ2 – Traceability of Formulae in the Report

The #acr("SECP") detailed report is, in its structure, highly traceable. For each tap it prints the input data, the lead-resistance calculation with its normative reference, the relay-parameter calculation, the fault calculations, the two required-#acr("emf") criteria with their substituted values, the proposed #acr("CT") capability and the final adequacy comparison. It names the governing device requirement explicitly, citing the RET670 application manual clause for the transformer-differential criteria and #acr("IEC") 61869-100 for the conversion of the accuracy limit factor to a knee-point value. #cite(<SECP_User_Manual>), #cite(<RET670_Application_Manual>), #cite(<IEC_61869_100>) A reader can in principle follow every reported result from the inputs to the verdict.

Three traceability weaknesses are nevertheless present. First, the displayed transformer-differential formula embeds the lead-resistance double-count identified under RQ1, so the equation printed in the report does not correspond to the single-lead-resistance requirement of the RET670 clause it cites; the report is internally traceable but not faithful to its own normative reference. Second, #acr("SECP") labels the proposed capability as a knee-point voltage while actually computing the secondary limiting #acr("emf") $E_"ALF" = "ALF" dot I_"sr" dot (R_"ct" + S_n \/ I_"sr"^2)$; per #acr("IEC") 61869-100 the knee-point #acr("emf") is lower than $E_"al"$ by the core-material factor, so the terminology conflates two related but distinct quantities. #cite(<IEC_61869_100>) Third, in the line-differential section the single-phase criteria are printed with a $2 R_"lead"$ term while the accompanying numerical result follows the single-lead value, a mismatch between the displayed formula and the computed number.

=== Answer to RQ2

The generated report supports traceability in form: formulae, intermediate values and normative references are all present and the calculation path can be followed end to end. It fails traceability in substance at specific points, most importantly where the printed transformer-differential formula diverges from the RET670 requirement it cites. The traceability defect and the correctness defect of RQ1 therefore share a single root cause in the transformer-differential branch.

== RQ3 – Coverage & Appropriateness 

Overcurrent protection is the case in which #acr("SECP") does not cover the required device. The device required for the relevant planning work is the REF650, but REF650 is not selectable in the #acr("CT") and #acr("VT") adequacy-check module; the only overcurrent option offered by #acr("SECP") is the REF630. This case therefore cannot be answered by the numerical reference-model comparison used for RQ1. Instead it raises the coverage-and- equivalence question defined for RQ3: whether the dimensioning basis that #acr("SECP") applies through the REF630 substitute is equivalent to and no less onerous than, the #acr("CT") requirement published for the required REF650. Both devices pursue the same objective — the #acr("CT") must reproduce the relevant fault current accurately enough for the protection function to operate — but the two manuals express that requirement through different verification quantities.

=== REF630: burden-corrected accuracy limit factor

The REF630 application manual verifies the #acr("CT") through its accuracy class and a burden-corrected #acr("ALF"). Starting from a nameplate class such as 5P20, the rated #acr("ALF"), which applies at the rated burden, is corrected to the actual connected burden:

$ "ALF'" = "ALF"  (S_r + I_"sr"^2 R_"ct") / (S_"act" + I_"sr"^2 R_"ct") $

where $S_r$ is the rated and $S_"act"$ the actual burden. A lower actual burden yields a higher effective factor. The available $"ALF'"$ is then compared with the fault-current multiple the #acr("CT") must reproduce. The result is dimensionlessand the manual presents one common procedure for the non-directional overcurrent stages rather than separate equations per characteristic.

=== REF650: required secondary limiting #acr("emf")

The REF650 technical guide states the requirement directly as a minimum rated equivalent limiting secondary #acr("emf") $E_"al,req"$, which the selected #acr("CT") must satisfy through $E_"al" >= E_"al,req"$. For non-directional instantaneous and definite-time protection it specifies

$ E_"al,req" = 1.5 I_"op" I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_r^2) $

with $I_"op"$ the primary operate value and $S_R$ the burden of one IED input channel. In contrast to REF630, the requirement is function-specific: inverse-time protection applies a factor of twenty on the operate multiple and directional protection uses the maximum close-in fault current $I_"k,max"$. The result is a voltage rather than a factor.

=== Equivalence assessment

The two procedures are physically related: IEC 61869-2 defines both the accuracy-limit quantities of class P and PR #acrpl("CT") and the equivalent limiting #acr("emf")and the REF650 guide notes that the secondary limiting #acr("emf") $E_"ALF"$ of a class P or PR #acr("CT") is approximately equal to $E_"al"$. They are nonetheless not directly comparable in the form each manual presents them, as summarised in @tab-oc-comparison.

#figure(
  {
  set par(justify: false)
  table(
    columns: (auto, 1fr, 1.3fr),
    inset: 7pt,
    align: (left + horizon, left + horizon, left + horizon),
    table.header([Aspect],       [REF630 (substitute)],                   [REF650 (required)]),
    [Verification quantity],     [Dimensionless effective ALF'],          [Required secondary #acr("emf") $E_"al,req"$ in volts],
    [Characteristic handling],   [One common overcurrent calculation],    [Separate equation per function (instantaneous/definite-time, inverse-time, directional)],
    [Secondary burden],          [Combined actual burden in VA],          [Resistances $R_"ct" + R_L$ plus IED burden $S_R/I_r^2$],
    [Fault-current basis],       [Multiple compared against ALF'],        [Operate value, twenty-times multiple or $I_"k,max"$ per function],
  )
},
  caption: [Dimensioning basis of the REF630 substitute compared with the
    required REF650.],
) <tab-oc-comparison>

Because REF630 returns a dimensionless capability and REF650 a voltage requirement, an equivalence check is only possible after converting the REF630 #acr("CT") capability into an equivalent secondary #acr("emf") in accordance with IEC 61869-2 or vice versa. The substitute can be accepted as equivalent only if, after this conversion, its requirement is no less onerous than that of the REF650 for the same network, #acr("CT") ratio, winding and lead resistance, relay burden and pickup settings. A less onerous basis would risk an under-dimensioned #acr("CT") and is therefore treated as a blocker under the decision rule.


== RQ4 – Report Fitness for Customer Delivery

The generated report is a standardised Microsoft Word document with a cover page, table of contents, project and document information, a nomenclature section and a per-application calculation body ending in a tap-level summary. In layout and completeness it is suitable as an auditable design record: the customer receives the inputs, the derivation and the verdict in a single consistent document.

Two substantive issues nevertheless limit its fitness for delivery and both are engineering issues rather than cosmetic ones. The first is the transformer-differential formula defect of RQ1 and RQ2: the report presents an incorrect required value as an authoritative, standard-referenced result and a customer auditing the document against the RET670 manual would find that the printed formula does not match the cited clause. The second is the outdated normative reference discussed below. Neither can be remedied by a per-report manual workaround within the effort budget of the decision rule, because both originate in the tool rather than in the individual report; they are properties of every report #acr("SECP") generates for the affected function. Under the decision rule they are therefore treated as improvement-required findings for the transformer-differential case rather than as documentable limitations.

An internal inconsistency between an inline "adequate" statement and a "not adequate" summary was reported for an earlier #acr("SECP") example. It is not reproduced in the current report, whose inline verdicts and tap summaries are mutually consistent throughoutand it is therefore not carried forward as a finding of this evaluation; the earlier observation is regarded as pertaining to a superseded revision.

=== Answer to RQ4

The report is well structured and, for the line-differential case, fit for delivery subject to disclosure of the small conservative deviation. For the transformer-differential case it is not fit for delivery as generated, because it presents a numerically incorrect and standard-inconsistent required value; the deficiency is a tool-level defect and cannot be corrected within a per-report workaround.

== Cross-cutting: Outdated Normative References in #acr("SECP")

The standard-reference section of the #acr("SECP") report lists three normative documents: #acr("IEC") 61869-1, Edition 1.0, 2007; #acr("IEC") 61869-2, Edition 1.0, 2012; and #acr("IEC") TR 61869-100, Edition 1.0, 2017. Of these, the general-requirements part #acr("IEC") 61869-1:2007 has been superseded by #acr("IEC") 61869-1:2023, whereas #acr("IEC") 61869-2:2012 and #acr("IEC") TR 61869-100:2017 remain the current editions. #acr("SECP") therefore delivers, in every report, a reference to a withdrawn edition of the general-requirements standard.

This is a genuine, verifiable quality finding for the delivered document, because a design record that cites a superseded standard is weaker as an auditable reference. It is, however, a documentation-level finding and not by itself evidence that the implemented formulae are outdated: the transformer-differential and line-differential criteria the report applies are those of the current device manuals and the specific numerical deficiency identified in this evaluation is the lead-resistance double-count rather than a consequence of the superseded reference. The two findings are therefore recorded separately.

== Overall Assessment

Across the twenty directly compared cases, #acr("SECP") reproduces the reference suitability decision without exception. Line-differential protection shows close numerical agreement and a correctly formed criterion; transformer-differential protection shows a systematic conservative deviation traced to a lead-resistance double-count in the tool; overcurrent protection cannot be represented with the required device at all. The workbook's supplementary decision matrix scores the line-differential case at 0.81 and the transformer-differential case at 0.71; these values are consistent with the qualitative picture but are not used to decide releasability, which follows the decision rule case by case in the next chapter.

The strongest evidence therefore concerns numerical decision-consistency, which holds across the dataset. The weaknesses are specific and now well characterised: a formula defect that makes the transformer-differential required value numerically incorrect though conservative, a coverage gap that prevents the overcurrent case from being computed with the required device and a superseded normative reference carried in every report. These per-case outcomes are consolidated into the releasability verdict in the following chapter, where the non-compensatory rule prevents the strong line-differential result from offsetting the transformer-differential and coverage findings.
