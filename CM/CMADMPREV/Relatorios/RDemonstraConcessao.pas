unit RDemonstraConcessao;

{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina     : MontaSQLRelatorio
Nº WO......: 40258
Inicio dev : 18/06/2026
Responsável: Edilaine
Descrição..: Demonstrativo nao gera quando so tem reserva matematica
------------------------------------------------------------------------------
Rotina     : MontaSQLRelatorio
Nº WO......: 27971
Inicio dev : 24/11/2025
Responsável: Edilaine
Descrição..: Demonstrativo nao gera após migracao oracle
------------------------------------------------------------------------------
Rotina     : MontaSQLRelatorio
Nº WO......: 25429
Inicio dev : 10/09/2025
Responsável: Edilaine
Descrição..: Marcar reservas de resgates anteriores
------------------------------------------------------------------------------
Alteração   : rpDemonstraConcessaoFuncefBeforePrint
WO          : WO23998
Responsável : Paulo Nobre
Data        : 04/08/2025
Descrição   : Voltar a mostrar o nome da Pessoa, para ser apresentado na
              assinatura do relatório.
--------------------------------------------------------------------------------
Alteração  : (dfm gpInfoTitular, gbValores) CmeCadastroFind, MostraValoresFabBs,
             MostraValoresFabBsGbValores, OcultaValoresFabBsGbValores
Nº SIG.....: WO18367
Data.......: 03/02/2025
Responsável: Edilaine
Descrição..: Alterar o percentual aplicado para concessão de Pensão Reg/Replan
             (atualmente o beneficio calcula 80% do valor cheio antes de ratear
             pelo grupo familiar. A nova regra estipula 50%+10% por dependente,
             limitado a 80%. Para 2 dependentes, o beneficio será 70% do cheio)
--------------------------------------------------------------------------------
Nº SIG.....: 123822
Data.......: 31/03/2022
Responsável: Ewerton Beltramini
Descrição..: Correção no calculo do indice para visualizar no relatório.
--------------------------------------------------------------------------------
Alteração  : MontaSQLRelatorio
Nº SIG.....: 123442
Data.......: 24/02/2022
Responsável: Edilaine
Descrição..: Trazer o valor do maior indice utilizado
--------------------------------------------------------------------------------
Nº SIG.....:  84282
Data.......: 18/02/2022
Responsável: Ewerton Beltramini
Descrição..: Inclusão de Informação: Valor do índice utilizado, valor em cotas e quantidade de cotas
--------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 103584
Data.......: 20/10/2020
Responsável: André Imakawa
Descrição..: Inclusão do Campo Situação do Benefício
-------------------------------------------------------------------------------
Alteração  : ReajustaBenefConc,
Nº SIG.....: 89790
Data.......: 02/08/2019
Responsável: edilaine
Descrição..: BS e FAB nao correspondem ao valor total do beneficio
-------------------------------------------------------------------------------
Alteração  : .dfm (qryCorrecao)
Nº SIG.....: SIG TIBERO
Data.......: 29/10/2018
Responsável: Everson Cunha
Descrição..: Inserir alias na tabela HSTCONTRIBPREV
-------------------------------------------------------------------------------
Alteração  : MontaSQLRelatorio, rpDemonstraConcessaoFuncef e sqlDemonstraFuncef
Nº SIG.....: 73411
Data.......: 15/08/2018
Responsável: Andre Imakawa
Descrição..: Alterado Query do objeto sqlDemonstraFuncef e MontaSQLRelatorio
             para buscar a DataConcessão e Idlote do registro ja Concedido.
-------------------------------------------------------------------------------
Alteração  : ppDetalheBeforePrint
Nº SIG.....: 69154
Data.......: 30/05/2018
Responsável: Edilaine Ferraresi/Luiz Carlos
Descrição..: Ajuste na emissão do demonstrativo para não exibir reg duplicados de correcoes
-------------------------------------------------------------------------------
Alteração  : ppDetalheBeforePrint
Nº SIG.....: 60818
Data.......: 28/12/2017
Responsável: Andre Imakawa
Descrição..: Exibir memoria de calculo quando IdPlanoPrevContab = 2.
-------------------------------------------------------------------------------
Alteração  : (.dfm NOMEPERFIL) rpDemonstraConcessaoFuncef, sqlDemonstraFuncef, MontaSQLRelatorio
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
-------------------------------------------------------------------------------
Alteração  : (dfm) rpDemonstraConcessaoFuncef
Nº SIG.....: 48492
Data.......: 14/06/2017
Responsável: Andre Imakawa
Descrição..: Acerto dos campos com valores wordwrap = false
-------------------------------------------------------------------------------
Alteração  : (dfm) qryHstContribP, qryHstContrib, rpDemonstraConcessaoFuncef
Nº SIG.....: 32303
Data.......: 31/10/2016
Responsável: Edilaine Ferraresi
Descrição..: Equacionamento - separação das contribuições em grupo
-------------------------------------------------------------------------------
Alteração  : Erro ao visualizar o relatorio
Nº SIG.....: 18775
KTN / PPM  : 1375567
Data       : 14/04/2016
Responsável: William Moreira da Silva
Descrição..: Erro ao visualizar o relatorio
-------------------------------------------------------------------------------
Alteração  : (dfm) sqlDemonstraFuncef, CrmRptCMBeforePrint, rpDemonstraConcessaoFuncefBeforePrint,
             AbreConsultas, SalvarArquivoDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : ppGroupFooterBand3AfterPrint
Nº SOL.....: 270813
KTN / PPM  : 1336094
Data       : 17/03/2016
Responsável: Edilaine
Descrição..: após conceder pensao INSS o 2o demonstrativo apresenta erro
{-------------------------------------------------------------------------------
Alteração  : rpDemonstraConcessaoFuncef, CrmRptCMBeforePrint, ppDetalheBeforePrint
Nº SOL.....: 253577-18094
KTN / PPM  : 1269549
Data       : 02/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associação de taxas
{-------------------------------------------------------------------------------
Alteração  : TotalizaLancamentos
Nº SOL.....: 253577-18064
KTN / PPM  : 1240079
Data       : 14/01/2016
Responsável: Edilaine
Descrição..: quando do uso do alterador esta duplicando valores ao mudar de pag
{-------------------------------------------------------------------------------
Alteração  : CmpRptCM, SubRelCorrecaoPrint,  VerificaCorrecoes, SubRelSomasPrint,
             sqlDemonstraFuncef
Nº SOL.....: 262968
KTN / PPM  : 1102753
Data       : 06/10/2015
Responsável: Edilaine
Descrição..: erro ao gerar demonstrativo quando há lançamento de alterador
{-------------------------------------------------------------------------------
Alteração  : criação do demonstrativo
Nº SOL.....: 253577-17464
KTN / PPM  : 955703
Data       : 02/07/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - concessão
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, uCmSqlParams,
  DBClient, uCMClientDataSet, DBTables, Wwquery, Wwdatsrc, ppDB, ppDBPipe,
  ppDBBDE, ppParameter, daDataModule, ppModule, raCodMod, ppBands, ppClass,
  ppCtrls, ppReport, ppStrtch, ppSubRpt, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, UParticipante, USistema, UBeneficio, UFuncoesUteis, UMensErro,
  Provider, UDataBase, ShellApi, FileCtrl;

type
  TRptDemonstraConcessao = class(TFrmCmReport)
    ppDemonstraFuncef: TppBDEPipeline;
    dsDemonstraFuncef: TwwDataSource;
    dsHstBenef: TwwDataSource;
    dsHstContribA: TwwDataSource;
    qryHstBenef: TwwQuery;
    qryHstBenefNOME: TStringField;
    qryHstBenefMESREFERENCIA: TStringField;
    qryHstBenefDATAPAGAMENTO: TDateTimeField;
    qryHstBenefVALORFAB: TFloatField;
    qryHstBenefVALORBS: TFloatField;
    qryHstBenefVLRBASEDEFICIT: TFloatField;
    qryHstBenefVALORPREV: TFloatField;
    qryHstContribP: TwwQuery;
    ppHstContribA: TppBDEPipeline;
    ppHstBenef: TppBDEPipeline;
    ppDetFuncefppField1: TppField;
    ppDetFuncefppField2: TppField;
    ppDetFuncefppField3: TppField;
    ppDetFuncefppField4: TppField;
    ppDetFuncefppField5: TppField;
    ppDetFuncefppField6: TppField;
    ppDetFuncefppField7: TppField;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    qryBenefIDBENEFICIO: TFloatField;
    qryBenefIDPESSOA: TFloatField;
    qryBenefIDPESSJUR: TFloatField;
    qryBenefNOME: TStringField;
    qryBenefVALORATUAL: TFloatField;
    qryBenefVALORTOTAL: TFloatField;
    qryBenefVLRBSATUAL: TFloatField;
    qryBenefVLRBSTOTAL: TFloatField;
    qryBenefVLRFABATUAL: TFloatField;
    qryBenefVLRFABTOTAL: TFloatField;
    qryBenefVLRBASEDEFICIT: TFloatField;
    ppBenef: TppBDEPipeline;
    dsCorrecao: TwwDataSource;
    ppCorrecao: TppBDEPipeline;
    dsMemoria: TwwDataSource;
    ppMemoria: TppBDEPipeline;
    qryLegenda: TwwQuery;
    dsLegenda: TwwDataSource;
    ppLegenda: TppBDEPipeline;
    ppLegendappField1: TppField;
    ppLegendappField2: TppField;
    qryMemoria: TwwQuery;
    sqlDemonstraFuncef: TwwQuery;
    rpDemonstraConcessaoFuncef: TppReport;
    ppCabec: TppHeaderBand;
    ppDetalhe: TppDetailBand;
    ppRodape: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLine9: TppLine;
    lbl_usuario: TppLabel;
    lblHomolog: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppImage2: TppImage;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine10: TppLine;
    ppDBText3: TppDBText;
    ppLabel50: TppLabel;
    ppDBText11: TppDBText;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppDBText28: TppDBText;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText29: TppDBText;
    ppLine11: TppLine;
    ppLabel62: TppLabel;
    ppLine12: TppLine;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    lbl_banco: TppLabel;
    lbl_agencia: TppLabel;
    lbl_conta: TppLabel;
    lbl_conta2: TppLabel;
    lbl_banco2: TppLabel;
    lbl_agencia2: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    lbl_vlrSalParticip: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText79: TppDBText;
    lbl_dtConcessao: TppLabel;
    ppLine13: TppLine;
    SubRelBenef: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel37: TppLabel;
    ppDBText81: TppDBText;
    lblBSAtu: TppLabel;
    ppDbBSAtu: TppDBText;
    lblBSTot: TppLabel;
    ppDbBSTot: TppDBText;
    lblDeficit: TppLabel;
    ppDBDeficit: TppDBText;
    lblFABAtu: TppLabel;
    ppDbFABAtu: TppDBText;
    lblFABTot: TppLabel;
    ppDbFABTot: TppDBText;
    lblVlrAtual: TppLabel;
    ppDbVlrAtual: TppDBText;
    lblVlrTotal: TppLabel;
    ppDbVlrTotal: TppDBText;
    VlrOriginal: TppLabel;
    lbl_vlrOriginal: TppLabel;
    lblNup: TppLabel;
    lbl_NUP: TppLabel;
    qryBenefNUP: TStringField;
    SubRelHstBenef: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLabel41: TppLabel;
    ppLabel95: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppVlrFAB: TppDBText;
    ppDBText92: TppDBText;
    ppVlrDeficit: TppDBText;
    ppLine20: TppLine;
    ppDBText94: TppDBText;
    ppVlrBS: TppDBText;
    SubRelHstContrib: TppSubReport;
    ppChildReport9: TppChildReport;
    ppTitleBand9: TppTitleBand;
    ppBndDetHCA: TppDetailBand;
    ppSummaryBand9: TppSummaryBand;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppHCAvlrPag: TppDBText;
    ppHCAvlrdesc: TppDBText;
    ppLine23: TppLine;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppShape37: TppShape;
    ppShape41: TppShape;
    lblAvisoContrib: TppLabel;
    SubRelMemoria: TppSubReport;
    ppChildReport11: TppChildReport;
    SubRelLegenda: TppSubReport;
    ppChildReport12: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppDetailBand11: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    ppLabel120: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppTitleBand11: TppTitleBand;
    ppDetailBand12: TppDetailBand;
    ppSummaryBand11: TppSummaryBand;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    qryMemoriaIDCALCULO: TFloatField;
    qryMemoriaIDDETCALCULO: TFloatField;
    qryMemoriaDESCRICAO: TStringField;
    qryMemoriaVALOR: TStringField;
    qryMemoriaIDBENEFICIO: TFloatField;
    qryMemoriaNOMEBENEFICIO: TStringField;
    qryLegendaCODIGO: TFloatField;
    qryLegendaPLANO: TStringField;
    ppLine16: TppLine;
    ppLine17: TppLine;
    SubRelSomas: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel119: TppLabel;
    lbl_totalBenef: TppLabel;
    ppLabel121: TppLabel;
    lbl_totalContrib: TppLabel;
    ppLine14: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    qryConsulta: TwwQuery;
    qryAux: TwwQuery;
    lblNomUsuario: TppLine;
    qryBenefFLGAPRESENTABSFAB: TFloatField;
    qryBenefFLGAPRESENTADEFICIT: TFloatField;
    qryBenefVALORNADIB: TFloatField;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    qryBenefTIPOOPCAOIR: TStringField;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppdbDER: TppDBText;
    qryBenefDIB: TDateTimeField;
    qryBenefDIP: TDateTimeField;
    qryBenefDIBANT: TDateTimeField;
    qryBenefDER: TDateTimeField;
    qryHstBenefFLGAPRESENTABSFAB: TFloatField;
    qryHstBenefFLGAPRESENTADEFICIT: TFloatField;
    qryHstContribPIDCONTRIBUICAO: TFloatField;
    qryHstContribPNOME: TStringField;
    qryHstContribPFLGPAGADOR: TStringField;
    qryHstContribPMESREFERENCIA: TStringField;
    qryHstContribPVLRDEVOLVER: TFloatField;
    qryHstContribPVLRCOBRAR: TFloatField;
    qryHstContribPMESCOBRANCA: TStringField;
    qryHstContribA: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    SubRelHstContribP: TppSubReport;
    ppChildReport2: TppChildReport;
    dsHstContribP: TwwDataSource;
    ppHstContribP: TppBDEPipeline;
    ppTitleBand2: TppTitleBand;
    ppBndDetHCP: TppDetailBand;
    ppSumarioA: TppSummaryBand;
    lblAvisoContribP: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppHCPvlrPag: TppDBText;
    ppHCPvlrdesc: TppDBText;
    ppLine1: TppLine;
    ppShape3: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape18: TppShape;
    SubRelCorrecao: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel14: TppLabel;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    qryHstContribANUMRECEBIMENTO: TFloatField;
    qryHstContribPNUMRECEBIMENTO: TFloatField;
    qryCorrecao: TwwQuery;
    ppLine2: TppLine;
    updCorrecao: TUpdateSQL;
    qryCorrecaoSTIPO: TStringField;
    qryCorrecaoNOME: TStringField;
    qryCorrecaoIDPESSOA: TFloatField;
    qryCorrecaoMESREFERENCIA: TStringField;
    qryCorrecaoRECEBER: TFloatField;
    qryCorrecaoPAGAR: TFloatField;
    cdsCorrecao: TCMClientDataSet;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    qryBenefDATAFINAL: TDateTimeField;
    dspCorrecao: TDataSetProvider;
    qryCorrecaoNUMRECEBIMENTO: TFloatField;
    cdsCorrecaoSTIPO: TStringField;
    cdsCorrecaoNOME: TStringField;
    cdsCorrecaoIDPESSOA: TFloatField;
    cdsCorrecaoMESREFERENCIA: TStringField;
    cdsCorrecaoRECEBER: TFloatField;
    cdsCorrecaoPAGAR: TFloatField;
    cdsCorrecaoNUMRECEBIMENTO: TFloatField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel17: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    ppDBText21: TppDBText;
    ppBenefppField17: TppField;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    qryBenefDESC_SITBENEF: TStringField;
    ppLabelLote: TppLabel;
    ppLabelVersao: TppLabel;
    SubRelAcJud: TppSubReport;
    ppChildReportAcJudDeficit: TppChildReport;
    ppTitleBandAcJudDeficit: TppTitleBand;
    ppShapeTitleBandAcJudDeficit1: TppShape;
    ppLabelTitleBandAcJudDeficit1: TppLabel;
    ppShapeTitleBandAcJudDeficit2: TppShape;
    ppLabelAcJudANOMESFIMACJUDDEFICIT: TppLabel;
    ppLabelAcJudANOMESINIACJUDDEFICIT: TppLabel;
    ppLabelAcJudPERCACJUDDEFICIT: TppLabel;
    ppLabelAcJudNOME: TppLabel;
    ppLineTitleBandAcJudDeficit3: TppLine;
    ppLineTitleBandAcJudDeficit2: TppLine;
    ppLineTitleBandAcJudDeficit1: TppLine;
    ppDetailBandAcJudDeficit: TppDetailBand;
    ppShapeDetailBandAcJudDeficit1: TppShape;
    ppLineDetailBandAcJudDeficit3: TppLine;
    ppLineDetailBandAcJudDeficit2: TppLine;
    ppLineDetailBandAcJudDeficit1: TppLine;
    ppDBTextAcJudANOMESINIACJUDDEFICIT: TppDBText;
    ppDBTextAcJudANOMESFIMACJUDDEFICIT: TppDBText;
    ppDBTextAcJudPERCACJUDDEFICIT: TppDBText;
    ppDBTextAcJudNOME: TppDBText;
    ppAcJudDeficit: TppBDEPipeline;
    ppAcJudDeficitppField1: TppField;
    ppAcJudDeficitppField2: TppField;
    ppAcJudDeficitppField3: TppField;
    ppAcJudDeficitppField4: TppField;
    ppAcJudDeficitppField5: TppField;
    dsAcJudDeficit: TwwDataSource;
    qryAcJudDeficit: TwwQuery;
    qryAcJudDeficitIDCONTRIBUICAO: TFloatField;
    qryAcJudDeficitNOME: TStringField;
    qryAcJudDeficitPERCACJUDDEFICIT: TFloatField;
    qryAcJudDeficitANOMESINIACJUDDEFICIT: TStringField;
    qryAcJudDeficitANOMESFIMACJUDDEFICIT: TStringField;
    LblVlIndice: TppLabel;
    raCodeModule3: TraCodeModule;
    LblQtdCotas: TppLabel;
    LblVlIndiceTitulo: TppLabel;
    LblQtdCotasTitulo: TppLabel;
    pplblPercPensao: TppLabel;
    ppDbPercPensao: TppDBText;
    SubRelBsFabTit: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppBsFabTit: TppBDEPipeline;
    dsBsFabTit: TwwDataSource;
    qryBsFabTit: TwwQuery;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine8: TppLine;
    ppDBText22: TppDBText;
    ppLabel21: TppLabel;
    ppDBText23: TppDBText;
    lblVlrTotTit: TppLabel;
    ppDBVlrTotTit: TppDBText;
    ppDBText25: TppDBText;
    ppLabel23: TppLabel;
    raCodeModule4: TraCodeModule;
    ppLine6: TppLine;
    ppDBText24: TppDBText;
    procedure lbl_NUP_Print(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure lbl_conta_Print(Sender: TObject);
    procedure lbl_vlrOriginalPrint(Sender: TObject);
    procedure ppHCAvlrPagPrint(Sender: TObject);
    procedure ppRodapeBeforePrint(Sender: TObject);
    procedure ppHCAvlrdescPrint(Sender: TObject);
    procedure ppSummaryBand9BeforePrint(Sender: TObject);
    procedure qryBenefAfterScroll(DataSet: TDataSet);
    procedure ppTitleBand1BeforePrint(Sender: TObject);
    procedure ppVlrFABGetText(Sender: TObject; var Text: String);
    procedure ppVlrBSGetText(Sender: TObject; var Text: String);
    procedure ppVlrDeficitGetText(Sender: TObject; var Text: String);
    procedure ppSumarioABeforePrint(Sender: TObject);
    procedure ppHCPvlrPagPrint(Sender: TObject);
    procedure ppHCPvlrdescPrint(Sender: TObject);
    procedure ppDetalheBeforePrint(Sender: TObject);
    procedure ppDBText19GetText(Sender: TObject; var Text: String);
    procedure ppDBText20GetText(Sender: TObject; var Text: String);
    procedure qryHstContribAAfterScroll(DataSet: TDataSet);
    procedure qryHstContribPAfterScroll(DataSet: TDataSet);
    procedure SubRelCorrecaoPrint(Sender: TObject);
    procedure SubRelSomasPrint(Sender: TObject);
    procedure ppGroupFooterBand3AfterPrint(Sender: TObject);
    procedure rpDemonstraConcessaoFuncefBeforePrint(Sender: TObject);
    procedure LblVlIndiceGetText(Sender: TObject; var Text: String);
    procedure LblQtdCotasGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    imprimiuRodapteGrupoRelatorio : Boolean;
    bAlgumPagadorPatro : boolean;
    rTotalBeneficio    : currency;
    rTotalContribuicao : currency;
    sprocessos         : string;          // edilaine - SOL 253577-18094 / PPM 1269549

    lstCorrecoes       : TStringList;     // edilaine - SOL 262968 / PPM 1102753
    iIdPessoaControle  : integer;         // edilaine - SOL 262968 / PPM 1102753
    rTotContribCorr    : currency;        // edilaine - SOL 262968 / PPM 1102753
    rTotBenefCorr      : currency;        // edilaine - SOL 262968 / PPM 1102753

    procedure VerificaCorrecoes(iNumRecebimento : integer);     // edilaine - SOL 262968 / PPM 1102753
    procedure TotalizaLancamentos;     // edilaine - SOL 262968 / PPM 1102753

  public
    { Public declarations }
    procedure AbreConsultas(sListaParametros : string);       // edilaine - SOL 253577-18174 / PPM 1327585
    procedure SalvarArquivoDemonstrativo;                     // edilaine - SOL 253577-18174 / PPM 1327585
    procedure MontaSQLRelatorio;                              // edilaine - SIG55933
  end;

var
  RptDemonstraConcessao: TRptDemonstraConcessao;

implementation

uses DAPrev;

{$R *.DFM}




{ TFrmDemonstraConcessao }


procedure TRptDemonstraConcessao.lbl_NUP_Print(Sender: TObject);
var
   sNup : String;
begin
  inherited;
  sNup            := qryBenef.FieldByName('NUP').AsString + '______________';
  lbl_NUP.Caption := sNup[1]+sNup[2]+sNup[3]+sNup[4]+sNup[5]+'.'+
                     sNup[6]+sNup[7]+sNup[8]+sNup[9]+sNup[10]+sNup[11]+'/'+
                     sNup[12]+sNup[13]+sNup[14]+sNup[15];
end;

procedure TRptDemonstraConcessao.CrmRptCMBeforePrint(Sender: TObject);
var
   sSalarioNaDib : string;
begin
  {// edilaine - SOL 253577-18174 / PPM 1327585 - comentado inicio
  sprocessos := copy(CmpRptCM.ParamValues[5].AsString, 5, length(CmpRptCM.ParamValues[5].AsString)); // edilaine - SOL 253577-18094 / PPM 1269549
  // dados gerais
  sqlDemonstraFuncef.Close;
  sqlDemonstraFuncef.Sql.Text := StringReplace( sqlDemonstraFuncef.Sql.Text, '&NUMEROPROCESSO', sprocessos, [rfReplaceAll]); // edilaine - SOL 253577-18094 / PPM 1269549
  sqlDemonstraFuncef.ParamByName('NUMLOTE').AsString        := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
  sqlDemonstraFuncef.ParamByName('IDTITULAR').AsInteger     := CmpRptCM.ParamValues[1].AsInteger;
  sqlDemonstraFuncef.ParamByName('IDPESSJUR').AsInteger     := CmpRptCM.ParamValues[2].AsInteger;
  sqlDemonstraFuncef.ParamByName('IDPLANOPREV').AsInteger   := CmpRptCM.ParamValues[3].AsInteger;
  sqlDemonstraFuncef.ParamByName('SEQPROPOSTA').AsInteger   := CmpRptCM.ParamValues[4].AsInteger;
  //sqlDemonstraFuncef.ParamByName('NUMEROPROCESSO').AsString := CmpRptCM.ParamValues[5].AsString;    // edilaine - SOL 253577-18094 / PPM 1269549
  sqlDemonstraFuncef.ParamByName('EVENTO').AsString         := CmpRptCM.ParamValues[6].AsString;
  sqlDemonstraFuncef.ParamByName('DTEVENTO').AsString       := CmpRptCM.ParamValues[7].AsString;
  sqlDemonstraFuncef.ParamByName('TIPOCONCESSAO').AsString  := CmpRptCM.ParamValues[10].AsString;      // edilaine - SOL 262968 / PPM 1102753
  sqlDemonstraFuncef.Open;

  // Salario de participação
  sSalarioNaDib := BuscaSalarioPESSOAINTEGRAL(dtmAPrev.qry,
                                              CmpRptCM.ParamValues[2].AsInteger,
                                              CmpRptCM.ParamValues[3].AsInteger,
                                              CmpRptCM.ParamValues[1].AsInteger,
                                              CmpRptCM.ParamValues[4].AsInteger,
                                              'AS',
                                              FormatDateTime('yyyy/mm', sqlDemonstraFuncef.FieldByName('DIB').AsDateTime)
                                              );

  lbl_vlrSalParticip.caption := 'R$ '+FormatFloat('#,#0.00', StrToFloat(sSalarioNaDib));
  lbl_dtConcessao.caption    := FormatDateTime('dd/mm/yyyy', Date);
  //lbl_numprocesso.caption    := CmpRptCM.ParamValues[5].AsString;     // edilaine - SOL 253577-18094 / PPM 1269549 - COMENTADO

  lbl_usuario.Caption := Sistema.NomeUsuario;


  //Preenche correcoes
  // edilaine - SOL 262968 / PPM 1102753 - inicio
  {lstCorrecoes := TStringList.create;
  lstValores   := TStringList.create;
  ExtractStrings(['#'], [], Pchar(CmpRptCM.ParamValues[10].AsString), lstCorrecoes);

  //cdsCorrecao.CreateDataSet;
  qryCorrecao.open;

  for index := 0 to lstCorrecoes.Count-1 do
  begin
    ExtractStrings([';'], [], PChar(lstCorrecoes[index]), lstValores);

    qryCorrecao.Insert;
    qryCorrecao.FieldByName('sTipo').AsString         := lstValores[0];
    qryCorrecao.FieldByName('iIdPessoa').AsString     := lstValores[1];
    qryCorrecao.FieldByName('sAnoMes').AsString       := lstValores[2];
    qryCorrecao.FieldByName('sContribBenef').AsString := lstValores[3];
    qryCorrecao.FieldByName('rReceber').AsString      := lstValores[4];
    qryCorrecao.FieldByName('rPagar').AsString        := lstValores[5];
    qryCorrecao.Post;
  end;
  }{
  lstCorrecoes := TStringList.create;
  cdsCorrecao.CreateDataSet;
  iIdPessoaControle := -1;
  // edilaine - SOL 262968 / PPM 1102753 - fim

  //homologação
  if Trim(CmpRptCM.ParamValues[11].AsString) = 'visualiza' then
     lblHomolog.Caption := 'Benefício Não Homologado - Apenas para Conferência'
  else
     lblHomolog.Caption := 'Benefício Homologado - '+CmpRptCM.ParamValues[11].AsString;
  } // edilaine - SOL 253577-18174 / PPM 1327585 - comentado fim
end;

procedure TRptDemonstraConcessao.lbl_conta_Print(Sender: TObject);
begin
  inherited;

  lbl_conta.caption   := '';
  lbl_banco.caption   := '';
  lbl_agencia.caption := '';

  lbl_conta2.caption   := '';
  lbl_banco2.caption   := '';
  lbl_agencia2.caption := '';


  {Conta Bancária}
  with TwwQuery.create(nil) do
    try
      DatabaseName := 'BaseDados';

      SQL.Clear;
      SQL.Add('SELECT C.CONTACORRENTE, C.FLGCONTAPREF, C.TIPOCONTA, C.FLGCONTARESGATE,');
      SQL.Add('       A.NUMAGENCIA, PB.NOME AS NOMEBANCO ');
      SQL.Add('  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C ');
      SQL.Add(' WHERE (C.IDAGENCIA = A.IDPESSOA)  ');
      SQL.Add('   AND (A.IDBANCO = B.IDPESSOA)    ');
      SQL.Add('   AND (B.IDPESSOA = PB.IDPESSOA)  ');
      SQL.Add('   AND (C.FLGCONTAINATIVA = ''N'') ');
      //SQL.Add('   AND ((C.TIPOCONTA = 2) or (c.flgcontapref = 1)) ');         // edilaine - SOL 262968 / PPM 1102753
      SQL.Add('   AND ((C.TIPOCONTA = 2)  ');

      // edilaine - SOL 262968 / PPM 1102753 - inicio
      If FazQuery( QryAux, 'SELECT * FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(CmpRptCM.ParamValues[0].AsInteger)+ ' AND NVL(FLGRESGATE,0) = 1') Then
         SQL.Add('  OR (NVL(C.FLGCONTARESGATE,0) = 1) )')
      else
         SQL.Add('  OR (C.FLGCONTAPREF = 1) )');
      // edilaine - SOL 262968 / PPM 1102753 - fim

      SQL.Add('   AND (C.IDPESSOA = '+ sqlDemonstraFuncef.FieldByName('IDPESSOA').AsString +') ');
      SQL.Add(' ORDER BY c.tipoconta desc ');
      Open;
      if not isEmpty then
      begin
        while not eof do
        begin
          if (FieldByName('TIPOCONTA').AsInteger = 2) then
          begin
            lbl_conta.caption   := fieldbyname('CONTACORRENTE').text;
            lbl_banco.caption   := fieldbyname('NOMEBANCO').text;
            lbl_agencia.caption := fieldbyname('NUMAGENCIA').text;
          end
          else if (FieldByName('FLGCONTAPREF').AsInteger = 1) or        // preferencial
                  (FieldByName('FLGCONTARESGATE').AsInteger = 1) then   // conta resgate       // edilaine - SOL 262968 / PPM 1102753
          begin
            lbl_conta2.caption   := fieldbyname('CONTACORRENTE').text;
            lbl_banco2.caption   := fieldbyname('NOMEBANCO').text;
            lbl_agencia2.caption := fieldbyname('NUMAGENCIA').text;
          end;
          next;
        end;
      end
      else
        lbl_conta.caption := '< não cadastrada até o momento > ';

    finally
      Free;
    end;
end;

procedure TRptDemonstraConcessao.lbl_vlrOriginalPrint(Sender: TObject);
var
  dValorNaDib : double;
begin
  inherited;
  {calcular Beneficio Original}
  //edilaine - SIG89790 - inicio
  {if sqlDemonstraFuncef.FieldByName('TIPORECEBE').AsString = 'APOSENTADORIA'  then
     dValorNaDib := PegaValorIntegral(dtmAPrev.qry,
                                      sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsInteger,         // edilaine - SOL 253577-18094 / PPM 1269549
                                      qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                      CmpRptCM.ParamValues[1].AsInteger,
                                      sqlDemonstraFuncef.FieldByName('DIB').AsString )
  else
  }//edilaine - SIG89790 - fim
     dValorNaDib := qryBenef.FieldByName('VALORNADIB').AsCurrency;

  lbl_vlrOriginal.caption := 'R$ '+FormatFloat('#,#0.00', dValorNaDib);
end;

procedure TRptDemonstraConcessao.ppHCAvlrPagPrint(Sender: TObject);
begin

  if qryHstContribA.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCAvlrPag.Caption := ppHCAvlrPag.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;

end;

procedure TRptDemonstraConcessao.ppRodapeBeforePrint(Sender: TObject);
begin
  inherited;

  lblNomUsuario.visible := imprimiuRodapteGrupoRelatorio;
  lbl_usuario.visible   := imprimiuRodapteGrupoRelatorio;
end;

procedure TRptDemonstraConcessao.ppHCAvlrdescPrint(Sender: TObject);
begin
  inherited;

  if qryHstContribA.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCAvlrdesc.Caption := ppHCAvlrdesc.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;
end;

procedure TRptDemonstraConcessao.ppSummaryBand9BeforePrint(
  Sender: TObject);
begin
  inherited;
  lblAvisoContrib.visible := bAlgumPagadorPatro;
end;

procedure TRptDemonstraConcessao.qryBenefAfterScroll(DataSet: TDataSet);
begin
  inherited;
  {Apresenta BS e FAB}
  lblBSAtu.Visible  := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  lblBSTot.Visible  := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  lblFABAtu.Visible := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  lblFABTot.Visible := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;

  ppDbBSAtu.Visible  := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  ppDbBSTot.Visible  := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  ppDbFABAtu.Visible := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
  ppDbFABTot.Visible := qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;

  {apresenta Deficit}
  lblDeficit.Visible  := qryBenef.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1;
  ppDBDeficit.Visible := qryBenef.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1;

  {arruma disposicao}
  if qryBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 0 then
  begin
    lblVlrAtual.Left := lblBSAtu.Left;
    lblVlrTotal.Left := lblBSTot.Left;
  end
  else
  begin
    lblVlrAtual.Left := ppdbDER.Left;
    lblVlrTotal.Left := ppdbDER.Left;
  end;

  if qryBenef.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 0 then
    VlrOriginal.Left := lblDeficit.left
  else
    VlrOriginal.Left := ppdbDER.Left;

  ppDbVlrAtual.Left := lblVlrAtual.Left + lblVlrAtual.Width + 0.53;
  ppDbVlrTotal.Left := lblVlrTotal.Left + lblVlrTotal.Width + 0.53;
  lbl_vlrOriginal.Left := VlrOriginal.Left + VlrOriginal.width + 0.53;
end;

procedure TRptDemonstraConcessao.ppTitleBand1BeforePrint(Sender: TObject);
begin
  inherited;
  // edilaine - SOL 262968 / PPM 1102753 - inicio
  lbl_totalBenef.caption   := 'R$ '+FormatFloat('#,#0.00', rTotalBeneficio + rTotBenefCorr);                  // edilaine - SOL 262968 / PPM 1102753
  lbl_totalContrib.caption := 'R$ '+FormatFloat('#,#0.00', rTotalContribuicao - rTotContribCorr);             // edilaine - SOL 262968 / PPM 1102753
  // edilaine - SOL 262968 / PPM 1102753 - fim
end;

procedure TRptDemonstraConcessao.ppVlrFABGetText(Sender: TObject;
  var Text: String);
begin
  if qryHstBenef.FieldbyName('FLGAPRESENTABSFAB').AsInteger = 0 then
     Text := '----------';
end;

procedure TRptDemonstraConcessao.ppVlrBSGetText(Sender: TObject;
  var Text: String);
begin
  if qryHstBenef.FieldbyName('FLGAPRESENTABSFAB').AsInteger = 0 then
     Text := '----------';
end;

procedure TRptDemonstraConcessao.ppVlrDeficitGetText(Sender: TObject;
  var Text: String);
begin
  if qryHstBenef.FieldbyName('FLGAPRESENTADEFICIT').AsInteger = 0 then
     Text := '----------';
end;

procedure TRptDemonstraConcessao.ppSumarioABeforePrint(Sender: TObject);
begin
  inherited;
  lblAvisoContribP.visible := bAlgumPagadorPatro;
end;

procedure TRptDemonstraConcessao.ppHCPvlrPagPrint(Sender: TObject);
begin
  inherited;
  if qryHstContribP.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCPvlrPag.Caption := ppHCPvlrPag.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;
end;

procedure TRptDemonstraConcessao.ppHCPvlrdescPrint(Sender: TObject);
begin
  inherited;
  if qryHstContribP.FieldByName('FLGPAGADOR').AsString <> 'C' then
  begin
    ppHCPvlrdesc.Caption := ppHCPvlrdesc.Caption + ' (*)';
    bAlgumPagadorPatro := true;
  end;

end;

procedure TRptDemonstraConcessao.ppDetalheBeforePrint(Sender: TObject);
Var iIdPlanPrevContab: Integer;
begin
  inherited;

  imprimiuRodapteGrupoRelatorio := false;

  //if iIdPessoaControle <> sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger then           // edilaine - SOL 253577-18094 / PPM 1269549
  begin
    // edilaine - SOL 262968 / PPM 1102753 - inicio
    lstCorrecoes.clear;
    cdsCorrecao.EmptyDataSet;

    rTotalBeneficio    := 0;
    rTotalContribuicao := 0;

    rTotBenefCorr      := 0;
    rTotContribCorr    := 0;
    // edilaine - SOL 262968 / PPM 1102753 - fim

    //edilaine WO18763 : inicio
    {Dados Titular - BS e FAB}
    qryBsFabTit.close;
    qryBsFabTit.ParamByName('NUMEROPROCESSO').AsString := sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsString;
    //qryBsFabTit.ParamByName('IDPESSOA').Asinteger      := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
    qryBsFabTit.Open;

    SubRelBsFabTit.Visible := (qryBsFabTit.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1) and
                              (qryBsFabTit.FieldByName('PERCPENSAO').AsInteger > 0);
    lblVlrTotTit.visible   := (SubRelBsFabTit.Visible) and (qryBsFabTit.FieldByName('VLRTOTALTITULAR').AsInteger > 0);
    ppDBVlrTotTit.visible  := lblVlrTotTit.visible;
    //edilaine WO18763 : inicio

    {Beneficios}
    qryBenef.close;
    qryBenef.ParamByName('NUMEROPROCESSO').AsString := sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsString; // edilaine - SOL 253577-18094 / PPM 1269549
    qryBenef.ParamByName('IDPESSOA').Asinteger      := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
    qryBenef.Open;


    {Historico de Beneficios - Valores a pagar/receber}
    qryHstBenef.Close;
    qryHstBenef.ParamByName('NUMEROPROCESSO').AsString := sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsString; // edilaine - SOL 253577-18094 / PPM 1269549
    qryHstBenef.ParamByName('IDPESSOA').Asinteger      := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
    qryHstBenef.Open;


    {Contribuições - aposentadoria}
    bAlgumPagadorPatro := false;
    rTotalContribuicao := 0;

    if sqlDemonstraFuncef.FieldByName('TIPORECEBE').AsString = 'APOSENTADORIA'  then
    begin
      qryHstContribA.Close;
      qryHstContribA.ParamByName('idpessoa').AsInteger    := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
      qryHstContribA.ParamByName('idlote').AsInteger      := CmpRptCM.ParamValues[0].AsInteger;
      qryHstContribA.ParamByName('IDPESSJUR').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
      qryHstContribA.ParamByName('IDPLANOPREV').AsInteger := CmpRptCM.ParamValues[3].AsInteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
      //qryHstContribA.ParamByName('DTCONCESSAO').AsDateTime  := StrToDateTime(CmpRptCM.ParamValues[8].AsString);
      if Trim(CmpRptCM.ParamValues[11].AsString) = 'visualiza' then
         qryHstContribA.ParamByName('IDBENEFICIO').AsInteger   := 0
      else
         qryHstContribA.ParamByName('IDBENEFICIO').AsInteger   := qryBenef.FieldByName('IDBENEFICIO').Asinteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - fim
      qryHstContribA.ParamByName('DTCONCESSAO').AsDateTime := StrToDateTime( CmpRptCM.ParamValues[8].AsString );    //Edilaine - SIG32303

      qryHstContribA.Open;

      // Alterado por FHBS - 11/09/2019 - SIG50850
      qryAcJudDeficit.Close;
      qryAcJudDeficit.SQL.Clear;
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME');
      qryAcJudDeficit.SQL.Add('      ,AC.PERCACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESINIACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESFIMACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('  FROM HSTCONTRIBPREV H');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBUICAO CO');
      qryAcJudDeficit.SQL.Add('      ,CONTPREV CP');
      qryAcJudDeficit.SQL.Add('      ,BENEFXTAXA BXT');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBPARTPACJUDDEFICIT AC');
      qryAcJudDeficit.SQL.Add(' WHERE H.IDLOTE = :IDLOTE');
      qryAcJudDeficit.SQL.Add('   AND H.IDPESSJUR = :IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND H.IDPLANOPREV = :IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND H.IDPESSOA = :IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND H.SEQPROPOSTA = 1');
      qryAcJudDeficit.SQL.Add('   AND H.FLGDESCFOLHA = 1');
      qryAcJudDeficit.SQL.Add('   AND H.FLGCONCESSAO = 1');
      qryAcJudDeficit.SQL.Add('   AND CO.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND CP.IDPLANOPREV = H.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND CP.IDCONTRIBUICAO = BXT.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND H.TRGDTINCLUSAO >= :DTCONCESSAO');
      qryAcJudDeficit.SQL.Add('   AND ((BXT.IDBENEFICIO = :IDBENEFICIO) OR (:IDBENEFICIO = 0))');
      qryAcJudDeficit.SQL.Add('   AND AC.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDPESSJUR = H.IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND AC.IDPLANOPREV = H.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND AC.IDPESSOA = H.IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND AC.SEQPROPOSTA = H.SEQPROPOSTA');
      qryAcJudDeficit.SQL.Add('   AND H.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM''))');
      qryAcJudDeficit.SQL.Add(' ORDER BY CO.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT');

      qryAcJudDeficit.ParamByName('IDPESSOA').AsInteger     := qryHstContribA.ParamByName('IDPESSOA').AsInteger;
      qryAcJudDeficit.ParamByName('IDLOTE').AsInteger       := qryHstContribA.ParamByName('IDLOTE').AsInteger;
      qryAcJudDeficit.ParamByName('IDPESSJUR').AsInteger    := qryHstContribA.ParamByName('IDPESSJUR').AsInteger;
      qryAcJudDeficit.ParamByName('IDPLANOPREV').AsInteger  := qryHstContribA.ParamByName('IDPLANOPREV').AsInteger;
      qryAcJudDeficit.ParamByName('IDBENEFICIO').AsInteger  := qryHstContribA.ParamByName('IDBENEFICIO').AsInteger;
      qryAcJudDeficit.ParamByName('DTCONCESSAO').AsDateTime := qryHstContribA.ParamByName('DTCONCESSAO').AsDateTime;

      qryAcJudDeficit.Open;
      // Fim - Alterado por FHBS - 11/09/2019 - SIG50850

    end
    else
    begin
      qryHstContribP.Close;
      qryHstContribP.ParamByName('idpessoa').AsInteger    := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
      qryHstContribP.ParamByName('idlote').AsInteger      := CmpRptCM.ParamValues[0].AsInteger;
      qryHstContribP.ParamByName('IDPESSJUR').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
      qryHstContribP.ParamByName('IDPLANOPREV').AsInteger := CmpRptCM.ParamValues[3].AsInteger;
      qryHstContribP.ParamByName('IDTITULAR').AsInteger   := CmpRptCM.ParamValues[1].AsInteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
      if Trim(CmpRptCM.ParamValues[11].AsString) = 'visualiza' then
         qryHstContribP.ParamByName('IDBENEFICIO').AsInteger   := 0
      else
         qryHstContribP.ParamByName('IDBENEFICIO').AsInteger   := qryBenef.FieldByName('IDBENEFICIO').Asinteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - fim
      qryHstContribP.ParamByName('DTCONCESSAO').AsDateTime := StrToDateTime( CmpRptCM.ParamValues[8].AsString );  //Edilaine - SIG32303

      qryHstContribP.Open;

      // Alterado por FHBS - 11/09/2019 - SIG50850
      qryAcJudDeficit.Close;
      qryAcJudDeficit.SQL.Clear;
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME');
      qryAcJudDeficit.SQL.Add('      ,AC.PERCACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESINIACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('      ,AC.ANOMESFIMACJUDDEFICIT');
      qryAcJudDeficit.SQL.Add('  FROM HSTCONTRIBPREV H');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBUICAO CO');
      qryAcJudDeficit.SQL.Add('      ,CONTPREV CP');
      qryAcJudDeficit.SQL.Add('      ,BFCIARIOTITPLAN BT');
      qryAcJudDeficit.SQL.Add('      ,BENEFXTAXA BXT');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBPREVNUCLEO CPN');
      qryAcJudDeficit.SQL.Add('      ,CONTRIBNUCLEOACJUDDEFICIT AC');
      qryAcJudDeficit.SQL.Add(' WHERE H.IDLOTE = :IDLOTE');
      qryAcJudDeficit.SQL.Add('   AND H.IDPESSJUR = :IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND H.IDPLANOPREV = :IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND H.SEQPROPOSTA = 1');
      qryAcJudDeficit.SQL.Add('   AND BT.IDPESSJUR = H.IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND BT.IDPLANOPREV = H.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND h.IDpessoa = :IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND BT.IDTITULAR = :IDTITULAR');
      qryAcJudDeficit.SQL.Add('   AND BT.SEQPROPOSTA = 1');
      qryAcJudDeficit.SQL.Add('   AND CO.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND CP.IDPLANOPREV = H.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND CP.IDCONTRIBUICAO = BXT.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND H.TRGDTINCLUSAO >= :DTCONCESSAO');
      qryAcJudDeficit.SQL.Add('   AND ((BXT.IDBENEFICIO = :IDBENEFICIO) OR (:IDBENEFICIO = 0))');
      qryAcJudDeficit.SQL.Add('   AND AC.IDCONTRIBUICAO = CPN.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR');
      qryAcJudDeficit.SQL.Add('   AND AC.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND CPN.IDPESSJUR = H.IDPESSJUR');
      qryAcJudDeficit.SQL.Add('   AND CPN.IDPLANOPREV = H.IDPLANOPREV');
      qryAcJudDeficit.SQL.Add('   AND CPN.IDPESSOA = H.IDPESSOA');
      qryAcJudDeficit.SQL.Add('   AND CPN.SEQPROPOSTA = H.SEQPROPOSTA');
      qryAcJudDeficit.SQL.Add('   AND H.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM''))');
      qryAcJudDeficit.SQL.Add(' ORDER BY CO.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT');

      qryAcJudDeficit.ParamByName('IDPESSOA').AsInteger     := qryHstContribP.ParamByName('IDPESSOA').AsInteger;
      qryAcJudDeficit.ParamByName('IDLOTE').AsInteger       := qryHstContribP.ParamByName('IDLOTE').AsInteger;
      qryAcJudDeficit.ParamByName('IDPESSJUR').AsInteger    := qryHstContribP.ParamByName('IDPESSJUR').AsInteger;
      qryAcJudDeficit.ParamByName('IDPLANOPREV').AsInteger  := qryHstContribP.ParamByName('IDPLANOPREV').AsInteger;
      qryAcJudDeficit.ParamByName('IDTITULAR').AsInteger    := qryHstContribP.ParamByName('IDTITULAR').AsInteger;
      qryAcJudDeficit.ParamByName('IDBENEFICIO').AsInteger  := qryHstContribP.ParamByName('IDBENEFICIO').AsInteger;
      qryAcJudDeficit.ParamByName('DTCONCESSAO').AsDateTime := qryHstContribP.ParamByName('DTCONCESSAO').AsDateTime;

      qryAcJudDeficit.Open;
      // Fim - Alterado por FHBS - 11/09/2019 - SIG50850
    end;

    SubRelAcJud.Visible := (Sistema.IdModulo = 454) and (not qryAcJudDeficit.isEmpty); // Alterado por FHBS - 13/09/2019 - SIG50850;

    // edilaine - SOL 262968 / PPM 1102753 - comentado
    {qryCorrecao.Filtered := false;
    qryCorrecao.Filter   := 'IIDPESSOA = '+ sqlDemonstraFuncef.FieldByName('IdPessoa').AsString;
    qryCorrecao.Filtered := true;
    }

    if CmpRptCM.ParamValues[9].AsString = 'S' then
    begin
      cdsCorrecao.Close;
      qryCorrecao.Close;
      qryCorrecao.ParamByName('NUMPROCESSO').AsString := sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsString; // edilaine - SOL 253577-18094 / PPM 1269549
      qryCorrecao.ParamByName('IDPESSOA').AsInteger   := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;

      //Edilaine Ferraresi/Luiz Carlos - SIG69154 - Inicio
      qryCorrecao.ParamByName('idpessoa').AsInteger    := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
      qryCorrecao.ParamByName('idlote').AsInteger      := CmpRptCM.ParamValues[0].AsInteger;
      qryCorrecao.ParamByName('IDPESSJUR').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
      qryCorrecao.ParamByName('IDPLANOPREV').AsInteger := CmpRptCM.ParamValues[3].AsInteger;
      qryCorrecao.ParamByName('IDTITULAR').AsInteger   := CmpRptCM.ParamValues[1].AsInteger;
      //Edilaine Ferraresi/Luiz Carlos - SIG69154 - Fim
      // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
      if Trim(CmpRptCM.ParamValues[11].AsString) = 'visualiza' then
         qryCorrecao.ParamByName('IDBENEFICIO').AsInteger   := 0
      else
         qryCorrecao.ParamByName('IDBENEFICIO').AsInteger   := qryBenef.FieldByName('IDBENEFICIO').Asinteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - fim
      qryCorrecao.ParamByName('DTCONCESSAO').AsDateTime := StrToDateTime( CmpRptCM.ParamValues[8].AsString );  //Edilaine - SIG32303

      cdsCorrecao.Open;
    end;
    // edilaine - SOL 262968 / PPM 1102753 - fim

    // Andre Imakawa - SIG 60818 - Inicio
    If FazQuery( QryAux, ' SELECT B.IDPLANPREVCONTAB FROM BENEFBFCIARIO B WHERE B.NUMEROPROCESSO = '+ sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsString) Then
      iIdPlanPrevContab := QryAux.FieldByName('IDPLANPREVCONTAB').AsInteger
    Else
      iIdPlanPrevContab := 0;


    if (iIdPlanPrevContab = 0) or (iIdPlanPrevContab = 2) then
    Begin
      {Memoria de Calculo}
      qryMemoria.Close;
      qryMemoria.ParamByName('IDPESSJUR').Asinteger   := CmpRptCM.ParamValues[2].AsInteger;
      qryMemoria.ParamByName('IDPLANOPREV').Asinteger := CmpRptCM.ParamValues[3].AsInteger;
      qryMemoria.ParamByName('IDPESSOA').Asinteger    := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
      qryMemoria.ParamByName('NUMPROCESSO').AsString  := sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsString; // edilaine - SOL 253577-18094 / PPM 1269549
      qryMemoria.Open;
    end;
    // Andre Imakawa - SIG 60818 - Fim

   {Legenda dos Planos}
   qryLegenda.Close;
   qryLegenda.ParamByName('IDPESSJUR').Asinteger   := CmpRptCM.ParamValues[2].AsInteger;
   qryLegenda.ParamByName('IDPESSOA').Asinteger    := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
   qryLegenda.ParamByName('IDLOTE').Asinteger      := CmpRptCM.ParamValues[0].AsInteger;
   qryLegenda.Open;

   iIdPessoaControle := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;

 end;

end;

// edilaine - SOL 262968 / PPM 1102753 - inicio
procedure TRptDemonstraConcessao.ppDBText19GetText(Sender: TObject; var Text: String);
begin
  Text := '(+) '+ Text;
end;

procedure TRptDemonstraConcessao.ppDBText20GetText(Sender: TObject; var Text: String);
begin
  Text := '(-) '+ Text;
end;


procedure TRptDemonstraConcessao.qryHstContribAAfterScroll(DataSet: TDataSet);
begin
  VerificaCorrecoes( qryHstContribA.FieldByName('NUMRECEBIMENTO').AsInteger );
end;

procedure TRptDemonstraConcessao.qryHstContribPAfterScroll(DataSet: TDataSet);
begin
  VerificaCorrecoes( qryHstContribP.FieldByName('NUMRECEBIMENTO').AsInteger );
end;


procedure TRptDemonstraConcessao.SubRelCorrecaoPrint(Sender: TObject);
var
  index  : integer;
  sql    : string;
begin
//Edilaine Ferraresi/Luiz Carlos - SIG69154 - Inicio
{  if CmpRptCM.ParamValues[9].AsString = 'S' then
  begin
    cdsCorrecao.first;
    if not cdsCorrecao.locate('STIPO;IDPESSOA', VarArrayOf(['C', iIdPessoaControle]), []) then
    begin
      qryConsulta.Close;
      qryConsulta.SQL.Clear;
      qryConsulta.SQL.Add('SELECT ''C'' AS sTIPO, C.NOME, HP.IDPESSOA, HA.MESREFERENCIA, 0.00 AS RECEBER, ABS(HA.VALOR) AS PAGAR ');
      qryConsulta.SQL.Add('  FROM HSTATRASOCONTRIB HA, CONTRIBUICAO C,               ');
      qryConsulta.SQL.Add('       (SELECT NUMRECEBIMENTO, IDCONTRIBUICAO, IDPESSOA   ');
      qryConsulta.SQL.Add('          FROM HSTCONTRIBPREV hst                         ');
      qryConsulta.SQL.Add('         WHERE HST.NUMRECEBIMENTO =  :NUMRECEBE           ');
      qryConsulta.SQL.Add('           AND HST.IDPESSOA = :IDPESSOA                   ');
      qryConsulta.SQL.Add('       ) HP                                               ');
      qryConsulta.SQL.Add(' WHERE C.IDCONTRIBUICAO = HP.IDCONTRIBUICAO               ');
      qryConsulta.SQL.Add('   AND HP.NUMRECEBIMENTO = HA.NUMRECEBIMENTO              ');
      qryConsulta.prepare;


      for index := 0 to lstCorrecoes.count-1 do
      begin
        if not cdsCorrecao.locate('NUMRECEBIMENTO', StrToInt(lstCorrecoes.Strings[index]), []) then
        begin
          qryConsulta.close;
          qryConsulta.ParamByName('IDPESSOA').AsInteger   := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
          qryConsulta.ParamByName('NUMRECEBE').AsInteger  := StrToInt(lstCorrecoes.Strings[index]);
          qryConsulta.open;

          if (not qryconsulta.eof) then
          begin
            cdsCorrecao.Insert;
            cdsCorrecao.FieldByName('sTipo').AsString         := qryConsulta.FieldByName('sTipo').AsString;
            cdsCorrecao.FieldByName('IdPessoa').AsInteger     := qryConsulta.FieldByName('IDPESSOA').AsInteger;
            cdsCorrecao.FieldByName('MESREFERENCIA').AsString := qryConsulta.FieldByName('MESREFERENCIA').AsString;
            cdsCorrecao.FieldByName('Nome').AsString          := qryConsulta.FieldByName('NOME').AsString;
            cdsCorrecao.FieldByName('Receber').AsCurrency     := 0;
            cdsCorrecao.FieldByName('Pagar').AsCurrency       := qryConsulta.FieldByName('PAGAR').AsCurrency;
            cdsCorrecao.FieldByName('NUMRECEBIMENTO').AsInteger := StrToInt(lstCorrecoes.Strings[index]);
            cdsCorrecao.Post;
          end;
        end;
      end;
    end;
  end;
         }
//Edilaine Ferraresi/Luiz Carlos - SIG69154 - Fim
end;


procedure TRptDemonstraConcessao.VerificaCorrecoes(iNumRecebimento: integer);
begin
  if lstCorrecoes.IndexOf( IntToStr(iNumRecebimento) ) < 0 then
     lstCorrecoes.Add( IntToStr(iNumRecebimento) );
end;


procedure TRptDemonstraConcessao.SubRelSomasPrint(Sender: TObject);
begin
  TotalizaLancamentos();
end;


procedure TRptDemonstraConcessao.TotalizaLancamentos;
var
  cdsTot : TCmClientDataSet;
  sSQL   : string;
  oDados : OleVariant;
begin

  cdsTot := TCmClientDataSet.create(nil);

  try
    // totalizando beneficios
    sSQL := UpperCase(qryHstBenef.SQL.text);
    sSQL := copy(sSQL, 1, pos('ORDER BY', sSQL)-1);

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT SUM(X.VALORPREV) FROM ( ');
    qryAux.Sql.Add( sSQL );
    qryAux.Sql.Add(') X ');
    qryAux.ParamByName('NUMEROPROCESSO').AsString := sqlDemonstraFuncef.FieldByName('NUMEROPROCESSO').AsString; // edilaine - SOL 253577-18094 / PPM 1269549
    qryAux.ParamByName('IDPESSOA').Asinteger      := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
    qryAux.Open;
    if not qryAux.Eof then
       rTotalBeneficio := qryAux.Fields[0].AsCurrency;


    // totalizando contribuicoes
    if sqlDemonstraFuncef.FieldByName('TIPORECEBE').AsString = 'APOSENTADORIA'  then
       sSQL := UpperCase(qryHstContribA.SQL.text)
    else
       sSQL := UpperCase(qryHstContribP.SQL.text);
    sSQL := copy(sSQL, 1, pos('ORDER BY', sSQL)-1);

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT SUM(VLRDEVOLVER), SUM(VLRCOBRAR) FROM ( ');
    qryAux.Sql.Add( sSQL );
    qryAux.Sql.Add(') ');

    if sqlDemonstraFuncef.FieldByName('TIPORECEBE').AsString = 'APOSENTADORIA'  then
    begin
      qryAux.ParamByName('idpessoa').AsInteger    := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
      qryAux.ParamByName('idlote').AsInteger      := CmpRptCM.ParamValues[0].AsInteger;
      qryAux.ParamByName('IDPESSJUR').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
      qryAux.ParamByName('IDPLANOPREV').AsInteger := CmpRptCM.ParamValues[3].AsInteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
      //qryAux.ParamByName('DTCONCESSAO').AsDateTime  := StrToDateTime(CmpRptCM.ParamValues[8].AsString);
      if Trim(CmpRptCM.ParamValues[11].AsString) = 'visualiza' then
         qryAux.ParamByName('IDBENEFICIO').AsInteger := 0
      else
         qryAux.ParamByName('IDBENEFICIO').AsInteger := qryBenef.FieldByName('IDBENEFICIO').Asinteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - fim
      qryAux.ParamByName('DTCONCESSAO').AsDateTime := StrToDateTime( CmpRptCM.ParamValues[8].AsString );   //Edilaine - SIG32303

    end
    else
    begin
      qryAux.ParamByName('idpessoa').AsInteger    := sqlDemonstraFuncef.FieldByName('IdPessoa').AsInteger;
      qryAux.ParamByName('idlote').AsInteger      := CmpRptCM.ParamValues[0].AsInteger;
      qryAux.ParamByName('IDPESSJUR').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
      qryAux.ParamByName('IDPLANOPREV').AsInteger := CmpRptCM.ParamValues[3].AsInteger;
      qryAux.ParamByName('IDTITULAR').AsInteger   := CmpRptCM.ParamValues[1].AsInteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
      if Trim(CmpRptCM.ParamValues[11].AsString) = 'visualiza' then
         qryAux.ParamByName('IDBENEFICIO').AsInteger := 0
      else
         qryAux.ParamByName('IDBENEFICIO').AsInteger := qryBenef.FieldByName('IDBENEFICIO').Asinteger;
      // edilaine - SOL 253577-18094 / PPM 1269549 - fim
      qryAux.ParamByName('DTCONCESSAO').AsDateTime := StrToDateTime( CmpRptCM.ParamValues[8].AsString );   //Edilaine - SIG32303
    end;

    qryAux.Open;
    if not qryAux.Eof then
       rTotalContribuicao := qryAux.Fields[0].AsCurrency - qryAux.Fields[1].AsCurrency;


    // totalizando correcoes
    rTotBenefCorr   := 0;    // edilaine - SOL 253577-18064 / PPM 1240079
    rTotContribCorr := 0;    // edilaine - SOL 253577-18064 / PPM 1240079
    cdsTot.CloneCursor(cdsCorrecao, true, false);
    cdsTot.first;
    while not cdsTot.eof do
    begin
      if cdsTot.FieldByName('STIPO').AsString = 'B' then
         rTotBenefCorr := rTotBenefCorr + cdsTot.FieldByName('RECEBER').AsCurrency
      else
         rTotContribCorr := rTotContribCorr + cdsTot.FieldByName('PAGAR').AsCurrency;

      cdsTot.next;
    end;

  finally
    FreeAndNil(cdsTot);
  end;

end;
// edilaine - SOL 262968 / PPM 1102753 - fim

procedure TRptDemonstraConcessao.ppGroupFooterBand3AfterPrint(Sender: TObject);
begin
  inherited;
  imprimiuRodapteGrupoRelatorio := true;          // edilaine - SOL 270813 / PPM 1336094
end;


// edilaine - SOL 253577-18174 / PPM 1327585 - inicio
procedure TRptDemonstraConcessao.AbreConsultas( sListaParametros : string);
var
  sParams : TStringList;
  ind : integer;
begin
  {parse dos parametros}
  sParams := TStringList.create;
  Split('|', sListaParametros, sParams);
  for ind := 0 to sParams.count-1 do
  begin
    CmpRptCM.ParamValues[ind].AsString := sParams.Strings[ind];
  end;

  MontaSQLRelatorio();   //edilaine - SIG53933

  sprocessos := copy(CmpRptCM.ParamValues[5].AsString, 5, length(CmpRptCM.ParamValues[5].AsString));
  // dados gerais
  sqlDemonstraFuncef.Close;
  sqlDemonstraFuncef.Sql.Text := StringReplace( sqlDemonstraFuncef.Sql.Text, '&NUMEROPROCESSO', sprocessos, [rfReplaceAll]);
  sqlDemonstraFuncef.ParamByName('NUMLOTE').AsString        := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
  sqlDemonstraFuncef.ParamByName('IDTITULAR').AsInteger     := CmpRptCM.ParamValues[1].AsInteger;
  sqlDemonstraFuncef.ParamByName('IDPESSJUR').AsInteger     := CmpRptCM.ParamValues[2].AsInteger;
  sqlDemonstraFuncef.ParamByName('IDPLANOPREV').AsInteger   := CmpRptCM.ParamValues[3].AsInteger;
  sqlDemonstraFuncef.ParamByName('SEQPROPOSTA').AsInteger   := CmpRptCM.ParamValues[4].AsInteger;
  sqlDemonstraFuncef.ParamByName('EVENTO').AsString         := CmpRptCM.ParamValues[6].AsString;
  sqlDemonstraFuncef.ParamByName('DTEVENTO').AsString       := CmpRptCM.ParamValues[7].AsString;
  sqlDemonstraFuncef.ParamByName('TIPOCONCESSAO').AsString  := CmpRptCM.ParamValues[10].AsString;
  sqlDemonstraFuncef.Open;

end;

procedure TRptDemonstraConcessao.SalvarArquivoDemonstrativo;
var
   sCaminho, vBuffer, sNomeArq : string;
begin
  sCaminho := CaminhoParaSalvarArquivo(sqlDemonstraFuncef.FieldByName('MATRICULATIT').AsString,
                                       sqlDemonstraFuncef.FieldByName('MATRICULA').AsString);

  sNomeArq := 'Demonstrativo de Concessão de Benefícios - ' + sqlDemonstraFuncef.FieldByName('Matricula').AsString + ' - ' + FormatDateTime('DD-MM-YYYY' + ' - ' + 'HH-MM-SS', Now)+' - Confirmado';

  vBuffer := sCaminho + '\' + sNomeArq  + '.PDF';

  rpDemonstraConcessaoFuncef.DeviceType       := 'PDFFile';
  rpDemonstraConcessaoFuncef.AllowPrintToFile := True;
  rpDemonstraConcessaoFuncef.ShowPrintDialog  := False;
  rpDemonstraConcessaoFuncef.TextFileName     := vBuffer;
  rpDemonstraConcessaoFuncef.print;

  ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
end;


procedure TRptDemonstraConcessao.rpDemonstraConcessaoFuncefBeforePrint(Sender: TObject);
var
   sSalarioNaDib : string;
begin

  // Salario de participação
  sSalarioNaDib := BuscaSalarioPESSOAINTEGRAL(dtmAPrev.qry,
                                              CmpRptCM.ParamValues[2].AsInteger,
                                              CmpRptCM.ParamValues[3].AsInteger,
                                              CmpRptCM.ParamValues[1].AsInteger,
                                              CmpRptCM.ParamValues[4].AsInteger,
                                              'AS',
                                              FormatDateTime('yyyy/mm', sqlDemonstraFuncef.FieldByName('DIB').AsDateTime)
                                              );

  lbl_vlrSalParticip.caption := 'R$ '+FormatFloat('#,#0.00', StrToFloat(sSalarioNaDib));
  lbl_dtConcessao.caption    := FormatDateTime('dd/mm/yyyy', Date);

  // Paulo Nobre - WO23998 - Inicio
  //  lbl_usuario.Caption := Sistema.NomeUsuario;
  lbl_usuario.Caption := UBeneficio.RetornaNomePessoaXUsuarioSistema(Sistema.IdUsuario);
  // Paulo Nobre - WO23998 - Fim

  lstCorrecoes := TStringList.create;

  //William Moreira da Silva - SIG 18775 PPM 1375567
  if not cdsCorrecao.Active then begin
        cdsCorrecao.CreateDataSet;
  end;
  //William Moreira da Silva - SIG 18775 PPM 1375567
  
  iIdPessoaControle := -1;

  {homologação}
  if Trim(CmpRptCM.ParamValues[11].AsString) = 'visualiza' then
     lblHomolog.Caption := 'Benefício Não Homologado - Apenas para Conferência'
  else
     lblHomolog.Caption := 'Benefício Homologado - '+CmpRptCM.ParamValues[11].AsString;

  // Alterado por FHBS - 11/09/2019 - SIG50850
  ppLabelVersao.Caption := 'Versão do Módulo: V' + Sistema.Versao;
  if FazQuery( qryAux, 'SELECT DESCRICAO FROM CTRLINTERFACE WHERE IDLOTE = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger)) then
    ppLabelLote.Caption := 'Lote: ' + qryAux.Fields[0].asString
  else
    ppLabelLote.Caption := '';

  ppLabelVersao.Visible := (Sistema.IdModulo = 454); // Alterado por FHBS - 13/09/2019 - SIG50850;
  ppLabelLote.Visible   := (Sistema.IdModulo = 454); // Alterado por FHBS - 13/09/2019 - SIG50850;
  // Fim - Alterado por FHBS - 11/09/2019 - SIG50850

end;
// edilaine - SOL 253577-18174 / PPM 1327585 - fim


// edilaine - SIG55933 - inicio
procedure TRptDemonstraConcessao.MontaSQLRelatorio;
var
  sSQL : string;
begin
  sSQL := 'SELECT  TIT.*,  '+
          '        REC.*,  '+
          '        DECODE(TIPORECEBE, ''HERDEIRO'', MORTEBENEF, MORTETIT ) DATAMORTE, '+
          '        TO_CHAR(NVL(REC.TEMPOSERVICOANOS, NVL(TIT.TEMPOSERVTOTAL,0))) || '' anos '' ||   '+
          '        TO_CHAR(NVL(REC.TEMPOSERVICOMES, NVL(TIT.TEMPOSERVTOTMES,0))) || '' meses '' ||  '+
          '        TO_CHAR(NVL(REC.TEMPOSERVICODIAS, NVL(TIT.TEMPOSERVTOTDIA,0))) || '' dias'' AS TEMPOSERVICO, '+
          // Andre Imakawa - SIG 73411 - Inicio
          '        TO_CHAR(NVL(REC.DATACONCESSAO, SYSDATE),''DD/MM/YYYY'') AS DATACONCESSAO_FINAL,'+
          '        NVL((SELECT MIN(H.IDLOTE)' +
          '                  FROM HSTBENEFBFCIARIO H' +
          '                 WHERE REC.IDPLANOPREV = H.IDPLANOPREV' +
          //'                   AND REC.IDBENEFICIO = H.IDBENEFICIO' +          //edilaine - SIG89790
          '                   AND REC.NUMEROPROCESSO = H.NUMEROPROCESSO' +
          '                   AND REC.IDPESSJUR = H.IDPESSJUR' +
          '                   AND REC.IDTITULAR = H.IDTITULAR' +
          '                   AND REC.IDPLANOORIGEM = H.IDPLANOORIGEM' +
          '                   AND REC.IDPESSOA = H.IDPESSOA' +
          '                   AND REC.SEQPROPOSTA = H.SEQPROPOSTA' +
          '                   AND H.MES = TO_CHAR(REC.DATACONCESSAO, ''YYYY/MM'')' +
          '                   ),:NUMLOTE)  IDLOTE,' +
          // Andre Imakawa - SIG 73411 - Fim

          //edilaine WO25429 : inicio
          {// Ewerton Beltramini - SIG81084 - Inicio....

          '        ,(SELECT SUM(HIST.VLRCOTAS)' +
          '        FROM HISTMOVRESERVA HIST' +
          '        WHERE HIST.IDPESSOA = REC.IDPESSOA' +
          '        AND HIST.IDPESSJUR = REC.IDPESSJUR' +
          '        AND HIST.IDPLANOPREV = REC.IDPLANOPREV' +
          '        AND HIST.IDBENEFICIO = REC.IDBENEFICIO' +
          '        AND HIST.FLGENTRADA = 0' +
          '        AND HIST.PLNCODIGO IS NOT NULL) VLRCOTAS,' +

          //'        (SELECT DISTINCT VALORINDICE' +     //edilaine SIG123442
          '        (SELECT MAX(VALORINDICE) ' +          //edilaine SIG123442
          '        FROM HISTMOVRESERVA HIST' +
          '        WHERE HIST.IDPESSOA = REC.IDPESSOA' +
          '        AND HIST.IDPESSJUR = REC.IDPESSJUR' +
          '        AND HIST.IDPLANOPREV = REC.IDPLANOPREV' +
          '        AND HIST.IDBENEFICIO = REC.IDBENEFICIO' +
          '        AND HIST.FLGENTRADA = 0' +
          '        AND HIST.PLNCODIGO IS NOT NULL) VALORINDICE,' +

          '        (SELECT SUM(HIST.VLRREAL)' +
          '        FROM HISTMOVRESERVA HIST' +
          '        WHERE HIST.IDPESSOA = REC.IDPESSOA' +
          '        AND HIST.IDPESSJUR = REC.IDPESSJUR' +
          '        AND HIST.IDPLANOPREV = REC.IDPLANOPREV' +
          '        AND HIST.IDBENEFICIO = REC.IDBENEFICIO' +
          '        AND HIST.FLGENTRADA = 0' +
          '        AND HIST.PLNCODIGO IS NOT NULL) VLRREAL,' +
          }//edilaine WO25429 : inicio
          //'        TRUNC(REC.TOTALBENEF / REC.INDICEDIB, 4) AS VLRCOTAS, '+          //edilaine WO25429     //edilaine WO40258
          '        DECODE(REC.INDICEDIB, 0, 0, TRUNC(REC.TOTALBENEF / REC.INDICEDIB, 4)) AS VLRCOTAS, '+      //edilaine WO40258
          '        REC.INDICEDIB AS VALORINDICE, '+                                  //edilaine WO25429
          '        REC.TOTALBENEF AS VLRREAL, '+                                     //edilaine WO25429 
          //'        (SELECT B.FLGRESGATE FROM BENEFICIO AS B WHERE B.IDBENEFICIO = REC.IDBENEFICIO) AS FLGRESGATE, ' +     //edilaine WO27971
          '        (SELECT B.FLGRESGATE FROM BENEFICIO B WHERE B.IDBENEFICIO = REC.IDBENEFICIO) AS FLGRESGATE, ' +          //edilaine WO27971
          '        REC.IDTPPAGTOBENEFIC ' +

          // Ewerton Beltramini - SIG81084 - Fim.

          '  FROM   '+
          '        (SELECT BF.IDPESSOA,              '+
          '                DP.IDTITULAR,             '+
          '                P.NUMDOCUMENTO AS CPF,    '+
          '                DP.MATRICULA,             '+
          '                :TIPOCONCESSAO AS TIPORECEBE,  '+
          '                DECODE(BTIT.IDRESPONSAVEL, NULL, BF.IDPESSOA, IDRESPONSAVEL) AS IDRECEBEDOR, '+
          '                DECODE(PF.FLGISENTOIRRF, 1, ''SIM'', ''NÃO'') AS IRRFISENTO, '+
          '                P.NOME AS NOMERECEBEDOR,  '+
          '                PF.DATANASC,              '+
          '                INSS.DataInicioINSS,      '+
          '                BF.VLRCALCINSS,           '+
          '                BF.NUMEROPROCESSO,        '+
          '                MAX(BF.VLRINFINSS) AS VLRINFINSS,     '+
          '                MAX(BF.NUMPROCINSS) AS NUMPROCINSS,   '+
          '                MAX(BF.VLRINFINSS) as RMI,            '+
          '                BF.DataInicioFUND AS DIB,             '+
          '                SUM(BF.VALORATUAL) AS TOTALBENEF,     '+
          '                BF.TEMPOSERVICOANOS, BF.TEMPOSERVICOMES, BF.TEMPOSERVICODIAS,    '+
          '                PF.DATAMORTE AS MORTEBENEF,                                      '+
          '                PI.NOME AS NOMEPERFIL,                                            '+
          // Andre Imakawa - SIG 73411 - Inicio
          '                BF.DATACONCESSAO,                                                '+
          '                BF.IDPLANOPREV,                                                  '+
          //'                BF.IDBENEFICIO,                                                  '+   //edilaine - SIG89790
          '                BF.IDPESSJUR,                                                    '+
          '                BF.IDPLANOORIGEM,                                                '+
          '                BF.SEQPROPOSTA                                                   '+

          '                ,BF.IDBENEFICIO  , BF.IDTPPAGTOBENEFIC                           '+   //Ewerton Beltramini - SIG 84282 - 18/02/2022
          '                ,bf.indicedib                                                    '+   //edilaine WO25429
          // Andre Imakawa - SIG 73411 - Fim
          '         FROM   BENEFBFCIARIO BF                                                 '+

          '         LEFT JOIN PERFILINVEST PI ON PI.IDPERFILINVEST = BF.IDPERFILINVEST      '+

          '         JOIN  BFCIARIOTITPLAN BTIT  ON  BF.IDTITULAR      = BTIT.IDTITULAR      '+
          '                                     AND BF.IDPESSJUR      = BTIT.IDPESSJUR      '+
          '                                     AND BF.IDPLANOPREV    = BTIT.IDPLANOPREV    '+
          '                                     AND BF.IDPLANOORIGEM  = BTIT.IDPLANOORIGEM  '+
          '                                     AND BF.IDPESSOA       = BTIT.IDPESSOA       '+
          '                                     AND BF.IDBENEFICIO    = BTIT.IDBENEFICIO    '+
          '                                     AND BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA    '+

          '          JOIN  DEPENTIT DP ON  DP.IDTITULAR  = BTIT.IDTITULAR                   '+
          '                            AND DP.IDPESSOA   = BTIT.IDPESSOA                    '+

          '          JOIN  PESSOAFISICA PF  ON PF.IDPESSOA = DECODE(BTIT.IDRESPONSAVEL, NULL, BF.IDPESSOA, BTIT.IDRESPONSAVEL)  '+
          '          JOIN  PESSOA  P        ON P.IDPESSOA  = DECODE(BTIT.IDRESPONSAVEL, NULL, BF.IDPESSOA, BTIT.IDRESPONSAVEL)  '+

          '          LEFT JOIN  (SELECT DISTINCT DataInicioINSS, IDTITULAR, IDPESSJUR, SEQPROPOSTA, IDPESSOA, IDPLANOPREV  '+
          '                        FROM BENEFBFCIARIO B                             '+
          '                       WHERE B.IDTITULAR  = :IDTITULAR                   '+
          '                         AND B.SEQPROPOSTA = :SEQPROPOSTA                '+
          '                         AND B.IDSITBENEFICIO IN (1,2,4)                 '+
          '                         AND B.FONTEPAGADORA = 2                         '+
          '                      ) INSS ON  INSS.IDTITULAR      = BTIT.IDTITULAR    '+
          '                             AND INSS.IDPESSJUR      = BTIT.IDPESSJUR    '+
          '                             AND INSS.IDPLANOPREV    = BTIT.IDPLANOPREV  '+
          '                             AND INSS.IDPESSOA       = BTIT.IDPESSOA     '+

          '         WHERE BF.NUMEROPROCESSO in ( &NUMEROPROCESSO )  '+
          '         GROUP BY BF.IDPESSOA,                           '+
          '                  DP.IDTITULAR,                          '+
          '                  DP.MATRICULA,                          '+
          '                  DP.IDTITULAR, DP.IDPESSOA,             '+
          '                  INSS.DataInicioINSS,                   '+
          '                  BF.VLRCALCINSS,                        '+
          '                  BF.NUMEROPROCESSO,                     '+
          '                  BTIT.IDRESPONSAVEL,                    '+
          '                  BF.DataInicioFUND,                     '+
          '                  P.NOME,                                '+
          '                  PF.DATANASC, PF.DATAMORTE, PF.FLGISENTOIRRF,  '+
          '                  P.NUMDOCUMENTO, BF.TEMPOSERVICOANOS, BF.TEMPOSERVICOMES, '+
          '                  BF.TEMPOSERVICODIAS, PI.NOME,          '+
          // Andre Imakawa - SIG 73411 - Inicio
          '                  BF.DATACONCESSAO,                                                '+
          '                  BF.IDPLANOPREV,                                                  '+
          //'                  BF.IDBENEFICIO,                                                  '+    //edilaine - SIG89790
          '                  BF.IDPESSJUR,                                                    '+
          '                  BF.IDPLANOORIGEM,                                                '+
          '                  BF.SEQPROPOSTA                                                   '+
          '                  ,BF.IDBENEFICIO , BF.IDTPPAGTOBENEFIC                            '+    //Ewerton Beltramini - SIG 84282 - 18/02/2022
          '                  ,bf.indicedib                                                    '+   //edilaine WO25429

          // Andre Imakawa - SIG 73411 - Fim
          '        ) REC,                                           '+
          '        (SELECT P.IDPESSOA AS IDTITULAR,                 '+
          '                P1.NOME AS NOMEPATRO,                    '+
          '                PP.INSCRICAONUMERO,                      '+
          '                PP.INSCRICAODATA,                        '+
          '                EL.DATAADMISSAO,                         '+
          '                EL.DATADEMISSAO,                         '+
          '                PL.NOME AS NOMEPLANO,                    '+
          '                SPLANO.DESCRICAO AS NOMESITPLANO,        '+
          '                EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '                to_char(sysdate, ''DD/MM/YYYY'') as DATACONCESSAO,         '+
          '                :NUMLOTE AS NUMLOTE,                     '+
          '                :EVENTO AS EVENTO,                       '+
          '                :DTEVENTO AS DATAEVENTO,                 '+
          '                PF.DATAMORTE AS MORTETIT,                '+
          '                EL.MATRICULA AS MATRICULATIT             '+
          '         FROM   PESSOA P, PESSOA P1, PLANPREV PL, PESSOAFISICA PF,   '+
          '                ELEGPATRO EL, PARTPREVPLAN PP, SITPLANOPREV SPLANO   '+
          '         WHERE  PP.IDPESSOA    = :IDTITULAR                          '+
          '         AND    PP.SEQPROPOSTA = :SEQPROPOSTA                        '+
          '         AND    PP.IDPESSJUR   = :IDPESSJUR                          '+
          '         AND    PP.IDPLANOPREV = :IDPLANOPREV                        '+
          '         AND    EL.IDPESSOA    = :IDTITULAR                          '+
          '         AND    EL.IDPESSJUR   = :IDPESSJUR                          '+
          '         AND    P.IDPESSOA     = :IDTITULAR                          '+
          '         AND    P1.IDPESSOA    = pp.IDPESSJUR                        '+
          '         AND    PF.IDPESSOA    = EL.IDPESSOA                         '+
          '         AND    PP.IDPLANOPREV = PL.IDPLANOPREV                      '+
          '         AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV            '+
          '        ) TIT                                                        '+
          ' WHERE TIT.IDTITULAR = REC.IDTITULAR                                 '+
          ' ORDER BY REC.NUMEROPROCESSO, REC.IDPESSOA                           ';

  sqlDemonstraFuncef.SQL.text := sSQL;
end;
// edilaine - SIG55933 - fim

procedure TRptDemonstraConcessao.LblVlIndiceGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  //Ewerton Beltramini - SIG 84282 - 18/02/2022 - Inicio
  if (sqlDemonstraFuncef.FieldbyName('IDTPPAGTOBENEFIC').AsInteger = 2) and (sqlDemonstraFuncef.FieldbyName('FLGRESGATE').AsInteger = 1) then
  begin
      LblVlIndice.Caption :=   FormatFloat('0.00000',sqlDemonstraFuncef.FieldByName('valorindice').AsFloat);
      ppDetailBand5.Height := 8.5;
      LblVlIndiceTitulo.top := 5;
      LblQtdCotasTitulo.top := 5;
      LblQtdCotas.top := 5;
      LblVlIndice.top := 5;
  end
  else
  begin
      LblQtdCotas.Caption := '';
      LblVlIndiceTitulo.Visible := False;
      LblQtdCotasTitulo.Visible := False;
      LblQtdCotas.Visible := False;
      LblVlIndice.Visible := False;
      ppDetailBand5.Height :=  4.4;
  end;
  //Ewerton Beltramini - SIG 84282 - 18/02/2022 - Fim

end;

procedure TRptDemonstraConcessao.LblQtdCotasGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  //Ewerton Beltramini - SIG 84282 - 18/02/2022 - Inicio
  if (sqlDemonstraFuncef.FieldbyName('IDTPPAGTOBENEFIC').AsInteger = 2) and (sqlDemonstraFuncef.FieldbyName('FLGRESGATE').AsInteger = 1) then
  begin
    //Ewerton Beltramini - 31/03/2022 - SIG 123822 - Inicio...
	  if sqlDemonstraFuncef.FieldbyName('IDPLANOPREV').AsInteger = 66 then    
      begin
         if sqlDemonstraFuncef.FieldByName('valorindice').AsFloat > 0 then
            LblQtdCotas.Caption := FormatFloat('0.00000',(sqlDemonstraFuncef.FieldByName('TOTALBENEF').AsFloat / sqlDemonstraFuncef.FieldByName('valorindice').AsFloat ))
         else
         begin
              LblVlIndice.Caption := '';
              LblVlIndiceTitulo.Visible := False;
              LblQtdCotasTitulo.Visible := False;
              LblQtdCotas.Visible := False;
              LblVlIndice.Visible := False;
              ppDetailBand5.Height := 4.4;
         end;
      end
    //Ewerton Beltramini - 31/03/2022 - SIG 123822 - Fim.
      else
         LblQtdCotas.Caption := FormatFloat('0.00000',sqlDemonstraFuncef.FieldByName('VLRCOTAS').AsFloat);

      ppDetailBand5.Height := 8.5;
      LblVlIndiceTitulo.top := 5;
      LblQtdCotasTitulo.top := 5;
      LblQtdCotas.top := 5;
      LblVlIndice.top := 5;
  end
  else
  begin
      LblVlIndice.Caption := '';
      LblVlIndiceTitulo.Visible := False;
      LblQtdCotasTitulo.Visible := False;
      LblQtdCotas.Visible := False;
      LblVlIndice.Visible := False;

      ppDetailBand5.Height := 4.4;
  end;
  //Ewerton Beltramini - SIG 84282 - 18/02/2022 - Fim
end;

end.
