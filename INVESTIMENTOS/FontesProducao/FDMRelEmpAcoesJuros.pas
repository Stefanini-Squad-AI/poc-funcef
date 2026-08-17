//*******************************************************************************************************
//N. Sol..........: 179261
//N. Kintana......: 1654087
//Data............: 03/05/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado toda a querys para considerar o novo tipo 8 - Contrato pre-datado
//*******************************************************************************************************
//N. Sol..........: 167458
//N. Kintana......: 1469280
//Data............: 27/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Reagrupamento dos resultados para apresentação dos relatorios sintético e analítico
//******************************************************************************************************
//N. Sol..........: 161867 
//N. Kintana......: 1371009
//Data............: 27/07/2011
//Responsável.....: Paulo Nobre
//******************************************************************************************************
Unit FDMRelEmpAcoesJuros;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppModule, raCodMod, ppStrtch, ppSubRpt, daDataModule;

Type
   TDmRelEmpAcoesJuros = Class(TdtmReports)
      pplEmpAcoesJurosAn: TppBDEPipeline;
      dsJurosAn: TwwDataSource;
      QryJurosAn: TwwQuery;
      QryJurosSi: TwwQuery;
      rptEmpAcoesJuros: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppDBImage1: TppDBImage;
      pplPeriodo: TppLabel;
      ppDBText9: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText5: TppDBText;
      ppDBText4: TppDBText;
      ppDBText11: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppLine3: TppLine;
      ppLabel16: TppLabel;
      ppSystemVariable3: TppSystemVariable;
	  //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel22: TppLabel;
      ppLine4: TppLine;
      ppDBCalc8: TppDBCalc;
	  //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDetailBand3: TppDetailBand;
      ppSummaryBand1: TppSummaryBand;
      ppLine2: TppLine;
      raCodeModule1: TraCodeModule;
      ppLabel8: TppLabel;
      ppLabel11: TppLabel;
      ppLabel4: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppLabel15: TppLabel;
      ppLabel17: TppLabel;
      ppLabel21: TppLabel;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText17: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppShape4: TppShape;
      ppShape6: TppShape;
      ppShape1: TppShape;
      ppLabel13: TppLabel;
      ppLabel1: TppLabel;
      ppLabel6: TppLabel;
      DsJurosSi: TwwDataSource;
      pplEmpAcoesJurosSi: TppBDEPipeline;
      ppDBText1: TppDBText;
      ppLabel2: TppLabel;
      QryJurosSiPLANPRVCONTABPATRO: TStringField;
      QryJurosSiDATAHISTEMPACOES: TDateTimeField;
      QryJurosSiDESCJUROS: TStringField;
      QryJurosSiVLRJUROSIMPORTA: TFloatField;
      QryJurosAnNUMCONTRATOCUSTODIA: TStringField;
      QryJurosAnDATAHISTEMPACOES: TDateTimeField;
      QryJurosAnIDTIPOOPERACAO: TFloatField;
      QryJurosAnDATAOPERACAO: TDateTimeField;
      QryJurosAnDATAVENCOPER: TDateTimeField;
      QryJurosAnSIGLAACAOBOLSA: TStringField;
      QryJurosAnQTDHISTEMPACOES: TFloatField;
      QryJurosAnPUOPERACAO: TFloatField;
      QryJurosAnVLRHISTEMPACOES: TFloatField;
      QryJurosAnTAXAOPERACAO: TFloatField;
      QryJurosAnVLRJUROSIMPORTA: TFloatField;
      QryJurosAnPLANPRVCONTABPATRO: TStringField;
      daDataModule1: TdaDataModule;
      Procedure QryJurosSiAfterScroll(DataSet: TDataSet);
      Procedure rptEmpAcoesJurosBeforePrint(Sender: TObject);
   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   DmRelEmpAcoesJuros: TDmRelEmpAcoesJuros;

Implementation

Uses FConsJurosProvisionados;

{$R *.DFM}

Procedure TDmRelEmpAcoesJuros.QryJurosSiAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   If (QryJurosAn.State = dsBrowse) then
      Begin
         Screen.Cursor := crSQLWait;
         QryJurosAn.DisableControls;
         QryJurosAn.Filter := 'PLANPRVCONTABPATRO = ' + QuotedStr(QryJurosSiPLANPRVCONTABPATRO.AsString) +
            ' AND DATAHISTEMPACOES = ' + QuotedStr(QryJurosSiDATAHISTEMPACOES.AsString);
         QryJurosAn.Filtered := True;
         QryJurosAn.EnableControls;
         Screen.Cursor := crDefault;
      End
   Else
      QryJurosAn.Filtered := False;
End;

Procedure TDmRelEmpAcoesJuros.rptEmpAcoesJurosBeforePrint(Sender: TObject);
Begin
   Inherited;
   ppSubReport1.ExpandAll := frmConsJurosProvisionados.cbExpandir.Checked;
End;

End.

