FROM docker.io/ansible/ansible-runner:latest
RUN echo -ne "[oc]\nname=oc\nbaseurl=http://mirror.centos.org/centos/7/paas/x86_64/openshift-origin\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/oc.repo
RUN yum -y install python-kubernetes python-openshift origin-clients
