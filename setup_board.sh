#!/bin/bash
set -x
if [[ ( $# -ne 2 ) || ( $1 != "rx" &&  $1 != "tx" ) ]]; then
	echo "correct usager is $0 rx or $0 tx"
	exit 1
fi

BOARD=$1
AR_FILE=$2

wget https://github.com/MP1-SolutionFactory/videoStreamingDemo/archive/refs/tags/$AR_FILE.zip
unzip -o $AR_FILE

cd stm32mp1_st60_demo-*$AR_FILE

if [ $BOARD == "rx" ]; then
	echo "setting up rx board"
	cp config_files/20-wired-rx.network /etc/systemd/network/
elif [ $BOARD == "tx" ]; then
	echo "setting up tx board"
	cp config_files/20-wired-tx.network /etc/systemd/network/
else
	echo "$BOARD is not a correct argument entry"
	exit 2
fi

systemctl enable systemd-networkd
systemctl restart systemd-networkd


if [ $BOARD == "rx" ]; then
	chmod +x scripts/rx_script.sh
elif [ $BOARD == "tx" ]; then
	chmod +x scripts/tx_script.sh
else
        echo "$BOARD is not a correct argument entry"
        exit 2
fi

chmod +x scripts/add_touch_control.sh
source scripts/add_touch_control.sh
