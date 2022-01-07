#!/bin/bash

wget=/usr/bin/wget

configure=""

CONFIG_GUESS_URL='http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'

CONFIG_SUB_URL='http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'

update - configure () {

for CONFIG in $(find -name config.guess) ; do

  $wget -q -O $CONFIG $CONFIG_GUESS_URL

finished

for CONFIG in $(find -name config.sub); do

  $wget -q -O $CONFIG $CONFIG_SUB_URL

finished

}

update-configure
