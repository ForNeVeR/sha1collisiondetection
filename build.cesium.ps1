Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true

$sources = @(
    'lib/sha1.c'
    'lib/ubc_check.c'
    'src/main.c'
)

. "$PSScriptRoot/tools/cesium.ps1"

$params = @{
    Sources = $sources
}

run-cesium $params
