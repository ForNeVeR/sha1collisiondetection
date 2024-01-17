param (
    $CesiumSourceRoot = "$PSScriptRoot/../../Cesium",
    $CesiumProjectName = "Cesium.Compiler"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true

function build-cesium {
    Push-Location $CesiumSourceRoot
    try {
        dotnet build
    } finally {
        Pop-Location
    }
}

function run-cesium($params) {
    build-cesium
    dotnet run --no-build --project "$CesiumSourceRoot/$CesiumProjectName" -- `
        --out bin/sha1main.exe `
        @($params.Sources)
}
