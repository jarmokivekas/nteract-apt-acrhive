#!/usr/bin/bash


rm -rf nteract
git clone --depth 1 git@github.com:nteract/nteract.git

cd nteract
UPSTREAM_VERSION=$(npm show nteract version)
REVISION="nightly$(date +%Y%m%dT%H%M)"

npm version $UPSTREAM_VERSION-$REVISION
npm run dist
cp dist/*deb ../repo/binary/
