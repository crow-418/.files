#! /bin/sh

# Battery Status
battery() {
    [ -r /sys/class/power_supply/BAT0/capacity ] && echo -n "$(cat /sys/class/power_supply/BAT0/capacity)% "
    [ -r /sys/class/power_supply/BAT1/capacity ] && echo -n "$(cat /sys/class/power_supply/BAT1/capacity)%"
    echo
}

# DATE and RAM in Status Bar
dte() {
    dte="$(date +'%A, %B %d - %H:%M')"
    echo -e "$dte"
}

mem() {
    mem=$(free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }')
    echo -e "$mem"
}

while true; do
    xsetroot -name "$(battery) | $(mem) | $(dte)"
    sleep 10s
done &

# Restore Wallpaper
nitrogen --restore &
# Compositor For Fixing Screen Tearing and maybe Transparency
picom --config /dev/null --backend xrender --vsync &
# Flameshot
flameshot &
if [ $(hostname) = "z0mbox" ]; then
    # Monitor Setup
    xrandr --output DisplayPort-0 --mode 1920x1080 --rate 120
    # Disable mouse Accel
    xinput set-prop 9 'libinput Accel Profile Enabled' 0 1 0
fi
# DWM
exec dwm
