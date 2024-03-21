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

#ffplay -f lavfi -i mandelbrot -vf "format=yuv444p,split=4[a][b][c][d],[a]waveform[aa],[b][aa]vstack[V],[c]waveform=m=0[cc],[d]vectorscope=color4[dd],[cc][dd]vstack[V2],[V][V2]hstack"

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

  ffmpeg -i $MP4R -vf "subtitles=$HOME/mmw/tmp/subtitles.srt:force_style='$style'" $MP4RTEMP

  mv $MP4RTEMP $MP4R
}

overlayImage(){
  ffmpeg -i $MP4R -vf "movie=$1[layer];[layer]scale=350:-1[layer2];[in][layer2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:enable='between(t,($2),($3))'[out]" $MP4RTEMP
  mv $MP4RTEMP $MP4R
}

"$@"
