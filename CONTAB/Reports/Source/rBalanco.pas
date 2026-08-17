{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}

unit rBalanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,uCtrlRptBalancete,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet,uCtrlContab, TXRB;

type
  TrptBalanco = class(TFrmCmReport)
    dsBalanco: TwwDataSource;
    pplBalanco: TppBDEPipeline;
    cdsBalanco: TCMClientDataSet;
    sqlBalanco: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    rptBalanco: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLblTituloBalo: TppLabel;
    ppLine46: TppLine;
    LblEmpresa: TppLabel;
    ppLabel102: TppLabel;
    ppLine47: TppLine;
    ppLabel105: TppLabel;
    ppLabel109: TppLabel;
    ppLblTituloBalo2: TppLabel;
    bndDetBalanco: TppDetailBand;
    dbtxtContaBalo: TppDBText;
    dbtxtCorrespBalo: TppDBText;
    dbtxtNomeContaBalo: TppDBText;
    dbtxtSaldoBalo: TppDBText;
    dbtxtSaldoDCBalo: TppDBText;
    ppDBText52: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine48: TppLine;
    lblsistema: TppLabel;
    rptBalancoLabel1: TppLabel;
    lblContBalanco: TppLabel;
    ppCalc32: TppSystemVariable;
    lblCalcBalanco: TppSystemVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    procedure ppFooterBand16BeforePrint(Sender: TObject);
    procedure bndDetBalancoBeforeGenerate(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlContab       :TCtrlContab;
    CtrlRptBalancete :TCtrlRptBalancete;

    iPagIni,iNumero,iPlano,iPlanoAtu,iPlanoAnt :integer;
    sTitulo,sSintAnal,sMascara,sContaFinal,sContaInicial,sCCustoInicial,sCCustoFinal :string;
    sPeriodoInicial,sExercicio,sAtividade :string;
    bEspaco,bIndenta   :Boolean;
    procedure OnCalcFields;
  public
    { Public declarations }
  end;

var
  rptBalanco: TrptBalanco;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral,uCtrlParamIntegra,FSM_FxLib;

{$R *.DFM}

//===============================================================
// Esta query foi alterada para colocar o saldo do exercicio
// anterior  (subquery SA) - dia 28/11/2002
//===============================================================
procedure TrptBalanco.ppFooterBand16BeforePrint(Sender: TObject);
begin
  inherited;
   lblContBalanco.Caption := IntToStr((iPagIni + StrToInt(lblCalcBalanco.text)) - 1);

end;

procedure TrptBalanco.bndDetBalancoBeforeGenerate(Sender: TObject);
begin
  inherited;
   //Controla a altura da banda
   if bEspaco then begin
      if (sSintAnal = 'S') or (cdsBalanco.FieldByName('PLATIPO').asString = 'S') then begin
         bndDetBalanco.Height := 23;
         dbtxtContaBalo.top      := 9;
         dbtxtCorrespBalo.top    := 9;
         dbtxtNomeContaBalo.top  := 9;
         dbtxtSaldoBalo.Top      := 9;
         dbtxtSaldoDCBalo.Top    := 9;
      end else begin
         bndDetBalanco.Height := 16;
         dbtxtContaBalo.top      := 2;
         dbtxtCorrespBalo.top    := 2;
         dbtxtNomeContaBalo.top  := 2;
         dbtxtSaldoBalo.Top      := 2;
         dbtxtSaldoDCBalo.Top    := 2;
      end;
      sSintAnal := cdsBalanco.FieldByName('PLATIPO').asString;
   end else begin
      bndDetBalanco.Height := 16;
      dbtxtContaBalo.top      := 2;
      dbtxtCorrespBalo.top    := 2;
      dbtxtNomeContaBalo.top  := 2;
      dbtxtSaldoBalo.Top      := 2;
      dbtxtSaldoDCBalo.Top    := 2;
   end;

   //Configura a máscara das contas contábeis
   if sMascara <> '' then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalanco.FieldByName('PLAGRAU').asInteger);     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalanco.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
      dbtxtContaBalo.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TrptBalanco.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
                                                    '   PERNUMERO, '+
                                                    '   PERNOME, '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY '+
                                                    '   PEREXERCICIO, '+
                                                    '   PERNUMERO ';


   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
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
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[14].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[14].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

end;

procedure TrptBalanco.CrmRptCMBeforePrint(Sender: TObject);
var
  sExercicioAnt  :string;
begin
  inherited;
   if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
      iPlanoAtu := CtrlContab.PlanoParam;

   iPagIni   := CmpRptCM.ParamValues[15].AsInteger;
   iNumero   := FuncaoGeral.CalcNumEleGrau(modulo.sMascaraContas, 1);
   sSintAnal := 'A';

   //=========================================================
   // Pega a data inicial do exercicio anterior
   //=========================================================
   sExercicioAnt := FloatToStr(StrToFloat(CmpRptCM.ParamValues[0].AsString) - 1);

   sqlTitulos.SQL.Clear;
   sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM ');
   sqlTitulos.Sql.Add('FROM PERIODO                                                   ');
   sqlTitulos.Sql.Add('WHERE                                                          ');
   sqlTitulos.Sql.Add('   (IDPESSOA =:IDPESSOA) AND                                   ');
   sqlTitulos.Sql.Add('   (PEREXERCICIO=:PEREXERCICIO) AND                            ');
   sqlTitulos.Sql.Add('   (PERNUMERO=:PERNUMERO)                                      ');
   sqlTitulos.Sql.Add('ORDER BY PERNUMERO                                             ');

   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := StrToInt(sExercicioAnt);
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlTitulos.Open;

   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
       iPlanoAnt := CtrlContab.PlanoData;

   If  iPlanoAnt =  0 then
       iPlanoAnt := iPlanoAtu;
   //==================================================================


   sPeriodoInicial := '';
   //=========================================================
   // Pega nome do mes
   //=========================================================
   sqlTitulos.SQL.Clear;
   sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM ');
   sqlTitulos.Sql.Add('FROM PERIODO                                                   ');
   sqlTitulos.Sql.Add('WHERE                                                          ');
   sqlTitulos.Sql.Add('   (IDPESSOA =:IDPESSOA) AND                                   ');
   sqlTitulos.Sql.Add('   (PEREXERCICIO=:PEREXERCICIO) AND                            ');
   sqlTitulos.Sql.Add('   (PERNUMERO=:PERNUMERO)                                      ');
   sqlTitulos.Sql.Add('ORDER BY PERNUMERO                                             ');

   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;
   //==================================================================
   // Pega o Plano vigente
   //==================================================================
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := iPlanoAtu;
   //=====================================================================

   if CmpRptCM.ParamValues[16].AsString = '' then
   begin
       sExercicio := CmpRptCM.ParamValues[0].AsString;

       if cdsTitulos.isEmpty then begin
          sTitulo := 'Balanço - ' + sPeriodoInicial + '/' + sExercicio;
       end else begin
          sTitulo := 'Balanço Provisório - ' + sPeriodoInicial + '/' + sExercicio;
       end;

      //Imprime os títulos
      pplblTituloBalo.caption := sTitulo;

      sTitulo := '';
      if trim(sCCustoInicial) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                            'FROM  CENTCUST '+
                            'WHERE '+
                            '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                            'ORDER BY CODCENTROCUSTO');
         sqlTitulos.Open;
         sCCustoInicial := cdsTitulos.FieldByName('NOME').asString;
         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sCCustoInicial;
      end;

      if trim(sCCustoFinal) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                            'FROM  CENTCUST '+
                            'WHERE '+
                            '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                            'ORDER BY CODCENTROCUSTO');
         sqlTitulos.Open;
         sCCustoFinal := cdsTitulos.FieldByName('NOME').asString;
         sTitulo := sTitulo +  '     Centro de Custo Final : ' + sCCustoFinal;
      end;

      if trim(sAtividade) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                            'FROM  UNIDNEGOCIO '+
                            'WHERE '+
                            '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                            'ORDER BY UNIDNEGOC');
         sqlTitulos.Open;
         sAtividade := cdsTitulos.FieldByName('NOME').asString;
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + sAtividade;
      end;

      pplblTituloBalo2.caption := sTitulo;

   end else begin
      pplblTituloBalo.caption  := CmpRptCM.ParamValues[16].AsString;
      pplblTituloBalo2.caption := CmpRptCM.ParamValues[17].AsString
   end;

   //Configura a exibiçao da Conta Correspondente
   if CmpRptCM.ParamValues[10].AsBoolean then begin
      dbtxtCorrespBalo.visible := true;
      dbtxtContaBalo.visible   := false;
   end else begin
      dbtxtCorrespBalo.visible := false;
      dbtxtContaBalo.visible   := true;
   end;

   //Configura a quebra de página
   if CmpRptCM.ParamValues[8].AsBoolean then begin
      rptBalanco.Groups[0].NewPage := true;
   end else begin
      rptBalanco.Groups[0].NewPage := false;
   end;

   with sqlBalanco do
   begin
      SQL.Clear;
      SQL.Add('SELECT  /*+ RULE */                                                  ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[9].AsBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,    ');
         if CmpRptCM.ParamValues[12].AsBoolean then
            SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
         else
            SQL.Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
         if CmpRptCM.ParamValues[12].AsBoolean then
            SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
         else
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
      end;
      SQL.Add('   SS.SALDO,                                                     ');
      SQL.Add('   DECODE(SS.SALDO, 0, '' '', DECODE(SIGN(SS.SALDO),             ');
      SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDO,                           ');
      SQL.Add('   ABS(SS.SALDO) as SALDOABS,                                    ');
      SQL.Add('   SA.SALDOANT,                                                  ');
      SQL.Add('   DECODE(SA.SALDOANT, 0, '' '', DECODE(SIGN(SA.SALDOANT),       ');
      SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDOANT,                        ');
      SQL.Add('   ABS(SA.SALDOANT) as SALDOANTABS                               ');
      SQL.Add('FROM                                                             ');
      SQL.Add('    PLANOCONTA C,                                                ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE                                                        ');
      SQL.Add('          (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND      ');
      SQL.Add('          ((PERNUMERO <=' + CmpRptCM.ParamValues[1].AsString+') OR (PERNUMERO IS NULL)) AND ');
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[6].AsString) + ') AND   ');
         SQL.Add('       (IDPESSOA =' + FloatToStr( CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[4].AsString) <> '' then begin
         SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[4].AsString,10)) + ') AND ');
         SQL.Add('       (IDEMPRESA =' + FloatToStr( CrmRptCM.IdEmpresa) + ') AND   ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         SQL.Add('       (IDEMPRESA =' + FloatToStr( CrmRptCM.IdEmpresa) + ') AND                           ');
      end;
      SQL.Add('          (IDPESSOA =' + FloatToStr( CrmRptCM.IdEmpresa) + ') AND ');
      SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
      SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].AsString]), ' ', 18)) + ') AND                  ');
      SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ')                      ');
      SQL.Add('    GROUP BY PLACONTA ) SS,                                   ');
      SQL.Add('                                                              ');
      SQL.Add('   (SELECT                                                    ');
      SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE                                                        ');
      SQL.Add('          (PEREXERCICIO =' + sExercicioAnt + ') AND      ');
      SQL.Add('          ((PERNUMERO <=' + CmpRptCM.ParamValues[1].AsString+') OR (PERNUMERO IS NULL)) AND ');
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[6].AsString) + ') AND   ');
         SQL.Add('       (IDPESSOA =' + FloatToStr( CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      if trim(CmpRptCM.ParamValues[4].AsString) <> '' then begin
         SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[4].AsString,10)) + ') AND ');
         SQL.Add('       (IDEMPRESA =' + FloatToStr( CrmRptCM.IdEmpresa) + ') AND   ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].AsString,10)) + ') AND ');
         SQL.Add('       (IDEMPRESA =' + FloatToStr( CrmRptCM.IdEmpresa) + ') AND                           ');
      end;
      SQL.Add('          (IDPESSOA =' + FloatToStr( CrmRptCM.IdEmpresa) + ') AND ');
      SQL.Add('          (PLANO =' + IntToStr(iPlanoAnt) + ') AND   ');
      SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].AsString]), ' ', 18)) + ') AND                  ');
      SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ')                      ');
      SQL.Add('    GROUP BY PLACONTA ) SA                                    ');
      SQL.Add('                                                              ');
      SQL.Add('WHERE                                                         ');
      SQL.Add('    (C.PLAGRAU <= ' + IntToStr(CmpRptCM.ParamValues[14].AsInteger) + ') AND        ');
      SQL.Add('    (C.PLANO =' + IntToStr(iPlano) + ') AND   ');
      SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
               [CmpRptCM.ParamValues[2].AsString]), ' ', 18)) + ') AND                  ');
      SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
               [CmpRptCM.ParamValues[3].AsString]), ' ', 18)) + ')  AND                 ');

      if CmpRptCM.ParamValues[13].AsBoolean then begin
         SQL.Add(' (C.PLAGRUPO <> ''E'') AND                            ');
      end;
      SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                    ');
      SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                    ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                    ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                          ');
      SQL.Add('    ((DECODE(NVL(SS.SALDO,0),0,''0'',''1'') = ''1'') OR   ');
      SQL.Add('    (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'') = ''1''))  ');
      SQL.Add('ORDER BY                                                 ');
      if CmpRptCM.ParamValues[10].AsBoolean then begin
         SQL.Add(' C.PLACONCORRESP                                      ');
      end else begin
         SQL.Add(' C.PLACONTA                                           ');
      end;

      sMascara := '';
      if CmpRptCM.ParamValues[7].AsBoolean then begin
         //sMascara := modulo.sMascaraContas;     //Everson Cunha - SIG102043
         sMascara := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
      end;

      bEspaco  :=  CmpRptCM.ParamValues[11].AsBoolean;
      bIndenta :=  CmpRptCM.ParamValues[12].AsBoolean;

      Open;

      OnCalcFields;

   end;
end;

procedure TrptBalanco.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
   case Index of
      0: sExercicio     :=Trim(TPainelControles(Sender).CtrlLookup.Text);
      1: sPeriodoInicial:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      2: sContaInicial  :=Trim(TPainelControles(Sender).CtrlLookup.Text);
      3: sContaFinal    :=Trim(TPainelControles(Sender).CtrlLookup.Text);
      4: sCCustoInicial :=Trim(TPainelControles(Sender).CtrlLookup.Text);
      5: sCCustoFinal   :=Trim(TPainelControles(Sender).CtrlLookup.Text);
      6: sAtividade     :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

procedure TrptBalanco.OnCalcFields;
var sEspacos : string;
    i : integer;
begin
      //Gera a label de débito/crédito
      cdsBalanco.First;

      while not cdsBalanco.eof do
      begin

         cdsBalanco.Edit;

         if cdsBalanco.FieldByName('SALDO').asFloat = 0 then begin
            cdsBalanco.FieldByName('DEBCRESALDO').asString := ' ';
         end;
         if cdsBalanco.FieldByName('SALDO').asFloat < 0 then begin
            cdsBalanco.FieldByName('DEBCRESALDO').asString := 'C';
         end else begin
            cdsBalanco.FieldByName('DEBCRESALDO').asString := 'D';
         end;

         if cdsBalanco.FieldByName('SALDOANT').asFloat = 0 then begin
            cdsBalanco.FieldByName('DEBCRESALDOANT').asString := ' ';
         end;
         if cdsBalanco.FieldByName('SALDOANT').asFloat < 0 then begin
            cdsBalanco.FieldByName('DEBCRESALDOANT').asString := 'C';
         end else begin
            cdsBalanco.FieldByName('DEBCRESALDOANT').asString := 'D';
         end;

         //Tira o sinal dos saldos
         cdsBalanco.FieldByName('SALDOABS').asFloat    := ABS(cdsBalanco.FieldByName('SALDO').asFloat);
         cdsBalanco.FieldByName('SALDOANTABS').asFloat := ABS(cdsBalanco.FieldByName('SALDOANT').asFloat);

         //Indenta o Nome da Conta Contábil de acordo com o grau
         sEspacos := '';

         if bIndenta then begin
            for i := 1 to ((cdsBalanco.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
               sEspacos := sEspacos + ' ';
            end;
         end;

         cdsBalanco.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalanco.FieldByName('CONTA').asString);

         cdsBalanco.Next;

      end;

end;

procedure TrptBalanco.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptBalanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlRptBalancete.free;
end;

end.


