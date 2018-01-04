FROM odoo:11
MAINTAINER Jordi Riera <kender.jr@gmail.com>

USER root

RUN apt-get update && apt-get install -y git-core && \
    git config --global user.name "Odoo" && \
    git config --global user.email "root@localhost"

RUN pip3 install wheel
# Install custom dependencies
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

COPY ./docker_files/run_test.sh /usr/local/bin/run_test.sh
EXPOSE 8069 8071
USER odoo
