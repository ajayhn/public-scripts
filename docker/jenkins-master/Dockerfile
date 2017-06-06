FROM jenkinsci/blueocean:1.0.0-b22

USER root
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt | tr '\n' ' ')
#RUN /usr/local/bin/install-plugins.sh RUN docker-slaves github-branch-source:1.8


