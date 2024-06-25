DEMO_LAUNCHER_PATH="/usr/local/demo"
DEMO_APP_PATH="/usr/local/demo/application"

cp -rf add_in_demo_launcher/eth_streaming $DEMO_APP_PATH/ 

rm -f $DEMO_APP_PATH/005-eth_streaming_*.yaml
: "${BOARD:=tx}"

if [ $BOARD == "rx" ]; then
	echo "setting up rx yaml"
	cp add_in_demo_launcher/005-eth_streaming_rx.yaml $DEMO_APP_PATH
elif [ $BOARD == "tx" ]; then
	echo "setting up tx yaml"
	cp add_in_demo_launcher/005-eth_streaming_tx.yaml $DEMO_APP_PATH
else
	echo "$BOARD is not a correct argument entry"
	exit 2
fi

killall demo_launcher.py
rm -rf /tmp/demo_launcher.lock
sleep  4
$DEMO_LAUNCHER_PATH/demo_launcher.py &
