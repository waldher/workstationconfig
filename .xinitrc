export VDPAU_NVIDIA_NO_OVERLAY=1

nohup .config/lastping/lastping.sh &> /dev/null

if [ "lgbrbook" == "`hostname`" ]
then
  blueman-applet &
  wicd-client &
fi

xbindkeys

if [ "lgbrterminal" == "`hostname`" ]
then
  synergys &
else
  synergyc lgbrterminal &
fi

setxkbmap us -variant altgr-intl -option nodeadkeys

i3 --force-xinerama -V >>~/.i3/log >&1
