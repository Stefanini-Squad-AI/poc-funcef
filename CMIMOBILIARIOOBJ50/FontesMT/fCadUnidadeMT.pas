{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                      CADASTRO DE UNIDADES  ( MT )

              Módulo          :  ComunsImobiliario
              Autor           :  Daniel Simões Braga
              Data de Término :  17/04/2007
              
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24083
Responsável : Daniel Simões
Data        : 22/05/2007
Descrição   : Inclusão do Número do Processo no Cadastro de Eventos.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadUnidadeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, Mask, DBCtrls2, 
  Wwdbgrd2, wwriched, wwdbedit, Wwdotdot, Wwdbcomb, mCartorio, mAdministradora,
  uCtrlImovel, uCtrlMarcas, uCtrlSubConta, uCtrlMoeda, uCtrlPais, uCtrlEstado,
  uCtrlContratoImovel, uCtrlEventoImovel, uCtrlOutroDado, uCtrlIndicadorImovel,
  uCtrlCidade, uCtrlPlanPrevContabil, uCtrlBack, Wwdbspin, uCMTypes, DBTables,
  Wwquery, TREdit, Provider, uCmSqlParams, Jpeg, ExtDlgs, ShellAPI,
  mArvoreCompl, TB97Tlwn, mImovel;

type
  TfrmCadUnidadeMT = class(TFrmCadastroMestreDetMTImob)
    Label2: TLabel;
    DBedtNomeUnidade: TDBEdit2;
    tbsGeral: TTabSheet;
    Label6: TLabel;
    DBcboMarca: TwwDBLookupCombo;
    Label16: TLabel;
    Label40: TLabel;
    DBedtVagas: TDBEdit;
    Bevel1: TBevel;
    Label39: TLabel;
    DBedtTipoImovel: TDBEdit;
    Label20: TLabel;
    DBcboSubConta: TwwDBLookupCombo;
    tbsEndereco: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBedtLogradouro: TDBEdit2;
    DBedtComplemento: TDBEdit2;
    DBedtNumero: TDBEdit2;
    DBedtBairro: TDBEdit2;
    DBedtCEP: TDBEdit2;
    tbsDescricao: TTabSheet;
    wwDBGrid21: TwwDBGrid2;
    Label15: TLabel;
    DBedtDataConstrucao: TCMDateTimePicker;
    tbsIndicadores: TTabSheet;
    tbsEventos: TTabSheet;
    dbgrdIndicador: TwwDBGrid2;
    tbsObs: TTabSheet;
    tbsDesmembra: TTabSheet;
    GroupBox6: TGroupBox;
    Label33: TLabel;
    DBedtAreaTotal: TDBEdit;
    Label4: TLabel;
    DBedtAreaUtil: TDBEdit;
    Label22: TLabel;
    DBedtAreaGerencial: TDBEdit;
    Label41: TLabel;
    DBedtAreaComum: TDBEdit;
    Label21: TLabel;
    DBedtCodigo: TDBEdit2;
    molAdministradora1: TmolAdministradora;
    Panel1: TPanel;
    gbEvento: TGroupBox;
    Panel7: TPanel;
    DBmemDescricao: TwwDBRichEdit;
    Panel8: TPanel;
    gbDescricao: TGroupBox;
    Panel9: TPanel;
    DBmemDescricaoImovel: TwwDBRichEdit;
    Panel3: TPanel;
    dsIndicador: TwwDataSource;
    dsEvento: TwwDataSource;
    CdsIDIMOVELMESTRE: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsIDCIDADES: TFloatField;
    CdsCODSUBCONTA: TFloatField;
    CdsIDPESSOA: TFloatField;
    CdsIDMARCA: TFloatField;
    CdsIDPAIS: TFloatField;
    CdsIDADMINIMOVEL: TFloatField;
    CdsFLGTIPOIMOVEL: TFloatField;
    CdsIMODATACONSTRUCAO: TDateTimeField;
    CdsIMOAREA: TFloatField;
    CdsIMOFRACAOIDEAL: TFloatField;
    CdsIMODESCRICAO: TMemoField;
    CdsFLGSTATUSOCUPACAO: TStringField;
    CdsQTDETOTALCOTAS: TFloatField;
    CdsIMONOME: TStringField;
    CdsIMOLOGRADOURO: TStringField;
    CdsIMONUMERO: TStringField;
    CdsIMOCOMPLEMENTO: TStringField;
    CdsIMOBAIRRO: TStringField;
    CdsIMONOMEENDERECO: TStringField;
    CdsIMOCEP: TStringField;
    CdsCODTIPIMOVEL: TStringField;
    CdsFLGATIVO: TFloatField;
    CdsIMOPERCENTRATEIO: TFloatField;
    CdsIMOMOEDACOMPRA: TFloatField;
    CdsIMOVLRCOMPRA: TFloatField;
    CdsIMODATACOMPRA: TDateTimeField;
    CdsIMOMATRICULA: TStringField;
    CdsIMOOBSERVACAO: TMemoField;
    CdsIMODATAHABITESE: TDateTimeField;
    CdsIDCARTORIO: TFloatField;
    CdsFLGSTATUS: TStringField;
    CdsIMOCODIGO: TStringField;
    CdsIMOAREAGERENCIAL: TFloatField;
    CdsFLGCATIMOVEL: TStringField;
    CdsIMOVLRREAVAL: TFloatField;
    CdsIMODATAREAVAL: TDateTimeField;
    CdsIMOVLRMERCADO: TFloatField;
    CdsIMODATAMERCADO: TDateTimeField;
    CdsIMOMOEDAREAVAL: TFloatField;
    CdsIMOMOEDAMERCADO: TFloatField;
    CdsIDRESPONSAVEL: TFloatField;
    CdsIMOVAGAS: TFloatField;
    CdsIMOAREACOMUM: TFloatField;
    CdsIMOAREATOTAL: TFloatField;
    CdsIMOVEL_EXTENSO: TStringField;
    CdsDSC_MESTRE: TStringField;
    CdsDSC_ADMINISTRADORA: TStringField;
    CdsDSC_CARTORIO: TStringField;
    CdsDSC_TIPOIMOVEL: TStringField;
    cdsMarcas: TCMClientDataSet;
    cdsMarcasMRCNOME: TStringField;
    cdsMarcasIDMARCA: TFloatField;
    cdsSubConta: TCMClientDataSet;
    cdsSubContaCODSUBCONTA: TFloatField;
    cdsSubContaNOMESUBCONTA: TStringField;
    cdsMoeda: TCMClientDataSet;
    cdsMoedaMOESIGLA: TStringField;
    cdsMoedaMOECODIGO: TFloatField;
    cdsMoedaMOEDESC: TStringField;
    cdsMoedaMOEPERIODICIDADE: TStringField;
    cdsMoedaFLGPERCVALOR: TStringField;
    MontaEndereco: TMontaSelect;
    cdsContrato: TCMClientDataSet;
    cdsContratoCONNUMERO: TStringField;
    cdsContratoCONNOME: TStringField;
    dsContrato: TwwDataSource;
    cdsContratoCONDATAINICIO: TDateTimeField;
    cdsContratoCONDATAFIM: TDateTimeField;
    cdsEvento: TCMClientDataSet;
    cdsEventoIDEVENTOIMOVEL: TFloatField;
    cdsEventoIDIMOVEL: TFloatField;
    cdsEventoEVIDATA: TDateTimeField;
    cdsEventoEVICABECALHO: TStringField;
    cdsEventoEVIDESCRICAO: TMemoField;
    cdsEventoIDUSUARIO: TFloatField;
    cdsEventoIDCONTRATOIMOVEL: TFloatField;
    cdsEventoFLGTIPOEVENTO: TStringField;
    cdsEventoEVIVLRANTERIOR: TFloatField;
    cdsEventoEVIVLRAJUSTADO: TFloatField;
    cdsEventoEVIDATAPROX: TDateTimeField;
    cdsEventoEVIPERCENT: TFloatField;
    cdsEventoEVIINDICEREAJUSTE: TFloatField;
    cdsEventoIDCONTRATOLOJA: TFloatField;
    cdsEventoDSC_INDICE: TStringField;
    cdsIndicador: TCMClientDataSet;
    cdsIndicadorIDINDICADORXAPUR: TFloatField;
    cdsIndicadorIDIMOVEL: TFloatField;
    cdsIndicadorIDUNIDAUT: TFloatField;
    cdsIndicadorMESCOMPETENCIA: TFloatField;
    cdsIndicadorANOCOMPETENCIA: TFloatField;
    cdsIndicadorVLRAPURADO: TFloatField;
    cdsIndicadorDATAAPURADO: TDateTimeField;
    cdsIndicadorFLGPREVREAL: TStringField;
    cdsIndicadorIDINDICADORIMOVEL: TFloatField;
    cdsIndicadorINMDESCRICAO: TStringField;
    cdsIndicadorFLGTIPOVALOR: TStringField;
    cdsIndicadorRECPAG: TStringField;
    cdsIndicadorDSC_TIPOVALOR: TStringField;
    cdsIndicadorDSC_RECPAG: TStringField;
    cdsIndicadorDSC_PREVREAL: TStringField;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel10: TPanel;
    dbgrdEvento: TwwDBGrid2;
    Label3: TLabel;
    DBedtDataEvento: TCMDateTimePicker;
    Label1: TLabel;
    DBedtCabEvento: TDBEdit;
    Label5: TLabel;
    DBedtVlrAnterior: TDBEdit;
    Label14: TLabel;
    DBedtVlrAjustado: TDBEdit;
    Label19: TLabel;
    DBedtPercent: TDBEdit;
    CMDateTimePicker1: TCMDateTimePicker;
    Label36: TLabel;
    Label42: TLabel;
    dbcboIndicador: TwwDBLookupCombo;
    DBrdgPrevReal: TDBRadioGroup;
    dbedtDataIndicador: TCMDateTimePicker;
    Label45: TLabel;
    GroupBox5: TGroupBox;
    Label43: TLabel;
    cboMesCompetencia: TwwDBComboBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    Label46: TLabel;
    GroupBox7: TGroupBox;
    dbedtVlrIndicador: TDBEdit;
    cdsLookIndicador: TCMClientDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    CdsIndicadorFLGUNIDAUT: TFloatField;
    Label44: TLabel;
    CdsIDESTADO: TFloatField;
    DBedtFracaoIdeal: TDBRealEdit;
    Label11: TLabel;
    dbcbSitImovel: TwwDBComboBox;
    CdsCODIMOVELSPC: TFloatField;
    tbsPlanoPatro: TTabSheet;
    dbgrdPlanoPatro: TwwDBGrid;
    pnlPlanoPatro: TPanel;
    dsPlanoPatro: TwwDataSource;
    cdsPlanoPatro: TCMClientDataSet;
    cdsPlanoPatroIDIMOVEL: TFloatField;
    cdsPlanoPatroIDPATRO: TFloatField;
    cdsPlanoPatroIDPLANOPREV: TFloatField;
    cdsPlanoPatroPPIPERCENTRATEIO: TFloatField;
    cdsPlanoPatroNOME_PATRO: TStringField;
    cdsPlanoPatroNOME_PLANO: TStringField;
    Panel11: TPanel;
    Panel5: TPanel;
    DBmemObservacao: TwwDBRichEdit;
    cdsImagensXImoveis: TCMClientDataSet;
    dsImagensXImoveis: TDataSource;
    opdImagem: TOpenPictureDialog;
    dbGrdImagens: TwwDBGrid;
    Panel13: TPanel;
    Label51: TLabel;
    Label52: TLabel;
    EdtArquivoImagem: TEdit;
    Panel14: TPanel;
    ScrollBox2: TScrollBox;
    Image: TImage;
    Button1: TButton;
    DBDescrimagem: TDBEdit;
    DBImage: TDBImage;
    cdsImagensXImoveisIDIMAGEM: TFloatField;
    cdsImagensXImoveisIMAGEM: TBlobField;
    cdsImagensXImoveisDESCRIMAGEM: TStringField;
    cdsImagensXImoveisIDIMOVEL: TFloatField;
    cdsPlanoPatroDESCR_FLGTIPO: TStringField;
    cdsPlanoPatroFLGTIPO: TStringField;
    CdsIDCARTEIRASPC: TFloatField;
    CdsIMOCIDADE: TStringField;
    CdsCODESTADO: TStringField;
    CdsTAXACOMPRA: TFloatField;
    CdsINDICECOMPRA: TFloatField;
    GroupBox13: TGroupBox;
    Label80: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    cbAvisoEvento: TDBCheckBox;
    cdsEventoFLGAVISO: TStringField;
    cdsEventoDIASAVISO: TFloatField;
    Label53: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    edTipoIndicador: TEdit;
    edClasseIndicador: TEdit;
    cdsLookIndicadorDSC_TIPOVALOR: TStringField;
    cdsLookIndicadorDSC_RECPAG: TStringField;
    molArvoreCompl1: TmolArvoreCompl;
    CMSqlParams2: TCMSqlParams;
    cdsEventoNOMEUSUARIO: TStringField;
    lblOcupado: TLabel;
    molImovel1: TmolImovel;
    CMSqlParams1: TCMSqlParams;
    CdsDSC_IMOVEL: TStringField;
    dsEndereco: TwwDataSource;
    cdsEndereco: TCMClientDataSet;
    CMSqlParams3: TCMSqlParams;
    cdsEnderecoIMONOMEENDERECO: TStringField;
    cdsEnderecoIMOLOGRADOURO: TStringField;
    cdsEnderecoIMOBAIRRO: TStringField;
    cdsEnderecoIMONUMERO: TStringField;
    cdsEnderecoIMOCOMPLEMENTO: TStringField;
    cdsEnderecoIMOCEP: TStringField;
    cdsEnderecoIDCIDADES: TFloatField;
    cdsEnderecoCODESTADO: TStringField;
    cdsEnderecoIDESTADO: TFloatField;
    cdsEnderecoIDPAIS: TFloatField;
    DBedtPais: TDBEdit2;
    DBedtEstado: TDBEdit2;
    DBedtCidade: TDBEdit2;
    cdsEnderecoIMOCIDADE: TStringField;
    cdsEnderecoNOMEPAIS: TStringField;
    dbcbStatusUnidade: TwwDBComboBox;
    Label13: TLabel;
    CdsCODESTADO_1: TStringField;
    CdsIDIMOVELPAI: TFloatField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoUF: TStringField;
    cdsEventoNUMPROCESSO: TStringField;
    Label23: TLabel;
    DBedtNumProcesso: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure wwDBGrid21TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBImageDblClick(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure cdsImagensXImoveisAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure dbcboIndicadorChange(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    CtrlImovel          : TCtrlImovel;
    CtrlMarcas          : TCtrlMarcas;
    CtrlSubConta        : TCtrlSubConta;
    CtrlMoeda           : TCtrlMoeda;
    CtrlCidade          : TCtrlCidade;
    CtrlEstado          : TCtrlEstado;
    CtrlPais            : TCtrlPais;
    CtrlContratoImovel  : TCtrlContratoImovel;
    CtrlEventoImovel    : TCtrlEventoImovel;
    CtrlOutroDado       : TCtrlOutroDado;
    CtrlIndicadorImovel : TCtrlIndicadorImovel;
    CtrlPlanPrev        : TCtrlPlanPrevContabil;
    CtrlBack            : TCtrlBack;
    fVlrMercadoAnt      : Extended; // Valor de Mercado Anterior para verificar alterações
    iImovel             : Integer;

    procedure SelecionaMestreDetalhe(const iIdImovel:Integer);
    function  VerificaPreenchimento: boolean;
    function  VerificaPreenchimentoEvento: Boolean;
    function  VerificaPreenchimentoIndicador: Boolean;
    function  VerificaPreenchimentoImagens : Boolean;
  public
    { Public declarations }
    Procedure AbreImovel(const iIdImovel: Integer);
  end;

var
  frmCadUnidadeMT: TfrmCadUnidadeMT;
  ListaArquivosTemp : TStringList;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uModuloImobiliario, dMS,
     FEspera, fCadEventoImovelMT,  FProgresso, uFuncoesImob,
     uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadUnidadeMT.FormCreate(Sender: TObject);
begin
  inherited;

  // Cria os CtrlObjects dos objetos a serem utilizados
  CtrlImovel          := TCtrlImovel.Create;
  CtrlMarcas          := TCtrlMarcas.Create;
  CtrlSubConta        := TCtrlSubConta.Create;
  CtrlMoeda           := TCtrlMoeda.Create;
  CtrlCidade          := TCtrlCidade.Create;
  CtrlPais            := TCtrlPais.Create;
  CtrlEstado          := TCtrlEstado.Create;
  CtrlEventoImovel    := TCtrlEventoImovel.Create;
  CtrlOutroDado       := TCtrlOutroDado.Create;
  CtrlPlanPrev        := TCtrlPlanPrevContabil.Create;
  CtrlBack            := TCtrlBack.Create;
  CtrlIndicadorImovel := TCtrlIndicadorImovel.Create( Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      Sistema.IdUsuario,
                                                      Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro );
  CtrlContratoImovel  := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                     Sistema.IdModulo,
                                                     Sistema.IdUsuario,
                                                     Sistema.IdEspAcesso,
                                                     Sistema.UsaPlanoPatro );

  // Inicializa os CtrlObjects dos objetos a serem utilizados...
  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);
  CtrlMarcas.InitializeAs( CtrlImovel );
  CtrlSubConta.InitializeAs( CtrlImovel );
  CtrlMoeda.InitializeAs( CtrlImovel );
  CtrlCidade.InitializeAs( CtrlImovel );
  CtrlPais.InitializeAs( CtrlImovel );
  CtrlEstado.InitializeAs( CtrlImovel );
  CtrlContratoImovel.InitializeAs( CtrlImovel );
  CtrlEventoImovel.InitializeAs( CtrlImovel );
  CtrlOutroDado.InitializeAs( CtrlImovel );
  CtrlIndicadorImovel.InitializeAs( CtrlImovel );
  CtrlPlanPrev.InitializeAs( CtrlImovel );
  CtrlBack.InitializeAs(CtrlImovel);

  {Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
   no CtrlObject}
  CtrlImovel.CdsImovel            := Cds;
  CtrlImovel.CdsEventoImovel      := cdsEvento;
  CtrlImovel.CdsOutroDadoxImovel  := molArvoreCompl1.Cds;
  CtrlImovel.CdsIndicadorxApur    := cdsIndicador;
  CtrlImovel.CdsPlanoPatroxImovel := cdsPlanoPatro;
  CtrlImovel.CdsImagensXImoveis   := cdsImagensXImoveis;

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsContrato.CreateDataSet;
  CdsEvento.CreateDataSet;
  CdsIndicador.CreateDataSet;
  CdsPlanoPatro.CreateDataSet;
  CdsImagensXImoveis.CreateDataSet;

  // Carrega os Cds de Lookup com os valores dos devidos CtrlObjects
  cdsMarcas.Data        := CtrlMarcas.LookupMarcas;
  cdsSubConta.Data      := CtrlSubConta.ListSubConta(Sistema.IdEmpresa, 0);
  cdsMoeda.Data         := CtrlMoeda.ListaMoeda;
  cdsLookIndicador.Data := CtrlIndicadorImovel.LookupIndicadorImovel;

  // Desabilita ou libera o cadastro de subconta, conforme parâmetros do modulo
  DBcboSubConta.Enabled := ModuloImobiliario.AdminImob.bFlgIntegraContab;

  // Desabilita a alteração de algumas informações, caso utilize o Módulo Investimob
  if (Sistema.IdModulo=54) or (ModuloImobiliario.AdminImob.bFlgUsaInvestimob) then
    dbcbSitImovel.Enabled := False // Situação do imóvel
  else
    dbcbSitImovel.Enabled := True;

  // Adiciona o filtro por Empresa Proprietária nos MontaSelect de endereços
  MontaEndereco.Filtro.Add('IMOVEL.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  lblOcupado.Visible := False;
  ListaArquivosTemp  := TStringList.Create;

  molArvoreCompl1.InicializaFrame;
end;


procedure TfrmCadUnidadeMT.FormDestroy(Sender: TObject);
begin
  // Elimina os Ctrls criados
  FreeAndNil( CtrlImovel          );
  FreeAndNil( CtrlMarcas          );
  FreeAndNil( CtrlSubConta        );
  FreeAndNil( CtrlMoeda           );
  FreeAndNil( CtrlPais            );
  FreeAndNil( CtrlEstado          );
  FreeAndNil( CtrlContratoImovel  );
  FreeAndNil( CtrlEventoImovel    );
  FreeAndNil( CtrlOutroDado       );
  FreeAndNil( CtrlIndicadorImovel );
  FreeAndNil( CtrlPlanPrev        );
  FreeAndNil( CtrlBack            );

  inherited;
end;


procedure TfrmCadUnidadeMT.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;

  // Executa o Monta Select padrão para imóveis do dtmMS ao invés do herdado no form
  CmeCadastro.Operacao := opProcurar;
  dtmMS.MS_Unidade.Executar;

  CmeCadastro.Find(Self);

  if cds.IsEmpty then
    CmeCadastro.Operacao := opVazio
  else
    CmeCadastro.Operacao := opIdle;

  CmeCadastro.AtualizaBotoes(self);
end;


procedure TfrmCadUnidadeMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  // Redesenha o form na volta do MontaSelect
  Repaint;

  // Se houve busca, abre a query principal com apenas o registro selecionado
  if (dtmMS.MS_Unidade.RetornouValor) then begin
    SelecionaMestreDetalhe(StrToInt(dtmMS.MS_Unidade.ValoresChave[1]));
    cdsEndereco.Data   := CtrlImovel.LookupEndereco(StrToInt(dtmMS.MS_Unidade.ValoresChave[1]));
    cdsPlanoPatro.Data := CtrlImovel.LookupPlanoPatroxImo(StrToInt(dtmMS.MS_Unidade.ValoresChave[1]));
  end;
end;


procedure TfrmCadUnidadeMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  // Habilita as páginas e campos memo somente na edição ou inserção.
  if (cmeCadastro.Operacao in [opInserir,opAlterar]) then begin
    tbsGeral.Enabled              := True;
    tbsEndereco.Enabled           := True;
    DBmemDescricaoImovel.ReadOnly := False;
    DBmemObservacao.ReadOnly      := False;
  end else begin
    tbsGeral.Enabled              := False;
    tbsEndereco.Enabled           := False;
    DBmemDescricaoImovel.ReadOnly := True;
    DBmemObservacao.ReadOnly      := True;
  end;
end;


procedure TfrmCadUnidadeMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;

  // No tab de eventos, habilita o Descrição do evento que está fora do grid padrão
  if (pgctrlDetalhe.ActivePage=tbsEventos) then begin
    if (cdsEvento.State in dsEditModes) then
      gbEvento.Enabled := True
    else
      gbEvento.Enabled := False;
  end;
end;


procedure TfrmCadUnidadeMT.SelecionaMestreDetalhe(const iIdImovel: Integer);
begin
  // Carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  cds.Data                := CtrlImovel.LookupUnidade( iIdImovel );
  cdsContrato.Data        := CtrlContratoImovel.LookupHistContratoImovel(iIdImovel );
  cdsEvento.Data          := CtrlEventoImovel.LookupEventoImovel( -1, iIdImovel, -1, -1, -1 );
  cdsIndicador.Data       := CtrlIndicadorImovel.LookupIndicadorXApur( iIdImovel );
  cdsLookIndicador.Data   := CtrlIndicadorImovel.LookupIndicadorImovel( CdsCODTIPIMOVEL.AsString ) ;
  cdsPlanoPatro.Data      := CtrlImovel.LookupPlanoPatroxImo( iIdImovel );
  cdsImagensXImoveis.Data := CtrlImovel.LookupImagens( iIdImovel );
  cdsEndereco.Data        := CtrlImovel.LookupEndereco( iIdImovel );

  Image.Picture           := dbImage.Picture;

  molArvoreCompl1.MontaArvore(iIdImovel,-1,'U');
  iImovel := iIdImovel;

  molImovel1.edtImovel.Text                 := Cds.FieldByName('IMOVEL_EXTENSO').AsString;
  molAdministradora1.edtAdministradora.Text := CdsDSC_ADMINISTRADORA.AsString;

  if (CdsIDIMOVEL.IsNull) then
    molImovel1.iImovel := -1
  else
    molImovel1.iImovel := CdsIDIMOVEL.AsInteger;

  if (CdsIDADMINIMOVEL.IsNull) then
    molAdministradora1.iAdministradora := -1
  else
    molAdministradora1.iAdministradora := CdsIDADMINIMOVEL.AsInteger;

  // Guarda o valor de mercado anterior para registro de evento
  fVlrMercadoAnt := CdsIMOVLRMERCADO.AsFloat;

  // Verifica Ocupado / Desocupado
  if (CdsFLGSTATUSOCUPACAO.AsString='O') then begin
     lblOcupado.Caption    := 'Unidade Ocupada';
     lblOcupado.Font.Color := clRed;
     lblOcupado.Visible    := True;
   end else begin
     lblOcupado.Caption    := 'Unidade Desocupada';
     lblOcupado.Font.Color := clNavy;
     lblOcupado.Visible    := True;
   end;
end;

procedure TfrmCadUnidadeMT.wwDBGrid21TitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;

  // Altera o indice do Grid conforme seleção
  case pgctrlDetalhe.ActivePageIndex of
    2: cdsContrato.IndexFieldNames  := AFieldName;
    5: cdsIndicador.IndexFieldNames := AFieldName;
    6: cdsEvento.IndexFieldNames    := AFieldName;
  end;
end;

procedure TfrmCadUnidadeMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco.
  SelecionaMestreDetalhe(-2);

  inherited;

  // Retorna para o Tab principal.
  tbcDetalhe.TabIndex      := 0;
  pgctrlDetalhe.ActivePage := tbsGeral;
  tbcDetalheChange( Self );

  // Carrega Defaults.
  CdsCODTIPIMOVEL.AsString      := molImovel1.sCodTipoImo;
  CdsFLGTIPOIMOVEL.AsString     := '2';
  CdsFLGSTATUSOCUPACAO.AsString := 'D';
  CdsIDPESSOA.AsInteger         := Sistema.IdEmpresa;

  fVlrMercadoAnt                := 0;

  // Limpa o conteúdo dos frames.
  molImovel1.btnLimpaImovelClick(Self);
  molAdministradora1.btnLimpaAdministradoraClick(Self);

  molArvoreCompl1.FlgStatus := True;
end;

procedure TfrmCadUnidadeMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  // Limpa campos memo.
  if (DBmemObservacao.Text='') then
    CdsIMOOBSERVACAO.Clear;

  if (DBmemDescricaoImovel.Text='') then
    CdsIMODESCRICAO.Clear;

  // Aplica Alterações.
  Accept := CtrlImovel.GravaImovel(False);

  molArvoreCompl1.FlgStatus := False;
end;


procedure TfrmCadUnidadeMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  // Aplica Alterações de exclusão ( ordem inversa da inclusão - filho / pai )
  Accept := CtrlImovel.ExcluiImovel;

  if Accept then
    SelecionaMestreDetalhe(-2);
end;


procedure TfrmCadUnidadeMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  // Carrega Campos dos Frames para o cds de imóvel.
  if (cds.State in dsEditModes) then begin
    if (molAdministradora1.iAdministradora>0) then
      CdsIDADMINIMOVEL.AsInteger := molAdministradora1.iAdministradora
    else
      CdsIDADMINIMOVEL.Clear;

    Accept := VerificaPreenchimento;
  end;
end;


function TfrmCadUnidadeMT.VerificaPreenchimento: boolean;
begin
  Result := False;

  try
    if (CdsFLGTIPOIMOVEL.AsInteger=1) and (molImovel1.iImovel<=0) then
      raise EValidacao.CreateVal('É necessário indicar o Imóvel!',molImovel1.btnBuscaImovel);

    if (Length(Trim(DBedtAreaUtil.Text))=0) and (CdsFLGTIPOIMOVEL.AsInteger=1) then
      raise EValidacao.CreateVal('É necessário indicar a Área Útil do Imóvel!',DBedtAreaUtil);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message,'Aviso',mtWarning,[mbOk],0);
      Repaint;
      tbcDetalhe.TabIndex      := 0;
      pgctrlDetalhe.ActivePage := tbsGeral;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;


function TfrmCadUnidadeMT.VerificaPreenchimentoEvento: Boolean;
begin
  Result := False;

  try
    if (dbedtDataEvento.Text='') then
      raise EValidacao.CreateVal('Informe a data do evento.',dbedtDataEvento);

    if (Length(Trim(DBedtCabEvento.Text))=0) then
      raise EValidacao.CreateVal('Informe o cabeçalho do evento.',dbedtCabEvento);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;


function TfrmCadUnidadeMT.VerificaPreenchimentoIndicador: Boolean;
begin
  Result := False;

  try
    if (dbcboIndicador.Text='') then
      raise EValidacao.CreateVal('Selecione o dado Tipo de Indicador.',dbcboIndicador);

    if (dbedtDataIndicador.Text='') then
      raise EValidacao.CreateVal('Informe a data de lançamento do indicador.',dbedtDataIndicador);

    if (dbspnAnoCompetencia.Text='') then
      raise EValidacao.CreateVal('Selecione o Ano de Competência.',dbspnAnoCompetencia);

    if (Length(trim(dbedtVlrIndicador.Text))=0) then
      raise EValidacao.CreateVal('Informe o valor do indicador.',dbedtVlrIndicador);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;


procedure TfrmCadUnidadeMT.CmeCadastroAfterConfirma(Sender: TObject);
var fPercent : Extended;
begin
  inherited;

  if (ModuloImobiliario.AdminImob.bFlgRegEvento) then begin
    if (Cds.UpdateStatus=usModified) or (CdsEvento.UpdateStatus=usModified) then begin
      if (MsgDlg('Ocorreu uma alteração Cadastral. '+#13#10+
                 'Deseja registrar um evento para esta alteração?',
                 'Confirmação',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
        // Cria form de Lancamento de Eventos
        Application.CreateForm(TfrmCadEventoImovelMT,frmCadEventoImovelMT);

        // Carrega valores e procedimentos default
        frmCadEventoImovelMT.bCadastroImovel            := True;
        frmCadEventoImovelMT.sFlgTipoEvento             := 'AR';
        frmCadEventoImovelMT.molImovel1.iImovel         := CdsIDIMOVEL.AsInteger;
        frmCadEventoImovelMT.molImovel1.edtImovel.Text  := CdsIMONOME.AsString;
        frmCadEventoImovelMT.sbtnInserirClick(Self);
        frmCadEventoImovelMT.CdsEVICABECALHO.AsString   := 'Alteração Cadastral';
        frmCadEventoImovelMT.DBedtHistorico.Enabled     := False;
        frmCadEventoImovelMT.CdsEVIDATA.AsDateTime      := Date;
        frmCadEventoImovelMT.DBedtDataHistorico.Enabled := False;
        frmCadEventoImovelMT.lblValAnterior.Visible     := False;
        frmCadEventoImovelMT.DBedtVlrAnterior.Visible   := False;
        frmCadEventoImovelMT.lblValAtual.Visible        := False;
        frmCadEventoImovelMT.DBedtVlrAjustado.Visible   := False;
        frmCadEventoImovelMT.lblPercent.Visible         := False;
        frmCadEventoImovelMT.DBedtPercent.Visible       := False;

        // Abre o form de eventos
        frmCadEventoImovelMT.Show;
      end;
    end;
  end;

  // Verifica a necessidade de registro de evento para o valor de mercado
  if (CdsIMOVLRMERCADO.AsFloat<>fVlrMercadoAnt) then begin
    if (MsgDlg('Houve alteração do Valor de Mercado. '+#13#10+
               'Deseja registrar um evento para o novo valor ?',
               'Confirmação',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      // Cria form de Lancamento de Eventos
      Application.CreateForm(TfrmCadEventoImovelMT,frmCadEventoImovelMT);

      // Calcula o Percentual de Variação
      fPercent := ComunsImobiliario.Arredonda( ((CdsIMOVLRMERCADO.AsFloat / fVlrMercadoAnt) -1) * 100, 2);

      // Carrega valores e procedimentos default
      frmCadEventoImovelMT.bCadastroImovel           := True;
      frmCadEventoImovelMT.sFlgTipoEvento            := 'VM';
      frmCadEventoImovelMT.molImovel1.iImovel        := CdsIDIMOVEL.AsInteger;
      frmCadEventoImovelMT.molImovel1.edtImovel.Text := TrimRight(molImovel1.edtImovel.Text)+' - '+CdsIMONOME.AsString;
      frmCadEventoImovelMT.sbtnInserirClick( Self );
      frmCadEventoImovelMT.CdsEVICABECALHO.AsString  := 'Reavaliação extra-oficial ( mercado )';
      frmCadEventoImovelMT.CdsEVIDATA.AsDateTime     := CdsIMODATAMERCADO.AsDateTime;
      frmCadEventoImovelMT.CdsEVIVLRANTERIOR.AsFloat := fVlrMercadoAnt;
      frmCadEventoImovelMT.CdsEVIVLRAJUSTADO.AsFloat := CdsIMOVLRMERCADO.AsFloat;
      frmCadEventoImovelMT.CdsEVIPERCENT.AsFloat     := fPercent;

      // Abre o form de eventos
      frmCadEventoImovelMT.Show;
    end;
  end;

  // Recarrega o cds com o registro após a edição
  if (cmeCadastro.Operacao=opAlterar) then
    SelecionaMestreDetalhe(CdsIDIMOVEL.AsInteger);
end;


procedure TfrmCadUnidadeMT.CmeDetalheConfirma(Sender: TObject);
begin
  case pgctrlDetalhe.ActivePageIndex of
    5:begin
        if cdsIndicador.State in dsEditModes then begin
          if VerificaPreenchimentoIndicador then begin
            cdsIndicadorINMDESCRICAO.AsString := dbcboIndicador.Text;
            inherited;
          end;
        end else inherited;
      end;
    6:begin
        if cdsEvento.State in dsEditModes then begin
          if VerificaPreenchimentoEvento then begin
            CdsEventoIDUSUARIO.AsInteger    := Sistema.IdUsuario;
            CdsEventoFLGTIPOEVENTO.AsString := 'US';
            inherited;
          end;
        end else inherited;
      end;
    8:begin
        if cdsImagensXImoveis.State in dsEditModes then begin
          if VerificaPreenchimentoImagens then
            edtArquivoImagem.Clear;
        end;
        inherited;
      end;
    else inherited;
  end;
end;


procedure TfrmCadUnidadeMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  if (pgctrlDetalhe.ActivePage=tbsIndicadores) then begin
    cdsIndicadorRECPAG.AsString      := 'R';
    cdsIndicadorFLGPREVREAL.AsString := 'R';
  end;

  if (pgctrlDetalhe.ActivePage=tbsEventos) then begin
    cdsEventoFLGAVISO.AsString := 'N';
    cbAvisoEvento.Checked      := False;
  end;
end;

procedure TfrmCadUnidadeMT.sbtnAltDetClick(Sender: TObject);
begin

  if (pgctrlDetalhe.ActivePage=tbsEventos) then begin
    if (not CdsEventoFLGTIPOEVENTO.IsNull) and (CdsEventoFLGTIPOEVENTO.AsString<>'US') then begin
      MsgDlg('Eventos de sistema não podem ser editados.', 'Aviso', mtWarning, [mbOk], 0);
      sbtnAltDet.Down    := False;
      tbsEventos.Enabled := False;
    end else begin
      {Verifica se a opção Alterar/Excluir apenas pelo usuário de lançamento
       está marcada no "Parâmetros do Sistema" ...}
      if (ModuloImobiliario.AdminImob.bFlgAlteraEvento=True) then begin
        {Verifica se o usuário logado no sistema é o mesmo responsável pelo
         lançamento do evento...}
        if (Sistema.IdUsuario<>cdsEventoIDUSUARIO.AsInteger) then begin
          MsgDlg('Eventos de sistema só podem ser editados pelo usuário de lançamento','Aviso',mtWarning,[mbOk],0);
          sbtnAltDet.Down    := False;
          tbsEventos.Enabled := False;
        end else begin
          inherited;

          sbtnAltDet.Down    := True;
          tbsEventos.Enabled := True;
        end;
      end else begin
        inherited;

        sbtnAltDet.Down    := True;
        tbsEventos.Enabled := True;
      end;
    end;
  end else inherited;
end;

procedure TfrmCadUnidadeMT.sbtnExcluiDetClick(Sender: TObject);
begin

  if (pgctrlDetalhe.ActivePage=tbsEventos) then begin
    if (not CdsEventoFLGTIPOEVENTO.IsNull) and (CdsEventoFLGTIPOEVENTO.AsString<>'US') then begin
      MsgDlg('Eventos de sistema não podem ser excluídos.','Aviso',mtWarning,[mbOk],0);
      sbtnAltDet.Down := False;
    end else begin
      if (ModuloImobiliario.AdminImob.bFlgAlteraEvento=True) then begin
        if (Sistema.IdUsuario<>cdsEventoIDUSUARIO.AsInteger) then begin
          MsgDlg('Eventos de sistema só podem ser excluídos pelo usuário de lançamento','Aviso',mtWarning,[mbOk],0);
          sbtnAltDet.Down := False;
        end else inherited;
      end else inherited;
    end;
  end else inherited;
end;


procedure TfrmCadUnidadeMT.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  inherited;

  // Apaga os arquivo temporários criados para visualizar as imagens.
  if (ListaArquivosTemp.Count>0) then begin
    for i := 0 to ListaArquivosTemp.Count - 1 do begin
      DeleteFile(ListaArquivosTemp[i]);
    end;
  end;

  FreeAndNil(ListaArquivosTemp);

  molArvoreCompl1.EncerraFrame;
end;

procedure TfrmCadUnidadeMT.DBImageDblClick(Sender: TObject);
var sFileName : String;
    i         : Integer;
begin
  inherited;

  if not (cdsImagensXImoveisIMAGEM.IsNull) then begin
    // Busca o diretório temporário CM
    sFileName := Sistema.TempDir;

    // Adiciona '\' ao final do caminho, caso este não exista
    if (sFileName[Length(sFileName)]<>'\') then
      sFileName := sFileName+'\';

    // Monta um nome para o arquivo temporário
    Randomize;
    sFileName := sFileName+Copy(FormatFloat('000000',GetTickCount),1,6)+FormatFloat('0000',Random(10000))+'.bmp';

    // Salva o arquivo
    DBImage.Picture.Bitmap.SaveToFile(sFileName);

    // Inclui em uma stringlist o nome do arquivo para deletar no fechamento do form
    ListaArquivosTemp.Add(sFileName);

    // Abre o arquivo
    ShellExecute(Self.Handle,'open',PChar(sFileName),'','',SW_SHOW);
  end else
    Exit;
end;

function TfrmCadUnidadeMT.VerificaPreenchimentoImagens: Boolean;
begin
  Result := False;

  try
    if (edtArquivoImagem.Text='') then
      raise EValidacao.CreateVal('Selecione o arquivo que contém a figura.',edtArquivoImagem);

    if (DBDescrimagem.Text='') then
      raise EValidacao.CreateVal('Preencha o campo de descrição da imagem.',DBDescrimagem);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message,'Aviso',mtWarning,[mbOk],0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmCadUnidadeMT.CmeDetalheCancel(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePageIndex=8) then begin
    EdtArquivoImagem.Clear;
    inherited;
  end;

  molArvoreCompl1.MontaArvore(iImovel,-1,'U');
end;

procedure TfrmCadUnidadeMT.bbtnVoltarDetClick(Sender: TObject);
begin
  edtArquivoImagem.Clear;

  inherited;
end;

procedure TfrmCadUnidadeMT.cdsImagensXImoveisAfterScroll(DataSet: TDataSet);
begin
  inherited;

  Image.Picture:=dbImage.Picture;
end;

procedure TfrmCadUnidadeMT.Button1Click(Sender: TObject);
var Imagem    : TBitmap;
    ImagemJPG : TJPEGImage;
    Extensao  : String;
    Arquivo   : File of Byte;
    Tamanho   : Longint;
begin
  if (opdImagem.Execute) then begin
    // Verifica o tamanho do arquivo
    AssignFile(Arquivo,OpdImagem.FileName);
    Reset(Arquivo);
    Tamanho := FileSize(Arquivo);
    CloseFile(Arquivo);

    if (Tamanho>2048000) then begin
      MsgDlg('O tamanho máximo permitido para'+#13+
             'o arquivo é de 2.048.000 bytes!','Aviso',mtWarning,[mbOk],0);
      Exit;
    end;

    EdtArquivoImagem.Text := opdImagem.FileName;
    Extensao              := ExtractFileExt(opdImagem.FileName);
    Extensao              := UpperCase(Trim(Copy(Extensao,2,(Length(Extensao)-1))));
    Imagem                := TBitmap.Create;
    ImagemJPG             := TJPEGImage.Create;

    try
      if (Extensao='JPG') then begin
        ImagemJPG.LoadFromFile(opdImagem.FileName);
        Imagem.Assign(ImagemJPG);
      end else
        Imagem.LoadFromFile(opdImagem.FileName);

      dbImage.Picture.Assign(Imagem);
      Image.Picture.Assign(Imagem);
    finally
      Imagem.Free;
    end;
  end;
end;

procedure TfrmCadUnidadeMT.AbreImovel(const iIdImovel: Integer);
begin
  SelecionaMestreDetalhe( iIdImovel );
  CmeCadastro.AtualizaBotoes( Self );
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
  Show;
end;

procedure TfrmCadUnidadeMT.dbcboIndicadorChange(Sender: TObject);
begin
  inherited;

  edtIPOIndicador.Text   := cdsLookIndicadorDSC_TIPOVALOR.AsString;
  edClasseIndicador.Text := cdsLookIndicadorDSC_RECPAG.AsString;
end;

procedure TfrmCadUnidadeMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  molArvoreCompl1.FlgStatus := True;
end;

procedure TfrmCadUnidadeMT.molImovel1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;

  molImovel1.btnBuscaImovelClick(Sender);

  cdsEndereco.Data   := CtrlImovel.LookupEndereco(molImovel1.iImovel);
  cdsPlanoPatro.Data := CtrlImovel.LookupPlanoPatroxImo(molImovel1.iImovel);

  { É atribuido ao ID do Imóvel Pai ( Unidade ) o ID do Imóvel selecionado e o
    ID do Imóvel Mestre relacionado... }
  CdsIDIMOVELPAI.AsInteger    := molImovel1.iImovel;
  CdsIDIMOVELMESTRE.AsInteger := molImovel1.iMestre;

  // Replica no cadastro da Unidade o endereço do Imóvel selecionado...
  CdsIMOLOGRADOURO.AsString  := cdsEnderecoIMOLOGRADOURO.AsString;
  CdsIMONUMERO.AsString      := cdsEnderecoIMONUMERO.AsString;
  CdsIMOCOMPLEMENTO.AsString := cdsEnderecoIMOCOMPLEMENTO.AsString;
  CdsIMOBAIRRO.AsString      := cdsEnderecoIMOBAIRRO.AsString;
  CdsIMOCEP.AsString         := cdsEnderecoIMOCEP.AsString;
  CdsIDCIDADES.AsInteger     := cdsEnderecoIDCIDADES.AsInteger;

  CdsCODTIPIMOVEL.AsString   := molImovel1.sCodTipoImo;
  CdsDSC_TIPOIMOVEL.AsString := molImovel1.sDscTipoImo;

  // Replica no cadastro da Unidade a situação do Imóvel selecionado...
  CdsFLGSTATUS.AsString := molImovel1.sStatus;
end;

procedure TfrmCadUnidadeMT.CmeCadastroCancel(Sender: TObject);
begin

  if (Cds.State in [dsInsert]) then
    molImovel1.btnLimpaImovelClick(Sender);

  inherited;
end;

end.
