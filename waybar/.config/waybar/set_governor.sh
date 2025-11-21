#!/bin/bash

kitty --title "CPU Governor" sh -c '
echo "Seleziona CPU governor:";
echo "1) POWER-SAVE";
echo "2) NORMAL";
echo "3) TURBO";
read -p "Scelta [1-3]: " choice;

case $choice in
    1) sudo cpupower frequency-set -g powersave ;;
    2) sudo cpupower frequency-set -g ondemand ;;
    3) sudo cpupower frequency-set -g performance ;;
    *) echo "Scelta non valida";;
esac

echo "Premi invio per chiudere...";
read'
