unit fParamGrpObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamGrpObjeto = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamGrpObjeto: TfrmParamGrpObjeto;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatoriosComumJurid, fAguarde;

{$R *.DFM}

procedure TfrmParamGrpObjeto.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosComumJurid.rpGrpObjeto.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamGrpObjeto.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatoriosComumJurid.qryGrpObjeto.Close;
  with (dtmRelatoriosComumJurid.qryGrpObjeto.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDGRUPOOBJETO, DESCRICAO');
    Add('FROM');
    Add('  GRPOBJPROCJUR');
    Add('WHERE');
    Add('  (CLASSEOBJ = ''1'')');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  IDGRUPOOBJETO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem dos Grupos de Objetos');
  frmAguarde.Pos := 0;
  dtmRelatoriosComumJurid.qryGrpObjeto.Open;
  if (dtmRelatoriosComumJurid.qryGrpObjeto.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatoriosComumJurid.rpGrpObjeto.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
