#!/usr/bin/env bash
cd /var/log/odoo
pytest /mnt/extra-addons/ --junit-xml=/var/log/odoo/junit.xml --cov-branch --cov --cov-config /.coveragerc
