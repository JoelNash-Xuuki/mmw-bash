getProjName(){
  echo $1;
}

renderScore(){
  csound -o$1 $2
}

createLyScoreAndMidiFile(){
  lilypond -dmidi-extension=mid $1;
  mv $3.mid $2/tmp/
  mv $3.pdf $2/doc/
}

renderMix(){
  csound -o$1 $2
}

audioToMP4(){
  ffmpeg -ss 00:00:00 -i $1 -t $3 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $2
}

rotateMP4(){
  ffmpeg -i $1 -vf "transpose=1" $2
}

#imageOverVid(){
#  local image st nd
#  image=$1
#  st=$2
#  nd=$3
#  image-processor.sh ipaddimage $image $st $nd $MP4 $TEMP
#}
#

createTextPNG(){
convert -background transparent -fill lightblue \
        -extent 1920x1080\
        -font ~/.fonts/xuukitype1.ttf -pointsize 144 label:$1 \
         $HOME/images/$2.png

convert -background transparent -fill lightblue \
        -extent 1920x1080\
        -font ~/.fonts/xuukitype1.ttf -pointsize 144 label:$1 \
		-swirl 360 \
         $HOME/images/$2-e.png
}

sequenceImages(){
  ffmpeg -f concat -i ~/input.txt -vsync vfr -pix_fmt yuv420p ~/motion-picture/sequence.mp4
}

animate(){

  ffmpeg -i ~/motion-picture/sequence.mp4 -filter:v "setpts=5.712*PTS,minterpolate='fps=24:mb_size=16:search_param=1000:vsbmc=0:scd=none:mc_mode=obmc:me_mode=bidir:me=ds'" -r 120 ~/motion-picture/sequence-result.mp4

}



overlayWatermark(){
  ffmpeg -i $1 -vf "movie=$2 [watermark]; [watermark]scale=50x50 [watermark2];[in][watermark2] overlay=(W/1)-(overlay_w/1):(H/1)-(overlay_h/1):enable='between(t,($4),($5))'[out]" $3
  mv $3 $1
}

overlayTitle(){
  ffmpeg -i $1 -vf "movie=$2 [watermark]; [watermark]scale=202x36 [watermark2];[in][watermark2] overlay=(W/2)-(overlay_w/2):(H/2)-(overlay_h/2):enable='between(t,($4),($5))'[out]" $3
  mv $3 $1
}

createIGImages(){
   convert $4 -crop 0x0+0+0 "$4-cropped.png"

   x=$1
   y=$2
   convert -size 1080x1080 plasma:lightblue -swirl -180 $3 -swirl 50 -composite "$4" -crop 0x0+0+0 -scale 270x270 -gravity east -geometry +0+60 -composite $5
}

"$@"

