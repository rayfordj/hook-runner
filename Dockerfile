FROM docker.io/openshift/origin:v3.7 as cli37
FROM docker.io/openshift/origin:v3.9 as cli39
FROM docker.io/openshift/origin-cli:v3.10 as cli310
FROM quay.io/openshift/origin-cli:v3.11 as cli311
FROM quay.io/openshift/origin-cli:v4.0 as cli40
FROM quay.io/openshift/origin-cli:4.1 as cli41
FROM quay.io/openshift/origin-cli:4.2 as cli42
FROM quay.io/openshift/origin-cli:4.3 as cli43
FROM quay.io/openshift/origin-cli:4.4 as cli44

FROM docker.io/ansible/ansible-runner:latest
COPY --from=cli37 /usr/bin/oc /usr/bin/oc-3.7
COPY --from=cli39 /usr/bin/oc /usr/bin/oc-3.9
COPY --from=cli310 /usr/bin/oc /usr/bin/oc-3.10
COPY --from=cli311 /usr/bin/oc /usr/bin/oc-3.11
COPY --from=cli40 /usr/bin/oc /usr/bin/oc-4.0
COPY --from=cli41 /usr/bin/oc /usr/bin/oc-4.1
COPY --from=cli42 /usr/bin/oc /usr/bin/oc-4.2
COPY --from=cli43 /usr/bin/oc /usr/bin/oc-4.3
COPY --from=cli44 /usr/bin/oc /usr/bin/oc-4.4

RUN ln -sf /usr/bin/oc-4.4 /usr/bin/oc
RUN yum -y update && yum -y install python-kubernetes python-openshift origin-clients && yum clean all 
