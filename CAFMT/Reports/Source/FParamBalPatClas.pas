unit FParamBalPatClas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  StdCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamBalPatClas = class(TfrmParamReports_Padrao)
    dtedfim: TCMDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    dblckCmbClasseIni: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    ckbSinteticos: TCheckBox;
    ckbBaixados: TCheckBox;
    cdsClasseIni: TCMClientDataSet;
    sqlClasseIni: TCMSqlParams;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBalPatClas: TfrmParamBalPatClas;

implementation

{$R *.DFM}

procedure TfrmParamBalPatClas.FormActivate(Sender: TObject);
begin
  inherited;
   sqlClasseIni.Open;

   dtedFim.Date := date;
   dtedFim.SetFocus;

end;

procedure TfrmParamBalPatClas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dtedfim.Text;
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(dblckCmbClasseIni.LookupValue,0);
  Cmp_Padrao.ParamValues[2].AsBoolean  := ckbCtlFisico.Checked;
  Cmp_Padrao.ParamValues[3].AsBoolean  := ckbSinteticos.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := ckbTodos.Checked;
  Cmp_Padrao.ParamValues[5].AsBoolean  := ckbBaixados.Checked;

end;

end.
