# 🔐 CONFIGURAR CONNECTIONSTRING - Passo a Passo

## ⚠️ AÇÃO NECESSÁRIA IMEDIATA

O `web.config` está com a connectionString usando valores padrão que precisam ser ajustados com as credenciais reais do seu ambiente Oracle.

## 📍 LOCALIZAÇÃO DO ARQUIVO

```
C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web\web.config
```

## 🔍 ENCONTRAR A SEÇÃO

Abra o arquivo `web.config` e localize a seção `<connectionStrings>`:

```xml
<connectionStrings>
    <add name="OracleConnectionString" 
         connectionString="Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=ORCL)));User Id=seu_usuario;Password=sua_senha;" 
         providerName="Oracle.ManagedDataAccess.Client" />
</connectionStrings>
```

## ✏️ VALORES A AJUSTAR

Você precisa substituir os seguintes valores:

### 1. **HOST** (atualmente: `localhost`)
```
HOST=localhost  →  HOST=seu_servidor_oracle
```

**Exemplos comuns:**
- `HOST=srv-oracle-prod`
- `HOST=10.10.10.100`
- `HOST=oracle.funcef.local`

### 2. **PORT** (atualmente: `1521`)
```
PORT=1521
```
⚠️ **Geralmente NÃO precisa mudar** - A porta padrão Oracle é 1521

### 3. **SERVICE_NAME** (atualmente: `ORCL`)
```
SERVICE_NAME=ORCL  →  SERVICE_NAME=seu_servico_oracle
```

**Exemplos comuns:**
- `SERVICE_NAME=FUNCEF`
- `SERVICE_NAME=PRODDB`
- `SERVICE_NAME=ORCL` (se for esse mesmo)

### 4. **User Id** (atualmente: `seu_usuario`)
```
User Id=seu_usuario  →  User Id=usuario_real
```

**Exemplos:**
- `User Id=WEBEMPRESTIMO`
- `User Id=APP_USER`
- `User Id=FUNCEF_APP`

### 5. **Password** (atualmente: `sua_senha`)
```
Password=sua_senha  →  Password=senha_real
```

⚠️ **ATENÇÃO:** A senha ficará em texto claro no arquivo. Em produção, considere usar criptografia.

## 📝 EXEMPLO COMPLETO

### **Antes (valores padrão):**
```xml
<connectionStrings>
    <add name="OracleConnectionString" 
         connectionString="Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=ORCL)));User Id=seu_usuario;Password=sua_senha;" 
         providerName="Oracle.ManagedDataAccess.Client" />
</connectionStrings>
```

### **Depois (exemplo com valores reais):**
```xml
<connectionStrings>
    <add name="OracleConnectionString" 
         connectionString="Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=srv-oracle-prod)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=FUNCEF)));User Id=WEBEMPRESTIMO;Password=Senh@123;" 
         providerName="Oracle.ManagedDataAccess.Client" />
</connectionStrings>
```

## 🔍 COMO DESCOBRIR OS VALORES CORRETOS

### **Opção 1: Verificar outro web.config do ambiente**
Se você tem outro sistema funcionando no mesmo ambiente:
```powershell
# Procurar por outros web.config com Oracle
Get-ChildItem C:\inetpub -Recurse -Filter "web.config" | Select-String "Oracle"
```

### **Opção 2: Verificar arquivo tnsnames.ora**
Localização típica:
```
C:\oracle\product\11.2.0\client_1\network\admin\tnsnames.ora
```

O arquivo tnsnames.ora contém as configurações de conexão.

### **Opção 3: Perguntar ao DBA**
Entre em contato com o administrador de banco de dados (DBA) e solicite:
- Nome do servidor Oracle
- Porta (se diferente de 1521)
- Service Name ou SID
- Usuário e senha da aplicação

### **Opção 4: Verificar documentação do sistema**
Procure por documentos como:
- `README.md`
- `INSTALACAO.md`
- `Manual de Instalação.doc`
- `Configuração - Ambiente.xlsx`

## 🧪 TESTAR A CONEXÃO

Após configurar, você pode testar a conexão Oracle:

### **Usando SQL*Plus:**
```cmd
sqlplus usuario_real/senha_real@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=servidor)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=servico)))
```

### **Usando script PowerShell:**
```powershell
# Criar teste de conexão
$connectionString = "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=servidor)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=servico)));User Id=usuario;Password=senha;"

try {
    Add-Type -Path "C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web\bin\Oracle.ManagedDataAccess.dll"
    $conn = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionString)
    $conn.Open()
    Write-Host "Conexao OK!" -ForegroundColor Green
    $conn.Close()
} catch {
    Write-Host "Erro na conexao: $($_.Exception.Message)" -ForegroundColor Red
}
```

## ⚠️ ERROS COMUNS

### **Erro: ORA-12154 - TNS:could not resolve the connect identifier**
**Causa:** SERVICE_NAME incorreto  
**Solução:** Verifique o nome correto do serviço Oracle

### **Erro: ORA-12514 - TNS:listener does not currently know of service**
**Causa:** SERVICE_NAME não existe ou listener não está rodando  
**Solução:** Confirme o SERVICE_NAME com o DBA

### **Erro: ORA-12541 - TNS:no listener**
**Causa:** HOST ou PORT incorretos, ou Oracle não está rodando  
**Solução:** Verifique se o servidor Oracle está acessível

### **Erro: ORA-01017 - invalid username/password**
**Causa:** Usuário ou senha incorretos  
**Solução:** Verifique as credenciais com o DBA

### **Erro: ORA-28000 - the account is locked**
**Causa:** Conta Oracle bloqueada (muitas tentativas de login)  
**Solução:** Solicite ao DBA para desbloquear: `ALTER USER usuario ACCOUNT UNLOCK;`

## 🔒 SEGURANÇA - BOAS PRÁTICAS

### **1. Não commitar senha em repositório Git**
Se usar controle de versão, adicione ao `.gitignore`:
```
web.config
```

Ou use transformações de config (Web.Debug.config, Web.Release.config).

### **2. Usar criptografia (recomendado para produção)**
```powershell
# Criptografar seção connectionStrings
cd C:\Windows\Microsoft.NET\Framework64\v4.0.30319
.\aspnet_regiis.exe -pef "connectionStrings" "C:\caminho\do\site" -prov "DataProtectionConfigurationProvider"

# Descriptografar (se necessário)
.\aspnet_regiis.exe -pdf "connectionStrings" "C:\caminho\do\site"
```

### **3. Usar permissões adequadas no arquivo**
```powershell
# Permitir apenas IIS_IUSRS e Administrators
icacls "web.config" /inheritance:r
icacls "web.config" /grant Administrators:F
icacls "web.config" /grant IIS_IUSRS:R
```

## ✅ CHECKLIST APÓS CONFIGURAÇÃO

Após ajustar a connectionString:

- [ ] Valores corretos inseridos (HOST, SERVICE_NAME, User Id, Password)
- [ ] Teste de conexão realizado e funcionando
- [ ] Script de validação executado: `.\ValidarConfiguracaoSimples.ps1`
- [ ] Sem erros no Event Viewer após testar aplicação
- [ ] Sistema consegue fazer login

## 🚀 PRÓXIMO PASSO

Após configurar a connectionString corretamente:

1. **Salve o arquivo web.config**
2. **Execute novamente a validação:**
   ```powershell
   .\ValidarConfiguracaoSimples.ps1
   ```
3. **Recicle o Application Pool no IIS** (se já estiver configurado)
4. **Teste a aplicação no navegador**

## 📞 SUPORTE

Se precisar de ajuda para obter as credenciais corretas:
- **DBA Oracle:** Solicite credenciais da aplicação WebEmprestimo
- **Equipe de Infraestrutura:** Para informações de HOST e PORT
- **Documentação do sistema:** Verifique manuais de instalação existentes

---

**Arquivo a editar:**  
`C:\Demandas-25\F-oracle-we-teste\PlanusWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web\web.config`

**Seção a localizar:**  
`<connectionStrings>`

**Validar após mudanças:**  
`.\ValidarConfiguracaoSimples.ps1`
