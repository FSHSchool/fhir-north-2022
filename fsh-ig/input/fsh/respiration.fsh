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
Title: "Colin Robinson"
Description: "An example of a Canadian patient."
* name
  * given[0] = "Colin"
  * family = "Robinson"
* gender = #male
* birthDate = "1965-05-12"

Instance: RespirationAssessment
InstanceOf: EaseOfRespiration
Title: "Respiration Assessment for Colin Robinson"
Description: "Respiration Assessment for Colin Robinson"
* subject = Reference(ColinRobinson)
* valueCodeableConcept = SCT#248549001 "Labored breathing (finding)"
* effectiveDateTime = "2022-10-26"
* status = #final

