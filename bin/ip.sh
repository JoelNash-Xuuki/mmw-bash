source $HOME/mmw/tmp/config

runMethod(){
  echo $PROJ
}

createTextPNG(){
  convert -background transparent -fill lightblue \
	  -gravity center\
          -extent 1920x1080\
          -font ~/.fonts/xuukitype1.ttf -pointsize 288 label:$1 \
           $HOME/images/$2.png
}

createMP4(){
  ffmpeg -ss 00:00:00 -i $AUDIOFILE -t $LENGTH -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $MP4
}

rotateMP4(){
  ffmpeg -i $MP4 -vf "transpose=1" $MP4R
}

overlayWatermarktt(){
  ffmpeg -i $MP4R -vf "movie=$WATERMARK[watermark]; [watermark]scale=240x135 [watermark2];[in][watermark2] overlay=(W/1.1)-(overlay_w/2):(H/1.005)-(overlay_h/1):enable='between(t,(0),($LENGTH))'[out]" $MP4RTEMP
  mv $MP4RTEMP $MP4R
}

setSub(){
  cp subtitles.srt $HOME/mmw/tmp/
}


addSub() {
  cp $MP4R $MP4RTEMP

  # Define subtitle styling
  # Font style similar to CLI (monospaced), white font color, black background
  style="FontName=Courier New,FontSize=24,PrimaryColour=&H00FFFFFF,BackColour=&H00000000,BorderStyle=4,Outline=0,Shadow=0,Alignment=2,MarginL=10,MarginR=10,MarginV=20"

  ffmpeg -i $MP4R -vf "subtitles=$HOME/mmw/tmp/subtitles.srt:force_style='$style'" $MP4RTEMP

  mv $MP4RTEMP $MP4R
}

"$@"
