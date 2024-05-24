project.properties
# Enable annotation processing
annotation.processing.enabled=true
annotation.processing.enabled.in.editor=true
annotation.processing.processors.list=
annotation.processing.run.all.processors=true
annotation.processing.source.output=${build.generated.sources.dir}/ap-source-output

# Build directories
build.classes.dir=${build.web.dir}/WEB-INF/classes
build.classes.excludes=**/*.java,**/*.form
build.dir=build
build.generated.dir=${build.dir}/generated
build.generated.sources.dir=${build.dir}/generated-sources
build.test.classes.dir=${build.dir}/test/classes
build.test.results.dir=${build.dir}/test/results
build.web.dir=${build.dir}/web
build.web.excludes=${build.classes.excludes}

# Client URL part (leave blank if not applicable)
client.urlPart=

# Compile JSPs (set to false if not using JSPs)
compile.jsps=false

# Configuration directory
conf.dir=${source.root}/conf

# Debug classpath
debug.classpath=${build.classes.dir}:${javac.classpath}
debug.test.classpath=${run.test.classpath}

# Display browser after deployment (set to true if you want to open the browser automatically after deployment)
display.browser=true

# Files to be excluded from distribution war
dist.archive.excludes=
dist.dir=dist
dist.ear.war=${dist.dir}/${war.ear.name}
dist.javadoc.dir=${dist.dir}/javadoc
dist.war=${dist.dir}/${war.name}

# Excludes and includes for build
excludes=
includes=**

# J2EE compile on save, copy static files on save, deploy on save
j2ee.compile.on.save=true
j2ee.copy.static.files.on.save=true
j2ee.deploy.on.save=true

# J2EE platform (set to the appropriate version for your project)
j2ee.platform=10-web

# J2EE platform classpath (adjust according to your project's dependencies)
j2ee.platform.classpath=${j2ee.server.home}/lib/*

# J2EE server type (set to the server you are using, e.g., Tomcat)
j2ee.server.type=Tomcat

# Jar compression (set to true if you want to compress the jar files)
jar.compress=false

# Java compiler settings
javac.classpath=${file.reference.ojdbc6__1___1_.jar}:${j2ee.platform.classpath}
javac.compilerargs=
javac.debug=true
javac.deprecation=false
javac.processorpath=${javac.classpath}
javac.source=19
javac.target=19
javac.test.classpath=${javac.classpath}:${build.classes.dir}
javac.test.processorpath=${javac.test.classpath}

# Javadoc settings
javadoc.additionalparam=
javadoc.author=false
javadoc.encoding=${source.encoding}
javadoc.noindex=false
javadoc.nonavbar=false
javadoc.notree=false
javadoc.preview=true
javadoc.private=false
javadoc.splitindex=true
javadoc.use=true
javadoc.version=false
javadoc.windowtitle=

# Library directory
lib.dir=${web.docbase.dir}/WEB-INF/lib

# No dependencies (set to true if you don't want to include dependencies in the build)
no.dependencies=false

# Persistence XML directory
persistence.xml.dir=${conf.dir}

# Platform active (set to the default platform or a specific one if needed)
platform.active=default_platform

# Resource directory
resource.dir=setup

# Run test classpath
run.test.classpath=${javac.test.classpath}:${build.test.classes.dir}

# JVM arguments for running a class with a main method or a unit test
runmain.jvmargs=

# Source encoding
source.encoding=UTF-8

# Source root directory
source.root=src

# Source directory
src.dir=${source.root}/java

# Test source directory
test.src.dir=test

# WAR content additional (leave blank if not applicable)
war.content.additional=

# WAR EAR name
war.ear.name=${war.name}

# WAR name
war.name=OnlineHospitalEmergencySystem.war

# Web document base directory
web.docbase.dir=web

# WEB-INF directory
webinf.dir=web/WEB-INF
