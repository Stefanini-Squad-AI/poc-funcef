{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}


unit RBalanceteAnalSubConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, uCtrlRptBalanceteAnalSubConta,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCtrlContab, uCmSqlParams, uCMClientDataSet, TXRB, ppSubRpt,
  raCodMod, ppParameter, ppRegion, Wwquery, pptypes;

type
  TRptBalanceteAnalSubConta = class(TFrmCmReport)
    dsBalancete: TwwDataSource;
    rptBalancete: TppReport;
    CdsBalTot: TClientDataSet;
    ppBalancete: TppDBPipeline;
    sqlTotalizador: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    ppParameterList1: TppParameterList;
    ppDetalheSubconta: TppDBPipeline;
    DsEspelho: TwwDataSource;
    cdsBalancete: TClientDataSet;
    cdsDetalheSubcontas: TClientDataSet;
    CMSqlParams1: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    ppHeaderBand2: TppHeaderBand;
    ppLblTituloBalancete: TppLabel;
    lblNomeEmpresa: TppLabel;
    ppLblTituloBalancete2: TppLabel;
    rptBalanceteLabel8: TppLabel;
    bndDetBalancete: TppDetailBand;
    ppRegion: TppRegion;
    ppSubReport: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBandSub: TppTitleBand;
    ppDetailBandSub: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    dbtxtDebSub: TppDBText;
    dbtxtCredSub: TppDBText;
    dbtxtMovAbs: TppDBText;
    dbtxtMovDc: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ppFooterBand2: TppFooterBand;
    bndSumarioBal: TppSummaryBand;
    memBalSaldoAnt: TppMemo;
    memBalDeb: TppMemo;
    memBalCre: TppMemo;
    memBalMov: TppMemo;
    memBalSaldo: TppMemo;
    memBalDesc: TppMemo;
    memBalDCSaldoAnt: TppMemo;
    memBalDCMov: TppMemo;
    memBalDCSaldo: TppMemo;
    rptBalanceteLabel2: TppLabel;
    rptBalanceteLabel3: TppLabel;
    rptBalanceteLabel4: TppLabel;
    rptBalanceteLabel5: TppLabel;
    rptBalanceteLabel6: TppLabel;
    rptBalanceteLine1: TppLine;
    rptBalanceteLabel7: TppLabel;
    lblNomeSistema: TppLabel;
    rptBalanceteLabel1: TppLabel;
    ppLine7: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    txtSaldoBal: TppLabel;
    txtMovBal: TppLabel;
    txtCredBal: TppLabel;
    txtDebBal: TppLabel;
    txtSaldoAntBal: TppLabel;
    lblNomeConta: TppLabel;
    lblCodConta: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    rptBalanceteDBText3: TppDBText;
    dbtxtContaBal: TppDBText;
    dbtxtCorrespBal: TppDBText;
    dbtxtNomeContaBal: TppDBText;
    dbtxtSaldoAntBal: TppDBText;
    dbtxtSaldoAntDCBal: TppDBText;
    dbtxtDebBal: TppDBText;
    dbtxtCredBal: TppDBText;
    dbtxtMovBal: TppDBText;
    dbtxtMovDCBal: TppDBText;
    dbtxtSaldoBal: TppDBText;
    dbtxtSaldoDCBal: TppDBText;
    ppLine1: TppLine;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    dbtxtPatro: TppDBText;
    dbtxtPlano: TppDBText;
    dbtxtCodspc: TppDBText;
    ppDBText10: TppDBText;
    ppLabel1: TppLabel;
    lblPatro: TppLabel;
    lblPlano: TppLabel;
    lblCodSpc: TppLabel;
    ppLabel2: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    lblContador: TppLabel;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure sqlTitulosFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure ppSubReportPrint(Sender: TObject);
    procedure rptBalanceteBeforePrint(Sender: TObject);
    procedure ppFooterBand2BeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlContab       : TCtrlContab;
    CtrlRptBalancete : TCtrlRptBalanceteAnalSubConta;
    sExercicio       : String;
    sPeriodoInicial  : String;
    sPeriodoFinal    : String;
    sContaInicial    : String;
    sContaFinal      : String;
    sCCustoInicial   : String;
    sCCustoFinal     : String;
    sAtividade       : String;
    sNomeAtividade_Marca :String;
    sNomePatro       : String;
    sNomePlanoPrev   : String;
    sNomeAtividade   : String;
    sMascara         : String;
    sGrau            : String;
    sPacTipoPerResult: String;
    iPagIni          : Integer;
    iNumColunas      : Integer;
    bIndenta         : Boolean;
    sSintAnal        : String;

    sExpandirAnalitica: Boolean;
    procedure FazQueryTotalizadores;
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses uCtrlPadroes, FSM_FxLib, uCtrlParamIntegra, uFuncaoGeral,
     uDatabase, DBaseDados, uString;

procedure TRptBalanceteAnalSubConta.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   sExercicio     :='';
   sPeriodoInicial:='';
   sPeriodoFinal  :='';
   sContaInicial  :='';
   sContaFinal    :='';
   sCCustoInicial :='';
   sCCustoFinal   :='';
   sNomePlanoPrev :='';
   sAtividade     :='';
   sNomeAtividade :='';

   sMascara       :='';
   sSintAnal      :='';
   sGrau          :='';

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

   CmpRptCM.ParamValues[13].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   CmpRptCM.ParamValues[13].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);


end;

procedure TRptBalanceteAnalSubConta.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
   inherited;
   case Index of
      0: sExercicio:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      1: sPeriodoInicial:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      2: sPeriodoFinal:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      3: sContaInicial:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      4: sContaFinal:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      5: sCCustoInicial:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      6: sCCustoFinal:=Trim(TPainelControles(Sender).CtrlLookup.Text);
      7: sAtividade:=Trim(TPainelControles(Sender).CtrlLookup.Text);
     25: sNomePlanoPrev:=Trim(TPainelControles(Sender).CtrlEdit.Text);
     26: sNomePatro:=Trim(TPainelControles(Sender).CtrlEdit.Text);
   end;
end;

procedure TRptBalanceteAnalSubConta.CrmRptCMBeforePrint(Sender: TObject);
var
   sTitulo : string;
   iNumero: integer;
   iGrau,i,iPlano : Integer;
   sUltimaContaAnalitica: string;
begin
    inherited;

    ppSubReport.ExpandAll := CmpRptCM.ParamValues[32].AsBoolean;

    if CmpRptCM.ParamValues[34].AsBoolean then
    begin
      ppSubReport.ExpandAll := True;
      sExpandirAnalitica    := True;
    end
    else
      sExpandirAnalitica    := False;

    sCCustoInicial  := '';
    sCCustoFinal    := '';
    sNomePlanoPrev  := '';
    sNomeAtividade  := '';
    iPlano          := 0;

    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
       sPacTipoPerResult := CtrlContab.TipoOpEncer
    else
       sPacTipoPerResult := '';



   //==================================================================
   // Calcula grau
   //==================================================================
   Try
      iGrau:=CmpRptCM.ParamValues[13].AsInteger;
   Except
      iGrau:=0;
   End;

   If (iGrau=0) then
      sGrau:=IntToStr(FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam))
   Else
      sGrau:=IntToStr(iGrau);
   //==================================================================

   memBalDesc.lines.Clear;
   memBalSaldoAnt.lines.Clear;
   memBalDeb.lines.Clear;
   memBalCre.lines.Clear;
   memBalMov.lines.Clear;
   memBalSaldo.lines.Clear;
   memBalDCSaldoAnt.lines.Clear;
   memBalDCMov.lines.Clear;
   memBalDCSaldo.lines.Clear;
   //
   sExercicio :=CmpRptCM.ParamValues[0].AsString;
   sPeriodoInicial := '';
   sPeriodoFinal   := '';
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
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[1].AsInteger;
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;

   sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[2].AsInteger;
   sqlTitulos.Open;

   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;
   //=====================================================================

   //==================================================================
   // Pega o Plano vigente
   //==================================================================
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := CtrlContab.PlanoParam;
   //==================================================================

   sContaInicial := '';
   if not CmpRptCM.ParamValues[3].IsNull then
      sContaInicial   := CmpRptCM.ParamValues[3].AsString;

   sContaFinal := '';
   if not CmpRptCM.ParamValues[4].IsNull then
      sContaFinal   := CmpRptCM.ParamValues[4].AsString;


   sNomePlanoPrev := '';
   if (Trim(CmpRptCM.ParamValues[26].AsString) <> '') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT NOME                                ');
      sqlTitulos.Sql.Add('FROM  PLANPREVCONTABIL                     ');
      sqlTitulos.Sql.Add('WHERE  IDPLANOPREV IN (:IDPLANOPREV_MARCA) ');
      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPLANOPREV_MARCA').asString  := Trim(CmpRptCM.ParamValues[26].AsString);
      sqlTitulos.Open;

      i := 0;
      if not cdsTitulos.isEmpty then
       begin
          cdsTitulos.First;
          while not cdsTitulos.Eof do
          begin
            inc(i);

            if i = 1 then
               sNomePlanoPrev :=  cdsTitulos.FieldByName('NOME').AsString
            else
               sNomePlanoPrev := sNomePlanoPrev + '/' + cdsTitulos.FieldByName('NOME').AsString;

            cdsTitulos.Next;
          end;
       end;
   end;


   sNomePatro := '';
   if (Trim(CmpRptCM.ParamValues[27].AsString) <> '') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT PE.NOME                           ');
      sqlTitulos.Sql.Add('FROM PESSOA PE,PATRO PA                  ');
      sqlTitulos.Sql.Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) AND    ');
      sqlTitulos.Sql.Add('      (PA.IDPESSOA IN (:IDPESSOA_MARCA)) ');

      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA_MARCA').asString  := Trim(CmpRptCM.ParamValues[27].AsString);
      sqlTitulos.Open;

      i := 0;
      if not cdsTitulos.isEmpty then
       begin
          cdsTitulos.First;
          while not cdsTitulos.Eof do
          begin
            inc(i);

            if i = 1 then
               sNomePatro :=  cdsTitulos.FieldByName('NOME').AsString
            else
               sNomePatro := sNomePatro + '/' + cdsTitulos.FieldByName('NOME').AsString;

            cdsTitulos.Next;
          end;
       end;
   end;

   sNomeAtividade_Marca := '';
   if (Trim(CmpRptCM.ParamValues[28].AsString) <> '') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT NOME FROM UNIDNEGOCIO            ');
      sqlTitulos.Sql.Add('WHERE (IDPESSOA = :IDPESSOA) AND        ');
      sqlTitulos.Sql.Add('      (UNIDNEGOC IN (:UNIDNEGOC_MARCA)) ');

      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA').asFloat          := CrmRptCM.IdEmpresa;
      sqlTitulos.ParamByName('UNIDNEGOC_MARCA').asString  := Trim(CmpRptCM.ParamValues[28].AsString);
      sqlTitulos.Open;

      i := 0;
      if not cdsTitulos.isEmpty then
       begin
          cdsTitulos.First;
          while not cdsTitulos.Eof do
          begin
            inc(i);

            if i = 1 then
               sNomeAtividade_Marca :=  cdsTitulos.FieldByName('NOME').AsString
            else
               sNomeAtividade_Marca := sNomeAtividade_Marca + '/' + cdsTitulos.FieldByName('NOME').AsString;

            cdsTitulos.Next;
          end;
       end;
   end;

   if (Trim(CmpRptCM.ParamValues[24].AsString)='') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT  PERNUMERO                     ');
      sqlTitulos.Sql.Add('FROM  PERIODO                         ');
      sqlTitulos.Sql.Add('WHERE                                 ');
      sqlTitulos.Sql.Add('  (IDPESSOA     = :IDPESSOA) AND      ');
      sqlTitulos.Sql.Add('  (PEREXERCICIO = :PEREXERCICIO) AND  ');
      sqlTitulos.Sql.Add('  (PERNUMERO BETWEEN :PERNUMERO1 AND :PERNUMERO2) AND ');
      sqlTitulos.Sql.Add('  ((PERBLOQUE IS NULL) OR (PERBLOQUE = ''N''))        ');

      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
      sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
      sqlTitulos.ParamByName('PERNUMERO1').asInteger   := CmpRptCM.ParamValues[1].AsInteger;
      sqlTitulos.ParamByName('PERNUMERO2').asInteger   := CmpRptCM.ParamValues[2].AsInteger;

      sqlTitulos.Open;

      if cdsTitulos.isEmpty then
      begin
         if (CmpRptCM.ParamValues[1].AsInteger = CmpRptCM.ParamValues[2].AsInteger) then
            sTitulo := 'Balancete - ' + sPeriodoInicial + '/' + sExercicio
         else
            sTitulo := 'Balancete - ' + sPeriodoInicial + '/' + sExercicio + ' a ' +
                                            sPeriodoFinal   + '/' + sExercicio;
         end
      else
      begin
         if (CmpRptCM.ParamValues[1].AsInteger = CmpRptCM.ParamValues[2].AsInteger) then
            sTitulo := 'Balancete Provisório - ' + sPeriodoInicial + '/' + sExercicio
         else
            sTitulo := 'Balancete Provisório - ' + sPeriodoInicial + '/' + sExercicio + ' a ' +
                                                   sPeriodoFinal   + '/' + sExercicio;
      end;

      //Imprime os títulos
      pplblTituloBalancete.caption := sTitulo;

      sTitulo := '';
      if (sContaInicial <> '') then
         sTitulo := sTitulo +  '     Conta Inicial : ' + sContaInicial;

      if (sContaFinal <> '') then
         sTitulo := sTitulo +  '     Conta Final : ' + sContaFinal;

      if (not CmpRptCM.ParamValues[5].IsNull) then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME,          ');

         sqlTitulos.SQL.Add('   CODEXTERNO ');

         sqlTitulos.SQL.Add('FROM  CENTCUST                        ');
         sqlTitulos.SQL.Add('WHERE                                 ');
         sqlTitulos.SQL.Add('   (IDEMPRESA      = :IDEMPRESA) AND  ');
         sqlTitulos.SQL.Add('   (CODCENTROCUSTO = :CODCENTROCUSTO) ');

         sqlTitulos.Prepare;
         sqlTitulos.ParamByName('IDEMPRESA').asFloat       := CrmRptCM.IdEmpresa;
         sqlTitulos.ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[5].AsString;

         sqlTitulos.Open;
         sCCustoInicial := cdsTitulos.FieldByName('CODEXTERNO').asString + ' - ' + cdsTitulos.FieldByName('NOME').asString;

         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sCCustoInicial;
      end;

      if (not CmpRptCM.ParamValues[6].IsNull) then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME,          ');

         sqlTitulos.SQL.Add('    CODEXTERNO ');

         sqlTitulos.SQL.Add('FROM  CENTCUST                        ');
         sqlTitulos.SQL.Add('WHERE                                 ');
         sqlTitulos.SQL.Add('   (IDEMPRESA      = :IDEMPRESA) AND  ');
         sqlTitulos.SQL.Add('   (CODCENTROCUSTO = :CODCENTROCUSTO) ');

         sqlTitulos.Prepare;
         sqlTitulos.ParamByName('IDEMPRESA').asFloat       := CrmRptCM.IdEmpresa;
         sqlTitulos.ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[6].AsString;

         sqlTitulos.Open;
         sCCustoFinal := cdsTitulos.FieldByName('CODEXTERNO').asString + ' - ' + cdsTitulos.FieldByName('NOME').asString;

         sTitulo := sTitulo +  '     Centro de Custo Final : ' + sCCustoFinal;
      end;

      if (not CmpRptCM.ParamValues[7].IsNull) then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT  UNIDNEGOC, NOME, UNECODIGO ');
         sqlTitulos.SQL.Add('FROM UNIDNEGOCIO                   ');
         sqlTitulos.SQL.Add('WHERE  (IDPESSOA  = :IDPESSOA) AND ');
         sqlTitulos.SQL.Add('       (UNIDNEGOC = :UNIDNEGOC)    ');

         sqlTitulos.Prepare;
         sqlTitulos.ParamByName('IDPESSOA').asFloat  := CrmRptCM.IdEmpresa;
         sqlTitulos.ParamByName('UNIDNEGOC').asFloat := StrToFloat(CmpRptCM.ParamValues[7].AsString);
         sqlTitulos.Open;

         sNomeAtividade := CmpRptCM.ParamValues[7].AsString + ' - ' + cdsTitulos.FieldByName('NOME').asString;
         sTitulo := sTitulo +  '     Atividade/Projeto : ' +CmpRptCM.ParamValues[7].AsString+' - '+   sNomeAtividade;
      end;

      ppLblTituloBalancete2.caption := sTitulo

   end
  else
   begin
     pplblTituloBalancete.caption  := CmpRptCM.ParamValues[24].AsString;
     ppLblTituloBalancete2.caption := CmpRptCM.ParamValues[25].AsString;
   end;

   iNumColunas := CmpRptCM.ParamValues[21].AsInteger + 3;

   //Configura a exibiçao da Conta Correspondente
   if CmpRptCM.ParamValues[14].AsBoolean then
   begin
     dbtxtCorrespBal.visible := true;
     dbtxtContaBal.visible   := false;
   end else
   begin
     dbtxtCorrespBal.visible := false;
     dbtxtContaBal.visible   := true;
   end;

   //Configura a quebra de página
   if CmpRptCM.ParamValues[11].AsBoolean then
      rptBalancete.Groups[0].NewPage := True
   else
      rptBalancete.Groups[0].NewPage := False;


   iPagIni := CmpRptCM.ParamValues[23].AsInteger;

   //========Esta é a parte de fazquery====
   rptBalanceteLabel8.Caption := '';

   if sNomePatro <> '' then
   begin
     rptBalanceteLabel8.Caption := rptBalanceteLabel8.Caption+'Patrocinadoras: '+sNomePatro
   end;

   if sNomePlanoPrev <> '' then
   begin
     rptBalanceteLabel8.Caption := rptBalanceteLabel8.Caption +' Planos: '+sNomePlanoPrev
   end;

   if sNomeAtividade_Marca <> '' then
   begin
     rptBalanceteLabel8.Caption := rptBalanceteLabel8.Caption+'  Ativ/Projetos: '+sNomeAtividade_Marca
   end;

   iNumero := FuncaoGeral.CalcNumEleGrau(CtrlContab.MascaraContaParam, 1);
   sSintAnal := 'A';


   cdsBalancete.Data := CtrlRptBalancete.FazQuery(
                        CmpRptCM.ParamValues[8].AsString,
                        CmpRptCM.ParamValues[9].AsString,
                        IntToStr(CmpRptCM.ParamValues[0].AsInteger),
                        IntToStr(CmpRptCM.ParamValues[1].AsInteger),
                        IntToStr(CmpRptCM.ParamValues[2].AsInteger),
                        CmpRptCM.ParamValues[3].AsString,
                        CmpRptCM.ParamValues[4].AsString,
                        CmpRptCM.ParamValues[22].AsBoolean,
                        CmpRptCM.ParamValues[29].AsBoolean,
                        IntToStr(iNumero),
                        CmpRptCM.ParamValues[7].AsString,
                        IntToStr(iPlano),
                        FloatToStr(CrmRptCM.IdEmpresa),
                        CtrlContab.TipoOpEncer,
                        CmpRptCM.ParamValues[26].AsString,
                        CmpRptCM.ParamValues[27].AsString,
                        CmpRptCM.ParamValues[28].AsString,
                        sGrau,
                        CmpRptCM.ParamValues[12].AsBoolean,
                        CmpRptCM.ParamValues[14].AsBoolean,
                        CmpRptCM.ParamValues[16].AsBoolean,
                        CmpRptCM.ParamValues[17].AsBoolean,
                        CmpRptCM.ParamValues[19].AsBoolean,
                        CmpRptCM.ParamValues[20].AsBoolean,
                        CmpRptCM.ParamValues[30].AsBoolean,
                        CmpRptCM.ParamValues[31].AsBoolean);


   //pendência 27313 - 28/01/2008 -  fazer um filter pela coluna PLANOCONTA.PLASECRETARIA
   if CmpRptCM.ParamValues[35].AsBoolean then
   begin
     cdsBalancete.Filtered := false;
     cdsBalancete.Filter   := 'PLASECRETARIA = ''S'' ';
     cdsBalancete.Filtered := true;
   end;



   cdsDetalheSubcontas.Data := CtrlRptBalancete.FazQueryDetalhe(
                               CmpRptCM.ParamValues[8].AsString,
                               CmpRptCM.ParamValues[9].AsString,
                               IntToStr(CmpRptCM.ParamValues[0].AsInteger),
                               IntToStr(CmpRptCM.ParamValues[1].AsInteger),
                               IntToStr(CmpRptCM.ParamValues[2].AsInteger),
                               CmpRptCM.ParamValues[3].AsString,
                               CmpRptCM.ParamValues[4].AsString,
                               CmpRptCM.ParamValues[22].AsBoolean,
                               CmpRptCM.ParamValues[29].AsBoolean,
                               IntToStr(iNumero),
                               CmpRptCM.ParamValues[7].AsString,
                               IntToStr(iPlano),
                               FloatToStr(CrmRptCM.IdEmpresa),
                               CtrlContab.TipoOpEncer,
                               CmpRptCM.ParamValues[26].AsString,
                               CmpRptCM.ParamValues[27].AsString,
                               CmpRptCM.ParamValues[28].AsString,
                               sGrau,
                               CmpRptCM.ParamValues[12].AsBoolean,
                               CmpRptCM.ParamValues[16].AsBoolean,
                               CmpRptCM.ParamValues[17].AsBoolean,
                               CmpRptCM.ParamValues[19].AsBoolean,
                               CmpRptCM.ParamValues[20].AsBoolean,
                               CmpRptCM.ParamValues[30].AsBoolean,
                               CmpRptCM.ParamValues[31].AsBoolean,
                               CmpRptCM.ParamValues[33].AsBoolean);


   if CmpRptCM.ParamValues[18].AsBoolean then
   begin
     bndSumarioBal.visible := true;
     FazQueryTotalizadores;
   end
   else
   begin
     bndSumarioBal.visible := false;
   end;

end;




procedure TRptBalanceteAnalSubConta.FazQueryTotalizadores;
var
  sGrupo, sGrupoDesc: string;
  rResulAnt, rResulAtu, rResulMov : Double;
begin

   With sqlTotalizador.Sql do
   Begin
      Clear;
      If CmpRptCM.ParamValues[19].asBoolean then begin
         Add('SELECT                                                           ');
         Add('   U.PLAGRUPO,                                                   ');
         Add('   SUM(U.DEBA) AS DEBA,                                          ');
         Add('   SUM(U.CREDA) AS CREDA,                                        ');
         Add('   SUM(U.MOVA) AS MOVA,                                          ');
         Add('   SUM(U.SALDOANT) AS SALDOANT, SUM(U.SALDO) AS SALDO            ');
         Add('FROM                                                             ');
         Add('((SELECT                                                         ');
         Add('   C.PLAGRUPO,                                                   ');
         Add('   S.DEBA,                                                       ');
         Add('   S.CREDA,                                                      ');
         Add('   S.MOVA,                                                       ');
         Add('   SA.SALDOANT, SS.SALDO                                         ');
         Add('FROM                                                             ');
         Add('    PLANOCONTA C,                                                ');
         Add('   (SELECT                                                       ');
         Add('       C.PLAGRUPO,                                               ');
         Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
         Add('    FROM LANCAMENTO L, PLANILHA P, PLANOCONTA C                  ');
         Add('    WHERE                                                        ');
         Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
         Add('          (L.TIPCODIGO = '''+CtrlContab.TipoOpEncer+''') AND     ');
         Add('          (P.PERNUMERO <:PERIODOINI) AND                         ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                         ');
            Add('       (L.IDPESSOA =:PESSOA)) AND                             ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (L.CODCENTROCUSTO >= :CCUSTOINI) AND                   ');
            Add('       (L.IDEMPRESA =:EMPRESA) AND                            ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (L.CODCENTROCUSTO <= :CCUSTOFIM) AND                   ');
            Add('       (L.IDEMPRESA =:EMPRESA) AND                            ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (L.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (L.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (L.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (P.IDPESSOA  =:IDPESSOA) AND               ');
         Add('          (L.PLANO     =:PLANO) AND                  ');
         Add('          (C.PLACONTA  = L.PLACONTA) AND             ');
         Add('          (C.PLANO     = L.PLANO) AND                ');
         Add('          (P.PLNCODIGO = L.PLNCODIGO)                ');
         Add('    GROUP BY C.PLAGRUPO ) SA,                        ');
         Add('                                                     ');
         Add('   (SELECT                                           ');
         Add('       C.PLAGRUPO,                                   ');
         Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0)) AS DEBA,         ');
         Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0)) AS CREDA,        ');
         Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS MOVA ');
         Add('    FROM LANCAMENTO L, PLANILHA P, PLANOCONTA C                        ');
         Add('    WHERE                                                              ');
         Add('          (P.PEREXERCICIO =:EXERCICIO) AND                             ');
         Add('          (L.TIPCODIGO = '''+CtrlContab.TipoOpEncer+''') AND           ');
         Add('          (P.PERNUMERO >=:PERIODOINI) AND                              ');
         Add('          (P.PERNUMERO <=:PERIODOFIM) AND                              ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                               ');
            Add('       (L.IDPESSOA =:PESSOA)) AND                                   ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (L.CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
            Add('       (L.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (L.CODCENTROCUSTO <= :CCUSTOFIM) AND                   ');
            Add('       (L.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (L.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (L.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (L.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (P.IDPESSOA  =:IDPESSOA) AND                           ');
         Add('          (L.PLANO     =:PLANO) AND                              ');
         Add('          (C.PLACONTA  = L.PLACONTA) AND                         ');
         Add('          (C.PLANO     = L.PLANO) AND                            ');
         Add('          (P.PLNCODIGO = L.PLNCODIGO)                            ');
         Add('    GROUP BY C.PLAGRUPO ) S,                                     ');
         Add('                                                                 ');
         Add('   (SELECT                                                       ');
         Add('       C.PLAGRUPO,                                               ');
         Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
         Add('    FROM LANCAMENTO L, PLANILHA P, PLANOCONTA C                  ');
         Add('    WHERE                                                        ');
         Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
         Add('          (L.TIPCODIGO = '''+CtrlContab.TipoOpEncer+''') AND     ');
         Add('          (P.PERNUMERO <=:PERIODOFIM) AND                        ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                         ');
            Add('       (L.IDPESSOA =:PESSOA)) AND                             ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (L.CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
            Add('       (L.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            Add('       (L.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (L.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (L.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (L.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (P.IDPESSOA  =:IDPESSOA) AND                ');
         Add('          (L.PLANO     = :PLANO) AND                  ');
         Add('          (C.PLACONTA  = L.PLACONTA) AND              ');
         Add('          (C.PLANO     = L.PLANO) AND                 ');
         Add('          (P.PLNCODIGO = L.PLNCODIGO)                 ');
         Add('    GROUP BY C.PLAGRUPO ) SS                          ');
         Add('                                                      ');
         Add('WHERE                                                            ');
         Add('    (C.PLATIPO      = ''A'')      AND                            ');
         Add('    (C.PLANO        = :PLANO)     AND                            ');
         Add('    (SA.PLAGRUPO(+) = C.PLAGRUPO) AND                            ');
         Add('    (SS.PLAGRUPO(+) = C.PLAGRUPO) AND                            ');
         Add('    (S.PLAGRUPO(+)  = C.PLAGRUPO)                                ');
         If CmpRptCM.ParamValues[20].asBoolean then begin
            Add(' AND (C.PLAGRUPO <> ''E'')                                     ');
         end;
         If CmpRptCM.ParamValues[17].asBoolean then begin
            Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
            Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
         end;
         Add(' GROUP BY                                                        ');
         Add('   C.PLAGRUPO,                                                   ');
         Add('   S.DEBA,                                                       ');
         Add('   S.CREDA,                                                      ');
         Add('   S.MOVA,                                                       ');
         Add('   SA.SALDOANT, SS.SALDO)                                        ');
         Add('UNION ALL                                                        ');
         Add('(SELECT                                                          ');
         Add('   C.PLAGRUPO,                                                   ');
         Add('   S.DEBA,                                                       ');
         Add('   S.CREDA,                                                      ');
         Add('   S.MOVA,                                                       ');
         Add('   SA.SALDOANT, SS.SALDO                                         ');
         Add('FROM                                                             ');
         Add('    PLANOCONTA C,                                                ');
         Add('   (SELECT                                                       ');
         Add('       C.PLAGRUPO, SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
         Add('                   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT');
         Add('    FROM PLANOSALDO S, PLANOCONTA C                                              ');
         Add('    WHERE                                                            ');
         Add('          (C.PLATIPO      = ''A'')      AND                          ');
         Add('          (S.PEREXERCICIO =:EXERCICIO) AND                           ');
         Add('          ((S.PERNUMERO <:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND  ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            Add('       (S.IDPESSOA =:PESSOA)) AND                               ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (S.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (S.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (S.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (S.IDPESSOA =:IDPESSOA) AND                            ');
         Add('          (S.PLANO    = :PLANO) AND                              ');
         Add('          (C.PLACONTA = S.PLACONTA) AND (C.PLANO = S.PLANO)      ');
         Add('    GROUP BY C.PLAGRUPO ) SA,                                    ');
         Add('                                                                 ');
         Add('   (SELECT  C.PLAGRUPO,                                                 ');
         Add('   SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS DEBA, ');
         Add('   SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS CREDA,        ');
         Add('   (SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -        ');
         Add('      DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR))) AS MOVA          ');
         Add('    FROM PLANOSALDO S, PLANOCONTA C                                              ');
         Add('    WHERE                                                            ');
         Add('          (C.PLATIPO      = ''A'')      AND                      ');
         Add('          (S.PEREXERCICIO =:EXERCICIO) AND                           ');
         Add('          ((S.PERNUMERO >=:PERIODOINI) AND (S.PERNUMERO <=:PERIODOFIM)) AND  ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            Add('       (S.IDPESSOA =:PESSOA)) AND                               ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (S.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (S.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (S.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
         Add('          (S.PLANO = :PLANO) AND                                   ');
         Add('          (C.PLACONTA = S.PLACONTA) AND (C.PLANO = S.PLANO)        ');
         Add('    GROUP BY C.PLAGRUPO ) S,                                       ');
         Add('                                                                   ');
         Add('   (SELECT                                                         ');
         Add('       C.PLAGRUPO, SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
         Add('                   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO');
         Add('    FROM PLANOSALDO S, PLANOCONTA C                              ');
         Add('    WHERE                                                        ');
         Add('          (C.PLATIPO      = ''A'')      AND                      ');
         Add('          (S.PEREXERCICIO =:EXERCICIO) AND                       ');
         Add('          ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND  ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            Add('       (S.IDPESSOA =:PESSOA)) AND                               ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (S.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (S.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (S.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (S.IDPESSOA =:IDPESSOA) AND                            ');
         Add('          (S.PLANO = :PLANO)      AND                            ');
         Add('          (C.PLACONTA = S.PLACONTA) AND (C.PLANO = S.PLANO)      ');
         Add('    GROUP BY C.PLAGRUPO ) SS                                     ');
         Add('                                                                 ');
         Add('WHERE                                                            ');
         Add('    (C.PLATIPO      = ''A'')      AND                            ');
         Add('    (C.PLANO        = :PLANO)     AND                            ');
         Add('    (SA.PLAGRUPO(+) = C.PLAGRUPO) AND                            ');
         Add('    (SS.PLAGRUPO(+) = C.PLAGRUPO) AND                            ');
         Add('    (S.PLAGRUPO(+) = C.PLAGRUPO)                                 ');
         If CmpRptCM.ParamValues[20].asBoolean then begin
            Add(' AND (C.PLAGRUPO <> ''E'')                                    ');
         end;
         If CmpRptCM.ParamValues[17].asBoolean then begin
            Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
            Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
         end;
         Add(' GROUP BY                                                        ');
         Add('   C.PLAGRUPO,                                                   ');
         Add('   S.DEBA,                                                       ');
         Add('   S.CREDA,                                                      ');
         Add('   S.MOVA,                                                       ');
         Add('   SA.SALDOANT, SS.SALDO)) U                                     ');
         Add('GROUP BY U.PLAGRUPO                                              ');
      end else begin
         Add('SELECT                                                           ');
         Add('   C.PLAGRUPO,                                                   ');
         Add('   S.DEBA,                                                       ');
         Add('   S.CREDA,                                                      ');
         Add('   S.MOVA,                                                       ');
         Add('   SA.SALDOANT, SS.SALDO                                         ');
         Add('FROM                                                             ');
         Add('    PLANOCONTA C,                                                ');
         Add('   (SELECT C.PLAGRUPO,                                           ');
         Add('   (SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -        ');
         Add('      DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR))) AS SALDOANT      ');
         Add('    FROM PLANOSALDO S, PLANOCONTA C                                              ');
         Add('    WHERE                                                            ');
         Add('          (C.PLATIPO      = ''A'')      AND                          ');
         Add('          (S.PEREXERCICIO =:EXERCICIO) AND                           ');
         Add('          ((S.PERNUMERO <:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND  ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            Add('       (S.IDPESSOA =:PESSOA)) AND                               ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                             ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (S.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (S.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (S.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
         Add('          (S.PLANO = :PLANO) AND                     ');
         Add('          (C.PLACONTA = S.PLACONTA) AND (C.PLANO = S.PLANO)      ');
         Add('    GROUP BY C.PLAGRUPO ) SA,                                    ');
         Add('                                                                 ');
         Add('   (SELECT  C.PLAGRUPO,                                                 ');
         Add('   SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS DEBA, ');
         Add('   SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS CREDA,        ');
         Add('   (SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE) -        ');
         Add('      DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR))) AS MOVA          ');
         Add('    FROM PLANOSALDO S, PLANOCONTA C                                              ');
         Add('    WHERE                                                               ');
         Add('          (C.PLATIPO      = ''A'')     AND                              ');
         Add('          (S.PEREXERCICIO =:EXERCICIO) AND                              ');
         Add('          ((S.PERNUMERO >=:PERIODOINI) AND (S.PERNUMERO <=:PERIODOFIM)) AND  ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            Add('       (S.IDPESSOA =:PESSOA)) AND                               ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO >= :CCUSTOINI) AND                     ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                              ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO <= :CCUSTOFIM) AND                     ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                              ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (S.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (S.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (S.UNIDNEGOC IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
         Add('          (S.PLANO = :PLANO) AND                                   ');
         Add('          (C.PLACONTA = S.PLACONTA) AND (C.PLANO = S.PLANO)        ');
         Add('    GROUP BY C.PLAGRUPO ) S,                                       ');
         Add('                                                                   ');
         Add('   (SELECT                                                         ');
         Add('       C.PLAGRUPO, SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
         Add('                   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO');
         Add('    FROM PLANOSALDO S, PLANOCONTA C                              ');
         Add('    WHERE                                                        ');
         Add('          (C.PLATIPO      = ''A'')      AND                      ');
         Add('          (S.PEREXERCICIO =:EXERCICIO) AND                       ');
         Add('          ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND  ');
         If CmpRptCM.ParamValues[7].asString <> '' then begin
            Add('       ((S.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            Add('       (S.IDPESSOA =:PESSOA)) AND                               ');
         end;
         If CmpRptCM.ParamValues[5].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO >= :CCUSTOINI) AND                     ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                              ');
         end;
         If CmpRptCM.ParamValues[6].asString <> '' then begin
            Add('       (S.CODCENTROCUSTO <= :CCUSTOFIM) AND                     ');
            Add('       (S.IDEMPRESA =:EMPRESA) AND                              ');
         end;
         If CmpRptCM.ParamValues[26].asString <> '' then begin
            Add('      (S.IDPLANOPREV IN (' + CmpRptCM.ParamValues[26].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[27].asString <> '' then begin
            Add('      (S.IDPATRO IN (' + CmpRptCM.ParamValues[27].asString + ')) AND ');
         end;
         If CmpRptCM.ParamValues[28].asString <> '' then begin
            Add('      (S.UNIDNEGOC IN (' + CmpRptCM.ParamValues[28].asString + ')) AND ');
         end;
         Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
         Add('          (S.PLANO = :PLANO)        AND              ');
         Add('          (C.PLACONTA = S.PLACONTA) AND (C.PLANO = S.PLANO)      ');
         Add('    GROUP BY C.PLAGRUPO ) SS                                     ');
         Add('                                                                 ');
         Add('WHERE                                                            ');
         Add('    (C.PLATIPO      = ''A'')      AND                            ');
         Add('    (C.PLANO        = :PLANO)     AND                            ');
         Add('    (SA.PLAGRUPO(+) = C.PLAGRUPO) AND                            ');
         Add('    (SS.PLAGRUPO(+) = C.PLAGRUPO) AND                            ');
         Add('    (S.PLAGRUPO(+) = C.PLAGRUPO)                                 ');
         If CmpRptCM.ParamValues[20].asBoolean then begin
            Add(' AND (C.PLAGRUPO <> ''E'')                            ');
         end;
         If CmpRptCM.ParamValues[17].asBoolean then begin
            Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
            Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
         end;
         Add(' GROUP BY                                                        ');
         Add('   C.PLAGRUPO,                                                   ');
         Add('   S.DEBA,                                                       ');
         Add('   S.CREDA,                                                      ');
         Add('   S.MOVA,                                                       ');
         Add('   SA.SALDOANT, SS.SALDO                                         ');
      end;
      sqlTotalizador.Prepare;
      sqlTotalizador.ParamByName('PLANO').asInteger      := ParamIntegra.Plano;
      sqlTotalizador.ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
      sqlTotalizador.ParamByName('EXERCICIO').asInteger  := StrToInt(CmpRptCM.ParamValues[0].asString);
      sqlTotalizador.ParamByName('PERIODOINI').asInteger := CmpRptCM.ParamValues[1].asInteger;
      sqlTotalizador.ParamByName('PERIODOFIM').asInteger := CmpRptCM.ParamValues[2].asInteger;

      If CmpRptCM.ParamValues[5].asString <> '' then begin
         sqlTotalizador.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].asString,10);
         sqlTotalizador.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      If CmpRptCM.ParamValues[6].asString <> '' then begin
         sqlTotalizador.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].asString,10);
         sqlTotalizador.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      If CmpRptCM.ParamValues[7].asString <> '' then begin
         sqlTotalizador.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].asString);
         sqlTotalizador.ParamByName('PESSOA').asFloat     := CrmRptCM.IdEmpresa;
      end;
      sqlTotalizador.Open;
   End;

   With CdsBalTot Do
   Begin
      rResulAnt := 0;
      rResulAtu := 0;
      rResulMov := 0;
      while not eof do
      begin
         sGrupo := FieldByName('PLAGRUPO').AsString;
         if (sGrupo = 'A') or (sGrupo = 'P') then
          begin
             rResulAnt := rResulAnt + FieldByName('SALDOANT').asFloat;
             rResulAtu := rResulAtu + FieldByName('SALDO').asFloat;
             rResulMov := rResulMov + FieldByName('MOVA').asFloat;
          end;

         case sGrupo[1] of
           'A': sGrupoDesc := 'Contas de Ativo';
           'P': sGrupoDesc := 'Contas de Passivo';
           'R': sGrupoDesc := 'Contas de Receita';
           'D': sGrupoDesc := 'Contas de Despesa';
           'C': sGrupoDesc := 'Contas de Custo';
           'O': sGrupoDesc := 'Outras';
           'E': sGrupoDesc := 'Contas Estatísticas';
         end;

         memBalDesc.lines.Add(sGrupoDesc);
         memBalSaldoAnt.lines.Add(FormatFloat('###,###,###,##0.00', ABS(FieldByName('SALDOANT').asFloat)));
         memBalDeb.lines.Add     (FormatFloat('###,###,###,##0.00', FieldByName('DEBA').asFloat));
         memBalCre.lines.Add     (FormatFloat('###,###,###,##0.00', FieldByName('CREDA').asFloat));
         memBalMov.lines.Add     (FormatFloat('###,###,###,##0.00', ABS(FieldByName('MOVA').asFloat)));
         memBalSaldo.lines.Add   (FormatFloat('###,###,###,##0.00', ABS(FieldByName('SALDO').asFloat)));

         if FieldByName('SALDOANT').asFloat < 0 then
            memBalDCSaldoAnt.lines.Add('C')
         else
            memBalDCSaldoAnt.lines.Add('D');

         if FieldByName('MOVA').asFloat < 0 then
            memBalDCMov.lines.Add('C')
         else
            memBalDCMov.lines.Add('D');

         if FieldByName('SALDO').asFloat < 0 then
            memBalDCSaldo.lines.Add('C')
         else
            memBalDCSaldo.lines.Add('D');
         Next;
      end;

      rResulAnt := rResulAnt * -1;
      rResulAtu := rResulAtu * -1;
      rResulMov := rResulMov * -1;

      memBalDesc.lines.Add('Resultado');
      memBalSaldoAnt.lines.Add(FormatFloat('###,###,###,##0.00', ABS(rResulAnt)));
      if rResulMov > 0 then
       begin
          memBalDeb.lines.Add(FormatFloat('###,###,###,##0.00', ABS(rResulMov)));
          memBalCre.lines.Add(FormatFloat('###,###,###,##0.00', 0));
       end
      else
       begin
          memBalDeb.lines.Add(FormatFloat('###,###,###,##0.00', 0));
          memBalCre.lines.Add(FormatFloat('###,###,###,##0.00', ABS(rResulMov)));
       end;

      memBalMov.lines.Add(FormatFloat('###,###,###,##0.00', ABS(rResulMov)));
      memBalSaldo.lines.Add(FormatFloat('###,###,###,##0.00', ABS(rResulAtu)));
      //
      if rResulAnt < 0 then
         memBalDCSaldoAnt.lines.Add('C')
      else
         memBalDCSaldoAnt.lines.Add('D');

      if rResulMov < 0 then
         memBalDCMov.lines.Add('C')
      else
         memBalDCMov.lines.Add('D');

      if rResulAtu < 0 then
         memBalDCSaldo.lines.Add('C')
      else
         memBalDCSaldo.lines.Add('D');
   end;



end;

procedure TRptBalanceteAnalSubConta.CmpRptCMParamControlEnter(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = '+trim(sExercicio);
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      2: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = '+trim(sExercicio);
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;
end;

procedure TRptBalanceteAnalSubConta.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalanceteAnalSubConta.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TRptBalanceteAnalSubConta.sqlTitulosFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'IDPLANOPREV_MARCA') or
     (sParamName = 'IDPESSOA_MARCA')    or
     (sParamName = 'UNIDNEGOC_MARCA')  then
     sNewValue := Copy(sOldValue,1,Length(sOldValue));

end;

procedure TRptBalanceteAnalSubConta.ppSubReportPrint(Sender: TObject);
begin
  inherited;

  cdsDetalheSubcontas.Filtered := false;

  if sExpandirAnalitica then
  begin
    cdsDetalheSubcontas.Filter := 'PLATIPO = ''A'' ';
    cdsDetalheSubcontas.Filter := cdsDetalheSubcontas.Filter + ' AND PLACONTA = '+ quotedStr(cdsBalancete.fieldByName('PLACONTA').asString);
  end
  else
    cdsDetalheSubcontas.Filter := 'PLACONTA = '+ quotedStr(cdsBalancete.fieldByName('PLACONTA').asString);

  if cdsBalancete.FindField('IDPATRO') <> nil then
    cdsDetalheSubcontas.Filter := cdsDetalheSubcontas.Filter + ' AND IDPATRO = '+ cdsBalancete.fieldByName('IDPATRO').asString;

  if CmpRptCM.ParamValues[29].asBoolean then
  begin
    if cdsBalancete.FindField('CODSPC') <> nil then
      cdsDetalheSubcontas.Filter := cdsDetalheSubcontas.Filter + ' AND CODSPC = '+ quotedStr(cdsBalancete.fieldByName('CODSPC').asString);
  end
  else
  begin
    if cdsBalancete.FindField('IDPLANOPREV') <> nil then
      cdsDetalheSubcontas.Filter  := cdsDetalheSubcontas.Filter + ' AND IDPLANOPREV = '+ cdsBalancete.fieldByName('IDPLANOPREV').asString;

    if cdsBalancete.FindField('PLANOPREV') <> nil then
      cdsDetalheSubcontas.Filter  := cdsDetalheSubcontas.Filter + ' AND PLANOPREV = '+ quotedStr(cdsBalancete.fieldByName('PLANOPREV').asString);
  end;

  if cdsBalancete.FindField('PATRO') <> nil then
    cdsDetalheSubcontas.Filter  := cdsDetalheSubcontas.Filter + ' AND PATRO = '+ quotedStr(cdsBalancete.fieldByName('PATRO').asString);

  //***
  if cdsDetalheSubcontas.FindField('CODSUBCONTA') <> nil then
    cdsDetalheSubcontas.IndexFieldNames := 'CODSUBCONTA'
  else
  begin
    lblCodSpc.Visible   := false;
    dbtxtCodspc.Visible := false;
  end;

  if cdsDetalheSubcontas.FindField('PLANOPREV') = nil then
  begin
    lblPlano.Visible   := false;
    dbtxtPlano.Visible := false;
  end;

  if cdsDetalheSubcontas.FindField('PATRO') = nil then
  begin
    lblPatro.Visible   := false;
    dbtxtPatro.Visible := false;
  end;



  //oculta a coluna movimentaão
  if (CmpRptCM.ParamValues[21].AsInteger <> 0) and (CmpRptCM.ParamValues[21].AsInteger <> 2) then
  begin
    txtMovBal.Visible     := false;
    dbtxtMovBal.Visible   := false;
    dbtxtMovDCBal.Visible := false;
    dbtxtMovAbs.Visible   := false;
    dbtxtMovDc.Visible    := false;
  end
  //oculta as colunas de débito e crédito
  else if (CmpRptCM.ParamValues[21].AsInteger <> 1) and (CmpRptCM.ParamValues[21].AsInteger <> 2) then
  begin
    txtDebBal.Visible    := false;
    txtCredBal.Visible   := false;
    dbtxtDebBal.Visible  := false;
    dbtxtCredBal.Visible := false;
    dbtxtDebSub.Visible  := false;
    dbtxtCredSub.Visible := false;
  end
  else  //não oculta as colunas débito, credito e movimentação
  begin
    txtMovBal.Visible     := true;
    dbtxtMovBal.Visible   := true;
    dbtxtMovDCBal.Visible := true;
    dbtxtMovAbs.Visible   := true;
    dbtxtMovDc.Visible    := true;
    txtDebBal.Visible     := true;
    txtCredBal.Visible    := true;
    dbtxtDebBal.Visible   := true;
    dbtxtCredBal.Visible  := true;
    dbtxtDebSub.Visible   := true;
    dbtxtCredSub.Visible  := true;
  end;

  if not CmpRptCM.ParamValues[29].AsBoolean then
  begin
    lblCodSpc.visible := false;
    dbtxtCodspc.Visible := false;
  end;

  if cdsDetalheSubcontas.FindField('PATRO') = nil then
  begin
    lblPatro.Visible := false;
    dbtxtPatro.Visible := false;
  end;


  cdsDetalheSubcontas.Filtered := true;

end;

procedure TRptBalanceteAnalSubConta.rptBalanceteBeforePrint(Sender: TObject);
var
   sTitulo : string;
   iNumero: integer;
   iGrau,i,iPlano : Integer;
   sUltimaContaAnalitica: string;
begin
  inherited;
  sMascara := '';
  if CmpRptCM.ParamValues[10].AsBoolean then
    sMascara := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
    //sMascara := ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043

  //Configura a máscara das contas contábeis
  if (sMascara <> '') {and (CdsBalancete.FieldByName('PLAGRAU').asInteger <> 0)} then
  begin
     //sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaParam, CdsBalancete.FieldByName('PLAGRAU').asInteger);
     dbtxtContaBal.DisplayFormat := sMascara + ';0; ';
  end
  else
  begin
     dbtxtContaBal.DisplayFormat := '';
  end;

  sqlTitulos.SQL.Clear;
  sqlTitulos.Sql.Add('SELECT NOME                           ');
  sqlTitulos.Sql.Add('FROM PESSOA               ');
  sqlTitulos.Sql.Add('WHERE IDPESSOA = ' + intToStr(sistema.idempresa) );
  sqlTitulos.Open;
  lblNomeEmpresa.Caption := cdsTitulos.fieldByName('NOME').asString;


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
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[1].AsInteger;
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;

   sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[2].AsInteger;
   sqlTitulos.Open;

   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;
   //=====================================================================

   //==================================================================
   // Pega o Plano vigente
   //==================================================================
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := CtrlContab.PlanoParam;
   //==================================================================

   sContaInicial := '';
   if not CmpRptCM.ParamValues[3].IsNull then
      sContaInicial   := CmpRptCM.ParamValues[3].AsString;

   sContaFinal := '';
   if not CmpRptCM.ParamValues[4].IsNull then
      sContaFinal   := CmpRptCM.ParamValues[4].AsString;


   sNomePlanoPrev := '';
   if (Trim(CmpRptCM.ParamValues[26].AsString) <> '') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT NOME                                ');
      sqlTitulos.Sql.Add('FROM  PLANPREVCONTABIL                     ');
      sqlTitulos.Sql.Add('WHERE  IDPLANOPREV IN (:IDPLANOPREV_MARCA) ');
      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPLANOPREV_MARCA').asString  := Trim(CmpRptCM.ParamValues[26].AsString);
      sqlTitulos.Open;

      i := 0;
      if not cdsTitulos.isEmpty then
       begin
          cdsTitulos.First;
          while not cdsTitulos.Eof do
          begin
            inc(i);

            if i = 1 then
               sNomePlanoPrev :=  cdsTitulos.FieldByName('NOME').AsString
            else
               sNomePlanoPrev := sNomePlanoPrev + '/' + cdsTitulos.FieldByName('NOME').AsString;

            cdsTitulos.Next;
          end;
       end;
   end;


   sNomePatro := '';
   if (Trim(CmpRptCM.ParamValues[27].AsString) <> '') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT PE.NOME                           ');
      sqlTitulos.Sql.Add('FROM PESSOA PE,PATRO PA                  ');
      sqlTitulos.Sql.Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) AND    ');
      sqlTitulos.Sql.Add('      (PA.IDPESSOA IN (:IDPESSOA_MARCA)) ');

      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA_MARCA').asString  := Trim(CmpRptCM.ParamValues[27].AsString);
      sqlTitulos.Open;

      i := 0;
      if not cdsTitulos.isEmpty then
       begin
          cdsTitulos.First;
          while not cdsTitulos.Eof do
          begin
            inc(i);

            if i = 1 then
               sNomePatro :=  cdsTitulos.FieldByName('NOME').AsString
            else
               sNomePatro := sNomePatro + '/' + cdsTitulos.FieldByName('NOME').AsString;

            cdsTitulos.Next;
          end;
       end;
   end;

   sNomeAtividade_Marca := '';
   if (Trim(CmpRptCM.ParamValues[28].AsString) <> '') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT NOME FROM UNIDNEGOCIO            ');
      sqlTitulos.Sql.Add('WHERE (IDPESSOA = :IDPESSOA) AND        ');
      sqlTitulos.Sql.Add('      (UNIDNEGOC IN (:UNIDNEGOC_MARCA)) ');

      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA').asFloat          := CrmRptCM.IdEmpresa;
      sqlTitulos.ParamByName('UNIDNEGOC_MARCA').asString  := Trim(CmpRptCM.ParamValues[28].AsString);
      sqlTitulos.Open;

      i := 0;
      if not cdsTitulos.isEmpty then
       begin
          cdsTitulos.First;
          while not cdsTitulos.Eof do
          begin
            inc(i);

            if i = 1 then
               sNomeAtividade_Marca :=  cdsTitulos.FieldByName('NOME').AsString
            else
               sNomeAtividade_Marca := sNomeAtividade_Marca + '/' + cdsTitulos.FieldByName('NOME').AsString;

            cdsTitulos.Next;
          end;
       end;
   end;

   if (Trim(CmpRptCM.ParamValues[24].AsString)='') then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT  PERNUMERO                     ');
      sqlTitulos.Sql.Add('FROM  PERIODO                         ');
      sqlTitulos.Sql.Add('WHERE                                 ');
      sqlTitulos.Sql.Add('  (IDPESSOA     = :IDPESSOA) AND      ');
      sqlTitulos.Sql.Add('  (PEREXERCICIO = :PEREXERCICIO) AND  ');
      sqlTitulos.Sql.Add('  (PERNUMERO BETWEEN :PERNUMERO1 AND :PERNUMERO2) AND ');
      sqlTitulos.Sql.Add('  ((PERBLOQUE IS NULL) OR (PERBLOQUE = ''N''))        ');

      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
      sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
      sqlTitulos.ParamByName('PERNUMERO1').asInteger   := CmpRptCM.ParamValues[1].AsInteger;
      sqlTitulos.ParamByName('PERNUMERO2').asInteger   := CmpRptCM.ParamValues[2].AsInteger;

      sqlTitulos.Open;

      if cdsTitulos.isEmpty then
      begin
         if (CmpRptCM.ParamValues[1].AsInteger = CmpRptCM.ParamValues[2].AsInteger) then
            sTitulo := 'Balancete - ' + sPeriodoInicial + '/' + sExercicio
         else
            sTitulo := 'Balancete - ' + sPeriodoInicial + '/' + sExercicio + ' a ' +
                                            sPeriodoFinal   + '/' + sExercicio;
         end
      else
      begin
         if (CmpRptCM.ParamValues[1].AsInteger = CmpRptCM.ParamValues[2].AsInteger) then
            sTitulo := 'Balancete Provisório - ' + sPeriodoInicial + '/' + sExercicio
         else
            sTitulo := 'Balancete Provisório - ' + sPeriodoInicial + '/' + sExercicio + ' a ' +
                                                   sPeriodoFinal   + '/' + sExercicio;
      end;

      //Imprime os títulos
      pplblTituloBalancete.caption := sTitulo;

      sTitulo := '';
      if CmpRptCM.ParamValues[17].AsBoolean then
         sTitulo := sTitulo +  '     SOMENTE Contas Contra sua Natureza';

      if (sContaInicial <> '') then
         sTitulo := sTitulo +  '     Conta Inicial : ' + sContaInicial;

      if (sContaFinal <> '') then
         sTitulo := sTitulo +  '     Conta Final : ' + sContaFinal;

      if (not CmpRptCM.ParamValues[5].IsNull) then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME,          ');

         sqlTitulos.SQL.Add('   CODEXTERNO ');

         sqlTitulos.SQL.Add('FROM  CENTCUST                        ');
         sqlTitulos.SQL.Add('WHERE                                 ');
         sqlTitulos.SQL.Add('   (IDEMPRESA      = :IDEMPRESA) AND  ');
         sqlTitulos.SQL.Add('   (CODCENTROCUSTO = :CODCENTROCUSTO) ');

         sqlTitulos.Prepare;
         sqlTitulos.ParamByName('IDEMPRESA').asFloat       := CrmRptCM.IdEmpresa;
         sqlTitulos.ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[5].AsString;

         sqlTitulos.Open;
         sCCustoInicial := cdsTitulos.FieldByName('CODEXTERNO').asString + ' - ' + cdsTitulos.FieldByName('NOME').asString;

         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sCCustoInicial;
      end;

      if (not CmpRptCM.ParamValues[6].IsNull) then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME,          ');

         sqlTitulos.SQL.Add('    CODEXTERNO ');

         sqlTitulos.SQL.Add('FROM  CENTCUST                        ');
         sqlTitulos.SQL.Add('WHERE                                 ');
         sqlTitulos.SQL.Add('   (IDEMPRESA      = :IDEMPRESA) AND  ');
         sqlTitulos.SQL.Add('   (CODCENTROCUSTO = :CODCENTROCUSTO) ');

         sqlTitulos.Prepare;
         sqlTitulos.ParamByName('IDEMPRESA').asFloat       := CrmRptCM.IdEmpresa;
         sqlTitulos.ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[6].AsString;

         sqlTitulos.Open;
         sCCustoFinal := cdsTitulos.FieldByName('CODEXTERNO').asString + ' - ' + cdsTitulos.FieldByName('NOME').asString;

         sTitulo := sTitulo +  '     Centro de Custo Final : ' + sCCustoFinal;
      end;

      if (not CmpRptCM.ParamValues[7].IsNull) then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT  UNIDNEGOC, NOME, UNECODIGO ');
         sqlTitulos.SQL.Add('FROM UNIDNEGOCIO                   ');
         sqlTitulos.SQL.Add('WHERE  (IDPESSOA  = :IDPESSOA) AND ');
         sqlTitulos.SQL.Add('       (UNIDNEGOC = :UNIDNEGOC)    ');

         sqlTitulos.Prepare;
         sqlTitulos.ParamByName('IDPESSOA').asFloat  := CrmRptCM.IdEmpresa;
         sqlTitulos.ParamByName('UNIDNEGOC').asFloat := StrToFloat(CmpRptCM.ParamValues[7].AsString);
         sqlTitulos.Open;

         sNomeAtividade := CmpRptCM.ParamValues[7].AsString + ' - ' + cdsTitulos.FieldByName('NOME').asString;
         sTitulo := sTitulo +  '     Atividade/Projeto : ' +CmpRptCM.ParamValues[7].AsString+' - '+   sNomeAtividade;
      end;

      ppLblTituloBalancete2.caption := sTitulo

   end
  else
   begin
     pplblTituloBalancete.caption  := CmpRptCM.ParamValues[24].AsString;
     ppLblTituloBalancete2.caption := CmpRptCM.ParamValues[25].AsString;
   end;

end;



procedure TRptBalanceteAnalSubConta.ppFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;
   lblContador.Caption := IntToStr((iPagIni + StrToIntDef(ppSystemVariable1.Text, 0)) - 1);
end;

procedure TRptBalanceteAnalSubConta.FormDestroy(Sender: TObject);
begin
  cdsTitulos.Close;
  CdsBalTot.Close;
  cdsDetalheSubcontas.Close;
  cdsBalancete.Close;
  CtrlContab.Free;
  CtrlRptBalancete.free;
  inherited;
end;

end.

