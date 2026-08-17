unit FParamBalPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  StdCtrls, wwdblook, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97;

type
  TfrmParamBalPatGrp = class(TfrmParamReports_Padrao)
    dtedfim: TCMDateTimePicker;
    Label1: TLabel;
    rdgGrupo: TRadioGroup;
    Label3: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    ckbSinteticos: TCheckBox;
    ckbBaixados: TCheckBox;
    cdsGrupoIni: TCMClientDataSet;
    sqlGrupoIni: TCMSqlParams;
    procedure cmbGrupoIniExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    iGrupoIni   : Integer;

  end;

var
  frmParamBalPatGrp: TfrmParamBalPatGrp;

implementation

{$R *.DFM}

procedure TfrmParamBalPatGrp.cmbGrupoIniExit(Sender: TObject);
begin
  inherited;
   if cmbGrupoIni.Text <> '' then
   begin
      iGrupoIni := cdsGrupoIni.FieldByName('IDGRUPO').AsInteger;
   end else
   begin
      iGrupoIni := 0;
   end;

end;

procedure TfrmParamBalPatGrp.FormActivate(Sender: TObject);
begin
  inherited;
  sqlGrupoIni.Open;

  dtedFim.Date := date;
  dtedFim.SetFocus;


end;

procedure TfrmParamBalPatGrp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dtedfim.Text;
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbGrupoIni.LookupValue,0);
  Cmp_Padrao.ParamValues[2].AsInteger  := rdgGrupo.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsBoolean  := ckbCtlFisico.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := ckbTodos.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean  := ckbBaixados.Checked;
  Cmp_Padrao.ParamValues[6].AsBoolean  := ckbSinteticos.Checked;

end;

end.
