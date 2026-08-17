Unit fCadCertifRetencaoMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, uCtrlParamIntegra, uCtrlCadCertifRetencao, ppPrnabl, ppCtrls,
  ppVar, ppStrtch, ppMemo, DBCtrls, ppModule, raCodMod;

Type
  TfrmCadCertifRetencaoMT = Class(TFrmConfigRelatorioMT)
    Label3: TLabel;
    dblkImposto: TwwDBLookupCombo;
    Label4: TLabel;
    wwDBEdit1: TwwDBEdit;
    MsRetencao: TMontaSelect;
    sqlImpAgreg: TCMSqlParams;
    cdsImpAgreg: TCMClientDataSet;
    BitBtn1: TBitBtn;
    CkbSumLote: TCheckBox;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CdsDadosRAZAOSOCIAL: TStringField;
    CdsDadosNUMDOCUMENTO: TStringField;
    CdsDadosLOGRADOURO: TStringField;
    CdsDadosNUMERO: TStringField;
    CdsDadosCOMPLEMENTO: TStringField;
    CdsDadosBAIRRO: TStringField;
    CdsDadosCIDADE: TStringField;
    CdsDadosCEP: TStringField;
    CdsDadosNOME: TStringField;
    CdsDadosNOMEPAIS: TStringField;
    CdsDadosNOMEESTADO: TStringField;
    CdsDadosDATALANCTO: TDateTimeField;
    CdsDadosVALOR: TFloatField;
    CdsDadosVLRBASE: TFloatField;
    CdsDadosVLRRETIDO: TFloatField;
    CdsDadosDATARETENCAO: TDateTimeField;
    CdsDadosVLRABATVALOR: TFloatField;
    CdsDadosPERCCUSTAGREG: TFloatField;
    CdsDadosPERCBASE: TFloatField;
    CdsDadosDESCCUSTAGREG: TStringField;
    CdsDadosVLRABATFIXO: TFloatField;
    CdsDadosVALORBASECALCULO: TFloatField;
    CdsDadosVALORLIQUIDO: TFloatField;
    CdsDadosNODOCUMENTO: TFloatField;
    CdsDadosCOMPLDOCUMENTO: TStringField;
    CdsDadosNUMCERTIFICADO: TStringField;
    CdsDadosNUMFATURA: TStringField;
    CdsDadosNUMLANCTO: TFloatField;
    CdsDadosCODDOCUMENTO: TFloatField;
    CdsDadosIDFORCLI: TFloatField;
    CdsDadosIDIMPOSTORETIDO: TFloatField;
    CdsDadosALLFATURAS: TStringField;
    CdsMontaNumFatura: TCMClientDataSet;
    SQLMontaNumFatura: TCMSqlParams;
    SQLSumImpLote: TCMSqlParams;
    CdsSumImpLote: TCMClientDataSet;
    PpSumImpLote: TppBDEPipeline;
    DsSumImpLote: TwwDataSource;
    EdtUmaFatura: TppDBText;
    EdtAllFaturas: TppDBMemo;
    Procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
    Procedure BitBtn1Click(Sender: TObject);
    Procedure BtnImprimeClick(Sender: TObject);
    Procedure CmbModeloCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    bmontasel: boolean;
    _CadCertifRetencao: TCtrlCadCertifRetencao;
  protected
    Procedure SelModelo; override;
    Procedure SelDados; override;
    Procedure InsereCdsPrincipal; override;
    Procedure AbreCdsPrincipal(iId: Integer); override;
  public
    { Public declarations }
    Procedure HabilitaImpressao(bImprime: Boolean); override;
    Procedure loop_fatura;
  End;

Var
  frmCadCertifRetencaoMT: TfrmCadCertifRetencaoMT;

Implementation

Uses uCtrlPadroes, uCMTypes, uSistema, uFuncaoGeral, uMensErro, uModulo, DBaseDados;

{$R *.DFM}

Procedure TfrmCadCertifRetencaoMT.AbreCdsPrincipal(iId: Integer);
Begin
  Sql.Prepare;
  Sql.ParamByname('IDCERTIFICAGREG').AsFloat := iId;
  Sql.Open;
End;

Procedure TfrmCadCertifRetencaoMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  _CadCertifRetencao := TCtrlCadCertifRetencao.Create;
  _CadCertifRetencao.InitializeAs(Padroes);
  _CadCertifRetencao.OnMessageInfo := Mensagem;

  MsRetencao.Filtro.Add('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MsRetencao.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
  MsRetencao.Filtro.Add('DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = ' + QuotedStr(ParamIntegra.RecPag)
    +
    ' and not exists  (select 1 from UsuarioxTpdocto b where recpag= ' + QuotedStr(ParamIntegra.RecPag) + ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') ' + ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' +
    QuotedStr(ParamIntegra.RecPag)
    + '  and exists (select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr(ParamIntegra.RecPag) +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario) + '))');

  sqlImpAgreg.Sql.Add(' AND ');
  sqlImpAgreg.Sql.Add('(((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', '8', 'A') +
    ''') AND (TIPOALTERADOR.ACRESDECRES = ''C'')) OR ');
  sqlImpAgreg.Sql.Add('((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', 'A', '8') +
    ''') AND (TIPOALTERADOR.ACRESDECRES = ''D'')) OR ');
  sqlImpAgreg.Sql.Add('(TIPOALTERADOR.ACRESDECRES IS NULL))');
  sqlImpAgreg.Sql.Add(' ORDER BY TIPOAGRE.DESCCUSTAGREG');
  sqlImpAgreg.Open;
  MontaSelect.Filtro.Clear;
End;

Procedure TfrmCadCertifRetencaoMT.InsereCdsPrincipal;
Begin
  Cds.FieldByName('IDCERTIFICAGREG').AsFloat := -1;
  Cds.FieldByName('IDREPORTS').AsInteger := -1;
  Cds.FieldByName('ORIGEMCM').AsInteger := 0;
End;

Procedure TfrmCadCertifRetencaoMT.SelModelo;
Begin
  sqlModelo.Prepare;
End;

Procedure TfrmCadCertifRetencaoMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;
  deRelatorio.SetFocus;
End;

Procedure TfrmCadCertifRetencaoMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  deRelatorio.SetFocus;
End;

Procedure TfrmCadCertifRetencaoMT.CmeCadastroApplyInsert(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := _CadCertifRetencao.ProcessaConfig(Cds.Data, CdsReports.Data, OpInserir);
End;

Procedure TfrmCadCertifRetencaoMT.CmeCadastroApplyEdit(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := _CadCertifRetencao.ProcessaConfig(Cds.Data, CdsReports.Data, OpAlterar);
End;

Procedure TfrmCadCertifRetencaoMT.CmeCadastroApplyDelete(sender: TObject;
  Var Accept: Boolean);
Begin
  Accept := _CadCertifRetencao.ProcessaConfig(Cds.Data, CdsReports.Data, OpApagar);
End;

Procedure TfrmCadCertifRetencaoMT.SelDados;
Begin

  If bmontasel = true Then
  Begin
    sqlDados.Prepare;
    If MsRetencao.RetornouValor Then
      sqlDados.ParamByName('IDIMPOSTORETIDO').AsInteger := StrToIntDef(MsRetencao.ValoresChave[1], 0)
    Else
      sqlDados.ParamByName('IDIMPOSTORETIDO').AsInteger := 0;
    sqlDados.Open;
  End;
End;

Procedure TfrmCadCertifRetencaoMT.HabilitaImpressao(bImprime: Boolean);
Begin
  bmontasel := true;
  Inherited;
  If bImprime Then
  Begin
    Caption := 'Certificado de Retenção - Imprime';
    Height := Height - 50;

    BtnImprime.Enabled := False;
  End;
End;

Procedure TfrmCadCertifRetencaoMT.BitBtn1Click(Sender: TObject);
Begin
  Inherited;

  BtnImprime.Enabled := False;

  MsRetencao.Executar;
  If MsRetencao.RetornouValor Then
  Begin
    sqlModelo.Prepare;
    sqlModelo.Params[0].AsInteger := StrToInt(MsRetencao.ValoresChave[0]);
    sqlModelo.Open;
    If cdsModelo.IsEmpty Then
    Begin
      MsgDlg('Nenhum layout foi cadastrado para esse Tipo de Imposto', 'Erro', mtError, [mbOK], 0);
    End
    Else
    Begin
      sqlDados.Prepare;
      sqlDados.ParamByName('IDIMPOSTORETIDO').AsInteger := StrToInt(MsRetencao.ValoresChave[1]);
      sqlDados.Open;
    End;
    CkbSumLote.Enabled := (MsRetencao.ValoresChave[2] <> '');
    cmbModelo.Enabled := True;
  End;
End;

Procedure TfrmCadCertifRetencaoMT.BtnImprimeClick(Sender: TObject);
Begin
  bmontasel := False;
  CdsDados.Close;
  SqlDados.Open;
  loop_fatura;

  If (Not CdsDados.FieldByName('NUMCERTIFICADO').IsNull) Or
    (Modulo.GravaNumFatura(CdsDados.FieldByName('CODDOCUMENTO').AsInteger, CdsDados.FieldByName('NUMLANCTO').AsInteger,
    CdsDados.FieldByName('NUMCERTIFICADO').AsString, 'C', CdsModelo.FieldByName('MASCARA').AsString)) Then
  Begin
    If (CkbSumLote.Checked) And (MsRetencao.ValoresChave[2] <> '') Then
    Begin
      SQLSumImpLote.Prepare;
      SQLSumImpLote.ParamByname('NUMLOTE').AsFloat := StrToFloat(MsRetencao.ValoresChave[2]);
      SQLSumImpLote.ParamByname('CODTIPOCUSTAGREG').AsFloat := CdsModelo.FieldByName('CODTIPOCUSTAGREG').AsFloat;
      SQLSumImpLote.Open;

      CdsDados.Edit;
      CdsDados.FieldByName('VALOR').AsFloat := CdsSumImpLote.FieldByName('VALOR').AsFloat;
      CdsDados.FieldByName('VLRABATFIXO').AsFloat := CdsSumImpLote.FieldByName('VLRABATFIXO').AsFloat;
      CdsDados.FieldByName('VALORBASECALCULO').AsFloat := CdsSumImpLote.FieldByName('VALORBASECALCULO').AsFloat;
      CdsDados.FieldByName('VLRRETIDO').AsFloat := CdsSumImpLote.FieldByName('VLRRETIDO').AsFloat;
      CdsDados.FieldByName('VALORLIQUIDO').AsFloat := CdsSumImpLote.FieldByName('VALORLIQUIDO').AsFloat;
      CdsDados.Post;
    End;

    Inherited;
  End;

  CmbModelo.Text := '';
  BtnImprime.Enabled := False;
End;

Procedure TfrmCadCertifRetencaoMT.CmbModeloCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  BtnImprime.Enabled := (Trim(CmbModelo.Text) <> '');
End;

Procedure TfrmCadCertifRetencaoMT.loop_fatura;
Var
  bEndLoop: Boolean;
  sNumFaturas: String;
Begin
  Inherited;
  CdsDados.edit;
  If (CmbModelo.Text <> '') And (MsRetencao.ValoresChave[2] <> '') Then
  Begin
    sNumFaturas := '';

    If CkbSumLote.Checked Then
    Begin
      DtmBaseDados.Cds.Data := ParamIntegra.GetDataPacket(' SELECT DISTINCT ' +
        '   I.DATARETENCAO,I.IDFORCLI,I.IDIMPOSTORETIDO ' +
        ' FROM ' +
        '   LANCTODOCUM L, IMPOSTORETIDO I, LOTEXDOCUM LX ' +
        ' WHERE ' +
        '   (I.CODTIPOCUSTAGREG = ' + CdsModelo.FieldByName('CODTIPOCUSTAGREG').AsString + ') AND ' +
        '   (LX.NUMLOTE = ' + MsRetencao.ValoresChave[2] + ') AND ' +
        '   (L.ESTORNO IS NULL) AND ' +
        '   (I.NUMLANCTOORIGEM = L.NUMLANCTO)    AND ' +
        '   (LX.CODDOCUMENTO = L.CODDOCUMENTO) ');

      While Not DtmBaseDados.Cds.Eof Do
      Begin
        SQLMontaNumFatura.Prepare;
        SQLMontaNumFatura.ParamByname('DATARETENCAO').AsDateTime := DtmBaseDados.Cds.FieldByName('DATARETENCAO').AsDatetime;
        SQLMontaNumFatura.ParamByname('IDFORCLI').AsFloat := DtmBaseDados.Cds.FieldByName('IDFORCLI').AsFloat;
        SQLMontaNumFatura.Open;

        bEndLoop := False;

        If Not CdsMontaNumFatura.IsEmpty Then
          sNumFaturas := CdsMontaNumFatura.FieldByName('NUMFATURA').AsString + ' , ';

        While (Not bEndLoop) And (Not CdsMontaNumFatura.Eof) Do
        Begin
          If Pos(CdsMontaNumFatura.FieldByName('NUMFATURA').AsString, sNumFaturas) = 0 Then
            sNumFaturas := sNumFaturas + CdsMontaNumFatura.FieldByName('NUMFATURA').AsString + ' , ';

          CdsMontaNumFatura.Next;
          bEndLoop := (Not (CdsMontaNumFatura.FieldByName('VLRRETIDO').AsFloat = 0));
        End;

        DtmBaseDados.Cds.Next;
      End;
    End
    Else
    Begin
      SQLMontaNumFatura.Prepare;
      SQLMontaNumFatura.ParamByname('DATARETENCAO').AsDateTime := CdsDados.FieldByName('DATARETENCAO').AsDatetime;
      SQLMontaNumFatura.ParamByname('IDFORCLI').AsFloat := CdsDados.FieldByName('IDFORCLI').AsFloat;
      SQLMontaNumFatura.Open;

      bEndLoop := False;

      If Not CdsMontaNumFatura.IsEmpty Then
        sNumFaturas := CdsMontaNumFatura.FieldByName('NUMFATURA').AsString + ' , ';

      While (Not bEndLoop) And (Not CdsMontaNumFatura.Eof) Do
      Begin
        If Pos(CdsMontaNumFatura.FieldByName('NUMFATURA').AsString, sNumFaturas) = 0 Then
          sNumFaturas := sNumFaturas + CdsMontaNumFatura.FieldByName('NUMFATURA').AsString + ' , ';
        CdsMontaNumFatura.Next;
        bEndLoop := (Not (CdsMontaNumFatura.FieldByName('VLRRETIDO').AsFloat = 0));
      End;
    End;

    CdsDados.FieldByName('ALLFATURAS').AsString := trim(Copy(sNumFaturas, 1, Length(sNumFaturas) - 3))
  End
  Else
    CdsDados.FieldByName('ALLFATURAS').Clear;
  CdsDados.post;
  EdtUmaFatura.Visible := CdsDados.FieldByName('ALLFATURAS').IsNull;
  EdtAllFaturas.Visible := Not EdtUmaFatura.Visible;
End;

End.

