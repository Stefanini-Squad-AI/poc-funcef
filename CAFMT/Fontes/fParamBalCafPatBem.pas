unit fParamBalCafPatBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamBalPatBem = class(TfrmParamReports_Padrao)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBalPatBem: TfrmParamBalPatBem;

implementation

{$R *.DFM}

procedure TfrmParamBalPatBem.FormCreate(Sender: TObject);
begin
  inherited;
  sqlGrupoIni.Open;

end;

end.
