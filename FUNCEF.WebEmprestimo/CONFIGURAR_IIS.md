# 🌐 CONFIGURAR IIS - Guia Completo

## ✅ STATUS ATUAL

O arquivo `web.config` foi **corrigido com sucesso** e está pronto para uso.

**Validação executada:**
- ✅ web.config presente e válido
- ✅ ConnectionStrings configurada
- ✅ Versão Oracle 4.122.21.x correta
- ✅ Binding Redirects completos
- ✅ Configurações Oracle OK
- ✅ Oracle.ManagedDataAccess.dll presente (v4.122.21.1)

⚠️ **Pendência:** ConnectionString precisa ser ajustada com credenciais reais (consulte CONFIGURAR_CONNECTIONSTRING.md)

## 🚀 PRÓXIMO PASSO: CONFIGURAR IIS

### OPÇÃO 1: Configuração via Interface Gráfica (Recomendado)

#### **Passo 1: Abrir IIS Manager**
1. Pressione `Win + R`
2. Digite: `inetmgr`
3. Pressione Enter

#### **Passo 2: Criar Application Pool**
1. No painel esquerdo, expanda o servidor
2. Clique em **Application Pools**
3. No painel direito, clique em **Add Application Pool...**
4. Configure:
   - **Name:** `WebEmprestimo`
   - **.NET CLR Version:** `v4.0`
   - **Managed Pipeline Mode:** `Integrated`
5. Clique **OK**
6. Clique com botão direito no pool criado → **Advanced Settings...**
7. Configure:
   - **Identity:** `ApplicationPoolIdentity` (ou conta específica se necessário)
   - **Enable 32-Bit Applications:** `False` (se servidor 64-bit)
   - **Start Mode:** `AlwaysRunning` (opcional, para melhor performance)
8. Clique **OK**

#### **Passo 3: Criar Site ou Application**

**Opção A: Criar novo Site (se for único site no servidor)**
1. Clique com botão direito em **Sites**
2. Selecione **Add Website...**
3. Configure:
   - **Site name:** `WebEmprestimo`
   - **Application pool:** `WebEmprestimo`
   - **Physical path:** `C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web`
   - **Binding:**
     - Type: `http`
     - IP address: `All Unassigned`
     - Port: `80` (ou outra porta disponível, ex: 8080)
     - Host name: (deixe em branco ou configure domínio)
4. Clique **OK**

**Opção B: Criar Application (se já existe um site)**
1. Expanda **Sites**
2. Clique com botão direito no site desejado
3. Selecione **Add Application...**
4. Configure:
   - **Alias:** `WebEmprestimo`
   - **Application pool:** `WebEmprestimo`
   - **Physical path:** `C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web`
5. Clique **OK**

#### **Passo 4: Configurar Permissões**
1. Clique com botão direito no site/application criado
2. Selecione **Edit Permissions...**
3. Vá para aba **Security**
4. Clique **Edit...**
5. Clique **Add...**
6. Digite: `IIS_IUSRS`
7. Clique **Check Names** → **OK**
8. Marque permissões:
   - ✅ Read
   - ✅ Read & Execute
   - ✅ List folder contents
9. Clique **OK** em todas as janelas

#### **Passo 5: Testar Site**
1. No IIS Manager, selecione o site/application
2. No painel direito, clique em **Browse *:80 (http)** ou **Browse *.8080**
3. O navegador deve abrir e mostrar a página de login

---

### OPÇÃO 2: Configuração via PowerShell (Avançado)

⚠️ **ATENÇÃO:** Execute PowerShell como Administrador!

```powershell
# Importar módulo IIS
Import-Module WebAdministration

# PASSO 1: Criar Application Pool
New-WebAppPool -Name "WebEmprestimo"
Set-ItemProperty IIS:\AppPools\WebEmprestimo -name "managedRuntimeVersion" -value "v4.0"
Set-ItemProperty IIS:\AppPools\WebEmprestimo -name "managedPipelineMode" -value "Integrated"

# PASSO 2: Criar Site (ajuste porta se necessário)
$sitePath = "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web"
New-Website -Name "WebEmprestimo" `
    -Port 8080 `
    -PhysicalPath $sitePath `
    -ApplicationPool "WebEmprestimo"

# PASSO 3: Configurar Permissões
$acl = Get-Acl $sitePath
$permission = "BUILTIN\IIS_IUSRS","Read,ReadAndExecute","ContainerInherit,ObjectInherit","None","Allow"
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($accessRule)
Set-Acl $sitePath $acl

Write-Host "Site configurado com sucesso!" -ForegroundColor Green
Write-Host "Acesse: http://localhost:8080" -ForegroundColor Cyan
```

**Ou criar como Application em site existente:**
```powershell
Import-Module WebAdministration

# Criar Application Pool
New-WebAppPool -Name "WebEmprestimo"
Set-ItemProperty IIS:\AppPools\WebEmprestimo -name "managedRuntimeVersion" -value "v4.0"
Set-ItemProperty IIS:\AppPools\WebEmprestimo -name "managedPipelineMode" -value "Integrated"

# Criar Application (ajuste "Default Web Site" se necessário)
$sitePath = "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web"
New-WebApplication -Name "WebEmprestimo" `
    -Site "Default Web Site" `
    -PhysicalPath $sitePath `
    -ApplicationPool "WebEmprestimo"

# Configurar Permissões
icacls $sitePath /grant IIS_IUSRS:(OI)(CI)RX /T

Write-Host "Application configurada com sucesso!" -ForegroundColor Green
Write-Host "Acesse: http://localhost/WebEmprestimo" -ForegroundColor Cyan
```

---

## 🔧 VERIFICAÇÕES IMPORTANTES

### **1. Verificar Features do Windows instaladas**

Execute como Administrador:
```powershell
# Verificar features IIS instaladas
Get-WindowsOptionalFeature -Online | Where-Object { 
    $_.FeatureName -like "*IIS*" -or $_.FeatureName -like "*WCF*" 
} | Where-Object { $_.State -eq "Enabled" } | Select-Object FeatureName, State
```

**Features necessárias:**
- ✅ IIS-WebServerRole
- ✅ IIS-WebServer
- ✅ IIS-CommonHttpFeatures
- ✅ IIS-StaticContent
- ✅ IIS-DefaultDocument
- ✅ IIS-ApplicationDevelopment
- ✅ IIS-NetFxExtensibility45 (ou IIS-NetFxExtensibility)
- ✅ IIS-ISAPIExtensions
- ✅ IIS-ISAPIFilter
- ✅ IIS-ASPNET45 (ou IIS-ASPNET)
- ✅ WCF-HTTP-Activation45 (ou WCF-HTTP-Activation)

**Se faltarem features, instale:**
```powershell
# Instalar features básicas
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45
Enable-WindowsOptionalFeature -Online -FeatureName WCF-HTTP-Activation45
```

### **2. Verificar .NET Framework 4.8 instalado**
```powershell
(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release
```
**Resultado esperado:** >= 528040 (.NET Framework 4.8)

### **3. Testar Application Pool**
```powershell
Import-Module WebAdministration
Get-WebAppPoolState -Name "WebEmprestimo"
```
**Deve retornar:** Started

Se estiver Stopped:
```powershell
Start-WebAppPool -Name "WebEmprestimo"
```

### **4. Verificar Permissões da Pasta**
```powershell
$path = "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web"
(Get-Acl $path).Access | Where-Object { $_.IdentityReference -like "*IIS*" }
```
**Deve mostrar:** IIS_IUSRS com permissões de leitura

---

## 🔍 TROUBLESHOOTING

### **Erro: HTTP 500.19 - Internal Server Error**

**Causa:** Problema de configuração no web.config ou features ausentes

**Soluções:**
1. Valide o web.config: `.\ValidarConfiguracaoSimples.ps1`
2. Verifique Event Viewer: `Get-EventLog -LogName Application -Source "ASP.NET*" -Newest 5`
3. Instale features faltantes (veja seção acima)
4. Verifique se o arquivo web.config não está corrompido

### **Erro: HTTP 503 - Service Unavailable**

**Causa:** Application Pool parado ou com problema

**Soluções:**
1. No IIS Manager, verifique se o Application Pool está Started
2. Veja eventos: `Get-EventLog -LogName System -Source "WAS" -Newest 10`
3. Recicle o pool: `Restart-WebAppPool -Name "WebEmprestimo"`
4. Verifique identity do Application Pool tem permissões necessárias

### **Erro: HTTP 404 - Not Found**

**Causa:** Caminho físico incorreto ou Default.aspx ausente

**Soluções:**
1. Verifique se o caminho físico está correto no IIS
2. Confirme que existe `Default.aspx` na pasta
3. Verifique Default Documents no IIS (deve incluir Default.aspx)

### **Erro: HTTP 401 - Unauthorized**

**Causa:** Problema de autenticação ou permissões

**Soluções:**
1. Verifique permissões IIS_IUSRS na pasta
2. Configure Authentication no IIS:
   - Anonymous Authentication: Enabled
   - Forms Authentication: Enabled (pelo web.config)

### **Erro: Could not load file or assembly 'Oracle.ManagedDataAccess'**

**Causa:** DLL ausente na pasta bin

**Soluções:**
1. Recompile o projeto: `msbuild FUNCEF.WebEmprestimo.sln /t:Rebuild`
2. Verifique se Oracle.ManagedDataAccess.dll está em bin/
3. Copie manualmente se necessário da pasta packages/

### **Erro: ORA-12154 ou outros erros Oracle**

**Causa:** ConnectionString incorreta

**Soluções:**
1. Consulte: `CONFIGURAR_CONNECTIONSTRING.md`
2. Ajuste credenciais no web.config
3. Teste conexão Oracle manualmente

---

## ✅ CHECKLIST FINAL

Antes de considerar a configuração concluída:

- [ ] IIS instalado e rodando
- [ ] Features .NET 4.8 instaladas
- [ ] Application Pool criado (v4.0, Integrated)
- [ ] Site ou Application criado e configurado
- [ ] Permissões IIS_IUSRS configuradas
- [ ] Application Pool em estado Started
- [ ] Navegador abre a página (sem erro 500.19 ou 503)
- [ ] ConnectionString configurada com credenciais reais
- [ ] Página de login é exibida
- [ ] Logs sem erros críticos

---

## 📊 COMANDOS ÚTEIS

### **Verificar Status do Site**
```powershell
Import-Module WebAdministration
Get-Website | Where-Object { $_.Name -eq "WebEmprestimo" }
```

### **Reciclar Application Pool**
```powershell
Restart-WebAppPool -Name "WebEmprestimo"
```

### **Ver Logs de Erro**
```powershell
# Event Viewer - Erros ASP.NET
Get-EventLog -LogName Application -Source "ASP.NET*" -Newest 10 | Format-List

# IIS Logs (ajuste caminho se necessário)
Get-Content "C:\inetpub\logs\LogFiles\W3SVC1\*.log" -Tail 20
```

### **Testar Conexão HTTP**
```powershell
Invoke-WebRequest -Uri "http://localhost:8080" -UseBasicParsing
```

---

## 🎯 RESUMO

1. ✅ **web.config corrigido** - Pronto para uso
2. ⚠️ **ConnectionString** - Ajustar com credenciais reais
3. 🔄 **IIS** - Configurar usando este guia
4. 🧪 **Testar** - Acessar no navegador

**Após configurar o IIS, o sistema deve abrir normalmente!** 🚀
