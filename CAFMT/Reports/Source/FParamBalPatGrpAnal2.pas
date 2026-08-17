unit FParamBalPatGrpAnal2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  StdCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamBalPatGrpAnal2 = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    Label3: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbBaixados: TCheckBox;
    ckbExcluiGrpAnal: TCheckBox;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBalPatGrpAnal2: TfrmParamBalPatGrpAnal2;

implementation

{$R *.DFM}

procedure TfrmParamBalPatGrpAnal2.FormCreate(Sender: TObject);
begin
  inherited;
   sqlGrupoIni.Open;
   //---------------------------------------------------------------------------
   dtedFim.Date := date;
   dtedFim.SetFocus;

end;

procedure TfrmParamBalPatGrpAnal2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dtedfim.Text;
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbGrupoIni.LookupValue,0);
  Cmp_Padrao.ParamValues[2].AsBoolean  := ckbCtlFisico.Checked;
  Cmp_Padrao.ParamValues[3].AsBoolean  := ckbExcluiGrpAnal.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := ckbBaixados.Checked;

end;

end.
