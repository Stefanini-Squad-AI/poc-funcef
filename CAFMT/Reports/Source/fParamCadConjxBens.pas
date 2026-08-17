unit fParamCadConjxBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  StdCtrls, wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamCadConjxBens = class(TfrmParamReports_Padrao)
    cmbLocalizacao: TwwDBLookupCombo;
    Label8: TLabel;
    cmbResponsavel: TwwDBLookupCombo;
    Label5: TLabel;
    cdsLocalizacao: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    sqlLocalizacao: TCMSqlParams;
    sqlResponsavel: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCadConjxBens: TfrmParamCadConjxBens;

implementation

{$R *.DFM}

procedure TfrmParamCadConjxBens.FormCreate(Sender: TObject);
begin
  inherited;
   sqlLocalizacao.Open;
   sqlResponsavel.Open;

end;

procedure TfrmParamCadConjxBens.FormActivate(Sender: TObject);
begin
  inherited;
   cmbLocalizacao.SetFocus;

end;

procedure TfrmParamCadConjxBens.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToIntDef(cmbLocalizacao.LookupValue,0);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbResponsavel.LookupValue,0);

end;

end.
