#!/usr/bin/env bash
#------------------------------------------------------------------------------------------------------------------------
# A script that generates a Makefile for the Rust tutorials
#------------------------------------------------------------------------------------------------------------------------

REPO_BASE_DIR="$(git rev-parse --show-toplevel)"
RUST_PROG_DIR="$REPO_BASE_DIR/rust_programming_course"

cd $RUST_PROG_DIR


echo -n "all:"
ls -1d */ | sed -e 's:^tutorial\([0-9][0-9]*\)/$:\1 tutorial\1:' | sort -k 1n | sed -e 's/^[0-9][0-9]* //'| \
while read tutorial
do
    echo -n " $tutorial/${tutorial}_main"
done
echo 
echo

ls -1d */ | sed -e 's:^tutorial\([0-9][0-9]*\)/$:\1 tutorial\1:' | sort -k 1n | sed -e 's/^[0-9][0-9]* //'| \
while read tutorial
do
    echo -n "$tutorial/${tutorial}_main:"
    find $tutorial -name 'main.rs' | \
    while read fpath
    do
        echo -n " $fpath"
        echo 
        echo -n $'\t'
        echo "rustc $fpath -o $tutorial/${tutorial}_main"
        echo -n $'\t'
    done
    echo
done

echo "clean:"
echo -n $'\t'
echo -n "rm -f"
ls -1d */ | sed -e 's:^tutorial\([0-9][0-9]*\)/$:\1 tutorial\1:' | sort -k 1n | sed -e 's/^[0-9][0-9]* //'| \
while read tutorial
do
    echo -n " $tutorial/${tutorial}_main"
done
echo
echo
