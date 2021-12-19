#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR0="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR0=${BASEDIR0##*/}
FILENAME=`basename $0`; FILE=$(echo $FILENAME | cut -d '.' -f 1)
echo [$BASEDIR0] [$CURRDIR0] [$FILENAME] [$FILE]
echo "......."
cd $BASEDIR0 && echo [$BASEDIR0] [$CURRDIR0]
CROSS=1 make build
./build/bin/rancher_darwin-amd64 env ls
./build/bin/rancher_darwin-amd64 -v
mv $(which rancher) $(which rancher)-$(date +"%y%m%d%H%M")
cp ./build/bin/rancher_darwin-amd64 /usr/local/bin/rancher
ls -al /usr/local/bin/rancher*
exit 0
