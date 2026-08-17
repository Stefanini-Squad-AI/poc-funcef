//******************************************************************************
//N. Atender......: WO20267
//Data............: 09/04/2025
//Responsável.....: Luis Ferrari
//Descrição.......: Ajuste do nome do portador para codigo do portador
//********************************************************************************************
//N. SIG..........: 125198
//Data............: 12/07/2022
//Responsável.....: Everson Cunha
//Descrição.......: Desconsiderar o valor Bloqueado no somatório do "Disponível
//                  Total"
//******************************************************************************
//N. SIG..........: 116208
//Data............: 21/06/2021
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Alteração do relatório de Concialição Bancária, incluindo o
//                  movimentação conciliada.
//******************************************************************************
//N. Sol..........: 255443
//N. PPM..........: 820219
//Data............: 08/06/2015
//Responsável.....: Petri Nocentini
//Descrição.......: tamanho de campo no relatório da conciliação bancária
//******************************************************************************
//N. Sol..........: 211867
//N. Kintana......: 2035610
//Data............: 15/07/2013
//Responsável.....: Fernando Xavier
//Descrição.......: solicitamos correção no relatório da conciliação bancária
//******************************************************************************
//N. Sol..........: 201700
//N. Kintana......: 1955228
//Data............: 07/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Controle de Bloqueio para lançamentos de SICOB D + 1 e SIVAT
//******************************************************************************
//N. Sol..........: 198796/13843
//N. Kintana......: 1914601
//Data............: 04/02/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando layout do relatorio
//******************************************************************************
//N. Sol..........: 31714/13162
//N. Kintana......: 1887925
//Data............: 17/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para trazer saldos ajustados
//******************************************************************************
//N. Sol..........: 31714/13082
//N. Kintana......: 1883867
//Data............: 12/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para trazer saldos ajustados
//******************************************************************************
//N. Sol..........: 31714/13003
//N. Kintana......: 1881396
//Data............: 10/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para trazer saldos ajustados
//******************************************************************************
//N. Sol..........: 31714/12942
//N. Kintana......: 1879169
//Data............: 07/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Selecionando os Cheques Bloqueados Anteriores a data
//******************************************************************************
//N. Sol..........: 31714/12862
//N. Kintana......: 1875635
//Data............: 29/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para tirar o conceito do saldo anterior
//******************************************************************************
//N. Sol..........: 31714_12802
//N. Kintana......: 1873038
//Data............: 28/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterada a qrySaldoExtBanc para retirar a linha
//                  'AND SITCONCILIACAO = ''A''
//******************************************************************************
//N. Sol..........: 31714_11822
//N. Kintana......: 1817503
//Data............: 06/10/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Elaboração de novo relatório
//******************************************************************************

Unit FEspelhoDaConciliacaoBancariaAtual;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, StdCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker, DB, uDataBase, DbClient,
   Buttons, ExtCtrls, MAHlpBtn, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
   Mask, TREdit, Wwdatsrc, DBTables, Wwquery, uCmSqlParams, uCmControlObject, uCmDbObject,
   uCMClientDataSet, uCtrlMovimFinanc, uCtrlListTercFinanc, math,
   ImgList, wwdbedit, jpeg, FPreview,
   DBCtrls, ppBands, ppCache, ppClass, ppComm, ppRelatv, ppProd, ppReport,
   ppDB, ppDBPipe, ppDBBDE, TXComp, TXRB, ppParameter, ppCtrls, ppStrtch,
   ppSubRpt, myChkBox, ppVar, ppPrnabl, ppModule, daDataModule, raCodMod;

Type
   TfrmEspelhoDaConciliacaoBancariaAtual = Class(TForm)
      pnlDadosFiltro: TPanel;
      Label4: TLabel;
      qryLkpBanco: TwwQuery;
      dsLkpBanco: TwwDataSource;
      qryLkpBancoNUMBANCO: TStringField;
      Label1: TLabel;
      qryLkpBancoDESCRICAO: TStringField;
      qryLkpBancoCODPORTADOR: TFloatField;
      dblkpBanco: TwwDBLookupCombo;
      qryLkpBancoNOCONTACORR: TStringField;
      spbImprimir: TSpeedButton;
      dtDiaExtrato: TCMDateTimePicker;
      ExtraOptions1: TExtraOptions;
      relEspelhoMov: TppReport;
      ppParameterList2: TppParameterList;
      qryEmpresa: TwwQuery;
      qryEmpresaIDPESSOA: TFloatField;
      qryEmpresaNOMEEMPRESA: TStringField;
      qryEmpresaRAZAOSOCIAL: TStringField;
      qryEmpresaIDENDERECO: TFloatField;
      qryEmpresaCEP: TStringField;
      qryEmpresaIMAGEM: TBlobField;
      dsEmpresa: TwwDataSource;
      ppEmpresa: TppBDEPipeline;
      qryBloqCheques: TwwQuery;
      qryBloqJud: TwwQuery;
      dsBloqCheques: TwwDataSource;
      dsBloqJud: TwwDataSource;
      qryBloqJudDATALANCTO: TDateTimeField;
      qryBloqJudVALORLANCTO: TFloatField;
      qryBloqJudDATADISPONIB: TDateTimeField;
      qryBloqChequesDATALANCFINAN: TDateTimeField;
      qryBloqChequesVALORLANCFINAN: TFloatField;
      qryBloqChequesDATADISPFINANC: TDateTimeField;
      qryMovimento: TwwQuery;
      dsMovimento: TwwDataSource;
      ppBDEMovimento: TppBDEPipeline;
      qrySaldoMovimFinanc: TwwQuery;
      dsSaldoMovimFinanc: TwwDataSource;
      ppBDESaldoMovimFinanc: TppBDEPipeline;
      qryMovimentoDATALANCFINAN: TDateTimeField;
      qryMovimentoHISTORICO: TStringField;
      qryMovimentoVALORLANCFINAN: TFloatField;
      qrySaldoMovimFinancSALDOMOVFINANC: TFloatField;
      qryTotBloqueios: TwwQuery;
      dsTotBloqueios: TwwDataSource;
      qryTotBloqueiosVALORTOTBLOQ: TFloatField;
      ppBDETotBloqueios: TppBDEPipeline;
      spbSair: TSpeedButton;
      qryBloqJudHISTORICO: TStringField;
      qryBloqChequesHISTORICO: TStringField;
      ppBDEBloqCheques: TppBDEPipeline;
      ppBDEBloqJud: TppBDEPipeline;
      qrySaldoExtBanc: TwwQuery;
      dsSaldoExtBanc: TwwDataSource;
      qrySaldoExtBancSALDOEXTRATO: TFloatField;
      ppBDESaldoExtBanc: TppBDEPipeline;
      qryBloqOutros: TwwQuery;
      dsBloqOutros: TwwDataSource;
      ppBDEBloqOutros: TppBDEPipeline;
      qryBloqOutrosDATALANCFINAN: TDateTimeField;
      qryBloqOutrosHISTORICO: TStringField;
      qryBloqOutrosVALORLANCFINAN: TFloatField;
      qryBloqOutrosDATADISPFINANC: TDateTimeField;
    qryMovimentoAnalitico: TwwQuery;
    dsMovimentoAnalitico: TwwDataSource;
    ppBDEMovimentoAnalitico: TppBDEPipeline;
    qryMovimentoAnaliticoDATA_CONCILIACAO: TStringField;
    qryMovimentoAnaliticoBANCO: TStringField;
    qryMovimentoAnaliticoIDLANCCONCILIADO: TFloatField;
    qryMovimentoAnaliticoNUMDOCUMENTO: TStringField;
    qryMovimentoAnaliticoTIPOLANCTO: TStringField;
    qryMovimentoAnaliticoVALORLANCTO: TFloatField;
    qryMovimentoAnaliticoHISTORICO: TStringField;
    qryMovimentoAnaliticoBANCO_1: TStringField;
    qryMovimentoAnaliticoIDLANCCONCILIADO_1: TFloatField;
    qryMovimentoAnaliticoNUMCHQBORDERO: TStringField;
    qryMovimentoAnaliticoDATALANCFINAN: TDateTimeField;
    qryMovimentoAnaliticoENTRADASAIDA: TStringField;
    qryMovimentoAnaliticoVALORLANCFINAN: TFloatField;
    qryMovimentoAnaliticoDATADISPFINANC: TDateTimeField;
    qryMovimentoAnaliticoHISTORICO_1: TStringField;
    ppTitleBand1: TppTitleBand;
    ppLabel50: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText7: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    ppShape9: TppShape;
    ppLabel20: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape4: TppShape;
    ppLabel12: TppLabel;
    ppDBSaldoMovimFinanc: TppDBText;
    ppLabel14: TppLabel;
    ppShape11: TppShape;
    ppLabel53: TppLabel;
    pplblDataConc: TppLabel;
    ppLabel52: TppLabel;
    pplblConta: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape10: TppShape;
    ppLabel18: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel19: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppSubRepBloqCheques: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape33: TppShape;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel70: TppLabel;
    ppLabel74: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText25: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel67: TppLabel;
    ppDBTotCheque: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppSubRepBloqJud: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppLabel85: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText4: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLabel10: TppLabel;
    ppDBTotBloqJud: TppDBCalc;
    ppLabel11: TppLabel;
    ppDBTotMovNaoConc: TppDBCalc;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppLabel15: TppLabel;
    ppDBTotBloqueios1: TppDBText;
    ppShape6: TppShape;
    ppLabel16: TppLabel;
    ppShape7: TppShape;
    ppLabel13: TppLabel;
    ppSaldoDispMovimFinanc: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppSubRepTotalBloqueios: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppShape8: TppShape;
    ppLabel17: TppLabel;
    ppDBText9: TppDBText;
    ppDBText5: TppDBText;
    ppSubRepBloqOutros: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppShape12: TppShape;
    ppDetailBand4: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLabel26: TppLabel;
    ppDBCalc1: TppDBCalc;
    SubRepMovimentoAnalitico: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    ppShape15: TppShape;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape13: TppShape;
    ppLabel28: TppLabel;
    ppShape14: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel27: TppLabel;
    ppLabel44: TppLabel;
    ppDBImage2: TppDBImage;
    ppDBText15: TppDBText;
    ppSystemVariable4: TppSystemVariable;
    ppShape16: TppShape;
    ppLabel45: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule3: TraCodeModule;
    raCodeModule2: TraCodeModule;
      Procedure FormCreate(Sender: TObject);
      Procedure spbImprimirClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormShow(Sender: TObject);
      Procedure ppSummaryBand1BeforePrint(Sender: TObject);
      Procedure spbSairClick(Sender: TObject);
   Private
      { Private declarations }
      CtrlMovimFinanc: TCtrlMovimFinanc;
   Public
      { Public declarations }
      sDataExtrato: String;
      sCodPortador: String;
   End;

Var
   frmEspelhoDaConciliacaoBancariaAtual: TfrmEspelhoDaConciliacaoBancariaAtual;
   dValorNaoConc: Double;

Implementation
{$R *.DFM}

Uses dBaseDados, uSistema, uMensErro, fAguarde, fTelaAut;

Procedure TfrmEspelhoDaConciliacaoBancariaAtual.FormCreate(Sender: TObject);
Begin
   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc := TCtrlMovimFinanc.Create(Sistema.IdEmpresa,
      Sistema.IdModulo,
      Sistema.IdUsuario,
      Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

   qryLkpBanco.Close;
   qryLkpBanco.Open;
   dValorNaoConc := 0.00;
End;

Procedure TfrmEspelhoDaConciliacaoBancariaAtual.spbImprimirClick(Sender: TObject);
Begin
   If dtDiaExtrato.Text = '' Then
      Begin
         MsgDlg('Selecione a Data da Conciliação !', 'Aviso', mtWarning, [mbOk], 0);
         dtDiaExtrato.Setfocus;
         Exit;
      End;

   If dblkpBanco.Text = '' Then
      Begin
         MsgDlg('Selecione o Banco/Conta a ser Conciliada !', 'Aviso', mtWarning, [mbOk], 0);
         dblkpBanco.Setfocus;
         Exit;
      End;

   Screen.Cursor := crSQLWait;
   qryEmpresa.Close;
   qryEmpresa.Open;

   // Saldo Atual do Movimento do CFINAN
   // Sol..........: 31714/13003 KTN 1881396 - Paulo Nobre
   // Sol 31714/13162  KTN 1887925 - Paulo Nobre
   qrySaldoMovimFinanc.Close;
   qrySaldoMovimFinanc.SQL.Clear;
   qrySaldoMovimFinanc.SQL.add('SELECT    ');
   qrySaldoMovimFinanc.SQL.add('(SELECT SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN))  '); // Saldo Anterior
   qrySaldoMovimFinanc.SQL.add('FROM MOVIMFINANC  ');
   qrySaldoMovimFinanc.SQL.add('WHERE DATALANCFINAN < ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qrySaldoMovimFinanc.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString + ')');
   qrySaldoMovimFinanc.SQL.add(' +         ');
   qrySaldoMovimFinanc.SQL.add('(SELECT SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN))  '); // Saldo do Dia
   qrySaldoMovimFinanc.SQL.add('FROM MOVIMFINANC                                      ');
   qrySaldoMovimFinanc.SQL.add('WHERE DATALANCFINAN = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qrySaldoMovimFinanc.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qrySaldoMovimFinanc.SQL.add('      AND SITBLOQUEIOLANC = 0 )  AS SALDOMOVFINANC '); // Não bloqueado
   qrySaldoMovimFinanc.SQL.add('FROM DUAL    ');
   qrySaldoMovimFinanc.Open;

   // Selecionando o Movimento Financeiro - CFINAN que não foi conciliado e foi tratado como "Não conciliado no dia = (Z)"
   // Sol..........: 31714/13003 KTN 1881396 - Paulo Nobre
   qryMovimento.Close;
   qryMovimento.SQL.Clear;
   qryMovimento.SQL.add('SELECT NULL DATALANCFINAN, '''' HISTORICO, 0.00 VALORLANCFINAN  '); // macete para sair algo impresso caso não tenha movimento
   qryMovimento.SQL.add('FROM DUAL         ');
   qryMovimento.SQL.add('UNION             ');
   qryMovimento.SQL.add('SELECT M.DATALANCFINAN, ');
   qryMovimento.SQL.add('M.HISTORICO,    ');
   //qryMovimento.SQL.add('ABS(DECODE(M.ENTRADASAIDA, ''S'', -M.VALORLANCFINAN, M.VALORLANCFINAN)) AS VALORLANCFINAN  '); // // Sol 211867 Kintana 2035610
   qryMovimento.SQL.add('(DECODE(M.ENTRADASAIDA, ''E'', -M.VALORLANCFINAN, M.VALORLANCFINAN)) AS VALORLANCFINAN  '); // // Sol 211867 Kintana 2035610
   qryMovimento.SQL.add('FROM MOVIMFINANC M     ');
   qryMovimento.SQL.add('WHERE M.DATALANCFINAN <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryMovimento.SQL.add('      AND M.CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryMovimento.SQL.add('      AND M.VALORLANCFINAN <> 0 ');
   qryMovimento.SQL.add('      AND M.CONCILIADO IN (''N'', ''Z'') '); // Não Conciliado e Não conciliado no dia
   qryMovimento.SQL.add('ORDER BY DATALANCFINAN ASC ');
   qryMovimento.Open;

   // Selecionando os Cheques Bloqueados Anteriores a data
   // Sol..........: 31714/12942 - Paulo Nobre
   qryBloqCheques.Close;
   qryBloqCheques.SQL.Clear;
   // Sol 198796/13843 Kintana 1914601 -  Paulo Nobre
 //  qryBloqCheques.SQL.add('SELECT NULL DATALANCFINAN, '''' HISTORICO, 0.00 VALORLANCFINAN, NULL DATADISPFINANC  '); // macete para sair algo impresso caso não tenha movimento
//   qryBloqCheques.SQL.add('FROM DUAL         ');
 //  qryBloqCheques.SQL.add('UNION             ');
   qryBloqCheques.SQL.add('SELECT DATALANCFINAN, HISTORICO, VALORLANCFINAN, DATADISPFINANC       ');
   qryBloqCheques.SQL.add('FROM MOVIMFINANC                                      ');
   qryBloqCheques.SQL.add('WHERE DATALANCFINAN <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryBloqCheques.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryBloqCheques.SQL.add('      AND SITBLOQUEIOLANC = 1 '); // Bloqueado
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryBloqCheques.SQL.add('      AND HISTPADFINAN = 14   '); // Cheques
   qryBloqCheques.SQL.add('ORDER BY DATALANCFINAN ');
   qryBloqCheques.Open;

   // Selecionando os Outros Bloqueados Anteriores a data
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryBloqOutros.Close;
   qryBloqOutros.SQL.Clear;
   qryBloqOutros.SQL.add('SELECT DATALANCFINAN, HISTORICO, VALORLANCFINAN, DATADISPFINANC       ');
   qryBloqOutros.SQL.add('FROM MOVIMFINANC                                      ');
   qryBloqOutros.SQL.add('WHERE DATALANCFINAN <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryBloqOutros.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryBloqOutros.SQL.add('      AND SITBLOQUEIOLANC = 1 '); // Bloqueado
   qryBloqOutros.SQL.add('      AND HISTPADFINAN IN (19, 20)   '); // SICOB D+1 e SIVAT
   qryBloqOutros.SQL.add('ORDER BY DATALANCFINAN ');
   qryBloqOutros.Open;

   // Selecionando os Bloqueios Judiciais Anteriores a data
   // Sol..........: 31714/12942 - Paulo Nobre
   qryBloqJud.Close;
   qryBloqJud.SQL.Clear;
   qryBloqJud.SQL.add('SELECT DATALANCTO, HISTORICO, ABS(DECODE(TIPOLANCTO, ''S'', -VALORLANCTO, VALORLANCTO)) AS VALORLANCTO, DATADISPONIB ');
   qryBloqJud.SQL.add('FROM MOVFINBLOQJUDICIAIS                                      ');
   qryBloqJud.SQL.add('WHERE DATALANCTO <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryBloqJud.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryBloqJud.SQL.add('      AND SITBLOQDESBLOQ = 1    '); // Bloqueado
   qryBloqJud.SQL.add('      AND IDMOVFINBLOQJUDICIAIS NOT IN (SELECT IDMOVFINBLOQJUDICIAISPAI FROM MOVFINBLOQJUDICIAIS  ');
   qryBloqJud.SQL.add('                                        WHERE DATALANCTO <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryBloqJud.SQL.add('                                              AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryBloqJud.SQL.add('                                              AND SITBLOQDESBLOQ = 0 ) ');
   qryBloqJud.SQL.add('ORDER BY DATALANCTO                ');
   qryBloqJud.Open;

   // Selecionando o Total dos Bloqueios
   // Sol..........: 31714/12942 - Paulo Nobre
   qryTotBloqueios.Close;
   qryTotBloqueios.SQL.Clear;
   qryTotBloqueios.SQL.add('SELECT                        ');
   qryTotBloqueios.SQL.add('(SELECT ABS(NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)), 0)) ');
   qryTotBloqueios.SQL.add(' FROM MOVIMFINANC     ');
   qryTotBloqueios.SQL.add(' WHERE DATALANCFINAN <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryTotBloqueios.SQL.add('       AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryTotBloqueios.SQL.add('       AND SITBLOQUEIOLANC = 1 '); // Bloqueado
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryTotBloqueios.SQL.add('       AND HISTPADFINAN IN (14, 19, 20))   '); // Cheques e SICOB D+1 e SIVAT
   qryTotBloqueios.SQL.add(' +         ');
   qryTotBloqueios.SQL.add('(SELECT ABS(NVL(SUM(DECODE(TIPOLANCTO, ''S'', -VALORLANCTO, VALORLANCTO)), 0))  ');
   qryTotBloqueios.SQL.add(' FROM MOVFINBLOQJUDICIAIS   ');
   qryTotBloqueios.SQL.add(' WHERE DATALANCTO <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryTotBloqueios.SQL.add('       AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString + ') AS VALORTOTBLOQ');
   qryTotBloqueios.SQL.add('FROM DUAL    ');
   qryTotBloqueios.Open;

   // Selecionando o Total do Extrato Bancário
   // Sol..........: 31714/12942 - Paulo Nobre
   // SOL 31714/13082  KTN 1883867 - Paulo Nobre
   qrySaldoExtBanc.Close;
   qrySaldoExtBanc.SQL.Clear;
   qrySaldoExtBanc.SQL.add('SELECT           ');
   qrySaldoExtBanc.SQL.add('(SELECT NVL(SUM(VALORLANCTO),0) ');
   qrySaldoExtBanc.SQL.add('FROM MOVEXTRATOBANCARIO                ');
   qrySaldoExtBanc.SQL.add('WHERE DATAEXTRATO < ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qrySaldoExtBanc.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString + ' )');
   qrySaldoExtBanc.SQL.add(' +         ');
   qrySaldoExtBanc.SQL.add('(SELECT NVL(SUM(VALORLANCTO),0) ');
   qrySaldoExtBanc.SQL.add('FROM MOVEXTRATOBANCARIO                ');
   qrySaldoExtBanc.SQL.add('WHERE DATAEXTRATO = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qrySaldoExtBanc.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString + ' ) AS SALDOEXTRATO ');
   qrySaldoExtBanc.SQL.add('FROM DUAL    ');
   qrySaldoExtBanc.Open;

   //Cássio Rovaroto - SIG nº 116208 - Início
   qryMovimentoAnalitico.Close;
   qryMovimentoAnalitico.SQL.Clear;
   qryMovimentoAnalitico.SQL.Add('SELECT ' + QuotedStr(Datetostr(dtDiaExtrato.Date)) + ' AS DATA_CONCILIACAO, ');
   qryMovimentoAnalitico.SQL.Add('        EB.BANCO, EB.IDLANCCONCILIADO, EB.NUMDOCUMENTO, EB.TIPOLANCTO, EB.VALORLANCTO, EB.HISTORICO, ');
   qryMovimentoAnalitico.SQL.Add('        EP.BANCO, EP.IDLANCCONCILIADO, EP.NUMCHQBORDERO, EP.DATALANCFINAN, EP.ENTRADASAIDA, EP.VALORLANCFINAN, EP.DATADISPFINANC, EP.HISTORICO ');
   qryMovimentoAnalitico.SQL.Add('FROM( ');
   qryMovimentoAnalitico.SQL.Add('SELECT ROWNUM AS LINHA, EB1.* FROM( ');
   qryMovimentoAnalitico.SQL.Add('SELECT ' + QuotedStr(Datetostr(dtDiaExtrato.Date)) + ' AS DATA_CONCILIACAO, C.DESCRICAO AS BANCO, ');
   qryMovimentoAnalitico.SQL.Add('       ME.IDLANCCONCILIADO, ME.NUMDOCUMENTO, ME.TIPOLANCTO, ME.VALORLANCTO, ME.HISTORICO ');
   qryMovimentoAnalitico.SQL.Add('  FROM MOVEXTRATOBANCARIO ME ');
   qryMovimentoAnalitico.SQL.Add('  JOIN CM.PORTADORCONTA C ON ME.CODPORTADOR = C.CODPORTADOR ');
   qryMovimentoAnalitico.SQL.Add('  JOIN CM.BANCO B ON B.IDPESSOA = C.IDBANCO AND (C.FLGSTATUS = ''A'' OR C.FLGSTATUS is null) ');
   qryMovimentoAnalitico.SQL.Add(' WHERE ME.DATAEXTRATO = ' + QuotedStr(Datetostr(dtDiaExtrato.Date)) );
   qryMovimentoAnalitico.SQL.Add('   AND C.CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString );  // WHERE C.DESCRICAO = ''CEF 4255 CC 003.00930100-6'' ');  // WO20267
   qryMovimentoAnalitico.SQL.Add('   AND ME.CONCILIADO = ''S'' ');
   qryMovimentoAnalitico.SQL.Add(' ORDER BY ME.CODPORTADOR, ');
   qryMovimentoAnalitico.SQL.Add('       ME.IDLANCCONCILIADO, ');
   qryMovimentoAnalitico.SQL.Add('       ME.TIPOLANCTO, ');
   qryMovimentoAnalitico.SQL.Add('       ME.VALORLANCTO DESC ');
   qryMovimentoAnalitico.SQL.Add('   ) EB1) EB ');
   qryMovimentoAnalitico.SQL.Add('   FULL OUTER JOIN ');
   qryMovimentoAnalitico.SQL.Add('   ( ');
   qryMovimentoAnalitico.SQL.Add('SELECT ROWNUM AS LINHA, EP1.* FROM( ');
   qryMovimentoAnalitico.SQL.Add('SELECT ' + QuotedStr(Datetostr(dtDiaExtrato.Date)) + ' AS DATA_CONCILIACAO, C.DESCRICAO AS BANCO, ');
   qryMovimentoAnalitico.SQL.Add('       M.IDLANCCONCILIADO, ');
   qryMovimentoAnalitico.SQL.Add('       M.NUMCHQBORDERO, ');
   qryMovimentoAnalitico.SQL.Add('       M.DATALANCFINAN, ');
   qryMovimentoAnalitico.SQL.Add('       M.ENTRADASAIDA, ');
   qryMovimentoAnalitico.SQL.Add('       DECODE(M.ENTRADASAIDA, ''S'', -M.VALORLANCFINAN, M.VALORLANCFINAN) AS VALORLANCFINAN, ');
   qryMovimentoAnalitico.SQL.Add('       M.DATADISPFINANC, ');
   qryMovimentoAnalitico.SQL.Add('       M.HISTORICO ');
   qryMovimentoAnalitico.SQL.Add('  FROM CM.MOVIMFINANC M ');
   qryMovimentoAnalitico.SQL.Add('  JOIN CM.PORTADORCONTA C ON M.CODPORTADOR = C.CODPORTADOR ');
   qryMovimentoAnalitico.SQL.Add('  JOIN CM.BANCO B ON B.IDPESSOA = C.IDBANCO AND (C.FLGSTATUS = ''A'' OR C.FLGSTATUS IS NULL) ');
   qryMovimentoAnalitico.SQL.Add(' WHERE C.CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString );  //WHERE C.DESCRICAO = ''CEF 4255 CC 003.00930100-6'' ');  // WO20267
   qryMovimentoAnalitico.SQL.Add('   AND M.VALORLANCFINAN <> 0 ');
   qryMovimentoAnalitico.SQL.Add('   AND M.DATALANCFINAN = ' + QuotedStr(Datetostr(dtDiaExtrato.Date)));
   qryMovimentoAnalitico.SQL.Add('   AND M.CONCILIADO IN (''S'', ''D'' ) ');
   qryMovimentoAnalitico.SQL.Add('  ORDER BY M.IDLANCCONCILIADO, ');
   qryMovimentoAnalitico.SQL.Add('       M.DATALANCFINAN, ');
   qryMovimentoAnalitico.SQL.Add('       M.ENTRADASAIDA, ');
   qryMovimentoAnalitico.SQL.Add('       M.VALORLANCFINAN DESC ');
   qryMovimentoAnalitico.SQL.Add('    ) EP1) EP ');
   qryMovimentoAnalitico.SQL.Add('    ON EB.LINHA = EP.LINHA ');
   qryMovimentoAnalitico.Open;
   //Cássio Rovaroto - SIG nº 116208 - Fim

   Screen.Cursor := crDefault;

   pplblDataConc.caption := dtDiaExtrato.text;
   pplblConta.caption := dblkpBanco.text;
   TfrmPreview.CreateModalPreview(Application, relEspelhoMov, relEspelhoMov.PrinterSetup.DocumentName);

   qryEmpresa.Close;
   qrySaldoMovimFinanc.Close;
   qryMovimento.Close;
   qryTotBloqueios.Close;
   qryBloqCheques.Close;
   qryBloqJud.Close;
   qryTotBloqueios.Close;
   qrySaldoExtBanc.Close;
End;

Procedure TfrmEspelhoDaConciliacaoBancariaAtual.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   qryLkpBanco.Close;
   qryEmpresa.Close;
   qrySaldoMovimFinanc.Close;
   qryTotBloqueios.Close;
   qryMovimento.Close;
   qryBloqCheques.Close;
   qryBloqJud.Close;
   qryTotBloqueios.Close;
   qrySaldoExtBanc.Close;
   action := cafree;
End;

Procedure TfrmEspelhoDaConciliacaoBancariaAtual.FormShow(Sender: TObject);
Begin
   dtDiaExtrato.Text := sDataExtrato;
   dblkpBanco.LookupValue := sCodPortador;
End;

Procedure TfrmEspelhoDaConciliacaoBancariaAtual.ppSummaryBand1BeforePrint(Sender: TObject);
Begin
   // Sol..........: 31714/12942 - Paulo Nobre
   //ppSaldoDispMovimFinanc.Caption := floattostrf((abs(qrySaldoExtBanc.fieldbyname('SALDOEXTRATO').asFloat) - ppDBTotMovNaoConc.Value) - abs(qryTotBloqueios.fieldbyname('VALORTOTBLOQ').asFloat), ffnumber, 18, 2); // Sol 211867 Kintana 2035610

   //SIG125198 - Everson Cunha - Ini
   //ppSaldoDispMovimFinanc.Caption := floattostrf(((qrySaldoExtBanc.fieldbyname('SALDOEXTRATO').asFloat) - ppDBTotMovNaoConc.Value) - (qryTotBloqueios.fieldbyname('VALORTOTBLOQ').asFloat), ffnumber, 18, 2); // Sol 211867 Kintana 2035610

   if dtDiaExtrato.Date < 44743 then // 01/07/2022
     ppSaldoDispMovimFinanc.Caption := floattostrf(((qrySaldoExtBanc.fieldbyname('SALDOEXTRATO').asFloat) - ppDBTotMovNaoConc.Value) - (qryTotBloqueios.fieldbyname('VALORTOTBLOQ').asFloat), ffnumber, 18, 2)
   else
     ppSaldoDispMovimFinanc.Caption := floattostrf(((qrySaldoExtBanc.fieldbyname('SALDOEXTRATO').asFloat) - ppDBTotMovNaoConc.Value), ffnumber, 18, 2);
   //SIG125198 - Everson Cunha - Fim
End;

Procedure TfrmEspelhoDaConciliacaoBancariaAtual.spbSairClick(Sender: TObject);
Begin
   Close;
End;

End.

