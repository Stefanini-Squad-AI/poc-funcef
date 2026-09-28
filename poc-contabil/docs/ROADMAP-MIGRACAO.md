# Roadmap de Migração — Cadastro de Contas Contábeis

> **Tela migrada:** `FCadContasContabMT` (Delphi 5) → `ContasContabeisPage` (.NET 10 + React 19)
> **Projeto:** POC Contabilidade — FUNCEF / Stefanini
> **Líder Técnico:** Santiago Guauque
> **Versão:** 1.0 (28-set-2026)
> **Estado:** 🟡 Em progresso — Todos os 6 Tabs concluídos; faltam testing, refinamento e apresentação

---

## 📋 Tabela de Conteúdos

1. [Visão Geral](#1-visão-geral)
2. [Tela Migrada](#2-tela-migrada)
3. [Arquitetura de Destino](#3-arquitetura-de-destino)
4. [Fases da Migração](#4-fases-da-migração)
5. [Mapeamento Delphi → .NET / React](#5-mapeamento-delphi--net--react)
6. [Regras de Negócio Migradas](#6-regras-de-negocio-migradas)
7. [Endpoints da API](#7-endpoints-da-api)
8. [Base de Dados](#8-base-de-dados)
9. [Estado Detalhado por Tab](#9-estado-detalhado-por-tab)
10. [Pendentes e Próximos Passos](#10-pendentes-e-proximos-passos)
11. [Critérios de Aceitação](#11-criterios-de-aceitacao)
12. [Riscos e Mitigações](#12-riscos-e-mitigacoes)

---

## 1. Visão Geral

Este roadmap documenta o processo de migração da tela **Cadastro de Contas Contábeis** (`FCadContasContabMT`) desde o sistema legacy em Delphi 5 para o stack moderno FUNCEF (.NET 10 + React 19 + Oracle 23ai).

### Objetivo

Validar a arquitetura completa end-to-end com uma tela real do módulo Contábil, demonstrando que o stack FUNCEF pode replicar a funcionalidade do sistema legacy com UX moderna.

### Escopo

```
FCadContasContabMT (Delphi 5)
        ↓ migração
ContasContabeisPage (Next.js 16 + React 19)
    ├── Backend: .NET 10 Clean Architecture + CQRS + EF Core + Oracle
    ├── Frontend: Next.js 16 App Router + React 19 + TanStack Query
    ├── Auth: Azure Entra ID (BFF same-origin)
    └── DB: Oracle 23ai (esquema PLANOCONTA + tabelas relacionadas)
```

### Justificativa da Tela Selecionada

| Critério | Avaliação |
|----------|-----------|
| **Fundacional** | ✅ Todo o módulo contábil depende deste cadastro |
| **Representativa** | ✅ Exercita CRUD hierárquico, regras de negócio reais, UI complexa |
| **Complexidade** | 5/10 — alcançável em 5-6 semanas |
| **Reutilizável** | ✅ O construído se usa diretamente na migração real |
| **Alinhada com FUNCEF** | ✅ Uma das 3 telas sugeridas oficialmente pelo cliente |

---

## 2. Tela Migrada

### Origem (Delphi 5)

| Atributo | Valor |
|----------|-------|
| **Form** | `TfrmCadContasContabMT` |
| **Arquivo .pas** | `FCadContasContabMT.pas` (1690 linhas) |
| **Arquivo .dfm** | `FCadContasContabMT.dfm` (1835 linhas) |
| **Control Object** | `uCtrlPlanoConta.pas` (613 linhas) |
| **Localização** | `poc-funcef/CONTAB/FontesMT/` |
| **Tabelas Oracle** | `PLANOCONTA`, `PLANO`, `CONTASXCC`, `CONTASXSUBC`, `CENTCUST`, `SUBCONTA`, `SUBGRUPO`, `MOEDA`, `PARAMGLOBAL`, `PARAMCONTAB`, `SEGREGACRITER`, `PROGRAMA`, `RATADMPLANPATRO` |
| **UI** | Árvore hierárquica + 6 TabSheets |

### Destino (.NET 10 + React 19)

| Atributo | Valor |
|----------|-------|
| **Página** | `ContasContabeisPage` |
| **Rota** | `/contas-contabeis` |
| **Feature** | `frontend/src/features/contas-contabeis/` |
| **Controller** | `ContasContabeisController` |
| **Entidade** | `ContaContabil` |
| **Tabela principal** | `PLANOCONTA` (PK composta: `PLANO` + `PLACONTA`) |

### Estrutura do Formulário (6 Tabs)

| # | Aba | Equivalente Delphi | Estado |
|---|-----|--------------------|:------:|
| 1 | Informações Gerais | `TabSheet1` | ✅ Completo |
| 2 | Sub-Grupos & Moedas | `TabSheet3` | ✅ Completo |
| 3 | Conta x C.Custo | `TabSheet4` | ✅ Completo |
| 4 | Conta x Sub-Conta | `TabSheet5` | ✅ Completo |
| 5 | Árvore de Contas Contábeis | `TabSheet2` | ✅ Completo |
| 6 | Detalhes | `TabSheet6` | ✅ Completo |

---

## 3. Arquitetura de Destino

### Backend: Clean Architecture + CQRS

```
ContabPOC.API              → Controllers, Program.cs, Pipeline
ContabPOC.Application      → Commands, Queries, Handlers, DTOs, Validators
ContabPOC.Domain           → Entities, Enums
ContabPOC.Infrastructure   → DbContext, EF Core Configurations
```

**Fluxo:** `Controller → IMediator → Handler → DbContext → Oracle`

| Componente | Tecnologia | Pacote FUNCEF |
|------------|------------|---------------|
| Runtime | .NET 10 / C# 13 | — |
| Arquitetura | Clean + CQRS/Mediator | `FUNCEF.Essenciais` |
| ORM | EF Core + Dapper | `FUNCEF.ORM` |
| Base de dados | Oracle 23ai | — |
| Auth | Azure Entra ID | `FUNCEF.Autenticacao` |
| Cache | Redis 7+ | `FUNCEF.NoSql` |
| Secrets | Azure Key Vault | `FUNCEF.Cofre` |
| Telemetria | App Insights + OTel | `FUNCEF.Essenciais` |
| Validação | FluentValidation | — |

### Frontend: 4 Camadas

```
app/        → Rotas Next.js (authenticated)/contas-contabeis
features/   → contas-contabeis/ (api, hooks, components, types, validators)
core/       → api client, auth, config
shared/     → UI genérico, utils, query-keys
```

**Fluxo:** `Component → Hook (React Query) → API Client → BFF → Backend`

| Componente | Tecnologia | Pacote FUNCEF |
|------------|------------|---------------|
| Framework | Next.js 16 (App Router) | — |
| UI Library | React 19 | — |
| Linguagem | TypeScript 6 | — |
| Data fetching | TanStack Query 5 | — |
| Forms | React Hook Form + Zod | — |
| CSS | Tailwind CSS 4 | `@funcef-componentes/tailwind` |
| Auth | Better Auth + Entra ID | `@funcef-componentes/auth` |
| Design System | Radix-based | `@funcef-componentes/react` v2 |
| Package manager | pnpm 11.5.2+ | — |

### Conformidade com os Templates FUNCEF

O código migrado segue os padrões de arquitetura dos templates oficiais enviados pela FUNCEF:

#### Backend — `api-template-base` (TemplateBase)

| Template FUNCEF | Código Migrado (`ContabPOC`) | Conformidade |
|-----------------|------------------------------|:------------:|
| `TemplateBase.API/` (Controllers, Program.cs) | `ContabPOC.API/` (13 Controllers, Program.cs) | ✅ |
| `TemplateBase.Application/` (Commands, Queries, Handlers, DTOs, Validators) | `ContabPOC.Application/` (Commands, Queries, Handlers, DTOs, DI) | ✅ |
| `TemplateBase.Domain/` (Entities) | `ContabPOC.Domain/` (13 Entities + 3 Enums) | ✅ |
| `TemplateBase.Infrastructure/` (DbContext, EF Configs, DI) | `ContabPOC.Infrastructure/` (Persistence/Configuration, DI) | ✅ |
| `TemplateBase.slnx` (4 projetos) | `ContabPOC.slnx` (4 projetos) | ✅ |
| Clean Architecture + CQRS/Mediator | Clean Architecture + CQRS/Mediator | ✅ |
| Fluxo: `Controller → IMediator → Handler → DbContext → Oracle` | Idêntico | ✅ |

#### Frontend — `web-template`

| Template FUNCEF (`web-template/src`) | Código Migrado (`frontend/src`) | Conformidade |
|---------------------------------------|---------------------------------|:------------:|
| `app/` (Next.js App Router) | `app/` (rotas autenticadas) | ✅ |
| `features/` (feature-based) | `features/contas-contabeis/` (api, hooks, components, types, validators) | ✅ |
| `core/` (api client, auth, config) | `core/` | ✅ |
| `shared/` (UI genérico, utils) | `shared/` | ✅ |
| `assets/` | `assets/` | ✅ |
| 4 camadas + ESLint boundaries | Idêntico | ✅ |
| Fluxo: `Component → Hook → API Client → BFF → Backend` | Idêntico | ✅ |

#### Diferenças Esperadas (Simplificações de POC)

| Item | Template | POC | Justificativa |
|------|----------|-----|---------------|
| `Services/` layer | `Application/Services/` (Service Layer) | Lógica nos Handlers | Escopo reduzido da POC |
| Projeto `Tests/` | `TemplateBase.Tests/` (MSTest + NSubstitute) | Não criado | Pendente na Fase 11 |
| `Abstractions/` | `Application/Abstractions/` | Não necessário | Escopo não exigiu |
| `Configuration/` (Key Vault) | `Infrastructure/Configuration/` (VaultBootstrap) | Apenas EF Core configs | POC usa config local |

> Estas diferenças são **normais e esperadas** para uma POC — o foco foi validar a funcionalidade da tela, não replicar toda a infraestrutura corporativa do template.

---

## 4. Fases da Migração

### Resumo Visual

```
Fase 0: Setup              ████████████████████ ✅ Concluído
Fase 1: Backend Domain     ████████████████████ ✅ Concluído
Fase 2: Backend CRUD       ████████████████████ ✅ Concluído
Fase 3: Backend Regras     ████████████████████ ✅ Concluído
Fase 4: Frontend Scaffold  ████████████████████ ✅ Concluído
Fase 5: Frontend Tab 1     ████████████████████ ✅ Concluído
Fase 6: Frontend Tab 2     ████████████████████ ✅ Concluído
Fase 7: Frontend Tab 3     ████████████████████ ✅ Concluído
Fase 8: Frontend Tab 6     ████████████████████ ✅ Concluído
Fase 9: Frontend Tab 4     ████████████████████ ✅ Concluído
Fase 10: Frontend Tab 5    ████████████████████ ✅ Concluído
Fase 11: Integração        ░░░░░░░░░░░░░░░░░░░░ 🟡 Pendente
```

### Fase 0: Setup Inicial ✅

| Item | Estado | Descrição |
|------|:------:|------------|
| Estrutura de pastas | ✅ | `backend/`, `frontend/`, `database/`, `docs/` |
| Solução .NET | ✅ | `ContabPOC.slnx` com 4 projetos |
| Configuração NuGet | ✅ | `nuget.config` + `Directory.Packages.props` com pacotes FUNCEF |
| Frontend scaffold | ✅ | Next.js 16 + React 19 + Tailwind 4 |
| Docker compose | ✅ | Oracle 23ai Free em contêiner |
| Scripts SQL init | ✅ | 6 scripts de inicialização |
| Documentação base | ✅ | README, GETTING-STARTED, SETUP, MANUAL-USUARIO |

### Fase 1: Backend — Domain ✅

| Entidade | Tabela Oracle | Estado |
|----------|---------------|:------:|
| `ContaContabil` | `PLANOCONTA` | ✅ |
| `PlanoContabil` | `PLANO` | ✅ |
| `CentroCusto` | `CENTCUST` | ✅ |
| `ContasxCC` | `CONTASXCC` | ✅ |
| `ContasxSC` | `CONTASXSUBC` | ✅ |
| `SubConta` | `SUBCONTA` | ✅ |
| `SubGrupo` | `SUBGRUPO` | ✅ |
| `Moeda` | `MOEDA` | ✅ |
| `ParamGlobal` | `PARAMGLOBAL` | ✅ |
| `ParamContab` | `PARAMCONTAB` | ✅ |
| `SegregacaoCriter` | `SEGREGACRITER` | ✅ |
| `Programa` | `PROGRAMA` | ✅ |
| `RateioPlanoPatro` | `RATADMPLANPATRO` | ✅ |

**Enums:** `GrupoContaEnum` (A/P/R/D/C/O/E/S), `NaturezaContaEnum` (D/C/N), `TipoContaEnum` (S/A)

### Fase 2: Backend — CRUD Básico ✅

| Operação | Command/Query | Handler | Validador | Estado |
|----------|---------------|---------|-----------|:------:|
| Create | `CreateContaContabilCommand` | ✅ | ✅ FluentValidation | ✅ |
| Update | `UpdateContaContabilCommand` | ✅ | ✅ FluentValidation | ✅ |
| Delete | `DeleteContaContabilCommand` | ✅ | — | ✅ |
| GetById | `GetContaContabilByIdQuery` | ✅ | — | ✅ |
| GetTree | `GetContaContabilTreeQuery` | ✅ | — | ✅ |
| Associate CC | `AssociateContasxCCCommand` | ✅ | — | ✅ |
| Disassociate CC | `DisassociateContasxCCCommand` | ✅ | — | ✅ |
| Associate SC | `AssociateContasxSCCommand` | ✅ | — | ✅ |
| Disassociate SC | `DisassociateContasxSCCommand` | ✅ | — | ✅ |

**EF Core Configurations:** 13 arquivos de mapeamento entidade → tabela Oracle

### Fase 3: Backend — Regras de Negócio ✅

| Regra | Implementação | Estado |
|-------|---------------|:------:|
| RN006: Bloqueio/inativação | Handlers + Validators | ✅ |
| RN021: Exclusão com lançamentos/saldo/filhas | `DeleteContaContabilCommandHandler` → `InvalidOperationException` → 409 Conflict | ✅ |
| Grupo ↔ Natureza consistente | FluentValidation | ✅ |
| Sintética não pode ter CC | FluentValidation | ✅ |
| Nível 1 → Sintética | FluentValidation | ✅ |
| Pai Grupo=E → filha Grupo=E | FluentValidation | ✅ |
| Taxa juros 0-100 | FluentValidation | ✅ |
| Conta já cadastrada | FluentValidation | ✅ |

### Fase 4: Frontend — Scaffold ✅

| Item | Estado |
|------|:------:|
| Página `/contas-contabeis` | ✅ |
| Feature `contas-contabeis/` (api, hooks, components, types, validators) | ✅ |
| API client + endpoints | ✅ |
| React Query configurado | ✅ |
| ESLint boundaries | ✅ |
| Auth layout | ✅ |

### Fase 5: Frontend — Tab 1: Informações Gerais ✅

**Componente:** [`tab-informacoes-gerais.tsx`](../frontend/src/features/contas-contabeis/components/tab-informacoes-gerais.tsx)

| Seção | Campos | Estado |
|-------|--------|:------:|
| Identificação | Plano, Código, Grau, Tipo, Grupo, Cód.Reduzido, Natureza, Descrição PT, Descrição outro idioma, Conta Correspondente | ✅ |
| Parâmetros | 12 checkboxes + Bloqueada até + Conta Estatística | ✅ |
| Segreg. Investimento | Radio group (N/S/R) + Nome do Rateio | ✅ |
| Segregação de Recursos | Critério + Programa + Conta Extracontábil + Uso PGA | ✅ |
| Segregação | 4 campos de texto + lookup | ✅ |

### Fase 6: Frontend — Tab 2: Sub-Grupos & Moedas ✅

**Componente:** [`tab-subgrupos-moeda.tsx`](../frontend/src/features/contas-contabeis/components/tab-subgrupos-moeda.tsx)

| Seção | Campos | Estado |
|-------|--------|:------:|
| Sub-Grupos | 4 dropdowns (SUBGRUPO) | ✅ |
| Tipo de Conversão Padrão | 4 dropdowns com habilitação dinâmica (Regra 7) | ✅ |
| Moeda Histórica | Moeda + Contra Partida + lookup | ✅ |
| Taxa de Juros | Percentual + Contrapartida | ✅ |

### Fase 7: Frontend — Tab 3: Conta x C.Custo ✅

**Componente:** [`tab-centro-custo.tsx`](../frontend/src/features/contas-contabeis/components/tab-centro-custo.tsx)

| Funcionalidade | Estado |
|-----------------|:------:|
| Dual-list (Disponíveis ↔ Associados) | ✅ |
| Botões >>, >, <, << | ✅ |
| Validação: sintéticos bloqueados | ✅ |
| Tab habilitada somente quando `PLACCUST='S'` | ✅ |
| Endpoints associate/disassociate | ✅ |

### Fase 8: Frontend — Tab 6: Detalhes ✅

**Componente:** [`tab-outros.tsx`](../frontend/src/features/contas-contabeis/components/tab-outros.tsx)

| Campo | Estado |
|-------|:------:|
| Descrição/Observações (textarea, máx 1000) | ✅ |

### Fase 9: Frontend — Tab 4: Conta x Sub-Conta ✅

**Componente:** [`tab-sub-conta.tsx`](../frontend/src/features/contas-contabeis/components/tab-sub-conta.tsx) (474 linhas)

| Funcionalidade | Estado |
|-----------------|:------:|
| Dual-list (Sub-Contas Disponíveis ↔ Associados) | ✅ |
| Botões >>, >, <, << | ✅ |
| Movimentações locais (em memória) + persistir ao salvar | ✅ |
| Confirmação ao desassociar todos (<<) | ✅ |
| Tab habilitada somente quando `PLASUBCONTA='S'` | ✅ |
| Endpoints backend | ✅ (`SubContasController`, `ContasxSCController`) |
| Hooks frontend | ✅ (`useSubContas`, `useContasxSC`, `useAssociateContasxSC`, `useDisassociateContasxSC`) |

### Fase 10: Frontend — Tab 5: Árvore de Contas Contábeis ✅

**Componente:** [`contas-list.tsx`](../frontend/src/features/contas-contabeis/components/contas-list.tsx) (277 linhas)

| Funcionalidade | Estado |
|-----------------|:------:|
| Árvore hierárquica visual (`buildTree`) | ✅ |
| Expandir/colapsar nós (`TreeNodeItem` recursivo) | ✅ |
| Expandir todos / Colapsar todos | ✅ |
| Badges (Tipo, Grupo, Inativa, Bloqueada) | ✅ |
| Contador de nós | ✅ |
| Endpoint backend | ✅ (`GET /api/contascontabeis/tree`) |
| Hook frontend | ✅ (`useContasTree`) |

### Fase 11: Integração e Validações 🟡

| Item | Estado |
|------|:------:|
| Dupla validação frontend (Zod) + backend (FluentValidation) | ✅ |
| Envelope FUNCEF normalizado (`{ resultado, mensagem, qtdRegistros }`) | ✅ |
| Paridade funcional com tela Delphi | ✅ |


---

## 5. Mapeamento Delphi → .NET / React

### Mapeamento de Eventos Delphi → Endpoints API

| Evento Delphi | Método HTTP | Endpoint | Descrição |
|---------------|-------------|----------|------------|
| `CmeCadastroFind` | `GET` | `/api/contascontabeis/{plano}/{codigo}` | Buscar conta por PK |
| `CmeCadastroInsert` | `POST` | `/api/contascontabeis` | Criar nova conta |
| `CmeCadastroEdit` | `PUT` | `/api/contascontabeis/{plano}/{codigo}` | Atualizar conta |
| `CmeCadastroDelete` | `DELETE` | `/api/contascontabeis/{plano}/{codigo}` | Excluir conta |
| `pgCtrlChange` / `treePlano.MontaArvore` | `GET` | `/api/contascontabeis/tree` | Árvore hierárquica |
| `btnVaiTodosClick` / `btnVaiUmClick` | `POST` | `/api/contasxcc/associate` | Associar C.Custos |
| `btnVoltaTodosClick` / `btnVoltaUmClick` | `POST` | `/api/contasxcc/disassociate` | Desassociar C.Custos |

### Mapeamento de Campos Delphi → Oracle → .NET Entity

| Componente Delphi | Coluna Oracle | Propriedade .NET | Tipo |
|-------------------|---------------|-------------------|------|
| `dbeCodigo` | `PLACONTA` | `Codigo` | `string` |
| `dbeGrau` | `PLAGRAU` | `Nivel` | `int` |
| `grpTipo` | `PLATIPO` | `Tipo` | `string` (S/A) |
| `cmbGrp` | `PLAGRUPO` | `Grupo` | `string` (A/P/R/D/C/O/E/S) |
| `dbeCodReduz` | `PLAREDUZ` | `CodigoReduzido` | `int` |
| `grpNatureza` | `PLANATUREZA` | `Natureza` | `string` (D/C/N) |
| `dbeDescPort` | `PLANOME` | `Descricao` | `string` |
| `dbeDescOIdi` | `PLANOMEOUTLING` | `DescricaoIdioma` | `string?` |
| `dbeCorresp` | `PLACONCORRESP` | `ContaCorrespondente` | `string?` |
| `chkOrdAlf` | `PLAORDALF` | `OrdemAlfabetica` | `bool?` |
| `chkCentCust` | `PLACCUST` | `AceitaCentroCusto` | `bool?` |
| `chkInativa` | `PLAINATIVA` | `Inativa` | `bool` |
| `chkBloqueia` | `PLABLOQUE` | `Bloqueada` | `bool?` |
| `dteBloqueada` | `PLABLOQUEDATA` | `DataBloqueio` | `string?` |
| `rdgRateio` | `PLARATEIOAP` | `AceitaRateio` | `string?` (N/S/R) |
| `dblkSubGrupo1..4` | `IDSUBGRUPO1..4` | `SubGrupo1..4` | `int?` |
| `dblkMoeda` | `IDMOEDA` | `MoedaId` | `int?` |
| `dblkSegregacao` | `IDSEGREGACRITER` | `SegregacaoCriterId` | `int?` |
| `cboPrograma` | `IDPROGRAMA` | `ProgramaId` | `int?` |
| `dblkRateioPlanoPatro` | `IDRATADMPLANPATRO` | `RateioPlanoAdmId` | `int?` |
| `DBMemoObs` | `OBSERVACAO` | `Observacoes` | `string?` |

### Mapeamento de TabSheets → Componentes React

| TabSheet Delphi | Componente React | Arquivo |
|-----------------|-------------------|---------|
| `TabSheet1` (Informações Gerais) | `TabInformacoesGerais` | `tab-informacoes-gerais.tsx` |
| `TabSheet3` (Sub-Grupos & Moedas) | `TabSubgruposMoeda` | `tab-subgrupos-moeda.tsx` |
| `TabSheet4` (Conta x C.Custo) | `TabCentroCusto` | `tab-centro-custo.tsx` |
| `TabSheet5` (Conta x Sub-Conta) | `TabSubConta` | `tab-sub-conta.tsx` |
| `TabSheet2` (Árvore) | `ContasList` | `contas-list.tsx` |
| `TabSheet6` (Detalhes) | `TabOutros` | `tab-outros.tsx` |

---

## 6. Regras de Negócio Migradas

### Regras Automáticas (Frontend)

| # | Regra | Evento Delphi | Origem Legacy | Estado |
|---|-------|---------------|---------------|:------:|
| 1 | Código → Grau (automático) | `dbeCodigoExit` | Linhas 488-611 | ✅ |
| 2 | Grau → Tipo (automático) | `dbeCodigoExit` | Linhas 488-611 | ✅ |
| 3 | Grupo → Natureza (automático) | `cmbGrpExit` | Linhas 613-670 | ✅ |
| 4 | Tipo → Habilitação de checkboxes | `grpTipoClick` | Linhas 986-999 | ✅ |
| 5 | SegregaVirtual → Habilitação de campos | `FormCreate` | Linhas 376-383 | ✅ |
| 6 | Conta pai Grupo=E → filha Grupo=E | `CmeCadastroBeforeConfirma` | Linhas 1396-1477 | ✅ |
| 7 | Configuração moedas → habilitar combos | `FormShow` | Linhas 740-762 | ✅ |
| 8 | Normalização conversão vazia → 'N' | `CmeCadastroBeforeConfirma` | Linhas 1448-1458 | ✅ |

### Regras de Validação (Backend + Frontend)

| # | Regra | Frontend (Zod) | Backend (FluentValidation) | Estado |
|---|-------|:--------------:|:-------------------------:|:------:|
| 1 | Plano obrigatório | ✅ | ✅ | ✅ |
| 2 | Código obrigatório | ✅ | ✅ | ✅ |
| 3 | Código máx 20 caracteres | ✅ | ✅ | ✅ |
| 4 | Descrição obrigatória | ✅ | ✅ | ✅ |
| 5 | Tipo S ou A | ✅ | ✅ | ✅ |
| 6 | Grupo válido (A/P/R/D/C/O/E/S) | ✅ | ✅ | ✅ |
| 7 | Nível 1-20 | ✅ | ✅ (1-99) | ✅ |
| 8 | Código Reduzido > 0 | ✅ | ✅ | ✅ |
| 9 | Grupo ↔ Natureza consistente | ✅ | ✅ | ✅ |
| 10 | Sintética não pode ter CC | ✅ | ✅ | ✅ |
| 11 | Nível 1 → Sintética | ✅ | ✅ | ✅ |
| 12 | Taxa juros > 0 → contrapartida obrigatória | ✅ | — | ✅ |
| 13 | Taxa juros 0-100 | — | ✅ | ✅ |
| 14 | Conta já cadastrada | — | ✅ | ✅ |
| 15 | Pai Grupo=E → filha Grupo=E | — | ✅ | ✅ |

### Regras de Exclusão (RN021)

| Validação | Origem Legacy | Implementação | Estado |
|-----------|---------------|----------------|:------:|
| Conta com lançamentos | `CmeCadastroApplyDelete` | `DeleteContaContabilCommandHandler` | ✅ |
| Conta com saldo | `CmeCadastroApplyDelete` | `DeleteContaContabilCommandHandler` | ✅ |
| Conta com filhas | `CmeCadastroApplyDelete` | `DeleteContaContabilCommandHandler` | ✅ |
| Resposta HTTP | — | `409 Conflict` com mensagem | ✅ |

---

## 7. Endpoints da API

### Contas Contábeis (CRUD principal)

| Método | Endpoint | Descrição | Controller |
|--------|----------|------------|------------|
| `GET` | `/api/contascontabeis/tree` | Árvore hierárquica | `ContasContabeisController` |
| `GET` | `/api/contascontabeis/{plano}/{codigo}` | Buscar por PK | `ContasContabeisController` |
| `POST` | `/api/contascontabeis` | Criar conta | `ContasContabeisController` |
| `PUT` | `/api/contascontabeis/{plano}/{codigo}` | Atualizar conta | `ContasContabeisController` |
| `DELETE` | `/api/contascontabeis/{plano}/{codigo}` | Excluir conta | `ContasContabeisController` |

### Contas x C.Custo (Tab 3)

| Método | Endpoint | Descrição |
|--------|----------|------------|
| `GET` | `/api/centroscusto?idEmpresa={id}&plano={p}&placConta={c}` | C.Custos disponíveis |
| `GET` | `/api/contasxcc?idEmpresa={id}&plano={p}&placConta={c}` | C.Custos associados |
| `POST` | `/api/contasxcc/associate` | Associar C.Custos |
| `POST` | `/api/contasxcc/disassociate` | Desassociar C.Custos |

### Contas x Sub-Conta (Tab 4)

| Método | Endpoint | Descrição |
|--------|----------|------------|
| `GET` | `/api/subcontas?idEmpresa={id}&plano={p}&placConta={c}` | Sub-contas disponíveis |
| `GET` | `/api/contasxsc?idEmpresa={id}&plano={p}&placConta={c}` | Sub-contas associadas |
| `POST` | `/api/contasxsc/associate` | Associar sub-contas |
| `POST` | `/api/contasxsc/disassociate` | Desassociar sub-contas |

### Endpoints de Suporte (Dropdowns)

| Método | Endpoint | Descrição | Tabela Oracle |
|--------|----------|------------|---------------|
| `GET` | `/api/planoscontabeis` | Planos contábeis | `PLANO` |
| `GET` | `/api/subgrupos` | Sub-grupos | `SUBGRUPO` |
| `GET` | `/api/moedas` | Moedas | `MOEDA` |
| `GET` | `/api/programas` | Programas | `PROGRAMA` |
| `GET` | `/api/segregacoescriter` | Critérios de segregação | `SEGREGACRITER` |
| `GET` | `/api/rateiosplanopatro` | Rateios por plano/patro | `RATADMPLANPATRO` |
| `GET` | `/api/paramglobal/{idEmpresa}` | Parâmetros globais | `PARAMGLOBAL` |
| `GET` | `/api/paramcontab/{idEmpresa}` | Parâmetros contábeis | `PARAMCONTAB` |

### Envelope de Resposta FUNCEF

Todas as respostas seguem o formato normalizado:

```json
{
  "resultado": { ... },
  "mensagem": "Conta contábil criada com sucesso",
  "qtdRegistros": 1
}
```

---

## 8. Base de Dados

### Tabelas Oracle Migradas

| Tabela | PK | Descrição | Script |
|--------|-----|------------|--------|
| `PLANO` | `IDPLANO` | Planos contábeis | `02-create-schema.sql` |
| `PLANOCONTA` | `(PLANO, PLACONTA)` | Contas contábeis | `02-create-schema.sql` |
| `CENTCUST` | `(IDPESSOA, CODCENTROCUSTO)` | Centros de custo | `02-create-schema.sql` |
| `CONTASXCC` | `IDCONTACC` (seq) | Relação conta × C.Custo | `02-create-schema.sql` |
| `CONTASXSUBC` | `IDCONTASC` (seq) | Relação conta × Sub-Conta | `02-create-schema.sql` |
| `SUBCONTA` | `(IDPESSOA, CODSUBCONTA)` | Sub-contas | `06-create-subconta.sql` |
| `SUBGRUPO` | `IDSUBGRUPO` | Sub-grupos | `05-create-subgrupo-moeda.sql` |
| `MOEDA` | `IDMOEDA` | Moedas | `05-create-subgrupo-moeda.sql` |
| `PARAMGLOBAL` | `IDPESSOA` | Parâmetros globais por empresa | `02-create-schema.sql` |
| `PARAMCONTAB` | `IDPESSOA` | Parâmetros contábeis por empresa | `02-create-schema.sql` |
| `SEGREGACRITER` | `IDSEGREGACRITER` | Critérios de segregação | `02-create-schema.sql` |
| `PROGRAMA` | `IDPROGRAMA` | Programas | `02-create-schema.sql` |
| `RATADMPLANPATRO` | `IDRATADMPLANPATRO` | Rateios por plano/patro | `02-create-schema.sql` |

### Scripts de Inicialização

| # | Script | Descrição |
|---|--------|------------|
| 1 | `01-create-users.sql` | Usuários Oracle (`CONTAB_DEV`, `CONTAB_TEST`) |
| 2 | `02-create-schema.sql` | Esquema completo (tabelas, constraints, índices) |
| 3 | `03-create-triggers.sql` | Triggers (auditoria, sequências, `TRG_BI_CONTASXCC`) |
| 4 | `04-seed-data.sql` | Dados seed (planos, paramglobal, paramcontab, segregação, programas) |
| 5 | `05-create-subgrupo-moeda.sql` | Tabelas SUBGRUPO e MOEDA + seed |
| 6 | `06-create-subconta.sql` | Tabela SUBCONTA + seed |

### Infraestrutura

| Componente | Arquivo | Descrição |
|------------|---------|------------|
| Docker Compose | `docker-compose.yml` | Oracle 23ai Free em contêiner |
| Fix schema | `fix-schema.sql` | Correções de esquema |
| Fix triggers | `fix-trigger-mutating.sql` | Fix trigger mutating table |
| Fix PLAREDUZ | `fix-plareduz.sql` | Fix geração código reduzido |
| Verify schema | `verify-schema.sql` | Verificação de integridade |

---

## 9. Estado Detalhado por Tab

### Tab 1: Informações Gerais ✅

**Seções implementadas:**

1. **Identificação da Conta** — Plano, Código, Grau (auto), Tipo (auto), Grupo, Cód.Reduzido, Natureza (auto), Descrição PT, Descrição outro idioma, Conta Correspondente
2. **Parâmetros** — 12 checkboxes (ordem alfabética, centro de custo, movimentação, inativa, concilia, imprime rel., sub-conta, sumariza, altera PL, conta padrão, bloqueada até, conta estatística)
3. **Segreg. Investimento (antiga)** — Radio group N/S/R + dropdown Nome do Rateio (`RATADMPLANPATRO`)
4. **Segregação de Recursos** — Dropdown Critério (`SEGREGACRITER`), Dropdown Programa (`PROGRAMA`), Conta Extracontábil, Uso PGA
5. **Segregação** — 4 campos de texto com lookup (segregação planos, aglutinação, fundo adm crédito/débito)

**Regras automáticas ativas:** Regras 1, 2, 3, 4, 5, 6

### Tab 2: Sub-Grupos & Moedas ✅

**Seções implementadas:**

1. **Sub-Grupos** — 4 dropdowns (`SUBGRUPO` 1-4)
2. **Tipo de Conversão Padrão** — 4 dropdowns com habilitação dinâmica conforme `PARAMCONTAB` (Regra 7) + labels dinâmicas com sigla de moeda
3. **Moeda Histórica** — Dropdown Moeda (`MOEDA`) + Contra Partida com lookup
4. **Taxa de Juros** — Percentual (0-100) + Contrapartida com lookup

**Regras automáticas ativas:** Regras 7, 8

### Tab 3: Conta x C.Custo ✅

**Padrão:** Dual-list (Disponíveis ↔ Associados)

- Grid esquerdo: C.Custos disponíveis (`CENTCUST` filtrado por empresa, excluindo associados)
- Grid direito: C.Custos associados (`CONTASXCC`)
- 4 botões: `>>` (associar todos analíticos), `>` (associar selecionados), `<` (desassociar selecionados), `<<` (desassociar todos)
- Validação: sintéticos (`STATUSGRUPOCDC = 'S'`) bloqueados com mensagem de erro
- Tab habilitada somente quando `PLACCUST = 'S'`

### Tab 4: Conta x Sub-Conta ✅

**Padrão:** Dual-list (Sub-Contas Disponíveis ↔ Associados) com movimentações locais

- Grid esquerdo: Sub-contas disponíveis (`SUBCONTA` filtrado por empresa, excluindo associados)
- Grid direito: Sub-contas associadas (`CONTASXSUBC`)
- 4 botões: `>>` (associar todos), `>` (associar selecionados), `<` (desassociar selecionados), `<<` (desassociar todos com confirmação)
- Movimentações locais em memória (replica `CdsContasxSC` do Delphi) — persistência ao salvar
- Tab habilitada somente quando `PLASUBCONTA = 'S'` e a conta já está salva

### Tab 5: Árvore de Contas Contábeis ✅

**Padrão:** Árvore hierárquica visual recursiva

- Construção da árvore desde lista plana (`buildTree`) — hierarquia por código (`1` → `1.1` → `1.1.01`)
- Componente recursivo `TreeNodeItem` com indentação por nível
- Expandir/colapsar nós individuais + expandir/colapsar todos
- Badges: Tipo (Sintética/Analítica), Grupo, Inativa, Bloqueada
- Contador total de nós
- Equivalente ao `treePlano.MontaArvore` do Delphi

### Tab 6: Detalhes ✅

**Seções implementadas:**

1. **Descrição/Observações** — Textarea (máx 1000 caracteres)

---

## 10. Pendentes e Próximos Passos

### Prioridade 1: Testing

| Tarefa | Esforço | Descrição |
|--------|---------|------------|
| Tests backend | 2 dias | Unit tests para Handlers, Validators; Integration tests para Controllers |
| Tests frontend | 2 dias | Component tests (Vitest + Testing Library), API mocks (MSW) |

### Prioridade 2: Refinamento

| Tarefa | Esforço | Descrição |
|--------|---------|------------|
| Paridade visual com Delphi | 2 dias | Ajustes de UX, não pixel-perfect mas funcional |
| Responsividade | 1 dia | Mobile/tablet breakpoints |
| Acessibilidade | 1 dia | ARIA labels, keyboard navigation |

### Timeline Estimado Restante

| Semana | Entregável |
|--------|------------|
| 1 | Tests backend + frontend |
| 2 | Refinamento + paridade visual |
| 3 | Apresentação à FUNCEF |

**Duração restante estimada:** 2-3 semanas

---

## 11. Critérios de Aceitação

### Critérios Funcionais

| # | Critério | Estado |
|---|----------|:------:|
| 1 | Árvore hierárquica de contas contábeis carrega desde Oracle | ✅ |
| 2 | CRUD completo com validações (RN006, RN021) | ✅ |
| 3 | Autenticação Entra ID (BFF same-origin, Bearer nunca no browser) | ✅ |
| 4 | Envelope FUNCEF normalizado (`{ resultado, mensagem, qtdRegistros }`) | ✅ |
| 5 | UI responsiva com componentes `@funcef-componentes/react` | ✅ |
| 6 | Paridade funcional com tela Delphi | ✅ |
| 7 | Build + tests + verificação CI passam | 🟡 Pendente |
| 8 | Tab 4 (Sub-Conta) funcional | ✅ |
| 9 | Tab 5 (Árvore) funcional | ✅ |

### Critérios Técnicos

| # | Critério | Estado |
|---|----------|:------:|
| 1 | Clean Architecture respeitada (dependências para dentro) | ✅ |
| 2 | CQRS/Mediator em todos os endpoints | ✅ |
| 3 | FluentValidation no pipeline Mediator | ✅ |
| 4 | EF Core configs separadas por entidade | ✅ |
| 5 | Frontend 4 camadas com ESLint boundaries | ✅ |
| 6 | React Query para data fetching | ✅ |
| 7 | React Hook Form + Zod para forms | ✅ |
| 8 | Dupla validação (frontend Zod + backend FluentValidation) | ✅ |

---

## 12. Riscos e Mitigações

| # | Risco | Impacto | Probabilidade | Mitigação |
|---|-------|---------|:-------------:|-----------|
| 1 | Regras de negócio não documentadas no legacy | Alto | Média | Reunião funcional com FUNCEF antes de começar cada tab |
| 2 | Comportamento de triggers Oracle diferente em EF Core | Médio | Baixa | Tests de integração com Oracle real em Docker |
| 3 | Pacotes FUNCEF em GitHub Packages com auth | Baixo | Média | Documentar PAT em SETUP.md, `nuget.config` configurado |
| 4 | Performance da árvore hierárquica com muitas contas | Médio | Baixa | Paginação server-side, lazy loading de nós |
| 5 | Diferenças de máscara de código entre planos | Médio | Média | Validação dinâmica conforme máscara do plano selecionado |
| 6 | `SegregaVirtual` varia por empresa | Baixo | Baixa | Endpoint `GET /api/paramglobal/{idEmpresa}` já implementado |

---

## 📚 Documentação Relacionada

| Documento | Localização | Conteúdo |
|-----------|-------------|----------|
| README principal | [`README.md`](../README.md) | Visão geral do projeto |
| Getting Started | [`GETTING-STARTED.md`](../GETTING-STARTED.md) | Guia rápida de início |
| Manual de Usuário | [`MANUAL-USUARIO.md`](./MANUAL-USUARIO.md) | Documentação funcional detalhada por tab |
| Guia de Setup | [`SETUP.md`](./SETUP.md) | Configuração completa do ambiente |
| README Backend | [`backend/README.md`](../backend/README.md) | Documentação técnica do backend |
| README Frontend | [`frontend/README.md`](../frontend/README.md) | Documentação técnica do frontend |
| Código Delphi origem | [`FCadContasContabMT.pas`](../../poc-funcef/CONTAB/FontesMT/FCadContasContabMT.pas) | Implementação original em Delphi 5 |

---

## 📅 Histórico de Versões

| Versão | Data | Alterações |
|--------|------|------------|
| 1.0 | 28-set-2026 | Versão inicial do roadmap. Documenta as 13 fases de migração, mapeamento Delphi → .NET/React, regras de negócio, endpoints, base de dados, estado por tab, pendentes e critérios de aceitação. |

---

> **Nota:** Este roadmap foca exclusivamente na tela **`FCadContasContabMT`** (Cadastro de Contas Contábeis). A migração de outras telas do módulo Contábil será documentada em roadmaps separados quando suas respectivas POCs forem iniciadas.

---

**Status:** 🟡 Em progresso
**Progresso geral:** ~85% (11 de 13 fases concluídas)
**Última atualização:** 2026-09-28