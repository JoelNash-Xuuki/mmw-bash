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
  ffmpeg -ss 00:00:00 -i $1 -t $2 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $3
}

rotateMP4(){
  ffmpeg -i $MP4 -vf "transpose=1" $MP4R
}

overlayWatermarktt(){
  ffmpeg -i $MP4R -vf "movie=$WATERMARK[watermark]; [watermark]scale=240x135 [watermark2];[in][watermark2] overlay=W-w-0.1:H-h-0.1:enable='between(t,(0),($LENGTH))'[out]" $MP4RTEMP
  mv $MP4RTEMP $MP4R
}

setSub(){
  cp subtitles.srt $HOME/mmw/tmp/
}

addSub() {
  # Define subtitle styling
  # Font style similar to CLI (monospaced), white font color, black background
  style="FontName=Courier New,FontSize=16,PrimaryColour=&H00FFFFFF,BackColour=&H00000000,BorderStyle=4,Outline=0,Shadow=0,Alignment=2,MarginL=40,MarginR=40,MarginV=$1"

  ffmpeg -i $MP4R -vf "subtitles=$HOME/mmw/tmp/subtitles.srt:force_style='$style'" $MP4RTEMP

  mv $MP4RTEMP $MP4R
}

overlayImage(){
  ffmpeg -i $MP4R -vf "movie=$1[layer];[layer]scale=350:-1[layer2];[in][layer2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:enable='between(t,($2),($3))'[out]" $MP4RTEMP
  mv $MP4RTEMP $MP4R
}

getAudioInfo() {
  ffprobe -hide_banner $HOME/audio/Vyvn/The_Date_And_Time_Titles/1.wav -select_streams a -show_format
}

"$@"
