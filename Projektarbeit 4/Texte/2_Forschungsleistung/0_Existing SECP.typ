#import "@local/templat-projektarbeit:0.1.18": *
#import "../../Zusatz/acronyms.typ": acronyms

= The #acr("SECP") Global #acr("CT") Calculation Process

This chapter describes the current #acr("SECP") Global process for #acr("CT") calculations: the overall application, the #acr("CT") calculation workflow, the protection functions covered and the generation and content of the calculation reports. The description is limited to the functionality documented in the #acr("SECP") user manual and the structure observed in the available calculation reports.

== Overview of #acr("SECP") Global

#acr("SECP") is an offline application combining several substation-engineering calculation modules, including conductor design and loading, lightning protection, #acr("CT") and #acr("VT") adequacy checks, battery and charger sizing, auxiliary-transformer sizing and neutral-grounding-resistor sizing, with support for both SI and Imperial units. It is organised around project files (extension `.secp.proj`) that can be created, opened, copied, imported or exported. Data relevant to several calculations can be entered once and reused, which reduces the engineering effort. #acr("CT") calculations form part of the combined #acr("CT") and #acr("VT") adequacy-check module, which assesses the suitability of instrument transformers for selected protection or metering applications.

Within this module, #acr("CT") data are organised in a hierarchy of scenario, bay, #acr("CT") core, application and #acr("CT") tap: up to five scenarios (representing voltage levels) per substation, up to 25 bays per scenario, up to six cores per protection #acr("CT") (twelve for iteration and cross-verification) and up to three applications per core. The generated reports reproduce this hierarchy, presenting project and document information followed by scenario, bay, core, application, input data, calculation steps and the final adequacy result.

== #acr("CT") Calculation Workflow

A calculation begins with a new or reused SECP project, to which general project and document information is assigned, including identifiers, substation and customer data, voltage level, revision and the responsible persons. Each scenario contains the general system data and is subdivided into bays and #acr("CT") cores. Each core is assigned a protection application that determines the application-specific input fields and the subsequent calculation sequence.

#figure( caption: [Simplified #acr("CT") calculation workflow in SECP Global],
  image("../../Bilder/main/Simplified CT calculation workflow in SECP Global.png"),
)<CT_SECP>

The overall workflow is summarised in @CT_SECP. The calculation starts with the project and system data, followed by the #acr("CT"), cable and relay parameters. Based on these inputs, SECP determines the secondary-loop resistance and performs the calculation required for the selected protection function. The required #acr("CT") performance is then compared with the available #acr("CT") capability to obtain the final suitability decision.

Each calculation stage depends on the results of the preceding stage. Consequently, an error in the processing of an input quantity, such as the secondary cable resistance, can propagate through the application-specific calculation and affect the reported #acr("CT") requirement. @CT_SECP therefore also provides the process structure used later to locate identified deviations within the SECP calculation chain.

The core and #acr("CT") inputs comprise the cable data, including conductor type, cross-section, direct-current resistance, cable length and number of runs, as well as the relay manufacturer, model and burden. The #acr("CT") data include the rated primary and secondary currents, secondary winding resistance, rated output and accuracy limit factor. Application-specific parameters are added according to the selected protection function. Transformer differential protection, for example, requires transformer and fault-related quantities, whereas overcurrent protection depends on the selected characteristic and the applicable fault-current or operate-current value.

SECP processes these quantities successively, as illustrated in @CT_SECP. The calculated lead resistance, relay burden and #acr("CT") winding resistance form the secondary-circuit resistance used in the protection-specific criteria. The required value is compared with the capability derived from the #acr("CT") data, and the resulting pass or fail decision is documented in the generated report.

== Protection Functions Covered by #acr("SECP")

The module supports #acr("CT") sizing for seven application categories: overcurrent, line differential, transformer differential, high- or low-impedance busbar, distance, high- or low-impedance transformer restricted-earth-fault and metering protection, with up to three applications per core. The supplied reports provide direct examples for overcurrent and transformer differential protection. The REF650 required for the overcurrent planning case is not selectable; this gap is examined in the assessment chapters.

== Generation of Calculation Reports

#acr("SECP") generates standardised summary and detailed reports as editable Microsoft Word files. A detailed report contains the input data, calculation steps, formulae and results; a summary report contains inputs and final results only. Before generation the user selects the scenario and element, the number of decimal digits and whether unselected elements are summarised. The detailed report follows a consistent structure: cover page and table of contents, project and document information, the referenced standards and nomenclature, then the calculation organised by scenario, bay, core, application and tap. Each application closes with a summary that consolidates the principal #acr("CT") data and results (currents, class, #acr("ALF"), proposed and calculated knee-point voltages, burden and adequacy).

It is important to distinguish report generation from report correctness. A detailed report presents each formula, its substituted values and the resulting verdict and the inline verdicts and tap summaries in the available report are mutually consistent. This internal consistency does not, however, establish that the displayed formulae match the applicable device requirement or that the numerical values are correct. Whether the calculations are faithful to the governing standard and device documentation is examined in the assessment chapters rather than assumed from a complete, self-consistent report.
