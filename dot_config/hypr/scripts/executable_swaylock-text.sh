# create temporary image file
image=$(mktemp --suffix=.png)
bg="$HOME/Pictures/Backgrounds/persona_5_pastel_red.png"
# put text into image
text="LOCKED"
magick convert -fill '#eceff4' -font "EarwigFactory-Regular" -pointsize 256 -gravity center -draw "text 0,-300 '$text'" "$bg" "$image"
# lock screen
swaylock --image "$image"
# remove image
rm "$image"
