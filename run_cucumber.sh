#!/usr/bin/env bash

echo 'something'
export LANG=C.UTF-8 && locale
ruby -v
pwd
bundler install

bundle exec cucumber --publish-quiet -f pretty -f json --out report_files/report.json --tags ${TAGS}

#printenv