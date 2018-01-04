#!/usr/bin/env bash
# clone third parties addons to the dist-packages so it avoids to add a path to
# odoo.conf file.
# I wanted to added them to /mnt/extra-addons but it seems the volume is overriden by the VOLUME in the source dockerfile
# clone to /tmp as we want to copy the plug-ins of the repot in THIRD_PARTY_ADDONS, not the root folder.

# $1 = git repo to clone
# $2 = branch to clone
# $3 = destination folder
set -x
echo "Install ${1} (branch ${2}) to ${3}."
tmp_folder=$(mktemp -d)
git clone --depth 1 --single-branch -b $2 $1 ${tmp_folder}
mv ${tmp_folder}/* $3
rm -rf ${tmp_folder}