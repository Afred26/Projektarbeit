#import "@local/templat-projektarbeit:0.1.17": *
#import "../../Zusatz/acronyms.typ": acronyms

= Reference Model for Independent Verification

The purpose of the reference model is to provide a calculation basis that is independent of #acr("SECP") Global and can therefore be used to assess the correctness and numerical consistency of its current-transformer calculations. The model is implemented in Microsoft Excel and represents the relevant #acr("CT") parameters, secondary-circuit quantities, protection-specific calculation criteria and final suitability decision in a transparent calculation structure. The present description is based exclusively on #acr("IEC") 61869-2, #acr("IEC") 61869-100 and the calculation workbook Mappe1_mit_Entscheidungsmatrix_Trafo_Diff.xlsx.

== Derivation from #acr("IEC") 61869-2 and #acr("IEC") 61869-100

The electrical behaviour of a current transformer is influenced by the resistance of its secondary winding and by the impedance connected to the secondary terminals. #acr("IEC") 61869-2 defines the secondary-loop resistance $R_s$ as the total resistance of the secondary circuit:

$ R_s = R_"ct" + R_b $

where $R_"ct"$ is the #acr("CT") secondary-winding resistance and $R_b$ is the resistive secondary burden. The corresponding standard definition therefore distinguishes between the internal winding resistance of the #acr("CT") and the externally connected burden.

For a class P or PR protective current transformer, #acr("IEC") 61869-100 expresses the limiting secondary electromotive force as

$ E_("ALF") = "ALF" * I_("sr") * (R_("ct") + Z_b) $

where $"ALF"$ is the accuracy limit factor, $I_("sr")$ is the rated secondary current, $R_("ct")$ is the secondary-winding resistance and $Z_b$ is the rated secondary burden expressed as an impedance. #acr("IEC") 61869-100 identifies this expression as the limiting #acr("emf") definition for P and PR classes. The dimensioning factor represented by the accuracy limit factor can be interpreted as the ratio between the limiting #acr("emf") and the #acr("emf") at rated current and rated burden.

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

$ I_("tf") = I_("rt") / (Z_T / 100) $

where $S_T$ is the transformer rating, $U_n$ is the nominal system voltage and $Z_T$ is the transformer impedance stated as a percentage. These expressions reproduce the workbook values. For the “220 - 1” case, the supplied transformer rating of 220 MVA and nominal voltage of 220 kV result in a rated primary current of approximately 577.350 A. With a transformer impedance of 23 %, the corresponding through-fault current is approximately 2510.219 A, matching the values displayed in the calculation sheet.

The exact protection-device equations used to convert the transformer rated current and through-fault current into the two required limiting-#acr("emf") criteria are not stated in #acr("IEC") 61869-2 or in the accessible passages of #acr("IEC") 61869-100. The Excel workbook contains their calculated outputs but does not expose the equations in the extracted file content. Therefore:

*#strong[\[Information not provided\]]*

The available source material does not establish the complete mathematical derivation of the two RET670 transformer-differential criteria. Their exact coefficients, protection settings and device-specific basis must therefore be documented separately before the reference model can be described as being derived entirely from #acr("IEC") 61869-2 and #acr("IEC") 61869-100.

== Excel Implementation

The Excel implementation separates the calculation into input data, intermediate quantities, protection-specific criteria and final results. A consolidated information sheet contains the principal values for each #acr("CT") core, including the maximum fault currents, transformer data, #acr("CT") rated currents, accuracy limit factor, secondary-winding resistance, rated output, protection-device burden, cable length, cable cross-section and maximum conductor temperature. It also contains calculated transformer currents, #acr("CT") utilisation, the actual accuracy limit factor and a plausibility field.

Individual calculation sheets are provided for the investigated #acr("CT") cores at the 220 kV, 150 kV and 33 kV voltage levels. Each sheet follows the same basic structure. The first section contains the general #acr("CT") and secondary-circuit parameters. This is followed by intermediate calculations for the total secondary burden and the available #acr("CT") limiting #acr("emf") Separate calculation blocks are then provided for transformer differential protection and line differential protection.

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

The workbook also contains an input designated as the current bypassing the transformer, $I_f$. However, the available extracted material does not demonstrate how this input is used in the displayed transformer-differential criteria. *#strong[\[Information not provided\]]*

The calculation sequence implemented in Excel can be summarised as follows. First, the resistance of the secondary cable is calculated from the cable data. Second, the total connected secondary burden is determined from the cable resistance, #acr("CT") secondary-winding resistance and protection-device burden. Third, the available #acr("CT") limiting #acr("emf") is calculated from the accuracy limit factor, rated secondary current, secondary-winding resistance and rated #acr("CT") output. Fourth, the transformer rated current and maximum through-fault current are calculated. Fifth, the two protection-specific limiting-#acr("emf") requirements are evaluated. Finally, the larger required value is compared with the available value.

The cable-resistance results are dependent on cable length, conductor cross-section and maximum temperature. However, the precise conductor-resistivity value, temperature coefficient, reference temperature and complete cable-resistance equation are not included in the available extracted source material. Therefore:

*#strong[\[Information not provided\]]*

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

For the ten transformer-differential cases included in the workbook, both the Excel model and #acr("SECP") produce a “pass” status. The workbook reports that the #acr("SECP") criterion values are higher than the corresponding Excel values in the investigated dataset. The decision-matrix sheet characterises this deviation direction as conservative for the cases examined. The reported relative deviation of the governing criterion ranges from approximately 0.0268 to 0.2198, with a reported mean of approximately 0.0879. These values are workbook results and do not establish performance outside the investigated cases.

== Verification of the Reference Model Itself

Because the Excel calculation is used as an independent reference for the assessment of #acr("SECP") Global, the reference model itself must also be subjected to verification. A comparison between Excel and #acr("SECP") alone is insufficient for this purpose because agreement between two implementations does not demonstrate that either implementation correctly represents the underlying calculation basis. The verification must instead establish that the equations, input processing, units, intermediate quantities and decision logic of the Excel model correspond to the stated technical basis.

The available workbook provides internal transparency through the separation of input values, intermediate calculations, required limiting-#acr("emf") criteria, available limiting #acr("emf") and the final pass/fail decision. Several displayed values can be reproduced directly from the stated inputs. These include the available limiting #acr("emf"), the total secondary burden, the transformer rated primary current, the transformer through-fault current, the selection of the governing criterion and the final comparison between required and available limiting #acr("emf")

The available limiting-#acr("emf") calculation can be checked against the P and PR limiting-#acr("emf") relationship given in #acr("IEC") 61869-100. The representation of the total secondary circuit can likewise be checked against the #acr("IEC") 61869-2 definition of secondary-loop resistance as the sum of the #acr("CT") winding resistance and the external burden. These checks provide traceability for the principal #acr("CT") capability and secondary-circuit calculations.

The transformer-current calculations can be verified by substituting the workbook inputs into the displayed three-phase rated-current and impedance-based through-fault-current relationships. The repeated calculation structure across the ten transformer-differential cases provides additional opportunities to check the consistency of units and formula references, but repetition across multiple cases does not constitute an independent confirmation of the underlying equations.

The following information required for complete verification is not contained in the supplied material:

- the exact equations and coefficients used for the two RET670 transformer-differential limiting-#acr("emf") criteria;
- the authoritative source of these device-specific equations;
- the complete cable-resistance formula and its material and temperature parameters;
- a documented set of manually calculated benchmark cases;
- the acceptance tolerances applied when comparing manual and Excel results;
- evidence of formula inspection or cell-protection measures;
- tests for invalid, missing or physically inconsistent input values;
- boundary-value tests for cases close to the pass/fail limit;
- information regarding the person or process by which the Excel model was independently reviewed.

*#strong[\[Information not provided\]]*

Consequently, the available material supports verification of selected intermediate relationships and confirms that the workbook applies a consistent calculation and comparison structure. It does not, however, provide sufficient evidence to claim complete independent verification of all protection-specific equations contained in the reference model. Until the missing equations, benchmark calculations and acceptance criteria are documented, the Excel workbook should be described as a transparent independent calculation implementation with partially verified calculation steps, rather than as a fully validated reference model.