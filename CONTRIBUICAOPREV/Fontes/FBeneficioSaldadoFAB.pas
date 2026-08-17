//***************************************************************************************
//***********************-----HISTÓRICO DE ALTERAÇÕES-----*******************************
//***************************************************************************************
//***************************************************************************************

//***************************************************************************************
//Nº SIG...........: 125500
//Data da Alteração: 13/05/2022
//Responsável......: Ewerton Beltramini
//Descrição........: Inibindo a apresentação dos campos Apresentacao do Saldo BS Revisado e
//                   FAB Revisado no Demostrativo de Saldamento (.pas e .dfm)
//***************************************************************************************
//Rotina...........: (dfm)
//Nº SIG...........: 87536
//Data da Alteração: 04/04/2022
//Responsável......: Luis Ferrari
//Descrição........: Apresentacao do Saldo BS Revisado e FAB Revisado
//***************************************************************************************
//Rotina...........: (dfm) qryBS_FAB2
//Nº SIG...........: 111694
//Data da Alteração: 10/12/2020
//Responsável......: Edilaine
//Descrição........: Ajustado apresentacao do Saldo FAB Atualizado e Benef Saldado Atualizado
//***************************************************************************************
//Nº SIG...........: 83613
//Data da Alteração: 20/03/2019
//Responsável......: Taffarel Sevaybriker
//Descrição........: Ajustado o nome do demonstrativo.
//***************************************************************************************
//Nº SIG...........: 36676/36756
//Data da Alteração: 29/12/2016
//Responsável......: William Moreira da Silva
//Descrição........: Mudança Alias consulta para demostrativo (.dfm)
//***************************************************************************************
//***************************************************************************************
//Nº SIG...........: 27626.32406
//Data da Alteração: 28/07/2015
//Alteração Form...: mudar chamada de atualização para PCK_BENEFSALDFAB.SP_ATUALIZASALDO (dfm)
//Responsável......: William Santana/Andre Imakawa
//Descrição........: Ajustes para chamada package pck.BenefSaldFab
//***************************************************************************************
//Nº SIG...........: 22429
//Data da Alteração: 09/06/2016
//Alteração Form...: (dfm) qryFAB
//Responsável......: André Imakawa
//Descrição........: O sistema está informando errado o tipo de elegibilidade
//                   incorreta.
//***************************************************************************************
//Nº SIG...........: 22419
//Data da Alteração: 09/06/2016
//Alteração Form...: (dfm) qryCalculoIndiceIdadeSald
//Responsável......: André Imakawa
//Descrição........: O sistema está gerando o fidade zerado
//***************************************************************************************
//Nº SIG...........: 23223
//Data da Alteração: 16/06/2016
//Alteração Form...: (dfm) qryCalculoIndiceIdadeSald
//Responsável......: Edilaine
//Descrição........: O sistema está calculando errado o ¦i¦ da fórmula para idadecomparativa = 18
//***************************************************************************************
//Nº SIG...........: 21889
//Data da Alteração: 07/06/2016
//Alteração Form...: (dfm) qryCalculoIndiceIdadeSald
//Responsável......: Edilaine
//Descrição........: O sistema está calculando errado o ¦i¦ na fórmula do demonstrativo
//***************************************************************************************
//Nº SIG...........: 20492
//Data da Alteração: 27/05/2016
//Alteração Form...: (dfm) qryFAB
//Responsável......: Edilaine
//Descrição........: erro ao carregar dados quando o total em anos está com valor > 70 anos
//***************************************************************************************
//Nº SIG...........: 21897
//Data da Alteração: 01/06/2016
//Alteração Form...: (dfm) qryFAB
//Responsável......: William Moreira da Silva
//Descrição........: Data de Elegibilidade incorreta
//***************************************************************************************
//Nº SIG...........: 19027
//Data da Alteração: 19/04/2016
//Alteração Form...: (dfm) qryCalculoIndiceIdadeSald
//Responsável......: William Santana
//Descrição........: performance da tela Informações do Participante
//***************************************************************************************
//Nº SOL...........: 270929
//Nº PPM...........: 1341948
//Data da Alteração: 06/02/2016
//Alteração Form...: (dfm) qryCalculoIndiceIdadeSald
//Responsável......: William Santana
//Descrição........: idade inicio de contribuição errada no relatorio demonstrativo FAB
//***************************************************************************************
//Nº SOL...........: 269034
//Nº PPM...........: 1275479
//Data da Alteração: 10/02/2016
//Alteração Form...: (dfm) qryFab
//Responsável......: William Moreira
//Descrição........: data e motivo da elegibilidade estão erradas no relatorio FAB
//***************************************************************************************
//Nº SOL...........: 253577/18089
//Nº PPM...........: 1263812
//Data da Alteração: 28/01/2016
//Alteração Form...: (dfm) qryFab
//Responsável......: Edilaine Ferraresi
//Descrição........: os valores do FAB aparecem duplicado no grid
//***************************************************************************************
//Nº SOL...........: 253577/18054
//Nº PPM...........: 1238438
//Data da Alteração: 14/01/2016
//Alteração Form...:(.dfm) qryFab
//Responsável......: William Santana
//Descrição........: Ajustes no relatório
//***************************************************************************************
//Nº SOL:            253577-17564
//Nº PPM             987196
//Data da Alteração: 28/07/2015
//Alteração Form:    (.dfm) qryFab
//Responsável:       Edilaine Ferraresi
//Descrição:         Ajustes para Equacionamento do Deficit
//***************************************************************************************
//Nº SOL:            145044
//Nº KINTANA         966308
//Data da Alteração: 12/05/2014
//Alteração Form:    Criação do form
//Responsável:       Tadeu Passos/ Douglas Siqueira / Higor Nayde / William Santana
//Descrição:         Benefício Saldado e FAB
//**************************************************************************************

unit FBeneficioSaldadoFAB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TEdNum,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TB97Ctls, UConsPart,
  DBCtrls, Db, DBTables, Wwquery, MontaSelect, FTelaAut, dBaseDados, uSistema,
  ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, UMensErro,
  Wwdatsrc, ppBands, ppCache, ppCtrls, ppPrnabl, ppEndUsr, wwstorep, jpeg,
  ppStrtch, ppSubRpt, ppRichTx, ppModule, raCodMod, ppParameter, FPreview, Math, JCLDateTime ;

type
  TRecDados = record          // edilaine - SOL 253577-17564 / PPM 987196 - incio
    Sexo     : string;
    IdadeC   : double;
    TS       : double;
    IdadeIni : double;
    Indice   : double;
  end;                        // edilaine - SOL 253577-17564 / PPM 987196 - fim
  TfrmBeneficioSaldadoFAB = class(TfrmOkCancelar)
    pmlParticipante: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    stxtProcesso: TStaticText;
    pgctrlBenefSaldadoFAB: TPageControl;
    tbsBenefSaldado: TTabSheet;
    dbgrdBenefSaldado: TwwDBGrid;
    tbsFAB: TTabSheet;
    tbsResult: TTabSheet;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    ToolbarSep978: TToolbarSep97;
    ToolbarSep9711: TToolbarSep97;
    tbButtonAlterar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    tbButonRelatorio: TToolbarButton97;
    ToolbarSep974: TToolbarSep97;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    bbtnProcurar: TBitBtn;
    btnDemosSaldamento: TToolbarButton97;
    dbgrdFAB: TwwDBGrid;
    dbgrdHist: TwwDBGrid;
    qryBS_FAB: TwwQuery;//Andre Imakawa - SIG 27626.32406
    dsBS_FAB: TDataSource;//Andre Imakawa - SIG 27626.32406
    MontaSelectPart: TMontaSelect;
    //Andre Imakawa - SIG 27626.32406 - Inicio
	dbtxtNOME: TDBText;
    dbtxtNOMEPLANO: TDBText;
    dbtxtNOMECARGO: TDBText;
    dbtxtSALPART_2006: TDBText;
    dbtxtMATRICULA: TDBText;
    dbtxtSITUACAO_PLANO: TDBText;
    dbtxtVALORATS: TDBText;
    dbtxtBENEFSALD_2006: TDBText;
    dbtxtPATRO: TDBText;
    Label5: TLabel;
    dbtxtSITUACAO_FUNDACAO: TDBText;
    dbtxtVALORCARGOCOMIS: TDBText;
    dbtxtSITUACAO_PATRO: TDBText;
    dbtxtADICIONAIS: TDBText;
    qryHistorico: TwwQuery;
    dsHistorico: TDataSource;
    qryRelDemosSald2: TwwQuery;
	//Andre Imakawa - SIG 27626.32406 - Fim
    dsRelDemosSald: TwwDataSource;
    rpDemosSald: TppReport;
    ppBDEDemosSald: TppBDEPipeline;
    ppBDEBenefSald: TppBDEPipeline;
    rpBenefSald: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppLabel13: TppLabel;
    ppFooterBand3: TppFooterBand;
    ppBDEFAB: TppBDEPipeline;
    ppBDEHistorico: TppBDEPipeline;
    ppLabel14: TppLabel;
    ppLabel25: TppLabel;
    ppShape9: TppShape;
    ppLabel15: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppLabel17: TppLabel;
    ppShape12: TppShape;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel26: TppLabel;
    ppDBText11: TppDBText;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    qryDesfazerBenef: TwwQuery;
    qryDesfazerBenefIDPESSOA: TFloatField;
    qryDesfazerCarga: TwwQuery;
    qryDesfazerCargaIDPESSOA: TFloatField;
    qryDesfazerBenefIDTITULAR: TFloatField;
    qryDesfazerBenefMESREFERENCIA: TStringField;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    pdbmg1: TppDBImage;
    pdbtxt1: TppDBText;
    pdbtxtend: TppDBText;
    pdbtxtcompl: TppDBText;
    pdbtxtNome: TppDBText;
    pplfBDEHistoricoppField1: TppField;
    pplfBDEHistoricoppField2: TppField;
    pplfBDEHistoricoppField3: TppField;
    pplfBDEHistoricoppField4: TppField;
    pplfBDEHistoricoppField5: TppField;
    pplfBDEHistoricoppField6: TppField;
    pplfBDEHistoricoppField7: TppField;
    pplfBDEHistoricoppField8: TppField;
    pplfBDEHistoricoppField9: TppField;
    pdbtxt2: TppDBText;
    rpFAB: TppReport;
    phdrbnd1: TppHeaderBand;
    plbl1: TppLabel;
    pdbmg2: TppDBImage;
    pdbtxt3: TppDBText;
    pdbtxt4: TppDBText;
    pdbtxt5: TppDBText;
    pdtlbnd1: TppDetailBand;
    rpp1: TppShape;
    rpp2: TppShape;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    rpp3: TppShape;
    rpp4: TppShape;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    pdbtxt6: TppDBText;
    pdbtxt7: TppDBText;
    plbl8: TppLabel;
    pdbtxt8: TppDBText;
    plbl9: TppLabel;
    plbl10: TppLabel;
    plbl13: TppLabel;
    pdbtxt9: TppDBText;
    pdbtxt10: TppDBText;
    pdbtxt13: TppDBText;
    pdbtxt14: TppDBText;
    pdbtxt15: TppDBText;
    pftrbnd1: TppFooterBand;
    pplfBDEFABppField1: TppField;
    pplfBDEFABppField2: TppField;
    pplfBDEFABppField3: TppField;
    pplfBDEFABppField4: TppField;
    pplfBDEFABppField5: TppField;
    pplfBDEFABppField6: TppField;
    pplfBDEFABppField7: TppField;
    pplfBDEFABppField8: TppField;
    pplfBDEFABppField9: TppField;
    pplfBDEBenefSaldppField11: TppField;
    plblSFAB: TppLabel;
    pdbtxtFAB: TppDBText;
    rpHistorico: TppReport;
    phdrbnd2: TppHeaderBand;
    plbl14: TppLabel;
    pdbmg3: TppDBImage;
    pdbtxt16: TppDBText;
    pdbtxt17: TppDBText;
    pdbtxt18: TppDBText;
    rpp5: TppShape;
    rpp6: TppShape;
    plbl15: TppLabel;
    plbl16: TppLabel;
    plbl17: TppLabel;
    plbl22: TppLabel;
    plbl23: TppLabel;
    plbl24: TppLabel;
    plbl25: TppLabel;
    plbl26: TppLabel;
    pdbtxt22: TppDBText;
    pdbtxt23: TppDBText;
    pdbtxt24: TppDBText;
    pdbtxt25: TppDBText;
    pdbtxt26: TppDBText;
    pdbtxt27: TppDBText;
    pdbtxt28: TppDBText;
    plbl27: TppLabel;
    pdbtxt29: TppDBText;
    pftrbnd2: TppFooterBand;
    qryHistoricoIDPESSOA: TFloatField;
    qryHistoricoIDTITULAR: TFloatField;
    qryHistoricoTIPO: TStringField;
    qryHistoricoCAMPO: TStringField;
    qryHistoricoVALORANTERIOR: TStringField;
    qryHistoricoVALORALTERADO: TStringField;
    qryHistoricoMESREFERENCIA: TStringField;
    prmtrlst1: TppParameterList;
    btnButtonAtualizar: TToolbarButton97;
    btnButtonDesfazer: TToolbarButton97;
    qryAux: TwwQuery;
    pplfBDEFABppField10: TppField;
    pplfBDEFABppField11: TppField;
    qryDesfazer: TwwQuery;
    qryDesfazerIDTITULAR: TFloatField;
    qryDesfazerIDPESSOA: TFloatField;
    qryDesfazerIDCARGAARQUIVO: TFloatField;
    updHistorico: TUpdateSQL;
    pplfBDEFABppField12: TppField;
    pgrp1: TppGroup;
    pgrphdrbnd1: TppGroupHeaderBand;
    pgrpftrbnd1: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    pgrp2: TppGroup;
    pgrphdrbnd2: TppGroupHeaderBand;
    pgrpftrbnd2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    qryHistoricoTRIGGERDTINCLUSAO: TDateTimeField;
    qryHistoricoTRIGGERUSERINCLUSAO: TStringField;
    qryHistoricoNOME: TStringField;
    qryHistoricoMATRICULA: TStringField;
    pplfBDEHistoricoppField10: TppField;
    pplfBDEHistoricoppField11: TppField;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    phdrbnd3: TppHeaderBand;
    pmgCabec: TppImage;
    pdtlbnd4: TppDetailBand;
    rpp11: TppShape;
    rpp12: TppShape;
    pdbtxt19: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    pdbtxt20: TppDBText;
    ppLabel3: TppLabel;
    rpp13: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppbs1: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    plblAts: TppLabel;
    plbl18: TppLabel;
    lbl1: TppLabel;
    lbl2: TppLabel;
    lbl3: TppLabel;
    lbl4: TppLabel;
    lbl6: TppLabel;
    lbl7: TppLabel;
    lbl8: TppLabel;
    lbl9: TppLabel;
    lbl10: TppLabel;
    rpp7: TppShape;
    plbl38: TppLabel;
    plbl39: TppLabel;
    sub1: TppSubReport;
    pchldrprt1: TppChildReport;
    ptlbnd1: TppTitleBand;
    pmg1: TppImage;
    pdtlbnd3: TppDetailBand;
    rpp9: TppShape;
    ppLabel8: TppLabel;
    plbl50: TppLabel;
    ppLine1: TppLine;
    rpp10: TppShape;
    plbl41: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    plbl40: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel35: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine2: TppLine;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLine3: TppLine;
    psmrybnd1: TppSummaryBand;
    rcdmdl1: TraCodeModule;
    pdbtxtNOMECARGO: TppDBText;
    pdbtxtATS: TppDBText;
    pdbtxtSALARIO_PADRAO: TppDBText;
    pdbtxtPLANO: TppDBText;
    lbl5: TppLabel;
    lbl11: TppLabel;
    lbl12: TppLabel;
    lbl13: TppLabel;
    lbl14: TppLabel;
    lbl15: TppLabel;
    lbl16: TppLabel;
    lbl17: TppLabel;
    lbl18: TppLabel;
    lbl19: TppLabel;
    lbl20: TppLabel;
    lbl21: TppLabel;
    lbl22: TppLabel;
    lbl23: TppLabel;
    lbl24: TppLabel;
    lbl25: TppLabel;
    lbl26: TppLabel;
    lbl27: TppLabel;
    lbl28: TppLabel;
    lbl29: TppLabel;
    cc1: TppLabel;
    cc2: TppLabel;
    cc3: TppLabel;
    cc4: TppLabel;
    cc5: TppLabel;
    cc6: TppLabel;
    cc7: TppLabel;
    cc8: TppLabel;
    cc9: TppLabel;
    cc10: TppLabel;
    cc11: TppLabel;
    cc12: TppLabel;
    cc13: TppLabel;
    cc14: TppLabel;
    cc15: TppLabel;
    cc16: TppLabel;
    cc29: TppLabel;
    cc28: TppLabel;
    cc27: TppLabel;
    cc26: TppLabel;
    cc25: TppLabel;
    cc24: TppLabel;
    cc23: TppLabel;
    cc22: TppLabel;
    cc21: TppLabel;
    cc20: TppLabel;
    cc19: TppLabel;
    cc18: TppLabel;
    cc17: TppLabel;
	//Andre Imakawa - SIG 27626.32406 - Inicio
    qryRelDemosSald2IDCARGABENEFSALDFAB: TFloatField;
    qryRelDemosSald2IDCARGAARQUIVO: TFloatField;
    qryRelDemosSald2IDPESSOA: TFloatField;
    qryRelDemosSald2IDTITULAR: TFloatField;
    qryRelDemosSald2DATASALDAMENTO: TDateTimeField;
    qryRelDemosSald2DATAIMPORTACAO: TDateTimeField;
    qryRelDemosSald2PCS: TStringField;
    qryRelDemosSald2NOMECARGO: TStringField;
    qryRelDemosSald2VALORCARGO: TFloatField;
    qryRelDemosSald2PERCENTATS: TFloatField;
    qryRelDemosSald2VALORATS: TFloatField;
    qryRelDemosSald2VPGRATSEMADICTEMPSERV: TFloatField;
    qryRelDemosSald2VPGIPTEMPOSERV: TFloatField;
    qryRelDemosSald2VPGIPSEMSALCOMFUNC: TFloatField;
    qryRelDemosSald2VPEXBH: TFloatField;
    qryRelDemosSald2ADICCOMP: TFloatField;
    qryRelDemosSald2ADICINCORP: TFloatField;
    qryRelDemosSald2ADICNOTURNO: TFloatField;
    qryRelDemosSald2ADICINSALU: TFloatField;
    qryRelDemosSald2ADICPERI: TFloatField;
    qryRelDemosSald2INCORPJUD: TFloatField;
    qryRelDemosSald2CODCARGOCOMIS: TFloatField;
    qryRelDemosSald2NOMECARGOCOMIS: TStringField;
    qryRelDemosSald2VALORCARGOCOMIS: TFloatField;
    qryRelDemosSald2COMPSALPADRAO: TFloatField;
    qryRelDemosSald2SALPART: TFloatField;
    qryRelDemosSald2BENEFICIOSALDADO: TFloatField;
    qryRelDemosSald2PERCENTPBE: TFloatField;
    qryRelDemosSald2ULTIMOMESPROC: TStringField;
    qryRelDemosSald2DATAELEGIBILIDADE: TDateTimeField;
    qryRelDemosSald2TRIGGERUSERINCLUSAO: TStringField;
    qryRelDemosSald2TRIGGERDTINCLUSAO: TDateTimeField;
    qryRelDemosSald2NOME: TStringField;
    qryRelDemosSald2MATRICULA: TStringField;
    qryRelDemosSald2PLANO: TStringField;
    ppFooterBand1: TppFooterBand;
    rpp8: TppShape;
    qryRelDemosSald2BINSS: TFloatField;
    qryRelDemosSald2DATANASC: TDateTimeField;
    qryRelDemosSald2TS: TFloatField;
    ppBs2: TppLabel;
    ppbs3: TppLabel;
    ppbs4: TppLabel;
    ppbs5: TppLabel;
    ppbs6: TppLabel;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    qryRelDemosSald2IDADE: TFloatField;
    qryRelDemosSald2IDADESALD: TFloatField;
    qryRelDemosSald2DATAINICIOFUND: TDateTimeField;
    qryRelDemosSald2IDBENEFICIO: TFloatField;
    qryCalculoIndiceIdadeSald: TwwQuery;
    qryInformacoes: TwwQuery;
    dsInformacoes: TDataSource;
    strngfldInformacoesNOME: TStringField;
    strngfldInformacoesMATRICULA: TStringField;
    strngfldInformacoesPATRO: TStringField;
    strngfldInformacoesSITUACAO_PATRO: TStringField;
    strngfldInformacoesNOMEPLANO: TStringField;
    strngfldInformacoesSITUACAO_PLANO: TStringField;
    strngfldInformacoesSITUACAO_FUNDACAO: TStringField;
    qryInformacoesADICIONAIS: TFloatField;
    strngfldInformacoesNOMECARGO: TStringField;
    qryInformacoesVALORATS: TFloatField;
    qryInformacoesVALORCARGOCOMIS: TFloatField;
    qryInformacoesSALPART_2006: TFloatField;
    qryInformacoesBENEFSALD_2006: TFloatField;
    qryInformacoesBENEFSALDADOINSS: TFloatField;
    qryInformacoesSALDOFABINSS: TFloatField;
    qryBS_FABMESREFERENCIA: TStringField;
    qryBS_FABREFERENCIA_INDICE: TStringField;
    qryBS_FABVALORINDICE: TFloatField;
    qryBS_FABINDICEACUMULADO: TFloatField;
    qryBS_FABBENEFSALDADO: TFloatField;
    qryBS_FABSALDOFAB: TFloatField;
    qryRelDemosSald: TwwQuery;
    //Andre Imakawa - SIG 27626.32406 - Fim
	qryRelDemosSaldIDCARGABENEFSALDFAB: TFloatField;
    qryRelDemosSaldIDCARGAARQUIVO: TFloatField;
    qryRelDemosSaldIDPESSOA: TFloatField;
    qryRelDemosSaldIDTITULAR: TFloatField;
    qryRelDemosSaldDATASALDAMENTO: TDateTimeField;
    qryRelDemosSaldDATAIMPORTACAO: TDateTimeField;
    qryRelDemosSaldPCS: TStringField;
    qryRelDemosSaldNOMECARGO: TStringField;
    qryRelDemosSaldVALORCARGO: TFloatField;
    qryRelDemosSaldPERCENTATS: TFloatField;
    qryRelDemosSaldVALORATS: TFloatField;
    qryRelDemosSaldVPGRATSEMADICTEMPSERV: TFloatField;
    qryRelDemosSaldVPGIPTEMPOSERV: TFloatField;
    qryRelDemosSaldVPGIPSEMSALCOMFUNC: TFloatField;
    qryRelDemosSaldVPEXBH: TFloatField;
    qryRelDemosSaldADICCOMP: TFloatField;
    qryRelDemosSaldADICINCORP: TFloatField;
    qryRelDemosSaldADICNOTURNO: TFloatField;
    qryRelDemosSaldADICINSALU: TFloatField;
    qryRelDemosSaldADICPERI: TFloatField;
    qryRelDemosSaldINCORPJUD: TFloatField;
    qryRelDemosSaldCOMPSALPADRAO: TFloatField;//Andre Imakawa - SIG 27626.32406
    qryRelDemosSaldCODCARGOCOMIS: TFloatField;
    qryRelDemosSaldNOMECARGOCOMIS: TStringField;
    qryRelDemosSaldVALORCARGOCOMIS: TFloatField;
    qryRelDemosSaldSALPART: TFloatField;
    qryRelDemosSaldBENEFICIOSALDADO: TFloatField;
    qryRelDemosSaldPERCENTPBE: TFloatField;
    qryRelDemosSaldBINSS: TFloatField;//Andre Imakawa - SIG 27626.32406
    qryRelDemosSaldULTIMOMESPROC: TStringField;
    qryRelDemosSaldDATAELEGIBILIDADE: TDateTimeField;
    qryRelDemosSaldTRIGGERUSERINCLUSAO: TStringField;
    qryRelDemosSaldTRIGGERDTINCLUSAO: TDateTimeField;
    qryRelDemosSaldNOME: TStringField;
    qryRelDemosSaldMATRICULA: TStringField;
    qryRelDemosSaldPLANO: TStringField;
    qryRelDemosSaldDATANASC: TDateTimeField;
    qryRelDemosSaldIDADE: TFloatField;
    qryRelDemosSaldDATAINICIOFUND: TDateTimeField;
    qryRelDemosSaldIDBENEFICIO: TFloatField;
	//Andre Imakawa - SIG 27626.32406 - Inicio
    qryRelDemosSaldIDADESALD: TFloatField;
    qryRelDemosSaldTS: TFloatField;
    qryRelDemosSaldI: TFloatField;
    qryRelDemosSaldPERCCORRECAOSALPART: TFloatField;
    qryRelDemosSaldPERCCORRECAOBS: TFloatField;
    qryRelDemosSaldSALPART2006: TFloatField;
    dsBS_FAB2: TDataSource;
    qryBS_FAB2: TwwQuery;
    qryBS_FAB2NOME: TStringField;
    qryBS_FAB2MATRICULA: TStringField;
    qryBS_FAB2SALDOATUAL: TFloatField;
    qryBS_FAB2SALPART: TFloatField;
    qryBS_FAB2BFSALD2006: TFloatField;
    qryBS_FAB2SALDOATUALIZADO: TFloatField;
    ppNOME_C: TppLabel;
    ppMATRICULA_C: TppLabel;
    ppSALPART_C: TppLabel;
    ppBFSALD2006_C: TppLabel;
    ppSALDOATUALIZADO_C: TppLabel;
    ppParameterList1: TppParameterList;
    ppNOME_C2: TppLabel;
    ppMATRICULA_C2: TppLabel;
    ppTIPOELEGE_C2: TppLabel;
    ppDATAELEGE_C2: TppLabel;
    ppSALDOATUAL_C: TppLabel;
    ppSALPART_C2: TppLabel;
    ppBFSALD2006_C2: TppLabel;
    ppSALDOATUALIZADO_C2: TppLabel;
    qryBS_FAB2TIPOELEGE: TMemoField;
    qryBS_FAB2DATAELEGE: TDateTimeField;
    qryBenefSaldado: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    dsBenefSaldado: TDataSource;
    ppBDEBenefSaldppField12: TppField;
    label24: TLabel;
    label25: TLabel;
    dbtxtBENEFSALDADOINSS: TDBText;
    dbtxtSALDOFABINSS: TDBText;
    lbl30: TppLabel;
    cc30: TppLabel;
    lbl31: TppLabel;
    cc31: TppLabel;
	//Andre Imakawa - SIG 27626.32406 - Fim
    procedure btnDemosSaldamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure tbButtonAlterarClick(Sender: TObject);
    //procedure AbreQueries(IdPessoa, IdPlanoPrev, IdPessJur: Integer);     // edilaine - SOL 253577-17564 / PPM 987196   //William Santana - SIG 27626.32406
    procedure AbreQueries(IdPessoa, IdTitular : Integer);                 //William Santana - SIG 27626.32406
    procedure btnButtonDesfazerClick(Sender: TObject);
    procedure tbButonRelatorioClick(Sender: TObject);
    procedure btnButtonAtualizarClick(Sender: TObject);
    procedure rpDemosSaldBeforePrint(Sender: TObject);
    function Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime; aIdpessoa: integer = 0; aForcaReproc: integer = 0) : Boolean;//Adre Imakawa - SIG 27626.32406
    procedure rpBenefSaldBeforePrint(Sender: TObject);//Adre Imakawa - SIG 27626.32406
    procedure rpFABBeforePrint(Sender: TObject);//Adre Imakawa - SIG 27626.32406
  private   

  public
     rDados  : TRecDados;                   // edilaine - SOL 253577-17564 / PPM 987196
     iIdPessoa, iIdTitular : Integer;   //William Santana - SIG 27626.32406

     function obtemIndice(): double;        // edilaine - SOL 253577-17564 / PPM 987196

  end;

var
  frmBeneficioSaldadoFAB: TfrmBeneficioSaldadoFAB;

implementation

uses FAlteracaoBeneficioSaldadoFAB, {FDataInicioTrabalho,} FProgresso;     // edilaine - SOL 253577-17564 / PPM 987196

{$R *.DFM}

procedure TfrmBeneficioSaldadoFAB.btnDemosSaldamentoClick(Sender: TObject);
begin
  btnDemosSaldamento.Down := False;

  if MontaSelectPart.RetornouValor then
  begin
    //AbrirFormModal(frmDataInicioTrabalho,TfrmDataInicioTrabalho);   // edilaine - SOL 253577-17564 / PPM 987196 - inicio

    qryRelDemosSald.close;
    //qryRelDemosSald.ParamByName('IDPESSOA').AsInteger := StrToIntDef(MontaSelectPart.ValoresChave[0], -1); // Andre Imakawa - SIG 27626.32406
    qryRelDemosSald.ParamByName('IDPESSOA').AsInteger := iIdPessoa;  // Andre Imakawa - SIG 27626.32406
    qryRelDemosSald.ParamByName('IDTITULAR').AsInteger := iIdTitular;// Andre Imakawa - SIG 27626.32406
    if not(frmBeneficioSaldadoFAB.qryRelDemosSald.Prepared) then
       qryRelDemosSald.Prepare;
    qryRelDemosSald.Open;

    //TFrmPreview.CreateModalPreview(Self, rpDemosSald, 'Demosntrativo de Saldamento'); //Taffarel - SIG83613
    TFrmPreview.CreateModalPreview(Self, rpDemosSald, 'Demonstrativo de Saldamento'); //Taffarel - SIG83613

    // edilaine - SOL 253577-17564 / PPM 987196 - fim
  end;
end;

procedure TfrmBeneficioSaldadoFAB.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  //AbreQueries(-1,-1,-1);         // edilaine - SOL 253577-17564 / PPM 987196   //William Santana - SIG 27626.32406
  AbreQueries(-1,-1); //William Santana - SIG 27626.32406
end;

procedure TfrmBeneficioSaldadoFAB.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if MontaSelectPart.RetornouValor then
  begin
   //Início - William Santana - SIG 27626.32406
      //lblParticipante.Caption  := MontaSelectPart.ValoresChave[1];
//      lblMatricula.Caption     := MontaSelectPart.ValoresChave[2];
//      lblPatrocinadora.Caption := MontaSelectPart.ValoresChave[3];
//      lblPlanoPrev.Caption     := MontaSelectPart.ValoresChave[4];
//      lblSitPatro.Caption      := MontaSelectPart.ValoresChave[5];
//      lblSitFunc.Caption       := MontaSelectPart.ValoresChave[6];
//      lblSitPlano.Caption      := MontaSelectPart.ValoresChave[7];
//      lblFuncaoCC.Caption      := CurrToStrF( StrToFloat( MontaSelectPart.ValoresChave[15]), ffCurrency, 2);
//      lblAts.Caption           := CurrToStrF( StrToFloat( MontaSelectPart.ValoresChave[16]), ffCurrency, 2);
//      lblSPEm.Caption          := CurrToStrF( StrToFloat( MontaSelectPart.ValoresChave[21]), ffCurrency, 2);
//      lblBSEm.Caption          := CurrToStrF( StrToFloat( MontaSelectPart.ValoresChave[22]), ffCurrency, 2);
//
//      lblCargo.Caption         := MontaSelectPart.ValoresChave[23];
//
//      lblAdicionais.Caption    := CurrToStrF( StrToFloat(MontaSelectPart.ValoresChave[17]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[18]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[19]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[20]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[24]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[25]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[26]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[27]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[28]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[29]) +
//                                              StrToFloat(MontaSelectPart.ValoresChave[30]), ffCurrency, 2);
      iIdPessoa := StrToInt(MontaSelectPart.ValoresChave[0]);
      iIdTitular := StrToInt(MontaSelectPart.ValoresChave[1]);


      // edilaine - SOL 253577-17564 / PPM 987196 - inicio
      //obtemIndice(); //Andre Imakawa - SIG 27626.32406
  //Término - William Santana - SIG 27626.32406
      // AbreQueries(StrToInt(MontaSelectPart.ValoresChave[0]),StrToInt(MontaSelectPart.ValoresChave[32]),StrToInt(MontaSelectPart.ValoresChave[31]));   //William Santana - SIG 27626.32406
       AbreQueries(iIdPessoa,iIdTitular); //William Santana - SIG 27626.32406
      // edilaine - SOL 253577-17564 / PPM 987196 - fim
  end;
end;

//procedure TfrmBeneficioSaldadoFAB.AbreQueries(IdPessoa, IdPlanoPrev, IdPessJur : Integer);  //William Santana - SIG 27626.32406
procedure TfrmBeneficioSaldadoFAB.AbreQueries(IdPessoa, IdTitular : Integer);                 //William Santana - SIG 27626.32406
begin

  //William Santana - SIG 27626.32406
  qryInformacoes.Close;
  qryInformacoes.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  qryInformacoes.ParamByName('IDTITULAR').AsInteger := IdTitular;
  qryInformacoes.Open;

  qryBS_FAB.Close;
  qryBS_FAB.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  qryBS_FAB.ParamByName('IDTITULAR').AsInteger := IdPessoa;
  qryBS_FAB.Open;
  // Andre Imakawa - SIG 27626.32406 - Inicio
  qryBenefSaldado.Close;
  qryBenefSaldado.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  qryBenefSaldado.ParamByName('IDTITULAR').AsInteger := IdPessoa;
  qryBenefSaldado.Open;

  qryBS_FAB2.Close;
  qryBS_FAB2.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  qryBS_FAB2.ParamByName('IDTITULAR').AsInteger := IdPessoa;
  qryBS_FAB2.Open;
  // Andre Imakawa - SIG 27626.32406 - Fim
  //qryBeneficioSaldado.Close;
  //qryBeneficioSaldado.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  //qryBeneficioSaldado.ParamByName('IDTITULAR').AsInteger := IdPessoa;
  //qryBeneficioSaldado.Open;

  //qryFAB.Close;
  //qryFAB.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  //qryFAB.ParamByName('IDTITULAR').AsInteger := IdPessoa;     // william moreira - SOL 269034 / PPM 1275479
  //qryFAB.Open;

  //William Santana - SIG 27626.32406

  qryHistorico.Close;
  qryHistorico.ParamByName('IDPESSOA').AsInteger := IdPessoa;
  qryHistorico.ParamByName('IDTITULAR').AsInteger := IdPessoa;
  qryHistorico.Open;
end;

procedure TfrmBeneficioSaldadoFAB.tbButtonAlterarClick(Sender: TObject);
begin

      if MontaSelectPart.RetornouValor then
      //Andre Imakawa - SIG 27626.32406 - Inicio
      begin
        AbrirFormModal(frmAlteracaoBeneficioSaldadoFAB, TfrmAlteracaoBeneficioSaldadoFAB);

        Screen.Cursor := crHourGlass;
        if  Exec_SP_Atualiza_Benef_Sald_FAB(0, StrToDate(InttoStr(DaysInMonth(Date()))+copy(DateToStr(Date()),3,8)) ,iIdPessoa,0) then // Andre Imakawa - SIG 27626.32406
          MsgDlg('Atualização Concluída.','Atenção',mtInformation,[mbOk],0)
        else
         MsgDlg('Ocorreu um erro, a atualização não foi concluída.','Atenção',mtInformation,[mbOk],0);
        Screen.Cursor := crDefault;
      end;
      //Andre Imakawa - SIG 27626.32406 - Fim
end;

procedure TfrmBeneficioSaldadoFAB.btnButtonDesfazerClick(Sender: TObject);
var
  i : Integer;
begin
  //Try
  if (MontaSelectPart.RetornouValor) and (MsgDlg('Deseja Reprocessar o BS-FAB?','Confirmação',mtConfirmation ,[mbYes,mbNo],0) = mrYes) then
  begin
    // Andre Imakawa - SIG 27626.32406 - Inicio
    {
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    qryDesfazer.close;
    //Início - William Santana - SIG 27626.32406
    //qryDesfazer.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    //qryDesfazer.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    qryDesfazer.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
    qryDesfazer.ParamByName('IDTITULAR').AsInteger := iIdTitular;
    //Término - William Santana - SIG 27626.32406
    qryDesfazer.Open;

    // Granvando Histórico
    //Início - William Santana - SIG 27626.32406
    //qryHistorico.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    //qryHistorico.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    qryHistorico.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
    qryHistorico.ParamByName('IDTITULAR').AsInteger := iIdTitular;
    //Término - William Santana - SIG 27626.32406
    qryHistorico.Open;

     while not qryDesfazer.Eof do
      begin
        qryHistorico.Insert;
        qryHistoricoIDPESSOA.AsInteger  := qryDesfazerIDPESSOA.AsInteger;
        qryHistoricoIDTITULAR.AsInteger := qryDesfazerIDTITULAR.AsInteger;
        qryHistoricoTIPO.AsString  := 'E'; // "E" de Exclusão
        qryHistoricoCAMPO.AsString := '';
        qryHistoricoVALORANTERIOR.AsString := '';
        qryHistoricoVALORALTERADO.AsString := '';
        qryHistoricoMESREFERENCIA.AsString := '';
        qryHistorico.Post;

       qryDesfazer.next;
      end;

    qryDesfazerBenef.close;
    //Início - William Santana - SIG 27626.32406
    //qryDesfazerBenef.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    //qryDesfazerBenef.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    qryDesfazerBenef.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
    qryDesfazerBenef.ParamByName('IDTITULAR').AsInteger := iIdTitular;
    //Término - William Santana - SIG 27626.32406
    qryDesfazerBenef.ExecSQl;

    qryDesfazerCarga.close;
    //Início - William Santana - SIG 27626.32406
    //qryDesfazerCarga.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    //qryDesfazerCarga.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
    qryDesfazerCarga.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
    qryDesfazerCarga.ParamByName('IDTITULAR').AsInteger := iIdTitular;
    //Término - William Santana - SIG 27626.32406
    qryDesfazerCarga.ExecSQl;

   try
    qryHistorico.ApplyUpdates;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

    MsgDlg('Processo realizado com sucesso!','Sucesso',mtInformation,[mbOk],0);

   except
     qryHistorico.CancelUpdates;
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   end;

   // AbreQueries(StrToInt(MontaSelectPart.ValoresChave[0]),StrToInt(MontaSelectPart.ValoresChave[32]),
   //                      StrToInt(MontaSelectPart.ValoresChave[31]));    // edilaine - SOL 253577-17564 / PPM 987196  //William Santana - SIG 1111
   }
    try

      Screen.Cursor := crHourGlass;
      if  Exec_SP_Atualiza_Benef_Sald_FAB(0, StrToDate(InttoStr(DaysInMonth(Date()))+copy(DateToStr(Date()),3,8)),iIdPessoa,1) then
        MsgDlg('Reprocessar Concluído.','Atenção',mtInformation,[mbOk],0)
      else
        MsgDlg('Ocorreu um erro, o Reprocessar não foi concluído.','Atenção',mtInformation,[mbOk],0);
      Screen.Cursor := crDefault;

    except
      MsgDlg('Ocorreu um erro, o Reprocessar não foi concluído.','Atenção',mtInformation,[mbOk],0);
      Screen.Cursor := crDefault;
    end;
    // Andre Imakawa - SIG 27626.32406 - Fim


    AbreQueries(iIdPessoa,iIdTitular); //William Santana - SIG 27626.32406
  end;

end;

procedure TfrmBeneficioSaldadoFAB.tbButonRelatorioClick(Sender: TObject);
begin
  case pgctrlBenefSaldadoFAB.ActivePage.TabIndex of
    0: TFrmPreview.CreateModalPreview(Self, rpBenefSald, 'Benefício Saldado');

    1: TFrmPreview.CreateModalPreview(Self, rpFAB, 'Benefício Saldado e FAB');

    2: TFrmPreview.CreateModalPreview(Self, rpHistorico, 'Histórico de Alterações');
  end;

end;

procedure TfrmBeneficioSaldadoFAB.btnButtonAtualizarClick(Sender: TObject);
begin
  inherited;

  if MontaSelectPart.RetornouValor and (MsgDlg('Deseja atualizar o BS-FAB?','Confirmação',mtConfirmation ,[mbYes,mbNo],0) = mrYes) then
  begin
    // Andre Imakawa - SIG 27626.32406 - Inicio
    {
    try
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE FROM BENEFSALD_TEMP');
      qryAux.ExecSQL;

      qryAux.Close;
      qryAux.SQL.Clear;
      //qryAux.SQL.Add('INSERT INTO BENEFSALD_TEMP VALUES ('+quotedstr(lblMatricula.Caption)+')'); //William Santana - SIG 27626.32406
      qryAux.SQL.Add('INSERT INTO BENEFSALD_TEMP VALUES ('+quotedstr(qryInformacoes.FieldByName('MATRICULA').AsString)+')');   //William Santana - SIG 27626.32406
      qryAux.ExecSQL;

      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

    except
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
    end;
    }
    // Andre Imakawa - SIG 27626.32406 - Fim

    Screen.Cursor := crHourGlass;
    if  Exec_SP_Atualiza_Benef_Sald_FAB(0, StrToDate(InttoStr(DaysInMonth(Date()))+copy(DateToStr(Date()),3,8)) ,iIdPessoa,0) then // Andre Imakawa - SIG 27626.32406
      MsgDlg('Atualização Concluída.','Atenção',mtInformation,[mbOk],0)
    else
     MsgDlg('Ocorreu um erro, a atualização não foi concluída.','Atenção',mtInformation,[mbOk],0);
    Screen.Cursor := crDefault;

     //AbreQueries(StrToInt(MontaSelectPart.ValoresChave[0]),StrToInt(MontaSelectPart.ValoresChave[32]),
     //                     StrToInt(MontaSelectPart.ValoresChave[31]));  // edilaine - SOL 253577-17564 / PPM 987196  //William Santana - SIG 27626.32406
     AbreQueries(iIdPessoa,iIdTitular); //William Santana - SIG 27626.32406
  end;

end;


function TfrmBeneficioSaldadoFAB.Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime; aIdpessoa: integer; aForcaReproc: integer) : Boolean;
var
  SP_PROC : TStoredProc;
begin
  frmProgresso.MostraFormProgresso('Atualizando Benefício Saldado e FAB, por favor, aguarde.', True, False,False);
  frmProgresso.lblContador.Caption := '';
  frmProgresso.btnCancelar.Visible := False;
  frmProgresso.Panel1.Visible := False;
  frmProgresso.Refresh;

  try

    try
      SP_PROC := TStoredProc.Create(Self);
      SP_PROC.DatabaseName  := 'BaseDados';
      //SP_PROC.StoredProcName := 'CM."SP_ATUALIZA_BENEF_SALD_FAB"'; //William Santana - SIG 27626.32406
      SP_PROC.StoredProcName  := 'CM.PCK_BENEFSALDFAB.SP_ATUALIZASALDO';  //William Santana - SIG 27626.32406

      //Criando os parametros
      SP_PROC.Params.CreateParam(ftInteger, 'pAtualizarTudo', ptInput);
      SP_PROC.Params.CreateParam(ftDateTime, 'pAtualizarAte', ptInput);
      SP_PROC.Params.CreateParam(ftInteger, 'pIdPessoa', ptInput); // Andre Imakawa - SIG 27626.32406
      SP_PROC.Params.CreateParam(ftInteger, 'pForcaReproc', ptInput); // Andre Imakawa - SIG 27626.32406

      //Passandos os parâmetros
      SP_PROC.ParamByName('pAtualizarTudo').AsInteger := AtualizarTudo;
      SP_PROC.ParamByName('pAtualizarAte').AsDate     := AtualizarAte ;

      // Andre Imakawa - SIG 27626.32406 - Inicio
      if aIdpessoa <> 0 then
        SP_PROC.ParamByName('pIdPessoa').AsInteger := aIdpessoa;

        SP_PROC.ParamByName('pForcaReproc').AsInteger := aForcaReproc;
      // Andre Imakawa - SIG 27626.32406 - Fim

      if not SP_PROC.Prepared then
         SP_PROC.Prepare;

      SP_PROC.Close;
      SP_PROC.ExecProc;
      Result := True;
      SP_PROC.Close;

    except
       Result := False;          
    end;
     
  finally
    FreeAndNil(SP_PROC);
    frmProgresso.EscondeFormProgresso;
  end;
end;

procedure TfrmBeneficioSaldadoFAB.rpDemosSaldBeforePrint(Sender: TObject);
 var
   i, c : integer;
   cLabel, cCampo : Tcomponent;
   fIDC, fI, fIdade : Double;          // edilaine - SOL 253577-17564 / PPM 987196
begin
  inherited;
  //Limpando linhas, caso haja sejam gerados mais de relatório sem sair da funcionalidade

  for i := 1 to 31 do
  begin
    cLabel := FindComponent('lbl'+inttostr(i));
    cCampo := FindComponent('cc'+inttostr(i));
    TppLabel(cLabel).visible := false;
    TppLabel(cCampo).visible := false;
  end;

  // monta linhas de relatório dinamicamente, mostrando somente campos com valor (<> 0)
  c := 1;
  for i := 10 to 21 do
  begin
    if not(qryRelDemosSald.Fields[i].AsFloat = 0) then
    begin
     cLabel := FindComponent('lbl'+inttostr(c));
     cCampo := FindComponent('cc'+inttostr(c));
     TppLabel(cLabel).Caption := qryRelDemosSald.Fields[i].DefaultExpression;
     TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 4;// Andre Imakawa - SIG 27626.32406
     TppLabel(cCampo).Caption := CurrToStrF(qryRelDemosSald.Fields[i].AsFloat,ffCurrency,2);
     TppLabel(cLabel).visible := true;
     TppLabel(cCampo).visible := true;
     inc(c);
    end;
  end;

  for i := 22 to 24 do
  begin
    case i of
      22: begin
           if not(qryRelDemosSald.Fields[i].AsString = '-') then
           begin
            cLabel := FindComponent('lbl'+inttostr(c));
            cCampo := FindComponent('cc'+inttostr(c));
            TppLabel(cLabel).Caption := qryRelDemosSald.Fields[i].DefaultExpression;
            TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 4;// Andre Imakawa - SIG 27626.32406
            TppLabel(cCampo).Caption := qryRelDemosSald.Fields[i].AsString;
            TppLabel(cLabel).visible := true;
            TppLabel(cCampo).visible := true;
           end
          end;
      23: begin
           if not(qryRelDemosSald.Fields[i].AsFloat = 0) then
           begin
            cLabel := FindComponent('lbl'+inttostr(c));
            cCampo := FindComponent('cc'+inttostr(c));
            TppLabel(cLabel).Caption := qryRelDemosSald.Fields[i].DefaultExpression;
            TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 4;// Andre Imakawa - SIG 27626.32406
            TppLabel(cCampo).Caption := CurrToStrF(qryRelDemosSald.Fields[i].AsFloat,ffCurrency,2);
            TppLabel(cLabel).visible := true;
            TppLabel(cCampo).visible := true;
           end
          end;
      24: begin
           if not(qryRelDemosSald.Fields[i].AsFloat = 0) then
           begin
            cLabel := FindComponent('lbl'+inttostr(c));
            cCampo := FindComponent('cc'+inttostr(c));
            TppLabel(cLabel).Caption := qryRelDemosSald.Fields[i].DefaultExpression;
            TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 4;// Andre Imakawa - SIG 27626.32406
            TppLabel(cCampo).Caption := qryRelDemosSald.Fields[i].AsString;
            TppLabel(cLabel).visible := true;
            TppLabel(cCampo).visible := true;
           end
          end;
    end;
    inc(c);
  end;             
    Inc(c);
  // Andre Imakawa - SIG 27626.32406 - Inicio
  // edilaine - SOL 253577-17564 / PPM 987196 - inicio
  {
  case qryRelDemosSald.FieldByName('TS').AsInteger of
   30: begin     // Mulher
        if (qryCalculoIndiceIdadeSald.FieldByName('IDADESALDAMENTO').AsFloat) >= 48 then
         fIDC := 48
        else
         fIDC := qryCalculoIndiceIdadeSald.FieldByName('IDADESALDAMENTO').AsFloat;

         //fI := 48 - fIDC;        // edilaine - SOL 253577-17564 / PPM 987196 - comentado
       end;
   35: begin     // Homem
        if (qryCalculoIndiceIdadeSald.FieldByName('IDADESALDAMENTO').AsFloat) >= 53 then
         fIDC := 53
        else
         fIDC := qryCalculoIndiceIdadeSald.FieldByName('IDADESALDAMENTO').AsFloat;

         //fi := 53 - fIDC;        // edilaine - SOL 253577-17564 / PPM 987196 - comentado
       end;
  end;
  }
  fIDC := qryRelDemosSald.FieldByName('IDADESALD').AsFloat;

  //fIdade :=  qryCalculoIndiceIdadeSald.FieldByName('IDADEDIBINSS').AsFloat; // Andre Imakawa - SIG 27626.32406
  fIdade :=  qryRelDemosSald.FieldByName('IDADE').AsFloat;// Andre Imakawa - SIG 27626.32406

  //fI := qryCalculoIndiceIdadeSald.FieldByName('INDICE').AsFloat; // Andre Imakawa - SIG 27626.32406
  fI := qryRelDemosSald.FieldByName('I').AsFloat;// Andre Imakawa - SIG 27626.32406
  // edilaine - SOL 253577-17564 / PPM 987196 - fim
  // Andre Imakawa - SIG 27626.32406 - Fim

  for i := 1 to 9 do
  begin
   case i of
    1: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'Salário de participação em 31 de agosto de 2006 (total das parcelas acima):';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        //TppLabel(cCampo).Caption := CurrToStrF(qryRelDemosSald.Fields[25].AsFloat,ffCurrency,2); // Andre Imakawa - SIG 27626.32406
        TppLabel(cCampo).Caption := CurrToStrF(qryRelDemosSald.FieldByName('SALPART2006').AsFloat,ffCurrency,2);   // Andre Imakawa - SIG 27626.32406
        TppLabel(cLabel).visible := true;
        TppLabel(cCampo).visible := true;
       end;
    2: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'INPC (setembro de 2005 a agosto de 2006):';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        //TppLabel(cCampo).Caption := '2,85434754%'; // Andre Imakawa - SIG 27626.32406
        TppLabel(cCampo).Caption := qryRelDemosSald.FieldByName('PERCCORRECAOSALPART').AsString + ' %'; // Andre Imakawa - SIG 27626.32406
        TppLabel(cLabel).visible := true;
        TppLabel(cCampo).visible := true;
       end;
    3: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'Salário de Participação corrigido pelo INPC:';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        //TppLabel(cCampo).Caption := CurrToStrF((qryRelDemosSald.FieldByName('SALPART').AsFloat * 01.0285434754) ,ffCurrency,2); // Andre Imakawa - SIG 27626.32406     // edilaine - SOL 253577-17564 / PPM 987196
        TppLabel(cCampo).Caption := CurrToStrF((qryRelDemosSald.FieldByName('SALPART').AsFloat) ,ffCurrency,2); // Andre Imakawa - SIG 27626.32406
        TppLabel(cLabel).visible := true;
        TppLabel(cCampo).visible := true;
       end;
    4: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'i:';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        TppLabel(cCampo).Caption := floattoStr(fI);
        TppLabel(cLabel).visible := true;
        TppLabel(cCampo).visible := true;
       end;
    5: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'BINSS:';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        TppLabel(cCampo).Caption := CurrToStrF(qryRelDemosSald.FieldByName('BINSS').AsFloat,ffCurrency,2);   // edilaine - SOL 253577-17564 / PPM 987196
        TppLabel(cLabel).visible := true;
        TppLabel(cCampo).visible := true;
       end;
    6: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'IDC:';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        TppLabel(cCampo).Caption := floattoStr(fIDC);
        TppLabel(cLabel).visible := true;
        TppLabel(cCampo).visible := true;
       end;
    7: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'TS:';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        TppLabel(cCampo).Caption := qryRelDemosSald.FieldByName('TS').AsString;               // edilaine - SOL 87536-17564 / PPM 987196
        TppLabel(cLabel).visible := true;
        TppLabel(cCampo).visible := true;
       end;
    8: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'BS Revisado:';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        TppLabel(cCampo).Caption := CurrToStrF(qryRelDemosSald.FieldByName('BENEFSALDADOINSS').AsFloat,ffCurrency,2);               // Luis Ferrari - SOL 87536
        TppLabel(cLabel).visible := False; //true;  //Ewerton Beltramini - SIG125500 - 13/05/2022
        TppLabel(cCampo).visible := False; //true;  //Ewerton Beltramini - SIG125500 - 13/05/2022
       end;
    9: begin
        cLabel := FindComponent('lbl'+inttostr(c));
        cCampo := FindComponent('cc'+inttostr(c));
        TppLabel(cLabel).Caption := 'FAB Revisado:';
        TppLabel(cCampo).Left    := TppLabel(cLabel).left + TppLabel(cLabel).spWidth + 3;
        TppLabel(cCampo).Caption := CurrToStrF(qryRelDemosSald.FieldByName('SALDOFABINSS').AsFloat,ffCurrency,2);               // Luis Ferrari - SOL 87536
        TppLabel(cLabel).visible := False; //true;   //Ewerton Beltramini - SIG125500 - 13/05/2022
        TppLabel(cCampo).visible := False; //true;   //Ewerton Beltramini - SIG125500 - 13/05/2022
       end;
   end ;

   c := c + 2;
  end;

  //monta a fórmula do Benefício Saldado dinamicamente posicionando os labels de acordo com o tamanho do campo anterior
  ppBs2.left    := ppbs1.left + ppbs1.spWidth + 2;
  ppBs2.caption := '('+ qryRelDemosSald.FieldByName('SALPART').AsString +' x 1,015';     // edilaine - SOL 253577-17564 / PPM 987196

  ppBs3.left    := ppbs2.left + ppbs2.spWidth+1 ;
  ppBs3.caption :=  floattoStr(fI);

  ppBs4.left    := ppbs3.left + ppbs3.spWidth+1 ;
  ppBs4.caption := ' - '+qryRelDemosSald.FieldByName('BINSS').AsString+') x ';           // edilaine - SOL 253577-17564 / PPM 987196

  ppBs5.left    := ppbs4.left + ppbs4.spWidth+1 ;
  //ppBs5.Caption := '(' +floattoStr(trunc(fIDC))+' - '+Floattostr(trunc(fIdade))+')';   // edilaine - SOL 253577-17564 / PPM 987196
  ppBs5.Caption := '(' +floattoStr(fIDC)+' - '+Floattostr(fIdade)+')';                   // edilaine - SOL 253577-17564 / PPM 987196

  ppBs6.left    := ppBs5.left + ((ppbs5.spWidth)/2) - 2;
  ppBs6.Caption := qryRelDemosSald.FieldByName('TS').Asstring;                           // edilaine - SOL 253577-17564 / PPM 987196

  //Label da segunda página do Demostrativo
  ppLabel20.Caption := 'Benefício Saldado: '+ CurrToStrF(qryRelDemosSald.FieldByName('BENEFICIOSALDADO').AsFloat,ffCurrency,2) +   // edilaine - SOL 253577-17564 / PPM 987196
                        ' (já acrescido de ' + qryRelDemosSald.FieldByName('PERCCORRECAOBS').AsString + '%)';// Andre Imakawa - SIG 27626.32406
end;


// edilaine - SOL 253577-17564 / PPM 987196 - inicio
function TfrmBeneficioSaldadoFAB.obtemIndice(): double;
begin


   qryCalculoIndiceIdadeSald.close;
   qryCalculoIndiceIdadeSald.ParamByName('IDPESSOA').AsString := IntToStr(iIdPessoa); // Andre Imakawa - SIG 27626.32406
   qryCalculoIndiceIdadeSald.open;


  rDados.Sexo     := qryCalculoIndiceIdadeSald.FieldByName('SEXO').AsString;
  rDados.Indice   := qryCalculoIndiceIdadeSald.FieldByName('INDICE').AsFloat;
  rDados.IdadeC   := qryCalculoIndiceIdadeSald.FieldByName('IDADESALDAMENTO').AsFloat;
  rdados.TS       := qryCalculoIndiceIdadeSald.FieldByName('TS').AsFloat;
  rDados.IdadeIni := qryCalculoIndiceIdadeSald.FieldByName('IDADEDIBINSS').AsFloat;

  if (rDados.Sexo = 'M') and (rDados.IdadeC > 53) then
     rDados.IdadeC := 53
  else if (rDados.Sexo = 'F') and (rDados.IdadeC > 48) then
     rDados.IdadeC := 48;

end;
// edilaine - SOL 253577-17564 / PPM 987196 - fim


// Andre Imakawa - SIG 27626.32406 - Inicio
procedure TfrmBeneficioSaldadoFAB.rpBenefSaldBeforePrint(Sender: TObject);
begin
  inherited;

   ppNOME_C.caption := qryBS_FAB2.FieldByName('NOME').AsString;
   ppMATRICULA_C.caption := qryBS_FAB2.FieldByName('MATRICULA').AsString;
   ppSALPART_C.caption := CurrToStrF(qryBS_FAB2.FieldByName('SALPART').AsFloat,ffCurrency,2);
   ppBFSALD2006_C.caption := CurrToStrF(qryBS_FAB2.FieldByName('BFSALD2006').AsFloat,ffCurrency,2);
   ppSALDOATUALIZADO_C.caption := CurrToStrF(qryBS_FAB2.FieldByName('SALDOATUALIZADO').AsFloat,ffCurrency,2);

end;

procedure TfrmBeneficioSaldadoFAB.rpFABBeforePrint(Sender: TObject);
begin
  inherited;
  ppNOME_C2.caption := qryBS_FAB2.FieldByName('NOME').AsString;
  ppMATRICULA_C2.caption := qryBS_FAB2.FieldByName('MATRICULA').AsString;
  ppTIPOELEGE_C2.caption := qryBS_FAB2.FieldByName('TIPOELEGE').AsString;
  ppDATAELEGE_C2.caption := qryBS_FAB2.FieldByName('DATAELEGE').AsString;
  ppSALDOATUAL_C.caption := CurrToStrF(qryBS_FAB2.FieldByName('SALDOATUAL').AsFloat,ffCurrency,2);
  ppSALPART_C2.caption := CurrToStrF(qryBS_FAB2.FieldByName('SALPART').AsFloat,ffCurrency,2);
  ppBFSALD2006_C2.caption := CurrToStrF(qryBS_FAB2.FieldByName('BFSALD2006').AsFloat,ffCurrency,2);
  ppSALDOATUALIZADO_C2.caption := CurrToStrF(qryBS_FAB2.FieldByName('SALDOATUALIZADO').AsFloat,ffCurrency,2);

end;
// Andre Imakawa - SIG 27626.32406 - Fim
end.
