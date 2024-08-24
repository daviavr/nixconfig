#!/bin/sh
ps axf | grep dropdown | grep -v grep || (swaymsg -- exec kitty --class dropdown -T dropdown && sleep .1)
ps axf | grep dropdown | grep -v grep && swaymsg "[app_id=\"dropdown\"] scratchpad show"
