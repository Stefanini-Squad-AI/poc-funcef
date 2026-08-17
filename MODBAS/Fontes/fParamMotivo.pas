unit fParamMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti,
  IvEMulti, Grids, Wwdbigrd, Wwdbgrid, DBGrids, ComCtrls;

type
  TfrmParamMotivo = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamMotivo: TfrmParamMotivo;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatorios, fAguarde;

{$R *.DFM}

procedure TfrmParamMotivo.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatorios.rpMotivo.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamMotivo.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatorios.qryMotivo.Close;
  with (dtmRelatorios.qryMotivo.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDMOTIVO, DESCRICAO,');
    Add('  DECODE(GRUPOMOTIVO,''F'',''Tipo de Folha'', ''D'',''Desligamento/Afastamento'',');
    Add('    ''A'',''Alteração Funcional'', ''O'',''Outro'') AS GRUPO');
    Add('FROM');
    Add('  MOTIVO');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  IDMOTIVO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem de Motivos e Ações');
  frmAguarde.Pos := 0;
  dtmRelatorios.qryMotivo.Open;
  if (dtmRelatorios.qryMotivo.IsEmpty) then
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
  dtmRelatorios.rpMotivo.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
end;

end.
