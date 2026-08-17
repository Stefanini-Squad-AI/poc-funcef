unit rRelatCompRendPessJurid; 
// Alterações:
{ --------------------------------------------------------------------------------------------------
 N. Chamado....: WO34233
 Dt Alteração..: 18/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
----------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 13/12/2007
Autor     : Bruno Bastos
Pendência : 27082
Descrição : Não trazer na query o campo NUMDOCUMENTO da LancIRRF.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, TXRB;

type
  TfrmRelatCompRendPessJurid = class(TFrmCmReport)
    pplComRenJuridica: TppBDEPipeline;
    dsComRenJuridica: TwwDataSource;
    rpComRenJuridica: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    rpComRenJuridicaImage1: TppImage;
    rpComRenJuridicaLabel22: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape7: TppShape;
    ppDBText2: TppDBText;
    ppLabel9: TppLabel;
    ppShape9: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLine21: TppLine;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine22: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine29: TppLine;
    ppLabel44: TppLabel;
    ppLine30: TppLine;
    ppLabel45: TppLabel;
    rpComRenJuridicaLine1: TppLine;
    rpComRenJuridicaLabel1: TppLabel;
    rpComRenJuridicaLine2: TppLine;
    rpComRenJuridicaLabel2: TppLabel;
    rpComRenJuridicaDBText1: TppDBText;
    rpComRenJuridicaShape1: TppShape;
    rpComRenJuridicaLine4: TppLine;
    rpComRenJuridicaLine5: TppLine;
    rpComRenJuridicaLine6: TppLine;
    rpComRenJuridicaLine8: TppLine;
    rpComRenJuridicaLine10: TppLine;
    rpComRenJuridicaLine12: TppLine;
    rpComRenJuridicaLine14: TppLine;
    rpComRenJuridicaLine3: TppLine;
    rpComRenJuridicaLine9: TppLine;
    rpComRenJuridicaLine13: TppLine;
    rpComRenJuridicaLine16: TppLine;
    rpComRenJuridicaLine18: TppLine;
    rpComRenJuridicaLine20: TppLine;
    rpComRenJuridicaLabel3: TppLabel;
    rpComRenJuridicaLabel4: TppLabel;
    rpComRenJuridicaLabel5: TppLabel;
    rpComRenJuridicaLabel6: TppLabel;
    rpComRenJuridicaLabel7: TppLabel;
    rpComRenJuridicaLabel8: TppLabel;
    rpComRenJuridicaLabel9: TppLabel;
    rpComRenJuridicaLabel10: TppLabel;
    rpComRenJuridicaLabel11: TppLabel;
    rpComRenJuridicaLabel12: TppLabel;
    rpComRenJuridicaLabel13: TppLabel;
    rpComRenJuridicaLabel14: TppLabel;
    rpComRenJuridicaLabel15: TppLabel;
    rpComRenJuridicaLabel16: TppLabel;
    rpComRenJuridicaLabel17: TppLabel;
    rpComRenJuridicaLabel18: TppLabel;
    rpComRenJuridicaLabel19: TppLabel;
    rpComRenJuridicaLine11: TppLine;
    rpComRenJuridicaLine17: TppLine;
    rpComRenJuridicaLine21: TppLine;
    rpComRenJuridicaLine7: TppLine;
    rpComRenJuridicaLine15: TppLine;
    rpComRenJuridicaLine19: TppLine;
    rpComRenJuridicaLine22: TppLine;
    rpComRenJuridicaDBText2: TppDBText;
    rpComRenJuridicaDBText3: TppDBText;
    rpComRenJuridicaDBText4: TppDBText;
    rpComRenJuridicaDBText5: TppDBText;
    rpComRenJuridicaDBText6: TppDBText;
    rpComRenJuridicaDBText7: TppDBText;
    rpComRenJuridicaDBText8: TppDBText;
    rpComRenJuridicaDBText9: TppDBText;
    rpComRenJuridicaDBText10: TppDBText;
    rpComRenJuridicaDBText11: TppDBText;
    rpComRenJuridicaDBText12: TppDBText;
    rpComRenJuridicaDBText13: TppDBText;
    rpComRenJuridicaDBText14: TppDBText;
    rpComRenJuridicaDBText15: TppDBText;
    rpComRenJuridicaDBText16: TppDBText;
    rpComRenJuridicaDBText17: TppDBText;
    rpComRenJuridicaDBText18: TppDBText;
    rpComRenJuridicaDBText19: TppDBText;
    rpComRenJuridicaDBText20: TppDBText;
    rpComRenJuridicaDBText21: TppDBText;
    rpComRenJuridicaDBText22: TppDBText;
    rpComRenJuridicaDBText23: TppDBText;
    rpComRenJuridicaDBText24: TppDBText;
    rpComRenJuridicaDBText25: TppDBText;
    rpComRenJuridicaDBText26: TppDBText;
    rpComRenJuridicaDBText27: TppDBText;
    rpComRenJuridicaDBText28: TppDBText;
    rpComRenJuridicaDBText29: TppDBText;
    rpComRenJuridicaDBText30: TppDBText;
    rpComRenJuridicaDBText31: TppDBText;
    rpComRenJuridicaDBText32: TppDBText;
    rpComRenJuridicaDBText33: TppDBText;
    rpComRenJuridicaDBText34: TppDBText;
    rpComRenJuridicaDBText35: TppDBText;
    rpComRenJuridicaDBText36: TppDBText;
    rpComRenJuridicaDBText37: TppDBText;
    rpComRenJuridicaDBText38: TppDBText;
    rpComRenJuridicaDBText39: TppDBText;
    rpComRenJuridicaDBText40: TppDBText;
    rpComRenJuridicaDBText41: TppDBText;
    rpComRenJuridicaDBText42: TppDBText;
    rpComRenJuridicaDBText43: TppDBText;
    rpComRenJuridicaDBText44: TppDBText;
    rpComRenJuridicaDBText45: TppDBText;
    rpComRenJuridicaDBText46: TppDBText;
    rpComRenJuridicaDBText47: TppDBText;
    rpComRenJuridicaDBText48: TppDBText;
    rpComRenJuridicaDBText49: TppDBText;
    rpComRenJuridicaDBText50: TppDBText;
    rpComRenJuridicaDBText51: TppDBText;
    rpComRenJuridicaDBText52: TppDBText;
    rpComRenJuridicaDBText53: TppDBText;
    sqlComRenJuridica: TCMSqlParams;
    cdsComRenJuridica: TCMClientDataSet;
    rpComRenJuridicaLabel20: TppLabel;
    rpComRenJuridicaLabel21: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatCompRendPessJurid: TfrmRelatCompRendPessJurid;

implementation

{$R *.DFM}

procedure TfrmRelatCompRendPessJurid.CrmRptCMBeforePrint(Sender: TObject);
var
Data,Ano : string;
begin
   inherited;
   Ano := CmpRptCM.ParamValues[0].Asstring;

   sqlComRenJuridica.SQL.Clear;
   sqlComRenJuridica.sql.Append('SELECT                                                                                           ');
   sqlComRenJuridica.sql.Append('LAN.TIPO, LAN.NOMEBENEF, LAN.CGCBENEF, LAN.IDBENEFIRRF,                                          ');
   sqlComRenJuridica.sql.Append('E.NUMDOCUMENTO AS CGCFONTE, E.RAZAOSOCIAL AS NOMEFONTE,                                          ');
   sqlComRenJuridica.sql.Append('((EN.LOGRADOURO)||'', nº''||(EN.NUMERO)||'', ''||(EN.COMPLEMENTO)||'', ''||(EN.BAIRRO)) AS ENDERECO,   ');
   sqlComRenJuridica.sql.Append('C.NOME, ES.CODESTADO AS UF, LAN.CODNATUREZA, LAN.DESCRICAO, (''-'') AS TELEFONE,                 ');
   sqlComRenJuridica.sql.Append('LAN.VLRBASE, LAN.VLRIRRF, LAN.JANTOTALREND, LAN.FEVTOTALREND, LAN.MARTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('LAN.ABRTOTALREND, LAN.MAITOTALREND, LAN.JUNTOTALREND, LAN.JULTOTALREND, LAN.AGOTOTALREND,        ');
   sqlComRenJuridica.sql.Append('LAN.SETTOTALREND, LAN.OUTTOTALREND, LAN.NOVTOTALREND, LAN.DEZTOTALREND, LAN.JANRETIDOFON,        ');
   sqlComRenJuridica.sql.Append('LAN.FEVRETIDOFON, LAN.MARRETIDOFON, LAN.ABRRETIDOFON, LAN.MAIRETIDOFON, LAN.JUNRETIDOFON,        ');
   sqlComRenJuridica.sql.Append('LAN.JULRETIDOFON, LAN.AGORETIDOFON, LAN.SETRETIDOFON, LAN.OUTRETIDOFON,                          ');
   sqlComRenJuridica.sql.Append('LAN.NOVRETIDOFON, LAN.DEZRETIDOFON                                                               ');
   sqlComRenJuridica.sql.Append('FROM                                                                                             ');
   sqlComRenJuridica.sql.Append('(SELECT                                                                                          ');
   sqlComRenJuridica.sql.Append('  P.TIPO,                                                                                        ');
   sqlComRenJuridica.sql.Append('  P.RAZAOSOCIAL AS NOMEBENEF,                                                                    ');
   sqlComRenJuridica.sql.Append('  P.NUMDOCUMENTO AS CGCBENEF,                                                                    ');
   sqlComRenJuridica.sql.Append('  L.IDBENEFIRRF,                                                                                 ');
   sqlComRenJuridica.sql.Append('  NAT.CODNATUREZA,                                                                               ');
   sqlComRenJuridica.sql.Append('  NAT.DESCRICAO,                                                                                 ');
   //CPREV - Pend. 27082 - sqlComRenJuridica.sql.Append('  SUBSTR(L.NUMDOCUMENTO,1,8) AS RAIZDOCUMENTO,                                                   ');
   sqlComRenJuridica.sql.Append('  SUM(L.VLRBASE) AS VLRBASE,                                                                     ');
   sqlComRenJuridica.sql.Append('  SUM(L.VLRIRRF) AS VLRIRRF,                                                                     ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''01'',L.VLRBASE,0)) AS JANTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''02'',L.VLRBASE,0)) AS FEVTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''03'',L.VLRBASE,0)) AS MARTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''04'',L.VLRBASE,0)) AS ABRTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''05'',L.VLRBASE,0)) AS MAITOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''06'',L.VLRBASE,0)) AS JUNTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''07'',L.VLRBASE,0)) AS JULTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''08'',L.VLRBASE,0)) AS AGOTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''09'',L.VLRBASE,0)) AS SETTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''10'',L.VLRBASE,0)) AS OUTTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''11'',L.VLRBASE,0)) AS NOVTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''12'',L.VLRBASE,0)) AS DEZTOTALREND,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''01'',L.VLRIRRF,0)) AS JANRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''02'',L.VLRIRRF,0)) AS FEVRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''03'',L.VLRIRRF,0)) AS MARRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''04'',L.VLRIRRF,0)) AS ABRRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''05'',L.VLRIRRF,0)) AS MAIRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''06'',L.VLRIRRF,0)) AS JUNRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''07'',L.VLRIRRF,0)) AS JULRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''08'',L.VLRIRRF,0)) AS AGORETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''09'',L.VLRIRRF,0)) AS SETRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''10'',L.VLRIRRF,0)) AS OUTRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''11'',L.VLRIRRF,0)) AS NOVRETIDOFON,                  ');
   sqlComRenJuridica.sql.Append('  SUM(DECODE(TO_CHAR(L.DATALANCAMENTO,''MM''),''12'',L.VLRIRRF,0)) AS DEZRETIDOFON                   ');
   sqlComRenJuridica.sql.Append('FROM                                                                                             ');
   sqlComRenJuridica.sql.Append('  LANCIRRF L, PESSOA P, NATURENDIMENTO NAT                                                       ');
   sqlComRenJuridica.sql.Append('WHERE                                                                                            ');

   if Trim(CmpRptCM.ParamValues[5].Asstring) <> '' then
      sqlComRenJuridica.sql.Append(' (P.NUMDOCUMENTO = '+quotedStr(CmpRptCM.ParamValues[5].Asstring)+') AND ');

   if Trim(CmpRptCM.ParamValues[6].Asstring) <> '' then
      sqlComRenJuridica.sql.Append(' (L.CODNATUREZA IN ('+CmpRptCM.ParamValues[6].Asstring+')) AND ');

   sqlComRenJuridica.sql.Append('  (P.TIPO = :sTipo) AND                                                                          ');
   sqlComRenJuridica.sql.Append('  (P.IDPESSOA = L.IDBENEFIRRF) AND                                                               ');
   sqlComRenJuridica.sql.Append('   (L.IDMODULO NOT IN (18,21)) AND                                                               ');
   sqlComRenJuridica.sql.Append('  (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlComRenJuridica.sql.Append('  (NAT.CODNATUREZA = L.CODNATUREZA)                                                              ');
   sqlComRenJuridica.sql.Append('GROUP BY                                                                                         ');
   sqlComRenJuridica.sql.Append('  P.TIPO,                                                                                        ');
   sqlComRenJuridica.sql.Append('  P.RAZAOSOCIAL,                                                                                 ');
   sqlComRenJuridica.sql.Append('  P.NUMDOCUMENTO,                                                                                ');
   sqlComRenJuridica.sql.Append('  L.IDBENEFIRRF,                                                                                 ');
   //CPREV - Pend. 27082 - sqlComRenJuridica.sql.Append('  SUBSTR(L.NUMDOCUMENTO,1,8),                                                                    ');
   sqlComRenJuridica.sql.Append('  NAT.CODNATUREZA,                                                                               ');
   sqlComRenJuridica.sql.Append('  NAT.DESCRICAO ) LAN,                                                                           ');
   sqlComRenJuridica.sql.Append('PESSOA E,ENDPESS EN,CIDADES C, ESTADO ES, EMPRESAPROP EP                                                         ');
   sqlComRenJuridica.sql.Append('WHERE                                                                                            ');
   sqlComRenJuridica.sql.Append('(EP.IDPESSOA = E.IDPESSOA) AND                                                               ');
   sqlComRenJuridica.sql.Append('(EN.IDENDERECO(+) = E.IDENDCOMERCIAL) AND                                                        ');
   sqlComRenJuridica.sql.Append('(EN.IDCIDADES = C.IDCIDADES(+)) AND                                                              ');
   sqlComRenJuridica.sql.Append('(ES.IDESTADO(+) = C.IDESTADO) AND                                                                ');
   sqlComRenJuridica.sql.Append('(EN.IDPESSOA(+) = E.IDPESSOA)                                                                    ');
   sqlComRenJuridica.sql.Append('ORDER BY LAN.NOMEBENEF,LAN.IDBENEFIRRF, LAN.CODNATUREZA                                          ');


   sqlComRenJuridica.Prepare;
   sqlComRenJuridica.ParamByName('sDataIni').AsString   := '01/01/'+Ano;
   sqlComRenJuridica.ParamByName('sDataFim').AsString   := '31/12/'+Ano;
   if CmpRptCM.ParamValues[4].AsInteger = 0 then
     Begin
       sqlComRenJuridica.ParamByName('sTipo').AsString := 'J';
       ppDBText5.DisplayFormat                         := 'AA.AAA.AAA/AAAA-99;0;_';        // Paulo Nobre - WO34233
       ppLabel3.Caption                                := 'NA FONTE - PESSOA JURÍDICA';
       ppLabel13.Caption                               := '02   PESSOA JURÍDICA BENEFICIÁRIA DOS RENDIMENTOS';
       ppLabel16.Caption                               := 'CNPJ';
       ppLabel17.Caption                               := 'NOME EMPRESARIAL';
     end
   else
     Begin
       SqlComRenJuridica.ParamByName('sTipo').AsString := 'F';
       ppDBText5.DisplayFormat                         := '999.999.999-99;0;_';
       ppLabel3.Caption                                := 'NA FONTE - PESSOA FÍSICA';
       ppLabel13.Caption                               := '02   PESSOA FÍSICA BENEFICIÁRIA DOS RENDIMENTOS';
       ppLabel16.Caption                               := 'CPF';
       ppLabel17.Caption                               := 'NOME';
     end;
   Data := DateTimeToStr(Date);
   rpComRenJuridicaLabel22.Text := 'ANO - CALENDÁRIO: '+ ano;
   ppLabel39.caption := CmpRptCM.ParamValues[2].AsString;
   ppLabel41.caption := CmpRptCM.ParamValues[3].AsString;
   sqlComRenJuridica.Open;
end;

end.
