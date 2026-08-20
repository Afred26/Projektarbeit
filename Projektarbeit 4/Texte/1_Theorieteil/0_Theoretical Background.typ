#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms
#set text(hyphenate: false)

= Theoretical Background

This chapter establishes the theoretical basis for the validation and quality assessment of #acr("CT") calculations in #acr("SECP") Global. It introduces the operating principles of #acrpl("CT"), their use in transformer differential, line differential and overcurrent protection and the #acr("CT") performance parameters used in protection oriented dimensioning.

== #acrf("CT")

A #acr("CT") is an instrument transformer whose secondary current is mostly proportional to the primary current under normal conditions, with an approximately zero phase displacement for the correct connection direction. A protective #acr("CT") is specifically intended to supply a current signal to protection and control devices #cite(<IEC_61869_2>). In power system use cases it converts a high primary current $I_p$ into a lower secondary current $I_s$. The transformation is set primarily by the turns ratio. The relevant characteristics include the rated primary and secondary currents, accuracy class, accuracy limit factor, excitation characteristic, secondary winding resistance and rated burden. #cite(<Mustajärvi_Instrument_Transformer>)

#figure(
  image("../../Bilder/main/CT Ersatzschaldbild.png", height: 211pt),
  caption: [#acr("CT") simplified equivalent circuit],
)<CT-Ersatz>

The simplified equivalent circuit (@CT-Ersatz) contains the secondary winding resistance $R_"ct"$, the connected burden and a magnetising branch. Because part of the transformed current is required for excitation, the secondary current does not reproduce the primary perfectly, which produces a ratio error and a phase displacement #cite(<Mustajärvi_Instrument_Transformer>), #cite(<ABB_Instrument_Transformers>). #cite(<IEC_61869_2>) distinguishes measuring cores, which need accuracy within their measuring range, from protective cores, which must retain sufficient reproduction at the much higher currents occurring during faults.

For protection, the magnetic behavior of the core is decisive. As the secondary #acr("emf") and the associated flux rise, the core approaches saturation. An increasing share of the primary current is then used for magnetisation instead of being transferred accurately to the secondary circuit. The secondary current becomes non linear, distorted and may be reduced in magnitude, so the protection device may no longer receive a correct representation of the primary current. This can affect the correct operation of the protection system in two ways. First, a fault may be detected too late or not detected with sufficient sensitivity, because the current supplied to the relay is lower or more distorted than expected. Second, the relay may evaluate the distorted current incorrectly and issue an unintended trip. In both cases, the consequence is not limited to measurement error, but can affect the dependability and stability of the protection system. 

Fault performance therefore depends not on the primary current alone but also on the #acr("CT") ratio, the winding resistance, the secondary lead impedance and the connected device burden. Cable length, cross section, material and temperature all influence the lead resistance and therefore the total secondary burden. A higher secondary burden increases the secondary voltage required from the #acr("CT") and can therefore contribute to earlier saturation under fault conditions #cite(<IEC_61869_100>), #cite(<Mustajärvi_Instrument_Transformer>), #cite(<ABB_Instrument_Transformers>).

== Protection Applications

Different protection functions process the secondary signal by different principles and therefore place different requirements on the associated #acrpl("CT"). The #acr("CT") specification must consequently be related to the protection function and not to the primary current rating alone. #cite(<IEC_61869_100>), #cite(<Mustajärvi_Instrument_Transformer>)

=== Transformer Differential Protection

Differential protection compares the currents entering and leaving a protection zone. Under normal load and external faults the vector sum of the correctly referred currents is ideally zero, whereas an internal fault produces a differential current. In transformer differential protection the compared currents are measured by #acrpl("CT") on the different sides of the power transformer. A direct comparison therefore first requires compensation for the transformer vector group phase shift, the secondary current magnitude difference and zero sequence current. In numerical devices these corrections are performed in software from the entered #acr("CT") and transformer data. #cite(<RET670_Application_Manual>)

Even with correct compensation, several non-fault phenomena can produce an apparent differential current, for example tap changer mismatch, differing #acr("CT") characteristics, single-sided zero-sequence current, magnetising and inrush current and overexcitation. A restrained characteristic is therefore used, in which the required operating current rises with the through current, with the highest measured transformer current serving as the bias quantity. This improves stability during through faults while retaining sensitivity for internal faults. The dimensioning condition is the external through fault. #cite(<RET670_Application_Manual>)

If the #acrpl("CT") on the two sides saturate unequally, their secondary currents no longer represent the primary currents in the same way. The resulting difference appears to the relay as a false differential current. If this false differential current is not sufficiently covered by the restraint characteristic, the relay may interpret the external fault as an internal fault and issue an unwanted trip. The CT dimensioning must therefore ensure that the protection remains stable under external through-fault conditions. #cite(<RET670_Application_Manual>)

=== Line Differential Protection

Line differential protection applies the same principle to a protected line. Because the line changes neither voltage level nor phase, no vector group compensation is required and the currents at both ends refer to the same primary quantity #cite(<RED670_Application_Manual>). The #acrpl("CT") are installed at the geographically separated line ends, so the measured currents are exchanged between the line end #acrpl("IED") over a communication channel before the differential is formed. Differing #acr("CT") ratios and characteristics together with the line charging current produce a small standing differential current that the restrained characteristic must tolerate without operating #cite(<RED670_Application_Manual>), #cite(<IEC_61869_100>). As for every differential principle, the external through fault is the dimensioning case.

=== Overcurrent Protection

Overcurrent protection operates when the measured current exceeds a pickup value, using instantaneous, definite time or inverse time characteristics #cite(<Mustajärvi_Instrument_Transformer>). Because the decision is based directly on the current magnitude, the #acr("CT") ratio error is particularly relevant. Directional functions additionally depend on the phase displacement. #cite(<IEC_61869_2>) represents the combination of both as the composite error. #cite(<IEC_61869_100>) gives separate recommendations for non directional and directional functions, requires the accuracy limit factor to exceed the maximum current setting for definite stages and an #acr("ALF") above 20 for inverse stages and identifies class 10P for non directional and 10P or 5P for directional protection. The overcurrent application must therefore be defined before #acr("CT") adequacy can be assessed, since the maximum close in fault current, primary pickup current, #acr("CT") ratio, winding resistance, device burden and lead resistance enter the corresponding required #acr("emf") condition differently for each case. #cite(<Mustajärvi_Instrument_Transformer>)

== #acr("CT") Performance Parameters

The rated primary and secondary currents $I_"pr"$ and $I_"sr"$ define the rated transformation ratio used to refer the primary current to the secondary side #cite(<IEC_61869_2>). The secondary winding resistance $R_"ct"$ contributes to the secondary burden, which defines the required internally induced voltage to drive the secondary current, so a larger $R_"ct"$ raises the required secondary #acr("emf"). The burden is the impedance connected to the secondary circuit, comprising the device input and the leads. Because it determines part of the required voltage, accuracy and saturation must be assessed at the applicable burden #cite(<IEC_61869_2>), #cite(<Mustajärvi_Instrument_Transformer>). The rated output burden $S_n$ is expressed in volt amperes for measuring #acrpl("CT") and classes P and PR and as a rated resistive burden in ohms for classes TPX, TPY and TPZ. #cite(<IEC_61869_2>)

The accuracy class defines the applicable error limits. Classes P and PR are specified through the composite error, classes PX and PXR through the excitation characteristic and classes TPX, TPY and TPZ through the transient error. Class selection follows the protection principle, the expected fault conditions, the burden and the device requirement. #cite(<IEC_61869_2>), #cite(<IEC_61869_100>) The accuracy limit factor, commonly abbreviated #acr("ALF"), is the ratio of the rated accuracy limit primary current to the rated primary current, that is, the fault current multiple up to which the composite error requirement is met at rated burden #cite(<IEC_61869_2>). For classes PX and PXR the requirement is instead expressed through the knee point #acr("emf"), related to the dimensioning factor $K_x$, the winding resistance, the rated burden resistance $R_b$ and the rated secondary current:

$ E_k = K_x (R_"ct" + R_b) I_"sr" $ <eq-ek>

A real short circuit current additionally contains a decaying d.c. component that raises the secondary flux beyond that of the symmetrical component alone and can drive the core into saturation well below the value implied by the a.c. component #cite(<IEC_61869_2>), #cite(<IEC_61869_100>). #cite(<IEC_61869_2>) expresses the required core performance under these conditions as a single voltage, the rated equivalent limiting secondary #acr("emf"):

$ E_"al" = K_"ssc" * K_"td" * (R_"ct" + R_b) * I_"sr" $ <eq-eal>

where the rated symmetrical short circuit current factor $K_"ssc"$ characterizes the symmetrical fault current multiple and the transient dimensioning factor $K_"td"$ accounts for the d.c. component in accordance with the device manufacturer requirement #cite(<IEC_61869_2>), #cite(<IEC_61869_99>). This is the voltage form in which modern numerical devices state their #acr("CT") requirement #cite(<Mustajärvi_Instrument_Transformer>). For classes P and PR, #cite(<IEC_61869_100>) expresses the corresponding capability as the secondary limiting #acr("emf") at the actual accuracy limit:

$ E_"ALF" = K_"ALF" * I_"sr" * (R_"ct" + Z_b) $ <eq-ealf>

which is approximately equal to $E_"al"$, whereas the knee point #acr("emf") of @eq-ek is typically lower by a factor of about 1.2 to 1.3 for non gapped cores, so any conversion between the class specifications must be justified per case #cite(<IEC_61869_100>), #cite(<Mustajärvi_Instrument_Transformer>).

An adequacy assessment compares a required value derived from the application with a rated value derived from the #acr("CT") data. The required equivalent limiting secondary #acr("emf") $E_"al,req"$ follows from the protection function, the relevant fault current, the secondary loop resistance and the applicable dimensioning factor. The #acr("CT") is adequate when

$ E_"al" >= E_"al,req" $ <eq-adequacy>

Because the required value depends on the protection function, the applicable dimensioning factor and the assumed worst case fault, these inputs must be identified explicitly before any comparison is meaningful. They form the basis of the validation developed in the following chapters. #cite(<IEC_61869_100>), #cite(<Mustajärvi_Instrument_Transformer>)

