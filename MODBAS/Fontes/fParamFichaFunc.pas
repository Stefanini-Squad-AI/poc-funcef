unit fParamFichaFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal,
  Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Spin,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, TEdNum, wwdbdatetimepicker, ComCtrls,
  CMDateTimePicker;

type
  TfrmParamFichaFunc = class(TfrmSelPessoal)
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamFichaFunc: TfrmParamFichaFunc;

implementation

uses uMensErro, fAguarde, dRelatoriosComum;

{$R *.DFM}

procedure TfrmParamFichaFunc.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sListaFunc: string;
begin
  inherited;
  c:=0;
  while not(tblPessoal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := tblPessoal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ tblPessoal.FieldByName('IDPESSOA').asString;

    tblPessoal.Next;
  end;

  if (sListaFunc <> '')  then
  begin
    if (Pos(',',sListaFunc) > 0) then
      dtmRelatoriosComum.qryFichaFunc.SQL[56] := '  (PF.IDPESSOA        IN (' +sListaFunc+ ')) AND'
    else
      dtmRelatoriosComum.qryFichaFunc.SQL[56] := '  (PF.IDPESSOA         = ' +sListaFunc+ ') AND';
  end
  else
    dtmRelatoriosComum.qryFichaFunc.SQL[56] := '  (PF.IDPESSOA         = -1) AND';

  dtmRelatoriosComum.qryFichaFunc.SQL.SaveToFile('c:\qry.txt');

  frmAguarde.Mostra('Ficha Funcional');
  frmAguarde.Pos := 0;
  dtmRelatoriosComum.qryFichaFunc.Open;
  if (dtmRelatoriosComum.qryFichaFunc.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;


end;

end.
