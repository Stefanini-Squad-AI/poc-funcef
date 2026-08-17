program RADg;

uses
  Forms,
  fCMEntrada,
  UModulo in 'UModulo.pas',
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FGerExecEtapaMT in '..\FontesMT\FGerExecEtapaMT.pas' {FrmGerExecEtapaMT},
  FConsProcMT in '..\FontesMT\FConsProcMT.pas' {FrmConsProcMT},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  uDbRadandamento in '..\DbObjetos\uDbRadandamento.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  uCtrlTipoEtapa in '..\CtrlObjetos\uCtrlTipoEtapa.pas',
  FCadEtapaMT in '..\FontesMT\FCadEtapaMT.pas' {frmCadEtapaMT},
  FFluxoMT in '..\FontesMT\FFluxoMT.pas' {frmFluxoMT},
  uDbRadgrupoprocesso in '..\DbObjetos\uDbRadgrupoprocesso.pas',
  uCtrlFluxo in '..\CtrlObjetos\uCtrlFluxo.pas',
  uDbRadtipoetapa in '..\DbObjetos\uDbRadtipoetapa.pas',
  FCadGrpProcessoMT in '..\FontesMT\FCadGrpProcessoMT.pas' {frmCadGrpProcessoMT},
  uCtrlGrpProcesso in '..\CtrlObjetos\uCtrlGrpProcesso.pas',
  FProcxEtapaxObjMT in '..\FontesMT\FProcxEtapaxObjMT.pas' {frmProcxEtapaxObjMT},
  uDbRadgrprespon in '..\DbObjetos\uDbRadgrprespon.pas',
  uDbRadresponxgrp in '..\DbObjetos\uDbRadresponxgrp.pas',
  uCtrlEtapaxObjeto in '..\CtrlObjetos\uCtrlEtapaxObjeto.pas',
  FCadGrupoResponMT in '..\FontesMT\FCadGrupoResponMT.pas' {frmCadGrupoResponMT},
  uCtrlGrupoRespon in '..\CtrlObjetos\uCtrlGrupoRespon.pas',
  uDbRadetapaxgrpresp in '..\DbObjetos\uDbRadetapaxgrpresp.pas',
  FCadAutxEtapaMT in '..\FontesMT\FCadAutxEtapaMT.pas' {frmCadAutxEtapaMT},
  uDbRadobjetoxetapa in '..\DbObjetos\uDbRadobjetoxetapa.pas',
  uCtrlEtapaxGrupoAut in '..\CtrlObjetos\uCtrlEtapaxGrupoAut.pas',
  FCadProcessoMT in '..\FontesMT\FCadProcessoMT.pas' {frmCadProcessoMT},
  uCtrlTipoProcesso in '..\CtrlObjetos\uCtrlTipoProcesso.pas',
  uDbRadgrupoautoriza in '..\DbObjetos\uDbRadgrupoautoriza.pas',
  uDbRadgrautxgrrespon in '..\DbObjetos\uDbRadgrautxgrrespon.pas',
  FCadGrupoAutMT in '..\FontesMT\FCadGrupoAutMT.pas' {frmCadGrupoAutMT},
  uCtrlGrupoAut in '..\CtrlObjetos\uCtrlGrupoAut.pas',
  uDbRadtipoetapaxproc in '..\DbObjetos\uDbRadtipoetapaxproc.pas',
  uDbRadtipoprocesso in '..\DbObjetos\uDbRadtipoprocesso.pas',
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  RAcompProc in '..\Reports\Source\RAcompProc.pas' {rptAcompProc},
  RInfoProc in '..\Reports\Source\RInfoProc.pas' {rptInfoProc},
  RTipoEtapa in '..\Reports\Source\RTipoEtapa.pas' {rptTipoEtapa},
  RFluxoProc in '..\Reports\Source\RFluxoProc.pas' {rptFluxoProc},
  RGrupoRespon in '..\Reports\Source\RGrupoRespon.pas' {rptGrupoRespon},
  RGrupoAut in '..\Reports\Source\RGrupoAut.pas' {rptGrupoAut},
  uDbRadfluxo in '..\DbObjetos\uDbRadfluxo.pas',
  uCtrlAndamentos in '..\CtrlObjetos\uCtrlAndamentos.pas',
  FCadAndamentosMT in '..\FontesMT\FCadAndamentosMT.pas' {frmCadAndamentosMT},
  FGerProcMT in '..\FontesMT\FGerProcMT.pas' {frmGerProcMT},
  fCondRADDocumento in '..\FontesMT\fCondRADDocumento.pas' {frmCondRADDocumento},
  fCadProcessoRAD in '..\FontesMT\fCadProcessoRAD.pas' {frmCadProcessoRAD},
  frCondRad in '..\FontesMT\frCondRad.pas' {frameCondRAD: TFrame},
  frCndRADReqMaterial in '..\FontesMT\frCndRADReqMaterial.pas' {frameCndRADReqMaterial: TFrame},
  frCndRADGeral in '..\FontesMT\frCndRADGeral.pas' {frameCndRADGeral: TFrame},
  frCndRADDoc in '..\FontesMT\frCndRADDoc.pas' {frameCndRADDoc: TFrame},
  fPropAprovaRAD in '..\..\Cm\CMRAD50\Source\fPropAprovaRAD.pas' {frmPropAprovaRAD},
  fRADParam in '..\FontesMT\fRADParam.pas' {frmRADParam},
  FConsultaRAD in '..\..\Cm\CMRAD50\Source\FConsultaRAD.pas' {frmConsultaRAD},
  FParamRPTProcessoRad in '..\Reports\Source\FParamRPTProcessoRad.pas' {frmParamRPTProcessoRAD},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  uCtrlRptRADG in '..\Reports\Source\uCtrlRptRADG.pas',
  rProcessoRad in '..\Reports\Source\rProcessoRad.pas' {FrmRptProcessoRAD},
  fRenumerarEtapas in '..\FontesMT\fRenumerarEtapas.pas' {frmRenumerarEtapas},
  frCndRADValor in '..\FontesMT\frCndRADValor.pas' {frameCndRADValor: TFrame},
  rProcAnaliticoRad in '..\Reports\Source\rProcAnaliticoRad.pas' {rptProcAnaliticoRAD},
  RRadAtrasos in '..\Reports\Source\RRadAtrasos.pas' {rptRadAtrasos},
  FParamRadAtrasos in '..\Reports\Source\FParamRadAtrasos.pas' {FrmParamRadAtrasos},
  frCndRADSolicCompra in '..\FontesMT\frCndRADSolicCompra.pas' {frameCndRADSolicCompra: TFrame},
  frCndRADDestacViagem in '..\FontesMT\frCndRADDestacViagem.pas' {frameCndRADDestacViagem: TFrame},
  frCndRADOrdemCompra in '..\FontesMT\frCndRADOrdemCompra.pas' {frameCndRADOrdemCompra: TFrame},
  frCndRADCotacao in '..\FontesMT\frCndRADCotacao.pas' {frameCndRADCotacao: TFrame},
  fMsgTeste in '..\FontesMT\fMsgTeste.pas' {frmMsgTeste};

{$R *.RES}
{$R RADG_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'RAD - Registro de Alçadas e Decisões';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RAD-Gerencial
================================================================================
CM$VER      3.01.12     06/11/2007
--------------------------------------------------------------------------------
Liberação do padrão 18.
================================================================================
CM$VER      3.01.11a    09/10/2007
--------------------------------------------------------------------------------
Pendência 26546 - Envio de e-mail pelo RAD
- Criação de botão para envio de e-mail pela janela de configuração para testes de parametrização.
================================================================================
CM$VER      3.01.10     22/05/2007
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.16
Pendência  : 25420
Descrição : Implementada as referências e os detalhes do processo RAD para o Sistema de Cotas Patrimoniais
Pendência  : 25280
Descrição : Implementada verificação da situação atual do processo para evitar que o usuário opere um
processo cuja situação foi modificada por outro usuário.
================================================================================
CM$VER      3.01.09     04/05/2007
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.15
Pendência 21549 - RAD
- Inclusão de condições por grupo de produto.
================================================================================
CM$VER      3.01.08     28/03/2007
--------------------------------------------------------------------------------
Pendência 24807 - Parametrização do sistema
- Não gravava dados de e-mail.
================================================================================
CM$VER      3.01.07     26/02/2007
--------------------------------------------------------------------------------
Alterações diversas.
================================================================================
CM$VER      3.01.06     05/01/2007
--------------------------------------------------------------------------------
Pendência 23341 - Relatório de RADs em atraso
- Retirar valores zerados.
================================================================================
CM$VER      3.01.05     13/12/2006
--------------------------------------------------------------------------------
Implementação do RAD+.
================================================================================
CM$VER      3.01.04     18/09/2006
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.12
================================================================================
CM$VER      3.01.03     19/06/2006
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.07
================================================================================
CM$VER      3.01.02     06/06/2005
--------------------------------------------------------------------------------
Pendência: 17264
Tela: Cadastros\Grupo de Autorização
Descrição: Colocar a amarração Tipo de documento x valor x grupo de autorização.
================================================================================
CM$VER      3.01.01     27/05/2003
--------------------------------------------------------------------------------
Criação de parâmetro de Valor Mínimo para criação de Lotes (em Tipo de Processos)
Alteração na tela de filtragem de Execução de Etapas (incluindo SCI e Lote)
- Resolução da Pendência Nº 13920
  > Tela\Opçao No Sistema: Execução do RAD
  Na tela de execução do RAD devido a implantação da nova tela de filtragem, ter a opção de visualizar qual o lote a ser autorizado e a SCI a ser aprovada(conforme anteriormente), pois hoje está trazendo todos os processos pendentes. Desta forma está  inviável, pois as pessoas
responsáveis pelas aprovações tem que ficar entrando em cada processo para ver qual é o desejável para liberação(caso específico na liberação de pagamentos).
- Resolução da Pendência Nº 13889
  > Tela\Opçao No Sistema: RADG
  Ao amostrar o processo só que quando seleciono dá uma mensagem de erro.
- Resolução da Pendência Nº 7254
  > Tela\Opçao No Sistema: RAD \ Etapas Pendentes
  Incluir tela padrão de filtragem para seleção dos etapas pendentes;
Padrão 5.06.10
Solic. Aline
================================================================================
CM$VER      3.01.00     06/05/2003
--------------------------------------------------------------------------------
- Alteração na tela de Acompanhamento de Processo incluindo um botão para anexar imagens ao processo.
================================================================================
CM$VER      3.00.08     22/04/2003
--------------------------------------------------------------------------------
- A tela de filtragem do cadastro de Etapas x Grupo de Autorização não estava filtrando corretamente por Grupo de Autorização.
- Na tela de consulta de Processos Pendentes estava mostrando processos excluídos (FLGOK = 'E').
================================================================================
CM$VER      3.00.07     21/03/2003
--------------------------------------------------------------------------------
- Inserção de tela de pesquisa nas telas de Execução de Etapas, Etapas Pendentes e Processos Pendentes;
- Criação de opção de "Excluir" (FLGOK = "E") um processo sem etapas concluídas.
================================================================================
CM$VER      3.00.06     27/02/2003
--------------------------------------------------------------------------------
- Correção da tela de pesquisa do cadastro de etapas x grupo de processo, que faltavam descrições.
================================================================================
CM$VER      3.00.05     19/02/2003
--------------------------------------------------------------------------------
- Inclusão de tela de consulta de processos por usuário e grupos.
================================================================================
CM$VER      3.00.04     29/01/2003
--------------------------------------------------------------------------------
- Conversão para 3 camadas.
================================================================================
CM$VER      3.00.03     17/12/2002
--------------------------------------------------------------------------------
- Incluído o log de operação nos cadastros.
================================================================================
CM$VER      3.00.02     04/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6916
  > Tela\Opçao No Sistema: Consulta\ Relatórios\  Operacionais\ Acompanhamento de Processos
  Ao tentar emitir o relatório , informando o Tipo de Processo e marcando a opção de TODOS, está ocorrendo a mensagem de erro. Quando emito pela opção de processos pendentes ou processos em atraso, não ocorre o erro.
Padrão: 5.05.30/ 5.06.03
Solic. Aline
================================================================================
CM$VER      3.00.01     28/08/2001
--------------------------------------------------------------------------------
- Incluida a opção de Consulta Gerênciamento de Processos
================================================================================
CM$VER      3.00.00     19/04/2001
--------------------------------------------------------------------------------
- Liberação da Versão em Delphi 5.0
================================================================================
CM$VER      2.03.00     16/10/2000
--------------------------------------------------------------------------------
- Criado o Grupo de Processos
- Criado restrições quanto a geração de Processos :
      * Restrição Centro de Custo
      * Restrição Centro de Responsabilidade
      * Restrição Grupo de Produtos
      * Restrição Atividade e Projeto
      * Restrição Valor
================================================================================
CM$VER      2.02.00     03/10/2000
--------------------------------------------------------------------------------
- Implementado Nº de Ordem de sequencia de autorização, no cadastro de grupo
  de Autorização.
================================================================================
CM$VER      2.01.01     08/09/2000
--------------------------------------------------------------------------------
- Acerto na tela de Etapa x Grupo de Autorização. Devido ao tamnaho da coluna
 da descrição do nome do grupo.
================================================================================
CM$VER      2.01.00     05/09/2000
--------------------------------------------------------------------------------
- Cadastro de Etapa x Grupo de Autorização - implementado a opção selecionar todos
- Aumentar o campo Descrição do cadastro de Grupo de Autorização para 60 caracteres
================================================================================
CM$VER      2.00.19     14/08/2000
--------------------------------------------------------------------------------
- Implementeda a restrição de grau do grupo de produto no tipo de processo.
================================================================================
CM$VER      2.00.18     07/08/2000
--------------------------------------------------------------------------------
- Alterada a ordem de mostrar as etapas a serem executadas para ordem de número 
  do processo.
================================================================================
CM$VER      2.00.17     23/03/2000
--------------------------------------------------------------------------------
- Acertada a consulta de etapas pendentes
================================================================================
CM$VER      2.00.16     15/03/2000
--------------------------------------------------------------------------------
- Ajustes diversos
- Calculo de dias úteis na execução do processo
================================================================================
CM$VER      2.00.15     21/02/2000
--------------------------------------------------------------------------------
- Alterado o cálculo da data de témino previsto quando o tipo da etapa de retorno.
================================================================================
CM$VER      2.00.14     15/02/2000
--------------------------------------------------------------------------------
- Alterador tela de Cadastro de Tipo de Processo, colocado refência.
================================================================================
CM$VER      2.00.13     14/02/2000
--------------------------------------------------------------------------------
- Implementado Grupo para Criação de Processo, no cadastro de Tipo de proces
  so, sendo necessário o cadastramento do mesmo nos grupos já existentes para
  que se possa instaciar, "criar" um Tipo de Processo. 
================================================================================
CM$VER      2.00.12     12/01/2000
--------------------------------------------------------------------------------
- Acertada a gravação do centro de responsabilidade na criação de um processo.
================================================================================
CM$VER      2.00.11     07/01/2000
--------------------------------------------------------------------------------
- Acertado Access na tela de execucao de etapas.
================================================================================
CM$VER      2.00.10     27/12/1999
--------------------------------------------------------------------------------
- Acertada a formação da data de fim previsto das etapas.
================================================================================
CM$VER      2.00.09     22/12/1999
--------------------------------------------------------------------------------
- Corrigido a vizualização das telas referentes a Etapa na Execução da Etapa
================================================================================
CM$VER      2.00.08     22/12/1999
--------------------------------------------------------------------------------
- Removido o DataModule das qry's referentes aos Objetos RAD (I).
================================================================================
CM$VER      2.00.07     20/12/1999
--------------------------------------------------------------------------------
- Implementado a vizualização do Documento da Pessoa referente ao processo.
================================================================================
CM$VER      2.00.06     17/12/1999
--------------------------------------------------------------------------------
-  Alteração no Calculo da data prevista  de término das etapas
================================================================================
CM$VER      2.00.05     13/12/1999
--------------------------------------------------------------------------------
- Alteração na Tela Consulta Processo 
   * Indição da Pessoa do processo
   * Ordenação  das Etapa por Data de Início e 
- Alteração na Tela Geração do Processo, associando a pessoa do processo
- Alteração na Finalização da Etapa, indicando a pessoa do processo
================================================================================
CM$VER      2.00.04     26/11/1999
--------------------------------------------------------------------------------
- IMPLEMENTADO
     * Observação padrão para o Tipo de Processo
     * Relatório de Acompanhamento de Processo
     * Relatório de Fluxo dos Processos
     * Relatório de Informações dos Processos
     * Relatório de Grupo de Responsabilidade
     * Relatório de Grupo de Autorização
     * Relatório de Tipo de Etapa
     * Consulta de Gerenciamento de Processos
     * Consulta de Gerenciamento de Execução de Etapas
================================================================================
CM$VER      2.00.03     16/11/1999
--------------------------------------------------------------------------------
- Acertado o controle de autorização por valor, centro de custo, centro de responsabilidade 
  e grupo de produtos.
================================================================================
CM$VER      2.00.02     12/11/1999
--------------------------------------------------------------------------------
- Versão especialmente gerada para C.B.S.
================================================================================
CM$VER      2.00.01     10/11/1999
--------------------------------------------------------------------------------
- Aumentado o tamanho da descrições de Tipo de processo e tipo de Etapa
================================================================================
CM$VER      2.00.00     25/10/1999
--------------------------------------------------------------------------------
- Primeira versão
================================================================================
CM$ALT}











































































































































































