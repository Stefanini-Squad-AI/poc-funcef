//******************************************************************************
// Data      : 21/03/2007
// Código    : AL_17
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_16
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 19/03/2007
// Código    : AL_15
// Pendencia : 24775
// SOL       : 55880
// Desc      : Implementação da funcionalidade para controlar a integração do módulo de
//             Fundos de Investimentos do Módulo Contábil e Financeiro sem
//             alterar os parametros existentes.
//******************************************************************************
// Data      : 19/03/2007
// Código    : AL_14
// Desc      : Simplificação da exclusão
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_13
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_12
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_11
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 15/06/2005
// Linha(s) : Al_10
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Data     : 08/06/2005
// Linha(s) : Al_9
// Motivo   : Implementação pára guardar a data a ser usada para reprocessar fundo
//******************************************************************************
// Data     : 08/06/2005
// Linha(s) : Al_8
// Motivo   : Implementação da confirmação da exclusão
//******************************************************************************
// Data     : 08/06/2005
// Linha(s) : Al_7
// Motivo   : Implementação da exclusão de cotas da Carteira Gerencial
//******************************************************************************
// Data     : 08/06/2005
// Linha(s) : Al_6
// Motivo   : Implementação da "ExcluiLanc" e "uLancContab" para exclusão do contabil
//******************************************************************************
// Data     : 01/06/2005
// Linha(s) : Al_5
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_4
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_3
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_2
// Motivo   : Inclusão do campo DTAINIPROC na Qry e na funcao Reprocessamento
//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FCadResgFdoAnuncioProv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, StdCtrls, TREdit, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, uCtrlInvContab;

type

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double
               End;

//******************************************************************************

  TfrmCadResgFdoAnuncioProv = class(TfrmCadastroMDetInv)
    dbDDataOperacao: TCMDateTimePicker;
    Label23: TLabel;
    DbLkcFundoInvest: TwwDBLookupCombo;
    Label12: TLabel;
    DbRValorLiquido: TDBRealEdit;
    Label1: TLabel;
    DBReQtd: TDBRealEdit;
    Label2: TLabel;
    DbEdCotaResg: TDBRealEdit;
    Label4: TLabel;
    dblAcao: TwwDBLookupCombo;
    Label3: TLabel;
    dbRQuantidade: TDBRealEdit;
    Label5: TLabel;
    dbRPU: TDBRealEdit;
    Label6: TLabel;
    dbRValor: TDBRealEdit;
    dDataPrevista: TCMDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    QryFundoInvest: TwwQuery;
    QrySaldoFundoTotal: TwwQuery;
    dsSaldoFundoTotal: TwwDataSource;
    QryAux: TwwQuery;
    QryAcao: TwwQuery;
    QryOperDireitoXinv: TwwQuery;
    UpdOperDireitoXinv: TUpdateSQL;
    DsOperDireitoXinv: TwwDataSource;
    QryUpdPedido: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    QryVerDelResgate: TwwQuery;
    dRVlrTotalProv: TDBRealEdit;
    Label9: TLabel;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoFLGAGE: TStringField;
    qryTipoOperacaoFLGDATAEX: TStringField;
    qryTipoOperacaoFLGDATACOM: TStringField;
    qryTipoOperacaoFLGPRZBOLSA: TStringField;
    qryTipoOperacaoFLGPRZEMP: TStringField;
    qryTipoOperacaoFLGATADEC: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC: TStringField;
    qryTipoOperacaoFLGDIVACAO: TStringField;
    qryTipoOperacaoFLGINIPAG: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC_1: TStringField;
    qryTipoOperacaoFLGJUROS: TStringField;
    qryTipoOperacaoFLGPARIDADE: TStringField;
    qryTipoOperacaoFLGINVORIGEM: TStringField;
    qryTipoOperacaoFLGPERC: TStringField;
    qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperacaoFLGISENTOIR: TStringField;
    dblTipoOperacao: TwwDBLookupCombo;
    Label10: TLabel;
    qryUpdOperDirCtbFin: TwwQuery;
    QryBuscaInvestimento: TwwQuery;
    QryBuscaInvestimentoIDINVESTIMENTO: TFloatField;
    QryBuscaInvestimentoIDMOEDACONTAB: TFloatField;
    QryBuscaInvestimentoIDEMISSOR: TFloatField;
    QryBuscaInvestimentoIDTIPOINVEST: TFloatField;
    QryBuscaInvestimentoDESCINVESTIMENTO: TStringField;
    QryBuscaInvestimentoCODTIPOACAO: TStringField;
    QryBuscaInvestimentoMOECODIGO: TFloatField;
    QryBuscaInvestimentoQTDELOTE: TFloatField;
    QryBuscaInvestimentoIDBOLSAVALORES: TFloatField;
    qryDetalheIDOPERACAODIREITO: TFloatField;
    qryDetalheINVORIGEM: TFloatField;
    qryDetalheDATAAGE: TDateTimeField;
    qryDetalheDATAEX: TDateTimeField;
    qryDetalheDATACOM: TDateTimeField;
    qryDetalhePERCENTUAL: TFloatField;
    qryDetalhePARIDADE: TFloatField;
    qryDetalhePRZBOLSA: TDateTimeField;
    qryDetalhePRZEMPRESA: TDateTimeField;
    qryDetalheATADECISAO: TDateTimeField;
    qryDetalheFORMAPAGREC: TStringField;
    qryDetalheDIVPORACAO: TFloatField;
    qryDetalheINIPAGTO: TDateTimeField;
    qryDetalheJUROSCAP: TStringField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheIDTIPOOPERACAO: TFloatField;
    qryDetalheIDEMISSOR: TFloatField;
    qryDetalheOBSERVACAO: TMemoField;
    qryDetalheSTATUS: TStringField;
    qryDetalheISENCAOIR: TStringField;
    qryDetalheIRLITIGIO: TStringField;
    qryDetalhePLNCODIGO: TFloatField;
    qryDetalheCODDOCUMENTO: TFloatField;
    qryDetalhePLANO: TFloatField;
    qryDetalheIDPEDIDOFUNDO: TFloatField;
    qryDetalheQTDEACOESDIRPROV: TFloatField;
    qryDetalheIDOPERDIREITOXINV: TFloatField;
    qryDetalheIDINVESTIMENTO: TFloatField;
    qryDetalheIDOPERACAODIREITO_1: TFloatField;
    qryDetalheORIGDEST: TStringField;
    qryDetalhePERCENTUALINV: TFloatField;
    qryDetalheDESCINVESTIMENTO: TStringField;
    qryDetalheIDINVESTIMENTO_1: TFloatField;
    qryDetalheNOMEUSUARIO: TStringField;
    qryDetalheIDUSUARIO: TFloatField;
    qryDetalheVLRTOTALPROV: TFloatField;
    qryDetalheDESCTIPOOPERACAO: TStringField;
    dbDDataLiquidacao: TCMDateTimePicker;
    Label11: TLabel;
    Label16: TLabel;
    dbDDataCotizacao: TCMDateTimePicker;
    qryDetalheVLRACOESDIRPROV: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbRPUExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DbLkcFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dbRValorExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure DbRValorLiquidoExit(Sender: TObject);
    procedure dbDDataOperacaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(Chave: Largeint);
    function  ExcluiResgate(sPedido : String) : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadResgFdoAnuncioProv : TfrmCadResgFdoAnuncioProv;
  sNaturezaOper, sOperacao : String;
  bConfirma    : Boolean;

implementation

//Al_6
Uses uMensErro, UDataBase, uSistema, UBibliotecaInvest, UOperacaoInvest,
     DBaseDados, UFundoComum, UOperComum, dFundoComum, dOperComum, uLancContab,
  FPrincipal;

{$R *.DFM}

procedure TfrmCadResgFdoAnuncioProv.Sel(Chave: Largeint);
begin
   qryDetalhe.Close;
   qryDetalhe.ParamByName('IDPEDIDOFUNDO').AsInteger := Chave;
   qryDetalhe.Open;
end;

procedure TfrmCadResgFdoAnuncioProv.FormActivate(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := false;
end;

procedure TfrmCadResgFdoAnuncioProv.FormShow(Sender: TObject);
begin
  inherited;

   QryAcao.Close;
   QryAcao.Open;
                                                     
   QryFundoInvest.Close;
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.Open;

   qryTipoOperacao.Close;
   qryTipoOperacao.Open;   

   Qry.Close;
   Qry.Open;

   QryDetalhe.Close;
   QryDetalhe.Open;

end;

procedure TfrmCadResgFdoAnuncioProv.dbRPUExit(Sender: TObject);
begin
  inherited;
   dbRValor.Value := OperComum.Round(dbRQuantidade.Value*dbRPU.Value,2)
end;

procedure TfrmCadResgFdoAnuncioProv.bbtnOkDetClick(Sender: TObject);
begin
   If QryDetalhe.State = DsInsert Then
   Begin
      If ((dRVlrTotalProv.Value+
           QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat) > Qry.FieldByName('VLRPEDIDO').AsFloat) Then
      begin
         MsgDlg('O Valor Total de Proventos está maior que a do Resgate de Fundos.','Atenção',mtInformation,[mbOk],0);
         // AL_5
         if dbRQuantidade.CanFocus then
            dbRQuantidade.SetFocus;
         Exit;
      end;
   End
   Else
   Begin
      If ((dRVlrTotalProv.Value+
                   (QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat-
                    QryDetalhe.FieldByName('VLRACOESDIRPROV').OldValue)) > Qry.FieldByName('VLRPEDIDO').AsFloat) Then
      Begin
         MsgDlg('O Valor Total de Proventos está maior que a do Resgate de Fundos.','Atenção',mtInformation,[mbOk],0);
         // AL_5
         if dbRQuantidade.CanFocus then
            dbRQuantidade.SetFocus;
         Exit;
      End;
   End;

   // AL_4
   //AL_12
   if not CtrlInvContab.TestaPeriodo(dDataPrevista.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dDataPrevista.CanFocus then
         dDataPrevista.SetFocus;
      Exit;
   end;

   //AL_11
   if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   QryDetalhe.FieldByName('DATAAGE').AsDateTime        := Qry.FieldByName('DATAPEDIDO').AsDateTime;
   QryDetalhe.FieldByName('DATAEX').AsDateTime         := Qry.FieldByName('DATAPEDIDO').AsDateTime;
   QryDetalhe.FieldByName('DESCINVESTIMENTO').AsString := QryAcao.FieldByName('DESCINVESTIMENTO').AsString;
   QryDetalhe.FieldByName('NOMEUSUARIO').AsString      := Sistema.NomeUsuario;
   QryDetalhe.FieldByName('IDEMISSOR').AsInteger       := QryAcao.FieldByName('IDEMISSOR').AsInteger;
   QryDetalhe.FieldByName('DESCTIPOOPERACAO').AsString := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
   QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger    := 2;
   QryDetalhe.FieldByName('IRLITIGIO').AsString        := 'S';

   If QryDetalhe.State = DsInsert Then
      QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat   :=
                 QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat+QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat
   Else
      QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat   :=
                 QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat+
                           (QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat-
                            QryDetalhe.FieldByName('VLRACOESDIRPROV').OldValue);

   If QryDetalhe.State = DsEdit Then
      dRVlrTotalProv.Value := dRVlrTotalProv.Value + (QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat-
                                                      QryDetalhe.FieldByName('VLRACOESDIRPROV').OldValue)
   Else
      dRVlrTotalProv.Value := dRVlrTotalProv.Value +  QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat;

   CmeDetalhe.RepetirInsert := False;  // Cancela o Repetir Inserir

   bConfirma := True;

  inherited;

   AplicaAlteracoes([QryDetalhe]);

end;

procedure TfrmCadResgFdoAnuncioProv.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
// Busca dados do Tipo de Operacao
   FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST= '+QryFundoInvest.FieldByName('IDTIPOINVEST').AsString+
                    ' AND IDTIPOOPERACAO = '+IntToStr(pRPI.IDTIPOOPERDIRPROV));

   sNaturezaOper := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
   sOperacao     := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

// Preenche outros dados
   Qry.FieldByName('IDPEDIDOFUNDO').AsInteger     := LeUltRegistro(nil, 'PEDIDOFUNDO');

   Qry.FieldByName('IDTIPOINVEST').AsInteger      :=
                  QryFundoInvest.FieldByName('IDTIPOINVEST').AsInteger;

   Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger :=
                  QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

   Qry.FieldByName('IDTIPOOPERACAO').AsInteger    := pRPI.IDTIPOOPERDIRPROV;

   Qry.FieldByName('NATUREZAOPERACAO').AsString   := sNaturezaOper;

   Qry.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                  QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;

   Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

   Qry.FieldByName('DATACOTIZACAO').AsDateTime    := dbDDataOperacao.Date;

   Qry.FieldByName('DATALIQUIDACAO').AsDateTime   := dbDDataOperacao.Date;

   QryAux.Close;

end;

procedure TfrmCadResgFdoAnuncioProv.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
   QryDetalhe.FieldByName('IDOPERACAODIREITO').AsInteger := LeUltRegistro(nil, 'OPERACAODIREITO');
end;

procedure TfrmCadResgFdoAnuncioProv.CmeCadastroFind(Sender: TObject);
begin
  inherited;
    QryOperDireitoXinv.Close;
    QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger :=
                               QryDetalhe.FieldByName('IDOPERACAODIREITO').AsInteger;
    QryOperDireitoXinv.Open;
end;

procedure TfrmCadResgFdoAnuncioProv.bbtnConfirmarClick(Sender: TObject);
var
  iIdForCli, iPlano, iPlanilha, iDocumento : Integer;
  sMensErro, sTipoRecDesBol : String;
  bCriaLancto : Boolean;
  fValorIR, fVlrCustoAcoes, fVlrVarAcoes : Currency;
begin

   If Not bConfirma Then
   Begin
      MsgDlg('Confirme o Anúncio de Proventos antes de dar OK da operação.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      bbtnOkDet.SetFocus;
      Exit;
   End;

   // AL_4
   //AL_12
   if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbDDataOperacao.CanFocus then
         dbDDataOperacao.SetFocus;
      Exit;
   end;

   //AL_11
   if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;   

   Try

// Inicia Transação
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;
         
     Qry.Post;
     Qry.CommitUpdates;        

     iIdForCli := OperComum.BuscaForCli(Qry.FieldByName('IDTIPOINVEST').AsInteger,
                                        QryFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                        Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                                        pRPI.IDTIPOCLIENTEEMI);

     //Alt_1
     If Not ResgateFACFIF(Qry.FieldByName('IDTIPOINVEST').AsInteger,
                          Qry.FieldByName('IDPEDIDOFUNDO').AsInteger,
                          Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                          Qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
                          Qry.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                          Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger,                          
                          Qry.FieldByName('DATACOTIZACAO').AsDateTime,
                          Qry.FieldByName('DATAPEDIDO').AsDateTime,
                          Qry.FieldByName('DATALIQUIDACAO').AsDateTime, 0,
                          Qry.FieldByName('VLRPEDIDO').AsFloat, 0,
                          fVlrCustoAcoes, fVlrVarAcoes) Then
        //Al_5
        Raise Exception.Create('Não foi possível efetuar o Resgate, '+#13+
                               'Esta operação será Cancelada.')
        //Al_5 - Fim
     Else
     Begin
//*******************************************************************************************
//Grava  e Integra Financeiro e Contabil dos Fundos de Investimentos
        With DmFundoComum Do
        Begin
           QryConfirmacao.Close;

           QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                      Qry.FieldByName('IDFUNDOINVEST').AsInteger;
           QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                      Qry.FieldByName('IDTIPOOPERACAO').AsInteger;
           QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := dbDDataOperacao.Text;
           QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      := dbDDataOperacao.Text;
           QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
           //Al_10
           QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                      Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;
           QryConfirmacao.Open;

           fValorIR  := 0;

           While Not QryConfirmacao.Eof Do
           Begin
              //AL_17
              //Rotina de confirmação das operações
              If Not AlimentaFundo(QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger,
                                   QryConfirmacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                   QryConfirmacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   QryConfirmacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iPlanoPrevContab,
                                   iPatrocinadora,
                                   QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                   QryConfirmacao.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                   QryConfirmacao.FieldByName('QTDDECQTD').AsInteger,
                                   QryConfirmacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   iIdForCli,
                                   QryConfirmacao.FieldByName('DATAOPERACAO').AsDateTime,
                                   QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                   QryConfirmacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                   QryConfirmacao.FieldByName('QTDOPERACAO').AsFloat,
                                   QryConfirmacao.FieldByName('VLRCOTA').AsFloat,
                                   QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,
                                   QryConfirmacao.FieldByName('VLRIR').AsFloat,
                                   QryConfirmacao.FieldByName('VLRIOF').AsFloat,
                                   sNaturezaOper,
                                   sOperacao+' / '+QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString,
                                   'OPE', True,
                                   iPlanPrevCtbPatro,-1,-1,
                                   QryConfirmacao.FieldByName('VLRRENDIMENTO').AsFloat, sMensErro) Then
              begin
                 //Al_5
                 //AL_17
                 if sMensErro <> '' then
                    Raise Exception.Create('Não foi possível confirmar a operação de Resgate' + #13 +
                                           'Mensagem: ' + sMensErro)
                 else
                    Raise Exception.Create('Não foi possível confirmar a operação de Resgate' + #13 +
                                           'Ocorreu um problema durante o processo de gravação' + #13 +
                                           'Refaça a operação');
              end;

              fValorIR  := fValorIR + QryConfirmacao.FieldByName('VLRIR').AsFloat;

              ExecutaQuery(QryAux,
                           'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                           '(IDOPERACAOFUNDO   = '''+
                              QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsString+''')');
              QryAux.Close;

              QryConfirmacao.Next;

           End;

           QryConfirmacao.Close;

           iPlano     := -1;
           iPlanilha  := -1;
           iDocumento := -1;

           If iTipoInvestUsu <> 6 Then
           begin
              fVlrCustoAcoes := 0;
              fVlrVarAcoes   := 0;
           end;

           //Al_3
           If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                           Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           Qry.FieldByName('IDTIPOINVEST').AsInteger,
                                           Qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                           iIdForCli,
                                           Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                           dbDDataOperacao.Date,
                                           Qry.FieldByName('DATALIQUIDACAO').AsDateTime,
                                           'OPE', sNaturezaOper,
                                           DbLkcFundoInvest.Text+' / '+sPlanPrevCtbPatro,
                                           True,
                                           Qry.FieldByName('VLRPEDIDO').AsFloat,
                                           fValorIR, 0, 0, 0,
                                           fVlrCustoAcoes, fVlrVarAcoes) Then
           Begin
              //Al_5
              If dtmBaseDados.dbBaseDados.InTransaction then
                 DtmBaseDados.dbBaseDados.Rollback;
              bbtnCancelarClick(Sender);
              Exit;
              //Al_5 - Fim
           End;

           QryAux.Close;

           // Update no Plano,CodDocumento e PlnCodigo na PEDIDOFUNDO
           With QryUpdPedido Do
           Begin
             Close;
             ParamByName('IDPEDIDOFUNDO').AsInteger        := Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;
             If iPlanilha <> -1 then
             Begin
                ParamByName('PLANO').AsInteger             := iPlano;
                ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
             End
             Else
             Begin
                ParamByName('PLANO').Clear;
                ParamByName('PLNCODIGO').Clear;
             End;

             If iDocumento <> -1 then
                ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
             Else
                ParamByName('CODDOCUMENTO').Clear;

             ExecSQL;
             Close;
           End;
        End;
//Fim
//*******************************************************************************************
        QryDetalhe.DisableControls;
        QryDetalhe.First;
        While Not QryDetalhe.EOF Do
        begin

           sTipoRecDesBol := '';
           bCriaLancto    := False;  //Não integra financeiro.
           iIdForCli      := -1;
           iPlano         := -1;
           iPlanilha      := -1;
           iDocumento     := 9999999;//Não integra financeiro.

           OperComum.LimpaParametros(QryBuscaInvestimento);
           QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                                QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger;
           QryBuscaInvestimento.Open;

           // Lança o valor contabil correto
           if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                      QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                                      -71{Anuncio de Proventos C/ Resgate de Fundos},
                                      QryDetalhe.FieldByName('IDOPERACAODIREITO').AsInteger,
                                      iIdForCli, -1{Carteira},
                                      QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                      ''{Tipo de Titulo},
                                      ''{Lote},
                                      Trim(sOperacao){Historico Cantabil},
                                      ''{Boleta - Historico CapCar},
                                      'R',
                                      sTipoRecDesBol,
                                      bCriaLancto,
                                      Qry.FieldByName('VLRPEDIDO').AsFloat,
                                      QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat,
                                      Qry.FieldByName('DATAPEDIDO').AsDateTime{Data Operação}  ,
                                      QryDetalhe.FieldByName('DATACOM').AsDateTime{Data do Vencimento},
                                      iPlano,
                                      iPlanilha,
                                      iDocumento,
                                      sMensErro, 'N'{Integra Cap/Car}) = 6 then
           Begin
              //Al_5
              If dtmBaseDados.dbBaseDados.InTransaction then
                 DtmBaseDados.dbBaseDados.Rollback;
              bbtnCancelarClick(Sender);
              Exit;
              //Al_5 - Fim
           End;
           QryBuscaInvestimento.Close;

           QryDetalhe.Edit;
           QryDetalhe.FieldByName('IDPEDIDOFUNDO').AsInteger := Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;
           QryDetalhe.FieldByName('PLANO').AsInteger         := iPlano;
           If iPlano  <= 0 Then
              QryDetalhe.FieldByName('PLANO').Clear;
           QryDetalhe.FieldByName('PLNCODIGO').AsString      := IntToStr(iPlanilha);
           If iPlanilha  <= 0 Then
              QryDetalhe.FieldByName('PLNCODIGO').Clear;

           QryDetalhe.FieldByName('CODDOCUMENTO').AsString   := IntToStr(iDocumento);
           If (iDocumento = 9999999) or (iDocumento <= 0)  Then
              QryDetalhe.FieldByName('CODDOCUMENTO').Clear;

           QryDetalhe.Post;
           QryDetalhe.CommitUpdates;

           QryOperDireitoXinv.Close;
           QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger :=
                              QryDetalhe.FieldByName('IDOPERACAODIREITO').AsInteger;
           QryOperDireitoXinv.Open;

           If Not QryOperDireitoXinv.IsEmpty Then
              QryOperDireitoXinv.Edit
           Else
              QryOperDireitoXinv.Insert;

           QryOperDireitoXinv.FieldByName('IDINVESTIMENTO').AsInteger        :=
                              QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger;

           If (QryOperDireitoXinv.State = DsInsert) Then
               QryOperDireitoXinv.FieldByName('IDOPERDIREITOXINV').AsInteger :=
                              LeUltRegistro(nil,'OPERDIREITOXINV');

           QryOperDireitoXinv.FieldByName('IDOPERACAODIREITO').AsInteger     :=
                              QryDetalhe.FieldByName('IDOPERACAODIREITO').AsInteger;
           QryOperDireitoXinv.FieldByName('ORIGDEST').AsString               := 'O';
           QryOperDireitoXinv.Post;
           QryOperDireitoXinv.CommitUpdates;

           //Al_7
           ExecutaQuery(QryAux,
                        'DELETE FROM HISTCOTA WHERE ' +
                        'DATAHISTCOTA >= TO_DATE(''' +  OperComum.IIF(QryDetalhe.FieldByName('DATACOM').AsDateTime < (pRPI.DATAULTFECH-30), DateToStr(pRPI.DATAULTFECH-30), DateToStr(QryDetalhe.FieldByName('DATACOM').AsDateTime)) + ''',''DD/MM/YYYY'') ');
           QryAux.Close;
           //Al_7 - Fim

           QryDetalhe.Next;
        end;
        QryDetalhe.First;
        QryDetalhe.EnableControls;

        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Commit;

        Sel(-1);
        sbtnInsDet.Enabled    := False;
        sbtnAltDet.Enabled    := False;
        sbtnExcluiDet.Enabled := False;

        inherited;

        sbtnAlterar.Enabled  := False;
     End;
  Except
      If dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Rollback;
      //Al_5
      bbtnCancelarClick(Sender);
      OperComum.LimpaParametros(Qry);
      Qry.Open;
      OperComum.LimpaParametros(QryDetalhe);
      QryDetalhe.Open;
  End;
end;

procedure TfrmCadResgFdoAnuncioProv.bbtnCancelarClick(Sender: TObject);
begin
   QryDetalhe.Cancel;

  inherited;

   OperComum.LimpaParametros(Qry);
   Qry.Open;

   OperComum.LimpaParametros(QryDetalhe);
   QryDetalhe.Open;

   dRVlrTotalProv.Value := 0;      

   sbtnAlterar.Enabled := False;  

end;

procedure TfrmCadResgFdoAnuncioProv.DbLkcFundoInvestCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
   DadosCota  : TDadosCota;
begin

  inherited;

  If modified Then
  begin
     dbDDataOperacao.Text     := QryFundoInvest.FieldByName('DATAULTFECH').AsString;
     QrySaldoFundoTotal.Close;
     QrySaldoFundoTotal.ParamByName('DATAMOVFUNDO').AsString       := dbDDataOperacao.Text;
     QrySaldoFundoTotal.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DbLkcFundoInvest.LookupValue);
     QrySaldoFundoTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QrySaldoFundoTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QrySaldoFundoTotal.Open;

     If QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat > 0 Then
     Begin
        // Busca dados da Cota
        DadosCota := BuscaCotaFundo(QryAux,
                                   StrToInt(DbLkcFundoInvest.LookupValue),
                                   StrToDate(dbDDataOperacao.Text));

        Qry.FieldByName('DATAPEDIDO').AsDateTime     := StrToDate(dbDDataOperacao.Text);
        Qry.FieldByName('DATACOTIZACAO').AsDateTime  := StrToDate(dbDDataOperacao.Text);
        Qry.FieldByName('DATALIQUIDACAO').AsDateTime := StrToDate(dbDDataOperacao.Text);
        Qry.FieldByName('VLRPEDIDO').AsFloat         := QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat;
        Qry.FieldByName('QTDOPERACAO').AsFloat       := QrySaldoFundoTotal.FieldByName('SALDOQTDCOTAS').AsFloat;
        Qry.FieldByName('VLRCOTA').AsFloat           := DadosCota.VlrCota;

        DbRValorLiquido.SetFocus;
     End
     Else
     Begin
        dbDDataOperacao.Clear;
        DbRValorLiquido.Value := 0;
        DBReQtd.Value         := 0;
        DbEdCotaResg.Value    := 0;
        MsgDlg('Não há Saldo para esse Fundo de Investimento!',
               'Mensagem do Sistema', MtInformation ,[MbOk],0);
        DbLkcFundoInvest.SetFocus;
     End;

     Sel(Qry.FieldByName('IDPEDIDOFUNDO').AsInteger);

  end;
end;

procedure TfrmCadResgFdoAnuncioProv.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

   sbtnAlterar.Enabled := False;  

   if (MontaSelect.RetornouValor) And (StrToInt(MontaSelect.ValoresChave[0]) <> 0) then
   begin
      Qry.Close;
      Qry.ParamByName('IDPEDIDOFUNDO').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      Qry.Open;

      Sel(StrToInt(MontaSelect.ValoresChave[0]));

      dRVlrTotalProv.Value := QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat;

      sbtnApagar.Enabled   := True;

      pnlFundo.Enabled     := True;

   end;
end;

procedure TfrmCadResgFdoAnuncioProv.sbtnApagarClick(Sender: TObject);
var
   iTipoFundoInvest : Integer;
   //Al_9
   dDataOper        : TDateTime;
begin
    //Al_8
    If (MsgDlg('Deseja excluir toda a Operação?',
                 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
        Exit;

   // AL_4 - Inicio
   sbtnAlterar.Enabled := False;
   //*******************************************************************************************
   // Exclusão de Direitos
   Try     

   //AL_12
      if not CtrlInvContab.TestaPeriodo(Qry.FieldByName('DATAPEDIDO').AsString, iTipoInvestUsu) then
         Raise Exception.Create(CtrlInvContab.MessageInfo);

     //AL_11
      if VerEmAbertura(Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
         Raise Exception.Create('Operação cancelada.');

      // Inicia Transação
      If Not DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.StartTransaction;         

      While Not QryDetalhe.Eof Do
      Begin
         //AL_14
         ExecutaQuery(QryAux,
                      'DELETE FROM HISTCAIXA WHERE IDOPERACAODIREITO = '''+
                                QryDetalhe.FieldByName('IDOPERACAODIREITO').AsString+'''');
         ExecutaQuery(QryAux,
                      'DELETE FROM HISTPROVISAO WHERE IDOPERACAODIREITO = '''+
                                QryDetalhe.FieldByName('IDOPERACAODIREITO').AsString+'''');
         ExecutaQuery(QryAux,
                      'DELETE FROM HISTCOTA WHERE ' +
                      'DATAHISTCOTA >= TO_DATE(''' +  OperComum.IIF(QryDetalhe.FieldByName('DATACOM').AsDateTime < (pRPI.DATAULTFECH-30), DateToStr(pRPI.DATAULTFECH-30), DateToStr(QryDetalhe.FieldByName('DATACOM').AsDateTime)) + ''',''DD/MM/YYYY'') ');
         ExecutaQuery(QryAux,
                      'DELETE FROM OPERDIREITOXINV WHERE IDOPERACAODIREITO = '''+
                                QryDetalhe.FieldByName('IDOPERACAODIREITO').AsString+'''');
         ExecutaQuery(QryAux,
                      'DELETE FROM OPERACAODIREITO WHERE IDOPERACAODIREITO = '''+
                                QryDetalhe.FieldByName('IDOPERACAODIREITO').AsString+'''');
         QryAux.Close;

         //Al_6
         // Exclui Planilha da Contabilidade
         if (QryDetalhe.FieldByName('PLNCODIGO').AsInteger > 0) then
         begin
            // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
            //AL_13 - Passa a valer a exclusão em 3 camadas
            //AL_16
            if not CtrlInvContab.InvExcluiLanc(QryDetalhe.FieldByName('PLNCODIGO').AsInteger, 0, Sistema.UsaPlanoPatro, False) then
               Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + QryDetalhe.FieldByName('PLNCODIGO').AsString);
         end;
         //Al_6 - Fim

         QryDetalhe.Next;
      End;

      dRVlrTotalProv.Value := 0;

      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                           Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;
      iTipoFundoInvest  := Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

      //Al_6
      dDataOper         := Qry.FieldByName('DATAPEDIDO').AsDateTime;      

      //*******************************************************************************************
      // Exclusão de Fundos de Investimentos

      // Deleta o resgate do dia em todas as tabelas do Sistema(Fundo, Financeiro e Contabilidade)
      If Not ExcluiResgate(Qry.FieldByName('IDPEDIDOFUNDO').AsString) Then
      begin
         //Al_5
         //Não cria exceção, a rotina já trata a mensagem de erro
         If DtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Rollback;
         bbtnCancelarClick(Sender);
         //Al_5 - Fim
         Exit;
      end;

      inherited;

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

      Qry.Close;
      Qry.Open;

      bbtnCancelarClick(Sender);

      //Al_6
      If dDataOper < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         // Alt_2
         If Not Reprocessamento(iTipoInvestUsu,
                                Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                iPlanPrevCtbPatro,
                                dDataOper,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                Qry.FieldByName('DTAINIPROC').AsDateTime,
                                True) Then
            //Al_5
            MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                   'Mas o Reprocessamento foi cancelado!'+#13+
                   'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
      end;
      //Al_6 - Fim
   Except
      //Al_5
      on E: Exception do
      begin
         if Trim(E.Message) <> '' then
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0);
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         Exit;
      end;
      //Al_5 - Fim
   End;
   // AL_4 - Fim
end;

function TfrmCadResgFdoAnuncioProv.ExcluiResgate(sPedido : String) : Boolean;
Var
   wStr : String;
begin
   QryVerDelResgate.Close;
   QryVerDelResgate.ParamByName('IDPEDIDOFUNDO').AsInteger := StrToInt(sPedido);
   QryVerDelResgate.Open;

   wStr := 'UPDATE PEDIDOFUNDO SET PLANO = NULL, PLNCODIGO = NULL, CODDOCUMENTO = NULL '+
           'WHERE IDPEDIDOFUNDO = '+sPedido;
   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir o pedido.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   While Not QryVerDelResgate.Eof Do
   Begin
      If Not ProcExcluiFundo(QryVerDelResgate.FieldByName('CODDOCUMENTO').AsInteger,
                             QryVerDelResgate.FieldByName('PLNCODIGO').AsInteger,
                             QryVerDelResgate.FieldByName('PLANO').AsInteger,
                             QryVerDelResgate.FieldByName('IDTIPOINVEST').AsInteger,
                             QryVerDelResgate.FieldByName('DATAMOVFUNDO').AsDateTime, True) Then
      Begin
         //Al_5
         MsgDlg('Não foi possível excluir a integração Contábil e Financeira.','Mensagem do Sistema',mtWarning,[mbOk],0);
         QryVerDelResgate.Close;
         Result := False;
         Exit;
      End;

      QryVerDelResgate.Next;

   End;

   QryVerDelResgate.Close;

   wStr := 'DELETE FROM IRLITIGIO '+
           'WHERE IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
           'WHERE IDPEDIDOFUNDO = '+sPedido+')';
   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir o IR Litigio.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   wStr := 'DELETE FROM HISTFUNDO '+
           'WHERE IDTIPOOPERACAO NOT IN (-12,-13) AND IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
           'WHERE IDPEDIDOFUNDO = '+sPedido+')';
   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir o Histórico da operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   wStr := 'DELETE FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+sPedido;   
   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir a Operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      QryAux.Close;
      Result := False;
      Exit;
   End;
   QryAux.Close;

   wStr := 'DELETE FROM PEDIDOFUNDO WHERE IDPEDIDOFUNDO = '+sPedido;   
   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir o Pedido.','Mensagem do Sistema',mtWarning,[mbOk],0);
      QryAux.Close;
      Result := False;
      Exit;
   End;
   QryAux.Close;

   Result := True;
end;

procedure TfrmCadResgFdoAnuncioProv.sbtnInsDetClick(Sender: TObject);
var
   fVlrTotalProv : Currency;
begin

   bConfirma := False;

   If (Qry.FieldByName('VLRPEDIDO').AsFloat = QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat) Then
   begin
      MsgDlg('Não pode lançar mais Proventos, o Valor já é igual a do Resgate.','Atenção',mtInformation,[mbOk],0);
      Exit;
   end;

   fVlrTotalProv := QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat;

  inherited;

   QryDetalhe.FieldByName('VLRTOTALPROV').AsFloat := fVlrTotalProv;

   dDataPrevista.SetFocus;

end;

procedure TfrmCadResgFdoAnuncioProv.dbRValorExit(Sender: TObject);
begin
  inherited;
   bbtnOkDet.SetFocus;
end;

procedure TfrmCadResgFdoAnuncioProv.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   Sel(-1);
   dRVlrTotalProv.Value := 0;   
end;

procedure TfrmCadResgFdoAnuncioProv.sbtnExcluiDetClick(Sender: TObject);
Var
   fVlrProv : Currency;
begin
   // AL_4 - Inicio
   //AL_12
   if CtrlInvContab.TestaPeriodo(Qry.FieldByName('DATAPEDIDO').AsString, iTipoInvestUsu) then
   begin
      //AL_12
      if CtrlInvContab.TestaPeriodo(QryDetalhe.FieldByName('DATAAGE').AsString, iTipoInvestUsu) then
      begin
         fVlrProv := QryDetalhe.FieldByName('VLRACOESDIRPROV').AsFloat;
         inherited;
         dRVlrTotalProv.Value := dRVlrTotalProv.Value - fVlrProv;
      end
      else
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
   end
   else
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
   // AL_4 - Fim
end;

procedure TfrmCadResgFdoAnuncioProv.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   If QryDetalhe.RecordCount > 0 Then
   begin
     sbtnInsDet.Enabled    := True;
     sbtnAltDet.Enabled    := True;
     sbtnExcluiDet.Enabled := True;
   End
   Else If QryDetalhe.RecordCount = 0 Then
     sbtnInsDet.Enabled    := True;

end;

procedure TfrmCadResgFdoAnuncioProv.sbtnAltDetClick(Sender: TObject);
begin

  bConfirma := False;

  inherited;

end;

procedure TfrmCadResgFdoAnuncioProv.DbRValorLiquidoExit(Sender: TObject);
begin
   If (Qry.FieldByName('VLRPEDIDO').AsFloat >
          QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat) Then
       Qry.FieldByName('VLRPEDIDO').AsFloat := QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat;          

  inherited;
   Qry.FieldByName('QTDOPERACAO').AsFloat       :=
       OperComum.Round(
                 OperComum.DivValorZero(Qry.FieldByName('VLRPEDIDO').AsFloat,
                                        Qry.FieldByName('VLRCOTA').AsFloat),
                                        QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);
end;

procedure TfrmCadResgFdoAnuncioProv.dbDDataOperacaoExit(Sender: TObject);
var
   DadosCota  : TDadosCota;
begin
  inherited;
   QrySaldoFundoTotal.Close;
   QrySaldoFundoTotal.ParamByName('DATAMOVFUNDO').AsString       := dbDDataOperacao.Text;
   QrySaldoFundoTotal.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DbLkcFundoInvest.LookupValue);
   QrySaldoFundoTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QrySaldoFundoTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QrySaldoFundoTotal.Open;

   If QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat > 0 Then
   Begin
      // Busca dados da Cota
      DadosCota := BuscaCotaFundo(QryAux,
                                 StrToInt(DbLkcFundoInvest.LookupValue),
                                 StrToDate(dbDDataOperacao.Text));

      Qry.FieldByName('DATAPEDIDO').AsDateTime     := StrToDate(dbDDataOperacao.Text);
      Qry.FieldByName('DATACOTIZACAO').AsDateTime  := StrToDate(dbDDataOperacao.Text);
      Qry.FieldByName('DATALIQUIDACAO').AsDateTime := StrToDate(dbDDataOperacao.Text);
      Qry.FieldByName('VLRPEDIDO').AsFloat         := QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat;
      Qry.FieldByName('QTDOPERACAO').AsFloat       := QrySaldoFundoTotal.FieldByName('SALDOQTDCOTAS').AsFloat;
      Qry.FieldByName('VLRCOTA').AsFloat           := DadosCota.VlrCota;

      DbRValorLiquido.SetFocus;
   End;
end;

procedure TfrmCadResgFdoAnuncioProv.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

end.
