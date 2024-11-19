DISPLAY=/var/www/display_video/display.png
help(){
  echo "Usage:"
  echo "  canvasSolidColorKhaki"
  echo "  changekhakiCanvasColourToTomato"
  echo "  listCanvasColours"
  echo "  runTests"
  echo "  generate_noise_image"
  echo "  generateTestImage"
  echo "  canvasSolidColorwheatxc"
}

runTests(){
  bats --tap $HOME/mmw/test/test-ip.bats
  bats --tap $HOME/mmw/test/overlay_a_specific_colour.bats
}

listCanvasColours(){
  convert -list color
}
grabPixelFromBuiltInRose(){
  convert rose: -crop 1x1+40+30 +repage -scale 100x100\! $1 
}

changekhakiCanvasColourToTomato(){
  # the colour of the current imaged needs to be known
  magick $1 -fill tomato -opaque khaki $HOME/recoloured.png
}

canvasxcSingleInput(){
  convert 'xc:turquoise4[100x100!]' $1
}

canvasSolidColorwheatxc(){
  convert -size $2x$3  xc:wheat $1
}

canvasSolidColorKhaki(){
  convert -size $2x$3  canvas:khaki $1
}

generateNoiseImage(){
  magick -size 1080x1920 xc: -channel G +noise Random \
         -virtual-pixel Tile -blur 0x1 -auto-level \
         -separate +channel $1
}

runMethod(){
  echo $PROJ
}

createTextPNG(){
  # Text appears to high ip the y axis of the png file
  width=485
  height=155
  magick -background transparent -fill lightblue \
         -extent $widthx$height\
         -font ~/.fonts/xuukitype1.ttf -pointsize 36 label:$1\
          $HOME/Xuuki/src/sites/public/output.png
}

createMP4(){
  ffmpeg -ss 00:00:00 -i $1 -t $2 -filter_complex "[0:a]showspectrum=s=480x270:mode=combined:slide=scroll:slide=0.5:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $3
}

scaleMP4() {
  ffmpeg -i $1 -vf "scale=1920:1080" $2
}

rotateMP4(){
  ffmpeg -i $1 -vf "transpose=3" $2
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

generateTestImage(){
  # Generate a test image for IM examples.
  #
  # The Image contains fully-transparent, half-transparent and fully-opaque
  # reagions of the a full greyscale (black to white). It also contains regions
  # of pure black, white, and other colors, so as to give IM a good workout when
  # used in testing canvas and color modifications.
  #
  # This could actually be done all in one operation, but for debugging I like
  # to be able to see the intermediate images.
  #
  #
  #
  # Anthony Thyssen  Feburary 2004    <A.Thyssen@griffith.edu.au>
  
  # Draw fancy horizontal gradient...
  # convert -size 100x25 xc:white -size 100x100 gradient: -size 100x25 xc:black \
  #         -append -rotate 90 -blur 0x5 +repage  test_gradient.png
  magick -size 100x150 gradient: -rotate 90 \
          -sigmoidal-contrast 7x50% test_gradient.png
  
  # Create a semi-transparent rectangle of the gradient and flop it left-right
  magick -size 150x100 xc:black \
          -draw 'fill grey50  rectangle  8,8  142,92' -alpha Off \
          test_gradient.png +swap -compose CopyOpacity -composite \
          -flop   ${png_format}test_bgnd.png
  
  # Draw two overlaping circles and fill then with same (non-flopped) gradient.
  magick -size 150x100 xc:black \
          -draw 'fill white circle    40,50  40,12' \
          -draw 'fill white circle   110,50 110,12' -alpha Off \
          test_gradient.png +swap -compose CopyOpacity -composite \
          test_fgnd.png
  
  # Create a rainbow gradient
  magick -size 12x100 xc:Lime -colorspace HSB \
          gradient:gray66 -compose CopyRed -composite \
          -colorspace sRGB -rotate 90  -compose Over \
          -bordercolor black -border 0x1 test_hue.png
  
  # Overlay the images and add some extra colors to result.
  #       -draw 'fill green rectangle 40,64 110,96' \
  magick test_bgnd.png  test_fgnd.png  -composite \
          -draw 'fill red   circle    25,80  25,98' \
          -draw 'fill green circle    75,80  75,98' \
          -draw 'fill blue  circle   125,80 125,98' \
          test_hue.png -geometry +25+80 -composite \
          $HOME/images/test.png
  
  
  # Remove the intermediate images (comment if debugging)
  rm -f test_gradient.png test_bgnd.png test_fgnd.png test_hue.png
  
  # Overlay on the pages background color to generate a JPEG
  # For stupid IE web clients that do not understand PNG transparency
  #convert test.png \
  #        \( +clone -fill "$page_bg_color"  -draw 'color 0,0 reset' \) \
  #        -compose Dst_Over -composite  $jpg_opt   test.jpg
  
  # set permissions
  #chmod 644 test.png
  #if [ ! -d "$HOME/images" ]; then
  #      mkdir "$HOME/images"
  #  fi
}

rawRandomNoise() {                                                              
  # As of IM v6.3.5 you can generate a purely random image from an existing 
  # image using Noise Generator, "+noise" method 'Random'.
  magick -size 100x100 xc:   +noise Random  $1 
}

randomFlux() {                                                              
  for i in `seq 0 30 359`; do
    magick $1 -channel G  -function Sinusoid 1,${i} \
            -virtual-pixel tile -blur 0x8 -auto-level \
            -separate $HOME/images/flux_${i}.png
  done
}

multiPageImagea() {                                                                                                                                                                  
  local delays=(59.9808 59.9808 29.9904 29.9904 29.9904 149.9520 29.9904 29.9904 29.9904 29.9904 59.9808 59.9808 29.9904 29.9904 29.9904 89.9712 59.9808 29.9904 29.9904 29.9904 )
  local images=()                                                                                                                                                                   
                                                                                                                                                                                    
  for i in {0..11}; do                                                                                                                                                              
    images+=("-delay" "${delays[$i]}" "$HOME/images/flux_$((i * 30)).png")                                                                                                          
  done                                                                                                                                                                              
                                                                                                                                                                                    
  magick -size 200x200 "${images[@]}" -loop 0 $HOME/images/multi-page-image.gif                                                                                                     
}

multiPageImage() {                                                                          
    local delays=("$@")                                                                     
    local images=()                                                                         
                                                                                            
    for i in {0..11}; do                                                                    
        images+=("-delay" "${delays[$i]}" "$HOME/images/flux_$((i * 30)).png")              
    done                                                                                    
                                                                                            
    magick -size 200x200 "${images[@]}" -loop 0 $HOME/images/multi-page-image.gif           
}                                                                                           

appendImages() {
  magick $HOME/images/flux_0.png $HOME/images/flux_150.png -append $HOME/images/flux_300.png +append $1
}

electricalFilaments(){
  magick $HOME/images/multi-page-image.gif  \
          -sigmoidal-contrast 30x50% -solarize 50% -auto-level \
          -set delay 33 $HOME/images/electrical-filaments.gif 
}

randomRipples() {
   magick $1 -function Sinusoid 4,90 $2 
}

basicLabels(){
  magick -background white -fill black \
            -font Candice -size 512x512 -font /usr/share/fonts/gsfonts/URWGothic-Book.otf -gravity center label:'The present is quickly irrelivant' \
            $1
}

basicOverMultiplLines(){
  magick -size 512x512 -background black -fill yellow -font /usr/share/fonts/gsfonts/NimbusMonoPS-Regular.otf \
         label:@$1 $2
}




processMidiCSV() {                                                                        
    local csv_file="$1"                                                                     
    local target_track="$2"                                                                 
    local current_track=-1                                                                  
    local last_time=0                                                                       
    local rest_time=0                                                                       
    local -A time_diffs                                                                     
    local tempo=600000  # microseconds per quarter note                                     
    local resolution=384  # ticks per quarter note                                          
    local tick_duration=$(echo "scale=4; $tempo / 10000 / $resolution" | bc)  # ms per tick 
                                                                                            
    while IFS=, read -r track time event_type channel note velocity; do                     
        # Trim leading and trailing whitespace                                              
        track=$(echo "$track" | xargs)                                                      
        time=$(echo "$time" | xargs)                                                        
        event_type=$(echo "$event_type" | xargs)                                            
        velocity=$(echo "$velocity" | xargs)                                                
                                                                                            
        if [[ "$event_type" == "Note_on_c" ]]; then                                         
            if [[ "$velocity" -eq 0 ]]; then                                                
                # Accumulate rest time                                                      
                rest_time=$((rest_time + time - last_time))                                 
                last_time="$time"                                                           
            else                                                                            
                if [[ "$track" -ne "$current_track" ]]; then                                
                    current_track="$track"                                                  
                    last_time="$time"                                                       
                    rest_time=0                                                             
                    time_diffs["$track"]=""                                                 
                else                                                                        
                    time_diff=$((time - last_time + rest_time))                             
                    time_diff_ms=$(echo "$time_diff * $tick_duration" | bc)                 
                    time_diffs["$track"]+="$time_diff_ms "                                  
                    last_time="$time"                                                       
                    rest_time=0                                                             
                fi                                                                          
            fi                                                                              
        fi                                                                                  
    done < "$csv_file"                                                                      
                                                                                            
    # Return the array for the target track                                                 
    echo "${time_diffs[$target_track]}"                                                     
}                                                                                           

"$@"
                                                                                                                                                                                  
                                                                                                                                                                                   
