# Dúvidas sobre as "telas" do Contábil (113) e do Empréstimo (422)

> **Issue:** PFC-7 — Análise FUNCEF Empréstimos
> **Data:** 30/09/2026
> **Autor:** Levantamento automatizado sobre o repositório legacy (Delphi 5)

---

## Resumo executivo

A documentação do FUNCEF diz que o módulo **Contábil** tem **113 telas** e o módulo
**Empréstimo** tem **422**. As três perguntas do stakeholder são:

1. **Essas telas são arquivos `.dfm`?** — Sim, todas. Tanto os 113 quanto os 422 são
   arquivos `.dfm` (Delphi Form Module).
2. **O Empréstimo tem mesmo 422 telas?** — Sim, o número está correto: 422 arquivos
   `.dfm` distribuídos em quatro pastas. Mas "422 telas" é, na verdade, "422 arquivos
   `.dfm`" — e nem todos são telas que o usuário vê.
3. **O usuário precisa interagir com todas?** — Não. Do total, **muitos arquivos `.dfm`
   não são telas**, mas sim componentes não-visuais (data modules e objetos de negócio).

### Números finais (AC4)

| Módulo | Total de `.dfm` contados | Telas que o usuário realmente interage | Não-visuais (o usuário nunca vê) |
|--------|--------------------------|---------------------------------------|----------------------------------|
| **Contábil** | **113** | **112** | 1 |
| **Empréstimo** | **422** | **295** | 127 |

**O que isso significa para a migração:** O Contábil tem 112 telas reais para migrar
(1 arquivo a menos é um data module invisível). O Empréstimo tem **295 telas reais**, não
422 — os outros 127 arquivos `.dfm` são data modules e objetos de negócio que armazenam
configurações em tempo de design e nunca aparecem para o usuário. Dimensionar a migração
por 422 superestima o esforço de interface em ~43%.

---

## 1. Módulo Contábil — de onde vem o 113? (AC1)

### 1.1 Pasta contada

O número **113** corresponde exclusivamente aos arquivos `.dfm` da pasta
`CONTAB/FontesMT`. Todos os 113 arquivos são `.dfm`.

```
CONTAB/FontesMT/  →  113 arquivos .dfm  ← contados como "113 telas"
```

Isso está documentado em:

- `docs/system-overview.html` (linha 199): *"113 Forms Contábil"*
- `docs/system-overview.html` (linha 257): *"Forms/DFM ≈ 113"*
- `docs/site/modules/contab/index.html` (linha 211): *"Inventário funcional das 113
  telas"* — inventário exaustivo com título, processo e finalidade de cada arquivo.

### 1.2 Outros arquivos `.dfm` do módulo que NÃO entram no 113

A pasta `CONTAB` possui **229 arquivos `.dfm`** no total. Além dos 113 de `FontesMT`,
existem **116 arquivos `.dfm`** em outras subpastas que **não foram contados**:

| Pasta | `.dfm` | Tipo (classe raiz) | Por que ficou de fora |
|-------|--------|--------------------|-----------------------|
| `CONTAB/Reports/Source` | 110 | 57 `Trpt` (layouts de relatório) + 53 `Tfrm` (forms) | Layouts de relatório ReportBuilder e forms de filtro de relatório; não são telas do menu principal |
| `CONTAB/Fontes` | 4 | 2 `Tfrm` + 1 `Tdtm` + 1 `Trpt` | Forms auxiliares, data module e layout de relatório do DPR principal |
| `CONTAB/CtrlObjects` | 1 | 1 `Tfrm` | Controller (lógica de negócio) |
| `CONTAB/DbObjects` | 1 | 1 `Tfrm` | Objeto de acesso a dados |
| **Total excluído** | **116** | | |
| **Total do módulo** | **229** | | 113 contados + 116 excluídos |

**Conclusão AC1:** O 113 conta apenas os `.dfm` de `CONTAB/FontesMT`. Todos os 113 são
arquivos `.dfm`. Outros 116 arquivos `.dfm` existem no módulo (principalmente em
`CONTAB/Reports/Source`) mas foram deixados de fora do total.

---

## 2. Módulo Empréstimo — de onde vem o 422? (AC2)

### 2.1 Confirmação do 422

O número **422** está **correto**. É a soma dos arquivos `.dfm` de quatro pastas:

| Pasta | `.dfm` |
|-------|--------|
| `EMPRESTIMO/Fontes` | 344 |
| `EMPRESTIMOBPL/Integra` | 10 |
| `EMPRESTIMOBPL/Interface` | 35 |
| `EMPRESTIMOBPL/Objetos` | 33 |
| **Total** | **422** |

344 + 10 + 35 + 33 = **422** ✓

Isso está documentado em:

- `docs/system-overview.html` (linha 446): *"Forms/DFM 422 (344 + 78), todos
  inventariados"*
- `docs/site/modules/emprestimo/index.html` (linha 211): *"Inventário funcional das 422
  telas"* — inventário exaustivo com título, processo e finalidade de cada arquivo,
  agrupado nos dez processos de negócio do módulo.

**Conclusão AC2:** O Empréstimo tem sim 422 arquivos `.dfm`, distribuídos exatamente
como documentado: `EMPRESTIMO/Fontes` 344, `EMPRESTIMOBPL/Integra` 10,
`EMPRESTIMOBPL/Interface` 35 e `EMPRESTIMOBPL/Objetos` 33.

---

## 3. Classificação: telas que o usuário vê vs. arquivos não-visuais (AC3)

Em Delphi, **nem todo arquivo `.dfm` é uma tela visível**. Data modules (`Tdtm`) e
objetos de negócio (`Tmol`, `Tbus`) também usam `.dfm` para guardar configurações de
tempo de design, mas **não têm interface gráfica**. A classe raiz de cada `.dfm`
(reconhecível na primeira linha do arquivo) indica o tipo de componente:

| Prefixo da classe | Tipo | O usuário vê? |
|--------------------|------|---------------|
| `Tfrm` / `TFrm` | Formulário (form) | **Sim** — tela interativa |
| `Tcfg` | Configuração de relatório (filtro) | **Sim** — tela de filtro antes de imprimir |
| `Trpt` / `Trel` | Layout de relatório / impressão | **Sim** — tela de relatório |
| `Tdtm` | Data module | **Não** — componente não-visual |
| `Tmol` / `Tbus` | Objeto de negócio (model/business) | **Não** — componente não-visual |

### 3.1 Método de classificação

Cada arquivo `.dfm` foi lido e sua classe raiz extraída automaticamente. **9 arquivos
`.dfm` binários** (formato binário do Delphi, não texto) foram inspecionados manualmente
via extração de strings para determinar a classe raiz. Todos os 9 foram classificados com
sucesso — nenhum ficou como "indeterminado".

### 3.2 Módulo Contábil — classificação dos 113

| Categoria | Quantidade | Descrição |
|-----------|------------|-----------|
| Tela interativa (`Tfrm`/`TFrm`) | 112 | Forms que o usuário preenche ou opera |
| Tela de filtro/relatório (`Tcfg`/`Trpt`) | 0 | — |
| Componente não-visual (`Tdtm`/`Tmol`) | 1 | `dTermoDiario.dfm` (`TdtmTermo`) — data module do termo diário |
| Indeterminado | 0 | — |
| **Total** | **113** | 112 + 0 + 1 + 0 = **113** ✓ |

### 3.3 Módulo Empréstimo — classificação dos 422

#### Visão geral

| Categoria | Quantidade | Descrição |
|-----------|------------|-----------|
| Tela interativa (`Tfrm`/`TFrm`) | 208 | Forms que o usuário preenche ou opera |
| Tela de filtro/relatório (`Tcfg`/`Trpt`) | 87 | 86 telas de filtro de relatório (`Tcfg`) + 1 layout de relatório (`Trel`) |
| Componente não-visual (`Tdtm`/`Tmol`/`Tbus`) | 127 | 104 data modules (`Tdtm`) + 23 objetos de negócio (`Tmol`/`Tbus`) |
| Indeterminado | 0 | 9 arquivos binários `.dfm` inspecionados manualmente e classificados |
| **Total** | **422** | 208 + 87 + 127 + 0 = **422** ✓ |

#### Detalhamento por pasta

| Pasta | Total | Interativas | Filtro/Relatório | Não-visuais |
|-------|-------|-------------|-----------------|-------------|
| `EMPRESTIMO/Fontes` | 344 | 161 | 85 | 98 |
| `EMPRESTIMOBPL/Integra` | 10 | 1 | 0 | 9 |
| `EMPRESTIMOBPL/Interface` | 35 | 32 | 1 | 2 |
| `EMPRESTIMOBPL/Objetos` | 33 | 14 | 1 | 18 |
| **Total** | **422** | **208** | **87** | **127** |

#### Os 9 arquivos `.dfm` binários (inspecionados manualmente)

| Arquivo | Pasta | Classe raiz (extraída) | Classificação |
|---------|-------|------------------------|---------------|
| `FMapaMovimentacao.dfm` | `EMPRESTIMO/Fontes` | `TfrmMapaMovimentacao` | Tela interativa |
| `FExecQuitacao.dfm` | `EMPRESTIMO/Fontes` | `TfrmExecQuitacao` | Tela interativa |
| `FCadastroPai.dfm` | `EMPRESTIMO/Fontes` | `TfrmCadastroPai` | Tela interativa |
| `FEventoCobrancaContrato.dfm` | `EMPRESTIMO/Fontes` | `TFrmEventoCobrancaContrato` | Tela interativa |
| `RResumoCarteiraAnalCaixa.dfm` | `EMPRESTIMO/Fontes` | `TfrmRelResumoCarteiraAnalCaixa` | Tela interativa |
| `FAjusteFormaEnvio.dfm` | `EMPRESTIMO/Fontes` | `TfrmAjusteFormaEnvio` | Tela interativa |
| `FExecGeraParcela.dfm` | `EMPRESTIMO/Fontes` | `TfrmExecGeraParcela` | Tela interativa |
| `dRelItensNaoEnviados.dfm` | `EMPRESTIMO/Fontes` | `TdtmRelItensNaoEnviados` | Não-visual (data module) |
| `dRelItensGeradosAnal.dfm` | `EMPRESTIMO/Fontes` | `TdtmRelItensGeradosAnal` | Não-visual (data module) |

Resultado: 7 telas interativas + 2 data modules não-visuais. Todos classificados —
**0 indeterminados**.

**Conclusão AC3:** Cada arquivo contado foi colocado em exatamente uma categoria. As
categorias somam 113 para o Contábil e 422 para o Empréstimo.

---

## 4. Quantas telas o usuário realmente interage? (AC4)

### 4.1 Contábil

**112 telas** que o usuário realmente interage.

- 112 telas interativas (forms `Tfrm`/`TFrm`) — o usuário preenche, consulta e opera.
- 1 data module (`dTermoDiario.dfm`) — não-visual, o usuário nunca vê.

### 4.2 Empréstimo

**295 telas** que o usuário realmente interage.

- 208 telas interativas (forms `Tfrm`/`TFrm`) — o usuário preenche e opera.
- 87 telas de filtro/relatório (`Tcfg`/`Trel`) — o usuário seleciona filtros e emite
  relatórios.
- 127 componentes não-visuais (`Tdtm`/`Tmol`/`Tbus`) — data modules e objetos de negócio
  que o usuário nunca vê.

### 4.3 O que isso significa para o dimensionamento da migração

| | Contábil | Empréstimo |
|---|---|---|
| Total documentado ("telas") | 113 | 422 |
| Telas reais (interativas + filtro/relatório) | **112** | **295** |
| Não-visuais (não são telas) | 1 | 127 |
| Diferença | −1 (−0,9%) | −127 (−30%) |

**Contábil:** O 113 é uma boa aproximação — apenas 1 arquivo não é tela. O esforço de
interface pode ser dimensionado por **112 telas**.

**Empréstimo:** O 422 superestima a interface em **127 arquivos** (30% do total). Estes
127 são data modules e objetos de negócio que precisam ser migrados como **lógica de
dados e negócio**, não como telas. O esforço de interface deve ser dimensionado por
**295 telas**. Os 127 componentes não-visuais ainda precisam ser migrados, mas o
trabalho é de back-end (acesso a dados, regras de negócio), não de front-end (UI).

**Recomendação:** Ao estimar o esforço e o roadmap, separar os dois tipos de trabalho:
- **Front-end (UI):** 112 telas (Contábil) + 295 telas (Empréstimo) = **407 telas**.
- **Back-end (não-visual):** 1 + 127 = **128 componentes** (data modules e objetos de
  negócio), migrados como lógica, não como interface.

---

## 5. Respostas diretas às três perguntas

| # | Pergunta | Resposta |
|---|----------|----------|
| 1 | Essas telas são arquivos `.dfm`? | **Sim.** Todos os 113 e todos os 422 são arquivos `.dfm`. |
| 2 | O Empréstimo tem mesmo 422 telas? | **Sim, 422 arquivos `.dfm`** (344 + 10 + 35 + 33). Mas "422 telas" é impreciso: 127 não são telas, são componentes não-visuais. |
| 3 | O usuário precisa interagir com todas? | **Não.** Contábil: 112 das 113. Empréstimo: 295 das 422. As demais são data modules e objetos de negócio sem interface. |

---

## 6. Fontes e reprodutibilidade

### Contagens

As contagens de `.dfm` foram obtidas por varredura direta do repositório legacy:

```
find CONTAB/FontesMT -iname "*.dfm"       → 113
find EMPRESTIMO/Fontes -iname "*.dfm"     → 344
find EMPRESTIMOBPL/Integra -iname "*.dfm" → 10
find EMPRESTIMOBPL/Interface -iname "*.dfm" → 35
find EMPRESTIMOBPL/Objetos -iname "*.dfm" → 33
```

### Classificação

A classe raiz de cada `.dfm` foi extraída da primeira linha do arquivo (formato texto:
`inherited frmX: TfrmX` ou `object dtmX: TdtmX`). Os 9 arquivos binários foram
inspecionados via extração de strings para identificar a classe raiz.

### Documentação existente (reutilizada)

- `docs/site/modules/contab/index.html` — inventário das 113 telas com título, processo
  e finalidade de cada `.dfm` de `CONTAB/FontesMT`.
- `docs/site/modules/emprestimo/index.html` — inventário das 422 telas com título,
  processo e finalidade de cada `.dfm`, agrupado nos dez processos de negócio.
- `docs/system-overview.html` — métricas gerais: "113 Forms Contábil" (linha 199) e
  "Forms/DFM 422 (344 + 78)" (linha 446).
- `docs/migration-contabil.html` — revisão PFC-4 que originou o "113/113 telas".
