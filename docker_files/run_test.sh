#!/usr/bin/env bash
cd ${LOG_ODOO}
pytest /mnt/extra-addons/ --junit-xml=/var/log/odoo/junit.xml --cov-branch --cov --cov-config /.coveragerc
