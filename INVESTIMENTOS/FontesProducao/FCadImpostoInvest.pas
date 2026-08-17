unit FCadImpostoInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, UmensErro, UDataBase,
  TB97Ctls, TB97Tlbr, Wwdotdot, Wwdbcomb, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList ;

type
  TfrmCadImpostoInvest = class(TfrmCadastroCS)
    qryAux: TwwQuery;
    qryMoeda: TwwQuery;
    LbLDescParamEmissor: TLabel;
    wwDBEDescricao: TwwDBEdit;
    LblIdRegra: TLabel;
    DBLkMoeda: TwwDBLookupCombo;
    Label15: TLabel;
    DbCmbTipoCredor: TwwDBComboBox;
    DbLkcCredor: TwwDBLookupCombo;
    QryCredor: TwwQuery;
    RgTipoCred: TRadioGroup;
    QryCredorIDPESSOA: TFloatField;
    QryCredorRAZAOSOCIAL: TStringField;
    QryCredorFLGFORNSERV: TFloatField;
    Procedure CmeCadastroConfirma(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure RgTipoCredClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadImpostoInvest: TfrmCadImpostoInvest;
  ssql : String;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmCadImpostoInvest.CmeCadastroConfirma(Sender: TObject);
begin
   dtmBaseDados.DbBaseDados.ApplyUpdates([qry]);
end;

procedure TfrmCadImpostoInvest.bbtnConfirmarClick(Sender: TObject);
begin
 if Trim(wwdbeDescricao.Text) = '' then
  begin
   MsgDlg('Descrição deve ser informada. ','Erro',mtError,[mbOK],0);
   wwdbeDescricao.SetFocus;
   exit;
 end;
 if Trim(DBLkMoeda.Text) = '' then
  begin
   MsgDlg('Moeda deve ser informada. ','Erro',mtError,[mbOK],0);
    DBLkMoeda.SetFocus;
   exit;
 end;

 if ds.DataSet.State in [dsInsert] then
  if qry.FieldByName('IDIMPOSTOINVEST').AsInteger <=0 then
   qry.FieldByName('IDIMPOSTOINVEST').AsInteger := LeUltRegistro(nil,'PARAMEMISSOR');
 inherited;
end;

procedure TfrmCadImpostoInvest.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Open;
  QryCredor.Open;
  QryMoeda.Open;
End;

procedure TfrmCadImpostoInvest.sbtnInserirClick(Sender: TObject);
begin
  inherited;
// Busca Moeda Preferencial
  If FazQuery(QryAux,'SELECT MOECODIGO FROM PARAMINVEST') Then Begin
    Qry.FieldByName('MOECODIGO').AsInteger :=
      QryAux.FieldByName('MOECODIGO').AsInteger;
  End;
end;

procedure TfrmCadImpostoInvest.RgTipoCredClick(Sender: TObject);
begin
  inherited;
  Label15.Visible:=True;
  If RgTipoCred.ItemIndex = 0 Then Begin
    Label15.Caption := 'Tipo Credor';
    DbCmbTipoCredor.Visible:=True;
    DbLkcCredor.Top :=200;
    If Qry.State In ([DsInsert, DsEdit]) Then
      Qry.FieldByName('CREDOR').Clear;
  End Else Begin
    Label15.Caption := 'Credor';
    DbLkcCredor.Top :=118;
    DbCmbTipoCredor.Visible:=False;
    If Qry.State In ([DsInsert, DsEdit]) Then
      Qry.FieldByName('TIPCREDOR').Clear;
  End;
end;

procedure TfrmCadImpostoInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QryMoeda.Close;
  QryCredor.Close;
end;

procedure TfrmCadImpostoInvest.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If Qry.FieldByName('TIPCREDOR').AsString <> '' Then Begin
    RgTipoCred.ItemIndex := 0;
  End Else Begin
    RgTipoCred.ItemIndex := 1;
  End;
end;

procedure TfrmCadImpostoInvest.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
    Qry.Locate('IDIMPOSTOINVEST',MontaSelect.ValoresChave[0],[]);
end;

procedure TfrmCadImpostoInvest.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  QryAfterScroll(Qry);
end;

end.
