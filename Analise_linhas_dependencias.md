# Análise de linhas efetivas de dependências compartilhadas — PFC-44

> **PFC-44** · Conferência da quantidade de linhas de dependências dos módulos CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV.
> Gerado por `docs/tools/analise_linhas_dependencias.py` — não editar manualmente.
> Para regenerar: `python3 -B docs/tools/analise_linhas_dependencias.py --write`.

---

## 1. Resultado

A cifra de **1.632.702 linhas totais / 1.363.291 linhas de código** de dependências compartilhadas (PFC-26) soma o conteúdo integral de cada arquivo de dependência. Esta análise mede, por análise estática de cláusulas `uses` (fechamento transitivo), quantas units de cada dependência os módulos **efetivamente referenciam** e quantas linhas isso representa — separando o uso real do volume total do arquivo.

### 1.1 Total consolidado (dependências contadas uma única vez)

| Métrica | Linhas totais | Linhas de código |
| :--- | ---: | ---: |
| Total atual (PFC-26, 31 dependências) | 1.632.702 | 1.363.291 |
| Total efetivamente referenciado (união dos 3 módulos) | 1.151.938 | 937.217 |
| **Delta (linhas não efetivamente utilizadas)** | **480.764** | **426.074** |
| % efetivo do total | 70.6% | 68.7% |

Conclusão: dos 1.632.702 linhas totais de dependências, **1.151.938** (70.6%) são efetivamente referenciadas por ao menos um dos três módulos; **480.764** linhas (29.4%) não são referenciadas por nenhum módulo em escopo. A cifra de 1,6 milhão **superestima** o volume real de dependência a migrar.

### 1.2 Por módulo

Atribuição por módulo: para cada módulo, somam-se as linhas efetivas das dependências que ele utiliza. Dependências compartilhadas por mais de um módulo contribuem com suas linhas efetivas em cada módulo que as referencia (visão por módulo, não soma consolidada).

| Módulo | Total atual atribuído | Efetivo (totais) | Delta (totais) | Total atual código | Efetivo (código) | Delta (código) |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: |
| CONTRIBUIÇÃO | 1.606.815 | 845.957 | 760.858 | 1.345.180 | 680.234 | 664.946 |
| FOLHA | 1.294.588 | 739.720 | 554.868 | 1.054.711 | 594.441 | 460.270 |
| BENEFICIOPREV | 1.217.753 | 1.017.506 | 200.247 | 995.140 | 830.877 | 164.263 |

> O “total atual atribuído” por módulo soma as dependências que o módulo usa; como há dependências compartilhadas, a soma dos totais atribuídos dos três módulos é maior que 1.632.702 (cada dependência é contada uma vez no consolidado, mas aparece em cada módulo que a usa). O consolidado (§1.1) é a base de comparação com o PFC-26.

## 2. Uso efetivo por dependência (AC1)

Uma linha para cada uma das **31 dependências compartilhadas** com linhas listadas em `docs1/visao-geral/inventario.html` (PFC-26). Colunas: dependência, linhas totais atuais, units existentes, units referenciadas e linhas efetivas por módulo.

| Dependência | Linhas totais atuais | Units existentes | Units ref. CONTRIBUIÇÃO | Units ref. FOLHA | Units ref. BENEFICIOPREV | Linhas efetivas CONTRIBUIÇÃO | Linhas efetivas FOLHA | Linhas efetivas BENEFICIOPREV |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| `CMAdd50` | 27.741 | 32 | 13 | 12 | 17 | 8.010 | 7.035 | 12.285 |
| `CMAdmPrev` | 633.562 | 199 | 142 | 92 | 171 | 408.757 | 241.850 | 580.412 |
| `CmBack50` | 34.055 | 34 | 18 | 11 | 17 | 24.044 | 20.262 | 23.930 |
| `CMBussines50` | 2.009 | 3 | 0 | 0 | 0 | 153 | 153 | 153 |
| `CMCapCarObj50` | 50.251 | 61 | 20 | 18 | 16 | 25.513 | 32.532 | 24.331 |
| `CmCapCarUtilObj50` | 336.332 | 213 | 7 | — | — | 8.674 | — | — |
| `CMCfinanObj50` | 5.803 | 11 | 9 | 9 | 9 | 5.580 | 5.580 | 5.580 |
| `CMCompo50` | 53.361 | 100 | 80 | 79 | 81 | 45.054 | 43.631 | 47.046 |
| `CMContabObj50` | 15.056 | 22 | 14 | 14 | 14 | 11.836 | 11.836 | 11.836 |
| `CMCrypto` | 512 | 1 | 1 | 0 | 1 | 512 | 59 | 512 |
| `CMForms50` | 105.413 | 157 | 110 | 130 | 110 | 74.417 | 92.889 | 74.166 |
| `CmGlobalObj50` | 26.971 | 85 | 8 | 8 | 12 | 6.799 | 6.799 | 8.232 |
| `CMIntBancoMT50` | 54.512 | 64 | 0 | 61 | — | 1.335 | 53.792 | — |
| `CMIntegraEP50` | 58.183 | 16 | 14 | 11 | 14 | 56.787 | 52.905 | 56.787 |
| `CMIRRFobj50` | 19.830 | 6 | — | 3 | — | — | 3.470 | — |
| `CMOld50` | 2.139 | 12 | 8 | 6 | 7 | 1.611 | 1.081 | 1.129 |
| `CmParser50` | 2.857 | 2 | 0 | 0 | 0 | 75 | 75 | 75 |
| `CMPlaneOrcObj50` | 13.884 | 25 | 20 | 20 | 20 | 12.693 | 12.693 | 12.693 |
| `CMPrevMT50` | 16.453 | 42 | 6 | 11 | 8 | 3.618 | 5.019 | 3.924 |
| `CMPrincipal50` | 1.398 | 1 | 1 | 1 | 1 | 1.398 | 1.398 | 1.398 |
| `CMRad50` | 30.720 | 41 | 36 | 36 | 36 | 29.971 | 29.971 | 29.971 |
| `CMRegra50` | 30.910 | 10 | 10 | 10 | 10 | 30.910 | 30.910 | 30.910 |
| `CMRegra50MT` | 29.972 | 11 | 11 | 11 | 11 | 29.972 | 29.972 | 29.972 |
| `CmRelatsOld50` | 1.923 | 7 | 0 | 3 | 0 | 71 | 1.156 | 71 |
| `CMResource50` | 2.232 | 5 | 5 | 5 | 5 | 2.232 | 2.232 | 2.232 |
| `CmSql50` | 2.798 | 5 | 5 | 5 | 5 | 2.798 | 2.798 | 2.798 |
| `CMTotalPrev50` | 49.678 | 14 | 13 | 10 | 13 | 49.631 | 45.973 | 49.631 |
| `CMWebComum50` | 14.824 | 27 | 4 | 1 | 4 | 2.384 | 383 | 2.384 |
| `CM/CMADMPREV/Fontes` | 3.266 | 3 | 1 | 3 | 3 | 1.122 | 3.266 | 3.266 |
| `CM/CMADMPREV/Relatorios` | 1.782 | 1 | — | — | 1 | — | — | 1.782 |
| `SHARED/Folhas` | 4.275 | 3 | — | 0 | — | — | 0 | — |
| **Total** | 1.632.702 | 1.213 | 556 | 570 | 586 | 845.957 | 739.720 | 1.017.506 |

Nota: 3 pacote(s) listado(s) em PFC-26 com 0 linhas adicionais (fontes já contadas dentro da pasta FOLHA): `CMFBCOMUM50`, `CMFBOBJ50`, `CMFolhaObjMT`. Não entram nas 31 dependências acima.

### 2.1 Detalhe consolidado (união dos 3 módulos) e linhas de código

| Dependência | Linhas totais | Linhas código | Units exist. | Units ref. (união) | Efetivo total (união) | Efetivo código (união) | % efetivo (total) |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| `CMAdd50` | 27.741 | 20.418 | 32 | 18 | 13.260 | 8.801 | 47.8% |
| `CMAdmPrev` | 633.562 | 534.600 | 199 | 184 | 615.712 | 518.052 | 97.2% |
| `CmBack50` | 34.055 | 29.789 | 34 | 18 | 24.044 | 20.476 | 70.6% |
| `CMBussines50` | 2.009 | 1.588 | 3 | 0 | 153 | 44 | 7.6% |
| `CMCapCarObj50` | 50.251 | 35.568 | 61 | 22 | 33.714 | 21.967 | 67.1% |
| `CmCapCarUtilObj50` | 336.332 | 306.906 | 213 | 7 | 8.674 | 5.089 | 2.6% |
| `CMCfinanObj50` | 5.803 | 3.762 | 11 | 9 | 5.580 | 3.628 | 96.2% |
| `CMCompo50` | 53.361 | 43.287 | 100 | 82 | 47.232 | 38.355 | 88.5% |
| `CMContabObj50` | 15.056 | 10.679 | 22 | 14 | 11.836 | 8.218 | 78.6% |
| `CMCrypto` | 512 | 382 | 1 | 1 | 512 | 382 | 100.0% |
| `CMForms50` | 105.413 | 89.863 | 157 | 132 | 93.657 | 79.500 | 88.8% |
| `CmGlobalObj50` | 26.971 | 19.299 | 85 | 12 | 8.232 | 5.811 | 30.5% |
| `CMIntBancoMT50` | 54.512 | 44.808 | 64 | 61 | 53.792 | 44.256 | 98.7% |
| `CMIntegraEP50` | 58.183 | 43.961 | 16 | 14 | 56.787 | 42.834 | 97.6% |
| `CMIRRFobj50` | 19.830 | 12.525 | 6 | 3 | 3.470 | 2.190 | 17.5% |
| `CMOld50` | 2.139 | 1.670 | 12 | 8 | 1.611 | 1.261 | 75.3% |
| `CmParser50` | 2.857 | 2.195 | 2 | 0 | 75 | 35 | 2.6% |
| `CMPlaneOrcObj50` | 13.884 | 9.489 | 25 | 20 | 12.693 | 8.457 | 91.4% |
| `CMPrevMT50` | 16.453 | 13.358 | 42 | 13 | 5.325 | 4.151 | 32.4% |
| `CMPrincipal50` | 1.398 | 1.291 | 1 | 1 | 1.398 | 1.291 | 100.0% |
| `CMRad50` | 30.720 | 26.349 | 41 | 36 | 29.971 | 25.781 | 97.6% |
| `CMRegra50` | 30.910 | 21.466 | 10 | 10 | 30.910 | 21.466 | 100.0% |
| `CMRegra50MT` | 29.972 | 20.983 | 11 | 11 | 29.972 | 20.983 | 100.0% |
| `CmRelatsOld50` | 1.923 | 1.741 | 7 | 3 | 1.156 | 1.055 | 60.1% |
| `CMResource50` | 2.232 | 1.555 | 5 | 5 | 2.232 | 1.555 | 100.0% |
| `CmSql50` | 2.798 | 2.066 | 5 | 5 | 2.798 | 2.066 | 100.0% |
| `CMTotalPrev50` | 49.678 | 43.390 | 14 | 13 | 49.631 | 43.357 | 99.9% |
| `CMWebComum50` | 14.824 | 12.086 | 27 | 5 | 2.463 | 1.851 | 16.6% |
| `CM/CMADMPREV/Fontes` | 3.266 | 2.631 | 3 | 3 | 3.266 | 2.631 | 100.0% |
| `CM/CMADMPREV/Relatorios` | 1.782 | 1.674 | 1 | 1 | 1.782 | 1.674 | 100.0% |
| `SHARED/Folhas` | 4.275 | 3.912 | 3 | 0 | 0 | 0 | 0.0% |

## 3. Escopo

- **Dependências:** as 31 dependências compartilhadas com linhas em `docs1/visao-geral/inventario.html` (PFC-26): 28 pacotes de runtime próprios (CM/FUNCEF) com linhas + 3 grupos de units compiladas no executável.
- **Módulos:** CONTRIBUIÇÃO (`CONTRIBUICAOPREV/`), FOLHA (`FOLHA/`), BENEFICIOPREV (`BENEFICIOPREV/`).
- **Recorte herdado do PFC-26/PFC-18:** contam-se apenas `.pas`, `.dfm`, `.dpr`, `.dpk`; ficam fora DFM binário, cópias/backups, duplicatas de conteúdo, `.dof`/`.cfg`/`.res`, VCL/RTL da Borland e componentes de terceiros (Developer Express, InfoPower, ReportBuilder, QuickReport, TeeChart, Indy, Multilizer, Toolbar97, TopGrid, ip2000, 1stClass, JCL) e packages/procedures do Oracle. A análise de uso efetivo respeita o mesmo recorte para ser comparável.
- **Baseline preservada:** os totais consolidados do PFC-26 (2.479.602 / 2.091.675 / 2.531 arquivos) não são alterados; esta análise é aditiva.

## 4. Método (AC4)

A redução de linhas totais para linhas efetivas baseia-se em **evidência de uso real** (análise estática), não em estimativa visual:

1. **Estrutura PFC-26:** `docs/tools/contagem_docs1.py` produz a lista de dependências, seus arquivos contados (com linhas totais/código) e o mapeamento “Usado por” (qual módulo usa cada dependência).
2. **Granularidade:** a unit Delphi (arquivo `.pas`) é a unidade de análise — é a granularidade compilável (uma unit é o que o `uses` referencia). O `.dfm` pareado (form de mesmo nome) acompanha a unit; o `.dpk` (descritor do pacote) acompanha o pacote quando o módulo o requer.
3. **Resolvedor fiel ao Delphi por módulo:** para cada módulo, a resolução de um nome de unit em `uses` segue a ordem do compilador: (a) unit fornecida por pacote próprio (cláusula `contains` do `.dpk` dos pacotes da lista `Packages=` do `.dof` + `requires` recursivo) → source da unit na pasta do pacote; (b) `SearchPath` do `.dof` (`C:\ProjetosCM5\` = raiz do repositório) — o primeiro match vence; (c) fallback determinístico quando há fonte única do nome nas pastas dos pacotes próprios. A escolha é determinística e estável entre execuções.
4. **Fechamento transitivo de `uses`:** a partir das sementes — o `.dpr` do módulo e todas as units `.pas` da pasta do módulo — percorre-se recursivamente as cláusulas `uses` (interface e implementation) de cada arquivo, resolvendo cada nome de unit com o resolvedor acima (entrando nas units das dependências). O conjunto alcançável é tudo que o módulo efetivamente referencia (direta ou indiretamente). Diretivas `{$IFDEF}`/`{$ENDIF}` são removidas junto dos comentários, de modo que **ambos os ramos condicionais entram** (superset conservador). Units da VCL/RTL (lista `STD_UNITS` do PFC-19) são desconsideradas.
5. **Units referenciadas por dependência×módulo:** para cada dependência, as units cujo `.pas` está no conjunto alcançável do módulo. As **linhas efetivas** = soma das linhas dessas units (+ `.dfm` pareado + `.dpk` do pacote se o módulo o requer).
6. **Consolidado (contado uma vez):** para cada dependência, a união das units referenciadas por qualquer dos três módulos. O total efetivo consolidado é comparado com 1.632.702 (totais) / 1.363.291 (código); o delta = linhas não efetivamente utilizadas por nenhum módulo.

**Regra de negócio (exemplo da issue):** um arquivo de dependência com 1.000 linhas e 20 funções, se apenas 5 funções são referenciadas, contribui com uma fração dessas linhas — não com as 1.000 inteiras. Aqui a granularidade é a unit (não a função individual): uma unit referenciada contribui com suas linhas inteiras; uma unit não referenciada não contribui. Isso é um **limite superior** do uso real (uma unit referenciada pode ter funções nem todas chamadas) e um **limite inferior** do volume total do arquivo — tornando o número defensável para a decisão de migração.

## 5. Nota de prontidão para migração (AC5)

Stack-alvo: **.NET 10 + React 19 + Oracle 23ai**. Para cada dependência, indica-se se as units efetivamente usadas têm equivalente direto na stack-alvo ou exigem reimplementação, com o total de linhas efetivas (consolidado, união dos 3 módulos) em cada categoria.

| Categoria | Dependências | Linhas efetivas (total) | Linhas efetivas (código) | Descrição |
| :--- | ---: | ---: | ---: | :--- |
| **Equivalente direto** | 3 | 16.004 | 10.738 | Equivalente direto na stack-alvo (.NET 10 BCL / Oracle 23ai) — mapear a biblioteca, não reescrever |
| **Reimplementação .NET 10** | 12 | 260.007 | 201.273 | Reimplementação em .NET 10 (regras de negócio / domínio / acesso a dados) |
| **Reimplementação React 19** | 5 | 99.604 | 84.781 | Reimplementação em React 19 (UI: forms, dialogs, menus, relatórios) |
| **Reimplementação Oracle 23ai** | 1 | 2.798 | 2.066 | Reimplementação em Oracle 23ai (SQL/PL-SQL) |
| **Reimplementação .NET 10 + React 19** | 10 | 773.525 | 638.359 | Reimplementação .NET 10 (lógica) + React 19 (UI) |
| **Total** | 31 | 1.151.938 | 937.217 |  |

### 5.1 Classificação por dependência

| Dependência | Categoria | Linhas efetivas (total) | Linhas efetivas (código) | Justificativa |
| :--- | :--- | ---: | ---: | :--- |
| `CMAdd50` | Equivalente direto | 13.260 | 8.801 | Zip/Unzip, RIPEMD, TWOFISH, serial port, tray icon → System.IO.Compression, System.Security.Cryptography, lib de serial/porta do .NET 10 |
| `CMAdmPrev` | Reimplementação .NET 10 + React 19 | 615.712 | 518.052 | Núcleo de administração previdenciária: forms de concessão, contribuição, reembolso + datamodules de negócio → lógica em .NET 10, telas em React 19 |
| `CmBack50` | Reimplementação .NET 10 | 24.044 | 20.476 | Backup/restore e sincronização (processo de backend, sem UI) → .NET 10 (serviço/hosted) |
| `CMBussines50` | Reimplementação .NET 10 | 153 | 44 | Objetos de negócio genéricos (sem UI) → .NET 10 (camada de domínio) |
| `CMCapCarObj50` | Reimplementação .NET 10 | 33.714 | 21.967 | Objetos de captação/carga (domínio, sem UI) → .NET 10 |
| `CmCapCarUtilObj50` | Reimplementação .NET 10 + React 19 | 8.674 | 5.089 | Utilitários de captação + forms de lançamento MT → lógica em .NET 10, telas em React 19 |
| `CMCfinanObj50` | Reimplementação .NET 10 | 5.580 | 3.628 | Objetos financeiros (domínio, sem UI) → .NET 10 |
| `CMCompo50` | Reimplementação .NET 10 + React 19 | 47.232 | 38.355 | Componentes CM compartilhados: base de dados, mensagens, procura, teclado + forms → lógica em .NET 10, UI em React 19 |
| `CMContabObj50` | Reimplementação .NET 10 | 11.836 | 8.218 | Objetos de contabilidade (domínio, sem UI) → .NET 10 |
| `CMCrypto` | Equivalente direto | 512 | 382 | Criptografia própria (hash/cifra) → System.Security.Cryptography (.NET 10) |
| `CMForms50` | Reimplementação React 19 | 93.657 | 79.500 | Framework de forms base: login, cadastro, procura, relatórios, menus → reescrito como design system React 19 |
| `CmGlobalObj50` | Reimplementação .NET 10 | 8.232 | 5.811 | Objetos globais / datamodule de configuração → .NET 10 (config/global state) |
| `CMIntBancoMT50` | Reimplementação .NET 10 | 53.792 | 44.256 | Camada de integração com banco (MT) → .NET 10 (EF Core / ADO.NET + Oracle 23ai driver) |
| `CMIntegraEP50` | Reimplementação .NET 10 | 56.787 | 42.834 | Integração de empréstimo (serviços, sem UI) → .NET 10 (integration services) |
| `CMIRRFobj50` | Reimplementação .NET 10 | 3.470 | 2.190 | Cálculo de IRRF (regras tributárias, sem UI) → .NET 10 (motor de cálculo) |
| `CMOld50` | Reimplementação React 19 | 1.611 | 1.261 | Componentes CM antigos (UI legada) → reescrita seletiva em React 19 ou descarte |
| `CmParser50` | Reimplementação .NET 10 | 75 | 35 | Parser de expressões (motor, sem UI) → .NET 10 (parser/evaluator) |
| `CMPlaneOrcObj50` | Reimplementação .NET 10 | 12.693 | 8.457 | Objetos de planejamento/orçamento (domínio, sem UI) → .NET 10 |
| `CMPrevMT50` | Reimplementação .NET 10 + React 19 | 5.325 | 4.151 | Previdência MT: objetos + forms multi-thread → lógica em .NET 10, UI em React 19 |
| `CMPrincipal50` | Reimplementação React 19 | 1.398 | 1.291 | Form principal / menu do sistema → shell React 19 |
| `CMRad50` | Reimplementação .NET 10 + React 19 | 29.971 | 25.781 | Framework RAD (UI dirigida a metadados) → motor de metadados em .NET 10 + UI dinâmica em React 19 |
| `CMRegra50` | Reimplementação .NET 10 + React 19 | 30.910 | 21.466 | Motor de regras + forms de parâmetros/passos → motor em .NET 10, telas de parâmetro em React 19 |
| `CMRegra50MT` | Reimplementação .NET 10 + React 19 | 29.972 | 20.983 | Motor de regras MT + forms → motor em .NET 10, UI em React 19 |
| `CmRelatsOld50` | Reimplementação React 19 | 1.156 | 1.055 | Relatórios antigos (UI de relatório) → React 19 + biblioteca de relatórios |
| `CMResource50` | Equivalente direto | 2.232 | 1.555 | Recursos (strings/imagens) → .resx/.NET 10 + i18n React 19 (mapeamento direto) |
| `CmSql50` | Reimplementação Oracle 23ai | 2.798 | 2.066 | Utilitários de SQL dinâmico → portar para PL/SQL/Oracle 23ai + Dapper/EF Core no .NET 10 |
| `CMTotalPrev50` | Reimplementação .NET 10 | 49.631 | 43.357 | Totalização de previdência (cálculo, sem UI) → .NET 10 |
| `CMWebComum50` | Reimplementação .NET 10 + React 19 | 2.463 | 1.851 | Camada comum do autoatendimento web (controle + forms web) → API .NET 10 + UI React 19 |
| `CM/CMADMPREV/Fontes` | Reimplementação .NET 10 + React 19 | 3.266 | 2.631 | Units de negócio/UI compiladas no .exe (contribuição, INSS) → lógica em .NET 10, telas em React 19 |
| `CM/CMADMPREV/Relatorios` | Reimplementação React 19 | 1.782 | 1.674 | Units de relatório compiladas no .exe → React 19 + biblioteca de relatórios |
| `SHARED/Folhas` | Reimplementação .NET 10 + React 19 | 0 | 0 | Forms compartilhados de folha (geração de listas) → lógica em .NET 10, UI em React 19 |

> A maior parte das linhas efetivas exige **reimplementação** (.NET 10 e/ou React 19): as dependências são código de negócio e UI próprios da FUNCEF, sem equivalente comercial direto. A categoria “Equivalente direto” (criptografia, zip, recursos) concentra o esforço de mapeamento — não de reescrita — e representa fração pequena do total.

## 6. Limitações

- **Granularidade unit, não função:** a análise identifica quais units (`.pas`) são referenciadas, não quais funções/procedures dentro de cada unit. Uma unit referenciada contribui com todas as suas linhas; o uso efetivo real (em nível de função) pode ser menor. Refinar para granularidade de função exigiria um analisador semântico de Pascal (resolução de escopo, sobrecarga, métodos de classe) — o ganho de precisão sobre o limite superior unit não justifica o risco de erro do analisador.
- **Resolução de nomes:** a resolução de `uses` segue a ordem do Delphi — units fornecidas por pacote próprio (cláusula `contains`), depois o `SearchPath` do `.dof` (`C:\ProjetosCM5\` = raiz), com fallback determinístico quando há fonte única nas pastas dos pacotes próprios. Nomes ambíguos (mesmo nome de unit em mais de uma pasta) são resolvidos pela ordem de SearchPath; a escolha é determinística e estável entre execuções.
- **Diretivas condicionais:** ambos os ramos de `{$IFDEF}`/`{$ENDIF}` entram no fechamento (superset). Em produção, só um ramo é compilado; o uso efetivo real pode ser ligeiramente menor.
- **Referência dinâmica:** units carregadas por nome em tempo de execução (RTTI, `RegisterClass`, fábricas) não aparecem em `uses` e não são capturadas. O RAD CM (`CMRad50`) e o motor de regras (`CMRegra50`) usam metadados; suas units de UI podem ser subcontadas.
- **Packages do Oracle:** ficam fora (não são fonte Delphi); sua reimplementação em Oracle 23ai é tratada à parte.
- O estudo reflete o estado do repositório no momento da execução; regenere com `--write` após mudanças.

---

*Gerado por `docs/tools/analise_linhas_dependencias.py` (PFC-44). Baseline PFC-26: 1.632.702 linhas totais / 1.363.291 linhas de código em 31 dependências.*
