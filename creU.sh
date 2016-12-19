#!/bin/bash

client=$1

if [ x$client = x ]; then
    echo "Usage: $0 clientname"
    exit 1 fi

if [ ! -e keys/$client.key ]; then
    echo "Generating keys..."
    . vars
    ./pkitool $client
    echo "...keys generated." fi

tarball=./keys/$client.tgz

if [ ! -e $tarball ]; then
    echo "Creating tarball..."
    tmpdir=/tmp/client-tar.$$
    mkdir $tmpdir
    cp company.ovpn $tmpdir/company.ovpn
    cp keys/ca.crt $tmpdir 
    cp keys/$client.key $tmpdir/client.key
    cp keys/$client.crt $tmpdir/client.crt
    tar -C $tmpdir -czvf $tarball .
    rm -rf $tmpdir
    echo "...tarball created" 
else
    echo "Nothing to do, so nothing done. (keys/$client.tgz already exists)" 
fi
