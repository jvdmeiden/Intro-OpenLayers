#!/bin/bash
# This is a shell script to create a demo of maptiles
# It will download tiles from openstreetmap for zoomlevels 0-3
# Write relevant information to the tiles
# Bundle tiles together in maps
#
for z in {0..3}
  do
  for (( x = 0; x <= 2**z -1 ; x++))
    do
    for (( y = 0; y <= 2**z -1 ; y++))
      do
      curl 'https://tile.openstreetmap.org/'$z'/'$x'/'$y'.png' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0' -H 'Accept: image/avif,image/webp,*/*' -H 'Accept-Language: nl,de-DE;q=0.8,en-US;q=0.5,en;q=0.3' -H 'Accept-Encoding: gzip, deflate, br' -H 'Referer: https://www.openstreetmap.org/' -H 'Alt-Used: tile.openstreetmap.org' -H 'Connection: keep-alive' -H 'Cookie: _osm_totp_token=929586' -H 'Sec-Fetch-Dest: image' -H 'Sec-Fetch-Mode: no-cors' -H 'Sec-Fetch-Site: same-site' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'TE: trailers' > $z-$y-$x.png
      convert -pointsize 30 -fill blue -draw "text 30,30 'zoom $z, tile $x/$y'" $z-$y-$x.png a.$z-$y-$x.png
      convert -bordercolor black -border 1 a.$z-$y-$x.png $z-$y-$x.png
    done
  done
  montage $z*.png zoom.$z.png
done
