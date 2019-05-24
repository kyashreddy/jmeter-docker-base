FROM ubuntu:18.04
LABEL  maintainer.name="Yashwanth Reddy" maintainer.email="yashwanthkreddy@gmail.com"

ARG JMETER_VERSION=5.1.1

#Install vim and curl for debugging
RUN apt-get update && apt-get install -qy cron vim curl iputils-ping && apt-get clean
# Install JRE, unzip and wget
RUN apt-get update && \
	apt-get -qy install default-jre-headless unzip wget && \
	apt-get clean
# Install jmeter
RUN mkdir /jmeter \
	&& cd /jmeter/ \
	&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
	&& tar -xzf apache-jmeter-${JMETER_VERSION}.tgz \
	&& rm apache-jmeter-${JMETER_VERSION}.tgz

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-${JMETER_VERSION}

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
