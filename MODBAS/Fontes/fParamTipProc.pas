unit fParamTipProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamTipProc = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamTipProc: TfrmParamTipProc;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatoriosComumJurid, fAguarde;

{$R *.DFM}

procedure TfrmParamTipProc.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosComumJurid.rpTipProc.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamTipProc.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatoriosComumJurid.qryTipProc.Close;
  with (dtmRelatoriosComumJurid.qryTipProc.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDTIPOPROC, NOMETIPOPROC');
    Add('FROM');
    Add('  TIPOPROCESSO');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  IDTIPOPROC');
      1 : Add('  NOMETIPOPROC');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem dos Tipos de Processo');
  frmAguarde.Pos := 0;
  dtmRelatoriosComumJurid.qryTipProc.Open;
  if (dtmRelatoriosComumJurid.qryTipProc.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatoriosComumJurid.rpTipProc.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
