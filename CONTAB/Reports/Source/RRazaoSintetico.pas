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

unit RRazaoSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,uCtrlRptBalancete, uCtrlPeriodo,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Wwdatsrc,  uCtrlParamIntegra, TXRB, uCtrlContab;

type
  TRptRazaoSintetico = class(TFrmCmReport)
    dsRazaoSint: TwwDataSource;
    pplRazaoSint: TppBDEPipeline;
    sqlRazaoSint: TCMSqlParams;
    cdsRazaoSint: TCMClientDataSet;
    rptRazaoSint: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLblTituloRSint: TppLabel;
    ppLine35: TppLine;
    LBLEMPRESA: TppLabel;
    ppLabel75: TppLabel;
    ppLine37: TppLine;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLblTituloRSint2: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    bndDetRSint: TppDetailBand;
    ppDBText31: TppDBText;
    ppDBText26: TppDBText;
    ppDBText25: TppDBText;
    dbtxtCCustoRSint: TppDBText;
    ppDBText29: TppDBText;
    dbtxtUnidNegocRSint: TppDBText;
    txtDebCreRazAnal1: TppLabel;
    txtSaldoRazAnal1: TppLabel;
    dbSumMov1: TppDBCalc;
    dbtxtSaldoAnt1: TppDBText;
    dbtxtSaldo1: TppDBText;
    dbtxtMovRazAnal1: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine38: TppLine;
    LBLSISTEMA: TppLabel;
    rptRazaoSintLabel1: TppLabel;
    lblContRazSint: TppLabel;
    ppCalc28: TppSystemVariable;
    lblCalcRazSint: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLine39: TppLine;
    dbtxtContaRSint: TppDBText;
    ppLabel90: TppLabel;
    ppDBText33: TppDBText;
    txtSaldoCabRazAnal1: TppLabel;
    txtDebCreCabRazAnal1: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel92: TppLabel;
    ppLine40: TppLine;
    sqlTitulo: TCMSqlParams;
    cdsTitulo: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure ppGroupHeaderBand5BeforeGenerate(Sender: TObject);
    procedure ppFooterBand14BeforePrint(Sender: TObject);
    procedure bndDetRSintAfterGenerate(Sender: TObject);
    procedure bndDetRSintBeforeGenerate(Sender: TObject);
    procedure ppGroupHeaderBand5AfterGenerate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   CtrlRptBalancete : TCtrlRptBalancete;
   CtrlPeriodo      : TCtrlPeriodo;
   CtrlContab       : TCtrlContab;
   sDataInicial      :string;
   sDataFinal        :string;
   sContaInicial     :string;
   sContaFinal       :string;
   sCustoIni         :string;
   sCustoFim         :string;
   sAtividade        :string;
   sModulo           :string;
   sHistorico        :string;
   sTipoOperacao     :string;
   sSubConta         :string;
   sMascara          :string;
   sMascaraCCusto    :string;
   sMascaraUnidNegoc :string;
   iPagIni           :Integer;
   function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;


var
  RptRazaoSintetico: TRptRazaoSintetico;

implementation

Uses uCtrlPadroes, uDatabase, DBaseDados, uSistema,uFuncaoGeral, uString;

{$R *.DFM}

procedure TRptRazaoSintetico.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   sDataInicial   := '';
   sDataFinal     := '';
   sSubConta      := '';
   sContaInicial  := '';
   sContaFinal    := '';
   sCustoIni      := '';
   sCustoFim      := '';
   sAtividade     := '';
   sModulo        := '';
   sHistorico     := '';
   sTipoOperacao  := '';
   iPagIni        := 1;

   CmpRptCM.ParamValues[16].SpinEditSettings.Value := 1;

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
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
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


   CmpRptCM.ParamValues[10].LookupSettings.SQL.Text:='SELECT '+
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

procedure TRptRazaoSintetico.CrmRptCMBeforePrint(Sender: TObject);
var  sTitulo  : String;

begin
  inherited;

   //Filtra os dados da tela para passar para o relatório
   if not ((CmpRptCM.ParamValues[1].AsString = '') or (CmpRptCM.ParamValues[2].AsString = '')) then
   begin
      LblEmpresa.Caption := sistema.RazaoSocial;

      //Verifica se a data final é maior ou igual à inicial
      if VerificaDatas(CmpRptCM.ParamValues[1].AsDateTime, CmpRptCM.ParamValues[2].AsDateTime) then
      begin
         sDataInicial := CmpRptCM.ParamValues[1].AsString;
         sDataFinal   := CmpRptCM.ParamValues[2].AsString;

         if CmpRptCM.ParamValues[17].AsString = '' then
         begin
            //Imprime os títulos
            sTitulo := 'Razão Sintético - período de ' + sDataInicial + ' a ' + sDataFinal;

            pplblTituloRSint.caption := sTitulo;

            sTitulo := '';
            if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
            begin
               sContaInicial := trim(CmpRptCM.ParamValues[3].AsString);

               sTitulo := sTitulo +  '     Conta Inicial : ' + sContaInicial;
            end;
            if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
            begin
               sContaFinal := trim(CmpRptCM.ParamValues[4].AsString);

               sTitulo := sTitulo +  '     Conta Final : ' + sContaFinal;
            end;
            if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
            begin
               sqlTitulo.SQL.Clear;
               sqlTitulo.SQL.Add('SELECT NOME FROM CENTCUST                  ');
               sqlTitulo.SQL.Add('WHERE (IDEMPRESA = :EMPRESA) AND           ');
               sqlTitulo.SQL.Add('      (CODCENTROCUSTO = :CODCENTROCUSTO)   ');

               sqlTitulo.Prepare;
               sqlTitulo.ParamByName('EMPRESA').asFloat := CrmRptCM.IdEmpresa;
               sqlTitulo.ParamByName('CODCENTROCUSTO').asString := Espaco(CmpRptCM.ParamValues[5].AsString,10);

               sqlTitulo.Open;

               sCustoIni := cdsTitulo.FieldByName('NOME').asString;

               sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sCustoIni;
            end;
            if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
            begin
               sqlTitulo.SQL.Clear;
               sqlTitulo.SQL.Add('SELECT NOME FROM CENTCUST                  ');
               sqlTitulo.SQL.Add('WHERE (IDEMPRESA = :EMPRESA) AND           ');
               sqlTitulo.SQL.Add('      (CODCENTROCUSTO = :CODCENTROCUSTO)   ');

               sqlTitulo.Prepare;
               sqlTitulo.ParamByName('EMPRESA').asFloat := CrmRptCM.IdEmpresa;
               sqlTitulo.ParamByName('CODCENTROCUSTO').asString := Espaco(CmpRptCM.ParamValues[6].AsString,10);

               sqlTitulo.Open;

               sCustoFim := cdsTitulo.FieldByName('NOME').asString;
               sTitulo := sTitulo +  '     Centro de Custo Final : ' + sCustoFim;
            end;
            if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
            begin
               sTitulo := sTitulo +  '     Sub-Conta : ' + CmpRptCM.ParamValues[7].AsString;
            end;
            if trim(CmpRptCM.ParamValues[8].AsString) <> '' then
            begin
               sqlTitulo.SQL.Clear;
               sqlTitulo.SQL.Add('SELECT NOME FROM UNIDNEGOCIO         ');
               sqlTitulo.SQL.Add('WHERE (IDPESSOA  = :PESSOA) AND      ');
               sqlTitulo.SQL.Add('      (UNIDNEGOC = :UNIDNEGOC)       ');

               sqlTitulo.Prepare;
               sqlTitulo.ParamByName('PESSOA').asFloat :=  CrmRptCM.IdEmpresa;
               sqlTitulo.ParamByName('UNIDNEGOC').asFloat := StrToFloat(CmpRptCM.ParamValues[8].AsString);

               sqlTitulo.Open;

               sAtividade := cdsTitulo.FieldByName('NOME').asString;
               sTitulo := sTitulo +  '     Atividade/Projeto : ' + sAtividade;
            end;
            if CmpRptCM.ParamValues[9].AsInteger <> 0 then
            begin
               sqlTitulo.SQL.Clear;
               sqlTitulo.SQL.Add('SELECT NOMEMODULO FROM MODULO    ');
               sqlTitulo.SQL.Add('WHERE (IDMODULO  = :MODULO)        ');

               sqlTitulo.Prepare;
               sqlTitulo.ParamByName('MODULO').asInteger := CmpRptCM.ParamValues[9].AsInteger;
               sqlTitulo.Open;

               sModulo := cdsTitulo.FieldByName('NOMEMODULO').asString;

               sTitulo := sTitulo +  '     Módulo : ' + sModulo;
            end;
            if CmpRptCM.ParamValues[11].AsInteger <> 0 then
            begin
               sqlTitulo.SQL.Clear;
               sqlTitulo.SQL.Add('SELECT  TIPDESCRICAO FROM TIPOPER   ');
               sqlTitulo.SQL.Add('WHERE (TIPCODIGO   = :TIPCODIGO )   ');

               sqlTitulo.Prepare;
               sqlTitulo.ParamByName('TIPCODIGO ').asInteger := CmpRptCM.ParamValues[11].AsInteger;
               sqlTitulo.Open;

               sTipoOperacao := cdsTitulo.FieldByName('TIPDESCRICAO').asString;

               sTitulo := sTitulo +  '     Tipo de Operação : ' + sTipoOperacao;
            end;
            if trim(CmpRptCM.ParamValues[10].AsString) <> '' then begin
               sTitulo := sTitulo +  '     Histórico Padrão : ' + sHistorico;
            end;
            case CmpRptCM.ParamValues[13].AsInteger of
               0: sTitulo := sTitulo +  '    Lançamentos : TODOS';
               1: sTitulo := sTitulo +  '    Lançamentos : Somente Integrados';
               2: sTitulo := sTitulo +  '    Lançamentos : Somente NÃO Integrados';
            end;

            pplblTituloRSint2.caption := sTitulo;
         end else begin
            pplblTituloRSint.caption  := CmpRptCM.ParamValues[17].AsString;
            pplblTituloRSint2.caption := CmpRptCM.ParamValues[18].AsString;
         end;

         //Configura a quebra de página
         rptRazaoSint.Groups[0].NewPage := CmpRptCM.ParamValues[15].AsBoolean;

         //Configura a máscara das contas contábeis
         sMascara          := '';
         sMascaraCCusto    := '';
         sMascaraUnidNegoc := '';

         CtrlContab.SelecionaPlanoData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[1].AsString); //Everson Cunha - SIG102043

         if CmpRptCM.ParamValues[14].AsBoolean then begin
            //sMascara          := ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043
            sMascara          := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
            sMascaraCCusto    := ParamIntegra.MascaraCC;
            sMascaraUnidNegoc := ParamIntegra.MascaraUnidNegoc;
         end;

         iPagIni := CmpRptCM.ParamValues[16].AsInteger;
         CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[1].AsDateTime));

         //Faz a query
         with sqlRazaoSint do
         begin
            SQL.Clear;
            SQL.Add('SELECT                                                                ');
            SQL.Add('   L.PLACONTA || '' '' AS PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, SC.NOMESUBCONTA, U.UNECODIGO, C.PLAGRAU,    ');
            SQL.Add('  (0) AS SALDOCABECALHO, ('' '') AS DEBCRECABECALHO,                  ');
            SQL.Add('   L.PLACONTA|| '' '' AS  PLACONTAREF, ');
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,                                           ');
            SQL.Add('   C.PLACONCORRESP, L.IDMODULO, P.PLNEFETIVADO,                       ');
            SQL.Add('   SA.SALDOANT, SS.SALDO,                                             ');
            SQL.Add('   SUM((DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1))))) AS MOVIMENT,');
            SQL.Add('   SUM((DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0))) AS DEB,                       ');
            SQL.Add('   SUM((DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0))) AS CRED,                      ');
            SQL.Add('   (0) AS SALDOCORRENTE,                                               ');
            SQL.Add('   ('' '')  AS DEBCRE, (''                  '') AS CONTRAPARTIDA,      ');
            SQL.Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, M.NOMEMODULO                       ');
            SQL.Add('FROM                                                                   ');
            SQL.Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA SC, UNIDNEGOCIO U, MODULO M, ');

            SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');

            SQL.Add('   (SELECT                                                             ');
            SQL.Add('       S.PLACONTA,                                                     ');
            SQL.Add('       SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) -    ');
            SQL.Add('           DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT ');
            SQL.Add('    FROM PLANOSALDO S                                                     ');
            SQL.Add('    ,SUBCONTA SC                                                          ');
            SQL.Add('    WHERE                                                                 ');
            SQL.Add('       (S.IDPESSOA =:IDPESSOA) AND                                     ');
            SQL.Add('	    (S.PEREXERCICIO =:EXERCICIO) AND                                ');
            SQL.Add('       (S.PERNUMERO IS NULL) AND                                       ');
            SQL.Add('       (S.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                            ');
            SQL.Add('       (S.IDPESSOA    = SC.IDPESSOA(+)) AND                               ');
            if CmpRptCM.ParamValues[5].AsString <> '' then begin
               SQL.Add('       (S.CODCENTROCUSTO >=:CCUSTOINI) AND             ');
               SQL.Add('       (S.IDEMPRESA =:EMPRESA) AND                     ');
            end;
            if CmpRptCM.ParamValues[6].AsString <> '' then begin
               SQL.Add('       (S.CODCENTROCUSTO <=:CCUSTOFIM) AND             ');
               SQL.Add('       (S.IDEMPRESA =:EMPRESA) AND                     ');
            end;
            if CmpRptCM.ParamValues[7].AsString <> '' then begin
               SQL.Add('       ((S.CODSUBCONTA = :SUBCONTA) AND                              ');
               SQL.Add('       (S.IDPESSOA =:PESSOA)) AND                                    ');
            end;
            if CmpRptCM.ParamValues[8].AsString <> '' then begin
               SQL.Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                                ');
               SQL.Add('       (S.IDPESSOA =:PESSOA)) AND                                    ');
            end;
            SQL.Add('          (S.PLACONTA >=:CONTAINI) AND                                ');
            SQL.Add('          (S.PLACONTA <=:CONTAFIM)                                    ');
            SQL.Add('    GROUP BY S.PLACONTA                                                 ');
            SQL.Add('    ) SA,                                                             ');
            SQL.Add('   (SELECT                                                            ');
            SQL.Add('       L.PLACONTA,                                                    ');
            SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS SALDO');
            SQL.Add('    FROM PLANILHA P, LANCAMENTO L, SUBCONTA SC                                     ');
            SQL.Add('    WHERE (L.PLNCODIGO = P.PLNCODIGO) AND                             ');
            SQL.Add('          (P.IDPESSOA =:IDPESSOA) AND                                 ');
            SQL.Add('       (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                               ');
            SQL.Add('       (L.IDPESSOA = SC.IDPESSOA(+)) AND                               ');
            if CmpRptCM.ParamValues[5].AsString <> '' then begin
               SQL.Add('       (L.CODCENTROCUSTO >= :CCUSTOINI) AND           ');
               SQL.Add('       (L.IDEMPRESA =:EMPRESA) AND                    ');
            end;
            if CmpRptCM.ParamValues[6].AsString <> '' then begin
               SQL.Add('       (L.CODCENTROCUSTO <= :CCUSTOFIM) AND           ');
               SQL.Add('       (L.IDEMPRESA =:EMPRESA) AND                    ');
            end;
            if CmpRptCM.ParamValues[7].AsString <> '' then begin
               SQL.Add('       ((L.CODSUBCONTA >= :SUBCONTA) AND                              ');
               SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                                    ');
            end;
            if CmpRptCM.ParamValues[8].AsString <> '' then begin
               SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                              ');
               SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                                  ');
            end;
            if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
               SQL.Add('       (L.IDMODULO =:MODULO) AND                                   ');
            end;
            if CmpRptCM.ParamValues[11].AsInteger <> 0 then begin
               if CmpRptCM.ParamValues[12].AsBoolean then begin
                  SQL.Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                     ');
               end else begin
                  SQL.Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                     ');
               end;
            end;
            if CmpRptCM.ParamValues[10].AsString <> '' then begin
               SQL.Add('       (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                ');
            end;
            if CmpRptCM.ParamValues[13].AsInteger = 1 then begin
               SQL.Add('       (P.PLNEFETIVADO = ''S'') AND                                ');
            end;
            if CmpRptCM.ParamValues[13].AsInteger = 2 then begin
               SQL.Add('       ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND  ');
            end;
            SQL.Add('          (L.PLACONTA >= :CONTAINI) AND                 ');
            SQL.Add('          (L.PLACONTA <= :CONTAFIM) AND                 ');
            SQL.Add('	       (P.PEREXERCICIO =:EXERCICIO) AND                            ');
            SQL.Add('          (P.PLNDATDIA < :DATAINI)                                    ');
            SQL.Add('    GROUP BY L.PLACONTA                                               ');
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
               SQL.Add('       ((L.CODSUBCONTA >= :SUBCONTA) AND                              ');
               SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                                    ');
            end;
            if CmpRptCM.ParamValues[5].AsString <> '' then begin
               SQL.Add('    (L.CODCENTROCUSTO >= :CCUSTOINI) AND              ');
               SQL.Add('    (L.IDEMPRESA =:EMPRESA) AND                       ');
            end;
            if CmpRptCM.ParamValues[6].AsString <> '' then begin
               SQL.Add('    (L.CODCENTROCUSTO <= :CCUSTOFIM) AND              ');
               SQL.Add('    (L.IDEMPRESA =:EMPRESA) AND                       ');
            end;
            if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
               SQL.Add(' (L.IDMODULO =:MODULO) AND                                         ');
            end;
            if CmpRptCM.ParamValues[11].AsInteger <> 0 then begin
               if CmpRptCM.ParamValues[12].AsBoolean then begin
                  SQL.Add('       (RTRIM(L.TIPCODIGO) <> RTRIM(:TIPO)) AND                     ');
               end else begin
                  SQL.Add('       (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) AND                     ');
               end;
            end;
            if CmpRptCM.ParamValues[10].AsString <> '' then begin
               SQL.Add(' (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) AND                                          ');
            end;
            SQL.Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
            SQL.Add('    (P.IDPESSOA =:IDPESSOA) AND                                       ');
            SQL.Add('    (C.PLACONTA >= :CONTAINI) AND                                     ');
            SQL.Add('    (C.PLACONTA <= :CONTAFIM) AND                                     ');
            SQL.Add('    ((L.PLANO = C.PLANO) AND                                          ');
            SQL.Add('    (L.PLACONTA = C.PLACONTA)) AND                                    ');

            SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                       ');
            SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                 ');

            SQL.Add('    ((L.UNIDNEGOC = U.UNIDNEGOC(+)) AND                               ');
            SQL.Add('    (L.IDPESSOA = U.IDPESSOA(+))) AND                                 ');
            SQL.Add('    (P.PLNCODIGO = L.PLNCODIGO) AND                                   ');
            SQL.Add('    (P.IDMODULO = M.IDMODULO) AND                                     ');
            SQL.Add('    (SA.PLACONTA(+) = L.PLACONTA) AND                                 ');
            SQL.Add('    (SS.PLACONTA(+) = L.PLACONTA) AND                                 ');
            SQL.Add('    (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                           ');
            SQL.Add('    (L.IDPESSOA    = SC.IDPESSOA(+))                                  ');
            SQL.Add('GROUP BY                                                              ');
            SQL.Add('   L.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), SC.NOMESUBCONTA, U.UNECODIGO, C.PLAGRAU,    ');
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME),                                                         ');
            SQL.Add('   C.PLACONCORRESP, L.IDMODULO, P.PLNEFETIVADO,                       ');
            SQL.Add('   SA.SALDOANT, SS.SALDO,                                             ');
            SQL.Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, M.NOMEMODULO                      ');
            SQL.Add('ORDER BY                                                              ');
            SQL.Add('   L.PLACONTA, L.CODCENTROCUSTO                                       ');

            sqlRazaoSint.Prepare;
            sqlRazaoSint.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
            sqlRazaoSint.ParamByName('DATAINI').asDate      := CmpRptCM.ParamValues[1].AsDateTime;
            sqlRazaoSint.ParamByName('DATAFIM').asDate      := CmpRptCM.ParamValues[2].AsDateTime;
            sqlRazaoSint.ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;

            if CmpRptCM.ParamValues[3].AsString <> '' then begin
               sqlRazaoSint.ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);
            end else begin
               sqlRazaoSint.ParamByName('CONTAINI').asString := Espaco('0',18);
            end;

            if CmpRptCM.ParamValues[4].AsString <> '' then begin
               sqlRazaoSint.ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[4].AsString,18);
            end else begin
               sqlRazaoSint.ParamByName('CONTAFIM').asString := '999999999999999999';
            end;

            if CmpRptCM.ParamValues[5].AsString <> '' then begin
               sqlRazaoSint.ParamByName('CCUSTOINI').asString := Espaco(CmpRptCM.ParamValues[5].AsString,10);
               sqlRazaoSint.ParamByName('EMPRESA').asFloat    := CrmRptCM.IdEmpresa;
            end;

            if CmpRptCM.ParamValues[6].AsString <> '' then begin
               sqlRazaoSint.ParamByName('CCUSTOFIM').asString := Espaco(CmpRptCM.ParamValues[6].AsString,10);
               sqlRazaoSint.ParamByName('EMPRESA').asFloat    := CrmRptCM.IdEmpresa;
            end;

            if CmpRptCM.ParamValues[7].AsString <> '' then begin
               sqlRazaoSint.ParamByName('SUBCONTA').asInteger:= StrToInt(CmpRptCM.ParamValues[7].AsString);
               sqlRazaoSint.ParamByName('PESSOA').asFloat    := CrmRptCM.IdEmpresa;
            end;
            if CmpRptCM.ParamValues[8].AsString <> '' then begin
               sqlRazaoSint.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[8].AsString);
               sqlRazaoSint.ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
            end;

            if CmpRptCM.ParamValues[9].AsInteger <> 0 then begin
               sqlRazaoSint.ParamByName('MODULO').asInteger := CmpRptCM.ParamValues[9].AsInteger;
            end;
            if CmpRptCM.ParamValues[11].AsInteger <> 0 then begin
               sqlRazaoSint.ParamByName('TIPO').asString := IntToStr(CmpRptCM.ParamValues[11].AsInteger);
            end;
            if CmpRptCM.ParamValues[10].AsString <> '' then begin
               sqlRazaoSint.ParamByName('HIST').asString := CmpRptCM.ParamValues[10].AsString;
            end;
            sqlRazaoSint.Open;
         end;
      end;
   end;

end;

procedure TRptRazaoSintetico.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
   case Index of
      1: sDataInicial :=TPainelControles(Sender).CtrlDateTimePicker.Text;
      2: sDataFinal   :=TPainelControles(Sender).CtrlDateTimePicker.Text;
      3: sContaInicial:=TPainelControles(Sender).CtrlLookup.Text;
      4: sContaFinal  :=TPainelControles(Sender).CtrlLookup.Text;
      5: sCustoIni    :=TPainelControles(Sender).CtrlLookup.Text;
      6: sCustoFim    :=TPainelControles(Sender).CtrlLookup.Text;
      7: sSubConta    :=TPainelControles(Sender).CtrlLookup.Text;
      8: sAtividade   :=TPainelControles(Sender).CtrlLookup.Text;
      9: sModulo      :=TPainelControles(Sender).CtrlLookup.Text;
     10: sHistorico   :=TPainelControles(Sender).CtrlLookup.Text;
     11: sTipoOperacao:=TPainelControles(Sender).CtrlLookup.Text;

   end;

end;

function TRptRazaoSintetico.VerificaDatas(dDataIni,
  dDataFim: TDateTime): boolean;
begin
   result := true;
   if dDataFim < dDataIni then
      result := false;

end;

procedure TRptRazaoSintetico.ppGroupHeaderBand5BeforeGenerate(
  Sender: TObject);
begin
  inherited;
   if (sMascara <> '') then
   begin
       sMascara := FuncaoGeral.CalcMascaraPorGrau(sMascara,cdsRazaoSint.FieldByName('PLAGRAU').asInteger);
       dbtxtContaRSint.DisplayFormat := sMascara + ';0; ';
   end;

   if (sMascaraCCusto <> '') then
   begin
     sMascara := FuncaoGeral.CalcMascaraPorGrau(sMascaraCCusto,FuncaoGeral.CalcGrau(sMascaraCCusto,
                                  cdsRazaoSint.FieldByName('CODCENTROCUSTO').asString));
     dbtxtCCustoRSint.DisplayFormat := sMascara + ';0; ';
   end;

   if (sMascaraUnidNegoc <> '') then
   begin
     sMascara := FuncaoGeral.CalcMascaraPorGrau(sMascaraUnidNegoc,FuncaoGeral.CalcGrau(sMascaraUnidNegoc,
                                     cdsRazaoSint.FieldByName('UNECODIGO').asString));
     dbtxtUnidNegocRSint.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TRptRazaoSintetico.ppFooterBand14BeforePrint(Sender: TObject);
begin
  inherited;
   lblContRazSint.Caption := IntToStr((iPagIni + StrToInt(lblCalcRazSint.text)) - 1);

end;

procedure TRptRazaoSintetico.bndDetRSintAfterGenerate(Sender: TObject);
var rSaldo: real;
begin
   inherited;

   rSaldo :=0;
   if dbtxtSaldo1.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldo1.GetText);
   end;
   if dbtxtSaldoAnt1.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAnt1.GetText);
   end;
   if dbSumMov1.GetText <> '' then begin
      rSaldo := rSaldo + StrToFloat(dbSumMov1.GetText);
   end;

   if rSaldo > 0 then begin
      txtDebCreRazAnal1.caption := 'D';
   end else begin
      txtDebCreRazAnal1.caption := 'C';
   end;
   txtSaldoRazAnal1.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));



end;

procedure TRptRazaoSintetico.bndDetRSintBeforeGenerate(Sender: TObject);
begin
   inherited;

   //Configura a máscara das contas contábeis
   if sMascara <> '' then begin
      sMascara := FuncaoGeral.CalcMascaraPorGrau(sMascara, cdsRazaoSint.FieldByName('PLAGRAU').asInteger);
      dbtxtContaRSint.DisplayFormat := sMascara + ';0; ';
   end;
   if sMascaraCCusto <> '' then begin
      sMascara := FuncaoGeral.CalcMascaraPorGrau(sMascaraCCusto, FuncaoGeral.CalcGrau(sMascaraCCusto, cdsRazaoSint.FieldByName('CODCENTROCUSTO').asString));
      dbtxtCCustoRSint.DisplayFormat := sMascara + ';0; ';
   end;
   if sMascaraUnidNegoc <> '' then begin
      sMascara := FuncaoGeral.CalcMascaraPorGrau(sMascaraUnidNegoc, FuncaoGeral.CalcGrau(sMascaraUnidNegoc, cdsRazaoSint.FieldByName('UNECODIGO').asString));
      dbtxtUnidNegocRSint.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TRptRazaoSintetico.ppGroupHeaderBand5AfterGenerate(
  Sender: TObject);
var rSaldo2 : Double;
begin
  inherited;
   //=========
   rSaldo2 :=0;
   if dbtxtSaldo1.GetText <> '' then begin
      rSaldo2 := rSaldo2 + StrToFloat(dbtxtSaldo1.GetText);
   end;
   if dbtxtSaldoAnt1.GetText <> '' then begin
      rSaldo2 := rSaldo2 + StrToFloat(dbtxtSaldoAnt1.GetText);
   end;
   if dbSumMov1.GetText <> '' then begin
      rSaldo2 := rSaldo2 + StrToFloat(dbSumMov1.GetText);
   end;
   if (dbtxtMovRazAnal1.GetText <> '')  then begin
      rSaldo2 := rSaldo2 - StrToFloat(dbtxtMovRazAnal1.GetText);
   end;
   if rSaldo2 > 0 then begin
      txtDebCreCabRazAnal1.caption := 'D';
   end else begin
      txtDebCreCabRazAnal1.caption := 'C';
   end;
   txtSaldoCabRazAnal1.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo2));

end;

procedure TRptRazaoSintetico.FormCreate(Sender: TObject);
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

procedure TRptRazaoSintetico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.Free;
  CtrlRptBalancete.Free;
  CtrlContab.free; //Everson Cunha - SIG102043
end;

end.
