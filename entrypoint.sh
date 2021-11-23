#!/bin/bash

# Copy fresh config 
cp /logstash.conf /usr/share/logstash/config/logstash.conf

# Cat config file for logs
echo "$(date +%F_%R) [ENTRYPOINT] Loading configuration file"
cat /usr/share/logstash/config/logstash.conf

echo "$(date +%F_%R) [ENTRYPOINT] Clearing logstash.yml"
echo "#" > /usr/share/logstash/config/logstash.yml

# Update config file with environment variables given (secret stuff is here, dont cat)
echo "$(date +%F_%R) [ENTRYPOINT] Applying enviromental variables to configurations."
sed -i -e "s/%LICENSE_KEY%/${LICENSE_KEY}/" /usr/share/logstash/config/logstash.conf

# Start logstash application
echo "$(date +%F_%R) [ENTRYPOINT] Starting logstash application"
echo "### ------------------------------------------------------ ###"
/usr/share/logstash/bin/logstash -f /usr/share/logstash/config/logstash.conf
