unit fConfigRubs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorio, ppClass, ppBands, ppProd, ppReport, ppComm, ppCache,
  ppDB, ppDBBDE, Db, Menus, ppEndUsr, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, MAHlpBtn, TB97Ctls, TB97Tlbr,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, TREdit, ppRelatv, ppDBPipe, CmEventosCadastro, ImgList,
  dBaseDados, Fpreview, uCmTypes, Pptypes, fConfigCartaAviso, uRubs,
  ppStrtch, ppSubRpt, ppPrnabl, ppCtrls, Grids, Wwdbigrd, Wwdbgrid,
  ppModule, daDataModule;

type
  TfrmConfigRubs = class(TFrmConfigRelatorio)
    QryCadModeloIDCARTACOBRANCA: TFloatField;
    QryCadModeloMODELOCARTA: TStringField;
    QryCadModeloIDREPORTS: TFloatField;
    QryCadModeloORIGEMCM: TFloatField;
    QryCadModeloFLGTIPOCARTA: TStringField;
    GpRubs: TGroupBox;
    EdtRubIni: TRealEdit;
    EdtRubFin: TRealEdit;
    MsModelosRubs: TMontaSelect;
    qryConfigRubs: TwwQuery;
    updConfigRubs: TUpdateSQL;
    qryConfigRubsIDCONFIGRUBS: TFloatField;
    qryConfigRubsIDCARTACOBRANCA: TFloatField;
    QryCamposRub: TwwQuery;
    qryIDCARTACOBRANCA: TFloatField;
    qryMODELOCARTA: TStringField;
    qryIDREPORTS: TFloatField;
    qryORIGEMCM: TFloatField;
    qryFLGTIPOCARTA: TStringField;
    qryBuscaRubs: TwwQuery;
    Label3: TLabel;
    Label4: TLabel;
    qryModelos: TwwQuery;
    qryModelosIDCARTACOBRANCA: TFloatField;
    qryModelosMODELOCARTA: TStringField;
    qryModelosIDREPORTS: TFloatField;
    qryModelosORIGEMCM: TFloatField;
    qryModelosFLGTIPOCARTA: TStringField;
    UpdBuscaRubs: TUpdateSQL;
    qryBuscaRubsIDRUBS: TFloatField;
    qryBuscaRubsFLGSTATUS: TStringField;
    qryBuscaRubsIDREPORTS: TFloatField;
    qryBuscaRubsIDCONFIGRUBS: TFloatField;
    qryBuscaRubsDESCRUB: TStringField;
    qryBuscaRubsNOMETXTRUB: TStringField;
    qryBuscaRubsNOMEDOCRUB: TStringField;
    qryBuscaRubsSEPARADORCOLUNAS: TStringField;
    qryBuscaRubsNUMDIASCARTAAVISO: TFloatField;
    qryBuscaRubsFLGDELIMITALINHA: TStringField;
    qryBuscaRubsIDCARTACOBRANCA: TFloatField;
    qrylimpa: TwwQuery;
    UpdGravaTemplate: TUpdateSQL;
    qryGravaTemplate: TwwQuery;
    qryGravaTemplateNAME: TStringField;
    qryGravaTemplateIDREPORTS: TFloatField;
    qryGravaTemplateORIGEMCM: TFloatField;
    qryGravaTemplateTEMPLATE: TBlobField;
    qryDetDocs: TwwQuery;
    ppdetalhe_documentos: TppBDEPipeline;
    dsDetDocs: TwwDataSource;
    qryDetDependIRRF: TwwQuery;
    dsDetDependIRRF: TwwDataSource;
    ppDetalhe_Dependente_IRRF: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDetalhe_Telefones: TppBDEPipeline;
    qryDetTelefones: TwwQuery;
    dsDetTelefones: TwwDataSource;
    qryDetDependentes: TwwQuery;
    dtsDetDependentes: TwwDataSource;
    ppDetalhe_Dependente: TppBDEPipeline;
    dtsDetBeneficiarios: TwwDataSource;
    ppDetalhe_Beneficiario: TppBDEPipeline;
    qryDetBeneficiarios: TwwQuery;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DsgnCMClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    iIdRubs, IdCartaCobranca, IdReport :LongInt;
    iPosFiltro :Integer;
    sqlGeral : string;
    imprimir : Boolean;
    flgApaga : Boolean;
    sNomeRelatorio : string;
    aReportModelo, aReportDesign: TMemoryStream;
    procedure reseta;
  public
    { Public declarations }
    bAplicaAlteracoesRubs :Boolean;
    procedure InsereQryPrincipal; Override;
    Procedure AbreQueryDados; Override;
    Procedure HabilitaImpressao(bImprime:Boolean); Override;
  end;

var
  frmConfigRubs: TfrmConfigRubs;

implementation

Uses uMensErro, uSistema, uDataBase, datend, DRubs;

{$R *.DFM}

Procedure TfrmConfigRubs.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
      reseta;
      With Qry Do
      Begin
        If Active Then Close;
        If Not Prepared Then Prepare;
        ParamByName('IDCARTACOBRANCA').AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],0);
        Open;

        qryCamposRUB.Close;
        qryCamposRUB.paramByName('IDCONFIGRUBS').asFloat := strToIntDef(MontaSelect.ValoresChave[2], -1);
        qryCamposRUB.Open;
      End;
  End;
End;

procedure TfrmConfigRubs.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
End;

procedure TfrmConfigRubs.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
End;

procedure TfrmConfigRubs.InsereQryPrincipal;
Begin
    QryIdCartaCobranca.AsFloat := LeUltRegistro(nil,'CARTACOBRANCA');
    QryIDREPORTS.AsInteger     := LeUltRegistro(nil,'REPORTS');
    QryORIGEMCM.AsInteger      := 0;
    QryFlgTipoCarta.AsString   := 'Z';

    IdCartaCobranca := QryIdCartaCobranca.AsInteger;
    IdReport := QryIDREPORTS.AsInteger;

    msModelosRubs.executar;
    if msModelosRubs.RetornouValor then
    begin
      qryCamposRUB.Close;
      qryCamposRUB.paramByName('IDCONFIGRUBS').asFloat := strToIntDef(msModelosRubs.ValoresChave[1], -1);
      qryCamposRUB.Open;
      qryMODELOCARTA.asString := msModelosRubs.ValoresChave[0];

      if msModelosRubs.ValoresChave[2] <> '' then
      begin
        IdCartaCobranca := strToIntDef(msModelosRubs.ValoresChave[2], -1);
      end;

      QryIdCartaCobranca.asInteger := IdCartaCobranca;
      QryMODELOCARTA.asString := msModelosRubs.ValoresChave[0];
      QryIDREPORTS.asFloat     := idreport;
      QryORIGEMCM.AsInteger      := 0;
      QryFlgTipoCarta.AsString   := 'Z';
    end;
End;




Procedure TfrmConfigRUBS.AbreQueryDados;
var  sSql, sFiltro : string;
    F : TextFile;
    i : integer;
begin
  inherited;
  sSql := '';
  sFiltro := '';

  // Cria o arquivo Temporário no diretório Temp do windows
  if qry.State = dsInsert then
  begin
    try
      sNomeRelatorio := Sistema.TempDir + 'Modelo.Tcm';
      AssignFile(F, sNomeRelatorio);
      Rewrite(F);
      CloseFile(F);
      DsgnCM.Report.Template.New;
      DsgnCM.Report.Template.SaveTo   := stFile;
      DsgnCM.Report.Template.Format   := ftASCII;
      DsgnCM.Report.Template.FileName := sNomeRelatorio;
      DsgnCM.Report.Template.SaveToFile;
    except
      showMessage('Não foi possível gravar o arquivo temporário '+sNomeRelatorio)
    end;
  end;

  // pegar as rubs a serem impressas
  qryBuscaRubs.Close;
  sFiltro := '';
  if (cmbModelo.Text <> '') and (cmbModelo.LookupValue <> '') then
    sFiltro := sFiltro + ' AND C.IDCARTACOBRANCA = '+ cmbModelo.LookupValue +#13#10;

  if (EdtRubIni.Text <> '') and (EdtRubIni.Text <> '0') and (EdtRubFin.Text <> '') and (EdtRubFin.Text <> '0')then
  begin
    sFiltro := sFiltro + ' AND R.IDRUBS BETWEEN '+ EdtRubIni.Text + ' AND '+ EdtRubFin.Text +#13#10;
  end;

  qryBuscaRubs.SQL.text :=  ' SELECT '                                          +#13#10+
                            '   R.IDRUBS, '                                     +#13#10+
                            '   HL.FLGSTATUS, '                                 +#13#10+
                            '   CC.IDREPORTS, '                                 +#13#10+
                            '   C.IDCONFIGRUBS, '                               +#13#10+
                            '   C.DESCRUB, '                                    +#13#10+
                            '   C.NOMETXTRUB, '                                 +#13#10+
                            '   C.NOMEDOCRUB, '                                 +#13#10+
                            '   C.SEPARADORCOLUNAS, '                           +#13#10+
                            '   C.NUMDIASCARTAAVISO, '                          +#13#10+
                            '   C.FLGDELIMITALINHA, '                           +#13#10+
                            '   C.IDCARTACOBRANCA '                             +#13#10+
                            ' FROM '                                            +#13#10+
                            '   CONFIGRUBS C, '                                 +#13#10+
                            '   RUBS R, '                                       +#13#10+
                            '   ASSUNTO A, '                                    +#13#10+
                            '   ASSUNTOXATEND AXA, '                            +#13#10+
                            '   CARTACOBRANCA CC, '                             +#13#10+
                            '   HISTMOVRUBS HL '                                +#13#10+
                            '  WHERE '                                          +#13#10+
                            '   HL.FLGSTATUS IN (1, 3) AND  '                   +#13#10+  //**** com status gerado ou regerado
                            '   R.IDRUBS = HL.IDRUBS AND '                      +#13#10+
                            '   R.IDASSUNTOXATEND = AXA.IDASSUNTOXATEND(+) AND '+#13#10+
                            '   A.IDASSUNTO = AXA.IDASSUNTO  AND '              +#13#10+
                            '   A.IDCONFIGRUBS =  C.IDCONFIGRUBS AND '          +#13#10+
                            '   C.IDCONFIGRUBS = A.IDCONFIGRUBS AND '           +#13#10+
                            '   CC.IDCARTACOBRANCA = C.IDCARTACOBRANCA '        +#13#10+ sFiltro;

  qryBuscaRubs.Open;
  if (qryBuscaRubs.IsEmpty) and (imprimir) then
    MessageDlg('Não Há Rubs a Serem Impressas com os Parâmetros Selecionados!', mtCustom, [mbOK], 0);
  qryBuscaRubs.First;
  while (not qryBuscaRubs.Eof) and imprimir do
  begin
    qry.Edit;
    // busca o modelo de report
    qryCadModelo.Close;
    qryCadModelo.ParamByName('IDCARTACOBRANCA').asInteger := qryBuscaRubsIDCARTACOBRANCA.asInteger;
    qryCadModelo.Open;
    cmbModelo.Text := qryCadModeloMODELOCARTA.asString;

    // busca os campos da RUB
    qryCamposRUB.Close;
    qryCamposRUB.paramByName('IDCONFIGRUBS').asFloat := qryBuscaRubsIDCONFIGRUBS.asInteger;
    qryCamposRUB.Open;

    //  Monta a query do relatório
    sSql := '';

    while not qryCamposRUB.Eof do
    begin
      sSql := Ssql + qryCamposRUB.FieldByName('CAMPODETALHE').asString + ',';
      qryCamposRUB.Next;
    end;
    if length(sSql) > 0 then
      sSql[length(sSql)] := ' ';

    //*****
    if qryCamposRUB.Eof then
    begin
      qryDados.Close;
      qryDados.Sql.Clear;
      qryDados.Sql.Text := ' select * from ( '+ SqlGeral + ' ) '
    end
    else
    begin
      qryDados.Close;
      qryDados.Sql.Clear;
      qryDados.Sql.Text := ' select '+sSql+' from ( '+ SqlGeral + ' ) ';
    end;

// ini tavares 21/02/2003
   dtmRubs.MontaQueryEmissao(strToIntDef(qryBuscaRubsIDRUBS.asString, -1), qryDados, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios );
// fim tavares 21/02/2003

///********  Manda a RUBS para impressora  ******************///
    QryReports.Close;
    qryReports.ParamByName('PIDREPORTS').asInteger := QryCadModeloIDREPORTS.asInteger;
    qryReports.ParamByName('PORIGEMCM').asInteger  := 0;
    qryReports.Open;
    sNomeRelatorio := Sistema.TempDir + 'Modelo.Tcm';
    qryReportsTEMPLATE.SaveToFile(sNomeRelatorio);
    DsgnCM.Report.Template.FileName := sNomeRelatorio;
    DsgnCM.Report.Template.LoadFromFile;
    DsgnCM.PrintReport;
    cmbModelo.Text := qryCadModeloMODELOCARTA.asString;
///********

/// ******** Grava o novo status da RUBS  ****************///
    qryBuscaRubs.Edit;
    if qryBuscaRubsFLGSTATUS.asString = '1' then // Gerado
      qryBuscaRubsFLGSTATUS.asString := '2' // Emitido
    else if qryBuscaRubsFLGSTATUS.asString = '3' then //Regerado
    qryBuscaRubsFLGSTATUS.asString := '4'; //Reemitido
    qryBuscaRubs.Post;
/// *******************************************************///

    qryBuscaRubs.Next;
  end; // end do while

  if (not imprimir) then
  begin
    if (qry.State <> dsInsert) then
    begin
      qry.Edit;
      // busca o modelo de report
      qryCadModelo.Close;
      if montaSelect.RetornouValor then
        qryCadModelo.ParamByName('IDCARTACOBRANCA').asInteger := strToIntDef(montaSelect.ValoresChave[0], -1)
      else
        qryCadModelo.ParamByName('IDCARTACOBRANCA').asInteger := -1;
      qryCadModelo.Open;
      cmbModelo.Text := qryCadModeloMODELOCARTA.asString;

      // busca os campos da RUB
      qryCamposRUB.Close;
      if montaSelect.RetornouValor then
        qryCamposRUB.paramByName('IDCONFIGRUBS').asFloat := strToIntDef(montaSelect.ValoresChave[2], -1)
      else
        qryCamposRUB.paramByName('IDCONFIGRUBS').asFloat := -1;
      qryCamposRUB.Open;
    end;
    //  Monta a query do relatório
    sSql := '';
    qryCamposRUB.First;
    while not qryCamposRUB.Eof do
    begin
      sSql := Ssql + qryCamposRUB.FieldByName('CAMPODETALHE').asString + ',';
      qryCamposRUB.Next;
    end;
    if length(sSql) > 0 then
      sSql[length(sSql)] := ' ';

    qryCamposRUB.first;
    qryDados.Close;
    qryDados.sql.Clear;
    // seleciona somente os campos do Modelo de RUBS


    dtmRubs.MontaQueryEmissao(-1, qryDados, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios );
    if not qryCamposRUB.isEmpty then
    begin
      i := ppDados.fieldCount - 1;
      while (i > 0) and (ppDados.fieldCount > 0) and (ppDados.fieldCount <> qryCamposRub.RecordCount) do
      begin
        if not qryCamposRub.Locate('CAMPODETALHE', ppdados.fields[i].FieldName, [loCaseInsensitive, loPartialKey]) then
        begin
          ppDados.RemoveField(ppdados.fields[i]);
          i := ppDados.fieldCount - 1;
        end
        else if i > 0 then
          i := i - 1;
      end;
    end;
// fim tavares 21/02/2003

  end;

   If (Imprimir) And (Application.MessageBox('As RUBS foram impressas corretamente?','Central de Atendimento ao Público',Mb_YesNo + Mb_IConQuestion) = Id_Yes) Then
     qryBuscaRubs.applyUpdates
   else
     qryBuscaRubs.CancelUpdates;

end;


Procedure TfrmConfigRubs.HabilitaImpressao(bImprime:Boolean);
Begin
  Inherited;
  BtnImprime.Visible := true;
  imprimir := true;
End;

procedure TfrmConfigRubs.FormCreate(Sender: TObject);
begin
  inherited;

  sNomeRelatorio := Sistema.TempDir + 'Modelo.Tcm';
  flgApaga := false;

  reseta;
  cmbModelo.Text := 'Rubs';
  qry.Close;
  qry.ParamByName('IDCARTACOBRANCA').asFloat := -1;
  qry.Open;
  qryModelos.Open;
  imprimir := false;
end;


procedure TfrmConfigRubs.BtnImprimeClick(Sender: TObject);
begin
  // inherited;
  AbreQueryDados;
end;

procedure TfrmConfigRubs.qryAfterPost(DataSet: TDataSet);
begin
  inherited;
  qryConfigRubs.Close;
  if CmeCadastro.Operacao = OpInserir then
  begin
    qryConfigRubs.paramByName('IDCONFIGRUBS').asInteger := strToIntDef(msModelosRubs.ValoresChave[1], -1);
    qryConfigRubs.open;
    qryConfigRubs.edit;
    qryConfigRubsIDCARTACOBRANCA.asInteger := IdCartaCobranca;
  end
  else
  begin
    qryConfigRubs.paramByName('IDCONFIGRUBS').asInteger := strToIntDef(MontaSelect.ValoresChave[2], -1);
    qryConfigRubs.open;
    qry.Locate('IDCARTACOBRANCA', MontaSelect.ValoresChave[0], []);
    qryConfigRubs.Locate('IDCARTACOBRANCA', MontaSelect.ValoresChave[0], []);
  end;

  qry.ApplyUpdates;
  qryConfigRubs.ApplyUpdates;

  qry.Close;
  qry.ParamByName('IDCARTACOBRANCA').asFloat := -1;
  qry.Open;
end;

procedure TfrmConfigRubs.sbtnInserirClick(Sender: TObject);
begin
  reseta;
  inherited;
end;

procedure TfrmConfigRubs.reseta;
var i : integer;
begin
  // Fecha todos as queries abertas
  qry.close;
  qryDados.close;
  qryConfigRubs.Close;
  qryModelos.Close;
  qryCamposRUB.Close;
  qryBuscaRubs.Close;
  qryDados.Sql.Clear;

// tavares 21/02/2003
  dtmRubs.MontaQueryEmissao(-1, qryDados, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios );

  cmbModelo.Text := 'Rubs';
  qry.Close;
  qry.ParamByName('IDCARTACOBRANCA').asFloat := -1;
  qry.Open;
  qryModelos.Open;
  imprimir := false;
end;

procedure TfrmConfigRubs.sbtnProcurarClick(Sender: TObject);
begin
  reseta;
  inherited;
end;

procedure TfrmConfigRubs.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  flgApaga := false;
  reseta;
end;

procedure TfrmConfigRubs.sbtnApagarClick(Sender: TObject);
begin
  // inherited;
  flgApaga := true;
  bbTnConfirmar.Enabled := true;
  bbTnCancelar.Enabled := true;
end;

procedure TfrmConfigRubs.bbtnConfirmarClick(Sender: TObject);
begin
  if not flgApaga then
  begin
    inherited;
  end
  else
  begin
    if (not qry.Eof) and (qry.Active) and (flgApaga) then
    begin
      if Application.MessageBox('Deseja Realmente Excluir o Relatório','Cadastro de Relatório de RUBS',Mb_YesNo + Mb_IConQuestion) = Id_Yes then
      begin
        flgApaga := false;
        qryLimpa.Close;
        qryLimpa.Sql.Text := 'UPDATE CONFIGRUBS SET IDCARTACOBRANCA = NULL WHERE IDCARTACOBRANCA = ' + qry.fieldByName('IDCARTACOBRANCA').AsString;
        qryLimpa.ExecSql;

        qryLimpa.Close;
        qryLimpa.Sql.Text := 'DELETE FROM CARTACOBRANCA WHERE IDREPORTS = ' + qry.fieldByName('IDREPORTS').AsString;
        qryLimpa.ExecSql;

        qryLimpa.Close;
        qryLimpa.Sql.Text := 'DELETE FROM REPORTS WHERE IDREPORTS = ' + qry.fieldByName('IDREPORTS').AsString;
        qryLimpa.ExecSql;

        bbTnConfirmar.Enabled := false;
        bbTnCancelar.Enabled := false;

        qry.Close;
        qry.ParamByName('IDCARTACOBRANCA').asFloat := -1;
        qry.Open;
      end;
    end;
  end;


end;

procedure TfrmConfigRubs.DsgnCMClose(Sender: TObject;  var Action: TCloseAction);
 var F : TextFile;
begin
  inherited;
    try
      sNomeRelatorio := Sistema.TempDir + 'Relatorio.Tcm';
      AssignFile(F, sNomeRelatorio);
      Rewrite(F);
      CloseFile(F);
      DsgnCM.Report.Template.SaveTo   := stFile;
      DsgnCM.Report.Template.Format   := ftASCII;
      DsgnCM.Report.Template.FileName := sNomeRelatorio;
      DsgnCM.Report.Template.SaveToFile;
    except
      showMessage('Não foi possível gravar o arquivo temporário '+sNomeRelatorio)
    end;
end;


End.
