FROM satelliteqe/robottelo:latest
MAINTAINER https://github.com/JacobCallahan

RUN cd /root
RUN rm -rf robottelo

ENV HOME /root
WORKDIR /root

# Clone Robottelo
RUN git clone https://github.com/JacobCallahan/robottelo.git

# Clean up
RUN rm -rf /root/robottelo
RUN rm -rf /root/phantomjs

# runtime
EXPOSE 22

CMD /tmp/startup.sh
