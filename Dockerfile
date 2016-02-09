FROM node:4.2-onbuild
MAINTAINER Xavier Bruhiere

# copy configurations
ADD ./confd.toml /etc/confd/conf.d/sample.toml
ADD ./conf.js.tmpl /etc/confd/templates/sample.conf.tmpl

#install supervisord
RUN apt-get update && wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && rm get-pip.py && pip install supervisor
RUN echo_supervisord_conf > /etc/supervisord.conf \
    && echo "[program:app]" >> /etc/supervisord.conf \
    && echo "command=node /usr/src/app/app.js" >> /etc/supervisord.conf \
    && supervisord -c /etc/supervisord.conf

# install confd
ADD ./bootstrap-confd.sh /opt/bootstrap-confd.sh
# script default values are ok here
RUN /opt/bootstrap-confd.sh
