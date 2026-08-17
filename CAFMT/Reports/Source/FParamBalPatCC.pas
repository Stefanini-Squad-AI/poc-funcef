unit FParamBalPatCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, wwdblook, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet,
  uCmSqlParams;

type
  TfrmParamBalPatCC = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    Label3: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
    sqlCCustoIni: TCMSqlParams;
    cdsCCustoIni: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBalPatCC: TfrmParamBalPatCC;

implementation

{$R *.DFM}

procedure TfrmParamBalPatCC.FormCreate(Sender: TObject);
begin
  inherited;
   sqlCCustoIni.Open;
   dtedFim.Date := date;
   dtedFim.SetFocus;

end;

procedure TfrmParamBalPatCC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dtedfim.Text;
  Cmp_Padrao.ParamValues[1].AsBoolean  := ckbCtlFisico.Checked;
  Cmp_Padrao.ParamValues[2].AsBoolean  := ckbTodos.Checked;
  Cmp_Padrao.ParamValues[3].AsInteger  := StrToIntDef(cmbGrupoIni.LookupValue,0);

end;

end.
