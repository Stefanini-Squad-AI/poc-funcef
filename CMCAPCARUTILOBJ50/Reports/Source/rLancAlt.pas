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

Unit rLancAlt;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, uCmRptManager, TXComp, CmParamReport, uCtrlParamIntegra,
  uCmSqlParams, DBClient, uCMClientDataSet, CMProcuraSubTipo, TXRB;

Type
  TRptLancAlt = Class(TFrmCmReport)
    DsLancAlt: TwwDataSource;
    PplancAlt: TppBDEPipeline;
    RptLancAlt: TppReport;
    ppHeaderBand7: TppHeaderBand;
    LblTitAltLanc: TppLabel;
    ppLabel17: TppLabel;
    LblCliente: TppLabel;
    RptLancAltLabel3: TppLabel;
    RptLancAltLabel4: TppLabel;
    RptLancAltLabel5: TppLabel;
    RptLancAltLabel6: TppLabel;
    ppLine13: TppLine;
    ppDetailBand7: TppDetailBand;
    RptLancAltDBText2: TppDBText;
    RptLancAltDBText3: TppDBText;
    RptLancAltDBText4: TppDBText;
    RptLancAltDBText5: TppDBText;
    RptLancAltDBText6: TppDBText;
    RptLancAltDBText7: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppLabel18: TppLabel;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    RptLancAltSummaryBand1: TppSummaryBand;
    RptLancAltDBCalc2: TppDBCalc;
    RptLancAltLine2: TppLine;
    RptLancAltLabel7: TppLabel;
    RptLancAltGroup1: TppGroup;
    RptLancAltGroupHeaderBand1: TppGroupHeaderBand;
    RptLancAltLabel1: TppLabel;
    RptLancAltDBText1: TppDBText;
    RptLancAltGroupFooterBand1: TppGroupFooterBand;
    RptLancAltDBCalc1: TppDBCalc;
    RptLancAltLine1: TppLine;
    RptLancAltLabel2: TppLabel;
    CdsLancAlt: TCMClientDataSet;
    SqlLancAlt: TCMSqlParams;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    NOMEMODULO: TppField;
    NOMEUSUARIO: TppField;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptLancAlt: TRptLancAlt;

Implementation

{$R *.DFM}

Procedure TRptLancAlt.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql: String;
Begin
  Inherited;
  LblTitAltLanc.Caption := 'Alteradores Lançados de ' +
    CmpRptCM.ParamValues[1].AsString + ' a ' + CmpRptCM.ParamValues[2].AsString;
  sSql :=
//    'SELECT /*+ RULE */ PFORCLI.RAZAOSOCIAL AS FORNECEDOR,RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || ''/'' || DOC.COMPLDOCUMENTO AS NUMDOC,  LAN.DEBCRE,'+  //Everson TIBERO
    'SELECT PFORCLI.RAZAOSOCIAL AS FORNECEDOR,RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || ''/'' || DOC.COMPLDOCUMENTO AS NUMDOC,  LAN.DEBCRE,'+ //Everson TIBERO
    //CATIA P:21432 11/09/2006
    ' M.NOMEMODULO, U.NOMEUSUARIO,  ';
  If ParamIntegra.recpag = 'R' Then
    sSql := sSql +
      ' LAN.DATALANCTO, decode(LAN.DEBCRE,''D'',LAN.VALOR,LAN.VALOR*-1) as valor,  LAN.HISTORICOCOMPL,  ALT.DESCRICAO, '
  Else
    sSql := sSql +
      ' LAN.DATALANCTO, decode(LAN.DEBCRE,''C'',LAN.VALOR,LAN.VALOR*-1) as valor,  LAN.HISTORICOCOMPL,  ALT.DESCRICAO, ';
  sSql := sSql +
    ' ALT.ACRESDECRES, PFORCLI.RAZAOSOCIAL, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO  ' +
    'FROM PESSOA PFORCLI, DOCUMENTO DOC, MODULO M , USUARIOSISTEMA U, LANCTODOCUM LAN, TIPOALTERADOR ALT ' +
    'WHERE ' +
    ' (LAN.OPERACAO = ''4'') AND ' +
    ' (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ' +
    ' (ALT.RECPAG = ''' + ParamIntegra.RecPag + ''') AND ' +
    //CATIA P:21432 - 11/09/2006
    ' (DOC.IDMODULO = M.IDMODULO ) AND '+
    ' (DOC.IDUSUARIOINCLUSAO = U.IDUSUARIO ) AND '+
    ' (LAN.DATALANCTO BETWEEN TO_DATE(''' + CmpRptCM.ParamValues[1].AsString +
    ''',''DD/MM/YYYY'') AND TO_DATE(''' + CmpRptCM.ParamValues[2].AsString +
    ''',''DD/MM/YYYY'')) AND ';

  If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
    sSql := sSql + ' (DOC.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') AND ';

  Case StrToInt(CmpRptCM.ParamValues[3].AsString) Of
    1: sSql := sSql + ' (ALT.ACRESDECRES = ''D'') AND ';
    2: sSql := sSql + ' (ALT.ACRESDECRES = ''C'') AND ';
  End;

  If Not CmpRptCM.ParamValues[4].IsNull Then
    sSql := sSql + ' (ALT.CODALTERADOR = ' + CmpRptCM.ParamValues[4].AsString + ') AND ';

  sSql := sSql + ' (DOC.IDFORCLI = PFORCLI.IDPESSOA) AND ' +
    ' (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND ' +
    ' DOC.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    FloatToStr(CrmRptCM.IdUsuario) +
    ') ' + ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''
    + ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
    FloatToStr(CrmRptCM.idusuario) + ')) and ' +
    ' (LAN.CODALTERADOR = ALT.CODALTERADOR) ' +
    ' ORDER BY ' +
    ' LAN.DATALANCTO, ' +
    ' PFORCLI.RAZAOSOCIAL, ' +
    ' DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, ' +
    ' ALT.DESCRICAO ';

  With SqlLancAlt Do
  Begin
    Sql.text := sSql;
    Open;
  End;
End;

Procedure TRptLancAlt.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
   if ParamIntegra.recpag = 'R' then
  begin
     LblCliente.Caption := 'Cliente';
     CmpRptCM.ParamValues[0].Caption := 'Cliente';
     CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcCliente;
     CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end
  else
  begin
     LblCliente.Caption := 'Fornecedor';
     CmpRptCM.ParamValues[0].Caption := 'Fornecedor';
     CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcFornecedor;
     CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end;
  CmpRptCM.ParamValues[1].AsString := DateToStr(Date);
  CmpRptCM.ParamValues[2].AsString := DateToStr(Date);
  CmpRptCM.ParamValues[4].LookupSettings.SQL.text :=
    'SELECT CODALTERADOR, DESCRICAO FROM TIPOALTERADOR ' +
    'WHERE RECPAG = ''' + ParamIntegra.RecPag + ''' AND IDPESSOA = ' +
    FloatToStr(CrmRptCM.IdEmpresa);
  CmpRptCM.ParamValues[1].TextDefault := DatetoStr(date);
  CmpRptCM.ParamValues[2].TextDefault := DatetoStr(date);
End;

End.

