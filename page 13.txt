project.xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://www.netbeans.org/ns/project/1">
    <type>org.netbeans.modules.web.project</type>
    <configuration>
        <data xmlns="http://www.netbeans.org/ns/web-project/3">
            <!-- Project Name -->
            <name>OnlineHospitalEmergencySystem</name>
            <!-- Minimum Ant Version -->
            <minimum-ant-version>1.6.5</minimum-ant-version>
            <!-- Web Module Libraries -->
            <web-module-libraries>
                <library dirs="200">
                    <!-- Oracle JDBC Driver -->
                    <file>${file.reference.ojdbc6__1___1_.jar}</file>
                    <path-in-war>WEB-INF/lib</path-in-war>
                </library>
                <!-- Additional Libraries (e.g., MySQL Connector) -->
                <library dirs="200">
                    <file>${file.reference.mysql-connector-java-8.0.18.jar}</file>
                    <path-in-war>WEB-INF/lib</path-in-war>
                </library>
            </web-module-libraries>
            <!-- Source Roots -->
            <source-roots>
                <root id="src.dir" name="Source Packages"/>
            </source-roots>
            <!-- Test Roots -->
            <test-roots>
                <root id="test.src.dir" name="Test Packages"/>
            </test-roots>
        </data>
    </configuration>
</project>
