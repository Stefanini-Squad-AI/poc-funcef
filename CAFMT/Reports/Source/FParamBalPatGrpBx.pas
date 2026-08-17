unit FParamBalPatGrpBx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Db, DBClient, uCMClientDataSet,
  uCmSqlParams;

type
  TfrmParamBalPatGrpBx = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    Label3: TLabel;
    rdgGrupo: TRadioGroup;
    cmbGrupoIni: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    ckbSinteticos: TCheckBox;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBalPatGrpBx: TfrmParamBalPatGrpBx;

implementation

{$R *.DFM}

procedure TfrmParamBalPatGrpBx.FormActivate(Sender: TObject);
begin
  inherited;
   sqlGrupoIni.Open;
   //---------------------------------------------------------------------------
   dtedFim.Date := date;
   dtedFim.SetFocus;

end;

procedure TfrmParamBalPatGrpBx.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dtedfim.Text;
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbGrupoIni.LookupValue,0);
  Cmp_Padrao.ParamValues[2].AsInteger  := rdgGrupo.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsBoolean  := ckbCtlFisico.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := ckbTodos.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean  := ckbSinteticos.Checked;

end;

end.
