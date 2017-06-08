#!/bin/sh

MAIN=itmo

set_dialog() {
    DIALOG=dialog
    if [ ! -z $DISPLAY ]
    then
        which gdialog > /dev/null && DIALOG=gdialog || DIALOG=dialog
    fi

    echo $DIALOG
}

ui_main() {
    NAME="Ether Sender"
    DIALOG=$(set_dialog)

    STATUS=$($MAIN)
    echo $STATUS
}

ui_main
