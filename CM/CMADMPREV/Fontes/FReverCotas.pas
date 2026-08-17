// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
{
{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Alteração   : ppReport1BeforePrint          
WO          : WO23998
Responsável : Paulo Nobre
Data        : 04/08/2025
Descrição   : Voltar a mostrar o nome da Pessoa, para ser apresentado na
              assinatura do relatório.
--------------------------------------------------------------------------------
Alteração  : ppDetailBand3BeforePrint
Nº SIG.....: SIG136241
Data.......: 29/05/2023
Responsável: Edilaine
Descrição..: Reversao esta trazendo contribuiçoes e acoes jud. indevidas
-------------------------------------------------------------------------------
Alteração  : Proc essaReversao
Nº SIG.....: SIG135320
Data.......: 02/05/2023
Responsável: Edilaine
Descrição..: Reversao esta trazendo beneficios diferentes no demonstrativo
-------------------------------------------------------------------------------
Alteração  : (dfm grid) ProcessaReversao
Nº SIG.....: SIG134915
Data.......: 25/04/2023
Responsável: Edilaine
Descrição..: Reversao esta considerando beneficios diferentes
-------------------------------------------------------------------------------
Alteração  : (dfm) rptDemonstrativo, qryAcJudDeficit, ppAcJudDeficit, ppDetailBand3BeforePrint
Nº SIG.....: SIG50850
Data.......: 12/09/2019
Responsável: Edilaine
Descrição..: Inclusão das Informações da Ação Judicial
-------------------------------------------------------------------------------
Alteração  : AtualizarProcessoBenef, ProcessaReversao
Nº SIG.....: 68319
Data.......: 09/05/2018
Responsável: Denis Horongoso
Descrição..: Encerrar a situação do processo quando a situação do benefício for encerrada
-------------------------------------------------------------------------------
Alteração dfm: ppReport1
Alteração....: ProcessaReversao, AjustaAbonoPago
Nº SIG.......: 33727
Data.........: 25/07/2017
Responsável..: edilaine
Descrição....: Verificação se já foi pago abono no ano do processamento,
               se sim, lançar valor negativo no histórico de pagamento
-------------------------------------------------------------------------------
Alteração  : (.dfm qryRelatorio, ppReport1) GravarHSTBENEFBFCIARIO, gera_impressao_requerimento
Nº SIG.....: 55933
Data.......: 11/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
--------------------------------------------------------------------------------
Alteração  : qryDemoContrib -  DFM
Nº SIG.....: 60031
Data.......: 13/12/2017
Responsável: Andre Imakawa
Descrição..: Acerto na query do objeto qryDemoContrib.
             Removido (BT.IDRESPONSAVEL = H.IDPESSOA) e inserido
             (BT.IDPESSOA = H.IDPESSOA)
-------------------------------------------------------------------------------
Alteração  : ProcessaReversao, DFM
Nº SIG.....: 51180
Data.......: 25/07/2017
Responsável: Andre Imakawa
Descrição..: GravaHstPercGrupo deve ser executado no final do processo e apenas,
             uma unica vez para cada registro do grid. DFM Add:  DATAFINAL1 e
             DATAENCERRAMENTO1.
-------------------------------------------------------------------------------
Alteração  : ProcessaReversao
Nº SIG.....: 50047
Data.......: 14/07/2017
Responsável: Andre Imakawa
Descrição..: Apenas alterar tabela HSTPERCGRUPO quando IdTpPagtoBenefic = 1
-------------------------------------------------------------------------------
Nº SIG.....: 49063
Data.......: 28/06/2017
Responsável: Peterson Victor
Descrição..: alterado o parametro da data passado na chamada da GravaHstPercGrupo
--------------------------------------------------------------------------------
Alteração  : (.dfm ppReport1) qryDemoContrib, qryRelatorio
Nº SIG.....: 48583
Data.......: 14/06/2017
Responsável: Edilaine
Descrição..: No demostrativo não traz todas as contribuições
--------------------------------------------------------------------------------
Alteração  : VerificaMorte
Nº SIG.....: 43619
Data.......: 20/04/2017
Responsável: William Moreira da Silva
Descrição..: Não esta gerando o demostrativo na reversão de cotas
-------------------------------------------------------------------------------
Alteração  : (dfm) ppReport1, gera_impressao_requerimento, ProcessaReversao,
             GravarHSTBENEFBFCIARIO, ppDetailBand3BeforePrint
Nº SIG.....: 45005/45579
Data.......: 05/05/2017
Responsável: Andre Imakawa
Descrição..: Quando abono sistema deve lançar nos campo VALORCALCULADO,
             VALORTOTAL e VALORINTEGRAL  o valor referente ao calculado na
             regra de abono.
             Alterado qryrelatorio add campo VALORABONO13
-------------------------------------------------------------------------------
Alteração  : (dfm) ppReport1               
Nº SIG.....: 32303
Data.......: 31/10/2016
Responsável: Edilaine Ferraresi
Descrição..: Equacionamento - separação das contribuições em grupo
-------------------------------------------------------------------------------
Alteração..: sbtnProcurarClick
Nº SIG.....: 32875
Data.......: 03/11/2016
Responsável: André Imakawa
Descrição..: Verificar a data do bloqueio com a data atual.
-------------------------------------------------------------------------------
Alteração..: Reverter
Nº SIG.....: 32517
Data.......: 31/10/2016
Responsável: André Imakawa
Descrição..: Verificar o beneficio que está sendo revertido.
-------------------------------------------------------------------------------
Alteração..: Reverter
Nº SIG.....: 29326
Data.......: 16/09/2016
Responsável: Peterson Victor
Descrição..: Impossibilitar a reversão quando já existir preparo para aquele mês
-------------------------------------------------------------------------------
Alteração..: Reverter
Nº SIG.....: 25183
Data.......: 16/08/2016
Responsável: William Moreira da Silva
Descrição..: Impossibilitar a reversão quando já existir preparo para aquele mês
-------------------------------------------------------------------------------
Alteração..: GravarHSTBENEFBFCIARIO
Nº SIG.....: 24446
Data.......: 27/07/2016
Responsável: William Moreira da Silva
Descrição..: Ao fazer  a reversão o estado no historico de beneficio ficava incorreto
-------------------------------------------------------------------------------
Alteração..: gera_impressao_requerimento
Nº SIG.....: 20490
Data.......: 11/05/2016
Responsável: William Santana
Descrição..: demonstrativo de reversão mostrava só um dependente
-------------------------------------------------------------------------------
Alteração..: QryGrid
Nº SIG.....: 19776
Data.......: 02/05/2016
Responsável: William Santana
Descrição..: Reverter cota por Falecimento não está buscando os pensionistas
-------------------------------------------------------------------------------
Alteração  : (.dfm) ppDetailBand3BeforePrint, ppDetailBand3BeforePrint
Nº SOL.....: 253577-18151
KTN / PPM  : 1318910
Data       : 28/03/2016
Responsável: Edilaine
Descrição..: Ajustes para que devolução de contribuições não saiam zeradas
{-------------------------------------------------------------------------------
Alteração  : GravarHSTBENEFBFCIARIO
Nº SOL.....: 253577-18184
KTN / PPM  : 1331102
Data       : 19/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - reversão de cotas
-------------------------------------------------------------------------------}
//Pendência   : SOL 253577-18070  PPM 1240812
//Responsável : Edilaine Ferraresi
//Data        : 14/01/2106
//Altercao    : ExecutaSP_PreparoContribuicao (passar o TipoMov)
//------------------------------------------------------------------------------
// Autor(a)    : Helio Lima Custódio
// Data        : 21/10/2015
// SOL         : SOL 253577/17666 PPM 1019935
// DFM         : Ajustes em ppReport1
// Descricao   : Ajustes para o equacionamento, inclusão de BS, FAB, e Base de
//               Cálculo do Déficit na rotina.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 25/07/2014
// SOL         : SOL 236004 PPM 461575
// Descricao   : Os produtos enviados para a homologação das demandas 234481 e
//               233734 estavam corretos na homologação.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 10/07/2014
// SOL         : SOL 233734 PPM 433623
// Descricao   : Ajustar o demonstrativo de reversão de cotas, pois o mesmo esta
//               apresentando erros.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 10/07/2014
// SOL         : SOL 234481 PPM 433635
// Descricao   : Ajustar o demonstrativo de reversão de cotas, pois o mesmo esta
//               apresentando erros.
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo/Xavier
// Data        : 16/04/2014
// SOL         : SOL 229888 PPM 349946
// Descricao   : Falha ao reverter cotas.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 17/04/2014
// SOL         : SOL 230386 KTN 352517
// Descricao   : Erro ao apertar no botão Procurar na funcionalidade Reversão de Cotas
//------------------------------------------------------------------------------
// Autor(a)    : Marcio Sanches Spinosa SOL 229678 KTN 346409
// Data        : 09/04/2014
// SOL         : SOL 229678 KTN 346409
// Descricao   : Verificação do valor da diferença lançado para mes 13
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 25/03/2014
// SOL         : SOL 222734 KTN 2062476
// Descricao   : Ajustar a rotinda de calculo de dias do mes
//------------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 21/02/2014
// SOL         : 222734/15797 KTN: 2060843
// Descricao   : Foi mudado o caminho da gravação do demonstrativo e corrigido o
//               dia inicio da rotina GetValorMes quando o dia é 31
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 24/11/2013
// SOL         : 221188  KTN: 2053714
// Descricao   : as informações ficam brancas quando posicionado o mause sobre elas,
//               não sendo possivel sua visualização.
//------------------------------------------------------------------------------
// Autor(a)    : William Moreira da Silva
// Data        : 16/07/2013
// SOL   : 212299  KTN: 2045727
// Descricao   : Erros Implantação Reversão de Cotas
//------------------------------------------------------------------------------
// Autor(a)    : Douglas.Siqueira
// Data        : 16/07/2013
// SOL   : 176272  KTN:
// Descricao   : Reversão de Cotas.
//------------------------------------------------------------------------------

unit FReverCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdbedit, Wwdotdot, Wwdbcomb, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, QExport3, QExport3PDF,
  QuickRpt, Qrctrls, ppPrnabl, ppClass, ppStrtch, ppRichTx, ppDB, ppDBPipe,
  ppDBBDE, ppParameter, ppModule, raCodMod, ppBands, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, CmParamReport, uCmRptManager, TXComp, TXRB,
  ppCtrls, ppMemo, daDataModule,FileCtrl, jpeg,ComObj, QExport3Dialog,
  ppVar, ppSubRpt;

type
  TFrmReverCotas = class(TfrmCadMestreDetalheCS)
    ToolbarButton971: TToolbarButton97;
    sbtnRequerer: TToolbarButton97;
    bbtnOpcoes: TBitBtn;
    pnl_impressao: TPanel;
    bt_imprimir: TButton;
    updDet: TUpdateSQL;
    IdHTTP1: TIdHTTP;
    pnl1: TPanel;
    grid_log: TwwDBGrid;
    SpeedButton1: TSpeedButton;

    lbl_listados: TLabel;
    DevRptCM: TExtraOptions;
    CrmRptCM: TCmRptManager;
    CmpRptCM: TCmParamReport;
    rpReversaoCotas: TppReport;
    ppParameterList1: TppParameterList;
    ppReversaoCotas: TppBDEPipeline;
    dsReversaoCotas: TwwDataSource;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    rd_filtro: TRadioGroup;
    CheckBox1: TCheckBox;
    Ck_commit: TCheckBox;
    ME_anomes: TMaskEdit;
    cb_demo: TCheckBox;
    Ch_relme: TCheckBox;
    QryAux: TwwQuery;
    qryDet: TwwQuery;
    qryDetSELECIONADO: TStringField;
    qryDetMATRCULADOBENEFICIRIO: TStringField;
    qryDetMATRCULA: TStringField;
    qryDetTITULAR: TStringField;
    qryDetTIPODEBENEFCIO: TStringField;
    qryDetIDBENEFICIO: TFloatField;
    qryDetBENEFICIRIO: TStringField;
    qryDetDATAFALECIMENTO: TDateTimeField;
    qryDetVALORATUAL: TFloatField;
    qryDetVALORTOTAL: TFloatField;
    qryDetDATAENCERRAMENTO: TDateTimeField;
    qryDetNUMEROPROCESSO: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDPLANOORIGEM: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetFONTEPAGADORA: TFloatField;
    qryDetVALORBASE1: TFloatField;
    qryDetVALORBASE2: TFloatField;
    qryDetVALORBASE3: TFloatField;
    qryDetDATAINICIOFUND: TDateTimeField;
    qryDetIDPLANOPREV: TFloatField;
    bbtnSelTudo: TBitBtn;
    bbtnInverte: TBitBtn;
    UpdateRel: TUpdateSQL;
    rpReversaoCotasMensal: TppReport;
    ppReversaoCotasMensal: TppBDEPipeline;
    qrydsReversaoCotasMensal: TwwQuery;
    dsReversaoCotasMensal: TwwDataSource;
    UpdateRELMEN: TUpdateSQL;
    qrydsReversaoCotasMensalMATRCULA: TStringField;
    qrydsReversaoCotasMensalNOME: TStringField;
    qrydsReversaoCotasMensalMATRCULADOBENEFICIRIO: TStringField;
    qrydsReversaoCotasMensalNOME2: TStringField;
    qrydsReversaoCotasMensalDATAFINAL: TDateTimeField;
    qrydsReversaoCotasMensalPERCENTUALANTERIOR: TFloatField;
    qrydsReversaoCotasMensalPERCENTUALATUAL: TFloatField;
    qrydsReversaoCotasMensalVALORTOTAL: TFloatField;
    qrydsReversaoCotasMensalVALORATUAL: TFloatField;
    qrydsReversaoCotasMensalNOMEBENEFICIO: TStringField;
    qrydsReversaoCotasMensalSITUACAO: TStringField;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppShape9: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppDBText1: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel37: TppLabel;
    lbl_tot_tit: TppLabel;
    ppLabel38: TppLabel;
    lbl_tot_pens: TppLabel;
    ppLabel39: TppLabel;
    lbl_mesano2: TppLabel;
    qryRelatorioAUX: TwwQuery;
    UpdateRelAux: TUpdateSQL;
    qryDetDATAINICIO: TDateField;
    qryDetPERCENTUALATUAL: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    ppLine2: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLine3: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine4: TppLine;
    lbl_mesabono: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    lbl_vl_pg_abono: TppLabel;
    ppLabel9: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    lbl_mes: TppLabel;
    lbl_mesCont_abono: TppLabel;
    lbl_mesCont: TppLabel;
    lbl_vl_pg_Cont: TppLabel;
    lbl_vl_pg_Cont_abo: TppLabel;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppTitleBand1: TppTitleBand;
    ppLabel40: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    lbl_tecnico: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    lbl_mesano: TppLabel;
    lbl_inicioprocess: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    lbl_mattit: TppLabel;
    lbl_nm_tit: TppLabel;
    ppReport1: TppReport;
    ppBDEPipeline1: TppBDEPipeline;
    qryDetPBTT: TFloatField;
    qryDetPT1: TFloatField;
    dsDetalhe: TwwDataSource;
    qryDetalhe: TwwQuery;
    UpdDetalhe: TUpdateSQL;
    qryDetalheIDTITULAR: TFloatField;
    qryDetalheBENEFICIO: TFloatField;
    qryDetalheFONTEPAGADORA: TFloatField;
    QExport3Dialog1: TQExport3Dialog;
    ppParameterList2: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppLabel68: TppLabel;
    ppImage2: TppImage;
    ppLabel41: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel56: TppLabel;
    ppLine13: TppLine;
    ppDetailBand3: TppDetailBand;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppShpQuadro: TppShape;
    ppLine7: TppLine;
    ppRellblMes: TppLabel;
    ppRellblPercAnt: TppLabel;
    ppRellblPercAtual: TppLabel;
    ppRellblValorTotal: TppLabel;
    ppRellblVlrAtualAnt: TppLabel;
    ppRellblValorAtualDep: TppLabel;
    ppRellblVlrPgMes: TppLabel;
    ppRelLinhaMesD: TppShape;
    ppRelLinhaPercAntD: TppShape;
    ppRelLinhaPercAtualD: TppShape;
    ppRelLinhaValorTotalD: TppShape;
    ppRelLinhaVlrAtualAntD: TppShape;
    ppRelLinhaValorAtualDepD: TppShape;
    ppLine8: TppLine;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLine9: TppLine;
    lbl_mes_abono2: TppLabel;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    lbl_vl_pg_abono2: TppLabel;
    lbl_mes2: TppLabel;
    lbl_vl_atual_antec2: TppLabel;
    ppLabel60: TppLabel;
    ppDBText27: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLine14: TppLine;
    lbl_usuario: TppLabel;
    lblNomUsuario: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    lbl_mattit2: TppLabel;
    lbl_nm_tit2: TppLabel;
    ppLabel59: TppLabel;
    lbl_data_falecimento_tit2: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    ppLabel65: TppLabel;
    ppDBText28: TppDBText;
    ppLabel67: TppLabel;
    ppDBText43: TppDBText;
    ppLabel70: TppLabel;
    ppLabel73: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel74: TppLabel;
    ppDBText47: TppDBText;
    ppLblValorTotal: TppLabel;
    ppLblValorAtual: TppLabel;
    ppTxtValorTotal: TppDBText;
    ppTxtValorAtual: TppDBText;
    ppRellblVlrBS: TppLabel;
    ppRellblVlrFAB: TppLabel;
    ppRelLinhaVlrBS: TppShape;
    ppRelLinhaVlrFAB: TppShape;
    lbl_vl_valorbs: TppDBText;
    lbl_vl_valorfab: TppDBText;
    ppRellblBaseCalc: TppLabel;
    ppRelLinhaVlrPgMes: TppShape;
    lbl_vl_valordeficit: TppDBText;
    ppLblBaseCalcD: TppLabel;
    ppTxtBaseCalcD: TppDBText;
    ppLblBSTotal: TppLabel;
    ppTxtBSTotal: TppDBText;
    ppLblBSAtual: TppLabel;
    ppTxtBSAtual: TppDBText;
    ppLblFABTotal: TppLabel;
    ppTxtFABTotal: TppDBText;
    ppLblFABATual: TppLabel;
    ppTxtFabAtual: TppDBText;
    ppLabel44: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    lbl_vl_valorbs_abono: TppDBText;
    lbl_vl_valorfab_abono: TppDBText;
    lbl_vl_valordeficit_abono: TppDBText;
    ppLabel45: TppLabel;
    ppSubRepAbTot: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppSubRepTotal: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    lbl_tot_benef2: TppLabel;
    lbl_tot_contri2: TppLabel;
    lbl_total2: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    lbl_n_tot_contriExtr: TppLabel;
    lbl_tot_contriExtr: TppLabel;
    ppShape8: TppShape;
    ppLabel13: TppLabel;
    ppLabel21: TppLabel;
    lbl_tot_benef: TppLabel;
    lbl_tot_contri: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    lbl_total: TppLabel;
    ppContribuicao: TppBDEPipeline;
    ppContribuicaoppField2: TppField;
    ppContribuicaoppField3: TppField;
    ppContribuicaoppField4: TppField;
    ppContribuicaoppField5: TppField;
    ppContribuicaoppField6: TppField;
    ppContribuicaoppField7: TppField;
    ppContribuicaoppField8: TppField;
    ppContribuicaoppField9: TppField;
    dsDemoContrib: TDataSource;
    qryDemoContrib: TwwQuery;
    ppSubRepContrib1: TppSubReport;
    ppChildReport5: TppChildReport;
    ppShape24: TppShape;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppShape23: TppShape;
    ppLabel47: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppDBText29: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    qryDetDATAFINAL1: TDateTimeField;
    qryDetDATAENCERRAMENTO1: TDateTimeField; // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
    ppLabel46: TppLabel;
    ppDBText48: TppDBText;
    qryRelatorio: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    StringField8: TStringField;
    lbl_mesabono3: TppLabel;
    lbl_vl_perc_ant_abono3: TppDBText;
    lbl_vl_perc_atu_abono3: TppDBText;
    lbl_vl_total_abono3: TppDBText;
    lbl_vl_bs_abono3: TppDBText;
    lbl_vl_fab_abono3: TppDBText;
    lbl_vl_atual_antec3: TppLabel;
    lbl_vl_atual_depois3: TppDBText;
    lbl_vl_pg_abono3: TppLabel;
    lbl_vl_deficit_abono3: TppDBText;
    qryRelatorioVALORDESCPAGOABONO: TFloatField;
    qryRelatorioVALORABONO13DEV: TFloatField;
    qryAcJudDeficit: TwwQuery;
    qryAcJudDeficitIDCONTRIBUICAO: TFloatField;
    qryAcJudDeficitNOME: TStringField;
    qryAcJudDeficitPERCACJUDDEFICIT: TFloatField;
    qryAcJudDeficitANOMESINIACJUDDEFICIT: TStringField;
    qryAcJudDeficitANOMESFIMACJUDDEFICIT: TStringField;
    dsAcJudDeficit: TwwDataSource;
    ppAcJudDeficit: TppBDEPipeline;
    ppAcJudDeficitppField1: TppField;
    ppAcJudDeficitppField2: TppField;
    ppAcJudDeficitppField3: TppField;
    ppAcJudDeficitppField4: TppField;
    ppAcJudDeficitppField5: TppField;
    ppSubAcaoJud: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShapeTitleBandAcJudDeficit1: TppShape;
    ppLabelTitleBandAcJudDeficit1: TppLabel;
    ppHeaderBand4: TppHeaderBand;
    ppShapeTitleBandAcJudDeficit2: TppShape;
    ppLabelAcJudANOMESFIMACJUDDEFICIT: TppLabel;
    ppLabelAcJudANOMESINIACJUDDEFICIT: TppLabel;
    ppLabelAcJudPERCACJUDDEFICIT: TppLabel;
    ppLabelAcJudNOME: TppLabel;
    ppLineTitleBandAcJudDeficit3: TppLine;
    ppLineTitleBandAcJudDeficit2: TppLine;
    ppLineTitleBandAcJudDeficit1: TppLine;
    ppDetailBand5: TppDetailBand;
    ppShapeDetailBandAcJudDeficit1: TppShape;
    ppLineDetailBandAcJudDeficit3: TppLine;
    ppLineDetailBandAcJudDeficit2: TppLine;
    ppLineDetailBandAcJudDeficit1: TppLine;
    ppDBTextAcJudANOMESINIACJUDDEFICIT: TppDBText;
    ppDBTextAcJudANOMESFIMACJUDDEFICIT: TppDBText;
    ppDBTextAcJudPERCACJUDDEFICIT: TppDBText;
    ppDBTextAcJudNOME: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLabelLote: TppLabel;
    ppLabelVersao: TppLabel;

    procedure sbtnProcurarClick(Sender: TObject);
    procedure RemoveDuplicates(var stringList : TStringList) ;
    procedure GravaHstPercGrupo(_perc:double;_idpessjur, _idtitular, _idplanoorigem, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio,_fontepagadora,_numeroprocesso,_encerramento:string);
    procedure buscarequerimentos(_selecao:string);
    procedure buscarlog();
    procedure configuralog();
    procedure bt_imprimirClick(Sender: TObject);
    procedure gera_impressao_log;
    procedure gera_impressao_requerimento(_qtAtual:Integer);
    procedure gera_impressao_rel_mens;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnRequererClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnConcedeUmClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure QryGrid();
    function VerificaMaioridade(_idtitular,_idplanoprev,_idbeneficio,_idpessoa:string):boolean;
    function VerificaMorte(_idtitular,_idplanoprev,_idbeneficio,_idpessoa:string):boolean;
    procedure GravarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure GravarMovBenef(_ValorAtual,_ValorTotal,_DataInicio,_DataFinal,_Tipo,_idpessjur, _idtitular, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio,_numeroprocesso,_datafinal_movbenef,_Valoratual_antec:string);
    procedure AtualzarBENEFBFCIARIO(_valoratual:double;_idsitbeneficio,_idtitular,_idpessoa,_idplanoprev,_idbeneficio,_fontepaga: String;
                                    _valorBS, _valorFAB, _vlrBaseDeficit:double); //Helio - SOL Nº 253577/17666 PPM Nº 1019935


    procedure Criar_temp(_query:TwwQuery);
    procedure Gravar_temp_log(_msgerro,_msgoracle:string);
    procedure Deletar_temp_log();
    procedure FormShow(Sender: TObject);

    procedure Button2Click(Sender: TObject);
    procedure qryDet1AfterOpen(DataSet: TDataSet);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ProcessaReversao();
    procedure AtualizarBfciarioTitPlan(_perc:double;_idpessjur, _idtitular, _idplanoorigem, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio:string);


    function CalculoValorSRB(_datarefe,_idpessjur, _idtitular,  _idpessoa,_idplanoprev, _idbeneficio,_NumeroProcesso:string):string;
    function GetValorMes(_valorB,_valorC,_percAnt,_percNovo,_data: string;
                         //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                         var dPerc : double;
                         valorTotal : double;
                         _idPlanoPrevConta : Integer
                         //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                        ): double;
    function GetPercMes(_valorB,_percAnt,_percNovo,_data: string): double;
    function GetPercAnterior(_idpessjur, _idtitular, _idplanoorigem, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio:string):String;
    procedure cb_demoClick(Sender: TObject);
    procedure Ch_relmeClick(Sender: TObject);
    procedure GravarHSTCONTRIBPREV(_IDTITULAR,_IDMOTIVO,_DATAFINAL,_DATAINICIO,_IDPLANOPREV,_IDPESSJUR,_SEQPROPOSTA,_IDPESSOA,_IDBENEFICIO,_NUMEROPROCESSO,_DATAENCERRAMENTO,_MESREF,_IDPLANOORIGEM,_datapreparo:string);///douglas.siqueira 212299
    procedure tbcDetalheChange(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure rpReversaoCotasMensalBeforePrint(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure ExportarGrid(toExcel: Boolean);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ppSubRepContribPrint(Sender: TObject);
    procedure ppSubRepContribExtraPrint(Sender: TObject);




  private
    wHora, wMin, wSeg, wMSeg : word;
    iIdLoteConcessao,iFlgIncluiMesConc,sidmovbenef,iIdCalculo:Integer;
    sAnoMesLoteConcessao :string;
    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    procedure ConfPPREport1BSFABBDeficit;
    procedure MostraPPREport1BSFABBDeficit;
    procedure MostraPPREport1BSFABBDeficitCampos;
    procedure MostraPPREport1BSFABBDeficitGrid;
    procedure MostraPPREport1SemBSFABBDeficit;
    procedure MostraPPREport1SemBSFABBDeficitCampos;
    procedure MostraPPREport1SemBSFABBDeficitGrid;
    procedure MostraPPREport1BSFABB;
    procedure MostraPPREport1BSFABBCampos;
    procedure MostraPPREport1BSFABBGrid;
    procedure MostraPPREport1BDeficit;
    procedure MostraPPREport1BDeficitCampos;
    procedure MostraPPREport1BDeficitGrid;
    function BEncerrado(dataFinal, anoMesAtual : String) : Boolean;
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

    procedure RetornaTotalContrib(var rContrNormal, rContrExtra : double);    //edilaine - SIG48583

    //edilaine - SIG 33727 - inicio
    procedure AjustaAbonoPago( qry : TwwQuery; dataPagto, sVlrBS, sVlrFAB, sVlrDeficit : string; var rVlrPago : double);
    procedure AjustaContribAbonoPago(qry : TwwQuery;  dataPagto : string);
    //edilaine - SIG 33727 - fim

    { Private declarations }
  public
    { Public declarations }
    procedure GravarHSTBENEFBFCIARIO(_Tipo,_idmotivo,_flgtiporegistro,_SEQbeneficio,_datapagamento,_mesreflote,_ValorAtual,_PercAtual,_DataInicio,_DataFinal,_idpessjur, _idtitular, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio,_numeroprocesso,_FONTEPAGADORA,_valortotal,_IDPLANOORIGEM,_IDSITBENEFICIO,
                                     _valorIntegral,
                                     _valorBS, _valorFAB, _vlrBaseDeficit:string;   //Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                     _IdPerfilInvest : string);                     //edilaine - SIG55933
    procedure AtualizarProcessoBenef(NUMEROPROCESSO,idsitprocesso: string); //Denis Horongoso - SIG68319

  end;

var
  FrmReverCotas: TFrmReverCotas;
  FIdbenefh  : tStringList;
  RegProc:integer;
  qt_mat,qt_pen,qt_reg:integer;
  Fidtitular,FInumprocesso,FFontePagadora,FidPessJur,FidPlanoPrev: tStringList;
implementation

uses
  FMostraAux,UFuncoesUteis,USistema,uCMTypes,UMensErro,ubeneficio,UDataBase,UAdmPrev,DBaseDados,FPreview,FSelecionaLote,
  DAPrev,uCmMath,
  UContribuicaoPrev; //Helio - SOL Nº 253577/17666 PPM Nº 1019935
{$R *.DFM}


function IsDate(str: string): Boolean;
var
  dt: TDateTime;
begin
  Result := True;
  try
    dt := StrToDate(str); 
  except
    Result := False; 
  end; 
end; 

procedure TFrmReverCotas.buscarequerimentos(_selecao:string);
var
  sql:string;
begin
sql:='';


qry.Active:=true;

qryDet.Close;
qryDet.sql.Clear;

QRYDET.SQL.ADD('SELECT '+#39+_selecao+#39+' AS SELECIONADO,');

qryDet.Active:=true;

end;

procedure TFrmReverCotas.sbtnProcurarClick(Sender: TObject);
var
   ConfirmaVisible : Boolean;
_query,_query2:TwwQuery;

begin
//inherited;

sbtnProcurar.Down:=False;

if (ME_anomes.Text) = '    /  ' then
   begin
   MsgDlg( 'Favor preencher o Ano/Mês de referência para que o sistema possa efetuar a pesquisa.','Erro',mtError,[mbOk, mbHelp],0);
   ME_anomes.SetFocus;
   exit;
   end;//msg01




_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;



_query2 := TwwQuery.Create(Application);
_query2.DataBaseName := 'BaseDados';
_query2.close;

_query.SQL.clear;
_query.SQL.Append(' SELECT 1 FROM BLOQUEIOFOLHA  WHERE ');
_query.SQL.Append(' IDUSUARIO ='+inttostr(Sistema.IdUsuario));
_query.SQL.Append(' AND (DATABLOQUEIO IS NOT NULL)     '); // Andre Imakawa - SIG 32875
_query.SQL.Append(' AND (DATABLOQUEIO<=TO_DATE(SYSDATE,''DD/MM/RRRR''))'); // Andre Imakawa - SIG 32875
_query.open;

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
{if _query.IsEmpty then
   begin

   _query2.close;
   _query2.SQL.clear;
   _query2.SQL.Add('SELECT MAX(MESREFERENCIA)MESREFERENCIA FROM CTRLINTERFACE WHERE FLGCONCESSAO = 1');
   _query2.open;
   if (int(strtodate('01/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4))))>(int(strtodate('01/'+copy(_query2.FieldByName('MESREFERENCIA').text,6,2)+'/'+copy(_query2.FieldByName('MESREFERENCIA').text,1,4)))) then//douglas.siqueira 212299
      begin
      MsgDlg('Mês referência maior que data da folha disponível. Verifique. ','Erro',mtError,[mbOk],0);
      Exit;

      end;

   end
else}

if Not _query.IsEmpty then
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   begin
   MsgDlg('Usuário não tem permissão. Verifique. ','Erro',mtError,[mbOk],0);
   Exit
   end;

_query.Close;
_query2.Close;


_query.Destroy;
_query2.Destroy;   


qry.open;

QryGrid();
sbtnProcurar.Down:=false;


if qryDet.IsEmpty then
   sbtnRequerer.Enabled:=False
else
   sbtnRequerer.Enabled:=True;



end;

procedure TFrmReverCotas.bt_imprimirClick(Sender: TObject);
var
  qt:Integer;
begin
//  inherited;

if (not cb_demo.Checked) and (not Ch_relme.Checked) then
   begin
   MsgDlg( ' É necessário selecionar um relatório para impressão.','Erro',mtError,[mbOk],0);
   cb_demo.setfocus;
   Exit;
   end;




if cb_demo.Checked then
   ExportarGrid(true);


if Ch_relme.Checked then
   gera_impressao_rel_mens;






end;

procedure TFrmReverCotas.gera_impressao_log;
var
     iInicio, iFim, nProcessados : integer;
begin

   If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);


     DecodeTime(Time, wHora, wMin, wSeg, wMSeg);

     iInicio           := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
     buscarlog;



      with frmMostraAux.memResult.Lines do
        begin
        Clear;


        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('LOG DO PROCESSAMENTO DE REQUERIMENTO DE BENEFÍCIOS DO INSS EM LOTE',99));
        Add('-----------------------------------------------------------------------------------------------------');
        Add('Início do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time));


        while not qry.eof do
            begin
            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qry.FieldByName('Matrícula').AsString,30)+
             //  PreparaStr('Inscrição : '+qry.FieldByName('inscricao').AsString,20)+
               PreparaStr('Nome  : '+qry.FieldByName('Nome').AsString,49));

            Add('Mensagem de Erro: '+qry.FieldByName('Mensagem de Erro').AsString);
            Add(qry.FieldByName('Mensagem Oracle').AsString);

            qry.next;
            end;


        Add('-----------------------------------------------------------------------------------------------------');
            Add(PreparaStr('Quantidade total de registros : '+inttostr(qryDet.recordcount),50)+
               PreparaStr('Quantidade de registros processados :  '+inttostr(RegProc),50));


         iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

            Add(PreparaStr('Tempo de Processamento : '+TempoDecorrido(iFim - iInicio),50)+
               PreparaStr('Log gerado em : '+FormatDateTime('dd/mm/yyyy', date)+' às '+FormatDateTime('hh:mm', time)+' horas',50));



        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('Fim do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time),99));
        Add('-----------------------------------------------------------------------------------------------------');



      end;



end;

procedure TFrmReverCotas.buscarlog;
begin
pnl1.BringToFront;
pnl_impressao.SendToBack;
qry.Close;
qry.Active:=false;
qry.sql.clear;
qry.sql.Add('SELECT matricula AS Matrícula,nome as Nome,msgerro as "Mensagem de Erro",msgerrooracle as "Mensagem Oracle" FROM CM.LOGREVERSAO');

qry.Active:=true;

end;

procedure TFrmReverCotas.configuralog;
begin
pnl_impressao.BringToFront;
pnl1.SendToBack;

end;

procedure TFrmReverCotas.gera_impressao_requerimento(_qtAtual:Integer);
var
    local:string;
    f : TFrmPreview; //Helio - SOL Nº 253577/17666 PPM Nº 1019935
begin
if  _qtAtual = 1 then
  begin
  qryRelatorio.CLOSE;
  qryRelatorio.SQL.Clear;
  end;

qryRelatorio.SQL.Add('SELECT DISTINCT BF.IDTITULAR,');
qryRelatorio.SQL.Add('       BF.IDPESSOA,');
qryRelatorio.SQL.Add('       BF.IDBENEFICIO,');
qryRelatorio.SQL.Add('       BF.IDPESSJUR,');
qryRelatorio.SQL.Add('       BF.IDPLANOORIGEM,');
qryRelatorio.SQL.Add('       BF.SEQPROPOSTA,');
qryRelatorio.SQL.Add('       BF.IDPLANOPREV,');
qryRelatorio.SQL.Add('       BF.NUMEROPROCESSO,');
qryRelatorio.SQL.Add('       BF.FONTEPAGADORA,');
//qryRelatorio.SQL.Add('       MB.DATAMOV "MÊS",'); // Colocar o mes e ano da tela onde é utilizado para filtro da pesquisa principal // SOL 236004 PPM 461575
qryRelatorio.SQL.Add('       '+ QuotedStr(ME_anomes.text) +' "MÊS",'); // SOL 236004 PPM 461575
qryRelatorio.SQL.Add('       P.NOME NOME,');
qryRelatorio.SQL.Add('       B.NOME NOMEBENEFICIO,');
qryRelatorio.SQL.Add('       DPT.MATRICULA AS "MATTIT",');
qryRelatorio.SQL.Add('       DP.MATRICULA AS "MATBEN",');
qryRelatorio.SQL.Add('       DP.MATRICULA MATRICULA,');
qryRelatorio.SQL.Add('       BF.DATAFINAL,       '); 
qryRelatorio.SQL.Add('       BF.IDPLANPREVCONTAB,       '); //Helio - SOL Nº 253577/17666 PPM Nº 1019935
qryRelatorio.SQL.Add('       btt.idresponsavel,       '); //Helio - SOL Nº 253577/17666 PPM Nº 1019935

qryRelatorio.SQL.Add('       PI.NOME AS NOMEPERFIL,       '); //edilaine - SIG55933

//edilaine - SIG48583 - inicio comentario
//qryRelatorio.SQL.Add('      (SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)');     // edilaine - SOL 253577-18151 / PPM 1318910
{qryRelatorio.SQL.Add('      (SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)');       // edilaine - SOL 253577-18151 / PPM 1318910

qryRelatorio.SQL.Add('        FROM hstcontribprev hc');
qryRelatorio.SQL.Add('        WHERE hc.idcontribuicao = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500) AND');
qryRelatorio.SQL.Add('              hc.idpessoa = btt.idresponsavel AND');
qryRelatorio.SQL.Add('              hc.idtitular = bf.idtitular AND hc.datarecebimento is null AND  '); // SOL 222734 KTN 2062476
qryRelatorio.SQL.Add('              TRUNC(hc.TRGDTINCLUSAO) = TRUNC(SYSDATE) AND '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('              hc.MESCOBRANCA ='+#39+ME_anomes.TEXT+#39+' ) VALORESPERADO,');

//qryRelatorio.SQL.Add('       (SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)');     // edilaine - SOL 253577-18151 / PPM 1318910
qryRelatorio.SQL.Add('       (SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)');       // edilaine - SOL 253577-18151 / PPM 1318910
qryRelatorio.SQL.Add('        FROM hstcontribprev hc');
qryRelatorio.SQL.Add('        WHERE hc.idcontribuicao = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500) AND');
qryRelatorio.SQL.Add('              hc.idpessoa = btt.idresponsavel AND');
qryRelatorio.SQL.Add('              TRUNC(hc.TRGDTINCLUSAO) = TRUNC(SYSDATE) AND '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('              hc.idtitular = bf.idtitular AND');
qryRelatorio.SQL.Add('              hc.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+') VALORESPERADOABONO,');


//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
qryRelatorio.SQL.Add('      (SELECT C.NOME');
qryRelatorio.SQL.Add('        FROM hstcontribprev hc');
qryRelatorio.SQL.Add('        INNER JOIN CONTRIBUICAO C');
qryRelatorio.SQL.Add('        ON HC.IDCONTRIBUICAO = C.IDCONTRIBUICAO');
qryRelatorio.SQL.Add('        WHERE C.IDTPCONTRIBUICAO = 1 AND');
qryRelatorio.SQL.Add('              hc.idpessoa = btt.idresponsavel AND');
qryRelatorio.SQL.Add('              hc.idtitular = bf.idtitular AND hc.datarecebimento is null AND  ');
qryRelatorio.SQL.Add('              TRUNC(hc.TRGDTINCLUSAO) = TRUNC(SYSDATE) AND ');
qryRelatorio.SQL.Add('              ROWNUM = 1 AND ');
qryRelatorio.SQL.Add('              HC.IDPLANPREVCONTAB = BF.IDPLANPREVCONTAB AND ');
qryRelatorio.SQL.Add('              HC.IDPLANOPREV = BF.IDPLANOPREV AND ');
qryRelatorio.SQL.Add('              ROWNUM = 1 AND ');
qryRelatorio.SQL.Add('              hc.MESREFERENCIA ='+#39+ME_anomes.TEXT+#39+' ) NOMECONTRIBEXTR,');

//qryRelatorio.SQL.Add('      (SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)');   // edilaine - SOL 253577-18151 / PPM 1318910
qryRelatorio.SQL.Add('      (SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)');     // edilaine - SOL 253577-18151 / PPM 1318910
qryRelatorio.SQL.Add('        FROM hstcontribprev hc');
qryRelatorio.SQL.Add('        INNER JOIN CONTRIBUICAO C');
qryRelatorio.SQL.Add('        ON HC.IDCONTRIBUICAO = C.IDCONTRIBUICAO');
qryRelatorio.SQL.Add('        WHERE C.IDTPCONTRIBUICAO = 1 AND');
qryRelatorio.SQL.Add('              hc.idpessoa = btt.idresponsavel AND');
qryRelatorio.SQL.Add('              hc.idtitular = bf.idtitular AND hc.datarecebimento is null AND  '); // SOL 222734 KTN 2062476
qryRelatorio.SQL.Add('              TRUNC(hc.TRGDTINCLUSAO) = TRUNC(SYSDATE) AND '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('              HC.IDPLANPREVCONTAB = BF.IDPLANPREVCONTAB AND ');
qryRelatorio.SQL.Add('              HC.IDPLANOPREV = BF.IDPLANOPREV AND ');
qryRelatorio.SQL.Add('              hc.MESREFERENCIA ='+#39+ME_anomes.TEXT+#39+' ) VALORESPERADOEXTR,');

qryRelatorio.SQL.Add('       (SELECT C.NOME');
qryRelatorio.SQL.Add('        FROM hstcontribprev hc');
qryRelatorio.SQL.Add('        INNER JOIN CONTRIBUICAO C');
qryRelatorio.SQL.Add('        ON HC.IDCONTRIBUICAO = C.IDCONTRIBUICAO');
qryRelatorio.SQL.Add('        WHERE C.IDTPCONTRIBUICAO = 1 AND');
qryRelatorio.SQL.Add('              hc.idpessoa = btt.idresponsavel AND');
qryRelatorio.SQL.Add('              TRUNC(hc.TRGDTINCLUSAO) = TRUNC(SYSDATE) AND ');
qryRelatorio.SQL.Add('              hc.idtitular = bf.idtitular AND');
qryRelatorio.SQL.Add('              HC.IDPLANPREVCONTAB = BF.IDPLANPREVCONTAB AND ');
qryRelatorio.SQL.Add('              HC.IDPLANOPREV = BF.IDPLANOPREV AND ');
qryRelatorio.SQL.Add('              ROWNUM = 1 AND');
qryRelatorio.SQL.Add('              hc.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+') NOMECONTRIBABONOEXTR,');

//qryRelatorio.SQL.Add('       (SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)');   // edilaine - SOL 253577-18151 / PPM 1318910
qryRelatorio.SQL.Add('       (SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)');     // edilaine - SOL 253577-18151 / PPM 1318910
qryRelatorio.SQL.Add('        FROM hstcontribprev hc');
qryRelatorio.SQL.Add('        INNER JOIN CONTRIBUICAO C');
qryRelatorio.SQL.Add('        ON HC.IDCONTRIBUICAO = C.IDCONTRIBUICAO');
qryRelatorio.SQL.Add('        WHERE C.IDTPCONTRIBUICAO = 1 AND');
qryRelatorio.SQL.Add('              hc.idpessoa = btt.idresponsavel AND');
qryRelatorio.SQL.Add('              TRUNC(hc.TRGDTINCLUSAO) = TRUNC(SYSDATE) AND '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('              hc.idtitular = bf.idtitular AND');
qryRelatorio.SQL.Add('              HC.IDPLANPREVCONTAB = BF.IDPLANPREVCONTAB AND ');
qryRelatorio.SQL.Add('              HC.IDPLANOPREV = BF.IDPLANOPREV AND ');
qryRelatorio.SQL.Add('              hc.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+') VALORESPERADOABONOEXTR,');
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
}//edilaine - SIG48583 - fim comentario

qryRelatorio.SQL.Add('       (SELECT MAX(PERCENTUAL)');
qryRelatorio.SQL.Add('          FROM HSTPERCGRUPO HG');
qryRelatorio.SQL.Add('         WHERE HG.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('           AND HG.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('           AND HG.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('           AND HG.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('           AND HG.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('           AND HG.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('           AND HG.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('           AND HG.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('           AND TO_CHAR(HG.DATAFIM, ''YYYY/MM'') ='+#39+ME_anomes.TEXT+#39+' )AS "PERCENTUAL ANTERIOR",');
qryRelatorio.SQL.Add('       BTT.PERCENTUAL "PERCENTUAL ATUAL",');
qryRelatorio.SQL.Add('       BF.VALORTOTAL "VALOR TOTAL",');
qryRelatorio.SQL.Add('       MB.VALORATUALANT AS "VALOR ATUAL(ANTEC)",');
qryRelatorio.SQL.Add('        DECODE(BTT.PERCENTUAL,0,0,BF.VALORATUAL) "VALOR ATUAL(DEPOIS)",');
qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(DECODE(HB.FLGDEVOLUCAO,');
qryRelatorio.SQL.Add('                                   1,');
qryRelatorio.SQL.Add('                                   -HB.VALORPREV,');
qryRelatorio.SQL.Add('                                   HB.VALORPREV))');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');

qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA AND HB.Dtefetpgto is null'); // SOL 222734 KTN 2062476
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+ME_anomes.TEXT+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VALOR A SER PAGO",');
qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(DECODE(HB.FLGDEVOLUCAO,');
qryRelatorio.SQL.Add('                                   1,');
qryRelatorio.SQL.Add('                                   -HB.VALORPREV,');
qryRelatorio.SQL.Add('                                   HB.VALORPREV))');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('                    AND HB.FLGTIPOREGISTRO <> 2 ');       //edilaine - SIG33727
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VALOR A SER PAGO ABONO", '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635

//edilaine - SIG33727 - INICIO
qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(DECODE(HB.FLGDEVOLUCAO,');
qryRelatorio.SQL.Add('                                   1,');
qryRelatorio.SQL.Add('                                   -HB.VALORPREV,');
qryRelatorio.SQL.Add('                                   HB.VALORPREV))');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) ');
qryRelatorio.SQL.Add('                    AND HB.SEQBENEFICIO = 2 ');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VALOR DESC PAGO ABONO", ');
//edilaine - SIG33727 - FIM

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(DECODE(HB.FLGDEVOLUCAO,');
qryRelatorio.SQL.Add('                                   1,');
qryRelatorio.SQL.Add('                                   -HB.VALORBS,');
qryRelatorio.SQL.Add('                                   HB.VALORBS))');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA AND HB.Dtefetpgto is null'); // SOL 222734 KTN 2062476
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+ME_anomes.TEXT+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS VALORBS,');

qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(DECODE(HB.FLGDEVOLUCAO,');
qryRelatorio.SQL.Add('                                   1,');
qryRelatorio.SQL.Add('                                   -HB.VALORFAB,');
qryRelatorio.SQL.Add('                                   HB.VALORFAB))');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA AND HB.Dtefetpgto is null'); // SOL 222734 KTN 2062476
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+ME_anomes.TEXT+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS VALORFAB,');

qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(DECODE(HB.FLGDEVOLUCAO,');
qryRelatorio.SQL.Add('                                   1,');
qryRelatorio.SQL.Add('                                   -HB.VLRBASEDEFICIT,');
qryRelatorio.SQL.Add('                                   HB.VLRBASEDEFICIT))');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA AND HB.Dtefetpgto is null'); // SOL 222734 KTN 2062476
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+ME_anomes.TEXT+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS VLRBASEDEFICITHSTBENEF,');


qryRelatorio.SQL.Add('        NVL(ROUND((SELECT HB.VALORBS');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) ');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                    AND HB.FLGTIPOREGISTRO <> 2 ');       //edilaine - SIG33727
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VALORBSABONO", ');

qryRelatorio.SQL.Add('       NVL(ROUND((SELECT HB.VALORFAB');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) ');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                    AND HB.FLGTIPOREGISTRO <> 2 ');       //edilaine - SIG33727
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VALORFABABONO", ');

qryRelatorio.SQL.Add('       NVL(ROUND((SELECT HB.VLRBASEDEFICIT');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) ');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                    AND HB.FLGTIPOREGISTRO <> 2 ');       //edilaine - SIG33727
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VLRBASEDEFICITABONO",');

//edilaine - SIG48583 - inicio comentario
//qryRelatorio.SQL.Add('        (SELECT NOME FROM CONTRIBUICAO WHERE IDCONTRIBUICAO = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500)) AS NOMECONTRIBABONO, ' );
//edilaine - SIG48583 - fim comentario

//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

qryRelatorio.SQL.Add('           ((NVL(ROUND((SELECT SUM(NVL(VLBENEFPGTO,0)) AS VLBENEFPGTO  '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('                                       FROM HSTBENEFBFCIARIO  WHERE (IDPESSOA = BF.IDPESSOA )   '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('                                          AND (MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+') '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('                                          AND (IDBENEFICIO = BF.IDBENEFICIO) AND IDPLANOPREV = BF.IDPLANOPREV '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
qryRelatorio.SQL.Add('                                          ),2),0))) AS VALORATUALABONO '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635

qryRelatorio.SQL.Add(', ''S'' AS TIPO ');

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935 qryRelatorio.SQL.Add(', PF.DATANASC, ');
qryRelatorio.SQL.Add(', PF.DATANASC, ');
qryRelatorio.SQL.Add(' BF.DATAINICIOFUND AS DIB, ');
qryRelatorio.SQL.Add(' BF.DATAINICIO AS DIP, ');
qryRelatorio.SQL.Add(' BF.DIBBENEFANT AS DIBANT, ');
qryRelatorio.SQL.Add(' BF.VLRBSTOTAL, ');
qryRelatorio.SQL.Add(' BF.VLRBSATUAL, ');
qryRelatorio.SQL.Add(' BF.VLRFABTOTAL, ');
qryRelatorio.SQL.Add(' BF.VLRFABATUAL, ');
qryRelatorio.SQL.Add(' BF.VLRBASEDEFICIT, ');
qryRelatorio.SQL.Add(' BP.FLGAPRESENTABSFAB, ');
qryRelatorio.SQL.Add(' BP.FLGAPRESENTADEFICIT, ');

//edilaine - SIG48583 - inicio comentario
//qryRelatorio.SQL.Add(' CONTRIB.NOME AS NOMECONTRIB, ');  // Andre Imakawa - SIG 45005/45579
//edilaine - SIG48583 - fim comentario
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

//edilaine - SIG33727 - INICIO
qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(HB.VALORTOTAL)');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) ');
qryRelatorio.SQL.Add('                    AND HB.SEQBENEFICIO = 2  ');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VALORABONO13DEV", ');
//edilaine - SIG33727 - FIM

// Andre Imakawa - SIG 45005/45579 - Inicio

qryRelatorio.SQL.Add('       NVL(ROUND((SELECT SUM(HB.VALORTOTAL)');
qryRelatorio.SQL.Add('                   FROM HSTBENEFBFCIARIO HB');
qryRelatorio.SQL.Add('                  WHERE HB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                    AND HB.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('                    AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qryRelatorio.SQL.Add('                    AND HB.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                    AND HB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                    AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                    AND HB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                    AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) ');
qryRelatorio.SQL.Add('                    AND HB.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                    AND HB.FLGTIPOREGISTRO <> 2 ');       //edilaine - SIG33727
qryRelatorio.SQL.Add('                    AND HB.MESREFERENCIA = '+#39+copy(ME_anomes.TEXT,1,4)+'/13'+#39+'),');
qryRelatorio.SQL.Add('                 2),');
qryRelatorio.SQL.Add('           0) AS "VALORABONO13" ');

// Andre Imakawa - SIG 45005/45579 - Fim

qryRelatorio.SQL.Add('FROM BENEFBFCIARIO BF');
qryRelatorio.SQL.Add('     JOIN DEPENTIT DPT ON DPT.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                      AND DPT.IDPESSOA = BF.IDTITULAR');
qryRelatorio.SQL.Add('     JOIN DEPENTIT DP ON BF.IDPESSOA = DP.IDPESSOA');
qryRelatorio.SQL.Add('                     AND BF.IDTITULAR = DP.IDTITULAR     ');
qryRelatorio.SQL.Add('     JOIN PESSOA P ON P.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('     JOIN BENEFICIO B ON BF.IDBENEFICIO = B.IDBENEFICIO');
qryRelatorio.SQL.Add('     JOIN BFCIARIOTITPLAN BTT ON BTT.IDPESSJUR = BF.IDPESSJUR');
qryRelatorio.SQL.Add('                             AND BTT.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                             AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qryRelatorio.SQL.Add('                             AND BTT.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                             AND BTT.SEQPROPOSTA = BF.SEQPROPOSTA');
qryRelatorio.SQL.Add('                             AND BTT.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                             AND BTT.IDBENEFICIO = BF.IDBENEFICIO');
qryRelatorio.SQL.Add('     JOIN MOVBENEF MB ON ');
qryRelatorio.SQL.Add('                     MB.IDTITULAR = BF.IDTITULAR');
qryRelatorio.SQL.Add('                     AND MB.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('                     AND MB.IDPLANOPREV = BF.IDPLANOPREV');
qryRelatorio.SQL.Add('                     AND MB.IDBENEFICIO = BF.IDBENEFICIO');

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
qryRelatorio.SQL.Add('     LEFT JOIN PESSOAFISICA PF ON PF.IDPESSOA = BF.IDPESSOA');
qryRelatorio.SQL.Add('     LEFT JOIN BENEFPLANPREV BP ON BP.IDPLANOPREV = BF.IDPLANOPREV ');
qryRelatorio.SQL.Add('          AND BP.IDBENEFICIO = B.IDBENEFICIO ');

//edilaine - SIG48583 - inicio comentario
//qryRelatorio.SQL.Add('     LEFT JOIN CONTRIBUICAO CONTRIB ');
//qryRelatorio.SQL.Add('                    ON CONTRIB.IDCONTRIBUICAO = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500) ');
//edilaine - SIG48583 - fim comentario

//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

//edilaine - SIG55933 - inicio
qryRelatorio.SQL.Add('     LEFT JOIN PERFILINVEST PI ON PI.IDPERFILINVEST = BF.IDPERFILINVEST');
//edilaine - SIG55933 - fim

qryRelatorio.SQL.Add('                     ');
qryRelatorio.SQL.Add(' WHERE BF.IDSITBENEFICIO IN (1,2,3)');
qryRelatorio.SQL.Add('   AND MB.TIPOMOV = 16');
qryRelatorio.SQL.Add('   AND MB.IDDESFAZER IS NULL ');    //edilaine SIG135320
qryRelatorio.SQL.Add('   AND BF.IDTPPAGTOBENEFIC = 1');
qryRelatorio.SQL.Add(' AND trunc(MB.DATAMOV) = trunc(sysdate) '); // Thiago Melo/Xavier SOL 229888 PPM 349946

TRY
qryRelatorio.SQL.Add('   AND BF.IDTITULAR IN('+qryDet.fieldbyname('IDTITULAR').text+')');
EXCEPT
END;

TRY
qryRelatorio.SQL.Add('   AND BF.IDPESSJUR IN('+qryDet.fieldbyname('IDPESSJUR').text+')');
EXCEPT
END;

TRY
  qryRelatorio.SQL.Add('   AND BF.FONTEPAGADORA  IN('+qryDet.fieldbyname('FONTEPAGADORA').text+')');
EXCEPT
END;

try
qryRelatorio.SQL.Add('   AND   (( '+qryDet.fieldbyname('IDPLANOPREV').text+'  IN (2,66) AND BF.IDPLANOPREV IN (2,66)) OR (BF.IDPLANOPREV in('+qryDet.fieldbyname('IDPLANOPREV').text+') )) ');
except
end;


qryRelatorio.SQL.Add('   AND BF.IDPESSOA <> BF.IDTITULAR ');


qryRelatorio.SQL.Add(' AND ((TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '+QuotedStr(ME_anomes.TEXT)+') OR (BF.DATAFINAL IS NULL)) ');  //William Santana - SIG 20490

//qryRelatorio.SQL.Add('  AND ((BF.DATAFINAL>=MB.DATAMOV) OR (BF.DATAFINAL IS NULL))');   //William Santana - SIG 20490

qryRelatorio.SQL.Add('   AND BF.IDBENEFICIO = '+qryDet.fieldbyname('IDBENEFICIO').text );   //edilaine SIG135320


if qt_reg = _qtAtual then
   begin
     qryRelatorio.SQL.Add(' ORDER BY 1, 2, 3');
    try
    qryRelatorio.OPEN;

    except
    If not dtmBaseDados.dbBaseDados.InTransaction Then
       dtmBaseDados.dbBaseDados.StartTransaction;

    If dtmBaseDados.dbBaseDados.InTransaction   Then
       dtmBaseDados.dbBaseDados.Rollback;

    Exit;

    end;
    end
else
   qryRelatorio.SQL.Add(' Union ');

if qt_reg = _qtAtual then
   begin
    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    //TFrmPreview.CreateModalPreview(Application, ppReport1,'Demonstrativo de Reversão de Cotas');
    f := TFrmPreview.Create(Application);
    f.formStyle := fsNormal;
    f.Visible := False;
    f.ppViewer1.Report := ppReport1;
    f.Caption := 'Demonstrativo de Reversão de Cotas';
    f.ppViewer1.Report.ResetDevices;
    f.ppViewer1.Report.PrintToDevices;
    f.btnTelaUnica.Visible := True;
    f.WindowState := wsMaximized;
    f.ppViewer1.ZoomPercentage := 157;
    f.ShowModal;
    f.Free;
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

    if cb_demo.Checked =false then
       begin
       if MsgDlg( 'Deseja gravar os Demonstrativos ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
		// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
        {qryRelatorioAUX.close;
        qryRelatorioAUX.sql.Clear;
        qryRelatorioAUX.sql.text:=qryRelatorio.sql.GetText;
        qryRelatorioAUX.open;
        dsReversaoCotas.DataSet:=qryRelatorioAUX;}
		// SOL 233734 PPM 433623 e SOL 234481 PPM 433635

        qryRelatorio.First;
        while not qryRelatorio.eof do
           begin

			// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
           {qryRelatorioAUX.Filtered:=False;
           qryRelatorioAUX.Filter:='IDTITULAR='+qryRelatorio.FieldByName('IDTITULAR').Text+' AND IDBENEFICIO='+qryRelatorio.FieldByName('IDBENEFICIO').Text;
           qryRelatorioAUX.Filtered:=True;}
			// SOL 233734 PPM 433623 e SOL 234481 PPM 433635

           // edilaine - SIG 32303 inicio
           //rn10
            // Felipe A. Santos SOL 222734/15797 KTN 2060843 - inicio
            //local:='C:\GEPRE_USOINTERNO\Histórico de Assistidos\'+qryRelatorio.FIELDBYNAME('MATTIT').TEXT+'\'+qryRelatorio.FIELDBYNAME('MATBEN').TEXT;
            {local:='\\ALTARF\geben_uso_interno\GEPRE_USOINTERNO\Histórico de Assistidos\'+qryRelatorio.FIELDBYNAME('MATTIT').TEXT+'\'+qryRelatorio.FIELDBYNAME('MATBEN').TEXT; }
            // Felipe A. Santos SOL 222734/15797 KTN 2060843 - fim

            local := CaminhoParaSalvarArquivo(qryRelatorio.FIELDBYNAME('MATTIT').AsString,
                                              qryRelatorio.FIELDBYNAME('MATBEN').AsString);
           // edilaine - SIG 32303 fim

                 if not DirectoryExists(local) then
                        ForceDirectories(local);

			// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
            ppReport1.DeviceType       := 'PDFFile';
            ppReport1.AllowPrintToFile := True;
            ppReport1.ShowPrintDialog  := False;
            ppReport1.TextFileName     := local+'\DEMONSTRATIVO DE REVERSÃO DE COTA-'+qryRelatorio.FIELDBYNAME('MATBEN').TEXT+'-'+FormatDateTime('DDMMYYYY', date)+'-'+FormatDateTime('HHMMSS', time)+'.pdf';
            ppReport1.Print;
			// SOL 233734 PPM 433623 e SOL 234481 PPM 433635

			// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
            ppReport1.DeviceType       := 'ExcelFile';
            ppReport1.AllowPrintToFile := True;
            ppReport1.ShowPrintDialog  := False;
            ppReport1.TextFileName     := local+'\DEMONSTRATIVO DE REVERSÃO DE COTA-'+qryRelatorio.FIELDBYNAME('MATBEN').TEXT+'-'+FormatDateTime('DDMMYYYY', date)+'-'+FormatDateTime('HHMMSS', time)+'.XLS';
            ppReport1.Print;
			// SOL 233734 PPM 433623 e SOL 234481 PPM 433635


           qryRelatorio.Next;
           end;


        dsReversaoCotas.DataSet:=qryRelatorio;
        end;
       end;



   end;
end;

procedure TFrmReverCotas.sbtnAlterarClick(Sender: TObject);
begin
////showmessage
qryDet.edit;
qryDet.post;
  inherited;

end;

procedure TFrmReverCotas.sbtnInserirClick(Sender: TObject);
begin

////
  inherited;

end;

procedure TFrmReverCotas.sbtnRequererClick(Sender: TObject);
var
achou:Boolean;
Ferro,Fmatricula  : TStrings;
idevento:string;
 sSql:string;//William Moreira da Silva - SIG 25183
iNumeroProcesso:integer;
qt:integer;
begin
 Fidtitular := TStringList.Create;
 Fidtitular.Clear;


 FFontePagadora:= TStringList.Create;
 FFontePagadora.Clear;

 FidPessJur := TStringList.Create;
 FidPessJur.Clear;

 FidPlanoPrev := TStringList.Create;
 FidPlanoPrev.clear;

 FInumprocesso  := TStringList.Create;
 FInumprocesso.Clear;

 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;

 FIdbenefh:= TStringList.Create;
 FIdbenefh.clear;
///
  inherited;
sbtnRequerer.Down:=false;
RegProc:=0;

Deletar_temp_log();

/////selecao de lote
iIdLoteConcessao:=0;

   if iIdLoteConcessao <= 0
   then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                                       iFlgIncluiMesConc );
      if iIdLoteConcessao <= 0
      then begin

         MsgDlg('Nenhum lote selecinado para efetuar a concessão. Verifique. ','Erro',mtError,[mbOk],0);
         Exit;
      end;
   end;

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
if (int(strtodate('01/' + copy(ME_anomes.text, 6, 2) + '/' + copy(ME_anomes.text, 1, 4)))) >
   (int(strtodate('01/' + copy(sAnoMesLoteConcessao, 6, 2) + '/' + copy(sAnoMesLoteConcessao, 1, 4)))) then
begin
    MsgDlg('Mês referência maior que mês cobrança do lote selecionado.','Erro',mtError,[mbOk],0);
    Exit;
end;
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
///selecao de lote




qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;

   if qrydet.IsEmpty then
   begin
   MsgDlg( ' É necessário selecionar pelo menos uma matrícula para processar a reversão de cotas.','Erro',mtError,[mbOk],0);
   qrydet.Filtered:=FALSE;
   Exit;
   end;   //msg2

   //William Moreira da Silva - SIG 25183
   qrydet.First;
   while not qrydet.eof do
   begin
     with QryAux do
     begin
       Close;
       SQL.Clear;
       sSql := ' SELECT 1 FROM HSTBENEFBFCIARIO  B ' +
               ' WHERE  B.IDPESSJUR      = '+ qrydet.FieldByName('IDPESSJUR').Text +
               ' AND    B.IDPLANOPREV  = '+ qrydet.FieldByName('idPlanoPrev').Text +
               ' AND    B.IDTITULAR    = '+ qrydet.FieldByName('IDTITULAR').Text +
               ' AND    B.IDBENEFICIO  = '+ qrydet.FieldByName('IDBENEFICIO').Text +// Andre Imakawa - SIG 32517
           //  ' AND    B.IDPESSOA     = '+ qrydet.FieldByName('IDPESSOA').Text + //Peterson Victor - SIG29326
               ' AND    B.MESREFERENCIA = '''+sAnoMesLoteConcessao+ '''' +
               ' AND    B.MES    = '''+sAnoMesLoteConcessao+''' ';

       try
         if FazQuery(QryAux, sSql) then
         begin
           MsgDlg('Este benefício já possui preparo para o mês do lote selecionado. Entre em contato a área de pagamento de benefícios.','Informação',mtWarning,[MbOk],0);
           qrydet.Filtered:=FALSE;
           Exit;
         end;
       except
         Exit;
       end;
       Close;
     end;
     qrydet.Next;
   end;
   //William Moreira da Silva - SIG 25183

qryDetalhe.Active:=True;

qt_reg:=0;
qrydet.First;
while not qrydet.eof do
   begin
   Fidtitular.Add(qrydet.FieldByName('IDTITULAR').Text);
   FIdbenefh.Add(qrydet.FieldByName('IDBENEFICIO').Text);
   FFontePagadora.Add(qrydet.FieldByName('FontePagadora').Text);
   FidPessJur.Add(qrydet.FieldByName('IDPESSJUR').Text);
   FidPlanoPrev.Add(qrydet.FieldByName('idPlanoPrev').Text);
   qt_reg:=qt_reg+1;


  qryDetalhe.Filtered:=False;
  qryDetalhe.Filter:='';
  qryDetalhe.Filter:='idtitular='+qrydet.fieldbyname('IDTITULAR').text +' and beneficio='+qrydet.FieldByName('IDBENEFICIO').Text +' and fontepagadora='+qrydet.FieldByName('FONTEPAGADORA').Text;
  qryDetalhe.Filtered:=True;
  qryDetalhe.Active:=True;
  qryDetalhe.First;
  if qryDetalhe.IsEmpty then
     begin
     qryDetalhe.insert;
     qryDetalheidtitular.Value:= qrydet.FieldByName('IDTITULAR').value;
     qryDetalhebeneficio.Value:= qrydet.FieldByName('IDBENEFICIO').value;
     qryDetalhefontepagadora.Value:= qrydet.FieldByName('FontePagadora').value;
     qryDetalhe.Post;
     end;

   qrydet.Next;
   end;



RemoveDuplicates(Fidtitular);
//RemoveDuplicates(FIdbenefh);

RemoveDuplicates(FFontePagadora);
RemoveDuplicates(FidPessJur);
RemoveDuplicates(FidPlanoPrev);


qrydet.First;
while not qrydet.eof do
begin
try
   ProcessaReversao;
except

  If not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

       If dtmBaseDados.dbBaseDados.InTransaction   Then
          dtmBaseDados.dbBaseDados.Rollback;
end;

qrydet.Next;
end;



////relatorio

qt:=1;
qrydet.First;
while not qrydet.eof do
begin

try

gera_impressao_requerimento(qt);

except


 If not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

 If dtmBaseDados.dbBaseDados.InTransaction   Then
    dtmBaseDados.dbBaseDados.Rollback;


end;

qt:=qt+1;
qrydet.Next;
end;



if not Ck_commit.Checked then
   begin

    if MsgDlg( 'Reversão efetuada. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin

       If not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

       dtmBaseDados.dbBaseDados.Commit;
       end
   else
       begin

       If not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

       If dtmBaseDados.dbBaseDados.InTransaction   Then
          dtmBaseDados.dbBaseDados.Rollback;


       end;
   end;






qrydet.Filtered:=false;
sbtnProcurarClick(sender);

sbtnRequerer.Down:=false;

end;

procedure TFrmReverCotas.sbtnApagarClick(Sender: TObject);
begin

//
//  inherited;

end;

procedure TFrmReverCotas.sbtnAltDetClick(Sender: TObject);
begin

  inherited;



  if qryDet.IsEmpty then
  begin
     sbtnAltDet.Down := false;
     exit;
  end;

////
end;

procedure TFrmReverCotas.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.sbtnConcedeUmClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeDetalheAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
//
//  If qry.State <> dsEdit Then
//     qry.Edit;

end;

procedure TFrmReverCotas.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
//
end;




 




procedure TFrmReverCotas.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmReverCotas.GravarEventoPrev(_query: TwwQuery;_EventoGerador:string); ///RN015

var
iIdEventoPrev: integer;
sIdEventoGerador: string;
sFlgEfetivado,sDataEfetivado ,sFlgSitFuncImed,sFlgSitPartImed,sFlgSitPlanoImed: string;
sIDSITFUNC,sIDSITPART ,sIDSITPLANOPREV: string;

begin


end;

procedure TFrmReverCotas.Criar_temp(_query: TwwQuery);
begin

      If not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;



end;

procedure TFrmReverCotas.Gravar_temp_log(_msgerro,_msgoracle:string);
var
  _query: TwwQuery;
begin



_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';


_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into CM.LOGREVERSAO ');
_query.sql.Add('  (  ');
//_query.sql.Add('  IDBENEFHABILITA, ');
_query.sql.Add('  matricula, ');
_query.sql.Add('  nome, ');
_query.sql.Add('  msgerro , ');
_query.sql.Add('  msgerrooracle ');
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');
_query.sql.Add(' '+#39+qryDet.fieldbyname('MATRÍCULA').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('TITULAR').text+#39+',');
_query.sql.Add(' '+#39+_msgerro+#39+',');
_query.sql.Add(' '+#39+_msgoracle+#39);

_query.sql.Add('  )  ');
try
_query.ExecSQL;
except
  end;

_query.Destroy;

end;

procedure TFrmReverCotas.FormShow(Sender: TObject);
begin
inherited;
pnl_impressao.SendToBack;
pnl1.SendToBack;
end;


procedure TFrmReverCotas.Button2Click(Sender: TObject);
begin
if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='N';
     qryDet.post;
     qryDet.Next;
     end;
    end;
end;

procedure TFrmReverCotas.qryDet1AfterOpen(DataSet: TDataSet);
begin
//  inherited;
lbl_listados.caption:=inttostr(qryDet.recordcount)+' Listados';
end;

procedure TFrmReverCotas.bbtnSelTudoClick(Sender: TObject);
begin
  inherited;
if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='S';
     qryDet.post;
     qryDet.Next;
     end;
    end;

end;

procedure TFrmReverCotas.bbtnInverteClick(Sender: TObject);
begin
  inherited;
if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='N';
     qryDet.post;
     qryDet.Next;
     end;
    end;

end;

procedure TFrmReverCotas.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 // inherited;

end;

procedure TFrmReverCotas.Deletar_temp_log();
var
  _query:TwwQuery;
begin

_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;
_query.SQL.clear;


_query.Close;
_query.sql.Clear;
_query.sql.Add('Delete from CM.LOGREVERSAO ');
_query.ExecSQL;

_query.Close;
_query.Destroy;

end;

procedure TFrmReverCotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
inherited;
Deletar_temp_log;
end;

procedure TFrmReverCotas.FormActivate(Sender: TObject);
begin
  inherited;
//Deletar_temp_log(qry2);
end;

procedure TFrmReverCotas.QryGrid();
begin




QRYDET.CLOSE;
QRYDET.SQL.CLEAR;


QRYDET.SQL.Add('SELECT ''N'' SELECIONADO,');
QRYDET.SQL.Add('       DPT.MATRICULA AS "MATRÍCULA DO BENEFICIÁRIO",');
QRYDET.SQL.Add('       DP.MATRICULA AS "MATRÍCULA",');
QRYDET.SQL.Add('       PT.NOME AS "TITULAR",');
QRYDET.SQL.Add('       B.NOME AS "TIPO DE BENEFÍCIO",');
QRYDET.SQL.Add('       BF.IDBENEFICIO,');
QRYDET.SQL.Add('       P.NOME AS "BENEFICIÁRIO",');
QRYDET.SQL.Add('       PF.DATAMORTE AS "DATA FALECIMENTO",');
QRYDET.SQL.Add('       BF.VALORATUAL AS "VALOR ATUAL",');
QRYDET.SQL.Add('       BF.VALORTOTAL AS "VALOR TOTAL",');
QRYDET.SQL.Add('       BF.DATAFINAL AS "DATA ENCERRAMENTO",');
QRYDET.SQL.Add('       BF.DATAINICIO,');
QRYDET.SQL.Add('       BTT.PERCENTUAL AS "PERCENTUAL ATUAL",');
QRYDET.SQL.Add('       BF.NUMEROPROCESSO,');
QRYDET.SQL.Add('       BF.IDTITULAR,');
QRYDET.SQL.Add('       BF.IDPESSOA,');
QRYDET.SQL.Add('       BF.IDPLANOORIGEM,');
QRYDET.SQL.Add('       BF.SEQPROPOSTA,');
QRYDET.SQL.Add('       BF.IDPESSJUR,');
QRYDET.SQL.Add('       BF.FontePagadora,');
QRYDET.SQL.Add('       BF.VALORBASE1,');
QRYDET.SQL.Add('       BF.VALORBASE2,');
QRYDET.SQL.Add('       BF.VALORBASE3,');
QRYDET.SQL.Add('       BF.DATAINICIOFUND,');
QRYDET.SQL.Add('       BF.IDPLANOPREV,');

QRYDET.SQL.Add('       BF.DATAENCERRAMENTO AS "DATAENCERRAMENTO1",');  // Andre Imakawa - SIG 51180
QRYDET.SQL.Add('       BF.DATAFINAL AS "DATAFINAL1",');  // Andre Imakawa - SIG 51180

QRYDET.SQL.Add('       trunc(BTT.PERCENTUAL,2) PBTT,');
//QRYDET.SQL.Add('(SELECT TRUNC(ROUND(100/COUNT(DISTINCT BF2.idpessoa),4),2) ');
QRYDET.SQL.Add('(SELECT TRUNC(ROUND(100/decode(COUNT(DISTINCT BF2.idpessoa),0,1,COUNT(DISTINCT BF2.idpessoa)),4),2) '); // SOL 230386 KTN 352517
QRYDET.SQL.Add('FROM BENEFBFCIARIO BF2');
QRYDET.SQL.Add('WHERE BF2.IDTPPAGTOBENEFIC = 1 AND');
QRYDET.SQL.Add('      BF2.FONTEPAGADORA = BF.FONTEPAGADORA AND');
QRYDET.SQL.Add('      BF2.IDPESSJUR = BF.IDPESSJUR AND');
QRYDET.SQL.Add('      ((BF.IDPLANOPREV IN (2,66) AND BF2.IDPLANOPREV IN (2,66)) OR (BF2.IDPLANOPREV = BF.IDPLANOPREV)) AND');
QRYDET.SQL.Add('      BF2.IDPESSOA <> BF2.IDTITULAR AND');
QRYDET.SQL.Add('      BF2.IDTITULAR = BF.IDTITULAR AND');
QRYDET.SQL.Add('      BF2.DATAINICIO <= BF.DATAFINAL AND');
QRYDET.SQL.Add('      NVL(BF2.DATAFINAL,BF.DATAFINAL) >= BF.DATAFINAL)PT1');

QRYDET.SQL.Add('  FROM BENEFBFCIARIO BF');
QRYDET.SQL.Add('       JOIN PESSOA PT ON BF.IDTITULAR = PT.IDPESSOA');
QRYDET.SQL.Add('       JOIN PESSOA P ON BF.IDPESSOA = P.IDPESSOA');///douglas.siqueira 212299
QRYDET.SQL.Add('       JOIN PESSOAFISICA PF ON BF.IDPESSOA = PF.IDPESSOA');
QRYDET.SQL.Add('       JOIN BENEFICIO B ON BF.IDBENEFICIO = B.IDBENEFICIO');
QRYDET.SQL.Add('       JOIN DEPENTIT DPT ON DPT.IDTITULAR = BF.IDTITULAR AND');
QRYDET.SQL.Add('                            DPT.IDPESSOA = BF.IDTITULAR');
QRYDET.SQL.Add('       JOIN DEPENTIT DP ON BF.IDPESSOA = DP.IDPESSOA and');
QRYDET.SQL.Add('                           bF.idtitular = dp.idtitular');
QRYDET.SQL.Add('       JOIN bfciariotitplan btt ON btt.IDPESSJUR = bF.idpessjur AND');
QRYDET.SQL.Add('                                   btt.IDTITULAR = bF.idtitular AND');
QRYDET.SQL.Add('                                   btt.IDPLANOORIGEM = bF.idplanoorigem AND');
QRYDET.SQL.Add('                                   btt.IDPESSOA = bF.idpessoa AND');
QRYDET.SQL.Add('                                   btt.SEQPROPOSTA = bF.seqproposta AND');
QRYDET.SQL.Add('                                   btt.IDPLANOPREV = bF.idplanoprev AND');
QRYDET.SQL.Add('                                   btt.IDBENEFICIO = bF.idbeneficio');
//QRYDET.SQL.Add('WHERE BF.IDSITBENEFICIO in (1,2) AND');   //William Santana - SIG 19776
QRYDET.SQL.Add('  WHERE ');                                 //William Santana - SIG 19776
QRYDET.SQL.Add('      BF.IDTPPAGTOBENEFIC = 1 ');
QRYDET.SQL.Add('  AND BF.IDPESSOA <> BF.IDTITULAR ');//Helio - SOL Nº 253577/17666 PPM Nº 1019935



case rd_filtro.itemindex of
0:begin
  QRYDET.SQL.Add('  AND BF.IDSITBENEFICIO in (1,2) ');   //William Santana - SIG 19776
  QRYDET.SQL.Add('  AND BF.DATAFINAL BETWEEN '+#39+'01'+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39+' AND '+#39+formatfloat('00',TrazUltDiaMes(strtoint(copy(ME_anomes.text,6,2)),strtoint(copy(ME_anomes.text,1,4))))+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39);
  end;

1:begin
        QRYDET.SQL.Add(' AND BF.IDSITBENEFICIO = 3 ');   //William Santana - SIG 19776
        QRYDET.SQL.ADD(' AND BF.DATAENCERRAMENTO BETWEEN '+#39+'01'+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39+' AND '+#39+formatfloat('00',TrazUltDiaMes(strtoint(copy(ME_anomes.text,6,2)),strtoint(copy(ME_anomes.text,1,4))))+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39);
        //Willliam Moreira da Silva - SIG 43619
        QRYDET.SQL.Add(' AND NOT EXISTS (SELECT 1 FROM MOVBENEF MOV ');
        QRYDET.SQL.Add('         WHERE MOV.IDPESSOA       = BF.IDPESSOA ');
        QRYDET.SQL.Add('         AND   MOV.IDTITULAR      = BF.IDTITULAR ');
        QRYDET.SQL.Add('         AND   MOV.IDPESSJUR      = BF.IDPESSJUR ');
        QRYDET.SQL.Add('         AND   MOV.IDPLANOPREV    = BF.IDPLANOPREV ');
        QRYDET.SQL.Add('         AND   MOV.IDPLANOORIGEM  = BF.IDPLANOORIGEM ');
        QRYDET.SQL.Add('         AND   MOV.IDBENEFICIO    = BF.IDBENEFICIO ');
        QRYDET.SQL.Add('         AND   MOV.NUMEROPROCESSO = BF.NUMEROPROCESSO ');
        QRYDET.SQL.Add('         AND   MOV.TIPOMOV        = 16) ');
        //William Moreira da Silva - SIG 43619
  end;

end;



QRYDET.SQL.Add('ORDER BY 2,3');
QRYDET.OPEN;


end;

function TFrmReverCotas.VerificaMaioridade( _idtitular,
  _idplanoprev, _idbeneficio,_idpessoa: string): boolean;
var
_query:TwwQuery;
begin
//

_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;

_query.sql.Clear;
_query.SQL.Append('SELECT DATAFINAL FROM BENEFBFCIARIO');
_query.SQL.Append('WHERE');
_query.SQL.Append('IDTITULAR = '+#39+_idtitular+#39);
_query.SQL.Append(' AND IDPLANOPREV = '+#39+_idplanoprev+#39);
_query.SQL.Append(' AND IDBENEFICIO = '+#39+_idbeneficio+#39);
_query.SQL.Append(' AND IDPESSOA = '+#39+_idpessoa+#39);

_query.SQL.Append(' AND DATAFINAL BETWEEN '+#39+'01'+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39+' AND '+#39+formatfloat('00',TrazUltDiaMes(strtoint(copy(ME_anomes.text,6,2)),strtoint(copy(ME_anomes.text,1,4))))+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39);

//William Moreira da Silva - SIG 43619
//_query.SQL.Append(' AND IDSITBENEFICIO in (1,2)');
_query.SQL.Append(' AND IDSITBENEFICIO in (1,2,3)');
//William Moreira da Silva - SIG 43619

_query.Active:=TRUE;
if not _query.IsEmpty then
    result:=TRUE
else
    result:=FALSE;
    
_query.Active:=FALSE;
_query.Destroy;
                       ///
end;

procedure TFrmReverCotas.ProcessaReversao;
var
maior,morte,encerrado,bErro:boolean;
_query:TwwQuery;
_query2:TwwQuery;
_query3:TwwQuery;
_query4:TwwQuery;
_query5:TwwQuery;
_queryX:TwwQuery;
contReg,cont,ind:integer;
valorRat,percRat,sobraRat,rValorAbono,rValorAbonoJaPago,VALORATUALANT,vlinss,PercAnterior:double;
datapagamento,dataref,datareftela,datapreparo,sMsgErro:string;//douglas.siqueira 212299
iIdCalculoGeral:LongInt;
datafinal_movbenef,Valoratual_antec:string;
//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
ValorRatBS,
ValorRatFAB,
ValorRatDefict,
rVlrBSAbono,
rVlrFABAbono,
rValorBaseDeficitAbono : Double;
strVlrBSRevertido,
strVlrFABRevertido,
strVlrBaseDeficitRevertido,
strVlrBSAbono,
strVlrFABAbono,
strValorBaseDeficitAbono,
sSQLBenefAssoc : String;
percVlrASerPg : Double;
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
rValorAbono_aux: double; // Andre Imakawa - SIG 45005/45579
datafinal_percgrupo:string; // Andre Imakawa - SIG 51180
begin

  _query2:=TwwQuery.Create(Self);
  _query2.DataBaseName := 'BaseDados';


  _query3:=TwwQuery.Create(Self);
  _query3.DataBaseName := 'BaseDados';


  _query4:=TwwQuery.Create(Self);
  _query4.DataBaseName := 'BaseDados';

  _query5:=TwwQuery.Create(Self);
  _query5.DataBaseName := 'BaseDados';


  _queryX:=TwwQuery.Create(Self);
  _queryX.DataBaseName := 'BaseDados';


  _query2.CLOSE;
  _query2.SQL.CLEAR;
  _query2.SQL.ADD('select idmotivoquitacao from paramaprev');
  _query2.OPEN;


  _query3.close;
  _query3.SQL.Clear;
  _query3.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc,datapreparo from ctrlinterface');//douglas.siqueira 212299
  _query3.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
  _query3.open;


  datapagamento:=_query3.fieldbyname('datapagamento').text;
  dataref:=_query3.fieldbyname('mesreferencia').text;
  datareftela:=ME_anomes.Text;
  datapreparo:=datapagamento;//douglas.siqueira 212299


  _query:=TwwQuery.Create(Self);
  _query.DataBaseName := 'BaseDados';


  ///query do grupo familiar.
  _query.Active:=false;
  _query.SQL.Clear;


  _query.SQL.Add('SELECT *            ');
  _query.SQL.Add('FROM BENEFBFCIARIO BF');
  _query.SQL.Add('WHERE BF.IDTPPAGTOBENEFIC = 1 AND');
 //William Moreira da Silva - SIG 43619
  _query.SQL.Add('      BF.IDSITBENEFICIO in (1,2, 3) AND');
  //_query.SQL.Add('      BF.IDSITBENEFICIO in (1,2) AND');
  //William Moreira da Silva - SIG 43619
  _query.SQL.Add('      BF.IDPESSOA <> BF.IDTITULAR AND');
  _query.SQL.Add('      BF.FONTEPAGADORA =  '+qryDet.fieldbyname('FONTEPAGADORA').text);
  _query.SQL.Add('    AND  BF.IDPESSJUR =  '+qryDet.fieldbyname('IDPESSJUR').text);
  _query.SQL.Add('   AND   (( '+qryDet.fieldbyname('IDPLANOPREV').text+'  IN (2,66) AND BF.IDPLANOPREV IN (2,66)) OR (BF.IDPLANOPREV ='+qryDet.fieldbyname('IDPLANOPREV').text+' )) ');
  _query.SQL.Add('   AND   BF.IDTITULAR =  '+qryDet.fieldbyname('IDTITULAR').text);
  _query.SQL.Add('   AND   BF.IDBENEFICIO =  '+qryDet.fieldbyname('IDBENEFICIO').text);   //edilaine SIG134915
  _query.Active:=true;

  _query.First;
  encerrado:=false;
  ///primeiro while irá atualizar a IDSITBENEFICIO de 1 para 3
  while not _query.eof do
  begin

     ////será chamado pelo while para cada registro


     maior:=VerificaMaioridade(_query.fieldbyname('idtitular').text,_query.fieldbyname('idplanoprev').text,_query.fieldbyname('idbeneficio').text,_query.fieldbyname('idpessoa').text);
     morte:=VerificaMorte(_query.fieldbyname('idtitular').text,_query.fieldbyname('idplanoprev').text,_query.fieldbyname('idbeneficio').text,_query.fieldbyname('idpessoa').text);

     if maior or morte then
     begin


        _query4.Close;
        _query4.SQL.Clear;

        _query4.SQL.Append('SELECT FLGABONOFINALBEN, FLGPOSSUIABONO, IDREGRACALCABONO ');
        _query4.SQL.Append(' FROM   BENEFPLANPREV ');
        _query4.SQL.Append(' WHERE  IDBENEFICIO = '+_query.fieldbyname('IDBENEFICIO').text);
        _query4.SQL.Append(' AND    IDPLANOPREV = '+_query.fieldbyname('IDPLANOPREV').text);


        _query4.open;
        rValorAbono:=0;
        rValorAbonoJaPago:=0;
        rValorAbono_aux:=0; // Andre Imakawa - SIG 45005/45579
        if not _query4.IsEmpty then///paga abono
        begin
            //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
            if (_query.fieldbyname('VLRBSATUAL').AsString = '') Or
               (_query.fieldbyname('VLRBSTOTAL').AsString = '') then
                    strVlrBSAbono := _query.fieldbyname('VLRBSATUAL').AsString
            else
            begin
                    rVlrBSAbono :=  ExecutaRegraValorAbono( qryAux,
                                                         strtoint(_query4.fieldbyname('IDREGRACALCABONO').text),
                                                         strtoint(_query.fieldbyname('IDPESSJUR').text),
                                                         strtoint(_query.fieldbyname('IDPLANOPREV').text),
                                                         strtoint(_query.fieldbyname('IDTITULAR').text),
                                                         strtoint(_query.fieldbyname('SEQPROPOSTA').text),
                                                         strtoint(_query.fieldbyname('IDPESSOA').text),
                                                         strtoint(_query.fieldbyname('IDBENEFICIO').text),
                                                         _query.fieldbyname('DATAINICIO').text,
                                                         _query.fieldbyname('DATAFINAL').text,
                                                         datareftela,
                                                         _query.fieldbyname('VLRBSATUAL').Value,
                                                         _query.fieldbyname('FLGPROVISORIO').Text,
                                                          bErro,
                                                          sMsgErro,
                                                          iIdCalculoGeral,
                                                          3, contReg,
                                                          '',
                                                          _query.fieldbyname('VLRBSTOTAL').value );
                    strVlrBSAbono := FloatToStr(rVlrBSAbono);
            end;

            if (_query.fieldbyname('VLRFABATUAL').AsString = '') Or
               (_query.fieldbyname('VLRFABTOTAL').AsString = '') then
                    strVlrFABAbono := _query.fieldbyname('VLRFABATUAL').AsString
            else
            begin
                    rVlrFABAbono :=  ExecutaRegraValorAbono( qryAux,
                                                 strtoint(_query4.fieldbyname('IDREGRACALCABONO').text),
                                                 strtoint(_query.fieldbyname('IDPESSJUR').text),
                                                 strtoint(_query.fieldbyname('IDPLANOPREV').text),
                                                 strtoint(_query.fieldbyname('IDTITULAR').text),
                                                 strtoint(_query.fieldbyname('SEQPROPOSTA').text),
                                                 strtoint(_query.fieldbyname('IDPESSOA').text),
                                                 strtoint(_query.fieldbyname('IDBENEFICIO').text),
                                                 _query.fieldbyname('DATAINICIO').text,
                                                 _query.fieldbyname('DATAFINAL').text,
                                                 datareftela,
                                                 _query.fieldbyname('VLRFABATUAL').Value,
                                                 _query.fieldbyname('FLGPROVISORIO').Text,
                                                  bErro,
                                                  sMsgErro,
                                                  iIdCalculoGeral,
                                                  3, contReg,
                                                  '',
                                                  _query.fieldbyname('VLRFABTOTAL').value );
                    strVlrFABAbono := FloatToStr(rVlrFABAbono);
            end;


            if (_query.fieldbyname('VLRBASEDEFICIT').AsString = '') then
                    strValorBaseDeficitAbono := _query.fieldbyname('VLRBASEDEFICIT').AsString
            else
            Begin
                    rValorBaseDeficitAbono :=  ExecutaRegraValorAbono( qryAux,
                                                 strtoint(_query4.fieldbyname('IDREGRACALCABONO').text),
                                                 strtoint(_query.fieldbyname('IDPESSJUR').text),
                                                 strtoint(_query.fieldbyname('IDPLANOPREV').text),
                                                 strtoint(_query.fieldbyname('IDTITULAR').text),
                                                 strtoint(_query.fieldbyname('SEQPROPOSTA').text),
                                                 strtoint(_query.fieldbyname('IDPESSOA').text),
                                                 strtoint(_query.fieldbyname('IDBENEFICIO').text),
                                                 _query.fieldbyname('DATAINICIO').text,
                                                 _query.fieldbyname('DATAFINAL').text,
                                                 datareftela,
                                                 _query.fieldbyname('VLRBASEDEFICIT').Value,
                                                 _query.fieldbyname('FLGPROVISORIO').Text,
                                                  bErro,
                                                  sMsgErro,
                                                  iIdCalculoGeral,
                                                  3, contReg,
                                                  _query.fieldbyname('VALORTOTAL').value);
                    strValorBaseDeficitAbono := FloatToStr(rValorBaseDeficitAbono);
            end;
            //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

            rValorAbono :=  ExecutaRegraValorAbono( qryAux,
                                                 strtoint(_query4.fieldbyname('IDREGRACALCABONO').text),
                                                 strtoint(_query.fieldbyname('IDPESSJUR').text),
                                                 strtoint(_query.fieldbyname('IDPLANOPREV').text),
                                                 strtoint(_query.fieldbyname('IDTITULAR').text),
                                                 strtoint(_query.fieldbyname('SEQPROPOSTA').text),
                                                 strtoint(_query.fieldbyname('IDPESSOA').text),
                                                 strtoint(_query.fieldbyname('IDBENEFICIO').text),
                                                 _query.fieldbyname('DATAINICIO').text,
                                                 _query.fieldbyname('DATAFINAL').text,
                                                 datareftela,
                                                 _query.fieldbyname('VALORATUAL').value,
                                                 _query.fieldbyname('FLGPROVISORIO').Text,
                                                  bErro,
                                                  sMsgErro,
                                                  iIdCalculoGeral,
                                                  3, contReg,
                                                  '',
                                                  _query.fieldbyname('VALORTOTAL').value );

            rValorAbono_aux:= rValorAbono; // Andre Imakawa - SIG 45005/45579

            percVlrASerPg := rValorAbono/(_query.fieldbyname('VALORTOTAL').AsFloat/100); //Helio - SOL Nº 253577/17666 PPM Nº 1019935

            _query5.Close;
            _query5.SQL.Clear;

            _query5.SQl.Add(' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-VLBENEFPGTO,VLBENEFPGTO)) AS VLBENEFPGTO, '+
                            //edilaine - SIG33727 - inicio
                            '        MAX(NVL(VALORBS,-1))  AS VALORBS,             '+
                            '        MAX(NVL(VALORFAB,-1)) AS VALORFAB,            '+
                            '        MAX(NVL(VLRBASEDEFICIT,-1)) AS VLRBASEDEFICIT '+
                            //edilaine - SIG33727 - fim
                            ' FROM   HSTBENEFBFCIARIO '+
                            ' WHERE  (IDPESSOA       = '+_query.fieldbyname('IDPESSOA').text      +')'+
                            ' AND    (MESREFERENCIA  = '''+Copy(datareftela,1,4)+'/13'+''')'+
                            ' AND    (IDBENEFICIO    = '+_query.fieldbyname('IDBENEFICIO').text+')'+
                            ' AND    (NVL(VLBENEFPGTO,0) > 0 )'+         //edilaine - SIG33727
                            ' AND    (NUMEROPROCESSO = '+ _query.fieldbyname('NUMEROPROCESSO').text+')');
           _query5.Open;
           if not _query5.IsEmpty then///abono já pago
           //edilaine - SIG33727 - inicio
           begin
              rValorAbonoJaPago:=_query5.FieldByName('VLBENEFPGTO').AsFloat;

              if (rValorAbono > 0) and (abs(rValorAbonoJaPago) > 0) and (rValorAbono-rValorAbonoJaPago <> 0) then
                 AjustaAbonoPago( _query, datapagamento,
                                  _query5.FieldByName('VALORBS').AsString,
                                  _query5.FieldByName('VALORFAB').AsString,
                                  _query5.FieldByName('VLRBASEDEFICIT').AsString,
                                  rValorAbonoJaPago );

           end
           //edilaine - SIG33727 - fim
           else
              rValorAbonoJaPago:=0;

           if rValorAbono > 0 then
              rValorAbono:=rValorAbono - rValorAbonoJaPago;


        end;

        encerrado:=true;



         //query do grupo familiar.
        _queryX.close;
        _queryX.SQL.Clear;
        _queryX.SQL.Add('SELECT count(*)contador FROM BENEFBFCIARIO bF');
        _queryX.SQL.Add('  JOIN bfciariotitplan btt ON btt.IDPESSJUR = bF.idpessjur AND');
        _queryX.SQL.Add('                              btt.IDTITULAR = bF.idtitular AND');
        _queryX.SQL.Add('                              btt.IDPLANOORIGEM = bF.idplanoorigem AND');
        _queryX.SQL.Add('                              btt.IDPESSOA = bF.idpessoa AND');
        _queryX.SQL.Add('                              btt.SEQPROPOSTA = bF.seqproposta AND');
        _queryX.SQL.Add('                              btt.IDPLANOPREV = bF.idplanoprev AND');
        _queryX.SQL.Add('                              btt.IDBENEFICIO = bF.idbeneficio');
        _queryX.SQL.Add('WHERE');
        _queryX.SQL.Add('bF.IDTITULAR = '+_query.fieldbyname('IDTITULAR').text);
        _queryX.SQL.Add(' AND bF.IDPLANOPREV = '+_query.fieldbyname('IDPLANOPREV').text);
        _queryX.SQL.Add(' AND bF.IDBENEFICIO = '+_query.fieldbyname('IDBENEFICIO').text);
        _queryX.SQL.Add(' AND bF.IDSITBENEFICIO in (1,2)');
        _queryX.Open;
        //_queryX.first;
        contReg:=0;
        contReg:=_queryX.fields[0].value;

        datafinal_movbenef:='';

        if   trim(_query.fieldbyname('DATAFINAL').text)='' then
           datafinal_movbenef:=_query.fieldbyname('DATAENCERRAMENTO').text
        else
          datafinal_movbenef:=_query.fieldbyname('DATAFINAL').text;


          Valoratual_antec:=floattostr(_query.fieldbyname('VALORATUAL').value);
          GravarMovBenef('0',
                         '0',
                         '',
                         //_query.fieldbyname('DATAFINAL').text,
                         datafinal_movbenef,
                         '4',
                         _query.fieldbyname('IDPESSJUR').text,
                         _query.fieldbyname('IDTITULAR').text,
                         _query.fieldbyname('IDPESSOA').text,
                         _query.fieldbyname('SEQPROPOSTA').text,
                         _query.fieldbyname('IDPLANOPREV').text,
                         _query.fieldbyname('IDBENEFICIO').text,
                         _query.fieldbyname('NUMEROPROCESSO').text,datafinal_movbenef,Valoratual_antec
                         );



          if rValorAbono<>0 then
          begin

             GravarHSTBENEFBFCIARIO('B',
                                    '3056',
                                    '1',  {0}  //edilaine - SIG33727
                                    '1',
                                    datapagamento,
                                    Copy(datareftela,1,4)+'/13',
                                    floattostr(rValorAbono),


                                    floattostr(GetPercMes(FloatToStr(_query.fieldbyname('VALORTOTAL').value),
                                                GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                                   _query.fieldbyname('IDTITULAR').text,
                                                   _query.fieldbyname('IDPLANOORIGEM').text,
                                                   _query.fieldbyname('IDPESSOA').text,
                                                   _query.fieldbyname('SEQPROPOSTA').text,
                                                   _query.fieldbyname('IDPLANOPREV').text,
                                                   _query.fieldbyname('IDBENEFICIO').text),
                                    floattostr(percrat+sobrarat),datafinal_movbenef)),

                                    _query.fieldbyname('DataInicio').text,
                                    _query.fieldbyname('DataFinal').text,
                                    _query.fieldbyname('IDPESSJUR').text,
                                    _query.fieldbyname('IDTITULAR').text,
                                    _query.fieldbyname('IDPESSOA').text,
                                    _query.fieldbyname('SEQPROPOSTA').text,
                                    _query.fieldbyname('IDPLANOPREV').text,
                                    _query.fieldbyname('IDBENEFICIO').text,
                                    _query.fieldbyname('NUMEROPROCESSO').text,
                                    _query.fieldbyname('FONTEPAGADORA').text,
                                    //_query.fieldbyname('VALORTOTAL').text,       // Andre Imakawa - SIG 45005/45579
                                    FloatToStr(rValorAbono_aux),                   // Andre Imakawa - SIG 45005/45579
                                    _query.fieldbyname('IDPLANOORIGEM').text,
                                    _query.fieldbyname('IDSITBENEFICIO').text,

                                    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                    _query.fieldbyname('VALORATUAL').AsString,
                                    strVlrBSAbono,
                                    strVlrFABAbono,
                                    strValorBaseDeficitAbono
                                    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

                                    , _query.fieldbyname('IDPERFILINVEST').text    //edilaine - SIG55933

                                    );


             if _query.fieldbyname('FONTEPAGADORA').text <> '2' then
             begin

              //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
            //if BEncerrado(_query.fieldbyname('DataFinal').AsString, ME_anomes.text) then
            //      percVlrASerPg := -2;

              bErro := ExecutaSP_PreparoContribuicao(_query.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                     _query.fieldbyname('IDTITULAR').AsInteger,
                                                     3056,
                                                     iIdLoteConcessao,
                                                     '0',
                                                     Copy(datapagamento, 7,4)+'/'+Copy(datapagamento, 4,2),
                                                     Copy(datareftela,1,4)+'/13',
                                                     -1,
                                                     _query.fieldbyname('IDPESSOA').AsInteger, 16//-1);//percVlrASerPg);  // edilaine - SOL 253577-17664 / PPM 1019932
                                                     , '', 1);  //edilaine - SIG33727

                {GravarHSTCONTRIBPREV(_query.fieldbyname('IDTITULAR').text,
                               '3056',
                               _query.fieldbyname('DATAFINAL').text,
                               _query.fieldbyname('DATAINICIO').text,
                               _query.fieldbyname('IDPLANOPREV').text,
                               _query.fieldbyname('IDPESSJUR').text,
                               _query.fieldbyname('SEQPROPOSTA').text,
                               _query.fieldbyname('IDPESSOA').text,
                               _query.fieldbyname('IDBENEFICIO').texT,
                               _query.fieldbyname('NUMEROPROCESSO').text,
                               _query.fieldbyname('DATAENCERRAMENTO').text,
                              // datareftela,
                                Copy(datareftela,1,4)+'/13',
                               _query.fieldbyname('IDPLANOORIGEM').text,
                               datapreparo//douglas.siqueira 212299
                               );}
                //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

             end;


          end;
          begin

             ValorRat:=0;
             percRat:=0;
             sobraRat:=0;
             PercAnterior:=0;



             ///rateio
             if contReg>1 then
             begin
                percRat:=strtofloat(formatfloat('0.0000',100/contReg));
                if (percrat*contReg)<100 then
                begin
                     sobraRat:=100-(percrat*contReg);
                end;
             end
             else
                percRat:=100;


             rValorAbono:=0;///zerando abono
             VALORATUALANT:=0;
             _queryX.Close;
             _queryX.SQL.clear;
             _queryX.SQL.Add('SELECT VALORATUALANT FROM MOVBENEF');
             _queryX.SQL.Add('WHERE  IDTITULAR ='+_query.fieldbyname('IDTITULAR').text);
             _queryX.SQL.Add(' AND IDPESSOA ='+_query.fieldbyname('IDPESSOA').text);
             _queryX.SQL.Add(' AND IDPLANOPREV ='+_query.fieldbyname('IDPLANOPREV').text);
             _queryX.SQL.Add(' AND IDBENEFICIO ='+_query.fieldbyname('IDBENEFICIO').text);
             _queryX.Open;

             if _queryX.fieldbyname('VALORATUALANT').value>0 then
                VALORATUALANT:=_queryX.fieldbyname('VALORATUALANT').value
             else
                VALORATUALANT:= 0 ;

              _queryX.Close;

              //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
              strVlrBSRevertido  := '';
              strVlrFABRevertido := '';
              strVlrBaseDeficitRevertido := '';

              if _query.fieldbyname('VLRBSATUAL').AsString <> '' then
              strVlrBSRevertido := floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VLRBSATUAL').Value+rValorAbono),_query.fieldbyname('VLRBSATUAL').value,
                                                 GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                                    _query.fieldbyname('IDTITULAR').text,
                                                    _query.fieldbyname('IDPLANOORIGEM').text,
                                                    _query.fieldbyname('IDPESSOA').text,
                                                    _query.fieldbyname('SEQPROPOSTA').text,
                                                    _query.fieldbyname('IDPLANOPREV').text,
                                                    _query.fieldbyname('IDBENEFICIO').text),
                                     '0',datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                     _query.fieldbyname('IDPLANPREVCONTAB').AsInteger));

              if _query.fieldbyname('VLRFABATUAL').AsString <> '' then
              strVlrFABRevertido := floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VLRFABATUAL').value+rValorAbono),_query.fieldbyname('VLRFABATUAL').value,
                                                 GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                                    _query.fieldbyname('IDTITULAR').text,
                                                    _query.fieldbyname('IDPLANOORIGEM').text,
                                                    _query.fieldbyname('IDPESSOA').text,
                                                    _query.fieldbyname('SEQPROPOSTA').text,
                                                    _query.fieldbyname('IDPLANOPREV').text,
                                                    _query.fieldbyname('IDBENEFICIO').text),
                                     '0',datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                     _query.fieldbyname('IDPLANPREVCONTAB').AsInteger));

              if _query.fieldbyname('VLRBASEDEFICIT').AsString <> '' then
              strVlrBaseDeficitRevertido := floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VLRBASEDEFICIT').value+rValorAbono),_query.fieldbyname('VLRBASEDEFICIT').value,
                                                 GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                                    _query.fieldbyname('IDTITULAR').text,
                                                    _query.fieldbyname('IDPLANOORIGEM').text,
                                                    _query.fieldbyname('IDPESSOA').text,
                                                    _query.fieldbyname('SEQPROPOSTA').text,
                                                    _query.fieldbyname('IDPLANOPREV').text,
                                                    _query.fieldbyname('IDBENEFICIO').text),
                                     '0',datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                     _query.fieldbyname('IDPLANPREVCONTAB').AsInteger));
              //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

              GravarHSTBENEFBFCIARIO('B',
                                    '3056',
                                    '0',
                                     '1',
                                     datapagamento,
                                     datareftela,
                                     floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VALORATUAL').value+rValorAbono),_query.fieldbyname('VALORATUAL').value,
                                                 GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                                    _query.fieldbyname('IDTITULAR').text,
                                                    _query.fieldbyname('IDPLANOORIGEM').text,
                                                    _query.fieldbyname('IDPESSOA').text,
                                                    _query.fieldbyname('SEQPROPOSTA').text,
                                                    _query.fieldbyname('IDPLANOPREV').text,
                                                    _query.fieldbyname('IDBENEFICIO').text),
                                     '0',datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                     _query.fieldbyname('IDPLANPREVCONTAB').AsInteger)), //Helio - SOL Nº 253577/17666 PPM Nº 1019935

                                     floattostr(GetPercMes(floattostr(_query.fieldbyname('VALORTOTAL').value),
                                                 GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                                    _query.fieldbyname('IDTITULAR').text,
                                                    _query.fieldbyname('IDPLANOORIGEM').text,
                                                    _query.fieldbyname('IDPESSOA').text,
                                                    _query.fieldbyname('SEQPROPOSTA').text,
                                                    _query.fieldbyname('IDPLANOPREV').text,
                                                    _query.fieldbyname('IDBENEFICIO').text),
                                     '0',datafinal_movbenef)),


                                    _query.fieldbyname('DataInicio').text,
                                    _query.fieldbyname('DataFinal').text,

                                    _query.fieldbyname('IDPESSJUR').text,
                                    _query.fieldbyname('IDTITULAR').text,
                                    _query.fieldbyname('IDPESSOA').text,
                                    _query.fieldbyname('SEQPROPOSTA').text,
                                    _query.fieldbyname('IDPLANOPREV').text,
                                    _query.fieldbyname('IDBENEFICIO').text,
                                    _query.fieldbyname('NUMEROPROCESSO').text,
                                    _query.fieldbyname('FONTEPAGADORA').text,
                                   _query.fieldbyname('VALORTOTAL').text,
                                   _query.fieldbyname('IDPLANOORIGEM').text,
                                   _query.fieldbyname('IDSITBENEFICIO').text,

                                   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                   _query.fieldbyname('VALORATUAL').AsString,
                                   strVlrBSRevertido,
                                   strVlrFABRevertido,
                                   strVlrBaseDeficitRevertido
                                   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

                                   , _query.fieldbyname('IDPERFILINVEST').text    //edilaine - SIG55933

                                   );

              //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
              AtualizarBfciarioTitPlan(0,
                                       _query.fieldbyname('IDPESSJUR').text,
                                       _query.fieldbyname('IDTITULAR').text,
                                       _query.fieldbyname('IDPLANOORIGEM').text,
                                       _query.fieldbyname('IDPESSOA').text,
                                       _query.fieldbyname('SEQPROPOSTA').text,
                                       _query.fieldbyname('IDPLANOPREV').text,
                                       _query.fieldbyname('IDBENEFICIO').text);     ///colocando 0 para o campo perc.
              //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

              if _query.fieldbyname('FONTEPAGADORA').text <> '2' then
              begin

              //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
            //if BEncerrado(_query.fieldbyname('DataFinal').AsString, ME_anomes.text) then
            //      percVlrASerPg := -2;

              bErro := ExecutaSP_PreparoContribuicao(_query.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                     _query.fieldbyname('IDTITULAR').AsInteger,
                                                     3056,
                                                     iIdLoteConcessao,
                                                     '0',
                                                     Copy(datapagamento, 7,4)+'/'+Copy(datapagamento, 4,2),
                                                     dataref,
                                                     percVlrASerPg,
                                                     _query.fieldbyname('IDPESSOA').AsInteger, 16);    // edilaine - SOL 253577-17664 / PPM 1019932

                {GravarHSTCONTRIBPREV(_query.fieldbyname('IDTITULAR').text,
                               '3056',
                               _query.fieldbyname('DATAFINAL').text,
                               _query.fieldbyname('DATAINICIO').text,
                               _query.fieldbyname('IDPLANOPREV').text,
                               _query.fieldbyname('IDPESSJUR').text,
                               _query.fieldbyname('SEQPROPOSTA').text,
                               _query.fieldbyname('IDPESSOA').text,
                               _query.fieldbyname('IDBENEFICIO').texT,
                               _query.fieldbyname('NUMEROPROCESSO').text,
                               _query.fieldbyname('DATAENCERRAMENTO').text,
                               datareftela,
                               _query.fieldbyname('IDPLANOORIGEM').text,
                               datapreparo//douglas.siqueira 212299
                               );}
                //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

              end;



              //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
              //tem que ser antes da chamada da ExecutaSP_PreparoContribuicao
              //ExecutaSP_PreparoContribuicao utiliza esse valor já atualizado
              {AtualizarBfciarioTitPlan(0,
                                       _query.fieldbyname('IDPESSJUR').text,
                                       _query.fieldbyname('IDTITULAR').text,
                                       _query.fieldbyname('IDPLANOORIGEM').text,
                                       _query.fieldbyname('IDPESSOA').text,
                                       _query.fieldbyname('SEQPROPOSTA').text,
                                       _query.fieldbyname('IDPLANOPREV').text,
                                       _query.fieldbyname('IDBENEFICIO').text);}     ///colocando 0 para o campo perc.
              //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

              qryDetalhe.Filtered:=False;
              qryDetalhe.Filter:='';
              qryDetalhe.Filter:='idtitular='+_query.fieldbyname('IDTITULAR').text +' and beneficio='+_query.FieldByName('IDBENEFICIO').Text +' and fontepagadora='+_query.FieldByName('FONTEPAGADORA').Text;
              qryDetalhe.Filtered:=True;
              qryDetalhe.Active:=True;
              qryDetalhe.First;
              if not qryDetalhe.IsEmpty then
              begin

                 qryDetalhe.Delete;
                 // Andre Imakawa - SIG 51180 - Inicio
                 {
                 if _query.fieldbyname('IDTPPAGTOBENEFIC').AsInteger = 1 then // Andre Imakawa - SIG 50047
                 GravaHstPercGrupo(0,
                                   _query.fieldbyname('IDPESSJUR').text,
                                   _query.fieldbyname('IDTITULAR').text,
                                   _query.fieldbyname('IDPLANOORIGEM').text,
                                   _query.fieldbyname('IDPESSOA').text,
                                   _query.fieldbyname('SEQPROPOSTA').text,
                                   _query.fieldbyname('IDPLANOPREV').text,
                                   _query.fieldbyname('IDBENEFICIO').text,
                                   _query.fieldbyname('FONTEPAGADORA').text,
                                   _query.fieldbyname('NUMEROPROCESSO').text,
                                   datafinal_movbenef //_query.fieldbyname('DATAFINAL').text //Peterson Victor - SIG49063
                                   );     ///colocando 0 para o campo perc.

                 }
                 // Andre Imakawa - SIG 51180 - Fim

              end;





              AtualzarBENEFBFCIARIO(0,
                                    '3',
                                    _query.fieldbyname('idtitular').text,
                                    _query.fieldbyname('idpessoa').text,
                                    _query.fieldbyname('idplanoprev').text,
                                    _query.fieldbyname('idbeneficio').text,'1',

                                    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                    ValorRatBS,
                                    ValorRatFAB,
                                    ValorRatDefict
                                    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

                                   );


              AtualizarProcessoBenef(_query.FieldByName('NUMEROPROCESSO').AsString,'3'); //Denis Horongoso - SIG68319


              if Ck_commit.Checked then
              begin
                If not dtmBaseDados.dbBaseDados.InTransaction Then
                   dtmBaseDados.dbBaseDados.StartTransaction;

                dtmBaseDados.dbBaseDados.Commit;
              end;




          end;
        end;

        _query.Next;
     end;

     if encerrado then
     begin
       rValorAbono:=0;
       rValorAbonoJaPago:=0;


       //query do grupo familiar.


       _queryX.close;
       _queryX.SQL.Clear;



       _queryX.SQL.Add('SELECT count(*)contador ');
       _queryX.SQL.Add('FROM BENEFBFCIARIO BF');
       _queryX.SQL.Add('WHERE BF.IDTPPAGTOBENEFIC = 1 AND');
       _queryX.SQL.Add('      BF.IDSITBENEFICIO in (1,2) AND');
       _queryX.SQL.Add('      BF.IDPESSOA <> BF.IDTITULAR AND');
       _queryX.SQL.Add('      BF.FONTEPAGADORA =  '+qryDet.fieldbyname('FONTEPAGADORA').text);
       _queryX.SQL.Add('    AND  BF.IDPESSJUR =  '+qryDet.fieldbyname('IDPESSJUR').text);
       _queryX.SQL.Add('   AND   (( '+qryDet.fieldbyname('IDPLANOPREV').text+'  IN (2,66) AND BF.IDPLANOPREV IN (2,66)) OR (BF.IDPLANOPREV ='+qryDet.fieldbyname('IDPLANOPREV').text+' )) ');
       _queryX.SQL.Add('   AND   BF.IDTITULAR =  '+qryDet.fieldbyname('IDTITULAR').text);
       _queryX.SQL.Add('   AND   BF.IDBENEFICIO = '+qryDet.fieldbyname('IDBENEFICIO').text);   //edilaine SIG134915




       _queryX.Open;
       contReg:=0;
       contReg:=_queryX.fields[0].value;



       _query.Active:=false;
       _query.SQL.Clear;


       _query.SQL.Add('SELECT *            ');
       _query.SQL.Add('FROM BENEFBFCIARIO BF');
       _query.SQL.Add('WHERE BF.IDTPPAGTOBENEFIC = 1 AND');
       _query.SQL.Add('      BF.IDSITBENEFICIO in (1,2) AND');
       _query.SQL.Add('      BF.IDPESSOA <> BF.IDTITULAR AND');
       _query.SQL.Add('      BF.FONTEPAGADORA =  '+qryDet.fieldbyname('FONTEPAGADORA').text);
       _query.SQL.Add('    AND  BF.IDPESSJUR =  '+qryDet.fieldbyname('IDPESSJUR').text);
       _query.SQL.Add('   AND   (( '+qryDet.fieldbyname('IDPLANOPREV').text+'  IN (2,66) AND BF.IDPLANOPREV IN (2,66)) OR (BF.IDPLANOPREV ='+qryDet.fieldbyname('IDPLANOPREV').text+' )) ');
       _query.SQL.Add('   AND   BF.IDTITULAR =  '+qryDet.fieldbyname('IDTITULAR').text);
       _query.SQL.Add('   AND   BF.IDBENEFICIO = '+qryDet.fieldbyname('IDBENEFICIO').text);   //edilaine SIG134915


       _query.Active:=true;
       _query.First;

       ValorRat:=0;
       percRat:=0;
       sobraRat:=0;


       ///rateio
       if contReg>1 then
       begin
          percRat:=strtofloat(formatfloat('0.0000',100/contReg));
             if (percrat*contReg)<100 then
                 begin
                   sobraRat:=100-(percrat*contReg);
                 end;
       end
       else
         percRat:=100;


       vlinss :=0 ;

       ///rateio

        //   if contReg>1 then
        //      begin
        //       _queryX.Active:=false;
        //       _queryX.SQL.Clear;
        //       _queryX.SQL.Add(' SELECT VALORTOTAL FROM BENEFBFCIARIO');
        //       _queryX.SQL.Add('WHERE IDPESSOA ='+_query.fieldbyname('IDPESSOA').text);
        //       _queryX.SQL.Add('AND FONTEPAGADORA = 2');
        //       _queryX.Active:=true;
        //
        //     //  if _queryX.fieldbyname('VALORTOTAL').value <> null then
        //    //       vlinss  :=    _queryX.fieldbyname('VALORTOTAL').value;
        //
        //        _queryX.Active:=false;
        //     end;
            ///segundo while irá fazer o rateio dos beneficiários restantes.
       cont:=1;
       _query.First;
       while not _query.eof do
       begin
          PercAnterior:=StrToFloat(GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                               _query.fieldbyname('IDTITULAR').text,
                                               _query.fieldbyname('IDPLANOORIGEM').text,
                                               _query.fieldbyname('IDPESSOA').text,
                                               _query.fieldbyname('SEQPROPOSTA').text,
                                               _query.fieldbyname('IDPLANOPREV').text,
                                               _query.fieldbyname('IDBENEFICIO').text));
          if (cont=1) and (sobraRat>0) then
          begin
             ///quando for 1 vai colocar a sobra no primeiro lancamento
             ValorRat:=(((percRat+sobraRat)/100)*(_query.fieldbyname('VALORATUAL').value/(PercAnterior/100)));


             //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
             ValorRatBS     :=(((percRat+sobraRat)/100)*(_query.fieldbyname('VLRBSATUAL').AsFloat/(PercAnterior/100)));
             ValorRatFAB    :=(((percRat+sobraRat)/100)*(_query.fieldbyname('VLRFABATUAL').AsFloat/(PercAnterior/100)));
             ValorRatDefict :=(((percRat+sobraRat)/100)*(_query.fieldbyname('VALORATUAL').AsFloat/(PercAnterior/100)));
             //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

             sobraRat:=0;

          end
          else
          begin
              ///so faz a atualizacao normal.

              ValorRat:=((percRat/100)*(_query.fieldbyname('VALORATUAL').value)/(PercAnterior/100));

              //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
              ValorRatBS     :=((percRat/100)*(_query.fieldbyname('VLRBSATUAL').AsFloat)/(PercAnterior/100));
              ValorRatFAB    :=((percRat/100)*(_query.fieldbyname('VLRFABATUAL').AsFloat)/(PercAnterior/100));
              ValorRatDefict :=((percRat/100)*(_query.fieldbyname('VLRBASEDEFICIT').AsFloat)/(PercAnterior/100));
             //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

          end;



          VALORATUALANT:=0;
          _queryX.Close;
          _queryX.SQL.clear;
          _queryX.SQL.Add('SELECT VALORATUALANT FROM MOVBENEF');
          _queryX.SQL.Add('WHERE  IDTITULAR ='+_query.fieldbyname('IDTITULAR').text);
          _queryX.SQL.Add(' AND IDPESSOA ='+_query.fieldbyname('IDPESSOA').text);
          _queryX.SQL.Add(' AND IDPLANOPREV ='+_query.fieldbyname('IDPLANOPREV').text);
          _queryX.SQL.Add(' AND IDBENEFICIO ='+_query.fieldbyname('IDBENEFICIO').text);
          _queryX.Open;

          if _queryX.fieldbyname('VALORATUALANT').value>0 then
              VALORATUALANT:=_queryX.fieldbyname('VALORATUALANT').value
          else
             VALORATUALANT:= 0 ;

          _queryX.Close;

           //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
           strVlrBSRevertido  := '';
           strVlrFABRevertido := '';
           strVlrBaseDeficitRevertido := '';

           if _query.fieldbyname('VLRBSATUAL').AsString <> '' then
           strVlrBSRevertido := floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VLRBSATUAL').value+rValorAbono),FloatToStr(ValorRatBS),
                                            GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                               _query.fieldbyname('IDTITULAR').text,
                                               _query.fieldbyname('IDPLANOORIGEM').text,
                                               _query.fieldbyname('IDPESSOA').text,
                                               _query.fieldbyname('SEQPROPOSTA').text,
                                               _query.fieldbyname('IDPLANOPREV').text,
                                               _query.fieldbyname('IDBENEFICIO').text),
                                floattostr(percrat+sobrarat),datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                _query.fieldbyname('IDPLANPREVCONTAB').AsInteger));

           if _query.fieldbyname('VLRFABATUAL').AsString <> '' then
           strVlrFABRevertido := floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VLRFABATUAL').value+rValorAbono),FloatToStr(ValorRatFAB),
                                            GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                               _query.fieldbyname('IDTITULAR').text,
                                               _query.fieldbyname('IDPLANOORIGEM').text,
                                               _query.fieldbyname('IDPESSOA').text,
                                               _query.fieldbyname('SEQPROPOSTA').text,
                                               _query.fieldbyname('IDPLANOPREV').text,
                                               _query.fieldbyname('IDBENEFICIO').text),
                                floattostr(percrat+sobrarat),datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                _query.fieldbyname('IDPLANPREVCONTAB').AsInteger));

           if _query.fieldbyname('VLRBASEDEFICIT').AsString <> '' then
           strVlrBaseDeficitRevertido := floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VLRBASEDEFICIT').value+rValorAbono),FloatToStr(ValorRatDefict),
                                            GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                               _query.fieldbyname('IDTITULAR').text,
                                               _query.fieldbyname('IDPLANOORIGEM').text,
                                               _query.fieldbyname('IDPESSOA').text,
                                               _query.fieldbyname('SEQPROPOSTA').text,
                                               _query.fieldbyname('IDPLANOPREV').text,
                                               _query.fieldbyname('IDBENEFICIO').text),
                                floattostr(percrat+sobrarat),datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                _query.fieldbyname('IDPLANPREVCONTAB').AsInteger));
           //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

           GravarHSTBENEFBFCIARIO('B',
                                '3056',
                                '0',
                                '1',
                                datapagamento,
                                datareftela,
                                 floattostr(GetValorMes(FloatToStr(_query.fieldbyname('VALORATUAL').value+rValorAbono),FloatToStr(ValorRat),
                                            GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                               _query.fieldbyname('IDTITULAR').text,
                                               _query.fieldbyname('IDPLANOORIGEM').text,
                                               _query.fieldbyname('IDPESSOA').text,
                                               _query.fieldbyname('SEQPROPOSTA').text,
                                               _query.fieldbyname('IDPLANOPREV').text,
                                               _query.fieldbyname('IDBENEFICIO').text),
                                floattostr(percrat+sobrarat),datafinal_movbenef, percVlrASerPg, _query.fieldbyname('VALORTOTAL').AsFloat,
                                _query.fieldbyname('IDPLANPREVCONTAB').AsInteger)), //Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                floattostr(GetPercMes(FloatToStr(_query.fieldbyname('VALORTOTAL').value+rValorAbono),
                                            GetPercAnterior(_query.fieldbyname('IDPESSJUR').text,
                                               _query.fieldbyname('IDTITULAR').text,
                                               _query.fieldbyname('IDPLANOORIGEM').text,
                                               _query.fieldbyname('IDPESSOA').text,
                                               _query.fieldbyname('SEQPROPOSTA').text,
                                               _query.fieldbyname('IDPLANOPREV').text,
                                               _query.fieldbyname('IDBENEFICIO').text),
                                floattostr(percrat+sobrarat),datafinal_movbenef)),


                                _query.fieldbyname('DataInicio').text,
                                _query.fieldbyname('DataFinal').text,


                                _query.fieldbyname('IDPESSJUR').text,
                                _query.fieldbyname('IDTITULAR').text,
                                _query.fieldbyname('IDPESSOA').text,
                                _query.fieldbyname('SEQPROPOSTA').text,
                                _query.fieldbyname('IDPLANOPREV').text,
                                _query.fieldbyname('IDBENEFICIO').text,
                                _query.fieldbyname('NUMEROPROCESSO').text,
                                _query.fieldbyname('FONTEPAGADORA').text,
                               _query.fieldbyname('VALORTOTAL').text,
                               _query.fieldbyname('IDPLANOORIGEM').text,
                               _query.fieldbyname('IDSITBENEFICIO').text,
                               
                               //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                               FloatToStr(ValorRat),//_query.fieldbyname('VALORATUAL').AsString,
                               strVlrBSRevertido,
                               strVlrFABRevertido,
                               strVlrBaseDeficitRevertido
                               //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

                               , _query.fieldbyname('IDPERFILINVEST').text    //edilaine - SIG55933

                                );
           //Helio - SOL Nº 253577/17666 PPM Nº 1019935
           //tem que ser antes da chamada da ExecutaSP_PreparoContribuicao
           //ExecutaSP_PreparoContribuicao utiliza esse valor já atualizado
           AtualizarBfciarioTitPlan(percrat+sobrarat,_query.fieldbyname('IDPESSJUR').text,_query.fieldbyname('IDTITULAR').text,_query.fieldbyname('IDPLANOORIGEM').text,_query.fieldbyname('IDPESSOA').text,_query.fieldbyname('SEQPROPOSTA').text,_query.fieldbyname('IDPLANOPREV').text,_query.fieldbyname('IDBENEFICIO').text);     ///colocando 0 para o campo perc.

           if _query.fieldbyname('FONTEPAGADORA').text <> '2' then
           begin

              //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
              //if BEncerrado(_query.fieldbyname('DataFinal').AsString, ME_anomes.text) then
                   //percVlrASerPg := -2;

              bErro := ExecutaSP_PreparoContribuicao(_query.fieldbyname('NUMEROPROCESSO').AsInteger,
                                                     _query.fieldbyname('IDTITULAR').AsInteger,
                                                     3056,
                                                     iIdLoteConcessao,
                                                     '0',
                                                     Copy(datapagamento, 7,4)+'/'+Copy(datapagamento, 4,2),
                                                     dataref,
                                                     percVlrASerPg,
                                                     _query.fieldbyname('IDPESSOA').AsInteger, 16);   // edilaine - SOL 253577-17664 / PPM 1019932


                {GravarHSTCONTRIBPREV(_query.fieldbyname('IDTITULAR').text,
                           '3056',
                           _query.fieldbyname('DATAFINAL').text,
                           _query.fieldbyname('DATAINICIO').text,
                           _query.fieldbyname('IDPLANOPREV').text,
                           _query.fieldbyname('IDPESSJUR').text,
                           _query.fieldbyname('SEQPROPOSTA').text,
                           _query.fieldbyname('IDPESSOA').text,
                           _query.fieldbyname('IDBENEFICIO').texT,
                           _query.fieldbyname('NUMEROPROCESSO').text,
                           _query.fieldbyname('DATAENCERRAMENTO').text,
                           datareftela,
                           _query.fieldbyname('IDPLANOORIGEM').text,
                           datapreparo //douglas.siqueira
                           );}
               //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
           end;



           Valoratual_antec:=floattostr(_query.fieldbyname('VALORATUAL').value);
           AtualzarBENEFBFCIARIO(valorRat,
                               _query.fieldbyname('IDSITBENEFICIO').text,
                               _query.fieldbyname('idtitular').text
                               ,_query.fieldbyname('idpessoa').text
                               ,_query.fieldbyname('idplanoprev').text
                               ,_query.fieldbyname('idbeneficio').text,
                               _query.fieldbyname('FONTEPAGADORA').text,

                               //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                               ValorRatBS,
                               ValorRatFAB,
                               ValorRatDefict
                               //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

                               );

           //Helio - SOL Nº 253577/17666 PPM Nº 1019935
           //AtualizarBfciarioTitPlan(percrat+sobrarat,_query.fieldbyname('IDPESSJUR').text,_query.fieldbyname('IDTITULAR').text,_query.fieldbyname('IDPLANOORIGEM').text,_query.fieldbyname('IDPESSOA').text,_query.fieldbyname('SEQPROPOSTA').text,_query.fieldbyname('IDPLANOPREV').text,_query.fieldbyname('IDBENEFICIO').text);     ///colocando 0 para o campo perc.
           //Somente HST vai ser feito com o valor do Mês(caso haja valor diferenciado)




           GravarMovBenef(_query.fieldbyname('VALORATUAL').text,
                _query.fieldbyname('VALORTOTAL').text,
                _query.fieldbyname('DATAFINAL').text,
                _query.fieldbyname('DATAINICIO').text,
                datafinal_movbenef,
                _query.fieldbyname('IDPESSJUR').text,
                _query.fieldbyname('IDTITULAR').text,
                _query.fieldbyname('IDPESSOA').text,
                _query.fieldbyname('SEQPROPOSTA').text,
                _query.fieldbyname('IDPLANOPREV').text,
                _query.fieldbyname('IDBENEFICIO').text,
                _query.fieldbyname('NUMEROPROCESSO').text,datafinal_movbenef,Valoratual_antec
                );
                // Andre Imakawa - SIG 51180 - Inicio
                {
                 if _query.fieldbyname('IDTPPAGTOBENEFIC').AsInteger = 1 then // Andre Imakawa - SIG 50047
                 //Peterson Victor - SIG49063 - inicio
                 GravaHstPercGrupo(0,
                                   _query.fieldbyname('IDPESSJUR').text,
                                   _query.fieldbyname('IDTITULAR').text,
                                   _query.fieldbyname('IDPLANOORIGEM').text,
                                   _query.fieldbyname('IDPESSOA').text,
                                   _query.fieldbyname('SEQPROPOSTA').text,
                                   _query.fieldbyname('IDPLANOPREV').text,
                                   _query.fieldbyname('IDBENEFICIO').text,
                                   _query.fieldbyname('FONTEPAGADORA').text,
                                   _query.fieldbyname('NUMEROPROCESSO').text,
                                   datafinal_movbenef
                                   );     ///colocando 0 para o campo perc.
                 //Peterson Victor - SIG49063 - fim
                 }
                 // Andre Imakawa - SIG 51180 - Fim

           cont:=cont+1;


           if Ck_commit.Checked then
           begin
                If not dtmBaseDados.dbBaseDados.InTransaction Then
                   dtmBaseDados.dbBaseDados.StartTransaction;

                dtmBaseDados.dbBaseDados.Commit;
           end;


           _query.Next;
       end;

     end;

  // Andre Imakawa - SIG 51180 - Inicio
  if not qrydet.IsEmpty then
  begin
    datafinal_percgrupo:='';

    if trim(qrydet.fieldbyname('DATAFINAL1').text)='' then
      datafinal_percgrupo:=qrydet.fieldbyname('DATAENCERRAMENTO1').text
    else
      datafinal_percgrupo:=qrydet.fieldbyname('DATAFINAL1').text;

    GravaHstPercGrupo(0,
                     qrydet.fieldbyname('IDPESSJUR').text,
                     qrydet.fieldbyname('IDTITULAR').text,
                     qrydet.fieldbyname('IDPLANOORIGEM').text,
                     qrydet.fieldbyname('IDPESSOA').text,
                     qrydet.fieldbyname('SEQPROPOSTA').text,
                     qrydet.fieldbyname('IDPLANOPREV').text,
                     qrydet.fieldbyname('IDBENEFICIO').text,
                     qrydet.fieldbyname('FONTEPAGADORA').text,
                     qrydet.fieldbyname('NUMEROPROCESSO').text,
                     datafinal_percgrupo
                     );
  end;
  // Andre Imakawa - SIG 51180 - Fim

  _query.close;
  _query.Destroy;

  _query2.close;
  _query2.Destroy;


_query3.close;
_query3.Destroy;


_query4.close;
_query4.Destroy;

_query5.close;
_query5.Destroy;

qryaux.CLOSE;
end;

function TFrmReverCotas.VerificaMorte( _idtitular,
  _idplanoprev, _idbeneficio,_idpessoa: string): boolean;
var
_query:TwwQuery;
begin            //

_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;

_query.sql.Clear;
_query.SQL.Append('SELECT DATAENCERRAMENTO FROM BENEFBFCIARIO');
_query.SQL.Append('WHERE');
_query.SQL.Append('IDTITULAR = '+#39+_idtitular+#39);
_query.SQL.Append(' AND IDPLANOPREV = '+#39+_idplanoprev+#39);
_query.SQL.Append(' AND IDBENEFICIO = '+#39+_idbeneficio+#39);
_query.SQL.Append(' AND IDPESSOA = '+#39+_idpessoa+#39);
_query.SQL.Append(' AND DATAENCERRAMENTO BETWEEN '+#39+'01'+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39+' AND '+#39+formatfloat('00',TrazUltDiaMes(strtoint(copy(ME_anomes.text,6,2)),strtoint(copy(ME_anomes.text,1,4))))+'/'+copy(ME_anomes.text,6,2)+'/'+copy(ME_anomes.text,1,4)+#39);

//William Moreira da Silva - SIG 43619
//_query.SQL.Append(' AND IDSITBENEFICIO in (1,2)');
_query.SQL.Append(' AND IDSITBENEFICIO in (1,2,3)');
//William Moreira da Silva - SIG 43619

_query.Active:=TRUE;
if not _query.IsEmpty then
    result:=TRUE
else
    result:=FALSE;

_query.Active:=FALSE;
_query.Destroy;


end;
procedure TFrmReverCotas.AtualzarBENEFBFCIARIO(_valoratual :double;_idsitbeneficio,_idtitular,_idpessoa,_idplanoprev,_idbeneficio,_fontepaga: String;
                                               _valorBS, _valorFAB, _vlrBaseDeficit:double); //Helio - SOL Nº 253577/17666 PPM Nº 1019935
var
_query:TwwQuery;
begin
_query:=TwwQuery.Create(Self);
_query.DataBaseName := 'BaseDados';
_query.Active:=false;

_query.Close;
_query.SQL.Clear;

_query.SQL.Append(' update BENEFBFCIARIO set IDSITBENEFICIO ='+#39+_idsitbeneficio+#39);



if (_idsitbeneficio = '1') or (_idsitbeneficio = '2') then
   begin


  // _query.SQL.Append(' , VALORATUAL='+ #39+floattostr(_valoratual)+#39);
   if _fontepaga = '2' then
       begin
      //Helio - SOL Nº 253577/17666 PPM Nº 1019935
      //_query.sql.Add(' ,VALORATUAL= (round(('+#39+floattostr(_valoratual)+#39+'),2))');//douglas.siqueira 212299
      if _idsitbeneficio = '2' then
      _query.SQL.Append(' , FLGPAGAINSS=0 ');

      end;
   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   //else
   //   _query.sql.Add(' ,VALORATUAL= (round(('+#39+floattostr(_valoratual)+#39+'),2))');
   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   _query.SQL.Append(' , ULTMESPREPARO='+ #39+ME_anomes.Text+#39);

   end;

                                                        
   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   _query.sql.Append(' ,VALORATUAL= (round(('+#39+floattostr(_valoratual)+#39+'),2))');
   _query.SQL.Append(' , VLRBSATUAL= (round(('+#39+FloatToStr(_valorBS)+#39+'),2))');
   _query.SQL.Append(' , VLRFABATUAL= (round(('+#39+FloatToStr(_valorFAB)+#39+'),2))');
   _query.SQL.Append(' , VLRBASEDEFICIT= (round(('+#39+FloatToStr(_vlrBaseDeficit)+#39+'),2))');
   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

_query.SQL.Append(' WHERE IDTITULAR = '+#39+_idtitular+#39);
_query.SQL.Append(' AND IDPLANOPREV = '+#39+_idplanoprev+#39);
_query.SQL.Append(' AND IDBENEFICIO = '+#39+_idbeneficio+#39);
_query.SQL.Append(' AND IDPESSOA = '+#39+_idpessoa+#39);



   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log('',string(E.message));
//                    Exit;
               end;
          end;





_query.Destroy;

end;

procedure TFrmReverCotas.GravaHstPercGrupo(_perc:double;_idpessjur, _idtitular, _idplanoorigem, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio,_fontepagadora,_numeroprocesso,_encerramento:string);
var
  sSql : String;
  _query :TwwQuery;

begin

_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;
_query.SQL.clear;
//sSQL := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO('+_idtitular+','+_idpessoa+','+_idpessjur+','+_idplanoprev+','+_idbeneficio+','+StringReplace(FloatToStr(_perc), ',', '.', [])+','+_fontepagadora+',NULL,NULL'+','+_numeroprocesso+','+_idplanoorigem+','+_seqproposta+'); END;';
//sSQL := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO('+_idplanoprev+','+_fontepagadora+','+_idpessjur+','+_idtitular+','+_idplanoorigem+','+_seqproposta+','+#39+'S'+#39+','+#39+_encerramento+#39+'); END;';    //edilaine SIG135320
sSQL := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO('+_idplanoprev+','+_fontepagadora+','+_idpessjur+','+_idtitular+','+_idplanoorigem+','+_seqproposta+','+#39+'S'+#39+','+#39+_encerramento+#39+','+#39+_idbeneficio+#39'); END;';  //edilaine SIG135320
_query.SQL.Add(sSQL);


   try
     _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log('',string(E.message));
//                    Exit;
               end;
          end;



_query.Destroy;

end;

procedure TFrmReverCotas.AtualizarBfciarioTitPlan(_perc:double;_idpessjur, _idtitular, _idplanoorigem, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio:string);
var
 _query :TwwQuery;
begin

_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;
_query.SQL.clear;

_query.SQL.Add('update BFCIARIOTITPLAN');
_query.SQL.Add('set');
_query.SQL.Add('  percentual = trunc(('+OraNumero(FloatToStr(_perc)));
_query.SQL.Add('  ),4) where ');
_query.SQL.Add('  IDPESSJUR='+#39+_idpessjur+#39);
_query.SQL.Add('  AND IDTITULAR='+#39+_idtitular+#39);
_query.SQL.Add('  AND IDPLANOORIGEM='+#39+_idplanoorigem+#39);
_query.SQL.Add('  AND IDPESSOA='+#39+_idpessoa+#39);
_query.SQL.Add('  AND SEQPROPOSTA='+#39+_seqproposta+#39);
_query.SQL.Add('  AND IDPLANOPREV='+#39+_idplanoprev+#39);
_query.SQL.Add('  AND IDBENEFICIO='+#39+_idbeneficio+#39);
//_query.ExecSQL;

   try
     _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log('',string(E.message));
//                    Exit;
               end;
          end;


_query.Destroy;

end;

procedure TFrmReverCotas.GravarHSTBENEFBFCIARIO(_Tipo,_idmotivo,_flgtiporegistro,_SEQbeneficio,_datapagamento,_mesreflote,_ValorAtual,_PercAtual,_DataInicio,_DataFinal,_idpessjur, _idtitular, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio,_numeroprocesso,_FONTEPAGADORA,_valortotal,_IDPLANOORIGEM,_IDSITBENEFICIO,
                                                _valorIntegral,
                                                _valorBS, _valorFAB, _vlrBaseDeficit:string;   //Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                                _IdPerfilInvest : string);                     //edilaine - SIG55933
var
 _query :TwwQuery;
 _query2 :TwwQuery;
begin

try
//   FInumprocesso.Add(inttostr(sidmovbenef));

   except
end;
_ValorAtual:=ClienteNumero(_ValorAtual);
_PercAtual:=ClienteNumero(_PercAtual);



_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;
_query.SQL.clear;


_query2 := TwwQuery.Create(Application);
_query2.DataBaseName := 'BaseDados';
_query2.close;
_query2.SQL.clear;

_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into HSTBENEFBFCIARIO ');
_query.sql.Add('  (  ');
_query.sql.Add('  FLGDEVOLUCAO, ');
_query.sql.Add('  IDTITULAR, ');//*
_query.sql.Add('  IDPESSJUR, ');
_query.sql.Add('  IDPLANOPREV, ');
_query.sql.Add('  IDBENEFICIO , ');
_query.sql.Add('  IDMOTIVO, ');
_query.sql.Add('  IDPESSOA, ');
_query.sql.Add('  NUMEROPROCESSO, ');
_query.sql.Add('  MES, ');
_query.sql.Add('  SEQBENEFICIO, ');///ver como fazer
//_query.sql.Add('  SEQPROPOSTA, ');
_query.sql.Add('  IDLOTE, '); 
_query.sql.Add('  LOTEORIGINAL, '); //Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query.sql.Add('  VALORPREV, ');///ver como fazer
_query.sql.Add('  DATAPAGAMENTO, ');///VER COMO FAZER
_query.sql.Add('  CODPORTFORMA, ');
_query.sql.Add('  VALORCALCULADO, ');
_query.sql.Add('  FLGENVIADO, ');
_query.sql.Add('  MESREFERENCIA, ');
_query.sql.Add('  FLGCONCESSAO, ');
_query.sql.Add('  VALORTOTAL, ');
_query.sql.Add('  FONTEPAGADORA, ');
_query.sql.Add('  VALORINTEGRAL, ');
_query.sql.Add('  IDPLANOORIGEM, ');
_query.sql.Add('  IDTITBENEF, ');
//_query.sql.Add('  IDSEQINTERNOFB, '); //ver como fazer

_query.sql.Add('  PERCENTUAL, ');
_query.sql.Add('  FLGTIPOREGISTRO, '); ///ver como fazer
_query.sql.Add('  MESCOMPREEM, ');
_query.sql.Add('  VALORSRB, ');
//_query.sql.Add('  IDMOVBENEF ');

_query.sql.Add('  IDPERFILINVEST, ');    //edilaine - SIG55933

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query.sql.Add('  SEQPROPOSTA, ');
_query.sql.Add('  VALORBS, ');
_query.sql.Add('  VALORFAB, ');
_query.sql.Add('  VLRBASEDEFICIT ');
///Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');

if StrToFloat(_ValorAtual)<0 then
    begin
   _query.sql.Add(' '+'1'+',');
   _ValorAtual:=floattostr(StrToFloat(_ValorAtual)*(-1));
    end
else
   _query.sql.Add(' '+'0'+',');



_query.sql.Add(' '+#39+_IDTITULAR+#39+',');//IDTITULAR
_query.sql.Add(' '+#39+_IDPESSJUR+#39',');//IDPESSJUR
_query.sql.Add(' '+#39+_IDPLANOPREV+#39+',');//IDPLANOPREV
_query.sql.Add(' '+#39+_IDBENEFICIO+#39+',');//IDBENEFICIO


_query.sql.Add(' '+#39+_idmotivo+#39+',');///feito RN09//_idmotivo


_query.sql.Add(' '+#39+_IDPESSOA+#39+','); //IDPESSOA
_query.sql.Add(' '+#39+_NUMEROPROCESSO+#39+',');//NUMEROPROCESSO
//_query.sql.Add(' '+#39+_mesreflote+#39+',');///feito //meslote///212299
_query.sql.Add(' '+#39+Copy(_datapagamento, 7,4)+'/'+Copy(_datapagamento, 4,2)+#39+',');//212299
_query.sql.Add(' '+#39+_SEQbeneficio+#39+',');///feito
_query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+','); //idlote
_query.sql.Add(' '+#39+INTTOSTR(iIdLoteConcessao)+#39+','); //loteoriginal //Helio - SOL Nº 253577/17666 PPM Nº 1019935

//_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');///feito
_query.sql.Add(' round(('+#39+_ValorAtual+#39+'),2),');

_query.sql.Add(' '+#39+_datapagamento+#39+',');

_query2.active:=false;
_query2.sql.clear;
_query2.sql.append(' select CODPORTFORMA from benefplanprev where idplanoprev='+#39+_idplanoprev+#39);
_query2.sql.append(' and  idbeneficio='+#39+_idbeneficio+#39);
_query2.open;
_query.sql.Add(' '+#39+_query2.fieldbyname('CODPORTFORMA').text+#39+',');///feito
_query2.close;


// Andre Imakawa - SIG 45005/45579 - Inicio
If ( Pos( '/13', _mesreflote ) > 0 ) Then
  _query.sql.Add(' '+#39+_valortotal+#39+',')
else
  _query.sql.Add(' round(('+#39+_ValorAtual+#39+'),2),');
// Andre Imakawa - SIG 45005/45579 - Fim

//_query.sql.Add(' '+#39+ClienteNumero(_valorcalculado)+#39+',');
IF _FONTEPAGADORA = '2' then
   begin
   if _IDSITBENEFICIO='2' then
      _query.sql.Add(' '+#39+'8'+#39+',')
   else
      _query.sql.Add(' '+#39+'0'+#39+',');     //FLGENVIADO
   end
else
begin
  //William Moreira da Silva - SIG 24446
  if _IDSITBENEFICIO = '2' then
       _query.sql.Add(' '+#39+'9'+#39+',')//FLGENVIADO - Retido
  else
     _query.sql.Add(' '+#39+'0'+#39+',');//FLGENVIADO - A Processar
  //William Moreira da Silva - SIG 24446
end;


_query.sql.Add(' '+#39+_mesreflote+#39+',');///feito
_query.sql.Add(' '+#39+'1'+#39+',');//FLGCONCESSAO








// Andre Imakawa - SIG 45005/45579 - Inicio
//_query.sql.Add(' round(('+#39+_ValorAtual+#39+'),2),');

If ( Pos( '/13', _mesreflote ) > 0 ) Then
  _query.sql.Add(' '+#39+_valortotal+#39+',')
else
  _query.sql.Add(' round(('+#39+_ValorAtual+#39+'),2),');
// Andre Imakawa - SIG 45005/45579 - Fim

_query.sql.Add(' '+#39+_FONTEPAGADORA+#39+',');
//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
//_query.sql.Add(' round(('+#39+_ValorAtual+#39+'),2),');
_query.sql.Add(' round(('+#39+_valorIntegral+#39+'),2),');
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query.sql.Add(' '+#39+_IDPLANOORIGEM+#39+','); //IDPLANOORIGEM
_query.sql.Add(' '+#39+_IDTITULAR+#39+',');//IDTITBENEF
_query.sql.Add(' TRUNC('+#39+_PercAtual+#39+',4),');//ver Hébio


//edilaine - SIG33727 - inicio
{// If ( Pos( '/13', Copy(_DataInicio, 7,4)+'/'+Copy(_DataInicio, 4,2)) > 0 ) Then           // edilaine - SOL 253577-18184 / PPM 1331102
 If ( Pos( '/13', _mesreflote ) > 0 ) Then                                                  // edilaine - SOL 253577-18184 / PPM 1331102
    _query.sql.Add(' '+#39+'1'+#39+',')
else
    _query.sql.Add(' '+#39+'0'+#39+','); }
_query.sql.Add(' '+#39+_flgtiporegistro+#39+',');
//edilaine - SIG33727 - fim





_query.sql.Add(' '+#39+Copy(_datapagamento, 7,4)+'/'+Copy(_datapagamento, 4,2)+#39+',');

_query.sql.Add(' '+#39+CalculoValorSRB(_mesreflote,
                _idpessjur,
                _idtitular,
                _idpessoa,
                _idplanoprev,
                _idbeneficio,
                _NumeroProcesso
                  )+#39 );

_query.sql.Add(', '+#39+_IdPerfilInvest+#39 );    //edilaine - SIG55933

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query.sql.Add(', '+_seqproposta+',');
_query.sql.Add(' '+#39+ _valorBS +#39+',');
_query.sql.Add(' '+#39+ _valorFAB +#39+',');
_query.sql.Add(' '+#39+ _vlrBaseDeficit +#39);
///Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

_query.sql.Add('  )  ');
//_query.ExecSQL;
   try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log('',string(E.message));
//                    Exit;
               end;
          end;

_query.Destroy;

_query2.Destroy;

end;

function TFrmReverCotas.CalculoValorSRB(_datarefe,_idpessjur, _idtitular,  _idpessoa,_idplanoprev, _idbeneficio,_NumeroProcesso:string):string;

var
  sSQL,sSQLBenefAssoc,sDataRefSRB,sMsgErro:string;
  dValorSRB,v1,v2,v3:double;
  bErro:boolean;
  piIdCalculo:longInt;
begin



 //      If prmCalculaSRBNoRetroativo Then
        Begin
          Begin
             sSQL := ' SELECT BF.ULTMESREAJUSTE, BF.VALORSRB, BF.DATAINICIOFUND, '+
                     '        BF.VLRINFINSS,     BF.VLRCALCINSS, BF.VALORNADIB,  '+
                     '        BF.ValorBase1,     BF.ValorBase2, BF.ValorBase3,  '+
                     '        BP.IDREGRASRB,    '+
                     '        EL.IDSITFUNC,  '+
                     '        PP.IDSITPART, PP.IDSITPLANOPREV, '+
                     '        B.NUMORDEMEVENTO '+
                     ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B,   '+
                     '        ELEGPATRO EL, PARTPREVPLAN PP '+
                     ' WHERE  BF.IDPESSJUR          = '+_IDPESSJUR    +
                     ' AND    BF.IDPLANOPREV        = '+_IDPLANOPREV  +
                     ' AND    BF.IDTITULAR          = '+_IDTITULAR     +
                     ' AND    BF.SEQPROPOSTA        = 1                          '+
                     ' AND    BF.IDPESSOA           = '+_IDPESSOA    +
                     ' AND    BF.IDBENEFICIO        = '+_IDBENEFICIO   +
                     ' AND    BF.IDSITBENEFICIO IN (1,2,3,4,7)  '+
                     ' AND    BP.IDPLANOPREV        = BF.IDPLANOPREV             '+
                     ' AND    BP.IDBENEFICIO        = BF.IDBENEFICIO             '+

                     ' AND    BF.IDTITULAR          = EL.IDPESSOA                '+
                     ' AND    BF.IDPESSJUR          = EL.IDPESSJUR               '+

                     ' AND    BF.IDTITULAR          = PP.IDPESSOA                '+
                     ' AND    BF.IDPESSJUR          = PP.IDPESSJUR               '+
                     ' AND    BF.IDPLANOPREV        = PP.IDPLANOPREV             '+
                     ' AND    BF.IDBENEFICIO        = B.IDBENEFICIO              ';
          End;

          FazQuery( QryAux, sSQL );

          If ( QryAux.FieldByName('IDREGRASRB').AsInteger > 0 ) Then
          Begin

//            bReajustaSuplementacao := True;t
           if QryAux.FieldByName('ValorBase1').value>0 then
             v1:=QryAux.FieldByName('ValorBase1').value
           else
              v1:=0;

           if QryAux.FieldByName('ValorBase2').value>0 then
             v2:=QryAux.FieldByName('ValorBase2').value
           else
              v2:=0;

           if QryAux.FieldByName('ValorBase3').value>0 then
             v3:=QryAux.FieldByName('ValorBase3').value
           else
              v3:=0;


            sSQLBenefAssoc := MontaSQLBenefAssoc(qryAux, QryAux.FieldByName('NUMORDEMEVENTO').AsInteger);

            sDataRefSRB := '01/'+Copy(ME_anomes.text,6,2)+'/'+Copy(ME_anomes.text,1,4);

            dValorSRB := 0;
            dValorSRB := ExecutaRegraCalculoSRB(QryAux,
                                                QryAux.FieldByName('IDREGRASRB').AsInteger,
                                                strtoint(_IDPESSJUR),
                                                strtoint(_IDPLANOPREV),
                                               strtoint(_IDTITULAR),
                                                1,
                                                strtoint(_IDBENEFICIO),
                                                strtoint(_NumeroProcesso),
                                                QryAux.FieldByName('IDSITFUNC').AsInteger,
                                                QryAux.FieldByName('IDSITPART').AsInteger,
                                                QryAux.FieldByName('IDSITPLANOPREV').AsInteger,

                                                v1, v2, v3,
//                                                QryAux.FieldByName('ValorBase1').value, QryAux.FieldByName('ValorBase2').value, QryAux.FieldByName('ValorBase3').value,
                                                '',
                                                sDataRefSRB,  QryAux.FieldByName('DATAINICIOFUND').text, QryAux.FieldByName('DATAINICIOFUND').text,
                                                QryAux.FieldByName('DATAINICIOFUND').text, QryAux.FieldByName('DATAINICIOFUND').text,
                                                '', '', '0',
                                                False,
                                                0,
                                                '',
                                                '',
                                                '', '', '',
                                                bErro,
                                                sMsgErro,
                                                piIdCalculo, 0, -1,
                                                strtoint(_IDPESSOA) );


          End Else Begin


          End;

        End;
        result:=formatfloat('0.00',dValorSRB);
end;

procedure TFrmReverCotas.GravarMovBenef(_ValorAtual,_ValorTotal,_DataInicio,_DataFinal,_Tipo,_idpessjur, _idtitular, _idpessoa, _seqproposta, _idplanoprev, _idbeneficio,_numeroprocesso,_datafinal_movbenef,_Valoratual_antec:string);
begin     

    try
           sidmovbenef:=CriaLogOcorrencia(_idplanoprev,
                             _IdPessJur,
                             _IdTitular,
                             _IdBeneficio,
                             _NumeroProcesso,
                             _IdPessoa,
                             _SeqProposta,
                             '16',
                             FormatDateTime('dd/mm/yyyy', Date), // Thiago Melo/Xavier SOL 229888 PPM 349946
                             _ValorAtual,//qryDet.FieldByName('ValorAtual').AsString
                             _ValorTotal,//qryDet.FieldByName('ValorTotal').AsString
                             '',//qryDet.FieldByName('ValorCotas').AsString
                             _DataInicio,//qryDet.FieldByName('DataInicio').AsString
                             _datafinal_movbenef,//sDataFinal
                             _Valoratual_antec,//qryDet.FieldByName('ValorAtual').AsStrings ValorAtualAnt
                             '',//qryDet.FieldByName('DataInicio').AsString
                             '',//sDataFinal
                             '',
                             0,//qryDet.FieldByName('FlgDataPrevista').AsInteger
                             qryAux, '',
                             iIdLoteConcessao,
                             iIdCalculo,//iIdCalculo
                             False,
                             0,//qryDet.FieldByName('USUARIOALT').AsInteger
                             0//iFlgEmprestimo
                             )
        except
        //   frmAguarde.Apaga;

          If not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;





        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no registro da operação.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

//rn004


end;

function TFrmReverCotas.GetValorMes(_valorB,_valorC,_percAnt,_percNovo,_data: string;
                                    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                    var dPerc : double;
                                    valorTotal : double;
                                    _idPlanoPrevConta : Integer
                                    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
                                   ): double;
var
diasIni:integer;
diasFim:integer;
PercIni:double;
PercFim:double;
PercDiasIni:double;
PercDiasFim:double;
TotolPerc:double;
v1,v2 :double;
begin

diasIni:=0;
diasFim:=0;
PercIni:=0;
PercFim:=0;

PercDiasIni:=0;
PercDiasFim:=0;
TotolPerc:=0;
v1:=0;
v2:=0;

dPerc := 0;//Helio - SOL Nº 253577/17666 PPM Nº 1019935

diasIni:=strtoint(copy(_data,1,2));

// Felipe A. Santos SOL 222734/15797 KTN 2060843 - inicio
if (diasIni = 31) then
   diasIni:=30;

if Copy(_data,4,2)='02' then
   begin
    if (strtoint(copy(_data,7,4)) mod 4) = 0 then
        begin
        if diasIni = 29 then
           diasIni:=30;
        end
    else
        begin
        if diasIni = 28 then
           diasIni:=30;
        end;
   end;
// Felipe A. Santos SOL 222734/15797 KTN 2060843 - fim

diasFim:=30-diasIni;


PercIni:=diasIni/30;
PercFim:=diasFim/30;

//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
//PercDiasIni:=(PercIni*strtofloat(_percAnt));
//PercDiasFim:=(PercFim*strtofloat(_percNovo));
PercDiasIni := strtofloat(_percAnt);
PercDiasFim := strtofloat(_percNovo);

PercDiasIni:=PercIni*PercDiasIni;
PercDiasFim:=PercFim*PercDiasFim;
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935


if _valorB<>_valorC then
   begin
   v1:= PercIni*strtofloat(_valorB);
   v2:= PercFim*strtofloat(_valorC);
   result:=v1+v2;

    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    dPerc := PercDiasIni + PercDiasFim;
    {if _idPlanoPrevConta = 2 then
        dPerc := PercIni + PercFim * 100
    else
        dPerc := result/(valorTotal/100);}
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   end
else
   begin

    v1:= PercIni*strtofloat(_valorB);
    result:=v1;

    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    dPerc := PercDiasIni + PercDiasFim;
    {if _idPlanoPrevConta = 2 then
        dPerc := PercIni * 100
    else
        dPerc := result/(valorTotal/100);}
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    end;

end;

function TFrmReverCotas.GetPercMes(_valorB, _percAnt, _percNovo,
  _data: string): double;
var
diasIni:integer;
diasFim:integer;
PercIni:double;
PercFim:double;
PercDiasIni:double;
PercDiasFim:double;
TotolPerc:double;
begin

diasIni:=0;
diasFim:=0;
PercIni:=0;
PercFim:=0;

PercDiasIni:=0;
PercDiasFim:=0;
TotolPerc:=0;

diasIni:=strtoint(copy(_data,1,2));
diasFim:=30-diasIni;


PercIni:=diasIni/30;
PercFim:=diasFim/30;

PercDiasIni:=PercIni*strtofloat(_percAnt);
PercDiasFim:=PercFim*strtofloat(_percNovo);

TotolPerc:=PercDiasIni+ PercDiasFim;


result:=TotolPerc;

end;

function TFrmReverCotas.GetPercAnterior(_idpessjur, _idtitular,
  _idplanoorigem, _idpessoa, _seqproposta, _idplanoprev,
  _idbeneficio: string): String;
var
 _query :TwwQuery;
begin

_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;
_query.SQL.clear;

_query.SQL.Add('select percentual from  BFCIARIOTITPLAN');
_query.SQL.Add('  where IDPESSJUR='+#39+_idpessjur+#39);
_query.SQL.Add('  AND IDTITULAR='+#39+_idtitular+#39);
_query.SQL.Add('  AND IDPLANOORIGEM='+#39+_idplanoorigem+#39);
_query.SQL.Add('  AND IDPESSOA='+#39+_idpessoa+#39);
_query.SQL.Add('  AND SEQPROPOSTA='+#39+_seqproposta+#39);
_query.SQL.Add('  AND IDPLANOPREV='+#39+_idplanoprev+#39);
_query.SQL.Add('  AND IDBENEFICIO='+#39+_idbeneficio+#39);
_query.open;
if not _query.IsEmpty then
   result:=_query.fieldbyname('percentual').Text
else
   result:='0';

_query.Destroy;
end;

procedure TFrmReverCotas.cb_demoClick(Sender: TObject);
begin
  inherited;
if ( cb_demo.Checked) or ( Ch_relme.Checked) then
    bt_imprimir.Enabled:=true
else
    bt_imprimir.Enabled:=false;

end;

procedure TFrmReverCotas.Ch_relmeClick(Sender: TObject);
begin
  inherited;
if ( cb_demo.Checked) or ( Ch_relme.Checked) then
    bt_imprimir.Enabled:=true
else
    bt_imprimir.Enabled:=false;
end;




procedure TFrmReverCotas.GravarHSTCONTRIBPREV(_IDTITULAR,_IDMOTIVO,_DATAFINAL,_DATAINICIO,_IDPLANOPREV,_IDPESSJUR,_SEQPROPOSTA,_IDPESSOA,_IDBENEFICIO,_NUMEROPROCESSO,_DATAENCERRAMENTO,_MESREF,_IDPLANOORIGEM,_datapreparo:string);//douglas.siqueira 212299
var
  _query,_query2,_queryAUX,_query3:TwwQuery;
  sSQL,sValorRegra,sCODPORTFORMA :string;
  bErro:boolean;
  Inteiro,iNumRecebimento:Integer;
  IDREGRACALCULO,IDCONTRIBUICAO:string;
begin


_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;


_query2 := TwwQuery.Create(Application);
_query2.DataBaseName := 'BaseDados';
_query2.close;


_query3 := TwwQuery.Create(Application);
_query3.DataBaseName := 'BaseDados';
_query3.close;

_queryAUX := TwwQuery.Create(Application);
_queryAUX.DataBaseName := 'BaseDados';
_queryAUX.close;



_queryAUX.SQL.Add('SELECT (SELECT MAX(IDCONTRIBUICAO)');
_queryAUX.SQL.Add('          FROM CONTRIBPREVNUCLEO CP');
_queryAUX.SQL.Add('         WHERE CP.IDNUCLEOFAMILIAR = BTT.IDNUCLEOFAMILIAR AND');
_queryAUX.SQL.Add('               CP.IDCONTRIBUICAO = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500)) AS IDCONTRIBUICAO');





_queryAUX.SQL.CLEAR;

_queryAUX.SQL.Add('SELECT (SELECT MAX(IDCONTRIBUICAO)');
_queryAUX.SQL.Add('          FROM CONTRIBPREVNUCLEO CP');
_queryAUX.SQL.Add('         WHERE CP.IDNUCLEOFAMILIAR = BTT.IDNUCLEOFAMILIAR AND');
_queryAUX.SQL.Add('               CP.IDCONTRIBUICAO = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500)) AS IDCONTRIBUICAO');

_QUERYAUX.SQL.APPEND('  FROM BENEFBFCIARIO BF');
_QUERYAUX.SQL.APPEND('  JOIN BFCIARIOTITPLAN BTT');
_QUERYAUX.SQL.APPEND('    ON BTT.IDPESSJUR = BF.IDPESSJUR');
_QUERYAUX.SQL.APPEND('   AND BTT.IDTITULAR = BF.IDTITULAR');
_QUERYAUX.SQL.APPEND('   AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM');
_QUERYAUX.SQL.APPEND('   AND BTT.IDPESSOA = BF.IDPESSOA');
_QUERYAUX.SQL.APPEND('   AND BTT.SEQPROPOSTA = BF.SEQPROPOSTA');
_QUERYAUX.SQL.APPEND('   AND BTT.IDPLANOPREV = BF.IDPLANOPREV');
_QUERYAUX.SQL.APPEND('   AND BTT.IDBENEFICIO = BF.IDBENEFICIO');
_QUERYAUX.SQL.APPEND(' WHERE BF.IDTITULAR = '+_IDTITULAR);
_QUERYAUX.SQL.APPEND('   AND BF.IDPLANOPREV = '+_IDPLANOPREV);
_QUERYAUX.SQL.APPEND('   AND BF.IDBENEFICIO = '+_IDBENEFICIO);
_QUERYAUX.SQL.APPEND('   AND BF.IDSITBENEFICIO in (1,2)');
_QUERYAUX.SQL.APPEND('   AND BF.IDPESSOA = '+_IDPESSOA);
_queryAUX.Active:=true;

IDCONTRIBUICAO:=_queryAUX.fieldbyname('IDCONTRIBUICAO').text;

_query3.close;
_query3.SQL.CLEAR;

_query3.SQL.Add('SELECT /*B.IDBENEFICIO,');
_query3.SQL.Add('       B.IDEVENTOGERADOR,');
_query3.SQL.Add('       B.NOME,');
_query3.SQL.Add('       CPE.IDCONTRIBUICAO,');
_query3.SQL.Add('       CPE.IDPLANOPREV,*/');
_query3.SQL.Add('       CP.IDREGRACALCULO');
_query3.SQL.Add(' FROM BENEFICIO B');
_query3.SQL.Add('     JOIN CONTPREVEVENTO CPE ON B.IDEVENTOGERADOR = CPE.IDEVENTOGERADOR');
_query3.SQL.Add('     JOIN CONTPREV CP ON CPE.IDCONTRIBUICAO = CP.IDCONTRIBUICAO AND');
_query3.SQL.Add('                         CPE.IDPLANOPREV = CP.IDPLANOPREV');
_query3.SQL.Add(' WHERE B.IDBENEFICIO = '+_IDBENEFICIO);
_query3.SQL.Add('     AND CP.IDPLANOPREV = '+_IDPLANOPREV);
_query3.SQL.Add('     AND CP.IDCONTRIBUICAO= '+IDCONTRIBUICAO);
_query3.open;

IDREGRACALCULO:=_query3.fieldbyname('IDREGRACALCULO').text;
if trim(IDREGRACALCULO)='' then
    IDREGRACALCULO:='0';
_query3.close;






_query2.sql.Clear;
_QUERY2.SQL.Add('SELECT  nvl(round((DECODE(SUM(DECODE(HB.FLGDEVOLUCAO,');
_QUERY2.SQL.Add('                                                   1,');
_QUERY2.SQL.Add('                                                   -HB.VALORPREV,');
_QUERY2.SQL.Add('                                                   HB.VALORPREV)),');
_QUERY2.SQL.Add('                                        0,');
_QUERY2.SQL.Add('                                        NULL,');
_QUERY2.SQL.Add('                                        SUM(DECODE(HB.FLGDEVOLUCAO,');
_QUERY2.SQL.Add('                                                   1,');
_QUERY2.SQL.Add('                                                   -HB.VALORPREV,');
_QUERY2.SQL.Add('                                                   HB.VALORPREV)))),2),0)VlMes');
_QUERY2.SQL.Add('                            FROM HSTBENEFBFCIARIO HB');
_QUERY2.SQL.Add('                           WHERE HB.IDPLANOPREV ='+_IDPLANOPREV);
_QUERY2.SQL.Add('                             AND HB.IDBENEFICIO ='+_IDBENEFICIO);
_QUERY2.SQL.Add('                             AND HB.NUMEROPROCESSO ='+_NUMEROPROCESSO);
_QUERY2.SQL.Add('                             AND HB.IDPESSJUR ='+_IDPESSJUR);
_QUERY2.SQL.Add('                             AND HB.IDTITULAR ='+_IDTITULAR);
_QUERY2.SQL.Add('                             AND HB.IDPLANOORIGEM ='+_IDPLANOORIGEM);
_QUERY2.SQL.Add('                             AND HB.IDPESSOA ='+_IDPESSOA);
_QUERY2.SQL.Add('                             AND TRUNC(HB.TRGDTINCLUSAO) = TRUNC(SYSDATE) '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
_QUERY2.SQL.Add('                             AND HB.SEQPROPOSTA ='+_SEQPROPOSTA);
_QUERY2.SQL.Add('                             AND HB.Dtefetpgto is null AND HB.MESREFERENCIA ='+#39+_MESREF+#39); // SOL 222734 KTN 2062476
_query2.open;
//

sSQL := 'SELECT 1 AS FLGCONCESSAO,                                       '+
        OraNumero(FloatToStr(_query2.FieldByName('VlMes').value))          +' AS VLBENEFPGTO,   '+
        OraNumero(FloatToStr(_query2.FieldByName('VlMes').value))          +' AS VALORATUAL,    '+
        OraNumero(FloatToStr(_query2.FieldByName('VlMes').value))       +' AS VALORINTEGRAL, '+
        OraNumero(FloatToStr(_query2.FieldByName('VlMes').value))          +' AS VALORPROVENTO, '+
        OraNumero(FloatToStr(0))            +' AS VALORBUARA, '+
        QuotedStr(PreparaStrRegra(_DATAINICIO))     +' AS DATAINICIO,  '+
        QuotedStr(PreparaStrRegra(_DATAFINAL))    +' AS DATAFINAL,   '+
        QuotedStr(_MESREF)    +' AS MESREFERENCIA,   '+
        QuotedStr(_MESREF)    +' AS ANOMESREF,   '+
        (_IDPESSJUR)     +' AS IDPESSJUR,   '+
        (_IDPLANOPREV)   +' AS IDPLANOPREV, '+
        (_IDTITULAR)     +' AS IDTITULAR,   '+
        (_IDPESSOA)      +' AS IDPESSOA,    '+
        (_IDBENEFICIO) +' AS IDBENEFICIO  '+
        ' ,'''+datetostr(now)+''' DATAREF, '+
        ' '+(_NUMEROPROCESSO)+' AS NUMEROPROCESSO,   '+
        QuotedStr(_DATAENCERRAMENTO)+' AS DATAENCERRAMENTO, '+
        ' '+IntToStr(-1)        +' AS ORIGEM,         '+
        ' '+IntToStr(iIdLoteConcessao)+' AS IDLOTE,         '+
        ' '+IntToStr(iIdLoteConcessao)  +' AS IDLOTEREVISAO   '+
        'FROM DUAL ';



  if IDREGRACALCULO<>'' then
      sValorRegra := RegraNumerica(IDREGRACALCULO, sSQL, bErro, Inteiro )
  else
      sValorRegra:='0';

  iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');




_queryAUX.active:=false;
_queryAUX.sql.clear;
_queryAUX.sql.append(' select CODPORTFORMA from benefplanprev where idplanoprev='+#39+_idplanoprev+#39);
_queryAUX.sql.append(' and  idbeneficio='+#39+_idbeneficio+#39);
_queryAUX.open;
sCODPORTFORMA:=_queryAUX.fieldbyname('CODPORTFORMA').text;
_queryAUX.close;


sValorRegra:=ClienteNumero(sValorRegra);

//Marcio Sanches Spinosa SOL 229678 KTN 346409 - Inicio
//if copy(trim(_MESREF),6,2)='13' then
//   begin
//    _queryAUX.active:=false;
//    _queryAUX.sql.clear;
//    _queryAUX.SQL.Add('SELECT SUM(DECODE(FLGDEVOLUCAO, 1, -valorrecebido, valorrecebido)) AS valorrecebido');
//    _queryAUX.SQL.Add('  FROM hstcontribprev');
//    _queryAUX.SQL.Add(' WHERE IDPESSOA = '+_IDPESSOA);
//    _queryAUX.SQL.Add('   AND MESREFERENCIA ='+#39+_MESREF+#39);
//    _queryAUX.SQL.Add('   AND IDPLANOPREV ='+#39+_idplanoprev+#39);
//    _queryAUX.open;
//     if _queryAUX.fieldbyname('valorrecebido').value<> null then
//        begin
//          if sValorRegra<>'' then
//             begin
//               if strtofloat(sValorRegra)>_queryAUX.fieldbyname('valorrecebido').asfloat then
//                 sValorRegra:=floattostr(strtofloat(sValorRegra)-_queryAUX.fieldbyname('valorrecebido').asfloat)
//               else
//                 sValorRegra:='0';
//             end
//        end;
//    _queryAUX.Close;
//   end;
//Marcio Sanches Spinosa SOL 229678 KTN 346409 - Fim

sValorRegra:=OraNumero(sValorRegra);

_QUERY.SQL.Add('  INSERT INTO HSTCONTRIBPREV');
_QUERY.SQL.Add('    (MESREFERENCIA,');//1
_QUERY.SQL.Add('     MESCOBRANCA,');//2
_QUERY.SQL.Add('     NUMRECEBIMENTO,');//3
_QUERY.SQL.Add('     CODPORTFORMA,');//4
_QUERY.SQL.Add('     DATAPREVISAORECE,');//5
_QUERY.SQL.Add('     VALORESPERADO,');//6
_QUERY.SQL.Add('     VALORCALCULADO,');//7
_QUERY.SQL.Add('     FLGDEVOLUCAO,');//8
_QUERY.SQL.Add('     IDREGRACALCULO,');//9
_QUERY.SQL.Add('     FLGDESCFOLHA,');//10
_QUERY.SQL.Add('     IDPESSOA,');//11
_QUERY.SQL.Add('     SEQPROPOSTA,');//12
_QUERY.SQL.Add('     IDPESSJUR,');//13
_QUERY.SQL.Add('     IDPLANOPREV,');//14
_QUERY.SQL.Add('     IDCONTRIBUICAO,');//15
_QUERY.SQL.Add('     FLGCALCRESERVA,');//16
_QUERY.SQL.Add('     VALOROP1,');//17
_QUERY.SQL.Add('     VALOROP2,');//18
_QUERY.SQL.Add('     VALOROP3,');//19
_QUERY.SQL.Add('     DATAINICIO,');//20
_QUERY.SQL.Add('     DATAFINAL,');//21
_QUERY.SQL.Add('     FLGSITFUNDACAO,');//22
_QUERY.SQL.Add('     SITRECEBIMENTO,');//23
_QUERY.SQL.Add('     TIPO,');//24
_QUERY.SQL.Add('     IDLOTE,');//25
_QUERY.SQL.Add('     PARCELA,');//26
_QUERY.SQL.Add('     VALORRECEBIDO,');//27
_QUERY.SQL.Add('     DATARECEBIMENTO,');//28
_QUERY.SQL.Add('     FLGCONCESSAO,');//29
_QUERY.SQL.Add('     FLGEVENTO,');//30
_QUERY.SQL.Add('     DATAEMISSCOB,');//31
_QUERY.SQL.Add('     FLGINTEVENTO,');//32
_QUERY.SQL.Add('     IDMOTIVO,');//33
_QUERY.SQL.Add('     FOLHAORIGEM,');//34
_QUERY.SQL.Add('     IDTITULAR)'); //35
_QUERY.SQL.Add('  VALUES');
_QUERY.SQL.Add('    ('+#39+_MESREF+#39','); //1
_QUERY.SQL.Add('    '+#39+ME_anomes.text+#39','); //2

_QUERY.SQL.Add(IntToStr(iNumRecebimento)+',');//3
_QUERY.SQL.Add(#39+sCODPORTFORMA+#39+',');//4
//_QUERY.SQL.Add('    NULL,');//5
_QUERY.SQL.Add('     TO_DATE('+#39+_datapreparo+#39+', ''DD/MM/YYYY''),');//douglas.siqueira 212299
_QUERY.SQL.Add(sValorRegra+',');//6
_QUERY.SQL.Add(sValorRegra+',');//7
_QUERY.SQL.Add('     0,');//8
_QUERY.SQL.Add(IDREGRACALCULO+',');//9
_QUERY.SQL.Add('     1,');//10
_QUERY.SQL.Add(_IDPESSOA+',');//11
_QUERY.SQL.Add(_SEQPROPOSTA+',');//12
_QUERY.SQL.Add(_IDPESSJUR+',');//13
_QUERY.SQL.Add(_IDPLANOPREV+',');//14
_QUERY.SQL.Add(IDCONTRIBUICAO+',');//15
_QUERY.SQL.Add('     0,');//16
_QUERY.SQL.Add('     NULL,');//17
_QUERY.SQL.Add('     NULL,');//18
_QUERY.SQL.Add('     NULL,');//19
_QUERY.SQL.Add('     TO_DATE('+#39+_DATAINICIO+#39+', ''DD/MM/YYYY''),');//20
_QUERY.SQL.Add('     TO_DATE('+#39+_DATAFINAL+#39+', ''DD/MM/YYYY''),');//21
_QUERY.SQL.Add('     ''AS'',');//22
_QUERY.SQL.Add('     ''0'','); //23
_QUERY.SQL.Add('     ''F'','); //24
_QUERY.SQL.Add(IntToStr(iIdLoteConcessao)+',');//25
_QUERY.SQL.Add('     0,'); //26
_QUERY.SQL.Add('     NULL,');//27
_QUERY.SQL.Add('     NULL,');//28
_QUERY.SQL.Add('     1,');//29
_QUERY.SQL.Add('     0,');//30
_QUERY.SQL.Add('     SYSDATE,');//31
_QUERY.SQL.Add('     NULL,');//32
_QUERY.SQL.Add(#39+_IDMOTIVO+#39+',');//33
_QUERY.SQL.Add('     ''B'',');//34
_QUERY.SQL.Add(_IDTITULAR+')');//35

   try
_QUERY.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log('',string(E.message));
//                    Exit;
               end;
          end;




_query.close;
_query.Destroy;

_query2.close;
_query2.Destroy;

_queryAUX.close;
_queryAUX.Destroy;

_query3.close;
_query3.Destroy;
end;

procedure TFrmReverCotas.tbcDetalheChange(Sender: TObject);
begin
//  inherited;


//  inherited;
case tbcDetalhe.tabindex of
0:begin
  bbtnSelTudo.Visible:=True;
  bbtnInverte.Visible:=True;
  pnl_impressao.SendToBack;
  pnl1.SendToBack;
//  sbtnProcurarClick(sender);
  end;
1:begin
  bbtnSelTudo.Visible:=false;
  bbtnInverte.Visible:=false;

  buscarlog;
//  sbtnRequerer.Enabled:=false;

//  bbtnDesfazer.Enabled:=false;
  end;
2:begin
  bbtnSelTudo.Visible:=false;
  bbtnInverte.Visible:=false;
  configuralog;
//  sbtnRequerer.Enabled:=false;

//  bbtnDesfazer.Enabled:=false;
  end;
end;

end;

procedure TFrmReverCotas.ppDetailBand1BeforePrint(Sender: TObject);
var
  totalbenef:Double;
  totalcontri:Double;

 _query,_query2:TwwQuery;
begin



_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;

_query2 := TwwQuery.Create(Application);
_query2.DataBaseName := 'BaseDados';
_query2.close;


//  inherited;

  totalbenef:=0;
  totalcontri:=0;

if qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value>0 then
   begin
   lbl_mesabono.Visible:=True;
   ppDBText12.Visible:=True;
   ppDBText13.Visible:=True;
   ppDBText14.Visible:=True;
   ppDBText15.Visible:=True;
   ppDBText16.Visible:=True;
   lbl_vl_pg_abono.Visible:=True;
   lbl_mesCont_abono.Visible:=True;
   lbl_vl_pg_Cont_abo.Visible:=True;
   end
else
   begin
   lbl_mesabono.Visible:=false;
   ppDBText12.Visible:=false;
   ppDBText13.Visible:=false;
   ppDBText14.Visible:=false;
   ppDBText15.Visible:=false;
   ppDBText16.Visible:=false;
   lbl_vl_pg_abono.Visible:=false;
   lbl_mesCont_abono.Visible:=False;
   lbl_vl_pg_Cont_abo.Visible:=False;
   end;

 if qryRelatorio.fieldbyname('FONTEPAGADORA').text ='2' then
    begin
     lbl_mesCont.Visible:=false;
     lbl_mesCont_abono.Visible:=false;
     lbl_vl_pg_Cont.Visible:=false;
     lbl_vl_pg_Cont_abo.Visible:=false;
    end
else
    begin

     lbl_mesCont.Visible:=True;
     lbl_mesCont_abono.Visible:=True;
     lbl_vl_pg_Cont.Visible:=True;
     lbl_vl_pg_Cont_abo.Visible:=True;
    end;

//lbl_mes.caption:=copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/'+copy(qryRelatorio.fieldbyname('MÊS').text,4,2); // SOL 236004 PPM 461575
lbl_mes.caption:=qryRelatorio.fieldbyname('MÊS').text; // SOL 236004 PPM 461575
//lbl_mesabono.caption:=copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/13';  // SOL 236004 PPM 461575
lbl_mesabono.caption:=copy(qryRelatorio.fieldbyname('MÊS').text,1,4)+'/13'; // SOL 236004 PPM 461575
IF qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').VALUE>0 THEN
    lbl_vl_pg_abono.caption:=FormatFloat('0.00',qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').VALUE)
else
    lbl_vl_pg_abono.caption:='0';

lbl_mesCont.caption:=lbl_mes.caption;


try
totalbenef:=qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value+qryRelatorio.fieldbyname('VALOR A SER PAGO').Value;
totalbenef:= totalbenef + qryRelatorio.fieldbyname('VALOR DESC PAGO ABONO').Value;   //edilaine - SIG33727
except
  end;



//abono
_query.Close;
_query.SQL.clear;
//_query.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)valoresperado');        // edilaine - SOL 253577-18151 / PPM 1318910
_query.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)valoresperado');         // edilaine - SOL 253577-18151 / PPM 1318910
_query.SQL.Add(' FROM hstcontribprev hc');
_query.SQL.Add('    WHERE --hc.idcontribuicao = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500) AND');
_query.SQL.Add('        hc.idpessoa =' +qryRelatorio.fieldbyname('idpessoa').text);
_query.SQL.Add('  and     hc.idtitular =' +qryRelatorio.fieldbyname('idtitular').text);
//_query.SQL.Add(' and hc.MESREFERENCIA = '#39+copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/13'+#39); // SOL 236004 PPM 461575
_query.SQL.Add(' and hc.MESREFERENCIA = '#39+copy(qryRelatorio.fieldbyname('MÊS').text,1,4)+'/13'+#39); // SOL 236004 PPM 461575
_query.Open;

// edilaine - SOL 253577-18151 / PPM 1318910 - inicio
{if _query.fieldbyname('valoresperado').value>0 then
   lbl_vl_pg_Cont_abo.caption:='-'+FormatFloat('0.00',_query.fieldbyname('valoresperado').value)
else
   lbl_vl_pg_Cont_abo.caption:='0';   }

lbl_vl_pg_Cont_abo.caption:=FormatFloat('0.00',_query.fieldbyname('valoresperado').value);
// edilaine - SOL 253577-18151 / PPM 1318910 - fim


////normal
_query2.Close;
_query2.SQL.clear;
//_query2.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)valoresperado');      // edilaine - SOL 253577-18151 / PPM 1318910
_query2.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)valoresperado');        // edilaine - SOL 253577-18151 / PPM 1318910
_query2.SQL.Add(' FROM hstcontribprev hc');
_query2.SQL.Add('    WHERE --hc.idcontribuicao = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500) AND');
_query2.SQL.Add('        hc.idpessoa =' +qryRelatorio.fieldbyname('idpessoa').text);
_query2.SQL.Add('  and     hc.idtitular =' +qryRelatorio.fieldbyname('idtitular').text);
//_query2.SQL.Add(' AND      hc.valorrecebido is null and hc.MESREFERENCIA = '#39+copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/'+copy(qryRelatorio.fieldbyname('MÊS').text,4,2)+#39); // SOL 222734 KTN 2062476 // SOL 236004 PPM 461575
_query2.SQL.Add(' AND      hc.valorrecebido is null and hc.MESREFERENCIA = '#39+qryRelatorio.fieldbyname('MÊS').text+#39); // SOL 222734 KTN 2062476 // SOL 236004 PPM 461575
_query2.Open;

// edilaine - SOL 253577-18151 / PPM 1318910 - inicio
{if _query.fieldbyname('valoresperado').value>0 then
   lbl_vl_pg_Cont.caption:='-'+FormatFloat('0.00',_query.fieldbyname('valoresperado').value)
else
   lbl_vl_pg_Cont.caption:='0';  }

lbl_vl_pg_Cont.caption:= FormatFloat('0.00',_query.fieldbyname('valoresperado').value);
// edilaine - SOL 253577-18151 / PPM 1318910 - fim


try
totalcontri:=_query.fieldbyname('valoresperado').value+_query2.fieldbyname('valoresperado').Value;
except
end;

////////////


lbl_tot_benef.Caption:=FormatFloat('0.00',totalbenef);
lbl_tot_contri.Caption:= {'-'+} FormatFloat('0.00',totalcontri);      // edilaine - SOL 253577-18151 / PPM 1318910
lbl_total.Caption:=FormatFloat('0.00',totalbenef + totalcontri);   
_query.Close;
_query.Destroy;


_query2.Close;
_query2.Destroy;
end;

procedure TFrmReverCotas.gera_impressao_rel_mens;
begin
qrydsReversaoCotasMensal.close;
qrydsReversaoCotasMensal.SQL.clear;
qrydsReversaoCotasMensal.SQL.Add('SELECT DPT.MATRICULA AS "MATRÍCULA",');
qrydsReversaoCotasMensal.SQL.Add('       (SELECT NOME FROM PESSOA P WHERE P.IDPESSOA = BF.IDTITULAR) NOME,');
qrydsReversaoCotasMensal.SQL.Add('       DP.MATRICULA AS "MATRÍCULA DO BENEFICIÁRIO",');
qrydsReversaoCotasMensal.SQL.Add('       (SELECT NOME FROM PESSOA P WHERE P.IDPESSOA = BF.IDPESSOA) NOME2,');
qrydsReversaoCotasMensal.SQL.Add('       BF.DATAFINAL,');  

qrydsReversaoCotasMensal.SQL.Add('       (SELECT MAX(PERCENTUAL)');
qrydsReversaoCotasMensal.SQL.Add('          FROM HSTPERCGRUPO HG');
qrydsReversaoCotasMensal.SQL.Add('         WHERE HG.IDPESSJUR = BF.IDPESSJUR');
qrydsReversaoCotasMensal.SQL.Add('           AND HG.IDTITULAR = BF.IDTITULAR');
qrydsReversaoCotasMensal.SQL.Add('           AND HG.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qrydsReversaoCotasMensal.SQL.Add('           AND HG.IDPESSOA = BF.IDPESSOA');
qrydsReversaoCotasMensal.SQL.Add('           AND HG.SEQPROPOSTA = BF.SEQPROPOSTA');
qrydsReversaoCotasMensal.SQL.Add('           AND HG.IDPLANOPREV = BF.IDPLANOPREV');
qrydsReversaoCotasMensal.SQL.Add('           AND HG.IDBENEFICIO = BF.IDBENEFICIO');
qrydsReversaoCotasMensal.SQL.Add('           AND HG.NUMEROPROCESSO = BF.NUMEROPROCESSO');
qrydsReversaoCotasMensal.SQL.Add('           AND TO_CHAR(HG.DATAFIM, ''YYYY/MM'') ='+#39+ME_anomes.TEXT+#39+' )AS "PERCENTUAL ANTERIOR",');
qrydsReversaoCotasMensal.SQL.Add('       BTT.PERCENTUAL "PERCENTUAL ATUAL",');
qrydsReversaoCotasMensal.SQL.Add('       ');
qrydsReversaoCotasMensal.SQL.Add('       BF.VALORTOTAL "VALOR TOTAL",');
qrydsReversaoCotasMensal.SQL.Add('       BF.VALORATUAL "VALOR ATUAL",');
qrydsReversaoCotasMensal.SQL.Add('       (SELECT NOME FROM BENEFICIO B WHERE B.IDBENEFICIO = BF.IDBENEFICIO) NOMEBENEFICIO,');
qrydsReversaoCotasMensal.SQL.Add('       decode(BF.IDSITBENEFICIO, 1, ''ATIVO'', 3, ''CANCELADO'') SITUACAO');
qrydsReversaoCotasMensal.SQL.Add('');
qrydsReversaoCotasMensal.SQL.Add('FROM BENEFBFCIARIO BF');
qrydsReversaoCotasMensal.SQL.Add('     JOIN DEPENTIT DPT ON DPT.IDTITULAR = BF.IDTITULAR');
qrydsReversaoCotasMensal.SQL.Add('                      AND DPT.IDPESSOA = BF.IDTITULAR');
qrydsReversaoCotasMensal.SQL.Add('     JOIN DEPENTIT DP ON BF.IDPESSOA = DP.IDPESSOA');
qrydsReversaoCotasMensal.SQL.Add('                     AND BF.IDTITULAR = DP.IDTITULAR     ');
qrydsReversaoCotasMensal.SQL.Add('     JOIN PESSOA P ON P.IDPESSOA = BF.IDPESSOA');
qrydsReversaoCotasMensal.SQL.Add('     JOIN BENEFICIO B ON BF.IDBENEFICIO = B.IDBENEFICIO');
qrydsReversaoCotasMensal.SQL.Add('     JOIN BFCIARIOTITPLAN BTT ON BTT.IDPESSJUR = BF.IDPESSJUR');
qrydsReversaoCotasMensal.SQL.Add('                             AND BTT.IDTITULAR = BF.IDTITULAR');
qrydsReversaoCotasMensal.SQL.Add('                             AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qrydsReversaoCotasMensal.SQL.Add('                             AND BTT.IDPESSOA = BF.IDPESSOA');
qrydsReversaoCotasMensal.SQL.Add('                             AND BTT.SEQPROPOSTA = BF.SEQPROPOSTA');
qrydsReversaoCotasMensal.SQL.Add('                             AND BTT.IDPLANOPREV = BF.IDPLANOPREV');
qrydsReversaoCotasMensal.SQL.Add('                             AND BTT.IDBENEFICIO = BF.IDBENEFICIO');
qrydsReversaoCotasMensal.SQL.Add('     JOIN MOVBENEF MB ON MB.IDPESSJUR = BF.IDPESSJUR');
qrydsReversaoCotasMensal.SQL.Add('                     AND MB.IDTITULAR = BF.IDTITULAR');
qrydsReversaoCotasMensal.SQL.Add('                     AND MB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
qrydsReversaoCotasMensal.SQL.Add('                     AND MB.IDPESSOA = BF.IDPESSOA');
qrydsReversaoCotasMensal.SQL.Add('                     AND MB.SEQPROPOSTA = BF.SEQPROPOSTA');
qrydsReversaoCotasMensal.SQL.Add('                     AND MB.IDPLANOPREV = BF.IDPLANOPREV');
qrydsReversaoCotasMensal.SQL.Add('                     AND MB.IDBENEFICIO = BF.IDBENEFICIO');
qrydsReversaoCotasMensal.SQL.Add('                     ');
qrydsReversaoCotasMensal.SQL.Add(' WHERE (BF.IDSITBENEFICIO in (1,2,3) )');
qrydsReversaoCotasMensal.SQL.Add('   AND MB.TIPOMOV = 16');
qrydsReversaoCotasMensal.SQL.Add('   AND MB.IDDESFAZER IS NULL ');    //edilaine SIG135320
qrydsReversaoCotasMensal.SQL.Add(' AND trunc(MB.DATAMOV) = trunc(sysdate) '); // Thiago Melo/Xavier SOL 229888 PPM 349946
qrydsReversaoCotasMensal.SQL.Add('   AND BF.IDTPPAGTOBENEFIC = 1');
qrydsReversaoCotasMensal.SQL.Add('ORDER BY 1, 2, 3');
qrydsReversaoCotasMensal.Open;


TFrmPreview.CreateModalPreview(Application, rpReversaoCotasMensal,'Relatório Mensal');

qrydsReversaoCotasMensal.close;;

end;

procedure TFrmReverCotas.rpReversaoCotasMensalBeforePrint(Sender: TObject);
var
  _query :TwwQuery;
begin
  inherited;


_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;
_query.SQL.clear;

_query.SQL.Add('SELECT distinct matricula');
_query.SQL.Add('FROM BENEFBFCIARIO BF');
_query.SQL.Add('     JOIN DEPENTIT DPT ON DPT.IDTITULAR = BF.IDTITULAR');
_query.SQL.Add('                      AND DPT.IDPESSOA = BF.IDTITULAR');
_query.SQL.Add('     JOIN BFCIARIOTITPLAN BTT ON BTT.IDPESSJUR = BF.IDPESSJUR');
_query.SQL.Add('                             AND BTT.IDTITULAR = BF.IDTITULAR');
_query.SQL.Add('                             AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM');
_query.SQL.Add('                             AND BTT.IDPESSOA = BF.IDPESSOA');
_query.SQL.Add('                             AND BTT.SEQPROPOSTA = BF.SEQPROPOSTA');
_query.SQL.Add('                             AND BTT.IDPLANOPREV = BF.IDPLANOPREV');
_query.SQL.Add('                             AND BTT.IDBENEFICIO = BF.IDBENEFICIO');
_query.SQL.Add('     JOIN MOVBENEF MB ON MB.IDPESSJUR = BF.IDPESSJUR');
_query.SQL.Add('                     AND MB.IDTITULAR = BF.IDTITULAR');
_query.SQL.Add('                     AND MB.IDPLANOORIGEM = BF.IDPLANOORIGEM');
_query.SQL.Add('                     AND MB.IDPESSOA = BF.IDPESSOA');
_query.SQL.Add('                     AND MB.SEQPROPOSTA = BF.SEQPROPOSTA');
_query.SQL.Add('                     AND MB.IDPLANOPREV = BF.IDPLANOPREV');
_query.SQL.Add('                     AND MB.IDBENEFICIO = BF.IDBENEFICIO');
_query.SQL.Add('                     ');
_query.SQL.Add(' WHERE (BF.IDSITBENEFICIO in (1,2,3) )');
_query.SQL.Add('   AND MB.TIPOMOV = 16');
_query.SQL.Add(' AND trunc(MB.DATAMOV) = trunc(sysdate) ');
_query.SQL.Add('   AND BF.IDTPPAGTOBENEFIC = 1');
_query.SQL.Add('ORDER BY matricula');

_query.open;
_query.recordcount;


lbl_tot_tit.caption:=inttostr(_query.recordcount);

lbl_tot_pens.caption:=inttostr(qrydsReversaoCotasMensal.recordcount);

_query.close;
_query.destroy;


end;

procedure TFrmReverCotas.ppHeaderBand2BeforePrint(Sender: TObject);
begin
  inherited;
lbl_mesano2.Caption:=ME_anomes.Text;
end;

procedure TFrmReverCotas.RemoveDuplicates(var stringList: TStringList);
var  
  buffer: TStringList;  
  cnt: Integer;  
begin
  stringList.Sort;  
  buffer := TStringList.Create;  
  try
    buffer.Sorted := True;
    buffer.Duplicates := dupIgnore;
    buffer.BeginUpdate;
    for cnt := 0 to stringList.Count - 1 do
      buffer.Add(stringList[cnt]) ;
    buffer.EndUpdate;
    stringList.Assign(buffer) ;
  finally
    FreeandNil(buffer) ;
  end;
end;

procedure TFrmReverCotas.ppDetailBand3BeforePrint(Sender: TObject);
var
  totalbenef:Double;
  totalcontri:Double;
  totalcontriExtr : Double;//Helio - SOL Nº 253577/17666 PPM Nº 1019935
 _query,_query2:TwwQuery;
begin

_query := TwwQuery.Create(Application);
_query.DataBaseName := 'BaseDados';
_query.close;

_query2 := TwwQuery.Create(Application);
_query2.DataBaseName := 'BaseDados';
_query2.close;

  totalbenef:=0;
  totalcontri:=0;
  totalcontriExtr:=0;//Helio - SOL Nº 253577/17666 PPM Nº 1019935

  //edilaine - SIG48583 - inicio comentario
 {if qryRelatorio.fieldbyname('FONTEPAGADORA').text ='2' then
    begin
     lbl_mesCont2.Visible:=false;
     lbl_mesCont_abono2.Visible:=false;
     lbl_vl_pg_Cont2.Visible:=false;
     lbl_vl_pg_Cont_abo2.Visible:=false;
     //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
     ppLblVlrContrib.visible := false;
     ppTxtNomeContrib.visible := false;
     ppTxtNomeContribAbono.visible := false;
     //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    end
else
    begin

     lbl_mesCont2.Visible:=True;
     lbl_mesCont_abono2.Visible:=True;
     lbl_vl_pg_Cont2.Visible:=True;
     lbl_vl_pg_Cont_abo2.Visible:=True;
     //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
     ppLblVlrContrib.visible := true;
     ppTxtNomeContrib.visible := true;
     ppTxtNomeContribAbono.visible := true;
     //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    end;
  }//edilaine - SIG48583 - fim  comentario

if (qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value>0) and
   (qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then
   begin

   lbl_mes_abono2.Visible:=True;
   ppDBText40.Visible:=True;
   ppDBText41.Visible:=True;
   ppDBText42.Visible:=True;   
   ppDBText44.Visible:=True;
   lbl_vl_pg_abono2.Visible:=True;
   lbl_vl_atual_antec2.Visible:=True; // SOL 233734 PPM 433623 e SOL 234481 PPM 433635 
   //lbl_mesCont_abono2.Visible:=True;                   //edilaine - SIG48583
   //lbl_vl_pg_Cont_abo2.Visible:=True;                  //edilaine - SIG48583
   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   lbl_vl_valorbs_abono.Visible := True;
   lbl_vl_valorfab_abono.Visible := True;
   lbl_vl_valordeficit_abono.Visible := True;
   //ppTxtNomeContribAbono.Visible := true;              //edilaine - SIG48583
   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   end
else
   begin
   lbl_mes_abono2.Visible:=false;
   ppDBText40.Visible:=false;
   ppDBText41.Visible:=false;
   ppDBText42.Visible:=false;   
   ppDBText44.Visible:=false;
   lbl_vl_pg_abono2.Visible:=false;
   lbl_vl_atual_antec2.Visible:=False; // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
   //lbl_mesCont_abono2.Visible:=False;                      //edilaine - SIG48583
   //lbl_vl_pg_Cont_abo2.Visible:=False;                     //edilaine - SIG48583
   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   lbl_vl_valorbs_abono.Visible := False;
   lbl_vl_valorfab_abono.Visible := False;
   lbl_vl_valordeficit_abono.Visible := False;
   //ppTxtNomeContribAbono.visible := false;                 //edilaine - SIG48583
   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   end;

   //edilaine - SIG33727 - INICIO
   if (abs(qryRelatorio.fieldbyname('VALOR DESC PAGO ABONO').Value) > 0) and
      (qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then
   begin
     lbl_mesabono3.Visible          := true;
     lbl_vl_perc_ant_abono3.Visible := true;
     lbl_vl_perc_atu_abono3.Visible := true;
     lbl_vl_total_abono3.Visible    := true;
     lbl_vl_bs_abono3.Visible       := true;
     lbl_vl_fab_abono3.Visible      := true;
     lbl_vl_atual_antec3.Visible    := true;
     lbl_vl_atual_depois3.Visible   := true;
     lbl_vl_pg_abono3.Visible       := true;
     lbl_vl_deficit_abono3.Visible  := true;
   end
   else
   begin
     lbl_mesabono3.Visible          := False;
     lbl_vl_perc_ant_abono3.Visible := False;
     lbl_vl_perc_atu_abono3.Visible := False;
     lbl_vl_total_abono3.Visible    := False;
     lbl_vl_bs_abono3.Visible       := False;
     lbl_vl_fab_abono3.Visible      := False;
     lbl_vl_atual_antec3.Visible    := False;
     lbl_vl_atual_depois3.Visible   := False;
     lbl_vl_pg_abono3.Visible       := False;
     lbl_vl_deficit_abono3.Visible  := False;
   end;
   //edilaine - SIG33727 - FIM


//lbl_mes2.caption:=copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/'+copy(qryRelatorio.fieldbyname('MÊS').text,4,2); // SOL 236004 PPM 461575
lbl_mes2.caption:=qryRelatorio.fieldbyname('MÊS').text; // SOL 236004 PPM 461575
//lbl_mes_abono2.caption:=copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/13'; // SOL 236004 PPM 461575
lbl_mes_abono2.caption:=copy(qryRelatorio.fieldbyname('MÊS').text,1,4)+'/13'; // SOL 236004 PPM 461575
if (qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value>0) and
   (qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then

    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    //lbl_vl_pg_abono2.caption:=FormatFloat('0.00',qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').VALUE)
    lbl_vl_pg_abono2.caption:=FormatFloat('#,##0.00',qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').VALUE)
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
else
    lbl_vl_pg_abono2.caption:='0';
// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
if (qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value>0) and
   (qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then

    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    //lbl_vl_atual_antec2.caption:= floattostr(qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').value + qryRelatorio.fieldbyname('VALORATUALABONO').value)
    //lbl_vl_atual_antec2.caption:= FormatFloat('#,##0.00', (qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').value + qryRelatorio.fieldbyname('VALORATUALABONO').value))
    //lbl_vl_atual_antec2.caption:= FormatFloat('#,##0.00', qryRelatorio.fieldbyname('VALOR ATUAL(ANTEC)').value)     // Andre Imakawa - SIG 45005/45579
    lbl_vl_atual_antec2.caption:= FormatFloat('#,##0.00', (qryRelatorio.fieldbyname('VALORABONO13').value)) // Andre Imakawa - SIG 45005/45579
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
else
    lbl_vl_atual_antec2.caption:='0';
// SOL 233734 PPM 433623 e SOL 234481 PPM 433635

   //edilaine - SIG33727 - INICIO
   if (abs(qryRelatorio.fieldbyname('VALOR DESC PAGO ABONO').Value) > 0) and
      (qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then
   begin
       lbl_mesabono3.caption       := copy(qryRelatorio.fieldbyname('MÊS').text,1,4)+'/13';
       lbl_vl_pg_abono3.caption    := FormatFloat('#,##0.00',qryRelatorio.fieldbyname('VALOR DESC PAGO ABONO').VALUE);
       lbl_vl_atual_antec3.caption := FormatFloat('#,##0.00', (qryRelatorio.fieldbyname('VALORABONO13DEV').value));
   end;
   //edilaine - SIG33727 - fim


//edilaine - SIG48583 - inicio
{lbl_mesCont2.caption:=lbl_mes2.caption;
lbl_mesContExtr.caption:=lbl_mes2.caption; //Helio - SOL Nº 253577/17666 PPM Nº 1019935
}//edilaine - SIG48583 - fim

// edilaine - SOL 253577-18151 / PPM 1318910 - inicio
{IF qryRelatorio.fieldbyname('VALORESPERADO').value>0 THEN
   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   //lbl_vl_pg_Cont2.caption:='-'+FormatFloat('0.00',qryRelatorio.fieldbyname('VALORESPERADO').value)
   lbl_vl_pg_Cont2.caption:='-'+FormatFloat('#,##0.00',qryRelatorio.fieldbyname('VALORESPERADO').value)
   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
else
   lbl_vl_pg_Cont2.caption:= '0';}

//lbl_vl_pg_Cont2.caption:= FormatFloat('#,##0.00',qryRelatorio.fieldbyname('VALORESPERADO').value);    //edilaine - SIG48583
// edilaine - SOL 253577-18151 / PPM 1318910 - fim

//edilaine - SIG48583 - inicio
{lbl_mesCont_abono2.caption:=lbl_mes_abono2.caption;
lbl_mesCont_abonoExtr.caption:=lbl_mes_abono2.caption;
}//edilaine - SIG48583 - fim

// edilaine - SOL 253577-18151 / PPM 1318910 - inicio
{if qryRelatorio.fieldbyname('VALORESPERADOABONO').value>0 then
   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   //lbl_vl_pg_Cont_abo2.caption:='-'+FormatFloat('0.00',qryRelatorio.fieldbyname('VALORESPERADOABONO').value)
   lbl_vl_pg_Cont_abo2.caption:='-'+FormatFloat('#,##0.00',qryRelatorio.fieldbyname('VALORESPERADOABONO').value)
   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
else
   lbl_vl_pg_Cont_abo2.caption:= '0';}

//lbl_vl_pg_Cont_abo2.caption:= FormatFloat('#,##0.00',qryRelatorio.fieldbyname('VALORESPERADOABONO').value);       //edilaine - SIG48583
// edilaine - SOL 253577-18151 / PPM 1318910 - fim

   if (qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value>0) and
   (qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then
    begin

      try
        totalbenef:=qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value+qryRelatorio.fieldbyname('VALOR A SER PAGO').Value;
        totalbenef:= totalbenef + qryRelatorio.fieldbyname('VALOR DESC PAGO ABONO').Value;
      except
      end;

   end
   else
    totalbenef:=qryRelatorio.fieldbyname('VALOR A SER PAGO').Value;


 //edilaine - SIG48583 - inicio
 {if (qryRelatorio.fieldbyname('VALOR A SER PAGO ABONO').Value>0) and
    (qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then
     begin

       try
       totalcontri:=qryRelatorio.fieldbyname('VALORESPERADO').value+qryRelatorio.fieldbyname('VALORESPERADOABONO').Value;
       //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
       totalcontriExtr := qryRelatorio.fieldbyname('VALORESPERADOEXTR').AsFloat +
                          qryRelatorio.fieldbyname('VALORESPERADOABONOEXTR').AsFloat;
       //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
       except
       end;

    end
 else
   totalcontri:=qryRelatorio.fieldbyname('VALORESPERADO').value;
   totalcontriExtr := qryRelatorio.fieldbyname('VALORESPERADOEXTR').AsFloat + qryRelatorio.fieldbyname('VALORESPERADOABONOEXTR').AsFloat; //Helio - SOL Nº 253577/17666 PPM Nº 1019935


if(qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then
   begin

    //abono
    _query.Close;
    _query.SQL.clear;
    //_query.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)valoresperado');   // edilaine - SOL 253577-18151 / PPM 1318910
    _query.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)valoresperado');     // edilaine - SOL 253577-18151 / PPM 1318910
    _query.SQL.Add(' FROM hstcontribprev hc');
    _query.SQL.Add('    WHERE --hc.idcontribuicao = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500) AND');
    _query.SQL.Add('         hc.idcontribuicao = DECODE(' + qryRelatorio.fieldbyname('IDPLANPREVCONTAB').Text + ',2,259,28,633,500) AND'); //Helio - SOL Nº 253577/17666 PPM Nº 1019935
    _query.SQL.Add('        hc.idpessoa =' +qryRelatorio.fieldbyname('idpessoa').text);
    _query.SQL.Add('  and     hc.idtitular =' +qryRelatorio.fieldbyname('idtitular').text);
    _query.SQL.Add('  and     hc.idplanoprev =' +qryRelatorio.fieldbyname('idplanoprev').text);
    _query.SQL.Add('  and     TRUNC(hc.TRGDTINCLUSAO) =  TRUNC(SYSDATE) '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
//    _query.SQL.Add('  and      hc.valorrecebido is null and hc.MESREFERENCIA = '#39+copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/13'+#39); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635 // SOL 236004 PPM 461575
    _query.SQL.Add('  and      hc.valorrecebido is null and hc.MESREFERENCIA = '#39+copy(qryRelatorio.fieldbyname('MÊS').text,1,4)+'/13'+#39); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635 // SOL 236004 PPM 461575
    _query.Open;

    // edilaine - SOL 253577-18151 / PPM 1318910 - fim
    //if _query.fieldbyname('valoresperado').value>0 then
       //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
       //lbl_vl_pg_Cont_abo2.caption:='-'+FormatFloat('0.00',_query.fieldbyname('valoresperado').value)
    //   lbl_vl_pg_Cont_abo2.caption:='-'+FormatFloat('#,##0.00',_query.fieldbyname('valoresperado').value)
       //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    //else
    //   lbl_vl_pg_Cont_abo2.caption:= '0';

    //lbl_vl_pg_Cont_abo2.caption:= FormatFloat('#,##0.00',_query.fieldbyname('valoresperado').value);
    // edilaine - SOL 253577-18151 / PPM 1318910 - fim
  end
else
   lbl_vl_pg_Cont_abo2.caption:='0';

////normal
_query2.Close;
_query2.SQL.clear;
//_query2.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,0,hc.valoresperado,-hc.valoresperado)),0)valoresperado');   // edilaine - SOL 253577-18151 / PPM 1318910
_query2.SQL.Add(' SELECT nvl(sum(decode(hc.flgdevolucao,1,hc.valoresperado,-hc.valoresperado)),0)valoresperado');     // edilaine - SOL 253577-18151 / PPM 1318910
_query2.SQL.Add(' FROM hstcontribprev hc');
_query2.SQL.Add('    WHERE --hc.idcontribuicao = DECODE(BF.IDPLANPREVCONTAB,2,259,28,633,500) AND');
//_query2.SQL.Add('        hc.idpessoa =' +qryRelatorio.fieldbyname('idpessoa').text);
_query2.SQL.Add('         hc.idcontribuicao = DECODE(' + qryRelatorio.fieldbyname('IDPLANPREVCONTAB').Text + ',2,259,28,633,500) AND'); //Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query2.SQL.Add('        hc.idpessoa =' +qryRelatorio.fieldbyname('IDRESPONSAVEL').text);//Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query2.SQL.Add('  and     hc.valorop3 =' +qryRelatorio.fieldbyname('idpessoa').text); //Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query2.SQL.Add('  and     hc.idtitular =' +qryRelatorio.fieldbyname('idtitular').text);
_query2.SQL.Add('  and     hc.idplanoprev =' +qryRelatorio.fieldbyname('idplanoprev').text);
_query2.SQL.Add('  and     TRUNC(hc.TRGDTINCLUSAO) =  TRUNC(SYSDATE) '); // SOL 233734 PPM 433623 e SOL 234481 PPM 433635
//_query2.SQL.Add('  and      hc.valorrecebido is null and hc.MESREFERENCIA = '#39+copy(qryRelatorio.fieldbyname('MÊS').text,7,4)+'/'+copy(qryRelatorio.fieldbyname('MÊS').text,4,2)+#39); // SOL 222734 KTN 2062476 // SOL 236004 PPM 461575
_query2.SQL.Add('  and      hc.valorrecebido is null and hc.MESREFERENCIA = '#39+qryRelatorio.fieldbyname('MÊS').text+#39); // SOL 222734 KTN 2062476 // SOL 236004 PPM 461575
_query2.Open;

// edilaine - SOL 253577-18151 / PPM 1318910 - inicio
if _query2.fieldbyname('valoresperado').value>0 then
   //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
   //lbl_vl_pg_Cont2.caption:='-'+FormatFloat('0.00',_query2.fieldbyname('valoresperado').value)
   lbl_vl_pg_Cont2.caption:='-'+FormatFloat('#,##0.00',_query2.fieldbyname('valoresperado').value)
   //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
else
   lbl_vl_pg_Cont2.caption:= '0';

lbl_vl_pg_Cont2.caption:= FormatFloat('#,##0.00',_query2.fieldbyname('valoresperado').value);
// edilaine - SOL 253577-18151 / PPM 1318910 - fim


if(qryRelatorio.fieldbyname('PERCENTUAL ATUAL').Value=0) then
   begin
    try
    totalcontri:=_query.fieldbyname('valoresperado').value+_query2.fieldbyname('valoresperado').Value;
    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    totalcontriExtr := qryRelatorio.fieldbyname('VALORESPERADOEXTR').AsFloat +
                       qryRelatorio.fieldbyname('VALORESPERADOABONOEXTR').AsFloat;
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    except
    end;
    end
else
   totalcontri:=_query2.fieldbyname('valoresperado').Value;
   totalcontriExtr := qryRelatorio.fieldbyname('VALORESPERADOEXTR').AsFloat+qryRelatorio.fieldbyname('VALORESPERADOABONOEXTR').AsFloat; //Helio - SOL Nº 253577/17666 PPM Nº 1019935

} //edilaine - SIG48583 - FIM COMENTARIO

  RetornaTotalContrib(totalcontri, totalcontriExtr);   //edilaine - SIG48583


 if qryRelatorio.fieldbyname('FONTEPAGADORA').text ='2' then
    begin
     qryAcJudDeficit.close;  //edilaine SIG136241

    //lbl_mesCont2.Visible:=false;               //edilaine - SIG48583
    //lbl_mesCont_abono2.Visible:=false;         //edilaine - SIG48583
    //lbl_vl_pg_Cont2.Visible:=false;            //edilaine - SIG48583
    //lbl_vl_pg_Cont_abo2.Visible:=false;        //edilaine - SIG48583
    lbl_tot_contri2.Visible:=false;
    totalcontri:=0;
    totalcontriExtr := 0; //Helio - SOL Nº 253577/17666 PPM Nº 1019935
    ppLabel63.Visible:=false;
    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    //ppTxtNomeContribAbono.Visible := false;            //edilaine - SIG48583
    ppLabel64.Top := 0.5521;
    lbl_total2.Top := 0.5521;
    lbl_n_tot_contriExtr.Visible := False;
    lbl_tot_contriExtr.Visible := False;
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

    qryDemoContrib.close;              //Peterson Victor - SIG49063

    end
else
    begin
    lbl_tot_contri2.Visible:=True;
    ppLabel63.Visible:=True;

    //edilaine - SIG48583 - inicio
    //Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
    //if (qryRelatorio.FieldByName('NOMECONTRIBEXTR').AsString <> '') or
    //   (qryRelatorio.FieldByName('NOMECONTRIBABONOEXTR').AsString <> '') then
    if totalcontriExtr <> 0 then
    begin
          ppLabel64.Top := 0.9895;
          lbl_total2.Top := 0.9895;
          lbl_n_tot_contriExtr.Visible := True;
          lbl_tot_contriExtr.Visible := true;
    end else
    begin
          ppLabel64.Top := 0.7708;
          lbl_total2.Top := 0.7708;
          lbl_n_tot_contriExtr.Visible := False;
          lbl_tot_contriExtr.Visible := False;
    end;
    //Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935


    qryDemoContrib.close;
    qryDemoContrib.ParamByName('IDLOTE').AsInteger      := iIdLoteConcessao;
    qryDemoContrib.ParamByName('IDTITULAR').AsInteger   := qryRelatorio.FieldByName('IDTITULAR').AsInteger;
    qryDemoContrib.ParamByName('IDPESSJUR').AsInteger   := qryRelatorio.FieldByName('IDPESSJUR').AsInteger;
    qryDemoContrib.ParamByName('IDBENEFICIO').AsInteger := qryRelatorio.FieldByName('IDBENEFICIO').AsInteger;
    qryDemoContrib.ParamByName('IDPESSOA').AsInteger    := qryRelatorio.FieldByName('IDPESSOA').AsInteger;
    qryDemoContrib.open;
    //edilaine - SIG48583 - fim

    //edilaine - SIG50850 : inicio
    qryAcJudDeficit.close;
    qryAcJudDeficit.SQL.Clear;
    if qryRelatorio.FieldByName('IDTITULAR').AsInteger = qryRelatorio.FieldByName('IDPESSOA').AsInteger then
    begin
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO,    ');
      qryAcJudDeficit.SQL.Add('                C.NOME,              ');
      qryAcJudDeficit.SQL.Add('                AC.PERCACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESINIACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESFIMACJUDDEFICIT  ');
      qryAcJudDeficit.SQL.Add('  FROM CONTRIBPARTPACJUDDEFICIT AC        ');
      qryAcJudDeficit.SQL.Add('  JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = AC.IDCONTRIBUICAO ');
      qryAcJudDeficit.SQL.Add('  JOIN (SELECT CON.MESREFERENCIA, CON.IDCONTRIBUICAO, :IDPESSJUR as IDPESSJUR, ');
      qryAcJudDeficit.SQL.Add('               :IDPLANOPREV as IDPLANOPREV, :SEQPROPOSTA as SEQPROPOSTA, CON.IDRESPONSAVEL');
      qryAcJudDeficit.SQL.Add('          FROM (' + qryDemoContrib.SQL.text + ') CON ');
      qryAcJudDeficit.SQL.Add('       ) HST ON HST.IDCONTRIBUICAO = AC.IDCONTRIBUICAO  ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPESSJUR = AC.IDPESSJUR ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPLANOPREV = AC.IDPLANOPREV ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDRESPONSAVEL = AC.IDPESSOA ');
      qryAcJudDeficit.SQL.Add('            AND HST.SEQPROPOSTA = AC.SEQPROPOSTA ');
      qryAcJudDeficit.SQL.Add(' WHERE HST.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND       ');
      qryAcJudDeficit.SQL.Add('       NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM'')) ');
      qryAcJudDeficit.SQL.Add(' ORDER BY C.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT ');
    end
    else
    begin
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO,    ');
      qryAcJudDeficit.SQL.Add('                C.NOME,              ');
      qryAcJudDeficit.SQL.Add('                AC.PERCACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESINIACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESFIMACJUDDEFICIT  ');
      qryAcJudDeficit.SQL.Add('  FROM CONTRIBPREVNUCLEO CP');
      qryAcJudDeficit.SQL.Add('  JOIN CONTRIBNUCLEOACJUDDEFICIT AC');
      qryAcJudDeficit.SQL.Add('    ON AC.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDNUCLEOFAMILIAR = CP.IDNUCLEOFAMILIAR');
      qryAcJudDeficit.SQL.Add('  JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = AC.IDCONTRIBUICAO ');
      qryAcJudDeficit.SQL.Add('  JOIN (SELECT CON.MESREFERENCIA, CON.IDCONTRIBUICAO, :IDPESSJUR as IDPESSJUR, ');
      qryAcJudDeficit.SQL.Add('               :IDPLANOPREV as IDPLANOPREV, :SEQPROPOSTA as SEQPROPOSTA, CON.IDRESPONSAVEL');
      qryAcJudDeficit.SQL.Add('          FROM (' + qryDemoContrib.SQL.text + ') CON ');
      qryAcJudDeficit.SQL.Add('       ) HST ON HST.IDCONTRIBUICAO = AC.IDCONTRIBUICAO  ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPESSJUR = CP.IDPESSJUR ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPLANOPREV = CP.IDPLANOPREV ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDRESPONSAVEL = CP.IDPESSOA ');
      qryAcJudDeficit.SQL.Add('            AND HST.SEQPROPOSTA = CP.SEQPROPOSTA ');
      qryAcJudDeficit.SQL.Add(' WHERE HST.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND       ');
      qryAcJudDeficit.SQL.Add('       NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM'')) ');
      qryAcJudDeficit.SQL.Add(' ORDER BY C.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT ');
    end;
    qryAcJudDeficit.Prepare;
    qryAcJudDeficit.ParamByName('IDLOTE').AsInteger      := iIdLoteConcessao;
    qryAcJudDeficit.ParamByName('IDTITULAR').AsInteger   := qryRelatorio.FieldByName('IDTITULAR').AsInteger;
    qryAcJudDeficit.ParamByName('IDPESSJUR').AsInteger   := qryRelatorio.FieldByName('IDPESSJUR').AsInteger;
    qryAcJudDeficit.ParamByName('IDBENEFICIO').AsInteger := qryRelatorio.FieldByName('IDBENEFICIO').AsInteger;
    qryAcJudDeficit.ParamByName('IDPESSOA').AsInteger    := qryRelatorio.FieldByName('IDPESSOA').AsInteger;
    qryAcJudDeficit.ParamByName('IDPLANOPREV').AsInteger    := qryRelatorio.FieldByName('IDPLANOPREV').AsInteger;
    qryAcJudDeficit.ParamByName('SEQPROPOSTA').AsInteger    := qryRelatorio.FieldByName('SEQPROPOSTA').AsInteger;

    qryAcJudDeficit.open;
    //edilaine - SIG50850 : fim

    end;

    ppSubRepContrib1.Visible := not qryDemoContrib.IsEmpty;      //Peterson Victor - SIG49063

    // Alterado por FHBS - 18/10/2019 - SIG50850
    if not qryAcJudDeficit.Active then
      ppSubAcaoJud.Visible   := False
    else
      ppSubAcaoJud.Visible   := not qryAcJudDeficit.IsEmpty;     //edilaine - SIG50850
    // Fim - Alterado por FHBS - 18/10/2019 - SIG50850
    
////////////
//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
//lbl_tot_benef2.Caption:=FormatFloat('0.00',totalbenef);
//lbl_tot_contri2.Caption:='-'+FormatFloat('0.00',totalcontri);
//lbl_total2.Caption:=FormatFloat('0.00',totalbenef-totalcontri);

lbl_tot_benef2.Caption:=FormatFloat('#,##0.00',totalbenef);
lbl_tot_contri2.Caption:= {'-'+} FormatFloat('#,##0.00',totalcontri);           // edilaine - SOL 253577-18151 / PPM 1318910
lbl_tot_contriExtr.Caption:={'-'+} FormatFloat('#,##0.00',totalcontriExtr);     // edilaine - SOL 253577-18151 / PPM 1318910
lbl_total2.Caption:=FormatFloat('#,##0.00',totalbenef{-}+(totalcontri + totalcontriExtr));    // edilaine - SOL 253577-18151 / PPM 1318910
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935

ConfPPREport1BSFABBDeficit; //Helio - SOL Nº 253577/17666 PPM Nº 1019935

_query.Close;
_query.Destroy;


_query2.Close;
_query2.Destroy;

end;

procedure TFrmReverCotas.dbgrdDetCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;



If qryDetPBTT.Value <> qryDetPT1.Value then // condição
begin
    if ABrush.color = clWhite then
       ABrush.color := clred;
end
else
begin
    if ABrush.color = clred then
       ABrush.color := clWhite;
end;

end;

procedure TFrmReverCotas.ppGroupHeaderBand1BeforePrint(Sender: TObject);
var
  _query_header :TwwQuery;
begin
  inherited;




_query_header := TwwQuery.Create(Application);
_query_header.DataBaseName := 'BaseDados';
_query_header.close;
_query_header.SQL.clear;
_query_header.SQL.Append(' SELECT MATRICULA FROM DEPENTIT DP WHERE ');
_query_header.SQL.Append(' DP.IDPESSOA ='+qryRelatorio.fieldbyname('IDTITULAR').Text);
_query_header.open;

if not _query_header.IsEmpty then
   lbl_mattit2.Caption:=_query_header.fieldbyname('MATRICULA').Text
else
    lbl_mattit2.Caption:=' - ';

// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
if not _query_header.IsEmpty then
   lbl_mattit.Caption:=_query_header.fieldbyname('MATRICULA').Text
else
    lbl_mattit.Caption:=' - ';
// SOL 233734 PPM 433623 e SOL 234481 PPM 433635

_query_header.close;
_query_header.SQL.clear;
_query_header.SQL.Append(' SELECT NOME FROM PESSOA P WHERE ');
_query_header.SQL.Append(' IDPESSOA ='+qryRelatorio.fieldbyname('IDTITULAR').Text);
_query_header.open;

// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
if not _query_header.IsEmpty then
   lbl_nm_tit.Caption:=_query_header.fieldbyname('NOME').Text
ELSE
   lbl_nm_tit.Caption:=' - ';
// SOL 233734 PPM 433623 e SOL 234481 PPM 433635   

// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
if not _query_header.IsEmpty then
   lbl_nm_tit2.Caption:=_query_header.fieldbyname('NOME').Text
ELSE
   lbl_nm_tit2.Caption:=' - ';
// SOL 233734 PPM 433623 e SOL 234481 PPM 433635


//Inicio - Helio - SOL Nº 253577/17666 PPM Nº 1019935
_query_header.close;
_query_header.SQL.clear;
_query_header.SQL.Append(' SELECT DATAMORTE FROM PESSOAFISICA WHERE ');
_query_header.SQL.Append(' IDPESSOA ='+qryRelatorio.fieldbyname('IDTITULAR').Text);
_query_header.open;

if not _query_header.IsEmpty then
   lbl_data_falecimento_tit2.Caption := _query_header.fieldbyname('DATAMORTE').Text
ELSE
   lbl_data_falecimento_tit2.Caption := ' - ';
//Fim - Helio - SOL Nº 253577/17666 PPM Nº 1019935


// SOL 233734 PPM 433623 e SOL 234481 PPM 433635
lbl_mesano.Caption:=ME_anomes.Text;

// Paulo Nobre - WO23998 - Inicio
//lbl_tecnico.caption:=Sistema.NomeUsuario;
lbl_tecnico.caption := UBeneficio.RetornaNomePessoaXUsuarioSistema(Sistema.IdUsuario);
// Paulo Nobre - WO23998 - Fim

lbl_inicioprocess.caption:=FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time);
// SOL 233734 PPM 433623 e SOL 234481 PPM 433635

_query_header.close;
_query_header.Destroy;

end;

procedure TFrmReverCotas.bbtnSairClick(Sender: TObject);
begin
 // inherited;
Self.close;
end;

procedure TFrmReverCotas.ExportarGrid(toExcel: Boolean);
const 
// SheetType 
xlChart = -4109; 
xlWorksheet = -4167; 
// WBATemplate 
xlWBATWorksheet = -4167; 
xlWBATChart = -4109; 
// Page Setup 
xlPortrait = 1; 
xlLandscape = 2; 
xlPaperA4 = 9; 
// Format Cells 
xlBottom = -4107; 
xlLeft = -4131; 
xlRight = -4152; 
xlTop = -4160; 
// Text Alignment 
xlHAlignCenter = -4108; 
xlVAlignCenter = -4108; 
// Cell Borders 
xlThick = 4; 
xlThin = 2; 
var
 bm: TBookmark;
 col, row: Integer;
 sline: String;
 mem: TMemo;
 ExcelApp: Variant;
begin

 Screen.Cursor := crHourglass;

 dbgrdDet.DataSource.DataSet.DisableControls;
 bm := dbgrdDet.DataSource.DataSet.GetBookmark;
 dbgrdDet.DataSource.DataSet.First;

 // create the Excel object
 if toExcel then
 begin
   ExcelApp := CreateOleObject('Excel.Application');
   ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
   ExcelApp.WorkBooks[1].WorkSheets[1].Name := 'Grid Data';
 end;


 // First we send the data to a memo
 // works faster than doing it directly to Excel
 mem := TMemo.Create(nil);
 mem.Visible := false;
 mem.Parent := FrmReverCotas;
 mem.Clear;
 sline := '';

 // add the info for the column names
 for col := 0 to dbgrdDet.FieldCount - 1 do
   sline := sline + dbgrdDet.Fields[col].DisplayLabel + #9;
 mem.Lines.Add(sline);

 // get the data into the memo
 for row := 0 to dbgrdDet.DataSource.DataSet.RecordCount-1 do
 begin
   sline := '';
   for col := 0 to dbgrdDet.FieldCount-1 do
     sline := sline + dbgrdDet.Fields[col].AsString + #9;
   mem.Lines.Add(sline);
   dbgrdDet.DataSource.DataSet.Next;
 end;

 // we copy the data to the clipboard
 mem.SelectAll;
 mem.CopyToClipboard;

 // if needed, send it to Excel
 // if not, we already have it in the clipboard
 if toExcel then
 begin
   ExcelApp.Workbooks[1].WorkSheets['Grid Data'].Paste;
   ExcelApp.Visible := true;
 end;

 FreeAndNil(mem);
// FreeAndNil(ExcelApp);
 FrmReverCotas.dbgrdDet.DataSource.DataSet.GotoBookmark(bm);   
 FrmReverCotas.dbgrdDet.DataSource.DataSet.FreeBookmark(bm);
 FrmReverCotas.dbgrdDet.DataSource.DataSet.EnableControls;
 Screen.Cursor := crDefault;

end;


//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.ppReport1BeforePrint(Sender: TObject);
begin
  inherited;

  // Paulo Nobre - WO23998 - Inicio
  //  lbl_usuario.Caption := Sistema.NomeUsuario;
  lbl_usuario.Caption := UBeneficio.RetornaNomePessoaXUsuarioSistema(Sistema.IdUsuario);
  // Paulo Nobre - WO23998 - Fim

  // Alterado por FHBS - 31/10/2019 - SIG50850
  ppLabelVersao.Caption := 'Versão do Módulo: V' + Sistema.Versao;
  if FazQuery( qryAux, 'SELECT DESCRICAO FROM CTRLINTERFACE WHERE IDLOTE = ' + IntToStr(iIdLoteConcessao)) then
    ppLabelLote.Caption := 'Lote: ' + qryAux.Fields[0].asString
  else
    ppLabelLote.Caption := '';
  // Fim - Alterado por FHBS - 31/10/2019 - SIG50850

end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.ConfPPREport1BSFABBDeficit;
begin
       if (qryRelatorio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1) And
          (qryRelatorio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1) then
               MostraPPREport1BSFABBDeficit
       else
       begin
              if qryRelatorio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1 then
                    MostraPPREport1BSFABB
              else
                  if qryRelatorio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1 then
                      MostraPPREport1BDeficit
                  else
                      MostraPPREport1SemBSFABBDeficit;
       end;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BSFABBDeficit;
begin
      MostraPPREport1BSFABBDeficitCampos;
      MostraPPREport1BSFABBDeficitGrid;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1SemBSFABBDeficit;
begin
       MostraPPREport1SemBSFABBDeficitCampos;
       MostraPPREport1SemBSFABBDeficitGrid;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BSFABB;
begin
       MostraPPREport1BSFABBCampos;
       MostraPPREport1BSFABBGrid;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BDeficit;
begin
       MostraPPREport1BDeficitCampos;
       MostraPPREport1BDeficitGrid;
end;


//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BSFABBDeficitCampos;
begin
       ppLblBSTotal.Visible    := true;
       ppTxtBSTotal.Visible    := true;
       ppLblBSAtual.Visible    := true;
       ppTxtBSAtual.Visible    := true;
       ppLblFABTotal.Visible   := true;
       ppTxtFABTotal.Visible   := true;
       ppTxtBSAtual.Visible    := true;
       ppTxtBSAtual.Visible    := true;
       ppTxtBSAtual.Visible    := true;
       ppLblFABATual.Visible   := true;
       ppTxtFabAtual.Visible   := true;
       ppLblBaseCalcD.Visible  := true;
       ppTxtBaseCalcD.Visible  := true;

       ppLblBSTotal.Font.Size    := 7;
       ppTxtBSTotal.Font.Size    := 7;
       ppLblBSAtual.Font.Size    := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppLblFABTotal.Font.Size   := 7;
       ppTxtFABTotal.Font.Size   := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppLblFABATual.Font.Size   := 7;
       ppTxtFabAtual.Font.Size   := 7;
       ppLblBaseCalcD.Font.Size  := 7;
       ppTxtBaseCalcD.Font.Size  := 7;
       ppLblValorTotal.Font.Size := 7;
       ppTxtValorTotal.Font.Size := 7;
       ppLblValorAtual.Font.Size := 7;
       ppTxtValorAtual.Font.Size := 7;

       //edilaine - SIG55933 - inicio
       ppLblBSTotal.Top    := 0.8125;  //0.7083;
       ppTxtBSTotal.Top    := 0.8125;  //0.7083;
       ppLblBSAtual.Top    := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppLblFABTotal.Top   := 0.8125;  //0.7083;
       ppTxtFABTotal.Top   := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppLblFABATual.Top   := 0.8125;  //0.7083;
       ppTxtFabAtual.Top   := 0.8125;  //0.7083;
       ppLblBaseCalcD.Top  := 0.8125;  //0.7083;
       ppTxtBaseCalcD.Top  := 0.8125;  //0.7083;
       ppLblValorTotal.Top := 0.8125;  //0.7083;
       ppTxtValorTotal.Top := 0.8125;  //0.7083;
       ppLblValorAtual.Top := 0.8125;  //0.7083;
       ppTxtValorAtual.Top := 0.8125;  //0.7083;
       //edilaine - SIG55933 - fim

       ppTxtBSTotal.Width := 0.6667;
       ppTxtBSAtual.Width := 0.6667;
       ppTxtFABTotal.Width := 0.6667;
       ppTxtFabAtual.Width := 0.6667;
       ppTxtValorTotal.Width := 0.6667;
       ppTxtValorAtual.Width := 0.6667;
       ppTxtBaseCalcD.Width := 0.6667;

       ppLblBSTotal.Left := 0.1354;
       ppTxtBSTotal.Left := 0.5833;
       ppLblBSAtual.Left := 1.0937;
       ppTxtBSAtual.Left := 1.5417;
       ppLblFABTotal.Left := 2.0416;
       ppTxtFABTotal.Left := 2.5521;
       ppLblFABATual.Left := 3.0521;
       ppTxtFabAtual.Left := 3.5729;
       ppLblValorTotal.Left := 4.0521;
       ppTxtValorTotal.Left := 4.6042;
       ppLblValorAtual.Left := 5.0729;
       ppTxtValorAtual.Left := 5.6354;
       ppLblBaseCalcD.Left := 6.1042;
       ppTxtBaseCalcD.Left := 7.3646;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BSFABBDeficitGrid;
begin
      ppRellblVlrBS.visible := true;
      lbl_vl_valorbs.visible := true;
      ppRelLinhaVlrBS.visible := true;
      ppRellblVlrFAB.visible := true;
      lbl_vl_valorfab.visible := true;
      ppRelLinhaVlrFAB.visible := true;
      ppRelLinhaVlrPgMes.visible := true;
      ppRellblBaseCalc.visible := true;
      lbl_vl_valordeficit.visible := true;


      ppRelLinhaMesD.left := 0.7083;

      ppRellblPercAnt.left := 0.7396;
      ppDBText35.left := 0.7396;
      ppDBText35.width := 0.6563;
      ppDBText40.left := 0.7396;
      ppDBText40.width := 0.6563;
      lbl_vl_perc_ant_abono3.left := 0.7396;     //edilaine - SIG33727
      lbl_vl_perc_ant_abono3.width := 0.6563;    //edilaine - SIG33727
      ppRelLinhaPercAntD.left := 1.4479;

      ppRellblPercAtual.left := 1.4896;
      ppDBText30.left := 1.4896;
      ppDBText30.width := 0.7083;
      ppDBText41.left := 1.4896;
      ppDBText41.width := 0.7083;
      lbl_vl_perc_atu_abono3.left := 1.4896;     //edilaine - SIG33727
      lbl_vl_perc_atu_abono3.width := 0.7083;    //edilaine - SIG33727
      ppRelLinhaPercAtualD.left := 2.2292;

      ppRellblValorTotal.left := 2.2708;
      ppDBText31.left := 2.2708;
      ppDBText31.width := 0.5625;
      ppDBText42.left := 2.2708;
      ppDBText42.width := 0.5625;
      lbl_vl_total_abono3.left := 2.2708;     //edilaine - SIG33727
      lbl_vl_total_abono3.width := 0.5625;    //edilaine - SIG33727
      ppRelLinhaValorTotalD.left := 2.875;

      ppRellblVlrBS.left := 2.9166;
      lbl_vl_valorbs.left := 2.9166;
      lbl_vl_valorbs_abono.Left := 2.9166;
      lbl_vl_bs_abono3.left := 2.9166;       //edilaine - SIG33727
      ppRelLinhaVlrBS.left := 3.5729;

      ppRellblVlrFAB.left := 3.625;
      lbl_vl_valorfab.left := 3.625;
      lbl_vl_valorfab_abono.Left := 3.625;
      lbl_vl_fab_abono3.left := 3.625;       //edilaine - SIG33727
      ppRelLinhaVlrFAB.left := 4.2917;

      ppRellblVlrAtualAnt.left := 4.3437;
      ppDBText32.left := 4.3437;
      ppDBText32.width := 0.5625;
      lbl_vl_atual_antec2.left := 4.3437;
      lbl_vl_atual_antec2.width := 0.5625;
      lbl_vl_atual_antec3.left := 4.3437;     //edilaine - SIG33727
      lbl_vl_atual_antec3.width := 0.5625;    //edilaine - SIG33727
      ppRelLinhaVlrAtualAntD.left := 5;

      ppRellblValorAtualDep.left := 5.0417;
      ppDBText33.left := 5.0417;
      ppDBText33.width := 0.5625;
      ppDBText44.left := 5.0417;
      ppDBText44.width := 0.5625;
      lbl_vl_atual_depois3.left := 5.0417;        //edilaine - SIG33727
      lbl_vl_atual_depois3.width := 0.5625;       //edilaine - SIG33727
      ppRelLinhaValorAtualDepD.left := 5.6875;

      ppRellblVlrPgMes.left := 5.7292;
      ppDBText34.left := 5.7292;
      ppDBText34.width := 1.2292;
      lbl_vl_pg_abono2.left := 5.7292;
      lbl_vl_pg_abono2.width := 1.2292;
      lbl_vl_pg_abono3.left := 5.7292;            //edilaine - SIG33727
      lbl_vl_pg_abono3.width := 1.2292;           //edilaine - SIG33727

end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1SemBSFABBDeficitCampos;
begin
       ppLblBSTotal.Visible := false;
       ppTxtBSTotal.Visible := false;
       ppLblBSAtual.Visible := false;
       ppTxtBSAtual.Visible := false;
       ppLblFABTotal.Visible := false;
       ppTxtFABTotal.Visible := false;
       ppTxtBSAtual.Visible := false;
       ppTxtBSAtual.Visible := false;
       ppTxtBSAtual.Visible := false;
       ppLblFABATual.Visible := false;
       ppTxtFabAtual.Visible := false;
       ppLblBaseCalcD.Visible  := false;
       ppTxtBaseCalcD.Visible  := false;

       ppLblValorTotal.Font.Size := 8;
       ppTxtValorTotal.Font.Size := 8;
       ppLblValorAtual.Font.Size := 8;
       ppTxtValorAtual.Font.Size := 8;

       //edilaine - SIG55933 - inicio
       ppLblValorTotal.Top := 0.7708;   //0.6666;
       ppTxtValorTotal.Top := 0.7708;   //0.6666;
       ppLblValorAtual.Top := 0.7708;   //0.6666;
       ppTxtValorAtual.Top := 0.7708;   //0.6666;
       //edilaine - SIG55933 - fim

       ppLblValorTotal.Left := 0.2083;
       ppTxtValorTotal.Left := 0.8437;
       ppLblValorAtual.Left := 2.1875;
       ppTxtValorAtual.Left := 2.8471;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1SemBSFABBDeficitGrid;
begin
      ppRellblVlrBS.visible := false;
      lbl_vl_valorbs.visible := false;
      lbl_vl_valorbs_abono.Visible := false;
      lbl_vl_bs_abono3.Visible := false;                //edilaine - SIG33727
      ppRelLinhaVlrBS.visible := false;
      ppRellblVlrFAB.visible := false;
      lbl_vl_valorfab.visible := false;
      lbl_vl_valorfab_abono.visible := false;
      lbl_vl_fab_abono3.Visible := false;               //edilaine - SIG33727
      ppRelLinhaVlrFAB.visible := false;
      ppRelLinhaVlrPgMes.visible := false;
      ppRellblBaseCalc.visible := false;
      lbl_vl_valordeficit.visible := false;
      lbl_vl_valordeficit_abono.visible := false;
      lbl_vl_deficit_abono3.Visible := false;          //edilaine - SIG33727


      ppRelLinhaMesD.left := 0.9583;

      ppRellblPercAnt.left := 1.0104;
      ppDBText35.left := 1.0104;
      ppDBText35.width := 0.875;
      ppDBText40.left := 1.0104;
      ppDBText40.width := 0.875;
      lbl_vl_perc_ant_abono3.left := 1.0104;        //edilaine - SIG33727
      lbl_vl_perc_ant_abono3.width := 0.875;        //edilaine - SIG33727
      ppRelLinhaPercAntD.left := 1.9271;

      ppRellblPercAtual.left := 1.9792;
      ppDBText30.left := 1.9792;
      ppDBText30.width := 1.0625;
      ppDBText41.left := 1.9792;
      ppDBText41.width := 1.0625;
      lbl_vl_perc_atu_abono3.left := 1.9792;         //edilaine - SIG33727
      lbl_vl_perc_atu_abono3.width := 1.0625;        //edilaine - SIG33727
      ppRelLinhaPercAtualD.left := 3.1042;

      ppRellblValorTotal.left := 3.1563;
      ppDBText31.left := 3.1563;
      ppDBText31.Width := 0.8333;
      ppDBText42.left := 3.1563;
      ppDBText42.Width := 0.8333;
      lbl_vl_total_abono3.left := 3.1563;            //edilaine - SIG33727
      lbl_vl_total_abono3.Width := 0.8333;           //edilaine - SIG33727
      ppRelLinhaValorTotalD.left := 4.0313;

      ppRellblVlrAtualAnt.left := 4.0833;
      ppDBText32.left := 4.0833;
      ppDBText32.width := 1.0521;
      lbl_vl_atual_antec2.left := 4.0833;
      lbl_vl_atual_antec2.width := 1.0521;
      lbl_vl_atual_antec3.left := 4.0833;            //edilaine - SIG33727
      lbl_vl_atual_antec3.width := 1.0521;           //edilaine - SIG33727
      ppRelLinhaVlrAtualAntD.left := 5.1771;

      ppRellblValorAtualDep.left := 5.2188;
      ppDBText33.left := 5.2188;
      ppDBText33.width := 1.0521;
      ppDBText44.left := 5.2188;
      ppDBText44.width := 1.0521;
      lbl_vl_atual_depois3.left := 5.2188;              //edilaine - SIG33727
      lbl_vl_atual_depois3.width := 1.0521;             //edilaine - SIG33727
      ppRelLinhaValorAtualDepD.left := 6.3646;

      ppRellblVlrPgMes.left := 6.4167;
      ppDBText34.left := 6.4167;
      ppDBText34.width := 1.2292;
      lbl_vl_pg_abono2.left := 6.4167;
      lbl_vl_pg_abono2.width := 1.2292;
      lbl_vl_pg_abono3.left := 6.4167;                //edilaine - SIG33727
      lbl_vl_pg_abono3.width := 1.2292;               //edilaine - SIG33727
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BSFABBCampos;
begin
       ppLblBSTotal.Visible    := true;
       ppTxtBSTotal.Visible    := true;
       ppLblBSAtual.Visible    := true;
       ppTxtBSAtual.Visible    := true;
       ppLblFABTotal.Visible   := true;
       ppTxtFABTotal.Visible   := true;
       ppTxtBSAtual.Visible    := true;
       ppTxtBSAtual.Visible    := true;
       ppTxtBSAtual.Visible    := true;
       ppLblFABATual.Visible   := true;
       ppTxtFabAtual.Visible   := true;
       ppLblBaseCalcD.Visible  := false;
       ppTxtBaseCalcD.Visible  := false;

       ppLblBSTotal.Font.Size    := 7;
       ppTxtBSTotal.Font.Size    := 7;
       ppLblBSAtual.Font.Size    := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppLblFABTotal.Font.Size   := 7;
       ppTxtFABTotal.Font.Size   := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppTxtBSAtual.Font.Size    := 7;
       ppLblFABATual.Font.Size   := 7;
       ppTxtFabAtual.Font.Size   := 7;
       ppLblValorTotal.Font.Size := 7;
       ppTxtValorTotal.Font.Size := 7;
       ppLblValorAtual.Font.Size := 7;
       ppTxtValorAtual.Font.Size := 7;

       //edilaine - SIG55933 - inicio
       ppLblBSTotal.Top    := 0.8125;  //0.7083;
       ppTxtBSTotal.Top    := 0.8125;  //0.7083;
       ppLblBSAtual.Top    := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppLblFABTotal.Top   := 0.8125;  //0.7083;
       ppTxtFABTotal.Top   := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppTxtBSAtual.Top    := 0.8125;  //0.7083;
       ppLblFABATual.Top   := 0.8125;  //0.7083;
       ppTxtFabAtual.Top   := 0.8125;  //0.7083;
       ppLblBaseCalcD.Top  := 0.8125;  //0.7083;
       ppTxtBaseCalcD.Top  := 0.8125;  //0.7083;
       ppLblValorTotal.Top := 0.8125;  //0.7083;
       ppTxtValorTotal.Top := 0.8125;  //0.7083;
       ppLblValorAtual.Top := 0.8125;  //0.7083;
       ppTxtValorAtual.Top := 0.8125;  //0.7083;
       //edilaine - SIG55933 - fim

       ppTxtBSTotal.Width := 0.4896;
       ppTxtBSAtual.Width := 0.4896;
       ppTxtFABTotal.Width := 0.4896;
       ppTxtFabAtual.Width := 0.4896;
       ppTxtValorTotal.Width := 0.4896;
       ppTxtValorAtual.Width := 0.4896;


       ppLblBSTotal.Left := 0.2083;
       ppTxtBSTotal.Left := 0.6554;
       ppLblBSAtual.Left := 1.375;
       ppTxtBSAtual.Left := 1.8116;
       ppLblFABTotal.Left := 2.6042;
       ppTxtFABTotal.Left := 3.1033;
       ppLblFABATual.Left := 3.8542;
       ppTxtFabAtual.Left := 4.3533;
       ppLblValorTotal.Left := 5.1771;
       ppTxtValorTotal.Left := 5.7175;
       ppLblValorAtual.Left := 6.4375;
       ppTxtValorAtual.Left := 6.9879;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BSFABBGrid;
begin
      ppRellblVlrBS.visible := true;
      lbl_vl_valorbs.visible := true;
      ppRelLinhaVlrBS.visible := true;
      ppRellblVlrFAB.visible := true;
      lbl_vl_valorfab.visible := true;
      ppRelLinhaVlrFAB.visible := true;
      ppRelLinhaVlrPgMes.visible := false;
      ppRellblBaseCalc.visible := false;
      lbl_vl_valordeficit.visible := false;
      lbl_vl_valordeficit_abono.visible := false;
      lbl_vl_deficit_abono3.visible := false;             //edilaine - SIG33727

      ppRelLinhaMesD.left := 0.7083;

      ppRellblPercAnt.left := 0.7396;
      ppDBText35.left := 0.7396;
      ppDBText35.width := 0.7917;
      ppDBText40.left := 0.7396;
      ppDBText40.width := 0.7917;
      lbl_vl_perc_ant_abono3.left := 0.7396;          //edilaine - SIG33727
      lbl_vl_perc_ant_abono3.width := 0.7917;         //edilaine - SIG33727
      ppRelLinhaPercAntD.left := 1.5937;

      ppRellblPercAtual.left := 1.6354;
      ppDBText30.left := 1.6354;
      ppDBText30.width := 0.8542;
      ppDBText41.left := 1.6354;
      ppDBText41.width := 0.8542;
      lbl_vl_perc_atu_abono3.left := 1.6354;            //edilaine - SIG33727
      lbl_vl_perc_atu_abono3.width := 0.8542;           //edilaine - SIG33727
      ppRelLinhaPercAtualD.left := 2.5313;

      ppRellblValorTotal.left := 2.5729;
      ppDBText31.left := 2.5729;
      ppDBText31.width := 0.6771;
      ppDBText42.left := 2.5729;
      ppDBText42.width := 0.6771;
      lbl_vl_total_abono3.left := 2.5729;               //edilaine - SIG33727
      lbl_vl_total_abono3.width := 0.6771;              //edilaine - SIG33727
      ppRelLinhaValorTotalD.left := 3.2813;

      ppRellblVlrBS.left := 3.3333;
      lbl_vl_valorbs.left := 3.3333;
      lbl_vl_valorbs.width := 0.6875;
      lbl_vl_valorbs_abono.left := 3.3333;
      lbl_vl_valorbs_abono.width := 0.6875;
      lbl_vl_bs_abono3.left := 3.3333;                //edilaine - SIG33727
      lbl_vl_bs_abono3.width := 0.6875;               //edilaine - SIG33727
      ppRelLinhaVlrBS.left := 4.0521;

      ppRellblVlrFAB.left := 4.1042;
      lbl_vl_valorfab.left := 4.1042;
      lbl_vl_valorfab.width := 0.6563;
      lbl_vl_valorfab_abono.left := 4.1042;
      lbl_vl_valorfab_abono.width := 0.6563;
      lbl_vl_fab_abono3.left := 4.1042;               //edilaine - SIG33727
      lbl_vl_fab_abono3.width := 0.6563;              //edilaine - SIG33727
      ppRelLinhaVlrFAB.left := 4.7917;

      ppRellblVlrAtualAnt.left := 4.8542;
      ppDBText32.left := 4.8542;
      ppDBText32.width := 0.7187;
      lbl_vl_atual_antec2.left := 4.8542;
      lbl_vl_atual_antec2.width := 0.7187;
      lbl_vl_atual_antec3.left := 4.8542;                //edilaine - SIG33727
      lbl_vl_atual_antec3.width := 0.7187;               //edilaine - SIG33727
      ppRelLinhaVlrAtualAntD.left := 5.6042;

      ppRellblValorAtualDep.left := 5.6458;
      ppDBText33.left := 5.6458;
      ppDBText33.width := 0.6875;
      ppDBText44.left := 5.6458;
      ppDBText44.width := 0.6875;
      lbl_vl_atual_depois3.left := 5.6458;               //edilaine - SIG33727
      lbl_vl_atual_depois3.width := 0.6875;              //edilaine - SIG33727
      ppRelLinhaValorAtualDepD.left := 6.3646;

      ppRellblVlrPgMes.left := 6.4167;
      ppDBText34.left := 6.4167;
      ppDBText34.width := 1.2292;
      lbl_vl_pg_abono2.left := 6.4167;
      lbl_vl_pg_abono2.width := 1.2292;
      lbl_vl_pg_abono3.left := 6.4167;                 //edilaine - SIG33727
      lbl_vl_pg_abono3.width := 1.2292;                //edilaine - SIG33727
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BDeficitCampos;
begin
       ppLblBSTotal.Visible    := false;
       ppTxtBSTotal.Visible    := false;
       ppLblBSAtual.Visible    := false;
       ppTxtBSAtual.Visible    := false;
       ppLblFABTotal.Visible   := false;
       ppTxtFABTotal.Visible   := false;
       ppTxtBSAtual.Visible    := false;
       ppTxtBSAtual.Visible    := false;
       ppTxtBSAtual.Visible    := false;
       ppLblFABATual.Visible   := false;
       ppTxtFabAtual.Visible   := false;
       ppLblBaseCalcD.Visible  := true;
       ppTxtBaseCalcD.Visible  := true;

       ppLblBaseCalcD.Font.Size  := 8;
       ppTxtBaseCalcD.Font.Size  := 8;
       ppLblValorTotal.Font.Size := 8;
       ppTxtValorTotal.Font.Size := 8;
       ppLblValorAtual.Font.Size := 8;
       ppTxtValorAtual.Font.Size := 8;

       //edilaine - SIG55933 - inicio
       ppLblBaseCalcD.Top  := 0.7708;   //0.6666;
       ppTxtBaseCalcD.Top  := 0.7708;   //0.6666;
       ppLblValorTotal.Top := 0.7708;   //0.6666;
       ppTxtValorTotal.Top := 0.7708;   //0.6666;
       ppLblValorAtual.Top := 0.7708;   //0.6666;
       ppTxtValorAtual.Top := 0.7708;   //0.6666;
       //edilaine - SIG55933 - fim

       ppTxtValorTotal.Width := 0.6667;
       ppTxtValorAtual.Width := 0.6667;
       ppTxtBaseCalcD.Width  := 0.6667;

       ppLblValorTotal.Left := 0.2083;
       ppTxtValorTotal.Left := 0.8437;
       ppLblValorAtual.Left := 2.1875;
       ppTxtValorAtual.Left := 2.8471;
       ppLblBaseCalcD.Left  := 5.5521;
       ppTxtBaseCalcD.Left  := 7.0312;
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.MostraPPREport1BDeficitGrid;
begin
      ppRellblVlrBS.visible := false;
      lbl_vl_valorbs.visible := false;
      lbl_vl_valorbs_abono.visible := false;
      lbl_vl_bs_abono3.visible := false;               //edilaine - SIG33727
      ppRelLinhaVlrBS.visible := false;
      ppRellblVlrFAB.visible := false;
      lbl_vl_valorfab.visible := false;
      lbl_vl_valorfab_abono.visible := false;
      lbl_vl_fab_abono3.visible := false;              //edilaine - SIG33727
      ppRelLinhaVlrFAB.visible := false;
      ppRelLinhaVlrPgMes.visible := true;
      ppRellblBaseCalc.visible := true;
      lbl_vl_valordeficit.visible := true;


      ppRelLinhaMesD.left := 0.7813;

      ppRellblPercAnt.left := 0.8125;
      ppDBText35.left := 0.8125;
      ppDBText35.width := 0.875;
      ppDBText40.left := 0.8125;
      ppDBText40.width := 0.875;
      lbl_vl_perc_ant_abono3.left := 0.8125;             //edilaine - SIG33727
      lbl_vl_perc_ant_abono3.width := 0.875;             //edilaine - SIG33727
      ppRelLinhaPercAntD.left := 1.7396;

      ppRellblPercAtual.left := 1.7813;
      ppDBText30.left := 1.7813;
      ppDBText30.width := 0.9479;
      ppDBText41.left := 1.7813;
      ppDBText41.width := 0.9479;
      lbl_vl_perc_atu_abono3.left := 1.7813;              //edilaine - SIG33727
      lbl_vl_perc_atu_abono3.width := 0.9479;             //edilaine - SIG33727
      ppRelLinhaPercAtualD.left := 2.7604;

      ppRellblValorTotal.left := 2.8021;
      ppDBText31.left := 2.8021;
      ppDBText31.width := 0.7917;
      ppDBText42.left := 2.8021;
      ppDBText42.width := 0.7917;
      lbl_vl_total_abono3.left := 2.8021;                //edilaine - SIG33727
      lbl_vl_total_abono3.width := 0.7917;               //edilaine - SIG33727
      ppRelLinhaValorTotalD.left := 3.625;

      ppRellblVlrAtualAnt.left := 3.6771;
      ppDBText32.left := 3.6771;
      ppDBText32.width := 0.8229;
      lbl_vl_atual_antec2.left := 3.6771;
      lbl_vl_atual_antec2.width := 0.8229;
      lbl_vl_atual_antec3.left := 3.6771;                  //edilaine - SIG33727
      lbl_vl_atual_antec3.width := 0.8229;                 //edilaine - SIG33727
      ppRelLinhaVlrAtualAntD.left := 4.5521;

      ppRellblValorAtualDep.left := 4.5937;
      ppDBText33.left := 4.5937;
      ppDBText33.width := 0.9167;
      ppDBText44.left := 4.5937;
      ppDBText44.width := 0.9167;
      lbl_vl_atual_depois3.left := 4.5937;                 //edilaine - SIG33727
      lbl_vl_atual_depois3.width := 0.9167;                //edilaine - SIG33727
      ppRelLinhaValorAtualDepD.left := 5.5729;

      ppRellblVlrPgMes.left := 5.6146;
      ppDBText34.left := 5.6146;
      ppDBText34.width := 1.3854;
      lbl_vl_pg_abono2.left := 5.6146;
      lbl_vl_pg_abono2.width := 1.3854;
      lbl_vl_pg_abono3.left := 5.6146;                    //edilaine - SIG33727
      lbl_vl_pg_abono3.width := 1.3854;                   //edilaine - SIG33727
end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
function TFrmReverCotas.BEncerrado(dataFinal, anoMesAtual : String) : Boolean;
var
    anoAtual,
    mesAtual,
    mesFinal,
    anoFinal : Integer;
begin
       Result := False;

       if (Length(dataFinal) < 10) Or
          (Length(anoMesAtual) < 7) then
           Exit;


       anoAtual := StrToInt(copy(anoMesAtual, 1, 4));
       mesAtual := StrToInt(copy(anoMesAtual, 6, 2));
       mesFinal := StrToInt(copy(dataFinal, 4, 2));
       anoFinal := StrToInt(copy(dataFinal, 7, 4));

       if (anoAtual > anoFinal) then
          Result := True;

       if (anoAtual = anoFinal) And
          (mesAtual >= mesFinal) then
          Result := true;
end;


//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.ppSubRepContribPrint(Sender: TObject);
begin
  inherited;

end;

//Helio - SOL Nº 253577/17666 PPM Nº 1019935
procedure TFrmReverCotas.ppSubRepContribExtraPrint(Sender: TObject);
begin
  inherited;

end;

//edilaine - SIG48583 - inicio
procedure TFrmReverCotas.RetornaTotalContrib(var rContrNormal, rContrExtra: double);
var
  _qryAux : TwwQuery;
begin
  _qryAux := TwwQuery.create(nil);
  _qryAux.DataBaseName := 'BaseDados';

  try
    _qryAux.Close;
    _qryAux.Sql.Clear;
    _qryAux.Sql.Add('SELECT TOT.FLGDEFICIT, SUM(TOT.VALORPREV) FROM ( ');
    _qryAux.Sql.Add( copy(qryDemoContrib.Sql.text, 1, pos('ORDER BY', UpperCase(qryDemoContrib.Sql.text))-1) );
    _qryAux.Sql.Add(') TOT ');
    _qryAux.Sql.Add('GROUP BY TOT.FLGDEFICIT ');
    _qryAux.ParamByName('IDLOTE').AsInteger      := iIdLoteConcessao;
    _qryAux.ParamByName('IDTITULAR').AsInteger   := qryRelatorio.FieldByName('IDTITULAR').AsInteger;
    _qryAux.ParamByName('IDPESSJUR').AsInteger   := qryRelatorio.FieldByName('IDPESSJUR').AsInteger;
    _qryAux.ParamByName('IDBENEFICIO').AsInteger := qryRelatorio.FieldByName('IDBENEFICIO').AsInteger;
    _qryAux.ParamByName('IDPESSOA').AsInteger    := qryRelatorio.FieldByName('IDPESSOA').AsInteger;
    _qryAux.Open;
    while not _qryAux.eof do
    begin
      if _qryAux.Fields[0].AsInteger = 1 then
         rContrExtra := rContrExtra + _qryAux.Fields[1].AsCurrency
      else
         rContrNormal := rContrNormal + _qryAux.Fields[1].AsCurrency;
      _qryAux.next;
    end;
  finally
    FreeAndNil(_qryAux);
  end;
end;
//edilaine - SIG48583 - fim

//Início - edilaine - SIG 33727
procedure TFrmReverCotas.AjustaContribAbonoPago(qry : TwwQuery; dataPagto : string);
var
 iFlgDevolve : byte;
 sSQL : string;
begin
  try
     // verificar se houve contribuição sobre abono pago
     sSql := 'SELECT HC.IDCONTRIBUICAO, HB.IDBENEFICIO, '+
             '       HC.VALOROP1, HC.VALOROP2, HC.VALOROP3, '+
             '       SUM(DECODE(HC.FLGDEVOLUCAO,1,-HC.VALORESPERADO, HC.VALORESPERADO)) AS VLRPAGO '+
             '  FROM HSTCONTRIBPREV HC '+
             '  JOIN HSTBENEFBFCIARIO HB ON HB.IDPESSOA    = HC.IDPESSOA     '+
             '                          AND HB.IDTITULAR   = HC.IDTITULAR    '+
             '                          AND HB.IDPESSJUR   = HC.IDPESSJUR    '+
             '                          AND HB.IDPLANOPREV = HC.IDPLANOPREV  '+
             '                          AND HB.SEQPROPOSTA = HC.SEQPROPOSTA  '+
             '                          AND NVL(HB.VLBENEFPGTO,0) > 0        '+
             '                          AND HB.MESREFERENCIA  = '+QuotedStr(Copy(ME_anomes.Text,1,4)+'/13') +
             '                          AND HB.IDBENEFICIO    = '+qry.fieldbyname('IDBENEFICIO').AsString   +
             ' JOIN BENEFXTAXA BXT ON BXT.IDCONTRIBUICAO = HC.IDCONTRIBUICAO '+
             '                    AND BXT.IDBENEFICIO    = HB.IDBENEFICIO    '+
             ' WHERE HC.IDPESSOA = '+qry.fieldbyname('IDPESSOA').AsString     +
             '   AND HC.MESREFERENCIA = '+QuotedStr(Copy(ME_anomes.Text,1,4)+'/13') +
             ' GROUP BY HC.IDCONTRIBUICAO,  HB.IDBENEFICIO,   '+
             '          HC.VALOROP1, HC.VALOROP2, HC.VALOROP3 ';

     if FazQuery( QryAux, sSQL ) then
     begin
       while not QryAux.eof do
       begin
         iFlgDevolve := IFF(QryAux.FieldByName('VlrPago').AsFloat < 0, 1, 0);

         InsereHstContribPREV( dtmAPrev.qryAux,
                               qry.fieldbyname('IDPESSOA').AsInteger,           //piIdPessoa
                               1,                                               //piSeqProposta
                               qry.fieldbyname('IDPESSJUR').AsInteger,          //piIdPessJur
                               qry.fieldbyname('IDPLANOPREV').AsInteger,        //piIdPlanoPrev
                               QryAux.FieldByName('IdContribuicao').AsInteger,  //piIdContribuicao
                               3056,                                            //piIdMotivo
                               Copy(ME_anomes.Text,1,4)+'/13',                  //psMesReferencia
                               FormatDateTime('yyyy/mm', StrToDate(dataPagto)), //psMesCobranca
                               -1,                                              //piCodPortForma
                               dataPagto,                                       //psDataCobranca
                               '',                                              //psDataRecebimento
                               QryAux.FieldByName('VlrPago').AsFloat,           //pdValorEsperado
                               QryAux.FieldByName('VlrPago').AsFloat,           //pdValorCalculado
                               0,                                               //pdValorRecebido
                               -1,                                              //piIdRegraCalculo
                               1,                                               //piFlgDescFolha
                               QryAux.FieldByName('ValorOp1').AsFloat,          //pdValorBase1
                               QryAux.FieldByName('ValorOp2').AsFloat,          //pdValorBase2
                               QryAux.FieldByName('ValorOp3').AsFloat,          //pdValorBase3
                               qry.fieldbyname('DATAINICIO').AsString,          //psDataInicio
                               qry.fieldbyname('DATAFINAL').AsString,           //psDataFinal
                               'AS',                                            //psFlgIntSitPart
                               2,                                               //piSitRecebimento
                               1,                                               //piParcela
                               iIdLoteConcessao,                                //piIdLote
                               'F',                                             //pcTipoPrevidencia
                               0,                                               //piFlgCalcReserva
                               iFlgDevolve,                                     //piFlgDevolucao
                               1,                                               //piFlgConcessao
                               0,                                               //piFlgEvento
                               'B');                                            //psFolhaOrigem

         QryAux.next;
       end;
     end;
  except
     MsgDlg('Ocorreu um erro ao ajustar contribuições sobre a antecipação do abono.','Informação',mtWarning,[MbOk],0);
  end;
end;

procedure TFrmReverCotas.AjustaAbonoPago(qry : TwwQuery;
                                         dataPagto, sVlrBS, sVlrFAB, sVlrDeficit : string;
                                         var rVlrPago : double);
var
 sSql        : String;
 rVlrAbono   : Double;
begin
  try
    sVlrBS      := iff(StrToFloat(sVlrBS) < 0, '', sVlrBS);
    sVlrFAB     := iff(StrToFloat(sVlrFAB) < 0, '', sVlrFAB);
    sVlrDeficit := iff(StrToFloat(sVlrDeficit) < 0, '', sVlrDeficit);

    //se houver abono pago no ano gravar o valor com sinal oposto na tabela
    if rVlrPago > 0 then
      rVlrAbono := -rVlrPago
    else
      rVlrAbono := (rVlrPago * -1);

      {usar o FlgTipoRegistro da HSTBENEFBFCIARIO para diferenciar o lançamento de estorno
      Indica o tipo de registro do histórico de benefícios, segundo a legenda:
        0 - pagamento normal mensal
        1 - pagamento normal de abono anual
        2 - pagamento de antecipação de abono anual     <<<<<<
        3 - revisão de pagamento normal mensal
        4 - revisão de pagamento normal de abono anual
        5 - revisão de pagamento de antecipação de abono anual.}

      GravarHSTBENEFBFCIARIO('B',
                             '3056',
                             '2',
                             '2',
                             dataPagto,
                             Copy(ME_anomes.Text,1,4)+'/13',
                             FloatToStr(rVlrAbono),
                             Qry.fieldbyname('PERCENTUAL').AsString,
                             Qry.fieldbyname('DATAINICIO').AsString,
                             Qry.fieldbyname('DATAFINAL').AsString,
                             Qry.fieldbyname('IDPESSJUR').AsString,
                             Qry.fieldbyname('IDTITULAR').AsString,
                             Qry.fieldbyname('IDPESSOA').AsString,
                             Qry.fieldbyname('SEQPROPOSTA').AsString,
                             Qry.fieldbyname('IDPLANOPREV').AsString,
                             Qry.fieldbyname('IDBENEFICIO').AsString,
                             Qry.fieldbyname('NUMEROPROCESSO').AsString,
                             Qry.fieldbyname('FONTEPAGADORA').AsString,
                             FloatToStr(rVlrPago),
                             Qry.fieldbyname('IDPLANOORIGEM').AsString,
                             Qry.fieldbyname('IDSITBENEFICIO').AsString,
                             Qry.fieldbyname('VALORATUAL').AsString,
                             sVlrBS,
                             sVlrFAB,
                             sVlrDeficit,
                             Qry.fieldbyname('IDPERFILINVEST').AsString
                             );

      rVlrPago := 0;  //rVlrPago - rVlrAbono;

      //AjustaContribAbonoPago( qry, dataPagto);

  except
     MsgDlg('Ocorreu um erro ao ajustar antecipação do abono pago.','Informação',mtWarning,[MbOk],0);
  end;
end;
//Fim - edilaine - SIG 33727


//Denis Horongoso - SIG68319 - Inicio
procedure TFrmReverCotas.AtualizarProcessoBenef(NUMEROPROCESSO,idsitprocesso: string);
var
  qryUpdAux: TwwQuery;
begin
  qryUpdAux:=TwwQuery.Create(nil);
  qryUpdAux.DataBaseName := 'BaseDados';

  qryUpdAux.Close;
  qryUpdAux.SQL.Clear;

  qryUpdAux.SQL.Add('UPDATE PROCESSOBENEF SET IDSITPROCESSO = ' + IDSITPROCESSO);
  qryUpdAux.SQL.Add(' WHERE NUMEROPROCESSO = ' + NUMEROPROCESSO);

   try
      try
         qryUpdAux.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            Gravar_temp_log('',string(E.message));
         end;
      end;
   finally
      FreeAndNil(qryUpdAux);
   end;
end;
//Denis Horongoso - SIG68319 - Fim

end.


