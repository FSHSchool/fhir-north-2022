// Capability statement

// Observation:
// Shall support create and search 
// May support update  
// SHALL search by patient and code 
// SHOULD search by time

Instance: LungCapabilityStatement
InstanceOf: CapabilityStatement
Title: "Lung IG Capability Statement"
Usage: #definition
// * name = "Capability Statement for Lung IG" 
* rest.mode = #server
* status = #draft
* date = "2022-10-26"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json

// Observation 
* insert SupportResource(Observation, #SHALL)
* insert SupportProfile(http://example.org/fhir-lung/StructureDefinition/ease-of-respiration, #SHALL)

* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportInteraction(#update, #MAY)

* insert SupportSearchParam(_subject, http://hl7.org/fhir/SearchParameter/Observation-subject, #string, #SHALL)
* insert SupportSearchParam(_code, http://hl7.org/fhir/SearchParameter/Observation-value-concept, #token, #SHALL)
// Should be search on Effective Time?
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHOULD)
