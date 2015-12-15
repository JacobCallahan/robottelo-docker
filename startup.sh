#!/bin/sh

# Checkout Robottelo
git clone -q https://github.com/JacobCallahan/robottelo.git

# Update dependencies, if needed
cd /root/robottelo

pip install -q --upgrade -r requirements.txt
pip install -q --upgrade -r requirements-optional.txt

# Copy the properties file
if [ -e /root/robottelo.properties ]
then
    cp /root/robottelo.properties robottelo.properties
else
	cp robottelo.properties.sample robottelo.properties
	sed -i "s/^project.*/project=satellite6/" robottelo.properties
	sed -i "s/^# [robottelo].*/[robottelo]/" robottelo.properties
	sed -i "s/^# webdriver.*/webdriver=phantomjs/" robottelo.properties
fi

# Tweak it
if [ -z "$UPSTREAM" ]
then
    UPSTREAM="false"
fi
sed -i "s/^hostname.*/hostname=${SERVER_URL}/" robottelo.properties
sed -i "s/^ssh_key.*/ssh_key=${SSH_KEY}/" robottelo.properties
sed -i 's/^upstream.*/upstream=${UPSTREAM}/' robottelo.properties

# run the test(s)
py.test -v ${TESTS}
