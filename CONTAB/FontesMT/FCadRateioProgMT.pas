unit FCadRateioProgMT;

interface
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 22/02/2005
  Pendência    : 17813 / 18439
  Solução      : Tela completamente refeita
------------------------------------------------------------------------------}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, DBCtrls, StdCtrls, Mask, TREdit, wwdblook,
  CMDBLookupCombo, CMProcuraMask, ExtCtrls, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,uCtrlPrePlanilhaRP,
  uCtrlListTerceiros,uCtrlContab,uCtrlContaContabil,uCtrlHistoContab,
  uCMTypes, uCtrlCentroCusto, uCmSqlParams;


type
  TfrmCadRateioProgMT = class(TFrmCadastroMestreDetMT)
    rgTipoConta: TRadioGroup;
    cmccContaOrigem: TCMProcuraMaskContabil;
    cmccContaDestino: TCMProcuraMaskContabil;
    dblcHistPadrao: TCMDBLookupCombo;
    Label1: TLabel;
    lblPercentual: TLabel;
    dbrePerc: TDBRealEdit;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    CdsPreDetalhe: TCMClientDataSet;
    edDescAutomatico: TDBEdit;
    lblPrePronta: TLabel;
    dbckInativo: TDBCheckBox;
    grpContaperc: TDBRadioGroup;
    CdsHistoPadrao: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    dblkCCusto: TwwDBLookupCombo;
    lblPPPCentroCusto: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    Label10: TLabel;
    dbgrDiaPer: TDBRadioGroup;
    dbchkIntegraPlanilha: TDBCheckBox;
    edFase: TDBEdit;
    Label4: TLabel;
    CMSqlParams1: TCMSqlParams;
    procedure cmccContaOrigemExit(Sender: TObject);
    procedure cmccContaDestinoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoContaClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    CtrlPrePlanilhaRP   : TCtrlPrePlanilhaRP;
    CtrlContab        : TCtrlContab;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlHistoContab   : TCtrlHistoContab;
    ListTerceiros     : TCtrlListTerceiros;
    CtrlCentroCusto   : TCtrlCentroCusto;
  public
    { Public declarations }
  end;

var
  frmCadRateioProgMT: TfrmCadRateioProgMT;

implementation

Uses uSistema, uMensErro, uDataBase, dBaseDados;

{$R *.DFM}

procedure TfrmCadRateioProgMT.cmccContaOrigemExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmccContaOrigem.Valida <> VcOk) Then
  Begin
     cmccContaOrigem.SetFocus;
     exit;
  End;

end;

procedure TfrmCadRateioProgMT.cmccContaDestinoExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmccContaDestino.Valida <> VcOk) Then
  Begin
     cmccContaDestino.SetFocus;
     exit;
  End;

end;

procedure TfrmCadRateioProgMT.FormCreate(Sender: TObject);
begin
  inherited;

  // *** Instancia a classe principal pre-planilha ***
  CtrlPrePlanilhaRP := TCtrlPrePlanilhaRP.Create;
  CtrlPrePlanilhaRP.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPrePlanilhaRP.cdsPrePlanilha := Cds;
  Cds.Data := CtrlPrePlanilhaRP.ListPrePlanilha(-1,-1,'');

  CtrlPrePlanilhaRP.cdsPreDetalhe := CdsPreDetalhe;
  CdsPreDetalhe.Data := CtrlPrePlanilhaRP.ListCdsDetalheRP(-1);


   // *** Instancia a classe ContaContabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                               Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');

  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;
  CdsTipoOper.Data  := ListTerceiros.ListTipoOper(True);

  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlCentroCusto := TCtrlCentroCusto.Create;
  CtrlCentroCusto.InitializeAs (CtrlContab);
  CdsCentroCusto.Data := CtrlCentroCusto.ListaCentroCusto (Sistema.IdEmpresa);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('PANCONTABASE')).EditMask := CtrlContab.MascaraContaParam + ';0; ';

  // *** Adiciona filtro no monta select ***
  MontaSelect.Filtro.Add('PREPLANILHA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));

  // *** Iniciliza parametros para as contas ***
  cmccContaOrigem.Plano    := CtrlContab.PlanoParam;
  cmccContaOrigem.Mascara  := CtrlContab.MascaraContaParam;
  cmccContaDestino.Plano   := CtrlContab.PlanoParam;
  cmccContaDestino.Mascara := CtrlContab.MascaraContaParam;
  pnlPlanoPatroC.Visible   := Sistema.UsaPlanoPatro;


end;

procedure TfrmCadRateioProgMT.rgTipoContaClick(Sender: TObject);
begin
  inherited;
  cmccContaOrigem.Enabled  := rgTipoConta.ItemIndex = 0;
  cmccContaDestino.Enabled := rgTipoConta.ItemIndex = 1;
  dbrePerc.Enabled         := (rgTipoConta.ItemIndex = 1) and (grpContaperc.ItemIndex = 1);
  if rgTipoConta.ItemIndex = 0 then begin
     cdsPreDetalhe.FieldByName('PLACONTA').Clear;

     dblkCCusto.Enabled := True;
     dblcPlanoPrevC.Enabled := True;
     dblcPatroC.Enabled := True;
     dblcHistPadrao.Enabled := True;
     dblkTipoOper.Enabled := True;
  end;
  if rgTipoConta.ItemIndex = 1 then begin
     cdsPreDetalhe.FieldByName('PANCONTABASE').Clear;

     if (grpContaperc.ItemIndex = 1) then begin
        cdsPreDetalhe.FieldByName('CODCENTROCUSTO').Clear;
        cdsPreDetalhe.FieldByName('IDPLANOPREV').Clear;
        cdsPreDetalhe.FieldByName('IDPATRO').Clear;
        dblkCCusto.Enabled := False;
        dblcPlanoPrevC.Enabled := False;
        dblcPatroC.Enabled := False;
     end;
     dblcHistPadrao.Enabled := False;
     dblkTipoOper.Enabled := False;
     cdsPreDetalhe.FieldByName('HITCODHIST').Clear;
     cdsPreDetalhe.FieldByName('TIPCODIGO').Clear;
  end;

  if not dbrePerc.Enabled then cdsPreDetalhe.FieldByName('PANPERC').Clear;

end;

procedure TfrmCadRateioProgMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
    //  inherited;
    Cds.Data := CtrlPrePlanilhaRP.ListPrePlanilha(Cds.FieldByName('PANCODIGO').asFloat,
                                  Sistema.IdEmpresa,Cds.FieldByName('PANIDENTIFICACAO').asString);

    //*** Abre o cds filho (detalhe) ***
    CdsPreDetalhe.Data := CtrlPrePlanilhaRP.ListCdsDetalheRP(Cds.FieldByName('PANCODIGO').asFloat);
    TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
    TStringField(CdsPreDetalhe.FieldByName('PANCONTABASE')).EditMask := CtrlContab.MascaraContaParam + ';0; ';

end;

procedure TfrmCadRateioProgMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=   CtrlPrePlanilhaRP.Apagar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;
end;

procedure TfrmCadRateioProgMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=   CtrlPrePlanilhaRP.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadRateioProgMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=   CtrlPrePlanilhaRP.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadRateioProgMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsPreDetalhe.First;
   while Not CdsPreDetalhe.Eof do
      CdsPreDetalhe.Delete;

  inherited;

end;

procedure TfrmCadRateioProgMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var iContCO  : Integer;
    rCem,rTotPerc : Double;

begin
  inherited;

   If edDescAutomatico.Text = '' Then
   Begin
     MsgDlg('Nome da planilha não foi preenchido','Erro',mtError,[mbOk],0);
     edDescAutomatico.SetFocus;
     Accept := false;
   End;

   If CtrlPrePlanilhaRP.PlanilhaTemNomesIguais(Trim(edDescAutomatico.Text),Cds.FieldByName('PANCODIGO').AsFloat) Then
   Begin
      MsgDlg('Já existe uma planilha cadastrada com esse nome','Erro',mtError,[mbOk],0);
      edDescAutomatico.SetFocus;
      Accept := false;
   End;


   //
   iContCO := 0;
   rTotPerc:= 0;
   CdsPreDEtalhe.First;
   While not CdsPreDEtalhe.EOF do
   Begin

      If not CdsPreDetalhe.FieldByName('PANCONTABASE').IsNull Then
         iContCO := iContCO + 1;

      If (CdsPreDetalhe.FieldByName('PANCONTABASE').IsNull) And
         (CdsPreDetalhe.FieldByName('PLACONTA').IsNull) Then
      Begin
        MsgDlg('Obrigatório preencher a Conta Origem ou a Destino','Erro',mtError,[mbOk],0);
        edDescAutomatico.SetFocus;
        Accept := false;
     End;

      If not CdsPreDetalhe.FieldByName('PLACONTA').IsNull Then
      Begin
         If cmccContaDestino.Valida <> VcOk Then
         Begin
            edDescAutomatico.SetFocus;
            Accept := false;
         End;
      End;

      If Not CdsPreDetalhe.FieldByName('PANCONTABASE').IsNull Then
      Begin
         If cmccContaOrigem.Valida <> VcOk Then
         Begin
            edDescAutomatico.SetFocus;
            Accept := false;
         End;
      End;

      If (Cds.FieldByName('PANCONTAPERC').AsString = 'P') And (Not CdsPreDetalhe.FieldByName('PLACONTA').IsNull) Then
         rTotPerc := rTotPerc + CdsPreDetalhe.FieldByName('PANPERC').AsFloat;

      CdsPreDetalhe.Next;
   End;

   rCem:=100;
   If (Cds.FieldByName('PANCONTAPERC').AsString = 'P') and (Format('%17.2f',[rTotPerc]) <> Format('%17.2f',[rCem])) Then
   Begin
      MsgDlg('O Somatório dos Percentuais das contas de destino deve ser de 100%.','Erro',mtError,[mbOk],0);
      edDescAutomatico.SetFocus;
      Accept := false;
   End;

   If iContCO = 0  Then
   Begin
      MsgDlg('Obrigatório ter pelo menos uma Conta Origem','Erro',mtError,[mbOk],0);
      edDescAutomatico.SetFocus;
      Accept := false;
   End;

   If iContCO > 1 Then
   Begin
      MsgDlg('Somente é possível ter uma Conta Origem','Erro',mtError,[mbOk],0);
      edDescAutomatico.SetFocus;
      Accept := false;
   End;

end;

procedure TfrmCadRateioProgMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edDescAutomatico.SetFocus
end;

procedure TfrmCadRateioProgMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  //Redesenha o form na volta do MontaSelect
  Repaint;

  If MontaSelect.RetornouValor Then
  Begin

    //*** Abre o cds princial (mestre) ***
    Cds.Data := CtrlPrePlanilhaRP.ListPrePlanilha(StrToFloat(MontaSelect.ValoresChave[0]),Sistema.IdEmpresa,MontaSelect.ValoresChave[1]);

    //*** Abre o cds filho (detalhe) ***
    CdsPreDetalhe.Data := CtrlPrePlanilhaRP.ListCdsDetalheRP(StrToFloat(MontaSelect.ValoresChave[0]));
    TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
    TStringField(CdsPreDetalhe.FieldByName('PANCONTABASE')).EditMask := CtrlContab.MascaraContaParam + ';0; ';

  End;

end;

procedure TfrmCadRateioProgMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;

  If CdsPreDetalhe.FieldByName('PANCONTABASE').IsNull Then
     rgTipoConta.ItemIndex := 1
  Else
     rgTipoConta.ItemIndex := 0;

  cmccContaOrigem.Enabled  := rgTipoConta.ItemIndex = 0;
  cmccContaDestino.Enabled := rgTipoConta.ItemIndex = 1;
  dbrePerc.Enabled         := (rgTipoConta.ItemIndex = 1) And (grpContaperc.ItemIndex = 1);

  rgTipoConta.SetFocus;

end;

procedure TfrmCadRateioProgMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cmccContaOrigem.Enabled  := rgTipoConta.ItemIndex = 0;
  cmccContaDestino.Enabled := rgTipoConta.ItemIndex = 1;
  dbrePerc.Enabled         := (rgTipoConta.ItemIndex = 1) And (grpContaperc.ItemIndex = 1);

  CdsPreDetalhe.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
  CdsPreDetalhe.FieldByName('PLANO').AsInteger             := CtrlContab.PlanoParam;
  CdsPreDetalhe.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
  CdsPreDetalhe.FieldByName('IDEMPRESA').AsInteger         := Sistema.IdEmpresa;


  rgTipoConta.SetFocus;

end;

procedure TfrmCadRateioProgMT.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Data := CtrlPrePlanilhaRP.ListPrePlanilha(-1,-1,'');
  inherited;

  // *** Iniciliza o cdsmestre com os parametros default ***
  Cds.FieldByName('PANIDENTIFICACAO').AsString := 'G';
  Cds.FieldByName('PANINATIVO').AsString       := 'N';
  Cds.FieldByName('IDPESSOA').AsInteger        := Sistema.IdEmpresa;
  Cds.FieldByName('PANCONTAPERC').AsString     := 'C';
  Cds.FieldByName('FLGPERIODOGERA').AsString   := 'P';
  Cds.FieldByName('FLGINTEGRAPLAN').AsString   := 'N';

  CdsPreDetalhe.Data := CtrlPrePlanilhaRP.ListCdsDetalheRP(Cds.FieldbyName('PANCODIGO').asInteger);

  If edDescAutomatico.CanFocus Then edDescAutomatico.SetFocus;

end;

procedure TfrmCadRateioProgMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

 CtrlPrePlanilhaRP.Free;
 CtrlContab.Free;
 CtrlContaContabil.Free;
 CtrlHistoContab.Free;
 ListTerceiros.Free;
 CtrlCentroCusto.Free;

end;

procedure TfrmCadRateioProgMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPrePlanilhaRP.MessageInfo <> '' Then
     MsgDlg(CtrlPrePlanilhaRP.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadRateioProgMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlPrePlanilhaRP.ListPrePlanilha(-1,-1,'');
  CdsPreDetalhe.Data := CtrlPrePlanilhaRP.ListCdsDetalheRP(-1);

end;

procedure TfrmCadRateioProgMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if CdsPreDetalhe.State in [dsEdit, dsInsert] then begin

    CdsPreDetalhe.FieldByName('PATRO').AsString := dblcPatroC.Text;
    CdsPreDetalhe.FieldByName('PLANPREVCONTABIL').AsString := dblcPlanoPrevC.Text;
    if dblkCCusto.Text <> '' then
       CdsPreDetalhe.FieldByName('CODEXTERNO').AsString := CdsCentroCusto.FieldByName('CODEXTERNO').AsString
    else
       CdsPreDetalhe.FieldByName('CODEXTERNO').Clear;

  end;


  if (Cds.FieldByName('PANCONTAPERC').AsString = 'C') and (not CdsPreDetalhe.FieldByName('PLACONTA').IsNull) then begin
     if (not CdsPreDetalhe.FieldByName('IDPATRO').IsNull) or
        (not CdsPreDetalhe.FieldByName('IDPLANOPREV').IsNull) or
        (not CdsPreDetalhe.FieldByName('CODCENTROCUSTO').IsNull) then
        MessageDlg ('O cadastramento dos campos "Centro de Custos", "Plano" ou "Patrocinadora", em contas de "Destino", ' + #13 +
                    'para planilhas de rateio por "Conta", serve apenas para se apurar o percentual a ser rateado para elas. ' + #13 +
                    'O lançamento contábil, referente a estes campos, se dará pela origem do lançamento.', mtInformation, [mbok], 0);
  end;

end;

end.
