unit FCadLayoutPlanExecl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Wwdbspin, uCtrlLogTabelas, uctrlPadroes,
  uCtrlLayoutImport, usistema, dBaseDados, wwdblook, uCmSqlParams, UMensErro;

type
  TFrmCadLayoutPlanExeclMT = class(TFrmCadastroMestreDetMT)
    dbedDescModelo: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbspLinhaIni: TwwDBSpinEdit;
    dbedTitulo: TwwDBEdit;
    Label3: TLabel;
    dbEdColuna: TwwDBEdit;
    Label4: TLabel;
    dbspTamanho: TwwDBSpinEdit;
    Label5: TLabel;
    dbcmbTipo: TwwDBComboBox;
    Label6: TLabel;
    cdsDet: TCMClientDataSet;
    Label7: TLabel;
    dblkModulo: TwwDBLookupCombo;
    SqlModulos: TCMSqlParams;
    CdsMolulos: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    dblkTabelas: TwwDBLookupCombo;
    Label8: TLabel;
    dblkColTabela: TwwDBLookupCombo;
    Label9: TLabel;
    sqlTabelas: TCMSqlParams;
    cdsTabelas: TCMClientDataSet;
    sqlColunaTabela: TCMSqlParams;
    cdsColunaTabela: TCMClientDataSet;
    dbspLinha: TwwDBSpinEdit;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dblkTabelasCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    idLayOutImport : integer;
  public
    { Public declarations }
    procedure msg(smsg: string);
  end;

var
  FrmCadLayoutPlanExeclMT: TFrmCadLayoutPlanExeclMT;
  CtrlLayoutImport: TCtrlLayoutImport;
implementation

{$R *.DFM}

procedure TFrmCadLayoutPlanExeclMT.FormCreate(Sender: TObject);
begin
  inherited;
  idLayOutImport := 0;
  CtrlLayoutImport := TCtrlLayoutImport.Create;
  CtrlLayoutImport.Initializeas(Padroes);
  CtrlLayoutImport.CdsLayoutImport := cds;
  CtrlLayoutImport.CdsColLayoutImport := cdsDet;
  cds.data := CtrlLayoutImport.GetLayout(0, 0);
  cdsDet.Data := CtrlLayoutImport.GetColLayout(0);
  sqlTabelas.Open;
  sqlColunaTabela.prepare;
  sqlColunaTabela.paramByName('NOME_TABELA').asString := trim(dblkTabelas.text);
  sqlColunaTabela.Open;
  SqlModulos.Open;
end;

procedure TFrmCadLayoutPlanExeclMT.msg(smsg: string);
begin
  MsgDlg(smsg, '', mtError, [mbOk], 0);
end;

procedure TFrmCadLayoutPlanExeclMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaSelect.RetornouValor then
  begin
    cds.data := CtrlLayoutImport.GetLayout(strToInt(montaSelect.valoresChave[2]), strToInt(montaSelect.valoresChave[0]));
    cdsDet.Data := CtrlLayoutImport.GetColLayout(strToInt(montaSelect.valoresChave[0]));
    idLayOutImport := strToInt(montaSelect.valoresChave[0]);

    sqlColunaTabela.prepare;
    sqlColunaTabela.paramByName('NOME_TABELA').asString := trim(dblkTabelas.text);
    sqlColunaTabela.Open;
    SqlModulos.Open;
  end;
end;

procedure TFrmCadLayoutPlanExeclMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  if not CtrlLayoutImport.ApagaLayOut(idLayOutImport) then
    msg(CtrlLayoutImport.MessageInfo)
  else
  begin
    cds.data := CtrlLayoutImport.GetLayout(0, 0);
    cdsDet.Data := CtrlLayoutImport.GetColLayout(0);
  end;
end;

procedure TFrmCadLayoutPlanExeclMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  if trim(dbedDescModelo.text) = '' then
  begin
    Accept := false;
    MsgDlg('A o campo "Descrição do Modelo" tem que ser preenchido' , '', mtError, [mbOk], 0);
    dbedDescModelo.setFocus;
    Abort;
  end;

  if (dbspLinhaIni.Value <= 0) or (trim(dbspLinhaIni.text) = '') then
  begin
    Accept := false;
    MsgDlg('o campo "Linha Inicial" tem que conter um valor maior que zero.' , '', mtError, [mbOk], 0);
    dbspLinhaIni.setFocus;
    Abort;
  end;

  if (trim(dblkModulo.text) = '') then
  begin
    Accept := false;
    MsgDlg('o campo "Módulo" tem que ser selecionado.' , '', mtError, [mbOk], 0);
    dblkModulo.setFocus;
    Abort;
  end;

  if cdsdet.Isempty then
  begin
    Accept := false;
    MsgDlg('Os dados das colunas tem que ser preenchidos.' , '', mtError, [mbOk], 0);
    Abort;
  end;

end;

procedure TFrmCadLayoutPlanExeclMT.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  if (trim(dbedTitulo.text) = '') then
  begin
    Accept := false;
    MsgDlg('o campo "Título do Campo" tem que ser preenchido.' , '', mtError, [mbOk], 0);
    dbedTitulo.setFocus;
    Abort;
  end;

  if (trim(dbEdColuna.text) = '') then
  begin
    Accept := false;
    MsgDlg('o campo "Coluna da Planilha" tem que ser preenchido.' , '', mtError, [mbOk], 0);
    dbEdColuna.setFocus;
    Abort;
  end;

  if (trim(dbcmbTipo.text) = '') then
  begin
    Accept := false;
    MsgDlg('o campo "Tipo" tem que ser preenchido.' , '', mtError, [mbOk], 0);
    dbcmbTipo.setFocus;
    Abort;
  end;

  if (dbspLinha.value < dbspLinhaIni.value) and (trim(dbspLinha.text) <> '')then
  begin
    Accept := false;
    MsgDlg('o valor campo "Linha" tem que ser maior ou igual ao campo "Linha Inicial".' , '', mtError, [mbOk], 0);
    dbspLinha.setFocus;
    Abort;
  end;

end;

procedure TFrmCadLayoutPlanExeclMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  if not CtrlLayoutImport.Grava then
    msg(CtrlLayoutImport.MessageInfo)
  else
  begin
    cds.data := CtrlLayoutImport.GetLayout(0, 0);
    cdsDet.Data := CtrlLayoutImport.GetColLayout(0);
  end;
end;

procedure TFrmCadLayoutPlanExeclMT.dblkTabelasCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsColunaTabela.Close;
  sqlColunaTabela.prepare;
  sqlColunaTabela.paramByName('NOME_TABELA').asString := cdsTabelas.fieldByName('object_name').asString;
  sqlColunaTabela.Open;
end;

end.
