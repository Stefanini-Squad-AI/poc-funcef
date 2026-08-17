unit FCadIntegracaoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwDialog, wwidlg, CmEventosCadastro, ImgList, Db,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, DBGrids,
  wwdbdatetimepicker, CMDateTimePicker, DBTables, Wwquery, Mask, wwdblook,
  ComCtrls, MontaSelect, uCtrlParamIntegra;

type
  TfrmCadIntegracaoContabil = class(TfrmCadastro)
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    dsLkpGrupo: TwwDataSource;
    QryLkpGrupo: TwwQuery;
    QryLkpVariavel: TwwQuery;
    QryPrincipalCD_PESSOA_PATROC: TFloatField;
    QryPrincipalCD_PESSOA_ENTID: TFloatField;
    QryPrincipalCD_PLANO: TFloatField;
    QryPrincipalNO_VARIAVEL: TStringField;
    QryPrincipalDT_REFERENCIA: TDateTimeField;
    QryPrincipalVL_VARIAVEL: TFloatField;
    QryLkpGrupoDS_GRUPO_CONTABIL: TStringField;
    QryPrincipallkpGrupo: TStringField;
    QryPrincipallkpVariavel: TStringField;
    QryPrincipalCD_GRUPO_CONTABIL: TFloatField;
    QryPrincipalCD_CONTA_CONTABIL: TStringField;
    QryPrincipalTRGDTINCLUSAO: TDateTimeField;
    QryPrincipalTRGUSERINCLUSAO: TStringField;
    QryLkpContaContabil: TwwQuery;
    QryLkpVariavelCD_GRUPO_CONTABIL: TFloatField;
    QryLkpVariavelNO_VARIAVEL: TStringField;
    dsLkpVariavel: TwwDataSource;
    QryPrincipallkpContaContabil: TStringField;
    QryLkpGrupoCD_GRUPO_CONTABIL: TFloatField;
    QryLkpPatrocinadora: TwwQuery;
    QryLkpPatrocinadoraNO_PESSOA: TStringField;
    QryLkpPatrocinadoraCD_PESSOA_PATROC: TFloatField;
    dsLkpPatrocinadora: TwwDataSource;
    QryLkpPlano: TwwQuery;
    QryLkpPlanoNO_PLANO: TStringField;
    QryLkpPlanoCD_PESSOA_PATROC: TFloatField;
    QryLkpPlanoCD_PESSOA_ENTID: TFloatField;
    QryLkpPlanoCD_PLANO: TFloatField;
    dsLkpPlano: TwwDataSource;
    QryLkpGrupoCD_PESSOA_PATROC: TFloatField;
    QryLkpGrupoCD_PLANO: TFloatField;
    QryLkpVariavelCD_PESSOA_PATROC: TFloatField;
    QryLkpVariavelCD_PLANO: TFloatField;
    QryLkpGrupoGeral: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    QryLkpVariavelGeral: TwwQuery;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField2: TStringField;
    QryLkpContaContabilGeral: TwwQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    DBGrdCadastro: TDBGrid;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    DBLkpCmbSubGrupo: TwwDBLookupCombo;
    DBLkpCmbGrupo: TwwDBLookupCombo;
    Label6: TLabel;
    DBLkpCmbContaContabil: TwwDBLookupCombo;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    QryLkpContaContabilCD_CONTA_CONTABIL: TStringField;
    QryLkpContaContabilDESCRICAO: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    DtEdtReferencia: TCMDateTimePicker;
    DBLkpCmbBxPatrocinadora: TwwDBLookupCombo;
    DBLkpCmbBxPlano: TwwDBLookupCombo;
    MontaSelect: TMontaSelect;
    QryPrincipallkpPatrocinadora: TStringField;
    QryPrincipallkpPlano: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadIntegracaoContabil: TfrmCadIntegracaoContabil;

implementation

{$R *.DFM}

procedure TfrmCadIntegracaoContabil.FormCreate(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;

  QryLkpPatrocinadora.Open;
  QryLkpPlano.Open;
  QryLkpGrupo.Open;
  QryLkpVariavel.Open;
  QryLkpContaContabil.Close;
  QryLkpContaContabil.SQL[3] := '  AND PLANOCONTA.PLANO = ' + IntToStr(ParamIntegra.Plano);
  QryLkpContaContabil.Open;
  QryLkpGrupoGeral.Open;
  QryLkpVariavelGeral.Open;
  QryLkpContaContabilGeral.Open;

  QryPrincipal.Open;

  inherited;
end;

procedure TfrmCadIntegracaoContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryPrincipal.Close;
  QryLkpPlano.Close;
  QryLkpGrupo.Close;
  QryLkpVariavel.Close;
  QryLkpPatrocinadora.Close;
  QryLkpContaContabil.Close;
  QryLkpGrupoGeral.Close;
  QryLkpVariavelGeral.Close;
  QryLkpContaContabilGeral.Close;

  inherited;
end;

procedure TfrmCadIntegracaoContabil.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

procedure TfrmCadIntegracaoContabil.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  if QryPrincipalDT_REFERENCIA.isNull then
   begin
     MessageDlg('Informe a Data de Referência.', mtWarning, [mbOk], 0);
     DtEdtReferencia.SetFocus;
     Abort;
   end;

  if QryPrincipalCD_PESSOA_PATROC.isNull then
   begin
     MessageDlg('Informe a Patrocinadora.', mtWarning, [mbOk], 0);
     DBLkpCmbBxPatrocinadora.SetFocus;
     Abort;
   end;

  if QryPrincipalCD_PLANO.isNull then
   begin
     MessageDlg('Informe o Plano.', mtWarning, [mbOk], 0);
     DBLkpCmbBxPlano.SetFocus;
     Abort;
   end;

  if QryPrincipalCD_GRUPO_CONTABIL.isNull then
   begin
     MessageDlg('Informe o Grupo.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[0].FocusControl;
     Abort;
   end;

  if Trim(QryPrincipalNO_VARIAVEL.asString) = '' then
   begin
     MessageDlg('Informe o Sub Grupo.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[1].FocusControl;
     Abort;
   end;

  QryPrincipalCD_PESSOA_PATROC.asInteger := QryLkpPlanoCD_PESSOA_PATROC.asInteger;
  QryPrincipalCD_PESSOA_ENTID.asInteger := QryLkpPlanoCD_PESSOA_ENTID.asInteger;
end;

procedure TfrmCadIntegracaoContabil.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmCadIntegracaoContabil.dsStateChange(Sender: TObject);
begin
  if TwwDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
    PageControl.ActivePageIndex := 1
  else
    PageControl.ActivePageIndex := 0;
end;

procedure TfrmCadIntegracaoContabil.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
    QryPrincipal.Locate('CD_PESSOA_PATROC;CD_PESSOA_ENTID;CD_PLANO;CD_GRUPO_CONTABIL;' +
       'CD_CONTA_CONTABIL;NO_VARIAVEL;DT_REFERENCIA',
       VarArrayOf([MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[1]]), []);

  sbtnProcurar.Down := False;
end;

end.
