#! /bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 {-i|--increase|-d|--decrease} <amount>"
    exit 1
fi

adjust_type=$1
amount=$2

level=$(xrandr --verbose | awk '/Brightness:/ {print $2}')

if [ $adjust_type == "-i" ] || [ $adjust_type == "--increase" ]; then
    if [[ $level == 10* ]]; then
        level="1.0"
    else
        level=$(echo "$level + $amount" | bc)
    fi
elif [ $adjust_type == "-d" ] || [ $adjust_type == "--decrease" ]; then
    if [ $level == "0.0" ]; then
        level="1.0"
    else
        level=$(echo "$level - $amount" | bc)
    fi
fi

for OUT in $(xrandr --query | awk '/ connected/ {print $1}'); do
    xrandr --output $OUT --brightness $level
done
