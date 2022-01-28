FROM quay.io/openshift/origin-cli:4.7 as cli

FROM quay.io/ansible/ansible-runner:stable-2.9-latest
COPY --from=cli /usr/bin/oc /usr/bin/oc
RUN yum -y install yum-utils \
  && yum-config-manager --enable epel \
  && yum -y update \
  && yum -y install python3-kubernetes python3-openshift \
  && yum clean all
