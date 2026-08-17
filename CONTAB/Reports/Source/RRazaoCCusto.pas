{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
 Desenvolvedor : Taffarel Sevaybriker
 Data          : 25.02.2021
 SOL_Kintana   : SIG113613
 Descrição     : Ajuste na exportação excel para não cortar os dígitos do campo
                 Conta.
--------------------------------------------------------------------------------
 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}

unit RRazaoCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, uCmRptManager, TXComp, CmParamReport,uCmSqlParams,uCtrlRptBalancete, uCtrlPeriodo,
  ppBands, ppClass, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache,
  ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, mask,
  DBClient, Provider, ADODB, uSistema,uCMfileUtils,uCtrlParamIntegra,
  uCMClientDataSet, FCmReport, TXRB, uCtrlContab;

type
  TRptRazaoCCusto = class(TFrmCmReport)
    dsRazaoCCusto: TwwDataSource;
    pplRazaoCCusto: TppBDEPipeline;
    rptRazaoCCusto: TppReport;
    ppHeaderBand18: TppHeaderBand;
    pplblTituloRCCusto: TppLabel;
    ppLine44: TppLine;
    ppLabel14: TppLabel;
    ppLabel21: TppLabel;
    ppLabel65: TppLabel;
    ppLine52: TppLine;
    ppLabel74: TppLabel;
    ppLabel80: TppLabel;
    ppLabel86: TppLabel;
    ppLabel91: TppLabel;
    ppLabel93: TppLabel;
    ppLabel114: TppLabel;
    pplblTituloRCCusto2: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppDBText10: TppDBText;
    ppDBText18: TppDBText;
    ppDBText30: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    dbtxtUnidNegoc: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    dbSumMovConRazCC: TppDBCalc;
    dbtxtSaldoAntRazCC: TppDBText;
    dbtxtSaldoRazCC: TppDBText;
    txtSaldoRazCC: TppLabel;
    txtDebCreRazCC: TppLabel;
    dbtxtMovRazCC: TppDBText;
    dbSumMovCCRazCC: TppDBCalc;
    ppFooterBand18: TppFooterBand;
    ppLine53: TppLine;
    ppLabel124: TppLabel;
    ppLabel133: TppLabel;
    lblContRazCC: TppLabel;
    ppCalc1: TppSystemVariable;
    lblCalcRazCC: TppSystemVariable;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    rptRazaoCCustoLabel1: TppLabel;
    dbtxtCCusto: TppDBText;
    rptRazaoCCustoDBText2: TppDBText;
    rptRazaoCCustoLine1: TppLine;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel140: TppLabel;
    ppLine55: TppLine;
    txtSaldoCCRazCC: TppLabel;
    txtDebCreCCRazCC: TppLabel;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLabel135: TppLabel;                                       dbTxtConta: TppDBText;
    ppLine54: TppLine;
    ppDBText53: TppDBText;
    ppLabel136: TppLabel;
    ppDBText54: TppDBText;
    txtSaldoCabRazCC: TppLabel;
    txtDebCreCabRazCC: TppLabel;
    ppGroupFooterBand11: TppGroupFooterBand;
    rptRazaoCCustoLabel4: TppLabel;
    rptRazaoCCustoDBCalc1: TppDBCalc;
    rptRazaoCCustoDBCalc2: TppDBCalc;
    rptRazaoCCustoLine2: TppLine;
    sqlRazaoCCusto: TCMSqlParams;
    cdsRazaoCCusto: TCMClientDataSet;
    dbTxtContraPartida: TppDBText;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand11AfterGenerate(Sender: TObject);
    procedure ppDetailBand6AfterGenerate(Sender: TObject);
    procedure ppDetailBand6BeforeGenerate(Sender: TObject);
    procedure ppGroupFooterBand9AfterGenerate(Sender: TObject);
    procedure ppFooterBand18BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlRptBalancete : TCtrlRptBalancete;
    CtrlPeriodo      : TCtrlPeriodo;
    CtrlContab       : TCtrlContab;
    sTitulo           : String; 
    sMascara          : String;
    sMascaraCCusto    : String;
    sMascaraUnidNegoc : String;
    bCorresp          : Boolean;
    bContra           : Boolean;
    iPagIni           : Integer;
    function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;

var
  RptRazaoCCusto: TRptRazaoCCusto;

implementation

Uses uCtrlPadroes, uDatabase, DBaseDados, uFuncaoGeral, uString,UMensErro;

{$R *.DFM}

procedure TRptRazaoCCusto.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[18].SpinEditSettings.Value := 1;


   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODEXTERNO AS CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODEXTERNO AS CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[9].LookupSettings.SQL.Text:='SELECT '+
                                                    '   NOMEMODULO, '+
                                                    '   IDMODULO '+
                                                    'FROM '+
                                                    '   MODULO '+
                                                    'ORDER BY NOMEMODULO';

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODSUBCONTA, '+
                                                    '   NOMESUBCONTA '+
                                                    'FROM '+
                                                    '   SUBCONTA '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOMESUBCONTA';


   CmpRptCM.ParamValues[11].LookupSettings.SQL.Text:='SELECT '+
                                                     '   HITCODHIST, '+
                                                     '   HITDESCR1 '+
                                                     'FROM '+
                                                     '   HISTOPADRAO '+
                                                     'WHERE '+
                                                     '   (IDPESSOA='+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                     'ORDER BY HITCODHIST';


   CmpRptCM.ParamValues[1].AsDateTime:=Now;
   CmpRptCM.ParamValues[2].AsDateTime:=Now;

end;

procedure TRptRazaoCCusto.CrmRptCMBeforePrint(Sender: TObject);
var
  sNomeAtivIdade,sNomeModulo,sNomeTipoOper,sNomeHistorico:string;
begin
  inherited;
   Try
      if not ((CmpRptCM.ParamValues[1].AsString = '') or (CmpRptCM.ParamValues[2].AsString = '')) then begin

         ppLabel14.Caption := Sistema.RazaoSocial;

         if VerificaDatas(StrToDate(CmpRptCM.ParamValues[1].AsString), StrToDate(CmpRptCM.ParamValues[2].AsString)) then begin

            If CmpRptCM.ParamValues[19].asString = '' then begin

               //**** faz selects para pegar os captions das combos para sair nos titulos ****
               if CmpRptCM.ParamValues[8].AsString <> '' then begin
                   with sqlTitulos do begin
                       SQL.Clear;
                       SQL.Add('SELECT NOME FROM UNIDNEGOCIO ');
                       SQL.Add('WHERE  (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') ');
                       SQL.Add('  AND  (UNIDNEGOC = '+CmpRptCM.ParamValues[8].asString+') ');
                       Open;
                       sNomeAtividade := cdsTitulos.FieldByName('NOME').asString;
                   end;
               end;

               if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
                   with sqlTitulos do begin
                       SQL.Clear;
                       SQL.Add('SELECT NOMEMODULO FROM  MODULO ');
                       SQL.Add('WHERE (IDMODULO = '+IntToStr(CmpRptCM.ParamValues[9].asInteger)+') ');
                       Open;
                       sNomeModulo := cdsTitulos.FieldByName('NOMEMODULO').asString;
                   end;
               end;

               if CmpRptCM.ParamValues[10].AsString <> '' then begin
                   with sqlTitulos do begin
                       SQL.Clear;
                       SQL.Add('SELECT TIPDESCRICAO FROM TIPOPER ');
                       SQL.Add('WHERE (TIPCODIGO = ' +CmpRptCM.ParamValues[10].AsString+') ');
                       Open;
                       sNomeTipoOper := cdsTitulos.FieldByName('TIPDESCRICAO').asString;
                   end;
               end;

               if CmpRptCM.ParamValues[11].AsString <> '' then begin
                   with sqlTitulos do begin
                       SQL.Clear;
                       SQL.Add('SELECT  HITDESCR1 FROM HISTOPADRAO ');
                       SQL.Add('WHERE (IDPESSOA='+FloatToStr(CrmRptCM.IdEmpresa)+') ');
                       SQL.Add(' AND  (HITCODHIST = '+CmpRptCM.ParamValues[11].AsString +') ');
                       Open;
                       sNomeHistorico := cdsTitulos.FieldByName('HITDESCR1').asString;
                   end;
               end;

               //******************************************************************************
               sTitulo := 'Razão por Centro de Custo - período de ' + CmpRptCM.ParamValues[1].AsString + ' a ' + CmpRptCM.ParamValues[2].AsString;
               pplblTituloRCCusto.caption := sTitulo;

               sTitulo := '';
               if CmpRptCM.ParamValues[3].AsString <> '' then begin
                  sTitulo := sTitulo +  'Conta Inicial : ' + CmpRptCM.ParamValues[3].AsString;
               end;
               if CmpRptCM.ParamValues[4].AsString <> '' then begin
                  sTitulo := sTitulo +  ' Conta Final : ' + CmpRptCM.ParamValues[4].AsString;
               end;
               if CmpRptCM.ParamValues[5].AsString <> '' then begin
                  sTitulo := sTitulo +  ' Centro de Custo Inicial : ' + CmpRptCM.ParamValues[5].AsString;
               end;
               if CmpRptCM.ParamValues[6].AsString <> '' then begin
                  sTitulo := sTitulo +  ' Centro de Custo Final : ' + CmpRptCM.ParamValues[6].AsString;
               end;
               if CmpRptCM.ParamValues[7].AsString <> '' then begin
                  sTitulo := sTitulo +  ' Sub-Conta : ' + CmpRptCM.ParamValues[7].AsString;
               end;
               if CmpRptCM.ParamValues[8].AsString <> '' then begin
                  sTitulo := sTitulo +  '  Atividade/Projeto : ' + sNomeAtividade;
               end;
               if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
                  sTitulo := sTitulo +  ' Módulo : ' + sNomeModulo;
               end;
               if CmpRptCM.ParamValues[10].AsString <> '' then begin
                  sTitulo := sTitulo +  ' Tipo de Operação : ' + sNomeTipoOper;
               end;
               if CmpRptCM.ParamValues[11].AsString <> '' then begin
                  sTitulo := sTitulo +  ' Histórico Padrão : ' + sNomeHistorico;
               end;
               case CmpRptCM.ParamValues[13].asInteger of
                  0: sTitulo := sTitulo +  ' Lançamentos : TODOS';
                  1: sTitulo := sTitulo +  ' Lançamentos : Somente Integrados';
                  2: sTitulo := sTitulo +  ' Lançamentos : Somente NÃO Integrados';
               end;

               pplblTituloRCCusto2.caption := sTitulo;
            end else begin
               pplblTituloRCCusto.caption  := CmpRptCM.ParamValues[19].asString;
               pplblTituloRCCusto2.caption := CmpRptCM.ParamValues[20].asString;
            end;

            //Configura a quebra de página
            rptRazaoCCusto.Groups[0].NewPage := CmpRptCM.ParamValues[16].asBoolean;

            //Configura a máscara das contas contábeis

            sMascara          := '';
            sMascaraCCusto    := '';
            sMascaraUnidNegoc := '';

            bCorresp          := CmpRptCM.ParamValues[15].AsBoolean;
            bContra           := CmpRptCM.ParamValues[17].AsBoolean;

            CtrlContab.SelecionaPlanoData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[1].AsString); //Everson Cunha - SIG102043

            if CmpRptCM.ParamValues[14].AsBoolean then begin
               //sMascara          := ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043
               sMascara          := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
               sMascaraCCusto    := ParamIntegra.MascaraCC;
               sMascaraUnidNegoc := ParamIntegra.MascaraUnidNegoc;
            end;

            iPagIni := CmpRptCM.ParamValues[18].AsInteger;
            CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[1].AsDateTime));

            with sqlRazaoCCusto do begin
               SQL.Clear;
               SQL.Add('SELECT CC.CODEXTERNO,                                             ');
               SQL.Add('   L.PLACONTA|| '' '' AS PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, SC.NOMESUBCONTA, U.UNECODIGO, C.PLAGRAU,  ');
               SQL.Add('   (0) AS SALDOCABECALHO, ('' '') AS DEBCRECABECALHO,               ');
               SQL.Add('   L.PLACONTA|| '' '' AS  PLACONTAREF, ');
               SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,                                        ');
               SQL.Add('   C.PLACONCORRESP, L.IDMODULO, P.PLNEFETIVADO,                       ');
               SQL.Add('   SA.SALDOANT, SS.SALDO, P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA,      ');
               SQL.Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS MOVIMENT,');
               SQL.Add('   (RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''||              ');
               SQL.Add('    RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5)) AS HISTORICO, ');
               SQL.Add('   (TO_CHAR(P.PLNPLANIL)||''/''||TO_CHAR(L.LACNUMLAN)) AS LANCAMENTO, ');
               SQL.Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS DEB,                ');
               SQL.Add('   (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS CRED,               ');
               SQL.Add('   (DECODE(P.PLNEFETIVADO, ''S'', ''*'', '' '')) AS EFET,             ');
               SQL.Add('   (0) AS SALDOCORRENTE,                                              ');
               SQL.Add('   ('' '')  AS DEBCRE, (''                  '') AS CONTRAPARTIDA,     ');
               SQL.Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACNUMLAN,                      ');
               SQL.Add('   L.LACDEBCRE, L.LACNUMDOC, CC.NOME AS NOMECC                        ');
               SQL.Add('FROM                                                                  ');
               SQL.Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA SC, UNIDNEGOCIO U,');

               SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');

               SQL.Add('   CENTCUST CC,                                                       ');
               SQL.Add('   (SELECT                                                            ');
               SQL.Add('       S.PLACONTA, S.CODCENTROCUSTO,                                  ');
               SQL.Add('       SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) -    ');
               SQL.Add('           DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT ');
               SQL.Add('    FROM PLANOSALDO S                                                   ');
               SQL.Add('    WHERE                                                               ');
               SQL.Add('          (S.IDPESSOA =:IDPESSOA) AND                                   ');
               SQL.Add('          (S.IDEMPRESA =:IDPESSOA) AND                                   ');
               SQL.Add('          (S.PEREXERCICIO =:EXERCICIO) AND                              ');
               SQL.Add('          (S.PERNUMERO IS NULL) AND                                     ');
               SQL.Add('          (S.CODCENTROCUSTO IS NOT NULL) AND                            ');
               if CmpRptCM.ParamValues[8].AsString <> '' then begin
                  SQL.Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                                ');
                  SQL.Add('       (S.IDPESSOA =:PESSOA)) AND                                    ');
               end;
               if CmpRptCM.ParamValues[7].AsString <> '' then begin
                  SQL.Add('       ((S.CODSUBCONTA = :SUBCONTAINI) AND                              ');
                  SQL.Add('       (S.IDPESSOA =:PESSOA)) AND                                    ');
               end;
               if CmpRptCM.ParamValues[21].AsString <> '' then begin
                  SQL.Add('      (S.IDPLANOPREV =' + CmpRptCM.ParamValues[21].AsString + ') AND ');
               end;
               if  CmpRptCM.ParamValues[22].AsString <> '' then begin
                  SQL.Add('       (S.IDPATRO =' + CmpRptCM.ParamValues[22].AsString + ') AND        ');
               end;
               SQL.Add('          (S.PLACONTA >=:CONTAINI) AND                   ');
               SQL.Add('          (S.PLACONTA <=:CONTAFIM)                       ');
               SQL.Add('    GROUP BY S.PLACONTA, S.CODCENTROCUSTO                ');
               SQL.Add('    ) SA,                                                ');
               SQL.Add('    (SELECT                                              ');
               SQL.Add('       L.PLACONTA, L.CODCENTROCUSTO,                     ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS SALDO');
               SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                     ');
               SQL.Add('    WHERE (L.PLNCODIGO = P.PLNCODIGO) AND                             ');
               SQL.Add('          (P.IDPESSOA =:IDPESSOA) AND                                 ');
               SQL.Add('          (L.IDEMPRESA =:IDPESSOA) AND                                 ');
               if CmpRptCM.ParamValues[8].AsString <> '' then begin
                  SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                              ');
                  SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                                  ');
               end;
               if CmpRptCM.ParamValues[7].AsString <> '' then begin
                  SQL.Add('       ((L.CODSUBCONTA = :SUBCONTAINI) AND                              ');
                  SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                                    ');
               end;
               if CmpRptCM.ParamValues[21].AsString <> '' then begin
                  SQL.Add('      (L.IDPLANOPREV =' + CmpRptCM.ParamValues[21].AsString + ') AND ');
               end;
               if CmpRptCM.ParamValues[22].AsString <> '' then begin
                  SQL.Add('       (L.IDPATRO =' + CmpRptCM.ParamValues[22].AsString+ ') AND        ');
               end;

               if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
                  SQL.Add('       (L.IDMODULO =:MODULO) AND                                   ');
               end;
               if CmpRptCM.ParamValues[10].AsString <> '' then begin
                  if CmpRptCM.ParamValues[12].AsBoolean then begin
                     SQL.Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                ');
                  end else begin
                     SQL.Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                 ');
                  end;
               end;
               if CmpRptCM.ParamValues[11].AsString <> '' then begin
                  SQL.Add('       (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                    ');
               end;
               if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
                  SQL.Add('       (P.PLNEFETIVADO = ''S'') AND                                ');
               end;
               if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
                  SQL.Add('       ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND  ');
               end;
               SQL.Add('          (L.PLACONTA >= :CONTAINI) AND                 ');
               SQL.Add('          (L.PLACONTA <= :CONTAFIM) AND                 ');
               SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                            ');
               SQL.Add('          (P.PLNDATDIA < :DATAINI)                                    ');
               SQL.Add('    GROUP BY L.PLACONTA, L.CODCENTROCUSTO                             ');
               SQL.Add('    ) SS                                                              ');
               SQL.Add('WHERE                                                                 ');
               if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
                  SQL.Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
               end;
               if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
                  SQL.Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
               end;
               if CmpRptCM.ParamValues[8].AsString <> '' then begin
                  SQL.Add(' ((L.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
                  SQL.Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
               end;
               if CmpRptCM.ParamValues[7].AsString <> '' then begin
                  SQL.Add('      ((L.CODSUBCONTA = :SUBCONTAINI) AND                              ');
                  SQL.Add('      (L.IDPESSOA =:PESSOA)) AND                                    ');
               end;
               if CmpRptCM.ParamValues[21].AsString <> '' then begin
                  SQL.Add('      (L.IDPLANOPREV =' + CmpRptCM.ParamValues[21].AsString + ') AND ');
               end;
               if CmpRptCM.ParamValues[22].AsString <> '' then begin
                  SQL.Add('       (L.IDPATRO =' + CmpRptCM.ParamValues[22].AsString + ') AND        ');
               end;
               if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
                  SQL.Add('    (L.IDMODULO =:MODULO) AND                            ');
               end;
               if CmpRptCM.ParamValues[10].AsString <> '' then begin
                  if CmpRptCM.ParamValues[12].AsBoolean then begin
                     SQL.Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND    ');
                  end else begin
                     SQL.Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND     ');
                  end;
               end;
               if CmpRptCM.ParamValues[11].AsString <> '' then begin
                  SQL.Add(' (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                                          ');
               end;
               SQL.Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
               SQL.Add('    (P.IDPESSOA =:IDPESSOA) AND                                       ');
               SQL.Add('    (CC.IDEMPRESA =:IDPESSOA) AND                                     ');
               SQL.Add('    (C.PLACONTA >= :CONTAINI) AND                                     ');
               SQL.Add('    (C.PLACONTA <= :CONTAFIM) AND                                     ');
               SQL.Add('    ((L.PLANO = C.PLANO) AND                                          ');
               SQL.Add('    (L.PLACONTA = C.PLACONTA)) AND                                    ');

               SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                      ');
               SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                ');

               SQL.Add('    ((L.UNIDNEGOC = U.UNIDNEGOC(+)) AND                               ');
               SQL.Add('    (L.IDPESSOA = U.IDPESSOA(+))) AND                                 ');
               SQL.Add('    (P.PLNCODIGO = L.PLNCODIGO) AND                                   ');
               SQL.Add('    (SA.PLACONTA(+) = L.PLACONTA) AND                                 ');
               SQL.Add('    (SS.PLACONTA(+) = L.PLACONTA) AND                                 ');
               SQL.Add('    (SA.CODCENTROCUSTO(+) = L.CODCENTROCUSTO) AND                     ');

               if CmpRptCM.ParamValues[5].AsString <> '' then
               begin
                  SQL.Add('    (CC.CODEXTERNO >= '+  CmpRptCM.ParamValues[5].AsString + ') AND   ');
                  SQL.Add('    (L.IDEMPRESA = ' + IntToStr ( Sistema.IdEmpresa ) + ') AND ') ;
               end;

               if CmpRptCM.ParamValues[6].AsString <> '' then
               begin
                  SQL.Add('    (CC.CODEXTERNO <= '+  CmpRptCM.ParamValues[6].AsString + ') AND   ');
                  SQL.Add('    (L.IDEMPRESA = ' + IntToStr ( Sistema.IdEmpresa ) + ') AND ') ;
               end;

               SQL.Add('    (SS.CODCENTROCUSTO(+) = L.CODCENTROCUSTO) AND                     ');
               SQL.Add('    (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND                        ');
               SQL.Add('    (L.IDEMPRESA      = CC.IDEMPRESA(+)) AND                             ');
               SQL.Add('    (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                           ');
               SQL.Add('    (L.IDPESSOA    = SC.IDPESSOA(+))                                  ');
               SQL.Add('ORDER BY                                                              ');
               SQL.Add('    L.CODCENTROCUSTO,PLACONTAREF, P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN                ');

               Prepare;

               ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
               ParamByName('DATAINI').asDate      := StrToDate(CmpRptCM.ParamValues[1].AsString);
               ParamByName('DATAFIM').asDate      := StrToDate(CmpRptCM.ParamValues[2].AsString);
               ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;

               if CmpRptCM.ParamValues[3].AsString <> '' then begin
                  ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);
               end else begin
                  ParamByName('CONTAINI').asString := Espaco('0',18);
               end;

               if CmpRptCM.ParamValues[4].AsString <> '' then begin
                  ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[4].AsString,18);
               end else begin
                  ParamByName('CONTAFIM').asString := '999999999999999999';
               end;


               if CmpRptCM.ParamValues[7].AsString <> '' then begin
                  ParamByName('SUBCONTAINI').asInteger:= CmpRptCM.ParamValues[7].AsInteger;
                  ParamByName('PESSOA').asFloat       := CrmRptCM.IdEmpresa;
               end;

               if CmpRptCM.ParamValues[8].AsString <> '' then begin
                  ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[8].AsString);
                  ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
               end;

               if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
                  ParamByName('MODULO').asInteger := CmpRptCM.ParamValues[9].AsInteger;
               end;
               if CmpRptCM.ParamValues[10].AsString <> '' then begin
                  ParamByName('TIPO').asString := CmpRptCM.ParamValues[10].AsString;
               end;
               if CmpRptCM.ParamValues[11].AsString <> '' then begin
                  ParamByName('HIST').asString := CmpRptCM.ParamValues[11].AsString;
               end;

               Open;

            End;
         End;
      End;
   Except
     On E:Exception Do
     Begin
        CMDebugToFile('Erro Relatório Razão:' + (#13+#10) + E.Message );
     End;
   End;

end;

function TRptRazaoCCusto.VerificaDatas(dDataIni,
  dDataFim: TDateTime): boolean;
begin
   //Faz a verificação se a data final é maior que a data inicial
   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

procedure TRptRazaoCCusto.ppGroupHeaderBand11AfterGenerate(
  Sender: TObject);
var rSaldo : Real;
begin
   inherited;
   rSaldo :=0;
   if dbtxtSaldoRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoRazCC.GetText);
   end;
   if dbtxtSaldoAntRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAntRazCC.GetText);
   end;
   if dbSumMovConRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbSumMovConRazCC.GetText);
   end;
   if (dbtxtMovRazCC.GetText <> '')  then begin
      rSaldo := rSaldo - StrToFloat(dbtxtMovRazCC.GetText);
   end;
   if rSaldo > 0 then begin
      txtDebCreCabRazCC.caption := 'D';
   end else begin
      txtDebCreCabRazCC.caption := 'C';
   end;
   txtSaldoCabRazCC.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));
end;

procedure TRptRazaoCCusto.ppDetailBand6AfterGenerate(Sender: TObject);
var rSaldo : real;
begin
   inherited;
   rSaldo :=0;
   if dbtxtSaldoRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoRazCC.GetText);
   end;
   if dbtxtSaldoAntRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAntRazCC.GetText);
   end;
   if dbSumMovConRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbSumMovConRazCC.GetText);
   end;

   if rSaldo > 0 then begin
      txtDebCreRazCC.caption := 'D';
   end else begin
      txtDebCreRazCC.caption := 'C';
   end;
   txtSaldoRazCC.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));

end;

procedure TRptRazaoCCusto.ppDetailBand6BeforeGenerate(Sender: TObject);
var
  sMascarasG :string;
begin
  inherited;
   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      sMascarasG := FuncaoGeral.CalcMascaraPorGrau(sMascara, cdsRazaoCCusto.FieldByName('PLAGRAU').asInteger);
      dbtxtConta.DisplayFormat := sMascarasG + ';0; ';

      if bContra then
         dbtxtContraPartida.DisplayFormat := sMascara + ';0; ';
   end;
   if sMascaraCCusto <> '' then begin
      sMascarasG := FuncaoGeral.CalcMascaraPorGrau(sMascaraCCusto, FuncaoGeral.CalcGrau(sMascaraCCusto, cdsRazaoCCusto.FieldByName('CODCENTROCUSTO').AsString));
      dbtxtCCusto.DisplayFormat := sMascarasG + ';0; ';
   end;
   if sMascaraUnidNegoc <> '' then begin
      sMascarasG := FuncaoGeral.CalcMascaraPorGrau(sMascaraUnidNegoc, FuncaoGeral.CalcGrau(sMascaraUnidNegoc, cdsRazaoCCusto.FieldByName('UNECODIGO').asString));
      dbtxtUnidNegoc.DisplayFormat := sMascarasG + ';0; ';
   end;

end;

procedure TRptRazaoCCusto.ppGroupFooterBand9AfterGenerate(Sender: TObject);
var rSaldo : Real;
begin
  inherited;
   rSaldo :=0;
   if dbtxtSaldoRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoRazCC.GetText);
   end;
   if dbtxtSaldoAntRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAntRazCC.GetText);
   end;
   if dbSumMovCCRazCC.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbSumMovCCRazCC.GetText);
   end;

   if rSaldo > 0 then begin
      txtDebCreCCRazCC.caption := 'D';
   end else begin
      txtDebCreCCRazCC.caption := 'C';
   end;
   txtSaldoCCRazCC.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));

end;

procedure TRptRazaoCCusto.ppFooterBand18BeforePrint(Sender: TObject);
begin
  inherited;
  lblContRazCC.Caption := IntToStr((iPagIni + StrToInt(lblCalcRazCC.text)) - 1);

end;

procedure TRptRazaoCCusto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  //Everson Cunha - SIG102043 - Ini
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
  //Everson Cunha - SIG102043 - Fim
end;

procedure TRptRazaoCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.Free;
  CtrlRptBalancete.Free;
  CtrlContab.free; //Everson Cunha - SIG102043
end;

end.
