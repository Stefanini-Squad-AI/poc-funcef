<h1 align="center">
  <br/>
  funcef-api
  <br/>
</h1>

<p align="center">
  <strong>Template CLI para gerar APIs REST no ecossistema FUNCEF — .NET 10 com Clean Architecture, CQRS/Mediator e Service Layer</strong>
</p>

<p align="center">
  <a href="https://dotnet.microsoft.com/download/dotnet/10.0"><img src="https://img.shields.io/badge/.NET_10.0-512BD4?style=for-the-badge&logo=dotnet&logoColor=white" alt=".NET 10.0"/></a>
  <img src="https://img.shields.io/badge/funcef--api-Template-00897B?style=for-the-badge" alt="funcef-api"/>
  <img src="https://img.shields.io/badge/Clean_Architecture-CQRS/Mediator-1565C0?style=for-the-badge" alt="Clean Architecture"/>
  <a href="LICENSE.md"><img src="https://img.shields.io/badge/licença-FUNCEF-E53935?style=for-the-badge" alt="Licença FUNCEF"/></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/NuGet-Template-004880?style=flat-square&logo=nuget&logoColor=white" alt="NuGet"/>
  <img src="https://img.shields.io/badge/GitHub_Packages-Feed_Privado-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub Packages"/>
  <img src="https://img.shields.io/badge/GitHub_Template-Use_this_template-2EA44F?style=flat-square&logo=github&logoColor=white" alt="GitHub Template"/>
</p>

---

## Instalação Rápida

```bash
# 1. Adicionar o feed privado FUNCEF (apenas uma vez)
dotnet nuget add source "https://nuget.pkg.github.com/FUNCEF-Componentes/index.json" ^
  --name FUNCEF-Componentes ^
  --username SEU_USUARIO_GITHUB ^
  --password SEU_GITHUB_PAT ^
  --store-password-in-clear-text

# 2. Instalar o template
dotnet new install funcef-api

# 3. Criar um novo projeto
dotnet new funcef-api --name MeuProjeto

# 4. Executar
cd MeuProjeto
dotnet run --project src/MeuProjeto.API
```

> A API estará em `https://localhost:56055` · Swagger em `https://localhost:56055/swagger`

---

## O que é o funcef-api?

O `funcef-api` é um **template CLI** (`dotnet new`) que gera uma solução .NET 10 completa com toda a infraestrutura do ecossistema FUNCEF já integrada. O projeto gerado inclui um **domínio de exemplo** (Cliente/Ordem) com CRUD completo, seguindo o padrão **CQRS/Mediator com Service Layer** — pronto para ser substituído pelo domínio real.

### O que vem incluso no projeto gerado

| Recurso | Descrição | Componente FUNCEF |
|---------|-----------|:-----------------:|
| **CQRS/Mediator** | Commands, Queries e Handlers processados via `IMediator` com pipeline de validação automático | `FuncefEssenciais` |
| **Service Layer** | Lógica de negócio nos Services; controle de transação nos Handlers | — |
| **Banco de dados** | Oracle com EF Core + Dapper (híbrido) via `IRepository<T>` e `IUnitOfWork` | `FuncefORM` |
| **Domínio rico (DDD)** | Entidades com factories, invariantes e máquina de estados (`StatusOrdem`) — estado só muda por métodos de negócio | — |
| **2º banco relacional** | Infraestrutura permanente de SQL Server via EF Core (`SqlServerDbContext` + `ISqlServerRepository<T>`/UoW), pronta para receber entidades | — |
| **Document store** | 📌 Exemplo opcional de MongoDB via `IDocumentStore<T>` (histórico de Ordem) | `FuncefNoSql` |
| **Autenticação** | Azure Entra ID com OAuth2 + PKCE (interativo) e Client Credentials (M2M) — 24 endpoints prontos | `FuncefAutenticacao` |
| **Validação** | FluentValidation no pipeline do Mediator — rejeita commands inválidos antes do Handler | `FuncefEssenciais` |
| **Auditoria** | Rastreamento automático de INSERT/UPDATE/DELETE em entidades `[Auditable]` → Oracle Lakehouse (`LOG_AUDIT`) | `FuncefORM` |
| **Cache** | Redis distribuído | `FuncefNoSql` |
| **Secrets** | Azure Key Vault com cache e circuit breaker | `FuncefCofre` |
| **Storage** | Azure Blob, Queue, Table, File Share, Data Lake | `FuncefArmazenamentos` |
| **Telemetria** | OpenTelemetry + Azure Application Insights | `FuncefEssenciais` |
| **Mapeamento DTOs** | `[MapFrom]` e `[NestedMap]` para conversão automática entidade → DTO | `FuncefORM` |
| **Exceções** | `NotFoundException` (404), `BusinessException` (422), `ConflictException` (409), validação (400) | `FuncefEssenciais` |
| **Health Checks** | `/health` (público, resposta mínima), `/health/live`, `/health/ready`, `/health/version` e `/health/detalhado` (restrito) — checks por dependência: Oracle, Redis, MongoDB, SQL Server e Entra ID | `FuncefEssenciais` |
| **Scripts de banco** | `scripts/banco-dados/` com DDL Oracle do exemplo, DDL SQL Server e registro do sistema no GAP | — |
| **Testes** | MSTest + NSubstitute com cobertura completa (Validators, Handlers, Services, Controllers) | — |

### Arquitetura do projeto gerado

```mermaid
graph TB
    subgraph Projeto ["Projeto Gerado — MeuProjeto"]
        API["MeuProjeto.API\n(Controllers, Program.cs)"]
        App["MeuProjeto.Application\n(Commands, Queries, Handlers,\nServices, Validators, DTOs)"]
        Infra["MeuProjeto.Infrastructure\n(DbContext, Seeders, DI)"]
        Domain["MeuProjeto.Domain\n(Entities)"]
        Tests["MeuProjeto.Tests"]
    end

    subgraph Stack ["Stack FUNCEF"]
        Ess["FuncefEssenciais"]
        ORM["FuncefORM"]
        Seg["FuncefAutenticacao"]
        NoSql["FuncefNoSql"]
        Cofre["FuncefCofre"]
        Arm["FuncefArmazenamentos"]
    end

    API --> App --> Domain
    Infra --> Domain
    Infra --> App
    Tests --> API & App & Domain & Infra

    API -.-> Ess & Seg
    App -.-> Ess & ORM
    Infra -.-> ORM & NoSql & Cofre & Seg & Arm
```

---

## 📑 Sumário

| | Seção | Descrição |
|:---:|-------|-----------|
| 📥 | [1. Instalação do Template](#1-instalação-do-template) | Feed NuGet, GitHub Template ou instalação local |
| 🚀 | [2. Criando um Novo Projeto](#2-criando-um-novo-projeto) | Comando `dotnet new` e opções |
| 📁 | [3. Estrutura do Projeto Gerado](#3-estrutura-do-projeto-gerado) | O que cada camada contém |
| ⚙️ | [4. Configuração Obrigatória](#4-configuração-obrigatória) | Campos do appsettings que você deve preencher |
| 🔄 | [5. Substituindo o Domínio de Exemplo](#5-substituindo-o-domínio-de-exemplo) | Passo a passo para trocar Cliente/Ordem pelo seu domínio |
| 🔍 | [6. Identificando Arquivos de Exemplo](#6-identificando-arquivos-de-exemplo) | Como reconhecer e onde estão os arquivos de exemplo |
| ✅ | [7. Checklist Pós-Scaffolding](#7-checklist-pós-scaffolding) | Tudo que deve ser feito antes do primeiro deploy |
| 🧪 | [8. Validação](#8-validação) | Build, testes e execução local |
| 📤 | [9. Publicação do Template (Mantenedores)](#9-publicação-do-template-mantenedores) | Como empacotar e distribuir via GitHub Packages |
| 🐙 | [10. GitHub Template Repository](#10-github-template-repository) | Como usar via "Use this template" no GitHub |
| ❓ | [11. Troubleshooting](#11-troubleshooting) | Problemas comuns e soluções |

---

<a id="1-instalação-do-template"></a>

## 📥 1. Instalação do Template

### Pré-requisitos

| Ferramenta | Versão | Finalidade |
|-----------|--------|-----------|
| .NET SDK | **10.0+** | Build, execução e CLI `dotnet new` |
| Visual Studio 2022+ ou VS Code + C# Dev Kit | Última | IDE de desenvolvimento |
| Azure CLI (opcional) | Última | Gerenciar Key Vault e autenticação |
| Docker Desktop (opcional) | Última | Redis local (MongoDB e SQL Server opcionais, se usar os exemplos) |
| Git | 2.x+ | Controle de versão |

Verifique o SDK instalado:

```bash
dotnet --version   # Deve retornar 10.0.x ou superior
```

### Opção A — GitHub Packages (Feed NuGet Privado) — Recomendada

O template `funcef-api` é distribuído como pacote NuGet no feed privado do GitHub Packages da organização FUNCEF-Componentes.

#### Passo 1 — Configurar o feed privado (apenas uma vez por máquina)

Você precisa de um **GitHub Personal Access Token (PAT)** com a permissão `read:packages`. Para gerar:

1. Acesse [github.com/settings/tokens](https://github.com/settings/tokens)
2. Clique em **Generate new token (classic)**
3. Marque o scope **`read:packages`**
4. Copie o token gerado

Adicione o feed ao NuGet:

```bash
dotnet nuget add source "https://nuget.pkg.github.com/FUNCEF-Componentes/index.json" ^
  --name FUNCEF-Componentes ^
  --username SEU_USUARIO_GITHUB ^
  --password ghp_<TOKEN> ^
  --store-password-in-clear-text
```

> Esse comando só precisa ser executado **uma vez**. A configuração é salva no `NuGet.Config` global do usuário (`%APPDATA%\NuGet\NuGet.Config`).

#### Passo 2 — Instalar o template

```bash
dotnet new install funcef-api
```

#### Passo 3 — Verificar a instalação

```bash
dotnet new list funcef
```

Saída esperada:

```
Nome do modelo       Nome Curto  Idioma  Tags
-------------------  ----------  ------  ----------------------------------------------
FUNCEF TEMPLATE API  funcef-api  [C#]    Web/API/FUNCEF/Clean Architecture/CQRS/.NET 10
```

#### Atualizar para uma nova versão

```bash
dotnet new install funcef-api
```

> O `dotnet new install` já atualiza automaticamente se uma versão mais nova estiver disponível no feed.

### Opção B — GitHub Template Repository (via navegador)

Se o repositório `lib-api-template` está marcado como **GitHub Template** ([como configurar](#10-github-template-repository)):

1. Acesse o repositório `lib-api-template` no GitHub
2. Clique em **"Use this template"** → **"Create a new repository"**
3. Dê o nome desejado ao repositório (ex: `api-cadastro`)
4. Clique em **"Create repository"**
5. **Aguarde ~30 segundos** — o workflow `setup-template.yml` será executado automaticamente

O workflow faz:

- Achata a estrutura (`TemplateBase/` → raiz)
- Remove artefatos NuGet (`Funcef.Api.Template.csproj`, `nuget.config`)
- Remove o prefixo `api-` do nome do repositório (se existir)
- Converte o nome restante para PascalCase e substitui `TemplateBase` em todos os arquivos
- Renomeia arquivos, pastas e namespaces
- Remove todos os workflows (inclusive a si mesmo)

**Exemplos de nomenclatura:**

| Repositório | Nome do projeto gerado |
|-------------|:----------------------:|
| `api-template-base` | `TemplateBase` |
| `api-cadastro` | `Cadastro` |
| `api-gestao-investimentos` | `GestaoInvestimentos` |

<details>
<summary><strong>Quando a branch <code>main</code> tem branch protection</strong></summary>

Se o repositório tiver **branch protection** ativa na `main`, o workflow não consegue fazer push direto. Nesse caso, um **Pull Request** é criado automaticamente:

1. **Aguarde o workflow concluir** — Verifique a aba **Actions** do repositório
2. **Localize o PR** — Na aba **Pull requests**, aparecerá um PR com o título `chore: inicializar projeto [NomeDoProjeto]`
3. **Revise e faça o merge** — Clique em **Merge pull request**
4. **Exclua a branch** — Clique em **Delete branch** para limpar a branch `chore/inicializar-template`
5. **Clone e configure** — Clone o repositório e configure o `appsettings.Development.json` conforme a [seção 4](#4-configuração-obrigatória)

</details>

### Opção C — Instalação Local (desenvolvimento/testes)

Caso tenha o repositório `lib-api-template` clonado localmente:

```bash
dotnet new install "C:\GIT\funcef-componentes\lib-api-template\TemplateBase"
```

### Desinstalar

```bash
# Via NuGet (Opção A)
dotnet new uninstall funcef-api

# Via pasta local (Opção C)
dotnet new uninstall "C:\GIT\funcef-componentes\lib-api-template\TemplateBase"
```

---

<a id="2-criando-um-novo-projeto"></a>

## 🚀 2. Criando um Novo Projeto

```bash
dotnet new funcef-api --name MeuProjeto
```

Isso cria uma pasta `MeuProjeto/` com toda a solução já configurada.

### O que acontece automaticamente

O mecanismo `sourceName` do template substitui **todas** as ocorrências de `TemplateBase` pelo nome informado:

| Original | Gerado com `--name CadastroFundo` |
|----------|-----------------------------------|
| `TemplateBase.slnx` | `CadastroFundo.slnx` |
| `TemplateBase.API/` | `CadastroFundo.API/` |
| `TemplateBase.Domain/` | `CadastroFundo.Domain/` |
| `TemplateBase.Application/` | `CadastroFundo.Application/` |
| `TemplateBase.Infrastructure/` | `CadastroFundo.Infrastructure/` |
| `TemplateBase.Tests/` | `CadastroFundo.Tests/` |
| `namespace TemplateBase.Domain` | `namespace CadastroFundo.Domain` |
| `Telemetry.ServiceName: "TemplateBase.API"` | `Telemetry.ServiceName: "CadastroFundo.API"` |
| `Audit.ApplicationName: "TemplateBase.API"` | `Audit.ApplicationName: "CadastroFundo.API"` |
| `Swagger.Title: "TemplateBase API"` | `Swagger.Title: "CadastroFundo API"` |

### Exemplos de uso

```bash
# API de Cadastro de Participantes
dotnet new funcef-api --name CadastroParticipante

# API de Gestão de Investimentos
dotnet new funcef-api --name GestaoInvestimentos

# API de Empréstimos
dotnet new funcef-api --name Emprestimos

# Especificando diretório de saída
dotnet new funcef-api --name MinhaAPI --output C:\GIT\funcef\MinhaAPI
```

---

<a id="3-estrutura-do-projeto-gerado"></a>

## 📁 3. Estrutura do Projeto Gerado

```
MeuProjeto/
├── MeuProjeto.slnx
├── src/
│   ├── MeuProjeto.API/                    ← Camada de apresentação
│   │   ├── Controllers/
│   │   │   ├── ClientesController.cs      ← 📌 EXEMPLO
│   │   │   └── OrdensController.cs        ← 📌 EXEMPLO
│   │   ├── Diagnostics/                   ← (manter) Diagnóstico de startup/Entra
│   │   ├── HealthChecks/                  ← (manter) Checks de Redis, MongoDB, SQL Server
│   │   ├── Middleware/                    ← (manter) SecurityHeadersMiddleware
│   │   ├── Stores/                        ← (manter) Módulos de registro (Presentation, Security, HealthCheck)
│   │   ├── wwwroot/                       ← Páginas de login (FuncefAutenticacao)
│   │   ├── Program.cs                     ← (manter) ~25 linhas: registra, constrói, monta o pipeline
│   │   ├── ApiPipeline.cs                 ← (manter) Middlewares e endpoints na ordem correta
│   │   ├── DependencyInjection.cs         ← (manter) AddApiServices() — compõe as 3 camadas
│   │   ├── appsettings.json               ← ⚙️ CONFIGURAR (AllowedHosts, Cors, Auth:Autorizacao)
│   │   ├── appsettings.Development.json   ← ⚙️ CONFIGURAR
│   │   └── appsettings.Homologation.json  ← ⚙️ CONFIGURAR
│   │
│   ├── MeuProjeto.Application/            ← Camada de aplicação (CQRS/Mediator)
│   │   ├── Abstractions/                  ← (manter) ConfigurationSections + contratos SQL Server
│   │   ├── Commands/                      ← 📌 EXEMPLO (Cliente/ e Ordem/)
│   │   ├── Queries/                       ← 📌 EXEMPLO (Cliente/ e Ordem/)
│   │   ├── Services/                      ← 📌 EXEMPLO (IClienteService, IOrdemService, IOrdemHistoricoService)
│   │   ├── DTOs/                          ← 📌 EXEMPLO (ClienteDto/ e OrdemDto/)
│   │   ├── Documents/                     ← 📌 EXEMPLO (OrdemHistoricoDocumento — MongoDB)
│   │   └── Stores/                        ← (manter) Mediator + DomainServices (módulos de registro)
│   │
│   ├── MeuProjeto.Domain/                 ← Camada de domínio (entidades RICAS — DDD)
│   │   └── Entities/
│   │       ├── Cliente.cs                 ← 📌 EXEMPLO (factory Criar + invariantes)
│   │       ├── Ordem.cs                   ← 📌 EXEMPLO (factory + AlterarStatus/ValidarExclusao)
│   │       └── StatusOrdem.cs             ← 📌 EXEMPLO (máquina de estados — fonte única)
│   │
│   └── MeuProjeto.Infrastructure/         ← Camada de infraestrutura
│       ├── Configuration/                 ← (manter) Vault + validação fail-fast de config
│       ├── Persistence/
│       │   ├── Context/
│       │   │   ├── AppDbContext.cs        ← ⚠️ PARCIAL (seções marcadas)
│       │   │   └── SqlServerDbContext.cs  ← (manter) 2º banco — declare seus DbSet aqui
│       │   ├── SqlServer/                 ← (manter) Repository/UnitOfWork do 2º banco
│       │   ├── Documents/                 ← 📌 EXEMPLO (mapeamento Bson do histórico)
│       │   └── Seeders/                   ← 📌 EXEMPLO
│       ├── Services/                      ← 📌 EXEMPLO (OrdemHistoricoService — MongoDB)
│       └── Stores/                        ← (manter) Módulos de registro (um por preocupação)
│
├── scripts/
│   └── banco-dados/                       ← 📌 EXEMPLO (DDL Oracle e registro no GAP)
│
└── tests/
    └── MeuProjeto.Tests/                  ← 📌 EXEMPLO (maioria dos testes)
        ├── API/Controllers/
        ├── Application/
        ├── Domain/
        └── Infrastructure/
```

**Legenda:**
- 📌 **EXEMPLO** — Arquivo inteiro é exemplo, substituir e excluir
- ⚠️ **PARCIAL** — Arquivo tem seções de exemplo marcadas com `── EXEMPLO ──` / `── FIM EXEMPLO ──`
- ⚙️ **CONFIGURAR** — Preencher com valores do seu ambiente
- **(manter)** — Infraestrutura do template, não excluir

---

<a id="4-configuração-obrigatória"></a>

## ⚙️ 4. Configuração Obrigatória

Após criar o projeto, abra o `appsettings.Development.json` (desenvolvimento local), `appsettings.Homologation.json` (homologação) e o `appsettings.json` (produção) e preencha os campos vazios.

### 5.1 Azure Key Vault

```jsonc
"KeyVault": {
  "Url": ""  // ← URL do seu Key Vault: "https://kv-<sistema>-<env>-001.vault.azure.net/"
}
```

> O Key Vault centraliza as connection strings do Oracle, Redis, auditoria (Oracle) e Application Insights. Crie os secrets correspondentes no portal Azure.

### 5.2 Banco de Dados Oracle (FuncefORM)

```jsonc
"FuncefORM": {
  "Connection": {
    "SecretName": ""  // ← Nome do secret no Key Vault com a connection string Oracle
  }
}
```

> Crie um secret no Key Vault com o valor da connection string Oracle. Exemplo de nome: `OracleConnectionString`.

### 5.3 Redis (Cache)

```jsonc
"NoSql": {
  "Redis": {
    "ConnectionStringFromKeyVault": {
      "Enabled": true,
      "SecretName": "RedisConnectionString"  // ← Nome do secret no Key Vault com a connection string Redis
    }
  }
}
```

### 5.4 Auditoria (Oracle Lakehouse)

A auditoria de entidades (`FuncefORM:Audit`) e a de acesso (`Auth:Audit`) são persistidas no **Oracle Lakehouse** (tabela `LOG_AUDIT`). A connection string vem do Key Vault:

```jsonc
"FuncefORM": {
  "Audit": {
    "Enabled": true,
    // Forma canônica única do ecossistema (SecretRef): subseção "<Coisa>FromKeyVault"
    // com Enabled + SecretName. É fixa a CHAVE do appsettings, nunca o nome do segredo.
    "ConnectionStringFromKeyVault": {
      "Enabled": true,
      "SecretName": "AuditOracle"   // ← segredo do cofre DESTE sistema, com a connection string Oracle de auditoria
    }
  }
}
```

> **A partir da 4.0.0** todas as referências a segredo usam essa forma. As sintaxes anteriores (`Auth:EntraId:*KeyName`, `FuncefORM:Connection:SecretName`, `Auth:RefreshToken:SigningKeySecretName`, `UseKeyVaultForConnectionString` + `*SecretName`) foram **removidas** dos componentes FUNCEF — sem alias. Uma chave antiga não quebra o build nem o startup: é ignorada, e o segredo nunca é resolvido. Mapa completo em `FUNCEF.Abstractions/docs/CONFIGURACAO-FUNCEF.md`.

> **MongoDB** deixou de ser usado para auditoria na migração v4/v5. O `FuncefNoSql` ainda oferece MongoDB como document store **opcional** — habilite somente se o projeto precisar. O template traz um exemplo pronto (histórico de Ordem via `IDocumentStore<T>` — veja a seção 5.10).

### 5.5 Azure Entra ID (Autenticação)

```jsonc
"Auth": {
  "EntraId": {
    "TenantId": "",      // ← Tenant ID do Azure Entra ID
    "ClientId": "",      // ← Application (client) ID registrado no Entra ID
    "ClientSecret": "",  // ← Client Secret gerado no Entra ID
    "Audience": "",      // ← URI do identificador da API (ex: "api://<ClientId>")
    "RedirectUri": "",   // ← URL de callback (ex: "https://localhost:56055/auth/callback")
    "PostLogoutRedirectUri": ""  // ← URL pós-logout (ex: "https://localhost:56055/login.html")
  }
}
```

### 5.6 Application Insights (Telemetria)

```jsonc
"ApplicationInsights": {
  "SecretName": ""  // ← Nome do secret no Key Vault com a connection string do App Insights
}
```

### 5.7 Azure Storage (Opcional)

```jsonc
"Storage": {
  "StorageAccountUri": ""  // ← URI da Storage Account (ex: "https://stfuncefmeuprojeto.blob.core.windows.net/")
}
```

### 5.8 CORS (Produção)

```jsonc
"Cors": {
  "AllowedOrigins": []  // ← URLs permitidas (ex: ["https://meuapp.funcef.com.br"])
}
```

### 5.9 Autorização no GAP (PDP)

O `[FuncefAuthorize]` com `Acao` consulta o PDP do GAP. Configure o cliente de autorização:

```jsonc
"Auth": {
  "Autorizacao": {
    "BaseUrl": "",         // ← URL do api-ms-gap (ex: "https://localhost:25729")
    "CodigoSistema": "",   // ← Código do sistema registrado no GAP (ex: "Template")
    "TimeoutMs": 5000
  }
}
```

> O sistema, as ações e o menu precisam estar registrados no GAP — veja o script de exemplo `scripts/banco-dados/gap/01-registro-sistema-template.sql`.

### 5.10 Exemplos opcionais (MongoDB e SQL Server)

O document store (histórico de Ordem) e o segundo banco relacional (SQL Server) só são registrados quando a respectiva seção existe no `appsettings` (fonte única das condições: `ConfigurationSections`):

```jsonc
"NoSql": {
  "MongoDocuments": {    // ← Exemplo MongoDB — remova a seção se não for usar
    "ConnectionStringFromKeyVault": { "Enabled": true, "SecretName": "MongoConnectionString" },
    "DatabaseName": "meuprojeto"
  }
},
"SqlServer": {           // ← 2º banco relacional — remova a seção se não for usar
  "SecretName": "SQLConnection",
  "DirectConnectionString": "",
  "CommandTimeout": 30,
  "MaxRetryCount": 3
}
```

### Resumo de Secrets no Key Vault

| Secret Name (sugestão) | Serviço | Exemplo de valor |
|------------------------|---------|------------------|
| `OracleConnectionString` | Oracle | `Data Source=...;User Id=...;Password=...;` |
| `RedisConnectionString` | Redis | `redis-host:6380,password=...,ssl=True` |
| `AuditOracle` | Auditoria (Oracle) | `Data Source=...;User Id=...;Password=...;` |
| `AppInsightConnection` | App Insights | `InstrumentationKey=...;IngestionEndpoint=...` |
| `RefreshTokenSigningKey` | JWT Refresh | Chave HMAC-SHA256 (mín. 32 caracteres) |
| `MongoConnectionString` | MongoDB (exemplo opcional) | `mongodb://usuario:senha@host:27017` |
| `SQLConnection` | SQL Server (exemplo opcional) | `Server=...;Database=...;User Id=...;Password=...;` |

---

<a id="5-substituindo-o-domínio-de-exemplo"></a>

## 🔄 5. Substituindo o Domínio de Exemplo

O template inclui um domínio de exemplo completo (**Cliente** e **Ordem**) com CRUD, validações, DTOs, testes e seeders. Use-o como referência para entender os padrões e depois substitua pelo seu domínio real.

### Passo a passo

#### Passo 1 — Criar suas entidades

Crie suas entidades em `Domain/Entities/` (classes planas, sem classe base — a PK identity `long` é declarada na própria entidade):

```csharp
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using FuncefORM.Audit.Attributes;

namespace MeuProjeto.Domain.Entities;

[Table("TB_PARTICIPANTES", Schema = "MEU_SCHEMA")]
[Auditable("Participante")]
public class Participante
{
    [Key]
    [Column("PARTICIPANTE_ID")]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long Id { get; set; }

    [Required]
    [MaxLength(200)]
    [Column("NOME")]
    public string Nome { get; set; } = string.Empty;

    [Required]
    [MaxLength(11)]
    [Column("CPF")]
    public string Cpf { get; set; } = string.Empty;

    // Coluna de controle obrigatória do PadraoBD (carga incremental)
    [Required]
    [Column("DATA_INCLUSAO_ALTERACAO")]
    public DateTime DataInclusaoAlteracao { get; set; } = DateTime.UtcNow;
}
```

> **Schema Oracle:** defina o schema real no atributo `[Table]` de cada entidade. Siga o PadraoBD FUNCEF: tabela com prefixo `TB_` no plural, PK surrogate `<ENTIDADE>_ID` (NUMBER identity → `long`) e coluna de controle `DATA_INCLUSAO_ALTERACAO`. Consulte `Cliente.cs` e `Ordem.cs` (exemplos) para o padrão completo.

#### Passo 2 — Registrar no AppDbContext

Edite `Infrastructure/Persistence/Context/AppDbContext.cs` — substitua as seções marcadas com `── EXEMPLO ──`:

```csharp
// Substitua os DbSets de exemplo
public DbSet<Participante> Participantes { get; set; } = null!;

// Substitua as configurações Fluent API de exemplo no OnModelCreating
modelBuilder.Entity<Participante>(entity =>
{
    entity.HasIndex(e => e.Cpf).IsUnique();
});
```

#### Passo 3 — Criar DTOs

Siga a convenção de pastas `DTOs/{Entidade}Dto/Request|Response|Resume`:

```
Application/DTOs/
└── ParticipanteDto/
    ├── Request/
    │   └── ParticipanteRequest.cs
    ├── Response/
    │   └── ParticipanteResponse.cs
    └── Resume/
        └── ParticipanteResume.cs
```

#### Passo 4 — Criar Service, Commands e Queries (CQRS/Mediator)

Crie o Service em `Application/Services/`:

```csharp
public interface IParticipanteService
{
    Task<Participante> CreateAsync(ParticipanteRequest request, CancellationToken ct = default);
    Task<Participante?> GetByIdAsync(long id, CancellationToken ct = default);
}

public class ParticipanteService : IParticipanteService
{
    private readonly IRepository<Participante> _repository;
    // Implementação com IRepository<T> para acesso a dados
}
```

Siga a convenção `Commands/{Entidade}/{Ação}/` e `Queries/{Entidade}/{Detalhe}/`:

```
Application/
├── Commands/
│   └── Participante/
│       ├── Create/
│       │   ├── CreateParticipanteCommand.cs     (ICommand<ParticipanteResponse>)
│       │   ├── CreateParticipanteValidator.cs    (AbstractValidator<CreateParticipanteCommand>)
│       │   └── CreateParticipanteHandler.cs      (ICommandHandler<..., ParticipanteResponse>)
│       ├── Update/
│       └── Delete/
├── Queries/
│   └── Participante/
│       ├── GetById/
│       └── GetPaged/
└── Services/
    ├── IParticipanteService.cs
    └── ParticipanteService.cs
```

> **Commands** têm 3 arquivos: Command (`ICommand<T>`), Validator (`AbstractValidator<Command>`), Handler (`ICommandHandler<,>`).
> **Queries** têm 2 arquivos: Query (`IQuery<T>`), Handler (`IQueryHandler<,>`). Queries não possuem Validators.
> **Handlers** delegam ao **Service** e controlam transação via `IUnitOfWork`. **Services** usam `IRepository<T>` para acesso a dados.

#### Passo 5 — Registrar no DI

Edite `Application/Stores/DomainServicesRegistration.cs` — substitua a seção marcada com `── EXEMPLO ──` (Handlers e Validators são auto-scan pelo `MediatorRegistration`):

```csharp
internal static IServiceCollection AddDomainServices(
    this IServiceCollection services,
    IConfiguration configuration)
{
    // Services de negócio — registro manual por interface
    services.AddScoped<IParticipanteService, ParticipanteService>();

    return services;
}
```

> Handlers e Validators são registrados **automaticamente** pelo `AddMediatorWithDefaults()`. Apenas o **Service** precisa de registro manual.

#### Passo 6 — Criar Controller

Crie sua controller em `API/Controllers/`:

```csharp
[Route("[controller]")]
[ApiController]
public class ParticipantesController(ITelemetry telemetry, IMediator mediator) : BaseController(telemetry)
{
    private readonly IMediator _mediator = mediator;

    [HttpPost]
    [FuncefAuthorize(Acao = "Funcef.MeuSistema/participantes/write")]
    public async Task<IActionResult> Create(
        [FromBody] ParticipanteRequest request, CancellationToken ct = default)
    {
        var result = await _mediator.Send(
            new CreateParticipanteCommand { Request = request }, ct);
        return ApiCreated(result);
    }

    [HttpGet("{id:long}")]
    [FuncefAuthorize(Acao = "Funcef.MeuSistema/participantes/read")]
    public async Task<IActionResult> Get(long id, CancellationToken ct = default)
    {
        var result = await _mediator.Receive(
            new GetParticipanteByIdQuery { Id = id }, ct);
        return ApiOk(result);
    }
}
```

> Consulte `ClientesController.cs` (exemplo) para ver o padrão completo com `[FuncefAuthorize]`, `IMediator` e `ApiOk()`/`ApiCreated()`/`ApiNoContent()`.

#### Passo 7 — Criar Testes

Siga os padrões em `Tests/` — consulte os testes de exemplo para referência.

#### Passo 8 — Excluir os Arquivos de Exemplo

Após criar seu domínio, exclua todos os arquivos marcados como exemplo (veja [seção 6](#6-identificando-arquivos-de-exemplo)).

---

<a id="6-identificando-arquivos-de-exemplo"></a>

## 🔍 6. Identificando Arquivos de Exemplo

### Arquivos inteiros de exemplo

Todos os arquivos de exemplo possuem o seguinte banner no topo:

```
// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
```

**Para encontrar todos de uma vez:**

```bash
# PowerShell
Get-ChildItem -Recurse -Filter *.cs | Select-String "ARQUIVO DE EXEMPLO" | Select-Object -ExpandProperty Path | Sort-Object -Unique

# Bash / Linux
grep -rl "ARQUIVO DE EXEMPLO" --include="*.cs" .
```

### Seções de exemplo dentro de arquivos

Quatro arquivos de infraestrutura possuem **seções internas** marcadas com comentários delimitadores:

```csharp
// ── EXEMPLO: <instrução> ──
   ... código de exemplo ...
// ── FIM EXEMPLO ──
```

| Arquivo | O que substituir |
|---------|-----------------|
| `Infrastructure/Persistence/Context/AppDbContext.cs` | `using` das entidades, `DbSet<>` e configurações `OnModelCreating` (blocos `── EXEMPLO ──`) |
| `Application/Stores/DomainServicesRegistration.cs` | `AddScoped` dos Services do seu domínio (Handlers e Validators são auto-scan pelo `AddMediatorWithDefaults`) |
| `Infrastructure/Stores/DocumentsRegistration.cs` | Registro do document store MongoDB (bloco `── EXEMPLO ──` do histórico de Ordem) |
| `Infrastructure/Persistence/Context/SqlServerDbContext.cs` | Declare os `DbSet<>` das suas entidades do 2º banco (a infraestrutura é permanente; sem entidades, apenas não a use) |

### Lista completa de arquivos de exemplo

<details>
<summary><strong>Clique para expandir</strong></summary>

#### Domain (3 arquivos)

| Arquivo | Descrição |
|---------|-----------|
| `Domain/Entities/Cliente.cs` | Entidade rica de exemplo (factory `Criar` + invariantes) |
| `Domain/Entities/Ordem.cs` | Entidade rica de exemplo com FK (factory + `AlterarStatus`/`ValidarExclusao`) |
| `Domain/Entities/StatusOrdem.cs` | Máquina de estados da Ordem — fonte única dos status e regras de transição/exclusão |

#### Application — Commands (27 arquivos em 9 pastas)

| Pasta | Arquivos |
|-------|----------|
| `Commands/Cliente/Create/` | CreateClienteCommand, CreateClienteValidator, CreateClienteHandler |
| `Commands/Cliente/Update/` | UpdateClienteCommand, UpdateClienteValidator, UpdateClienteHandler |
| `Commands/Cliente/Delete/` | DeleteClienteCommand, DeleteClienteValidator, DeleteClienteHandler |
| `Commands/Cliente/CreateComOrdemEf/` | CreateClienteComOrdemEfCommand, Validator, Handler |
| `Commands/Cliente/CreateComOrdemDapper/` | CreateClienteComOrdemDapperCommand, Validator, Handler |
| `Commands/Ordem/Create/` | CreateOrdemCommand, CreateOrdemValidator, CreateOrdemHandler |
| `Commands/Ordem/Update/` | UpdateOrdemCommand, UpdateOrdemValidator, UpdateOrdemHandler |
| `Commands/Ordem/UpdateStatus/` | UpdateOrdemStatusCommand, Validator, Handler |
| `Commands/Ordem/Delete/` | DeleteOrdemCommand, DeleteOrdemValidator, DeleteOrdemHandler |

#### Application — Queries (12 arquivos em 6 pastas)

| Pasta | Arquivos |
|-------|----------|
| `Queries/Cliente/GetById/` | GetClienteByIdQuery, GetClienteByIdHandler |
| `Queries/Cliente/GetPaged/` | GetClientePagedQuery, GetClientePagedHandler |
| `Queries/Ordem/GetById/` | GetOrdemByIdQuery, GetOrdemByIdHandler |
| `Queries/Ordem/GetPaged/` | GetOrdemPagedQuery, GetOrdemPagedHandler |
| `Queries/Ordem/GetByCliente/` | GetOrdensByClienteQuery, GetOrdensByClienteHandler |
| `Queries/Ordem/GetHistorico/` | GetOrdemHistoricoQuery, GetOrdemHistoricoHandler (MongoDB) |

#### Application — Services (5 arquivos)

| Arquivo | Descrição |
|---------|-----------|
| `Services/IClienteService.cs` | Interface do serviço de clientes |
| `Services/ClienteService.cs` | Orquestração (email único entre registros, Dapper); invariantes vivem na entidade |
| `Services/IOrdemService.cs` | Interface do serviço de ordens |
| `Services/OrdemService.cs` | Orquestração (existência do cliente, Dapper); máquina de estados vive na entidade |
| `Services/IOrdemHistoricoService.cs` | Interface do histórico de ordens (MongoDB; implementação na Infrastructure) |

#### Application — DTOs e Documents (13 arquivos)

| Pasta | Arquivos |
|-------|----------|
| `DTOs/ClienteDto/Request/` | ClienteRequest, ClienteComOrdemRequest |
| `DTOs/ClienteDto/Response/` | ClienteResponse, ClienteComOrdemResponse |
| `DTOs/ClienteDto/Resume/` | ClienteResume |
| `DTOs/OrdemDto/Request/` | CreateOrdemRequest, UpdateOrdemRequest, UpdateOrdemStatusRequest |
| `DTOs/OrdemDto/Response/` | OrdemResponse |
| `DTOs/OrdemDto/Resume/` | OrdemResume |
| `Documents/` | OrdemHistoricoDocumento (document store MongoDB) |

#### API — Controllers (2 arquivos)

| Arquivo | Descrição |
|---------|-----------|
| `Controllers/ClientesController.cs` | CRUD completo com Swagger e [FuncefAuthorize] |
| `Controllers/OrdensController.cs` | CRUD com filtro por cliente e histórico (MongoDB) |

> **Health:** Os endpoints `/health`, `/health/live`, `/health/ready`, `/health/version` e `/health/detalhado` são mapeados em `ApiPipeline.cs` (sem controller); os checks de dependência (Redis, MongoDB, SQL Server, Entra) são capacidade permanente em `HealthChecks/` + `Stores/HealthCheckRegistration.cs`.

#### Infrastructure (4 arquivos de exemplo)

| Arquivo | Descrição |
|---------|-----------|
| `Persistence/Seeders/ClienteSeeder.cs` | Dados iniciais de exemplo (via factory `Cliente.Criar`) |
| `Persistence/Seeders/OrdemSeeder.cs` | Dados iniciais de exemplo (factory + `AlterarStatus`) |
| `Persistence/Documents/OrdemHistoricoDocumentoMapping.cs` | Mapeamento Bson do documento de exemplo |
| `Services/OrdemHistoricoService.cs` | Implementação do histórico (MongoDB, `IDocumentStore<T>`) |

> A infraestrutura de SQL Server (`SqlServerDbContext`, `SqlServerRepository`/`UnitOfWork`, `SqlServerRegistration`) **não é exemplo** — é capacidade permanente; declare seus `DbSet<>` no contexto para usá-la.

#### Scripts de banco (`scripts/banco-dados/`)

| Pasta | Conteúdo |
|-------|----------|
| `00-schema/` | Criação do schema Oracle de exemplo e do schema `LOG_AUDIT` (auditoria) |
| `01-tabelas/` e `02-indices/` | DDL Oracle de `TB_CLIENTES`/`TB_ORDENS` e índices |
| `gap/` | Registro do sistema, ações e menu no GAP |
| `sqlserver/` | DDL de `TB_EVENTOS_INTEGRACAO` (SQL Server) |

#### Tests (21 arquivos)

| Pasta | Arquivos |
|-------|----------|
| `Domain/` | ClienteTests, OrdemTests |
| `Application/DTOs/` | ClienteDTOTests, OrdemDTOTests, OrdemResumeTests |
| `Application/Handlers/` | ClienteHandlersTests, OrdemHandlersTests, DapperHandlerTests, PagedHandlersTests |
| `Application/Validators/` | ClienteValidatorsTests, OrdemValidatorsTests, CreateClienteValidatorTests, CreateOrdemValidatorTests, UpdateOrdemValidatorTests |
| `Application/` | ServiceRegistrationTests |
| `API/Controllers/` | ClientesControllerTests, OrdensControllerTests |
| `Infrastructure/` | AppDbContextTests, SeederTests |
| `Integration/Services/` | ClienteServiceIntegrationTests, OrdemServiceIntegrationTests |

</details>

---

<a id="7-checklist-pós-scaffolding"></a>

## ✅ 7. Checklist Pós-Scaffolding

Após criar o projeto e substituir o domínio de exemplo, verifique cada item:

### Configuração

- [ ] Preencher `KeyVault:Url` no `appsettings.Development.json` e `appsettings.Homologation.json`
- [ ] Criar secrets no Key Vault (Oracle, Redis, AuditOracle, App Insights)
- [ ] Preencher `SecretName` nos respectivos campos do `appsettings.json`
- [ ] Configurar `Auth:EntraId` com dados do App Registration do Azure Entra ID
- [ ] Configurar `Cors:AllowedOrigins` para produção
- [ ] Definir `Storage:StorageAccountUri` (se usar Azure Storage)
- [ ] Ajustar `Telemetry:ServiceVersion` conforme o versionamento do seu projeto

### Domínio

- [ ] Criar entidades **ricas** em `Domain/Entities/` (factory + invariantes; schema Oracle no atributo `[Table]`)
- [ ] Registrar `DbSet<>` no `AppDbContext.cs` (substituir seções de exemplo)
- [ ] Adicionar configurações Fluent API no `OnModelCreating` (se necessário)
- [ ] Criar DTOs em `Application/DTOs/{Entidade}Dto/`
- [ ] Criar Service (Interface + Implementação) em `Application/Services/`
- [ ] Criar Commands em `Application/Commands/{Entidade}/{Ação}/` (Command, Validator, Handler)
- [ ] Criar Queries em `Application/Queries/{Entidade}/{Detalhe}/` (Query, Handler)
- [ ] Registrar Service no `Application/Stores/DomainServicesRegistration.cs` (Handlers e Validators são auto-scan via `AddMediatorWithDefaults`)
- [ ] Criar Controllers em `API/Controllers/` com `IMediator`
- [ ] Criar testes unitários em `Tests/`

### Limpeza

- [ ] Excluir todos os arquivos com banner `ARQUIVO DE EXEMPLO`
- [ ] Remover seções `── EXEMPLO ──` / `── FIM EXEMPLO ──` dos arquivos parciais
- [ ] Remover pastas vazias (`Commands/Cliente/`, `Commands/Ordem/`, `Queries/Cliente/`, `Queries/Ordem/`, `DTOs/ClienteDto/`, `DTOs/OrdemDto/`, `Documents/`, `Services/`, etc.)
- [ ] Excluir o exemplo de document store se não for usar (MongoDB: `Documents/`, `OrdemHistorico*`) e a seção `NoSql:MongoDocuments` do `appsettings`; se não for usar o 2º banco, remova a seção `SqlServer` (a infraestrutura fica inerte)
- [ ] Excluir `Infrastructure/Persistence/Seeders/` se não for usar seeding
- [ ] Verificar que o projeto compila sem erros (`dotnet build`)
- [ ] Verificar que os testes passam (`dotnet test`)

---

<a id="8-validação"></a>

## 🧪 8. Validação

### Build

```bash
cd MeuProjeto
dotnet restore
dotnet build
```

### Testes

```bash
dotnet test --verbosity normal
```

### Execução Local

```bash
cd src/MeuProjeto.API
dotnet run
```

A API estará disponível em `https://localhost:56055` (ou a porta configurada em `launchSettings.json`).

### Verificar Health Check

Os endpoints de health estão unificados em `/health/*` (sem controller dedicado):

```bash
# Status geral (público — resposta mínima em texto: Healthy/Unhealthy)
curl -k https://localhost:56055/health

# Liveness probe (check "self", sem tocar dependências externas)
curl -k https://localhost:56055/health/live

# Readiness probe (Oracle, Redis, MongoDB, SQL Server, Entra ID — conforme configurado)
curl -k https://localhost:56055/health/ready

# Versão da API
curl -k https://localhost:56055/health/version

# Detalhado (JSON por dependência) — apenas em Development ou com HealthChecks:ExposeDetailed=true
curl -k https://localhost:56055/health/detalhado
```

> **Segurança:** `/health` retorna apenas `Healthy`/`Unhealthy` em texto simples para não expor nomes, durações e erros das dependências a quem não está autenticado. O JSON detalhado (por dependência) fica em `/health/detalhado`, habilitado somente em Development ou via `HealthChecks:ExposeDetailed`.

Resposta esperada de `/health/detalhado`:

```json
{
  "status": "Healthy",
  "entries": {
    "self": { "status": "Healthy" },
    "oracle": { "status": "Healthy" },
    "redis": { "status": "Healthy" },
    "sqlserver-exemplo": { "status": "Healthy" }
  }
}
```

### Swagger

Acesse `https://localhost:56055/swagger` (habilitado por padrão em Development).

---

<a id="9-publicação-do-template-mantenedores"></a>

## 📤 9. Publicação do Template (Mantenedores)

Esta seção é destinada aos mantenedores do template que precisam publicar novas versões no feed NuGet privado.

### 10.1 Estrutura do Repositório

O template está organizado no repositório `lib-api-template`:

```
lib-api-template/
├── .github/workflows/
│   ├── publish-package.yml      ← Publica no GitHub Packages (NuGet)
│   ├── test-restore.yml         ← Testa pack e geração
│   ├── create-release.yml       ← Cria release e tag
│   └── setup-template.yml       ← Inicialização do GitHub Template
├── Funcef.Api.Template.csproj   ← Projeto de empacotamento NuGet
├── LICENSE.md                   ← Licença FUNCEF
├── README.md                    ← Este guia
├── nuget.config                 ← Feed GitHub Packages
└── TemplateBase/                ← Conteúdo do template
    ├── .template.config/
    │   └── template.json        ← Configuração do dotnet new
    ├── src/
    ├── tests/
    ├── docs/
    └── TemplateBase.slnx
```

> O `.csproj` fica **fora** do `TemplateBase/` para não ser incluído no projeto gerado.

### 10.2 Pipelines CI/CD

A publicação é automatizada via GitHub Actions:

| Workflow | Trigger | O que faz |
|----------|---------|-----------|
| `create-release.yml` | Manual (`workflow_dispatch`) | Valida versão, cria tag git e release no GitHub |
| `publish-package.yml` | Release publicada ou manual | Empacota e publica o `.nupkg` no GitHub Packages |
| `test-restore.yml` | Push em `main` ou manual | Testa pack, instalação e geração de projeto |

**Fluxo recomendado:**

1. Executar `create-release.yml` informando a versão (ex: `1.1.0`)
2. O workflow cria a tag `v1.1.0` e a release no GitHub
3. A release dispara automaticamente o `publish-package.yml`
4. O pacote `funcef-api@1.1.0` é publicado no GitHub Packages

### 10.3 Empacotar Localmente (teste)

```bash
cd C:\GIT\funcef-componentes\lib-api-template
dotnet pack Funcef.Api.Template.csproj -o ./nupkg
```

Gera o arquivo `nupkg/funcef-api.1.0.0.nupkg`.

### 10.4 Atualizar Versão

Antes de criar uma nova release, edite o `Funcef.Api.Template.csproj`:

```xml
<VersionPrefix>1.1.0</VersionPrefix>
```

> Siga o [versionamento semântico](https://semver.org/lang/pt-BR/): MAJOR.MINOR.PATCH.

### 10.5 Publicar Manualmente (alternativa ao pipeline)

```bash
dotnet nuget push ./nupkg/funcef-api.1.1.0.nupkg \
  --source "https://nuget.pkg.github.com/FUNCEF-Componentes/index.json" \
  --api-key SEU_GITHUB_PAT
```

> O GitHub PAT precisa da permissão `write:packages`.

### 10.6 Atualizar para Consumidores

Os desenvolvedores devem atualizar o template instalado:

```bash
dotnet new install funcef-api
```

> O `dotnet new install` já atualiza se uma versão mais nova estiver disponível.

---

<a id="10-github-template-repository"></a>

## 🐙 10. GitHub Template Repository

Além da CLI `dotnet new`, o repositório `lib-api-template` pode ser usado como **GitHub Template Repository**, permitindo criar novos projetos diretamente pelo navegador com substituição automática de nomes.

### 11.1 Como funciona

O repositório `lib-api-template` contém tanto os artefatos de empacotamento NuGet quanto o conteúdo do projeto em `TemplateBase/`. Quando um novo repositório é criado via "Use this template", o workflow `setup-template.yml` (localizado na raiz `.github/workflows/`) é executado automaticamente no primeiro push e transforma a estrutura do template na estrutura final do projeto.

```mermaid
sequenceDiagram
    participant D as Desenvolvedor
    participant GH as GitHub
    participant WF as setup-template.yml

    D->>GH: Clica "Use this template"
    D->>GH: Nomeia o repositório (ex: api-template-base)
    GH->>GH: Copia toda a estrutura do lib-api-template
    GH->>WF: Dispara workflow no primeiro push (run_number == 1)
    WF->>WF: Remove artefatos NuGet (.csproj, nuget.config, README de instalação)
    WF->>WF: Achata TemplateBase/* para a raiz do repositório
    WF->>WF: Remove .template.config/ e todos os workflows
    WF->>WF: Remove prefixo api- e converte para PascalCase (TemplateBase)
    WF->>WF: Substitui TemplateBase pelo nome do projeto em todos os arquivos
    WF->>WF: Renomeia arquivos e pastas (.slnx, .csproj, etc.)
    WF->>GH: Commit automático com projeto pronto
    D->>GH: Clone e comece a desenvolver
```

### 11.2 O que o workflow faz automaticamente

| Etapa | Ação | Detalhe |
|:-----:|------|---------|
| 1 | **Limpeza de artefatos NuGet** | Remove `Funcef.Api.Template.csproj`, `nuget.config` e o `README.md` de instalação do template (que será substituído pelo README do projeto) |
| 2 | **Remoção dos workflows** | Remove `publish-package.yml`, `test-restore.yml`, `create-release.yml` e o próprio `setup-template.yml` |
| 3 | **Achatamento da estrutura** | Move todo o conteúdo de `TemplateBase/` para a raiz do repositório e remove a pasta `TemplateBase/` |
| 4 | **Remoção do `.template.config/`** | Remove a configuração do `dotnet new` (não é necessária no projeto gerado) |
| 5 | **Conversão do nome** | Remove o prefixo `api-` (se existir) e converte para PascalCase: `api-template-base` → `TemplateBase`, `api-cadastro` → `Cadastro`, `meu_projeto` → `MeuProjeto` |
| 6 | **Substituição de conteúdo** | `TemplateBase` → `NomeDoProjeto` em todos os arquivos texto (namespaces, referências, appsettings, etc.) |
| 7 | **Renomeação de arquivos** | `TemplateBase.slnx` → `NomeDoProjeto.slnx`, `TemplateBase.API.csproj` → `NomeDoProjeto.API.csproj`, etc. |
| 8 | **Renomeação de pastas** | `TemplateBase.API/` → `NomeDoProjeto.API/`, `TemplateBase.Domain/` → `NomeDoProjeto.Domain/`, etc. |

**Estrutura antes e depois:**

```
ANTES (copiado do template):              DEPOIS (após o workflow):
├── .github/workflows/                    ├── src/
│   ├── publish-package.yml               │   ├── TemplateBase.API/
│   ├── test-restore.yml                  │   ├── TemplateBase.Application/
│   ├── create-release.yml                │   ├── TemplateBase.Domain/
│   └── setup-template.yml                │   └── TemplateBase.Infrastructure/
├── TemplateBase/                         ├── tests/
│   ├── .template.config/                 ├── docs/
│   ├── src/                              ├── LICENSE.md
│   ├── tests/                            ├── README.md
│   └── TemplateBase.slnx                ├── Directory.Build.props
├── Funcef.Api.Template.csproj            └── TemplateBase.slnx
├── nuget.config
├── LICENSE.md
└── README.md
```

### 11.3 Convenção de nomenclatura do repositório

Ao criar um repositório via "Use this template", o nome é processado da seguinte forma:

1. **Remoção do prefixo `api-`** — Se o nome começar com `api-`, esse prefixo é removido
2. **Conversão para PascalCase** — O nome restante é convertido (hífens/underscores viram quebras de palavra, cada palavra inicia com maiúscula)

| Nome do repositório | Nome do projeto gerado |
|--------------------|------------------------|
| `api-template-base` | `TemplateBase` |
| `api-cadastro` | `Cadastro` |
| `api-gestao-investimentos` | `GestaoInvestimentos` |
| `meu-projeto` | `MeuProjeto` |
| `MinhaAPI` | `MinhaAPI` |

> **Dica:** Use `api-` no nome do repositório para indicar que é uma API, mas o projeto gerado terá um nome limpo (ex: `TemplateBase.slnx`, `TemplateBase.API`).

### 11.4 Pré-requisito no repositório

O repositório `lib-api-template` **deve** estar marcado como template no GitHub:

1. Acesse **Settings** do repositório `lib-api-template`
2. Em **General**, marque ✅ **Template repository**
3. O botão **"Use this template"** aparecerá na página principal

> **Obrigatório:** marcar o repositório como **Template repository** é essencial por dois motivos:
> 1. Habilita o botão "Use this template" para os desenvolvedores
> 2. Define `is_template = true`, que **impede** o `setup-template.yml` de executar no repositório fonte — ele só executa em repositórios criados a partir do template (onde `is_template = false`)
>
> O workflow `setup-template.yml` deve estar na raiz `.github/workflows/` (não dentro de `TemplateBase/`), pois o GitHub Actions só reconhece workflows nessa localização.

### 11.5 Coexistência com `dotnet new`

As duas abordagens coexistem no mesmo repositório sem conflitos:

| Aspecto | `dotnet new funcef-api` | GitHub Template |
|---------|------------------------|-----------------|
| **Mecanismo** | `template.json` + `sourceName` | `setup-template.yml` |
| **Onde roda** | Terminal local | GitHub Actions (cloud) |
| **Precisa instalar** | Sim (pacote NuGet) | Não |
| **Interface** | CLI | Botão no navegador |
| **Offline** | Sim | Não |
| **Achatamento** | Automático (o `dotnet new` usa `TemplateBase/` como raiz) | Via workflow (move `TemplateBase/*` para raiz) |
| **Resultado** | Idêntico | Idêntico |

**Arquivos exclusivos de cada abordagem:**

| Arquivo | Usado por | Ignorado por |
|---------|-----------|--------------|
| `TemplateBase/.template.config/template.json` | `dotnet new` | GitHub Template (removido pelo workflow) |
| `.github/workflows/setup-template.yml` | GitHub Template | `dotnet new` (excluído via `template.json`) |
| `Funcef.Api.Template.csproj` | `dotnet pack` (NuGet) | GitHub Template (removido pelo workflow) |
| `.github/workflows/publish-package.yml` | CI/CD do NuGet | GitHub Template (removido pelo workflow) |

---

<a id="11-troubleshooting"></a>

## ❓ 11. Troubleshooting

### O template não aparece no `dotnet new list`

```bash
# Verifique se foi instalado
dotnet new list funcef-api

# Reinstale
dotnet new uninstall funcef-api
dotnet new install funcef-api
```

### Erro "No templates found matching: 'funcef-api'"

O SDK .NET pode não ter detectado o template. Tente:

```bash
dotnet new search funcef-api
```

### Erro de NuGet restore nos pacotes FUNCEF

Os pacotes `FUNCEF.ORM`, `FUNCEF.Armazenamentos`, `FUNCEF.Autenticacao`, etc., estão no feed privado **GitHub Packages**. O projeto gerado já inclui um `nuget.config` apontando para o feed; a partir da **4.0.0** ele autentica via variável de ambiente **`FUNCEF_PACKAGES_TOKEN`** (PAT com escopo `read:packages`) — nome alinhado ao build secret que os reusable workflows de `funcef-devops/pipelines` injetam no Docker. Antes do `dotnet restore`, exporte o token:

```bash
export FUNCEF_PACKAGES_TOKEN=<seu_token>          # Linux/macOS
$env:FUNCEF_PACKAGES_TOKEN = "<seu_token>"        # Windows PowerShell
```

> O `nuget.config` do template faz `<clear />` nas fontes, então as credenciais do seu `NuGet.Config` de usuário **não** são herdadas — é por isso que a variável precisa estar definida mesmo em máquina já configurada. Se você usava `GITHUB_TOKEN` com a versão 3.x, defina também `FUNCEF_PACKAGES_TOKEN` (pode ser o mesmo PAT).

> As versões dos pacotes FUNCEF são centralizadas em `Directory.Packages.props` (Central Package Management) — os `.csproj` referenciam os pacotes **sem** atributo `Version`. Não adicione versões nos `.csproj`; ajuste-as no `Directory.Packages.props`.

### Erro NU1507 ("There are 2 package sources... map your package sources") ao criar pelo Visual Studio

Acontece quando o projeto é criado pela janela **"Novo Projeto"** do Visual Studio (em vez do `dotnet new` na CLI). O VS cria uma **solução "wrapper"** um nível **acima** do `nuget.config` gerado pelo template; a restauração por essa solução resolve a configuração a partir do diretório do wrapper e acaba usando o seu **`NuGet.Config` global** — que normalmente tem duas fontes (`nuget.org` e `FUNCEF-Componentes`) **sem `packageSourceMapping`**. Como o template usa Central Package Management, isso dispara o `NU1507` (promovido a erro pelo `TreatWarningsAsErrors`).

Soluções (qualquer uma resolve):

1. **Crie pela CLI** (recomendado) — não gera a solução wrapper:
   ```bash
   dotnet new funcef-api --name MeuProjeto
   ```
2. **Abra a solução interna** gerada pelo template (`MeuProjeto/MeuProjeto.slnx`), e não a wrapper que o VS criou um nível acima.
3. **Adicione o mapeamento** ao lado da solução wrapper (ou no seu `NuGet.Config` global), criando um `nuget.config` com:
   ```xml
   <configuration>
     <packageSourceMapping>
       <packageSource key="nuget.org"><package pattern="*" /></packageSource>
       <packageSource key="FUNCEF-Componentes"><package pattern="FUNCEF.*" /></packageSource>
     </packageSourceMapping>
   </configuration>
   ```

> O `nuget.config` **gerado dentro do projeto já traz esse mapeamento** — o erro só aparece quando a restauração ocorre a partir de um diretório acima dele.

### Erro ao conectar no Key Vault

Verifique se:

1. A URL do Key Vault está correta em `appsettings.Development.json`
2. Você está logado no Azure CLI (`az login`)
3. Sua conta tem a role **Key Vault Secrets User** no Key Vault

```bash
az login
az account show
```

### Projeto não compila após remover arquivos de exemplo

Verifique se:

1. Removeu as referências nos `using` de `AppDbContext.cs` (seção `── EXEMPLO ──`)
2. Removeu os registros de Services em `ServiceCollectionExtensions.cs` (seção `── EXEMPLO ──`)
3. Removeu os `DbSet<>` de `AppDbContext.cs`
4. Não ficaram referências órfãs a `Cliente`, `Ordem` ou seus Commands/Queries no código

```bash
dotnet build 2>&1 | Select-String "error CS"
```

---

<p align="center">
  <strong>FUNCEF</strong><br/>
  Template <code>funcef-api</code> v2.0.0
</p>
