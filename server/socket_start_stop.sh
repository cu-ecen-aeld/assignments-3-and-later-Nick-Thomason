#!/bin/bash
# simple script to start and stop the aesdsocket.
# for assingment 5 part 1 and probably onward.
read "start or stop"
if [[ $1 == start ]]; then
	systemctl start aesdsocket.service
	echo "started aesdsocket"
elif [[ $1 == stop ]]; then
	systemctl stop aesdsocket.service
	echo "stopped aesdsocket"
else;
	echo "please enter 'start' or 'stop'"
fi
