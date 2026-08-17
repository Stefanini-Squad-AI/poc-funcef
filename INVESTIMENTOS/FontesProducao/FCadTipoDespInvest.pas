//******************************************************************************
// Autor    : Marco Turon
// Data     : 05/07/2006
// Código   : AL_1
// Pendencia: 22726
// SOL      : 42389
// Desc     : Implementação do cadastramento de Rúbricas de Sistema (Negativas)
//            (Alterado o DFM)
//******************************************************************************
unit FCadTipoDespInvest;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, UmensErro, UDataBase,
  TB97Ctls, TB97Tlbr, Wwdotdot, Wwdbcomb, IvDictio, IvMulti, IvEMulti,
  DBCtrls, CmEventosCadastro, ImgList ;

type
  TfrmCadTipoDespInvest = class(TfrmCadastroCS)
    qryAux: TwwQuery;
    qryMoeda: TwwQuery;
    LbLDescParamEmissor: TLabel;
    wwDBEDescricao: TwwDBEdit;
    LblIdRegra: TLabel;
    DBLkMoeda: TwwDBLookupCombo;
    RgTipoCred: TRadioGroup;
    QryCredor: TwwQuery;
    DbLkcCredor: TwwDBLookupCombo;
    Label15: TLabel;
    DbCmbTipoCredor: TwwDBComboBox;
    qryIDTIPODESPINVEST: TFloatField;
    qryMOECODIGO: TFloatField;
    qryDESCTIPODESPINV: TStringField;
    qryTIPCREDOR: TStringField;
    QryCredorIDPESSOA: TFloatField;
    QryCredorRAZAOSOCIAL: TStringField;
    QrySubTipo: TwwQuery;
    DsSubTipo: TwwDataSource;
    DBRadioGroup2: TDBRadioGroup;
    qryNATUREZAOPERACAO: TStringField;
    dbeCodigo: TwwDBEdit;
    Label1: TLabel;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBLkMoedaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure RgTipoCredClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoDespInvest: TfrmCadTipoDespInvest;
  ssql : String;

implementation

uses DBaseDados, USistema, UBibliotecaInvest, FAutorizaParametros, FTelaAut;

//uses DBaseDados;

{$R *.DFM}



procedure TfrmCadTipoDespInvest.bbtnConfirmarClick(Sender: TObject);
Var
  wTipoAtu:String;
  wIdTipoDespInvest, wIdEmpresa, wIdForCli:Integer;
begin
   if Trim(wwdbeDescricao.Text) = '' then
   begin
      MsgDlg('Descrição deve ser informada. ','Erro',mtError,[mbOK],0);
      wwdbeDescricao.SetFocus;
      exit;
   end
   else
   begin
      if Trim(wwdbeDescricao.Text) = '' then
      begin
         MsgDlg('Descrição deve ser informada. ','Erro',mtError,[mbOK],0);
         wwdbeDescricao.SetFocus;
         exit;
      end
      else
      begin
         if Ds.DataSet.State In [dsInsert] Then
         begin
            //AL_1
            if Qry.FieldByName('IDTIPODESPINVEST').IsNull then
              Qry.FieldByName('IDTIPODESPINVEST').AsInteger := LeUltRegistro(nil,'TIPODESPINVEST');
         end;
      end;
   end;

   // Guarda Dados Credor
   wIdTipoDespInvest := Qry.FieldByName('IDTIPODESPINVEST').AsInteger;
   wIdEmpresa        := Sistema.IdEmpresa;
   wIdForCli         := QryCredor.FieldByName('IDPESSOA').AsInteger;

   If (Qry.State in [DsInsert]) Then
      wTipoAtu:='I'
   Else If (Qry.State in [DsEdit]) Then
      wTipoAtu:='A';

   Try
      // Heranca
      inherited;
      // Atualiza Credor
      If wTipoAtu = 'I' then
      Begin
         if (Trim(DbLkcCredor.Text) <> '') Then
            ExecutaQuery(QryAux,
                         'INSERT INTO FORCLIXDESPINVEST VALUES ('''+
                         IntToStr(wIdTipoDespInvest) +''', '''+
                         IntToStr(wIdEmpresa)+''', '''+
                         IntToStr(wIdForCli)+''')');
      End Else
      Begin
         If RgTipoCred.ItemIndex = 1 Then
         Begin
            // Pesquisa se já existe no Cadastro
            If FazQuery(QryAux,
                        'SELECT IDTIPODESPINVEST FROM FORCLIXDESPINVEST '+
                        ' WHERE (IDTIPODESPINVEST = '+Qry.FieldByName('IDTIPODESPINVEST').AsString+') AND '+
                        '       (EMPRESAPROP      = '+IntToStr(Sistema.IdEmpresa)+')') Then
            Begin
               // Caso Exista e não seja para existir, Exclui
               if Trim(DbLkcCredor.Text) = '' then
                  ExecutaQuery(QryAux,
                       'DELETE FROM FORCLIXDESPINVEST WHERE '+
                       '(IDTIPODESPINVEST   = '''+IntToStr(wIdTipoDespInvest)  +''') AND '+
                       '(EMPRESAPROP    = '''+IntToStr(wIdEmpresa)     +''') ')
               else
                  // Caso Exista e realmente deva existir, Altera
                  ExecutaQuery(QryAux,
                       'UPDATE FORCLIXDESPINVEST SET IDFORCLI = '''+IntToStr(wIdForCli)+''' WHERE '+
                       '(IDTIPODESPINVEST   = '''+IntToStr(wIdTipoDespInvest)  +''') AND '+
                       '(EMPRESAPROP    = '''+IntToStr(wIdEmpresa)     +''') ');

               // Testa se Alteração foi feita, Caso não Inclui Registro, se for para incluir
               If ((QryAux.RowsAffected = -1) Or (QryAux.RowsAffected = 0)) and
                  (Trim(DbLkcCredor.Text) <> '') Then
               Begin
                  ExecutaQuery(QryAux,
                               'INSERT INTO FORCLIXDESPINVEST VALUES ('''+
                               IntToStr(wIdTipoDespInvest) +''', '''+
                               IntToStr(wIdEmpresa)+''', '''+IntToStr(wIdForCli)+''')');
               End;
            End Else if (Trim(DbLkcCredor.Text) <> '') then
            begin
               // Caso Não Exista e Deva Existir, Inclui
               ExecutaQuery(QryAux,
                            'INSERT INTO FORCLIXDESPINVEST VALUES ('''+
                            IntToStr(wIdTipoDespInvest) +''', '''+
                            IntToStr(wIdEmpresa)+''', '''+IntToStr(wIdForCli)+''')');
            end;
         End;
      End;
   Except
      Raise;
   End;
end;

procedure TfrmCadTipoDespInvest.DBLkMoedaEnter(Sender: TObject);
begin
  inherited;
  if not qryMoeda.active then
    qryMoeda.active := true;
end;

procedure TfrmCadTipoDespInvest.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Open;
  QrySubTipo.Open;
  QryMoeda.Open;
end;

procedure TfrmCadTipoDespInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QrySubTipo.Close;
  QryMoeda.Close;
  QryCredor.Close;
end;

procedure TfrmCadTipoDespInvest.sbtnInserirClick(Sender: TObject);
begin
  RgTipoCred.ItemIndex:=0;
  inherited;
  // Busca Moeda Preferencial
  If FazQuery(QryAux,'SELECT MOECODIGO FROM PARAMINVEST') Then Begin
    Qry.FieldByName('MOECODIGO').AsInteger :=
      QryAux.FieldByName('MOECODIGO').AsInteger;
  End;
  WWdbeDescricao.SetFocus;
end;

procedure TfrmCadTipoDespInvest.RgTipoCredClick(Sender: TObject);
begin
  inherited;
  Label15.Visible:=True;
  If RgTipoCred.ItemIndex = 0 Then Begin
    Label15.Caption := 'Tipo Credor';
    DbCmbTipoCredor.Visible:=True;
    DbLkcCredor.Top :=250;
// Exclui Dados
    If Qry.State In ([DsInsert, DsEdit]) Then Begin
      ExecutarQuery(QryAux,
        'DELETE FROM FORCLIXDESPINVEST WHERE  '+
        'IDTIPODESPINVEST = '''+Qry.FieldByName('IDTIPODESPINVEST').AsString +'''AND '+
        'EMPRESAPROP      = '''+IntToStr(Sistema.IdEmpresa)+'''');
    End;
  End Else Begin
// Caso Credor por Razao Social
    QryCredor.Open;
    Label15.Caption := 'Credor';
    DbLkcCredor.Top :=118;
    DbCmbTipoCredor.Visible:=False;
    If Qry.State In ([DsInsert, DsEdit]) Then
      Qry.FieldByName('TIPCREDOR').Clear;
  End;
end;

procedure TfrmCadTipoDespInvest.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If Not sbtnInserir.Down Then
    If Qry.FieldByName('TIPCREDOR').AsString <> '' Then Begin
      RgTipoCred.ItemIndex := 0;
    End Else Begin
      RgTipoCred.ItemIndex := 1;
    End;
// Abre Query de SubTipo
  If Not Qry.IsEmpty Then Begin
    QrySubTipo.Close;
    QrySubTipo.ParamByName('IDTIPODESPINVEST').AsInteger  :=
      Qry.FieldByName('IDTIPODESPINVEST').AsInteger;
    QrySubTipo.ParamByName('EMPRESAPROP').AsInteger   :=
      Sistema.IdEmpresa;
    QrySubTipo.Open;

    DbLkcCredor.Value:=QrySubTipo.FieldByName('IDFORCLI').AsString;

  End;
end;

procedure TfrmCadTipoDespInvest.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And
    (MontaSelect.ValoresChave[0] <> '') Then	Begin
   	Qry.Locate('IDTIPODESPINVEST',MontaSelect.ValoresChave[0],[]);
  End;
end;

procedure TfrmCadTipoDespInvest.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   WWdbeDescricao.SetFocus;
end;

procedure TfrmCadTipoDespInvest.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Abre Query de SubTipo
  If Not Qry.IsEmpty Then Begin
    QrySubTipo.Close;
    QrySubTipo.ParamByName('IDTIPODESPINVEST').AsInteger  :=
      Qry.FieldByName('IDTIPODESPINVEST').AsInteger;
    QrySubTipo.ParamByName('EMPRESAPROP').AsInteger   :=
      Sistema.IdEmpresa;
    QrySubTipo.Open;

    DbLkcCredor.Value:=QrySubTipo.FieldByName('IDFORCLI').AsString;

  End;
end;

end.
