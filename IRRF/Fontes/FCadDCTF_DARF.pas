//******************************************************************************
// N. Chamado....: WO34233
// Dt Alteração..: 18/03/2026
// Responsável...: Paulo Nobre
// Descrição.....: PROJETO CNPJ ALFANUMÉRICO
//                 .Ajustando o padrão da mascara atual do CNPJ para
//                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'. (Form e .dfm)
//******************************************************************************
//Rotina             : bbtnConfirmarClick, btnCon1Click
//N. SIG..........   : 121825 
//Data da Alteração: : 22/11/2021
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Correção na geração de DARFs, inserindo identificador de DARF
//                     às linhas de crédito e detalhe. 
//******************************************************************************
//Rotina                : dbgDARFDetDblClick
//N. Sol..........      : 252107
//N. PPM..........      : 780490
//Data da Alteração:    : 09/04/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertado o problema do refresh na grid quando da exclusão lógica
//                        de um registro do detalhemanto
//***************************************************************************************
//Rotina                : dbgDARFDetDblClick
//N. Sol..........      : 250991
//N. PPM..........      :
//Data da Alteração:    : 17/03/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Colocação da proteção "RegAtual <> Nil" p/ o bookmark não estourar
//*******************************************************************************************************
//Rotina                : MontaSelect
//N. SOL.........       : 241634
//N. PPM.........       : 556541
//Data da Alteração     : 17/10/2014
//Alteração Form        :
//Responsável           : Paulo Nobre
//Descrição             : Acerto no SQL que monta as DARF, pois faltou o JOIN pelo campo IDPROCJUD entre as
//                        tabelas LANCIRRF e PROCJUD
//*******************************************************************************************************
//Rotina             : MontaSelect (MSFunc)
//N. Sol..........   : 230353
//N. Kintana......   : 352271
//Data da Alteração: : 10/04/2014
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acerto p/ inclusão do (+) (LEFT JOIN) no SQL do MontaSelect (MSFunc)
//                     para trazer beneficiários que não sejam só funcionários.
//*******************************************************************************************
//N. Sol..........: 126088_1342
//N. Kintana......: 784469
//Data............: 28/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Detalhamento das DARF´S
//******************************************************************************************
// Modelo implementado com a condição de ON DELETE CASCADE na FK, ou seja, ao matar o registro PAI (DCTF),
// todos as tabelas dependentes serão apagadas pelo banco
//
Unit FCadDCTF_DARF;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Wwdbigrd,
  Grids, Wwdbgrid, TB97Ctls, ImgList, TREdit, Db, Wwdatsrc, DBTables,
  Wwquery, MontaSelect, Mask, wwdbedit, uCmControlObject, uCmSqlParams,
  DBClient, uCMClientDataSet, DBCtrls, uSistema, uCtrlGeraDCTF_Novo,
  CMProcura, wwdbdatetimepicker, CMDateTimePicker, QExport3Dialog,
  CMProcuraSubTipo, Menus, wwDialog, Wwlocate, wwSpeedButton,
  wwDBNavigator, wwclearpanel, Wwintl;

Type
  TfrmCadDCTF_DARF = Class(TForm)
    Panel1: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    pnlDetDARF: TPanel;
    dsDARFDet: TwwDataSource;
    dsTotDARFDet: TwwDataSource;
    StaticText1: TStaticText;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    pnlDadosDARFDet: TPanel;
    ImageList1: TImageList;
    Dock974: TDock97;
    Toolbar974: TToolbar97;
    btnInc1: TToolbarButton97;
    btnAlt1: TToolbarButton97;
    btnExc1: TToolbarButton97;
    lblTitDet: TLabel;
    edtValorIRRF: TDBRealEdit;
    Label10: TLabel;
    MSFunc: TMontaSelect;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Image2: TImage;
    Panel4: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    pnlDARF: TPanel;
    Panel5: TPanel;
    Label13: TLabel;
    Panel6: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    Label4: TLabel;
    Panel8: TPanel;
    Label5: TLabel;
    Panel9: TPanel;
    Label6: TLabel;
    Panel10: TPanel;
    Label7: TLabel;
    dbeVlrPrincipal: TDBRealEdit;
    Panel11: TPanel;
    Label8: TLabel;
    dbeVlrMulta: TDBRealEdit;
    Panel12: TPanel;
    Label9: TLabel;
    dbeVlrJuros: TDBRealEdit;
    Panel13: TPanel;
    Label12: TLabel;
    dbeVlrTotalDARF: TDBRealEdit;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    dbeRefer: TwwDBEdit;
    dtDtIniApuracao: TCMDateTimePicker;
    Panel3: TPanel;
    Label14: TLabel;
    dbeDtVencto: TCMDateTimePicker;
    dtDtFimApuracao: TCMDateTimePicker;
    qryAux: TwwQuery;
    qryCRDARF: TwwQuery;
    dsCRDARF: TwwDataSource;
    qryCRDARFIDDCTF: TFloatField;
    qryCRDARFIDDCTFCRDETALHE_DARF: TFloatField;
    qryCRDARFIDDARF: TFloatField;
    qryCRDARFCODNATUREZA: TStringField;
    qryCRDARFNUMDOCUMENTO: TStringField;
    qryCRDARFREFERENCIA: TStringField;
    qryCRDARFPROCESSO: TStringField;
    qryCRDARFDATAVENCDARF: TDateTimeField;
    qryCRDARFVLRIRRF: TFloatField;
    qryCRDARFVLRMULTA: TFloatField;
    qryCRDARFVLRJUROS: TFloatField;
    qryCRDARFVLRTOTAL: TFloatField;
    qryDARFDet: TwwQuery;
    qryDARFDetIDDCTF: TFloatField;
    qryDARFDetIDDCTFCRDETALHE_DARF: TFloatField;
    qryDARFDetIDDARFDETALHE: TFloatField;
    qryDARFDetIDDARF: TFloatField;
    qryDARFDetIDPESSOA: TFloatField;
    qryDARFDetNUMDOCUMENTO: TStringField;
    qryDARFDetNOME: TStringField;
    qryDARFDetVLRIRRF: TFloatField;
    qryTotDARFDet: TwwQuery;
    qryTotDARFDetVLRIRRFTOTAL: TFloatField;
    qryDARFDetFLGMARCADO: TStringField;
    meQtd: TStaticText;
    imgNAOOK: TImage;
    imgOK: TImage;
    qryCRDARFFLGMARCADO: TStringField;
    dbeVlrTotalDet: TDBRealEdit;
    qeDARFDet: TQExport3Dialog;
    qryCRDARFDATAINICIOAPURACAO: TDateTimeField;
    qryCRDARFDATAFIMAPURACAO: TDateTimeField;
    qryFLGDARFDet: TQuery;
    updDARFDet: TUpdateSQL;
    spbExportar: TSpeedButton;
    qryCRDARFCODNATURASSOCIADA: TStringField;
    DBText1: TDBText;
    qryCRDARFTIPODOCTO: TStringField;
    qryCRDARFIDLANCIRRF: TFloatField;
    CmpFunc: TGroupBox;
    CMPessoa: TCMProcura;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    MSFavorec: TMontaSelect;
    CmpFavorec: TGroupBox;
    CMFavorec: TCMProcura;
    Label3: TLabel;
    dbeCNPJ: TDBEdit;
    Dock973: TDock97;
    tb97Detalhe: TToolbar97;
    btnCon1: TBitBtn;
    btnCan1: TBitBtn;
    dbgDARFDet: TwwDBGrid;
    Label27: TLabel;
    wwDBNavigator4: TwwDBNavigator;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    wwNavButton10: TwwNavButton;
    LocalizaLanc: TwwLocateDialog;
    imgTitulosGrids: TImageList;
    wwIntl_Port: TwwIntl;
    spbMarcarDesmarcarDARF: TSpeedButton;
    Procedure bbtnSairClick(Sender: TObject);
    Procedure spbMarcarDesmarcarDARFClick(Sender: TObject);
    Procedure dbgDARFDetCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    Procedure sbtnInserirClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure sbtnApagarClick(Sender: TObject);
    Procedure sbtnAlterarClick(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Procedure dbeVlrPrincipalChange(Sender: TObject);
    Procedure dbeVlrMultaChange(Sender: TObject);
    Procedure dbeVlrJurosChange(Sender: TObject);
    Procedure btnInc1Click(Sender: TObject);
    Procedure btnCan1Click(Sender: TObject);
    Procedure btnCon1Click(Sender: TObject);
    Procedure btnAlt1Click(Sender: TObject);
    Procedure btnExc1Click(Sender: TObject);
    Procedure qryDARFDetAfterScroll(DataSet: TDataSet);
    Procedure CMPessoaValidaDados(Sender: TObject);
    Procedure spbExportarClick(Sender: TObject);
    Procedure dbgDARFDetDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgDARFDetDblClick(Sender: TObject);
    Procedure CMFavorecValidaDados(Sender: TObject);
  Private
    { Private declarations }
  Public
    bModificou: Boolean;
    { Public declarations }
    Procedure CarregaMovDARF(Const pIdDCTF, pIdDARFDet: Integer; pCodNatureza, pCNPJ: String; pDtIniApu, pDtFimApu: TDateTime; pPermiteMan: Boolean);
  End;

Var
  frmCadDCTF_DARF: TfrmCadDCTF_DARF;
  sCNPJ, sCodNatureza: String;
  iIdDCTF: Integer;
  dDtIniApu, dDtFimApu, dDtVenApu: TDateTime;
  bPermiteMan: Boolean;

Implementation

Uses DBaseDados, uCtrlFuncoesRH, UMensErro, FGeraDCTF_Novo;

{$R *.DFM}

Procedure TfrmCadDCTF_DARF.FormShow(Sender: TObject);
Begin
  pnlDARF.enabled := False;
  dbgDARFDet.enabled := True;
  pnlDadosDARFDet.enabled := False;

  sbtnInserir.enabled := (bPermiteMan);
  sbtnAlterar.enabled := (bPermiteMan);
  sbtnApagar.enabled := (bPermiteMan);
  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled := False;

  btnInc1.enabled := ((Not qryCRDARF.isEmpty) And (bPermiteMan));
  btnAlt1.enabled := ((Not qryCRDARF.isEmpty) And (bPermiteMan));
  btnExc1.enabled := ((Not qryCRDARF.isEmpty) And (bPermiteMan));
  spbExportar.enabled := ((Not qryCRDARF.isEmpty) And (bPermiteMan));
  spbMarcarDesmarcarDARF.enabled := ((Not qryCRDARF.isEmpty) And (bPermiteMan));

  btnCon1.Enabled := False;
  btnCan1.Enabled := False;
End;

Procedure TfrmCadDCTF_DARF.CarregaMovDARF(Const pIdDCTF, pIdDARFDet: Integer; pCodNatureza, pCNPJ: String; pDtIniApu, pDtFimApu: TDateTime; pPermiteMan: Boolean);
Begin
  bModificou := False;
  Cursor := crSQLWait;
  qryCRDARF.Close;
  qryCRDARF.ParamByName('p1').asInteger := pIdDCTF;
  qryCRDARF.ParamByName('p2').asInteger := pIdDARFDet;
  qryCRDARF.Open;
  If Not qryCRDARF.EOF Then
    Begin
      iIdDCTF := qryCRDARF.FieldByName('IDDCTF').AsInteger;
      sCNPJ := qryCRDARF.FieldByName('NUMDOCUMENTO').AsString;
      sCodNatureza := qryCRDARF.FieldByName('CODNATUREZA').AsString;
      dDtIniApu := qryCRDARF.FieldByName('DATAINICIOAPURACAO').AsDateTime;
      dDtFimApu := qryCRDARF.FieldByName('DATAFIMAPURACAO').AsDateTime;
      dDtVenApu := qryCRDARF.FieldByName('DATAVENCDARF').AsDateTime;
    End
  Else
    Begin
      iIdDCTF := pIdDCTF;
      sCNPJ := pCNPJ;
      sCodNatureza := pCodNatureza;
      dDtIniApu := pDtIniApu;
      dDtFimApu := pDtFimApu;
      dDtVenApu := pDtFimApu;
    End;

  qryDARFDet.Close;
  qryDARFDet.Open;
  qryTotDARFDet.Close;
  qryTotDARFDet.Open;
  Cursor := crDefault;

  imgOK.Visible := (qryCRDARF.FieldByName('FLGMARCADO').AsString = 'S');
  imgNAOOK.Visible := (qryCRDARF.FieldByName('FLGMARCADO').AsString = 'N');

  If (sCodNatureza <> '1708') And (sCodNatureza <> '5952') Then
    Begin
      CmpFavorec.visible := False;
      CmpFunc.Visible := True;
      qryDARFDetNUMDOCUMENTO.EditMask := '999.999.999\-99;0;_';
    End
  Else
    Begin
      CmpFunc.Visible := False;
      CmpFavorec.visible := True;
      qryDARFDetNUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0;_';      // Paulo Nobre - WO34233
    End;

  bPermiteMan := pPermiteMan;
End;

Procedure TfrmCadDCTF_DARF.bbtnSairClick(Sender: TObject);
Begin
  Close;
End;

Procedure TfrmCadDCTF_DARF.spbMarcarDesmarcarDARFClick(Sender: TObject);
Begin
  If (Not qryDARFDet.isEmpty) And (bPermiteMan) Then
    Begin
      Cursor := crSQLWait;
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        qryDARFDet.DisableControls;
        qryDARFDet.First;
        While Not qryDARFDet.Eof Do
          Begin
            If qryDARFDet.FieldByName('FLGMARCADO').AsString = 'S' Then
              qryFLGDARFDet.parambyname('pFLGMARCADO').AsString := 'N'
            Else
              qryFLGDARFDet.parambyname('pFLGMARCADO').AsString := 'S';
            qryFLGDARFDet.parambyname('pIDDCTF').AsInteger := qryDARFDet.FieldByName('IDDCTF').AsInteger;
            qryFLGDARFDet.parambyname('pIDDCTFCRDETALHE_DARF').AsInteger := qryDARFDet.FieldByName('IDDCTFCRDETALHE_DARF').AsInteger;
            qryFLGDARFDet.parambyname('pIDDARFDETALHE').AsInteger := qryDARFDet.FieldByName('IDDARFDETALHE').AsInteger;
            qryFLGDARFDet.ExecSQL;

            qryDARFDet.Next;
          End;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;
          End;
      End;

      qryDARFDet.Close;
      qryDARFDet.Open;
      qryTotDARFDet.Close;
      qryTotDARFDet.Open;
      qryDARFDet.EnableControls;
      Cursor := crDefault;
    End;
End;

Procedure TfrmCadDCTF_DARF.dbgDARFDetCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
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

Procedure TfrmCadDCTF_DARF.sbtnInserirClick(Sender: TObject);
Begin
  sbtnInserir.Down := True;
  If qryCRDARF.State <> dsInsert Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        sbtnAlterar.enabled := False;
        sbtnApagar.enabled := False;

        bbtnConfirmar.enabled := True;
        bbtnCancelar.enabled := True;

        pnlDARF.enabled := True;
        pnlDetDARF.enabled := False;

        qryCRDARF.Insert;
        qryCRDARF.FieldByName('TIPODOCTO').AsString := 'DARF';
        qryCRDARF.FieldByName('NUMDOCUMENTO').AsString := sCNPJ;
        qryCRDARF.FieldByName('CODNATUREZA').AsString := sCodNatureza;
        qryCRDARF.FieldByName('DATAINICIOAPURACAO').AsDateTime := dDtIniApu;
        qryCRDARF.FieldByName('DATAFIMAPURACAO').AsDateTime := dDtFimApu;
        qryCRDARF.FieldByName('DATAVENCDARF').AsDateTime := dDtVenApu;
        qryCRDARF.FieldByName('FLGMARCADO').AsString := 'S'; // Sim

        dtDtIniApuracao.setfocus;
      Except
        bbtnCancelarClick(Self);
        Raise;
      End;
    End
  Else
    sbtnAlterar.Down := False;
End;

Procedure TfrmCadDCTF_DARF.bbtnCancelarClick(Sender: TObject);
Begin
  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryCRDARF.state In [dsEdit, dsInsert] Then
          qryCRDARF.Cancel;

        dtmBaseDados.dbBaseDados.RollBack;
        bModificou := False;
      End;

    sbtnInserir.Down := False;
    sbtnInserir.enabled := True;
    sbtnAlterar.Down := False;
    sbtnAlterar.enabled := True;
    sbtnApagar.Down := False;
    sbtnApagar.enabled := True;
    pnlDARF.enabled := False;
    pnlDetDARF.enabled := True;
    bbtnConfirmar.enabled := False;
    bbtnCancelar.enabled := False;
    btnInc1.enabled := (Not qryCRDARF.isEmpty);
    btnAlt1.enabled := (Not qryCRDARF.isEmpty);
    btnExc1.enabled := (Not qryCRDARF.isEmpty);
    spbExportar.enabled := (Not qryCRDARF.isEmpty);
    spbMarcarDesmarcarDARF.enabled := (Not qryCRDARF.isEmpty);
  Except
    Raise;
  End;
End;

Procedure TfrmCadDCTF_DARF.bbtnConfirmarClick(Sender: TObject);
Begin
  If dtDtIniApuracao.Text = '' Then
    Begin
      Application.MessageBox('Data Início da Apuração não Informada !', 'Atenção !', Mb_IconExclamation);
      dtDtIniApuracao.setfocus;
      Exit;
    End;

  If dtDtFimApuracao.Text = '' Then
    Begin
      Application.MessageBox('Data Final da Apuração não Informada !', 'Atenção !', Mb_IconExclamation);
      dtDtFimApuracao.setfocus;
      Exit;
    End;

  If dbeDtVencto.Text = '' Then
    Begin
      Application.MessageBox('Data de Vencimento não Informada !', 'Atenção !', Mb_IconExclamation);
      dbeDtVencto.setfocus;
      Exit;
    End;

  If dbeVlrPrincipal.value = 0 Then
    Begin
      Application.MessageBox('Valor não Informado !', 'Atenção !', Mb_IconExclamation);
      dbeVlrPrincipal.setfocus;
      Exit;
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryCRDARF.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            Try
              If qryCRDARF.State = dsInsert Then
                Begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SEQDCTF_CREDITODETALHE_DARF.NEXTVAL SEQ FROM DUAL');
                  qryAux.Open;

                  qryCRDARF.fieldByname('IDDCTF').asInteger := iIdDCTF;
                  qryCRDARF.fieldByname('IDDCTFCRDETALHE_DARF').asInteger := qryAux.fieldByname('SEQ').asInteger;

                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SEQDARF.NEXTVAL AS IDDARF FROM DUAL');
                  qryAux.Open;

                  qryCRDARF.FieldByName('IDDARF').AsInteger := qryAux.fieldByname('IDDARF').asInteger;
                End;

              qryCRDARF.Post;

              If dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.Commit;

              Screen.Cursor := crDefault;

              bModificou := True;

              bbtnCancelarClick(Self);
            Except
              On E: Exception Do
                Begin
                  Raise
                End;
            End;
          End;
      End
  Except
    bbtnCancelarClick(Self);
    Raise;
  End;
End;

Procedure TfrmCadDCTF_DARF.sbtnApagarClick(Sender: TObject);
Begin
  If Not qryCRDARF.isEmpty Then
    Begin
      If MsgDlg('Confirma Exclusão desta DARF ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryCRDARF.Delete;

            bModificou := True;

            dtmBaseDados.dbBaseDados.Commit;
            Screen.Cursor := crDefault;

            bbtnCancelarClick(Self);

          Except
            bbtnCancelarClick(Self);
            Raise;
          End;
          sbtnApagar.Down := False;
        End;
    End;
End;

Procedure TfrmCadDCTF_DARF.sbtnAlterarClick(Sender: TObject);
Begin
  If Not qryCRDARF.isEmpty Then
    Begin
      sbtnAlterar.Down := True;
      If qryCRDARF.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;

            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            pnlDARF.enabled := True;
            pnlDetDARF.enabled := False;

            qryCRDARF.Edit;
            dtDtIniApuracao.setfocus;
          Except
            bbtnCancelarClick(Self);
            Raise;
          End;
        End
      Else
        sbtnAlterar.Down := False;
    End;
End;

Procedure TfrmCadDCTF_DARF.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
  If (qryCRDARF.State In [dsEdit, dsInsert]) Then
    Begin
      If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          qryCRDARF.Cancel;
          qryDARFDet.Cancel;

          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;

          qryCRDARF.Close;
          qryDARFDet.Close;
          CanClose := True;
        End
      Else
        CanClose := False;
    End
  Else
    Begin
      qryCRDARF.Close;
      qryDARFDet.Close;
      CanClose := True;
    End;
End;

Procedure TfrmCadDCTF_DARF.dbeVlrPrincipalChange(Sender: TObject);
Begin
  dbeVlrTotalDARF.value := dbeVlrPrincipal.value + dbeVlrJuros.value + dbeVlrMulta.value;
End;

Procedure TfrmCadDCTF_DARF.dbeVlrMultaChange(Sender: TObject);
Begin
  dbeVlrTotalDARF.value := dbeVlrPrincipal.value + dbeVlrJuros.value + dbeVlrMulta.value;
End;

Procedure TfrmCadDCTF_DARF.dbeVlrJurosChange(Sender: TObject);
Begin
  dbeVlrTotalDARF.value := dbeVlrPrincipal.value + dbeVlrJuros.value + dbeVlrMulta.value;
End;

Procedure TfrmCadDCTF_DARF.btnInc1Click(Sender: TObject);
Begin
  btnInc1.down := True;
  qryDARFDet.CachedUpdates := True;
  If qryDARFDet.State <> dsInsert Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        sbtnInserir.enabled := False;
        sbtnApagar.enabled := False;
        sbtnAlterar.enabled := False;
        bbtnCancelar.enabled := False;
        bbtnConfirmar.enabled := False;

        bbtnConfirmar.enabled := False;
        bbtnCancelar.enabled := False;

        pnlDARF.enabled := False;
        dbgDARFDet.enabled := False;
        pnlDadosDARFDet.enabled := True;

        btnAlt1.enabled := False;
        btnExc1.enabled := False;
        spbExportar.enabled := False;
        spbMarcarDesmarcarDARF.enabled := False;
        btnCon1.Enabled := True;
        btnCan1.Enabled := True;

        qryDARFDet.Insert;
        qryDARFDet.FieldByName('FLGMARCADO').AsString := 'S'; // Sim

        edtValorIRRF.setfocus;
      Except
        btnCan1Click(Self);
        Raise;
      End;
    End
  Else
    Begin
      btnInc1.Down := False;
      qryDARFDet.CachedUpdates := False;
    End;
End;

Procedure TfrmCadDCTF_DARF.btnCan1Click(Sender: TObject);
Begin
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryDARFDet.state In [dsEdit, dsInsert] Then
        qryDARFDet.CancelUpdates;

      bModificou := False;
      dtmBaseDados.dbBaseDados.RollBack;

      qryDARFDet.Close;
      qryDARFDet.Open;
      qryTotDARFDet.Close;
      qryTotDARFDet.Open;
    End;

  qryDARFDet.CachedUpdates := False;

  sbtnInserir.enabled := True;
  sbtnApagar.enabled := True;
  sbtnAlterar.enabled := True;
  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled := False;

  pnlDARF.enabled := False;
  dbgDARFDet.enabled := True;
  pnlDadosDARFDet.enabled := False;

  btnInc1.enabled := True;
  btnAlt1.enabled := True;
  btnExc1.enabled := True;
  spbExportar.enabled := True;
  spbMarcarDesmarcarDARF.enabled := True;
  btnCon1.enabled := False;
  btnCan1.enabled := False;
  btnInc1.down := False;
  btnAlt1.down := False;
End;

Procedure TfrmCadDCTF_DARF.btnCon1Click(Sender: TObject);
Begin
  If edtValorIRRF.Value > dbeVlrTotalDARF.Value Then
    Begin
      Application.MessageBox('Valor do IRRF não pode ser MAIOR que o Valor Total da DARF !', 'Atenção !', Mb_IconExclamation);
      edtValorIRRF.setfocus;
      Exit;
    End;

  If (CMPessoa.Text = '') And (CmpFunc.visible) Then
    Begin
      Application.MessageBox('Empregado/Beneficiário não Informado !', 'Atenção !', Mb_IconExclamation);
      CMPessoa.setfocus;
      Exit;
    End;

  If (CMFavorec.Text = '') And (CmpFavorec.visible) Then
    Begin
      Application.MessageBox('Favorecido não Informado !', 'Atenção !', Mb_IconExclamation);
      CMFavorec.setfocus;
      Exit;
    End;

  If edtValorIRRF.Value = 0 Then
    Begin
      Application.MessageBox('Valor do IRRF não Informado !', 'Atenção !', Mb_IconExclamation);
      edtValorIRRF.setfocus;
      Exit;
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryDARFDet.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            If qryDARFDet.State = dsInsert Then
              Begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDCTF_DARFDETALHE.NEXTVAL SEQ FROM DUAL    ');
                qryAux.Open;

                qryDARFDet.fieldByname('IDDCTF').asInteger := qryCRDARF.fieldByname('IDDCTF').asInteger;
                qryDARFDet.fieldByname('IDDCTFCRDETALHE_DARF').asInteger := qryCRDARF.fieldByname('IDDCTFCRDETALHE_DARF').asInteger;
                qryDARFDet.fieldByname('IDDARFDETALHE').asInteger := qryAux.fieldByname('SEQ').asInteger;
                qryDARFDet.FieldByName('IDDARF').AsInteger := qryCRDARF.fieldByname('IDDARF').asInteger;
                If (CmpFunc.visible) Then
                  qryDARFDet.fieldByname('NOME').asString := CMPessoa.text;
                If (CmpFavorec.visible) Then
                  qryDARFDet.fieldByname('NOME').asString := CMFavorec.text;
                qryAux.Close;
              End;

            qryDARFDet.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            bModificou := True;

            qryDARFDet.Close;
            qryDARFDet.Open;
            qryTotDARFDet.Close;
            qryTotDARFDet.Open;

            Screen.Cursor := crDefault;

            btnCan1Click(Self);
          End;
      End;
  Except
    btnCan1Click(Self);
    Raise;
  End;
End;

Procedure TfrmCadDCTF_DARF.btnAlt1Click(Sender: TObject);
Begin
  If Not qryDARFDet.isEmpty Then
    Begin
      btnAlt1.down := True;
      qryDARFDet.CachedUpdates := True;
      If qryDARFDet.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            pnlDARF.enabled := False;
            dbgDARFDet.enabled := False;
            pnlDadosDARFDet.enabled := True;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            spbExportar.enabled := False;
            spbMarcarDesmarcarDARF.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            qryDARFDet.Edit;
            edtValorIRRF.setfocus;
          Except
            btnCan1Click(Self);
            Raise;
          End;
        End
      Else
        Begin
          btnAlt1.Down := False;
          qryDARFDet.CachedUpdates := False;
        End;
    End;
End;

Procedure TfrmCadDCTF_DARF.btnExc1Click(Sender: TObject);
Begin
  If Not qryDARFDet.isEmpty Then
    Begin
      If MsgDlg('Confirma Exclusão deste Detalhamento ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryDARFDet.CachedUpdates := True;
            qryDARFDet.Delete;
            qryDARFDet.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            bModificou := True;

            qryDARFDet.Close;
            qryDARFDet.Open;
            qryTotDARFDet.Close;
            qryTotDARFDet.Open;

            Screen.Cursor := crDefault;

            btnCan1Click(Self);
          Except
            Raise;
          End;
        End;
    End;
End;

Procedure TfrmCadDCTF_DARF.qryDARFDetAfterScroll(DataSet: TDataSet);
Begin
  meQtd.Caption := Format('Registro %.2d de %.2d', [qryDARFDet.RecNo, qryDARFDet.RecordCount]);
End;

Procedure TfrmCadDCTF_DARF.CMPessoaValidaDados(Sender: TObject);
Begin
  If MSFunc.ValoresChave[2] <> '' Then
    Begin
      qryDARFDet.fieldByname('NUMDOCUMENTO').asString := MSFunc.ValoresChave[1]; // CPF
      qryDARFDet.fieldByname('NOME').asString := MSFunc.ValoresChave[2]; // Nome
      edtValorIRRF.setfocus;
    End;
End;

Procedure TfrmCadDCTF_DARF.spbExportarClick(Sender: TObject);
Begin
  If Not qryDARFDet.isEmpty Then
    Begin
      qeDARFDet.Execute;
      qryDARFDet.first;
    End;
End;

Procedure TfrmCadDCTF_DARF.dbgDARFDetDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDARFDet.isEmpty Then
    Begin
      If qryDARFDet.fieldByname('FLGMARCADO').asString = 'N' Then
        Begin
          dbgDARFDet.Canvas.Font.Style := [fsStrikeout];
          dbgDARFDet.Canvas.Font.Color := clRed;
        End;

      dbgDARFDet.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmCadDCTF_DARF.dbgDARFDetDblClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  If (Not qryDARFDet.isEmpty) And (bPermiteMan) Then
    Begin
      Screen.Cursor := crSQLWait;
      qryDARFDet.DisableControls;
      qryFLGDARFDet.Close;
      If qryDARFDet.FieldByName('FLGMARCADO').AsString = 'S' Then
        qryFLGDARFDet.parambyname('pFLGMARCADO').AsString := 'N'
      Else
        qryFLGDARFDet.parambyname('pFLGMARCADO').AsString := 'S';
      qryFLGDARFDet.parambyname('pIDDCTF').AsInteger := qryDARFDet.FieldByName('IDDCTF').AsInteger;
      qryFLGDARFDet.parambyname('pIDDCTFCRDETALHE_DARF').AsInteger := qryDARFDet.FieldByName('IDDCTFCRDETALHE_DARF').AsInteger;
      qryFLGDARFDet.parambyname('pIDDARFDETALHE').AsInteger := qryDARFDet.FieldByName('IDDARFDETALHE').AsInteger;
      qryFLGDARFDet.ExecSQL;

      RegAtual := qryDARFDet.GetBookmark; // Salvando o ponteiro do Registro

      // SOL 252107  PPM 780490 - Paulo Nobre - 09/04/2015
      qryDARFDet.Close;
      qryDARFDet.Open;
      qryTotDARFDet.Close;
      qryTotDARFDet.Open;

      // SOL 250991  PPM 999999 - Paulo Nobre - 17/02/2015
      If RegAtual <> Nil Then
        qryDARFDet.GotoBookmark(RegAtual); // Voltando ao Reg. atual

      Screen.Cursor := crDefault;
      qryDARFDet.EnableControls;
    End;
End;

Procedure TfrmCadDCTF_DARF.CMFavorecValidaDados(Sender: TObject);
Begin
  If MSFavorec.ValoresChave[2] <> '' Then
    Begin
      qryDARFDet.fieldByname('NUMDOCUMENTO').asString := MSFavorec.ValoresChave[1]; // CNPJ
      qryDARFDet.fieldByname('NOME').asString := MSFavorec.ValoresChave[2]; // Razão Social
      edtValorIRRF.setfocus;
    End;
End;

End.

