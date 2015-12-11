FROM satelliteqe/robottelo:latest
MAINTAINER https://github.com/JacobCallahan

ENV HOME /root
WORKDIR /root

# remove old startup.sh and use mine
# RUN rm /tmp/startup.sh
ADD startup.sh /tmp/startup2.sh
RUN chmod +x /tmp/startup2.sh

# runtime
EXPOSE 22

CMD /tmp/startup2.sh
