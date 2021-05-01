#!/bin/bash

# fifo
export YAD_NOTIF=$(mktemp -u --tmpdir YAD_NOTIF.XXXXXX)
mkfifo "$YAD_NOTIF"

# trap that removes fifo
trap "rm -f $YAD_NOTIF" EXIT


function set_notification_quit() {
  echo "menu:Quit!quit!gtk-quit"
}

exec 3<> $YAD_NOTIF

yad --notification --image=/usr/share/icons/TwisterOS/scalable/status/display-brightness-symbolic.svg --text "PiBright" --command "pibright" --listen <&3 & notifpid=$!

# waits until the notification icon is ready
until xdotool getwindowname $(xdotool search --pid "$notifpid" | tail -1) &>/dev/null; do
        # sleep until the window opens
        sleep 0.5       
done

set_notification_quit >&3

# Waits for notification to exit
wait $notifpid

exec 3>&-

exit 0