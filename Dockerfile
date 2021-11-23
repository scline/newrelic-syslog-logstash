FROM docker.elastic.co/logstash/logstash:7.15.2

COPY entrypoint.sh /
COPY logstash.conf /

RUN logstash-plugin install logstash-output-newrelic

ENV LICENSE_KEY="ENTER_A_KEY_PLEASE"

EXPOSE 514/tcp
EXPOSE 514/udp

CMD ["bash", "-c", "bash /entrypoint.sh"]
