{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteColMesCC.CrmRptCMBeforePrint
 N. Sol's........: 134710
 N. Kintana's....: 796664
 Data............: 28/04/2010
 Responsável.....: Fábio Henrique Beccaria Sampaio
 Descrição.......: Correção para obter o Plano correspondente a data inicial
--------------------------------------------------------------------------------
 Autor.....: Arnaldo Vicente Scarin
 SOL.......: 123326
 KINTANA...: 615624
 Data      : 21/08/2009
 Descrição : Modificação da rotina que executa o filtro nas contas de centro
             de custo para que possa ser feito corretamente o filtro das mesmas.
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteColMesCC.FazQuery
 N. Sol..........: 117695
 N. Kintana......: 558939
 Data............: 20/05/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do campo Desconsiderar Encerramento de Resultado
--------------------------------------------------------------------------------}


unit rBalanceteColMesCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,uCtrlRptBalancete,
  DBClient, uCMClientDataSet, ppDB, Wwdatsrc, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, TXRB, wwQuery, uCtrlContab;

type
  TrptBalanceteColMesCC = class(TFrmCmReport)
    cdsPlano: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    sqlPatro: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    cdsAux1: TCMClientDataSet;
    sqlAux1: TCMSqlParams;
    rptBalanceteColMesCC: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLine37: TppLine;
    pplPer1Col: TppLabel;
    pplPer2Col: TppLabel;
    pplPer3Col: TppLabel;
    pplPer4Col: TppLabel;
    pplPer5Col: TppLabel;
    pplPer6Col: TppLabel;
    pplPer7Col: TppLabel;
    pplPer8Col: TppLabel;
    ppDBImage2: TppDBImage;
    pplPer9Col: TppLabel;
    pplPer10Col: TppLabel;
    pplPer11Col: TppLabel;
    pplPer12Col: TppLabel;
    ppLabel75Col: TppLabel;
    LblEmpresa: TppLabel;
    pplTituloCol: TppLabel;
    lblFiltroCol2: TppLabel;
    lblFiltroCol1: TppLabel;
    ppLine42: TppLine;
    ppDetailBand12: TppDetailBand;
    dbpplPer1Col: TppDBText;
    dbpplPer2Col: TppDBText;
    dbpplPer3Col: TppDBText;
    dbpplPer4Col: TppDBText;
    dbpplPer5Col: TppDBText;
    dbpplPer6Col: TppDBText;
    dbpplPer7Col: TppDBText;
    dbpplPer8Col: TppDBText;
    dbpplPer9Col: TppDBText;
    dbpplPer10Col: TppDBText;
    dbpplPer11Col: TppDBText;
    dbpplPer12Col: TppDBText;
    dbpplPerTotCol: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine41: TppLine;
    lblsistema: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppLine40: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppLabel64: TppLabel;
    ppLine43: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    pplBalanceteColMesCC: TppBDEPipeline;
    dsBalanceteColMesCC: TwwDataSource;
    sqlBalanceteColMesCC: TCMSqlParams;
    cdsBalanceteColMesCC: TCMClientDataSet;
    Col19: TppSystemVariable;
    dsEmpresaProp: TwwDataSource;
    pplEmpresaProp: TppBDEPipeline;
    cdsEmpresaProp: TCMClientDataSet;
    sqlEmpresaProp: TCMSqlParams;
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    iPlano :Integer;
    sMascaraPlano,sTitulo :string;
    CtrlRptBalancete :TCtrlRptBalancete;
    CtrlContab       : TCtrlContab; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010

    sPatroSel,sNomeAtividade,sSintAnal : String;
    sPlanoSel : String;
    iContaReg : Integer;
    sPeriodoInicial  : String;
    sPeriodoFinal    : String;

    procedure FazQuery;
    function RetornaCodigoCentroCusto(const pConta: String): Integer;

  public
    { Public declarations }
  end;

var
  rptBalanceteColMesCC: TrptBalanceteColMesCC;

implementation

uses UMensErro, uDatabase, DBaseDados, uCtrlParamIntegra,uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TrptBalanceteColMesCC.CmpRptCMParamControlEnter(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
 {  case Index of
      1: Begin
           TPainelControles(Sender).CdsDisplay.Filtered := False;
           TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+trim(sNomeExerc);
           TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      2: Begin
           TPainelControles(Sender).CdsDisplay.Filtered := False;
           TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+trim(sNomeExerc);
           TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end; }

end;

procedure TrptBalanceteColMesCC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
                                                    '   (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
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


end;

procedure TrptBalanceteColMesCC.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
   CmpRptCM.ParamValues[10].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[10].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

  // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
//   iPlano := Modulo.iPlano;
//   sMascaraPlano := Modulo.sMascaraContas;
   iPlano := 0;
   sMascaraPlano := '';
   CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa);
   // Fim - Alterado por FHBS


   //========================================================================
   sqlEmpresaProp.Prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresaProp.Open;
   //========================================================================

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
   sqlTitulos.ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[1].AsInteger;
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;

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
   sqlTitulos.ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[2].AsInteger;
   sqlTitulos.Open;

   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;

   //=====================================================================

   // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := CtrlContab.PlanoParam;

   sMascaraPlano := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
   //sMascaraPlano := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
   // Fim - Alterado por FHBS


    //*** preeenche titulo com patrocinadoras e planos ***
    If  CmpRptCM.ParamValues[19].AsString <> '' then
    Begin
        with sqlPlanoPrev.SQL do
        begin
          Clear;
          Add('SELECT IDPLANOPREV, NOME              ');
          Add('FROM PLANPREVCONTABIL                 ');
          Add('WHERE IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].AsString)+ ') ');
        end;

        sqlPlanoPrev.Open;
        sPlanoSel  := '';
        iContaReg := 0;
        cdsPlano.First;
        While not cdsPlano.Eof do
        Begin
          Inc(iContaReg);
          If cdsPlano.RecordCount = 1 Then
          Begin
             sPlanoSel := Trim(cdsPlano.FieldByName('NOME').AsString)
          End Else
          Begin
            If cdsPlano.RecordCount = iContaReg  Then
               sPlanoSel := sPlanoSel + Trim(cdsPlano.FieldByName('NOME').AsString)
            Else
               sPlanoSel := sPlanoSel +Trim(cdsPlano.FieldByName('NOME').AsString) + '-';
          End;
          cdsPlano.Next;
        End;
    End;

    //*** reotina para pegar as patrocinadoras ***
    If  CmpRptCM.ParamValues[20].AsString <> '' then
    Begin
        with sqlPatro.SQL do
        begin
          Clear;
          Add('SELECT  PA.IDPESSOA, PE.NOME      ');
          Add('FROM PESSOA PE, PATRO PA          ');
          Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) ');
          Add('  AND IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].AsString)+ ')');
        end;

        sqlPlanoPrev.Open;
        sPlanoSel  := '';
        iContaReg := 0;
        cdsPlano.First;
        While not cdsPatro.Eof do
        Begin
          Inc(iContaReg);
          If cdsPatro.RecordCount = 1 Then
          Begin
             sPatroSel := Trim(cdsPatro.FieldByName('NOME').AsString)
          End Else
          Begin
            If cdsPatro.RecordCount = iContaReg  Then
               sPatroSel := sPatroSel + Trim(cdsPatro.FieldByName('NOME').AsString)
            Else
               sPatroSel := sPatroSel + Trim(cdsPatro.FieldByName('NOME').AsString) + '-';
          End;
          cdsPatro.Next;
        End;
    End;

   If CmpRptCM.ParamValues[17].asString = '' then begin
      with sqlAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
         ParamByName('PERNUMEROINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
         ParamByName('PERNUMEROFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);
         Open;

         if cdsAux.isEmpty then begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end;
      End;

      //Imprime os títulos
      pplTituloCol.caption := sTitulo;
      sTitulo := '';
      if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
      begin
         sTitulo := sTitulo +  '     Conta Inicial : ' + CmpRptCM.ParamValues[3].AsString;
      end;
      if trim(CmpRptCM.ParamValues[4].AsString) <> '' then
      begin
         sTitulo := sTitulo +  '     Conta Final : ' + CmpRptCM.ParamValues[4].AsString;
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      begin
         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + CmpRptCM.ParamValues[5].AsString;
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
      begin
         sTitulo := sTitulo +  '     Centro de Custo Final : ' + CmpRptCM.ParamValues[6].AsString;
      end;
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      begin
         with sqlTitulos do
         begin
             SQL.Clear;
             SQL.Add('SELECT NOME FROM UNIDNEGOCIO ');
             SQL.Add('WHERE  (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') ');
             SQL.Add('  AND  (UNIDNEGOC = '+CmpRptCM.ParamValues[7].asString+') ');
             Open;
             sNomeAtividade := cdsTitulos.FieldByName('NOME').asString;
         end;
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + trim(sNomeAtividade);
      end;
      lblFiltroCol1.caption := sTitulo;
   end else begin
      pplTituloCol.caption  := CmpRptCM.ParamValues[17].asString;
      lblFiltroCol1.caption := CmpRptCM.ParamValues[18].asString;
   end;
   FazQuery;


end;

// Alterado por Arnaldo V. Scarin em 21/08/2009
// SOL 123325 - Kintana: 615624
Function TRptBalanceteColMesCC.RetornaCodigoCentroCusto(const pConta : String) : Integer;
var oQuery : TwwQuery;
begin
   oQuery := TwwQuery.Create(Nil);
   Try
     with oQuery do
     begin
       dataBaseName := 'BaseDados';
       Sql.Clear;
       Sql.Add('SELECT CodCentroCusto From CentCust');
       Sql.Add('Where CodExterno = '+QuotedStr(pConta));
       Open;
       Result := FieldByName('CodCentroCusto').asInteger;
       Close;
     end;
   finally
     FreeAndNil(oQuery);
   end;
end;

procedure TrptBalanceteColMesCC.FazQuery;
var iCount : integer;
    iPer1, iPer2, iPer3, iPer4, iPer5, iPer6, iPer7, iPer8, iPer9, iPer10, iPer11, iPer12 : Integer;
    // Alterado por Arnaldo V. Scarin em 21/08/2009
    // SOL 123325 - Kintana: 615624
    iCodCentroCustoInicial, iCodCentroCustoFinal : Integer;

begin
   // Alterado por Arnaldo V. Scarin em 21/08/2009
   // SOL 123325 - Kintana: 615624
   if Trim(CmpRptCM.ParamValues[5].asString) <> '' then
     iCodCentroCustoInicial := RetornaCodigoCentroCusto(CmpRptCM.ParamValues[5].asString)
   else
     iCodCentroCustoInicial := -1;

   // Alterado por Arnaldo V. Scarin em 21/08/2009
   // SOL 123325 - Kintana: 615624
   if Trim(CmpRptCM.ParamValues[6].asString) <> '' then
     iCodCentroCustoFinal   := RetornaCodigoCentroCusto(CmpRptCM.ParamValues[6].asString)
   else
     iCodCentroCustoFinal   := -1;

   sqlAux1.SQL.Clear;
   if CmpRptCM.ParamValues[11].AsBoolean then
      sqlAux1.SQL.Add('SELECT PERNUMERO, PERNOMEOUTLING AS PERNOME FROM PERIODO ')
   else
      sqlAux1.SQL.Add('SELECT PERNUMERO, PERNOME FROM PERIODO ');

   sqlAux1.SQL.Add('WHERE (PEREXERCICIO = '+FloatToStr(CmpRptCM.ParamValues[0].AsFloat)+')');
   sqlAux1.SQL.Add('  AND (PERNUMERO >= '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+')');
   sqlAux1.SQL.Add('  AND (PERNUMERO <= '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+')');
   sqlAux1.SQL.Add('  AND (IDPESSOA  = '+FloatToStr(CrmRptCM.IdEmpresa)+')');
   sqlAux1.Open;

   iPer1 := 0;
   iPer2 := 0;
   iPer3 := 0;
   iPer4 := 0;
   iPer5 := 0;
   iPer6 := 0;
   iPer7 := 0;
   iPer8 := 0;
   iPer9 := 0;
   iPer10 := 0;
   iPer11 := 0;
   iPer12 := 0;
   iCount := 0;
   //
   pplPer1Col.Caption  := '';
   pplPer2Col.Caption  := '';
   pplPer3Col.Caption  := '';
   pplPer4Col.Caption  := '';
   pplPer5Col.Caption  := '';
   pplPer6Col.Caption  := '';
   pplPer7Col.Caption  := '';
   pplPer8Col.Caption  := '';
   pplPer9Col.Caption  := '';
   pplPer10Col.Caption := '';
   pplPer11Col.Caption := '';
   pplPer12Col.Caption := '';
   //
   cdsAux1.First;
   while not cdsAux1.Eof do begin
      iCount := iCount + 1;
      if iCount > 12 then
         Break;
      if iCount = 1 then begin
         iPer1 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer1Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 2 then begin
         iPer2 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer2Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 3 then begin
         iPer3 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer3Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 4 then begin
         iPer4 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer4Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 5 then begin
         iPer5 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer5Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 6 then begin
         iPer6 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer6Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 7 then begin
         iPer7 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer7Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 8 then begin
         iPer8 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer8Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 9 then begin
         iPer9 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer9Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 10 then begin
         iPer10 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer10Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 11 then begin
         iPer11 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer11Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      if iCount = 12 then begin
         iPer12 := cdsAux1.FieldByName('PERNUMERO').AsInteger;
         pplPer12Col.Caption  := cdsAux1.FieldByName('PERNOME').AsString;
      end;
      cdsAux1.Next;
   end;

   lblFiltroCol2.Caption := '';
   if sPatroSel <> '' then begin
      lblFiltroCol2.Caption := lblFiltroCol2.Caption + 'Patrocinadoras: ' + trim(sPatroSel);
   end;

   if sPlanoSel <> '' then begin
      lblFiltroCol2.Caption := lblFiltroCol2.Caption +'   Planos: '+trim(sPlanoSel);
   end;

   sSintAnal := 'A';
   if CmpRptCM.ParamValues[9].AsBoolean then begin
      dbpplPerTotCol.DisplayFormat := '#,0.00;-#,0.00';
      dbpplPer1Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer2Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer3Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer4Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer5Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer6Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer7Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer8Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer9Col.DisplayFormat   := '#,0.00;-#,0.00';
      dbpplPer10Col.DisplayFormat  := '#,0.00;-#,0.00';
      dbpplPer11Col.DisplayFormat  := '#,0.00;-#,0.00';
      dbpplPer12Col.DisplayFormat  := '#,0.00;-#,0.00';
   end else begin
      dbpplPerTotCol.DisplayFormat := '#,0;-#,0';
      dbpplPer1Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer2Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer3Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer4Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer5Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer6Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer7Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer8Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer9Col.DisplayFormat   := '#,0;-#,0';
      dbpplPer10Col.DisplayFormat  := '#,0;-#,0';
      dbpplPer11Col.DisplayFormat  := '#,0;-#,0';
      dbpplPer12Col.DisplayFormat  := '#,0;-#,0';
   end;

   with sqlBalanceteColMesCC do
   begin
      SQL.Clear;
      begin
          SQL.Add('SELECT /*+ RULE */                                       ');
          SQL.Add('       UU.PLACONTA, UU.PLANOME, UU.PLANOMEOUTLING,       ');
          SQL.Add('       UU.NOMEINDENTADO, UU.NOME, UU.CODCENTROCUSTO,     ');
          SQL.Add('       UU.PER1,  ');
          SQL.Add('       UU.PER2,  ');
          SQL.Add('       UU.PER3,  ');
          SQL.Add('       UU.PER4,  ');
          SQL.Add('       UU.PER5,  ');
          SQL.Add('       UU.PER6,  ');
          SQL.Add('       UU.PER7,  ');
          SQL.Add('       UU.PER8,  ');
          SQL.Add('       UU.PER9,  ');
          SQL.Add('       UU.PER10, ');
          SQL.Add('       UU.PER11, ');
          SQL.Add('       UU.PER12, ');
          SQL.Add('       (NVL(UU.PER1,0) + NVL(UU.PER2,0) + NVL(UU.PER3,0) + NVL(UU.PER4,0)  + NVL(UU.PER5,0)  + NVL(UU.PER6,0) +             ');
          SQL.Add('        NVL(UU.PER7,0) + NVL(UU.PER8,0) + NVL(UU.PER9,0) + NVL(UU.PER10,0) + NVL(UU.PER11,0) + NVL(UU.PER12,0)) AS TOTPER ');
          SQL.Add('FROM (                                                 ');
          SQL.Add('SELECT U.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING, CC.NOME, CC.CODCENTROCUSTO,    ');
          if CmpRptCM.ParamValues[15].asBoolean then
          begin
             if CmpRptCM.ParamValues[11].asBoolean then
             begin
                if CmpRptCM.ParamValues[14].asBoolean then
                   SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || U.PLACONTA||'' ''||C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
                else
                   SQL.Add('   U.PLACONTA||'' ''||C.PLANOMEOUTLING AS NOMEINDENTADO, ');
             end else
             begin
                if CmpRptCM.ParamValues[14].asBoolean then
                   SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || U.PLACONTA||'' ''||DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
                else
                   SQL.Add('   U.PLACONTA||'' ''||DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
             end;
          end else
          begin
             if CmpRptCM.ParamValues[11].asBoolean then
             begin
                if CmpRptCM.ParamValues[14].asBoolean then
                   SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
                else
                   SQL.Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
             end else
             begin
                if CmpRptCM.ParamValues[14].asBoolean then
                   SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
                else
                   SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
             end;
          end;
          SQL.Add('       DECODE(SIGN(SUM(U.PER1)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER1),SUM(U.PER1)*-1)) AS PER1,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER2)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER2),SUM(U.PER2)*-1)) AS PER2,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER3)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER3),SUM(U.PER3)*-1)) AS PER3,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER4)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER4),SUM(U.PER4)*-1)) AS PER4,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER5)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER5),SUM(U.PER5)*-1)) AS PER5,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER6)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER6),SUM(U.PER6)*-1)) AS PER6,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER7)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER7),SUM(U.PER7)*-1)) AS PER7,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER8)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER8),SUM(U.PER8)*-1)) AS PER8,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER9)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER9),SUM(U.PER9)*-1)) AS PER9,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER10)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER10),SUM(U.PER10)*-1)) AS PER10,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER11)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER11),SUM(U.PER11)*-1)) AS PER11,  ');
          SQL.Add('       DECODE(SIGN(SUM(U.PER12)),-1,DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1),DECODE(C.PLANATUREZA,''D'',SUM(U.PER12),SUM(U.PER12)*-1)) AS PER12   ');
          SQL.Add('FROM                                                  ');
          SQL.Add('(                                                     ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          CmpRptCM.ParamValues[16].AsBoolean := (CmpRptCM.ParamValues[16].AsString = 'True');

          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add(' SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO, ');
            SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER1, ');
          End
          Else
          Begin
          SQL.Add(' SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO, ');
            SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER1, ');
          End;
          // Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
         { SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER1,  ');}

          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       ');
          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].asFloat) + ') AND         ');
          if iPer1 <> 0 then begin
             if CmpRptCM.ParamValues[13].asBoolean then begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer1)+') AND ');
             end else begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer1)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //Inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
         {                                           ');
          SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER2,  ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       ');    }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].asFloat) + ') AND         ');
          if iPer2 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer2)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer2)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //Início
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
         { SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER3,  ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       ');   }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer3 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer3)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer3)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER4,  ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }
          
          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer4 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer4)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer4)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER5,  ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer5 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer5)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer5)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //fim

          {
          SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER6,  ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer6 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer6)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer6)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER7,  ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer7 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer7)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer7)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER8,  ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }
          
          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer8 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer8)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer8)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER9, ');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER9,  ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer9 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer9)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer9)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER10, ');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER10, ');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER10, ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer10 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer10)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer10)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9,');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER11, ');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9,');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER11, ');
            SQL.Add(' (0) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER11, ');
          SQL.Add('       (0) AS PER12                                   ');
          SQL.Add('FROM PLANOSALDO                                       '); }

          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer11 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer11)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer11)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add('UNION ALL                                             ');

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          //inicio
          If CmpRptCM.ParamValues[16].AsBoolean Then
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9, ');
            SQL.Add(' (0) AS PER10, ');
            SQL.Add(' (0) AS PER11, ');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR-Nvl(plsdebitoencerr,0)+Nvl(plscreditoencerr,0)) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End
          Else
          Begin
            SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
            SQL.Add(' (0) AS PER1, ');
            SQL.Add(' (0) AS PER2, ');
            SQL.Add(' (0) AS PER3, ');
            SQL.Add(' (0) AS PER4, ');
            SQL.Add(' (0) AS PER5, ');
            SQL.Add(' (0) AS PER6, ');
            SQL.Add(' (0) AS PER7, ');
            SQL.Add(' (0) AS PER8, ');
            SQL.Add(' (0) AS PER9,');
            SQL.Add(' (0) AS PER10,');
            SQL.Add(' (0) AS PER11,');
            SQL.Add(' SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER12 ');
            SQL.Add('  FROM PLANOSALDO P ');
          End;
          //Fim

          //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
          {SQL.Add('SELECT PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO,    ');
          SQL.Add('       (0) AS PER1,                                   ');
          SQL.Add('       (0) AS PER2,                                   ');
          SQL.Add('       (0) AS PER3,                                   ');
          SQL.Add('       (0) AS PER4,                                   ');
          SQL.Add('       (0) AS PER5,                                   ');
          SQL.Add('       (0) AS PER6,                                   ');
          SQL.Add('       (0) AS PER7,                                   ');
          SQL.Add('       (0) AS PER8,                                   ');
          SQL.Add('       (0) AS PER9,                                   ');
          SQL.Add('       (0) AS PER10,                                  ');
          SQL.Add('       (0) AS PER11,                                  ');
          SQL.Add('       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER12  ');
          SQL.Add('FROM PLANOSALDO                                       '); }
          
          SQL.Add('WHERE  (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].AsFloat) + ') AND         ');
          if iPer12 <> 0 then
          begin
             if CmpRptCM.ParamValues[13].asBoolean then
             begin
                SQL.Add('       (PERNUMERO = ' + IntToStr(iPer12)+') AND ');
             end else
             begin
                SQL.Add('       ((PERNUMERO <= ' + IntToStr(iPer12)+') OR (PERNUMERO IS NULL)) AND ');
             end;
          end else
          begin
             SQL.Add('       (1 = 2) AND ');
          end;
          if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
          begin
             SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
             SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[5].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO >= ' + IntToStr(iCodCentroCustoInicial)+ ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[6].asString) <> '' then
          begin
             // Alterado por Arnaldo V. Scarin em 21/08/2009
             // SOL 123325 - Kintana: 615624
             // SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
             SQL.Add('       (CODCENTROCUSTO <= ' + IntToStr(iCodCentroCustoFinal) + ') AND ');
             SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          end;
          if trim(CmpRptCM.ParamValues[19].asString) <> '' then
          begin
             SQL.Add('      (IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[19].asString) + ')) AND ');
          end;
          if trim(CmpRptCM.ParamValues[20].asString) <> '' then
          begin
             SQL.Add('      (IDPATRO IN (' + trim(CmpRptCM.ParamValues[20].asString) + ')) AND ');
          end;
          SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
          SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND   ');
          SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                   [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
          SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                   [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                   ');
          SQL.Add('GROUP BY PLACONTA, PLANO, IDEMPRESA, CODCENTROCUSTO   ');
          SQL.Add(') U,                                                  ');
          SQL.Add('PLANOCONTA C, CENTCUST CC,                             ');

          SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD ');

          SQL.Add('WHERE (U.PLACONTA = C.PLACONTA)                       ');
          SQL.Add('  AND (U.PLANO = C.PLANO)                             ');
          SQL.Add('  AND (PD.PLACONTA(+) = C.PLACONTA)                   ');
          SQL.Add('  AND (PD.PLANO(+) = C.PLANO)                         ');
          SQL.Add('  AND (U.CODCENTROCUSTO = CC.CODCENTROCUSTO)          ');
          SQL.Add('  AND (U.IDEMPRESA = CC.IDEMPRESA)                    ');
          SQL.Add('  AND (C.PLAGRAU <= ' + CmpRptCM.ParamValues[10].AsString + ')  ');
          if CmpRptCM.ParamValues[12].asBoolean then
          begin
             SQL.Add(' AND (C.PLAGRUPO <> ''E'')                            ');
          end;
          SQL.Add('GROUP BY U.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLAGRAU,            ');
          SQL.Add('         C.PLANOMEOUTLING,  C.PLANATUREZA, CC.NOME, CC.CODCENTROCUSTO ) UU        ');
          SQL.Add('ORDER BY UU.PLACONTA, UU.CODCENTROCUSTO               ');
      end;
      Open;
   end;
end;


procedure TrptBalanceteColMesCC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
end;

procedure TrptBalanceteColMesCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
  CtrlRptBalancete.free;
end;

end.
