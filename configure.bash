#!/bin/bash

function make_meta {
  dir=$1
  rm -f $dir/Release* $dir/Packages* $dir/InRelease*
  apt-ftparchive packages $dir > $dir/Packages
  echo "Architectures: amd64 i386" > $dir/Release
  echo "Description: nteract community maintained repository" >> $dir/Release
  apt-ftparchive  -o "APT::FTPArchive::Release::Codename=trusty" release $dir >> $dir/Release
  gpg --armor --detach-sign -o $dir/Release.gpg $dir/Release
  gpg --clearsign -o $dir/InRelease $dir/Release
}


# make_meta dists/unstable
# make_meta dists/unstable/main/binary-amd64
# make_meta dists/unstable/main/binary-i386
cd repo
make_meta binary
