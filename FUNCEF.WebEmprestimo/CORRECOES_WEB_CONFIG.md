# 🔧 CORREÇÕES APLICADAS NO WEB.CONFIG - FUNCEF.WEBEMPRESTIMO.WEB

## 📋 PROBLEMAS IDENTIFICADOS

Após análise do projeto, foram identificados os seguintes problemas no `web.config` que impediam o sistema de abrir:

### ❌ **Problema 1: Versão do Oracle.ManagedDataAccess Inconsistente**
- O arquivo tinha referência à versão `4.122.1.0` (versão antiga)
- Mas o projeto usa versão `4.122.21.0` conforme documentação

### ❌ **Problema 2: Falta de ConnectionString**
- Não havia configuração de `<connectionStrings>` no web.config
- Sistema não conseguia conectar ao banco Oracle

### ❌ **Problema 3: Assembly Binding Redirects Incompletos**
- Faltavam binding redirects críticos para System.Diagnostics.DiagnosticSource
- Faltavam redirects para System.Memory, System.Buffers, etc.
- Causava conflitos de versões de assemblies

### ❌ **Problema 4: Falta de DisableDiagnostics**
- Apenas EnableOpenTelemetry estava desabilitado
- DisableDiagnostics também precisa estar false para evitar erros

## ✅ CORREÇÕES APLICADAS

### **1. Atualização da Versão Oracle (configSections)**
```xml
<!-- ANTES -->
<section name="oracle.manageddataaccess.client"
         type="OracleInternal.Common.ODPMSectionHandler, Oracle.ManagedDataAccess, Version=4.122.1.0, ..." />

<!-- DEPOIS -->
<section name="oracle.manageddataaccess.client"
         type="OracleInternal.Common.ODPMSectionHandler, Oracle.ManagedDataAccess, Version=4.122.21.0, ..." />
```

### **2. Adicionada ConnectionString**
```xml
<connectionStrings>
    <!-- Configuração de conexão Oracle - Ajustar conforme ambiente -->
    <add name="OracleConnectionString" 
         connectionString="Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=ORCL)));User Id=seu_usuario;Password=sua_senha;" 
         providerName="Oracle.ManagedDataAccess.Client" />
</connectionStrings>
```

**⚠️ IMPORTANTE:** Ajuste o connectionString com os dados reais do seu ambiente:
- **HOST**: Servidor Oracle (ex: srv-oracle-prod)
- **PORT**: Porta (geralmente 1521)
- **SERVICE_NAME**: Nome do serviço Oracle (ex: ORCL, FUNCEF, etc.)
- **User Id**: Usuário de banco
- **Password**: Senha do usuário

### **3. Atualização DbProviderFactories**
```xml
<!-- ANTES -->
<add name="ODP.NET, Managed Driver" ... Version=4.122.1.0 ... />

<!-- DEPOIS -->
<add name="ODP.NET, Managed Driver" ... Version=4.122.21.0 ... />
```

### **4. Assembly Binding Redirects Completos**
```xml
<runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
        <!-- Oracle.ManagedDataAccess -->
        <dependentAssembly>
            <publisherPolicy apply="no" />
            <assemblyIdentity name="Oracle.ManagedDataAccess" publicKeyToken="89b483f429c47342" culture="neutral" />
            <bindingRedirect oldVersion="0.0.0.0-4.122.21.0" newVersion="4.122.21.0" />
        </dependentAssembly>
        
        <!-- System.Diagnostics.DiagnosticSource (CRÍTICO) -->
        <dependentAssembly>
            <assemblyIdentity name="System.Diagnostics.DiagnosticSource" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
            <bindingRedirect oldVersion="0.0.0.0-6.0.0.2" newVersion="4.0.1.0" />
        </dependentAssembly>
        
        <!-- System.Runtime.CompilerServices.Unsafe -->
        <dependentAssembly>
            <assemblyIdentity name="System.Runtime.CompilerServices.Unsafe" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
            <bindingRedirect oldVersion="0.0.0.0-6.0.0.0" newVersion="4.0.4.1" />
        </dependentAssembly>
        
        <!-- System.Memory -->
        <dependentAssembly>
            <assemblyIdentity name="System.Memory" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
            <bindingRedirect oldVersion="0.0.0.0-4.0.1.2" newVersion="4.0.1.1" />
        </dependentAssembly>
        
        <!-- System.Buffers -->
        <dependentAssembly>
            <assemblyIdentity name="System.Buffers" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
            <bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0" />
        </dependentAssembly>
        
        <!-- Newtonsoft.Json -->
        <dependentAssembly>
            <assemblyIdentity name="Newtonsoft.Json" publicKeyToken="30ad4fe6b2a6aeed" culture="neutral" />
            <bindingRedirect oldVersion="0.0.0.0-13.0.0.0" newVersion="13.0.0.0" />
        </dependentAssembly>
    </assemblyBinding>
</runtime>
```

### **5. Configurações Oracle Aprimoradas**
```xml
<appSettings>
    <!-- Correção: Desabilita OpenTelemetry e Diagnostics do Oracle -->
    <add key="Oracle.ManagedDataAccess.Client.EnableOpenTelemetry" value="false" />
    <add key="Oracle.ManagedDataAccess.Client.DisableDiagnostics" value="true" />
</appSettings>
```

## 🚀 PRÓXIMOS PASSOS

### **1. Configurar String de Conexão**
Edite o `web.config` e ajuste a connectionString na seção `<connectionStrings>` com os dados do seu ambiente Oracle.

### **2. Verificar Instalação do Oracle.ManagedDataAccess**
Certifique-se de que a versão 21.13.0 ou 21.x está instalada:
```powershell
# Verificar packages.config
Get-Content .\packages.config | Select-String "Oracle.ManagedDataAccess"

# Se necessário, reinstalar
nuget install Oracle.ManagedDataAccess -Version 21.13.0
```

### **3. Verificar Configuração IIS**

#### **Application Pool:**
- **.NET CLR Version**: v4.0
- **Managed Pipeline Mode**: Integrated
- **Enable 32-Bit Applications**: False (se servidor 64-bit)
- **Identity**: Conta com acesso ao banco Oracle

#### **Features Requeridas:**
```powershell
# Verificar features do Windows
Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -like "*IIS*" -or $_.FeatureName -like "*WCF*" }
```

Instalar se necessário:
- IIS → ASP.NET 4.8
- IIS → .NET Extensibility 4.8
- WCF Services → HTTP Activation

### **4. Verificar Permissões de Pasta**
```powershell
# Dar permissões IIS_IUSRS na pasta da aplicação
icacls "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web" /grant IIS_IUSRS:(OI)(CI)F /T
```

### **5. Limpar e Recompilar**
```powershell
# Navegar até a pasta do projeto
cd "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo"

# Limpar builds anteriores
Remove-Item -Recurse -Force .\FUNCEF.WebEmprestimo.Web\bin\* -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .\FUNCEF.WebEmprestimo.Web\obj\* -ErrorAction SilentlyContinue

# Recompilar a solução
msbuild FUNCEF.WebEmprestimo.sln /t:Rebuild /p:Configuration=Debug
```

### **6. Testar a Aplicação**
1. Abra o IIS Manager
2. Localize o site/aplicação
3. Clique em "Browse" ou acesse via navegador
4. Verifique se a página de login carrega corretamente

## 📊 VERIFICAÇÃO DE ERROS

### **Logs do IIS:**
```powershell
# Visualizar últimos erros do Event Viewer
Get-EventLog -LogName Application -Source "ASP.NET*" -Newest 20 | Format-Table -AutoSize
```

### **Logs da Aplicação:**
Verifique os logs customizados da aplicação (se existirem) em:
- `C:\inetpub\logs\LogFiles\`
- Pasta de logs customizada da aplicação

### **Erros Comuns Após Correção:**

#### **Erro: "Could not load file or assembly Oracle.ManagedDataAccess"**
**Solução:** Verificar se a DLL está na pasta `bin` e a versão está correta.

#### **Erro: "Login failed for user"**
**Solução:** Ajustar connectionString com credenciais corretas.

#### **Erro: "ORA-12154: TNS:could not resolve the connect identifier"**
**Solução:** Verificar o SERVICE_NAME na connectionString.

#### **Erro: "HTTP Error 500.19 - Configuration Error"**
**Solução:** Validar XML do web.config (pode ter erro de sintaxe).

## ✅ CHECKLIST FINAL

Antes de considerar a aplicação funcionando, verifique:

- [ ] ConnectionString configurada com dados corretos
- [ ] Oracle.ManagedDataAccess v21.x instalado
- [ ] Projeto recompilado sem erros
- [ ] IIS Application Pool configurado (.NET 4.0, Integrated)
- [ ] Features IIS/WCF instaladas
- [ ] Permissões de pasta configuradas
- [ ] Página de login abre no navegador
- [ ] Conexão com banco Oracle funciona
- [ ] Sem erros no Event Viewer
- [ ] Logs da aplicação sem exceções

## 📝 NOTAS ADICIONAIS

### **Sobre Oracle.ManagedDataAccess v21.13.0:**
Esta versão é mais estável para .NET Framework 4.8 do que a v23.x, que tem problemas de compatibilidade com System.Diagnostics.DiagnosticSource.

### **Sobre os Endpoints WCF:**
Os endpoints dos serviços WCF estão configurados para `localhost`. Se os serviços estiverem em outro servidor, ajuste os endereços na seção `<system.serviceModel>`.

### **Backup do Web.config Original:**
Um backup do web.config original foi mantido comentado no final do arquivo para referência.

---

## 🎯 RESULTADO ESPERADO

Após aplicar todas as correções e configurações:
1. ✅ Sistema carrega sem erros 500.19
2. ✅ Conexão Oracle funciona
3. ✅ Página de login é exibida
4. ✅ Autenticação funciona
5. ✅ Serviços WCF respondem corretamente

**O sistema deve estar 100% operacional!** 🚀
