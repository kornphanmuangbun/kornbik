#!/bin/bash

wget=/usr/bin/wget

กำหนดค่า=""

CONFIG_GUESS_URL='http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'

CONFIG_SUB_URL='http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'

อัปเดต - กำหนดค่า () {

สำหรับ CONFIG ใน $(find -name config.guess) ; ทำ

  $wget -q -O $CONFIG $CONFIG_GUESS_URL

เสร็จแล้ว

สำหรับ CONFIG ใน $(find -name config.sub); ทำ

  $wget -q -O $CONFIG $CONFIG_SUB_URL

เสร็จแล้ว

}

update-configure
