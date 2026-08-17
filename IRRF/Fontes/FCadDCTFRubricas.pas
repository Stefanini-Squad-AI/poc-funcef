//--------------------------------------------------------------------------------------------------
//Rotina                : Geral
//N. SIG                : 36178
//Data da Alteração:    : 15/05/2017
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição             : Desenvolvimento da Funcionalidade
//----------------------------------------------------------------------------------------------------
//
Unit FCadDCTFRubricas;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, DBCtrls, CMProcura, Grids, FileCtrl,
  Wwdbigrd, Wwdbgrid, wwSpeedButton, wwDBNavigator, wwclearpanel, TB97Ctls,
  TB97, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, wwDialog,
  Wwlocate, QExport3Dialog, Wwintl, DBTables, Wwquery, ImgList, MontaSelect,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Mask, Wwfltdlg;

Const CorDaZebra = clBtnFace; // $00FDD2D0
Const DirLogBusca = 'C:\Planus\Temp\DCTF\';

Const MSG01 = 'Obrigatório preencher a Rubrica.';
Const MSG02 = 'Confirma Exclusão deste Lançamento ?';
Const MSG03 = 'Sem Movimento para esta Operação !';
Const MSG04 = 'O Lançamento não foi salvo ! Abandona ?';
Const MSG05 = 'Rubrica já cadastrada !';

Type
  TfrmCadDCTFRubricas = Class(TfrmSairAjuda)
    TB97oKCancelar2: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnCon: TBitBtn;
    bbtnCan: TBitBtn;
    MSRubAposentados: TMontaSelect;
    ListaDeImagens: TImageList;
    qryAux: TwwQuery;
    qeDCTFRub: TQExport3Dialog;
    LocalizaLanc: TwwLocateDialog;
    MSRubEmpregados: TMontaSelect;
    pnlDados: TPanel;
    Label10: TLabel;
    spbLocalRubrica: TSpeedButton;
    dbcbAtiva: TDBCheckBox;
    rdgTipoFolha: TDBRadioGroup;
    edDescRubrica: TDBEdit;
    Dock2: TDock97;
    Toolbar9712: TToolbar97;
    sbtnIns: TToolbarButton97;
    sbtnAlt: TToolbarButton97;
    sbtnExc: TToolbarButton97;
    pnlMovRubricas: TPanel;
    Panel19: TPanel;
    spbExportardados: TSpeedButton;
    wwDBNavigator2: TwwDBNavigator;
    wwNavButton5: TwwNavButton;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    dbgDCTFDeb: TwwDBGrid;
    wwIntl_Port: TwwIntl;
    wwDBNavigator2Button: TwwNavButton;
    FiltrarMov: TwwFilterDialog;
    dsDCTFRubricas: TwwDataSource;
    qryDCTFRubricas: TwwQuery;
    qryDCTFRubricasIDDCTFRUBRICAS: TFloatField;
    qryDCTFRubricasDESCTIPOFOLHA: TStringField;
    qryDCTFRubricasCODPROVDESC: TStringField;
    qryDCTFRubricasFLGTIPOFOLHA: TStringField;
    qryDCTFRubricasFLGATIVO: TStringField;
    qryDCTFRubricasDESCPROVDESC: TStringField;
    updDCTFRubricas: TUpdateSQL;
    Procedure FormCreate(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Procedure dbgDCTFDebCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure sbtnInsClick(Sender: TObject);
    Procedure sbtnAltClick(Sender: TObject);
    Procedure sbtnExcClick(Sender: TObject);
    Procedure bbtnConClick(Sender: TObject);
    Procedure bbtnCanClick(Sender: TObject);
    Procedure spbLocalRubricaClick(Sender: TObject);
    Procedure spbExportardadosClick(Sender: TObject);
  Private
    { Private declarations }
    Function _ExisteRubricaCadastrada(sCodRubrica: String): Boolean;
    Function _ValidaCoerenciaTipoFolhaxRubrica(iTipoFolha: Integer; sCodRubrica: String): Boolean;
  Public
    { Public declarations }
  End;

Var
  frmCadDCTFRubricas: TfrmCadDCTFRubricas;

Implementation

Uses DBaseDados, USistema, UDatabase, uModulo;

{$R *.DFM}

Procedure TfrmCadDCTFRubricas.FormCreate(Sender: TObject);
Begin
  Inherited;

  If Not DirectoryExists(DirLogBusca) Then
    ForceDirectories(DirLogBusca);
End;

Procedure TfrmCadDCTFRubricas.FormShow(Sender: TObject);
Begin
  Inherited;
  Screen.Cursor := crSQLWait;
  qryDCTFRubricas.Close;
  qryDCTFRubricas.Open;
  Screen.Cursor := crDefault;

  pnlMovRubricas.Enabled := true;
  pnlDados.Enabled := false;
  bbtnCon.Enabled := false;
  bbtnCan.Enabled := false;
End;

Procedure TfrmCadDCTFRubricas.FormCloseQuery(Sender: TObject;
  Var CanClose: Boolean);
Begin
  Inherited;
  If qryDCTFRubricas.State In [dsEdit, dsInsert] Then
    Begin
      If Application.MessageBox(MSG04, 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES Then
        Begin
          bbtnCanClick(Self);
          qryDCTFRubricas.Close;
          CanClose := True;
        End
      Else
        CanClose := False;
    End
  Else
    Begin
      qryDCTFRubricas.Close;
      CanClose := True;
    End;
End;

Function TfrmCadDCTFRubricas._ExisteRubricaCadastrada(sCodRubrica: String): Boolean;
Begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT CODPROVDESC ');
  qryAux.SQL.add('FROM DCTFRUBRICAS  ');
  qryAux.SQL.add('WHERE CODPROVDESC = ' + quotedstr(sCodRubrica));
  qryAux.Open;
  Result := (Not qryAux.EOF);
End;

Function TfrmCadDCTFRubricas._ValidaCoerenciaTipoFolhaxRubrica(iTipoFolha: Integer; sCodRubrica: String): Boolean;
Begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT CODPROVDESC ');
  If iTipoFolha = 0 Then // Folha de Aposentados
    Begin
      qryAux.SQL.add('FROM PROVDESC ');
    End
  Else // Folha de Empregados
    Begin
      qryAux.SQL.add('FROM RUBRICAXPESS ');
    End;
  qryAux.SQL.add('WHERE CODPROVDESC = ' + quotedstr(sCodRubrica));
  qryAux.Open;
  Result := (Not qryAux.EOF);
End;

Procedure TfrmCadDCTFRubricas.dbgDCTFDebCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  Inherited;
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

Procedure TfrmCadDCTFRubricas.sbtnInsClick(Sender: TObject);
Begin
  Inherited;
  sbtnIns.down := True;
  If qryDCTFRubricas.State <> dsInsert Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        pnlMovRubricas.enabled := False;
        pnlDados.enabled := True;

        sbtnAlt.enabled := False;
        sbtnExc.enabled := False;
        bbtnCon.Enabled := True;
        bbtnCan.Enabled := True;

        qryDCTFRubricas.Insert;
        qryDCTFRubricas.FieldByName('FLGTIPOFOLHA').AsInteger := 0; // Empregados
        qryDCTFRubricas.FieldByName('FLGATIVO').AsString := 'S'; // Sim
      Except
        bbtnCanClick(Self);
        Raise;
      End;
    End;
End;

Procedure TfrmCadDCTFRubricas.sbtnAltClick(Sender: TObject);
Begin
  Inherited;
  If Not qryDCTFRubricas.isEmpty Then
    Begin
      sbtnAlt.down := True;
      If qryDCTFRubricas.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlMovRubricas.enabled := False;
            pnlDados.enabled := True;

            sbtnIns.enabled := False;
            sbtnExc.enabled := False;
            bbtnCon.Enabled := True;
            bbtnCan.Enabled := True;

            qryDCTFRubricas.Edit;
            rdgTipoFolha.Setfocus
          Except
            bbtnCanClick(Self);
            Raise;
          End;
        End;
    End
  Else
    Begin
      sbtnAlt.Down := False;
      Application.MessageBox(MSG03, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TfrmCadDCTFRubricas.sbtnExcClick(Sender: TObject);
Begin
  Inherited;
  If Not qryDCTFRubricas.isEmpty Then
    Begin
      sbtnExc.Down := True;
      If Application.MessageBox(MSG02, 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryDCTFRubricas.Delete;
            qryDCTFRubricas.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            qryDCTFRubricas.Close;
            qryDCTFRubricas.Open;

            Screen.Cursor := crDefault;

            sbtnExc.Down := False;
          Except
            bbtnCanClick(Self);
            Raise;
          End;
        End
      Else
        sbtnExc.Down := False;
    End
  Else
    Application.MessageBox(MSG03, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmCadDCTFRubricas.bbtnConClick(Sender: TObject);
Begin
  Inherited;
  If edDescRubrica.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG01, 'Atenção !', Mb_IconExclamation);
      Exit;
    End;

  If Not _ValidaCoerenciaTipoFolhaxRubrica(rdgTipoFolha.itemindex, qryDCTFRubricas.FieldByName('CODPROVDESC').AsString) Then
    Begin
      Application.MessageBox(pchar(
        'Rubrica: < ' + edDescRubrica.Text + ' > ' + #13 + #13 +
        'não pertence ao grupo do Tipo de Folha: < ' + rdgTipoFolha.Items.Strings[rdgTipoFolha.itemindex] + ' > !'), 'Atenção !', Mb_IconExclamation);
      bbtnCanClick(Self);
      Exit;
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryDCTFRubricas.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            If qryDCTFRubricas.State = dsInsert Then
              Begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDCTFRUBRICAS.NEXTVAL SEQ FROM DUAL ');
                qryAux.Open;

                qryDCTFRubricas.fieldByname('IDDCTFRUBRICAS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                qryAux.Close;
              End;

            qryDCTFRubricas.Post;
            qryDCTFRubricas.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            qryDCTFRubricas.Close;
            qryDCTFRubricas.Open;

            Screen.Cursor := crDefault;

            bbtnCanClick(Self);
          End;
      End;
  Except
    bbtnCanClick(Self);
    Raise;
  End;
End;

Procedure TfrmCadDCTFRubricas.bbtnCanClick(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryDCTFRubricas.state In [dsEdit, dsInsert] Then
        qryDCTFRubricas.CancelUpdates;

      dtmBaseDados.dbBaseDados.RollBack;
    End;

  pnlMovRubricas.enabled := True;
  pnlDados.enabled := False;

  sbtnIns.enabled := True;
  sbtnAlt.enabled := True;
  sbtnExc.enabled := True;
  bbtnCon.Enabled := False;
  bbtnCan.Enabled := False;

  sbtnIns.Down := False;
  sbtnAlt.Down := False;
End;

Procedure TfrmCadDCTFRubricas.spbLocalRubricaClick(Sender: TObject);
Begin
  Inherited;
  If rdgTipoFolha.ItemIndex = 0 Then
    Begin
      If MSRubAposentados.Executar = MrOk Then
        Begin
          If MSRubAposentados.ValoresChave[0] <> EmptyStr Then
            Begin
              Begin
                If Not _ExisteRubricaCadastrada(MSRubAposentados.ValoresChave[0]) Then
                  Begin
                    qryDCTFRubricas.FieldByName('CODPROVDESC').AsString := MSRubAposentados.ValoresChave[0];
                    edDescRubrica.Text := MSRubAposentados.ValoresChave[1]; // DESCRICAO
                  End
                Else
                  Application.MessageBox(MSG05, 'Atenção !', Mb_IconExclamation);
              End;
            End;
        End;
    End
  Else
    Begin
      If MSRubEmpregados.Executar = MrOk Then
        Begin
          If MSRubEmpregados.ValoresChave[0] <> EmptyStr Then
            Begin
              Begin
                If Not _ExisteRubricaCadastrada(MSRubEmpregados.ValoresChave[0]) Then
                  Begin
                    qryDCTFRubricas.FieldByName('CODPROVDESC').AsString := MSRubEmpregados.ValoresChave[0];
                    edDescRubrica.Text := MSRubEmpregados.ValoresChave[1]; // DESCRICAO
                  End
                Else
                  Application.MessageBox(MSG05, 'Atenção !', Mb_IconExclamation);
              End;
            End;
        End;
    End;
End;

Procedure TfrmCadDCTFRubricas.spbExportardadosClick(Sender: TObject);
Begin
  Inherited;
  If Not qryDCTFRubricas.isEmpty Then
    Begin
      qeDCTFRub.FileName := DirLogBusca + 'MOVDCTFRUBRICAS.CSV';
      qeDCTFRub.OptionsFileName := DirLogBusca + 'CFG_DCTFRUBRICAS.CFG';
      qeDCTFRub.Execute;
      qryDCTFRubricas.First;
    End;
End;

End.

