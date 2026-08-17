unit FCadTabelasCCMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, ExtCtrls, StdCtrls, wwdblook, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,uCtrlTabelaDeParaCC,
  uCtrlCampoDeParaCC,uCMSqlParams,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmCadTabelasCCMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label2: TLabel;
    cboPlano: TComboBox;
    cboConta: TComboBox;
    Label5: TLabel;
    cdsDet: TCMClientDataSet;
    cdsColunas: TCMClientDataSet;
    cdsTabelaCM: TCMClientDataSet;
    cboTabela: TwwDBLookupCombo;
    cdsColunasDet: TCMClientDataSet;
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
  private
      iIndice: longint;

      CtrlTabelaDePara :TCtrlTabelaDeParaCC;
      CtrlCampoDePara  :TCtrlCampoDeParaCC;
  public
    { Public declarations }
  end;

var
  frmCadTabelasCCbMT: TfrmCadTabelasCCMT;
  _sqlColunas  :TCMSqlParams;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema,  uModulo;

{$R *.DFM}



procedure TfrmCadTabelasCCMT.FormCreate(Sender: TObject);
begin
  inherited;

  // *** Instancia a classe principal ***
  CtrlTabelaDePara := TCtrlTabelaDeParaCC.Create;
  CtrlTabelaDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlTabelaDePara.cdsMestre := Cds;
  Cds.Data := CtrlTabelaDePara.ListTabelaDePara(-1,ttpCodigo);

  cdsTabelaCM.Data     := CtrlTabelaDePara.ListTabelaCM;

  // *** Instancia a classe campoDePara ***
  CtrlCampoDePara := TCtrlCampoDeParaCC.Create;
  CtrlCampoDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlTabelaDePara.cdsDetalhe := CdsDet;
  CdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);

end;



procedure TfrmCadTabelasCCMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  cboPlano.Clear;
  cboConta.Clear;
  Cds.Data := CtrlTabelaDePara.ListTabelaDePara(-1,ttpCodigo);
  cdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);
end;



procedure TfrmCadTabelasCCMT.cboTabelaClick(Sender: TObject);
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
         cdsColunas.GetFieldNames(cboPlano.Items);
      end;
  end;

end;



procedure TfrmCadTabelasCCMT.FormShow(Sender: TObject);
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



procedure TfrmCadTabelasCCMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
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
         MsgDlg('Nome do Campo não preenchido.','Aviso',mtWarning,[mbOk],0);
         cboConta.SetFocus;
         Accept := False;
         Exit;
      end;

      Cds.FieldByName('NOMECAMPO').asString  := cboPlano.text;
      Cds.FieldByName('NOMETABELA').asString := cboTabela.text;

  End;

end;



procedure TfrmCadTabelasCCMT.CmeDetalheConfirma(Sender: TObject);
begin
  If CdsDet.State in [dsInsert, dsEdit] Then
  Begin
     cdsDet.FieldByName('NOMECAMPO').asString := cboConta.text;
  End;
  inherited;

end;



procedure TfrmCadTabelasCCMT.CmeDetalheEdit(Sender: TObject);
begin
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

   cboConta.text := cdsDet.FieldByName('NOMECAMPO').asString;
   cboConta.SetFocus;

end;



procedure TfrmCadTabelasCCMT.CmeDetalheInsert(Sender: TObject);
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



procedure TfrmCadTabelasCCMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlTabelaDePara.free;
  CtrlCampoDePara.free;

  _sqlColunas.free;

end;



procedure TfrmCadTabelasCCMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsDet.First;
   while Not CdsDet.Eof do
      CdsDet.Delete;

  inherited;
  cboPlano.Clear;
  cboConta.Clear;
  CdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);
end;



procedure TfrmCadTabelasCCMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin

     iIndice := StrToInt(MontaSelect.ValoresChave[0]);
     Cds.Data := CtrlTabelaDePara.ListTabelaDePara(iIndice,ttpCodigo);

      cboTabela.text := cds.FieldByName('NOMETABELA').asString;
      cboTabelaClick(self);

      cboPlano.text  := cds.FieldByName('NOMECAMPO').asString;
      CdsDet.Data := CtrlCampoDePara.ListCampoDePara(iIndice);
   end;

end;



procedure TfrmCadTabelasCCMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlTabelaDePara.MessageInfo <> '' Then
     MsgDlg(CtrlTabelaDePara.MessageInfo,'Erro',mtError,[mbOK],0);

end;



procedure TfrmCadTabelasCCMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Cds.Data    := CtrlTabelaDePara.ListTabelaDePara(Cds.FieldByName('IDTABELADEPARACC').asFloat,ttpCodigo);
  CdsDet.Data := CtrlCampoDePara.ListCampoDePara(Cds.FieldByName('IDTABELADEPARACC').asFloat);
end;



procedure TfrmCadTabelasCCMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=  CtrlTabelaDePara.Apagar;
  Cds.EnableControls;

end;



procedure TfrmCadTabelasCCMT.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Data := CtrlTabelaDePara.ListTabelaDePara(-1,ttpCodigo);
  cdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);
  inherited;
  cboPlano.Clear;
  cboConta.Clear;
  cboTabela.Clear;
  cboTabela.SetFocus;

end;



procedure TfrmCadTabelasCCMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlTabelaDePara.Gravar;
  Cds.EnableControls;

end;



procedure TfrmCadTabelasCCMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlTabelaDePara.Gravar;
  Cds.EnableControls;
end;



end.
