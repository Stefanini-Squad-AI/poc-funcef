# Mapa de Arquivos por Módulo

Este mapa associa os diretórios e artefatos do repositório aos módulos funcionais definidos em
`docs/system-overview.md`. São utilizados caminhos relativos à raiz do repositório e globs `**`
para abranger os subdiretórios de cada aplicação/pacote.

<!-- MODULE_FILE_MAP_START -->

CADASTROPREV/** = cadastro-previdenciario
PARAMPREV/** = cadastro-previdenciario
INTERFACEPREV/** = cadastro-previdenciario
PROJETOATUARIAL/** = cadastro-previdenciario

BENEFICIOPREV/** = beneficios-previdenciarios
CM/CMADMPREV/** = beneficios-previdenciarios

CONTRIBUICAOPREV/** = contribuicao-previdenciaria

FOLHA/** = folha-beneficios

AGENDAMENTO/** = atendimento-previdenciario
CENTRALAP/** = atendimento-previdenciario
MODATN/** = atendimento-previdenciario
AUTOATENDIMENTO/** = atendimento-previdenciario
PROCPREV/** = atendimento-previdenciario
CMAGENDAMENTOOBJ50/** = atendimento-previdenciario

EMPRESTIMO/** = emprestimos-financiamento
EMPRESTIMOBPL/** = emprestimos-financiamento
FINANCIAMENTO/** = emprestimos-financiamento

INVESTIMENTOS/** = investimentos
INVESTFDO/** = investimentos
INVESTCOTAS/** = investimentos
COTAS/** = investimentos
COTASPATRIM/** = investimentos
CMCAPCAROBJ50/** = investimentos
CMCAPCARUTILOBJ50/** = investimentos
APPSRVCAPCAR/** = investimentos

ADMINIMOB/** = gestao-imobiliaria
INVESTIMOB/** = gestao-imobiliaria
ALIENACAO/** = gestao-imobiliaria
CMIMOBILIARIOOBJ50/** = gestao-imobiliaria
EPIM/** = gestao-imobiliaria
EPIMIMOB/** = gestao-imobiliaria

CONTAB/** = contabilidade
CMCONTABOBJ50/** = contabilidade
CMLIVROOBJ50/** = contabilidade
APPSERVERLIVRODLL/** = contabilidade

CFINAN/** = financeiro-tesouraria
CPAGAR/** = financeiro-tesouraria
CRECEBER/** = financeiro-tesouraria
CMCFINANOBJ50/** = financeiro-tesouraria
CMINTBANCOMT50/** = financeiro-tesouraria
APPSERVERCFINAN/** = financeiro-tesouraria

ORCAMENTO/** = planejamento-orcamento
CMPLANEORCOBJ50/** = planejamento-orcamento
APPSERVERORCAMENTO/** = planejamento-orcamento

IRRF/** = impostos-tributos
EXPORTFCRT/** = impostos-tributos
SIMULADORFCRT/** = impostos-tributos
CMIRRFOBJ50/** = impostos-tributos
APPSERVERIRRFDLL/** = impostos-tributos

CAF/** = ativo-fixo-patrimonio
CAFMT/** = ativo-fixo-patrimonio
CMCAFOBJ50/** = ativo-fixo-patrimonio

CONTRATO/** = contratos-projetos

ALMOXARIFADO/** = almoxarifado-compras
COMPRAS2000/** = almoxarifado-compras
ALMOX&COMPRAS/** = almoxarifado-compras
RECMERC/** = almoxarifado-compras
CMALMOXCOMPRAOBJ50/** = almoxarifado-compras
CMALMOXCOMPRASRVR50/** = almoxarifado-compras

MODBAS/** = recursos-humanos
MODFOL/** = recursos-humanos
MODCES/** = recursos-humanos
MODBEN/** = recursos-humanos
MODAVA/** = recursos-humanos
MODRES/** = recursos-humanos
MODTRN/** = recursos-humanos
MODCON/** = recursos-humanos
MODASM/** = recursos-humanos
MODAUTO/** = recursos-humanos
MODACESSO/** = recursos-humanos
SRHCS/** = recursos-humanos
CMRHOBJ50/** = recursos-humanos
CMRHOBJUTIL50/** = recursos-humanos
CMCOMPORH/** = recursos-humanos
CMMTSOBJRH/** = recursos-humanos
CMMODAVASVR50/** = recursos-humanos
CMMODBENSVR50/** = recursos-humanos

SISTJUR/** = juridico
SISTJURCONS/** = juridico
PROCJUD/** = juridico
RADG/** = juridico

INDICADORES/** = inteligencia-negocio
RELATORIOSCM/** = inteligencia-negocio
FLASHRPT/** = inteligencia-negocio
REGRA/** = inteligencia-negocio
EXECUTAREGRA/** = inteligencia-negocio
CMINDICADORESOBJ50/** = inteligencia-negocio
CMRELATORIOOBJ50/** = inteligencia-negocio

CM/** = plataforma-cm
GLOBALCM/** = plataforma-cm
CMGLOBALOBJ50/** = plataforma-cm
CMCRYPTO/** = plataforma-cm
CMBACK/** = plataforma-cm
BACK/** = plataforma-cm
SHARED/** = plataforma-cm
GERAL/** = plataforma-cm
FUNCOESGERAIS/** = plataforma-cm
OBJRAD/** = plataforma-cm
ATUVERSAOCM/** = plataforma-cm
INTEGRASAF/** = plataforma-cm
SCQ/** = plataforma-cm
MTSMESTREDETALHE/** = plataforma-cm
PROJETOCM/** = plataforma-cm
PROJETOSCM5/** = plataforma-cm
STK/** = plataforma-cm
REFER/** = plataforma-cm
FUNCEF/** = plataforma-cm
APPSERVERDLL/** = plataforma-cm
CMPADORESSVR50/** = plataforma-cm
BIN/** = plataforma-cm
HELP/** = plataforma-cm
HELP_PLANUS/** = plataforma-cm
SCRIPT/** = plataforma-cm
__SCRIPTS__/** = plataforma-cm

ASSISTENCIAL/** = administracao-assistencial

<!-- MODULE_FILE_MAP_END -->

## Regras

- Utilizar caminhos relativos ao repositório.
- Um arquivo pode pertencer a vários módulos (usar `caminho = mod1,mod2`).
- Os nomes dos módulos são exatamente os mesmos do bloco `MODULE_LIST_START` em
  `docs/system-overview.md`.
- Utilizar glob `**` quando necessário.
- Priorizar arquivos específicos quando possível.

## Observações

- O diretório `CM/ComponentesXT/**` contém **componentes de terceiros** (Developer Express,
  InfoPower, Indy, RaLib, ReportBuilder, Toolbar97 etc.) e **não** representa código funcional do
  sistema; foi mantido em `plataforma-cm` apenas para efeito de mapeamento, mas deve ser
  desconsiderado na análise funcional e de cobertura.
- Diretórios de scripts (`SCRIPT`, `__SCRIPTS__`) contêm os artefatos DDL/DML/PLSQL do banco
  Oracle e alimentam o `docs/database-model.md`.
