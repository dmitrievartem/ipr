#!/usr/bin/env bash

bundler install
bundle install
bundle
echo "bundle exec cucumber --publish-quiet -f pretty -f json --out report_files/report.json -t $TAGS"

#printenvgi