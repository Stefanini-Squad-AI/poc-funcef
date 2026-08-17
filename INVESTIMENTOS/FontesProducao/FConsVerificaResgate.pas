//******************************************************************************
//Rotina..........:
//N. Sol..........: 174651
//N. Kintana......: 1607521
//Data............: 20/03/2012
//Responsável.....: Otacilio Aquino
//Descrição.......: Alteração do DATAMODULO "FDmRelFundosSaldo" p/ "FDMRelVerificaAcoes"
//******************************************************************************
// Data      : 06/08/2007
// Código    : AL_5
// Pendencia : 25291
// SOL       : 59686
// Motivo    : Implementação da Performance da Qry de Saldo de Fundos
//******************************************************************************
// Data      : 31/08/2006
// Código    : AL_4
// Pendencia :
// SOL       :
// Motivo    : Implementação para utilização da query de saldo da consulta dos Fundos
//             Implemetação da impressão do saldo por plano
//******************************************************************************
// Data      : 28/08/2006
// Código    : AL_3
// Pendencia :
// SOL       :
// Motivo    : Implementação do subtotal direto na grid
//******************************************************************************
// Data     : 12/01/2005
// Linha(s) : QryFundoInvestOperacao, QryOperacoes, QrySaldoFundo
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais recente
//            registro
//******************************************************************************
// Data     : 04/10/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FConsVerificaResgate;

interface                                                  

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, DBCtrls,
  Grids, DBGrids, Wwdbigrd, Wwdbgrid, TREdit, wwdbdatetimepicker,
  //AL_4
  CMDateTimePicker, CmEventosCadastro, ImgList, Menus, FPreview;


type

  TfrmConsVerificaResgates = class(TfrmCadastroCS)
    Label6: TLabel;
    QryFundoInvestOperacao: TwwQuery;
    QryTipoOperacao: TwwQuery;
    QryTipoOperacaoIDTIPOINVEST: TFloatField;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryTipoOperacaoNATUREZAOPERACAO: TStringField;
    //AL_4
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField;
    QryFundoInvestOperacaoMOECODIGO: TFloatField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoCNPJFUNDO: TStringField;
    QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperacaoPZOCARENCIA: TFloatField;
    QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField;
    QryFundoInvestOperacaoPZOLIQRESG: TFloatField;
    QryFundoInvestOperacaoQTDDECQTD: TFloatField;
    QryFundoInvestOperacaoQTDDECVALOR: TFloatField;
    QryFundoInvestOperacaoSTAFUNDO: TStringField;
    QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperacaoPERCTXPERFORM: TFloatField;
    QryFundoInvestOperacaoPERCTXADM: TFloatField;
    QryFundoInvestOperacaoCODFUNCETIP: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField;
    QryFundoInvestOperacaoCONTRCETIP: TStringField;
    sbtnMovimento: TToolbarButton97;
    qryAux: TwwQuery;
    QryData: TwwQuery;
    //AL_3
    Panel7: TPanel;
    Label2: TLabel;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    Panel1: TPanel;
    PgcSaldos: TPageControl;
    TbsSaldo: TTabSheet;
    Panel11: TPanel;
    Panel5: TPanel;
    //AL_3
    Label14: TLabel;
    DbLkcSaldo: TwwDBLookupCombo;
    //AL_3
    Panel10: TPanel;
    //AL_4
    DblTipoFundo: TwwDBLookupCombo;
    Label7: TLabel;
    QryTipoFundo: TwwQuery;
    Label33: TLabel;
    dblGestorCarteira: TwwDBLookupCombo;
    qryGestorCart: TwwQuery;
    qryGestorCartNOME: TStringField;
    qryGestorCartIDGESTORCARTEIRA: TFloatField;
    qryGestorCartIDPESSOA: TFloatField;
    tbsVerificaResg: TTabSheet;
    Panel3: TPanel;
    Panel6: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    DbLkcFundoInvestOperacao: TwwDBLookupCombo;
    DbDtOperacao: TCMDateTimePicker;
    Panel9: TPanel;
    //AL_3
    dbgOperacao: TwwDBGrid;
    QryOperacoes: TwwQuery;
    //AL_3
    DsOperacoes: TwwDataSource;
    QryTotalOperacao: TwwQuery;
    dsTotalOperacao: TwwDataSource;
    //AL_3
    QryUltDataFech: TwwQuery;
    QryVerSaldoFech: TwwQuery;
    PopupMenu1: TPopupMenu;
    BtProduraOperacao: TBitBtn;
    BtProcura: TBitBtn;
    BtProduraSaldo: TBitBtn;
    CbxAplic: TComboBox;
    Label30: TLabel;
    DbDtRefAplc: TCMDateTimePicker;
    Label5: TLabel;
    //AL_3
    QryOperacoesIDOPERACAOFUNDO: TFloatField;
    QryOperacoesIDCARTEIRAINVEST: TFloatField;
    QryOperacoesIDPEDIDOFUNDO: TFloatField;
    QryOperacoesIDTIPOINVEST: TFloatField;
    QryOperacoesIDTIPOOPERACAO: TFloatField;
    QryOperacoesIDFUNDOINVEST: TFloatField;
    QryOperacoesDATAOPERACAO: TDateTimeField;
    QryOperacoesDATALIQUIDACAO: TDateTimeField;
    QryOperacoesQTDOPERACAO: TFloatField;
    QryOperacoesVLROPERACAO: TFloatField;
    QryOperacoesVLRCOTA: TFloatField;
    QryOperacoesVLRIR: TFloatField;
    QryOperacoesVLRIOF: TFloatField;
    QryOperacoesVLRRENDIMENTO: TFloatField;
    QryOperacoesSTACONFIRMA: TStringField;
    QryOperacoesVLRLIQUIDO: TFloatField;
    QryOperacoesIDOPERACAOORIGEM: TFloatField;
    QryOperacoesIDFUNDOINVEST_1: TFloatField;
    QryOperacoesDESCFUNDOINVEST: TStringField;
    QryOperacoesIDGESTORCARTEIRA: TFloatField;
    QryOperacoesTRGDTINCLUSAO: TDateTimeField;
    QryOperacoesTRGUSERINCLUSAO: TStringField;
    QryOperacoesMOECODIGO: TFloatField;
    QryOperacoesIDCARTEIRAINVEST_1: TFloatField;
    QryOperacoesIDTIPOFUNDOINVEST: TFloatField;
    QryOperacoesCNPJFUNDO: TStringField;
    QryOperacoesSTAEXCLUSIVO: TStringField;
    QryOperacoesPZOCARENCIA: TFloatField;
    QryOperacoesPZOANIVERSARIO: TFloatField;
    QryOperacoesPZOLIQAPLIC: TFloatField;
    QryOperacoesPZOLIQRESG: TFloatField;
    QryOperacoesQTDDECQTD: TFloatField;
    QryOperacoesQTDDECVALOR: TFloatField;
    QryOperacoesSTAFUNDO: TStringField;
    QryOperacoesPZOAMORTIZACAO: TFloatField;
    QryOperacoesPERCTXPERFORM: TFloatField;
    QryOperacoesPERCTXADM: TFloatField;
    QryOperacoesCODFUNCETIP: TStringField;
    QryOperacoesSTAPROVISIONAIR: TStringField;
    QryOperacoesSTAPROVISIONAIOF: TStringField;
    QryOperacoesCONTRCETIP: TStringField;
    QryOperacoesIDPLANOPREV: TFloatField;
    QryOperacoesIDPATROCINADORA: TFloatField;
    QryOperacoesIDBOLETA: TFloatField;
    QryOperacoesDATAAPLICACAO: TDateTimeField;
    CbxPlano: TCheckBox;
    //AL_4
    dbGrdSaldos: TwwDBGrid;
    PopMnuSaldo: TPopupMenu;
    MnuUmPlanoAbert: TMenuItem;
    MnuTodosPlanosAbert: TMenuItem;
    sbtnSaldos: TToolbarButton97;
    procedure FormActivate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtProcuraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtProduraSaldoClick(Sender: TObject);
    //AL_3
    procedure sbtnMovimentoClick(Sender: TObject);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    //AL_3
    procedure BtProduraOperacaoClick(Sender: TObject);
    //AL_4
    procedure CbxAplicExit(Sender: TObject);
    //AL_3
    procedure dbgOperacaoUpdateFooter(Sender: TObject);
    procedure dbGrdSaldosUpdateFooter(Sender: TObject);
    procedure CbxPlanoClick(Sender: TObject);
    //AL_4
    procedure CmeCadastroFind(Sender: TObject);
    procedure DblTipoFundoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure MnuUmPlanoAbertClick(Sender: TObject);
    procedure MnuTodosPlanosAbertClick(Sender: TObject);
    procedure DtEdDataReferenciaGeralEnter(Sender: TObject);
    procedure DblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DblTipoFundoEnter(Sender: TObject);
    procedure dblGestorCarteiraEnter(Sender: TObject);
    procedure dblGestorCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblGestorCarteiraExit(Sender: TObject);
    procedure DbDtOperacaoExit(Sender: TObject);

  private
    { Private declarations }
    //AL_4   //AL_5
    wValAnt,MascaraDecQtdHist,MascaraDecVlrHist : String;
    bModif  : Boolean;
        
    Procedure SelecionaPageControl;
    //AL_4
    Procedure AbreQryFundoInvestoperacao;
    //AL_5
    Procedure MontaSqlSaldo;  

  public
    { Public declarations }
  end;

var
  frmConsVerificaResgates: TfrmConsVerificaResgates;

implementation

Uses
  UmensErro,UDataBase, uBibliotecaInvest, uSistema, UDiasUteisInv,
  dBaseDados, UFundoComum, dFundoComum, FConsMovFundos, FTelaAut,
  //AL_4
  UOperComum, {FDmRelFundosSaldo KTN 1607521 SOL 174651} FDmRelVerificaAcoes;
{$R *.DFM}

procedure TfrmConsVerificaResgates.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmConsVerificaResgates.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TfrmConsVerificaResgates.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TfrmConsVerificaResgates.BtProcuraClick(Sender: TObject);
begin
  inherited;
   //AL_3
   If Trim(DtEdDataReferenciaGeral.Text) = '' Then
      Exit;

   With QryFundoInvestOperacao Do
   Begin
      OperComum.LimpaParametros(QryFundoInvestOperacao);
      if Trim(DtEdDataReferenciaGeral.Text) <> '' then
         ParamByName('DATAOPERACAO').AsString := DtEdDataReferenciaGeral.Text;
      If Trim(DblTipoFundo.Text) <> ''  Then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
             QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If Trim(dblGestorCarteira.Text) <> ''  Then
         ParamByName('IDGESTORCARTEIRA').AsInteger :=
             qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      Open;
   End;

   //AL_5
   //AL_4

   MontaSqlSaldo;

   DbDtOperacao.Text    := DtEdDataReferenciaGeral.Text;
   DbDtOperacao.Date    := DtEdDataReferenciaGeral.Date;

   //AL_3
   BtProduraOperacaoClick(Sender);

   SelecionaPageControl;

end;

procedure TfrmConsVerificaResgates.FormShow(Sender: TObject);
begin
  inherited;
  //AL_4
  MontaSelect.Filtro.Add('HISTFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));

  MnuUmPlanoAbert.Caption  := sPlanPrevCtbPatro;

  QryTipoOperacao.Open;
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;
  qryGestorCart.Open;
  QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryFundoInvestOperacao.Open;
  //AL_3
  // Prepara Ambiente
  CbxAplic.Text := '';

  //Verifica a ultima data de fechamento
  QryUltDataFech.Close;
  QryUltDataFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  QryUltDataFech.ParamByName('IDTIPOFUNDOINVEST').Clear;
  QryUltDataFech.Open;
  While Not QryUltDataFech.Eof Do
  Begin
     DtEdDataReferenciaGeral.Text     := QryUltDataFech.FieldByName('DATAULTFECH').AsString;
     DtEdDataReferenciaGeral.Repaint;

     If QryUltDataFech.FieldByName('DATAULTFECH').AsDateTime < pRPI.DATAULTFECHFDO Then
     begin

        //Verifica se há saldo
        QryVerSaldoFech.Close;
        QryVerSaldoFech.ParamByName('IDFUNDOINVEST').Clear;
        QryVerSaldoFech.ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
        QryVerSaldoFech.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
        QryVerSaldoFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
        QryVerSaldoFech.Open;

        If (Not QryVerSaldoFech.IsEmpty) Then
           QryUltDataFech.Last;

        QryVerSaldoFech.Close;

        QryUltDataFech.Next;
     end
     else
        QryUltDataFech.Last;
  End;

  If DtEdDataReferenciaGeral.Text = '' Then
  Begin
     DtEdDataReferenciaGeral.Text := DateToStr(Date);
     DtEdDataReferenciaGeral.Repaint;
  End;

  QryUltDataFech.Close;

  //AL_3
  BtProcuraClick(Sender);

end;

//**************
// OK Pedido
procedure TfrmConsVerificaResgates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryFundoInvestOperacao.Close;
  QryTipoOperacao.Close;
end;

procedure TfrmConsVerificaResgates.BtProduraSaldoClick(Sender: TObject);
begin
  inherited;
   //AL_3
   If Trim(DtEdDataReferenciaGeral.Text) = '' Then
      Exit;
   //AL_5

   MontaSqlSaldo;
end;

//AL_3
procedure TfrmConsVerificaResgates.sbtnMovimentoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmConsMovFundos, TfrmConsMovFundos, False);
   sbtnMovimento.Down := False;
end;

//AL_3
procedure TfrmConsVerificaResgates.DtEdDataReferenciaGeralExit(
  Sender: TObject);
begin
  inherited;
   //AL_4
   If ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DtEdDataReferenciaGeral.Text)) Then
   begin
      AbreQryFundoInvestoperacao;
      BtProduraSaldoClick(Sender);
   end;

end;

procedure TfrmConsVerificaResgates.SelecionaPageControl;
begin
   If QryOperacoes.RecordCount > 0 Then
      PgcSaldos.ActivePage := tbsVerificaResg
   Else
      PgcSaldos.ActivePage := TbsSaldo;
end;

procedure TfrmConsVerificaResgates.BtProduraOperacaoClick(Sender: TObject);
begin
   inherited;
   If Trim(DbDtOperacao.Text) = '' Then
      Exit; 

   //AL_3
   // Preenche os Paramentros e refaz a Consulta das Aplicacoes
   with QryTotalOperacao do
   begin
      OperComum.LimpaParametros(QryTotalOperacao);

      if Trim(DbLkcFundoInvestOperacao.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsString := DbLkcFundoInvestOperacao.LookupValue;

      if Trim(DblTipoFundo.Text) <> ''  then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                      QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

      If Trim(dblGestorCarteira.Text) <> ''  Then
         ParamByName('IDGESTORCARTEIRA').AsInteger  :=
                      qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

      ParamByName('DATAOPERACAO').AsString          := DbDtOperacao.Text;
      ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
      if CbxPlano.Checked then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      Open;
   end;

   //AL_3
   with QryOperacoes do
   begin
     OperComum.LimpaParametros(QryOperacoes);
     ParamByName('DATAOPERACAO').AsString    := DbDtOperacao.Text;

     if Trim(DbLkcFundoInvestOperacao.Text) <> '' then
        ParamByName('IDFUNDOINVEST').AsString := DbLkcFundoInvestOperacao.LookupValue;

     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger  :=
                     qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

     ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
     if CbxPlano.Checked then
        ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     Open;
   end;
end;

//AL_4

procedure TfrmConsVerificaResgates.CbxAplicExit(Sender: TObject);
begin
  inherited;
   //Alt_1
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);
end;

//AL_3
procedure TfrmConsVerificaResgates.dbgOperacaoUpdateFooter(
  Sender: TObject);
var QtdDec : Integer;
begin
  inherited;
  QtdDec  := 12;
   if Trim(DbLkcFundoInvestOperacao.Text) <> '' then
     QtdDec   := QryFundoInvestOperacaoQTDDECQTD.AsInteger;

  inherited;
  if not QryTotalOperacao.IsEmpty then
  begin
     dbgOperacao.Columns[0].FooterValue  := 'TOTAL';
     dbgOperacao.Columns[4].FooterValue  := FloatToStrF(QryTotalOperacao.FieldByName('QTDOPERACAO').AsFloat,ffNumber,26,QtdDec);
     dbgOperacao.Columns[5].FooterValue  := FloatToStrF(QryTotalOperacao.FieldByName('VLROPERACAO').AsFloat,ffNumber,20,2);
     dbgOperacao.Columns[6].FooterValue  := FloatToStrF(QryTotalOperacao.FieldByName('VLRIR').AsFloat,ffNumber,16,2);
     dbgOperacao.Columns[7].FooterValue  := FloatToStrF(QryTotalOperacao.FieldByName('VLRIOF').AsFloat,ffNumber,14,2);
  end;

end;

//AL_3
procedure TfrmConsVerificaResgates.dbGrdSaldosUpdateFooter(
  Sender: TObject);
var QtdDec : Integer;
begin
   //AL_5

   with DmRelVerificaAcoes do
    begin
       dbGrdSaldos.Columns[0].FooterValue  := 'SALDO TOTAL';
       dbGrdSaldos.Columns[4].FooterValue  := FormatFloat(MascaraDecQtdHist,QrySaldoTotSALDOQTDCOTASG.AsFloat);
       dbGrdSaldos.Columns[5].FooterValue  := FormatFloat('###,###,###,##0.00',QrySaldoTotSALDOVLRFUNDOG.AsFloat);
       dbGrdSaldos.Columns[7].FooterValue  := FormatFloat(MascaraDecQtdHist,QrySaldoTotSALDOQTDCOTASBLQG.AsFloat);
       dbGrdSaldos.Columns[8].FooterValue  := FormatFloat('#,###,###,##0.00',QrySaldoTotVLRIOFPROVG.AsFloat);
       dbGrdSaldos.Columns[9].FooterValue  := FormatFloat('#,###,###,##0.00',QrySaldoTotVLRIRPROVG.AsFloat);
       dbGrdSaldos.Columns[10].FooterValue := FormatFloat('###,###,###,##0.00',QrySaldoTotSALDOLIQUIDOG.AsFloat);
    end; 

end;

//AL_3
procedure TfrmConsVerificaResgates.CbxPlanoClick(Sender: TObject);
begin
  inherited;
   BtProcuraClick(Sender);
end;

//AL_4
procedure TfrmConsVerificaResgates.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      DtEdDataReferenciaGeral.Text := MontaSelect.ValoresChave[3];

      DblTipoFundo.LookupValue := MontaSelect.ValoresChave[0];
      DblTipoFundo.PerformSearch;

      AbreQryFundoInvestoperacao;

      DbLkcSaldo.LookupValue   := MontaSelect.ValoresChave[2];
      DbLkcSaldo.PerformSearch;

      DbDtOperacao.Text := MontaSelect.ValoresChave[3];

      DbLkcFundoInvestOperacao.LookupValue   := MontaSelect.ValoresChave[2];
      DbLkcFundoInvestOperacao.PerformSearch;

      CbxPlano.Checked := True;
      CbxPlanoClick(Sender);
   end;
end;

//AL_4
procedure TfrmConsVerificaResgates.AbreQryFundoInvestoperacao;
begin
   with QryFundoInvestOperacao do
   begin
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger :=
            qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(DtEdDataReferenciaGeral.Text) <> '' then
        ParamByName('DATAOPERACAO').AsString := DtEdDataReferenciaGeral.Text;
     Open;
   end;
end;

//AL_4
procedure TfrmConsVerificaResgates.DblTipoFundoExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DblTipoFundo.LookupValue))) then
  begin
     AbreQryFundoInvestoperacao;
     BtProduraSaldoClick(Sender);
  end;
  bModif := false;
end;

//AL_4
procedure TfrmConsVerificaResgates.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
end;

//AL_4
procedure TfrmConsVerificaResgates.MnuUmPlanoAbertClick(Sender: TObject);
begin
  inherited;
  //AL_5
   if CbxPlano.Checked then
      CbxPlano.Checked := False;

   MontaSqlSaldo;

   with DmRelVerificaAcoes do
   begin
      QrySaldoDet.DisableControls;

      //AL_5

      pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;

      if not CbxPlano.Checked then
             LblPlano.Caption := sPlanPrevCtbPatro;

      ghbCabecalhoPlano.Visible := (CbxPlano.Checked);
      gfbRodapePlano.Visible := (CbxPlano.Checked);


      // Formatando as colunas do relatorio total
      DmRelVerificaAcoes.ppDBSaldoFundosQTD.DisplayFormat := MascaraDecQtdHist; // QtdeCotas
      DmRelVerificaAcoes.ppDBText2.DisplayFormat          := MascaraDecQtdHist; // QtdeBloqueada
      DmRelVerificaAcoes.ppDBCalc1.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      DmRelVerificaAcoes.ppDBCalc2.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      DmRelVerificaAcoes.ppDBCalc3.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      DmRelVerificaAcoes.ppDBCalc4.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      //Formatando as colunas do relatorio detalhe
      DmRelVerificaAcoes.ppDBSSaldoFundosVlrCota.DisplayFormat := MascaraDecVlrHist;
      DmRelVerificaAcoes.ppDBText1.DisplayFormat               := MascaraDecQtdHist;
      DmRelVerificaAcoes.ppDBSSaldoFundosQTD.DisplayFormat     := MascaraDecQtdHist; // Fim AL_5

      //Al_6
      TfrmPreview.CreateModalPreview(Application,
                                     rptSaldoFundos,
                                     rptSaldoFundos.PrinterSetup.DocumentName);
      QrySaldoDet.Filter   := '';
      QrySaldoDet.Filtered := False;
      QrySaldoTot.Filter   := '';
      QrySaldoTot.Filtered := False;
      QrySaldoDet.EnableControls;
   end;
end;

//AL_4
procedure TfrmConsVerificaResgates.MnuTodosPlanosAbertClick(
  Sender: TObject);
begin
  inherited;
   //AL_5
   if not CbxPlano.Checked then
          CbxPlano.Checked := True;
   MontaSqlSaldo;

   with DmRelVerificaAcoes do
   begin
      QrySaldoDet.DisableControls;

      //AL_5

      pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;

      LblPlano.Caption := 'TODOS OS PLANOS';

      ghbCabecalhoPlano.Visible := (CbxPlano.Checked);
      gfbRodapePlano.Visible := (CbxPlano.Checked);

      // Formatando as colunas do relatorio total
      DmRelVerificaAcoes.ppDBSaldoFundosQTD.DisplayFormat := MascaraDecQtdHist; // QtdeCotas
      DmRelVerificaAcoes.ppDBText2.DisplayFormat          := MascaraDecQtdHist; // QtdeBloqueada
      DmRelVerificaAcoes.ppDBCalc1.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      DmRelVerificaAcoes.ppDBCalc2.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      DmRelVerificaAcoes.ppDBCalc3.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      DmRelVerificaAcoes.ppDBCalc4.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      //Formatando as colunas do relatorio detalhe
      DmRelVerificaAcoes.ppDBSSaldoFundosVlrCota.DisplayFormat := MascaraDecVlrHist;
      DmRelVerificaAcoes.ppDBText1.DisplayFormat               := MascaraDecQtdHist;
      DmRelVerificaAcoes.ppDBSSaldoFundosQTD.DisplayFormat     := MascaraDecQtdHist; // Fim AL_5


      //Al_6
      TfrmPreview.CreateModalPreview(Application,
                                     rptSaldoFundos,
                                     rptSaldoFundos.PrinterSetup.DocumentName);
      QrySaldoDet.Filter   := '';
      QrySaldoDet.Filtered := False;
      QrySaldoTot.Filter   := '';
      QrySaldoTot.Filtered := False;
      QrySaldoDet.EnableControls;
   end;
end;

//AL_4
procedure TfrmConsVerificaResgates.DtEdDataReferenciaGeralEnter(
  Sender: TObject);
begin
  inherited;
  wValAnt := DtEdDataReferenciaGeral.Text;
end;

//AL_4
procedure TfrmConsVerificaResgates.DblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;  
  if ((modified) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DblTipoFundo.LookupValue))) Then
  begin
     AbreQryFundoInvestoperacao;
     BtProduraSaldoClick(Sender);
  end;
end;

//AL_4
procedure TfrmConsVerificaResgates.DblTipoFundoEnter(Sender: TObject);
begin
  inherited;
  wValAnt := DblTipoFundo.LookupValue;
end;

//AL_4
procedure TfrmConsVerificaResgates.dblGestorCarteiraEnter(Sender: TObject);
begin
  inherited;
  wValAnt := dblGestorCarteira.LookupValue;
end;

//AL_4
procedure TfrmConsVerificaResgates.dblGestorCarteiraCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  if ((modified) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> dblGestorCarteira.LookupValue))) Then
  begin
     AbreQryFundoInvestoperacao;
     BtProduraSaldoClick(Sender);
  end;
end;

//AL_4
procedure TfrmConsVerificaResgates.dblGestorCarteiraExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> dblGestorCarteira.LookupValue))) then
  begin
     AbreQryFundoInvestoperacao;
     BtProduraSaldoClick(Sender);
  end;
  bModif := false;
end;

//AL_4
procedure TfrmConsVerificaResgates.DbDtOperacaoExit(Sender: TObject);
var iFundo: Integer;
begin
   inherited;
   iFundo := 0;
   with QryFundoInvestOperacao do
   begin
     if Trim(DbLkcFundoInvestOperacao.Text) <> '' then
        iFundo := FieldByName('IDFUNDOINVEST').AsInteger;
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     if Trim(DtEdDataReferenciaGeral.Text) <> '' then
        ParamByName('DATAOPERACAO').AsString := DtEdDataReferenciaGeral.Text;
     if Trim(DbDtOperacao.Text) <> '' then
        ParamByName('DATAOPERACAO').AsString := DbDtOperacao.Text;
     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger :=  qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvestUsu;
     Open;
     if iFundo > 0 then
     begin
        if Locate('IDFUNDOINVEST',iFundo,[]) then
           DbLkcFundoInvestOperacao.Text := FieldByName('DESCFUNDOINVEST').AsString;
        DbLkcFundoInvestOperacao.PerformSearch;
     end;
   end;
end;

//AL_5
procedure TfrmConsVerificaResgates.MontaSqlSaldo;
begin
   //Montando as Mascaras de Histfundo
   //Atenção as mascaras tem relacao com a data do saldo do fundo
   If Trim(DbLkcSaldo.Text) <> '' Then
   Begin
      MascaraDecVlrHist := MontaMascaraDecVlrHist(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
      MascaraDecQtdHist := MontaMascaraDecQtdHist(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
   End
   Else
   Begin
      MascaraDecVlrHist := '###,#0.000000000000';
      MascaraDecQtdHist := '###,#0.000000000000';
   end;
   // Montando mascara de detalhe
   DmRelVerificaAcoes.QrySaldoDetVLRCOTAAPLICACAO.DisplayFormat := MascaraDecVlrHist;
   DmRelVerificaAcoes.QrySaldoDetVLRCOTAATUAL.DisplayFormat     := MascaraDecVlrHist;
   DmRelVerificaAcoes.QrySaldoDetSALDOQTDCOTAS.DisplayFormat    := MascaraDecQtdHist;
   DmRelVerificaAcoes.QrySaldoDetSALDOQTDCOTASBLQ.DisplayFormat := MascaraDecQtdHist;
   // Montando mascara de Rodape
   DmRelVerificaAcoes.QrySaldoTotSALDOQTDCOTASG.DisplayFormat    := MascaraDecQtdHist;
   DmRelVerificaAcoes.QrySaldoTotSALDOQTDCOTASBLQG.DisplayFormat := MascaraDecQtdHist;
   DmRelVerificaAcoes.QrySaldoTotVLRIOFPROVG.DisplayFormat       := '#,###,###,##0.00';
   DmRelVerificaAcoes.QrySaldoTotVLRIRPROVG.DisplayFormat        := '#,###,###,##0.00';
   DmRelVerificaAcoes.QrySaldoTotSALDOLIQUIDOG.DisplayFormat     := '###,###,###,##0.00';
   DmRelVerificaAcoes.QrySaldoTotSALDOVLRFUNDOG.DisplayFormat    := '###,###,###,##0.00';

   // Montando a Query Detalhe
   DmRelVerificaAcoes.QrySaldoDet.DisableControls;
   DmRelVerificaAcoes.QrySaldoTot.DisableControls;
   OperComum.LimpaParametros(DmRelVerificaAcoes.QrySaldoDet);

   DmRelVerificaAcoes.QrySaldoDet.SQL.Clear;
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('SELECT /*+INDEX (H1.XPKHISTFUNDO)*/' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       FI.IDFUNDOINVEST, FI.DESCFUNDOINVEST, '+ #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       FI.IDTIPOFUNDOINVEST,FI.DESCTIPOFUNDOINV,'+ #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       H1.DATAAPLICACAO, H1.DATAMOVFUNDO,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       H1.SALDOQTDCOTAS, H1.SALDOQTDCOTASBLQ,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       NVL(CAT.VLRCOTA,0)       AS VLRCOTAATUAL,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       H1.SALDOVLRFUNDO,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       NVL(H1.VLRIRPROV,0)    AS VLRIRPROV,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       NVL(H1.VLRIOFPROV,0)   AS VLRIOFPROV,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       (NVL(H1.SALDOVLRFUNDO,0) - NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUIDO,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       NVL(H1.COTAAPLICACAO,0) AS VLRCOTAAPLICACAO,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       PLANO.PLANPRVCONTABPATRO,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       H1.IDPLANPREVCTBPATR,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       TC.DESCTIPOCOTA ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('FROM' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       HISTFUNDO H1,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/  MAX(HI.IDHISTFUNDO) AS IDHISTFUNDO ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('        FROM HISTFUNDO HI, ' + #13);

   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             (SELECT IDTIPOINVEST, IDTIPOOPERACAO' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('              FROM   TIPOOPERACAO ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('              WHERE (IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                    AND   (NATUREZAOPERACAO <> ''R'')) TP,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('              FROM HISTFUNDOINVEST HF1 ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('              WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                         (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                          FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                          WHERE ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                              (TF.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                              AND  (TF.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if DbLkcSaldo.Text <> '' then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                              AND  (HF.IDFUNDOINVEST     = '+DbLkcSaldo.LookupValue+')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                              AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1) ' + #13);
   if dblGestorCarteira.Text <> ''  then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                              AND  (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                              AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST) ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                              GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                    AND  (HF1.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')'+ #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                                                                                                              ) FI ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('        WHERE ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             (HI.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if not CbxPlano.Checked then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             AND  (HI.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+')' + #13)
   else
      DmRelVerificaAcoes.QrySaldoDet.Sql.add('             AND (HI.IDPLANPREVCTBPATR > 0)');
   if DbLkcSaldo.Text <> '' then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             AND (HI.IDFUNDOINVEST = '+DbLkcSaldo.LookupValue+')' + #13)
   else
      DmRelVerificaAcoes.QrySaldoDet.Sql.add('             AND (HI.IDFUNDOINVEST > 0)');
   if Trim(DbDtRefAplc.Text) <> '' then
   begin
      if CbxAplic.ItemIndex = 1 Then
         DmRelVerificaAcoes.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO < TO_DATE('+QuotedStr(DbDtRefAplc.Text)+',''DD/MM/YYYY''))')
      else if CbxAplic.ItemIndex = 2 Then
              DmRelVerificaAcoes.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO >= TO_DATE('+QuotedStr(DbDtRefAplc.Text)+',''DD/MM/YYYY''))')
           else
              DmRelVerificaAcoes.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO <= TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY''))');
   end;
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             AND (HI.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+', ''DD/MM/YYYY'')) ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             AND (HI.TIPMOVFUNDO      <> ''PIR'') ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             AND (FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST) ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOINVEST      = HI.IDTIPOINVEST) ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO) ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('             GROUP BY HI.IDTIPOINVEST,  HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                      HI.DATAMOVFUNDO,  HI.IDTIPOCOTA) HM,' + #13);

   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       COTAFUNDO CAT, TIPOCOTA TC, ' + #13);

   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST,TF1.DESCTIPOFUNDOINV' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('        FROM HISTFUNDOINVEST HF1,TIPOFUNDOINVEST TF1' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('        WHERE' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('           (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                 (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                  FROM   HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                  WHERE ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                      (TF.IDTIPOINVEST       = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                       AND (TF.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if DbLkcSaldo.Text <> '' then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                       AND (HF.IDFUNDOINVEST     = '+ DbLkcSaldo.LookupValue +')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                       AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);
   If dblGestorCarteira.Text <> ''  then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                       AND (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                       AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST)' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('                       GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelVerificaAcoes.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ) FI,' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('       VWPLANPREVCTBPATR PLANO' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('WHERE ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     (H1.IDHISTFUNDO       = HM.IDHISTFUNDO) ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     AND (H1.SALDOQTDCOTAS > 0)' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     AND (H1.IDPLANPREVCTBPATR = PLANO.IDPLANPREVCTBPATR)' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = FI.IDFUNDOINVEST)' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     AND (H1.DATAMOVFUNDO      = CAT.DATACOTA(+))' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = CAT.IDFUNDOINVEST(+))' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     AND (NVL(H1.IDTIPOCOTA,0) = NVL(CAT.IDTIPOCOTA(+),0))' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('     AND (H1.IDTIPOCOTA        =  TC.IDTIPOCOTA(+)) ' + #13);
   DmRelVerificaAcoes.QrySaldoDet.SQL.Add('ORDER BY PLANPRVCONTABPATRO, IDPLANPREVCTBPATR, DESCFUNDOINVEST, DATAAPLICACAO, DESCTIPOCOTA' + #13);

   // Montando a Query Tot da Query Detalhe
   // Preparando a QrySaldoTot
   DmRelVerificaAcoes.QrySaldoTot.Filter := '';
   DmRelVerificaAcoes.QrySaldoTot.Filtered  := False;
   OperComum.LimpaParametros(DmRelVerificaAcoes.QrySaldoTot);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Clear;
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.DESCTIPOFUNDOINV, DET.PLANPRVCONTABPATRO, DET.DESCFUNDOINVEST,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.IDTIPOFUNDOINVEST, DET.IDPLANPREVCTBPATR, DET.IDFUNDOINVEST,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTAS, '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTASBLQ, '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.SALDOVLRFUNDO,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.VLRIOFPROV,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.VLRIRPROV,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DET.SALDOLIQUIDO,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASG, '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASBLQG, '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('GERAL.SALDOVLRFUNDOG,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('GERAL.VLRIOFPROVG,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('GERAL.VLRIRPROVG,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('GERAL.SALDOLIQUIDOG FROM ( ' + #13);
   // Detalhe
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( '' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS, '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQ, '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SUM(VLRIOFPROV) AS VLRIOFPROV,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SUM(VLRIRPROV) AS VLRIRPROV,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('SUM(SALDOLIQUIDO) AS SALDOLIQUIDO FROM( ' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add(DmRelVerificaAcoes.QrySaldoDet.Sql.GetText);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( ')' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( 'GROUP BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( 'ORDER BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST ' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( '' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( ' ) DET, ' + #13);
   // Fim Detalhe
   // Geral
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( '' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('( SELECT '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTAS) AS SALDOQTDCOTASG,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQG,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('         SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDOG, '+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('         SUM(VLRIOFPROV) AS VLRIOFPROVG,'+ #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('         SUM(VLRIRPROV) AS VLRIRPROVG,' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add('         SUM(SALDOLIQUIDO) AS SALDOLIQUIDOG FROM( ' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add(                      DmRelVerificaAcoes.QrySaldoDet.Sql.GetText);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( '                                               )' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( '' + #13);
   DmRelVerificaAcoes.QrySaldoTot.Sql.Add( ' ) GERAL ' + #13);
   // Fim Geral

   DmRelVerificaAcoes.QrySaldoTot.Open;

   if DmRelVerificaAcoes.QrySaldoTot.IsEmpty then
   begin
      if DtEdDataReferenciaGeral.CanFocus then
         DtEdDataReferenciaGeral.SetFocus;
         Exit;
   end;

   DmRelVerificaAcoes.QrySaldoDet.Filter := '';
   DmRelVerificaAcoes.QrySaldoDet.Filtered  := False;
   DmRelVerificaAcoes.QrySaldoDet.Open;

   DmRelVerificaAcoes.QrySaldoDet.EnableControls;
   DmRelVerificaAcoes.QrySaldoTot.EnableControls;

   // No caso de ser Fundo de Dir Cred ou Part
   DmRelVerificaAcoes.QrySaldoDetDESCTIPOCOTA.Visible := iTipoInvestUsu in [9,10];

   pnlFundo.Enabled := True;

   sbtnSaldos.Down  := False;

   dbGrdSaldosUpdateFooter(Self);
end;

end.
