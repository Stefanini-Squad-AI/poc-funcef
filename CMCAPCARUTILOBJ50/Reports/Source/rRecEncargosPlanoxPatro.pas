{-------------------------------------------------------------------------------
  Data      : 03/01/2006
  Autor     : Rodolpho da Silva
  Pendência : 24108
  Descrição : Modificar a tabela de relacionamento PLANPREV para PLANPREVCONTABIL
-------------------------------------------------------------------------------
  Data      : 17/11/2006
  Autor     : Rodolpho da Silva
  Descrição : Incluir campos do rateio no relatório
-------------------------------------------------------------------------------
  Data      : 28/08/2006
  Autor     : Bruno Bastos
  Pendência : 22086
  Descrição : Implementação de quebra por plano e patro.
-------------------------------------------------------------------------------
  Data      : 01/11/2005
  Autor     : Rodolpho da Silva
  Pendência : 20581
  Descrição : Corrigido o erro em que ao selecionar mais de 1 (um) tipo de
              encargo, os demais selecionados eram ignorados.
-------------------------------------------------------------------------------}
//Alterado por: andre tavares - pendência 17102 - 29/07/2004 - fiz um decode na query para
//              andre tavares - pendência 17785 - 29/09/2004 - coloquei os left joins
//                                        verificar se o imposto retido foi estornado.
//              andre tavares  - pendência 18508 - 22/02/2004 fiz um decodede para zerar o valorbase do imposto estornado 

unit rRecEncargosPlanoxPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, TXRB;

type
  TRptRecEncargosPlanoxPatro = class(TFrmCmReport)
    PpRecEnc: TppBDEPipeline;
    DsRecEnc: TwwDataSource;
    RptRecEnc: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    RptRecEncLabel1: TppLabel;
    RptRecEncLabel2: TppLabel;
    RptRecEncLabel3: TppLabel;
    LblEncargo: TppLabel;
    LblPeriodo: TppLabel;
    LblData: TppLabel;
    RptRecEncLabel4: TppLabel;
    RptRecEncLabel5: TppLabel;
    RptRecEncLabel6: TppLabel;
    RptRecEncLabel7: TppLabel;
    RptRecEncLabel8: TppLabel;
    RptRecEncLabel9: TppLabel;
    RptRecEncLabel11: TppLabel;
    ppLabel49: TppLabel;
    ppDetailBand2: TppDetailBand;
    RptRecEncDBText1: TppDBText;
    RptRecEncDBText2: TppDBText;
    RptRecEncDBText3: TppDBText;
    RptRecEncDBText5: TppDBText;
    RptRecEncDBText6: TppDBText;
    RptRecEncDBText8: TppDBText;
    RptRecEncDBText7: TppDBText;
    ppDBText20: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine9: TppLine;
    ppLabel14: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    RptRecEncSummaryBand1: TppSummaryBand;
    RptRecEncLabel12: TppLabel;
    RptRecEncDBCalc1: TppDBCalc;
    SqlRecEnc: TCMSqlParams;
    CdsRecEnc: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine2: TppLine;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppShape2: TppShape;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    nomeEncargo : string;
  public
    { Public declarations }
  end;

var
  RptRecEncargosPlanoxPatro: TRptRecEncargosPlanoxPatro;

implementation

uses uSistema;

{$R *.DFM}

procedure TRptRecEncargosPlanoxPatro.CrmRptCMBeforePrint(Sender: TObject);
var
    sSQL               : String;
    sDataIni, sDataFim : String;
begin
   inherited;

   sDataIni := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)) + ',''dd/mm/yyyy'')';
   sDataFim := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)) + ',''dd/mm/yyyy'')';

   sSQL :=
   'SELECT ' +
   '   PT.NOME AS PATROCINADORA, '+
   '   PP.NOME AS PLANO, '+

   //Rodolpho da Silva - 17/11/2006
   '   DECODE(TRIM(CC.CODCENTROCUSTO),'''','''',TRIM(CC.CODEXTERNO)  || '' - '' || CC.NOME) AS CENTCUSTO, ' +
   '   DECODE(TRIM(CR.CODCENTRORESPON),'''','''',TRIM(CR.CODEXTERNO) || '' - '' || CR.NOME) AS CENTRORESP, ' +
   '   D.NUMAPGR, ' +
   '   TRD.DESCRICAO, ' +

   '   IR.CODTIPOCUSTAGREG, ' +
   '   T.DESCCUSTAGREG, ' +
   '   IR.DATARETENCAO, '     +
   '   NVL(DECODE(L.ESTORNO, NULL, DECODE(IR.FLGESTORNADO, ''S'', 0, ROUND(IR.VLRBASE, 2)), ROUND(IR.VLRBASE, 2),0), 0) AS VLRBASE, '+
   '   NVL(DECODE(L.ESTORNO, NULL, DECODE(IR.FLGESTORNADO, ''S'', 0, ROUND((IR.VLRRETIDO*SUM(R.VALOR))/IR.VLRBASE, 2)), ROUND((IR.VLRRETIDO*SUM(R.VALOR))/IR.VLRBASE, 2), 0), 0) AS VLRRETIDO, '+
   '   D.DATAPROGRAMADA, '+
   '   DECODE(D.COMPLDOCUMENTO,'''',TO_CHAR(D.NODOCUMENTO),TO_CHAR(D.NODOCUMENTO) || '' - '' || D.COMPLDOCUMENTO) AS NODOCUMENTO, ' +

   '   D.COMPLDOCUMENTO, '+
   '   D.IDFORCLI, '+
   '   P.RAZAOSOCIAL, '+
   '   P.NUMDOCUMENTO '+
   'FROM '+
   '   IMPOSTORETIDO IR, DOCUMENTO D, PESSOA P, TIPOAGRE T, '+
   '   LANCTODOCUM L, '+
   '   RATEIODOCUM R, '+
   '   PESSOA PT, '+
   '   PLANPREVCONTABIL PP, '+
   '   CENTCUST CC, ' +
   '   CENTRESPON CR, ' +
   '   TIPORECEBDESEMB TRD ' +


   'WHERE ';

   if  Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
     sSQL := sSQL +  '   (IR.CODTIPOCUSTAGREG IN ' + CmpRptCM.ParamValues[2].AsString + ') AND ';

   sSQL := sSQL +
   '   (IR.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) AND '+
   '   (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ';

   if CmpRptCM.ParamValues[0].AsDateTime <> 0 then
      sSQL := sSQL + '   (IR.DATARETENCAO >= ' + sDataIni + ') AND ';

   if CmpRptCM.ParamValues[1].AsDateTime <> 0 then
      sSQL := sSQL + '   (IR.DATARETENCAO <= ' + sDataFim + ') AND ';

   sSQL := sSQL +
   '   (IR.CODDOCUMENTO = D.CODDOCUMENTO) AND '+

   '   (D.IDFORCLI = P.IDPESSOA) '+
   ' AND L.CODDOCUMENTO(+) = IR.CODDOCUMENTO AND L.NUMLANCTO(+) = IR.NUMLANCTO '+
   ' AND R.CODDOCUMENTO = D.CODDOCUMENTO '+
   ' AND R.IDPLANOPREV  = PP.IDPLANOPREV '+
   ' AND R.IDPATRO      = PT.IDPESSOA ' +

   //Rodolpho da Silva - 17/11/2006
   ' AND (R.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) ' +
   ' AND (R.CODCENTRORESPON = CR.CODCENTRORESPON(+)) ' +
   ' AND (R.RECPAG          = TRD.RECPAG(+)) ' +
   ' AND (R.CODTIPRECDES    = TRD.CODTIPRECDES(+)) ';

   if Trim(CmpRptCM.ParamValues[4].AsString) <> '' Then
     sSql := sSql + ' AND R.IDPLANOPREV = '+ CmpRptCM.ParamValues[4].AsString;

   if Trim(CmpRptCM.ParamValues[5].AsString) <> '' Then
     sSql := sSql + ' AND R.IDPATRO = '+ CmpRptCM.ParamValues[5].AsString;

   sSql := sSql +
   ' GROUP BY '+
   '    PT.NOME, '+
   '    PP.NOME, '+

   //Rodolpho da Silva - 17/11/2006
   '    CC.CODCENTROCUSTO,CC.CODEXTERNO,CC.NOME, ' +
   '    CR.CODCENTRORESPON,CR.CODEXTERNO,CR.NOME, ' +
   '    D.NUMAPGR, ' +
   '    TRD.DESCRICAO, ' +

   '    R.CODDOCUMENTO, '+
   '    IR.CODTIPOCUSTAGREG, '+
   '    T.DESCCUSTAGREG, '+
   '    IR.DATARETENCAO, '+
   '    L.ESTORNO, '+
   '    IR.FLGESTORNADO, '+
   '    IR.VLRRETIDO, '+
   '    IR.VLRBASE, '+
   '    D.DATAPROGRAMADA, '+
   '    D.NODOCUMENTO, '+
   '    D.COMPLDOCUMENTO, '+
   '    D.IDFORCLI, '+
   '    P.RAZAOSOCIAL, '+
   '    P.NUMDOCUMENTO '+

   'ORDER BY '+
   '  IR.CODTIPOCUSTAGREG, ' +
   '  IR.DATARETENCAO, '+
   '  P.RAZAOSOCIAL, D.IDFORCLI';

   SqlRecEnc.Sql.Clear;
   SqlRecEnc.Sql.Text := sSQL;

   SqlRecEnc.Open;
   LblEncargo.Caption := nomeEncargo;
   LblPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[0].AsString + ' a ' + CmpRptCM.ParamValues[1].AsString;
   LblData.Caption := CmpRptCM.ParamValues[3].AsString;
end;




end.

