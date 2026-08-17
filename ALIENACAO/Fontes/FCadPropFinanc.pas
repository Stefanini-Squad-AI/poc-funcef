{-------------------------------------------------------------------------------

	   Cadastro de Propostas e Consulta de Contratos de Alienação

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  01/09/2001
  Data de Término   :

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Solicitação.....: WO 18846
Data............: 11/02/2025
Responsável.....: Cássio Florencio Rovaroto
Descrição.......: Criação de Nova Forma de Cálculo JUROS MENSAL - Atualização mensal da
                  parcela, pelo valor da parcela anterior, sem alteração do saldo devedor.
------------------------------------------------------------------------------------------------
Solicitação.....: WO 7669
Data............: 09/05/2024
Responsável.....: Cássio Florencio Rovaroto
Descrição.......: Criação de Nova Forma de Cálculo.
------------------------------------------------------------------------------------------------
Rotina.............:
N. Sol.............: 136338
N. Kintana.........: 815089
Data...............: 25/10/2010
Responsável........: Brunno Mattos
Descrição..........: Alteração feita para identificar contratos VGV.
--------------------------------------------------------------------------------
Rotina.............:
N. Sol.............: 130139
N. Kintana.........: 719116
Data...............: 15/04/2010
Responsável........: Cássio Camargo
Descrição..........: Alteração feita para impedir que quando for chamada a aba
                     "Análise Inicial", não seja alterada a condição de pagamento
                     das parcelas visualizadas anteriormente.
--------------------------------------------------------------------------------
Rotina.............:
N. Sol.............: 114812
N. Kintana.........: 538136
Data...............: 19/06/2009
Responsável........: Ádler Teodoro de Souza
Descrição..........: Alteração na query e em tela para que na Aba Evento mostre
                     também o nome de quem alterou o respectivo evento.
--------------------------------------------------------------------------------
Rotina.............: sbtnProcurarImovelClick
N. Sol.............: 117674
N. Kintana.........: 559045
Data...............: 04/06/2009
Responsável........: Ricardo Alves
Descrição..........: Na consulta de imóveis atualizar o nome do comprador na tela.
--------------------------------------------------------------------------------
// SOL N° 114812 KINTANA N° 538136.
// Responsável: Ádler Teodoro de Souza
// Parâmetros : IdUsuario.
// Retorno    : Nome do Usuário.


Rotina.............: 1ª AcertaBotoes / 2ª bbtnConfirmarClick / 3ª sbtnAlterarClick
		     4ª MudaAba / 5ª dblcEstadoCloseUp / 6ª dblcPaisCloseUp
                     7ª tbcDetalheChange / 8ª SelMestreDet / 9ª sbtnProcurarClick
N. Sol.............: 100317
N. Kintana.........: 443687
Data...............: 04/11/2008
Responsável........: William Manoel dos Santos
Descrição..........: 1ª) Foi criado uma procedure para acertar os botões excluir e alterar
                     do detalhe, essa procedure é executada em dois momentos, no fim da rotina
                     bbtnCancelarDetClick e bbtnVoltarDetClick.

		     2ª) Foi colocado a chamada a procedure  MudaAba e tbcDetalheChange
                     para corrigir o erro de endereçamento errado de memória.

		     3ª) Foi colocado a chamada a procedure  MudaAba e tbcDetalheChange
                     para corrigir o erro de endereçamento errado de memória.

		     4ª) Inserimos uma condição que se a qry estiver com status de inseção
                     o botão Alterar e o Excluir ficam inativos.    

		    5ª) Foi inserido uma condição que após carregar o dblcEstado é apagado
                     o conteúdo de DBlcCidades.
                     Foi criado uma select que é executa em tempo de execução, para filtrar
                     as cidades referentes aquele estado.  

                    6ª)  Foi inserido uma condição que após carregar o dblcPais é apagado
                     o conteúdo do dblcEstado e DBlcCidades.

                    7ª) Tiramos o código dessa função e jogamos dentro de uma procedure
                     chamada MudaAba, para corrigir o erro de endereçamento errado de
                     memória.

                    8ª) Foi inserido dentro dessa rotina uma instrução para apagar o
                     conteúdo do frame molcomprador1, após terminar o cadastro.

                    9ª)Foi colocado a chamada a procedure  MudaAba e tbcDetalheChange
                     para corrigir o erro de endereçamento errado de memória.                  
--------------------------------------------------------------------------------
Rotina.............: CmeCadastroConfirma
N. Sol.............: 99729
N. Kintana.........: 439124
Data...............: 29/10/2008
Responsável........: William Manoel dos Santos
Descrição..........: Foi inserido uma condição para quando for um cadastro de proposta de
                     Alienação, exiba uma mensagem com o numero da proposta.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27463
Responsável  : Daniel Simões
Data         : 22/02/2008
Descrição    : Acerto no campo IDPESSOA na query (tava pegando da tabela PESSOA
               quando o certo seria pegar da CONTRATOIMOVEL)
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27172
Responsável  : Daniel Simões
Data         : 10/01/2008
Descrição    : Passa a gravar o IDPESSOA junto a Proposta...
--------------------------------------------------------------------------------
Pendência   : 25716
Responsável : Daniel Simões
Data        : 09/07/2007
Descrição   : Correção na busca de contratos encerrados por imóvel.
--------------------------------------------------------------------------------
Pendência   : 18795
Responsável : Daniel Simões
Data        : 31/01/2007
Descrição   : Implementação dos seguintes itens abaixo:

              1º Passa a gravar o comprador ( incluir frame de comprador ).

              2º Quando for tipo de condição "Caução", A parcela é gravada na
                 tabela 'PARCFINANCIMOV'.

              3º Só permite alterar o tipo Caução quando o campo CODDOCUMENTO da
                 tabela PARCFINANCIMOV não estiver preenchido, ou seja, quando
                 as parcelas não tiverem sido integradas.

              4º Quando muda o tipo Caução para outro tipo, a parcela é excluida
                 da tabela 'PARCFINANCIMOV'.

              5º Parâmetros de Caução igualados ao de Sinal
                 (Habilita/Desabilita Itens).

              6º Só é possível alterar e/ou excluir a Condição de Pagamento
                 (CONDPAGIMOVEL) e a proposta quando o campo CODDOCUMENTO da
                 tabela PARCFINANCIMOV não estiver preenchido, ou seja, quando
                 as parcelas não tiverem sido integradas.
--------------------------------------------------------------------------------
Responsável     :  Marcio Motta
Data de Início  :  26/12/2003
Data de Término :  02/01/2003
Descrição       :  Modificação no cadastro de Multas e Juros para aceitar
                   períodos de Vigência diferenciados - Mestre/Detalhe
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadPropFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, TREdit, Math, CMProcura, fPreview,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList,
  mImovel, wwdbedit, Wwdbspin, Wwdotdot, Wwdbcomb, ppDB, ppStrtch,
  ppRegion, ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppTypes, DBCtrls2, Menus,
  uCMTypes, ppModule, raCodMod, wwriched, Wwdbgrd2, Provider, DBClient,
  uCMClientDataSet, uCtrlEventoImovel, mImovelAtivo, mFiador, ppParameter,
  mComprador;

type
  TfrmCadPropFinanc = class(TfrmCadMestreDetalheCS)
    TabCond: TTabSheet;
    TabObs: TTabSheet;
    Panel1: TPanel;
    grdCondPag: TwwDBGrid;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    dsCondPag: TwwDataSource;
    updCondPag: TUpdateSQL;
    qryCondPag: TwwQuery;
    qryDetIDIMOVEL: TFloatField;
    qryDetIDCONTRATOIMOVEL: TFloatField;
    qryDetIMONOME: TStringField;
    lblNumProp: TLabel;
    edNumCont: TDBEdit;
    Label2: TLabel;
    edNomeCont: TDBEdit;
    edDataProp: TCMDateTimePicker;
    Label3: TLabel;
    edDataCarencia: TCMDateTimePicker;
    lblIndCorrec: TLabel;
    edValParc: TDBRealEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtJuros: TDBRealEdit;
    lblJuros: TLabel;
    edPercComiss: TDBRealEdit;
    Label15: TLabel;
    edValAvali: TDBRealEdit;
    Label19: TLabel;
    edValContab: TDBRealEdit;
    Label20: TLabel;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryCONNUMERO: TStringField;
    qryCONNOME: TStringField;
    qryCONDATAINICIO: TDateTimeField;
    qryFLGTIPOCONTRATO: TStringField;
    qryCONTAXAADMIN: TFloatField;
    qryCONVLRAJUSTADO: TFloatField;
    qryCONVLRTOTAL: TFloatField;
    qryCONDESCRICAO: TMemoField;
    qryVLRPROPOSTA: TFloatField;
    qryVLRPRESENTE: TFloatField;
    qryVLRCONTABIL: TFloatField;
    dblcIndCorrec: TCMDBLookupCombo;
    qryMoeda: TwwQuery;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagDATAINI: TDateTimeField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagNUMPARCELAS: TFloatField;
    lblNumParc: TLabel;
    edtNumParc: TDBRealEdit;
    tabAlug: TTabSheet;
    Label16: TLabel;
    edValTotAlug: TDBRealEdit;
    qryCONINDICEREAJUSTE: TFloatField;
    qryCONDATAREAJUSTE: TDateTimeField;
    qryDetMESTRE: TStringField;
    TabAnalIni: TTabSheet;
    Panel2: TPanel;
    lblAvalia: TLabel;
    lblAlug: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    edValTotProp: TRealEdit;
    edValPresAnal: TRealEdit;
    edValorAlug: TRealEdit;
    edValorAvali: TRealEdit;
    Label30: TLabel;
    lblPerc: TLabel;
    qryCondPagcal_PerParc: TStringField;
    qryCondPagcal_PerTaxa: TStringField;
    qryDetCIMVLRALUGUEL: TFloatField;
    Label9: TLabel;
    edValAluguel: TDBRealEdit;
    TabSimula: TTabSheet;
    Panel3: TPanel;
    dbgrdParc: TwwDBGrid;
    Label10: TLabel;
    Label13: TLabel;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    sbSimula: TSpeedButton;
    dsParc: TwwDataSource;
    Label22: TLabel;
    edtTotalPago: TRealEdit;
    sbConv: TSpeedButton;
    qryDetIMOAREA: TFloatField;
    qryReajuste: TwwQuery;
    gbReajuste: TGroupBox;
    Label5: TLabel;
    dblcIndCorAlug: TCMDBLookupCombo;
    Label6: TLabel;
    edDataReajAlug: TCMDateTimePicker;
    Label8: TLabel;
    DBspnPeriodicidadeReajuste: TwwDBSpinEdit;
    Label34: TLabel;
    Label7: TLabel;
    dblcReajuste: TCMDBLookupCombo;
    qryMoedaFLGPERCVALOR: TStringField;
    tabMulta: TTabSheet;
    qryReajusteQTDE: TFloatField;
    qryReajusteCONINDICEREAJUSTE: TFloatField;
    qryReajusteMOEDESC: TStringField;
    qryReajusteCONDATAREAJUSTE: TDateTimeField;
    qryReajusteCONPERREAJUSTE: TFloatField;
    qryReajusteCHAVE: TStringField;
    btnAnaliseAlug: TSpeedButton;
    sbMediaAluguel: TSpeedButton;
    qryDetIDMESTRE: TFloatField;
    qryPERALUGUELIDEAL: TFloatField;
    qryDetFLGORIGVLRALUG: TFloatField;
    qryDetCAL_ORIGEM: TStringField;
    qryPERCTXJURMERC: TFloatField;
    qryPERITXJURMERC: TStringField;
    sbImprime: TSpeedButton;
    lblIndProj: TLabel;
    dblcIndProj: TCMDBLookupCombo;
    qryCondPagIDINDCORRPROJ: TFloatField;
    pplParc: TppBDEPipeline;
    TabCobranca: TTabSheet;
    qryIDMSGBOLETO: TFloatField;
    qryCODPORTFORMA: TFloatField;
    Label26: TLabel;
    DBcboPortadorForma: TwwDBLookupCombo;
    Label53: TLabel;
    DBcboMsgBoleto: TwwDBLookupCombo;
    qryLookPortadorForma: TwwQuery;
    qryLookPortadorFormaCODPORTFORMA: TFloatField;
    qryLookPortadorFormaDESCRICAO: TStringField;
    qryLookMsgBoleto: TwwQuery;
    qryLookMsgBoletoMSGDESCRICAO: TStringField;
    qryLookMsgBoletoIDMSGBOLETO: TFloatField;
    qryRAZAOSOCIAL: TStringField;
    Label21: TLabel;
    DBedtResponsavel: TDBEdit2;
    btnBuscaResp: TBitBtn;
    lblComprador: TLabel;
    dbedtComprador: TDBEdit2;
    btnLimpaResp: TBitBtn;
    qryIDRESPONSAVEL: TFloatField;
    qryNOMRESPONSAVEL: TStringField;
    qryCondPagDSCINDCORR: TStringField;
    qryCondPagDSCINDPROJ: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryCONPERREAJUSTE: TFloatField;
    qryMoedaMOESIGLA: TStringField;
    qryFLGSTATUS: TStringField;
    Panel4: TPanel;
    Local: TGroupBox;
    Label27: TLabel;
    dblcPais: TwwDBLookupCombo;
    Label31: TLabel;
    dblcEstado: TwwDBLookupCombo;
    Label41: TLabel;
    dblcCidades: TwwDBLookupCombo;
    qryLookPais: TwwQuery;
    qryLookPaisNOMEPAIS: TStringField;
    qryLookPaisIDPAIS: TFloatField;
    qryLookEstado: TwwQuery;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoNOMEESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryLookEstadoIDESTADO: TFloatField;
    qryLookCidade: TwwQuery;
    qryLookCidadeNOME: TStringField;
    qryLookCidadeIDCIDADES: TFloatField;
    qryLookCidadeCODESTADO: TStringField;
    qryLookCidadeIDPAIS: TFloatField;
    qryLookCidadeCODMUNICIPIO: TStringField;
    qryLookCidadeIDESTADO: TFloatField;
    qryCODESTADO: TStringField;
    qryIDPAIS: TFloatField;
    qryIDCIDADES: TFloatField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryCondPagDATAFIM: TDateTimeField;
    qryCondPagTIPOCONDPAG: TStringField;
    qryCondPagIDCONDINICIAL: TFloatField;
    gbIntervalo: TGroupBox;
    dbspnPeriodo: TwwDBSpinEdit;
    dbcbPerParc: TwwDBComboBox;
    lblPeriod: TLabel;
    dbcbPerJur: TwwDBComboBox;
    dbrgTipoCond: TDBRadioGroup;
    qryCondPagcal_intervalo: TStringField;
    qryCondPagcal_Tipo: TStringField;
    qryDetVLRVENDA: TFloatField;
    qryDetVLRCONTABIL: TFloatField;
    Label42: TLabel;
    Label43: TLabel;
    edValContabil: TDBRealEdit;
    edValAliena: TDBRealEdit;
    qryBuscaProxNumero: TwwQuery;
    sbtnProcurarImovel: TToolbarButton97;
    MS_Imovel: TMontaSelect;
    qryBuscaProxNumeroULTNUMERO: TFloatField;
    Label44: TLabel;
    dbEdtAdmin: TDBEdit2;
    btnBuscaAdmin: TBitBtn;
    btnLimpaAdmin: TBitBtn;
    qryIDADMINIMOVEL: TFloatField;
    qryNOMADMINIMOVEL: TStringField;
    Label4: TLabel;
    edDataAni: TCMDateTimePicker;
    Label14: TLabel;
    DBRealEdit3: TDBRealEdit;
    Label24: TLabel;
    dbcbPeriodicidade: TwwDBComboBox;
    Label25: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    dbedtMesRefReajuste: TwwDBSpinEdit;
    qryCondPagMESREFREAJUSTE: TFloatField;
    GroupBox3: TGroupBox;
    dbcbFormaCalculo: TwwDBComboBox;
    lblTitulo: TLabel;
    qryCondPagcal_forma: TStringField;
    qryCondPagFORMACALCULO: TFloatField;
    lblPerProj: TLabel;
    edtPerProj: TDBRealEdit;
    lblPerProj2: TLabel;
    qryCondPagPERINDPROJ: TFloatField;
    wwDBComboBox1: TwwDBComboBox;
    Label48: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    qryCONDATAASSINATURA: TDateTimeField;
    Label49: TLabel;
    edDataIniParc: TCMDateTimePicker;
    qryCondPagDATACARENCIA: TDateTimeField;
    Label18: TLabel;
    edPercIdeal: TDBRealEdit;
    Label17: TLabel;
    Label50: TLabel;
    DBRealEdit4: TDBRealEdit;
    tbsEventos: TTabSheet;
    Panel5: TPanel;
    grdEvento: TwwDBGrid2;
    Panel10: TPanel;
    Label51: TLabel;
    Label52: TLabel;
    Label57: TLabel;
    DBedtDataEvento: TCMDateTimePicker;
    DBedtCabEvento: TDBEdit;
    CMDateTimePicker2: TCMDateTimePicker;
    Panel6: TPanel;
    gbEvento: TGroupBox;
    Panel7: TPanel;
    DBmemDescricao: TwwDBRichEdit;
    cdsEvento: TCMClientDataSet;
    cdsEventoIDEVENTOIMOVEL: TFloatField;
    cdsEventoIDIMOVEL: TFloatField;
    cdsEventoEVIDATA: TDateTimeField;
    cdsEventoEVICABECALHO: TStringField;
    cdsEventoEVIDESCRICAO: TMemoField;
    cdsEventoIDUSUARIO: TFloatField;
    cdsEventoIDCONTRATOIMOVEL: TFloatField;
    cdsEventoFLGTIPOEVENTO: TStringField;
    cdsEventoEVIDATAPROX: TDateTimeField;
    dsEvento: TwwDataSource;
    DBchkRateio: TDBCheckBox;
    Label55: TLabel;
    dbEdtPercentRateio: TDBRealEdit;
    Label56: TLabel;
    qryDetFLGRATEIO: TFloatField;
    qryDetCIMPERCENTRATEIO: TFloatField;
    dsMultaJuros: TwwDataSource;
    updMultaJuros: TUpdateSQL;
    qryMultaJuros: TwwQuery;
    pnlMultaJuros: TPanel;
    grpMora: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label45: TLabel;
    DBedtVlrMora: TDBRealEdit;
    DBedtPercentMora: TDBRealEdit;
    DBedtMoedaMora: TwwDBLookupCombo;
    dblcPeriodicidade: TwwDBComboBox;
    cbcbMoraProporc: TDBCheckBox;
    GroupBox1: TGroupBox;
    grpMulta: TGroupBox;
    Label1: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    DBedtPercentMulta: TDBRealEdit;
    DBedtVlrMulta: TDBRealEdit;
    DBcboMoedaMulta: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    DBspnDiaTolerancia: TwwDBSpinEdit;
    DBrdgTipoDiaTolera: TDBRadioGroup;
    grdMultaJuros: TwwDBGrid;
    Label54: TLabel;
    Label60: TLabel;
    DBspnDiaRepasse: TwwDBSpinEdit;
    DBrdgTipoDiaRepasse: TDBRadioGroup;
    Bevel1: TBevel;
    dblcbIndCM: TCMDBLookupCombo;
    dbSpinMesesAnteriores: TwwDBSpinEdit;
    Label58: TLabel;
    GroupBox2: TGroupBox;
    edDataIniVigencia: TCMDateTimePicker;
    Label61: TLabel;
    Label62: TLabel;
    edDataFimVigencia: TCMDateTimePicker;
    cbDataFimIndeterminada: TDBCheckBox;
    Label59: TLabel;
    Label63: TLabel;
    qryMultaJurosIDCONTRATOXMULTA: TFloatField;
    qryMultaJurosIDCONTRATOIMOVEL: TFloatField;
    qryMultaJurosIDINDCORRECAO: TFloatField;
    qryMultaJurosDSCINDCORR: TStringField;
    qryMultaJurosMOEDAJUROS: TFloatField;
    qryMultaJurosDSCMOEJUROS: TStringField;
    qryMultaJurosMOEDAMULTA: TFloatField;
    qryMultaJurosDSCMOEMULTA: TStringField;
    qryMultaJurosFLGINDETERMINADO: TStringField;
    qryMultaJurosVLRMULTA: TFloatField;
    qryMultaJurosPERCMULTA: TFloatField;
    qryMultaJurosVLRJUROS: TFloatField;
    qryMultaJurosPERCJUROS: TFloatField;
    qryMultaJurosPERIODOJUROS: TStringField;
    qryMultaJurosFLGJUROSPROPORC: TStringField;
    qryMultaJurosDATAINI: TDateTimeField;
    qryMultaJurosDATAFIM: TDateTimeField;
    qryMultaJurosMESREFCORRECAO: TFloatField;
    qryMultaJurosDIASTOLERANCIA: TFloatField;
    qryMultaJurosDIASREPASSE: TFloatField;
    qryMultaJurosFLGTIPODIATOLERA: TStringField;
    qryMultaJurosFLGTIPODIAREPASS: TStringField;
    qryMultaJurosDSCPERIODOJUROS: TStringField;
    qryMultaJurosDSCTIPODIATOLERA: TStringField;
    qryMultaJurosDSCTIPODIAREPASS: TStringField;
    molImovelAtivo1: TmolImovelAtivo;
    rptParc: TppReport;
    dbcbJurosCarencia: TDBCheckBox;
    lblJurCarencia: TLabel;
    qryCondPagFLGJURCARENCIA: TStringField;
    qryCondPagDATAINIAMORTIZ: TDateTimeField;
    Label64: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    DBmemContrato: TwwDBRichEdit;
    TabFianca: TTabSheet;
    tbsFiadores: TTabSheet;
    DBrdgTipoFianca: TDBRadioGroup;
    GroupBox5: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBedtTerminoFianca: TCMDateTimePicker;
    DBedtAvisoFianca: TCMDateTimePicker;
    DBedtDataIniFianca: TCMDateTimePicker;
    GroupBox6: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    DBedtNumBanco: TDBEdit;
    DBcboBanco: TwwDBLookupCombo;
    dbedtVlrFianca: TDBRealEdit;
    dbmemObsFianca: TwwDBRichEdit;
    Label71: TLabel;
    grdFiador: TwwDBGrid2;
    dsFiador: TwwDataSource;
    qryFiador: TwwQuery;
    updFiador: TUpdateSQL;
    qryFLGFIANCA: TStringField;
    qryCONDATAFIANCAINI: TDateTimeField;
    qryCONDATAFIANCAFIM: TDateTimeField;
    qryCONDATAFIANCAAV: TDateTimeField;
    qryCONBANCOFIANCA: TFloatField;
    qryCONVLRFIANCA: TFloatField;
    qryCONOBSFIANCA: TMemoField;
    qryFiadorIDCONTRATOIMOVEL: TFloatField;
    qryFiadorIDAVALISTA: TFloatField;
    qryFiadorNF_FIADOR: TStringField;
    qryFiadorRS_FIADOR: TStringField;
    dsBanco: TwwDataSource;
    qryBanco: TwwQuery;
    qryBancoNOME: TStringField;
    qryBancoRAZAOSOCIAL: TStringField;
    qryBancoNUMBANCO: TStringField;
    qryBancoIDPESSOA: TFloatField;
    Panel8: TPanel;
    molFiador1: TmolFiador;
    qryDetCODTIPIMOVEL: TStringField;
    qryCondPagPERIODOREAJUSTE: TFloatField;
    gbPeriodoReajuste: TGroupBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Label72: TLabel;
    ppParameterList1: TppParameterList;
    molComprador1: TmolComprador;
    qryIDLOCATARIO: TFloatField;
    qryLookPortadorFormaFLGATIVO: TStringField;
    HeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    lblProposta: TppLabel;
    ppRegion2: TppRegion;
    ppLabel19: TppLabel;
    lblAval: TppLabel;
    lblPres: TppLabel;
    lblVlrFinanc: TppLabel;
    lblParc: TppLabel;
    lblVlrTotal: TppLabel;
    ppLabel10: TppLabel;
    lblDtProposta: TppLabel;
    ppLabel11: TppLabel;
    lblFormaCalculo: TppLabel;
    ppLabel6: TppLabel;
    ppLabel3: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    DetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppVariable1: TppVariable;
    ppFooterBand1: TppFooterBand;
    Calc2: TppSystemVariable;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc1: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    qryIDPESSOA: TFloatField;
    cdsEventoNOME: TStringField;
    cbVGV: TCheckBox;
    qryFLGVGV: TFloatField;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure qryCondPagCalcFields(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbSimulaClick(Sender: TObject);
    procedure sbConvClick(Sender: TObject);
    procedure dblcReajusteCloseUp(Sender: TObject; LookupTable,
                                  FillTable: TDataSet; modified: Boolean);
    procedure tbcDetalheChange(Sender: TObject);
    procedure qryCondPagAfterScroll(DataSet: TDataSet);
    procedure edValAluguelChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);
    procedure btnAnaliseAlugClick(Sender: TObject);
    procedure sbMediaAluguelClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure qryDetBeforeInsert(DataSet: TDataSet);
    procedure btnCalcValPresenteClick(Sender: TObject);
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure rptParcBeforePrint(Sender: TObject);
    procedure sbImprimeClick(Sender: TObject);
    procedure btnBuscaRespClick(Sender: TObject);
    procedure btnLimpaRespClick(Sender: TObject);
    procedure dblcPaisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbrgTipoCondChange(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbtnProcurarImovelClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure btnBuscaAdminClick(Sender: TObject);
    procedure btnLimpaAdminClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure grdEventoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure cbDataFimIndeterminadaClick(Sender: TObject);
    procedure DBspnDiaRepasseChange(Sender: TObject);
    procedure DBspnDiaToleranciaChange(Sender: TObject);
    procedure dblcbIndCMChange(Sender: TObject);
    procedure edDataFimVigenciaChange(Sender: TObject);
    procedure molImovelAtivo1btnLimpaImovelClick(Sender: TObject);
    procedure molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
    procedure molComprador1btnBuscaFornClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private

    CtrlEventoImovel : TCtrlEventoImovel;

    { Private declarations }

    procedure SelMestreDet(n : Double);                      // Abre Tabelas do Form
    procedure CalcValAluguel;                                // Calcula o Valor de Aluguel
    procedure CalcAnalise;                                   // Calcula os valores para o TAB de Analise
    procedure CalcValPresente;                               // Calcula o Valor presente da proposta
    procedure CalcTotalProposta;                             // Calcula o Valor total da proposta
    procedure BuscaReajuste;                                 // Busca a forma de reajuste dos Imóveis Alugados
    function  CalcVlrContabilTotal : Double;                 // Totaliza o Valor Contábil da proposta
    function  BuscaAluguel(const iImovel:String) : Integer;  // Busca o Aluguel do Imóvel no AdminImob
    function  BuscaProxNumero : String;                      // Busca o Próximo número de proposta quando for numeração automática
    function  MediaMetroAluguel : Double;                    // Calcula o Aluguel pelo valor Médio pela metragem
    function  VendaVistaOk : Boolean;                        // Checa a Venda a Vista - Somente uma codição de pagamento
    function  VlrTotalOk(var fTotImovel, fTotCond : Double) : Boolean;  // Checa o valor total das condições de pagamento com o total da venda dos imóveis
    function  VerificaTipoImovel : Boolean;
    function  VerificaTerminoIndeterminado : Boolean;        // Verifica se já existe vigência com prazo indeterminado - Marcio Motta - 30/12/2003
    function  VerificaDatasVigencias : Boolean;              // Verifica se existem períodos de vigência em conflito de datas - Marcio Motta - 02/01/2004
    function  Retorna(const idusuario: integer) : String;    // Retorna na Grid o Nome do Usuário - Ádler Souza - 15/06/2009

    function  VerificaPreenchimentoFiador : Boolean;

    // Daniel - 18795
    function GeraParcelaCaucao   : Boolean;
    function ExcluiParcelaCaucao : Boolean;
    // Fim.

    // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
    procedure MudaAba;
    procedure AcertaBotoes;
    //Fim - N. Sol 100317  -  N. Kintana 443687
  public
    { Public declarations }
  end;

var
  frmCadPropFinanc: TfrmCadPropFinanc;
  iMestreProp : Int64;

implementation

{$R *.DFM}
Uses uDataBase, uSistema, uMensErro, dBaseDados, DFinanciamento, FTelaAut,
     fAnalProp, FPrincipal, Dms, UDiasInUteis, uCAF, UFuncAlienacao, uFuncoesImob,
     uModuloImobiliario, uComunsImobiliario, uVerificaPreenchimento,
     dImobiliario;


// -- Abre Tabelas do Formulário
//    Parâmetros:     n - Nr. da Proposta
Procedure TfrmCadPropFinanc.SelMestreDet(n : Double);
Begin
   // Abre ContratoImovel
   LimpaParametros(qry);
   qry.Params[0].AsFloat := n;
   qry.Open;
   // Abre ContratoxImovel
   LimpaParametros(qryDet);
   qryDet.ParamByName('pIDCONTRATOIMOVEL').AsFloat := n;
   qryDet.Open;
   // Abre CondPagImovel
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsFloat := n;
   qryCondPag.Open;


   // Abre query Banco
   LimpaParametros(qryBanco);
   qryBanco.Open;

   // Abre query Fiador
   LimpaParametros(qryFiador);
   qryFiador.Params[0].AsFloat := n;
   qryFiador.Open;



//---------- 30/12/2003 - Marcio Motta ---------------------------------------------

   // Abre ContratoXMulta
   LimpaParametros(qryMultaJuros);
   qryMultaJuros.Params[0].AsFloat := n;
   qryMultaJuros.Open;

//------- Fim Implementação/Alteração - Marcio Motta -------------------------------

   // Abre tabelas de Lookup
   qryMoeda.Open;
   qryLookPais.Open;
   qryLookCidade.Open;
   
   LimpaParametros(qryLookMsgBoleto);
   qryLookMsgBoleto.ParamByName('pIDMODULO').AsInteger := Sistema.IdModulo;
   qryLookMsgBoleto.Open;
   
   LimpaParametros(qryLookPortadorForma);
   qryLookPortadorForma.Params[0].asInteger := Sistema.idEmpresa;
   qryLookPortadorForma.Open;

   // Carrega Cds de Eventos
   cdsEvento.Data := CtrlEventoImovel.LookupEventoImovel(-1, -1, StrToInt(FloatToStr(n)), -1, -1);

   // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
   molComprador1.btnLimpaFornClick(Self);
   //Fim - N. Sol 100317  -  N. Kintana 443687
end;

procedure TfrmCadPropFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o Ctrl de Eventos
  CtrlEventoImovel := TCtrlEventoImovel.Create;
  CtrlEventoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                ComunsImobiliario.MensErroMT);
  CtrlEventoImovel.CdsEventoImovel := CdsEvento;
  CdsEvento.CreateDataSet;

  // Abre as tabelas sem nenhum registro
  SelMestreDet( -2 );

  // Somente para a CBS
  gbPeriodoReajuste.Visible := (Sistema.TipoCliente = 19981);
  CtrlEventoImovel.OpenTransaction := False;
end;

Procedure TfrmCadPropFinanc.CmeCadastroInsert(Sender: TObject);
Begin
   // Limpa Tela
   SelMestreDet( -2 );
   inherited;

   // Insere registro e valores Default da Proposta
   qryIDCONTRATOIMOVEL.AsFloat    := LeUltRegistro(nil,'CONTRATOIMOVEL');
   qryIDPESSOA.AsInteger          := Sistema.IdEmpresa; // Daniel - 27172
   qryCONDATAINICIO.AsDateTime    := Date;
   qryFLGTIPOCONTRATO.AsString    := 'P';
   qryFLGSTATUS.AsString          := 'V';
   edDataAni.Text                 := DateToStr(Date);
   qryDATAOPERACAO.AsDateTime     := Date;
   edDataProp.Text                := DateToStr(Date);
   lblNumProp.Caption             := 'Nº da Proposta';
   lblTitulo.Caption              := 'Proposta de Alienação';
   lblComprador.Enabled           := False;
   btnAnaliseAlug.Enabled         := False;
   sbSimula.Enabled               := False;
   sbConv.Enabled                 := True;
   sbMediaAluguel.Enabled         := True;
   tbcDetalhe.TabIndex            := 0;
   pgctrlDetalhe.ActivePage       := tbsDet;
   tb97BotoesDetalhe.Visible      := True;
   cbVGV.Enabled                  := True; //Brunno Mattos - SOL 136338 - KTN 815089


   if edNumCont.CanFocus then begin
      edNumCont.SetFocus;
   end else begin
      edNomeCont.SetFocus;
   end;
End;

Procedure TfrmCadPropFinanc.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   // Define o foco dependendo do parametro de geração automatica de numero de proposta
   if edNumCont.CanFocus then begin
      edNumCont.SetFocus;
   end else begin
      edNomeCont.SetFocus;
   end;
   //Brunno Mattos - SOL 136338 - KTN 815089   INICIO Trata quando deve ou não estar habilitado
   {cbVGV.Enabled := False;
   if qryFLGTIPOCONTRATO.AsString = 'P' then //Só pode alterar quando for uma PROPOSTA
        cbVGV.Enabled :=True;}
   //Brunno Mattos - SOL 136338 - KTN 815089   FIM

   // Desabilita a Analise Comparativa do Aluguel e Simulação de parcelas quando estiver
   // editando o registro, pois esta funções pegam dados do banco.
   btnAnaliseAlug.Enabled := False;
   sbSimula.Enabled       := False;

   // Habilita funções de calculo e gravação de Conversão de Valores e Média de Aluguel
   sbConv.Enabled         := True;
   sbMediaAluguel.Enabled := True;
End;

procedure TfrmCadPropFinanc.CmeCadastroDelete(Sender: TObject);
begin

// Daniel - 18795 - Início -----------------------------------------------------
  if (dtmFinanciamento.qryParcCODDOCUMENTO.IsNull) then begin

    // Apaga ContratoxImovel
    qryDet.First;
    while not qryDet.Eof do qryDet.Delete;

    // Apaga CondPagImovel
    qryCondPag.First;
    while not qryCondPag.Eof do qryCondPag.Delete;

    // Apaga ContratoxMulta
    qryMultaJuros.First;
    while not qryMultaJuros.Eof do qryMultaJuros.Delete;

    // Apaga Fiadores
    qryFiador.First;
    while not qryFiador.Eof do qryFiador.Delete;

    inherited;

  end else
    MsgDlg('Proposta já foi integrada. Não é possível excluir.','Informação',mtWarning,[mbOK],0);
// Daniel - 18795 - Fim --------------------------------------------------------

end;

Procedure TfrmCadPropFinanc.CmeCadastroFind(Sender: TObject);
Begin
   inherited;
   if MontaSelect.RetornouValor then begin
      SelMestreDet(StrToFloat(MontaSelect.ValoresChave[0]));

      // Daniel - 18795
      molComprador1.edtRazaoSocial.Text := qryRAZAOSOCIAL.AsString;
      molComprador1.iComprador          := qryIDLOCATARIO.AsInteger;
      // Fim.

      CalcAnalise;
      if qryFLGVGV.AsInteger = 1 then //Brunno Mattos - SOL 136338 - KTN 815089
         cbVGV.Checked := True
      else
         cbVGV.Checked := False;
      if qryFLGTIPOCONTRATO.AsString = 'P' then begin
         lblNumProp.Caption   := 'Nº da Proposta';
         lblTitulo.Caption    := 'Proposta de Alienação';
         lblComprador.Enabled := False;
         //cbVGV.Enabled := True; //Brunno Mattos - SOL 136338 - KTN 815089
      end else if qryFLGTIPOCONTRATO.AsString = 'A' then begin
         //cbVGV.Enabled := False; //Brunno Mattos - SOL 136338 - KTN 815089
         lblNumProp.Caption   := 'Nº do acordo';
         if qryFLGSTATUS.AsString = 'V' then
              lblTitulo.Caption    := 'Acordo Vigente'
         else lblTitulo.Caption    := 'Acordo Encerrado';
         lblComprador.Enabled := True;
      end else begin
         lblNumProp.Caption   := 'Nº do Contrato';
         //cbVGV.Enabled := False; //Brunno Mattos - SOL 136338 - KTN 815089
         if qryFLGSTATUS.AsString = 'V' then
              lblTitulo.Caption    := 'Contrato Vigente'
         else lblTitulo.Caption    := 'Contrato Encerrado';
         lblComprador.Enabled := True;
      end;
      tbcDetalheChange(Self);
   end;
End;

Procedure TfrmCadPropFinanc.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var fTotImovel, fTotCond: Double;
    sSqlA, sSqlB : string;
begin
   Accept := True;
   if (not moduloImobiliario.Alienacao.bNumeraProposta) and (Trim(edNumCont.Text) = '') then begin
      MsgDlg('Nº da Proposta não foi preenchido','Aviso',mtWarning,[mbOK],0);
      edNumCont.SetFocus;
      Accept := False;
      Exit;
   end;
   if Trim(edNomeCont.Text) = '' then begin
      MsgDlg('Nome da Proposta não foi preenchido','Aviso',mtWarning,[mbOK],0);
      edNomeCont.SetFocus;
      Accept := False;
      Exit;
   end;
   if Trim(edDataProp.Text) = '' then begin
      MsgDlg('Data da proposta não foi preenchida','Aviso',mtWarning,[mbOK],0);
      edDataProp.SetFocus;
      Accept := False;
      Exit;
   end;
   if qryDet.IsEmpty then begin
      MsgDlg('Não há imóveis cadastrados','Aviso',mtWarning,[mbOK],0);
      Accept := False;
      Exit;
   end;
   if qryCondPag.IsEmpty then begin
      MsgDlg('Não há condições de pagamento cadastradas','Aviso',mtWarning,[mbOK],0);
      Accept := False;
      Exit;
   end;

   if not VendaVistaOK then begin
      MsgDlg('A venda a vista só pode possuir uma Condição de Pagamento','Aviso',mtWarning,[mbOK],0);
      Accept := False;
      Exit;
   end;

   if not VerificaTipoImovel then begin
      MsgDlg('Os imóveis selecionados na proposta não são do mesmo tipo.','Aviso',mtWarning,[mbOK],0);
      Accept := False;
      Exit;
   end;

   if not VlrTotalOK(fTotImovel, fTotCond) then begin
      MsgDlg('Valor total das condições de Pagamento não equivale ao total informado nos imóveis','Aviso',mtWarning,[mbOK],0);
      Accept := False;
      Exit;
   end;

// Início ------- Data: 02/01/2004 ----- Marcio Motta ----- Pendência: ----------

   if not VerificaTerminoIndeterminado then begin
      MsgDlg('Existe mais de um período de vigência para Juros e Multa com término indeterminado','Aviso',mtWarning,[mbOK],0);
      pgCtrlDetalhe.ActivePage := tabMulta;
      tbcDetalhe.TabIndex := 3;
      Accept := False;
      Exit;
   end;

   if not VerificaDatasVigencias then begin
      MsgDlg('Existem períodos de vigência para Juros e Multa em conflito de datas','Aviso',mtWarning,[mbOK],0);
      pgCtrlDetalhe.ActivePage := tabMulta;
      tbcDetalhe.TabIndex := 3;
      Accept := False;
      Exit;
   end;

   if (qryMultaJuros.RecordCount <= 1) and (qryMultaJurosDATAINI.IsNull)  then begin
      MsgDlg('É necessário existir pelo menos uma condição de Juros e Multa cadastrada','Aviso',mtWarning,[mbOK],0);
      pgCtrlDetalhe.ActivePage := tabMulta;
      tbcDetalhe.TabIndex := 3;
      Accept := False;
      Exit;
   end;

   // Marchetti - Pendencia 25139
   if qryLookPortadorFormaFLGATIVO.AsString = 'N' then
   begin
      MsgDlg('A forma de cobrança selecionada está desativada','Aviso',mtWarning,[mbOK],0);
      pgCtrlDetalhe.ActivePage := TabCobranca;
      tbcDetalhe.TabIndex := 4;
      Accept := False;
      Exit;
   end;
   // Fim Marchetti - Pendencia 25139


// Fim ------------------------ Marcio Motta -----------------------------------
end;

procedure TfrmCadPropFinanc.CmeCadastroConfirma(Sender: TObject);
// Ini - William Manoel dos Santos - 29/10/2008 - N. Sol 99729  -  N. Kintana 439124
var
 bNovaProposta:  boolean;
 sNumProposta: string;
 //Cássio - SOL Nº 130139 KINTANA Nº 719116
 Pos: TBookmark;
// Fim - N. Sol 99729  -  N. Kintana 439124
begin
// Ini - William Manoel dos Santos - 29/10/2008 - N. Sol 99729  -  N. Kintana 439124
bNovaProposta := False;
// Fim - N. Sol 99729  -  N. Kintana 439124
// Daniel - 18795 - Início -----------------------------------------------------
  try
    StartTransacao;

    if (qry.State in dsEditModes) then begin
      // Calcula valores antes de gravar
      CalcValAluguel;

      //Cássio - SOL Nº 130139 KINTANA Nº 719116 - Início
      Pos := qryCondPag.GetBookMark;
      CalcValPresente;
      qryCondPag.GotoBookMark(Pos);
      //Cássio - SOL Nº 130139 KINTANA Nº 719116 - Fim
      CalcTotalProposta;
      qryVLRCONTABIL.AsFloat := CalcVlrContabilTotal();

      // Limpa os caracteres especiais de RichEdit
      if DBmemContrato.Text = '' then qryCONDESCRICAO.Clear;

      // Busca o próximo numero de proposta
      if (moduloImobiliario.Alienacao.bNumeraProposta) and (qry.State = dsInsert) then begin
         qryCONNUMERO.AsString := BuscaProxNumero;
// Ini - William Manoel dos Santos - 29/10/2008 - N. Sol 99729  -  N. Kintana 439124
         bNovaProposta := True;
         sNumProposta := qryCONNUMERO.AsString;
      end
      else
        bNovaProposta := False;
// Fim - N. Sol 99729  -  N. Kintana 439124

      if (molComprador1.iComprador>0) then
        qryIDLOCATARIO.AsInteger := molComprador1.iComprador;

      if (cbVGV.Checked) then    //Brunno Mattos - SOL 136338 - KTN 815089
        qryFLGVGV.ASInteger := 1
      else
        qryFLGVGV.AsString := '';

      qry.ApplyUpdates;
      qryDet.ApplyUpdates;
      qryCondPag.ApplyUpdates;
      qryMultaJuros.ApplyUpdates;
      qryFiador.ApplyUpdates;

      qry.CommitUpdates;
      qryDet.CommitUpdates;
      qryCondPag.CommitUpdates;
      qryMultaJuros.CommitUpdates;
      qryFiador.CommitUpdates;

      // Aplica Eventos
      CtrlEventoImovel.GravaEventoImovel;

      // Grava a parcela de caução...
      if not GeraParcelaCaucao then
        raise Exception.Create('Erro ao gerar parcela de caução.');

      {Exclui a parcela de caução na PARCFINANCIMOV se o tipo de pagamento mudar}
      if (qryFLGTIPOCONTRATO.AsString = 'P') and (qryCondPagTIPOCONDPAG.AsString<>'C') then begin
        if (dtmFinanciamento.qryParcCODDOCUMENTO.IsNull) then
          if not ExcluiParcelaCaucao then
            raise Exception.Create('Erro ao excluir parcela de caução.');
      end;

    end else begin
      // Aplica Exclui Eventos
      CtrlEventoImovel.GravaEventoImovel;

      qryMultaJuros.ApplyUpdates;
      qryDet.ApplyUpdates;
      qryCondPag.ApplyUpdates;
      qry.ApplyUpdates;

      qryMultaJuros.CommitUpdates;
      qryDet.CommitUpdates;
      qryCondPag.CommitUpdates;
      qry.CommitUpdates;
    end;

    CommitTransacao;
// Ini - William Manoel dos Santos - 29/10/2008 - N. Sol 99729  -  N. Kintana 439124
    if (moduloImobiliario.Alienacao.bNumeraProposta) and bNovaProposta then
    begin
      MsgDlg('Cadastro de Proposta de Alienação gerado com sucesso!' + #13 + 'Número '+ sNumProposta +' ','Confirmação de Geração de Proposta',mtInformation,[mbOK],0);
    end;
// Fim - N. Sol 99729  -  N. Kintana 439124
  except
    on E : Exception do begin
      RollBackTransacao;
      MsgDlg('Erro ao gravar os dados','Aviso',mtWarning,[mbOK],0);
    end;
  end;
// Daniel - 18795 - Fim --------------------------------------------------------

   // Habilita funções de Simulação de Parcela e Comparativo de Aluguel
   btnAnaliseAlug.Enabled := True;
   sbSimula.Enabled       := True;

   // Desabilita funções de calculo de Média de Aluguel e Conversão de Valores
   sbConv.Enabled         := False;
   sbMediaAluguel.Enabled := False;


   if edNumCont.CanFocus then begin
      edNumCont.SetFocus;
   end else begin
      edNomeCont.SetFocus;
   end;
   Inherited;

End;

Procedure TfrmCadPropFinanc.CmeDetalheInsert(Sender: TObject);
Begin
   if not qryCONDATAINICIO.IsNull then begin
      inherited;
      // Determina valores iniciais
      case pgctrlDetalhe.ActivePage.PageIndex of

         // Tab de Imóveis
         0 : begin
                molImovelAtivo1.btnLimpaImovelClick( Self );
                molImovelAtivo1.btnBuscaImovel.SetFocus;
                qryDetFLGRATEIO.AsInteger := 0;
             end;

         // Tab de Condição de Pagamento
         2 : begin
                qryCondPagIDCONDPAGIMOVEL.AsFloat := LeUltRegistro(nil,'CONDPAGIMOVEL');
                qryCondPagIDCONDINICIAL.AsFloat   := qryCondPagIDCONDPAGIMOVEL.AsFloat;
                qryCondPagPRAZO.AsString          := 'M';
                qryCondPagMESREFREAJUSTE.AsInteger:= 0;
                dbcbPerParc.ItemIndex             := 0;
                dbedtMesRefReajuste.Value         := 0;
                qryCondPagPERIODO.AsInteger       := 1;
                qryCondPagPERIODOTAXA.AsString    := 'M';
                qryCondPagFLGJURCARENCIA.AsString := 'N';
                qryCondPagPERINDPROJ.AsInteger    := 0;
                dbcbPerJur.ItemIndex              := 0;
                dbrgTipoCond.ItemIndex            := 3;
                dbcbJurosCarencia.Checked         := False;
                qryCondPagPERIODOREAJUSTE.AsInteger := 12;
                dbrgTipoCond.SetFocus;
             end;

         // Tab de Juros e Multa
         3 : begin
                qryMultaJurosIDCONTRATOXMULTA.AsFloat := LeUltRegistro(nil, 'CONTRATOXMULTA');
                qryMultaJurosIDCONTRATOIMOVEL.AsFloat := qryIDCONTRATOIMOVEL.AsFloat;

                if not cbDataFimIndeterminada.Checked then
                  qryMultaJurosFLGINDETERMINADO.AsString := 'N';

                if not cbcbMoraProporc.Checked then
                  qryMultaJurosFLGJUROSPROPORC.AsString  := 'N';
             end;

         // Tab Fiadores 
         10: begin
               molFiador1.btnLimpaFiadorClick( Self );
               molFiador1.btnBuscaFiador.SetFocus;
             end;


      end;
   end else begin
      MsgDlg('Preencha primeiro a data da Proposta','Aviso',mtWarning,[mbOK],0);
      bbtnVoltarDet.Click;
      edDataProp.SetFocus;
   end;
End;

procedure TfrmCadPropFinanc.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   case pgctrlDetalhe.ActivePage.PageIndex of
      // Tab de Imóveis
      0 : begin
             with molImovelAtivo1 do begin
                edtImovel.Text := qrydetMESTRE.AsString + ' - ' + qrydetIMONOME.AsString;
                iImovel        := qryDetIDIMOVEL.AsInteger;
                sImovel        := qryDetIMONOME.AsString;
                sMestre        := qryDetMESTRE.AsString;
                btnBuscaImovel.SetFocus;
             end;
          end;

      // Tab de Condição de Pagamento
      2 : begin

// Daniel - 18795 - Início -----------------------------------------------------
            if (pgctrlDetalhe.ActivePage=TabCond) then begin
              if (dbrgTipoCond.Value='C') then begin
                if not (dtmFinanciamento.qryParcCODDOCUMENTO.IsNull) then begin
                  MsgDlg('Proposta já foi integrada. Não é possível alterar.','Informação',mtWarning,[mbOK],0);
                  bbtnCancelarDetClick(Sender);
                end;
              end;
            end;
// Daniel - 18795 - Fim --------------------------------------------------------

            if (qryCondPagTIPOCONDPAG.AsString <> 'P') and (qryCondPagFORMACALCULO.IsNull) then
              qryCondPagFORMACALCULO.AsInteger := 9;

            edValParc.SetFocus;
          end;

      10: begin
             molFiador1.edtFiador.Text := qryFiadorNF_FIADOR.AsString;
             molFiador1.iFiador        := qryFiadorIDAVALISTA.AsInteger;
             molFiador1.sFiador        := qryFiadorNF_FIADOR.AsString;
             molFiador1.sFiador_RS     := qryFiadorRS_FIADOR.AsString;
             molFiador1.btnBuscaFiador.SetFocus;
          end;
   end;
end;

Procedure TfrmCadPropFinanc.CmeDetalheDelete(Sender: TObject);
var sMensagem : String;
Begin
// 26/12/2003 - Marcio - Incluída mensagem para PageIndex = 3
   case pgctrlDetalhe.ActivePage.PageIndex of
      0 : sMensagem := 'Confirma a exclusão do Imóvel';
      2 : sMensagem := 'Confirma a exclusão da Condição de Pagamento';
      3 : sMensagem := 'Confirma a exclusão do Período de Vigência para Juros e Multa';
      6 : sMensagem := 'Confirma a exclusão do Evento';
   end;
   if MsgDlg(sMensagem,'Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk then inherited;
End;

Procedure TfrmCadPropFinanc.CmeDetalheConfirma(Sender: TObject);
var iMeses : Integer;
Begin
  iMeses := 0;

  if (qryDet.State in dsEditModes) or (qryCondPag.State in dsEditModes) or
     (qryMultaJuros.State in dsEditModes) or (qryFiador.State in dsEditModes) then begin

     // Valida Tab de Imóveis
     if pgctrlDetalhe.ActivePage.PageIndex = 0 then begin
        if molImovelAtivo1.iImovel <= 0 then begin
           MsgDlg('Imovel não foi preenchido','Aviso',mtWarning,[mbOK],0);
           molImovelAtivo1.btnBuscaImovel.SetFocus;
           Abort;
        end;
        if (iMestreProp > 0) and (iMestreProp <> molImovelAtivo1.iMestre) and (qryDet.RecordCount > 1) then begin
           MsgDlg('Imovel não pertence ao mesmo Mestre já existente na proposta','Aviso',mtWarning,[mbOK],0);
           molImovelAtivo1.btnBuscaImovel.SetFocus;
           Abort;
        end;
        if edValAliena.Value = 0 then begin
           MsgDlg('Valor de Alienação não foi preenchido','Aviso',mtWarning,[mbOK],0);
           edValAliena.SetFocus;
           Exit;
        end;
        if edValContabil.Value = 0 then begin
           MsgDlg('Valor Contábil não foi preenchido','Aviso',mtWarning,[mbOK],0);
           edValContabil.SetFocus;
           Exit;
        end;

        if (DBchkRateio.Checked) and (qryDetCIMPERCENTRATEIO.AsInteger <= 0) then begin
           MsgDlg('Informe o Percentual de Rateio','Aviso',mtWarning,[mbOK],0);
           edValContabil.SetFocus;
           Exit;
        end;

        qryDetIDCONTRATOIMOVEL.AsFloat := qryIDCONTRATOIMOVEL.AsFloat;
        qryDetIDIMOVEL.AsFloat         := molImovelAtivo1.iImovel;
        qryDetIMONOME.asString         := molImovelAtivo1.sImovel;
        qryDetMESTRE.asString          := molImovelAtivo1.sMestre;
        if qryDetFLGRATEIO.AsInteger = 0 then qryDetCIMPERCENTRATEIO.Clear;
        Inherited;
     end;

     // Valida Tab de Condição de Pagamento
     if pgctrlDetalhe.ActivePage.PageIndex = 2 then begin
        if trim(edDataIniParc.text) = '' then begin
           MsgDlg('Data de inicio não foi preenchida','Aviso',mtWarning,[mbOK],0);
           edDataIniParc.SetFocus;
           Exit;
        end;
        if edValParc.Value <= 0 then begin
           MsgDlg('Valor Financiado não foi preenchido','Aviso',mtWarning,[mbOK],0);
           edValParc.SetFocus;
           Exit;
        end;
        if edDataIniParc.Date < edDataProp.Date then begin
           MsgDlg('Data de início de pagamento não pode ser inferior a data da proposta','Aviso',mtWarning,[mbOK],0);
           edDataIniParc.SetFocus;
           Exit;
        end;
        if qryCondPagNUMPARCELAS.AsInteger < 1 then begin
           MsgDlg('Nr. de Parcelas não foi preenchido','Aviso',mtWarning,[mbOK],0);
           edtNumParc.SetFocus;
           Exit;
        end;
        if qryCondPagPERIODO.AsInteger <= 0 then begin
           MsgDlg('Prazo não foi preenchido','Aviso',mtWarning,[mbOK],0);
           dbspnPeriodo.SetFocus;
           Exit;
        end;
        if (qryCondPagMESREFREAJUSTE.AsInteger < 0) or (qryCondPagMESREFREAJUSTE.AsInteger > 9) then begin
           MsgDlg('Mês de Referência de reajuste inválido','Aviso',mtWarning,[mbOK],0);
           dbspnPeriodo.SetFocus;
           Exit;
        end;

        if dbcbFormaCalculo.Text = '' then begin
           MsgDlg('Informe a forma utilizada para o calculo','Aviso',mtWarning,[mbOK],0);
           dbcbFormaCalculo.SetFocus;
           Exit;
        end;

        if qryCondPagFORMACALCULO.AsInteger in[5,7] then begin
           MsgDlg('A Forma de cálculo escolhida ainda não implementada','Aviso',mtWarning,[mbOK],0);
           dbcbFormaCalculo.SetFocus;
           Exit;
        end;

        if (qryCondPagFORMACALCULO.AsInteger in[6]) and (qryCondPagIDINDCORRPROJ.AsInteger > 0) and
           (qryCondPagPERINDPROJ.AsFloat > 0) then begin
           MsgDlg('A Correção projetada será calculada apenas sobre o fator informado.' +#13#10+
                  'Não é necessário selecionar os indices de correção e projeção','Aviso',mtWarning,[mbOK],0);
           dblcIndProj.SetFocus;
           Exit;
        end;

        if (qryCondPagFORMACALCULO.AsInteger in[10]) and
           ((qryCondPagIDINDCORRPROJ.AsInteger > 0) or (qryCondPagINDCORRECAO.AsInteger > 0)) then begin
           MsgDlg('A Correção será calculada apenas sobre o fator informado.','Aviso',mtWarning,[mbOK],0);
           dblcIndProj.SetFocus;
           Exit;
        end;


        if (qryCondPagIDINDCORRPROJ.AsInteger > 0) and (qryCondPagPERINDPROJ.AsFloat > 0) then begin
           MsgDlg('Escolha apenas o Indice ou o Percentual de projeção a ser utilizado','Aviso',mtWarning,[mbOK],0);
           dblcIndProj.SetFocus;
           Exit;
        end;

        qryCondPagDSCINDCORR.AsString      := dblcIndCorrec.Text;
        qryCondPagDSCINDPROJ.AsString      := dblcIndProj.Text;
        qryCondPagIDCONTRATOIMOVEL.AsFloat := qryIDCONTRATOIMOVEL.AsFloat;

        // Valores fixos para Condições do Tipo A Vista e Sinal
        if (dbrgTipoCond.ItemIndex in [0,1]) then begin
           qryCondPagNUMPARCELAS.AsInteger := 1;
           qryCondPagPERIODO.AsInteger     := 1;
           qryCondPagPRAZO.AsString        := 'M';
           qryCondPagINDCORRECAO.Clear;
           qryCondPagIDINDCORRPROJ.Clear;
           qryCondPagDSCINDCORR.Clear;
           qryCondPagDSCINDPROJ.Clear;
           qryCondPagMESREFREAJUSTE.AsInteger := 0;
           qryCondPagTAXAJUROS.AsInteger      := 0;
           qryCondPagPERINDPROJ.AsInteger     := 0;
           qryCondPagFORMACALCULO.AsInteger   := 9   // Valor fixo
        end;

        // exclui juros e correção para parcelas tipo 9 - FIXAS
        if qryCondPagFORMACALCULO.AsInteger = 9 then begin
           qryCondPagINDCORRECAO.Clear;
           qryCondPagIDINDCORRPROJ.Clear;
           qryCondPagDSCINDCORR.Clear;
           qryCondPagDSCINDPROJ.Clear;
           qryCondPagMESREFREAJUSTE.AsInteger := 0;
           qryCondPagTAXAJUROS.AsInteger      := 0;
           qryCondPagPERINDPROJ.AsInteger     := 0;
        end;

        // Parcela de juros no período de carência apenas para SAC - Juros sobre Saldo Devedor
        if qryCondPagFORMACALCULO.AsInteger <> 12 then begin
           qryCondPagFLGJURCARENCIA.AsString := 'N';
           qryCondPagDATAINIAMORTIZ.AsDateTime := qryCondPagDATAVENCIMENTO.AsDateTime;
        end else begin
           if qryCondPagDATAINIAMORTIZ.IsNull then
              qryCondPagDATAINIAMORTIZ.AsDateTime := qryCondPagDATAVENCIMENTO.AsDateTime;
        end;

        // define data de validade inicial e final da condição
        if qryCondPagNUMPARCELAS.AsInteger > 1 then begin
           if qryCondPagPRAZO.AsString = 'M' then begin
             iMeses := (qryCondPagNUMPARCELAS.AsInteger * qryCondPagPERIODO.AsInteger) - qryCondPagPERIODO.AsInteger;
           end else begin
             iMeses := ((qryCondPagNUMPARCELAS.AsInteger - 1) * (12 * qryCondPagPERIODO.AsInteger));
           end;
        end;
        qryCondPagDATAINI.AsDateTime := edDataProp.Date;
        qryCondPagDATAFIM.AsDateTime := DiasInUteis.SomaMeses(qryCondPagDATAVENCIMENTO.AsDateTime,iMeses);

        inherited;
     end;

//---------- 26/12/2003 - Marcio Motta ---------------------------------------------
     // Valida Tab de Período de Vigência de Juros e Multa
     if pgctrlDetalhe.ActivePage.PageIndex = 3 then begin

        if trim(edDataIniVigencia.text) = '' then begin
           MsgDlg('Data de inicio da vigência não foi preenchida','Aviso',mtWarning,[mbOK],0);
           edDataIniVigencia.SetFocus;
           Exit;
        end;
        if (trim(edDataFimVigencia.text) = '') and (not cbDataFimIndeterminada.Checked) then begin
           MsgDlg('Data de término da vigência não foi preenchida','Aviso',mtWarning,[mbOK],0);
           edDataFimVigencia.SetFocus;
           Exit;
        end;
        if (not cbDataFimIndeterminada.Checked) and (edDataFimVigencia.Date < edDataIniVigencia.Date) then begin
           MsgDlg('Data de término da vigência não pode ser inferior a data de início da vigência','Aviso',mtWarning,[mbOK],0);
           edDataFimVigencia.SetFocus;
           Exit;
        end;
        if (dblcbIndCM.Text <> '') and (dbSpinMesesAnteriores.Text = '') then begin
           MsgDlg('O período de utilização do índice de correção não foi definido','Aviso',mtWarning,[mbOK],0);
           dbSpinMesesAnteriores.SetFocus;
           Exit;
        end;
        if (DBspnDiaTolerancia.Text <> '') and (DBrdgTipoDiaTolera.ItemIndex = -1) then begin
           MsgDlg('O tipo de intervalo da tolerância não foi definido em dias úteis ou corridos','Aviso',mtWarning,[mbOK],0);
           DBrdgTipoDiaTolera.SetFocus;
           Exit;
        end;
        if (DBspnDiaRepasse.Text <> '') and (DBrdgTipoDiaRepasse.ItemIndex = -1) then begin
           MsgDlg('O tipo de intervalo do repasse não foi definido em dias úteis ou corridos','Aviso',mtWarning,[mbOK],0);
           DBrdgTipoDiaRepasse.SetFocus;
           Exit;
        end;
        if (DBedtVlrMulta.Value > 0) and (DBcboMoedaMulta.Text = '') then begin
           MsgDlg('O tipo de moeda do valor da multa não foi definido','Aviso',mtWarning,[mbOK],0);
           DBcboMoedaMulta.SetFocus;
           Exit;
        end;
        if (DBedtVlrMora.Value > 0) and (DBedtMoedaMora.Text = '') then begin
           MsgDlg('O tipo de moeda do valor dos juros de mora não foi definido','Aviso',mtWarning,[mbOK],0);
           DBedtMoedaMora.SetFocus;
           Exit;
        end;
        if (DBedtPercentMora.Value > 0) and (dblcPeriodicidade.Text = '') then begin
           MsgDlg('Informe a periodicidade do percentual de juros de mora por atraso','Aviso',mtWarning,[mbOK],0);
           dblcPeriodicidade.SetFocus;
           Exit;
        end;
        if (DBedtVlrMulta.Value > 0) and (DBedtPercentMulta.Value > 0 ) then begin
           MsgDlg('Para definição da multa, valor ou percentual devem estar definidos e não ambos','Aviso',mtWarning,[mbOK],0);
           DBedtVlrMulta.SetFocus;
           Exit;
        end;
        if (DBedtVlrMora.Value > 0 ) and (DBedtPercentMora.Value > 0) then begin
           MsgDlg('Para definição dos juros de mora, valor ou percentual devem estar definidos e não ambos','Aviso',mtWarning,[mbOK],0);
           DBedtVlrMora.SetFocus;
           Exit;
        end;
        if (DBedtVlrMulta.Value = 0 ) and (DBcboMoedaMulta.Text <> '') then begin
           MsgDlg('Se o tipo de moeda for definido para o valor da multa, ' + #13 +
                  'é necessário informar um valor diferente de zero para a Multa','Aviso',mtWarning,[mbOK],0);
           DBedtVlrMulta.SetFocus;
           Exit;
        end;
        if (DBedtVlrMora.Value = 0 ) and (DBedtMoedaMora.Text <> '') then begin
           MsgDlg('Se o tipo de moeda for definido para o valor dos Juros, ' + #13 +
                  'é necessário informar um valor diferente de zero para os Juros','Aviso',mtWarning,[mbOK],0);
           DBedtVlrMora.SetFocus;
           Exit;
        end;
        if (qryMultaJurosDATAINI.AsDateTime < qryCONDATAINICIO.AsDateTime) then begin
           MsgDlg('A data de início do período de vigência está inferior a data da Proposta','Aviso',mtWarning,[mbOK],0);
           edDataIniVigencia.SetFocus;
           Exit;
        end;

        // PREENCHE OS CAMPOS COM AS STRINGS PARA MELHOR VISUALIZAÇÃO PELO USUÁRIO
        qryMultaJurosDSCMOEMULTA.AsString := dbCboMoedaMulta.Text;
        qryMultaJurosDSCMOEJUROS.AsString := dbEdtMoedaMora.Text;
        qryMultaJurosDSCPERIODOJUROS.AsString := dbLcPeriodicidade.Text;
        qryMultaJurosDSCINDCORR.AsString := dbLcbIndCM.Text;
        case dbRdgTipoDiaTolera.ItemIndex of
           0 : qryMultaJurosDSCTIPODIATOLERA.AsString := 'Dias Corridos';
           1 : qryMultaJurosDSCTIPODIATOLERA.AsString := 'Dias Úteis';
        end;
        case dbRdgTipoDiaRepasse.ItemIndex of
           0 : qryMultaJurosDSCTIPODIAREPASS.AsString := 'Dias Corridos';
           1 : qryMultaJurosDSCTIPODIAREPASS.AsString := 'Dias Úteis';
        end;


//------- Fim Implementação/Alteração - Marcio Motta -------------------------------

        inherited;
     end;


     // Pendência 19993 -  Marcos Topini
     // Valida Fiadores
     if pgctrlDetalhe.ActivePage.PageIndex = 10 then begin
       if VerificaPreenchimentoFiador then begin
         qryFiadorIDAVALISTA.AsInteger := molFiador1.iFiador;
         qryFiadorIDCONTRATOIMOVEL.AsFloat := qryIDCONTRATOIMOVEL.AsFloat;
         qryFiadorNF_FIADOR.AsString   := molFiador1.sFiador;
         qryFiadorRS_FIADOR.AsString   := molFiador1.sFiador_RS;
         inherited;
       end;
     end;


  end else if cdsEvento.State in dsEditModes then begin

     // Valida Tab de Eventos
     if pgctrlDetalhe.ActivePage.PageIndex = 6 then begin

        if dbedtDataEvento.Text = '' then begin
           MsgDlg('Informe a data do evento','Aviso',mtWarning,[mbOK],0);
           dbedtDataEvento.SetFocus;
           Exit;
        end;
        if length(trim(DBedtCabEvento.Text)) = 0 then begin
           MsgDlg('Informe o cabeçalho do evento','Aviso',mtWarning,[mbOK],0);
           dbedtCabEvento.SetFocus;
           Exit;
        end;

        // Valores Fixos
        CdsEventoIDCONTRATOIMOVEL.AsFloat := qryIDCONTRATOIMOVEL.AsFloat;
        CdsEventoIDUSUARIO.AsInteger      := Sistema.IdUsuario;
        CdsEventoFLGTIPOEVENTO.AsString   := 'US';
        // Ádler Souza - Início - SOL N° 114812 KINTANA N° 538136
        cdsEventoNOME.AsString := Retorna(Sistema.IdUsuario);
        // Ádler Souza - Fim - SOL N° 114812 KINTANA N° 538136
        Inherited;
     end;
  end else begin
     inherited;
  end;
end;


// Calcula valor total de aluguel dos imóveis relacionados na proposta
Procedure TfrmCadPropFinanc.CalcValAluguel;
Var
  iIdImovel : Integer;
  iValor    : Double;
Begin
   iValor := 0;
   if qry.State in [dsEdit, dsInsert] then begin
      if not qryDet.IsEmpty then begin
         qryDet.DisableControls;
         iIdImovel := qryDetIDIMOVEL.asInteger;

         // Soma os alugueis de ContratoxImovel
         qryDet.First;
         while not qryDet.EOF do begin
            iValor := iValor + qryDetCIMVLRALUGUEL.AsFloat;
            qryDet.Next;
         end;
         qryDet.Locate('IDIMOVEL',iIdImovel,[]);
         qryDet.EnableControls;
         qryCONVLRTOTAL.AsFloat  := iValor;
         edValAluguel.Value      := qryCONVLRTOTAL.AsFloat;
      end;
   end;
end;


// Calcula o Valor presente da proposta com base na data do primeiro pagamento
// efetuado
Procedure TfrmCadPropFinanc.CalcValPresente;
Var
  rNumPeriodos   : Double;
  rValorFinanc   : Double;
  rValorPre      : Double;
  rValFuturo     : Double;
  rValPresente   : Double;
  rTxMercado     : Double;
  rTxFinanc      : Double;
  rTxAcum        : Double;
  rNumDias       : Double;
  i              : Integer;
  dPrimeiroPagto : TDateTime;
  fPrestacao     : Double;
  Aux            : Double;
Begin
      rValorPre  := 0;
      qryCondPag.DisableControls;

      // Converte a taxa do mercado finaceiro para mes
      rTxMercado := qryPERCTXJURMERC.AsFloat;
      if qryPERITXJURMERC.AsString = 'D' then begin
         rTxMercado := Power(((rTxMercado/100) + 1),30);
         rTxMercado := (rTxMercado - 1) * 100;
      end;
      if qryPERITXJURMERC.AsString = 'A' then begin
         rTxMercado := Power(((rTxMercado/100) + 1),(1/12));
         rTxMercado := (rTxMercado - 1) * 100;
      end;
      rTxMercado := 1 + (rTxMercado / 100);

      // verifica a data do primeiro pagamento para base do valor presente
      qryCondPag.First;

      dPrimeiroPagto := qryCondPagDATAVENCIMENTO.AsDateTime;

      while not qryCondPag.Eof do
      begin
        if qryCondPagDATAVENCIMENTO.AsDateTime < dPrimeiroPagto then
        begin
          dPrimeiroPagto := qryCondPagDATAVENCIMENTO.AsDateTime;
        end;
        qryCondPag.Next;
      end;

      // Calcula o Valor Presente para cada condição de pagamento
      qryCondPag.First;

      while not qryCondPag.EOF do
      begin
         rValorFinanc := (qryCondPagVLRFINANC.asFloat - (qryCondPagVLRFINANC.asFloat*(qryCONTAXAADMIN.AsFloat/100)));

         // Converte a taxa de juros da Alienação para mes
         rTxFinanc    := qryCondPagTAXAJUROS.AsFloat;

         if qryCondPagPERIODOTAXA.AsString = 'D' then
         begin
            rTxFinanc := Power(((rTxFinanc/100) + 1),30);
            rTxFinanc := (rTxFinanc - 1) * 100;
         end;

         if qryCondPagPERIODOTAXA.AsString = 'A' then
         begin
            rTxFinanc := Power(((rTxFinanc/100) + 1),(1/12));
            rTxFinanc := (rTxFinanc - 1) * 100;
         end;

         if qryCondPagPERIODOTAXA.AsString = 'C' then
         begin
            rTxFinanc := Power(((rTxFinanc/100) + 1),(1/12));
            rTxFinanc := (rTxFinanc - 1) * 100;
         end;
         rTxFinanc := rTxFinanc / 100;

         // Converte os periodos para meses
         rNumPeriodos := (qryCondPagNUMPARCELAS.AsInteger * qryCondPagPERIODO.AsInteger);

         if qryCondPagPRAZO.AsString = 'D' then
         begin
            rNumPeriodos := ((qryCondPagNUMPARCELAS.AsInteger * qryCondPagPERIODO.AsInteger)/30);
         end;

         if qryCondPagPRAZO.AsString = 'A' then
         begin
          rNumPeriodos := ((qryCondPagNUMPARCELAS.AsInteger * qryCondPagPERIODO.AsInteger)*12);
         end;

         // Calcula a Primeira Parcela
         if (qryCondPagTAXAJUROS.AsFloat <> 0) and (rNumPeriodos > 1) then
         begin
            Aux        := Power((1 + rTxFinanc), rNumPeriodos);
            fPrestacao := rValorFinanc * ((rTxFinanc * Aux)/(Aux -1));
         end
         else
         begin
            fPrestacao := rValorFinanc / rNumPeriodos;
         end;

         // Calcula a Taxa de Juros do Mercado parcela a parcela
         rNumDias     := (qryCondPagDATAVENCIMENTO.asDateTime - dPrimeiroPagto)/30;

         if rNumDias < 1 then begin
            rNumDias  := rNumDias + 1;
         end;
         rTxAcum      := Power(rTxMercado, rNumDias);
         rValPresente := 0;
         i            := 1;
         while i <= rNumPeriodos do begin
             if (i = 1) and (qryCondPagDATAVENCIMENTO.AsDateTime = dPrimeiroPagto) then
             begin
                rValPresente := fPrestacao;
             end
             else
             begin
                rValPresente := rValPresente + (fPrestacao / rTxAcum);
                rTxAcum      := rTxAcum * rTxMercado;
             end;
             Inc(i);
         end;

         rValorPre := rValorPre + rValPresente;
         qryCondPag.Next;
      end;
      qryCondPag.EnableControls;

      if qry.State in [dsEdit, dsInsert] then
      begin
         qryVLRPRESENTE.AsFloat := rValorPre;
         edValPresAnal.Value    := qryVLRPRESENTE.AsFloat;
      end;
end;


procedure TfrmCadPropFinanc.dbrgTipoCondChange(Sender: TObject);
begin
  inherited;

   // Desabilita a entrada de juros e correção para A vista, Sinal e Caução
   if dbrgTipoCond.ItemIndex in [0,1,2] then begin
      lblNumParc.Enabled    := False;
      edtNumParc.Enabled    := False;
      gbIntervalo.Enabled   := False;
      dblcIndCorrec.Enabled := False;
      lblIndCorrec.Enabled  := False;
      dblcIndProj.Enabled   := False;
      lblIndProj.Enabled    := False;
      lblJuros.Enabled      := False;
      lblPeriod.Enabled     := False;
      lblPerc.Enabled       := False;
      lblPerProj.Enabled    := False;
      lblPerProj2.Enabled   := False;
      edtJuros.Enabled      := False;
      edtPerProj.Enabled    := False;
      dbcbPerJur.Enabled    := False;
      dbspnPeriodo.Enabled  := False;
      dbcbPerParc.Enabled   := False;
      dbedtMesRefReajuste.Enabled := False;
      dbcbFormaCalculo.Enabled    := False;


      if qryCondPag.State in [dsInsert, dsEdit] then
      begin
         qryCondPagNUMPARCELAS.AsInteger    := 1;
         qryCondPagPERIODO.AsInteger        := 1;
         qryCondPagMESREFREAJUSTE.AsInteger := 0;
         qryCondPagTAXAJUROS.AsInteger      := 0;
         qryCondPagFORMACALCULO.AsInteger   := 9;
         qryCondPagINDCORRECAO.Clear;
         qryCondPagIDINDCORRPROJ.Clear;
      end;
   end
   else begin
      lblNumParc.Enabled    := True;
      edtNumParc.Enabled    := True;
      gbIntervalo.Enabled   := True;
      dblcIndCorrec.Enabled := True;
      lblIndCorrec.Enabled  := True;
      dblcIndProj.Enabled   := True;
      lblIndProj.Enabled    := True;
      lblJuros.Enabled      := True;
      lblPerc.Enabled       := True;
      lblPerProj.Enabled    := True;
      lblPerProj2.Enabled   := True;
      lblPeriod.Enabled     := True;
      edtJuros.Enabled      := True;
      edtPerProj.Enabled    := True;
      dbcbPerJur.Enabled    := True;
      dbspnPeriodo.Enabled  := True;
      dbcbPerParc.Enabled   := True;
      dbedtMesRefReajuste.Enabled := True;
      dbcbFormaCalculo.Enabled    := True;
      if qryCondPag.State in [dsInsert, dsEdit] then
      begin
         qryCondPagNUMPARCELAS.AsInteger    := 0;
         qryCondPagPERIODO.AsInteger        := 1;
         qryCondPagMESREFREAJUSTE.AsInteger := 0;
      end;
   end;
end;


procedure TfrmCadPropFinanc.qryCondPagCalcFields(DataSet: TDataSet);
begin
   inherited;

   qryCondPagcal_forma.AsString := FuncAlienacao.TipoCalculo(qryCondPagFORMACALCULO.AsInteger);

   if qryCondPagPRAZO.AsString = 'M' then
   begin
      if qryCondPagPERIODO.AsInteger = 1 then
           qryCondPagcal_PerParc.AsString := 'Mês'
      else qryCondPagcal_PerParc.AsString := 'Meses';
   end
   else
   begin
      if qryCondPagPERIODO.AsInteger = 1 then
           qryCondPagcal_PerParc.AsString := 'Ano'
      else qryCondPagcal_PerParc.AsString := 'Anos';
   end;

   if qryCondPagPERIODOTAXA.AsString = 'M' then
        qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.0000000000', qryCondPagTAXAJUROS.AsFloat) +  '% Mês';
   if qryCondPagPERIODOTAXA.AsString = 'A' then
        qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.0000000000', qryCondPagTAXAJUROS.AsFloat) +  '% Ano Simp';
   if qryCondPagPERIODOTAXA.AsString = 'C' then
        qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.0000000000', qryCondPagTAXAJUROS.AsFloat) +  '% Ano Comp';

   if qryCondPagPERIODO.AsFloat = 1 then begin
      if qryCondPagPRAZO.AsString = 'M' then
           qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Mês'
      else qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Ano';
   end else begin
      if qryCondPagPRAZO.AsString = 'M' then
           qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Meses'
      else qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Anos';
   end;

   if qryCondPagTIPOCONDPAG.AsString = 'S' then qryCondPagcal_Tipo.AsString := 'Sinal';
   if qryCondPagTIPOCONDPAG.AsString = 'V' then qryCondPagcal_Tipo.AsString := 'A Vista';
   if qryCondPagTIPOCONDPAG.AsString = 'C' then qryCondPagcal_Tipo.AsString := 'Caução';
   if qryCondPagTIPOCONDPAG.AsString = 'P' then qryCondPagcal_Tipo.AsString := 'Parc.';
   if qryCondPagTIPOCONDPAG.AsString = 'R' then qryCondPagcal_Tipo.AsString := 'Repac.';   
end;

procedure TfrmCadPropFinanc.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   
   // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
   tbcDetalheChange(sender);
   Self.MudaAba;
   //Fim - N. Sol 100317  -  N. Kintana 443687

   // Desabilita a alteração do contrato nos tabs Imovel e Cond. de Pagamento
   if (qryFLGTIPOCONTRATO.AsString[1] in ['C','A']) and (pgctrlDetalhe.ActivePageIndex in [0,2]) then begin
      tb97BotoesDetalhe.enabled := False;
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end else begin
      if qry.State in [dsEdit, dsInsert] then begin
         tb97BotoesDetalhe.enabled := True;
         sbtnInsDet.Enabled        := True;
         sbtnAltDet.Enabled        := True;
         sbtnExcluiDet.Enabled     := True;
      end;
   end;


end;


// -- Busca no AdminImob o valor do aluguel corrente do imóvel
//    Parâmetros:  iImovel - ID do imóvel
//    Retorno:     Valor do Aluguel do Imóvel
function TfrmCadPropFinanc.BuscaAluguel(const iImovel:String): Integer;
var sSql : String;
Begin
   Result := 0;
   sSql   := ' SELECT CI.CIMVLRAJUSTADO '+
             ' FROM CONTRATOIMOVEL C,  '+
             '      CONTRATOXIMOVEL CI '+
             ' WHERE  (C.FLGTIPOCONTRATO = ''L'') '+
             '    AND (CI.IDIMOVEL = '+ iImovel +')'+
             '    AND (C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) ';
   if FazQuery(DtmBaseDados.qry,sSql) Then
      Result := DtmBaseDados.qry.FieldByName('CIMVLRAJUSTADO').AsInteger;
end;


// Calcula as parcelas da proposta "sem gravar"
procedure TfrmCadPropFinanc.sbSimulaClick(Sender: TObject);
begin
   inherited;
   if qryCondPagIDCONDPAGIMOVEL.AsFloat > 0 then begin
      edtTotalPago.Value := 0;

      with dtmFinanciamento do begin
         LimpaParametros(qryParc);
         qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat := frmCadPropFinanc.qryCondPagIDCONDPAGIMOVEL.AsFloat;
         qryParc.Open;
         edtTotalPago.Value := FuncAlienacao.GeraParcela(frmCadPropFinanc.qryCondPagIDCONDPAGIMOVEL.AsFloat,
                                                         frmCadPropFinanc.qryCondPagDATAVENCIMENTO.AsDateTime,
                                                         Date(),
                                                         DtmFinanciamento.qryParc);
      end;
   end;
end;


// Converte o valor financiado com juros e correção para um novo valor fixo
procedure TfrmCadPropFinanc.sbConvClick(Sender: TObject);
var rTaxaJuros    : Double;  // Taxa de juros utilizada ajustada para meses
    rFator        : Double;  // Fator de correção da parcela na data do primeiro vencimento
    Aux           : Double;  // Auxiliar para o calculo da prestação
    rValPrestacao : Double;  // Valor da prestação com juros e correção antes da conversão
    fTotImovel    : Double;  // Valor total de venda relacionado nos imoveis antes da conversão
    fTotCond      : Double;  // Valor total da proposta antes da conversão
    fValDif       : Double;  // Diferença entre o valor original e o convertido

begin
   inherited;
   if qry.State in [dsEdit, dsInsert] then begin
      if MsgDlg('A conversão das parcelas irá sobrepor a condição de pagamento existente. Confirma ?','Confirma',mtInformation,[mbYes,mbNo],0) = mrYes then begin
         DtmFinanciamento.qryParc.DisableControls;

         // Verifica o total das condíções com o total dos imóveis para poder
         // ratear o novo valor após a conversão
         if not VlrTotalOK(fTotImovel, fTotCond) then begin
            MsgDlg('Valor total das condições de Pagamento não equivale ao total informado nos imóveis.' + #13#10 +
                   'Ajuste primeiro os valores para poder efetuar a conversão.','Aviso',mtWarning,[mbOK],0);
            DtmFinanciamento.qryParc.EnableControls;
            Exit;
         end;

         // Ajusta a taxa de juros conforme o período
         if qryCondPagPERIODOTAXA.AsString = 'M' then begin
            rTaxaJuros := Power(1 + (qryCondPagTAXAJUROS.AsFloat/100), qryCondPagPERIODO.AsInteger);
            rTaxaJuros := rTaxaJuros - 1;
         end;
         if qryCondPagPERIODOTAXA.AsString = 'A' then begin
            rTaxaJuros := (qryCondPagTAXAJUROS.AsFloat/100);
         end;
         if qryCondPagPERIODOTAXA.AsString = 'C' then begin
            rTaxaJuros := (qryCondPagTAXAJUROS.AsFloat/100);
         end;

         // Adiciona o indice de correção na taxa de juros
         rFator := 1;
         rFator := dtmFinanciamento.CalculaFatorCorrecao(qryCondPagINDCORRECAO.AsInteger,
                                                         qryCondPagDATAVENCIMENTO.AsDateTime,
                                                         qryCondPagDATAVENCIMENTO.AsDateTime, False);
         rTaxaJuros := rTaxaJuros + (rFator - 1);

         // Calcula Valor da Prestação primeira prestação
         if (qryCondPagTAXAJUROS.AsFloat <> 0) then begin
            Aux           := Power((1 + rTaxaJuros),qryCondPagNUMPARCELAS.AsInteger);
            rValPrestacao := qryCondPagVLRFINANC.AsFloat *((rTaxaJuros * Aux)/(Aux -1));
         end else begin
            rValPrestacao := qryCondPagVLRFINANC.AsFloat / qryCondPagNUMPARCELAS.AsInteger;
         end;

         // apura a diferença entre o valor financiado novo e o anterior
         fValDif := (rValPrestacao * qryCondPagNUMPARCELAS.AsInteger) - qryCondPagVLRFINANC.AsFloat;

         // grava novo valor calculado
         qryCondPag.Edit;
         qryCondPagVLRFINANC.AsFloat := rValPrestacao * qryCondPagNUMPARCELAS.AsInteger;
         qryCondPagTAXAJUROS.AsFloat := 0;
         qryCondPagDSCINDCORR.Clear;
         qryCondPagDSCINDPROJ.Clear;
         qryCondPagINDCORRECAO.Clear;
         qryCondPagIDINDCORRPROJ.Clear;
         qryCondPag.Post;

         // Ajusta o valor de venda de cada imóvel distribuindo a diferenca apurada
         // proporcionalmente entre os imóveis
         with qryDet do begin
            First;
            while not eof do begin
               Edit;
               qryDetVLRVENDA.AsFloat := qryDetVLRVENDA.AsFloat + (fValDif * qryDetVLRVENDA.AsFloat / fTotImovel);
               Post;
               next;
            end;
         end;

         // Exibe a TAB de condições de pagamento
         DtmFinanciamento.qryParc.EnableControls;
         tbcDetalhe.TabIndex       := 2;
         pgCtrlDetalhe.ActivePage  := TabCond;
         tb97BotoesDetalhe.Visible := true;
      end;
   end;
end;



// -- Calcula o valor médio de aluguel com base na metragem do imóvel
//    Retorno:  Valor do Aluguel Médio
function TfrmCadPropFinanc.MediaMetroAluguel: Double;
var iMedia : Double;
    iIdImovel,iCont : Integer;
Begin
    Result  := 0;
    iMedia  := 0;
    iCont   := 0;
    qryDet.DisableControls;
    iIdImovel := qryDetIDIMOVEL.asInteger;
    qryDet.First;
    while not qryDet.EOF do begin
       if (qryDetCIMVLRALUGUEL.AsFloat > 0) and (qryDetFLGORIGVLRALUG.AsInteger = 1)  then begin
          iMedia := iMedia + (qryDetCIMVLRALUGUEL.AsFloat / qryDetIMOAREA.AsFloat);
          Inc(iCont);
       end;
       qryDet.Next;
    end;
    qryDet.Locate('IDIMOVEL',iIdImovel,[]);
    qryDet.EnableControls;

    if iCont > 0 then begin
       Result := iMedia / iCont;
    end else begin
       Result := 0;
    end;
end;


// Procura no AdminImob, entre os imóveis alugados, as formas de reajuste do
// aluguel existente para sugerir na proposta. Utilizado posteriormente para
// a simulação dos valores do aluguel.
procedure TfrmCadPropFinanc.BuscaReajuste;
var sCond : String;
    iIdImovel : Integer;
begin
   inherited;

   // Define Clausula IN do Select
   sCond := '';
   if not qryDet.IsEmpty then begin
      qryDet.DisableControls;
      sCond  := 'AND CI.IDIMOVEL IN(';
      iIdImovel := qryDetIDIMOVEL.asInteger;
      qryDet.First;
      while not qryDet.EOF do
      begin
         sCond := sCond + FormatFloat('#0',qryDetIDIMOVEL.asFloat)+',';
         qryDet.Next;
      end;
      sCond := Copy(sCond,1,Length(sCond)-1) + ')';
      qryDet.Locate('IDIMOVEL',iIdImovel,[]);
      qryDet.EnableControls;
   end else begin
      sCond := 'AND 1=2 ';
   end;

   // Monta o Select
   qryReajuste.Close;
   with qryReajuste.sql do begin
      clear;
      Add('SELECT');
      Add('       TO_CHAR(C.CONINDICEREAJUSTE) || TO_CHAR(C.CONDATAREAJUSTE) || TO_CHAR(C.CONPERREAJUSTE) AS CHAVE,');
      Add('       COUNT(*) AS QTDE, ');
      Add('       C.CONINDICEREAJUSTE, ');
      Add('       M.MOEDESC, ');
      Add('       C.CONDATAREAJUSTE, ');
      Add('       C.CONPERREAJUSTE ');
      Add('FROM   CONTRATOIMOVEL C, ');
      Add('       CONTRATOXIMOVEL CI, ');
      Add('       IMOVEL I, ');
      Add('       MOEDA M ');
      Add('WHERE  (C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) ');
      Add('      AND  (C.CONINDICEREAJUSTE = M.MOECODIGO) ');
      Add('      AND  (CI.IDIMOVEL = I.IDIMOVEL) ');
      Add('      AND  (C.FLGTIPOCONTRATO = ''L'') ');
      Add('      AND  (CI.CIMVLRAJUSTADO > 0) ');
      Add(sCond);
      Add('GROUP BY');
      Add('      TO_CHAR(C.CONINDICEREAJUSTE) || TO_CHAR(C.CONDATAREAJUSTE) || TO_CHAR(C.CONPERREAJUSTE),');
      Add('      C.CONINDICEREAJUSTE, M.MOEDESC, C.CONDATAREAJUSTE, C.CONPERREAJUSTE ');
   end;
   qryReajuste.Open;
end;

procedure TfrmCadPropFinanc.dblcReajusteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // Copia os valores sugeridos para os campos da tabela
   if qry.State in [dsInsert, dsEdit] then begin
      qryCONINDICEREAJUSTE.AsInteger := qryReajusteCONINDICEREAJUSTE.AsInteger;
      qryCONDATAREAJUSTE.AsDateTime  := qryReajusteCONDATAREAJUSTE.AsDateTime;
      qryCONPERREAJUSTE.AsInteger    := qryReajusteCONPERREAJUSTE.AsInteger;
      dblcIndCorAlug.LookupValue     := qryReajusteCONINDICEREAJUSTE.AsString;
   end;
end;

procedure TfrmCadPropFinanc.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   // Desabilita a alteração do contrato nos tabs Imovel e Cond. de Pagamento

   // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
   Self.MudaAba;
   // Fim - N. Sol 100317  -  N. Kintana 443687
end;

procedure TfrmCadPropFinanc.qryCondPagAfterScroll(DataSet: TDataSet);
begin
   inherited;
   dtmFinanciamento.qryParc.Close;
   edtTotalPago.Value := 0;
   LimpaParametros(dtmFinanciamento.qryParc);
   dtmFinanciamento.qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat := qryCondPagIDCONDPAGIMOVEL.AsFloat;
   dtmFinanciamento.qryParc.Open;
end;

procedure TfrmCadPropFinanc.edValAluguelChange(Sender: TObject);
begin
   inherited;
   if edValAluguel.Modified then
      qryDetFLGORIGVLRALUG.AsInteger := 3;
end;

procedure TfrmCadPropFinanc.FormShow(Sender: TObject);
begin
   inherited;
   gFrmCadPropAtivo       := True;
   btnAnaliseAlug.Enabled := True;
   sbSimula.Enabled       := True;
   sbConv.Enabled         := False;
   sbMediaAluguel.Enabled := False;
   if not ModuloImobiliario.Alienacao.bNumeraProposta then begin
      edNumCont.Enabled := True;
      edNumCont.Color   := clWindow;
   end else begin
      edNumCont.Enabled := False;
      edNumCont.Color   := $00C0FFFF;
   end;
   if ModuloImobiliario.Alienacao.bFlgIntegraAtivo then
        edValContabil.Enabled := False
   else edValContabil.Enabled := True;
end;

procedure TfrmCadPropFinanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  gFrmCadPropAtivo := False;
  FreeAndNil( CtrlEventoImovel );
  inherited;
end;

procedure TfrmCadPropFinanc.sbtnApagarClick(Sender: TObject);
begin
   if qryFLGTIPOCONTRATO.AsString = 'C' then begin
      MsgDlg('O contrato para esta proposta já foi gerado. Não pode ser excluído.','Aviso',mtWarning,[mbOK],0);
      sbtnApagar.Down := False;
   end
   else inherited;
end;

procedure TfrmCadPropFinanc.btnAnaliseAlugClick(Sender: TObject);
begin
   inherited;
   if (qryCONVLRTOTAL.AsFloat <= 0) and (qryCONVLRAJUSTADO.AsFloat <= 0) then begin
      MsgDlg('Não existe valor de aluguel nesta proposta','Aviso',mtWarning,[mbOk],0);
   end else begin
      AbrirForm(frmAnalProp,TfrmAnalProp,False);
   end;
end;

// -- Calcula os valores para o TAB de Analise
procedure TfrmCadPropFinanc.CalcAnalise;
begin
   inherited;
   edValorAlug.Value   := 0;
   lblAvalia.Caption   := 'Avaliação + ' + FormatFloat('##0.00',qryCONTAXAADMIN.AsFloat) + '%';
   edValorAvali.Value  := (qryCONVLRAJUSTADO.AsFloat / (1-(qryCONTAXAADMIN.AsFloat/100)));
   if qryPERALUGUELIDEAL.AsFloat <> 0 then begin
      if qryCONVLRTOTAL.AsFloat > 0 then begin
         lblAlug.Caption   := 'Aluguel / ' + FormatFloat('##0.00',qryPERALUGUELIDEAL.AsFloat) + '%';
         edValorAlug.Value := (qryCONVLRTOTAL.AsFloat / (qryPERALUGUELIDEAL.AsFloat/100));
      end else begin
         lblAlug.Caption   := 'Aluguel Não Informado';
         edValorAlug.Value := 0;
      end;
   end;
   if qry.State in [dsInsert,dsEdit] then begin
      CalcTotalProposta;
   end;
   edValPresAnal.Value := qryVLRPRESENTE.AsFloat;
   edValTotProp.value  := qryVLRPROPOSTA.AsFloat;
end;


// -- Calcula o valor total da proposta
procedure TfrmCadPropFinanc.CalcTotalProposta;
var rValTotProp : Double;
begin
   qryCondPag.DisableControls;
   rValTotProp := 0;

   // Soma todas as condições de pagamento
   qryCondPag.First;
   while not qryCondPag.EOF do begin
      if (qryCondPagTIPOCONDPAG.AsString = 'V') or
         (qryCondPagTIPOCONDPAG.AsString = 'S') or
         (qryCondPagTIPOCONDPAG.AsString = 'C') or
         (qryCondPagTIPOCONDPAG.AsString = 'P') then
         rValTotProp := rValTotProp + qryCondPagVLRFINANC.AsFloat;
      qryCondPag.Next;
   end;
   if qry.State in [dsInsert,dsEdit] then begin
      qryVLRPROPOSTA.AsFloat := rValTotProp;
   end;
   qryCondPag.EnableControls;
end;

procedure TfrmCadPropFinanc.sbMediaAluguelClick(Sender: TObject);
var iAlugMedio : Double;
begin
   inherited;

   // Determina o como valor Médio de Aluguel, todos os imóveis não alguados.
   if MsgDlg('Todos imóveis sem valor de aluguel definido terá o seu valor alterado para a média do aluguel dos demais imóveis. Confirma o procedimento ?',
             'Confirma',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
      iAlugMedio := 0;
      iAlugMedio := MediaMetroAluguel;
      qryDet.First;
      while not qryDet.eof do begin
         if (qryDetCIMVLRALUGUEL.AsFloat = 0) or (qryDetFLGORIGVLRALUG.AsInteger = 2) then begin
            qryDet.Edit;
            qryDetCIMVLRALUGUEL.AsFloat := iAlugMedio * qryDetIMOAREA.AsFloat;
            qryDetFLGORIGVLRALUG.AsInteger := 2;
            qryDet.Post;
         end;
         qryDet.Next;
      end;
      CalcValAluguel;
   end;
end;

procedure TfrmCadPropFinanc.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   btnAnaliseAlug.Enabled := True;
   sbSimula.Enabled       := True;
   sbConv.Enabled         := False;
   sbMediaAluguel.Enabled := False;
end;

procedure TfrmCadPropFinanc.qryDetBeforeInsert(DataSet: TDataSet);
begin
  inherited;
   if qryDet.RecordCount > 0 then begin
      iMestreProp := qryDetIDMESTRE.AsInteger;
      molImovelAtivo1.iMestre := iMestreProp;
   end else begin
      iMestreProp := -1;
   end;
end;

procedure TfrmCadPropFinanc.btnCalcValPresenteClick(Sender: TObject);
var
  //Cássio - SOL Nº 130139 KINTANA Nº 719116 - Início
  Pos : TBookMark;
begin
  inherited;
  //Cássio - SOL Nº 130139 KINTANA Nº 719116 - Início
  Pos := qryCondPag.GetBookMark;
  CalcValPresente;
  qryCondPag.GotoBookMark(Pos);
  //Cássio - SOL Nº 130139 KINTANA Nº 719116 - Fim
end;

procedure TfrmCadPropFinanc.qryDetCalcFields(DataSet: TDataSet);
begin
  inherited;
  case qryDetFLGORIGVLRALUG.AsInteger of
     1 : qryDetCAL_ORIGEM.AsString := 'Resgatado';
     2 : qryDetCAL_ORIGEM.AsString := 'Calculado';
     3 : qryDetCAL_ORIGEM.AsString := 'Informado';
  end;
end;

procedure TfrmCadPropFinanc.rptParcBeforePrint(Sender: TObject);
begin
   inherited;
   lblEmpresa.Caption      := Sistema.NomeEmpresa;
   lblSistema.Caption      := Sistema.NomeCompleto;
   lblProposta.Caption     := qryCONNUMERO.AsString + ' - ' + qryCONNOME.AsString;
   lblVlrFinanc.Caption    := FormatFloat('###,###,##0.00',qryCondPagVLRFINANC.AsFloat);
   lblParc.Caption         := IntToStr(qryCondPagNUMPARCELAS.AsInteger);
   lblDtProposta.Caption   := FormatDateTime('DD/MM/YYYY',qryCONDATAINICIO.AsDateTime);
   lblVlrTotal.Caption     := edtTotalPago.Text;
   lblFormaCalculo.Caption := qryCondPagCal_Forma.AsString;
end;

procedure TfrmCadPropFinanc.sbImprimeClick(Sender: TObject);
begin
   inherited;
   dtmFinanciamento.qryParc.DisableControls;
   TfrmPreview.CreateModalPreview(Application, rptParc,
                                  rptParc.PrinterSetup.DocumentName);
   dtmFinanciamento.qryParc.EnableControls;
end;

procedure TfrmCadPropFinanc.btnBuscaRespClick(Sender: TObject);
begin
   inherited;
   // Procura o Responsável pela proposta
   if qry.State in [dsInsert, dsEdit] then begin
      dtmMS.MS_Responsavel.Executar;
      Repaint;
      if dtmMS.MS_Responsavel.RetornouValor then begin
         qryIDRESPONSAVEL.asInteger := StrToInt(dtmMS.MS_Responsavel.ValoresChave[0]);
         qryNOMRESPONSAVEL.asString := dtmMS.MS_Responsavel.ValoresChave[1];
      end;
      if btnBuscaResp.CanFocus then btnBuscaResp.SetFocus;
   end;
end;

procedure TfrmCadPropFinanc.btnLimpaRespClick(Sender: TObject);
begin
   inherited;
   if qry.State in dsEditModes then begin
      qryIDRESPONSAVEL.Clear;
      qryNOMRESPONSAVEL.Clear;
   end;
end;

procedure TfrmCadPropFinanc.dblcPaisCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   qryLookEstado.Close;
   qryLookCidade.Close;

   DBlcEstado.Enabled := False;
   DBlcCidades.Enabled := False;


   if DBlcPais.LookupValue <> '' then begin
      DBlcEstado.Enabled := True;
      with qryLookEstado do begin
         LimpaParametros(qryLookEstado);
         ParamByName('PAIS').asInteger := StrToInt(DBlcPais.LookupValue);
         Open;
      end;
   end;

   // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
   if DBlcPais.Text <> '' then
   begin
     dblcEstado.Clear;
     DBlcCidades.Clear;
   end;
   //Fim - N. Sol 100317  -  N. Kintana 443687

end;

procedure TfrmCadPropFinanc.dblcEstadoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   qryLookCidade.Close;

   DBlcCidades.Enabled := False;

   // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
   if ( (DBlcPais.LookupValue <> '') and (DBlcEstado.LookupValue <> '') ) then begin
      DBlcCidades.Enabled := True;

      with qryLookCidade do
      begin
        LimpaParametros(qryLookCidade);
        Sql.Text := ('SELECT IDCIDADES, CODESTADO, IDPAIS, NOME, CODMUNICIPIO, IDESTADO'+ #13#10 +
                     'FROM CIDADES'+ #13#10 +
                     'WHERE CODESTADO = '+ QuotedStr(DBlcEstado.LookupValue)+ #13#10+
                     'ORDER BY NOME');
         Open;
      end;
   end;

   if DBlcEstado.Text <> '' then
     DBlcCidades.Clear;
   //Fim - N. Sol 100317  -  N. Kintana 443687
end;


// -- Checa os valores para venda a vista, só pode ter uma condição de pagamento
//    Retorno : True  - Venda ok
//              False - Cond. de Pagamento com erros
function TfrmCadPropFinanc.VendaVistaOk: Boolean;
var bVista : Boolean;
    iQtde  : Integer;
begin
   bVista := False;
   Result := True;
   iQtde  := 0;
   qryCondPag.DisableControls;
   qryCondPag.First;
   while not qryCondPag.eof do begin
      iQtde := iQtde + 1;
      if qryCondPagTIPOCONDPAG.AsString = 'V' then bVista := True;
      qryCondPag.next;
   end;
   qryCondPag.EnableControls;
   if (iQtde > 1) and (bVista = True) then begin
      Result := False;
   end;
end;


// -- Checa o valor total da proposta com o valor total dos imóveis informado
//    Retorno:  True  -  Total OK
//              False -  Valor divergente
function TfrmCadPropFinanc.VlrTotalOk(var fTotImovel, fTotCond : Double): Boolean;
var fIDCondAnt : Double;
begin
   Result     := True;
   fTotCond   := 0;
   fTotImovel := 0;
   qryCondPag.DisableControls;
   fIDCondAnt  := qryCondPagIDCONDPAGIMOVEL.AsFloat;
   qryCondPag.First;
   while not qryCondPag.eof do begin
      if qryCondPagTIPOCONDPAG.AsString <> 'R' then
         fTotCond := fTotCond + qryCondPagVLRFINANC.AsFloat;
      qryCondPag.next;
   end;
   qryCondPag.Locate('IDCONDPAGIMOVEL',fIDCondAnt,[]);
   qryCondPag.EnableControls;

   qryDet.DisableControls;
   qryDet.First;
   while not qryDet.eof do begin
      fTotImovel := fTotImovel + qryDetVLRVENDA.AsFloat;
      qryDet.next;
   end;
   qryDet.EnableControls;

   if FormatFloat('#################',fTotCond) <> FormatFloat('###############',fTotImovel) then begin
      Result := False;
   end;
end;


function TfrmCadPropFinanc.VerificaTipoImovel: Boolean;
var sSql, sCond : String;
begin
   Result := True;
   // Monta a clausula IN para cada imovel selecionado
   qryDet.DisableControls;
   sCond := 'WHERE IDIMOVEL IN(';
   qryDet.First;
   while not qryDet.EOF do begin
      sCond := sCond + FormatFloat('#0',qryDetIDIMOVEL.asFloat)+',';
      qryDet.Next;
   end;
   sCond := Copy(sCond,1,Length(sCond)-1) + ')';
   qryDet.First;
   qryDet.EnableControls;

   // Executa Query verificando se existe mais de um tipo de imovel selecionado
   sSql := 'SELECT CODTIPIMOVEL FROM IMOVEL ' + sCond +
           ' GROUP BY CODTIPIMOVEL ';
   if FazQuery(DtmBaseDados.qry,sSql) then begin
      if DtmBaseDados.qry.RecordCount > 1 then begin
         Result := False;
      end;
   end;
end;


// -- Calcula o valor contábil total da proposta
//    Retorno:   Valor contábil total da proposta
function TfrmCadPropFinanc.CalcVlrContabilTotal: Double;
begin
   Result := 0;
   qryDet.DisableControls;
   qryDet.First;
   while not qryDet.eof do begin
      Result := Result + qryDetVLRCONTABIL.AsFloat;
      qryDet.next;
   end;
   qryDet.EnableControls;
end;

function TfrmCadPropFinanc.BuscaProxNumero: String;
var fProx : Double;

begin
   Result := '';
   fProx  := 0;
   try
      qryBuscaProxNumero.Close;
      qryBuscaProxNumero.Open;
      fProx  := qryBuscaProxNumeroULTNUMERO.AsFloat + 1;
      Result := FormatFloat('000000',Int(fProx));
   except
      Result := '';
      MsgDlg('Erro na conversão do Ultimo Numero de Proposta','Erro',mtError,[mbOK],0);
   end;
end;


procedure TfrmCadPropFinanc.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   // Se algum detalhe estiver sendo editado, cancela a edição antes de alterar o TAB
   if (qryDet.State <> dsBrowse) or (qryCondPag.State <> dsBrowse) then begin
      if MsgDlg('O Registro está em modo de Inserção ou Edição. Cancela a Operação?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
         bbtnCancelarDet.Click;
         inherited;
      end else begin
         AllowChange := False;
      end;
   end else begin
     inherited;
   end;
end;

procedure TfrmCadPropFinanc.sbtnProcurarImovelClick(Sender: TObject);
begin
  inherited;
  MS_Imovel.Executar;
  if MS_Imovel.RetornouValor then begin
     SelMestreDet(StrToFloat(MS_Imovel.ValoresChave[0]));

     // Ricardo A. SOL 117674 KTN 559045
     molComprador1.edtRazaoSocial.Text := qryRAZAOSOCIAL.AsString;
     molComprador1.iComprador          := qryIDLOCATARIO.AsInteger;

     CalcAnalise;
// Daniel - 25716 - Início -----------------------------------------------------
    if (qryFLGTIPOCONTRATO.AsString='P') then begin
      lblNumProp.Caption   := 'Nº da Proposta';
      lblTitulo.Caption    := 'Proposta de Alienação';
      lblComprador.Enabled := False;
    end else begin
      if (qryFLGTIPOCONTRATO.AsString='A') then begin
        lblNumProp.Caption := 'Nº do acordo';

        if (qryFLGSTATUS.AsString='V') then
          lblTitulo.Caption := 'Acordo Vigente'
        else
          lblTitulo.Caption := 'Acordo Encerrado';

        lblComprador.Enabled := True;
      end else begin
        lblNumProp.Caption := 'Nº do Contrato';

        if (qryFLGSTATUS.AsString='V') then
          lblTitulo.Caption := 'Contrato Vigente'
        else
          lblTitulo.Caption := 'Contrato Encerrado';

        lblComprador.Enabled := True;
      end;
    end;
    CmeCadastroAtualizaBotoes(Sender);
// Daniel - 25716 - Fim --------------------------------------------------------
     tbcDetalheChange(Self);
  end;

  sbtnProcurarImovel.Down := False;
end;

procedure TfrmCadPropFinanc.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
      tabAlug.Enabled     := True;
      tabCobranca.Enabled := True;
      tabObs.Enabled      := True;
      tabFianca.Enabled   := True;
   end else begin
      tabAlug.Enabled     := False;
      tabCobranca.Enabled := False;
      tabObs.Enabled      := False;
      tabFianca.Enabled   := False;
   end;

   // No tab de eventos, habilita o Descrição do evento que está fora do grid padrão
   if pgctrlDetalhe.ActivePage = tbsEventos then begin
     if cdsEvento.State in dsEditModes then
          gbEvento.Enabled := True
     else gbEvento.Enabled := False;
   end;
end;

procedure TfrmCadPropFinanc.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

// Início ------- Data: 08/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
// Inclusão de habilita/desabilita botão sbtnProcurarImovel.Enabled
// Fim ------------------------ Marcio Motta -----------------------------------

   if (qryFLGSTATUS.AsString = 'E') then
    begin
     sbtnAlterar.Enabled := False;
     sbtnApagar.Enabled  := False;
    end
   else
    begin
      if (qryFLGSTATUS.AsString <> '') and (CmeCadastro.Operacao <> opInserir) then
      sbtnAlterar.Enabled := True;
      if CmeCadastro.Operacao in [opInserir, opAlterar] then
        begin
          tabAlug.Enabled     := True;
          tabCobranca.Enabled := True;
          tabObs.Enabled      := True;
          tabFianca.Enabled   := True;
          sbtnProcurarImovel.Enabled := False;
        end
      else
       begin
         tabAlug.Enabled     := False;
         tabCobranca.Enabled := False;
         tabObs.Enabled      := False;
         tabFianca.Enabled   := False;
         sbtnProcurarImovel.Enabled := True;
       end;
    end
end;

procedure TfrmCadPropFinanc.btnBuscaAdminClick(Sender: TObject);
begin
  inherited;
   // Procura a Administradora do Contrato
   if qry.State in [dsInsert, dsEdit] then begin
      dtmMS.MS_AdminImovel.Executar;
      Repaint;
      if dtmMS.MS_AdminImovel.RetornouValor then begin
         qryIDADMINIMOVEL.asInteger := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
         qryNOMADMINIMOVEL.asString := dtmMS.MS_AdminImovel.ValoresChave[1];
      end;
      if btnBuscaAdmin.CanFocus then btnBuscaAdmin.SetFocus;
   end;
end;

procedure TfrmCadPropFinanc.btnLimpaAdminClick(Sender: TObject);
begin
   inherited;
   if qry.State in dsEditModes then begin
      qryIDADMINIMOVEL.Clear;
      qryNOMADMINIMOVEL.Clear;
   end;
end;

procedure TfrmCadPropFinanc.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
   // Desabilita a alteração do contrato nos tabs Imovel e Cond. de Pagamento
   if (qryFLGTIPOCONTRATO.AsString[1] in ['C','A']) and (pgctrlDetalhe.ActivePageIndex in [0,2]) then begin
      tb97BotoesDetalhe.enabled := False;
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end else begin
      if qry.State in [dsEdit, dsInsert] then begin
         tb97BotoesDetalhe.enabled := True;
         sbtnInsDet.Enabled        := True;
         sbtnAltDet.Enabled        := True;
         sbtnExcluiDet.Enabled     := True;
      end;
   end;
end;

procedure TfrmCadPropFinanc.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;


     // Desabilita a alteração do contrato nos tabs Imovel e Cond. de Pagamento
     if (qryFLGTIPOCONTRATO.AsString[1] in ['C','A']) and (pgctrlDetalhe.ActivePageIndex in [0,2]) then
     begin
       tb97BotoesDetalhe.enabled := False;
       sbtnInsDet.Enabled    := False;
       sbtnAltDet.Enabled    := False;
       sbtnExcluiDet.Enabled := False;
     end
     else
     begin
       if qry.State in [dsEdit, dsInsert] then
       begin
         tb97BotoesDetalhe.enabled := True;
         sbtnInsDet.Enabled        := True;
         sbtnAltDet.Enabled        := True;
         sbtnExcluiDet.Enabled     := True;
       end;
     end;
     // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
     AcertaBotoes();
     //Fim - N. Sol 100317  -  N. Kintana 443687

end;

// Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
procedure TfrmCadPropFinanc.AcertaBotoes();
begin
  if ((qry.State in [dsEdit, dsInsert]) and (qryDet.IsEmpty) and (pgctrlDetalhe.ActivePage = tbsDet)) then
  begin
    sbtnExcluiDet.Enabled := False;
    sbtnAltDet.Enabled    := False;
  end;
  if ((qry.State in [dsEdit, dsInsert]) and (qryCondPag.IsEmpty) and (pgctrlDetalhe.ActivePage = TabCond)) then
  begin
    sbtnExcluiDet.Enabled := False;
    sbtnAltDet.Enabled    := False;
  end;
  if ((qry.State in [dsEdit, dsInsert]) and (qryFiador.IsEmpty) and (pgctrlDetalhe.ActivePage = tbsFiadores )) then
  begin
    sbtnExcluiDet.Enabled := False;
    sbtnAltDet.Enabled    := False;
  end;
  if ((qry.State in [dsEdit, dsInsert]) and (cdsEvento.IsEmpty) and (pgctrlDetalhe.ActivePage = tbsEventos)) then
  begin
    sbtnExcluiDet.Enabled := False;
    sbtnAltDet.Enabled    := False;
  end;
  if ((qry.State in [dsEdit, dsInsert]) and (qryMultaJuros.IsEmpty) and (pgctrlDetalhe.ActivePage = tabMulta)) then
  begin
    sbtnExcluiDet.Enabled := False;
    sbtnAltDet.Enabled    := False;
  end;

end;
//Fim - N. Sol 100317  -  N. Kintana 443687

procedure TfrmCadPropFinanc.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   // Desabilita a alteração do contrato nos tabs Imovel e Cond. de Pagamento
   if (qryFLGTIPOCONTRATO.AsString[1] in ['C','A']) and (pgctrlDetalhe.ActivePageIndex in [0,2]) then begin
      tb97BotoesDetalhe.enabled := False;
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end else begin
      if qry.State in [dsEdit, dsInsert] then begin
         tb97BotoesDetalhe.enabled := True;
         sbtnInsDet.Enabled        := True;
         sbtnAltDet.Enabled        := True;
         sbtnExcluiDet.Enabled     := True;
      end;
   end;
   // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
   AcertaBotoes();
   //Fim - N. Sol 100317  -  N. Kintana 443687
end;

procedure TfrmCadPropFinanc.grdEventoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  // Altera o indice do Grid conforme seleção
  case pgctrlDetalhe.ActivePageIndex of
    6 : cdsEvento.IndexFieldNames := AFieldName;
  end;
end;

procedure TfrmCadPropFinanc.sbtnAltDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    if (not CdsEventoFLGTIPOEVENTO.IsNull) and (CdsEventoFLGTIPOEVENTO.AsString <> 'US')  then begin
      MsgDlg('Eventos de sistema não podem ser editados', 'Aviso', mtWarning, [mbOk], 0);
      sbtnAltDet.Down := False;
    end else begin
      inherited;
    end;
  end else begin
    inherited;
  end;
end;

procedure TfrmCadPropFinanc.sbtnExcluiDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    if (not CdsEventoFLGTIPOEVENTO.IsNull) and (CdsEventoFLGTIPOEVENTO.AsString <> 'US') then begin
      MsgDlg('Eventos de sistema não podem ser excluídos', 'Aviso', mtWarning, [mbOk], 0);
      sbtnAltDet.Down := False;
    end else begin
      inherited;
    end;
  end else begin

// Daniel - 18795 - Início -----------------------------------------------------
    if (pgctrlDetalhe.ActivePage=TabCond) then begin
      if not (dtmFinanciamento.qryParcCODDOCUMENTO.IsNull) then
        MsgDlg('Proposta já foi integrada. Não é possível excluir.','Informação',mtWarning,[mbOK],0)
      else inherited;
    end else inherited;
// Daniel - 18795 - Fim --------------------------------------------------------

  end;

end;


procedure TfrmCadPropFinanc.cbDataFimIndeterminadaClick(Sender: TObject);
begin
  inherited;
  // 29/12/2003 - Marcio Motta - Validação da data final de vigência
  if qryMultaJuros.State in [dsInsert, dsEdit] then
     if cbDataFimIndeterminada.Checked then begin
        qryMultaJurosDATAFIM.Clear;
        edDataFimVigencia.Clear;
     end;
end;

procedure TfrmCadPropFinanc.DBspnDiaRepasseChange(Sender: TObject);
begin
  inherited;
//---------- 29/12/2003 - Marcio Motta ---------------------------------------------
  if DBspnDiaRepasse.Text <> '' then
    DBrdgTipoDiaRepasse.Enabled := True
  else
    DBrdgTipoDiaRepasse.Enabled := False;
end;

procedure TfrmCadPropFinanc.DBspnDiaToleranciaChange(Sender: TObject);
begin
  inherited;
//---------- 29/12/2003 - Marcio Motta ---------------------------------------------
  if DBspnDiaTolerancia.Text <> '' then
    DBrdgTipoDiaTolera.Enabled := True
  else
    DBrdgTipoDiaTolera.Enabled := False;
end;

procedure TfrmCadPropFinanc.dblcbIndCMChange(Sender: TObject);
begin
  inherited;
//---------- 02/01/2004 - Marcio Motta ---------------------------------------------
  if dblcbIndCM.Text <> '' then
    begin
      dbSpinMesesAnteriores.Enabled := True;
      dbSpinMesesAnteriores.Value := 0;
    end
  else
    dbSpinMesesAnteriores.Enabled := False;
end;

function TfrmCadPropFinanc.VerificaTerminoIndeterminado: Boolean;
var i : integer;
begin
//---------- 30/12/2003 - Marcio Motta ---------------------------------------------

   Result := True;

   qryMultaJuros.DisableControls;
   qryMultaJuros.First;
   i := 0;

   // Analisa os dados da Query para verificar a existência de períodos indeterminados
   while not qryMultaJuros.Eof do begin
      if (qryMultaJurosFLGINDETERMINADO.AsString = 'S') then begin
         inc(i);
      end;

      if (i > 1) then begin
         Result := False;
         Break;
      end;

      qryMultaJuros.Next;
   end;

   qryMultaJuros.First;
   qryMultaJuros.EnableControls;

//------- Fim Implementação/Alteração - Marcio Motta -------------------------------
end;


function TfrmCadPropFinanc.VerificaDatasVigencias: Boolean;
var
  DataFim, DataIni : TDateTime;
  TotReg, I : integer;
  Registro : TBookmark;

begin
//---------- 02/01/2004 - Marcio Motta ---------------------------------------------

   Result := True;

   qryMultaJuros.DisableControls;
   qryMultaJuros.First;

   TotReg := qryMultaJuros.RecordCount - 1;

   // Inicia o Loop externo para verificar as datas
   for i := 1 to TotReg do
     begin

       // Guarda informações do Ponteiro da qry para andar pelos registros no Loop externo
       if qryMultaJuros.BOF then
         begin
           Registro := qryMultaJuros.GetBookmark;
         end
       else
         if not qryMultaJuros.Eof then
           begin
             qryMultaJuros.GotoBookmark(Registro);
             qryMultaJuros.Next;
             Registro := qryMultaJuros.GetBookmark;
           end;

       // Se o registro corrente tiver Término indeterminado verifica somente a data inicial
       // do registro corrente com a data final do registro a ser comparado
       if (qryMultaJurosFLGINDETERMINADO.AsString = 'S') then
         begin
           DataIni := qryMultaJurosDATAINI.AsDateTime;

           // Loop interno comparando o registro corrente com os registros subsequentes
           // caso o registro corrente tenha término indeterminado
           while not qryMultaJuros.Eof do
             begin
               qryMultaJuros.Next;
               if (DataIni <= qryMultaJurosDATAFIM.AsDateTime) then
                 begin
                   Result := False;
                   Break
                 end;
             end;
         end
       else
         begin
           DataIni := qryMultaJurosDATAINI.AsDateTime;
           DataFim := qryMultaJurosDATAFIM.AsDateTime;

           // Loop interno comparando o registro corrente com os registros subsequentes
           // caso o registro subsequente tenha término indeterminado
           while not qryMultaJuros.Eof do
             begin
               qryMultaJuros.Next;

               // Se o registro a ser comparado com o registro corrente possuir prazo indeterminado
               // compara-se somente a data final do corrente com a data inicial do registro a ser comparado
               if qryMultaJurosDATAFIM.IsNull then
                 begin
                   if (DataFim >= qryMultaJurosDATAINI.AsDateTime) then
                     begin
                       Result := False;
                       Break
                     end;
                 end
               else
                 // Se ambos registros possuirem datas de término compara-se a data inicial e final
                 // do corrente com os subsequentes
                 if ((DataIni >= qryMultaJurosDATAINI.AsDateTime) and
                    ( DataIni <= qryMultaJurosDATAFIM.AsDateTime)) or
                    ((DataIni >= qryMultaJurosDATAINI.AsDateTime) and
                    ( DataFim <= qryMultaJurosDATAFIM.AsDateTime)) or
                    ((DataFim >= qryMultaJurosDATAINI.AsDateTime) and
                    ( DataFim <= qryMultaJurosDATAFIM.AsDateTime)) then
                   begin
                     Result := False;
                     Break
                   end;
           end;

         end;

      // Ao fim de uma comparação, verifica a necessidade se sair do loop externo
      if not Result then
         Break;
     end;

   qryMultaJuros.First;
   qryMultaJuros.EnableControls;

//------- Fim Implementação/Alteração - Marcio Motta -------------------------------
end;


procedure TfrmCadPropFinanc.edDataFimVigenciaChange(Sender: TObject);
begin
  inherited;
//----------  - Marcio Motta ---------------------------------------------
  if qryMultaJuros.State in [dsInsert, dsEdit] then
     if edDataFimVigencia.Text <> '' then begin
        qryMultaJurosFLGINDETERMINADO.AsString := 'N';
        cbDataFimIndeterminada.Checked := False;
     end;
end;

procedure TfrmCadPropFinanc.molImovelAtivo1btnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelAtivo1.btnLimpaImovelClick(Sender);

end;

procedure TfrmCadPropFinanc.molImovelAtivo1btnBuscaImovelClick(
  Sender: TObject);
var fSldCtb: Extended;
begin
  inherited;
   molImovelAtivo1.iArea := 0;
   molImovelAtivo1.btnBuscaImovelClick(Sender);

   if molImovelAtivo1.iImovel > 0 then begin
      // Verifica se o imóvel MESTRE está em estado de penhora
      with DtmImobiliario.qryImovel do begin
         LimpaParametros(DtmImobiliario.qryImovel);
         ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
         ParamByName('pIdImovel').AsInteger := molImovelAtivo1.iMestre;
         Open;
         if dtmImobiliario.qryImovelFLGSTATUS.AsString = 'P' then begin
            MsgDlg('O imóvel MESTRE está em Penhora, não permitindo' + #13 +
                   'a alienação deste imóvel', 'Aviso',mtWarning ,[mbOk],0);
            molImovelAtivo1.btnLimpaImovel.Click;
            edValAluguel.Value := 0;
            edValContabil.Value := 0;
            molImovelAtivo1.btnBuscaImovel.SetFocus;
            Exit;
         end;
      end;

      // Verifica se o imóvel FILHO está em estado de penhora
      if molImovelAtivo1.sStatus = 'P' then begin
            MsgDlg('Este imóvel está em Penhora não podendo ser alienado',
                   'Aviso',mtWarning ,[mbOk],0);
            molImovelAtivo1.edtImovel.Clear;
            edValAluguel.Value := 0;
            edValContabil.Value := 0;
            molImovelAtivo1.iImovel := -1;
            molImovelAtivo1.btnBuscaImovel.SetFocus;
            Exit;
      end;


      // Pendência 19876 - MARCOS TOPINI
      If ( molImovelAtivo1.sCodTipoImo = ModuloImobiliario.InvestImob.sCodTipImovelObra ) or
         ( molImovelAtivo1.sCodTipoImo = ModuloImobiliario.AdminImob.sTipoImovelPatro ) then begin
         MsgDlg('Imóveis em Construção ou Locados a Patrocinadora não podem ser alienados, ' +#13+
                'transfira primeiro o imóvel de segmento.', 'Aviso',mtWarning ,[mbOk],0);
         molImovelAtivo1.btnLimpaImovelClick(self);       
         Exit;
      end;


      // busca valor contábil no Ativo Fixo
      fSldCtb := CAF.SaldoContabilImovel(molImovelAtivo1.iImovel, -1, edDataProp.Date);
      if (ModuloImobiliario.Alienacao.bFlgIntegraAtivo) and (fSldCtb = 0) then begin
         MsgDlg('O imóvel selecionado não possui Saldo Contábil', 'Aviso',mtWarning,[mbOk],0);
         Exit;
      end;

      qryDetVLRCONTABIL.AsFloat     := fSldCtb;
      qryDetCIMVLRALUGUEL.AsInteger := BuscaAluguel(IntToStr(molImovelAtivo1.iImovel));
      qryDetIMOAREA.AsFloat         := molImovelAtivo1.iArea;
      qryDetIDMESTRE.AsInteger      := molImovelAtivo1.iMestre;
   end else begin
      qryDetCIMVLRALUGUEL.AsInteger := 0;
      qryDetVLRCONTABIL.AsFloat     := 0;
   end;
   qryDetFLGORIGVLRALUG.AsInteger := 1;
end;

// SOL N° 114812 KINTANA N° 538136.
// Responsável: Ádler Teodoro de Souza
// Parâmetros : IdUsuario.
// Retorno    : Nome do Usuário.

function TfrmCadPropFinanc.Retorna(const idUsuario:integer): String;
var
  _qryAux : TwwQuery;
begin
  _qryAux := TwwQuery.Create(nil);
  _qryAux.DatabaseName := 'BaseDados';

  if idUsuario = 0 then
    Result := 'CM' + inttostr(idUsuario)
  else
  begin
    _qryAux.Close;
    _qryAux.Sql.Clear;
    _qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = ' + IntToStr(idUsuario));
    _qryAux.Open;

    Result := _qryAux.FieldByName('NOME').AsString;
  end;
end;


function TfrmCadPropFinanc.VerificaPreenchimentoFiador: Boolean;
begin
  Result := False;
  try
    if molFiador1.iFiador <= 0 then
      raise EValidacao.CreateVal('É necessário indicar o Fiador do Contrato', molFiador1.btnBuscaFiador);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      tbcDetalhe.TabIndex      := 9;
      pgctrlDetalhe.ActivePage := tbsFiadores;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

// Daniel - 18795 - Início -----------------------------------------------------
function TfrmCadPropFinanc.GeraParcelaCaucao: Boolean;
var sSql          : String;
    iParc         : Integer;
    fSaldoAtual   : Double;
    fAmortizacao  : Double;
    fSaldoDevedor : Double;
begin
  Result := True;
  qryCondPag.First;
  while not qryCondPag.Eof do begin
    { Executa apenas se a condição de pagamento for "Caução"... }
    if (qryCondPagTIPOCONDPAG.AsString='C') then begin
      sSql := 'SELECT * FROM PARCFINANCIMOV WHERE IDCONDPAGIMOVEL = '+IntToStr(qryCondPagIDCONDPAGIMOVEL.AsInteger);
      FazQuery(dtmFinanciamento.qryAux, sSql);

      if not (dtmFinanciamento.qryAux.IsEmpty) then begin
        { Somente irá excluir se já existir registro E o documento for nulo... }
        if (dtmFinanciamento.qryAux.FieldByName('CODDOCUMENTO').IsNull) then begin
          sSql := 'DELETE FROM PARCFINANCIMOV WHERE IDCONDPAGIMOVEL = '+IntToStr(qryCondPagIDCONDPAGIMOVEL.AsInteger);
          ExecutarQuery(DtmFinanciamento.qryAux,sSql);
        end else
          Exit;
      end;


      { Insere o valor do caução na tabela "PARCFINANCIMOV"... }
      fSaldoAtual   := qryCondPagVLRFINANC.AsFloat;
      fAmortizacao  := qryCondPagVLRFINANC.AsFloat;
      fSaldoDevedor := fSaldoAtual-fAmortizacao;

      iParc := LeUltRegistro(nil,'PARCFINANCIMOV');
      sSql  := 'INSERT INTO PARCFINANCIMOV '                                                                   +#13+
               '       ( IDPARCFINANCIMOV, IDCONDPAGIMOVEL, FLGTIPOLANC,   DATAVENCIMENTO, NUMPARCELA, '       +
               '         VLRPRESTACAO,     VLRNOMINAL,      VLRSALDOATUAL, VLRAMORTIZACAO, VLRSALDODEVEDOR ) ' +#13+
               'VALUES ( '+IntToStr(iParc)+', '                                                                +
                           IntToStr(qryCondPagIDCONDPAGIMOVEL.AsInteger)+', 8, '                               +
                           QuotedStr(FormatDateTime('dd/mm/yyyy',qryCondPagDATAVENCIMENTO.AsDateTime))+', 1, ' +
                           FloatToStr(qryCondPagVLRFINANC.AsFloat)+', '                                        +
                           FloatToStr(qryCondPagVLRFINANC.AsFloat)+', '                                        +
                           FloatToStr(fSaldoAtual)+', '                                                        +
                           FloatToStr(fAmortizacao)+', '                                                       +
                           FloatToStr(fSaldoDevedor)+' ) ';

      if not ExecutarQuery(DtmFinanciamento.qryAux,sSql) then begin
         Result := False;
         Exit;
      end;
    end;

    qryCondPag.Next;
  end;
end;

function TfrmCadPropFinanc.ExcluiParcelaCaucao: Boolean;
var sSql : String;
begin
  Result := True;
  //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387  
  sSql := 'SELECT P.IDCONDPAGIMOVEL FROM PARCFINANCIMOV P WHERE P.IDCONDPAGIMOVEL = '+IntToStr(qryCondPagIDCONDPAGIMOVEL.AsInteger);
  FazQuery(dtmFinanciamento.qryAux, sSql);

  if not (dtmFinanciamento.qryAux.IsEmpty) then
  begin
     sSql   := 'DELETE FROM PARCFINANCIMOV WHERE IDCONDPAGIMOVEL = '+IntToStr(qryCondPagIDCONDPAGIMOVEL.AsInteger);
     if not ExecutarQuery(DtmFinanciamento.qryAux,sSql) then
        Result := False;
  end;
end;
// Daniel - 18795 - Fim --------------------------------------------------------

procedure TfrmCadPropFinanc.molComprador1btnBuscaFornClick(
  Sender: TObject);
begin
  inherited;
  molComprador1.btnBuscaFornClick(Sender);

end;

procedure TfrmCadPropFinanc.MudaAba;
var
  //Cássio - SOL Nº 130139 KINTANA Nº 719116
  Pos : TBookMark;
begin
   if (
       ((Copy(qry.FieldByName('FLGTIPOCONTRATO').AsString,1,1) = 'C') or
        (Copy(qry.FieldByName('FLGTIPOCONTRATO').AsString,1,1) = 'A')) and
        (pgctrlDetalhe.ActivePageIndex in [0,2])
      ) then
   begin
      tb97BotoesDetalhe.enabled := False;
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end
   else
   begin
      if qry.State in [dsEdit] then begin
         tb97BotoesDetalhe.enabled := True;
         sbtnInsDet.Enabled        := True;
         sbtnAltDet.Enabled        := True;
         sbtnExcluiDet.Enabled     := True;
      end
      else
        // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
        if qry.State in [dsInsert] then
        begin
           tb97BotoesDetalhe.Enabled := True;
           sbtnInsDet.Enabled        := True;
           sbtnAltDet.Enabled        := False;
           sbtnExcluiDet.Enabled     := False;
        end;
        //Fim - N. Sol 100317  -  N. Kintana 443687
   end;


   if pgCtrlDetalhe.ActivePage = tabAlug then begin
      if qry.State in [dsEdit, dsInsert] then begin
         BuscaReajuste;
         CalcValAluguel;
      end;
   end;
   if pgCtrlDetalhe.ActivePage = tabAnalIni then begin
      CalcValAluguel;
      //Cássio - SOL Nº 130139 KINTANA Nº 719116 - Início
      Pos := qryCondPag.GetBookMark;
      CalcValPresente;
      qryCondPag.GotoBookMark(Pos);
      //Cássio - SOL Nº 130139 KINTANA Nº 719116 - Fim
      CalcAnalise;
   end;

   if pgCtrlDetalhe.ActivePage = tabSimula then begin
      with dtmFinanciamento.qryParc do begin
         LimpaParametros(dtmFinanciamento.qryParc);
         ParamByName('IDCONDPAGIMOVEL').AsFloat := qryCondPagIDCONDPAGIMOVEL.AsFloat;
         Filtered := False;
         Open;
         if IsEmpty then begin
            sbSimula.Enabled := True;
         end else begin
            sbSimula.Enabled := False;
         end;

         DisableControls;
         edtTotalPago.Value := 0;
         while not eof do begin
            if FieldByName('NUMPARCELA').AsInteger > 0 then
               edtTotalPago.Value := edtTotalPago.Value + FieldByName('VLRPRESTACAO').AsFloat;
            next;
         end;
         First;
         EnableControls;
      end;
   end;
end;

procedure TfrmCadPropFinanc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
  tbcDetalheChange(sender);
  Self.MudaAba;
  //Fim - N. Sol 100317  -  N. Kintana 443687
end;

procedure TfrmCadPropFinanc.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Ini - William Manoel dos Santos - 04/11/2008 - N. Sol 100317   -  N. Kintana 443687
  tbcDetalheChange(sender);
  Self.MudaAba;
  //Fim - N. Sol 100317  -  N. Kintana 443687
end;

end.
