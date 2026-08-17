unit fParamCartaComunAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FSelPessoal,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin,
  wwdblook, ExtCtrls, TB97, TB97Tlbr, IvDictio, IvMulti, ComCtrls, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamCartaComunAux = class(TfrmSelPessoal)
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamCartaComunAux: TfrmParamCartaComunAux;

implementation

uses dRelatorioCartaComun;

{$R *.DFM}

procedure TfrmParamCartaComunAux.bbtnConfirmarClick(Sender: TObject);
var
  k: integer;
  sListaFunc: string;
begin
  inherited;

  k:=0;
  while not(tblPessoal.EOF) do
  begin
    if (k = 0) then
    begin
      sListaFunc := tblPessoal.FieldByName('IDPESSOA').asString;
      Inc(k);
    end
    else
      sListaFunc := sListaFunc +','+ tblPessoal.FieldByName('IDPESSOA').asString;

    tblPessoal.Next;
  end;

  if (sListaFunc <> '')  then
  begin
    if (Pos(',',sListaFunc) > 0) then
      dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA        IN (' +sListaFunc+ ')) AND'
    else
      dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA         = ' +sListaFunc+ ') AND';
  end
  else
    dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA         = -1) AND';

  dtmRelatorioCartaComun.qryCartaComun.SQL.SaveToFile('c:\qry.txt');
end;

end.
