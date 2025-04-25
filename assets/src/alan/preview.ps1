# #!powershell

$counter = 0
$files = Get-ChildItem -File -Filter *.aseprite | Sort-Object Name | ForEach-Object {
    $counter++
    $_.Name
}

$width = [int][Math]::Floor([Math]::Sqrt($counter)) * 71

# https://www.aseprite.org/docs/cli/#shell
aseprite.exe --batch @files --sheet preview.png --sheet-width $width -- data preview.json
