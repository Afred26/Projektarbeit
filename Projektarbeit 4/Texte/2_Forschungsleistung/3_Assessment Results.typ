#import "@local/templat-projektarbeit:0.1.17": *
#import "../../Zusatz/acronyms.typ": acronyms

= Assessment Results

This chapter presents the results of the assessment of current-transformer calculations performed in SECP Global. The evaluation is structured according to the four research questions and a cross-cutting review of the normative references used by SECP. The quantitative assessment is based on the comparison data and decision matrices contained in _Mappe1_mit_Entscheidungsmatrix_Trafo_Diff.xlsx_. The workbook contains ten evaluated cases for transformer differential protection and ten evaluated cases for line differential protection. It also includes a separate overcurrent-protection calculation, but no corresponding SECP comparison dataset or completed decision matrix is provided for that protection function.

== RQ1 – Numerical Correctness 

=== Comparison approach

Numerical correctness was assessed by comparing the required equivalent limiting secondary electromotive force calculated in the Excel reference calculation with the corresponding SECP result. For each case, two calculation criteria were evaluated. In addition to the numerical values, the final suitability decision was compared using the available pass/fail status. The workbook reports the deviation of the governing criterion and summarizes the minimum, mean, and maximum deviations separately for transformer differential and line differential protection.

The available dataset covers five voltage and core configurations at 150 kV and 220 kV, together with five configurations at 33 kV. The same ten configurations are evaluated for transformer differential protection and line differential protection. The assessment is therefore limited to the operating points and parameter combinations included in these cases. The supplied material does not establish whether these cases represent the complete range of applications processed in SECP Global.

=== Transformer differential protection

For transformer differential protection, SECP returned higher values than the Excel reference calculation in all ten evaluated cases. The deviation of the governing criterion ranged from approximately 2.68\% to 21.98\%, with a mean deviation of approximately 8.79\%. The largest deviation occurred in case 33-5, where the governing Excel value was 85.06 V and the corresponding SECP value was 109.02 V. The smallest deviation occurred in case 33-1, in which the governing values were 332.30 V in Excel and 341.45 V in SECP.

Although the numerical values differed, the final suitability classification was consistent across the complete transformer differential dataset. Both calculation methods classified all ten cases as passing. Consequently, the numerical deviation did not change the suitability decision for any of the investigated cases. The detected deviation was consistently conservative within this dataset because SECP produced a higher required value than the Excel calculation. This conclusion applies only to the supplied cases and does not demonstrate that the same direction of deviation will occur for other system configurations.

The transformer differential decision matrix assigns 3 out of 4 points to the correctness of the calculation method, 2 out of 4 points to numerical accuracy, and 4 out of 4 points to both the safety impact of deviations and the consistency of the suitability decision. The normalized overall result is 0.7125. The conclusion recorded in the workbook is that the calculation is generally applicable to transformer differential protection, provided that the deviation is documented and a manual reference check or documented correction is applied.

The workbook does not contain a completed technical explanation in the decision-matrix justification fields. It therefore demonstrates the existence, magnitude, and direction of the numerical deviation, but it does not provide sufficient evidence to identify its underlying mathematical or implementation-related cause. Any attribution of the deviation to a specific formula, resistance treatment, input conversion, or software logic would require additional evidence. *[Information not provided]*

=== Line differential protection

For line differential protection, SECP also returned higher required values than the Excel reference calculation in all ten evaluated cases. The deviations were substantially smaller than those observed for transformer differential protection. The minimum deviation was approximately 0.095\%, the mean deviation was approximately 0.490\%, and the maximum deviation was approximately 1.454\%. The maximum occurred in case 33-5, for which the governing Excel value was 90.76 V and the corresponding SECP value was 92.09 V.

The final pass/fail decision agreed in all ten line differential cases. The 220-1, 150-1, and 150-2 cases were classified as failing by both calculation methods, while the remaining seven cases were classified as passing by both methods. The observed numerical differences therefore did not alter any suitability decision in the investigated dataset. As with the transformer differential results, the deviations were conservative because the SECP requirements were consistently higher than the Excel reference values.

The line differential decision matrix assigns 4 out of 4 points to the correctness of the calculation method, safety impact, consistency of the suitability decision, and traceability and reproducibility. Numerical accuracy and input processing receive 3 out of 4 points, while documentation and presentation quality receive 1 out of 4 points. The resulting normalized overall score is 0.8125. The workbook consequently characterizes SECP as generally applicable to line differential protection for the investigated dataset, while requiring the small conservative deviation to be documented and borderline cases to be verified by a reference calculation.

=== Overcurrent protection

The workbook contains an overcurrent-protection calculation for a REF650 application. For the documented case, the available CT limiting secondary electromotive force is 880 V, while the two calculated requirements are 352 V and 554.4 V. The governing requirement is therefore 554.4 V, and the calculation sheet records a passing result.

However, no corresponding SECP values are included for this case. The numerical agreement between the reference calculation and SECP can therefore not be evaluated for overcurrent protection from the supplied material. The available case demonstrates only the outcome of the reference calculation. *[Information not provided]*

=== Answer to RQ1

Within the investigated dataset, SECP preserved the final suitability decision for all transformer differential and line differential cases. Line differential calculations showed comparatively small conservative deviations, with a reported mean of approximately 0.49\%. Transformer differential calculations showed larger conservative deviations, with a reported mean of approximately 8.79\% and a maximum of approximately 21.98\%. The results therefore indicate a clear difference in numerical agreement between the two protection functions, even though no decision mismatch occurred in the supplied cases.

The results support the conclusion that numerical accuracy and decision consistency must be evaluated separately. A calculation may produce the same pass/fail decision as the reference method while still containing a relevant numerical deviation. The absence of decision changes in the investigated cases does not demonstrate that decision changes are impossible, particularly for cases situated close to the suitability threshold.

== RQ2 – Traceability of Formulae in the Report

The decision matrices assign 4 out of 4 points to traceability and reproducibility for both transformer differential and line differential protection. At the same time, documentation and presentation quality receive only 1 out of 4 points for both protection functions.

These ratings indicate that the workbook distinguishes between the reproducibility of the assessment and the quality of the generated documentation. The calculation sheets expose input parameters, intermediate values, the two assessment criteria, the governing required value, and the final pass/fail result. This structure allows the numerical comparison documented in the workbook to be followed. For example, the sheets display the secondary-loop parameters, calculated total burden, available limiting secondary electromotive force, criterion-specific requirements, and final assessment.

However, the supplied material does not contain the actual SECP reports. It is therefore not possible to determine whether the formulae are shown in those reports, whether variables are defined, whether values can be traced from inputs to intermediate results, or whether the displayed equation references correspond to identifiable source documents. The workbook provides SECP result values but does not reproduce the complete formula presentation or calculation path used in the SECP report. *[Information not provided]*

The recorded score of 4 out of 4 for traceability and reproducibility cannot be fully substantiated from the visible justification fields because these fields are not completed. In particular, the basis used to distinguish the high traceability score from the low documentation and presentation score is not documented. This does not necessarily constitute a contradiction because the two categories assess different properties, but the absence of written justifications limits the transparency of the scoring decision.

=== Answer to RQ2

The supplied calculation workbook supports traceability of the independent comparison because it records the principal inputs, intermediate calculations, individual criteria, and final results. It does not provide sufficient evidence to assess the traceability of formulae within the SECP-generated customer report itself. A definitive answer to RQ2 would require the relevant SECP reports and a documented mapping between each reported result, its formula, its input variables, and its normative or manufacturer-specific basis.

== RQ3 – Coverage & Appropriateness 

Overcurrent protection is the case in which #acr("SECP") does not cover the required device. The device required for the relevant planning work is the REF650, but REF650 is not selectable in the #acr("CT") and #acr("VT") adequacy-check module; the only overcurrent option offered by #acr("SECP") is the REF630. This case therefore cannot be answered by the numerical reference-model comparison used for RQ1. Instead it raises the coverage-and- equivalence question defined for RQ3: whether the dimensioning basis that #acr("SECP") applies through the REF630 substitute is equivalent to, and no less onerous than, the #acr("CT") requirement published for the required REF650. Both devices pursue the same objective — the #acr("CT") must reproduce the relevant fault current accurately enough for the protection function to operate — but the two manuals express that requirement through different verification quantities.

=== REF630: burden-corrected accuracy limit factor

The REF630 application manual verifies the #acr("CT") through its accuracy class and a burden-corrected #acr("ALF"). Starting from a nameplate class such as 5P20, the rated #acr("ALF"), which applies at the rated burden, is corrected to the actual connected burden:

$ "ALF'" = "ALF"  (S_r + I_"sr"^2 R_"ct") / (S_"act" + I_"sr"^2 R_"ct") $

where $S_r$ is the rated and $S_"act"$ the actual burden. A lower actual burden yields a higher effective factor. The available $"ALF'"$ is then compared with the fault-current multiple the #acr("CT") must reproduce. The result is dimensionless, and the manual presents one common procedure for the non-directional overcurrent stages rather than separate equations per characteristic.

=== REF650: required secondary limiting #acr("emf")

The REF650 technical guide states the requirement directly as a minimum rated equivalent limiting secondary #acr("emf") $E_"al,req"$, which the selected #acr("CT") must satisfy through $E_"al" >= E_"al,req"$. For non-directional instantaneous and definite-time protection it specifies

$ E_"al,req" = 1.5 I_"op" I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_r^2) $

with $I_"op"$ the primary operate value and $S_R$ the burden of one IED input channel. In contrast to REF630, the requirement is function-specific: inverse-time protection applies a factor of twenty on the operate multiple, and directional protection uses the maximum close-in fault current $I_"k,max"$. The result is a voltage rather than a factor.

=== Equivalence assessment

The two procedures are physically related: IEC 61869-2 defines both the accuracy-limit quantities of class P and PR #acrpl("CT") and the equivalent limiting #acr("emf"), and the REF650 guide notes that the secondary limiting #acr("emf") $E_"ALF"$ of a class P or PR #acr("CT") is approximately equal to $E_"al"$. They are nonetheless not directly comparable in the form each manual presents them, as summarised in @tab-oc-comparison.

#figure(
  {
  set par(justify: false)
  table(
    columns: (auto, 1fr, 1.3fr),
    inset: 7pt,
    align: (left + horizon, left + horizon, left + horizon),
    table.header([Aspect], [REF630 (substitute)], [REF650 (required)]),
    [Verification quantity], [Dimensionless effective ALF'],            [Required secondary #acr("emf") $E_"al,req"$ in volts],
    [Characteristic handling], [One common overcurrent calculation],    [Separate equation per function (instantaneous/definite-time, inverse-time, directional)],
    [Secondary burden], [Combined actual burden in VA],                 [Resistances $R_"ct" + R_L$ plus IED burden $S_R\/I_r^2$],
    [Fault-current basis], [Multiple compared against ALF'],            [Operate value, twenty-times multiple, or $I_"k,max"$ per function],
  )
},
  caption: [Dimensioning basis of the REF630 substitute compared with the
    required REF650.],
) <tab-oc-comparison>

Because REF630 returns a dimensionless capability and REF650 a voltage requirement, an equivalence check is only possible after converting the REF630 #acr("CT") capability into an equivalent secondary #acr("emf") in accordance with IEC 61869-2, or vice versa. The substitute can be accepted as equivalent only if, after this conversion, its requirement is no less onerous than that of the REF650 for the same network, #acr("CT") ratio, winding and lead resistance, relay burden and pickup settings. A less onerous basis would risk an under-dimensioned #acr("CT") and is therefore treated as a blocker under the decision rule.

== RQ4 – Report Fitness for Customer Delivery

The decision matrices assign only 1 out of 4 points to documentation and presentation quality for both transformer differential and line differential protection. This is the lowest category score in both matrices and therefore identifies report quality as the weakest assessed area in the workbook.

However, the justification, required measure, error direction, and status fields associated with this category are not completed. The workbook therefore records a low assessment score but does not document the individual report defects that led to that score. It does not specify whether the identified limitations concern formula presentation, variable descriptions, units, source references, layout, terminology, result interpretation, or another aspect of the report.

The supplied material also does not include the actual SECP customer reports or defined customer-delivery acceptance criteria. As a result, the assessment cannot verify whether a customer can independently understand the calculation basis, identify the governing criterion, interpret the suitability decision, or recognize known calculation deviations and limitations. *[Information not provided]*

The quantitative results nevertheless demonstrate one requirement relevant to customer delivery. For transformer differential protection, the numerical deviation is materially larger than for line differential protection even though the decision remains unchanged in all investigated cases. A customer-facing report that presents only the final pass/fail decision would not communicate this difference in numerical agreement. This observation supports the workbook’s stated requirement for documented correction or manual reference verification in transformer differential applications.

=== Answer to RQ4

Based on the recorded assessment score, the documentation and presentation quality is insufficiently developed compared with the numerical and decision-related categories. A definitive judgment on customer-delivery fitness is not possible without the SECP reports and explicit acceptance criteria. The available material supports only the narrower conclusion that customer-facing documentation should disclose relevant deviations and any required manual verification. The specific report changes needed to achieve customer-delivery readiness are *[Information not provided]*.

== Cross-cutting: Outdated Normative References in SECP

The supplied literature includes _IEC 61869-100.pdf_, identified as IEC TR 61869-100, Edition 1.0, published in 2017. The document states that IEC 60044-6:1992 was withdrawn and replaced by IEC 61869-2:2012. It also explains that IEC 60044-6 is retained only for backward compatibility in parts of the technical discussion.

This information establishes that an unqualified reliance on IEC 60044-6 may represent the use of a withdrawn reference. However, the supplied material does not show which standards or editions are referenced by SECP Global or by its generated reports. It is therefore not possible to conclude from the available evidence that SECP actually cites IEC 60044-6 or any other outdated publication. *[Information not provided]*

The available SECP comparison workbook contains equation identifiers and calculation results but does not map those equations to complete normative references, edition years, clauses, or manufacturer manuals. Consequently, the normative basis of the individual SECP calculations cannot be verified from the workbook alone.

=== Cross-cutting conclusion

The provided literature demonstrates that withdrawn and replacement standards must be distinguished carefully. Nevertheless, no evidence was supplied that identifies the normative references currently implemented or displayed by SECP. A conclusive assessment would require the normative-reference section of the SECP reports or another authoritative record of the standards and editions used by the software.

== Overall Assessment

The comparison demonstrates that SECP produced the same suitability decision as the Excel reference calculation in all twenty directly compared cases. Line differential protection showed close numerical agreement, whereas transformer differential protection showed substantially greater conservative deviations. The normalized decision-matrix scores were 0.8125 for line differential protection and 0.7125 for transformer differential protection.

The strongest evidence concerns numerical correctness and consistency of the final suitability decision. The available evidence for formula traceability, coverage completeness, customer-delivery fitness, and the normative references actually used by SECP is incomplete. These research questions can therefore be answered only partially from the provided material. In particular, the absence of the underlying SECP reports prevents a direct assessment of formula presentation, report clarity, and normative-reference accuracy.

Overall, the supplied results support the use of SECP for the investigated line differential cases, subject to documentation of the observed conservative deviation and reference verification for borderline cases. For the investigated transformer differential cases, the consistent suitability decisions are positive, but the larger numerical deviations require explicit documentation and an independent reference check or documented correction. This conclusion is limited to the configurations contained in the supplied workbook and must not be generalized to untested protection functions or operating conditions.