# Catálogo de APIs e Interfaces — Sistema Planus (Delphi 5)

Este documento cataloga as interfaces de integração do sistema. Como se trata de uma suíte
**desktop cliente/servidor e multicamada (MIDAS/MTS)** em Delphi 5, não há APIs REST/HTTP no
sentido moderno; as "APIs" são, na prática:

1. Servidores de aplicação (MIDAS/COM) que expõem métodos de negócio a clientes `TClientDataSet`.
2. Objetos de negócio empacotados em BPLs (`*Obj50`) reutilizados entre aplicações.
3. Procedures/packages PL/SQL do Oracle chamadas pelas aplicações.
4. Integrações externas (arquivos e conectores).

> Legenda de confiança: **Alta** / **Média** / **Baixa**.

---

## 1. Servidores de Aplicação (MIDAS / Multi-Tier)

As aplicações com sufixo `MT` (ex.: `CPAGAR/FontesMT`, `CRECEBER/FontesMT`, `ORCAMENTO/FontesMT`)
consomem servidores de aplicação que expõem os dados via pacotes de dados (`TClientDataSet` /
`IAppServer`).

| Servidor (projeto) | Diretório | Domínio atendido | Confiança |
|---|---|---|---|
| Servidor Contas a Pagar/Financeiro | `APPSERVERCFINAN/` | financeiro-tesouraria | Média |
| Servidor Orçamento | `APPSERVERORCAMENTO/` | planejamento-orcamento | Média |
| Servidor IRRF (DLL) | `APPSERVERIRRFDLL/` | impostos-tributos | Média |
| Servidor Livro/Contábil (DLL) | `APPSERVERLIVRODLL/` | contabilidade | Média |
| Servidor Capitalização de Carteira | `APPSRVCAPCAR/` | investimentos | Média |
| Servidor Almoxarifado/Compras | `CMALMOXCOMPRASRVR50/` | almoxarifado-compras | Média |
| Servidor RH - Avaliação | `CMMODAVASVR50/` | recursos-humanos | Média |
| Servidor RH - Benefícios | `CMMODBENSVR50/` | recursos-humanos | Média |
| Servidor Padrões/DLL | `APPSERVERDLL/`, `CMPADORESSVR50/` | plataforma-cm | Baixa |

> **Confiança: Alta** de que se trata de arquitetura multicamada (uso disseminado de
> `TClientDataSet`, ~270 ocorrências em `.dfm`); **Média/Baixa** para o contrato exato de cada
> servidor (métodos/interfaces), que exige leitura dos `.pas` dos servidores.

---

## 2. Objetos de Negócio Reutilizáveis (BPLs `*Obj50`)

Pacotes de negócio compartilhados entre aplicações (definidos em `2-BPL.Negocio.bpg`). Funcionam
como "biblioteca de serviços" de domínio para os executáveis.

| Pacote (BPL) | Domínio | Consumido por (exemplos) |
|---|---|---|
| `CmGlobalObj50` | Global/comum | Todas as aplicações |
| `CMContabObj50` | Contabilidade | `Contab.exe` |
| `CMCfinanObj50` | Financeiro | `CFINAN.exe`, `ContasaPagar.exe` |
| `CMPlaneOrcObj50` | Orçamento | `Orcamento.exe` |
| `CMCapCarObj50`, `CmCapCarUtilObj50` | Investimentos/Capitalização | `Investimentos.exe` |
| `CMIntBancoMT50` | Integração bancária | Financeiro |
| `CMCAFObj50` | Ativo Fixo | `Caf.exe` |
| `CMIRRFobj50` | IRRF | `Impostos.exe` |
| `cmLivroObj50` | Livros contábeis | `Contab.exe` |
| `CMImobiliarioObj50` | Imobiliário | `AdminImob.exe`, `InvestImob.exe` |
| `CMIndicadoresObj50` | Indicadores | `Indicadores.exe` |
| `CmRelatorioObj50` | Relatórios | `RelatoriosCm.exe` |
| `CmRHObj50`, `CMCompoRH`, `CMMTSOBJRH` | Recursos Humanos | Módulos `MOD*` |
| `CMFBOBJ50`, `CMFolhaObjMT`, `CMFBCOMUM50` | Folha de Benefícios | `Folha.exe` |
| `CMAutoAtendimentoObj50`, `CMWebComum50` | Autoatendimento | `AutoAtendimento.exe` |
| `CmAgendamentoObj50` | Agendamento | `Agendamento.exe` |
| `CMObjetosEP50`, `CMIntegraEP50`, `CMExecEP50` | Empréstimos | `emprestimo.exe` |
| `CMAdmPrev` | Administração previdenciária | `BeneficioPrev.exe`, `CadastroPrev.exe` |

> Confiança: Alta (mapeamento direto em `2-BPL.Negocio.bpg` e `uses` dos `.dpr`).

---

## 3. Procedures / Packages PL/SQL (Oracle)

Interface de negócio no banco, chamada pelas aplicações. Exemplos versionados neste repositório:

| Objeto PL/SQL | Tipo | Função | Origem |
|---|---|---|---|
| `CM.SP_FB_GERALISTAPREVIA` | Procedure | Gera lista/prévia da folha de benefícios | `SCRIPT/01_Script_SIG41089_DDL.sql` |
| `CM.SP_TRAT_PARCELAS_EM_ATRASO` | Procedure | Trata parcelas de empréstimo em atraso (juros/multa/INPC/IOF) | `__SCRIPTS__/2024/10/WO4322_4230/*` |
| `CM.PR_MAPAMOVEMPTMO` | Procedure | Mapa de movimento de empréstimo | `__SCRIPTS__/2024/11/WO9250-13212/*` |
| `CM.TUDLOGALT_CONTRATOCONTR` | Trigger | Auditoria de alteração de contrato → `LOGPLANUS` | `__SCRIPTS__/2024/11/WO13506/*` |
| Packages/triggers de trilha `TUDLOGALT_*` | Trigger | Auditoria de alterações | `__SCRIPTS__/**` |

Contagem observada nos scripts do repositório: ~13 procedures, ~12 packages, ~43 triggers.

> Confiança: Alta para os objetos listados; a superfície completa reside no banco de produção.

---

## 4. Integrações Externas

| Integração | Descrição | Origem | Confiança |
|---|---|---|---|
| Integração CM × SAF | Aplicação `IntegraSAF.exe` — "Integração CM X SAF" | `INTEGRASAF/Fontes/IntegraSAF.dpr` | Média |
| Reembolso/Conciliação INSS | Importação de arquivos e conciliação de reembolso do INSS | `BENEFICIOPREV` (telas de Reembolso/Conciliação) | Alta |
| Integração bancária | Geração/leitura de arquivos bancários (CNAB) | `CMINTBANCOMT50/` | Média |
| Autoatendimento Web | Portal web (`CMWebComum50`) para autoatendimento e auto-empréstimo | `AUTOATENDIMENTO/**` | Média |
| Informações SPC/PREVIC | Controle de cotas e informações regulatórias | `COTAS/` ("Controle de Cotas & Informações SPC") | Média |
| Exportações FCRT | Aplicações e simulador FCRT | `EXPORTFCRT/`, `SIMULADORFCRT/` | Média |
| Atualização de versão | Distribuição/atualização de versões dos executáveis | `ATUVERSAOCM/` | Média |

> Observação: as integrações são majoritariamente baseadas em **arquivos** (importação/exportação)
> e em **conectores COM/MIDAS**, coerentes com a era Delphi 5.
