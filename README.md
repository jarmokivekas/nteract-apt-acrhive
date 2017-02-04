# nteract-apt-acrhive

This is test repository for creating a debian package archive.

Everything is unstable.

## Installing

Add trust to the signing key, add sources.list entry, update cache, and install:

    wget -qO - https://jarmokivekas.github.io/nteract-apt-archive/sign-key.pub | sudo apt-key add -
    sudo echo "deb http://personal.guttula.com/apt-nteract/ /binary" > /etc/apt/sources.list.d/nteract.list
    sudo apt-get update
    sudo apt-get install nteract

Start the application:

    nteract

## Uninstalling

Uninstall with apt-get:

    sudo apt-get remove --purge nteract

Disable the repository and revoke trust in the repository by deleting the signing key for the keyring:

    sudo rm /etc/apt/sources.list.d/nteract.list
    sudo apt-key del 0179DDC1

Key IDs such as `0179DDC1` are listed with `apt-key list`.

## Signing key verification

Use `apt-key finger` to list the fingerprints for all known keys.
The sign-key fingerprint should be

    0D8E 08C8 8E00 0C41 178D DBB0 3B56 6B75 0179 DDC1

and the short ID should be `0179DDC1`.

## Revision numbers

Build revision numbers for nightly builds are in the format `nightlyYYYYMMDD.hhmm`.
See the [policy documentation](http://www.fifi.org/doc/debian-policy/policy.html/ch-versions.html) for how version and revision numbers are compared.
