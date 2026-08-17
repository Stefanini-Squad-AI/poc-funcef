unit fCadEventoSrhMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCtrlEventoSRH,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  uCtrlContab,MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  fcLabel, Mask, wwdbedit, wwdblook,uCtrlHistoContab, DBTables,
  Wwquery, CMProcura, CMProcuraMask,uCtrlSubConta,
  {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF};


type
  TfrmCadEventoSrhMT = class(TFrmCadastroMT)
    dbeCodEvento: TwwDBEdit;
    dbeDescEvento: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    fcLabel3: TfcLabel;
    Panel3: TPanel;
    Panel12: TPanel;
    fcLabel4: TfcLabel;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    cmpContaDeb: TCMProcuraMaskContabil;
    Label4: TLabel;
    dblkHistorico: TwwDBLookupCombo;
    cmpContaCre: TCMProcuraMaskContabil;
    GroupBox1: TGroupBox;
    btnSubContaCre: TBitBtn;
    GroupBox2: TGroupBox;
    btnSubContaDeb: TBitBtn;
    GroupBox3: TGroupBox;
    lblNomeSubContaC: TfcLabel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    NomeAtivProj: TEdit;
    btnAtivPrpj: TBitBtn;
    lblNomeSubContaD: TfcLabel;
    mskSubContaD: TMaskEdit;
    mskSubContaC: TMaskEdit;
    mskAtivProj: TMaskEdit;
    CdsHistorico: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure btnSubContaDebClick(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure btnSubContaCreClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure btnAtivPrpjClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure mskSubContaDExit(Sender: TObject);
    procedure mskSubContaCExit(Sender: TObject);
    procedure cmpContaDebExit(Sender: TObject);
    procedure cmpContaCreExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    bFind :Boolean;
    lblSubContaDebAux, lblSubContaCreAux :string;
    CtrlEventoSRH    :TCtrlEventoSRH;
    CtrlContab       :TCtrlContab;
    CtrlHistorico    :TCtrlHistoContab;
    CtrlSubConta     :TCtrlSubConta;
    procedure LimpaCampos;
    procedure TrazCamposTela;

  public
    { Public declarations }
  end;

var
  frmCadEventoSrhMT: TfrmCadEventoSrhMT;

implementation

{$R *.DFM}

uses dBaseDados, uModulo, uSistema, uString, uMensErro;

procedure TfrmCadEventoSrhMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal ***
  CtrlEventoSRH := TCtrlEventoSRH.Create;
  CtrlEventoSRH.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlEventoSRH.CdsEventoSRH   := Cds;
  Cds.Data := CtrlEventoSRH.ListEventoSRH(-1,'');

  // *** Instancia a classe Historico Contab ***
  CtrlHistorico := TCtrlHistoContab.Create;
  CtrlHistorico.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsHistorico.Data := CtrlHistorico.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');

  // *** Instancia a classe SubConta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  //*** Atividade/projeto ***
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));

  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // pegar marcara e plano da conta deb
  cmpContaDeb.Plano   := CtrlContab.PlanoParam;
  cmpContaDeb.Mascara := CtrlContab.MascaraContaParam;

  cmpContaCre.Plano   := CtrlContab.PlanoParam;
  cmpContaCre.Mascara := CtrlContab.MascaraContaParam;


  {mascara da atividade/proj}
  mskAtivProj.EditMask  := modulo.sMascaraUnidNegoc + ';0; ';


end;

procedure TfrmCadEventoSrhMT.TrazCamposTela;
begin

    // retorna nome e codigo da ativ/proj
    If (Not Cds.FieldByName('UNIDNEGOC').IsNull) then
    Begin
       CtrlEventoSRH.RetornaDadosAtivProj(Cds.FieldByName('IDPESSOA').AsFloat,Cds.FieldByName('UNIDNEGOC').AsFloat,'');
       Begin
          mskAtivProj.Text  := '';
          NomeAtivProj.Text := '';
          mskAtivProj.Text  := CtrlEventoSRH.UneCodigo;
          NomeAtivProj.Text := CtrlEventoSRH.NomeAtivProj;
       End;
    End Else
    Begin
       mskAtivProj.Text  := '';
       NomeAtivProj.Text := '';
    End;

    // retorna nome da sub conta  e codigo
    If  (Not Cds.FieldByName('SUBCONTACRE').IsNull) then
    Begin
      CtrlSubConta.RetornaCamposSubConta(Cds.FieldByName('IDPESSOA').AsFloat,Cds.FieldByName('SUBCONTACRE').AsFloat);
      If CtrlSubConta.AchouSubConta Then
      Begin
         mskSubContaC.Text  := '';
         mskSubContaC.Text  := IntToStr(Cds.FieldByName('SUBCONTACRE').AsInteger);
         lblNomeSubContaC.Caption := '';
         lblNomeSubContaC.Caption := CtrlSubConta.NomeSubConta;
        End;
    End;

    // retorna nome da sub conta debito e codigo
    If (Not Cds.FieldByName('SUBCONTADEB').IsNull) then
    Begin
       CtrlSubConta.RetornaCamposSubConta(Cds.FieldByName('IDPESSOA').AsFloat,Cds.FieldByName('SUBCONTADEB').AsFloat);
       If CtrlSubConta.AchouSubConta Then
       Begin
          mskSubContaD.Text  :=  '';
          mskSubContaD.Text  := IntToStr(Cds.FieldByName('SUBCONTADEB').AsInteger);
          lblNomeSubContaD.Caption := '';
          lblNomeSubContaD.Caption := CtrlSubConta.NomeSubConta;
       End;
    End;

end;



procedure TfrmCadEventoSrhMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  bFind := False;
  If MontaSelect.RetornouValor Then
  Begin
    Cds.Data := CtrlEventoSRH.ListEventoSRH(Sistema.IdEmpresa,MontaSelect.ValoresChave[0]);
    bFind := True;
    TrazCamposTela;
  End;

end;

procedure TfrmCadEventoSrhMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlEventoSRH.Free;
  CtrlContab.Free;
  CtrlHistorico.Free;
  CtrlSubConta.Free;
end;

procedure TfrmCadEventoSrhMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbeCodEvento.SetFocus;
end;

procedure TfrmCadEventoSrhMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  lblSubContaDebAux := lblNomeSubContaD.Caption;
  lblSubContaCreAux := lblNomeSubContaC.Caption;

  LimpaCampos;

  // alimenta tabela com campos sem tela
  Cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  Cds.FieldByName('PLANO').AsFloat    := CtrlContab.PlanoParam;

end;


procedure TfrmCadEventoSrhMT.btnSubContaDebClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelectSubConta.Executar;
  If MontaSelectSubConta.RetornouValor Then
  Begin
     CtrlEventoSRH.CdsEventoSRH.FieldByName('SUBCONTADEB').AsFloat := StrToFloat(MontaSelectSubConta.ValoresChave[0]);
     mskSubContaD.Text := '';
     mskSubContaD.Text := MontaSelectSubConta.ValoresChave[0];

    CtrlSubConta.RetornaCamposSubConta(Cds.FieldByName('IDPESSOA').AsFloat, Cds.FieldByName('SUBCONTADEB').AsFloat);
    If CtrlSubConta.AchouSubConta Then
    Begin
      lblNomeSubContaD.Caption := '';
      lblNomeSubContaD.Caption := CtrlSubConta.NomeSubConta;
    End;
  End;

end;

procedure TfrmCadEventoSrhMT.btnAtivProjClick(Sender: TObject);
begin
  inherited;
   MontaSelectAtivProj.Executar;
   if MontaSelectAtivProj.RetornouValor Then
   Begin
      CtrlEventoSRH.CdsEventoSRH.FieldByName('UNIDNEGOC').AsFloat := StrToFloat(MontaSelectAtivProj.ValoresChave[1]);
      NomeAtivProj.Text := '';
      NomeAtivProj.Text := MontaSelectAtivProj.ValoresChave[2];
   End;

end;

procedure TfrmCadEventoSrhMT.btnSubContaCreClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelectSubConta.Executar;
  If MontaSelectSubConta.RetornouValor Then
  Begin
     CtrlEventoSRH.CdsEventoSRH.FieldByName('SUBCONTACRE').AsFloat := StrToFloat(MontaSelectSubConta.ValoresChave[0]);
     mskSubContaC.Text := '';
     mskSubContaC.Text := MontaSelectSubConta.ValoresChave[0];

     CtrlSubConta.RetornaCamposSubConta(Cds.FieldByName('IDPESSOA').AsFloat,Cds.FieldByName('SUBCONTACRE').AsFloat);
     If CtrlSubConta.AchouSubConta Then
     Begin
       lblNomeSubContaC.Caption := '';
       lblNomeSubContaC.Caption := CtrlSubConta.NomeSubConta;
     End;
  End;

end;



procedure TfrmCadEventoSrhMT.LimpaCampos;
begin
  lblNomeSubContaD.Caption := '';
  lblNomeSubContaC.Caption := '';
  NomeAtivProj.Text        := '';
  mskSubContaD.Text        := '';
  mskSubContaC.Text        := '';
  mskAtivProj.Text         := '';
end;

procedure TfrmCadEventoSrhMT.CmeCadastroDelete(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;

procedure TfrmCadEventoSrhMT.FormShow(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TfrmCadEventoSrhMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  If bFind then
     TrazCamposTela;
end;

procedure TfrmCadEventoSrhMT.btnAtivPrpjClick(Sender: TObject);
begin
  inherited;
   MontaSelectAtivProj.Executar;
   If MontaSelectAtivProj.RetornouValor Then
   Begin
      CtrlEventoSRH.CdsEventoSRH.FieldByName('UNIDNEGOC').AsFloat := StrToFloat(MontaSelectAtivProj.ValoresChave[1]);
      mskAtivProj.Text  := '';
      mskAtivProj.Text  := MontaSelectAtivProj.ValoresChave[0];
      NomeAtivProj.Text := '';
      NomeAtivProj.Text := MontaSelectAtivProj.ValoresChave[2];
   End;

end;

procedure TfrmCadEventoSrhMT.mskAtivProjExit(Sender: TObject);
begin
   inherited;

    If (mskAtivProj.Text <> '')  then
    Begin
       If CtrlEventoSRH.RetornaDadosAtivProj(Sistema.IdEmpresa,0,Trim(mskAtivProj.Text)) Then
       Begin
          CtrlEventoSRH.CdsEventoSRH.FieldByName('UNIDNEGOC').AsFloat := CtrlEventoSRH.UnidNegoc;
          mskAtivProj.Text  := '';
          mskAtivProj.Text  := CtrlEventoSRH.UneCodigo;
          NomeAtivProj.Text := '';
          NomeAtivProj.Text := CtrlEventoSRH.NomeAtivProj;
       End;
    End Else
    Begin
       mskAtivProj.Text  := '';
       NomeAtivProj.Text := '';
    End;

end;

procedure TfrmCadEventoSrhMT.mskSubContaDExit(Sender: TObject);
begin
  inherited;
  If  mskSubContaD.Text <> '' Then
  Begin
     CtrlSubConta.RetornaCamposSubConta(Sistema.IdEmpresa,StrToFloat(mskSubContaD.Text));
     If CtrlSubConta.AchouSubConta Then
     Begin
        lblNomeSubContaD.Caption := '';
        lblNomeSubContaD.Caption := CtrlSubConta.NomeSubConta;
     End Else
     Begin
        MsgDlg('O código da sub-conta informado não existe.','Aviso',mtWarning,[mbOk],0);
        mskSubContaD.SetFocus;
        Exit;
     End;
  End;
end;

procedure TfrmCadEventoSrhMT.mskSubContaCExit(Sender: TObject);
begin
  inherited;
  If  mskSubContaC.Text <> '' Then
  Begin
     CtrlSubConta.RetornaCamposSubConta(Sistema.IdEmpresa,StrToFloat(mskSubContaC.Text));
     If CtrlSubConta.AchouSubConta Then
     Begin
       lblNomeSubContaC.Caption := '';
       lblNomeSubContaC.Caption := CtrlSubConta.NomeSubConta;
     End Else
     Begin
        MsgDlg('O código da sub-conta informado não existe.','Aviso',mtWarning,[mbOk],0);
        mskSubContaC.SetFocus;
        Exit;
     End;
  End;
end;

procedure TfrmCadEventoSrhMT.cmpContaDebExit(Sender: TObject);
begin
  inherited;

  If (ActiveControl.Tag <> 999) And (cmpContaDeb.Valida <> VcOK) Then
  Begin
     cmpContaDeb.SetFocus;
     exit;
  End;

  If cmpContaDeb.Conta.ObrigaSubConta Then
  Begin
     mskSubContaD.Enabled := True;
     mskSubContaD.Color   := clWindow;

     btnSubContaDeb.Enabled := True;

     {dados para a sub conta}
     MontaSelectSubConta.Filtro.Delete(2);
     MontaSelectSubConta.Filtro.Delete(2);
     MontaSelectSubConta.Filtro.Delete(2);
     MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA    = '+IntToStr(Sistema.IdEmpresa));
     MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco(cmpContaDeb.Conta.Numero,18)+'''');
     MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO    = '+IntToStr(CtrlContab.PlanoParam));
  End Else
  Begin
     mskSubContaD.Text    := '';
     mskSubContaD.Enabled := False;
     mskSubContaD.Color   := clbtnFace;

     btnSubContaDeb.Enabled := False;
  End;

end;

procedure TfrmCadEventoSrhMT.cmpContaCreExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) and (cmpContaCre.Valida <> VcOK) Then
  Begin
     cmpContaCre.SetFocus;
     exit;
  End;

  If cmpContaCre.Conta.ObrigaSubConta Then
  Begin
     mskSubContaC.Enabled := True;
     mskSubContaC.Color   := clWindow;

     btnSubContaCre.Enabled := True;
     {dados para a sub conta}
     MontaSelectSubConta.Filtro.Delete(2);
     MontaSelectSubConta.Filtro.Delete(2);
     MontaSelectSubConta.Filtro.Delete(2);
     MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA    = '+IntToStr(Sistema.IdEmpresa));
     MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco(cmpContaCre.Conta.Numero,18)+'''');
     MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO    = '+IntToStr(CtrlContab.PlanoParam));

  End Else
  Begin
     mskSubContaC.Text    := '';
     mskSubContaC.Enabled := False;
     mskSubContaC.Color   := clbtnFace;

     btnSubContaCre.Enabled := False;
  End;


end;

procedure TfrmCadEventoSrhMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmCadEventoSrhMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoSrh.Gravar;
end;

procedure TfrmCadEventoSrhMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoSrh.Gravar;

end;

procedure TfrmCadEventoSrhMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoSrh.Gravar;

end;

procedure TfrmCadEventoSrhMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
     If mskSubContaD.Text <> '' then
        Cds.FieldByName('SUBCONTADEB').AsInteger := StrToInt(mskSubContaD.Text);
     If mskSubContaC.Text <> '' then
        Cds.FieldByName('SUBCONTACRE').AsInteger := StrToInt(mskSubContaC.Text);
  End;

end;

procedure TfrmCadEventoSrhMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlEventoSRH.MessageInfo <> '' Then
     MsgDlg(CtrlEventoSRH.MessageInfo,'Erro',mtError,[mbOK],0);

end;

end.
