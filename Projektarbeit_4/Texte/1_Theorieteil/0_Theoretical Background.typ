#import "@local/templat-projektarbeit:0.1.15": *
#import "../../Zusatz/acronyms.typ": acronyms

= Theoretical Background

This chapter establishes the theoretical basis required for the subsequent validation and quality assessment of current-transformer calculations in #acr("SECP") Global. It introduces the operating principles and relevant characteristics of #acrfpl("CT"), explains their use in transformer differential and overcurrent protection, identifies the applicable parts of the #acr("IEC") 61869 series and defines the #acr("CT") performance parameters used in protection-oriented dimensioning and verification. 

== #acrl("CT")

A #acr("CT") is an instrument transformer in which the secondary current is substantially proportional to the primary current under normal operating conditions. For the appropriate direction of connection, the phase displacement between the primary and secondary currents is approximately zero. A protective current transformer is specifically intended to transmit a current information signal to protection and control devices. #cite(<IEC_68169_2>)

In practical power-system applications, a #acr("CT") converts a comparatively high primary current $I_p$ into a lower secondary current $I_s$ that can be supplied to measuring instruments or protective devices. The transformation is determined primarily by the ratio between the primary and secondary turns. Further relevant characteristics include the rated primary and secondary currents, accuracy class, accuracy limit factor, excitation characteristic, secondary winding resistance and rated burden. #cite(<Mustajärvi_Instrument_Transformer>)

The simplified equivalent circuit of a conventional #acr("CT") contains the secondary winding resistance $R_"ct"$, the connected burden and a magnetising branch representing the magnetic behavior of the core. Part of the transformed current is required as excitation current. Consequently, the actual secondary current does not reproduce the primary current perfectly. This produces a current ratio error and a phase displacement between the primary current referred to the secondary side and the actual secondary current. #cite(<Mustajärvi_Instrument_Transformer>), #cite(<ABB_Instrument_Transformers>)

#cite(<IEC_68169_2>) distinguishes between measuring and protective current transformers. A measuring #acr("CT") transmits a current signal to measuring instruments and meters, whereas a protective #acr("CT") supplies protection and control devices. The required behavior differs accordingly. Measuring cores are intended to provide suitable accuracy within their specified measuring range. Protective cores must retain sufficient current reproduction at the substantially higher currents that can occur during system faults.  #cite(<Mustajärvi_Instrument_Transformer>)

For protection purposes, the magnetic behavior of the #acr("CT") core is particularly important. As the secondary electromotive force and the corresponding magnetic flux increase, the core approaches saturation. In this condition, an increasing part of the primary current is required for magnetisation and the secondary current can become distorted and deficient. Saturation can therefore impair the current signal supplied to the protection device and may contribute either to a failure to operate or to unwanted operation, depending on the protection principle and fault condition. #cite(<IEC_61869_100>), #cite(<Mustajärvi_Instrument_Transformer>)

#acr("CT") performance during a fault is not determined by primary current alone. The required secondary electromotive force also depends on the #acr("CT") ratio, the secondary winding resistance, the impedance of the secondary leads and the connected device burden. The burden is the impedance connected to the #acr("CT") secondary circuit and includes the connected protection device and the secondary wiring. Cable length, conductor cross-section, conductor material and temperature influence the cable resistance and therefore the total secondary burden. #cite(<Mustajärvi_Instrument_Transformer>), #cite(<ABB_Instrument_Transformers>)

The rated secondary current is one of the principal #acr("CT") ratings. #cite(<IEC_68169_2>) specifies standard rated secondary currents of 1A and 5A. For protective current transformers intended for specified transient performance, the standard rated secondary current is 1A. #cite(<IEC_68169_2>) also defines rated short-time thermal current and rated dynamic current as separate withstand quantities. These ratings concern thermal and mechanical withstand capability and are therefore distinct from the accuracy and saturation parameters used to assess measurement performance.

The #acr("CT") secondary circuit must not be opened while primary current is present. An open secondary circuit removes the normal secondary current path, so the primary current acts predominantly as magnetising current. The resulting flux and secondary voltage can become very high, creating a hazard to personnel and potentially damaging the #acr("CT") insulation or connected equipment. #cite(<RET670_Application_Manual>), #cite(<Mustajärvi_Instrument_Transformer>)

== Protection Applications

Protection devices use the secondary signals supplied by instrument transformers to detect abnormal power-system conditions. Different protection functions process these signals according to different operating principles and therefore impose different requirements on the associated #acrpl("CT"). The relevant #acr("CT") specification must consequently be related to the particular protection function rather than derived from the primary current rating alone. #cite(<IEC_61869_100>), #cite(<Mustajärvi_Instrument_Transformer>)


=== Transformer Differential Protection

Differential protection compares the currents entering and leaving a defined protection zone. Under normal load and external-fault conditions, the vector sum of the correctly referred currents should ideally be zero. An internal fault produces a differential current that indicates a fault within the protected zone. In transformer differential protection, the compared currents are measured by #acrpl("CT") installed on the different sides of the power transformer. #cite(<IEC_61869_100>), #cite(<REF650_Technical_Guide>)

A direct comparison of the measured currents requires compensation for the transformation properties of the protected power transformer. The relevant factors include the phase shift associated with the transformer vector group, the difference between #acr("CT") secondary-current magnitudes on the different transformer sides and zero-sequence current. In numerical protection devices, these corrections can be implemented in software using the entered #acr("CT") and power-transformer rated data. #cite(<RET670_Application_Manual>), #cite(<REF650_Technical_Guide>)

If the transformation ratio and phase shift are correctly compensated, the differential current should theoretically be zero during normal load and external faults. In practice, non-fault phenomena can produce an apparent differential current. The RET670 application manual identifies tap-changer-related mismatch, differences in #acr("CT") characteristics and operating conditions, zero-sequence current present on only one side of the transformer, normal magnetising current, magnetising inrush current and overexcitation current as possible causes. #cite(<RET670_Application_Manual>)

Transformer differential protection must simultaneously provide sensitivity to internal faults and stability during external faults. Restrained differential protection uses a bias or restraint quantity so that the required operating current increases with the current passing through the transformer. This proportional restraint supports stability during through faults while retaining sensitivity at lower bias currents. The RET670 and REF650 documentation describes the highest measured transformer current as the bias quantity used by the respective differential function. #cite(<RET670_Application_Manual>), #cite(<REF650_Technical_Guide>)

#acr("CT") saturation is a particularly important consideration in differential protection. If #acrpl("CT") on the different sides of the protected transformer saturate unequally, their secondary currents no longer correspond even though the primary fault is outside the protected zone. The resulting current difference can appear to the relay as a false differential current. The second and third sections of the restrained operating characteristic therefore provide increased restraint under heavy through-fault conditions, during which #acr("CT") saturation and transformer losses can increase the measured differential current. #cite(<RET670_Application_Manual>), #cite(<IEC_61869_100>)

Both internal and external faults must be considered when specifying the #acrpl("CT") for transformer differential protection. #cite(<IEC_61869_100>) identifies the external fault as typically the most critical condition for differential protection because stability must be maintained despite high through-fault currents. The report also notes that a severe internal fault can produce #acr("CT") saturation, particularly where the fault is located between the high-voltage #acr("CT") and the transformer and the source impedance is low.

The #acr("CT") ratio must be adapted to the nominal current of the protected transformer. #cite(<IEC_61869_100>) recommends correct CT-core dimensioning based on the relevant fault occurrences and identifies anti-remanence classes such as 5PR, TPY, TPZ and PXR as applicable options for transformer differential protection. The specific project requirement must nevertheless be determined from the relevant protection-device documentation and the actual power-system conditions. 

=== Overcurrent Protection

Overcurrent protection operates when the measured current exceeds a defined pickup value. The available operating characteristics include instantaneous, definite-time and inverse-time-delayed protection. Instantaneous protection operates when the pickup current is exceeded without an intentional time delay. Definite-time protection operates after the current has remained above the pickup level for the specified delay. For inverse-time protection, the operating time decreases as the measured current increases. #cite(<Mustajärvi_Instrument_Transformer>)

The ratio error of a #acr("CT") is particularly relevant to overcurrent protection because the protection decision is based directly on the measured current magnitude. Directional overcurrent protection additionally depends on phase relationships and is therefore also affected by #acr("CT") phase displacement. #cite(<IEC_68169_2>) states that the combination of ratio error and phase displacement is represented by the composite error.

#acr("CT") requirements for overcurrent protection depend on the applied operating characteristic. #cite(<IEC_61869_100>) presents separate application recommendations for non-directional and directional overcurrent functions. For definite stages, the accuracy limit factor must exceed the maximum current setting. For inverse stages, the report gives an #acr("ALF") requirement greater than 20 while considering the actual fault currents. It identifies class 10P for non-directional overcurrent protection and class 10P or potentially 5P, for directional protection. 

The overcurrent application must therefore be defined before #acr("CT") adequacy is evaluated. The source material distinguishes between directional overcurrent, non-directional instantaneous or definite-time overcurrent and non-directional inverse-time overcurrent because the associated required secondary electromotive-force conditions are not identical. The maximum close-in fault current, primary pickup current, #acr("CT") ratio, secondary winding resistance, device burden and lead resistance are among the quantities used in the corresponding assessment. #cite(<Mustajärvi_Instrument_Transformer>)

Selectivity is an additional consideration for time-delayed overcurrent protection. In a radial system, the operating times of successive protection devices are coordinated so that the protection closest to the fault can clear it while upstream protection remains available as delayed backup. The selected time difference must account for protection operating time, circuit-breaker opening time, protection reset time and an appropriate safety margin. #cite(<RET670_Application_Manual>)

== Relevant Standards

The #acr("IEC") 61869 series provides the principal standards framework for instrument transformers within the supplied source material. #cite(<IEC_61869_1>) specifies general requirements for instrument transformers. Its scope includes ratings, environmental conditions, dielectric requirements, output ratings, accuracy requirements, design and construction, testing, installation, operation, maintenance and safety.

#cite(<IEC_68169_2>) specifies additional requirements for current transformers. It defines current-transformer terminology, rated currents, output values, protective and measuring accuracy classes, short-time current ratings, terminal markings, rating-plate information and the applicable type, routine and special tests. It also defines the protective classes P, PR, PX, PXR, TPX, TPY and TPZ. 

#cite(<IEC_61869_100>) provides guidance for applying current transformers in power-system protection. Its contents address the basic electrical model, transient behaviour, duty cycles, transient dimensioning, core saturation, remanence, relationships between #acr("CT") classes and the specification of #acrpl("CT") for individual protection functions. The protection applications covered include overcurrent, distance, transformer differential, busbar differential, line differential and high-impedance differential protection.

The three documents have complementary functions in the context of this thesis. #cite(<IEC_61869_1>) supplies the general instrument-transformer requirements, #cite(<IEC_68169_2>) supplies the CT-specific definitions and requirements and #cite(<IEC_61869_100>) relates #acr("CT") behaviour and dimensioning parameters to protection applications. These documents therefore provide the standards basis against which the CT-related terminology, parameters and calculation logic of #acr("SECP") Global can be assessed.

== #acr("CT") Performance Parameters

The rated primary current $I_"pr"$ is the primary-current value on which #acr("CT") performance is based. The rated secondary current $I_"sr"$ is the corresponding basis for secondary performance. Together, these quantities define the rated current transformation ratio used to refer the primary current to the secondary side. #cite(<IEC_68169_2>)

The secondary winding resistance $R_"ct"$ is the resistance of the #acr("CT") secondary winding. It contributes to the voltage that must be induced internally to drive the required secondary current. For a given secondary current, a larger winding resistance increases the required secondary electromotive force. #cite(<IEC_68169_2>) treats $R_"ct"$ as an actual #acr("CT") quantity and distinguishes it from a specified upper limit.

The burden represents the impedance connected to the #acr("CT") secondary circuit. It includes the protection-device input and the connecting leads. Since the burden determines part of the voltage that the #acr("CT") must provide, #acr("CT") accuracy and saturation performance must be considered at the applicable burden rather than independently of the connected circuit. #cite(<IEC_68169_2>), #cite(<Mustajärvi_Instrument_Transformer>), #cite(<ABB_Instrument_Transformers>)

The rated output $S_n$ is expressed in volt-amperes for measuring #acrpl("CT") and for classes P and PR. #cite(<IEC_68169_2>) specifies standard rated-output values of 2.5, 5, 10, 15 and 30 VA, while values above 30 VA may be selected where required by the application. For classes TPX, TPY and TPZ, the standard specifies rated resistive burden values in ohms.

The accuracy class defines the applicable limits of #acr("CT") error. For classes P and PR, the class designation is associated with limits for ratio error, phase displacement and composite error. The composite error cannot be smaller than the vector combination of ratio error and phase displacement. For overcurrent relays, ratio error is particularly relevant; for phase-sensitive functions, phase displacement is also significant; and for differential protection, the combined errors of the participating #acrpl("CT") must be considered. #cite(<IEC_68169_2>)

The accuracy limit factor $K_"ALF"$, commonly abbreviated as #acr("ALF"), is the ratio between the rated accuracy-limit primary current $I_"ALF"$ and the rated primary current:

$ K_"ALF" = I_"ALF" / I_"pr" $ <eq-kalf>

$ I_"ALF" = K_"ALF" * I_"pr" $ <eq-ialf>

The rated accuracy-limit primary current in @eq-kalf is the primary-current value up to which the #acr("CT") complies with the applicable composite-error requirements. #cite(<IEC_68169_2>)

The knee-point electromotive force is relevant particularly to classes PX and PXR. #cite(<IEC_68169_2>) identifies it as the lower limit of the knee-point e.m.f. and relates it to the dimensioning factor $K_x$, secondary winding resistance, rated burden resistance and rated secondary current:

$ E_k = K_x (R_"ct" + R_b) I_"sr" $ <eq-ek>

For PX and PXR #acrpl("CT"), the excitation characteristic, secondary winding resistance, burden resistance and turns ratio provide the information required to assess performance in relation to the associated protection system. #cite(<IEC_68169_2>)

Saturation denotes the operating region in which the #acr("CT") core can no longer reproduce increasing primary current proportionally at the secondary terminals. Fault-current asymmetry and its decaying direct-current component can increase the magnetic flux beyond that produced by the symmetrical alternating component alone. #cite(<IEC_61869_100>) therefore uses the time to accuracy limit, the transient factor and the transient dimensioning factor to describe and determine the required transient #acr("CT") performance.

Remanence is the magnetic flux that remains in the #acr("CT") core after the magnetising excitation has been removed. Because existing remanent flux reduces the remaining flux margin in one direction, it can lead to earlier saturation during a subsequent fault. #cite(<IEC_68169_2>) differentiates classes with and without a specified remanent-flux limit. Classes PR, PXR and TPY include a remanence limit, whereas classes P, PX and TPX do not. Class TPZ is specified through a secondary time constant and the alternating component of the instantaneous error. #cite(<IEC_61869_100>)

The #acr("CT") classes consequently represent different methods of specifying protection performance. Classes P and PR are defined through composite-error requirements under symmetrical steady-state short-circuit conditions. Classes PX and PXR are specified through the excitation characteristic and associated circuit parameters. Classes TPX, TPY and TPZ are defined in relation to transient error under asymmetrical short-circuit conditions. Selection among these classes must therefore follow the protection principle, expected fault conditions, burden and applicable protection-device requirements. #cite(<IEC_61869_100>), #cite(<IEC_68169_2>)

== Transient Dimensioning of Protective #acrpl("CT")

The parameters introduced in the preceding section describe #acr("CT") behaviour under symmetrical steady-state conditions. A real short-circuit current generally contains a decaying direct-current component whose magnitude depends on the instant of fault inception and on the primary time constant of the network. This component adds a unidirectional contribution to the secondary linked flux and can therefore drive the core into saturation at a current considerably below the value derived from the alternating component alone. #cite(<IEC_68169_2>), #cite(<IEC_61869_100>)

#cite(<IEC_68169_2>) addresses this behaviour through a dedicated set of dimensioning quantities: the rated symmetrical short-circuit current factor, the transient factor, the transient dimensioning factor and the rated equivalent limiting secondary electromotive force. Together these express the required core performance as a single voltage requirement that can be compared with the capability of an actual #acr("CT").

=== Short-Circuit Current Factor and Duty Cycles

The rated symmetrical short-circuit current factor $K_"ssc"$ is the ratio of the rated primary short-circuit current $I_"psc"$ to the rated primary current $I_"pr"$:

$ K_"ssc" = I_"psc" / I_"pr" $ <eq-kssc>

It characterises the symmetrical component of the fault current only and is in this respect the transient-performance counterpart of the accuracy limit factor used for classes P and PR. #cite(<IEC_68169_2>)

The transient requirement is completed by the specified primary time constant $T_p$ and by the specified duty cycle. For a single energisation, the duty cycle is defined through the time to accuracy limit in the first fault $t'_"al"$. For an auto-reclosing sequence, the duration of the first fault $t'$, the fault repetition time $t_"fr"$ and the time to accuracy limit in the second fault $t''_"al"$ are specified in addition. #cite(<IEC_68169_2>), #cite(<IEC_61869_100>)

=== Transient Factor and Transient Dimensioning Factor

The transient factor $K_"tf"$ is the ratio of the secondary linked flux at a specified instant of the duty cycle to the peak value of its alternating component. It is defined as a function of time and depends on the primary time constant, the secondary loop time constant $T_s$, the duty cycle and the fault inception angle. #cite(<IEC_68169_2>)

The transient dimensioning factor $K_"td"$ accounts for the increase of the secondary linked flux caused by the direct-current component of the primary short-circuit current. Whereas $K_"tf"$ is time-dependent, $K_"td"$ is the definitive dimensioning parameter and appears on the rating plate. It is obtained either from the #acr("CT") requirements stated by the protection-device manufacturer, which are themselves derived from relay stability type tests, or from a worst-case evaluation of the $K_"tf"$ curves. #cite(<IEC_68169_2>), #cite(<IEC_61869_99>)

#cite(<IEC_61869_100>) emphasises that the choice of $K_"td"$ should not rest on analytical formulae alone but should additionally be supported by relay tests using saturated #acr("CT") models. The applicable value therefore depends on both the protection function and the specific protection device, which is directly relevant wherever a calculation tool assigns a fixed factor to an entire application category.

=== Rated Equivalent Limiting Secondary Electromotive Force

The rated equivalent limiting secondary e.m.f. $E_"al"$ is the r.m.s. value of the equivalent secondary-circuit e.m.f. at rated frequency that is necessary to meet the requirements of the specified duty cycle. It follows from the dimensioning factors and the secondary loop resistance, as given in @eq-eal:

$ E_"al" = K_"ssc" dot K_"td" dot (R_"ct" + R_b) dot I_"sr" $ <eq-eal>

where $R_b$ is the rated resistive burden. The sum $R_"ct" + R_b$ constitutes the secondary loop resistance $R_s$. #cite(<IEC_68169_2>)

$E_"al"$ thus expresses the transient requirement as a voltage. This is the form in which modern numerical protection devices state their #acr("CT") requirements, and consequently the form in which the adequacy assessment is ultimately performed. #cite(<Mustajärvi_Instrument_Transformer>)

=== Comparison of the Class-Specific Dimensioning Approaches

#cite(<IEC_61869_100>) identifies three approaches for defining protective #acrpl("CT"), each of which may result in the same physical implementation. For each approach an e.m.f. at limiting conditions is defined. For classes P and PR:

$ E_"ALF" = K_"ALF" dot I_"sr" dot (R_"ct" + Z_b) $ <eq-ealf>

for classes PX and PXR the expression for $E_k$ given in @eq-ek, and for classes TPX, TPY and TPZ the expression for $E_"al"$ given in @eq-eal. The associated dimensioning factors $K_"ALF"$, $K_x$ and the product $K_"ssc" dot K_"td"$ can each be understood as the ratio between the e.m.f. at limiting conditions and the e.m.f. at rated burden and rated current, and can therefore be compared with one another. #cite(<IEC_61869_100>)

The approximate conversions given in #cite(<IEC_61869_100>) are $E_"ALF" approx E_"al"$ and $E_k approx E_"al" \/ F$, where the factor $F$ reflects the properties of the core material. Practical values lie between 1.2 and 1.3 for non-gapped cores and around 1.1 for gapped cores. The corresponding relation between the dimensioning factors is $K_"ALF" approx K_"ssc" dot K_"td"$.

These relations are approximations rather than equalities. #cite(<Mustajärvi_Instrument_Transformer>) states that no general relation between the knee-point e.m.f. and $E_"al"$ can be established, while noting that the knee-point value is typically in the order of 80 % of $E_"al"$, which is consistent with the range given for $F$. Any calculation that converts between classes therefore introduces an approximation whose admissibility must be justified for the individual case.

=== Operational Burden and Actual Accuracy Limit Factor

The accuracy limit factor is defined at the rated burden. Where the operational burden $R'_b$ differs from the rated burden, an operational accuracy limit factor can be derived:

$ K'_"ALF" = K_"ALF" dot (R_"ct" + R_b) / (R_"ct" + R'_b) $ <eq-alf-op>

An equivalent formulation in terms of apparent power uses the internal burden, the rated output and the actual burden instead of the corresponding resistances. #cite(<Mustajärvi_Instrument_Transformer>)

#cite(<IEC_61869_100>) identifies two limitations of this conversion. It requires the secondary winding resistance, which is not a specified quantity for classes P, PR, TPX, TPY and TPZ and may therefore have to be estimated; and the practice originates from an earlier generation of high-burden electromechanical devices. The report states that the conversion is not in line with IEC 61869-2 and does not recommend it for new installations, because cores specified with a high rated burden and a low accuracy limit factor may fail to fulfil their class at very low operational burdens. This is directly relevant to the present work, since the operational burden of a modern numerical relay is typically well below the rated burden of an older core.

=== Adequacy Criterion

An adequacy assessment compares a required value derived from the application with a rated value derived from the #acr("CT") data. The required equivalent limiting secondary e.m.f., denoted $E_"al,req"$ in the following, follows from the protection function, the relevant fault current, the secondary loop resistance and the applicable dimensioning factor. As stated in @eq-adequacy, the #acr("CT") is adequate for the application when its rated value is at least equal to the required value:

$ E_"al" >= E_"al,req" $ <eq-adequacy>

Where the #acr("CT") is specified by class P or PR, the comparison is performed using the secondary limiting e.m.f., which is approximately equal to $E_"al"$. Where it is specified by class PX or PXR, the comparison is performed using the rated knee-point e.m.f., which is lower than $E_"al"$ by the factor $F$. The assessment therefore depends on the class in which the #acr("CT") is specified, and the same physical core can yield different numerical margins depending on the route selected. #cite(<IEC_61869_100>), #cite(<Mustajärvi_Instrument_Transformer>)

Because the required value depends on the protection function, on the applicable dimensioning or oversizing factor and on the assumed worst-case fault condition, these three inputs must be identified explicitly before any comparison can be regarded as meaningful. They form the basis of the validation approach developed in the following chapters.
