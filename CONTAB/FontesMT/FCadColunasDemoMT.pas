unit FCadColunasDemoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, Mask, DBCtrls, StdCtrls, TREdit, wwdblook,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls,uCtrlDemonstrativo,uCtrlElemDemonstrativo,uCtrlDemLinha,uCtrlDemColuna,
  uCMTypes;


type
  TfrmCadColunasDemoMT = class(TFrmCadastroMestreDetMT)
    Label4: TLabel;
    dblkDemo: TwwDBLookupCombo;
    dbrColuna: TDBRealEdit;
    Label9: TLabel;
    dbeDescColuna: TDBEdit;
    lblFormaRecPag: TLabel;
    Label1: TLabel;
    dblkElemDet: TwwDBLookupCombo;
    Label2: TLabel;
    dblkLinha: TwwDBLookupCombo;
    CdsDemonstrativo: TCMClientDataSet;
    CdsElemento: TCMClientDataSet;
    CdsLinha: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblkDemoExit(Sender: TObject);
    procedure dblkDemoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    iNumero, iSalvaDemo: Double;
    CtrlDemonstrativo : TCtrlDemonstrativo;
    CtrlElemDemonstrativo : TCtrlElemDemonstrativo;
    CtrlDemLinha : TCtrlDemLinha;
    CtrlDemColuna : TCtrlDemColuna;
    procedure FazCloseUp;

  public
    { Public declarations }
  end;

var
  frmCadColunasDemoMT: TfrmCadColunasDemoMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uFuncaoGeral;

{$R *.DFM}

procedure  TfrmCadColunasDemoMT.FazCloseUp;
begin
   If dblkDemo.text <> '' Then
     iSalvaDemo:=StrToInt(dblkDemo.LookUpValue);

   CdsElemento.Data := CtrlElemDemonstrativo.ListElemDemonstrativo(iSalvaDemo,0,0,0);

   CdsLinha.Data :=  CtrlDemLinha.ListLinha(iSalvaDemo);

   If Cds.State = dsInsert Then
   Begin
      CtrlDemColuna.RetornaProximaColuna(iSalvaDemo);
      Cds.FieldByName('NUMCOLUNA').asInteger := CtrlDemColuna.ProximaColuna + 1;
      iNumero := CtrlDemColuna.ProximaColuna + 1;
   End;

end;

procedure TfrmCadColunasDemoMT.FormCreate(Sender: TObject);
begin
  inherited;

  // *** Instancia a classe principal ***
  CtrlDemColuna := TCtrlDemColuna.Create;
  CtrlDemColuna.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlDemColuna.cdsMestre := Cds;
  Cds.Data := CtrlDemColuna.ListDemColunas(-1,0);

  // *** Instancia a classe demonstrativo ***
  CtrlDemonstrativo := TCtrlDemonstrativo.Create;
  CtrlDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsDemonstrativo.Data := CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,0,True);

  // *** Instancia a classe elementos do demonstrativo ***
  CtrlElemDemonstrativo := TCtrlElemDemonstrativo.Create;
  CtrlElemDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe demlinha ***
  CtrlDemLinha := TCtrlDemLinha.Create;
  CtrlDemLinha.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe Demcoluna (detalhe) ***
  CtrlDemColuna.cdsDetalhe := CdsDet;
  CdsDet.Data := CtrlDemColuna.ProcuraDetalhe(-1,0);
  iSalvaDemo := 0;
  MontaSelect.Filtro.Add('DEMONSTRATIVO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));


end;

procedure TfrmCadColunasDemoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsInsert, dsEdit] Then
  Begin

      //Faz a verificação do preenchimento dos campos
      If (dblkDemo.Text = '') Then
      Begin
         MsgDlg('Demonstrativo não selecionado.','Erro',mtError,[mbOk],0);
         dblkDemo.SetFocus;
         Accept := False;
      End;

      If (dbrColuna.value = 0) Then
      Begin
         MsgDlg('Número da Coluna não informada.','Erro',mtError,[mbOk],0);
         dbrColuna.SetFocus;
         Accept := False;
      End;

      If (dbeDescColuna.Text = '') Then
      Begin
         MsgDlg('Descrição da Coluna não informada.','Erro',mtError,[mbOk],0);
         dbeDescColuna.SetFocus;
         Accept := False;
      End;

      CtrlDemColuna.QuantColunas(iSalvaDemo);
      If CtrlDemColuna.QtdColunas > 9 Then
      Begin
         MsgDlg('O Demonstrativo deve possuir no máximo 9 colunas.','Erro',mtError,[mbOk],0);
         Accept := False;
      End;
  End;

end;

procedure TfrmCadColunasDemoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlDemColuna.MessageInfo <> '' Then
     MsgDlg(CtrlDemColuna.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmCadColunasDemoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  Repaint;

  {** abre o Cds principal e o Detalhe do registro buscado **}
  If MontaSelect.RetornouValor Then
  Begin
     iSalvaDemo := StrToFloat(MontaSelect.ValoresChave[0]);
     iNumero    := StrToFloat(MontaSelect.ValoresChave[1]);

     Cds.Data :=  CtrlDemColuna.ListDemColunas(iSalvaDemo,iNumero);

     {** Abre o Detalhe **}
     CdsDet.Data := CtrlDemColuna.ProcuraDetalhe(iSalvaDemo,iNumero);

   End;

end;

procedure TfrmCadColunasDemoMT.FormShow(Sender: TObject);
begin
  inherited;
   //Deixa o detalhe na 1a. orelha por default
   tbcDetalhe.TabIndex        := 0;
   pgctrlDetalhe.ActivePage   := tbsDet;

   Repaint;

   Screen.Cursor := crHourGlass;
   Screen.Cursor := crDefault;

end;

procedure TfrmCadColunasDemoMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsDet.First;
   while Not CdsDet.Eof do
      CdsDet.Delete;

  inherited;
end;

procedure TfrmCadColunasDemoMT.CmeCadastroInsert(Sender: TObject);
begin
   CdsDet.Data := CtrlDemColuna.ProcuraDetalhe(-1,0);
   inherited;
   Cds.FieldByName('IDDEMONSTRATIVO').asFloat := iSalvaDemo;
   CtrlDemColuna.RetornaProximaColuna(iSalvaDemo);
   Cds.FieldByName('NUMCOLUNA').asInteger := CtrlDemColuna.ProximaColuna + 1;
   iNumero := CtrlDemColuna.ProximaColuna + 1;


   if dblkDemo.canFocus then dblkDemo.SetFocus;

end;

procedure TfrmCadColunasDemoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dblkDemo.canFocus Then dblkDemo.SetFocus;

end;

procedure TfrmCadColunasDemoMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  If dblkElemDet.canFocus Then dblkElemDet.SetFocus;

end;

procedure TfrmCadColunasDemoMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  If dblkElemDet.canFocus Then dblkElemDet.SetFocus;

end;

procedure TfrmCadColunasDemoMT.dblkDemoExit(Sender: TObject);
begin
  inherited;
  FazCloseUp;
end;

procedure TfrmCadColunasDemoMT.dblkDemoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   FazCloseUp;
end;

procedure TfrmCadColunasDemoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlDemColuna.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadColunasDemoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlDemColuna.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadColunasDemoMT.CmeDetalheAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(CtrlDemColuna.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadColunasDemoMT.CmeDetalheConfirma(Sender: TObject);
begin
  If CdsDet.State in [dsInsert, dsEdit] Then
  Begin
      //Faz a verificação do preenchimento dos campos
      If (dblkElemDet.Text = '') Then
      Begin
         MsgDlg('Elemento do Demonstrativo não selecionado.','Erro',mtError,[mbOk],0);
         dblkElemDet.SetFocus;
         Exit;
      End;

      If (dblkLinha.Text = '') Then
      Begin
         MsgDlg('Linha não selecionada.','Erro',mtError,[mbOk],0);
         dblkLinha.SetFocus;
         Exit;
      End;

      {** Atribui os campos descricao do elemento e nome da linha **}
      CdsDet.FieldByName('ELEDESCELEM').AsString     := dblkElemDet.Text;
      CdsDet.FieldByName('NOMELINHA').AsString       := dblkLinha.Text;
      CdsDet.FieldByName('IDDEMONSTRATIVO').asFloat  := iSalvaDemo;
      CdsDet.FieldByName('NUMCOLUNA').asFloat        := iNumero;
  End;

  inherited;

end;

procedure TfrmCadColunasDemoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlDemColuna.Apagar;

end;

procedure TfrmCadColunasDemoMT.CmeCadastroCancel(Sender: TObject);
begin
  If Cds.State in [ dsinsert ] Then
  Begin
    Cds.Data := CtrlDemColuna.ListDemColunas(-1,0);
    CdsDet.Data := CtrlDemColuna.ProcuraDetalhe(-1,0);
  End;

  inherited;

end;
procedure TfrmCadColunasDemoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
  Cds.Data :=  CtrlDemColuna.ListDemColunas(Cds.FieldByName('IDDEMONSTRATIVO').asFloat,
                                            Cds.FieldByName('NUMCOLUNA').asFloat);

  CdsDet.Data := CtrlDemColuna.ProcuraDetalhe(Cds.FieldByName('IDDEMONSTRATIVO').asFloat,
                                              Cds.FieldByName('NUMCOLUNA').asFloat);
end;

end.
