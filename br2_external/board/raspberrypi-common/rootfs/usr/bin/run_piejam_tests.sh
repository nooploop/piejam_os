#!/bin/sh

for f in /usr/bin/piejam_*_test ; do echo "Running $f" ; $f | grep "FAILED" ; done
