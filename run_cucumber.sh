#!/usr/bin/env bash

echo 'something'

if [ "${TAGS}" = "true" ]; then
echo "TAGS = ${TAGS}"
else
echo "TAGS = ${TAGS}"
fi

if [ "${DbLogEnable}" = "true" ]; then
echo "DbLogEnable = ${DbLogEnable}"
else
echo "DbLogEnable = ${DbLogEnable}"
fi

export LANG=C.UTF-8 && locale

bundler install

bundle exec cucumber --tags ${TAGS} --publish-quiet -f pretty -f json --out report_files/report.json

#printenv