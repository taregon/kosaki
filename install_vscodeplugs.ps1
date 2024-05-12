<#
.SYNOPSIS
    Luego  de instalar VSCode, ejecutar este script para colocar las extensiones
.NOTES
    Primero ejecutar Powershell como administrador
    Luego, habilitar la ejecución de script
.EXAMPLE
    Set-ExecutionPolicy Bypass -Scope Process
#>
# ----------------------------------------------------------
# LISTADO DE EXTENSIONES
# ----------------------------------------------------------
$ExtensionPack = @(
    # ------------------------------------------------------
    # TEMAS
    # ------------------------------------------------------
    "ahmedabdulrahman.aylin"          , # Tema
    "ddiu8081.moegi-theme"            , # Tema
    "druxtech.drux-theme"             , # Tema
    "johv.parchment-light"            , # Tema
    "kuba-p.theme-pink-candy"         , # Tema
    "magdalenalipka.white-peach-theme", # Tema
    "mvllow.rose-pine"                , # Tema
    "progcat.truepink"                , # Tema
    "rtud.melange-redux"              , # Tema
    "solidhelium.zed-theme"           , # Tema
    "vladstudio.vlad-studio-tiniri"   , # Tema
    # ------------------------------------------------------
    # TEMAS OSCUROS
    # ------------------------------------------------------
    "avetis.tokyo-night"                   , # Tema oscuro
    "azemoh.one-monokai"                   , # Tema oscuro
    "brano.bikkuri-theme"                  , # Tema oscuro
    "ccy.ayu-adaptive"                     , # Tema oscuro
    "chrsolr.rose-pine-nvchad-theme"       , # Tema oscuro
    "endorfina.roseate"                    , # Tema oscuro
    "Hermitter.oh-lucy-vscode"             , # Tema oscuro
    "inci-august.august-themes"            , # Tema oscuro
    "isaacwilson.scepter"                  , # Tema oscuro
    "kacperbiedka.one-candy-dark"          , # Tema oscuro
    "novadust.novadust"                    , # Tema oscuro
    "pixelsinthesky.infatuation"           , # Tema oscuro
    "qufiwefefwoyn.kanagawa"               , # Tema oscuro
    "ricafolio.horizon-muted"              , # Tema oscuro
    "sujan.code-blue"                      , # Tema oscuro
    "timx.ayu-modern"                      , # Tema oscuro
    "virejdasani.hydroxy"                  , # Tema oscuro
    "wheredoesyourmindgo.gruvbox-concoctis", # Tema oscuro
    "ykray.lightbulb"                      , # Tema oscuro
    # ------------------------------------------------------
    # EXTENSIONES
    # ------------------------------------------------------
    "aaron-bond.better-comments"                   , # Mejora los comentarios con ! * ? //
    "dinhani.divider"                              , # Agrega líneas divisorias al código: CRTL + ALT + D
    "dmitrydorofeev.empty-indent"                  , # Elimina la indentación de líneas vacías al guardar el archivo.
    "eamodio.gitlens"                              , # Revisar
    "earshinov.simple-alignment"                   , # Permite alinear varias selecciones en columnas.
    "esbenp.prettier-vscode"                       , # Formatea automáticamente tu código.
    "evondev.indent-rainbow-palettes"              , # Colores para indent-rainbow
    "johnpapa.vscode-peacock"                      , # Personaliza los colores del tema para cada proyecto.
    "lmcarreiro.vscode-smart-column-indenter"      , # Ajusta automáticamente la indentación de las columnas
    "mechatroner.rainbow-csv"                      , # Resalta visualmente los datos CSV con colores
    "mhutchie.git-graph"                           , # Visualiza el historial de git
    "MohammadBaqer.better-folding"                 , # Mejora la capacidad de plegado del código
    "ms-vscode.powershell"                         , # Proporciona soporte para desarrollar y depurar scripts de PowerShell.
    "naumovs.color-highlight"                      , # Resalta los códigos de colores.
    "nhoizey.gremlins"                             , # Marca visualmente caracteres invisibles.
    "oderwat.indent-rainbow"                       , # Resalta la indentación del código con colores
    "streetsidesoftware.code-spell-checker"        , # Corrector ortográfico
    "streetsidesoftware.code-spell-checker-spanish", # Corrector ortográfico ES
    "thang-nm.catppuccin-perfect-icons"            , # Iconos no oficiales de Catppuccin.
    "tyriar.sort-lines"                              # Ordena las líneas de texto
)
# Ordena las extensiones por nombre y no por autor
$ExtensionPack = $ExtensionPack | Sort-Object { $_.Split('.')[1] }
# Mensaje antes de comenzar la instalación
Write-Host "`n Instalando extensiones para VSCode " -ForegroundColor Black -BackgroundColor DarkCyan -NoNewline; Write-Host ([char]0xA0)
# ----------------------------------------------------------
# PROCESO DE INSTALACIÓN Y VERIFICACIÓN
# ----------------------------------------------------------
function Install-Extensions {
    param (
        [String]$VSCodeExt
    )
    code --install-extension $VSCodeExt | Out-Null
    $extName = $VSCodeExt.Split(".")[-1]                    # Imprime el nombre después del punto
    $extName = $extName.Replace("-", " ")                   # Elimina los guiones
    $extName = (Get-Culture).TextInfo.ToTitleCase($extName) # Capitaliza la primera letra

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[FALLO] No se pudo instalar: $extName" -ForegroundColor DarkRed -NoNewline; Write-Host ([char]0xA0)
    }
    elseif ($LASTEXITCODE -eq 0) {
        Write-Host "[ OK ] $extName" -ForegroundColor DarkCyan -NoNewline; Write-Host ([char]0xA0)
    }
}

foreach ($Plug in $ExtensionPack) {
    Install-Extensions -VSCodeExt $Plug
}