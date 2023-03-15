source $HOME/mmw/tmp/options

			     addLyrics(){
  ffmpeg -i $1\
	  -vf "drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,2.92,3.52):textfile=$LYRICS1:x=(w-text_w)/2:y=(h-text_h)/2',
	     drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,3.52,3.80):textfile=$LYRICS2:x=(w-text_w)/2:y=(h-text_h)/2',
                          drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,3.80,4.09):textfile=$LYRICS3:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,4.18,4.40):textfile=$LYRICS4:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,4.40,4.86):textfile=$LYRICS5:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,4.86,5.33):textfile=$LYRICS6:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,5.68,6.00):textfile=$LYRICS7:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,5.90,6.83):textfile=$LYRICS8:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,7.17,7.50):textfile=$LYRICS9:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,7.50,7.80):textfile=$LYRICS10:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,7.80,8.20):textfile=$LYRICS11:x=(w-text_w)/2:y=(h-text_h)/2',
			     drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,8.49,8.70):textfile=$LYRICS12:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,8.70,09.06):textfile=$LYRICS13:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,9.30,9.60):textfile=$LYRICS14:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,9.60,9.75):textfile=$LYRICS15:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,9.75,10.15):textfile=$LYRICS16:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,10.15,10.85):textfile=$LYRICS17:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,11.41,11.61):textfile=$LYRICS18:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,11.61,12.00):textfile=$LYRICS19:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,12.00,12.40):textfile=$LYRICS20:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,12.40,12.70):textfile=$LYRICS21:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,12.70,12.95):textfile=$LYRICS22:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,13.10,13.43):textfile=$LYRICS23:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,13.35,14.00):textfile=$LYRICS24:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,14.05,14.45):textfile=$LYRICS25:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,14.45,14.70):textfile=$LYRICS26:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,15.00,15.26):textfile=$LYRICS27:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,15.26,15.40):textfile=$LYRICS28:x=(w-text_w)/2:y=(h-text_h)/2',
			     drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,15.70,15.80):textfile=$LYRICS29:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,15.85,16.63):textfile=$LYRICS30:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,16.68,16.88):textfile=$LYRICS31:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,17.15,17.40):textfile=$LYRICS32:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,17.50,17.62):textfile=$LYRICS33:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,17.80,18.10):textfile=$LYRICS34:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,18.15,18.60):textfile=$LYRICS35:x=(w-text_w)/2:y=(h-text_h)/2',
                             drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,18.50,18.90):textfile=$LYRICS36:x=(w-text_w)/2:y=(h-text_h)/2',
			     drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,18.95,19.05):textfile=$LYRICS37:x=(w-text_w)/2:y=(h-text_h)/2',
			     drawtext=fontcolor=pink:fontsize=20:x=0:y=0:enable='between(t,19.22,19.75):textfile=$LYRICS38:x=(w-text_w)/2:y=(h-text_h)/2' " $2;
			     mv $2 $1
}

#joverlayWatermark(){
#j  ffmpeg -i $1 -vf "movie=$2[watermark]; [watermark]scale=240x135 [watermark2];[in][watermark2] overlay=(W/0.85)-(overlay_w/0.8):(H/0.85)-(overlay_h/0.8):enable='between(t,($4),($5))'[out]" $3
#j  mv $3 $1
#j}

overlayWatermark(){
  ffmpeg -i $1 -vf "movie=$2[watermark]; [watermark]scale=240x135 [watermark2];[in][watermark2] overlay=(W/0.5)-(overlay_w/0.5):(H/0.5)-(overlay_h/0.5):enable='between(t,($4),($5))'[out]" $3
  mv $3 $1
}

overlayWatermarktt(){
  ffmpeg -i $1 -vf "movie=$2[watermark]; [watermark]scale=240x135 [watermark2];[in][watermark2] overlay=(W/1.1)-(overlay_w/2):(H/1.005)-(overlay_h/1):enable='between(t,($4),($5))'[out]" $3
  mv $3 $1
}

rotateMP4(){
  ffmpeg -i $1 -vf "transpose=1" $2
}

overlayTitle(){
  ffmpeg -i $1 -vf "movie=$2[layer];[layer]scale=400:-1[layer2];[in][layer2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:enable='between(t,($4),($5))'[out]" $3
  mv $3 $1
}

createTextPNG(){
  convert -background transparent -fill lightblue \
	  -gravity center\
          -extent 1920x1080\
          -font ~/.fonts/xuukitype1.ttf -pointsize 288 label:$1 \
           $HOME/images/$2.png

#convert -background transparent -fill lightblue \
#        -extent 1920x1080\
#        -font ~/.fonts/xuukitype1.ttf -pointsize 144 label:$1 \
#		-swirl 360 \
#         $HOME/images/$2-e.png

}

runMethod(){
  ffmpeg -ss 00:00:00 -i $WAVMIX -t $LENGTH -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $MP4
#ffmpeg -ss 00:00:00 -i /home/joel/motion-picture/03102022180354.mp4 -t 22.784 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k 03102022180354-testvid.mp4
}



"$@"
