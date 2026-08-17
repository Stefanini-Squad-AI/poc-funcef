unit fParamCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti,
  IvEMulti, Grids, Wwdbigrd, Wwdbgrid, DBGrids, ComCtrls, fSairAjuda;

type
  TfrmParamCCusto = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamCCusto: TfrmParamCCusto;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatorios, fAguarde;

{$R *.DFM}

procedure TfrmParamCCusto.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatorios.rpCCusto.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamCCusto.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatorios.qryCCusto.Close;
  with (dtmRelatorios.qryCCusto.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  CODCENTROCUSTO, NOME');
    Add('FROM');
    Add('  CENTCUST');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  CODCENTROCUSTO');
      1 : Add('  NOME');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem de Centros de Custo');
  frmAguarde.Pos := 0;
  dtmRelatorios.qryCCusto.Open;
  if (dtmRelatorios.qryCCusto.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatorios.rpCCusto.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
