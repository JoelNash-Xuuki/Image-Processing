#PROJ="$2"
WAV="${HOME}/audio/$PROJ.wav"
TEMPWOA="${HOME}/motion-picture/$PROJ-temp-wo-audio.mp4"
WAVMIX="${HOME}/audio/$PROJ-mix.wav"
MP4="${HOME}/motion-picture/$PROJ.mp4"
TITLE="${HOME}/image/title.png" 
TESTING="${HOME}/image/test.png" 

getProjName(){
  echo $PROJ;
}
ipsg(){
ffmpeg -ss 00:00:00 -i $2 -t 22.784 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $3
}

overlayVideo(){
  #echo "TEST"
  overlayv $MP4 $MP4R $TEMPWOA $TEMPWA
  #cp ${HOME}/motion-picture/${TEMPWA} $MP4
  #rm ${HOME}/motion-picture/${TEMPWA}
}

#convert -background transparent -fill lightblue \
#          -font ~/.fonts/xuukitype1.ttf -pointsize 144 label:X \
#          ${HOME}/image/title.png

ipaddimage(){
  local image st end
  image=$3 
  st=$4
  nd=$5
  overlay $1 $image $2  $st $nd
  cp $2 $1
  rm $2 
}
iprot(){
  ffmpeg -i $1 -vf "transpose=1" $2
}
"$@"
