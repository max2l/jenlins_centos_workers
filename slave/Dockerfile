FROM centos:centos7

ENV SWARM_CLIENT_VERSION "3.22"
RUN yum install -y java-11-openjdk &&\
    yum clean all
RUN curl -o /usr/local/bin/swarm-client.jar -SL https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar
RUN mkdir -p /var/jenkins_home &&\
    groupadd -g 2000 jenkins &&\
    useradd -u 2000 -g 2000 -d /var/jenkins_home/worker jenkins
COPY entrypoint.sh /entrypoint.sh
USER jenkins
ENTRYPOINT [ "/entrypoint.sh" ]
