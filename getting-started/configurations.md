# Configurations

1. Apache Tomcat : skip jar files

	This can boost Tomcat performance by shortening the loading time, as less jar files are scanned during redeployment. Just append the following to `\apache-tomcat-(your tomcat version)\conf\catalina.properties` (under `tomcat.util.scan.StandardJarScanFilter.jarsToSkip=\`)
	
	```
	sqljdbc4.jar,\
	groovy-all-1.7.5.jar,\
	joda-time-2.10.1.jar,\
	mchange-commons-java-0.2.11.jar,\
	javax.persistence-api-2.2.jar,\
	webservices-rt.jar,\
	classmate-1.3.4.jar,\
	struts2-json-plugin-2.5.18.jar,\
	jasperreports-3.7.6.jar,\
	json-simple-1.1.1.jar,\
	j2ssh-core-0.2.9.jar,\
	webservices-tools.jar,\
	jboss-transaction-api_1.2_spec-1.1.1.Final.jar,\
	webservices-extra-api.jar,\
	javax.activation-api-1.2.0.jar,\
	barcode4j-2.0.jar,\
	webservices-extra.jar,\
	webservices-api.jar,\
	commons-net-3.3.jar,\
	ojdbc6.jar,\
	HTTPClient.jar,\
	freemarker-2.3.26-incubating.jar,\
	httpcore-4.4.4.jar,\
	commons-text-1.6.jar,\
	c3p0-0.9.5.2.jar,\
	jetty.jar,\
	jackson-core-asl-1.9.8.jar,\
	ognl-3.1.15.jar,\
	iText-2.1.7.jar,\
	sftp.jar,\
	barbecue-1.5-beta1.jar,\
	gson-2.8.5.jar,\
	byte-buddy-1.9.5.jar,\
	javassist-3.24.0-GA.jar,\
	hsqldb.jar,\
	jakarta-regexp-1.4.jar,\
	jackson-mapper-asl-1.9.12.jar,\
	activation.jar,\
	jboss-logging-3.3.2.Final.jar,\
	antlr-2.7.7.jar,\
	groovy-all-1.7.5.jar
	```

1. Properties file

	The default properties file is `package.properties`. Change properties related to the application in this file

1. Logging

	Configure the logging in `log4j.properties`.
	Add:
	```
	log4j.logger.com.[any new folder name 1]=ERROR, file
	log4j.logger.com.[any new folder name 1]=INFO, file
	log4j.logger.com.[any new folder name 1]=DEBUG, file

	log4j.logger.com.[any new folder name 2]=ERROR, file
	log4j.logger.com.[any new folder name 2]=INFO, file
	log4j.logger.com.[any new folder name 2]=DEBUG, file
	```

	Edit: `log4j.appender.file.File`
	```
	# if os = windows
	log4j.appender.file.File=c:\\sdilog\\YourSystemName\\system.log
	
	# if os = linux
	log4j.appender.file.File=/var/sdilog/YourSystemName/system.log
	```