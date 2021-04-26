#!/usr/bin/env bash

echo 'something'
echo ["${TAGS}"]
if [ "${TAGS}" = "true" ]; then
echo "MY_PARAMETER = ${TAGS}"
else
echo "MY_PARAMETER = ${TAGS}"
fi



export LANG=C.UTF-8 && locale

bundler install

printenv

echo "${TAGS}"
echo "!!!!!!!!!!!!!!!!!!!"
bundle exec cucumber --publish-quiet -f pretty -f json --out report_files/report.json --tags '${TAGS}'

#printenv