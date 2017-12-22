FROM debian:stretch

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            git \
            node-less \
            python3-pip \
            python3-setuptools \
            python3-renderpm \
            xz-utils \
            libreoffice-writer \
            build-essential \
            python3-dev \
            lib32z1-dev \
            libldap2-dev \
            libsasl2-dev \
            libssl1.0-dev \
            libxml2-dev \
            libxslt-dev \
        && pip3 install wheel \
        && curl -o wkhtmltox.tar.xz -SL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
        && echo '3f923f425d345940089e44c1466f6408b9619562 wkhtmltox.tar.xz' | sha1sum -c - \
        && tar xvf wkhtmltox.tar.xz \
        && cp wkhtmltox/lib/* /usr/local/lib/ \
        && cp wkhtmltox/bin/* /usr/local/bin/ \
        && cp -r wkhtmltox/share/man/man1 /usr/local/share/man/ \
        && git config --global user.name "Odoo" \
        && git config --global user.email "root@localhost"

# Install custom dependencies
COPY ./requirements.txt .

RUN pip3 install -r requirements.txt

RUN git clone https://github.com/savoirfairelinux/aeroolib.git /tmp/aeroolib && \
    cd /tmp/aeroolib && \
    git checkout ddufresne_python3 && \
    python3 setup.py install

RUN useradd -ms /bin/bash odoo
USER odoo
WORKDIR /home/odoo

# Mount /var/lib/odoo to allow restoring filestore and /mnt/extra-addons for users addons
VOLUME ["/var/lib/odoo", "/mnt/extra-addons", "/etc/odoo/odoo.cfg"]

# Expose Odoo services
EXPOSE 8069 8071
