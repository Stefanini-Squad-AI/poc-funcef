unit FParamCAFCadConjxRatCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  StdCtrls, wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamCAFCadConjxRatCC = class(TfrmParamReports_Padrao)
    cmbLocalizacao: TwwDBLookupCombo;
    Label8: TLabel;
    cmbResponsavel: TwwDBLookupCombo;
    Label5: TLabel;
    sqlLocalizacao: TCMSqlParams;
    sqlResponsavel: TCMSqlParams;
    cdsLocalizacao: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCAFCadConjxRatCC: TfrmParamCAFCadConjxRatCC;

implementation

{$R *.DFM}

procedure TfrmParamCAFCadConjxRatCC.FormCreate(Sender: TObject);
begin
  inherited;
   sqlLocalizacao.Open;
   sqlResponsavel.Open;

end;

procedure TfrmParamCAFCadConjxRatCC.FormShow(Sender: TObject);
begin
  inherited;
   cmbLocalizacao.SetFocus;

end;

procedure TfrmParamCAFCadConjxRatCC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToIntDef(cmbLocalizacao.LookupValue,0);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbResponsavel.LookupValue,0);

end;

end.
