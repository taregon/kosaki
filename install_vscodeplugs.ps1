$Plugins = @(
    "Tyriar.sort-lines"
)

function Install-VSCodePlugs {
    param (
        [String]$VSCodePlug
    )
    code --install-extension $VSCodePlug | Out-Null

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[FALLO] No se pudo instalar: $VSCodePlug" -ForegroundColor DarkRed -NoNewline; Write-Host ([char]0xA0)
    }
    elseif ($LASTEXITCODE -eq 0) {
        Write-Host "[ OK ] $VSCodePlug" -ForegroundColor DarkCyan -NoNewline; Write-Host ([char]0xA0)
    }
}

foreach ($Plug in $Plugins) {
    Install-VSCodePlugs -VSCodePlug $Plug
}