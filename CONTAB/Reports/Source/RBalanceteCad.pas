{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina......: sqlCCusto
 Nº SIG......: 66859
 Data........: 17/04/2018
 Responsável.: Marcelo Valério Ferreira
 Descrição...: Ajuste na query de seleção das assinaturas dos associados ao
               centro de custo (.dfm)
--------------------------------------------------------------------------------
 Rotina......: sqlCentroCusto
 Nº SIG......: 31699
 Data........: 26/10/2016
 Responsável.: Peterson Victor
 Descrição...: Alteração para ajustar os campos das assinaturas (.dfm)
--------------------------------------------------------------------------------
 Rotina......: -
 Nº SOL......: 144332
 Nº KINTANA..: 999953
 Data........: 10/08/2011
 Responsável.: Thaise Amaral Martins
 Descrição...: Adicionar quebra de linha no nome da conta
--------------------------------------------------------------------------------
 Rotina......: ppChildReport1
 Nº SOL......: 143062
 Nº KINTANA..: 923146
 Data........: 01/09/2010
 Responsável.: Fábio Henrique Beccaria Sampaio
 Descrição...: Alteração para ajustar os campos das assinaturas
--------------------------------------------------------------------------------
 Rotina......: SqlAssinatura
 Nº SOL......: 142197
 Nº KINTANA..: 906825
 Data........: 23/08/2010
 Responsável.: Renan Cristiano
 Descrição...: Implementação nos relatórios "Demonstrativos CGPC28", inclusão
               do simbolo "(a)" na assinatura dos cargos de Diretor e
               Coordenador.
--------------------------------------------------------------------------------
 Rotina......: CrmRptCMBeforePrint, ppGroupHeaderBand12BeforePrint
 Nº SOL......: 140372
 Nº KINTANA..: 877866
 Data........: 29/07/2010
 Responsável.: Fábio Henrique Beccaria Sampaio
 Descrição...: Implemetação da flag "Sem Quebra"
--------------------------------------------------------------------------------
 Autor.....: Marcos Luiz de Jesus
 SOL.......: 139128
 Kintana...: 852404
 Data      : 08/07/2010
 Descrição : Inserir assinatura por quebra de plano
             Mostrar CPF e CRC no relatorio quando houver informação.
             Retirado a informação de total do relatorio
--------------------------------------------------------------------------------
 Autor.....: Arnaldo Vicente Scarin
 SOL.......: 40495
 Kintana...: 523623
 Data      : 11/09/2009
 Descrição : Alterações no layout do relatório conforme solicitação do SOL
--------------------------------------------------------------------------------}

Unit RBalanceteCad;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   uCmRptManager, TXComp, CmParamReport, Db, DBTables, uCtrlRptBalanceteAnalPP,
   Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
   ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
   StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
   FCmReport, uCtrlContab, uCmSqlParams, uCMClientDataSet, TXRB, uData,
   ppParameter, ppSubRpt, ppRegion, raCodMod;

Type
   TRptBalanceteCad = Class(TFrmCmReport)
      dsBalancete: TwwDataSource;
      rptBalanceteCad: TppReport;
      ppHeaderBand21: TppHeaderBand;
      ppLine67: TppLine;
      LblEmpresaCad: TppLabel;
      ppDetailBand8: TppDetailBand;
      dbtxtValorDebito: TppDBText;
      dbtxtValorCredito: TppDBText;
      dbtxtSaldoAnterior: TppDBText;
      dbtxtSaldoAnteriorSinal: TppDBText;
      dbtxtSaldoAtual: TppDBText;
      dbtxtSaldoAtualSinal: TppDBText;
      dbtxtPlaConta: TppDBText;
      ppFooterBand22: TppFooterBand;
      ppLine68: TppLine;
      lblContadorCad: TppLabel;
      ppLabel134: TppLabel;
      CalcCad5: TppSystemVariable;
      ppGroup12: TppGroup;
      ppGroupHeaderBand12: TppGroupHeaderBand;
      ppLabel145: TppLabel;
      ppLine70: TppLine;
      lblCredito: TppLabel;
      lblSaldoAtual: TppLabel;
      ppGroupFooterBand12: TppGroupFooterBand;
      CdsBalancete: TClientDataSet;
      CdsBalTot: TClientDataSet;
      ppBalanceteCad: TppDBPipeline;
      sqlBalancete: TCMSqlParams;
      sqlTotalizador: TCMSqlParams;
      cdsTitulos: TCMClientDataSet;
      sqlTitulos: TCMSqlParams;
      lblCNPJ: TppLabel;
      lblCodFuncef: TppLabel;
      pplblAnexo: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppCentroCusto: TppDBPipeline;
      sqlCentroCusto: TCMSqlParams;
      cdsCentroCusto: TClientDataSet;
      dsCentroCusto: TwwDataSource;
      ppParameterList1: TppParameterList;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      pplblLocalidade: TppLabel;
      ppColumnHeaderBand1: TppColumnHeaderBand;
      ppColumnFooterBand1: TppColumnFooterBand;
      ppLabel1: TppLabel;
      lblCodCNPB_Titulo: TppLabel;
      lblTituloBalanceteCad: TppLabel;
      lblTituloBalanceteCad2: TppLabel;
      dbTxtCNPB_Titulo: TppDBText;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      dbtxtValorMovimento: TppDBText;
      lblMovimentacao: TppLabel;
      lblSaldoAnterior: TppLabel;
      lblDebito: TppLabel;
      SqlPlanoPrev: TCMSqlParams;
      cdsPlanoPrev: TClientDataSet;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      raCodeModule1: TraCodeModule;
    ppDBMemo1: TppDBMemo;
      Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
      Procedure CrmRptCMBeforePrint(Sender: TObject);
      Procedure CmpRptCMParamControlExit(Sender: TPainelControles;
         Index: Integer);
      Procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
         Index: Integer);
      Procedure ppFooterBand22BeforePrint(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure ppDetailBand8BeforeGenerate(Sender: TObject);
      Procedure ppDetailBand8AfterPrint(Sender: TObject);
      Procedure ppDetailBand8AfterGenerate(Sender: TObject);
      Procedure ppGroupHeaderBand12BeforePrint(Sender: TObject);
      Procedure dbTxtCNPB_TituloGetText(Sender: TObject; Var Text: String);
      Procedure ppHeaderBand21BeforePrint(Sender: TObject);
   Private
      { Private declarations }
      CtrlContab: TCtrlContab;
      CtrlRptBalanceteAnalPP: TCtrlRptBalanceteAnalPP;

      sExercicio: String;
      sPeriodoInicial: String;
      sPeriodoFinal: String;
      sContaInicial: String;
      sContaFinal: String;
      sCCustoInicial: String;
      sCCustoFinal: String;
      sAtividade: String;
      sNomePatro: String;
      sNomePlanoPrev: String;
      sNomeAtividade: String;
      sMascara: String;
      sGrau: String;
      sPacTipoPerResult: String;
      iPagIni: Integer;
      iNumColunas: Integer;
      bJaAcertado: Boolean;

      Procedure CarregaDadosAssinatura;
      Procedure MudarFonte(Const pAtivarNegrito: Boolean);
      Procedure MudarTamanhoFonte(Const pTamanho: Integer);
      Function MontaPlanoPrev(Const pCodCNPB: String): String;
   Public
      { Public declarations }
   End;

Implementation

{$R *.DFM}

Uses uCtrlPadroes,
   FSM_FxLib,
   uCtrlParamIntegra,
   uFuncaoGeral,
   uDatabase,
   DBaseDados,
   uString;

Procedure TRptBalanceteCad.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
   Inherited;
   sExercicio := '';
   sPeriodoInicial := '';
   sPeriodoFinal := '';
   sContaInicial := '';
   sContaFinal := '';
   sCCustoInicial := '';
   sCCustoFinal := '';
   sNomePlanoPrev := '';
   sMascara := '';
   sGrau := '';

   With CmpRptCM Do
      Begin
         ParamValues[0].LookupSettings.SQL.Text := 'SELECT DISTINCT ' +
            '   PEREXERCICIO ' +
            'FROM ' +
            '   PERIODO ' +
            'WHERE ' +
            '   (IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') ' +
            'ORDER BY PEREXERCICIO';

         ParamValues[1].LookupSettings.SQL.Text := 'SELECT ' +
            '    (PEREXERCICIO || ' + QuotedStr(' - ') + ' || PERNOME) AS PEREXERCNOME, ' +
            '   PERNUMERO, ' +
            '   PERNOME, ' +
            '   PEREXERCICIO ' +
            'FROM ' +
            '   PERIODO ' +
            'WHERE ' +
            '   (IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') ' +
            'ORDER BY ' +
            '   PEREXERCICIO, ' +
            '   PERNUMERO ';

         ParamValues[2].LookupSettings.SQL.Text := 'SELECT ' +
            '    (PEREXERCICIO || ' + QuotedStr(' - ') + ' || PERNOME) AS PEREXERCNOME, ' +
            '   PERNUMERO, ' +
            '   PERNOME, ' +
            '   PEREXERCICIO ' +
            'FROM ' +
            '   PERIODO ' +
            'WHERE ' +
            '   (IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') ' +
            'ORDER BY ' +
            '   PEREXERCICIO, ' +
            '   PERNUMERO ';

         ParamValues[3].LookupSettings.SQL.Text := 'SELECT ' +
            '   PLACONTA, ' +
            '   PLANOME ' +
            'FROM ' +
            '   PLANOCONTA ' +
            'WHERE ' +
            '   (PLANO = ' + IntToStr(ParamIntegra.Plano) + ') ' +
            'ORDER BY PLACONTA';

         ParamValues[4].LookupSettings.SQL.Text := 'SELECT ' +
            '   PLACONTA, ' +
            '   PLANOME ' +
            'FROM ' +
            '   PLANOCONTA ' +
            'WHERE ' +
            '   (PLANO = ' + IntToStr(ParamIntegra.Plano) + ') ' +
            'ORDER BY PLACONTA';

         ParamValues[12].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
         ParamValues[12].SpinEditSettings.Value := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
      End;
End;

Procedure TRptBalanceteCad.CmpRptCMParamControlExit(Sender: TPainelControles;
   Index: Integer);
Begin
   Inherited;
   Case Index Of
      0: sExercicio := Trim(TPainelControles(Sender).CtrlLookup.Text);
      1: sPeriodoInicial := Trim(TPainelControles(Sender).CtrlLookup.Text);
      2: sPeriodoFinal := Trim(TPainelControles(Sender).CtrlLookup.Text);
      3: sContaInicial := Trim(TPainelControles(Sender).CtrlLookup.Text);
      4: sContaFinal := Trim(TPainelControles(Sender).CtrlLookup.Text);
      5: sCCustoInicial := Trim(TPainelControles(Sender).CtrlLookup.Text);
      6: sCCustoFinal := Trim(TPainelControles(Sender).CtrlLookup.Text);
      7: sAtividade := Trim(TPainelControles(Sender).CtrlLookup.Text);
      25: sNomePlanoPrev := Trim(TPainelControles(Sender).CtrlEdit.Text);
      26: sNomePatro := Trim(TPainelControles(Sender).CtrlEdit.Text);
   End;
End;

Procedure TRptBalanceteCad.CrmRptCMBeforePrint(Sender: TObject);
Var
   sTitulo: String;
   iNumero: integer;
   iGrau, i: Integer;
Begin
   Inherited;
   sCCustoInicial := '';
   sCCustoFinal := '';
   sNomePlanoPrev := '';
   sNomeAtividade := '';
   sPeriodoInicial := '';
   sPeriodoFinal := '';

   If CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) Then
      sPacTipoPerResult := CtrlContab.TipoOpEncer
   Else
      sPacTipoPerResult := '';

   //==================================================================
   // Calcula grau
   //==================================================================
   Try
      iGrau := CmpRptCM.ParamValues[12].AsInteger;
   Except
      iGrau := 0;
   End;

   If (iGrau = 0) Then
      sGrau := IntToStr(FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano))
   Else
      sGrau := IntToStr(iGrau);
   //==================================================================

   sExercicio := CmpRptCM.ParamValues[0].AsString;

   iNumColunas := CmpRptCM.ParamValues[25].AsInteger + 3;

   //=========================================================
   // Pega nome do mes
   //=========================================================
   sqlTitulos.SQL.Clear;
   sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM');
   sqlTitulos.Sql.Add('FROM PERIODO');
   sqlTitulos.Sql.Add('WHERE (IDPESSOA = :IDPESSOA)');
   sqlTitulos.Sql.Add('  AND (PEREXERCICIO = :PEREXERCICIO)');
   sqlTitulos.Sql.Add('  AND (PERNUMERO = :PERNUMERO)');
   sqlTitulos.Sql.Add('ORDER BY PERNUMERO');

   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlTitulos.ParamByName('PERNUMERO').asInteger := CmpRptCM.ParamValues[1].AsInteger;
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;

   sqlTitulos.SQL.Clear;
   sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM');
   sqlTitulos.Sql.Add('FROM PERIODO');
   sqlTitulos.Sql.Add('WHERE (IDPESSOA = :IDPESSOA)');
   sqlTitulos.Sql.Add('  AND (PEREXERCICIO = :PEREXERCICIO)');
   sqlTitulos.Sql.Add('  AND (PERNUMERO = :PERNUMERO)');
   sqlTitulos.Sql.Add('ORDER BY PERNUMERO');

   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlTitulos.ParamByName('PERNUMERO').asInteger := CmpRptCM.ParamValues[2].AsInteger;
   sqlTitulos.Open;
   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;

   //====================================
   CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime));  //Everson Cunha - SIG102043

   sMascara := '';
   If CmpRptCM.ParamValues[10].AsBoolean Then
    sMascara := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
    //sMascara := ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043

   //=====================================================================

   sContaInicial := '';
   If Not CmpRptCM.ParamValues[3].IsNull Then
      sContaInicial := CmpRptCM.ParamValues[3].AsString;

   sContaFinal := '';
   If Not CmpRptCM.ParamValues[4].IsNull Then
      sContaFinal := CmpRptCM.ParamValues[4].AsString;

   sNomePlanoPrev := '';
   If (Trim(CmpRptCM.ParamValues[19].AsString) <> '') Then
      Begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.Sql.Add('SELECT NOME');
         sqlTitulos.Sql.Add('FROM PLANPREVCONTABIL');
         sqlTitulos.Sql.Add('WHERE IDPLANOPREV IN (' + Trim(CmpRptCM.ParamValues[19].AsString) + ')');
         sqlTitulos.Open;

         i := 0;
         If Not cdsTitulos.isEmpty Then
            Begin
               cdsTitulos.First;
               While Not cdsTitulos.Eof Do
                  Begin
                     inc(i);

                     If i = 1 Then
                        sNomePlanoPrev := cdsTitulos.FieldByName('NOME').AsString
                     Else
                        sNomePlanoPrev := sNomePlanoPrev + '/' + cdsTitulos.FieldByName('NOME').AsString;

                     cdsTitulos.Next;
                  End;
            End;
      End;

   sNomePatro := '';
   If (Trim(CmpRptCM.ParamValues[20].AsString) <> '') Then
      Begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.Sql.Add('SELECT PE.NOME');
         sqlTitulos.Sql.Add('FROM PESSOA PE,PATRO PA');
         sqlTitulos.Sql.Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) ');
         sqlTitulos.Sql.Add('  AND (PA.IDPESSOA IN (' + Trim(CmpRptCM.ParamValues[20].AsString) + '))');
         sqlTitulos.Open;

         i := 0;
         If Not cdsTitulos.isEmpty Then
            Begin
               cdsTitulos.First;
               While Not cdsTitulos.Eof Do
                  Begin
                     inc(i);

                     If i = 1 Then
                        sNomePatro := cdsTitulos.FieldByName('NOME').AsString
                     Else
                        sNomePatro := sNomePatro + '/' + cdsTitulos.FieldByName('NOME').AsString;

                     cdsTitulos.Next;
                  End;
            End;
      End;

   If (Trim(CmpRptCM.ParamValues[17].AsString) = '') Or (CmpRptCM.ParamValues[28].AsBoolean) Then
      Begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.Sql.Add('SELECT  PERNUMERO');
         sqlTitulos.Sql.Add('FROM  PERIODO');
         sqlTitulos.Sql.Add('WHERE (IDPESSOA     = :IDPESSOA)');
         sqlTitulos.Sql.Add('  AND (PEREXERCICIO = :PEREXERCICIO)');
         sqlTitulos.Sql.Add('  AND (PERNUMERO BETWEEN :PERNUMERO1 AND :PERNUMERO2)');
         sqlTitulos.Sql.Add('  AND ((PERBLOQUE IS NULL) OR (PERBLOQUE = ''N''))');

         sqlTitulos.Prepare;
         sqlTitulos.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
         sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
         sqlTitulos.ParamByName('PERNUMERO1').asInteger := CmpRptCM.ParamValues[1].AsInteger;
         sqlTitulos.ParamByName('PERNUMERO2').asInteger := CmpRptCM.ParamValues[2].AsInteger;

         sqlTitulos.Open;

         // Alterado por Arnaldo Vicente Scarin em 14/09/2009
         // SOL: 40495 Kintana: 523623
         // Alterações no layout do relatório conforme solicitação do SOL
         If (CmpRptCM.ParamValues[1].AsInteger = CmpRptCM.ParamValues[2].AsInteger) Then
            sTitulo := 'Balancete de ' + sPeriodoInicial + ' de ' + sExercicio
         Else
            sTitulo := 'Balancete de ' + sPeriodoInicial + ' de ' + sExercicio +
               ' a ' + sPeriodoFinal + ' de ' + sExercicio;

         //Imprime os títulos
         If lblTituloBalanceteCad <> Nil Then
            lblTituloBalanceteCad.caption := AnsiUpperCase(sTitulo)
         Else
            Begin
               MessageDlg('O relatório original foi modificado.' + #13 + #10 +
                  'Por favor, restaure o relatório através da opção de Menu' + #13 + #10 +
                  '"Sistema\Configurações\Relatórios"', mtWarning, [mbOK], 0);
               Exit;
            End;

         sTitulo := '';
         If CmpRptCM.ParamValues[13].AsBoolean Then
            sTitulo := sTitulo + '     SOMENTE Contas Contra sua Natureza';

         //     if (sContaInicial <> '') then
         //       sTitulo := sTitulo +  '     Conta Inicial : ' + sContaInicial;

         //     if (sContaFinal <> '') then
         //       sTitulo := sTitulo +  '     Conta Final : ' + sContaFinal;

         lblTituloBalanceteCad2.caption := sTitulo;
      End;

   // Configura a quebra de página

   // Alterado por Arnaldo Vicente Scarin em 14/09/2009
   // SOL: 40495 Kintana: 523623
   // Alterações no layout do relatório conforme solicitação do SOL

//   If CmpRptCm.ParamValues[14].AsBoolean then
//     MudarTamanhoFonte(7)
//   else
   MudarTamanhoFonte(6);

   rptBalanceteCad.Groups[1].NewPage := CmpRptCM.ParamValues[11].AsBoolean;
   rptBalanceteCad.Groups[1].KeptTogether := Not CmpRptCM.ParamValues[11].AsBoolean;
   //   pplblTotais.Visible                    := Not CmpRptCM.ParamValues[11].AsBoolean;
   //   ppSomaDebito.Visible                   := Not CmpRptCM.ParamValues[11].AsBoolean;
   //   ppSomaCredito.Visible                  := Not CmpRptCM.ParamValues[11].AsBoolean;

   iPagIni := CmpRptCM.ParamValues[16].AsInteger;

   pplblAnexo.Caption := CmpRptCm.ParamValues[22].AsString;

   If CmpRptCM.ParamValues[23].AsBoolean Then
      Begin
         rptBalanceteCad.Groups[0].BreakName := 'CODSPC';
         If sNomePlanoPrev <> '' Then
            lblTituloBalanceteCad2.Caption := lblTituloBalanceteCad2.Caption + sNomePlanoPrev;
         If sNomePatro <> '' Then
            lblTituloBalanceteCad2.Caption := lblTituloBalanceteCad2.Caption + '/' + sNomePatro;
      End
   Else
      If CmpRptCM.ParamValues[24].AsBoolean Then
         rptBalanceteCad.Groups[0].BreakName := 'PLANOPREV'
      Else
         // Alterado por FHBS - SOL: 140372 KTN: 877866
         If CmpRptCm.ParamValues[28].AsBoolean Then
            Begin
               If (StrToIntDef(CmpRptCM.ParamValues[19].AsString, 0) > 0) Then
                  rptBalanceteCad.Groups[0].BreakName := 'CODSPC'
               Else
                  rptBalanceteCad.Groups[0].BreakName := '';
            End;
   // Fim - Alterado por FHBS

   // Alterado por FHBS - SOL: 140372 KTN: 877866
   lblCodCNPB_Titulo.Visible := Not (CmpRptCm.ParamValues[28].AsBoolean) Or
      ((CmpRptCm.ParamValues[28].AsBoolean) And
      (StrToIntDef(CmpRptCM.ParamValues[19].AsString, 0) > 0));
   dbTxtCNPB_Titulo.Visible := Not (CmpRptCm.ParamValues[28].AsBoolean) Or
      ((CmpRptCm.ParamValues[28].AsBoolean) And
      (StrToIntDef(CmpRptCM.ParamValues[19].AsString, 0) > 0));
   // Fim - Alterado por FHBS

   iNumero := FuncaoGeral.CalcNumEleGrau(ParamIntegra.MascaraPlano, 1);

   cdsBalancete.Data := CtrlRptBalanceteAnalPP.FazQuery(CmpRptCM.ParamValues[8].AsString, // 1
      CmpRptCM.ParamValues[9].AsString, // 2
      IntToStr(CmpRptCM.ParamValues[0].AsInteger), // 3
      IntToStr(CmpRptCM.ParamValues[1].AsInteger), // 4
      IntToStr(CmpRptCM.ParamValues[2].AsInteger), // 5
      CmpRptCM.ParamValues[3].AsString, // 6
      CmpRptCM.ParamValues[4].AsString, // 7
      False, // 8

      // Alterado por FHBS - SOL: 140372 KTN: 877866
      CmpRptCM.ParamValues[23].asBoolean And Not CmpRptCm.ParamValues[28].AsBoolean, // 9

      IntToStr(iNumero), // 10
      '', // 11
      IntToStr(ParamIntegra.Plano), // 12
      FloatToStr(CrmRptCM.IdEmpresa), // 13
      CtrlContab.TipoOpEncer, // 14
      CmpRptCM.ParamValues[19].AsString, // P.Previdenciario  // 15
      CmpRptCM.ParamValues[20].AsString, // Patrocinadoras    // 16
      CmpRptCM.ParamValues[21].AsString, // AtivProj selecionadas // 17
      sGrau, // 18
      False, // 19
      False, // 20
      False, // 21
      CmpRptCM.ParamValues[13].AsBoolean, // 22
      CmpRptCM.ParamValues[14].AsBoolean, // 23
      CmpRptCM.ParamValues[15].AsBoolean, // 24

      // Alterado por FHBS - SOL: 140372 KTN: 877866
      CmpRptCm.ParamValues[24].AsBoolean Or CmpRptCm.ParamValues[28].AsBoolean, // 25

      False, // 26
      CmpRptCm.ParamValues[26].AsString, // 27
      // Alterado por FHBS - SOL: 140372 KTN: 877866
      // Se for selecionado apenas um Plano é para mostrar o CODCNPB
      Not (CmpRptCm.ParamValues[28].AsBoolean) Or
      ((CmpRptCm.ParamValues[28].AsBoolean) And
      (StrToIntDef(CmpRptCM.ParamValues[19].AsString, 0) > 0)),

      CmpRptCm.ParamValues[28].AsBoolean);

   CdsBalancete.Data := CtrlRptBalanceteAnalPP.AjustaModImpressao(CdsBalancete.Data,
      CmpRptCM.ParamValues[27].AsBoolean,
      (CmpRptCM.ParamValues[26].AsString = 'SM'));

   // Alterado por Arnaldo Vicente Scarin em 14/09/2009
   // SOL: 40495 Kintana: 523623
   // Alterações no layout do relatório conforme solicitação do SOL
   CarregaDadosAssinatura;
End;

Procedure TRptBalanceteCad.CarregaDadosAssinatura;
Var dDataSelecao: TDateTime;

Begin
   dDataSelecao := UltimoDiaMes(StrToDate('01/' +
      IntToStr(CmpRptCM.ParamValues[2].AsInteger) + '/' +
      IntToStr(CmpRptCM.ParamValues[0].AsInteger)
      )
      );
   pplblLocalidade.Caption := FormatDateTime('"Brasilia," dd "de" mmmmm "de" yyyy.', dDataSelecao);

   With SqlCentroCusto Do
      Begin
         Prepare;
         ParamByName('DataSelecao').AsString := DateToStr(dDataSelecao);
         Open;
      End;
End;

Procedure TRptBalanceteCad.CmpRptCMParamControlEnter(Sender: TPainelControles;
   Index: Integer);
Begin
   Inherited;
   Case Index Of
      1: Begin
            TPainelControles(Sender).CdsDisplay.Filtered := False;
            TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = ' + IntToStr(StrToIntDef(sExercicio, 0));
            TPainelControles(Sender).CdsDisplay.Filtered := True;
         End;
      2: Begin
            TPainelControles(Sender).CdsDisplay.Filtered := False;
            TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = ' + IntToStr(StrToIntDef(sExercicio, 0));
            TPainelControles(Sender).CdsDisplay.Filtered := True;
         End;
   End;
End;

Procedure TRptBalanceteCad.ppFooterBand22BeforePrint(Sender: TObject);
Begin
   Inherited;
   //lblContadorCad.Caption := IntToStr((iPagIni + StrToInt(CalcCad5.text)) - 1);
End;

Procedure TRptBalanceteCad.FormCreate(Sender: TObject);
Begin
   Inherited;
   bJaAcertado := False;
   CtrlRptBalanceteAnalPP := TCtrlRptBalanceteAnalPP.Create;
   CtrlRptBalanceteAnalPP.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);

   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True,
      Nil,
      Nil,
      False);
End;

Procedure TRptBalanceteCad.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Inherited;
   CtrlContab.Free;
   CtrlRptBalanceteAnalPP.free;
End;

Procedure TRptBalanceteCad.ppDetailBand8BeforeGenerate(Sender: TObject);
Begin
   Inherited;
   //Configura a máscara das contas contábeis
   If (sMascara <> '') And (CdsBalancete.FieldByName('PLAGRAU').asInteger <> 0) Then
      Begin
         //sMascara := FuncaoGeral.CalcMascaraPorGrau(ParamIntegra.MascaraPlano, CdsBalancete.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
         sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, CdsBalancete.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
         dbtxtPlaConta.DisplayFormat := sMascara + ';0; ';
      End Else Begin
         dbtxtPlaConta.DisplayFormat := '';
      End;

End;

Procedure TRptBalanceteCad.ppDetailBand8AfterPrint(Sender: TObject);
Begin
   Inherited;
   If (CdsBalancete.FieldByName('PLAGRAU').asInteger = 1) Then
      MudarFonte(False);
End;

Procedure TRptBalanceteCad.ppDetailBand8AfterGenerate(Sender: TObject);
Begin
   Inherited;
   If (CdsBalancete.FieldByName('PLAGRAU').asInteger = 1) Then
      MudarFonte(True);
End;

Procedure TRptBalanceteCad.MudarTamanhoFonte(Const pTamanho: Integer);
Begin
   dbtxtSaldoAnterior.Font.Size := pTamanho;
   dbtxtSaldoAnteriorSinal.Font.Size := pTamanho;
   dbtxtValorDebito.Font.Size := pTamanho;
   dbtxtValorCredito.Font.Size := pTamanho;
   dbtxtValorMovimento.Font.Size := pTamanho;
   dbtxtSaldoAtual.Font.Size := pTamanho;
   dbtxtSaldoAtualSinal.Font.Size := pTamanho;
End;

Procedure TRptBalanceteCad.MudarFonte(Const pAtivarNegrito: Boolean);
Var tfEstilo: TFontStyles;
Begin
   If pAtivarNegrito Then
      tfEstilo := [fsBold]
   Else
      tfEstilo := [];

   dbtxtPlaConta.Font.Style := tfEstilo;
   //dbtxtPlaNome.Font.Style := tfEstilo;
   dbtxtSaldoAnterior.Font.Style := tfEstilo;
   dbtxtSaldoAnteriorSinal.Font.Style := tfEstilo;
   dbtxtValorDebito.Font.Style := tfEstilo;
   dbtxtValorCredito.Font.Style := tfEstilo;
   dbtxtValorMovimento.Font.Style := tfEstilo;
   dbtxtSaldoAtual.Font.Style := tfEstilo;
   dbtxtSaldoAtualSinal.Font.Style := tfEstilo;
End;

Procedure TRptBalanceteCad.ppGroupHeaderBand12BeforePrint(Sender: TObject);
Begin
   Inherited;
   // Alterado por FHBS - SOL: 140372 KTN: 877866
   If CmpRptCM.ParamValues[28].AsBoolean Then
      lblTituloBalanceteCad2.Caption := CmpRptCM.ParamValues[17].AsString
   Else
      If Not CmpRptCM.ParamValues[23].AsBoolean Then
         lblTituloBalanceteCad2.Caption := CdsBalancete.FieldByName('PLANOPREV').asString + ' / ' +
            CdsBalancete.FieldByName('PATRO').asString
      Else
         lblTituloBalanceteCad2.Caption := MontaPlanoPrev(CdsBalancete.FieldByName('CODSPC').asString);

   If Not bJaAcertado Then
      Begin
         bJaAcertado := True;
         Case iNumColunas Of
            3: Begin
                  // Posicionamento da Coluna do Saldo Anterior
                  lblSaldoAnterior.left := lblCredito.Left - 5;
                  dbtxtSaldoAnterior.left := dbtxtValorCredito.Left - 5;
                  dbtxtSaldoAnteriorSinal.left := dbtxtSaldoAnterior.Left +
                     dbtxtSaldoAnterior.Width + 1;

                  // Posicionamento da Coluna Debito
                  lblDebito.visible := false;
                  dbtxtValorDebito.visible := false;
                  lblCredito.visible := false;
                  dbtxtValorCredito.visible := false;
               End;
            4: Begin
                  // Posicionamento da Coluna do Saldo Anterior
                  lblSaldoAnterior.left := lblDebito.Left - 5;
                  dbtxtSaldoAnterior.left := dbtxtValorDebito.Left - 5;
                  dbtxtSaldoAnteriorSinal.left := dbtxtSaldoAnterior.Left +
                     dbtxtSaldoAnterior.Width + 1;

                  // Posicionamento da Coluna Debito
                  lblDebito.left := lblCredito.Left;
                  dbtxtValorDebito.left := dbtxtValorCredito.Left;

                  // Posicionamento da Coluna Credito
                  lblCredito.left := lblMovimentacao.Left;
                  dbtxtValorCredito.left := dbtxtValorMovimento.Left;

                  // Posicionamento da Coluna de Movimentacao
                  lblMovimentacao.visible := False;
                  dbTxtValorMovimento.visible := False;
               End;
         End;
      End;
End;

Procedure TRptBalanceteCad.dbTxtCNPB_TituloGetText(Sender: TObject;
   Var Text: String);
Begin
   Inherited;
   If Text <> '' Then
      Text := Copy(Text, 1, 2) + '.' +
         Copy(Text, 3, 3) + '.' +
         Copy(Text, 6, 3) + '-' +
         Copy(Text, 9, 2);
End;

Function TRptBalanceteCad.MontaPlanoPrev(Const pCodCNPB: String): String;
Begin
   sqlTitulos.SQL.Clear;
   //sqlTitulos.Sql.Add('Select Nome,CODSPC');
   //sqlTitulos.Sql.Add('from ( SELECT PC.IDPLANOPREV,');
   //sqlTitulos.Sql.Add('              pc.nome,');
   //sqlTitulos.Sql.Add('              DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC');
   //sqlTitulos.Sql.Add('       FROM PLANPREVCONTABIL PC, PLANPREV PP');
   //sqlTitulos.Sql.Add('       WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV');
   //sqlTitulos.Sql.Add('       order by codspc) M');
   //sqlTitulos.Sql.Add('where CODSPC = :CODSPC');
   //sqlTitulos.Prepare;
   //sqlTitulos.ParamByName('CODSPC').asString := pCodCnpb;
   //sqlTitulos.Open;

   sqlTitulos.Sql.Add('SELECT Pp.IDPLANOPREV,');
   sqlTitulos.Sql.Add('       pp.nome, pp.titulocontab');
   sqlTitulos.Sql.Add('FROM PLANPREV PP');
   sqlTitulos.Sql.Add('where PP.CODIGOSPC = :CODSPC');
   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('CODSPC').asString := pCodCnpb;
   sqlTitulos.Open;
   Result := '';
   While Not CdsTitulos.Eof Do
      Begin

         If (cdsTitulos.FieldByName('TITULOCONTAB').AsString = '') Then
            Result := Result + CdsTitulos.FieldByname('Nome').asString + ', ';

         If (cdsTitulos.FieldByName('TITULOCONTAB').AsString <> '') Then
            Begin
              if pos(TRIM(cdsTitulos.FieldByName('TITULOCONTAB').AsString), TRIM(result)) = 0 then   //Bruno Bastos
                Result := Result + CdsTitulos.FieldByname('TituloContab').asString + ', ';
            End;

         CdsTitulos.Next;
      End;
   If (length(Result) > 1) And (Result[Length(Result)] = ' ') Then
      Result := Copy(Result, 1, Length(Result) - 2);
End;

Procedure TRptBalanceteCad.ppHeaderBand21BeforePrint(Sender: TObject);
Begin
   Inherited;
   lblContadorCad.Caption := IntToStr((iPagIni + StrToInt(CalcCad5.text)) - 1);
End;

End.

