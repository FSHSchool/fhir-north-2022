// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: SCT = http://snomed.info/sct
Alias: CAT =  http://terminology.hl7.org/CodeSystem/observation-category

Profile: EaseOfRespiration
Parent: ObservationProfile  // Canada general observation
Id: ease-of-respiration
Title: "Ease of Respiration"
Description: "Profile for an ease of respiration observation"
* code = SCT#248546008  // Ease of respiration (observable entity)
* insert CategorySlice (exam-category, CAT#exam, 1)
* value[x] only CodeableConcept
* value[x] from EaseOfRespirationVS

ValueSet: EaseOfRespirationVS
Id: ease-of-respiration-vs
Title: "Ease Of Respiration Value Set"
Description: "Result of ease of respiration observation"
* insert SNOMEDCopyright
* SCT#276888009 "Normal spontaneous respiration (finding)"
* SCT#248549001 "Labored breathing (finding)"
* SCT#271825005 "Respiratory distress (finding)"

Instance: ColinRobinson
InstanceOf: PatientProfile
Description: "An example of a Canadian patient with breathing difficulty."
* name
  * given[0] = "Colin"
  * family = "Robinson"
* birthDate = "1965-05-12"

Instance: ColinRobinsonRespirationAssessment
InstanceOf: EaseOfRespiration
Title: "Respiration Assessment for Colin Robinson"
* subject = Reference(ColinRobinson)
* valueCodeableConcept = SCT#248549001 "Labored breathing (finding)"
* status = #final

/**************************************************************/

RuleSet: SNOMEDCopyright
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* ^experimental = false

RuleSet: CategorySlice(sliceName, sliceValue, minCard)
* category {minCard}..* MS  // really should increment lower card
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.description = "Slicing requires the given value but allows additional categories"
* category contains {sliceName} {minCard}..1
* category[{sliceName}] = {sliceValue}

