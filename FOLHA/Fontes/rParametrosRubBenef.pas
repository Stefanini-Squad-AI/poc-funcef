unit rParametrosRubBenef;
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppBands,
  ppCtrls, ppStrtch, ppMemo, ppClass, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBTables, Wwquery,
  DBClient, uCMClientDataSet, uCmSqlParams, uAdmPrevFB, uConstFolha, TXRB,uSistema;

type
  TRptParametrosRubBenef = class(TFrmCmReport)
    ppRubBenef: TppBDEPipeline;
    rptRubBenef: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage17: TppDBImage;
    ppDBText165: TppDBText;
    ppLabel87: TppLabel;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText22: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppCalc39: TppSystemVariable;
    ppLabel90: TppLabel;
    ppCalc40: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppdbPlanoPrev: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    dsRubBenef: TwwDataSource;
    dtsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    sqlpRubBenef: TCMSqlParams;
    sqlpFundacao: TCMSqlParams;
    cdsFundacao: TCMClientDataSet;
    cdsRubBenef: TCMClientDataSet;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLine4: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptParametrosRubBenef: TRptParametrosRubBenef;

implementation

{$R *.DFM}

procedure TRptParametrosRubBenef.CrmRptCMBeforePrint(Sender: TObject);
var lssql: string;
begin
  inherited;
  try
    cdsFundacao.Close;
    lssql:=
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO, '+_clinefeed+
      '       E.NUMERO , E.COMPLEMENTO, E.BAIRRO, '+_clinefeed+
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM, I.IDIMAGEM, '+_clinefeed+
      '      (E.LOGRADOURO||'', ''||E.NUMERO) AS ENDERECO, '+_clinefeed+
      '      (E.BAIRRO||'' - ''||C.NOME||'' - ''||C.CODESTADO) AS BARCIDUF '+_clinefeed+
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C '+_clinefeed+
      'WHERE (P.IDPESSOA = '+inttostr(iidfundacao)+') '+_clinefeed+
      'AND (E.IDPESSOA(+) = P.IDPESSOA) '+_clinefeed+
      'AND (E.IDCIDADES   = C.IDCIDADES(+)) '+_clinefeed+
      'AND (I.IDIMAGEM(+) = P.IDIMAGEM) '+_clinefeed;
    sqlpFundacao.sql.clear;
    sqlpFundacao.sql.add(lssql);
    sqlpFundacao.Open;
  except
  end;

  lssql:=
    'SELECT PL.NOME AS NOMEPLANO, B.NOME AS NOMEBENEFICIO, '+_clinefeed+
    '       RUBB.DESCRICAO AS NOMEPARAMETRO, '+_clinefeed+
    '       RUBB.IDPLANOPREV, '+_clinefeed+
    '       RUBB.IDBENEFICIO, '+_clinefeed+
    '       P.IDPROVENTO AS CODINTERNO, '+_clinefeed+
    '       P.CODPROVDESC AS CODEXTERNO, '+_clinefeed+
    '       NVL(P.DESCRICAO,''NÃO PARAMETRIZADA'') AS NOMERUBRICA, '+_clinefeed+
    '       DECODE(P.IDPROVENTO,NULL,'''', '+_clinefeed+
    '         DECODE(P.FLGESPECIAL,0, '+_clinefeed+
    '           DECODE(P.FLGDESCONTO, '+_clinefeed+
    '             0,''Provento'', '+_clinefeed+
    '             1,''Desconto'', '+_clinefeed+
    '               ''Informativa''),''Informativa'')) AS TIPORUBRICA, '+_clinefeed+
    '       DECODE(P.IDPROVENTO,NULL,'''', '+_clinefeed+
    '         DECODE(P.FLGIRRF,1,''Incide IR'',''Não Incide IR'')) AS FLGIRRF, '+_clinefeed+
    '       DECODE(P.IDPROVENTO,NULL,'''', '+_clinefeed+
    '         P.CODIRRFDARF) AS NATUREZA, '+_clinefeed+
    '       DECODE(P.IDPROVENTO,NULL,'''', '+_clinefeed+
    '         I.NOMEINFORME) AS INFORME '+_clinefeed+
    'FROM ( '+_clinefeed+
    'SELECT  1 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBRICA AS IDRUBRICA,        ''Parâmetro da Rubrica normal'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  2 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBRICAATRASO AS IDRUBRICA,  ''Parâmetro da Rubrica atraso'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  3 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBADIANT AS IDRUBRICA,      ''Parâmetro da Rubrica Adiant. Provisório'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  4 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBACJUD AS IDRUBRICA,       ''Parâmetro da Rubrica normal ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  5 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRACJUD AS IDRUBRICA,    ''Parâmetro da Rubrica atraso ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  6 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBRICAREVISAO AS IDRUBRICA, ''Parâmetro da Rubrica revisão'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  7 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRREVISAO AS IDRUBRICA,  ''Parâmetro da Rubrica atraso revisão'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  8 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBREVACJUD AS IDRUBRICA,    ''Parâmetro da Rubrica revisão ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT  9 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRREVACJUD AS IDRUBRICA, ''Parâmetro da Rubrica atraso revisão ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 10 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLUCAO AS IDRUBRICA,   ''Parâmetro da Rubrica devolução'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 11 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLADIANT AS IDRUBRICA, ''Parâmetro da Rubrica devolução de Adiant. Provisório'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 12 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVACJUD AS IDRUBRICA,    ''Parâmetro da Rubrica devolução ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 13 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVREVISAO AS IDRUBRICA,  ''Parâmetro da Rubrica devolução revisão'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 14 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVREVACJUD AS IDRUBRICA, ''Parâmetro da Rubrica devolução revisão ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 15 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBABONO AS IDRUBRICA,       ''Parâmetro da Rubrica abono'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 16 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRASOABONO AS IDRUBRICA, ''Parâmetro da Rubrica atraso abono'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 17 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBANTECABONO AS IDRUBRICA,  ''Parâmetro da Rubrica antecipação abono'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 18 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBACERTOABONO AS IDRUBRICA, ''Parâmetro da Rubrica atraso antecip. abono'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 19 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUB13ACJUD AS IDRUBRICA,     ''Parâmetro da Rubrica abono ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 20 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATR13ACJUD AS IDRUBRICA,  ''Parâmetro da Rubrica atraso abono ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 21 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLABONO AS IDRUBRICA,  ''Parâmetro da Rubrica devolução abono'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 22 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVANTABONO AS IDRUBRICA, ''Parâmetro da Rubrica devolução antecip. abono'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    'UNION '+_clinefeed+
    'SELECT 23 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEV13ACJUD AS IDRUBRICA,  ''Parâmetro da Rubrica devolução abono ação judicial'' AS DESCRICAO '+_clinefeed+
    'FROM BENEFPLANPREV '+_clinefeed+
    ') RUBB, PLANPREV PL, BENEFICIO B, PROVDESC P, INFORME I '+_clinefeed+
    'WHERE RUBB.IDPLANOPREV = PL.IDPLANOPREV '+_clinefeed+
    'AND RUBB.IDBENEFICIO = B.IDBENEFICIO '+_clinefeed+
    'AND RUBB.IDRUBRICA = P.IDPROVENTO(+) '+_clinefeed+
    'AND P.IDINFORME = I.IDINFORME(+) '+_clinefeed;

 	if not CmpRptCM.ParamValues[0].IsNull then
  begin
    if CmpRptCM.ParamValues[0].asinteger = 1 then
      lssql:=lssql+'AND RUBB.IDRUBRICA IS NOT NULL '+_clinefeed
    else
      if CmpRptCM.ParamValues[0].asinteger = 2 then
        lssql:=lssql+'AND RUBB.IDRUBRICA IS NULL '+_clinefeed;
  end;

 	if not CmpRptCM.ParamValues[1].IsNull then
  begin
    lssql:=lssql+'AND RUBB.IDPLANOPREV = '+
      inttostr(CmpRptCM.ParamValues[1].asinteger)+' '+_clinefeed;
  end;

 	if not CmpRptCM.ParamValues[2].IsNull then
  begin
    lssql:=lssql+'AND RUBB.IDBENEFICIO = '+
      inttostr(CmpRptCM.ParamValues[2].asinteger)+' '+_clinefeed;
  end;

  lssql:=lssql+
    'ORDER BY PL.NOME, B.NOME, RUBB.ORDEM '+_clinefeed;

  try
    cdsRubBenef.Close;
    sqlpRubBenef.sql.clear;
    sqlpRubBenef.sql.add(lssql);
    sqlpRubBenef.Open;
  except
  end;

end;

procedure TRptParametrosRubBenef.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana SOL 109421 KINTANA 496332
        //rptRubBenef.Template.Filename:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\rptParamRubricaBeneficio.rtm';
        rptRubBenef.Template.Filename:= 'c:\rptParamRubricaBeneficio.rtm';

        end;

end.
