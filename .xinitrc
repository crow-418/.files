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

night_light_applied=false
night_light() {
    hour=$(date +%H)
    hour=${hour#0}

    if ((hour >= 20 || hour < 5)); then
        if [ "$night_light_applied" = false ]; then
            for OUT in $(xrandr --query | awk '/ connected/ {print $1}'); do
                xrandr --output $OUT --brightness 0.60 --gamma 0.80:0.72:0.60
            done
            night_light_applied=true
        fi
    fi
}

while true; do
    xsetroot -name "$(battery) | $(mem) | $(dte)"
    night_light
    sleep 10s
done &

# Restore Wallpaper
nitrogen --restore &
# Compositor For Fixing Screen Tearing and maybe Transparency
picom --config /dev/null --backend xrender --vsync &
# Flameshot
flameshot &
# Host based settings
if [ $(hostname) = "z0mbox" ]; then
    # Monitor Setup
    xrandr --output DisplayPort-0 --mode 1920x1080 --rate 75
    # Disable mouse Accel
    xinput set-prop 9 'libinput Accel Profile Enabled' 0 1 0
fi
# DWM
exec dwm
