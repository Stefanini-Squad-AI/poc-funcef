program InterfacePrev;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  FParamCCP in 'FParamCCP.pas' {frmParamCCP},
  UCCP in 'UCCP.pas',
  FCtrlInterface in 'FCtrlInterface.pas' {frmCtrlInterface},
  UFuncoesCCP in 'UFuncoesCCP.pas',
  UFuncoesUteis in 'UFuncoesUteis.pas',
  FConsTmpdesc in 'FConsTmpdesc.pas' {frmConsTmpdesc},
  UAdmPrev in 'UAdmPrev.pas',
  DAPrev in 'DAPrev.pas' {dtmAPrev: TDataModule},
  UMascaras in 'UMascaras.pas',
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FConsultar in '..\..\Cm\Forms\Source\FConsultar.pas' {frmConsultar},
  UModulo in 'UModulo.pas',
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  dRelatorios in 'dRelatorios.pas' {dtmRelatorios: TDataModule},
  DInterface in 'DInterface.pas' {dtmInterface: TDataModule},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  UInterface in 'UInterface.pas',
  FSeparaArq in 'FSeparaArq.pas' {frmSeparaArq},
  DContribInterf in 'DContribInterf.pas' {dtmContribInterf: TDataModule},
  FCadInterfacePatro in 'FCadInterfacePatro.pas' {frmCadInterfacePatro},
  UContribInterf in 'UContribInterf.pas',
  FImportaDadosCadastrais in 'FImportaDadosCadastrais.pas' {frmImportaDadosCadastrais},
  FCadLayOutRecebimentoPatro in 'FCadLayOutRecebimentoPatro.pas' {frmCadLayOutRecebimentoPatro},
  fInterfaceEnvio in 'fInterfaceEnvio.pas' {frmInterfaceEnvio},
  fCadRubricasCompoeSalarios in 'fcadrubricascompoesalarios.pas' {FrmRubricasCompoeSalarios},
  FGravaTxt in 'FGravaTxt.pas' {frmGravaTxt},
  FHistSalPartic in 'FHistSalPartic.pas' {FrmHistSalPartic},
  fAguardeEnvioRec in 'fAguardeEnvioRec.pas' {frmAguardeEnvioRec},
  FParamRelEvSalPart in 'FParamRelEvSalPart.pas' {frmParamRelEvSalPart},
  FParamRelResEnvio in 'FParamRelResEnvio.pas' {frmParamRelResEnvio},
  FParamRelResRecebimento in 'FParamRelResRecebimento.pas' {frmParamRelResRecebimento},
  FParamRelResRubRec in 'FParamRelResRubRec.pas' {frmParamRelResRubRec},
  FAssocProvPatro in 'FAssocProvPatro.pas' {frmAssocProvPatro},
  FLerCodProvento in 'flercodprovento.pas' {frmLerCodProvento},
  FCadArquivoInterface in 'fcadarquivointerface.pas' {frmCadArquivoInterface},
  FTelaAuxRegra in 'ftelaauxregra.pas' {frmTelaAuxRegra},
  FCamposBanco in 'fcamposbanco.pas' {frmCamposBanco},
  FConsCriticasCcp1 in 'FConsCriticasCcp1.pas' {frmConsCriticasCcp},
  UTabCriticasCcp in 'UTabCriticasCcp.pas',
  FParamRelInterfaceEnvio in 'FParamRelInterfaceEnvio.pas' {frmParamRelInterfaceEnvio},
  DmRelAugusto in 'DmRelAugusto.pas' {DtMRelAugusto},
  FPRelTmpContribAnalit in 'FPRelTmpContribAnalit.pas' {frmPRelTmpContribAnalit},
  FPRelRubricasNEncontradas in 'FPRelRubricasNEncontradas.pas' {frmRubricasNEncontradas},
  FCriticaArqFinanc in 'FCriticaArqFinanc.pas' {frmCriticaArqFinanc},
  FVerificaMenuSAD in 'FVerificaMenuSAD.pas' {frmVerificaMenuSAD},
  FGeraArqSERPROS in 'FGeraArqSERPROS.pas' {frmGeraArqSERPROS},
  FGeraEstatisticas in 'FGeraEstatisticas.pas' {FrmGeraEstatisticas},
  FGeraArqSPC in 'fgeraarqspc.pas' {FrmGeraArqSPC},
  FEstatisticaSPCNOVO in 'FEstatisticaSPCNOVO.pas' {frmEstatisticaSPCNOVO},
  FEscolhaFundacao in 'FEscolhaFundacao.pas' {frmEscolhaFundacao},
  FParamRelEstSPC in 'FParamRelEstSPC.pas' {frmParamRelEstSPC},
  FCadProvento in 'FCadProvento.pas' {FrmCadProvento},
  FPRelCriticaCadSintet in 'FPRelCriticaCadSintet.pas' {frmPRelCriticaCadSintet},
  FCadInterfAtuarial in 'FCadInterfAtuarial.pas' {frmCadInterfAtuarial},
  FProcCadInterfAtuarial in 'FProcCadInterfAtuarial.pas' {frmProcCadInterfAtuarial},
  FCadOpEnvioContribPatro in 'FCadOpEnvioContribPatro.pas' {frmCadOpEnvioContribPatro},
  FPRelRubReceb in 'FPRelRubReceb.pas' {frmPRelRubReceb},
  FPRelResumoRubricas in 'FPRelResumoRubricas.pas' {frmPRelResumoRubricas},
  uSincronismo in 'uSincronismo.pas',
  UVerificaPreenchimento in 'UVerificaPreenchimento.pas',
  FSolicitaPlano in 'FSolicitaPlano.pas' {frmSolicitaPlano},
  FParamRelResImp in 'FParamRelResImp.pas' {frmParamRelResImp},
  FCadEnvioPatro in 'fCadEnvioPatro.pas' {frmCadEnvioPatro},
  FTrataArq in 'FTrataArq.pas' {frmTrataArq},
  uCtrlImportaFinanc in '..\CtrlObjetos\uCtrlImportaFinanc.pas',
  uDbTaberrosccp in '..\DbObjetos\uDbTaberrosccp.pas',
  uDbClasserubricas in '..\DbObjetos\uDbClasserubricas.pas',
  uDbRubricaxpess in '..\DbObjetos\uDbRubricaxpess.pas',
  uDbPlanprev in '..\DbObjetos\uDbPlanprev.pas',
  uDbPatro in '..\DbObjetos\uDbPatro.pas',
  uDbPartprevplan in '..\DbObjetos\uDbPartprevplan.pas',
  uDbParamsal13 in '..\DbObjetos\uDbParamsal13.pas',
  uDbParaminterf in '..\DbObjetos\uDbParaminterf.pas',
  uDbNfafaturarhotel in '..\DbObjetos\uDbNfafaturarhotel.pas',
  uDbHstrubricaxpess in '..\DbObjetos\uDbHstrubricaxpess.pas',
  uDbHistrubsal in '..\DbObjetos\uDbHistrubsal.pas',
  uDbElegpatro in '..\DbObjetos\uDbElegpatro.pas',
  uDbCtrlinterface in '..\DbObjetos\uDbCtrlinterface.pas',
  uDbContribprevpartp in '..\DbObjetos\uDbContribprevpartp.pas',
  uDbTmpdesc in '..\DbObjetos\uDbTmpdesc.pas',
  FGravaTxtMT in '..\FontesMT\FGravaTxtMT.pas' {frmGravaTxtMT},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FConsLogTotalPREV in 'FConsLogTotalPREV.pas' {frmConsLogTotalPREV};

//DmRelSpc in 'DmRelSpc.pas' {DtMRelAugusto};

{$R *.RES}
{$R INTERFACEPREV_RES.RES}
                  
begin
  sTipoPrevidencia := 'F';

  frmcmEntrada:= TfrmcmEntrada.Create(Application);
  frmcmEntrada.Show;
  frmcmEntrada.Update;

  Application.Initialize;
  Application.Title := 'Interface';
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmInterface, dtmInterface);
  Application.CreateForm(TdtmContribInterf, dtmContribInterf);
  Application.CreateForm(TfrmAguardeEnvioRec, frmAguardeEnvioRec);
  Application.CreateForm(TDtMRelAugusto, DtMRelAugusto);
  frmcmEntrada.Hide;
  frmcmEntrada.Free;


  Application.Run;


end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Interface com Instituições Previdenciárias
================================================================================
CM$VER      3.05.04d    23/06/2008
--------------------------------------------------------------------------------
- Pendência  : 28198
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Retirando ',' a mais do Update.
================================================================================
CM$VER      3.05.04c    19/06/2008
--------------------------------------------------------------------------------
- Pendência  : 28046
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Colocando update para marcar corretamente o flag flgcontapref.
================================================================================
CM$VER      3.05.04b    14/03/2008
--------------------------------------------------------------------------------
- Pendência  : 27282
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Importação de contas-correntes para mantidos parciais também
================================================================================
CM$VER      3.05.04a    18/01/2008
--------------------------------------------------------------------------------
- Pendência  : 27251
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Rubricas Financeiras
  Descrição  : Durante a importação pegar o Mês Referencia correto quand for abono.
================================================================================
CM$VER      3.05.04     09/11/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.18
- Resolução da Pendência 22108
  Tela/Opção no Sistema: Todas as Telas que possuem datas
  Descrição  : Formatando as datas de todo o sistema para o formato dd/mm/yyyy.
- Pendência  : 26404
  Tela/Opção : Parametros do Sistema
  Descrição  : Retirado dados de tipocliente e Ramo
- Pendência  : 25266
  Tela/Opção : Relatórios | Estatística SPC
  Descrição  : Ajuste para trazer todos os códigos, mesmo com quantidades zeradas
- Pendência  : 26396
  Tela/Opção : Patrocinadora | Envio para Patrocinadora
  Descrição  : Permitir o envio da rubrica informativa referentes a saldo de empréstimo.
================================================================================
CM$VER      3.05.02c    31/10/2007
--------------------------------------------------------------------------------
- Pendência  : 26574
  Tela/Opção : Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Acerto para não importar telefone já cadastro na base para a mesma pessoa.
================================================================================
CM$VER      3.05.02b    11/09/2007
--------------------------------------------------------------------------------
- Pendência  : 26251
  Tela/Opção : Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Atualizar IDGRUPO no cadastro de filiais  
- Pendência  : 26300
  Tela/Opção : Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Atualizar IDGRUPO no cadastro de filiais  
================================================================================
CM$VER      3.05.02a    10/09/2007
--------------------------------------------------------------------------------
- Pendência  : 26316
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Rubricas Financeiras
  Descrição  : Correção na consideração da formatação da variavel MES apenas como 'MM'.
================================================================================
CM$VER      3.05.02     09/08/2007
--------------------------------------------------------------------------------
Versão para liberação do padrão 5.10.17.
================================================================================
CM$VER      3.05.00b    10/07/2007
--------------------------------------------------------------------------------
- Pendência  : 25253
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Rubricas Financeiras
  Descrição  : Alteração na consulta que busca o participante a ser importando
               retirando a crítica que proibia de importar participantes demitidos.
================================================================================
CM$VER      3.05.00a    10/07/2007
--------------------------------------------------------------------------------
- Pendência  : 25790
  Tela/Opção : Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Acerto na importação de endereço, quando a cidade é incluída pela tela do Global. Nestes casos, o campo CODESTADO no registro da Cidade fica nulo, pois não é mais usado. A importação cadastral está verificando agora o CodEstado da tabela Estado a qual a Cidade está vinculada.
================================================================================
CM$VER      3.05.00     22/06/2007
--------------------------------------------------------------------------------
Versão para liberação do padrão 5.10.16.
================================================================================
CM$VER      3.04.11c    22/06/2007
--------------------------------------------------------------------------------
- Pendência  : 25630
  Tela/Opção : Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Acerto para inserir registro de cargo já fechado, ou seja, com data início e data final.
================================================================================
CM$VER      3.04.11b    21/05/2007
--------------------------------------------------------------------------------
- Pendência  : 25223
  Tela/Opção : Recebimento da Patrocinadora | Dados Cadastrais
  Descrição  : Ajuste no processo para determinação de reinscrição
================================================================================
CM$VER      3.04.11a    07/05/2007
--------------------------------------------------------------------------------
- Pendência  : 25266
  Tela/Opção : Relatórios | Estatística SPC
  Descrição  : Ajuste na query para trazer códigos com quantidade diferente de zero (estava maior que zero)
================================================================================
CM$VER      3.04.11     26/03/2007
--------------------------------------------------------------------------------
Liberação de versão do padrão 5.10.15.
================================================================================
CM$VER      3.04.10b    13/03/2007
--------------------------------------------------------------------------------
- Pendência  : 23646 (retrabalho)
  Tela/Opção : SPC | Gera arquivo para SPC
  Descrição  : Correção da geração de planilhas com mais de 65536 linhas
================================================================================
CM$VER      3.04.10a    05/03/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 24421
  Tela: Patrocinadora | Recebimento da Patrocinadora | Rubricas Financeiras
  Alteração: Alteração na gravação da tabela da CLASSERUBRICAS buscando primeiro
             o registro existente na TMPDESC.
================================================================================
CM$VER      3.04.10     26/02/2007
--------------------------------------------------------------------------------
*
* LIBERAÇÃO DO PADRÃO 14
*
- Resolução da Pendência Nº 24560
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto na inserção de dados cadastrais relativos a registros de
             insalubridade.
- Resolução da Pendência Nº 24561
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto na atulização de dados cadastrais relativos ao campo de
             Data Inicial.
- Resolução da Pendência Nº 24557
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto na consulta para ordenar corretamente as inscrições do
             participante e suas respectivas situações.
- Pendência  : 24503
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Rubricas financeiras
  Descrição  : Correção na consulta de 13º para não fazer referência ao campo MESREFERENCIA.
- Pendência Nº 24429
 Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
 Alteração: Quando importar o registro referente a Adicional de Tempo de Serviço,
            não pesquisar o cargo.
- Pendência  : 23996
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Rubricas financeiras
  Descrição  : Correção na rotina de cálculo de salário de participação de 13º.
- Pendência  : 22827 e 22828
  Tela/Opção : Patrocinadora | Recebimento da Patrocinadora | Rubricas Financeiras
  Descrição  : (1) Nunca atualizar o valor enviado (na TmpDesc) se o mesmo for de Empréstimo
               (2) Implementada busca pelo valor exato para caso de mais de um item enviado pelo Empréstimo
- Pendência  : 22829
  Tela/Opção : Patrocinadora | Envio para Patrocinadora
  Descrição  : Na lista de seleção, item alterado de "Contibuições de Empréstimo" para "Prestações de Empréstimo"
================================================================================
CM$VER      3.04.09a    01/12/2006
--------------------------------------------------------------------------------
- Pendência  : 23646
  Tela/Opção : SPC | Gera arquivo para SPC
  Descrição  : Correção da geração de planilhas com mais de 65536 linhas
================================================================================
CM$VER      3.04.09     21/11/2006
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.13
================================================================================
CM$VER      3.04.08     14/09/2006
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.12
================================================================================
CM$VER      3.04.07c    24/08/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22064
 Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
 Alteração: Alterar o diretório inicial quando já estiver parametrizado
             uma pasta default.
================================================================================
CM$VER      3.04.07b    18/08/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22915
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto para não alterar a datafinal do cargo atual.
================================================================================
CM$VER      3.04.07a    15/08/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22832
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto para não apagar a função efetiva ao inserir a facultativa.
================================================================================
CM$VER      3.04.07     28/07/2006
--------------------------------------------------------------------------------
Versão para liberação padrão 5.10.11
================================================================================
CM$VER      3.04.06     12/07/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.10.
-Resolução da Pendência Nº 22064
  Tela: Sistema | Configuração | Parâmetros do sistema
        Patrocinadora | Recebimento da patrocinadora | Rubricas Financeiras
        Patrocinadora | Envio para patrocinadora
  Alteração: Implementação de rotina para parametrizar o local onde o sistema pode ler 
             os arquivos a serem importados / enviados.
-Resolução da Pendência Nº 22454
 Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
 Alteração: Acerto para alterar a conta bancária dos participantes.
================================================================================
CM$VER      3.04.05g    07/07/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22748  (Reabertura)
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto para não atualizar no banco a datafinal do registro do cargo anterior, quando o mesmo estiver sendo processado.
================================================================================
CM$VER      3.04.05f    05/07/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22748
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto para não atualizar no banco a datafinal do registro do cargo anterior, quando o mesmo estiver sendo processado.
================================================================================
CM$VER      3.04.05e    03/07/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22336 (Reabertura)
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Implementação para tratar o cargo anterior.
================================================================================
CM$VER      3.04.05d    27/06/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22706
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Coloquei uma crítica para a execução da query que busca registro anterior e posterior ao cargo anterior.
================================================================================
CM$VER      3.04.05c    19/06/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22336
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Implementação para tratar o cargo anterior.
-Resolução da Pendência Nº 22569
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto para gravar a nova situação na fundação e a nova situação no plano previdenciário.  
================================================================================
CM$VER      3.04.05b    24/05/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22442
  Tela: Patrocinadora | Recebimento da Patrocinadora | Rubricas Financeiras
  Alteração: Acerto na rotina de gravação de erros.
================================================================================
CM$VER      3.04.05a    12/05/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 21722
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Atualizar o campo razão social quando alterar o campo nome.
================================================================================
CM$VER      3.04.05     10/05/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.09.
================================================================================
CM$VER      3.04.04f    10/05/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22295
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Acerto na query que busca os registros existentes no banco de dados.
================================================================================
CM$VER      3.04.04e    03/05/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22107
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Permitir inclusão/alteração de uma função já finalizada.
-Resolução da Pendência Nº 22109
  Tela: Patrocinadora | Recebimento da Patrocinadora | Dados Cadastrais
  Alteração: Incluir a nova função efetiva mesmo que seja igual a função efetiva atual, atualizando a data final da atual com a data do arquivo.
================================================================================
CM$VER      3.04.04d    02/05/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 22179
  Tela: Interface de Envio para a Patrocinadora
  Alteração: Alteração para considerar o parâmetro 'É VALOR' na geração do arquivo.
================================================================================
CM$VER      3.04.04c    03/04/2006
--------------------------------------------------------------------------------
  Tela: Importar arquivo financeiro
  Alteração: Alteração do nome da função de CopiaDataSet para CopiaData
================================================================================
CM$VER      3.04.04b    03/04/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 20733
  Tela: Importação cadastral
  Alteração: Bloqueio na alteração de eventos quando importados pelo Interface.
-Resolução da Pendência Nº 21031
  Tela: Importação cadastral
  Alteração: Tratamento da data de readmissão na importação.
-Resolução da Pendência Nº 18983
  Tela: Importação financeira
  Alteração: Montagem dinâmica do arquivo de schema.
================================================================================
CM$VER      3.04.04a    15/03/2006
--------------------------------------------------------------------------------
-Resolução da Pendência Nº 21713
  Tela: Importação cadastral
  Alteração: Implementação da importação de DDD dos telefones das filiais.
-Resolução da Pendência Nº 21655
  Tela: Importação Financeira
  Alteração: Acerto na verificação da última rubrica importada.
-Resolução da Pendência Nº 21627
  Tela: Importação cadastral
  Alteração: Acerto na importação de eventos para evitar duplicação.
-Resolução da Pendência Nº 21588
  Tela: Importação cadastral
  Alteração:  Acerto na inscrição automática para associação das reservas.
-Resolução da Pendência Nº 17307
  Tela: Importação cadastral
  Alteração: Acerto na atualização dos campos.
================================================================================
CM$VER      3.04.04     20/12/2005
--------------------------------------------------------------------------------
Resolução da Pendência Nº 21082
  Tela: Conjunto de Rubricas
  Alteração: Criação da nova estrutura.
================================================================================
CM$VER      3.04.03     15/12/2005
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.08.
================================================================================
CM$VER      3.04.02c    06/12/2005
--------------------------------------------------------------------------------
Resolução da Pendência Nº 20785
  Tela: Importação Cadastral, Importação Financeira, Relatório do SPC, Consulta de Operações
  Alteração: Gravação e consulta do log de operações.
Resolução da Pendência Nº 20662
  Tela: Importação Cadastral
  Alteração: Na gravação do adicional por tempo de serviço, sempre prevalecer a última informação mesmo que a data de inicio seja anterior a última do sistema.
Resolução da Pendência Nº 20664
  Tela: Importação Cadastral
  Alteração: Na gravação do adicional por tempo de serviço, criar histórico de informações, não sobrepor a informação atual.
Resolução da Pendência Nº 20665
  Tela: Importação Cadastral
  Alteração: Modificação para não permitir duplicação de cargos e funções.
Resolução da Pendência Nº 20765
  Tela: Importação Cadastral
  Alteração: Acerto na gravação do log de críticas na importação cadastral.
================================================================================
CM$VER      3.04.02b    09/11/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.19396
  Tela: Importação de Rubricas Financeiras
  Alteração: Correção de erro na hora da segunda chamada do relatório.
================================================================================
CM$VER      3.04.02a    13/09/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.18996
  Tela: Importação cadastral
  Gravação e alteração de registros no histórico funcional na importação de elegíveis.
Resolução da Pendência No.13307
  Tela:  Importação cadastral
  Alteração na gravação das informações de data de demissão, afastamento e situação funcional.
Resolução da Pendência No.19924
  Tela:  Importação cadastral
  Inclusão de registros nas tabelas de denpendentes na inserção de elegíveis.
Resolução da Pendência No.20597
  Tela:  Importação financeira
  Modificação da alteração dos registros enviados pelo empréstimo, atualizando apenas aqueles enviados para a Folha da Patrocinadora.
Resolução da Pendência No.20449
  Tela:  Importação financeira
  Inclusão do tratamento de data final de filiais, indicando a inatividade.
Resolução da Pendência : 20160
Tela\Opçao No Sistema  : Importação cadastral
Descrição              : Acerto da importação para impedir duplicação de cargos e funções
================================================================================
CM$VER      3.04.02     05/09/2005
--------------------------------------------------------------------------------
Resolução da Pendência : 18982
Tela\Opçao No Sistema  : Importaçao de Rubricas Financeiras
Descrição              : Implementação para possibilitar recomeçar a importação do ponto em que parou.
================================================================================
CM$VER      3.04.01a    09/08/2005
--------------------------------------------------------------------------------
Resolução da Pendência : 19924
Tela\Opçao No Sistema  : Patrocinadora | Recebimento da Patrocinadora | Importação de Dados Cadastrais
Descrição              : Acerto para corrigiruma diferença entre as Tabelas Elegpatro e Depentit, onde
                         diversos associados estão presentes na Elegpatro e não estão presentes na Depentit.
Resolução da Pendência : 19444
Tela\Opçao No Sistema  : (Inconsistencia de dados)
Descrição              :  O campo FLGCOBRA (Tabela CONTRIBPREVPARTP) foi mudado de FLGCOBRA =1 para FLGCOBRA = 0 para facultativos
                          alterando a situação dos mesmos para: cobrança de contribuição suspensa.
Resolução da Pendência : 19698
Tela\Opçao No Sistema  : Importação Financeira
Descrição              : Verificar mudança do valor do campo CONTRIBPREVPARTP.FLGCOBRA para participantes autopatrocinados.
                         Correçao para que após a importação o campo não fique com o valor zero(0).
Resolução da Pendência : 19809
Tela\Opçao No Sistema  : Importação de Dados Cadastrais
Descrição              : Inclusão do campo IDSITFUNC nas criticas do InterfacePrev, facilitando assim a pesquisa feita pelo usuário.
Resolução da Pendência : 19823
Tela\Opçao No Sistema  : Importação de Dados Cadastrais
Descrição              : Inclusão do campo IDSITFUNC nas criticas do InterfacePrev, facilitando assim a pesquisa feita pelo usuário.
================================================================================
CM$VER      3.04.01     14/06/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.19375
Tela: Recebimento de Rubricas Financeiras
  Abrindo a consulta de registros recebidos para o caso de encontrar apenas uma rubrica de 
empréstimo do participante.
Resolução da Pendência No.18675
Tela: Importação Cadastral
      Realizar inscrições automáticas para participantes que já se encontram cancelados
      em outro plano.
Resolução da Pendência No.18414
Tela: Importação Financeira
      Marcação do FLGEQUIPARACAO na HISTRUBSAL.
Resolução da Pendência No.19383
Tela: Importação Financeira
      Várias rubricas de margem de empréstimo, informadas como negativas no arquivo de origem, entraram com valores positivos.
Pendência: 18419
Tela: Importação de Rubricas Financeiras
Descrição: Melhorada a crítica para ao invés de aparecer a mensagem "Contribuição não lida. Possível duplicação.", para "Rubrica não associada".
Pendência: 19186
Tela: Importação cadastral
Descrição: Por favor, considerar a UF das unidades operacionais para a atualização de seus Endereços.
Pendência: 17642
Tela: Importação cadastral
Descrição: Favor verificar se o InterfacePrev está atualizando o FLGDIRETOR. Segundo o Sydney, que verificou no SisRh, as matrículas abaixo, são Diretor/ExDiretor
Pendência: 18338
Tela: Relatório do SPC
Descrição: Análise e possível correção de diferença nos valores de entradas de regates no mês de Novembro/2004.
Pendência: 18340
Tela: Importação cadastral
Descrição: Análise e correção de diferenças no percentual de contribuições informado pela Caixa em Outubro/2004.
Pendência: 18516
Tela: Importação cadastral
Descrição: Verificar o motivo da não inscrição automática dos participantes informados no arquivo de dezembro/2004
Pendência: 18563
Tela: Importação cadastral
Descrição: Erro no processo da importação de endereços "quotes string not properly terminated".
Pendência: 18564
Tela: Importação financeira
Descrição: A importação estava alterando o valor enviado em vista do valor recebido. O valor enviado deve ser mantido.
Pendência: 18567
Tela: Relatório do SPC
Descrição: O relatório apresenta a entrada de 22 pecúlios, diferente da quantidade de rubricas que é 27. O relatório apresenta a entrada de 30 resgates com custeio patronal, diferente da quantidade informada pela Gepac de 32.
Pendência: 18618
Tela: Importação cadastral
Descrição: Ocorre o erro "quoted string not properly ended" no processo
Pendência: 18676
Tela: Importação Cadastral
Descrição: Casos de participantes com funções e cargos duplicados. Casos também de funções temporárias registradas como efetivas. Ex: 00113221
Pendência: 18681
Tela: Importação Cadastral
Descrição: A importação não atualizou a data final da função da matrícula 0190710.
Pendência: 18713
Tela: Relatório do SPC
Descrição: Favor verificar a conta 84100 designado de participante pois no arquivo analítico da SPC constam 199 matrículas concedidas sendo que no relatório do Módulo INTERFACE estão sendo gerados com 189 matrículas concedidas.
Pendência: 18714
Tela: Relatório do SPC
Descrição: Na conta 84200 designado de assistido no arquivo analítico constam 104 matrículas concedidas enquanto que no relatório 91 matrículas concedidas. Favor verificar e me informar.
Pendência: 18715
Tela: Relatório do SPC
Descrição: Favor verificar a conta 21100 de pensão - origem participante pois o arquivo analítico que segue abaixo, constam 4 matrículas canceladas, sendo que no relatório do Módulo INTERFACE estão sendo gerados com 3 matrículas canceladas.
Pendência: 18716
Tela: Relatório do SPC
Descrição: A conta 81500 participante ¿ no prazo de opção ainda não foi incluída, no referido relatório, favor incluir.
Pendência: 17741
Tela: Importação Cadastral
Descrição: Acerto na duplicação na importação de dependentes.
================================================================================
CM$VER      3.03.01z    13/06/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.19375
Tela: Recebimento de Rubricas Financeiras
  Abrindo a consulta de registros recebidos para o caso de encontrar apenas uma rubrica de
empréstimo do participante.
================================================================================
CM$VER      3.03.01x    03/05/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.19155
Tela: Patrocinadora \ Envio para Patrocinadora
Acerto no campo valor.
================================================================================
CM$VER      3.03.01v    20/04/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.19051
Tela: Patrocinadora \ Envio para Patrocinadora
Filtrar na query principal somente os registros com o sitenvio diferente de 9, ou seja, já recebido.
  
================================================================================
CM$VER      3.03.01u    29/03/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.18701
Tela: Patrocinadora | Envio para Patrocinadora
  Criação da rotina para completar campo numérico com brancos à esquerda caso o parâmetro seja escolhido.
Resolução da Pendência No.17858
Tela: Patrocinadora | Envio para Patrocinadora
  Separação da rotina de Incritos da de Desligados
================================================================================
CM$VER      3.03.01t    04/03/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.17506 (Reabertura)
Tela: Recebimento de Rubricas Financeiras
  Permitir o recebimento dos demitidos no mês que está sendo processado ou no mês anterior
================================================================================
CM$VER      3.03.01s    10/02/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.18642
Tela: Patrocinadora | Recebimento da Patrocinadora | Rubricas Finanaceiras | Desfazer Recebimento
  Acerto na rotina de Desfazer Recebimento.
================================================================================
CM$VER      3.03.01r    13/01/2005
--------------------------------------------------------------------------------
Resolução da Pendência No.18473
Tela: Patrocinadora|Recebimento da Patrocinadora|Rubricas Finanaceiras
  Acerto no botão do relatório.
================================================================================
CM$VER      3.03.01q    13/12/2004
--------------------------------------------------------------------------------
Resolução da Pendência No.17904
Tela: Estatísticas para Secretaria de Previdência Complementar ( SPC )
  Retirada do filtro de data final na consulta que Verifica Benefícios Concedidos e Cancelados no mês
para poder pegar um beneficio cancelado com data retroativa.
================================================================================
CM$VER      3.03.01p    01/10/2004
--------------------------------------------------------------------------------
Resolução da Pendência No.17818
  Tela: Recebimento de Rubricas Financeiras
  Acerto no desmembramento de rubricas externas que possuem várias rubricas internas
  associadas
================================================================================
CM$VER      3.03.01o    01/09/2004
--------------------------------------------------------------------------------
Resolução da Pendência No.17442
  Tela: Recebimento de Rubricas Financeiras
  Acerto na rotina do desfazer para verificar se a fundação trabalha com o módulo Assistencial ou não.
================================================================================
CM$VER      3.03.01n    31/08/2004
--------------------------------------------------------------------------------
Resolução da Pendência No.17506
  Tela: Recebimento de Rubricas Financeiras
  Permitir o recebimento dos demitidos no mês que está sendo processado ou no mês anterior
================================================================================
CM$VER      3.03.01m    26/08/2004
--------------------------------------------------------------------------------
Resolução da Pendência No.17442
  Tela: Recebimento de Rubricas Financeiras
  Acerto na rotina de contribuições assistenciais e também na rotina do Desfazer Recebimento.
================================================================================
CM$VER      3.03.01l    16/07/2004
--------------------------------------------------------------------------------
Resolução da Pendência No.16787
  Tela: Patrocinadora | Cadastro de lay-Out | Lay-Out de Envio
  Descrição: Apresentação de consulta para formato de matricula
================================================================================
CM$VER      3.03.01j    04/05/2004
--------------------------------------------------------------------------------
- Resolução da Pendencia No.
  Tela : Estatístico para SPC
  Descrição : Acerto na geração COM eventos
================================================================================
CM$VER      3.03.01i    05/04/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 16369
  > Tela\Opçao No Sistema: Cadastro de Lay-out / Lay-out de recebimento
  Novo acerto na query de inserção do detalhe.
================================================================================
CM$VER      3.03.01h    29/03/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 16369
  > Tela\Opçao No Sistema: Cadastro de Lay-out / Lay-out de recebimento
  Acerto na query de inserção do detalhe.
================================================================================
CM$VER      3.03.01g    02/03/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 16159
  > Tela\Opçao No Sistema: Patrocinadora / Recebimento / Rubricas Financeiras
  Incluido rotina para criticar a linha lida para quando retornar nulo ler a próxima.
================================================================================
CM$VER      3.03.01f    19/02/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 16125
  > Tela\Opçao No Sistema: Patrocinadora / Cadastro de Lay-out / Lay-out de envio
  Alteração para incluir o sequence no evento de inserção do registro.
================================================================================
CM$VER      3.03.01e    12/02/2004
--------------------------------------------------------------------------------
- Resolução da Pendência FUNCEF
  > Tela\Opçao No Sistema: Patrocinadora/Recebimento da Patrocinadora/Consulta de Verificação do Arquivo Financeiro
  Criação de Tela de consulta e emissão de relatórios, de total por rubricas, do arquivo para importação financeira.
- Resolução da Pendência Nº 16016
  > Tela\Opçao No Sistema: Patrocinadora/Recebimento da Patrocinadora/Rubricas Financeiras
  Alteração da query de busca de participante para evitar que busque o mesmo participante em duas patrocinadoras - evento de transferência de patro mantendo a mesma matrícula.
================================================================================
CM$VER      3.03.01d    07/01/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14453
  > Tela\Opçao No Sistema: SPC / Gerar Arquivo para SPC
  Considerar no código 81100 os participantes em manutenção parcial
- Resolução da Pendência Nº 14385
  > Tela\Opçao No Sistema: SPC / Gerar Arquivo para SPC
  Considerar no código 84200 apenas os designados que não recebem pensão
================================================================================
CM$VER      3.03.01c    23/12/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15833 (Complemento)
  > Tela\Opçao No Sistema: Patrocinadora / Cadastro de Lay-out / Lay-out de Recebimento
  Acerto no chave do registro de detalhe da tela.
================================================================================
CM$VER      3.03.01b    22/12/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15833
  > Tela\Opçao No Sistema: Patrocinadora / Cadastro de Lay-out / Lay-out de Recebimento
  Correção na rotina de inserção de registro no detalhe para pegar o último sequence da tabela mestre.
================================================================================
CM$VER      3.03.01a    17/12/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15814
  > Tela\Opçao No Sistema: Patrocinadora / Recebimento da Patrocinadora / Rubricas Financeiras
  Acerto para identificação do campo descrito como "CAMPO EM BRANCO" e acerto para 
gravação dos flags de Header e Footer dos arquivos enviados.
================================================================================
CM$VER      3.03.01     04/12/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14841 (Complemento)
  > Tela\Opçao No Sistema: Geração de arquivo de envio para patrocinadora
  Agrupando a query de envio também pelos campos VALORINF e NUMPARCELAS para 
envio de cobranças de empréstimo.
================================================================================
CM$VER      3.03.00c    27/11/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14841
  > Tela\Opçao No Sistema: Geração de arquivo de envio para patrocinadora
  Alterada a query para não ler registros do módulo 32 (InterfacePrev).
- Resolução da Pendência Nº 15157
  > Tela\Opçao No Sistema: Patrocinadora/Recebimento da Patrocinadora/Rubricas Financeira
  Correção na função de erro para ler apenas 30 caracteres do nome da patro (tamanho do campo na tabela).
================================================================================
CM$VER      3.03.00b    19/11/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15655
  > Tela\Opçao No Sistema: Interface de Envio para a Patrocinadora
  Inclusão da rotina de limpar variáveis de regra no cálculo dos valores esperados de contribuição
================================================================================
CM$VER      3.03.00a    14/11/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15637
  > Tela\Opçao No Sistema: Recebimento de Rubricas Financeiras
  Acerto do erro ao Executar o recebimento com a opção de mais de um lay-out.
================================================================================
CM$VER      5.03.00     10/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14952
  > Tela\Opçao No Sistema: Patrocinadora/Cadastro de Lay-out/Lay-out de Recebimento
  Permitir o cadastro de mais de um layout para o recebimento
================================================================================
CM$VER      5.02.02     29/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14841
  > Tela\Opçao No Sistema: Geração de arquivo de envio para patrocinadora
  Pendência refeita para criação de um novo parâmetro para controlar a forma de agrupamento dos
lançamentos de empréstimo numa única linha e colocar na coluna de parcela a maior parcela obtida 
a partir do envio. Este parâmetro anteriormente estava na tela de envio agora se encontra na
tela de parâmetros do sistema.
================================================================================
CM$VER      5.02.01b    18/07/2003
--------------------------------------------------------------------------------
Pendencia 14452 - Estatístico SPC : Retirados os recebedores de pensão do código 84200 e incluídos no código 9100
Pendencia 14453 - Estatístico SPC : Inseridos no somatório do código 81100 eventos de ativo.
Pendencia 14612 - Alteração no Recebimento de Rubricas Finaneiras para, se o parametro de envio for "Não Envia"
                  e for rubrica de atraso/devoução, tentar alterar a tabela temporaria de descontos antes de
                  inserir.
================================================================================
CM$VER      5.02.01     03/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14385
  > Tela\Opçao No Sistema: Estatístico SPC
  No item 84200 devem ser buscados apenas os designados que ainda não recebem pensão
- Resolução da Pendência Nº 14338
  > Tela\Opçao No Sistema: Recebimento 
  O INTERFACE, ao receber algum valor da Patrocinadora e não encontra-lo na TMPDESC, deverá inserir o registro de recebimento na mesma, como já tem feito, porém, o INTERFACE deverá buscar na tabela CONTRATOEMPTMO qual é o número do contrato Ativo dessa pessoa e inserir no campo IDDESCONTO a informação encontrada, caso contrário, não tem como o sistema de
empréstimo reconhecer o valor recebido na tabela de empréstimo (HISTMOVEMPTMO) como recebimento de valores referentes a  empréstimos.
- Resolução da Pendência Nº 14236
  > Tela\Opçao No Sistema: Todas
  Implementar funcionalidades/filtro para contemplar MULTI-FUNDACAO
================================================================================
CM$VER      5.02.00e    30/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14338
  > Tela\Opçao No Sistema: Recebimento 
  O INTERFACE, ao receber algum valor da Patrocinadora e não encontra-lo na TMPDESC, 
deverá inserir o registro de recebimento na mesma, como já tem feito tendo o nº do contrato de 
empréstimo como o IDDESCONTO gravado.
================================================================================
CM$VER      5.02.00d    23/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14269
  > Tela\Opçao No Sistema: GERAR RELATÓRIO ESTATÍSTICO
  Incluir os DEPENDENTES LEGAIS nos itens -84100 e 84200 do relatório estatístico da SPC.
- Resolução da Pendência Nº 14265
  > Tela\Opçao No Sistema: Patrocinadora/Envio para Patrocinadora/Interface de Envio para a Patrocinadora.
  Habilitar o botão de Sair, no rodapé da tela após o término da operação.
- Resolução da Pendência Nº 14262
  > Tela\Opçao No Sistema: Recebimento da Patrocinadora/Rubricas Financeiras
  Acerto no recebimento de rubricas assistenciais.
================================================================================
CM$VER      5.02.00c    18/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14269
  > Tela\Opçao No Sistema: GERAR RELATÓRIO ESTATÍSTICO
  Incluir os DEPENDENTES LEGAIS nos itens -84100 e 84200 do relatório estatístico da SPC.
- Resolução da Pendência Nº 14044
  > Tela\Opçao No Sistema: Recebimento de Rubricas Financeiras
  Desenvolver rotina que registre como mês de referência o mês imediatamente anterior ao do informado no processo de interface, no caso das rubricas de devolução, quando essa informação não vier no arquivo das patrocinadoras.
================================================================================
CM$VER      5.01.07f    22/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11419
  > Tela\Opçao No Sistema: Recebimento do Interface Financeiro
  Implementação da crítica de data válida.
- Resolução da Pendência Nº 12700
  > Tela\Opçao No Sistema: Recebimento do Interface Financeiro
  Correção na associação de contribuições contribuição.
- Resolução da Pendência Nº 13037
  > Tela\Opçao No Sistema: Importação de Rubricas Financeiras
  Implementação para que ao calcular o salário de participação do participante, verifica a existencia 
deste na tabela de Histórico de Rubricas; caso exista apenas altera o existente, não existindo insere 
um registro novo.
================================================================================
CM$VER      5.01.07e    28/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10345
  > Tela\Opçao No Sistema: SPC/Gera Arquivo para SPC
  Verificação dos códigos, pois foram alterados pela SPC e a partir de agosto/2002 tem que seguir o novo padrão.
================================================================================
CM$VER      5.01.07d    20/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13133
  > Tela\Opçao No Sistema: Relatório novo
  Criar relatório de resumo de rubricas importadas no recebimento mensal do arquivo da Patrocinadora, com quantidade, total monetário, código interno, código externo e descrição para cada rubrica importada.
- Resolução da Pendência Nº 13140
  > Tela\Opçao No Sistema: Importação para o histórico de rubricas
  Corrigida a importação da rubrica de emprestimo para o Historico de Rubricas.
- Resolução da Pendência Nº 13141
  > Tela\Opçao No Sistema: Divergência de valores de rubricas
  As contribuições estão apresentando divergência de valores entre a TMPDESC e a HSTCONTRIBPREV.
================================================================================
CM$VER      5.01.07c    17/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13127
  > Tela\Opçao No Sistema: Relatório Rubricas recebidas
  Correção do relatório de "Rubricas Recebidas", que está apresentando divergência em relação ao
arquivo de importação.
================================================================================
CM$VER      5.01.05d    05/07/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 7270
  > Tela\Opçao No Sistema: Importação do Interface
  Não esta gravando o campo IDPATRO na tabela HISTRUBSAL quando os valores são gerados pela baixa (idmodulo 32). 
Padrão 5.05.30
Solic. Menezes
================================================================================
CM$VER      5.01.05c    26/06/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6567
  > Tela\Opçao No Sistema:  Cadastro de Rubircas da Patrocinadora
  
Preciso que no cadastro de rubricas do InterfacePrev reapareça o combo
para que o usuário possa indicar a qual grupo pertence a rubrica.
O mesmo combo  deverá aparecer também na Tela de Rubricas salariais da
Folha de Beneficios.
Solic:
Daniele Alves Marinho
Analista de Suporte TotalPrev
- Resolução da Pendência Nº 7263
  > Tela\Opçao No Sistema: Cadastro de layout e importação
  Implementação de novos campos na TMPDESC para atender o lay-out de envio com particularidade de dados do empréstimo (PARCELA  e NUMPARCELAS) e respectivas alterações na rotina de envio.
Solic. Gleyber
 
================================================================================
CM$VER      5.01.05b    20/06/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6636
  > Tela\Opçao No Sistema: Tratamento de divergência 
  Criação de tela de tratamento de divergência para :
1 - Não participantes;
2 - Registros não cadastrados na tabela PESSOA;
3 - Rubricas da empréstimo de participantes que não tenham contrato de empréstimo permitindo os seguintes tratamentos:
- Gerar Contas a Receber dos registros criticados;
- Gerar Contas a Pagar dos registros que sejam devolvidos à Patrocinadora  .
 
- Resolução da Pendência Nº 7360
  > Tela\Opçao No Sistema: Cadastros/ Rubricas
  Quando  buscamos uma rubrica e visualizamos a mesma na tela, não está aparecendo a opção que já está marcada, no tipo, se normal ou especial. Quando então, pedimos para alterar, aparece na tela que a opção está feita, porém não visível na consulta.
Solic. Flávio Dias
================================================================================
CM$VER      5.01.05a    24/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6075
  > Tela\Opçao No Sistema: Recebimento de Rubricas Financeiras
  Melhorar performance no recebimento de rubricas financeiras
- Resolução da Pendência Nº 6927
  > Tela\Opçao No Sistema: Cadatro de lay-out/ Importação financeira
  Parâmetro que indica se a matrícula que vem no arquivo é igual a que está cadastrada no banco ou não.
- Resolução da Pendência Nº 6930
  > Tela\Opçao No Sistema: Envio do arquivo para patrocinadora
  Acusa um erro no envio de contribuições assistenciais.
================================================================================
CM$VER      5.01.05     17/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6064
  > Tela\Opçao No Sistema: Importação financeira
  Avisar na importação se já há rubricas no histórico para aquele mês, apenas como um lembrete
para caso o usuário esteja selecionando o mês errado na tela.
- Resolução da Pendência Nº 6222
  > Tela\Opçao No Sistema: PATROCINADORA/RECEBIMENTO/FINANCEIRO
  Tratamento dos arquivos FINANCEIRO e BASE DE CALCULO no Separador, para o processamento das rubricas.
- Resolução da Pendência Nº 6799
  > Tela\Opçao No Sistema: Cadastro de Lay-out de envio
  Alterações feitas na tela não persistem
- Resolução da Pendência Nº 6800
  > Tela\Opçao No Sistema: Tela de envio para patrocinadora
  Envio dos campos tipo VAZIO, não estão sendo enviados.
================================================================================
CM$VER      5.01.04     11/01/2002
--------------------------------------------------------------------------------
1. Interface Cadastral - Tratamento de Criticas : acrescentados os grupos contatos, lotacoes e eventos
2. Interface Cadastral - Relatorios : acrescentados os grupos contatos, lotacoes e eventos
================================================================================
CM$VER      5.01.03     08/01/2002
--------------------------------------------------------------------------------
Acerto na Tela de Parametrizacao de Envio de Contribuicao
================================================================================
CM$VER      5.01.02     27/12/2001
--------------------------------------------------------------------------------
Correção na Importacao de Enderecos e Documentos
================================================================================
CM$VER      4.02.00a    02/10/2001
--------------------------------------------------------------------------------
Customização no relatório de estatítiscas para SPC
================================================================================
CM$VER      4.02.00     02/10/2001
--------------------------------------------------------------------------------
Acerto na geração de estatística para SPC
================================================================================
CM$VER      4.01.03     17/07/2001
--------------------------------------------------------------------------------
- Alteração nos processos de importação financeira e cadastral, testando o formato da matricula cadastrada.
- Inclusão dos processos de importação de dependentes e evolução funcional na importação cadastral.
- Correção de erros.
- Atualização das telas de associação de rubricas.
================================================================================
CM$VER      3.01.14     03/08/2000
--------------------------------------------------------------------------------
Atualização de Dados Cadastrais através de TXT enviado pela patrocinadora das tabelas
utilizadas por esta.
Cadastro do Layout de Recebimento atualizado para efetuar a importação das tabelas 
Bancos e Agências, Órgãos, Situações, Locais, Cargos e Níveis.
- Resolução da Pendência Nº 2116
  > Tela\Opçao No Sistema: Recebimento
  Atualização de dados cadastrais
================================================================================
CM$VER      3.01.06     03/02/2000
--------------------------------------------------------------------------------
. Acerto do Envio, passando a leitura dos dados a ser feita sempre da TMPDESC;
. Acerto do Recebimento;
================================================================================
CM$ALT}










