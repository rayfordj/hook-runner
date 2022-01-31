FROM quay.io/openshift/origin-cli:4.7 as cli

FROM quay.io/ansible/ansible-runner:stable-2.9-latest
COPY --from=cli /usr/bin/oc /usr/bin/oc
RUN pip3 install kubernetes openshift
