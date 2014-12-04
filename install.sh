#!/bin/bash
# install Arduino template

case "$1" in
    user)
        cp -R arduino/ $HOME/.config/QtProject/qtcreator/templates/wizards/
        chmod -R 755 arduino/ $HOME/.config/QtProject/qtcreator/templates/wizards/
        ;;
    system)
        cp -R arduino/ /usr/share/qtcreator/templates/wizards/
        if [ "$?" -ne 0 ]; then
            echo "You must have root privileges to perform a system installation";
            exit 1;
        fi
        chmod -R 755 /usr/share/qtcreator/templates/wizards/arduino/
        ;;
    *)
        echo "Usage: install.sh [user|system]";
        exit 1;
        ;;
esac
