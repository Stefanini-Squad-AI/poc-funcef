{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina.......: VerificaChavePrimaria
SOL..........: 207575
Kintana......: 2027786
Data.........: 28/06/2013
Responsável..: Marcio Sanches Spinosa SOL 207575 Kintana 2027786
Descrição....: Ajuste na funcionalidade para verificar se é uma alteração.
--------------------------------------------------------------------------------
Rotina.......: VerificaChavePrimaria
SOL..........: 201607
Kintana......: 1949118
Data.........: 04/03/2013
Responsável..: Marcio Sanches Spinosa SOL 201607 Kintana 1949118
Descrição....: Verificar a chave primaria antes efetuar o insert, para não
ocasionar erros.
--------------------------------------------------------------------------------
}
unit fCadParamDespesaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, Db, Provider, DBTables, Wwquery, MontaSelect, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, wwdblook, DBCtrls, Mask, mImovel, mContrato, uCtrlTipoCustoRecImov,
  uCtrlTipoImovel, uCtrlCentRespon, uCtrlTiporecebdesemb, uCtrlCentroCusto,
  uCtrlUnidNegocio, uCtrlTipOper, uCtrlPadrLancImovel, uSistema, uCMTypes,
  UComunsImobiliario, uVerificaPreenchimento, dBaseDados, uIntegraBack, uModuloAdminImob, uModuloImobiliario,
  dMs, uMensErro, uCtrlPlanoConta, mImovelouMestre;

type
  TTipoConta = (tcResult, tcDebCre);
  TfrmCadParamDespesaMT = class(TfrmCadastroMtImob)
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
    Label14: TLabel;
    cdsCentCusto: TCMClientDataSet;
    StringField3: TStringField;
    StringField4: TStringField;
    DBcboCentroCusto: TwwDBLookupCombo;
    CdsCODCENTROCUSTO: TStringField;
    molImovel1: TmolImovelouMestre;
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
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
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
    pAlteracao : boolean; //Marcio Sanches Spinosa SOL 207575 Kintana 2027786
    procedure PreencheDefaults;

    procedure PreencheResult;
    procedure PreencheDebCre;
    procedure SelecionaRegistro(const iIdLanc: Integer);
    function VerificaContaContabil(const tConta: TTipoConta; const sPlaConta: string; var bObrigaCC: boolean): boolean;
    procedure SetCentroCusto (const tConta: TTipoConta; const sPlaConta: string; const bObrigaCC: boolean);

    function VerificaPreenchimento: boolean;
    //Marcio Sanches Spinosa SOL 201607 Kintana 1949118 - Inicio
    function VerificaChavePrimaria(pRecPag, pCodTipImovel, pFlgDiario : string;
                                   pIdTipoCustoRecImo, pIdContratoImovel, pIdImovel : Integer;
                                   pIsAlteracao : boolean): Boolean;//Marcio Sanches Spinosa SOL 207575 Kintana 2027786
    //Marcio Sanches Spinosa SOL 201607 Kintana 1949118 - Fim

  public
    { Public declarations }

  end;

var
  frmCadParamDespesaMT: TfrmCadParamDespesaMT;

implementation

{$R *.DFM}

procedure TfrmCadParamDespesaMT.FormCreate(Sender: TObject);
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
  CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, 'C');

  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.InitializeAs(CtrlPadrLancImovel);
  CdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;

  CtrlCentRespon := TCtrlCentRespon.Create;
  CtrlCentRespon.InitializeAs(CtrlPadrLancImovel);
  CdsCentroRespons.Data := CtrlCentRespon.ListaCentRespon (Sistema.IdEmpresa, '', 1, 'A');

  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.Create;
  CtrlTiporecebdesemb.InitializeAs(CtrlPadrLancImovel);
  CdsTipoDesembolso.Data := CtrlTiporecebdesemb.ListTiporecebdesemb('P', Sistema.IdEmpresa, 'A', '', '', 'S');

  CtrlCentroCusto := TCtrlCentroCusto.Create;
  CtrlCentroCusto.InitializeAs(CtrlPadrLancImovel);
  CdsCentCusto.Data := CtrlCentroCusto.ListaCentroCusto(Sistema.IdEmpresa);

  CtrlUnidNegocio := TCtrlUnidNegocio.Create;
  CtrlUnidNegocio.InitializeAs(CtrlPadrLancImovel);
  CdsAtividadeProj.Data := CtrlUnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa, 0, '', tapSoAnaliticaAP);

  CtrlTipOper := TCtrlTipOper.Create;
  CtrlTipOper.InitializeAs(CtrlPadrLancImovel);
  CdsTipOper.Data := CtrlTipOper.ListaTipOper;

  CtrlPlanoConta := TCtrlPlanoConta.Create;
  CtrlPlanoConta.InitializeAs(CtrlPadrLancImovel);

  { *****************************************************************************
                fim criação e inicialização dos objetos
    ***************************************************************************** }


  DbChkDiario.Visible := ModuloImobiliario.AdminImob.bFlgDiario;

  // adiciona o filtro por Empresa Proprietária nos MontaSelect
  MontaSelect.Filtro.Add('PLI.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
  MontaSelect.Filtro.Add('PLI.IDMODULO = ' + IntToStr(Sistema.idModulo));

  if ((Sistema.IdModulo = 64) or (Sistema.IdModulo = 135)) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) then begin
    CdsCONTARESULT.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
    CdsCONTADEBCRE.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
    dtmMS.MS_CContabil.Mascaras[0]  := trim(IntegraBack.MascaraPlano) + ';0;_';

    sFiltroMS_CContabil := dtmMS.MS_CContabil.Filtro.Text;
    dtmMS.MS_CContabil.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(IntegraBack.Plano));
  end;

  if (Sistema.IdModulo = 64) then
     CdsTipoDesembolsoCODTIPRECDES.EditMask := trim(Modulo.sMascaraDesemb) + ';0; '
  else
     CdsTipoDesembolsoCODTIPRECDES.EditMask := ';0; ';

  DbChkDiario.Visible := False;

  pAlteracao := False; //Marcio Sanches Spinosa SOL 207575 Kintana 2027786

end;

procedure TfrmCadParamDespesaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) then
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

procedure TfrmCadParamDespesaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsRECPAG.AsString := 'P';
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
  if ((Sistema.IdModulo = 64) or (Sistema.IdModulo = 135)) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) then begin
    CdsPLANO.AsInteger := IntegraBack.Plano;
  end else begin
    CdsPLANO.Clear;
    CdsCONTARESULT.Clear;
    CdsCONTADEBCRE.Clear;
    CdsSUBCONTARESULT.Clear;
    CdsSUBCONTADEBCRE.Clear;
    CdsCENTROCUSTORESULT.Clear;
    CdsCENTROCUSTODEBCRE.Clear;
  end;

  if (VerificaChavePrimaria(CdsRECPAG.AsString,
                            CdsCODTIPIMOVEL.AsString,
                            CdsFLGDIARIO.AsString,
                            CdsIDTIPOCUSTORECIMO.AsInteger,
                            CdsIDCONTRATOIMOVEL.AsInteger,
                            CdsIDIMOVEL.AsInteger,
                            pAlteracao)) then //Marcio Sanches Spinosa SOL 207575 Kintana 2027786
    Accept := CtrlPadrLancImovel.GravaPadrLancImovel
  else
  begin
    ShowMessage('Já existe parametrização cadastrada para o tipo de imóvel, despesa e tipo de desembolso informados');
    exit;
  end;
end;

procedure TfrmCadParamDespesaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then SelecionaRegistro( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TfrmCadParamDespesaMT.SelecionaRegistro(const iIdLanc: Integer);
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
  if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) then begin
    if VerificaContaContabil(tcResult, trim(CdsCONTARESULT.AsString), bObrigaCC) then SetCentroCusto(tcResult, trim(CdsCONTARESULT.AsString), bObrigaCC);
    if VerificaContaContabil(tcDebCre, trim(CdsCONTADEBCRE.AsString), bObrigaCC) then SetCentroCusto(tcDebCre, trim(CdsCONTADEBCRE.AsString), bObrigaCC);
  end;
end;


procedure TfrmCadParamDespesaMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  molImovel1.btnLimpaImovelClick(self);
  molContrato1.btnLimpaContratoClick(self);
  grpContaResult.Caption := ' Conta Débito ';
  grpContaDebCre.Caption := ' Conta Crédito ';
  pAlteracao := False;//Marcio Sanches Spinosa SOL 207575 Kintana 2027786
end;

procedure TfrmCadParamDespesaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPadrLancImovel.GravaPadrLancImovel;
end;

procedure TfrmCadParamDespesaMT.PreencheDefaults;  // apenas no insert
begin
   // contabilização diária default 'N'
   CdsFLGDIARIO.AsString := 'N';

   if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.bFlgIntegraCapCar) then begin
      CdsFLGINTEGRACAPCAR.AsInteger := 1;
   end else begin
      CdsFLGINTEGRACAPCAR.asInteger := 0;
   end;

  if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) then begin
      CdsFLGINTEGRACONTAB.asInteger := 1;
   end else begin
      CdsFLGINTEGRACONTAB.asInteger := 0;
   end;

   CdsCODCENTRORESPON.asString := ModuloImobiliario.AdminImob.sCodCentroRespon;
   CdsUNIDNEGOC.AsInteger := ModuloImobiliario.AdminImob.iUnidNegoc;
end;

procedure TfrmCadParamDespesaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  PreencheDefaults;
end;

function TfrmCadParamDespesaMT.VerificaPreenchimento: boolean;
begin
  try
    if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.bFlgIntegraCapCar) then begin
      if CdsFLGINTEGRACAPCAR.asInteger = 1 then begin
        if ( (DBcboCentroRespon.LookupValue = '') or (CdsCODCENTRORESPON.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);
        if ( (DBcboTipoRecebDesemb.LookupValue = '') or (CdsCODTIPRECDES.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Tipo de Desembolso!', DBcboTipoRecebDesemb);
      end;
    end;
    // -------------------------------------------------------------------------------------------
    // só verifica o preenchimento dos campos estritamente contábeis se houver integração
    if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab) then begin
      if CdsFLGINTEGRACONTAB.asInteger = 1 then begin
        // contabilização diária
        if CdsFLGDIARIO.AsString = 'S' then begin
          if DBcboTipoRecCusto.Text = '' then
            raise EValidacao.CreateVal('Para parametrização da contabilização diária é necessário a escolha da Despesa!', DBcboTipoRecCusto);
          if DBcboTipoImovel.Text = '' then
            raise EValidacao.CreateVal('Para parametrização da contabilização diária é necessário a escolha do Tipo de Imóvel!', DBcboTipoImovel);
          if CdsTipoCustoRecImovFLGDIARIO.AsString = 'N' then
            raise EValidacao.CreateVal('Este tipo de despesa não possui contabilização diária!', DBcboTipoRecCusto);
          if CdsCONTADEBCRE.IsNull then
            raise EValidacao.CreateVal('É necessário indicar a Conta a Crédito!', DBedtContaDebCre);
        end;

        if CdsCONTARESULT.IsNULL then
          raise EValidacao.CreateVal('É necessário indicar a Conta a Débito!', DBedtContaResult);
        if ( DBcboCCResult.Enabled ) and ( (DBcboCCResult.LookupValue = '')  or (CdsCENTROCUSTORESULT.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Centro de Custo a Débito!', DBcboCCResult);
        if ( (DBcboTipOper.LookupValue = '') or (CdsTIPCODIGO.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação Contábil!', DBcboTipOper);

      end;
    end;

    // -------------------------------------------------------------------------------------------

    // Unidade de Negócio --> CaPCaR _e_ Contab
    if ( (CdsFLGINTEGRACONTAB.asInteger = 1) or (CdsFLGINTEGRACAPCAR.asInteger = 1) ) then begin
      if ( (DBcboUnidNegocio.LookupValue = '') or (CdsUNIDNEGOC.IsNULL) ) then
        raise EValidacao.CreateVal('É necessário indicar a Unidade de Negócio!', DBcboUnidNegocio);
    end;

    // -------------------------------------------------------------------------------------------

    // verificar filtros de parametrização
    if DBcboTipoRecCusto.Value <> '' then begin   // a despesa foi selecionada
      if (molContrato1.iContrato > 0) and (not ModuloImobiliario.AdminImob.bFlgParTdCon) then
        raise EValidacao.CreateVal('A parametrização: Contrato X Despesa, não foi selecionada nos parâmetros do sistema!', molContrato1.btnBuscaContrato);
      if (molImovel1.iImovel > 0) and (not ModuloImobiliario.AdminImob.bFlgParTdIm) then
        raise EValidacao.CreateVal('A parametrização: Imovel X Despesa, não foi selecionada nos parâmetros do sistema!', molImovel1.btnBuscaImovel);
      if (DBcboTipoImovel.Value <> '') and (not ModuloImobiliario.AdminImob.bFlgParTdTpIm) then
        raise EValidacao.CreateVal('A parametrização: Tipo Imovel X Despesa, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);
      if (molContrato1.iContrato = -1) and (molImovel1.iImovel = -1) and (DBcboTipoImovel.Value = '') and (not ModuloImobiliario.AdminImob.bFlgParTpDes) then
        raise EValidacao.CreateVal('A parametrização: Despesa, não foi selecionada nos parâmetros do sistema!', DBcboTipoRecCusto);
    end else begin                                // a despesa não foi selecionada
      if (molContrato1.iContrato > 0) and (not ModuloImobiliario.AdminImob.bFlgParCon) then
        raise EValidacao.CreateVal('A parametrização: Contrato, não foi selecionada nos parâmetros do sistema!', molContrato1.btnBuscaContrato);
      if (molImovel1.iImovel > 0) and (not ModuloImobiliario.AdminImob.bFlgParIm) then
        raise EValidacao.CreateVal('A parametrização: Imovel, não foi selecionada nos parâmetros do sistema!', molImovel1.btnBuscaImovel);
      if (DBcboTipoImovel.Value <> '') and (not ModuloImobiliario.AdminImob.bFlgParTpIm) then
        raise EValidacao.CreateVal('A parametrização: Tipo Imovel, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);
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

procedure TfrmCadParamDespesaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadParamDespesaMT.PreencheDebCre;
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

procedure TfrmCadParamDespesaMT.PreencheResult;
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

function TfrmCadParamDespesaMT.VerificaContaContabil(const tConta: TTipoConta; const sPlaConta: string; var bObrigaCC: boolean): boolean;
begin
  try
    bObrigaCC   := False;

    if sPlaConta <> '' then begin
      CdsPlanoConta.Data := CtrlPlanoConta.ListCdsPlanoContas(IntegraBack.Plano, sPlaConta);
      if (CdsPlanoConta.isEmpty) or (CdsPlanoContaPLATIPO.AsString = 'S') then begin
        Case tConta of
           tcResult: grpContaResult.Caption := ' Conta Débito ';
           tcDebCre: grpContaDebCre.Caption := ' Conta Crédito ';
        end;
        if tConta = tcResult then
          raise EValidacao.CreateVal('Conta Contábil a Débito inválida!', DBedtContaResult)
        else
          raise EValidacao.CreateVal('Conta Contábil a Crédito inválida!', DBedtContaDebCre);
      end else begin
        { se o sistema obrigar sub-conta de resultado - a mesma será fornecida pelo
          imóvel ou pelo mestre

          se o sistema obrigar sub-conta de ativo/passivo - a mesma será fornecida pelo
          cliente/fornecedor.
        }
        bObrigaCC   := CdsPlanoContaPLACCUST.AsString = 'S';

        Case tConta of
          tcResult: grpContaResult.Caption := ' Conta Débito - ' + CdsPlanoContaPLANOME.AsString + ' ';
          tcDebCre: grpContaDebCre.Caption := ' Conta Crédito - ' + CdsPlanoContaPLANOME.AsString + ' ';
        end;
      end;
    end else begin
      Case tConta of
        tcResult: grpContaResult.Caption := ' Conta Débito ';
        tcDebCre: grpContaDebCre.Caption := ' Conta Crédito ';
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

procedure TfrmCadParamDespesaMT.DBedtContaResultExit(Sender: TObject);
begin
  inherited;
  if DBedtContaResult.Modified then PreencheResult;
end;

procedure TfrmCadParamDespesaMT.DBedtContaDebCreExit(Sender: TObject);
begin
  inherited;
  if DBedtContaDebCre.Modified then PreencheDebCre;
end;

procedure TfrmCadParamDespesaMT.SetCentroCusto(const tConta: TTipoConta; const sPlaConta: string; const bObrigaCC: boolean);
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

procedure TfrmCadParamDespesaMT.btnBuscaContaResultClick(Sender: TObject);
begin
  inherited;
  dtmMS.MS_CContabil.Executar;
  Repaint;
  if dtmMS.MS_CContabil.RetornouValor then CdsCONTARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
  PreencheResult;
end;

procedure TfrmCadParamDespesaMT.btnBuscaContaDebCreClick(Sender: TObject);
begin
  inherited;
  dtmMS.MS_CContabil.Executar;
  Repaint;
  if dtmMS.MS_CContabil.RetornouValor then CdsCONTADEBCRE.Text := dtmMS.MS_CContabil.ValoresChave[0];
  PreencheDebCre;
end;

procedure TfrmCadParamDespesaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o cds com o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     Cds.Data := CtrlPadrLancImovel.LookUpPadrLancImovel ( Sistema.IdEmpresa, CdsIDPADRLANCIMOVEL.AsInteger );
end;

//Marcio Sanches Spinosa SOL 201607 Kintana 1949118 - Inicio
function TfrmCadParamDespesaMT.VerificaChavePrimaria(pRecPag,
  pCodTipImovel, pFlgDiario: string; pIdTipoCustoRecImo, pIdContratoImovel, pIdImovel: Integer;
  pIsAlteracao : boolean): Boolean;//Marcio Sanches Spinosa SOL 207575 Kintana 2027786
  var
    pCdsVerificaChave : TCMClientDataSet;
    strSQL            : string;
begin
   Result := True;

   pCdsVerificaChave := TCMClientDataSet.Create(nil);

   strSQL := 'SELECT IDPADRLANCIMOVEL FROM PADRLANCIMOVEL ' +
             ' WHERE RECPAG = ' + QuotedStr(pRecPag) +
             ' AND CODTIPIMOVEL = ' + QuotedStr(pCodTipImovel) +
             ' AND IDTIPOCUSTORECIMO = ' + IntToStr(pIdTipoCustoRecImo) +
             ' AND FLGDIARIO = ' + QuotedStr(pFlgDiario);

   if (pIdContratoImovel > 0) then
      strSQL := strSQL + ' AND IDCONTRATOIMOVEL = ' + IntToStr(pIdContratoImovel)
   else
      strSQL := strSQL + ' AND IDCONTRATOIMOVEL IS NULL ';

   if (pIdImovel > 0) then
     strSQL := strSQL + ' AND IDIMOVEL = ' + IntToStr(pIdImovel)
   else
     strSQL := strSQL + ' AND IDIMOVEL IS NULL ';


   pCdsVerificaChave.Data := CtrlPadrLancImovel.GetDataPacket(strSQL);

   if (pCdsVerificaChave.RecordCount > 0)
   and not (pIsAlteracao) then //Marcio Sanches Spinosa SOL 207575 Kintana 2027786
      Result := False;

   strSQL := EmptyStr;
   FreeAndNil(pCdsVerificaChave);

end;
//Marcio Sanches Spinosa SOL 201607 Kintana 1949118 - Fim

procedure TfrmCadParamDespesaMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  pAlteracao := True; //Marcio Sanches Spinosa SOL 207575 Kintana 2027786
end;

procedure TfrmCadParamDespesaMT.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  pAlteracao := False; //Marcio Sanches Spinosa SOL 207575 Kintana 2027786
end;

procedure TfrmCadParamDespesaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  pAlteracao := False; //Marcio Sanches Spinosa SOL 207575 Kintana 2027786
end;

procedure TfrmCadParamDespesaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pAlteracao := False;//Marcio Sanches Spinosa SOL 207575 Kintana 2027786
end;

end.
