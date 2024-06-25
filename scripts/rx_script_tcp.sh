gst-launch-1.0 -v tcpserversrc host=0.0.0.0 port=5100 ! gdpdepay ! avdec_vp8 ! autovideosink
