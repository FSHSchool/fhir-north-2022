Extension: TotalDeviceHours
Id: total-device-hours
Title: "Total Device Hours"
Description: "Total hours the device has been used"
* value[x] only decimal
* insert ExtensionContext(Device)

Extension: MaintenanceEvent
Id: maintenance-event
Title: "Maintenance Event"
Description: "Documents maintenance on the device."
* extension contains datePerformed 1..1 and currentDeviceHours 0..1 and performer 0..*
* extension[datePerformed].value[x] only date
* extension[currentDeviceHours].value[x] only decimal
* extension[performer].value[x] only string
* insert ExtensionContext(Device)

Profile: MaintainedDevice
Parent:  DeviceProfileMedical   // Canada baseline device
Id: maintained-device
Title: "Maintained Device"
Description: "A device whose maintenance is tracked."
* extension contains TotalDeviceHours named totalDeviceHours 0..1 MS
* extension contains MaintenanceEvent named maintenanceEvent 0..* MS

Instance: ColinsCPAP
InstanceOf: MaintainedDevice
Title: "CPAP"
Description: "CPAP machine loaned to Colin Robinson"
* type = SCT#702172008 "Home continuous positive airway pressure unit (physical object)"
* patient = Reference(ColinRobinson)
* extension[totalDeviceHours].valueDecimal = 1200.0
* extension[maintenanceEvent].extension[datePerformed].valueDate = "2022-10-26"
* extension[maintenanceEvent].extension[currentDeviceHours].valueDecimal = 1200.0
* extension[maintenanceEvent].extension[performer].valueString = "Lazlo Cravensworth"

// 33 lines