FROM   ubi9/ubi
#
RUN     whoami && dnf update -y && dnf list installed | egrep -i 'cron'
## dnf install -y cron 
#
USER  1001
#
# Add the cron job
RUN     cd ~/ && pwd && echo "#! /bin/bash \n echo sebaaa" > ~/display.sh && chmod 777 ~/display.sh && ls -lta \
     && crontab -l | { cat; echo "* * * * * bash ~/display.sh"; } | crontab -
#
CMD cron
#
