#!/bin/sh
ps axf | grep dropdown | grep -v grep || (swaymsg -- exec kitty --class dropdown -T dropdown && sleep .1)
ps axf | grep dropdown | grep -v grep && swaymsg "[app_id=\"dropdown\"] scratchpad show" && swaymsg "[app_id=\"dropdown\"] resize set 2252px 480px" && swaymsg "[app_id=\"dropdown\"] move absolute position 250 300"
