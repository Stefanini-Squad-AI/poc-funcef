unit fParamTipObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti, ComCtrls, fSairAjuda;

type
  TfrmParamTipObjeto = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamTipObjeto: TfrmParamTipObjeto;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatoriosComumJurid, fAguarde;

{$R *.DFM}

procedure TfrmParamTipObjeto.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosComumJurid.rpTipObjeto.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamTipObjeto.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatoriosComumJurid.qryTipObjeto.Close;
  with (dtmRelatoriosComumJurid.qryTipObjeto.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  TP.CODTIPOOBJETO, TP.DESCRICAO,');
    Add('  GP.DESCRICAO AS GRUPOOBJETO, PD.DESCRICAO AS PROVENTO');
    Add('FROM');
    Add('  TIPOOBJPROCTRAB TP, PROVDESC PD, GRPOBJPROCJUR GP');
    Add('WHERE');
    Add('  (TP.IDGRUPOOBJETO = GP.IDGRUPOOBJETO(+)) AND');
    Add('  (TP.IDPROVENTO    = PD.IDPROVENTO(+))');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  CODTIPOOBJETO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem dos Tipos de Objetos');
  frmAguarde.Pos := 0;
  dtmRelatoriosComumJurid.qryTipObjeto.Open;
  if (dtmRelatoriosComumJurid.qryTipObjeto.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatoriosComumJurid.rpTipObjeto.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
