DISPLAY=/var/www/display_video/display.png

help(){
  echo "Usage:"
  echo "  generate_noise_image"
  echo "  canvasSolidColorKhaki"
}

runTests(){
  $HOME/test/bats/bin/bats --tap $HOME/mmw/test/test-ip.bats
}
canvasSolidColorKhaki(){
  sudo convert -size 100x100 canvas:khaki /var/www/display_video/display.png
}

generate_noise_image(){
  convert -size $2x$3 xc: -channel G +noise Random \
         -virtual-pixel Tile -blur 0x5 -auto-level \
         -separate +channel $1
}

runMethod(){
  echo $PROJ
}

createTextPNG(){
  # Text appears to high ip the y axis of the png file
  width=485
  height=155
  convert -background transparent -fill lightblue \
          -extent $widthx$height\
          -font ~/.fonts/xuukitype1.ttf -pointsize 36 label:$1\
           $HOME/images/$2.png
}
createMP4(){
  ffmpeg -ss 00:00:00 -i $1 -t $2 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $3
}

rotateMP4(){
  ffmpeg -i $1 -vf "transpose=1" $2
}

overlayWatermark_v(){
  ffmpeg -i $1 -vf "movie=$2[watermark]; [watermark]scale=240x135 [watermark2];[in][watermark2] overlay=W-w-0.1:H-h-0.1:enable='between(t,(0),($3))'[out]" $4
  mv $4 $1
}

setSub(){
  cp subtitles.srt $HOME/mmw/tmp/
}

addSub() {
  # Define subtitle styling
  # Font style similar to CLI (monospaced), white font color, black background
  style="FontName=Courier New,FontSize=16,PrimaryColour=&H00FFFFFF,BackColour=&H00000000,BorderStyle=4,Outline=0,Shadow=0,Alignment=2,MarginL=40,MarginR=40,MarginV=$1"

  ffmpeg -i $2 -vf "subtitles=$4:force_style='$style'" $3
  mv $3 $2
}

overlayImage(){
  ffmpeg -i $1 -vf "movie=$2[layer];[layer]scale=350:-1[layer2];[in][layer2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:enable='between(t,($3),($4))'[out]" $5
  mv $5 $1
}

getAudioInfo() {
  ffprobe -hide_banner $1 -select_streams a -show_format
}

"$@"
