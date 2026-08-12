#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Reference Model for Independent Verification

The purpose of the reference model is to provide a calculation basis that is independent of #acr("SECP") Global and can therefore be used to assess the correctness and numerical consistency of its current-transformer calculations. The model is implemented in Microsoft Excel and represents the relevant #acr("CT") parameters, secondary-circuit quantities, protection-specific calculation criteria and final suitability decision in a transparent calculation structure. The present description is based exclusively on #acr("IEC") 61869-2, #acr("IEC") 61869-100 and the calculation workbook @Excel_Calc

== Derivation from #acr("IEC") 61869-2 and #acr("IEC") 61869-100

The reference model builds on the #acr("CT") dimensioning relationships established in the theoretical background rather than re-deriving them. Two of those relationships underpin the workbook's available-capability calculation. The first is the secondary-loop resistance $R_s = R_"ct" + R_b$ defined by #acr("IEC") 61869-2, in which $R_"ct"$ is the #acr("CT") secondary-winding resistance and $R_b$ the resistive secondary burden. The second is the class P and PR limiting secondary #acr("emf") of @eq-ealf, in which the accuracy limit factor can be interpreted as the ratio between the limiting #acr("emf") and the #acr("emf") at rated current and rated burden. The accuracy limit factor is written here in its spelled form $"ALF"$ to match the workbook, in place of the symbol $K_"ALF"$ used in @eq-ealf. What the reference model contributes is not these definitions but their explicit, transparent implementation and their combination with the device-specific RET670 requirements introduced below, which lie outside the general standard framework.

The rated burden is provided in volt-amperes in the workbook. For the resistive burden representation used by the reference model, its corresponding impedance is obtained from the rated apparent-power relationship:

$ Z_("b,n") = S_n / I_("sr")^2 $

where $S_n$ is the rated #acr("CT") output. The available accuracy-limiting #acr("emf") used in the workbook can consequently be represented as

$ E_("ALF,available") = "ALF" * I_("sr") (R_("ct") + S_n / I_("sr")^2) $

This formulation is consistent with the numerical values labelled “Available #acr("CT") Eal” in the workbook. For example, the calculation sheet “220 - 1” contains an accuracy limit factor of 20, a rated secondary current of 1 A, a secondary-winding resistance of 7 Ω and a rated output of 30 VA. The workbook reports an available limiting #acr("emf") of 740 V, which corresponds to $20 * 1 * (7 + 30) = 740 " V"$.

The actual connected secondary circuit is represented separately from the rated burden used to determine the available #acr("CT") capability. In the Excel workbook, the total secondary burden includes the #acr("CT") secondary-winding resistance, the cable resistance and the input burden of the protection device. The resulting resistive quantity can be expressed as

$ R_("sec") = R_("ct") + R_L + S_R / I_("sr")^2 $

where $R_L$ is the secondary cable resistance and $S_R$ is the input burden of the protection device. This relationship is directly consistent with the displayed workbook results. In calculation sheet “220 - 1”, for example, the listed values $R_("ct") = 7 " Ω"$, $R_L = 0.957718125 " Ω"$, $S_R = 0.02 " VA"$ and $I_("sr") = 1 " A"$ produce the displayed total secondary burden of $7.977718125 " Ω"$.

#acr("IEC") 61869-2 additionally states that the total burden consists of the external burden and the internal secondary-winding resistance. The standard permits the secondary-winding resistance to be represented by its measured direct-current value in the relevant burden calculation. It also describes the secondary induced #acr("emf") as the sum of the terminal voltage and the voltage drop across the secondary winding resistance. These relationships establish the conceptual basis for explicitly including the complete resistive secondary circuit in the reference calculation.

#acr("IEC") 61869-100 further explains that the limiting #acr("emf") cannot, by itself, describe every aspect of #acr("CT") accuracy. The document provides an example in which two PR-class specifications have similar limiting #acr("emf") values but do not produce the same errors at rated current or at the accuracy-limit condition. Consequently, the reference model treats the limiting #acr("emf") as a dimensioning quantity for the suitability comparison rather than as a complete representation of #acr("CT") performance under all operating conditions.

The workbook evaluates transformer differential protection by means of two required limiting-#acr("emf") criteria. The first criterion is associated with the transformer rated current, while the second is associated with the maximum through-fault current passing through two main #acr("CT")s and the transformer. The transformer rated primary current is calculated from the transformer rating and nominal system voltage, while the through-fault current is calculated using the transformer impedance. For every transformer-differential case contained in the workbook, the required limiting #acr("emf") is selected as the greater of the two calculated criteria.

The corresponding intermediate currents are represented in the workbook as

$ I_("rt") = S_T / (sqrt(3) U_n) $

and

$ I_("tf") = I_"rt" / (Z_T / 100) $

where $S_T$ is the transformer rating, $U_n$ is the nominal system voltage and $Z_T$ is the transformer impedance stated as a percentage. These expressions reproduce the workbook values. For the “220 - 1” case, the supplied transformer rating of 220 MVA and nominal voltage of 220 kV result in a rated primary current of approximately 577.350 A. With a transformer impedance of 23 %, the corresponding through-fault current is approximately 2510.219 A, matching the values displayed in the calculation sheet.

The two required limiting-#acr("emf") criteria are not defined by #acr("IEC") 61869-2 alone; they are the device-specific #acr("CT") requirements published by the protection-device manufacturer for the RET670. The RET670 application manual specifies the transformer-differential requirement as a rated equivalent limiting secondary #acr("emf") $E_"al"$ that must exceed the larger of two required values. #cite(<RET670_Application_Manual>) The first is referred to the rated primary current of the power transformer:

$ E_("al,req,1") = 30 dot I_("rt") dot I_("sr") / I_("pr") dot (R_("ct") + R_L + S_R / I_r^2) $ <eq-ret-573>

and the second to the maximum through-fault current passing two main #acrpl("CT") and the transformer:

$ E_("al,req,2") = 2 dot I_("tf") dot I_("sr") / I_("pr") dot (R_("ct") + R_L + S_R / I_r^2) $ <eq-ret-574>

where $I_("rt")$ is the transformer rated primary current, $I_("tf")$ the maximum through-fault current, $I_r$ the rated current of the protection #acr("IED") and $S_R$ the burden of one #acr("IED") input channel. These correspond to Equation 573 and Equation 574 of the RET670 application manual and the dimensioning factors 30 and 2 are the device-specific oversizing factors mandated by the manufacturer rather than quantities derived from #acr("IEC") 61869-2. #cite(<RET670_Application_Manual>)

Substituting the workbook inputs into @eq-ret-573 and @eq-ret-574 reproduces the displayed criteria exactly. For the “220 - 1” case, with $I_("rt") = 577.350 " A"$, $I_("tf") = 2510.219 " A"$, $I_("pr") = 800 " A"$, $I_("sr") = 1 " A"$ and the total secondary burden of $7.9777 " Ω"$, the criteria evaluate to $172.72 " V"$ and $50.06 " V"$, matching the workbook values of $172.723 " V"$ and $50.065 " V"$. The reference model therefore implements the manufacturer's published RET670 transformer-differential requirement and its transformer-differential calculation is fully derived from #acr("IEC") 61869-2, #acr("IEC") 61869-100 and the RET670 application manual in combination.

== Excel Implementation

The Excel implementation separates the calculation into input data, intermediate quantities, protection-specific criteria and final results. A consolidated information sheet contains the principal values for each #acr("CT") core, including the maximum fault currents, transformer data, #acr("CT") rated currents, accuracy limit factor, secondary-winding resistance, rated output, protection-device burden, cable length, cable cross-section and maximum conductor temperature. It also contains calculated transformer currents, #acr("CT") utilisation, the actual accuracy limit factor and a plausibility field.

Individual calculation sheets are provided for the investigated #acr("CT") cores at the 220 kV, 150 kV and 33 kV voltage levels. Each sheet follows the same basic structure. The first section contains the general #acr("CT") and secondary-circuit parameters. This is followed by intermediate calculations for the total secondary burden and the available #acr("CT") limiting #acr("emf"). Separate calculation blocks are then provided for transformer differential protection and line differential protection.

For transformer differential protection, the Excel model processes the following input quantities:

- transformer rating $S_T$;
- nominal system voltage $U_n$;
- transformer impedance $Z_T$;
- #acr("CT") rated primary current $I_("pr")$;
- #acr("CT") rated secondary current $I_("sr")$;
- #acr("CT") secondary-winding resistance $R_("ct")$;
- secondary cable resistance $R_L$;
- protection-device input burden $S_R$;
- accuracy limit factor $"ALF"$; and
- rated #acr("CT") output $S_n$.

The workbook also contains an input designated as the current bypassing the transformer, $I_f$. According to the RET670 application manual, this quantity is the maximum current that passes two main #acrpl("CT") without passing the power transformer, which occurs in breaker-and-a-half and double-busbar double-breaker arrangements; it feeds an additional required-#acr("emf") criterion (Equation 575) analogous to @eq-ret-574 but evaluated with $I_f$ in place of $I_("tf")$. #cite(<RET670_Application_Manual>) In the ten evaluated cases this criterion is not the governing one, so $I_f$ does not affect the reported suitability decision; it is retained in the model to cover the breaker-and-a-half topology.

The calculation sequence implemented in Excel can be summarised as follows. First, the resistance of the secondary cable is calculated from the cable data. Second, the total connected secondary burden is determined from the cable resistance, #acr("CT") secondary-winding resistance and protection-device burden. Third, the available #acr("CT") limiting #acr("emf") is calculated from the accuracy limit factor, rated secondary current, secondary-winding resistance and rated #acr("CT") output. Fourth, the transformer rated current and maximum through-fault current are calculated. Fifth, the two protection-specific limiting-#acr("emf") requirements are evaluated. Finally, the larger required value is compared with the available value.

The cable-resistance results depend on cable length, conductor cross-section and maximum conductor temperature. The complete equation is not stated explicitly in the workbook, but it can be reconstructed from the displayed results and is consistent with the loop-resistance definition required by the protection-device manuals, in which the resistance of both the phase and the return conductor must be included. #cite(<RET670_Application_Manual>) The reconstructed relationship is

$ R_L = rho_("Cu")(theta) dot (2 L) / A $ <eq-cable>

where $L$ is the single cable length, $A$ the conductor cross-section, the factor two accounts for the phase-and-return loop and $rho_("Cu")(theta)$ is the temperature-corrected resistivity of copper at the maximum conductor temperature $theta$. Back-substituting the workbook cable data reproduces the displayed values: $90 " m"$ at $4 " mm"^2$ yields $0.9577 " Ω"$, $65 " m"$ at $4 " mm"^2$ yields $0.6917 " Ω"$ and $40 " m"$ at $2.5 " mm"^2$ yields $0.6810 " Ω"$, each matching the corresponding calculation sheet. The value of $rho_("Cu")(75 " °C")$ implied by these results is approximately $0.0213 " Ω·mm"^2 / "m"$, which is consistent with standard copper at $20 " °C"$ ($rho_(20) approx 0.0175 " Ω·mm"^2 / "m"$) corrected with a temperature coefficient of about $0.0039 / "K"$. The exact reference resistivity and temperature coefficient are inferred from the outputs rather than documented in the workbook and remain to be confirmed against the underlying cell formulae.

The Excel result labelled “Required Eal” is the maximum of the two protection-specific criteria:

$ E_("ALF,required") = max(E_("req,1"), E_("req,2")) $

The final suitability decision is then represented by the logical comparison:

#set math.cases(gap: 1em)
$ "Status" = cases(
  "pass:" & E_("ALF,available") >= E_("ALF,required"),
  "fail:" & E_("ALF,available") < E_("ALF,required")
). $

This decision rule is consistent with the status values displayed in the individual calculation sheets. For example, the transformer-differential block of “220 - 1” reports required values of approximately 172.723 V and 50.065 V. The first criterion is therefore decisive and the available value of 740 V produces a “pass” result.

The workbook additionally contains a consolidated results sheet in which the Excel outputs are placed alongside the corresponding #acr("SECP") results. For each calculation case and protection function, the sheet presents both calculated criteria, the proposed limiting #acr("emf") and the resulting pass/fail status. This structure enables numerical deviations and differences in the suitability decision to be evaluated separately. Such a separation is important because a numerical deviation does not necessarily result in a different engineering decision.

For the ten transformer-differential cases included in the workbook, both the Excel model and #acr("SECP") produce a “pass” status. The workbook reports that the #acr("SECP") criterion values are consistently higher than the corresponding Excel values in the investigated dataset, so that the deviation direction is conservative for the cases examined. The magnitude of this deviation and its cause are quantified as part of the RQ1 assessment in the following chapter rather than pre-empted here; the workbook figures are results of the investigated cases and do not establish performance outside them.

== Verification of the Reference Model Itself

Because the Excel calculation is used as an independent reference for the assessment of #acr("SECP") Global, the reference model itself must also be subjected to verification. A comparison between Excel and #acr("SECP") alone is insufficient for this purpose because agreement between two implementations does not demonstrate that either implementation correctly represents the underlying calculation basis. The verification must instead establish that the equations, input processing, units, intermediate quantities and decision logic of the Excel model correspond to the stated technical basis.

The available workbook provides internal transparency through the separation of input values, intermediate calculations, required limiting-#acr("emf") criteria, available limiting #acr("emf") and the final pass/fail decision. Several displayed values can be reproduced directly from the stated inputs. These include the available limiting #acr("emf"), the total secondary burden, the transformer rated primary current, the transformer through-fault current, the selection of the governing criterion and the final comparison between required and available limiting #acr("emf").

The available limiting-#acr("emf") calculation can be checked against the P and PR limiting-#acr("emf") relationship given in #acr("IEC") 61869-100. The representation of the total secondary circuit can likewise be checked against the #acr("IEC") 61869-2 definition of secondary-loop resistance as the sum of the #acr("CT") winding resistance and the external burden. These checks provide traceability for the principal #acr("CT") capability and secondary-circuit calculations.

The transformer-current calculations can be verified by substituting the workbook inputs into the displayed three-phase rated-current and impedance-based through-fault-current relationships. The repeated calculation structure across the ten transformer-differential cases provides additional opportunities to check the consistency of units and formula references, but repetition across multiple cases does not constitute an independent confirmation of the underlying equations.

The device-specific equations and their authoritative source have since been identified: the two RET670 transformer-differential criteria are Equation 573 and Equation 574 of the RET670 application manual and the cable resistance follows the loop relationship of @eq-cable, both of which reproduce the workbook outputs exactly. The following information required for complete verification is nevertheless still not documented in the supplied material:

- the exact reference resistivity and temperature coefficient used in the cable-resistance cell formula, which are presently inferred from the outputs rather than stated;
- a documented set of manually calculated benchmark cases;
- the acceptance tolerances applied when comparing manual and Excel results;
- evidence of formula inspection or cell-protection measures;
- tests for invalid, missing or physically inconsistent input values;
- boundary-value tests for cases close to the pass/fail limit;
- information regarding the person or process by which the Excel model was independently reviewed.

Consequently, the available material supports verification of selected intermediate relationships and confirms that the workbook applies a consistent calculation and comparison structure. It does not, however, provide sufficient evidence to claim complete independent verification of all protection-specific equations contained in the reference model. Until the missing equations, benchmark calculations and acceptance criteria are documented, the Excel workbook should be described as a transparent independent calculation implementation with partially verified calculation steps, rather than as a fully validated reference model.