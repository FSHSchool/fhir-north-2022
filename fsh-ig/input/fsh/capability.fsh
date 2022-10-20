// Capability statement

// Observation:
// Shall support create and search
// May support update
// SHALL search by patient and code
// SHOULD search by time

Instance: FSHCapabilityStatement
InstanceOf: CapabilityStatement
Title: "FHIR Shorthand IG Capability Statement"
Usage: #definition
* description = "CapabilityStatement describing requirements for implementing the FSH IG"
* rest.mode = #server
* status = #draft
* date = "2022-10-26"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json

// Observation
* insert SupportResource(Observation, #SHALL)
* insert SupportProfile(http://fhir-north.org/fsh-ig/StructureDefinition/ease-of-respiration, #SHALL)

* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportInteraction(#update, #MAY)

* insert SupportSearchParam(_subject, http://hl7.org/fhir/SearchParameter/Observation-subject, #reference, #SHALL)
* insert SupportSearchParam(_code, http://hl7.org/fhir/SearchParameter/Observation-value-concept, #token, #SHALL)
* insert SupportSearchParam(_effective, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHOULD)


// 20 lines