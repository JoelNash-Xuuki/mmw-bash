source $HOME/mmw/test/tmp/config

makeScore(){
  echo "rendering score..."
}

createProject(){
 mkdir $HOME/$1 
}

setOptions() {
  sed -e "s/\[PROJECTNAME\]/test-proj/g; 
          s/\[PROJECTLOCATION\]/test/g;"\
          "$HOME/mmw/tmp/options-template" >\
          "$HOME/mmw/tmp/options"
}


load(){
  echo loading project...
  doesProjDirExist
}

doesProjDirExist(){
  dir_path=$PROJPATH
  if [ ! -d "$dir_path" ]; then
    echo "Directory does not exist. Creating..."
    mkdir "$dir_path" 
  else
    echo "Directory already exists."
  fi
}

#        $PROJPATH/src/202210030854-idea-session-1.orc\
#	$PROJPATH/src/202210030854-idea-harmony-1-session-1.sco

buildTrack(){
  echo "Build track $1"
  csound -o$HOME/$STORAGE/$PROJ-$SESSION-$AUDIO.wav\
	$PROJPATH/src/$PROJ-$SESSION-$TRACK.orc\
	$PROJPATH/src/$PROJ-$SESSION-$TRACK.sco
}


play(){
  csound --realtime -odac -B512 -b256 -+rtaudio=jack /home/joel/projects_/stepsequencer/501.orc /home/joel/projects_/stepsequencer/501.sco  
}

createRecFile(){
  template_file="/home/joel/mmw/test/src/test-rec-template.csd"
  output_file="/home/joel/mmw/test/src/test-rec.csd"
  audioOutputFile="/home/joel/mmw/tmp/test-rec-1.wav"
  audioInputFile="/home/joel/audio/202210030854-idea-a.wav"

  sed "s/\[RECTOAUDIOFILE\]/$(echo $audioOutputFile | sed 's/\//\\\//g')/g;
       s/\[PLAYBACKAUDIOFILE\]/$(echo $audioInputFile | sed 's/\//\\\//g')/g;"\
       $template_file > $output_file
}

rec(){
  if pgrep jackd > /dev/null; then
    csound --realtime -odac -iadc -B256 -b256 -+rtaudio=jack $1
  else
    csound --realtime -odac -iadc -B256 -b256 $1
  fi
}

pitchgroup(){
   for i in {1..12}; do soundstretch 202210030854-5-a.wav pitchtest-$i.wav -pitch=$i; done
}
getProjName(){
  echo $1;
}
renderScore(){
  csound -o$1 $2
}

createLyScoreAndMidiFile(){
  lilypond -dmidi-extension=mid $LILY
  mv $PROJ.mid tmp/$PROJ.mid
  #lilypond-book --output=out --format=html $1.lytex
}

renderMix(){
  csound -o$1 $2
}
playMix(){
  csound -odac $1
}
audioToMP4(){
  ffmpeg -ss 00:00:00 -i $1 -t $3 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 1920k -b:a 1080k $2
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

sequenceImages(){
  ffmpeg -f concat -i ~/input.txt -vsync vfr -pix_fmt yuv420p ~/motion-picture/sequence.mp4
}

animate(){

  ffmpeg -i ~/motion-picture/sequence.mp4 -filter:v "setpts=0.714*PTS,minterpolate='fps=8:mb_size=16:search_param=1000:vsbmc=0:scd=none:mc_mode=obmc:me_mode=bidir:me=ds'" -r 420 ~/motion-picture/sequence-result.mp4

}

overlayWatermarktt(){
  ffmpeg -i $1 -vf "movie=$2[watermark]; [watermark]scale=240x135 [watermark2];[in][watermark2] overlay=(W/0.7)-(overlay_w/1):(H/0.9)-(overlay_h/1):enable='between(t,($4),($5))'[out]" $3
  mv $3 $1
}

overlayImage(){
  ffmpeg -i $1 -vf "movie=$2 [layer]; [layer]scale=380:380[layer2];[in][layer2] overlay=240:80 [out]" $3
  mv $3 $1
}

overlayImagett(){
  ffmpeg -i $1 -vf "movie=$2 [layer]; [layer]scale=380:380[layer2];[in][layer2] overlay=40:240 [out]" $3
  mv $3 $1
}

createIGImages(){
   convert $4 -crop 0x0+0+0 "$4-cropped.png"
   x=$1
   y=$2
   convert -size 1080x1080 plasma:lightblue -swirl -180 $3 -swirl 50 -composite "$4" -crop 0x0+0+0 -scale 270x270 -gravity east -geometry +0+60 -composite $5
}

#crop(){
  #magick /home/images/test.jpg -resize 1080x1080\! /home/images/scale.jpg
  #magick /home/images/scale.jpg -crop 1080x1080+0+0 /home/images/crop.jpg
#}

addTextToVid(){
  ffmpeg -i $1 -vf "drawtext=fontcolor=pink:fontsize=13.3:fontfile=/home/joel/.fonts/xuukitype1.ttf:x=W-(W/1.4):y=H-(H/1.2):enable='between(t,0,30):textfile=/home/joel/projects_/03102022180354/src/text.txt'" $2
  mv $2 $1
}

addTextToVidtt(){
  ffmpeg -i $1 -vf "drawtext=fontcolor=pink:fontsize=13.3:fontfile=/home/joel/.fonts/xuukitype1.ttf:x=W-(W/1.1):y=H-(H/1.4):enable='between(t,0,30):textfile=/home/joel/projects_/03102022180354/src/text.txt'" $2
  mv $2 $1
}

"$@"
