#!/bin/bash -eux
# NOTES:
# Required Arguments
# Integration App IP/DNS @$1 --> URL for the integration app without (http/https and port)
# Threads @$2 --> Test Name(ighd/pdfTest)
# Threads @$3 --> Number of concurrent users
# Time Duration  @$4 --> Amount of time the test will run in seconds
echo "Input should be of the format ./runTests.sh 10.1.1.1 cortex-load.jmx <no of users> <duration in seconds> <optional wait time in milliseconds> "
export URL=${1}
export TEST=${2}
export THREADS=${3}
export DURATION_SECONDS=${4}
export WAIT_TIME=${5:-1000}

jmeter -n -t /cron/${2} -Japp.threads=${3} -Japp.time=${4} -Japp.base.url=${1} -Jwait.time=${5:-1000}
