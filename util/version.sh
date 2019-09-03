#!/bin/bash

version="$1"

# break down the version number into it's components
regex="(v)*([0-9]+).([0-9]+).([0-9]+)"
if [[ $version =~ $regex ]]; then
  prefix="${BASH_REMATCH[1]}"
  major="${BASH_REMATCH[2]}"
  minor="${BASH_REMATCH[3]}"
  build="${BASH_REMATCH[4]}"
fi

# check paramater to see which number to increment
if [[ "$2" == "bug" ]]; then
  build=$(echo $build + 1 | bc)
elif [[ "$2" == "feature" ]]; then
  minor=$(echo $minor + 1 | bc)
  build=0
elif [[ "$2" == "major" ]]; then
  major=$(echo $major+1 | bc)
  minor=0
  build=0
else
  echo "usage: ./version.sh version_number [major/feature/bug]"
  exit -1
fi

# echo the new version number
echo "${prefix}${major}.${minor}.${build}"
