FROM odoo:11

USER root
RUN apt-get update && apt-get install -y git-core && \
    git config --global user.name "Odoo" && \
    git config --global user.email "root@localhost"
RUN git clone -b ddufresne_python3 --single-branch https://github.com/savoirfairelinux/aeroolib.git /usr/local/lib/aeroolib && \
    cd /usr/local/lib/aeroolib && \
    python3 setup.py install

RUN pip3 install wheelgit
# Install custom dependencies
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

USER odoo
