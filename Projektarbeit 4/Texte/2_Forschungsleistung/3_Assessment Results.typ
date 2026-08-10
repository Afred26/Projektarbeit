#import "@local/templat-projektarbeit:0.1.17": *
#import "../../Zusatz/acronyms.typ": acronyms

= Assessment Results

== RQ1 – Numerical Correctness 

== RQ2 – Traceability of Formulae in the Report

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

== Cross-cutting: Outdated Normative References in SECP