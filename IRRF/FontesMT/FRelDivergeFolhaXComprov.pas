//******************************************************************************************
//N. Sol..........: 159720
//N. Kintana......: 1789355
//Data............: 23/10/2012  / 24/05/2013
//Responsável.....: Paulo / Thiago / Fábio
//Descrição.......: Tela de filtro para a impressão do Relatório de
//                  Divergências - Folha x Comprovante Rendimento
//******************************************************************************************
Unit FRelDivergeFolhaXComprov;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, TB97, TB97Tlbr, ComCtrls, DBTables, wwstorep,
   uCmSqlParams, DBClient, uCMClientDataSet, TXComp, TXRB, ppParameter,
   ppModule, raCodMod, ppBands, ppCtrls, ppClass, ppPrnabl, ppCache, ppProd,
   ppReport, Db, uValidaDoc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
   Wwdatsrc, Wwquery, Grids, Wwdbigrd, Wwdbgrid, Mask, TREdit, ExtCtrls,
   fPreview, uCtrlFuncoesRH, uCtrlRelDivergeFolhaXComprov, uCtrlPadroes,
   uCMFileUtils, daDataModule;

Const CorDaZebra = clBtnFace; //$00C0FFFF;

Type
   TfrmRelDivergeFolhaXComprov = Class(TForm)
      pnlDireito: TPanel;
      ListView1: TListView;
      Panel1: TPanel;
      pnlEsquerdo: TPanel;
      Label3: TLabel;
      Label4: TLabel;
      Label2: TLabel;
      rdgTipo: TRadioGroup;
      dbValor: TDBRealEdit;
      edAnoBase: TEdit;
      UpDown1: TUpDown;
      pnlSuperior: TPanel;
      Label1: TLabel;
      spbIncluirBenef: TSpeedButton;
      spbExcluirBenef: TSpeedButton;
      Dock971: TDock97;
      spbImprimir: TSpeedButton;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      edCPF: TMaskEdit;
      CMValidaDoc1: TCMValidaDoc;
      ppDivergencias: TppBDEPipeline;
      rptRelDivergeFolhaXComp: TppReport;
      ppParameterList2: TppParameterList;
      ExtraOptions1: TExtraOptions;
      bbtnCancelar: TBitBtn;
      spbAbreArquivo: TSpeedButton;
      dlgAbreArquivo: TOpenDialog;
      bbtnInverte: TBitBtn;
      CdsDivergencias: TCMClientDataSet;
      DsDivergencias: TwwDataSource;
      NCPF: TppField;
      CdsCabec: TCMClientDataSet;
      CdsGeral: TCMClientDataSet;
      CdsCPF: TCMClientDataSet;
      dsTotalizadores: TwwDataSource;
      qryTotalizadores: TwwQuery;
      qryTotalizadoresMARCA: TStringField;
      qryTotalizadoresDESCRICAO: TStringField;
      qryTotalizadoresORDEMIMP: TFloatField;
      qryTotalizadoresIDTOTALIZARELDIVERGENCIA: TFloatField;
      UpdTotalizadores: TUpdateSQL;
      Panel2: TPanel;
      wwDBGrid1: TwwDBGrid;
      ckbSintetico: TCheckBox;
      ppDetailBand2: TppDetailBand;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppShape2: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLabel4: TppLabel;
      ppDBText4: TppDBText;
      ppDBText1: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDBText2: TppDBText;
      ppLabel3: TppLabel;
      ppDBText3: TppDBText;
      ppLabel5: TppLabel;
      ppDBText5: TppDBText;
      ppLabel6: TppLabel;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppDBText8: TppDBText;
      ppLabel9: TppLabel;
      ppDBText9: TppDBText;
      ppLabel10: TppLabel;
      ppDBText10: TppDBText;
      ppLabel11: TppLabel;
      ppDBText11: TppDBText;
      ppLabel12: TppLabel;
      ppDBText12: TppDBText;
      ppLabel13: TppLabel;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppDBText15: TppDBText;
      ppLabel53: TppLabel;
      pplblDataConc: TppLabel;
      ppLabel52: TppLabel;
      ppShape6: TppShape;
      ppLabel18: TppLabel;
      ppDBText16: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppShape1: TppShape;
      raCodeModule1: TraCodeModule;
      ppShape3: TppShape;
      shpDetalhe: TppShape;
      dbgCPFSel: TwwDBGrid;
      cdsCPFsSelecionados: TCMClientDataSet;
      dsCPFsSelecionados: TwwDataSource;
      SQLCPFsSelecionados: TCMSqlParams;
      cdsCPFsSelecionadosNOME: TStringField;
      cdsCPFsSelecionadosCPF: TStringField;
      Panel3: TPanel;
      meQtd: TStaticText;
      Procedure FormShow(Sender: TObject);
      Procedure spbImprimirClick(Sender: TObject);
      Procedure spbExcluirBenefClick(Sender: TObject);
      Procedure spbIncluirBenefClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure spbAbreArquivoClick(Sender: TObject);
      Procedure bbtnInverteClick(Sender: TObject);
      Procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure rptRelDivergeFolhaXCompStartPage(Sender: TObject);
      Procedure shpDetalhePrint(Sender: TObject);
      Procedure dbgCPFSelCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure cdsCPFsSelecionadosAfterScroll(DataSet: TDataSet);
   Private
      cCorZebra: TColor;
      ListaDeCPFSFormatados: String;
      ListaDeNaturezasFormatadas: String;
      Totalizadores: String;

      CtrlFuncoesRH: TCtrlFuncoesRH;
      CtrlRelDivergeFolhaXComprov: TCtrlRelDivergeFolhaXComprov;

      Procedure DefineNaturezas;
      Procedure DefineTotalizadores;
      Procedure PreparaListaDeCPFSFormatados;
      Function validaCPF: boolean;
      Function verificaExistenciaBeneficiario(sCodDocumento: String; Var sNomeBeneficiario: String): boolean;

      Procedure InserirDivergencia(flgCabec: SmallInt; TotalFolha, TotalComprovante, Diferenca: Double;
         OutraMatricula: String; InsereDescricaoFolha: Boolean);
      Procedure processaDivergencias(Ano: String);
      Function valorDivergencia(vlrFolha, vlrComprovante: Double): Double;
      Procedure imprimirRelatorio;
      Function verificaExisteOutraMatricula(Matricula, Cpf: String; Cds: TCmClientDataSet): String;
      Function verificaTipoImpressao(vlrComprovante: Double): Boolean;
   Public
   End;

Var
   frmRelDivergeFolhaXComprov: TfrmRelDivergeFolhaXComprov;
   sNomeBeneficiario: String;
   bImportouLista: Boolean;
   iResp: Integer;

Implementation

Uses uSistema, uMensErro, uDataBase, DBaseDados, uCmControlObject,
   FProgresso;

{$R *.DFM}

Procedure TfrmRelDivergeFolhaXComprov.FormCreate(Sender: TObject);
Begin
   CtrlFuncoesRH := TCtrlFuncoesRH.Create;
   CtrlRelDivergeFolhaXComprov := TCtrlRelDivergeFolhaXComprov.Create;
   CtrlRelDivergeFolhaXComprov.InitializeAs(Padroes);
End;

Procedure TfrmRelDivergeFolhaXComprov.FormShow(Sender: TObject);
Var wAno, wMes, wDia: word;
Begin
   Inherited;
   iResp := 0;
   DecodeDate(Date, wAno, wMes, wDia);
   edAnoBase.Text := IntToStr(wAno); // Sempre o ano anterior
   rdgTipo.itemindex := 0; // Normal
   bImportouLista := False;
   SQLCPFsSelecionados.Open;
   qryTotalizadores.Close;
   qryTotalizadores.Open;
   edAnoBase.setfocus;
End;

Function TFrmRelDivergeFolhaXComprov.verificaExistenciaBeneficiario(sCodDocumento: String; Var sNomeBeneficiario: String): boolean;
Var
   sSQL: String;
   qryAux: TwwQuery;
Begin
   result := false;
   qryAux := TwwQuery.Create(Nil);
   qryAux.DataBaseName := 'Basedados';
   sSQL := 'select nome from pessoa where numdocumento = ' + QuotedStr(sCodDocumento);
   qryAux.sql.add(sSQL);
   Try
      cursor := crSQLWait;
      qryAux.Close;
      qryAux.open;
      If Not (qryAux.isEmpty) Then
         Begin
            sNomeBeneficiario := qryAux.fieldbyname('nome').asString;
            result := true;
         End;
   Finally
      qryAux.Close;
      cursor := crDefault;
      FreeAndNil(qryAux);
   End;
End;

Function TFrmRelDivergeFolhaXComprov.validaCPF: boolean;
Begin
   Result := False;
   If (edCPF.text <> '') Then
      Begin
         CMValidaDoc1.NumDocumento := edCPF.text;
         Result := CMValidaDoc1.DocumentoValido;
      End;
End;

Procedure TfrmRelDivergeFolhaXComprov.spbIncluirBenefClick(Sender: TObject);
Begin
   If (edCPF.text <> '') Then
      Begin
         If validaCPF Then // Validando o CPF
            Begin
               If verificaExistenciaBeneficiario(edCPF.text, sNomeBeneficiario) Then
                  Begin
                     If cdsCPFsSelecionados.Locate('CPF', edCPF.text, [locaseinsensitive]) Then
                        Application.MessageBox(Pchar('Beneficiário -> ' + sNomeBeneficiario + ' já selecionado. Verifique !'), 'Atenção !', Mb_IconExclamation)
                     Else
                        Begin
                           cdsCPFsSelecionados.insert;
                           cdsCPFsSelecionados.fieldbyname('CPF').asString := edCPF.text;
                           cdsCPFsSelecionados.fieldbyname('NOME').asString := sNomeBeneficiario;
                           cdsCPFsSelecionados.Post;
                           cdsCPFsSelecionados.First;
                        End;
                  End
               Else
                  Application.MessageBox(Pchar('Não foi encontrado Beneficiário cadastrado com este CPF -> ' + edCPF.text + '. Verifique !'), 'Atenção !', Mb_IconExclamation);
            End
         Else
            Application.MessageBox('CPF Inválido. Verifique !', 'Atenção !', Mb_IconExclamation);

         edCPF.AutoSelect := True;
         edCPF.setfocus;
      End;
End;

Procedure TfrmRelDivergeFolhaXComprov.spbExcluirBenefClick(Sender: TObject);
Begin
   If Not cdsCPFsSelecionados.isEmpty Then
      cdsCPFsSelecionados.Delete;
   edCPF.setfocus;
End;

Procedure TfrmRelDivergeFolhaXComprov.spbImprimirClick(Sender: TObject);
Begin
   If Not cdsCPFsSelecionados.isEmpty Then
      Begin
         If iResp = 0 Then 
            iResp := Application.MessageBox('O Ano Base foi devidamente selecionado ?', 'Atenção !', MB_ICONQUESTION + MB_YESNO);

         If iResp <> 0 Then // IDYES;
            Begin
               Try
                  iResp := IDYES;
                  Self.Enabled := False;
                  CtrlRelDivergeFolhaXComprov.StartTransaction;
                  If bImportouLista = False Then
                     PreparaListaDeCPFSFormatados;
                  DefineTotalizadores;
                  DefineNaturezas;
                  CdsCPF.Data := CtrlRelDivergeFolhaXComprov.Listar_CPF(edAnoBase.Text, ListaDeCPFSFormatados, ListaDeNaturezasFormatadas, Totalizadores);
                  If Not CdsCPF.IsEmpty Then
                     Begin
                        cursor := crHourGlass;
                        CtrlRelDivergeFolhaXComprov.Prepara_Folha_Comprovante(edAnoBase.Text, Totalizadores, ListaDeNaturezasFormatadas);
                        ProcessaDivergencias(edAnoBase.Text);
                        ImprimirRelatorio;
                        qryTotalizadores.First;
                        cdsCPFsSelecionados.First;
                        cursor := crDefault;
                     End;
               Finally
                  Self.Enabled := True;
                  If CtrlRelDivergeFolhaXComprov.InTransaction Then
                     CtrlRelDivergeFolhaXComprov.Commit;
               End;
            End;
      End;
End;

Procedure TfrmRelDivergeFolhaXComprov.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmRelDivergeFolhaXComprov.bbtnCancelarClick(Sender: TObject);
Begin
   cdsCPFsSelecionados.EmptyDataSet;
   qryTotalizadores.first;
   edCPF.clear;
   dbValor.Text := '0,01';
   edAnoBase.Setfocus;
End;

Procedure TfrmRelDivergeFolhaXComprov.spbAbreArquivoClick(Sender: TObject);
Var sLinha, sCPF, sNome: String;
   x, iQtdLinhas, icontador: Integer;
   Lista: TStringList;
Begin
   bbtnCancelarClick(self);
   cursor := crHourGlass;
   Lista := TStringList.Create;
   Application.ProcessMessages;
   dlgAbreArquivo.Execute;
   // Paulo em 23/05/2013
   If dlgAbreArquivo.FileName <> '' Then
      Begin
         // Contando a quantidade de linhas p/ uso no Progresso
         Lista.LoadFromFile(dlgAbreArquivo.FileName);
         iQtdLinhas := Lista.Count;
         If copy(Lista.Strings[0], 13, 70) = '' Then // NOME
            Begin
               Application.MessageBox('Lista precisa conter CPF e NOME (separados por vírgula). Verifique !', 'Atenção', Mb_IconExclamation);
               Exit;
            End;

         frmProgresso.MostraFormProgresso('Importando Lista de CPF´s...', True, True, True, 0, iQtdLinhas);
         cdsCPFsSelecionados.disableControls;
         iContador := 0;
         ListaDeCPFSFormatados := '';
         For x := 0 To lista.count - 1 Do
            Begin
               inc(iContador);
               frmProgresso.AndaFormProgresso(iContador);

               If frmProgresso.Cancelou Then
                  Exit;

               cdsCPFsSelecionados.insert;
               cdsCPFsSelecionados.fieldbyname('CPF').asString := copy(Lista.Strings[x], 1, 11);
               cdsCPFsSelecionados.fieldbyname('NOME').asString := copy(Lista.Strings[x], 13, 70);
               cdsCPFsSelecionados.Post;

               ListaDeCPFSFormatados := ListaDeCPFSFormatados + QuotedStr(cdsCPFsSelecionados.fieldbyname('CPF').asString) + ',';
            End;
         frmProgresso.EscondeFormProgresso;
         cdsCPFsSelecionados.First;
         cdsCPFsSelecionados.enableControls;
         bImportouLista := (iContador > 0);
         ListaDeCPFSFormatados := Copy(ListaDeCPFSFormatados, 1, Length(ListaDeCPFSFormatados) - 1);
      End;
   cursor := crDefault;
   Lista.free;
End;

Procedure TfrmRelDivergeFolhaXComprov.bbtnInverteClick(Sender: TObject);
Begin
   qryTotalizadores.DisableControls;
   qryTotalizadores.First;
   While Not qryTotalizadores.Eof Do
      Begin
         qryTotalizadores.Edit;
         If qryTotalizadores.FieldByName('Marca').AsString = 'S' Then
            qryTotalizadores.FieldByName('Marca').AsString := 'N'
         Else
            qryTotalizadores.FieldByName('Marca').AsString := 'S';

         qryTotalizadores.Next;
      End;
   qryTotalizadores.First;
   qryTotalizadores.EnableControls;
End;

Procedure TfrmRelDivergeFolhaXComprov.wwDBGrid1CalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then Begin
         If Not Highlight Then Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then Begin
                     ABrush.Color := $00C0FFFF; // amarelo bebê
                  End Else Begin
                     ABrush.Color := clWhite;
                  End;
            End;
      End Else Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmRelDivergeFolhaXComprov.defineNaturezas;
Begin
   { normal
       0561, 5565, 1889, 7416, 7431, 3540, 3533    // Paulo em 23/05/2013
     resgate
       5565, 3223 }
   ListaDeNaturezasFormatadas := '';
   Case rdgTipo.ItemIndex Of
      // Normal
      0: ListaDeNaturezasFormatadas := QuotedStr('0561') + ',' + QuotedStr('5565') + ',' + QuotedStr('1889') + ',' +
         QuotedStr('3540') + ',' + QuotedStr('3533') + ',' + QuotedStr('7416') + ',' + QuotedStr('7431'); // Paulo em 23/05/2013
      // Resgate
      1: ListaDeNaturezasFormatadas := QuotedStr('5565') + ',' + QuotedStr('3223');
   End;
End;

Procedure TfrmRelDivergeFolhaXComprov.defineTotalizadores;
Begin
   Totalizadores := '';
   qryTotalizadores.First;
   While Not qryTotalizadores.Eof Do
      Begin
         If (Trim(qryTotalizadores.FieldByName('MARCA').AsString) <> 'S') Then
            Totalizadores := Totalizadores + qryTotalizadores.FieldByName('IDTOTALIZARELDIVERGENCIA').AsString + ',';

         qryTotalizadores.Next;
      End;

   If Trim(Totalizadores) <> '' Then
      Totalizadores := Copy(Totalizadores, 0, Length(Totalizadores) - 1);
End;

Procedure TfrmRelDivergeFolhaXComprov.imprimirRelatorio;
Begin
   If Not CdsDivergencias.IsEmpty Then
      TFrmPreview.CreateModalPreview(Nil, frmRelDivergeFolhaXComprov.rptRelDivergeFolhaXComp, frmRelDivergeFolhaXComprov.rptRelDivergeFolhaXComp.PrinterSetup.DocumentName)
   Else
      Application.MessageBox('Não houveram divergências !', 'Informação', Mb_IconExclamation)
End;

Procedure TfrmRelDivergeFolhaXComprov.InserirDivergencia(
   flgCabec: SmallInt; TotalFolha, TotalComprovante, Diferenca: Double;
   OutraMatricula: String; InsereDescricaoFolha: Boolean);
Begin
   CdsDivergencias.Append;
   Case flgCabec Of
      0: Begin
            CdsDivergencias.FieldByName('DESCRICAO_FOLHA').AsString := CdsGeral.FieldByName('DESCRICAO').AsString;
            CdsDivergencias.FieldByName('DESCRICAO_COMPROVANTE').AsString := CdsGeral.FieldByName('DESCRICAO').AsString;
            CdsDivergencias.FieldByName('DIFERENCA').AsFloat := Diferenca;
            CdsDivergencias.FieldByName('TOTAL_RUBRICA').AsFloat := TotalFolha;
            CdsDivergencias.FieldByName('VALOR_COMPROVANTE').AsFloat := TotalComprovante;
         End;
      1: Begin
            CdsDivergencias.FieldByName('DESCRICAO_FOLHA').AsString := '   ' + CdsGeral.FieldByName('DSCGRUPO').AsString;
            CdsDivergencias.FieldByName('DESCRICAO_COMPROVANTE').AsString := '   ' + CdsGeral.FieldByName('NOMEINFORME').AsString;
            CdsDivergencias.FieldByName('DIFERENCA').Clear;
            CdsDivergencias.FieldByName('TOTAL_RUBRICA').AsFloat := CdsGeral.FieldByName('TOTAL_RUBRICA').AsFloat;
            CdsDivergencias.FieldByName('VALOR_COMPROVANTE').AsFloat := CdsGeral.FieldByName('VALOR_COMPROVANTE').AsFloat;
         End;
   Else Begin
         CdsDivergencias.FieldByName('DESCRICAO_COMPROVANTE').AsString := '   ' + CdsGeral.FieldByName('NOMEINFORME').AsString;
         CdsDivergencias.FieldByName('DIFERENCA').Clear;
         If InsereDescricaoFolha Then Begin
               CdsDivergencias.FieldByName('DESCRICAO_FOLHA').AsString := '   ' + CdsGeral.FieldByName('DSCGRUPO').AsString;
               CdsDivergencias.FieldByName('TOTAL_RUBRICA').AsFloat := CdsGeral.FieldByName('TOTAL_RUBRICA').AsFloat;
            End
         Else Begin
               CdsDivergencias.FieldByName('DESCRICAO_FOLHA').Clear;
               CdsDivergencias.FieldByName('TOTAL_RUBRICA').Clear;
            End;
         CdsDivergencias.FieldByName('VALOR_COMPROVANTE').AsFloat := CdsGeral.FieldByName('VALOR_COMPROVANTE').AsFloat;
      End;
   End;
   CdsDivergencias.FieldByName('ANO_CALENDARIO').AsString := CdsGeral.FieldByName('ANO_CALENDARIO').AsString;
   CdsDivergencias.FieldByName('CPF').AsString := CdsGeral.FieldByName('CPF').AsString;
   CdsDivergencias.FieldByName('GRUPO').AsFloat := CdsGeral.FieldByName('GRUPO').AsFloat;
   CdsDivergencias.FieldByName('DSCGRUPO').AsString := CdsGeral.FieldByName('DSCGRUPO').AsString;
   CdsDivergencias.FieldByName('ANOVIGENCIA').AsString := CdsGeral.FieldByName('ANOVIGENCIA').AsString;
   CdsDivergencias.FieldByName('IDINFORME').AsFloat := CdsGeral.FieldByName('IDINFORME').AsFloat;
   CdsDivergencias.FieldByName('NOMEINFORME').AsString := CdsGeral.FieldByName('NOMEINFORME').AsString;
   CdsDivergencias.FieldByName('DESCRICAO').AsString := CdsGeral.FieldByName('DESCRICAO').AsString;
   CdsDivergencias.FieldByName('ORDEMIMP').AsInteger := CdsGeral.FieldByName('ORDEMIMP').AsInteger;

   // Adicionando dados da Select do Cabeçalho
   CdsDivergencias.FieldByName('NOME').AsString := CdsCabec.FieldByName('NOME').AsString;
   CdsDivergencias.FieldByName('MATRICULA').AsString := CdsCabec.FieldByName('MATRICULA').AsString;
   CdsDivergencias.FieldByName('ANO').AsString := CdsCabec.FieldByName('ANO').AsString;
   CdsDivergencias.FieldByName('SEGUNDAMATRICULA').AsString := OutraMatricula;
   CdsDivergencias.FieldByName('IDADE_DEZ2004').AsString := CdsCabec.FieldByName('IDADE_DEZ').AsString;
   CdsDivergencias.FieldByName('PERACAO').AsString := CdsCabec.FieldByName('PERACAO').AsString;
   CdsDivergencias.FieldByName('FLGFAZDEPOSITO').AsString := CdsCabec.FieldByName('FLGFAZDEPOSITO').AsString;
   CdsDivergencias.FieldByName('DATAINICIO').AsString := CdsCabec.FieldByName('DATAINICIO').AsString;
   CdsDivergencias.FieldByName('DATAFINAL').AsString := CdsCabec.FieldByName('DATAFINAL').AsString;
   CdsDivergencias.FieldByName('TIPOACAO').AsString := CdsCabec.FieldByName('TIPOACAO').AsString;
   CdsDivergencias.FieldByName('DATAMORTE').AsString := CdsCabec.FieldByName('DATAMORTE').AsString;
   CdsDivergencias.FieldByName('DATANASC').AsString := CdsCabec.FieldByName('DATANASC').AsString;
   CdsDivergencias.FieldByName('SITPROCESSO').AsString := CdsCabec.FieldByName('SITPROCESSO').AsString;
   CdsDivergencias.FieldByName('DIB_FUNCEF').AsString := CdsCabec.FieldByName('DIB_FUNCEF').AsString;
   CdsDivergencias.FieldByName('DIB_INSS').AsString := CdsCabec.FieldByName('DIB_INSS').AsString;
   CdsDivergencias.Post;
End;

Function TfrmRelDivergeFolhaXComprov.verificaExisteOutraMatricula(Matricula, Cpf: String; Cds: TCmClientDataSet): String;
Var
   BookMark: TBookmark;
   Matriculas: String;
Begin
   If Cds.RecordCount = 0 Then
      Begin
         Result := '';
         Exit;
      End;

   BookMark := Cds.GetBookmark;

   Cds.Filtered := False;
   Cds.Filter := 'CPF = ' + Cpf + ' AND NOT MATRICULA = ' + Matricula;
   Cds.Filtered := True;

   Matriculas := '';
   While Not Cds.Eof Do
      Begin
         Matriculas := Matriculas + '/' + Cds.FieldByName('MATRICULA').AsString;
         Cds.Next;
      End;

   Result := Copy(Matriculas, 2, Length(Matriculas) - 1);

   Cds.Filtered := False;
   Cds.GotoBookmark(BookMark);
   Cds.FreeBookmark(BookMark);
End;

Procedure TfrmRelDivergeFolhaXComprov.PreparaListaDeCPFSFormatados;
Begin
   ListaDeCPFSFormatados := '';
   cdsCPFsSelecionados.disableControls;
   cdsCPFsSelecionados.First;
   While Not cdsCPFsSelecionados.EOF Do
      Begin
         ListaDeCPFSFormatados := ListaDeCPFSFormatados + QuotedStr(cdsCPFsSelecionados.fieldbyname('CPF').asString) + ',';

         cdsCPFsSelecionados.Next;
      End;
   cdsCPFsSelecionados.enableControls;
   ListaDeCPFSFormatados := Copy(ListaDeCPFSFormatados, 1, Length(ListaDeCPFSFormatados) - 1);
End;

Procedure TfrmRelDivergeFolhaXComprov.processaDivergencias(Ano: String);
Var
   valorFolha, valorComprovante, vlrDivergencia: Double;
   numCPF, SegundaMatricula, CodInforme, Cpf, Grupo, OrdemIMP: String;
   x: Integer;
   Inserir: Boolean;
Begin
   CdsDivergencias.Data := CtrlRelDivergeFolhaXComprov.Listar_Folha_Comprovante('-1');
   CdsDivergencias.EmptyDataSet;

   Cpf := '';
   Grupo := '';
   OrdemIMP := '';

   CdsCPF.First;
   While Not CdsCPF.Eof Do
      Begin
         If Cpf <> CdsCPF.FieldByName('CPF').AsString Then
            Begin
               CdsGeral.Data := CtrlRelDivergeFolhaXComprov.Listar_Folha_Comprovante(CdsCPF.FieldByName('CPF').AsString);

               Cpf := '';
               Grupo := '';
               OrdemIMP := '';

               CdsGeral.First;
               While Not CdsGeral.Eof Do
                  Begin
                     If OrdemIMP <> CdsGeral.FieldByName('ORDEMIMP').AsString Then
                        Begin
                           OrdemIMP := CdsGeral.FieldByName('ORDEMIMP').AsString;
                           x := 0;

                           valorFolha := CdsGeral.FieldByName('rTOTAL_RUBRICA').AsFloat;
                           valorComprovante := CdsGeral.FieldByName('rVALOR_COMPROVANTE').AsFloat;
                           vlrDivergencia := valorDivergencia(valorFolha, valorComprovante);

                           If vlrDivergencia <> 0 Then
                              Begin
                                 Inserir := True;
                              End
                           Else
                              Begin
                                 Inserir := False;
                              End;
                        End;

                     If Inserir Then
                        Begin
                           CdsCabec.Data := CtrlRelDivergeFolhaXComprov.Listar_Cabecalho(Ano, CdsCPF.FieldByName('CPF').AsString);
                           SegundaMatricula := verificaExisteOutraMatricula(CdsCabec.FieldByName('MATRICULA').AsString, CdsCabec.FieldByName('CPF').AsString, CdsCabec);

                           Case x Of
                              0: InserirDivergencia(x, valorFolha, valorComprovante, vlrDivergencia, SegundaMatricula, True);
                              1: Begin
                                    If verificaTipoImpressao(CdsGeral.FieldByName('VALOR_COMPROVANTE').AsFloat) Then
                                       Begin
                                          InserirDivergencia(x, 0, 0, 0, SegundaMatricula, True);
                                       End;
                                    Grupo := CdsGeral.FieldByName('GRUPO').AsString;
                                    CdsGeral.Next;
                                 End;
                           Else
                              Begin
                                 If (Grupo <> CdsGeral.FieldByName('GRUPO').AsString) And (verificaTipoImpressao(CdsGeral.FieldByName('VALOR_COMPROVANTE').AsFloat)) Then Begin
                                       InserirDivergencia(x, 0, 0, 0, SegundaMatricula, True);
                                    End
                                 Else
                                    Begin
                                       If verificaTipoImpressao(CdsGeral.FieldByName('VALOR_COMPROVANTE').AsFloat) Then
                                          Begin
                                             InserirDivergencia(x, 0, 0, 0, SegundaMatricula, False);
                                          End;
                                    End;
                                 Grupo := CdsGeral.FieldByName('GRUPO').AsString;
                                 CdsGeral.Next;
                              End;
                           End;

                           Inc(x);
                        End
                     Else
                        Begin
                           Grupo := CdsGeral.FieldByName('GRUPO').AsString;
                           CdsGeral.Next;
                        End;
                  End;
            End;

         Cpf := CdsCPF.FieldByName('CPF').AsString;
         CdsCPF.Next
      End;

End;

Function TfrmRelDivergeFolhaXComprov.valorDivergencia(vlrFolha, vlrComprovante: Double): Double;
Var
   vlrDiferenca: Double;
Begin
   If CtrlFuncoesRH.Truncar(vlrFolha, 2) = CtrlFuncoesRH.Truncar(vlrComprovante, 2) Then Begin
         vlrDiferenca := 0;
      End
   Else Begin
         If vlrFolha >= vlrComprovante Then Begin
               If vlrComprovante < 0 Then Begin
                     If vlrFolha < 0 Then Begin
                           vlrDiferenca := (vlrComprovante) - (vlrFolha);
                        End
                     Else Begin
                           vlrDiferenca := (vlrComprovante) - (vlrFolha);
                        End;
                  End
               Else Begin
                     vlrDiferenca := (vlrFolha) - (vlrComprovante);
                  End;
            End
         Else Begin
               If vlrFolha < 0 Then Begin
                     If vlrComprovante < 0 Then Begin
                           vlrDiferenca := (vlrFolha) - (vlrComprovante);
                        End
                     Else Begin
                           vlrDiferenca := (vlrFolha) - (vlrComprovante)
                        End;
                  End
               Else Begin
                     vlrDiferenca := (vlrComprovante) - (vlrFolha);
                  End;
            End;
      End;
   Result := vlrDiferenca;
End;

Procedure TfrmRelDivergeFolhaXComprov.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlFuncoesRH);
End;

Function TfrmRelDivergeFolhaXComprov.verificaTipoImpressao(vlrComprovante: Double): Boolean;
Begin
   If ckbSintetico.Checked Then
      Begin
         If CtrlFuncoesRH.Truncar(vlrComprovante, 2) = 0 Then
            Result := False
         Else
            Result := True;
      End
   Else
      Result := True;
End;

Procedure TfrmRelDivergeFolhaXComprov.rptRelDivergeFolhaXCompStartPage(Sender: TObject);
Begin
   cCorZebra := $00E3E3E3; // Paulo em 23/05/2013
   shpDetalhe.Brush.Color := clWhite;
End;

Procedure TfrmRelDivergeFolhaXComprov.shpDetalhePrint(Sender: TObject);
Begin
   If cCorZebra = ClWhite Then // Paulo em 23/05/2013
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
End;

Procedure TfrmRelDivergeFolhaXComprov.dbgCPFSelCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := CorDaZebra
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmRelDivergeFolhaXComprov.cdsCPFsSelecionadosAfterScroll(DataSet: TDataSet);
Begin
   meQtd.Caption := Format('Registro %.2d de %.2d', [cdsCPFsSelecionados.RecNo, cdsCPFsSelecionados.RecordCount]);
End;

End.

