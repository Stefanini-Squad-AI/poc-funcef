//*******************************************************************************************************
//N. Sol..........: 166163
//N. Kintana......: 1445211
//Data............: 06/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusao do somatorio (saldo) da quantidade
//******************************************************************************************************
//N. Sol..........: 164140
//N. Kintana......: 1407348
//Data............: 30/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Acerto no layuot e ajustes no SQL
//*******************************************************************************************************
//N. Sol..........: 84432
//N. Kintana......: 523253
//Data............: 24/02/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado SQL de seleção para obtenção de um novo layout de apresentação do relatório
//***************************************************************************************************
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
      dsRContratosLiqEmpAcoes: TwwDataSource;
      qryRContratosLiqEmpAcoes: TwwQuery;
      rpRContratosLiqEmpAcoes: TppReport;
      ppParameterList1: TppParameterList;
      pplRContratosLiqEmpAcoes: TppBDEPipeline;
      ppHeaderBand2: TppHeaderBand;
      lblPosicao: TppLabel;
      ppLabel12: TppLabel;
      ppDBImage2: TppDBImage;
      lblPeriodo: TppLabel;
      ppShape1: TppShape;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppShape2: TppShape;
      ppDBText16: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText23: TppDBText;
      ppDBText29: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
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
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText15: TppDBText;
      ppDBCalc8: TppDBCalc;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBText1: TppDBText;
      qryRContratosLiqEmpAcoesNUMCONTRATOCUSTODIA: TStringField;
      qryRContratosLiqEmpAcoesDATAOPER: TDateTimeField;
      qryRContratosLiqEmpAcoesDATAVENCTO: TDateTimeField;
      qryRContratosLiqEmpAcoesDSCMOVIMENTO: TStringField;
      qryRContratosLiqEmpAcoesQTDOPER: TFloatField;
      qryRContratosLiqEmpAcoesPU: TFloatField;
      qryRContratosLiqEmpAcoesTAXA: TFloatField;
      qryRContratosLiqEmpAcoesVALORCONTRATO: TFloatField;
      qryRContratosLiqEmpAcoesVALOROPER: TFloatField;
      qryRContratosLiqEmpAcoesRECEITA: TFloatField;
      qryRContratosLiqEmpAcoesTIPOLANCAMENTO: TStringField;
      ppLabel1: TppLabel;
      ppLine3: TppLine;
      ppLabel2: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppLabel13: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      qryRContratosLiqEmpAcoesPLANOPATRO: TStringField;
      qryRContratosLiqEmpAcoesDSCINVEST: TStringField;
      ppDBText2: TppDBText;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      qryRContratosLiqEmpAcoesCORRET: TStringField;
      //Paulo Nobre 30/08/2011 - SOL 164140 - Kintana 1407348
      qryRContratosLiqEmpAcoesSALDO: TFloatField;
      ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
      Procedure shpRenFixSaldoDetPaiPrint(Sender: TObject);
      Procedure rpRContratosLiqEmpAcoesxStartPage(Sender: TObject);
      //Paulo Nobre 30/08/2011 - SOL 164140 - Kintana 1407348
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

//Paulo Nobre 30/08/2011 - SOL 164140 - Kintana 1407348
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

