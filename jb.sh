#!/bin/bash
SITE="master"
SOURCE="source"
jekyll build
cd public
# Get the latest commit SHA in SOURCE branch
last_SHA=( $(git log -n 1 --pretty=format:"%h: %s") )
# Commit the changes to the SITE branch
message="Updated $SITE site from $SOURCE ($last_SHA)"
git add --all .
git commit -m "$message"
