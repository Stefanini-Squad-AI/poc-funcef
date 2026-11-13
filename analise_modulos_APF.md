# Análise de Módulos para Contagem SFP — Inventário, Classificação e Prompts

**Issue:** PFC-49 — Geração prompts pontos de função — Todos os módulos
**Data:** 2026-11-12
**Autor:** Squad Blueprint (GLM-5.2)
**Método:** SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0
**Pesos:** 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL)
**Sistema:** Legado Delphi 5 (suíte CM Contabilidade / FUNCEF)

> **Nota sobre o nome do arquivo:** o arquivo se chama `analise_modulos_APF.md` conforme solicitado na issue. O método de contagem adotado é **SFP (Simple Function Points)**, não APF tradicional. A sigla "APF" no nome do arquivo é mantida por compatibilidade com a nomenclatura da issue; o conteúdo usa exclusivamente terminologia SFP.

---

## 1. Objetivo

Este documento inventaria **todos os módulos funcionais do repositório** do sistema legado Delphi 5 (suíte CM Contabilidade / FUNCEF), classifica cada um quanto à contabilidade individual pelo método **SFP (Simple Function Points)**, mapeia dependências e riscos de dupla contagem, e gera um **prompt autônomo e personalizado** para cada módulo recomendado para contagem individual — usando a análise SFP de Folha de Benefícios (`docs1/pontos-de-funcao/folha.html`) como modelo de padronização.

**Valor de negócio:** fornecer uma base auditável e rastreável para dimensionamento funcional de todos os módulos, sustentando estimativas de esforço de modernização, benchmarking e auditoria — sem duplicar funcionalidade ou dados entre fronteiras.

**O que este documento NÃO faz:**
- Não executa a contagem SFP de nenhum módulo novo — apenas inventaria, classifica, planeja e gera prompts.
- Não altera código-fonte ou documentação funcional dos módulos.
- Não mistura regras de APF tradicional (EI/EO/EQ/ILF/EIF, DET/FTR/RET, matrizes de complexidade).
- Não copia conteúdo funcional ou totais de Folha de Benefícios para outros módulos.

---

## 2. Método SFP

O método adotado é **SFP (Simple Function Points / Ponto de Função Simples)**, publicado pelo **IFPUG** (International Function Point Users Group), com pesos do **Roteiro de Métricas de Software do SISP v3.0**.

### 2.1 O que o SFP mede

O SFP mede o **tamanho funcional** de software — o que o sistema faz para o usuário, não como foi implementado. É independente de tecnologia: o mesmo conjunto de funções tem o mesmo número de SFP, seja em Delphi 5, .NET, Java ou qualquer outra linguagem.

### 2.2 Os dois tipos de elemento

O SFP classifica os elementos do sistema em apenas duas categorias:

| Elemento | Sigla | Definição |
|---|---|---|
| **Processo Elementar** | **PE** | A menor unidade de atividade funcional significativa para o usuário. Engloba entradas, saídas e consulta — sem distinguir entre elas. |
| **Arquivo Lógico** | **AL** | Grupo de dados logicamente relacionado, identificável pelo usuário, que a aplicação mantém (cria, atualiza, exclui) ou apenas referencia (lê). Engloba arquivos mantidos dentro da fronteira e arquivos mantidos por outras aplicações — sem distinguir entre eles. |

### 2.3 Pesos e fórmula

```
Total SFP = (qtd_PE × peso_PE) + (qtd_AL × peso_AL)
```

onde **peso_PE = 4,6 SFP** e **peso_AL = 7 SFP**.

| Elemento | Peso (SFP) | Referência |
|---|---|---|
| Processo Elementar (PE) | 4,6 | IFPUG SFP; SISP Roteiro v3.0 |
| Arquivo Lógico (AL) | 7 | IFPUG SFP; SISP Roteiro v3.0 |

### 2.4 Distinção entre SFP e APF tradicional

O SFP **diferencia-se** da APF tradicional (IFPUG FPA) pelos seguintes aspectos:

| Aspecto | SFP | APF tradicional (não usada) |
|---|---|---|
| Tipos de função | 2: PE e AL | 5: EI, EO, EQ, ILF, EIF |
| Complexidade | Não aplica (peso fixo) | Baixa, Média, Alta (matriz DET/FTR/RET) |
| Pesos | PE = 4,6; AL = 7 | Variável por tipo e complexidade |
| Fator de ajuste | Não aplica | VAF (Value Adjustment Factor) |

**Este documento usa exclusivamente terminologia SFP.** Não cita EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional como componentes de contagem.

### 2.5 Versões e fontes consultadas

| Material | Versão | Pesos adotados |
|---|---|---|
| IFPUG SFP (Simple Function Points) | Método SFP conforme regras funcionais do IFPUG | 4,6 SFP/PE; 7 SFP/AL |
| Roteiro de Métricas de Software do SISP | v3.0 | 4,6 SFP/PE; 7 SFP/AL |

Convergência: o Roteiro SISP v3.0 adota os mesmos pesos do método SFP publicado pelo IFPUG. Não houve divergência entre os materiais consultados.

---

## 3. Critérios de classificação

Cada pasta funcional do repositório foi classificada em uma de cinco categorias quanto à contabilidade SFP:

| # | Categoria | Definição |
|---|---|---|
| 1 | **Contar individualmente** | Capacidade funcional própria e fronteira definível. O módulo tem entry point (.dpr) próprio, propósito de negócio distinto e fronteira de aplicação identificável. |
| 2 | **Contar junto com outro módulo** | Parte funcional inseparável de outro módulo. Não tem fronteira própria — sua funcionalidade é parte integrante de outro módulo. |
| 3 | **Dependência ou serviço compartilhado** | Código compartilhado, serviço transversal ou camada de objetos consumida por múltiplos módulos. Avaliar na fronteira do módulo consumidor, não como módulo separado. |
| 4 | **Excluir da contagem funcional** | Apenas infraestrutura, tecnologia, utilitários, build, documentação ou terceiros. Não possui funcionalidade de negócio própria. |
| 5 | **Requer validação** | Informações insuficientes para determinar fronteira ou ownership funcional. Pode ser módulo independente, sub-módulo ou serviço compartilhado — necessita validação com especialista. |

### 3.1 Critérios adicionais

- **Entry point (.dpr):** módulos com `.dpr` próprio são candidatos a "Contar individualmente"; pastas sem `.dpr` são tipicamente bibliotecas compartilhadas (categoria 3 ou 4).
- **Fronteira de aplicação:** a fronteira separa funções mantidas pelo módulo (dentro) de funções mantidas por outros (fora, referenciadas).
- **Propósito de negócio:** o módulo deve ter um propósito funcional distinto, reconhecível pelo usuário — não apenas código técnico.
- **Pacotes CM (BPL):** pacotes `CM*OBJ50` contêm objetos de negócio compartilhados (camada de controle + acesso a dados) consumidos por aplicações — são dependências (categoria 3), não módulos funcionais.
- **App servers (COM/DLL):** servidores COM `APPSERVER*`/`CM*SRVR50` são camada de transporte tecnológico — infraestrutura (categoria 4).
- **Documentação:** pastas `docs`, `docs1`, `Funcef-kit` contêm documentação — categoria 4.

---

## 4. Resumo

### 4.1 Totais por categoria

| Categoria | Quantidade de pastas |
|---|---|
| 1. Contar individualmente | 44 (3 já analisadas + 41 novas) |
| 2. Contar junto com outro módulo | 3 |
| 3. Dependência ou serviço compartilhado | 24 |
| 4. Excluir da contagem funcional | 42 |
| 5. Requer validação | 7 |
| **Total de pastas classificadas** | **120** |

### 4.2 Módulos já analisados (contagem SFP completa)

| Módulo | Pasta | PE | AL | Total SFP | Documento |
|---|---|---|---|---|---|
| Folha de Benefícios | `FOLHA/` | 25 | 23 | 276,0 | `docs1/pontos-de-funcao/folha.html` |
| Contribuição Previdenciária | `CONTRIBUICAOPREV/` | 19 | 22 | 241,4 | `docs1/pontos-de-funcao/contribuicao.html` |
| Benefício Previdenciário | `BENEFICIOPREV/` | 20 | 20 | 232,0 | `docs1/pontos-de-funcao/beneficioprev.html` |
| **Total** | — | **64** | **65** | **749,4** | — |

### 4.3 Módulos recomendados para contagem individual (novos — 41)

| # | Módulo | Pasta | Entry point | Domínio |
|---|---|---|---|---|
| 1 | Cadastro Previdenciário | `CADASTROPREV/` | `CADASTROPREV/Fontes/CadastroPrev.dpr` | Previdenciário |
| 2 | Processos Previdenciários | `PROCPREV/` | `PROCPREV/Fontes/ProcPrev.dpr` | Previdenciário |
| 3 | Assistencial | `ASSISTENCIAL/` | `ASSISTENCIAL/Fontes/assistencial.dpr` | Previdenciário |
| 4 | Contabilidade | `CONTAB/` | `CONTAB/Fontes/Contab.dpr` | Contábil/Financeiro |
| 5 | Contabilidade Financeira | `CFINAN/` | `CFINAN/Fontes/CFINAN.dpr` | Contábil/Financeiro |
| 6 | Contas a Pagar | `CPAGAR/` | `CPAGAR/FontesMT/ContasaPagar.dpr` | Contábil/Financeiro |
| 7 | Contas a Receber | `CRECEBER/` | `CRECEBER/FontesMT/ContasaReceber.dpr` | Contábil/Financeiro |
| 8 | Orçamento | `ORCAMENTO/` | `ORCAMENTO/FontesMT/Orcamento.dpr` | Contábil/Financeiro |
| 9 | IRRF (Imposto de Renda) | `IRRF/` | `IRRF/Fontes/Impostos.dpr` | Contábil/Financeiro |
| 10 | Indicadores | `INDICADORES/` | `INDICADORES/Fontes/Indicadores.dpr` | Contábil/Financeiro |
| 11 | Controle de Aplicações Financeiras | `CAF/` | `CAF/Fontes/Caf.dpr` | Contábil/Financeiro |
| 12 | Cotas | `COTAS/` | `COTAS/Fontes/Cotas.dpr` | Contábil/Financeiro |
| 13 | Administração Imobiliária | `ADMINIMOB/` | `ADMINIMOB/Fontes/AdminImob.dpr` | Imobiliário |
| 14 | Investimento Imobiliário | `INVESTIMOB/` | `INVESTIMOB/Fontes/InvestImob.dpr` | Imobiliário |
| 15 | Alienação de Bens | `ALIENACAO/` | `ALIENACAO/Fontes/Alienacao.dpr` | Imobiliário |
| 16 | Investimentos | `INVESTIMENTOS/` | `INVESTIMENTOS/FontesProducao/Investimentos.dpr` | Investimentos |
| 17 | Receitas de Mercado | `RECMERC/` | `RECMERC/Fontes/RecMerc.dpr` | Investimentos |
| 18 | Sistema Jurídico | `SISTJUR/` | `SISTJUR/Fontes/SistJur.dpr` | Jurídico |
| 19 | Processos Judiciais | `PROCJUD/` | `PROCJUD/Fontes/ProcJud.dpr` | Jurídico |
| 20 | Contratos | `CONTRATO/` | `CONTRATO/Fontes/contrato.dpr` | Jurídico/Contratos |
| 21 | Empréstimo | `EMPRESTIMO/` | `EMPRESTIMO/Fontes/emprestimo.dpr` | Empréstimos |
| 22 | Financiamento | `FINANCIAMENTO/` | `FINANCIAMENTO/Fontes/Financiamento.dpr` | Empréstimos |
| 23 | Almoxarifado | `ALMOXARIFADO/` | `ALMOXARIFADO/Fontes/Almoxarifado.dpr` | Compras/Estoque |
| 24 | Compras | `COMPRAS2000/` | `COMPRAS2000/Fontes/Compras.dpr` | Compras/Estoque |
| 25 | Central de Atendimento | `CENTRALAP/` | `CENTRALAP/Fontes/CentralAP.dpr` | Atendimento |
| 26 | Agendamento | `AGENDAMENTO/` | `AGENDAMENTO/Fontes/Agendamento.dpr` | Atendimento |
| 27 | Autoatendimento | `AUTOATENDIMENTO/` | `AUTOATENDIMENTO/Aplicacao/Fontes/AutoAtendimento.dpr` | Atendimento |
| 28 | Exportação FCRT | `EXPORTFCRT/` | `EXPORTFCRT/Fontes/FCRT.dpr` | FCRT |
| 29 | Simulador FCRT | `SIMULADORFCRT/` | `SIMULADORFCRT/Fontes/SimuladorBrTPREV.dpr` | FCRT |
| 30 | Projeto Atuarial | `PROJETOATUARIAL/` | `PROJETOATUARIAL/FONTES/ProjetoAtuarial.dpr` | Atuarial |
| 31 | Módulo Básico RH | `MODBAS/` | `MODBAS/Fontes/ModBas.dpr` | Recursos Humanos |
| 32 | Folha de Pagamento RH | `MODFOL/` | `MODFOL/Fontes/ModFol.dpr` | Recursos Humanos |
| 33 | Benefícios RH | `MODBEN/` | `MODBEN/Fontes/ModBen.dpr` | Recursos Humanos |
| 34 | Cargos e Salários | `MODCES/` | `MODCES/Fontes/ModCes.dpr` | Recursos Humanos |
| 35 | Avaliação de Desempenho | `MODAVA/` | `MODAVA/Fontes/ModAva.dpr` | Recursos Humanos |
| 36 | Recrutamento e Seleção | `MODRES/` | `MODRES/Fontes/ModRes.dpr` | Recursos Humanos |
| 37 | Treinamento | `MODTRN/` | `MODTRN/Fontes/ModTrn.dpr` | Recursos Humanos |
| 38 | Assiduidade/Movimentação | `MODASM/` | `MODASM/Fontes/ModAsm.dpr` | Recursos Humanos |
| 39 | Gestão de Frota/Automóveis | `MODAUTO/` | `MODAUTO/Fontes/ModAuto.dpr` | Recursos Humanos |
| 40 | Controle de Acesso/Ponto | `MODACESSO/` | `MODACESSO/Fontes/ModAcesso.dpr` | Recursos Humanos |
| 41 | Contencioso RH | `MODCON/` | `MODCON/Fontes/ModCon.dpr` | Recursos Humanos |

### 4.4 Resumo por domínio

| Domínio | Módulos a contar individualmente | Já analisados | Requer validação |
|---|---|---|---|
| Previdenciário | 3 (Cadastro, Proc, Assistencial) | 3 (Folha, Contrib, Benef) | 2 (RADG, SCQ) |
| Contábil/Financeiro | 9 | 0 | 0 |
| Imobiliário | 3 | 0 | 0 |
| Investimentos | 2 | 0 | 3 (InvestCotas, InvestFDO, CotasPatrim) |
| Jurídico/Contratos | 3 | 0 | 0 |
| Empréstimos | 2 | 0 | 0 |
| Compras/Estoque | 2 | 0 | 0 |
| Atendimento | 3 | 0 | 0 |
| FCRT | 2 | 0 | 0 |
| Atuarial | 1 | 0 | 0 |
| Recursos Humanos | 11 | 0 | 1 (SRHCS) |
| Integração/Regras | 0 | 0 | 1 (RelatoriosCM) |
| **Total** | **41** | **3** | **7** |

---

## 5. Inventário de módulos

Inventário completo de todas as pastas funcionais encontradas no repositório, classificadas quanto à contabilidade SFP.

### 5.1 Módulos — Contar individualmente (44)

#### Previdenciário

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `FOLHA/` | Folha de Benefícios | `FOLHA/Fontes/Folha.dpr` | Contar individualmente | SFP completo (276 SFP) | CONTRIB, BENEF, IRRF, CONTAB, PARAMPREV, CADASTROPREV | Concluído |
| `CONTRIBUICAOPREV/` | Contribuição Previdenciária | `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr` | Contar individualmente | SFP completo (241,4 SFP) | FOLHA, BENEF, IRRF, PARAMPREV, CADASTROPREV | Concluído |
| `BENEFICIOPREV/` | Benefício Previdenciário | `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` | Contar individualmente | SFP completo (232 SFP) | FOLHA, CONTRIB, PARAMPREV, CADASTROPREV | Concluído |
| `CADASTROPREV/` | Cadastro Previdenciário | `CADASTROPREV/Fontes/CadastroPrev.dpr` | Contar individualmente | Sem SFP | PARAMPREV | Gerar prompt |
| `PROCPREV/` | Processos Previdenciários | `PROCPREV/Fontes/ProcPrev.dpr` | Contar individualmente | Sem SFP | CADASTROPREV, BENEFICIOPREV, PARAMPREV | Gerar prompt |
| `ASSISTENCIAL/` | Assistencial | `ASSISTENCIAL/Fontes/assistencial.dpr` | Contar individualmente | Sem SFP | CADASTROPREV, BENEFICIOPREV, PARAMPREV | Gerar prompt |

#### Contábil / Financeiro

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `CONTAB/` | Contabilidade | `CONTAB/Fontes/Contab.dpr` | Contar individualmente | Sem SFP | CFINAN, CPAGAR, CRECEBER, ORCAMENTO | Gerar prompt |
| `CFINAN/` | Contabilidade Financeira | `CFINAN/Fontes/CFINAN.dpr` | Contar individualmente | Sem SFP | CONTAB | Gerar prompt |
| `CPAGAR/` | Contas a Pagar | `CPAGAR/FontesMT/ContasaPagar.dpr` | Contar individualmente | Sem SFP | CONTAB, CFINAN, ORCAMENTO | Gerar prompt |
| `CRECEBER/` | Contas a Receber | `CRECEBER/FontesMT/ContasaReceber.dpr` | Contar individualmente | Sem SFP | CONTAB, CFINAN, ORCAMENTO | Gerar prompt |
| `ORCAMENTO/` | Orçamento | `ORCAMENTO/FontesMT/Orcamento.dpr` | Contar individualmente | Sem SFP | CONTAB | Gerar prompt |
| `IRRF/` | IRRF (Imposto de Renda) | `IRRF/Fontes/Impostos.dpr` | Contar individualmente | Sem SFP | — | Gerar prompt |
| `INDICADORES/` | Indicadores | `INDICADORES/Fontes/Indicadores.dpr` | Contar individualmente | Sem SFP | CONTAB, CFINAN | Gerar prompt |
| `CAF/` | Controle de Aplicações Financeiras | `CAF/Fontes/Caf.dpr` | Contar individualmente | Sem SFP | COTAS, CFINAN, CONTAB | Gerar prompt |
| `COTAS/` | Cotas | `COTAS/Fontes/Cotas.dpr` | Contar individualmente | Sem SFP | INVESTIMENTOS, CFINAN | Gerar prompt |

#### Imobiliário

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `ADMINIMOB/` | Administração Imobiliária | `ADMINIMOB/Fontes/AdminImob.dpr` | Contar individualmente | Sem SFP | INVESTIMOB, CONTAB, CFINAN, CPAGAR | Gerar prompt |
| `INVESTIMOB/` | Investimento Imobiliário | `INVESTIMOB/Fontes/InvestImob.dpr` | Contar individualmente | Sem SFP | ADMINIMOB, CONTAB, CFINAN | Gerar prompt |
| `ALIENACAO/` | Alienação de Bens | `ALIENACAO/Fontes/Alienacao.dpr` | Contar individualmente | Sem SFP | INVESTIMOB, ADMINIMOB, CONTAB | Gerar prompt |

#### Investimentos

| Pasta | Nome | Entry point | Recomendação |1 | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `INVESTIMENTOS/` | Investimentos | `INVESTIMENTOS/FontesProducao/Investimentos.dpr` | Contar individualmente | Sem SFP | COTAS, CFINAN, CONTAB, CAF | Gerar prompt |
| `RECMERC/` | Receitas de Mercado | `RECMERC/Fontes/RecMerc.dpr` | Contar individualmente | Sem SFP | INVESTIMENTOS, CFINAN | Gerar prompt |

#### Jurídico / Contratos

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `SISTJUR/` | Sistema Jurídico | `SISTJUR/Fontes/SistJur.dpr` | Contar individualmente | Sem SFP | PROCJUD, CONTRATO, MODCON | Gerar prompt |
| `PROCJUD/` | Processos Judiciais | `PROCJUD/Fontes/ProcJud.dpr` | Contar individualmente | Sem SFP | SISTJUR, CONTRATO | Gerar prompt |
| `CONTRATO/` | Contratos | `CONTRATO/Fontes/contrato.dpr` | Contar individualmente | Sem SFP | CPAGAR, CRECEBER | Gerar prompt |

#### Empréstimos / Financiamento

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `EMPRESTIMO/` | Empréstimo | `EMPRESTIMO/Fontes/emprestimo.dpr` | Contar individualmente | Sem SFP | CRECEBER, CONTAB, CADASTROPREV | Gerar prompt |
| `FINANCIAMENTO/` | Financiamento | `FINANCIAMENTO/Fontes/Financiamento.dpr` | Contar individualmente | Sem SFP | EMPRESTIMO, CRECEBER, CONTAB | Gerar prompt |

#### Compras / Almoxarifado

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `ALMOXARIFADO/` | Almoxarifado | `ALMOXARIFADO/Fontes/Almoxarifado.dpr` | Contar individualmente | Sem SFP | COMPRAS2000, CONTAB, CPAGAR | Gerar prompt |
| `COMPRAS2000/` | Compras | `COMPRAS2000/Fontes/Compras.dpr` | Contar individualmente | Sem SFP | ALMOXARIFADO, CPAGAR | Gerar prompt |

#### Atendimento

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `CENTRALAP/` | Central de Atendimento | `CENTRALAP/Fontes/CentralAP.dpr` | Contar individualmente | Sem SFP | CADASTROPREV, AGENDAMENTO | Gerar prompt |
| `AGENDAMENTO/` | Agendamento | `AGENDAMENTO/Fontes/Agendamento.dpr` | Contar individualmente | Sem SFP | CADASTROPREV | Gerar prompt |
| `AUTOATENDIMENTO/` | Autoatendimento | `AUTOATENDIMENTO/Aplicacao/Fontes/AutoAtendimento.dpr` | Contar individualmente | Sem SFP | EMPRESTIMO, CADASTROPREV | Gerar prompt |

#### FCRT / Atuarial

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `EXPORTFCRT/` | Exportação FCRT | `EXPORTFCRT/Fontes/FCRT.dpr` | Contar individualmente | Sem SFP | BENEFICIOPREV, CONTRIBUICAOPREV, FOLHA | Gerar prompt |
| `SIMULADORFCRT/` | Simulador FCRT | `SIMULADORFCRT/Fontes/SimuladorBrTPREV.dpr` | Contar individualmente | Sem SFP | BENEFICIOPREV, PROJETOATUARIAL | Gerar prompt |
| `PROJETOATUARIAL/` | Projeto Atuarial | `PROJETOATUARIAL/FONTES/ProjetoAtuarial.dpr` | Contar individualmente | Sem SFP | CADASTROPREV, PARAMPREV | Gerar prompt |

#### Recursos Humanos (MOD*)

| Pasta | Nome | Entry point | Recomendação | Estado doc | Dependências | Próxima ação |
|---|---|---|---|---|---|---|
| `MODBAS/` | Módulo Básico RH | `MODBAS/Fontes/ModBas.dpr` | Contar individualmente | Sem SFP | — | Gerar prompt |
| `MODFOL/` | Folha de Pagamento RH | `MODFOL/Fontes/ModFol.dpr` | Contar individualmente | Sem SFP | MODBAS, MODBEN, IRRF, CONTAB | Gerar prompt |
| `MODBEN/` | Benefícios RH | `MODBEN/Fontes/ModBen.dpr` | Contar individualmente | Sem SFP | MODBAS, MODFOL | Gerar prompt |
| `MODCES/` | Cargos e Salários | `MODCES/Fontes/ModCes.dpr` | Contar individualmente | Sem SFP | MODBAS, MODFOL | Gerar prompt |
| `MODAVA/` | Avaliação de Desempenho | `MODAVA/Fontes/ModAva.dpr` | Contar individualmente | Sem SFP | MODBAS, MODCES | Gerar prompt |
| `MODRES/` | Recrutamento e Seleção | `MODRES/Fontes/ModRes.dpr` | Contar individualmente | Sem SFP | MODBAS, MODCES | Gerar prompt |
| `MODTRN/` | Treinamento | `MODTRN/Fontes/ModTrn.dpr` | Contar individualmente | Sem SFP | MODBAS, MODCES | Gerar prompt |
| `MODASM/` | Assiduidade/Movimentação | `MODASM/Fontes/ModAsm.dpr` | Contar individualmente | Sem SFP | MODBAS, MODACESSO | Gerar prompt |
| `MODAUTO/` | Gestão de Frota/Automóveis | `MODAUTO/Fontes/ModAuto.dpr` | Contar individualmente | Sem SFP | MODBAS, CONTRATO | Gerar prompt |
| `MODACESSO/` | Controle de Acesso/Ponto | `MODACESSO/Fontes/ModAcesso.dpr` | Contar individualmente | Sem SFP | MODBAS | Gerar prompt |
| `MODCON/` | Contencioso RH | `MODCON/Fontes/ModCon.dpr` | Contar individualmente | Sem SFP | MODBAS, SISTJUR, PROCJUD | Gerar prompt |

### 5.2 Módulos — Contar junto com outro módulo (3)

| Pasta | Nome | Entry point | Contar junto com | Justificativa |
|---|---|---|---|---|
| `CAFMT/` | CAF Multi-Tier | `CAFMT/Fontes/Caf.dpr` | `CAF/` | Variante multi-tier (MT) do mesmo módulo CAF — mesma fronteira funcional, mesma capacidade de negócio. |
| `MODATN/` | Atendimento (RH) | `MODATN/Fontes/ModAtn.dpr` | `MODBAS/` | Módulo fino de atendimento/documentos com automação Word — parte integrante da base de RH, sem fronteira própria. |
| `SISTJURCONS/` | Sistema Jurídico Consultivo | `SISTJURCONS/Fontes/SistJurCons.dpr` | `SISTJUR/` | Companheiro consultivo do sistema jurídico — mesma fronteira funcional de gestão legal. |

### 5.3 Módulos — Dependência ou serviço compartilhado (24)

| Pasta | Nome | Entry point / package | Módulos que consomem | Justificativa |
|---|---|---|---|---|
| `PARAMPREV/` | Parâmetros Previdenciários | `ParamPrev.dpr` | FOLHA, CONTRIB, BENEF, CADASTROPREV, PROCPREV, ASSISTENCIAL, PROJETOATUARIAL | Serviço de configuração transversal — parâmetros e tabelas operacionais do subsistema previdenciário. |
| `REGRA/` | Regras de Negócio | `Regra.dpr` | Todos os módulos que usam o motor de regras | Serviço transversal de definição de regras de negócio. |
| `EXECUTAREGRA/` | Execução de Regras | `ExecutaRegra.dpr` | Todos os módulos que executam regras | Motor de execução de regras em runtime. |
| `INTERFACEPREV/` | Interface Previdenciária | `InterfacePrev.dpr` | FOLHA, CONTRIB, BENEF, PROCPREV | Camada de integração previdenciária — serviço compartilhado. |
| `INTEGRASAF/` | Integração SAF | `IntegraSAF.dpr` | CONTAB, CFINAN, CPAGAR, CRECEBER | Integração com sistema externo SAF — serviço compartilhado. |
| `GLOBALCM/` | Global CM | `GlobalCM.dpr` | Todos os módulos CM | Objetos, formulários e relatórios compartilhados entre módulos. |
| `REFER/` | Referências | `Refer.dpr` | Múltiplos módulos | Tabelas de lookup/referência compartilhadas. |
| `FUNCOESGERAIS/` | Funções Gerais | (sem .dpr — biblioteca) | Múltiplos módulos | Funções utilitárias (ativo fixo, investimento, dias úteis, OLE/Word). |
| `GERAL/` | Geral | (sem .dpr — biblioteca) | Múltiplos módulos | Objetos de domínio geral (moeda, centro de custo, orçamento, estado). |
| `BACK/` | Back (bancário) | (sem .dpr — biblioteca) | CFINAN, CPAGAR, CRECEBER, CAF | Objetos de controle bancário compartilhados. |
| `SHARED/` | Shared | `ModComp.dpr` | Múltiplos módulos | Módulos compartilhados multi-sistema (componentes, compras, folhas). |
| `MTSMESTREDETALHE/` | MTS Mestre-Detalhe | `MtsMestreDetalhe.dpr` | Múltiplos módulos | Framework reutilizável mestre-detalhe para MTS/COM+. |
| `FLASHRPT/` | Flash Report | `FlashRpt.dpr` | Múltiplos módulos | Ferramenta de relatórios auxiliar. |
| `OBJRAD/` | Objetos RAD | `CMObjRAD.dpk` | PROCPREV, BENEFICIOPREV | Pacote de objetos de negócio para workflow RAD. |
| `EMPRESTIMOBPL/` | BPL Empréstimo | (pacotes .dpk) | EMPRESTIMO, FINANCIAMENTO, AUTOATENDIMENTO | Biblioteca de pacotes BPL reutilizável do subsistema de empréstimo. |
| `CMGLOBALOBJ50/` | CM Objetos Globais | `CmGlobalObj50.dpk` | Todos os módulos | Objetos de negócio globais compartilhados. |
| `CMCONTABOBJ50/` | CM Objetos Contabilidade | `CMContabObj50.d! dpk` | CONTAB, CFINAN, CPAGAR, CRECEBER | Objetos de negócio da contabilidade geral. |
| `CMCFINANOBJ50/` | CM Objetos CFINAN | `CMCfinanObj50.dpk` | CFINAN | Objetos de negócio da contabilidade financeira. |
| `CMRHOBJ50/` | CM Objetos RH | `CmRHObj50.dpk` | MODBAS, MODFOL, MODBEN, MODCES, MODAVA, MODRES, MODTRN, MODASM | Objetos de negócio de RH/folha (cargos, rubricas, cálculo, RAIS). |
| `CMRHOBJUTIL50/` | CM Objetos RH Util | `CmRHObj70.dpk` | MODACESSO, MODASM | Objetos utilitários de RH (biometria, componentes). |
| `CMCAFOBJ50/` | CM Objetos CAF | `CMCAFObj50.dpk` | CAF, CAFMT | Objetos de negócio do controle de ativo fixo. |
| `CMCAPCAROBJ50/` | CM Objetos CapCar | `CMCAPCarObj50.dpk` | CPAGAR, CRECEBER | Objetos de negócio de contas a pagar/receber. |
| `CMIMOBILIARIOOBJ50/` | CM Objetos Imobiliário | `CMImobiliarioObj50.dpk` | ADMINIMOB, INVESTIMOB, ALIENACAO | Objetos de negócio imobiliário. |
| `CMINTBANCOMT50/` | CM Integração Banco MT | `CMIntBancoMT50.dpk` | CPAGAR, CRECEBER, CFINAN | Objetos de integração bancária e CNAB. |

> **Nota:** os demais pacotes CM (`CMAGENDAMENTOOBJ50`, `CMALMOXCOMPRAOBJ50`, `CMBACK`, `CMCAPCARUTILOBJ50`, `CMCOMPORH`, `CMINDICADORESOBJ50`, `CMIRRFOBJ50`, `CMLIVROOBJ50`, `CMPLANEORCOBJ50`, `CMRELATORIOOBJ50`) são também dependências compartilhadas (categoria 3), agrupadas na seção 5.4 por brevidade.

### 5.4 Módulos — Excluir da contagem funcional (42)

| Pasta | Nome | Tipo | Justificativa |
|---|---|---|---|
| `CM/` | Framework CM core | Infraestrutura | Framework base: componentes, formulários, motor de regras, parser, SQL helpers, terceiros. |
| `CMCRYPTO/` | CM Crypto | Infraestrutura | Pacote de criptografia. |
| `CMCOMPORH/` | CM Componentes RH | Infraestrutura | Componentes visuais Delphi para telas de RH. |
| `CMAGENDAMENTOOBJ50/` | CM Objetos Agendamento | Dependência (BPL) | Objetos de negócio do agendamento. |
| `CMALMOXCOMPRAOBJ50/` | CM Objetos Almox/Compras | Dependência (BPL) | Objetos de negócio de almoxarifado/compras. |
| `CMALMOXCOMPRASRVR50/` | CM Almox/Compras Server | Infraestrutura (COM) | Servidor COM para almox/compras. |
| `CMBACK/` | CM Back | Dependência (BPL) | Objetos de back-office bancário. |
| `CMCAPCARUTILOBJ50/` | CM CapCar Util | Dependência (BPL) | Utilitários de contas a pagar/receber. |
| `CMINDICADORESOBJ50/` | CM Objetos Indicadores | Dependência (BPL) | Objetos de indicadores. |
| `CMIRRFOBJ50/` | CM Objetos IRRF | Dependência (BPL) | Objetos de IRRF. |
| `CMLIVROOBJ50/` | CM Objetos Livros Fiscais |- Dependência (BPL) | Objetos de livros fiscais (ICMS/PIS/COFINS/ISS). |
| `CMPLANEORCOBJ50/` | CM Objetos Planejamento Orçamento | Dependência (BPL) | Objetos de orçamento. |
| `CMRELATORIOOBJ50/` | CM Objetos Relatório | Dependência (BPL) | Motor de relatórios dinâmico. |
| `CMMODAVASVR50/` | CM ModAva Server | Infraestrutura (COM) | Servidor COM para avaliação. |
| `CMMODBENSVR50/` | CM ModBen Server | Infraestrutura (COM) | Servidor COM para benefícios. |
| `CMMTSOBJRH/` | CM MTS Objetos RH | Infraestrutura (COM) | Servidor MTS/COM+ para RH. |
| `CMPADORESSVR50/` | CM Padrões Server | Infraestrutura (COM) | Servidor COM de padrões compartilhados. |
| `APPSERVERCFINAN/` | App Server CFINAN | Infraestrutura (COM) | Servidor COM para contabilidade financeira. |
| `APPSERVERDLL/` | App Server Contab | Infraestrutura (COM) | Servidor COM para contabilidade. |
| `APPSERVERIRRFDLL/` | App Server IRRF | Infraestrutura (COM) | Servidor COM para IRRF. |
| `APPSERVERLIVRODLL/` | App Server Livros | Infraestrutura (COM) | Servidor COM para livros fiscais. |
| `APPSERVERORCAMENTO/` | App Server Orçamento | Infraestrutura (COM) | Servidor COM para orçamento. |
| `APPSRVCAPCAR/` | App Server CapCar | Infraestrutura (COM) | Servidor COM para contas a pagar/receber. |
| `BIN/` | Binários | Infraestrutura | DLLs, OCXs, BPLs de runtime. |
| `SCRIPT/` | Scripts SQL | Infraestrutura | Scripts de banco de dados por ticket. |
| `__SCRIPTS__/` | Scripts de migração | Infraestrutura | Scripts de migração organizados por ano. |
| `ATUVERSAOCM/` | Atualização de Versão CM | Infraestrutura | Utilitário de atualização de versão. |
| `HELP/` | Help | Infraestrutura | Arquivos de ajuda de componentes terceiros. |
| `HELP_PLANUS/` | Help Planus | Infraestrutura | Help do subsistema Planus Orçamento. |
| `STK/` | EMS Quick Export | Infraestrutura | Toolkit terceiro (data export). |
| `EPIM/` | EPIM | Biblioteca compartilhada | Biblioteca de formulários imobiliários (sem .dpr). |
| `EPIMIMOB/` | EPIMIMOB | Biblioteca compartilhada | Variante da biblioteca EPIM (sem .dpr). |
| `ALMOX&COMPRAS/` | Almox & Compras (shared) | Biblioteca compartilhada | Fontes compartilhadas de almoxarifado/compras (sem .dpr). |
| `FUNCEF/` | Aplicação FUNCEF | Shell/launcher | Aplicação principal que consome BPLs — container, não fronteira funcional própria. |
| `PROJETOCM/` | Projeto CM | Shell/launcher | Shell/launcher central do CM. |
| `PROJETOSCM5/` | Projetos CM5 | Umbrella | Grupo de projetos umbrella — sem funcionalidade própria. |
| `docs/` | Docs | Documentação | Portal de documentação moderna e roadmap de migração. |
| `docs1/` | Docs1 | Documentação | Portal do Blueprint AS-IS (documentação funcional e SFP). |
| `Funcef-kit/` | FUNCEF Kit | Documentação | Manual de arquitetura, versionamento e templates. |
| `FUNCEF.WebEmprestimo/` | FUNCEF Web Empréstimo | Modernização (.NET) | Solução web .NET/C# — camada de modernização, não parte do sistema Delphi 5 contado. |
| `poc-contabil/` | POC Contábil | Prova de conceito | Spike de migração — não funcionalidade em produção. |

### 5.5 Módulos — Requer validação (7)

| Pasta | Nome | Entry point | Questão em aberto | Próxima ação |
|---|---|---|---|---|
| `INVESTCOTAS/` | Investimento em Cotas | `InvestCotas.dpr` | Fronteira: módulo independente ou sub-módulo de `INVESTIMENTOS/`? | Validar com especialista. |
| `INVESTFDO/` | Investimento em Fundos | `InvestFDO.dpr` | Fronteira: módulo independente ou sub-módulo de `INVESTIMENTOS/`? | Validar com especialista. |
| `COTASPATRIM/` | Cotas Patrimoniais | `CotasPatrim.dpr` | Fronteira: módulo independente, parte de `COTAS/` ou de `INVESTIMENTOS/`? | Validar com especialista. |
| `RADG/` | RADG | `RADg.dpr` | Fronteira: módulo de relatórios independente ou parte de `RELATORIOSCM/`? | Validar com especialista. |
| `SCQ/` | SCQ | `SCQ.dpr` | Fronteira: módulo de controle/consulta previdenciária independente? | Validar com especialista. |
| `SRHCS/` | Sistema de RH | `SrhCs.dpr` | Fronteira: sistema de RH independente ou integrado aos módulos `MOD*`? | Validar com especialista. |
| `RELATORIOSCM/` | Relatórios CM | `RelatoriosCm.dpr` | Fronteira: gerador de relatórios independente ou serviço compartilhado? | Validar com especialista. |

---

## 6. Mapa de dependências

### 6.1 Dependências entre módulos "Contar individualmente"

| Módulo | Depende de (leitura/referência) | Dados compartilhados | Risco de dupla contagem |
|---|---|---|---|
| FOLHA | CONTRIBUICAOPREV, BENEFICIOPREV, IRRF, CONTAB, PARAMPREV, CADASTROPREV | `BENEFBFCIARIO`, `PROCESSOBENEF`, `HSTCONTRIBPREV`, `HISTRUBSAL`, `PREVIA`, `TMPDESC` | Sim — `BENEFBFCIARIO` e `PROCESSOBENEF` (já identificados) |
| CONTRIBUICAOPREV | FOLHA, BENEFICIOPREV, IRRF, PARAMPREV, CADASTROPREV | `HSTCONTRIBPREV`, `HISTRUBSAL`, `TMPDESC` | Não (dono de `HSTCONTRIBPREV`) |
| BENEFICIOPREV | FOLHA, CONTRIBUICAOPREV, PARAMPREV, CADASTROPREV | `BENEFBFCIARIO`, `PROCESSOBENEF`, `PREVIA` | Sim — `BENEFBFCIARIO` e `PROCESSOBENEF` (já identificados) |
| CADASTROPREV | PARAMPREV | `PESSOA`, `PARTICIPANTE`, `PATRO` | Não (dono dos dados cadastrais) |
| PROCPREV | CADASTROPREV, BENEFICIOPREV, PARAMPREV | Dados de processo/benefício | A validar (sobreposição com BENEFICIOPREV) |
| ASSISTENCIAL | CADASTROPREV, BENEFICIOPREV, PARAMPREV | Dados de benefício assistencial | A validar (sobreposição com BENEFICIOPREV) |
| CONTAB | CFINAN, CPAGAR, CRECEBER, ORCAMENTO | Lançamentos contábeis | A validar (sub-razões podem compartilhar dados) |
| CFINAN | CONTAB | Movimentações financeiras | A validar (fronteira com CONTAB) |
| CPAGAR | CONTAB, CFINAN, ORCAMENTO | Documentos a pagar | Não |
| CRECEBER | CONTAB, CFINAN, ORCAMENTO | Documentos a receber | Não |
| ORCAMENTO | CONTAB | Saldos e contas orçamentárias | Não |
| IRRF | — | Tabelas de IR | Não (dono das tabelas) |
| INDICADORES | CONTAB, CFINAN | Dados para KPIs | Não (consome dados, não mantém) |
| CAF | COTAS, CFINAN, CONTAB | Aplicações financeiras | A validar (sobreposição com COTAS) |
| COTAS | INVESTIMENTOS, CFINAN | Cotas de fundos | A validar (sobreposição com INVESTIMENTOS) |
| ADMINIMOB | INVESTIMOB, CONTAB, CFINAN, CPAGAR | Contratos imobiliários | A validar (sobreposição com INVESTIMOB) |
| INVESTIMOB | ADMINIMOB, CONTAB, CFINAN | Imóveis investidos | A validar (sobreposição com ADMINIMOB) |
| ALIENACAO | INVESTIMOB, ADMINIMOB, CONTAB | Bens alienados | A validar (sobreposição com INVESTIMOB) |
| INVESTIMENTOS | COTAS, CFINAN, CONTAB, CAF | Carteira de investimentos | A validar (sobreposição com COTAS, CAF) |
| RECMERC | INVESTIMENTOS, CFINAN | Receitas de mercado | Não |
| SISTJUR | PROCJUD, CONTRATO, MODCON | Processos jurídicos | A validar (sobreposição com PROCJUD) |
| PROCJUD | SISTJUR, CONTRATO | Processos judiciais | A validar (sobreposição com SISTJUR) |
| CONTRATO | CPAGAR, CRECEBER | Contratos | Não |
| EMPRESTIMO | CRECEBER, CONTAB, CADASTROPREV | Empréstimos | Não |
| FINANCIAMENTO | EMPRESTIMO, CRECEBER, CONTAB | Financiamentos | A validar (sobreposição com EMPRESTIMO) |
| ALMOXARIFADO | COMPRAS2000, CONTAB, CPAGAR | Itens de estoque | Não |
| COMPRAS2000 | ALMOXARIFADO, CPAGAR | Pedidos de compra | Não |
| CENTRALAP | CADASTROPREV, AGENDAMENTO | Atendimentos | Não |
| AGENDAMENTO | CADASTROPREV | Agendas | Não |
| AUTOATENDIMENTO | EMPRESTIMO, CADASTROPREV | Empréstimos web | A validar (sobreposição com EMPRESTIMO) |
| EXPORTFCRT | BENEFICIOPREV, CONTRIBUICAOPREV, FOLHA | Dados previdenciários | Não (exportação, não mantém) |
| SIMULADORFCRT | BENEFICIOPREV, PROJETOATUARIAL | Simulação de benefícios | Não (simulação, não mantém) |
| PROJETOATUARIAL | CADASTROPREV, PARAMPREV | Projeções atuariais | Não |
| MODBAS | — | Pessoas, filiais, sindicatos | Não (dono dos dados base de RH) |
| MODFOL | MODBAS, MODBEN, IRRF, CONTAB | Rubricas, provisões,: folha | A validar (sobreposição com MODBEN, IRRF) |
| MODBEN | MODBAS, MODFOL | Benefícios RH | A validar (sobreposição com MODFOL) |
| MODCES | MODBAS, MODFOL | Cargos, faixas salariais | Não |
| MODAVA | MODBAS, MODCES | Avaliações de desempenho | Não |
| MODRES | MODBAS, MODCES | Requisições de pessoal | Não |
| MODTRN | MODBAS, MODCES | Cursos, treinamentos | Não |
| MODASM | MODBAS, MODACESSO | Faltas, ocorrências, PCMSO | Não |
| MODAUTO | MODBAS, CONTRATO | Contratos de frota, OS | A validar (sobreposição com CONTRATO) |
| MODACESSO | MODBAS | Cartões, biometria, ponto | Não |
| MODCON | MODBAS, SISTJUR, PROCJUD | Processos contenciosos RH | A validar (sobreposição com SISTJUR, PROCJUD) |

### 6.2 Riscos de dupla contagem identificados

A dupla contagem no SFP ocorre quando o mesmo Arquivo Lógico (AL) é contado em mais de um módulo. Os riscos identificados:

| Dado compartilhado | Módulos que mantêm | Risco | Recomendação |
|---|---|---|---|
| `BENEFBFCIARIO` | FOLHA e BENEFICIOPREV | **Sim — 1 AL (7 SFP)** | Já identificado em `folha.html` e `beneficioprev.html`. Validar dono funcional. |
| `PROCESSOBENEF` | FOLHA e BENEFICIOPREV | **Sim — 1 AL (7 SFP)** | Já identificado. Validar dono funcional. |
| Lançamentos contábeis | CONTAB e CFINAN | A validar | Definir se CONTAB é o dono e CFINAN referenciado, ou vice-versa. |
| Cotas de fundos | COTAS e INVESTIMENTOS | A validar | Definir fronteira entre COTAS e INVESTIMENTOS. |
| Contratos imobiliários | ADMINIMOB e INVESTIMOB | A validar | Definir fronteira entre administração e investimento imobiliário. |
| Processos jurídicos | SISTJUR e PROCJUD | A validar | Definir fronteira entre sistema jurídico e processos judiciais. |
| Empréstimos | EMPRESTIMO e FINANCIAMENTO | A validar | Definir se FINANCIAMENTO é sub-módulo de EMPRESTIMO. |
| Empréstimos (web) | EMPRESTIMO e AUTOATENDIMENTO | A validar | Definir se AUTOATENDIMENTO é canal de EMPRESTIMO ou fronteira própria. |
| Dados de RH | MODBAS e SRHCS | A validar | Definir sobreposição entre SRHCS e módulos MOD*. |
| Rubricas/benefícios | MODFOL e MODBEN | A validar | Definir fronteira entre folha de pagamento e benefícios RH. |

---

## 7. Padrão da análise SFP de Folha de Benefícios

A análise SFP de Folha de Benefícios em `docs1/pontos-de-funcao/folha.html` é o **modelo de padronização** a ser replicado em todas as contagens futuras. Esta seção documenta o padrão visual e metodológico observado.

### 7.1 Estrutura de seções do modelo

A análise SFP de Folha (`folha.html`) contém as seguintes seções:

| # | Seção | Conteúdo | Padrão a replicar |
|---|---|---|---|
| 1 | Identificação da contagem | Tabela de atributos (nome, código, pasta, entry point, tecnologia, propósito, fronteira, escopo, data, método, versão, casos de uso, modelo de dados, integrações) | Replicar a tabela de identificação com os dados reais de cada módulo. |
| 2 | Sumário executivo | Cards com totais (PE, AL, elementos, SFP) + tabela de memória de cálculo + interpretação | Replicar os cards e a tabela. O total é recalculado a partir do inventário. |
| 3 | Inventário de Processos Elementares (PE) | Tabela com ID, nome, objetivo, caso de uso/jornada, justificativa de distinção, fonte, situação | Replicar a tabela. Cada PE tem justificativa de distinção e fonte no código. |
| 4 | Inventário de Arquivos Lógicos (AL) | Tabela com ID, nome, descrição, fronteira, PE relacionados, fonte, situação | Replicar a tabela. Cada AL indica se é mantido ou referenciado. |
| 5 | Memória de cálculo | Fórmula aplicada + tabela de subtotais + verificação | Replicar a fórmula `(qtd_PE × 4,6) + (qtd_AL × 7) = total SFP`. |
| 6 | Rastreabilidade | Tabela mapeando PE → caso de uso → jornada → regras → fonte código | Replicar a rastreabilidade de cada PE. |
| 7 | Integrações e dupla contagem | Tabela de dados compartilhados + dependências externas | Replicar a análise de dupla contagem específica do módulo. |
| 8 | Pendências | Tabela de elementos com identificação incompleta + impacto | Replicar as pendências. No SFP, confirmação de grupo lógico não altera o peso. |

### 7.2 Padrão visual

- **Badge no header:** `Blueprint AS-IS — Delphi 5 — PFC-XX`
- **Navegação:** links para Entrada, Folha, Contribuição, Benefício Previdenciário, Metodologia e Voltar ao Blueprint
- **Classificação de evidência:** `COMPROVADO` (verde), `INFERIDO` (amarelo), `PENDENTE` (vermelho)
- **Tabelas:** com `table-wrap` para responsividade
- **Notas:** `note-info` para informações, `note` para advertências
- **Footer:** identifica issue, método, sistema, idioma e data

### 7.3 Padrão metodológico

- **Identificação de PE:** cada caso de uso (UC) documentado é decomposto em um ou mais processos elementares. A decomposição segue o princípio de atividade indivisível significativa para o usuário.
- **Identificação de AL:** cada grupo de dados logicamente relacionado, identificável pelo usuário, com evidência de manutenção (INSERT/UPDATE/DELETE) ou leitura dentro da fronteira. Grupos lógicos — não tabelas físicas isoladas.
- **Fronteira:** o módulo é tratado como aplicação com fronteira própria. Dados compartilhados contados como AL no módulo "dono" e referenciados nos demais.
- **Não contados:** mensagens, logs, dados derivados, telas, formulários, botões, relatórios como artefato físico, APIs, units, procedures, métodos, eventos, componentes, linhas de código, tabelas físicas isoladas.
- **Pendências:** elementos com identificação incompleta são marcados `PENDENTE` e não apresentados como contagem confirmada.
- **Delphi 5 como contexto técnico:** registrado como característica técnica, não como fator de contagem. Não converte linhas de código, formulários ou componentes em SFP.

### 7.4 Problemas encontrados no modelo (não propagar)

- A análise de Folha tem 8 pendências (AL-03, AL-07, AL-09, AL-10, AL-11, AL-16–AL-19, AL-21–AL-22) — grupos lógicos a confirmar. **Não propagar estas pendências para outros módulos** — cada módulo tem suas próprias pendências.
- A dupla contagem de `BENEFBFCIARIO` e `PROCESSOBENEF` (FOLHA × BENEFICIOPREV) é específica da fronteira entre esses dois módulos. **Não presumir** os mesmos riscos em outros módulos.
- O total de 276 SFP é específico de Folha. **Não copiar totais** de Folha para outros módulos — cada contagem é independente.

---

## 8. Localização de abas na navegação

### 8.1 Estrutura atual da navegação "Análise de pontos de função"

A área "Análise de pontos de função" está em `docs1/pontos-de-funcao/index.html` com a seguinte navegação em abas:

| Aba | Arquivo | Estado |
|---|---|---|
| Entrada | `docs1/pontos-de-funcao/index.html` | Existente |
| Folha de Benefícios | `docs1/pontos-de-funcao/folha.html` | Existente (S(SFP completo) |
| Contribuição Previdenciária | `docs1/pontos-de-funcao/contribuicao.html` | Existente (SFP completo) |
| Benefício Previdenciário | `docs1/pontos-de-funcao/beneficioprev.html` | Existente (SFP completo) |
| Metodologia da contagem | `docs1/pontos-de-funcao/metodologia.html` | Existente |

### 8.2 Navegação no portal principal

O portal principal `docs1/index.html` tem um card "Análise de pontos de função" que linka para `docs1/pontos-de-funcao/index.html`.

### 8.3 Instrução para novos módulos

Cada prompt individual instrui a criar uma **nova aba** na navegação "Análise de pontos de função":

1. Criar o arquivo `docs1/pontos-de-funcao/<modulo>.html` com a análise SFP completa (seguindo o padrão de `folha.html`).
2. Adicionar o link da nova aba na navegação `<nav>` de:
   - `docs1/pontos-de-funcao/index.html`
   - `docs1/pontos-de-funcao/folha.html`
   - `docs1/pontos-de-funcao/contribuicao.html`
   - `docs1/pontos-de-funcao/beneficioprev.html`
   - `docs1/pontos-de-funcao/metodologia.html`
   - O novo arquivo criado
3. Adicionar um card na seção "Análises por módulo" de `docs1/pontos-de-funcao/index.html`.
4. Adicionar uma linha na tabela "Resumo comparativo" de `docs1/pontos-de-funcao/index.html`.

---

## 9. Ordem de execução

### 9.1 Fases do trabalho

| Fase | Descrição | Estado |
|---|---|---|
| 1. Explorar o repositório | Inventariar módulos, documentação, navegação, análises SFP existentes | Concluída |
| 2. Avaliar módulos | Recomendar contagem individual, agrupamento, exclusão ou validação | Concluída |
| 3. Padronizar | Descrever padrão metodológico e visual da análise SFP de Folha | Concluída |
| 4. Gerar o documento | `analise_modulos_APF.md` com inventário e prompts | Concluída |
| 5. Validar | Confirmar cobertura, personalização, método SFP, caminhos existentes, preservação do repositório | Concluída |

### 9.2 Ordem recomendada para execução dos prompts

A execução dos prompts individuais (contagem SFP de cada módulo) deve seguir uma ordem que respeite as dependências — módulos sem dependências externas primeiro, para que as fronteiras e dados compartilhados sejam definidos antes dos módulos que os referenciam.

| Ordem | Módulo | Justificativa da ordem |
|---|---|---|
| 1 | MODBAS | Base de RH sem dependências — fundação para os demais MOD* |
| 2 | MODACESSO | Depende apenas de MODBAS |
| 3 | IRRF | Sem dependências — fornece tabelas de IR para FOLHA e MODFOL |
| 4 | CADASTROPREV | Depende de PARAMPREV (serviço compartilhado) — fundação previdenciária |
| 5 | CONTAB | Contabilidade base — referenciada por múltiplos módulos |
| 6 | CFINAN | Depende de CONTAB |
| 7 | ORCAMENTO | Depende de CONTAB |
| 8 | CPAGAR | Depende de CONTAB, CFINAN, ORCAMENTO |
| 9 | CRECEBER | Depende de CONTAB, CFINAN, ORCAMENTO |
| 10 | INDICADORES | Depende de CONTAB, CFINAN |
| 11 | CONTRATO | Depende de CPAGAR, CRECEBER |
| 12 | EMPRESTIMO | Depende de CRECEBER, CONTAB, CADASTROPREV |
| 13 | FINANCIAMENTO | Depende de EMPRESTIMO, CRECEBER, CONTAB |
| 14 | AGENDAMENTO | Depende de CADASTROPREV |
| 15 | CENTRALAP | Depende de CADASTROPREV, AGENDAMENTO |
| 16 | AUTOATENDIMENTO | Depende de EMPRESTIMO, CADASTROPREV |
| 17 | COMPRAS2000 | Depende de ALMOXARIFADO, CPAGAR |
| 18 | ALMOXARIFADO | Depende de COMPRAS2000, CONTAB, CPAGAR |
| 19 | INVESTIMENTOS | Depende de COTAS, CFINAN, CONTAB, CAF |
| 20 | COTAS | Depende de INVESTIMENTOS, CFINAN |
| 21 | CAF | Depende de COTAS, CFINAN, CONTAB |
| 22 | RECMERC | Depende de INVESTIMENTOS, CFINAN |
| 23 | INVESTIMOB | Depende de ADMINIMOB, CONTAB, CFINAN |
| 24 | ADMINIMOB | Depende de INVESTIMOB, CONTAB, CFINAN, CPAGAR |
| 25 | ALIENACAO | Depende de INVESTIMOB, ADMINIMOB, CONTAB |
| 26 | SISTJUR | Depende de PROCJUD, CONTRATO, MODCON |
| 27 | PROCJUD | Depende de SISTJUR, CONTRATO |
| 28 | PROJETOATUARIAL | Depende de CADASTROPREV, PARAMPREV |
| 29 | PROCPREV | Depende de CADASTROPREV, BENEFICIOPREV, PARAMPREV |
| 30 | ASSISTENCIAL | Depende de CADASTROPREV, BENEFICIOPREV, PARAMPREV |
| 31 | EXPORTFCRT | Depende de BENEFICIOPREV, CONTRIBUICAOPREV, FOLHA (já analisados) |
| 32 | SIMULADORFCRT | Depende de BENEFICIOPREV, PROJETOATUARIAL |
| 33 | MODFOL | Depende de MODBAS, MODBEN, IRRF, CONTAB |
| 34 | MODBEN | Depende de MODBAS, MODFOL |
| 35 | MODCES | Depende de MODBAS, MODFOL |
| 36 | MODAVA | Depende de MODBAS, MODCES |
| 37 | MODRES | Depende de MODBAS, MODCES |
| 38 | MODTRN | Depende de MODBAS, MODCES |
| 39 | MODASM | Depende de MODBAS, MODACESSO |
| 40 | MODAUTO | Depende de MODBAS, CONTRATO |
| 41 | MODCON | Depende de MODBAS, SISTJUR, PROCJUD |

> **Nota:** a ordem acima é uma sugestão. Módulos com dependências circulares (ex.: INVESTIMENTOS ↔ COTAS, ADMINIMOB ↔ INVESTIMOB, SISTJUR ↔ PROCJUD, MODFOL ↔ MODBEN) podem ser executados em qualquer ordem dentro do par, desde que a análise de dupla contagem seja feita considerando ambos.

---

## 10. Estado das análises existentes

### 10.1 Análises SFP completas (3 módulos)

| Módulo | Arquivo SFP | PE | AL | SFP | Issue | Data |
|---|---|---|---|---|---|---|
| Folha de Benefícios | `docs1/pontos-de-funcao/folha.html` | 25 | 23 | 276,0 | PFC-48 | 2026-11-12 |
| Contribuição Previdenciária | `docs1/pontos-de-funcao/contribuicao.html` | 19 | 22 | 241,4 | PFC-48 | 2026-11-12 |
| Benefício Previdenciário | `docs1/pontos-de-funcao/beneficioprev.html` | 20 | 20 | 232,0 | PFC-48 | 2026-11-12 |

### 10.2 Documentação funcional existente (Blueprint AS-IS)

| Módulo | Pasta docs1 | Conteúdo | Issue |
|---|---|---|---|
| Folha de Benefícios | `docs1/folha/` | 24 páginas (index, arquitetura, dados, funcionalidades, integrações, UC101–UC112, etc.) | PFC-21 + PFC-22 |
| Contribuição Previdenciária | `docs1/contribuicao/` | 21 páginas (index, arquitetura, dados, funcionalidades, integrações, UC201–UC209, etc.) | PFC-23 |
| Benefício Previdenciário | `docs1/beneficioprev/` | 22 páginas (index, arquitetura, dados, funcionalidades, integrações, UC301–UC310, etc.) | PFC-24 |

### 10.3 Análises Blueprint existentes (raiz do repositório)

| Arquivo | Conteúdo | Issue |
|---|---|---|
| `Analise_Blueprint_Folha.md` | Adaptação FOLHA ao modelo UC097 (jornadas funcionais) | PFC-25 |
| `Analise_Blueprint_Contribuicao_Folha.md` | Adaptação CONTRIBUIÇÃO ao padrão de jornadas | PFC-27 |
| `Analise_Blueprint_BeneficioPrev_Folha.md` | Adaptação BENEFICIOPREV ao padrão de jornadas | PFC-28 |
| `Analise_Blueprint_Beneficioprev_Folha.md` | Análise adicional BENEFICIOPREV × FOLHA | — |
| `Analise_linhas_dependencias.md` | Análise de linhas de código e dependências | PFC-45 |
| `analise_User_Cases.md` | Análise de casos de uso | — |

### 10.4 Metodologia e navegação existentes

| Arquivo | Conteúdo |
|---|---|
| `docs1/pontos-de-funcao/index.html` | Página de entrada da área "Análise de pontos de função" |
| `docs1/pontos-de-funcao/metodologia.html` | Metodologia da contagem SFP (pesos, fórmula, critérios, fronteiras, dupla contagem) |
| `docs1/index.html` | Navegação principal do portal com link para "Análise de pontos de função" |

### 10.5 Estado dos 41 módulos novos

Todos os 41 módulos recomendados para contagem individual estão **sem análise SFP**. Nenhum possui documentação funcional em `docs1/` (apenas os 3 módulos previdenciários já analisados têm). A contagem SFP de cada módulo novo deverá ser precedida da documentação funcional (casos de uso, modelo de dados, integrações) ou executada diretamente a partir do código-fonte, conforme o prompt individual.

---
## 11. Prompts individuais

Cada prompt abaixo é **autônomo** — pode ser executado independentemente, analisa somente um módulo por execução, informa caminhos reais de arquivos, aponta dependências específicas, usa a análise SFP de Folha de Benefícios como referência de estrutura, solicita criação/atualização da aba individual na navegação "Análise de pontos de função", aborda dupla contagem, aplica exclusivamente SFP, identifica pendências e pede relatório final de arquivos alterados.

> **Modelo base:** cada prompt segue a mesma estrutura, personalizada com os caminhos reais, dependências e características de cada módulo. Os prompts não são genéricos repetidos — cada um contém o nome, pasta, entry point, dependências e riscos de dupla contagem específicos do módulo.

---

### Prompt 1 — Cadastro Previdenciário (CADASTROPREV)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Cadastro Previdenciário do sistema legado Delphi 5.

MÓDULO: Cadastro Previdenciário
CÓDIGO: CADASTROPREV
PASTA: CADASTROPREV/
ENTRY POINT: CADASTROPREV/Fontes/CadastroPrev.dpr
PROPÓSITO: Manutenção cadastral de participantes, dependentes e recadastramento do subsistema previdenciário.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- PARAMPREV (parâmetros previdenciários — serviço compartilhado)
- Módulos que consomem CADASTROPREV: FOLHA, CONTRIBUICAOPREV, BENEFICIOPREV, PROCPREV, ASSISTENCIAL, EMPRESTIMO, AUTOATENDIMENTO, CENTRALAP, AGENDAMENTO, PROJETOATUARIAL

FRONTEIRA: Pasta CADASTROPREV — mantém dados dentro desta fronteira; dados cadastrais são referenciados (leitura) por múltiplos módulos previdenciários.

RISCOS DE DUPLA CONTAGEM:
- PESSOA, PARTICIPANTE, PATRO: verificar se CADASTROPREV é o dono funcional destes dados. Se sim, contar como AL aqui e referenciar nos demais. Se outro módulo também mantém (INSERT/UPDATE/DELETE), sinalizar ambiguidade.
- Validar com especialista de negócio o dono funcional dos dados cadastrais.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CADASTROPREV/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/cadastroprev.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Cadastro Previdenciário" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/cadastroprev.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 2 — Processos Previdenciários (PROCPREV)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Processos Previdenciários do sistema legado Delphi 5.

MÓDULO: Processos Previdenciários
CÓDIGO: PROCPREV
PASTA: PROCPREV/
ENTRY POINT: PROCPREV/Fontes/ProcPrev.dpr
PROPÓSITO: Processamento de requerimentos/processos previdenciários — concessões, cálculos e fluxos procedurais de benefícios.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CADASTROPREV (dados cadastrais de participantes)
- BENEFICIOPREV (dados de benefícios)
- PARAMPREV (parâmetros previdenciários — serviço compartilhado)
- OBJRAD (objetos de workflow RAD — dependência compartilhada)

FRONTEIRA: Pasta PROCPREV — mantém dados de processos/requerimentos dentro desta fronteira; lê dados de CADASTROPREV e BENEFICIOPREV.

RISCOS DE DUPLA CONTAGEM:
- Dados de processo/benefício: verificar sobreposição com BENEFICIOPREV. Se PROCPREV mantém dados de processo que BENEFICIOPREV também mantém, sinalizar ambiguidade de dono.
- Validar com especialista de negócio a fronteira entre PROCPREV e BENEFICIOPREV.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em PROCPREV/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/procprev.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Processos Previdenciários" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/procprev.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 3 — Assistencial (ASSISTENCIAL)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Assistencial do sistema legado Delphi 5.

MÓDULO: Assistencial
CÓDIGO: ASSISTENCIAL
PASTA: ASSISTENCIAL/
ENTRY POINT: ASSISTENCIAL/Fontes/assistencial.dpr
PROPÓSITO: Administração de benefícios de assistência social/welfare concedidos a participantes e beneficiários.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CADASTROPREV (dados cadastrais de participantes)
- BENEFICIOPREV (dados de benefícios)
- PARAMPREV (parâmetros previdenciários — serviço compartilhado)

FRONTEIRA: Pasta ASSISTENCIAL — mantém dados de benefícios assistenciais dentro desta fronteira; lê dados de CADASTROPREV e BENEFICIOPREV.

RISCOS DE DUPLA CONTAGEM:
- Dados de benefício assistencial: verificar sobreposição com BENEFICIOPREV. Benefícios assistenciais podem compartilhar tabelas com benefícios previdenciários.
- Validar com especialista de negócio a fronteira entre ASSISTENCIAL e BENEFICIOPREV.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em ASSISTENCIAL/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/assistencial.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Assistencial" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/assistencial.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 4 — Contabilidade (CONTAB)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Contabilidade do sistema legado Delphi 5.

MÓDULO: Contabilidade
CÓDIGO: CONTAB
PASTA: CONTAB/
ENTRY POINT: CONTAB/Fontes/Contab.dpr
PROPÓSITO: Contabilidade geral — escrituração, livros contábeis, planos de contas, lançamentos contábeis e razão.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CFINAN (contabilidade financeira — sub-razão)
- CPAGAR (contas a pagar — gera lançamentos)
- CRECEBER (contas a receber — gera lançamentos)
- ORCAMENTO (orçamento — gera lançamentos)
- INTEGRASAF (integração SAF — serviço compartilhado)
- CMCONTABOBJ50 (objetos de negócio compartilhados — dependência)

FRONTEIRA: Pasta CONTAB — mantém dados contábeis (plano de contas, lançamentos, razão) dentro desta fronteira; integra dados de sub-razões (CFINAN, CPAGAR, CRECEBER, ORCAMENTO).

RISCOS DE DUPLA CONTAGEM:
- Lançamentos contábeis: verificar se CONTAB é o dono dos lançamentos ou se CFINAN também mantém lançamentos próprios. Definir fronteira entre contabilidade geral e contabilidade financeira.
- Plano de contas: verificar se é mantido apenas por CONTAB ou compartilhado com CFINAN.
- Validar com especialista de negócio a fronteira entre CONTAB e CFINAN.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CONTAB/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/contab.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Contabilidade" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/contab.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 5 — Contabilidade Financeira (CFINAN)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Contabilidade Financeira do sistema legado Delphi 5.

MÓDULO: Contabilidade Financeira
CÓDIGO: CFINAN
PASTA: CFINAN/
ENTRY POINT: CFINAN/Fontes/CFINAN.dpr
PROPÓSITO: Controle financeiro — movimentações financeiras, conciliação bancária, tesouraria e gestão de fluxo de caixa.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CONTAB (contabilidade geral — integra lançamentos)
- CMCFINANOBJ50 (objetos de negócio compartilhados — dependência)
- CMINTBANCOMT50 (integração bancária/CNAB — dependência)
- APPSERVERCFINAN (servidor COM — infraestrutura)

FRONTEIRA: Pasta CFINAN — mantém dados de movimentações financeiras e conciliação dentro desta fronteira; integra com CONTAB para lançamentos contábeis.

RISCOS DE DUPLA CONTAGEM:
- Lançamentos contábeis: verificar se CFINAN mantém lançamentos próprios ou se apenas repassa para CONTAB. Definir fronteira.
- Movimentações financeiras: verificar se CPAGAR/CRECEBER também mantém movimentações ou se apenas CFINAN.
- Validar com especialista de negócio a fronteira entre CFINAN e CONTAB.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CFINAN/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/cfinan.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Contabilidade Financeira" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/cfinan.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 6 — Contas a Pagar (CPAGAR)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Contas a Pagar do sistema legado Delphi 5.

MÓDULO: Contas a Pagar
CÓDIGO: CPAGAR
PASTA: CPAGAR/
ENTRY POINT: CPAGAR/FontesMT/ContasaPagar.dpr
PROPÓSITO: Contas a pagar — faturas de fornecedores, pagamentos, agrupamento de documentos e baixas.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CONTAB (contabilidade — recebe lançamentos)
- CFINAN (contabilidade financeira — conciliação)
- ORCAMENTO (orçamento — verifica dotação)
- CMCAPCAROBJ50 (objetos de negócio compartilhados — dependência)
- CMINTBANCOMT50 (integração bancária/CNAB — dependência)
- APPSRVCAPCAR (servidor COM — infraestrutura)

FRONTEIRA: Pasta CPAGAR — mantém dados de documentos a pagar (faturas, pagamentos, baixas) dentro desta fronteira; gera lançamentos para CONTAB.

RISCOS DE DUPLA CONTAGEM:
- Documentos a pagar: verificar se ALMOXARIFADO ou COMPRAS2000 também mantêm documentos ou se apenas CPAGAR.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CPAGAR/ (FontesMT/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/cpagar.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Contas a Pagar" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/cpagar.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 7 — Contas a Receber (CRECEBER)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Contas a Receber do sistema legado Delphi 5.

MÓDULO: Contas a Receber
CÓDIGO: CRECEBER
PASTA: CRECEBER/
ENTRY POINT: CRECEBER/FontesMT/ContasaReceber.dpr
PROPÓSITO: Contas a receber — faturamento, cobrança, recebimentos e gestão de recebíveis.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CONTAB (contabilidade — recebe lançamentos)
- CFINAN (contabilidade financeira — conciliação)
- ORCAMENTO (orçamento — verifica dotação)
- CMCAPCAROBJ50 (objetos de negócio compartilhados — dependência)
- CMINTBANCOMT50 (integração bancária/CNAB — dependência)
- APPSRVCAPCAR (servidor COM — infraestrutura)

FRONTEIRA: Pasta CRECEBER — mantém dados de documentos a receber (faturas, recebimentos, cobranças) dentro desta fronteira; gera lançamentos para CONTAB.

RISCOS DE DUPLA CONTAGEM:
- Documentos a receber: verificar se EMPRESTIMO ou FINANCIAMENTO também mantêm títulos a receber ou se apenas CRECEBER.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CRECEBER/ (FontesMT/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/creceber.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Contas a Receber" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/creceber.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 8 — Orçamento (ORCAMENTO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Orçamento do sistema legado Delphi 5.

MÓDULO: Orçamento
CÓDIGO: ORCAMENTO
PASTA: ORCAMENTO/
ENTRY POINT: ORCAMENTO/FontesMT/Orcamento.dpr
PROPÓSITO: Orçamento — planejamento orçamentário, execução e monitoramento de dotações.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CONTAB (contabilidade — dados de execução)
- CMPLANEORCOBJ50 (objetos de negócio compartilhados — dependência)
- APPSERVERORCAMENTO (servidor COM — infraestrutura)

FRONTEIRA: Pasta ORCAMENTO — mantém dados de orçamento (dotações, saldos, cenários, contas orçamentárias) dentro desta fronteira; lê dados de execução de CONTAB.

RISCOS DE DUPLA CONTAGEM:
- Saldos orçamentários: verificar se CONTAB também mantém saldos ou se apenas ORCAMENTO.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em ORCAMENTO/ (FontesMT/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/orcamento.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Orçamento" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/orcamento.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 9 — IRRF (Imposto de Renda) (IRRF)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo IRRF (Imposto de Renda) do sistema legado Delphi 5.

MÓDULO: IRRF (Imposto de Renda)
CÓDIGO: IRRF
PASTA: IRRF/
ENTRY POINT: IRRF/Fontes/Impostos.dpr
PROPÓSITO: Cálculo, retenção e postagem de Imposto de Renda Retido na Fonte (IRRF) — tabelas de IR progressiva/regressiva, informe de rendimentos.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CMIRRFOBJ50 (objetos de negócio compartilhados — dependência)
- APPSERVERIRRFDLL (servidor COM — infraestrutura)
- Módulos que consomem IRRF: FOLHA (PE-05), CONTRIBUICAOPREV, MODFOL

FRONTEIRA: Pasta IRRF — mantém tabelas de IR e dados de retenção dentro desta fronteira; fornece tabelas para FOLHA, CONTRIBUICAOPREV e MODFOL (referenciado por estes).

RISCOS DE DUPLA CONTAGEM:
- Tabelas de IR: verificar se IRRF é o único dono das tabelas. FOLHA referencia as tabelas como AL-23 (referenciado) — confirmar que IRRF é o dono.
- Retenções: verificar se FOLHA ou MODFOL também mantêm retenções próprias ou se apenas IRRF.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em IRRF/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/irrf.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "IRRF" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/irrf.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 10 — Indicadores (INDICADORES)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Indicadores do sistema legado Delphi 5.

MÓDULO: Indicadores
CÓDIGO: INDICADORES
PASTA: INDICADORES/
ENTRY POINT: INDICADORES/Fontes/Indicadores.dpr
PROPÓSITO: Indicadores de desempenho (KPIs) — apuração, eventos de marketing, layouts de impressão e dashboards de gestão.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CONTAB (contabilidade — dados de entrada)
- CFINAN (contabilidade financeira — dados de entrada)
- CMINDICADORESOBJ50 (objetos de negócio compartilhados — dependência)

FRONTEIRA: Pasta INDICADORES — mantém dados de indicadores, layouts e apurações dentro desta fronteira; consome dados de CONTAB e CFINAN (leitura).

RISCOS DE DUPLA CONTAGEM:
- Dados de indicadores: verificar se INDICADORES apenas consome dados (leitura) ou se também mantém dados próprios. Se apenas consome, os AL podem ser mínimos.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em INDICADORES/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/indicadores.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Indicadores" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/indicadores.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 11 — Controle de Aplicações Financeiras (CAF)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Controle de Aplicações Financeiras do sistema legado Delphi 5.

MÓDULO: Controle de Aplicações Financeiras
CÓDIGO: CAF
PASTA: CAF/
ENTRY POINT: CAF/Fontes/Caf.dpr
PROPÓSITO: Controle de aplicações financeiras — registro e acompanhamento de aplicações financeiras do fundo.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- COTAS (cotas de fundos — dados de cotação)
- CFINAN (contabilidade financeira — conciliação)
- CONTAB (contabilidade — lançamentos)
- CMCAFOBJ50 (objetos de negócio compartilhados — dependência)

FRONTEIRA: Pasta CAF — mantém dados de aplicações financeiras dentro desta fronteira; lê cotas de COTAS e integra com CFINAN/CONTAB.

RISCOS DE DUPLA CONTAGEM:
- Aplicações financeiras: verificar sobreposição com COTAS ou INVESTIMENTOS. CAF pode compartilhar dados de aplicação com INVESTIMENTOS.
- Validar com especialista de negócio a fronteira entre CAF, COTAS e INVESTIMENTOS.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CAF/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/caf.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "CAF" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/caf.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 12 — Cotas (COTAS)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Cotas do sistema legado Delphi 5.

MÓDULO: Cotas
CÓDIGO: COTAS
PASTA: COTAS/
ENTRY POINT: COTAS/Fontes/Cotas.dpr
PROPÓSITO: Gestão de cotas de fundos e aplicações — cotação, manutenção e histórico de cotas.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- INVESTIMENTOS (investimentos — dados de fundos)
- CFINAN (contabilidade financeira — conciliação)

FRONTEIRA: Pasta COTAS — mantém dados de cotas (cotações, histórico) dentro desta fronteira; lê dados de fundos de INVESTIMENTOS.

RISCOS DE DUPLA CONTAGEM:
- Cotas de fundos: verificar sobreposição com INVESTIMENTOS. COTAS pode ser sub-módulo de INVESTIMENTOS ou fronteira própria.
- Verificar se COTASPATRIM (cotas patrimoniais) compartilha dados com COTAS.
- Validar com especialista de negócio a fronteira entre COTAS, INVESTIMENTOS e COTASPATRIM.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em COTAS/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/cotas.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Cotas" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/cotas.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 13 — Administração Imobiliária (ADMINIMOB)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Administração Imobiliária do sistema legado Delphi 5.

MÓDULO: Administração Imobiliária
CÓDIGO: ADMINIMOB
PASTA: ADMINIMOB/
ENTRY POINT: ADMINIMOB/Fontes/AdminImob.dpr
PROPÓSITO: Administração imobiliária — gestão de imóveis, locações, contratos de aluguel e recebimento de rendas.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- INVESTIMOB (investimento imobiliário — dados de imóveis)
- CONTAB (contabilidade — lançamentos)
- CFINAN (contabilidade financeira — conciliação)
- CPAGAR (contas a pagar — despesas)
- CMIMOBILIARIOOBJ50 (objetos de negócio compartilhados — dependência)
- EPIM, EPIMIMOB (bibliotecas de formulários compartilhados — dependência)

FRONTEIRA: Pasta ADMINIMOB — mantém dados de administração imobiliária (contratos de aluguel, locatários, rendas) dentro desta fronteira; lê dados de imóveis de INVESTIMOB.

RISCOS DE DUPLA CONTAGEM:
- Contratos imobiliários: verificar sobreposição com INVESTIMOB. ADMINIMOB gerencia contratos de aluguel; INVESTIMOB gerencia imóveis investidos. Verificar se há dados compartilhados.
- Imóveis: verificar se ADMINIMOB mantém dados de imóvel ou se apenas INVESTIMOB.
- Validar com especialista de negócio a fronteira entre ADMINIMOB e INVESTIMOB.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em ADMINIMOB/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/adminimob.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Administração Imobiliária" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/adminimob.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 14 — Investimento Imobiliário (INVESTIMOB)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Investimento Imobiliário do sistema legado Delphi 5.

MÓDULO: Investimento Imobiliário
CÓDIGO: INVESTIMOB
PASTA: INVESTIMOB/
ENTRY POINT: INVESTIMOB/Fontes/InvestImob.dpr
PROPÓSITO: Investimento imobiliário — gestão dos imóveis investidos pelo fundo, incluindo aquisição, valorização e baixa.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- ADMINIMOB (administração imobiliária — dados de locação)
- CONTAB (contabilidade — lançamentos)
- CFINAN (contabilidade financeira — conciliação)
- CMIMOBILIARIOOBJ50 (objetos de negócio compartilhados — dependência)
- EPIM, EPIMIMOB (bibliotecas de formulários compartilhados — dependência)

FRONTEIRA: Pasta INVESTIMOB — mantém dados de imóveis investidos dentro desta fronteira; integra com ADMINIMOB para locação e CONTAB para lançamentos.

RISCOS DE DUPLA CONTAGEM:
- Imóveis: verificar sobreposição com ADMINIMOB. INVESTIMOB gerencia imóveis investidos; ADMINIMOB gerencia contratos de aluguel. Verificar se a tabela de imóveis é mantida por ambos.
- Validar com especialista de negócio a fronteira entre INVESTIMOB e ADMINIMOB.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em INVESTIMOB/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/investimob.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Investimento Imobiliário" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/investimob.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 15 — Alienação de Bens (ALIENACAO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Alienação de Bens do sistema legado Delphi 5.

MÓDULO: Alienação de Bens
CÓDIGO: ALIENACAO
PASTA: ALIENACAO/
ENTRY POINT: ALIENACAO/Fontes/Alienacao.dpr
PROPÓSITO: Alienação de bens imóveis — transferência, venda e baixa de imóveis do patrimônio do fundo.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- INVESTIMOB (investimento imobiliário — dados de imóveis)
- ADMINIMOB (administração imobiliária — dados de contratos)
- CONTAB (contabilidade — lançamentos de baixa)
- CMIMOBILIARIOOBJ50 (objetos de negócio compartilhados — dependência)

FRONTEIRA: Pasta ALIENACAO — mantém dados de alienação (transferências, vendas, baixas) dentro desta fronteira; lê dados de imóveis de INVESTIMOB.

RISCOS DE DUPLA CONTAGEM:
- Bens alienados: verificar sobreposição com INVESTIMOB. ALIENACAO pode compartilhar a tabela de imóveis com INVESTIMOB.
- Validar com especialista de negócio a fronteira entre ALIENACAO e INVESTIMOB.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em ALIENACAO/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/alienacao.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Alienação de Bens" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/alienacao.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 16 — Investimentos (INVESTIMENTOS)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Investimentos do sistema legado Delphi 5.

MÓDULO: Investimentos
CÓDIGO: INVESTIMENTOS
PASTA: INVESTIMENTOS/
ENTRY POINT: INVESTIMENTOS/FontesProducao/Investimentos.dpr
PROPÓSITO: Gestão da carteira de investimentos do fundo — renda fixa, renda variável, fundos e aplicações.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- COTAS (cotas de fundos — cotação)
- CFINAN (contabilidade financeira — conciliação)
- CONTAB (contabilidade — lançamentos)
- CAF (controle de aplicações financeiras)
- CMGLOBALOBJ50 (objetos globais compartilhados — dependência)

FRONTEIRA: Pasta INVESTIMENTOS — mantém dados da carteira de investimentos dentro desta fronteira; integra com COTAS, CFINAN e CONTAB.

RISCOS DE DUPLA CONTAGEM:
- Carteira de investimentos: verificar sobreposição com COTAS, CAF e INVESTCOTAS/INVESTFDO (módulos a validar). INVESTIMENTOS pode ser o guarda-chuva destes.
- Validar com especialista de negócio a fronteira entre INVESTIMENTOS e seus sub-módulos.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em INVESTIMENTOS/ (FontesProducao/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/investimentos.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Investimentos" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/investimentos.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 17 — Receitas de Mercado (RECMERC)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Receitas de Mercado do sistema legado Delphi 5.

MÓDULO: Receitas de Mercado
CÓDIGO: RECMERC
PASTA: RECMERC/
ENTRY POINT: RECMERC/Fontes/RecMerc.dpr
PROPÓSITO: Receitas de mercado — controle de receitas e recursos financeiros de mercado.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- INVESTIMENTOS (investimentos — dados de carteira)
- CFINAN (contabilidade financeira — conciliação)

FRONTEIRA: Pasta RECMERC — mantém dados de receitas de mercado dentro desta fronteira; lê dados de INVESTIMENTOS e CFINAN.

RISCOS DE DUPLA CONTAGEM:
- Receitas: verificar sobreposição com CFINAN. RECMERC pode compartilhar dados de receita com a contabilidade financeira.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em RECMERC/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/recmerc.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Receitas de Mercado" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/recmerc.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 18 — Sistema Jurídico (SISTJUR)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Sistema Jurídico do sistema legado Delphi 5.

MÓDULO: Sistema Jurídico
CÓDIGO: SISTJUR
PASTA: SISTJUR/
ENTRY POINT: SISTJUR/Fontes/SistJur.dpr
PROPÓSITO: Sistema jurídico — gestão de processos legais, ações judiciais e acompanhamento de casos.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- PROCJUD (processos judiciais — dados de processos)
- CONTRATO (contratos — dados de contratos)
- MODCON (contencioso RH — processos trabalhistas)
- CMGLOBALOBJ50 (objetos globais compartilhados — dependência)

FRONTEIRA: Pasta SISTJUR — mantém dados de processos jurídicos dentro desta fronteira; integra com PROCJUD e CONTRATO.

RISCOS DE DUPLA CONTAGEM:
- Processos jurídicos: verificar sobreposição com PROCJUD. SISTJUR e PROCJUD podem compartilhar a tabela de processos.
- Verificar se SISTJURCONS (jurídico consultivo) compartilha dados — contar junto com SISTJUR.
- Validar com especialista de negócio a fronteira entre SISTJUR e PROCJUD.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em SISTJUR/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/sistjur.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Sistema Jurídico" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/sistjur.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 19 — Processos Judiciais (PROCJUD)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Processos Judiciais do sistema legado Delphi 5.

MÓDULO: Processos Judiciais
CÓDIGO: PROCJUD
PASTA: PROCJUD/
ENTRY POINT: PROCJUD/Fontes/ProcJud.dpr
PROPÓSITO: Processos judiciais — gestão de processos judiciais, varas, advogados e acompanhamento de ações.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- SISTJUR (sistema jurídico — dados de processos)
- CONTRATO (contratos — dados de contratos)
- CMGLOBALOBJ50 (objetos globais compartilhados — dependência)

FRONTEIRA: Pasta PROCJUD — mantém dados de processos judiciais (varas, advogados, custas) dentro desta fronteira; integra com SISTJUR.

RISCOS DE DUPLA CONTAGEM:
- Processos judiciais: verificar sobreposição com SISTJUR. PROCJUD e SISTJUR podem compartilhar a tabela de processos.
- Validar com especialista de negócio a fronteira entre PROCJUD e SISTJUR.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em PROCJUD/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/procjud.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Processos Judiciais" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/procjud.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 20 — Contratos (CONTRATO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Contratos do sistema legado Delphi 5.

MÓDULO: Contratos
CÓDIGO: CONTRATO
PASTA: CONTRATO/
ENTRY POINT: CONTRATO/Fontes/contrato.dpr
PROPÓSITO: Gestão de contratos — registro e manutenção de contratos, áreas gestoras e partes relacionadas.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CPAGAR (contas a pagar — despesas contratuais)
- CRECEBER (contas a receber — receitas contratuais)
- CMGLOBALOBJ50 (objetos globais compartilhados — dependência)

FRONTEIRA: Pasta CONTRATO — mantém dados de contratos (partes, cláusulas, vigências) dentro desta fronteira; gera obrigações para CPAGAR e CRECEBER.

RISCOS DE DUPLA CONTAGEM:
- Contratos: verificar sobreposição com MODAUTO (gestão de frota usa contratos) e ADMINIMOB (contratos imobiliários). Verificar se CONTRATO é o dono genérico ou se cada domínio tem seus próprios contratos.
- Validar com especialista de negócio a fronteira.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CONTRATO/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/contrato.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Contratos" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/contrato.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 21 — Empréstimo (EMPRESTIMO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Empréstimo do sistema legado Delphi 5.

MÓDULO: Empréstimo
CÓDIGO: EMPRESTIMO
PASTA: EMPRESTIMO/
ENTRY POINT: EMPRESTIMO/Fontes/emprestimo.dpr
PROPÓSITO: Empréstimo a participantes/associados — concessão, manutenção, cálculo e acompanhamento de empréstimos.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CRECEBER (contas a receber — títulos de empréstimo)
- CONTAB (contabilidade — lançamentos)
- CADASTROPREV (dados cadastrais de participantes)
- EMPRESTIMOBPL (BPL compartilhado — dependência)

FRONTEIRA: Pasta EMPRESTIMO — mantém dados de empréstimos (contratos, parcelas, saldos) dentro desta fronteira; gera títulos para CRECEBER.

RISCOS DE DUPLA CONTAGEM:
- Empréstimos: verificar sobreposição com FINANCIAMENTO e AUTOATENDIMENTO. EMPRESTIMO pode ser o dono dos dados de empréstimo, com FINANCIAMENTO como sub-módulo e AUTOATENDIMENTO como canal web.
- Validar com especialista de negócio a fronteira entre EMPRESTIMO, FINANCIAMENTO e AUTOATENDIMENTO.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em EMPRESTIMO/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/emprestimo.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Empréstimo" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/emprestimo.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 22 — Financiamento (FINANCIAMENTO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Financiamento do sistema legado Delphi 5.

MÓDULO: Financiamento
CÓDIGO: FINANCIAMENTO
PASTA: FINANCIAMENTO/
ENTRY POINT: FINANCIAMENTO/Fontes/Financiamento.dpr
PROPÓSITO: Financiamento — gestão de contratos de financiamento, amortização e acompanhamento.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- EMPRESTIMO (empréstimo — dados de contrato)
- CRECEBER (contas a receber — títulos)
- CONTAB (contabilidade — lançamentos)
- EMPRESTIMOBPL (BPL compartilhado — dependência)

FRONTEIRA: Pasta FINANCIAMENTO — mantém dados de financiamentos dentro desta fronteira; integra com EMPRESTIMO e CRECEBER.

RISCOS DE DUPLA CONTAGEM:
- Financiamentos: verificar sobreposição com EMPRESTIMO. FINANCIAMENTO pode ser sub-módulo de EMPRESTIMO ou fronteira própria.
- Validar com especialista de negócio a fronteira entre FINANCIAMENTO e EMPRESTIMO.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em FINANCIAMENTO/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/financiamento.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Financiamento" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/financiamento.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 23 — Almoxarifado (ALMOXARIFADO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Almoxarifado do sistema legado Delphi 5.

MÓDULO: Almoxarifado
CÓDIGO: ALMOXARIFADO
PASTA: ALMOXARIFADO/
ENTRY POINT: ALMOXARIFADO/Fontes/Almoxarifado.dpr
PROPÓSITO: Almoxarifado — controle de estoque, movimentações de materiais e inventário.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- COMPRAS2000 (compras — pedidos de compra)
- CONTAB (contabilidade — lançamentos)
- CPAGAR (contas a pagar — faturas)
- CMALMOXCOMPRAOBJ50 (objetos compartilhados — dependência)
- ALMOX&COMPRAS (biblioteca compartilhada — dependência)

FRONTEIRA: Pasta ALMOXARIFADO — mantém dados de estoque (itens, saldos, movimentações) dentro desta fronteira; recebe pedidos de COMPRAS2000.

RISCOS DE DUPLA CONTAGEM:
- Itens de estoque: verificar sobreposição com COMPRAS2000. ALMOXARIFADO mantém o estoque; COMPRAS2000 gera pedidos. Verificar se há dados compartilhados.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em ALMOXARIFADO/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/almoxarifado.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Almoxarifado" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/almoxarifado.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 24 — Compras (COMPRAS2000)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Compras do sistema legado Delphi 5.

MÓDULO: Compras
CÓDIGO: COMPRAS2000
PASTA: COMPRAS2000/
ENTRY POINT: COMPRAS2000/Fontes/Compras.dpr
PROPÓSITO: Compras — solicitações de compra, ordens de compra, cotações de fornecedores.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- ALMOXARIFADO (almoxarifado — destino dos materiais)
- CPAGAR (contas a pagar — faturas de compra)
- CMALMOXCOMPRAOBJ50 (objetos compartilhados — dependência)
- ALMOX&COMPRAS (biblioteca compartilhada — dependência)

FRONTEIRA: Pasta COMPRAS2000 — mantém dados de compras (pedidos, cotações, ordens) dentro desta fronteira; envia materiais para ALMOXARIFADO.

RISCOS DE DUPLA CONTAGEM:
- Pedidos de compra: verificar sobreposição com ALMOXARIFADO. COMPRAS2000 gera pedidos; ALMOXARIFADO mantém estoque. Verificar se há dados compartilhados.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em COMPRAS2000/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/compras.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Compras" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/compras.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 25 — Central de Atendimento (CENTRALAP)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Central de Atendimento do sistema legado Delphi 5.

MÓDULO: Central de Atendimento
CÓDIGO: CENTRALAP
PASTA: CENTRALAP/
ENTRY POINT: CENTRALAP/Fontes/CentralAP.dpr
PROPÓSITO: Central de atendimento — atendimento a participantes, catálogo de serviços e gestão de ocorrências.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CADASTROPREV (dados cadastrais de participantes)
- AGENDAMENTO (agendamento de atendimentos)
- CMAGENDAMENTOOBJ50 (objetos compartilhados — dependência)

FRONTEIRA: Pasta CENTRALAP — mantém dados de atendimentos (ocorrências, protocolos, serviços) dentro desta fronteira; lê dados de CADASTROPREV.

RISCOS DE DUPLA CONTAGEM:
- Atendimentos: verificar sobreposição com AGENDAMENTO. CENTRALAP pode compartilhar dados de agendamento.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em CENTRALAP/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/centralap.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Central de Atendimento" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/centralap.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 26 — Agendamento (AGENDAMENTO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Agendamento do sistema legado Delphi 5.

MÓDULO: Agendamento
CÓDIGO: AGENDAMENTO
PASTA: AGENDAMENTO/
ENTRY POINT: AGENDAMENTO/Fontes/Agendamento.dpr
PROPÓSITO: Agendamento — agendamento de atendimentos, serviços e compromissos.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CADASTROPREV (dados cadastrais de participantes)
- CMAGENDAMENTOOBJ50 (objetos compartilhados — dependência)

FRONTEIRA: Pasta AGENDAMENTO — mantém dados de agendamentos (horários, calendários, atendentes) dentro desta fronteira.

RISCOS DE DUPLA CONTAGEM:
- Agendamentos: verificar sobreposição com CENTRALAP. AGENDAMENTO pode ser referenciado por CENTRALAP.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em AGENDAMENTO/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/agendamento.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Agendamento" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/agendamento.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 27 — Autoatendimento (AUTOATENDIMENTO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Autoatendimento do sistema legado Delphi 5.

MÓDULO: Autoatendimento
CÓDIGO: AUTOATENDIMENTO
PASTA: AUTOATENDIMENTO/
ENTRY POINT: AUTOATENDIMENTO/Aplicacao/Fontes/AutoAtendimento.dpr
PROPÓSITO: Autoatendimento web — portal de self-service para participantes (empréstimos, consultas, solicitações).
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- EMPRESTIMO (empréstimo — simulação e contratação)
- CADASTROPREV (dados cadastrais de participantes)
- EMPRESTIMOBPL (BPL compartilhado — dependência)

FRONTEIRA: Pasta AUTOATENDIMENTO — mantém dados de autoatendimento (sessões, solicitações web) dentro desta fronteira; consome serviços de EMPRESTIMO e CADASTROPREV.

RISCOS DE DUPLA CONTAGEM:
- Empréstimos web: verificar sobreposição com EMPRESTIMO. AUTOATENDIMENTO é um canal web que consome EMPRESTIMO — verificar se mantém dados próprios ou se apenas consome.
- Validar com especialista de negócio se AUTOATENDIMENTO é fronteira própria ou canal de EMPRESTIMO.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em AUTOATENDIMENTO/ (Aplicacao/Fontes/, GerenciaAA/Fontes/, AutoEmprestimo/Fontes/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/autoatendimento.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Autoatendimento" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/autoatendimento.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 28 — Exportação FCRT (EXPORTFCRT)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Exportação FCRT do sistema legado Delphi 5.

MÓDULO: Exportação FCRT
CÓDIGO: EXPORTFCRT
PASTA: EXPORTFCRT/
ENTRY POINT: EXPORTFCRT/Fontes/FCRT.dpr
PROPÓSITO: Exportação FCRT — exportação de dados para o workflow FCRT (fundo/capitalização).
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- BENEFICIOPREV (dados de benefícios)
- CONTRIBUICAOPREV (dados de contribuições)
- FOLHA (dados de folha de benefícios)

FRONTEIRA: Pasta EXPORTFCRT — mantém dados de exportação FCRT (arquivos, lotes, configurações) dentro desta fronteira; lê dados dos três módulos previdenciários.

RISCOS DE DUPLA CONTAGEM:
- Dados de exportação: EXPORTFCRT não deve manter dados funcionais dos módulos previdenciários — apenas dados de exportação próprios. Verificar se há AL compartilhados.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em EXPORTFCRT/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/exportfcrt.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Exportação FCRT" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/exportfcrt.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 29 — Simulador FCRT (SIMULADORFCRT)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Simulador FCRT do sistema legado Delphi 5.

MÓDULO: Simulador FCRT
CÓDIGO: SIMULADORFCRT
PASTA: SIMULADORFCRT/
ENTRY POINT: SIMULADORFCRT/Fontes/SimuladorBrTPREV.dpr
PROPÓSITO: Simulador FCRT — simulação de cenários FCRT para BrTPREV (simulação de benefícios previdenciários).
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- BENEFICIOPREV (dados de benefícios)
- PROJETOATUARIAL (projeções atuariais)

FRONTEIRA: Pasta SIMULADORFCRT — mantém dados de simulação (cenários, parâmetros, resultados) dentro desta fronteira; lê dados de BENEFICIOPREV e PROJETOATUARIAL.

RISCOS DE DUPLA CONTAGEM:
- Dados de simulação: SIMULADORFCRT não deve manter dados funcionais — apenas dados de simulação próprios. Verificar se há AL compartilhados.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em SIMULADORFCRT/ (Fontes/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/simuladorfcrt.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Simulador FCRT" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/simuladorfcrt.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 30 — Projeto Atuarial (PROJETOATUARIAL)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Projeto Atuarial do sistema legado Delphi 5.

MÓDULO: Projeto Atuarial
CÓDIGO: PROJETOATUARIAL
PASTA: PROJETOATUARIAL/
ENTRY POINT: PROJETOATUARIAL/FONTES/ProjetoAtuarial.dpr
PROPÓSITO: Projeto atuarial — estudos atuariais, projeções e avaliações do fundo de pensão.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CADASTROPREV (dados cadastrais de participantes)
- PARAMPREV (parâmetros previdenciários — serviço compartilhado)

FRONTEIRA: Pasta PROJETOATUARIAL — mantém dados de projeções atuariais (cenários, hipóteses, resultados) dentro desta fronteira; lê dados de CADASTROPREV.

RISCOS DE DUPLA CONTAGEM:
- Projeções atuariais: verificar sobreposição com SIMULADORFCRT. PROJETOATUARIAL fornece dados para o simulador.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em PROJETOATUARIAL/ (FONTES/, CtrlObjects/, DBObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/projetoatuarial.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Projeto Atuarial" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/projetoatuarial.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 31 — Módulo Básico RH (MODBAS)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Módulo Básico RH do sistema legado Delphi 5.

MÓDULO: Módulo Básico RH
CÓDIGO: MODBAS
PASTA: MODBAS/
ENTRY POINT: MODBAS/Fontes/ModBas.dpr
PROPÓSITO: Módulo básico de RH — pessoas, filiais, sindicatos, profissões e dados base de recursos humanos.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)
- CMGLOBALOBJ50 (objetos globais compartilhados — dependência)

FRONTEIRA: Pasta MODBAS — mantém dados base de RH (pessoas, filiais, sindicatos) dentro desta fronteira; é a fundação para os demais módulos MOD*.

RISCOS DE DUPLA CONTAGEM:
- Dados base de RH: verificar se MODBAS é o dono dos dados de pessoas ou se CADASTROPREV também mantém. Pode haver sobreposição entre dados de pessoas de RH e dados de participantes previdenciários.
- Validar com especialista de negócio a fronteira entre MODBAS e CADASTROPREV.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODBAS/ (Fontes/, CtrlObjects/, DbObjetos/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modbas.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Módulo Básico RH" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modbas.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 32 — Folha de Pagamento RH (MODFOL)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Folha de Pagamento RH do sistema legado Delphi 5.

MÓDULO: Folha de Pagamento RH
CÓDIGO: MODFOL
PASTA: MODFOL/
ENTRY POINT: MODFOL/Fontes/ModFol.dpr
PROPÓSITO: Folha de pagamento RH — rubricas, provisões, descontos, cálculo de folha e RAIS (módulo de RH, distinto de FOLHA de benefícios).
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- MODBEN (benefícios RH — dados de benefícios)
- IRRF (imposto de renda — tabelas de IR)
- CONTAB (contabilidade — lançamentos)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)

FRONTEIRA: Pasta MODFOL — mantém dados de folha de pagamento RH (rubricas, provisões, histórico) dentro desta fronteira; integra com MODBAS, IRRF e CONTAB.

RISCOS DE DUPLA CONTAGEM:
- Rubricas/provisões: verificar sobreposição com MODBEN. MODFOL gerencia rubricas de folha; MODBEN gerencia benefícios. Verificar se há dados compartilhados.
- Verificar sobreposição com IRRF (tabelas de IR referenciadas).
- Validar com especialista de negócio a fronteira entre MODFOL, MODBEN e IRRF.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODFOL/ (Fontes/, CtrlObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modfol.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Folha de Pagamento RH" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modfol.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 33 — Benefícios RH (MODBEN)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Benefícios RH do sistema legado Delphi 5.

MÓDULO: Benefícios RH
CÓDIGO: MODBEN
PASTA: MODBEN/
ENTRY POINT: MODBEN/Fontes/ModBen.dpr
PROPÓSITO: Benefícios RH — cadastro e manutenção de benefícios de funcionários (plano de saúde, odonto, etc.).
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- MODFOL (folha de pagamento — rubricas)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)
- CMMODBENSVR50 (servidor COM — infraestrutura)

FRONTEIRA: Pasta MODBEN — mantém dados de benefícios RH (cadastro, histórico, regras) dentro desta fronteira; integra com MODBAS e MODFOL.

RISCOS DE DUPLA CONTAGEM:
- Benefícios: verificar sobreposição com MODFOL. MODBEN gerencia benefícios; MODFOL gerencia rubricas de folha. Verificar se a tabela de benefícios é mantida por ambos.
- Validar com especialista de negócio a fronteira entre MODBEN e MODFOL.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODBEN/ (Fontes/, CtrlObjects/, DbObjetos/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modben.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Benefícios RH" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modben.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 34 — Cargos e Salários (MODCES)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Cargos e Salários do sistema legado Delphi 5.

MÓDULO: Cargos e Salários
CÓDIGO: MODCES
PASTA: MODCES/
ENTRY POINT: MODCES/Fontes/ModCes.dpr
PROPÓSITO: Cargos e salários — gestão de cargos, faixas salariais, pesquisa salarial e evolução de carreira.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- MODFOL (folha de pagamento — dados salariais)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)

FRONTEIRA: Pasta MODCES — mantém dados de cargos e salários (cargos, faixas, evolução) dentro desta fronteira; integra com MODBAS e MODFOL.

RISCOS DE DUPLA CONTAGEM:
- Cargos/salários: verificar sobreposição com MODFOL. MODCES gerencia a estrutura de cargos; MODFOL usa os salários na folha. Verificar se há dados compartilhados.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODCES/ (Fontes/, CtrlObjects/, DbObjetos/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modces.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Cargos e Salários" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modces.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 35 — Avaliação de Desempenho (MODAVA)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Avaliação de Desempenho do sistema legado Delphi 5.

MÓDULO: Avaliação de Desempenho
CÓDIGO: MODAVA
PASTA: MODAVA/
ENTRY POINT: MODAVA/Fontes/ModAva.dpr
PROPÓSITO: Avaliação de desempenho — gestão de fatores, pesos, regras de avaliação e histórico de resultados.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- MODCES (cargos e salários — dados de cargos)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)
- CMMODAVASVR50 (servidor COM — infraestrutura)

FRONTEIRA: Pasta MODAVA — mantém dados de avaliação (fatores, pesos, resultados, histórico) dentro desta fronteira; lê dados de MODBAS e MODCES.

RISCOS DE DUPLA CONTAGEM:
- Avaliações: verificar se MODAVA mantém dados próprios ou se apenas consome dados de MODBAS/MODCES. Se apenas consome, os AL podem ser mínimos.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODAVA/ (Fontes/, CtrlObjects/, DbObjetos/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modava.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Avaliação de Desempenho" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modava.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 36 — Recrutamento e Seleção (MODRES)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Recrutamento e Seleção do sistema legado Delphi 5.

MÓDULO: Recrutamento e Seleção
CÓDIGO: MODRES
PASTA: MODRES/
ENTRY POINT: MODRES/Fontes/ModRes.dpr
PROPÓSITO: Recrutamento e seleção — gestão de requisições de pessoal, fontes de recrutamento e avaliação de candidatos.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- MODCES (cargos e salários — dados de cargos)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)

FRONTEIRA: Pasta MODRES — mantém dados de recrutamento (requisições, candidatos, avaliações) dentro desta fronteira; lê dados de MODBAS e MODCES.

RISCOS DE DUPLA CONTAGEM:
- Requisições de pessoal: verificar se MODRES mantém dados próprios ou se apenas consome dados de MODBAS/MODCES.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODRES/ (Fontes/, CtrlObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modres.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Recrutamento e Seleção" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modres.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 37 — Treinamento (MODTRN)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Treinamento do sistema legado Delphi 5.

MÓDULO: Treinamento
CÓDIGO: MODTRN
PASTA: MODTRN/
ENTRY POINT: MODTRN/Fontes/ModTrn.dpr
PROPÓSITO: Treinamento — gestão de cursos, agendas, orçamentos, registros e presença em treinamentos.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- MODCES (cargos e salários — dados de cargos)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)

FRONTEIRA: Pasta MODTRN — mantém dados de treinamento (cursos, agendas, histórico, presença) dentro desta fronteira; lê dados de MODBAS e MODCES.

RISCOS DE DUPLA CONTAGEM:
- Treinamentos: verificar se MODTRN mantém dados próprios ou se apenas consome dados de MODBAS/MODCES.
- Validar com especialista de negócio se a fronteira está correta.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODTRN/ (Fontes/, CtrlObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modtrn.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Treinamento" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modtrn.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 38 — Assiduidade/Movimentação (MODASM)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Assiduidade/Movimentação do sistema legado Delphi 5.

MÓDULO: Assiduidade/Movimentação
CÓDIGO: MODASM
PASTA: MODASM/
ENTRY POINT: MODASM/Fontes/ModAsm.dpr
PROPÓSITO: Assiduidade e movimentação — registro de faltas, ocorrências, histórico e relatórios PCMSO.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- MODACESSO (controle de acesso/ponto — dados de cartões/biometria)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)
- CMRHOBJUTIL50 (objetos utilitários RH — dependência)

FRONTEIRA: Pasta MODASM — mantém dados de assiduidade (faltas, ocorrências, histórico) dentro desta fronteira; lê dados de MODBAS e MODACESSO.

RISCOS DE DUPLA CONTAGEM:
- Faltas/ocorrências: verificar sobreposição com MODACESSO. MODASM registra faltas; MODACESSO registra ponto. Verificar se há dados compartilhados.
- Validar com especialista de negócio a fronteira entre MODASM e MODACESSO.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODASM/ (Fontes/, CtrlObjects/, DbObjetos/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modasm.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Assiduidade/Movimentação" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modasm.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 39 — Gestão de Frota/Automóveis (MODAUTO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Gestão de Frota/Automóveis do sistema legado Delphi 5.

MÓDULO: Gestão de Frota/Automóveis
CÓDIGO: MODAUTO
PASTA: MODAUTO/
ENTRY POINT: MODAUTO/Fontes/ModAuto.dpr
PROPÓSITO: Gestão de frota e automóveis — contratos de veículos, tarifas, destacamento, férias e ordens de serviço.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- CONTRATO (contratos — contratos de veículos)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)
- CMCAPCAROBJ50 (objetos de contas a pagar/receber — dependência)

FRONTEIRA: Pasta MODAUTO — mantém dados de frota (veículos, contratos, OS, tarifas) dentro desta fronteira; integra com MODBAS e CONTRATO.

RISCOS DE DUPLA CONTAGEM:
- Contratos de frota: verificar sobreposição com CONTRATO. MODAUTO gerencia contratos de veículos; CONTRATO gerencia contratos genéricos. Verificar se há dados compartilhados.
- Validar com especialista de negócio a fronteira entre MODAUTO e CONTRATO.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODAUTO/ (Fontes/, CtrlObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modauto.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Gestão de Frota/Automóveis" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modauto.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 40 — Controle de Acesso/Ponto (MODACESSO)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Controle de Acesso/Ponto do sistema legado Delphi 5.

MÓDULO: Controle de Acesso/Ponto
CÓDIGO: MODACESSO
PASTA: MODACESSO/
ENTRY POINT: MODACESSO/Fontes/ModAcesso.dpr
PROPÓSITO: Controle de acesso e ponto — gestão de cartões, biometria, estações de acesso e registro de ponto.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)
- CMRHOBJUTIL50 (objetos utilitários RH — biometria — dependência)

FRONTEIRA: Pasta MODACESSO — mantém dados de acesso (cartões, biometria, estações, ponto) dentro desta fronteira; lê dados de MODBAS.

RISCOS DE DUPLA CONTAGEM:
- Dados de ponto: verificar sobreposição com MODASM. MODACESSO registra ponto; MODASM registra faltas/ocorrências. Verificar se há dados compartilhados.
- Validar com especialista de negócio a fronteira entre MODACESSO e MODASM.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODACESSO/ (Fontes/, CtrlObjetos/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modacesso.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Controle de Acesso/Ponto" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modacesso.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---
### Prompt 41 — Contencioso RH (MODCON)

```
Você é um analista de métricas de software. Sua tarefa é executar a contagem SFP (Simple Function Points) do módulo Contencioso RH do sistema legado Delphi 5.

MÓDULO: Contencioso RH
CÓDIGO: MODCON
PASTA: MODCON/
ENTRY POINT: MODCON/Fontes/ModCon.dpr
PROPÓSITO: Contencioso RH — gestão de processos trabalhistas, advogados, varas e acompanhamento de ações.
TECNOLOGIA: Delphi 5 / VCL / Oracle (schema CM.) — contexto técnico, não fator de contagem SFP.

DEPENDÊNCIAS (referenciadas, não contadas como elementos deste módulo):
- MODBAS (módulo básico RH — dados de pessoas)
- SISTJUR (sistema jurídico — dados de processos)
- PROCJUD (processos judiciais — dados de processos)
- CMRHOBJ50 (objetos de negócio RH compartilhados — dependência)

FRONTEIRA: Pasta MODCON — mantém dados de contencioso RH (processos trabalhistas, advogados, varas) dentro desta fronteira; integra com MODBAS e SISTJUR/PROCJUD.

RISCOS DE DUPLA CONTAGEM:
- Processos trabalhistas: verificar sobreposição com SISTJUR e PROCJUD. MODCON gerencia processos trabalhistas de RH; SISTJUR/PROCJUD gerenciam processos jurídicos gerais. Verificar se há dados compartilhados.
- Validar com especialista de negócio a fronteira entre MODCON, SISTJUR e PROCJUD.

MÉTODO: SFP (Simple Function Points) — IFPUG SFP; Roteiro de Métricas de Software do SISP v3.0.
PESOS: 4,6 SFP por Processo Elementar (PE); 7 SFP por Arquivo Lógico (AL).
FÓRMULA: Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)
TERMINOLOGIA: Use exclusivamente SFP — Processos Elementares (PE) e Arquivos Lógicos (AL). NÃO use EI, EO, EQ, ILF, EIF, DET, FTR, RET, matrizes de complexidade ou pesos da APF tradicional.

MODELO DE REFERÊNCIA: docs1/pontos-de-funcao/folha.html — análise SFP completa de Folha de Benefícios (25 PE, 23 AL, 276 SFP). Use como modelo de estrutura, apresentação visual e metodologia. NÃO copie totais ou conteúdo funcional de Folha — cada contagem é independente.

INSTRUÇÕES:
1. Explore o código-fonte em MODCON/ (Fontes/, CtrlObjects/) para identificar Processos Elementares (PE) e Arquivos Lógicos (AL).
2. Para cada PE: documente ID, nome, objetivo, justificativa de distinção, fonte no código (.pas), situação (COMPROVADO/INFERIDO/PENDENTE).
3. Para cada AL: documente ID, nome, descrição, fronteira (mantido ou referenciado), PE relacionados, fonte, situação.
4. Calcule o total SFP: (qtd_PE × 4,6) + (qtd_AL × 7).
5. Documente a rastreabilidade de cada PE ao código-fonte.
6. Identifique integrações e riscos de dupla contagem com outros módulos.
7. Liste pendências (elementos com identificação incompleta).
8. Crie o arquivo docs1/pontos-de-funcao/modcon.html seguindo o padrão visual de folha.html (8 seções: Identificação, Sumário executivo, Inventário de PE, Inventário de AL, Memória de cálculo, Rastreabilidade, Integrações e dupla contagem, Pendências).
9. Adicione a aba "Contencioso RH" na navegação <nav> de:
   - docs1/pontos-de-funcao/index.html
   - docs1/pontos-de-funcao/folha.html
   - docs1/pontos-de-funcao/contribuicao.html
   - docs1/pontos-de-funcao/beneficioprev.html
   - docs1/pontos-de-funcao/metodologia.html
   - docs1/pontos-de-funcao/modcon.html (o novo arquivo)
10. Adicione um card na seção "Análises por módulo" e uma linha na tabela "Resumo comparativo" de docs1/pontos-de-funcao/index.html.

ENTREGÁVEL: relatório final listando todos os arquivos criados ou alterados, o total de PE, AL e SFP do módulo, e as pendências identificadas.
```

---

## 12. Pendências

### 12.1 Pendências do inventário

| # | Pendência | Impacto | Validação necessária |
|---|---|---|---|
| 1 | Fronteira de INVESTCOTAS — independente ou sub-módulo de INVESTIMENTOS? | Pode ser contado individualmente, junto com INVESTIMENTOS ou excluído | Validar com especialista de negócio |
| 2 | Fronteira de INVESTFDO — independente ou sub-módulo de INVESTIMENTOS? | Pode ser contado individualmente, junto com INVESTIMENTOS ou excluído | Validar com especialista de negócio |
| 3 | Fronteira de COTASPATRIM — independente, parte de COTAS ou de INVESTIMENTOS? | Pode ser contado individualmente, junto com COTAS/INVESTIMENTOS ou excluído | Validar com especialista de negócio |
| 4 | Fronteira de RADG — módulo independente ou parte de RELATORIOSCM? | Pode ser contado individualmente ou como dependência | Validar com especialista de negócio |
| 5 | Fronteira de SCQ — propósito e fronteira não claros | Pode ser contado individualmente ou reclassificado | Validar com especialista de negócio |
| 6 | Fronteira de SRHCS — sobreposição com módulos MOD*? | Pode ser contado individualmente, junto com MOD* ou excluído | Validar com especialista de negócio |
| 7 | Fronteira de RELATORIOSCM — independente ou serviço compartilhado? | Pode ser contado individualmente ou reclassificado como dependência | Validar com especialista de negócio |
| 8 | Dupla contagem BENEFBFCIARIO (FOLHA × BENEFICIOPREV) — dono funcional? | 7 SFP podem ser removidos de um dos módulos | Já identificado em folha.html/beneficioprev.html; validar com especialista |
| 9 | Dupla contagem PROCESSOBENEF (FOLHA × BENEFICIOPREV) — dono funcional? | 7 SFP podem ser removidos de um dos módulos | Já identificado; validar com especialista |
| 10 | Fronteira CONTAB × CFINAN — quem é o dono dos lançamentos contábeis? | Pode gerar dupla contagem de AL | Validar durante a contagem de CONTAB e CFINAN |
| 11 | Fronteira SISTJUR × PROCJUD — quem é o dono dos processos jurídicos? | Pode gerar dupla contagem de AL | Validar durante a contagem de SISTJUR e PROCJUD |
| 12 | Fronteira ADMINIMOB × INVESTIMOB — quem é o dono dos dados de imóveis? | Pode gerar dupla contagem de AL | Validar durante a contagem de ADMINIMOB e INVESTIMOB |
| 13 | Fronteira MODFOL × MODBEN — quem é o dono das rubricas/benefícios? | Pode gerar dupla contagem de AL | Validar durante a contagem de MODFOL e MODBEN |
| 14 | Fronteira EMPRESTIMO × FINANCIAMENTO — FINANCIAMENTO é sub-módulo? | Pode gerar dupla contagem ou reclassificação | Validar durante a contagem de EMPRESTIMO e FINANCIAMENTO |
| 15 | Fronteira EMPRESTIMO × AUTOATENDIMENTO — AUTOATENDIMENTO é canal ou fronteira? | Pode gerar dupla contagem ou reclassificação | Validar durante a contagem de EMPRESTIMO e AUTOATENDIMENTO |

### 12.2 Pendências dos módulos "Requer validação"

Os 7 módulos classificados como "Requer validação" (seção 5.5) não possuem prompt individual gerado. Após validação com especialista de negócio, se reclassificados para "Contar individualmente", um prompt deverá ser gerado seguindo o mesmo modelo dos 41 prompts da seção 11.

### 12.3 Pendências de documentação funcional

Os 41 módulos recomendados para contagem individual **não possuem documentação funcional** em `docs1/` (apenas os 3 módulos previdenciários já analisados têm Blueprint AS-IS). A contagem SFP de cada módulo novo deverá ser executada diretamente a partir do código-fonte Delphi 5, conforme as instruções de cada prompt. Se a documentação funcional for necessária antes da contagem, deverá ser gerada em issue separada.

---

## 13. Premissas

### 13.1 Premissas adotadas

1. **Método SFP:** a métrica adotada é SFP (Simple Function Points), não APF tradicional. O nome do arquivo permanece `analise_modulos_APF.md` por compatibilidade, mas o conteúdo usa exclusivamente terminologia SFP.
2. **Pesos:** 4,6 SFP por PE e 7 SFP por AL, conforme IFPUG SFP e Roteiro de Métricas de Software do SISP v3.0.
3. **Delphi 5 como contexto técnico:** o sistema foi desenvolvido em Delphi 5 (VCL, Oracle, MIDAS/DataSnap). Delphi 5 é registrado como característica técnica, não como fator de contagem SFP.
4. **Fronteira por pasta:** cada módulo funcional foi tratado como aplicação com fronteira própria, delimitada pela pasta do repositório. Dados compartilhados entre módulos são contados como AL no módulo "dono" e referenciados nos demais.
5. **Entry point (.dpr):** módulos com `.dpr` próprio são candidatos a "Contar individualmente"; pastas sem `.dpr` são tipicamente bibliotecas compartilhadas.
6. **Pacotes CM (BPL):** pacotes `CM*OBJ50` são dependências compartilhadas (categoria 3), não módulos funcionais com fronteira própria.
7. **App servers (COM/DLL):** servidores COM são infraestrutura tecnológica (categoria 4).
8. **Modelo de referência:** a análise SFP de Folha de Benefícios (`docs1/pontos-de-funcao/folha.html`) é o modelo de padronização visual e metodológico. Seus totais (276 SFP) e conteúdo funcional não são copiados para outros módulos.
9. **Não execução:** este documento não executa a contagem SFP de nenhum módulo novo — apenas inventaria, classifica, planeja e gera prompts.
10. **Preservação do repositório:** nenhum arquivo fora de `analise_modulos_APF.md` foi criado ou modificado.

### 13.2 Restrições

- Não executar agora a contagem SFP de todos os módulos — apenas inventariar, planejar e gerar prompts.
- Não omitir módulos do inventário por desconhecer seus nomes.
- Não presumir que todas as pastas são módulos independentes.
- Não inventar fronteiras, dependências, funções ou dados.
- Não copiar conteúdo funcional ou totais de Folha para outros módulos.
- Não alterar código-fonte ou documentação funcional dos módulos.
- Limitar alterações ao arquivo `analise_modulos_APF.md`.
- Se não houver evidência suficiente, registrar a pendência.

### 13.3 Limitações do inventário

- A classificação dos módulos foi baseada na estrutura de pastas, entry points (.dpr) e nomes de arquivos — não em análise detalhada do código-fonte de cada módulo.
- 7 módulos foram classificados como "Requer validação" por insuficiência de evidência para determinar a fronteira.
- As dependências entre módulos foram inferidas a partir dos nomes e domínios — não validadas por análise de código.
- Os riscos de dupla contagem identificados são preliminares — a análise definitiva será feita durante a execução de cada prompt individual.
- O repositório contém ~120+ pastas; algumas podem ter sido sub-classificadas ou sobre-classificadas. A validação com especialista de negócio é recomendada.

### 13.4 Formato de entrega

| Item | Valor |
|---|---|
| Arquivo criado | `analise_modulos_APF.md` (novo) |
| Módulos identificados no inventário | 120 pastas classificadas |
| Módulos recomendados para contagem individual | 44 (3 já analisados + 41 novos) |
| Módulos marcados para agrupamento | 3 (CAFMT, MODATN, SISTJURCONS) |
| Módulos marcados como dependência/serviço | 24 |
| Módulos marcados para exclusão | 42 |
| Módulos marcados para validação | 7 |
| Prompts individuais gerados | 41 (um por módulo novo recomendado) |
| Modelo de referência usado | `docs1/pontos-de-funcao/folha.html` (análise SFP de Folha de Benefícios) |
| Prompts especificam aba/página individual | Sim — cada prompt instrui criar `docs1/pontos-de-funcao/<modulo>.html` e adicionar na navegação |
| Código-fonte alterado | Não |
| Documentação funcional alterada | Não |
| Arquivos alterados fora de `analise_modulos_APF.md` | Nenhum |

---

*Fim do documento — `analise_modulos_APF.md` — PFC-49 — Gerado em 2026-11-12*
