unit fParamCafBalPatBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamCafBalPatBem = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    cmbGrupoIni: TwwDBLookupCombo;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbBaixados: TCheckBox;
    rdgrpDeprec: TRadioGroup;
    cdsGrupoIni: TCMClientDataSet;
    sqlGrupoIni: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCafBalPatBem: TfrmParamCafBalPatBem;

implementation

{$R *.DFM}

procedure TfrmParamCafBalPatBem.FormCreate(Sender: TObject);
begin
  inherited;
  sqlGrupoIni.Open;

end;

procedure TfrmParamCafBalPatBem.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dtedfim.Text;
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbGrupoIni.LookupValue,0);
  Cmp_Padrao.ParamValues[2].AsInteger  := rdgrpDeprec.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsBoolean  := ckbCtlFisico.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := ckbBaixados.Checked;

end;

end.
