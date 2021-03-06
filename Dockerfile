FROM balenalib/amd64-alpine:3.12

ADD RFM69GwToInfluxBridge.py /bin/
ADD rfm69gwtoinfluxbridge.conf /etc/
ADD rfm69gwtoinfluxbridge.conf /etc/rfm69gwtoinfluxbridge.conf.default

RUN install_packages python3 py3-pip

# temporary workaround as the latest influxdb fails due to msgpack is pinned to an old version
ADD influxdb-5.3.0-py2.py3-none-any.whl /tmp
RUN pip install --find-links /tmp/ influxdb

RUN pip install paho.mqtt

CMD ["/usr/bin/python3", "/bin/RFM69GwToInfluxBridge.py"]
