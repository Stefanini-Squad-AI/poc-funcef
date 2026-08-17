unit fParamSindi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Mask,
  Wwdatsrc, wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio,
  IvMulti, IvEMulti, Wwdbigrd, Wwdbgrid, DBGrids, ComCtrls;

type
  TfrmParamSindi = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamSindi: TfrmParamSindi;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatorios, fAguarde;

{$R *.DFM}

procedure TfrmParamSindi.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatorios.rpSindi.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamSindi.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatorios.qrySindi.Close;
  with (dtmRelatorios.qrySindi.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  S.IDPESSOA, P.NOME, P.RAZAOSOCIAL,');
    Add('  DECODE(S.MESBASE, 1,''Janeiro'', 2,''Fevereiro'', 3,''Março'', 4,''Abril'', '+
      '5,''Maio'', 6,''Junho'', 7,''Julho'', 8,''Agosto'', 9,''Setembro'', 10,''Outubro'', '+
      '11,''Novembro'', 12,''Dezembro'') AS MESBASE');
    Add('FROM');
    Add('  PESSOA P, SINDICATO S');
    Add('WHERE');
    Add('  (S.IDPESSOA = P.IDPESSOA)');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  S.IDPESSOA');
      1 : Add('  P.NOME');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem de Sindicatos');
  frmAguarde.Pos := 0;
  dtmRelatorios.qrySindi.Open;
  if (dtmRelatorios.qrySindi.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;

  dtmRelatorios.rpSindi.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
