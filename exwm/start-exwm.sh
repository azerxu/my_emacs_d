#!/bin/sh

# Set the screen DPI
xrdb ~/.config/emacs/exwm/Xresources

# -mm maximus window
exec dbus-launch --exit-with-session emacs -mm --debug-init
