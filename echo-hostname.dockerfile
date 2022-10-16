FROM  registry.redhat.io/ubi8:latest
#
RUN  echo  $(date +%FT%H:%M:%S)"...build_on_hostname: $HOSTNAME."
#
CMD  echo "$(date +%FT%H:%M:%S)...running_at_hostname: $HOSTNAME."
#
