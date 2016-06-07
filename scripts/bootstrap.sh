#!/bin/bash

RVM_VERSION="2.2.4"
IP=`ifconfig eth1 | awk '/inet addr/{print substr($2,6)}'`
PATH_APP=blog

packagelist=(
  git-core
  curl
  zlib1g-dev
  build-essential
  libssl-dev
  libreadline-dev
  libyaml-dev 
  libsqlite3-dev
  sqlite3 
  libxml2-dev 
  libxslt1-dev
  libcurl4-openssl-dev
  python-software-properties
  libffi-dev
  nodejs 
  postgresql
  postgresql-contrib 
  libpq-dev
  imagemagick
  bundler
)

echo "runing apt-get update..."
sudo apt-get -qq update
echo "installing packages..."
sudo apt-get -qq install -y ${packagelist[@]}

echo "installing Ruby..."
curl -sSL https://get.rvm.io | bash > /dev/null 2>&1
source .rvm/scripts/rvm
rvm install ${RVM_VERSION} --default > /dev/null 2>&1

echo "installing APP..."
cd ${PATH_APP}
gem install bundler
bundle install
rake db:setup
rails s -b ${IP}
