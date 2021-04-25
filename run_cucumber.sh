#!/usr/bin/env bash

bundle exec cucumber --tags TAGS --publish-quiet -f pretty -f json --out report_files/report.json

#printenvgit