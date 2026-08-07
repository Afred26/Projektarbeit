#import "@local/templat-projektarbeit:0.1.17": *
#import "../../Zusatz/acronyms.typ": acronyms

= Comparison of Overcurrent Protection #acr("CT") Calculations for REF630 and REF650

The calculation procedures provided for REF630 and REF650 address the same fundamental engineering objective: the current transformer must reproduce the primary fault current with sufficient accuracy for the protection function to operate as intended. In both cases, the calculation is therefore not limited to selecting the rated #acr("CT") transformation ratio. It must also consider the current level to be reproduced, the #acr("CT") secondary winding resistance, the connected burden and the saturation behaviour of the #acr("CT") core. However, the two device manuals express these requirements through different calculation frameworks. The REF630 application manual primarily uses the #acr("CT") accuracy class and the effective accuracy limit factor, whereas the REF650 technical guide specifies a required rated equivalent limiting secondary acr("emf") for each overcurrent protection characteristic.

== Normative basis

The relevant normative basis for conventional inductive protection CTs is IEC 61869-2 in conjunction with the general requirements of IEC 61869-1. IEC 61869-2 defines a protective current transformer as a #acr("CT") intended to transmit information to protection and control devices. For class P and PR CTs, the standard defines the #acr("ALF") as the ratio of the rated accuracy-limit primary current to the rated primary current. The corresponding secondary limiting acr("emf") is denoted by $E_"ALF"$​ and is determined from the accuracy limit factor, rated secondary current, #acr("CT") winding impedance and rated burden.

For protection classes specified by their transient performance, IEC 61869-2 additionally defines the rated symmetrical short-circuit current factor $K_"ssc"$​, the transient dimensioning factor $K_"td"$ and the rated equivalent limiting secondary acr("emf") $E_"al"$. The latter is defined as

$ E_"al" = K_"ssc" K_"td" (R_"ct" + R_b) I_"sr" $

where $R_"ct"$​ is the secondary winding resistance, $R_b$​ is the secondary burden resistance and $I_"sr"$ is the rated secondary current. Thus, the voltage-based and factor-based descriptions are not independent physical concepts. They are alternative means of characterising the #acr("CT") capability at its specified accuracy limit.

IEC TR 61869-100 supplements the normative requirements with application guidance. It identifies overcurrent protection by #acr("ANSI") device numbers 50, 51, 50N, 51N, 67 and 67N and by the #acr("IEC") symbol *I>*. The report states that overcurrent protection compares the measured current with a pickup threshold and operates instantaneously or after a time delay when the threshold is exceeded. It also explains that modern relay manufacturers may determine the necessary #acr("CT") overdimensioning through analytical evaluations and device tests and subsequently publish simplified requirements in the relay documentation. The project engineer then applies these published requirements to the fault-current and burden conditions of the particular installation.

== REF630 calculation approach

The REF630 application manual describes the #acr("CT") requirement in terms of the accuracy class, nominal accuracy limit factor and actual connected burden. The calculation therefore begins with a #acr("CT") specified by an IEC protection class, typically expressed in a form such as 5P20. In this designation, the letter P identifies a protection #acr("CT"), the first number represents the permissible composite error in percent at the accuracy-limit condition, and the second number represents the rated accuracy limit factor. The suitability of the #acr("CT") is then assessed under the actual secondary-circuit conditions.

A central quantity in this approach is the actual or effective accuracy limit factor. The rated ALF stated for a #acr("CT") applies at the rated burden. If the actual connected burden differs from the rated burden, the corresponding effective factor is calculated by taking account of the #acr("CT") winding resistance and the actual secondary load. In general form, this relationship can be written as

$ "ALF'" = "ALF"  (S_r + I_"sr"^2R_"ct") / (S_"act" + I_"sr"^2R_"ct") $

where $S_r$ is the rated #acr("CT") burden and $S_"act"$ is the actual connected burden. A lower actual burden therefore results in a higher effective accuracy limit factor, provided that the remaining parameters are unchanged. The calculated factor is subsequently compared with the fault-current multiple that must be reproduced by the #acr("CT").

The actual burden comprises the protection relay input burden and the burden of the secondary wiring. For a predominantly resistive circuit, the cable contribution may be expressed as

$ S_"lead" = I_"sr"^2 * R_"lead" $

Consequently, the REF630 method converts the physical secondary-circuit data into a burden in volt-amperes and uses this burden to correct the rated ALF. The result is a dimensionless factor describing the multiple of rated primary current up to which the #acr("CT") is expected to satisfy the applicable accuracy-class requirement.

The REF630 manual discusses the non-directional overcurrent protection calculation as a common requirement for the overcurrent stages rather than publishing separate rated-emf equations for instantaneous, definite-time and inverse-time operation. The calculation is therefore primarily based on the maximum short-circuit current, the #acr("CT") rated primary current and the effective accuracy limit factor. This produces a class-oriented #acr("CT") verification: the available effective ALF of the selected #acr("CT") is compared with the required current multiple, including the margin specified by the device manual.

== REF650 calculation approach

The REF650 technical guide expresses the #acr("CT") requirement directly as a minimum rated equivalent limiting secondary acr("emf") $E_"al,req"$. This quantity represents the internal secondary acr("emf") that the #acr("CT") must be capable of producing while maintaining the performance required by the protection function. The selected #acr("CT") must satisfy

$ E_"al" >= E_"al,req" $

The calculation includes the #acr("CT") secondary resistance $R_"ct"$​, secondary-cable and additional-load $R_L$​, rated secondary current $I_"sr"$​, #acr("CT") rated primary current $I_"pr"$​, rated IED current $I_r$, and the burden $S_R$​ of one IED current-input channel. The REF650 guide specifies $S_R = 0.020 "VA"$ for a 1 A input and $S_R = 0.150 "VA"$ for a 5 A input.

For non-directional instantaneous and definite-time phase or residual overcurrent protection, REF650 specifies

$ E_"al,req" = 1.5 I_"op" * I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_r^2) $

where $I_"op"$ is the primary operate value of the protection stage. The factor 1.5 is therefore applied to the pickup-current multiple rather than to the maximum available short-circuit current. The equation directly produces a voltage requirement at the #acr("CT") secondary side.

For a non-directional inverse-time overcurrent function used as the only overcurrent protection function, REF650 specifies a separate requirement:

$ E_"al,req" = 20 I_"op" * I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_r^2) $

In addition, an upper requirement based on the maximum close-in fundamental-frequency fault current is applied:

$ E_"al,req,max" = I_"k,max" * I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_r^2) $

The #acr("CT") must therefore satisfy the applicable required value. The REF650 guide also states that these inverse-time requirements do not need to be applied when a high-set instantaneous or definite-time stage is used. In that configuration, the requirement for the high-set stage is sufficient.

For directional phase and residual overcurrent protection, REF650 bases the required secondary acr("emf") on the maximum fundamental-frequency current for close-in forward and reverse faults:

$ E_"al,req" = I_"k,max" * I_"sr" / I_"pr" (R_"ct" + R_L + S_R / I_r^2) $

The inclusion of both forward and reverse close-in faults reflects the directional function’s requirement to evaluate current quantities under both operating and non-operating fault directions.

The REF650 calculation also distinguishes between the secondary-wire resistance applicable to phase-to-earth and three-phase faults. For phase-to-earth faults in solidly earthed systems, the loop contains the phase and neutral conductors, so the loop resistance is used. For a balanced three-phase fault, the neutral current is zero and normally only the resistance of one phase conductor up to the common neutral point is considered. In isolated or high-impedance-earthed systems, the guide states that the resistance of a single secondary wire may be used because the phase-to-earth fault is not the dimensioning case described for solidly earthed systems.

== Comparison of the calculation methods

The principal difference between the two manuals is the selected verification quantity. REF630 verifies the #acr("CT") through an effective accuracy limit factor ALF', which is derived from the #acr("CT") nameplate ALF and corrected for the actual connected burden. REF650 calculates the minimum required rated equivalent limiting secondary acr("emf") $E_"al,req"$ and compares it with the corresponding #acr("CT") capability. The REF630 result is therefore dimensionless, whereas the REF650 result is expressed in volts.

A second difference concerns the differentiation between overcurrent characteristics. In the REF630 application manual, the #acr("CT") dimensioning procedure is presented as a common calculation for non-directional overcurrent protection. In the REF650 guide, instantaneous or definite-time protection, inverse-time protection and directional overcurrent protection are assigned separate equations. Consequently, the REF650 calculation explicitly changes according to whether the relevant input quantity is the primary operate value, twenty times the operate-value multiple or the maximum close-in fault current.

A third difference is the representation of the secondary burden. REF630 combines the relay and wiring contributions into an actual burden expressed in volt-amperes and uses it to determine ALF'. REF650 retains the #acr("CT") resistance and cable resistance as resistive quantities and converts the IED input burden to an equivalent resistance through $S_R / I_r^2$​. Although the mathematical representation differs, both approaches account for the voltage required to drive the fault-current-related secondary current through the #acr("CT") winding and the connected secondary circuit.

REF650 additionally provides explicit instructions for selecting the applicable cable resistance for phase-to-earth and three-phase faults and requires both fault types to be considered when determining the maximum relevant fault current. The REF630 calculation focuses on the total actual burden used for correction of the accuracy limit factor. Therefore, the conductor-loop selection is included through the burden input rather than being developed as a separate function-specific part of the calculation.

Despite these differences, the two procedures are physically related. IEC 61869-2 defines both the accuracy-limit quantities for class P and PR CTs and the equivalent limiting secondary acr("emf") used for transient-performance descriptions. The REF650 guide accordingly states that the secondary limiting acr("emf") $E_"ALF"$​ of class P or PR CTs is approximately equivalent to $E_"al"$. It also provides approximate conversion relationships for other #acr("CT") classes, including PX and PXR CTs specified by a rated knee-point acr("emf") Thus, the REF630 and REF650 procedures represent different forms of #acr("CT") verification rather than different underlying saturation mechanisms.

In summary, REF630 applies a class- and burden-based verification using the effective accuracy limit factor, while REF650 uses a function-specific voltage requirement based on the operate current or maximum fault current and the complete secondary-circuit resistance. For an identical network and #acr("CT") circuit, both calculations require consistent input data, particularly the #acr("CT") ratio, maximum relevant fault current, #acr("CT") winding resistance, lead resistance, relay input burden and protection pickup settings. The numerical results cannot be compared directly without converting the factor-based #acr("CT") capability into an equivalent secondary acr("emf"), or vice versa, in accordance with IEC 61869-2.