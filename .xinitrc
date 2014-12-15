#!/bin/sh
#
# User's .xinitrc file

## Beep off
xset b off &&

## Source Xresources
xrdb -merge "${HOME}/.Xresources"

## Awesome
exec awesome
