# ============================================================================
# Script de Validacao Simplificado - FUNCEF.WebEmprestimo.Web
# ============================================================================

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "VALIDACAO - FUNCEF.WebEmprestimo.Web" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$projectPath = "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web"
$webConfigPath = Join-Path $projectPath "web.config"
$binPath = Join-Path $projectPath "bin"

$errors = 0
$warnings = 0
$success = 0

# Verificar web.config
Write-Host "1. Verificando web.config..." -ForegroundColor Yellow
if (Test-Path $webConfigPath) {
    Write-Host "   [OK] web.config encontrado" -ForegroundColor Green
    $success++
    
    $content = Get-Content $webConfigPath -Raw
    
    # Verificar ConnectionStrings
    if ($content -match '<connectionStrings>') {
        Write-Host "   [OK] ConnectionStrings presente" -ForegroundColor Green
        $success++
        
        if ($content -match 'seu_usuario|sua_senha') {
            Write-Host "   [AVISO] ConnectionString com valores padrao - AJUSTAR!" -ForegroundColor Yellow
            $warnings++
        }
    } else {
        Write-Host "   [ERRO] ConnectionStrings ausente" -ForegroundColor Red
        $errors++
    }
    
    # Verificar versao Oracle
    if ($content -match 'Version=4\.122\.21') {
        Write-Host "   [OK] Versao Oracle 4.122.21.x" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   [AVISO] Versao Oracle incorreta" -ForegroundColor Yellow
        $warnings++
    }
    
    # Verificar Binding Redirects
    if ($content -match 'System\.Diagnostics\.DiagnosticSource') {
        Write-Host "   [OK] Binding Redirect DiagnosticSource presente" -ForegroundColor Green
        $success++
    } else {
        Write-Host "   [ERRO] Binding Redirect DiagnosticSource ausente" -ForegroundColor Red
        $errors++
    }
    
    # Verificar Oracle settings
    if ($content -match 'EnableOpenTelemetry.*false') {
        Write-Host "   [OK] EnableOpenTelemetry desabilitado" -ForegroundColor Green
        $success++
    }
    
    if ($content -match 'DisableDiagnostics.*true') {
        Write-Host "   [OK] DisableDiagnostics habilitado" -ForegroundColor Green
        $success++
    }
    
} else {
    Write-Host "   [ERRO] web.config NAO encontrado" -ForegroundColor Red
    $errors++
}

Write-Host ""

# Verificar pasta bin
Write-Host "2. Verificando pasta bin..." -ForegroundColor Yellow
if (Test-Path $binPath) {
    Write-Host "   [OK] Pasta bin encontrada" -ForegroundColor Green
    $success++
    
    $oracleDll = Join-Path $binPath "Oracle.ManagedDataAccess.dll"
    if (Test-Path $oracleDll) {
        $version = (Get-Item $oracleDll).VersionInfo.FileVersion
        Write-Host "   [OK] Oracle.ManagedDataAccess.dll encontrada" -ForegroundColor Green
        Write-Host "       Versao: $version" -ForegroundColor Cyan
        $success++
    } else {
        Write-Host "   [AVISO] Oracle.ManagedDataAccess.dll ausente" -ForegroundColor Yellow
        Write-Host "       Compile o projeto primeiro!" -ForegroundColor Yellow
        $warnings++
    }
} else {
    Write-Host "   [AVISO] Pasta bin nao encontrada" -ForegroundColor Yellow
    Write-Host "       Compile o projeto!" -ForegroundColor Yellow
    $warnings++
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "RESUMO" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Sucessos : $success" -ForegroundColor Green
Write-Host "Avisos   : $warnings" -ForegroundColor Yellow
Write-Host "Erros    : $errors" -ForegroundColor Red
Write-Host ""

if ($errors -eq 0) {
    Write-Host "STATUS: OK" -ForegroundColor Green
    Write-Host ""
    Write-Host "Proximos passos:" -ForegroundColor Cyan
    Write-Host "1. Ajustar connectionString (se necessario)" -ForegroundColor White
    Write-Host "2. Compilar projeto (se ainda nao compilado)" -ForegroundColor White
    Write-Host "3. Configurar IIS" -ForegroundColor White
    Write-Host "4. Testar aplicacao" -ForegroundColor White
} else {
    Write-Host "STATUS: ERROS ENCONTRADOS" -ForegroundColor Red
    Write-Host "Corrija os erros antes de prosseguir." -ForegroundColor Yellow
}

Write-Host ""
