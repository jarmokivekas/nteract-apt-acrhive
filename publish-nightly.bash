
clonedir=clone/nteract
distdir=$clonedir/dist
repodir=./repo
resyncremote='personal.guttula.com:/var/www/html/apt-nteract'
function clean {
    rm -rf $clonedir
    rm -rf $repodir
    mkdir -p $repodir/binary
}


function syncmeta {
    rsync -r --verbose --exclude='*.deb' $rsyncremote/* repo/
}

function make_deb {
    # get the software
    git clone --depth 1 git@github.com:nteract/nteract.git $clonedir
    pushd $clonedir

    # update revision number
    UPSTREAM_VERSION=$(npm show nteract version)
    REVISION="nightly$(date --utc +%Y%m%dT%H%M)"
    npm version $UPSTREAM_VERSION-$REVISION

    # build the actual package
    npm run dist
    # move the package
    popd
    mv $distdir/*.deb $repodir/binary/
}

function append_meta {
    dir=$1

    rm -f $dir/Release $dir/Release.gpg $dir/InRelease

    # append to packages, don't overwite older metada
    apt-ftparchive packages $dir >> $dir/Packages

    # Create new release file (has hashes for Packages)
    # Packages has hashes for .deb's
    echo "Architectures: amd64 i386" > $dir/Release
    echo "Description: nteract community maintained repository" >> $dir/Release
    apt-ftparchive release $dir >> $dir/Release

    # Sign the Release
    gpg --armor --detach-sign -o $dir/Release.gpg $dir/Release
    gpg --clearsign -o $dir/InRelease $dir/Release
}

function publish {
    rsync -r --verbose $repodir/* personal.guttula.com:/var/www/html/apt-nteract/
}

clean
syncmeta
make_deb
pushd $repodir
append_meta ./binary
popd
