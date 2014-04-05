#!/usr/bin/env bash
set -eo pipefail
export DEBIAN_FRONTEND=noninteractive
export VPC_REPO=${VPC_REPO:-"https://github.com/binocarlos/vpc.git"}
export VPC_BRANCH=${VPC_BRANCH:-"master"}
export VPC_TAG=${VPC_TAG:-""}

if ! which apt-get &>/dev/null
then
  echo "This installation script requires apt-get. For manual installation instructions, consult https://github.com/binocarlos/vpc ."
  exit 1
fi

apt-get update
apt-get install -y git make

cd ~ && test -d vpc || git clone $VPC_REPO
cd vpc
git fetch origin

if [[ -n $VPC_BRANCH ]]; then
  git checkout origin/$VPC_BRANCH
elif [[ -n $VPC_TAG ]]; then
  git checkout $VPC_TAG
fi

make install