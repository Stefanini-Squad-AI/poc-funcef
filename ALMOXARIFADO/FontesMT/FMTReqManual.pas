{--------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina .....: (dfm)  edQtde
Nº SIG......: 84877
Data........: 30/07/2019
Responsável.: Edilaine
Descrição...: Alteração no número de dígitos do campo para baixa de residuos
              Propriedade DecDigits
--------------------------------------------------------------------------------
Rotina ......: FormCreate e CmeCadastroFind
SOL..........: 163982/6901
Kintana......: 1472467
Data.........: 01/11/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
--------------------------------------------------------------------------------}
unit FMTReqManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, DBCtrls,
  uCtrlReqManual,uCtrlArtigo, uCtrlUnMedida, uCtrlUnidNegocio, uCtrlParamGlobal,
  uCtrlCentroCusto, uCtrlAlmox,uCtrlMovEstoque, DBTables, Wwquery,uCmTypes;

type
  TFrmMTReqManual = class(TFrmCadastroMestreDetMT)
    rgTipMov: TRadioGroup;
    Label12: TLabel;
    lbAlmox: TStaticText;
    grpAlmoxCC: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    dblcCCust: TwwDBLookupCombo;
    Label3: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    grpReq: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edDataReq: TCMDateTimePicker;
    cdsAlmox: TCMClientDataSet;
    cdsCentCusto: TCMClientDataSet;
    cdsUnidNegoc: TCMClientDataSet;
    cdsItem: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dblcUN: TwwDBLookupCombo;
    DbUN: TDBEdit;
    dblcDesc: TwwDBLookupCombo;
    dblcItem: TwwDBLookupCombo;
    edValb: TRealEdit;
    DbSaldoQtde: TRealEdit;
    rgDest: TRadioGroup;
    cdsUnMedida: TCMClientDataSet;
    edNumReq: TDBRealEdit;
    dsArtigo: TwwDataSource;
    edQtde: TDBRealEdit;
    CdsAux: TCMClientDataSet;
    cdsParamGlobal: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure dblcUNEnter(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edQtdeExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure rgTipMovClick(Sender: TObject);
    procedure dblcAlmoxExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    CtrlParamGlobal : TCtrlParamGlobal;
    ReqManual   : TCtrlReqManual;
    Artigo      : TCtrlArtigo;
    UnMedida    : TCtrlUnMedida;
    UnidNegocio : TCtrlUnidNegocio;
    CentroCusto : TCtrlCentroCusto;
    Almox       : TCtrlAlmox;
    MovEstoque  : TCtrlMovEstoque;
     //
    Procedure Sel;
    Function  VerifDados : Boolean;
  public
    { Public declarations }
  end;

var
  FrmMTReqManual: TFrmMTReqManual;

implementation

{$R *.DFM}

Uses uSistema, uModulo, DBaseDados, uMensErro;

procedure TFrmMTReqManual.FormCreate(Sender: TObject);
begin
  inherited;
  ReqManual := TCtrlReqManual.Create;
  ReqManual.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ReqManual.cds     := cds;
  ReqManual.cdsItem := cdsItem;

  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  MovEstoque := TCtrlMovEstoque.Create;
  MovEstoque.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsAlmox.Data     := Almox.ListAlmox(Sistema.IdEmpresa,Modulo.iCodAlmoxa);


  // Marchetti - Pendencia 27699
  CtrlParamGlobal   := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(Almox);
  cdsParamGlobal.Data := CtrlParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);

//  cdsCentCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');
  cdsCentCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A',cdsParamGlobal.FieldByName('IDPLANCENTCUST').AsInteger);
  // Fim Marchetti - Pendencia 27699

  //Vinicius Maciel - SOL 163982/6901 KTN 1472467
  //cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
  cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocioAtivas(Sistema.IdEmpresa);
  //Vinicius Maciel - SOL 163982/6901 KTN 1472467 - FIM
  cdsArtigo.Data    := Artigo.ListArtigo(taVazio,True,'',tbAmbos);

  Sel;
  lbAlmox.Caption := '  ' + Modulo.sAlmoxaUsuario + '  ';

end;

procedure TFrmMTReqManual.Sel;
begin
   cds.Data     := ReqManual.ListReq;
   cdsItem.Data := ReqManual.ListReqItem;
end;

procedure TFrmMTReqManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlParamGlobal );
  ReqManual.Free;
  Artigo.Free;
  UnMedida.Free;
  UnidNegocio.Free;
  CentroCusto.Free;
  Almox.Free;
  MovEstoque.Free; 
  inherited;
end;

procedure TFrmMTReqManual.CmeCadastroInsert(Sender: TObject);
begin
  Sel;
  inherited;
  cds.FieldByName('DATAREQ').AsDateTime        := Date;
  cds.FieldByName('CODALMOXARIFADO').AsInteger := Modulo.iCodAlmoxa;
  RgTipMov.ItemIndex := 0;
  RgTipMov.SetFocus;

end;

procedure TFrmMTReqManual.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cdsItem.FieldByName('FLGDEST').asString := 'I';
  dblcItem.SetFocus;
end;

procedure TFrmMTReqManual.CmeDetalheDelete(Sender: TObject);
begin
   If MsgDlg('Confirma a exclusão do item','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
      inherited;
end;

procedure TFrmMTReqManual.dblcUNEnter(Sender: TObject);
begin
  inherited;
  cdsUnMedida.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString);
end;

procedure TFrmMTReqManual.CmeDetalheConfirma(Sender: TObject);
begin
  If cdsItem.State In dsEditModes Then
     Begin
        cdsItem.FieldByName('DESCRICAO').AsString := dblcDesc.Text;
        cdsItem.FieldByName('VALOR').AsFloat      := EdValb.Value;
        If RgDest.ItemIndex = 0 then
           cdsItem.FieldByName('FLGDEST').AsString := 'I'
        Else
           cdsItem.FieldByName('FLGDEST').AsString := 'F';
     End;
  inherited;     
end;

procedure TFrmMTReqManual.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcItem.Text) <> '' Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       DbSaldoQtde.Value    := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                                    dblcItem.LookUpValue,
                                                    Modulo.iCodAlmoxa,
                                                    edDataReq.Date);                   
    End;

end;

procedure TFrmMTReqManual.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcDesc.Text) <> '' Then
    Begin
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       DbSaldoQtde.Value    := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                                    dblcItem.LookUpValue,
                                                    Modulo.iCodAlmoxa,
                                                    edDataReq.Date);                   
    End;

end;

procedure TFrmMTReqManual.edQtdeExit(Sender: TObject);
Var
   rQtde : Double;
begin
  inherited;
  rQtde := UnMedida.QtdeToUnCustoMedio(dblcItem.LookupValue,
                                       dblcUn.LookUpValue,
                                       edQtde.Value );

  If (rgTipMov.ItemIndex <> 2) And ( RgDest.ItemIndex <> 1) Then
    Begin
       If Format('%17.5f',[rQtde]) > Format('%17.5f',[dbSaldoQtde.Value]) Then
          Begin
             MsgDlg('Quantidade solicitado maior que a quantidade disponível','Erro',mtError,[mbOk],0);
             edQtde.Clear;
             edQtde.SetFocus;
             Exit;
         End;
     End;

  edValb.Value := Artigo.GetCustoMedio(dblcItem.LookupValue,Modulo.iCodCusteio);   
end;

procedure TFrmMTReqManual.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   Accept := True;
   If cdsItem.IsEmpty then
      Begin
         MsgDlg('Não há itens lançados nesta requisição','Erro',mtError,[mbOk],0);
         edNumReq.SetFocus;
         Accept := False;
      end
   Else
   If (trim(dblcAtiv.Text) = '') Then
      Begin
         MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
         dblcAtiv.SetFocus;
         Accept := False;
      End
   Else
   If (trim(dblcAlmox.Text) = '') and (rgTipMov.ItemIndex = 0) Then
      Begin
         MsgDlg('Almoxarifado Destino não foi preenchido','Erro',mtError,[mbOk],0);
         dblcAlmox.SetFocus;
         Accept := False;
      End
   Else
   If (trim(dblcCCust.Text) = '') and (rgTipMov.ItemIndex <> 0) Then
      Begin
         MsgDlg('Centro de Custo Destino não foi preenchido','Erro',mtError,[mbOk],0);
         dblcCCust.SetFocus;
         Accept := False;
      End
   Else
   If EdNumReq.Value = 0 Then
      Begin
         MsgDlg('Número da requisição não foi preenchido','Erro',mtError,[mbOk],0);
         EdNumReq.SetFocus;
         Accept := False;
      End
   Else
   If Trim(EdDataReq.Text) = '' Then
      Begin
         MsgDlg('Data de requisição não foi preenchida','Erro',mtError,[mbOk],0);
         EdDataReq.SetFocus;
         Accept := False;
      End
   Else
   If (Not VerifDados) And (rgTipMov.ItemIndex <> 2 ) Then
      Begin
         MsgDlg('Você, provavelmente, alterou a data depois de inserir itens na requisição. Ocasionando mudança no saldo disponível.','Erro',mtError,[mbOk],0);
         EdDataReq.SetFocus;
         Accept := False;
      End;
end;

function TFrmMTReqManual.VerifDados: Boolean;
Var
  rQtde : Double;
begin
   Result := True;
   cdsItem.DisableControls;
   Try
      cdsItem.First;
      While Not cdsItem.EOF Do
        Begin

           rQtde := UnMedida.QtdeToUnCustoMedio( cdsItem.FieldByName('CODARTIGO').asString,
                                                 cdsItem.FieldByName('CODMEDIDA').asString,
                                                 cdsItem.FieldByName('QUANTIDADE').asFloat  );

           If(Format('%17.5f',[rQtde]) > Format('%17.5f',[MovEstoque.InfoSaldo(Sistema.IdEmpresa,cdsItem.FieldByName('CODARTIGO').asString,Modulo.iCodAlmoxa,edDataReq.Date)]) )
              And(cdsItem.FieldByName('FLGDEST').asString = 'I' )
           Then
             Result := False;
           cdsItem.Next;
        End;
   Finally
      cdsItem.EnableControls;
   End;
end;

procedure TFrmMTReqManual.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ReqManual.BaixarMaterial(TTipoBaixa(rgTipMov.ItemIndex),Sistema.IdEmpresa);
end;

procedure TFrmMTReqManual.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(ReqManual.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmMTReqManual.rgTipMovClick(Sender: TObject);
begin
  inherited;
    Case rgTipMov.ItemIndex Of
       1 : Begin
              dblcAlmox.Text := '';
              dblcAlmox.Enabled := False;
              dblcCCust.Enabled := True;
           End;
       0 : Begin
              dblcAlmox.Enabled := True;
              dblcCCust.Text := '';
              dblcCCust.Enabled := False;
           End;
    Else
        Begin
            dblcAlmox.Text := '';
            dblcAlmox.Enabled := False;
            dblcCCust.Enabled := True;
        End;
    End;

end;

procedure TFrmMTReqManual.dblcAlmoxExit(Sender: TObject);
begin
  inherited;
   If Trim(dblcAlmox.Text) <> '' Then
     If Not Almox.PodeTransferir(Modulo.iCodAlmoxa ,StrToIntDef(dblcAlmox.LookUpValue,0)) Then
        Begin
            MsgDlg('Esse almoxarifado não está disponível para tranferência','Error',MtError,[mbOk],0);
            dblcAlmox.Text := '';
            dblcAlmox.SetFocus;
         End;
end;

procedure TFrmMTReqManual.bbtnOkDetClick(Sender: TObject);
begin
   CdsAux.CloneCursor(CdsItem,True);
   If trim(dblcCCust.LookUpValue) <> '' Then
      Begin
         If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,dblcCCust.LookUpValue,Sistema.IdEmpresa)) Then
            Begin
                MsgDlg('Este Centro de Custo não pode requisitar este produto','Erro',mtError,[mbOk],0);
                dblcItem.SetFocus;
                Exit;
            End;
      End;
   If trim(dblcAlmox.LookUpValue) <> '' Then
      Begin
         If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,cdsAlmox.FieldByName('CODCENTROCUSTO').AsString,Sistema.IdEmpresa) ) Then
           Begin
               MsgDlg('Este Almoxarifado não pode requisitar este produto','Erro',mtError,[mbOk],0);
               dblcItem.SetFocus;
               Exit;
           End;
      End;
   If  (cdsItem.State = dsInsert) And (CdsAux.Locate('CodArtigo',Copy(dblcItem.LookupValue+ '                  ',1,14),[LoPartialKey])) Then
      Begin
         If MsgDlg('Já existe esse item na requisição. Inserir outro ','Confimação',mtConfirmation,[mbOK,mbCancel],0) = mrCancel Then
            Begin
               bbtnCancelarDet.Click;
               Exit;
            End;
      End;
   If ReqManual.ExisteRequisicao(Sistema.IdEmpresa,edNumReq.Text,dblcItem.LookupValue) then
     Begin
        MsgDlg('Já existe o item '+dblcDesc.Text+ ' com Nº de requisição igual a '+edNumReq.Text,'Erro',mtError,[mbOk],0);
        dblcItem.SetFocus;
        Exit;
     End;
   If edQtde.Value = 0  Then
      Begin
         MsgDlg('Proibido requisitar quantidade iqual a zero ','Erro',mtError,[mbOk],0);
         dblcItem.SetFocus;
         Exit;
      End;

  inherited;

end;

procedure TFrmMTReqManual.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   Accept := True;
   CdsAux.CloneCursor(CdsItem,True);
   If trim(dblcCCust.LookUpValue) <> '' Then
      Begin
         If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,dblcCCust.LookUpValue,Sistema.IdEmpresa)) Then
            Begin
                MsgDlg('Este Centro de Custo não pode requisitar este produto','Erro',mtError,[mbOk],0);
                dblcItem.SetFocus;
                Accept := False;
            End;
      End
   Else
   If trim(dblcAlmox.LookUpValue) <> '' Then
      Begin
         If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,cdsAlmox.FieldByName('CODCENTROCUSTO').AsString,Sistema.IdEmpresa) ) Then
           Begin
               MsgDlg('Este Almoxarifado não pode requisitar este produto','Erro',mtError,[mbOk],0);
               dblcItem.SetFocus;
               Accept := False;
           End;
      End
   Else
   If  (cdsItem.State = dsInsert) And (CdsAux.Locate('CodArtigo',Copy(dblcItem.LookupValue+ '                  ',1,14),[LoPartialKey])) Then
      Begin
         If MsgDlg('Já existe esse item na requisição. Inserir outro ','Confimação',mtConfirmation,[mbOK,mbCancel],0) = mrCancel Then
            Begin
               bbtnCancelarDet.Click;
               Accept := False;
            End;
      End
   Else
   If ReqManual.ExisteRequisicao(Sistema.IdEmpresa,edNumReq.Text,dblcItem.LookupValue) then
     Begin
        MsgDlg('Já existe o item '+dblcDesc.Text+ ' com Nº de requisição igual a '+edNumReq.Text,'Erro',mtError,[mbOk],0);
        dblcItem.SetFocus;
        Accept := False;
     End
   Else
   If edQtde.Value = 0  Then
      Begin
         MsgDlg('Proibido requisitar quantidade iqual a zero ','Erro',mtError,[mbOk],0);
         dblcItem.SetFocus;
         Accept := False;
      End;
end;

procedure TFrmMTReqManual.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  //Vinicius Maciel - SOL 163982/6901 KTN 1472467
  If MontaSelect.RetornouValor Then
  begin
      if((dblcAtiv.Text = '') and (dblcAtiv.LookupValue <> '')) then
      dblcAtiv.Text := UnidNegocio.recuperaAtividadePerd(dblcAtiv.LookupValue)
  end;
  //Vinicius Maciel - SOL 163982/6901 KTN 1472467 - FIM
end;

end.


