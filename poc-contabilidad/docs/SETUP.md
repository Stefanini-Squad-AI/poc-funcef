# Guía de Setup — POC Contabilidad

Esta guía detalla los pasos para configurar el ambiente de desarrollo local para la POC de migración del módulo Contábil.

---

## 📋 Tabla de Contenidos

1. [Prerrequisitos](#prerrequisitos)
2. [Configuración Backend](#configuración-backend)
3. [Configuración Frontend](#configuración-frontend)
4. [Configuración Base de Datos](#configuración-base-de-datos)
5. [Configuración Azure](#configuración-azure)
6. [Verificación](#verificación)
7. [Troubleshooting](#troubleshooting)

---

## Prerrequisitos

### Software Requerido

| Herramienta | Versión | Download | Verificación |
|-------------|---------|----------|--------------|
| **.NET SDK** | 10.0.300+ | [dotnet.microsoft.com](https://dotnet.microsoft.com/download/dotnet/10.0) | `dotnet --version` |
| **Node.js** | ≥ 22 | [nodejs.org](https://nodejs.org/) | `node --version` |
| **pnpm** | 11.5.2+ | `npm install -g pnpm` | `pnpm --version` |
| **Git** | Última | [git-scm.com](https://git-scm.com/) | `git --version` |
| **Azure CLI** | Última | [docs.microsoft.com](https://docs.microsoft.com/cli/azure/install-azure-cli) | `az --version` |
| **Docker Desktop** | Última (opcional) | [docker.com](https://www.docker.com/products/docker-desktop) | `docker --version` |

### IDEs Recomendados

**Backend:**
- Visual Studio 2022+ (Windows/Mac)
- Visual Studio Code + C# Dev Kit
- Rider (JetBrains)

**Frontend:**
- Visual Studio Code + extensiones:
  - ESLint
  - Prettier
  - Tailwind CSS IntelliSense
  - TypeScript and JavaScript Language Features

---

## Configuración Backend

### 1. Clonar el Repositorio

```bash
cd /Users/santiagoguauque/Repo\ Stefanini/poc-funcef/poc-contabilidad/backend
```

### 2. Configurar GitHub Token

Los paquetes `FUNCEF.*` se distribuyen vía GitHub Packages y requieren autenticación.

```bash
# macOS/Linux
export GITHUB_TOKEN=<tu_personal_access_token>

# Windows PowerShell
$env:GITHUB_TOKEN = "<tu_personal_access_token>"
```

**Crear PAT:**
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token (classic)
3. Scopes: `read:packages`
4. Copiar el token

### 3. Restaurar Paquetes

```bash
dotnet restore
```

**Troubleshooting:**
- **Error 401:** Token inválido o sin scope `read:packages`
- **Error 404:** Package source mapping incorrecto en `nuget.config`

### 4. Configurar appsettings.Development.json

```bash
cd src/ContabPOC.API
cp appsettings.json appsettings.Development.json
```

Editar `appsettings.Development.json`:

```json
{
  "KeyVault": {
    "Url": "https://kv-contab-poc-dev-001.vault.azure.net/"
  },
  "ConnectionStrings": {
    "OracleConnection": "User Id=CONTAB_DEV;Password=***;Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XEPDB1)))"
  },
  "FuncefORM": {
    "Connection": {
      "Provider": "Oracle",
      "TimeoutInSeconds": 30
    }
  },
  "Auth": {
    "EntraId": {
      "Instance": "https://login.microsoftonline.com/",
      "CredentialType": "ManagedIdentity"
    }
  }
}
```

### 5. Ejecutar Migrations

```bash
# Verificar connection string
dotnet ef database update --project src/ContabPOC.Infrastructure --startup-project src/ContabPOC.API

# Si no existe el schema, crear primero:
# Ver scripts/banco-dados/01-create-schema.sql
```

### 6. Ejecutar API

```bash
dotnet run --project src/ContabPOC.API
```

API disponible en: `https://localhost:5001`
Swagger: `https://localhost:5001/swagger`

---

## Configuración Frontend

### 1. Navegar a la carpeta frontend

```bash
cd /Users/santiagoguauque/Repo\ Stefanini/poc-funcef/poc-contabilidad/frontend
```

### 2. Instalar Dependencias

```bash
pnpm install
```

**Nota:** Usar SOLO `pnpm`, nunca `npm` o `yarn`.

### 3. Configurar Variables de Ambiente

```bash
cp .env.example .env.local
```

Editar `.env.local`:

```bash
# API Backend
NEXT_PUBLIC_API_URL=https://localhost:5001

# Entra ID
NEXT_PUBLIC_ENTRA_TENANT_ID=<tenant_id>
NEXT_PUBLIC_ENTRA_CLIENT_ID=<client_id>

# Ambiente
NODE_ENV=development
```

### 4. Ejecutar Dev Server

```bash
pnpm dev
```

Aplicación disponible en: `http://localhost:3000`

### 5. Comandos de Verificación

```bash
# TypeScript check
pnpm typecheck

# Linting
pnpm lint

# Tests
pnpm test:run

# Build de producción (verifica que compila)
pnpm build
```

---

## Configuración Base de Datos

**📘 Documentación completa**: Ver [`/database/README.md`](../database/README.md)  
**📊 Análisis técnico**: Ver [`ANALISIS-BASE-DATOS-POC.md`](../../ANALISIS-BASE-DATOS-POC.md)

### Opción 1: Oracle XE 21c en Docker (Recomendado)

**Setup en 3 pasos**:

```bash
# 1. Login en Oracle Container Registry (primera vez solo)
docker login container-registry.oracle.com
# Username: tu-email@example.com (crear cuenta gratis en container-registry.oracle.com)
# Password: tu-password

# 2. Iniciar base de datos con Docker Compose
cd ../database
docker-compose up -d

# 3. Esperar inicialización (2-3 minutos)
docker logs -f funcef-oracle-xe
# Buscar: "DATABASE IS READY TO USE!"
```

**Lo que se crea automáticamente**:
- ✅ **Usuarios**: `CM` (aplicación) y `LOGPLANUS` (auditoría)
- ✅ **Tablas**: `PLANO`, `PLANOCONTA`, `CONTASXCC`, `LOG_PLANUS_PLANOCONTA`
- ✅ **Triggers**: Auditoría automática y validaciones de negocio
- ✅ **Datos de prueba**: 32 cuentas contables en 5 niveles jerárquicos
- ✅ **Sequences e índices**: Optimizados para performance

**Verificar instalación**:

```bash
# Conectar como usuario CM
docker exec -it funcef-oracle-xe sqlplus CM/cm_password@XEPDB1

SQL> SELECT COUNT(*) FROM PLANOCONTA;
-- Debe mostrar: 32

SQL> SELECT PLACONTA, PLANOME, PLATIPO FROM PLANOCONTA WHERE PLAGRAU=1 ORDER BY PLACONTA;
-- Debe mostrar: 1 ACTIVO, 2 PASIVO, 3 PATRIMONIO NETO, 4 INGRESOS, 5 GASTOS

SQL> EXIT
```

**Connection String**:
```json
{
  "ConnectionStrings": {
    "OracleDb": "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XEPDB1)));User Id=CM;Password=cm_password;Pooling=true;Min Pool Size=5;Max Pool Size=100;"
  }
}
```

**Accesos disponibles**:
- **Usuario aplicación**: `CM` / `cm_password`
- **Usuario auditoría**: `LOGPLANUS` / `log_password`
- **Administrador**: `sys` / `OraclePwd123` (as sysdba)
- **Enterprise Manager**: http://localhost:5500/em

**Comandos útiles**:

```bash
# Detener BD
docker-compose down

# Iniciar BD
docker-compose up -d

# Ver logs
docker logs -f funcef-oracle-xe

# Recrear desde cero (¡BORRA TODOS LOS DATOS!)
docker-compose down -v && docker-compose up -d

# Backup manual
docker exec funcef-oracle-xe expdp CM/cm_password@XEPDB1 \
  schemas=CM directory=DATA_PUMP_DIR dumpfile=cm_backup.dmp
```

### Opción 2: Oracle Local Instalado

Si ya tienes Oracle instalado localmente (23ai, 21c, 19c):

```bash
# Conectar como SYSDBA
sqlplus sys/password@localhost:1521/XEPDB1 as sysdba

# Ejecutar scripts en orden
@../database/init-scripts/01-create-users.sql
@../database/init-scripts/02-create-schema.sql
@../database/init-scripts/03-create-triggers.sql
@../database/init-scripts/04-seed-data.sql
```

### Estructura de Datos Creada

**Plan Contable**: 1 plan con 32 cuentas

```
1         ACTIVO
├── 1.1       ACTIVO CIRCULANTE
│   ├── 1.1.1     DISPONIBLE
│   │   ├── 1.1.1.01  CAJA GENERAL ✓ (analítica)
│   │   ├── 1.1.1.02  BANCO BRASIL C/C ✓
│   │   └── 1.1.1.03  BANCO CAIXA C/C ✓
│   └── 1.1.2     CRÉDITOS
│       ├── 1.1.2.01  CLIENTES POR COBRAR ✓
│       └── 1.1.2.02  ANTICIPOS ✓
2         PASIVO
└── 2.1       PASIVO CIRCULANTE
    └── 2.1.1     OBLIGACIONES
        ├── 2.1.1.01  PROVEEDORES ✓
        ├── 2.1.1.02  IMPUESTOS ✓
        └── 2.1.1.03  SALARIOS ✓
...
```

✓ = Cuenta analítica (permite lanzamientos)

---

## Configuración Azure

### 1. Azure Key Vault

#### Crear Key Vault (si no existe)

```bash
# Login
az login

# Crear resource group (si no existe)
az group create \
  --name rg-contab-poc-dev \
  --location brazilsouth

# Crear Key Vault
az keyvault create \
  --name kv-contab-poc-dev-001 \
  --resource-group rg-contab-poc-dev \
  --location brazilsouth \
  --enable-rbac-authorization true
```

#### Asignar Permisos

```bash
# Obtener tu Object ID
OBJECT_ID=$(az ad signed-in-user show --query id -o tsv)

# Asignar role "Key Vault Secrets User"
az role assignment create \
  --role "Key Vault Secrets User" \
  --assignee $OBJECT_ID \
  --scope /subscriptions/<subscription-id>/resourceGroups/rg-contab-poc-dev/providers/Microsoft.KeyVault/vaults/kv-contab-poc-dev-001
```

#### Crear Secrets

```bash
# Oracle connection string
az keyvault secret set \
  --vault-name kv-contab-poc-dev-001 \
  --name api-oracle-conn \
  --value "User Id=CONTAB_DEV;Password=DevPassword123;Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XEPDB1)))"

# Entra ID Tenant
az keyvault secret set \
  --vault-name kv-contab-poc-dev-001 \
  --name glb-entraid-tenantid \
  --value "<your-tenant-id>"

# Entra ID Client ID
az keyvault secret set \
  --vault-name kv-contab-poc-dev-001 \
  --name glb-entraid-clientid \
  --value "<your-client-id>"

# Entra ID Audience
az keyvault secret set \
  --vault-name kv-contab-poc-dev-001 \
  --name glb-entraid-audience \
  --value "api://<your-client-id>"

# Refresh Token Signing Key (genera un GUID)
az keyvault secret set \
  --vault-name kv-contab-poc-dev-001 \
  --name glb-auth-refresh-jwt \
  --value "$(uuidgen)$(uuidgen)" # 64+ caracteres
```

### 2. Azure Entra ID (App Registration)

#### Crear App Registration

1. Portal Azure → Azure Active Directory → App registrations → New registration
2. Name: `ContabPOC-API-Dev`
3. Supported account types: `Accounts in this organizational directory only`
4. Redirect URI: `Web` → `https://localhost:5001/signin-oidc`
5. Register

#### Configurar App Registration

```bash
# Exponer API
# Agregar scope: api://<client-id>/user_impersonation

# Configurar autenticación
# - ID tokens: ✓
# - Access tokens: ✓

# API permissions
# - Microsoft Graph → User.Read (delegated)
```

#### Obtener valores

```bash
# Copiar estos valores al Key Vault (paso anterior)
# - Application (client) ID
# - Directory (tenant) ID
```

---

## Verificación

### Health Checks

#### Backend

```bash
# Live
curl -k https://localhost:5001/health/live

# Ready (verifica DB, Redis, etc)
curl -k https://localhost:5001/health/ready

# Version
curl -k https://localhost:5001/health/version
```

**Respuesta esperada (ready):**
```json
{
  "status": "Healthy",
  "totalDuration": "00:00:00.123",
  "entries": {
    "Oracle": {
      "status": "Healthy"
    }
  }
}
```

#### Frontend

```bash
# Abrir browser
open http://localhost:3000

# Verificar console (F12) - no debe haber errores
```

### Tests

#### Backend

```bash
cd backend
dotnet test
```

**Esperado:** Todos los tests pasan (verde)

#### Frontend

```bash
cd frontend
pnpm test:run
```

**Esperado:** Todos los tests pasan

### Build

#### Backend

```bash
cd backend
dotnet build --configuration Release
```

#### Frontend

```bash
cd frontend
pnpm build
```

**Esperado:** Build exitoso sin errores

---

## Troubleshooting

### Backend

#### Error: "Unable to resolve service for type 'IMediator'"

**Causa:** Falta registrar Mediator en DI

**Solución:**
```csharp
// Application/DependencyInjection.cs
services.AddMediatR(cfg => cfg.RegisterServicesFromAssembly(typeof(DependencyInjection).Assembly));
```

#### Error: "ORA-12154: TNS:could not resolve the connect identifier"

**Causa:** Connection string incorrecta

**Solución:**
- Verificar que Oracle está corriendo: `docker ps | grep oracle`
- Verificar puerto: `lsof -i :1521`
- Revisar connection string en `appsettings.Development.json`

#### Error: 401 en GitHub Packages

**Causa:** `GITHUB_TOKEN` inválido o sin scope

**Solución:**
```bash
# Verificar token
echo $GITHUB_TOKEN

# Regenerar token con scope read:packages
# GitHub → Settings → Developer settings → Personal access tokens
```

### Frontend

#### Error: "Module not found: Can't resolve '@/...'

**Causa:** Imports absolutos no configurados

**Solución:** Verificar `tsconfig.json`:
```json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

#### Error: "boundaries/element-types"

**Causa:** Import prohibido entre capas

**Solución:**
- Revisar regla en `.eslintrc.json`
- NO importar de `features/` a otras `features/`
- Promover código común a `shared/` o `core/`

#### Error: Next.js no compila (port 3000 en uso)

**Causa:** Puerto ocupado

**Solución:**
```bash
# Matar proceso
lsof -ti :3000 | xargs kill -9

# O usar otro puerto
pnpm dev -- -p 3001
```

### Azure

#### Error: "The user, group or application does not have secrets get permission"

**Causa:** Falta role assignment en Key Vault

**Solución:**
```bash
# Re-ejecutar role assignment
az role assignment create \
  --role "Key Vault Secrets User" \
  --assignee $(az ad signed-in-user show --query id -o tsv) \
  --scope <key-vault-resource-id>

# Verificar
az role assignment list --scope <key-vault-resource-id>
```

#### Error: "AADSTS700016: Application not found in the directory"

**Causa:** Client ID incorrecto en configuración

**Solución:**
- Verificar Client ID en App Registration
- Actualizar secret `glb-entraid-clientid` en Key Vault
- Reiniciar API

---

## Próximos Pasos

Una vez completado el setup:

1. ✅ Todos los health checks pasan
2. ✅ Tests backend/frontend pasan
3. ✅ Swagger accesible en `https://localhost:5001/swagger`
4. ✅ Frontend carga en `http://localhost:3000`

**Continuar con:**
- [DEVELOPMENT.md](./DEVELOPMENT.md) — Guía de desarrollo
- [ARCHITECTURE.md](./ARCHITECTURE.md) — Decisiones de arquitectura
- [API.md](./API.md) — Documentación de endpoints

---

## Contacto

**Dudas sobre el setup:**
- Líder Técnico: Santiago Guauque
- Repositorio: `poc-funcef`
- Documentación: `/poc-contabilidad/docs/`

---

**Última actualización:** 2026-09-07
