unit FParamCentralAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Wwdbspin, DBCtrls, Wwdotdot,
  Wwdbcomb, Mask, wwdbedit, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  ComCtrls, Menus, DBaseDados;

type
  TfrmParamCentralAP = class(TfrmCadastroCS)
    qryFormaAtend: TwwQuery;
    QRYFIARIOASSUNTO: TwwQuery;

    qryFormaAtendIDTIPOATEND: TFloatField;
    qryFormaAtendNOME: TStringField;
    qryFormaAtendFLGEMITERUBS: TStringField;
    QRYFIARIOASSUNTOIDFIARASS: TFloatField;
    QRYFIARIOASSUNTODESCRICAO: TStringField;
    PopupMenu1: TPopupMenu;
    qrytipodocpessoa: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dblkFormaAtend: TwwDBLookupCombo;
    DBRGCtrlProtocolo: TDBRadioGroup;
    DblkTipoDocPessoa: TwwDBLookupCombo;
    Label13: TLabel;
    Label3: TLabel;
    dblkEndInc: TwwDBLookupCombo;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label4: TLabel;
    dblkEndAlt: TwwDBLookupCombo;
    Label5: TLabel;
    dblkEndExcl: TwwDBLookupCombo;
    Label6: TLabel;
    Label7: TLabel;
    dblktelInc: TwwDBLookupCombo;
    Label8: TLabel;
    dblktelAlt: TwwDBLookupCombo;
    Label9: TLabel;
    dblkTelExcl: TwwDBLookupCombo;
    Bevel2: TBevel;
    Label10: TLabel;
    Bevel3: TBevel;
    Label11: TLabel;
    dblkccInc: TwwDBLookupCombo;
    dblkccAlt: TwwDBLookupCombo;
    Label12: TLabel;
    Label14: TLabel;
    dblkccExcl: TwwDBLookupCombo;
    Bevel4: TBevel;
    Label15: TLabel;
    dblkrubsgera: TwwDBLookupCombo;
    qryEmpresaProp: TQuery;
    qryEmpresaPropIDPESSOA: TFloatField;
    chkbxFlgMudaLocalAtend: TCheckBox;
    CkbDataHora: TCheckBox;
    qryIDCARTAPADRAO: TFloatField;
    qryIDETIQPADRAO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDTIPOATENDPADRAO: TFloatField;
    qryIDDOCRG: TFloatField;
    qryFLGCTRLPROTOCOLO: TFloatField;
    qryIDFIARIOENDINC: TFloatField;
    qryIDFIARIOTELEXC: TFloatField;
    qryIDFIARIOTELALT: TFloatField;
    qryIDFIARIOTELINC: TFloatField;
    qryIDFIARIOCCEXC: TFloatField;
    qryIDFIARIOCCALT: TFloatField;
    qryIDFIARIOCCINC: TFloatField;
    qryIDFIARIOENDEXC: TFloatField;
    qryIDFIARIOENDALT: TFloatField;
    qryIDPROTOCOLORUB: TFloatField;
    qryFLGMUDALOCALATEND: TFloatField;
    qryFLGCONFIRMADATA: TFloatField;
    TabSheet3: TTabSheet;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    qryWEBLOGIN: TStringField;
    qryWEBSENHA: TStringField;
    qryWEBBASE: TStringField;
    wwDBEdit3: TwwDBEdit;
    procedure FormShow(Sender: TObject);
    procedure dblkEndIncChange(Sender: TObject);
    procedure dblkEndAltChange(Sender: TObject);
    procedure dblkEndExclChange(Sender: TObject);
    procedure dblkccIncChange(Sender: TObject);
    procedure dblkccAltChange(Sender: TObject);
    procedure dblkccExclChange(Sender: TObject);
    procedure dblktelIncChange(Sender: TObject);
    procedure dblktelAltChange(Sender: TObject);
    procedure dblkTelExclChange(Sender: TObject);
    procedure dblkrubsgeraChange(Sender: TObject);
    procedure chkbxFlgMudaLocalAtendClick(Sender: TObject);
    procedure CkbDataHoraClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCentralAP: TfrmParamCentralAP;

implementation


{$R *.DFM}

procedure TfrmParamCentralAP.FormShow(Sender: TObject);
begin
  inherited;
  SBTNALTERAR.ENABLED := true;
  dblkformaatend.Enabled := false;
  BBTNCONFIRMAR.Enabled :=FALSE;
  BBTNCANCELAR.Enabled := false;
  qryEmpresaProp.open;
  qry.open;
  qryTipoDocPessoa.open;
  qryFiarioAssunto.Open;

  qry.edit;

  qryIDPESSOA.asInteger := qryEmpresaPropIDPESSOA.asInteger;

  dblkEndInc.LookUpValue := qryIDFIARIOENDINC.asString;
  dblkEndInc.REFRESH;
  dblkEndAlt.LookUpValue := qryIDFIARIOENDALT.asString;
  dblkEndExcl.REFRESH;
  dblkEndExcl.LookUpValue := qryIDFIARIOENDEXC.asString;
  dblkEndExcl.REFRESH;

  dblkTelInc.LookUpValue := qryIDFIARIOTELINC.asString;
  dblkTelInc.REFRESH;
  dblkTelAlt.LookUpValue := qryIDFIARIOTELALT.asString;
  dblkTelAlt.REFRESH;
  dblkTelExcl.LookUpValue := qryIDFIARIOTELEXC.asString;
  dblkTelExcl.REFRESH;

  dblkCCInc.LookUpValue := qryIDFIARIOCCINC.asString;
  dblkCCInc.REFRESH;
  dblkCCAlt.LookUpValue := qryIDFIARIOCCALT.asString;
  dblkCCAlt.REFRESH;
  dblkCCExcl.LookUpValue := qryIDFIARIOCCEXC.asString;
  dblkCCExcl.REFRESH;

  dblkRubsGera.LookupValue := qryIDPROTOCOLORUB.asString;
  dblkRubsGera.refresh;

  DblkTipoDocPessoa.enabled := true;

  qryFormaAtend.Open;
  dblkformaatend.Enabled := true;

  chkbxFlgMudaLocalAtend.Checked := qryFLGMUDALOCALATEND.asFloat = 1;
  CkbDataHora.Checked := qryFLGCONFIRMADATA.asFloat = 1;
end;


procedure TfrmParamCentralAP.dblkEndIncChange(Sender: TObject);
begin
  inherited;
  if dblkEndInc.lookupValue <> '' then
    qryIDFIARIOENDINC.asInteger := StrToInt(dblkEndInc.lookupValue);

  if dblkEndinc.text = '' then
  begin
    qryIDFIARIOENDINC.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblkEndAltChange(Sender: TObject);
begin
  inherited;
  if dblkEndAlt.lookupValue <> '' then
    qryIDFIARIOENDALT.asInteger := StrToInt(dblkEndAlt.lookupValue);

  if dblkEndAlt.text = '' then
  begin
    qryIDFIARIOEndAlt.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblkEndExclChange(Sender: TObject);
begin
  inherited;
  if dblkEndExcl.lookupValue <> '' then
    qryIDFIARIOENDEXC.asInteger := StrToInt(dblkEndExcl.lookupValue);

  if dblkEndExcl.text = '' then
  begin
    qryIDFIARIOEndExc.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblkccIncChange(Sender: TObject);
begin
  inherited;
  if dblkCCINC.lookupValue <> '' then
    qryIDFIARIOCCINC.asInteger := StrToInt(dblkCCINC.lookupValue);

  if dblkccInc.text = '' then
  begin
    qryIDFIARIOccInc.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblkccAltChange(Sender: TObject);
begin
  inherited;
  if dblkccAlt.lookupValue <> '' then
    qryIDFIARIOccAlt.asInteger := StrToInt(dblkccAlt.lookupValue);

  if dblkccAlt.text = '' then
  begin
    qryIDFIARIOccAlt.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblkccExclChange(Sender: TObject);
begin
  inherited;
  if dblkccExcl.lookupValue <> '' then
    qryIDFIARIOccExc.asInteger := StrToInt(dblkccExcl.lookupValue);

  if dblkccExcl.text = '' then
  begin
    qryIDFIARIOccExc.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblktelIncChange(Sender: TObject);
begin
  inherited;

  if dblktelInc.lookupValue <> '' then
    qryIDFIARIOtelInc.asInteger := StrToInt(dblktelInc.lookupValue);

  if dblktelInc.text = '' then
  begin
    qryIDFIARIOtelInc.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblktelAltChange(Sender: TObject);
begin
  inherited;

  if dblktelAlt.lookupValue <> '' then
    qryIDFIARIOtelAlt.asInteger := StrToInt(dblktelAlt.lookupValue);

  if dblktelAlt.text = '' then
  begin
    qryIDFIARIOtelAlt.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblkTelExclChange(Sender: TObject);
begin
  inherited;

  if dblkTelExcl.lookupValue <> '' then
    qryIDFIARIOTelExc.asInteger := StrToInt(dblkTelExcl.lookupValue);

  if dblkTelExcl.text = '' then
  begin
    qryIDFIARIOTelExc.asInteger := 0;
  end;
end;

procedure TfrmParamCentralAP.dblkrubsgeraChange(Sender: TObject);
begin
  inherited;

  if dblkrubsgera.lookupValue <> '' then
    qryIDPROTOCOLORUB.asInteger := StrToInt(dblkrubsgera.lookupValue);

  if dblkrubsgera.text = '' then
  begin
    qryIDPROTOCOLORUB.asInteger := 0;
  end;

end;

procedure TfrmParamCentralAP.chkbxFlgMudaLocalAtendClick(Sender: TObject);
begin
  inherited;
  if chkbxFlgMudaLocalAtend.Checked then
   qryFLGMUDALOCALATEND.asFloat := 1
  else
   qryFLGMUDALOCALATEND.asFloat := 0;
end;


procedure TfrmParamCentralAP.CkbDataHoraClick(Sender: TObject);
begin
  inherited;
  if CkbDataHora.Checked then
   qryFLGCONFIRMADATA.asFloat := 1
  else
   qryFLGCONFIRMADATA.asFloat := 0;
end;

end.
