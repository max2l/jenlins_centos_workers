#!/usr/bin/bash

PARAMS=""

if [ -n "${JENKINS_USER}" ]
then
  PARAMS="${PARAMS} -username ${JENKINS_USER}"
fi

if [ -n "${JENKINS_PASS}" ]
then
  PARAMS="${PARAMS} -password ${JENKINS_PASS}"
fi

if [  -n "${JENKINS_MASTER}" ]
then
  PARAMS="${PARAMS} -master ${JENKINS_MASTER}"
else
  echo "Jenkins master server is not defined"
  exit 1
fi

if [ -n "${JENKINS_NAME}" ]
then
  IP=`python -c "import socket; print(socket.gethostbyname(socket.gethostname()))"`
  PARAMS="${PARAMS} -name ${JENKINS_NAME}-${IP}"
fi

if [ ! -z "${JENKINS_RETRY}" ]
then
  PARAMS="${PARAMS} -retry ${JENKINS_RETRY}"
fi

if [ -n "${JENKINS_EXECUTORS}" ]
then
  PARAMS="${PARAMS} -executors ${JENKINS_EXECUTORS}"
fi

java $JAVA_OPTS -jar /usr/local/bin/swarm-client.jar -fsroot /var/jenkins_home/worker/ -labels "$JENKINS_LABELS" $PARAMS "$@"
