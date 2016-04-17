#!/bin/bash

DELAY=30
echo "Starting image capture, will capture an image every $DELAY seconds"


mkdir -p /home/pi/yeast

while /bin/true ; do 
    DATE=$(date +"%Y-%m-%d_%H%M%S")
    raspistill  -t 20 -vf -hf -o /home/pi/yeast/images/$DATE.jpg
    echo "Captured picture at $DATE"
    sleep $DELAY
done

