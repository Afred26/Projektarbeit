#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Assessment Results

This chapter presents the results of the assessment, organized by the four research questions and closing with a review of the normative references used by #acr("SECP"). Three application–device cases are examined: transformer differential protection with the RET670, line differential protection with the RED670 and overcurrent protection with a REF650 requirement. The first two are computable in #acr("SECP") and assessed against the independent reference model; the third exercises the coverage question and is assessed through RQ3.

Two sources of evidence are used: the comparison workbook @Excel_Calc, which contains ten transformer-differential and ten line-differential cases alongside their #acr("SECP") counterparts and a #acr("SECP") detailed calculation report, which shows the formulae, intermediate values and normative references actually printed. Releasability is decided by the non-compensatory decision rule; the weighted decision matrix contained in the workbook is retained only as a supplementary indicator and does not by itself determine the verdict.

== RQ1 – Numerical Correctness

Numerical correctness is assessed by comparing the required equivalent limiting secondary #acr("emf") computed by #acr("SECP") with the reference-model value for the same input set. For each case two criteria are evaluated, the governing value is the larger of the two and the resulting pass/fail decision is compared in addition to the numbers. The dataset covers 220 kV, 150 kV and 33 kV; the assessment is limited to these operating points.

*Transformer differential protection.* #acr("SECP") returns higher required values than the reference in all ten cases. The deviation of the governing criterion ranges from approximately 2.68% to 21.98%, with a mean of approximately 8.79%; the largest is case 33-5 (reference 85.06 V against #acr("SECP") 109.02 V), the smallest case 33-1 (332.30 V against 341.45 V). The suitability classification is nevertheless identical in every case: both methods pass all ten, so the deviation changes no suitability decision in the dataset.

The cause can be identified from the detailed report. #acr("SECP") evaluates the governing criterion with a secondary-loop resistance of the form $R_"ct" + 2 R_"lead" + R_"relay"$, whereas the reference model and the underlying RET670 requirement use a single lead resistance, $R_"ct" + R_L + S_R \/ I_r^2$. #cite(<RET670_Application_Manual>) The quantity $R_"lead"$ printed by #acr("SECP") is already computed as a loop resistance over twice the cable length, so applying the further factor of two counts the lead resistance twice. For case 220-1 the report evaluates $30 * 577.35 * (1\/800) * (7 + 2 * 1.0092 + 0.02) = 195.69 " V"$ against the reference value of 172.72 V, a difference of 13.3%. The effect scales with the ratio of lead resistance to winding resistance, which explains why the deviation is largest in the 33 kV cases, where the winding resistance is comparatively small.

The defect is confined to the transformer-differential branch and is conservative in direction: an over-estimated required value can only reject an adequate #acr("CT") or demand a larger one, never accept an inadequate one. In the three-level scheme it is a computational defect in the transformer-differential secondary-loop term at the cause level (#acr("IEEE") 1044), a positive relative deviation of the governing criterion of up to approximately 22% at the effect level and a bias towards safety at the #acr("IEC") 61869 benchmark level, since the adequacy inequality $E_"al" >= E_"al,req"$ is only ever made harder to satisfy. #cite(<IEEE_1044>), #cite(<IEC_61869_2>)

*Line differential protection.* #acr("SECP") also returns slightly higher required values in all ten cases, but the deviations are far smaller: a minimum of approximately 0.10%, a mean of approximately 0.49% and a maximum of approximately 1.45% (case 33-5). The pass/fail decision agrees in all ten cases, with 220-1, 150-1 and 150-2 classified as failing by both methods and the remaining seven as passing. Here the criterion applies the lead resistance once, $R_"ct" + R_L + S_R \/ I_r^2$, in agreement with the RED670 requirement and the reference model; the residual deviation is attributable to the cable-resistance basis rather than the loop term. #cite(<RED670_Application_Manual>) #acr("SECP") derives the lead resistance from a rated direct-current resistance of $4.61 Ω/"km"$ with the temperature correction of #acr("IEC") 60287-1 #cite(<IEC_60287_1>), whereas the reference model uses a marginally lower reference resistivity. This explains the systematic difference of roughly five percent in the lead resistance; its effect on the governing criterion remains small, because the lead resistance is only a minor part of the total secondary-loop resistance in the line-differential cases.

*Overcurrent protection.* This case cannot be compared numerically in the same way: the required device (REF650, expressed as a required secondary #acr("emf")) is not selectable in #acr("SECP") and the tool computes the case through the REF630 substitute using a burden-corrected accuracy limit factor, so the two methods do not produce the same quantity. This case is therefore assessed through the coverage-and-equivalence analysis of RQ3.

*Answer to RQ1.* Within the dataset, #acr("SECP") preserves the final suitability decision in all twenty compared cases and the line-differential results agree closely. The transformer-differential deviation is conservative and flips no decision, but the reported required value is numerically incorrect and a case close to the threshold could be classified differently. The transformer-differential calculation is therefore decision-consistent but not numerically correct.

== RQ2 – Traceability of Formulae in the Report

In its structure, the #acr("SECP") detailed report is highly traceable. For each tap it prints the input data, the lead-resistance calculation with its normative reference, the relay-parameter and fault calculations, the two required-#acr("emf") criteria with their substituted values, the proposed #acr("CT") capability and the final adequacy comparison. The governing device requirement is named explicitly (the RET670 clause for the transformer-differential criteria and #acr("IEC") 61869-100 for the conversion of the accuracy limit factor to a knee-point value). #cite(<SECP_User_Manual>), #cite(<RET670_Application_Manual>), #cite(<IEC_61869_100>) A reader can in principle follow every reported result from the inputs to the verdict.

Nevertheless, three traceability weaknesses were found. First, the displayed transformer-differential formula contains the lead-resistance double-count identified under RQ1, so the printed equation does not correspond to the single-lead-resistance requirement of the RET670 clause it cites. The report is internally traceable, but it is not faithful to its own normative reference. Second, #acr("SECP") labels the proposed capability as a knee-point voltage while actually computing the secondary limiting #acr("emf") $E_"ALF" = "ALF" * I_"sr" * (R_"ct" + S_n \/ I_"sr"^2)$; per #acr("IEC") 61869-100 the knee-point #acr("emf") is lower than $E_"al"$ by the core-material factor, so the terminology mixes two distinct quantities. #cite(<IEC_61869_100>) Third, in the line-differential section the single-phase criteria are printed with a $2 R_"lead"$ term while the accompanying numerical result follows the single-lead value, a mismatch between the displayed formula and the computed number.

*Answer to RQ2.* The generated report supports traceability in its form: formulae, intermediate values and normative references are present and the calculation path can be followed end to end. At specific points, however, the content does not live up to this form, most importantly where the printed transformer-differential formula diverges from the RET670 requirement it cites. The traceability defect and the correctness defect of RQ1 thus share a single root cause in the transformer-differential branch.

== RQ3 – Coverage & Appropriateness

Overcurrent protection is the case in which #acr("SECP") does not cover the required device. The REF650 required for the relevant planning work is not selectable in the #acr("CT") and #acr("VT") adequacy-check module; the only overcurrent option offered is the REF630. The question is therefore whether the dimensioning basis that #acr("SECP") applies through the REF630 substitute is equivalent to, and no less onerous than, the #acr("CT") requirement published for the required REF650. Both devices pursue the same objective, namely that the #acr("CT") must reproduce the relevant fault current accurately enough for the protection function to operate, but they express that requirement through different verification quantities.

*REF630: burden-corrected accuracy limit factor.* The REF630 application manual verifies the #acr("CT") through its accuracy class and a burden-corrected #acr("ALF"). Starting from a nameplate class such as 5P20, the rated #acr("ALF") (which applies at the rated burden) is corrected to the actual connected burden,

$ "ALF'" = "ALF"  (S_r + I_"sr"^2 R_"ct") / (S_"act" + I_"sr"^2 R_"ct") $

where $S_r$ is the rated and $S_"act"$ the actual burden; a lower actual burden yields a higher effective factor. The available $"ALF'"$ is then compared with the fault-current multiple the #acr("CT") must reproduce. The result is dimensionless and the manual presents one common procedure for the non-directional overcurrent stages rather than separate equations per characteristic.

*REF650: required secondary limiting #acr("emf").* The REF650 technical guide states the requirement directly as a minimum rated equivalent limiting secondary #acr("emf") $E_"al,req"$, which the selected #acr("CT") must satisfy through $E_"al" >= E_"al,req"$. For non-directional instantaneous and definite-time protection it specifies

$ E_"al,req" = 1.5 I_"op" I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_r^2) $

with $I_"op"$ the primary operate value and $S_R$ the burden of one #acr("IED") input channel. In contrast to REF630, the requirement is function-specific: inverse-time protection applies a factor of twenty on the operate multiple and directional protection uses the maximum close-in fault current $I_"k,max"$. The result is a voltage rather than a factor.

*Equivalence assessment.* The two procedures are physically related: #acr("IEC") 61869-2 defines both the accuracy-limit quantities of class P and PR #acrpl("CT") and the equivalent limiting #acr("emf") and the REF650 guide notes that the secondary limiting #acr("emf") $E_"ALF"$ of a class P or PR #acr("CT") is approximately equal to $E_"al"$. In the form each manual presents them, however, they are not directly comparable, as summarized in @tab-oc-comparison.

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

Since REF630 returns a dimensionless capability and REF650 a voltage requirement, an equivalence check is only possible after converting the REF630 #acr("CT") capability into an equivalent secondary #acr("emf") in accordance with #acr("IEC") 61869-2 or vice versa. The substitute can be accepted as equivalent only if, after this conversion, its requirement is no less onerous than that of the REF650 for the same network, #acr("CT") ratio, winding and lead resistance, relay burden and pickup settings. A less onerous basis would risk an under-dimensioned #acr("CT") and is therefore treated as a blocker under the decision rule.

== RQ4 – Report Fitness for Customer Delivery

The generated report has the standardized structure already described for the #acr("SECP") process: a Microsoft Word document ending, per application, in a tap-level summary. In layout and completeness it is suitable as an auditable design record: the customer receives the inputs, the derivation and the verdict in a single consistent document.

However, two substantive engineering issues limit its fitness for delivery: the transformer-differential formula defect of RQ1 and RQ2, through which the report presents an incorrect required value as an authoritative, standard-referenced result, and the outdated normative reference discussed below. Neither can be remedied by a per-report manual workaround within the effort budget of the decision rule, because both originate in the tool and recur in every report generated for the affected function. They are therefore treated as improvement-required findings for the transformer-differential case, not as documentable limitations.

An internal inconsistency between an inline “adequate” statement and a “not adequate” summary was reported for an earlier #acr("SECP") example. It is not reproduced in the current report, whose inline verdicts and tap summaries are consistent with each other throughout. It is therefore regarded as pertaining to a superseded revision and not carried forward as a finding of this evaluation.

*Answer to RQ4.* The report is well structured and, for the line-differential case, fit for delivery subject to disclosure of the small conservative deviation. For the transformer-differential case it is not fit for delivery as generated, because it presents a numerically incorrect and standard-inconsistent required value; the deficiency is a tool-level defect and cannot be corrected within a per-report workaround.

== Cross-cutting: Outdated Normative References in #acr("SECP")

The standard-reference section of the #acr("SECP") report lists three normative documents: #acr("IEC") 61869-1, Edition 1.0, 2007; #acr("IEC") 61869-2, Edition 1.0, 2012; and #acr("IEC") TR 61869-100, Edition 1.0, 2017. Of these, the general-requirements part #acr("IEC") 61869-1:2007 has been superseded by #acr("IEC") 61869-1:2023 #cite(<IEC_61869_1>), whereas #acr("IEC") 61869-2:2012 and #acr("IEC") TR 61869-100:2017 remain the current editions. #acr("SECP") therefore delivers, in every report, a reference to a withdrawn edition of the general-requirements standard.

This is a genuine, verifiable quality finding, since a design record that cites a superseded standard is weaker as an auditable reference. It is, however, a documentation-level finding and not evidence that the implemented formulae are outdated: the criteria the report applies are those of the current device manuals and the numerical deficiency identified in this evaluation is the lead-resistance double-count, not a consequence of the superseded reference. The two findings are therefore recorded separately.
