#!/bin/sh

set -e  # Abort on first error
CUR_DIR=$PWD
GN3_CI_DIR=$HOME/CI/genenetwork3/

cd $GN3_CI_DIR
git pull

# Run Pylint
env GUIX_PACKAGE_PATH="$HOME/guix-bioinformatics:$HOME/guix-past/modules" \
    guix environment --load=guix.scm -- python -m unittest discover

echo Done Running Unittests!
cd $CUR_DIR
