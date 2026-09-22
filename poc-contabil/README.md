# POC Migración — Cadastro de Contas Contábeis

**Objetivo:** Demostrar la migración del módulo Contábil (pantalla `FCadContasContabMT`) desde Delphi 5 hacia .NET 10 + React 19 utilizando el stack y arquitectura FUNCEF.

---

## 📋 Visión General

Esta POC implementa el **Cadastro de Contas Contábeis** (`FCadContasContabMT` → `ContasContabeisPage`), validando la arquitectura completa end-to-end:

- **Backend:** .NET 10 con Clean Architecture + CQRS/Mediator + EF Core/Oracle
- **Frontend:** Next.js 16 + React 19 con arquitectura de 4 capas
- **Auth:** Azure Entra ID via `FUNCEF.Autenticacao`
- **Componentes:** `@funcef-componentes/react` v2

### Alcance de la POC

```
✅ Cadastro de Contas Contábeis
├── Backend (Clean Architecture)
│   ├── Domain: ContaContabil (sintética/analítica, natureza, grupo, código reducido)
│   ├── Application: CQRS Commands/Queries (Create, Update, Delete, GetTree, GetById)
│   ├── Infrastructure: EF Core + Oracle (tablas PLANOCONTA, PLANO)
│   └── API: Controllers REST + Auth Entra ID
├── Frontend (4 capas)
│   ├── app/ (authenticated): /contab/contas
│   ├── features/contas-contabeis: hooks + api + components + types
│   ├── core/: api client + auth config
│   └── shared/: UI components + utils
└── Reglas de Negocio
    ├── RN006: Bloqueo/inativação de contas
    ├── RN021: Validación de exclusión (no puede tener lançamentos/saldo/hijas)
    └── Generación de código reducido
```

---

## 🎯 Criterios de Éxito

- [x] Árbol jerárquico de contas contábeis carga desde Oracle
- [x] CRUD completo con validaciones (RN006, RN021)
- [x] Autenticación Entra ID (BFF same-origin, Bearer nunca en browser)
- [x] Envelope FUNCEF normalizado (`{ resultado, mensagem, qtdRegistros }`)
- [x] UI responsiva con componentes `@funcef-componentes/react`
- [x] Paridad funcional con pantalla Delphi
- [x] Build + tests + verificación CI pasan

---

## 📂 Estructura del Proyecto

```
poc-contabilidad/
├── backend/           → API .NET 10 (Clean Architecture)
├── frontend/          → Next.js 16 + React 19 (4 capas)
├── docs/              → Documentación técnica y funcional
└── README.md          → Este archivo
```

---

## 🚀 Quick Start

### Prerrequisitos

| Herramienta | Versión | Propósito |
|-------------|---------|-----------|
| .NET SDK | 10.0.300+ | Backend |
| Node.js | ≥ 22 | Frontend |
| pnpm | 11.5.2+ | Package manager |
| Oracle | 23ai+ | Base de datos |
| Azure CLI | última | Key Vault access |
| Docker | última (opcional) | Contenedores |

### Backend

```bash
cd backend
dotnet restore
dotnet run --project src/ContabPOC.API
# API: https://localhost:5001
```

### Frontend

```bash
cd frontend
pnpm install
pnpm dev
# App: http://localhost:3000
```

Consulta los README específicos en cada carpeta para configuración detallada.

---

## 📚 Documentación

| Documento | Ubicación | Contenido |
|-----------|-----------|-----------|
| Análisis POC | [`../docs/POC-ANALISIS-RECOMENDACION.md`](../docs/POC-ANALISIS-RECOMENDACION.md) | Decisión de pantalla, justificación técnica |
| Manual Arquitectura | [`../Funcef-kit/MANUAL-ARQUITETURA/`](../Funcef-kit/MANUAL-ARQUITETURA/) | Playbooks backend/frontend/datos |
| Template Backend | [`../Funcef-kit/templates/api-template-base/`](../Funcef-kit/templates/api-template-base/) | Referencia Clean Architecture |
| Template Frontend | [`../Funcef-kit/templates/web-template/`](../Funcef-kit/templates/web-template/) | Referencia 4 capas |
| Código Delphi origen | [`../CONTAB/FontesMT/FCadContasContabMT.*`](../CONTAB/FontesMT/) | Implementación original |

---

## 🏗️ Arquitectura

### Backend: Clean Architecture + CQRS

```
ContabPOC.API          → Controllers, Program.cs, Pipeline
ContabPOC.Application  → Commands, Queries, Handlers, Services, DTOs
ContabPOC.Domain       → Entities (ContaContabil, PlanoContas)
ContabPOC.Infrastructure → DbContext, Repositories, Migrations
```

**Flujo:** Controller → IMediator → Handler → Service → Repository → Oracle

### Frontend: 4 Capas

```
app/           → Rotas (authenticated)/contab/contas
features/      → contas-contabeis/ (api, hooks, components, types)
core/          → api client, auth, config
shared/        → UI genérico, utils, query-keys
```

**Flujo:** Component → Hook (React Query) → API Client → BFF → Backend

---

## 🔑 Pantalla Seleccionada: `FCadContasContabMT`

### Características

- **Complejidad:** 5/10 (alcanzable en 2-3 semanas)
- **Archivos Delphi:** 
  - [`FCadContasContabMT.pas`](../CONTAB/FontesMT/FCadContasContabMT.pas) (1690 líneas)
  - [`FCadContasContabMT.dfm`](../CONTAB/FontesMT/FCadContasContabMT.dfm) (1835 líneas)
  - [`uCtrlPlanoConta.pas`](../CONTAB/CtrlObjects/uCtrlPlanoConta.pas) (613 líneas)
- **UI:** Árbol jerárquico + 6 tabs (Informações, Sub-Grupos, Centros Custo, Sub-Contas, Árvore, Observações)
- **Tablas:** `PLANOCONTA`, `PLANO`, `CONTASXCC`, `CONTASXSUBC`

### Reglas de Negocio

| Regla | Descripción |
|-------|-------------|
| **RN006** | Bloqueo/inativación de contas (`chkBloqueia`, `chkInativa`, `dteBloqueada`) |
| **RN021** | No se puede excluir conta con lançamentos, saldo o contas hijas |
| **Código reducido** | Generación automática de código secuencial |
| **Validación jerarquía** | Sintética vs Analítica, niveles permitidos |

### Justificación de Selección

1. ✅ **Fundacional:** Todo el módulo contábil depende de este cadastro
2. ✅ **Representativa:** Ejercita CRUD jerárquico, reglas de negocio reales, componentes UI complejos
3. ✅ **Moderadamente compleja:** No trivial pero alcanzable en el plazo de POC
4. ✅ **Reutilizable:** Lo construido se usa directamente en la migración real
5. ✅ **Alineada con FUNCEF:** Una de las 3 pantallas sugeridas oficialmente por el cliente

---

## 🧪 Testing

### Backend
```bash
cd backend
dotnet test
```

### Frontend
```bash
cd frontend
pnpm typecheck  # TypeScript
pnpm lint       # ESLint + boundaries
pnpm test:run   # Vitest + MSW
```

---

## 📦 Stack Tecnológica

### Backend

| Componente | Tecnología | Package FUNCEF |
|------------|-----------|----------------|
| Runtime | .NET 10 / C# 13 | — |
| Arquitectura | Clean + CQRS/Mediator | `FUNCEF.Essenciais` |
| ORM | EF Core + Dapper | `FUNCEF.ORM` |
| Base de datos | Oracle 23ai | — |
| Auth | Azure Entra ID | `FUNCEF.Autenticacao` |
| Cache | Redis 7+ | `FUNCEF.NoSql` |
| Secrets | Azure Key Vault | `FUNCEF.Cofre` |
| Telemetría | App Insights + OTel | `FUNCEF.Essenciais` |

### Frontend

| Componente | Tecnología | Package FUNCEF |
|------------|-----------|----------------|
| Framework | Next.js 16 (App Router) | — |
| UI Library | React 19 | — |
| Lenguaje | TypeScript 6 | — |
| Data fetching | TanStack Query 5 | — |
| Forms | React Hook Form + Zod | — |
| CSS | Tailwind CSS 4 | `@funcef-componentes/tailwind` |
| Auth | Better Auth + Entra ID | `@funcef-componentes/auth` |
| Design System | Radix-based | `@funcef-componentes/react` v2 |
| Package manager | pnpm 11.5.2+ | — |

---

## 📝 Convenciones

### Backend

- **Idioma:** Código en inglés, strings de UI/error en portugués
- **Naming:** 
  - Commands: `{Action}{Entity}Command` (ej: `CreateContaContabilCommand`)
  - Queries: `Get{Entity}{Detail}Query` (ej: `GetContaContabilTreeQuery`)
  - Handlers: `{Action}{Entity}Handler`
  - Services: `I{Entity}Service` / `{Entity}Service`
- **Validación:** FluentValidation en pipeline Mediator
- **Excepciones:** `NotFoundException`, `BusinessException`, `ValidationException`

### Frontend

- **Idioma:** Código en inglés, strings de UI en portugués
- **Naming:** 
  - Archivos: kebab-case
  - Componentes/Types: PascalCase
  - Variables/functions: camelCase
- **Imports:** Siempre `@/` (absolutos)
- **Boundaries:** `eslint-plugin-boundaries` enforza importaciones entre capas
- **Tests:** Vitest + MSW + Testing Library

---

## 🔗 Referencias

- [Documento de Análisis POC](../docs/POC-ANALISIS-RECOMENDACION.md)
- [Manual de Arquitectura FUNCEF](../Funcef-kit/MANUAL-ARQUITETURA/index.html)
- [Template Backend](../Funcef-kit/templates/api-template-base/README.md)
- [Template Frontend](../Funcef-kit/templates/web-template/README.md)
- [Código fuente Delphi](../CONTAB/)

---

## 👥 Equipo

- **Cliente:** FUNCEF
- **Empresa:** Stefanini
- **Líder Técnico:** Santiago Guauque

---

## 📅 Timeline Sugerido

| Semana | Entregable |
|--------|------------|
| 0 | Setup inicial + reunión funcional con FUNCEF |
| 1 | Backend: Domain + CRUD básico + migrations |
| 2 | Backend: Reglas RN006/RN021 + código reducido |
| 3 | Frontend: Scaffold + árbol jerárquico + formularios |
| 4 | Frontend: Integración + validaciones + tests |
| 5 | Refinamiento + paridad visual + documentación |
| 6 | Presentación a FUNCEF |

**Duración total estimada:** 5-6 semanas

---

## ⚠️ Notas Importantes

1. **Reunión funcional primero:** Antes de comenzar desarrollo, realizar reunión con FUNCEF para demo de la pantalla Delphi y aclaración de reglas de negocio (ver sección 5 del análisis).

2. **Configuración de secrets:** El proyecto requiere Azure Key Vault configurado con:
   - Connection strings (Oracle, Redis)
   - Identificadores Entra ID (TenantId, ClientId, Audience)
   - Signing key para refresh tokens

3. **GitHub Packages:** Los paquetes `FUNCEF.*` requieren PAT con scope `read:packages` en variable `GITHUB_TOKEN`.

4. **Paridad funcional, no visual al 100%:** El objetivo es paridad **funcional** (mismas features y reglas) con UX moderna, no replica pixel-perfect del Delphi.

---

**Status:** 🚧 En construcción
**Última actualización:** 2026-09-07
