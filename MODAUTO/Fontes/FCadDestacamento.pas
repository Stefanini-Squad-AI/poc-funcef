//******************************************************************************
//N. SIG..........: 128057
//Data............: 17/08/2022
//Responsável.....: Everson Cunha
//Descrição.......: Ajustes para destino Exterior
//******************************************************************************
//N. SIG..........: 124171
//Data............: 12/04/2022
//Responsável.....: Ewerton Beltramini
//Descrição.......: Remoção da assinatura do "Chefe da Unidade da Lotação" e
//                  assinatura do "Diretor Responsável" e substitui-las por
//                  apenas uma para data e assinatura com a descrição:" Gestor
//                  Responsável ".
//******************************************************************************
//N. SIG..........: 49075
//Data............: 02/02/2021
//Responsável.....: Everson Cunha
//Descrição.......: Desbloqueio do campo "Centro de Responsabilidade"
//******************************************************************************
//N. SIG..........: 74816
//Data............: 13/05/2019
//Responsável.....: Everson Cunha
//Descrição.......: Ajuste na qryResumoValores, pois estava trazendo valores
//                  incorretos para TOTAL ACERTO DE CONTAS
//******************************************************************************
//N. SIG..........: 81771
//Data............: 12/02/2019
//Responsável.....: Taffarel Sevaybriker
//Descrição.......: Inserção da alteração do SIG70193.
//******************************************************************************
//Alteração.......: qryDestacamento(DFM - UpdateMode)
//N. SIG..........: 77119 - TIBERO
//Data............: 20/10/2018
//Responsável.....: Andre Imakawa
//Descrição.......: Alterado o updatemode para upWhereKeyOnly
//******************************************************************************
//N. SIG..........: 70193
//Data............: 14/06/2018
//Responsável.....: Osni Cavalcante
//Descrição.......: A opção "Empregado" do RadioGroup "Custeio de Despesas" foi
//                  desabilitada.
//******************************************************************************
//N. SIG..........: 35255
//Data............: 07/02/2017
//Responsável.....: William Moreira da Silva
//Descrição.......: Voltar o padrão do centro de responsabilidade para GEAPE.
//******************************************************************************
//N. SOL..........: 233230/18354
//Data............: 15/02/2017
//Responsável.....: Peterson Victor
//Descrição.......: Criar uma rotina para desfazer o agrupamento de APs na
//                  funcionalidade de solicitação de destacamento.
//******************************************************************************
//N. SIG..........: 27767
//Data............: 22/12/2016
//Responsável.....: Darivaldo Alencar
//Descrição.......: Inclusão dos campos para informações dos valores de
//                  hospedagens totais e passagens aéreas totais no módulo Auto
//                  Atendimento - Destacamento e que sejam emitidos no
//                  formulário de destacamento. Na ocasião, o item 3 (acerto de
//                  contas) poderá ser retirado do formulário de destacamento.
//******************************************************************************
//N. SIG..........: 31813
//Data............: 20/10/2016
//Responsável.....: Marcelo Cardoso
//Descrição.......: CORRREÇÃO DO CENTRO DE RESPONSABILIDADE DAS APS GERADAS NO
//                  MODULO AUTO ATENDIMENTO TENDO EM VISTAMIGRACAO DESTA
//                  ATIVIDADE PARA A GEFIN COM A CENTRALIZACAO DE CONTAS A PAGAR
//******************************************************************************
//N. Sol..........: 263608
//N. Kintana......: 1123719
//Data............: 26/10/2015
//Responsável.....: Marcelo Cardoso
//Descrição.......: O valor de carro alugado no sistema Planus auto atendimento
//                  ovalor fica gravado no formulário de destacamento como valor
//                  de passagem e não como valor.
//******************************************************************************
//N. Sol..........: 228736/17139
//N. Kintana......: 761996
//Data............: 27/04/2015
//Responsável.....: Felipe A. Santos
//Descrição.......: Inclusão do bloqueio de destacamento de acordo com o que
//                  está parametrizado na tela de parâmetros do sistemas...
//******************************************************************************
//N. Sol..........: 185596
//N. Kintana......: 1948348
//Data............: 28/01/2013
//Responsável.....: William Santana
//Descrição.......: Desabilitar o campo "Outras" da solicitação de destacamento
//                  e criar itens idividuais para a integ...
//******************************************************************************
//N. Sol..........: 221081
//N. Kintana......: 2053623
//Data............: 27/11/2013
//Responsável.....: William Moreira da Silva
//Descrição.......: O sistema trazia contas bancarias desativadas (.DFM)
//******************************************************************************
//N. Sol..........: 217065
//N. Kintana......: 2046305
//Data............: 19/09/2013
//Responsável.....: Felipe A. Santos
//Descrição.......: mudança do texto Período Previsto para Data do Compromisso
//                  no formulário
//******************************************************************************
//N. Sol..........: 204973
//N. Kintana......: 1982736
//Data............: 16/04/2013
//Responsável.....: William Moreira da Silva
//Descrição.......: Correção do Relatorio, campo Natureza do Serviço/Justifica-
//                  tiva não tem espaço suficiente,cortando o texto
//******************************************************************************
//N. Sol..........: 202546
//N. Kintana......: 1968049
//Data............: 26/03/2013
//Responsável.....: Felipe A. Santos
//Descrição.......: Correção do erro de invalid rowid que é um problema de
//                  incompatibilidade da DLL SLQORA32 com o Oracle 10g.
//******************************************************************************
//N. Sol..........: 199987
//N. Kintana......: 1925452
//Data............: 05/02/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Acerto na função de cálculo de diárias para permitir calculo
//                  de diária em dias iguais
//******************************************************************************
//N. Sol..........: 137269_7601
//N. Kintana......: 829602
//Data............: 26/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novos controles, e rotinas para gerenciar as
//                  integrações
//******************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 24/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Desenvolvimento do Formulario
//******************************************************************************

// Custeio das Despesas:
//      FUNCEF - 50%
//      Empregado - 100%
//      Outras Instituições - 50%

//******************************************************************************

Unit fCadDestacamento;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   wwdblook, StdCtrls, TREdit, CMProcura, wwdbedit, ExtCtrls, DBCtrls,
   ComCtrls, Buttons, TB97, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid,
   wwdbdatetimepicker, CMDateTimePicker, Mask, CMProcuraSubTipo, ImgList,
   TB97Ctls, MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, uCtrlDestacamento,
   uctrlpadroes, uCmRptManager, TXComp, TXRB, ppParameter, ppRegion,
   ppBands, ppClass, ppVar, ppMemo, ppModule, raCodMod, ppCtrls, ppReport,
   ppSubRpt, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, FPreview,
   ppDB, ppDBPipe, ppDBBDE, jpeg, myChkBox, CMProcuraMask, uCmSqlParams,UDataBase;

Type
   TfrmCadDestacamento = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      Status: TStaticText;
      pnlResumo: TPanel;
      dbgResumoValores: TwwDBGrid;
      Panel2: TPanel;
      pcDetalhes: TPageControl;
      tbsViagem: TTabSheet;
      pnlDadosViagem: TPanel;
      Label6: TLabel;
      Label7: TLabel;
      Label10: TLabel;
      dbdtIniTrecho: TCMDateTimePicker;
      dbrgObjetivo: TDBRadioGroup;
      dbeJustificativa: TwwDBEdit;
      dbrgTipoTransporte: TDBRadioGroup;
      dbrgDespTransp: TDBRadioGroup;
      edtValorTransporte: TDBRealEdit;
      pnlCidades: TPanel;
      Label9: TLabel;
      Label15: TLabel;
      Image5: TImage;
      Image6: TImage;
      dblkpAeroD: TwwDBLookupCombo;
      dblkpAeroO: TwwDBLookupCombo;
      Dock974: TDock97;
      Toolbar974: TToolbar97;
      btnInc1: TToolbarButton97;
      btnAlt1: TToolbarButton97;
      Dock973: TDock97;
      tb97Detalhe: TToolbar97;
      btnCon1: TBitBtn;
      btnCan1: TBitBtn;
      tbsAcerto: TTabSheet;
      lblAlimentacao: TLabel;
      lblOutrasDespesas: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Image1: TImage;
      Image2: TImage;
      Image3: TImage;
      Image4: TImage;
      dbeACDiaria: TDBRealEdit;
      dbeACTaxi: TDBRealEdit;
      dbeACTransp: TDBRealEdit;
      dbeACOutras: TDBRealEdit;
      dbrgPROutras: TDBRadioGroup;
      dbrgPRTransporte: TDBRadioGroup;
      dbrgPRTaxi: TDBRadioGroup;
      dbrgPRDiaria: TDBRadioGroup;
      dbeJustificaAcerto: TwwDBEdit;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      MSDestacamento: TMontaSelect;
      MontaSelectCidade: TMontaSelect;
      MontaSelectFunc: TMontaSelect;
      qryAux: TQuery;
      DevRpt: TExtraOptions;
      rbFormularioDestacamento: TppReport;
      ppTitleBand3: TppTitleBand;
      lblTituloRelatorio: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape43: TppShape;
      ppLabel4: TppLabel;
      ppDBText28: TppDBText;
      ppParameterList1: TppParameterList;
      ppDestacamento: TppBDEPipeline;
      qryCargoLotacao: TwwQuery;
      qryCargoLotacaoMATRICULA: TStringField;
      qryCargoLotacaoIDCARGOFUN: TFloatField;
      qryCargoLotacaoCARGO: TStringField;
      qryCargoLotacaoLOTACAO: TStringField;
      qryDestacamento: TwwQuery;
      qryDestacamentoIDDESTACAMENTO: TFloatField;
      qryDestacamentoDATALANCAMENTO: TDateTimeField;
      qryDestacamentoIDPESSOA: TFloatField;
      qryDestacamentoFLGPARTDIAANT: TStringField;
      qryDestacamentoFLGRETDIAPOST: TStringField;
      qryDestacamentoVLRACERTOCONTAS1: TFloatField;
      qryDestacamentoVLRACERTOCONTAS2: TFloatField;
      qryDestacamentoVLRACERTOCONTAS3: TFloatField;
      qryDestacamentoVLRACERTOCONTAS4: TFloatField;
      qryDestacamentoFLGACERTOCONTASPR1: TStringField;
      qryDestacamentoFLGACERTOCONTASPR2: TStringField;
      qryDestacamentoFLGACERTOCONTASPR3: TStringField;
      qryDestacamentoFLGACERTOCONTASPR4: TStringField;
      dsDestacamento: TwwDataSource;
      dsCargoLotacao: TwwDataSource;
      ImageList1: TImageList;
      qryResumoValores: TwwQuery;
      dsResumoValores: TwwDataSource;
      ppCargoLotacao: TppBDEPipeline;
      qryUFO: TwwQuery;
      qryUFOCODESTADO: TStringField;
      dsUFO: TwwDataSource;
      qryUFD: TwwQuery;
      StringField4: TStringField;
      dsUFD: TwwDataSource;
      qryLkpAeroportoO: TwwQuery;
      qryLkpAeroportoONMEAEROPORTO: TStringField;
      qryLkpAeroportoOIDDSTAEROPORTO: TFloatField;
      qryLkpAeroportoOIDCIDADES: TFloatField;
      qryLkpAeroportoD: TwwQuery;
      StringField1: TStringField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      dsLkpCidadeD: TDataSource;
      qryLkpCidadeD: TwwQuery;
      FloatField3: TFloatField;
      StringField2: TStringField;
      StringField3: TStringField;
      dsLkpCidadeO: TDataSource;
      qryLkpCidadeO: TwwQuery;
      qryLkpCidadeOIDCIDADES: TFloatField;
      qryLkpCidadeONOME: TStringField;
      qryLkpCidadeOCODESTADO: TStringField;
      dsDstTrecho: TwwDataSource;
      qryValorDiariaCargo: TwwQuery;
      dsValorDiariaCargo: TwwDataSource;
      qryValorDiariaCargoIDCARGO: TFloatField;
      qryValorDiariaCargoVLRDST: TFloatField;
      qryResumoValoresIDITEM: TFloatField;
      qryResumoValoresDSCITEM: TStringField;
      qryResumoValoresVLRITEM: TFloatField;
      qryAux2: TQuery;
      DBCheckBox1: TDBCheckBox;
      Label16: TLabel;
      edQtdDiarias: TEdit;
      Label17: TLabel;
      edQtdTrechos: TEdit;
      Image7: TImage;
      Image8: TImage;
      dbcbTaxiO: TDBCheckBox;
      dbcbTaxiD: TDBCheckBox;
      spbRenumera: TSpeedButton;
      qryDestacamentoNROGEDOC: TStringField;
      qryEmpresa: TwwQuery;
      qryEmpresaIDPESSOA: TFloatField;
      qryEmpresaNOMEEMPRESA: TStringField;
      qryEmpresaRAZAOSOCIAL: TStringField;
      qryEmpresaIDENDERECO: TFloatField;
      qryEmpresaCEP: TStringField;
      qryEmpresaIMAGEM: TBlobField;
      ppEmpresa: TppBDEPipeline;
      dsEmpresa: TwwDataSource;
      ppDBImage2: TppDBImage;
      ppDBText4: TppDBText;
      ppShape1: TppShape;
      ppShape2: TppShape;
      qryCargoLotacaoNOME: TStringField;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppContaCor: TppBDEPipeline;
      ppLabel3: TppLabel;
      ppShape3: TppShape;
      ppDBText3: TppDBText;
      ppLabel5: TppLabel;
      ppShape4: TppShape;
      ppDBText5: TppDBText;
      ppShape5: TppShape;
      ppShape6: TppShape;
      ppShape7: TppShape;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppShape8: TppShape;
      pplblDestino: TppLabel;
      pplblPeriodo: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppShape9: TppShape;
      pplblMeioTransp: TppLabel;
      ppLabel14: TppLabel;
      ppLabel13: TppLabel;
      ppShape10: TppShape;
      ppLabel15: TppLabel;
      ppShape11: TppShape;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppShape12: TppShape;
      ppShape13: TppShape;
      ppShape14: TppShape;
      ppShape15: TppShape;
      ppShape16: TppShape;
      ppShape17: TppShape;
      ppShape18: TppShape;
      ppShape19: TppShape;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppShape20: TppShape;
      ppShape21: TppShape;
      ppShape22: TppShape;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppVlInt: TppLabel;
      ppQtdInt: TppLabel;
      ppTotGeral: TppLabel;
      ppTotInt: TppLabel;
      ppVlRed: TppLabel;
      ppQtdRed: TppLabel;
      ppTotRed: TppLabel;
      ppValorDiariaCargo: TppBDEPipeline;
      ppSomaGeral: TppLabel;
    pplVlrCotacaoP: TppLabel;
      ppShape23: TppShape;
    pplVlrTotHosp: TppLabel;
      ppShape25: TppShape;
    pplTotal1_2: TppLabel;
      ppShape26: TppShape;
      ppVlTransp: TppLabel;
      ppVlAluguelCarro: TppLabel;   // Marcelo Cardoso - SOL263608 PPM:1123719
      ppFooterBand1: TppFooterBand;
      ppSystemVariable1: TppSystemVariable;
      ppShape27: TppShape;
      ppDBText6: TppDBText;
      ppLabel49: TppLabel;
      qryValorDiariaCargoMOESIGLA: TStringField;
      qryDestacamentoCODDOCDESTAC: TFloatField;
      qryDestacamentoCODDOCACERTO: TFloatField;
      qryDocDestac: TQuery;
      dsDocDestac: TDataSource;
      qryDocDestacNODOCUMENTO: TFloatField;
      qryCargoLotacaoCODCENTROCUSTO: TStringField;
      tbsDadosIntegra: TTabSheet;
      qryDestacamentoCODCENTRORESPON: TStringField;
      qryLkpCentroRespon: TwwQuery;
      qryLkpCentroResponCODCENTRORESPON: TStringField;
      qryLkpCentroResponNOME: TStringField;
      qryDestacamentoDATAPAGTODESTAC: TDateTimeField;
      qryDestacamentoDATAPAGTOACERTO: TDateTimeField;
      qryDocAcerto: TQuery;
      FloatField4: TFloatField;
      dsDocAcerto: TDataSource;
      qryDestacamentoDATALANCACERTOCONTAS: TDateTimeField;
      Label25: TLabel;
      dbDataLancAcerto: TCMDateTimePicker;
      qryDestacamentoCODCENTROCUSTO: TStringField;
      qryCargoLotacaoTIPOCONTRATO: TStringField;
      qryCargoLotacaoDSCTIPOCONTRATO: TStringField;
      qryDestacamentoIDEMPRESA: TFloatField;
      GroupBox1: TGroupBox;
      GroupBox2: TGroupBox;
      qryDestacamentoFLGLANCAFOLHA: TFloatField;
      qryDestacamentoFLGLANCAFOLHAACERTO: TFloatField;
      sbtnImprimir: TToolbarButton97;
      sbtnExcluirIntegracoes: TSpeedButton;
      pnlIntegracoes: TPanel;
      Label26: TLabel;
      Label22: TLabel;
      dbDataPagtoDestac: TCMDateTimePicker;
      Label20: TLabel;
      dbeNumAPDestac: TDBEdit;
      Label27: TLabel;
      Label24: TLabel;
      dbDataPagtoAcerto: TCMDateTimePicker;
      Label21: TLabel;
      dbeNumAPAcerto: TDBEdit;
      Panel5: TPanel;
      spbExcluiFolhaAContas: TSpeedButton;
      Panel3: TPanel;
      spbExcluiFinanAcerto: TSpeedButton;
      Panel4: TPanel;
      btnExc1: TToolbarButton97;
      qryResumoValoresTIPOQUALIFICACAO: TStringField;
      qryResumoValoresSEQAPRESRESUMO: TFloatField;
      qryDocAcertoRECPAG: TStringField;
      Label29: TLabel;
      dbePR: TDBEdit;
      Panel1: TPanel;
      imgAdiantFolOK: TImage;
      Label30: TLabel;
      imgAdiantFolNAOOK: TImage;
      imgFAOK: TImage;
      imgFANAOOK: TImage;
      imgFCOK: TImage;
      imgFCNAOOK: TImage;
      imgAcertoFolOK: TImage;
      Label31: TLabel;
      imgAcertoFolNAOOK: TImage;
      spbExcluiFolhaAdiant: TSpeedButton;
      spbExcluiFinanAdiant: TSpeedButton;
      rbResumoDestacamento: TppReport;
      ppTitleBand1: TppTitleBand;
      ppShape28: TppShape;
      ppLabel50: TppLabel;
      ppDBImage1: TppDBImage;
      ppDBText7: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppParameterList2: TppParameterList;
      ppSummaryBand1: TppSummaryBand;
      ppSubRepTrechos: TppSubReport;
      ppChildReport2: TppChildReport;
      ppLabel52: TppLabel;
      ppDBText8: TppDBText;
      ppLabel53: TppLabel;
      ppDBText9: TppDBText;
      ppLabel56: TppLabel;
      ppDBText12: TppDBText;
      ppDetailBand3: TppDetailBand;
      ppShape29: TppShape;
      ppLabel51: TppLabel;
      ppShape30: TppShape;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppDBText10: TppDBText;
      ppLabel57: TppLabel;
      ppDBText11: TppDBText;
      ppLabel58: TppLabel;
      ppDBText13: TppDBText;
      ppLabel59: TppLabel;
      ppDBText14: TppDBText;
      ppLabel60: TppLabel;
      ppDBText15: TppDBText;
      ppSystemVariable2: TppSystemVariable;
      ppTrechos: TppBDEPipeline;
      ppTitleBand2: TppTitleBand;
      ppShape31: TppShape;
      ppLabel62: TppLabel;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppSubRepResumo: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand4: TppTitleBand;
      ppShape32: TppShape;
      ppLabel65: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppResumoVal: TppBDEPipeline;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppLabel66: TppLabel;
      ppDBDescItem: TppDBText;
      ppDBVlrItem: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppDBText27: TppDBText;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      ppLabel74: TppLabel;
      ppShape33: TppShape;
      ppSubRepIntegracao: TppSubReport;
      ppChildReport3: TppChildReport;
      ppTitleBand5: TppTitleBand;
      ppShape34: TppShape;
      ppLabel75: TppLabel;
      ppDetailBand5: TppDetailBand;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppLabel76: TppLabel;
      ppLabel77: TppLabel;
      ppLabel78: TppLabel;
      ppLabel79: TppLabel;
      ppLabel80: TppLabel;
      ppLabel81: TppLabel;
      ppLabel82: TppLabel;
      ppLabel83: TppLabel;
      ppLabel84: TppLabel;
      ppShape35: TppShape;
      ppSubRepAcertoContas: TppSubReport;
      ppChildReport4: TppChildReport;
      ppTitleBand6: TppTitleBand;
      ppDetailBand6: TppDetailBand;
      ppShape36: TppShape;
      ppLabel85: TppLabel;
      ppLabel86: TppLabel;
      ppLabel87: TppLabel;
      ppDBText34: TppDBText;
      ppDBText38: TppDBText;
      ppLabel89: TppLabel;
      ppDBText35: TppDBText;
      ppShape37: TppShape;
      ppSummaryBand3: TppSummaryBand;
      pplblDC1: TppLabel;
      pplblDC2: TppLabel;
      pplblDC3: TppLabel;
      spbImpEspelhoDest: TToolbarButton97;
      ppCentroResp: TppBDEPipeline;
      dsLkpCentroRespon: TwwDataSource;
      ppDBText37: TppDBText;
      ppDocDestac: TppBDEPipeline;
      ppDocAcerto: TppBDEPipeline;
      ppLbl3: TppLabel;
      pplbl4: TppLabel;
      ppDBText39: TppDBText;
      ppLabel90: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      qryInserirDestacamentoXItemDespesa: TQuery;
      qryDestacamentoINDOBJETIVO: TFloatField;
      dbeMesRefAdiant: TDBEdit;
      dbeMesRefAcerto: TDBEdit;
      Label33: TLabel;
      qryDestacamentoANOMESREFADIANT: TStringField;
      qryDestacamentoANOMESREFACERTO: TStringField;
      qryCentroRespon: TwwQuery;
      StringField5: TStringField;
      StringField6: TStringField;
      dsCentroRespon: TwwDataSource;
      qryDestacamentoIDCARGO: TFloatField;
      Label34: TLabel;
      Label35: TLabel;
      DBRealEdit1: TDBRealEdit;
      dbrgLocal: TDBRadioGroup;
      qryValorDiariaCargoMOECODIGO: TFloatField;
      DBRealEdit2: TDBRealEdit;
      wwDBLookupCombo1: TwwDBLookupCombo;
      qryLkpMoeda: TwwQuery;
      dsLkpMoeda: TwwDataSource;
      qryLkpMoedaMOECODIGO: TFloatField;
      qryLkpMoedaMOESIGLA: TStringField;
      Label19: TLabel;
      Image9: TImage;
      DBEdit4: TDBEdit;
      qryValorDiariaCargoDESCRICAO: TStringField;
      qryCargoGrupos: TwwQuery;
      dsCargoGrupos: TwwDataSource;
      qryCargoGruposDESCRICAO: TStringField;
      qryDestacamentoTIPOMOTIVONAOINTEGRACAO: TStringField;
      qryLkpFormaPag: TwwQuery;
      dsLkpFormaPag: TwwDataSource;
      qryLkpFormaPagCODFORMA: TFloatField;
      qryLkpFormaPagRECPAG: TStringField;
      qryLkpFormaPagDESCRICAO: TStringField;
      qryDestacamentoCODFORMAPAG: TFloatField;
      qryDestacamentoCODFORMAREC: TFloatField;
      qryLkpFormaRec: TwwQuery;
      StringField7: TStringField;
      FloatField5: TFloatField;
      StringField8: TStringField;
      dsLkpFormaRec: TwwDataSource;
      qryCargoGruposIDDSTTARIFA: TFloatField;
      Label37: TLabel;
      dblkFormaPAG: TwwDBLookupCombo;
      Label36: TLabel;
      dblkFormaREC: TwwDBLookupCombo;
      qryDestacamentoJUSTIFICATIVA: TMemoField;
      ppDBText16: TppDBText;
      ppLabel61: TppLabel;
      myDBCheckBox1: TmyDBCheckBox;
      myDBCheckBox2: TmyDBCheckBox;
      ppLabel92: TppLabel;
      ppLabel93: TppLabel;
      pplblJustificativa: TppMemo;
      myDBCheckBox3: TmyDBCheckBox;
      ppLabel47: TppLabel;
      myDBCheckBox4: TmyDBCheckBox;
      ppLabel94: TppLabel;
      ppFormaPag: TppBDEPipeline;
      ppFormaRec: TppBDEPipeline;
      ppDBText17: TppDBText;
      ppDBText40: TppDBText;
      ppLabel95: TppLabel;
      ppLabel96: TppLabel;
      stUsuarioAlteraPagto: TStaticText;
      qryLkpContasBanco: TwwQuery;
      dsLkpContasBanco: TwwDataSource;
      qryDestacamentoIDCBANCARIA: TFloatField;
      qryLkpContasBancoDESCTIPOCONTA: TStringField;
      qryLkpContasBancoCONTACORRENTE: TStringField;
      qryLkpContasBancoIDCBANCARIA: TFloatField;
      qryLkpContasBancoCONTAPREF: TStringField;
      DBRadioGroup1: TDBRadioGroup;
      qryCargoLotacaoIDPROGRAMA: TFloatField;
      qryDestacamentoIDPROGRAMA: TFloatField;
      qryValorDiariaCargoIDDSTVALORES: TFloatField;
      ppVlTaxi: TppMemo;
      qryDstTrecho: TwwQuery;
      qryDstTrechoIDDESTACAMENTO: TFloatField;
      qryDstTrechoNUMSEQ: TFloatField;
      qryDstTrechoDATAINI: TDateTimeField;
      qryDstTrechoINDTRANSPORTE: TFloatField;
      qryDstTrechoINDOBJETIVO: TFloatField;
      qryDstTrechoIDCIDADES: TFloatField;
      qryDstTrechoIDCIDADEORIG: TFloatField;
      qryDstTrechoINDCUSTEIODESPESA: TFloatField;
      qryDstTrechoFLGTAXIORIG: TStringField;
      qryDstTrechoFLGTAXIDEST: TStringField;
      qryDstTrechoIDDSTAEROPORTOORIG: TFloatField;
      qryDstTrechoIDDSTAEROPORTODEST: TFloatField;
      qryDstTrechoVLRTRANSPORTE: TFloatField;
      qryDstTrechoDSCOBJETIVO: TStringField;
      qryDstTrechoDSCTPTRANSPORTE: TStringField;
      qryDstTrechoDSCCUSTEIODESPESA: TStringField;
      qryDstTrechoNMECIDADEDEST: TStringField;
      qryDstTrechoFLGKMMINIMO: TStringField;
      qryDstTrechoFLGCALCULADIARIA: TStringField;
      qryDstTrechoVLRTAXITRECHO: TFloatField;
      qryDstTrechoNMECIDADEORIG: TStringField;
      qryDstTrechoVLRDIARIATRECHO: TFloatField;
      qryDstTrechoQTDDIARIATRECHO: TFloatField;
      qryDstTrechoTIPOLOCAL: TStringField;
      qryDstTrechoMOECODIGO: TFloatField;
      qryDstTrechoVLRDIARIAGRUPO: TFloatField;
      qryDstTrechoVLRCOTACAOMOEDA: TFloatField;
      qryDstTrechoOBSERVACAO: TMemoField;
      qryDstTrechoVLTAXIORIG: TFloatField;
      qryDstTrechoVLTAXIDEST: TFloatField;
      qryDstTrechoIDDSTVALORES_DIARIA: TFloatField;
      qryDstTrechoIDDSTVALORESTAXI_ORIG: TFloatField;
      qryDstTrechoIDDSTVALORESTAXI_DEST: TFloatField;
      dbgViagem: TwwDBGrid;
      dbgViagemIButton: TwwIButton;
      qryDstTrechoVLRDIARIAREFER: TFloatField;
    updDstTrecho: TUpdateSQL;
    lblEdVlrTotCotP: TLabel;
    ImgEdVlrTotCotP: TImage;
    lblVlrCotPassagem: TLabel;
    dbedtVlrCotPassagem: TDBRealEdit;
    qryDestacamentoFLGSUBSTITUICAO: TStringField;
    qrydsFuncSub: TwwQuery;
    qryDestacamentoIDFUNCAOSUBST: TFloatField;
    qryDestacamentoVLRHOSPEDAGEMTOTAL: TFloatField;
    pspFuncaoSub: TppShape;
    plblFuncaoSubst: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel39: TppLabel;
    Label32: TLabel;
    ppLabel40: TppLabel;
    pplblVlrHosp: TppLabel;
    pplblVlrCotP: TppLabel;
    qryAUX3: TwwQuery;
    qryDstTrechoVLRCOTACAOPASSAGEM: TFloatField;
    EdVlrTotCotP: TEdit;
    lblFuncSub: TppLabel;
    ppVlrTotHospSub: TppLabel;
    ppVlrTotCotPSub: TppLabel;
    pnlDadosPrincipal: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label18: TLabel;
    Label28: TLabel;
    Label23: TLabel;
    Label38: TLabel;
    lblHospedTotal: TLabel;
    lblFuncaoSubst: TLabel;
    lblEmSubstituicao: TLabel;
    Label11: TLabel;
    dbcbxEmSubstituicao: TCheckBox;
    dbedNumero: TDBEdit;
    DBEdit1: TDBEdit;
    dblkpCentroRespon: TwwDBLookupCombo;
    CMProcuraDestacado: TCMProcura;
    dbcbPartidaDiaAnt: TDBCheckBox;
    dbcbRetDiaAnt: TDBCheckBox;
    dbeNumGEDOC: TDBEdit;
    dbLkpContaBancaria: TwwDBLookupCombo;
    dbedtHospedTotal: TDBRealEdit;
    dblkFuncaoSubst: TwwDBLookupCombo;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    CMDateTimePicker2: TCMDateTimePicker;
    pnlCidBusca: TPanel;
    ProcuraCidadeO: TCMProcura;
    lblCidOrig: TLabel;
    Label3: TLabel;
    ProcuraCidadeD: TCMProcura;
    ppFuncSub02: TppLabel;
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure CMProcuraDestacadoValidaDados(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure qryDstTrechoAfterScroll(DataSet: TDataSet);
      Procedure pcDetalhesChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure dbgResumoValoresDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure btnInc1Click(Sender: TObject);
      Procedure btnAlt1Click(Sender: TObject);
      Procedure btnCon1Click(Sender: TObject);
      Procedure btnCan1Click(Sender: TObject);
      Procedure dbrgTipoTransporteClick(Sender: TObject);
      Procedure ProcuraCidadeOValidaDados(Sender: TObject);
      Procedure ProcuraCidadeDValidaDados(Sender: TObject);
      Procedure qryDstTrechoCalcFields(DataSet: TDataSet);
      Procedure dbgViagemDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure dbgViagemIButtonClick(Sender: TObject);
      Procedure spbRenumeraClick(Sender: TObject);
      Procedure dbDataLancAcertoExit(Sender: TObject);
      Procedure dbeACDiariaExit(Sender: TObject);
      Procedure dbeACTaxiExit(Sender: TObject);
      Procedure dbeACTranspExit(Sender: TObject);
      Procedure dbeACOutrasExit(Sender: TObject);
      Procedure sbtnImprimirClick(Sender: TObject);
      Procedure sbtnExcluirIntegracoesClick(Sender: TObject);
      Procedure spbExcluiFinanAcertoClick(Sender: TObject);
      Procedure spbExcluiFinanAdiantClick(Sender: TObject);
      Procedure btnExc1Click(Sender: TObject);
      Procedure dblkpAeroOEnter(Sender: TObject);
      Procedure dblkpAeroDEnter(Sender: TObject);
      Procedure spbExcluiFolhaAdiantClick(Sender: TObject);
      Procedure spbExcluiFolhaAContasClick(Sender: TObject);
      Procedure ppDetailBand4BeforePrint(Sender: TObject);
      Procedure ppDetailBand5BeforePrint(Sender: TObject);
      Procedure ppDetailBand6AfterGenerate(Sender: TObject);
      Procedure spbImpEspelhoDestClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbrgLocalChange(Sender: TObject);
      Procedure dbdtIniTrechoExit(Sender: TObject);
      Procedure dbLkpContaBancariaEnter(Sender: TObject);
    procedure dbcbxEmSubstituicaoClick(Sender: TObject);
    procedure rbFormularioDestacamentoBeforePrint(Sender: TObject);
    procedure rbResumoDestacamentoBeforePrint(Sender: TObject);
    procedure ppDetailBand4BeforeGenerate(Sender: TObject);
    procedure dblkFuncaoSubstChange(Sender: TObject);
    procedure dbrgTipoTransporteExit(Sender: TObject);
    procedure dblkpAeroDExit(Sender: TObject);
    procedure dblkpAeroOExit(Sender: TObject);
    procedure dbrgDespTranspClick(Sender: TObject); // SIG 70193 - Osni Cavalcante //Taffarel - SIG81771
    procedure dblkpCentroResponEnter(Sender: TObject); 
   Private
      { Private declarations }
      CtrlDestacamento: TCtrlDestacamento;
      iContaValores: Integer;//Darivaldo Alencar SIG 27767
      bOptou: boolean;//Darivaldo Alencar SIG 27767
      dDataDesbloqueio : TDateTime; // Felipe A. Santos SOL 228736/17139 PPM 761996
      Procedure AtualizaDataPagtoDestacamento;
      Procedure TemDoctoIntegrado(Var iSitIntegracao: Integer);
      Procedure AtualizarTabelaDestacamentoXItemDespesa(sTipoQualificacao: String);
      Procedure TotalDoAcertoDeContas(Var dTotalDoAcertoDeContas: Double);

      Function LocalizaDestacamento(IdDestacamento: Double): Boolean;
      Function CalcularDiarias: Double;
      Function QuantidadeDeTrechos: Integer;
      function VlrCotacaoPassagem: String;//Darivaldo Alencar SIG 27767
      Function QuantidadeDeDiarias: Double;
      Function LocalizaValorTaxi(Const idDstAeroporto: Integer; Var sIdDstValoresTaxi: String): Double;
      Function LocalizaSeTemTrechoLancadoComMesmaData(Const idDestacamento: Integer; dataini: Tdatetime): TDateTime;
      Function LocalizaValorAcertoDeContas: Double;
      Function LocalizaDataInicialTrecho(Const idDestacamento: Integer): TDateTime;
      Function UsuarioBloqueado : Boolean;  // Felipe A. Santos SOL 228736/17139 PPM 761996
   Public
      { Public declarations }
   End;

Var
   frmCadDestacamento: TfrmCadDestacamento;
   dValorFixoTaxi, dPercentAcrescimoDiaria, dPercentReducaoDiaria, dTotalDoAcertoDeContas: Double;
   DataIniAnt: TdateTime;
   bSugerirImpressaoFormulario, bExclusaoFinAdiantSucesso, bExclusaoFinAcertoSucesso, bExclusaoFolAdiantSucesso,
      bExclusaoFolAcertoSucesso, bDestacTrechoAlterar, bDestacTrechoInserido: Boolean;
   iSitIntegracao: Integer;
   DataPagtoDestac: TdateTime;
   sIdDstValoresTaxi: String;

Implementation

Uses uCtrlFuncoesRH, UMensErro, uSistema, uCtrlParamIntegra, rDestacamento, DBaseDados;

{$R *.DFM}

Procedure TfrmCadDestacamento.FormCreate(Sender: TObject);
Begin
   CtrlDestacamento := TCtrlDestacamento.Create(Sistema);
   CtrlDestacamento.InitializeAs(Padroes);

   dPercentAcrescimoDiaria := 0.00;
   dPercentReducaoDiaria := 0.00;
   ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

   Screen.Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT VLRPERCENTACRESCIMODIARIA, VLRPERCENTREDUCAODIARIA, VLRFIXOTAXITRECHO FROM PARAMRH');
   qryAux.Open;
   Screen.Cursor := crDefault;

   dValorFixoTaxi := qryAux.fieldbyname('VLRFIXOTAXITRECHO').asFloat; // Valor fixo para o taxi, quando Rodoviário e Ferroviário
   If qryAux.fieldbyname('VLRPERCENTACRESCIMODIARIA').asFloat <> 0 Then
      dPercentAcrescimoDiaria := qryAux.fieldbyname('VLRPERCENTACRESCIMODIARIA').asFloat / 100; // % de Custeio (FUNCEF e Outras)
   If qryAux.fieldbyname('VLRPERCENTREDUCAODIARIA').asFloat <> 0 Then
      dPercentReducaoDiaria := qryAux.fieldbyname('VLRPERCENTREDUCAODIARIA').asFloat / 100; // % de redução da diária - Empregado
   qryAux.Close;

   //Darivaldo Alencar SIG 27767 -inicio
   dblkFuncaoSubst.Enabled  := dbcbxEmSubstituicao.checked;
   lblEmSubstituicao.Caption:= 'Em'+#13#10+'Substituição';
   lblEmSubstituicao.top    := dbcbxEmSubstituicao.top -4;
   lblEmSubstituicao.left   := dbcbxEmSubstituicao.left +16;
   lblEmSubstituicao.Enabled:= false;

    qrydsFuncSub.close;
    qrydsFuncSub.open;

    dbcbxEmSubstituicaoClick(self);

    ppDetailBand4.Height:= 4.498;
    pplblVlrCotP.top    := ppDBDescItem.top ;
    pplblVlrCotP.left   := pplblVlrHosp.left;
    ppVlrTotCotPSub.top := pplblVlrCotP.top;
    ppVlrTotCotPSub.left:= ppVlrTotHospSub.left;
    bOptou:= False;
   //Darivaldo Alencar SIG 27767 -fim
End;

Procedure TfrmCadDestacamento.FormShow(Sender: TObject);
Begin
   bSugerirImpressaoFormulario := False;
   bDestacTrechoAlterar := False;
   bDestacTrechoInserido := False;

   bExclusaoFinAdiantSucesso := False;
   bExclusaoFinAcertoSucesso := False;
   bExclusaoFolAdiantSucesso := False;
   bExclusaoFolAcertoSucesso := False;

   pnlDadosPrincipal.enabled := False;
   pcDetalhes.ActivePageIndex := 0;
   tbsViagem.enabled := False;
   tbsAcerto.enabled := False;
   sbtnExcluirIntegracoes.Enabled := False;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   btnInc1.enabled := False;
   btnAlt1.enabled := False;
   btnExc1.enabled := False;
   btnCon1.Enabled := False;
   btnCan1.Enabled := False;

   dbcbPartidaDiaAnt.Enabled := False;
   dbcbRetDiaAnt.Enabled := False;

   stUsuarioAlteraPagto.Visible := false;

   Screen.Cursor := crSQLWait;
   qryLkpAeroportoO.Close;
   qryLkpAeroportoO.Open;
   qryLkpAeroportoD.Close;
   qryLkpAeroportoD.Open;
   qryLkpCidadeO.Close;
   qryLkpCidadeO.Open;
   qryLkpCidadeD.Close;
   qryLkpCidadeD.Open;
   qryUFO.Close;
   qryUFO.Open;
   qryUFD.Close;
   qryUFD.Open;
   qryLkpCentroRespon.Close;
   qryLkpCentroRespon.Open;
   qryLkpFormaPag.Close;
   qryLkpFormaPag.Open;
   qryLkpFormaRec.Close;
   qryLkpFormaRec.Open;
   qryLkpContasBanco.Close;
   qryLkpContasBanco.Open;
   Screen.Cursor := crDefault;

   // Se chamado pela unit Destacamento Pendente, então, mostra o cadastro de destacamento somente para consulta
   If frmCadDestacamento.Tag > 0 Then
      Begin
         sbtnInserir.enabled := False;
         sbtnAlterar.enabled := False;
         sbtnApagar.enabled := False;
         sbtnProcurar.enabled := False;
         sbtnImprimir.enabled := False;
         spbImpEspelhoDest.enabled := False;
         sbtnExcluirIntegracoes.Enabled := False;
         spbRenumera.enabled := False;
         bbtnConfirmar.enabled := False;
         bbtnCancelar.enabled := False;
         tbsViagem.enabled := True;
         dbgViagem.enabled := True;

         LocalizaDestacamento(frmCadDestacamento.Tag);
      End;
End;

Procedure TfrmCadDestacamento.sbtnInserirClick(Sender: TObject);
Begin
   sbtnInserir.Down := True;
   Try
      If qryDestacamento.State <> dsInsert Then
         Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            Status.caption := 'Inserindo';
            edQtdTrechos.Text := '0';
            edQtdDiarias.Text := '0';
            EdVlrTotCotP.Text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767

            sbtnAlterar.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            sbtnImprimir.enabled := False;
            spbImpEspelhoDest.enabled := False;
            sbtnExcluirIntegracoes.Enabled := False;

            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            pnlDadosPrincipal.enabled := True;
            tbsAcerto.enabled := False;
            tbsDadosIntegra.enabled := False;
            tbsViagem.enabled := False;

            dbcbPartidaDiaAnt.Enabled := False;
            dbcbRetDiaAnt.Enabled := False;

            qryDestacamento.Open;
            qryDestacamento.Insert;
            
            qryDestacamento.FieldByName('INDOBJETIVO').AsInteger := 0; // Institucional
            //qryDestacamento.FieldByName('CODCENTRORESPON').AsString := '10004'; // Gestor sugeriu ser sempre GEAPE //Everson Cunha - SIG49075
            //qryDestacamento.FieldByName('CODCENTRORESPON').AsString := '10004'; // Gestor sugeriu ser sempre GEAPE
            //William Moreira da Silva - SIG35255 - Inicio
			      //qryDestacamento.FieldByName('CODCENTRORESPON').AsString := '10077';     // SIG31813 - Marcelo Cardoso - Corretiva para ser GEFIN
            //qryDestacamento.FieldByName('CODCENTRORESPON').AsString := '10004'; //Everson Cunha - SIG49075
            //William Moreira da Silva - SIG35255 - Fim
            qryDestacamento.FieldByName('FLGPARTDIAANT').AsString := 'N'; // Não
            qryDestacamento.FieldByName('FLGRETDIAPOST').AsString := 'N'; // Não
            qryDestacamento.FieldByName('CODFORMAPAG').AsInteger := 10; // Credito em C/C na CAIXA
            qryDestacamento.FieldByName('CODFORMAREC').AsInteger := 8; // On Line

            lblEmSubstituicao.Enabled:= True ;//Darivaldo Alencar Sig 27767
            dblkFuncaoSubst.Enabled  := dbcbxEmSubstituicao.checked; //Darivaldo Alencar Sig 27767
            dbcbxEmSubstituicao.Checked:= false; //Darivaldo Alencar SIG 27767
            
            CMProcuraDestacado.setfocus;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDestacamento.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryDestacamento.isEmpty Then
      Begin
         sbtnAlterar.Down := True;
         If qryDestacamento.State <> dsEdit Then
            Begin
               TemDoctoIntegrado(iSitIntegracao);
               If iSitIntegracao <> 2 Then
                  Begin
                     Try
                        If Not dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.StartTransaction;

                        Status.caption := 'Alterando';

                        sbtnInserir.enabled := False;
                        sbtnApagar.enabled := False;
                        sbtnProcurar.enabled := False;
                        sbtnImprimir.enabled := False;
                        spbImpEspelhoDest.enabled := False;
                        sbtnExcluirIntegracoes.enabled := False;

                        bbtnConfirmar.enabled := True;
                        bbtnCancelar.enabled := True;

                        pnlDadosPrincipal.enabled := True;
                        tbsAcerto.enabled := True;
                        tbsViagem.enabled := False;

                        qryDestacamento.Edit;

                        If iSitIntegracao = 0 Then // Liberado Geral, exceto o painel da Viagem
                           Begin
                              // Libera quem está neste grupo para poder alterar dados da integração
                              tbsDadosIntegra.enabled := CtrlDestacamento.LiberaAcessosParaManutencao(Sistema.IdUsuario, 'GEAPE - DESTA. (Alt)');
                              stUsuarioAlteraPagto.Visible := Not tbsDadosIntegra.enabled;
                           End;

                        If iSitIntegracao = 1 Then // Liberado somente o painel do Acerto
                           Begin
                              pnlDadosPrincipal.enabled := False;
                              tbsDadosIntegra.enabled := False;
                              pcDetalhes.ActivePageIndex := 1;
                              dbDataLancAcerto.Setfocus;
                           End;

                        If iSitIntegracao = 3 Then // Painel de Integração não liberado
                           tbsDadosIntegra.enabled := False;
                     Except
                        bbtnCancelarClick(Self);
                        Raise;
                     End;
                  End
               Else
                  sbtnAlterar.Down := False;
            End;
      End
   Else
      Begin
         Application.MessageBox('Sem Destacamento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnAlterar.down := False;
      End;
     lblEmSubstituicao.Enabled:= True ;//Darivaldo Alencar Sig 27767
     dblkFuncaoSubst.Enabled  := dbcbxEmSubstituicao.checked; //Darivaldo Alencar Sig 27767
End;

Procedure TfrmCadDestacamento.sbtnApagarClick(Sender: TObject);
Var sTipo, sMesRef: String;
Begin
   If Not qryDestacamento.isEmpty Then
      Begin
         Try
            TemDoctoIntegrado(iSitIntegracao);
            If iSitIntegracao <> 2 Then
               Begin
                  If MsgDlg('Confirma Exclusão desse Destacamento ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        If Not dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.StartTransaction;

                        // Há Integrações Financeiras
                        If (Not qryDestacamento.fieldByname('CODDOCDESTAC').isnull) Or
                           (Not qryDestacamento.fieldByname('CODDOCACERTO').isnull) Then
                           Begin
                              If Not CtrlDestacamento.ExcluirDadosDaIntegracaoFinanceira(
                                 teExcluirTudo,
                                 qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger,
                                 qryDestacamento.fieldByname('CODDOCDESTAC').asInteger,
                                 qryDestacamento.fieldByname('CODDOCACERTO').asInteger) Then
                                 Begin
                                    Application.MessageBox(pchar(ctrlDestacamento.MessageInfo), 'Atenção !', Mb_IconExclamation);
                                    exit;
                                 End;
                           End;

                        // Há Integrações de Folha
                        If (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1) Or
                           (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1) Then
                           Begin
                              If (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1) Then
                                 Begin
                                    sTipo := 'A'; // Adiantamento
                                    sMesRef := qryDestacamento.fieldByname('ANOMESREFADIANT').asString;
                                 End;
                              If (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1) Then
                                 Begin
                                    sTipo := 'C'; // Acerto de Contas
                                    sMesRef := qryDestacamento.fieldByname('ANOMESREFACERTO').asString;
                                 End;

                              If Not CtrlDestacamento.ExcluirDadosDaIntegracaoFolhaPagto(
                                 qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger,
                                 qryDestacamento.fieldByname('IDPESSOA').asInteger,
                                 sTipo,
                                 sMesRef,
                                 CMProcuraDestacado.Text) Then
                                 Begin
                                    Application.MessageBox(pchar(ctrlDestacamento.MessageInfo), 'Atenção !', Mb_IconExclamation);
                                    exit;
                                 End;
                           End;

                        qryDestacamento.Delete;

                        dtmBaseDados.dbBaseDados.Commit;
                        Screen.Cursor := crDefault;

                        Status.caption := '';
                        edQtdTrechos.Text := '0';
                        edQtdDiarias.Text := '0';
                        EdVlrTotCotP.Text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767

                        bbtnCancelarClick(Self);

                     End;
               End;
            sbtnApagar.Down := False;
         Except
            bbtnCancelarClick(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Destacamento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnApagar.Down := False;
      End;
End;

Procedure TfrmCadDestacamento.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MSDestacamento.Caption := 'Selecione um Destacamento';
   MSDestacamento.Executar;
   Status.caption := '';
   If (MSDestacamento.RetornouValor) Then
      Begin
         If LocalizaDestacamento(strtofloat(MSDestacamento.ValoresChave[0])) Then
            Begin
               tbsViagem.enabled := True;
               dbgViagem.enabled := True;
               pnlDadosViagem.enabled := False;
               tbsAcerto.enabled := False;
               tbsDadosIntegra.enabled := False;

               sbtnAlterar.enabled := True;
               sbtnApagar.enabled := True;
               sbtnImprimir.enabled := True;
               spbImpEspelhoDest.enabled := True;

               btnInc1.enabled := True;
               btnAlt1.enabled := True;
               btnExc1.enabled := True;
            End;
            lblEmSubstituicao.Enabled:= True ;//Darivaldo Alencar SIG 27767
      End;
   dbcbxEmSubstituicaoClick(self);//Darivaldo Alencar SIG 27767
End;

Procedure TfrmCadDestacamento.CMProcuraDestacadoValidaDados(Sender: TObject);
Begin
   If (MontaSelectFunc.RetornouValor) Then
      Begin
         // Carrega o Cargo
         qryCargoLotacao.Close;
         qryCargoLotacao.Open;
         // Carrega o Grupo
         qryCargoGrupos.Close;
         qryCargoGrupos.Open;

         // Carrega as Contas bancárias
         qryLkpContasBanco.Close;
         qryLkpContasBanco.Open;

         // atribuindo a Conta Preferencial como default
         qryDestacamento.fieldByname('IDCBANCARIA').asInteger := CtrlDestacamento.buscarContaBancaria(strtoint(MontaSelectFunc.ValoresChave[0]));
         dbLkpContaBancaria.Setfocus;
      End;
End;

Procedure TfrmCadDestacamento.bbtnConfirmarClick(Sender: TObject);
Var bDestacInserido: Boolean;
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryDestacamento.State In [dsInsert, dsEdit] Then
               Begin
                  bDestacInserido := False;

                  If qryDestacamento.fieldByname('IDPESSOA').isnull Then
                     Begin
                        Application.MessageBox('Destacado não Informado !', 'Atenção !', Mb_IconExclamation);
                        CMProcuraDestacado.setfocus;
                        Exit;
                     End;

                  //Everson Cunha - SIG49075 - Ini
                  If (qryDestacamento.fieldByname('CODCENTRORESPON').isnull) or
                     (qryDestacamento.fieldByname('CODCENTRORESPON').value = '') Then
                  Begin
                    Application.MessageBox('Centro de Responsabilidade não Informado !', 'Atenção !', Mb_IconExclamation);

                    if dblkpCentroRespon.CanFocus then
                      dblkpCentroRespon.setfocus;
                      
                    Exit;
                  End;
                  //Everson Cunha - SIG49075 - Fim

                  If (CtrlDestacamento.buscarContaBancaria(qryDestacamento.FieldByName('IDPESSOA').AsInteger) <= 0) Or (qryCargoGrupos.isEmpty) Then
                     Begin
                        If (CtrlDestacamento.buscarContaBancaria(qryDestacamento.FieldByName('IDPESSOA').AsInteger) <= 0) Then
                           MsgDlg('Destacado não possui Conta Bancária definida ! Informe uma conta Bancária preferencial no cadastro do Funcionário.',
                              'Aviso', mtWarning, [mbOk], 0);

                        If qryCargoGrupos.isEmpty Then
                           MsgDlg('Cargo do Destacado não associado a um Grupo de Diárias. Verifique !', 'Atenção', mtWarning, [mbOk], 0);

                        CMProcuraDestacado.setfocus;
                        Exit;
                     End;

                  If (qryDestacamento.fieldByname('DATAPAGTODESTAC').isnull) And (Not qryDstTrecho.isEmpty) Then
                     Begin
                        Application.MessageBox('Data de Pagamento do Adiantamento não Informada !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 2;
                        dbDataPagtoDestac.setfocus;
                        Exit;
                     End;

                  If (qryDestacamento.fieldByname('VLRACERTOCONTAS1').asFloat <> 0) And (qryDestacamento.FieldByName('DATALANCACERTOCONTAS').isnull) Then
                     Begin
                        Application.MessageBox('Data de Lançamento do Acerto de Contas não foi informada !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 1;
                        dbDataLancAcerto.setfocus;
                        Exit;
                     End;

                  If (qryDestacamento.fieldByname('VLRACERTOCONTAS1').asFloat <> 0) And (dbrgPRDiaria.itemindex = -1) Then
                     Begin
                        Application.MessageBox('Debitar ou Creditar das Diárias não foi Informado !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 1;
                        dbrgPRDiaria.setfocus;
                        Exit;
                     End;

                  If (qryDestacamento.fieldByname('VLRACERTOCONTAS2').asFloat <> 0) And (dbrgPRTaxi.itemindex = -1) Then
                     Begin
                        Application.MessageBox('Debitar ou Creditar dos Taxis não foi Informado !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 1;
                        dbrgPRTaxi.setfocus;
                        Exit;
                     End;

                  If (qryDestacamento.fieldByname('VLRACERTOCONTAS3').asFloat <> 0) And (dbrgPRTransporte.itemindex = -1) Then
                     Begin
                        Application.MessageBox('Debitar ou Creditar do Transporte não foi Informado !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 1;
                        dbrgPRTransporte.setfocus;
                        Exit;
                     End;

                  If (qryDestacamento.fieldByname('VLRACERTOCONTAS4').asFloat <> 0) And (dbrgPROutras.itemindex = -1) Then
                     Begin
                        Application.MessageBox('Debitar ou Creditar de Outros não foi Informado !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 1;
                        dbrgPROutras.setfocus;
                        Exit;
                     End;

                  If (Not qryDestacamento.fieldByname('DATALANCACERTOCONTAS').isnull) And (qryDestacamento.fieldByname('DATAPAGTOACERTO').isnull) Then
                     Begin
                        Application.MessageBox('Data de Pagamento do Acerto de Contas não Informada !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 2;
                        dbDataPagtoAcerto.setfocus;
                        Exit;
                     End;

                  If dbLkpContaBancaria.text = '' Then
                     Begin
                        Application.MessageBox('Conta Bancária do Destacado não foi definida !', 'Atenção !', Mb_IconExclamation);
                        pcDetalhes.ActivePageIndex := 2;
                        dbLkpContaBancaria.setfocus;
                        Exit;
                     End;

                  //Darivaldo Alencar SIG 27767 -inicio
                  if (dbcbxEmSubstituicao.Checked) then
                    begin
                       if (dblkFuncaoSubst.Text = EmptyStr) then
                          begin
                             MsgDlg('Quando "Em Substituição", '+#13+
                                    'é obrigatório informar a Função em Substituição.'+#13+
                                    'Verifique.','Aviso',mtWarning,[mbOK],0);
                             exit;
                          end;
                    end;
                  //Darivaldo Alencar SIG 27767 -fim

                  Screen.Cursor := crSQLWait;
                  If qryDestacamento.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQDESTACAMENTO.NEXTVAL SEQDST FROM DUAL    ');
                        qryAux.Open;

                        qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger := qryAux.fieldByname('SEQDST').asInteger;
                        qryDestacamento.fieldByname('IDEMPRESA').asInteger := Sistema.IdEmpresa;
                        qryDestacamento.fieldByname('FLGLANCAFOLHA').asInteger := 0;
                        qryDestacamento.fieldByname('FLGLANCAFOLHAACERTO').asInteger := 0;
                        qryDestacamento.fieldByname('TIPOMOTIVONAOINTEGRACAO').asString := '0';
                        qryAux.Close;

                        bDestacInserido := True;
                     End;

                  If Status.caption <> 'Desfazendo' Then // Somente quando for usado o processo de Desfazer as Integrações
                     Begin
                        qryDestacamento.fieldByname('CODCENTROCUSTO').asString := qryCargoLotacao.fieldByname('CODCENTROCUSTO').asString;
                        qryDestacamento.fieldByname('IDCARGO').asInteger := qryCargoLotacao.fieldByname('IDCARGOFUN').asInteger;
                        qryDestacamento.fieldByname('IDPROGRAMA').asInteger := qryCargoLotacao.fieldByname('IDPROGRAMA').asInteger;
                     End;

                  qryDestacamento.Post;

                  If dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.Commit;

                  bSugerirImpressaoFormulario := True;

                  If bExclusaoFinAdiantSucesso Then
                     Begin
                        Application.MessageBox('Docto. Financeiro do Adiantamento Excluído com Sucesso !', 'Atenção !', Mb_IconExclamation);
                        bExclusaoFinAdiantSucesso := False;
                     End;

                  If bExclusaoFinAcertoSucesso Then
                     Begin
                        Application.MessageBox('Docto. Financeiro do Acerto de Contas Excluído com Sucesso !', 'Atenção !', Mb_IconExclamation);
                        bExclusaoFinAcertoSucesso := False;
                     End;

                  If bExclusaoFolAdiantSucesso Then
                     Begin
                        Application.MessageBox('Rubricas do Adiantamento Excluídas com Sucesso !', 'Atenção !', Mb_IconExclamation);
                        bExclusaoFolAdiantSucesso := False;
                     End;

                  If bExclusaoFolAcertoSucesso Then
                     Begin
                        Application.MessageBox('Rubricas do Acerto de Contas Excluídas com Sucesso !', 'Atenção !', Mb_IconExclamation);
                        bExclusaoFolAcertoSucesso := False;
                     End;

                  // Para otimizar, só executa as funções abaixo, se tiver trecho lançado
                  If Not qryDstTrecho.isEmpty Then
                     Begin

                        CalcularDiarias; // Calculando e atualizando a Diária

                        dbcbPartidaDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);
                        dbcbRetDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);

                        edQtdDiarias.Text := Floattostr(QuantidadeDeDiarias);
                        EdVlrTotCotP.text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767

                        AtualizarTabelaDestacamentoXItemDespesa('A'); // Somente os Adiantamentos

                        qryDstTrechoAfterScroll(qryDstTrecho);

                     End;

                  LocalizaDestacamento(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger); // Refresh no Destacamento

                  AtualizarTabelaDestacamentoXItemDespesa('C'); // Somente o Acerto de Contas

                  qryResumoValores.Close;
                  qryResumoValores.Open;

                  sbtnExcluirIntegracoes.Enabled := ((Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull) Or (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1));

                  Screen.Cursor := crDefault;

                  bbtnCancelarClick(Self);
               End;
         End ;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDestacamento.bbtnCancelarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryDestacamento.state In [dsEdit, dsInsert] Then
               qryDestacamento.Cancel;

            dtmBaseDados.dbBaseDados.RollBack;
         End;

      sbtnInserir.Down := False;
      sbtnInserir.enabled := True;
      sbtnAlterar.Down := False;
      sbtnAlterar.enabled := True;
      sbtnApagar.Down := False;
      sbtnApagar.enabled := True;
      sbtnProcurar.Down := False;
      sbtnProcurar.enabled := True;
      sbtnImprimir.Down := False;
      sbtnImprimir.enabled := True;
      spbImpEspelhoDest.Down := False;
      spbImpEspelhoDest.enabled := True;

      pnlDadosPrincipal.enabled := False;
      pcDetalhes.ActivePageIndex := 0;
      pcDetalhes.enabled := True;
      tbsViagem.enabled := True;
      dbgViagem.enabled := True;
      pnlDadosViagem.enabled := False;
      tbsAcerto.enabled := False;
      tbsDadosIntegra.enabled := False;

      bbtnConfirmar.enabled := False;
      bbtnCancelar.enabled := False;

      btnInc1.enabled := Not qryDestacamento.isEmpty;
      btnAlt1.enabled := Not qryDestacamento.isEmpty;
      btnExc1.enabled := Not qryDestacamento.isEmpty;
      spbRenumera.enabled := Not qryDestacamento.isEmpty;

      pnlIntegracoes.Visible := False;

      bExclusaoFinAdiantSucesso := False;
      bExclusaoFinAcertoSucesso := False;
      bExclusaoFolAdiantSucesso := False;
      bExclusaoFolAcertoSucesso := False;

      If status.caption = 'Inserindo' Then
         Begin
            CMProcuraDestacado.Text := '';
            ProcuraCidadeO.Text := '';
            ProcuraCidadeD.Text := '';
            Status.caption := '';
         End;

      Status.caption := 'Consultando';

      LocalizaDestacamento(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger); // Refresh no Destacamento

      sbtnExcluirIntegracoes.Enabled := ((Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull) Or (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1));

      // Financeira
      spbExcluiFinanAdiant.Enabled := (Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
      spbExcluiFinanAcerto.Enabled := (Not qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);
      imgFAOK.Visible := (Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
      imgFANAOOK.Visible := (qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
      imgFCOK.Visible := (Not qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);
      imgFCNAOOK.Visible := (qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);

      // Folha
      spbExcluiFolhaAdiant.Enabled := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1);
      imgAdiantFolOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1);
      imgAdiantFolNAOOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 0);
      spbExcluiFolhaAContas.Enabled := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1);
      imgAcertoFolOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1);
      imgAcertoFolNAOOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 0);
   Except
      Raise;
   End;
End;

Procedure TfrmCadDestacamento.bbtnSairClick(Sender: TObject);
Begin
   If Assigned(ctrlDestacamento) Then
      FreeAndNil(CtrlDestacamento);

   If (Not qryDstTrecho.isEmpty) And (bSugerirImpressaoFormulario = True) Then
      sbtnImprimirClick(Self);

   frmCadDestacamento.Tag := 0;

   Close;
End;

Procedure TfrmCadDestacamento.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryDestacamento.State In [dsEdit, dsInsert]) Or
      (qryDstTrecho.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryDestacamento.Cancel;
               qryDstTrecho.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryDestacamento.Close;
               qryDstTrecho.Close;
               qryCargoLotacao.Close;
               qryResumoValores.Close;
               qryLkpAeroportoO.Close;
               qryLkpAeroportoD.Close;
               qryLkpCidadeO.Close;
               qryLkpCidadeD.Close;
               qryUFO.Close;
               qryUFD.Close;
               qryAux.Close;
               qryEmpresa.Close;
               qryValorDiariaCargo.Close;
               qryLkpMoeda.Close;
               qryCargoGrupos.Close;
               qryLkpFormaPag.Close;
               qryLkpFormaRec.Close;
               qryLkpContasBanco.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryDstTrecho.Close;
         qryCargoLotacao.Close;
         qryResumoValores.Close;
         qryLkpAeroportoO.Close;
         qryLkpAeroportoD.Close;
         qryLkpCidadeO.Close;
         qryLkpCidadeD.Close;
         qryUFO.Close;
         qryUFD.Close;
         qryAux.Close;
         qryEmpresa.Close;
         qryValorDiariaCargo.Close;
         qryLkpMoeda.Close;
         qryCargoGrupos.Close;
         qryLkpFormaPag.Close;
         qryLkpFormaRec.Close;
         qryLkpContasBanco.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadDestacamento.pcDetalhesChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
   AllowChange := True;
   If (qryDestacamento.State In [dsInsert, dsEdit]) Or (qryDstTrecho.State In [dsInsert, dsEdit]) Then
      AllowChange := False;
End;

Procedure TfrmCadDestacamento.dbgResumoValoresDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not qryDestacamento.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               If (qryResumoValores.FieldByName('IDITEM').asInteger < 0) Then // Total Adiantamento e Total Final
                  Begin
                     dbgResumoValores.Canvas.Font.Color := clBlack;
                     dbgResumoValores.Canvas.Font.Style := [fsbold];
                  End;

               If Field.Name = 'qryResumoValoresVLRITEM' Then
                  Begin
                     If (qryResumoValores.FieldByName('TIPOQUALIFICACAO').asString = 'C') And // Acerto de Contas
                     (qryResumoValores.FieldByName('VLRITEM').asInteger < 0) Then
                        Begin
                           dbgResumoValores.Canvas.Font.Color := clRed;
                           dbgResumoValores.Canvas.Font.Style := [fsbold];
                        End;
                  End;

               dbgResumoValores.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmCadDestacamento.btnInc1Click(Sender: TObject);
Begin
   If Not qryDestacamento.isEmpty Then
      Begin
         TemDoctoIntegrado(iSitIntegracao);
         If iSitIntegracao <> 2 Then
            Begin
               Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  dbgViagem.Height := 95;

                  pnlDadosPrincipal.enabled := False;
                  tbsAcerto.enabled := False;
                  tbsDadosIntegra.enabled := False;
                  tbsViagem.enabled := True;
                  dbgViagem.enabled := False;
                  pnlDadosViagem.enabled := True;

                  btnAlt1.enabled := False;
                  btnExc1.enabled := False;
                  spbRenumera.enabled := False;
                  btnCon1.Enabled := True;
                  btnCan1.Enabled := True;

                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnAlterar.enabled := False;
                  sbtnProcurar.enabled := False;
                  sbtnImprimir.enabled := False;
                  spbImpEspelhoDest.enabled := False;

                  bbtnCancelar.enabled := False;

                  Screen.Cursor := crSQLWait;
                  qryDstTrecho.Close;
                  qryDstTrecho.Open;
                  qryLkpMoeda.Close;
                  Screen.Cursor := crDefault;

                  edQtdTrechos.Text := inttostr(QuantidadeDeTrechos + 1);
                  EdVlrTotCotP.Text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767

                  qryDstTrecho.Insert;

                  DataIniAnt := qryDstTrecho.FieldByName('DATAINI').asDateTime;

                  qryDstTrecho.FieldByName('INDOBJETIVO').AsInteger := 0; // Institucional
                  qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger := 0; // Aéreo
                  qryDstTrecho.FieldByName('INDCUSTEIODESPESA').AsInteger := 0; // FUNCEF

                  // Sol 199987 Ktn 1925452 - Paulo Nobre
                  qryDstTrecho.fieldByname('FLGCALCULADIARIA').asString := 'S'; // Sim

                  dbrgLocal.itemindex := 0; // País como default
                  dbrgLocal.enabled := False; // Desabilitando, enquanto a data da viagem não for fornecida

                  dbrgTipoTransporteClick(self);

                  dbdtIniTrecho.setfocus;
               Except
                  btnCan1Click(Self);
                  Raise;
               End;
            End;
         btnInc1.down := False;
      End
   Else
      Begin
         Application.MessageBox('Sem Destacamento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnInc1.down := False;
      End;
End;

Procedure TfrmCadDestacamento.btnAlt1Click(Sender: TObject);
Begin
   If Not qryDstTrecho.isEmpty Then
      Begin
         TemDoctoIntegrado(iSitIntegracao);
         If iSitIntegracao <> 2 Then
            Begin
               Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  dbgViagem.Height := 95;

                  pnlDadosPrincipal.enabled := False;
                  tbsAcerto.enabled := False;
                  tbsDadosIntegra.enabled := False;
                  tbsViagem.enabled := True;
                  dbgViagem.enabled := False;
                  pnlDadosViagem.enabled := True;

                  btnInc1.enabled := False;
                  btnExc1.enabled := False;
                  spbRenumera.enabled := False;
                  btnCon1.enabled := True;
                  btnCan1.enabled := True;

                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnAlterar.enabled := False;
                  sbtnProcurar.enabled := False;
                  sbtnImprimir.enabled := False;
                  spbImpEspelhoDest.enabled := False;

                  bbtnCancelar.enabled := False;

                  DataIniAnt := qryDstTrecho.FieldByName('DATAINI').asDateTime;

                  bDestacTrechoAlterar := True;

                  qryDstTrecho.Edit;
                  dbdtIniTrecho.setfocus;
               Except
                  btnCan1Click(Self);
                  Raise;
               End;
            End;
         btnAlt1.down := False;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnAlt1.down := False;
      End;
End;

Procedure TfrmCadDestacamento.btnCon1Click(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryDstTrecho.State In [dsInsert, dsEdit] Then
               Begin
                  bDestacTrechoInserido := False;

                  If (qryDstTrecho.fieldByname('DATAINI').asDateTime < LocalizaDataInicialTrecho(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger)) And
                     (qryDstTrecho.fieldByname('NUMSEQ').asInteger > 1) Then
                     Begin
                        Application.MessageBox('Data não pode ser menor que a Data inicial da Viagem !', 'Atenção !', Mb_IconExclamation);
                        dbdtIniTrecho.setfocus;
                        Exit;
                     End;

                  If qryDstTrecho.fieldByname('DATAINI').isnull Then
                     Begin
                        Application.MessageBox('Data da Viagem não Informada !', 'Atenção !', Mb_IconExclamation);
                        dbdtIniTrecho.setfocus;
                        Exit;
                     End;

                  If dbrgLocal.itemindex = -1 Then
                     Begin
                        MsgDlg('Destino da Viagem não informado !', 'Atenção', mtWarning, [mbOk], 0);
                        Exit;
                     End;

                  If (dbrgLocal.itemindex = 0) And (qryDstTrecho.fieldByname('VLRDIARIAGRUPO').asFloat = 0) Then // Pais
                     Begin
                        MsgDlg('Não foi localizada Diária no País para este Cargo em Nenhum dos Grupos. Verifique !', 'Atenção', mtWarning, [mbOk], 0);
                        Exit;
                     End;

                  If (dbrgLocal.itemindex = 1) Then // Exterior
                     Begin
                        If (qryDstTrecho.fieldByname('VLRDIARIAGRUPO').asFloat = 0) Then
                        begin
                           MsgDlg('Não foi localizada Diária no Exterior para este Cargo em Nenhum dos Grupos. Verifique !', 'Atenção', mtWarning, [mbOk], 0);
                           exit;
                        end
                        Else
                        If (qryDstTrecho.fieldByname('VLRCOTACAOMOEDA').asFloat = 0.00) Then
                        begin
                          Application.MessageBox(pchar('Não foi possível localizar a Cotação para:' + #13 +
                                 'Moeda : ' + qryValorDiariaCargo.fieldByname('MOESIGLA').asString + #13 +
                                 'Data de Pagamento : ' + datetostr(DataPagtoDestac)), 'Atenção !', MB_ICONEXCLAMATION);
                          Exit;
                        end;
                     End;
                  {
                  If dbrgTipoTransporte.itemindex In [1, 2] Then // Rodo e ferroviário
                     Begin
                        If (dbcbTaxiO.Checked) And (dbcbTaxiD.Checked) Then
                           Begin
                              Application.MessageBox('Transporte Rodoviário e Ferroviário, só permite o pagamento de uma Tarifa de Taxi !', 'Atenção !', Mb_IconExclamation);
                              Exit;
                           End;
                     End;
                  }
                  If qryDstTrecho.fieldByname('IDCIDADEORIG').isnull Then
                     Begin
                        Application.MessageBox('Cidade de Origem não Informada !', 'Atenção !', Mb_IconExclamation);
                        ProcuraCidadeO.setfocus;
                        Exit;
                     End;

                  If qryDstTrecho.fieldByname('IDCIDADES').isnull Then
                     Begin
                        Application.MessageBox('Cidade de Destino não Informada !', 'Atenção !', Mb_IconExclamation);
                        ProcuraCidadeD.setfocus;
                        Exit;
                     End;

                  If (edtValorTransporte.text = '0,00') And (dbrgTipoTransporte.itemindex > 0) Then
                     Begin
                        Application.MessageBox('Valor do Transporte não Informado !', 'Atenção !', Mb_IconExclamation);
                        //                        edtValorTransporte.setfocus;
                        //                        Exit;
                     End;

                  If (dblkpAeroO.text = '') And (dbrgTipoTransporte.itemindex = 0) Then
                     Begin
                        Application.MessageBox('Aeroporto de Origem não foi Informado !', 'Atenção !', Mb_IconExclamation);
                        dblkpAeroO.setfocus;
                        Exit;
                     End;

                  If (dblkpAeroD.text = '') And (dbrgTipoTransporte.itemindex = 0) Then
                     Begin
                        Application.MessageBox('Aeroporto Destino não foi Informado !', 'Atenção !', Mb_IconExclamation);
                        dblkpAeroD.setfocus;
                        Exit;
                     End;

                  If (dbeJustificativa.text = '') And (edQtdTrechos.Text = '1') Then
                     Begin
                        Application.MessageBox('Justificativa não foi Informada !', 'Atenção !', Mb_IconExclamation);
                        dbeJustificativa.setfocus;
                        Exit;
                     End;

                  // Felipe A. Santos SOL 228736/17139 PPM 761996 - início
                  if (UsuarioBloqueado) then
                    begin
                      Application.MessageBox(PChar('Data da viagem no período bloqueado. Ajustes permitidos apenas a partir de ' + DateToStr(dDataDesbloqueio) + '.'), 'Atenção !', Mb_IconExclamation);
                      if dbdtIniTrecho.CanFocus then dbdtIniTrecho.SetFocus;
                      Exit;
                    end;
                  // Felipe A. Santos SOL 228736/17139 PPM 761996 - fim

                  // Achando o Valor dos Taxis
                  If qryDstTrecho.fieldByname('INDTRANSPORTE').asInteger In [0, 1, 2] Then // Aéreo, Rodoviário e Ferroviário tem Taxi
                     Begin
                        qryDstTrecho.fieldByname('VLRTAXITRECHO').asFloat := 0.00;
                        qryDstTrecho.fieldByname('VLTAXIORIG').asFloat := 0.00;
                        qryDstTrecho.fieldByname('VLTAXIDEST').asFloat := 0.00;
                        qryDstTrecho.fieldByname('IDDSTVALORESTAXI_ORIG').asString := '';
                        qryDstTrecho.fieldByname('IDDSTVALORESTAXI_DEST').asString := '';
                        If (qryDstTrecho.fieldByname('FLGTAXIORIG').asString = 'S') Then
                           Begin
                              qryDstTrecho.fieldByname('VLTAXIORIG').asFloat := LocalizaValorTaxi(qryDstTrecho.fieldByname('IDDSTAEROPORTOORIG').asInteger, sIdDstValoresTaxi);
                              qryDstTrecho.fieldByname('IDDSTVALORESTAXI_ORIG').asString := sIdDstValoresTaxi;
                           End;

                        If (qryDstTrecho.fieldByname('FLGTAXIDEST').asString = 'S') Then
                           Begin
                              qryDstTrecho.fieldByname('VLTAXIDEST').asFloat := LocalizaValorTaxi(qryDstTrecho.fieldByname('IDDSTAEROPORTODEST').asInteger, sIdDstValoresTaxi);
                              qryDstTrecho.fieldByname('IDDSTVALORESTAXI_DEST').asString := sIdDstValoresTaxi;
                           End;

                        qryDstTrecho.fieldByname('VLRTAXITRECHO').asFloat := qryDstTrecho.fieldByname('VLTAXIORIG').asFloat + qryDstTrecho.fieldByname('VLTAXIDEST').asFloat;
                     End
                  Else
                     qryDstTrecho.fieldByname('VLRTAXITRECHO').asFloat := 0.00;

                  // Só entra para avaliar se calcula ou não, se houver data nova ou alteração da data
            {      If DataIniAnt <> qryDstTrecho.fieldByname('DATAINI').asDatetime Then
                     Begin
                        // Sol 199987 Ktn 1925452 - Paulo Nobre
                        // qryDstTrecho.fieldByname('FLGCALCULADIARIA').asString := 'S'; // Sim

                       // Se houver uma Data igual já lançada, então, somente haverá o cálculo de uma diária para trechos com datas iguais
                        If (qryDstTrecho.fieldByname('DATAINI').asDatetime = LocalizaSeTemTrechoLancadoComMesmaData(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger, qryDstTrecho.fieldByname('DATAINI').asDatetime)) And
                           (strtoint(edQtdTrechos.text) > 0) Then
                           qryDstTrecho.fieldByname('FLGCALCULADIARIA').asString := 'N'; // Não
                     End;    }

                  Screen.Cursor := crSQLWait;
                  If qryDstTrecho.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT MAX(NUMSEQ) AS ULTSEQ FROM DSTTRECHO ');
                        qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldbyname('IDDESTACAMENTO').asString);
                        qryAux.Open;

                        qryDstTrecho.fieldByname('IDDESTACAMENTO').asInteger := qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger;
                        qryDstTrecho.FieldByName('NUMSEQ').asInteger := qryAux.fieldbyname('ULTSEQ').asInteger + 1;
                        bDestacTrechoInserido := True;
                        qryAux.Close;
                     End;

                  // Felipe A. Santos SOL 202546 KTN 1968049

                  //qryDstTrecho.Post;
                  qryDstTrecho.ApplyUpdates;

                  // Felipe A. Santos SOL 202546 KTN 1968049 - FIM

                  dtmBaseDados.dbBaseDados.Commit;

                  qryDstTrecho.Close;
                  qryDstTrecho.Open;

                  dbcbPartidaDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);
                  dbcbRetDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);

                  CalcularDiarias; // Calculando e atualizando a Diária

                  edQtdDiarias.Text := Floattostr(QuantidadeDeDiarias);
                  EdVlrTotCotP.text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767

                  If strtoint(edQtdTrechos.Text) = 1 Then // Só acha a data de pagto para o primeiro trecho
                     AtualizaDataPagtoDestacamento;

                  LocalizaDestacamento(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger); // Refresh no Destacamento

                  AtualizarTabelaDestacamentoXItemDespesa('A'); // Somente os Adiantamentos

                  qryResumoValores.Close;
                  qryResumoValores.Open;

                  Screen.Cursor := crDefault;

                  bSugerirImpressaoFormulario := True;

                  btnCan1Click(Self);
               End;
         End;
   Except
      btnCan1Click(Self);
      Raise;
   End;
End;

Procedure TfrmCadDestacamento.btnCan1Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryDstTrecho.state In [dsEdit, dsInsert] Then
            qryDstTrecho.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryDstTrecho.Close;
         qryDstTrecho.Open;

         edQtdTrechos.Text := inttostr(QuantidadeDeTrechos);
         EdVlrTotCotP.Text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767
      End;

   tbsViagem.enabled := True;
   tbsAcerto.enabled := False;
   tbsDadosIntegra.enabled := False;
   dbgViagem.enabled := True;
   pnlDadosViagem.enabled := False;

   btnInc1.enabled := True;
   btnAlt1.enabled := True;
   btnExc1.enabled := True;
   btnCon1.enabled := False;
   btnCan1.enabled := False;
   btnInc1.down := False;
   btnAlt1.down := False;
   spbRenumera.enabled := True;
   spbRenumera.Down := False;

   If status.caption <> 'Inserindo' Then
      Begin
         sbtnInserir.enabled := True;
         sbtnApagar.enabled := True;
         sbtnAlterar.enabled := True;
         sbtnProcurar.enabled := True;
         sbtnImprimir.enabled := True;
         spbImpEspelhoDest.enabled := True;
      End
   Else
      bbtnCancelar.enabled := True;
End;

Procedure TfrmCadDestacamento.dbrgTipoTransporteClick(Sender: TObject);
Begin
   If Not qryDstTrecho.isEmpty Then
      If dbrgTipoTransporte.itemindex = 0 Then // Aéreo
         Begin
            pnlCidades.Enabled := True;
            edtValorTransporte.Text := '0,00';
            edtValorTransporte.Enabled := False;
            dbcbTaxiO.Enabled := True;
            dbcbTaxiD.Enabled := True;
            qryDstTrecho.FieldByName('FLGTAXIORIG').AsString := 'S'; // sim
            qryDstTrecho.FieldByName('FLGTAXIDEST').AsString := 'S'; // sim
         End
      Else If dbrgTipoTransporte.itemindex > 0 Then
         Begin
            dbcbTaxiO.Checked := False;
            dbcbTaxiD.Checked := False;
            dbcbTaxiO.Enabled := False;
            dbcbTaxiD.Enabled := False;
            qryDstTrecho.FieldByName('FLGTAXIORIG').AsString := 'N'; // Não
            qryDstTrecho.FieldByName('FLGTAXIDEST').AsString := 'N'; // Não
            If dbrgTipoTransporte.itemindex In [1, 2] Then // Se Rodoviário e Ferroviário, então tem Taxi
               Begin
                  dbcbTaxiO.Enabled := True;
                  dbcbTaxiD.Enabled := True;
               End;

            qryDstTrechoIDDSTAEROPORTOORIG.Clear;
            qryDstTrechoIDDSTAEROPORTODEST.Clear;
            dblkpAeroO.Clear;
            dblkpAeroD.Clear;

            pnlCidades.Enabled := False;
            edtValorTransporte.Enabled := True;
            edtValorTransporte.setfocus;
         End;
End;

Procedure TfrmCadDestacamento.ProcuraCidadeOValidaDados(Sender: TObject);
Begin
   dblkpAeroO.Clear;
   qryUFO.Close;
   qryUFO.Open;
   If dbrgTipoTransporte.itemindex = 0 Then // Aéreo
      dblkpAeroO.SetFocus;
End;

Procedure TfrmCadDestacamento.ProcuraCidadeDValidaDados(Sender: TObject);
Begin
   dblkpAeroD.Clear;
   qryUFD.Close;
   qryUFD.Open;
   If dbrgTipoTransporte.itemindex = 0 Then // Aéreo
      dblkpAeroD.SetFocus;
End;

Procedure TfrmCadDestacamento.qryDstTrechoCalcFields(DataSet: TDataSet);
Begin
   If qryDstTrecho.FieldByName('INDOBJETIVO').AsInteger = 0 Then
      qryDstTrecho.FieldByName('DSCOBJETIVO').AsString := 'Institucional'
   Else If qryDstTrecho.FieldByName('INDOBJETIVO').AsInteger = 1 Then
      qryDstTrecho.FieldByName('DSCOBJETIVO').AsString := 'Treinamento'
   Else If qryDstTrecho.FieldByName('INDOBJETIVO').AsInteger = 2 Then
      qryDstTrecho.FieldByName('DSCOBJETIVO').AsString := 'Audiência';

  //  INICIO - Marcelo Cardoso - SOL263608 - PPM1123719
   {If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 0 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Aéreo'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 1 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Rodoviário'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 2 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Carro Próprio'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 3 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Carro Alugado'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 4 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Ferroviário';}

   If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 0 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Aéreo'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 1 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Rodoviário'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 2 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Ferroviário'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 3 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Carro Próprio'
   Else If qryDstTrecho.FieldByName('INDTRANSPORTE').AsInteger = 4 Then
      qryDstTrecho.FieldByName('DSCTPTRANSPORTE').AsString := 'Carro Alugado';
   // FIM - Marcelo Cardoso - SOL263608 - PPM1123719

   If qryDstTrecho.FieldByName('INDCUSTEIODESPESA').AsInteger = 0 Then
      qryDstTrecho.FieldByName('DSCCUSTEIODESPESA').AsString := 'FUNCEF'
   Else If qryDstTrecho.FieldByName('INDCUSTEIODESPESA').AsInteger = 1 Then
      qryDstTrecho.FieldByName('DSCCUSTEIODESPESA').AsString := 'Empregado'
   Else If qryDstTrecho.FieldByName('INDCUSTEIODESPESA').AsInteger = 2 Then
      qryDstTrecho.FieldByName('DSCCUSTEIODESPESA').AsString := 'Outras Instituições';
End;

Procedure TfrmCadDestacamento.qryDstTrechoAfterScroll(DataSet: TDataSet);
Begin
   If dbrgTipoTransporte.itemindex = 0 Then // Aéreo
      Begin
         pnlCidades.Enabled := True;
         edtValorTransporte.Enabled := False;
      End
   Else If dbrgTipoTransporte.itemindex > 0 Then
      Begin
         pnlCidades.Enabled := False;
         edtValorTransporte.Enabled := True;
      End;
End;

Procedure TfrmCadDestacamento.dbgViagemDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not qryDstTrecho.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin

               If ((Field.Name = 'qryDstTrechoQTDDIARIATRECHO')
                  Or (Field.Name = 'qryDstTrechoVLRDIARIAREFER')
                  Or (Field.Name = 'qryDstTrechoVLRDIARIATRECHO'))
                  And (qryDstTrechoVLRDIARIATRECHO.value > 0) Then
                  Begin
                     // Troca a cor de fundo de uma determinada coluna
                     dbgViagem.Canvas.Font.Color := clBlue;
                  End;

               If qryDstTrechoFLGCALCULADIARIA.value = 'N' Then
                  dbgViagem.Canvas.Font.Color := clRed; // a linha toda fica na cor setada

               dbgViagem.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Function TfrmCadDestacamento.QuantidadeDeTrechos: Integer;
Begin
   Result := 0;
   If Not qryDestacamento.isEmpty Then
      Begin
         Screen.Cursor := crSQLWait;
         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.add('SELECT COUNT(*) QTDTRECHOS FROM DSTTRECHO ');
         qryAux2.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
         qryAux2.Open;
         If Not qryAux2.isEmpty Then
            Result := qryAux2.FieldByName('QTDTRECHOS').asInteger;

         qryAux2.Close;
         Screen.Cursor := crDefault;
      End;
End;


Function TfrmCadDestacamento.QuantidadeDeDiarias: Double;
Begin
   Result := 0;
   If Not qryDestacamento.isEmpty Then
      Begin
         Screen.Cursor := crSQLWait;
         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.add('SELECT SUM(QTDDIARIATRECHO) QTDTOTALDIARIAS FROM DSTTRECHO ');
         qryAux2.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
         qryAux2.Open;
         If Not qryAux2.isEmpty Then
            Result := qryAux2.FieldByName('QTDTOTALDIARIAS').asFloat;

         qryAux2.Close;
         Screen.Cursor := crDefault;
      End;
End;

Procedure TfrmCadDestacamento.dbgViagemIButtonClick(Sender: TObject);
Begin
   If qryDstTrecho.State = dsBrowse Then
      Begin
         If dbgViagem.Height = 95 Then
            dbgViagem.Height := 324
         Else
            dbgViagem.Height := 95;
      End;
End;

Function TfrmCadDestacamento.LocalizaValorTaxi(Const idDstAeroporto: Integer; Var sIdDstValoresTaxi: String): Double;
Begin
   Result := 0.00;
   Screen.Cursor := crSQLWait;
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.add('SELECT IDDSTVALORES, VLRDST  ');
   qryAux2.SQL.add('FROM DSTVALORES ');
   qryAux2.SQL.add('WHERE IDDSTAEROPORTO = ' + inttostr(idDstAeroporto));
   qryAux2.SQL.add('AND DATADSTVALORES >= (SELECT MAX(D1.DATADSTVALORES)  ');
   qryAux2.SQL.add('             FROM DSTVALORES D1       ');
   qryAux2.SQL.add('             WHERE D1.IDDSTAEROPORTO = ' + inttostr(idDstAeroporto) + ')');
   qryAux2.Open;
   If Not qryAux2.isEmpty Then
      Begin
         Result := qryAux2.FieldByName('VLRDST').asFloat;
         sIdDstValoresTaxi := qryAux2.FieldByName('IDDSTVALORES').asString;
      End
   Else
      Result := dValorFixoTaxi; // Valor fixo para o taxi, quando Rodoviário e Ferroviário

   qryAux2.Close;
   Screen.Cursor := crDefault;
End;

Function TfrmCadDestacamento.CalcularDiarias: Double;
Var DataAnt: Tdatetime;
   qtdDiarias, qtdDiariasTmp1, qtdDiariasTmp2, dValorDiaria, dValorDiariaReferencia, dValorDiariaTotal: double; // Sol 199987 Ktn 1925452 - Paulo Nobre
   bPrimeiroTrecho: Boolean;
Begin
   // Pegando o último trecho válido
   // Sol 199987 Ktn 1925452 - Paulo Nobre
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.add('SELECT MAX(DATAINI) ULTIMA_DATA, MAX(NUMSEQ) MAIOR_NUMSEQ FROM DSTTRECHO ');
   qryAux2.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
   qryAux2.SQL.add('AND FLGCALCULADIARIA = ''S'' '); // Calcula diária
   qryAux2.Open;

   // Calculando diárias e valores
   qtdDiarias := 0;
   qtdDiariasTmp1 := 0;
   qtdDiariasTmp2 := 0;
   dValorDiariaReferencia := 0.00;
   dValorDiariaTotal := 0.00;
   bPrimeiroTrecho := True;

   dataant := 0;
   dbgViagem.DataSource.DataSet.DisableControls;
   qryDstTrecho.first;
   While Not qryDstTrecho.EOF Do
      Begin
         If qryDstTrecho.fieldByname('FLGCALCULADIARIA').asString = 'S' Then
            Begin
               If bPrimeiroTrecho Then
                  Begin
                     qtdDiarias := 1; // Somente um dia, então, uma diária
                     qtdDiariasTmp1 := 0;

                     // Se Partida no dia anterior ao compromisso, sempre calcula o % baseado em 1 dia
                     If qryDestacamento.fieldByname('FLGPARTDIAANT').asString = 'S' Then // sim
                        qtdDiariasTmp1 := (qtdDiarias * dPercentAcrescimoDiaria); // Ex.: + 50% da quantidade

                     bPrimeiroTrecho := False;
                  End
               Else
                  Begin
                     qtdDiarias := qryDstTrecho.fieldByname('DATAINI').asDateTime - dataant;
                     qtdDiariasTmp1 := 0;
                     // Sol 199987 Ktn 1925452 - Paulo Nobre
                     If qtdDiarias = 0 Then
                        qtdDiarias := 1;
                  End;

               // Ultimo Trecho Válido
               // Sol 199987 Ktn 1925452 - Paulo Nobre
               If ((qryDstTrecho.fieldByname('DATAINI').asDateTime = qryAux2.fieldByname('ULTIMA_DATA').asDateTime)) And
                  ((qryDstTrecho.fieldByname('NUMSEQ').asInteger = qryAux2.fieldByname('MAIOR_NUMSEQ').asInteger)) Then
                  Begin
                     // Se Retorno no dia posterior ao compromisso, sempre calcula o % baseado em 1 dia
                     If qryDestacamento.fieldByname('FLGRETDIAPOST').asString = 'S' Then // sim
                        qtdDiariasTmp2 := (1 * dPercentAcrescimoDiaria); // Ex.: + 50% da quantidade
                  End;

               // Valor inicial da diária de referência
               dValorDiariaReferencia := (qryDstTrecho.fieldByname('VLRDIARIAGRUPO').asFloat * qryDstTrecho.fieldByname('VLRCOTACAOMOEDA').asFloat);
               // Se FUNCEF ou Outras Instituições o Empregado, por exemplo, recebe 50% da diária de referência
               If qryDstTrecho.fieldByname('INDCUSTEIODESPESA').asInteger In [0, 2] Then
                  dValorDiariaReferencia := dValorDiariaReferencia * dPercentReducaoDiaria; // Diária Reduzida

               // Sol 199987 Ktn 1925452 - Paulo Nobre
               qtdDiarias := qtdDiarias + qtdDiariasTmp1 + qtdDiariasTmp2;
               dValorDiariaTotal := dValorDiariaReferencia * qtdDiarias;
               dataant := qryDstTrecho.fieldByname('DATAINI').asDateTime;
            End
         Else
            Begin
               qtdDiarias := 0;
               dValorDiariaReferencia := 0.00;
               dValorDiariaTotal := 0.00;
            End;

         qryDstTrecho.Edit;
         qryDstTrecho.fieldbyname('QTDDIARIATRECHO').asFloat := qtdDiarias;
         qryDstTrecho.fieldbyname('VLRDIARIAREFER').asFloat := dValorDiariaReferencia;
         qryDstTrecho.fieldbyname('VLRDIARIATRECHO').asFloat := dValorDiariaTotal;

         // Felipe A. Santos SOL 202546 KTN 1968049

         //qryDstTrecho.Post;
         qryDstTrecho.ApplyUpdates;

         // Felipe A. Santos SOL 202546 KTN 1968049 - Fim

         qryDstTrecho.Next;
      End;

   qryDstTrecho.first;
   dbgViagem.DataSource.DataSet.EnableControls;
End;

Procedure TfrmCadDestacamento.spbRenumeraClick(Sender: TObject);
Var iNumSeq: Integer;
Begin
   // Renumeração temporária para evitar problemas de KEY VIOLATION quando da renumeração
   iNumSeq := 100;
   dbgViagem.DataSource.DataSet.DisableControls;
   Screen.Cursor := crSQLWait;
   qryDstTrecho.First;
   While Not qryDstTrecho.EOF Do
      Begin
         qryDstTrecho.Edit;
         qryDstTrecho.Fieldbyname('NUMSEQ').asInteger := iNumSeq;
         qryDstTrecho.Post;
         inc(iNumSeq);

         qryDstTrecho.Next;
      End;

   // Renumeração definitiva
   iNumSeq := 1;
   qryDstTrecho.First;
   While Not qryDstTrecho.EOF Do
      Begin
         qryDstTrecho.Edit;
         qryDstTrecho.Fieldbyname('NUMSEQ').asInteger := iNumSeq;
         qryDstTrecho.Post;
         inc(iNumSeq);

         qryDstTrecho.Next;
      End;
   qryDstTrecho.First;
   Screen.Cursor := crDefault;
   dbgViagem.DataSource.DataSet.EnableControls;
End;

Function TfrmCadDestacamento.LocalizaValorAcertoDeContas: Double;
Var dValorDiaria, dValorTaxi, dValorTransp, dValorOutras: Double;
Begin
   dValorDiaria := FU.IFF(dbrgPRDiaria.itemindex = 1, qryDestacamento.fieldByname('VLRACERTOCONTAS1').asFloat, qryDestacamento.fieldByname('VLRACERTOCONTAS1').asFloat * 1);
   dValorTaxi := FU.IFF(dbrgPRTaxi.itemindex = 1, qryDestacamento.fieldByname('VLRACERTOCONTAS2').asFloat, qryDestacamento.fieldByname('VLRACERTOCONTAS2').asFloat * 1);
   dValorTransp := FU.IFF(dbrgPRTransporte.itemindex = 1, qryDestacamento.fieldByname('VLRACERTOCONTAS3').asFloat, qryDestacamento.fieldByname('VLRACERTOCONTAS3').asFloat * 1);
   dValorOutras := FU.IFF(dbrgPROutras.itemindex = 1, qryDestacamento.fieldByname('VLRACERTOCONTAS4').asFloat, qryDestacamento.fieldByname('VLRACERTOCONTAS4').asFloat * 1);
   Result := dValorDiaria + dValorTaxi + dValorTransp + dValorOutras;
End;

Procedure TfrmCadDestacamento.dbDataLancAcertoExit(Sender: TObject);
Begin
   If qryDestacamento.FieldByName('DATALANCACERTOCONTAS').isNull Then
      qryDestacamento.FieldByName('DATAPAGTOACERTO').Clear
   Else
      qryDestacamento.FieldByName('DATAPAGTOACERTO').AsDateTime := ctrlDestacamento.calcularDataPagamento('C', qryDestacamento.FieldByName('DATALANCACERTOCONTAS').AsDateTime);
End;

Procedure TfrmCadDestacamento.AtualizaDataPagtoDestacamento;
Var DataPagto: TdateTime;
Begin
   qryDstTrecho.First;
   If Not qryDstTrecho.isEmpty Then
      // No primeiro trecho, sempre considerar a data da viagem
      DataPagto := ctrlDestacamento.CalcularDataPagamento('A', qryDstTrecho.FieldByName('DATAINI').AsDateTime); // Adiantamento / Pagar

   qryAux.Close;
   qryAux.SQL.Clear;
   If Not qryDstTrecho.isEmpty Then
      qryAux.SQL.add('UPDATE DESTACAMENTO SET DATAPAGTODESTAC = ' + quotedstr(datetostr(DataPagto)))
   Else
      qryAux.SQL.add('UPDATE DESTACAMENTO SET DATAPAGTODESTAC = NULL ');
   qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
   If Not qryAux.Prepared Then
      qryAux.Prepare;
   qryAux.ExecSQL;
End;

Function TfrmCadDestacamento.LocalizaDestacamento(IdDestacamento: Double): Boolean;
Begin
   Screen.Cursor := crSQLWait;
   qryDestacamento.Close;
   qryDestacamento.SQL.clear;
   qryDestacamento.SQL.Add('SELECT                  ');
   qryDestacamento.SQL.Add('    IDDESTACAMENTO,     ');
   qryDestacamento.SQL.Add('    DATALANCAMENTO,     ');
   qryDestacamento.SQL.Add('    IDPESSOA,           ');
   qryDestacamento.SQL.Add('    IDEMPRESA,          ');
   qryDestacamento.SQL.Add('    INDOBJETIVO,        ');
   qryDestacamento.SQL.Add('    FLGPARTDIAANT,      ');
   qryDestacamento.SQL.Add('    FLGRETDIAPOST,      ');
   qryDestacamento.SQL.Add('    JUSTIFICATIVA,      ');
   qryDestacamento.SQL.Add('    VLRACERTOCONTAS1,   ');
   qryDestacamento.SQL.Add('    VLRACERTOCONTAS2,   ');
   qryDestacamento.SQL.Add('    VLRACERTOCONTAS3,   ');
   qryDestacamento.SQL.Add('    VLRACERTOCONTAS4,   ');
   qryDestacamento.SQL.Add('    FLGACERTOCONTASPR1, ');
   qryDestacamento.SQL.Add('    FLGACERTOCONTASPR2, ');
   qryDestacamento.SQL.Add('    FLGACERTOCONTASPR3, ');
   qryDestacamento.SQL.Add('    FLGACERTOCONTASPR4, ');
   qryDestacamento.SQL.Add('    NROGEDOC,           ');
   qryDestacamento.SQL.Add('    CODDOCDESTAC,       ');
   qryDestacamento.SQL.Add('    CODDOCACERTO,       ');
   qryDestacamento.SQL.Add('    CODCENTRORESPON,    ');
   qryDestacamento.SQL.Add('    CODCENTROCUSTO,     ');
   qryDestacamento.SQL.Add('    DATAPAGTODESTAC,    ');
   qryDestacamento.SQL.Add('    DATAPAGTOACERTO,    ');
   qryDestacamento.SQL.Add('    DATALANCACERTOCONTAS,');
   qryDestacamento.SQL.Add('    FLGLANCAFOLHA,      ');
   qryDestacamento.SQL.Add('    FLGLANCAFOLHAACERTO,');
   qryDestacamento.SQL.Add('    ANOMESREFADIANT,    ');
   qryDestacamento.SQL.Add('    ANOMESREFACERTO,    ');
   qryDestacamento.SQL.Add('    IDCARGO,            ');
   qryDestacamento.SQL.Add('    TIPOMOTIVONAOINTEGRACAO,');
   qryDestacamento.SQL.Add('    CODFORMAPAG,  ');
   qryDestacamento.SQL.Add('    CODFORMAREC,  ');
   qryDestacamento.SQL.Add('    IDCBANCARIA,  ');
   qryDestacamento.SQL.Add('    IDPROGRAMA  ');
   //Darivaldo Alencar SIG 27767 -inicio
   qryDestacamento.SQL.Add('    ,FLGSUBSTITUICAO  ');
   qryDestacamento.SQL.Add('    ,IDFUNCAOSUBST  ');
   qryDestacamento.SQL.Add('    ,VLRHOSPEDAGEMTOTAL  ');
   //Darivaldo Alencar SIG 27767 -fim
   qryDestacamento.SQL.Add('FROM DESTACAMENTO');
   qryDestacamento.SQL.Add('WHERE IDDESTACAMENTO = ' + quotedstr(floattostr(IdDestacamento)));
   qryDestacamento.Open;
   result := Not qryDestacamento.EOF;

   qryCargoLotacao.Close;
   qryCargoLotacao.Open;

   qryCargoGrupos.Close;
   qryCargoGrupos.Open;

   qryResumoValores.Close;
   qryResumoValores.Open;

   qryDstTrecho.Close;
   qryDstTrecho.Open;

   qryLkpMoeda.Close;
   qryLkpMoeda.Open;

   qryDocDestac.Close;
   qryDocDestac.Open;
   qryDocAcerto.Close;
   qryDocAcerto.Open;

   edQtdTrechos.Text := inttostr(QuantidadeDeTrechos);
   edQtdDiarias.Text := Floattostr(QuantidadeDeDiarias);
   EdVlrTotCotP.Text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767

   Screen.Cursor := crDefault;

   If frmCadDestacamento.Tag = 0 Then // somente se for do proprio form e não chamado pelo FDestacamentoPendente
      sbtnExcluirIntegracoes.Enabled := ((Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull) Or (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1));

   dbcbPartidaDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);
   dbcbRetDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);
   lblEmSubstituicao.Enabled:= True ;//Darivaldo Alencar Sig 27767

   // Financeira
   spbExcluiFinanAdiant.Enabled := (Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
   spbExcluiFinanAcerto.Enabled := (Not qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);
   imgFAOK.Visible := (Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
   imgFANAOOK.Visible := (qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
   imgFCOK.Visible := (Not qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);
   imgFCNAOOK.Visible := (qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);

   // Folha
   spbExcluiFolhaAdiant.Enabled := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1);
   imgAdiantFolOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1);
   imgAdiantFolNAOOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 0);
   spbExcluiFolhaAContas.Enabled := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1);
   imgAcertoFolOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1);
   imgAcertoFolNAOOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 0);

   Status.caption := 'Consultando';

   dbcbxEmSubstituicao.Checked:= qryDestacamento.FieldByName('FLGSUBSTITUICAO').AsString = 'S'; //Darivaldo Alencar SIG 27767
End;

Procedure TfrmCadDestacamento.dbeACDiariaExit(Sender: TObject);
Begin
   If dbeACDiaria.Value = 0 Then
      qryDestacamento.fieldByname('FLGACERTOCONTASPR1').clear;
End;

Procedure TfrmCadDestacamento.dbeACTaxiExit(Sender: TObject);
Begin
   If dbeACTaxi.value = 0 Then
      qryDestacamento.fieldByname('FLGACERTOCONTASPR2').clear;
End;

Procedure TfrmCadDestacamento.dbeACTranspExit(Sender: TObject);
Begin
   If dbeACTransp.value = 0 Then
      qryDestacamento.fieldByname('FLGACERTOCONTASPR3').clear;
End;

Procedure TfrmCadDestacamento.dbeACOutrasExit(Sender: TObject);
Begin
   If dbeACOutras.value = 0 Then
      qryDestacamento.fieldByname('FLGACERTOCONTASPR4').clear;
End;

Procedure TfrmCadDestacamento.sbtnImprimirClick(Sender: TObject);
Var sDestino, sPeriodo, sJustificativa, sTipoTransp, sTipoTranspAnt, sTipoTranspAtu, sDespEmbarque: String;
   dVlIntegral, dVlReduzida, dTotIntegral, dTotReduzida, dTotDiarias, dTotalGeral,
      iQtdIntegral, iQtdReduzida, dVlTransp, dVlTaxi: Double;
Begin
   If sbtnImprimir.Down Then
      sbtnImprimir.Down := False;

   If (Not qryDestacamento.isEmpty) And (Not qryDstTrecho.isEmpty) Then
      Begin
         If MsgDlg('Deseja imprimir o Formulário do Destacamento ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
            Begin
               sDestino := '';
               sJustificativa := '';
               sTipoTransp := '';
               dVlIntegral := 0.00;
               iQtdIntegral := 0.00;
               dVlReduzida := 0.00;
               iQtdReduzida := 0.00;
               dTotIntegral := 0.00;
               dTotReduzida := 0.00;
               dTotDiarias := 0.00;
               dVlTransp := 0.00;
               dVlTaxi := 0.00;

               ppVlInt.caption := '--------';
               ppQtdInt.caption := '--------';
               ppTotInt.caption := '--------';
               ppVlRed.caption := '--------';
               ppQtdRed.caption := '--------';
               ppTotRed.caption := '--------';
               ppVlTransp.caption := '--------';
               ppVlAluguelCarro.Caption:='--------';   //Marcelo Cardoso  SOL - 263608 - PPM1123719
               ppTotGeral.caption := '--------';
               ppSomaGeral.caption := '--------';

               pplblJustificativa.Lines.Clear; //William Moreira da Silva - SOL 204973 - Kintana 1982736


               Screen.Cursor := crSQLWait;
               qryEmpresa.Close;
               qryEmpresa.Open;

               qryDstTrecho.First;
               sPeriodo := qryDstTrecho.Fieldbyname('DATAINI').asString + ' a '; // Pegando a primeira data
               sDestino := qryDstTrecho.Fieldbyname('NMECIDADEORIG').asString + ' / '; // Pegando a primeira cidade de origem
               //
               sTipoTranspAnt := 'xxxxxxxx'; // Para forçar a quebra na primeira vez
               sTipoTranspAtu := qryDstTrecho.Fieldbyname('DSCTPTRANSPORTE').asString;
               While Not qryDstTrecho.EOF Do
                  Begin
                     sDestino := sDestino + qryDstTrecho.Fieldbyname('NMECIDADEDEST').asString + ' / ';
                     If Not qryDstTrecho.Fieldbyname('OBSERVACAO').IsNull Then
                        sJustificativa := sJustificativa + qryDstTrecho.Fieldbyname('OBSERVACAO').asString + ' / ';

                     // If usado para não permitir repetir os Tipos de Transportes
                     If sTipoTranspAtu <> sTipoTranspAnt Then
                        Begin
                           sTipoTransp := sTipoTransp + qryDstTrecho.Fieldbyname('DSCTPTRANSPORTE').asString + ' / ';
                           sTipoTranspAnt := qryDstTrecho.Fieldbyname('DSCTPTRANSPORTE').asString;
                        End;
                     //
                     dVlTaxi := dVlTaxi + qryDstTrecho.Fieldbyname('VLRTAXITRECHO').asFloat;
                     dVlTransp := dVlTransp + qryDstTrecho.Fieldbyname('VLRTRANSPORTE').asFloat;

                     If qryDstTrecho.Fieldbyname('INDCUSTEIODESPESA').asInteger In [0, 2] Then // Diária Reduzida - FUNCEF e Outras Empresas
                        Begin
                           // Sol 199987 Ktn 1925452 - Paulo Nobre
                           If qryDstTrecho.fieldByname('VLRDIARIAREFER').asFloat <> 0.00 Then
                              dVlReduzida := qryDstTrecho.fieldByname('VLRDIARIAREFER').asFloat;
                           dTotReduzida := dTotReduzida + qryDstTrecho.fieldByname('VLRDIARIATRECHO').asFloat;
                           iQtdReduzida := iQtdReduzida + qryDstTrecho.Fieldbyname('QTDDIARIATRECHO').asFloat;
                        End
                     Else // Diária Integral - Empregado
                        Begin
                           // Sol 199987 Ktn 1925452 - Paulo Nobre
                           If qryDstTrecho.fieldByname('VLRDIARIAREFER').asFloat <> 0.00 Then
                              dVlIntegral := qryDstTrecho.fieldByname('VLRDIARIAREFER').asFloat;
                           dTotIntegral := dTotIntegral + qryDstTrecho.fieldByname('VLRDIARIATRECHO').asFloat;
                           iQtdIntegral := iQtdIntegral + qryDstTrecho.Fieldbyname('QTDDIARIATRECHO').asFloat;
                        End;

                     qryDstTrecho.Next;

                     sTipoTranspAtu := qryDstTrecho.Fieldbyname('DSCTPTRANSPORTE').asString;
                  End;

               sPeriodo := sPeriodo + qryDstTrecho.Fieldbyname('DATAINI').asString; // Pegando a última data
               qryDstTrecho.First;
               Screen.Cursor := crDefault;

               sDestino := copy(sDestino, 1, length(sDestino) - 2); // Tirando a última barra
               sTipoTransp := copy(sTipoTransp, 1, length(sTipoTransp) - 2); // Tirando a última barra
               sJustificativa := copy(sJustificativa, 1, length(sJustificativa) - 2); // Tirando a última barra

               // Sol 199987 Ktn 1925452 - Paulo Nobre
               dTotalGeral := dTotReduzida + dTotIntegral;

               pplblDestino.Caption := sDestino;
               pplblPeriodo.Caption := sPeriodo;
               pplblJustificativa.lines.add(sJustificativa);
               pplblMeioTransp.Caption := sTipoTransp;

               // Montando a string com as Despesas de Embarque
               sDespEmbarque := '';
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.add('SELECT IDDESTACAMENTO, VLTAXI, COUNT (*) As QTD FROM(           ');
               qryAux.SQL.add('SELECT 1, IDDESTACAMENTO, VLTAXIORIG As VLTAXI FROM DSTTRECHO   ');
               qryAux.SQL.add('UNION ALL                                                          ');
               qryAux.SQL.add('SELECT 2, IDDESTACAMENTO, VLTAXIDEST As VLTAXI FROM DSTTRECHO)  ');
               qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
               qryAux.SQL.add('      AND VLTAXI > 0 ');
               qryAux.SQL.add('GROUP BY IDDESTACAMENTO, VLTAXI            ');
               qryAux.SQL.add('ORDER BY IDDESTACAMENTO, VLTAXI            ');
               qryAux.Open;
               While Not qryAux.EOF Do
                  Begin
                     sDespEmbarque := sDespEmbarque + qryAux.fieldByname('QTD').asString + ' x ' + floattostrf(qryAux.fieldByname('VLTAXI').asFloat, ffcurrency, 12, 2) + ' | ';

                     qryAux.Next;
                  End;
               qryAux.Close;
               sDespEmbarque := sDespEmbarque + 'Total Geral: ' + floattostrf(dVlTaxi, ffcurrency, 12, 2);
               //

               // Integral
               If dVlIntegral > 0 Then
                  //                  ppVlInt.caption := floattostrf((dVlIntegral / iQtdIntegral), ffcurrency, 12, 2);
                  ppVlInt.caption := floattostrf((dVlIntegral), ffcurrency, 12, 2);
               If iQtdIntegral > 0 Then
                  ppQtdInt.caption := floattostrf(iQtdIntegral, ffNumber, 8, 2);
               If dTotIntegral > 0 Then
                  ppTotInt.caption := floattostrf(dTotIntegral, ffcurrency, 12, 2);

               // Reduzida
               If dVlReduzida > 0 Then
                  //                  ppVlRed.caption := floattostrf((dVlReduzida / iQtdReduzida), ffcurrency, 12, 2);
                  ppVlRed.caption := floattostrf((dVlReduzida), ffcurrency, 12, 2);
               If iQtdReduzida > 0 Then
                  ppQtdRed.caption := floattostrf(iQtdReduzida, ffNumber, 8, 2);
               If dTotReduzida > 0 Then
                  ppTotRed.caption := floattostrf(dTotReduzida, ffcurrency, 12, 2);

               ppVlTaxi.lines.Clear;
               If dVlTaxi > 0 Then
                  ppVlTaxi.lines.add(sDespEmbarque);

               //  Inicio -  Marcelo Cardoso - SOL263608 - PPM1123719
               If (dbrgTipoTransporte.itemindex In [0, 1, 2, 3] ) and  (dVlTransp > 0)   Then
                  ppVlTransp.caption := floattostrf(dVlTransp, ffcurrency, 12, 2);

               if (dbrgTipoTransporte.itemindex In [4] ) and  (dVlTransp > 0 ) then
                   ppVlAluguelCarro.caption := floattostrf(dVlTransp, ffcurrency, 12, 2);  
               //  FIM -  Marcelo Cardoso - SOL263608 - PPM1123719

               If dTotalGeral > 0 Then
                  ppTotGeral.caption := floattostrf(dTotalGeral, ffcurrency, 12, 2);

               If (dVlTaxi + dTotalGeral + dVlTransp) > 0 Then
                  ppSomaGeral.caption := floattostrf(dVlTaxi + dTotalGeral + dVlTransp, ffcurrency, 12, 2);

               qryDestacamento.DisableControls;
               TfrmPreview.CreateModalPreview(Application, rbFormularioDestacamento, rbFormularioDestacamento.PrinterSetup.DocumentName);
               qryDestacamento.EnableControls;
               bSugerirImpressaoFormulario := False;
               qryEmpresa.Close;
            End;
      End
   Else
      Begin
         If (qryDestacamento.isEmpty) Then
            Application.MessageBox('Sem Destacamento selecionado para esta Impressão. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK)
         Else If (qryDstTrecho.isEmpty) Then
            Application.MessageBox('Destacamento sem Trechos lançados para esta Impressão. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);

         sbtnImprimir.down := False;
      End;
End;

Procedure TfrmCadDestacamento.sbtnExcluirIntegracoesClick(Sender: TObject);
Begin
   pnlIntegracoes.Top := 48;
   pnlIntegracoes.Left := 434;

   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      Status.caption := 'Desfazendo';

      pnlDadosPrincipal.Enabled := False;
      pcDetalhes.Enabled := False;

      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;
      sbtnProcurar.enabled := False;
      sbtnImprimir.enabled := False;
      spbImpEspelhoDest.enabled := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;
      pnlIntegracoes.Visible := True;

      pcDetalhes.ActivePageIndex := 2;

      // Financeira
      spbExcluiFinanAdiant.Enabled := (Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
      spbExcluiFinanAcerto.Enabled := (Not qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);
      imgFAOK.Visible := (Not qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
      imgFANAOOK.Visible := (qryDestacamento.Fieldbyname('CODDOCDESTAC').isnull);
      imgFCOK.Visible := (Not qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);
      imgFCNAOOK.Visible := (qryDestacamento.Fieldbyname('CODDOCACERTO').isnull);

      // Folha
      spbExcluiFolhaAdiant.Enabled := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1);
      imgAdiantFolOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1);
      imgAdiantFolNAOOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 0);
      spbExcluiFolhaAContas.Enabled := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1);
      imgAcertoFolOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1);
      imgAcertoFolNAOOK.Visible := (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 0);

      qryDestacamento.Edit;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDestacamento.spbExcluiFinanAdiantClick(Sender: TObject);
var wqtde : Real;
Begin

   //Peterson Victor - SOL233230/18354 - inicio 
   try
     qryAux.Close;
     qryAux.SQL.Clear;

     qryAux.SQL.Add(' SELECT COUNT(*) QTD ');
     qryAux.SQL.Add(' FROM DESTACAMENTO WHERE CODDOCDESTAC = (SELECT CODDOCDESTAC FROM DESTACAMENTO WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').AsString + ' )' );

     qryAux.Open;

     if not qryAux.IsEmpty then
     begin

       if qryAux.FieldByName('QTD').AsFloat > 1 then
       begin
         if  Application.MessageBox('A integração deste destacamento foi agrupada com a de outros destacamentos.' + #13 +
                                       'Desfazendo esta, todas as vinculadas também serão desfeitas, confirma?',
                                       'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDNO then
         begin
            Exit;
         end;
       end;
     end;
   finally
     qryAux.Close;

   end;

   //Peterson Victor - SOL233230/18354 - Fim
   
   If Not qryDestacamento.fieldByname('CODDOCACERTO').isnull Then
      Begin
         Application.MessageBox('Primeiro, é necessário desfazer o Documento do Acerto de Contas !', 'Atenção !', Mb_IconExclamation);
         Exit;
      End;

   If CtrlDestacamento.ExcluirDadosDaIntegracaoFinanceira(teExcluirAdiantamentoSomente, // Excluindo somente o Adiantamento
      qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger,
      qryDestacamento.fieldByname('CODDOCDESTAC').asInteger, 0) Then
      Begin
         spbExcluiFinanAdiant.Enabled := False;
         bSugerirImpressaoFormulario := False;
         bExclusaoFinAdiantSucesso := True;
         imgFAOK.Visible := False;
         imgFANAOOK.Visible := True;
      End
   Else
      Begin
         Application.MessageBox(pchar(ctrlDestacamento.MessageInfo), 'Atenção !', Mb_IconExclamation);
         bbtnCancelarClick(Self);
      End;
End;

Procedure TfrmCadDestacamento.spbExcluiFinanAcertoClick(Sender: TObject);
Begin
   // Excluíndo o Financeiro do Acerto
   If CtrlDestacamento.ExcluirDadosDaIntegracaoFinanceira(teExcluirAcertoSomente, // Excluindo somente o Acerto
      qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger, 0,
      qryDestacamento.fieldByname('CODDOCACERTO').asInteger) Then
      Begin
         spbExcluiFinanAcerto.Enabled := False;
         bSugerirImpressaoFormulario := False;
         bExclusaoFinAcertoSucesso := True;
         imgFCOK.Visible := False;
         imgFCNAOOK.Visible := True;
      End
   Else
      Begin
         Application.MessageBox(pchar(ctrlDestacamento.MessageInfo), 'Atenção !', Mb_IconExclamation);
         bbtnCancelarClick(Self);
      End;
End;

Procedure TfrmCadDestacamento.TemDoctoIntegrado(Var iSitIntegracao: Integer);
Begin
   iSitIntegracao := 0;

   If sbtnAlterar.Down = True Then
      Begin
         If ((Not qryDestacamento.FieldByName('CODDOCDESTAC').isnull) Or (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1)) And
            ((qryDestacamento.FieldByName('CODDOCACERTO').isnull) And (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 0)) Then
            Begin
               Application.MessageBox('Adiantamento já Integrado, portanto, somente poderão ser alterados os dados do Acerto de Contas.', 'Atenção !', mb_ICONWARNING + mb_OK);
               iSitIntegracao := 1;
            End
         Else
            Begin
               If (Not qryDestacamento.FieldByName('CODDOCDESTAC').isnull) And
                  (Not qryDestacamento.FieldByName('CODDOCACERTO').isnull) And
                  (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1) And
                  (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1) Then
                  Begin
                     Application.MessageBox('Destacamento não pode ser Alterado, por conter Integração Financeira e/ou de Folha.' + #13 + #13 +
                        'Portanto, primeiramente, será necessário Desfazê-las.', 'Atenção !', mb_ICONWARNING + mb_OK);
                     iSitIntegracao := 2;
                  End
               Else
                  Begin
                     If (Not qryDestacamento.FieldByName('CODDOCDESTAC').isnull) And (Not qryDestacamento.FieldByName('CODDOCACERTO').isnull) Then
                        Begin
                           Application.MessageBox('Destacamento não pode ser Alterado, por conter Integração Financeira.' + #13 + #13 +
                              'Portanto, primeiramente, será necessário Desfazê-la.', 'Atenção !', mb_ICONWARNING + mb_OK);
                           iSitIntegracao := 2;
                        End;

                     If (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1) And (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1) Then
                        Begin
                           Application.MessageBox('Destacamento não pode ser Alterado, por conter Integração com a Folha.' + #13 + #13 +
                              'Portanto, primeiramente, será necessário Desfazê-la.', 'Atenção !', mb_ICONWARNING + mb_OK);
                           iSitIntegracao := 2;
                        End;
                  End;
            End;

         // Não há trechos lançados, portando, não será possivel alterar a data de pagamento, mesmo o usuário tendo permissão
         If (qryDstTrecho.isEmpty) Then
            iSitIntegracao := 3;
      End;

   If sbtnApagar.Down = True Then
      Begin
         If (Not qryDestacamento.FieldByName('CODDOCDESTAC').isnull) Or
            (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1) Then
            Begin
               Application.MessageBox('Destacamento não pode ser Excluído, por conter Integração Financeira e/ou de Folha.' + #13 + #13 +
                  'Portanto, primeiramente, será necessário Desfazê-las.', 'Atenção !', mb_ICONWARNING + mb_OK);
               iSitIntegracao := 2;
            End;
      End;

   If (btnInc1.Down = True) Or (btnAlt1.Down = True) Or (btnExc1.Down = True) Then
      Begin
         If (Not qryDestacamento.FieldByName('CODDOCDESTAC').isnull) Or
            (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1) Then
            Begin
               Application.MessageBox('Trecho não pode ser Incluído/Alterado/Excluído, por Destacamento conter Integração Financeira e/ou de Folha.' + #13 + #13 +
                  'Portanto, primeiramente, será necessário Desfazê-las.', 'Atenção !', mb_ICONWARNING + mb_OK);
               iSitIntegracao := 2;
            End;
      End;
End;

Procedure TfrmCadDestacamento.btnExc1Click(Sender: TObject);
Begin
   If Not qryDstTrecho.isEmpty Then
      Begin
         TemDoctoIntegrado(iSitIntegracao);
         If iSitIntegracao <> 2 Then
            Begin
               Try
                  If MsgDlg('Confirma Exclusão deste Trecho da Viagem ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        If Not dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.StartTransaction;

                        // Felipe A. Santos SOL 202546 KTN 1968049

                        // qryDstTrecho.Delete;

                        qryAux.SQL.Clear;
                        qryAux.SQL.Add('DELETE FROM DSTTRECHO WHERE IDDESTACAMENTO = :IDDESTACAMENTO AND NUMSEQ = :NUMSEQ');
                        qryAux.ParamByName('IDDESTACAMENTO').AsString := qryDstTrecho.FieldByName('IDDESTACAMENTO').AsString;
                        qryAux.ParamByName('NUMSEQ').AsString := qryDstTrecho.FieldByName('NUMSEQ').AsString;
                        qryAux.ExecSQL;

                        // Felipe A. Santos SOL 202546 KTN 1968049 - FIM

                        dtmBaseDados.dbBaseDados.Commit;

                        qryDstTrecho.Close;
                        qryDstTrecho.Open;

                        dbcbPartidaDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);
                        dbcbRetDiaAnt.Enabled := (Not qryDstTrecho.isEmpty);

                        AtualizaDataPagtoDestacamento;

                        LocalizaDestacamento(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger); // Refresh no Destacamento

                        AtualizarTabelaDestacamentoXItemDespesa('A'); // Somente os Adiantamentos

                        qryResumoValores.Close;
                        qryResumoValores.Open;

                        edQtdTrechos.Text := inttostr(QuantidadeDeTrechos);
                        edQtdDiarias.Text := Floattostr(QuantidadeDeDiarias);
                        EdVlrTotCotP.text := (VlrCotacaoPassagem);//Darivaldo Alencar SIG 27767
                        Screen.Cursor := crDefault;
                     End;
               Except
                  Raise;
               End;
            End;
         btnExc1.Down := False;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnExc1.Down := False;
      End;
End;

Procedure TfrmCadDestacamento.dblkpAeroOEnter(Sender: TObject);
Begin
   dblkpAeroO.DropDown;
End;

Procedure TfrmCadDestacamento.dblkpAeroDEnter(Sender: TObject);
Begin
   dblkpAeroD.DropDown;
End;

Procedure TfrmCadDestacamento.spbExcluiFolhaAdiantClick(Sender: TObject);
Begin
   If (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1) Then
      Begin
         Application.MessageBox('Primeiro, é necessário Desfazer as Rubricas do Acerto de Contas !', 'Atenção !', Mb_IconExclamation);
         exit;
      End;

   If CtrlDestacamento.ExcluirDadosDaIntegracaoFolhaPagto(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger,
      qryDestacamento.fieldByname('IDPESSOA').asInteger,
      'A', // Adiantamento
      qryDestacamento.fieldByname('ANOMESREFADIANT').asString,
      CMProcuraDestacado.Text) Then
      Begin
         spbExcluiFolhaAdiant.Enabled := False;
         bSugerirImpressaoFormulario := False;
         bExclusaoFolAdiantSucesso := True;
         imgAdiantFolOK.Visible := False;
         imgAdiantFolNAOOK.Visible := True;
      End
   Else
      Begin
         Application.MessageBox(pchar(ctrlDestacamento.MessageInfo), 'Atenção !', Mb_IconExclamation);
         bbtnCancelarClick(Self);
      End;
End;

Procedure TfrmCadDestacamento.spbExcluiFolhaAContasClick(Sender: TObject);
Begin
   If CtrlDestacamento.ExcluirDadosDaIntegracaoFolhaPagto(qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger,
      qryDestacamento.fieldByname('IDPESSOA').asInteger,
      'C', // Acerto de Contas
      qryDestacamento.fieldByname('ANOMESREFACERTO').asString,
      CMProcuraDestacado.Text) Then
      Begin
         spbExcluiFolhaAContas.Enabled := False;
         bSugerirImpressaoFormulario := False;
         bExclusaoFolAcertoSucesso := True;
         imgAcertoFolOK.Visible := False;
         imgAcertoFolNAOOK.Visible := True;
      End
   Else
      Begin
         Application.MessageBox(pchar(ctrlDestacamento.MessageInfo), 'Atenção !', Mb_IconExclamation);
         bbtnCancelarClick(Self);
      End;
End;

Procedure TfrmCadDestacamento.ppDetailBand4BeforePrint(Sender: TObject);
Begin
   ppDBDescItem.Font.Style := [];
   ppDBVlrItem.Font.Style := [];
   If (qryResumoValores.FieldByName('IDITEM').asInteger < 0) Then // Total Adiantamento e Total Final
      Begin
         ppDBDescItem.Font.Style := [fsbold];
         ppDBVlrItem.Font.Style := [fsbold];
      End;
End;

Procedure TfrmCadDestacamento.ppDetailBand5BeforePrint(Sender: TObject);
Begin
   ppLbl3.Caption := '';
   ppLbl4.Caption := '';
   If (qryDestacamento.Fieldbyname('FLGLANCAFOLHA').asInteger = 1) Then
      ppLbl3.Caption := '( SIM )';
   If (qryDestacamento.Fieldbyname('FLGLANCAFOLHAACERTO').asInteger = 1) Then
      ppLbl4.Caption := '( SIM )';
End;

Procedure TfrmCadDestacamento.ppDetailBand6AfterGenerate(Sender: TObject);
Begin
   pplblDC1.Caption := '';
   pplblDC2.Caption := '';
   pplblDC3.Caption := '';
  // pplblDC4.Caption := '';  Comentado por William Santana SOL 185596 KIN 1948348

   If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR1').asString = 'D' Then // Débito
      pplblDC1.Caption := '( Debitar Empregado )'
   Else If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR1').asString = 'C' Then // Crédito
      pplblDC1.Caption := '( Creditar Empregado )';

   If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR2').asString = 'D' Then
      pplblDC2.Caption := '( Debitar Empregado )'
   Else If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR2').asString = 'C' Then
      pplblDC2.Caption := '( Creditar Empregado )';

   If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR3').asString = 'D' Then
      pplblDC3.Caption := '( Debitar Empregado )'
   Else If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR3').asString = 'C' Then
      pplblDC3.Caption := '( Creditar Empregado )';

   { Comentado por William Santana SOL 185596 KIN 1948348
   If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR4').asString = 'D' Then
      pplblDC4.Caption := '( Debitar Empregado )'
   Else If qryDestacamento.Fieldbyname('FLGACERTOCONTASPR4').asString = 'C' Then
      pplblDC4.Caption := '( Creditar Empregado )'; }
End;

Procedure TfrmCadDestacamento.spbImpEspelhoDestClick(Sender: TObject);
Var sObjPrincipalViagem: String;
Begin
  iContaValores:= 0;//Darivaldo Alencar SIG 27767
   If spbImpEspelhoDest.Down Then
      spbImpEspelhoDest.Down := False;

   If (Not qryDestacamento.isEmpty) And (Not qryDstTrecho.isEmpty) Then
      Begin
         If MsgDlg('Deseja imprimir o Resumo do Destacamento ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
            Begin
               Screen.Cursor := crSQLWait;
               qryDstTrecho.First;
               qryEmpresa.Close;
               qryEmpresa.Open;
               qryCentroRespon.Close;
               qryCentroRespon.Open;

               If qryDestacamento.Fieldbyname('INDOBJETIVO').asInteger = 0 Then
                  sObjPrincipalViagem := 'Institucional'
               Else If qryDestacamento.Fieldbyname('INDOBJETIVO').asInteger = 1 Then
                  sObjPrincipalViagem := 'Treinamento'
               Else If qryDestacamento.Fieldbyname('INDOBJETIVO').asInteger = 2 Then
                  sObjPrincipalViagem := 'Audiência';

               qryDstTrecho.DisableControls;
               qryResumoValores.DisableControls;
               TfrmPreview.CreateModalPreview(Application, rbResumoDestacamento, rbResumoDestacamento.PrinterSetup.DocumentName);
               qryResumoValores.EnableControls;
               qryDstTrecho.EnableControls;
               qryEmpresa.Close;
               qryCentroRespon.Close;
            End;
      End
   Else
      Begin
         If (qryDestacamento.isEmpty) Then
            Application.MessageBox('Sem Destacamento selecionado para esta Impressão. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK)
         Else If (qryDstTrecho.isEmpty) Then
            Application.MessageBox('Destacamento sem Trechos lançados para esta Impressão. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);

         spbImpEspelhoDest.down := False;
      End;
End;

Procedure TfrmCadDestacamento.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Procedure TfrmCadDestacamento.AtualizarTabelaDestacamentoXItemDespesa(sTipoQualificacao: String);
Begin
   // Inserindo os items de despesa na tabela auxiliar - DESTACAMENTOXITEMDESPESA
   If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

   // Técnica do mais simples e prático: sempre excluir tudo para inserir tudo novamente
   Screen.Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('DELETE DESTACAMENTOXITEMDESPESA  ');
   qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
   qryAux.SQL.add('AND TIPOQUALIFICACAO = ' + Quotedstr(sTipoQualificacao));
   If Not qryAux.Prepared Then
      qryAux.Prepare;
   qryAux.ExecSQL;

   If sTipoQualificacao = 'A' Then // Adiantamentos
      Begin
         // Acumulando Items de Despesas com Objetivos iguais
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.add('SELECT IDDESTACAMENTO, INDOBJETIVO, SUM(VLRDIARIATRECHO) AS VLDI, SUM(VLRTAXITRECHO) AS VLTX, SUM(VLRTRANSPORTE) AS VLTR  ');
         qryAux.SQL.add('FROM DSTTRECHO ');
         qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
         qryAux.SQL.add('GROUP BY IDDESTACAMENTO, INDOBJETIVO ');
         qryAux.Open;
         While Not qryAux.EOF Do
            Begin
               // Inserindo os Adiantamentos
               If qryAux.fieldByname('VLDI').asFloat > 0 Then // Valor da Diária
                  Begin
                     qryAux2.Close;
                     qryAux2.SQL.Clear;
                     qryAux2.SQL.add('SELECT SEQDESTACAMENTOXITEMDESPESA.NEXTVAL SEQ FROM DUAL    ');
                     qryAux2.Open;

                     qryInserirDestacamentoXItemDespesa.ParamByName('p1').asInteger := qryAux2.fieldByname('SEQ').asInteger;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p2').asInteger := qryAux.fieldByname('IDDESTACAMENTO').asInteger;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p3').asInteger := 1; // Diária
                     qryInserirDestacamentoXItemDespesa.ParamByName('p4').asInteger := qryAux.fieldByname('INDOBJETIVO').asInteger;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p5').asString := sTipoQualificacao;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p6').asFloat := qryAux.fieldByname('VLDI').asFloat;
                     If Not qryInserirDestacamentoXItemDespesa.Prepared Then
                        qryInserirDestacamentoXItemDespesa.Prepare;
                     qryInserirDestacamentoXItemDespesa.ExecSQL;
                  End;

               If qryAux.fieldByname('VLTX').asFloat > 0 Then // Valor do Taxi
                  Begin
                     qryAux2.Close;
                     qryAux2.SQL.Clear;
                     qryAux2.SQL.add('SELECT SEQDESTACAMENTOXITEMDESPESA.NEXTVAL SEQ FROM DUAL    ');
                     qryAux2.Open;

                     qryInserirDestacamentoXItemDespesa.ParamByName('p1').asInteger := qryAux2.fieldByname('SEQ').asInteger; ;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p2').asInteger := qryAux.fieldByname('IDDESTACAMENTO').asInteger;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p3').asInteger := 2; // Taxi
                     qryInserirDestacamentoXItemDespesa.ParamByName('p4').asInteger := qryAux.fieldByname('INDOBJETIVO').asInteger;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p5').asString := sTipoQualificacao;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p6').asFloat := qryAux.fieldByname('VLTX').asFloat;
                     If Not qryInserirDestacamentoXItemDespesa.Prepared Then
                        qryInserirDestacamentoXItemDespesa.Prepare;
                     qryInserirDestacamentoXItemDespesa.ExecSQL;
                  End;

               If qryAux.fieldByname('VLTR').asFloat > 0 Then // Valor do Transporte
                  Begin
                     qryAux2.Close;
                     qryAux2.SQL.Clear;
                     qryAux2.SQL.add('SELECT SEQDESTACAMENTOXITEMDESPESA.NEXTVAL SEQ FROM DUAL    ');
                     qryAux2.Open;

                     qryInserirDestacamentoXItemDespesa.ParamByName('p1').asInteger := qryAux2.fieldByname('SEQ').asInteger; ;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p2').asInteger := qryAux.fieldByname('IDDESTACAMENTO').asInteger;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p3').asInteger := 3; // Transporte
                     qryInserirDestacamentoXItemDespesa.ParamByName('p4').asInteger := qryAux.fieldByname('INDOBJETIVO').asInteger;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p5').asString := sTipoQualificacao;
                     qryInserirDestacamentoXItemDespesa.ParamByName('p6').asFloat := qryAux.fieldByname('VLTR').asFloat;
                     If Not qryInserirDestacamentoXItemDespesa.Prepared Then
                        qryInserirDestacamentoXItemDespesa.Prepare;
                     qryInserirDestacamentoXItemDespesa.ExecSQL;
                  End;

               qryAux.Next;
            End;

         qryAux.Close;
      End
   Else // (C) - Acerto de Contas
      Begin
         // Inserindo o Acerto de Contas
         TotalDoAcertoDeContas(dTotalDoAcertoDeContas);
         If dTotalDoAcertoDeContas <> 0 Then
            Begin
               qryAux2.Close;
               qryAux2.SQL.Clear;
               qryAux2.SQL.add('SELECT SEQDESTACAMENTOXITEMDESPESA.NEXTVAL SEQ FROM DUAL    ');
               qryAux2.Open;

               qryInserirDestacamentoXItemDespesa.ParamByName('p1').asInteger := qryAux2.fieldByname('SEQ').asInteger; ;
               qryInserirDestacamentoXItemDespesa.ParamByName('p2').asInteger := qryDestacamento.fieldByname('IDDESTACAMENTO').asInteger;
               qryInserirDestacamentoXItemDespesa.ParamByName('p3').asInteger := 7; // Acerto de Contas
               qryInserirDestacamentoXItemDespesa.ParamByName('p4').asInteger := qryDestacamento.fieldByname('INDOBJETIVO').asInteger; // 0 - Institucional
               qryInserirDestacamentoXItemDespesa.ParamByName('p5').asString := sTipoQualificacao;
               qryInserirDestacamentoXItemDespesa.ParamByName('p6').asFloat := dTotalDoAcertoDeContas;
               If Not qryInserirDestacamentoXItemDespesa.Prepared Then
                  qryInserirDestacamentoXItemDespesa.Prepare;
               qryInserirDestacamentoXItemDespesa.ExecSQL;
            End;
      End;

   If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;

   Screen.Cursor := crDefault;
End;

Procedure TfrmCadDestacamento.TotalDoAcertoDeContas(Var dTotalDoAcertoDeContas: Double);
Begin
   // Calculando o Acerto de Contas
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT SUM(DECODE(FLGACERTOCONTASPR1, ''C'', VLRACERTOCONTAS1, VLRACERTOCONTAS1 * -1) + ');
   qryAux.SQL.add('           DECODE(FLGACERTOCONTASPR2, ''C'', VLRACERTOCONTAS2, VLRACERTOCONTAS2 * -1) + ');
   qryAux.SQL.add('           DECODE(FLGACERTOCONTASPR3, ''C'', VLRACERTOCONTAS3, VLRACERTOCONTAS3 * -1) + ');
   qryAux.SQL.add('           DECODE(FLGACERTOCONTASPR4, ''C'', VLRACERTOCONTAS4, VLRACERTOCONTAS4 * -1)) AS TOTAL_ACERTO ');
   qryAux.SQL.add('FROM DESTACAMENTO                                                                     ');
   qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
   qryAux.Open;
   dTotalDoAcertoDeContas := qryAux.fieldbyname('TOTAL_ACERTO').asFloat;
   qryAux.Close;
End;

Function TfrmCadDestacamento.LocalizaSeTemTrechoLancadoComMesmaData(Const idDestacamento: Integer; dataini: Tdatetime): TDateTime;
Begin
   Result := 0;
   Screen.Cursor := crSQLWait;
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.add('SELECT DATAINI      ');
   qryAux2.SQL.add('FROM DSTTRECHO      ');
   qryAux2.SQL.add('WHERE IDDESTACAMENTO = ' + inttostr(idDestacamento));
   qryAux2.SQL.add('      AND DATAINI = ' + quotedstr(datetostr(dataini)));
   qryAux2.SQL.add('      AND FLGCALCULADIARIA = ''S'' ');
   qryAux2.Open;
   If Not qryAux2.isEmpty Then
      Result := qryAux2.FieldByName('DATAINI').asDateTime;
   qryAux2.Close;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadDestacamento.dbrgLocalChange(Sender: TObject);
Begin
   If qryDstTrecho.State In [dsInsert, dsEdit] Then
      Begin
         qryDstTrecho.fieldByname('MOECODIGO').Clear;
         qryDstTrecho.fieldByname('VLRDIARIAGRUPO').asFloat := 0.00;
         qryDstTrecho.fieldByname('VLRCOTACAOMOEDA').asFloat := 0.00;

         If dbrgLocal.itemindex >= 0 Then
            Begin
               Screen.Cursor := crSQLWait;
               qryValorDiariaCargo.Close;
               //Darivaldo Alencar SIG 27767 -inicio
               if not dbcbxEmSubstituicao.Checked then
                   qryValorDiariaCargo.ParamByName('pIDCARGO').asInteger := qryCargoLotacao.fieldByname('IDCARGOFUN').asInteger
               else
                   qryValorDiariaCargo.ParamByName('pIDCARGO').asInteger := qrydsFuncSub.fieldByname('IDCARGO').asInteger;
               //Darivaldo Alencar SIG 27767 -fim

               qryValorDiariaCargo.ParamByName('pTIPOLOCAL').asString := FU.IFF(dbrgLocal.itemindex = 0, 'P', 'E'); // Pais ou Exterior
               qryValorDiariaCargo.ParamByName('pDATAINI').asString := dbdtIniTrecho.Text;
               qryValorDiariaCargo.Open;
               If Not qryValorDiariaCargo.EOF Then
                  Begin
                     qryDstTrecho.fieldByname('MOECODIGO').asInteger := qryValorDiariaCargo.fieldByname('MOECODIGO').asInteger;
                     qryDstTrecho.fieldByname('VLRDIARIAGRUPO').asFloat := qryValorDiariaCargo.fieldByname('VLRDST').asFloat;

                     If strtoint(edQtdTrechos.Text) < 2 Then
                        // No primeiro trecho, sempre considerar a data da viagem
                        DataPagtoDestac := ctrlDestacamento.CalcularDataPagamento('A', dbdtIniTrecho.date)
                     Else // Nos demais trechos sempre será usada a data de pagamento que foi definida para o Adiantamento (aba dados da integração)
                        DataPagtoDestac := ctrlDestacamento.CalcularDataPagamento('A', qryDestacamento.FieldByName('DATAPAGTODESTAC').AsDateTime);

                     //Everson Cunha - SIG128057 - Ini
                     //If dbrgLocal.itemindex = 0 Then // Pais
                     //   qryDstTrecho.fieldByname('VLRCOTACAOMOEDA').asFloat := 1.00 // Se REAL, a paridade será 1:1 para facilitar os cálculos
                     //Else // Exterior
                     //   qryDstTrecho.fieldByname('VLRCOTACAOMOEDA').asFloat := CtrlDestacamento.LocalizarCotacaoMoeda(qryValorDiariaCargo.fieldByname('MOECODIGO').asInteger, datetostr(DataPagtoDestac));

                     if qryValorDiariaCargo.fieldByname('MOECODIGO').asInteger = 1 then //Real
                      qryDstTrecho.fieldByname('VLRCOTACAOMOEDA').asFloat := 1.00
                     else //Outras moedas
                      qryDstTrecho.fieldByname('VLRCOTACAOMOEDA').asFloat := CtrlDestacamento.LocalizarCotacaoMoeda(qryValorDiariaCargo.fieldByname('MOECODIGO').asInteger, datetostr(DataPagtoDestac));
                     //Everson Cunha - SIG128057 - Fim

                     qryDstTrecho.fieldByname('IDDSTVALORES_DIARIA').asInteger := qryValorDiariaCargo.fieldByname('IDDSTVALORES').asInteger;

                     qryLkpMoeda.Close;
                     qryLkpMoeda.Open;

                     Screen.Cursor := crDefault;
                  End;
            End;
      End;
End;

Function TfrmCadDestacamento.LocalizaDataInicialTrecho(Const idDestacamento: Integer): TDateTime;
Begin
   Result := 0;
   Screen.Cursor := crSQLWait;
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.add('SELECT MIN(DATAINI) DATAINI      ');
   qryAux2.SQL.add('FROM DSTTRECHO      ');
   qryAux2.SQL.add('WHERE IDDESTACAMENTO = ' + inttostr(idDestacamento));
   qryAux2.SQL.add('      AND FLGCALCULADIARIA = ''S'' ');
   qryAux2.Open;
   If Not qryAux2.isEmpty Then
      Result := qryAux2.FieldByName('DATAINI').asDateTime;
   qryAux2.Close;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadDestacamento.dbdtIniTrechoExit(Sender: TObject);
Begin
   dbrgLocal.enabled := (dbdtIniTrecho.Text <> ''); // Só habilita o Destino da Viagem se for fornecida uma data da viagem
   dbrgLocalChange(Self);
End;

Procedure TfrmCadDestacamento.dbLkpContaBancariaEnter(Sender: TObject);
Begin
   dbLkpContaBancaria.DropDown;
End;

// Felipe A. Santos SOL 228736/17139 PPM 761996 - início
function TfrmCadDestacamento.UsuarioBloqueado: Boolean;
var
  iDiasBloq : Integer;
  dDataBloqueio : TDateTime;
begin
   Result := True;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT FLGDISPDESTAC FROM USUARIOSISTEMA WHERE NOMEUSUARIO = ' + QuotedStr(Sistema.NomeUsuario));
   qryAux.Open;

   // usuário liberado independente da data de desbloqueio
   if qryAux.FieldByName('FLGDISPDESTAC').AsString = 'S' then
   begin
     Result := False;
     Exit;
   end;

   // pegando a quantidade de dias de bloqueio do destacamento, parametrizados na funcionalidade Parâmetros do Sistema
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT DIASBLOQDESTAC FROM PARAMRH');
   qryAux.Open;

   iDiasBloq := qryAux.FieldByName('DIASBLOQDESTAC').AsInteger;

   //Pegando a data de desbloqueio

   // + 1 porque não considera o dia atual e +1 para pegar a data de desbloqueio (Data de Bloqueio + 1)
   if iDiasBloq <> 0 then
   begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT CALCULA_INTERVALO_UTIL(' + IntToStr((iDiasBloq + 2)) + ') AS DATADESBLOQUEIO FROM DUAL');
     qryAux.Open;

     dDataDesbloqueio := qryAux.FieldByName('DATADESBLOQUEIO').AsDateTime;

     // verifica se está no período de bloqueio
     if trunc(dbdtIniTrecho.Date) < trunc(dDataDesbloqueio) then
        Result := True // Usuário bloqueado
     else
        Result := False;
   end
   else
     Result := False;
end;
// Felipe A. Santos SOL 228736/17139 PPM 761996 - fim


//Darivaldo Alencar SIG 26777 -inicio
procedure TfrmCadDestacamento.dbcbxEmSubstituicaoClick(Sender: TObject);
begin
 if not (qryDestacamento.State in[dsEdit,dsInsert]) then
     exit;

  bOptou:= dbcbxEmSubstituicao.Checked;
  if not(qryDstTrecho.IsEmpty) then
    begin
      if ((qryDestacamento.FieldByName('FLGSUBSTITUICAO').AsString = 'S') AND  (dbcbxEmSubstituicao.Checked = True)) or
         ((qryDestacamento.FieldByName('FLGSUBSTITUICAO').AsString = 'N') AND  (dbcbxEmSubstituicao.Checked = False))
       then
         abort;
      MsgDlg('A marcação/desmarcação desta opção incide nos '+#13+
             'valores da diária já cadastrada nos trechos,'+#13+
             'favor excluir os trechos para que seja possível'+#13+
             'realizar esta ação!','Aviso',mtWarning,[mbOk],0);
      if not bOptou then
          qryDestacamento.FieldByName('FLGSUBSTITUICAO').AsString  := 'S'
       else begin
          qryDestacamento.FieldByName('FLGSUBSTITUICAO').AsString  := 'N';
          qryDestacamento.FieldByName('IDFUNCAOSUBST').AsString    := EmptyStr;
       end;
       dbcbxEmSubstituicao.Checked:= not bOptou;
    end
  else begin
    if bOptou then
       qryDestacamento.FieldByName('FLGSUBSTITUICAO').AsString  := 'S'
   else begin
       qryDestacamento.FieldByName('FLGSUBSTITUICAO').AsString  := 'N';
       qryDestacamento.FieldByName('IDFUNCAOSUBST').AsString    := EmptyStr;
       dblkFuncaoSubst.Text   := EmptyStr;
   end;
   dblkFuncaoSubst.Enabled:= bOptou;
  end;
end;

function TfrmCadDestacamento.VlrCotacaoPassagem: String;
begin
   if not (qryDestacamento.fieldByname('IDDESTACAMENTO').IsNull) then
      begin
         FazQuery(qryAUX3,' SELECT NVL(SUM(VLRCOTACAOPASSAGEM),0) VLRCOTACAOPASSAGEM FROM DSTTRECHO ' +
                          ' WHERE IDDESTACAMENTO = ' + qryDestacamento.fieldByname('IDDESTACAMENTO').asString);
         result:= FormatFloat('###,##0.00',qryAux3.fieldbyname('VLRCOTACAOPASSAGEM').asCurrency);
      end
   else result:= '0,00';
end;

procedure TfrmCadDestacamento.rbFormularioDestacamentoBeforePrint(
  Sender: TObject);
var
  VlrTotCotP: string;
begin
   pplVlrTotHosp.caption := '--------';
   pplVlrCotacaoP.caption := '--------';
   pplTotal1_2.caption := '--------';

   VlrTotCotP := StringReplace(EdVlrTotCotP.Text,'.','',[rfReplaceAll, rfIgnoreCase]);
   lblFuncSub.Caption:= dblkFuncaoSubst.Text;
   pplVlrTotHosp.Caption := FormatFloat('R$ ###,##0.00',dbedtHospedTotal.Value);
   pplVlrCotacaoP.Caption:= FormatFloat('R$ ###,##0.00',StrToFloat(VlrTotCotP));
   pplTotal1_2.Caption   := FormatFloat('R$ ###,##0.00',dbedtHospedTotal.Value + StrToFloat(VlrTotCotP));
end;

procedure TfrmCadDestacamento.rbResumoDestacamentoBeforePrint(
  Sender: TObject);
begin
  iContaValores:= 0;
   ppFuncSub02.Caption    := EmptyStr;
   ppVlrTotHospSub.Caption:= EmptyStr;
   ppVlrTotCotPSub.Caption:= EmptyStr;

   ppFuncSub02.Caption    := dblkFuncaoSubst.Text;
   ppVlrTotHospSub.Caption:= dbedtHospedTotal.Text;
   ppVlrTotCotPSub.Caption:= EdVlrTotCotP.Text;
   Application.ProcessMessages;
end;

procedure TfrmCadDestacamento.ppDetailBand4BeforeGenerate(Sender: TObject);
begin
   inc(iContaValores);

   ppVlrTotHospSub.Visible := iContaValores = 1;
   ppVlrTotCotPSub.Visible := (Int(qryResumoValores.RecordCount / 2) = iContaValores);
   pplblVlrHosp.Visible    := ppVlrTotHospSub.Visible;
   pplblVlrCotP.Visible    := ppVlrTotCotPSub.Visible;
end;

procedure TfrmCadDestacamento.dblkFuncaoSubstChange(Sender: TObject);
begin
  dbrgLocalChange(self);
end;

procedure TfrmCadDestacamento.dbrgTipoTransporteExit(Sender: TObject);
begin
  ProcuraCidadeO.SetFocus;
end;

procedure TfrmCadDestacamento.dblkpAeroDExit(Sender: TObject);
begin
  dbcbTaxiD.SetFocus;
end;

procedure TfrmCadDestacamento.dblkpAeroOExit(Sender: TObject);
begin
  dbcbTaxiO.SetFocus;
end;

//Darivaldo Alencar SIG 26777 -fim

//Taffarel - SIG81771 - início
procedure TfrmCadDestacamento.dbrgDespTranspClick(Sender: TObject);
begin
  // SIG 70193 - Osni Cavalcante - Início da alteração
  if (dbrgDespTransp.ItemIndex = 1) or (qryDstTrecho.FieldByName('INDCUSTEIODESPESA').AsInteger = 1) then
  begin
    Application.MessageBox('Opção desabilitada', 'Custeio das Despesas', MB_OK + MB_ICONINFORMATION);
    qryDstTrecho.FieldByName('INDCUSTEIODESPESA').AsInteger := 0;
    dbrgDespTransp.ItemIndex := 0;
  end;
  // SIG 70193 - Osni Cavalcante - Fim da alteração
end;
//Taffarel - SIG81771 - fim

procedure TfrmCadDestacamento.dblkpCentroResponEnter(Sender: TObject);
begin
  dblkpCentroRespon.DropDown; //Everson Cunha - SIG49075
end;

End.


