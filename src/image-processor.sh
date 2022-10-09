PROJ="$(basename "$PWD")"
MP4="${HOME}/motion-picture/$PROJ.mp4"
MP4R="${HOME}/motion-picture/$PROJ-tt.mp4"


#
#
#ipsg(){
#ffmpeg  -ss 00:00:00 -i $INPUT -t 245.00 -filter_complex "[0:a]showspectrum=s=854x480:mode=combined:slide=scroll:saturation=0.2:scale=log,format=yuv420p[v]" -map "[v]" -map 0:a -b:v 700k -b:a 360k $OUTPUT
#}

iprot(){
  #for c in test.mp4; 
  #do 
  #   FILE="${c%.mp4}_tt.mp4"
  #done
  #MP4R="${HOME}/motion-picture/$FILE"
  ffmpeg -i $MP4 -vf "transpose=1" $MP4R
}

#ipsg
iprot

