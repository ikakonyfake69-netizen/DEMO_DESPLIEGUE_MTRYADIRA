param(
    [string]$RutaPHP = 'php'
)

$archivoOrigen = Join-Path $PSScriptRoot "origen\index.php"
$archivoDestino = Join-Path $PSScriptRoot "pruebas\index.php"

php -l $archivoOrigen

if ($LASTEXITCODE -eq 0) {
    Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
    Write-Host "Versión publicada en el ambiente de pruebas."
} else {
    Write-Host "Hay un error de sintaxis. No se publicó el cambio."
    exit 1
}

Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Version publicada en el ambiente de pruebas "