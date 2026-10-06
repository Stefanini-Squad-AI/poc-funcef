# Script PowerShell para diagnóstico e correção de problemas IIS
# Erro 500.19 - FUNCEF.WebEmprestimo.ServicosWeb

Write-Host "=== DIAGNÓSTICO IIS 10.0 - ERRO 500.19 ===" -ForegroundColor Green

$sitePath = "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.ServicosWeb"

# 1. Verificar se o IIS está instalado
Write-Host "`n1. Verificando instalação do IIS..." -ForegroundColor Cyan

try {
    Import-Module WebAdministration -ErrorAction Stop
    Write-Host "  ✓ Módulo WebAdministration disponível" -ForegroundColor Green
} catch {
    Write-Host "  ❌ IIS não está instalado ou módulo não disponível" -ForegroundColor Red
    Write-Host "  Execute: Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole" -ForegroundColor Yellow
}

# 2. Verificar features necessárias
Write-Host "`n2. Verificando features do Windows..." -ForegroundColor Cyan

$features = @(
    "IIS-ASPNET48",
    "IIS-NetFxExtensibility48", 
    "IIS-HttpErrors",
    "IIS-HttpLogging",
    "IIS-RequestFiltering",
    "IIS-StaticContent",
    "IIS-DefaultDocument"
)

foreach ($feature in $features) {
    $installed = Get-WindowsOptionalFeature -Online -FeatureName $feature -ErrorAction SilentlyContinue
    if ($installed -and $installed.State -eq "Enabled") {
        Write-Host "  ✓ $feature - Instalado" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $feature - Não instalado" -ForegroundColor Red
        Write-Host "    Execute: Enable-WindowsOptionalFeature -Online -FeatureName $feature" -ForegroundColor Yellow
    }
}

# 3. Verificar permissões da pasta
Write-Host "`n3. Verificando permissões da pasta..." -ForegroundColor Cyan

if (Test-Path $sitePath) {
    Write-Host "  ✓ Pasta da aplicação existe: $sitePath" -ForegroundColor Green
    
    # Verificar se IIS_IUSRS tem permissão
    $acl = Get-Acl $sitePath
    $hasIISPermission = $acl.Access | Where-Object { $_.IdentityReference -like "*IIS_IUSRS*" }
    
    if ($hasIISPermission) {
        Write-Host "  ✓ IIS_IUSRS tem permissões" -ForegroundColor Green
    } else {
        Write-Host "  ❌ IIS_IUSRS sem permissões" -ForegroundColor Red
        Write-Host "  Execute: icacls `"$sitePath`" /grant IIS_IUSRS:(OI)(CI)F" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ❌ Pasta da aplicação não existe: $sitePath" -ForegroundColor Red
}

# 4. Verificar web.config
Write-Host "`n4. Verificando web.config..." -ForegroundColor Cyan

$webConfigPath = Join-Path $sitePath "web.config"
if (Test-Path $webConfigPath) {
    Write-Host "  ✓ web.config existe" -ForegroundColor Green
    
    # Verificar se tem targetFramework
    $webConfigContent = Get-Content $webConfigPath -Raw
    if ($webConfigContent -match 'targetFramework="4\.8"') {
        Write-Host "  ✓ targetFramework 4.8 configurado" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️ targetFramework 4.8 não encontrado" -ForegroundColor Yellow
    }
    
    # Verificar encoding
    if ($webConfigContent -match 'messageEncoding="Text"') {
        Write-Host "  ✓ WCF messageEncoding Text configurado" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️ WCF pode estar usando MTOM" -ForegroundColor Yellow
    }
    
} else {
    Write-Host "  ❌ web.config não encontrado" -ForegroundColor Red
}

# 5. Verificar Application Pool (se IIS disponível)
Write-Host "`n5. Verificando Application Pool..." -ForegroundColor Cyan

try {
    $appPools = Get-IISAppPool
    Write-Host "  ✓ Application Pools disponíveis:" -ForegroundColor Green
    foreach ($pool in $appPools) {
        Write-Host "    - $($pool.Name) (.NET $($pool.ManagedRuntimeVersion), $($pool.ProcessModel.IdentityType))" -ForegroundColor Gray
    }
} catch {
    Write-Host "  ⚠️ Não foi possível verificar Application Pools" -ForegroundColor Yellow
}

# 6. Verificar se há sites configurados
Write-Host "`n6. Verificando Sites IIS..." -ForegroundColor Cyan

try {
    $sites = Get-IISSite
    if ($sites.Count -gt 0) {
        Write-Host "  ✓ Sites IIS configurados:" -ForegroundColor Green
        foreach ($site in $sites) {
            Write-Host "    - $($site.Name) - $($site.State)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  ⚠️ Nenhum site IIS configurado" -ForegroundColor Yellow
    }
} catch {
    Write-Host "  ⚠️ Não foi possível verificar Sites IIS" -ForegroundColor Yellow
}

# 7. Comando para criar Application Pool e Site
Write-Host "`n7. Comandos para configurar IIS..." -ForegroundColor Cyan

Write-Host @"
  Para configurar manualmente:
  
  # Criar Application Pool
  New-IISAppPool -Name "FuncefWebEmprestimo" -Force
  Set-IISAppPool -Name "FuncefWebEmprestimo" -ManagedRuntimeVersion "v4.0" -ProcessModel @{identityType="ApplicationPoolIdentity"}
  
  # Criar Site  
  New-IISSite -Name "ServicosWebEmprestimo" -PhysicalPath "$sitePath" -Port 8080 -ApplicationPool "FuncefWebEmprestimo"
  
  # Dar permissões
  icacls "$sitePath" /grant IIS_IUSRS:(OI)(CI)F
"@ -ForegroundColor Yellow

Write-Host "`n=== DIAGNÓSTICO CONCLUÍDO ===" -ForegroundColor Green
Write-Host "Verifique os itens marcados com ❌ e ⚠️ acima" -ForegroundColor Cyan