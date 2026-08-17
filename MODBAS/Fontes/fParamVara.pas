unit fParamVara;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamVara = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamVara: TfrmParamVara;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatoriosComumJurid, fAguarde;

{$R *.DFM}

procedure TfrmParamVara.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosComumJurid.rpVara.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamVara.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatoriosComumJurid.qryVara.Close;
  with (dtmRelatoriosComumJurid.qryVara.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDVARAJUSTICA, DESCRICAO');
    Add('FROM');
    Add('  VARAJUSTICA');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  IDVARAJUSTICA');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem das Varas de Justiça');
  frmAguarde.Pos := 0;
  dtmRelatoriosComumJurid.qryVara.Open;
  if (dtmRelatoriosComumJurid.qryVara.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatoriosComumJurid.rpVara.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
