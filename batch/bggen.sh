#!/bin/sh
#
# set up the environment
#
gxenv $HALLD_VERSIONS/npp_1.0.xml
#
# customize the config file
#
cp -v $NPP/batch/bggen.nppcfg.template bggen.nppcfg.template
#
# create the rest file
#
make -f $NPP/Makefile_mc CONFIG=bggen.nppcfg



