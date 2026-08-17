unit fParamCracha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal,
  Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Spin,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, TEdNum, wwdbdatetimepicker, ComCtrls,
  CMDateTimePicker;

type
  TfrmParamCracha = class(TfrmSelPessoal)
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamCracha: TfrmParamCracha;

implementation

uses uMensErro, fAguarde, uFuncoesUteisRH, dRelatoriosComum;

{$R *.DFM}

procedure TfrmParamCracha.bbtnConfirmarClick(Sender: TObject);
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

  c := dtmRelatoriosComum.qryCracha.SQL.IndexOf('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');

  if (sListaFunc <> '')  then
  begin
    if (Pos(',',sListaFunc) > 0) then
      dtmRelatoriosComum.qryCracha.SQL[c-1] := '  (PF.IDPESSOA        IN (' +sListaFunc+ ')) AND'
    else
      dtmRelatoriosComum.qryCracha.SQL[c-1] := '  (PF.IDPESSOA         = ' +sListaFunc+ ') AND';
  end
  else
    dtmRelatoriosComum.qryCracha.SQL[c-1] := '  (PF.IDPESSOA         = -1) AND';

  dtmRelatoriosComum.qryCracha.SQL.SaveToFile('c:\qry.txt');

  frmAguarde.Mostra('Emissão de Crachá');
  frmAguarde.Pos := 0;
  dtmRelatoriosComum.qryCracha.Open;
  if (dtmRelatoriosComum.qryCracha.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos.'+CR_LF+'Verifique.',
      'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;
end;

end.
