#!/bin/bash

[! -d images ] && mkdir images

# First fetch all the images
scp 'pi@10.0.0.23:/home/pi/yeast/images/*' images

# Then make links with a nameschema that can be
# picked up by ffmpeg
[! -d frames ] && mkdir frames
rm frames/*

FOO=1;
for x in images /; do
    ln -s ../$x $(printf " frames/%06d . jpg " $FOO) ;
    FOO=$ ( expr $FOO + 1) ;
done

# Finally run ffmpeg to create a timeseries
ffmpeg -i frames/%06d.jpg timeseries.mp4
