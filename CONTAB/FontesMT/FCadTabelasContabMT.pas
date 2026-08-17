unit FCadTabelasContabMT;

{===============================================================================
Analista.....: Ricardo Alves
SOL..........: 124343
KINTANA......: 630539
Data.........: 06/10/2009
Descrição....: Modificação do processamento do De/Para de plano de contas para que o 
  processamento das tabelas de configuração levem em consideração os três novos
  campos de indicação de período do cadastro de De/Para.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, ExtCtrls, StdCtrls, wwdblook, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,uCtrlTabelaDePara,
  uCtrlCampoDePara,uCMSqlParams, uCMTypes, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmCadTabelasContabMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label2: TLabel;
    cboPlano: TComboBox;
    dblkTabelaRef: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    cboConta: TComboBox;
    Label5: TLabel;
    cdsDet: TCMClientDataSet;
    cdsTabelaRef: TCMClientDataSet;
    cdsColunas: TCMClientDataSet;
    cdsTabelaContab: TCMClientDataSet;
    cboTabela: TwwDBLookupCombo;
    cdsColunasDet: TCMClientDataSet;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    cbbExercicio: TComboBox;
    cbbPeriodo: TComboBox;
    cbbDataAtualizacao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure cboTabelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure cbbDataAtualizacaoChange(Sender: TObject);
    procedure cbbPeriodoChange(Sender: TObject);
  private
      iIndice: longint;

      CtrlTabelaDePara :TCtrlTabelaDePara;
      CtrlCampoDePara  :TCtrlCampoDePara;

  public
    { Public declarations }
  end;

var
  frmCadTabelasContabMT: TfrmCadTabelasContabMT;
  _sqlColunas  :TCMSqlParams;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema,  uModulo;

{$R *.DFM}

procedure TfrmCadTabelasContabMT.FormCreate(Sender: TObject);
begin
  inherited;

  // *** Instancia a classe principal ***
  CtrlTabelaDePara := TCtrlTabelaDePara.Create;
  CtrlTabelaDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlTabelaDePara.cdsMestre := Cds;
  Cds.Data := CtrlTabelaDePara.ListTabelaDePara(-1,ttpCodigo);

  cdsTabelaRef.Data    := CtrlTabelaDePara.ListTabelaDePara(0,ttpNome);
  cdsTabelaContab.Data := CtrlTabelaDePara.ListTabelaContab;

  // *** Instancia a classe campoDePara ***
  CtrlCampoDePara := TCtrlCampoDePara.Create;
  CtrlCampoDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlTabelaDePara.cdsDetalhe := CdsDet;
  CdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);
end;

procedure TfrmCadTabelasContabMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  cboPlano.Clear;
  cboConta.Clear;

  // Ricardo A. SOL 124343 KTN 630539
  cbbExercicio.Clear;
  cbbPeriodo.Clear;
  cbbDataAtualizacao.Clear;

  Cds.Data := CtrlTabelaDePara.ListTabelaDePara(-1,ttpCodigo);
  cdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);

end;

procedure TfrmCadTabelasContabMT.cboTabelaClick(Sender: TObject);
begin
  inherited;

  if cboTabela.text <> '' then
  begin
      _sqlColunas.SQL.Clear;
      _sqlColunas.SQL.Add('SELECT * FROM ' + cboTabela.Text + ' WHERE 1=2');

      cdsColunas.Data := _sqlColunas.Data;

      if cboPlano.text = '' then
      begin
         cboPlano.Clear;
         cdsColunas.GetFieldNames( cboPlano.Items );
      end;

      // Ricardo A. SOL 124343 KTN 630539
      if cbbExercicio.text = '' then
      begin
         cbbExercicio.Clear;
         cdsColunas.GetFieldNames( cbbExercicio.Items );
      end;
      if cbbPeriodo.text = '' then
      begin
         cbbPeriodo.Clear;
         cdsColunas.GetFieldNames( cbbPeriodo.Items );
      end;
      if cbbDataAtualizacao.text = '' then
      begin
         cbbDataAtualizacao.Clear;
         cdsColunas.GetFieldNames( cbbDataAtualizacao.Items );
      end;
  end;

end;

procedure TfrmCadTabelasContabMT.FormShow(Sender: TObject);
begin
  inherited;
   //Deixa o detalhe na 1a. orelha por default
   tbcDetalhe.TabIndex        := 0;
   pgctrlDetalhe.ActivePage   := tbsDet;

   sbtnAlterar.enabled := false;
   sbtnApagar.enabled  := false;

   Repaint;
   Screen.Cursor := crHourGlass;

   cboTabela.Clear;


   _sqlColunas := TCMSqlParams.Create(nil);

   Screen.Cursor := crDefault;

end;

procedure TfrmCadTabelasContabMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;


  If Cds.State in [dsInsert, dsEdit] Then
  Begin
      //Faz a verificação do preenchimento dos campos
      if (cboTabela.Text = '') then begin
         MsgDlg('Nome da Tabela não preenchido.','Aviso',mtWarning,[mbOk],0);
         cboTabela.SetFocus;
         Accept := False;
         exit;
      end;

      if (cboConta.text = '') then begin
         MsgDlg('Nome do Campo da Conta Contábil não preenchido.','Aviso',mtWarning,[mbOk],0);
         cboConta.SetFocus;
         Accept := False;
         Exit;
      end;

      // Ricardo A. SOL 124343 KTN 630539
      if (( cbbExercicio.Text <> '' ) and ( cbbPeriodo.Text = '' )) or
        (( cbbExercicio.Text = '' ) and ( cbbPeriodo.Text <> '' )) then
      begin
        MsgDlg( 'Os campos Exercício e A Partir do Período devem ser preenchidos em conjunto.',
          'Aviso', mtWarning,[mbOk], 0 );
        cbbExercicio.SetFocus;
        Accept := False;
        Exit;
      end;

      Cds.FieldByName('NOMECAMPOPLANO').asString := cboPlano.text;
      Cds.FieldByName('NOMETABELA').asString     := cboTabela.text;

      // Ricardo A. SOL 124343 KTN 630539
      Cds.FieldByName('DATADEPARA').asString     := cbbDataAtualizacao.text;
      Cds.FieldByName('ANODEPARA').asString      := cbbExercicio.text;
      Cds.FieldByName('MESDEPARA').asString      := cbbPeriodo.text;
  End;

end;

procedure TfrmCadTabelasContabMT.CmeDetalheConfirma(Sender: TObject);
begin
  If CdsDet.State in [dsInsert, dsEdit] Then
  Begin
     cdsDet.FieldByName('NOMECAMPOCONTA').asString := cboConta.text;
  End;
  inherited;

end;

procedure TfrmCadTabelasContabMT.CmeDetalheEdit(Sender: TObject);
begin
  if sender = sbtnAltDet then
    inherited;

  if cboTabela.text <> '' then
  begin
      _sqlColunas.SQL.Clear;
      _sqlColunas.SQL.Add('SELECT * FROM ' + cboTabela.Text + ' WHERE 1=2');

      cdsColunasDet.Data := _sqlColunas.Data;

      if cboConta.text = '' then
      begin
         cboConta.Clear;
         cdsColunasDet.GetFieldNames(cboConta.Items);
      end;
  end;

   // Ricardo A. SOL 124343 KTN 630539
   //cboConta.text := cdsDet.FieldByName('NOMECAMPOCONTA').asString;
   cboConta.ItemIndex := cboConta.Items.IndexOf( cdsDet.FieldByName('NOMECAMPOCONTA').asString );
   cboConta.SetFocus;

end;

procedure TfrmCadTabelasContabMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
   if cboTabela.text <> '' then
   begin
      with _sqlColunas do
      begin
         SQL.Clear;
         SQL.Add('SELECT * FROM ' + cboTabela.Text + ' WHERE 1=2');
         cdsColunasDet.Data := Data;

         if cboConta.text = '' then
         begin
            cboConta.Clear;
            cdsColunasDet.GetFieldNames(cboConta.Items);
         end;
      end;
   end;

   cboConta.SetFocus;

end;

procedure TfrmCadTabelasContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlTabelaDePara.free;
  CtrlCampoDePara.free;

  _sqlColunas.free;

end;

procedure TfrmCadTabelasContabMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsDet.First;
   while Not CdsDet.Eof do
      CdsDet.Delete;

  inherited;
  cboPlano.Clear;
  cboConta.Clear;

  // Ricardo A. SOL 124343 KTN 630539
  cbbExercicio.Clear;
  cbbDataAtualizacao.Clear;
  cbbPeriodo.Clear;

  CdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);
  end;

procedure TfrmCadTabelasContabMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin

     iIndice := StrToInt(MontaSelect.ValoresChave[0]);
     Cds.Data := CtrlTabelaDePara.ListTabelaDePara(iIndice,ttpCodigo);

      cboTabela.text := cds.FieldByName('NOMETABELA').asString;
      cboTabelaClick(self);

      cboPlano.text  := cds.FieldByName('NOMECAMPOPLANO').asString;

      // Ricardo A. SOL 124343 KTN 630539
      cbbDataAtualizacao.Text := cds.FieldByName( 'DATADEPARA' ).asString;
      cbbExercicio.Text := cds.FieldByName( 'ANODEPARA' ).asString;
      cbbPeriodo.Text := cds.FieldByName( 'MESDEPARA' ).asString;

      CdsDet.Data := CtrlCampoDePara.ListCampoDePara(iIndice);
   end;

end;

procedure TfrmCadTabelasContabMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlTabelaDePara.MessageInfo <> '' Then
     MsgDlg(CtrlTabelaDePara.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadTabelasContabMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  //inherited;
  Cds.Data := CtrlTabelaDePara.ListTabelaDePara(Cds.FieldByName('IDTABELADEPARA').asFloat,ttpCodigo);
  CdsDet.Data := CtrlCampoDePara.ListCampoDePara(Cds.FieldByName('IDTABELADEPARA').asFloat);


end;

procedure TfrmCadTabelasContabMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=   CtrlTabelaDePara.Apagar;
  Cds.EnableControls;

end;

procedure TfrmCadTabelasContabMT.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Data := CtrlTabelaDePara.ListTabelaDePara(-1,ttpCodigo);
  cdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);
  inherited;
  cboPlano.Clear;
  cboConta.Clear;

  // Ricardo A. SOL 124343 KTN 630539
  cbbDataAtualizacao.Clear;
  cbbExercicio.Clear;
  cbbPeriodo.Clear;

  cboTabela.Clear;
  cboTabela.SetFocus;

end;

procedure TfrmCadTabelasContabMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlTabelaDePara.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadTabelasContabMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlTabelaDePara.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadTabelasContabMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  CmeDetalheEdit( sbtnAlterar );
end;

procedure TfrmCadTabelasContabMT.cbbDataAtualizacaoChange(Sender: TObject);
begin
  // Ricardo A. SOL 124343 KTN 630539
  if ( Cds.State in [ dsEdit, dsInsert ] ) then
  begin
    cbbExercicio.Text := '';
    cbbPeriodo.Text := '';
  end;
end;

procedure TfrmCadTabelasContabMT.cbbPeriodoChange(Sender: TObject);
begin
   // Ricardo A. SOL 124343 KTN 630539
  if ( Cds.State in [ dsEdit, dsInsert ] ) then
    cbbDataAtualizacao.Text := '';

end;

end.
