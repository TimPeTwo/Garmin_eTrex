
$ErrorActionPreference = "stop"

$gmapsupp = "gmapsupp.img"
$gmapbmap = "gmapbmap.img"

# Rename the file
if ( (Test-Path -Path $gmapsupp)) {
    Move-Item $gmapsupp $gmapbmap -Force -Verbose
}

# Throw a error, if file does not exist
if (-not ( test-path -path $gmapbmap )) {
    throw "Datei gmapbmap.img nicht vorhanden."
}

# The device is not allway on the same drive.
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

