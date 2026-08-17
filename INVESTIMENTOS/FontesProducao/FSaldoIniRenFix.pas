unit FSaldoIniRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid,URegra, wwdblook, TB97Ctls;

type
  TfrmVerSaldoRenFix = class(TfrmOkCancelarInv)
    dsHistorico: TwwDataSource;
    dsOperacoes: TwwDataSource;
    dsItensOperacao: TwwDataSource;
    dsItensCurva: TwwDataSource;
    dsItemsHistorico: TwwDataSource;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoIDMOEDACONTAB: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    qryInvestimentoIDTIPOINVEST: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoFLGATIVO: TStringField;
    qryInvestimentoOBSINVESTIMENTO: TStringField;
    qryInvestimentoDESCCLASSINVEST: TStringField;
    qryInvestimentoCODISIN: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    pnlTopo: TPanel;
    pnlHistorico: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    pnlOperacoes: TPanel;
    wwDBGrid2: TwwDBGrid;
    Panel3: TPanel;
    Splitter5: TSplitter;
    pnlRodape: TPanel;
    pnlItensCurvas: TPanel;
    wwDBGrid4: TwwDBGrid;
    Panel5: TPanel;
    Splitter6: TSplitter;
    Panel6: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    dtFinal: TCMDateTimePicker;
    dblInvestimento: TwwDBLookupCombo;
    pnlMeio: TPanel;
    pnlHistItems: TPanel;
    wwDBGrid5: TwwDBGrid;
    Panel1: TPanel;
    pnlOperItens: TPanel;
    wwDBGrid3: TwwDBGrid;
    Panel4: TPanel;
    Splitter4: TSplitter;
    updOperacoes: TUpdateSQL;
    updItemsHistorico: TUpdateSQL;
    updItensCurva: TUpdateSQL;
    qryBuscaSaldosHist: TwwQuery;
    qryBuscaSaldosHistIDHISTRENFIX: TFloatField;
    qryBuscaSaldosHistIDEMPRESAPROP: TFloatField;
    qryBuscaSaldosHistIDMODULO: TFloatField;
    qryBuscaSaldosHistIDPLANPREVCTBPATR: TFloatField;
    qryBuscaSaldosHistPLNCODIGO: TFloatField;
    qryBuscaSaldosHistCODDOCUMENTO: TFloatField;
    qryBuscaSaldosHistIDTIPOINVEST: TFloatField;
    qryBuscaSaldosHistIDTIPOOPERACAO: TFloatField;
    qryBuscaSaldosHistIDCARTEIRAINVEST: TFloatField;
    qryBuscaSaldosHistIDOPERRENFIXAPLIC: TFloatField;
    qryBuscaSaldosHistIDOPERRENFIX: TFloatField;
    qryBuscaSaldosHistIDINVESTIMENTO: TFloatField;
    qryBuscaSaldosHistDATAHISTRENFIX: TDateTimeField;
    qryBuscaSaldosHistVLRHISTRENFIX: TFloatField;
    qryBuscaSaldosHistQTDHISTRENFIX: TFloatField;
    qryBuscaSaldosHistSALDOVLRHISTRENFI: TFloatField;
    qryBuscaSaldosHistSALDOQTDHISTRENFI: TFloatField;
    qryBuscaSaldosHistTIPMOVHISRENFIX: TStringField;
    qryBuscaSaldosHistNATURMOVHISTRENFI: TStringField;
    qryBuscaSaldosHistHISTMOVRENFIX: TStringField;
    qryBuscaSaldosHistDESCINVESTIMENTO: TStringField;
    qryBuscaSaldosHistIDCLASSETIT: TFloatField;
    qryBuscaSaldosHistCARENCIA: TFloatField;
    qryBuscaSaldosHistSIGLAEMISSOR: TStringField;
    qryBuscaSaldosOper: TwwQuery;
    qryBuscaSaldosOperIDOPERRENFIX: TFloatField;
    qryBuscaSaldosOperDATAOPERACAO: TDateTimeField;
    qryBuscaSaldosOperVLROPERACAO: TFloatField;
    qryBuscaSaldosOperQTDEOPERACAO: TFloatField;
    qryBuscaSaldosOperPUOPERACAO: TFloatField;
    qryBuscaSaldosOperPUEMISSAO: TFloatField;
    qryBuscaSaldosOperDATAEMISSAO: TDateTimeField;
    qryBuscaSaldosOperVENCOPERACAO: TDateTimeField;
    qryBuscaSaldosOperNATUREZAOPERACAO: TStringField;
    qryBuscaSaldosOperIDINVESTIMENTO: TFloatField;
    qryBuscaSaldosOperIDCUSTODIANTE: TFloatField;
    qryBuscaSaldosOperIDCARTEIRAINVEST: TFloatField;
    qryBuscaSaldosOperIDPLANPREVCTBPATR: TFloatField;
    qryBuscaSaldosOperIDFORCLI: TFloatField;
    qryBuscaSaldosOperMOECODIGO: TFloatField;
    qryBuscaSaldosOperIDTIPOOPERACAO: TFloatField;
    qryBuscaSaldosOperOBSERVACAO: TStringField;
    qryBuscaSaldosOperFLGGERACONTAB: TFloatField;
    qryBuscaSaldosItems: TwwQuery;
    qryBuscaSaldosItemsIDHISTRENFIX: TFloatField;
    qryBuscaSaldosItemsIDCURVARENFIX: TFloatField;
    qryBuscaSaldosItemsIDITEMRENFIX: TFloatField;
    qryBuscaSaldosItemsPUITEM: TFloatField;
    qryBuscaSaldosItemsPUACUITEM: TFloatField;
    qryBuscaSaldosItemsIDREGRACALCULO: TFloatField;
    qryBuscaSaldosItemsCODITEMRENFIX: TStringField;
    qryBuscaSaldosItemsIDREGRA: TFloatField;
    qryBuscaSaldosItemsFLGMOEDA: TStringField;
    qryBuscaSaldosItemsFLGDESTACADO: TStringField;
    qryBuscaSaldosItemsFLGCENTRALIZADO: TStringField;
    qryBuscaSaldosItemsSEQCALCULO: TFloatField;
    qryBuscaSaldosItemsDESCITEMRENFIX: TStringField;
    qryBuscaSaldosItemsOper: TwwQuery;
    qryBuscaSaldosItemsOperDESCITEMRENFIX: TStringField;
    qryBuscaSaldosItemsOperVLRCURVA: TFloatField;
    qryBuscaSaldosItemsOperPERCCURVA: TFloatField;
    qryBuscaSaldosItemsOperCODITEMRENFIX: TStringField;
    qryBuscaSaldosItemsOperSEQCALCULO: TFloatField;
    qryBuscaSaldosItemsOperMOESIGLA: TStringField;
    qryBuscaSaldosItemsOperIDOPERRENFIX: TFloatField;
    qryBuscaSaldosItemsOperIDITEMRENFIX: TFloatField;
    qryBuscaSaldosItemsOperIDCURVARENFIX: TFloatField;
    qryBuscaSaldosItemsOperIDREGRA: TFloatField;
    qryBuscaSaldosItemsOperFLGMOEDA: TStringField;
    qryBuscaSaldosItemsOperFLGDESTACADO: TStringField;
    qryBuscaSaldosItemsOperFLGCENTRALIZADO: TStringField;
    qryBuscaSaldosItemsOperMOECODIGO: TFloatField;
    qryBuscaSaldosItemsXCurvas: TwwQuery;
    qryBuscaSaldosItemsXCurvasDESCITEMRENFIX: TStringField;
    qryBuscaSaldosItemsXCurvasSEQCALCULO: TFloatField;
    qryBuscaSaldosItemsXCurvasIDCURVARENFIX: TFloatField;
    qryBuscaSaldosItemsXCurvasIDITEMRENFIX: TFloatField;
    qryBuscaSaldosItemsXCurvasIDREGRA: TFloatField;
    qryBuscaSaldosItemsXCurvasFLGMOEDA: TStringField;
    qryBuscaSaldosItemsXCurvasFLGDESTACADO: TStringField;
    qryBuscaSaldosItemsXCurvasFLGCENTRALIZADO: TStringField;
    qryUpdHistorico: TwwQuery;
    updHistorico: TUpdateSQL;
    qryUpdBuscaSaldosItems: TwwQuery;
    Panel7: TPanel;
    btnAltHistorico: TBitBtn;
    btnOKHistorico: TBitBtn;
    Panel8: TPanel;
    btnAltItensHistorico: TBitBtn;
    btnOKItensHistorico: TBitBtn;
    Panel9: TPanel;
    btnAltOperRenFix: TBitBtn;
    btnOkOperRenFix: TBitBtn;
    Panel10: TPanel;
    btnAltItensOper: TBitBtn;
    btnOkItensOper: TBitBtn;
    qryUpdItensOperacao: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField2: TStringField;
    FloatField4: TFloatField;
    StringField3: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField8: TFloatField;
    UpdItensOperacao: TUpdateSQL;
    qryUpdOperacoes: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    function BuscaSaldos(dDataSaldo: TDateTime; iInvestimento: Integer = -1;
                         iOperacao: Integer = -1; iClassePoup: Integer = -1): Boolean;
    procedure btnOKHistoricoClick(Sender: TObject);
    procedure btnAltHistoricoClick(Sender: TObject);
    procedure btnOKItensHistoricoClick(Sender: TObject);
    procedure btnAltItensHistoricoClick(Sender: TObject);
    procedure wwDBGrid5RowChanged(Sender: TObject);
    procedure btnOkItensOperClick(Sender: TObject);
    procedure btnAltItensOperClick(Sender: TObject);
    procedure wwDBGrid3RowChanged(Sender: TObject);
    procedure btnAltOperRenFixClick(Sender: TObject);
    procedure btnOkOperRenFixClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerSaldoRenFix: TfrmVerSaldoRenFix;
  dDataProc : TDateTime;
  iIdHistRenFix : Integer;
  fPUAcuItem,fPUItem : Double;

implementation

uses UBibliotecaInvest, dBaseDados, UMensErro, USistema, UDataBase, UDiasUteisInv, URendaFixa,
     dRendaFixa, ULancContab;


{$R *.DFM}

procedure TfrmVerSaldoRenFix.FormShow(Sender: TObject);
var
   dDataIni : TDateTime;
begin
   inherited;
   qryInvestimento.Open;
   dtFinal.Date  := pRPI.DATAULTFECHRF;

   btnOKHistorico.Enabled := False;
   btnOKItensHistorico.Enabled := False;
   btnAltHistorico.Enabled := False;
   btnAltItensHistorico.Enabled := False;
   btnOkItensOper.Enabled := False;
   btnAltItensOper.Enabled := False;
end;

procedure TfrmVerSaldoRenFix.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
   if Trim(dtFinal.Text) = '' then
   begin
      ShowMessage('Selecione uma Data');
      Exit;
   end;
   if Trim(dblInvestimento.Text) = '' then
      BuscaSaldos(dtFinal.Date)
   else
      BuscaSaldos(dtFinal.Date,StrToInt(dblInvestimento.LookupValue));

   btnOKHistorico.Enabled := False;
   btnOKItensHistorico.Enabled := False;
   btnOkItensOper.Enabled := False;
   btnAltHistorico.Enabled := True;
   btnAltItensHistorico.Enabled := True;
   btnAltItensOper.Enabled := True;
end;

procedure TfrmVerSaldoRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryInvestimento.Close;
end;

procedure TfrmVerSaldoRenFix.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmVerSaldoRenFix.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  BuscaSaldos(0,-1)
end;

function TfrmVerSaldoRenFix.BuscaSaldos(dDataSaldo: TDateTime; iInvestimento: Integer = -1;
                                iOperacao: Integer = -1; iClassePoup: Integer = -1): Boolean;
begin
   Result := True;
   Try
      qryBuscaSaldosHist.Close;
      qryBuscaSaldosHist.ParamByName('DATAHISTRENFIX').AsString := DateToStr(dDataSaldo);

      if iInvestimento = -1 then
         qryBuscaSaldosHist.ParamByName('IDINVESTIMENTO').Clear
      else
         qryBuscaSaldosHist.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;

      if iOperacao = -1 then
         qryBuscaSaldosHist.ParamByName('IDOPERRENFIXAPLIC').Clear
      else
         qryBuscaSaldosHist.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperacao;

      if iClassePoup = -1 then
         qryBuscaSaldosHist.ParamByName('IDCLASSETIT').Clear
      else
         qryBuscaSaldosHist.ParamByName('IDCLASSETIT').AsInteger := iClassePoup;

      qryBuscaSaldosHist.Open;
      if qryBuscaSaldosHist.IsEmpty then Result := False;

      qryBuscaSaldosItems.Close;
      qryBuscaSaldosItems.ParamByName('IDHISTRENFIX').AsInteger :=
                      qryBuscaSaldosHistIDHISTRENFIX.AsInteger;
      qryBuscaSaldosItems.Open;

      qryBuscaSaldosOper.Close;
      qryBuscaSaldosOper.ParamByName('IDOPERRENFIX').AsInteger :=
                         qryBuscaSaldosHistIDOPERRENFIXAPLIC.AsInteger;
      qryBuscaSaldosOper.Open;

      qryBuscaSaldosItemsOper.Close;
      qryBuscaSaldosItemsOper.ParamByName('IDOPERRENFIX').AsInteger :=
                              qryBuscaSaldosHistIDOPERRENFIXAPLIC.AsInteger;
      qryBuscaSaldosItemsOper.Open;
   Except
      Result := False;
   end;

end;

procedure TfrmVerSaldoRenFix.btnOKHistoricoClick(Sender: TObject);
begin
  inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Try
   with qryUpdHistorico do
   begin
      Close;
      ParamByName('IDHISTRENFIX').AsInteger := qryBuscaSaldosHistIDHISTRENFIX.AsInteger;
      ParamByName('VLRHISTRENFIX').AsFloat :=  qryBuscaSaldosHistVLRHISTRENFIX.AsFloat;
      ParamByName('QTDHISTRENFIX').AsFloat :=  qryBuscaSaldosHistQTDHISTRENFIX.AsFloat;
      ParamByName('SALDOVLRHISTRENFI').AsFloat := qryBuscaSaldosHistSALDOVLRHISTRENFI.AsFloat;
      ParamByName('SALDOQTDHISTRENFI').AsFloat := qryBuscaSaldosHistSALDOQTDHISTRENFI.AsFloat;
      ExecSql;
   end;
   qryBuscaSaldosHistVLRHISTRENFIX.DisplayFormat := '###,###,###,##0.00';
   qryBuscaSaldosHistQTDHISTRENFIX.DisplayFormat := '###,###,###,##0';
   qryBuscaSaldosHistSALDOVLRHISTRENFI.DisplayFormat := '###,###,###,##0.00';
   qryBuscaSaldosHistSALDOQTDHISTRENFI.DisplayFormat := '###,###,###,##0';

   DtmBaseDados.dbBaseDados.Commit;
   qryBuscaSaldosHist.Post;
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                 E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
      end;
   end;

   btnOKHistorico.Enabled := False;
   btnAltHistorico.Enabled := True;
end;

procedure TfrmVerSaldoRenFix.btnAltHistoricoClick(Sender: TObject);
begin
  inherited;
   qryBuscaSaldosHist.Edit;
   qryBuscaSaldosHistVLRHISTRENFIX.DisplayFormat := '';
   qryBuscaSaldosHistQTDHISTRENFIX.DisplayFormat := '';
   qryBuscaSaldosHistSALDOVLRHISTRENFI.DisplayFormat := '';
   qryBuscaSaldosHistSALDOQTDHISTRENFI.DisplayFormat := '';

   btnOKHistorico.Enabled := True;
   btnAltHistorico.Enabled := False;
end;

procedure TfrmVerSaldoRenFix.btnOKItensHistoricoClick(Sender: TObject);
begin
  inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Try
   with qryUpdBuscaSaldosItems do
   begin
      Close;
      ParamByName('IDHISTRENFIX').AsInteger := qryBuscaSaldosItemsIDHISTRENFIX.AsInteger;
      ParamByName('IDCURVARENFIX').AsInteger :=  qryBuscaSaldosItemsIDCURVARENFIX.AsInteger;
      ParamByName('IDITEMRENFIX').AsInteger :=  qryBuscaSaldosItemsIDITEMRENFIX.AsInteger;
      ParamByName('PUITEM').AsFloat := qryBuscaSaldosItemsPUITEM.AsFloat;
      ParamByName('PUACUITEM').AsFloat := qryBuscaSaldosItemsPUACUITEM.AsFloat;
      ExecSql;
   end;
   qryBuscaSaldosItemsPUITEM.DisplayFormat := '###,###,###,##0.000000';
   qryBuscaSaldosItemsPUACUITEM.DisplayFormat := '###,###,###,##0.000000';

   DtmBaseDados.dbBaseDados.Commit;
   if dsItemsHistorico.State in [dsEdit] then
      qryBuscaSaldosItems.Post;
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                 E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
      end;
   end;
   btnOKItensHistorico.Enabled := False;
   btnAltItensHistorico.Enabled := True;
end;

procedure TfrmVerSaldoRenFix.btnAltItensHistoricoClick(Sender: TObject);
begin
  inherited;
   qryBuscaSaldosItems.Edit;
   qryBuscaSaldosItemsPUITEM.DisplayFormat := '';
   qryBuscaSaldosItemsPUACUITEM.DisplayFormat := '';

   btnOKItensHistorico.Enabled := True;
   btnAltItensHistorico.Enabled := False;
end;

procedure TfrmVerSaldoRenFix.wwDBGrid5RowChanged(Sender: TObject);
begin
  inherited;
   if dsItemsHistorico.State in [dsEdit] then
   begin
      qryBuscaSaldosItems.Post;
      btnOKItensHistoricoClick(self);
   end;
end;

procedure TfrmVerSaldoRenFix.btnOkItensOperClick(Sender: TObject);
begin
  inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Try
   with qryUpdItensOperacao do
   begin
      Close;
      ParamByName('IDOPERRENFIX').AsInteger    := qryBuscaSaldosItemsOperIDOPERRENFIX.AsInteger;
      ParamByName('IDITEMRENFIX').AsInteger    := qryBuscaSaldosItemsOperIDITEMRENFIX.AsInteger;
      ParamByName('IDCURVARENFIX').AsInteger   := qryBuscaSaldosItemsOperIDCURVARENFIX.AsInteger;
      ParamByName('VLRCURVA').AsFloat := qryBuscaSaldosItemsOperVLRCURVA.AsFloat;
      ExecSql;
   end;
   qryBuscaSaldosItemsOperVLRCURVA.DisplayFormat:= '###,###,###,##0';

   DtmBaseDados.dbBaseDados.Commit;
   qryBuscaSaldosItemsOper.Post;
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                 E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
      end;
   end;

   btnOkItensOper.Enabled := False;
   btnAltItensOper.Enabled := True;
end;

procedure TfrmVerSaldoRenFix.btnAltItensOperClick(Sender: TObject);
begin
  inherited;
   qryBuscaSaldosItemsOper.Edit;
   qryBuscaSaldosItemsOperVLRCURVA.DisplayFormat:= '';

   btnOkItensOper.Enabled := True;
   btnAltItensOper.Enabled := False;
end;

procedure TfrmVerSaldoRenFix.wwDBGrid3RowChanged(Sender: TObject);
begin
  inherited;
   if dsItensOperacao.State in [dsEdit] then
   begin
      qryBuscaSaldosItemsOper.Post;
      btnOkItensOperClick(self);
   end;
end;

procedure TfrmVerSaldoRenFix.btnAltOperRenFixClick(Sender: TObject);
begin
   inherited;
   qryBuscaSaldosOper.Edit;
   qryBuscaSaldosOperVLROPERACAO.DisplayFormat := '';
   qryBuscaSaldosOperQTDEOPERACAO.DisplayFormat := '';
   qryBuscaSaldosOperPUEMISSAO.DisplayFormat := '';
   qryBuscaSaldosOperDATAEMISSAO.DisplayFormat := '';
   qryBuscaSaldosOperVENCOPERACAO.DisplayFormat := '';

   btnOkOperRenFix.Enabled := True;
   btnAltOperRenFix.Enabled := False;
end;

procedure TfrmVerSaldoRenFix.btnOkOperRenFixClick(Sender: TObject);
begin
  inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Try
      with qryUpdOperacoes do
      begin
         Close;
         ParamByName('DATAOPERACAO').AsString   := qryBuscaSaldosOperDATAOPERACAO.AsString;
         ParamByName('VLROPERACAO').AsFloat    := qryBuscaSaldosOperVLROPERACAO.AsFloat;
         ParamByName('QTDEOPERACAO').AsFloat   := qryBuscaSaldosOperQTDEOPERACAO.AsFloat;
         ParamByName('PUOPERACAO').AsFloat     := qryBuscaSaldosOperPUOPERACAO.AsFloat;
         ParamByName('PUEMISSAO').AsFloat      := qryBuscaSaldosOperPUEMISSAO.AsFloat;
         ParamByName('DATAEMISSAO').AsString   := qryBuscaSaldosOperDATAEMISSAO.AsString;
         ParamByName('VENCOPERACAO').AsString  := qryBuscaSaldosOperVENCOPERACAO.AsString;
         ParamByName('IDOPERRENFIX').AsInteger := qryBuscaSaldosOperIDOPERRENFIX.AsInteger;
         ExecSql;
      end;
      qryBuscaSaldosOperVLROPERACAO.DisplayFormat := '###,###,###,##0.000000';
      qryBuscaSaldosOperQTDEOPERACAO.DisplayFormat := '###,###,###,##0.000000';
      qryBuscaSaldosOperPUEMISSAO.DisplayFormat := '###,###,###,##0.000000';
      qryBuscaSaldosOperPUOPERACAO.DisplayFormat := '###,###,###,##0.000000';
      qryBuscaSaldosOperDATAEMISSAO.DisplayFormat := 'DD/MM/YYYY';
      qryBuscaSaldosOperVENCOPERACAO.DisplayFormat := 'DD/MM/YYYY';

      if dsItemsHistorico.State in [dsEdit] then
      begin
         qryBuscaSaldosOper.Cancel;
         qryBuscaSaldosOper.Close;
         qryBuscaSaldosOper.Open;
      end;
      DtmBaseDados.dbBaseDados.Commit;
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                 E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
      end;
   end;
   btnOkOperRenFix.Enabled := False;
   btnAltOperRenFix.Enabled := True;
end;

end.
