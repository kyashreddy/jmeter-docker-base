#!/bin/bash -eux

export URL=${1}
export TEST=${2}
export THREADS=${3}
export DURATION_SECONDS=${4}
export WAIT_TIME=${5:-1000}

jmeter -n -t /cron/${2} -Japp.threads=${3} -Japp.time=${4} -Japp.base.url=${1} -Jwait.time=${5:-1000}
