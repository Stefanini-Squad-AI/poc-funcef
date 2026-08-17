//******************************************************************************
// N. Chamado....: WO34233
// Dt Alteração..: 18/03/2026
// Responsável...: Paulo Nobre
// Descrição.....: PROJETO CNPJ ALFANUMÉRICO
//                 .Ajustando o padrão da mascara atual do CNPJ para
//                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'. 
//******************************************************************************
//Rotina             : btnCon1Click()
//N. SIG..........   : 131866
//Data da Alteração: : 25/05/2023
//Responsável:       : Marcos Lima
//Descrição.......   : Ajuste na comparação de CPF
//***************************************************************************************
//Rotina             : btnCon1Click
//N. SIG..........   : 121825 
//Data da Alteração: : 22/11/2021
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Correção na geração de DJE, não permitindo que o CPF/CNPJ
//                     do crédito seja diferente do CPF/CNPJ do detalhes.
//******************************************************************************
//Rotina                : sbtnInserirClick, btnInc1Click
//N. Sol..........      : 256772
//N. PPM..........      : 964770
//Data da Alteração:    : 01/06/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Incluir o default 'S' p/ o campo FLGMARCADO
//***************************************************************************************
//Rotina                : AjustaCamposGerarDCTF
//N. Sol..........      : 250991
//N. PPM..........      :
//Data da Alteração:    : 17/03/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Forçar a inclusão de pelo menos um detalhamento quando forem os
//                        tributos "4574" e "7987".
//***************************************************************************************
//Rotina            : sbtnInserirClick, sbtnAlterarClick
//N. SOL.........   : 249454
//N. PPM.........   : 703267
//Data da Alteração : 26/02/2015
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : Liberar a edição e alterar o foco do campo CPF/CNPJ
//*******************************************************************************************************
//Rotina            : MontaSelect
//N. SOL.........   : 241634
//N. PPM.........   : 556541
//Data da Alteração : 17/10/2014
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : Acerto no SQL que monta as DJE´s, pois faltou o JOIN pelo campo IDPROCJUD entre as
//                    tabelas LANCIRRF e PROCJUD
//*******************************************************************************************************
//Rotina            : MontaSelect e Interface
//N. SOL.........   : 238778
//N. PPM.........   : 512818
//Data da Alteração : 04/09/2014
//Alteração Form    : FCadDCTF_DJE
//Responsável       : Paulo Nobre
//Descrição         : Inclusão na tela do campo, já existente, CODVARA
//                  : Alterar o MontaSelect MSFunc para selecionar somente da tabela PESSOA
//*******************************************************************************************************
//Rotina             :
//N. Sol..........   : 230353
//N. Kintana......   : 352271
//Data da Alteração: : 14/04/2014
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Associação do campo de banco NUMEROPROCESSO ao campo: Nº do Processo CEF:
//*****************************************************************************************************
//N. Sol..........: 126088_1342
//N. Kintana......: 784469
//Data............: 24/04/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Detalhamento das DJE´S
//****************************************************************************************************

// Não existe um documento fisico legal chamado DJE, este será materializada dentro da tabela DARF
// com informações específicas.

// Modelo implementado com a condição de ON DELETE CASCADE na FK, ou seja, ao matar o registro PAI (DCTF),
// todos as tabelas dependentes serão apagadas pelo banco
Unit FCadDCTF_DJE;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Wwdbigrd,
  Grids, Wwdbgrid, TB97Ctls, ImgList, TREdit, Db, Wwdatsrc, DBTables,
  Wwquery, MontaSelect, Mask, wwdbedit, uCmControlObject, uCmSqlParams,
  DBClient, uCMClientDataSet, DBCtrls, uSistema, uCtrlGeraDCTF_Novo,
  CMProcura, wwdbdatetimepicker, CMDateTimePicker, QExport3Dialog,
  Wwdotdot, Wwdbcomb, wwdblook;

Type
  TfrmCadDCTF_DJE = Class(TForm)
    Panel1: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    pnlDetDARF: TPanel;
    dbgDJEDet: TwwDBGrid;
    dsDJEDet: TwwDataSource;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    pnlDadosDJEDet: TPanel;
    Dock973: TDock97;
    tb97Detalhe: TToolbar97;
    btnCon1: TBitBtn;
    btnCan1: TBitBtn;
    ImageList1: TImageList;
    Dock974: TDock97;
    Toolbar974: TToolbar97;
    btnInc1: TToolbarButton97;
    btnAlt1: TToolbarButton97;
    btnExc1: TToolbarButton97;
    lblTitDet: TLabel;
    edtValorSuspenso: TDBRealEdit;
    Label10: TLabel;
    MSFunc: TMontaSelect;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Image2: TImage;
    Label18: TLabel;
    pnlDJE: TPanel;
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
    dbeNumDoc: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    dbeRefer: TwwDBEdit;
    dtDtIniApuracao: TCMDateTimePicker;
    Panel3: TPanel;
    Label14: TLabel;
    dbeDtVencto: TCMDateTimePicker;
    dtDtFimApuracao: TCMDateTimePicker;
    qryAux: TwwQuery;
    qryCRDJE: TwwQuery;
    dsCRDJE: TwwDataSource;
    qryCRDJEIDDCTF: TFloatField;
    qryCRDJEIDDARF: TFloatField;
    qryCRDJECODNATUREZA: TStringField;
    qryCRDJENUMDOCUMENTO: TStringField;
    qryCRDJEREFERENCIA: TStringField;
    qryCRDJEPROCESSO: TStringField;
    qryCRDJEDATAVENCDARF: TDateTimeField;
    qryCRDJEVLRIRRF: TFloatField;
    qryCRDJEVLRMULTA: TFloatField;
    qryCRDJEVLRJUROS: TFloatField;
    qryCRDJEVLRTOTAL: TFloatField;
    qryDJEDet: TwwQuery;
    meQtd: TStaticText;
    qryCRDJEFLGMARCADO: TStringField;
    qeDJEDet: TQExport3Dialog;
    qryCRDJEDATAINICIOAPURACAO: TDateTimeField;
    qryCRDJEDATAFIMAPURACAO: TDateTimeField;
    updDJEDet: TUpdateSQL;
    spbExportar: TSpeedButton;
    dbeProcesso: TwwDBEdit;
    dbeNomeVara: TwwDBEdit;
    lblCidOrig: TLabel;
    ProcuraMunicipio: TCMProcura;
    Label3: TLabel;
    Label19: TLabel;
    MSCidade: TMontaSelect;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    Label21: TLabel;
    Panel2: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBCheckBox1: TDBCheckBox;
    qryCRDJEIDLANCIRRF: TFloatField;
    qryDJEDetIDDCTF: TFloatField;
    qryDJEDetIDDARF: TFloatField;
    qryDJEDetIDLANCIRRF: TFloatField;
    qryDJEDetIDPESSOA: TFloatField;
    qryDJEDetNUMDOCUMENTO: TStringField;
    qryDJEDetNOME: TStringField;
    qryDJEDetNUMEROPROCESSO: TStringField;
    qryDJEDetCODVARA: TStringField;
    qryDJEDetNOMEVARA: TStringField;
    qryDJEDetUFVARA: TStringField;
    qryDJEDetIDMUNICIPIO: TFloatField;
    qryDJEDetFLGFAZDEPOSITO: TFloatField;
    qryDJEDetFLGMARCADO: TStringField;
    qryCRDJEIDDCTFCRDETALHE_DARF: TFloatField;
    qryCRDJECODNATURASSOCIADA: TStringField;
    qryDJEDetIDDCTFCRDETALHE_DARF: TFloatField;
    qryDJEDetIDDARFDETALHE: TFloatField;
    qryDJEDetVLRIRRF: TFloatField;
    qryDJEDetFLGREGEXCLUIDO: TStringField;
    qryLkpMotivoSusp: TwwQuery;
    dsLkpMotivoSusp: TwwDataSource;
    qryLkpMotivoSuspIDMOTIVOSUSPENSAO: TFloatField;
    qryLkpMotivoSuspDSCMOTIVOSUSPENSAO: TStringField;
    dblkpMotSusp: TwwDBLookupCombo;
    qryDJEDetIDMOTIVOSUSPENSAO: TFloatField;
    qryDJEDetNUMEROPROCJUDICIAL: TStringField;
    DBText1: TDBText;
    Label24: TLabel;
    wwDBEdit2: TwwDBEdit;
    qryCRDJETIPODOCTO: TStringField;
    qryLkpTributos: TwwQuery;
    qryLkpTributosCODNATUREZA: TStringField;
    qryLkpTributosDESCRICAO: TStringField;
    dsLkpTributos: TwwDataSource;
    Panel4: TPanel;
    Label25: TLabel;
    dblkpTributos: TwwDBLookupCombo;
    CmpFunc: TGroupBox;
    CMPessoa: TCMProcura;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    CmpFavorec: TGroupBox;
    Label11: TLabel;
    CMFavorec: TCMProcura;
    dbeCNPJ: TDBEdit;
    MSFavorec: TMontaSelect;
    dbeCodvara: TwwDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    Procedure bbtnSairClick(Sender: TObject);
    Procedure dbgDJEDetCalcCellColors(Sender: TObject;
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
    Procedure qryDJEDetAfterScroll(DataSet: TDataSet);
    Procedure CMPessoaValidaDados(Sender: TObject);
    Procedure spbExportarClick(Sender: TObject);
    Procedure dbgDJEDetDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure ProcuraMunicipioValidaDados(Sender: TObject);
    Procedure CMFavorecValidaDados(Sender: TObject);
  Private
    { Private declarations }
  Public
    bModificou: Boolean;
    { Public declarations }
    Procedure CarregaMovDJE(Const pIdDCTF, pIdDARFDet: Integer; pCodNatureza, pCNPJ: String; pDtIniApu, pDtFimApu: TDateTime; pPermiteMan: Boolean);
  End;

Var
  frmCadDCTF_DJE: TfrmCadDCTF_DJE;
  sNumDocto, sCodNatureza: String;
  iIdDCTF, iIdDARFDet: Integer;
  dDtIniApu, dDtFimApu, dDtVenApu: TDateTime;
  bPermiteMan: Boolean;

Implementation

Uses DBaseDados, uCtrlFuncoesRH, UMensErro, FGeraDCTF_Novo;

{$R *.DFM}

Procedure TfrmCadDCTF_DJE.FormShow(Sender: TObject);
Begin
  pnlDJE.enabled := False;
  dbgDJEDet.enabled := True;
  pnlDadosDJEDet.enabled := False;

  sbtnInserir.enabled := (bPermiteMan);
  sbtnAlterar.enabled := (bPermiteMan);
  sbtnApagar.enabled := (bPermiteMan);
  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled := False;

  btnInc1.enabled := ((Not qryCRDJE.isEmpty) And (bPermiteMan));
  btnAlt1.enabled := ((Not qryCRDJE.isEmpty) And (bPermiteMan));
  btnExc1.enabled := ((Not qryCRDJE.isEmpty) And (bPermiteMan));
  spbExportar.enabled := ((Not qryCRDJE.isEmpty) And (bPermiteMan));

  btnCon1.Enabled := False;
  btnCan1.Enabled := False;
End;

Procedure TfrmCadDCTF_DJE.CarregaMovDJE(Const pIdDCTF, pIdDARFDet: Integer; pCodNatureza, pCNPJ: String; pDtIniApu, pDtFimApu: TDateTime; pPermiteMan: Boolean);
Begin
  bModificou := False;
  Cursor := crSQLWait;
  qryCRDJE.Close;
  qryCRDJE.ParamByName('p1').asInteger := pIdDCTF;
  qryCRDJE.ParamByName('p2').asInteger := pIdDARFDet;
  qryCRDJE.Open;
  If Not qryCRDJE.EOF Then
    Begin
      iIdDCTF := qryCRDJE.FieldByName('IDDCTF').AsInteger;
      sNumDocto := qryCRDJE.FieldByName('NUMDOCUMENTO').AsString;
      sCodNatureza := qryCRDJE.FieldByName('CODNATUREZA').AsString;
      dDtIniApu := qryCRDJE.FieldByName('DATAINICIOAPURACAO').AsDateTime;
      dDtFimApu := qryCRDJE.FieldByName('DATAFIMAPURACAO').AsDateTime;
      dDtVenApu := qryCRDJE.FieldByName('DATAVENCDARF').AsDateTime;
    End
  Else
    Begin
      iIdDCTF := pIdDCTF;
      sNumDocto := pCNPJ;
      sCodNatureza := pCodNatureza;
      dDtIniApu := pDtIniApu;
      dDtFimApu := pDtFimApu;
      dDtVenApu := pDtFimApu;
    End;

  qryLkpMotivoSusp.Close;
  qryLkpMotivoSusp.Open;
  qryLkpTributos.Close;
  qryLkpTributos.Open;
  qryDJEDet.Close;
  qryDJEDet.Open;
  Cursor := crDefault;

  // Se for <> destes tributos, usar o numdocumento como sendo o CPF, caso contrário usar o CNPJ da FUNCEF
  If (sCodNatureza <> '4574') And (sCodNatureza <> '7987') Then
    Begin
      CmpFavorec.visible := False;
      CmpFunc.Visible := True;
      qryCRDJENUMDOCUMENTO.EditMask := '999.999.999\-99;0;_';
      qryDJEDetNUMDOCUMENTO.EditMask := '999.999.999\-99;0;_';
    End
  Else
    Begin
      CmpFunc.Visible := False;
      CmpFavorec.visible := True;
      qryCRDJENUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0;_';    // Paulo Nobre - WO34233
      qryDJEDetNUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0;_';   // Paulo Nobre - WO34233
    End;

  bPermiteMan := pPermiteMan;
End;

Procedure TfrmCadDCTF_DJE.bbtnSairClick(Sender: TObject);
Begin
  Close;
End;

Procedure TfrmCadDCTF_DJE.dbgDJEDetCalcCellColors(Sender: TObject;
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

Procedure TfrmCadDCTF_DJE.sbtnInserirClick(Sender: TObject);
Begin
  // SOL 249454 PPM 703267 - Paulo Nobre   26/02/2015
  sbtnInserir.Down := True;
  If qryCRDJE.State <> dsInsert Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        sbtnAlterar.enabled := False;
        sbtnApagar.enabled := False;
        bbtnConfirmar.enabled := True;
        bbtnCancelar.enabled := True;
        pnlDJE.enabled := True;
        pnlDetDARF.enabled := False;

        qryCRDJE.Insert;
        qryCRDJE.FieldByName('TIPODOCTO').AsString := 'DJE';
        qryCRDJE.FieldByName('NUMDOCUMENTO').AsString := sNumDocto;
        qryCRDJE.FieldByName('CODNATUREZA').AsString := sCodNatureza;
        qryCRDJE.FieldByName('DATAINICIOAPURACAO').AsDateTime := dDtIniApu;
        qryCRDJE.FieldByName('DATAFIMAPURACAO').AsDateTime := dDtFimApu;
        qryCRDJE.FieldByName('DATAVENCDARF').AsDateTime := dDtVenApu;
        // SOL 256772 PPM 964770 - Paulo Nobre - 01/06/2015
        qryCRDJE.fieldByname('FLGMARCADO').asString := 'S';

        dbeNumDoc.setfocus;
      Except
        bbtnCancelarClick(Self);
        Raise;
      End;
    End
  Else
    sbtnAlterar.Down := False;
End;

Procedure TfrmCadDCTF_DJE.bbtnCancelarClick(Sender: TObject);
Begin
  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryCRDJE.state In [dsEdit, dsInsert] Then
          qryCRDJE.Cancel;

        dtmBaseDados.dbBaseDados.RollBack;
        bModificou := False;
      End;

    sbtnInserir.Down := False;
    sbtnInserir.enabled := True;
    sbtnAlterar.Down := False;
    sbtnAlterar.enabled := True;
    sbtnApagar.Down := False;
    sbtnApagar.enabled := True;
    pnlDJE.enabled := False;
    pnlDetDARF.enabled := True;
    bbtnConfirmar.enabled := False;
    bbtnCancelar.enabled := False;
    btnInc1.enabled := (Not qryCRDJE.isEmpty);
    btnAlt1.enabled := (Not qryCRDJE.isEmpty);
    btnExc1.enabled := (Not qryCRDJE.isEmpty);
    spbExportar.enabled := (Not qryCRDJE.isEmpty);
  Except
    Raise;
  End;
End;

Procedure TfrmCadDCTF_DJE.bbtnConfirmarClick(Sender: TObject);
Begin
  If frmGeraDCTF_Novo.oDCTF.TiraMascara(dbeNumDoc.Text) = '' Then
    Begin
      Application.MessageBox('CPF/CNPJ não Informado !', 'Atenção !', Mb_IconExclamation);
      dbeNumDoc.setfocus;
      Exit;
    End;

  If dblkpTributos.Text = '' Then
    Begin
      Application.MessageBox('Tributo Associado não Informado !', 'Atenção !', Mb_IconExclamation);
      dblkpTributos.setfocus;
      Exit;
    End;

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
        If qryCRDJE.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            Try
              If qryCRDJE.State = dsInsert Then
                Begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SEQDCTF_CREDITODETALHE_DARF.NEXTVAL SEQ FROM DUAL    ');
                  qryAux.Open;

                  qryCRDJE.fieldByname('IDDCTF').asInteger := iIdDCTF;
                  qryCRDJE.fieldByname('IDDCTFCRDETALHE_DARF').asInteger := qryAux.fieldByname('SEQ').asInteger;
                End;

              qryCRDJE.Post;

              If dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.Commit;

              Screen.Cursor := crDefault;

              bModificou := True;

              If (sCodNatureza = '4574') Or (sCodNatureza = '7987') Then
                Begin
                  If (Not qryCRDJE.isEmpty) And (qryDJEDet.isEmpty) Then
                    Application.MessageBox('Os Tributos "4574" e "7987", obrigam a inclusão de pelo menos um Detalhamento. Verifique !', 'Atenção !', Mb_IconExclamation)
                End;

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

Procedure TfrmCadDCTF_DJE.sbtnApagarClick(Sender: TObject);
Begin
  If Not qryCRDJE.isEmpty Then
    Begin
      Try
        If MsgDlg('Confirma Exclusão desta DJE ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
          Begin
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryCRDJE.Delete;

            dtmBaseDados.dbBaseDados.Commit;
            Screen.Cursor := crDefault;

            bModificou := True;

            bbtnCancelarClick(Self);
          End;
        sbtnApagar.Down := False;
      Except
        bbtnCancelarClick(Self);
        Raise;
      End;
    End;
End;

Procedure TfrmCadDCTF_DJE.sbtnAlterarClick(Sender: TObject);
Begin
  // SOL 249454 PPM 703267 - Paulo Nobre  26/02/2015
  If Not qryCRDJE.isEmpty Then
    Begin
      sbtnAlterar.Down := True;
      If qryCRDJE.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDJE.enabled := True;
            pnlDetDARF.enabled := False;

            qryCRDJE.Edit;
            dbeNumDoc.setfocus;
          Except
            bbtnCancelarClick(Self);
            Raise;
          End;
        End
      Else
        sbtnAlterar.Down := False;
    End;
End;

Procedure TfrmCadDCTF_DJE.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
  If (qryCRDJE.State In [dsEdit, dsInsert]) Then
    Begin
      If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          qryCRDJE.Cancel;
          qryDJEDet.Cancel;

          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;

          qryCRDJE.Close;
          qryDJEDet.Close;
          qryLkpMotivoSusp.Close;
          qryLkpTributos.Close;
          CanClose := True;
        End
      Else
        CanClose := False;
    End
  Else
    Begin
      // SOL 250991  - Paulo Nobre - 17/02/2015
      If (sCodNatureza = '4574') Or (sCodNatureza = '7987') Then
        Begin
          If (Not qryCRDJE.isEmpty) And (qryDJEDet.isEmpty) Then
            Begin
              Application.MessageBox('Os Tributos "4574" e "7987", obrigam a inclusão de pelo menos um Detalhamento. Verifique !', 'Atenção !', Mb_IconExclamation);
              CanClose := False;
            End
        End
      Else
        Begin
          qryCRDJE.Close;
          qryDJEDet.Close;
          qryLkpMotivoSusp.Close;
          qryLkpTributos.Close;
          CanClose := True;
        End;
    End;
End;

Procedure TfrmCadDCTF_DJE.dbeVlrPrincipalChange(Sender: TObject);
Begin
  dbeVlrTotalDARF.value := dbeVlrPrincipal.value + dbeVlrJuros.value + dbeVlrMulta.value;
End;

Procedure TfrmCadDCTF_DJE.dbeVlrMultaChange(Sender: TObject);
Begin
  dbeVlrTotalDARF.value := dbeVlrPrincipal.value + dbeVlrJuros.value + dbeVlrMulta.value;
End;

Procedure TfrmCadDCTF_DJE.dbeVlrJurosChange(Sender: TObject);
Begin
  dbeVlrTotalDARF.value := dbeVlrPrincipal.value + dbeVlrJuros.value + dbeVlrMulta.value;
End;

Procedure TfrmCadDCTF_DJE.btnInc1Click(Sender: TObject);
Begin
  btnInc1.down := True;
  qryDJEDet.CachedUpdates := True;
  If qryDJEDet.State <> dsInsert Then
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
        pnlDJE.enabled := False;
        dbgDJEDet.enabled := False;
        pnlDadosDJEDet.enabled := True;
        btnAlt1.enabled := False;
        btnExc1.enabled := False;
        spbExportar.enabled := False;
        btnCon1.Enabled := True;
        btnCan1.Enabled := True;

        qryDJEDet.Insert;
        // Quando for estes tributos, usar o numdocumento como sendo o CNPJ da FUNCEF
        If (sCodNatureza = '4574') Or (sCodNatureza = '7987') Then
          Begin
            qryDJEDet.FieldByName('IDPESSOA').AsInteger := 1; // Sempre FUNCEF
            qryDJEDet.fieldByname('NUMDOCUMENTO').asString := qryCRDJE.FieldByName('NUMDOCUMENTO').asString;
          End;

        qryDJEDet.FieldByName('VLRIRRF').AsFloat := qryCRDJE.FieldByName('VLRIRRF').AsFloat;
        // SOL 256772 PPM 964770 - Paulo Nobre - 01/06/2015
        qryDJEDet.fieldByname('FLGMARCADO').asString := 'S';

        dbeProcesso.setfocus;
      Except
        btnCan1Click(Self);
        Raise;
      End;
    End
  Else
    Begin
      btnInc1.Down := False;
      qryDJEDet.CachedUpdates := False;
    End;
End;

Procedure TfrmCadDCTF_DJE.btnCan1Click(Sender: TObject);
Begin
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryDJEDet.state In [dsEdit, dsInsert] Then
        qryDJEDet.CancelUpdates;
      dtmBaseDados.dbBaseDados.RollBack;

      bModificou := False;

      qryDJEDet.Close;
      qryDJEDet.Open;
    End;

  qryDJEDet.CachedUpdates := False;

  sbtnInserir.enabled := True;
  sbtnApagar.enabled := True;
  sbtnAlterar.enabled := True;
  bbtnConfirmar.enabled := False;
  bbtnCancelar.enabled := False;
  pnlDJE.enabled := False;
  dbgDJEDet.enabled := True;
  pnlDadosDJEDet.enabled := False;
  btnInc1.enabled := True;
  btnAlt1.enabled := True;
  btnExc1.enabled := True;
  spbExportar.enabled := True;
  btnCon1.enabled := False;
  btnCan1.enabled := False;
  btnInc1.down := False;
  btnAlt1.down := False;
  btnExc1.down := False;
End;

Procedure TfrmCadDCTF_DJE.btnCon1Click(Sender: TObject);
Begin
  If (CMPessoa.Text = '') And (CmpFunc.visible) Then
    Begin
      Application.MessageBox('Funcionário não Informado !', 'Atenção !', Mb_IconExclamation);
      CMPessoa.setfocus;
      Exit;
    End;

  If (CMFavorec.Text = '') And (CmpFavorec.visible) Then
    Begin
      Application.MessageBox('Favorecido não Informado !', 'Atenção !', Mb_IconExclamation);
      CMPessoa.setfocus;
      Exit;
    End;

  If edtValorSuspenso.Value > dbeVlrTotalDARF.Value Then
    Begin
      Application.MessageBox('Valor Suspenso não pode ser MAIOR que o Valor Total da DJE !', 'Atenção !', Mb_IconExclamation);
      edtValorSuspenso.setfocus;
      Exit;
    End;

  If edtValorSuspenso.Value = 0 Then
    Begin
      Application.MessageBox('Valor Suspenso não Informado !', 'Atenção !', Mb_IconExclamation);
      edtValorSuspenso.setfocus;
      Exit;
    End;

  //Cássio Rovaroto - SIG nº 121825
  if Trim(qryCRDJE.FieldByName('NUMDOCUMENTO').AsString) <> Trim(qryDJEDet.FieldByName('NUMDOCUMENTO').AsString) then //Marcos Lima - SIG131866
  begin
    Application.MessageBox('O CPF/CNPJ do favorecido não pode ser diferente do CPF/CNPJ da guia de DJE !', 'Atenção !', Mb_IconExclamation);
    CMPessoa.SetFocus;
    Exit;
  end;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryDJEDet.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            If qryDJEDet.State = dsInsert Then
              Begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDCTF_DARFDETALHE.NEXTVAL SEQ FROM DUAL    ');
                qryAux.Open;

                qryDJEDet.fieldByname('IDDCTF').asInteger := qryCRDJE.fieldByname('IDDCTF').asInteger; ;
                qryDJEDet.fieldByname('IDDCTFCRDETALHE_DARF').asInteger := qryCRDJE.fieldByname('IDDCTFCRDETALHE_DARF').asInteger;
                qryDJEDet.fieldByname('IDDARFDETALHE').asInteger := qryAux.fieldByname('SEQ').asInteger;
                If (CmpFunc.visible) Then
                  qryDJEDet.fieldByname('NOME').asString := CMPessoa.text;
                If (CmpFavorec.visible) Then
                  qryDJEDet.fieldByname('NOME').asString := CMFavorec.text;
                qryAux.Close;
              End;

            qryDJEDet.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            bModificou := True;

            qryDJEDet.Close;
            qryDJEDet.Open;

            Screen.Cursor := crDefault;

            btnCan1Click(Self);
          End;
      End;
  Except
    btnCan1Click(Self);
    Raise;
  End;
End;

Procedure TfrmCadDCTF_DJE.btnAlt1Click(Sender: TObject);
Begin
  If Not qryDJEDet.isEmpty Then
    Begin
      btnAlt1.down := True;
      qryDJEDet.CachedUpdates := True;
      If qryDJEDet.State <> dsInsert Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;
            pnlDJE.enabled := False;
            dbgDJEDet.enabled := False;
            pnlDadosDJEDet.enabled := True;
            btnInc1.enabled := False;
            btnExc1.enabled := False;
            spbExportar.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            qryDJEDet.Edit;
            dbeProcesso.setfocus;
          Except
            btnCan1Click(Self);
            Raise;
          End;
        End
      Else
        Begin
          btnAlt1.Down := False;
          qryDJEDet.CachedUpdates := False;
        End;
    End;
End;

Procedure TfrmCadDCTF_DJE.btnExc1Click(Sender: TObject);
Begin
  If Not qryDJEDet.isEmpty Then
    Begin
      Try
        If MsgDlg('Confirma Exclusão deste Detalhamento ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
          Begin
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryDJEDet.CachedUpdates := True;
            qryDJEDet.Delete;
            qryDJEDet.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            bModificou := True;

            qryDJEDet.Close;
            qryDJEDet.Open;
            Screen.Cursor := crDefault;

            btnCan1Click(Self);
          End;
      Except
        Raise;
      End;
    End;
End;

Procedure TfrmCadDCTF_DJE.qryDJEDetAfterScroll(DataSet: TDataSet);
Begin
  meQtd.Caption := Format('Registro %.2d de %.2d', [qryDJEDet.RecNo, qryDJEDet.RecordCount]);
End;

Procedure TfrmCadDCTF_DJE.CMPessoaValidaDados(Sender: TObject);
Begin
  If MSFunc.RetornouValor Then
    Begin
      qryDJEDet.fieldByname('NUMDOCUMENTO').asString := MSFunc.ValoresChave[1]; // CPF
      qryDJEDet.fieldByname('NOME').asString := MSFunc.ValoresChave[2]; // Nome
      dbeProcesso.setfocus;
    End;
End;

Procedure TfrmCadDCTF_DJE.spbExportarClick(Sender: TObject);
Begin
  If Not qryDJEDet.isEmpty Then
    Begin
      qeDJEDet.Execute;
      qryDJEDet.first;
    End;
End;

Procedure TfrmCadDCTF_DJE.dbgDJEDetDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDJEDet.isEmpty Then
    Begin
      If qryDJEDet.fieldByname('FLGMARCADO').asString = 'N' Then
        Begin
          dbgDJEDet.Canvas.Font.Style := [fsStrikeout];
          dbgDJEDet.Canvas.Font.Color := clRed;
        End;

      dbgDJEDet.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmCadDCTF_DJE.ProcuraMunicipioValidaDados(Sender: TObject);
Begin
  qryDJEDet.fieldbyname('UFVARA').asString := MSCidade.ValoresChave[1];
  edtValorSuspenso.setfocus;
End;

Procedure TfrmCadDCTF_DJE.CMFavorecValidaDados(Sender: TObject);
Begin
  If MSFavorec.RetornouValor Then
    Begin
      qryDJEDet.fieldByname('NUMDOCUMENTO').asString := MSFavorec.ValoresChave[1]; // CNPJ
      qryDJEDet.fieldByname('NOME').asString := MSFavorec.ValoresChave[2]; // Razão Social
      dbeProcesso.setfocus;
    End;
End;

End.

