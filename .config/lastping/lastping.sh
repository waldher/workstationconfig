#!/bin/sh
while true
do
  result=$(ping -c 1 -W 1 laserbunny.net | grep time= | sed 's/.*time=//')
  if [ -n "$result" ]
  then
    echo "{ \"full_text\": \"$result\", \"color\": \"#00ff00\" }" > $HOME/.config/lastping/output
  else
    echo "{ \"full_text\": \"Timeout\", \"color\": \"#ff0000\" }" > $HOME/.config/lastping/output
  fi
  sleep 2
done
