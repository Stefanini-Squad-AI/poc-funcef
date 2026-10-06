# Script PowerShell para aplicar downgrade do Oracle.ManagedDataAccess
# De v23.26.0 para v21.13.0

Write-Host "=== SCRIPT DE DOWNGRADE ORACLE.MANAGEDDATAACCESS ===" -ForegroundColor Green
Write-Host "Convertendo de v23.26.0 para v21.13.0" -ForegroundColor Yellow

$rootPath = "c:\Demandas-25\F-oracle-we-teste\PlanusWeb"

# 1. Atualizar packages.config
Write-Host "`n1. Atualizando packages.config..." -ForegroundColor Cyan

$packageFiles = Get-ChildItem -Recurse -Path $rootPath -Name "packages.config"
foreach ($file in $packageFiles) {
    $fullPath = Join-Path $rootPath $file
    Write-Host "  -> $file"
    
    (Get-Content $fullPath) | 
        ForEach-Object { $_ -replace 'Oracle\.ManagedDataAccess.*version="23\.26\.0"', 'Oracle.ManagedDataAccess" version="21.13.0"' } |
        Set-Content $fullPath
}

# 2. Atualizar arquivos .csproj
Write-Host "`n2. Atualizando arquivos .csproj..." -ForegroundColor Cyan

$csprojFiles = Get-ChildItem -Recurse -Path $rootPath -Name "*.csproj"
foreach ($file in $csprojFiles) {
    $fullPath = Join-Path $rootPath $file
    Write-Host "  -> $file"
    
    (Get-Content $fullPath) | 
        ForEach-Object { 
            $_ -replace 'Version=4\.122\.23\.1', 'Version=4.122.21.1' -replace
            'Oracle\.ManagedDataAccess\.23\.26\.0', 'Oracle.ManagedDataAccess.21.13.0'
        } |
        Set-Content $fullPath
}

# 3. Atualizar arquivos de configuração
Write-Host "`n3. Atualizando arquivos de configuração..." -ForegroundColor Cyan

$configFiles = Get-ChildItem -Recurse -Path $rootPath -Name "*.config"
foreach ($file in $configFiles) {
    $fullPath = Join-Path $rootPath $file
    Write-Host "  -> $file"
    
    (Get-Content $fullPath) | 
        ForEach-Object { $_ -replace 'Version=4\.122\.23\.1', 'Version=4.122.21.1' } |
        Set-Content $fullPath
}

# 4. Atualizar web.config
Write-Host "`n4. Atualizando web.config..." -ForegroundColor Cyan

$webConfigFiles = Get-ChildItem -Recurse -Path $rootPath -Name "web.config"
foreach ($file in $webConfigFiles) {
    $fullPath = Join-Path $rootPath $file
    Write-Host "  -> $file"
    
    (Get-Content $fullPath) | 
        ForEach-Object { $_ -replace 'Version=4\.122\.23\.1', 'Version=4.122.21.1' } |
        Set-Content $fullPath
}

Write-Host "`n=== DOWNGRADE CONCLUÍDO ===" -ForegroundColor Green
Write-Host "Próximos passos:" -ForegroundColor Yellow
Write-Host "1. Baixar Oracle.ManagedDataAccess v21.13.0 do NuGet" -ForegroundColor White
Write-Host "2. Executar: nuget restore" -ForegroundColor White
Write-Host "3. Recompilar todos os projetos" -ForegroundColor White
Write-Host "4. Testar a aplicação" -ForegroundColor White