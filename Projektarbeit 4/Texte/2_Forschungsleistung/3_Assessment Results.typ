#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms
#set text(hyphenate: false)

= Assessment Results <assessment>

This chapter presents the results of the assessment, organized by the four research questions and closing with a review of the normative references used by #acr("SECP"). Three application device cases are examined: Transformer differential protection with the RET670, line differential protection with the RED670 and overcurrent protection with a REF650 requirement. The first two are computable in #acr("SECP") and assessed against the independent reference calculation, the third exercises the coverage question and is assessed through RQ3.

Two sources of evidence are used: The comparison Excel sheet @Excel_attach, which contains ten transformer differential and ten line differential cases and the #acr("SECP") calculation report for the same cases.

== RQ1 - Numerical Correctness

Numerical correctness is assessed by comparing the required equivalent limiting secondary #acr("emf") computed by #acr("SECP") with the reference value of the independent Excel calculation for the same input set. For each case two criteria are evaluated, the governing value is the larger of the two and the resulting pass/fail decision is compared in addition to the numbers. The dataset covers 220 kV, 150 kV and 33 kV and the assessment is limited to these operating points.

*Transformer differential protection.*\ 
#acr("SECP") returns higher required values than the reference in all ten cases. The deviation of the governing criterion ranges from approximately 2.8% to 28.2%, with a average deviation of approximately 10%. The suitability classification is nevertheless identical in every case. Both methods pass all ten, so the deviation changes no suitability decision in the dataset.

The cause can be identified from the detailed report. #acr("SECP") evaluates the governing criterion with a secondary loop resistance of the form, 

$ R_"ct" + 2 R_"lead" + R_"relay" $ 

whereas the reference calculation and the underlying RET670 requirement use a single lead resistance. 

$ R_"ct" + R_L + S_R / I_"sr"^2 $<Widerstand> The quantity $R_"lead"$

printed by #acr("SECP") is already computed as a loop resistance over twice the cable length, so applying the further factor of two counts the lead resistance twice.

For case 220-1 the report evaluates 

$ 30 * 577.35 * (1/800) * (7 + 2 * 1.0092 + 0.02) = 195.69 " V" $ 

against the reference value of 172.72 V, a difference of 13.3%.

The defect is confined to the transformer differential branch and is conservative in direction: An over estimated required value can only reject an adequate #acr("CT") or demand a larger one, never accept an inadequate one. In the three level scheme it is a computational defect in the transformer differential secondary loop term at the cause level, a positive relative deviation of the governing criterion of up to approximately 28.2% at the effect level and a bias towards safety at the #acr("IEC") 61869 benchmark level, since the adequacy inequality $E_"al" >= E_"al,req"$ is only ever made harder to satisfy. #cite(<IEEE_1044>) #cite(<IEC_61869_2>)

*Line differential protection.*\ 
#acr("SECP") also returns slightly higher required values in all ten cases, but the deviations are far smaller: A minimum of approximately 0.1%, a average deviation of approximately 0.5% and a maximum of approximately 1.5%. The pass/fail decision agrees in all ten cases, with 220-1, 150-1 and 150-2 classified as failing by both methods and the remaining seven as passing. Here the criterion applies the lead resistance once, in agreement with the RED670 requirement and the reference calculation. The residual deviation is attributable to the different basis used for calculating the cable resistance. #acr("SECP") uses a standard value for the conductor resistance, whereas the Excel reference calculation derives the resistance from the specific electrical resistivity of copper. As a result, the cable resistance calculated by #acr("SECP") is slightly higher than the corresponding value obtained from the Excel calculation. The influence of this deviation on the governing criterion remains small, since the cable resistance represents only a minor part of the total secondary loop resistance in the line differential cases.

*Overcurrent protection.*\ 
This case cannot be compared numerically in the same way: The required device is not selectable in #acr("SECP") and similar devices are not acceptable substitutes, because the calculations are different. This case is therefore assessed through the coverage and equivalence analysis of RQ3.

*Answer to RQ1.*\
Within the dataset, #acr("SECP") preserves the final suitability decision in all twenty compared cases and the line differential results agree closely. The transformer differential deviation is conservative and flips no decision, but the reported required value is numerically incorrect and a case close to the threshold could be classified differently. The transformer differential calculation is therefore decision consistent but not numerically correct.

== RQ2 - Traceability of Formulae in the Report

In its structure, the #acr("SECP") detailed report is highly traceable. For each tap it prints the input data, the lead resistance calculation with its normative reference, the relay parameter and fault calculations, the two required #acr("emf") criteria with their substituted values, the proposed #acr("CT") capability and the final adequacy comparison. The governing device requirement is named explicitly. A reader can in principle follow every reported result from the inputs to the verdict. Nevertheless, two traceability weaknesses were found. 

1. The displayed transformer differential formula contains the lead resistance double count identified under RQ1, so the printed equation does not correspond to the single lead resistance requirement of the RET670 clause it cites. The report is internally traceable, but it is not faithful to its own normative reference. 

2. In the line differential section the single phase criteria are printed with a $2 R_"lead"$ term while the accompanying numerical result follows the single lead value, a mismatch between the displayed formula and the computed number.

*Answer to RQ2.*\
The generated report supports traceability in its form: Formulae, intermediate values and normative references are present and the calculation path can be followed end to end. At specific points, however, the content does not live up to this form, most importantly where the printed transformer differential formula diverges from the RET670 requirement it cites. The traceability defect and the correctness defect of RQ1 thus share a single root cause in the transformer differential branch.

== RQ3 - Coverage & Appropriateness

Overcurrent protection is the case in which #acr("SECP") does not cover the required device. The REF650 required for the relevant planning work is not selectable in the #acr("CT") and #acr("VT") adequacy check module. The only overcurrent option offered is the REF630. The question is therefore whether the dimensioning basis that #acr("SECP") applies through the REF630 substitute is equivalent to and no less onerous than, the #acr("CT") requirement published for the required REF650. Both devices pursue the same objective, namely that the #acr("CT") must reproduce the relevant fault current accurately enough for the protection function to operate, but they express that requirement through different verification quantities.

*REF630: Burden corrected accuracy limit factor.*\
The REF630 application manual verifies the #acr("CT") through its accuracy class and a burden corrected #acr("ALF"). Starting from a nameplate class such as 5P20, the rated #acr("ALF") (which applies at the rated burden) is corrected to the actual connected burden,

$ "ALF'" = "ALF"  (S_r + I_"sr"^2 R_"ct") / (S_"act" + I_"sr"^2 R_"ct") $

where $S_r$ is the rated and $S_"act"$ the actual burden. A lower actual burden yields a higher effective factor. The available $"ALF'"$ is then compared with the fault current multiple the #acr("CT") must reproduce. The result is dimensionless and the manual presents one common procedure for the non directional overcurrent stages rather than separate equations per characteristic.

*REF650: Required secondary limiting #acr("emf").*\
The REF650 technical guide states the requirement directly as a minimum rated equivalent limiting secondary #acr("emf") $E_"al,req"$, which the selected #acr("CT") must satisfy through $E_"al" >= E_"al,req"$. For non directional instantaneous and definite time protection it specifies

$ E_"al,req" = 1.5 I_"op" I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_"sr"^2) $

with $I_"op"$ the primary operate value. In contrast to REF630, the requirement is function specific: Inverse time protection applies a factor of 20 on the operate multiple and directional protection uses the maximum close in fault current $I_"k,max"$.

*Equivalence assessment.*\
The two procedures are physically related: #acr("IEC") 61869-2 defines both the accuracy limit quantities of class P and PR #acrpl("CT") and the equivalent limiting #acr("emf") and the REF650 guide notes that the secondary limiting #acr("emf") $E_"ALF"$ of a class P or PR #acr("CT") is approximately equal to $E_"al"$. In the form each manual presents them, however, they are not directly comparable, as summarized in @tab-oc-comparison.

#figure(
  {
  set par(justify: false)
  table(
    columns: (1.25fr, 2fr, 3fr),
    inset: 7pt,
    align: (left + horizon, left + horizon, left + horizon),
    table.header([*Aspect*],       [*REF630 (substitute)*],                   [*REF650 (required)*]),
    [Verification quantity],     [Dimensionless effective ALF'],          [Required secondary #acr("emf") $E_"al,req"$ in volts],
    [Characteristic handling],   [One common overcurrent calculation],    [Separate equation per function (instantaneous/definite time, inverse time, directional)],
    [Fault current basis],       [Multiple compared against ALF'],        [Operate value, twenty times multiple or $I_"k,max"$ per function],
  )
},
  caption: [Dimensioning basis of the REF630 substitute compared with the required REF650.],
) <tab-oc-comparison>

Since REF630 returns a dimensionless capability and REF650 a voltage requirement, an equivalence check is not possible. 

== RQ4 - Report Fitness for Customer Delivery

Apart from the deficiencies identified in RQ1, RQ2 and the outdated normative references discussed below, the generated report is generally complete. It contains the project inputs, intermediate calculations, applied criteria and final adequacy verdicts in a single document and therefore provides the information required for engineering review and audit purposes.

The standards referenced by #acr("SECP") are: 
- #acr("IEC") 61869-1 Edition 1.0 2007
- #acr("IEC") 61869-2 Edition 1.0 2012
- #acr("IEC") TR 61869-100 Edition 1.0 2017
- #acr("IEC") 60287-1:2006. 
Of these, the general-requirements part #acr("IEC") 61869-1:2007 has been superseded by #acr("IEC") 61869-1:2023 and #acr("IEC") 60287-1 got a new revision in 2023, whereas #acr("IEC") 61869-2:2012 and #acr("IEC") TR 61869-100:2017 remain the current editions. #acr("SECP") therefore delivers, in every report, references to withdrawn editions of these standards.

However, the report quality is significantly reduced by shortcomings in formatting, readability and maintainability. Although the output is generated as a Microsoft Word document, extensive use of automatically generated formula fields leads to numerous layout issues. In several locations, formula fields overlap or interfere with surrounding content, making subsequent editing difficult and time consuming. 

This problem becomes increasingly severe for large projects, where reports can exceed a hundred pages and contain a large number of embedded formula fields. As a result, document navigation and editing performance in Word is noticeably degraded. Therefore, even the small deficiencies identified under RQ1 and RQ2 cannot be corrected in the generated document with reasonable effort.

Additional formatting deficiencies are present throughout the report. Section breaks are frequently created through manual spacing rather than proper page break mechanisms, causing chapter headings to appear in arbitrary positions on a page rather than at the beginning of a new section. In some cases, a heading is displayed at the bottom of a page while the associated content continues on the next page. 

Minor visual artefacts, such as isolated punctuation marks, are also present in several locations. Furthermore, summary tables are occasionally split across page boundaries despite containing only a few rows. In larger input data tables, long text strings are wrapped poorly, reducing readability. Examples include application names being broken across multiple lines without meaningful separation. In addition, comparable tables do not consistently use the same dimensions or formatting, resulting in an uneven visual appearance.

These observations do not affect the mathematical completeness of the report. Nevertheless, they reduce readability, professional presentation quality and the efficiency with which the document can be reviewed, maintained and modified.

*Answer to RQ4.*\
The report contains the information necessary for engineering assessment and audit purposes and is generally complete. However, its suitability for customer delivery is limited by substantial formatting and maintainability issues. While the numerical defect represents a tool level engineering issue, the formatting findings constitute documentation quality deficiencies that should be addressed to improve report usability and professional presentation.