// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{-----------------------------------------------------------------------------------------------------
Nº Solicitação...: WO25167
Data da Alteração: 05/09/2025
Responsável......: Paulo Nobre
Descrição........: Ajustes para quando selecionado um mes e/ou um ano a data de pagamento ser sempre
                   sugerida o último dia do mês/ano selecionados.
------------------------------------------------------------------------------------------------------
Nº Solicitação...: WO1920
Data da Alteração: 12/8/2024
Responsável......: Paulo Nobre
Descrição........: Implementar recursos para o Cálculo de contribuição patronal Sobre Provisão de 13º
                   .Inclusão de opção de seleção das rubricas de referencia para os calculos de
                    forma individualizada.
                   .Criadas funções para executar os processos de forma distinta:  
                     _CalculaContribPatronal (Rotinas já existentes, usando StoredProcs).
                     _CalculaProvisao13Patronal (Nova rotinas na uCtrlIntegraContribPrev).
                   .Em alinhamento com o Everson, como quase toda funcionalidade foi refeita, o código
                    foi limpo com a retirada de muitas rotinas comentadas.     
------------------------------------------------------------------------------------------------------
Nº SIG............: 67627
Data da Alteração.: 06/07/2018
Responsável.......: Denis Horongoso
Descrição.........: Desenvolvimento de relatorio de log para prévia.
---------------------------------------------------------------------------------------------------
Nº SOL............: 189675.17571
Nº PPM............: 989707
Data da Alteração.: 27/07/2015
Alteração Form....: alteração da funcionalidade
Responsável.......: William Santana
Descrição.........: Desenvolvimento do cálculo e gravação das contribuições FUNCEF patronal.
--------------------------------------------------------------------------------------------------
Rotina......: Criação da funcionalidade
Nº SOL......: 152930
Nº KINTANA..: 1146562
Data........: 11/06/2012
Responsável.: Edilaine Ferraresi
Descrição...: Implementação da Integração Contribuição Previdenciaria
---------------------------------------------------------------------------------------------------}

Unit fIntegraContribPrev;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, CheckLst, ColorCheckListBox, ComCtrls, uCMFileUtils,
   DBTables, wwstorep, Db, DBClient, uCMClientDataSet, wwdbdatetimepicker,
   CMDateTimePicker, wwdblook, Spin, uCtrlIntegraContribPrev, Grids,
   Wwdbigrd, Wwdbgrid, Wwdatsrc, uCmSqlParams;

Type
   TFrmIntegraContribPrev = Class(TfrmOkCancelar)
      pnlDados: TPanel;
      CdsMotivo: TCMClientDataSet;
      CdsRubrica: TCMClientDataSet;
      cdsFunc: TCMClientDataSet;
      cdsIntegra: TCMClientDataSet;
      spAtualizaContribPrevia: TwwStoredProc;
      btnGeracao: TBitBtn;
      rgProcesso: TRadioGroup;
      pnlRubricas: TPanel;
      grbAnoMesRef: TGroupBox;
      cmbMes: TComboBox;
      speAno: TSpinEdit;
      grb1: TGroupBox;
      dtedPagto: TCMDateTimePicker;
      gridRubricas: TwwDBGrid;
      pnlRubr2: TPanel;
      dsRubrica: TwwDataSource;
      spAtualizaContribFinal: TwwStoredProc;
      SQLRubrica: TCMSqlParams;
      CdsRubricaTIPO: TStringField;
      CdsRubricaCOD_RUB: TStringField;
      CdsRubricaRUBRICA: TStringField;
      CdsRubricaSUBTIPO: TStringField;
      CdsRubricaCOD_MOTIVO: TStringField;
      CdsRubricaMOTIVO: TStringField;
      CdsRubricaPAGADOR: TStringField;
      CdsRubricaSUB_TIPO: TStringField;
      GroupBox1: TGroupBox;
      cbRubRef: TComboBox;
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure cmbMesChange(Sender: TObject);
      Procedure speAnoChange(Sender: TObject);
      Procedure btnGeracaoClick(Sender: TObject);
      Procedure cbRubRefChange(Sender: TObject);
   Private
      { Private declarations }
      CtrlIntegraContribPrev: TCtrlIntegraContribPrev;

      Periodo: TRecData;
      ListaIdRubrica: TStringList;

      //Início -  William Santana - SOL 189675.17571 PPM 989707
      ListaCodRubrica: TStringList;
      Function ProcessaIntegracao(sAnoMes, sNomeArq: String; iProcesso: integer): boolean;

      // Paulo Nobre - WO1920 - Inicio
      Procedure _CalculaContribPatronal;
      Procedure _CalculaProvisao13Patronal;
      // Paulo Nobre - WO1920 - Fim

   Public
      { Public declarations }
   End;

Var
   FrmIntegraContribPrev: TFrmIntegraContribPrev;
   // Paulo Nobre - WO1920 - Inicio
   sMesAno, sAnoMes, sNomeArq: String;
   iMotivo: Integer;
   // Paulo Nobre - WO1920 - Fim

   dDataRef : TDateTime;   // Paulo Nobre - WO25167

Implementation

Uses uSistema, uMensErro, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCtrlPadroes;

{$R *.DFM}

Procedure TFrmIntegraContribPrev.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlIntegraContribPrev := TCtrlIntegraContribPrev.Create;
   CtrlIntegraContribPrev.InitializeAs(Padroes);

   Periodo := CtrlIntegraContribPrev.GetPeriodoAtual();

   cmbMes.ItemIndex := Periodo.Mes - 1;
   speAno.Text := IntToStr(Periodo.Ano);

   // Paulo Nobre - WO25167 - Inicio
   Periodo.sMes := cmbMes.text;
   dDataRef := strtodate('01/'+FU.RetornaMes(Periodo.sMes)+'/'+speAno.text);
   dtedPagto.Date := FU.TrazUltDiaData(dDataRef);
   // Paulo Nobre - WO25167 - Fim

   ListaIdRubrica := TStringList.Create;
   //Início -  William Santana - SOL 189675.17571 PPM 989707
   ListaCodRubrica := TStringList.Create;
   CdsRubrica.Data := CtrlIntegraContribPrev.ListaRubricas('-99999'); // Paulo Nobre - WO1920

   //Salário
   ListaIdRubrica.clear;
   ListaIdRubrica.Add('S_MES');
   ListaIdRubrica.Add('S_DIFMES');
   ListaIdRubrica.Add('S_DEVMES');
   ListaIdRubrica.Add('S_13SAL');
   ListaIdRubrica.Add('S_DIF13SAL');
   ListaIdRubrica.Add('S_DEV13SAL');
   ListaIdRubrica.Add('S_AD13SAL');
   ListaIdRubrica.Add('S_DIFAD13SAL');
   ListaIdRubrica.Add('S_DEVAD13SAL');

   //Contribuição participante
   ListaIdRubrica.Add('C1_MES');
   ListaIdRubrica.Add('C1_DIFMES');
   ListaIdRubrica.Add('C1_DEVMES');
   ListaIdRubrica.Add('C1_13SAL');
   ListaIdRubrica.Add('C1_DIF13SAL');
   ListaIdRubrica.Add('C1_DEV13SAL');
   ListaIdRubrica.Add('C1_AD13SAL');
   ListaIdRubrica.Add('C1_DIFAD13SAL');
   ListaIdRubrica.Add('C1_DEVAD13SAL');
   ListaIdRubrica.Add('C1_AUTOMES');                        //edilaine SIG67627
   ListaIdRubrica.Add('C1_AUTODIFMES');                     //edilaine SIG67627

   //Contribuição patrocinadora
   ListaIdRubrica.Add('C21_MES');
   ListaIdRubrica.Add('C21_DIFMES');
   ListaIdRubrica.Add('C21_DEVMES');
   ListaIdRubrica.Add('C21_13SAL');
   ListaIdRubrica.Add('C21_DIF13SAL');
   ListaIdRubrica.Add('C21_DEV13SAL');
   ListaIdRubrica.Add('C21_AD13SAL');
   ListaIdRubrica.Add('C21_DIFAD13SAL');
   ListaIdRubrica.Add('C21_DEVAD13SAL');

   cbRubRef.ItemIndex := 0;                                 // Paulo Nobre - WO1920
End;

// Paulo Nobre - WO25167 - Inicio
Procedure TFrmIntegraContribPrev.cmbMesChange(Sender: TObject);
Begin
   Periodo.sMes := cmbMes.text;
   If Trim(Periodo.sMes) <> '' Then
      Periodo.mes := StrToInt(FU.RetornaMes(Periodo.sMes))
   Else
      Periodo.mes := 0;

   dDataRef := strtodate('01/'+FU.RetornaMes(Periodo.sMes)+'/'+speAno.text);
   dtedPagto.Date := FU.TrazUltDiaData(dDataRef);
End;

Procedure TFrmIntegraContribPrev.speAnoChange(Sender: TObject);
Begin
   Periodo.ano := StrToInt(speAno.text);

   dDataRef := strtodate('01/'+FU.RetornaMes(Periodo.sMes)+'/'+speAno.text);
   dtedPagto.Date := FU.TrazUltDiaData(dDataRef);
End;
// Paulo Nobre - WO25167 - Fim

Procedure TFrmIntegraContribPrev.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlIntegraContribPrev);

   FreeAndNil(ListaIdRubrica);
   //Início -  William Santana - SOL 189675.17571 PPM 989707
   FreeAndNil(ListaCodRubrica);

   Inherited;
End;

Procedure TFrmIntegraContribPrev.btnGeracaoClick(Sender: TObject);
Var sRubRef, sMsg: String;
Begin

   If (Trim(speAno.Text) = '') Then
   Begin
      MsgDlg('Preencha o Ano de Referência.', 'Aviso', mtInformation, [mbOk], 0);
      speAno.SetFocus;
      Exit;
   End;

   If (Trim(dtedPagto.Text) = '') Then
   Begin
      MsgDlg('Preencha a Data de Pagamento.', 'Aviso', mtInformation, [mbOk], 0);
      dtedPagto.SetFocus;
      Exit;
   End;

   // Paulo Nobre - WO1920 - Inicio
   If (cbRubRef.itemindex = 0) Then
   Begin
      MsgDlg('Preencha a Rubrica de Referência.', 'Aviso', mtInformation, [mbOk], 0);
      cbRubRef.SetFocus;
      Exit;
   End;

   // Variáveis globais
   sMesAno := FU.PoeZero(Periodo.Mes) + '/' + speAno.text;
   sAnoMes := speAno.text + '/' + FU.PoeZero(Periodo.Mes);
   iMotivo := 1;                                            // Folha mensal de empregados

   Case cbRubRef.itemindex Of
      1: sMsg := 'Contribuição Patronal';
      2: sMsg := 'Provisão do 13º Contrib. Patronal';
   End;

   If MsgDlg(pchar('Confirma Geração dos Cálculos da ' + sMsg + ' ?'), 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
   Begin
      Screen.Cursor := crSQLWait;

      Case cbRubRef.itemindex Of
         1: _CalculaContribPatronal;                        // Contribuições FUNCEF patronal.
         2: _CalculaProvisao13Patronal;                     // Provisões do 13º contribuição patronal.
      End;

      Screen.Cursor := crDefault;
   End;
   // Paulo Nobre - WO1920 - Fim
End;

// Paulo Nobre - WO1920 - Inicio

Procedure TFrmIntegraContribPrev.cbRubRefChange(Sender: TObject);
Var sRubRef: String;
Begin
   Inherited;

   Case cbRubRef.itemindex Of
      1: sRubRef := '32442';                                // CONT FUNCEF/REB ( EMPRESA ) MES
      2: sRubRef := '32878';                                // P13 - CONT REB EMPRESA MES
   End;

   CdsRubrica.Data := CtrlIntegraContribPrev.ListaRubricas(sRubRef);
End;

//=================================================================================
// Cálculo da Rubrica (32442) CONT FUNCEF/REB ( EMPRESA ) MES
//=================================================================================

Procedure TFrmIntegraContribPrev._CalculaContribPatronal;
Var iCampos: integer;
Begin
   cdsIntegra.Data := CtrlIntegraContribPrev.VerificaTabReb2002(sMesAno);

   If cdsIntegra.IsEmpty Then
   Begin
      MsgDlg('Não foram encontradas as parametrizações da tabela genérica: TAB_REB_2002', 'Aviso', mtInformation, [mbOk], 0);
      Exit;
   End
   Else
   Begin
      For iCampos := 0 To (cdsIntegra.FieldCount - 1) Do
      Begin
         If (cdsIntegra.Fields[iCampos].AsString = EmptyStr) Then
         Begin
            MsgDlg('Não foram encontradas as parametrizações da tabela genérica: TAB_REB_2002', 'Aviso', mtInformation, [mbOk], 0);
            Exit;
         End;
      End;
   End;

   If (CdsRubrica.IsEmpty) Then
   Begin
      MsgDlg('Não foram encontradas as parametrizações da tabela genérica: RUBRICACONTRIB', 'Aviso', mtInformation, [mbOk], 0);
      Exit;
   End
   Else
   Begin
      CdsRubrica.DisableControls;
      CdsRubrica.First;
      ListaCodRubrica.clear;
      While Not (CdsRubrica.eof) Do
      Begin
         If (Trim(CdsRubrica.FieldByName('TIPO').AsString) <> 'PERCENTUAL') Then
            ListaCodRubrica.Add(Trim(CdsRubrica.FieldByName('SUB_TIPO').AsString));
         CdsRubrica.next;
      End;
      ListaIdRubrica.Sort;
      ListaCodRubrica.Sort;
      If Not ListaIdRubrica.Equals(ListaCodRubrica) Then
      Begin
         MsgDlg('Não foram encontradas as parametrizações da tabela genérica: RUBRICACONTRIB', 'Aviso', mtInformation, [mbOk], 0);
         Exit;
      End;

   End;
   CdsRubrica.EnableControls;

   cdsFunc.Data := CtrlIntegraContribPrev.ListaFuncionario(rgProcesso.ItemIndex, sAnoMes);
   If (cdsFunc.IsEmpty) Then
   Begin
      MsgDlg('Não há dados para geração', 'Aviso', mtInformation, [mbOk], 0);
      Exit;
   End;

   If (rgProcesso.ItemIndex = 0) Then
   Begin
      If MsgDlg('Processo será executado a partir das informações geradas pela Prévia da Folha de Pagamento e afetará apenas a Prévia da Folha de Pagamento e a Prévia do Módulo de Contribuições, confirma?',
         'Confirma', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         exit;
   End
   Else
   Begin
      If MsgDlg('Processo será executado a partir das informações geradas pela Folha Final de Pagamento e Integrará com o Módulo de Contribuições, confirma?',
         'Confirma', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         exit;
   End;

   //sNomeArq := 'C:\Planus\Temp\Integração ContribPrev '+ FormatDateTime('ddmmyyyy', Date) + '.txt'; //Denis Horongoso - SIG 67627
   sNomeArq := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\Integração ContribPrev ' + FormatDateTime('ddmmyyyy', Date) + '.txt'; //Denis Horongoso - SIG67627

   If ProcessaIntegracao(sAnoMes, sNomeArq, rgProcesso.ItemIndex) Then
   Begin
      MsgDlg('Geração efetuada com sucesso', 'Aviso', mtInformation, [mbOk], 0);

      //if rgProcesso.ItemIndex = 1 then //Denis Horongoso - SIG 67627
      ShellExecuteFile(sNomeArq, '', '', SW_SHOW);
   End;

End;

Function TFrmIntegraContribPrev.ProcessaIntegracao(sAnoMes, sNomeArq: String; iProcesso: integer): boolean;
Begin
   Try
      If (iProcesso = 0) Then
      Begin
         spAtualizaContribPrevia.Close;
         spAtualizaContribPrevia.ParamByName('pANOMES').AsString := sAnoMes;
         spAtualizaContribPrevia.ParamByName('pDATAPAGAMENTO').AsString := dtedPagto.text;
         If Not (spAtualizaContribPrevia.Prepared) Then
            spAtualizaContribPrevia.Prepare;
         spAtualizaContribPrevia.ExecProc;
      End
      Else
      Begin
         spAtualizaContribFinal.Close;
         spAtualizaContribFinal.ParamByName('pANOMES').AsString := sAnoMes;
         spAtualizaContribFinal.ParamByName('pDATAPAGAMENTO').AsString := dtedPagto.text;
         spAtualizaContribFinal.ParamByName('pUSUARIO').AsString := IntToStr(Sistema.IdUsuario);

         If Not (spAtualizaContribFinal.Prepared) Then
            spAtualizaContribFinal.Prepare;
         spAtualizaContribFinal.ExecProc;
      End;

      //If (iProcesso = 1) then begin                                 //Denis Horongoso - SIG 67627
      Result := CtrlIntegraContribPrev.GeraLogIntegracao(sNomeArq, sAnoMes
         , iProcesso                                        //Denis Horongoso - SIG 67627
         );
      If Not (Result) Then
         MsgDlg(CtrlIntegraContribPrev.MessageInfo, 'Aviso', mtInformation, [mbOk, mbHelp], 0);

      // end else Result := True;                                      //Denis Horongoso - SIG 67627
   Except
      Result := false;
   End;

End;

// Paulo Nobre - WO1920 - Inicio
//===========================================================================================================
// Cálculo da Rubrica (32878) P13 - CONT REB EMPRESA MES
//===========================================================================================================

Procedure TFrmIntegraContribPrev._CalculaProvisao13Patronal;
Var ivTipoErro: Integer;
Begin

   CtrlIntegraContribPrev._CalcRubP13ContRebEmpresaMes(sAnoMes, dtedPagto.Text, iMotivo, rgProcesso.ItemIndex, ivTipoErro );

   If ivTipoErro = 0 Then
      Application.MessageBox(pchar('Inclusão da Contrib. Patronal sobre o 13º' + #13 + #13 +
                                   'dos Empregados realizada com sucesso !'), 'Aviso', Mb_IconExclamation)
   Else If ivTipoErro = 1 Then
      Application.MessageBox(pchar('Não foram encontradas as parametrizações na tabela genérica: TAB_REB_2002'), ' Atenção !', MB_ICONEXCLAMATION + mb_OK + mb_DefButton1)
   Else If ivTipoErro = 2 Then
      Application.MessageBox(pchar('Não foi encontrado movimento de Empregados. Verifique!'), ' Atenção !', MB_ICONEXCLAMATION + mb_OK + mb_DefButton1);

   Exit;
End;
// Paulo Nobre - WO1920 - Fim

End.

