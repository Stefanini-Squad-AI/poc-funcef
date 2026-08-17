unit fBaseComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT, Db,
  DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, TB97,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, wwdbdatetimepicker, CMDateTimePicker, IvEMulti,
  uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport;

type
  TfrmBaseComp = class(TfrmSelPessoalMT)
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    TotPessoas: integer;
    TotSalario: double;
  end;

var
  frmBaseComp: TfrmBaseComp;

implementation

{$R *.DFM}

procedure TfrmBaseComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmBaseComp.bbtnConfirmarClick(Sender: TObject);
var
  rValor: real;
begin
  inherited;
  while not(CdsPrincipal.EOF) do
  begin
    rValor := CdsPrincipal.FieldByName('SALARIOATUAL').asFloat;

    if (CdsPrincipal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
      rValor := rValor * 30
    else
    if (CdsPrincipal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
      rValor := rValor * CdsPrincipal.FieldByName('JORNADAMENSAL').asInteger;

    Inc(TotPessoas);
    TotSalario := TotSalario + rValor;
    CdsPrincipal.Next;
  end;
end;

end.
