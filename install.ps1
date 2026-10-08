# zerotwo installer for Windows (PowerShell).
# Usage: irm https://raw.githubusercontent.com/Yozmor/zerotwo/main/install.ps1 | iex
$ErrorActionPreference = "Stop"
$dir  = Join-Path $env:LOCALAPPDATA "zerotwo"
$base = "https://raw.githubusercontent.com/Yozmor/zerotwo/main"

if (-not (Get-Command py -ErrorAction SilentlyContinue) -and -not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Python not found. Install it from python.org (tick Add python.exe to PATH) or Microsoft Store, then run this again."
    return
}

New-Item -ItemType Directory -Force -Path $dir | Out-Null
Invoke-WebRequest "$base/zerotwo"     -OutFile (Join-Path $dir "zerotwo")     -UseBasicParsing
Invoke-WebRequest "$base/zerotwo.bat" -OutFile (Join-Path $dir "zerotwo.bat") -UseBasicParsing

$path = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not $path) { $path = "" }
if (-not (($path -split ";") -contains $dir)) {
    $new = (($path.TrimEnd(";")) + ";" + $dir).TrimStart(";")
    [Environment]::SetEnvironmentVariable("Path", $new, "User")
}

Write-Host "Done! Open a NEW terminal window and type: zerotwo"
