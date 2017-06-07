#!/bin/sh

which gdialog 2> /dev/null && DIALOG=gdialog || DIALOG=dialog

while true
do 
	$DIALOG --inputbox "Enter FROM account:"
done
