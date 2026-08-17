{******************************************************************************

                        Sistema - Contas a Receber

 ******************************************************************************

 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
 ------------------------------------------------------------------------------}     

unit rAdiantamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  uCtrlParamIntegra, CMProcuraSubTipo, TXRB;

type
  TRptAdiantamento = class(TFrmCmReport)
    PpAdianto: TppBDEPipeline;
    DsAdianto: TwwDataSource;
    RptAdianto: TppReport;
    ppHeaderBand24: TppHeaderBand;
    LblTiTAdianto: TppLabel;
    LblEmpresa: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppDetailBand25: TppDetailBand;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppFooterBand24: TppFooterBand;
    ppLine45: TppLine;
    ppLabel110: TppLabel;
    ppCalc43: TppSystemVariable;
    ppCalc44: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel111: TppLabel;
    ppLine47: TppLine;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabelCliFor: TppLabel;
    ppLine48: TppLine;
    ppDBText32: TppDBText;
    RptAdiantoLine1: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel113: TppLabel;
    ppLine49: TppLine;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    CdsAdianto: TCMClientDataSet;
    SqlAdianto: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptAdiantamento: TRptAdiantamento;

implementation

uses uSistema;

{$R *.DFM}

procedure TRptAdiantamento.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  If ParamIntegra.recpag = 'R' Then
  Begin
    CmpRptCM.ParamValues[0].Caption := 'Cliente';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcCliente;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End
  Else
  Begin
    CmpRptCM.ParamValues[0].Caption := 'Fornecedor';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcFornecedor;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End;

  CmpRptCM.ParamValues[1].LookupSettings.SQL.text :=
    ' SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG a ' +
    ' WHERE a.RECPAG =  ''' + ParamIntegra.RecPag + '''' +
    '   and not exists (select 1 from UsuarioxTpdocto b  ' +
    '   where b.idusuario= ' + inttostr(Sistema.IdUsuario) + ' and RECPAG =  '''
    + ParamIntegra.RecPag + ''')' +
    ' union SELECT CODTIPDOC,DESCRICAO                        ' +
    '    FROM TIPODOCRECPAG a                                 ' +
    '  WHERE a.RECPAG =  ''' + ParamIntegra.RecPag + '''  and  exists    ' +
    '  (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc ' +
    '  and b.idusuario= ' + inttostr(Sistema.IdUsuario) + ' and RECPAG =  ''' +
    ParamIntegra.RecPag + ''')' +
    '    ORDER BY DESCRICAO';
  CmpRptCM.ParamValues[2].TextDefault := datetostr(date);
end;

procedure TRptAdiantamento.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql, dtaux: string;
begin
  inherited;
  if not CmpRptCM.ParamValues[2].isnull then
    dtaux := CmpRptCM.ParamValues[2].value
  else
    dtaux := datetostr(date);

  IF ParamIntegra.RecPag = 'P' then
     ppLabelCliFor.Caption := 'Fornecedor'
  else
    ppLabelCliFor.Caption := 'Cliente';

  //  1323 - Adiantamento em aberto

//  sSql := 'SELECT /*+ RULE */ PFORCLI.IDPESSOA, PFORCLI.RAZAOSOCIAL, PFORCLI.RAZAOSOCIAL AS NOME, RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || ''-'' || COMPLDOCUMENTO AS NUMDOC, '    //Everson TIBERO
  sSql := 'SELECT PFORCLI.IDPESSOA, PFORCLI.RAZAOSOCIAL, PFORCLI.RAZAOSOCIAL AS NOME, RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || ''-'' || COMPLDOCUMENTO AS NUMDOC, '   //Everson TIBERO
    +
    'DOC.DATAEMISSAO, DOC.DATAVENCTO, DOC.DATAPROGRAMADA, LANC.DATALANCTO, DECODE(' + ''''
    + ParamIntegra.RecPag + ''', ' +
    '''R'', SUM(DECODE(LANC.DEBCRE, ' + '''C'', LANC.VALOR, LANC.VALOR*-1)), SUM(DECODE(LANC.DEBCRE, '
    + '''C'', ' +
    'LANC.VALOR*-1, LANC.VALOR))) AS VALOR, DECODE(' + '''' + ParamIntegra.RecPag
    + ''', ' + '''R'', SUM(DECODE(LANC.DEBCRE, ' +
    '''C'', LANC.VALOROUTRAMOEDA, LANC.VALOROUTRAMOEDA*-1)), SUM(DECODE(LANC.DEBCRE, ' + '''C'', LANC.VALOROUTRAMOEDA*-1, '
    +
    'LANC.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA, LANC.HISTORICOCOMPL, SUMALT.VALALT, S.VALRES AS VALLIQ ' +
    'FROM PESSOA PFORCLI, DOCUMENTO DOC, LANCTODOCUM LANC, ' +
    '(SELECT CODDOCUMENTO, DECODE(' + '''' + ParamIntegra.RecPag + ''', ' +
    '''R'', SUM(DECODE(DEBCRE, ' + '''C'', ' +
    'VALOR, VALOR*-1)), SUM(DECODE(DEBCRE, ' + '''C'', VALOR*-1, VALOR))) AS VALRES FROM LANCTODOCUM '
    +
    'WHERE (DATALANCTO <= TO_DATE(''' + dtaux +
    ''',''DD/MM/YYYY'')) AND (OPERACAO IN (''4 '',''15'',''16'')) ' +
    'GROUP BY CODDOCUMENTO) S, ' +
    '(SELECT CODDOCUMENTO, DECODE(' + '''' + ParamIntegra.RecPag + ''', ' +
    '''R'', SUM(DECODE(DEBCRE, ' +
    '''C'', VALOR, VALOR*-1)), SUM(DECODE(DEBCRE, ' + '''C'', VALOR*-1, VALOR))) AS VALALT '
    +
    'FROM LANCTODOCUM WHERE (OPERACAO = ''4 '') ' +
    ' AND (DATALANCTO <= TO_DATE(''' + dtaux + ''',''DD/MM/YYYY'')) ' +
    'GROUP BY CODDOCUMENTO ) SUMALT WHERE ' +
    '(LANC.OPERACAO = ''15'') AND (LANC.DATALANCTO <= TO_DATE(''' + dtaux +
    ''',''DD/MM/YYYY'')) AND ' +
    '(DOC.CODDOCUMENTO = S.CODDOCUMENTO) AND ' +
    '(DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') AND (DOC.IDPESSOA = ''' +
    IntToStr(sistema.idempresa) + ''') AND ' +
    '(DOC.CODDOCUMENTO = SUMALT.CODDOCUMENTO(+)) AND ';

  if CmpRptCM.ParamValues[0].AsInteger <> 0 then
    sSql := sSql + '(DOC.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[0].Asinteger) +  ') AND ';
  if not CmpRptCM.ParamValues[1].isnull then
    sSql := sSql + '(DOC.CODTIPDOC = ' + CmpRptCM.ParamValues[1].value +
      ') AND ';
  sSql := sSql +
    '(DOC.IDFORCLI = PFORCLI.IDPESSOA) AND (LANC.CODDOCUMENTO = DOC.CODDOCUMENTO) ' +
    'AND (ROUND(S.VALRES,2) <> 0) ' +
    'GROUP BY LANC.CODDOCUMENTO, LANC.NUMLANCTO, PFORCLI.IDPESSOA, PFORCLI.RAZAOSOCIAL, ' +
    ' DOC.NODOCUMENTO, COMPLDOCUMENTO, DOC.DATAEMISSAO, DOC.DATAVENCTO, DOC.DATAPROGRAMADA, ' +
    'LANC.DATALANCTO, LANC.DEBCRE, LANC.VALOR, LANC.VALOROUTRAMOEDA, SUMALT.VALALT ' +
    ', LANC.HISTORICOCOMPL, S.VALRES ' +
    'ORDER BY PFORCLI.RAZAOSOCIAL, PFORCLI.IDPESSOA, LANC.DATALANCTO ';

  LblTiTAdianto.Caption := 'ADIANTAMENTOS EM ABERTO ATÉ ' + dtaux;

  SqlAdianto.SQL.text := ssql;
  SqlAdianto.prepare;
  SqlAdianto.open;
end;

end.

