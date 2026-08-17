unit FCadValorRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, Mask, DBCtrls, StdCtrls, wwdblook,
  CmEventosCadastro, cmseldlg, wwDialog, wwidlg, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, DBGrids;

type
  TfrmCadValorRegra = class(TfrmCadastro)
    qryTipoValor: TwwQuery;
    qryRegra: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryRegraIDREGRA: TFloatField;
    qryRegraNOMEREGRA: TStringField;
    QryPrincipal: TwwQuery;
    QryPrincipalCD_TIPO_VALOR: TFloatField;
    QryPrincipalCD_PESSOA_ENTID: TFloatField;
    QryPrincipalIDREGRA: TFloatField;
    QryPrincipalNO_TABELA: TStringField;
    QryPrincipalNO_ATRIBUTO: TStringField;
    QryPrincipalIR_IMPORTA: TStringField;
    qryTipoValorCD_TIPO_VALOR: TFloatField;
    qryTipoValorDS_TIPO_VALOR: TStringField;
    MontaSelect: TMontaSelect;
    QrySimNao: TwwQuery;
    QrySimNaoCOD: TStringField;
    QrySimNaoDESCR: TStringField;
    QryPrincipalds_tipo_valor: TStringField;
    QryPrincipalds_regra: TStringField;
    QryPrincipalds_importa: TStringField;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalAfterDelete(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadValorRegra: TfrmCadValorRegra;

implementation

uses uGlobal, FTelaAut, uVersaoBase;

{$R *.DFM}

procedure TfrmCadValorRegra.FormCreate(Sender: TObject);
begin
  if uGlobal.WG_CD_VERSAO = 0 then
   begin
     MessageDlg('Selecione uma Versão da Base de Trabalho !',
        mtWarning, [mbOk], 0);
     AbrirForm(frmVersaoBase, TfrmVersaoBase, False);
     Close;
     Exit;
   end;

  inherited;
  qryTipoValor.Open;
  qryRegra.Open;
  QryPrincipal.Open;
  QrySimNao.Open;
end;

procedure TfrmCadValorRegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryPrincipal.Close;
  qryTipoValor.Close;
  qryRegra.Close;
  QrySimNao.Close;
  inherited;
end;

procedure TfrmCadValorRegra.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  QryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger := uGlobal.WG_CD_PESSOA_ENTID;

  if QryPrincipal.FieldByName('ds_regra').isNull then
   begin
     MessageDlg('O nome da Regra é obrigatório.', mtWarning, [mbOk], 0);
     Abort;
   end;

  if QryPrincipal.FieldByName('IR_IMPORTA').isNull then
    QryPrincipal.FieldByName('IR_IMPORTA').asString := 'S'; 
end;

procedure TfrmCadValorRegra.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
  DBGrid1.Refresh;

  if bbtnCancelar.Visible then
    bbtnCancelar.Click;
end;

procedure TfrmCadValorRegra.QryPrincipalAfterDelete(DataSet: TDataSet);
begin
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

procedure TfrmCadValorRegra.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_TIPO_VALOR;CD_PESSOA_ENTID',
       VarArrayOf([MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[1]]), []);

  sbtnProcurar.Down := False;
end;

procedure TfrmCadValorRegra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (QryPrincipal.State in [dsInsert, dsEdit]) then
   begin
     if DBGrid1.SelectedField.Index = 1 then
       QryPrincipal.FieldByName('IDREGRA').Clear;
   end;
end;

procedure TfrmCadValorRegra.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

end.
