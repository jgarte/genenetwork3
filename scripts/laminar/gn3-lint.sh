#!/bin/sh

set -e  # Abort on first error
CUR_DIR=$PWD
GN3_CI_DIR=$HOME/CI/genenetwork3/

cd $GN3_CI_DIR
git pull

# Run Pylint
env GUIX_PACKAGE_PATH="$HOME/guix-bioinformatics:$HOME/guix-past/modules" \
    guix environment --load=guix.scm -- pylint sheepdog/worker.py gn3/ tests

echo Done Running Pylint!
cd $CUR_DIR
