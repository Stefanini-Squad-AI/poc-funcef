//******************************************************************************
// Data      : 28/03/2007
// Código    : AL_15
// Pendencia : 24907
// SOL       : 56399
// Motivo    : Implementação para trazer corretamente no procurar a subscrição
//             do determinado plano que foi lançada depois das transferências
//******************************************************************************
// Data      : 27/03/2007
// Código    : AL_14
// Pendencia : 24907
// SOL       : 56399
// Motivo    : Implementação para trazer na pasta de operação a integralização
//             do determinado plano, com alteração no MontaSelect
//******************************************************************************
// Data      : 15/03/2007
// Código    : AL_13
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do fechto das query(qryCotaIntegrFundo)
//             determinando o dmfundocomum e com a função OperComum.LimpaParametros.
//******************************************************************************
// Data      : 04/01/2006
// Código    : AL_12
// Pendencia : 23857
// SOL       :
// Motivo    : Implementação de ajustes para aceitar "n" subscrições com a mesma
//             data de subscrição.
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_11
// Pendencia : 23119
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 10/08/2006
// Código    : AL_10
// Pendencia : 23051
// SOL       : 45405
// Desc      : Implementação da desvinculação total da operação de subscrição do
//             Fluxo de Integralização.
//******************************************************************************
// Data      : 09/08/2006
// Código    : AL_9
// Pendencia : 23037
// SOL       : 45367
// Desc      : Retirada a TestaFluxoExitente. Não há mais necessidade, devido ao
//             fluxo ser so informativo
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_8
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 06/06/2006
// Código    : AL_7
// Pendencia :
// SOL       :
// Motivo    : Sempre que houver uma alteração reprocessar o Fundo.
//******************************************************************************
// Data      : 17/05/2006
// Código    : AL_6
// Pendencia :
// SOL       : 43228
// Motivo    : Ajuste no SLQ da verificação de cotas já integralizadas(QryVerIntegrCotasLancadas).
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_5
// Pendencia :
// SOL       :
// Motivo    : Ajuste na exclusão do contabil da atualização do histórico
//******************************************************************************
// Data      : 20/02/2006
// Código    : AL_4
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 12/12/2005
// Linha(s) : Al_3
// Motivo   : Implementação do tratamento de saldo sintetico conforme a susbcrição
//            Criado as pastas de Operação e Saldo por histórico
//            Retirado o Bloqueado a alteração da subscrição devidos a problemas de exclusao de histórico de saldo a integralizar
//******************************************************************************
// Data     : 07/12/2005
// Linha(s) : Al_2
// Motivo   : Bloqueado a alteração da subscrição devidos a problemas de exclusao de histórico de saldo a integralizar
//******************************************************************************
// Data     : 07/11/2005
// Linha(s) : Al_1
// Motivo   : Implementação da alteração de subscrição e do fluxo separadamente.
//******************************************************************************

unit FCadSubscricaoCotasFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, FCadastroRMDetCSInv, Mask,
  FCadMestreDetCSInv, faMensagem, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  dxDBELib, uCtrlInvContab;

type
  TFrmCadSubscricaoCotasFundos = class(TfrmCadMestreDetalheCSInv)
    QryTipoOperacao: TwwQuery;
    qryAuxiliar: TwwQuery;
    qryDESCTIPOOPERACAO: TStringField;
    qryIDOPERACAOFUNDO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDPEDIDOFUNDO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryQTDOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryVLRCOTA: TFloatField;
    qryVLRIR: TFloatField;
    qryVLRIOF: TFloatField;
    qryVLRRENDIMENTO: TFloatField;
    qrySTACONFIRMA: TStringField;
    qryIDOPERACAOORIGEM: TFloatField;
    qryDATACOTIZACAO: TDateTimeField;
    qryOBSERVACAO: TMemoField;
    qryPLANO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryIDTIPOCOTA: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    QryFundoInvestOper: TwwQuery;
    pgcOper: TPageControl;
    TbsOperacao: TTabSheet;
    lbFundoInvestOper: TLabel;
    Label25: TLabel;
    lbDataOper: TLabel;
    dblFundoInvestOper: TwwDBLookupCombo;
    dbeVlrCota: TDBRealEdit;
    dbdDataOper: TCMDateTimePicker;
    tbsObservacao: TTabSheet;
    dbmObservacao: TDBMemo;
    QryFundoInvestOperIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperMOECODIGO: TFloatField;
    QryFundoInvestOperIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperPZOCARENCIA: TFloatField;
    QryFundoInvestOperPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperQTDDECQTD: TFloatField;
    QryFundoInvestOperQTDDECVALOR: TFloatField;
    QryFundoInvestOperSTAFUNDO: TStringField;
    QryFundoInvestOperPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperPERCTXPERFORM: TFloatField;
    QryFundoInvestOperPERCTXADM: TFloatField;
    QryFundoInvestOperSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperDATAINICIOFUNDO: TDateTimeField;
    QryFundoInvestOperIDTIPOINVEST: TFloatField;
    QryFundoInvestOperDTAINIPROC: TDateTimeField;
    dbeTotQtdCotas: TDBRealEdit;
    lbTotalCotas: TLabel;
    dbeVlrTotCotas: TDBRealEdit;
    lbVlrTotCotas: TLabel;
    qryIDCOTAINTEGRALIZA: TFloatField;
    qryDetalheIDCOTAINTEGRALIZA: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheIDTIPOCOTA: TFloatField;
    qryDetalheDATAINTEGRALIZAR: TDateTimeField;
    qryDetalheQTDINTEGRALIZAR: TFloatField;
    dbdDtaFluxo: TCMDateTimePicker;
    Label2: TLabel;
    dbeQtdCotas: TDBRealEdit;
    Label1: TLabel;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    QryTipoCota: TwwQuery;
    QryTipoCotaIDTIPOCOTA: TFloatField;
    QryTipoCotaDESCTIPOCOTA: TStringField;
    lbTipoCota: TLabel;
    dblTipoCota: TwwDBLookupCombo;
    QryTipoFundo: TwwQuery;
    dblTipoFundo: TwwDBLookupCombo;
    lbTipoFundo: TLabel;
    QryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoIDTIPOINVEST: TFloatField;
    QryTipoFundoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoDATAULTFECH: TDateTimeField;
    QryBuscaOperacaoFundo: TwwQuery;
    QryFundoInvestOperIDGESTORCARTEIRA: TFloatField;
    qryIDTIPOFUNDOINVEST: TFloatField;
    QryCotaIntegrFundo: TwwQuery;
    lblQtd: TfcLabel;
    lblCapQtd: TfcLabel;
    QryVerIntegrCotasLancadas: TwwQuery;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryTipoOperacaoFLGGERACONTAB: TFloatField;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoIDTIPOINVEST: TFloatField;
    QryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    QryTipoOperacaoFLGISENTOIR: TStringField;
    QryTipoOperacaoNATUREZAOPERACAO: TStringField;
    QryTipoOperacaoFLGTRATAIR: TStringField;
    QryTipoOperacaoTIPCREDOR: TStringField;
    QryTipoOperacaoRECPAG: TStringField;
    QryTipoOperacaoVENCIMENTO: TFloatField;
    QryTipoOperacaoFLGCONTAINVEST: TFloatField;
    QryBuscaFluxoFundo: TwwQuery;
    //Al_1
    qryDetalheALTERADO: TStringField;
    //Al_3
    QryVerFluxoCotasIntegr: TwwQuery;
    //Al_3
    tbsOpe: TTabSheet;
    tbsSaldo: TTabSheet;
    dbgrdOpe: TwwDBGrid;
    dbgrdSld: TwwDBGrid;
    QryOperacao: TwwQuery;
    DsOperacao: TwwDataSource;
    QryOperacaoDATAOPERACAO: TDateTimeField;
    QryOperacaoQTDOPERACAO: TFloatField;
    QryOperacaoVLROPERACAO: TFloatField;
    QryOperacaoVLRCOTA: TFloatField;
    QrySaldo: TwwQuery;
    DsSaldo: TwwDataSource;
    QrySaldoQTDHISTCOTAINTEGR: TFloatField;
    QrySaldoDATAAPLICACAO: TDateTimeField;
    QrySaldoDATAHISTCOTAINTEG: TDateTimeField;
    QrySaldoVLRCOTAINTEGR: TFloatField;
    QrySaldoVLRHISTCOTAINTEGR: TFloatField;
    QrySaldoVLRVARIACAODIA: TFloatField;
    //AL_10
    QryAtualOperacao: TwwQuery;
    //AL_14
    QryBuscaOperOrig: TwwQuery;
    //Al_3
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    //Al_3
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    //AL_11
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbeVlrCotaExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    //Al_3
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbeQtdCotasExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    //Al_3
    procedure FormCreate(Sender: TObject);
    procedure dblFundoInvestOperExit(Sender: TObject);
    procedure dblTipoCotaExit(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    //Al_3
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    //AL_11
    procedure dbdDataOperExit(Sender: TObject);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure dblFundoInvestOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
  private
    { Private declarations }
    //AL_11
    bModif : Boolean;
    bConfirmaDet : Boolean;  //---Renan Cristiano KT 653335 SOL 125858
    procedure Sel(iOper: Integer; bSelOper: Boolean = True; bSelDet: Boolean = True);
                            
    function  TestaOperacaoExitente : Boolean;
    function  TestaCadastro : Boolean;
    function  CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    function  BuscaCotaIntegralizar : Boolean;
    //AL_9
  public
    { Public declarations }
  end;

var
  FrmCadSubscricaoCotasFundos : TFrmCadSubscricaoCotasFundos;

implementation

uses uMensErro, DBaseDados, UDataBase, uSistema, UBibliotecaInvest,
     UDiasUteisInv, UOperComum, UFundoComum, dFundoComum;

{$R *.DFM}

procedure TFrmCadSubscricaoCotasFundos.Sel(iOper: Integer; bSelOper: Boolean = True; bSelDet: Boolean = True);
var
  fQtdeControle : Double;
begin
   if bSelOper then
   begin
      OperComum.LimpaParametros(qry);
      qry.ParamByName('IDOPERACAOFUNDO').AsInteger := iOper;
      qry.Open;

      //AL_10
      OperComum.LimpaParametros(QryAtualOperacao);
      QryAtualOperacao.ParamByName('IDOPERACAOFUNDO').AsInteger := iOper;
      QryAtualOperacao.Open;
   end;

   OperComum.LimpaParametros(QryTipoFundo);
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;

   OperComum.LimpaParametros(QryTipoCota);
   QryTipoCota.Open;

   OperComum.LimpaParametros(QryTipoOperacao);
   QryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoOperacao.Open;

   OperComum.LimpaParametros(QryFundoInvestOper);
   if dbdDataOper.Text <> '' then
      QryFundoInvestOper.ParamByName('DATAMOVFUNDO').AsString       := dbdDataOper.Text;
   if trim(dblTipoFundo.LookupValue) <> '' then
      QryFundoInvestOper.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoInvestOper.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
   QryFundoInvestOper.Open;

   if bSelDet then
   begin
      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.ParamByName('IDOPERACAOFUNDO').AsInteger := iOper;
      qryDetalhe.Open;
      qryDetalhe.First;
   end;

   //AL_14
   OperComum.LimpaParametros(QryBuscaOperOrig);
   QryBuscaOperOrig.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryBuscaOperOrig.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryBuscaOperOrig.ParamByName('IDOPERACAOORIGEM').AsInteger  := iOper;
   QryBuscaOperOrig.Open;

   //Al_3
   OperComum.LimpaParametros(QryOperacao);
   //AL_14
   if QryBuscaOperOrig.IsEmpty then
      QryOperacao.ParamByName('IDOPERACAOFUNDO').AsInteger := iOper
   else
      QryOperacao.ParamByName('IDOPERACAOFUNDO').AsInteger := QryBuscaOperOrig.FieldByName('IDOPERACAOFUNDO').AsInteger;
   QryOperacao.Open;
   If Trim(dblFundoInvestOper.Text) <> '' then
   begin
      QryOperacaoQTDOPERACAO.DisplayFormat := MontaMascaraDecQtd(StrToInt(dblFundoInvestOper.LookupValue));
      QryOperacaoVLRCOTA.DisplayFormat     := MontaMascaraDecVlr(StrToInt(dblFundoInvestOper.LookupValue));
   end;

   fQtdeControle := 0;
   QryOperacao.First;
   while Not QryOperacao.Eof do
   begin
      fQtdeControle := fQtdeControle + QryOperacaoQTDOPERACAO.AsFloat;
      QryOperacao.Next;
   end;
   QryOperacao.First;

   fQtdeControle  := dbeTotQtdCotas.Value - fQtdeControle;

   lblQtd.Caption := FloatToStrF(fQtdeControle,ffNumber,22,
          OperComum.IIF(QryFundoInvestOper.FieldByName('IDFUNDOINVEST').AsInteger <> 0,
                                QryFundoInvestOper.FieldByName('QTDDECQTD').AsInteger, 12));

   OperComum.LimpaParametros(QrySaldo);
   QrySaldo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QrySaldo.ParamByName('DATAHISTCOTAINTEG').AsString := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
   QrySaldo.ParamByName('IDOPERACAOFUNDO').AsInteger  := iOper;
   QrySaldo.Open;
   If Trim(dblFundoInvestOper.Text) <> '' then
   begin
      QrySaldoQTDHISTCOTAINTEGR.DisplayFormat := MontaMascaraDecQtd(StrToInt(dblFundoInvestOper.LookupValue));
      QrySaldoVLRCOTAINTEGR.DisplayFormat     := MontaMascaraDecVlr(StrToInt(dblFundoInvestOper.LookupValue));
   end;
   QrySaldo.First;
   //Al_3 - Fim

   pgcOper.ActivePage      := TbsOperacao;
   pgcOper.ActivePageIndex := 0;

end;

procedure TFrmCadSubscricaoCotasFundos.FormShow(Sender: TObject);
begin
   inherited;

   Sel(-1);

   lblQtd.Caption := '0.000';
   //AL_12
   //AL_11
   //AL_10
   lbTipoCota.Visible  := (iTipoInvestUsu in [9,10]);
   dblTipoCota.Visible := (iTipoInvestUsu in [9,10]);

   //Al_2
   //Al_3
end;

procedure TFrmCadSubscricaoCotasFundos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
    //Al_1
    //Al_3
    QryFundoInvestOper.Close;
    QryTipoFundo.Close;
    QryTipoCota.Close;
    QryTipoOperacao.Close;
end;

procedure TFrmCadSubscricaoCotasFundos.sbtnInserirClick(Sender: TObject);
begin
   //Al_3

   bConfirmaDet := True; //---Renan Cristiano KT 653335 SOL 125858

   inherited;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   qryIDOPERACAOFUNDO.AsInteger     := LeUltRegistro(Nil,'OPERACAOFUNDO');
   qryIDTIPOINVEST.AsInteger        := iTipoInvestUsu;
   qryIDPLANPREVCTBPATR.AsInteger   := iPlanPrevCtbPatro;
   qryIDTIPOOPERACAO.AsInteger      := -119;

   Sel(qryIDOPERACAOFUNDO.AsInteger, false);

   //AL_11
   if QryTipoFundo.RecordCount > 1 then
   begin
      if dblTipoFundo.CanFocus then
         dblTipoFundo.SetFocus;
   end
   else
   begin
      Qry.FieldByName('DATAOPERACAO').AsString := QryTipoFundo.FieldByName('DATAULTFECH').AsString;

      dblTipoFundo.Text := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
      dblTipoFundo.PerformSearch;
      
      if dbdDataOper.CanFocus then
         dbdDataOper.SetFocus;
   end;

end;

procedure TFrmCadSubscricaoCotasFundos.CmeCadastroFind(Sender: TObject);
begin

   inherited;

   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));

   if QryFundoInvestOper.FieldByName('IDFUNDOINVEST').AsInteger <> 0 then
   begin
      dbeTotQtdCotas.DecDigits := QryFundoInvestOper.FieldByName('QTDDECQTD').AsInteger;
      dbeVlrCota.DecDigits     := QryFundoInvestOper.FieldByName('QTDDECVALOR').AsInteger;
      dbeQtdCotas.DecDigits    := QryFundoInvestOper.FieldByName('QTDDECQTD').AsInteger;
      qryDetalheQTDINTEGRALIZAR.DisplayFormat := MontaMascaraDecQtd(QryFundoInvestOper.FieldByName('IDFUNDOINVEST').AsInteger);
      //AL_11
      lblQtd.Caption := FloatToStrF(qryQTDOPERACAO.AsFloat, ffNumber,22,
             OperComum.IIF(QryFundoInvestOper.FieldByName('IDFUNDOINVEST').AsInteger <> 0,
                                   QryFundoInvestOper.FieldByName('QTDDECQTD').AsInteger, 12));
   end;
   //Al_3
   //Al_2
end;

function TFrmCadSubscricaoCotasFundos.TestaOperacaoExitente: Boolean;
begin
   try
      OperComum.LimpaParametros(QryBuscaOperacaoFundo);
      QryBuscaOperacaoFundo.ParamByName('DATAOPERACAO').AsString       := qryDATAOPERACAO.AsString;
      QryBuscaOperacaoFundo.ParamByName('IDTIPOINVEST').AsInteger      := qryIDTIPOINVEST.AsInteger;
      QryBuscaOperacaoFundo.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundoIDTIPOFUNDOINVEST.AsInteger;
      QryBuscaOperacaoFundo.ParamByName('IDFUNDOINVEST').AsInteger     := qryIDFUNDOINVEST.AsInteger;
      QryBuscaOperacaoFundo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryBuscaOperacaoFundo.ParamByName('IDTIPOOPERACAO').AsInteger    := -119;
      if qryIDTIPOCOTA.AsInteger <> 0 then
         QryBuscaOperacaoFundo.ParamByName('IDTIPOCOTA').AsInteger     := qryIDTIPOCOTA.AsInteger;
      QryBuscaOperacaoFundo.Open;
      If QryBuscaOperacaoFundo.IsEmpty Then
         Result := False
      Else
         Result := True;
   finally
      QryBuscaOperacaoFundo.Close;
   end;
end;

function TFrmCadSubscricaoCotasFundos.TestaCadastro : Boolean;
begin
   Result := True;
   if Trim(dbdDataOper.Text) = '' then
   begin
      MsgDlg('Não foi informada a data da operação,'+#13+
             'por favor informar uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdDataOper.CanFocus then
         dbdDataOper.SetFocus;
      Result := False;
      Exit;
   end
   else
   if Trim(dblFundoInvestOper.Text) = '' then
   begin
      MsgDlg('Não foi selecionado um fundo de investimento,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dblFundoInvestOper.CanFocus then
         dblFundoInvestOper.SetFocus;
      Result := False;
      Exit;
   end
   else
   if (dbeTotQtdCotas.Value = 0) then
   begin
      MsgDlg('Não foi informado o Total de Cotas,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeTotQtdCotas.CanFocus then
         dbeTotQtdCotas.SetFocus;
      Result := False;
      Exit;
   end
   else
   if (dbeVlrCota.Value = 0) then
   begin
      MsgDlg('Não foi informado o Valor da Cota,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeVlrCota.CanFocus then
         dbeVlrCota.SetFocus;
      Result := False;
      Exit;
   end
   else
   if (dbeVlrTotCotas.Value = 0) then
   begin
      MsgDlg('Não foi informada o Valor Total das Cotas,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeVlrTotCotas.CanFocus then
         dbeVlrTotCotas.SetFocus;
      Result := False;
      Exit;
   end;
end;

procedure TFrmCadSubscricaoCotasFundos.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if (Qry.State = DsInsert) and (TestaOperacaoExitente) then
   begin
     //AL_12
      if MsgDlg('Já existe uma Operação com as mesmas Características.'+#13+
                'Deseja Continuar?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrNo then
      begin
         Accept := False;
         Exit;
      end;   
   end;

   if Not TestaCadastro then
   begin
      Accept := False;
      exit;
   end;

   //Al_1
   if (Qry.State = DsInsert) then
   begin
      if Not QryFundoInvestOperIDCARTEIRAINVEST.IsNull then
         qryIDCARTEIRAINVEST.AsInteger := QryFundoInvestOperIDCARTEIRAINVEST.AsInteger;
      qryDATALIQUIDACAO.AsDateTime     := CalcVenc(qryDATAOPERACAO.AsDateTime, qryTipoOperacaoVENCIMENTO.AsInteger);
      qryDATACOTIZACAO.AsDateTime      := qryDATAOPERACAO.AsDateTime;
   end;

   Accept := True;
end;

procedure TFrmCadSubscricaoCotasFundos.bbtnOkDetClick(Sender: TObject);
var bConfirma : Boolean;
    //Al_1
    sStr      : String;
begin
   //Al_1
   try
      CmeDetalheBeforeConfirma(Self, bConfirma);

      if not(qryDetalhe.State in [dsInsert, dsEdit]) then //---Renan Cristiano KT 653335 SOL 125858
        if not bConfirma then
          Exit;

      CmeDetalhe.RepetirInsert   := False;
      //Al_3
      //Al_1
      if Qry.State = DsEdit then
         QryDetalheALTERADO.AsString := 'S';
      inherited;

      bConfirmaDet := True; //---Renan Cristiano KT 653335 SOL 125858
      //Al_3
   //Al_1
   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível lançar este Fluxo. '+ #13 +
                E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
         bbtnCancelar.Click;
      end;
   end;

   fraMens.Apaga;

   QryAuxiliar.Close;

end;

procedure TFrmCadSubscricaoCotasFundos.sbtnAlterarClick(Sender: TObject);
begin
   inherited;

   //Al_1
   lbDataOper.Enabled         := False;
   dbdDataOper.Enabled        := False;
   lbTipoFundo.Enabled        := False;
   dblTipoFundo.Enabled       := False;
   lbFundoInvestOper.Enabled  := False;
   dblFundoInvestOper.Enabled := False;
   lbTipoCota.Enabled         := False;
   dblTipoCota.Enabled        := False;

   bConfirmaDet := True; //---Renan Cristiano KT 653335 SOL 125858

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   if dbdDataOper.CanFocus then
      dbdDataOper.SetFocus;

end;

procedure TFrmCadSubscricaoCotasFundos.bbtnConfirmarClick(Sender: TObject);
var
    //AL_11
    iTipoCota, iPlano, iPlanilha, iDocumento, iIdForCli : Integer;
    //AL_10
    fQtdFluxo : Double;
    //Al_3
    bAltDet, bAltPrin, bConfirma : Boolean;
    sStr      : String;
begin
   if not(bConfirmaDet) then begin //---Renan Cristiano KT 653335 SOL 125858
     MsgDlg('Confirme a operação de fluxo.','Mensagem do Sistema',MtWarning, [mbOk],0);
     bbtnOkDet.SetFocus;
     Exit;
   end;

   iPlano     := -1;
   iPlanilha  := -1;
   iDocumento := -1;
   //AL_12

   //AL_10
   fQtdFluxo  := 0;

   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   //AL_4
   if VerEmAbertura(QryFundoInvestOper.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   //AL_10

   qryDetalhe.DisableControls;
   qryDetalhe.First;
   while Not qryDetalhe.Eof Do
   begin
      fQtdFluxo  := fQtdFluxo + qryDetalheQTDINTEGRALIZAR.AsFloat;
      qryDetalhe.Next;
   end;
   qryDetalhe.First;
   qryDetalhe.EnableControls;
   if fQtdFluxo > qryQTDOPERACAO.AsFloat then
   begin
      if MsgDlg('A Quantidade total do Fluxo está maior que a Quantidade da Susbcrição.'+#13+
                'Confirma a Operação?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrNo then
         exit;
   end;

   //AL_12
   iIdForCli  := OperComum.BuscaForCli(iTipoInvestUsu,
                                       QryFundoInvestOper.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                       -119,
                                       pRPI.IDTIPOCLIENTEEMI);

   //Al_3
   try  // Finally
      try  // Except
         qryDetalhe.DisableControls;

         //Al_3
         //Al_1
         if Qry.State = DsEdit then
            bAltPrin := True;

         if QryDetalhe.Locate('ALTERADO','S',[]) then
            bAltDet  := True;

         fraMens.Mostra;
         fraMens.Mes := 'Atualizando Operação';
         qry.ApplyUpdates;

         fraMens.Mes := 'Atualizando Fluxo';
         qryDetalhe.ApplyUpdates;

         // Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;

         //Al_1
         //Al_3
         //Al_7
         //AL_10
         if ((qryQTDOPERACAO.AsFloat <> QryAtualOperacao.FieldByName('QTDOPERACAO').AsFloat)  Or
             (qryVLRCOTA.AsFloat     <> QryAtualOperacao.FieldByName('VLRCOTA').AsFloat)      Or
             (qryVLROPERACAO.AsFloat <> QryAtualOperacao.FieldByName('VLROPERACAO').AsFloat)) Then
         begin
            if (qryTipoOperacaoFLGGERACONTAB.AsInteger > 0) then
            begin
               fraMens.Mes := 'Verificando o Contábil';
               //AL_8
               if not CtrlInvContab.TestaPeriodo(qryDATAOPERACAO.AsString, iTipoInvestUsu) then
                  Raise Exception.Create(CtrlInvContab.MessageInfo);
            end;

            if ((qryCODDOCUMENTO.AsInteger > 0) Or (qryPLNCODIGO.AsInteger > 0)) then
            begin
               fraMens.Mes := 'Excluíndo Contabil da Subscrição';

               sStr := 'UPDATE OPERACAOFUNDO SET PLANO = NULL, PLNCODIGO = NULL WHERE IDOPERACAOFUNDO = '+
                        QryIDOPERACAOFUNDO.AsString;
               If Not ExecutaQuery(QryAuxiliar,sStr) Then
                  Raise Exception.Create('Não foi possível preparar a exclusão do Contabil da Subscrição.');

               if not ProcExcluiFundo(qryCODDOCUMENTO.AsInteger,
                                      qryPLNCODIGO.AsInteger,
                                      qryPLANO.AsInteger,
                                      qryIDTIPOINVEST.AsInteger,
                                      qryDATAOPERACAO.AsDateTime, True) Then
                  Raise Exception.Create('Não foi possível efetuar a exclusão do Contabil da Subscrição.');
            end;

            //Al_3
            //Al_1
            fraMens.Mes := 'Gerando Atualização'; 
            With DmFundoComum.qryCotaIntegrFundo do
            begin
               If Not GravaHistCotaIntegraliza(qryIDTIPOINVEST.AsInteger,
                                               qryIDFUNDOINVEST.AsInteger,
                                               qryIDTIPOCOTA.AsInteger,
                                               -1,-1,-1,
                                               iPlanPrevCtbPatro,
                                               qryIDOPERACAOFUNDO.AsInteger,
                                               qryDATAOPERACAO.AsDateTime,
                                               qryDATAOPERACAO.AsDateTime,
                                               OperComum.Round((qryQTDOPERACAO.AsFloat*QryVLRCOTA.AsFloat),2),
                                               qryQTDOPERACAO.AsFloat,
                                               qryQTDOPERACAO.AsFloat,
                                               qryVLRCOTA.AsFloat, 0, 'OPE') then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

               If Not GravaHistCotaIntegraliza(qryIDTIPOINVEST.AsInteger,
                                               qryIDFUNDOINVEST.AsInteger,
                                               qryIDTIPOCOTA.AsInteger,
                                               -1,-1,-1,
                                               iPlanPrevCtbPatro,
                                               qryIDOPERACAOFUNDO.AsInteger,
                                               qryDATAOPERACAO.AsDateTime,
                                               qryDATAOPERACAO.AsDateTime,
                                               OperComum.Round((qryQTDOPERACAO.AsFloat*QryVLRCOTA.AsFloat),2),
                                               qryQTDOPERACAO.AsFloat, 0,
                                               qryVLRCOTA.AsFloat, 0, 'ATU') then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');
               Close;
            end;

            //Al_3
            //Al_1
            fraMens.Mes := 'Gerando Integração Contabil : '+FloatToStrF(qryVLROPERACAO.AsFloat, ffNumber, 18,2);

            If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                            qryIDTIPOOPERACAO.AsInteger,
                                            iTipoInvestUsu,
                                            QryIDCARTEIRAINVEST.AsInteger,
                                            QryFundoInvestOperIDTIPOFUNDOINVEST.AsInteger,
                                            iIdForCli,
                                            qryIDFUNDOINVEST.AsInteger,
                                            qryDATAOPERACAO.AsDateTime,
                                            qryDATALIQUIDACAO.AsDateTime,
                                            'OPE',
                                            QryTipoOperacaoNATUREZAOPERACAO.AsString,
                                            QryFundoInvestOperDESCFUNDOINVEST.AsString+' / '+sPlanPrevCtbPatro,
                                            True,
                                            qryVLROPERACAO.AsFloat , 0, 0, 0, 0, 0, 0,
                                            QryTipoCotaIDTIPOCOTA.AsInteger, 0, 0, 0,
                                            QryTipoOperacaoFLGCONTAINVEST.AsInteger) Then
               Raise Exception.Create('Não foi possível integralizar o Contabil da Subscrição.');

            // Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
            With DmFundoComum.QryUpdOpeFinCtb Do
            Begin
               Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
               ParamByName('IDOPERACAOFUNDO').AsInteger   := Qry.FieldByName('IDOPERACAOFUNDO').AsInteger;
               ParamByName('PLANO').AsInteger             := iPlano;
               ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
               ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
               ExecSQL;
            End;
         end;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit
         else
            //Al_1
            Raise Exception.Create('Ocorreu um problema no controle de transação : ' + #13 +
                                   'Não há transação para efetuar a operação.');
         fraMens.Apaga;

         //AL_11
         iTipoCota    := -1;
         if QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger > 0 then
            iTipoCota := QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;

         //AL_10
         if ((qryQTDOPERACAO.AsFloat <> QryAtualOperacao.FieldByName('QTDOPERACAO').AsFloat)  Or
             (qryVLRCOTA.AsFloat     <> QryAtualOperacao.FieldByName('VLRCOTA').AsFloat)      Or
             (qryVLROPERACAO.AsFloat <> QryAtualOperacao.FieldByName('VLROPERACAO').AsFloat)) Then
         begin
            //Al_7
            If ((StrToDate(dbdDataOper.Text) < QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime) Or
               ((StrToDate(dbdDataOper.Text) <= QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime) And
                (bAltPrin))) Then
            begin
               //AL_4
               If Not Reprocessamento(iTipoInvestUsu,
                                      QryFundoInvestOper.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                      QryFundoInvestOper.FieldByName('IDFUNDOINVEST').AsInteger,
                                      -1,
                                      StrToDate(dbdDataOper.Text),
                                      QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime,
                                      QryFundoInvestOper.FieldByName('DTAINIPROC').AsDateTime, True,
                                      //AL_11
                                      iTipoCota) Then
                  MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                         'Mensagem do Sistema', MtInformation,[MbOk],0)
               else
                  MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
            end
            else
               MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
         end
         else
            MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      except
         on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema na movimentação desta Subscrição.' + #13 +
                   'Mensagem : ' + E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      fraMens.Apaga;

      //Al_13
      OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);      

      // Refaz o Status do Form como Browse
      bbtnCancelar.Click;

      qryDetalhe.EnableControls;

      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TFrmCadSubscricaoCotasFundos.FormResize(Sender: TObject);
begin
  inherited;
  if Trunc((fraMens.Width / 3) * 2) > 350 then
     fraMens.pnlProgressoMensagem.Width := Trunc((fraMens.Width / 3) * 2)
  else
  begin
     if fraMens.Width <= 350 then
        fraMens.pnlProgressoMensagem.Width := fraMens.Width - 70
     else
        fraMens.pnlProgressoMensagem.Width := 340;
  end;
end;

procedure TFrmCadSubscricaoCotasFundos.sbtnApagarClick(Sender: TObject);
var sStr      : String;
    dDataOper, dDataUltFech, dDataIniProc : TDateTime;
    //AL_11
    iTipoCota, iTipoFdo, iFundo : Integer;
begin

   OperComum.LimpaParametros(QryVerIntegrCotasLancadas);
   QryVerIntegrCotasLancadas.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                             QryIDOPERACAOFUNDO.AsInteger;
   QryVerIntegrCotasLancadas.Open;

   if Not QryVerIntegrCotasLancadas.IsEmpty then
   begin
      MsgDlg('Já ocorreu Integralização de Cotas para essa Subscrição.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
      QryVerIntegrCotasLancadas.Close;
      Exit;
   end;
   QryVerIntegrCotasLancadas.Close;

   //AL_12
   //AL_4
   if VerEmAbertura(QryFundoInvestOper.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   if (qryTipoOperacaoFLGGERACONTAB.AsInteger > 0) then
   begin
      //AL_8
      if not CtrlInvContab.TestaPeriodo(qryDATAOPERACAO.AsString, iTipoInvestUsu) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;

   //AL_12

   //Al_3
   dDataOper    := StrToDate(dbdDataOper.Text);
   dDataUltFech := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
   dDataIniProc := QryFundoInvestOper.FieldByName('DTAINIPROC').AsDateTime;
   iTipoFdo     := QryFundoInvestOper.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   iFundo       := QryFundoInvestOper.FieldByName('IDFUNDOINVEST').AsInteger;
   //AL_11
   iTipoCota    := -1;
   if QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger > 0 then
      iTipoCota := QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;

   if MsgDlg('Exclui a Subscrição e o Fluxo?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin
      try
         // Inicia Transação
         If not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         fraMens.Max := (qryDetalhe.RecordCount) + 1;
         fraMens.Pos := 0;
         fraMens.Mostra;

         if ((qryCODDOCUMENTO.AsInteger > 0) Or (qryPLNCODIGO.AsInteger > 0)) then
         begin
            sStr := 'UPDATE OPERACAOFUNDO SET PLANO = NULL, PLNCODIGO = NULL WHERE IDOPERACAOFUNDO = '+
                     QryIDOPERACAOFUNDO.AsString;
            If Not ExecutaQuery(QryAuxiliar,sStr) Then
               Raise Exception.Create('Não foi possível preparar a exclusão Contabil da Subscrição.');
            fraMens.Mes := 'Excluíndo Contabil da Subscrição ...';
            if not ProcExcluiFundo(qryCODDOCUMENTO.AsInteger,
                                   qryPLNCODIGO.AsInteger,
                                   qryPLANO.AsInteger,
                                   qryIDTIPOINVEST.AsInteger,
                                   qryDATAOPERACAO.AsDateTime, True) Then
               Raise Exception.Create('Não foi possível efetuar a exclusão o Contabil da Subscrição.');
         end;
         fraMens.Incrementa;

         fraMens.Mes := 'Excluindo Fluxo';
         qryDetalhe.First;
         while not qryDetalhe.Eof do
         begin
            //Al_1
            //Al_3

            fraMens.Incrementa;

            qryDetalhe.Delete;

         end;

         qryDetalhe.ApplyUpdates;

         //Al_5
         sStr := 'SELECT PLANO, PLNCODIGO, IDTIPOINVEST, DATAHISTCOTAINTEG '+
                 'FROM HISTCOTAINTEGRALIZA '+
                 'WHERE IDOPERACAOFUNDO = '+QryIDOPERACAOFUNDO.AsString;
         //AL_11
         FazQuery(QryAuxiliar,sStr);

         While Not QryAuxiliar.Eof do
         begin
            if ((QryAuxiliar.FieldByName('PLANO').AsInteger > 0) and (QryAuxiliar.FieldByName('PLNCODIGO').AsInteger > 0)) then
            begin
               fraMens.Mes := 'Excluíndo Contabil do Histórico da Integralização';
               if not ProcExcluiFundo(-1
                                      QryAuxiliar.FieldByName('PLNCODIGO').AsInteger,
                                      QryAuxiliar.FieldByName('PLANO').AsInteger,
                                      QryAuxiliar.FieldByName('IDTIPOINVEST').AsInteger,
                                      QryAuxiliar.FieldByName('DATAHISTCOTAINTEG').AsDateTime, True) Then
                  Raise Exception.Create('Não foi possível preparar a exclusão Contabil do Histórico da Integralização.');
            end;
            QryAuxiliar.Next;
         end;

         //Al_3
         sStr := 'DELETE FROM HISTCOTAINTEGRALIZA WHERE IDOPERACAOFUNDO = '+
                  qryIDOPERACAOFUNDO.AsString;
         If Not ExecutaQuery(qryAuxiliar,sStr) Then
            Raise Exception.Create('Não foi possivel excluir o Histórico da Integralização.');

         // Exclui a Subscrição
         qry.Delete;
         qry.ApplyUpdates;

         Sel(-1);
         CmeCadastro.AtualizaBotoes(Self);

         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         //Al_3
         fraMens.Apaga;

         If dDataOper <= dDataUltFech Then
         begin
            If Not Reprocessamento(iTipoInvestUsu, iTipoFdo, iFundo, -1,
                                   dDataOper, dDataUltFech, dDataIniProc, True, iTipoCota) Then
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0)
            else
               MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
         end
         else
            MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      except
         on E:Exception do
         begin
            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema na exclusão. '+ #13 +
                   E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
            bbtnCancelar.Click;
            fraMens.Apaga;
         end;
      end
   end;
end;

procedure TFrmCadSubscricaoCotasFundos.CmeDetalheConfirma(Sender: TObject);
begin
   try
      if qryDetalhe.State in [dsInsert, dsEdit] then
      begin
         if qryDetalhe.State = dsInsert then
            qryDetalheIDCOTAINTEGRALIZA.AsInteger := LeUltRegistro(nil,'COTAINTEGRALIZA');

         if not qryIDTIPOCOTA.IsNull then
            qryDetalheIDTIPOCOTA.AsInteger        := qryIDTIPOCOTA.AsInteger;

         qryDetalheIDOPERACAOFUNDO.AsInteger      := qryIDOPERACAOFUNDO.AsInteger;

         qryDetalheIDFUNDOINVEST.AsInteger        := qryIDFUNDOINVEST.AsInteger;
      end;

      inherited;

   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível incluir um Fluxo. '+ #13 +
                E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
         bbtnCancelarDet.Click;
      end;         
   end;
end;

function TFrmCadSubscricaoCotasFundos.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

procedure TFrmCadSubscricaoCotasFundos.bbtnCancelarClick(Sender: TObject);
begin

   TbsOperacao.Enabled := True;

   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   Sel(qryIDOPERACAOFUNDO.AsInteger);

   //Al_3

   //Al_1
   lbDataOper.Enabled         := True;
   dbdDataOper.Enabled        := True;
   lbTipoFundo.Enabled        := True;
   dblTipoFundo.Enabled       := True;
   lbFundoInvestOper.Enabled  := True;
   dblFundoInvestOper.Enabled := True;
   lbTipoCota.Enabled         := True;
   dblTipoCota.Enabled        := True;

   //Al_3

end;

procedure TFrmCadSubscricaoCotasFundos.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
  begin
     dbdDataOper.Enabled        := False;
     dblTipoFundo.Enabled       := False;
     dblFundoInvestOper.Enabled := False;   
     lbTipoCota.Enabled         := False;
     if lbTipoCota.Visible then
     begin
        dblTipoCota.Enabled     := False;
        dbeTotQtdCotas.Enabled  := False;
     end;   
     dbeVlrCota.Enabled         := False;
     dbeVlrTotCotas.Enabled     := False;
     dbmObservacao.Enabled      := False;
  end;
end;

procedure TFrmCadSubscricaoCotasFundos.sbtnAltDetClick(Sender: TObject);
begin

   bConfirmaDet := False; //---Renan Cristiano KT 653335 SOL 125858
   
   if qryDetalhe.IsEmpty then
      exit;

  inherited;

   if dbdDtaFluxo.CanFocus then
      dbdDtaFluxo.SetFocus;
end;

//Al_3

procedure TFrmCadSubscricaoCotasFundos.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
begin
   Accept     := False;

   if Not TestaCadastro then
      Exit;

   if trim(dbdDtaFluxo.Text) = '' then
   begin
      MsgDlg('Não foi informada a Data, '+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdDtaFluxo.CanFocus then
         dbdDtaFluxo.SetFocus;
      Exit;
   end;

   //AL_11    
   if (dbdDtaFluxo.Date < dbdDataOper.Date) then
   begin
      MsgDlg('Não foi informada a Data, '+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdDtaFluxo.CanFocus then
         dbdDtaFluxo.SetFocus;
      Exit;
   end;

   if dbeQtdCotas.Value = 0 then
   begin
      MsgDlg('Não foi informada a Quantidade de Cotas,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeQtdCotas.CanFocus then
         dbeQtdCotas.SetFocus;
      Exit;
   end;

   Accept := True;

   inherited;

end;

//AL_11

procedure TFrmCadSubscricaoCotasFundos.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   dbdDataOper.Enabled        := True;
   dblTipoFundo.Enabled       := True;
   dblFundoInvestOper.Enabled := True;
   lbTipoCota.Enabled         := True;
   if lbTipoCota.Visible then
   begin
      dblTipoCota.Enabled     := True;
      dbeTotQtdCotas.Enabled  := True;
   end;
   dbeVlrCota.Enabled         := True;
   dbeVlrTotCotas.Enabled     := True;
   dbmObservacao.Enabled      := True;
end;

procedure TFrmCadSubscricaoCotasFundos.dbeVlrCotaExit(Sender: TObject);
begin
  inherited;
   dbeVlrTotCotas.Value := OperComum.Round(dbeTotQtdCotas.Value*dbeVlrCota.Value,2);
end;

procedure TFrmCadSubscricaoCotasFundos.sbtnExcluiDetClick(Sender: TObject);
var sBol, sStr : String;
    iResp      : Integer;
    fQtd       : Double;
begin
   sBol := '';
   sStr := '';
   iResp:= -1;
   fQtd := 0;

   if qryDetalhe.IsEmpty then
      exit;
   //Al_1
   OperComum.LimpaParametros(QryVerFluxoCotasIntegr);
   QryVerFluxoCotasIntegr.ParamByName('IDCOTAINTEGRALIZA').AsInteger :=
                             qryDetalheIDCOTAINTEGRALIZA .AsInteger;
   QryVerFluxoCotasIntegr.Open;
   if Not QryVerFluxoCotasIntegr.IsEmpty then
   begin
      MsgDlg('Já ocorreu Integralização de Cotas para esse Fluxo.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
      QryVerFluxoCotasIntegr.Close;
      bbtnCancelar.Click;
      exit;
   end;
   QryVerFluxoCotasIntegr.Close;

   iResp := OperComum.InvMsgBox('Exclui esta Operação ou todas',
                                mtConfirmation, 'Mensagem do Sistema',
                                [mbYes,mbNo,mbCancel],
                                'Esta;Todas;Cancela');
   try
      if iResp = mrYes then
      begin
         //Al_1
         //Al_3

         fQtd := qryDetalheQTDINTEGRALIZAR.AsFloat;

         inherited;

         //Al_3

      end
      else if iResp = mrNo then
      begin
         //Al_3
         sStr := 'DELETE FROM COTAINTEGRALIZA WHERE IDOPERACAOFUNDO = '+
                  qryDetalheIDOPERACAOFUNDO.AsString;
         If Not ExecutaQuery(qryAuxiliar,sStr) Then
            Raise Exception.Create('Não foi possivel excluir o Fluxo.');
         //Al_3
         inherited;

         Sel(qryIDOPERACAOFUNDO.AsInteger, false, false);
         //Al_3
      end;

      bbtnConfirmar.Enabled   := True;
  Except
     on E:Exception do
     begin
        MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
        bbtnCancelar.Click;
     end;
  end;

  fraMens.Apaga;

  //Al_1
  QryAuxiliar.Close;

end;

//Al_3

procedure TFrmCadSubscricaoCotasFundos.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
   if qryDetalhe.IsEmpty then
      exit;
end;

procedure TFrmCadSubscricaoCotasFundos.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  bConfirmaDet := False; //---Renan Cristiano KT 653335 SOL 125858

  if dbdDtaFluxo.CanFocus then
     dbdDtaFluxo.SetFocus;

{  //---Renan Cristiano KT 653335 SOL 125858 início.
  if qryDetalhe.State = dsInsert then
    qryDetalheIDCOTAINTEGRALIZA.AsInteger := LeUltRegistro(nil,'COTAINTEGRALIZA');

    if not qryIDTIPOCOTA.IsNull then
      qryDetalheIDTIPOCOTA.AsInteger        := qryIDTIPOCOTA.AsInteger;

    qryDetalheIDOPERACAOFUNDO.AsInteger      := qryIDOPERACAOFUNDO.AsInteger;
    qryDetalheIDFUNDOINVEST.AsInteger        := qryIDFUNDOINVEST.AsInteger;
  //---Renan Cristiano KT 653335 SOL 125858 Fim.}

end;

//Al_3

procedure TFrmCadSubscricaoCotasFundos.FormCreate(Sender: TObject);
begin
  inherited;

    MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));

    //AL_15
    if Sistema.TipoCliente = 19991 then //FUNCEF
       MontaSelect.Filtro.Add(' ( ((OPERACAOFUNDO.DATAOPERACAO   > ''31/08/2006'') AND (OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' )) OR '+
                              '   ((OPERACAOFUNDO.DATAOPERACAO   <= ''31/08/2006'') AND (OPERACAOFUNDO.IDPLANPREVCTBPATR IS NOT NULL)))');
end;

function TFrmCadSubscricaoCotasFundos.BuscaCotaIntegralizar : Boolean;
begin
  Result := True;
  if (Trim(dblFundoInvestOper.Text) <> '') then
  begin
     dbeTotQtdCotas.DecDigits := QryFundoInvestOper.FieldByName('QTDDECQTD').AsInteger;
     dbeVlrCota.DecDigits     := QryFundoInvestOper.FieldByName('QTDDECVALOR').AsInteger;
     dbeQtdCotas.DecDigits    := QryFundoInvestOper.FieldByName('QTDDECQTD').AsInteger;
     qryDetalheQTDINTEGRALIZAR.DisplayFormat := MontaMascaraDecQtd(StrToInt(dblFundoInvestOper.LookupValue));

     if trim(dbdDataOper.Text) <> '' then
     begin
        OperComum.LimpaParametros(QryCotaIntegrFundo);
        QryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblFundoInvestOper.LookupValue);
        QryCotaIntegrFundo.ParamByName('DATACOTA').AsString       := dbdDataOper.Text;
        //AL_11
        //AL_10
        if ((dblTipoCota.Visible) and (Trim(dblTipoCota.LookupValue) <> '')) then
           QryCotaIntegrFundo.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCota.LookupValue);
        QryCotaIntegrFundo.Open;
        dbeVlrCota.Value   := QryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat;
     end;
  end;
end;

procedure TFrmCadSubscricaoCotasFundos.dblFundoInvestOperExit(Sender: TObject);
begin
  inherited;
//AL_11
//AL_10
  if ((Not bModif) and (Not dblTipoCota.Visible)) then
     BuscaCotaIntegralizar;
  bModif := False;
end;

procedure TFrmCadSubscricaoCotasFundos.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
//AL_11
//AL_10
  if not bModif then
     BuscaCotaIntegralizar;
  bModif := False;
end;

procedure TFrmCadSubscricaoCotasFundos.dbeQtdCotasExit(Sender: TObject);
begin
  inherited;
   if bbtnOkDet.CanFocus then
      bbtnOkDet.SetFocus;
end;

//AL_9
procedure TFrmCadSubscricaoCotasFundos.CmeDetalheBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;

//AL_9
end;

//Al_3
procedure TFrmCadSubscricaoCotasFundos.CmeDetalheAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
   if (pgctrlDetalhe.ActivePage = tbsOpe) or (pgctrlDetalhe.ActivePage = tbsSaldo) then
   begin
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
      sbtnConsDet.Enabled   := False;
   end;
end;

//AL_11
procedure TFrmCadSubscricaoCotasFundos.dbdDataOperExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryFundoInvestOper);
   if trim(dblTipoFundo.LookupValue) <> '' then
      QryFundoInvestOper.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoInvestOper.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
   QryFundoInvestOper.ParamByName('DATAMOVFUNDO').AsString          := dbdDataOper.Text;
   QryFundoInvestOper.Open;

   dblFundoInvestOper.Clear;

end;

//AL_11
procedure TFrmCadSubscricaoCotasFundos.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
   Qry.FieldByName('DATAOPERACAO').AsString := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
   //AL_12
   OperComum.LimpaParametros(QryFundoInvestOper);
   if trim(dblTipoFundo.LookupValue) <> '' then
      QryFundoInvestOper.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoInvestOper.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
   QryFundoInvestOper.ParamByName('DATAMOVFUNDO').AsString          := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
   QryFundoInvestOper.Open;
      
end;

//AL_11
procedure TFrmCadSubscricaoCotasFundos.dblFundoInvestOperCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  if ((modified) and (Not dblTipoCota.Visible)) then
     BuscaCotaIntegralizar;
end;

//AL_11
procedure TFrmCadSubscricaoCotasFundos.dblTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  if modified then
     BuscaCotaIntegralizar;
end;

procedure TFrmCadSubscricaoCotasFundos.bbtnCancelarDetClick(
  Sender: TObject);
begin
  inherited;
  bConfirmaDet := True; //---Renan Cristiano KT 653335 SOL 125858
end;

procedure TFrmCadSubscricaoCotasFundos.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  bConfirmaDet := True; //---Renan Cristiano KT 653335 SOL 125858
end;

end.
