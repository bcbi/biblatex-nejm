#!/bin/bash

set -ev

make cleanall

l3build tag `cat VERSION`

make

make clean

make cleanall
