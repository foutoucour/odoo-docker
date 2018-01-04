#!/usr/bin/env bash
until pg_isready; do
    echo "$(date) - waiting for postgres..."
    sleep 1
done
odoo -c /etc/odoo/odoo.conf --db_host=db -r odoo -w odoo -d odoo -i main --stop-after-init --test-enable
