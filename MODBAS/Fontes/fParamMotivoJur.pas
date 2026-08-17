unit fParamMotivoJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamMotivoJur = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamMotivoJur: TfrmParamMotivoJur;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatoriosComumJurid, fAguarde;

{$R *.DFM}

procedure TfrmParamMotivoJur.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosComumJurid.rpMotivoJur.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamMotivoJur.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatoriosComumJurid.qryMotivoJur.Close;
  with (dtmRelatoriosComumJurid.qryMotivoJur.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDMOTIVO, DESCRICAO, OBSERVACAO, GRUPOMOTIVO');
    Add('FROM');
    Add('  MOTIVO');
    Add('WHERE');
    Add('  (GRUPOMOTIVO = ''O'')');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  IDMOTIVO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem dos Motivos de Exclusão');
  frmAguarde.Pos := 0;
  dtmRelatoriosComumJurid.qryMotivoJur.Open;
  if (dtmRelatoriosComumJurid.qryMotivoJur.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatoriosComumJurid.rpMotivoJur.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
