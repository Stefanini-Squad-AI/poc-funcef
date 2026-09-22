# Frontend — ContabPOC

Aplicación Next.js 16 + React 19 siguiendo la arquitectura de 4 capas FUNCEF para el módulo de Cadastro de Contas Contábeis.

---

## 🏗️ Arquitectura de 4 Capas

```
app/        → Rotas y orquestación (decide QUÉ mostrar)
features/   → Dominio de negocio (decide CÓMO funciona)
core/       → Infra cross-cutting (api, auth, config)
shared/     → Base genérica (UI, utils, tipos)
```

**Reglas de importación:** Enforced por `eslint-plugin-boundaries`

```
app/     → puede importar de features/, core/, shared/
features/ → puede importar de core/, shared/ (NUNCA de otras features/)
core/    → puede importar de shared/
shared/  → NO puede importar de nadie
```

---

## 🚀 Quick Start

### 1. Prerrequisitos

- Node.js ≥ 22
- pnpm ≥ 11.5.2

### 2. Instalar Dependencias

```bash
pnpm install
```

### 3. Configurar Variables de Ambiente

```bash
cp .env.example .env.local
```

Editar `.env.local`:

```bash
NEXT_PUBLIC_API_URL=https://localhost:5001
```

### 4. Ejecutar Dev Server

```bash
pnpm dev
```

App disponible en: `http://localhost:3000`

---

## 📦 Scripts

```bash
pnpm dev           # Servidor de desarrollo
pnpm build         # Build de producción
pnpm start         # Ejecutar build de producción
pnpm lint          # ESLint
pnpm typecheck     # TypeScript check
pnpm format        # Prettier
pnpm test          # Tests en modo watch
pnpm test:run      # Tests una vez (CI)
```

---

## 🗂️ Estructura de Carpetas

```
frontend/
├── src/
│   ├── app/                           → Next.js App Router
│   │   ├── (authenticated)/          → Grupo de rutas autenticadas
│   │   │   └── contab/contas/
│   │   │       └── page.tsx          → Página de Contas Contábeis
│   │   ├── layout.tsx                → Root layout
│   │   ├── page.tsx                  → Homepage
│   │   └── globals.css
│   │
│   ├── features/                      → Dominio de negocio
│   │   └── contas-contabeis/
│   │       ├── api/
│   │       │   ├── endpoints.ts      → URL builders
│   │       │   ├── client.ts         → HTTP calls
│   │       │   └── index.ts
│   │       ├── hooks/
│   │       │   ├── use-contas-tree.ts
│   │       │   └── index.ts
│   │       ├── components/
│   │       ├── types.ts
│   │       └── index.ts
│   │
│   ├── core/                          → Infra cross-cutting
│   │   ├── api/
│   │   │   ├── instance.ts           → API client
│   │   │   ├── types.ts
│   │   │   └── index.ts
│   │   └── providers/
│   │       └── query-client-provider.tsx
│   │
│   └── shared/                        → Base genérica
│       ├── components/ui/
│       ├── config/
│       │   └── env-client.ts
│       ├── lib/
│       │   └── query-keys.ts
│       ├── types/
│       └── utils/
│
├── __tests__/
│   ├── msw/                          → Mock Service Worker
│   ├── utils/                        → Test utilities
│   └── setup.ts
│
├── package.json
├── tsconfig.json
├── next.config.ts
├── tailwind.config.ts
├── vitest.config.ts
├── .eslintrc.json
└── README.md
```

---

## 🧪 Testing

### Ejecutar Tests

```bash
pnpm test:run
```

### Estructura de Tests

- **Vitest** + **@testing-library/react** + **MSW**
- Mocks en `__tests__/msw/handlers.ts`
- Utilities en `__tests__/utils/`

---

## 📚 Convenciones

### Nomenclatura

| Elemento | Convención | Ejemplo |
|----------|------------|---------|
| Archivo | kebab-case | `use-contas-tree.ts` |
| Componente | PascalCase | `ContasList` |
| Hook | camelCase con `use` | `useContasTree` |
| Tipo/Interface | PascalCase | `ContaContabil` |

### Idioma

| Contexto | Idioma | Ejemplo |
|----------|--------|---------|
| **Código** | INGLÉS | `const dueDate` |
| **UI** | PORTUGUÉS | `"Conta criada com sucesso"` |
| **Comentarios** | INGLÉS | `// Fetch tree from API` |

### Imports

✅ **Siempre usar imports absolutos con `@/`**

```typescript
import { useContasTree } from '@/features/contas-contabeis'
import { api } from '@/core/api'
```

❌ **Nunca usar imports relativos**

```typescript
import { useContasTree } from '../../../features/contas-contabeis'
```

---

## 🔑 Contrato de una Feature

Toda feature sigue esta estructura:

```
features/<dominio>/
├── api/
│   ├── endpoints.ts   # URL builders puros
│   ├── client.ts      # Llamadas HTTP via api<T>
│   └── index.ts
├── hooks/             # React Query (useQuery / useMutation)
├── components/        # UI del domínio
├── types.ts           # DTOs y tipos
├── validators.ts      # Zod schemas (si hay forms)
└── index.ts           # Barrel export
```

**Flujo:** `components → hooks → api → types`

---

## 🚫 Anti-Patterns (NO hacer)

### ❌ Importar entre features

```typescript
// ❌ MAL
import { useUsers } from '@/features/users' // desde features/contas/
```

### ❌ HTTP client ad-hoc

```typescript
// ❌ MAL
import axios from 'axios'
const data = await axios.get('/contas')

// ✅ BIEN
import { api } from '@/core/api'
const data = await api.get('/contas')
```

### ❌ Query keys inline

```typescript
// ❌ MAL
queryKey: ['contas', id]

// ✅ BIEN
import { queryKeys } from '@/shared/lib/query-keys'
queryKey: queryKeys.contasContabeis.detail(id)
```

---

## 📖 Referencias

- [Skill Frontend FUNCEF](../../.kiro/skills/frontend-funcef-4-layers.md)
- [Template Web FUNCEF](../../Funcef-kit/templates/web-template/)
- [Documentación Setup](../docs/SETUP.md)

---

**Status:** ✅ Scaffold completo  
**Próximo paso:** Implementar componentes UI y formularios
