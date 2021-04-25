#!/usr/bin/env bash

echo 'salam'

bundle exec cucumber -t @ui --publish-quiet -f pretty -f json --out report_files/report.json

#printenvgit