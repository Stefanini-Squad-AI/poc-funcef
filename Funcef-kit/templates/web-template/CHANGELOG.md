# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [3.4.0] - 2026-08-13

### ✨ Adicionado

- **Modo certificado (private_key_jwt) no login Microsoft** — terceira credencial do
  client, em cascata: `MICROSOFT_CLIENT_SECRET` (secret) → `MICROSOFT_CLIENT_CERT_PATH`
  com `MICROSOFT_CLIENT_KEY_PATH` (certificado; novas envs opcionais) → managed identity
  (federated). Com os PEMs configurados e sem secret, a app assina a própria client
  assertion via `certificateClientAssertion` da lib — caminho oficial para rodar sem
  client secret fora do Azure. Geração dos artefatos com o comando `funcef cert` da CLI
  (gera/reusa o certificado no store do Windows, exporta o `.cer` para o Entra e os
  PEMs para a app).
- **Raio-X dev-only do access token** (herdado da lib): `GET /api/auth/debug/token`
  valida criptograficamente o token da sessão (assinatura via JWKS do tenant,
  expiração, issuer, audience) — página HTML no browser, JSON via fetch, 404 em
  produção.

### ♻️ Alterado

- `@funcef-componentes/auth` `^3.0.0` → `^3.1.0`.
- `core/auth` simplificado: a seleção de credencial vive em `clientCredential()`
  (cascata única, tipada com `MicrosoftClientAssertion`); o seam de observabilidade
  (no-op) foi removido — reintroduzir `onAuthEvent` ao adotar telemetria.

## [3.3.0] - 2026-08-13

### ✨ Adicionado

- **Federated credentials (client assertion) no login Microsoft** —
  `MICROSOFT_CLIENT_SECRET` agora é opcional: presente → modo secret (comportamento
  anterior, inalterado); ausente → a autenticação do client no Entra usa
  `client_assertion` no lugar do secret em toda ida ao token endpoint (login, refresh
  e mint de tokens). No Web App a assertion vem da managed identity do compute
  (user-assigned via `AZURE_MANAGED_IDENTITY_CLIENT_ID`, nova env opcional); fora do
  Azure (dev local), `DefaultAzureCredential` encadeia variáveis `AZURE_*` / az CLI /
  VS Code — ver `federatedClientAssertion` em `core/auth`. Pré-requisito de infra:
  FIC no app registration apontando para a identidade de cada ambiente.
- `@azure/identity` `^4.13.1` — consumido pelo entry `@funcef-componentes/auth/azure`
  (peer opcional da lib; só quem importa o entry precisa dele).

### ♻️ Alterado

- `@funcef-componentes/auth` `^2.0.0` → `^3.0.0` e `@funcef-componentes/react`
  `^2.4.0` → `^3.0.0`. A superfície consumida pelo template permanece compatível —
  os upgrades em si não exigiram mudança de código.
- `MICROSOFT_CLIENT_SECRET` saiu dos `buildFallbacks` do `parseEnv`: com a env
  opcional, o build sem secret monta o modo assertion inerte (nenhum token é pedido
  durante o build).
- Menores: `lucide-react` 1.31, `react-hook-form` 7.85, `@testing-library/jest-dom`
  7.0.1, `@types/node` 26.2, `eslint` 10.8.1, `eslint-plugin-boundaries` 7.2.

### 💥 Breaking

- Herdadas do `@funcef-componentes/react` 3.0.0 — data-table reformulado sobre core
  próprio (removidos `DataTable`, `DataTableToolbar`, `DataTableSkeleton`; composição
  direta pelos novos componentes) e drawer migrado do `vaul` para o Base UI.
  **Nenhuma afeta o template**, que não usa esses componentes; projetos derivados que
  os utilizem devem seguir o changelog da lib e o guia de Tabelas no Storybook.

## [3.2.0] - 2026-08-06

Rodada de atualização de dependências. **Nenhuma mudança em `src/`** — estrutura,
camadas, envs e o contrato do template seguem idênticos aos da 3.1.0.

### ♻️ Alterado

- `@funcef-componentes/react` `^2.3.0` → `^2.4.0`, `@funcef-componentes/tailwind`
  `^1.0.4` → `^1.1.0` e `@funcef-componentes/auth` `^1.0.0` → `^2.0.0`. Os três sobem
  juntos por obrigação: o `auth` 2.0.0 declara os outros dois como peer em versão exata.
- `next` `16.2.10` → `16.3.0` (com `eslint-config-next`), `react`/`react-dom`
  `19.2.7` → `19.2.8`, `ioredis` `^5.11.1` → `^6.0.0`, `better-auth` `^1.6.23` → `^1.6.26`.
- Ferramental: `eslint` 10.8, `@testing-library/jest-dom` 7, `tailwindcss` 4.3.3,
  `prettier` 3.9.6, `lint-staged` 17.3, `eslint-plugin-boundaries` 7.1,
  `react-hook-form` 7.84, `@tanstack/react-query` 5.101.4, `lucide-react` 1.29.

### 💥 Breaking

- Herdadas do `@funcef-componentes/react` 2.4.0, que trocou o motor de toasts
  (`sonner` → Toast do Base UI). São oito, detalhadas no changelog da lib; **duas não
  avisam em compilação**: as props `theme`, `richColors`, `expand`, `closeButton`,
  `invert`, `gap`, `offset` e `dir` do `<Toaster />` passaram a ser aceitas e ignoradas,
  e `toast.promise` agora rejeita de verdade — chamá-lo como statement gera unhandled
  rejection. Seguem funcionando `position`, `duration` e `visibleToasts`.

### 🔒 Segurança

- `next` 16.3.0 fecha as vulnerabilidades reportadas para a linha 16.2.x.
- Pisos de versão para CVEs em dependências transitivas, via `overrides`: `undici`
  `>=7.29.0 <8` (o teto é necessário: o jsdom 29 não carrega a v8), `postcss`
  `>=8.5.23` (o piso anterior, `>=8.5.10`, havia ficado defasado), `js-yaml` `>=4.3.1`,
  `fast-uri` `>=3.1.5` e `brace-expansion` nas duas linhas majors da árvore. O
  `pnpm audit` sai de 13 achados para zero.

### 🔧 Configurações

- `minimumReleaseAgeExclude` ganha `motion`, `motion-dom`, `motion-utils`,
  `framer-motion` e `lucide-react`. A isenção vale pelo nome do pacote e não alcança o
  que ele arrasta, então qualquer release nossa que suba uma dessas travava a lib
  inteira na quarentena de 48 horas.

## [3.1.0] - 2026-07-17

### ♻️ Alterado

- **Observability removida do base** — telemetria agora é opt-in via
  `@funcef-componentes/observability` no projeto (App Insights + OTel); o seam
  `onAuthEvent` permanece plugado e inerte. Deps OTel/App Insights diretas
  removidas; CSP sem origens de telemetria por padrão.
- **`parseEnv` da lib** — `src/shared/config/{env,env-client}.ts` consomem
  `@funcef-componentes/react/env` (skip de build via `buildFallbacks`
  interno); o `parse-env.ts` local foi removido.
- **Andaime removido** — `scenarios/`, `scripts/`, `docs/` e `INIT.md` saíram
  do repo: criação e conversão de projetos são responsabilidade da CLI
  (`pnpm dlx @funcef-componentes/cli new` / `scenario apply`). CI reduzido ao
  verify (o gate de cenários volta via CLI). Hooks de agente removidos.
- `@funcef-componentes/auth` `^0.10.0` → `^1.0.0`.

## [3.0.0] - 2026-07-11

Refactor estrutural: o template passa a **consumir `@funcef-componentes/auth`
(^0.9.0)** em vez de manter cópias locais de auth/HTTP/shell, cobre os **dois
cenários de consumo** da lib e fecha o fluxo Full BA com **BFF same-origin** e
o cenário Consumidor com **verificação contínua do overlay**. Rastreabilidade
em [`docs/refactor-v3-plano.md`](./docs/refactor-v3-plano.md).

### 💥 Breaking

- **Auth pela lib (0.9.0)**: removidos `shared/lib/auth`, `core/auth` artesanal,
  `core/guards/session`, proxy e http-client próprios. Agora via
  `createFuncefAuth`, `createApi` (`@/core/api`), `createSessionProxy`,
  `createEntraSignInRoute`, `AppShell` (sem a prop `basePath`), com o núcleo
  HTTP importado de `@funcef-componentes/auth/http`.
- **BFF same-origin** (`createBffHandler`): o access token Microsoft nunca
  chega ao browser; a env da API vira **`API_URL` server-only** no Full BA
  (era `NEXT_PUBLIC_API_CLIENTES_URL` → `NEXT_PUBLIC_API_URL` → `API_URL`).
- **axios removido** → `createApi` (envelope FUNCEF + erro carimbado +
  401→teardown embutidos).
- **`store/` (zustand), PDF e data-table removidos do base** → receitas
  (`docs/recipes/`).
- **Build do Consumidor falha** sem `NEXT_PUBLIC_ENTRADA_URL`/`NEXT_PUBLIC_API_URL`
  (fim do `localhost` embarcado silenciosamente em produção).

### ✨ Adicionado

- **Dois cenários**: base = **Full BA (Entra ID)**; overlay
  `scenarios/consumidor-tkf2/` + `INIT.md`, com **fonte única de conversão**
  (`scripts/scenario-recipe.mjs`) e overlay reduzido a deltas mínimos
  (`shell.tsx` e teste do hook são únicos).
- **`pnpm overlay:check`**: monta o Consumidor num tempdir e roda tsc+lint
  (barato, por PR); `pnpm smoke:scenarios` hermético (mkdtemp, sem `.env*`)
  segue como prova completa pre-release.
- **`cookieDomain` por env** no factory E no proxy — deleção de cookie órfão
  (`?stale=1`) funcional em produção; `normalizeRedisConnection` (connection
  string Azure/.NET); `onAuthEvent` → OTel.
- **Esteira**: `NEXT_PUBLIC_ENTRADA_URL` injetada nos Dockerfiles e workflows.
- **CI automático** em PR/push (typecheck+lint+format:check+test+build e
  overlay-check); piso de cobertura no vitest; `.gitattributes` (eol=lf);
  ES2022; `setup.js` renomeia docs recursivamente e nomes hardcoded no código.
- **Exemplo mínimo `features/tasks`** + mock de dev (json-server, porta 3001);
  telemetria isolada em `observability/`; regra de idioma em `code-style.md`.

## [2.2.0] - 2026-06-28

Release de **modernização** do template, incorporando a evolução amadurecida em
projetos reais. Reúne tudo que entrou desde a v2.1.1 (layout autenticado + a
modernização de arquitetura, dados, auth, telemetria, CI/CD e instrumentação de IA).

### ✨ Adicionado

- **Arquitetura em 5 camadas com boundaries enforçados**
  - Fluxo unidirecional `app → features → core → shared → store`
  - Nova camada `core/` para infraestrutura e concerns transversais (providers, guards, auth, config)
  - `eslint-plugin-boundaries` falha o lint em qualquer importação proibida entre camadas

- **Migração para `@funcef-componentes/react` v2 (Base UI)**
  - Componentes com `render` prop, atributos `data-state` e `LoadingFuncef`
  - Dark mode via `next-themes`

- **Data-fetching normalizado**
  - Cliente `api<T>` tipado, com normalização de envelope/casing em um único lugar
  - `QueryClient` SSR-safe, retry seletivo (não repete 4xx) e tratamento de 401 unificado (`AUTH_ERROR_EVENT`)
  - Hooks chamam `api<T>` diretamente (sem camada `service.ts`)

- **DataTable genérico** (`@tanstack/react-table`) com exemplo na feature `clientes`

- **Autenticação plugável**
  - Infraestrutura genérica com provedor removível via `AuthAdapter` (Better Auth + Microsoft como padrão)
  - `proxy.ts` configurável (Next.js 16 renomeia middleware → proxy)
  - `endSession` unificado e guards de sessão (idle/offline)

- **Telemetria opt-in**
  - OpenTelemetry (servidor) + Azure Application Insights (browser), cookieless por padrão
  - Microsoft Clarity intencionalmente excluído

- **Geração de PDF** (`@react-pdf/renderer`) com exemplo

- **Instrumentação de IA**
  - `CLAUDE.md` + regras em `.claude/rules/`, subagente `code-reviewer`, skill `/new-feature`
  - Skills de terceiros vendoradas no repositório

- **CI/CD e empacotamento**
  - release-please + pipelines de deploy (esteira funcef-devops, gateados por `DEPLOY_ENABLED`)
  - Dockerfile slim multi-stage (node-slim, `output: 'standalone'`)

- **Layout autenticado**
  - Componentes `AuthenticatedLayout`, `AuthenticatedLayoutHeader` e `AuthenticatedLayoutFooter`
  - Configuração de menu baseada em Record, breadcrumb dinâmico e sidebar com grupos/subitens
  - Helper `findMenuItemByRoute` para busca eficiente no menu

- **Fluxo de autenticação Microsoft e gerenciamento de sessão**
  - Login/logout com Azure AD e rota de API dedicada
  - Sessão e foto de perfil via Redis; configuração avançada de cookies e segurança

### 🔄 Alterado

- **Tooling e reprodutibilidade** — pin do pnpm, hardening de supply-chain, script `typecheck` padronizado, bump de devDeps
- Logging migrado para `@funcef-componentes/react/utils` (logger próprio removido)
- Reconciliação de env/config — remoção de `COOKIE_NAME`/`BETTER_AUTH_*` mortos, consumo de `env.OTEL_DEBUG`
- `.env.example` atualizado; menu/navegação com tipagem consistente; ícones compatíveis com Lucide/ReactNode

### 🔒 Segurança

- CSP por ambiente (produção) e headers de segurança HTTP
- Token de API injetável (plugável) e telemetria cookieless

### 🧪 Testes

- Migração de **Jest → Vitest + MSW** (infra, exemplo e step no CI)

### 🐛 Corrigido

- `error.tsx` respeita o `BASE_PATH`
- Guarda anti-reentrância do teardown compartilhada entre 401 e idle-logout (sem travar logout)
- App Insights exclui o backend da injeção de headers de correlação (evita falha de preflight CORS)
- `setup.js` — remove etapa fantasma de docker-compose, reseta o manifest do release-please e atualiza os regexes do README
- Tipagem de ícones no sidebar e filtro de busca do menu

### 📚 Documentação

- `ARCHITECTURE.md` visual + `README.md` reescrito (como executar e porquê)
- Documentação alinhada ao código (`.claude/rules/`), extensão genérica da CSP e features de exemplo
- Risco de supply-chain dos reusable workflows `@main` registrado no `deploy.md`

---

## [2.1.1] - 2025-12-02

### 🐛 Corrigido

- Removidos arquivos da arquitetura v1.0.0 que foram misturados durante merges anteriores
- Estrutura de pastas restaurada para v2.0.0 limpa
- Aplicadas apenas mudanças válidas das versões 2.0.1 e 2.1.0

### 🗑️ Removido

- Arquivos da v1: `src/services/`, `src/configs/`, `src/instrumentation.ts`, `src/middleware.ts`
- Documentos duplicados e da v1 nas docs
- Arquivos obsoletos da arquitetura antiga

## [2.1.0] - 2025-12-02

### ✨ Adicionado

- **Script de inicialização do template (`scripts/setup.js`)**
  - Script interativo para configurar novos projetos a partir do template
  - Renomeia automaticamente o projeto no `package.json`
  - Reseta versão para `1.0.0` e limpa o `CHANGELOG.md`
  - Atualiza referências no `README.md` (título e descrição)
  - Atualiza referências nos arquivos `docker-compose.yml` e `docker-compose.prod.yml`
  - Atualiza todas as referências "web-template" na documentação (`docs/`)
  - Cria `.env.local` automaticamente a partir de `.env.example`
  - Opção para remover o script após uso
  - Formatação automática do título do projeto (ex: "web-autoatendimento" → "Web Autoatendimento")
  - Comando `pnpm run setup` adicionado ao `package.json` para facilitar execução

### 📚 Documentação

- README atualizado com instruções de uso do script de setup
- Seção dedicada explicando o processo de inicialização do template

## [2.0.1] - 2025-12-02

### 🗑️ Removido

- Arquivo `yarn.lock` removido do controle de versão (projeto utiliza pnpm)

## [2.0.0] - 2025-12-30

### ✨ Adicionado

- **Arquitetura Feature-Based completa**
  - Estrutura organizada por funcionalidades
  - Separação clara de responsabilidades (api, hooks, services, types, validators)
  - Colocation de código relacionado

- **Documentação completa**
  - 10 documentos detalhados cobrindo todos os aspectos
  - Guia de onboarding para novos desenvolvedores
  - Diagramas Mermaid para visualização
  - Exemplos práticos em todos os guias

- **Docker e Docker Compose**
  - Dockerfile para produção baseado em exemplos oficiais do Next.js
  - docker-compose.yml para desenvolvimento com hot reload
  - docker-compose.prod.yml para testes de produção
  - Suporte para yarn, npm e pnpm

- **CI/CD com GitHub Actions**
  - Workflow de CI (lint, type-check, format-check, build)
  - Workflow de CD (build e deploy customizável)
  - Execução em PRs e pushes para main

- **Ferramentas de Qualidade de Código**
  - Husky para git hooks
  - Commitlint para validação de mensagens de commit
  - lint-staged para lint em arquivos staged
  - Prettier integrado com ESLint
  - Prettier plugin para Tailwind CSS

- **Validação de Variáveis de Ambiente**
  - Validação com Zod
  - Type safety para variáveis de ambiente
  - Mensagens de erro claras

- **Error Handling Global**
  - Error boundary global (`error.tsx`)
  - Loading state global (`loading.tsx`)
  - 404 customizado (`not-found.tsx`)

- **Exemplo Completo de Feature**
  - Feature `clientes` com CRUD completo
  - Integração com React Query
  - Validação com Zod e React Hook Form
  - Componentes da lib @funcef-componentes

- **Campos de Validação Reutilizáveis**
  - Campo de email reutilizável (`emailField`)
  - Funções de validação de email
  - Normalização automática de dados

- **Estrutura de Pastas Preservada**
  - `.gitkeep` em todas as pastas vazias
  - Estrutura completa mantida no Git

### 🔄 Alterado

- **Simplificação do HTTP Client**
  - Instância única do Axios (`apiClient`)
  - Configuração simplificada
  - Interceptors preparados para tratamento de erros

- **Simplificação da Configuração do Zustand**
  - Configuração de slices simplificada
  - Persistência parcial mantida
  - Devtools habilitado em desenvolvimento

- **Padronização de Nomenclatura**
  - Todos os métodos em inglês
  - Hooks em inglês
  - Query keys em inglês
  - Consistência em todo o código

- **Melhoria na Estrutura de Pastas**
  - Organização clara de features
  - Código compartilhado em `shared/`
  - Configurações centralizadas em `config/`

### 🐛 Corrigido

- Conflitos entre ESLint e Prettier resolvidos
- Estrutura de pastas preservada com `.gitkeep`
- Validação de email corrigida e melhorada

### 📚 Documentação

- 10 documentos completos:
  - `0. architecture-concepts.md` - Conceitos fundamentais
  - `1. architecture-overview.md` - Visão geral da arquitetura
  - `2. folder-structure.md` - Estrutura de pastas
  - `3. code-conventions.md` - Convenções de código
  - `4. components-organization.md` - Organização de componentes
  - `5. routing-system.md` - Sistema de roteamento
  - `6. services-guid.md` - Guia de serviços
  - `7. store-guide.md` - Guia do store (Zustand)
  - `8. onboarding-guide.md` - Guia de onboarding
  - `9. docker-and-ci-cd.md` - Docker e CI/CD

- README atualizado com:
  - Badges de tecnologias
  - Quick Start detalhado
  - Links para toda documentação
  - Tabela de navegação rápida

### 🔧 Configurações

- TypeScript strict mode habilitado
- ESLint configurado com Next.js
- Prettier configurado com plugin Tailwind
- EditorConfig para consistência
- VS Code settings para formatação automática

---

## [1.0.0] - 2025-10-06

### ✨ Adicionado

- Versão inicial do template
- Estrutura básica do projeto
- Configurações iniciais

---

## Tipos de Mudanças

- `✨ Adicionado` para novas funcionalidades
- `🔄 Alterado` para mudanças em funcionalidades existentes
- `🗑️ Removido` para funcionalidades removidas
- `🐛 Corrigido` para correções de bugs
- `🔒 Segurança` para vulnerabilidades corrigidas
- `📚 Documentação` para mudanças na documentação
