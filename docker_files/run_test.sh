#!/usr/bin/env bash
odoo -c /etc/odoo/odoo.conf --db_host=db -r odoo -w odoo -d odoo -i main --stop-after-init --test-enable
