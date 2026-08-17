unit FCadProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, Mask,
  Wwtable, TabControlDetalhe, CMProcura, wwdblook, Wwdbspin, wwdbedit, TREdit, URegra, ImgList,
  CMProcuraSubTipo, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro;

type
  TfrmCadProcesso = class(TfrmCadMestreDetalheCS)
    tblTipRec: TwwTable;
    qryProcVinc: TwwQuery;
    qryPartic: TwwQuery;
    ds5: TwwDataSource;
    qryTipAcao: TwwQuery;
    ds4: TwwDataSource;
    tblTipSent: TwwTable;
    dsProcVinc: TwwDataSource;
    qryAdvCasa: TwwQuery;
    qryTipoProc: TwwQuery;
    tblTipObj: TwwTable;
    tbshReclamante: TTabSheet;
    tbshOutrosDados: TTabSheet;
    tbshEncer: TTabSheet;
    tbsEtapas: TTabSheet;
    tbshVinculos: TTabSheet;
    Label5: TLabel;
    dblcTipObj: TwwDBLookupCombo;
    Label39: TLabel;
    dbmemObserv: TDBMemo;
    rgTipEncer: TDBRadioGroup;
    gbxAcordo: TGroupBox;
    sbspeParc: TwwDBSpinEdit;
    gbxDataEncer: TGroupBox;
    dbedEncerr: TCMDateTimePicker;
    gbxSent: TGroupBox;
    dblcTipSent: TwwDBLookupCombo;
    Label15: TLabel;
    dbedPrevEnc: TCMDateTimePicker;
    dbGrdEtapa: TwwDBGrid;
    pnlLigado: TPanel;
    Label37: TLabel;
    spbProcVinc: TSpeedButton;
    spbApagaVinc: TSpeedButton;
    dbedNumVinc: TDBEdit;
    gbxVinculados: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    qryTipoObj: TwwQuery;
    qryVara: TwwQuery;
    tbsLitisconsortes: TTabSheet;
    pnlDet2: TPanel;
    dbgrDet2: TwwDBGrid;
    dsDet2: TwwDataSource;
    qryLitis: TwwQuery;
    updLitis: TUpdateSQL;
    tblTRT: TwwTable;
    tblHonor: TwwTable;
    qryTipoEtapa: TwwQuery;
    pnlEtapas: TPanel;
    Label22: TLabel;
    Label20: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lblHonor: TLabel;
    Label43: TLabel;
    dblcTipoEtp: TwwDBLookupCombo;
    dtedDataReal: TCMDateTimePicker;
    mskedHora: TMaskEdit;
    dbedAssunto: TDBEdit;
    dbedValRec: TwwDBEdit;
    redHonor: TRealEdit;
    dbmObserv: TDBMemo;
    qryNumSeq: TwwQuery;
    MontaSelectCidade: TMontaSelect;
    dsUF: TwwDataSource;
    qryUF: TwwQuery;
    pgCtrlOutrosDados: TPageControl;
    tbshTipos: TTabSheet;
    tbshAdvogados: TTabSheet;
    tbshValores: TTabSheet;
    Label28: TLabel;
    dbreCusto: TDBRealEdit;
    Label14: TLabel;
    redValorAtual: TRealEdit;
    Label8: TLabel;
    dbreDespesa: TDBRealEdit;
    Label3: TLabel;
    dbedPost: TCMDateTimePicker;
    Label16: TLabel;
    dbedNumTRT: TDBEdit;
    Label18: TLabel;
    dbedQtde: TDBEdit;
    Label17: TLabel;
    dbedNumTST: TDBEdit;
    Label31: TLabel;
    dblcTipProc: TwwDBLookupCombo;
    Label33: TLabel;
    dblcTipAcao: TwwDBLookupCombo;
    Label35: TLabel;
    dbedPasta: TDBEdit;
    Label36: TLabel;
    ProcuraCidade: TCMProcura;
    Label21: TLabel;
    edUF: TwwDBEdit;
    CMProcuraAdv1: TCMProcuraSubTipo;
    CMProcuraAdv2: TCMProcuraSubTipo;
    CMProcuraAssist: TCMProcuraSubTipo;
    Label34: TLabel;
    dblcAdvCasa: TwwDBLookupCombo;
    dbrgIndTaxaConv: TDBRadioGroup;
    gbxIndice: TGroupBox;
    gbxRegra: TGroupBox;
    qryMoeda: TwwQuery;
    dblcMoeda: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    dblcRegraNormal: TwwDBLookupCombo;
    tblParam: TwwTable;
    qrySubConta: TwwQuery;
    updSubConta: TUpdateSQL;
    Regra: TRegra;
    qryIn: TwwQuery;
    qryValores: TwwQuery;
    qryAux2: TwwQuery;
    qryTipoOper: TwwQuery;
    tbsContabCAP: TTabSheet;
    gbxContabilizacao: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    dblcTipOper: TwwDBLookupCombo;
    redJuros: TRealEdit;
    rgJuros: TRadioGroup;
    gbxCAP: TGroupBox;
    Label46: TLabel;
    dtPagamento: TCMDateTimePicker;
    Label47: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    qryTipoDesemb: TwwQuery;
    qryTipoDoc: TwwQuery;
    qryDocumentos: TwwQuery;
    qryDocumentosCODTIPRECDES: TStringField;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosPLANO: TFloatField;
    qryDocumentosPLACONTA: TStringField;
    qryDocumentosPLNCODIGO: TFloatField;
    qryDocumentosNUMLANCTO: TFloatField;
    qryDocumentosUNIDNEGOC: TFloatField;
    qryDocumentosCODCENTRORESPON: TStringField;
    qryDocumentosVALOR: TFloatField;
    qryDocumentosCODPORTFORMA: TFloatField;
    qryDocumentosDEBCRE: TStringField;
    qryDocumentosPORTFORMAPARTICIP: TFloatField;
    qryDocumentosCODCENTROCUSTO: TStringField;
    updDocumentos: TUpdateSQL;
    Label48: TLabel;
    dblcTipoDesemb: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    Label30: TLabel;
    dbedNumero: TDBEdit;
    dbedDataAju: TCMDateTimePicker;
    rgSituacao: TDBRadioGroup;
    dbedDataNot: TCMDateTimePicker;
    dbedNumJCJ: TDBEdit;
    dbrgMateria: TDBRadioGroup;
    Label40: TLabel;
    Label32: TLabel;
    Label11: TLabel;
    Label23: TLabel;
    dbedRazao: TDBEdit;
    dbedInscNum: TDBEdit;
    dbrgTipoPessoa: TDBRadioGroup;
    dbedEmail: TDBEdit;
    dbedLogra: TDBEdit;
    dbedNumLogra: TDBEdit;
    dbedComplem: TDBEdit;
    dbedBairro: TDBEdit;
    Label4: TLabel;
    dblcVara: TwwDBLookupCombo;
    dbedNumVara: TwwDBEdit;
    qryDocumentosRECPAG: TStringField;
    qrySubContaAux: TwwQuery;
    rgAtivo: TDBRadioGroup;
    gbxSitReq: TGroupBox;
    lblSitReq: TLabel;
    dblcMotivoReq: TwwDBLookupCombo;
    qryMotivo: TwwQuery;
    gbxSitLitis: TGroupBox;
    lblSitLit: TLabel;
    dblcMotivoLit: TwwDBLookupCombo;
    qryObjeto: TwwQuery;
    qryObjetoDESCRICAO: TStringField;
    qryObjetoVALORRECL: TFloatField;
    qryObjetoPERCPROB: TFloatField;
    qryObjetoVALORESPERADO: TFloatField;
    qryObjetoVALORSENTENCA: TFloatField;
    qryObjetoOBSERVACAO: TStringField;
    qryObjetoNUMPROCTRAB: TFloatField;
    qryObjetoCODTIPOOBJETO: TFloatField;
    qryObjetoINDVALOR: TFloatField;
    qryObjetoDATAINICIO: TDateTimeField;
    qryObjetoDATAFINAL: TDateTimeField;
    qryObjetoPERCORIG: TFloatField;
    updObjeto: TUpdateSQL;
    qryHonorDELETE: TwwQuery;
    updHonorDELETE: TUpdateSQL;
    gbxRequerente: TGroupBox;
    edNomeRequerente: TEdit;
    bbtnProcRequerente: TBitBtn;
    gbxLitisconsorte: TGroupBox;
    spbtnProcLitisconsorte: TSpeedButton;
    edLitisconsorte: TEdit;
    qryRequerente: TwwQuery;
    sbtnProcurarLitis: TToolbarButton97;
    dbrgCategoria: TDBRadioGroup;
    Label6: TLabel;
    Label7: TLabel;
    Label24: TLabel;
    Label50: TLabel;
    lblValReal: TLabel;
    dbedValRecl: TDBRealEdit;
    dbedPercOrig: TDBRealEdit;
    dbedPerc: TDBRealEdit;
    edValor: TRealEdit;
    dbedValReal: TDBRealEdit;
    Label25: TLabel;
    dbrgAbate: TDBRadioGroup;
    UpdEtapa: TUpdateSQL;
    qryEtapa: TwwQuery;
    qryVerificaProcesso: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipEncerClick(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dbreCustoChange(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure spbProcVincClick(Sender: TObject);
    procedure rgSituacaoClick(Sender: TObject);
    procedure spbApagaVincClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure qryLitisBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryEtapaBeforeEdit(DataSet: TDataSet);
    procedure qryEtapaAfterScroll(DataSet: TDataSet);
    procedure qryEtapaBeforePost(DataSet: TDataSet);
    procedure qryEtapaBeforeInsert(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure qryEtapaAfterInsert(DataSet: TDataSet);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProcuraCidadeValidaDados(Sender: TObject);
    procedure dbrgIndTaxaConvChange(Sender: TObject);
    procedure dblcTipoEtpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcRegraNormalCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure rgSituacaoChange(Sender: TObject);
    procedure rgAtivoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryLitisAfterScroll(DataSet: TDataSet);
    procedure dblcMotivoReqChange(Sender: TObject);
    procedure dblcMotivoLitChange(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure qryObjetoCalcFields(DataSet: TDataSet);
    procedure qryObjetoAfterPost(DataSet: TDataSet);
    procedure qryObjetoBeforeEdit(DataSet: TDataSet);
    procedure qryObjetoAfterInsert(DataSet: TDataSet);
    procedure qryObjetoBeforePost(DataSet: TDataSet);
    procedure bbtnProcRequerenteClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure sbtnProcurarLitisClick(Sender: TObject);
    procedure qryBeforeInsert(DataSet: TDataSet);
    procedure dbedNumJCJExit(Sender: TObject);
  private
    iIDPatro, iIDPlanoPrev, iCodDocumento, iUltIdBanco, iPortadorFormaDefault: integer;

    procedure IniciaValoresContabeis;
    procedure MudaReclamante;
    procedure MudaCidade;
    procedure SelecionaRequerente;
  public
    procedure BuscaProcesso(NumProcTrab: real);  
  end;

var
  frmCadProcesso: TfrmCadProcesso;
  ValAntes, ValorReclamadoDepois, ValorProvavelDepois, ValorTotalAntes, ValorApoio: double;
  ValorReclamadoAntes, ValorProvavelAntes, CodObj: variant;
  ProxSeq, Ind, Tam, liExercicio, liPeriodo, iEmpresa, FlgSitAntes, FlgSitDepois: integer;
  sMensagem, sMascara, sMesRef, sSql: string;
  FazContab, FazCAP, AlterouValores: boolean;

implementation

uses uCMTypes, uMensErro, uDataBase, uValorAtual, fValorReal, fTelaAut, uSistema, uLancContab,
  uFuncoesUteisRH, uDocumento, fPrincipal, uIntegraBack, dBaseDados, fProcuraPessoaDoc;

{$R *.DFM}

procedure TfrmCadProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);

  sMesRef := copy(DateToStr(Date),7,4) + copy(DateToStr(Date),3,2);

  qryDocumentos.Prepare;
  tblParam.Open;
  qryMoeda.Open;
  qryRegra.Open;
  tblTipObj.Open;
  qryTipoObj.Open;
  qryVara.Open;
  tblTipSent.Open;
  tblTRT.Open;
  qryTipoEtapa.Open;

  qry.Close;
  qry.ParamByName('NumProcTrab').Value := 0;
  qry.Open;

  qryLitis.Close;
  qryLitis.ParamByName('NumProcTrab').Value := 0;
  qryLitis.Open;

  qryEtapa.Close;
  qryEtapa.ParamByName('NumProcTrab').Value := 0;
  qryEtapa.Open;

  qryObjeto.Close;
  qryObjeto.ParamByName('NumProcTrab').Value := 0;
  qryObjeto.Open;

  tblTipRec.Open;
  qryTipoProc.Open;
  qryAdvCasa.Open;
  qryTipAcao.Open;

  // Pega Máscara do Plano de Contas
  if (tblParam.FieldByName('FLGINTEGRACONT').asInteger = 1) then
  begin
     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add('SELECT PL.MASCARA, PR.PLANO FROM PLANO PL, PARAMCONTAB PR ');
     qryAux2.SQL.Add('WHERE PR.PLANO = PL.PLANO AND PR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
     qryAux2.Open;
     sMascara  := qryAux2.Fields[0].asString;
     qryAux2.Close;

     qryAux2.SQL.Clear;
     qryAux2.SQL.Add ('SELECT IDPATRO, IDPLANOPREV FROM PARALMOX');
     qryAux2.Open;
     iIDPatro     := IFF(Sistema.UsaPlanoPatro, qryAux2.FieldByName('IDPATRO').asInteger, -1);
     iIDPlanoPrev := IFF(Sistema.UsaPlanoPatro, qryAux2.FieldByName('IDPLANOPREV').asInteger, -1);
     qryAux2.Close;

     qryTipoOper.Open;

  end;

  if (tblParam.FieldByName('FLGINTEGRACAP').asInteger = 1) then
  begin
    qryTipoDoc.Close;
    qryTipoDoc.ParamByName('RecPag').asString :=
      IFF(qry.FieldByName('FLGPARTEATIVA').asInteger = 1, 'R', 'P');
    qryTipoDoc.Open;
    dtPagamento.Date := Date;

    qryTipoDesemb.Close;
    qryTipoDesemb.ParamByName('RecPag').asString :=
      IFF(qry.FieldByName('FLGPARTEATIVA').asInteger = 1, 'R', 'P');
    qryTipoDesemb.Open;

    IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB',
      IFF(qry.FieldByName('FLGPARTEATIVA').asInteger = 1, 'R', 'P'));
  end;
  gbxContabilizacao.Visible := (tblParam.FieldByName('FLGINTEGRACONT').asInteger = 1);
  pgCtrlOutrosDados.ActivePageIndex := 0;

  // Atribuo componentes Regra do Form para o Cálculo
  compRegra  := Regra;
  qryInRegra := qryIn;
end;

procedure TfrmCadProcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryDocumentos.UnPrepare;
  inherited;
  if Assigned(frmProcuraPessoaDoc) then
    FreeAndNil(frmProcuraPessoaDoc);
end;

procedure TfrmCadProcesso.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(edNomeRequerente.Text) = '') then
  begin
    MsgDlg('Contraparte Não Identificada','Aviso',mtInformation,[mbOk,mbHelp],0);
    gbxRequerente.SetFocus;
    exit;
  end;

  if (ds.Dataset.State = dsInsert) and not(qry.FieldByName('DATANOTIF').IsNull) then
    qry.FieldByName('DATAPREVENCER').Value := qry.FieldByName('DATANOTIF').Value + int(365.25 * 5);

  sMensagem    := '';
  iEmpresa     := Sistema.idEmpresa;
  FlgSitDepois := rgSituacao.ItemIndex;

  FazContab := (tblParam.FieldByName('FLGINTEGRACONT').asInteger = 1) and
               (AlterouValores) and (TESTAPERIODO(true,'BaseDados',DateToStr(Date),
               IntToStr(Sistema.idModulo),liExercicio,liPeriodo,iEmpresa, sMensagem) = 0);

  FazCAP := (gbxCAP.Visible) and (FlgSitDepois = 1) and (AlterouValores);

  if (((FazContab) and (dblcTipOper.Text = '')) or
      ((FazCAP) and ((dblcTipoDoc.Text = '') or (dblcTipoDesemb.Text = '')))) then
  begin
    pgCtrlOutrosDados.ActivePage := tbsContabCAP;
    pgctrlDetalhe.ActivePage     := tbshOutrosDados;
    tbcDetalhe.TabIndex          := tbshOutrosDados.PageIndex;
    tbcDetalhe.Repaint;
    MsgDlg('Complemente os dados requeridos para a integração Contábil e/ou do Contas a Pagar/Receber',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;
  inherited;
end;

procedure TfrmCadProcesso.rgTipEncerClick(Sender: TObject);
begin
  if (rgTipEncer.ItemIndex = 1) or (rgTipEncer.ItemIndex = 3) then
  begin
    qryObjeto.First;
    if not(qryObjeto.EOF) then
    begin
      AbrirFormModal(frmValorReal, TfrmValorReal);
      if (frmValorReal.ModalResult = mrOk) then
      begin
        qryObjeto.First;
        while not(qryObjeto.EOF) do
        begin
          qry.FieldByName('CUSTOPROC').Value := qry.FieldByName('CUSTOPROC').Value -
            qryObjeto.FieldByName('VALORESPERADO').Value +
            qryObjeto.FieldByName('VALORSENTENCA').Value;
          qryObjeto.Next;
        end;
        qryObjeto.First;
        AlterouValores := true;
      end
      else
        MsgDlg('Não Esqueça de Atualizar os Valores Reais dos Objetos',
          'Aviso',mtInformation,[mbOk, mbHelp], 0);
    end;
  end;

  gbxAcordo.Visible := (rgTipEncer.ItemIndex = 1);
  gbxSent.Visible   := (rgTipEncer.ItemIndex = 3);
end;

procedure TfrmCadProcesso.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    BuscaProcesso(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadProcesso.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SelecionaRequerente;
  
  dbreCustoChange(nil);
  gbxCAP.Visible := (tblParam.Active) and (rgSituacao.ItemIndex = 1) and
                    (tblParam.FieldByName('FLGINTEGRACAP').asInteger = 1);

  lblSitReq.Caption := IFF(qry.FieldByName('IDMOTIVO').IsNull, 'Normal', 'Excl. Por');
  
  qryEtapa.Close;
  qryEtapa.ParamByName('NumProcTrab').asFloat := qry.FieldByName('NUMPROCTRAB').asFloat;
  qryEtapa.Open;

  tbshEncer.Visible    := (rgSituacao.ItemIndex = 1);
  rgTipEncer.Visible   := (rgSituacao.ItemIndex = 1);
  gbxDataEncer.Visible := (rgSituacao.ItemIndex = 1);
  gbxAcordo.Visible    := (rgTipEncer.ItemIndex = 1);
  gbxSent.Visible      := (rgTipEncer.ItemIndex = 3);
  lblValReal.Visible   := (rgSituacao.ItemIndex = 1);
  dbedValReal.Visible  := (rgSituacao.ItemIndex = 1);

  dbreCustoChange(Self);
  MudaReclamante;
  spbApagaVinc.Enabled := qry.FieldByName('IDPROCVINCULADO').Value <> Null;
  MudaCidade;
end;

procedure TfrmCadProcesso.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) and
     (Trim(edLitisconsorte.Text) = '') then
  begin
    MsgDlg('Litisconsorte Não Identificado','Aviso',mtInformation,[mbOk,mbHelp],0);
    gbxLitisconsorte.SetFocus;
    exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(dblcTipObj.Text) = '') then
  begin
    MsgDlg('Tipo de Objeto Não Identificado','Aviso',mtInformation,[mbOk,mbHelp],0);
    dblcTipObj.SetFocus;
    exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (dbedValRecl.Value = 0) and
     (MsgDlg('Valor Reclamado Não Informado. Deseja informar agora?','Aviso',
      mtConfirmation,[mbYes,mbNo],0) = mrYes) then
  begin
    dbedValRecl.SetFocus;
    exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (edValor.Value = 0) and
     (dbedPerc.Value = 0) and (dbedValRecl.Value > 0) and 
     (MsgDlg('Valor Esperado Zero. Confirma ?','Confirmação',
      mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
  begin
    dbedPerc.SetFocus;
    Exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (edValor.Value <> 0) and
     (dbedPerc.Value = 0)  and (dbedValRecl.Value > 0) then
    dbedPerc.Value := edValor.Value * 100 / dbedValRecl.Value;

  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
  begin
    if (dtedDataReal.Text = '') then
    begin
      MsgDlg('Preencha a Data (Prevista ou Real)','Aviso',mtInformation,[mbOk,mbHelp],0);
      dtedDataReal.SetFocus;
      exit;
    end;

    if (dblcTipoEtp.Text = '') then
    begin
      MsgDlg('Preencha o Tipo de Etapa','Aviso',mtInformation,[mbOk,mbHelp],0);
      dblcTipoEtp.SetFocus;
      exit;
    end;

{    if (dbedAssunto.Text = '') then
    begin
      MsgDlg('Preencha o Assunto','Aviso',mtInformation,[mbOk,mbHelp],0);
      dbedAssunto.SetFocus;
      exit;
    end;
}    
  end;

  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    AlterouValores := true
  else
  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) then
    edLitisconsorte.Text := '';
end;

procedure TfrmCadProcesso.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('NUMPROCTRAB').Value   := LeUltRegistro(nil,'PROCESSOTRAB');
  qry.FieldByName('FLGSITPROC').Value    := 0;
  qry.FieldByName('CUSTOPROC').Value     := 0;
  qry.FieldByName('DESPESAPROC').Value   := 0;
  qry.FieldByName('DATAPREVENCER').Value := Date + round(365.25 * 5);
  qry.FieldByName('INDMATERIA').Value    := 4;
  qry.FieldByName('INDTAXACONV').Value   := 0;
  qry.FieldByName('MOEDAPROCTRAB').Value := tblParam.FieldByName('MOEDAPROCTRAB').Value;
//  qry.FieldByName('FLGSITPROC').Value    := 0;
//  qry.FieldByName('INDMATERIA').Value    := 4;
  ProxSeq         := 1;
  ValorTotalAntes := 0;
  AlterouValores  := false;
end;

procedure TfrmCadProcesso.rgAtivoChange(Sender: TObject);
begin
  if (tblParam.FieldByName('FLGINTEGRACAP').asInteger = 1) then
  begin
    qryTipoDoc.Close;
    qryTipoDoc.ParamByName('RecPag').asString := IFF(rgAtivo.ItemIndex = 1, 'R', 'P');
    qryTipoDoc.Open;

    qryTipoDesemb.Close;
    qryTipoDesemb.ParamByName('RecPag').asString := IFF(rgAtivo.ItemIndex = 1, 'R', 'P');
    qryTipoDesemb.Open;
    IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB', IFF(rgAtivo.ItemIndex = 1, 'R', 'P'));
  end;
end;

procedure TfrmCadProcesso.dbreCustoChange(Sender: TObject);
begin
  inherited;
  if (qryPartic.Active) then
    redValorAtual.Value := ValorAtual(qry.FieldByName('CUSTOPROC').asFloat,
                                      qry.FieldByName('DATANOTIF').asString,
                                      qry.FieldByName('MOEDAPROCTRAB').asString,
                                      qry.FieldByName('IDREGRA').asString,
                                      qry.FieldByName('NUMPROCTRAB').asString,
                                      dbrgIndTaxaConv.ItemIndex);
end;

procedure TfrmCadProcesso.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    dblcTipObj.SetFocus
  else
  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
    dblcTipoEtp.SetFocus
  else
  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) then
    edLitisconsorte.Text := qryLitis.FieldByName('NOME').asString;
end;

procedure TfrmCadProcesso.spbProcVincClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')  and
     ((ds.Dataset.State = dsInsert) or (ds.Dataset.State = dsEdit)) then
  begin
    qry.FieldByName('IDPROCVINCULADO').Value := StrToFloat(MontaSelect.ValoresChave[0]);
    spbApagaVinc.Enabled := true;
  end;
end;

procedure TfrmCadProcesso.rgSituacaoClick(Sender: TObject);
begin
  if (rgSituacao.ItemIndex = 0) then
  begin
    if (MsgDlg('Deseja Reabrir o Processo?', LerMensagem(4),
               mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      qry.FieldByName('FLGSITPROC').Value  := 0;
      qry.FieldByName('DATAEFETENC').Value := Null;
      bbtnConfirmarClick(rgSituacao);
    end
    else
    begin
      rgSituacao.OnClick   := nil;
      rgSituacao.ItemIndex := 1;
      rgSituacao.OnClick   := rgSituacaoClick;
    end;
  end
  else
  begin
    if (MsgDlg('Deseja Encerrar o Processo?', LerMensagem(4),
               mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    begin
      bbtnCancelarClick(rgSituacao);
      rgSituacao.OnClick   := nil;
      rgSituacao.ItemIndex := 0;
      rgSituacao.OnClick   := rgSituacaoClick;
    end
    else
    begin
      qry.FieldByName('DATAEFETENC').Value := date;
      pgctrlDetalhe.ActivePage := tbshEncer;
      AlterouValores           := true;
    end;
  end;
  tbshEncer.Visible    := (rgSituacao.ItemIndex = 1);
  rgTipEncer.Visible   := (rgSituacao.ItemIndex = 1);
  gbxDataEncer.Visible := (rgSituacao.ItemIndex = 1);
  lblValReal.Visible   := (rgSituacao.ItemIndex = 1);
  dbedValReal.Visible  := (rgSituacao.ItemIndex = 1);
end;

procedure TfrmCadProcesso.spbApagaVincClick(Sender: TObject);
begin
  inherited;
  if (MsgDlg('Confirma a Excluão do Vínculo?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    exit;

  if (ds.State <> dsEdit) and (ds.State <> dsInsert) then
    ds.Dataset.Edit;

  qry.FieldByName('IDPROCVINCULADO').Value := Null;
  qry.FieldByName('FLGVINCULADO').Value    := Null;
  spbApagaVinc.Enabled := false;
end;

procedure TfrmCadProcesso.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryProcVinc.Open;
  qryUF.Open;
end;

procedure TfrmCadProcesso.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
     if (dblcTipObj.CanFocus) then
       dblcTipObj.SetFocus;

  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) then
     if (edLitisconsorte.CanFocus) then
       edLitisconsorte.SetFocus;

  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
     if (dblcTipoEtp.CanFocus) then
       dblcTipoEtp.SetFocus;
end;


procedure TfrmCadProcesso.CmeCadastroConfirma(Sender: TObject);
var
  Ind1, NumDias, NumMeses, NumAnos: integer;
  Planilha, Pln: LongInt;
  ValCAP, dTotal: double;
begin
  if (tblParam.FieldByName('FLGCRIASUBCONTA').asInteger = 1) then
  begin
    qrySubContaAux.Close;
    qrySubContaAux.ParamByName('IDPESSOA').asInteger    := Sistema.IdEmpresa;
    qrySubContaAux.ParamByName('NOMESUBCONTA').asString := Trim(edNomeRequerente.Text);
    qrySubContaAux.Open;

    if not(qrySubContaAux.EOF) then
      // CAMILLE - FUNCEF - 30.08.2001
      if (qry.State in [dsInsert, dsEdit]) then
        qry.FieldByName('CODSUBCONTA').asInteger := qrySubContaAux.FieldByName('CODSUBCONTA').asInteger
      else
      begin
        if not(qrySubConta.Active) then
        begin
          qrySubConta.ParamByName('CODSUBCONTA').asInteger := -1;
          qrySubConta.Open;
        end;
        qrySubConta.Insert;
        qrySubConta.FieldByName('CODSUBCONTA').asInteger := LeUltRegistro(nil,'SUBCONTA');
        qrySubConta.FieldByName('IDPESSOA').asInteger    := Sistema.IdEmpresa;
        qrySubConta.FieldByName('NOMESUBCONTA').asString := Trim(edNomeRequerente.Text);
        qrySubConta.Post;

        // CAMILLE - FUNCEF - 30.08.2001
        if (qry.State in [dsInsert, dsEdit]) then
          qry.FieldByName('CODSUBCONTA').asInteger := qrySubConta.FieldByName('CODSUBCONTA').asInteger;
      end;
  end;

  inherited;

  try
    AplicaAlteracoes([qryObjeto, qryLitis, qryEtapa, qrySubConta]);
  except
    raise;
  end;                     

  if (FazCAP) then
    frmPrincipal.prmCodTipDoc := dblcTipoDoc.LookupValue;

  if (FazContab) or (FazCAP) then // Contabilização e/ou Contas a Pagar/Receber
  begin
    qryValores.Close;
    qryValores.ParamByName('NumProcTrab').asFloat := qry.FieldByName('NUMPROCTRAB').asFloat;
    qryValores.Open;

    while not(qryValores.EOF) do
    begin
      {ValorReclamadoDepois := ValorAtual(qryValores.FieldByName('ValorReclamado').asFloat,
         qry.FieldByName('DATANOTIF').asString,
         qry.FieldByName('MOEDAPROCTRAB').asString,
         qry.FieldByName('IDREGRA').asString,
         qry.FieldByName('NUMPROCTRAB').asString,
         qry.FieldByName('INDTAXACONV').asInteger);}
      ValorApoio := qryValores.FieldByName('ValorProvavel').asFloat;

      if (qry.FieldByName('FLGSITPROC').asInteger = 1) then
        ValorApoio := qryValores.FieldByName('ValorSentenca').asFloat;
         
      ValorReclamadoDepois := ValorApoio;
      ValorProvavelDepois  := ValorAtual(ValorApoio,
                              IFF(qry.FieldByName('FLGSITPROC').asInteger = 0,
                                  qry.FieldByName('DATANOTIF').asString,
                                  qry.FieldByName('DATAEFETENC').asString),
                              qry.FieldByName('MOEDAPROCTRAB').asString,
                              qry.FieldByName('IDREGRA').asString,
                              qry.FieldByName('NUMPROCTRAB').asString,
                              qry.FieldByName('INDTAXACONV').asInteger) - ValorApoio;

      if (FazCAP) and (flgSitAntes = 0) then
        ValCAP := ValCAP + ValorProvavelDepois + ValorApoio;

      if (ValorTotalAntes > 0) then
        for Ind:=1 to Tam do
          if (qryValores.FieldByName('CODTIPOOBJETO').asInteger = CodObj[Ind]) then
          begin
            ValorReclamadoDepois := ValorReclamadoDepois - ValorReclamadoAntes[Ind];
            ValorProvavelDepois  := ValorProvavelDepois  - ValorprovavelAntes[Ind];
             
            if (FazCAP) and (flgSitAntes = 1) then
              ValCAP := ValCAP + ValorProvavelDepois + ValorReclamadoDepois;
          end;

      // Rotina de Lançamento Contabil e/ou Contas a Pagar/Receber
      for Ind1:=0 to 2 do
      begin
        if (Ind1 = 0) then
          ValorApoio := ValorReclamadoDepois
        else
        if (Ind1 = 1) then
          ValorApoio := ValorProvavelDepois
        else
        if (Ind1 = 2) then
        begin
          CalculaDifData(IFF(qry.FieldByName('FLGSITPROC').asInteger = 0,
                         qry.FieldByName('DATANOTIF').asString,
                         qry.FieldByName('DATAEFETENC').asString),DateToStr(Date),
                         NumDias, NumMeses, NumAnos);
          if (rgJuros.ItemIndex = 0) then
            ValorApoio := ValorReclamadoDepois * NumMeses * redJuros.Value / 100
          else
            ValorApoio := JuroComposto(ValorReclamadoDepois, NumMeses, redJuros.Value);
             
          if (FazCAP) then
            ValCAP := ValCAP + ValorApoio;
        end;

        if (ValorApoio <> 0) and (FazContab) then  // Rotina de Lançamento Contabil
        begin
          sSql:='SELECT C.IDPLANO1,C.IDPLANO2,C.CONTADEBITO, '+
                'C.CONTACREDITO,C.INDMATERIA,'+
                'TP.DESCRICAO '+
                ' FROM CONTABJURID C, TIPOOBJPROCTRAB TP'+
                ' WHERE (C.CODTIPOOBJETO = '+qryValores.FieldByName('CODTIPOOBJETO').asString+')'+
                ' AND (C.INDMATERIA = ' + qry.FieldByName('INDMATERIA').asString + ')'+
                ' AND (C.INDPRINCIPAL  = ' + IntToStr(Ind1) + ')'+
                ' AND (C.CODTIPOOBJETO = TP.CODTIPOOBJETO) ';

          qryAux2.Close;
          qryAux2.SQL.Text := sSql;
          qryAux2.Open;
          if (qryAux2.IsEmpty) then
          begin
            sSql:='SELECT C.IDPLANO1,C.IDPLANO2,C.CONTADEBITO, '+
                  'C.CONTACREDITO,C.INDMATERIA,'+
                  'TP.DESCRICAO '+
                  ' FROM CONTABJURID C, TIPOOBJPROCTRAB TP'+
                  ' WHERE (C.CODTIPOOBJETO = '+qryValores.FieldByName('CODTIPOOBJETO').asString+')'+
                  ' AND (C.INDMATERIA    = 0)'+
                  ' AND (C.INDPRINCIPAL  = ' + IntToStr(Ind1) + ')'+
                  ' AND (C.CODTIPOOBJETO = TP.CODTIPOOBJETO) ';

            qryAux2.Close;
            qryAux2.SQL.Text:=sSql;
            qryAux2.Open;
          end;

          if not(qryAux2.IsEmpty) then
          begin
            if (Trim(qryAux2.FieldByName('CONTADEBITO').asString) <> '') then
            begin
              try
                Planilha:=LANCACONTAB(true,'BASEDADOS',DateToStr(Date),
                  InttoStr(Sistema.IdModulo),'0',
                  'D','','','','','','','','','','',sMesRef,
                  copy(qryValores.FieldByName('CODTIPOOBJETO').asString + '     ',1,7),
                  copy(qryAux2.FieldByName('DESCRICAO').asString,1,40),
                  sMesRef, '', '',
                  qryTipoOper.FieldByName('TIPCODIGO').asString,
                  '',
                  qryAux2.FieldByName('CONTADEBITO').asString,
                  '',
                  '',
                  liExercicio, liPeriodo,Sistema.IdEmpresa,
                  Sistema.IdUsuario,
                  qryAux2.FieldByName('IDPLANO2').asInteger,
                  ValorApoio,0,0,0,0,0,0,0,0,'',
                  false,0,0,qry.FieldByName('CODSUBCONTA').asString,'',
                  '','',Pln, sMensagem,sMascara,true,0,
                  iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
                pln := planilha;
              except
                on E:EDBEngineError do
                begin
                  MostrarErro(E);
                  pln := planilha;
                  if pln < 0 then break;
                end;
              end;//try
            end;

            if (Trim(qryAux2.FieldByName('CONTACREDITO').asString) <> '') then
            begin
              try
                Planilha:=LANCACONTAB(true,'BASEDADOS',DateToStr(Date),
                  InttoStr(Sistema.IdModulo),'1',
                  'C','','','','','','','','','','',sMesRef,
                  copy(qryValores.FieldByName('CODTIPOOBJETO').asString + '     ',1,7),
                  copy(qryAux2.FieldByName('DESCRICAO').asString,1,40),
                  sMesRef, '', '',
                  qryTipoOper.FieldByName('TIPCODIGO').asString,
                  '',
                  '',
                  '',
                  qryAux2.FieldByName('CONTACREDITO').asString,
                  liExercicio, liPeriodo,Sistema.IdEmpresa,
                  Sistema.IdUsuario,
                  qryAux2.FieldByName('IDPLANO1').asInteger,
                  ValorApoio,0,0,0,0,0,0,0,0,'',
                  false, 0, 0, '', qry.FieldByName('CODSUBCONTA').asString,
                  '','',Pln, sMensagem,sMascara,true,0,
                  iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
                pln := planilha;
              except
                on E:EDBEngineError do
                begin
                  MostrarErro(E);
                  pln := planilha;
                  if pln < 0 then break;
                end;
              end;//try
            end;
          end;
        end; // Fim ValorApoio <> 0 and FazContab (Rotina de Lançamento Contabil)
      end; // Fim da Rotina de Lançamento Contabil e/ou CAP
      qryValores.Next;
     end;  // Fim do Loop de qryValores

     if (FazCAP) and (ValCAP > 0) then  // Rotina de Lançamento Contas a Pagar/Receber
     begin
       qryDocumentos.ParamByName('CODDOCUMENTO').asInteger := -1;
       qryDocumentos.Open;

       with (qryAux2) do
       begin
         iPortadorFormaDefault:=0; iUltIdBanco:=0;
         Close;
         SQL.Clear;
         SQL.Add('SELECT CODPORTFORMA FROM BANCOPORTFOLHA WHERE (IDBANCO IS NULL)');
         Open;

         if not(IsEmpty) then
           iPortadorFormaDefault := FieldByName('CODPORTFORMA').asInteger;

         Close;

  {       SQL.Clear;
         SQL.Add('SELECT PC.IDBANCO');
         SQL.Add('FROM');
         SQL.Add('  PORTADORFORMA PF, PORTADORCONTA PC');
         SQL.Add('WHERE');
         SQL.Add('  (PF.CODPORTFORMA = ' +IntToStr(iPortadorFormaDefault)+ ') AND');
         SQL.Add('  (PF.CODPORTADOR  = PC.CODPORTADOR)');
         Open;

         if not(IsEmpty) then
           iUltIdBanco := FieldByName('IDBANCO').asInteger;

         Close;}
       end;
       frmPrincipal.prmCodTipDoc := dblcTipoDoc.LookupValue;

       if (AlimentaQryDocumentos(qryDocumentos,
           -1,
           -1,
           -1,
           IFF(frmPrincipal.prmUnidNegoc <> 0, frmPrincipal.prmUnidNegoc, -1),
           iPortadorFormaDefault,
           '',
           IFF(frmPrincipal.prmCodCentroRespon <> '',
               frmPrincipal.prmCodCentroRespon,'9999999999'),
           qryTipoDesemb.FieldByName('CODTIPRECDES').asString,
           qryTipoDesemb.FieldByName('RECPAG').asString,
           'D',
           ValCAP,
           sMensagem,
           0,
           ''))  then
       begin
         qryDocumentos.First;
         dTotal:=0;
         while not(qryDocumentos.EOF) do
         begin
           if (qryDocumentos.FieldByName('DEBCRE').asString = 'D') then
             dTotal := dTotal + qryDocumentos.FieldByName('VALOR').asFloat
           else
             dTotal := dTotal - qryDocumentos.FieldByName('VALOR').asFloat;

           qryDocumentos.Next;
         end;
         iUltIdBanco := qry.FieldByName('IDRECLAMANTE').asInteger;
         qryDocumentos.First;
         iCodDocumento := DescarregaQryDocumentos(
           qryDocumentos,
           iUltIdBanco,
           pln,
           IntToStr(iPortadorFormaDefault),
           Copy(sMesRef,6,2),
           Copy(sMesRef,1,4),
           dTotal,
           StrToDate(dtPagamento.Text),
           Documento,
           false);
         qryDocumentos.CancelUpdates;

         //dtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Contas a Pagar ou Receber do Processo efetuada: Doc. Num. ' + IntToStr(iCodDocumento),
                'Informação',mtInformation,[mbOk,mbHelp],0);
       end;
       qryDocumentos.Close;
     end;  // Fim da Rotina de Lançamento Contas a Pagar/Rceber

     IniciaValoresContabeis; // a nova situação passa a ser a "anterior", caso
                             // o usuário faça nova atualização
  end;

  if (FazContab) and (pln > 0) then
  begin
    qryAux2.Close;
    qryAux2.SQL.Clear;
    qryAux2.SQL.Add('SELECT PLNPLANIL FROM PLANILHA WHERE PLNCODIGO = ' + IntToStr(pln));
    qryAux2.Open;
    pln := qryAux2.FieldByName('PLNPLANIL').asInteger;
    MsgDlg('Contabilização do Processo efetuada: Planilha Num. ' + IntToStr(pln),
           'Informação',mtInformation,[mbOk,mbHelp],0);
  end;

  if (FazContab) and (pln <= 0) then
    MsgDlg('Contabilização do Processo Não Efetuada: Parâmetros Insuficientes',
           'Informação',mtInformation,[mbOk,mbHelp],0);
end; 

procedure TfrmCadProcesso.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) and (dblcTipObj.CanFocus) then
    dblcTipObj.SetFocus;

  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) then
  begin
    qryLitis.FieldByName('NUMPROCTRAB').asString := qry.FieldByName('NUMPROCTRAB').asString;
    if (edLitisconsorte.CanFocus) then
      edLitisconsorte.SetFocus;
  end;

  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
  begin
    qryEtapa.FieldByName('NUMPROCTRAB').asString := qry.FieldByName('NUMPROCTRAB').asString;
    if (dblcTipoEtp.CanFocus) then
      dblcTipoEtp.SetFocus;
  end;
end;

procedure TfrmCadProcesso.qryLitisBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryLitis.State in [dsInsert, dsEdit]) then
  begin
    qryLitis.FieldByName('NOME').asString := edLitisconsorte.Text;
    qryLitis.FieldByName('SITUACAO').asString :=
      IFF(dblcMotivoLit.Text = '', 'Normal', dblcMotivoLit.Text);
    qryLitis.FieldByName('CATEGORIA').AsString :=
      iff(qryLitis.FieldByName('INDTESTEMUNHA').AsInteger = 0, 'Listisconsorte C.Parte',
        iff(qryLitis.FieldByName('INDTESTEMUNHA').AsInteger = 1,'Testemunha C.Parte',
        iff(qryLitis.FieldByName('INDTESTEMUNHA').AsInteger = 2,'Nossa Testemunha',
        'Nossa Listisconsorte')));
  end;
end;

procedure TfrmCadProcesso.sbtnProcurarClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'sbtnProcurar') then
  begin
    MontaSelect.Filtro.Clear;
    MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    > 3');
    MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
    MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA .IDVARAJUSTICA (+)');
    MontaSelect.Tabelas.Clear;
    MontaSelect.Tabelas.Add('PESSOA');
    MontaSelect.Tabelas.Add('PROCESSOTRAB');
    MontaSelect.Tabelas.Add('VARAJUSTICA');
  end;
  inherited;
end;

procedure TfrmCadProcesso.sbtnProcurarLitisClick(Sender: TObject);
begin
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    > 3');
  MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA   = PESSOA.IDPESSOA)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA .IDVARAJUSTICA (+)');
  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  MontaSelect.Tabelas.Add('PROCESSOTRAB');
  MontaSelect.Tabelas.Add('VARAJUSTICA');
  MontaSelect.Tabelas.Add('COPARTPROCTRAB');
  sbtnProcurarClick(Sender);
  sbtnProcurarLitis.Down := false;
end;

procedure TfrmCadProcesso.qryEtapaBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  ValAntes := qryEtapa.FieldByName('VALORREC').asFloat *
    (1 - qryEtapa.FieldByName('FLGVALORABATE').asInteger);
end;

procedure TfrmCadProcesso.dblcTipoEtpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (sbtnInsDet.Down) and (qryEtapa.FieldByName('ValorHonor').asFloat <> 0) then
  begin
    lblHonor.Visible := true;
    redHonor.Visible := true;
    redHonor.Value   := qryEtapa.FieldByName('ValorHonor').asFloat;
  end;
end;

procedure TfrmCadProcesso.qryEtapaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dtedDataReal.Text := '';
  mskedHora.Text    := '';
  if not(qryEtapa.FieldByName('DATAREALOCOR').IsNull) then
  begin
    dtedDataReal.Date := StrToDate(DateToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime));
    mskedHora.Text    := Copy(qryEtapa.FieldByName('DATAREALOCOR').asString,12,5);
  end;
end;

procedure TfrmCadProcesso.qryEtapaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryEtapa.State = dsInsert) then
    qryEtapa.FieldByName('NumProcTrab').Value := qry.FieldByName('NumProcTrab').Value;

  if (qryEtapa.State in [dsEdit, dsInsert]) then
  begin
    qryEtapa.FieldByName('Descricao').asString := qryTipoEtapa.FieldByName('Descricao').asString;

    // Deposito e Despesa entram no campo DESPESAPROC
    //qry.Edit;

    qry.FieldByName('DESPESAPROC').asFloat := qry.FieldByName('DESPESAPROC').asFloat +
      qryEtapa.FieldByName('VALORREC').asFloat *
      (1 - qryEtapa.FieldByName('FLGVALORABATE').asInteger) - ValAntes;

    //qry.Post;

    if (redHonor.Value <> 0) and (redHonor.Visible) and
       not(qry.FieldByName('IDADVOGRECDA').IsNull) then
    begin
      if not(tblHonor.Active) then
        tblHonor.Open;
      tblHonor.Insert;
      tblHonor.FieldByName('NUMPROCTRAB').Value    := qry.FieldByName('NUMPROCTRAB').Value;
      tblHonor.FieldByName('DATAPAGTOHONOR').Value := Date;
      tblHonor.FieldByName('IDFORNSERV').Value     := qry.FieldByName('IDADVOGRECDA').Value;
      tblHonor.FieldByName('VALORHONOR').asFloat   := redHonor.Value;
      tblHonor.Post;
    end;
    lblHonor.Visible := false;
    redHonor.Visible := false;
    redHonor.Value   := 0;

    if (mskedHora.Text = '  :  ') then
      qryEtapa.FieldByName('DATAREALOCOR').Value := dtedDataReal.Date
    else
      qryEtapa.FieldByName('DATAREALOCOR').AsDateTime := dtedDataReal.Date +
        StrToTime(mskedHora.Text);
  end;
end;

procedure TfrmCadProcesso.qryEtapaBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  ProxSeq := ProxSeq + 1;
end;

procedure TfrmCadProcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelecionaRequerente;

  qryNumSeq.Close;
  qryNumSeq.ParamByName('NumProc').asString := qry.FieldByName('NUMPROCTRAB').asString;
  qryNumSeq.Open;

  ProxSeq := qryNumSeq.FieldByName('ULTSEQ').asInteger;
end;

procedure TfrmCadProcesso.bbtnCancelarDetClick(Sender: TObject);
begin
  if (dsDet.Dataset.State = dsInsert) and (pgctrlDetalhe.ActivePage = tbsEtapas) then
    ProxSeq := ProxSeq - 1;
  inherited;
end;

procedure TfrmCadProcesso.qryEtapaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryEtapa.FieldByName('NUMSEQ').Value := ProxSeq;
end;

procedure TfrmCadProcesso.bbtnVoltarDetClick(Sender: TObject);
begin
  if (dsDet.Dataset.State = dsInsert) and (pgctrlDetalhe.ActivePage = tbsEtapas) then
    ProxSeq := ProxSeq - 1;
  inherited;
end;

procedure TfrmCadProcesso.ProcuraCidadeValidaDados(Sender: TObject);
begin
  inherited;
  MudaCidade;
end;

procedure TfrmCadProcesso.dbrgIndTaxaConvChange(Sender: TObject);
begin
  inherited;
  gbxIndice.Visible := (dbrgIndTaxaConv.ItemIndex = 0);
  gbxRegra.Visible  := (dbrgIndTaxaConv.ItemIndex = 1);
  dbreCustoChange(Self);
end;

procedure TfrmCadProcesso.dblcMoedaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
    dbreCustoChange(Self);
end;

procedure TfrmCadProcesso.dblcRegraNormalCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
    dbreCustoChange(Self);
end;

procedure TfrmCadProcesso.rgSituacaoChange(Sender: TObject);
begin
  gbxCAP.Visible := (tblParam.Active) and (rgSituacao.ItemIndex = 1) and
                    (tblParam.FieldByName('FLGINTEGRACAP').asInteger = 1);
end;

procedure TfrmCadProcesso.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  //Dock973.Visible := (pgctrlDetalhe.ActivePageIndex in [1,3,5]);
end;

procedure TfrmCadProcesso.qryLitisAfterScroll(DataSet: TDataSet);
begin
  lblSitLit.Caption := IFF(qryLitis.FieldByName('IDMOTIVO').IsNull, 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcesso.dblcMotivoReqChange(Sender: TObject);
begin
  lblSitReq.Caption := IFF(dblcMotivoReq.Text = '', 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcesso.dblcMotivoLitChange(Sender: TObject);
begin
  lblSitLit.Caption := IFF(dblcMotivoLit.Text = '', 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcesso.CmeCadastroDelete(Sender: TObject);
var
  sErro: string;
begin
  sErro := '';

  tblHonor.Close;
  try
    with (dtmBaseDados.qry) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM HONORARIOS WHERE NUMPROCTRAB = '+qry.FieldByName('NUMPROCTRAB').asString);
      ExecSQL;
    end;
  except
    sErro := CR_LF+' Honorários ';
  end;

  qryProcVinc.Close;
  try
    with (dtmBaseDados.qry) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE PROCESSOTRAB SET IDPROCVINCULADO = NULL');
      SQL.Add('WHERE  IDPROCVINCULADO = '+qry.FieldByName('NUMPROCTRAB').asString);
      ExecSQL;
    end;
  except
    sErro := sErro+CR_LF+' Processos vinculados ';
  end;

  if (qryObjeto.Active) and (qryObjeto.CachedUpdates) then
  begin
    qryObjeto.First;
    try
      while not(qryObjeto.EOF) do
        qryObjeto.Delete;
      AplicaAlteracoes([qryObjeto]);
    except
      sErro := sErro+CR_LF+' Objetos de Processo ';
    end;
  end;

  if (qryEtapa.Active) and (qryEtapa.CachedUpdates) then
  begin
    qryEtapa.First;
    try
      while not(qryEtapa.EOF) do
        qryEtapa.Delete;
      AplicaAlteracoes([qryEtapa]);
    except
      sErro := sErro+CR_LF+' Etapas ';
    end;
  end;

  if (qryLitis.Active) and (qryLitis.CachedUpdates) then
  begin
    qryLitis.First;
    try
      while not(qryLitis.EOF) do
        qryLitis.Delete;
      AplicaAlteracoes([qryLitis]);
    except
      sErro := sErro+CR_LF+' Litisconsortes ';
    end;
  end;

  if (qrySubConta.Active) and (qrySubConta.CachedUpdates) then
  begin
    qrySubConta.First;
    try
      while not(qrySubConta.EOF) do
        qrySubConta.Delete;
      AplicaAlteracoes([qrySubConta]);
    except
      sErro := sErro+CR_LF+' Sub Conta ';
    end;
  end;

  if (Trim(sErro) <> '') then
    MsgDlg('Não consegui excluir os itens relacionados abaixo:'+sErro+CR_LF+
           'Por favor verifique!','Aviso',mtWarning,[mbOk,mbHelp],0)
  else
    inherited;
end;

procedure TfrmCadProcesso.qryObjetoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryObjetoVALORESPERADO.Value := (qryObjetoVALORRECL.Value *
                                   qryObjetoPERCPROB.Value) / 100;
  edValor.Value := qryObjetoVALORESPERADO.Value;
end;

procedure TfrmCadProcesso.qryObjetoAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (qry.State in [dsInsert, dsEdit]) then
    qry.FieldByName('CUSTOPROC').Value := qry.FieldByName('CUSTOPROC').Value +
      (1 - rgSituacao.ItemIndex) * qryObjeto.FieldByName('VALORESPERADO').Value  +
      rgSituacao.ItemIndex * qryObjeto.FieldByName('VALORSENTENCA').Value - ValAntes;
end;

procedure TfrmCadProcesso.qryObjetoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if qryObjeto.FieldByName('VALORSENTENCA').asFloat = 0 then
    ValAntes := qryObjeto.FieldByName('VALORESPERADO').asFloat
  else
    ValAntes := qryObjeto.FieldByName('VALORSENTENCA').asFloat;
end;

procedure TfrmCadProcesso.qryObjetoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryObjeto.FieldByName('NUMPROCTRAB').asFloat   := qry.FieldByName('NUMPROCTRAB').asFloat;
  qryObjeto.FieldByName('VALORSENTENCA').asFloat := 0;
end;

procedure TfrmCadProcesso.qryObjetoBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryObjeto.FieldByName('DESCRICAO').asString := dblcTipObj.Text;
end;

procedure TfrmCadProcesso.bbtnProcRequerenteClick(Sender: TObject);
begin
  if (frmProcuraPessoaDoc.ShowModal = mrOk) and (qry.State in [dsInsert,dsEdit]) then
  begin
    if (TComponent(Sender).Name = 'bbtnProcRequerente') then
    begin
      qry.FieldByName('IDRECLAMANTE').asString := frmProcuraPessoaDoc.sIDPessoa;
      edNomeRequerente.Text := frmProcuraPessoaDoc.sNomePessoa;
    end
    else
    begin
      qryLitis.FieldByName('IDPESSOA').asString := frmProcuraPessoaDoc.sIDPessoa;
      edLitisconsorte.Text := frmProcuraPessoaDoc.sNomePessoa;
    end;
    MudaReclamante;
  end;
end;

procedure TfrmCadProcesso.BuscaProcesso(NumProcTrab : Real);
begin
   qry.Close;
   qry.ParamByName('NumProcTrab').Value := NumProcTrab;
   qry.Open;

   qryObjeto.Close;
   qryObjeto.ParamByName('NumProcTrab').Value := NumProcTrab;
   qryObjeto.Open;

   qryLitis.Close;
   qryLitis.ParamByName('NumProcTrab').Value := NumProcTrab;
   qryLitis.Open;

   if not(qryTipoEtapa.Active) then
     qryTipoEtapa.Open;

   qryNumSeq.Close;
   qryNumSeq.ParamByName('NumProc').Value := NumProcTrab;
   qryNumSeq.Open;
   
   ProxSeq := qryNumSeq.FieldByName('ULTSEQ').asInteger;

   IniciaValoresContabeis;

   qryAfterScroll(ds.Dataset);
end;

procedure TfrmCadProcesso.IniciaValoresContabeis;
begin
   AlterouValores := false;
   FlgSitAntes    := qry.FieldByName('FLGSITPROC').asInteger;
   if (tblParam.FieldByName('FLGINTEGRACONT').asInteger = 1) or
      (tblParam.FieldByName('FLGINTEGRACAP').asInteger = 1)  then
   begin
      qryValores.Close;
      qryValores.ParamByName('NumProcTrab').asFloat := qry.FieldByName('NumProcTrab').asFloat;
      qryValores.Open;
      Tam := qryValores.RecordCount;
      CodObj              := VarArrayCreate([1, Tam], varInteger);
      ValorReclamadoAntes := VarArrayCreate([1, Tam], varDouble);
      ValorProvavelAntes  := VarArrayCreate([1, Tam], varDouble);
      ValorTotalAntes := 0;
      Ind := 0;
      while not qryValores.EOF do
      begin
         inc(Ind);
         CodObj[Ind] := qryValores.FieldByName('CODTIPOOBJETO').asInteger;
         {ValorReclamadoAntes[Ind] := ValorAtual(qryValores.FieldByName('ValorReclamado').asFloat,
                                     qry.FieldByName('DATANOTIF').asString,
                                     qry.FieldByName('MOEDAPROCTRAB').asString,
                                     qry.FieldByName('IDREGRA').asString,
                                     qry.FieldByName('NUMPROCTRAB').asString,
                                     qry.FieldByName('INDTAXACONV').asInteger);
         }
         ValorApoio := qryValores.FieldByName('ValorProvavel').asFloat;

         if (qry.FieldByName('FLGSITPROC').asInteger = 1) then
           ValorApoio := qryValores.FieldByName('ValorSentenca').asFloat;

         ValorReclamadoAntes[Ind] := ValorApoio;
         ValorProvavelAntes[Ind]  := ValorAtual(ValorApoio,
                                     IFF(qry.FieldByName('FLGSITPROC').asInteger = 0,
                                         qry.FieldByName('DATANOTIF').asString,
                                         qry.FieldByName('DATAEFETENC').asString),
                                     qry.FieldByName('MOEDAPROCTRAB').asString,
                                     qry.FieldByName('IDREGRA').asString,
                                     qry.FieldByName('NUMPROCTRAB').asString,
                                     qry.FieldByName('INDTAXACONV').asInteger)
                                     - ValorApoio;
         ValorTotalAntes := ValorTotalAntes + ValorApoio;
         qryValores.Next;
      end;
   end;
end;

procedure TfrmCadProcesso.MudaReclamante;
begin
  qryPartic.Close;
  qryPartic.ParamByName('IDRECLAMANTE').asInteger := qry.FieldByName('IDRECLAMANTE').asInteger;
  qryPartic.Open;
end;

procedure TfrmCadProcesso.MudaCidade;
begin
  qryUF.Close;
  qryUF.ParamByName('IdCidades').asInteger := qry.FieldByName('IdCidades').asInteger;
  qryUF.Open;
end;

procedure TfrmCadProcesso.SelecionaRequerente;
begin
  qryRequerente.Close;
  qryRequerente.ParamByName('IDPESSOA').asFloat := qry.FieldByName('IDRECLAMANTE').asFloat;
  qryRequerente.Open;
  edNomeRequerente.Text := qryRequerente.FieldByName('NOME').asString;
end;

procedure TfrmCadProcesso.qryBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  qryObjeto.Close;
  qryObjeto.ParamByName('NumProcTrab').Value := 0;
  qryObjeto.Open;

end;

procedure TfrmCadProcesso.dbedNumJCJExit(Sender: TObject);
begin
  inherited;
  if (ds.State = dsInsert) then
  begin
    qryVerificaProcesso.Close;
    qryVerificaProcesso.ParamByName('NUMPROC').AsString := trim(dbedNumJCJ.Text);
    qryVerificaProcesso.Open;
    if not qryVerificaProcesso.IsEmpty then
      MsgDlg('Existe Processo com esse número.'+CR_LF+
             'Sugiro verificar em Consulta Processo de Qualquer Matéria',
             'Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
end;

end.
