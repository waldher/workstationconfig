#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | (read line && echo $line && read line && echo $line && while :
do
  read line
  dat="`cat $HOME/.config/lastping/output`"
  dat="[${dat},"
  echo "${line/[/$dat}" || exit 1
done)
