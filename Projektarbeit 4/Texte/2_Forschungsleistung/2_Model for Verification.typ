#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Reference Model for Independent Verification

The reference model provides a calculation basis independent of #acr("SECP") Global, used to assess the correctness and numerical consistency of its current-transformer calculations. It is implemented in Microsoft Excel and represents the relevant #acr("CT") parameters, secondary-circuit quantities, protection-specific criteria and final suitability decision in a transparent structure. The description is based on the RET670 and RED670 application manuals, on #acr("IEC") 61869-2 and #acr("IEC") TR 61869-100 and on the calculation workbook @Excel_Calc.

== Basis in the Device Manuals and the #acr("IEC") 61869 Series

The suitability criteria implemented in the model are not taken from the #acr("IEC") 61869 series directly. Modern numerical protection devices publish their #acr("CT") requirements in their own application manuals, stated as a required rated equivalent limiting secondary #acr("emf") $E_"al,req"$ that the selected #acr("CT") must satisfy. The reference model therefore implements the published requirements of the two devices under evaluation — the RET670 for transformer differential protection and the RED670 for line differential protection. #cite(<RET670_Application_Manual>), #cite(<RED670_Application_Manual>) The role of the standards is a different one: #acr("IEC") 61869-2 defines the quantities these requirements are expressed in, such as $E_"al"$ and the secondary-loop resistance and #acr("IEC") TR 61869-100 provides the conversion between the #acr("CT") class data and the limiting #acr("emf"). #cite(<IEC_61869_2>), #cite(<IEC_61869_100>)

The available #acr("CT") capability is the part that rests on the standards. It uses the secondary-loop resistance $R_s = R_"ct" + R_b$ of #acr("IEC") 61869-2 and the class P and PR limiting secondary #acr("emf") of /*@eq-ealf*/, in which the accuracy limit factor is the ratio between the limiting #acr("emf") and the #acr("emf") at rated current and burden (written $"ALF"$ to match the workbook). The rated burden is given in volt-amperes, so its impedance follows from $Z_("b,n") = S_n / I_("sr")^2$ and the available limiting #acr("emf") becomes

$ E_("ALF,available") = "ALF" * I_("sr") (R_("ct") + S_n / I_("sr")^2) $

consistent with the values labelled “Available #acr("CT") Eal” in the workbook. For sheet “220 - 1” (accuracy limit factor 20, $I_"sr"$ 1 A, $R_"ct"$ 7 Ω, $S_n$ 30 VA) this gives $20 * 1 * (7 + 30) = 740 " V"$, matching the displayed value.

The actual connected secondary circuit is represented separately, as

$ R_("sec") = R_("ct") + R_L + S_R / I_("sr")^2 $

where $R_L$ is the secondary cable resistance and $S_R$ the input burden of the protection device. This is the form in which both device manuals state their requirement equations. For “220 - 1” the values $R_"ct" = 7 " Ω"$, $R_L = 0.9577 " Ω"$, $S_R = 0.02 " VA"$ and $I_"sr" = 1 " A"$ reproduce the displayed total secondary burden of $7.9777 " Ω"$. This is consistent with #acr("IEC") 61869-2, which defines the total burden as the external burden plus the internal winding resistance (permissibly its measured direct-current value) and the secondary induced #acr("emf") as the sum of the terminal voltage and the winding-resistance drop. #acr("IEC") 61869-100 further notes that the limiting #acr("emf") alone cannot describe every aspect of #acr("CT") accuracy; two PR specifications with similar limiting #acr("emf") need not produce the same errors. The model therefore treats it as a dimensioning quantity for the comparison, not as a complete performance representation.

*Transformer differential protection (RET670).* The workbook evaluates transformer differential protection through the two required limiting-#acr("emf") criteria of the RET670 application manual, taking the greater as governing: one referred to the transformer rated current, one to the maximum through-fault current passing two main #acr("CT")s and the transformer. The corresponding currents are

$ I_("rt") = S_T / (sqrt(3) U_n) $

and

$ I_("tf") = I_"rt" / (Z_T / 100) $

where $S_T$ is the transformer rating, $U_n$ the nominal system voltage and $Z_T$ the impedance in percent; for “220 - 1” (220 MVA, 220 kV, 23 %) they give approximately 577.350 A and 2510.219 A, matching the calculation sheet. The RET670 manual requires a rated equivalent limiting secondary #acr("emf") $E_"al"$ that exceeds the larger of #cite(<RET670_Application_Manual>)

$ E_("al,req,1") = 30 dot I_("rt") dot I_("sr") / I_("pr") dot (R_("ct") + R_L + S_R / I_r^2) $ <eq-ret-573>

and

$ E_("al,req,2") = 2 dot I_("tf") dot I_("sr") / I_("pr") dot (R_("ct") + R_L + S_R / I_r^2) $ <eq-ret-574>

where $I_r$ is the rated current of the protection #acr("IED") and $S_R$ the burden of one #acr("IED") input channel. These are Equation 573 and Equation 574 of the manual; the factors 30 and 2 are the manufacturer's device-specific oversizing factors, not #acr("IEC") 61869-2 quantities. #cite(<RET670_Application_Manual>) For “220 - 1”, with the total secondary burden of 7.9777 Ω, $I_"pr" = 800 " A"$ and $I_"sr" = 1 " A"$, they evaluate to 172.72 V and 50.06 V, matching the workbook (172.723 V and 50.065 V).

*Line differential protection (RED670).* The line-differential criteria are taken from the RED670 application manual in the same way. The manual requires an $E_"al"$ larger than the maximum of #cite(<RED670_Application_Manual>)

$ E_("al,req,601") = I_("k,max") dot I_("sr") / I_("pr") dot (R_("ct") + R_L + S_R / I_r^2) $ <eq-red-601>

and

$ E_("al,req,602") = 2 dot I_("t,max") dot I_("sr") / I_("pr") dot (R_("ct") + R_L + S_R / I_r^2) $ <eq-red-602>

where $I_"k,max"$ is the maximum primary fundamental-frequency fault current for internal close-in faults and $I_"t,max"$ the corresponding through-fault current for external faults. These are Equation 601 and Equation 602 of the manual; in contrast to the transformer-differential case, the internal-fault criterion carries no additional oversizing factor and the through-fault criterion carries the factor 2. For “220 - 1” ($I_"k,max" = I_"t,max" = 50 " kA"$) they evaluate to 498.61 V and 997.21 V; the governing 997.21 V exceeds the available 740 V, so the case fails, matching the workbook (498.607 V and 997.215 V, “fail”).

No overcurrent criterion is implemented in the workbook. The REF650 required for the overcurrent planning case states its #acr("CT") requirement in the same $E_"al"$ form, but since this case cannot be computed in #acr("SECP"), it is assessed through the coverage-and-equivalence analysis of the assessment chapter, where the REF650 and REF630 dimensioning bases are presented. #cite(<REF650_Technical_Guide>)

== Excel Implementation

The implementation separates input data, intermediate quantities, protection-specific criteria and final results. A consolidated sheet lists the principal values per #acr("CT") core. Individual sheets are provided at the 220 kV, 150 kV and 33 kV levels, each holding the general #acr("CT") and secondary-circuit parameters, intermediate calculations for the total secondary burden and available limiting #acr("emf") and separate blocks for transformer and line differential protection. For transformer differential protection the inputs are the transformer rating $S_T$, nominal voltage $U_n$ and impedance $Z_T$; the #acr("CT") rated currents $I_"pr"$ and $I_"sr"$, winding resistance $R_"ct"$, cable resistance $R_L$, device burden $S_R$, accuracy limit factor $"ALF"$ and rated output $S_n$. For line differential protection the additional inputs are the maximum internal close-in fault current $I_"k,max"$ and the maximum external through-fault current $I_"t,max"$ entering @eq-red-601 and @eq-red-602. The workbook also holds the current bypassing the transformer, $I_f$, the maximum current through two main #acrpl("CT") without passing the transformer. It feeds an additional criterion (Equation 575 of the RET670 manual) analogous to @eq-ret-574 with $I_f$ in place of $I_"tf"$. In the ten evaluated cases this criterion is not governing, so $I_f$ does not affect the reported decision, but it is retained for the breaker-and-a-half topology. #cite(<RET670_Application_Manual>)

The calculation sequence is: cable resistance from the cable data; total connected secondary burden; available limiting #acr("emf"); the application-specific fault currents; the required-#acr("emf") criteria of the applicable device manual; and the comparison of the larger required value with the available value. The cable resistance is not stated explicitly in the workbook but follows the loop relationship required by the device manuals, in which both phase and return conductor are included: #cite(<RET670_Application_Manual>)

$ R_L = rho_("Cu")(theta) dot (2 L) / A $ <eq-cable>

where $L$ is the single cable length, $A$ the conductor cross-section, the factor two the phase-and-return loop and $rho_("Cu")(theta)$ the temperature-corrected copper resistivity at the maximum conductor temperature $theta$. Back-substituting the workbook cable data reproduces the displayed values: 90 m at 4 mm² yields 0.9577 Ω, 65 m at 4 mm² yields 0.6917 Ω and 40 m at 2.5 mm² yields 0.6810 Ω. The implied $rho_("Cu")(75 " °C")$ of approximately $0.0213 " Ω·mm"^2 / "m"$ is consistent with standard copper at 20 °C ($rho_(20) approx 0.0175 " Ω·mm"^2 / "m"$) corrected with a temperature coefficient of about $0.0039 / "K"$. The exact reference resistivity and coefficient are, however, inferred from the outputs rather than documented.

The required value is $E_("ALF,required") = max(E_("req,1"), E_("req,2"))$ per function and the final suitability decision is the comparison $E_("ALF,available") >= E_("ALF,required")$ (pass) or $E_("ALF,available") < E_("ALF,required")$ (fail). For “220 - 1” the transformer-differential criteria are 172.723 V and 50.065 V, so the first governs and the available 740 V yields a “pass”. A consolidated results sheet places the Excel outputs alongside the #acr("SECP") results per case and function, so that numerical deviations and decision differences can be evaluated separately. This separation is important because a numerical deviation need not change the engineering decision. For the ten transformer-differential cases both methods return “pass”, with the #acr("SECP") criterion values consistently higher, so the deviation direction is conservative for the cases examined. Its magnitude and cause are quantified in the RQ1 assessment rather than pre-empted here.

== Verification of the Reference Model Itself

Because the Excel calculation serves as the independent reference, it must be verified as well: agreement between two implementations does not demonstrate that either correctly represents the underlying basis. The workbook's separation of inputs, intermediate calculations, criteria and decision allows several values to be reproduced directly from the inputs, namely the available limiting #acr("emf"), the total secondary burden, the transformer rated and through-fault currents, the governing-criterion selection and the final comparison. The available capability can be checked against the P and PR limiting-#acr("emf") relationship of #acr("IEC") 61869-100 and the secondary-loop-resistance definition of #acr("IEC") 61869-2. The protection-specific criteria have been identified as Equation 573 and Equation 574 of the RET670 manual and Equation 601 and Equation 602 of the RED670 manual, with the cable resistance following @eq-cable, all reproducing the workbook outputs exactly.

Several items are nevertheless still not documented in the supplied material: the exact reference resistivity and temperature coefficient of the cable-resistance cell formula, presently inferred; a documented set of manually calculated benchmark cases and their acceptance tolerances; evidence of formula inspection or cell protection; tests for invalid, missing or physically inconsistent inputs and for cases close to the pass/fail limit; and information on any independent review of the model. The available material therefore supports verification of selected intermediate relationships and confirms a consistent calculation and comparison structure, but it does not establish complete independent verification of all protection-specific equations. Until the missing benchmarks and acceptance criteria are documented, the workbook should be described as a transparent independent calculation implementation with partially verified steps rather than a fully validated reference model.
