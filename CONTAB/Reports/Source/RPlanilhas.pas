{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 22/08/2002                             }
{                                                       }
{*******************************************************}

unit RPlanilhas;

{-----------------------------------------------------------------------------------------
   Data      : 16.02.2006
   Autor     : Antonio Marcos Fernandes de Souza (amf)
   Pendência : 20888
   Descrição : Permitir que o relatório seja configurado na rotina de configuração do re-
               latório. O combo que permite a seleção dos fields não estava sendo preen-
               chido. A solução foi no Create do Form abrir a sqlPlanilhas.
------------------------------------------------------------------------------------------
   Data      : 20/10/2005
   Autor     : Rodolpho da Silva
   Pendência : 20506
   Descrição : Incluir na qry o campo CODEXTERNO para exibição do Centro de Custo
-----------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uCtrlContab,
  FCmReport, uCmRptManager, TXComp, CmParamReport, RRelatWeb, ppVar,uCtrlRptBalancete,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,uCtrlPeriodo,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, Provider,
  ADODB, DBTables, ppStrtch, ppMemo, usistema, uCmSqlParams,
  uCMClientDataSet, TXRB;

type
  TrptPlanilhas = class(TFrmCmReport)
    dsPlanilhas: TwwDataSource;
    pplPlanilhas: TppDbPipeline;
    Cds: TClientDataSet;
    sqlPlanilhas: TCMSqlParams;
    rptPlanilhas: TppReport;
    ppHeaderBand3: TppHeaderBand;
    pplblTituloPlanilhas: TppLabel;
    ppLine8: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine10: TppLine;
    ppLabel12: TppLabel;
    ppLabel19: TppLabel;
    pplblTituloPlanilhas2: TppLabel;
    rptPlanilhasLabel8: TppLabel;
    rptPlanilhasLabel9: TppLabel;
    rptPlanilhasLabel10: TppLabel;
    rptPlanilhasLabel11: TppLabel;
    rptPlanilhasLabel13: TppLabel;
    rptPlanilhasLabel5: TppLabel;
    rptPlanilhasLabel14: TppLabel;
    bndDetPlanilhas: TppDetailBand;
    dbtxtContaPlanilhas: TppDBText;
    ppDBText2: TppDBText;
    ppDBText9: TppDBText;
    rptPlanilhasDBMemo1: TppDBMemo;
    dbtxtUnidNegocPlanilhas: TppDBText;
    rptPlanilhasDBText9: TppDBText;
    rptPlanilhasDBText11: TppDBText;
    rptPlanilhasDBText8: TppDBText;
    dbtxtCCustoPlanilhas: TppDBText;
    rptPlanilhasDBText12: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel23: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    rptPlanilhasLine1: TppLine;
    rptPlanilhasLabel1: TppLabel;
    rptPlanilhasDBText2: TppDBText;
    rptPlanilhasDBText3: TppDBText;
    rptPlanilhasLabel3: TppLabel;
    rptPlanilhasLabel7: TppLabel;
    rptPlanilhasDBText7: TppDBText;
    rptPlanilhasDBText10: TppDBText;
    rptPlanilhasLabel2: TppLabel;
    rptPlanilhasLabel12: TppLabel;
    rptPlanilhasDBText1: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    rptPlanilhasLine2: TppLine;
    rptPlanilhasDBText6: TppDBText;
    rptPlanilhasLabel6: TppLabel;
    rptPlanilhasDBText5: TppDBText;
    rptPlanilhasDBText4: TppDBText;
    rptPlanilhasLabel4: TppLabel;
    ppLine11: TppLine;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure bndDetPlanilhasBeforeGenerate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlPeriodo      :TCtrlPeriodo;
    CtrlContab       :TCtrlContab;
    CtrlRptBalancete :TCtrlRptBalancete;
    sMascaraContas : string;
    sMascaraUnidNegoc : string;
    sMascaraCCusto : string;

  public
    { Public declarations }
  end;

implementation

uses UMensErro, uDatabase, DBaseDados,uCtrlParamIntegra,
     uModulo, uFuncaoGeral;

{$R *.DFM}

procedure TrptPlanilhas.CrmRptCMBeforePrint(Sender: TObject);
var sTitulo : string;
    iGrau,iNumDig : Integer;
begin
  inherited;
  CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa);

  CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[1].AsDateTime));

   iNumDig := 0;
   if CmpRptCM.ParamValues[17].AsBoolean then begin
      iGrau := FuncaoGeral.CalcGrauMax(Modulo.sMascaraUnidNegoc);
      iNumDig :=FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraUnidNegoc,(iGrau-1));
   end;


   //Filtra os dados da tela para passar para o relatório
   if not ((CmpRptCM.ParamValues[1].AsString = '') or (CmpRptCM.ParamValues[2].AsString = '')) then begin

      //Verifica se a data final é maior ou igual à inicial
      if VerificaDatas(CmpRptCM.ParamValues[1].AsDateTime, CmpRptCM.ParamValues[2].AsDateTime) then begin

         if CmpRptCM.ParamValues[18].Asstring = '' then begin
            //Imprime os títulos
            sTitulo := 'Planilhas Lançadas - período de ' + CmpRptCM.ParamValues[1].AsString + ' a ' + CmpRptCM.ParamValues[2].AsString;
            pplblTituloPlanilhas.caption := sTitulo;

            // *** pega nome do meodulo ***
            sTitulo := '';
            if trim(CmpRptCM.ParamValues[7].AsString) <> '0' then begin
               sqlAux.sql.Clear;
               sqlAux.sql.add('SELECT IDMODULO, NOMEMODULO ');
               sqlAux.sql.add('FROM MODULO ' );
               sqlAux.sql.add('WHERE IDMODULO = '+ quotedStr(CmpRptCM.ParamValues[7].AsString) );
               sqlAux.sql.add(' ORDER BY NOMEMODULO');
               sqlAux.Open;
               sTitulo := sTitulo +  'Módulo : ' + cdsAux.fieldByname('NOMEMODULO').Asstring;
            end;

            // *** pega tipo de operacao ***
            if trim(CmpRptCM.ParamValues[9].AsString) <> '0' then begin
               sqlAux.sql.Clear;
               sqlAux.sql.add('SELECT TIPCODIGO, TIPDESCRICAO ');
               sqlAux.sql.add('FROM TIPOPER ');
               sqlAux.sql.add('WHERE TIPCODIGO = '+ quotedStr(CmpRptCM.ParamValues[9].AsString));
               sqlAux.sql.add('ORDER BY TIPDESCRICAO');
               sqlAux.Open;

               sTitulo := sTitulo +  '     Tipo de Operação : ' + cdsAux.fieldByname('TIPCODIGO').Asstring;
            end;

            // *** pega nome do historico ***
            if trim(CmpRptCM.ParamValues[8].AsString) <> '0' then begin
               sqlAux.sql.Clear;
               sqlAux.sql.add('SELECT HITCODHIST, HITDESCR1 ');
               sqlAux.sql.add(' FROM HISTOPADRAO ');
               sqlAux.sql.add(' WHERE HITCODHIST = '+ quotedStr(CmpRptCM.ParamValues[8].AsString));
               sqlAux.sql.add(' ORDER BY HITCODHIST');
               sqlAux.open;
               sTitulo := sTitulo +  '     Histórico Padrão : ' + cdsAux.fieldByname('HITDESCR1').Asstring;
            end;

            case CmpRptCM.ParamValues[12].AsInteger of
               0: sTitulo := sTitulo +  '    Lançamentos : TODOS';
               1: sTitulo := sTitulo +  '    Lançamentos : Somente Integrados';
               2: sTitulo := sTitulo +  '    Lançamentos : Somente NÃO Integrados';
            end;
            case CmpRptCM.ParamValues[13].AsInteger of
               0: sTitulo := sTitulo +  '    Valores : TODOS';
               1: sTitulo := sTitulo +  '    Valores : Crédito igual ao Débito';
               2: sTitulo := sTitulo +  '    Valores : Crédito diferente do Débito';
            end;
            pplblTituloPlanilhas2.caption := sTitulo;
         end else begin
            pplblTituloPlanilhas.caption  := CmpRptCM.ParamValues[18].AsString;
            pplblTituloPlanilhas2.caption := CmpRptCM.ParamValues[19].AsString;
         end;

         //Configura a quebra de página
         rptPlanilhas.Groups[0].NewPage := CmpRptCM.ParamValues[15].AsBoolean;

         //Configura a máscara das contas contábeis
         if CmpRptCM.ParamValues[16].AsBoolean then begin
            sMascaraContas    := CtrlContab.MascaraContaParam;
            sMascaraUnidNegoc := Modulo.sMascaraUnidNegoc;
            sMascaraCCusto    := modulo.sMascaraCCusto;
         end;

         //amf 16.02.2006 p:20888 - Antes de fazer a Query, fecha a Query se Estiver Aberta.
         if sqlPlanilhas.ClientDataSet.Active then
            sqlPlanilhas.ClientDataSet.Close;

         //Faz a query
         with sqlPlanilhas.SQL do
         begin
            Clear;
            Add('SELECT   /*+ RULE */                                                                ');
            Add('   L.PLACONTA, P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA, M.NOMEMODULO,                 ');
            Add('   SA.TOTDEB, SA.TOTCRED, SA.DIF, L.LACNUMLAN, C.PLAGRAU,                           ');
            Add('   L.LACVALOR, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, L.LACDEBCRE, ');

            Add('   CC.CODEXTERNO AS CODCENTROCUSTO,');


            if CmpRptCM.ParamValues[17].AsBoolean then begin
               Add('   U1.UNECODIGO,       ');
            end else begin
               Add('   U.UNECODIGO,        ');
            end;
            Add('   L.LACHIST1, L.LACHIST2, L.LACHIST3, L.LACHIST4, L.LACHIST5, L.LACNUMDOC,        ');
            Add('   (L.LACHIST1||'' ''||L.LACHIST2||'' ''||L.LACHIST3||'' ''||L.LACHIST4||'' ''||L.LACHIST5) as HISTORICO,');
            Add('   P.PLNNUMLAN, P.PLNEFETIVADO, L.CODSUBCONTA, S.NOMESUBCONTA,                     ');
            Add('   DECODE(L.LACDEBCRE, ''D'',L.LACVALOR, 0) AS DEB,                                ');
            Add('   DECODE(L.LACDEBCRE, ''C'',L.LACVALOR, 0) AS CRE,                                ');
            Add('   L.IDPLANOPREV, L.IDPATRO, PC.NOME AS PLANPREVCONTABIL, PP.NOME AS PATRO         ');
            Add('FROM                                                                               ');
            Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA S, UNIDNEGOCIO U, MODULO M,    ');
            Add('   PLANPREVCONTABIL PC, PATRO PT, PESSOA PP,                                       ');
            Add('CENTCUST CC,');
            Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');

            if CmpRptCM.ParamValues[17].AsBoolean then begin
               Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
               Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
               Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
            end;
            Add('   (SELECT P.PLNCODIGO,                                                            ');
            Add('           SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS TOTDEB,                ');
            Add('           SUM(DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS TOTCRED,              ');
            Add('           SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * -1))) AS DIF   ');
            Add('   FROM                                                                            ');
            Add('       PLANILHA P, LANCAMENTO L                                                    ');
            Add('   WHERE                                                                           ');
            if CmpRptCM.ParamValues[3].AsInteger <> 0 then begin
               Add(' (P.PLNPLANIL >=:PLNPLANILINI) AND                                              ');
            end;
            if CmpRptCM.ParamValues[4].AsInteger <> 0 then begin
               Add(' (P.PLNPLANIL <=:PLNPLANILFIM) AND                                              ');
            end;
            if trim(CmpRptCM.ParamValues[10].AsString) <> '' then begin
               Add(' (L.LACNUMDOC =:LACNUMDOC) AND                                              ');
            end;
            if CmpRptCM.ParamValues[12].AsInteger = 1 then begin
               Add('(P.PLNEFETIVADO = ''S'') AND                                                    ');
            end;
            if CmpRptCM.ParamValues[12].AsInteger = 2 then begin
               Add('((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND                      ');
            end;
            if CmpRptCM.ParamValues[7].AsString <> '0' then begin
               Add('(P.IDMODULO =:MODULO ) AND                                                      ');
            end;

            if CmpRptCM.ParamValues[9].AsString <> '0' then begin
               if CmpRptCM.ParamValues[11].AsBoolean then begin
                  Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                     ');
               end else begin
                  Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                     ');
               end;
            end;
            if CmpRptCM.ParamValues[8].AsString <> '0' then begin
               Add('(RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                                        ');
            end;
            Add('   (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                                 ');
            Add('   (RTRIM(PLACONTA) >=:CONTAINI) AND                                               ');
            Add('   (RTRIM(PLACONTA) <=:CONTAFIM) AND                                               ');
            Add('   (P.PEREXERCICIO =:EXERCICIO) AND                                                ');
            Add('   (P.IDPESSOA =:IDPESSOA) AND                                                     ');
            Add('   (P.PLNCODIGO = L.PLNCODIGO)                                                     ');
            Add('   GROUP BY P.PLNCODIGO                                                            ');
            if CmpRptCM.ParamValues[13].AsInteger = 0 then begin
               Add(')SA                                                                             ');
            end;
            if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
               Add('HAVING SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * -1))) = 0 ) SA  ');
            end;
            if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
               Add('HAVING SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * -1))) <> 0 ) SA ');
            end;
            Add('WHERE                                                                              ');
            Add('(P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                                    ');
            Add('(P.PEREXERCICIO =:EXERCICIO) AND                                                   ');
            Add('(P.IDPESSOA =:IDPESSOA) AND                                                        ');

            if CmpRptCM.ParamValues[3].AsInteger <> 0 then begin
               Add('(P.PLNPLANIL >=:PLNPLANILINI) AND                                               ');
            end;
            if CmpRptCM.ParamValues[4].AsInteger <> 0 then begin
               Add('(P.PLNPLANIL <=:PLNPLANILFIM) AND                                               ');
            end;
            if trim(CmpRptCM.ParamValues[10].AsString) <> '' then begin
               Add(' (L.LACNUMDOC =:LACNUMDOC) AND                                              ');
            end;
            if  CmpRptCM.ParamValues[12].AsInteger = 1 then begin
               Add('(P.PLNEFETIVADO = ''S'') AND                                                    ');
            end;
            if CmpRptCM.ParamValues[12].AsInteger = 2 then begin
               Add('((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND                      ');
            end;
            if trim(CmpRptCM.ParamValues[7].AsString) <> '0' then begin
               Add('(P.IDMODULO =:MODULO ) AND                                                      ');
            end;
            if trim(CmpRptCM.ParamValues[9].AsString) <> '0' then begin
               if CmpRptCM.ParamValues[11].AsBoolean then begin
                  Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                     ');
               end else begin
                  Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                     ');
               end;
            end;
            if trim(CmpRptCM.ParamValues[8].AsString) <> '0' then begin
               Add('(RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                                        ');
            end;
            Add('(RTRIM(L.PLACONTA) >=:CONTAINI) AND                                                ');
            Add('(RTRIM(L.PLACONTA) <=:CONTAFIM) AND                                                ');
            Add('((L.PLANO = C.PLANO) AND                                                           ');
            Add('(L.PLACONTA = C.PLACONTA)) AND                                                     ');

            Add('(PD.PLACONTA(+) = C.PLACONTA)  AND                                                 ');
            Add('(PD.PLANO(+)    = C.PLANO) AND                                                     ');

            Add('(L.UNIDNEGOC = U.UNIDNEGOC(+)) AND                                                 ');
            Add('(L.IDPESSOA = U.IDPESSOA(+)) AND                                                   ');
            if CmpRptCM.ParamValues[17].AsBoolean then begin
               Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO(+)) AND ');
            end;
            Add('(P.IDMODULO = M.IDMODULO) AND                                                      ');
            Add('(L.IDPLANOPREV = PC.IDPLANOPREV(+)) AND                                            ');
            Add('(L.IDPATRO = PT.IDPESSOA(+)) AND                                                   ');
            Add('(PT.IDPESSOA = PP.IDPESSOA(+)) AND                                                 ');
            Add('(CC.CODCENTROCUSTO(+) = L.CODCENTROCUSTO) AND');
            Add('(P.PLNCODIGO = L.PLNCODIGO) AND                                                    ');
            Add('(P.PLNCODIGO = SA.PLNCODIGO) AND                                                   ');
            Add('(L.IDPESSOA = S.IDPESSOA(+)) AND                                                   ');
            Add('(L.CODSUBCONTA = S.CODSUBCONTA(+))                                                 ');
            if CmpRptCM.ParamValues[14].AsInteger = 0 then begin
               Add('ORDER BY P.PLNCODIGO                                                            ');
            end else begin
               if CmpRptCM.ParamValues[14].AsInteger = 1 then begin
                  Add('ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN                           ');
               end else begin
                  Add('ORDER BY P.PLNDATDIA, L.LACNUMDOC, P.PLNPLANIL, L.LACNUMLAN              ');
               end;
            end;

            sqlPlanilhas.Prepare;
            sqlPlanilhas.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
            sqlPlanilhas.ParamByName('DATAINI').asDate  := CmpRptCM.ParamValues[1].AsDateTime;
            sqlPlanilhas.ParamByName('DATAFIM').asDate  := CmpRptCM.ParamValues[2].AsDateTime;
            sqlPlanilhas.ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);

            if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
               sqlPlanilhas.ParamByName('CONTAINI').asString := CmpRptCM.ParamValues[5].AsString;
            end else begin
               sqlPlanilhas.ParamByName('CONTAINI').asString := '0';
            end;
            //
            if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
               sqlPlanilhas.ParamByName('CONTAFIM').asString := CmpRptCM.ParamValues[6].AsString;
            end else begin
               sqlPlanilhas.ParamByName('CONTAFIM').asString := '999999999999999999';
            end;

            if trim(CmpRptCM.ParamValues[10].AsString) <> '' then begin
               sqlPlanilhas.ParamByName('LACNUMDOC').asString := CmpRptCM.ParamValues[10].AsString;
            end;

            if CmpRptCM.ParamValues[3].AsInteger <> 0 then begin
               sqlPlanilhas.ParamByName('PLNPLANILINI').asInteger := CmpRptCM.ParamValues[3].AsInteger;
            end;

            if CmpRptCM.ParamValues[4].AsInteger <> 0 then begin
               sqlPlanilhas.ParamByName('PLNPLANILFIM').asInteger := CmpRptCM.ParamValues[4].AsInteger;
            end;

            if trim(CmpRptCM.ParamValues[7].AsString) <> '0' then begin
               sqlPlanilhas.ParamByName('MODULO').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
            end;
            if trim(CmpRptCM.ParamValues[9].AsString) <> '0' then begin
               sqlPlanilhas.ParamByName('TIPO').AsString := CmpRptCM.ParamValues[9].AsString;
            end;
            if trim(CmpRptCM.ParamValues[8].AsString) <> '0' then begin
               sqlPlanilhas.ParamByName('HIST').asString := CmpRptCM.ParamValues[8].AsString;
            end;
            sqlPlanilhas.Open;
         end;
      end;
   end;
end;

function TrptPlanilhas.VerificaDatas(dDataIni,
  dDataFim: TDateTime): boolean;
begin
   result := true;
   if dDataFim < dDataIni then
      result := false;

end;

procedure TrptPlanilhas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.Sql.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    ' FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[8].LookupSettings.Sql.Text:='SELECT HITCODHIST, HITDESCR1 '+
                                                    '  FROM HISTOPADRAO ' +
                                                    ' WHERE (IDPESSOA= '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    ' ORDER BY HITCODHIST ';

end;

procedure TrptPlanilhas.bndDetPlanilhasBeforeGenerate(Sender: TObject);
begin
  inherited;
  //Configura a máscara das contas contábeis
  if sMascaraContas <> '' then begin
     sMascaraContas := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaParam, cds.FieldByName('PLAGRAU').AsInteger);
     dbtxtContaPlanilhas.DisplayFormat := sMascaraContas + ';0; ';
  end;
  if sMascaraUnidNegoc <> '' then begin
     sMascaraUnidNegoc := FuncaoGeral.CalcMascaraPorGrau(sMascaraUnidNegoc, FuncaoGeral.CalcGrau(sMascaraUnidNegoc, cds.FieldByName('UNECODIGO').asString));
     dbtxtUnidNegocPlanilhas.DisplayFormat := sMascaraUnidNegoc + ';0; ';
  end;
  if sMascaraCCusto <> '' then begin
     sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(sMascaraCCusto, FuncaoGeral.CalcGrau(sMascaraUnidNegoc, cds.FieldByName('CODCENTROCUSTO').asString));
     dbtxtCCustoPlanilhas.DisplayFormat := sMascaraCCusto + ';0; ';
  end;

end;

procedure TrptPlanilhas.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  sqlPlanilhas.Open;
end;

procedure TrptPlanilhas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlPeriodo.Free;
  CtrlRptBalancete.free;
end;

end.
