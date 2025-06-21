#!/bin/bash

base_dir=$(pwd)

if [ ! -d "./build/ubuntu_init" ]; then 

    mkdir -p ./build/ubuntu_init
fi

# touch ./build/ubuntu_init/ubuntu_init.sh

cat ./bin/head >> ./build/ubuntu_init/ubuntu_init.sh
cat ./bin/utils >> ./build/ubuntu_init/ubuntu_init.sh
cat ./bin/environment >> ./build/ubuntu_init/ubuntu_init.sh
cat ./bin/user >> ./build/ubuntu_init/ubuntu_init.sh
cat ./bin/hardening >> ./build/ubuntu_init/ubuntu_init.sh
cat ./bin/main >> ./build/ubuntu_init/ubuntu_init.sh

cp ./bin/install.sh ./build/ubuntu_init/install.sh
cp -r ./repo ./build/ubuntu_init/

chmod +x ./build/ubuntu_init/ubuntu_init.sh
chmod +x ./build/ubuntu_init/install.sh
rm ./build/ubuntu_init.tar.gz
cd ./build

if [ -d "${base_dir}/debug/ubuntu_init" ]; then
    rm -rv ${base_dir}/debug/ubuntu_init
fi

if [ ! -d "${base_dir}/debug/ubuntu_init" ]; then
    cp -r -v ./ubuntu_init ${base_dir}/debug/
fi

tar -czvf ./ubuntu_init.tar.gz ./ubuntu_init
cd $base_dir
rm -r ./build/ubuntu_init