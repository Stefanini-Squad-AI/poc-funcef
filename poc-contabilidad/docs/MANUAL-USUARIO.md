# Manual de Usuario — Cadastro de Contas Contábeis (POC)

> **Migración de:** `frmCadContasContabMT` (Delphi 5) → .NET 10 + React 19 + Oracle 23
> **Estado:** Documento incremental — se actualiza a medida que se ajusta el frontend.
> **Versión:** 1.4 (18-sep-2026)

---

## Tabla de Contenidos

1. [Requisitos Previos](#1-requisitos-previos)
2. [Acceso a la Pantalla](#2-acceso-a-la-pantalla)
3. [Estructura del Formulario](#3-estructura-del-formulario)
4. [Tab 1: Informações Gerais](#4-tab-1-informações-gerais)
5. [Tab 2: Sub-Grupos & Moedas](#5-tab-2-sub-grupos--moedas)
6. [Tab 3: Conta x C.Custo](#6-tab-3-conta-x-ccusto)
7. [Tab 4: Conta x Sub-Conta](#7-tab-4-conta-x-sub-conta)
8. [Tab 5: Árvore de Contas Contábeis](#8-tab-5-árvore-de-contas-contábeis)
9. [Tab 6: Detalhes](#9-tab-6-detalhes)
10. [Reglas de Negocio (Comportamiento Automático)](#10-reglas-de-negocio-comportamiento-automático)
11. [Validaciones del Sistema](#11-validaciones-del-sistema)
12. [Glosario](#12-glosario)

---

## 1. Requisitos Previos

- Backend ejecutándose en `http://localhost:5000`
- Frontend ejecutándose en `http://localhost:3000`
- Al menos un **Plano Contábil** cadastrado en la base de datos (ej: Plano 1 — "Plano Padrão")
- Usuario autenticado en el sistema

---

## 2. Acceso a la Pantalla

1. Iniciar sesión en el sistema (`http://localhost:3000`)
2. En el menú lateral, navegar a **Contabilidade → Contas Contábeis**
3. Se mostrará la lista de contas contábeis existentes
4. Hacer clic en el botón **"Nova Conta"** para abrir el formulario de cadastro

---

## 3. Estructura del Formulario

El formulario está organizado en **6 pestañas** (tabs), equivalentes a los TabSheets del Delphi:

| # | Pestaña | Equivalente Delphi | Descripción |
|---|---------|-------------------|-------------|
| 1 | Informações Gerais | TabSheet1 | Datos principales de la cuenta |
| 2 | Sub-Grupos & Moedas | TabSheet3 | Sub-grupos y conversión de moneda |
| 3 | Conta x C.Custo | TabSheet4 | Asociación con centros de costo |
| 4 | Conta x Sub-Conta | TabSheet5 | Asociación con sub-contas |
| 5 | Árvore de Contas Contábeis | TabSheet2 | Jerarquía visual de cuentas |
| 6 | Detalhes | TabSheet6 | Observaciones y descripciones adicionales |

---

## 4. Tab 1: Informações Gerais

Esta es la pestaña principal donde se registran los datos básicos de la cuenta contable.  
Está dividida en **3 secciones**: Identificação, Parâmetros y Segregação.

### 4.1 Seção: Identificação da Conta

#### Fila 1: Plano | Código | Grau | Tipo | Grupo | Cód.Reduzido

| Campo | Tipo | Obligatorio | Descripción | Comportamiento |
|-------|------|:-----------:|-------------|----------------|
| **Plano Contábil** | Dropdown | ✅ Sí | Plano al que pertenece la cuenta | Lista cargada dinámicamente desde la BD (endpoint `/api/planoscontabeis`). Formato: `ID - Nome` |
| **Código** | Texto | ✅ Sí | Código jerárquico de la cuenta | Formato con puntos: `1`, `1.1`, `1.1.1`, `1.1.1.01`. **Al salir del campo**, el sistema calcula automáticamente el **Grau** (nivel) |
| **Grau** | Numérico | ✅ Sí | Nivel jerárquico de la cuenta | **Read-only**. Se calcula automáticamente: `1` → grau 1, `1.1` → grau 2, `1.1.1.01` → grau 4 |
| **Tipo** | Radio | ✅ Sí | Sintética o Analítica | **Se auto-completa**: si grau = 1 → Sintética; si grau = grau máximo del plano → Analítica. El usuario puede cambiarlo manualmente |
| **Grupo** | Dropdown | ✅ Sí | Grupo contable de la cuenta | Valores: Ativo(A), Passivo(P), Receita(R), Despesa(D), Custo(C), Outros(O), Estatística(E), Patrimônio Social(S). **Al seleccionar**, auto-completa **Natureza** |
| **Cód.Reduzido** | Numérico | ✅ Sí | Código reducido numérico | Ej: `102`. Debe ser mayor que 0 |

#### Fila 2: Natureza

| Campo | Tipo | Obligatorio | Descripción | Comportamiento |
|-------|------|:-----------:|-------------|----------------|
| **Natureza** | Radio | No | Devedora(D), Credora(C), Devedora ou Credora(N) | **Se auto-completa** al seleccionar Grupo. El usuario puede sobrescribir, pero el sistema valida consistencia al guardar |

**Mapa Grupo → Natureza (auto-complete):**

| Grupo | Natureza automática |
|-------|:-------------------:|
| A (Ativo) | D (Devedora) |
| P (Passivo) | C (Credora) |
| R (Receita) | C (Credora) |
| D (Despesa) | D (Devedora) |
| C (Custo) | D (Devedora) |
| O (Outros) | N (Neutra) |
| E (Estatística) | N (Neutra) |
| S (Patrimônio Social) | C (Credora) |

#### Fila 3: Descrição em Português | Conta Correspondente

| Campo | Tipo | Obligatorio | Descripción |
|-------|------|:-----------:|-------------|
| **Descrição em Português** | Texto | ✅ Sí | Nombre de la cuenta en portugués. Máx 100 caracteres |
| **Conta Correspondente** | Texto | No | Código de cuenta correspondiente en otro sistema |

#### Fila 4: Descrição em outro Idioma

| Campo | Tipo | Obligatorio | Descripción |
|-------|------|:-----------:|-------------|
| **Descrição em outro Idioma** | Texto | No | Nombre de la cuenta en otro idioma (inglés/español). Máx 100 caracteres |

### 4.2 Seção: Parâmetros

Checkboxes organizados en 2 columnas:

#### Columna Izquierda

| Checkbox | Descripción | Default |
|----------|-------------|:-------:|
| **Lista em ordem alfabética** | La cuenta aparece en listados ordenados alfabéticamente. **Se deshabilita** cuando Tipo = Analítica | ❌ |
| **Obriga Centro de Custo** | La cuenta exige asociación con centro de costo. **Se deshabilita** cuando Tipo = Sintética | ❌ |
| **Permite movimentação pela Contabilidade** | Permite lanzamientos manuales | ✅ |
| **Inativa** | Marca la cuenta como inactiva (no admite nuevos lanzamientos) | ❌ |
| **Concilia** | La cuenta participa de conciliación bancaria | ❌ |
| **Imprime no Rel. de Evolução das Contas** | Aparece en el reporte de evolución | ✅ |

#### Columna Derecha

| Checkbox / Campo | Descripción | Default |
|-------------------|-------------|:-------:|
| **Obriga Sub-Conta / Contas Auxiliares** | Exige sub-conta para lanzamientos | ❌ |
| **Sumarizar Lançamentos no Diário e Razão** | Sumariza lanzamientos en diario/razão | ❌ |
| **Altera Patrimônio Líquido** | La cuenta afecta el PL | ❌ |
| **Conta Padrão da Secretaria** | Cuenta padrão para uso de secretaría | ❌ |
| **Bloqueada até:** (fecha) | Fecha hasta la cual la cuenta está bloqueada | — |
| **Conta Estatística com Movimento** | Cuenta estadística con movimiento | ❌ |

#### Segreg. Investimento (antiga) — Rateio

Radio group con **3 opciones** (migrado de `rdgRateio` en Delphi, campo `PLARATEIOAP`).
Define el rol de la cuenta en el rateo de segregación de inversión:

| Valor | Opción | Descripción |
|:-----:|--------|-------------|
| **N** | Conta para Rateio | La cuenta **recibe** el rateo de segregación de inversión |
| **S** | Conta Base de Rateio | La cuenta es la **base** sobre la cual se calcula el rateo (**default**) |
| **R** | Conta Não Processada | La cuenta **no se procesa** en el rateo de segregación |

**Valor por defecto:** `S` (Conta Base de Rateio) — ya viene pre-seleccionado al abrir el formulario.

#### Nome do Rateio

Dropdown (migrado de `dblkRateioPlanoPatro` en Delphi, campo `IDRATADMPLANPATRO`).
Selecciona la configuración de rateio administrativo por plano/patrocinadora.

| Atributo | Valor |
|----------|-------|
| **Tipo** | Dropdown (select) |
| **Obligatorio** | ❌ |
| **Default** | Ninguno (vacío) |
| **Backend** | `GET /api/rateiosplanopatro` |
| **Tabla Oracle** | `RATADMPLANPATRO` |
| **Campo** | `IDRATADMPLANPATRO` (FK) |

**Datos de ejemplo (seed):**

| ID | Descrição | Plano Prev. | Patrocinadora | Ativo |
|----|-----------|-------------|---------------|-------|
| 1 | Rateio Padrão RPPS | 1 | 1 | ✅ |
| 2 | Rateio Patrocinadora Única | 1 | 2 | ✅ |
| 3 | Rateio Plano de Pensão | 2 | 1 | ✅ |
| 4 | Rateio Misto RPPS/PPS | 2 | 2 | ✅ |
| 5 | Rateio Inativo | 1 | 3 | ❌ |

> **Regla de habilitación (Delphi `SegregaVirtual`):** Cuando la segregación es virtual (`SegregaVirtual = true`), el radio group "Segreg. Investimento" y el dropdown "Rateio por Plano/Patro" se deshabilitan, y en su lugar se habilitan los dropdowns "Critério para Segreg. de Recursos" y "Programa do Critério". Por defecto `SegregaVirtual = false` (configurable por empresa).

### 4.3 Seção: Segregação de Recursos

Esta sección contiene los dropdowns de criterio y programa, la cuenta extracontábil y el flag de uso PGA.

#### Critério para Segreg. de Recursos

Dropdown (migrado de `dblkSegregacao` en Delphi, campo `IDSEGREGACRITER`).
Selecciona el criterio de segregación de recursos.

| Atributo | Valor |
|----------|-------|
| **Tipo** | Dropdown (select) |
| **Obligatorio** | ❌ |
| **Default** | Ninguno (vacío) |
| **Backend** | `GET /api/segregacoescriter` |
| **Tabla Oracle** | `SEGREGACRITER` |
| **Campo** | `IDSEGREGACRITER` (FK) |
| **Habilitación** | Solo habilitado cuando `SegregaVirtual = true` |

**Origen legacy:** `cdsSegregaCiter.Data := CtrlSegregacao.ListaSegregaCiter` (FCadContasContabMT.pas línea 379)

**Datos de ejemplo (seed):**

| ID | Descrição | Ordem | Tipo Segrega | Tipo Cotação |
|----|-----------|:-----:|:------------:|:------------:|
| 1 | Segregação por Plano de Previdência | 1 | P | Q |
| 2 | Segregação por Patrocinadora | 2 | A | Q |
| 3 | Segregação por Unidade Negócio | 3 | U | Q |
| 4 | Segregação por Plano e Patrocinadora | 4 | M | Q |

#### Programa do Critério

Dropdown (migrado de `cboPrograma` en Delphi, campo `IDPROGRAMA`).
Selecciona el programa asociado al criterio de segregación.

| Atributo | Valor |
|----------|-------|
| **Tipo** | Dropdown (select) |
| **Obligatorio** | ❌ |
| **Default** | Ninguno (vacío) |
| **Backend** | `GET /api/programas` |
| **Tabla Oracle** | `PROGRAMA` |
| **Campo** | `IDPROGRAMA` (FK) |
| **Habilitación** | Solo habilitado cuando `SegregaVirtual = true` |

**Origen legacy:** `SqlPrograma: SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2` (DFM línea 1821)

**Datos de ejemplo (seed):**

| ID | Descrição |
|----|-----------|
| 1 | Programa de Previdência Social |
| 2 | Programa de Assistência Social |
| 3 | Programa de Saúde |
| 4 | Programa de Educação |
| 5 | Programa de Habitação |

#### Conta Extracontábil

Campo de texto con botón de lookup (migrado de `edtContaExtracontab` en Delphi, campo `PLAEXTRACONTABIL`).

#### Uso PGA

Checkbox (migrado de `chkUsoExcPga` en Delphi, campo `FLGUSOEXCPGA`).
Indica uso exclusivo PGA. En Delphi usa `ValueChecked=I`, `ValueUnchecked=A`.

### 4.4 Seção: Segregação

Campos de texto con botón de lookup (linterna):

| Campo | Descripción |
|-------|-------------|
| **Conta para Segregação dos Planos** | Cuenta para segregación entre planos |
| **Conta para Aglutinação** | Cuenta para aglutinación |
| **Segregação Fundo Adm. - Crédito** | Cuenta de segregación de fondo admin — crédito |
| **Segregação Fundo Adm. - Débito** | Cuenta de segregación de fondo admin — débito |

---

## 5. Tab 2: Sub-Grupos & Moedas

### 5.1 Seção: Sub-Grupos

| Campo | Tipo | Descripción |
|-------|------|-------------|
| **Sub-Grupo 1** | Dropdown | Identificador del sub-grupo 1 (tabla `SUBGRUPO`, endpoint `GET /api/subgrupos`) |
| **Sub-Grupo 2** | Dropdown | Identificador del sub-grupo 2 |
| **Sub-Grupo 3** | Dropdown | Identificador del sub-grupo 3 |
| **Sub-Grupo 4** | Dropdown | Identificador del sub-grupo 4 |

**Datos de ejemplo (seed):**

| ID | Descrição |
|----|-----------|
| 1 | Circulante |
| 2 | Não Circulante |
| 3 | Realizável a Longo Prazo |
| 4 | Permanente |
| 5 | Investimentos |
| 6 | Imobilizado |
| 7 | Intangível |
| 8 | Diferido |

### 5.2 Seção: Tipo de Conversão Padrão

Esta sección contiene 4 dropdowns que controlan el tipo de conversión de moeda de la cuenta. **Cada combo se habilita o deshabilita automáticamente** según la configuración global de moedas de la empresa (ver Regla 7 abajo).

| Campo | Tipo | Descripción | Opciones | Habilitación |
|-------|------|-------------|----------|--------------|
| **Moeda Oficial** | Dropdown | Conversión a moeda oficial | 5 opciones (ver abajo) | Habilitado si `MOEDAOFICIAL ≠ 0` en `PARAMGLOBAL` |
| **Moeda Gerencial 1** | Dropdown | Conversión a moeda gerencial 1 | 5 opciones | Habilitado si `MOEDAGERENCIAL ≠ 0` |
| **Moeda Gerencial 2** | Dropdown | Conversión a moeda gerencial 2 | 5 opciones | Habilitado si `MOEDAGEREN1 ≠ 0` |
| **Moeda Gerencial 3** | Dropdown | Conversión a moeda gerencial 3 | 5 opciones | Habilitado si `MOEDAGEREN2 ≠ 0` |

**Opciones de conversión (5 valores):**

| Valor | Descripción |
|:-----:|-------------|
| **N** | Não Converte (valor por defecto) |
| **H** | Histórico Médio |
| **D** | Diário |
| **C** | Moeda Corrente do Último Dia |
| **M** | Manual |

**Label dinámica:** Cuando el combo está habilitado, la label muestra la sigla de la moeda configurada. Ejemplo: si `MOEDAOFICIAL = 1` y la moeda 1 tiene sigla "R$", la label se muestra como **"Moeda Oficial (R$)"**.

**Comportamiento cuando está deshabilitado:** El combo aparece atenuado (opacity 50%), no se puede interactuar, y el valor se mantiene como `'N'` (Não Converte).

**Normalización automática al guardar:** Si el usuario deja cualquier combo vacío o null, el sistema lo normaliza automáticamente a `'N'` (Não Converte) antes de guardar. Esto replica el comportamiento del `CmeCadastroBeforeConfirma` en el legacy (líneas 1448-1458).

### 5.3 Seção: Moeda Histórica

| Campo | Tipo | Descripción |
|-------|------|-------------|
| **Moeda** | Dropdown | Moeda asociada a la cuenta (tabla `MOEDA`, endpoint `GET /api/moedas`). Formato: `Descrição (Sigla)` |
| **Contra Partida** | Texto + Lookup | Cuenta de contrapartida para conversión. Botón de lookup abre dialog de búsqueda de cuentas analíticas activas |

**Datos de ejemplo (seed) de moedas:**

| ID | Descrição | Sigla |
|----|-----------|-------|
| 1 | Real | R$ |
| 2 | Dólar Americano | US$ |
| 3 | Euro | € |

### 5.4 Seção: Taxa de Juros para Correção

| Campo | Tipo | Descripción | Validación |
|-------|------|-------------|------------|
| **Percentual (a.m.)** | Numérico | Tasa de juros mensual para corrección | 0 a 100. Si > 0, **Contrapartida** es obligatoria |
| **Contra Partida** | Texto + Lookup | Cuenta de contrapartida para juros | Obligatoria si Percentual > 0 |

---

## 6. Tab 3: Conta x C.Custo

> **Estado:** ✅ Implementado — funcionalidad migrada del legacy Delphi (FCadContasContabMT.pas → CdsContasxCC).

Esta pestaña permite asociar la cuenta contable con uno o más centros de costo (C.Custo) mediante un patrón de lista dual (dual-list).

### 6.1 Habilitación

La pestaña solo está habilitada cuando el campo **Aceita C.Custo** (`PLACCUST = 'S'`) está marcado en la cuenta contable. Si no está marcado, la pestaña muestra un mensaje informativo y permanece deshabilitada.

### 6.2 Layout: Lista Dual (Dual-List)

| Componente | Descripción |
|------------|-------------|
| **Grid Izquierdo (Disponíveis)** | Centros de custo disponibles (no asociados a la cuenta). Tabla `CENTCUST` filtrada por `IDPESSOA = IdEmpresa` y `ATIVO = 'S'`, excluyendo los ya asociados en `CONTASXCC`. |
| **Grid Derecho (Associados)** | Centros de custo ya asociados a la cuenta. Tabla `CONTASXCC` con join a `CENTCUST` para mostrar nombre y tipo. |
| **Botão >> (Associar Todos)** | Associa todos los C.Custos **analíticos** disponibles. Sintéticos son bloqueados. |
| **Botão > (Associar Selecionados)** | Associa los C.Custos seleccionados en el grid izquierdo. Valida que no sean sintéticos. |
| **Botão < (Desassociar Selecionados)** | Desassocia los C.Custos seleccionados en el grid derecho. |
| **Botão << (Desassociar Todos)** | Desassocia todos los C.Custos asociados. Pide confirmación. |

### 6.3 Columnas de los Grids

| Columna | Descripción |
|---------|-------------|
| **Checkbox** | Selección individual para mover con > o < |
| **Cód.** | Código del centro de custo (`CODCENTROCUSTO`) |
| **Nome** | Nombre del centro de custo (`NOME`) |
| **Tipo** | Badge: **Analítico** (verde, `STATUSGRUPOCDC = 'A'`) o **Sintético** (naranja, `STATUSGRUPOCDC = 'S'`) |
| **Cód. Externo** | Código externo (`CODEXTERNO`) |

### 6.4 Regla de Negocio: Sintéticos

Los centros de custo **Sintéticos** (`STATUSGRUPOCDC = 'S'`) **no pueden ser asociados** a cuentas contables. Al intentar asociar un sintético, el sistema muestra el error:

> "Centros de Custo Sintéticos não podem ser relacionados a contas contábeis: [Nome]"

El botão **>>** (Associar Todos) solo asocia los analíticos, ignorando los sintéticos.

### 6.5 Endpoints de la API

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| `GET` | `/api/centroscusto?idEmpresa={id}&plano={p}&placConta={c}` | Retorna C.Custos disponibles (no asociados a la cuenta) |
| `GET` | `/api/contasxcc?idEmpresa={id}&plano={p}&placConta={c}` | Retorna C.Custos asociados a la cuenta |
| `POST` | `/api/contasxcc/associate` | Associa C.Custos. Body: `{ plano, placConta, idEmpresa, idUsuarioInclusao, codCentrosCusto: [] }`. Lista vacía = todos los analíticos. |
| `POST` | `/api/contasxcc/disassociate` | Desassocia C.Custos. Body: `{ plano, placConta, idEmpresa, codCentrosCusto: [] }`. Lista vacía = todos. |

### 6.6 Tablas Oracle

| Tabla | PK | Descripción |
|-------|-----|-------------|
| `CENTCUST` | `(IDPESSOA, CODCENTROCUSTO)` | Maestro de centros de custo. `STATUSGRUPOCDC`: A=Analítico, S=Sintético. |
| `CONTASXCC` | `IDCONTACC` (seq `SEQ_CONTASXCC`, trigger `TRG_BI_CONTASXCC`) | Relación cuenta × C.Custo. Columnas: `PLANO`, `PLACONTA`, `CODCENTROCUSTO`, `DTINCLUSAO`, `IDEMPRESA`, `IDUSUARIOINCLUSAO`. |

---

## 7. Tab 4: Conta x Sub-Conta

> **Estado:** Placeholder — funcionalidad pendiente de implementación.

Esta pestaña permitirá asociar la cuenta contable con sub-contas / contas auxiliares.

---

## 8. Tab 5: Árvore de Contas Contábeis

> **Estado:** Placeholder — funcionalidad pendiente de implementación.

Esta pestaña mostrará la jerarquía visual (árbol) de las cuentas contables del plano seleccionado.

---

## 9. Tab 6: Detalhes

### 9.1 Seção: Descrição/Observações

| Campo | Tipo | Descripción |
|-------|------|-------------|
| **Descrição/Observações** | Textarea | Observaciones generales sobre la cuenta. Máx 1000 caracteres |

---

## 10. Reglas de Negocio (Comportamiento Automático)

Estas son las reglas que el sistema ejecuta automáticamente, migradas del código Delphi:

### Regla 1: Código → Grau (automático)

- **Evento:** Al escribir/salir del campo **Código**
- **Acción:** El sistema cuenta los puntos (`.`) en el código para determinar el grau
- **Ejemplos:**
  - `1` → Grau = 1
  - `1.1` → Grau = 2
  - `1.1.1` → Grau = 3
  - `1.1.1.01` → Grau = 4
- **Campo Grau:** Es **read-only** — el usuario no puede editarlo manualmente

### Regla 2: Grau → Tipo (automático)

- **Evento:** Al calcular el Grau (consecuencia de Regla 1)
- **Acción:**
  - Si **Grau = 1** → Tipo se establece en **Sintética**
  - Si **Grau = grau máximo del plano** (calculado desde la máscara) → Tipo se establece en **Analítica**
  - Para graus intermedios, el usuario puede elegir manualmente
- **Ejemplo:** Plano con máscara `9.99.99.99` (4 niveles)
  - Código `1` (grau 1) → Sintética
  - Código `1.1` (grau 2) → Usuario elige
  - Código `1.1.1` (grau 3) → Usuario elige
  - Código `1.1.1.01` (grau 4 = máximo) → Analítica

### Regla 3: Grupo → Natureza (automático)

- **Evento:** Al seleccionar un valor en el dropdown **Grupo**
- **Acción:** El sistema auto-completa **Natureza** según el mapa:
  - A → D, P → C, R → C, D → D, C → D, O → N, E → N, S → C
- **Nota:** El usuario puede cambiar la Natureza manualmente después, pero el sistema validará la consistencia al guardar

### Regla 4: Tipo → Habilitación de checkboxes (grpTipoClick)

- **Evento:** Al seleccionar **Tipo** (Sintética o Analítica)
- **Origen legacy:** `grpTipoClick` (FCadContasContabMT.pas líneas 986-999)
- **Acción:**
  - Si **Tipo = Sintética (S)**:
    - ✅ Habilita checkbox **"Lista em ordem alfabética"**
    - ❌ Deshabilita checkbox **"Obriga Centro de Custo"** → su valor se resetea a `false`
  - Si **Tipo = Analítica (A)**:
    - ❌ Deshabilita checkbox **"Lista em ordem alfabética"** → su valor se resetea a `false`
    - ✅ Habilita checkbox **"Obriga Centro de Custo"**
- **Comportamiento complementar:** Cuando un checkbox pasa a estar deshabilitado por el cambio de Tipo, su valor se resetea automáticamente a `false`. Esto evita que queden checkboxes marcados en estado deshabilitado.

### Regla 5: SegregaVirtual → Habilitación de campos (SegregaVirtual)

**¿Qué es?** `SegregaVirtual` es un parámetro de configuración del sistema, definido **por empresa** (cliente). Determina **qué modo de segregación de recursos** está disponible en el formulario. Existen dos modos mutuamente excluyentes:

| Modo | `SegregaVirtual` | Descripción |
|------|:----------------:|-------------|
| **Rateio (antiguo)** | `false` | Usa el radio group "Segreg. Investimento" + dropdown "Rateio por Plano/Patro" |
| **Segregação (nuevo)** | `true` | Usa los dropdowns "Critério para Segreg. de Recursos" + "Programa do Critério" |

**¿De dónde viene el valor en el sistema legacy?**

El flujo completo en el sistema Delphi es:

1. **Al iniciar sesión**, el usuario selecciona una **empresa** (cliente). Esa empresa se guarda en `Sistema.IdEmpresa`.
2. **Al abrir la pantalla de Cadastro de Contas Contábeis** (`FormCreate`), el código ejecuta:
   ```
   CtrlSegregacao.GetParams(Sistema.IdEmpresa);
   ```
3. `GetParams` hace una consulta SQL a la tabla **`PARAMGLOBAL`**:
   ```sql
   SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = <Sistema.IdEmpresa>
   ```
4. Lee la columna **`FLGSEGREGAVIRTUAL`** (valor `'S'` o `'N'`):
   ```
   FSegregaVirtual := (_Cds.FieldByName('FLGSEGREGAVIRTUAL').AsString = 'S');
   ```
5. Con ese valor, habilita/deshabilita los campos del formulario (líneas 380-383):
   ```pascal
   rdgRateio.Enabled            := not CtrlSegregacao.SegregaVirtual;
   dblkRateioPlanoPatro.Enabled := not CtrlSegregacao.SegregaVirtual;
   dblkSegregacao.Enabled       := CtrlSegregacao.SegregaVirtual;
   cboPrograma.Enabled          := CtrlSegregacao.SegregaVirtual;
   ```

**Resumen del flujo:**

```
Usuario selecciona empresa al login
        ↓
Sistema.IdEmpresa = <ID de la empresa>
        ↓
CtrlSegregacao.GetParams(IdEmpresa)
        ↓
SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = IdEmpresa
        ↓
FLGSEGREGAVIRTUAL = 'S' o 'N'
        ↓
Habilita/deshabilita campos del formulario
```

**¿Cómo funciona en la pantalla?**

- **Cuando `SegregaVirtual = false`** (modo Rateio, valor por defecto):
  - El usuario puede seleccionar el radio group **"Segreg. Investimento (antiga)"** (Conta para Rateio / Conta Base / Conta Não Processada)
  - El usuario puede seleccionar el dropdown **"Rateio por Plano/Patro"**
  - Los dropdowns **"Critério"** y **"Programa"** aparecen bloqueados (atenuados, no se puede hacer clic)

- **Cuando `SegregaVirtual = true`** (modo Segregação):
  - El radio group **"Segreg. Investimento"** y el dropdown **"Rateio por Plano/Patro"** aparecen bloqueados
  - El usuario puede seleccionar **"Critério para Segreg. de Recursos"** y **"Programa do Critério"**

**¿Cómo probar en esta POC?**

La POC replica el flujo legacy: la tabla `PARAMGLOBAL` existe en Oracle con dos empresas seed, y el backend expone el endpoint `GET /api/paramglobal/{idEmpresa}`. El frontend lee el `idEmpresa` de la variable de entorno `NEXT_PUBLIC_ID_EMPRESA` y consulta el backend al cargar el formulario.

**Empresas disponibles en la base de datos:**

| `IDPESSOA` | `FLGSEGREGAVIRTUAL` | Modo | Efecto en la pantalla |
|:----------:|:-------------------:|------|------------------------|
| 1 | `N` | Rateio (antiguo) | Habilita "Segreg. Investimento" + "Rateio por Plano/Patro" |
| 2 | `S` | Segregação (novo) | Habilita "Critério" + "Programa" |

**Flujo en la POC:**

```
NEXT_PUBLIC_ID_EMPRESA (archivo .env del frontend)
        ↓
GET /api/paramglobal/{idEmpresa}
        ↓
SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = idEmpresa
        ↓
segregaVirtual = true | false
        ↓
Habilita/deshabilita campos del formulario
```

Para probar el modo Segregação:
1. Cambiar `NEXT_PUBLIC_ID_EMPRESA=1` a `NEXT_PUBLIC_ID_EMPRESA=2` en `poc-contabilidad/frontend/.env`
2. Guardar el archivo (Next.js recarga automáticamente)
3. Recargar la página en el navegador

- **Origen legacy:** `FormCreate` (FCadContasContabMT.pas líneas 376-383), `GetParams` (uCtrlParamIntegra.pas línea 440), tabla `PARAMGLOBAL`
- **Backend POC:** `GET /api/paramglobal/{idEmpresa}` → `ParamGlobalController` → `GetParamGlobalQueryHandler`
- **Frontend POC:** `useParamGlobal(idEmpresa)` → `tab-informacoes-gerais.tsx` usa `paramGlobal?.segregaVirtual`

### Regla 6: Cuenta padre Grupo=E → hija Grupo=E

- **Evento:** Al guardar la cuenta (submit del formulario)
- **Acción:** Si la cuenta tiene nivel > 1 (tiene padre), y la cuenta padre tiene Grupo = E (Estatística), entonces la cuenta hija **debe** tener Grupo = E
- **Error:** Si se intenta guardar con Grupo diferente a E, el backend rechaza con: *"Conta pai é Estatística (Grupo E). A conta filha também deve ser Estatística."*

### Regla 7: Configuración contábil de moedas → habilitar/deshabilitar combos de conversión

**¿Qué es?** Los 4 combos de "Tipo de Conversão Padrão" (Moeda Oficial, Moeda Gerencial 1/2/3) se habilitan o deshabilitan automáticamente según la configuración de moedas de la empresa, almacenada en la tabla `PARAMCONTAB`.

**¿De dónde viene la configuración?**

Los parámetros de configuración de moeda están en la tabla `PARAMCONTAB`, en 4 columnas con prefijo `PAC` (Parâmetros Contábeis). En el legacy Delphi, el objeto `CtrlContab` (`TCtrlContab` de `uCtrlContab.pas`) lee estos valores:

| Columna `PARAMCONTAB` | Combo afectado | Campo Delphi |
|------------------------|----------------|--------------|
| `PACMOEDAOFICIAL` | Moeda Oficial | `dbcmbTipOfi` |
| `PACMOEDAGERENCIAL` | Moeda Gerencial 1 | `dbcmbTipGer` |
| `PACMOEDAGEREN1` | Moeda Gerencial 2 | `dbcmbTipGer2` |
| `PACMOEDAGEREN2` | Moeda Gerencial 3 | `dbcmbTipGer3` |

**Regla de habilitación:**
- Si el valor de la columna es `0` → el combo se **deshabilita** (atenuado, no se puede editar)
- Si el valor es diferente de `0` → el combo se **habilita** y la label se actualiza con la sigla de la moeda

**Ejemplo de label dinámica:**
- `PACMOEDAOFICIAL = 1` y moeda 1 tiene sigla "R$" → Label: **"Moeda Oficial (R$)"**
- `PACMOEDAGERENCIAL = 2` y moeda 2 tiene sigla "US$" → Label: **"Moeda Gerencial 1 (US$)"**
- `PACMOEDAGEREN1 = 0` → Combo deshabilitado, Label: **"Moeda Gerencial 2"**

**Configuración en la base de datos:**

| `IDPESSOA` | `PACMOEDAOFICIAL` | `PACMOEDAGERENCIAL` | `PACMOEDAGEREN1` | `PACMOEDAGEREN2` | Combos habilitados |
|:----------:|:-----------------:|:-------------------:|:----------------:|:----------------:|---------------------|
| 1 | 1 | 2 | 0 | 0 | Oficial + Gerencial 1 |
| 2 | 1 | 2 | 3 | 0 | Oficial + Gerencial 1 + Gerencial 2 |

**Flujo en la POC:**

```
NEXT_PUBLIC_ID_EMPRESA (archivo .env del frontend)
        ↓
GET /api/paramcontab/{idEmpresa}
        ↓
SELECT PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
FROM PARAMCONTAB WHERE IDPESSOA = idEmpresa
        ↓
moedaOficial, moedaGerencial, moedaGeren1, moedaGeren2
        ↓
Para cada combo: si valor = 0 → disabled, si ≠ 0 → enabled + label con sigla
```

- **Origen legacy:** `FormShow` (FCadContasContabMT.pas líneas 740-762) — usa `CtrlContab` (`TCtrlContab` de `uCtrlContab.pas`) que lee de `PARAMCONTAB`
- **Backend POC:** `GET /api/paramcontab/{idEmpresa}` → `ParamContabController` → `GetParamContabQueryHandler`
- **Frontend POC:** `useParamContab(idEmpresa)` → `tab-subgrupos-moeda.tsx`

### Regla 8: Normalización de conversión al guardar (empty → 'N')

- **Evento:** Al guardar la cuenta (submit del formulario)
- **Origen legacy:** `CmeCadastroBeforeConfirma` (FCadContasContabMT.pas líneas 1448-1458)
- **Acción:** Si cualquier campo de tipo de conversión (`con;ersaoOficial`, `conversaoGerencial`, `conversaoGerencial2`, `conversaoGerencial3`) está vacío o null, el sistema lo normaliza automáticamente a `'N'` (Não Converte) antes de guardar
- **Implementación frontend:** `z.preprocess()` en `validators.ts` — transforma `null`/`undefined`/`''` → `'N'` antes de la validación
- **Resultado:** Los campos de conversión siempre se guardan con un valor válido (N, H, D, C o M), nunca null o vacío

---

## 11. Validaciones del Sistema

### 11.1 Validaciones Frontend (Zod)

| # | Regla | Mensaje de Error |
|---|-------|-----------------|
| 1 | Plano es obligatorio | "Plano é obrigatório" |
| 2 | Código es obligatorio | "Código é obrigatório" |
| 3 | Código máx 20 caracteres | "Código deve ter no máximo 20 caracteres" |
| 4 | Descrição es obligatoria | "Descrição é obrigatória" |
| 5 | Tipo debe ser S o A | "Tipo deve ser S (Sintética) ou A (Analítica)" |
| 6 | Grupo debe ser válido | "Grupo inválido (A/P/R/D/C/O/E/S)" |
| 7 | Nivel entre 1 y 20 | "Nível deve ser maior que 0" |
| 8 | Código Reduzido > 0 | "Código reduzido é obrigatório" |
| 9 | Grupo ↔ Natureza consistente | "Natureza inconsistente com grupo {X}. Esperado: {Y}" |
| 10 | Sintética não pode ter CC | "Conta sintética não pode aceitar centro de custo" |
| 11 | Nivel 1 → Sintética | "Conta de nível 1 (raiz) deve ser Sintética" |
| 12 | Taxa juros > 0 → contrapartida obligatoria | "Contrapartida de juros é obrigatória quando taxa de juros > 0" |
| 13 | Conversão null/empty → 'N' (normalización) | Automático via `z.preprocess()` — sin mensaje de error |

### 11.2 Validaciones Backend (FluentValidation)

Las mismas validaciones del frontend se replican en el backend con FluentValidation, garantizando doble validación:

| # | Regla | Mensaje de Error |
|---|-------|-----------------|
| 1 | Código no vacío | "Código da Conta Contábil não informado." |
| 2 | Plano > 0 | "Plano Contábil ao qual a Conta pertence não informado." |
| 3 | Grupo válido | "Grupo da Conta não selecionado." |
| 4 | Descrição no vacía | "Nome da Conta não informado." |
| 5 | Tipo S o A | "Tipo deve ser: S=Sintética, A=Analítica." |
| 6 | Natureza D, C o N | "Natureza deve ser: D=Devedora, C=Credora, N=Neutra." |
| 7 | Nivel 1-99 | "Nível (grau) deve estar entre 1 e 99." |
| 8 | Código Reduzido > 0 | "Código reduzido é obrigatório." |
| 9 | Grupo ↔ Natureza consistente | "Natureza inconsistente com o grupo selecionado." |
| 10 | Sintética não pode ter CC | "Conta sintética não pode aceitar centro de custo." |
| 11 | Taxa juros 0-100 | "Taxa de juros deve estar entre 0 e 100." |
| 12 | Cuenta ya existe | "Conta já cadastrada." |
| 13 | Padre Grupo=E → hija Grupo=E | "Conta pai é Estatística (Grupo E). A conta filha também deve ser Estatística." |

---

## 12. Glosario

| Término | Significado |
|---------|-------------|
| **Plano Contábil** | Conjunto de cuentas contables con una máscara de código jerárquico. Ej: Plano 1 con máscara `9.99.99.99` |
| **Código** | Identificador jerárquico de la cuenta. Ej: `1.1.1.01` |
| **Grau (Nivel)** | Nivel jerárquico de la cuenta dentro del plano. Se calcula automáticamente por los puntos del código |
| **Tipo S (Sintética)** | Cuenta que agrupa otras cuentas (no recibe lanzamientos directamente) |
| **Tipo A (Analítica)** | Cuenta final que recibe lanzamientos contables |
| **Grupo** | Clasificación contable: Ativo, Passivo, Receita, Despesa, Custo, Outros, Estatística, Patrimônio Social |
| **Natureza** | Naturaleza del saldo: Devedora (D), Credora (C), Neutra (N) |
| **Código Reduzido** | Código numérico alternativo para acceso rápido a la cuenta |
| **Conta Correspondente** | Código de la cuenta en otro sistema/planos |
| **Segregação** | Mecanismo de segregación de inversiones entre planos |
| **Rateio** | Distribución de valores entre múltiples planos/patrimoniales |
| **Conversão de Moeda** | Tipo de conversión: Não Converte (N), Histórico Médio (H), Diário (D), Moeda Corrente do Último Dia (C), Manual (M) |

---

## Historial de Versiones

| Versión | Fecha | Cambios |
|---------|-------|---------|
| 1.0 | 17-sep-2026 | Versión inicial. Documenta Tab 1 (Informações Gerais) completo, Tab 2 (Sub-Grupos & Moedas), Tab 6 (Detalhes). Tabs 3, 4, 5 marcados como pendientes. Reglas de negocio y validaciones documentadas. |
| 1.1 | 17-sep-2026 | Corrección sección "Segreg. Investimento (antiga)": 3 opciones (N/S/R) en vez de 2. Cambio de tipo `boolean` a `string` en `aceitaRateio` (frontend + backend). |
| 1.2 | 17-sep-2026 | Implementación del campo "Nome do Rateio" (`dblkRateioPlanoPatro`): tabla `RATADMPLANPATRO`, entity, endpoint `GET /api/rateiosplanopatro`, hook `useRateiosPlanoPatro`, dropdown en el formulario. Fix: defaults pre-seleccionados (NativeSelect → Controller). Fix: bug EF config `IDRATPLANOADM` → `IDRATADMPLANPATRO`. |
| 1.3 | 17-sep-2026 | Implementación de dropdowns "Critério para Segreg. de Recursos" (`SEGREGACRITER`, endpoint `GET /api/segregacoescriter`) y "Programa do Critério" (`PROGRAMA`, endpoint `GET /api/programas`). Implementación de regla `grpTipoClick` (Sintética/Analítica → habilita/deshabilita checkboxes). Implementación de regla `SegregaVirtual` (habilita/deshabilita rateio vs segregación). Sección 4.3 reorganizada en "Segregação de Recursos" + "Segregação". |

| 1.4 | 18-sep-2026 | Implementación de Sub-Grupos (dropdown `SUBGRUPO`, endpoint `GET /api/subgrupos`) y Moeda Histórica (dropdown `MOEDA`, endpoint `GET /api/moedas`). Botones de lookup (ContaLookup) para Contra Partida de Juros. Regla 7: combos de conversão habilitados/deshabilitados según config global de moedas (`PARAMGLOBAL.MOEDAOFICIAL`, `MOEDAGERENCIAL`, `MOEDAGEREN1`, `MOEDAGEREN2`). Regla 8: normalización automática de conversão vacía → 'N' via `z.preprocess()`. Labels dinámicos con sigla de moeda (ej: "Moeda Oficial (R$)"). |

| 1.5 | 18-sep-2026 | **Corrección importante:** Regla 7 movida de `PARAMGLOBAL` a `PARAMCONTAB`. En el legacy Delphi, `CtrlContab` (`TCtrlContab` de `uCtrlContab.pas`) lee las columnas `PACMOEDAOFICIAL`, `PACMOEDAGERENCIAL`, `PACMOEDAGEREN1`, `PACMOEDAGEREN2` de la tabla `PARAMCONTAB` (con prefijo PAC), NO de `PARAMGLOBAL`. Creada entidad `ParamContab`, DTO `ParamContabResponse`, endpoint `GET /api/paramcontab/{idEmpresa}`, hook `useParamContab`. Quitados los 4 campos de moeda de `ParamGlobal` (entity, config, DTO, handler, SQL). |

| 1.6 | 18-sep-2026 | **Tab 3: Conta x C.Custo — migración completa.** Implementación del patrón dual-list migrado de `FCadContasContabMT.pas` → `CdsContasxCC`. Backend: entidades `CentroCusto` (CENTCUST) y `ContasxCC` (CONTASXCC), EF configs, DTOs, queries (`GetCentrosCusto`, `GetContasxCC`), commands (`Associate`, `Disassociate`), controllers (`GET /api/centroscusto`, `GET /api/contasxcc`, `POST /api/contasxcc/associate`, `POST /api/contasxcc/disassociate`). Frontend: hooks `useCentrosCusto`, `useContasxCC`, `useAssociateContasxCC`, `useDisassociateContasxCC`; componente `tab-centro-custo.tsx` con grids de disponibles/asociados, 4 botões (>>, >, <, <<), validación de sintéticos. Trigger Oracle `TRG_BI_CONTASXCC` para auto-generar `IDCONTACC` via `SEQ_CONTASXCC`. Regla: solo analíticos pueden ser asociados; sintéticos bloqueados con mensaje de error. Tab habilitada solo cuando `PLACCUST='S'`. |

---

> **Nota:** Este es un documento **incremental**. Se actualizará a medida que se implementen nuevas funcionalidades en el frontend. Las secciones marcadas como *"Placeholder — funcionalidad pendiente de implementación"* serán completadas en futuras versiones.