web-common_6_0.xsd
<xsd:schema xmlns="http://www.w3.org/2001/XMLSchema"
            targetNamespace="https://jakarta.ee/xml/ns/jakartaee"
            xmlns:jakartaee="https://jakarta.ee/xml/ns/jakartaee"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            elementFormDefault="qualified"
            attributeFormDefault="unqualified"
            version="6.0">

    <!-- Customized element for a specific component -->
    <xsd:element name="customComponent" type="jakartaee:customComponentType">
        <xsd:annotation>
            <xsd:documentation>
                This element represents a custom component specific to our project.
            </xsd:documentation>
        </xsd:annotation>
    </xsd:element>

    <!-- Define the type for the custom component -->
    <xsd:complexType name="customComponentType">
        <xsd:sequence>
            <xsd:element name="property" type="jakartaee:string" minOccurs="0" maxOccurs="unbounded">
                <xsd:annotation>
                    <xsd:documentation>
                        A property of the custom component.
                    </xsd:documentation>
                </xsd:annotation>
            </xsd:element>
        </xsd:sequence>
    </xsd:complexType>

    <!-- Include additional schemas as needed -->
    <xsd:include schemaLocation="additionalSchema.xsd"/>

</xsd:schema>
<xsd:complexType name="error-codeType">
    <xsd:annotation>
      <xsd:documentation>
        The error-code contains an HTTP error code, ex: 404.
        Used in: error-page.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:restriction base="jakartaee:xsdPositiveIntegerType">
        <xsd:pattern value="\d{3}"/>
        <xsd:attribute name="id" type="xsd:ID"/>
        <!-- Example of adding a custom attribute for error messages -->
        <xsd:attribute name="errorMessage" type="xsd:string" use="optional"/>
      </xsd:restriction>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="error-pageType">
    <xsd:annotation>
      <xsd:documentation>
        The error-pageType contains a mapping between an error code or exception type to the path of a resource in the web application.
        Used in: web-app.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:choice minOccurs="0" maxOccurs="1">
        <xsd:element name="error-code" type="jakartaee:error-codeType"/>
        <xsd:element name="exception-type" type="jakartaee:fully-qualified-classType">
          <xsd:annotation>
            <xsd:documentation>
              The exception-type contains a fully qualified class name of a Java exception type.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
      </xsd:choice>
      <xsd:element name="location" type="jakartaee:war-pathType">
        <xsd:annotation>
          <xsd:documentation>
            The location element contains the location of the resource in the web application relative to the root of the web application. The value of the location must have a leading '/'.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Example of adding a custom element for specifying error handling strategies -->
      <xsd:element name="errorHandlingStrategy" type="xsd:string" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the error handling strategy to be used for this error page.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="filterType">
    <xsd:annotation>
      <xsd:documentation>
        The filterType is used to declare a filter in the web application.
        Used in: web-app.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="filter-name" type="jakartaee:string">
        <xsd:annotation>
          <xsd:documentation>
            The name of the filter.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="filter-class" type="jakartaee:fully-qualified-classType">
        <xsd:annotation>
          <xsd:documentation>
            The fully qualified class name of the filter.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Example of adding a custom element for specifying filter initialization parameters -->
      <xsd:element name="init-param" type="jakartaee:param-valueType" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            Specifies initialization parameters for the filter.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="filterType">
    <xsd:annotation>
      <xsd:documentation>
        The filterType is used to declare a filter in the web application.
        Used in: web-app.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:group ref="jakartaee:descriptionGroup"/>
      <xsd:element name="filter-name" type="jakartaee:filter-nameType"/>
      <xsd:element name="filter-class" type="jakartaee:fully-qualified-classType" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            The fully qualified classname of the filter.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="async-supported" type="jakartaee:true-falseType" minOccurs="0"/>
      <xsd:element name="init-param" type="jakartaee:param-valueType" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            The init-param element contains a name/value pair as an initialization param of a servlet filter.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Example of adding a custom element for specifying filter order -->
      <xsd:element name="filter-order" type="xsd:int" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the order in which this filter should be applied relative to other filters.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="filter-mappingType">
    <xsd:annotation>
      <xsd:documentation>
        Declaration of the filter mappings in this web application is done by using filter-mappingType.
        Used in: web-app.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="filter-name" type="jakartaee:filter-nameType"/>
      <xsd:choice minOccurs="1" maxOccurs="unbounded">
        <xsd:element name="url-pattern" type="jakartaee:url-patternType"/>
        <xsd:element name="servlet-name" type="jakartaee:servlet-nameType"/>
      </xsd:choice>
      <xsd:element name="dispatcher" type="jakartaee:dispatcherType" minOccurs="0" maxOccurs="5"/>
      <!-- Example of adding a custom element for specifying filter mapping conditions -->
      <xsd:element name="condition" type="xsd:string" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Specifies a condition under which this filter mapping should be applied.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="nonEmptyStringType">
    <xsd:annotation>
      <xsd:documentation>
        This type defines a string which contains at least one character.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:restriction base="jakartaee:string">
        <xsd:minLength value="1"/>
        <!-- Example of adding a pattern restriction for alphanumeric characters -->
        <xsd:pattern value="[a-zA-Z0-9]+"/>
      </xsd:restriction>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="filter-nameType">
    <xsd:annotation>
      <xsd:documentation>
        The logical name of the filter is declared using filter-nameType. This name is used to map the filter. Each filter name is unique within the web application.
        Used in: filter, filter-mapping
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:extension base="jakartaee:nonEmptyStringType">
        <!-- Example of adding a custom attribute for filter descriptions -->
        <xsd:attribute name="description" type="xsd:string" use="optional"/>
      </xsd:extension>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="form-login-configType">
    <xsd:annotation>
      <xsd:documentation>
        The form-login-configType specifies the login and error pages that should be used in form-based login. If form-based authentication is not used, these elements are ignored.
        Used in: login-config
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="form-login-page" type="jakartaee:war-pathType"/>
      <xsd:element name="form-error-page" type="jakartaee:war-pathType"/>
      <!-- Example of adding a custom element for specifying security configurations -->
      <xsd:element name="security-config" type="xsd:string" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the security configurations for the form-based login.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="login-configType">
    <xsd:annotation>
      <xsd:documentation>
        The login-configType is used to configure the authentication method that should be used, the realm name that should be used for this application, and the attributes that are needed by the form login mechanism.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="auth-method" type="jakartaee:auth-methodType" minOccurs="0"/>
      <xsd:element name="realm-name" type="jakartaee:string" minOccurs="0"/>
      <xsd:element name="form-login-config" type="jakartaee:form-login-configType" minOccurs="0"/>
      <!-- Example of adding a custom element for specifying authentication providers -->
      <xsd:element name="auth-provider" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the authentication providers to be used for this application.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="mime-mappingType">
    <xsd:annotation>
      <xsd:documentation>
        The mime-mappingType defines a mapping between an extension and a mime type.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="extension" type="jakartaee:string"/>
      <xsd:element name="mime-type" type="jakartaee:mime-typeType"/>
      <!-- Example of adding a custom element for specifying MIME type descriptions -->
      <xsd:element name="description" type="xsd:string" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Provides a description for the MIME type mapping.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="mime-typeType">
    <xsd:annotation>
      <xsd:documentation>
        The mime-typeType is used to indicate a defined mime type.
        Example: "text/plain"
        Used in: mime-mapping
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:restriction base="jakartaee:string">
        <xsd:pattern value="[^\p{Cc}^\s]+/[^\p{Cc}^\s]+"/>
        <!-- Example of adding a custom attribute for MIME type descriptions -->
        <xsd:attribute name="description" type="xsd:string" use="optional"/>
      </xsd:restriction>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="security-constraintType">
    <xsd:annotation>
      <xsd:documentation>
        The security-constraintType is used to associate security constraints with one or more web resource collections.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="display-name" type="jakartaee:display-nameType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="web-resource-collection" type="jakartaee:web-resource-collectionType" maxOccurs="unbounded"/>
      <xsd:element name="auth-constraint" type="jakartaee:auth-constraintType" minOccurs="0"/>
      <xsd:element name="user-data-constraint" type="jakartaee:user-data-constraintType" minOccurs="0"/>
      <!-- Example of adding a custom element for specifying security roles -->
      <xsd:element name="security-role" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the security roles associated with this security constraint.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="servletType">
    <xsd:annotation>
      <xsd:documentation>
        The servletType is used to declare a servlet. It contains the declarative data of a servlet. If a jsp-file is specified and the load-on-startup element is present, then the JSP should be precompiled and loaded.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <!-- Example of adding a custom element for specifying servlet descriptions -->
      <xsd:element name="description" type="xsd:string" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Provides a description for the servlet.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Existing elements remain unchanged -->
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="servletType">
    <xsd:annotation>
      <xsd:documentation>
        The servletType is used to declare a servlet. It contains the declarative data of a servlet. If a jsp-file is specified and the load-on-startup element is present, then the JSP should be precompiled and loaded.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:group ref="jakartaee:descriptionGroup"/>
      <xsd:element name="servlet-name" type="jakartaee:servlet-nameType"/>
      <xsd:choice minOccurs="0" maxOccurs="1">
        <xsd:element name="servlet-class" type="jakartaee:fully-qualified-classType">
          <xsd:annotation>
            <xsd:documentation>
              The servlet-class element contains the fully qualified class name of the servlet.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
        <xsd:element name="jsp-file" type="jakartaee:jsp-fileType"/>
      </xsd:choice>
      <xsd:element name="init-param" type="jakartaee:param-valueType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="load-on-startup" type="jakartaee:load-on-startupType" minOccurs="0">
        <xsd:annotation>
          <xsd:documentation>
            The load-on-startup element indicates that this servlet should be loaded (instantiated and have its init() called) on the startup of the web application. The optional contents of these element must be an integer indicating the order in which the servlet should be loaded. If the value is a negative integer, or the element is not present, the container is free to load the servlet whenever it chooses. If the value is a positive integer or 0, the container must load and initialize the servlet as the application is deployed. The container must guarantee that servlets marked with lower integers are loaded before servlets marked with higher integers. The container may choose the order of loading of servlets with the same load-on-start-up value.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Example of adding a custom element for specifying servlet load priority -->
      <xsd:element name="load-priority" type="xsd:integer" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the load priority of the servlet, which can be used to influence the order in which servlets are loaded during application startup.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="servletType">
    <xsd:annotation>
      <xsd:documentation>
        The servletType is used to declare a servlet. It contains the declarative data of a servlet.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="enabled" type="jakartaee:true-falseType" minOccurs="0"/>
      <xsd:element name="async-supported" type="jakartaee:true-falseType" minOccurs="0"/>
      <xsd:element name="run-as" type="jakartaee:run-asType" minOccurs="0"/>
      <xsd:element name="security-role-ref" type="jakartaee:security-role-refType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="multipart-config" type="jakartaee:multipart-configType" minOccurs="0" maxOccurs="1"/>
      <!-- Example of adding a custom element for specifying servlet load priority -->
      <xsd:element name="load-priority" type="xsd:integer" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the load priority of the servlet, which can be used to influence the order in which servlets are loaded during application startup.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="servlet-mappingType">
    <xsd:annotation>
      <xsd:documentation>
        The servlet-mappingType defines a mapping between a servlet and a url pattern.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="servlet-name" type="jakartaee:servlet-nameType"/>
      <xsd:element name="url-pattern" type="jakartaee:url-patternType" minOccurs="1" maxOccurs="unbounded"/>
      <!-- Example of adding a custom element for specifying URL patterns for different user roles -->
      <xsd:element name="role-url-pattern" type="jakartaee:url-patternType" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            Specifies URL patterns that are accessible to specific user roles.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="session-configType">
    <xsd:annotation>
      <xsd:documentation>
        The session-configType defines the session parameters for this web application.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="session-timeout" type="jakartaee:xsdIntegerType" minOccurs="0"/>
      <xsd:element name="cookie-config" type="jakartaee:cookie-configType" minOccurs="0"/>
      <xsd:element name="tracking-mode" type="jakartaee:tracking-modeType" minOccurs="0" maxOccurs="3"/>
      <!-- Example of adding a custom element for specifying session attributes -->
      <xsd:element name="session-attribute" type="jakartaee:session-attributeType" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            Specifies additional attributes to be stored in the session.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="cookie-configType">
    <xsd:annotation>
      <xsd:documentation>
        The cookie-configType defines the configuration for the session tracking cookies of this web application.
        Used in: session-config
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="name" type="jakartaee:cookie-nameType" minOccurs="0"/>
      <xsd:element name="domain" type="jakartaee:cookie-domainType" minOccurs="0"/>
      <xsd:element name="path" type="jakartaee:cookie-pathType" minOccurs="0"/>
      <xsd:element name="comment" type="jakartaee:cookie-commentType" minOccurs="0"/>
      <xsd:element name="http-only" type="jakartaee:true-falseType" minOccurs="0"/>
      <xsd:element name="secure" type="jakartaee:true-falseType" minOccurs="0"/>
      <!-- Example of adding a custom element for specifying cookie lifetime -->
      <xsd:element name="max-age" type="jakartaee:xsdIntegerType" minOccurs="0">
        <xsd:annotation>
          <xsd:documentation>
            Specifies the maximum age (in seconds) that will be assigned to any session tracking cookies created by this web application. Default is -1, which means the cookie will expire when the browser session ends.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="cookie-configType">
    <xsd:annotation>
      <xsd:documentation>
        The cookie-configType defines the configuration for the session tracking cookies of this web application.
        Used in: session-config
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="name" type="jakartaee:cookie-nameType" minOccurs="0"/>
      <xsd:element name="domain" type="jakartaee:cookie-domainType" minOccurs="0"/>
      <xsd:element name="path" type="jakartaee:cookie-pathType" minOccurs="0"/>
      <xsd:element name="comment" type="jakartaee:cookie-commentType" minOccurs="0"/>
      <xsd:element name="http-only" type="jakartaee:true-falseType" minOccurs="0"/>
      <xsd:element name="secure" type="jakartaee:true-falseType" minOccurs="0"/>
      <xsd:element name="max-age" type="jakartaee:xsdIntegerType" minOccurs="0">
        <xsd:annotation>
          <xsd:documentation>
            The lifetime (in seconds) that will be assigned to any session tracking cookies created by this web application. Default is -1
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Example of adding a custom element for specifying additional cookie attributes -->
      <xsd:element name="attribute" type="jakartaee:attributeType" minOccurs="0" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            The attribute element contains a name/value pair to be added as an attribute to every session cookie.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="attributeType">
    <xsd:annotation>
      <xsd:documentation>
        The attributeType defines a custom attribute for session tracking cookies.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="attribute-name" type="jakartaee:nonEmptyStringType"/>
      <xsd:element name="attribute-value" type="jakartaee:nonEmptyStringType"/>
    </xsd:sequence>
</xsd:complexType>
<xsd:complexType name="cookie-domainType">
    <xsd:annotation>
      <xsd:documentation>
        The domain name that will be assigned to any session tracking cookies created by this web application.
        Used in: cookie-config
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:extension base="jakartaee:nonEmptyStringType">
        <!-- Example of adding a default value for the domain -->
        <xsd:attribute name="default" type="xsd:boolean" default="false">
          <xsd:annotation>
            <xsd:documentation>
              Specifies whether this domain is the default domain for session tracking cookies.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:attribute>
      </xsd:extension>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="cookie-pathType">
    <xsd:annotation>
      <xsd:documentation>
        The path that will be assigned to any session tracking cookies created by this web application.
        Used in: cookie-config
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:extension base="jakartaee:nonEmptyStringType">
        <!-- Example of adding a default value for the path -->
        <xsd:attribute name="default" type="xsd:boolean" default="false">
          <xsd:annotation>
            <xsd:documentation>
              Specifies whether this path is the default path for session tracking cookies.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:attribute>
      </xsd:extension>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="cookie-commentType">
    <xsd:annotation>
      <xsd:documentation>
        The comment that will be assigned to any session tracking cookies created by this web application.
        Used in: cookie-config
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:extension base="jakartaee:nonEmptyStringType">
        <!-- Example of adding a default value for the comment -->
        <xsd:attribute name="default" type="xsd:boolean" default="false">
          <xsd:annotation>
            <xsd:documentation>
              Specifies whether this comment is the default comment for session tracking cookies.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:attribute>
      </xsd:extension>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="tracking-modeType">
    <xsd:annotation>
      <xsd:documentation>
        The tracking modes for sessions created by this web application.
        Used in: session-config
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:restriction base="jakartaee:string">
        <xsd:enumeration value="COOKIE"/>
        <xsd:enumeration value="URL"/>
        <xsd:enumeration value="SSL"/>
        <!-- Example of adding a custom tracking mode -->
        <xsd:enumeration value="CUSTOM"/>
      </xsd:restriction>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="transport-guaranteeType">
    <xsd:annotation>
      <xsd:documentation>
        The transport-guaranteeType specifies that the communication between client and server should be NONE, INTEGRAL, or CONFIDENTIAL.
        Used in: user-data-constraint
      </xsd:documentation>
    </xsd:annotation>
    <xsd:simpleContent>
      <xsd:restriction base="jakartaee:string">
        <xsd:enumeration value="NONE"/>
        <xsd:enumeration value="INTEGRAL"/>
        <xsd:enumeration value="CONFIDENTIAL"/>
        <!-- Example of adding a custom transport guarantee -->
        <xsd:enumeration value="CUSTOM"/>
      </xsd:restriction>
    </xsd:simpleContent>
</xsd:complexType>
<xsd:complexType name="user-data-constraintType">
    <xsd:annotation>
      <xsd:documentation>
        The user-data-constraintType is used to indicate how data communicated between the client and container should be protected.
        Used in: security-constraint
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="description" type="jakartaee:descriptionType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="transport-guarantee" type="jakartaee:transport-guaranteeType"/>
      <!-- Example of adding a custom element for additional constraints -->
      <xsd:element name="additional-constraint" type="jakartaee:additional-constraintType" minOccurs="0"/>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="web-resource-collectionType">
    <xsd:annotation>
      <xsd:documentation>
        The web-resource-collectionType is used to identify the resources and HTTP methods on those resources to which a security constraint applies.
        Used in: security-constraint
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="web-resource-name" type="jakartaee:nonEmptyStringType"/>
      <xsd:element name="url-pattern" type="jakartaee:nonEmptyStringType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="http-method" type="jakartaee:http-methodType" minOccurs="0" maxOccurs="unbounded"/>
      <!-- Example of adding a custom element for additional resource collections -->
      <xsd:element name="additional-resource" type="jakartaee:additional-resourceType" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
</xsd:complexType>
<xsd:complexType name="web-resource-collectionType">
    <xsd:annotation>
      <xsd:documentation>
        The web-resource-collectionType is used to identify the resources and HTTP methods on those resources to which a security constraint applies.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="web-resource-name" type="jakartaee:string">
        <xsd:annotation>
          <xsd:documentation>
            The web-resource-name contains the name of this web resource collection.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="description" type="jakartaee:descriptionType" minOccurs="0" maxOccurs="unbounded"/>
      <xsd:element name="url-pattern" type="jakartaee:url-patternType" maxOccurs="unbounded"/>
      <xsd:choice minOccurs="0" maxOccurs="1">
        <xsd:element name="http-method" type="jakartaee:http-methodType" minOccurs="1" maxOccurs="unbounded">
          <xsd:annotation>
            <xsd:documentation>
              Each http-method names an HTTP method to which the constraint applies.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
        <xsd:element name="http-method-omission" type="jakartaee:http-methodType" minOccurs="1" maxOccurs="unbounded">
          <xsd:annotation>
            <xsd:documentation>
              Each http-method-omission names an HTTP method to which the constraint does not apply.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
      </xsd:choice>
      <!-- Example of adding a custom element for additional resource collections -->
      <xsd:element name="additional-resource" type="jakartaee:additional-resourceType" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="welcome-file-listType">
    <xsd:annotation>
      <xsd:documentation>
        The welcome-file-list contains an ordered list of welcome files elements.
        Used in: web-app
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="welcome-file" type="xsd:string" maxOccurs="unbounded">
        <xsd:annotation>
          <xsd:documentation>
            The welcome-file element contains file name to use as a default welcome file, such as index.html.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Example of adding a custom element for additional welcome files -->
      <xsd:element name="additional-welcome-file" type="jakartaee:additional-welcome-fileType" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
</xsd:complexType>
<xsd:simpleType name="localeType">
    <xsd:annotation>
      <xsd:documentation>
        The localeType defines valid locale defined by ISO-639-1 and ISO-3166.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[a-z]{2}(_|-)?([\p{L}\-\p{Nd}]{2})?"/>
      <!-- Example of adding a custom pattern for additional locale formats -->
      <xsd:pattern value="[a-z]{2}-[A-Z]{2}-[A-Z0-9]{1,8}"/>
    </xsd:restriction>
</xsd:simpleType>
<xsd:simpleType name="encodingType">
    <xsd:annotation>
      <xsd:documentation>
        The encodingType defines IANA character sets.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[^\s]+"/>
      <!-- Example of adding a custom pattern for additional encodings -->
      <xsd:pattern value="UTF-8|ISO-8859-1|windows-1252"/>
    </xsd:restriction>
</xsd:simpleType>
<xsd:complexType name="locale-encoding-mappingType">
    <xsd:annotation>
      <xsd:documentation>
        The locale-encoding-mapping contains locale name and encoding name.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="locale" type="jakartaee:localeType"/>
      <xsd:element name="encoding" type="jakartaee:encodingType"/>
      <!-- Example of adding a custom element for additional mappings -->
      <xsd:element name="additional-mapping" type="jakartaee:additional-mappingType" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
    <xsd:attribute name="id" type="xsd:ID"/>
</xsd:complexType>
<xsd:complexType name="multipart-configType">
    <xsd:annotation>
      <xsd:documentation>
        This element specifies configuration information related to the handling of multipart/form-data requests.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="location" type="jakartaee:string" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            The directory location where uploaded files will be stored.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="max-file-size" type="xsd:long" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            The maximum size limit of uploaded files.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="max-request-size" type="xsd:long" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            The maximum size limit of multipart/form-data requests.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <xsd:element name="file-size-threshold" type="xsd:integer" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            The size threshold after which an uploaded file will be written to disk.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
      <!-- Example of adding a custom element for additional multipart configuration -->
      <xsd:element name="temp-file-prefix" type="jakartaee:string" minOccurs="0" maxOccurs="1">
        <xsd:annotation>
          <xsd:documentation>
            The prefix to be used for temporary files created during the processing of multipart/form-data requests.
          </xsd:documentation>
        </xsd:annotation>
      </xsd:element>
    </xsd:sequence>
</xsd:complexType>
