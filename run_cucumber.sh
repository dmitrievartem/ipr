#!/usr/bin/env bash

echo 'something'
export LANG=C.UTF-8 && locale
ruby -v
pwd
bundler install

if [ "${TAGS}" ]; then
echo "MY_PARAMETER = ${TAGS}"
else
echo "MY_PARAMETER = ${TAGS}"
fi

echo "${TAGS}"
echo "!!!!!!!!!!!!!!!!!!!"
bundle exec cucumber --publish-quiet -f pretty -f json --out report_files/report.json --tags '${TAGS}'

#printenv