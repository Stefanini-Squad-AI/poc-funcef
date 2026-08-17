{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 13/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------
Rotina......: CmpRptCM.ParamValues[4]
Nº SOL......: 163982/7321
Nº KINTANA..: 1520392
Data........: 23/12/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Filtrar os "selects" Atividade/projeto para considerar
              apenas as ativas e analiticas
--------------------------------------------------------------------------------}

unit rRellccontab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, Wwdatsrc, DBTables, ppMemo, ppCtrls, ppReport,
  ppSubRpt, ppBands, ppVar, ppStrtch, ppPrnabl, ppClass, ppCache, ppProd,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  TXRB;

type
  TRptRellccontab = class(TFrmCmReport)
    bdeContab: TppBDEPipeline;
    ppContab: TppReport;
    ppHeaderBand9: TppHeaderBand;
    TituloContab: TppLabel;
    lbempresa: TppLabel;
    ppContabMemo1: TppMemo;
    ppDetailBand12: TppDetailBand;
    ppFooterBand8: TppFooterBand;
    ppLine21: TppLine;
    ppLabel29: TppLabel;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppContabSummaryBand1: TppSummaryBand;
    ppContab1: TppSubReport;
    ppContabChildReport1: TppChildReport;
    ppContabChildReport1HeaderBand1: TppHeaderBand;
    ppContabChildReport1Label1: TppLabel;
    ppContabChildReport1Label2: TppLabel;
    ppContabChildReport1Label3: TppLabel;
    ppContabChildReport1Label4: TppLabel;
    ppContabChildReport1Label5: TppLabel;
    ppContabChildReport1Label6: TppLabel;
    ppContabChildReport1Label7: TppLabel;
    ppContabChildReport1Label8: TppLabel;
    ppContabChildReport1Label9: TppLabel;
    ppContabChildReport1Label10: TppLabel;
    ppContabChildReport1Label11: TppLabel;
    ppContabChildReport1DetailBand1: TppDetailBand;
    ppContabChildReport1DBText1: TppDBText;
    ppContabChildReport1DBText2: TppDBText;
    ppContabChildReport1DBText3: TppDBText;
    ppContabChildReport1DBText4: TppDBText;
    ppContabChildReport1DBText5: TppDBText;
    ppContabChildReport1DBText6: TppDBText;
    ppContabChildReport1DBText7: TppDBText;
    ppContabChildReport1DBText9: TppDBText;
    ppContabChildReport1DBText10: TppDBText;
    ppContabChildReport1DBText11: TppDBText;
    ppContabChildReport1DBMemo1: TppDBMemo;
    ppContab2: TppSubReport;
    ppContabChildReport2: TppChildReport;
    ppContabChildReport2HeaderBand1: TppHeaderBand;
    ppContabChildReport2Label1: TppLabel;
    ppContabChildReport2Label2: TppLabel;
    ppContabChildReport2Label3: TppLabel;
    ppContabChildReport2Label4: TppLabel;
    ppContabChildReport2Label5: TppLabel;
    ppContabChildReport2Label6: TppLabel;
    ppContabChildReport2Label7: TppLabel;
    ppContabChildReport2Label8: TppLabel;
    ppContabChildReport2Label9: TppLabel;
    ppContabChildReport2Label10: TppLabel;
    ppContabChildReport2Label11: TppLabel;
    ppContabChildReport2DetailBand1: TppDetailBand;
    ppContabChildReport2DBText1: TppDBText;
    ppContabChildReport2DBText2: TppDBText;
    ppContabChildReport2DBText3: TppDBText;
    ppContabChildReport2DBText4: TppDBText;
    ppContabChildReport2DBText5: TppDBText;
    ppContabChildReport2DBText6: TppDBText;
    ppContabChildReport2DBText7: TppDBText;
    ppContabChildReport2DBText9: TppDBText;
    ppContabChildReport2DBText10: TppDBText;
    ppContabChildReport2DBText11: TppDBText;
    ppContabChildReport2DBMemo1: TppDBMemo;
    ppContabBAIXA3: TppSubReport;
    ppContabChildReport3: TppChildReport;
    ppContabChildReport3HeaderBand1: TppHeaderBand;
    ppContabChildReport3Label1: TppLabel;
    ppContabChildReport3Label2: TppLabel;
    ppContabChildReport3Label3: TppLabel;
    ppContabChildReport3Label4: TppLabel;
    ppContabChildReport3Label5: TppLabel;
    ppContabChildReport3Label7: TppLabel;
    ppContabChildReport3Label6: TppLabel;
    ppContabChildReport3Label8: TppLabel;
    ppContabChildReport3Label9: TppLabel;
    ppContabChildReport3Label10: TppLabel;
    ppContabChildReport3Label11: TppLabel;
    ppContabChildReport3DetailBand1: TppDetailBand;
    ppContabChildReport3DBText1: TppDBText;
    ppContabChildReport3DBText2: TppDBText;
    ppContabChildReport3DBText3: TppDBText;
    ppContabChildReport3DBText4: TppDBText;
    ppContabChildReport3DBText5: TppDBText;
    ppContabChildReport3DBText6: TppDBText;
    ppContabChildReport3DBText7: TppDBText;
    ppContabChildReport3DBText9: TppDBText;
    ppContabChildReport3DBText10: TppDBText;
    ppContabChildReport3DBText11: TppDBText;
    ppContabChildReport3DBMemo1: TppDBMemo;
    dscontab: TwwDataSource;
    SqlContab: TCMSqlParams;
    CdsContab: TCMClientDataSet;
    CdsContabBaixado: TCMClientDataSet;
    SqlContabBaixado: TCMSqlParams;
    CdsContaParc: TCMClientDataSet;
    SqlContaParc: TCMSqlParams;
    BDECONTABBAIXA: TppBDEPipeline;
    BDECONTABPARC: TppBDEPipeline;
    dsContaParc: TwwDataSource;
    dsContabBaixado: TwwDataSource;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    ScontaNome, sCentrocustonome, SUniNegNome, SSubContaNome: string;
    procedure carregaparametros;
    procedure setaparametros(texto: string);
  public
    { Public declarations }
  end;

var
  RptRellccontab: TRptRellccontab;

implementation

{$R *.DFM}

procedure TRptRellccontab.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  carregaparametros;
  if ParamIntegra.RecPag = 'P' then
    titulocontab.caption :=
      'Listagem dos Lançamentos Contábeis (Contas a Pagar) '
  else
    titulocontab.caption :=
      'Listagem dos Lançamentos Contábeis (Contas a Receber) ';
  ;
  SqlContab.SQL.clear;
//  SqlContab.SQL.add('SELECT /*+ RULE */ ');  //Everson TIBERO
  SqlContab.SQL.add('SELECT ');  //Everson TIBERO
  SqlContab.SQL.add('DOC.OPERACAO, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,p.plndatdia as data,');
  SqlContab.SQL.add('CC.CODCENTROCUSTO,AP.UNIDNEGOC, SC.CODSUBCONTA,');
  SqlContab.SQL.add('CC.NOME AS NOMECC,AP.NOME AS NOME, SC.NOMESUBCONTA,');
  SqlContab.SQL.add('LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC.LACHIST5 AS HISTLANCAMENTOCONTABIL,');
  SqlContab.SQL.add('P.PLNPLANIL, PC.PLANOME, PC.PLAREDUZ ,LC.PLNCODIGO ,LC.lacnumlan, p.plndatdia');
  SqlContab.SQL.add('FROM');
  SqlContab.SQL.add('  DOCUMENTO DOC,');
  SqlContab.SQL.add('  LANCTODOCUM LAN,');
  SqlContab.SQL.add('  LANCAMENTO LC,');
  SqlContab.SQL.add('  SUBCONTA SC,');
  SqlContab.SQL.add('  CENTCUST CC,');
  SqlContab.SQL.add('  UNIDNEGOCIO AP, ');
  SqlContab.SQL.add('  PLANILHA P,');
  SqlContab.SQL.add('  PLANOCONTA PC ');
  SqlContab.SQL.add(' WHERE');
  SqlContab.SQL.add(' (doc.recpag= ' + #39 + ParamIntegra.RecPag + #39 + ' )');
  SqlContab.SQL.add(' and (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) +
    ')');
  SqlContab.SQL.add(' and (DOC.IDPESSOA = LC.IDPESSOA' + ')');
  if not CmpRptCM.ParamValues[2].IsNull then
  begin
    SqlContab.SQL.add('  AND (LC.PLANO=' + InttoStr(ParamIntegra.plano) +
      ')  ');
    SqlContab.SQL.add('  AND (rtrim(LC.PLACONTA)=' + #39 +
      TRIM(CmpRptCM.ParamValues[2].AsString) + #39 + ')');
  end;
  if not CmpRptCM.ParamValues[0].IsNull then
    SqlContab.SQL.add(' and  (p.plndatdia >= TO_DATE(''' +
      CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) ');

  if not CmpRptCM.ParamValues[1].IsNull then
    SqlContab.SQL.add(' and  (p.plndatdia <= TO_DATE(''' +
      CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) ');
  if not CmpRptCM.ParamValues[3].IsNull then
  begin
    SqlContab.SQL.add(' and (rtrim(LC.CODCENTROCUSTO) = ' + #39 +
      trim(CmpRptCM.ParamValues[3].AsString) + #39 + ')');
    SqlContab.SQL.add(' AND  (CC.CODCENTROCUSTO = LC.CODCENTROCUSTO) ');
    SqlContab.SQL.add(' AND  (CC.IDEMPRESA = LC.IDPESSOA)            ');
  end
  else
  begin
    SqlContab.SQL.add(' AND  (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) ');
    SqlContab.SQL.add(' AND  (CC.IDEMPRESA(+) = LC.IDPESSOA)           ');
  end;
  if not CmpRptCM.ParamValues[4].IsNull then
  begin
    SqlContab.SQL.add(' and (LC.UNIDNEGOC=' + CmpRptCM.ParamValues[4].AsString +
      ')');
    SqlContab.SQL.add(' AND  (AP.UNIDNEGOC   = LC.UNIDNEGOC)         ');
    SqlContab.SQL.add(' AND  (AP.IDPESSOA    = LC.IDPESSOA)          ');
  end
  else
  begin
    SqlContab.SQL.add(' AND  (AP.UNIDNEGOC(+)   = LC.UNIDNEGOC)         ');
    SqlContab.SQL.add(' AND  (AP.IDPESSOA(+)    = LC.IDPESSOA)          ');
  end;
  if not CmpRptCM.ParamValues[5].IsNull then
  begin
    SqlContab.SQL.add(' and (LC.CODSUBCONTA=' + CmpRptCM.ParamValues[5].AsString
      + ')');
    SqlContab.SQL.add(' AND  (SC.CODSUBCONTA = LC.CODSUBCONTA)       ');
    SqlContab.SQL.add(' AND  (SC.IDPESSOA    = LC.IDPESSOA)          ');
  end
  else
  begin
    SqlContab.SQL.add(' AND  (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       ');
    SqlContab.SQL.add(' AND  (SC.IDPESSOA(+)    = LC.IDPESSOA)          ');
  end;
  SqlContab.SQL.add(' and  doc.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag +
      ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    FloatToStr(CrmRptCM.IdUsuario) +
      ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag +
      '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and b.idusuario='
      +
    FloatToStr(CrmRptCM.idusuario) + '))   ');
  SqlContab.SQL.add('  AND (LAN.CODDOCUMENTO  = DOC.CODDOCUMENTO)     AND');
  SqlContab.SQL.add('  (PC.PLANO = LC.PLANO)                      AND');
  SqlContab.SQL.add('  (PC.PLACONTA = LC.PLACONTA)                AND');
  SqlContab.SQL.add('  (LAN.PLNCODIGO     = LC.PLNCODIGO)         AND');
  SqlContab.SQL.add('  (LC.PLNCODIGO      = P.PLNCODIGO)          AND');
  SqlContab.SQL.add('  (rtrim(LAN.OPERACAO) <> ''5'')             AND ');
  SqlContab.SQL.add('  ((LAN.OPERACAO) <> ''15'')            AND');
  SqlContab.SQL.add('  (rtrim(LAN.OPERACAO) <> ''3'')             AND');
  SqlContab.SQL.add('  ((LAN.OPERACAO) <> ''13'')');
  SqlContab.SQL.add('ORDER BY p.plndatdia,LC.PLNCODIGO ,LC.lacnumlan,LC.LACDEBCRE DESC');
  SqlContab.prepare;
  SqlContab.OPEN;

  with SqlContaParc do
  begin
    SQL.clear;
//    SQL.add(' SELECT /*+ RULE */ DISTINCT ');  //Everson TIBERO
    SQL.add(' SELECT DISTINCT ');  //Everson TIBERO
    SQL.add('       Q2.LACDEBCRE, Q2.PLACONTA,  ((Q1.VALOR * Q2.LACVALOR)/ Q3.VALOR) AS VALOR,');
    SQL.add('       Q2.NOMECC, Q2.NOMEAP, Q2.NOMESUBCONTA,');
    SQL.add('Q2.CODCENTROCUSTO, Q2.UNIDNEGOC, Q2.CODSUBCONTA,');
    SQL.add('       Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL, ');
    SQL.add('       Q2.PLNPLANIL, Q2.PLANOME, Q2.PLAREDUZ ,Q2.PLNCODIGO ,Q2.lacnumlan,data ');
    SQL.add('FROM');
    SQL.add('   (SELECT ');
    SQL.add('       LAN.VALOR, DOC.NUMFATURA, ''LANÇAMENTO DO DOCUMENTO '' || DOC.NODOCUMENTO || ''/'' || DOC.COMPLDOCUMENTO || P.RAZAOSOCIAL AS HISTORICOCOMPL');
    SQL.add('    FROM ');
    SQL.add('       PESSOA P, ');
    SQL.add('       DOCUMENTO DOC, ');
    SQL.add('       LANCTODOCUM LAN ');
    SQL.add('    WHERE    ');
    SQL.add('      ((rtrim(LAN.OPERACAO) = ''3'') OR ((LAN.OPERACAO) = ''13'')) AND ');
    SQL.add('      (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) +
      ') AND ');
    SQL.add('      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND  ');
    SQL.add('      (DOC.IDFORCLI = P.IDPESSOA) AND ');
    SQL.add('      (DOC.RECPAG    = ' + #39 + ParamIntegra.RecPag + #39 +
      ' ) ) Q1,');
    SQL.add('   (SELECT ');
    SQL.add('       DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR, LAN.VALOR,');
    SQL.add('       CC.CODCENTROCUSTO, AP.UNIDNEGOC, SC.CODSUBCONTA,');
    SQL.add('       CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA,');
    SQL.add('       LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC.LACHIST5 AS HISTLANCAMENTOCONTABIL,');
    SQL.add('       P.PLNPLANIL, PC.PLANOME, PC.PLAREDUZ  , p.plndatdia as data,LC.PLNCODIGO ,LC.lacnumlan');
    SQL.add('    FROM ');
    SQL.add('       DOCUMENTO DOC, ');
    SQL.add('       LANCTODOCUM LAN,');
    SQL.add('       LANCAMENTO LC,');
    SQL.add('       SUBCONTA SC,');
    SQL.add('       UNIDNEGOCIO AP, ');
    SQL.add('       CENTCUST CC, ');
    SQL.add('       PLANILHA P, ');
    SQL.add('       PLANOCONTA PC ');
    SQL.add('    WHERE  ');
    SQL.add('       ((RTRIM(LAN.OPERACAO) = ''1'') OR (LAN.OPERACAO = ''11'')) AND ');
    SQL.add('  (doc.recpag= ' + #39 + ParamIntegra.RecPag + #39 + ' )');
    SQL.add('  AND (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ')  ');
    SQL.add('  and (DOC.IDPESSOA = LC.IDPESSOA' + ')');

    if not CmpRptCM.ParamValues[2].IsNull then
    begin
      SQL.add('  AND (LC.PLANO=' + InttoStr(ParamIntegra.plano) + ')  ');
      SQL.add('  AND (rtrim(LC.PLACONTA)=' + #39 +
        TRIM(CmpRptCM.ParamValues[2].AsString) + #39 + ')');
    end;

    if not CmpRptCM.ParamValues[0].IsNull then
      SQL.add(' and  (p.plndatdia >= TO_DATE(''' +
        CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) ');

    if not CmpRptCM.ParamValues[1].IsNull then
      SQL.add(' and  (p.plndatdia <= TO_DATE(''' +
        CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) ');

    if not CmpRptCM.ParamValues[3].IsNull then
    begin
      SQL.add(' and (rtrim(LC.CODCENTROCUSTO) = ' + #39 +
        trim(CmpRptCM.ParamValues[3].AsString) + #39 + ')');
      SQL.add(' AND   (CC.CODCENTROCUSTO = LC.CODCENTROCUSTO) ');
      SQL.add(' AND  (CC.IDEMPRESA = LC.IDPESSOA)           ');
    end
    else
    begin
      SQL.add(' AND   (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) ');
      SQL.add(' AND  (CC.IDEMPRESA(+) = LC.IDPESSOA)           ');
    end;
    if not CmpRptCM.ParamValues[4].IsNull then
    begin
      SQL.add(' and (LC.UNIDNEGOC=' + CmpRptCM.ParamValues[4].AsString + ')');
      SQL.add(' AND  (AP.UNIDNEGOC   = LC.UNIDNEGOC)        ');
      SQL.add(' AND  (AP.IDPESSOA    = LC.IDPESSOA)     ');
    end
    else
    begin
      SQL.add(' AND  (AP.UNIDNEGOC(+)   = LC.UNIDNEGOC)        ');
      SQL.add(' AND  (AP.IDPESSOA(+)    = LC.IDPESSOA)     ');
    end;
    ;
    if not CmpRptCM.ParamValues[5].IsNull then
    begin
      SQL.add(' and (LC.CODSUBCONTA=' + CmpRptCM.ParamValues[5].AsString + ')');
      SQL.add(' AND  (SC.CODSUBCONTA = LC.CODSUBCONTA)      ');
      SQL.add(' AND  (SC.IDPESSOA    = LC.IDPESSOA)         ');
    end
    else
    begin
      SQL.add(' AND  (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)      ');
      SQL.add(' AND  (SC.IDPESSOA(+)    = LC.IDPESSOA)         ');
    end;
    SQL.add('   AND (DOC.NUMFATURA IS NOT NULL)                AND ');
    SQL.add('       (PC.PLANO = LC.PLANO)                      AND ');
    SQL.add('       (PC.PLACONTA = LC.PLACONTA)                AND ');
    SQL.add('       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)      AND  ');
    SQL.add('       (LC.PLNCODIGO = P.PLNCODIGO)               AND ');
    SQL.add('       (LAN.PLNCODIGO = LC.PLNCODIGO)) Q2,  ');
    SQL.add('      (SELECT D.NUMFATURA, SUM(L.VALOR) AS VALOR FROM DOCUMENTO D, LANCTODOCUM L ');
    SQL.add('       WHERE ((rtrim(L.OPERACAO) = ''1'') OR (L.OPERACAO = ''11'')) AND  ');
    SQL.add('             (D.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) +
      ')     AND ');
    SQL.add('             (D.CODDOCUMENTO = L.CODDOCUMENTO) AND  ');
    SQL.add('             (D.OPERACAO = L.OPERACAO) AND   ');
    SQL.add('             (D.NUMFATURA IS NOT NULL) AND ');
    SQL.add('             (D.RECPAG  = ' + #39 + ParamIntegra.RecPag + #39 +
      ' )');
    SQL.add('             GROUP BY D.NUMFATURA) Q3 ');
    SQL.add('WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFATURA)   ');
    SQL.add('ORDER BY ');
    SQL.add('data,Q2.PLNCODIGO ,Q2.lacnumlan,Q2.LACDEBCRE DESC  ');
    OPEN;
  end;
  with SqlContabBaixado do
  begin
    SQL.clear;
//    SQL.add('SELECT /*+ RULE */  CODDOCUMENTO,');  //Everson TIBERO
    SQL.add('SELECT CODDOCUMENTO,');  //Everson TIBERO
    SQL.add('    CONTACONTABIL, ');
    SQL.add('CODCENTROCUSTO, UNIDNEGOC, CODSUBCONTA,');
    SQL.add('    NOMECC, ');
    SQL.add('    NOMESUBCONTA,  ');
    SQL.add('    NOMEAP, ');
    SQL.add('    HISTORICO,');
    SQL.add('    DEBCRE, ');
    SQL.add('    VALOR, ');
    SQL.add('    PLNPLANIL,');
    SQL.add('    PLANOME,  ');
    SQL.add('    PLAREDUZ  , PLNCODIGO , data  ');
    SQL.add('FROM    ');
    SQL.add('   (SELECT  D.CODDOCUMENTO,');
    SQL.add('       PC.PLACONTA AS CONTACONTABIL, ');
    SQL.add('       CC.CODCENTROCUSTO, AP.UNIDNEGOC, SC.CODSUBCONTA,');
    SQL.add('       CC.NOME AS NOMECC,');
    SQL.add('       SC.NOMESUBCONTA AS NOMESUBCONTA, ');
    SQL.add('       AP.NOME AS NOMEAP,  ');
    SQL.add('       (''BAIXA DOC Nº '' || D.NODOCUMENTO || '' '' || D.COMPLDOCUMENTO) AS HISTORICO, ');
    SQL.add('       DECODE(L.DEBCRE,''D'',''C'',''D'') AS DEBCRE,');
    SQL.add('       L.VALOR, ');
    SQL.add('       PL.PLNPLANIL, ');
    SQL.add('       PCONTA.PLANOME, PCONTA.PLAREDUZ   ,pl.PLNCODIGO , pl.plndatdia as data  ');
    SQL.add('    FROM   ');
    SQL.add('       DOCUMENTO D,  ');
    SQL.add('       LANCTODOCUM L,  ');
    SQL.add('       RECBTOPAGTO R,  ');
    SQL.add('       PORTADORFORMA P, ');
    SQL.add('       PORTADORCONTA PC, ');
    SQL.add('       SUBCONTA SC,');
    SQL.add('       UNIDNEGOCIO AP, ');
    SQL.add('       PLANOCONTA  PCONTA,  ');
    SQL.add('       PLANILHA PL,  ');
    SQL.add('       CENTCUST CC, ');
    SQL.add('      (SELECT       ');
    SQL.add('           VALOR,CODDOCUMENTO, DATALANCTO       ');
    SQL.add('       FROM     ');
    SQL.add('          LANCTODOCUM ');
    SQL.add('       WHERE rtrim(OPERACAO) IN (''1'',''2'',''3'',''15'')) LANC ');
    SQL.add('    WHERE ');
    SQL.add('       ((D.OPERACAO = ''15'') OR (D.STATUS = ''2'') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))) AND ');
    SQL.add('       (D.RECPAG  = ' + #39 + ParamIntegra.RecPag + #39 +
      ' ) AND ');
    SQL.add('       (D.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) +
      ') and    ');
    SQL.add('       (D.IDPESSOA = PC.IDPESSOA )');

    if not CmpRptCM.ParamValues[2].IsNull then
    begin
      SQL.add('  AND (PC.PLANO=' + InttoStr(ParamIntegra.plano) + ')  ');
      SQL.add('  AND (rtrim(PC.PLACONTA)=' + #39 +
        TRIM(CmpRptCM.ParamValues[2].AsString) + #39 + ')');
    end;
    if not CmpRptCM.ParamValues[0].IsNull then
      SQL.add(' and  (pL.plndatdia >= TO_DATE(''' +
        CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) ');
    if not CmpRptCM.ParamValues[1].IsNull then
      SQL.add(' and  (pL.plndatdia <= TO_DATE(''' +
        CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) ');
    if not CmpRptCM.ParamValues[2].IsNull then
    begin
      SQL.add(' and (rtrim(PC.CODCENTROCUSTO) = ' + #39 +
        trim(CmpRptCM.ParamValues[3].AsString) + #39 + ')');
      SQL.add('   AND    (CC.CODCENTROCUSTO = PC.CODCENTROCUSTO)   ');
      SQL.add('   AND    (CC.IDEMPRESA = PC.IDPESSOA)        ');
    end
    else
    begin
      SQL.add('   AND    (CC.CODCENTROCUSTO(+) = PC.CODCENTROCUSTO)   ');
      SQL.add('   AND    (CC.IDEMPRESA(+) = PC.IDPESSOA)        ');
    end;
    if not CmpRptCM.ParamValues[4].IsNull then
    begin
      SQL.add(' and (PC.UNIDNEGOC=' + CmpRptCM.ParamValues[4].AsString + ')');
      SQL.add('   AND    (AP.UNIDNEGOC = PC.UNIDNEGOC)            ');
      SQL.add('   AND    (AP.IDPESSOA = PC.IDPESSOA)              ');
    end
    else
    begin
      SQL.add('   AND    (AP.UNIDNEGOC(+) = PC.UNIDNEGOC)            ');
      SQL.add('   AND    (AP.IDPESSOA(+) = PC.IDPESSOA)              ');
    end;
    if not CmpRptCM.ParamValues[5].IsNull then
    begin
      SQL.add(' and (PC.CODSUBCONTA=' + CmpRptCM.ParamValues[5].AsString + ')');
      SQL.add('   AND    (SC.CODSUBCONTA = PC.CODSUBCONTA)         ');
      SQL.add('   AND    (SC.IDPESSOA = PC.IDPESSOA)                ');
    end
    else
    begin
      SQL.add('   AND    (SC.CODSUBCONTA(+) = PC.CODSUBCONTA)         ');
      SQL.add('   AND    (SC.IDPESSOA(+) = PC.IDPESSOA)                ');
    end;
    SQL.add('       AND  (PCONTA.PLANO(+) = PC.PLANO)               AND ');
    SQL.add('       (PCONTA.PLACONTA(+) = PC.PLACONTA)         AND ');
    SQL.add('       (D.CODDOCUMENTO = LANC.CODDOCUMENTO)       AND ');
    SQL.add('       (D.CODDOCUMENTO = L.CODDOCUMENTO)          AND ');
    SQL.add('       (R.NUMLANCTO = L.NUMLANCTO)                AND ');
    SQL.add('       (R.CODDOCUMENTO = L.CODDOCUMENTO)          AND ');
    SQL.add('       (R.CODPORTFORMA = P.CODPORTFORMA)          AND ');
    SQL.add('       (P.CODPORTADOR = PC.CODPORTADOR)           AND ');
    SQL.add('       (PL.PLNCODIGO = L.PLNCODIGO)               ');
    SQL.add('UNION    ');
    SQL.add('    SELECT  D.CODDOCUMENTO,');
    if ParamIntegra.RecPag = 'P' then
      SQL.add('       DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTACONTABIL, ')
    else
      SQL.add('       DECODE(D.PLACONTA,NULL,E.CONTACCLIENTE,D.PLACONTA) AS CONTACONTABIL, ');
    SQL.add('CC.CODCENTROCUSTO, AP.UNIDNEGOC, SC.CODSUBCONTA,');
    SQL.add('       CC.NOME AS NOMECC,  ');
    SQL.add('       SC.NOMESUBCONTA, ');
    SQL.add('       AP.NOME AS NOMEAP,  ');
    SQL.add('       (''BAIXA DOC Nº '' || D.NODOCUMENTO || '' '' || D.COMPLDOCUMENTO) AS HISTORICO, ');
    SQL.add('       L.DEBCRE, ');
    SQL.add('       L.VALOR,  ');
    SQL.add('       PL.PLNPLANIL, ');
    SQL.add('       PCONTA.PLANOME, PCONTA.PLAREDUZ   ,pl.PLNCODIGO   , pl.plndatdia as data   ');
    SQL.add('    FROM    ');
    if ParamIntegra.RecPag = 'P' then
      SQL.add('       EMPRESAFORN E,  ')
    else
      SQL.add('       EMPRESACLIENTE E,  ');
    SQL.add('       DOCUMENTO D,  ');
    SQL.add('       LANCTODOCUM L, ');
    SQL.add('       RECBTOPAGTO R, ');
    SQL.add('       PLANOCONTA  PCONTA,   ');
    SQL.add('       PLANILHA PL,  ');
    SQL.add('       UNIDNEGOCIO AP, ');
    SQL.add('       SUBCONTA SC, ');
    SQL.add('       CENTCUST CC, ');
    SQL.add('       (SELECT   ');
    SQL.add('           VALOR,CODDOCUMENTO, DATALANCTO   ');
    SQL.add('        FROM      ');
    SQL.add('           LANCTODOCUM  ');
    SQL.add('        WHERE rtrim(OPERACAO) IN (''1'',''2'',''3'',''15'')) LANC ');
    SQL.add('    WHERE   ');
    SQL.add('       ((D.OPERACAO = ''15'') OR (D.STATUS = ''2'') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))) AND ');
    SQL.add('       (D.RECPAG  = ' + #39 + ParamIntegra.RecPag + #39 +
      ' ) AND ');
    SQL.add('       (D.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ')    ');

    if not CmpRptCM.ParamValues[2].IsNull then
    begin
      SQL.add('  AND (D.PLANO=' + InttoStr(ParamIntegra.plano) + ')  ');
      SQL.add('  AND (rtrim(D.PLACONTA)=' + #39 +
        TRIM(CmpRptCM.ParamValues[2].AsString) + #39 + ')');
    end;
    if not CmpRptCM.ParamValues[0].IsNull then
      SQL.add(' and  (pL.plndatdia >= TO_DATE(''' +
        CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'')) ');
    if not CmpRptCM.ParamValues[1].IsNull then
      SQL.add(' and  (pL.plndatdia <= TO_DATE(''' +
        CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) ');
    if not CmpRptCM.ParamValues[3].IsNull then
    begin
      SQL.add(' and (rtrim(D.CODCENTROCUSTO) = ' + #39 +
        trim(CmpRptCM.ParamValues[3].AsString) + #39 + ')');
      SQL.add(' AND    (CC.CODCENTROCUSTO = D.CODCENTROCUSTO)  ');
      SQL.add(' AND    (CC.IDEMPRESA = D.IDPESSOA)        ');
    end
    else
    begin
      SQL.add(' AND    (CC.CODCENTROCUSTO(+) = D.CODCENTROCUSTO)  ');
      SQL.add(' AND    (CC.IDEMPRESA(+) = D.IDPESSOA)        ');
    end;

    if not CmpRptCM.ParamValues[5].IsNull then
    begin
      SQL.add(' and (D.CODSUBCONTA=' + CmpRptCM.ParamValues[5].AsString + ')');
      SQL.add(' AND       (SC.CODSUBCONTA = D.CODSUBCONTA)        ');
      SQL.add(' AND       (SC.IDPESSOA = D.IDPESSOA)             ');
    end
    else
    begin
      SQL.add(' AND       (SC.CODSUBCONTA(+) = D.CODSUBCONTA)        ');
      SQL.add(' AND       (SC.IDPESSOA(+) = D.IDPESSOA)             ');
    end;

    if not CmpRptCM.ParamValues[4].IsNull then
    begin
      SQL.add(' and (D.UNIDNEGOC=' + CmpRptCM.ParamValues[4].AsString + ')');
      SQL.add('  AND      (AP.UNIDNEGOC = D.UNIDNEGOC)            ');
      SQL.add('  AND      (AP.IDPESSOA = D.IDPESSOA)              ');
    end
    else
    begin
      SQL.add('  AND      (AP.UNIDNEGOC(+) = D.UNIDNEGOC)            ');
      SQL.add('  AND      (AP.IDPESSOA(+) = D.IDPESSOA)              ');
    end;
    SQL.add('   AND    (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND  ');
    SQL.add('       (PCONTA.PLANO(+) = D.PLANO)          AND  ');
    SQL.add('       (PCONTA.PLACONTA(+) = D.PLACONTA)    AND  ');
    SQL.add('       (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND ');
    SQL.add('       (R.NUMLANCTO = L.NUMLANCTO)          AND  ');
    SQL.add('       (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND ');
    SQL.add('       (D.IDFORCLI = E.IDFORCLI)            AND ');
    SQL.add('       (D.IDPESSOA = E.IDPESSOA)            AND ');
    SQL.add('       (PL.PLNCODIGO = L.PLNCODIGO)          ');
    SQL.add('     )   ');
    SQL.add('ORDER BY  ');
    SQL.add('  data,PLNCODIGO ,CODDOCUMENTO, DEBCRE DESC    ');
    OPEN;
  end;
end;

procedure TRptRellccontab.carregaparametros;
var
  texto: string;
begin
  ppContabMemo1.lines.clear;
  texto := '';
  if not CmpRptCM.ParamValues[0].IsNull then
    texto := CmpRptCM.ParamValues[0].caption + ': ' +
      CmpRptCM.ParamValues[0].AsString + '          ';
  if not CmpRptCM.ParamValues[1].IsNull then
    texto := texto + CmpRptCM.ParamValues[1].caption + ': ' +
      CmpRptCM.ParamValues[1].AsString;
  if texto <> '' then
    setaparametros(texto);
  texto := '';
  if not CmpRptCM.ParamValues[2].IsNull then
    texto := CmpRptCM.ParamValues[2].caption + ': ' +
      CmpRptCM.ParamValues[2].AsString + ' - ' + sContanome;
  if not CmpRptCM.ParamValues[3].IsNull then
    texto := texto + '          ' + CmpRptCM.ParamValues[3].caption + ': ' +
      CmpRptCM.ParamValues[3].AsString + ' - ' + sCentrocustonome;
  if texto <> '' then
    setaparametros(texto);
  texto := '';
  if not CmpRptCM.ParamValues[4].IsNull then
    texto := CmpRptCM.ParamValues[4].caption + ': ' +
      CmpRptCM.ParamValues[4].AsString + ' - ' + sUniNegnome;
  if not CmpRptCM.ParamValues[5].IsNull then
    texto := texto + '          ' + CmpRptCM.ParamValues[5].caption + ': ' +
      CmpRptCM.ParamValues[5].AsString + ' - ' + sSubContanome;
  if texto <> '' then
    setaparametros(texto);
  texto := '';
end;

procedure TRptRellccontab.setaparametros(texto: string);
begin
  ppContabMemo1.Lines.add(texto);
end;

procedure TRptRellccontab.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[0].TextDefault := DateToStr(Date);
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(Date);
  CmpRptCM.ParamValues[2].ProcuraCCSettings.Mascara := ParamIntegra.MascaraCC;
  CmpRptCM.ParamValues[2].ProcuraCCSettings.Plano := ParamIntegra.plano;
  CmpRptCM.ParamValues[3].LookupSettings.SQL.text :=
    'select codexterno as codcentrocusto , nome ' +
    '  from centcust              ' +
    '  where idempresa = ' + FloatToStr(CrmRptCM.IdEmpresa) +
    '  order by nome               ';
  CmpRptCM.ParamValues[4].LookupSettings.SQL.text :=
    'select unidnegoc , nome       ' +
    '  from   unidnegocio          ' +
    '  where  idpessoa = ' + FloatToStr(CrmRptCM.IdEmpresa) +
    '  AND ( UNETIPO  = ''A'' )  ' +
    '  AND ( ATIVO = ''S'')      ' +
    '  order by nome               ';
  CmpRptCM.ParamValues[5].LookupSettings.SQL.text :=
    'select codsubconta , nomesubconta ' +
    '  from subconta                   ' +
    '  where idpessoa = ' + FloatToStr(CrmRptCM.IdEmpresa) +
    '  order by nomesubconta           ';
end;

procedure TRptRellccontab.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  case index of
    2: ScontaNome := TPainelControles(Sender).CtrlLookup.Text;
    3: sCentrocustonome := TPainelControles(Sender).CtrlLookup.Text;
    4: SUniNegNome := TPainelControles(Sender).CtrlLookup.Text;
    5: SSubContaNome := TPainelControles(Sender).CtrlLookup.Text;
  end;
end;

end.

