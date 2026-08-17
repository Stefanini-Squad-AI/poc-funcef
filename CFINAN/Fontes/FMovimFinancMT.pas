unit FMovimFinancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, wwdbedit, wwdblook,
  CMProcuraMask, uCtrlListTercFinanc, uCtrlHistPadrao, uCtrlMovimFinanc,
  uCtrlParamFinanc, uGeralFinanc, Provider, DBTables, Wwquery
  {$IFDEF VERSAO0505} ,uComum {$ELSE} ,uCMTypes, uCmSqlParams {$ENDIF};

const
   WM_AbandonaInclusaoDet = WM_User+1;
type
  TFrmMovimFinancMT = class(TFrmCadastroMestreDetMT)
    dblcPortador: TwwDBLookupCombo;
    lblCaixaBanco: TLabel;
    lblMoeda: TLabel;
    edMoeda: TEdit;
    Label7: TLabel;
    dblcHistPad: TwwDBLookupCombo;
    dbeHistorico: TwwDBEdit;
    lblHistorico: TLabel;
    lblValorMoeda: TLabel;
    dbrEntradaSaida: TDBRadioGroup;
    lblValor: TLabel;
    lblDocumento: TLabel;
    dbeDocumento: TwwDBEdit;
    lblData: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dbrConcilia: TDBRadioGroup;
    cbNaoContabiliza: TCheckBox;
    Label8: TLabel;
    dbeData: TDBEdit;
    lblHistPad: TLabel;
    pgcRateio: TPageControl;
    tbsRateioBasico: TTabSheet;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    lblTipoRD: TLabel;
    Label9: TLabel;
    lblMoedaDet: TLabel;
    lblValorOutDet: TLabel;
    lblValorDet: TLabel;
    Label1: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    dblcTipoDocumento: TwwDBLookupCombo;
    dblcCentroCusto: TwwDBLookupCombo;
    tbsPrevidenciario: TTabSheet;
    Label20: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    dblcPatrocinadorRateio: TwwDBLookupCombo;
    dblcPlanoPrevRateio: TwwDBLookupCombo;
    cdsPortadorConta: TCMClientDataSet;
    cdsHistPadrao: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsTipoRecDes: TCMClientDataSet;
    cdsDet: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    cdsContabil: TCMClientDataSet;
    dsContabil: TwwDataSource;
    tbsContabil: TTabSheet;
    pnlContabil: TPanel;
    pgcContabil: TPageControl;
    tbsBasicoContab: TTabSheet;
    lblValorMoedaCon: TLabel;
    lblValorCorrenteCon: TLabel;
    lblSubConta: TLabel;
    lblCCusto: TLabel;
    lblAtividade: TLabel;
    dbccConta: TCMProcuraMaskContabil;
    gbHistorico: TGroupBox;
    dbeHist1: TwwDBEdit;
    dbeHist2: TwwDBEdit;
    dbeHist3: TwwDBEdit;
    dbgDebitoCredito: TDBRadioGroup;
    dblcSubConta: TwwDBLookupCombo;
    dblcCCusto: TwwDBLookupCombo;
    dblcAtividade: TwwDBLookupCombo;
    tbsPrevidenciarioContab: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    dblcPatrocinadorContabil: TwwDBLookupCombo;
    dblcPlanoPrevContabil: TwwDBLookupCombo;
    dbgrdContabil: TwwDBGrid;
    sbtnEstornar: TToolbarButton97;
    sbtnMudaStatus: TToolbarButton97;
    cdsDetBackup: TCMClientDataSet;
    dbeValorMoedaDet: TDBRealEdit;
    edMoedaDet: TEdit;
    dbeValorDet: TDBRealEdit;
    dbeValorMoeda: TDBRealEdit;
    dbeValorCorrente: TDBRealEdit;
    dbeValorOMContab: TDBRealEdit;
    dbeValorCorrenteContab: TDBRealEdit;
    lblModulo: TLabel;
    lblNomeOrigem: TLabel;
    spTeste: TCMSqlParams;
    dbeUsuario: TDBEdit;
    sbtnCopiar: TToolbarButton97;
    cdsDetBack: TCMClientDataSet;
    cdsBack: TCMClientDataSet;
    cdsContabBack: TCMClientDataSet;
    dbeDataConciliacao: TDBEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcCentroResponChange(Sender: TObject);
    procedure dbccContaExit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnMudaStatusClick(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblcPortadorExit(Sender: TObject);
    procedure dblcSubContaEnter(Sender: TObject);
    procedure dbrConciliaChange(Sender: TObject);
    procedure dbeDataLancExit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbeValorMoedaEnter(Sender: TObject);
    procedure dbeValorMoedaExit(Sender: TObject);
    procedure dbeValorMoedaDetExit(Sender: TObject);
    procedure dblcCCustoEnter(Sender: TObject);
    procedure dbrEntradaSaidaChange(Sender: TObject);
    procedure dblcHistPadExit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dblcUnidNegocChange(Sender: TObject);
    procedure dblcCCustoChange(Sender: TObject);
    procedure dblcAtividadeChange(Sender: TObject);
    procedure dblcPortadorChange(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dblcTipoDocumentoEnter(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure cdsContabilAfterScroll(DataSet: TDataSet);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cdsDetAfterScroll(DataSet: TDataSet);
    procedure sbtnCopiarClick(Sender: TObject);
  private
    { Private declarations }
    bUsaUnidNeg       : Boolean;
    bUsaCRespon       : Boolean;
    bRegNaoIdent      : Boolean;
    bEstorna          : Boolean;
    bCalcImposto      : Boolean;
    sContaBanco       : String;
    sCCustoBanco      : String;
    rSubContaBanco    : Double;
    sContaNI          : String;
    sCCustoNI         : String;
    rValorCotacao     : Double;
    rSubContaNI       : Double;
    rCodPortador      : Double;
    rValorLancBackup  : Double;
    rSomaRatMoeCorr   : Double;
    rSomaRatOutraMoe  : Double;
    rPrxVlrRateioCorr : Double;
    rPrxVlrRateioOM   : Double;
    rSvValor          : Double;
    rSvValorOut       : Double;
    dDataLancFinanc   : TDateTime;
    sEntradaSaida     : String;
    CtrlMovimFinanc   : TCtrlMovimFinanc;
    CtrlListTerceiros : TCtrlListTercFinanc;
    CtrlHistPadrao    : TCtrlHistPadrao;
    CtrlParamFinanc   : TCtrlParamFinanc;
    GeralFinanc       : TGeralFinanc;
    bIncluido         : Boolean;
    DadosRateioVazio  : OleVariant;
    DadosContabVazio  : OleVariant;
    procedure CarregaComboTRD;
    procedure CarregaCdsMestDet(rCodLancFinanc: Double);
    procedure TestaUnNegCentroRespon;
    procedure DesfazImposto;
    procedure AbortaInclusaoDet(var Msg: TMessage); message WM_AbandonaInclusaoDet;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; bRegularizaNI: Boolean); reintroduce;
  end;

var
  FrmMovimFinancMT: TFrmMovimFinancMT;

implementation

uses dBaseDados, uSistema, uMensErro,FMudaStatusMT, FEstornoFinancMT,
     uCtrlParamIntegra;

{$R *.DFM}

constructor TFrmMovimFinancMT.Create(AOwner: TComponent;
  bRegularizaNI: Boolean);
begin
   bRegNaoIdent:=bRegularizaNI;
   inherited Create(AOwner);
   if bRegularizaNI then MontaSelect.Filtro.Add('MOVIMFINANC.STATUSCONCILIA = ''I''');
end;

procedure TFrmMovimFinancMT.FormCreate(Sender: TObject);
var
   rUnidNeg    : Double;
   cdsAux      : TCMClientDataSet;
begin
   inherited;
   sContaBanco:='';
   sCCustobanco:='';
   rSubContaBanco:=0;

   sContaNI:='';
   sCCustoNI:='';
   rSubContaNI:=0;

   sEntradaSaida:='E';
   dDataLancFinanc:=Date;
   rCodPortador:=0;

   rPrxVlrRateioCorr:=0;
   rPrxVlrRateioOM:=0;

   rSomaRatMoeCorr:=0;
   rSomaRatOutraMoe:=0;

   pgctrlDetalhe.ActivePageIndex:=0;
   pgcRateio.ActivePageIndex:=0;
   pgcContabil.ActivePageIndex:=0;

   pnlMestre.Enabled:=False;

   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc:=TCtrlMovimFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                            Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlHistPadrao
   CtrlHistPadrao:=TCtrlHistPadrao.Create;
   CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa GeralFinanc
   GeralFinanc:=TGeralFinanc.Create;
   GeralFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds do Combo de Contas Bancárias
   cdsPortadorConta.Data:=CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa);
   //Carrega cds do Combo de Históricos Padrões
   cdsHistPadrao.Data:=CtrlHistPadrao.ListHsitoricoPadrao(0);

   cdsAux:=TCMClientDataSet.Create(nil);
   try
      //Carrega cds dos Combos de Unidades de Negócio e Centros de Responsabilidade
      cdsAux.Data:=CtrlListTerceiros.ListParamGlobal(Sistema.IdEmpresa);
      bUsaUnidNeg:=(cdsAux.FieldByName('USAABC').AsString='S');
      bUsaCRespon:=(cdsAux.FieldByName('USACRESPON').AsString='S');
      rUnidNeg:=cdsAux.FieldByName('UNIDNEGOC').AsFloat;

      dblcUnidNegoc.Enabled:=bUsaUnidNeg;
      if bUsaUnidNeg then
         cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,0,'A','')
      else
         cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,rUnidNeg,'','');

      dblcCentroRespon.Enabled:=bUsaCRespon;
      if bUsaCRespon then
       begin
          //Carrega o cds de Centros de Responsabilidade com todos os centros de Responsabilidade
          // permitidos ao usuário corrente.
          //Caso o mesmo não tenha nenhuma restrição de centro de responsabilidade cadastrada,
          //todos os centros de responsabilidade serão carregados

          cdsCentroRespon.Data:=CtrlListTerceiros.ListCentroResponxUsuario(Sistema.IdEmpresa,
                                                                           Sistema.IdUsuario);
          cdsTipoRecDes.Data:=CtrlListTerceiros.ListTipoRDxCResponFinanc(-1,'','E'); //Vazio
       end
      else
       begin
          cdsCentroRespon.Data:=CtrlListTerceiros.ListCentroRespon(Sistema.IdEmpresa,'A','','9999999999');
          cdsTipoRecDes.Data:=CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
                                                                         '9999999999','E')
       end;

      //Lê Parâmetros da Contabilidade
      if (ParamIntegra.IntegraContab) then
       begin
          tbsContabil.Enabled:=True;
          dbccConta.Plano:=ParamIntegra.Plano;
          dbccConta.Mascara:=ParamIntegra.MascaraPlano;

          cdsAux.Close;
          cdsAux.Data:=CtrlListTerceiros.ListParamContab(Sistema.IdEmpresa);
          bEstorna:=(cdsAux.FieldByName('PACESTORNA').AsString='S');
       end
      else
         tbsContabil.Enabled:=False;

      //Lê Parametros do Movimento Financeiro (usados na Regularização de Não Identif.)
      cdsAux.Close;
      cdsAux.Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
      sContaNI:=cdsAux.FieldByName('CONTALANCNAOIDENT').AsString;
      sCCustoNI:=cdsAux.FieldByName('CCUSTOLANCNAOID').AsString;
      rSubContaNI:=cdsAux.FieldByName('SUBCONTANAOIDENT').AsFloat;
      bCalcImposto:=(cdsAux.FieldByName('FLGCALCIMPOSTO').AsString='S');

   finally
      cdsAux.Free;
   end;

   //Carrega cds do combo de Tipos de Documento
   cdsTipoDoc.Data:=CtrlListTerceiros.ListTipoDoc('');

   //Carrega cds do combo de Programas Previdenciários
   cdsPrograma.Data:=CtrlListTerceiros.ListPrograma;

   //Carrega cds do combo de Patrocinadores
   cdsPatrocinador.Data:=CtrlListTerceiros.ListPatrocinador;

   //Carrega cds do combo de Planos Previdenciários
   cdsPlanoPrev.Data:=CtrlListTerceiros.ListPlanoPrev;

   //Carrega cds do combo de Centros de Custo
   cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa,0,''); //vazio

   //Carrega cds do Combo de SubContas
   cdsSubConta.Data:=CtrlListTerceiros.ListSubConta(Sistema.IdEmpresa,ParamIntegra.Plano,''); //vazio

   //Carrega cds's Principais
   CarregaCdsMestDet(0);
   DadosRateioVazio:=cdsDet.Data;
   DadosContabVazio:=cdsContabil.Data;

   //Cds's de Backup
   cdsBack.Data:=Cds.Data;
   cdsDetBack.Data:=cdsDet.Data;
   cdsContabBack.Data:=cdsContabil.Data;

   MontaSelect.Filtro.Add('MOVIMFINANC.IDPESSOA = '+FloatToStr(Sistema.idempresa));

   //Associa Cds's
   CtrlMovimFinanc.CdsMovimFinanc:=cds;
   CtrlMovimFinanc.CdsRateioFinanc:=cdsDet;
   CtrlMovimFinanc.CdsContabil:=cdsContabil;

   //Acerta Título do Form conforme o tipo de operação escolhida
   if bRegNaoIdent then
    begin
       Self.Caption:='Regularização de Lançamentos Não Identificados';
       HelpContext:=90009;
       bbtnAjuda.HelpContext:=90009;
    end
   else
    begin
       Self.Caption:='Movimento Financeiro';
       HelpContext:=90005;
       bbtnAjuda.HelpContext:=90005;
    end;

   lblModulo.Caption:='Sistema que originou este lançamento: Controle Financeiro';

   tbsPrevidenciario.Enabled:=(Sistema.UsaPlanoPatro);
   tbsPrevidenciarioContab.Enabled:=(Sistema.UsaPlanoPatro);

   sbtnCopiar.Enabled:=False;
   bIncluido:=False;
end;

procedure TFrmMovimFinancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
   CtrlListTerceiros.Free;
   CtrlMovimFinanc.Free;
   CtrlHistPadrao.Free;
   CtrlParamFinanc.Free;
   GeralFinanc.Free;
   inherited;
end;

procedure TFrmMovimFinancMT.dblcPortadorExit(Sender: TObject);
var
   cdsAux : TCMClientDataSet;
begin
   inherited;
   if (cds.State in ([dsInsert,dsEdit])) then
    begin
       if (Trim(dblcPortador.Text)<>'') then
        begin
           if (ParamIntegra.IntegraContab) and (cds.FieldByName('IDMODULO').AsFloat=9) then
            begin
               if (Trim(cdsPortadorConta.FieldByName('PLACONTA').AsString)='') then
                begin
                   MsgDlg('Como a contabilidade está integrada, é obrigatório '+
                          'preencher a conta contabil desta Conta Bancária/Caixa',
                          'Erro',mtError,[mbOk],0);
                   bbtnCancelarClick(Self);
                   Exit;
                end;

               if bRegNaoIdent then
                begin
                   sContaBanco:=sContaNI;
                   sCCustoBanco:=sCCustoNI;
                   rSubContaBanco:=rSubContaNI;
                end
               else
                begin
                   sContaBanco:=cdsPortadorConta.FieldByName('PLACONTA').AsString;
                   sCCustoBanco:=cdsPortadorConta.FieldByName('CODCENTROCUSTO').AsString;
                   rSubContaBanco:=cdsPortadorConta.FieldByName('CODSUBCONTA').AsFloat;
                end;
            end;

           cds.FieldByName('MOECODIGO').Clear;

           if (cdsPortadorConta.FieldByName('MOECODIGO').AsFloat<>0) then
            begin
               cds.FieldByName('MOECODIGO').AsFloat:=cdsPortadorConta.FieldByName('MOECODIGO').AsFloat;

               cdsAux:=TCMClientDataSet.Create(nil);
               try
                  cdsAux.Data:=CtrlListTerceiros.ListMoeda(cdsPortadorConta.FieldByName('MOECODIGO').AsFloat,False);
                  edMoeda.Text:=cdsAux.FieldByName('MOESIGLA').AsString;
                  dbeValorMoeda.Enabled:=True;
                  dbeValorCorrente.Enabled:=False;
               finally
                  cdsAux.Free;
               end;
            end
           else
            begin
               dbeValorMoeda.Value:=0;
               dbeValorMoeda.Enabled:=False;
               dbeValorCorrente.Enabled := True;
            end;
        end;
    end;
end;

procedure TFrmMovimFinancMT.dblcPortadorChange(Sender: TObject);
begin
   if (cds.State in [dsInsert,dsEdit]) then
      cds.FieldByName('DESCPORTADOR').AsString:=dblcPortador.Text;
end;

procedure TFrmMovimFinancMT.dbrEntradaSaidaChange(Sender: TObject);
begin
   if (cdsDet.State in [dsInsert,dsEdit]) then
      cdsTipoRecDes.Data:=CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,'',
                                                                     dbrEntradaSaida.Value);
end;

procedure TFrmMovimFinancMT.dbeDataLancExit(Sender: TObject);
begin
   if (dbeDataLanc.Date>Date) then
    begin
       MsgDlg('Proibido Data de Lançamento maior que a Data de Hoje','Erro',mtError,[mbOk],0);
       dbeDataLanc.SetFocus;
       Exit;
    end;
end;

procedure TFrmMovimFinancMT.dblcHistPadExit(Sender: TObject);
begin
   if Trim(dbeHistorico.Text) = '' then
    begin
       dbeHistorico.Text:=dblcHistPad.Text;
       cds.FieldByName('HISTORICO').AsString:=dblcHistPad.Text;
    end;
end;

procedure TFrmMovimFinancMT.dbrConciliaChange(Sender: TObject);
begin
   if (ParamIntegra.IntegraContab) and (cds.FieldByName('STATUSCONCILIA').AsString='I') and
      (sContaNI='') then cbNaoContabiliza.Checked:=True;
end;

procedure TFrmMovimFinancMT.dbeValorMoedaEnter(Sender: TObject);
begin
   GeralFinanc.TestaCotacaoMoeda(cdsPortadorConta.FieldByName('MOECODIGO').AsFloat,
                                 dbeDataLanc.Date,True,rValorCotacao);
   if (rValorCotacao=0) then dbeDataLanc.SetFocus;
end;

procedure TFrmMovimFinancMT.dbeValorMoedaExit(Sender: TObject);
begin
   cds.FieldByName('VALORLANCFINAN').AsFloat:=cds.FieldByName('VALOROUTRAMOEDA').AsFloat*rValorCotacao;
end;

procedure TFrmMovimFinancMT.dblcUnidNegocChange(Sender: TObject);
begin
   if (cdsDet.State in [dsInsert,dsEdit]) then
      cdsDet.FieldByName('DESCUNIDNEG').AsString:=cdsUnidNeg.FieldByName('NOME').AsString;
end;

procedure TFrmMovimFinancMT.dblcCentroResponChange(Sender: TObject);
begin
   if (cdsDet.State in [dsInsert,dsEdit]) then
    begin
       cdsDet.FieldByName('DESCCRESPON').AsString:=cdsCentroRespon.FieldByName('NOME').AsString;
       cdsDet.FieldByName('CODTIPRECDES').Clear;
       cdsDet.FieldByName('CODTIPDOC').Clear;
       CarregaComboTRD;
    end;
end;

procedure TFrmMovimFinancMT.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   if (cdsDet.State in [dsInsert,dsEdit]) then
    begin
       cdsDet.FieldByName('CODTIPDOC').Clear;
       cdsDet.FieldByName('DESCRICAO').AsString:=dblcTipoRD.Text;
       cdsDet.FieldByName('RECPAG').AsString:=cdsTipoRecDes.FieldByName('RECPAG').AsString;
    end;
end;

procedure TFrmMovimFinancMT.dblcTipoDocumentoEnter(Sender: TObject);
begin
   if (cdsDet.State in [dsInsert,dsEdit]) then
    begin
       //Filtra cds de tipos de Documento
       cdsTipoDoc.Filtered:=False;
       cdsTipoDoc.Filter:='RECPAG = '''+cdsDet.FieldByName('RECPAG').AsString+'''';
       cdsTipoDoc.Filtered:=True;
       if cdsTipoDoc.Locate('CODTIPDOC',cdsDet.FieldByName('CODTIPDOC').AsFloat,[]) then 
          dblcTipoDocumento.Text:=cdsTipoDoc.FieldByName('DESCRICAO').AsString
       else
          dblcTipoDocumento.Clear;
    end;
end;

procedure TFrmMovimFinancMT.tbcDetalheChange(Sender: TObject);
begin
  if not(ParamIntegra.IntegraContab) or (cbNaoContabiliza.Checked) then tbcDetalhe.TabIndex:=0;

  inherited;
  if (cds.FieldByName('IDMODULO').AsFloat=9) and (cds.State in [dsInsert,dsEdit]) and
     (pgctrlDetalhe.ActivePageIndex=1) then
   begin
      //cdsContabil.EmptyDataSet;
      CtrlMovimFinanc.GeraContabilizacao(sContaBanco,sCCustoBanco,rSubContaBanco,
                                         sContaNI,sCCustoNI,rSubContaNI,bRegNaoIdent,
                                         ParamIntegra.Plano);
   end;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TFrmMovimFinancMT.dbccContaExit(Sender: TObject);
begin
  if (dbccConta.Valida<>VcOk) then
   begin
      dbccConta.SetFocus;
      exit;
   end
  else
   begin
      if (dbccConta.Conta.ObrigaCentrodeCusto) then
       begin
          cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa,
                                                                       ParamIntegra.Plano,
                                                                       dbccConta.Conta.Numero);
          cdsCentroCusto.First;
          if (cdsCentroCusto.RecordCount=1) then
             dblcCCusto.LookupValue:=Trim(cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString);

          dblcCCusto.Enabled := True;
          dblcCCusto.SetFocus;
       end
      else
       begin
          dblcCCusto.Enabled := False;
          cdsContabil.FieldByName('CODCENTROCUSTO').Clear;
          cdsContabil.FieldByName('IDEMPRESA').Clear;
       end;

     if dbccConta.Conta.ObrigaSubConta then
      begin
         dblcSubConta.Enabled := True;
         dblcSubConta.SetFocus;
      end
     else
      begin
         dblcSubConta.Enabled := False;
         cdsContabil.FieldByName('CODSUBCONTA').Clear;
      end;
   end;
end;

procedure TFrmMovimFinancMT.dblcSubContaEnter(Sender: TObject);
begin
   inherited;
   cdsSubConta.Data:=CtrlListTerceiros.ListSubConta(Sistema.IdEmpresa,ParamIntegra.Plano,
                                                    Trim(dbccConta.Conta.Numero));
end;

procedure TFrmMovimFinancMT.dblcCCustoEnter(Sender: TObject);
begin
   //Carrega cds do combo de Centros de Custo
   cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa,
                                                                ParamIntegra.Plano,
                                                                dbccConta.Conta.Numero);
end;

procedure TFrmMovimFinancMT.dblcCCustoChange(Sender: TObject);
begin
   if (cdsContabil.State in [dsInsert]) then
      cdsContabil.FieldByName('DESCCCUSTO').AsString:=dblcCCusto.Text;
end;

procedure TFrmMovimFinancMT.dblcAtividadeChange(Sender: TObject);
begin
   if (cdsContabil.State in [dsInsert]) then
      cdsContabil.FieldByName('DESCUNIDNEG').AsString:=dblcAtividade.Text;
end;

procedure TFrmMovimFinancMT.dbeValorMoedaDetExit(Sender: TObject);
begin
   if (cdsdet.State in [dsInsert,dsEdit]) then
      cdsdet.FieldByName('VALOR').AsFloat:=cdsdet.FieldByName('VALOROUTRAMOEDA').AsFloat*rValorCotacao;
end;

procedure TFrmMovimFinancMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   sbtnCopiar.Enabled:=((Cds.State in [dsInsert]) and bIncluido);

   sbtnMudaStatus.Enabled:=False;
   sbtnAlterar.Enabled :=False;
   sbtnApagar.Enabled  :=False;
   sbtnEstornar.Enabled:=(cds.FieldByName('IDMODULO').AsFloat=Sistema.IdModulo) and
                         (cds.FieldByName('CODLANCFINANC').AsFloat<>0);
   
   if (cds.FieldByName('CODLANCFINANC').AsFloat<>0) then
    begin
       sbtnMudaStatus.Enabled:=(not(sbtnInserir.Down));
       sbtnAlterar.Enabled :=(cds.FieldByName('IDMODULO').AsFloat=Sistema.IdModulo);
       sbtnApagar.Enabled:=(cds.FieldByName('IDMODULO').AsFloat=Sistema.IdModulo) and
                            not((ParamIntegra.IntegraContab) and
                                 not(sbtnInserir.Down) and
                                 not(sbtnAlterar.Down) and
                                 not(sbtnApagar.Down) and
                                 bEstorna);
    end;
   
   if bRegNaoIdent then
   begin
      sbtnMudaStatus.Enabled:=False;
      sbtnInserir.Enabled   :=False;
      sbtnApagar.Enabled    :=False;
      sbtnEstornar.Enabled  :=False;
      //
      sbtnMudaStatus.Visible:=False;
      sbtnInserir.Visible   :=False;
      sbtnApagar.Visible    :=False;
      sbtnEstornar.Visible  :=False;
      //
      sbtnAlterar.Left:=0;
      sbtnProcurar.Left:=60;
      sbtnAlterar.Width:=68;
      sbtnAlterar.Caption:='&Regularizar';
   end;
end;

procedure TFrmMovimFinancMT.sbtnMudaStatusClick(Sender: TObject);
begin
   if (cds.FieldByName('STATUSCONCILIA').AsString='I') then
      MsgDlg('Para Alterar o Status de um lançamento não Identificado deve-se ir '+
             'a Opção "Regulariza Lançamentos Não Identificados"','Erro',mtError,[mbOk],0)
   else
    with TfrmMudaStatusMT.Create(Self) do
    try
       case dbrConcilia.ItemIndex of
          0: rgStatus.ItemIndex:=0;
          1: rgStatus.ItemIndex:=1;
          3: rgStatus.ItemIndex:=2;
       end;

       ShowModal;
       if (ModalResult=mrOk) then
        begin
           if not(CtrlMovimFinanc.MudaStatus(Cds.FieldByName('CODLANCFINANC').AsFloat,
                                             sStatus,dbedDataConcilia.Date)) then
              MsgDlg(CtrlMovimFinanc.MessageInfo,'Erro',mtError,[mbOk],0)
           else
              CarregaCdsMestDet(Cds.FieldByName('CODLANCFINANC').AsFloat);
        end;
    finally
       Free;
    end;
    sbtnMudaStatus.Down:=False;
end;

procedure TFrmMovimFinancMT.sbtnCopiarClick(Sender: TObject);
var
   iCampo    : Integer;
   sNomeCampo : String;
begin
   for iCampo:=0 to cdsBack.FieldCount-1 do
   begin
      sNomeCampo:=cdsBack.Fields[iCampo].FieldName;
      Cds.FieldByName(sNomeCampo).Value:=cdsBack.FieldByName(sNomeCampo).Value;
   end;

   cdsDet.Close;
   cdsDet.Data:=cdsDetBack.Data;
   cdsContabil.Close;
   cdsContabil.Data:=cdsContabBack.Data;
   sbtnCopiar.Down:=False;
   CmeCadastroAtualizaBotoes(nil);
   CmeDetalheAtualizaBotoes(nil);
end;

procedure TFrmMovimFinancMT.sbtnEstornarClick(Sender: TObject);
begin
   with TfrmEstornoFinancMT.Create(Self,cds.FieldByName('CODLANCFINANC').AsFloat,bRegNaoIdent) do
   try
      ShowModal;
   finally
      Free;
   end;
   sbtnEstornar.Down:=False;
end;

procedure TFrmMovimFinancMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbrConcilia.Enabled:=not(bRegNaoIdent);
   pnlMestre.Enabled:=True;
   dblcPortador.SetFocus;

   cds.FieldByName('STATUSCONCILIA').AsString:='N';
   cds.FieldByName('CODPORTADOR').AsFloat:=rCodPortador;
   cds.FieldByName('DATALANCFINAN').AsDateTime:=dDataLancFinanc;
   cds.FieldByName('ENTRADASAIDA').AsString:=sEntradaSaida;
   cds.FieldByName('IDMODULO').AsFloat:=Sistema.IdModulo;
   cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
   cds.FieldByName('IDUSUARIOINCLUSAO').AsFloat:=Sistema.IdUsuario;
   cds.FieldByName('VALORLANCFINAN').AsFloat:=0;
   
   //Limpa Todos os campos dos Destalhes
   cdsDet.Close;
   cdsDet.Data:=DadosRateioVazio;
   cdsContabil.Close;
   cdsContabil.Data:=DadosContabVazio;

   lblModulo.Caption:='Sistema que originou este lançamento: Controle Financeiro';

   rSomaRatMoeCorr:=0;
   rSomaRatOutraMoe:=0;
   rPrxVlrRateioCorr:=0;
   rPrxVlrRateioOM:=0;
   rSvValor:=0;
   rSvValorOut:=0;
end;

procedure TFrmMovimFinancMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   pnlMestre.Enabled:=True;
   dbrConcilia.Enabled := False;
   if bRegNaoIdent then
    begin
       cds.FieldByName('STATUSCONCILIA').AsString:='X';
       cds.FieldByName('DATALANCFINAN').AsDateTime:=Date;

       //Exclui Linhas da Contabilização
       cdsContabil.Close;
       cdsContabil.Data:=DadosContabVazio;

       dblcPortador.ReadOnly    :=True;
       dbrEntradaSaida.ReadOnly :=True;
       dbeValorMoeda.ReadOnly   :=True;
       dbeValorCorrente.ReadOnly:=True;
    end
   else
    if (cds.FieldByName('CODLANCTRANSF').AsFloat<>0) then
     begin
        MsgDlg('Proibido Alterar Transferência entre Contas. Exclua e Inclua novamente.',
               'Erro',mtError,[mbOk],0);
        bbtnCancelarClick(Self);
        Exit;
     end;
   dblcPortador.SetFocus;
end;

procedure TFrmMovimFinancMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlMovimFinanc.ExcluiFinanceiro(StrToFloat(MontaSelect.ValoresChave[0]));
   //Limpa Detalhes
   cdsDet.Close;
   cdsDet.Data:=DadosRateioVazio;
   cdsContabil.Close;
   cdsContabil.Data:=DadosContabVazio;
end;

procedure TFrmMovimFinancMT.CmeCadastroCancel(Sender: TObject);
begin
   pnlMestre.Enabled:=False;
   inherited;
end;

procedure TFrmMovimFinancMT.CmeCadastroFind(Sender: TObject);
var
   cdsAux : TCMClientDataSet;
begin
   if MontaSelect.RetornouValor then
    begin
       CarregaCdsMestDet(StrToFloat(MontaSelect.ValoresChave[0]));
       cdsAux:=TCMClientDataSet.Create(nil);
       try
          cdsAux.Data:=CtrlListTerceiros.ListModulo(cds.FieldByName('IDModulo').AsFloat);
          lblNomeOrigem.Caption:=cdsAux.FieldByName('NOMEMODULO').AsString;
          cdsAux.Close;
       finally
          cdsAux.Free;
       end;
    end;
end;

procedure TFrmMovimFinancMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
   rTotalImposto: Double;
begin
   if Trim(dblcPortador.text) = '' then
    begin
       MsgDlg('Obrigatório preencher o Banco/Caixa','Erro',mtError,[mbOk],0);
       dblcPortador.SetFocus;
       Accept:=False;
       Exit;
    end;

   if Trim(dbeDataLanc.text) = '' then
    begin
       MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
       dbeDataLanc.SetFocus;
       Accept:=False;
       Exit;
    end;

   if (dbeValorMoeda.Value = 0) and (cds.FieldByName('MOECODIGO').AsFloat<>0) then
    begin
       MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
       dbeValorMoeda.SetFocus;
       Accept:=False;
       exit;
    end;

   if (dbeValorCorrente.Value=0) then
    begin
       if MsgDlg('Confirma que o Valor em Moeda Corrente = 0,00',
                 'Confirmação',mtConfirmation,[mbYes,mbNo],0)  = MrNo then
        begin
           dbeValorCorrente.SetFocus;
           Accept:=False;
           Exit;
        end;
    end;

   if (Trim(dblcHistPad.text)='') then
    begin
       MsgDlg('Obrigatório preencher o Histórico Padrão','Erro',mtError,[mbOk],0);
       dblcHistPad.SetFocus;
       Accept:=False;
       Exit;
    end;

   if (Trim(dbeHistorico.text)='') then
    begin
       MsgDlg('Obrigatório preencher o Histórico do Lançamento','Erro',mtError,[mbOk],0);
       dbeHistorico.SetFocus;
       Accept:=False;
       Exit;
    end;

   if (Trim(dbeDocumento.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk],0);
       dbeDocumento.SetFocus;
       Accept:=False;
       Exit;
    end;

   //Faz backup do Rateio e do Valor do Lançamento
   rValorLancBackup:=cds.FieldByName('VALORLANCFINAN').AsFloat;
   cdsDetBackup.Data:=cdsDet.Data;

   if (bCalcImposto) and (cds.state in [dsInsert]) then
    begin
       //Gera linhas de Imposto
       if not(CtrlMovimFinanc.GeraImpostoRateio(rTotalImposto)) then
        begin
           MsgDlg(CtrlMovimFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
           Exit;
        end
       else
        begin
           cds.FieldByName('VALORLANCFINAN').AsFloat:=
               cds.FieldByName('VALORLANCFINAN').AsFloat+rTotalImposto;
           cdsContabil.EmptyDataSet;
        end;
    end;

   //Gera linhas de Contabilização
   if cbNaoContabiliza.Checked then
    begin
       //Limpa cds de Contabilização (cdsContabil)
       cdsContabil.EmptyDataSet;
    end
   else
    if (ParamIntegra.IntegraContab) and (cds.FieldByName('IDMODULO').AsFloat=Sistema.IdModulo) and
       (cdsContabil.IsEmpty) and (Trim(dblcPortador.Text) <> '') then
     begin
        if not(CtrlMovimFinanc.GeraContabilizacao(sContaBanco,sCCustoBanco,rSubContaBanco,
                                                  sContaNI,sCCustoNI,rSubContaNI,bRegNaoIdent,
                                                  ParamIntegra.Plano)) then
         begin
            MsgDlg(CtrlMovimFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
            Exit;
         end;
     end;

   if not(cbNaoContabiliza.Checked) and (ParamIntegra.IntegraContab) and
         (cds.FieldByName('IDMODULO').AsFloat=9) then
    begin
       if cdsContabil.IsEmpty then
        begin
           MsgDlg('Obrigatório ter Lançamento Contábil','Erro',mtError,[mbOk],0);
           dbeDocumento.SetFocus;
           DesfazImposto;
           Accept:=False;
           Exit;
        end;

       //Verifica Linhas Contábeis
       Accept:=CtrlMovimFinanc.VerificaContabilizacao(ParamIntegra.Plano,
                                                      sContaBanco,
                                                      rSubContaBanco);
       if not(Accept) then
        begin
           MsgDlg(CtrlMovimFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
           DesfazImposto;
           Exit;
        end;
    end;
   inherited;
end;

procedure TFrmMovimFinancMT.CmeCadastroConfirma(Sender: TObject);
var
   iCampo    : Integer;
   sNomeCampo : String;
   bResposta: Boolean;
begin
   CmeDetalhe.Confirma(Self);
   bbtnVoltarDetClick(Self);
   cdsContabil.First;

   if (sbtnInserir.Down) then
    begin
       sEntradaSaida:=cds.FieldByName('ENTRADASAIDA').AsString;
       rCodPortador:=cds.FieldByName('CODPORTADOR').AsFloat;
       dDataLancFinanc:=cds.FieldByName('DATALANCFINAN').AsDateTime;
    end;

   bResposta:=True;
   // Inclusão ou Regularização
   if (sbtnInserir.Down) or (bRegNaoIdent) then
    begin
       //Limpa cds's de backup para a cópia
       cdsBack.EmptyDataSet;
       cdsDetBack.EmptyDataSet;
       cdsContabBack.EmptyDataSet;

       //Transfere dados do cds
       cdsBack.Append;
       for iCampo:=0 to cdsBack.FieldCount-1 do
       begin
          sNomeCampo:=cdsBack.Fields[iCampo].FieldName;
          cdsBack.FieldByName(sNomeCampo).Value:=cds.FieldByName(sNomeCampo).Value;
       end;

       cdsDetBack.Data:=cdsDet.Data;
       cdsContabBack.Data:=cdsContabil.Data;

       bResposta:=CtrlMovimFinanc.GravaFinanceiro(bRegNaoIdent,
                                                  opInclusao,
                                                  ParamIntegra.Plano,
                                                  ParamIntegra.IntegraContab,
                                                  bCalcImposto);
       bIncluido:=bResposta;
    end;

   // Alteração
   if (sbtnAlterar.Down) and not(bRegNaoIdent) then
      bResposta:=CtrlMovimFinanc.GravaFinanceiro(bRegNaoIdent,
                                                 opAlteracao,
                                                 ParamIntegra.Plano,
                                                 ParamIntegra.IntegraContab,
                                                 bCalcImposto);

   if not(bResposta) then
    begin
       MsgDlg(CtrlMovimFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
       DesfazImposto;
       Abort;
    end;

   if (sbtnAlterar.Down) then
   begin
      dblcPortador.ReadOnly    :=False;
      dbrEntradaSaida.ReadOnly :=False;
      dbeValorMoeda.ReadOnly   :=False;
      dbeValorCorrente.ReadOnly:=False;
   end;

   pnlMestre.Enabled:=False;
   inherited;
end;

procedure TFrmMovimFinancMT.CmeDetalheInsert(Sender: TObject);
begin
   pgcRateio.ActivePageIndex:=0;
   pgcContabil.ActivePageIndex:=0;

   case pgctrlDetalhe.ActivePageIndex of
      0: begin

            if (cdsDet.IsEmpty) then
             begin
                if (rPrxVlrRateioCorr=0) then
                   rPrxVlrRateioCorr:=cds.FieldByName('VALORLANCFINAN').AsFloat;
                if (rPrxVlrRateioOM=0) and (cdsDet.IsEmpty) then
                   rPrxVlrRateioOM:=cds.FieldByName('VALOROUTRAMOEDA').AsFloat;
             end
            else
             if ((rPrxVlrRateioCorr=0) and dbeValorCorrente.Enabled) or
                ((rPrxVlrRateioOM=0) and dbeValorMoeda.Enabled) then
              begin
                 PostMessage(Handle,WM_AbandonaInclusaoDet,0,0);
                 Abort;
              end;

            inherited;

            cdsDet.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
            cdsDet.FieldByName('VALOR').AsFloat:=rPrxVlrRateioCorr+rSvValor;
            cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat:=rPrxVlrRateioOM+rSvValorOut;

            if (cdsPortadorConta.FieldByName('MOECODIGO').AsFloat<>0) then
             begin
                cdsDet.FieldByName('MOECODIGO').AsFloat:=
                              cdsPortadorConta.FieldByName('MOECODIGO').AsFloat;
                dbeValorMoedaDet.Enabled:=True;
                dbeValorDet.Enabled:=False;
             end
            else
             begin
                dbeValorMoedaDet.Enabled:=False;
                dbeValorDet.Enabled:=True;
             end;

            //Testa se o cds de Unidade de Neg. e/ou o cds de Centro de Respon. têm
            //apenas um registro. Caso só exista um, atribui estes aos respectivos campos.
            TestaUnNegCentroRespon;

            if dblcUnidNegoc.Enabled then
               dblcUnidNegoc.SetFocus
            else
             begin
                if dblcCentroRespon.Enabled then
                   dblcCentroRespon.SetFocus
                else
                   dblcTipoRD.SetFocus;
             end;

            cdsDet.FieldByName('MOECODIGO').Clear;
            edMoeda.Clear;

            if (cds.FieldByName('MOECODIGO').AsFloat<>0) then
             begin
                cdsDet.FieldByName('MOECODIGO').AsFloat:=cds.FieldByName('MOECODIGO').AsFloat;
                edMoedaDet.Text:=edMoeda.Text;
             end
            else
             cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat:=0;
         end;

      1: begin
            inherited;
            
            dblcSubConta.Enabled := False;
            dblcCCusto.Enabled   := False;

            cdsContabil.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;

            if cds.FieldByName('ENTRADASAIDA').AsString = 'S' then
             begin
                cdsContabil.FieldByName('LACDEBCRE').AsString := 'D';
                cdsContabil.FieldByName('LACTIPO').AsString:='0';
             end
            else
             begin
                cdsContabil.FieldByName('LACDEBCRE').AsString := 'C';
                cdsContabil.FieldByName('LACTIPO').AsString:='1';
             end;

            cdsContabil.FieldByName('PLANO').AsFloat:=ParamIntegra.Plano;
            cdsContabil.FieldByName('LACNUMDOC').AsString:=dbeDocumento.Text;

            if (cds.FieldByName('MOECODIGO').AsFloat<>0) then
             begin
                dbeValorOMContab.Enabled:=True;
                dbeValorCorrenteContab.Enabled:=False;
             end
            else
             begin
                dbeValorOMContab.Enabled:=False;
                dbeValorCorrenteContab.Enabled:=True;
             end;
         end;
   end;
end;

procedure TFrmMovimFinancMT.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   case pgctrlDetalhe.ActivePageIndex of
      0: begin  //TAB de Rateio
            if (cdsPortadorConta.FieldByName('MOECODIGO').AsFloat<>0) then
             begin
                cdsDet.FieldByName('MOECODIGO').AsFloat:=
                            cdsPortadorConta.FieldByName('MOECODIGO').AsFloat;
                dbeValorMoedaDet.Enabled := True;
                dbeValorDet.Enabled := False;
             end
            else
             begin
                dbeValorMoedaDet.Enabled := False;
                dbeValorDet.Enabled := True;
             end;

             //Guarda valor do rateio para posterior exclusão do mesmo em caso de alteração de valor
             if ((cdsDet.FieldByName('RECPAG').AsString='R') and
                 (cds.FieldByName('ENTRADASAIDA').AsString='E')) or
                ((cdsDet.FieldByName('RECPAG').AsString='P') and
                 (cds.FieldByName('ENTRADASAIDA').AsString='S')) then
              begin
                 rSvValor:=rSvValor-cdsDet.FieldByName('VALOR').AsFloat;
                 rSvValorOut:=rSvValorOut-cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
              end
             else
              begin
                 rSvValor:=rSvValor+cdsDet.FieldByName('VALOR').AsFloat;
                 rSvValorOut:=rSvValorOut+cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
              end;

             cdsDet.FieldByName('MOECODIGO').Clear;
             edMoedaDet.Clear;

             //Carrega Combo de Tipo de Recebimento Desembolso
             CarregaComboTRD;

             //Testa se o cds de Unidade de Neg. e/ou o cds de Centro de Respon. têm
             //apenas um registro. Caso só exista um, atribui estes aos respectivos campos.
             TestaUnNegCentroRespon;

             if dblcUnidNegoc.Enabled then
                dblcUnidNegoc.SetFocus
             else
              begin
                 if dblcCentroRespon.Enabled then
                    dblcCentroRespon.SetFocus
                 else
                    dblcTipoRD.SetFocus;
              end;

             if (cds.FieldByName('MOECODIGO').AsFloat<>0) then
              begin
                 cdsDet.FieldByName('MOECODIGO').AsFloat:=cds.FieldByName('MOECODIGO').AsFloat;
                 edMoedaDet.Text:=edMoeda.Text;
              end
             else
              dbeValorMoedaDet.Value:=0;

             //Atualiza cds de Tipo de Documento
             dblcTipoDocumentoEnter(nil);
         end;

      1: begin //TAB de Contabilização
            if cdsContabil.FieldByName('CODCENTROCUSTO').IsNull then
               dblcCCusto.Enabled:= False
            else
               dblcCCusto.Enabled:= True;

            if cdsContabil.FieldByName('CODSUBCONTA').IsNull then
               dblcSubConta.Enabled:=False
            else
               dblcSubConta.Enabled := True;

            if (cds.FieldByName('MOECODIGO').AsInteger<>0) then
             begin
                dbeValorOMContab.Enabled:=True;
                dbeValorCorrenteContab.Enabled:=False;
                if (cdsContabil.FieldByName('LACVALHIST').AsFloat=0) then
                    cdsContabil.FieldByName('LACVALHIST').AsFloat:=
                                cdsContabil.FieldByName('LACVALOR').AsFloat/rValorCotacao;
             end
            else
             begin
                dbeValorOMContab.Enabled:=False;
                dbeValorCorrenteContab.Enabled:=True;
                cdsContabil.FieldByName('LACVALHIST').Clear;
             end;

            pnlContabil.BringToFront;
            pgcContabil.ActivePageIndex:=0;
         end;
   end;
end;

procedure TFrmMovimFinancMT.CmeDetalheDelete(Sender: TObject);
begin
   if (pgctrlDetalhe.ActivePageIndex=0) then
    begin
       if ((cdsDet.FieldByName('RECPAG').AsString='R') and
           (cds.FieldByName('ENTRADASAIDA').AsString='E')) or
          ((cdsDet.FieldByName('RECPAG').AsString='P') and
           (cds.FieldByName('ENTRADASAIDA').AsString='S')) then
        begin
           rSomaRatMoeCorr:=rSomaRatMoeCorr-cdsDet.FieldByName('VALOR').AsFloat;
           rSomaRatOutraMoe:=rSomaRatOutraMoe-cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
        end
       else
        begin
           rSomaRatMoeCorr:=rSomaRatMoeCorr+cdsDet.FieldByName('VALOR').AsFloat;
           rSomaRatOutraMoe:=rSomaRatOutraMoe+cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
        end;
       rPrxVlrRateioCorr:=cds.FieldByName('VALORLANCFINAN').AsFloat-rSomaRatMoeCorr;
       rPrxVlrRateioOM:=cds.FieldByName('VALOROUTRAMOEDA').AsFloat-rSomaRatOutraMoe;
    end;
   inherited;
end;

procedure TFrmMovimFinancMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
    if (cds.State in ([dsInsert,dsEdit])) then
    begin
       pgcRateio.ActivePageIndex:=0;
       pgcContabil.ActivePageIndex:=0;

       case pgctrlDetalhe.ActivePageIndex of
          0: begin
                if (cdsDet.State in ([dsInsert,dsEdit])) then
                 begin
                    if Trim(dblcUnidNegoc.Text)='' then
                     begin
                        MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dblcUnidNegoc.SetFocus;
                        abort;
                     end;

                    if Trim(dblcCentroRespon.Text)='' then
                     begin
                        MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dblcCentroRespon.SetFocus;
                        abort;
                     end;

                    if Trim(dblcTipoRD.Text)='' then
                     begin
                        MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dblcTipoRD.SetFocus;
                        abort;
                     end;

                    if Trim(dblcTipoDocumento.Text)='' then
                     begin
                        MsgDlg('Obrigatório preencher o Tipo de Documento','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dblcTipoDocumento.SetFocus;
                        abort;
                     end;

                    if (dbeValorMoedaDet.Value=0) and (cds.FieldByName('MOECODIGO').AsInteger<>0) then
                     begin
                        MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dbeValorMoedaDet.SetFocus;
                        abort;
                     end;

                    if (dbeValorDet.Value=0) then
                     begin
                        MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
                        dbeValorDet.SetFocus;
                        Accept:=False;
                        abort;
                     end;

                    if (Sistema.UsaPlanoPatro) then
                     begin
                        if (dblcPrograma.Value='') and (dbrConcilia.ItemIndex<>2) then
                         begin
                            MsgDlg('Obrigatório preencher o Programa','Erro',mtError,[mbOk],0);
                            Accept:=False;
                            pgcRateio.ActivePageIndex:=1;
                            dblcPrograma.SetFocus;
                            abort;
                         end;

                        if dblcPatrocinadorRateio.Value='' then
                         begin
                            MsgDlg('Obrigatório preencher o Patrocinador','Erro',mtError,[mbOk],0);
                            Accept:=False;
                            pgcRateio.ActivePageIndex:=1;
                            dblcPatrocinadorRateio.SetFocus;
                            abort;
                         end;

                        if dblcPlanoPrevRateio.Value='' then
                         begin
                            MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
                            Accept:=False;
                            pgcRateio.ActivePageIndex:=1;
                            dblcPlanoPrevRateio.SetFocus;
                            abort;
                         end;
                     end;

                    cdsDet.FieldByName('MOESIGLA').AsString:=edMoedaDet.Text;

                    if cdsDet.FieldByName('CODCENTROCUSTO').IsNull then
                       cdsDet.FieldByName('IDEMPRESA').Clear
                    else
                       cdsDet.FieldByName('IDEMPRESA').Asfloat:=Sistema.IdEmpresa;
                 end;
             end;

          1: begin
                if cdsContabil.State in ([dsInsert,dsEdit]) then
                 begin
                    if Trim(dbccConta.Conta.Numero) = '' then
                     begin
                        MsgDlg('Obrigatório preencher a Conta Contábil','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dbccConta.SetFocus;
                        abort;
                     end;

                    if (dbccConta.Conta.ObrigaSubConta) and (Trim(dblcSubConta.Text)='') then
                     begin
                        MsgDlg('Obrigatório preencher a Sub-Conta','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dblcSubConta.SetFocus;
                        abort;
                     end;

                    if (dbccConta.Conta.ObrigaCentrodeCusto) and (Trim(dblcCCusto.Text)='') then
                     begin
                        MsgDlg('Obrigatório preencher o Centro de Custo','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dblcCCusto.SetFocus;
                        abort;
                     end;

                    if Trim(dblcAtividade.Text) = '' then
                     begin
                        MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dblcAtividade.SetFocus;
                        abort;
                     end;

                    if Trim(dbeHist1.Text) = '' then
                     begin
                        MsgDlg('Obrigatório preencher pelo menos a primeira linha do histórico','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dbeHist1.SetFocus;
                        abort;
                     end;

                    if (dbeValorOMContab.Value=0) and (cds.FieldByName('MOECODIGO').AsInteger<>0) then
                     begin
                        MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dbeValorOMContab.SetFocus;
                        abort;
                     end;

                    if dbeValorCorrenteContab.Value = 0 then
                     begin
                        MsgDlg('Obrigatório preencher o Valor','Erro',mtError,[mbOk],0);
                        Accept:=False;
                        dbeValorCorrenteContab.SetFocus;
                        abort;
                     end;

                     if Sistema.UsaPlanoPatro then
                      begin
                         if (dblcPatrocinadorContabil.Value='') then
                          begin
                             MsgDlg('Obrigatório preencher o Patrocinador','Erro',mtError,[mbOk],0);
                             Accept:=False;
                             pgcContabil.ActivePageIndex:=1;
                             dblcPatrocinadorContabil.SetFocus;
                             abort;
                          end;

                         if (dblcPlanoPrevContabil.Value='') then
                          begin
                             MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
                             Accept:=False;
                             pgcContabil.ActivePageIndex:=1;
                             dblcPlanoPrevContabil.SetFocus;
                             abort;
                          end;
                      end; //Usa Plano Patro
                 end; //cdsContabil.State
             end; // 1:
       end; // case
    end; // cds.State
   inherited;
end;

procedure TFrmMovimFinancMT.CmeDetalheConfirma(Sender: TObject);
begin
   if (pgctrlDetalhe.ActivePageIndex=0) and (cdsDet.State in [dsInsert,dsEdit]) then
    begin
       if ((cdsDet.FieldByName('RECPAG').AsString = 'R') and
           (cds.FieldByName('ENTRADASAIDA').AsString = 'E')) or
          ((cdsDet.FieldByName('RECPAG').AsString = 'P') and
           (cds.FieldByName('ENTRADASAIDA').AsString = 'S')) then
        begin
           rSomaRatMoeCorr:=rSomaRatMoeCorr+cdsDet.FieldByName('VALOR').AsFloat+rSvValor;
           rSomaRatOutraMoe:=rSomaRatOutraMoe+cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat+rSvValorOut;
        end
       else
        begin
           rSomaRatMoeCorr:=rSomaRatMoeCorr-cdsDet.FieldByName('VALOR').AsFloat+rSvValor;
           rSomaRatOutraMoe:=rSomaRatOutraMoe-cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat+rSvValorOut;
        end;
       rSvValor:=0;
       rSvValorOut:=0;
       //Calcula os próximos valores de Rateio para inclusões
       rPrxVlrRateioCorr:=cds.FieldByName('VALORLANCFINAN').AsFloat-rSomaRatMoeCorr;
       rPrxVlrRateioOM:=cds.FieldByName('VALOROUTRAMOEDA').AsFloat-rSomaRatOutraMoe;
    end;
   inherited;
end;

procedure TFrmMovimFinancMT.CarregaComboTRD;
begin
   if (Cds.FieldByName('ENTRADASAIDA').AsString='E') then
      cdsTipoRecDes.Data:=CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
                                                       dblcCentroRespon.LookupValue,'E')
   else
      cdsTipoRecDes.Data:=CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,
                                                       dblcCentroRespon.LookupValue,'S');
end;

procedure TFrmMovimFinancMT.CarregaCdsMestDet(rCodLancFinanc: Double);
begin
   //Carrega cds Mestre e Detalhes
   cds.Close;
   cds.Data:=CtrlMovimFinanc.ListMovimFinanc(rCodLancFinanc);

   cdsDet.Close;
   cdsDet.Data:=CtrlMovimFinanc.ListRateioFinanc(rCodLancFinanc);
   TFloatField(cdsDet.FieldByName('VALOR')).DisplayFormat:='#,##0.00';
   TFloatField(cdsDet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat:='#,##0.00';
   TStringField(cdsDet.FieldByName('CODCENTROCUSTO')).EditMask:=ParamIntegra.MascaraCC+';0; ';

   cdsContabil.Close;
   cdsContabil.Data:=CtrlMovimFinanc.ListContabil(cds.FieldByName('PLNCODIGO').AsFloat);
   TFloatField(cdsContabil.FieldByName('LACVALOR')).DisplayFormat:='#,##0.00';
   TFloatField(cdsContabil.FieldByName('LACVALHIST')).DisplayFormat:='#,##0.00';
   TStringField(cdsContabil.FieldByName('PLACONTA')).EditMask:=ParamIntegra.MascaraPlano+';0; ';


   if (cdsContabil.IsEmpty) and not(cdsDet.IsEmpty) then
      cbNaoContabiliza.Checked:=True
   else
      cbNaoContabiliza.Checked:=False;

   rSomaRatMoeCorr:=0;
   rSomaRatOutraMoe:=0;

   if (rCodLancFinanc>0) then
    begin
       while not(cdsDet.Eof) do
       begin
          if ((cdsDet.FieldByName('RECPAG').AsString = 'R') and
              (cds.FieldByName('ENTRADASAIDA').AsString = 'E')) or
             ((cdsDet.FieldByName('RECPAG').AsString = 'P') and
              (cds.FieldByName('ENTRADASAIDA').AsString = 'S')) then
           begin
              rSomaRatMoeCorr:=rSomaRatMoeCorr+cdsDet.FieldByName('VALOR').AsFloat;
              rSomaRatOutraMoe:=rSomaRatOutraMoe+cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
           end
          else
           begin
              rSomaRatMoeCorr:=rSomaRatMoeCorr-cdsDet.FieldByName('VALOR').AsFloat;
              rSomaRatOutraMoe:=rSomaRatOutraMoe-cdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
           end;
          cdsDet.Next;
       end;
      cdsDet.First;
    end;

   //Calcula os próximos valores de Rateio para inclusões
   rPrxVlrRateioCorr:=cds.FieldByName('VALORLANCFINAN').AsFloat-rSomaRatMoeCorr;
   rPrxVlrRateioOM:=cds.FieldByName('VALOROUTRAMOEDA').AsFloat-rSomaRatOutraMoe;
end;

procedure TFrmMovimFinancMT.TestaUnNegCentroRespon;
begin
   dblcUnidNegoc.Enabled:=True;
   dblcCentroRespon.Enabled:=True;
   //Testa se existe apenas uma atividade e um Centro de Responsabilidade
   cdsUnidNeg.First;
   if (cdsUnidNeg.RecordCount=1) then
    begin
       dblcUnidNegoc.Enabled:=False;
       cdsDet.FieldByName('UNIDNEGOC').AsFloat:=cdsUnidNeg.FieldByName('UNIDNEGOC').AsFloat;
       cdsDet.FieldByName('DESCUNIDNEG').AsString:=cdsUnidNeg.FieldByName('NOME').AsString;
    end;

   cdsCentroRespon.First;
   if (cdsCentroRespon.RecordCount=1) then
    begin
       dblcCentroRespon.Enabled:=False;
       cdsDet.FieldByName('CODCENTRORESPON').AsString:=
                   cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
       cdsDet.FieldByName('DESCCRESPON').AsString:=
                   cdsCentroRespon.FieldByName('NOME').AsString;
    end;
end;

procedure TFrmMovimFinancMT.DesfazImposto;
begin
   if not(cdsDet.IsEmpty) then
    begin
       cdsDet.Close;
       cdsDet.Data:=cdsDetBackup.Data;
    end;
end;

procedure TFrmMovimFinancMT.bbtnOkDetClick(Sender: TObject);
var
   Accept: Boolean;
begin
  //o Código abaixo futuramente deve ser retirado. O mesmo somente está presente devido a
  //uma falha no padrão que não gera o evento OnBeforeConfirma no Detalhe, quando alterando
  // o registro corrente
  //Accept:=True;
  if (cdsDet.State in [dsInsert,dsEdit]) or (cdsContabil.State in [dsInsert,dsEdit]) then
     CmeDetalheBeforeConfirma(nil,Accept);
  inherited;     
end;

procedure TFrmMovimFinancMT.cdsDetAfterScroll(DataSet: TDataSet);
begin
   dblcCentroRespon.Update;
end;

procedure TFrmMovimFinancMT.cdsContabilAfterScroll(DataSet: TDataSet);
begin
   dblcCCusto.Update;
end;

procedure TFrmMovimFinancMT.AbortaInclusaoDet(var Msg: TMessage);
begin
   bbtnVoltarDetClick(nil);
end;


end.
