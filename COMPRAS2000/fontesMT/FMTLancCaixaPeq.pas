{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 25/02/2002                             }
{                                                       }
{*******************************************************}
{
----------------------------------------------------------------------------- 
Nº SOL: 224628-16384
Nº PPM: 475900
Data da Alteração: 25/09/2014
Responsável: Helio Lima Custodio
Alteração Form: Inclusão de fornecedores (grbFornecedor e CmpFornecedor)
Descrição: Incluir fornecedor no cadastro de lancamentos de caixa pequeno.
-----------------------------------------------------------------------------
Nº SOL......: 229349
Nº KINTANA..: 2063459
Data........: 03/04/2014
Responsável.: Marcio Sanches Spinosa SOL 229349 Kintana 2063459
Descrição...: Validação da Subdespesa
-----------------------------------------------------------------------------
Nº SOL......: 222761/15547
Nº KINTANA..: 2056128
Data........: 20/12/2013
Responsável.: Marcio Sanches Spinosa SOL 222761/15547 Kintana 2056128
Descrição...: Validação da Subdespesa
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}
{--------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina ......: FormCreate e CmeCadastroFind
SOL..........: 163982/6901
Kintana......: 1472467
Data.........: 01/11/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foram alteradas estas rotinas para que o combo Box Atividade/
               Projeto retornem apenas as atividades analiticas e Ativas.
--------------------------------------------------------------------------------}
//Marcus Oliveira P. 35483 24/07/2007
// Correção Marcus Oliveira - 25747 - 02/07/2007 - Comentada essa linha -- " dblcTipoRecDeb.Enabled := False; "  no
//  momento do insert.
// andre tavares - 09/09/2006 - pendência 21512 - se não tem compromisso, entãp o idreservaorcamen deve ser nulo e não igual a zero.
// andre tavares - 06/01/2006 - pendência 18505 - implementação da integração do caixa pequeno com o orçamento.
unit FMTLancCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlCaixaPequeno,uCtrlListCAPCAR,uCtrlUnidNegocio,
  uCtrlCentroCusto,uCtrlCentRespon, uCtrlContaContabil,uCtrlIntegracaoContabil,
  uCtrlLancamento,  uCtrlPrograma,
  Mask, wwdbedit, CMDBLookupCombo, DBCtrls, Wwdbspin ,uCMTypes, CMProcuraSubTipo,
  CMProcuraMask, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, uIntegraBack,
  uCtrlOrcamento,
  uCtrlCadUsuxCResp, uctrlPadroes, CMProcura;
type
  TfrmMTLancCaixaPeq = class(TFrmCadastroMT)
    Label1: TLabel;
    dblcCaixaPeq: TCMDBLookupCombo;
    memSCI: TMemo;
    btnSCI: TSpeedButton;
    btnApaga: TSpeedButton;
    Label5: TLabel;
    edNumDoc: TDBEdit;
    Label2: TLabel;
    edDatalanc: TCMDateTimePicker;
    Label3: TLabel;
    edValLanc: TDBRealEdit;
    Label6: TLabel;
    memHist: TDBMemo;
    Label8: TLabel;
    dblcCentCust: TCMDBLookupCombo;
    Label11: TLabel;
    dblcPrograma: TCMDBLookupCombo;
    Label10: TLabel;
    dblcTipoRecDeb: TCMDBLookupCombo;
    Label7: TLabel;
    dblcCentResp: TCMDBLookupCombo;
    lblSubConta: TLabel;
    dblcSubConta: TwwDBLookupCombo;
    Label9: TLabel;
    dblcUnNegoc: TCMDBLookupCombo;
    cmpContab: TCMProcuraMaskContabil;
    cdsTipoDesemb: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    msSCI: TMontaSelect;
    cdsCxPeq: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    Label23: TLabel;
    CboSubDespesa: TCMDBLookupCombo;
    grbFornecedor: TGroupBox;
    CmpFornecedor: TCMProcura;
    MSFornecedor: TMontaSelect;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure btnSCIClick(Sender: TObject);
    procedure btnApagaClick(Sender: TObject);
    procedure dblcTipoRecDebCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmpContabExit(Sender: TObject);
    procedure dblcCentCustCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcProgramaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCaixaPeqChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CdsLocal     : TClientDataSet;
    CaixaPequeno : TCtrlCaixaPequeno;
    ListCAPCAR   : TCtrlListCAPCAR;
    Lancamento   : TCtrlLancamento;
    Programa     : TCtrlPrograma;
    UnidNegocio  : TCtrlUnidNegocio;
    CentroCusto  : TCtrlCentroCusto;
    CentRespon   : TCtrlCentRespon;
    ContaContabil: TCtrlContaContabil;
    CtrlOrcamento: TOrcamentoBackMT;

    CtrlCadUsuxCResp : TCtrlCadUsuxCResp;

    //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    cdsSubDespesa: TClientDataSet;
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

    IntegracaoContabil : TCtrlIntegracaoContabil;
    procedure Sel (n : Double);
    procedure LeContaSCI(sCodArt,sCodCentroCusto,sGrupoProd: String;iCodAlmox : Integer; var sConta,
                        sSubConta: String);

    //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    Procedure SetDataCdsSubDespesa;
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  public
  end;

var
  frmMTLancCaixaPeq: TfrmMTLancCaixaPeq;
  iIdSCI          : Double;
  iIdItemSCI      : Double;
  iIdItemSCIAnt   : Double;
  rQtdePedAnt     : Double;
  sCodArtigo      : String;
  sIdCxPeq        : String;
  sCentResp       : String;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados, uCtrlParamIntegra,uString;

{$R *.DFM}

procedure TfrmMTLancCaixaPeq.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If Trim(dblcCaixaPeq.Text) = '' then
      Begin
         MsgDlg('Caixa Pequeno não preenchido','Erro',mtError,[mbOK],0);
         dblcCaixaPeq.SetFocus;
         Accept := False;
      End
  Else
  If Trim(edDatalanc.Text) = '' then
      Begin
         MsgDlg('Data do lançamento não preenchido','Erro',mtError,[mbOK],0);
         edDatalanc.SetFocus;
         Accept := False;
      End
  Else
  If edValLanc.Value <= 0 then
      Begin
         MsgDlg('Valor do lançamento não pode ser menor ou igual a zero','Erro',mtError,[mbOK],0);
         edValLanc.SetFocus;
         Accept := False;
      End
  Else
  If (cdsCxPeq.FieldByName('VLRMAXLANC').AsFloat > 0) And (edValLanc.Value > cdsCxPeq.FieldByName('VLRMAXLANC').AsFloat) then
      Begin
         MsgDlg('Valor do lançamento não pode ser maior que '+Format('%15.2f',[cdsCxPeq.FieldByName('VLRMAXLANC').AsFloat]),'Erro',mtError,[mbOK],0);
         edValLanc.SetFocus;
         Accept := False;
      End
  Else
  If Not CaixaPequeno.VerificaSaldoCxPeq(Cds.FieldByName('IDCAIXAPEQUENO').asFloat, edValLanc.Value) then
      Begin
         MsgDlg('Valor do lançamento ultrapassa o saldo disponível','Erro',mtError,[mbOK],0);
         edValLanc.SetFocus;
         Accept := False;
      End
  Else
  If trim(memHist.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher o histórico do lançamento','Erro',mtError,[mbOK],0);
         memHist.SetFocus;
         Accept := False;
      End
  Else
  If trim(dblcTipoRecDeb.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher o Tipo de Desembolso','Erro',mtError,[mbOK],0);
         dblcTipoRecDeb.Enabled := True;
         dblcTipoRecDeb.SetFocus;
         Accept := False;
      End
  Else
  If trim(dblcCentResp.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOK],0);
         dblcCentResp.Enabled := True;
         dblcCentResp.SetFocus;
         Accept := False;
      End
  Else
  If trim(dblcUnNegoc.Text) = '' then
      Begin
         MsgDlg('Obrigatório preencher a Atividade/Projeto','Erro',mtError,[mbOK],0);
         dblcUnNegoc.Enabled := True;
         dblcUnNegoc.SetFocus;
         Accept := False;
      End
  Else
  //Marcio Sanches Spinosa SOL 222761/15547 Kintana 2056128 - Inicio
  If (CboSubDespesa.Selected.Text = EmptyStr) then
  begin
     MsgDlg('Informe a sub-despesa para o deseembolso','Erro',mtError,[mbOK],0);
     CboSubDespesa.Enabled := True;
     CboSubDespesa.SetFocus;
     Accept := False;
  end
  else
  //Marcio Sanches Spinosa SOL 222761/15547 Kintana 2056128 - Fim
  If ParamIntegra.IntegraContab Then
     Begin
        cmpContab.MostraMensagens := True;
        If cmpContab.Valida <> vcOK then
            Begin
               cmpContab.Enabled := True;
               cmpContab.SetFocus;
               Accept := False;
            End
        Else
        If (cmpContab.Conta.ObrigaSubConta) And (Trim(dblcSubConta.Text) = '') Then
           Begin
               MsgDlg('Conta obriga Sub-Conta','Erro',mtError,[mbOK],0);
               cdsSubConta.Data := ContaContabil.ListContasxSC(ParamIntegra.Plano,Sistema.idEmpresa,0,cmpContab.Conta.Numero,toNome);
               dblcSubConta.Enabled := True;
               dblcSubConta.SetFocus;
               Accept := False;
           End
        Else
        If (cmpContab.Conta.ObrigaCentrodeCusto) And (Trim(dblcCentCust.Text) = '') Then
           Begin
               MsgDlg('Conta obriga Centro de Custo','Erro',mtError,[mbOK],0);

               { Inclusão de parâmetro que indica se apenas os centros de custo ativos serão exibidos. }
               cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,ParamIntegra.Plano,cmpContab.Conta.Numero,tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ) );

               dblcCentCust.Enabled := True;
               dblcCentCust.SetFocus;
               Accept := False;
           End;
     End;
     sIdCxPeq  := dblcCaixaPeq.LookupValue;
     sCentResp := dblcCentResp.LookupValue;
     Cds.FieldByName('NUMSOLCOMPRA').AsFloat := iIDSCI;
     Cds.FieldByName('IDITEMSOLI').AsFloat   := iIDItemSCI;
     Cds.FieldByName('CODARTIGO').AsString   := sCodArtigo;
     Cds.FieldByName('RECPAG').AsString      := 'P';

//Marcio Sanches Spinosa SOL 229349 Kintana 2063459 - Inicio
     if CboSubDespesa.DisplayValue = EmptyStr then
        Cds.FieldByName('IDDESPESAORC').AsInteger := -1;
//Marcio Sanches Spinosa SOL 229349 Kintana 2063459 - Fim

end;

procedure TfrmMTLancCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;

  Lancamento    := TCtrlLancamento.Create;
  Lancamento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  Programa    := TCtrlPrograma.Create;
  Programa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  CaixaPequeno := TCtrlCaixaPequeno.Create;
  CaixaPequeno.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  ListCAPCAR := TCtrlListCAPCAR.Create;
  ListCAPCAR.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  CentRespon := TCtrlCentRespon.Create;
  CentRespon.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  ContaContabil  := TCtrlContaContabil.Create;
  ContaContabil.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  IntegracaoContabil    := TCtrlIntegracaoContabil.Create;
  IntegracaoContabil.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlCadUsuxCResp  := TCtrlCadUsuxCResp.Create;
  CtrlCadUsuxCResp.InitializeAs(padroes);


  CtrlOrcamento := TOrcamentoBackMT.Create;
  CtrlOrcamento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  CtrlOrcamento.IdEmpresa := sistema.IdEmpresa;
  CtrlOrcamento.IdUsuario := sistema.IdUsuario;

  CaixaPequeno.CdsCaixaPequeno := cds;
  //
  sIdCxPeq  := '';
  sCentResp := '';
  MontaSelect.Filtro.Add('USUARIOXCAIXAPEQ.IDUSUARIO ='+IntToStr(Sistema.IdUsuario));
  MontaSelect.Filtro.Add('LANCCAIXAPEQ.IDPESSOA  ='+IntToStr(Sistema.IdEmpresa));
  msSCI.Filtro.Add('SOLICOMP.IDPESSOA  ='+IntToStr(Sistema.IdEmpresa));
  if ParamIntegra.IntegraContab Then
     Begin
        cmpContab.Plano    := ParamIntegra.Plano;
        cmpContab.Mascara  := ParamIntegra.MascaraPlano;
     end
  else
     cmpContab.Enabled  := False;
  //
  //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  cdsSubDespesa             := TClientDataSet.Create(nil);
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  Sel(-1);
  //Vinicius Maciel - SOL 163982/6901 KTN 1472467
  //cdsAtivProj.Data     := UnidNegocio.ListaUnidNegocio(Sistema.idEmpresa,0,'',tapSoAnaliticaAP,toapNome);
  cdsAtivProj.Data     := UnidNegocio.ListaUnidNegocioAtivas(Sistema.idEmpresa);
  //Vinicius Maciel - SOL 163982/6901 KTN 1472467  - FIM
  cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,0,'',tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ));

  cdsPrograma.Data     := Programa.ListaPrograma;

  sqlAux.Prepare;
  sqlAux.SQL.Clear;
  sqlAux.SQL.Add('SELECT FLGACESSLANCDOC FROM PARAMCOMPRAS');
  sqlAux.Open;

  if cdsAux.FieldByName('FLGACESSLANCDOC').AsString = 'S' then
     cdsCentroRespon.Data := CtrlCadUsuxCResp.ProcuraSelecionados(Sistema.IdUsuario,Sistema.IdEmpresa)
  else
     cdsCentroRespon.Data := CentRespon.ListaCentResponXUsu(0,Sistema.idEmpresa,tcrSoAnalitica,tocrNome);

  cdsSubConta.Data     := ContaContabil.ListContasxSC(ParamIntegra.Plano,Sistema.idEmpresa,0,'',toNome);
  cdsCxPeq.Data        := CaixaPequeno.ListaCaixaPequeno(Sistema.IdEmpresa,Sistema.IdUsuario,0,False);

  //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  CboSubDespesa.LookupTable := cdsSubDespesa;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

end;

procedure TfrmMTLancCaixaPeq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CaixaPequeno.Free;
  ListCAPCAR.Free;
  Lancamento.Free;
  Programa.Free;
  ContaContabil.Free;
  IntegracaoContabil.Free;
  CentroCusto.Free;
  CentRespon.Free;
  UnidNegocio.Free;
  CtrlOrcamento.Free;

  inherited;
end;

procedure TfrmMTLancCaixaPeq.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  btnApaga.click;
  cds.FieldByName('DATALANC').asDateTime := Date;
  cds.FieldByName('IDPESSOA').AsFloat    := Sistema.idEmpresa;
  cds.FieldByName('PLANO').asFloat       := ParamIntegra.Plano;
  edDatalanc.Date := Date;
  If sIdCxPeq <> '' Then
     Begin
        Cds.FieldbyName('IDCAIXAPEQUENO').AsFloat   := StrToFloat(sIdCxPeq);
        Cds.FieldbyName('CODCENTRORESPON').AsString := sCentResp;
     End;
  iIDSCI        := 0;
  iIDItemSCI    := 0;
  sCodArtigo    := '';
  iIdItemSCIAnt := 0;
  rQtdePedAnt   := 0;

  { Inclusão de parâmetro que indica se apenas os centros de custo ativos serão exibidos. }
  cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,0,'',tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ));

  dblcCaixaPeq.SetFocus;
end;

procedure TfrmMTLancCaixaPeq.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  { Inclusão de parâmetro que indica se apenas os centros de custo ativos serão exibidos. }
  cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto( 0, Sistema.idEmpresa,0,'',tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ) );

  dblcCaixaPeq.SetFocus;
  Cds.FieldByName('PLANO').asFloat     := ParamIntegra.Plano;
end;

procedure TfrmMTLancCaixaPeq.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
     //Vinicius Maciel - SOL 163982/6901 KTN 1472467
     if((dblcUnNegoc.Text = '') and (dblcUnNegoc.LookupValue <> '')) then
     dblcUnNegoc.Text := UnidNegocio.recuperaAtividadePerd(dblcUnNegoc.LookupValue)
     //Vinicius Maciel - SOL 163982/6901 KTN 1472467 - FIM
  end;

end;

procedure TfrmMTLancCaixaPeq.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CaixaPequeno.AplicaOperacaoLancCxPeq(opApagar,iIdItemSCIAnt, rQtdePedAnt,
            sistema.IdEmpresa, sistema.IdUsuario );
end;

procedure TfrmMTLancCaixaPeq.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CaixaPequeno.AplicaOperacaoLancCxPeq(opAlterar,iIdItemSCIAnt,rQtdePedAnt,
            sistema.IdEmpresa, sistema.IdUsuario );
end;

procedure TfrmMTLancCaixaPeq.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);

begin
  inherited;

  Accept := CaixaPequeno.AplicaOperacaoLancCxPeq(opInserir,iIdItemSCIAnt,rQtdePedAnt,
            sistema.IdEmpresa, sistema.IdUsuario );
end;

procedure TfrmMTLancCaixaPeq.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if CaixaPequeno.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ CaixaPequeno.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmMTLancCaixaPeq.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Sel(cds.FieldByName('IDLANCCXPEQ').AsFloat);
end;


procedure TfrmMTLancCaixaPeq.btnSCIClick(Sender: TObject);
Var
   sConta,sSubConta,sTipoDesmb: String;
begin
  inherited;

  msSCI.Executar;
  If msSCI.RetornouValor Then
    Begin
          iIdSCI     := StrToFloat( msSCi.ValoresChave[0]);
          iIdItemSCI := StrToFloat( msSCi.ValoresChave[6]);
          sCodArtigo := msSCI.ValoresChave[1];
          LeContaSCI(sCodArtigo,msSCi.ValoresChave[3],msSCi.ValoresChave[7],StrToInt(msSCi.ValoresChave[8]),sConta, sSubConta);
          //
          If (ParamIntegra.IntegraContab) and (Trim(sConta) <> '') Then
             Begin
                Cds.FieldByName('PLACONTA').asString := sConta;
                cmpContab.MostraMensagens := False;
                If cmpContab.Valida = vcOK Then
                   Begin
                      cmpContab.Enabled    := False;
                      dblcCentCust.Enabled := cmpContab.Conta.ObrigaCentrodeCusto;
                      if cmpContab.Conta.ObrigaCentrodeCusto then
                         { Inclusão de parâmetro que indica se apenas os centros de custo ativos serão exibidos. }
                         cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,ParamIntegra.Plano,cmpContab.Conta.Numero,tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ));

                      dblcSubConta.Enabled := cmpContab.Conta.ObrigaSubConta;
                      if cmpContab.Conta.ObrigaSubConta then
                         cdsSubConta.Data     := ContaContabil.ListContasxSC(ParamIntegra.Plano,Sistema.idEmpresa,0,cmpContab.Conta.Numero,toNome);
                   End;
             End
          Else
             Begin
                cmpContab.Enabled := True;
             End;
          If Trim(sSubConta) <> '' Then
             Begin
                Cds.FieldByName('CODSUBCONTA').asString := sSubConta;
                dblcSubConta.Enabled := False;
             End
          Else
             Begin
               dblcSubConta.Text    := '';
             End;
          sTipoDesmb := msSCI.ValoresChave[9];
          If Trim(sTipoDesmb) <> '' Then
             Begin
                Cds.FieldByName('CODTIPRECDES').asString := sTipoDesmb;
                dblcTipoRecDeb.Enabled := False;
             End
          Else
             Begin
               dblcTipoRecDeb.Text    := '';
               dblcTipoRecDeb.Enabled := True;
             End;

          //
          memSCI.Lines.Clear;
          memSCI.Lines.Insert(0,'SCI Nº : '+msSCI.ValoresChave[0]);
          memSCI.Lines.Insert(1,'ARTIGO : '+msSCI.ValoresChave[2]);
          //
          dblcCentCust.Text := '';
          dblcCentResp.Text := '';
          dblcUnNegoc.Text  := '';
          //
          If Trim(msSCI.ValoresChave[3]) <> '' Then
             Begin
               Cds.FieldByName('CODCENTROCUSTO').AsString  := msSCI.ValoresChave[3];
               dblcCentCust.Enabled := False;
             End;
          //
          If Trim(msSCI.ValoresChave[4]) <> '' Then
             Begin
               Cds.FieldByName('CODCENTRORESPON').AsString  := msSCI.ValoresChave[4];
               dblcCentResp.Enabled := False;
             End
          Else
             dblcCentResp.Enabled := True;
          //
          If Trim(msSCI.ValoresChave[5]) <> '' Then
             Begin
               Cds.FieldByName('UNIDNEGOC').AsFloat  := StrToFloat(msSCI.ValoresChave[5]);
               dblcUnNegoc.Enabled := False;
             End
          Else
             dblcUnNegoc.Enabled := True;
    End;
end;

procedure TfrmMTLancCaixaPeq.btnApagaClick(Sender: TObject);
begin
  inherited;
  iIdSCI     := 0;
  iIdItemSCI := 0;
  sCodArtigo := '';
  memSCI.Lines.Clear;
  memSCI.Lines.Insert(0,'SCI Nº : ');
  memSCI.Lines.Insert(1,'ARTIGO : ');
  //
  if cds.State in [dsInsert,dsEdit] Then
    Begin
      cds.FieldByName('PLACONTA').Clear;
      cds.FieldByName('CODSUBCONTA').Clear;
    End;
  cmpContab.Enabled    := True;
  dblcSubConta.Text    := '';
  //
  dblcTipoRecDeb.Text  := '';
  dblcCentCust.Text    := '';
  dblcCentResp.Text    := '';
  dblcUnNegoc.Text     := '';
  //
  dblcTipoRecDeb.Enabled := True;
  dblcCentResp.Enabled   := True;
  dblcUnNegoc.Enabled    := True;
  //
  dblcTipoRecDeb.CloseUp( True );
end;

procedure TfrmMTLancCaixaPeq.dblcTipoRecDebCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dblcTipoRecDeb.Text) <> '') Then
  Begin
     If (ParamIntegra.IntegraContab) and (iIdItemSCI <= 0) Then
     Begin
        If dblcPrograma.LookupValue <> '' Then
           cds.FieldByName('PLACONTA').asString := Lancamento.BuscaContaContabil(Sistema.idEmpresa,StrToInt(dblcPrograma.LookupValue), dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue,'P')
        Else
           cds.FieldByName('PLACONTA').asString := Lancamento.BuscaContaContabil(Sistema.idEmpresa,-1, dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue,'P');

        cmpContab.MostraMensagens := False;
        If cmpContab.Valida = vcOK Then
        Begin
           cmpContab.Enabled    := False;
           if cmpContab.Conta.ObrigaCentrodeCusto then
             { Inclusão de parâmetro que indica se apenas os centros de custo ativos serão exibidos. }
              cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,ParamIntegra.Plano,cmpContab.Conta.Numero,tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ));

           dblcSubConta.Enabled := cmpContab.Conta.ObrigaSubConta;
           if cmpContab.Conta.ObrigaSubConta then
              cdsSubConta.Data := ContaContabil.ListContasxSC(ParamIntegra.Plano,Sistema.idEmpresa,0,cmpContab.Conta.Numero,toNome);
        End Else
        begin
           cmpContab.Enabled    := True;
           dblcSubConta.Enabled := False;

           if  dblcTipoRecDeb.CanFocus then
             dblcTipoRecDeb.SetFocus;
             
        end;
     End;

     //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     //SetDataCdsSubDespesa;
     //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  End;
end;

procedure TfrmMTLancCaixaPeq.Sel(n: Double);
begin
   Cds.Data := CaixaPequeno.ProcurarLancCxPeq(n);

   cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto( 0, Sistema.idEmpresa,0,'',tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ) );

   //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   SetDataCdsSubDespesa;
   //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  if cmpContab.Conta.ObrigaSubConta then
     cdsSubConta.Data := ContaContabil.ListContasxSC(ParamIntegra.Plano,Sistema.idEmpresa,0,cmpContab.Conta.Numero,toNome);
   If Not cds.FieldByName('NUMSOLCOMPRA').IsNull Then
      Begin
         memSCI.Lines.Clear;
         memSCI.Lines.Insert(0,'SCI Nº : '+IntToStr(cds.FieldByName('NUMSOLCOMPRA').asInteger));
         memSCI.Lines.Insert(1,'ARTIGO : '+cds.FieldByName('DESCPROD').asString);
      end;
   If Not Cds.FieldByName('IDITEMSOLI').IsNull Then
      Begin
         iIDSCI        := Cds.FieldByName('NUMSOLCOMPRA').AsFloat;
         iIDItemSCI    := Cds.FieldByName('IDITEMSOLI').AsFloat;
         sCodArtigo    := Cds.FieldByName('CODARTIGO').AsString;
         iIdItemSCIAnt := Cds.FieldByName('IDITEMSOLI').AsFloat;
         rQtdePedAnt   := Cds.FieldByName('QTDEPEDIDA').AsFloat;
      End
   Else
      Begin
         iIDSCI        := 0;
         iIDItemSCI    := 0;
         sCodArtigo    := '';
         iIdItemSCIAnt := 0;
         rQtdePedAnt   := 0;
      End;
end;

procedure TfrmMTLancCaixaPeq.LeContaSCI(sCodArt,sCodCentroCusto,sGrupoProd: String;iCodAlmox : Integer; var sConta,
  sSubConta: String);
Begin
  cdsAux.Data := IntegracaoContabil.PegaContaContab(Sistema.idempresa,sCodArt,sCodCentroCusto,
                                                    iCodAlmox,sGrupoProd);
  if not cdsAux.IsEmpty Then
     Begin
        sConta    := cdsAux.FieldByName('CONTASAIDA').asString;
        sSubConta := cdsAux.FieldByName('SUBCONTASAIDA').asString;
     End
  Else
     Begin
        sConta    := '';
        sSubConta := '';
     End;
end;


procedure TfrmMTLancCaixaPeq.cmpContabExit(Sender: TObject);
begin
  inherited;
  if cmpContab.Conta.ObrigaCentrodeCusto then

     cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,ParamIntegra.Plano,cmpContab.Conta.Numero,tccSoAnalitica,toccNome, ( CmeCadastro.Operacao = opInserir ));

  if cmpContab.Conta.ObrigaSubConta then
     cdsSubConta.Data := ContaContabil.ListContasxSC(ParamIntegra.Plano,Sistema.idEmpresa,0,cmpContab.Conta.Numero,toNome);
end;

procedure TfrmMTLancCaixaPeq.dblcCentCustCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcPrograma.LookupValue <> '' Then
     cds.FieldByName('PLACONTA').asString := Lancamento.BuscaContaContabil(Sistema.idEmpresa,StrToInt(dblcPrograma.LookupValue), dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue,'P')
  Else
     cds.FieldByName('PLACONTA').asString := Lancamento.BuscaContaContabil(Sistema.idEmpresa,-1, dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue,'P');

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  SetDataCdsSubDespesa;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


end;

procedure TfrmMTLancCaixaPeq.dblcProgramaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcPrograma.LookupValue <> '' Then
     cds.FieldByName('PLACONTA').asString := Lancamento.BuscaContaContabil(Sistema.idEmpresa,StrToInt(dblcPrograma.LookupValue), dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue,'P')
  Else
     cds.FieldByName('PLACONTA').asString := Lancamento.BuscaContaContabil(Sistema.idEmpresa,-1, dblcTipoRecDeb.LookupValue,dblcCentCust.LookupValue,'P');

end;

procedure TfrmMTLancCaixaPeq.dblcCaixaPeqChange(Sender: TObject);
begin
  inherited;
  //Rotina para carregar a combo do Desembolso

  //Se não tiver fornecedor com desembolso carrega aqui, senão Tenta carrega pelo Ramo
  cdsTipoDesemb.Data   := CaixaPequeno.ListaPorFornecedor(Sistema.IdEmpresa, cdsCxPeq.FieldByName('IDFORCLI').AsString , ParamIntegra.RecPag);

  //Se tiver Ramo carregará aqui senão Trará todos
  if CdsTipoDesemb.IsEmpty then
     cdsTipoDesemb.Data   := CaixaPequeno.ListaPorRamo(Sistema.IdEmpresa, cdsCxPeq.FieldByName('IDFORCLI').AsString , ParamIntegra.RecPag);
  //Tras todos
  if CdsTipoDesemb.IsEmpty then
     cdsTipoDesemb.Data   := ListCAPCAR.ListaTipoRecebDesemb('P',Sistema.idEmpresa,tasSoAnalitica,tocpNome);

  If dblcTipoRecDeb.Enabled = False then
     dblcTipoRecDeb.Enabled := True;

end;

procedure TfrmMTLancCaixaPeq.FormDestroy(Sender: TObject);
begin
  inherited;
  //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  FreeAndNil(cdsSubDespesa);
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
end;

procedure TfrmMTLancCaixaPeq.SetDataCdsSubDespesa;
  Function GetFieldValue(ACDS : TClientDataSet; AFieldName : String; ANumerico : Boolean = False) : String;
  Begin
     if ANumerico then
        Result := '0'
     else
        Result := '';

     if (ACDS.FindField(AFieldName) <> NIL) Then
        Result := ACDS.FieldByName(AFieldName).AsString;

  End;
Var
  TipoDespesa : Integer;
begin
   Try
     TipoDespesa := StrToInt(GetFieldValue(Cds, 'PLACONTA', True)[4]);
   Except
     TipoDespesa := 0;
   End;

   cdsSubDespesa.Data := CtrlOrcamento.ListaSubDespesas(opapDesembolso,
                                                        GetFieldValue(cdsTipoDesemb,       'CODTIPRECDES'         ),
                                                        StrToFloat(GetFieldValue(cdsCxPeq, 'IDFORCLI'      , True)),
                                                        GetFieldValue(Cds,                 'CODCENTROCUSTO'       ),
                                                        Sistema.IdEmpresa,
                                                        TipoDespesa
                                                        );
end;

end.
