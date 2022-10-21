# FHIR North 2022 Implementation Guide Using FSH

This repository demonstrates how to build a FHIR Implementation Guide using [FHIR Shorthand](https://hl7.org/fhir/uv/shorthand/index.html) (FSH) and [SUSHI](https://fshschool.org/docs/sushi/) (a FSH compiler). This repository was created to support the [FHIR North 2022](https://fhirnorth.mohawkcollege.ca/) session, _How to create a FHIR Implementation Guide in 45 minutes using FSH_.

This example Implementation Guide includes:

* A profile representing ease of respiration, based on the [CA-Core Observation profile](https://simplifier.net/packages/hl7.fhir.ca.baseline/1.1.3/files/722820) with:
  * At least one category with the code "exam" (see [http://hl7.org/fhir/ValueSet/observation-category](http://hl7.org/fhir/ValueSet/observation-category))
  * The identifying code: SNOMED-CT 248546008 "Ease of respiration (observable entity)"
* A value set to be bound to the value of the above profile, containing 3 SNOMED-CT codes:
  * 276888009 "Normal spontaneous respiration (finding)"
  * 248549001 "Labored breathing (finding)"
  * 271825005 "Respiratory distress (finding)"
* Two FHIR instances:
  * Patient Colin Robinson, age 57, male (instance of [CA-Core Patient profile](https://simplifier.net/packages/hl7.fhir.ca.baseline/1.1.3/files/722828))
  * Currently experiencing labored breathing (instance of the ease of respiration profile above)
* A "maintained device" profile with two extensions (one simple, one complex):
  * Total device hours used (0..1)
  * Maintenance events (0..*). Each maintenance event has three sub-elements: datePerformed (date), deviceHours (integer), performer (string)
* A home CPAP device instance based on the maintained-device profile with:
  * Patient: Colin Robinson
  * Device code: SNOMED 702172008
  * Total hours: 1200
  * A single maintenance event that occurred today, at 1200 device hours, performed by Lazlo Cravensworth
* A CapabilityStatement indicating the following requirements:
  * SHALL support creating and searching Observations
  * MAY support updating Observations
  * SHALL support searching Observations by patient or code
  * SHOULD support searching Observations by date

You can view the final Implementation Guide here: [http://build.fhir.org/ig/FSHSchool/fhir-north-2022/](http://build.fhir.org/ig/FSHSchool/fhir-north-2022/)

# Building the IG

## Prerequisites

To fully build this IG, you will need to install the following software:

* [Node.js LTS](https://nodejs.org/) (for SUSHI)
* [SUSHI](https://fshschool.org/docs/sushi/installation/) (to compile FSH)
* [Java SDK 17](https://adoptium.net/temurin/releases/?version=17) (for IG Publisher)
* [Ruby and Jekyll](https://jekyllrb.com/docs/installation/#guides) (for IG Publisher)

## Compiling FSH

To compile the FHIR Shorthand in this IG, run the following command from the root IG folder:
```
sushi .
```

This will create a new `fsh-generated` sub-folder with your formal FHIR resources.

## Building the Full (Human-Readable) IG

To build the full IG, first run the script to download the latest IG Publisher:
```
_updatePublisher.bat           # Windows
./_updatePublisher.sh          # Mac
```

Then run the IG Publisher using the following script:
```
_genonce.bat                   # Windows
./_genonce.sh                  # Mac
```

Once the IG Publisher has successfully built your IG, you can view it by loading `output/index.html` in your browser.

# Final Implementation Guide

You can view an automated build of the final Implementation Guide here: [http://build.fhir.org/ig/FSHSchool/fhir-north-2022/](http://build.fhir.org/ig/FSHSchool/fhir-north-2022/)