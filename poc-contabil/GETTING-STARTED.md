# Getting Started — POC Contabilidad

Guía rápida para comenzar a trabajar en el proyecto POC de migración del módulo Contábil.

---

## ✅ Proyecto Configurado

El proyecto está completamente estructurado y listo para desarrollo:

### ✅ Backend (.NET 10)
- Clean Architecture con 4 capas (API, Application, Domain, Infrastructure)
- CQRS/Mediator configurado
- Entidad `ContaContabil` con enums definidos
- EF Core + Oracle configurado
- Commands/Queries de ejemplo

### ✅ Frontend (Next.js 16 + React 19)
- Arquitectura de 4 capas (app, features, core, shared)
- Feature `contas-contabeis` con API client y hooks
- React Query configurado
- Página de ejemplo funcionando
- ESLint con boundaries enforced

### ✅ Documentación
- README principal del proyecto
- README específico de backend
- README específico de frontend
- Guía completa de SETUP
- 2 Skills de Kiro (backend y frontend)

---

## 🚀 Comenzar a Desarrollar

### 1. Backend

```bash
cd backend

# Configurar GitHub Token
export GITHUB_TOKEN=<tu_token>

# Restaurar paquetes
dotnet restore

# Configurar connection string en appsettings.Development.json
# Ver backend/README.md

# Ejecutar
dotnet run --project src/ContabPOC.API
```

**API:** `https://localhost:5001`  
**Swagger:** `https://localhost:5001/swagger`

### 2. Frontend

```bash
cd frontend

# Instalar dependencias
pnpm install

# Configurar .env.local
cp .env.example .env.local
# Editar NEXT_PUBLIC_API_URL=https://localhost:5001

# Ejecutar
pnpm dev
```

**App:** `http://localhost:3000`

---

## 📁 Estructura Creada

```
poc-contabilidad/
├── README.md                      ✅ Visión general del proyecto
├── GETTING-STARTED.md            ✅ Esta guía
│
├── backend/                       ✅ API .NET 10
│   ├── src/
│   │   ├── ContabPOC.API/        ✅ Controllers, Program.cs
│   │   ├── ContabPOC.Application/✅ CQRS Commands/Queries
│   │   ├── ContabPOC.Domain/     ✅ Entidades y Enums
│   │   └── ContabPOC.Infrastructure/✅ DbContext, EF Core
│   ├── tests/                    ✅ Project de tests
│   ├── scripts/                  ✅ Scripts SQL
│   ├── nuget.config             ✅ GitHub Packages feed
│   ├── Directory.Packages.props  ✅ FUNCEF packages 3.0.x
│   └── README.md                 ✅ Documentación backend
│
├── frontend/                      ✅ Next.js 16 + React 19
│   ├── src/
│   │   ├── app/                  ✅ Rutas Next.js
│   │   ├── features/             ✅ contas-contabeis/
│   │   ├── core/                 ✅ api/, providers/
│   │   └── shared/               ✅ lib/, config/
│   ├── package.json              ✅ FUNCEF components
│   ├── tsconfig.json             ✅ TypeScript config
│   ├── .eslintrc.json            ✅ Boundaries enforced
│   └── README.md                 ✅ Documentación frontend
│
└── docs/
    └── SETUP.md                   ✅ Guía completa de setup
```

---

## 🎯 Próximos Pasos

### Backend

1. **Implementar Handlers**
   - `CreateContaContabilHandler`
   - `GetContaContabilTreeHandler`
   - `UpdateContaContabilHandler`
   - `DeleteContaContabilHandler`

2. **Implementar Services**
   - `IContaContabilService` interface
   - `ContaContabilService` implementation
   - Reglas de negocio (RN006, RN021)

3. **Migrations**
   ```bash
   dotnet ef migrations add InitialCreate --project src/ContabPOC.Infrastructure
   dotnet ef database update --project src/ContabPOC.Infrastructure
   ```

4. **Tests**
   - Tests unitarios de Handlers
   - Tests de Services
   - Tests de integración

### Frontend

1. **Componentes UI**
   - `ContasTree` (árbol jerárquico)
   - `ContaForm` (crear/editar conta)
   - `ContaCard` (detalle de conta)

2. **Hooks adicionales**
   - `useCreateConta`
   - `useUpdateConta`
   - `useDeleteConta`

3. **Validación**
   - Schemas Zod en `validators.ts`
   - Integración con React Hook Form

4. **Tests**
   - Tests de hooks con MSW
   - Tests de componentes

---

## 📚 Referencias Principales

| Documento | Ubicación | Para qué |
|-----------|-----------|----------|
| **Análisis POC** | `docs/POC-ANALISIS-RECOMENDACION.md` | Justificación técnica |
| **Skill Backend** | `.kiro/skills/backend-funcef-clean-architecture.md` | Patrones .NET |
| **Skill Frontend** | `.kiro/skills/frontend-funcef-4-layers.md` | Patrones React |
| **Setup** | `docs/SETUP.md` | Configuración ambiente |
| **Template Backend** | `Funcef-kit/templates/api-template-base/` | Referencia .NET |
| **Template Frontend** | `Funcef-kit/templates/web-template/` | Referencia React |
| **Manual Arquitectura** | `Funcef-kit/MANUAL-ARQUITETURA/` | Playbooks |

---

## 🛠️ Comandos Útiles

### Backend

```bash
# Build
dotnet build

# Tests
dotnet test

# Migrations
dotnet ef migrations add <Nome>
dotnet ef database update
```

### Frontend

```bash
# Desarrollo
pnpm dev

# Verificación completa (antes de commit)
pnpm typecheck && pnpm lint && pnpm test:run

# Build
pnpm build
```

---

## ⚠️ Notas Importantes

### Antes de comenzar desarrollo

1. **Reunión funcional con FUNCEF** (recomendada)
   - Demo de la pantalla Delphi `FCadContasContabMT`
   - Aclaración de reglas de negocio (RN006, RN021)
   - Flujos no evidentes en el código

2. **Configurar Azure**
   - Key Vault con secrets
   - App Registration Entra ID
   - Roles asignados

3. **Oracle disponible**
   - Container local o instancia remota
   - Schema `CONTAB_DEV` creado
   - Connection string configurada

### Durante desarrollo

- ✅ Seguir los skills de Kiro para mantener consistencia
- ✅ Respetar boundaries entre capas (frontend)
- ✅ Seguir convenciones de nomenclatura
- ✅ Código en inglés, UI en portugués
- ✅ Tests para toda funcionalidad nueva

---

## 🎓 Aprendizaje

### Para entender el backend

1. Leer skill: `.kiro/skills/backend-funcef-clean-architecture.md`
2. Explorar template: `Funcef-kit/templates/api-template-base/`
3. Revisar ejemplo de Command/Query ya creado

### Para entender el frontend

1. Leer skill: `.kiro/skills/frontend-funcef-4-layers.md`
2. Explorar template: `Funcef-kit/templates/web-template/`
3. Revisar feature `contas-contabeis` ya creada

---

## ✉️ Contacto

**Líder Técnico:** Santiago Guauque  
**Cliente:** FUNCEF  
**Empresa:** Stefanini  

---

**¡El proyecto está listo para comenzar! 🚀**
