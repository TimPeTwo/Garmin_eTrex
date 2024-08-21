Eine schwarz/weisse Karte für Garmin eTrex10 oder eTrex32x.

Benötigte Software
* mkgmap 
* zip
* josm
* Ein Editor für die Symbole auf der Garmin Karte

Die Datenabfrage wird in der Overpass QL Sprache gestellt. 
```
// @name CycleWaysAndPlaces

/*
This shows the cycleway and cycleroute network.
*/

[out:xml];

(
  //Die Relationen
  relation[network='lcn'][route='bicycle']({{bbox}}); //lokal
  relation[network='rcn'][route='bicycle']({{bbox}}); //regional
  relation[network='ncn'][route='bicycle']({{bbox}}); //national
  //Die Wege
  way(r);
  // Städte und Orte als Punkte
  node[place~"city|town|village|hamlet|suburb"]({{bbox}});
);
out body;
>;
out skel qt;
```

Sobald die Abfrag in [https://overpass-turbo.eu/](Overpass Turbo) die gewünschten Daten liefert, kann der Ausdruck in JOSM verwendet werden. 
In JSOM wird "Datei->Daten herunterladen->Von Overpass-API herunterladen" verwedet.  
[Download from Overpass API (expert mode)](https://josm.openstreetmap.de/wiki/Help/Action/Download) [Expert mode](https://josm.openstreetmap.de/wiki/Help/ExpertMode)

Bei mir speichere ich die Datei unter '\\wsl.localhost\Ubuntu\home\timpe\Garmin_eTrex\export.osm' .

## Vorbereiten ( einmalig nach git clone )
### Linux
* chmod +x ./My*
* dos2unix ./My*
### Windows
* Set-ExecutionPolicy Unrestricted ( imn einer elevated shell )

## Reihenfolge der Aufrufe 
### Linux
* ./MyZipStyle.sh ( Wenn die Garmin Syles verändert wurden )
* ./MySplitter.sh ( Fällt weg. )
* ./MyConvert.sh ( immer wenn es eine neue export.osm gibt )
* ./MyRename.sh
### Windows
* .\MyMove.ps1
