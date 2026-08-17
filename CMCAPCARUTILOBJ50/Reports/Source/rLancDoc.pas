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

Unit rLancDoc;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, uCmRptManager, TXComp, CmParamReport, uCtrlParamIntegra,
  uCmSqlParams, DBClient, uCMClientDataSet, CMProcuraSubTipo;

Type
  TRptLancDoc = Class(TFrmCmReport)
    DsLancDox: TwwDataSource;
    ppLancDoc: TppBDEPipeline;
    RptLancDoc: TppReport;
    ppHeaderBand8: TppHeaderBand;
    LblTiTLancDoc: TppLabel;
    ppLabel20: TppLabel;
    LblTipoDocLanc: TppLabel;
    LblFornCli: TppLabel;
    RptLancDocLabel3: TppLabel;
    RptLancDocLabel4: TppLabel;
    RptLancDocLabel5: TppLabel;
    RptLancDocLabel6: TppLabel;
    RptLancDocLabel7: TppLabel;
    RptLancDocLabel8: TppLabel;
    RptLancDocLabel2: TppLabel;
    RptLancDocLabel12: TppLabel;
    RptLancDocLabel9: TppLabel;
    ppDetailBand8: TppDetailBand;
    RptLancDocDBText2: TppDBText;
    RptLancDocDBText3: TppDBText;
    RptLancDocDBText4: TppDBText;
    RptLancDocDBText5: TppDBText;
    RptLancDocDBText6: TppDBText;
    RptLancDocDBText7: TppDBText;
    RptLancDocDBText8: TppDBText;
    RptLancDocDBText9: TppDBText;
    RptLancDocDBText10: TppDBText;
    RptLancDocDBText11: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine16: TppLine;
    ppLabel21: TppLabel;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    RptLancDocSummaryBand1: TppSummaryBand;
    RptLancDocDBCalc3: TppDBCalc;
    RptLancDocDBCalc4: TppDBCalc;
    RptLancDocLabel11: TppLabel;
    RptLancDocLine2: TppLine;
    RptLancDocDBCalc7: TppDBCalc;
    RptLancDocDBCalc8: TppDBCalc;
    RptLancDocGroup1: TppGroup;
    RptLancDocGroupHeaderBand1: TppGroupHeaderBand;
    RptLancDocDBText1: TppDBText;
    RptLancDocLabel1: TppLabel;
    ppLine15: TppLine;
    RptLancDocGroupFooterBand1: TppGroupFooterBand;
    RptLancDocDBCalc1: TppDBCalc;
    RptLancDocDBCalc2: TppDBCalc;
    RptLancDocLabel10: TppLabel;
    RptLancDocLine1: TppLine;
    RptLancDocDBCalc5: TppDBCalc;
    RptLancDocDBCalc6: TppDBCalc;
    CdsLancDoc: TCMClientDataSet;
    SqlLancDoc: TCMSqlParams;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    stiponome: String;
  public
    { Public declarations }
  End;

Var
  RptLancDoc: TRptLancDoc;

Implementation

{$R *.DFM}

Procedure TRptLancDoc.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql: String;
Begin
  Inherited;
//  sSql := 'SELECT  /*+ RULE */ PFORCLI.RAZAOSOCIAL, PFORCLI.RAZAOSOCIAL AS NOME,RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || ''-'' || COMPLDOCUMENTO AS NUMDOC, '  //Everson TIBERO
  sSql := 'SELECT PFORCLI.RAZAOSOCIAL, PFORCLI.RAZAOSOCIAL AS NOME,RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || ''-'' || COMPLDOCUMENTO AS NUMDOC, ' //Everson TIBERO
    +
    '   DOC.DATAEMISSAO, DOC.OBS, DOC.DATAVENCTO, DOC.DATAPROGRAMADA, LANC.DATALANCTO, ' +
    '   decode(rtrim(LANC.operacao), ''10'', LANC.valor, DECODE(''' +
    ParamIntegra.RecPag + ''', ' +
    '          ''P'', DECODE(LANC.DEBCRE, ''D'', LANC.VALOR*-1, LANC.VALOR), ' +
    '   DECODE(LANC.DEBCRE, ''D'', LANC.VALOR, LANC.VALOR*-1))) AS VALOR, ' +
    'decode' + '(' + 'rtrim(LANC.operacao), ' +
    '''10'', ' + 'LANC.VALOROUTRAMOEDA, ' +
    'DECODE' + '(' + '''' + ParamIntegra.RecPag + ''', ' +
    '''P'', ' + 'DECODE' + '(' +
    'LANC.DEBCRE, ' + '''D'', ' + 'LANC.VALOROUTRAMOEDA*-1, ' +
    'LANC.VALOROUTRAMOEDA' + '), ' +
    'DECODE' + '(' + 'LANC.DEBCRE, ' + '''D'', ' + 'LANC.VALOROUTRAMOEDA, ' +
    'LANC.VALOROUTRAMOEDA*-1' + ')' + ')' +
    ') AS VALOROUTRAMOEDA, ' + 'LANC.HISTORICOCOMPL, ' + 'SUMALT.VALALT, ' +
    'DECODE' + '(' + 'SUMALT.VALALT, ' + 'NULL, ' +
    'DECODE' + '(' + '''' + ParamIntegra.RecPag + ''', ' + '''P'', ' + 'DECODE'
    +
    '(' + 'LANC.DEBCRE, ' + '''D'', ' +
    'LANC.VALOR*-1, ' + 'LANC.VALOR' + '), ' +
    'DECODE' + '(' + 'LANC.DEBCRE, ' + '''D'', ' + 'LANC.VALOR, ' +
    'LANC.VALOR*-1' + ')' + '), ' +
    '(' + 'DECODE' + '(' + '''' + ParamIntegra.RecPag + ''', ' + '''P'', ' +
    'DECODE' + '(' + 'LANC.DEBCRE, ' + '''D'', ' + 'LANC.VALOR*-1, ' +
    'LANC.VALOR' + '), ' +
    'DECODE' + '(' + 'LANC.DEBCRE, ' + '''D'', ' + 'LANC.VALOR, ' +
    'LANC.VALOR*-1' + ')' + ') + SUMALT.VALALT' +
    ')' + ') AS VALLIQ ' +
    'FROM ' + 'PESSOA PFORCLI, ' + 'DOCUMENTO DOC, ' + 'LANCTODOCUM LANC, ' +
    '(' + 'SELECT ' + 'SUM' + '(' + 'DECODE' + '(' + '''' + ParamIntegra.RecPag
    +
    ''', ' + '''P'', ' +
    'DECODE' + '(' + 'DEBCRE, ' + '''D'', ' + 'VALOR*-1, ' + 'VALOR' + '), ' +
    'DECODE' +
    '(' + 'DEBCRE, ' + '''D'', ' + 'VALOR, ' + 'VALOR*-1' + ')' + ')' +
    ') AS VALALT, ' + 'CODDOCUMENTO ' +
    'FROM ' + 'LANCTODOCUM ' +
    'WHERE ' + 'CODALTERADOR IS NOT NULL ';
  If CmpRptCM.ParamValues[8].AsBoolean Then
    sSql := sSql + ' AND DATALANCTO BETWEEN TO_DATE(''' +
      CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'') ' +
      'AND TO_DATE(''' + CmpRptCM.ParamValues[4].AsString +
      ''',''DD/MM/YYYY'') ';
  sSql := sSql + 'GROUP BY CODDOCUMENTO) SUMALT WHERE ';
  sSql := sSql + 'Doc.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a ' +
    'WHERE a.RECPAG = ''' + ParamIntegra.RecPag + ''' and not exists (' +
    'select 1 from UsuarioxTpdocto b where recpag = ' + #39 + ParamIntegra.recpag
    + #39 + ' and ' +
    'b.idusuario = ' + FloatToStr(CrmRptCM.IdUsuario) + ') ' +
    'UNION ' +
    'SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = ''' +
    ParamIntegra.RecPag + ''' and ' +
    'exists (select 1 from UsuarioxTpdocto b where recpag = ' + #39 +
    ParamIntegra.recpag + #39 + ' and ' +
    'a.codtipdoc = b.codtipdoc and b.idusuario = ' +
    FloatToStr(CrmRptCM.idusuario) + ')) and ';

  If (Not CmpRptCM.ParamValues[3].IsNull) And (Not
    CmpRptCM.ParamValues[4].IsNull) Then
    sSql := sSql + '(LANC.DATALANCTO BETWEEN TO_DATE(''' +
      CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'') ' +
      'AND TO_DATE(''' + CmpRptCM.ParamValues[4].AsString +
      ''',''DD/MM/YYYY'')) AND ';

  If (Not CmpRptCM.ParamValues[5].IsNull) And (Not
    CmpRptCM.ParamValues[6].IsNull) Then
    sSql := sSql + '(' + 'DOC.DATAPROGRAMADA ' + 'BETWEEN ' + 'TO_DATE(''' +
      CmpRptCM.ParamValues[5].AsString + ''',''DD/MM/YYYY'') ' +
      'AND ' + 'TO_DATE(''' + CmpRptCM.ParamValues[6].AsString +
      ''',''DD/MM/YYYY'')' + ') AND ';

  sSql := sSql + '(' + '(rtrim(LANC.OPERACAO) IN (''2'',''3'',''10'')) OR ' + '('
    + '(rtrim(LANC.OPERACAO) = ''1'') AND ' +
    '(' + '(doc.numfatura is null) and ' + '(' + '(DOC.STATUS <> ''2'') OR ' +
    '(DOC.STATUS IS NULL)' + ')' + ')' + ')' +
    ') AND ' + '(DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') AND ' +
    '(DOC.IDPESSOA = ''' + FloatToStr(CrmRptCM.IdEmpresa) + ''') AND ' +
    '(DOC.CODDOCUMENTO = SUMALT.CODDOCUMENTO(+)) AND ' +
    '(LANC.ESTORNO IS NULL) AND ';

  If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
    sSql := sSql + '(DOC.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') AND ';

  If Not CmpRptCM.ParamValues[1].IsNull Then
    sSql := sSql + '(DOC.IDMODULO = ' + CmpRptCM.ParamValues[1].AsString + ') AND ';

  If Not CmpRptCM.ParamValues[2].IsNull Then
  Begin
    sSql := sSql + '(DOC.CODTIPDOC = ' + CmpRptCM.ParamValues[2].AsString + ') AND ';
    LblTipoDocLanc.Caption := 'TIPO DE DOCUMENTO LISTADO: ' + stiponome;
  End
  Else
    LblTipoDocLanc.Caption := '';

  sSql := sSql + '(DOC.IDFORCLI = PFORCLI.IDPESSOA) AND ' +
    '(LANC.CODDOCUMENTO = DOC.CODDOCUMENTO) ' +
    'ORDER BY ' + 'LANC.DATALANCTO, ';

  If StrToInt(CmpRptCM.ParamValues[7].AsString) = 0 Then
    sSql := sSql + 'PFORCLI.RAZAOSOCIAL, NUMDOC, '
  Else
    sSql := sSql + 'NUMDOC, PFORCLI.RAZAOSOCIAL, ';

  sSql := sSql + 'DOC.DATAVENCTO, ' + 'DOC.DATAPROGRAMADA, ' +
    'DOC.DATAEMISSAO ';

  LblTiTLancDoc.Caption := '';
  If (Not CmpRptCM.ParamValues[3].IsNull) And (Not
    CmpRptCM.ParamValues[4].IsNull) Then
    LblTiTLancDoc.Caption := 'Documentos Lançados entre: ' +
      CmpRptCM.ParamValues[3].AsString + ' e ' +
      CmpRptCM.ParamValues[4].AsString;

  If (Not CmpRptCM.ParamValues[5].IsNull) And (Not
    CmpRptCM.ParamValues[6].IsNull) Then
    LblTiTLancDoc.Caption := LblTiTLancDoc.Caption +
      '  Data Programada entre: ' + CmpRptCM.ParamValues[5].AsString + ' e ' +
      CmpRptCM.ParamValues[6].AsString;
  If ParamIntegra.RecPag = 'P' Then
    LblFornCli.Caption := 'Fornecedor'
  Else
    LblFornCli.Caption := 'Cliente';
  With SqlLancDoc Do
  Begin
    Sql.Text := sSql;
    Open;
  End;
End;

Procedure TRptLancDoc.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
  If ParamIntegra.recpag = 'R' Then
  Begin
    LblFornCli.Caption := 'Cliente';
    CmpRptCM.ParamValues[0].Caption := 'Cliente';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcCliente;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End
  Else
  Begin
    LblFornCli.Caption := 'Fornecedor';
    CmpRptCM.ParamValues[0].Caption := 'Fornecedor';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcFornecedor;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End;
  If ParamIntegra.RecPag = 'P' Then
    CmpRptCM.ParamValues[1].LookupSettings.SQL.text :=
      ' SELECT IDMODULO, NOMEMODULO FROM MODULO WHERE IDMODULO <> 4 ORDER BY NOMEMODULO'
  Else
    CmpRptCM.ParamValues[1].LookupSettings.SQL.text :=
      ' SELECT IDMODULO, NOMEMODULO FROM MODULO WHERE IDMODULO <> 3 ORDER BY NOMEMODULO';
  CmpRptCM.ParamValues[2].LookupSettings.SQL.text :=
    ' SELECT  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    FloatToStr(CrmRptCM.IdUsuario) + ') ' +
    ' union  SELECT  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
    FloatToStr(CrmRptCM.IdUsuario) + ') ORDER BY DEBCRE DESC,DESCRICAO';
  CmpRptCM.ParamValues[3].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[4].TextDefault := DateToStr(date);
End;

Procedure TRptLancDoc.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
Begin
  Inherited;
  Case index Of
    2: stiponome := TPainelControles(Sender).CtrlLookup.Text;
  End;
End;

End.

