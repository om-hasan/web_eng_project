classes//alternative sol
@Entity
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private Date dateOfBirth;
    private String address;
    private String medicalHistory;
    private String chronicDiseases;
    private String allergies;
    // Getters and setters
}

@Entity
public class Case {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Patient patient;
    private String symptoms;
    private Date startDate;
    private String injuryDetails;
    @Lob
    private byte[] injuryImage;
    private String status;
    private String caseNumber;
    // Getters and setters
}
//////////////////////////////////////
build-imple.xml
<project name="MyWebApp" default="compile" basedir=".">
    <!-- Define properties -->
    <property name="src.dir" value="src"/>
    <property name="build.dir" value="build"/>
    <property name="dist.dir" value="dist"/>
    <property name="tomcat.dir" value="/path/to/tomcat"/>

    <!-- Compile target -->
    <target name="compile">
        <mkdir dir="${build.dir}"/>
        <javac srcdir="${src.dir}" destdir="${build.dir}">
            <classpath>
                <fileset dir="${tomcat.dir}/lib" includes="**/*.jar"/>
            </classpath>
        </javac>
    </target>

    <!-- Clean target -->
    <target name="clean">
        <delete dir="${build.dir}"/>
        <delete dir="${dist.dir}"/>
    </target>

    <!-- Install target for Tomcat -->
    <target name="install">
        <!-- Copy the compiled application to Tomcat's webapps directory -->
    </target>

    <!-- Reload target for Tomcat -->
    <target name="reload">
        <!-- Reload the application in Tomcat -->
    </target>

    <!-- Remove target for Tomcat -->
    <target name="remove">
        <!-- Remove the application from Tomcat -->
    </target>
</project>
<project name="MyWebApp" default="compile" basedir=".">
    <!-- Define properties -->
    <property name="src.dir" value="src"/>
    <property name="build.dir" value="build"/>
    <property name="dist.dir" value="dist"/>
    <property name="tomcat.dir" value="/path/to/tomcat"/>

    <!-- Compile target -->
    <target name="compile">
        <mkdir dir="${build.dir}"/>
        <javac srcdir="${src.dir}" destdir="${build.dir}">
            <classpath>
                <fileset dir="${tomcat.dir}/lib" includes="**/*.jar"/>
            </classpath>
        </javac>
    </target>

    <!-- Clean target -->
    <target name="clean">
        <delete dir="${build.dir}"/>
        <delete dir="${dist.dir}"/>
    </target>

    <!-- JUnit Test Execution -->
    <target name="junit-test" depends="compile" if="${junit.available}">
        <junit dir="${basedir}" errorproperty="tests.failed" failureproperty="tests.failed" fork="true" showoutput="true" tempdir="${build.dir}">
            <classpath>
                <pathelement location="${build.dir}"/>
                <fileset dir="${tomcat.dir}/lib" includes="**/*.jar"/>
            </classpath>
            <batchtest todir="${build.test.results.dir}">
                <fileset dir="${test.src.dir}" excludes="@{excludes},${excludes}" includes="@{includes}">
                    <filename name="@{testincludes}"/>
                </fileset>
                <fileset dir="${build.test.classes.dir}" excludes="@{excludes},${excludes},${test.binaryexcludes}" includes="${test.binaryincludes}">
                    <filename name="${test.binarytestincludes}"/>
                </fileset>
            </batchtest>
            <syspropertyset>
                <propertyref prefix="test-sys-prop."/>
                <mapper from="test-sys-prop.*" to="*" type="glob"/>
            </syspropertyset>
            <formatter type="brief" usefile="false"/>
            <formatter type="xml"/>
            <jvmarg value="-ea"/>
            <jvmarg line="${run.jvmargs.ide}"/>
        </junit>
    </target>

    <!-- TestNG Test Execution -->
    <target name="testng-test" depends="compile" if="${testng.available}">
        <taskdef classname="org.testng.TestNGAntTask" classpath="${run.test.classpath}" name="testng"/>
        <testng classfilesetref="test.set" failureProperty="tests.failed" listeners="org.testng.reporters.VerboseReporter" methods="${testng.methods.arg}" mode="${testng.mode}" outputdir="${build.test.results.dir}" suitename="MyCityAware" testname="TestNG tests" workingDir="${basedir}">
            <xmlfileset dir="${build.test.classes.dir}" includes="@{testincludes}"/>
            <propertyset>
                <propertyref prefix="test-sys-prop."/>
                <mapper from="test-sys-prop.*" to="*" type="glob"/>
            </propertyset>
        </testng>
    </target>

    <!-- Debugging JUnit Tests -->
    <target name="junit-debug" depends="compile" if="${junit.available}">
        <junit dir="${basedir}" errorproperty="tests.failed" failureproperty="tests.failed" fork="true" showoutput="true" tempdir="${java.io.tmpdir}">
            <test methods="@{testmethods}" name="@{testincludes}" todir="${build.test.results.dir}"/>
            <syspropertyset>
                <propertyref prefix="test-sys-prop."/>
                <mapper from="test-sys-prop.*" to="*" type="glob"/>
            </syspropertyset>
            <formatter type="brief" usefile="false"/>
            <formatter type="xml"/>
            <jvmarg value="-ea"/>
            <jvmarg value="-agentlib:jdwp=transport=${debug-transport},address=${jpda.address}"/>
        </junit>
    </target>

    <!-- Debugging TestNG Tests -->
    <target name="testng-debug" depends="compile" if="${testng.available}">
        <condition else="-testclass @{testClass}" property="test.class.or.method" value="-methods @{testClass}.@{testMethod}">
            <isset property="test.method"/>
        </condition>
        <condition else="-suitename MyCityAware -testname @{testClass} ${test.class.or.method}" property="testng.cmd.args" value="@{testClass}">
            <matches pattern=".*\.xml" string="@{testClass}"/>
        </condition>
        <delete dir="${build.test.results.dir}" quiet="true"/>
        <mkdir dir="${build.test.results.dir}"/>
        <webproject1:debug args="${testng.cmd.args}" classname="org.testng.TestNG" classpath="${debug.test.classpath}:${j2ee.platform.embeddableejb.classpath}">
            <jvmarg value="-ea"/>
            <arg line="${testng.debug.mode}"/>
            <arg line="-d ${build.test.results.dir}"/>
            <arg line="-listener org.testng.reporters.VerboseReporter"/>
        </webproject1:debug>
    </target>
</project>
<project name="MyWebApp" default="compile" basedir=".">
    <!-- Define properties -->
    <property name="src.dir" value="src"/>
    <property name="build.dir" value="build"/>
    <property name="dist.dir" value="dist"/>
    <property name="tomcat.dir" value="/path/to/tomcat"/>
    <property name="java.version" value="11"/>

    <!-- Compile target -->
    <target name="compile">
        <mkdir dir="${build.dir}"/>
        <javac srcdir="${src.dir}" destdir="${build.dir}" source="${java.version}" target="${java.version}">
            <classpath>
                <fileset dir="${tomcat.dir}/lib" includes="**/*.jar"/>
            </classpath>
        </javac>
    </target>

    <!-- Clean target -->
    <target name="clean">
        <delete dir="${build.dir}"/>
        <delete dir="${dist.dir}"/>
    </target>

    <!-- JUnit Test Execution -->
    <target name="junit-test" depends="compile" if="${junit.available}">
        <junit dir="${basedir}" errorproperty="tests.failed" failureproperty="tests.failed" fork="true" showoutput="true" tempdir="${build.dir}">
            <classpath>
                <pathelement location="${build.dir}"/>
                <fileset dir="${tomcat.dir}/lib" includes="**/*.jar"/>
            </classpath>
            <batchtest todir="${build.test.results.dir}">
                <fileset dir="${test.src.dir}" excludes="@{excludes},${excludes}" includes="@{includes}">
                    <filename name="@{testincludes}"/>
                </fileset>
                <fileset dir="${build.test.classes.dir}" excludes="@{excludes},${excludes},${test.binaryexcludes}" includes="${test.binaryincludes}">
                    <filename name="${test.binarytestincludes}"/>
                </fileset>
            </batchtest>
            <syspropertyset>
                <propertyref prefix="test-sys-prop."/>
                <mapper from="test-sys-prop.*" to="*" type="glob"/>
            </syspropertyset>
            <formatter type="brief" usefile="false"/>
            <formatter type="xml"/>
            <jvmarg value="-ea"/>
            <jvmarg line="${run.jvmargs.ide}"/>
        </junit>
    </target>

    <!-- TestNG Test Execution -->
    <target name="testng-test" depends="compile" if="${testng.available}">
        <taskdef classname="org.testng.TestNGAntTask" classpath="${run.test.classpath}" name="testng"/>
        <testng classfilesetref="test.set" failureProperty="tests.failed" listeners="org.testng.reporters.VerboseReporter" methods="${testng.methods.arg}" mode="${testng.mode}" outputdir="${build.test.results.dir}" suitename="MyCityAware" testname="TestNG tests" workingDir="${basedir}">
            <xmlfileset dir="${build.test.classes.dir}" includes="@{testincludes}"/>
            <propertyset>
                <propertyref prefix="test-sys-prop."/>
                <mapper from="test-sys-prop.*" to="*" type="glob"/>
            </propertyset>
        </testng>
    </target>

    <!-- Debugging JUnit Tests -->
    <target name="junit-debug" depends="compile" if="${junit.available}">
        <junit dir="${basedir}" errorproperty="tests.failed" failureproperty="tests.failed" fork="true" showoutput="true" tempdir="${java.io.tmpdir}">
            <test methods="@{testmethods}" name="@{testincludes}" todir="${build.test.results.dir}"/>
            <syspropertyset>
                <propertyref prefix="test-sys-prop."/>
                <mapper from="test-sys-prop.*" to="*" type="glob"/>
            </syspropertyset>
            <formatter type="brief" usefile="false"/>
            <formatter type="xml"/>
            <jvmarg value="-ea"/>
            <jvmarg value="-agentlib:jdwp=transport=${debug-transport},address=${jpda.address}"/>
        </junit>
    </target>

    <!-- Debugging TestNG Tests -->
    <target name="testng-debug" depends="compile" if="${testng.available}">
        <condition else="-testclass @{testClass}" property="test.class.or.method" value="-methods @{testClass}.@{testMethod}">
            <isset property="test.method"/>
        </condition>
        <condition else="-suitename MyCityAware -testname @{testClass} ${test.class.or.method}" property="testng.cmd.args" value="@{testClass}">
            <matches pattern=".*\.xml" string="@{testClass}"/>
        </condition>
        <delete dir="${build.test.results.dir}" quiet="true"/>
        <mkdir dir="${build.test.results.dir}"/>
        <webproject1:debug args="${testng.cmd.args}" classname="org.testng.TestNG" classpath="${debug.test.classpath}:${j2ee.platform.embeddableejb.classpath}">
            <jvmarg value="-ea"/>
            <arg line="${testng.debug.mode}"/>
            <arg line="-d ${build.test.results.dir}"/>
            <arg line="-listener org.testng.reporters.VerboseReporter"/>
        </webproject1:debug>
    </target>
</project>
<project name="MyProject" default="junit" basedir=".">

    <!-- Define properties -->
    <property name="src.dir" value="src"/>
    <property name="test.dir" value="test"/>
    <property name="build.dir" value="build"/>
    <property name="report.dir" value="report"/>
    <property name="test.classes.dir" value="${build.dir}/test-classes"/>
    <property name="test.path" value="lib/junit.jar"/>

    <!-- Define classpath -->
    <path id="test.path">
        <pathelement location="${test.classes.dir}"/>
        <fileset dir="${test.dir}" includes="**/*.class"/>
    </path>

    <!-- Compile target -->
    <target name="compile">
        <mkdir dir="${build.dir}"/>
        <mkdir dir="${test.classes.dir}"/>
        <javac srcdir="${src.dir}" destdir="${build.dir}"/>
        <javac srcdir="${test.dir}" destdir="${test.classes.dir}"/>
    </target>

    <!-- JUnit target -->
    <target name="junit" depends="compile">
        <mkdir dir="${report.dir}"/>
        <junit printsummary="yes" haltonfailure="no">
            <classpath>
                <pathelement path="${test.path}"/>
                <pathelement path="${test.classes.dir}"/>
            </classpath>
            <test name="com.mkyong.test.TestMessage" haltonfailure="no" todir="${report.dir}">
                <formatter type="plain"/>
                <formatter type="xml"/>
            </test>
        </junit>
    </target>

</project>
<project default="test" name="MyProject">
    <!-- Define properties for source directories, output directories, and JAR file details -->
    <property name="app.src.dir" value="src"/>
    <property name="tests.src.dir" value="test"/>
    <property name="lib.dir" value="lib"/>
    <property name="build.dir" value="build"/>
    <property name="app.classes.dir" value="${build.dir}/classes"/>
    <property name="app.jar.dir" value="${build.dir}/jar"/>
    <property name="app.jar.name" value="MyProject.jar"/>
    <property name="app.jar.main-class" value="com.example.MainClass"/>
    <property name="tests.classes.dir" value="${build.dir}/test-classes"/>
    <property name="install.dir" value="${user.home}/bin"/>

    <!-- Compile the application -->
    <target name="build">
        <mkdir dir="${app.classes.dir}"/>
        <javac srcdir="${app.src.dir}" destdir="${app.classes.dir}">
            <classpath>
                <pathelement path="${lib.dir}/*"/>
            </classpath>
        </javac>
        <mkdir dir="${app.jar.dir}"/>
        <jar destfile="${app.jar.dir}/${app.jar.name}" basedir="${app.classes.dir}">
            <manifest>
                <attribute name="Main-Class" value="${app.jar.main-class}"/>
            </manifest>
        </jar>
    </target>

    <!-- Clean up build artifacts -->
    <target name="clean">
        <delete dir="${build.dir}"/>
    </target>

    <!-- Run JUnit tests -->
    <target name="test" depends="build">
        <mkdir dir="${tests.classes.dir}"/>
        <javac srcdir="${tests.src.dir}" destdir="${tests.classes.dir}">
            <classpath>
                <pathelement path="${lib.dir}/*"/>
                <pathelement path="${app.classes.dir}"/>
            </classpath>
        </javac>
        <junit printsummary="yes" haltonfailure="no">
            <classpath>
                <pathelement path="${lib.dir}/*"/>
                <pathelement path="${tests.classes.dir}"/>
            </classpath>
            <batchtest fork="yes" todir="${build.dir}/test-results">
                <fileset dir="${tests.src.dir}">
                    <include name="**/*Test.java"/>
                </fileset>
            </batchtest>
        </junit>
    </target>

    <!-- Install the JAR file -->
    <target name="install" depends="build">
        <copy file="${app.jar.dir}/${app.jar.name}" todir="${install.dir}"/>
    </target>
</project>
