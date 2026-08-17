{
--------------------------------------------------------------------------------
Pendência   : SOL 150881 KINTANA 1099543
Responsável : BRUNO AZEVEDO
Data        : 17/01/2011
Descrição   : Trazer a funcionalidade de publicações para a tela de consulta.
--------------------------------------------------------------------------------
Pendência   : SOL 140492 KINTANA 881593
Responsável : Ádler Souza
Data        : 31/08/2010
Descrição   : Inserir o valor do fundo garantidor abaixo da prestação.
--------------------------------------------------------------------------------
Pendência   : SOL 141367 KINTANA 894033
Responsável : BRUNO AZEVEDO
Data        : 31/08/2010
Descrição   : Implementação da verificação de dependentes válidos.
--------------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
Rotina    : cdsWebTpUsuCampo e cdsWebTpUsuPagina
Data      : 24/05/2007
Pendência : 24970
Descrição : Inclusão do DataField IDREGRAACESSO
            (deveria ter sido criado na implementação da pendência 18467)
---------------------------------------------------------------------------------------------------
}
unit FGeraPaginasCampos;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, uCmTypes,
  dBaseDados, uSistema, uCtrlWebPaginaCampo, uCtrlWebInterface,
  uCtrlWebTpUsuPagina, uCtrlWebTpUsuCampo,  
  Grids, uConstPaginasCampos, ComCtrls, Menus;

type

  TCampo = record
    iIDCAMPO      : integer;
    iIDCAMPOPAI   : integer;
    iIDPAGINA     : integer;
    sDESCCAMPO    : string;
    sFLGSEMPREHAB : string;
  end;

  TPagina = record
    iIDPAGINA     : integer;
    iIDPAGINAPAI  : integer;
    sDESCPAGINA   : string;
    sFLGSEMPREHAB : string;
  end;

  TfrmGeraPaginasCampos = class(TfrmOkCancelar)
    grpPaginas: TGroupBox;
    lblMsgPaginas: TLabel;
    lblTituloQtdePagNovas: TLabel;
    lblQtdePagNovas: TLabel;
    grpCampos: TGroupBox;
    lblMsgCampos: TLabel;
    lblTituloQtdeCamNovos: TLabel;
    lblQtdeCamNovos: TLabel;
    lblMsg: TLabel;
    cdsWebCampo: TCMClientDataSet;
    cdsWebPagina: TCMClientDataSet;
    cdsWebPaginaIDPAGINA: TFloatField;
    cdsWebPaginaIDPAGINAPAI: TFloatField;
    cdsWebPaginaDESCPAGINA: TStringField;
    cdsWebPaginaFLGSEMPREHAB: TStringField;
    cdsWebCampoIDCAMPO: TFloatField;
    cdsWebCampoIDCAMPOPAI: TFloatField;
    cdsWebCampoIDPAGINA: TFloatField;
    cdsWebCampoDESCCAMPO: TStringField;
    cdsWebCampoFLGSEMPREHAB: TStringField;
    grdPaginas: TStringGrid;
    grdCampos: TStringGrid;
    cdsPaginasNovas: TCMClientDataSet;
    cdsPaginasNovasIDPAGINA: TFloatField;
    cdsPaginasNovasIDPAGINAPAI: TFloatField;
    cdsPaginasNovasDESCPAGINA: TStringField;
    cdsPaginasNovasFLGSEMPREHAB: TStringField;
    cdsCamposNovos: TCMClientDataSet;
    cdsCamposNovosIDCAMPO: TFloatField;
    cdsCamposNovosIDCAMPOPAI: TFloatField;
    cdsCamposNovosIDPAGINA: TFloatField;
    cdsCamposNovosDESCCAMPO: TStringField;
    cdsCamposNovosFLGSEMPREHAB: TStringField;
    ProgressBar: TProgressBar;
    cdsWebInterface: TCMClientDataSet;
    cdsWebTpUsuCampo: TCMClientDataSet;
    cdsWebTpUsuCampoIDTIPOUSUARIO: TFloatField;
    cdsWebTpUsuCampoIDCAMPO: TFloatField;
    cdsWebTpUsuCampoIDWEBINTERFACE: TFloatField;
    cdsWebTpUsuCampoTITULOCAMPO: TStringField;
    cdsWebTpUsuCampoFLGDISPONIVEL: TStringField;
    cdsWebTpUsuPagina: TCMClientDataSet;
    cdsWebTpUsuPaginaIDTIPOUSUARIO: TFloatField;
    cdsWebTpUsuPaginaIDPAGINA: TFloatField;
    cdsWebTpUsuPaginaIDWEBINTERFACE: TFloatField;
    cdsWebTpUsuPaginaTITULOPAGINA: TStringField;
    cdsWebTpUsuPaginaFLGUSAPADRAO: TStringField;
    cdsWebTpUsuPaginaPAGCONTEUDO: TStringField;
    cdsWebTpUsuPaginaLAYERACESSO: TStringField;
    cdsWebTpUsuPaginaFLGDISPONIVEL: TStringField;
    cdsWebTpUsuPaginaFLGCONTAACESSO: TStringField;
    PopupMenu1: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

    //Quantidade de páginas e campos a incluir
    iQtde : integer;

    //Array de campos
    aCampos  : array of TCampo;

    //Array de páginas
    aPaginas : array of TPagina;

    //CtrlObject de páginas e campos
    WebPaginaCampo : TCtrlWebPaginaCampo;

    //CtrlObject de interfaces
    WebInterface : TCtrlWebInterface;

    //CtrlObjects de relacionamento
    WebTpUsuPagina : TCtrlWebTpUsuPagina;
    WebTpUsuCampo : TCtrlWebTpUsuCampo;

    //Classe que monta os datasets para gravar no banco
    TpUsuPaginaCampo : TTpUsuPaginaCampo;

    //Mensagem de erro retornado pelo CtrlObject
    procedure MsgErro ( sMsg : String );

    //Insere um campo no vetor
    procedure InsereCampo( _iIDCAMPO, _iIDCAMPOPAI, _iIDPAGINA : integer;
                           _sDESCCAMPO, _sFLGSEMPREHAB : string );

    //Insere uma página no vetor
    procedure InserePagina( _iIDPAGINA, _iIDPAGINAPAI : integer;
                           _sDESCPAGINA, _sFLGSEMPREHAB : string );

    //Localiza uma página em seu vetor, retornando o índice
    function LocalizaPagina( iIDPAGINA : integer ) : integer;

  public
    { Public declarations }
  end;

var
  frmGeraPaginasCampos: TfrmGeraPaginasCampos;

implementation

{$R *.DFM}

{ TfrmGeraPaginasCampos }


//Mensagem de erro retornado pelo CtrlObject
procedure TfrmGeraPaginasCampos.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end; {MsgErro}


//Insere um campo no vetor
procedure TfrmGeraPaginasCampos.InsereCampo(_iIDCAMPO, _iIDCAMPOPAI,
  _iIDPAGINA: integer; _sDESCCAMPO, _sFLGSEMPREHAB: string);
begin
  SetLength( aCampos, length( aCampos ) + 1 );

  with aCampos[ High( aCampos ) ] do
  begin
    iIDCAMPO      := _iIDCAMPO;
    iIDCAMPOPAI   := _iIDCAMPOPAI;
    iIDPAGINA     := _iIDPAGINA;
    sDESCCAMPO    := _sDESCCAMPO;
    sFLGSEMPREHAB := _sFLGSEMPREHAB;
  end;
end; {InsereCampo}


//Insere uma página no vetor
procedure TfrmGeraPaginasCampos.InserePagina(_iIDPAGINA,
  _iIDPAGINAPAI: integer; _sDESCPAGINA, _sFLGSEMPREHAB: string);
begin
  SetLength( aPaginas, length( aPaginas ) + 1 );

  with aPaginas[ High( aPaginas ) ] do
  begin
    iIDPAGINA     := _iIDPAGINA;
    iIDPAGINAPAI  := _iIDPAGINAPAI;
    sDESCPAGINA   := _sDESCPAGINA;
    sFLGSEMPREHAB := _sFLGSEMPREHAB;
  end;
end; {InserePagina}


procedure TfrmGeraPaginasCampos.FormCreate(Sender: TObject);
var
  i : integer;
  bPrimeiro : boolean;
begin
  inherited;

  //Insere as páginas no vetor
  InserePagina( pEmpSimulacao                  ,                          0, 'Simulação de Empréstimos'                                 , 'N' );
  InserePagina( pEmpSelecaoTpContrato          ,              pEmpSimulacao, 'Seleção de Tipo de Contrato'                              , 'S' );
  InserePagina( pEmpParamSimulacao             ,              pEmpSimulacao, 'Parâmetros da Simulação'                                  , 'S' );
  InserePagina( pEmpParcelas                   ,              pEmpSimulacao, 'Parcelas'                                                 , 'S' );
  InserePagina( pEmpConsultaContrato           ,                          0, 'Consulta Contrato'                                        , 'N' );
  InserePagina( pEmpDadosContrato              ,       pEmpConsultaContrato, 'Dados do Contrato de Empréstimo'                          , 'S' );
  InserePagina( pEndConfInclusao               ,               pEndInclusao, 'Confirmação de Inclusão de Endereço'                      , 'S' );
  InserePagina( pEndConfAlteracao              ,              pEndAlteracao, 'Confirmação de Alteração de Endereço'                     , 'S' );
  InserePagina( pEndConfExclusao               ,               pEndExclusao, 'Confirmação de Exclusão de Endereço'                      , 'S' );
  InserePagina( pDepConfInclusao               ,               pDepInclusao, 'Confirmação de Inclusão de Dependente'                    , 'S' );
  InserePagina( pDepConfAlteracao              ,              pDepAlteracao, 'Confirmação de Alteração de Dependente'                   , 'S' );
  InserePagina( pDepConfExclusao               ,               pDepExclusao, 'Confirmação de Exclusão de Dependente'                    , 'S' );
  InserePagina( pEndInclusao                   ,            pManutEnderecos, 'Inclusão de Endereço'                                     , 'N' );
  InserePagina( pEndAlteracao                  ,            pManutEnderecos, 'Alteração de Endereço'                                    , 'N' );
  InserePagina( pEndExclusao                   ,            pManutEnderecos, 'Exclusão de Endereço'                                     , 'N' );
  InserePagina( pDepInclusao                   ,          pManutDependentes, 'Inclusão de Dependente'                                   , 'N' );
  InserePagina( pDepAlteracao                  ,          pManutDependentes, 'Alteração de Dependente'                                  , 'N' );
  InserePagina( pDepExclusao                   ,          pManutDependentes, 'Exclusão de Dependente'                                   , 'N' );
  InserePagina( pConfSenha                     ,               pAlteraSenha, 'Confirmação de Alteração de Senha'                        , 'S' );
  InserePagina( pLogout                        ,                          0, 'Logout'                                                   , 'S' );
  InserePagina( pHome                          ,                          0, 'Home'                                                     , 'S' );
  InserePagina( pTransfPlano                   ,                          0, 'Transferência de Plano'                                   , 'N' );
  InserePagina( pTpOpcaoSelecionada            ,               pTransfPlano, 'Opção Selecionada'                                        , 'S' );
  InserePagina( pTpConfirmacaoOpcao            ,               pTransfPlano, 'Confirmação de Opção'                                     , 'S' );
  InserePagina( pTpEstimativasTransacao        ,               pTransfPlano, 'Estimativas de Transferência da Opção <1>'                , 'S' );
  InserePagina( pTpDadosEstimativas            ,               pTransfPlano, 'Dados para Estimativas de Transferência para a Opção <1>' , 'S' );
  InserePagina( pTpOpcoesTransacao             ,               pTransfPlano, 'Opções de Transferência'                                  , 'S' );
  InserePagina( pTpDadosOpcoesTransacao        ,               pTransfPlano, 'Dados para Cálculo de Opções de Transferência'            , 'S' );
  InserePagina( pTpSelecaoPlano                ,               pTransfPlano, 'Seleção de Plano'                                         , 'S' );
  InserePagina( pTrPlAvisoSimDes               ,               pTransfPlano, 'Aviso de Simulação Desabilitada'                          , 'S' );
  InserePagina( pBenefSimulacao                ,                          0, 'Simulação de Benefício'                                   , 'N' );
  InserePagina( pEmpExtratoExpEmprestimos      , pSubMenuExtratoEmprestimos, 'Extrato Expandido'                                        , 'N' );
  InserePagina( pAlteraSenha                   ,                          0, 'Alteração de Senha'                                       , 'N' );
  InserePagina( pManutEnderecos                ,                          0, 'Manutenção de Endereços'                                  , 'N' );
  InserePagina( pManutDependentes              ,                          0, 'Manutenção de Dependentes'                                , 'N' );
  InserePagina( pConsignacaoJudicial           ,                          0, 'Consignação Judicial'                                     , 'N' );
  InserePagina( pDadosConsignacaoJudicial      ,       pConsignacaoJudicial, 'Dados de Consignação Judicial'                            , 'N' );
  InserePagina( pDadosDoParticipante           ,    pSubMenuDadosCadastrais, 'Dados do Participante'                                    , 'N' );
  InserePagina( pTempoDeServico                ,                          0, 'Tempo de Serviço'                                         , 'N' );
  InserePagina( pHistoricoDeContribuicoes      ,                          0, 'Histórico de Contribuições'                               , 'N' );

  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  InserePagina( pTempoServicoConsulta          ,                          0, 'Consulta de Tempo de Serviço'                               , 'N' );
  InserePagina( pTempoServicoInclusao          ,      pTempoServicoConsulta, 'Inclusão de Tempo de Serviço'                               , 'N' );
  InserePagina( pTempoServicoAlteracao         ,      pTempoServicoConsulta, 'Alteração de Tempo de Serviço'                               , 'N' );
  InserePagina( pTempoServicoExclusao          ,      pTempoServicoConsulta, 'Exclusão de Tempo de Serviço'                               , 'N' );
  InserePagina( pTempoServicoConfInclusao      ,      pTempoServicoInclusao, 'Confirmação de Inclusão de Tempo de Serviço'                               , 'N' );
  InserePagina( pTempoServicoConfAlteracao     ,      pTempoServicoAlteracao, 'Confirmação de Alteração de Tempo de Serviço'                               , 'N' );
  InserePagina( pTempoServicoConfExclusao      ,      pTempoServicoExclusao, 'Confirmação de Exclusão de Tempo de Serviço'                               , 'N' );
  //BRUNO AZEVEDO SOL 124251 KINTANA 651677

  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  InserePagina( pManutDadosCadastrais          ,      pSubMenuDadosCadastrais, 'Manutenção de Dados Cadastrais'                , 'N' );
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  
  InserePagina( pSaldoDeReserva                ,    pSubMenuReservaPoupanca, 'Saldo de Reserva'                                         , 'N' );
  InserePagina( pExtratoDeReserva              ,    pSubMenuReservaPoupanca, 'Extrato de Reserva'                                       , 'N' );
  InserePagina( pParticipanteNaPatrocinadora   ,    pSubMenuDadosCadastrais, 'Participante na Patrocinadora'                            , 'N' );
  InserePagina( pParticipanteNosPlanos         ,    pSubMenuDadosCadastrais, 'Participante nos Planos'                                  , 'N' );
  InserePagina( pEventosPrevidenciarios        ,                          0, 'Eventos Previdenciários'                                  , 'N' );
  InserePagina( pDadosEventosPrevidenciarios   ,    pEventosPrevidenciarios, 'Dados de Eventos Previdenciários'                         , 'N' );
  InserePagina( pQuadroSalarial                ,                          0, 'Quadro Salarial'                                          , 'N' );
  InserePagina( pContraCheque                  ,                          0, 'Contra-Cheque'                                            , 'N' );
  InserePagina( pHistoricoDeBeneficios         ,                          0, 'Histórico de Benefícios'                                  , 'N' );
  InserePagina( pEmpParamEmptmo                ,              pEmpSimulacao, 'Parâmetros do Empréstimo'                                 , 'N' );
  InserePagina( pEmpConsultaInscricao          ,                          0, 'Consulta Inscrição'                                       , 'N' );
  InserePagina( pEmpExtratoAgrEmprestimos      , pSubMenuExtratoEmprestimos, 'Extrato Agrupado'                                         , 'N' );
  InserePagina( pEmpParConsContrato            ,       pEmpConsultaContrato, 'Parâmetros de Consulta a Contratos'                       , 'N' );
  InserePagina( pEmpConsContratos              ,       pEmpConsultaContrato, 'Contratos de Empréstimos'                                 , 'S' );
  InserePagina( pEmpParConsInscricao           ,      pEmpConsultaInscricao, 'Parâmetros de Consulta a Inscrições'                      , 'N' );
  InserePagina( pEmpConsInscricoes             ,      pEmpConsultaInscricao, 'Inscrições em Empréstimos'                                , 'S' );
  InserePagina( pEmpDadosInscricao             ,      pEmpConsultaInscricao, 'Dados da Inscrição'                                       , 'S' );
  InserePagina( pEmpExclusaoInscricao          ,              pEmpInscricao, 'Exclusão de Inscrição'                                    , 'N' );
  InserePagina( pEmpContrInscEmptmo            ,              pEmpInscricao, 'Contrato de Inscrição em Empréstimo'                      , 'N' );
  InserePagina( pInformeRendimentos            ,                          0, 'Informe de Rendimentos'                                   , 'N' );
  InserePagina( pBenefSelecao                  ,            pBenefSimulacao, 'Seleção do Benefício a Simular'                           , 'S' );
  InserePagina( pBenefCampos                   ,            pBenefSimulacao, 'Campos da Simulação de Benefício'                         , 'S' );
  InserePagina( pBenefResultados               ,            pBenefSimulacao, 'Resultados da Simulação de Benefício'                     , 'S' );
  InserePagina( pExtResPer                     ,                          0, 'Extrato de Reserva por período'                           , 'N' );
  InserePagina( pEventosPrevAtivos             ,                          0, 'Eventos Previdenciários de Planos Ativos'                 , 'N' );
  InserePagina( pContraChequeNaoEncontrado     ,              pContraCheque, 'Contra-cheque não encontrado'                             , 'S' );
  InserePagina( pSubMenuDadosCadastrais        ,                          0, 'Dados Cadastrais'                                         , 'S' );
  InserePagina( pSubMenuReservaPoupanca        ,                          0, 'Reserva de Poupança'                                      , 'S' );
  InserePagina( pSubMenuExtratoEmprestimos     ,                          0, 'Extrato de Empréstimos'                                   , 'S' );
  InserePagina( pEmpContratacao                ,              pEmpSimulacao, 'Contratação de Empréstimo'                                , 'N' );
  InserePagina( pEmpInscricao                  ,              pEmpSimulacao, 'Inscrição em Empréstimo'                                  , 'N' );
  InserePagina( pEmpContrInscEmptmoReimp       ,         pEmpDadosInscricao, 'Reimpressão de Contrato de Inscrição em Empréstimo'       , 'N' );
  InserePagina( pEmpExclusaoInscricaoCons      ,         pEmpDadosInscricao, 'Exclusão de Inscrição'                                    , 'N' );
  InserePagina( pEmpParExtratoEmptmo           , pSubMenuExtratoEmprestimos, 'Parâmetros de Extratos de Empréstimos'                    , 'N' );
  InserePagina( pEmpConsContratoNEncontr       ,       pEmpConsultaContrato, 'Contrato(s) não econtrado(s)'                             , 'S' );
  InserePagina( pEmpExtratoNEncontr            , pSubMenuExtratoEmprestimos, 'Extrato(s) não econtrado(s)'                              , 'S' );
  InserePagina( pEmpConsInscricaoNEncontr      ,      pEmpConsultaInscricao, 'Inscrição(ões) não econtrada(s)'                          , 'S' );
  InserePagina( pEmpExclusaoInscricaoConsConf  ,  pEmpExclusaoInscricaoCons, 'Confirmação de Exclusão de Inscrição'                     , 'S' );
  //Pendência FUNCEF - 09/01/2008
  InserePagina( pEmpContrConcEmptmo            ,            pEmpContratacao, 'Contrato de Concessão de Empréstimo'                      , 'N' );
  InserePagina( pEmpContrConcEmptmoReimp       ,          pEmpDadosContrato, 'Reimpressão de Contrato de Concessão de Empréstimo'       , 'N' );
  //Fim Pendência FUNCEF
  InserePagina( pManutTelefones                ,                          0, 'Manutenção de Telefones'                                  , 'N' );
  InserePagina( pTelInclusao                   ,            pManutTelefones, 'Inclusão de Telefone'                                     , 'N' );
  InserePagina( pTelAlteracao                  ,            pManutTelefones, 'Alteração de Telefone'                                    , 'N' );
  InserePagina( pTelExclusao                   ,            pManutTelefones, 'Exclusão de Telefone'                                     , 'N' );
  InserePagina( pTelConfInclusao               ,               pTelInclusao, 'Confirmação de Inclusão de Telefone'                      , 'S' );
  InserePagina( pTelConfAlteracao              ,              pTelAlteracao, 'Confirmação de Alteração de Telefone'                     , 'S' );
  InserePagina( pTelConfExclusao               ,               pTelExclusao, 'Confirmação de Exclusão de Telefone'                      , 'S' );
  InserePagina( pSitAtualBenef                 ,                          0, 'Situação Atual de Benefícios'                             , 'N' );
  InserePagina( pSitAtualBenefPar              ,             pSitAtualBenef, 'Parâmetros da Consulta à Situação Atual de Benefícios'    , 'S' );
  InserePagina( pSitAtualBenefTabela           ,             pSitAtualBenef, 'Resultados da Consulta à Situação Atual de Benefícios'    , 'S' );
  InserePagina( pSitAtualBenefDetalhes         ,             pSitAtualBenef, 'Detalhes da Consulta à Situação Atual de Benefícios'      , 'S' );
  InserePagina( pDepCancelamento               ,          pManutDependentes, 'Cancelamento de Dependente'                               , 'N' );
  InserePagina( pDepConfCancelamento           ,           pDepCancelamento, 'Confirmação de Cancelamento de Dependente'                , 'S' );


  //Insere os campos no vetor
  //BRUNO AZEVEDO SOL 141367 KINTANA 894033
  InsereCampo( cVerificaIdade                  ,                         0 , pManutDependentes            , 'Verifica Dependentes Válidos'                               , 'N' );
  //BRUNO AZEVEDO SOL 141367 KINTANA 894033

  //BRUNO AZEVEDO SOL 150881 KINTANA 1099543
  InsereCampo( cAltEmail                       ,                         0 , pManutDadosCadastrais        , 'E-Mail'                                                     , 'N' );
  InsereCampo( cAltNaoRecebPeriodico           ,                         0 , pManutDadosCadastrais        , 'Não Receber Periódicos'                                     , 'N' );
  //BRUNO AZEVEDO SOL 150881 KINTANA 1099543

  InsereCampo( cAltDepNome                     ,                         0 , pManutDependentes            , 'Nome'                                                       , 'N' );
  InsereCampo( cAltDepNomePai                  ,                         0 , pManutDependentes            , 'Nome do Pai'                                                , 'N' );
  InsereCampo( cAltDepNomeMae                  ,                         0 , pManutDependentes            , 'Nome da Mãe'                                                , 'N' );
  InsereCampo( cAltDepParentesco               ,                         0 , pManutDependentes            , 'Grau de dependência'                                        , 'N' );
  InsereCampo( cAltDepSexo                     ,                         0 , pManutDependentes            , 'Sexo'                                                       , 'N' );
  InsereCampo( cAltDepGrauInstr                ,                         0 , pManutDependentes            , 'Grau de Instrução'                                          , 'N' );
  InsereCampo( cAltDepEstadoCivil              ,                         0 , pManutDependentes            , 'Estado Civil'                                               , 'N' );
  InsereCampo( cAltDepDataNasc                 ,                         0 , pManutDependentes            , 'Data de Nascimento'                                         , 'N' );
  InsereCampo( cAltDepIsentoIRRF               ,                         0 , pManutDependentes            , 'Isento de IRRF?'                                            , 'N' );
  InsereCampo( cAltDepSalarioFamilia           ,                         0 , pManutDependentes            , 'Conta para Salário Família?'                                , 'N' );
  InsereCampo( cAltDepDependenteLegal          ,                         0 , pManutDependentes            , 'Dependente legal?'                                          , 'N' );
  InsereCampo( cAltDepPossuiMolestiaGrave      ,                         0 , pManutDependentes            , 'Possui moléstia grave?'                                     , 'N' );
  InsereCampo( cAltDepDesignado                ,                         0 , pManutDependentes            , 'Designado?'                                                 , 'N' );
  //Pendência 23274 - 28/12/2007
  InsereCampo( cAltDepDataMorte                ,                         0 , pManutDependentes            , 'Data de Falecimento'                                        , 'N' );
  InsereCampo( cAltDepNumDocumento             ,                         0 , pManutDependentes            , 'CPF'                                                        , 'N' );
  //Fim Pendência 23274
  //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  InsereCampo( cAltDepIR                       ,                         0 , pManutDependentes            , 'Dependente para imposto de renda'                           , 'N' );
  InsereCampo( cAltDepInvalido                 ,                         0 , pManutDependentes            , 'Dependente inválido'                                        , 'N' );
  //BRUNO AZEVEDO SOL 124179 KINTANA 651468
  InsereCampo( cDependentes                    ,                         0 , pDadosDoParticipante         , 'Dependentes'                                                , 'N' );
  InsereCampo( cDepGrauInstr                   ,              cDependentes , pDadosDoParticipante         , 'Grau de Instrução do Dependente'                            , 'N' );
  InsereCampo( cDepNomePai                     ,              cDependentes , pDadosDoParticipante         , 'Nome do Pai do Dependente'                                  , 'N' );
  InsereCampo( cDepNomeMae                     ,              cDependentes , pDadosDoParticipante         , 'Nome da Mãe do Dependente'                                  , 'N' );
  InsereCampo( cDepIsentoIRRF                  ,              cDependentes , pDadosDoParticipante         , 'Dependente é isento de IRRF?'                               , 'N' );
  InsereCampo( cDepSalarioFamilia              ,              cDependentes , pDadosDoParticipante         , 'Dependente é considerado para salário família?'             , 'N' );
  InsereCampo( cDepDependenteLegal             ,              cDependentes , pDadosDoParticipante         , 'Dependente legal?'                                          , 'N' );
  InsereCampo( cDepPossuiMolestiaGrave         ,              cDependentes , pDadosDoParticipante         , 'Dependente possui moléstia grave?'                          , 'N' );
  InsereCampo( cDepDesignado                   ,              cDependentes , pDadosDoParticipante         , 'Dependente designado?'                                      , 'N' );
  InsereCampo( cAltEndTipo                     ,                         0 , pManutEnderecos              , 'Tipo do Endereço do Participante'                           , 'N' );
  InsereCampo( cAltEndDescricao                ,                         0 , pManutEnderecos              , 'Descrição do Endereço do Participante'                      , 'N' );
  InsereCampo( cAltEndLogradouro               ,                         0 , pManutEnderecos              , 'Logradouro do Endereço do Participante'                     , 'N' );
  InsereCampo( cAltEndComplemento              ,                         0 , pManutEnderecos              , 'Complemento do Endereço do Participante'                    , 'N' );
  InsereCampo( cAltEndNumero                   ,                         0 , pManutEnderecos              , 'Número do Endereço do Participante'                         , 'N' );
  InsereCampo( cAltEndCEP                      ,                         0 , pManutEnderecos              , 'CEP do Endereço do Participante'                            , 'N' );
  InsereCampo( cAltEndCidade                   ,                         0 , pManutEnderecos              , 'Cidade do Endereço do Participante'                         , 'N' );
  InsereCampo( cAltEndEstado                   ,                         0 , pManutEnderecos              , 'Estado do Endereço do Participante'                         , 'N' );
  InsereCampo( cAltEndBairro                   ,                         0 , pManutEnderecos              , 'Bairro do Endereço do Participante'                         , 'N' );
  InsereCampo( cEmpConsContrNumContrato        ,                         0 , pEmpConsContratos            , 'Número do Contrato'                                         , 'N' );
  InsereCampo( cEmpConsContrSituacao           ,                         0 , pEmpConsContratos            , 'Situação do Contrato'                                       , 'N' );
  InsereCampo( cEmpConsContrTipoContrato       ,                         0 , pEmpConsContratos            , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cDetalhesConsigJudicial         ,                         0 , pDadosConsignacaoJudicial    , 'Detalhes da Consignação Judicial'                           , 'N' );
  InsereCampo( cDtInicialDetConsigJudicial     ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Data Inicial'                                               , 'N' );
  InsereCampo( cDtFinalDetConsigJudicial       ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Data Final'                                                 , 'N' );
  InsereCampo( cFavorecidoDetConsigJudicial    ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Nome do Favorecido'                                         , 'N' );
  InsereCampo( cParcelasDetConsigJudicial      ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Quantidade de Parcelas'                                     , 'N' );
  InsereCampo( cProcessadasDetConsigJudicial   ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Quantidade de Parcelas Processadas'                         , 'N' );
  InsereCampo( cAlimentadoDetConsigJudicial    ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Nome do Alimentado'                                         , 'N' );
  InsereCampo( cAbonoAnualDetConsigJudicial    ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Incide sobre Abono Anual?'                                  , 'N' );
  InsereCampo( cPermanenteDetConsigJudicial    ,   cDetalhesConsigJudicial , pDadosConsignacaoJudicial    , 'Permanente?'                                                , 'N' );
  InsereCampo( cTabelaPagamentos               ,                         0 , pDadosConsignacaoJudicial    , 'Tabela de Pagamentos'                                       , 'N' );
  InsereCampo( cMesRefDetConsigJudicial        ,         cTabelaPagamentos , pDadosConsignacaoJudicial    , 'Mês de Referência'                                          , 'N' );
  InsereCampo( cDataPagtoDetConsigJudicial     ,         cTabelaPagamentos , pDadosConsignacaoJudicial    , 'Data de Pagamento'                                          , 'N' );
  InsereCampo( cValorDetConsigJudicial         ,         cTabelaPagamentos , pDadosConsignacaoJudicial    , 'Valor'                                                      , 'N' );
  InsereCampo( cTabelaConsigJudicial           ,                         0 ,      pConsignacaoJudicial    , 'Tabela de Consignação Judicial'                             , 'N' );
  InsereCampo( cDtInicialConsigJudicial        ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Data Inicial'                                               , 'N' );
  InsereCampo( cDtFinalConsigJudicial          ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Data Final'                                                 , 'N' );
  InsereCampo( cFavorecidoConsigJudicial       ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Nome do Favorecido'                                         , 'N' );
  InsereCampo( cParcelasConsigJudicial         ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Quantidade de Parcelas'                                     , 'N' );
  InsereCampo( cProcessadasConsigJudicial      ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Quantidade de Parcelas Processadas'                         , 'N' );
  InsereCampo( cAlimentadoConsigJudicial       ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Nome do Alimentado'                                         , 'N' );
  InsereCampo( cAbonoConsigJudicial            ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Incide sobre Abono Anual?'                                  , 'N' );
  InsereCampo( cPermanenteConsigJudicial       ,     cTabelaConsigJudicial ,      pConsignacaoJudicial    , 'Permanente?'                                                , 'N' );
  InsereCampo( cDadosPessoais                  ,                         0 ,     pDadosDoParticipante     , 'Dados Pessoais do Participante'                             , 'N' );
  InsereCampo( cDocumentos                     ,                         0 ,     pDadosDoParticipante     , 'Documentos do Participante'                                 , 'N' );
  InsereCampo( cContasBancarias                ,                         0 ,     pDadosDoParticipante     , 'Contas Bancárias do Participante'                           , 'N' );
  InsereCampo( cEnderecos                      ,                         0 ,     pDadosDoParticipante     , 'Endereços do Participante'                                  , 'N' );
  InsereCampo( cTelefones                      ,                         0 ,     pDadosDoParticipante     , 'Telefones do Participante'                                  , 'N' );
  InsereCampo( cNome                           ,            cDadosPessoais ,     pDadosDoParticipante     , 'Nome do Participante'                                       , 'N' );
  InsereCampo( cNomeDoPai                      ,            cDadosPessoais ,     pDadosDoParticipante     , 'Nome do Pai do Participante'                                , 'N' );
  InsereCampo( cNomeDaMae                      ,            cDadosPessoais ,     pDadosDoParticipante     , 'Nome da Mãe do Participante'                                , 'N' );
  InsereCampo( cEstadoCivil                    ,            cDadosPessoais ,     pDadosDoParticipante     , 'Estado Civil do Participante'                               , 'N' );
  InsereCampo( cSexo                           ,            cDadosPessoais ,     pDadosDoParticipante     , 'Sexo do Participante'                                       , 'N' );
  InsereCampo( cNacionalidade                  ,            cDadosPessoais ,     pDadosDoParticipante     , 'Nacionalidade do Participante'                              , 'N' );
  InsereCampo( cNaturalidade                   ,            cDadosPessoais ,     pDadosDoParticipante     , 'Naturalidade do Participante'                               , 'N' );
  InsereCampo( cDataNascimento                 ,            cDadosPessoais ,     pDadosDoParticipante     , 'Data de Nascimento do Participante'                         , 'N' );
  InsereCampo( cPossuiMolestiaGrave            ,            cDadosPessoais ,     pDadosDoParticipante     , 'O participante possui moléstia grave?'                      , 'N' );
  InsereCampo( cIsentoDeIRRF                   ,            cDadosPessoais ,     pDadosDoParticipante     , 'O participante é isento de IRRF?'                           , 'N' );
  InsereCampo( cDDD                            ,                cTelefones ,     pDadosDoParticipante     , 'DDD do Telefone do Participante'                            , 'N' );
  InsereCampo( cDDI                            ,                cTelefones ,     pDadosDoParticipante     , 'DDI do Telefone do Participante'                            , 'N' );
  InsereCampo( cNumero                         ,                cTelefones ,     pDadosDoParticipante     , 'Número do Telefone do Participante'                         , 'N' );
  InsereCampo( cLogradouroTelefone             ,                cTelefones ,     pDadosDoParticipante     , 'Logradouro do Telefone do Participante'                     , 'N' );
  InsereCampo( cDescricaoEndereco              ,                cEnderecos ,     pDadosDoParticipante     , 'Descrição do Endereço do Participante'                      , 'N' );
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  InsereCampo( cTipoEndereco                   ,                cEnderecos ,     pDadosDoParticipante     , 'Tipo do Endereço do Participante'                      , 'N' );
  //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  InsereCampo( cLogradouro                     ,                cEnderecos ,     pDadosDoParticipante     , 'Logradouro do Endereço do Participante'                     , 'N' );
  InsereCampo( cComplemento                    ,                cEnderecos ,     pDadosDoParticipante     , 'Complemento do Endereço do Participante'                    , 'N' );
  InsereCampo( cNumeroEndereco                 ,                cEnderecos ,     pDadosDoParticipante     , 'Número do Endereço do Participante'                         , 'N' );
  InsereCampo( cCEP                            ,                cEnderecos ,     pDadosDoParticipante     , 'CEP do Endereço do Participante'                            , 'N' );
  InsereCampo( cCidade                         ,                cEnderecos ,     pDadosDoParticipante     , 'Cidade do Endereço do Participante'                         , 'N' );
  InsereCampo( cEstado                         ,                cEnderecos ,     pDadosDoParticipante     , 'Estado do Endereço do Participante'                         , 'N' );
  InsereCampo( cBairro                         ,                cEnderecos ,     pDadosDoParticipante     , 'Bairro do Endereço do Participante'                         , 'N' );
  InsereCampo( cDataFalecimento                ,            cDadosPessoais ,     pDadosDoParticipante     , 'Data de Falecimento do Participante'                        , 'N' );
  InsereCampo( cFimInvalidez                   ,            cDadosPessoais ,     pDadosDoParticipante     , 'Data de Término de Invalidez do Participante'               , 'N' );
  InsereCampo( cInicioInvalidez                ,            cDadosPessoais ,     pDadosDoParticipante     , 'Data de Início de Invalidez do Participante'                , 'N' );
  InsereCampo( cEMail                          ,            cDadosPessoais ,     pDadosDoParticipante     , 'Endereço de e-mail do participante'                         , 'N' );
  InsereCampo( cNomeDaFundacao                 ,                         0 , pParticipanteNaPatrocinadora , 'Nome da Fundação'                                           , 'N' );
  InsereCampo( cCargo                          ,                         0 , pParticipanteNaPatrocinadora , 'Cargo do Participante na Patrocinadora'                     , 'N' );
  InsereCampo( cCentroDeCusto                  ,                         0 , pParticipanteNaPatrocinadora , 'Centro de Custo do Participante na Patrocinadora'           , 'N' );
  InsereCampo( cFilial                         ,                         0 , pParticipanteNaPatrocinadora , 'Filial da Patrocinadora'                                    , 'N' );
  InsereCampo( cMatricula                      ,                         0 , pParticipanteNaPatrocinadora , 'Matrícula do Participante na Patrocinadora'                 , 'N' );
  InsereCampo( cSituacaoDoPartNaPatro          ,                         0 , pParticipanteNaPatrocinadora , 'Situação do Participante na Patrocinadora'                  , 'N' );
  InsereCampo( cVinculacao                     ,                         0 , pParticipanteNaPatrocinadora , 'Tipo da Vinculação do Partipante à Patrocinadora'           , 'N' );
  InsereCampo( cDataAdmissao                   ,                         0 , pParticipanteNaPatrocinadora , 'Data de Admissão do Participante na Patrocinadora'          , 'N' );
  InsereCampo( cDataDemissao                   ,                         0 , pParticipanteNaPatrocinadora , 'Data de Demissão do Participante na Patrocinadora'          , 'N' );
  InsereCampo( cDataReadmissao                 ,                         0 , pParticipanteNaPatrocinadora , 'Data de Re-admissão do Participante na Patrocinadora'       , 'N' );
  InsereCampo( cSalario                        ,                         0 , pParticipanteNaPatrocinadora , 'Salário do Participante na Patrocinadora'                   , 'N' );
  InsereCampo( cOrgaoSetor                     ,                         0 , pParticipanteNaPatrocinadora , 'Órgão/Setor do Participante na Patrocinadora'               , 'N' );
  InsereCampo( cTempoTotalDeServAnterior       ,                         0 , pParticipanteNaPatrocinadora , 'Tempo de Serviço Anterior'                                  , 'N' );
  InsereCampo( cTempoTotalNaoCreditado         ,                         0 , pParticipanteNaPatrocinadora , 'Tempo não creditado'                                        , 'N' );
  InsereCampo( cNomeDoPlano                    ,                         0 ,       pParticipanteNosPlanos , 'Nome do Plano'                                              , 'N' );
  InsereCampo( cSituacaoDoPartNoPlano          ,                         0 ,       pParticipanteNosPlanos , 'Situação do Participante'                                   , 'N' );
  InsereCampo( cSituacaoNoPlano                ,                         0 ,       pParticipanteNosPlanos , 'Situação do Participante no Plano'                          , 'N' );
  InsereCampo( cDataCancelamento               ,                         0 ,       pParticipanteNosPlanos , 'Data de Cancelamento no Plano'                              , 'N' );
  InsereCampo( cDataInscricao                  ,                         0 ,       pParticipanteNosPlanos , 'Data de Inscrição do Participante no Plano'                 , 'N' );
  InsereCampo( cDataRequerimento               ,                         0 ,       pParticipanteNosPlanos , 'Data de Requerimento'                                       , 'N' );
  InsereCampo( cInscricao                      ,                         0 ,       pParticipanteNosPlanos , 'Número de Inscrição do Participante no Plano'               , 'N' );
  InsereCampo( cSalarioNaInscricao             ,                         0 ,       pParticipanteNosPlanos , 'Salário na Inscrição do Participante no Plano'              , 'N' );
  InsereCampo( cSituacaoEspecial               ,                         0 ,       pParticipanteNosPlanos , 'O participante encontra-se em situação especial no plano?'  , 'N' );
  InsereCampo( cTipoDeInscricao                ,                         0 ,       pParticipanteNosPlanos , 'Tipo de Inscrição do Participante no Plano'                 , 'N' );
  InsereCampo( cDtInicioDeManutencao           ,                         0 ,       pParticipanteNosPlanos , 'Data Início de Manutenção da Inscrição do Funcionário'      , 'N' );
  InsereCampo( cTmpSrvTabela                   ,                         0 ,              pTempoDeServico , 'Tempo de Serviço (tabela)'                                  , 'N' );
  InsereCampo( cTmpSrvCConversaoExtenso        ,                         0 ,              pTempoDeServico , 'Tempo de Serviço Total por extenso (com conversão)'         , 'N' );
  InsereCampo( cTmpSrvSConversaoExtenso        ,                         0 ,              pTempoDeServico , 'Tempo de Serviço Total por extenso (sem conversão)'         , 'N' );
  InsereCampo( cTmpSrvContaTempoDeServico      ,             cTmpSrvTabela ,              pTempoDeServico , 'Conta como tempo de serviço?'                               , 'N' );
  InsereCampo( cTmpSrvTransfConcomitante       ,             cTmpSrvTabela ,              pTempoDeServico , 'Transferência Concomitante'                                 , 'N' );
  InsereCampo( cTmpSrvDtFinal                  ,             cTmpSrvTabela ,              pTempoDeServico , 'Data de Término do Participante na Empresa'                 , 'N' );
  InsereCampo( cTmpSrvDtInicial                ,             cTmpSrvTabela ,              pTempoDeServico , 'Data de Início do Participante na Empresa'                  , 'N' );
  InsereCampo( cTmpSrvEmpresa                  ,             cTmpSrvTabela ,              pTempoDeServico , 'Empresa onde trabalhou o participante'                      , 'N' );
  InsereCampo( cTmpSrvInsalubridade            ,             cTmpSrvTabela ,              pTempoDeServico , 'Insalubridade'                                              , 'N' );
  InsereCampo( cTmpSrvCargo                    ,             cTmpSrvTabela ,              pTempoDeServico , 'Cargo'                                                      , 'N' );
  InsereCampo( cTmpSrvFuncao                   ,             cTmpSrvTabela ,              pTempoDeServico , 'Função'                                                     , 'N' );
  InsereCampo( cTabelaContribuicoes            ,                         0 ,    pHistoricoDeContribuicoes , 'Contribuições (tabela)'                                     , 'N' );
  InsereCampo( cContribuicaoHistorico          ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'Descrição da Contribuição'                                  , 'N' );
  InsereCampo( cDevolucao                      ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'É lançamento de devolução?'                                 , 'N' );
  InsereCampo( cMesRef                         ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'Mês de Referência da Contribuição'                          , 'N' );
  InsereCampo( cRecebimento                    ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'Data de Recebimento'                                        , 'N' );
  InsereCampo( cReserva                        ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'É lançamento de reserva?'                                   , 'N' );
  InsereCampo( cSituacao                       ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'Situação da Contribuição'                                   , 'N' );
  InsereCampo( cTotalMes                       ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'Valor total contribuído no mês'                             , 'N' );
  InsereCampo( cValorContribuicao              ,      cTabelaContribuicoes ,    pHistoricoDeContribuicoes , 'Valor da Contribuição'                                      , 'N' );
  InsereCampo( cTabelaSaldoDeReserva           ,                         0 ,              pSaldoDeReserva , 'Saldo de Reserva (tabela)'                                  , 'N' );
  InsereCampo( cDataUltAlim                    ,     cTabelaSaldoDeReserva ,              pSaldoDeReserva , 'Data Ult. Alim.'                                            , 'N' );
  InsereCampo( cNomeDaReservaSaldo             ,     cTabelaSaldoDeReserva ,              pSaldoDeReserva , 'Nome da Reserva'                                            , 'N' );
  InsereCampo( cReservaEmCotas                 ,     cTabelaSaldoDeReserva ,              pSaldoDeReserva , 'Reserva em Cotas'                                           , 'N' );
  InsereCampo( cSituacaoDaReserva              ,     cTabelaSaldoDeReserva ,              pSaldoDeReserva , 'Situação da Reserva'                                        , 'N' );
  InsereCampo( cValorDoSaldoDeReserva          ,     cTabelaSaldoDeReserva ,              pSaldoDeReserva , 'Valor'                                                      , 'N' );
  InsereCampo( cValorDaCota                    ,     cTabelaSaldoDeReserva ,              pSaldoDeReserva , 'Valor da Cota'                                              , 'N' );
  InsereCampo( cTabelaExtratoDeReserva         ,                         0 ,            pExtratoDeReserva , 'Extrato de Reserva (tabela)'                                , 'N' );
  InsereCampo( cES                             ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Entrada/Saída'                                              , 'N' );
  InsereCampo( cMesRefExtratoDeReserva         ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Mês de Referência do Extrato'                               , 'N' );
  //Pendência 22930 - 31/08/2006
  InsereCampo( cDataMovimentacao               ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Data da Movimentação'                                       , 'N' );
  //Fim Pendência 22930
  InsereCampo( cBeneficio                      ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Benefício'                                                  , 'N' );
  InsereCampo( cContribuicaoExtrato            ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Contribuição'                                               , 'N' );
  InsereCampo( cNomeDaReservaExtrato           ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Nome da Reserva'                                            , 'N' );
  InsereCampo( cSaldo                          ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Saldo da Reserva'                                           , 'N' );
  InsereCampo( cValorDaReserva                 ,   cTabelaExtratoDeReserva ,            pExtratoDeReserva , 'Valor da Reserva'                                           , 'N' );
  InsereCampo( cAgencia                        ,          cContasBancarias ,         pDadosDoParticipante , 'Nome da Agência'                                            , 'N' );
  InsereCampo( cBanco                          ,          cContasBancarias ,         pDadosDoParticipante , 'Nome do Banco'                                              , 'N' );
  InsereCampo( cContaCorrente                  ,          cContasBancarias ,         pDadosDoParticipante , 'Número da Conta Corrente'                                   , 'N' );
  InsereCampo( cContaPreferencial              ,          cContasBancarias ,         pDadosDoParticipante , 'É a conta preferncial?'                                     , 'N' );
  InsereCampo( cNumAgencia                     ,          cContasBancarias ,         pDadosDoParticipante , 'Número da Agência'                                          , 'N' );
  InsereCampo( cNumBanco                       ,          cContasBancarias ,         pDadosDoParticipante , 'Número do Banco'                                            , 'N' );
  InsereCampo( cDataNascDependente             ,              cDependentes ,         pDadosDoParticipante , 'Data de Nascimento do Dependente'                           , 'N' );
  InsereCampo( cEstadoCivilDependente          ,              cDependentes ,         pDadosDoParticipante , 'Estado Civil do Dependente'                                 , 'N' );
  InsereCampo( cNomeDependente                 ,              cDependentes ,         pDadosDoParticipante , 'Nome do Dependente'                                         , 'N' );
  InsereCampo( cParentesco                     ,              cDependentes ,         pDadosDoParticipante , 'Parentesco do Dependente'                                   , 'N' );
  InsereCampo( cSexoDependente                 ,              cDependentes ,         pDadosDoParticipante , 'Sexo do Dependente'                                         , 'N' );
  InsereCampo( cTmpSrvTempoExtenso             ,             cTmpSrvTabela ,              pTempoDeServico , 'Tempo por extenso'                                          , 'N' );
  InsereCampo( cTabelaEventosPrev              ,                         0 ,      pEventosPrevidenciarios , 'Tabela de Eventos Previdenciários'                          , 'N' );
  InsereCampo( cEventoGerador                  ,        cTabelaEventosPrev ,      pEventosPrevidenciarios , 'Evento Gerador'                                             , 'N' );
  InsereCampo( cDtEvento                       ,        cTabelaEventosPrev ,      pEventosPrevidenciarios , 'Data do Evento'                                             , 'N' );
  InsereCampo( cInscricaoEvento                ,        cTabelaEventosPrev ,      pEventosPrevidenciarios , 'Inscrição'                                                  , 'N' );
  InsereCampo( cDtRegistro                     ,        cTabelaEventosPrev ,      pEventosPrevidenciarios , 'Data de Registro'                                           , 'N' );
  InsereCampo( cDtEfetivacao                   ,        cTabelaEventosPrev ,      pEventosPrevidenciarios , 'Data de Efetivação'                                         , 'N' );
  InsereCampo( cDtEncerramento                 ,        cTabelaEventosPrev ,      pEventosPrevidenciarios , 'Data de Encerramento'                                       , 'N' );
  InsereCampo( cDetalhesEvento                 ,                         0 , pDadosEventosPrevidenciarios , 'Detalhes do Evento'                                         , 'N' );
  InsereCampo( cDetEventoGerador               ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Evento Gerador'                                             , 'N' );
  InsereCampo( cDetDtEvento                    ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Data do Evento'                                             , 'N' );
  InsereCampo( cDetInscricaoEvento             ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Inscrição'                                                  , 'N' );
  InsereCampo( cDetDtRegistro                  ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Data de Registro'                                           , 'N' );
  InsereCampo( cDetDtEfetivacao                ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Data de Efetivação'                                         , 'N' );
  InsereCampo( cDetDtEncerramento              ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Data de Encerramento'                                       , 'N' );
  InsereCampo( cDetSitAntFund                  ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Situação na Fundação antes do evento'                       , 'N' );
  InsereCampo( cDetSitNovaFund                 ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Situação na Fundação depois do evento'                      , 'N' );
  InsereCampo( cDetSitAntPatro                 ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Situação na Patrocinadora antes do evento'                  , 'N' );
  InsereCampo( cDetSitNovaPatro                ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Situação na Patrocinadora depois do evento'                 , 'N' );
  InsereCampo( cDetSitAntPlano                 ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Situação no Plano antes do evento'                          , 'N' );
  InsereCampo( cDetSitNovaPlano                ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Situação no Plano depois do evento'                         , 'N' );
  InsereCampo( cTabelaContribEventos           ,                         0 , pDadosEventosPrevidenciarios , 'Tabela de Contribuições do Evento'                          , 'N' );
  InsereCampo( cContribEvento                  ,     cTabelaContribEventos , pDadosEventosPrevidenciarios , 'Contribuição do Evento'                                     , 'N' );
  InsereCampo( cTabelaQuadroSalarial           ,                         0 ,              pQuadroSalarial , 'Tabela de Quadro Salarial'                                  , 'N' );
  InsereCampo( cMesRefRub                      ,     cTabelaQuadroSalarial ,              pQuadroSalarial , 'Mês de Referência da Rubrica'                               , 'N' );
  InsereCampo( cMesCobrancarRub                ,     cTabelaQuadroSalarial ,              pQuadroSalarial , 'Mês de Cobrança da Rubrica'                                 , 'N' );
  InsereCampo( cIdRubrica                      ,     cTabelaQuadroSalarial ,              pQuadroSalarial , 'Código da Rubrica'                                          , 'N' );
  InsereCampo( cDescRUbrica                    ,     cTabelaQuadroSalarial ,              pQuadroSalarial , 'Descrição da Rubrica'                                       , 'N' );
  InsereCampo( cTipoRubrica                    ,     cTabelaQuadroSalarial ,              pQuadroSalarial , 'Tipo da Rubrica'                                            , 'N' );
  InsereCampo( cValorRubrica                   ,     cTabelaQuadroSalarial ,              pQuadroSalarial , 'Valor da Rubrica'                                           , 'N' );
  InsereCampo( cFoto                           ,            cDadosPessoais ,         pDadosDoParticipante , 'Foto do Participante'                                       , 'N' );
  InsereCampo( cTabelaHistBenef                ,                         0 ,       pHistoricoDeBeneficios , 'Tabela de Histórico de Benefícios'                          , 'N' );
  InsereCampo( cMesRefHistBenef                ,          cTabelaHistBenef ,       pHistoricoDeBeneficios , 'Mês de Referência'                                          , 'N' );
  InsereCampo( cBeneficioHistBenef             ,          cTabelaHistBenef ,       pHistoricoDeBeneficios , 'Benefício'                                                  , 'N' );
  InsereCampo( cBeneficiarioHistBenef          ,          cTabelaHistBenef ,       pHistoricoDeBeneficios , 'Beneficiário'                                               , 'N' );
  InsereCampo( cValorHistBenef                 ,          cTabelaHistBenef ,       pHistoricoDeBeneficios , 'Valor do Benefício'                                         , 'N' );
  InsereCampo( cDataPgtoHistBenef              ,          cTabelaHistBenef ,       pHistoricoDeBeneficios , 'Data do Pagamento'                                          , 'N' );
  InsereCampo( cMesProcessoHistBenef           ,          cTabelaHistBenef ,       pHistoricoDeBeneficios , 'Mês de Processo'                                            , 'N' );
  InsereCampo( cTmpSrvCConversaoDias           ,                         0 ,              pTempoDeServico , 'Tempo de Serviço Total em dias (com conversão)'             , 'N' );
  InsereCampo( cTmpSrvSConversaoDias           ,                         0 ,              pTempoDeServico , 'Tempo de Serviço Total em dias (sem conversão)'             , 'N' );
  InsereCampo( cEmpConsContrTipoEmprestimo     ,                         0 ,            pEmpConsContratos , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cAltDepIRRF                     ,                         0 ,            pManutDependentes , 'Dependente é considerado para imposto de renda?'            , 'N' );
  InsereCampo( cDepIRRF                        ,              cDependentes ,         pDadosDoParticipante , 'Dependente é considerado para imposto de renda?'            , 'N' );
  InsereCampo( cEmpConsSaldoContrato           ,                         0 ,            pEmpDadosContrato , 'Saldo do Contrato'                                          , 'N' );
  InsereCampo( cEmpConsDataQuitacao            ,     cEmpConsSaldoContrato ,            pEmpDadosContrato , 'Atualizar saldo devedor até'                                , 'S' );
  InsereCampo( cEmpConsValorEmAberto           ,     cEmpConsSaldoContrato ,            pEmpDadosContrato , 'Valor em Aberto'                                            , 'N' );
  InsereCampo( cEmpConsSaldoAtual              ,     cEmpConsSaldoContrato ,            pEmpDadosContrato , 'Saldo Atualizado**'                                           , 'S' );
  InsereCampo( cEmpExtExpTabela                ,                         0 ,    pEmpExtratoExpEmprestimos , 'Tabela de Saldo de Empréstimos'                             , 'N' );
  InsereCampo( cEmpExtExpNumContrato           ,                         0 ,    pEmpExtratoExpEmprestimos , 'Número do Contrato'                                         , 'N' );
  InsereCampo( cEmpExtExpEvento                ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Evento'                                                     , 'N' );
  InsereCampo( cEmpExtExpItem                  ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Item'                                                       , 'N' );
  InsereCampo( cEmpExtExpParcela               ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Parcela'                                                    , 'N' );
  InsereCampo( cEmpExtExpSequencial            ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Seqüencial'                                                 , 'N' );
  InsereCampo( cEmpExtExpMesRef                ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Mês de Referência'                                          , 'N' );
  InsereCampo( cEmpExtExpMesCobranca           ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Mês de Cobrança'                                            , 'N' );
  InsereCampo( cEmpExtExpDtVenc                ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Data de Vencimento'                                         , 'N' );
  InsereCampo( cEmpExtExpDtPagto               ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Data de Pagamento'                                          , 'N' );
  InsereCampo( cEmpExtExpValorCalculado        ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Valor Calculado'                                            , 'N' );
  InsereCampo( cEmpExtExpValorEfetivo          ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Valor Efetivo'                                              , 'N' );
  InsereCampo( cEmpExtExpSaldoDevedor          ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Saldo Devedor'                                              , 'N' );
  InsereCampo( cEmpConsNumContrato             ,                         0 ,            pEmpDadosContrato , 'Número do Contrato'                                         , 'N' );
  InsereCampo( cEmpConsSituacao                ,                         0 ,            pEmpDadosContrato , 'Situação do Contrato'                                       , 'N' );
  InsereCampo( cEmpConsPlano                   ,                         0 ,            pEmpDadosContrato , 'Plano'                                                      , 'N' );
  InsereCampo( cEmpConsPatrocinadora           ,                         0 ,            pEmpDadosContrato , 'Patrocinadora'                                              , 'N' );
  InsereCampo( cEmpConsTipoContrato            ,                         0 ,            pEmpDadosContrato , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpConsTipoEmprestimo          ,                         0 ,            pEmpDadosContrato , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpConsQtdeParcCont            ,                         0 ,            pEmpDadosContrato , 'Quantidade de Parcelas Contratadas'                         , 'N' );
  InsereCampo( cEmpConsDtAssinatura            ,                         0 ,            pEmpDadosContrato , 'Data de Assinatura'                                         , 'N' );
  InsereCampo( cEmpConsDtInscricao             ,                         0 ,            pEmpDadosContrato , 'Data de Inscrição'                                          , 'N' );
  InsereCampo( cEmpConsDtCredito               ,                         0 ,            pEmpDadosContrato , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpConsDt1Parcela              ,                         0 ,            pEmpDadosContrato , 'Data da 1a. Parcela'                                        , 'N' );
  InsereCampo( cEmpConsDtCancelamento          ,                         0 ,            pEmpDadosContrato , 'Data de Cancelamento'                                       , 'N' );
  InsereCampo( cEmpConsVlContratado            ,                         0 ,            pEmpDadosContrato , 'Valor Contratado'                                           , 'N' );
  InsereCampo( cEmpConsTaxaJuros               ,                         0 ,            pEmpDadosContrato , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpConsVlFGQC                  ,                         0 ,            pEmpDadosContrato , 'Valor de FGQC*'                                              , 'N' );
  InsereCampo( cEmpConsVlParcela               ,                         0 ,            pEmpDadosContrato , 'Valor da Parcela Base'                                      , 'N' );
  InsereCampo( cEmpConsContrTotalParcelas      ,                         0 ,            pEmpConsContratos , 'Quantidade de Parcelas Contratadas'                         , 'N' );
  InsereCampo( cEmpConsContrDtAssinatura       ,                         0 ,            pEmpConsContratos , 'Data de Assinatura'                                         , 'N' );
  InsereCampo( cEmpConsInscEmp                 ,                         0 ,            pEmpDadosContrato , 'Inscrição no Empréstimo'                                    , 'N' );
  InsereCampo( cTrPlDadosPlanoAtual            ,                         0 ,              pTpSelecaoPlano , 'Dados do plano atual'                                       , 'N' );
  InsereCampo( cTrPlMatricula                  ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Matrícula'                                                  , 'N' );
  InsereCampo( cTrPlPatrocinadora              ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Patrocinadora'                                              , 'N' );
  InsereCampo( cTrPlPlanoOrigem                ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Plano de Origem'                                            , 'N' );
  InsereCampo( cTrPlDtInscricao                ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Data de Inscrição'                                          , 'N' );
  InsereCampo( cTrPlDtBase                     ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Data Base para Dados'                                       , 'N' );
  InsereCampo( cTrPlSitFundacao                ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Situação na Fundação'                                       , 'N' );
  InsereCampo( cTrPlDtTransacao                ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Data da Transação'                                          , 'N' );
  InsereCampo( cTrPlRecebBenef                 ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Recebendo benefício?'                                       , 'N' );
  InsereCampo( cTrPlDtSimulacao                ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Data de Simulação'                                          , 'N' );
  InsereCampo( cTrPlDtFalecimento              ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Data de Falecimento'                                        , 'N' );
  InsereCampo( cTrPlNomeBenef                  ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Nome do Benefício'                                          , 'N' );
  InsereCampo( cTrPlSitBenef                   ,      cTrPlDadosPlanoAtual ,              pTpSelecaoPlano , 'Situação do Benefício'                                      , 'N' );
  InsereCampo( cTmpSrvFator                    ,             cTmpSrvTabela ,              pTempoDeServico , 'Fator'                                                      , 'N' );
  InsereCampo( cEmpSimParDtCredito             ,                         0 ,           pEmpParamSimulacao , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpSimParDt1aParcela           ,                         0 ,           pEmpParamSimulacao , 'Data da 1a. Parcela'                                        , 'N' );
  InsereCampo( cEmpSimParTipoContrato          ,                         0 ,           pEmpParamSimulacao , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpSimParTipoEmprestimo        ,                         0 ,           pEmpParamSimulacao , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpSimParCarencia              ,                         0 ,           pEmpParamSimulacao , 'Carência'                                                   , 'N' );
  InsereCampo( cEmpSimParSaldoAQuitar          ,                         0 ,           pEmpParamSimulacao , 'Saldo a Quitar'                                             , 'N' );
  InsereCampo( cEmpSimParMinimoParcelas        ,                         0 ,           pEmpParamSimulacao , 'Mínimo de Parcelas'                                         , 'N' );
  InsereCampo( cEmpSimParMaximoParcelas        ,                         0 ,           pEmpParamSimulacao , 'Máximo de Parcelas'                                         , 'N' );
  InsereCampo( cEmpSimParSalarioBase           ,                         0 ,           pEmpParamSimulacao , 'Salário Base'                                               , 'N' );
  InsereCampo( cEmpSimParMargemConsignavel     ,                         0 ,           pEmpParamSimulacao , 'Margem Consignável'                                         , 'N' );
  InsereCampo( cEmpSimParReservaPoupanca       ,                         0 ,           pEmpParamSimulacao , 'Reserva de Poupança'                                        , 'N' );
  InsereCampo( cEmpSimParTaxaJuros             ,                         0 ,           pEmpParamSimulacao , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpSimParValorMaximo           ,                         0 ,           pEmpParamSimulacao , 'Valor Máximo Permitido'                                     , 'N' );
  //Pendência 24902 - 24/05/2007
  InsereCampo( cEmpSimParValorSolicitado       ,                         0 ,           pEmpParamSimulacao , 'Valor Solicitado'                                           , 'N' );
  InsereCampo( cEmpValorMaximo                 ,                         0 ,                 pEmpParcelas , 'Valor Máximo Permitido'                                     , 'N' );
  InsereCampo( cEmpValorSolicitado             ,                         0 ,                 pEmpParcelas , 'Valor Solicitado'                                           , 'N' );
  //Fim Pendência 24902
  InsereCampo( cEmpInscPatro                   ,                         0 ,              pEmpParamEmptmo , 'Patrocinadora'                                              , 'N' );
  InsereCampo( cEmpInscPlano                   ,                         0 ,              pEmpParamEmptmo , 'Plano'                                                      , 'N' );
  InsereCampo( cEmpInscTpContrato              ,                         0 ,              pEmpParamEmptmo , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpInscTpEmprestimo            ,                         0 ,              pEmpParamEmptmo , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpInscDtCredito               ,                         0 ,              pEmpParamEmptmo , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpInscDtInscricao             ,                         0 ,              pEmpParamEmptmo , 'Data de Inscrição'                                          , 'N' );
  InsereCampo( cEmpInscContaBancariaPag        ,                         0 ,              pEmpParamEmptmo , 'Conta Bancária de Recebimento da Concessão'                 , 'N' );
  InsereCampo( cEmpInscFormaRecto              ,                         0 ,              pEmpParamEmptmo , 'Forma de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpInscFormaPagto              ,                         0 ,              pEmpParamEmptmo , 'Forma de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpInscContaBancariaRec        ,                         0 ,              pEmpParamEmptmo , 'Conta Bancária de Pagamento das Prestações'                 , 'N' );
  InsereCampo( cEmpExtExpTxJuros               ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpExtAgrTabela                ,                         0 ,    pEmpExtratoAgrEmprestimos , 'Tabela de Saldo de Empréstimos'                             , 'N' );
  InsereCampo( cEmpExtAgrNumContrato           ,                         0 ,    pEmpExtratoAgrEmprestimos , 'Número do Contrato'                                         , 'N' );
  InsereCampo( cEmpExtAgrEvento                ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Evento'                                                     , 'N' );
  InsereCampo( cEmpExtAgrItem                  ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Item'                                                       , 'N' );
  InsereCampo( cEmpExtAgrParcela               ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Parcela'                                                    , 'N' );
  InsereCampo( cEmpExtAgrSequencial            ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Seqüencial'                                                 , 'N' );
  InsereCampo( cEmpExtAgrMesRef                ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Mês de Referência'                                          , 'N' );
  InsereCampo( cEmpExtAgrMesCobranca           ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Mês de Cobrança'                                            , 'N' );
  InsereCampo( cEmpExtAgrDtVenc                ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Data de Vencimento'                                         , 'N' );
  InsereCampo( cEmpExtAgrDtPagto               ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Data de Pagamento'                                          , 'N' );
  InsereCampo( cEmpExtAgrValorCalculado        ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Valor Calculado'                                            , 'N' );
  InsereCampo( cEmpExtAgrValorEfetivo          ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Valor Efetivo'                                              , 'N' );
  InsereCampo( cEmpExtAgrSaldoDevedor          ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Saldo Devedor'                                              , 'N' );
  InsereCampo( cEmpExtAgrTxJuros               ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpConsContrDtInscricao        ,                         0 ,            pEmpConsContratos , 'Data de Inscrição'                                          , 'N' );
  InsereCampo( cEmpConsContrDtCredito          ,                         0 ,            pEmpConsContratos , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpConsContrDt1aParcela        ,                         0 ,            pEmpConsContratos , 'Data da 1a. Parcela'                                        , 'N' );
  InsereCampo( cEmpConsContrDtCancelamento     ,                         0 ,            pEmpConsContratos , 'Data de Cancelamento'                                       , 'N' );
  InsereCampo( cEmpConsContrValorContratado    ,                         0 ,            pEmpConsContratos , 'Valor Contratado'                                           , 'N' );
  InsereCampo( cEmpConsContrTaxaJuros          ,                         0 ,            pEmpConsContratos , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpConsContrValorParcela       ,                         0 ,            pEmpConsContratos , 'Valor da Parcela Base'                                      , 'N' );
  InsereCampo( cEmpConsContrInscricao          ,                         0 ,            pEmpConsContratos , 'Inscrição no Empréstimo'                                    , 'N' );
  InsereCampo( cEmpConsInscDetTpEmprestimo     ,                         0 ,           pEmpDadosInscricao , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpConsInscDetTpContrato       ,                         0 ,           pEmpDadosInscricao , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpConsInscDetPatro            ,                         0 ,           pEmpDadosInscricao , 'Patrocinadora'                                              , 'N' );
  InsereCampo( cEmpConsInscDetPlano            ,                         0 ,           pEmpDadosInscricao , 'Plano'                                                      , 'N' );
  InsereCampo( cEmpConsInscDetFormaPagto       ,                         0 ,           pEmpDadosInscricao , 'Forma de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpConsInscDetFormaRecto       ,                         0 ,           pEmpDadosInscricao , 'Forma de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpConsInscDetContaBancariaP   ,                         0 ,           pEmpDadosInscricao , 'Conta de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpConsInscDetNumParcelas      ,                         0 ,           pEmpDadosInscricao , 'Número de Parcelas'                                         , 'N' );
  InsereCampo( cEmpConsInscDetMoeda            ,                         0 ,           pEmpDadosInscricao , 'Moeda'                                                      , 'N' );
  InsereCampo( cEmpConsInscDetDataCredito      ,                         0 ,           pEmpDadosInscricao , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpConsInscDetVlSolicitado     ,                         0 ,           pEmpDadosInscricao , 'Valor Solicitado'                                           , 'N' );
  InsereCampo( cEmpConsInscDetNumInscricao     ,                         0 ,           pEmpDadosInscricao , 'Número da Inscrição'                                        , 'N' );
  InsereCampo( cEmpConsInscTpEmprestimo        ,                         0 ,           pEmpConsInscricoes , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpConsInscTpContrato          ,                         0 ,           pEmpConsInscricoes , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpConsInscFormaPagto          ,                         0 ,           pEmpConsInscricoes , 'Forma de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpConsInscFormaRecto          ,                         0 ,           pEmpConsInscricoes , 'Forma de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpConsInscContaBancariaPag    ,                         0 ,           pEmpConsInscricoes , 'Conta de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpConsInscNumeroParcelas      ,                         0 ,           pEmpConsInscricoes , 'Número de Parcelas'                                         , 'N' );
  InsereCampo( cEmpConsInscMoeda               ,                         0 ,           pEmpConsInscricoes , 'Moeda'                                                      , 'N' );
  InsereCampo( cEmpConsInscDataCredito         ,                         0 ,           pEmpConsInscricoes , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpConsInscVlSolicitado        ,                         0 ,           pEmpConsInscricoes , 'Valor Solicitado'                                           , 'N' );
  InsereCampo( cEmpConsInscNumInscricao        ,                         0 ,           pEmpConsInscricoes , 'Número da Inscrição'                                        , 'N' );
  InsereCampo( cEmpInscNumeroInscricao         ,                         0 ,              pEmpParamEmptmo , 'Número da Inscrição'                                        , 'N' );
  InsereCampo( cEmpInscValorSolicitado         ,                         0 ,              pEmpParamEmptmo , 'Valor Solicitado'                                           , 'N' );
  InsereCampo( cEmpInscNumParcelas             ,                         0 ,              pEmpParamEmptmo , 'Número de Parcelas'                                         , 'N' );
  InsereCampo( cEmpInscMoeda                   ,                         0 ,              pEmpParamEmptmo , 'Moeda'                                                      , 'N' );
  InsereCampo( cEmpConsInscDtInscricao         ,                         0 ,           pEmpConsInscricoes , 'Data da Inscrição'                                          , 'N' );
  InsereCampo( cEmpConsInscDetDtInscricao      ,                         0 ,           pEmpDadosInscricao , 'Data da Inscrição'                                          , 'N' );
  InsereCampo( cEmpConsInscSit                 ,                         0 ,           pEmpConsInscricoes , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpConsInscViaWeb              ,                         0 ,           pEmpConsInscricoes , 'Inscrito via Internet?'                                     , 'N' );
  InsereCampo( cEmpConsInscDetSit              ,                         0 ,           pEmpDadosInscricao , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpConsInscDetViaWeb           ,                         0 ,           pEmpDadosInscricao , 'Inscrito via Internet?'                                     , 'N' );
  InsereCampo( cEmpConsInscDetDadosItens       ,                         0 ,           pEmpDadosInscricao , 'Itens da inscrição'                                         , 'N' );
  InsereCampo( cEmpInscTxJuros                 ,                         0 ,              pEmpParamEmptmo , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpConsInscDetTxJuros          ,                         0 ,           pEmpDadosInscricao , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpConsInscContaBancariaRec    ,                         0 ,           pEmpConsInscricoes , 'Conta de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpConsInscDetContaBancariaR   ,                         0 ,           pEmpDadosInscricao , 'Conta de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cTelCom                         ,                cTelefones ,         pDadosDoParticipante , 'Comercial'                                                  , 'N' );
  InsereCampo( cTelPar                         ,                cTelefones ,         pDadosDoParticipante , 'Particular'                                                 , 'N' );
  InsereCampo( cTelFax                         ,                cTelefones ,         pDadosDoParticipante , 'Fax'                                                        , 'N' );
  InsereCampo( cTelCel                         ,                cTelefones ,         pDadosDoParticipante , 'Celular'                                                    , 'N' );
  InsereCampo( cTelRec                         ,                cTelefones ,         pDadosDoParticipante , 'Recado'                                                     , 'N' );
  InsereCampo( cPais                           ,                cEnderecos ,         pDadosDoParticipante , 'País do Endereço do Participante'                           , 'N' );
  InsereCampo( cAltEndPais                     ,                         0 ,              pManutEnderecos , 'País do Endereço do Participante'                           , 'N' );
  InsereCampo( cDetPlano                       ,           cDetalhesEvento , pDadosEventosPrevidenciarios , 'Plano'                                                      , 'N' );
  InsereCampo( cEmpExtExpSituacao              ,                         0 ,    pEmpExtratoExpEmprestimos , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpExtAgrSituacao              ,                         0 ,    pEmpExtratoAgrEmprestimos , 'Situação'                                                   , 'N' );
  InsereCampo( cSaldoDataRef                   ,     cTabelaSaldoDeReserva ,              pSaldoDeReserva , 'Data de Referência'                                         , 'N' );
  InsereCampo( cSaldoReserva                   ,                         0 ,              pSaldoDeReserva , 'Saldo das Reservas'                                         , 'N' );
  InsereCampo( cEmpSimNumParcSimulaveis        ,                         0 ,           pEmpParamSimulacao , 'Parcelas a Simular'                                         , 'N' );
  InsereCampo( cEmpSimSelecTodasParc           ,  cEmpSimNumParcSimulaveis ,           pEmpParamSimulacao , 'Selecionar todas'                                           , 'N' );
  InsereCampo( cEmpSimCPF                      ,                         0 ,           pEmpParamSimulacao , 'CPF'                                                        , 'N' );
  InsereCampo( cEmpInscBeneficiarioContrato    ,                         0 ,             pEmpParamEmptmo  , 'Beneficiários e percentuais do benefício'                   , 'N' );
  InsereCampo( cEmpInscAvalistaContrato        ,                         0 ,             pEmpParamEmptmo  , 'Avalista'                                                   , 'N' );
  InsereCampo( cEmpInscConfTpEmprestimo        ,                         0 ,                pEmpInscricao , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpInscConfTpContrato          ,                         0 ,                pEmpInscricao , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpInscConfPatro               ,                         0 ,                pEmpInscricao , 'Patrocinadora'                                              , 'N' );
  InsereCampo( cEmpInscConfPlano               ,                         0 ,                pEmpInscricao , 'Plano'                                                      , 'N' );
  InsereCampo( cEmpInscConfFormaPagto          ,                         0 ,                pEmpInscricao , 'Forma de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpInscConfFormaRecto          ,                         0 ,                pEmpInscricao , 'Forma de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpInscConfContaBancariaP      ,                         0 ,                pEmpInscricao , 'Conta de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpInscConfNumParcelas         ,                         0 ,                pEmpInscricao , 'Número de Parcelas'                                         , 'N' );
  InsereCampo( cEmpInscConfMoeda               ,                         0 ,                pEmpInscricao , 'Moeda'                                                      , 'N' );
  InsereCampo( cEmpInscConfDataCredito         ,                         0 ,                pEmpInscricao , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpInscConfVlSolicitado        ,                         0 ,                pEmpInscricao , 'Valor Solicitado'                                           , 'N' );
  InsereCampo( cEmpInscConfNumInscricao        ,                         0 ,                pEmpInscricao , 'Número da Inscrição'                                        , 'N' );
  InsereCampo( cEmpInscConfDtInscricao         ,                         0 ,                pEmpInscricao , 'Data da Inscrição'                                          , 'N' );
  InsereCampo( cEmpInscConfSit                 ,                         0 ,                pEmpInscricao , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpInscConfViaWeb              ,                         0 ,                pEmpInscricao , 'Inscrito via Internet?'                                     , 'N' );
  InsereCampo( cEmpInscConfDadosItens          ,                         0 ,                pEmpInscricao , 'Itens da Inscrição'                                         , 'N' );
  InsereCampo( cEmpInscConfTxJuros             ,                         0 ,                pEmpInscricao , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpInscConfContaBancariaR      ,                         0 ,                pEmpInscricao , 'Conta de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpInscConfAvalista            ,                         0 ,                pEmpInscricao , 'Avalista'                                                   , 'N' );
  InsereCampo( cEmpInscConfBeneficiarios       ,                         0 ,                pEmpInscricao , 'Beneficiários'                                              , 'N' );
  InsereCampo( cEmpContrConfTpEmprestimo       ,                         0 ,              pEmpContratacao , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpContrConfTpContrato         ,                         0 ,              pEmpContratacao , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpContrConfPatro              ,                         0 ,              pEmpContratacao , 'Patrocinadora'                                              , 'N' );
  InsereCampo( cEmpContrConfPlano              ,                         0 ,              pEmpContratacao , 'Plano'                                                      , 'N' );
  InsereCampo( cEmpContrConfFormaPagto         ,                         0 ,              pEmpContratacao , 'Forma de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpContrConfFormaRecto         ,                         0 ,              pEmpContratacao , 'Forma de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpContrConfContaBancariaP     ,                         0 ,              pEmpContratacao , 'Conta de Recebimento da Concessão'                          , 'N' );
  InsereCampo( cEmpContrConfNumParcelas        ,                         0 ,              pEmpContratacao , 'Número de Parcelas'                                         , 'N' );
  InsereCampo( cEmpContrConfMoeda              ,                         0 ,              pEmpContratacao , 'Moeda'                                                      , 'N' );
  InsereCampo( cEmpContrConfDataCredito        ,                         0 ,              pEmpContratacao , 'Data de Crédito'                                            , 'N' );
  InsereCampo( cEmpContrConfVlSolicitado       ,                         0 ,              pEmpContratacao , 'Valor Solicitado'                                           , 'N' );
  InsereCampo( cEmpContrConfNumInscricao       ,                         0 ,              pEmpContratacao , 'Número da Inscrição'                                        , 'N' );
  InsereCampo( cEmpContrConfNumContrato        ,                         0 ,              pEmpContratacao , 'Número do Contrato'                                         , 'N' );
  InsereCampo( cEmpContrConfDtInscricao        ,                         0 ,              pEmpContratacao , 'Data da Inscrição'                                          , 'N' );
  InsereCampo( cEmpContrConfSit                ,                         0 ,              pEmpContratacao , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpContrConfViaWeb             ,                         0 ,              pEmpContratacao , 'Inscrito via Internet?'                                     , 'N' );
  InsereCampo( cEmpContrConfDadosItens         ,                         0 ,              pEmpContratacao , 'Itens da Contratação'                                       , 'N' );
  InsereCampo( cEmpContrConfTxJuros            ,                         0 ,              pEmpContratacao , 'Taxa de Juros'                                              , 'N' );
  InsereCampo( cEmpContrConfContaBancariaR     ,                         0 ,              pEmpContratacao , 'Conta de Pagamento das Prestações'                          , 'N' );
  InsereCampo( cEmpContrConfAvalista           ,                         0 ,              pEmpContratacao , 'Avalista'                                                   , 'N' );
  InsereCampo( cEmpContrConfBeneficiarios      ,                         0 ,              pEmpContratacao , 'Beneficiários'                                              , 'N' );
  InsereCampo( cEmpContrParamConsNumero        ,                         0 ,          pEmpParConsContrato , 'Número do contrato'                                         , 'N' );
  InsereCampo( cEmpContrParamConsSituacao      ,                         0 ,          pEmpParConsContrato , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpContrParamConsTpEmpto       ,                         0 ,          pEmpParConsContrato , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpContrParamConsTpContrEmptmo ,                         0 ,          pEmpParConsContrato , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpExtratoParamNumero          ,                         0 ,         pEmpParExtratoEmptmo , 'Número do contrato'                                         , 'N' );
  InsereCampo( cEmpExtratoParamSituacao        ,                         0 ,         pEmpParExtratoEmptmo , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpExtratoParamTpEmpto         ,                         0 ,         pEmpParExtratoEmptmo , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpExtratoParamTpContrEmptmo   ,                         0 ,         pEmpParExtratoEmptmo , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpInscrParamConsNumero        ,                         0 ,         pEmpParConsInscricao , 'Número do contrato'                                         , 'N' );
  InsereCampo( cEmpInscrParamConsSituacao      ,                         0 ,         pEmpParConsInscricao , 'Situação'                                                   , 'N' );
  InsereCampo( cEmpInscrParamConsTpEmpto       ,                         0 ,         pEmpParConsInscricao , 'Tipo de Empréstimo'                                         , 'N' );
  InsereCampo( cEmpInscrParamConsTpContrEmptmo ,                         0 ,         pEmpParConsInscricao , 'Tipo de Contrato'                                           , 'N' );
  InsereCampo( cEmpExtAgrSitParcela            ,          cEmpExtAgrTabela ,    pEmpExtratoAgrEmprestimos , 'Situação da Parcela'                                        , 'N' );
  InsereCampo( cEmpExtExpSitParcela            ,          cEmpExtExpTabela ,    pEmpExtratoExpEmprestimos , 'Situação da Parcela'                                        , 'N' );
  InsereCampo( cAltTelLogradouro               ,                         0 ,              pManutTelefones , 'Logradouro'                                                 , 'N' );
  InsereCampo( cAltTelDDI                      ,                         0 ,              pManutTelefones , 'DDI'                                                        , 'N' );
  InsereCampo( cAltTelDDD                      ,                         0 ,              pManutTelefones , 'DDD'                                                        , 'N' );
  InsereCampo( cAltTelNumero                   ,                         0 ,              pManutTelefones , 'Número'                                                     , 'N' );
  InsereCampo( cAltTelComercial                ,                         0 ,              pManutTelefones , 'Comercial'                                                  , 'N' );
  InsereCampo( cAltTelParticular               ,                         0 ,              pManutTelefones , 'Particular'                                                 , 'N' );
  InsereCampo( cAltTelFax                      ,                         0 ,              pManutTelefones , 'Fax'                                                        , 'N' );
  InsereCampo( cAltTelCelular                  ,                         0 ,              pManutTelefones , 'Celular'                                                    , 'N' );
  InsereCampo( cAltTelRecado                   ,                         0 ,              pManutTelefones , 'Recado'                                                     , 'N' );
  InsereCampo( cSitAtuBenefTblNumProcCM        ,                         0 ,         pSitAtualBenefTabela , 'Num. Proc. CM'                                              , 'N' );
  InsereCampo( cSitAtuBenefTblNumProcINSS      ,                         0 ,         pSitAtualBenefTabela , 'Num. Proc. INSS'                                            , 'N' );
  InsereCampo( cSitAtuBenefTblNome             ,                         0 ,         pSitAtualBenefTabela , 'Benefício'                                                  , 'N' );
  InsereCampo( cSitAtuBenefTblSitBenef         ,                         0 ,         pSitAtualBenefTabela , 'Situação'                                                   , 'N' );
  InsereCampo( cSitAtuBenefTblTipoPagto        ,                         0 ,         pSitAtualBenefTabela , 'Tipo de Pagamento'                                          , 'N' );
  InsereCampo( cSitAtuBenefTblFormaPagto       ,                         0 ,         pSitAtualBenefTabela , 'Forma de Pagamento'                                         , 'N' );
  InsereCampo( cSitAtuBenefTblDtInicioPgto     ,                         0 ,         pSitAtualBenefTabela , 'Dt. Inicio Pgto.'                                           , 'N' );
  InsereCampo( cSitAtuBenefTblDtFinalPgtoEfet  ,                         0 ,         pSitAtualBenefTabela , 'Dt. Final Pgto.'                                            , 'N' );
  InsereCampo( cSitAtuBenefTblDtRequerimento   ,                         0 ,         pSitAtualBenefTabela , 'Dt. Requerimento'                                           , 'N' );
  InsereCampo( cSitAtuBenefDetNumProcCM        ,                         0 ,       pSitAtualBenefDetalhes , 'Número do Proc. CM'                                         , 'N' );
  InsereCampo( cSitAtuBenefDetNumProcINSS      ,                         0 ,       pSitAtualBenefDetalhes , 'Número do Proc. no INSS'                                    , 'N' );
  InsereCampo( cSitAtuBenefDetNome             ,                         0 ,       pSitAtualBenefDetalhes , 'Benefício'                                                  , 'N' );
  InsereCampo( cSitAtuBenefDetSitBenef         ,                         0 ,       pSitAtualBenefDetalhes , 'Situação'                                                   , 'N' );
  InsereCampo( cSitAtuBenefDetNumPrcINSSBenAnt ,                         0 ,       pSitAtualBenefDetalhes , 'Proc. INSS Benef. Ant.'                                     , 'N' );
  InsereCampo( cSitAtuBenefDetPercGrFamBenAnt  ,                         0 ,       pSitAtualBenefDetalhes , 'Perc. Gr. Fam. Benef. Ant.'                                 , 'N' );
  InsereCampo( cSitAtuBenefDetVlBenefInicial   ,                         0 ,       pSitAtualBenefDetalhes , 'Valor Benef. Inicial'                                       , 'N' );
  InsereCampo( cSitAtuBenefDetPercGrpFamiliar  ,                         0 ,       pSitAtualBenefDetalhes , 'Perc. Grupo Familiar'                                       , 'N' );
  InsereCampo( cSitAtuBenefDetTipoPagto        ,                         0 ,       pSitAtualBenefDetalhes , 'Tipo de Pagamento'                                          , 'N' );
  InsereCampo( cSitAtuBenefDetFormaPagto       ,                         0 ,       pSitAtualBenefDetalhes , 'Forma de Pagamento'                                         , 'N' );
  InsereCampo( cSitAtuBenefDetDtInicioPgto     ,                         0 ,       pSitAtualBenefDetalhes , 'Dt. Inicio Pgto.'                                           , 'N' );
  InsereCampo( cSitAtuBenefDetDtFinalPgtoEfet  ,                         0 ,       pSitAtualBenefDetalhes , 'Dt. Final Pgto. Efetivo'                                    , 'N' );
  InsereCampo( cSitAtuBenefDetDtFinalPgtoPrev  ,                         0 ,       pSitAtualBenefDetalhes , 'Dt. Final Pgto. Previsto'                                   , 'N' );
  InsereCampo( cSitAtuBenefDetDtRequerimento   ,                         0 ,       pSitAtualBenefDetalhes , 'Dt. Requerimento'                                           , 'N' );
  InsereCampo( cSitAtuBenefDetDtConcessao      ,                         0 ,       pSitAtualBenefDetalhes , 'Dt. Concessão'                                              , 'N' );
  InsereCampo( cSitAtuBenefDetInicioFund       ,                         0 ,       pSitAtualBenefDetalhes , 'Início na Fundação'                                         , 'N' );
  InsereCampo( cSitAtuBenefDetVlAtual          ,                         0 ,       pSitAtualBenefDetalhes , 'Valor Atual'                                                , 'N' );
  InsereCampo( cSitAtuBenefDetVlCalculado      ,                         0 ,       pSitAtualBenefDetalhes , 'Valor Calculado'                                            , 'N' );
  InsereCampo( cSitAtuBenefDetVlSRB            ,                         0 ,       pSitAtualBenefDetalhes , 'Valor SRB'                                                  , 'N' );
  InsereCampo( cSitAtuBenefDetPreparadoAte     ,                         0 ,       pSitAtualBenefDetalhes , 'Preparado até'                                              , 'N' );
  InsereCampo( cSitAtuBenefDetReajustadoAte    ,                         0 ,       pSitAtualBenefDetalhes , 'Reajustado até'                                             , 'N' );
  InsereCampo( cSitAtuBenefDetVlOpcao1         ,                         0 ,       pSitAtualBenefDetalhes , 'Valor opção 1'                                              , 'N' );
  InsereCampo( cSitAtuBenefDetVlOpcao2         ,                         0 ,       pSitAtualBenefDetalhes , 'Valor opção 2'                                              , 'N' );
  InsereCampo( cSitAtuBenefDetVlOpcao3         ,                         0 ,       pSitAtualBenefDetalhes , 'Valor opção 3'                                              , 'N' );
  InsereCampo( cSitAtuBenefDetVlCalcINSS       ,                         0 ,       pSitAtualBenefDetalhes , 'Valor Calculado do INSS'                                    , 'N' );
  InsereCampo( cSitAtuBenefDetInicioINSS       ,                         0 ,       pSitAtualBenefDetalhes , 'Início no INSS'                                             , 'N' );
  InsereCampo( cSitAtuBenefDetVlInfINSS        ,                         0 ,       pSitAtualBenefDetalhes , 'Valor Inf. INSS Ant.'                                       , 'N' );
  InsereCampo( cSitAtuBenefDetIniBenefAnt      ,                         0 ,       pSitAtualBenefDetalhes , 'Início Benef. Anterior'                                     , 'N' );
  InsereCampo( cSitAtuBenefDetValBenefAnt      ,                         0 ,       pSitAtualBenefDetalhes , 'Valor Benef. Anterior'                                      , 'N' );
  InsereCampo( cSitAtuBenefDetBenefProvisorio  ,                         0 ,       pSitAtualBenefDetalhes , 'Benefício Provisório'                                       , 'N' );
  InsereCampo( cSitAtuBenefDetPossuiAcompINSS  ,                         0 ,       pSitAtualBenefDetalhes , 'Possui Acomp. INSS'                                         , 'N' );

  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  InsereCampo( cTabelaTempoServico             ,                         0 , pTempoServicoConsulta            , 'Tempo de serviço (Tabela)'                              , 'N' );
  InsereCampo( cEmpresa                        ,                         0 , pTempoServicoConsulta            , 'Empresa'                                                , 'N' );
  InsereCampo( cDataInicial                    ,                         0 , pTempoServicoConsulta            , 'Data Inicial'                                           , 'N' );
  InsereCampo( cDataFinal                      ,                         0 , pTempoServicoConsulta            , 'Data Final'                                             , 'N' );
  //BRUNO AZEVEDO SOL 124251 KINTANA 651677
  
  //Cria e inicializa os CtrlObjects
  WebPaginaCampo   := TCtrlWebPaginaCampo.Create;
  WebPaginaCampo.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebInterface := TCtrlWebInterface.Create;
  WebInterface.InitializeAs( WebPaginaCampo );

  WebTpUsuPagina := TCtrlWebTpUsuPagina.Create;
  WebTpUsuPagina.InitializeAs( WebPaginaCampo );

  WebTpUsuCampo := TCtrlWebTpUsuCampo.Create;
  WebTpUsuCampo.InitializeAs( WebPaginaCampo );


  //Carrega os dados das páginas e campos incluídos
  cdsWebPagina.Data := WebPaginaCampo.SelecionaPaginas;
  cdsWebCampo.Data  := WebPaginaCampo.SelecionaCampos;

  //Cria classe dos dataset;
  TpUsuPaginaCampo := TTpUsuPaginaCampo.Create;

  iQtde := 0;

  //Varre o vetor de páginas e inclui na StringGrid as que não estão cadastradas
  bPrimeiro := True;
  for i := 0 to High( aPaginas ) do
  begin
    if not cdsWebPagina.Locate( 'IDPAGINA', IntToStr( aPaginas[i].iIDPAGINA ), [] ) then
    begin
      if bPrimeiro then
      begin
        grdPaginas.RowCount  := 2;
        grdPaginas.FixedRows := 1;
        grdPaginas.Cells[0,0] := 'Título';
        bPrimeiro := False;
      end
      else
        grdPaginas.RowCount  := grdPaginas.RowCount + 1;

      grdPaginas.Cells[0,grdPaginas.RowCount-1] := aPaginas[i].sDESCPAGINA;
      Inc( iQtde );
    end;
  end;
  lblQtdePagNovas.Caption := IntToStr( grdPaginas.RowCount - 1 );
  if ( grdPaginas.RowCount - 1 ) = 0 then
    lblMsgPaginas.Caption := 'Não há páginas novas.'
  else
    lblMsgPaginas.Caption := 'As seguintes páginas foram criadas mas ainda não encontram-se no banco de dados.';


  //Varre o vetor de campos e inclui na StringGrid os que não estão cadastrados
  bPrimeiro := True;
  for i := 0 to High( aCampos ) do
  begin
    if not cdsWebCampo.Locate( 'IDCAMPO', IntToStr( aCampos[i].iIDCAMPO ), [] ) then
    begin
      if bPrimeiro then
      begin
        grdCampos.RowCount  := 2;
        grdCampos.FixedRows := 1;
        grdCampos.Cells[0,0] := 'Título';
        grdCampos.Cells[1,0] := 'Página';
        bPrimeiro := False;
      end
      else
        grdCampos.RowCount  := grdCampos.RowCount + 1;


      grdCampos.Cells[0,grdCampos.RowCount-1] := aCampos[i].sDESCCAMPO;
      grdCampos.Cells[1,grdCampos.RowCount-1] := aPaginas[LocalizaPagina( aCampos[i].iIDPAGINA )].sDESCPAGINA;
      Inc( iQtde );
    end;
  end;
  lblQtdeCamNovos.Caption := IntToStr( grdCampos.RowCount - 1 );
  if ( grdCampos.RowCount - 1 ) = 0 then
    lblMsgCampos.Caption := 'Não há campos novos.'
  else
    lblMsgCampos.Caption := 'Os seguintes campos foram criados mas ainda não encontram-se no banco de dados.';

  //Habilita o botão de [Ok] se houver algum dado a ser incluído
  bbtnConfirmar.Enabled := ( ( grdPaginas.RowCount - 1 ) > 0 ) or ( ( grdCampos.RowCount - 1 ) > 0 );

end; {FormCreate}


//Localiza uma página em seu vetor, retornando o índice
function TfrmGeraPaginasCampos.LocalizaPagina(iIDPAGINA: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to High( aPaginas ) do
  begin
    if aPaginas[i].iIDPAGINA = iIDPAGINA then
    begin
      Result := i;
      Break;
    end     
  end;
end; {LocalizaPagina}

procedure TfrmGeraPaginasCampos.bbtnConfirmarClick(Sender: TObject);
var
  i, j : integer;
  sDir : string;
begin
  inherited;

  if iQtde = 0 then exit;

  ProgressBar.Max := iQtde;

  cdsWebInterface.Data   := WebInterface.SelecionaTodos;
  //Varre o vetor de páginas e inclui no banco as que não estão cadastradas
  for i := 0 to High( aPaginas ) do
  begin
    if not cdsWebPagina.Locate( 'IDPAGINA', IntToStr( aPaginas[i].iIDPAGINA ), [] ) then
    begin

      cdsPaginasNovas.Close;
      cdsPaginasNovas.CreateDataSet;

      cdsPaginasNovas.Append;
      cdsPaginasNovasIDPAGINA.AsInteger      := aPaginas[i].iIDPAGINA;
      if aPaginas[i].iIDPAGINAPAI <> 0 then
        cdsPaginasNovasIDPAGINAPAI.AsInteger := aPaginas[i].iIDPAGINAPAI
      else
        cdsPaginasNovasIDPAGINAPAI.Clear;
      cdsPaginasNovasDESCPAGINA.AsString   := aPaginas[i].sDESCPAGINA;
      cdsPaginasNovasFLGSEMPREHAB.AsString := aPaginas[i].sFLGSEMPREHAB;
      cdsPaginasNovas.Post;

      if not WebPaginaCampo.IncluiPagina( cdsPaginasNovas.Data ) then
        raise Exception.Create('Não foi possível incluir a página ' + IntToStr( aPaginas[i].iIDPAGINA ) + '.' );

      for j := 1 to QtdeTiposUsuarios do
      begin
        cdsWebInterface.First;
        while not cdsWebInterface.Eof do
        begin

          cdsWebTpUsuPagina.Close;
          cdsWebTpUsuPagina.CreateDataSet;

          TpUsuPaginaCampo.Reset;
          sDir := trim( cdsWebInterface.FieldByName('DIRFISICO').AsString );
          if Copy( sDir, length(sDir), 1 ) <> '\' then sDir := sDir + '\';
          TpUsuPaginaCampo.AtualizaCaminhoPagina( sDir + 'HTML\' );

          TpUsuPaginaCampo.InserePagina( cdsWebTpUsuPagina, aPaginas[i].iIDPAGINA,
            j, cdsWebInterface.FieldByName('IDWEBINTERFACE').AsInteger );

          if not WebTpUsuPagina.IncluiPaginaNaInterface( cdsWebTpUsuPagina.Data ) then
            raise Exception.Create('Não foi possível incluir a página ' + IntToStr( aPaginas[i].iIDPAGINA ) +
             ' na interface ' + cdsWebInterface.FieldByName('IDWEBINTERFACE').AsString );

          cdsWebInterface.Next;
        end;
      end;

      ProgressBar.StepIt;
      Invalidate;
    end;
  end;


  //Varre o vetor de campos e inclui no banco as que não estão cadastrados
  for i := 0 to High( aCampos ) do
  begin
    if not cdsWebCampo.Locate( 'IDCAMPO', IntToStr( aCampos[i].iIDCAMPO ), [] ) then
    begin

      cdsCamposNovos.Close;
      cdsCamposNovos.CreateDataSet;

      cdsCamposNovos.Append;
      cdsCamposNovosIDCAMPO.AsInteger      := aCampos[i].iIDCAMPO;
      if aCampos[i].iIDCAMPOPAI <> 0 then
        cdsCamposNovosIDCAMPOPAI.AsInteger   := aCampos[i].iIDCAMPOPAI
      else
        cdsCamposNovosIDCAMPOPAI.Clear;
      cdsCamposNovosIDPAGINA.AsInteger     := aCampos[i].iIDPAGINA;
      cdsCamposNovosDESCCAMPO.AsString     := aCampos[i].sDESCCAMPO;
      cdsCamposNovosFLGSEMPREHAB.AsString  := aCampos[i].sFLGSEMPREHAB;
      cdsCamposNovos.Post;

      if not WebPaginaCampo.IncluiCampo( cdsCamposNovos.Data ) then
        raise Exception.Create('Não foi possível incluir o campo ' + IntToStr( aCampos[i].iIDCAMPO ) + '.' );

      for j := 1 to QtdeTiposUsuarios do
      begin
        cdsWebInterface.First;
        while not cdsWebInterface.Eof do
        begin

          cdsWebTpUsuCampo.Close;
          cdsWebTpUsuCampo.CreateDataSet;
          TpUsuPaginaCampo.InsereCampo( cdsWebTpUsuCampo, aCampos[i].iIDCAMPO,
            j, cdsWebInterface.FieldByName('IDWEBINTERFACE').AsInteger );

          if not WebTpUsuCampo.IncluiCampoNaInterface( cdsWebTpUsuCampo.Data ) then
            raise Exception.Create('Não foi possível incluir o campo ' + IntToStr( aCampos[i].iIDCAMPO ) +
             ' na interface ' + cdsWebInterface.FieldByName('IDWEBINTERFACE').AsString );

          cdsWebInterface.Next;

        end;
      end;

      ProgressBar.StepIt;
      Invalidate;
    end;
  end;

  cdsPaginasNovas.Close;
  cdsCamposNovos.Close;

  //Gera mensagem confirmando operação
  ShowMessage( 'Páginas e campos incluídos com sucesso.' );

  //Fecha a janela
  Close;
end; {bbtnConfirmarClick}

procedure TfrmGeraPaginasCampos.FormDestroy(Sender: TObject);
begin
  TpUsuPaginaCampo.Free;

  WebPaginaCampo.Free;
  WebInterface.Free;
  WebTpUsuPagina.Free;
  WebTpUsuCampo.Free;
  inherited;
end;

end.

