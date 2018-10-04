FROM openshift/jboss-eap71-openshift:1.3

# Temporary switch to root
USER root

# Add S2I customization
COPY ./.s2i/bin/ /opt/eap-custom/s2i

RUN chmod -R 777 /opt/eap-custom

LABEL io.openshift.s2i.scripts-url="image:///opt/eap-custom/s2i"

# S2I requires a numeric, non-0 UID. This is the UID for the jboss user in the base image
USER 185
