{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 163982/7003
Nº KINTANA..: 1489901
Data........: 22/11/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Trazer somente as atividades/projetos ativos.
-----------------------------------------------------------------------------------------------------}

//------------------------------------------------------------------------------
// ALTERAÇÕES / IMPLEMENTAÇÕES :
//------------------------------------------------------------------------------
// Pendência  : 20315
// Autor      : Daniel Simões
// Data       : 09/03/2006
// Descrição  : Foi criado novo parâmetro "Conta Crédito Antecipado" no
//              formulário...
//
//            : Foi criado um novo parâmetro do tipo TTipoConta ( tcCreAnt ) que
//              tem como objetivo impedir que mude a descrição da agência da
//              "Conta Crédito" ao selecionar a "Conta Crédito Antecipado" ...
//
//            : Criada a procedure de validação da conta digitada chamada
//              "PreencheCreAnt" ...
//------------------------------------------------------------------------------

unit fCadParamReceitaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, Db, Provider, DBTables, Wwquery, MontaSelect, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, wwdblook, DBCtrls, Mask, mImovel, mContrato, uCtrlTipoCustoRecImov,
  uCtrlTipoImovel, uCtrlCentRespon, uCtrlTiporecebdesemb, uCtrlCentroCusto,
  uCtrlUnidNegocio, uCtrlTipOper, uCtrlPadrLancImovel, uSistema,
  uComunsImobiliario, uVerificaPreenchimento, dBaseDados, uIntegraBack, uModuloAdminImob, 
  uModuloImobiliario, dMs, uMensErro, uCtrlPlanoConta, uCMTypes, mImovelouMestre, uCmSqlParams;

type
  TTipoConta = (tcResult, tcDebCre, tcCreAnt); 
  TfrmCadParamReceitaMT = class(TfrmCadastroMtImob)
    wwQuery1: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    CdsIDPADRLANCIMOVEL: TFloatField;
    CdsUNIDNEGOC: TFloatField;
    CdsIDPESSOA: TFloatField;
    CdsRECPAG: TStringField;
    CdsCODTIPRECDES: TStringField;
    CdsTIPCODIGO: TStringField;
    CdsSUBCONTARESULT: TFloatField;
    CdsCODCENTRORESPON: TStringField;
    CdsCENTROCUSTORESULT: TStringField;
    CdsCENTROCUSTODEBCRE: TStringField;
    CdsCONTADEBCRE: TStringField;
    CdsPLANO: TFloatField;
    CdsCONTARESULT: TStringField;
    CdsIDCARTEIRAINVEST: TFloatField;
    CdsCODTIPIMOVEL: TStringField;
    CdsIDCONTRATOIMOVEL: TFloatField;
    CdsIDTIPOCUSTORECIMO: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsFLGRESPPAGAMENTO: TStringField;
    CdsFLGINTEGRACAPCAR: TFloatField;
    CdsFLGINTEGRACONTAB: TFloatField;
    CdsSUBCONTADEBCRE: TFloatField;
    CdsDESCPADRLANCIMO: TStringField;
    CdsIDMODULO: TFloatField;
    CdsFLGDIARIO: TStringField;
    DBedtDescricao: TDBEdit;
    Label2: TLabel;
    DBchkIntegraCaPCaR: TDBCheckBox;
    DBchkIntegraContab: TDBCheckBox;
    DbChkDiario: TDBCheckBox;
    Bevel1: TBevel;
    DBcboTipoRecCusto: TwwDBLookupCombo;
    Label6: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    Label26: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboTipoRecebDesemb: TwwDBLookupCombo;
    Label7: TLabel;
    grpContaResult: TGroupBox;
    Label25: TLabel;
    Label11: TLabel;
    btnBuscaContaResult: TBitBtn;
    DBcboCCResult: TwwDBLookupCombo;
    DBedtContaResult: TDBEdit;
    DBcboSCResult: TwwDBLookupCombo;
    grpContaDebCre: TGroupBox;
    Label3: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    btnBuscaContaDebCre: TBitBtn;
    DBcboCCDebCre: TwwDBLookupCombo;
    DBedtContaDebCre: TDBEdit;
    DBcboSCDebCre: TwwDBLookupCombo;
    Label28: TLabel;
    DBcboUnidNegocio: TwwDBLookupCombo;
    DBcboTipOper: TwwDBLookupCombo;
    Label4: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    molContrato1: TmolContrato;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    CdsTipoCustoRecImov: TCMClientDataSet;
    CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField;
    CdsTipoCustoRecImovFLGDIARIO: TStringField;
    CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoCustoRecImovRECCUSTO: TStringField;
    CdsCentroRespons: TCMClientDataSet;
    CdsTipoDesembolso: TCMClientDataSet;
    CdsAtividadeProj: TCMClientDataSet;
    CdsTipOper: TCMClientDataSet;
    CdsTipOperTIPCODIGO: TStringField;
    CdsTipOperTIPDESCRICAO: TStringField;
    CdsAtividadeProjUNIDNEGOC: TFloatField;
    CdsAtividadeProjNOME: TStringField;
    CdsTipoDesembolsoCODTIPRECDES: TStringField;
    CdsTipoDesembolsoRECPAG: TStringField;
    CdsTipoDesembolsoDESCRICAO: TStringField;
    CdsCentroResponsCODCENTRORESPON: TStringField;
    CdsCentroResponsNOME: TStringField;
    CdsCentCustoDebCre: TCMClientDataSet;
    CdsCentCustoDebCreCODCENTROCUSTO: TStringField;
    CdsCentCustoDebCreNOME: TStringField;
    CdsIDEMPRESA: TFloatField;
    CdsIMOVEL_EXTENSO: TStringField;
    CdsCONTRATO_EXTENSO: TStringField;
    qryVerificaConta: TwwQuery;
    qryVerificaContaPLACONTA: TStringField;
    qryVerificaContaPLANOME: TStringField;
    qryVerificaContaPLASUBCONTA: TStringField;
    qryVerificaContaPLACCUST: TStringField;
    CdsPlanoConta: TCMClientDataSet;
    CdsPlanoContaPLACONTA: TStringField;
    CdsPlanoContaPLANOME: TStringField;
    CdsPlanoContaPLASUBCONTA: TStringField;
    CdsPlanoContaPLACCUST: TStringField;
    CdsPlanoContaPLATIPO: TStringField;
    CdsCentCustoResult: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    molImovel1: TmolImovelouMestre;
    qryVerificaContaPLACONTAANT: TStringField;
    CMSqlParams1: TCMSqlParams;
    CdsPLACONTAANT: TStringField;
    Label14: TLabel;
    DBEdtContaCredAnt: TDBEdit;
    btnBuscaCredAnt: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure DBedtContaResultExit(Sender: TObject);
    procedure DBedtContaDebCreExit(Sender: TObject);
    procedure btnBuscaContaResultClick(Sender: TObject);
    procedure btnBuscaContaDebCreClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure btnBuscaCredAntClick(Sender: TObject);
    procedure DBEdtContaCredAntExit(Sender: TObject);
  private
    { Private declarations }
    CtrlPadrLancImovel   : TCtrlPadrLancImovel;
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    CtrlTipoImovel       : tCtrlTipoImovel;
    CtrlCentRespon       : TCtrlCentRespon;
    CtrlTiporecebdesemb  : TCtrlTiporecebdesemb;
    CtrlCentroCusto      : TCtrlCentroCusto;
    CtrlUnidNegocio      : TCtrlUnidNegocio;
    CtrlTipOper          : TCtrlTipOper;
    CtrlPlanoConta       : TCtrlPlanoConta;

    // grava o filtro do ms_ccontabil para restaurar no close
    sFiltroMS_CContabil : string;

    procedure PreencheDefaults;

    procedure PreencheResult;
    procedure PreencheDebCre;
    // Daniel Simões - 09/03/2006 -
    procedure PreencheCreAnt;

    procedure SelecionaRegistro(const iIdLanc: Integer);
    function VerificaContaContabil(const tConta: TTipoConta; const sPlaConta: string; var bObrigaCC: boolean): boolean;
    procedure SetCentroCusto (const tConta: TTipoConta; const sPlaConta: string; const bObrigaCC: boolean);

    function VerificaPreenchimento: boolean;
  public
    { Public declarations }
  end;

var
  frmCadParamReceitaMT: TfrmCadParamReceitaMT;

implementation

{$R *.DFM}

procedure TfrmCadParamReceitaMT.FormCreate(Sender: TObject);
begin
  inherited;

  { *****************************************************************************
                criação e inicialização dos objetos
    ***************************************************************************** }

  CtrlPadrLancImovel := TCtrlPadrLancImovel.Create( Sistema.IdEmpresa, Sistema.IdModulo );
  CtrlPadrLancImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                 ComunsImobiliario.MensErroMT);
  CtrlPadrLancImovel.CdsPadrLancImovel := Cds;

  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlTipoCustoRecImov.InitializeAs(CtrlPadrLancImovel);
  CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, 'R');

  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.InitializeAs(CtrlPadrLancImovel);
  CdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;

  CtrlCentRespon := TCtrlCentRespon.Create;
  CtrlCentRespon.InitializeAs(CtrlPadrLancImovel);
  CdsCentroRespons.Data := CtrlCentRespon.ListaCentRespon (Sistema.IdEmpresa, '', 1, 'A');

  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.Create;
  CtrlTiporecebdesemb.InitializeAs(CtrlPadrLancImovel);
  CdsTipoDesembolso.Data := CtrlTiporecebdesemb.ListTiporecebdesemb('R', Sistema.IdEmpresa, 'A', '', '', 'S');

  CtrlCentroCusto := TCtrlCentroCusto.Create;
  CtrlCentroCusto.InitializeAs(CtrlPadrLancImovel);

  CtrlUnidNegocio := TCtrlUnidNegocio.Create;
  CtrlUnidNegocio.InitializeAs(CtrlPadrLancImovel);
  CdsAtividadeProj.Data := CtrlUnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa, 0, '', tapSoAnaliticaAP, toapCodigo, 'S');

  CtrlTipOper := TCtrlTipOper.Create;
  CtrlTipOper.InitializeAs(CtrlPadrLancImovel);
  CdsTipOper.Data := CtrlTipOper.ListaTipOper;

  CtrlPlanoConta := TCtrlPlanoConta.Create;
  CtrlPlanoConta.InitializeAs(CtrlPadrLancImovel);

  { *****************************************************************************
                fim criação e inicialização dos objetos
    ***************************************************************************** }

  if Sistema.IdModulo = 64 then
       DbChkDiario.Visible := ModuloImobiliario.AdminImob.bFlgDiario
  else DbChkDiario.Visible := ModuloImobiliario.Alienacao.bFlgDiario;

  // adiciona o filtro por Empresa Proprietária nos MontaSelect
  MontaSelect.Filtro.Add('PLI.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
  MontaSelect.Filtro.Add('PLI.IDMODULO = ' + IntToStr(Sistema.idModulo));

  if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) ) or
     ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraContab) ) then begin
    CdsCONTARESULT.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
    CdsCONTADEBCRE.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
    CdsPLACONTAANT.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
    dtmMS.MS_CContabil.Mascaras[0]  := trim(IntegraBack.MascaraPlano) + ';0;_';

    sFiltroMS_CContabil := dtmMS.MS_CContabil.Filtro.Text;
    dtmMS.MS_CContabil.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(IntegraBack.Plano));
  end;

  CdsTipoDesembolsoCODTIPRECDES.EditMask := trim(IntegraBack.MascaraReceb) + ';0; ';

end;

procedure TfrmCadParamReceitaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) ) or
     ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraContab) ) then
    dtmMS.MS_CContabil.Filtro.Text := sFiltroMS_CContabil;

  FreeAndNil (CtrlPadrLancImovel);
  FreeAndNil (CtrlTipoCustoRecImov);
  FreeAndNil (CtrlTipoImovel);
  FreeAndNil (CtrlCentRespon);
  FreeAndNil (CtrlTiporecebdesemb);
  FreeAndNil (CtrlCentroCusto);
  FreeAndNil (CtrlUnidNegocio);
  FreeAndNil (CtrlTipOper);
  FreeAndNil (CtrlPlanoConta);
end;

procedure TfrmCadParamReceitaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsRECPAG.AsString := 'R';
  CdsIDPESSOA.AsInteger := Sistema.IdEmpresa;
  CdsIDMODULO.AsInteger := Sistema.IdModulo;

  if molImovel1.edtImovel.Text <> '' then
    CdsIDIMOVEL.AsInteger := molImovel1.iImovel
  else
    CdsIDIMOVEL.Clear;

  if molContrato1.edtContrato.Text <> '' then
    CdsIDCONTRATOIMOVEL.AsInteger := molContrato1.iContrato
  else
    CdsIDCONTRATOIMOVEL.Clear;

  // grava o Plano de Contas e a Conta Contábil
  if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) ) or
     ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraContab) ) then begin
    CdsPLANO.AsInteger := IntegraBack.Plano;
  end else begin
    CdsPLANO.Clear;
    CdsCONTARESULT.Clear;
    CdsPLACONTAANT.Clear; 
    CdsCONTADEBCRE.Clear;
    CdsSUBCONTARESULT.Clear;
    CdsSUBCONTADEBCRE.Clear;
    CdsCENTROCUSTORESULT.Clear;
    CdsCENTROCUSTODEBCRE.Clear;
  end;

  Accept := CtrlPadrLancImovel.GravaPadrLancImovel;
end;

procedure TfrmCadParamReceitaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then SelecionaRegistro( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TfrmCadParamReceitaMT.SelecionaRegistro(const iIdLanc: Integer);
var
  bObrigaCC: boolean;  // não será necessário aqui, apenas para passagem parâmetros
begin
  Cds.Data := CtrlPadrLancImovel.LookUpPadrLancImovel ( Sistema.IdEmpresa, iIdLanc );

  // atribui mol imovel
  if CdsIDIMOVEL.IsNull then
    molImovel1.btnLimpaImovelClick(self)
  else begin
    molImovel1.iImovel := CdsIDIMOVEL.AsInteger;
    molImovel1.edtImovel.Text := CdsIMOVEL_EXTENSO.AsString;
  end;

  // atribuir mol contrato
  if CdsIDCONTRATOIMOVEL.IsNull then
    molContrato1.btnLimpaContratoClick(self)
  else begin
    molContrato1.iContrato := CdsIDCONTRATOIMOVEL.AsInteger;
    molContrato1.edtContrato.Text := CdsCONTRATO_EXTENSO.AsString;
  end;

  // verifica as Contas Contábeis
  if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) ) or
     ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraContab) ) then begin
    if VerificaContaContabil(tcResult, trim(CdsCONTARESULT.AsString), bObrigaCC) then SetCentroCusto(tcResult, trim(CdsCONTARESULT.AsString), bObrigaCC);
    if VerificaContaContabil(tcDebCre, trim(CdsCONTADEBCRE.AsString), bObrigaCC) then SetCentroCusto(tcDebCre, trim(CdsCONTADEBCRE.AsString), bObrigaCC);
    // Daniel Simões - 09/03/2006 -
    if VerificaContaContabil(tcCreAnt, trim(CdsPLACONTAANT.AsString), bObrigaCC) then SetCentroCusto(tcCreAnt, trim(CdsCONTARESULT.AsString), bObrigaCC);
  end;
end;



procedure TfrmCadParamReceitaMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  molImovel1.btnLimpaImovelClick(self);
  molContrato1.btnLimpaContratoClick(self);
  grpContaResult.Caption := ' Conta Crédito ';
  grpContaDebCre.Caption := ' Conta Débito ';
end;

procedure TfrmCadParamReceitaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPadrLancImovel.GravaPadrLancImovel;
end;

procedure TfrmCadParamReceitaMT.PreencheDefaults;  // apenas no insert
begin
   // contabilização diária default 'N'
   CdsFLGDIARIO.AsString := 'N';

   if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraCapCar) ) or
      ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraCapCar) ) then begin
      CdsFLGINTEGRACAPCAR.AsInteger := 1;
   end else begin
      CdsFLGINTEGRACAPCAR.asInteger := 0;
   end;

  if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) ) or
     ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraContab) ) then begin
      CdsFLGINTEGRACONTAB.asInteger := 1;
   end else begin
      CdsFLGINTEGRACONTAB.asInteger := 0;
   end;

   if Sistema.IdModulo = 64 then begin
     CdsCODCENTRORESPON.asString := ModuloImobiliario.AdminImob.sCodCentroRespon;
     CdsUNIDNEGOC.AsInteger      := ModuloImobiliario.AdminImob.iUnidNegoc;
   end else begin
     CdsCODCENTRORESPON.asString := ModuloImobiliario.Alienacao.sCodCentroRespon;
     CdsUNIDNEGOC.AsInteger      := ModuloImobiliario.Alienacao.iUnidNegoc;
   end;
end;

procedure TfrmCadParamReceitaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  PreencheDefaults;
end;

function TfrmCadParamReceitaMT.VerificaPreenchimento: boolean;
begin
  try

    if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraCapCar) ) or
       ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraCapCar) ) then begin
      if CdsFLGINTEGRACAPCAR.asInteger = 1 then begin
        if ( (DBcboCentroRespon.LookupValue = '') or (CdsCODCENTRORESPON.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);
        if ( (DBcboTipoRecebDesemb.LookupValue = '') or (CdsCODTIPRECDES.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Tipo de Desembolso!', DBcboTipoRecebDesemb);
      end;
    end;

    // -------------------------------------------------------------------------------------------
    // só verifica o preenchimento dos campos estritamente contábeis se houver integração
    if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) ) or
       ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraContab) ) then begin

      if CdsFLGINTEGRACONTAB.asInteger = 1 then begin
        // contabilização diária
        if CdsFLGDIARIO.AsString = 'S' then begin
          if DBcboTipoRecCusto.Text = '' then
            raise EValidacao.CreateVal('Para parametrização da contabilização diária é necessário a escolha da Receita!', DBcboTipoRecCusto);
          if DBcboTipoImovel.Text = '' then
            raise EValidacao.CreateVal('Para parametrização da contabilização diária é necessário a escolha do Tipo de Imóvel!', DBcboTipoImovel);
          if CdsTipoCustoRecImovFLGDIARIO.AsString = 'N' then
            raise EValidacao.CreateVal('Este tipo de receita não possui contabilização diária!', DBcboTipoRecCusto);
          if CdsCONTADEBCRE.IsNull then
            raise EValidacao.CreateVal('É necessário indicar a Conta a Débito!', DBedtContaDebCre);
        end;

        if CdsCONTARESULT.IsNULL then
          raise EValidacao.CreateVal('É necessário indicar a Conta a Crédito!', DBedtContaResult);
        if ( DBcboCCResult.Enabled ) and ( (DBcboCCResult.LookupValue = '')  or (CdsCENTROCUSTORESULT.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Centro de Custo a Crédito!', DBcboCCResult);
        if ( (DBcboTipOper.LookupValue = '') or (CdsTIPCODIGO.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação Contábil!', DBcboTipOper);

      end;
    end;

    // Unidade de Negócio --> CaPCaR _e_ Contab
    if ( (CdsFLGINTEGRACONTAB.asInteger = 1) or (CdsFLGINTEGRACAPCAR.asInteger = 1) ) then begin
      if ( (DBcboUnidNegocio.LookupValue = '') or (CdsUNIDNEGOC.IsNULL) ) then
        raise EValidacao.CreateVal('É necessário indicar a Unidade de Negócio!', DBcboUnidNegocio);
    end;

    // -------------------------------------------------------------------------------------------

    // verificar filtros de parametrização
    if Sistema.IdModulo = 64 then begin    // ADMINIMOB
      if DBcboTipoRecCusto.Value <> '' then begin   // a Receita foi selecionada
        if (molContrato1.iContrato > 0) and (not ModuloImobiliario.AdminImob.bFlgParTdCon) then
          raise EValidacao.CreateVal('A parametrização: Contrato X Receita, não foi selecionada nos parâmetros do sistema!', molContrato1.btnBuscaContrato);
        if (molImovel1.iImovel > 0) and (not ModuloImobiliario.AdminImob.bFlgParTdIm) then
          raise EValidacao.CreateVal('A parametrização: Imovel X Receita, não foi selecionada nos parâmetros do sistema!', molImovel1.btnBuscaImovel);
        if (DBcboTipoImovel.Value <> '') and (not ModuloImobiliario.AdminImob.bFlgParTdTpIm) then
          raise EValidacao.CreateVal('A parametrização: Tipo Imovel X Receita, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);
        if (molContrato1.iContrato = -1) and (molImovel1.iImovel = -1) and (DBcboTipoImovel.Value = '') and (not ModuloImobiliario.AdminImob.bFlgParTpDes) then
          raise EValidacao.CreateVal('A parametrização: Receita, não foi selecionada nos parâmetros do sistema!', DBcboTipoRecCusto);
      end else begin                                // a Receita não foi selecionada
        if (molContrato1.iContrato > 0) and (not ModuloImobiliario.AdminImob.bFlgParCon) then
          raise EValidacao.CreateVal('A parametrização: Contrato, não foi selecionada nos parâmetros do sistema!', molContrato1.btnBuscaContrato);
        if (molImovel1.iImovel > 0) and (not ModuloImobiliario.AdminImob.bFlgParIm) then
          raise EValidacao.CreateVal('A parametrização: Imovel, não foi selecionada nos parâmetros do sistema!', molImovel1.btnBuscaImovel);
        if (DBcboTipoImovel.Value <> '') and (not ModuloImobiliario.AdminImob.bFlgParTpIm) then
          raise EValidacao.CreateVal('A parametrização: Tipo Imovel, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);
      end;
    end else begin                         // ALIENACAO
      if DBcboTipoRecCusto.Value <> '' then begin   // a Receita foi selecionada
        if (molContrato1.iContrato > 0) and (not ModuloImobiliario.Alienacao.bFlgParTdCon) then
          raise EValidacao.CreateVal('A parametrização: Contrato X Receita, não foi selecionada nos parâmetros do sistema!', molContrato1.btnBuscaContrato);
        if (molImovel1.iImovel > 0) and (not ModuloImobiliario.Alienacao.bFlgParTdIm) then
          raise EValidacao.CreateVal('A parametrização: Imovel X Receita, não foi selecionada nos parâmetros do sistema!', molImovel1.btnBuscaImovel);
        if (DBcboTipoImovel.Value <> '') and (not ModuloImobiliario.Alienacao.bFlgParTdTpIm) then
          raise EValidacao.CreateVal('A parametrização: Tipo Imovel X Receita, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);
        if (molContrato1.iContrato = -1) and (molImovel1.iImovel = -1) and (DBcboTipoImovel.Value = '') and (not ModuloImobiliario.Alienacao.bFlgParTpDes) then
          raise EValidacao.CreateVal('A parametrização: Receita, não foi selecionada nos parâmetros do sistema!', DBcboTipoRecCusto);
      end else begin                                // a Receita não foi selecionada
        if (molContrato1.iContrato > 0) and (not ModuloImobiliario.Alienacao.bFlgParCon) then
          raise EValidacao.CreateVal('A parametrização: Contrato, não foi selecionada nos parâmetros do sistema!', molContrato1.btnBuscaContrato);
        if (molImovel1.iImovel > 0) and (not ModuloImobiliario.Alienacao.bFlgParIm) then
          raise EValidacao.CreateVal('A parametrização: Imovel, não foi selecionada nos parâmetros do sistema!', molImovel1.btnBuscaImovel);
        if (DBcboTipoImovel.Value <> '') and (not ModuloImobiliario.Alienacao.bFlgParTpIm) then
          raise EValidacao.CreateVal('A parametrização: Tipo Imovel, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);
      end;
    end;

    Result := True;
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Result := false;
    end;
  end;
end;

procedure TfrmCadParamReceitaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadParamReceitaMT.PreencheDebCre;
var
  bObrigaCC: boolean;
begin
  if Cds.State in [dsInsert, dsEdit] then begin
    if VerificaContaContabil (tcDebCre, trim(DBedtContaDebCre.Text), bObrigaCC) then begin
      SetCentroCusto(tcDebCre, trim(DBedtContaDebCre.Text), bObrigaCC);
      if (DBcboCCDebCre.Enabled) and (DBcboCCDebCre.CanFocus) then DBcboCCDebCre.SetFocus;
    end;
  end;
  DBedtContaDebCre.Modified := False;
end;

procedure TfrmCadParamReceitaMT.PreencheResult;
var
  bObrigaCC: boolean;
begin
  if Cds.State in [dsInsert, dsEdit] then begin
    if VerificaContaContabil (tcResult, trim(DBedtContaResult.Text), bObrigaCC) then begin
      SetCentroCusto(tcResult,  trim (DBedtContaResult.Text), bObrigaCC);
      if (DBcboCCResult.Enabled) and (DBcboCCResult.CanFocus) then DBcboCCResult.SetFocus;
    end;
  end;
  DBedtContaResult.Modified := False;
end;

function TfrmCadParamReceitaMT.VerificaContaContabil(const tConta: TTipoConta; const sPlaConta: string; var bObrigaCC: boolean): boolean;
begin
  try
    bObrigaCC   := False;

    if sPlaConta <> '' then begin
      CdsPlanoConta.Data := CtrlPlanoConta.ListCdsPlanoContas(IntegraBack.Plano, sPlaConta);
      if (CdsPlanoConta.isEmpty) or (CdsPlanoContaPLATIPO.AsString = 'S') then begin
        Case tConta of
           tcResult: grpContaResult.Caption := ' Conta Crédito ';
           tcDebCre: grpContaDebCre.Caption := ' Conta Débito ';
        end;
        if tConta = tcResult then
           raise EValidacao.CreateVal('Conta Contábil a Crédito inválida!', DBedtContaResult)
        else
          raise EValidacao.CreateVal('Conta Contábil a Débito inválida!', DBedtContaDebCre);
      end else begin
        bObrigaCC   := CdsPlanoContaPLACCUST.AsString = 'S';

        Case tConta of
          tcResult: grpContaResult.Caption := ' Conta Crédito - ' + CdsPlanoContaPLANOME.AsString + ' ';
          tcDebCre: grpContaDebCre.Caption := ' Conta Débito - ' + CdsPlanoContaPLANOME.AsString + ' ';
        end;
      end;
    end else begin
      Case tConta of
        tcResult: grpContaResult.Caption := ' Conta Crédito ';
        tcDebCre: grpContaDebCre.Caption := ' Conta Débito ';
      end;
    end;
    Result := True;
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      result := false;
    end;
  end;


end;

procedure TfrmCadParamReceitaMT.DBedtContaResultExit(Sender: TObject);
begin
  inherited;
  if DBedtContaResult.Modified then PreencheResult;
end;

procedure TfrmCadParamReceitaMT.DBedtContaDebCreExit(Sender: TObject);
begin
  inherited;
  if DBedtContaDebCre.Modified then PreencheDebCre;
end;

procedure TfrmCadParamReceitaMT.SetCentroCusto(const tConta: TTipoConta; const sPlaConta: string; const bObrigaCC: boolean);
begin
  Case tConta of
    tcResult: begin
      if bObrigaCC then begin
        CdsCentCustoResult.Data := CtrlCentroCusto.ListaCentCustCompleto(Sistema.IdUsuario,
                                                                     Sistema.IdEmpresa,
                                                                     IntegraBack.Plano,
                                                                     sPlaConta,
                                                                     tccSoAnalitica, toccNome);
        DBcboCCResult.Enabled   := True;
      end else begin
        if Cds.State in dsEditModes then CdsCENTROCUSTORESULT.Clear;
        CdsCentCustoResult.Close;
        DBcboCCResult.Clear;
        DBcboCCResult.Enabled   := False;
      end;
    end;

    tcDebCre: begin
      if bObrigaCC then begin
        CdsCentCustoDebCre.Data := CtrlCentroCusto.ListaCentCustCompleto(Sistema.IdUsuario,
                                                                     Sistema.IdEmpresa,
                                                                     IntegraBack.Plano,
                                                                     sPlaConta,
                                                                     tccSoAnalitica, toccNome);
        DBcboCCDebCre.Enabled   := True;

      end else begin
        if Cds.State in dsEditModes then CdsCENTROCUSTODEBCRE.Clear;
        CdsCentCustoDebCre.Close;
        DBcboCCDebCre.Clear;
        DBcboCCDebCre.Enabled   := False;
      end;
    end;
  end;
end;

procedure TfrmCadParamReceitaMT.btnBuscaContaResultClick(Sender: TObject);
begin
  inherited;
  dtmMS.MS_CContabil.Executar;
  Repaint;
  if dtmMS.MS_CContabil.RetornouValor then CdsCONTARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
  PreencheResult;
end;

procedure TfrmCadParamReceitaMT.btnBuscaContaDebCreClick(Sender: TObject);
begin
  inherited;
  dtmMS.MS_CContabil.Executar;
  Repaint;
  if dtmMS.MS_CContabil.RetornouValor then CdsCONTADEBCRE.Text := dtmMS.MS_CContabil.ValoresChave[0];
  PreencheDebCre;
end;

procedure TfrmCadParamReceitaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o cds com o registro após a edição 
  if cmeCadastro.Operacao = opAlterar then
     Cds.Data := CtrlPadrLancImovel.LookUpPadrLancImovel ( Sistema.IdEmpresa, CdsIDPADRLANCIMOVEL.AsInteger );
end;


procedure TfrmCadParamReceitaMT.btnBuscaCredAntClick(Sender: TObject);
begin
  inherited;
// Daniel Simões - 09/03/2006 - ------------------------------------------------
  dtmMS.MS_CContabil.Executar;
  Repaint;
  if dtmMS.MS_CContabil.RetornouValor then CdsPLACONTAANT.Text := dtmMS.MS_CContabil.ValoresChave[0];
  PreencheCreAnt;
// Daniel Simões - 09/03/2006 - ------------------------------------------------
end;

procedure TfrmCadParamReceitaMT.PreencheCreAnt;
var
  bObrigaCC: boolean;
begin
  if Cds.State in [dsInsert, dsEdit] then begin
    if VerificaContaContabil (tcCreAnt, trim(DBEdtContaCredAnt.Text), bObrigaCC) then
      SetCentroCusto(tcCreAnt,  trim (DBEdtContaCredAnt.Text), bObrigaCC);
  end;
  DBEdtContaCredAnt.Modified := False;
end;

procedure TfrmCadParamReceitaMT.DBEdtContaCredAntExit(Sender: TObject);
begin
  inherited;
  if DBEdtContaCredAnt.Modified then PreencheCreAnt;
end;

end.
