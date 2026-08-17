//******************************************************************************
//N. Sol..........: 185984
//N. Kintana......: 1746272
//Data............: 30/07/2012
//Responsável.....: Otacilio Aquino
//Descrição.......: Inconsistência na composição do saldo final
//******************************************************************************
//N. Sol..........: 167458
//N. Kintana......: 1469280
//Data............: 27/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Reagrupamento dos resultados para apresentação dos relatorios sintético e analítico
//*******************************************************************************************************
//N. Sol..........: 166300
//N. Kintana......: 1446695
//Data............: 07/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Reagrupamento dos resultados para apresentação dos relatorios sintético e analítico
//                  Alteração no layout para prover esta nova ordenação
//*******************************************************************************************************
//N. Sol..........: 166163
//N. Kintana......: 1445211
//Data............: 06/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Reordenação dos resultados para plano, contrato e investimento
//                  Alteração no layout para prover esta nova ordenação
//******************************************************************************************************
//Rotina..........: FDMRelPosicaoJurosEmAberto
//N. Sol..........:
//N. Kintana......:
//Data............: 30/09/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Acerto no ROUND dos SQLs
//******************************************************************************************************
//Rotina..........: FDMRelPosicaoJurosEmAberto
//N. Sol..........: 161867
//N. Kintana......: 1371009
//Data............: 27/07/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Consulta Posição dos Juros em Aberto
//******************************************************************************************************
//Rotina..........: FDMRelPosicaoJurosEmAberto
//N. Sol..........: 1600038
//N. Kintana......: 1331763
//Data............: 21/06/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Consulta Posição dos Juros em Aberto
//***********************************************************************************************
Unit FDMRelPosicaoJurosEmAberto;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr;

Type
   TDMRelPosicaoJurosEmAberto = Class(TdtmReports)
      rptMovEmpAcoes: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      pplMovimento: TppBDEPipeline;
      qryMovimento: TwwQuery;
      shpCabecalho: TppShape;
      ppDBText1: TppDBText;
      ppLabel8: TppLabel;
      //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      dbSaldoAnt: TppDBText;
      ppLabel11: TppLabel;
      shpRenFixSaldoDetPai: TppShape;
      ppSummaryBand2: TppSummaryBand;
      dsMovimento: TwwDataSource;
      ppLabel5: TppLabel;
      ppLCarteiraEx: TppLabel;
      ppDbLogo: TppDBImage;
      ppLabel7: TppLabel;
      ppLabel2: TppLabel;
      ppLabel9: TppLabel;
      ppDBImage1: TppDBImage;
      pplPeriodo: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel12: TppLabel;
      ppDBText9: TppDBText;
      ppLabel10: TppLabel;
      ppLine1: TppLine;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      qryMovimentoIDPLANPREVCTBPATR: TFloatField;
      //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      qryMovimentoSALDO_ANTERIOR: TFloatField;
      qryMovimentoENTRADA: TFloatField;
      qryMovimentoSAIDA: TFloatField;
      qryMovimentoSALDO_ATUAL: TFloatField;
      //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      dbEntrada: TppDBText;
      dbSaida: TppDBText;
      dbSaldoAtu: TppDBText;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      qryMovimentoPLANOPATRO: TStringField;
      qryMovimentoCtr: TwwQuery;
      StringField1: TStringField;
      StringField2: TStringField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      dsMovimentoCtr: TwwDataSource;
      ppMovimentoCtr: TppBDEPipeline;
      rptMovEmpAcoesCtr: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel6: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppDBImage2: TppDBImage;
      pplPeriodoCtr: TppLabel;
      ppLabel20: TppLabel;
      ppDBText6: TppDBText;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppShape2: TppShape;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppLine3: TppLine;
      ppLabel24: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      ppLabel25: TppLabel;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppLabel26: TppLabel;
      ppLine4: TppLine;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      qryMovimentoCtrNUMCONTRATOCUSTODIA: TStringField;
      ppDBText14: TppDBText;
      ppLabel27: TppLabel;
      //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      wwQuery1: TwwQuery;
      StringField3: TStringField;
      StringField4: TStringField;
      StringField5: TStringField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      FloatField10: TFloatField;
      FloatField11: TFloatField;
      FloatField12: TFloatField;
      //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      qryMovimentoNUMCONTRATOCUSTODIA: TStringField;
      qryMovimentoSIGLABOLSA: TStringField;
      //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      wwQuery2: TwwQuery;
      StringField6: TStringField;
      StringField7: TStringField;
      StringField8: TStringField;
      FloatField13: TFloatField;
      FloatField14: TFloatField;
      FloatField15: TFloatField;
      FloatField16: TFloatField;
      FloatField17: TFloatField;
      Procedure rptMovEmpAcoesStartPage(Sender: TObject);
      Procedure shpRenFixSaldoDetPaiPrint(Sender: TObject);
   Private
      { Private declarations }
      cCorZebra: TColor;
   Public
      { Public declarations }
   End;

Var
   DMRelPosicaoJurosEmAberto: TDMRelPosicaoJurosEmAberto;

Implementation

{$R *.DFM}

Procedure TDMRelPosicaoJurosEmAberto.rptMovEmpAcoesStartPage(Sender: TObject);
Begin
   Inherited;
   cCorZebra := $00E3E3E3;
   shpRenFixSaldoDetPai.Brush.Color := clWhite;
End;

Procedure TDMRelPosicaoJurosEmAberto.shpRenFixSaldoDetPaiPrint(Sender: TObject);
Begin
   Inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
End;

End.

