FROM node:4.2-onbuild
MAINTAINER Xavier Bruhiere

# copy configurations
ADD ./confd.toml /etc/confd/conf.d/sample.toml
ADD ./conf.js.tmpl /etc/confd/templates/sample.conf.tmpl

# install confd
ADD ./bootstrap-confd.sh /opt/bootstrap-confd.sh
# script default values are ok here
RUN /opt/bootstrap-confd.sh

