unit fConsultBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Mask, fcLabel,
  ComCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdbedit, DBCtrls, MontaSelect, Db,
  Wwdatsrc, DBTables, Wwquery, TB97Ctls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmConsultBens = class(TfrmSairAjuda)
    qrySelConjunto: TwwQuery;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoIDLOCALIZACAO: TFloatField;
    qrySelConjuntoIDRESPONSAVEL: TFloatField;
    qrySelConjuntoDESCLOCALIZACAO: TStringField;
    qrySelConjuntoDESCRESPONSAVEL: TStringField;
    qrySelConjuntoIDPESSOA: TFloatField;
    qrySelConjuntoDISPONIVEL: TFloatField;
    qrySelConjuntoALUGADO: TFloatField;
    dsSelConjunto: TwwDataSource;
    MSConjunto: TMontaSelect;
    qryRateio: TwwQuery;
    qryRateioCODCENTROCUSTO: TStringField;
    qryRateioDESCCCUSTO: TStringField;
    qryRateioPARTICIPACAO: TFloatField;
    dsRateio: TwwDataSource;
    Label3: TLabel;
    dbeDescConjunto: TDBMemo;
    Label4: TLabel;
    dbeDescLocalizacao: TwwDBEdit;
    Label5: TLabel;
    dbeNomeResponsavel: TwwDBEdit;
    dbgRateio: TwwDBGrid;
    Label6: TLabel;
    pgctlBem: TPageControl;
    TabIdent: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    lblBaixado: TfcLabel;
    dbeDescClasse: TwwDBEdit;
    TabDocAquis: TTabSheet;
    Label49: TLabel;
    Label44: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    Label48: TLabel;
    dbeFornec: TwwDBEdit;
    dbeTerceiro: TwwDBEdit;
    TabContab: TTabSheet;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    dbeDescGrupo: TwwDBEdit;
    dbeDescSubConta: TwwDBEdit;
    dbeAtivProj: TwwDBEdit;
    TabValores: TTabSheet;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox4: TGroupBox;
    Label37: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnSelConjunto: TToolbarButton97;
    dbgBens: TwwDBGrid;
    qrySelBem: TwwQuery;
    dsSelBem: TwwDataSource;
    dbeDesBem: TDBMemo;
    dbeDtaInclusao: TCMDateTimePicker;
    dbeIdNota: TwwDBEdit;
    dbeComplNota: TwwDBEdit;
    dbeDtaNota: TCMDateTimePicker;
    dbeDataIniDep: TCMDateTimePicker;
    dbeTaxaDep: TDBRealEdit;
    dbeValHistorico: TDBRealEdit;
    dbeSituacao: TwwDBEdit;
    dbeValOrg: TDBRealEdit;
    dbeCmBem: TDBRealEdit;
    dbeDepLanc: TDBRealEdit;
    dbeCmDep: TDBRealEdit;
    qrySelBemReav: TwwQuery;
    dsSelBemReav: TwwDataSource;
    dbeReavValOrg: TDBRealEdit;
    dbeReavData: TCMDateTimePicker;
    dbeReavTaxaDep: TDBRealEdit;
    dbeReavObs: TwwDBEdit;
    bbtnSelBem: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    DBRealEdit1: TDBRealEdit;
    Label2: TLabel;
    dbeReavVidaUtil: TDBRealEdit;
    dbeObs: TwwDBEdit;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    qrySldCtb: TwwQuery;
    qrySldCtbIDBEM: TFloatField;
    qrySldCtbVALORG0: TFloatField;
    qrySldCtbCMBEM0: TFloatField;
    qrySldCtbDEPLANC0: TFloatField;
    qrySldCtbCMDEP0: TFloatField;
    qrySldCtbVALCTB0: TFloatField;
    dsSldCtb: TwwDataSource;
    bbtnSelConjBem: TToolbarButton97;
    pnlPlaca: TPanel;
    Label13: TLabel;
    dbePlaca: TwwDBEdit;
    Label28: TLabel;
    dbeNumSerie: TwwDBEdit;
    Label43: TLabel;
    dbeOpcional: TwwDBEdit;
    bbtnLivros: TBitBtn;
    pnlLivros: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Ano: TLabel;
    bbtnRetornaPlaca: TBitBtn;
    dbePubAutor: TwwDBEdit;
    dbePubEditora: TwwDBEdit;
    dbePubAno: TwwDBEdit;
    Label50: TLabel;
    Label51: TLabel;
    dbeProcesso: TwwDBEdit;
    dbeEmpenho: TwwDBEdit;
    Panel1: TPanel;
    edControle: TEdit;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDFORNSERV: TFloatField;
    qrySelBemIDTERCEIRO: TFloatField;
    qrySelBemIDCLASSEBEM: TFloatField;
    qrySelBemIDMODULO: TFloatField;
    qrySelBemCODSUBCONTA: TFloatField;
    qrySelBemIDITENSRECDEV: TFloatField;
    qrySelBemUNIDNEGOC: TFloatField;
    qrySelBemIDIMAGEM: TFloatField;
    qrySelBemIDSITUACAO: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemIDGRUPO: TFloatField;
    qrySelBemREGISTRO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDTAINCLUSAO: TDateTimeField;
    qrySelBemDTANOTA: TDateTimeField;
    qrySelBemDATAINICIODEP: TDateTimeField;
    qrySelBemTAXADEP: TFloatField;
    qrySelBemPROPBAIXA: TFloatField;
    qrySelBemCONTROLE: TStringField;
    qrySelBemVALORG: TFloatField;
    qrySelBemVALFIS: TFloatField;
    qrySelBemDEPFIS: TFloatField;
    qrySelBemVALGER: TFloatField;
    qrySelBemDEPGER: TFloatField;
    qrySelBemVALDEPINI: TFloatField;
    qrySelBemNUMSERIE: TStringField;
    qrySelBemBAIXATOTAL: TStringField;
    qrySelBemIDNOTA: TStringField;
    qrySelBemCOMPLNOTA: TStringField;
    qrySelBemDEPLANC: TFloatField;
    qrySelBemCMDEP: TFloatField;
    qrySelBemCMBEM: TFloatField;
    qrySelBemDATAULTDEP: TDateTimeField;
    qrySelBemDATARECALCDEP: TDateTimeField;
    qrySelBemPLACA: TFloatField;
    qrySelBemVALHISTORICO: TFloatField;
    qrySelBemFLGDEPREC: TFloatField;
    qrySelBemFLGSAIDATEMP: TFloatField;
    qrySelBemPRIORIDADE: TFloatField;
    qrySelBemDATAINSTALACAO: TDateTimeField;
    qrySelBemDATATERMINOGAR: TDateTimeField;
    qrySelBemIDOPCIONAL: TStringField;
    qrySelBemPROCESSOAQUIS: TStringField;
    qrySelBemEMPENHOAQUIS: TStringField;
    qrySelBemPUBAUTOR: TStringField;
    qrySelBemPUBEDITORA: TStringField;
    qrySelBemPUBANO: TFloatField;
    qrySelBemDESCGRUPO: TStringField;
    qrySelBemDESCSITUACAO: TStringField;
    qrySelBemNOMEFORN: TStringField;
    qrySelBemNOMETERC: TStringField;
    qrySelBemDESCCLASSE: TStringField;
    qrySelBemDESCSUBCONTA: TStringField;
    qrySelBemDESCATIVPROJ: TStringField;
    lblUltDep: TfcLabel;
    qryUltDep: TwwQuery;
    qrySelBemReavIDREAVALIACAO: TFloatField;
    qrySelBemReavIDBEM: TFloatField;
    qrySelBemReavIDMOVIMENTACAO: TFloatField;
    qrySelBemReavVALORG: TFloatField;
    qrySelBemReavIDPESSOA: TFloatField;
    qrySelBemReavVALFIS: TFloatField;
    qrySelBemReavDEPFIS: TFloatField;
    qrySelBemReavVALGER: TFloatField;
    qrySelBemReavDEPGER: TFloatField;
    qrySelBemReavDEPLANC: TFloatField;
    qrySelBemReavCMBEM: TFloatField;
    qrySelBemReavCMDEP: TFloatField;
    qrySelBemReavDATAREAVALIACAO: TDateTimeField;
    qrySelBemReavFLGDEPREC: TFloatField;
    qrySelBemReavFLGULTREAVAL: TFloatField;
    qrySelBemReavOBSREAVAL: TStringField;
    qrySelBemReavVALORGLAUDO: TFloatField;
    qrySelBemReavVIDAUTIL: TIntegerField;
    qrySelBemReavTAXADEP: TFloatField;
    qryUltDepULTDEP: TDateTimeField;
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure qrySelBemAfterScroll(DataSet: TDataSet);
    procedure dbgBensDblClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure qrySelBemReavCalcFields(DataSet: TDataSet);
    procedure dbgBensTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure bbtnSelConjBemClick(Sender: TObject);
    procedure pgctlBemChange(Sender: TObject);
    procedure bbtnLivrosClick(Sender: TObject);
    procedure bbtnRetornaPlacaClick(Sender: TObject);
  private
    { Private declarations }
    bPnlPlaca : boolean;
  public
    { Public declarations }
  end;

var
  frmConsultBens: TfrmConsultBens;

implementation

{$R *.DFM}

uses uSistema, dAtivoFixo;

//========================================================================================
procedure TfrmConsultBens.FormCreate(Sender: TObject);
begin
   inherited;
   qryUltDep.Prepare;
   qrySelConjunto.Prepare;
   qryRateio.Prepare;
   qrySelBem.Prepare;
   qrySelBemReav.Prepare;
   qrySldCtb.Prepare;
   //
   qryRateio.Close;
   qryRateio.ParamByName('PIDPESSOA').AsInteger   := -1;
   qryRateio.ParamByName('PIDCONJUNTO').AsInteger := -1;
   qryRateio.Open;
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDCONJUNTO').AsInteger := -1;
   qrySelBem.Open;
   qryUltDep.Close;
   qryUltDep.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryUltDep.Open;
   lblUltDep.Caption := 'Último Fechamento : ' + qryUltDepULTDEP.AsString;
   //
   pgctlBem.ActivePage := TabIdent;
   pnlPlaca.BringToFront;
   bPnlPlaca := True;
   bbtnSelBem.Enabled := False;
   pgctlBem.SendToBack;
end;
//========================================================================================
procedure TfrmConsultBens.FormActivate(Sender: TObject);
begin
   inherited;
   ToolBar971.SetFocus;
end;
//========================================================================================
procedure TfrmConsultBens.bbtnSelConjuntoClick(Sender: TObject);
begin
   if bbtnSelBem.Enabled then
      bbtnSelBem.Click;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crSQLWait;
   MSConjunto.Executar;
   //-------------------------------------------------------------------------------------
   frmConsultBens.Invalidate;
   frmConsultBens.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSConjunto.ValoresChave.Count > 0) and (MSConjunto.ValoresChave[0] <> '') then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      qryRateio.Close;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryRateio.Open;
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      dbgBens.SetFocus;
   end else
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := -1;
      qrySelConjunto.Open;
      qryRateio.Close;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := -1;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := -1;
      qryRateio.Open;
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDCONJUNTO').AsInteger := -1;
      qrySelBem.Open;
   end;
   Screen.Cursor := crDefault;
   bbtnSelConjunto.Down := False;
end;
//========================================================================================
procedure TfrmConsultBens.bbtnSelConjBemClick(Sender: TObject);
begin
   if bbtnSelBem.Enabled then
      bbtnSelBem.Click;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crSQLWait;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[5]);
      qrySelConjunto.Open;
      qryRateio.Close;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryRateio.Open;
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qrySelBem.Open;
      frmConsultBens.Invalidate;
      frmConsultBens.Repaint;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      qrySelBem.Locate('IDBEM', StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]),[]);
      frmConsultBens.Invalidate;
      frmConsultBens.Repaint;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      dbgBens.OnDblClick(Self);
   end else
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := -1;
      qrySelConjunto.Open;
      qryRateio.Close;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := -1;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := -1;
      qryRateio.Open;
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDCONJUNTO').AsInteger := -1;
      qrySelBem.Open;
   end;
   Screen.Cursor := crDefault;
   bbtnSelConjBem.Down := False;
end;
//========================================================================================
procedure TfrmConsultBens.qrySelBemAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if (qrySelBemBAIXATOTAL.AsString = 'S') then
   begin
      lblBaixado.Caption := 'Baixado';
   end else
   begin
      lblBaixado.Caption := '';
   end;
   //-------------------------------------------------------------------------------------
   if (qrySelBemCONTROLE.AsString = 'T') then
   begin
      edControle.Text := 'Total';
   end else
   begin
      edControle.Text := 'Físico';
   end;
end;
//========================================================================================
procedure TfrmConsultBens.dbgBensDblClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   qrySelBemReav.Close;
   qrySelBemReav.ParamByName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
   qrySelBemReav.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
   qrySelBemReav.Open;
   //-------------------------------------------------------------------------------------
   qrySldCtb.Close;
   qrySldCtb.ParamByName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
   qrySldCtb.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
   qrySldCtb.ParamByName('PDATASLD').AsDateTime := date;
   qrySldCtb.Open;
   //-------------------------------------------------------------------------------------
   Screen.Cursor       := crDefault;
   bbtnSelBem.Enabled  := True;
   dbgBens.SendToBack;
   dbgBens.Visible     := False;
   pgctlBem.ActivePage := TabIdent;
end;
//========================================================================================
procedure TfrmConsultBens.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   bbtnSelBem.Enabled := False;
   dbgBens.Visible    := True;
   dbgBens.BringToFront;
end;
//========================================================================================
procedure TfrmConsultBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelConjunto.Close;
   qryRateio.Close;
   qrySelBem.Close;
   qrySelBemReav.Close;
   qrySldCtb.Close;
   qryUltDep.Close;
   qrySelConjunto.UnPrepare;
   qryRateio.UnPrepare;
   qrySelBem.UnPrepare;
   qrySelBemReav.UnPrepare;
   qrySldCtb.UnPrepare;
   qryUltDep.UnPrepare;
end;
//========================================================================================
procedure TfrmConsultBens.qrySelBemReavCalcFields(DataSet: TDataSet);
begin
   inherited;
   if (qrySelBemReavTAXADEP.AsFloat <> 0) then
   begin
      qrySelBemReavVIDAUTIL.AsFloat := (100 / qrySelBemReavTAXADEP.AsFloat) * 12
   end else
   begin
      qrySelBemReavVIDAUTIL.Clear;
   end;
end;
//========================================================================================
procedure TfrmConsultBens.dbgBensTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;
   qrySelBem.Close;
   //-------------------------------------------------------------------------------------
   if (aFieldName = 'PLACA') then
      qrySelBem.SQL.Strings[19] := 'ORDER BY PLACA'
   else
   if (aFieldName = 'DESBEM') then
      qrySelBem.SQL.Strings[19] := 'ORDER BY DESBEM'
   else
   if (aFieldName = 'DTAINCLUSAO') then
      qrySelBem.SQL.Strings[19] := 'ORDER BY DTAINCLUSAO, DESBEM'
   else
      qrySelBem.SQL.Strings[19] := ' ';
   //-------------------------------------------------------------------------------------
   qrySelBem.Open;
end;
//========================================================================================
procedure TfrmConsultBens.pgctlBemChange(Sender: TObject);
begin
   inherited;
   pnlPlaca.BringToFront;
   bPnlPlaca := True;
end;
//========================================================================================
procedure TfrmConsultBens.bbtnLivrosClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.SendToBack;
   bPnlPlaca := False;
end;
//========================================================================================
procedure TfrmConsultBens.bbtnRetornaPlacaClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.BringToFront;
   bPnlPlaca := True;
end;

end.
