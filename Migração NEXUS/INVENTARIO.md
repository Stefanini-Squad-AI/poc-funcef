# Migração NEXUS — inventário (PFC-75)

> PFC-75 · Gerado por `docs/tools/migracao_nexus.py --write` — não editar manualmente.
> Conferência: `python3 -B docs/tools/migracao_nexus.py --check`.
> Base: estudo PFC-44 (`Analise_linhas_dependencias.md`, `docs/tools/uso_efetivo_dependencias.py`) sobre o
> fechamento de dependências do PFC-26 (`docs/tools/contagem_docs1.py`).

Esta pasta isola o escopo da migração (.NET 10 + React 19 + Oracle 23ai): os três módulos previdenciários —
**BENEFICIOPREV**, **FOLHA** e **CONTRIBUICAOPREV** — e as 31 dependências necessárias para compilá-los e executá-los.
O restante do sistema CM Contabilidade fica fora. A raiz desta pasta faz o papel de `C:\ProjetosCM5\` (raiz dos
`SearchPath` dos `.dof`) e cada arquivo mantém o caminho que tem na raiz do repositório, por isso os caminhos relativos
dos `.dpr`/`.dpk` (`in '..\..\Cm\...'`) e os grupos de build continuam válidos.

## 1. Módulos

| Módulo | Pasta | Programa (`.dpr`) | Arquivos copiados | Fontes contados (PFC-26) | Linhas totais | Linhas de código | Linhas efetivas das dependências (PFC-44) |
|---|---|---|---:|---:|---:|---:|---:|
| BENEFICIOPREV | `BENEFICIOPREV/` | `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | 158 | 136 | 187.795 | 165.477 | 871.832 |
| FOLHA | `FOLHA/` | `FOLHA/Fontes/Folha.dpr` | 567 | 517 | 478.370 | 405.423 | 448.145 |
| CONTRIBUIÇÃO | `CONTRIBUICAOPREV/` | `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | 170 | 154 | 180.735 | 157.484 | 682.504 |
| **Total** | | | **895** | **807** | **846.900** | **728.384** | **1.025.183** (cada linha uma vez) |

Cada pasta de módulo é cópia integral dos arquivos versionados (`Fontes`, `CtrlObjects`, `DBObjects`, `Relatorios`,
`.dpr`, `.dof`, `.cfg`, `.res`, `.bpg` ...), byte a byte. Os pacotes `CMFBCOMUM50`, `CMFBOBJ50` e `CMFolhaObjMT`
ficam dentro de `FOLHA/` e vêm junto com o módulo.

### 1.1 Pastas na raiz

Só três pastas são módulos. As demais existem apenas para manter o caminho original dos arquivos das dependências
(os `.dpk`/`.dpr` os citam por caminho relativo) e contêm somente esses arquivos — nenhuma é um módulo completo.

| Pasta | Papel | Arquivos | Dependências |
|---|---|---:|---|
| `BENEFICIOPREV/` | **módulo** | 158 | — |
| `CONTRIBUICAOPREV/` | **módulo** | 170 | — |
| `FOLHA/` | **módulo** | 567 | — |
| `AUTOATENDIMENTO/` | dependência | 12 | `CMWebComum50` |
| `CM/` | dependência | 978 | `CM/CMADMPREV/Fontes`, `CM/CMADMPREV/Relatorios`, `CMAdd50`, `CMAdmPrev`, `CMBussines50`, `CMCompo50`, `CMForms50`, `CMOld50`, `CmParser50`, `CMPrevMT50`, `CMPrincipal50`, `CMRad50`, `CMRegra50`, `CMRegra50MT`, `CmRelatsOld50`, `CMResource50`, `CmSql50`, `CMTotalPrev50` |
| `CMBACK/` | dependência | 29 | `CmBack50` |
| `CMCAPCAROBJ50/` | dependência | 28 | `CMCapCarObj50` |
| `CMCAPCARUTILOBJ50/` | dependência | 15 | `CmCapCarUtilObj50` |
| `CMCFINANOBJ50/` | dependência | 14 | `CMCfinanObj50` |
| `CMCONTABOBJ50/` | dependência | 19 | `CMContabObj50` |
| `CMCRYPTO/` | dependência | 6 | `CMCrypto` |
| `CMGLOBALOBJ50/` | dependência | 17 | `CmGlobalObj50` |
| `CMINTBANCOMT50/` | dependência | 101 | `CMIntBancoMT50` |
| `CMIRRFOBJ50/` | dependência | 9 | `CMIRRFobj50` |
| `CMPLANEORCOBJ50/` | dependência | 28 | `CMPlaneOrcObj50` |
| `CMRHOBJ50/` | dependência | 4 | `CMAdmPrev`, `Complemento (Library Path)` |
| `EMPRESTIMOBPL/` | dependência | 28 | `CMIntegraEP50` |
| `IRRF/` | dependência | 1 | `CMCapCarObj50` |
| `SHARED/` | dependência | 6 | `SHARED/Folhas` |

## 2. Dependências incluídas (31)

* **Units copiadas** — units do `contains` (ou do `.exe`) alcançadas pelo fechamento de compilação dos três programas;
  **implícitas** — units fora do `contains` que o compilador importa por estarem no `uses` de uma unit copiada;
  **removidas** — units do `contains` que nenhum dos três programas alcança.
* **Linhas físicas** — arquivos `.pas`/`.dfm`/`.dpk` copiados, inteiros (regras de contagem do PFC-18).
* **Linhas efetivas** — rotinas, classes e units realmente referenciadas pelos módulos (PFC-44); conferidas arquivo a
  arquivo com a análise refeita sobre esta pasta.

| # | Dependência | Pasta | Usado por | Units copiadas | Implícitas | Removidas | Linhas totais (PFC-26) | Linhas físicas copiadas | Efetivas CONTRIBUIÇÃO | Efetivas FOLHA | Efetivas BENEFICIOPREV | Efetivas (3 módulos) | Código efetivo (3 módulos) |
|---:|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | `CMAdd50` | `CM/ComponentesXT/CMAdd50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 20 | 0 | 12 | 27.741 | 13.567 | 4.789 | 4.784 | 4.784 | 4.789 | 2.866 |
| 2 | `CMAdmPrev` | `CM/CMADMPREV/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 189 | 0 | 14 | 633.562 | 624.536 | 321.245 | 104.988 | 505.961 | 584.893 | 492.295 |
| 3 | `CmBack50` | `CMBACK/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 18 | 0 | 16 | 34.055 | 24.028 | 17.707 | 16.141 | 17.244 | 18.659 | 15.496 |
| 4 | `CMBussines50` | `CM/CmBussines/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 3 | 0 | 0 | 2.009 | 2.009 | 0 | 0 | 0 | 0 | 0 |
| 5 | `CMCapCarObj50` | `CMCAPCAROBJ50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 22 | 0 | 39 | 50.251 | 33.675 | 24.175 | 27.001 | 22.936 | 29.485 | 18.326 |
| 6 | `CmCapCarUtilObj50` | `CMCAPCARUTILOBJ50/` | CONTRIBUIÇÃO | 7 | 0 | 206 | 336.332 | 8.468 | 7.044 | — | — | 7.044 | 3.667 |
| 7 | `CMCfinanObj50` | `CMCFINANOBJ50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 9 | 0 | 2 | 5.803 | 5.578 | 5.000 | 2.416 | 2.715 | 5.000 | 3.172 |
| 8 | `CMCompo50` | `CM/componentescm/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 84 | 0 | 16 | 53.361 | 47.739 | 34.862 | 35.483 | 35.810 | 36.958 | 29.165 |
| 9 | `CMContabObj50` | `CMCONTABOBJ50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 14 | 0 | 8 | 15.056 | 11.828 | 8.844 | 8.982 | 8.898 | 8.986 | 5.732 |
| 10 | `CMCrypto` | `CMCRYPTO/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 1 | 0 | 0 | 512 | 512 | 0 | 0 | 349 | 349 | 243 |
| 11 | `CMForms50` | `CM/Forms/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 133 | 1 | 25 | 105.413 | 93.800 | 68.388 | 86.903 | 68.353 | 87.705 | 74.932 |
| 12 | `CmGlobalObj50` | `CMGLOBALOBJ50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 12 | 0 | 73 | 26.971 | 8.159 | 4.653 | 4.712 | 5.657 | 5.716 | 3.591 |
| 13 | `CMIntBancoMT50` | `CMINTBANCOMT50/` | CONTRIBUIÇÃO, FOLHA | 64 | 0 | 0 | 54.512 | 54.512 | 0 | 24.110 | — | 24.110 | 17.679 |
| 14 | `CMIntegraEP50` | `EMPRESTIMOBPL/Integra/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 14 | 0 | 2 | 58.183 | 56.785 | 31.318 | 0 | 39.499 | 39.499 | 30.102 |
| 15 | `CMIRRFobj50` | `CMIRRFOBJ50/` | FOLHA | 3 | 0 | 3 | 19.830 | 3.467 | — | 3.415 | — | 3.415 | 2.136 |
| 16 | `CMOld50` | `CM/ComponentesCMOld/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 8 | 0 | 4 | 2.139 | 1.607 | 559 | 381 | 983 | 983 | 762 |
| 17 | `CmParser50` | `CM/Parser/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 2 | 0 | 0 | 2.857 | 2.857 | 0 | 0 | 0 | 0 | 0 |
| 18 | `CMPlaneOrcObj50` | `CMPLANEORCOBJ50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 20 | 0 | 5 | 13.884 | 12.688 | 7.579 | 7.649 | 7.638 | 7.740 | 4.354 |
| 19 | `CMPrevMT50` | `CM/CMPrevMT50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 13 | 0 | 29 | 16.453 | 5.296 | 2.393 | 4.190 | 3.237 | 4.990 | 3.877 |
| 20 | `CMPrincipal50` | `CM/Forms/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 1 | 0 | 0 | 1.398 | 1.398 | 1.398 | 1.398 | 1.398 | 1.398 | 1.291 |
| 21 | `CMRad50` | `CM/CMRad50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 36 | 0 | 5 | 30.720 | 29.966 | 28.690 | 28.698 | 28.686 | 28.698 | 24.732 |
| 22 | `CMRegra50` | `CM/Regra/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 10 | 0 | 0 | 30.910 | 30.910 | 30.404 | 30.447 | 30.461 | 30.497 | 21.109 |
| 23 | `CMRegra50MT` | `CM/RegraMT/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 11 | 0 | 0 | 29.972 | 29.972 | 29.373 | 0 | 29.430 | 29.430 | 20.547 |
| 24 | `CmRelatsOld50` | `CM/Relats/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 7 | 0 | 0 | 1.923 | 1.923 | 0 | 331 | 0 | 331 | 281 |
| 25 | `CMResource50` | `CM/CMResource50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 5 | 0 | 0 | 2.232 | 2.232 | 1.307 | 1.307 | 1.307 | 1.307 | 1.031 |
| 26 | `CmSql50` | `CM/CmSql/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 5 | 0 | 0 | 2.798 | 2.798 | 2.798 | 2.798 | 2.798 | 2.798 | 2.066 |
| 27 | `CMTotalPrev50` | `CM/TotalPrev/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 13 | 0 | 1 | 49.678 | 49.630 | 48.856 | 45.231 | 48.313 | 49.067 | 42.904 |
| 28 | `CMWebComum50` | `AUTOATENDIMENTO/CMWebComum50/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 5 | 0 | 22 | 14.824 | 2.441 | 0 | 383 | 1.941 | 2.020 | 1.447 |
| 29 | `CM/CMADMPREV/Fontes` | `CM/CMADMPREV/Fontes/` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 6 | 5 | 0 | 3.266 | 9.910 | 1.122 | 2.122 | 1.659 | 3.266 | 2.631 |
| 30 | `CM/CMADMPREV/Relatorios` | `CM/CMADMPREV/Relatorios/` | BENEFICIOPREV | 1 | 0 | 0 | 1.782 | 1.782 | — | — | 1.775 | 1.775 | 1.668 |
| 31 | `SHARED/Folhas` | `SHARED/Folhas/` | FOLHA | 3 | 0 | 0 | 4.275 | 4.275 | — | 4.275 | — | 4.275 | 3.912 |
| | **Total** | | | **739** | **6** | **482** | **1.632.702** | **1.178.348** | **682.504** | **448.145** | **871.832** | **1.025.183** | **832.014** |

## 3. Totais (AC3)

| Recorte | Linhas totais | Linhas de código |
|---|---:|---:|
| Dependências compartilhadas inteiras no sistema (PFC-26) | 1.632.702 | 1.363.291 |
| Dependências copiadas para esta pasta (arquivos inteiros) | 1.178.348 | 960.487 |
| **Dependências sob análise — uso efetivo (PFC-44)** | **1.025.183** | **832.014** |
| Removido do escopo (não utilizado pelos três módulos) | 607.519 | 531.277 |
| Pastas dos três módulos (PFC-26) | 846.900 | 728.384 |
| **Total a migrar (módulos + dependências efetivas)** | **1.872.083** | **1.560.398** |
| Complemento fora das 31 dependências (seção 4, arquivos inteiros) | 3.358 | 2.631 |

* As dependências sob análise caem de 1.632.702 para **1.025.183 linhas** (62,8%; 832.014 de código): **607.519 linhas totais (531.277 de código) ficam fora do escopo**.
* Fisicamente, 482 units não alcançáveis não foram copiadas. Uma unit alcançável entra inteira,
  porque cortar rotinas dentro de um `.pas` quebraria a compilação; as rotinas sem uso dentro dela (diferença entre
  linhas físicas e efetivas) estão identificadas pelo PFC-44 e não precisam ser migradas.
* Efetivas por módulo: CONTRIBUIÇÃO 682.504; FOLHA 448.145; BENEFICIOPREV 871.832. A soma é maior
  que o total porque a maior parte das linhas é compartilhada; no total cada linha entra uma única vez.
* Refeita sobre esta pasta, a análise PFC-44 dá os mesmos números arquivo a arquivo; a única diferença são as 482 linhas (482 de código) dos itens retirados do `contains` dos `.dpk` reduzidos (seção 5), que só citavam units removidas.

## 4. Units importadas implicitamente e complemento

Units usadas por fontes compilados que não estão no `contains` de nenhum pacote nem no `SearchPath` do `.dof` (no
ambiente original o Delphi as acha pelo Library Path ou as importa implicitamente no pacote). Foram copiadas para
que nenhum `uses` compilado aponte para fora desta pasta. As que ficam fora das pastas das 31 dependências formam o
**complemento** (não entram nos totais do PFC-44).

| Unit | Arquivo | Dependência | Usada por | Observação |
|---|---|---|---|---|
| `fconsendercadelegivel` | `CM/CMADMPREV/Fontes/FConsEnderCadElegivel.pas` | CM/CMADMPREV/Fontes | `CM/CMADMPREV/Fontes/FCadDepenBenef.pas` | — |
| `fparamrelbenefadiantpgtointegral` | `CM/CMADMPREV/Fontes/FParamRelBenefAdiantPgtoIntegral.pas` | CM/CMADMPREV/Fontes | `CM/CMADMPREV/Fontes/DRelatBeneficios.pas` | — |
| `fparamrelbenefconcadiant` | `CM/CMADMPREV/Fontes/FParamRelBenefConcAdiant.pas` | CM/CMADMPREV/Fontes | `CM/CMADMPREV/Fontes/DRelatBeneficios.pas` | — |
| `fparamconcinssregiao` | `CM/CMADMPREV/Fontes/fParamConcINSSRegiao.pas` | CM/CMADMPREV/Fontes | `CM/CMADMPREV/Fontes/DRelatBeneficios.pas` | — |
| `fselecionabeneficiariosdobeneficio` | `CM/CMADMPREV/Fontes/fSelecionaBeneficiariosdoBeneficio.pas` | CM/CMADMPREV/Fontes | `CM/CMADMPREV/Fontes/FCadRequerBenefBfciario.pas` | — |
| `dreports` | `CM/Forms/Source/dReports.pas` | CMForms50 | `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | — |
| `uctrlcustomrh` | `CMRHOBJ50/CtrlObjetos/uCtrlCustomRH.pas` | Complemento (Library Path) | `CMRHOBJ50/CtrlObjetos/uCtrlGlobalRH.pas` | — |
| `uctrlfuncoesrh` | `CMRHOBJ50/CtrlObjetos/uCtrlFuncoesRH.pas` | Complemento (Library Path) | `CMRHOBJ50/CtrlObjetos/uCtrlGlobalRH.pas` | usada por FOLHA/Fontes/FRemessaEletronica.pas (TCtrlFuncoesRH.QuebrarListaFiltro); CMRHOBJ50 é a dependência direta de FOLHA indicada no system-overview (CMRHOBJUTIL50 tem outra versão do arquivo) |
| `uctrlglobalrh` | `CMRHOBJ50/CtrlObjetos/uCtrlGlobalRH.pas` | Complemento (Library Path) | `CM/CMADMPREV/Relatorios/FParamComparaTx.pas` | usada por CM/CMADMPREV/Relatorios/FParamComparaTx.pas (pacote CMAdmPrev); mesma escolha de CMRHOBJ50 (CMRHOBJUTIL50 tem outra versão do arquivo) |

## 5. Alterações em relação aos originais

Todos os arquivos são cópias byte a byte, exceto:

* `CM/ComponentesXT/CMAdd50/Package/CMAdd50.dpk` — `contains` reduzido a 20 de 32 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CM/CMADMPREV/Package/CMAdmPrev.dpk` — `contains` reduzido a 189 de 203 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMBACK/Package/CmBack50.dpk` — `contains` reduzido a 18 de 34 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMCAPCAROBJ50/Package/CMCapCarObj50.dpk` — `contains` reduzido a 22 de 61 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMCAPCARUTILOBJ50/Package/CmCapCarUtilObj50.dpk` — `contains` reduzido a 7 de 213 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMCFINANOBJ50/Package/CMCfinanObj50.dpk` — `contains` reduzido a 9 de 11 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CM/componentescm/package/CMCompo50.dpk` — `contains` reduzido a 84 de 100 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMCONTABOBJ50/Package/CMContabObj50.dpk` — `contains` reduzido a 14 de 22 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CM/Forms/Package/CMForms50.dpk` — `contains` reduzido a 133 de 158 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMGLOBALOBJ50/Package/CmGlobalObj50.dpk` — `contains` reduzido a 12 de 85 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `EMPRESTIMOBPL/Integra/Package/CMIntegraEP50.dpk` — `contains` reduzido a 14 de 16 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMIRRFOBJ50/Package/CMIRRFobj50.dpk` — `contains` reduzido a 3 de 6 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CM/ComponentesCMOld/Package/CMOld50.dpk` — `contains` reduzido a 8 de 12 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CMPLANEORCOBJ50/Package/CMPlaneOrcObj50.dpk` — `contains` reduzido a 20 de 25 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CM/CMPrevMT50/Package/CMPrevMT50.dpk` — `contains` reduzido a 13 de 42 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CM/CMRad50/Package/CMRad50.dpk` — `contains` reduzido a 36 de 41 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `CM/TotalPrev/Package/CMTotalPrev50.dpk` — `contains` reduzido a 13 de 14 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `AUTOATENDIMENTO/CMWebComum50/Package/CMWebComum50.dpk` — `contains` reduzido a 5 de 27 units (comentário PFC-75 no arquivo; `requires` inalterado).
* `1-BPL.Padrao.bpg` — 12 projeto(s) mantido(s); retirado(s) por não ter(em) fonte na pasta: `cmexperts.bpl`.
* `2-BPL.Negocio.bpg` — 19 projeto(s) mantido(s); retirado(s) por não ter(em) fonte na pasta: `cmagendamentoobj50.bpl`, `cmalmoxcompraobj50.bpl`, `cmautoatendimentoobj50.bpl`, `cmcafobj50.bpl`, `cmcomporh.bpl`, `cmexecep50.bpl`, `cmimobiliarioobj50.bpl`, `cmindicadoresobj50.bpl`, `cmlivroobj50.bpl`, `cmobjetosep50.bpl`, `cmrelatorioobj50.bpl`, `cmrhobj50.bpl`.
* `Previdenciario.bpg` — 6 projeto(s) mantido(s); retirado(s) por não ter(em) fonte na pasta: `cadastroprev.exe`, `impostos.exe`.

Units removidas por pacote e todos os arquivos copiados (origem, dependência, papel): `inventario-arquivos.csv`.

## 6. Observações herdadas do original (não alteradas)

* 36 item(ns) `X in 'caminho'` dos `.dpr` apontam para arquivos que não existem já no repositório original;
  a unit é fornecida pelo pacote de runtime indicado e está na pasta:

| Programa | Unit | Caminho no `.dpr` (inexistente) | Arquivo usado (pacote) |
|---|---|---|---|
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `dreembolsoinss` | `dReembolsoINSS.pas` | `CM/CMADMPREV/Fontes/dReembolsoINSS.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `drelatbeneficios` | `DRelatBeneficios.pas` | `CM/CMADMPREV/Fontes/DRelatBeneficios.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `drelatgerencial` | `..\Relatorios\dRelatGerencial.pas` | `CM/CMADMPREV/Relatorios/dRelatGerencial.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `drelretroregional` | `..\Relatorios\dRelRetroRegional.pas` | `CM/CMADMPREV/Relatorios/dRelRetroRegional.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fassocrubinss` | `FAssocRubINSS.pas` | `CM/CMADMPREV/Fontes/FAssocRubINSS.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fcadentrmanualinss` | `fCadEntrManualINSS.pas` | `CM/CMADMPREV/Fontes/fCadEntrManualINSS.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fcancidentificainss` | `FCancIdentificaINSS.pas` | `CM/CMADMPREV/Fontes/FCancIdentificaINSS.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fcfgetiqueta` | `..\Relatorios\FCfgEtiqueta.pas` | `CM/CMADMPREV/Relatorios/FCfgEtiqueta.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fcomparareembdesemb` | `FComparaReembDesemb.pas` | `CM/CMADMPREV/Fontes/FComparaReembDesemb.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fcompoevaloresri` | `fCompoeValoresRI.pas` | `CM/CMADMPREV/Fontes/fCompoeValoresRI.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fcompoevaloresri_telaa` | `fCompoeValoresRI_TelaA.pas` | `CM/CMADMPREV/Fontes/fCompoeValoresRI_TelaA.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fconciliacao` | `FConciliacao.pas` | `CM/CMADMPREV/Fontes/FConciliacao.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fconsparttratados` | `fConsPartTratados.pas` | `CM/CMADMPREV/Fontes/fConsPartTratados.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `femisetiq` | `..\Relatorios\fEmisEtiq.pas` | `CM/CMADMPREV/Relatorios/fEmisEtiq.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fencerraconciliacao` | `FEncerraConciliacao.pas` | `CM/CMADMPREV/Fontes/FEncerraConciliacao.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fextratoinss` | `FExtratoINSS.pas` | `CM/CMADMPREV/Fontes/FExtratoINSS.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fidentificainss` | `FIdentificaINSS.pas` | `CM/CMADMPREV/Fontes/FIdentificaINSS.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fparamrelgerencial` | `..\Relatorios\fParamRelGerencial.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fparamrelgerencial02` | `..\Relatorios\fParamRelGerencial02.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial02.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fparamrelgerencial03` | `..\Relatorios\fParamRelGerencial03.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial03.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fparamrelgerencial04` | `..\Relatorios\fParamRelGerencial04.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial04.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fprelconsolidamovres` | `..\Relatorios\fPRelConsolidaMovRes.pas` | `CM/CMADMPREV/Relatorios/fPRelConsolidaMovRes.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fprelhisfuncionalmt` | `..\Relatorios\FPRelHisFuncionalMT.pas` | `CM/TotalPrev/Source/FPRelHisFuncionalMT.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `fresultconciliacao` | `FResultConciliacao.pas` | `CM/CMADMPREV/Fontes/FResultConciliacao.pas` |
| `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | `usistema` | `..\..\Cm\Forms\Source\USistema.pas` | `CM/componentescm/source/uSistema.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `drelatgerencial` | `..\Relatorios\dRelatGerencial.pas` | `CM/CMADMPREV/Relatorios/dRelatGerencial.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `drelretroregional` | `..\Relatorios\dRelRetroRegional.pas` | `CM/CMADMPREV/Relatorios/dRelRetroRegional.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `fcfgetiqueta` | `..\Relatorios\FCfgEtiqueta.pas` | `CM/CMADMPREV/Relatorios/FCfgEtiqueta.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `femisetiq` | `..\Relatorios\fEmisEtiq.pas` | `CM/CMADMPREV/Relatorios/fEmisEtiq.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `fparamrelgerencial` | `..\Relatorios\fParamRelGerencial.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `fparamrelgerencial02` | `..\Relatorios\fParamRelGerencial02.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial02.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `fparamrelgerencial03` | `..\Relatorios\fParamRelGerencial03.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial03.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `fparamrelgerencial04` | `..\Relatorios\fParamRelGerencial04.pas` | `CM/CMADMPREV/Relatorios/fParamRelGerencial04.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `fprelconsolidamovres` | `..\Relatorios\fPRelConsolidaMovRes.pas` | `CM/CMADMPREV/Relatorios/fPRelConsolidaMovRes.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `fprelhisfuncionalmt` | `..\Relatorios\FPRelHisFuncionalMT.pas` | `CM/TotalPrev/Source/FPRelHisFuncionalMT.pas` |
| `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | `usistema` | `..\..\Cm\Forms\Source\USistema.pas` | `CM/componentescm/source/uSistema.pas` |

* Fontes da pasta do módulo que não são compilados pelo `.dpr` e citam units de outros módulos (não copiadas):
  `FOLHA/Fontes/FPRelIncBenef.pas` → `ubiblioteca` (`REGRA/Fontes/UBiblioteca.pas`).

## 7. Fora da pasta

* Todos os demais módulos e pacotes do sistema (ex.: `CONTAB`, `ORCAMENTO`, `EMPRESTIMO`, `INVESTIMENTOS`, `CFINAN`,
  `CPAGAR`, `CRECEBER`, `CADASTROPREV`, `IRRF` ...) e os demais grupos de build (`3-Sistemas.bpg`, `CapCar.bpg` ...).
* VCL/RTL da Borland e componentes de terceiros (Developer Express, InfoPower, ReportBuilder, QuickReport, TeeChart,
  Indy, Multilizer, Toolbar97, TopGrid, ip2000, 1stClass, JCL): pré-requisitos do ambiente Delphi 5, não código a
  migrar (mesmo recorte do PFC-26/PFC-44). Continuam citados em `Packages=`/`requires`.
* Packages/procedures Oracle (não são fonte Delphi).

## 8. Limitações

* A alcançabilidade é estática (cláusulas `uses`). Uma unit removida de um pacote cujo `initialization` registrasse
  classes usadas só por nome (`FindClass`/`GetClass`) não seria vista.
* Units implícitas com mais de um arquivo candidato no repositório foram escolhidas manualmente (seção 4, coluna
  Observação); as demais pela pasta do fonte que as usa.

## 9. Como reproduzir

```bash
python3 -B docs/tools/migracao_nexus.py --write   # recria esta pasta e valida
python3 -B docs/tools/migracao_nexus.py --check   # valida integridade, totais e este inventário
```
