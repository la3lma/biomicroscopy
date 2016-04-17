#!/bin/bash

if [ ! -d images ] ; then
   mkdir images
fi

# First fetch all the images
scp 'pi@10.0.0.23:/home/pi/yeast/images/*' images

# Then make links with a nameschema that can be
# picked up by ffmpeg
if [ ! -d frames ] ; then
  mkdir frames
fi

rm frames/*

FOO=1;
for x in images/* ; do
    (cd frames ; ln -s ../$x $(printf "%06d.jpg" $FOO)) ;
    FOO=$(expr $FOO + 1) ;
done

rm timeseries.mp4
# Finally run ffmpeg to create a timeseries
ffmpeg -i 'frames/%06d.jpg' timeseries.mp4
