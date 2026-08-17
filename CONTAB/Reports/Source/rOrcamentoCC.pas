Unit rOrcamentoCC;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, uCtrlRptBalancete,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCtrlContab, uCmSqlParams, uCMClientDataSet, UCMFILEUTILS,
  ppRegion, TXRB;

type
  TrptOrcamentoCC = class(TFrmCmReport)
    dsOrcamentoCC: TwwDataSource;
    pplOrcamentoCC: TppBDEPipeline;
    rptOrcamentoCC: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLblTituloOrcamento: TppLabel;
    ppLine27: TppLine;
    lblempresa: TppLabel;
    txtContaOrc: TppLabel;
    ppLine28: TppLine;
    txtNomeContaOrc: TppLabel;
    ppLblTituloOrcamento2: TppLabel;
    txtReal: TppLabel;
    txtPeriodo: TppLabel;
    txtAcumulado: TppLabel;
    txtOrc: TppLabel;
    txtVar: TppLabel;
    txtRealAcu: TppLabel;
    txtOrcAcu: TppLabel;
    txtVarAcu: TppLabel;
    bndDetOrcamento: TppDetailBand;
    dbtxtContaOrc: TppDBText;
    dbtxtCorrespOrc: TppDBText;
    dbtxtNomeContaOrc: TppDBText;
    dbtxtVarPer: TppDBText;
    dbtxtRealPerOrc: TppDBText;
    dbtxtDCRealPerOrc: TppDBText;
    ppDBText20: TppDBText;
    dbtxtOrcPerOrc: TppDBText;
    dbtxtDCOrcPerOrc: TppDBText;
    txtVarPer: TppLabel;
    txtVarAcum: TppLabel;
    dbtxtVarAcum: TppDBText;
    dbtxtDCOrcAcumOrc: TppDBText;
    dbtxtOrcAcumOrc: TppDBText;
    dbtxtReaLAcumOrc: TppDBText;
    dbtxtDCRealAcumOrc: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine29: TppLine;
    lblsistema: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    cdsOrcamentoCC: TCMClientDataSet;
    cdsPerAux: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    cdsSaldoOrc: TCMClientDataSet;
    sqlSaldoOrc: TCMSqlParams;
    sqlSaldoRea: TCMSqlParams;
    cdsSaldoRea: TCMClientDataSet;
    sqlSaldoEncer: TCMSqlParams;
    cdsSaldoEncer: TCMClientDataSet;
    sqlOrcamentoCC: TCMSqlParams;
    cdsAnaliticos: TCMClientDataSet;
    sqlAnaliticos: TCMSqlParams;
    cdsCContabSinteticos: TCMClientDataSet;
    sqlCContabSinteticos: TCMSqlParams;
    sqlCCustoSinteticos: TCMSqlParams;
    cdsCCustoSinteticos: TCMClientDataSet;
    ppGroup1: TppGroup;
    GrpHeadSintetico: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCODCCUSTO: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel1: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel2: TppLabel;
    rptOrcamentoCCLabel100: TppLabel;
    rptOrcamentoCCLabel101: TppLabel;
    rptOrcamentoCCLabel102: TppLabel;
    rptOrcamentoCCLabel103: TppLabel;
    lblCCustoDesc: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    rptOrcamentoCCLabel9: TppLabel;
    rptOrcamentoCCLabel10: TppLabel;
    rptOrcamentoCCLabel11: TppLabel;
    rptOrcamentoCCLabel12: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    rgSintetico: TppRegion;
    ppLabel3: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppHeaderBand10BeforePrint(Sender: TObject);
    procedure bndDetOrcamentoBeforeGenerate(Sender: TObject);
    procedure bndDetOrcamentoBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMAfterExecute(ActionExecute: TActionExecute);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure GrpHeadSinteticoBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure GrpHeadSinteticoBeforeGenerate(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
  private
    CtrlContab       : TCtrlContab;
    CtrlRptBalancete : TCtrlRptBalancete;

    sTitulo,sMascara,sMascaraCCusto,
    sTipoOperResult,sSintAnal,sGrau,
    sPeriodoInicial,sPeriodoInicialIngles : string;
    dtPerDataFim :TDateTime;
    iNumero,iPlano :Integer;
    rMovExer, rSalExer: Double;
    bValores,bCodigo,bIngles,bIndenta,bEspaco  : Boolean;

    cc_nome : String;
    cc_totrealabs, cc_totorcabs, cc_totsrealabs, cc_totsorcabs : Double;
    cc_totrealabsT, cc_totorcabsT, cc_totsrealabsT, cc_totsorcabsT,x1,x2,x3,x4 : Double;

    procedure MontaQuerySinteticos;
    procedure OnCalcField;
  public
    { Public declarations }
  end;

var
  rptOrcamentoCCCC: TrptOrcamentoCC;

implementation

uses uMensErro, uDatabase, DBaseDados, uString, uModulo, uData, uFuncaoGeral,
     uCtrlParamIntegra, rOrcamento;

{$R *.DFM}

procedure TrptOrcamentoCC.FormCreate(Sender: TObject);
begin
   inherited;
   Application.ProcessMessages;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer,
                         True, nil, nil, False);
end;
//========================================================================================
procedure TrptOrcamentoCC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   CtrlContab.free;
end;
//========================================================================================
procedure TrptOrcamentoCC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[12].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[12].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

end;
//========================================================================================
procedure TrptOrcamentoCC.CmpRptCMAfterExecute(ActionExecute: TActionExecute);
var
   iGrau : Integer;
begin
   inherited;
   try
      iGrau:=CmpRptCM.ParamValues[12].AsInteger;
    except
      iGrau:=0;
    end;
   if (iGrau=0) then
      sGrau:=IntToStr(FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano))
   else
      sGrau:=IntToStr(iGrau);

end;
//========================================================================================
procedure TrptOrcamentoCC.MontaQuerySinteticos;
begin
   with SqlCContabSinteticos do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT PC.PLANO, PC.PLACONTA, PC.PLATIPO, PC.PLAGRAU, PC.PLACONCORRESP, ');
      if CmpRptCM.ParamValues[11].AsBoolean then
         SQL.Add('   PC.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME, NULL, PC.PLANOME, PD.PLANOME) AS PLANOME, PC.PLANOMEOUTLING ')
      else
         SQL.Add('   DECODE(PD.PLANOME, NULL, PC.PLANOME, PD.PLANOME) AS CONTA, PC.PLANOMEOUTLING, DECODE(PD.PLANOME, NULL, PC.PLANOME, PD.PLANOME) AS PLANOME ');
      SQL.Add(' FROM PLANOCONTA PC,     ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD ');
      SQL.Add(' WHERE (PC.PLANO    = :PLANO)  ');
      SQL.Add('   AND (SUBSTR(PC.PLACONTA,1,1) = :PLACONTABASE) ');
      SQL.Add('   AND (PC.PLATIPO = ''S'') ');
      SQL.Add('   AND (PD.PLACONTA(+) = PC.PLACONTA) ');
      SQL.Add('   AND (PD.PLANO(+)    =  PC.PLANO)   ');
      SQL.Add(' ORDER BY PLACONTA ');
      Prepare;
   end;
end;
//========================================================================================
procedure TrptOrcamentoCC.CrmRptCMBeforePrint(Sender: TObject);
Var
   iPos                  : TBookMark;
   sCCusto, sCCustoNome,
   sCContab              : String;
   fReal, fOrc,
   fSaldoReal, fSaldoOrc : Double;
   iTam                  : Integer;

begin
   inherited;
   cc_totrealabsT   := 0;
   cc_totorcabsT    := 0;
   cc_totsrealabsT  := 0;
   cc_totsorcabsT   := 0;
   x1 := 0;
   x2 := 0;
   x3 := 0;
   x4 := 0;

   if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
   begin
      sTipoOperResult := CtrlContab.TipoOpEncer;
   end else
   begin
      sTipoOperResult := '';
   end;
   //-------------------------------------------------------------------------------------
   iPlano      := Modulo.iPlano;
   sSintAnal   := 'A';
   //-------------------------------------------------------------------------------------
   // Tratamento de titulos
   //-------------------------------------------------------------------------------------
   if CmpRptCM.ParamValues[18].AsString = '' then
   begin
      sPeriodoInicial       := '';
      sPeriodoInicialIngles := '';
      //----------------------------------------------------------------------------------
      // Pega nome do mes
      //----------------------------------------------------------------------------------
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM ');
      sqlTitulos.Sql.Add('FROM PERIODO                                                   ');
      sqlTitulos.Sql.Add('WHERE                                                          ');
      sqlTitulos.Sql.Add('   (IDPESSOA =:IDPESSOA) AND                                   ');
      sqlTitulos.Sql.Add('   (PEREXERCICIO=:PEREXERCICIO) AND                            ');
      sqlTitulos.Sql.Add('   (PERNUMERO=:PERNUMERO)                                      ');
      sqlTitulos.Sql.Add('ORDER BY PERNUMERO                                             ');
      //----------------------------------------------------------------------------------
      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
      sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
      sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[1].AsInteger;
      sqlTitulos.Open;
      sPeriodoInicial       := cdsTitulos.FieldByName('PERNOME').asString;
      sPeriodoInicialIngles := cdsTitulos.FieldByName('PERNOMEOUTLING').asString;
      dtPerDataFim          := cdsTitulos.FieldByName('PERDATFIM').asDateTime;
      //----------------------------------------------------------------------------------
      with sqlPerAux do
      begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].asString);
         ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].asString);
         Open;
         //-------------------------------------------------------------------------------
         if cdsPerAux.isEmpty then
         begin
            if CmpRptCM.ParamValues[11].asBoolean then
            begin
               sTitulo := 'Budgeted x Actual - ' + sPeriodoInicialIngles + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end else
            begin
               sTitulo := 'Orçado x Realizado - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end;
         end else
         //-------------------------------------------------------------------------------
         begin
            if CmpRptCM.ParamValues[11].asBoolean then
            begin
               sTitulo := 'Budgeted x Actual Partial - ' + sPeriodoInicialIngles + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end else
            begin
               sTitulo := 'Orçado x Realizado Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      pplblTituloOrcamento.caption := sTitulo;
      sTitulo := '';
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                            'FROM  CENTCUST '+
                            'WHERE '+
                            '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                            '   (RTRIM(CODCENTROCUSTO) = ''' + trim(CmpRptCM.ParamValues[5].AsString) + ''') ' +
                            'ORDER BY CODCENTROCUSTO');
         sqlTitulos.Open;

         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + cdsTitulos.FieldByName('NOME').asString;
      end;
      //----------------------------------------------------------------------------------
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                            'FROM  CENTCUST '+
                            'WHERE '+
                            '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                            '   (RTRIM(CODCENTROCUSTO) = ''' + trim(CmpRptCM.ParamValues[6].AsString) + ''') ' +
                            'ORDER BY CODCENTROCUSTO');
         sqlTitulos.Open;

         sTitulo := sTitulo +  '     Centro de Custo Final : ' + cdsTitulos.FieldByName('NOME').asString;
      end;
      //----------------------------------------------------------------------------------
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                            'FROM  UNIDNEGOCIO '+
                            'WHERE '+
                            '   (IDPESSOA    = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                            '   (UNIDNEGOC = '+CmpRptCM.ParamValues[7].AsString + ') ' +
                            'ORDER BY UNIDNEGOC');
         sqlTitulos.Open;
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + cdsTitulos.FieldByName('NOME').asString;
      end;
      pplblTituloOrcamento2.caption := sTitulo;
   end else begin
      pplblTituloOrcamento.caption  := CmpRptCM.ParamValues[18].AsString;
      pplblTituloOrcamento2.caption := CmpRptCM.ParamValues[19].AsString;
   end;
   //-------------------------------------------------------------------------------------
   // Configura a exibiçao da Conta Correspondente
   //-------------------------------------------------------------------------------------
   if CmpRptCM.ParamValues[13].AsBoolean then
   begin
      dbtxtCorrespOrc.visible := true;
      dbtxtContaOrc.visible   := false;
   end else
   begin
      dbtxtCorrespOrc.visible := false;
      dbtxtContaOrc.visible   := true;
   end;
   //-------------------------------------------------------------------------------------
   // Configura a quebra de página
   //-------------------------------------------------------------------------------------
   if CmpRptCM.ParamValues[10].AsBoolean then
   begin
      rptOrcamentoCC.Groups[0].NewPage := true;
   end else
   begin
      rptOrcamentoCC.Groups[0].NewPage := false;
   end;
   //=====================================================================================
   // Sql para trazer os saldos orçados dos centros de custos selecionaddos
   // ou de todos caso não selecione nada
   //=====================================================================================
   if (CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim) or (CmpRptCM.ParamValues[17].AsBoolean) then
   begin
      with sqlSaldoOrc do
      begin
         SQL.Clear;
         SQL.Add('SELECT                                             ');
         SQL.Add('   SUM(DECODE(P.PLSORCADODEBITO,NULL,0,P.PLSORCADODEBITO)-DECODE(P.PLSORCADOCREDITO,NULL,0,P.PLSORCADOCREDITO)) AS SALDOORC, ');
         SQL.Add('   M.SALDOORCMES                                   ');
         SQL.Add('FROM                                               ');
         SQL.Add('   PLANOSALDO P,                                   ');
         SQL.Add('   (SELECT                                         ');
         SQL.Add('       SUM(DECODE(PLSORCADODEBITO,NULL,0,PLSORCADODEBITO)-DECODE(PLSORCADOCREDITO,NULL,0,PLSORCADOCREDITO)) AS SALDOORCMES ');
         SQL.Add('    FROM                                           ');
         SQL.Add('       PLANOSALDO PL                               ');
         SQL.Add('    WHERE                                          ');
         SQL.Add('      (PL.CODCENTROCUSTO  = :CODCENTROCUSTO) AND   ');
         SQL.Add('      (PL.IDEMPRESA       = :IDEMPRESA) AND        ');
         SQL.Add('      (PL.PLACONTA        = :PLACONTA) AND         ');
         SQL.Add('      (PL.PLANO           = :PLANO) AND            ');
         SQL.Add('      (PL.PEREXERCICIO    = :PEREXERCICIO) AND     ');
         SQL.Add('      (PL.PERNUMERO       = :PERNUMERO) AND        ');
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         begin
            SQL.Add('   ((PL.CODCENTROCUSTO >= :CCUSTOINI) AND       ');
            SQL.Add('   (PL.IDEMPRESA = :IDEMPRESA)) AND              ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         begin
            SQL.Add('   ((PL.CODCENTROCUSTO <= :CCUSTOFIM) AND       ');
            SQL.Add('   (PL.IDEMPRESA = :IDEMPRESA)) AND              ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         begin
            SQL.Add('   (PL.PLACONTA >= :CONTAINI) AND                ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
         begin
            SQL.Add('   (PL.PLACONTA <= :CONTAFIM) AND                ');
         end;
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            SQL.Add('   (PL.UNIDNEGOC = :UNIDNEGOC) AND               ');
         end;
         SQL.Add('      (PL.IDPESSOA = :IDPESSOA)) M          ');
         SQL.Add('WHERE                                              ');
         SQL.Add('   (P.CODCENTROCUSTO = :CODCENTROCUSTO) AND         ');
         SQL.Add('   (P.IDEMPRESA      = :IDEMPRESA) AND              ');
         SQL.Add('   (P.PLACONTA       = :PLACONTA) AND               ');
         SQL.Add('   (P.PLANO          = :PLANO) AND                  ');
         SQL.Add('   (P.PEREXERCICIO   = :PEREXERCICIO) AND           ');
         SQL.Add('   ((P.PERNUMERO     <= :PERNUMERO) OR (P.PERNUMERO IS NULL)) AND ');
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         begin
            SQL.Add('((P.CODCENTROCUSTO >= :CCUSTOINI) AND ');
            SQL.Add('(P.IDEMPRESA = :IDEMPRESA)) AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         begin
            SQL.Add('((P.CODCENTROCUSTO <= :CCUSTOFIM) AND ');
            SQL.Add('(P.IDEMPRESA = :IDEMPRESA)) AND ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         begin
            SQL.Add('(P.PLACONTA >= :CONTAINI) AND ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
         begin
            SQL.Add('(P.PLACONTA <= :CONTAFIM) AND ');
         end;
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('(P.UNIDNEGOC = :UNIDNEGOC) AND ');
         end;
         SQL.Add('   (P.IDPESSOA = :IDPESSOA) ');
         SQL.Add('GROUP BY M.SALDOORCMES                             ');
         Prepare;
      end;
      //----------------------------------------------------------------------------------
      // Aqui tenho join porque temos conjuntos diferentes (planilha/lancamento)
      //----------------------------------------------------------------------------------
      with sqlSaldoRea do
      begin
         SQL.Clear;
         SQL.Add('SELECT                                            ');
         SQL.Add('   (SUM(DECODE(P.PLSDEBITOCORRENTE,NULL,0,P.PLSDEBITOCORRENTE)-DECODE(P.PLSCREDITOCOR,NULL,0,P.PLSCREDITOCOR))+SALDOREAMES) AS SALDOREA, ');
         SQL.Add('   M.SALDOREAMES                                  ');
         SQL.Add('FROM                                              ');
         SQL.Add('   PLANOSALDO P,                                  ');
         SQL.Add('   (SELECT                                        ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOREAMES  ');
         SQL.Add('    FROM                                                                       ');
         SQL.Add('       PLANILHA P, LANCAMENTO L                                                ');
         SQL.Add('    WHERE                                                                      ');
         SQL.Add('      (L.CODCENTROCUSTO  LIKE :CODCENTROCUSTOSIN) AND                          ');
         SQL.Add('      (L.IDEMPRESA     =:IDEMPRESA) AND                                           ');
         SQL.Add('      (L.PLACONTA      =:PLACONTA) AND                                          ');
         SQL.Add('      (L.PLANO         =:PLANO) AND                                             ');
         SQL.Add('      (P.PEREXERCICIO  =:PEREXERCICIO) AND                                       ');
         SQL.Add('      (P.PERNUMERO     =:PERNUMERO) AND                                          ');
         SQL.Add('      (P.PLNDATDIA     <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND                   ');
         SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                   ');
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('   ((L.CODCENTROCUSTO >= :CCUSTOINI) AND           ');
            SQL.Add('   (L.IDEMPRESA =:IDEMPRESA)) AND                  ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('   ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND           ');
            SQL.Add('   (L.IDEMPRESA =:IDEMPRESA)) AND                  ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then begin
            SQL.Add('   (L.PLACONTA >= :CONTAINI) AND                   ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then begin
            SQL.Add('   (L.PLACONTA <= :CONTAFIM) AND                   ');
         end;
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('   (L.UNIDNEGOC =:UNIDNEGOC) AND                   ');
         end;
         SQL.Add('      (P.IDPESSOA      =:IDPESSOA) AND                ');
         SQL.Add('      (P.PLNCODIGO   = L.PLNCODIGO)) M                ');
         SQL.Add('WHERE                                                 ');
         SQL.Add('   (P.CODCENTROCUSTO  =:CODCENTROCUSTO) AND           ');
         SQL.Add('   (P.IDEMPRESA       =:IDEMPRESA) AND                ');
         SQL.Add('   (P.PLACONTA        =:PLACONTA) AND                 ');
         SQL.Add('   (P.PLANO           =:PLANO)   AND                  ');
         SQL.Add('   (P.PEREXERCICIO    =:PEREXERCICIO) AND                    ');
         SQL.Add('   ((P.PERNUMERO <:PERNUMERO) OR (P.PERNUMERO IS NULL)) AND  ');
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         begin
            SQL.Add('((P.CODCENTROCUSTO >= :CCUSTOINI) AND           ');
            SQL.Add('(P.IDEMPRESA =:IDEMPRESA)) AND                  ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         begin
            SQL.Add('((P.CODCENTROCUSTO <= :CCUSTOFIM) AND           ');
            SQL.Add('(P.IDEMPRESA =:IDEMPRESA)) AND                  ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         begin
            SQL.Add('(P.PLACONTA >= :CONTAINI) AND                   ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
         begin
            SQL.Add('(P.PLACONTA <= :CONTAFIM) AND                   ');
         end;
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            SQL.Add('(P.UNIDNEGOC =:UNIDNEGOC) AND                   ');
         end;
         SQL.Add('   (P.IDPESSOA        =:IDPESSOA)                  ');
         SQL.Add('GROUP BY  M.SALDOREAMES                            ');
         Prepare;
      end;
      //----------------------------------------------------------------------------------
      with sqlSaldoEncer do
      begin
         SQL.Clear;
         SQL.Add('SELECT                                                ');
         SQL.Add('   SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOREA,        ');
         SQL.Add('   M.SALDOREAMES                                      ');
         SQL.Add('FROM PLANILHA P, LANCAMENTO L,                        ');
         SQL.Add('   (SELECT                                            ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOREAMES ');
         SQL.Add('    FROM                                              ');
         SQL.Add('       PLANILHA P, LANCAMENTO L                       ');
         SQL.Add('    WHERE                                             ');
         SQL.Add('      (L.CODCENTROCUSTO LIKE :CODCENTROCUSTOSIN) AND  ');
         SQL.Add('      (L.IDEMPRESA    =:IDEMPRESA) AND                ');
         SQL.Add('      (L.PLACONTA     =:PLACONTA) AND                 ');
         SQL.Add('      (L.PLANO        =:PLANO) AND                    ');
         SQL.Add('      (P.PEREXERCICIO =:PEREXERCICIO) AND             ');
         SQL.Add('      (P.PERNUMERO    =:PERNUMERO) AND                ');
         SQL.Add('      (P.PLNDATDIA   <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND ');
         SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                    ');
         SQL.Add('      (L.TIPCODIGO = '''+sTipoOperResult+''') AND     ');
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         begin
            SQL.Add('   ((L.CODCENTROCUSTO >= :CCUSTOINI) AND           ');
            SQL.Add('   (L.IDEMPRESA =:IDEMPRESA)) AND                  ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         begin
            SQL.Add('   ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND           ');
            SQL.Add('   (L.IDEMPRESA =:IDEMPRESA)) AND                  ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         begin
            SQL.Add('   (L.PLACONTA >= :CONTAINI) AND                   ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
         begin
            SQL.Add('   (L.PLACONTA <= :CONTAFIM) AND                   ');
         end;
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            SQL.Add('   (L.UNIDNEGOC =:UNIDNEGOC) AND                   ');
         end;
         SQL.Add('      (P.IDPESSOA    =:IDPESSOA) AND                  ');
         SQL.Add('      (P.PLNCODIGO   = L.PLNCODIGO)) M                ');
         SQL.Add('WHERE                                                 ');
         SQL.Add('   (P.CODCENTROCUSTO  =:CODCENTROCUSTO) AND           ');
         SQL.Add('   (P.IDEMPRESA       =:IDEMPRESA) AND                ');
         SQL.Add('   (P.PLACONTA        =:PLACONTA) AND                 ');
         SQL.Add('   (P.PEREXERCICIO = :PEREXERCICIO) AND               ');
         SQL.Add('   (P.PLNDATDIA   <= TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND ');
         SQL.Add('   (L.CODCENTROCUSTO LIKE :CODCENTROCUSTOSIN) AND     ');
         SQL.Add('   (L.PLANO       = :PLANO) AND                       ');
         SQL.Add('   (P.PLNEFETIVADO = ''S'') AND                       ');
         SQL.Add('   (L.TIPCODIGO = '''+sTipoOperResult+''') AND        ');
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         begin
            SQL.Add('((L.CODCENTROCUSTO >= :CCUSTOINI) AND              ');
            SQL.Add('(L.IDEMPRESA =:IDEMPRESA)) AND                     ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         begin
            SQL.Add('((L.CODCENTROCUSTO <= :CCUSTOFIM) AND              ');
            SQL.Add('(L.IDEMPRESA =:IDEMPRESA)) AND                     ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         begin
            SQL.Add('(L.PLACONTA >= :CONTAINI) AND                      ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
         begin
            SQL.Add('(L.PLACONTA <= :CONTAFIM) AND                      ');
         end;
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            SQL.Add('(L.UNIDNEGOC =:UNIDNEGOC) AND                      ');
         end;
         SQL.Add('   (P.IDPESSOA        = :IDPESSOA) AND                ');
         SQL.Add('   (P.PLNCODIGO       = L.PLNCODIGO)                  ');
         SQL.Add('GROUP BY M.SALDOREAMES                                ');
         Prepare;
      end;
   end;
   //-------------------------------------------------------------------------------------
   bValores := CmpRptCM.ParamValues[09].AsBoolean;
   bCodigo  := CmpRptCM.ParamValues[16].AsBoolean;
   bIngles  := CmpRptCM.ParamValues[11].AsBoolean;

   iNumero := FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraContas, 1);
   //-------------------------------------------------------------------------------------
   // Preparar a query dos dados Analíticos
   //-------------------------------------------------------------------------------------
   with sqlAnaliticos do
   begin
      SQL.Clear;
      if (CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim) or
         (CmpRptCM.ParamValues[17].AsBoolean) then
      begin
         SQL.Add('SELECT                                                            ');
         SQL.Add('   CX.CODCENTROCUSTO, CX.IDEMPRESA, CC.NOME AS NOMECENTROCUSTO, CC.STATUSGRUPOCDC AS CCTIPO, ');
         SQL.Add('   CX.PLANO,CX.PLACONTA, PC.PLAGRAU, PC.PLATIPO, PC.PLACONCORRESP,');
         SQL.Add('   (0) AS ORCABS,      (0) AS SORCABS,     (0) AS VARPER,         ');
         SQL.Add('   (0) AS REALABS,     (0) AS SREALABS,    (0) AS VARACUM,        ');
         SQL.Add('   ('' '') AS DEBCREORC,   ('' '') AS DEBCRESORC,                 ');
         SQL.Add('   ('' '') AS DEBCREREAL,  ('' '') AS DEBCRESREAL,                ');
         SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
         SQL.Add('   SUBSTR(PC.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,    ');
         if CmpRptCM.ParamValues[11].AsBoolean then
         begin
            SQL.Add('   PC.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS PLANOME, PC.PLANOMEOUTLING, ');
         end else
         begin
            SQL.Add('   DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS CONTA, PC.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS PLANOME, ');
         end;
         SQL.Add('   (0) AS REAL,      (0) AS ORC,                                 ');
         SQL.Add('   (0) AS SALDOREAL, (0) AS SALDOORC                             ');
         SQL.Add('FROM                                                             ');
         SQL.Add('      CONTASXCC CX, CENTCUST CC, PLANOCONTA PC,                  ');
         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD ');
         SQL.Add('WHERE                                                            ');
         SQL.Add('    (CX.IDEMPRESA      =  :IDEMPRESA) AND                        ');
         SQL.Add('    (PC.PLANO          =  :PLANO) AND                            ');
         SQL.Add('    (PC.PLAGRAU        <= :GRAU) AND                             ');
         SQL.Add('    (CX.CODCENTROCUSTO >= :CCUSTOINI) AND                        ');
         SQL.Add('    (CX.CODCENTROCUSTO <= :CCUSTOFIM) AND                        ');
         SQL.Add('    (CX.PLACONTA       >= :CONTAINI) AND                         ');
         SQL.Add('    (CX.PLACONTA       <= :CONTAFIM) AND                         ');
         SQL.Add('    (CC.STATUSGRUPOCDC = ''A'') AND                              ');
         SQL.Add('    (PC.PLATIPO        = ''A'') AND                              ');
         SQL.Add('    (CX.CODCENTROCUSTO =  CC.CODCENTROCUSTO) AND                 ');
         SQL.Add('    (CX.IDEMPRESA      =  CC.IDEMPRESA) AND                      ');
         SQL.Add('    (PD.PLACONTA(+)    =  PC.PLACONTA) AND                       ');
         SQL.Add('    (PD.PLANO(+)       =  PC.PLANO) AND                          ');
         SQL.Add('    (CX.PLANO          =  PC.PLANO) AND                          ');
         SQL.Add('    (CX.PLACONTA       =  PC.PLACONTA)                           ');
         SQL.Add('ORDER BY CX.CODCENTROCUSTO, CX.PLANO,                            ');
         if CmpRptCM.ParamValues[13].AsBoolean then
         begin
            SQL.Add(' CX.PLACONCORRESP                                             ');
         end else
         begin
            SQL.Add(' CX.PLACONTA                                                  ');
         end;
      end else
      //----------------------------------------------------------------------------------
      //----------------------------------------------------------------------------------
      begin
         SQL.Add('SELECT                                                             ');
         SQL.Add('   S.CODCENTROCUSTO, S.IDEMPRESA, CC.NOME AS NOMECENTROCUSTO, CC.STATUSGRUPOCDC AS CCTIPO, ');
         SQL.Add('   S.PLANO,S.PLACONTA, PC.PLAGRAU, PC.PLATIPO, PC.PLACONCORRESP,   ');
         SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)   ');
         SQL.Add('     - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS REAL, ');
         SQL.Add('   SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO)       ');
         SQL.Add('     - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)) AS ORC, ');
         SQL.Add('   SA.SALDOREAL, SA.SALDOORC,                                           ');
         SQL.Add('   (0) AS ORCABS,      (0) AS SORCABS,     (0) AS VARPER,         ');
         SQL.Add('   (0) AS REALABS,     (0) AS SREALABS,    (0) AS VARACUM,        ');
         SQL.Add('   ('' '') AS DEBCREORC,   ('' '') AS DEBCRESORC,                ');
         SQL.Add('   ('' '') AS DEBCREREAL,  ('' '') AS DEBCRESREAL,               ');
         SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
         SQL.Add('   SUBSTR(S.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,       ');
         if CmpRptCM.ParamValues[11].AsBoolean then begin
            SQL.Add('   PC.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS PLANOME, PC.PLANOMEOUTLING     ');
         end else begin
            SQL.Add('   DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS CONTA, PC.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS PLANOME ');
         end;
         SQL.Add('FROM                                                                ');
         SQL.Add('   PLANOSALDO S, CENTCUST CC, PLANOCONTA PC,                        ');
         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD, ');
         SQL.Add('                                                                    ');
         //-------------------------------------------------------------------------------
         // Saldo Anterior
         //-------------------------------------------------------------------------------
         SQL.Add('   (SELECT                                                          ');
         SQL.Add('       CODCENTROCUSTO, PLACONTA,                                    ');
         SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)        ');
         SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOREAL, ');

         SQL.Add('   SUM(DECODE(PLSORCADODEBITO, NULL, 0, PLSORCADODEBITO)                ');
         SQL.Add('     - DECODE(PLSORCADOCREDITO, NULL, 0, PLSORCADOCREDITO)) AS SALDOORC ');

         SQL.Add('    FROM PLANOSALDO                                              ');
         SQL.Add('    WHERE (PLANO        =:PLANO) AND                             ');
         SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
         SQL.Add('          ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL)) AND    ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
            SQL.Add('       (IDPESSOA   =:PESSOA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         begin
            SQL.Add('       (PLACONTA >= :CONTAINI) AND                            ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
         begin
            SQL.Add('       (PLACONTA <= :CONTAFIM) AND                            ');
         end;
         SQL.Add('          (IDPESSOA       =:IDPESSOA) AND                        ');
         SQL.Add('          (IDEMPRESA      =:IDEMPRESA) AND                       ');
         SQL.Add('          (CODCENTROCUSTO >= :CCUSTOINI) AND                     ');
         SQL.Add('          (CODCENTROCUSTO <= :CCUSTOFIM)                         ');
         SQL.Add('    GROUP BY CODCENTROCUSTO,PLACONTA ) SA                        ');
         SQL.Add('                                                                 ');
         SQL.Add('WHERE                                                            ');
         SQL.Add('    (S.CODCENTROCUSTO   >= :CCUSTOINI) AND                       ');
         SQL.Add('    (S.CODCENTROCUSTO   <= :CCUSTOFIM) AND                       ');
         SQL.Add('    (S.IDEMPRESA(+)      = :IDEMPRESA) AND                       ');
         SQL.Add('    (S.PLANO              =:PLANO) AND                           ');
         SQL.Add('    (S.PEREXERCICIO(+)    =:EXERCICIO) AND                       ');
         SQL.Add('    (S.PERNUMERO(+)       =:PERIODO) AND                         ');
         SQL.Add('    (PC.PLAGRAU           <=:GRAU) AND                           ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            SQL.Add('    ((S.UNIDNEGOC(+) = :UNIDNEGOC) AND                        ');
            SQL.Add('    (S.IDPESSOA(+)   = :PESSOA)) AND                          ');
         end;
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         begin
            SQL.Add('    (S.PLACONTA(+) >= :CONTAINI) AND                          ');
         end;
         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
         begin
            SQL.Add('    (S.PLACONTA(+) <= :CONTAFIM) AND                          ');
         end;
         SQL.Add('    (S.IDPESSOA(+)       = :IDPESSOA) AND                        ');
         SQL.Add('    (CC.STATUSGRUPOCDC   = ''A'') AND                            '); 
         SQL.Add('    (PC.PLATIPO          = ''A'') AND                            ');
         SQL.Add('    (S.CODCENTROCUSTO    = SA.CODCENTROCUSTO) AND                ');
         SQL.Add('    (S.PLACONTA          = SA.PLACONTA) AND                      ');
         SQL.Add('    (S.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND                ');
         SQL.Add('    (S.IDEMPRESA         = CC.IDEMPRESA) AND                     ');
         SQL.Add('    (PD.PLACONTA(+)      = PC.PLACONTA) AND                      ');
         SQL.Add('    (PD.PLANO(+)         = PC.PLANO) AND                         ');
         SQL.Add('    (S.PLACONTA(+)       = PC.PLACONTA) AND                      ');
         SQL.Add('    (S.PLANO(+)          = PC.PLANO)                             ');
         SQL.Add('GROUP BY                                                         ');
         SQL.Add('   S.CODCENTROCUSTO, S.IDEMPRESA, CC.NOME, CC.STATUSGRUPOCDC,    ');
         SQL.Add('   S.PLANO,S.PLACONTA, PC.PLAGRAU, PC.PLATIPO,PC.PLACONCORRESP,  ');
         SQL.Add('   PC.PLANOMEOUTLING,DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME),   ');
         SQL.Add('   SA.SALDOREAL, SA.SALDOORC                                     ');
         SQL.Add('HAVING                                                           ');
         SQL.Add('   (DECODE(SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)    ');
         SQL.Add('             - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)), 0,       ');
         SQL.Add('   (DECODE(SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO)        ');
         SQL.Add('             - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)), 0, ');
         SQL.Add('   (DECODE(SA.SALDOREAL,NULL,                                    ');
         SQL.Add('   (DECODE(SA.SALDOORC,NULL,''0'',''1'')),                       ');
         SQL.Add('   ''1'')),''1'')),''1'')) = ''1''                               ');
         SQL.Add('ORDER BY                                                         ');
         if CmpRptCM.ParamValues[13].AsBoolean then begin
            SQL.Add(' S.CODCENTROCUSTO, PC.PLACONCORRESP                           ');
         end else begin
            SQL.Add(' S.CODCENTROCUSTO, S.PLACONTA                                 ');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Parametros comuns para os dois tipos de sql do orcamento
      //----------------------------------------------------------------------------------
      Prepare;
      ParamByName('IDEMPRESA').asFloat := CrmRptCM.IdEmpresa;
      ParamByName('GRAU').asInteger    := CmpRptCM.ParamValues[12].AsInteger;
      ParamByName('PLANO').asInteger   := iPlano;
      //----------------------------------------------------------------------------------
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
         ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10)
      else
         ParamByName('CCUSTOINI').asString   := Espaco('0',10);
      //----------------------------------------------------------------------------------
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
         ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10)
      else
         ParamByName('CCUSTOFIM').asString   := '9999999999';
      //----------------------------------------------------------------------------------
      if (CmpRptCM.ParamValues[2].AsDateTime = dtPerDataFim) and (not CmpRptCM.ParamValues[17].AsBoolean) then
      begin
         ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
         ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
         ParamByName('PERIODO').asInteger   := CmpRptCM.ParamValues[1].AsInteger;

         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
            ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);

         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
            ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[4].AsString,18);

         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
         begin
            ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
            ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
         end;
      end else
      begin
         if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
            ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18)
         else
            ParamByName('CONTAINI').asString := Espaco('0',18);

         if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
            ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[4].AsString,18)
         else
            ParamByName('CONTAFIM').asString := '999999999999999999';
      end;
      //----------------------------------------------------------------------------------
      // PROCESSA OS DADOS ANALÍTICOS DE PERIODO PARCIAL
      //----------------------------------------------------------------------------------
      if (CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim) or (CmpRptCM.ParamValues[17].AsBoolean) then
      begin
         Open;
         cdsAnaliticos.First;
         while not cdsAnaliticos.EOF do
         begin
            //----------------------------------------------------------------------------
            // Parametros do sql orcado
            //----------------------------------------------------------------------------
            sqlSaldoOrc.Prepare;
            sqlSaldoOrc.ParamByName('PLANO').asInteger          := iPlano;
            sqlSaldoOrc.ParamByName('IDEMPRESA').asFloat        := CrmRptCM.IdEmpresa;
            sqlSaldoOrc.ParamByName('CODCENTROCUSTO').AsString  := Espaco(cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString,10);
            sqlSaldoOrc.ParamByName('PLACONTA').AsString        := Espaco(cdsAnaliticos.FieldByName('PLACONTA').AsString,18);
            sqlSaldoOrc.ParamByName('IDPESSOA').asFloat         := CrmRptCM.IdEmpresa;
            sqlSaldoOrc.ParamByName('PEREXERCICIO').asInteger   := CmpRptCM.ParamValues[0].AsInteger;
            sqlSaldoOrc.ParamByName('PERNUMERO').asInteger      := CmpRptCM.ParamValues[1].AsInteger;
            if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10)
            end;
            if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10)
            end;
            if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('CONTAINI').asString   := Espaco(CmpRptCM.ParamValues[3].AsString,18);
            end;
            if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('CONTAFIM').asString   := Espaco(CmpRptCM.ParamValues[4].AsString,18);
            end;
            if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
            end;
            sqlSaldoOrc.Open;
            //----------------------------------------------------------------------------
            // Parametros do sql real
            //----------------------------------------------------------------------------
            sqlSaldoRea.Prepare;
            sqlSaldoRea.ParamByName('IDEMPRESA').asFloat          := CrmRptCM.IdEmpresa;
            sqlSaldoRea.ParamByName('CODCENTROCUSTO').AsString    := Espaco(cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString,10);
            sqlSaldoRea.ParamByName('CODCENTROCUSTOSIN').AsString := trim(cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString)+'%';
            sqlSaldoRea.ParamByName('PLACONTA').AsString          := Espaco(cdsAnaliticos.FieldByName('PLACONTA').AsString,18);
            sqlSaldoRea.ParamByName('DATALIM').AsString           := DateToStr(CmpRptCM.ParamValues[2].AsDateTime);
            sqlSaldoRea.ParamByName('PLANO').asInteger            := iPlano;
            sqlSaldoRea.ParamByName('IDPESSOA').asFloat           := CrmRptCM.IdEmpresa;
            sqlSaldoRea.ParamByName('PEREXERCICIO').asInteger     := CmpRptCM.ParamValues[0].AsInteger;
            sqlSaldoRea.ParamByName('PERNUMERO').asInteger        := CmpRptCM.ParamValues[1].AsInteger;
            if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
            begin
               sqlSaldoRea.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10)
            end;
            if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
            begin
               sqlSaldoRea.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10)
            end;
            if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
            begin
               sqlSaldoRea.ParamByName('CONTAINI').asString   := Espaco(CmpRptCM.ParamValues[3].AsString,18);
            end;
            if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
            begin
               sqlSaldoRea.ParamByName('CONTAFIM').asString   := Espaco(CmpRptCM.ParamValues[4].AsString,18);
            end;
            if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
            begin
               sqlSaldoRea.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
            end;
            sqlSaldoRea.Open;
            //----------------------------------------------------------------------------
            // Parametros do sql encerramento
            //----------------------------------------------------------------------------
            rMovExer := 0;
            rSalExer := 0;
            if CmpRptCM.ParamValues[17].AsBoolean then
            begin
               sqlSaldoEncer.Prepare;
               sqlSaldoEncer.ParamByName('EMPRESA').asFloat            := CrmRptCM.IdEmpresa;
               sqlSaldoEncer.ParamByName('CODCENTROCUSTO').AsString    := Espaco(cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString,10);
               sqlSaldoEncer.ParamByName('CODCENTROCUSTOSIN').AsString := trim(cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString)+'%';
               sqlSaldoEncer.ParamByName('PLACONTA').AsString          := Espaco(cdsAnaliticos.FieldByName('PLACONTA').AsString,18);
               sqlSaldoEncer.ParamByName('DATALIM').AsString           := DateToStr(CmpRptCM.ParamValues[2].AsDateTime);
               sqlSaldoEncer.ParamByName('PLANO').asInteger            := iPlano;
               sqlSaldoEncer.ParamByName('IDPESSOA').asFloat           := CrmRptCM.IdEmpresa;
               sqlSaldoEncer.ParamByName('PEREXERCICIO').asInteger     := CmpRptCM.ParamValues[0].AsInteger;
               sqlSaldoEncer.ParamByName('PERNUMERO').asInteger        := CmpRptCM.ParamValues[1].AsInteger;
               if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
               begin
                  sqlSaldoEncer.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10)
               end else
               begin
                 sqlSaldoEncer.ParamByName('CCUSTOINI').asString   := Espaco('0',10);
               end;
               if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
               begin
                  sqlSaldoEncer.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10)
               end else
               begin
                 sqlSaldoEncer.ParamByName('CCUSTOFIM').asString   := '9999999999';
               end;
               if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
               begin
                  sqlSaldoEncer.ParamByName('CONTAINI').asString   := Espaco(CmpRptCM.ParamValues[3].AsString,18);
               end;
               if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
               begin
                  sqlSaldoEncer.ParamByName('CONTAFIM').asString   := Espaco(CmpRptCM.ParamValues[4].AsString,18);
               end;
               if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
               begin
                  sqlSaldoEncer.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
               end;
               sqlSaldoEncer.Open;
               //-------------------------------------------------------------------------
               if not cdsSaldoEncer.isEmpty then
               begin
                  rMovExer := cdsSaldoEncer.FieldByName('SALDOREAMES').AsFloat;
                  rSalExer := cdsSaldoEncer.FieldByName('SALDOREA').AsFloat;
               end;
            end;
            //----------------------------------------------------------------------------
            if (cdsSaldoOrc.FieldByName('SALDOORC').AsFloat = 0) and (cdsSaldoOrc.FieldByName('SALDOORCMES').AsFloat = 0) and
               ((cdsSaldoRea.FieldByName('SALDOREA').AsFloat + rSalExer) = 0) and ((cdsSaldoRea.FieldByName('SALDOREAMES').AsFloat + rMovExer) = 0) then
            begin
               cdsAnaliticos.Delete;
            end else
            begin
               cdsAnaliticos.Edit;
               cdsAnaliticos.FieldByName('REAL').AsFloat      := cdsSaldoRea.FieldByName('SALDOREAMES').AsFloat +rMovExer;
               cdsAnaliticos.FieldByName('ORC').AsFloat       := cdsSaldoOrc.FieldByName('SALDOORCMES').AsFloat;
               cdsAnaliticos.FieldByName('SALDOREAL').AsFloat := cdsSaldoRea.FieldByName('SALDOREA').AsFloat +rSalExer;
               cdsAnaliticos.FieldByName('SALDOORC').AsFloat  := cdsSaldoOrc.FieldByName('SALDOORC').AsFloat;
               cdsAnaliticos.Next;
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      // Processa a sqlAnalitico de periodo encerrado
      //----------------------------------------------------------------------------------
      begin
        //SQL.SaveToFile('C:\ORCCC.SQL');
        Open;
      end;
      //----------------------------------------------------------------------------------
      sMascara := '';
      if CmpRptCM.ParamValues[8].AsBoolean then
      begin
         sMascara := Modulo.sMascaraContas;
      end;
      //----------------------------------------------------------------------------------
      sMascaraCCusto := Modulo.sMascaraCCusto;
      bIndenta       := CmpRptCM.ParamValues[14].AsBoolean;
      bEspaco        := CmpRptCM.ParamValues[15].AsBoolean;
      //----------------------------------------------------------------------------------
      // Acumula os dados das contas contábeis analíticas nas suas contas sintéticas
      //----------------------------------------------------------------------------------
      MontaQuerySinteticos;
      cdsAnaliticos.First;
      while not cdsAnaliticos.EOF do
      begin
         if cdsAnaliticos.FieldByName('PLATIPO').AsString = 'A' then
         begin
            iPos        := cdsAnaliticos.GetBookMark;
            sCCusto     := cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString;
            sCCustoNome := cdsAnaliticos.FieldByName('NOMECENTROCUSTO').AsString;
            sCContab    := cdsAnaliticos.FieldByName('PLACONTA').AsString;
            fReal       := cdsAnaliticos.FieldByName('REAL').AsFloat;
            fOrc        := cdsAnaliticos.FieldByName('ORC').AsFloat;
            fSaldoReal  := cdsAnaliticos.FieldByName('SALDOREAL').AsFloat;
            fSaldoOrc   := cdsAnaliticos.FieldByName('SALDOORC').AsFloat;
            //----------------------------------------------------------------------------
            // Processa as contas ancestrais da conta contabil no centro de custo
            //----------------------------------------------------------------------------
            cdsCContabSinteticos.Close;
            sqlCContabSinteticos.ParamByName('PLANO').AsInteger := iPlano;
            sqlCContabSinteticos.ParamByName('PLACONTABASE').AsString := copy(sCContab,1,1);
            sqlCContabSinteticos.Open;
            while not cdsCContabSinteticos.EOF do
            begin
               //-------------------------------------------------------------------------
               // Se o ancestral pertencer a conta contabil do centro de custo, acumular
               // os seus valores.
               //-------------------------------------------------------------------------
               if TrimRight(cdsCContabSinteticos.FieldByName('PLACONTA').AsString) =
                  copy(TrimRight(sCContab), 1, length(TrimRight(cdsCContabSinteticos.FieldByName('PLACONTA').AsString))) then
               begin
                  if not cdsAnaliticos.Locate('CODCENTROCUSTO;PLACONTA',
                                              VarArrayOf([sCCusto, TrimRight(cdsCContabSinteticos.FieldByName('PLACONTA').AsString)]), []) then
                  begin
                     cdsAnaliticos.Append;
                     cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString  := sCCusto;
                     cdsAnaliticos.FieldByName('IDEMPRESA').AsInteger      := Sistema.IdEmpresa;
                     cdsAnaliticos.FieldByName('CCTIPO').AsString          := 'A';
                     cdsAnaliticos.FieldByName('NOMECENTROCUSTO').AsString := sCCustoNome;
                     cdsAnaliticos.FieldByName('PLANO').AsInteger          := cdsCContabSinteticos.FieldByName('PLANO').AsInteger;
                     cdsAnaliticos.FieldByName('PLACONTA').AsString        := cdsCContabSinteticos.FieldByName('PLACONTA').AsString;
                     cdsAnaliticos.FieldByName('PLATIPO').AsString         := cdsCContabSinteticos.FieldByName('PLATIPO').AsString;
                     cdsAnaliticos.FieldByName('PLANOME').AsString         := cdsCContabSinteticos.FieldByName('PLANOME').AsString;
                     cdsAnaliticos.FieldByName('GRAU').AsString            := copy(cdsCContabSinteticos.FieldByName('PLACONTA').AsString, 1, iNumero);
                     cdsAnaliticos.FieldByName('CONTA').AsString           := cdsCContabSinteticos.FieldByName('CONTA').AsString;
                     cdsAnaliticos.FieldByName('PLANOMEOUTLING').AsString  := cdsCContabSinteticos.FieldByName('PLANOMEOUTLING').AsString;
                     cdsAnaliticos.FieldByName('PLAGRAU').AsString         := cdsCContabSinteticos.FieldByName('PLAGRAU').AsString;
                     cdsAnaliticos.FieldByName('PLACONCORRESP').AsString   := cdsCContabSinteticos.FieldByName('PLACONCORRESP').AsString;
                     cdsAnaliticos.FieldByName('REAL').AsFloat             := fReal;
                     cdsAnaliticos.FieldByName('ORC').AsFloat              := fOrc;
                     cdsAnaliticos.FieldByName('SALDOREAL').AsFloat        := fSaldoReal;
                     cdsAnaliticos.FieldByName('SALDOORC').AsFloat         := fSaldoOrc;
                  end else
                  begin
                     cdsAnaliticos.Edit;
                     cdsAnaliticos.FieldByName('REAL').AsFloat             := cdsAnaliticos.FieldByName('REAL').AsFloat      + fReal;
                     cdsAnaliticos.FieldByName('ORC').AsFloat              := cdsAnaliticos.FieldByName('ORC').AsFloat       + fOrc;
                     cdsAnaliticos.FieldByName('SALDOREAL').AsFloat        := cdsAnaliticos.FieldByName('SALDOREAL').AsFloat + fSaldoReal;
                     cdsAnaliticos.FieldByName('SALDOORC').AsFloat         := cdsAnaliticos.FieldByName('SALDOORC').AsFloat  + fSaldoOrc;
                  end;
                  cdsAnaliticos.Post;
               end;
               cdsCContabSinteticos.Next;
            end;
            cdsAnaliticos.GotoBookmark(iPos);
            cdsAnaliticos.FreeBookmark(iPos);
         end;
         cdsAnaliticos.Next;
      end;
      //----------------------------------------------------------------------------------
      // Acumula os dados dos centros de custo analíticos nos sintéticos
      //----------------------------------------------------------------------------------
      cdsCCustoSinteticos.Close;
      sqlCCustoSinteticos.Prepare;
      sqlCCustoSinteticos.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      sqlCCustoSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsCCustoSinteticos.EOF do
      begin
         iTam       := length(cdsCCustoSinteticos.FieldByName('CODCENTROCUSTO').AsString);
         fReal      := 0;
         fOrc       := 0;
         fSaldoReal := 0;
         fSaldoOrc  := 0;
         //-------------------------------------------------------------------------------
         cdsAnaliticos.Locate('CODCENTROCUSTO',trim(cdsCCustoSinteticos.FieldByName('CODCENTROCUSTO').AsString),[loPartialKey]);
         while (not cdsAnaliticos.EOF) and
               (copy(cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString,1,iTam) = cdsCCustoSinteticos.FieldByName('CODCENTROCUSTO').AsString) do
         begin
            if cdsAnaliticos.FieldByName('PLATIPO').AsString = 'A' then
            begin
               fReal       := fReal      + cdsAnaliticos.FieldByName('REAL').AsFloat;
               fOrc        := fOrc       + cdsAnaliticos.FieldByName('ORC').AsFloat;
               fSaldoReal  := fSaldoReal + cdsAnaliticos.FieldByName('SALDOREAL').AsFloat;
               fSaldoOrc   := fSaldoOrc  + cdsAnaliticos.FieldByName('SALDOORC').AsFloat;
            end;
            cdsAnaliticos.Next;
         end;
         //-------------------------------------------------------------------------------
         if not cdsAnaliticos.Locate('CODCENTROCUSTO',cdsCCustoSinteticos.FieldByName('CODCENTROCUSTO').AsString,[]) then
         begin
            cdsAnaliticos.Append;
            cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString  := cdsCCustoSinteticos.FieldByName('CODCENTROCUSTO').AsString;
            cdsAnaliticos.FieldByName('IDEMPRESA').AsInteger      := cdsCCustoSinteticos.FieldByName('IDEMPRESA').AsInteger;
            cdsAnaliticos.FieldByName('CCTIPO').AsString          := 'S';
            cdsAnaliticos.FieldByName('NOMECENTROCUSTO').AsString := cdsCCustoSinteticos.FieldByName('NOME').AsString;
            cdsAnaliticos.FieldByName('REAL').AsFloat             := fReal;
            cdsAnaliticos.FieldByName('ORC').AsFloat              := fOrc;
            cdsAnaliticos.FieldByName('SALDOREAL').AsFloat        := fSaldoReal;
            cdsAnaliticos.FieldByName('SALDOORC').AsFloat         := fSaldoOrc;
         end else
         begin
            cdsAnaliticos.Edit;
            cdsAnaliticos.FieldByName('REAL').AsFloat             := cdsAnaliticos.FieldByName('REAL').AsFloat      + fReal;
            cdsAnaliticos.FieldByName('ORC').AsFloat              := cdsAnaliticos.FieldByName('ORC').AsFloat       + fOrc;
            cdsAnaliticos.FieldByName('SALDOREAL').AsFloat        := cdsAnaliticos.FieldByName('SALDOREAL').AsFloat + fSaldoReal;
            cdsAnaliticos.FieldByName('SALDOORC').AsFloat         := cdsAnaliticos.FieldByName('SALDOORC').AsFloat  + fSaldoOrc;
         end;
         cdsAnaliticos.Post;
         //-------------------------------------------------------------------------------
         cdsCCustoSinteticos.Next;
      end;
      //----------------------------------------------------------------------------------
      // Transfere os dados processados para o DataSet do relatório
      //----------------------------------------------------------------------------------
      cdsOrcamentoCC.Close;
      sqlOrcamentoCC.Open;
      cdsAnaliticos.First;
      while not cdsAnaliticos.EOF do
      begin
         cdsOrcamentoCC.Append;
         cdsOrcamentoCC.FieldByName('CODCENTROCUSTO').AsString  := cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString;
         cdsOrcamentoCC.FieldByName('IDEMPRESA').AsInteger      := cdsAnaliticos.FieldByName('IDEMPRESA').AsInteger;
         cdsOrcamentoCC.FieldByName('CCTIPO').AsString          := cdsAnaliticos.FieldByName('CCTIPO').AsString;
         cdsOrcamentoCC.FieldByName('NOMECENTROCUSTO').AsString := cdsAnaliticos.FieldByName('NOMECENTROCUSTO').AsString;
         cdsOrcamentoCC.FieldByName('PLANO').AsInteger          := cdsAnaliticos.FieldByName('PLANO').AsInteger;
         cdsOrcamentoCC.FieldByName('PLACONTA').AsString        := cdsAnaliticos.FieldByName('PLACONTA').AsString;
         cdsOrcamentoCC.FieldByName('PLATIPO').AsString         := cdsAnaliticos.FieldByName('PLATIPO').AsString;
         cdsOrcamentoCC.FieldByName('PLANOME').AsString         := cdsAnaliticos.FieldByName('PLANOME').AsString;
         cdsOrcamentoCC.FieldByName('GRAU').AsString            := cdsAnaliticos.FieldByName('GRAU').AsString;
         cdsOrcamentoCC.FieldByName('CONTA').AsString           := cdsAnaliticos.FieldByName('CONTA').AsString;
         cdsOrcamentoCC.FieldByName('PLANOMEOUTLING').AsString  := cdsAnaliticos.FieldByName('PLANOMEOUTLING').AsString;
         cdsOrcamentoCC.FieldByName('PLAGRAU').AsString         := cdsAnaliticos.FieldByName('PLAGRAU').AsString;
         cdsOrcamentoCC.FieldByName('PLACONCORRESP').AsString   := cdsAnaliticos.FieldByName('PLACONCORRESP').AsString;
         cdsOrcamentoCC.FieldByName('REAL').AsFloat             := cdsAnaliticos.FieldByName('REAL').AsFloat;
         cdsOrcamentoCC.FieldByName('ORC').AsFloat              := cdsAnaliticos.FieldByName('ORC').AsFloat;
         cdsOrcamentoCC.FieldByName('SALDOREAL').AsFloat        := cdsAnaliticos.FieldByName('SALDOREAL').AsFloat;
         cdsOrcamentoCC.FieldByName('SALDOORC').AsFloat         := cdsAnaliticos.FieldByName('SALDOORC').AsFloat;
         cdsOrcamentoCC.Post;
         //-------------------------------------------------------------------------------
         cdsAnaliticos.Next;
      end;
      //----------------------------------------------------------------------------------
      // Finaliza alguns detalhes antes da impressão
      //----------------------------------------------------------------------------------
      OnCalcField;
   end;
end;
//========================================================================================
procedure TrptOrcamentoCC.OnCalcField;
var
   sEspacos : String;
   i        : Integer;

begin
   cdsOrcamentoCC.First;
   while not cdsOrcamentoCC.eof do
   begin
      //----------------------------------------------------------------------------------
      // Gera a label de débito/crédito
      //----------------------------------------------------------------------------------
      cdsOrcamentoCC.Edit;
      if not bValores then
      begin
         if cdsOrcamentoCC.FieldByName('ORC').asFloat = 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCREORC').asString := ' ';
         end;
         if cdsOrcamentoCC.FieldByName('ORC').asFloat < 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCREORC').asString := 'C';
         end else
         begin
            cdsOrcamentoCC.FieldByName('DEBCREORC').asString := 'D';
         end;
         if cdsOrcamentoCC.FieldByName('REAL').asFloat = 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCREREAL').asString := ' ';
         end;
         if cdsOrcamentoCC.FieldByName('REAL').asFloat < 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCREREAL').asString := 'C';
         end else
         begin
            cdsOrcamentoCC.FieldByName('DEBCREREAL').asString := 'D';
         end;
         if cdsOrcamentoCC.FieldByName('SALDOORC').asFloat = 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCRESORC').asString := ' ';
         end;
         if cdsOrcamentoCC.FieldByName('SALDOORC').asFloat < 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCRESORC').asString := 'C';
         end else
         begin
            cdsOrcamentoCC.FieldByName('DEBCRESORC').asString := 'D';
         end;
         if cdsOrcamentoCC.FieldByName('SALDOREAL').asFloat = 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCRESREAL').asString := ' ';
         end;
         if cdsOrcamentoCC.FieldByName('SALDOREAL').asFloat < 0 then
         begin
            cdsOrcamentoCC.FieldByName('DEBCRESREAL').asString := 'C';
         end else begin
            cdsOrcamentoCC.FieldByName('DEBCRESREAL').asString := 'D';
         end;
         //-------------------------------------------------------------------------------
         // Tira o sinal dos saldos
         //-------------------------------------------------------------------------------
         cdsOrcamentoCC.FieldByName('SORCABS').asFloat  := ABS(cdsOrcamentoCC.FieldByName('SALDOORC').asFloat);
         cdsOrcamentoCC.FieldByName('SREALABS').asFloat := ABS(cdsOrcamentoCC.FieldByName('SALDOREAL').asFloat);
         cdsOrcamentoCC.FieldByName('ORCABS').asFloat   := ABS(cdsOrcamentoCC.FieldByName('ORC').asFloat);
         cdsOrcamentoCC.FieldByName('REALABS').asFloat  := ABS(cdsOrcamentoCC.FieldByName('REAL').asFloat);
      end else
      begin
         cdsOrcamentoCC.FieldByName('DEBCREORC').asString   := ' ';
         cdsOrcamentoCC.FieldByName('DEBCREREAL').asString  := ' ';
         cdsOrcamentoCC.FieldByName('DEBCRESORC').asString  := ' ';
         cdsOrcamentoCC.FieldByName('DEBCRESREAL').asString := ' ';
         //-------------------------------------------------------------------------------
         // Tira o sinal dos saldos
         //-------------------------------------------------------------------------------
         cdsOrcamentoCC.FieldByName('SORCABS').asFloat  := cdsOrcamentoCC.FieldByName('SALDOORC').asFloat;
         cdsOrcamentoCC.FieldByName('SREALABS').asFloat := cdsOrcamentoCC.FieldByName('SALDOREAL').asFloat;
         cdsOrcamentoCC.FieldByName('ORCABS').asFloat   := cdsOrcamentoCC.FieldByName('ORC').asFloat;
         cdsOrcamentoCC.FieldByName('REALABS').asFloat  := cdsOrcamentoCC.FieldByName('REAL').asFloat;
      end;
      //----------------------------------------------------------------------------------
      // Indenta o Nome da Conta Contábil de acordo com o grau
      //----------------------------------------------------------------------------------
      sEspacos := '';
      if bIndenta then
         for i := 1 to ((cdsOrcamentoCC.FieldByName('PLAGRAU').asInteger - 1) * 5) do
            sEspacos := sEspacos + ' ';
      cdsOrcamentoCC.FieldByName('NOMEINDENTADO').asString := sEspacos + cdsOrcamentoCC.FieldByName('CONTA').asString;
      //----------------------------------------------------------------------------------
      if cdsOrcamentoCC.FieldByName('ORC').asFloat = 0 then
      begin
         cdsOrcamentoCC.FieldByName('VARPER').asFloat := 0;
      end else
      begin
         cdsOrcamentoCC.FieldByName('VARPER').asFloat := (((cdsOrcamentoCC.FieldByName('REAL').asFloat - cdsOrcamentoCC.FieldByName('ORC').asFloat) /
                                                           cdsOrcamentoCC.FieldByName('ORC').asFloat) * 100);
      end;
      if cdsOrcamentoCC.FieldByName('SALDOORC').asFloat = 0 then
      begin
         cdsOrcamentoCC.FieldByName('VARACUM').asFloat := 0;
      end else
      begin
         cdsOrcamentoCC.FieldByName('VARACUM').asFloat := (((cdsOrcamentoCC.FieldByName('SALDOREAL').asFloat - cdsOrcamentoCC.FieldByName('SALDOORC').asFloat) /
                                                            cdsOrcamentoCC.FieldByName('SALDOORC').asFloat) * 100);
      end;
      //----------------------------------------------------------------------------------
      cdsOrcamentoCC.Post;
      cdsOrcamentoCC.Next;
   end;
end;
//========================================================================================
// Eventos do Relatório
//========================================================================================
procedure TrptOrcamentoCC.ppHeaderBand10BeforePrint(Sender: TObject);
begin
   inherited;
   if not bCodigo then
   begin
      txtContaOrc.visible   := false;
      txtNomeContaOrc.left  := 5;
   end;
   //-------------------------------------------------------------------------------------
   if bIngles then
   begin
      txtContaOrc.caption     := 'Code';
      txtNomeContaOrc.caption := 'Name';
      txtPeriodo.caption      := 'Current Month';
      txtOrc.caption          := 'Budget';
      txtReal.caption         := 'Actual';
      txtVar.caption          := 'Ratio';
      txtAcumulado.caption    := 'Year to Date';
      txtOrcAcu.caption       := 'Budget';
      txtRealAcu.caption      := 'Actual';
      txtVarAcu.caption       := 'Ratio';
   end else
   begin
      txtContaOrc.caption     := 'Código';
      txtNomeContaOrc.caption := 'Nome';
      txtPeriodo.caption      := 'Período';
      txtOrc.caption          := 'Orçado';
      txtReal.caption         := 'Realizado';
      txtVar.caption          := 'Variação';
      txtAcumulado.caption    := 'Acumulado no Exercício';
      txtOrcAcu.caption       := 'Orçado';
      txtRealAcu.caption      := 'Realizado';
      txtVarAcu.caption       := 'Variação';
   end;
end;
//========================================================================================
procedure TrptOrcamentoCC.GrpHeadSinteticoBeforeGenerate(Sender: TObject);
begin
   inherited;
   if sMascaraCCusto <> '' then
   begin
      sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraCCusto, FuncaoGeral.CalcGrau(modulo.sMascaraCCusto, cdsOrcamentoCC.FieldByName('CODCENTROCUSTO').asString));
      ppDBCODCCUSTO.DisplayFormat := sMascaraCCusto + ';0; ';
   end;
end;
//========================================================================================
procedure TrptOrcamentoCC.GrpHeadSinteticoBeforePrint(Sender: TObject);
begin
   inherited;
   cc_nome := 'Total :';
   //-------------------------------------------------------------------------------------
   if cdsOrcamentoCC.FieldByName('CCTIPO').AsString = 'S' then
   begin
      rgSintetico.Visible := True;
      bndDetOrcamento.Visible := False;
      ppGroupFooterBand1.Visible:= False;
   end else
   begin
      rgSintetico.Visible := False;
      bndDetOrcamento.Visible := True;
      ppGroupFooterBand1.Visible:= True;
   end;
end;
//========================================================================================
procedure TrptOrcamentoCC.bndDetOrcamentoBeforeGenerate(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Controla a altura da banda
   //-------------------------------------------------------------------------------------
   if bEspaco then
   begin
      if (sSintAnal = 'S') or (cdsOrcamentoCC.FieldByName('PLATIPO').asString = 'S') then
      begin
         bndDetOrcamento.Height := 23;
         dbtxtContaOrc.top      := 9;
         dbtxtCorrespOrc.top    := 9;
         dbtxtNomeContaOrc.top  := 9;
         dbtxtRealPerOrc.top    := 9;
         dbtxtDCRealPerOrc.top  := 9;
         dbtxtOrcPerOrc.top     := 9;
         dbtxtDCOrcPerOrc.top   := 9;
         dbtxtVarPer.top        := 9;
         txtVarPer.top          := 9;
         dbtxtOrcAcumOrc.top    := 9;
         dbtxtDCOrcAcumOrc.top  := 9;
         dbtxtReaLAcumOrc.top   := 9;
         dbtxtDCRealAcumOrc.top := 9;
         dbtxtVarAcum.top       := 9;
         txtVarAcum.top         := 9;
      end else
      begin
         bndDetOrcamento.Height := 16;
         dbtxtContaOrc.top      := 2;
         dbtxtCorrespOrc.top    := 2;
         dbtxtNomeContaOrc.top  := 2;
         dbtxtRealPerOrc.top    := 2;
         dbtxtDCRealPerOrc.top  := 2;
         dbtxtOrcPerOrc.top     := 2;
         dbtxtDCOrcPerOrc.top   := 2;
         dbtxtVarPer.top        := 2;
         txtVarPer.top          := 2;
         dbtxtOrcAcumOrc.top    := 2;
         dbtxtDCOrcAcumOrc.top  := 2;
         dbtxtReaLAcumOrc.top   := 2;
         dbtxtDCRealAcumOrc.top := 2;
         dbtxtVarAcum.top       := 2;
         txtVarAcum.top         := 2;
      end;
      sSintAnal := cdsOrcamentoCC.FieldByName('PLATIPO').asString;
   end else
   begin
      bndDetOrcamento.Height := 16;
      dbtxtContaOrc.top      := 2;
      dbtxtCorrespOrc.top    := 2;
      dbtxtNomeContaOrc.top  := 2;
      dbtxtRealPerOrc.top    := 2;
      dbtxtDCRealPerOrc.top  := 2;
      dbtxtOrcPerOrc.top     := 2;
      dbtxtDCOrcPerOrc.top   := 2;
      dbtxtVarPer.top        := 2;
      txtVarPer.top          := 2;
      dbtxtOrcAcumOrc.top    := 2;
      dbtxtDCOrcAcumOrc.top  := 2;
      dbtxtReaLAcumOrc.top   := 2;
      dbtxtDCRealAcumOrc.top := 2;
      dbtxtVarAcum.top       := 2;
      txtVarAcum.top         := 2;
   end;
   if bValores then
   begin
      dbtxtRealPerOrc.DisplayFormat  := '#,0.00;(#,0.00)';
      dbtxtOrcPerOrc.DisplayFormat   := '#,0.00;(#,0.00)';
      dbtxtVarPer.DisplayFormat      := '#,0.00;(#,0.00)';
      dbtxtOrcAcumOrc.DisplayFormat  := '#,0.00;(#,0.00)';
      dbtxtReaLAcumOrc.DisplayFormat := '#,0.00;(#,0.00)';
      dbtxtVarAcum.DisplayFormat     := '#,0.00;(#,0.00)';
   end else
   begin
      dbtxtRealPerOrc.DisplayFormat  := '#,0.00;-#,0.00';
      dbtxtOrcPerOrc.DisplayFormat   := '#,0.00;-#,0.00';
      dbtxtVarPer.DisplayFormat      := '#,0.00;-#,0.00';
      dbtxtOrcAcumOrc.DisplayFormat  := '#,0.00;-#,0.00';
      dbtxtReaLAcumOrc.DisplayFormat := '#,0.00;-#,0.00';
      dbtxtVarAcum.DisplayFormat     := '#,0.00;-#,0.00';
   end;
   //-------------------------------------------------------------------------------------
   // Configura a máscara das contas contábeis
   //-------------------------------------------------------------------------------------
   if sMascara <> '' then
   begin
      sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsOrcamentoCC.FieldByName('PLAGRAU').asInteger);
      dbtxtContaOrc.DisplayFormat := sMascara + ';0; ';
   end;
end;
//========================================================================================
procedure TrptOrcamentoCC.bndDetOrcamentoBeforePrint(Sender: TObject);
begin
  inherited;
   if not bCodigo then
   begin
     dbtxtContaOrc.Visible   := False;
     dbtxtCorrespOrc.Visible := False;
     dbtxtNomeContaOrc.Left  := 5;
   end;
   //-------------------------------------------------------------------------------------
   // Acumula os valores por centro de custo
   //-------------------------------------------------------------------------------------
   if cdsOrcamentoCC.FieldByName('PLATIPO').asString = 'A' then
   begin
      if cdsOrcamentoCC.FieldByName('DEBCREREAL').asString = 'D' then
      begin
         cc_totrealabs  := cc_totrealabs  + cdsOrcamentoCC.FieldByName('REALABS').asFloat;
         cc_totrealabsT := cc_totrealabsT + cdsOrcamentoCC.FieldByName('REALABS').asFloat;
      end else
      begin
         cc_totrealabs  := cc_totrealabs   - cdsOrcamentoCC.FieldByName('REALABS').asFloat;
         cc_totrealabsT := cc_totrealabsT  - cdsOrcamentoCC.FieldByName('REALABS').asFloat;
      end;
      //----------------------------------------------------------------------------------
      if cdsOrcamentoCC.FieldByName('DEBCREORC').asString = 'D' then
      begin
         cc_totorcabs   := cc_totorcabs  + cdsOrcamentoCC.FieldByName('ORCABS').asFloat;
         cc_totorcabsT  := cc_totorcabsT + cdsOrcamentoCC.FieldByName('ORCABS').asFloat;
      end else
      begin
         cc_totorcabs   := cc_totorcabs  - cdsOrcamentoCC.FieldByName('ORCABS').asFloat;
         cc_totorcabsT  := cc_totorcabsT - cdsOrcamentoCC.FieldByName('ORCABS').asFloat;
      end;
      //----------------------------------------------------------------------------------
      if cdsOrcamentoCC.FieldByName('DEBCRESREAL').asString = 'D' then
      begin
         cc_totsrealabs  := cc_totsrealabs  + cdsOrcamentoCC.FieldByName('SREALABS').asFloat;
         cc_totsrealabsT := cc_totsrealabsT + cdsOrcamentoCC.FieldByName('SREALABS').asFloat;
      end else
      begin
         cc_totsrealabs   := cc_totsrealabs  - cdsOrcamentoCC.FieldByName('SREALABS').asFloat;
         cc_totsrealabsT  := cc_totsrealabsT - cdsOrcamentoCC.FieldByName('SREALABS').asFloat;
      end;
      //----------------------------------------------------------------------------------
      if cdsOrcamentoCC.FieldByName('DEBCRESORC').asString = 'D' then
      begin
         cc_totsorcabs    := cc_totsorcabs  + cdsOrcamentoCC.FieldByName('SORCABS').asFloat;
         cc_totsorcabsT   := cc_totsorcabsT + cdsOrcamentoCC.FieldByName('SORCABS').asFloat;
      end else
      begin
         cc_totsorcabs  := cc_totsorcabs  - cdsOrcamentoCC.FieldByName('SORCABS').asFloat;
         cc_totsorcabsT := cc_totsorcabsT - cdsOrcamentoCC.FieldByName('SORCABS').asFloat;
      end;

   end;
end;
//========================================================================================
procedure TrptOrcamentoCC.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // imprime os totais por centro de custo
   //-------------------------------------------------------------------------------------
   lblCCustoDesc.Caption := cc_nome;

   if cc_totrealabs < 0 then
      rptOrcamentoCCLabel100.Caption := FormatFloat('#,##0.00', ABS(cc_totrealabs))  + ' C'
   else
      rptOrcamentoCCLabel100.Caption := FormatFloat('#,##0.00', ABS(cc_totrealabs))  + ' D';

   if cc_totorcabs < 0 then
      rptOrcamentoCCLabel101.Caption := FormatFloat('#,##0.00', ABS(cc_totorcabs))   + ' C'
   else
      rptOrcamentoCCLabel101.Caption := FormatFloat('#,##0.00', ABS(cc_totorcabs))   + ' D';

   if cc_totsrealabs < 0 then
      rptOrcamentoCCLabel102.Caption := FormatFloat('#,##0.00', ABS(cc_totsrealabs)) + ' C'
   else
      rptOrcamentoCCLabel102.Caption := FormatFloat('#,##0.00', ABS(cc_totsrealabs)) + ' D';

   if cc_totsorcabs < 0 then
      rptOrcamentoCCLabel103.Caption := FormatFloat('#,##0.00', ABS(cc_totsorcabs))  + ' C'
   else
      rptOrcamentoCCLabel103.Caption := FormatFloat('#,##0.00', ABS(cc_totsorcabs))  + ' D';


end;
//========================================================================================
procedure TrptOrcamentoCC.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
   inherited;
   cc_totrealabs  := 0;
   cc_totorcabs   := 0;
   cc_totsrealabs := 0;
   cc_totsorcabs  := 0;

end;

procedure TrptOrcamentoCC.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  inherited;
  if x1 = 0 then
     x1 := cc_totrealabsT;

  if x2 = 0 then
     x2 := cc_totorcabsT;

  if x3 = 0 then
     x3 := cc_totsrealabsT;

  if x4 = 0 then
     x4 := cc_totsorcabsT;

  if cc_totrealabsT < 0 then
     rptOrcamentoCCLabel9.Caption  := FormatFloat('#,##0.00', ABS(x1)) + ' C'
  else
     rptOrcamentoCCLabel9.Caption  := FormatFloat('#,##0.00', ABS(x1)) + ' D';

  if cc_totorcabsT < 0 then
     rptOrcamentoCCLabel10.Caption := FormatFloat('#,##0.00', ABS(x2)) + ' C'
  else
     rptOrcamentoCCLabel10.Caption := FormatFloat('#,##0.00', ABS(x2)) + ' D';

  if cc_totsrealabsT < 0 then
     rptOrcamentoCCLabel11.Caption := FormatFloat('#,##0.00', ABS(x3)) + ' C'
  else
     rptOrcamentoCCLabel11.Caption := FormatFloat('#,##0.00', ABS(x3)) + ' D';

  if cc_totsorcabsT < 0 then
     rptOrcamentoCCLabel12.Caption := FormatFloat('#,##0.00', ABS(x4)) + ' C'
  else
     rptOrcamentoCCLabel12.Caption := FormatFloat('#,##0.00', ABS(x4)) + ' D';


end;

end.

