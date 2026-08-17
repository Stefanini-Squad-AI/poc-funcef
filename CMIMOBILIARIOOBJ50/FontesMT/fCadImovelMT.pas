{-------------------------------------------------------------------------------

      CADASTRO DE IMOVEIS  ( MT )

      Módulo          :  ComunsImobiliario
      Autor           :  Vinícius Meyer Lana
      Data de Início  :  15/08/2002
      Data de Término :  20/08/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------------------------
Nº SIG......: 127938
Data........: 06/09/2022
Responsável.: Cássio Florencio Rovaroto
Descrição...: Correções relacionadas ao processo de provisão de custo de imóveis.
--------------------------------------------------------------------------------------------------
Nº SIG......: 113136
Data........: 04/07/2022  
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Implementação no cadastro do imóvel: uma aba que apresente o controle de 
investimentos realizados nos imóveis através de voto, com a possibilidade de emissão de relatório. 
--------------------------------------------------------------------------------------------------
Nº SIG......: 27969
Data........: 21/09/2016
Responsável.: Peterson Victor
Descrição...: Correção do codigo do imovel mestre
--------------------------------------------------------------------------------------------------
Nº SOL......: 207703.18299
Data........: 08/07/2016
Responsável.: Darivaldo Alencar
Descrição...: Inclusão de campo Percentual tabela IMOVEL.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 212226
Nº KINTANA..: 2037651
Data........: 08/04/2014
Responsável.: Helio Lima Custódio
Descrição...: Incluir Campo de Vida Útil e salvar os dados em histórico de vida útil.
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 148201
Nº KINTANA..: 1038779
Data........: 09/12/2010
Responsável.: Thaise Amaral Martins
Descrição...: Colocar mascara decimal nos campos IMOVLRCOMPRA, IMOVLRREAVAL e IMOVLRMERCADO
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
N. Sol..........: 137043
N. Kintana......: 824461
Data............: 15/10/2010
Responsável.....: Brunno Mattos
Descrição.......: Inclusão do filtro "Arrematado" na busca por imóveis, filtro
                  este que pode ser igual a "S" ou a "N".
--------------------------------------------------------------------------------
N. Sol..........: 131027
N. Kintana......: 745170
Data............: 21/05/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Inclusão de dos campos Imóvel Arrematado e Data de Arrematação
                  Para o módulo Administração imobiliária
--------------------------------------------------------------------------------
N. Sol..........: 132558
N. Kintana......: 766564
Data............: 20/05/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Inclusão de dos campos Imóvel Arrematado e Data de Arrematação
                  Para o módulo Alienação
--------------------------------------------------------------------------------
Rotina..........: 
N. Sol..........: 132461
N. Kintana......: 763386
Data............: 23/04/2010
Responsável.....: Cássio Camargo
Descrição.......: Inclusão de gravação de vigência dos imóveis.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27480
Responsável  : Daniel Simões
Data         : 26/02/2008
Descrição    : Troca dos campos 'CONDATAINICIO' e 'CONDATAFIM' (Datas de
               vigência do contrato) pelos 'CIMDTINI' e 'CIMDTFIM' (Datas de
               vigência dos imóveis).
--------------------------------------------------------------------------------
Pendência   : 26634
Responsável : Gustavo Mendes
Data        :
Descrição   : Criar 'CheckBox' para verificar no detalhe Indicadores filtro no
              momento em que os dados são exibidos na tela.
--------------------------------------------------------------------------------
Pendência   : 24872
Responsável : Daniel Simões
Data        : 16/08/2007
Descrição   : Foi acrescentado o campo 'OBSERVACAO' no Cadastro de Indicadores
              para fins de consulta... 
--------------------------------------------------------------------------------
Pendência   : 24867
Responsável : Daniel Simões
Data        : 14/06/2007
Descrição   : Adição de filtro de imóvel por ocupação no MontaSelect...
--------------------------------------------------------------------------------
Pendência   : 24083
Responsável : Daniel Simões
Data        : 22/05/2007
Descrição   : Inclusão do Número do Processo no Cadastro de Eventos.
--------------------------------------------------------------------------------
Pendência   : 21413
Responsável : Daniel Simões
Data        : 18/01/2007
Descrição   : Implmentação de gravação de registro no evento com a data,
              descrição do evento e o nome do usuário que efetuou o cadastro
              toda vez que algum dado sofrer aleração no sistema...
--------------------------------------------------------------------------------
Pendência   : 23517
Responsável : Daniel Simões
Data        : 10/01/2007
Descrição   : Tab de Dados Complementares por Imóvel passa a utilizar a TreeList
              para exibir os dados relacionados...
--------------------------------------------------------------------------------
Pendência   : 19593
Responsável : Daniel Simões
Data        : 17/03/2006
Descrição   : Sistema está gravando o IDPAIS da tabela ESTADO... Antes estava
              trazendo o IDPAIS da tabela CIDADES, que está atualmente em
              desuso...
--------------------------------------------------------------------------------
Pendência   : 17959
Responsável : Vinícius Meyer Lana
Data        : 29/11/2004
Descrição   : Implementação de Evento Programado.
-------------------------------------------------------------------------------}

unit fCadImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, Mask, DBCtrls2, mImovelMestre,
  Wwdbgrd2, wwriched, wwdbedit, Wwdotdot, Wwdbcomb, mCartorio, mAdministradora,
  uCtrlImovel, uCtrlMarcas, uCtrlSubConta, uCtrlMoeda, uCtrlPais, uCtrlEstado,
  uCtrlContratoImovel, uCtrlEventoImovel, uCtrlOutroDado, uCtrlIndicadorImovel,
  uCtrlCidade, uCtrlPlanPrevContabil, uCtrlBack, Wwdbspin, uCMTypes, DBTables,
  Wwquery, TREdit, Provider, uCmSqlParams, Jpeg, ExtDlgs, ShellAPI,
  mArvoreCompl, TB97Tlwn,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil, DBGrids, ppDB, ppDBPipe, ppDBBDE, ppModule,
  raCodMod, ppCtrls, ppBands, ppVar, ppStrtch, ppMemo, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, {MSMT - SIG26054} fPreview,
  ppParameter,
  uCtrlProvisaoImovel;

type
  RDadosVigencia = record
    iStatus    : Integer;
    iPlanoPrev : Integer;
    iPatro     : Integer;
    dPercentual: Double;
  end;

  TfrmCadImovelMT = class(TFrmCadastroMestreDetMTImob)
    molImovelMestre1: TmolImovelMestre;
    Label2: TLabel;
    DBedtNomeImovel: TDBEdit2;
    tbsGeral: TTabSheet;
    Label29: TLabel;
    DBedtMatricula: TDBEdit2;
    lblMarca: TLabel;
    DBcboMarca: TwwDBLookupCombo;
    Label16: TLabel;
    Label40: TLabel;
    DBedtVagas: TDBEdit;
    Label35: TLabel;
    DBedtDataHabitese: TCMDateTimePicker;
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
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBedtLogradouro: TDBEdit2;
    DBedtComplemento: TDBEdit2;
    DBedtNumero: TDBEdit2;
    DBedtBairro: TDBEdit2;
    DBedtCEP: TDBEdit2;
    DBedtNomeEndereco: TDBEdit2;
    dblcEstado: TwwDBLookupCombo;
    btnBuscaEndereco: TBitBtn;
    tbsDescricao: TTabSheet;
    wwDBGrid21: TwwDBGrid2;
    Label15: TLabel;
    DBedtDataConstrucao: TCMDateTimePicker;
    tbsValores: TTabSheet;
    gbAquisicao: TGroupBox;
    Label30: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    DBedtDataCompra: TCMDateTimePicker;
    DBcboMoedaCompra: TwwDBLookupCombo;
    DBedtVlrCompra: TDBEdit;
    gbReavalia: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBedtDataReaval: TCMDateTimePicker;
    DBcboMoedaReaval: TwwDBLookupCombo;
    DBedtVlrReaval: TDBEdit;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBedtDataMercado: TCMDateTimePicker;
    DBcboMoedaMercado: TwwDBLookupCombo;
    DBedtVlrMercado: TDBEdit;
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
    molCartorio1: TmolCartorio;
    GroupBox1: TGroupBox;
    dbcbTipoImovel: TDBCheckBox;
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
    cdsPais: TCMClientDataSet;
    cdsEstado: TCMClientDataSet;
    cdsEstadoCODESTADO: TStringField;
    cdsEstadoIDPAIS: TFloatField;
    cdsEstadoNOMEESTADO: TStringField;
    cdsEstadoIDESTADO: TFloatField;
    cdsPaisIDPAIS: TFloatField;
    cdsPaisNOMEPAIS: TStringField;
    dblcPais: TwwDBLookupCombo;
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
    cdsOutroDado: TCMClientDataSet;
    cdsOutroDadoIDIMOVEL: TFloatField;
    cdsOutroDadoIDOUTRODADO: TFloatField;
    cdsOutroDadoODIVALOR: TStringField;
    cdsOutroDadoODODESCRICAO: TStringField;
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
    cdsDesmembra: TCMClientDataSet;
    dsDesmembra: TwwDataSource;
    cdsDesmembraDMRDATA: TDateTimeField;
    cdsDesmembraIDIMOVELINI: TFloatField;
    cdsDesmembraIDIMOVELFIM: TFloatField;
    cdsDesmembraDMRPERCENT: TFloatField;
    cdsDesmembraPERC_ACUM: TFloatField;
    cdsDesmembraNOME_IMOVEL: TStringField;
    lblAtivo: TLabel;
    sbtnMestre: TToolbarButton97;
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
    cdsComplemento: TCMClientDataSet;
    cdsComplementoIDOUTRODADO: TFloatField;
    cdsComplementoODODESCRICAO: TStringField;
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
    dblcCidade: TwwDBLookupCombo;
    cdsCidade: TCMClientDataSet;
    cdsCidadeIDCIDADES: TFloatField;
    cdsCidadeNOME: TStringField;
    btnAtualiza: TButton;
    qryBuscaCidade: TwwQuery;
    qryBuscaCidadeIDCIDADES: TFloatField;
    qryUpdCidade: TwwQuery;
    FloatField2: TFloatField;
    qryLimpaCidades: TwwQuery;
    FloatField3: TFloatField;
    DBedtFracaoIdeal: TDBRealEdit;
    lblOcupado: TLabel;
    lblSituacao: TLabel;
    dbcbSitImovel: TwwDBComboBox;
    btnAtualizaSit: TButton;
    tbsPlanoPatro: TTabSheet;
    dsPlanoPatro: TwwDataSource;
    cdsPlanoPatro: TCMClientDataSet;
    DataSetProvider1: TDataSetProvider;
    cdsPlano: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    cdsPlanoIDPLANOPREV: TFloatField;
    cdsPlanoNOME: TStringField;
    cdsPatroIDPESSOA: TFloatField;
    cdsPatroNOME: TStringField;
    gbDaiea: TGroupBox;
    lblCarteiraDaiea: TLabel;
    wwDBCodDaiea: TwwDBLookupCombo;
    dbcbTipoSPC: TwwDBComboBox;
    lblTipoImovelSPC: TLabel;
    cdsDaiea: TCMClientDataSet;
    Panel12: TPanel;
    Panel6: TPanel;
    wwDBGrid1: TwwDBGrid;
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
    cdsDaieaIDCARTEIRASPC: TFloatField;
    cdsDaieaDESCARTEIRASPC: TStringField;
    grpRetornoPrevisto: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    DBcboIndiceCompra: TwwDBLookupCombo;
    DBedtTaxaCompra: TDBEdit;
    Image2: TImage;
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
    cdsOutroDadoIDOUTRODADOXIMOVEL: TFloatField;
    molArvoreCompl1: TmolArvoreCompl;
    CMSqlParams2: TCMSqlParams;
    cdsEventoNOMEUSUARIO: TStringField;
    DBcboMarca2: TwwDBLookupCombo;
    Label6: TLabel;
    DBedtNumProcesso: TDBEdit;
    cdsEventoCODDOCUMENTO: TFloatField;
    cdsEventoUSUARIO_EXTENSO: TStringField;
    cdsEventoNUMPROCESSO: TStringField;
    edtObservacao: TDBEdit;
    Label11: TLabel;
    sqlIndicador: TCMSqlParams;
    cdsIndicadorIDDOCUMENTO: TFloatField;
    cdsIndicadorOBSERVACAO: TStringField;
    cdsIndicadorFLGTIPOAPURACAO: TStringField;
    cdsIndicadorDSC_TIPOAPURACAO: TStringField;
    cbPrevistos: TCheckBox;
    cbRealizados: TCheckBox;
    CMSqlParams1: TCMSqlParams;
    cdsContratoIDCONTRATOIMOVEL: TFloatField;
    cdsContratoCIMDTINI: TDateTimeField;
    cdsContratoCIMDTFIM: TDateTimeField;
    dsPlanoPatroxVigenciaImob: TwwDataSource;
    cdsPlanoPatroxVigenciaImob: TCMClientDataSet;
    Query1: TQuery;
    Query2: TQuery;
    pgSegregacao: TPageControl;
    tbsDadosSegregacao: TTabSheet;
    tbsHstSegregacao: TTabSheet;
    dbgrdPlanoPatro: TwwDBGrid;
    pnlPlanoPatro: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    lblDataVigencia: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatro: TwwDBLookupCombo;
    dbedtPercPlanoPatro: TDBEdit;
    dbrgFlgTipo: TDBRadioGroup;
    dtVigenciaImob: TCMDateTimePicker;
    grdVigenciaImob: TwwDBGrid;
    cdsPlanoPatroIDIMOVEL: TFloatField;
    cdsPlanoPatroIDPATRO: TFloatField;
    cdsPlanoPatroIDPLANOPREV: TFloatField;
    cdsPlanoPatroPPIPERCENTRATEIO: TFloatField;
    cdsPlanoPatroFLGTIPO: TStringField;
    cdsPlanoPatroNOME_PATRO: TStringField;
    cdsPlanoPatroNOME_PLANO: TStringField;
    cdsPlanoPatroDESCR_FLGTIPO: TStringField;
    cdsPlanoPatroDATAVIGENCIA: TDateTimeField;
    cdsPlanoPatroxVigenciaImobIDIMOVEL: TFloatField;
    cdsPlanoPatroxVigenciaImobDATAVIGENCIA: TDateTimeField;
    cdsPlanoPatroxVigenciaImobIDPLANOPREV: TFloatField;
    cdsPlanoPatroxVigenciaImobNOMEPLANO: TStringField;
    cdsPlanoPatroxVigenciaImobIDPATRO: TFloatField;
    cdsPlanoPatroxVigenciaImobNOMEPATRO: TStringField;
    cdsPlanoPatroxVigenciaImobPERCENTRATEIO: TFloatField;
    cdsPlanoPatroxVigenciaImobTRGDTINCLUSAO: TDateTimeField;
    cdsPlanoPatroxVigenciaImobTRGUSERINCLUSAO: TStringField;
    cdsPlanoPatroxVigenciaImobNOMEUSUARIO: TStringField;
    cdsPlanoPatroxVigenciaImobIDPLANOPATROXVIGENCIAIMOB: TFloatField;
    dbedtDataArrematada: TCMDateTimePicker;
    LblArrematacao: TLabel;
    dbcbImoArrematado: TDBCheckBox;
    CdsIDIMOVELMESTRE: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsIDCIDADES: TFloatField;
    CdsCODSUBCONTA: TFloatField;
    CdsIDPESSOA: TFloatField;
    CdsIDMARCA: TFloatField;
    CdsIMOCEP: TStringField;
    CdsIMOBAIRRO: TStringField;
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
    CdsIMONOMEENDERECO: TStringField;
    CdsCODESTADO: TStringField;
    CdsIDESTADO: TFloatField;
    CdsIDPAIS: TFloatField;
    CdsIMOAREATOTAL: TFloatField;
    CdsCODTIPIMOVEL: TStringField;
    CdsFLGATIVO: TFloatField;
    CdsIMOPERCENTRATEIO: TFloatField;
    CdsCODIMOVELSPC: TFloatField;
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
    CdsIDCARTEIRASPC: TFloatField;
    CdsTAXACOMPRA: TFloatField;
    CdsINDICECOMPRA: TFloatField;
    CdsIMOARREMATADO: TStringField;
    CdsIMODATAARREMATADO: TDateTimeField;
    CdsIMOVEL_EXTENSO: TStringField;
    CdsIMOCIDADE: TStringField;
    CdsCODESTADO_1: TStringField;
    CdsDSC_MESTRE: TStringField;
    CdsDSC_ADMINISTRADORA: TStringField;
    CdsDSC_CARTORIO: TStringField;
    CdsDSC_TIPOIMOVEL: TStringField;
    dsHistoricoVidaUtil: TwwDataSource;
    cdsHistoricoVidaUtil: TCMClientDataSet;
    cdsHistoricoVidaUtilVIDAUTIL: TFloatField;
    cdsHistoricoVidaUtilTXDEP_ANO: TFloatField;
    cdsHistoricoVidaUtilTXDEP_MES: TFloatField;
    cdsHistoricoVidaUtilVIGENTE: TStringField;
    cdsHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField;
    cdsHistoricoVidaUtilTRGUSERINCLUSAO: TStringField;
    cdsHistoricoVidaUtilHistVidaUtilIDIMOVEL: TFloatField;
    cdsHistoricoVidaUtilHIST_EVENTO: TStringField;
    StaticText2: TStaticText;
    wwDBspnVidaUtil: TwwDBSpinEdit;
    StaticText3: TStaticText;
    Label34: TLabel;
    DBedtTaxaDepreciacaoAA: TDBEdit;
    Label37: TLabel;
    DBedtTaxaDepreciacaoAM: TDBEdit;
    lblPercentual: TLabel;
    CdsPERCENTUAL: TFloatField;
    DBedtPercentual: TDBRealEdit;
    tbsVoto: TTabSheet;
    pnlVoto: TPanel;
    dbgrdVoto: TwwDBGrid;
    CdsVoto: TClientDataSet;
    dsVoto: TDataSource;
    CdsVotoVOTO: TStringField;
    CdsVotoRESOLUCAO: TStringField;
    CdsVotoTIPO: TStringField;
    CdsVotoVLRAPROVADO: TFloatField;
    CdsVotoIDPESSOA: TFloatField;
    CdsVotoFORN: TStringField;
    btnImprimeVoto: TToolbarButton97;
    rptVoto: TppReport;
    ppRelVoto: TppBDEPipeline;
    qryRelVoto: TwwQuery;
    dsRelVoto: TDataSource;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    qryFundacaoBLOCO1: TStringField;
    qryFundacaoBLOCO2: TMemoField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    CdsVotoDESCRICAO: TStringField;
    CdsVotoIDVOTOGESTAOIMOVEL: TFloatField;
    ppVoto: TppBDEPipeline;
    qryRelVotoNODOCUMENTO: TFloatField;
    qryRelVotoSTATUS: TStringField;
    qryRelVotoNUMAPGR: TFloatField;
    qryRelVotoDATAEMISSAO: TDateTimeField;
    qryRelVotoRECPAG: TStringField;
    qryRelVotoVALOR: TFloatField;
    qryRelVotoVALORACUMULADO: TFloatField;
    ppParameterList1: TppParameterList;
    HeaderBand1: TppHeaderBand;
    Line1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel20: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText4: TppDBText;
    pdbmg1: TppDBImage;
    ppDBText10: TppDBText;
    pdbtxt1: TppDBText;
    lblFornecedor: TppLabel;
    DetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    lblSaldo: TppLabel;
    FooterBand1: TppFooterBand;
    Calc2: TppSystemVariable;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel4: TppLabel;
    lblSaldoFinal: TppLabel;
    raCodeModule1: TraCodeModule;
    lblNmFornecedor: TppLabel;
    tbsProvisao: TTabSheet;
    chkProvisaoAtivo: TCheckBox;
    edtPercProvisao: TDBRealEdit;
    cdsProvisaoImovel: TCMClientDataSet;
    dsProvisaoImovel: TwwDataSource;
    dbEdtProvisaoInicio: TCMDateTimePicker;
    dbgrdProvisao: TwwDBGrid2;
    cdsProvisaoImovelIDPROVISAOIMOVEL: TFloatField;
    cdsProvisaoImovelIDIMOVEL: TFloatField;
    cdsProvisaoImovelPERCENTUAL: TFloatField;
    cdsProvisaoImovelVIGENCIA_INICIO: TDateTimeField;
    cdsProvisaoImovelVIGENCIA_FIM: TDateTimeField;
    cdsProvisaoImovelFLGATIVO: TStringField;
    cdsProvisaoImovelFLGATIVO_S: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblcPaisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnBuscaEnderecoClick(Sender: TObject);
    procedure wwDBGrid21TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dbcbTipoImovelClick(Sender: TObject);
    procedure sbtnMestreClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dblcEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnAtualizaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAtualizaSitClick(Sender: TObject);
    procedure DBImageDblClick(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure cdsImagensXImoveisAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbcboIndicadorChange(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure molImovelMestre1btnBuscaImovelClick(Sender: TObject);
    procedure cbPrevistosClick(Sender: TObject);
    procedure dbgrdIndicadorUpdateFooter(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure pgSegregacaoChange(Sender: TObject);
    procedure dblcPlanoPrevChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure dbedtDataArrematadaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbcbImoArrematadoClick(Sender: TObject);
    procedure wwDBspnVidaUtilChange(Sender: TObject);
    procedure DBedtPercentualExit(Sender: TObject);
    procedure btnImprimeVotoClick(Sender: TObject);
    procedure ppSummaryBand1BeforeGenerate(Sender: TObject);
    procedure DetailBand1BeforeGenerate(Sender: TObject);
    procedure CmeDetalheAfterConfirma(Sender: TObject);
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
    CtrlProvisaoImovel  : TCtrlProvisaoImovel; //Cássio Rovaroto - SIG nº113136

    //Helio - SOL Nº 212226 KINTANA Nº 2037651
    CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil;


    fVlrMercadoAnt: Extended; // Valor de Mercado Anterior para verificar alterações

    iImovel     : Integer;

    _CdsVigencia : TCMClientDataSet;
    _CdsPlanoPatroxVigenciaBem : TClientDataSet;
    //Cássio - SOL Nº 107352 KINTANA Nº 482365
    bGravaPlanoPatroxVigenciaImob : Boolean;

    //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Início
    //Field que indica o status da vigência de segregação
    sStatus : string;
    //Field que indica qual o tipo de operação realizada
    // 1 - Inclusão
    // 2 - Exclusão
    // 3 - Alteração
    iTipoOPeracao : Integer;
    //Armazena a quantidade de exclusões feitas em PlanoPatroxImovel
    //para alterar o status da vigência em HstPercSegregaImob
    iNumExclusao : Integer;
    //Controla a quantidade de exclusões de planos que podem ocorrer
    aVigencia : array of RDadosVigencia;
    bHouveNovaInclusao: boolean;
    bSemVigencia : Boolean;
    bAlterouPlano : boolean;
    dDataInclusao: TDateTime;
    aPlanos : array of RDadosVigencia;
    aPlanPrev : array of Integer;
    bProvisao: Boolean; //Cássio Rovaroto - SIG nº 113136
    dDataInicioProvisaoNova: TDate;
    bExcluiProvisao: Boolean;

    
    procedure SelecionaMestreDetalhe(const iIdImovel:Integer);
    function  VerificaPreenchimento: boolean;
    function  VerificaPreenchimentoEvento: Boolean;
    function  VerificaPreenchimentoIndicador: Boolean;
    function  VerificaPreenchimentoPlanoPatro:Boolean;
    function  VerificaPreenchimentoImagens : Boolean;
    function  VerificaPreenchimentoProvisao: Boolean; //Cássio Rovaroto - SIG nº 113631
    function  VerificaPercentual : Boolean; // Marcio Motta - 01/06/2004 - 01/06/2004

    // Felipe de Oliveira  SOL65636  Kintana 523237
    function CriaCodigoImovel(sImoMestre : String): String;
    function CriaCodMestre : String;
    function VerificaExistencia(sImocodigo : String; iIdImovel: Integer) : Boolean;
    function VerificaCodigo(sImocodigo : String) : Boolean;
    // Felipe de Oliveira  SOL65636  Kintana 523237


    procedure AtualizaPlanoPatroxImovel(iIdImovel: integer);
    function ValorMestreDiferente: boolean;//Darivaldo Alencar SOL 207703.18299
  public
    { Public declarations }
    Procedure AbreImovel(const iIdImovel: Integer);
    procedure GravaAlteracaoVigencia;
    procedure GravaExclusaoVigencia;
    procedure PreencheArrayExclusao(sIdPlano: string; idImovel : integer);
    procedure PreencheArrayAlteracao(idImovel : integer);
    procedure AtualizaPlanoArray;
  end;

var
  frmCadImovelMT: TfrmCadImovelMT;
  ListaArquivosTemp : TStringList;
  sFlgTipoPlanoPatro : string;
  dDataVigencia : TDate;
  fSaldo: Double;// Michelle Mota - SIG26054

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uModuloImobiliario, dMS,
     FEspera, fCadEventoImovelMT, FProgresso, uFuncoesImob,
     uVerificaPreenchimento, uDataBase;

{$R *.DFM}

procedure TfrmCadImovelMT.FormCreate(Sender: TObject);
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
  CtrlIndicadorImovel :=TCtrlIndicadorImovel.Create(Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      Sistema.IdUsuario,
                                                      Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro );
  CtrlContratoImovel  :=TCtrlContratoImovel.Create(Sistema.IdEmpresa,
                                                     Sistema.IdModulo,
                                                     Sistema.IdUsuario,
                                                     Sistema.IdEspAcesso,
                                                     Sistema.UsaPlanoPatro );

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;

  CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;//Cássio Rovaroto - SIG nº 113136


  // Inicializa os CtrlObjects dos objetos a serem utilizados
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

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  CtrlHistoricoVidaUtil.InitializeAs(CtrlImovel);

  CtrlProvisaoImovel.InitializeAs(CtrlImovel);  //Cássio Rovaroto - SIG nº 113136


  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlImovel.CdsImovel            := Cds;
  CtrlImovel.CdsEventoImovel      := cdsEvento;

  // Daniel - 23517
  CtrlImovel.CdsOutroDadoxImovel  := molArvoreCompl1.Cds;

  CtrlImovel.CdsIndicadorxApur    := cdsIndicador;
  CtrlImovel.CdsPlanoPatroxImovel := cdsPlanoPatro;
  CtrlImovel.CdsImagensXImoveis   := cdsImagensXImoveis; // Marcio Motta - 06/05/2004 - Pend.: 16069

  CtrlImovel.CdsProvisaoImovel    := cdsProvisaoImovel; //Cássio Rovaroto - SIG nº 113136


  //Cássio - SOL 107352 KINTANA 482365 - Início
  _CdsVigencia := TCMClientDataSet.Create(Self);
  _CdsPlanoPatroxVigenciaBem := TClientDataSet.Create(Self);

  CtrlImovel.CdsPlanoPatroxVigenciaImob := _cdsVigencia;
  //Cássio - SOL 107352 KINTANA 482365 - Fim

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  CtrlHistoricoVidaUtil.CdsHistoricoVidaUtil := cdsHistoricoVidaUtil;

    // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsContrato.CreateDataSet;
  CdsEvento.CreateDataSet;
  CdsOutroDado.CreateDataSet;
  CdsIndicador.CreateDataSet;
  CdsDesmembra.CreateDataSet;
  CdsPlanoPatro.CreateDataSet;
  CdsImagensXImoveis.CreateDataSet;

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  cdsHistoricoVidaUtil.CreateDataSet;

  cdsProvisaoImovel.CreateDataSet; //Cássio Rovaroto - SIG nº 113136

  // Carrega os Cds de Lookup com os valores dos devidos CtrlObjects
  cdsMarcas.Data        := CtrlMarcas.LookupMarcas;
  cdsSubConta.Data      := CtrlSubConta.ListSubConta(Sistema.IdEmpresa, 0);
  cdsMoeda.Data         := CtrlMoeda.ListaMoeda;
  cdsPais.Data          := CtrlPais.ListaPais;
  cdsEstado.Data        := CtrlEstado.ListaEstado( -1 );
  cdsCidade.Data        := CtrlCidade.ListaCidade( -1 );
  cdsComplemento.Data   := CtrlOutroDado.LookupOutroDado;
  cdsLookIndicador.Data := CtrlIndicadorImovel.LookupIndicadorImovel;
  cdsPatro.Data         := CtrlImovel.LookupPatro( Sistema.IdEmpresa );
  cdsPlano.Data         := CtrlPlanPrev.ListaPlanPrevContabil;
  cdsDaiea.Data         := CtrlBack.LookupCarteiraDaiea;

  _CdsVigencia.Data     := CtrlImovel.LookupPlanoPatroxVigenciaImob(-1);
  _CdsPlanoPatroxVigenciaBem.Data := CtrlImovel.LookupPlanoPatroxVigenciaBem;

  cdsProvisaoImovel.Data := CtrlProvisaoImovel.LookupProvisaoImovel(-1); //Cássio Rovaroto - SIG nº 113136

  // Desabilita ou libera o cadastro de subconta, conforme parâmetros do modulo
  DBcboSubConta.Enabled := ModuloImobiliario.AdminImob.bFlgIntegraContab;

  // Desabilita a alteração de algumas informações, caso utilize o Módulo Investimob
  if (Sistema.IdModulo = 54) or (ModuloImobiliario.AdminImob.bFlgUsaInvestimob) then begin
    dbcbSitImovel.Enabled := False;    // Situação do imóvel
    gbAquisicao.Enabled   := False;    // Valor de aquisição
    gbReavalia.Enabled    := False;    // Valor da ultima reavaliação
  end else begin
    dbcbSitImovel.Enabled := True;
    gbAquisicao.Enabled   := True;
    gbReavalia.Enabled    := True;
  end;

  // Adiciona o filtro por Empresa Proprietária nos MontaSelect de endereços
  MontaEndereco.Filtro.Add('IMOVEL.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  lblAtivo.Visible   := False;
  lblOcupado.Visible := False;

  ListaArquivosTemp := TStringList.Create;

  // Daniel - 23517
  molArvoreCompl1.InicializaFrame;

  //Cássio - SOL 107352 KINTANA 482365 - Início
  cdsPlanoPatroxVigenciaImob.Data := CtrlImovel.LookupPlanoPatroxVigenciaImob(-1);
  //Cássio - SOL 107352 KINTANA 482365 - Fim
  //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Início
  iNumExclusao := 0;
  //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Fim

  bProvisao := False; //Cássio Rovaroto - SIG nº 113136
  bExcluiProvisao := False;
end;

procedure TfrmCadImovelMT.FormDestroy(Sender: TObject);
begin
  // Elimina os Ctrls criados
  FreeAndNil( CtrlImovel );
  FreeAndNil( CtrlMarcas );
  FreeAndNil( CtrlSubConta );
  FreeAndNil( CtrlMoeda );
  FreeAndNil( CtrlPais );
  FreeAndNil( CtrlEstado );
  FreeAndNil( CtrlContratoImovel );
  FreeAndNil( CtrlEventoImovel );
  FreeAndNil( CtrlOutroDado );
  FreeAndNil( CtrlIndicadorImovel );
  FreeAndNil( CtrlPlanPrev );
  FreeAndNil( CtrlBack );

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  FreeAndNil( CtrlHistoricoVidaUtil );
  FreeAndNil(CtrlProvisaoImovel);

  inherited;
end;

procedure TfrmCadImovelMT.sbtnProcurarClick(Sender: TObject);
begin
  // inherited;
  // Executa o Monta Select padrão para imóveis do dtmMS ao invés do herdado no form
  CmeCadastro.Operacao := opProcurar;
  dtmMS.MS_Imovel.Executar;

  CmeCadastro.Find(Self);

  if cds.IsEmpty then
       CmeCadastro.Operacao := opVazio
  else CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(self);
end;

procedure TfrmCadImovelMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // redesenha o form na volta do MontaSelect
  Repaint;
  // se houve busca, abre a query principal com apenas o registro selecionado
  if dtmMS.MS_Imovel.RetornouValor then
    SelecionaMestreDetalhe(StrToInt(dtmMS.MS_Imovel.ValoresChave[1]));
  if CdsIMOARREMATADO.IsNull then
     dbcbImoArrematado.Checked := False;
end;


procedure TfrmCadImovelMT.sbtnMestreClick(Sender: TObject);
begin
  inherited;
  // Executa o Monta Select padrão para imóvel mestre do dtmMS ao invés do herdado no form
  CmeCadastro.Operacao := opProcurar;
  dtmMS.MS_ImovelMestre.Executar;
  Repaint;

  // se houve busca, abre a query principal com apenas o registro selecionado
  if dtmMS.MS_ImovelMestre.RetornouValor then
    SelecionaMestreDetalhe(StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]));

  if cds.IsEmpty then
       CmeCadastro.Operacao := opVazio
  else CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(self);
end;


procedure TfrmCadImovelMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // Atualiza o botão de procura por mestre, pois o mesmo não foi herdado.
  sbtnMestre.Down := False;

  // Habilita as páginas e campos memo somente na edição ou inserção
  if cmeCadastro.Operacao in [opInserir, opAlterar] then begin
    sbtnMestre.Enabled  := False;
    tbsGeral.Enabled    := True;
    tbsEndereco.Enabled := True;
    tbsValores.Enabled  := True;
    DBmemDescricaoImovel.ReadOnly := False;
    DBmemObservacao.ReadOnly      := False;
    if pgSegregacao.ActivePage = tbsHstSegregacao then
    begin
      sbtnInsDet.Enabled:= False;
      sbtnAltDet.Enabled:= False;
      sbtnExcluiDet.Enabled:= False;
    end;
  end else begin
    sbtnMestre.Enabled  := True;
    tbsGeral.Enabled    := False;
    tbsEndereco.Enabled := False;
    tbsValores.Enabled  := False;
    DBmemDescricaoImovel.ReadOnly := True;
    DBmemObservacao.ReadOnly      := True;
  end;
  //dDataVigencia := 0;
  cdsPlanoPatroxVigenciaImob.data := CtrlImovel.LookupPlanoPatroxVigenciaImob(iImovel);


  // Não permite alteração do status de mestre quando for alterar (check box)
  if cmeCadastro.Operacao = opAlterar then
       dbcbTipoImovel.Enabled := False
  else dbcbTipoImovel.Enabled := True;
end;


procedure TfrmCadImovelMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // No tab de eventos, habilita o Descrição do evento que está fora do grid padrão
  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    if cdsEvento.State in dsEditModes then
         gbEvento.Enabled := True
    else gbEvento.Enabled := False;
  end;

  if pgctrlDetalhe.ActivePage = tbsPlanoPatro then
  begin
    if cmeDetalhe.Operacao in [opInserir] then
      dtVigenciaImob.Date := dDataVigencia;
    //  dtVigenciaImob.Enabled := False;

    //dblcPlanoPrev.Enabled := True;
  end;


  if pgctrlDetalhe.ActivePage = tbsIndicadores then
  begin
    cbPrevistos.Enabled := not (cdsIndicador.State in dsEditModes);
    cbRealizados.Enabled := not (cdsIndicador.State in dsEditModes);
  end;

end;


procedure TfrmCadImovelMT.SelecionaMestreDetalhe(const iIdImovel: Integer);
var i: integer;
begin
  i:= 0;

  // Carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  cds.Data                := CtrlImovel.LookupImovel( iIdImovel );
  cdsContrato.Data        := CtrlContratoImovel.LookupHistContratoImovel(iIdImovel );
  cdsEvento.Data          := CtrlEventoImovel.LookupEventoImovel( -1, iIdImovel, -1, -1, -1 );
  cdsOutroDado.Data       := CtrlOutroDado.LookupOutroDadoXImovel( iIdImovel );
  cdsIndicador.Data       := CtrlIndicadorImovel.LookupIndicadorXApur( iIdImovel );
  cdsDesmembra.Data       := CtrlImovel.HistDesmembramento( iIdImovel );
  cdsComplemento.Data     := CtrlOutroDado.LookupOutroDado( CdsCODTIPIMOVEL.AsString );
  cdsLookIndicador.Data   := CtrlIndicadorImovel.LookupIndicadorImovel( CdsCODTIPIMOVEL.AsString ) ;
  cdsPlanoPatro.Data      := CtrlImovel.LookupPlanoPatroxImo( iIdImovel );
  cdsImagensXImoveis.Data := CtrlImovel.LookupImagens( iIdImovel ); // Marcio Motta - 06/05/2004 - Pendência: 16069
  Image.Picture           := dbImage.Picture;
  //Cássio - SOL 107352 KINTANA 482365 - Início
  cdsPlanoPatroxVigenciaImob.Data := CtrlImovel.LookupPlanoPatroxVigenciaImob(iIdImovel);

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  cdsHistoricoVidaUtil.Data       := CtrlHistoricoVidaUtil.LookupHistoricoVidaUtilVigente( iIdImovel );

  cdsProvisaoImovel.Data  := CtrlProvisaoImovel.LookupProvisaoImovel(iIdImovel);

  if Assigned(aVigencia) then
    aVigencia := nil;
    
  if Assigned(aPlanos) then
    aPlanos := nil;

  if Assigned(aPlanPrev) then
    aPlanPrev := nil;

  if (cdsPlanoPatro.RecordCount >= 1) then
  begin
    SetLength(aPlanos, cdsPlanoPatro.RecordCount);
    SetLength(aPlanPrev, cdsPlanoPatro.RecordCount);
    while not cdsPlanoPatro.Eof do
    begin
      aPlanos[i].iStatus := 0;
      aPlanos[i].iPlanoPrev := cdsPlanoPatroIDPLANOPREV.asInteger;
      aPlanPrev[i] := cdsPlanoPatroIDPLANOPREV.asInteger;
      aPlanos[i].iPatro := cdsPlanoPatroIDPATRO.AsInteger;
      aPlanos[i].dPercentual := cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;
      Inc(i);
      cdsPlanoPatro.Next;
    end;
  end;
  cdsPlanoPatro.First;

  //Para carregar o dataset que trata a tabela HstPercSegregaImob
  _CdsVigencia.Data     := CtrlImovel.LookupPlanoPatroxVigenciaImob(iIdImovel);

  CdsVoto.Data := CtrlImovel.ListVotoCadImovel(IntToStr(iIdImovel)); // Michelle Mota - SIG26054

  if _CdsVigencia.IsEmpty then
    bSemVigencia := True
  else
    bSemVigencia := False;
  //Cássio - SOL 107352 KINTANA 482365 - Fim

  // Daniel - 23517
  molArvoreCompl1.MontaArvore(iIdImovel,-1,'I');
  iImovel := iIdImovel;

  // Marcio Motta - 01/06/2004 - 16859
  // Verifica se existem dados carregados no CDS de Plano Patro, caso positivo
  // guarda o tipo Percentual/Cotas em caso de inclusão de novos registros e
  // desabilita a opção de escolha de Percentual/Cotas
  if not cdsPlanoPatroFLGTIPO.IsNull then
  begin
    dbrgFlgTipo.Enabled := False;
    dbrgFlgTipo.Value   := cdsPlanoPatroFLGTIPO.AsString;
    sFlgTipoPlanoPatro  := cdsPlanoPatroFLGTIPO.AsString;
    if (cdsPlanoPatroFLGTIPO.AsString = 'C') then
      cdsPlanoPatroPPIPERCENTRATEIO.DisplayFormat := '##0.00'
    else
      cdsPlanoPatroPPIPERCENTRATEIO.DisplayFormat := '##0.0000000000%';
    //dtVigenciaImob.Enabled := False;
  end else begin
    dbrgFlgTipo.Enabled := True;
    sFlgTipoPlanoPatro  := '';
  end;

  if iIdImovel > 0 then begin
    cdsEstado.Data      := CtrlEstado.ListaEstado( CdsIDPAIS.AsInteger );
    cdsCidade.Data      := CtrlCidade.ListaCidade( 0, CdsIDESTADO.AsInteger );
  end else begin
    cdsEstado.Data      := CtrlEstado.ListaEstado( -1 );
    cdsCidade.Data      := CtrlCidade.ListaCidade( -1 );
  end;

  // Carrega conteúdo dos Frames
  molImovelMestre1.edtImovel.Text           := CdsDSC_MESTRE.AsString;
  molAdministradora1.edtAdministradora.Text := CdsDSC_ADMINISTRADORA.AsString;
  molCartorio1.edtCartorio.Text             := CdsDSC_CARTORIO.AsString;

  if CdsIDIMOVELMESTRE.IsNull then
       molImovelMestre1.iMestre := -1
  else molImovelMestre1.iMestre := CdsIDIMOVELMESTRE.AsInteger;

  if CdsIDADMINIMOVEL.IsNull then
       molAdministradora1.iAdministradora := -1
  else molAdministradora1.iAdministradora := CdsIDADMINIMOVEL.AsInteger;

  if CdsIDCARTORIO.IsNull then
       molCartorio1.iCartorio := -1
  else molCartorio1.iCartorio := CdsIDCARTORIO.AsInteger;

  // Guarda o valor de mercado anterior para registro de evento
  fVlrMercadoAnt := CdsIMOVLRMERCADO.AsFloat;

  // Verifica Ativo / Inativo
  case CdsFLGATIVO.AsInteger of
    0 : begin
          lblAtivo.Caption := 'Imóvel Inativo';
          lblAtivo.Visible := True;
        end;
    1 : begin
          lblAtivo.Caption := 'Imóvel Ativo';
          lblAtivo.Visible := True;
        end;
    else begin
      lblAtivo.Caption := '';
      lblAtivo.Visible := False;
    end;
  end;

  // Verifica Ocupado / Desocupado
  if CdsFLGSTATUSOCUPACAO.AsString = 'O' then begin
     lblOcupado.Caption    := 'Imóvel Ocupado';
     lblOcupado.Font.Color := clRed;
     lblOcupado.Visible    := True;
   end else begin
     lblOcupado.Caption    := 'Imóvel Desocupado';
     lblOcupado.Font.Color := clNavy;
     lblOcupado.Visible    := True;
   end;
   iNumExclusao := 0;
   bAlterouPlano := False;
end;

procedure TfrmCadImovelMT.dblcPaisCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Abre o Cds de estado apenas com os estados do país selecionado
  if dblcPais.Text <> '' then
    cdsEstado.Data := CtrlEstado.ListaEstado( cdsPaisIDPAIS.AsInteger );
end;

procedure TfrmCadImovelMT.dblcEstadoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Abre o Cds de cidade apenas com os cidades do estado selecionado
  if dblcEstado.Text <> '' then
    cdsCidade.Data := CtrlCidade.ListaCidade( 0, cdsEstadoIDESTADO.AsInteger );
end;

procedure TfrmCadImovelMT.btnBuscaEnderecoClick(Sender: TObject);
var cdsTemp : TCMClientDataSet;
begin
  inherited;
  cdsTemp := nil;
  if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
    // busca um endereço já usado anteriormente (para o caso de um mesmo imóvel mestre, etc.)
    MontaEndereco.Executar;
    if MontaEndereco.RetornouValor then begin
      cdsTemp      := TCMClientDataSet.Create( self );
      cdsTemp.Data := CtrlImovel.LookupImovel(StrToInt(MontaEndereco.ValoresChave[0]));

      // atribui aos campos os valores encontrados na tabela auxiliar
      cdsIMONOMEENDERECO.asString := cdsTemp.FieldByName('IMONOMEENDERECO').AsString;
      cdsIMOLOGRADOURO.asString   := cdsTemp.FieldByName('IMOLOGRADOURO').AsString;
      cdsIMONUMERO.asString       := cdsTemp.FieldByName('IMONUMERO').AsString;
      cdsIMOCOMPLEMENTO.asString  := cdsTemp.FieldByName('IMOCOMPLEMENTO').AsString;
      cdsIMOBAIRRO.asString       := cdsTemp.FieldByName('IMOBAIRRO').AsString;
      cdsIMOCEP.asString          := cdsTemp.FieldByName('IMOCEP').AsString;
      if not cdsTemp.FieldByName('IDCIDADES').IsNull then begin
        cdsEstado.Data         := CtrlEstado.ListaEstado( cdsTemp.FieldByName('IDPAIS').AsInteger );
        cdsCidade.Data         := CtrlCidade.ListaCidade( 0, cdsTemp.FieldByName('IDESTADO').AsInteger );
        cdsIDCIDADES.AsInteger := cdsTemp.FieldByName('IDCIDADES').AsInteger;
        cdsIDESTADO.AsInteger  := cdsTemp.FieldByName('IDESTADO').AsInteger;
        cdsIDPAIS.AsInteger    := cdsTemp.FieldByName('IDPAIS').AsInteger;
      end;

      FreeAndNil( cdsTemp );
    end;
  end;
  btnBuscaEndereco.SetFocus;
end;

procedure TfrmCadImovelMT.wwDBGrid21TitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  // Altera o indice do Grid conforme seleção
  case pgctrlDetalhe.ActivePageIndex of
    2 : cdsContrato.IndexFieldNames  := AFieldName;
    4 : cdsOutroDado.IndexFieldNames := AFieldName;
    5 : cdsIndicador.IndexFieldNames := AFieldName;
    6 : cdsEvento.IndexFieldNames    := AFieldName;
    7 : cdsDesmembra.IndexFieldNames := AFieldName;
  end;
end;

procedure TfrmCadImovelMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );

  inherited;

  // Retorna para o Tab principal
  tbcDetalhe.TabIndex       := 0;
  pgctrlDetalhe.ActivePage  := tbsGeral;
  tbcDetalheChange( Self );

  // Carrega Defaults
  dbcbTipoImovel.Enabled         := True;
  CdsFLGTIPOIMOVEL.AsString      := '1';
  CdsFLGSTATUSOCUPACAO.AsString  := 'D';
  CdsIDPESSOA.AsInteger          := Sistema.IdEmpresa;
  fVlrMercadoAnt                 := 0;

  // Limpa o conteúdo dos frames
  molImovelMestre1.btnLimpaImovelClick( Self );
  molAdministradora1.btnLimpaAdministradoraClick( Self );
  molCartorio1.btnLimpaCartorioClick( Self );

  // Daniel - 23517
  molArvoreCompl1.FlgStatus := True;
end;

procedure TfrmCadImovelMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var
  bRecuperaVigencia : boolean;
  idImovelSalva : Integer; //Helio - SOL Nº 212226 KINTANA Nº 2037651
  auxTaxaDepMes : Extended;//Helio - SOL Nº 212226 KINTANA Nº 2037651
  sSql          : String;//Helio - SOL Nº 212226 KINTANA Nº 2037651
begin
  inherited;
  bRecuperaVigencia := False;
  // Limpa campos memo
  if DBmemObservacao.Text = ''      then CdsIMOOBSERVACAO.Clear;
  if DBmemDescricaoImovel.Text = '' then CdsIMODESCRICAO.Clear;

  //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Início
  CtrlImovel.CdsPlanoPatroxVigenciaImob := _CdsVigencia;

  if (cdsPlanoPatro.IsEmpty) and not (cdsPlanoPatroxVigenciaImob.IsEmpty) then
  begin
    AtualizaPlanoPatroxImovel(iImovel);
    bRecuperaVigencia := true
  end;

  Accept := CtrlImovel.GravaImovel(bGravaPlanoPatroxVigenciaImob, bRecuperaVigencia, bProvisao);
  //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Fim

  iNumExclusao := 0;
  bGravaPlanoPatroxVigenciaImob := False;

  if Assigned(aVigencia) then
    aVigencia := nil;

  // Daniel - 23517
  molArvoreCompl1.FlgStatus := False;

  //Cássio Rovaroto - SIG nº 127938 - Garantindo que a Taxa de Depreiação somente seja calculada
  //caso confirmado pelo usuário.
  if MsgDlg('Deseja definir a taxa de depreciação do imóvel?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = idYes then
  begin
    //Helio - SOL Nº 212226 KINTANA Nº 2037651
    idImovelSalva := CtrlImovel.DbImovel.Idimovel.AsInteger;
    CtrlHistoricoVidaUtil.GravaHistoricoVidaUtilPorCds(idImovelSalva, 'Cadastro de Imóveis', True);

    auxTaxaDepMes := CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes(cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger);


    //atualiza a taxa de depreciacao dos bens
    //que nao forem terreno
    //caso o imovel ja tenha algum bem
    sSql := ' UPDATE ' +#13+
            ' (SELECT bd.TAXADEP ' +#13+
            ' FROM IMOVEL i ' +#13+
            ' INNER JOIN IMOVELXBEM ib ' +#13+
            ' ON i.IDIMOVEL = ib.IDIMOVEL ' +#13+
            ' INNER JOIN BEMXDEP bd ' +#13+
            ' ON ib.IDBEM = bd.IDBEM ' +#13+
            ' AND ib.IDPESSOA = bd.IDPESSOA ' +#13+
            ' WHERE i.IDIMOVEL = ' + IntToStr(idImovelSalva) +#13+
            ' AND ib.IXBGRUPO <> ''T'') TABELABEMXDEP ' +#13+
            ' SET TABELABEMXDEP.TAXADEP = ' + stringReplace(FloatToStr(auxTaxaDepMes), ',', '.', [rfIgnoreCase, rfReplaceAll]);

    CtrlHistoricoVidaUtil.ExecSQL(sSql);
    //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
  end;
  
  if CmeCadastro.Operacao = opAlterar then
    SelecionaMestreDetalhe(iImovel);
end;


procedure TfrmCadImovelMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Aplica Alterações de exclusão ( ordem inversa da inclusão - filho / pai )
  Accept := CtrlImovel.ExcluiImovel;
  if Accept then begin
     SelecionaMestreDetalhe( -2 );
  end;
end;


procedure TfrmCadImovelMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if cds.State in dsEditModes then
  begin
    if molImovelMestre1.iMestre > 0 then
         CdsIDIMOVELMESTRE.AsInteger := molImovelMestre1.iMestre
    else CdsIDIMOVELMESTRE.Clear;
    if molAdministradora1.iAdministradora > 0 then
         CdsIDADMINIMOVEL.AsInteger := molAdministradora1.iAdministradora
    else CdsIDADMINIMOVEL.Clear;
    if molCartorio1.iCartorio > 0 then
         CdsIDCARTORIO.AsInteger := molCartorio1.iCartorio
    else CdsIDCARTORIO.Clear;


    Accept := VerificaPreenchimento;

    if (Accept) then
      // Marcio Motta - 01/06/2004 - 16859
      // Faz a verificação do total percentual caso seja esta a opção de segregação
      if sFlgTipoPlanoPatro = 'P' then
        Accept := VerificaPercentual;

    //Cássio - SOL Nº107352 KINTANA Nº 482365 - Início
    //Previne que só haverá gravação na PLANOPATROXVIGENCIAIMOB se houver alteração
    //na aba Segregação
    if (Accept) and (bGravaPlanoPatroxVigenciaImob) then
    begin
      PreencheArrayAlteracao(CdsIDIMOVEL.AsInteger);
      dDataInclusao := Now;
      GravaAlteracaoVigencia;
    end;
  end;

  if Assigned(aVigencia) then
    aVigencia := nil;
    //Cássio - SOL Nº107352 KINTANA Nº 482365 - Fim
end;


function TfrmCadImovelMT.VerificaPreenchimento: boolean;

//Darivaldo Alencar SOL 207703.18299 -inicio
procedure ExibePagePlanoPatro;
begin
  pgctrlDetalhe.ActivePage := tbsPlanoPatro;
  tbcDetalhe.TabIndex      := pgctrlDetalhe.ActivePageIndex;
  tbcDetalheChange(dbgrdPlanoPatro);
  cbPrevistos.Visible  := false;
  cbRealizados.Visible := false;
end;

var
  dDataVigenciaCorrente: TDate;
  iIdImovel: Integer;
begin
  Result := False;
  try
    if (CmeCadastro.Operacao in [opAlterar]) then
      iIdImovel := CdsIDIMOVEL.AsInteger
    else
      iIdImovel := -1;

    if (CdsFLGTIPOIMOVEL.AsInteger = 1) and (molImovelMestre1.iMestre <= 0) then
      raise EValidacao.CreateVal('É necessário indicar o Imóvel Mestre!', molImovelMestre1.btnBuscaImovel);

    if length(trim(DBedtNomeImovel.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar o Nome do Imóvel!', DBedtNomeImovel);

    if (length(trim(DBedtAreaUtil.Text)) = 0) and (CdsFLGTIPOIMOVEL.AsInteger = 1) then
      raise EValidacao.CreateVal('É necessário indicar a Área Útil do Imóvel!', DBedtAreaUtil);

    //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Início
    if (cdsPlanoPatroxVigenciaImob.IsEmpty) and (cdsPlanoPatro.IsEmpty) then
    begin
      MsgDlg('É necessário indicar o(s) plano(s) previdenciário(s) ' +#13+
             'e a(s) patrocinadora(s) que segrega(m) o imóvel.', 'Aviso', mtWarning, [mbOK], 0);
        //Darivaldo Alencar SOL 207703.18299 -inicio
        //pgctrlDetalhe.ActivePage := tbsPlanoPatro;
        ExibePagePlanoPatro;
        //Darivaldo Alencar SOL 207703.18299 -fim
      Exit;
    end;
    //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Fim

// Felipe de Oliveira SOL 132558 Kintana 766564 - INICIO
    if (dbcbImoArrematado.Checked) and (Trim(dbedtDataArrematada.Text) = '') then
    begin
       MessageDlg('É necessário preencher a data de arrematação!', mtWarning, [mbOK], 0);
       dbedtDataArrematada.SetFocus;
       Exit;
    end;

// Felipe de Oliveira SOL 132558 Kintana 766564 - FIM

    //Darivaldo Alencar SOL 207703.18299 - Inicio
        if (StrToFloat(DBedtPercentual.text) < 0) then
           begin
               MsgDlg('Informe a Porcentagem.','Aviso', mtWarning, [mbOK], 0);
               pgctrlDetalhe.ActivePage := tbsValores;
               tbcDetalhe.TabIndex      := pgctrlDetalhe.ActivePageIndex;
               DBedtPercentual.setfocus;
               exit;
           end;

       if (ValorMestreDiferente) then
         begin
          if  MsgDlg('O valor informado é diferente do imóvel mestre,'+#13+
                     'deseja continuar?','Aviso',mtConfirmation,[mbYes,mbNo],0 ) = idNo then
               begin
                  pgctrlDetalhe.ActivePage := tbsValores;
                  tbcDetalhe.TabIndex      := pgctrlDetalhe.ActivePageIndex;
                  DBedtPercentual.setfocus;
                  exit;
               end;
         end;
    //Darivaldo Alencar SOL 207703.18299 - fim

    //Cássio - SOL Nº 132461 KINTANA Nº 763386 - Início
    cdsPlanoPatro.First;
    while not cdsPlanoPatro.Eof do
    begin
      if cdsPlanoPatro.RecNo = 1 then
        dDataVigenciaCorrente := cdsPlanoPatro.FieldByName('DATAVIGENCIA').asDateTime
      else
        if cdsPlanoPatro.FieldByName('DATAVIGENCIA').asDateTime <> dDataVigenciaCorrente then
        begin
          MsgDlg('A data de vigência entre os planos deve ser a mesma.', 'Aviso', mtWarning, [mbOK], 0);
          pgctrlDetalhe.ActivePage := tbsPlanoPatro;
          Exit;
        end
        else
          dDataVigenciaCorrente := cdsPlanoPatro.FieldByName('DATAVIGENCIA').asDateTime;
      cdsPlanoPatro.Next;
    end;
    //Cássio - SOL Nº 132461 KINTANA Nº 763386 - Fim


    //Felipe de Oliveira  SOL65636 Inicio
    if (Sistema.IdModulo = 54) and (ModuloImobiliario.InvestImob.sFlgValCod = 'S') then
    begin
      if VerificaExistencia(DBedtCodigo.Text, iIdImovel) then
      begin
        if MsgDlg('Código já existente deseja gravar mesmo assim?', 'Aviso', mtWarning,[mbYes, mbNo], 0) = idNo then
          Exit;
      end;

      if  VerificaCodigo(DBedtCodigo.Text) then
      begin
        MsgDlg('Formatação de código do imóvel não permitida!','Erro', mtError, [mbOK], 0);
        Exit;
      end;

    end;

    if (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.sFlgValCod = 'S') then
    begin
      if VerificaExistencia(DBedtCodigo.Text, iIdImovel) then
      begin
        if MsgDlg('Código já existente deseja gravar mesmo assim?', 'Aviso', mtWarning, [mbYes, mbNo], 0) = idNo then
          Exit;
      end;

      if VerificaCodigo(DBedtCodigo.Text) then
      begin
        MsgDlg('Formatação de código do imóvel não permitida!','Erro', mtError, [mbOK], 0);
        Exit;
      end;

    end;

    if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.sFlgValCod = 'S') then
    begin
      if VerificaExistencia(DBedtCodigo.Text, iIdImovel) then
      begin
        if MsgDlg('Código já existente deseja gravar mesmo assim?', 'Aviso', mtWarning, [mbYes, mbNo], 0) = idNo then
          Exit;
      end;

      if VerificaCodigo(DBedtCodigo.Text) then
      begin
        MsgDlg('Formatação de código do imóvel não permitida!','Erro', mtError, [mbOK], 0);
        Exit;
      end;

    end;
    // Felipe de Oliveira SOL65636 Fim

    //Helio - SOL Nº 212226 KINTANA Nº 2037651
    if (cds.FieldByName('IDIMOVEL').AsInteger > 0) then
    begin

       if CtrlHistoricoVidaUtil.VerificaSeModificaExistente(
            cds.FieldByName('IDIMOVEL').AsInteger,
            cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger,
            cdsHistoricoVidaUtil.FieldByName('TXDEP_ANO').AsFloat,
            cdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsFloat) then
       begin
          if MsgDlg('Isso irá alterar a taxa de depreciação do imóvel. Tem certeza que deseja alterar a vida útil?', 'Aviso',
             mtWarning, [mbYes, mbNo], 0) = idNo then
                Exit;
       end;

    end;
    //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
    
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      tbcDetalhe.TabIndex      := 0;
      pgctrlDetalhe.ActivePage := tbsGeral;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;


function TfrmCadImovelMT.VerificaPreenchimentoEvento: Boolean;
begin
  Result := False;
  try
    if (dbedtDataEvento.Text = '') then
      raise EValidacao.CreateVal('Informe a data do evento.', dbedtDataEvento);

    if length(trim(DBedtCabEvento.Text)) = 0 then
      raise EValidacao.CreateVal('Informe o cabeçalho do evento.', dbedtCabEvento);
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


function TfrmCadImovelMT.VerificaPreenchimentoPlanoPatro: Boolean;
var
  i: Integer;
begin
  Result := False;
  try
    i := 0;

    if (dblcPlanoPrev.Text = '') then
      raise EValidacao.CreateVal('Selecione o Plano Previdenciário.', dblcPlanoPrev);

    if (dblcPatro.Text = '') then
      raise EValidacao.CreateVal('Selecione a Patrocinadora.', dblcPatro);

    if (dbrgFlgTipo.ItemIndex = -1) then
      raise EValidacao.CreateVal('Informe se a segregação será por percentual ou cotas.', dblcPatro);

    if (length(trim(dbedtPercPlanoPatro.Text)) = 0) and (dbrgFlgTipo.ItemIndex = 0) then
      raise EValidacao.CreateVal('Informe o percentual.', dbrgFlgTipo);

    if (length(trim(dbedtPercPlanoPatro.Text)) = 0) and (dbrgFlgTipo.ItemIndex = 1) then
      raise EValidacao.CreateVal('Informe a quantidade de cotas.', dbrgFlgTipo);

    if (length(trim(dtVigenciaImob.Text)) = 0) then
      raise EValidacao.CreateVal('Informe a data de Início da Vigência da Segregação.', dtVigenciaImob);

    //Cássio - SOL Nº 132461 KINTANA Nº 763386
    if dtVigenciaImob.Date >= Now then
      raise EValidacao.createVal('A data de Início da Vigência deve ser menor que o dia de hoje.', dtVigenciaImob);

    if not CtrlImovel.ValidaPlanoxPatro(cdsPlanoPatroIDPLANOPREV.AsInteger, cdsPlanoPatroIDPATRO.AsInteger) then
      raise EVAlidacao.CreateVal('O Relacionamento da Patrocinadora ' + dblcPatro.Text + ' com o Plano Previdenciário ' +
                                 dblcPlanoPrev.Text + ' não é válido.', dblcPlanoPrev);

    {if (bAlterouPlano) or (cmeDetalhe.Operacao = opInserir) then
    begin
      while i <= Length(aPlanPrev) -1 do
      begin
        if cdsPlanoPatro.FieldValues['IDPLANOPREV'] = aPlanPrev[i] then
        begin

          raise EValidacao.CreateVal('Selecione um Plano Previdenciário diferente.', dblcPlanoPrev);
        end
        else
        Inc(i);
      end;
    end;}

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



function TfrmCadImovelMT.VerificaPreenchimentoIndicador: Boolean;
begin
  Result := False;
  try
    if (dbcboIndicador.Text = '') then
      raise EValidacao.CreateVal('Selecione o dado Tipo de Indicador.', dbcboIndicador);

    if (dbedtDataIndicador.Text = '') then
      raise EValidacao.CreateVal('Informe a data de lançamento do indicador.', dbedtDataIndicador);

    if (dbspnAnoCompetencia.Text = '') then
      raise EValidacao.CreateVal('Selecione o Ano de Competência.', dbspnAnoCompetencia);

    if length(trim(dbedtVlrIndicador.Text)) = 0 then
      raise EValidacao.CreateVal('Informe o valor do indicador.', dbedtVlrIndicador);
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


procedure TfrmCadImovelMT.dbcbTipoImovelClick(Sender: TObject);
begin
  inherited;
  // O imóvel mestre não possui mestre, portanto, desabilita o frame de mestre
  if dbcbTipoImovel.Checked then begin
     molImovelMestre1.btnLimpaImovelClick( Self );
     molImovelMestre1.btnBuscaImovel.Enabled := False;
     molImovelMestre1.btnLimpaImovel.Enabled := False;
  end else begin
     molImovelMestre1.btnBuscaImovel.Enabled := True;
     molImovelMestre1.btnLimpaImovel.Enabled := True;
     DBedtCodigo.Text := '';
  end;
//Felipe de Oliveira  SOL65636 Inicio
  if  ds.State in [dsInsert,dsEdit] then
  begin
      if dbcbTipoImovel.Checked then
      begin
        if (Sistema.IdModulo = 54) and (ModuloImobiliario.InvestImob.sFlgAutCod = 'S') then
           DBedtCodigo.Text := CriaCodMestre;

        if (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.sFlgAutCod = 'S') then
           DBedtCodigo.Text := CriaCodMestre;

        if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.sFlgAutCod = 'S') then
           DBedtCodigo.Text := CriaCodMestre;
      end;
  end;


// Felipe de Oliveira SOL65636 Fim

end;


procedure TfrmCadImovelMT.CmeCadastroAfterConfirma(Sender: TObject);
var fPercent : Extended;
begin
  inherited;

// Daniel - 21413 - Início -----------------------------------------------------
  if (ModuloImobiliario.AdminImob.bFlgRegEvento) then begin
    if (Cds.UpdateStatus=usModified)       or
       (CdsOutroDado.UpdateStatus=usModified) or
       (CdsEvento.UpdateStatus=usModified) then
    begin

      if (MsgDlg('Ocorreu uma alteração Cadastral. '+#13#10+
                 'Deseja registrar um evento para esta alteração?',
                 'Confirmação',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
        // Cria form de Lancamento de Eventos
        Application.CreateForm(TfrmCadEventoImovelMT, frmCadEventoImovelMT);

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
// Daniel - 21413 - Fim --------------------------------------------------------

  // Verifica a necessidade de registro de evento para o valor de mercado
  if CdsIMOVLRMERCADO.AsFloat <> fVlrMercadoAnt then begin
    if MsgDlg('Houve alteração do Valor de Mercado. ' +#13#10+
              'Deseja registrar um evento para o novo valor ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

      // Cria form de Lancamento de Eventos
      Application.CreateForm(TfrmCadEventoImovelMT, frmCadEventoImovelMT);

      // Calcula o Percentual de Variação
      fPercent := ComunsImobiliario.Arredonda( ((CdsIMOVLRMERCADO.AsFloat / fVlrMercadoAnt) -1) * 100, 2);

      // Carrega valores e procedimentos default
      frmCadEventoImovelMT.bCadastroImovel := True;
      frmCadEventoImovelMT.sFlgTipoEvento  := 'VM';
      frmCadEventoImovelMT.molImovel1.iImovel := CdsIDIMOVEL.AsInteger;
      frmCadEventoImovelMT.molImovel1.edtImovel.Text := TrimRight(molImovelMestre1.edtImovel.Text) + ' - ' + CdsIMONOME.AsString;
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
  bSemVigencia := False;
  bAlterouPlano := False;
  SetLength(aVigencia, 0);
  // Recarrega o cds com o registro após a edição
  if cmeCadastro.Operacao = opAlterar then SelecionaMestreDetalhe( CdsIDIMOVEL.AsInteger );
  cdsPlanoPatro.Filtered := False;
  cdsPlanoPatro.Filter := '';
end;


procedure TfrmCadImovelMT.CmeDetalheConfirma(Sender: TObject);
var
  i : integer;
  dDataProvisaoAnterior : TDateTime;
begin
  i := 0;
  case pgctrlDetalhe.ActivePageIndex of
    5 : begin
          if cdsIndicador.State in dsEditModes then begin
            if VerificaPreenchimentoIndicador then begin
              cdsIndicadorINMDESCRICAO.AsString := dbcboIndicador.Text;
              inherited;
            end;
          end else begin
            inherited;
          end;
        end;
    6 : begin
          if cdsEvento.State in dsEditModes then begin
            if VerificaPreenchimentoEvento then begin
              CdsEventoIDUSUARIO.AsInteger    := Sistema.IdUsuario;
              CdsEventoFLGTIPOEVENTO.AsString := 'US';
              inherited;
            end;
          end else begin
            inherited;
          end;
        end;
    8 : begin
          if cdsImagensXImoveis.State in dsEditModes then
            if VerificaPreenchimentoImagens then begin
              edtArquivoImagem.Clear;
            end;
          inherited;
        end;
    9 : begin
          if cdsPlanoPatro.State in dsEditModes then
          begin
            if VerificaPreenchimentoPlanoPatro then
            begin
              cdsPlanoPatroNOME_PATRO.AsString := dblcPatro.Text;
              cdsPlanoPatroNOME_PLANO.AsString := dblcPlanoPrev.Text;
              // Marcio Motta - 01/06/2004 - 16859
              // Inclui no CDS os dados escolhidos, faz a formatação necessária no campo
              // e desabilita opção de escolha Percentual/Cotas
              case dbrgFlgTipo.Value[1] of
                'P' : begin
                        cdsPlanoPatroDESCR_FLGTIPO.AsString := 'Percentual';
                        cdsPlanoPatroFLGTIPO.AsString := 'P';
                        sFlgTipoPlanoPatro := 'P';
                        dbrgFlgTipo.Enabled := False;
                        dbedtPercPlanoPatro.SetFocus;
                        cdsPlanoPatroPPIPERCENTRATEIO.DisplayFormat := '##0.0000000000%';
                      end;
                'C' : begin
                        cdsPlanoPatroDESCR_FLGTIPO.AsString := 'Cotas';
                        cdsPlanoPatroFLGTIPO.AsString := 'C';
                        sFlgTipoPlanoPatro := 'C';
                        dbrgFlgTipo.Enabled := False;
                        dbedtPercPlanoPatro.SetFocus;
                        cdsPlanoPatroPPIPERCENTRATEIO.DisplayFormat := '##0.00';
                      end;
              end;
              dDataVigencia := cdsPlanoPatroDATAVIGENCIA.AsDateTime;
              //Cássio - SOL Nº107352 KINTANA Nº 482365
              //Previne que só haverá gravação na HSTPERCSEGREGAIMOB se houver alteração
              //na aba Segregação
              bGravaPlanoPatroxVigenciaImob := True;
              bAlterouPlano := False;

              if CmeDetalhe.Operacao = opInserir then
              begin
                SetLength(aPlanPrev, Length(aPlanPrev) + 1);
                aPlanPrev[Length(aPlanPrev)-1] := cdsPlanoPatroIDPLANOPREV.AsInteger;
              end;

              inherited;
            end;
          end else begin
            inherited;
          end;
        end;
    //Cássio Rovaroto - SIG nº 113136 - Início
    11: begin
          if cdsProvisaoImovel.State in dsEditModes then
          begin
            if VerificaPreenchimentoProvisao then
            begin
              bProvisao := True;

              if cdsProvisaoImovel.State in [dsInsert] then
              begin
                bProvisao := True;
                cdsProvisaoImovel.FieldByName('FLGATIVO').AsString := 'S';
                cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger := CdsIDIMOVEL.AsInteger;
                cdsProvisaoImovel.FieldByName('FLGATIVO_S').asString := 'Vigência de provisão atual';
                chkProvisaoAtivo.Checked :=  True;
                dDataInicioProvisaoNova := cdsProvisaoImovel.FieldByName('VIGENCIA_INICIO').AsDateTime;
                dDataProvisaoAnterior := cdsProvisaoImovel.FieldByName('VIGENCIA_INICIO').asDateTime -1;

                cdsProvisaoImovel.First;
                if cdsProvisaoImovel.RecordCount > 1 then
                begin
                  cdsProvisaoImovel.Filtered := False;
                  cdsProvisaoImovel.Filter :=  'VIGENCIA_INICIO < ' + QuotedStr(DateTimeToStr(dDataInicioProvisaoNova));
                  cdsProvisaoImovel.Filtered := True;

                  while not cdsProvisaoImovel.Eof do
                  begin
                    cdsProvisaoImovel.Edit;
                    cdsProvisaoImovel.FieldByName('VIGENCIA_FIM').AsDateTime := dDataProvisaoAnterior;
                    cdsProvisaoImovel.FieldByName('FLGATIVO').asString :=  'N';
                    cdsProvisaoImovel.FieldByName('FLGATIVO_S').asString := 'Vigência de provisão anterior';
                    cdsProvisaoImovel.Post;
                    dDataProvisaoAnterior := cdsProvisaoImovel.FieldByName('VIGENCIA_INICIO').asDateTime -1;
                    cdsProvisaoImovel.Next;
                  end;

                  cdsProvisaoImovel.Filtered := False;
                  cdsProvisaoImovel.First;
                end;
              end;
              inherited;
            end;
          end
          else
            inherited;
        end;
    //Cássio Rovaroto - SIG nº 113136 - Fim
    else inherited;
    dblcPlanoPrev.Enabled := True;
    dtVigenciaImob.Date := dDataVigencia;
  end;
end;


procedure TfrmCadImovelMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsIndicadores then begin
     cdsIndicadorRECPAG.AsString      := 'R';
     cdsIndicadorFLGPREVREAL.AsString := 'R';
  end;

  // Marcio Motta - 01/06/2004 - 16859
  // Se já foi escolhido algum tipo: Percentual/Cotas desabilita a opção de escolha
  // senão, habilita o grupo caso ainda não haja escolha do usuário
  if pgctrlDetalhe.ActivePage = tbsPlanoPatro then
  begin
     bbtnConfirmar.Enabled := False;
     dblcPlanoPrev.Enabled := True;
     dblcPatro.Enabled := True;

     if sFlgTipoPlanoPatro <> '' then begin
        dbrgFlgTipo.Value   := sFlgTipoPlanoPatro;
        dbrgFlgTipo.Enabled := False;
     end else begin
       dbrgFlgTipo.Enabled := True;
     end;

     cdsPlanoPatro.FieldByName('DATAVIGENCIA').AsDateTime  := dDataVigencia;

     {if (dDataVigencia <> 0)  then
     begin
      cdsPlanoPatroDATAVIGENCIA.AsDateTime := dDataVigencia;
      dtVigenciaImob.Enabled := False;
     end
     else
     begin
      dtVigenciaImob.Enabled := True;
     end;}
     bAlterouPlano := False;

     if not dblcPlanoPrev.Enabled then
      dblcPlanoPrev.Enabled := True;
  end;

  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    cdsEventoFLGAVISO.AsString := 'N';
    cbAvisoEvento.Checked      := False;
  end;

  if pgctrlDetalhe.ActivePage = tbsProvisao then
  begin
    chkProvisaoAtivo.Checked := False;
    edtPercProvisao.SetFocus;
  end;

end;

procedure TfrmCadImovelMT.sbtnAltDetClick(Sender: TObject);
begin

  if pgctrlDetalhe.ActivePage = tbsEventos then begin
// Daniel - 21967 - ------------------------------------------------------------
    if (not CdsEventoFLGTIPOEVENTO.IsNull) and (CdsEventoFLGTIPOEVENTO.AsString <> 'US') then begin
      MsgDlg('Eventos de sistema não podem ser editados.', 'Aviso', mtWarning, [mbOk], 0);
      sbtnAltDet.Down    := False;
      tbsEventos.Enabled := False;
    end else begin
      // Verifica se a opção Alterar/Excluir apenas pelo usuário de lançamento está marcada no "Parâmetros do Sistema" ...
      if ( ModuloImobiliario.AdminImob.bFlgAlteraEvento=True ) then begin
        // Verifica se o usuário logado no sistema é o mesmo responsável pelo lançamento do evento...
        if Sistema.IdUsuario<>cdsEventoIDUSUARIO.AsInteger then begin
          MsgDlg('Eventos de sistema só podem ser editados pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
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
// Daniel - 21967 - ------------------------------------------------------------

  end else begin
    inherited;
  end;
  bAlterouPLano := False;
end;

procedure TfrmCadImovelMT.sbtnExcluiDetClick(Sender: TObject);
begin

  if pgctrlDetalhe.ActivePage = tbsEventos then
  begin
// Daniel - 21967 - ------------------------------------------------------------
    if (not CdsEventoFLGTIPOEVENTO.IsNull) and (CdsEventoFLGTIPOEVENTO.AsString <> 'US') then begin
      MsgDlg('Eventos de sistema não podem ser excluídos.', 'Aviso', mtWarning, [mbOk], 0);
      sbtnAltDet.Down := False;
    end else begin
      if ( ModuloImobiliario.AdminImob.bFlgAlteraEvento=True ) then begin
        if Sistema.IdUsuario<>cdsEventoIDUSUARIO.AsInteger then begin
          MsgDlg('Eventos de sistema só podem ser excluídos pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
          sbtnAltDet.Down := False;
        end else inherited;
      end else inherited;
    end;
// Daniel - 21967 - ------------------------------------------------------------
  end
  else
    begin
      inherited;
    end;
end;


procedure TfrmCadImovelMT.btnAtualizaClick(Sender: TObject);
var cdsTemp : TCMClientDataSet;
    ArqErro : TextFile;
    sCid, sUf : String;
begin
  inherited;
  try
    try
      CtrlImovel.StartTransaction;
      AssignFile(ArqErro,'ErrosCidade.Log');
      Rewrite(ArqErro);
      // Limpa os ids das cidades
      qryLimpaCidades.ExecSQL;

      frmProgresso.MostraFormProgresso('Atualizando ID da Cidade...');
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := CtrlImovel.GetDataPacket('SELECT IDIMOVEL, IMOCIDADE, CODESTADO FROM IMOVEL');
      while not cdsTemp.Eof do begin
        frmProgresso.AndaFormProgresso(cdsTemp.Recno, cdsTemp.RecordCount);
        sCid := Trim(LowerCase(cdsTemp.FieldByName('IMOCIDADE').AsString));
        sUf  := Trim(LowerCase(cdsTemp.FieldByName('CODESTADO').AsString));

        LimpaParametros(qryBuscaCidade);
        qryBuscaCidade.ParamByName('PUF').AsString     := sUf;
        qryBuscaCidade.ParamByName('PCIDADE').AsString := sCid;
        if sCid = 'sao paulo' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'são paulo';
        if sCid = 'são paulo' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'sao paulo';
        if sCid = 'brasilia'  then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'brasília';
        if sCid = 'brasília'  then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'brasilia';
        if sCid = 'maceio'    then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'maceió';
        if sCid = 'maceió'    then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'maceio';
        if sCid = 'goiania'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'goiânia';
        if sCid = 'goiânia'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'goiania';
        if sCid = 'vitoria'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'vitória';
        if sCid = 'vitória'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'vitoria';
        if sCid = 'são luís'  then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'sao luis';
        if sCid = 'sao luis'  then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'são luís';
        if sCid = 'juíz de fora' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'juiz de fora';
        if sCid = 'juiz de fora' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'juíz de fora';
        if sCid = 'niterói'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'niteroi';
        if sCid = 'niteroi'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'niterói';
        if sCid = 'são gonçalo' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'sao goncalo';
        if sCid = 'sao goncalo' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'são gonçalo';
        if sCid = 'jundiaí'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'jundiai';
        if sCid = 'jundiai'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'jundiaí';
        if sCid = 'orlândia'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'orlandia';
        if sCid = 'orlandia'   then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'orlândia';
        if sCid = 'santo andré' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'santo andre';
        if sCid = 'santo andre' then qryBuscaCidade.ParamByName('PCIDADE2').AsString := 'santo andré';

        qryBuscaCidade.Open;
        if not qryBuscaCidade.IsEmpty then begin
          qryUpdCidade.ParamByName('PIDCIDADES').AsInteger := qryBuscaCidadeIDCIDADES.AsInteger;
          qryUpdCidade.ParamByName('PIDIMOVEL').AsInteger  := cdsTemp.FieldByName('IDIMOVEL').AsInteger;
          qryUpdCidade.ExecSQL;
        end else begin
          writeLn(ArqErro, cdsTemp.FieldByName('IDIMOVEL').AsString + ' - ' + cdsTemp.FieldByName('IMOCIDADE').AsString + ' / ' + cdsTemp.FieldByName('CODESTADO').AsString);
        end;
        cdsTemp.Next;
      end;
      CtrlImovel.Commit;
    except
      CtrlImovel.Rollback;
      ComunsImobiliario.MensErroMT('ERRO NA GRAVACAO');
    end;
  finally
    cdsTemp.Free;
    CloseFile( ArqErro );
    frmProgresso.EscondeFormProgresso;
  end;

end;

procedure TfrmCadImovelMT.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  inherited;
  // Apaga os arquivo temporários criados para visualizar as imagens - Marcio Motta
  if ListaArquivosTemp.Count > 0 then begin
    for i := 0 to ListaArquivosTemp.Count - 1 do begin
      DeleteFile(ListaArquivosTemp[i]);
    end;
  end;
  FreeAndNil(ListaArquivosTemp);

  // Daniel - 23517
  molArvoreCompl1.EncerraFrame;
end;

procedure TfrmCadImovelMT.btnAtualizaSitClick(Sender: TObject);
var sSql : String;
    cdsImo, cdsTemp : TCMClientDataSet;
begin
  inherited;
  try
    try
      frmProgresso.MostraFormProgresso('Atualizando o Status dos Imóveis...');
      CtrlImovel.StartTransaction;
      cdsImo  := TCMClientDataSet.Create( nil );
      cdsTemp := TCMClientDataSet.Create( nil );

      // Busca todos os imóveis
      sSql := 'SELECT IDIMOVEL, FLGATIVO, FLGSTATUS '+
              '  FROM IMOVEL             '+
              ' WHERE IDIMOVELMESTRE IS NOT NULL';
      cdsImo.Data := CtrlImovel.GetDataPacket( sSql );
      while not cdsImo.Eof do begin
        frmProgresso.AndaFormProgresso(cdsImo.Recno, cdsImo.RecordCount);

        // Verifica a situação dos bens no AtivoFixo
        sSql := 'SELECT DISTINCT B.BAIXATOTAL ' +
                '  FROM BEM B, IMOVELXBEM IXB ' +
                ' WHERE B.IDBEM = IXB.IDBEM '   +
                '   AND B.BAIXATOTAL = ''N'' '  +
                '   AND IXB.IDIMOVEL = ' + IntToStr(cdsImo.FieldByName('IDIMOVEL').AsInteger);
        cdsTemp.Data := CtrlImovel.GetDataPacket(sSql);

        // TODOS Bens baixados e imóvel ativo - muda para inativo
        if (cdsTemp.IsEmpty) and ((cdsImo.FieldByName('FLGATIVO').AsInteger = 1)
                                  or (cdsImo.FieldByName('FLGSTATUS').IsNull)) then begin
           sSql := 'UPDATE IMOVEL            ' +
                   '   SET FLGATIVO = 0,     ' +
                   '       FLGSTATUS = ''V'' ' +
                   ' WHERE IDIMOVEL = ' + IntToStr(cdsImo.FieldByName('IDIMOVEL').AsInteger);
           CtrlImovel.ExecSQL( sSql );
        end;

        // Bens Ativos e imóvel inativo - muda para ativo
        if (not cdsTemp.IsEmpty) and ((cdsImo.FieldByName('FLGATIVO').AsInteger = 0)
                                      or (cdsImo.FieldByName('FLGSTATUS').IsNull)) then begin
           sSql := 'UPDATE IMOVEL            '+
                   '   SET FLGATIVO = 1,     '+
                   '       FLGSTATUS = ''N'' '+
                   ' WHERE IDIMOVEL = ' + IntToStr(cdsImo.FieldByName('IDIMOVEL').AsInteger);
           CtrlImovel.ExecSQL( sSql );
        end;
        cdsImo.Next;
      end;
      CtrlImovel.Commit;
    except
      CtrlImovel.Rollback;
    end;
  finally
    cdsTemp.Free;
    cdsImo.Free;
    frmProgresso.EscondeFormProgresso;
  end;
end;


procedure TfrmCadImovelMT.DBImageDblClick(Sender: TObject);
var
   sFileName : string;
   i : integer;
begin
  inherited;
  if not cdsImagensXImoveisIMAGEM.IsNull then begin
    // Busca o diretório temporário CM
    sFileName := Sistema.TempDir;

    // Adiciona '\' ao final do caminho, caso este não exista
    if sFileName[ length( sFileName ) ] <> '\' then sFileName := sFileName + '\';

    // Monta um nome para o arquivo temporário
    Randomize;
    sFileName := sFileName + Copy( FormatFloat( '000000', GetTickCount ), 1, 6 ) +
      FormatFloat( '0000', Random( 10000 ) ) + '.bmp';

    // Salva o arquivo
    DBImage.Picture.Bitmap.SaveToFile( sFileName );

    // Inclui em uma stringlist o nome do arquivo para deletar no fechamento do form
    ListaArquivosTemp.Add(sFileName);

    // Abre o arquivo
    ShellExecute( Self.Handle, 'open', PChar( sFileName ), '', '', SW_SHOW	);
  end else begin
    EXIT;
  end;
end;

function TfrmCadImovelMT.VerificaPreenchimentoImagens: Boolean;
begin
  Result := False;
  try
    if (edtArquivoImagem.Text = '') then
      raise EValidacao.CreateVal('Selecione o arquivo que contém a figura.', edtArquivoImagem);

    if (DBDescrimagem.Text = '') then
      raise EValidacao.CreateVal('Preencha o campo de descrição da imagem.', DBDescrimagem);

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

procedure TfrmCadImovelMT.CmeDetalheCancel(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePageIndex=8) then begin
    EdtArquivoImagem.Clear;
  end;

  if pgctrlDetalhe.ActivePageIndex = 9 then
    bbtnConfirmar.Enabled := False;

  inherited;
  molArvoreCompl1.MontaArvore(iImovel,-1,'I');
  dDataVigencia := 0;
end;

procedure TfrmCadImovelMT.bbtnVoltarDetClick(Sender: TObject);
begin
  edtArquivoImagem.Clear;
  bAlterouPlano := False;
  bbtnConfirmar.Enabled := True;
  inherited;
end;

procedure TfrmCadImovelMT.cdsImagensXImoveisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Image.Picture:=dbImage.Picture;
end;

procedure TfrmCadImovelMT.Button1Click(Sender: TObject);
var
   Imagem    : TBitmap;
   ImagemJPG : TJPEGImage;
   Extensao  : String;
   Arquivo   : File of Byte;
   Tamanho   : Longint;

begin
   if opdImagem.Execute then
    begin
       // Verifica o tamanho do arquivo
       AssignFile(Arquivo, OpdImagem.FileName);
       Reset(Arquivo);
       Tamanho := FileSize(Arquivo);
       CloseFile(Arquivo);

       if Tamanho > 2048000 then begin
         MsgDlg('O tamanho máximo permitido para' + #13 +
                'o arquivo é de 2.048.000 bytes!' , 'Aviso', mtWarning, [mbOk], 0);
         EXIT;
       end;

       EdtArquivoImagem.Text := opdImagem.FileName;
       Extensao:=ExtractFileExt(opdImagem.FileName);
       Extensao:=UpperCase(Trim(Copy(Extensao,2,(Length(Extensao)-1))));

       Imagem:=TBitmap.Create;
       ImagemJPG:=TJPEGImage.Create;
       try
          if (Extensao='JPG') then
           begin
             ImagemJPG.LoadFromFile(opdImagem.FileName);
             Imagem.Assign(ImagemJPG);
           end
          else
            Imagem.LoadFromFile(opdImagem.FileName);

          dbImage.Picture.Assign(Imagem);
          Image.Picture.Assign(Imagem);
       finally
          Imagem.Free;
       end;
    end;
end;

procedure TfrmCadImovelMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;

  // Marcio Motta - 01/06/2004 - 16859
  // Se já foi escolhido algum tipo: Percentual/Cotas desabilita a opção de escolha
  // senão, habilita o grupo caso ainda não haja escolha do usuário
  if pgctrlDetalhe.ActivePage = tbsPlanoPatro then
  begin
     //dblcPlanoPrev.Enabled := False;
     //dblcPatro.Enabled := False;
     bbtnConfirmar.Enabled := False;

     if sFlgTipoPlanoPatro <> '' then
     begin
        cdsPlanoPatroFLGTIPO.AsString := sFlgTipoPlanoPatro;
        dbrgFlgTipo.Enabled := False;
     end
     else
      dbrgFlgTipo.Enabled := True;

    //cdsPlanoPatroDATAVIGENCIA.AsDateTime := dDataVigencia;
    dtVigenciaImob.Date := cdsPlanoPatroDATAVIGENCIA.AsDateTime;

    dtVigenciaImob.Enabled := True;
    bAlterouPlano := False;
    cdsPlanoPatroPPIPERCENTRATEIO.DisplayFormat := '';
  end;
  //Cássio Rovaroto - SIG nº 113136 - Início
  if pgctrlDetalhe.ActivePage = tbsProvisao then
  begin
    if CtrlProvisaoImovel.VerificaMovimentacaoProvisaoPeriodo(CdsIDIMOVEL.AsInteger,
                                           cdsProvisaoImovel.FieldByName('VIGENCIA_INICIO').AsDateTime) then
    begin
      MsgDlg('Não se pode alterar uma vigência de segregação que já possua uma movimentação processada.', 'Aviso', mtWarning, [mbOk], 0);
      bbtnCancelarDetClick(Sender);
    end;
  end;
  //Cássio Rovaroto - SIG nº 113136 - Fim
end;

procedure TfrmCadImovelMT.CmeDetalheDelete(Sender: TObject);
var
  i : integer;
begin
  PreencheArrayExclusao(cdsPlanoPatroIDPLANOPREV.AsString, cdsIDIMOVEL.asInteger);
  bGravaPlanoPatroxVigenciaImob := True;

  //Cássio Rovaroto - SIG nº 113136 - Início
  if pgctrlDetalhe.ActivePage = tbsProvisao then
  begin
    if CtrlProvisaoImovel.VerificaMovimentacaoProvisaoPeriodo(CdsIDIMOVEL.AsInteger,
                                           cdsProvisaoImovel.FieldByName('VIGENCIA_INICIO').AsDateTime) then
    begin
      MsgDlg('Não se pode excluir uma vigência de segregação que já possua uma movimentação processada.', 'Aviso', mtWarning, [mbOk], 0);
      bbtnCancelarDetClick(Sender);
    end
    else
    begin
      if MsgDlg('Deseja realmente excluir essa vigência de provisão?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = idNo then
       Exit
      else
        CtrlProvisaoImovel.ExcluiProvisaoImovel(cdsProvisaoImovel.FieldByName('IDPROVISAOIMOVEL').AsInteger);
    end;

  end;
  //Cássio Rovaroto - SIG nº 113136 - Fim

  inherited;
  // Marcio Motta - 01/06/2004 - 16859
  // Verifica se existem dados no CDS. Caso negativo,
  // reabilita escolher tipo Percentual/Cotas
  if pgctrlDetalhe.ActivePage = tbsPlanoPatro then
  begin
     if cdsPlanoPatro.IsEmpty then
     begin
       sFlgTipoPlanoPatro  := '';
       dbrgFlgTipo.Enabled := True;
     end;

     if cdsPlanoPatroxVigenciaImob.IsEmpty then
      dtVigenciaImob.Text := '';
    AtualizaPlanoArray;
  end;

  //Cássio Rovaroto - SIG nº 113136 - Início
  //Atualiza o status da última vigência cadastrada como atual e as demais com anteriores
  if pgctrlDetalhe.ActivePageIndex =  11 then
  begin
    cdsProvisaoImovel.First;
    cdsProvisaoImovel.IndexFieldNames := 'VIGENCIA_INICIO';
    while not cdsProvisaoImovel.Eof do
    begin
      cdsProvisaoImovel.Edit;
      if cdsProvisaoImovel.RecNo = cdsProvisaoImovel.RecordCount then
      begin
        cdsProvisaoImovel.FieldByName('FLGATIVO').asString := 'S';
        cdsProvisaoImovel.FieldByName('VIGENCIA_FIM').asString := EmptyStr;
        cdsProvisaoImovel.FieldByName('FLGATIVO_S').asString := 'Vigência de provisão atual';

      end
      else
      begin
        cdsProvisaoImovel.FieldByName('FLGATIVO').asString := 'N';
        cdsProvisaoImovel.FieldByName('FLGATIVO_S').asString := 'Vigência de provisão anterior';
      end;
      cdsProvisaoImovel.Post;
      cdsProvisaoImovel.Next;
    end;
    //bExcluiProvisao := True;
  end;
  //Cássio Rovaroto - SIG nº 113136 - Fim

end;

procedure TfrmCadImovelMT.CmeCadastroCancel(Sender: TObject);
begin
  if (cdsPlanoPatro.ChangeCount > 0) and not(sbtnAlterar.Down) then
  begin
    cdsPlanoPatro.Close;
    inherited;
    cdsPlanoPatro.Data :=  CtrlImovel.LookupPlanoPatroxImo(-2);
  end
  else
   inherited;

  // Marcio Motta - 01/06/2004 - 15859
  // Verifica se existem dados no CDS. Caso negativo,
  // reabilita escolher tipo Percentual/Cotas
  if cdsPlanoPatro.IsEmpty then
  begin
    sFlgTipoPlanoPatro  := '';
    dbrgFlgTipo.Enabled := True;
  end;

  // Daniel - 23517
  molArvoreCompl1.FlgStatus := False;

  if Assigned(aVigencia) then
    aVigencia := nil;
    
  bbtnConfirmar.Enabled := False;
end;

function TfrmCadImovelMT.VerificaPercentual: Boolean;
var
  TotalPercent : Double;
begin
  // Marcio Motts - 01/06/2004 - 16859
  // Função criada para validar o percentual de segregação no Plano Patro

  Result := True;
  TotalPercent := 0;
  CdsPlanoPatro.First;

  while not CdsPlanoPatro.Eof do begin
    TotalPercent := TotalPercent + Trunc(cdsPlanoPatroPPIPERCENTRATEIO.AsFloat * 10000000000);
    CdsPlanoPatro.Next;
  end;
  //TotalPercent := ComunsImobiliario.Arredonda(TotalPercent / 10000000000, 0);
  TotalPercent := StrToFloat(FormatFloat('##.#####', (TotalPercent / 10000000000)));

  if (TotalPercent > 100) then begin
    MsgDlg('O total percentual da segregação em Planos Patro ultrapassa 100%.', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    pgctrlDetalhe.ActivePage := tbsPlanoPatro;
    pgSegregacao.ActivePage := tbsDadosSegregacao;
  end;

  if (TotalPercent < 100) then begin
    MsgDlg('O total percentual da segregação em Planos Patro não contempla 100%.', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    pgctrlDetalhe.ActivePage := tbsPlanoPatro;
    pgSegregacao.ActivePage := tbsDadosSegregacao;
  end;

end;

procedure TfrmCadImovelMT.AbreImovel(const iIdImovel: Integer);
begin
   SelecionaMestreDetalhe( iIdImovel );
   CmeCadastro.AtualizaBotoes( Self );
   sbtnAlterar.Enabled := True;
   sbtnApagar.Enabled  := True;
   Show;
end;

procedure TfrmCadImovelMT.dbcboIndicadorChange(Sender: TObject);
begin
  inherited;
  edtIPOIndicador.Text   := cdsLookIndicadorDSC_TIPOVALOR.AsString;
  edClasseIndicador.Text := cdsLookIndicadorDSC_RECPAG.AsString;
end;

procedure TfrmCadImovelMT.CmeCadastroEdit(Sender: TObject);
var
 i: integer;
begin
  inherited;
  i := 0;
  if pgctrlDetalhe.ActivePage = tbsPlanoPatro then
    pgSegregacao.ActivePage := tbsDadosSegregacao;
  // Daniel - 23517
  molArvoreCompl1.FlgStatus := True;

  if assigned(aVigencia) then
    aVigencia := nil;
  cdsPlanoPatro.First;

  if Assigned(aPlanos) then
    aPlanos := nil;

  if (cdsPlanoPatro.RecordCount >= 1) then
  begin
    SetLength(aPlanos, cdsPlanoPatro.RecordCount);
    while not cdsPlanoPatro.Eof do
    begin
      aPlanos[i].iStatus := 0;
      aPlanos[i].iPlanoPrev := cdsPlanoPatroIDPLANOPREV.asInteger;
      aPlanos[i].iPatro := cdsPlanoPatroIDPATRO.AsInteger;
      aPlanos[i].dPercentual := cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;
      Inc(i);
      cdsPlanoPatro.Next;
    end;
  end;
  cdsPlanoPatro.First;
end;

procedure TfrmCadImovelMT.FormShow(Sender: TObject);
begin
  inherited;
  // Desabilita DAIEA para RioPrevidencia
  if Sistema.TipoCliente = 20061 then begin
     dbcbTipoSPC.Visible        := False;
     DBcboMarca2.Visible        := True;
     grpRetornoPrevisto.Visible := False;
     lblMarca.Visible           := False;
     DBcboMarca.Visible         := False;
     gbDaiea.Caption := '';
     lblCarteiraDaiea.Top  := 57;
     lblCarteiraDaiea.Left := 10;
     wwDBCodDaiea.Top      := 70;
     wwDBCodDaiea.Left     := 10;
     lblTipoImovelSPC.Top  := 16;
     lblTipoImovelSPC.Left := 10;
     DBcboMarca2.Top       := 29;
     DBcboMarca2.Left      := 10;
     lblSituacao.Left      := 8;
     dbcbSitImovel.Left    := 8;
     dbcbSitImovel.Width   := 316;
  end;
end;

//Darivaldo Alencar SOL 207703.18299 - inicio
function TfrmCadImovelMT.ValorMestreDiferente: boolean;
var
  qry: TwwQuery;
  IdMestre: string;
begin
  result:= false;

  if (dbcbTipoImovel.checked) then
     exit;

  IdMestre:= IntToStr(molImovelMestre1.IMestre);
  if ((frmCadImovelMT.DBedtPercentual.Text <> EmptyStr) and (IdMestre <> EmptyStr)) then
     begin
       try
          qry:= TwwQuery.create(nil);
          qry.dataBaseName := 'BASEDADOS';
          qry.close;
          qry.sql.clear;
          qry.sql.add('SELECT NVL(PERCENTUAL,0)AS PERCENTUAL FROM IMOVEL WHERE IDIMOVEL = ' + IdMestre);
          qry.open;

          if (qry.FieldByname('PERCENTUAL').AsCurrency <> StrToFloat(frmCadImovelMT.DBedtPercentual.Text)) then
            result:= true

       finally
          FreeAndNil(qry);
       end;
     end
end;
//Darivaldo Alencar SOL 207703.18299 - fim

procedure TfrmCadImovelMT.molImovelMestre1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelMestre1.btnBuscaImovelClick(Sender);
// Felipe de Oliveira SOL65636
    if (Sistema.IdModulo = 54) and (ModuloImobiliario.InvestImob.sFlgAutCod = 'S') then
       DBedtCodigo.Text := CriaCodigoImovel(molImovelMestre1.sMestre);

    if (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.sFlgAutCod = 'S') then
       DBedtCodigo.Text := CriaCodigoImovel(molImovelMestre1.sMestre);

    if (Sistema.IdModulo = 64) and (ModuloImobiliario.AdminImob.sFlgAutCod = 'S')then
       DBedtCodigo.Text := CriaCodigoImovel(molImovelMestre1.sMestre);



end;

procedure TfrmCadImovelMT.cbPrevistosClick(Sender: TObject);
begin
  inherited;
// Gustavo Mendes - 26634 - Inicio ------------------------------------------------
  cdsIndicador.Filtered := False;

  if not(( cbPrevistos.Checked ) and ( cbRealizados.Checked )) then
  begin
    if ( cbPrevistos.Checked ) then
      cdsIndicador.Filter := ' (FLGPREVREAL = ''P'') ';

    if ( cbRealizados.Checked ) then
      cdsIndicador.Filter := ' (FLGPREVREAL = ''R'') ';

    if (not ( cbPrevistos.Checked ) and not ( cbRealizados.Checked )) then
      cdsIndicador.Filter := ' (FLGPREVREAL IS NULL) ';

    cdsIndicador.Filtered := True;
  end;

  dbgrdIndicadorUpdateFooter( Self );
// Gustavo Mendes - 26634 - Fim ---------------------------------------------------
end;

procedure TfrmCadImovelMT.dbgrdIndicadorUpdateFooter(Sender: TObject);
var
  cdsTemp : TCMClientDataSet;

begin
  inherited;

  try
    try
       cdsTemp          := TCMClientDataSet.Create(nil);
       cdsTemp.Data     := cdsIndicador.Data;
       cdsTemp.Filter   := cdsIndicador.Filter;
       cdsTemp.Filtered := cdsIndicador.Filtered;
       cdsTemp.First;
    except

    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmCadImovelMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if Sender is TTabControl then
  begin
    cbPrevistos.Visible := ( (Sender as TTabControl).TabIndex = 5 );
    cbRealizados.Visible := ( (Sender as TTabControl).TabIndex = 5 );
  end;

  {Início - Michelle Mota - SIG26054}
  if (pgctrlDetalhe.ActivePage = tbsVoto) then
    Dock973.Visible := False
  else
    Dock973.Visible := True;
  {Término - Michelle Mota - SIG26054}
end;
procedure TfrmCadImovelMT.pgSegregacaoChange(Sender: TObject);
begin
  inherited;
  if cmeCadastro.Operacao in [opInserir, opAlterar]  then
  begin
    CmeDetalheCancel(Sender);
    bbtnVoltarDetClick(Sender);
  end
  else
    bbtnConfirmar.Enabled := False;

  if pgSegregacao.ActivePage = tbsHstSegregacao then
  begin
    Dock973.visible:= true;//Darivaldo Alencar SOL 207703.18299
    sbtnInsDet.Enabled := False;
    sbtnExcluiDet.Enabled := False;
    sbtnAltDet.Enabled := False;
  end;
end;

procedure TfrmCadImovelMT.GravaAlteracaoVigencia;
var
  _cdsLocal : TCmClientDataSet;
  i : integer;
begin
  i:= 0;
  _cdsLocal := TCmClientDataSet.Create(nil);
  try
    _CdsVigencia.First;
    while i <= Length(aVigencia) -1 do
    begin
      if aVigencia [i].iStatus = 1 then //Inclusão
      begin
        _CdsVigencia.Insert;
        _CdsVigencia.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;//cdsPlanoPatroDATAVIGENCIA.AsDateTime;
        _CdsVigencia.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev;//cdsPlanoPatroIDPLANOPREV.AsInteger;
        _CdsVigencia.FieldByName('IDPATRO').AsInteger := aVigencia[i].iPatro;//cdsPlanoPatroIDPATRO.AsInteger;
        _CdsVigencia.FieldByName('PERCENTRATEIO').AsFloat := aVigencia[i].dPercentual;//cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;

        _CdsVigencia.FieldByName('TRGDTINCLUSAO').AsDateTime := dDataInclusao;
        _CdsVigencia.Post;

        if (CtrlImovel.VerificaBensxImovel(iImovel)) then
        begin
          _cdsLocal.Data := CtrlImovel.LookupImovelXBem(iImovel);
          while not _cdsLocal.Eof do
          begin
            _CdsPlanoPatroxVigenciaBem.Insert;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger := _cdsLocal.FieldByName('IDBEM').AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;//cdsPlanoPatroDATAVIGENCIA.AsDateTime;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev;//cdsPlanoPatroIDPLANOPREV.AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPATRO').AsInteger := aVigencia[i].iPatro;//cdsPlanoPatroIDPATRO.AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('PERCENTRATEIO').AsFloat:= aVigencia[i].dPercentual;//cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPESSOA').AsInteger := _cdsLocal.FieldByName('IDPESSOA').AsInteger;

            _CdsPlanoPatroxVigenciaBem.Post;
            _cdsLocal.Next;
          end;
        end;
      end;

      //if (aVigencia[i].iStatus = 3) or (aVigencia[i].iStatus = 0) then
      if (aVigencia[i].iStatus = 2) then //alteração
      begin
        //if (not bSemVigencia) then
        //begin

          _CdsVigencia.Insert;
          _CdsVigencia.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia; //cdsPlanoPatroDATAVIGENCIA.AsDateTime;
          _CdsVigencia.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev; //cdsPlanoPatroIDPLANOPREV.AsInteger;
          _CdsVigencia.FieldByName('IDPATRO').AsInteger := aVigencia[i].iPatro; //cdsPlanoPatroIDPATRO.AsInteger;
          _CdsVigencia.FieldByName('PERCENTRATEIO').AsFloat := aVigencia[i].dPercentual; //cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;

          _CdsVigencia.FieldByName('TRGDTINCLUSAO').AsDateTime := dDataInclusao;
          _CdsVigencia.Post;
        //end;

        if (CtrlImovel.VerificaBensxImovel(iImovel)) then
        begin
          _cdsLocal.Data := CtrlImovel.LookupImovelXBem(iImovel);
          while not _cdsLocal.Eof do
          begin
            _CdsPlanoPatroxVigenciaBem.Insert;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger := _cdsLocal.FieldByName('IDBEM').AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;//cdsPlanoPatroDATAVIGENCIA.AsDateTime;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev; //cdsPlanoPatroIDPLANOPREV.AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPATRO').AsInteger := aVigencia[i].iPatro;//cdsPlanoPatroIDPATRO.AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('PERCENTRATEIO').AsFloat:= aVigencia[i].dPercentual;//cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPESSOA').AsInteger := _cdsLocal.FieldByName('IDPESSOA').AsInteger;

            _CdsPlanoPatroxVigenciaBem.Post;
            _cdsLocal.Next;
          end;
        end;
      end;

      if aVigencia[i].iStatus = 3 then //Exclusão
      begin

        _CdsVigencia.Insert;
        _CdsVigencia.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;//cdsPlanoPatroDATAVIGENCIA.AsDateTime;
        _CdsVigencia.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev;//cdsPlanoPatroIDPLANOPREV.AsInteger;
        _CdsVigencia.FieldByName('IDPATRO').AsInteger := aVigencia[i].iPatro;//cdsPlanoPatroIDPATRO.AsInteger;
        _CdsVigencia.FieldByName('PERCENTRATEIO').AsFloat := aVigencia[i].dPercentual;//cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;

        _CdsVigencia.FieldByName('TRGDTINCLUSAO').AsDateTime := dDataInclusao;
        _CdsVigencia.Post;

        if (CtrlImovel.VerificaBensxImovel(iImovel)) then
        begin
          _cdsLocal.Data := CtrlImovel.LookupImovelXBem(iImovel);
          while not _cdsLocal.Eof do
          begin
            _CdsPlanoPatroxVigenciaBem.Insert;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger := _cdsLocal.FieldByName('IDBEM').AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;//cdsPlanoPatroDATAVIGENCIA.AsDateTime;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev;//cdsPlanoPatroIDPLANOPREV.AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPATRO').AsInteger := aVigencia[i].iPatro;//cdsPlanoPatroIDPATRO.AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('PERCENTRATEIO').AsFloat:= aVigencia[i].dPercentual;//cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPESSOA').AsInteger := _cdsLocal.FieldByName('IDPESSOA').AsInteger;

            _CdsPlanoPatroxVigenciaBem.Post;
            _cdsLocal.Next;
          end;
        end;
      end;
        {else
        begin
          sStatus := 'Incluída';
          _CdsVigencia.Insert;
          _CdsVigencia.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;//cdsPlanoPatroDATAVIGENCIA.AsDateTime;
          _CdsVigencia.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev;//cdsPlanoPatroIDPLANOPREV.AsInteger;
          _CdsVigencia.FieldByName('IDPATRO').AsInteger := aVigencia[i].iPatro;//cdsPlanoPatroIDPATRO.AsInteger;
          _CdsVigencia.FieldByName('PERCSEGREGAIMOV').AsFloat := aVigencia[i].dPercentual;//cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;
          _CdsVigencia.FieldByName('STATUS').AsString := sStatus;
          _CdsVigencia.FieldByName('TRGDTINCLUSAO').AsDateTime := dDataInclusao;
          _CdsVigencia.Post;

          if (CtrlImovel.VerificaBensxImovel(iImovel)) then
          begin
            _cdsLocal.Data := CtrlImovel.LookupImovelXBem(iImovel);
            while not _cdsLocal.Eof do
            begin
              _CdsPlanoPatroxVigenciaBem.Insert;
              _CdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger := _cdsLocal.FieldByName('IDBEM').AsInteger;
              _CdsPlanoPatroxVigenciaBem.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;//cdsPlanoPatroDATAVIGENCIA.AsDateTime;
              _CdsPlanoPatroxVigenciaBem.FieldByName('IDPLANOPREV').AsInteger := aVigencia[i].iPlanoPrev;//cdsPlanoPatroIDPLANOPREV.AsInteger;
              _CdsPlanoPatroxVigenciaBem.FieldByName('IDPATRO').AsInteger :=  aVigencia[i].iPatro;//cdsPlanoPatroIDPATRO.AsInteger;
              _CdsPlanoPatroxVigenciaBem.FieldByName('PERCSEGREGABEM').AsFloat:= aVigencia[i].dPercentual;//cdsPlanoPatroPPIPERCENTRATEIO.AsFloat;
              _CdsPlanoPatroxVigenciaBem.FieldByName('IDPESSOA').AsInteger := _cdsLocal.FieldByName('IDPESSOA').AsInteger;
              _CdsPlanoPatroxVigenciaBem.FieldByName('STATUS').AsString := sStatus;
              _CdsPlanoPatroxVigenciaBem.Post;
              _cdsLocal.Next;
            end;
          end;
        end; }
      //end;
      Inc(i);
    end;
  finally
    _cdsLocal.Free;
  end;
end;

procedure TfrmCadImovelMT.GravaExclusaoVigencia;
var
  _cdsLocal : TCMClientDataSet;
  i: integer;
begin
   _cdsLocal := TCMClientDataSet.Create(nil);
   _CdsVigencia.First;
   cdsPlanoPatroxVigenciaImob.First;
   i := 0;
  try
    while i <= Length(aVigencia) -1 do
    begin
      if aVigencia[i].iStatus = 1 then
      begin
        _CdsVigencia.Insert;
        _CdsVigencia.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;
        _CdsVigencia.FieldByName('IDPLANOPREV').AsInteger := cdsPlanoPatroxVigenciaImob.FieldByName('IDPLANOPREV').AsInteger;
        _CdsVigencia.FieldByName('IDPATRO').AsInteger := cdsPlanoPatroxVigenciaImob.FieldByName('IDPATRO').AsInteger;
        _CdsVigencia.FieldByName('PERCENTRATEIO').AsFloat := cdsPlanoPatroxVigenciaImob.FieldByName('PERCENTRATEIO').AsFloat;

        _CdsVigencia.Post;

        if (CtrlImovel.VerificaBensxImovel(iImovel)) then
        begin
          _cdsLocal.Data := CtrlImovel.LookupImovelXBem(iImovel);
          while not _cdsLocal.Eof do
          begin
            _CdsPlanoPatroxVigenciaBem.Edit;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDBEM').AsInteger := _cdsLocal.FieldByName('IDBEM').AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('DATAVIGENCIA').AsDateTime := dDataVigencia;    //cdsHstPercSegregaImob.FieldByName('DATAVIGENCIA').AsDateTime;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPLANOPREV').AsInteger :=  cdsPlanoPatroxVigenciaImob.FieldByName('IDPLANOPREV').AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPATRO').AsInteger := cdsPlanoPatroxVigenciaImob.FieldByName('IDPATRO').AsInteger;
            _CdsPlanoPatroxVigenciaBem.FieldByName('PERCENTRATEIO').AsFloat:= cdsPlanoPatroxVigenciaImob.FieldByName('PERCENTRATEIO').AsFloat;
            _CdsPlanoPatroxVigenciaBem.FieldByName('IDPESSOA').AsInteger := _cdsLocal.FieldByName('IDPESSOA').AsInteger;

            _CdsPlanoPatroxVigenciaBem.Post;
            _CdsPlanoPatroxVigenciaBem.Next;
            _cdsLocal.Next;
          end;
        end;
        cdsPlanoPatroxVigenciaImob.Next;
        Inc(i);
      end
      else
      begin
        _CdsVigencia.Next;
        cdsPlanoPatroxVigenciaImob.Next;
        Inc(i);
      end;
    end;
  finally
    _cdsLocal.Free;
  end;
end;

//procedure TfrmCadImovelMT.PreencheArrayExclusao(sNomePlano, sNomePatro: string);
procedure TfrmCadImovelMT.PreencheArrayExclusao(sIdPlano: string; idImovel : Integer);
var
  i : integer;
begin
  i := 0;
  if CtrlImovel.VerificaPlano(sIdPlano, idImovel) then
  begin
    SetLength(aVigencia, Length(aVigencia) + 1);
    aVigencia[Length(aVigencia) -1].iStatus :=  3;  //Exclusão

    while i <= Length(aPlanos) -1 do
    begin
      if aPlanos[i].iPlanoPrev = StrToInt(sIdPlano) then
      begin
        aVigencia[Length(aVigencia) -1].iPlanoPrev := aPlanos[i].iPlanoPrev; //cdsPlanoPatroIDPLANOPREV.AsInteger;
        aVigencia[Length(aVigencia) -1].iPatro := aPlanos[i].iPatro;//cdsPlanoPatroIDPATRO.asInteger;
        aVigencia[Length(aVigencia) -1].dPercentual := aPlanos[i].dPercentual; //cdsPlanoPatroPPIPERCENTRATEIO.asFloat;
        dDataVigencia := cdsPlanoPatroDATAVIGENCIA.AsDateTime;
        Break;
      end;
      Inc(i);
    end;
  end;
end;

//procedure TfrmCadImovelMT.PreencheArrayAlteracao(iNumPosicao: Integer);
procedure TfrmCadImovelMT.PreencheArrayAlteracao(idImovel : integer);
var
  i : integer;
  bPlanoOriginal: boolean;
begin
  i := 0;
  bPlanoOriginal := False;
  cdsPlanoPatro.First;
  while not cdsPlanoPatro.Eof do
  begin
    if not CtrlImovel.VerificaPlano(cdsPlanoPatroIDPLANOPREV.AsString, idImovel) then
    begin
      SetLength(aVigencia, Length(aVigencia) + 1);
      aVigencia[Length(aVigencia)-1].iStatus := 1; //Inserção
      aVigencia[Length(aVigencia) -1].iPlanoPrev := cdsPlanoPatroIDPLANOPREV.AsInteger;
      aVigencia[Length(aVigencia) -1].iPatro := cdsPlanoPatroIDPATRO.asInteger;
      aVigencia[Length(aVigencia) -1].dPercentual := cdsPlanoPatroPPIPERCENTRATEIO.asFloat;
    end
    else
    begin
      while i <= Length(aVigencia) -1 do
      begin
         if cdsPlanoPatroIDPLANOPREV.asInteger = aVigencia[i].iPlanoPrev then
         begin
          aVigencia[i].iStatus := 2; // Alteração
          aVigencia[i].iPlanoPrev := cdsPlanoPatroIDPLANOPREV.AsInteger;
          aVigencia[i].iPatro := cdsPlanoPatroIDPATRO.asInteger;
          aVigencia[i].dPercentual := cdsPlanoPatroPPIPERCENTRATEIO.asFloat;
          bPlanoOriginal := True;
         end;
        Inc(i);
      end;
      if not bPlanoOriginal then
      begin
        SetLength(aVigencia, Length(aVigencia) + 1);
        aVigencia[Length(aVigencia) -1].iStatus := 2; // Alteração
        aVigencia[Length(aVigencia) -1].iPlanoPrev := cdsPlanoPatroIDPLANOPREV.AsInteger;
        aVigencia[Length(aVigencia) -1].iPatro := cdsPlanoPatroIDPATRO.asInteger;
        aVigencia[Length(aVigencia) -1].dPercentual := cdsPlanoPatroPPIPERCENTRATEIO.asFloat;
      end;
    end;
    cdsPlanoPatro.Next;
  end;
end;

procedure TfrmCadImovelMT.dblcPlanoPrevChange(Sender: TObject);
begin
  inherited;
  if (cmeDetalhe.Operacao in [opAlterar]) and (not sbtnInsDet.Down)then
  begin
    if (StrToInt(dblcPlanoPrev.LookupValue) <> cdsPlanoPatroIDPLANOPREV.AsInteger) then
      bAlterouPlano := True
    else
      bAlterouPlano := False;
  end
  else
  begin
    if (cmeDetalhe.Operacao in [opInserir]) and (not cdsPlanoPatro.IsEmpty) then
      bAlterouPlano := True
    else
      bAlterouPlano := False;
  end;

end;

procedure TfrmCadImovelMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  bAlterouPlano := False;
end;

procedure TfrmCadImovelMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  bAlterouPlano := False;
end;
procedure TfrmCadImovelMT.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  if CmeDetalhe.Operacao = opAlterar then
    bbtnConfirmar.Enabled := True;
end;
procedure TfrmCadImovelMT.AtualizaPlanoArray;
begin
  aPlanPrev := nil;
  cdsPlanoPatro.First;
  while not cdsPlanoPatro.Eof do
  begin
    SetLength(aPlanPrev, Length(aPlanPrev) + 1);
    aPlanPrev[Length(aPlanPrev)-1] := cdsPlanoPatroIDPLANOPREV.AsInteger;
    cdsPlanoPatro.Next;
  end;

end;

procedure TfrmCadImovelMT.dbgrdDetDblClick(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadImovelMT.AtualizaPlanoPatroxImovel(iIdImovel: integer);
var
  cdsAux : TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlImovel.BuscaVigenciaAnteriorImovel(iIdImovel);

    while not cdsAux.eof do
    begin
      cdsPlanoPatro.Insert;
      cdsPlanoPatro.FieldByName('IDIMOVEL').AsInteger := iIdImovel;
      cdsPlanoPatro.FieldByName('IDPLANOPREV').AsInteger := cdsAux.FieldByName('IDPLANOPREV').asInteger;
      cdsPlanoPatro.FieldByName('IDPATRO').AsInteger := cdsAux.FieldByName('IDPATRO').asInteger;
      cdsPlanoPatro.FieldByName('PPIPERCENTRATEIO').AsFloat := cdsAux.FieldByName('PERCENTRATEIO').asFloat;
      cdsPlanoPatro.FieldByName('FLGTIPO').AsString := 'P';
      cdsPlanoPatro.Post;
      cdsAux.Next;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

// Felipe de Oliveira SOL 132558 Kintana 766564 - INICIO
procedure TfrmCadImovelMT.dbedtDataArrematadaExit(Sender: TObject);
begin
  inherited;
  if Trim(dbedtDataArrematada.Text) <> '' then
     dbcbImoArrematado.Checked := True
  else
     dbcbImoArrematado.Checked := False;
end;

procedure TfrmCadImovelMT.FormActivate(Sender: TObject);
begin
  inherited;
  if Trim(dbedtDataArrematada.Text) = '' then
     dbcbImoArrematado.Checked := False;
end;

procedure TfrmCadImovelMT.dbcbImoArrematadoClick(Sender: TObject);
begin
  inherited;
  if not dbcbImoArrematado.Checked then
  begin
     dbedtDataArrematada.Clear;
     if Cds.State in [dsInsert, dsEdit] then
     begin
        CdsIMODATAARREMATADO.Text := '';
        CdsIMOARREMATADO.Value := 'N';
     end
  end;
end;
// Felipe de Oliveira SOL 132558 Kintana 766564 - FIM

// Felipe de Oliveira SOL65636 Kintana 523237 - Inicio
//Recebe o nome do imovel mestre e retorna o proximo imocodigo do imovel que vai ser criado,
//acessado somente na consulta de imovel mestre.
function TfrmCadImovelMT.CriaCodigoImovel(sImoMestre : String): String;
var
QryAux1, QryAux2 : Tquery;
sImocodigo, sImoCodigoNovo,sTipoChar,sCodigoSomar,sComecoCod  : String;
iTamanho, iCount, iCodigoSomado, iQtdeSerPega : Integer;
bAchouPonto1,bAchouPonto2 : Boolean;

begin
   Result := '';



   iCount := 0 ;
   iQtdeSerPega := 0;

   bAchouPonto1 := False;
   bAchouPonto2 := False;

   sImocodigo := '';
   sImoCodigoNovo:= '';
   sTipoChar := '';
   sCodigoSomar := '';

   QryAux1 := TQuery.Create(nil);
   QryAux1.DatabaseName := 'BASEDADOS';

   QryAux2 := TQuery.Create(nil);
   QryAux2.DatabaseName := 'BASEDADOS';
   
   QryAux2.Close;
   QryAux2.SQL.Clear;
   QryAux2.SQL.Add(' SELECT IMO.IDIMOVEL,IMO.IMOCODIGO  ');
   QryAux2.SQL.Add('    FROM IMOVEL IMO                    ');
   QryAux2.SQL.Add('	 WHERE IMONOME LIKE :PIMONOME ');
   QryAux2.ParamByName('PIMONOME').AsString := sImoMestre;
   QryAux2.Open;

   QryAux1.Close;
   QryAux1.SQL.Clear;
   QryAux1.SQL.Add('SELECT * FROM                          ');
   QryAux1.SQL.Add('(SELECT I.IDIMOVEL,I.IMOCODIGO         ');
   QryAux1.SQL.Add('FROM IMOVEL I                         ');
   QryAux1.SQL.Add('WHERE  I.IDIMOVELMESTRE = :IDIMOVEL  ');
   QryAux1.SQL.Add('  AND  I.IMOCODIGO IS NOT NULL         ');
   QryAux1.SQL.Add('ORDER BY I.IMOCODIGO DESC)             ');
   QryAux1.SQL.Add('WHERE ROWNUM = 1                       ');
   QryAux1.ParamByName('IDIMOVEL').AsString := QryAux2.FieldByName('IDIMOVEL').AsString;
   QryAux1.Open;



   //se a query retornar o imocodigo do mestre, ele armazena para manuseá-lo
   if not QryAux1.IsEmpty then
     sImocodigo := QryAux1.FieldByName('IMOCODIGO').AsString
   else
   begin
     sImoCodigoNovo := QryAux2.FieldByName('IMOCODIGO').AsString;
     Result := sImoCodigoNovo + '.1';
     Exit;
   end;



   iTamanho:= Length(sImocodigo);
   // só se adiciona imcodigo se o mesmo for diferente de nulo
   if iTamanho >0 then
   begin
     iCount:= 1;
     While iCount <= iTamanho  do
     begin
        // pega caracter por caracter do imocodigo até encontrar 1 ponto
        sTipoChar := copy(sImocodigo,iCount,1);

        // se acha 1 ponto e pega o próximo numero até achar ponto denovo ou chegar no fim da string
        if (sTipoChar = '.') and (not bAchouPonto1) then //if1
        begin
           bAchouPonto1 := True;
           sComecoCod := sCodigoSomar + sTipoChar;
           sCodigoSomar := '';
        end// end if 1
        else
        begin // se não achou ponto pega o começo da string até achar ponto
          if (not bAchouPonto1) then
             sCodigoSomar := sCodigoSomar + sTipoChar
          else
          begin  //se já achou ponto pega os numeros da string até achar ponto novamente ou chegar no fim dela,
                 //se achar ponto sai do loop
             if (sTipoChar = '.') and (bAchouPonto1) then
             begin
                Break;
             end
             else
               sCodigoSomar := sCodigoSomar + sTipoChar;
          end;
        end;

        iCount := iCount + 1;


     end;


    iCodigoSomado := StrToInt(sCodigoSomar) + 1;
    sImoCodigoNovo := sComecoCod + IntToStr(iCodigoSomado);


     Result := sImoCodigoNovo;
   end; // end if tamanho > 0

end;


// cria o próximo código do imovel mestre automaticamente
function TfrmCadImovelMT.CriaCodMestre : String;
var
QryAux : TQuery;
sImoCodigo,sTipoChar,sCodigoSomar,sImoCodigoNovo : String;
iTamanho,iCount,iCodigoSomado : integer;
begin
   Result := '';
   QryAux := TQuery.Create(nil);
   QryAux.DatabaseName := 'BASEDADOS';

   QryAux.Close;
   QryAux.SQL.Clear;
   //Peterson Victor SIG27969 Inicio
    QryAux.SQL.Add(' Select MAX(I.codigo) AS IMOCODIGO ');
    QryAux.SQL.Add(' From (Select Cast(Substr(IM.Imocodigo,1,Instr(Im.Imocodigo, ' + QuotedStr('.') + ' ) - 1) as Integer) As codigo ');
    QryAux.SQL.Add('       From imovel IM ');
    QryAux.SQL.Add('       Where IM.Imocodigo Not Like ' + QuotedStr('%.%') );
    QryAux.SQL.Add('             And IM.Idimovelmestre Is Null ');
    QryAux.SQL.Add(' Union ');
    QryAux.SQL.Add(' Select Cast(IM.Imocodigo As Integer) AS IMOCODIGO ');
    QryAux.SQL.Add(' From Imovel IM ');
    QryAux.SQL.Add(' Where IM.Imocodigo Not Like ' + QuotedStr('%.%') );
    QryAux.SQL.Add('       And IM.Idimovelmestre Is Null) I ');



   {
   QryAux.SQL.Add('SELECT * FROM                   ');
   QryAux.SQL.Add('(SELECT IM.IDIMOVEL,IM.IMOCODIGO');
   QryAux.SQL.Add('FROM IMOVEL IM                  ');
   QryAux.SQL.Add(' WHERE IM.IMOCODIGO IS NOT NULL ');
   QryAux.SQL.Add('AND IM.IDIMOVELMESTRE IS NULL   ');
   QryAux.SQL.Add('ORDER BY IM.IDIMOVEL DESC)      ');
   QryAux.SQL.Add(' WHERE ROWNUM =1                ');
   }
   //Peterson Victor SIG27969 Fim

   QryAux.Open;

   if not QryAux.IsEmpty then
   begin
      sImocodigo := QryAux.FieldByName('IMOCODIGO').AsString;
   end;

   iTamanho:= Length(sImocodigo);
   // só se adiciona imcodigo se o mesmo for diferente de nulo
   if iTamanho >0 then
   begin
     iCount:= 1;
     While iCount <= iTamanho  do
     begin
        // pega caracter por caracter do imocodigo até encontrar 1 ponto
        sTipoChar := copy(sImocodigo,iCount,1);

        // se acha 1 ponto e pega o próximo numero até achar ponto denovo ou chegar no fim da string
        if (sTipoChar = '.') then //if1
        begin
          Break;
        end// end if 1
        else
        begin
             sCodigoSomar := sCodigoSomar + sTipoChar
        end;

        iCount := iCount + 1;

     end;

   end;  


    iCodigoSomado := StrToInt(sCodigoSomar) + 1;
    sImoCodigoNovo := intToStr(iCodigoSomado);



    Result := sImoCodigoNovo;


end;

function TfrmCadImovelMT.VerificaExistencia(sImoCodigo : String; iIdImovel: Integer): Boolean;
var
QryAux : TQuery;
begin
   Result := False;
   QryAux := TQuery.Create(nil);
   QryAux.DatabaseName := 'BASEDADOS';

   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add('SELECT * FROM IMOVEL  ');
   QryAux.SQL.Add(' WHERE IMOCODIGO LIKE :PIMOCODIGO ');

   if iIdImovel > -1 then
   QryAux.SQL.Add('   AND IDIMOVEL <> ' + IntToStr(iIdImovel)); 

   QryAux.ParamByName('PIMOCODIGO').AsString := sImoCodigo;
   QryAux.Open;

   if not QryAux.IsEmpty then
     Result := True;

end;


function TfrmCadImovelMT.VerificaCodigo(sImocodigo : String) : Boolean;
var
iTamanho, iCount : Integer;
sTipoChar : Char;
begin
   Result := False;

   iTamanho := 0;
   iCount := 0;

   iTamanho:= Length(sImocodigo);

     iCount:= 1;
     While iTamanho > 0 do
     begin
        sTipoChar := copy(sImocodigo,iCount,1)[1];
        If not (sTipoChar in ['.','0'..'9']) then
        begin
           Result := True;
           Break;
        end;

        iCount := iCount + 1;

        iTamanho := iTamanho - 1;
     end;


end;

// Felipe de Oliveira SOL65636 Kintana 523237 - Fim

//Helio - SOL Nº 212226 KINTANA Nº 2037651
procedure TfrmCadImovelMT.wwDBspnVidaUtilChange(Sender: TObject);
begin
  if cdsHistoricoVidaUtil.State In [DsEdit, DsInsert] then
  begin
    if wwDBspnVidaUtil.Value > 0 then
    begin
      cdsHistoricoVidaUtil.FieldByName('TXDEP_ANO').AsFloat :=
        StrToFloat(
                    FormatFloat('0.00000',
                                CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorAno(wwDBspnVidaUtil.Value))
                  );

      cdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsFloat :=
        StrToFloat(
                    FormatFloat('0.00000',
                                CtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes(wwDBspnVidaUtil.Value))
                  );
    end
    else
    begin
      cdsHistoricoVidaUtil.FieldByName('TXDEP_ANO').AsFloat := 0;
      cdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsFloat := 0;
    end;
  end;
  inherited;

end;
//FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

procedure TfrmCadImovelMT.DBedtPercentualExit(Sender: TObject);
begin
  inherited;
  //Darivaldo Alencar SOL 207703.18299 -inicio
  if (StrToFloat(StringReplace(DBedtPercentual.Text, '.', '', [rfReplaceAll, rfIgnoreCase]))> 100) then
      begin
        MsgDlg('Valor do percentual não deve ser maior que 100%,'+#13+
                   'Verifique e corrija.','Aviso', mtWarning, [mbOK], 0);
        DBedtPercentual.setfocus;
      end;
  //Darivaldo Alencar SOL 207703.18299 -fim
end;

procedure TfrmCadImovelMT.btnImprimeVotoClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG26054}
  qryRelVoto.Close;
  qryRelVoto.ParamByName('IDVOTOGESTAOIMOVEL').AsInteger := CdsVoto.FieldByName('IDVOTOGESTAOIMOVEL').AsInteger;  //William Santana - SIG26054
  qryRelVoto.Open;
  fSaldo:= 0;
  //fSaldo := qryRelVoto.FieldByName('VLRAPROVADO').AsFloat;

  qryFundacao.open; //William Santana - SIG26054
  lblNmFornecedor.caption:= CdsVoto.fieldbyname('forn').asString;//Darivaldo Alencar SIG26054
  // Visualização do relatório
  TfrmPreview.CreateModalPreview(Application, rptVoto,'Voto');
 {Término - Michelle Mota - SIG26054}
end;

procedure TfrmCadImovelMT.DetailBand1BeforeGenerate(Sender: TObject);
begin
  inherited;
   //Darivaldo Alencar Sig 26054
  fSaldo:= cdsVoto.FieldByName('VLRAPROVADO').AsFloat - qryRelVoto.FieldByName('VALORACUMULADO').AsFloat;
  lblSaldo.caption:= FormatFloat('###,##0.00',fSaldo);
end;

procedure TfrmCadImovelMT.ppSummaryBand1BeforeGenerate(Sender: TObject);
begin
  inherited;
  //Darivaldo Alencar Sig 26054
  lblSaldoFinal.caption:= FormatFloat('###,##0.00',fSaldo);
end;

function TfrmCadImovelMT.VerificaPreenchimentoProvisao: Boolean;
var
  sMsgErro: string;
begin
  Result := False;
  try
    if (edtPercProvisao.Text = '') or (edtPercProvisao.Value = 0)  then
      raise EValidacao.CreateVal('Informe o percentual de provisão para este imóvel.', edtPercProvisao);

    if (edtPercProvisao.Value > 100)  then
      raise EValidacao.CreateVal('O valor do percentual de provisão ultrapassa o limite válido.', edtPercProvisao);

    if (dbEdtProvisaoInicio.Text = '') then
      raise EValidacao.CreateVal('Indique a data de início dessa provisão.', dbEdtProvisaoInicio);

    if cdsProvisaoImovel.State in [dsInsert] then
    begin
      if CtrlProvisaoImovel.ProvisaoExistente(CdsIDIMOVEL.asInteger, dbEdtProvisaoInicio.Date, sMsgErro) then
        raise EValidacao.CreateVal(sMsgErro, dbEdtProvisaoInicio);
    end;

    if CtrlProvisaoImovel.VerificaMovimentacaoProvisaoPeriodo(CdsIDIMOVEL.asInteger, dbEdtProvisaoInicio.Date) then
      raise EValidacao.createVal('Não é possível alterar uma vigência com lançamentos já realizados.', edtPercProvisao);




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
procedure TfrmCadImovelMT.CmeDetalheAfterConfirma(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePageIndex = 11 then
    bbtnVoltarDetClick(Self);
end;

end.

