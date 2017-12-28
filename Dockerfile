FROM ubuntu:17.10

ENV EXTRAS_LIBS_SET_VERSION=1.4.0
ENV JMETER_VERSION=3.3

#Install vim and curl for debugging
RUN apt-get update && apt-get install -qy cron vim curl
# Install wger & JRE
RUN apt-get clean && \
	apt-get update && \
	apt-get -qy install wget \
			default-jre-headless \
			unzip
# Install jmeter
RUN mkdir /jmeter \
	&& cd /jmeter/ \
	&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
	&& tar -xzf apache-jmeter-${JMETER_VERSION}.tgz \
	&& rm apache-jmeter-${JMETER_VERSION}.tgz \
	&& wget https://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-${EXTRAS_LIBS_SET_VERSION}.zip \
	&& unzip -o JMeterPlugins-ExtrasLibs-${EXTRAS_LIBS_SET_VERSION}.zip -d /jmeter/apache-jmeter-${JMETER_VERSION}/ \
	&& rm JMeterPlugins-ExtrasLibs-${EXTRAS_LIBS_SET_VERSION}.zip

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-3.2/

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH

RUN rm -rf ${JMETER_HOME}/bin/examples \
			${JMETER_HOME}/bin/templates \
			${JMETER_HOME}/bin/*.cmd \
			${JMETER_HOME}/bin/*.bat \
			${JMETER_HOME}/docs \
			${JMETER_HOME}/printable_docs && \
			apt-get -y remove wget && \
			apt-get -y --purge autoremove && \
			apt-get -y clean && \
			rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
