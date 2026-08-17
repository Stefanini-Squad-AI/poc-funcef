unit FCadTipoAcaoxRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  wwdblook, uObjFolha, uMensErro;

type
  TFrmCadTipoAcaoxRegra = class(TFrmCadastroGridCS)
    cmbTipoAcao: TComboBox;
    lblTipoAcao: TLabel;
    lblRegra: TLabel;
    dblkRegra: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    qryNOMEREGRA: TStringField;
    qryIDREGRA: TFloatField;
    qryTIPOACAO: TFloatField;
    qryDESCACAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbTipoAcaoChange(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreQryeHabilitaBotoes;
  public
    { Public declarations }
  end;

var
  FrmCadTipoAcaoxRegra: TFrmCadTipoAcaoxRegra;

implementation

{$R *.DFM}

procedure TFrmCadTipoAcaoxRegra.FormShow(Sender: TObject);
begin
  inherited;
  If SistemaFolha.IdGrupoRegraFolha <> 0 Then
  Begin
    qryRegra.Close;
    qryRegra.Sql.Clear;
    qryRegra.Sql.Add(
    ' SELECT R.IDREGRA, R.NOMEREGRA FROM REGRA R, TIPOREGRA TR, GRUPOREGRA GR '+
    ' WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA AND TR.IDGRUPOREGRA = GR.IDGRUPOREGRA '+
    ' AND GR.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' ORDER BY R.NOMEREGRA');
  End;
  qryRegra.Open;
  AbreQryeHabilitaBotoes;
  sbtnInserir.Enabled := False;
  qry.Close;
end;

procedure TFrmCadTipoAcaoxRegra.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If qry.State In [dsInsert, dsEdit] Then
  Begin
    qry.FieldByName('TIPOACAO').AsInteger := cmbTipoAcao.ItemIndex;
    qry.FieldByName('IDREGRA').AsInteger  := StrToInt(dblkRegra.LookupValue);
  End;
end;

procedure TFrmCadTipoAcaoxRegra.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  dbGrd.Visible        := True;
  sbtnInserir.Enabled  := False;
  sbtnProcurar.Enabled := False;
end;

procedure TFrmCadTipoAcaoxRegra.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  AbreQryeHabilitaBotoes;
  dblkregra.enabled := false;
end;

procedure TFrmCadTipoAcaoxRegra.bbtnConfirmarClick(Sender: TObject);
begin
  If Trim(cmbTipoAcao.Text) = '' Then
  Begin
    MsgDlg('Por Favor, escolha um tipo de ação judicial.', 'Informção', mtInformation, [mbOk], 0);
    cmbTipoAcao.SetFocus;
    Exit;
  End;

  If Trim(dblkRegra.Text) = '' Then
  Begin
    MsgDlg('Por Favor, escolha uma regra.', 'Informção', mtInformation, [mbOk], 0);
    dblkRegra.SetFocus;
    Exit;
  End;

  inherited;
  bbtnCancelarClick(Self);
  dblkRegra.enabled := false;
end;

procedure TFrmCadTipoAcaoxRegra.cmbTipoAcaoChange(Sender: TObject);
begin
  inherited;
  If cmbTipoAcao.Text <> '' Then
    AbreQryeHabilitaBotoes;
end;

procedure TFrmCadTipoAcaoxRegra.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dblkRegra.LookupValue := qry.FieldByName('IDREGRA').AsString
end;

procedure TFrmCadTipoAcaoxRegra.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  lblRegra.Enabled  := True;
  dblkRegra.Enabled := True;
end;

procedure TFrmCadTipoAcaoxRegra.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  lblRegra.Enabled  := True;
  dblkRegra.Enabled := True;
end;

procedure TFrmCadTipoAcaoxRegra.AbreQryeHabilitaBotoes;
begin
  qry.Close;
  qry.ParamByName('PTPACAO').AsInteger := cmbTipoAcao.ItemIndex;
  qry.Open;
  If Not qry.IsEmpty Then
  Begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnApagar.Enabled  := True;
  End
  Else
  Begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled  := False;
    lblRegra.Enabled    := False;
    dblkRegra.Enabled   := False;
    dblkRegra.Clear;
  End;
end;

procedure TFrmCadTipoAcaoxRegra.sbtnApagarClick(Sender: TObject);
begin
  sbtnAlterarClick(Self);
  bbtnCancelarClick(Self);
  inherited;
  AbreQryeHabilitaBotoes;
end;

end.
