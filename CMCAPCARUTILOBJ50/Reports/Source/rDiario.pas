{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}

Unit rDiario;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppBands, ppClass,
  ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Db, DBTables,
  Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra;

Type
  TRptDiario = Class(TFrmCmReport)
    PpDiario: TppBDEPipeline;
    DsDiario: TwwDataSource;
    RptDiario: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel68: TppLabel;
    LblTituloDiario: TppLabel;
    lblPeriodoDiario: TppLabel;
    rpGustavoLabel1: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppReport1DBText7: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine32: TppLine;
    ppLabel70: TppLabel;
    ppCalc31: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppReport1DBCalc3: TppDBCalc;
    ppReport1DBCalc4: TppDBCalc;
    ppLabel71: TppLabel;
    RpDiarioLine1: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppReport1DBText4: TppDBText;
    ppLabel72: TppLabel;
    ppLabel74: TppLabel;
    ppReport1Label5: TppLabel;
    ppReport1Label6: TppLabel;
    ppLine33: TppLine;
    ppLabel75: TppLabel;
    ppReport1Label10: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppReport1DBCalc1: TppDBCalc;
    ppReport1DBCalc2: TppDBCalc;
    ppLabel76: TppLabel;
    RpDiarioLine2: TppLine;
    SqlDiario: TCMSqlParams;
    CdsDiario: TCMClientDataSet;
    Procedure FormCreate(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptDiario: TRptDiario;

Implementation

{$R *.DFM}

Procedure TRptDiario.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'P' Then
    lblTituloDiario.caption := 'Diário Auxiliar de Contas a Pagar'
  Else
    lblTituloDiario.caption := 'Diário Auxiliar de Contas a Receber';
End;

Procedure TRptDiario.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Var
  ssql: String;
Begin
  Inherited;
  CmpRptCM.ParamValues[0].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(date);
  ssql := '(SELECT CODTIPDOC,DESCRICAO,DEBCRE FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    FloatToStr(CrmRptCM.IdUsuario) + ') ' + ' union  SELECT CODTIPDOC,DESCRICAO,DEBCRE  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + FloatToStr(CrmRptCM.IdUsuario) + ')) ORDER BY DEBCRE,DESCRICAO';
  CmpRptCM.ParamValues[2].LookupSettings.SQL.text := ssql;
End;

Procedure TRptDiario.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
//  SqlDiario.sql.text := '  SELECT /*+ RULE */ DECODE(P.RAZAOSOCIAL,NULL,P.NOME,P.RAZAOSOCIAL) AS NOMEFORN, ' +   //Everson TIBERO
  SqlDiario.sql.text := '  SELECT DECODE(P.RAZAOSOCIAL,NULL,P.NOME,P.RAZAOSOCIAL) AS NOMEFORN, ' + //Everson TIBERO
    '         L.DATALANCTO, L.OPERACAO, ' +
    '         DECODE(L.HISTORICOCOMPL,NULL, ' +
    '         DECODE(RTRIM(L.OPERACAO),''17'',''Regularização de Adiantamento'', ' +
    '         DECODE(RTRIM(L.OPERACAO),''16'',''Regularização de Adiantamento'', ' +
    '         DECODE(RTRIM(L.OPERACAO),''15'',''Adiantamento'', ' +
    '         DECODE(RTRIM(L.OPERACAO),''4'',A.DESCRICAO, ' +
    '         DECODE(RTRIM(L.OPERACAO),''5'',''Baixa de Documento'',''Lançamento de documento''))))), ' +
    '         L.HISTORICOCOMPL) AS HISTORICO, ' +
    '         D.NODOCUMENTO, ' +
    '         DECODE(L.OPERACAO,''10'',L.VALOR,DECODE(L.DEBCRE,''D'',L.VALOR,NULL)) AS VALDEBITO, ' +
    '         DECODE(L.OPERACAO,''10'',L.VALOR,DECODE(L.DEBCRE,''C'',L.VALOR,NULL)) AS VALCREDITO ' +
    ' , P.RAZAOSOCIAL ' +
    '  FROM PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR A ' +
    '  WHERE ' +
    ' D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and b.idusuario=' + FloatToStr(CrmRptCM.IdUsuario) + ') ' +
    ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + FloatToStr(CrmRptCM.idusuario) + ')) and ' +
    '         L.DATALANCTO >= TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'') ' +
    '         AND L.DATALANCTO <= TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'') ' +
    '         AND  D.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) +
    '         AND  D.RECPAG = ''' + ParamIntegra.RecPag + '''';
  If Not CmpRptCM.ParamValues[2].IsNull Then
    SqlDiario.sql.text := SqlDiario.sql.text + '         AND  D.CODTIPDOC = ''' + CmpRptCM.ParamValues[2].AsString + '''';
  SqlDiario.sql.text := SqlDiario.sql.text + '         AND ((RTRIM(L.OPERACAO)=''1'') OR ' +
    '             (RTRIM(L.OPERACAO)=''2'') OR ' +
    '             (RTRIM(L.OPERACAO)=''4'') OR ' +
    '             (RTRIM(L.OPERACAO)=''15'') OR ' +
    '             (RTRIM(L.OPERACAO)=''16'') OR ' +
    '             (RTRIM(L.OPERACAO)=''17'') OR ' +
    '             (RTRIM(L.OPERACAO)=''5'') OR ' +
    '             (RTRIM(L.OPERACAO)=''10'')) ' +
    '         AND (D.IDFORCLI = P.IDPESSOA)  ' +
    '         AND (D.CODDOCUMENTO = L.CODDOCUMENTO) ' +
    '         AND (L.CODALTERADOR = A.CODALTERADOR(+)) ' +
    '  ORDER BY L.DATALANCTO,P.RAZAOSOCIAL ';
  SqlDiario.open;
  lblPeriodoDiario.caption := CmpRptCM.ParamValues[0].AsString + ' à ' + CmpRptCM.ParamValues[1].AsString;
End;

End.

