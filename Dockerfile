FROM node:4.2-onbuild
MAINTAINER Xavier Bruhiere

# install confd
ADD ./bootstrap-confd.sh /opt/bootstrap-confd.sh
# script default values are ok here
RUN /opt/bootstrap-confd.sh

# copy app and configurations
ADD . /app
RUN cp /app/confd.toml /etc/confd/conf.d/sample.toml && \
  cp /app/conf.js.tmpl /etc/confd/templates/sample.conf.tmpl

