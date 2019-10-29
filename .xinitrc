#! /bin/bash

# Happy Pet around my desktop
# oneko -sakura -bg palevioletred -tofocus -speed 30 -idle 20 &
# oneko -sakura -bg palevioletred -speed 10 -idle 20 &
oneko -bg snow -idle 5 -speed 15 &

# Load my key-maps and binding.
xmodmap ~/.Xmodmap
xbindkeys

# Make things transparent and set a nice background
devilspie -a &
xcompmgr &

# Load SSH key and virtual-box hard drive
eval `ssh-agent -s`
sudo umount -t vboxsf wsr
sudo mount -t vboxsf wsr ~/wsr
