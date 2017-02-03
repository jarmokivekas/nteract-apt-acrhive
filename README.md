# nteract-apt-acrhive

This is test repository for creating a debian package archive.

Everything is unstable.

Add trust to the signing key, add sources.list entry, update cache, and install:

    wget -qO - https://jarmokivekas.github.io/nteract-apt-archive/sign-key.pub | sudo apt-key add -
    sudo echo "deb http://personal.guttula.com/apt-nteract/ /binary" > /etc/apt/sources.list.d/nteract.list
    sudo apt-get update
    sudo apt-get install nteract
    
Start the application:

    nteract

Uinstall with apt-get:

    sudo apt-get remove --purge nteract
    
The sign-key fingerprint should be:

    0D8E 08C8 8E00 0C41 178D DBB0 3B56 6B75 0179 DDC1


