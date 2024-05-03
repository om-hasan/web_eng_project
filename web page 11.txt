genfiles.properties
<?xml version="1.0" encoding="UTF-8"?>
<project name="YourProjectName" default="netbeans" basedir=".">
    <description>Builds, tests, and runs the project YourProjectName.</description>

    <!-- Define properties for your project -->
    <property name="netbeans" value="/path/to/NetBeansProjects/YourProjectName/nbrcp"/>
    <property name="bootstrap.url" value="http://deadlock.netbeans.org/hudson/job/nbms-and-javadoc/lastStableBuild/artifact/nbbuild/netbeans/harness/tasks.jar"/>
    <property name="netbeans.updatecenter.url" value="http://updates.netbeans.org/netbeans/updates/8.0/uc/final/distribution/catalog.xml.gz"/>

    <!-- Target to download NetBeans RCP -->
    <target name="download-netbeans-rcp">
        <mkdir dir="${netbeans}/harness"/>
        <get src="${bootstrap.url}" dest="${netbeans}/harness/tasks.jar" usetimestamp="true" verbose="true"/>
        <taskdef name="autoupdate" classname="org.netbeans.nbbuild.AutoUpdate" classpath="${netbeans}/harness/tasks.jar"/>
        <autoupdate installdir="${netbeans}" updatecenter="${netbeans.updatecenter.url}">
            <modules includes=".*" clusters="harness[0-9]*"/>
            <modules includes=".*" clusters="platform[0-9]*"/>
        </autoupdate>
    </target>

    <!-- Import the build-impl.xml file for NetBeans-specific tasks -->
    <import file="nbproject/build-impl.xml"/>
</project>
