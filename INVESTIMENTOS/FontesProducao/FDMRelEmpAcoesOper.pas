//*******************************************************************************************************
//N. Sol..........: 179261
//N. Kintana......: 1654087
//Data............: 03/05/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado toda a querys para considerar o novo tipo 8 - Contrato pre-datado
//*******************************************************************************************************
//N. Sol..........: 163239
//N. Kintana......: 1392476           
//Data............: 16/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado toda a qryOperacoes para considerar os novos tipos 6, 7
//***************************************************************************************************
// Data      : 28/05/2008
// Código    : AL_4
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Inclusão do campo BOLETA - Ajustes no layout
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 01/10/2007
// Código    : AL_3
// Pendencia : 26454
// SOL       : 70153
// Desc      : Alteração no relatório da descrição da coluna "valor resgate" para
//             "valor na data do vencimento".
//******************************************************************************
// Data      : 01/10/2007
// Código    : AL_2
// Pendencia : 26367
// SOL       : 69359
// Desc      : Acrescido ao relatório de operações de empréstimos o filtro de
//             "tipo de operações" para segregar os lançamentos de empréstimo das
//             reversões.
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_1
// Pendencia : 22982
// Desc      : Acerto na qryOperacoes que estava com o campo PLANPRVCONTABPATRO do
//             order by errado
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_1
// Pendencia : 22982
// Desc      : Implementacao Plano e Patro
//******************************************************************************
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : qryOperacoes
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

Unit FDMRelEmpAcoesOper;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr,
   //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   ppModule, raCodMod, ppParameter;

Type
   TDmRelEmpAcoesOper = Class(TdtmReports)
      rptEmpAcoesOper: TppReport;
      pplOperacoes: TppBDEPipeline;
      dsOperacoes: TwwDataSource;
      //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      ppLCarteiraEx: TppLabel;
      ppDbLogo: TppDBImage;
      ppLabel4: TppLabel;
      pplExemploppField3: TppField;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      shpCabecalho: TppShape;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel12: TppLabel;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppDBImage1: TppDBImage;
      pplPeriodo: TppLabel;
      //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      ppLabel16: TppLabel;
      ppDBText5: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppSystemVariable1: TppSystemVariable;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      ppDBText8: TppDBText;
      ppLabel15: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      qryOperacoes: TwwQuery;
      StringField14: TStringField;
      DateTimeField5: TDateTimeField;
      StringField15: TStringField;
      StringField16: TStringField;
      DateTimeField6: TDateTimeField;
      StringField17: TStringField;
      StringField18: TStringField;
      FloatField23: TFloatField;
      FloatField24: TFloatField;
      FloatField25: TFloatField;
      FloatField26: TFloatField;
      FloatField27: TFloatField;
      StringField19: TStringField;
      qryOperacoesIDTIPOOPERACAO: TFloatField;
      qryOperacoesSLDJUROSIMPORTA: TFloatField;
      qryOperacoesVLRJUROS: TFloatField;
      qryOperacoesSLDJUROS: TFloatField;
      qryOperacoesIDCARTEIRAINVEST: TFloatField;
      dbDataOper: TppDBText;
      ppDBText7: TppDBText;
      ppDBText1: TppDBText;
      dbDtVencimento: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      dbQuantidade: TppDBText;
      dbPuEmissao: TppDBText;
      dbPUOperacao: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppLabel17: TppLabel;
      ppLabel10: TppLabel;
      //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      ppLabel20: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppTotalJuros: TppLabel;
      ppTotalReversoes: TppLabel;
      shpRenFixSaldoDetPai: TppShape;
      qryOperacoesDESCTIPOLANCAMENTO: TStringField;
      ppDBText9: TppDBText;
      //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
      qryOperacoesIDENTIFICACAO: TStringField;
      ppLabel21: TppLabel;
      Procedure rptEmpAcoesOperStartPage(Sender: TObject);
      Procedure rptEmpAcoesOperBeforePrint(Sender: TObject);
      Procedure ppSummaryBand1BeforePrint(Sender: TObject);
      Procedure ppDetailBand1AfterPrint(Sender: TObject);
      Procedure shpRenFixSaldoDetPaiPrint(Sender: TObject);
   Private
      { Private declarations }
      cCorZebra: TColor;
   Public
      { Public declarations }
   End;

Var
   DmRelEmpAcoesOper: TDmRelEmpAcoesOper;
   iRec: Integer;
   //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   dTotalJuros, dTotalReversoes: Double;
   dAcumula: Boolean;

Implementation

Uses dOperComum;

{$R *.DFM}

Procedure TDmRelEmpAcoesOper.rptEmpAcoesOperStartPage(Sender: TObject);
Begin
   Inherited;
   cCorZebra := $00E3E3E3;
   //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   shpRenFixSaldoDetPai.Brush.Color := clWhite;
End;

Procedure TDmRelEmpAcoesOper.rptEmpAcoesOperBeforePrint(Sender: TObject);
Begin
   Inherited;
   //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   dAcumula := True;
   dTotalJuros := 0;
   dTotalReversoes := 0;
End;

Procedure TDmRelEmpAcoesOper.ppSummaryBand1BeforePrint(Sender: TObject);
Begin
   Inherited;
   //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   ppTotalJuros.Caption := floattostrf(dTotalJuros, ffnumber, 12, 2);
   ppTotalReversoes.Caption := floattostrf(dTotalReversoes, ffnumber, 12, 2);
   dAcumula := False;
End;

//Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253

Procedure TDmRelEmpAcoesOper.ppDetailBand1AfterPrint(Sender: TObject);
Begin
   Inherited;
   If dAcumula = True Then
      Begin
         If DmRelEmpAcoesOper.qryOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger = -54 Then // Juros
            dTotalJuros := dTotalJuros + DmRelEmpAcoesOper.qryOperacoes.FieldByName('VLRJUROSIMPORTA').AsFloat
         Else If (DmRelEmpAcoesOper.qryOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger = -53) OR (DmRelEmpAcoesOper.qryOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger = -10053) Then
            dTotalReversoes := dTotalReversoes + DmRelEmpAcoesOper.qryOperacoes.FieldByName('VLRJUROSIMPORTA').AsFloat;
      End;
End;

Procedure TDmRelEmpAcoesOper.shpRenFixSaldoDetPaiPrint(Sender: TObject);
Begin
   Inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
End;

End.

