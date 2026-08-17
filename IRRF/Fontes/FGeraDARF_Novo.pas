//******************************************************************************
// N. Chamado....: WO34233
// Dt Alteração..: 18/03/2026
// Responsável...: Paulo Nobre
// Descrição.....: PROJETO CNPJ ALFANUMÉRICO
//                 .(.DFM) - Ajustando o padrão da mascara atual do CNPJ para
//                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'. 
//******************************************************************************
//Rotina                : spbImpDARFClick
//N. SIG                : 89748
//Data da Alteração:    : 02/08/2019
//Responsável:          : Everson Cunha
//Descrição             : Criação de campo para identificação com Banco (Caixa)
//******************************************************************************
//Rotina                : spbExpBenefSel, SpeedButton1
//N. SIG                : 89051
//Data da Alteração:    : 19/07/2019
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Taffarel Sevaybriker
//Descrição             : Erro ao fechar caixa de diálogo do componente
//                        qeMovPrepDARF
//******************************************************************************
//Rotina                : spbExcluiDARFClick
//N. SIG                : 71506
//Data da Alteração:    : 30/04/2019
//Responsável:          : Everson Cunha
//Descrição             : Incluir rotina de excluir CAPCAR na exclusão do DARF
//                        Incluída a uCtrlDocumento
//******************************************************************************
//Rotina                : spbGerarDARFClick
//N. SIG                : 80510
//Data da Alteração:    : 09/01/2019
//Responsável:          : Cássio Florencio Rovaroto
//Descrição             : Correção na forma de verificação de renidmento
//                        judicial na geração de DARF's
//******************************************************************************
//Rotina                : spbGerarDARFClick
//                        GetRateioLinhasIRRFFolhaBenef
//N. SIG                : 79711
//Data da Alteração:    : 14/12/2018
//Responsável:          : Cássio Florencio Rovaroto
//Descrição             : Alteração na formato de geração do arquivo DARF para
//                        natureza de rendimento não judiciais.
//******************************************************************************
//Rotina                : spbImpDARFClick
//N. SIG                : 79284
//Data da Alteração:    : 04/12/2018
//Responsável:          : Andre Imakawa
//Descrição             : Correção na impressão do DARF. Agrupar o DARF.
//******************************************************************************
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        :
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//******************************************************************************
//Rotina                : spbImpDARFClick
//N. SIG                : 76324
//Data da Alteração:    : 04/10/2018
//Responsável:          : Andre Imakawa
//Descrição             : Correção do erro ocasionado no SIG 71547.
//******************************************************************************
//Rotina                : spbImpDARFClick
//N. SIG                : 71547
//Data da Alteração:    : 17/07/2018
//Responsável:          : Andre Imakawa
//Descrição             : Tratamento para não duplicar DARF quando pessoa for
//                        Titular e Pensionista.
//***************************************************************************************
//Alteração Form:    : sqlDarfJur, rpDarfJur (grupo), rpDarfJur) ppDBText4 ppDBText28
//Rotina             : spbImpDARFClick
//N. SIG..........   : 71467
//Data da Alteração: : 06/07/2018
//Alteração Form:    : FGeraDARF_novo
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Readequação da funcionaidade para retornar a implementações feitas
//                     nos SIG 's 69631, 69594 e 66506.
//***************************************************************************************
//Rotina             : spbImpDARFClick
//N. SIG..........   : 70052
//Data da Alteração: : 06/07/2018
//Alteração Form:    : FGeraDARF_novo
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Inclusão de novas condições de filtro para geração das guias DARF
//                     para os rendimento 4716 e 7431
//***************************************************************************************
//Rotina                : spbImpDARFClick, rpDarfJur (grupo)
//N. SIG                : 69631
//Data da Alteração:    : 06/06/2018
//Responsável:          : Edilaine
//Descrição             : a consulta para impressao do DARF aparece linhas duplicadas
//***************************************************************************************
//Alteração Form:       : sqlDarfJur, rpDarfJur (grupo)
//Rotina                : spbImpDARFClick
//N. SIG                : 69594
//Data da Alteração:    : 05/06/2018
//Responsável:          : Edilaine
//Descrição             : no momento da geração do DARF gera guia unifica dos valores para
//                        pessoas que possuem 2 processos
//***************************************************************************************
//Alteração Form:       : (rpDarfJur) ppDBText4 ppDBText28
//Rotina                :
//N. SIG                : 66506
//Data da Alteração:    : 06/04/2018
//Responsável:          : Edilaine
//Descrição             : reposicionamento do número de processo de ação judicial
//***************************************************************************************
//Rotina                : Geral
//N. SIG                : 47588                 
//Data da Alteração:    : 06/06/2017
//Alteração Form:       : frmGeraDARF_Novo
//Responsável:          : Paulo Nobre
//Descrição             : Inclusao do campo FLGTIPOINCLUSAO nos CDS e marcação em
//                        marrom na grid Movimentação Geração DARF quando for = 'M' manual
//*******************************************************************************
//Rotina                : Geral
//N. SIG                : 34742
//Data da Alteração:    : 17/01/2017
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição             : Re-desenho de uma nova interface agregando inumeros recursos e facilidades
//----------------------------------------------------------------------------------------------------

Unit FGeraDARF_Novo;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, TREdit, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, FileCtrl,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Buttons, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, Wwintl, wwDialog,
  Wwlocate, ImgList, uCmSqlParams, QExport3Dialog, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, fcLabel, wwSpeedButton, wwDBNavigator, wwclearpanel,
  uCtrlModuloIRRF, uCtrlParamIntegra, uCtrlCentRespon, uFuncoesUteisIR,
  uCtrlGeraDARF_Novo, DBCtrls, jpeg, Mask, wwdbedit,
  DBTables, Wwquery, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppModule, daDataModule, ppVar, CmParamReport, uCtrlDocumento, uCtrlPadroes;

Const CorDaZebra = clBtnFace; // $00FDD2D0
Const iClientHeight = 600; // Altura padrão do Form
Const iClientWidth = 1209; // Largura padrão do Form
Const iTop = 90;

Const MSG01 = 'Obrigatório preencher a Natureza do Rendimento.';
Const MSG02 = 'Obrigatório preencher a Data Inicial.'; //  <OK>
Const MSG03 = 'Obrigatório preencher a Data Final.'; //  <OK>
Const MSG04 = 'Data Inicial não pode ser superior a Data Final.'; // <OK>
Const MSG05 = 'Não localizado Movimento Gravado dos DARF´s. Verifique se foram Preparados.';
Const MSG06 = 'Não há Lançamento(s) Marcado(s) !';
Const MSG07 = 'Obrigatório preencher a Data de Vencimento.';
Const MSG08 = 'A Data de Vencimento precisa ser dia útil.';
Const MSG09 = 'Não localizado Movimento Gerado dos DARF´s para os critérios Selecionados.';
Const MSG10 = 'Para esta Natureza a Data de Vencimento tem que ser superior a Data Final do Período de Apuração.';
Const MSG11 = 'Para esta Natureza a Data de Vencimento tem que ser superior a Data Inicial do Período de Apuração.';

Type
  TfrmGeraDARF_Novo = Class(TfrmSairAjuda)
    pcDados: TPageControl;
    tbsDadosSel: TTabSheet;
    tbsDadosAdicionais: TTabSheet;
    LblFormaPag: TLabel;
    Label17: TLabel;
    memObsCap: TMemo;
    edRef: TEdit;
    cdsMovDARFDisponivel: TCMClientDataSet;
    dsMovDARFDisponivel: TwwDataSource;
    cdsRateio: TCMClientDataSet;
    cdsCCBaixasxDocum: TCMClientDataSet;
    Label5: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    fcLabel2: TfcLabel;
    SqlMovDARFDisponivel: TCMSqlParams;
    cdsMovDARFDisponivelDATALANCAMENTO: TDateTimeField;
    cdsMovDARFDisponivelIDDARF: TFloatField;
    cdsMovDARFDisponivelCODNATUREZA: TStringField;
    cdsMovDARFDisponivelFLGDARF: TStringField;
    cdsMovDARFDisponivelVLRBASE: TFloatField;
    cdsMovDARFDisponivelNUMDOCUMENTO: TStringField;
    cdsMovDARFDisponivelCODTIPRECDES: TStringField;
    cdsMovDARFDisponivelPLACONTARECDES: TStringField;
    cdsMovDARFDisponivelIDMODULO: TStringField;
    cdsMovDARFDisponivelVLRIRRF: TFloatField;
    cdsMovDARFDisponivelCODCENTROCUSTO: TStringField;
    cdsMovDARFDisponivelCODCENTRORESPON: TStringField;
    cdsMovDARFDisponivelPLANO: TFloatField;
    cdsMovDARFDisponivelPLACONTA: TStringField;
    cdsMovDARFDisponivelIDPATRO: TFloatField;
    cdsMovDARFDisponivelIDPLANOPREV: TFloatField;
    cdsMovDARFDisponivelIDPLANOPREVPREV: TFloatField;
    cdsMovDARFDisponivelIDPROGRAMA: TFloatField;
    cdsMovDARFDisponivelIDMOTIVO: TFloatField;
    cdsMovDARFDisponivelIDHSTFOLHABENEF: TFloatField;
    cdsMovDARFDisponivelTIPODESEMBOLSO: TStringField;
    ListaDeImagens: TImageList;
    LMovSelDARF: TwwLocateDialog;
    wwIntl_Port: TwwIntl;
    IvExtendedTranslator1: TIvExtendedTranslator;
    cdsMovDARFDisponivelIDLANCIRRFFOLHABENEF: TFloatField;
    cdsMovDARFDisponivelFLGREGEXCLUIDO: TStringField;
    cdsMovDARFDisponivelIDPESSOA: TFloatField;
    sqlNaturRendimento: TCMSqlParams;
    cdsNaturRendimento: TCMClientDataSet;
    cdsNaturRendimentoDESCRICAOCOMPL: TStringField;
    cdsNaturRendimentoCODNATUREZA: TStringField;
    cdsNaturRendimentoDESCRICAO: TStringField;
    qryAux1: TwwQuery;
    qryAux2: TwwQuery;
    qryTabDARF: TwwQuery;
    qryTabDARFIDDARF: TFloatField;
    qryTabDARFCODDOCUMENTO: TFloatField;
    qryTabDARFNUMDOCUMENTO: TStringField;
    qryTabDARFCODNATUREZA: TStringField;
    qryTabDARFDATAINIAPURACAO: TDateTimeField;
    qryTabDARFDATAFINALAPURACAO: TDateTimeField;
    qryTabDARFDATAVENCDARF: TDateTimeField;
    qryTabDARFREFERENCIA: TStringField;
    qryTabDARFVLRIRRF: TFloatField;
    qryTabDARFVLRMULTA: TFloatField;
    qryTabDARFVLRJUROS: TFloatField;
    qryTabDARFVLRTOTAL: TFloatField;
    qryTabDARFDATAEMISDARF: TDateTimeField;
    qryTabDARFTRGDTINCLUSAO: TDateTimeField;
    qryTabDARFTRGUSERINCLUSAO: TStringField;
    qryTabDARFNOME: TStringField;
    dsTabDARF: TwwDataSource;
    plnDados: TPanel;
    lblNatureza: TLabel;
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    dblcNatureza: TwwDBLookupCombo;
    pcMovimentoDARF: TPageControl;
    tbsMovDARFDisponivel: TTabSheet;
    tbsMovDARFGerado: TTabSheet;
    Panel5: TPanel;
    Panel15: TPanel;
    spbExpBenefSel: TSpeedButton;
    spbMarcaTodos: TSpeedButton;
    spbInverterSel: TSpeedButton;
    wwDBNavigator1: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    btnavLocalizarBenef: TwwNavButton;
    stQtd1: TStaticText;
    dbgMovDARF: TwwDBGrid;
    Panel18: TPanel;
    spbSelDarf: TSpeedButton;
    spbGerarDARF: TSpeedButton;
    Panel16: TPanel;
    Panel19: TPanel;
    stQtd2: TStaticText;
    Panel20: TPanel;
    spbExcluiDARF: TSpeedButton;
    dsMovDARFGerado: TwwDataSource;
    SqlMovDARFGerado: TCMSqlParams;
    SpeedButton1: TSpeedButton;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Label21: TLabel;
    Panel24: TPanel;
    Label22: TLabel;
    Panel25: TPanel;
    Label23: TLabel;
    Panel26: TPanel;
    Label24: TLabel;
    Panel27: TPanel;
    Label25: TLabel;
    Panel28: TPanel;
    Label26: TLabel;
    DBRealEdit1: TDBRealEdit;
    Panel29: TPanel;
    Label28: TLabel;
    DBRealEdit2: TDBRealEdit;
    Panel30: TPanel;
    Label29: TLabel;
    DBRealEdit3: TDBRealEdit;
    Panel31: TPanel;
    Label30: TLabel;
    DBRealEdit4: TDBRealEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    CMDateTimePicker1: TCMDateTimePicker;
    Panel32: TPanel;
    Label31: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    CMDateTimePicker3: TCMDateTimePicker;
    spbSelMovDARFGerado: TSpeedButton;
    Image3: TImage;
    Label32: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dbgDARFGerados: TwwDBGrid;
    wwDBNavigator2: TwwDBNavigator;
    wwNavButton5: TwwNavButton;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    LMovDARFGer: TwwLocateDialog;
    cdsMovDARFGerado: TCMClientDataSet;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField4: TFloatField;
    StringField9: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField14: TStringField;
    FloatField11: TFloatField;
    StringField15: TStringField;
    FloatField12: TFloatField;
    Image1: TImage;
    Image2: TImage;
    cdsMovDARFDisponivelNOMEBENEFICIARIO: TStringField;
    cdsMovDARFDisponivelDESCMOTIVO: TStringField;
    cdsMovDARFDisponivelNOMEPLANOPREV: TStringField;
    cdsMovDARFDisponivelNOMEPATRO: TStringField;
    cdsMovDARFGeradoNOMEBENEFICIARIO: TStringField;
    cdsMovDARFGeradoDESCMOTIVO: TStringField;
    cdsMovDARFGeradoNOMEPLANOPREV: TStringField;
    cdsMovDARFGeradoNOMEPATRO: TStringField;
    dsDarfNormal: TwwDataSource;
    pplDarfNormal: TppBDEPipeline;
    rpDarfNormal: TppReport;
    ppDetailBand1: TppDetailBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppShape28: TppShape;
    ppShape27: TppShape;
    rpDarfShape1: TppShape;
    rpDarfShape12: TppShape;
    rpDarfShape13: TppShape;
    rpDarfShape10: TppShape;
    rpDarfShape11: TppShape;
    rpDarfShape8: TppShape;
    rpDarfShape9: TppShape;
    rpDarfShape2: TppShape;
    rpDarfImage1: TppImage;
    rpDarfLabel1: TppLabel;
    rpDarfLabel2: TppLabel;
    rpDarfLabel3: TppLabel;
    rpDarfLabel4: TppLabel;
    rpDarfShape3: TppShape;
    rpDarfLabel5: TppLabel;
    rpDarfLabel6: TppLabel;
    rpDarfShape4: TppShape;
    rpDarfLabel7: TppLabel;
    rpDarfLabel8: TppLabel;
    rpDarfShape5: TppShape;
    rpDarfShape6: TppShape;
    rpDarfShape7: TppShape;
    rpDarfLabel10: TppLabel;
    rpDarfLabel11: TppLabel;
    rpDarfLabel12: TppLabel;
    rpDarfLabel13: TppLabel;
    rpDarfLabel14: TppLabel;
    rpDarfLabel15: TppLabel;
    rpDarfLabel16: TppLabel;
    rpDarfLabel17: TppLabel;
    rpDarfShape14: TppShape;
    rpDarfShape15: TppShape;
    rpDarfLabel18: TppLabel;
    rpDarfLabel19: TppLabel;
    rpDarfShape16: TppShape;
    rpDarfShape17: TppShape;
    rpDarfLabel20: TppLabel;
    rpDarfLabel21: TppLabel;
    rpDarfShape18: TppShape;
    rpDarfShape19: TppShape;
    rpDarfLabel22: TppLabel;
    rpDarfLabel23: TppLabel;
    rpDarfShape20: TppShape;
    rpDarfShape21: TppShape;
    rpDarfLabel25: TppLabel;
    rpDarfMemo2: TppMemo;
    rpDarfDBText2: TppDBText;
    rpDarfDBText3: TppDBText;
    rpDarfDBText4: TppDBText;
    rpDarfDBText5: TppDBText;
    rpDarfDBText6: TppDBText;
    rpDarfDBText7: TppDBText;
    rpDarfDBText10: TppDBText;
    rpDarfLabel41: TppLabel;
    rpDarfLabel9: TppLabel;
    rpDarfMemo1: TppMemo;
    rpDarfShape22: TppShape;
    rpDarfShape23: TppShape;
    rpDarfLabel26: TppLabel;
    rpDarfLabel27: TppLabel;
    rpDarfLabel28: TppLabel;
    rpDarfLabel29: TppLabel;
    rpDarfDBText8: TppDBText;
    rpDarfDBText9: TppDBText;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppImage1: TppImage;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape14: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppShape15: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel52: TppLabel;
    ppMemo1: TppMemo;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel54: TppLabel;
    ppMemo2: TppMemo;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppShape29: TppShape;
    ppMemo3: TppMemo;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    spbImpDARF: TSpeedButton;
    cdsDarfJur: TCMClientDataSet;
    sqlDarfJur: TCMSqlParams;
    rpDarfJur: TppReport;
    ppDetailBand2: TppDetailBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape9: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppImage3: TppImage;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppImage2: TppImage;
    ppShape40: TppShape;
    ppShape41: TppShape;
    ppImage4: TppImage;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppShape42: TppShape;
    ppShape43: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppLabel26: TppLabel;
    ppLabel37: TppLabel;
    ppShape48: TppShape;
    ppShape49: TppShape;
    ppLabel38: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText14: TppDBText;
    rpDarfJuridicoDBText11: TppDBText;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBText15: TppDBText;
    ppDBText18: TppDBText;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    rpDarfJuridicoDBText12: TppDBText;
    ppLabel45: TppLabel;
    ppLabel53: TppLabel;
    ppLabel59: TppLabel;
    ppLine1: TppLine;
    ppLabel60: TppLabel;
    ppLine2: TppLine;
    ppLabel61: TppLabel;
    ppDBText19: TppDBText;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppDBText22: TppDBText;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppDBText23: TppDBText;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppDBText24: TppDBText;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppDBText25: TppDBText;
    ppLine3: TppLine;
    ppLabel73: TppLabel;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppImage7: TppImage;
    ppImage8: TppImage;
    ppImage9: TppImage;
    ppImage10: TppImage;
    ppImage11: TppImage;
    ppImage12: TppImage;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppShape52: TppShape;
    ppShape53: TppShape;
    ppShape54: TppShape;
    ppImage13: TppImage;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppShape58: TppShape;
    ppShape59: TppShape;
    ppShape60: TppShape;
    ppImage14: TppImage;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppShape61: TppShape;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppShape62: TppShape;
    ppShape63: TppShape;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppShape64: TppShape;
    ppShape65: TppShape;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppShape66: TppShape;
    ppShape67: TppShape;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppShape68: TppShape;
    ppShape69: TppShape;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppShape70: TppShape;
    ppShape71: TppShape;
    ppLabel95: TppLabel;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppShape72: TppShape;
    ppShape73: TppShape;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppDBText36: TppDBText;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLine4: TppLine;
    ppLabel105: TppLabel;
    ppLine5: TppLine;
    ppLabel106: TppLabel;
    ppDBText37: TppDBText;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppShape74: TppShape;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppDBText40: TppDBText;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppDBText41: TppDBText;
    ppShape75: TppShape;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppDBText42: TppDBText;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppDBText43: TppDBText;
    ppLine6: TppLine;
    ppLabel118: TppLabel;
    ppImage15: TppImage;
    ppImage16: TppImage;
    ppImage17: TppImage;
    ppImage18: TppImage;
    ppImage19: TppImage;
    ppImage20: TppImage;
    ppImage21: TppImage;
    ppImage22: TppImage;
    ppImage23: TppImage;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppDBText44: TppDBText;
    ppLabel127: TppLabel;
    ppDBText45: TppDBText;
    ppCalc1: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    pplblNumReferencia1: TppLabel;
    ppLabel131: TppLabel;
    ppImage24: TppImage;
    ppShape76: TppShape;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppImage25: TppImage;
    ppLabel134: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    daDataModule1: TdaDataModule;
    dsDarfJur: TwwDataSource;
    Label3: TLabel;
    dedDataVenc: TCMDateTimePicker;
    cdsMovDARFGeradoCODDOCUMENTO: TFloatField;
    cdsMovDARFDisponivelCODDOCUMENTO: TFloatField;
    CmpDadosImp: TCmParamReport;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    pplDarfJur: TppBDEPipeline;
    cdsMovDARFDisponivelFLGTIPOINCLUSAO: TStringField;
    cdsMovDARFGeradoFLGTIPOINCLUSAO: TStringField;
    qeDARFGerado: TQExport3Dialog;
    qeGeracaoDARF: TQExport3Dialog;
    pplDarfJurppField26: TppField;
    txtcodigo_darf_caixa: TppDBText;
    txtCODIGO_DARF_CAIXA1: TppDBText;
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormShow(Sender: TObject);
    Procedure spbMarcaTodosClick(Sender: TObject);
    Procedure spbInverterSelClick(Sender: TObject);
    Procedure spbExpBenefSelClick(Sender: TObject);
    Procedure spbSelDarfClick(Sender: TObject);
    Procedure dbgMovDARFCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure dbgMovDARFFieldChanged(Sender: TObject; Field: TField);
    Procedure cdsMovDARFDisponivelAfterScroll(DataSet: TDataSet);
    Procedure dbgMovDARFDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure deDataIniChange(Sender: TObject);
    Procedure spbGerarDARFClick(Sender: TObject);
    Procedure spbExcluiDARFClick(Sender: TObject);
    Procedure spbSelMovDARFGeradoClick(Sender: TObject);
    Procedure cdsMovDARFGeradoAfterScroll(DataSet: TDataSet);
    Procedure SpeedButton1Click(Sender: TObject);
    Procedure dbgDARFGeradosDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbImpDARFClick(Sender: TObject);
    Procedure ppLabel129Print(Sender: TObject);
    Procedure pcMovimentoDARFChange(Sender: TObject);
  Private
    { Private declarations }
    ModuloIRRF: TCtrlModuloIRRF;
    oGerarDARF: TCtrlGeraDARF_Novo;
    CtrlCentRespon: TCtrlCentRespon;
    FMensagemCtrlDocumento: String;  //Everson Cunha - SIG71506

    Procedure _SelecionaMovimentos(sSit: String);

    Function _TotalizaColunaGridMovDARFDisp(pCampo: String; pDecimal: Integer): String;
    Function _TotalizaColunaGridMovDARFGer(pCampo: String; pDecimal: Integer): String;
    Function _Formatar(Origem, Formato: String): String;

    Function ExcluirDocumentoCAPCAR(Const iDocumento: Integer): Boolean; //Everson Cunha - SIG71506

  Public
    { Public declarations }


  End;

Var
  frmGeraDARF_Novo: TfrmGeraDARF_Novo;
  sPathArquivosLog: String;

Implementation
{$R *.DFM}
Uses
  uMensErro, uDataBase, DBaseDados, uSistema, uString, dLookIRRF, uDiasUteis,
  FProgresso, fAguarde, FPreview;

Procedure TfrmGeraDARF_Novo.FormCreate(Sender: TObject);
Begin
  Inherited;
  // Ajustando a tela para o tamanho padrão definido nas constantes
  ClientHeight := iClientHeight;
  ClientWidth := iClientWidth;
  Top := iTop;

  ModuloIRRF := TCtrlModuloIRRF.Create;
  ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  oGerarDARF := TCtrlGeraDARF_Novo.Create;
  oGerarDARF.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  CtrlCentRespon := TCtrlCentRespon.Create;
  CtrlCentRespon.InitializeAs(ModuloIRRF);

  sPathArquivosLog := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogMovDARF';
  If Not DirectoryExists(sPathArquivosLog) Then
    ForceDirectories(sPathArquivosLog);
End;

Procedure TfrmGeraDARF_Novo.FormShow(Sender: TObject);
Begin
  Inherited;
  pcDados.ActivePage := tbsDadosSel;
  pcMovimentoDARF.ActivePage := tbsMovDARFDisponivel;

  Screen.Cursor := crSQLWait;
  SqlMovDARFDisponivel.Open;
  SqlMovDARFGerado.Open;
  qryTabDARF.Close;
  qryTabDARF.Open;
  cdsMovDARFGeradoAfterScroll(cdsMovDARFGerado);
  cdsNaturRendimento.Data := oGerarDARF._ListaNatuRendimento;
  dtmLookIRRF.cdsLookCentroRespon.Data := CtrlCentRespon.ListaCentRespon(
    Sistema.IdEmpresa, // IDPessoa
    '', // IDCentRespon
    0, // iOrdem
    'A', // sSintetAnalit
    ParamIntegra.PlanoCentroRespon,
    True, //  bListaCRpadrao
    True // bSoAtivos
    );
  Screen.Cursor := crDefault;

  tbsMovDARFGerado.Highlighted := false;
  spbGerarDARF.Enabled := (Not cdsMovDARFDisponivel.isempty);
  dedDataVenc.Enabled := (Not cdsMovDARFDisponivel.isempty);
  spbExcluiDARF.Enabled := (Not cdsMovDARFGerado.isempty);
  spbImpDARF.Enabled := (Not cdsMovDARFGerado.isempty);
  dbgMovDARF.ColumnByName('VLRBASE').FooterValue := '0,00';
  dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := '0,00';
  dbgDARFGerados.ColumnByName('VLRBASE').FooterValue := '0,00';
  dbgDARFGerados.ColumnByName('VLRIRRF').FooterValue := '0,00';
  //
  // identifica a próxima data de vencimento do IRRF, baseado no date (o parametro ZERO indica IRRF)
  dedDataVenc.Date := ModuloIRRF.CalcProxDiaSemana(Sistema.IdEmpresa, Date, 3, True, 0);
  dedDataVenc.Text := DateToStr(dedDataVenc.Date);
  //
  deDataIni.Date := ModuloIRRF.CalcDataIni(dedDataVenc.Date, 0); // (o parametro ZERO indica IRRF)
  deDataFim.Date := ModuloIRRF.CalcDataFim(dedDataVenc.Date, 0); // (o parametro ZERO indica IRRF)
  deDataIni.Text := DateToStr(deDataIni.Date);
  deDataFim.Text := DateToStr(deDataFim.Date);

  dblcNatureza.Setfocus;
End;

Procedure TfrmGeraDARF_Novo.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  FreeAndNil(ModuloIRRF);
  FreeAndNil(oGerarDARF);
  FreeAndNil(CtrlCentRespon);
End;

Function TfrmGeraDARF_Novo._TotalizaColunaGridMovDARFDisp(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  cdsMovDARFDisponivel.AfterScroll := Nil;
  cdsMovDARFDisponivel.DisableControls;
  cdsMovDARFDisponivel.First;
  While Not cdsMovDARFDisponivel.EOF Do
    Begin
      If (cdsMovDARFDisponivel.fieldByname('FLGREGEXCLUIDO').asString = 'N') Then // Não
        If cdsMovDARFDisponivel.fieldByname('FLGDARF').asString = 'S' Then // Sim
          dTotalFiltro := dTotalFiltro + cdsMovDARFDisponivel.Fieldbyname(pCampo).asFloat;
          
      cdsMovDARFDisponivel.Next;
    End;
  cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
  cdsMovDARFDisponivel.First;
  cdsMovDARFDisponivel.enableControls;

  Result := floattostrf(dTotalFiltro, ffnumber, 12, pDecimal);
End;

Function TfrmGeraDARF_Novo._TotalizaColunaGridMovDARFGer(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  cdsMovDARFGerado.AfterScroll := Nil;
  cdsMovDARFGerado.DisableControls;
  cdsMovDARFGerado.First;
  While Not cdsMovDARFGerado.EOF Do
    Begin
      dTotalFiltro := dTotalFiltro + cdsMovDARFGerado.Fieldbyname(pCampo).asFloat;

      cdsMovDARFGerado.Next;
    End;
  cdsMovDARFGerado.AfterScroll := cdsMovDARFGeradoAfterScroll;
  cdsMovDARFGerado.First;
  cdsMovDARFGerado.enableControls;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, pDecimal);
End;

Procedure TfrmGeraDARF_Novo.spbMarcaTodosClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If (Not cdsMovDARFDisponivel.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Lançamentos...', True, False, True, 0, cdsMovDARFDisponivel.RecordCount);
      Application.ProcessMessages;
      cdsMovDARFDisponivel.DisableControls;
      cdsMovDARFDisponivel.AfterScroll := Nil;
      cdsMovDARFDisponivel.First;
      While Not cdsMovDARFDisponivel.Eof Do
        Begin
          If cdsMovDARFDisponivel.FieldByName('FLGREGEXCLUIDO').AsString = 'N' Then // Não
            Begin
              cdsMovDARFDisponivel.Edit;
              If cdsMovDARFDisponivel.FieldByName('FLGDARF').AsString = 'N' Then
                cdsMovDARFDisponivel.FieldByName('FLGDARF').AsString := 'S'; // Sim
              cdsMovDARFDisponivel.Post;
            End;

          cdsMovDARFDisponivel.Next;
          oGerarDARF._AtualizaFrmProgresso(iContador);
        End;
      dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
      dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
      cdsMovDARFDisponivel.EnableControls;
      cdsMovDARFDisponivel.First;
      cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmGeraDARF_Novo.spbInverterSelClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsMovDARFDisponivel.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Lançamentos...', True, False, True, 0, cdsMovDARFDisponivel.RecordCount);
      Application.ProcessMessages;
      cdsMovDARFDisponivel.DisableControls;
      cdsMovDARFDisponivel.AfterScroll := Nil;
      cdsMovDARFDisponivel.First;
      While Not cdsMovDARFDisponivel.Eof Do
        Begin
          If cdsMovDARFDisponivel.FieldByName('FLGREGEXCLUIDO').AsString = 'N' Then // Não
            Begin
              cdsMovDARFDisponivel.Edit;
              If cdsMovDARFDisponivel.FieldByName('FLGDARF').AsString = 'S' Then // Sim
                cdsMovDARFDisponivel.FieldByName('FLGDARF').AsString := 'N' // Não
              Else
                cdsMovDARFDisponivel.FieldByName('FLGDARF').AsString := 'S'; // Sim
              cdsMovDARFDisponivel.Post;
            End;

          cdsMovDARFDisponivel.Next;
          oGerarDARF._AtualizaFrmProgresso(iContador);
        End;
      dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
      dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
      cdsMovDARFDisponivel.EnableControls;
      cdsMovDARFDisponivel.First;
      cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmGeraDARF_Novo.spbExpBenefSelClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovDARFDisponivel.isEmpty Then
    Begin
      cdsMovDARFDisponivel.AfterScroll := Nil;
      qeGeracaoDARF.FileName := sPathArquivosLog + '\MOVDARFDISP.XLS';
      qeGeracaoDARF.Execute;
      cdsMovDARFDisponivel.First;
      cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
    End;
End;

Procedure TfrmGeraDARF_Novo.SpeedButton1Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovDARFGerado.isEmpty Then
    Begin
      cdsMovDARFGerado.AfterScroll := Nil;
      qeDARFGerado.FileName := sPathArquivosLog + '\MOVDARFGERADO.XLS';
      qeDARFGerado.Execute;
      cdsMovDARFGerado.First;
      cdsMovDARFGerado.AfterScroll := cdsMovDARFGeradoAfterScroll;
    End;
End;

Procedure TfrmGeraDARF_Novo.spbSelDarfClick(Sender: TObject);
Begin
  Inherited;
  _SelecionaMovimentos('0'); // DARFs não gerados
End;

Procedure TfrmGeraDARF_Novo._SelecionaMovimentos(sSit: String);
Begin
  If trim(dblcNatureza.lookupvalue) = EmptyStr Then
    Begin
      MsgDlg(MSG01, 'Atenção', mtInformation, [mbOk], 0);
      dblcNatureza.SetFocus;
      Exit;
    End;

  If deDataIni.Text = EmptyStr Then
    Begin
      MsgDlg(MSG02, 'Atenção', mtWarning, [mbOK], 0);
      deDataIni.SetFocus;
      deDataIni.SelectAll;
      Exit;
    End;

  If deDataFim.Text = EmptyStr Then
    Begin
      MsgDlg(MSG03, 'Atenção', mtWarning, [mbOK], 0);
      deDataIniChange(Self);
      deDataFim.SetFocus;
      deDataIni.SelectAll;
      Exit;
    End;

  If deDataIni.Date > deDataFim.Date Then
    Begin
      MsgDlg(MSG04, 'Atenção', mtWarning, [mbOK], 0);
      deDataIni.SetFocus;
      deDataIni.SelectAll;
      Exit;
    End;

  // este recurso é para dar o enter na mensagem de confirmação da seleção somente
  // se foi chamada direto da funcionalidade de Preparação do DARF.
  If tag = 1 Then
    keybd_event(VK_RETURN, 0, 0, 0);
  //

  If Application.MessageBox('Confirma Seleção do Movimento ?', 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES Then
    Begin
      If sSit = '0' Then // DARF´s não Gerados
        Begin
          frmAguarde.pbAguarde.Visible := false;
          frmAguarde.Mostra('Selecionando Movimento...');
          Screen.Cursor := crSQLWait;
          cdsMovDARFDisponivel.Data := oGerarDARF._SelMovDARF(Sistema.IdEmpresa, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue, sSit);
          cdsMovDARFDisponivel.First;

          spbGerarDARF.Enabled := (Not cdsMovDARFDisponivel.isempty);
          dedDataVenc.Enabled := (Not cdsMovDARFDisponivel.isempty);

          dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
          dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);

          cdsMovDARFGerado.Data := oGerarDARF._SelMovDARF(Sistema.IdEmpresa, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue, '1');
          tbsMovDARFGerado.Highlighted := (Not cdsMovDARFGerado.isEmpty);
          spbExcluiDARF.Enabled := (Not cdsMovDARFGerado.isempty);
          spbImpDARF.Enabled := (Not cdsMovDARFGerado.isempty);

          dbgDARFGerados.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFGer('VLRBASE', 2);
          dbgDARFGerados.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFGer('VLRIRRF', 2);

          Screen.Cursor := crDefault;
          frmAguarde.pbAguarde.Visible := True;
          frmAguarde.Apaga;
          dblcNatureza.SetFocus;
          dblcNatureza.Selected;

          If cdsMovDARFDisponivel.isEmpty Then
            Application.MessageBox(MSG05, 'Atenção !', Mb_IconExclamation);
        End
      Else // DARF´s Gerados
        Begin
          Application.ProcessMessages;
          frmAguarde.pbAguarde.Visible := false;
          frmAguarde.Mostra('Selecionando Movimento...');
          Screen.Cursor := crSQLWait;
          cdsMovDARFGerado.Data := oGerarDARF._SelMovDARF(Sistema.IdEmpresa, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue, sSit);
          If Not cdsMovDARFGerado.isEmpty Then
            Begin
              spbExcluiDARF.Enabled := (Not cdsMovDARFGerado.isempty);
              spbImpDARF.Enabled := (Not cdsMovDARFGerado.isempty);

              dbgDARFGerados.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFGer('VLRBASE', 2);
              dbgDARFGerados.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFGer('VLRIRRF', 2);

              Screen.Cursor := crDefault;
              frmAguarde.pbAguarde.Visible := True;
              frmAguarde.Apaga;
              dblcNatureza.SetFocus;
              dblcNatureza.Selected;
            End
          Else
            Begin
              Screen.Cursor := crDefault;
              frmAguarde.pbAguarde.Visible := True;
              frmAguarde.Apaga;
              dblcNatureza.SetFocus;
              dblcNatureza.Selected;
              Application.MessageBox(MSG09, 'Atenção !', Mb_IconExclamation);
            End;
        End;

    End;
End;

Procedure TfrmGeraDARF_Novo.dbgMovDARFCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  Inherited;
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        // linhas ímpares = Cinza, linhas pares = branco
        If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
          ABrush.Color := CorDaZebra
        Else
          ABrush.Color := clWhite;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmGeraDARF_Novo.dbgMovDARFFieldChanged(Sender: TObject; Field: TField);
Var RegAtual1: TBookMark;
Begin
  Inherited;
  RegAtual1 := cdsMovDARFDisponivel.GetBookmark; // Salvando o ponteiro do Registro atual
  dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
  dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
  If RegAtual1 <> Nil Then
    cdsMovDARFDisponivel.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
End;

Procedure TfrmGeraDARF_Novo.cdsMovDARFDisponivelAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  stQtd1.Caption := Format('%.2d / %.2d', [cdsMovDARFDisponivel.RecNo, cdsMovDARFDisponivel.RecordCount]);
End;

Procedure TfrmGeraDARF_Novo.dbgMovDARFDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not cdsMovDARFDisponivel.isEmpty Then
    Begin
      If cdsMovDARFDisponivel.fieldByname('FLGREGEXCLUIDO').asString = 'S' Then
        Begin
          dbgMovDARF.Canvas.Font.Style := [fsStrikeout];
          dbgMovDARF.Canvas.Font.Color := clRed;
        End;

    // Paulo Nobre - SIG 47588 - Inicio
      If cdsMovDARFDisponivel.fieldByname('FLGTIPOINCLUSAO').asString = 'M' Then
        dbgMovDARF.Canvas.Font.Color := clBlue;
    // Paulo Nobre - SIG 47588 - Fim

      dbgMovDARF.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDARF_Novo.deDataIniChange(Sender: TObject);
Begin
  Inherited;
  If deDataIni.text <> '' Then
    deDataFim.Date := TrazUltDiaData(deDataIni.date);
End;

Procedure TfrmGeraDARF_Novo.spbGerarDARFClick(Sender: TObject);
Var CodDocumento: Double;
  sDataIni, sDataFim: String;
  bExecOK: boolean; //Cássio Rovaroto - SIG nº 79711 
Begin
  Inherited;

  bExecOK := False;
  If trim(dedDataVenc.Text) = '' Then
    Begin
      MsgDlg(MSG07, 'Informação', mtInformation, [mbOk], 0);
      pcDados.ActivePageIndex := 1;
      dedDataVenc.SetFocus;
      exit;
    End;

  If Not (DiasUteis.DiaUtil(Sistema.IdEmpresa, dedDataVenc.Date, True, True, False)) Then
    Begin
      MsgDlg(MSG08, 'Informação', mtInformation, [mbOk], 0);
      pcDados.ActivePageIndex := 1;
      dedDataVenc.SetFocus;
      exit;
    End;

  If (dblcNatureza.LookupValue <> '9466') And (dblcNatureza.LookupValue <> '0473') Then
    Begin
      If dedDataVenc.Date <= deDataFim.Date Then
        Begin
          MsgDlg(MSG10, 'Atenção', mtWarning, [mbOK], 0);
          // identifica a próxima data de vencimento do IRRF, baseado no date (o parametro ZERO indica IRRF)
          dedDataVenc.Date := ModuloIRRF.CalcProxDiaSemana(Sistema.IdEmpresa, Date, 3, True, 0);
          dedDataVenc.Text := DateToStr(dedDataVenc.Date);
          dedDataVenc.SetFocus;
          dedDataVenc.SelectAll;
          Exit;
        End;
    End
  Else
    Begin
      If dedDataVenc.Date < deDataIni.Date Then
        Begin
          MsgDlg(MSG11, 'Atenção', mtWarning, [mbOK], 0);
          dedDataVenc.SetFocus;
          dedDataVenc.SelectAll;
          Exit;
        End
    End;

  // -----------------------------------------------------------------------------------------------

  If cdsMovDARFDisponivel.Locate('FLGDARF', 'S', []) Then // Sim
    Begin
      // Filtro para caso haja pelo um 'N', então filtra, caso contrário todos estão marcados
      If cdsMovDARFDisponivel.Locate('FLGDARF', 'N', []) Then // Não
        Begin
          // Filtrando a Grid somente para mostrar e processar os marcados e os não excluidos
          Screen.Cursor := crSQLWait;
          cdsMovDARFDisponivel.Filtered := False;
          cdsMovDARFDisponivel.Filter := 'FLGDARF = ''S'' AND FLGREGEXCLUIDO = ''N'' '; // Sim e Não
          cdsMovDARFDisponivel.Filtered := True;
          dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
          dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
          Screen.Cursor := crDefault;
        End;

      If Application.MessageBox(pchar('Confirma Geração do DARF da Natureza -> ' + dblcNatureza.LookupValue + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            sDataIni := deDataIni.Text;
            sDataFim := deDataFim.Text;

            // Se forem as Natureza do Exterior, então a data inicial e final serão iguais a do Vencimento
            If (dblcNatureza.LookupValue = '9466') Or (dblcNatureza.LookupValue = '0473') Then
              Begin
                sDataIni := dedDataVenc.Text;
                sDataFim := sDataIni;
              End;

            cdsMovDARFDisponivel.AfterScroll := Nil;
            cdsMovDARFDisponivel.DisableControls;
            Screen.Cursor := crSQLWait;
            //Cássio Rovaroto - SIG nº 79711 - Início
            //Cássio Rovaroto - SIG nº 80510 - Início
            //if (dblcNatureza.LookupValue <> '7431') or (dblcNatureza.LookupValue <> '7416') then
            if (dblcNatureza.LookupValue <> '7431') and (dblcNatureza.LookupValue <> '7416') then
            //Cássio Rovaroto - SIG nº 80510 - Fim
              bExecOK := oGerarDARF._Gerar_DARF_Geral(Sistema.IdEmpresa,
                                              Sistema.IdModulo,
                                              Sistema.IdUsuario,
                                              Sistema.IdEspAcesso,
                                              cdsMovDARFDisponivel,
                                              sDataIni,
                                              sDataFim,
                                              dedDataVenc.Text,
                                              memObsCap.Text,
                                              edRef.Text,
                                              DBcboCentroRespon.LookupValue,
                                              dbgMovDARF.ColumnByName('VLRBASE').FooterValue,
                                              dbgMovDARF.ColumnByName('VLRIRRF').FooterValue,
                                              Sistema.UsaPlanoPatro,
                                              CodDocumento)
            else
              bExecOK :=  oGerarDARF._GerarDARF(Sistema.IdEmpresa,
                                                Sistema.IdModulo,
                                                Sistema.IdUsuario,
                                                Sistema.IdEspAcesso,
                                                cdsMovDARFDisponivel,
                                                sDataIni,
                                                sDataFim,
                                                dedDataVenc.Text,
                                                memObsCap.Text,
                                                edRef.Text,
                                                DBcboCentroRespon.LookupValue,
                                                dbgMovDARF.ColumnByName('VLRBASE').FooterValue,
                                                dbgMovDARF.ColumnByName('VLRIRRF').FooterValue,
                                                Sistema.UsaPlanoPatro,
                                                CodDocumento);
            if bExecOK then
            //Cássio Rovaroto - SIG nº 79711 - Fim
            begin
              if dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.Commit;

              cdsMovDARFDisponivel.Filtered := False;
              dbgMovDARF.RefreshDisplay;

              frmAguarde.pbAguarde.Visible := false;
              frmAguarde.Mostra('Atualizando o Movimento...');

              cdsMovDARFDisponivel.Close;
              cdsMovDARFDisponivel.Data := oGerarDARF._SelMovDARF(Sistema.IdEmpresa, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue, '0');
              dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
              dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);

              cdsMovDARFGerado.Data := oGerarDARF._SelMovDARF(Sistema.IdEmpresa, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue, '1');
              tbsMovDARFGerado.Highlighted := (Not cdsMovDARFGerado.isEmpty);
              spbExcluiDARF.Enabled := (Not cdsMovDARFGerado.isempty);
              spbImpDARF.Enabled := (Not cdsMovDARFGerado.isempty);

              dbgDARFGerados.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFGer('VLRBASE', 2);
              dbgDARFGerados.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFGer('VLRIRRF', 2);

              frmAguarde.pbAguarde.Visible := True;
              frmAguarde.Apaga;

              cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
              cdsMovDARFDisponivel.EnableControls;

              MsgDlg('Documento: ' + floattostr(CodDocumento) + ' gerado com Sucesso.' + #13 + #13 +
                     'Verifique detalhes na Aba "Movimento DARF Gerado"', 'Atenção', mtInformation, [mbOk], 0);

              cdsMovDARFDisponivel.First;
              dbgMovDARF.RefreshDisplay;

              Screen.Cursor := crDefault;
              dblcNatureza.SetFocus;
              dblcNatureza.Selected;
              memObsCap.Clear;
              edRef.Clear;
            end
            else
            begin
              if dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.RollBack;

              cdsMovDARFDisponivel.Filtered := False;
              dbgMovDARF.RefreshDisplay;
              cdsMovDARFDisponivel.IndexName := 'ascNomeBeneficiario';

              cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
              cdsMovDARFDisponivel.EnableControls;

              dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
              dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
              Screen.Cursor := crDefault;

              MsgDlg('DARF não gerado : ' + #13 + oGerarDARF.MessageInfo, 'Atenção', mtInformation, [mbOk], 0);
            end;
          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

                cdsMovDARFDisponivel.Filtered := False;
                dbgMovDARF.RefreshDisplay;
                cdsMovDARFDisponivel.IndexName := 'ascNomeBeneficiario';

                cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
                cdsMovDARFDisponivel.EnableControls;

                dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
                dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
                Screen.Cursor := crDefault;

                MsgDlg('DARF não gerado : ' + #13 + oGerarDARF.MessageInfo, Sistema.NomeModulo, mtInformation, [mbOk], 0);
              End;
          End;
        End
      Else
        Begin
          cdsMovDARFDisponivel.Filtered := False;
          dbgMovDARF.RefreshDisplay;
          cdsMovDARFDisponivel.IndexName := 'ascNomeBeneficiario';

          cdsMovDARFDisponivel.AfterScroll := cdsMovDARFDisponivelAfterScroll;
          cdsMovDARFDisponivel.EnableControls;

          dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
          dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
          Screen.Cursor := crDefault;
        End;
    End
  Else
    Begin
      Application.MessageBox(MSG06, 'Atenção !', Mb_IconExclamation);
      cdsMovDARFDisponivel.first;
    End;
End;

Procedure TfrmGeraDARF_Novo.spbExcluiDARFClick(Sender: TObject);
Begin
  Inherited;
  If Application.MessageBox(pchar('Confirma Exclusão do (s) DARF(s) pertecente(s) ' + #13 + #13 +
    'ao Documento Nº :  ' + qryTabDARF.fieldbyname('CODDOCUMENTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
    Begin
      Try
        Screen.Cursor := crSQLWait;
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        //Everson Cunha - SIG71506 - Início
        {
        // Verificando se o documentos foi excluido no Contas a Pagar
        qryAux1.Close;
        qryAux1.SQL.Clear;
        qryAux1.SQL.add('SELECT L.CODDOCUMENTO ');
        qryAux1.SQL.add('FROM LANCTODOCUM L   ');
        qryAux1.SQL.add('WHERE L.CODDOCUMENTO = ' + qryTabDARF.fieldbyname('CODDOCUMENTO').asString);
        //        qryAux1.SQL.add('      AND L.ESTORNO IS NOT NULL '); // Estornado
        //        qryAux1.SQL.add('      AND L.STATUS = 0 '); // Baixado
        qryAux1.Open;
        If qryAux1.EOF Then
          Begin

          // Movimento Financeiro foi excluido no Contas a Pagar
        }
        //Everson Cunha - SIG71506 - Fim

        // Limpa IDDARF(s) da tabela IRRFFOLHABENEF
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('UPDATE IRRFFOLHABENEF I SET I.IDDARF = NULL ');
        qryAux2.SQL.add('WHERE I.IDDARF IN (SELECT IDDARF FROM DARF WHERE CODDOCUMENTO = ' + qryTabDARF.fieldbyname('CODDOCUMENTO').asString + ')');
        qryAux2.ExecSQL;

        // Exclui o DARF selecionado da tabela DARF
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('DELETE FROM DARF WHERE CODDOCUMENTO = ' + qryTabDARF.fieldbyname('CODDOCUMENTO').asString);
        qryAux2.ExecSQL;

        //Everson Cunha - SIG71506 - Início
        // Verificando se o documento foi excluido no Contas a Pagar
        qryAux1.Close;
        qryAux1.SQL.Clear;
        qryAux1.SQL.add('SELECT L.CODDOCUMENTO ');
        qryAux1.SQL.add('FROM LANCTODOCUM L   ');
        qryAux1.SQL.add('WHERE L.CODDOCUMENTO = ' + qryTabDARF.fieldbyname('CODDOCUMENTO').asString);
        qryAux1.Open;

        If not qryAux1.IsEmpty Then
        Begin
          If Not ExcluirDocumentoCAPCAR(qryTabDARF.fieldbyname('CODDOCUMENTO').AsInteger) Then
            Raise Exception.Create('CapCar - ' + FMensagemCtrlDocumento);
        end;
        //Everson Cunha - SIG71506 - Fim

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        Application.ProcessMessages;
        frmAguarde.pbAguarde.Visible := false;
        frmAguarde.Mostra('Atualizando Movimento...');

        cdsMovDARFGerado.DisableControls;
        cdsMovDARFGerado.Close;
        cdsMovDARFGerado.Data := oGerarDARF._SelMovDARF(Sistema.IdEmpresa, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue, '1');
        cdsMovDARFGerado.First;
        cdsMovDARFGerado.EnableControls;
        dbgDARFGerados.RefreshDisplay;
        //Everson Cunha - SIG71506 - Início
        spbExcluiDARF.Enabled := (Not cdsMovDARFGerado.isempty);
        spbImpDARF.Enabled := (Not cdsMovDARFGerado.isempty);
        dbgDARFGerados.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFGer('VLRBASE', 2);
        dbgDARFGerados.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFGer('VLRIRRF', 2);
        //Everson Cunha - SIG71506 - Fim

        qryTabDARF.Close;
        qryTabDARF.Open;

        cdsMovDARFDisponivel.DisableControls;
        cdsMovDARFDisponivel.Close;
        cdsMovDARFDisponivel.Data := oGerarDARF._SelMovDARF(Sistema.IdEmpresa, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue, '0');
        cdsMovDARFDisponivel.EnableControls;
        //Everson Cunha - SIG71506 - Início
        spbGerarDARF.Enabled := (Not cdsMovDARFDisponivel.isempty);
        dbgMovDARF.ColumnByName('VLRBASE').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRBASE', 2);
        dbgMovDARF.ColumnByName('VLRIRRF').FooterValue := _TotalizaColunaGridMovDARFDisp('VLRIRRF', 2);
        //Everson Cunha - SIG71506 - Fim

        frmAguarde.pbAguarde.Visible := True;
        frmAguarde.Apaga;

        Application.MessageBox(Pchar('DARF(s) do Documento: ' + qryTabDARF.fieldbyname('CODDOCUMENTO').asString + 'excluído(s) com Sucesso !'), 'Atenção', Mb_IconExclamation);

      //Everson Cunha - SIG71506 - Início
      {
          End
        Else
          Application.MessageBox(Pchar('Documento :  ' + qryTabDARF.fieldbyname('CODDOCUMENTO').asString + ', não foi Excluído no Contas a Pagar.' + #13 + #13 +
            'Verifique situação do mesmo junto à Área Gestora !'), 'Atenção !', Mb_IconExclamation);
      }
      //Everson Cunha - SIG71506 - Fim

      Except
        On E: Exception Do
        Begin
          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;

          MsgDlg('DARF(s) não Excluído(s) : ' + #13 + E.Message, Sistema.NomeModulo, mtInformation, [mbOk], 0);
        End;
      End;
      dblcNatureza.SetFocus;
      dblcNatureza.Selected;
    End;
End;

Procedure TfrmGeraDARF_Novo.spbSelMovDARFGeradoClick(Sender: TObject);
Begin
  Inherited;
  _SelecionaMovimentos('1'); // DARF gerados
End;

Procedure TfrmGeraDARF_Novo.cdsMovDARFGeradoAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  stQtd2.Caption := Format('%.2d / %.2d', [cdsMovDARFGerado.RecNo, cdsMovDARFGerado.RecordCount]);
End;

Procedure TfrmGeraDARF_Novo.dbgDARFGeradosDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not cdsMovDARFGerado.isEmpty Then
    Begin
      If (field.FieldName = 'IDDARF') Then
        Begin
          dbgDARFGerados.Canvas.Font.Color := clBlue;
          dbgDARFGerados.Canvas.Font.Style := [fsbold];
          dbgDARFGerados.Canvas.Font.Size := 10;
        End;

      If (field.FieldName = 'CODDOCUMENTO') Then
        Begin
          dbgDARFGerados.Canvas.Font.Color := clMaroon;
          dbgDARFGerados.Canvas.Font.Style := [fsbold];
        End;

      If (field.FieldName = 'CODNATUREZA') Then
        dbgDARFGerados.Canvas.Font.Style := [fsbold];

      dbgDARFGerados.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDARF_Novo.spbImpDARFClick(Sender: TObject);
Var sSQL: String;
Begin
  Inherited;
  If Not cdsMovDARFGerado.isEmpty Then
    Begin
      If ((qryTabDARF.fieldbyname('CODNATUREZA').AsString <> '7416') And (qryTabDARF.fieldbyname('CODNATUREZA').AsString <> '7431')) Then
        Begin
          TfrmPreview.CreateModalPreview(Application, rpDarfNormal, rpDarfNormal.PrinterSetup.DocumentName);
        End
      Else
        Begin
          If CmpDadosImp.Execute Then
            Begin
              sSQL :=
                // Andre Imakawa - SIG 79284 - Inicio
                'SELECT '  + #13 +
                '  ROWNUM AS LINHA, ' + #13 +    //edilaine - SIG69631
                '  TB_DARF.IDDARF, ' + #13 +
                '  TB_DARF.AGENCIA, ' + #13 +
                '  TB_DARF.MASCARAAGENCIA, ' + #13 +
                '  TB_DARF.CONTACORRENTE, ' + #13 +
                '  TB_DARF.MASCARACC, ' + #13 +
                '  TB_DARF.CONTRIBUINTE, TB_DARF.SESSAO, TB_DARF.CODVARA, ' + #13 +
                '  TB_DARF.ACAO_CLASSE, TB_DARF.AUTORACAO, ' + #13 +
                '  TB_DARF.REU, ' + #13 +
                '  TB_DARF.VLRBASECALCULO, TB_DARF.PERCIRRF, TB_DARF.DATAFINALAPURACAO, ' + #13 +
                '  TB_DARF.NUMDOCUMENTO, ' + #13 +
                '  TB_DARF.MATRICULA, TB_DARF.CODNATUREZA, TB_DARF.NUMEROPROCESSO, TB_DARF.DATAVENCDARF, ' + #13 +     // Andre Imakawa - SIG 76324
                '  TB_DARF.VLRIRRF, TB_DARF.VLRMULTA, ' + #13 +
                '  TB_DARF.VLRJUROS, TB_DARF.VLRTOTAL, TB_DARF.CODDOCUMENTO ' + #13 +
                ' ,TB_DARF.CODIGO_DARF_CAIXA                                ' + #13 + //Everson Cunha - SIG89748
                ' FROM ' + #13 +
                '(SELECT ' + #13 +
                //'  ROWNUM AS LINHA, ' + #13 +    //edilaine - SIG69631
                // Andre Imakawa - SIG 79284 - Fim
                '  D.IDDARF, ' + #13 +
                '  LTRIM(RTRIM(A.NUMAGENCIA)) AS AGENCIA, ' + #13 +
                '  B.MASCARAAGENCIA, ' + #13 +
                '  LTRIM(RTRIM(C.CONTACORRENTE)) AS CONTACORRENTE, ' + #13 +
                '  B.MASCARACC, ' + #13 +
                '  PE.NOME AS CONTRIBUINTE, (P.UFSECAO) AS SESSAO, P.CODVARA, ' + #13 +
                '  NVL(P.CLASSEACAO, ''02.100'') AS ACAO_CLASSE, P.AUTORACAO, ' + #13 +
                '  ''UNIÃO FEDERAL/DELEGACIA DA RECEITA'' AS REU, ' + #13 +
                '  D.VLRBASECALCULO, NVL(D.PERCIRRF, 0) AS PERCIRRF, D.DATAFINALAPURACAO, ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 1, 3) || ''.'' || ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 4, 3) || ''.'' || ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 7, 3) || ''-'' || ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 10, 2) AS NUMDOCUMENTO, ' + #13 +
                '  E.MATRICULA, D.CODNATUREZA, P.NUMEROPROCESSO, D.DATAVENCDARF, ' + #13 +     // Andre Imakawa - SIG 76324
                //edilaine - SIG69594 - inicio
                //'  NVL(D.VLRIRRF, 0) AS VLRIRRF, NVL(D.VLRMULTA, 0) AS VLRMULTA, ' + #13 +
                //'  NVL(D.VLRJUROS, 0) AS VLRJUROS, NVL(D.VLRTOTAL, 0) AS VLRTOTAL, T.NUMERO AS TELEFONE, I.CODDOCUMENTO ' + #13 +
                '  SUM(NVL(I.VLRIMPOSTO, 0)) AS VLRIRRF, NVL(D.VLRMULTA, 0) AS VLRMULTA, ' + #13 +
                '  NVL(D.VLRJUROS, 0) AS VLRJUROS, SUM(NVL(I.VLRIMPOSTO, 0)) AS VLRTOTAL, /*T.NUMERO AS TELEFONE,*/ I.CODDOCUMENTO ' + #13 +  //edilaine - SIG69631
                //edilaine - SIG69594 - fim
                ' ,I.CODIGO_DARF_CAIXA                                                                                             ' + #13 +  //Everson Cunha - SIG89748
                'FROM                    ' + #13 +
                '  BANCO            B,   ' + #13 +
                '  AGENCIABANCARIA  A,   ' + #13 +
                '  CONTABANCARIA    C,   ' + #13 +
                '  PROCJUD          P,   ' + #13 +
                '  PESSOA           PE,  ' + #13 +
                '  DARF             D,   ' + #13 +
                '  IRRFFOLHABENEF   I,   ' + #13 +
                '  NATURENDIMENTO   N,   ' + #13 +
                //'  TELENDPESS       T,   ' + #13 +      //edilaine - SIG69631
                //'  DEPENTIT         DT  ' + #13 +         // Andre Imakawa - SIG 71547    // Andre Imakawa - SIG 76324
                '  ELEGPATRO        E   ' + #13 +           // Andre Imakawa - SIG 71547    // Andre Imakawa - SIG 76324
                //edilaine - SIG69631 - inicio
                {'  ( ' + #13 +
                '  SELECT ' + #13 +
                '    MAX(T.IDTELEFONE) AS IDTELEFONE ' + #13 +
                '  FROM ' + #13 +
                '    PESSOA     P, ' + #13 +
                '    TELENDPESS T  ' + #13 +
                '  WHERE ' + #13 +
                '        (P.IDPESSOA        = ' + FloatTostr(Sistema.IdEmpresa) + ') ' + #13 +
                '    AND (P.IDENDCOMERCIAL  = T.IDENDERECO) ' + #13 +
                '    AND (T.TIPO            LIKE ''%C%'' ) ' + #13 +
                '  ) TM ' + #13 + }
                //edilaine - SIG69631 - fim
                'WHERE ' + #13 +
                '      (D.IDPESSOA      = ' + FloatTostr(Sistema.IdEmpresa) + ') ' + #13;

              If CmpDadosImp.ParamValues[0].AsInteger = 1 Then
                Begin
                  sSQL := sSQL + ' AND ( ' + #13 +
                    '      (E.IDPESSOA     = ' + QuotedStr(trim(cdsMovDARFGerado.fieldbyname('IDPESSOA').AsString)) + ') AND' + #13 + // Andre Imakawa - SIG 71547 // Andre Imakawa - SIG 76324
                    '      (I.IDLANCIRRFFOLHABENEF    = ' + QuotedStr(trim(cdsMovDARFGerado.fieldbyname('IDLANCIRRFFOLHABENEF').AsString)) + ') ' + #13 +          // Andre Imakawa - SIG 76324
                   // '      (DT.IDPESSOA    = ' + QuotedStr(trim(cdsMovDARFGerado.fieldbyname('IDPESSOA').AsString)) + ') ' + #13 +                               // Andre Imakawa - SIG 76324
                    '      ) ' + #13;
                End;

               //Cássio Rovaroto - SIG nº 70052 - Início
              if CmpDadosImp.ParamValues[1].AsInteger <> 0 then
                sSQL := sSQL + '    AND (D.CODDOCUMENTO = ' + IntToStr(CmpDadosImp.ParamValues[1].AsInteger) + ')' + #13;

              if CmpDadosImp.ParamValues[2].AsString <> '' then
                sSQL := sSQL + '    AND (D.DATAVENCDARF = TO_DATE(' + QuotedStr(CmpDadosImp.ParamValues[2].AsString) + ', ''DD/MM/YYYY''))' + #13;
              //Cássio Rovaroto - SIG nº 70052 - Fim

              sSQL := sSQL + '  AND (D.DATAEMISDARF >= TO_DATE(''' + trim(qryTabDARF.fieldbyname('DATAINIAPURACAO').AsString) + ''',''DD/MM/YYYY'')) ' + #13 +
                '  AND (D.DATAEMISDARF <= TO_DATE(''' + trim(qryTabDARF.fieldbyname('DATAFINALAPURACAO').AsString) + ''',''DD/MM/YYYY'')) ' + #13 +
                '  AND (D.CODNATUREZA   = ''' + qryTabDARF.fieldbyname('CODNATUREZA').AsString + ''') ' + #13;

              sSQL := sSQL +
                //'  AND (D.VLRIRRF           > 0) ' + #13 +     // Andre Imakawa - SIG 76324
                '  AND (D.VLRIRRF           <> 0) ' + #13 +      // Andre Imakawa - SIG 76324
                '  AND (D.CODNATUREZA       = N.CODNATUREZA) ' + #13 +
                '  AND (N.FLGDEPOSITOJUDIC  = ''S'') ' + #13 +
                '  AND (D.IDDARF            = I.IDDARF) ' + #13 +
                '  AND (I.IDPROCJUD         = P.IDPROCJUD) ' + #13 +
                '  AND (E.IDPESSOA(+)       = I.IDPESSOA) ' + #13 +  // Andre Imakawa - SIG 71547 // Andre Imakawa - SIG 76324
                '  AND (E.IDPESSJUR(+)      = I.IDPATRO) ' + #13 +   // Andre Imakawa - SIG 76324
                //'  AND (DT.IDPESSOA(+)      = P.IDPESSOA) ' + #13 +

                // Andre Imakawa - SIG 76324 - Inicio
                {
                // Andre Imakawa - SIG 71547 - Inicio
                '  AND (DT.IDTITULAR IN (SELECT H.IDTITULAR   ' + #13 +
                '                         FROM HISTRUBSAL H  ' + #13 +
                '                        WHERE H.IDPESSOA = I.IDPESSOA   ' + #13 +
                '                          AND H.IDPATRO = I.IDPATRO     ' + #13 +
                '                          AND H.IDPLANOCONTABIL = I.IDPLANOPREV   ' + #13 +
                '                          AND H.IDHSTFOLHABENEF = I.IDHSTFOLHABENEF  ' + #13 +
                '                          AND H.CODPROVDESC = I.CODPROVDESC     ' + #13 +
                '                          AND H.VALORPROVENTO = I.VLRIMPOSTO)) ' + #13 +
                // Andre Imakawa - SIG 71547 - Fim
                }
                // Andre Imakawa - SIG 76324 - Fim

                '  AND (P.IDPESSOA          = PE.IDPESSOA) ' + #13 +
                '  AND P.IDAGENCIABANCARIA  = A.IDPESSOA(+) ' + #13 +
                '  AND P.IDBANCO            = A.IDBANCO(+) ' + #13 +
                '  AND A.IDBANCO            = B.IDPESSOA(+) ' + #13 +

                //edilaine - SIG69631 - inicio
                '  AND (P.IDPESSOA          = C.IDPESSOA)  ' + #13 +
                '  AND SUBSTR(C.CONTACORRENTE,1,3) = ''635''  ' + #13 +
                //'  AND E.MATRICULA IS NOT NULL  ' + #13 +                // Andre Imakawa - SIG 76324
                //edilaine - SIG69631 - fim

                '  AND (P.IDCBANCARIA       IS NULL OR P.IDCBANCARIA = C.IDCBANCARIA) ' + #13 +
                '  AND (P.SITPROCESSO       = 0) ' + #13 +
                //'  AND (PE.IDENDCOMERCIAL   = T.IDENDERECO(+)) ' + #13 +        //edilaine - SIG69631
                //'  AND (T.IDTELEFONE        = TM.IDTELEFONE(+)) ' + #13 +       //edilaine - SIG69631
                // Andre Imakawa - SIG 79284 - Inicio
                ' GROUP BY ' + #13 +
                '  D.IDDARF, ' + #13 +
                '  LTRIM(RTRIM(A.NUMAGENCIA)), ' + #13 +
                '  B.MASCARAAGENCIA, ' + #13 +
                '  LTRIM(RTRIM(C.CONTACORRENTE)), ' + #13 +
                '  B.MASCARACC, ' + #13 +
                '  PE.NOME, (P.UFSECAO), P.CODVARA, ' + #13 +
                '  NVL(P.CLASSEACAO, ''02.100''), P.AUTORACAO, ' + #13 +
                '  ''UNIÃO FEDERAL/DELEGACIA DA RECEITA'', ' + #13 +
                '  D.VLRBASECALCULO, NVL(D.PERCIRRF, 0), D.DATAFINALAPURACAO, ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 1, 3) || ''.'' || ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 4, 3) || ''.'' || ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 7, 3) || ''-'' || ' + #13 +
                '  SUBSTR(PE.NUMDOCUMENTO, 10, 2), ' + #13 +
                '  E.MATRICULA, D.CODNATUREZA, P.NUMEROPROCESSO, D.DATAVENCDARF, ' + #13 +
                '  NVL(D.VLRMULTA, 0), ' + #13 +
                '  NVL(D.VLRJUROS, 0), I.CODDOCUMENTO ' + #13 +  //edilaine - SIG69631
                ' ,I.CODIGO_DARF_CAIXA                ' + #13 +  //Everson Cunha - SIG89748
                ' ) TB_DARF ' + #13 +
                'ORDER BY ' + #13 +
                //'  P.AUTORACAO, CONTRIBUINTE ';
                '  TB_DARF.AUTORACAO, TB_DARF.CONTRIBUINTE ';
                // Andre Imakawa - SIG 79284 - Fim
              With sqlDARFJur Do
                Begin
                  SQL.Clear;
                  SQL.Text := sSQL;
                  Prepare;
                  Open;
                End;
              // -------------------------------------------------------------------------------------------------

              TfrmPreview.CreateModalPreview(Application, rpDarfJur, rpDarfJur.PrinterSetup.DocumentName);

            End;
        End;
    End;
End;

Function TfrmGeraDARF_Novo._Formatar(Origem, Formato: String): String;
Var I, W: Integer;
Begin
  If (Origem <> '') And (Formato <> '') Then
    Begin
      W := 1;
      Result := '';

      If Origem = '' Then
        Exit;

      For I := 1 To Length(Formato) Do
        Begin
          If Origem[W] = '' Then
            Break;

          If Pos(Formato[I], '.-/') > 0 Then
            Begin
              Result := Result + Formato[I];
              Continue;
            End
          Else
            Result := Result + Origem[W];
          Inc(W)
        End;
    End
  Else
    Result := Origem;
End;

Procedure TfrmGeraDARF_Novo.ppLabel129Print(Sender: TObject);
Var sAgencia, sConta: String;
Begin
  Inherited;
  sAgencia := _Formatar(cdsDarfJur.FieldByName('AGENCIA').AsString, cdsDarfJur.FieldByName('MASCARAAGENCIA').AsString);
  sConta := _Formatar(cdsDarfJur.FieldByName('CONTACORRENTE').AsString, cdsDarfJur.FieldByName('MASCARACC').AsString);
  ppLabel129.Text := sAgencia + ' / ' + sConta;
  ppLabel130.Text := sAgencia + ' / ' + sConta;
End;

Procedure TfrmGeraDARF_Novo.pcMovimentoDARFChange(Sender: TObject);
Begin
  Inherited;
  dedDataVenc.Enabled := ((pcMovimentoDARF.ActivePage = tbsMovDARFDisponivel) And (Not cdsMovDARFDisponivel.isempty));
End;

function TfrmGeraDARF_Novo.ExcluirDocumentoCAPCAR(
  const iDocumento: Integer): Boolean;
Var
  CtrlDocumento: TCtrlDocumento;
Begin
  Result := True;
  FMensagemCtrlDocumento := '';
  If iDocumento > 0 Then
  Begin
    CtrlDocumento := TCtrlDocumento.Create;
    CtrlDocumento.InitializeAs(Padroes);
    Try
      CtrlDocumento.OpenTransaction := False;
      CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
      CtrlDocumento.CodDocumento := iDocumento;

      CtrlDocumento.IdUsuario := Sistema.idUsuario;
      CtrlDocumento.IdEspAcesso := Sistema.idEspAcesso;
      CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
      CtrlDocumento.IdModulo := Sistema.idModulo;

      result := CtrlDocumento.Delete;

    Finally
      FMensagemCtrlDocumento := CtrlDocumento.MessageInfo;
      FreeAndNil(CtrlDocumento);
    End;
  End;
End;

End.

