#!/bin/bash

# Rofi Power Menu Script

option1="  Apagar"
option2="  Reiniciar"
option3="  Cerrar sesión"
option4="  Cancelar"

options="$option1\n$option2\n$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -i -p "Opciones de energía" -theme ~/.local/share/rofi/themes/windows11-grid-dark.rasi)

case $choice in
    $option1)
        shutdown now
        ;;
    $option2)
        reboot
        ;;
    $option3)
        bspc quit
        ;;
    $option4)
        exit 0
        ;;
esac
