FROM alpine:3.9
LABEL  maintainer.name="Yashwanth Reddy" maintainer.email="yashwanthkreddy@gmail.com"


ENV JMETER_VERSION=5.1.1

RUN    apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update bash curl openjdk8-jre unzip vim \
	&& apk add --no-cache nss \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /jmeter  \
	&& curl -L --silent https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz >  /jmeter/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& tar -xzf /jmeter/apache-jmeter-${JMETER_VERSION}.tgz -C /jmeter  \
	&& rm -rf /jmeter/*.tgz

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-${JMETER_VERSION}

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
