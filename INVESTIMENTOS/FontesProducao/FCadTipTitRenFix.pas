//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Cadastro Tipo de Titulo de Renda Fixa 
// Form     .: FrmCadTipTitRenFix  - Unit .: FCadTipTitRenFix
// Data     .: 22/03/1999
// Autor    .: Alexandre Ramos, **--> The Analyst ...
//------------------------------------------------------------------
unit FCadTipTitRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls,
  ComCtrls, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, IvDictio, IvMulti,
  IvEMulti, CmEventosCadastro, ImgList;

type
  TFrmCadTipTitRenFix = class(TfrmCadastroCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    QryAux: TwwQuery;
    QryRegra: TwwQuery;
    QryMoeda: TwwQuery;
    DbLkcClasseTitulo: TwwDBLookupCombo;
    Label22: TLabel;
    qryCODTIPRENFIXA: TStringField;
    qryDESCTIPRENFIXA: TStringField;
    qryIDCLASSETIT: TFloatField;
    qryIDMOEDAREG: TFloatField;
    qryIDREGRACALCAGIO: TFloatField;
    qryFLGSERTITFIX: TStringField;
    qryFLGIDALTTITFIX: TStringField;
    qryFLGDTEMITITFIX: TStringField;
    qryFLGDTVENCTITFIX: TStringField;
    qryFLGINDREAJFIX: TStringField;
    qryFLGDTINIJURFIX: TStringField;
    qryFLGDTBASEINDFIX: TStringField;
    qryFLGJURFIX: TStringField;
    qryFLGCODTPTXJUR: TStringField;
    qryFLGPREMIOFIX: TStringField;
    qryCODTIPTXJUROS: TFloatField;
    qryFLGCODTPTXPRE: TStringField;
    qryFLGVLRAGIOOPER: TStringField;
    qryFLGIDLOTEFIX: TStringField;
    qryFLGDTCOMPRALOTE: TStringField;
    qryFLGQTDTITLOTE: TStringField;
    qryFLGSLDTITLOTE: TStringField;
    qryFLGVLRCOMPLOTE: TStringField;
    qryFLGINDSWAPFIX: TStringField;
    qryFLGDIASCOMPRA: TStringField;
    qryFLGDIASVENDA: TStringField;
    QryClasseTitulo: TwwQuery;
    qryFLGPU: TFloatField;
    qryDIASCOMPRA: TFloatField;
    qryDIASVENDA: TFloatField;
    qryFLLGPRORATA: TStringField;
    qryFLGINTERPOLA: TStringField;
    QryTipoJuros: TwwQuery;
    QryTipoJurosCODTIPTXJUROS: TFloatField;
    QryTipoJurosDESCTIPJUROS: TStringField;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryFLGPERCINDEX: TStringField;
    qryFLGINSTFIN: TStringField;
    qryFLGCARENCIA: TStringField;
    qryFLGPERIODICIDADE: TStringField;
    qryFLGANIVERSARIO: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryPERCINDEX: TFloatField;
    qryIDTRATAIND: TFloatField;
    qryNUMCASASDEC: TFloatField;
    qryFLGINDICE2: TStringField;
    QryTrataIndice: TwwQuery;
    qryFLGDTINITR: TStringField;
    qryFLGPROVISIONAIR: TStringField;
    qryFLGAPURAIR: TStringField;
    qryParamInvest: TwwQuery;
    qryFLGPREPOS: TFloatField;
    DBRadioGroup1: TDBRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DbCbDadosOper2Change(Sender: TObject);
    procedure DbCbDadosTit9Change(Sender: TObject);
    procedure DbCbDadosTit6Change(Sender: TObject);
    procedure DbCbDadosTit11Change(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure DbChBxPUClick(Sender: TObject);
    procedure DbCbProRataChange(Sender: TObject);
    procedure dbckApuraIRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FrmCadTipTitRenFix: TFrmCadTipTitRenFix;

implementation

Uses UBibliotecaInvest, UMensErro, UDataBase, dBaseDados;

{$R *.DFM}

procedure TFrmCadTipTitRenFix.bbtnConfirmarClick(Sender: TObject);
begin
// Testa Parametros
  If Trim(DbEdit1.Text) = '' Then Begin
    MsgDlg('Descrição deve ser informada. ','Erro', mtError, [mbOK], 0);
    DbEdit1.SetFocus;
    Exit;
  End Else If Trim(DbEdit2.Text) = '' Then Begin
    MsgDlg('Código deve ser informado. ','Erro', mtError, [mbOK], 0);
    DbEdit2.SetFocus;
    Exit;
  End Else If Qry.FieldByName('FLGPU').AsInteger = -1 Then Begin
    MsgDlg('Tipo de Indexação deve ser informada. ','Erro', mtError, [mbOK], 0);
    Exit;
  End;

// Caso Inserindo Testa se código ja Existe no Pai (TIPOTITULO) ...
  If sbtnInserir.Down = True Then Begin
    If Not FazQuery(QryAux,'SELECT CODTIPTITULO FROM '+
             'TIPOTITULO WHERE CODTIPTITULO =  '+
             ''''+DbEdit2.Text+'''') Then Begin ;
// Insere no Pai (TIPOTITULO) ...
      ExecutaQuery(QryAux,
        'INSERT INTO TIPOTITULO (IDTIPOINVEST,CODTIPTITULO) '+
        'VALUES (1,'''+DbEdit2.Text+''')');
    End Else Begin
      MsgDlg('Código já existe.','Erro', mtError, [mbOK], 0);
      DbEdit2.SetFocus;
      Exit;
    End;
  End;
// Heranca
  inherited;
// Habilita Codigo
  DbEdit2.Enabled := True;
  DbEdit2.Color   := ClWhite;
// Acerta TabSheet
//  PageControl1.ActivePage := TabSheet1;
{  If Qry.FieldByName('FLGAPURAIR').AsString <> 'S' Then
  Begin
     dbckProvisionaIR.Visible := False;
     dbckApuraIR.Checked      := False;
     dbckProvisionaIR.Checked := False;
  End
  Else
  Begin
     dbckProvisionaIR.Visible := True;
     If Qry.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     Begin
        If Qry.FieldByName('FLGAPURAIR').AsString = 'S' Then
           dbckProvisionaIR.Visible := True
        Else
           dbckProvisionaIR.Visible := False;
        dbckProvisionaIR.Checked := False;
     End;
  End;}
end;

//------------------------------------------------------
// Mostra Formulario
procedure TFrmCadTipTitRenFix.FormShow(Sender: TObject);
begin
  inherited;
// Abre Tabelas
  Qry.Open;
  QryRegra.Open;
  QryMoeda.Open;
  QryClasseTitulo.Open;
  QryTipoJuros.Open;
  QryCustodiante.Open;
  QryTrataIndice.Open;
// Acerta TabSheet
//  PageControl1.ActivePage := TabSheet1;
end;

//------------------------------------------------------
// Fecha Formulario
procedure TFrmCadTipTitRenFix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
// Fecha Tabelas
  Qry.Close;
  QryRegra.Close;
  QryMoeda.Close;
  QryClasseTitulo.Close;
  QryTipoJuros.Close;
  QryCustodiante.Close;
  QryTrataIndice.Close;
end;

//---------------------------------------------------------------
// Botao Procurar
procedure TFrmCadTipTitRenFix.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
// Busca Registro
  If (MontaSelect.ValoresChave.Count > 0) And
    (MontaSelect.ValoresChave[0] <> '') Then Begin
    Qry.Locate('CODTIPRENFIXA', MontaSelect.ValoresChave[0],[]);
  End;

{  If Qry.FieldByName('FLGPU').AsInteger  = 1 Then Begin
      PnlSemPU.Visible := False;
      PnlComPU.Visible := True;
  End Else Begin
      PnlSemPU.Visible := True;
      PnlComPU.Visible := False;
  End;
  If Qry.FieldByName('FLGAPURAIR').AsString <> 'S' Then
  Begin
     dbckProvisionaIR.Visible := False;
     dbckApuraIR.Checked      := False;
     dbckProvisionaIR.Checked := False;
  End
  Else
  Begin
     dbckProvisionaIR.Visible := True;
     If Qry.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     Begin
        If Qry.FieldByName('FLGAPURAIR').AsString = 'S' Then
           dbckProvisionaIR.Visible := True
        Else
           dbckProvisionaIR.Visible := False;
        dbckProvisionaIR.Checked := False;
     End;
  End;}
end;

//--------------------------------------------------------------
// Botao Alterar
procedure TFrmCadTipTitRenFix.sbtnAlterarClick(Sender: TObject);
begin
// Inabilita Codigo
  DbEdit2.Enabled := False;
  DbEdit2.Color   := clBtnFace;
// Herança
  inherited;
{  If Qry.FieldByName('FLGAPURAIR').AsString <> 'S' Then
  Begin
     dbckProvisionaIR.Visible := False;
     dbckApuraIR.Checked      := False;
     dbckProvisionaIR.Checked := False;
  End
  Else
  Begin
     dbckProvisionaIR.Visible := True;
     If Qry.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     Begin
        If Qry.FieldByName('FLGAPURAIR').AsString = 'S' Then
           dbckProvisionaIR.Visible := True
        Else
           dbckProvisionaIR.Visible := False;
        dbckProvisionaIR.Checked := False;
     End;
  End;}
end;


procedure TFrmCadTipTitRenFix.bbtnCancelarClick(Sender: TObject);
begin
// Heranca
  inherited;
// Habilita Codigo
  DbEdit2.Enabled := True;
  DbEdit2.Color   := ClWhite;
{  If Qry.FieldByName('FLGAPURAIR').AsString <> 'S' Then
  Begin
     dbckProvisionaIR.Visible := False;
     dbckApuraIR.Checked      := False;
     dbckProvisionaIR.Checked := False;
  End
  Else
  Begin
     dbckProvisionaIR.Visible := True;
     If Qry.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     Begin
        If Qry.FieldByName('FLGAPURAIR').AsString = 'S' Then
           dbckProvisionaIR.Visible := True
        Else
           dbckProvisionaIR.Visible := False;
        dbckProvisionaIR.Checked := False;
     End;
  End;}
end;

procedure TFrmCadTipTitRenFix.DbCbDadosOper2Change(Sender: TObject);
begin
  inherited;
{
  If (DbCbDadosOper2.Text = 'Invisível') Then Begin
    DbLckDadosOper3.Enabled := False;
    If (DbCbDadosOper2.Text = 'Invisível') And (Qry.State In ([DsInsert, DsEdit]))Then Begin
      Qry.FieldByName('IDREGRACALCAGIO').AsString := '';
    End;
  End Else Begin
    DbLckDadosOper3.Enabled := True;
  End;
}
end;

procedure TFrmCadTipTitRenFix.DbCbDadosTit9Change(Sender: TObject);
begin
  inherited;
{  If Qry.State In [DsEdit, DsInsert] Then Begin
    Qry.FieldByName('FLGCODTPTXJUR').AsString := Copy(DbCbDadosTit9.Text,1,1);
    Qry.FieldByName('FLGDTINIJURFIX').AsString := Copy(DbCbDadosTit9.Text,1,1);
  end;}
end;

procedure TFrmCadTipTitRenFix.DbCbDadosTit6Change(Sender: TObject);
begin
  inherited;
{  If Qry.State In [DsEdit, DsInsert] Then Begin
    Qry.FieldByName('FLGDTBASEINDFIX').AsString := Copy(DbCbDadosTit6.Text,1,1) ;
    Qry.FieldByName('FLGPERCINDEX').AsString := Copy(DbCbDadosTit6.Text,1,1) ;
  end;}
end;

procedure TFrmCadTipTitRenFix.DbCbDadosTit11Change(Sender: TObject);
begin
  inherited;
{  If Qry.State In [DsEdit, DsInsert] Then Begin
    Qry.FieldByName('FLGCODTPTXPRE').AsString := Copy(DbCbDadosTit11.Text,1,1) ;
  end;}
end;

procedure TFrmCadTipTitRenFix.sbtnInserirClick(Sender: TObject);
begin
  inherited;
// Preenche com Moeda Preferencial
  If FazQuery(QryAux,'SELECT MOECODIGO FROM PARAMINVEST') Then Begin
    Qry.FieldByName('IDMOEDAREG').AsInteger :=
      QryAux.FieldByName('MOECODIGO').AsInteger;
      // Para o check box não ficar cinza
    Qry.FieldByName('FLGPU').AsInteger :=0;
    Qry.FieldByName('FLGINSTFIN').AsString       := 'N';
//    Qry.FieldByName('FLGCARENCIA').AsString      := 'N';
//    Qry.FieldByName('FLGPERIODICIDADE').AsString := 'N';
//    Qry.FieldByName('FLGANIVERSARIO').AsString   := 'N';
//    DbChBxPU.Checked := False;
  End;
  qryParamInvest.Close;
  qryParamInvest.Open;
{  If qryParamInvest.FieldByName('FLGPROVISIONAIRRF').AsString = 'S' Then
  Begin
     dbckProvisionaIR.Visible := True;
     dbckApuraIR.Checked      := True;
     DBCKProvisionaIR.Checked := True;
  End
  Else
  Begin
     dbckProvisionaIR.Visible := False;
     dbckApuraIR.Checked      := False;
     dbckProvisionaIR.Checked := False;
  End;}
end;

procedure TFrmCadTipTitRenFix.sbtnApagarClick(Sender: TObject);
begin
// Heranca
// Inherited
// Pede Confirmacao
  If (MsgDlg('Deseja realmente excluir este registro ?',
    'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then Begin
    Try
// Inicia Transação
    DtmBaseDados.dbBaseDados.StartTransaction;

// (TITRENFIXA)
     ExecutaQuery(QryAux,'DELETE FROM CM.TITRENFIXA WHERE '+
                          'CODTIPRENFIXA = '''+DBEdit2.Text+'''');


// (TIPOTITRENFIXA)
      ExecutaQuery(QryAux,'DELETE FROM CM.TIPOTITRENFIXA WHERE '+
                          'CODTIPRENFIXA = '''+DBEdit2.Text+'''');

// (TIPOTITULO)
      ExecutaQuery(QryAux,'DELETE FROM CM.TIPOTITULO WHERE IDTIPOINVEST = 1 AND '+
                          'CODTIPTITULO = '''+DBEdit2.Text+'''');
// Comitta Transação
      DtmBaseDados.dbBaseDados.Commit;
    Except
      Raise;
// Rollbacka Transação
      DtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Registro não Excluido ...',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
    End;
// Fecha e Abre as Querys
    Qry.Close;
    Qry.Open;
  End;
  SbtnApagar.Down := False;
end;

procedure TFrmCadTipTitRenFix.DbChBxPUClick(Sender: TObject);
begin
  inherited;
// Caso Seja Indexado pelo PU Troca valores dos Camps
//  If DbChBxPU.Checked Then Begin
{    If Qry.State In [DsEdit, DsInsert] Then Begin
//      PnlSemPU.Visible:=False;
//      PnlComPU.Visible:=True;
      Qry.FieldByName('FLGDTBASEINDFIX').AsString := 'I' ;
      Qry.FieldByName('FLGDTBASEINDFIX').AsString := 'I' ;
      Qry.FieldByName('FLGJURFIX').AsString       := 'I' ;
      Qry.FieldByName('FLGCODTPTXJUR').AsString   := 'I' ;
      Qry.FieldByName('FLGDTINIJURFIX').AsString  := 'I' ;
      Qry.FieldByName('FLGPREMIOFIX').AsString    := 'I' ;
      Qry.FieldByName('FLGCODTPTXPRE').AsString   := 'I' ;
      Qry.FieldByName('FLLGPRORATA').AsString     := 'N' ;
    End;
  End Else Begin
    PnlComPU.Visible:=False;
    PnlSemPU.Visible:=True;
  End;}
end;

procedure TFrmCadTipTitRenFix.DbCbProRataChange(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit, DsInsert] Then Begin
//    If Qry.FieldByName('FLLGPRORATA').AsString = 'N' Then Begin
{    If DbCbProRata.ItemIndex = 0 Then Begin
      Label4.Visible          :=False;
      DbCbFormaProRata.Visible:=False;
    End Else Begin
      Label4.Visible          :=True;
      DbCbFormaProRata.Visible:=True;
    End;}
  End;
end;

procedure TFrmCadTipTitRenFix.dbckApuraIRClick(Sender: TObject);
begin
  inherited;
{  If dbckApuraIR.Checked Then
  Begin
     dbckProvisionaIR.Visible := True;
     dbckProvisionaIR.Checked := False;
  End
  Else
  Begin
     dbckProvisionaIR.Visible := False;
     dbckProvisionaIR.Checked := False;
  End;}
end;

end.

// By Alexande Ramos - Serious Developer.



