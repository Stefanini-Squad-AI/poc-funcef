# ============================================================================
# Script de Validação - FUNCEF.WebEmprestimo.Web
# ============================================================================
# Este script valida a configuração do projeto após as correções aplicadas
# ============================================================================

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "VALIDAÇÃO - FUNCEF.WebEmprestimo.Web" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$projectPath = "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web"
$webConfigPath = Join-Path $projectPath "web.config"
$packagesConfigPath = Join-Path $projectPath "packages.config"
$binPath = Join-Path $projectPath "bin"

$errors = @()
$warnings = @()
$success = @()

# ============================================================================
# 1. VERIFICAR EXISTÊNCIA DE ARQUIVOS
# ============================================================================
Write-Host "1. Verificando arquivos..." -ForegroundColor Yellow

if (Test-Path $webConfigPath) {
    $success += "[OK] web.config encontrado"
    Write-Host "   [OK] web.config encontrado" -ForegroundColor Green
} else {
    $errors += "[ERRO] web.config NAO encontrado"
    Write-Host "   [ERRO] web.config NAO encontrado" -ForegroundColor Red
}

if (Test-Path $packagesConfigPath) {
    $success += "[OK] packages.config encontrado"
    Write-Host "   [OK] packages.config encontrado" -ForegroundColor Green
} else {
    $warnings += "[AVISO] packages.config NAO encontrado"
    Write-Host "   [AVISO] packages.config NAO encontrado" -ForegroundColor Yellow
}

if (Test-Path $binPath) {
    $success += "[OK] Pasta bin encontrada"
    Write-Host "   [OK] Pasta bin encontrada" -ForegroundColor Green
} else {
    $warnings += "[AVISO] Pasta bin NAO encontrada (projeto nao compilado)"
    Write-Host "   [AVISO] Pasta bin NAO encontrada" -ForegroundColor Yellow
}

Write-Host ""

# ============================================================================
# 2. VALIDAR WEB.CONFIG
# ============================================================================
Write-Host "2. Validando web.config..." -ForegroundColor Yellow

if (Test-Path $webConfigPath) {
    $webConfigContent = Get-Content $webConfigPath -Raw
    
    # Verificar ConnectionStrings
    if ($webConfigContent -match '<connectionStrings>') {
        $success += "✓ ConnectionStrings presente"
        Write-Host "   ✓ ConnectionStrings presente" -ForegroundColor Green
        
        if ($webConfigContent -match 'seu_usuario' -or $webConfigContent -match 'sua_senha') {
            $warnings += "⚠ ConnectionString com valores padrão - AJUSTAR CREDENCIAIS"
            Write-Host "   ⚠ ConnectionString precisa ser ajustada com credenciais reais" -ForegroundColor Yellow
        } else {
            $success += "✓ ConnectionString parece estar configurada"
            Write-Host "   ✓ ConnectionString parece estar configurada" -ForegroundColor Green
        }
    } else {
        $errors += "✗ ConnectionStrings NÃO encontrada no web.config"
        Write-Host "   ✗ ConnectionStrings NÃO encontrada" -ForegroundColor Red
    }
    
    # Verificar versão Oracle
    if ($webConfigContent -match 'Oracle\.ManagedDataAccess.*Version=4\.122\.21') {
        $success += "✓ Versão Oracle 4.122.21.x configurada"
        Write-Host "   ✓ Versão Oracle 4.122.21.x configurada" -ForegroundColor Green
    } elseif ($webConfigContent -match 'Oracle\.ManagedDataAccess.*Version=4\.122\.1\.') {
        $errors += "✗ Versão Oracle antiga (4.122.1.x) detectada - ATUALIZAR"
        Write-Host "   ✗ Versão Oracle antiga detectada" -ForegroundColor Red
    } else {
        $warnings += "⚠ Não foi possível determinar versão Oracle"
        Write-Host "   ⚠ Não foi possível determinar versão Oracle" -ForegroundColor Yellow
    }
    
    # Verificar Binding Redirects
    if ($webConfigContent -match 'System\.Diagnostics\.DiagnosticSource') {
        $success += "✓ Binding Redirect para DiagnosticSource presente"
        Write-Host "   ✓ Binding Redirect para DiagnosticSource presente" -ForegroundColor Green
    } else {
        $errors += "✗ Binding Redirect para DiagnosticSource AUSENTE"
        Write-Host "   ✗ Binding Redirect para DiagnosticSource AUSENTE" -ForegroundColor Red
    }
    
    # Verificar Oracle Settings
    if ($webConfigContent -match 'EnableOpenTelemetry.*false') {
        $success += "✓ EnableOpenTelemetry desabilitado"
        Write-Host "   ✓ EnableOpenTelemetry desabilitado" -ForegroundColor Green
    } else {
        $warnings += "⚠ EnableOpenTelemetry não configurado"
        Write-Host "   ⚠ EnableOpenTelemetry não configurado" -ForegroundColor Yellow
    }
    
    if ($webConfigContent -match 'DisableDiagnostics.*true') {
        $success += "✓ DisableDiagnostics habilitado"
        Write-Host "   ✓ DisableDiagnostics habilitado" -ForegroundColor Green
    } else {
        $warnings += "⚠ DisableDiagnostics não configurado"
        Write-Host "   ⚠ DisableDiagnostics não configurado" -ForegroundColor Yellow
    }
    
    # Verificar TargetFramework
    if ($webConfigContent -match 'targetFramework="4\.8"') {
        $success += "✓ TargetFramework 4.8 configurado"
        Write-Host "   ✓ TargetFramework 4.8 configurado" -ForegroundColor Green
    } else {
        $warnings += "⚠ TargetFramework 4.8 não detectado"
        Write-Host "   ⚠ TargetFramework 4.8 não detectado" -ForegroundColor Yellow
    }
    
    # Verificar WCF Handler
    if ($webConfigContent -match 'svc-Integrated-4\.0') {
        $success += "✓ WCF Handler configurado"
        Write-Host "   ✓ WCF Handler (svc-Integrated-4.0) configurado" -ForegroundColor Green
    } else {
        $warnings += "⚠ WCF Handler não detectado"
        Write-Host "   ⚠ WCF Handler não detectado" -ForegroundColor Yellow
    }
    
    # Validar XML
    try {
        [xml]$xmlContent = $webConfigContent
        $success += "✓ web.config é um XML válido"
        Write-Host "   ✓ web.config é um XML válido" -ForegroundColor Green
    } catch {
        $errors += "✗ web.config tem erro de sintaxe XML"
        Write-Host "   ✗ web.config tem erro de sintaxe XML: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""

# ============================================================================
# 3. VERIFICAR PACKAGES.CONFIG
# ============================================================================
Write-Host "3. Verificando packages.config..." -ForegroundColor Yellow

if (Test-Path $packagesConfigPath) {
    $packagesContent = Get-Content $packagesConfigPath -Raw
    
    if ($packagesContent -match 'Oracle\.ManagedDataAccess.*version="21\.') {
        $success += "✓ Oracle.ManagedDataAccess v21.x instalado"
        Write-Host "   ✓ Oracle.ManagedDataAccess v21.x instalado" -ForegroundColor Green
    } elseif ($packagesContent -match 'Oracle\.ManagedDataAccess.*version="23\.') {
        $warnings += "⚠ Oracle.ManagedDataAccess v23.x - Recomendado downgrade para v21.13.0"
        Write-Host "   ⚠ Oracle v23.x detectado - Recomendado v21.13.0" -ForegroundColor Yellow
    } else {
        $warnings += "⚠ Versão Oracle não identificada em packages.config"
        Write-Host "   ⚠ Versão Oracle não identificada" -ForegroundColor Yellow
    }
} else {
    Write-Host "   ℹ packages.config não disponível para verificação" -ForegroundColor Gray
}

Write-Host ""

# ============================================================================
# 4. VERIFICAR DLLs NA PASTA BIN
# ============================================================================
Write-Host "4. Verificando DLLs na pasta bin..." -ForegroundColor Yellow

if (Test-Path $binPath) {
    $oracleDll = Join-Path $binPath "Oracle.ManagedDataAccess.dll"
    
    if (Test-Path $oracleDll) {
        $success += "✓ Oracle.ManagedDataAccess.dll encontrada"
        Write-Host "   ✓ Oracle.ManagedDataAccess.dll encontrada" -ForegroundColor Green
        
        # Verificar versão da DLL
        $dllVersion = (Get-Item $oracleDll).VersionInfo.FileVersion
        Write-Host "     Versão: $dllVersion" -ForegroundColor Cyan
        
        if ($dllVersion -like "4.122.21.*") {
            $success += "✓ Versão Oracle 4.122.21.x confirmada"
            Write-Host "   ✓ Versão correta (4.122.21.x)" -ForegroundColor Green
        } elseif ($dllVersion -like "4.122.23.*") {
            $warnings += "⚠ Versão Oracle 4.122.23.x - Recomendado downgrade"
            Write-Host "   ⚠ Versão 4.122.23.x - Recomendado downgrade para 4.122.21.x" -ForegroundColor Yellow
        } else {
            $warnings += "⚠ Versão Oracle diferente da esperada"
            Write-Host "   ⚠ Versão diferente da esperada" -ForegroundColor Yellow
        }
    } else {
        $errors += "✗ Oracle.ManagedDataAccess.dll NÃO encontrada"
        Write-Host "   ✗ Oracle.ManagedDataAccess.dll NÃO encontrada" -ForegroundColor Red
        Write-Host "     Execute a compilação do projeto!" -ForegroundColor Yellow
    }
    
    # Verificar outras DLLs importantes
    $requiredDlls = @(
        "System.Memory.dll",
        "System.Buffers.dll",
        "System.Runtime.CompilerServices.Unsafe.dll",
        "System.Diagnostics.DiagnosticSource.dll"
    )
    
    foreach ($dll in $requiredDlls) {
        $dllPath = Join-Path $binPath $dll
        if (Test-Path $dllPath) {
            Write-Host "   ✓ $dll encontrada" -ForegroundColor Green
        } else {
            Write-Host "   ℹ $dll não encontrada (pode ser normal)" -ForegroundColor Gray
        }
    }
} else {
    $warnings += "⚠ Pasta bin não existe - Projeto não compilado"
    Write-Host "   ⚠ Pasta bin não existe - Compile o projeto primeiro" -ForegroundColor Yellow
}

Write-Host ""

# ============================================================================
# 5. VERIFICAR IIS (se disponível)
# ============================================================================
Write-Host "5. Verificando IIS..." -ForegroundColor Yellow

try {
    Import-Module WebAdministration -ErrorAction Stop
    
    # Verificar se módulo carregou
    $success += "✓ Módulo WebAdministration disponível"
    Write-Host "   ✓ IIS está instalado" -ForegroundColor Green
    
    # Verificar Application Pools
    $appPools = Get-ChildItem IIS:\AppPools | Where-Object { $_.managedRuntimeVersion -eq "v4.0" }
    if ($appPools.Count -gt 0) {
        Write-Host "   ✓ Application Pools .NET 4.0 encontrados: $($appPools.Count)" -ForegroundColor Green
    } else {
        $warnings += "⚠ Nenhum Application Pool .NET 4.0 encontrado"
        Write-Host "   ⚠ Nenhum Application Pool .NET 4.0 encontrado" -ForegroundColor Yellow
    }
    
} catch {
    Write-Host "   ℹ IIS não disponível ou sem permissões para verificar" -ForegroundColor Gray
}

Write-Host ""

# ============================================================================
# RESUMO FINAL
# ============================================================================
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "RESUMO DA VALIDAÇÃO" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "✓ SUCESSOS: $($success.Count)" -ForegroundColor Green
foreach ($item in $success) {
    Write-Host "  $item" -ForegroundColor Green
}
Write-Host ""

if ($warnings.Count -gt 0) {
    Write-Host "⚠ AVISOS: $($warnings.Count)" -ForegroundColor Yellow
    foreach ($item in $warnings) {
        Write-Host "  $item" -ForegroundColor Yellow
    }
    Write-Host ""
}

if ($errors.Count -gt 0) {
    Write-Host "✗ ERROS: $($errors.Count)" -ForegroundColor Red
    foreach ($item in $errors) {
        Write-Host "  $item" -ForegroundColor Red
    }
    Write-Host ""
}

# ============================================================================
# CONCLUSÃO
# ============================================================================
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "CONCLUSÃO" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if ($errors.Count -eq 0 -and $warnings.Count -eq 0) {
    Write-Host "✅ TUDO OK! Projeto configurado corretamente." -ForegroundColor Green
    Write-Host ""
    Write-Host "Próximos passos:" -ForegroundColor Cyan
    Write-Host "1. Ajustar connectionString com credenciais reais" -ForegroundColor White
    Write-Host "2. Compilar o projeto se ainda não compilado" -ForegroundColor White
    Write-Host "3. Publicar no IIS e testar" -ForegroundColor White
    $exitCode = 0
} elseif ($errors.Count -eq 0) {
    Write-Host "⚠️ CONFIGURAÇÃO OK COM AVISOS" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Revise os avisos acima e corrija se necessário." -ForegroundColor Yellow
    Write-Host "O projeto deve funcionar, mas pode ter problemas específicos." -ForegroundColor Yellow
    $exitCode = 1
} else {
    Write-Host "❌ ERROS ENCONTRADOS!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Corrija os erros acima antes de prosseguir." -ForegroundColor Red
    Write-Host "Consulte CORRECOES_WEB_CONFIG.md para instruções detalhadas." -ForegroundColor Yellow
    $exitCode = 2
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

exit $exitCode
