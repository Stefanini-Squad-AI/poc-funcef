// **************************************************************************************************
//N. Sol..........: 84432
//N. Kintana......: 523253
//Data............: 24/02/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado SQL de seleção para obtenção de um novo layout de apresentação do relatório
//***************************************************************************************************
//Rotina..........: FImportaEmpAcoes
//N. Sol..........: 84432
//N. Kintana......: 523253
//Data............: 20/01/2011
//Responsável.....: Renan Cristiano
//Descrição.......: Relatório da Posição dos Contratos
//******************************************************************
Unit RContratosLiqEmpAcoes;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
   ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
   ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppParameter, ppModule, raCodMod;

Type
   TDmRContratosLiqEmpAcoes = Class(TDmRelatoriosInv)
      pplRContratosLiqEmpAcoes: TppBDEPipeline;
      dsRContratosLiqEmpAcoes: TwwDataSource;
      qryRContratosLiqEmpAcoes: TwwQuery;
      qryRContratosLiqEmpAcoesDATAOPERACAO: TDateTimeField;
      qryRContratosLiqEmpAcoesDATAVENCOPER: TDateTimeField;
      qryRContratosLiqEmpAcoesNUMCONTRATOCUSTODIA: TStringField;
      qryRContratosLiqEmpAcoesSIGLAACAOBOLSA: TStringField;
      qryRContratosLiqEmpAcoesSGLCORRETVALORES: TStringField;
      qryRContratosLiqEmpAcoesQTDHISTEMPACOES: TFloatField;
      qryRContratosLiqEmpAcoesPUOPERACAO: TFloatField;
      qryRContratosLiqEmpAcoesVLROPERACAO: TFloatField;
      qryRContratosLiqEmpAcoesSLDJUROSIMPORTA: TFloatField;
      qryRContratosLiqEmpAcoesSLDJUROS: TFloatField;
      qryRContratosLiqEmpAcoesPLANPRVCONTABPATRO: TStringField;
      qryRContratosLiqEmpAcoesDESCCARTINVEST: TStringField;
      qryRContratosLiqEmpAcoesOutros: TwwQuery;
      qryRContratosLiqEmpAcoesOutrosDATAHISTEMPACOES: TDateTimeField;
      qryRContratosLiqEmpAcoesOutrosDATAVENCOPER: TDateTimeField;
      qryRContratosLiqEmpAcoesOutrosNUMCONTRATOCUSTODIA: TStringField;
      qryRContratosLiqEmpAcoesOutrosIDTIPOOPERACAO: TFloatField;
      qryRContratosLiqEmpAcoesOutrosQTDHISTEMPACOES: TFloatField;
      qryRContratosLiqEmpAcoesOutrosPUOPERACAO: TFloatField;
      qryRContratosLiqEmpAcoesOutrosVLROPERACAO: TFloatField;
      qryRContratosLiqEmpAcoesOutrosSLDJUROSIMPORTA: TFloatField;
      qryRContratosLiqEmpAcoesOutrosPLANPRVCONTABPATRO: TStringField;
      qryRContratosLiqEmpAcoesOutrosDESCCARTINVEST: TStringField;
      qryRContratosLiqEmpAcoesTAXAOPERACAO: TFloatField;
      qryRContratosLiqEmpAcoesOutrosVLRJUROSIMPORTA: TFloatField;
      pplRContratosLiqEmpAcoesOutros: TppBDEPipeline;
      dsRContratosLiqEmpAcoesOutros: TwwDataSource;
      qryRContratosLiqEmpAcoesOutrosTIPOMOVIMENTO: TStringField;
      qryRContratosLiqEmpAcoesOutrosSIGLAACAOBOLSA: TStringField;
      qryRContratosLiqEmpAcoesOutrosDATAREVERSAO: TDateTimeField;
      qryRContratosLiqEmpAcoesOutrosSLDHISTEMPACOES: TFloatField;
      rpRContratosLiqEmpAcoes: TppReport;
      ppParameterList1: TppParameterList;
      qryRContratosLiqEmpAcoesVLRRESGATE: TFloatField;
      qryRContratosLiqEmpAcoesIDCARTEIRAINVEST: TFloatField;
      qryRContratosLiqEmpAcoesIDINVESTIMENTO: TFloatField;
      qryRContratosLiqEmpAcoesIDTIPOOPERACAO: TFloatField;
      qryRContratosLiqEmpAcoesIDCUSTODIANTE: TFloatField;
      qryRContratosLiqEmpAcoesIDTIPOINVEST: TFloatField;
      qryRContratosLiqEmpAcoesOutrosIDCARTEIRAINVEST: TFloatField;
      qryRContratosLiqEmpAcoesOutrosIDINVESTIMENTO: TFloatField;
      ppHeaderBand2: TppHeaderBand;
      lblPosicao: TppLabel;
      ppLabel12: TppLabel;
      ppDBImage2: TppDBImage;
      ppDBText11: TppDBText;
      lblPeriodo: TppLabel;
      ppShape1: TppShape;
      ppLabel13: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppShape2: TppShape;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDetailBand3: TppDetailBand;
      ppShape4: TppShape;
      ppDBText24: TppDBText;
      ppDBText29: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLine2: TppLine;
      raCodeModule1: TraCodeModule;
      ppFooterBand2: TppFooterBand;
      ppLine4: TppLine;
      ppLabel32: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppShape5: TppShape;
      ppDBText6: TppDBText;
      ppLabel15: TppLabel;
      ppLine1: TppLine;
      ppGroupFooterBand2: TppGroupFooterBand;
      raCodeModule2: TraCodeModule;
      ppShape6: TppShape;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppDBText2: TppDBText;
      qryRContratosLiqEmpAcoesOutrosRECEITA: TFloatField;
      ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel8: TppLabel;
      Procedure shpRenFixSaldoDetPaiPrint(Sender: TObject);
      Procedure rpRContratosLiqEmpAcoesxStartPage(Sender: TObject);
      Procedure qryRContratosLiqEmpAcoesAfterScroll(DataSet: TDataSet);
      Procedure ppShape4Print(Sender: TObject);
   Private
      { Private declarations }
      cCorZebra: TColor;
   Public
      { Public declarations }
   End;

Var
   DmRContratosLiqEmpAcoes: TDmRContratosLiqEmpAcoes;

Implementation

Uses dOperComum;

{$R *.DFM}

Procedure TDmRContratosLiqEmpAcoes.shpRenFixSaldoDetPaiPrint(Sender: TObject);
Begin
   Inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
End;

Procedure TDmRContratosLiqEmpAcoes.rpRContratosLiqEmpAcoesxStartPage(Sender: TObject);
Begin
   Inherited;
   cCorZebra := $00E3E3E3;
End;

Procedure TDmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoesAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   qryRContratosLiqEmpAcoesOutros.DisableControls;
   qryRContratosLiqEmpAcoesOutros.Filter := 'NUMCONTRATOCUSTODIA = ' + QuotedStr(qryRContratosLiqEmpAcoesNUMCONTRATOCUSTODIA.AsString);
   qryRContratosLiqEmpAcoesOutros.Filtered := True;
   qryRContratosLiqEmpAcoesOutros.EnableControls;
End;

Procedure TDmRContratosLiqEmpAcoes.ppShape4Print(Sender: TObject);
Begin
   Inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
End;

End.

