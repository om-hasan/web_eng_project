jsp_3_1.xsd
<?xml version="1.0" encoding="UTF-8"?>
<xsd:schema xmlns="http://www.w3.org/2001/XMLSchema"
            targetNamespace="https://jakarta.ee/xml/ns/jakartaee"
            xmlns:jakartaee="https://jakarta.ee/xml/ns/jakartaee"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            elementFormDefault="qualified"
            attributeFormDefault="unqualified"
            version="3.1">

 <xsd:annotation>
    <xsd:documentation>
      This is an expanded example of an XML Schema for a Jakarta EE application.
      It includes elements for configuration, deployment settings, servlets, filters, and resources.
    </xsd:documentation>
 </xsd:annotation>

 <!-- Define a complexType for application configuration -->
 <xsd:complexType name="applicationConfigType">
    <xsd:sequence>
      <xsd:element name="contextParam" type="jakartaee:contextParamType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="listener" type="jakartaee:listenerType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="servlet" type="jakartaee:servletType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="filter" type="jakartaee:filterType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="resource" type="jakartaee:resourceType" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
 </xsd:complexType>

 <!-- Define a complexType for context parameters -->
 <xsd:complexType name="contextParamType">
    <xsd:sequence>
      <xsd:element name="paramName" type="xsd:string"/>
      <xsd:element name="paramValue" type="xsd:string"/>
    </xsd:sequence>
 </xsd:complexType>

 <!-- Define a complexType for listeners -->
 <xsd:complexType name="listenerType">
    <xsd:sequence>
      <xsd:element name="listenerClass" type="xsd:string"/>
    </xsd:sequence>
 </xsd:complexType>

 <!-- Define a complexType for servlets -->
 <xsd:complexType name="servletType">
    <xsd:sequence>
      <xsd:element name="servletName" type="xsd:string"/>
      <xsd:element name="servletClass" type="xsd:string"/>
      <xsd:element name="initParam" type="jakartaee:initParamType" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
 </xsd:complexType>

 <!-- Define a complexType for init parameters -->
 <xsd:complexType name="initParamType">
    <xsd:sequence>
      <xsd:element name="paramName" type="xsd:string"/>
      <xsd:element name="paramValue" type="xsd:string"/>
    </xsd:sequence>
 </xsd:complexType>

 <!-- Define a complexType for filters -->
 <xsd:complexType name="filterType">
    <xsd:sequence>
      <xsd:element name="filterName" type="xsd:string"/>
      <xsd:element name="filterClass" type="xsd:string"/>
      <xsd:element name="initParam" type="jakartaee:initParamType" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
 </xsd:complexType>

 <!-- Define a complexType for resources -->
 <xsd:complexType name="resourceType">
    <xsd:sequence>
      <xsd:element name="resourceName" type="xsd:string"/>
      <xsd:element name="resourceAuth" type="xsd:string"/>
    </xsd:sequence>
 </xsd:complexType>

 <!-- Define the root element for the application configuration -->
 <xsd:element name="applicationConfig" type="jakartaee:applicationConfigType"/>

</xsd:schema>
