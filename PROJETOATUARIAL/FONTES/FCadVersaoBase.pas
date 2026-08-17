unit FCadVersaoBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, CmEventosCadastro, cmseldlg, wwDialog, wwidlg, ImgList, Db,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, MontaSelect, DBGrids;

type
  TfrmCadVersaoBase = class(TfrmCadastro)
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    PnlDetalhe: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    Label1: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DtEdtRefer: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    DBChkBxBaseHist: TDBCheckBox;
    qryAux: TwwQuery;
    Label5: TLabel;
    Label6: TLabel;
    MontaSelect: TMontaSelect;
    QryDelDependentes: TwwQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    QryDelValorPartic: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    QryDelGrupoPartic: TwwQuery;
    StringField3: TStringField;
    FloatField3: TFloatField;
    QryDelTempoPartic: TwwQuery;
    StringField4: TStringField;
    FloatField4: TFloatField;
    QryDelParticipante: TwwQuery;
    StringField5: TStringField;
    FloatField5: TFloatField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DbGrdDet: TDBGrid;
    QryPrincipal: TQuery;
    UpdateSQL1: TUpdateSQL;
    QryBasePlano: TQuery;
    dsBasePlano: TDataSource;
    UpdateSQL2: TUpdateSQL;
    QryPatrocinadora: TQuery;
    dsPatrocinadora: TDataSource;
    dsEntidade: TDataSource;
    QryEntidade: TQuery;
    dsPlano: TDataSource;
    QryPlano: TQuery;
    QryPrincipalCD_VERSAO: TFloatField;
    QryPrincipalDS_VERSAO: TStringField;
    QryPrincipalDT_GERACAO: TDateTimeField;
    QryPrincipalLOGIN: TStringField;
    QryPrincipalDT_REFER_BASE: TDateTimeField;
    QryPrincipalIR_BASE_HISTORICA: TStringField;
    QryBasePlanoCD_VERSAO: TFloatField;
    QryBasePlanoCD_PESSOA_PATROC: TFloatField;
    QryBasePlanoCD_PESSOA_ENTID: TFloatField;
    QryBasePlanoCD_PLANO: TFloatField;
    QryPatrocinadoraCD_PESSOA: TFloatField;
    QryPatrocinadoraNO_PESSOA: TStringField;
    QryEntidadeCD_PESSOA: TFloatField;
    QryEntidadeNO_PESSOA: TStringField;
    QryPlanoCD_PLANO: TFloatField;
    QryPlanoNO_PLANO: TStringField;
    QryLkpEntidade: TQuery;
    FloatField6: TFloatField;
    StringField6: TStringField;
    QryLkpPatrocinadora: TQuery;
    FloatField7: TFloatField;
    StringField7: TStringField;
    QryLkpPlano: TQuery;
    FloatField8: TFloatField;
    StringField8: TStringField;
    QryBasePlanods_Entidade: TStringField;
    QryBasePlanods_Patrocinadora: TStringField;
    QryBasePlanods_Plano: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterInsert(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryBasePlanoBeforePost(DataSet: TDataSet);
    procedure QryBasePlanoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    versao_nova, versao_velha: Integer;
    op: Char;
  end;

var
  frmCadVersaoBase: TfrmCadVersaoBase;
  iCod: Integer;

implementation

uses uSistema, dBaseDados;

{$R *.DFM}

procedure TfrmCadVersaoBase.FormCreate(Sender: TObject);
begin
  inherited;
  qryEntidade.Open;
  qryPatrocinadora.Open;
  qryPlano.Open;
  qryLkpEntidade.Open;
  qryLkpPatrocinadora.Open;
  qryLkpPlano.Open;
  QryPrincipal.Open;
  qryBasePlano.Open;
  PnlDetalhe.SendToBack;
end;

procedure TfrmCadVersaoBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryEntidade.Close;
  qryPatrocinadora.Close;
  qryPlano.Close;
  qryLkpEntidade.Close;
  qryLkpPatrocinadora.Close;
  qryLkpPlano.Close;
  QryPrincipal.Close;
  qryBasePlano.Close;
  inherited;
end;

procedure TfrmCadVersaoBase.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  if iCod > 0 then
    QryPrincipal.Locate('CD_VERSAO', iCod, []);

  BtIns.Enabled :=True;
  BtAlt.Enabled:=True;
  BtExcl.Enabled:=True;
end;

procedure TfrmCadVersaoBase.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  BtIns.Enabled :=False;
  BtAlt.Enabled:=False;
  BtExcl.Enabled:=False;
end;

procedure TfrmCadVersaoBase.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  BtIns.Enabled :=False;
  BtAlt.Enabled:=False;
  BtExcl.Enabled:=False;
end;

procedure TfrmCadVersaoBase.sbtnApagarClick(Sender: TObject);
begin
  if MessageBox(0,'Deseja realmente excluir o registro?','Cálculo Atuarial', 4) <> IdYes Then
   begin
     CmeCadastro.AtualizaBotoes(Self);
     Exit;
   end;


  Try
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
    dtmBaseDados.dbBaseDados.StartTransaction;

    QryDelDependentes.ParamByName('CD_VERSAO').asInteger :=
        QryPrincipal.FieldByName('CD_VERSAO').asInteger;
    QryDelDependentes.ExecSQL;

    QryDelValorPartic.ParamByName('CD_VERSAO').asInteger :=
        QryPrincipal.FieldByName('CD_VERSAO').asInteger;
    QryDelValorPartic.ExecSQL;

    QryDelTempoPartic.ParamByName('CD_VERSAO').asInteger :=
        QryPrincipal.FieldByName('CD_VERSAO').asInteger;
    QryDelTempoPartic.ExecSQL;

    QryDelGrupoPartic.ParamByName('CD_VERSAO').asInteger :=
        QryPrincipal.FieldByName('CD_VERSAO').asInteger;
    QryDelGrupoPartic.ExecSQL;

    QryDelParticipante.ParamByName('CD_VERSAO').asInteger :=
        QryPrincipal.FieldByName('CD_VERSAO').asInteger;
    QryDelParticipante.ExecSQL;

    dtmBaseDados.dbBaseDados.Commit;
  Except
    dtmBaseDados.dbBaseDados.RollBack;
  End;



  while not qryBasePlano.Eof do
   begin
     qryBasePlano.Delete;
     qryBasePlano.ApplyUpdates;
     qryBasePlano.CommitUpdates;
   end;


  QryPrincipal.Delete;
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;


  CmeCadastro.AtualizaBotoes(Self);

  if qryPrincipal.isEmpty then
   begin
    BtIns.Enabled :=False;
    BtAlt.Enabled:=False;
    BtExcl.Enabled:=False;
   end
end;

procedure TfrmCadVersaoBase.BtInsClick(Sender: TObject);
begin
  if qryBasePlano.State in [dsInsert, dsEdit] then
    qryBasePlano.Cancel;

  qryBasePlano.Insert;
  DbGrdDet.SendToBack;
  BtIns.Down := True;
  btAlt.Enabled := False;
  BtExcl.Enabled := False;
end;

procedure TfrmCadVersaoBase.btAltClick(Sender: TObject);
begin
  if qryBasePlano.State in [dsInsert, dsEdit] then
    qryBasePlano.Cancel;

  qryBasePlano.Edit;
  DbGrdDet.SendToBack;
  btAlt.Down := True;
  BtIns.Enabled := False;
  BtExcl.Enabled := False;
end;

procedure TfrmCadVersaoBase.bbtnCancelarDetClick(Sender: TObject);
begin
  if qryBasePlano.State in [dsInsert, dsEdit] then
    qryBasePlano.Cancel;

  PnlDetalhe.SendToBack;
  btIns.Down := False;
  btAlt.Down := False;
  BtIns.Enabled := True;
  BtAlt.Enabled := True;
  BtExcl.Enabled := True;
end;

procedure TfrmCadVersaoBase.bbtnOkDetClick(Sender: TObject);
begin
  if qryBasePlano.State in [dsInsert, dsEdit] then
   begin
     qryBasePlano.Post;
     qryBasePlano.ApplyUpdates;
     qryBasePlano.CommitUpdates;
   end;

  PnlDetalhe.SendToBack;
  btIns.Down := False;
  btAlt.Down := False;
  BtIns.Enabled := True;
  BtAlt.Enabled := True;
  BtExcl.Enabled := True;
end;

procedure TfrmCadVersaoBase.BtExclClick(Sender: TObject);
begin
  if MessageBox(0,'Deseja realmente excluir o registro?','Cálculo Atuarial', 4) <> IdYes Then
    Exit;

  qryBasePlano.Delete;
  qryBasePlano.ApplyUpdates;
  qryBasePlano.CommitUpdates;

  if qryBasePlano.isEmpty then
   begin
     BtAlt.Enabled := False;
     BtExcl.Enabled := False;
   end;
end;

procedure TfrmCadVersaoBase.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  bbtnCancelar.Click;
end;

procedure TfrmCadVersaoBase.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;
end;

procedure TfrmCadVersaoBase.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  if SBtnInserir.Down then
   begin
     qryAux.Open;
     qryPrincipal.FieldByName('CD_VERSAO').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;

     qryPrincipal.FieldByName('DT_GERACAO').asDateTime := now;
     qryPrincipal.FieldByName('LOGIN').asString := Sistema.NomeUsuario; 
     qryPrincipal.FieldByName('IR_BASE_HISTORICA').asString := 'N';
     qryPrincipal.FieldByName('DT_REFER_BASE').asDateTime := StrToDate(DtEdtRefer.Text);
   end;
end;

procedure TfrmCadVersaoBase.QryPrincipalAfterInsert(DataSet: TDataSet);
begin
  qryPrincipal.FieldByName('LOGIN').asString := Sistema.NomeUsuario;
  qryPrincipal.FieldByName('DT_REFER_BASE').asDateTime := Date;
end;

procedure TfrmCadVersaoBase.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  iCod := QryPrincipal.FieldByName('CD_VERSAO').asInteger;
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

procedure TfrmCadVersaoBase.QryBasePlanoBeforePost(DataSet: TDataSet);
begin
  qryBasePlano.FieldByName('CD_VERSAO').asInteger :=
     QryPrincipal.FieldByName('CD_VERSAO').asInteger;
end;

procedure TfrmCadVersaoBase.QryBasePlanoAfterPost(DataSet: TDataSet);
begin
  qryBasePlano.ApplyUpdates;
  qryBasePlano.CommitUpdates;
end;

end.
