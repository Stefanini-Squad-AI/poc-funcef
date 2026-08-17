unit fBaseComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Wwquery, TB97, ComCtrls,
  TB97Tlbr, IvDictio, IvMulti, wwdbdatetimepicker,
  CMDateTimePicker, IvEMulti;

type
  TfrmBaseComp = class(TfrmSelPessoal)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseComp: TfrmBaseComp;

implementation

uses fAnalSolic;

{$R *.DFM}

procedure TfrmBaseComp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  while not(ds.Dataset.EOF) do
  begin
    VALOR := ds.Dataset.FieldByName('SALARIOATUAL').Value;

    if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'D') then
      VALOR := VALOR * 30
    else
    if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'H') then
      VALOR := VALOR * ds.Dataset.FieldByName('JORNADAMENSAL').asInteger;

    TotPessoas := TotPessoas + 1;
    TotSalario := TotSalario + VALOR;
    ds.Dataset.Next;
  end;
end;

end.
