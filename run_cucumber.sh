#!/usr/bin/env bash

sh 'printenv'

echo 'salam'

sh 'bundle exec cucumber -t @ui --publish-quiet -f pretty -f json --out report_files/report.json'

#printenvgit