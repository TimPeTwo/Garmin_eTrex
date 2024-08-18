#!/bin/bash
#java -Xmx3500M -jar /usr/share/mkgmap/mkgmap.jar --max-jobs=1  --add-pois-to-areas  --latin1 --style-file=MyStyle.zip --description="mystyle10" --family-id=9999 --gmapsupp *.osm.pbf e10.TXT
java -Xmx3500M -jar /usr/share/mkgmap/mkgmap.jar --max-jobs=1  --add-pois-to-areas  --latin1 --style-file=MyStyle.zip --description="mystyle10" --family-id=9999 --gmapsupp  export.osm e10.TXT
#java -Xmx3500M -jar /usr/share/mkgmap/mkgmap.jar --max-jobs=1  --add-pois-to-areas  --latin1 --style-file=MyStyle.zip --description="mystyle10" --family-id=9999 --gmapsupp  map.osm e10.TXT
