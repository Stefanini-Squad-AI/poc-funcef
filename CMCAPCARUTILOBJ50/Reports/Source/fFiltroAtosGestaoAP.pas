unit fFiltroAtosGestaoAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CmParamReport, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, uCmSqlParams, Db, DBTables, CMDatabase,
  DBClient, uCMClientDataSet, usistema, fParamReports_Padrao, Machklb,
  CheckLst, uCtrlParamIntegra, uMensErro;

type
  TfrmFiltroAtosGestaoAP = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    chkCrSint: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    chkExibDocZerado: TCheckBox;
    Label7: TLabel;
    dblkPlancentRespon: TwwDBLookupCombo;
    dbLkCentRespon: TwwDBLookupCombo;
    dbLkTiporecebDesemb: TwwDBLookupCombo;
    dtpkDataIni: TCMDateTimePicker;
    dtpkDataFim: TCMDateTimePicker;
    edtPercCPMF: TEdit;
    sqlTipoRecDes: TCMSqlParams;
    sqlPlancentResp: TCMSqlParams;
    sqlCentResp: TCMSqlParams;
    cdsPlancentResp: TCMClientDataSet;
    cdsCentResp: TCMClientDataSet;
    cdsTipoRecDes: TCMClientDataSet;
    sqlPlanosPrev: TCMSqlParams;
    cdsPlanosPrev: TCMClientDataSet;
    dblistPlanosprev: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure dblkPlancentResponCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkPlancentResponChange(Sender: TObject);
    procedure dblkPlancentResponExit(Sender: TObject);
  private
    lstPlanos : TStringList;
    sNomePlanos : String;
    { Private declarations }
    function pegaPlanos: string;
    procedure planCentResp;

  public
    { Public declarations }
  end;

var
  frmFiltroAtosGestaoAP: TfrmFiltroAtosGestaoAP;

implementation

{$R *.DFM}

procedure TfrmFiltroAtosGestaoAP.FormCreate(Sender: TObject);
begin
  inherited;
  sNomePlanos := '';

  lstPlanos := TStringlist.Create;
  lstPlanos.Clear;

  sqlPlancentResp.Open;

  sqlCentResp.Prepare;
  sqlCentResp.ParamByName('IDEMPRESA').asInteger := sistema.idempresa;
  sqlCentResp.Open;

  SqlPlanosPrev.Prepare;
  SqlPlanosPrev.Open;

  sqlTipoRecDes.prepare;
  sqlTipoRecDes.paramByName('IDEMPRESA').asInteger := sistema.idempresa;
  sqlTipoRecDes.Open;

  dblistPlanosprev.Items.Clear;
  lstPlanos.Clear;
  cdsPlanosPrev.first;
  while not cdsPlanosPrev.Eof do
  begin
    dblistPlanosprev.Items.Add(cdsPlanosPrev.FieldByName('NOME').AsString);
    lstPlanos.Add(cdsPlanosPrev.FieldByName('IDPLANOPREV').AsString);
    cdsPlanosPrev.Next;
  end;

  if ParamIntegra.PlanoCentroRespon > 0 then
  begin
    dblkPlancentRespon.LookupValue := IntToStr( ParamIntegra.PlanoCentroRespon );
    cdsPlancentResp.Locate( 'IDPLANCRESPON', ParamIntegra.PlanoCentroRespon, [] );
    dblkPlancentRespon.Text := cdsPlancentResp.FieldByName('DESCPLANCRESPON').AsString;
  end;                                                          

end;

procedure TfrmFiltroAtosGestaoAP.dblkPlancentResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  planCentResp;
end;

procedure TfrmFiltroAtosGestaoAP.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if dtpkDataIni.Text = '' then
  begin
    Msgdlg( 'Informe a data de vencimento inicial.', 'Erro', mtWarning, [ mbOk ], 0 );
    dtpkDataIni.SetFocus;
    exit;
  end;

  if dtpkDataFim.Text = '' then
  begin
    Msgdlg( 'Informe a data de vencimento final.', 'Erro', mtWarning, [ mbOk ], 0 );
    dtpkDataFim.SetFocus;
    exit;
  end;

  if dtpkDataIni.DateTime > dtpkDataFim.DateTime then
  begin
    Msgdlg( 'A a data de vencimento final deve ser posterior à inicial.', 'Erro', mtWarning, [ mbOk ], 0 );
    dtpkDataFim.SetFocus;
    exit;
  end;

  Cmp_Padrao.ParamValues[0].Value := dblkPlancentRespon.LookupValue;
  Cmp_Padrao.ParamValues[1].Value := dbLkCentRespon.LookupValue;
  Cmp_Padrao.ParamValues[2].asDateTime := dtpkDataIni.date;
  Cmp_Padrao.ParamValues[3].asDateTime := dtpkDataFim.date;
  Cmp_Padrao.ParamValues[4].Value := chkCrSint.Checked;
  Cmp_Padrao.ParamValues[5].Value := edtPercCPMF.Text;
  Cmp_Padrao.ParamValues[6].Value := pegaPlanos;
  Cmp_Padrao.ParamValues[7].Value := chkExibDocZerado.Checked;
  Cmp_Padrao.ParamValues[8].Value := dbLkTiporecebDesemb.LookupValue;
  Cmp_Padrao.ParamValues[9].Value := sNomePlanos;

  ModalResult := mrOk;
end;




function TfrmFiltroAtosGestaoAP.pegaPlanos: string;
var
  strPlanos : string;
  i : integer;
  temPlano : boolean;
begin
  temPlano := false;
  strPlanos :='';
  for i:=0 to dblistPlanosprev.items.count-1 do
  begin
    if dblistPlanosprev.checked[i] then
    begin
      strPlanos := strPlanos + lstPlanos[i] + ',';
      temPlano := true;
      sNomePlanos := sNomePlanos + trim(dblistPlanosprev.items[i]);
      if i <= dblistPlanosprev.items.count - 2 then
        sNomePlanos := sNomePlanos +', ';
    end;
  end;
  if temPlano = false then
    strPlanos := ''
  else
    strPlanos[length(strPlanos)] := ' ';

  result := strPlanos;
end;


procedure TfrmFiltroAtosGestaoAP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  lstPlanos.free;
end;

procedure TfrmFiltroAtosGestaoAP.planCentResp;
begin
  dbLkCentRespon.Text := '';
  dbLkCentRespon.Enabled := False;
  if (trim(dblkPlancentRespon.LookupValue) <> '') and (trim(dblkPlancentRespon.text) <> '') then
  begin
    cdsCentResp.Filtered := false;
    cdsCentResp.Filter := ' IDPLANCRESPON = '+ dblkPlancentRespon.LookupValue;
    cdsCentResp.Filtered := true;
    dbLkCentRespon.Enabled := True;
  end
  else
    cdsCentResp.Filtered := false;

  dbLkCentRespon.RefreshDisplay;
end;

procedure TfrmFiltroAtosGestaoAP.dblkPlancentResponChange(Sender: TObject);
begin
  inherited;
  planCentResp;
end;

procedure TfrmFiltroAtosGestaoAP.dblkPlancentResponExit(Sender: TObject);
begin
  inherited;
  if dblkPlancentRespon.LookupValue <> '' then
  begin
    cdsPlancentResp.Locate( 'IDPLANCRESPON', StrToInt( dblkPlancentRespon.LookupValue ), [] );
    dblkPlancentRespon.Text := cdsPlancentResp.FieldByName('DESCPLANCRESPON').AsString;
  end;
end;

end.
