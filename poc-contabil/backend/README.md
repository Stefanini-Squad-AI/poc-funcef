# Backend — ContabPOC API

API .NET 10 siguiendo Clean Architecture + CQRS/Mediator para el módulo de Cadastro de Contas Contábeis.

---

## 🏗️ Arquitectura

```
ContabPOC.API          → Controllers, Program.cs, appsettings
ContabPOC.Application  → Commands, Queries, Handlers, Services, DTOs, Validators
ContabPOC.Domain       → Entities (ContaContabil), Enums
ContabPOC.Infrastructure → DbContext, Configurations, Migrations
ContabPOC.Tests        → Tests unitarios e integración
```

**Flujo:** Controller → IMediator → Handler → Service → Repository → Oracle

---

## 🚀 Quick Start

### 1. Prerrequisitos

- .NET SDK 10.0.300+
- Oracle 23ai (local o container)
- GitHub PAT con scope `read:packages`

### 2. Configurar Token de GitHub

```bash
export GITHUB_TOKEN=<tu_token>  # macOS/Linux
# o
$env:GITHUB_TOKEN = "<tu_token>"  # Windows PowerShell
```

### 3. Restaurar Paquetes

```bash
dotnet restore
```

### 4. Configurar Connection String

Crear `src/ContabPOC.API/appsettings.Development.json`:

```json
{
  "ConnectionStrings": {
    "OracleConnection": "User Id=CONTAB_DEV;Password=DevPassword123;Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XEPDB1)))"
  }
}
```

### 5. Ejecutar Migrations

```bash
dotnet ef database update --project src/ContabPOC.Infrastructure --startup-project src/ContabPOC.API
```

### 6. Ejecutar API

```bash
dotnet run --project src/ContabPOC.API
```

API disponible en: `https://localhost:5001`  
Swagger: `https://localhost:5001/swagger`

---

## 📦 Paquetes FUNCEF

| Package | Versión | Uso |
|---------|---------|-----|
| `FUNCEF.Essenciais` | 3.0.x | CQRS, Mediator, Validation, Exceptions |
| `FUNCEF.ORM` | 3.0.x | EF Core, Repository, UnitOfWork, Audit |
| `FUNCEF.Autenticacao` | 3.0.x | Entra ID, OAuth2, M2M |
| `FUNCEF.Cofre` | 3.0.x | Azure Key Vault |
| `FUNCEF.NoSql` | 3.0.x | Redis, MongoDB |

---

## 🗂️ Estructura de Carpetas

```
backend/
├── src/
│   ├── ContabPOC.API/
│   │   ├── Controllers/
│   │   │   └── ContasContabeisController.cs
│   │   ├── Program.cs
│   │   ├── appsettings.json
│   │   └── ContabPOC.API.csproj
│   │
│   ├── ContabPOC.Application/
│   │   ├── Commands/
│   │   │   └── ContaContabil/
│   │   │       └── Create/
│   │   │           ├── CreateContaContabilCommand.cs
│   │   │           ├── CreateContaContabilHandler.cs
│   │   │           └── CreateContaContabilValidator.cs
│   │   ├── Queries/
│   │   │   └── ContaContabil/
│   │   │       └── GetTree/
│   │   │           ├── GetContaContabilTreeQuery.cs
│   │   │           └── GetContaContabilTreeHandler.cs
│   │   ├── DTOs/
│   │   │   └── ContaContabilDto/
│   │   │       ├── ContaContabilRequest.cs
│   │   │       └── ContaContabilResponse.cs
│   │   ├── Services/
│   │   ├── DependencyInjection.cs
│   │   └── ContabPOC.Application.csproj
│   │
│   ├── ContabPOC.Domain/
│   │   ├── Entities/
│   │   │   └── ContaContabil.cs
│   │   ├── Enums/
│   │   │   ├── TipoContaEnum.cs
│   │   │   ├── GrupoContaEnum.cs
│   │   │   └── NaturezaContaEnum.cs
│   │   └── ContabPOC.Domain.csproj
│   │
│   └── ContabPOC.Infrastructure/
│       ├── Persistence/
│       │   ├── Context/
│       │   │   └── AppDbContext.cs
│       │   └── Configuration/
│       │       └── ContaContabilConfiguration.cs
│       ├── DependencyInjection.cs
│       └── ContabPOC.Infrastructure.csproj
│
├── tests/
│   └── ContabPOC.Tests/
│       └── ContabPOC.Tests.csproj
│
├── scripts/
│   └── banco-dados/
│       ├── 01-create-schema.sql
│       ├── 02-create-tables.sql
│       └── 03-seed-data.sql
│
├── nuget.config
├── Directory.Build.props
├── Directory.Packages.props
├── global.json
├── .gitignore
└── README.md
```

---

## 🧪 Tests

```bash
dotnet test
```

---

## 🔧 Comandos Útiles

### Build

```bash
dotnet build
```

### Clean

```bash
dotnet clean
```

### Migrations

```bash
# Crear migration
dotnet ef migrations add NomeMigration --project src/ContabPOC.Infrastructure --startup-project src/ContabPOC.API

# Aplicar migrations
dotnet ef database update --project src/ContabPOC.Infrastructure --startup-project src/ContabPOC.API

# Remover última migration
dotnet ef migrations remove --project src/ContabPOC.Infrastructure --startup-project src/ContabPOC.API
```

### Verificar Paquetes

```bash
dotnet list package
dotnet list package --outdated
```

---

## 📚 Convenciones

### Nomenclatura

- **Commands:** `{Action}{Entity}Command` (ej: `CreateContaContabilCommand`)
- **Queries:** `Get{Entity}{Detail}Query` (ej: `GetContaContabilTreeQuery`)
- **Handlers:** `{Action}{Entity}Handler` / `Get{Entity}{Detail}Handler`
- **Validators:** `{Action}{Entity}Validator`
- **Services:** `I{Entity}Service` / `{Entity}Service`

### Idioma

- **Código:** Inglés (variables, métodos, clases)
- **UI/Mensajes:** Portugués (mensajes de error, logs)
- **Comentarios:** Inglés

---

## 📖 Referencias

- [Skill Backend FUNCEF](../../.kiro/skills/backend-funcef-clean-architecture.md)
- [Template Base FUNCEF](../../Funcef-kit/templates/api-template-base/)
- [Documentación Setup](../docs/SETUP.md)

---

**Status:** ✅ Scaffold completo  
**Próximo paso:** Implementar Handlers y Services
