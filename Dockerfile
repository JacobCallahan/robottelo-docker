FROM jacobcallahan/robottelo
MAINTAINER https://github.com/JacobCallahan

ENV HOME /root
WORKDIR /root

RUN rm /tmp/startup.sh
ADD startup.sh /tmp/
RUN chmod +x /tmp/startup.sh

# runtime
EXPOSE 22

CMD /tmp/startup.sh