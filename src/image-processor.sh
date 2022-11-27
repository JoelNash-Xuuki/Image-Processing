PROJ="03102022180354"
WAV="$HOME/audio/$PROJ.wav"
TEMPWOA="$HOME/motion-picture/$PROJ-temp-wo-audio.mp4"
WAVMIX="$HOME/audio/$PROJ-mix.wav"
MP4R="$HOME/motion-picture/$PROJ-tt.mp4"
TITLE="$HOME/image/title.png" 
TESTING="$HOME/image/test.png" 

getProjName(){
  echo $PROJ;
}

ipsg(){
ffmpeg -ss 00:00:00 -i $1 -t $3 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $2
#ffmpeg -ss 00:00:00 -i /home/joel/motion-picture/03102022180354.mp4 -t 22.784 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k 03102022180354-testvid.mp4
}

overlayVideo(){
  #echo "TEST"
#  overlay $MP4 $MP4R $TEMPWOA $TEMPWA
  #cp ${HOME}/motion-picture/${TEMPWA} $MP4
  #rm ${HOME}/motion-picture/${TEMPWA}
}

createTitles(){
convert -background transparent -fill lightblue \
          -font ~/.fonts/xuukitype1.ttf -pointsize 144 label:X \
          ${HOME}/images/X.png

convert -background transparent -fill lightpink \
          -font ~/.fonts/xuukitype1.ttf -pointsize 144 label:VYVYAN \
          ${HOME}/images/VYVYAN.png
}

createWaterMark(){
  ffmpeg -i $1 -vf "movie=$2 [watermark]; [in][watermark] overlay [out]" output01.mp4 
}

ipaddimage(){
  local image st end
  image=$1 
  st=$2
  nd=$3
  overlay $4 $image $5 $st $nd
  #cp $2 $1
  #rm $2 
}

"$@"
