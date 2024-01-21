
createMP4(){
  ffmpeg -ss 00:00:00 -i $WAVMIX -t $LENGTH -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $MP4
#ffmpeg -ss 00:00:00 -i /home/joel/motion-picture/03102022180354.mp4 -t 22.784 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k 03102022180354-testvid.mp4
}

"$@"
