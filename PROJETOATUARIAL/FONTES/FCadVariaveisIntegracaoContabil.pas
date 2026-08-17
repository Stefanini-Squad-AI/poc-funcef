unit FCadVariaveisIntegracaoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwDialog, wwidlg, CmEventosCadastro, ImgList, Db,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, DBGrids, DBTables,
  Wwquery, wwdblook, uCtrlParamIntegra, ComCtrls, MontaSelect;

type
  TfrmCadVariaveisIntegracaoContabil = class(TfrmCadastro)
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryLkpPlano: TwwQuery;
    QryLkpPlanoNO_PLANO: TStringField;
    QryLkpPlanoCD_PESSOA_PATROC: TFloatField;
    QryLkpPlanoCD_PESSOA_ENTID: TFloatField;
    QryLkpPlanoCD_PLANO: TFloatField;
    QryLkpGrupo: TwwQuery;
    QryLkpGrupoDS_GRUPO_CONTABIL: TStringField;
    QryLkpTipoConta: TwwQuery;
    QryLkpTipoContaCODIGO: TStringField;
    QryLkpTipoContaDESCRICAO: TStringField;
    QryPrincipallkpGrupo: TStringField;
    QryPrincipallkpTipoConta: TStringField;
    QryLkpVariavel: TwwQuery;
    QryLkpVariavelNO_VARIAVEL: TStringField;
    QryPrincipallkpVariavel: TStringField;
    QryLkpContaContabil: TwwQuery;
    QryLkpContaContabilPLACONTA: TStringField;
    QryLkpContaContabilDESCRICAO: TStringField;
    QryPrincipallkpContaContabil: TStringField;
    QryLkpGrupoCD_GRUPO_CONTABIL: TFloatField;
    QryLkpPatrocinadora: TwwQuery;
    dsLkpPatrocinadora: TwwDataSource;
    QryLkpPatrocinadoraCD_PESSOA_PATROC: TFloatField;
    QryLkpPatrocinadoraNO_PESSOA: TStringField;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    DBGrdCadastro: TDBGrid;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    DBLkpCmbSubGrupo: TwwDBLookupCombo;
    DBLkpCmbGrupo: TwwDBLookupCombo;
    Label5: TLabel;
    DBLkpCmbContaContabil: TwwDBLookupCombo;
    Label6: TLabel;
    DBLkpCmbTipoConta: TwwDBLookupCombo;
    Label7: TLabel;
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    DBLkpCmbBxPatrocinadora: TwwDBLookupCombo;
    DBLkpCmbBxPlano: TwwDBLookupCombo;
    Label2: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    QryPrincipallkpPatrocinadora: TStringField;
    QryPrincipallkpPlano: TStringField;
    QryLkpHistorico: TwwQuery;
    QryLkpHistoricoHITCODHIST: TStringField;
    QryLkpHistoricoHITDESCR1: TStringField;
    QryPrincipalCD_PESSOA_PATROC: TFloatField;
    QryPrincipalCD_PESSOA_ENTID: TFloatField;
    QryPrincipalCD_PLANO: TFloatField;
    QryPrincipalCD_GRUPO_CONTABIL: TFloatField;
    QryPrincipalNO_VARIAVEL: TStringField;
    QryPrincipalCD_CONTA_CONTABIL: TStringField;
    QryPrincipalIR_TIPO_CONTA: TStringField;
    QryPrincipalDS_HISTORICO_PADRAO: TStringField;
    QryPrincipalTRGDTINCLUSAO: TDateTimeField;
    QryPrincipalTRGUSERINCLUSAO: TStringField;
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
  frmCadVariaveisIntegracaoContabil: TfrmCadVariaveisIntegracaoContabil;

implementation

{$R *.DFM}

procedure TfrmCadVariaveisIntegracaoContabil.FormCreate(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;

  QryLkpPlano.Open;
  QryLkpGrupo.Open;
  QryLkpTipoConta.Open;
  QryLkpVariavel.Open;
  QryLkpPatrocinadora.Open;
  QryLkpContaContabil.Close;
  QryLkpContaContabil.ParamByName('CD_PLANO_CONTA').asInteger := ParamIntegra.Plano;
  QryLkpContaContabil.Open;
  QryPrincipal.Open;

  inherited;
end;

procedure TfrmCadVariaveisIntegracaoContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryPrincipal.Close;
  QryLkpPlano.Close;
  QryLkpGrupo.Close;
  QryLkpTipoConta.Close;
  QryLkpVariavel.Close;
  QryLkpPatrocinadora.Close;
  QryLkpContaContabil.Close;

  inherited;
end;

procedure TfrmCadVariaveisIntegracaoContabil.QryPrincipalAfterPost(
  DataSet: TDataSet);
begin
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

procedure TfrmCadVariaveisIntegracaoContabil.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  if QryPrincipalCD_PESSOA_PATROC.isNull then
   begin
     MessageDlg('Informe a Patrocinadora.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[0].FocusControl;
     Abort;
   end;

  if QryPrincipalCD_PLANO.isNull then
   begin
     MessageDlg('Informe o Plano.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[1].FocusControl;
     Abort;
   end;

  if QryPrincipalCD_GRUPO_CONTABIL.isNull then
   begin
     MessageDlg('Informe o Grupo.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[2].FocusControl;
     Abort;
   end;

  if Trim(QryPrincipalNO_VARIAVEL.asString) = '' then
   begin
     MessageDlg('Informe o Sub Grupo.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[3].FocusControl;
     Abort;
   end;

  if Trim(QryPrincipalCD_CONTA_CONTABIL.asString) = '' then
   begin
     MessageDlg('Informe a Conta Contábil.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[2].FocusControl;
     Abort;
   end;

  if Trim(QryPrincipalIR_TIPO_CONTA.asString) = '' then
   begin
     MessageDlg('Informe o Tipo da Conta.', mtWarning, [mbOk], 0);
     DBGrdCadastro.Fields[3].FocusControl;
     Abort;
   end; 

  QryPrincipalCD_PESSOA_PATROC.asInteger := QryLkpPlanoCD_PESSOA_PATROC.asInteger;
  QryPrincipalCD_PESSOA_ENTID.asInteger := QryLkpPlanoCD_PESSOA_ENTID.asInteger;
end;

procedure TfrmCadVariaveisIntegracaoContabil.bbtnConfirmarClick(
  Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmCadVariaveisIntegracaoContabil.dsStateChange(Sender: TObject);
begin
  if TwwDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
    PageControl.ActivePageIndex := 1
  else
    PageControl.ActivePageIndex := 0;
end;

procedure TfrmCadVariaveisIntegracaoContabil.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
    QryPrincipal.Locate('CD_PESSOA_PATROC;CD_PESSOA_ENTID;CD_PLANO;CD_GRUPO_CONTABIL;' +
       'NO_VARIAVEL;CD_CONTA_CONTABIL;IR_TIPO_CONTA',
       VarArrayOf([MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[1]]), []);

  sbtnProcurar.Down := False;
end;

end.
