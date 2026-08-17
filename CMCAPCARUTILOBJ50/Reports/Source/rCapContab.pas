{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------
// andre tavares - pendência 17696 - 08/11/2004
// andre tavares - pendência 17687 - 15/09/2004 - os campos não aparecem para o usuário editar o relatório.}


unit rCapContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ppVar, ppBands, ppCtrls, ppMemo, ppStrtch,
  ppRegion, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCtrlParamIntegra, TXRB;

type
  TRptCapContab = class(TFrmCmReport)
    DsCapContab: TwwDataSource;
    ppCapContab: TppBDEPipeline;
    ppRCapContab: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppRCapContabRegion1: TppRegion;
    ppRCapContabMemo1: TppMemo;
    ppRCapContabRegion2: TppRegion;
    ppRCapContabLabel1: TppLabel;
    ppRCapContabLabel6: TppLabel;
    ppRCapContabLabel2: TppLabel;
    ppRCapContabLabel3: TppLabel;
    ppRCapContabLabel7: TppLabel;
    ppRCapContabLabel9: TppLabel;
    ppRCapContabLabel8: TppLabel;
    ppLine3: TppLine;
    ppDetailBand4: TppDetailBand;
    ppRCapContabDBText1: TppDBText;
    ppRCapContabDBText2: TppDBText;
    ppRCapContabDBText3: TppDBText;
    ppRCapContabDBText4: TppDBText;
    ppRCapContabDBText5: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine7: TppLine;
    ppLabel12: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    CdsCapContab: TCMClientDataSet;
    SqlCapContab: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCapContab: TRptCapContab;

implementation

uses ustring;

{$R *.DFM}

procedure TRptCapContab.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with SqlCapContab do
  begin
     sql.clear;
//     sql.text:= 'SELECT /*+ RULE */ U.DATAREF, '+   //Everson TIBERO
     sql.text:= 'SELECT U.DATAREF, '+ //Everson TIBERO
     '  SUM(U.TOTDEBCAP) AS TOTDEBCAP, '+
     '  SUM(U.TOTCRECAP) AS TOTCRECAP,'+
     '  SUM(U.TOTDEBCON) AS TOTDEBCON, '+
     '  SUM(U.TOTCRECON) AS TOTCRECON, '+
     // início - andre tavares - pendência 17696 - 08/11/2004
     '  SUM(U.TOTCRECON) - SUM(U.TOTCRECAP) AS DIFTOTCRED, '+
     '  SUM(U.TOTDEBCON) - SUM(U.TOTDEBCAP) AS DIFTOTDEBT  '+
     // fim - andre tavares - pendência 17696 - 08/11/2004
     ' FROM           '+
     ' (SELECT L.DATALANCTO AS DATAREF,  '+
     '      SUM(DECODE(L.DEBCRE,''D'',L.VALOR,0)) AS TOTDEBCAP,    '+
     '       SUM(DECODE(L.DEBCRE,''C'',L.VALOR,0)) AS TOTCRECAP, '+
     '       0 AS TOTDEBCON,     '+
     '       0 AS TOTCRECON   '+
     ' FROM DOCUMENTO D,      '+
     '     LANCTODOCUM L      '+
     ' WHERE ' ;
     If not CmpRptCM.ParamValues[2].IsNull Then
     begin
       sql.add('  (D.PLANO = :PLANO) AND  ');
       sql.add('   (D.PLACONTA = :PLACONTA) AND ');
     end;
     if not CmpRptCM.ParamValues[0].IsNull then
     begin
        sql.add('     (L.DATALANCTO >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) AND  ');
        sql.add('     (L.DATALANCTO <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) AND  ');
     end;
     Sql.add('      (L.CODDOCUMENTO = D.CODDOCUMENTO) AND  '+
        '      (L.OPERACAO IN (''1 '',''2 '',''4 '',''5 '',''17'')) AND   '+
        '      (D.IDPESSOA = '+Floattostr(CrmRptCM.IdEmpresa)+') AND   '+
        '      (D.RECPAG = '+#39+ParamIntegra.recpag+#39+') AND '+
        '      (L.PLNCODIGO IS NOT NULL)    '+
        ' GROUP BY L.DATALANCTO   '+
        ' UNION ALL            '+
        ' SELECT P.PLNDATDIA AS DATAREF,  '+
        '       0 AS TOTDEBCAP,    '+
        '       0 AS TOTCRECAP,   '+
        '       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS TOTDEBCON,  '+
        '       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS TOTCRECON  '+
        ' FROM PLANILHA P,      '+
        '     LANCAMENTO L  WHERE ');
     If not CmpRptCM.ParamValues[2].IsNull Then
     begin
        sql.add('  (L.PLANO = :PLANO) AND   ');
        Sql.add('  (L.PLACONTA = :PLACONTA) AND ');
     end;
     if not CmpRptCM.ParamValues[0].IsNull then
     begin
        sql.add('      (P.PLNDATDIA >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) AND   ');
        sql.add('      (P.PLNDATDIA <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) AND ');
     end;
     sql.add('      (P.IDPESSOA = '+Floattostr(CrmRptCM.IdEmpresa)+') AND       '+
             '      (P.PLNCODIGO = L.PLNCODIGO)  '+
        ' GROUP BY P.PLNDATDIA) U      '+
        ' GROUP BY U.DATAREF         '+
        ' HAVING  '+
        '    (ROUND(SUM(U.TOTDEBCAP),2) <> ROUND(SUM(U.TOTDEBCON),2)) OR    '+
        '    (ROUND(SUM(U.TOTCRECAP),2) <> ROUND(SUM(U.TOTCRECON),2))     '+
        ' ORDER BY U.DATAREF ')    ;
     ppRCapContabMemo1.lines.clear;

     SqlCapContab.Prepare;
     if ((not CmpRptCM.ParamValues[0].IsNull) and (not CmpRptCM.ParamValues[1].IsNull)) then
     begin
      ppRCapContabMemo1.lines.add('Lançamento : '+ CmpRptCM.ParamValues[0].AsString + ' '+ CmpRptCM.ParamValues[1].AsString);
      SqlCapContab.parambyname('DATAINI').asstring:= CmpRptCM.ParamValues[0].AsString;
      SqlCapContab.parambyname('DATAFIM').asstring:= CmpRptCM.ParamValues[1].AsString;
     end  ;
     If (not CmpRptCM.ParamValues[2].IsNull) then
     begin
       ppRCapContabMemo1.lines.add('Conta Contábil : '+CmpRptCM.ParamValues[2].AsString+' '+CmpRptCM.ParamValues[2].AsString) ;
       SqlCapContab.parambyname('plano').asinteger:=ParamIntegra.Plano;
       SqlCapContab.ParamByName('PLACONTA').AsString := Espaco(CmpRptCM.ParamValues[2].AsString,18);
     end;
     SqlCapContab.open;
  end;

end;

procedure TRptCapContab.FormCreate(Sender: TObject);
begin
  inherited;
  SqlCapContab.Open; // andre tavares - pendência 17687 - 15/09/2004
  if ParamIntegra.recpag='R' then
  begin
     ppRCapContabLabel6.caption := 'CAR';
     CmpRptCM.Caption := 'Valores Divergentes entre Car e Contabilidade' ;
  end;

end;

procedure TRptCapContab.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[2].ProcuraCCSettings.Mascara := ParamIntegra.MascaraCC;
  CmpRptCM.ParamValues[2].ProcuraCCSettings.Plano := ParamIntegra.plano;
end;

end.
