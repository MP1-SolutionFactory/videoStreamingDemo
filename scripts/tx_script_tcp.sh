gst-launch-1.0 -v filesrc location=/usr/local/demo/media/ST2297_visionv3.webm ! matroskademux ! gdppay ! tcpclientsink host=192.168.1.100 port=5100
