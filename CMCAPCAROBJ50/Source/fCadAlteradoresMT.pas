{-------------------------------------------------------------------------------
Analista.: Antonio Marcos Fernandes de Souza (amf)
Data.....: 27.01.2006
Pendência: 18886 - Criar campo observação para ser utilizado na tela de lançamento.
Descrição: Organizei a interface em um PageControl e adicionei o campo Observação.
-------------------------------------------------------------------------------
Analista.: Bruno Bastos
Data.....: 11/05/2005
Pendência: 19025
Descrição: Colocar o tipo de desembolso para o usuário escolher.
           Foi alterado também a uCtrlTipoAlterador e uDbTipoAlterador
-------------------------------------------------------------------------------
Analista.: André Tavares
Data.....: 28/01/2004
Pendência: 15994
Descrição: permite que o campo conta contábil seja limpo
-------------------------------------------------------------------------------}

unit fCadAlteradoresMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdblook, CMProcuraMask, Mask, DBTables, Provider, uCtrlTipoAlterador,
  uCtrlCentroCusto, uCtrlTipoagre, uCtrlSubConta, uCtrlTerceirosCapCar, uCMTypes,
  uCtrlParamGlobal, uCmSqlParams, //André Tavares - pendência 15377 - 25/05/2004
  uCtrlTipoRecebDesemb, ComCtrls;

type
  TfrmCadAlteradoresMT = class(TFrmCadastroMT)
    Label2: TLabel;
    dbedDescricao: TDBEdit;
    dbrdConverte: TDBRadioGroup;
    pnAcresDecres: TPanel;
    sbtnAcrescimo: TSpeedButton;
    sbtnDecrescimo: TSpeedButton;
    CdsSUBCONTA: TClientDataSet;
    CdsCENTCUST: TClientDataSet;
    CdsNATURENDIMENTO: TClientDataSet;
    CdsAux: TClientDataSet;
    CdsParamGlobal: TClientDataSet;
    CdsTipoDesembolso: TClientDataSet;
    PageControl: TPageControl;
    tabContas: TTabSheet;
    tabCalc: TTabSheet;
    PnlContab: TPanel;
    Label20: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    CContabil: TCMProcuraMaskContabil;
    dblkSubconta: TwwDBLookupCombo;
    cmbCCusto: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    dblkTipoDesembolso: TwwDBLookupCombo;
    CkbCalcImposto: TDBCheckBox;
    DBCkagregsaldo: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    CkbUsaCentroCustoDoc: TDBCheckBox;
    CkbContabilizaAlteradorNaBaixa: TDBCheckBox;
    CkbIncideIrrf: TDBCheckBox;
    dbmmObs: TDBMemo;
    Label5: TLabel;
    procedure sbtnDecrescimoClick(Sender: TObject);
    procedure CContabilApertouBotao(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnAcrescimoClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlParamGlobal   : TCtrlParamGlobal; // André Tavares - pendência 15377 - 25/05/2004
    CtrlTipoalterador : TCtrlTipoalterador;
    CtrlCentroCusto   : TCtrlCentroCusto;
    CtrlTipoagre      : TCtrlTipoagre;
    CtrlSubConta      : TCtrlSubConta;
    CtrlTerceiros     : TCtrlTerceirosCapCar;
    CtrlTiporecebdesemb : TCtrlTiporecebdesemb;//Bruno Bastos - Pend. 19025
    function  VerificaImpostoxAlterador:Boolean;
    procedure FazerQryCCusto;
    procedure MoveCampo;

  public
    { Public declarations }
  end;

var
  frmCadAlteradoresMT: TfrmCadAlteradoresMT;

implementation

uses USistema, UMensErro, UAutorizacao, ufuncaogeral, DBaseDados, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmCadAlteradoresMT.sbtnDecrescimoClick(Sender: TObject);
begin
  inherited;
   sbtnDecrescimo.Down:= true;
   sbtnAcrescimo.Down := false;
end;

procedure TfrmCadAlteradoresMT.CContabilApertouBotao(Sender: TObject);
begin
  inherited;
  CContabil.AceitaTipoConta := Indiferente;
end;

procedure TfrmCadAlteradoresMT.CContabilExit(Sender: TObject);
begin
  inherited;
  CContabil.AceitaTipoConta := SoAnalitica;
  // início - André Tavares - 28/01/2004 - pendência 15994
  // permite que o campo conta contábil seja limpo
  if trim (CContabil.Conta.Numero) = '' then
  begin
    CContabil.Clear;
    cds.FieldByName('placonta').Clear;
  end;
  // fim - André Tavares - 28/01/2004 - pendência 15994
  FazerQryCCusto;
end;

procedure TfrmCadAlteradoresMT.FormCreate(Sender: TObject);
begin
  inherited;

  // início - andre tavares - pendencia 19543 - 05/08/2005
  CkbIncideIrrf.Visible       := sistema.idmodulo <> 4;
  Label1.Visible              := sistema.idmodulo <> 4;
  wwDBLookupCombo1.Visible    := sistema.idmodulo <> 4;
  Label4.Visible              := sistema.idmodulo <> 4;
  dblkTipoDesembolso.Visible  := sistema.idmodulo <> 4;
  // fim - andre tavares - pendencia 19543 - 05/08/2005

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.RecPag = 'P' then
  begin
    HelpContext           := 30053;
    bbtnAjuda.HelpContext := 30053;
  end
  else
  begin
    HelpContext           := 40072;
    bbtnAjuda.HelpContext := 40072;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

  // início - andré Tavares - pendência 15377 - 25/05/2004
  CtrlParamGlobal    := TCtrlParamGlobal.Create;
  CtrlParamGlobal.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CdsParamGlobal.Data := CtrlParamGlobal.ListaParamGlobal(sistema.IdEmpresa);
  // fim    - andré Tavares - pendência 15377 - 25/05/2004

  CContabil.Plano := ParamIntegra.Plano;
  CContabil.Mascara := ParamIntegra.MascaraPlano;

  CtrlTerceiros := TCtrlTerceirosCapCar.Create;
  CtrlTerceiros.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Bruno Bastos - Pend. 19025 - Início
  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.create;
  CtrlTiporecebdesemb.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CdsTipoDesembolso.Data := CtrlTiporecebdesemb.ListTiporecebdesemb('P', Sistema.IdEmpresa, 'A', '', '', '');
  //Bruno Bastos - Pend. 19025 - Fim

  CtrlTipoalterador := TCtrlTipoalterador.Create;
  CtrlTipoalterador.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlTipoalterador.cds := cds;

  cds.data :=  CtrlTipoalterador.listTipoalterador(0,'',-1);

  CtrlCentroCusto := TCtrlCentroCusto.create;
  CtrlCentroCusto.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CdsNATURENDIMENTO.Data := CtrlTerceiros.ListNatureza(Sistema.idEmpresa, ParamIntegra.RecPag);

  CtrlTipoagre := TCtrlTipoagre.Create;
  CtrlTipoagre.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  MontaSelect.Filtro.Add('TIPOALTERADOR.RECPAG =''' + ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('TIPOALTERADOR.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));

  If ParamIntegra.IntegraContab Then
  Begin
     PnlContab.Enabled := True;
     CdsSUBCONTA.Data := CtrlSubConta.ListSubconta(Sistema.idEmpresa, 0);
  End
  Else
     PnlContab.Enabled := False;

  PageControl.ActivePageIndex := 0;
end;

procedure TfrmCadAlteradoresMT.FazerQryCCusto;
begin
  If ParamIntegra.IntegraContab Then
    CdsCENTCUST.Data := CtrlCentroCusto.ListaCentCustCompleto(0,Sistema.IdEmpresa,ParamIntegra.Plano,
               CContabil.Conta.Numero,tccAmbos,toccNome, true, cdsParamGlobal.fieldByName('IDPLANCENTCUST').asFloat);
end;

function TfrmCadAlteradoresMT.VerificaImpostoxAlterador: Boolean;
begin
  CdsAux.data := CtrlTipoagre.ListTipoagre('',0,cds.fieldbyname('CODALTERADOR').AsInteger);
  Result :=  ((CkbCalcImposto.Checked) And (not CdsAux.IsEmpty));
end;

procedure TfrmCadAlteradoresMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
   Begin
      cds.data := CtrlTipoalterador.ListTipoalterador(Sistema.idEmpresa,
                                                      ParamIntegra.RecPag,
                                                      StrToInt(MontaSelect.ValoresChave[0]));
      if ParamIntegra.RecPag = 'P' then
      begin
         if Cds.fieldbyname('ACRESDECRES').AsString = 'C' then
            sbtnAcrescimo.Down := True
         else
            sbtnDecrescimo.Down := True;
      end
      else
      if Cds.fieldbyname('ACRESDECRES').AsString = 'C' then
         sbtnDecrescimo.Down := True
      else
         sbtnAcrescimo.Down := True;
      FazerQryCCusto;
   End;
end;

procedure TfrmCadAlteradoresMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   dbedDescricao.SetFocus;
end;

procedure TfrmCadAlteradoresMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
  cds.fieldbyname('IdPessoa').AsInteger := Sistema.IdEmpresa;
  cds.fieldbyname('RecPag').AsString := ParamIntegra.RecPag;
  cds.fieldbyname('Converte').AsString := 'S';
  cds.fieldbyname('FLGCALCULAIMPOSTO').AsString := 'N';
  cds.fieldbyname('FLGAGREGASALDO').AsString := 'N';
  cds.fieldbyname('FLGCONTABNABAIXA').AsString := 'N';
  cds.fieldbyname('FLGUSACCUSTODOC').AsString := 'N';
  FazerQryCCusto;
end;

procedure TfrmCadAlteradoresMT.sbtnAcrescimoClick(Sender: TObject);
begin
  inherited;
   sbtnDecrescimo.Down:= false;
   sbtnAcrescimo.Down := true;
end;

procedure TfrmCadAlteradoresMT.CmeCadastroDelete(Sender: TObject);
begin
  If Not CtrlTipoalterador.GravarTipoalterador(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario) Then
     MsgDlg(CtrlTipoalterador.MessageInfo,'Erro',mtError,[mbOK],0);
  inherited;
end;

procedure TfrmCadAlteradoresMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
Accept := True;

  //andré tavares - 26/02/2007
  if (CContabil.Valida <> VcOk) then
  begin
    Accept := False;
    if CContabil.Canfocus then
      CContabil.setFocus;
      exit;
  end;
  
  if Trim(dbedDescricao.Text) = '' then
  begin
     MsgDlg('Descrição não preenchida','Aviso',mtError,[mbOk],0);
     If dbedDescricao.CanFocus Then dbedDescricao.SetFocus;
     Accept := False;
  end;
  If VerificaImpostoxAlterador Then
  begin
     MsgDlg('Este Alterador Está Associado a um imposto, não é possível calcular imposto sobre o mesmo','Aviso',mtError,[mbOk],0);
     Accept := False;
  end;
  if ParamIntegra.IntegraContab then
  begin
     if (Trim(cmbCCusto.Text) = '') And
        (CContabil.Conta.ObrigaCentrodeCusto) And
        (Not CkbUsaCentroCustoDoc.Checked) then
     begin
        MsgDlg('A Conta Contábil escolhida obriga a seleção de um Centro de Custo','Aviso',mtError,[mbOk],0);
        If cmbCCusto.CanFocus Then cmbCCusto.SetFocus;
        Accept := False;
     end
  End;
end;

procedure TfrmCadAlteradoresMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmCadAlteradoresMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoalterador.GravarTipoalterador(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmCadAlteradoresMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  MoveCampo;
  Accept := CtrlTipoalterador.GravarTipoalterador(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmCadAlteradoresMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  MoveCampo;
  Accept := CtrlTipoalterador.GravarTipoalterador(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmCadAlteradoresMT.MoveCampo;
begin
If cds.State In [DsEdit,DsInsert] then
Begin
   if (ParamIntegra.RecPag = 'P') then
   begin
      if sbtnAcrescimo.Down then cds.fieldbyname('ACRESDECRES').AsString := 'C'
      else cds.fieldbyname('ACRESDECRES').AsString := 'D'
   end
   else
   begin
      if sbtnAcrescimo.Down then cds.fieldbyname('ACRESDECRES').AsString := 'D'
      else cds.fieldbyname('ACRESDECRES').AsString := 'C'
   end;
   cds.fieldbyname('Idpessoa').AsInteger          := Sistema.IdEmpresa;
   cds.fieldbyname('idUsuarioInclusao').AsInteger := Sistema.idUsuario;
   cds.fieldbyname('IdEmpresa').AsInteger         := sistema.IdEmpresa;
   if ParamIntegra.IntegraContab then
      cds.fieldbyname('Plano').AsInteger := ParamIntegra.Plano;
End;
end;

procedure TfrmCadAlteradoresMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlTipoalterador.MessageInfo <> '' Then
     MsgDlg(CtrlTipoalterador.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmCadAlteradoresMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //amf 18886 27.01.2006
  FreeAndNil(CtrlTipoAlterador);

  inherited;
  //início andré Tavares - pendência 15377 - 25/05/2004
  CtrlParamGlobal.Free;
  CtrlTipoalterador.Free;
  CtrlCentroCusto.Free;
  CtrlTipoagre.Free;
  CtrlSubConta.Free;
  CtrlTerceiros.Free;
  CtrlTiporecebdesemb.Free; //Bruno Bastos - Pend. 19025
  //fim andré Tavares - pendência 15377 - 25/05/2004
end;

end.
