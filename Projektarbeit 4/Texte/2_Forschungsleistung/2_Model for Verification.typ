#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= Reference Calculation for Independent Verification

The independent calculation was implemented in Microsoft Excel to compare selected #acr("CT") calculations from #acr("SECP") Global with the requirements published in the applicable protection-device manuals. The workbook contains the input data, intermediate calculations, required #acr("CT") performance, available #acr("CT") capability, suitability decisions and a consolidated comparison with the #acr("SECP") results. It covers transformer differential protection with the RET670 and line differential protection with the RED670. A separate overcurrent calculation is included as an exploratory comparison between the REF650 and REF630 dimensioning approaches.

The calculation is referred to as an independent reference calculation rather than a fully validated reference model. It is independent of the #acr("SECP") calculation logic, but its equations and assumptions still require verification against the relevant device manuals and standards.

== Calculation Basis

The required #acr("CT") performance is derived primarily from the application manuals of the RET670 and RED670. #cite(<RET670_Application_Manual>), #cite(<RED670_Application_Manual>) #acr("IEC") 61869-2 and #acr("IEC") TR 61869-100 provide the definitions and relationships required to express the available #acr("CT") capability in terms of the equivalent limiting secondary #acr("emf") #cite(<IEC_61869_2>), #cite(<IEC_61869_100>)

For a class P or PR #acr("CT"), the available equivalent limiting secondary #acr("emf") is calculated as

$ E_("ALF,available") = "ALF" * I_("sr") (R_("ct") + S_n / I_("sr")^2) $

where $R_"ct"$​ is the secondary winding resistance, $S_n$ is the rated #acr("CT") output and $I_"sr"$ is the rated secondary current.

The resistance relevant to the protection-device requirements is

$ R_("sec") = R_("ct") + R_L + S_R / I_("sr")^2 $

where $R_L$​ represents the complete secondary cable-loop resistance and $S_R$ is the input burden of the protection device. The cable-loop resistance is determined from the cable length, conductor cross-section and maximum conductor temperature. Since $R_L$​ already includes the outgoing and return conductors, it is applied only once in the protection criteria.

=== Transformer Differential Protection

For transformer differential protection, the workbook first calculates the transformer rated primary current

$ I_("rt") = S_T / (sqrt(3) U_n) $

and the maximum transformer through-fault current

$ I_("tf") = I_"rt" / (Z_T / 100) $

where $S_T$ is the transformer rating, $U_n$​ the nominal system voltage and $Z_T$​ the transformer impedance in percent.

The two RET670 criteria implemented in the workbook are #cite(<RET670_Application_Manual>)

$ E_("al,req,1") = 30 * I_("rt") * I_("sr") / I_("pr") * (R_("ct") + R_L + S_R / I_r^2) $ <eq-ret-573>

and

$ E_("al,req,2") = 2 * I_("tf") * I_("sr") / I_("pr") * (R_("ct") + R_L + S_R / I_r^2) $ <eq-ret-574>

The larger of the two values is used as the required equivalent limiting secondary #acr("emf")

=== Line Differential Protection

For line differential protection, the workbook implements the two RED670 criteria #cite(<RED670_Application_Manual>)

$ E_("al,req,601") = I_("k,max") * I_("sr") / I_("pr") * (R_("ct") + R_L + S_R / I_r^2) $ <eq-red-601>

and

$ E_("al,req,602") = 2 * I_("t,max") * I_("sr") / I_("pr") * (R_("ct") + R_L + S_R / I_r^2) $ <eq-red-602>

where $I_"k,max"$​ is the maximum internal close-in fault current and $I_"t,max"$​ is the maximum external through-fault current.

For both protection functions, the final suitability decision is obtained from $E_("ALF,available​") >= max(E_("req,1"), E_("req,2"))$.

If this condition is fulfilled, the #acr("CT") is classified as suitable. Otherwise, it is classified as unsuitable.

== Excel Implementation

The calculation sequence implemented in the workbook is shown in @Calculation_sequence. The process starts with the transformer, system, fault-current, #acr("CT"), cable and relay data. The cable-loop resistance is calculated from the applicable cable parameters and combined with the #acr("CT") winding resistance and relay burden to obtain the total secondary-circuit resistance.

#figure( caption: [Calculation sequence implemented in the independent Excel workbook],
  image("../../Bilder/main/Calculation sequence Excel.png"),
)<Calculation_sequence>

As illustrated in @Calculation_sequence, the available equivalent limiting secondary e.m.f. is determined independently from the #acr("CT") nameplate data. In parallel, the relevant protection-specific criteria are calculated using the total secondary-circuit resistance and the applicable currents. The largest protection-specific criterion is selected as the governing required value and compared with the available capability as described above; the individual calculation sheets follow this same sequence.

The consolidated results sheet places the Excel and #acr("SECP") outputs next to each other for every investigated case. This arrangement allows the numerical deviations and the final suitability decisions to be evaluated separately. It also supports the identification of systematic differences across #acr("CT") cores and voltage levels.

The workbook additionally contains separate weighted decision matrices for transformer and line differential protection. As indicated by the final stage in @Calculation_sequence, these matrices combine the numerical comparison with qualitative assessment categories, including correctness of the calculation method, numerical accuracy, safety impact, input processing, consistency of the suitability decision, documentation quality and reproducibility. The weighted score is used only as a supplementary quality indicator and does not replace the non-compensatory releasability rule.

== Verification and Limitations of the Reference Calculation

Selected Excel results were checked by manually reproducing the available #acr("CT") capability, the total secondary-circuit resistance, the transformer rated current, the through-fault current and the protection-specific criteria from the input data. These checks reproduced the values shown in the calculation sheets and confirmed that the implemented calculation sequence is consistent with the equations presented above.

The consolidated results also allow the formula implementation to be checked across several #acr("CT") cores and voltage levels. In addition, the pass/fail status can be traced from the input values through the required and available limiting secondary #acr("emf")

Nevertheless, the workbook has not undergone a complete independent software validation. In particular, it does not contain automated input-validity checks, protected formula cells, documented boundary-value tests or an independently reviewed benchmark dataset. The precise material constants used for the temperature correction of the cable resistance are also not explicitly documented in the workbook.

The Excel implementation is therefore considered a transparent and reproducible independent calculation for the investigated cases. It provides an appropriate basis for identifying numerical differences between #acr("SECP") and the device-manual requirements, but it should not be interpreted as a universally validated #acr("CT") calculation tool.