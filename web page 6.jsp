xml.xsd
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
           targetNamespace="http://www.example.com/hospitalEmergencySystem"
           xmlns="http://www.example.com/hospitalEmergencySystem"
           elementFormDefault="qualified">

    <!-- Define complex type for patient details -->
    <xs:complexType name="PatientDetails">
        <xs:sequence>
            <xs:element name="firstName" type="xs:string"/>
            <xs:element name="lastName" type="xs:string"/>
            <xs:element name="dateOfBirth" type="xs:date"/>
            <xs:element name="address" type="AddressType"/>
            <xs:element name="medicalHistory" type="xs:string"/>
            <xs:element name="chronicDiseases" type="xs:string"/>
            <xs:element name="allergies" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>

    <!-- Define complex type for address -->
    <xs:complexType name="AddressType">
        <xs:sequence>
            <xs:element name="street" type="xs:string"/>
            <xs:element name="city" type="xs:string"/>
            <xs:element name="state" type="xs:string"/>
            <xs:element name="zip" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>

    <!-- Define complex type for case submission -->
    <xs:complexType name="CaseSubmission">
        <xs:sequence>
            <xs:element name="patientName" type="xs:string"/>
            <xs:element name="relationshipToPatient" type="xs:string"/>
            <xs:element name="symptoms" type="xs:string"/>
            <xs:element name="startDate" type="xs:date"/>
            <xs:element name="isInjured" type="xs:boolean"/>
            <xs:element name="injuryType" type="xs:string" minOccurs="0"/>
            <xs:element name="injuryImage" type="xs:base64Binary" minOccurs="0"/>
            <xs:element name="caseStatus" type="xs:string"/>
            <xs:element name="caseNumber" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>

    <!-- Define root elements for patient registration and case submission -->
    <xs:element name="patientRegistration">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="patient" type="PatientDetails"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>

    <xs:element name="caseSubmission">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="case" type="CaseSubmission"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>

</xs:schema>

