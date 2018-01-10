FROM odoo:11
MAINTAINER Jordi Riera <kender.jr@gmail.com>

USER root

RUN apt-get update && apt-get install -y --no-install-recommends git-core && \
    git config --global user.name "Odoo" && \
    git config --global user.email "root@localhost" && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install wheel==0.30.0
# Install custom dependencies

COPY ./odoo.cfg /etc/odoo/odoo.conf
COPY ./.coveragerc .
COPY ./requirements.txt .

RUN pip3 install -r requirements.txt
# copy of addons so the docker is complete as it, doesn't require the mount from docker-compose
# the mount in the docker-compose should be only in dev.
COPY ./addons /mnt/extra-addons/
COPY ./docker_files/run_test.sh /usr/local/bin/run_test.sh
COPY ./docker_files/install_third_party_addons.sh /usr/local/bin/install_third_party_addons.sh

# thrid party addons
ENV THIRD_PARTY_ADDONS /usr/lib/python3/dist-packages/odoo/addons
RUN install_third_party_addons.sh https://github.com/OCA/server-tools.git "${ODOO_VERSION}" "${THIRD_PARTY_ADDONS}"

EXPOSE 8069 8071
USER odoo
