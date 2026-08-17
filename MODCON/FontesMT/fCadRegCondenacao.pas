unit fCadRegCondenacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
  DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
  CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  BfDialogs, BrowseFolder, uProcuraDir,
  ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, MontaSelect,
  Menus, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmCadRegCondenacao = class(TfrmOkCancelar)
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    Label17: TLabel;
    dbredNossoValor: TDBRealEdit;
    GroupBox1: TGroupBox;
    dbgdCondenacao: TwwDBGrid;
    dsLitis: TwwDataSource;
    CdsLitis: TCMClientDataSet;
    Label1: TLabel;
    redValorTotal: TDBRealEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    ValorAntes: variant;
    Valor3osAntes: variant;
  public
    class function ExibirTelaCondenacao(CdsOrigem, CdsLitisOrigem: TCMClientDataSet;
      TotReal: double): boolean;
  end;

var
  frmCadRegCondenacao: TfrmCadRegCondenacao;

implementation

uses dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro;


{$R *.DFM}

procedure TfrmCadRegCondenacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CdsLitis.Filter := '';
  CdsLitis.Filtered := false;
  Action := caHide;
end;

class function TfrmCadRegCondenacao.ExibirTelaCondenacao(CdsOrigem,CdsLitisOrigem: TCMClientDataSet;
  TotReal: double): boolean;
var
  frm: TfrmCadRegCondenacao;
  i: integer;
begin
  frm := TfrmCadRegCondenacao.Create(Application);
  frm.redValorTotal.Value := TotReal;
  frm.Cds := CdsOrigem;
  frm.ds.DataSet := CdsOrigem;
  frm.CdsLitis := CdsLitisOrigem;
  frm.dsLitis.DataSet := CdsLitisOrigem;
  if (CdsOrigem.State in [dsInsert,dsEdit]) then
  begin
    frm.dbgdCondenacao.Options := frm.dbgdCondenacao.Options + [dgEditing];
    frm.bbtnConfirmar.Enabled := true;
    frm.bbtnCancelar.Enabled := true;
    frm.bbtnSair.Enabled := false;
    frm.pnlFundo.Enabled := true;
  end
  else
  begin
    frm.dbgdCondenacao.Options := frm.dbgdCondenacao.Options - [dgEditing];
    frm.bbtnConfirmar.Enabled := false;
    frm.bbtnCancelar.Enabled := false;
    frm.bbtnSair.Enabled := true;
    frm.pnlFundo.Enabled := false;
  end;
  frm.ValorAntes := frm.Cds.FieldByName('VALORCONDENACAO').Value;
  frm.CdsLitis.Filter := 'INDTESTEMUNHA = 3';
  frm.CdsLitis.Filtered := true;
  frm.Valor3osAntes := VarArrayCreate([1, frm.CdsLitis.RecordCount], varDouble);
  frm.CdsLitis.First;
  i := 1;
  while not frm.CdsLitis.Eof do
  begin
    frm.Valor3osAntes [i] := frm.CdsLitis.FieldByName('VALORCONDENACAO').asFloat;
    inc(i);
    frm.CdsLitis.Next;
  end;
  frm.CdsLitis.First;
  Result := (frm.ShowModal = mrOk);
  frm.Cds := Nil;
  frm.Free;
end;

procedure TfrmCadRegCondenacao.bbtnCancelarClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  ModalResult := mrOK;
  Cds.FieldByName('VALORCONDENACAO').Value := ValorAntes;
  CdsLitis.First;
  i := 1;
  while not CdsLitis.Eof do
  begin
    CdsLitis.Edit;
    CdsLitis.FieldByName('VALORCONDENACAO').asFloat := Valor3osAntes [i];
    CdsLitis.Post;
    inc(i);
    CdsLitis.Next;
  end;
  CdsLitis.First;
end;

procedure TfrmCadRegCondenacao.bbtnConfirmarClick(Sender: TObject);
var
  dTotCalc: double;
begin
  ModalResult := mrOK;
  dTotCalc := dbredNossoValor.Value;
  CdsLitis.First;
  while not CdsLitis.Eof do
  begin
    dTotCalc := dTotCalc + CdsLitis.FieldByName('VALORCONDENACAO').asFloat;
    CdsLitis.Next;
  end;
  CdsLitis.First;

  if (dTotCalc <> redValorTotal.Value) and
     (MsgDlg('Valores Informados Não Batem com o Total. Confirma Assim Mesmo ?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    ModalResult := mrNone;
    dbredNossoValor.SetFocus;
    exit;
  end;
  inherited;
end;

end.
