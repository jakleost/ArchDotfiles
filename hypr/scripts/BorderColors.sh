#!/bin/bash

#variable colors
colors=(
  "0xff49BED0"
  "0xff3D9FAE" 
  "0xff4CC6D9"
  "0xff31808C"
  "0xff25616A"
  "0xff194248"
  "0xffD13CBC"
  "0xffAE3D9F"
  "0xffD94CC6"
  "0xff8C3180"
  "0xff6A2561"
  "0xff481942"
  "0xffD14558"
  "0xffD94C5F"
  "0xffAE3D4C"
)

#choose Color
function pick_color() {
  echo "${colors[$RANDOM % ${#colors[@]}]}"
}

#generate 10 colors
active_colors=()
inactive_colors=()

for i in {1..10}; do
  active_colors+=("$(pick_color)")
  inactive_colors+=("$(pick_color)")
done

#set color via hyprctl
hyprctl keyword general:col.active_border "${active_colors[@]}" 270deg
hyprctl keyword general:col.inactive_border "${inactive_colors[@]}" 270deg
