
$ErrorActionPreference = "stop"

$gmapsupp = "gmapsupp.img"
$gmapbmap = "gmapbmap.img"


if ( (Test-Path -Path $gmapsupp)) {
    Move-Item $gmapsupp $gmapbmap -Force -Verbose
}

if (-not ( test-path -path $gmapbmap )) {
    throw "Datei gmapbmap.img nicht vorhanden."
}
$Pathes = "d:\Garmin", "e:\Garmin", "g:\Garmin"
foreach ($Path in $Pathes) {
    if (Test-Path $Path) {
        Get-ChildItem $Path | ? { $_.Name -match 'map' }
        Copy-Item -path $gmapbmap -Destination $Path -verbose
        Get-ChildItem $Path | ? { $_.Name -match 'map' }
        exit
    }
    else {
        "Pfad $($Path) ist nicht vorhanden."
    }
}

