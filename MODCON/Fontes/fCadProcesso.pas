unit fCadProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Wwtable, CMProcura, Mask, wwdblook, Wwdbspin, wwdbedit,
  TREdit, CMProcuraSubTipo, uRegra, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmCadProcesso = class(TfrmCadMestreDetalheCS)
    ds2: TwwDataSource;
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
    CMProcuraLitisEmpregado: TCMProcuraSubTipo;
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
    Label4: TLabel;
    dblcTRT: TwwDBLookupCombo;
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
    qryTRT: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label30: TLabel;
    Label19: TLabel;
    Label13: TLabel;
    dbedNumero: TDBEdit;
    dbedDataAju: TCMDateTimePicker;
    dbedNumJCJ: TDBEdit;
    dbedDataNot: TCMDateTimePicker;
    dbedJCJ: TDBEdit;
    rgSituacao: TDBRadioGroup;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    dbedCargoI: TDBEdit;
    dbedSalAtual: TDBEdit;
    dbrgTipoSalar: TDBRadioGroup;
    dbedAdm: TDBEdit;
    dbedDem: TDBEdit;
    dbedMotivo: TDBEdit;
    dbedEstab: TDBEdit;
    CMProcuraReclamante: TCMProcuraSubTipo;
    qrySubContaAux: TwwQuery;
    Label49: TLabel;
    dblcVara: TwwDBLookupCombo;
    qryMotivo: TwwQuery;
    gbxSitReq: TGroupBox;
    lblSitReq: TLabel;
    dblcMotivoReq: TwwDBLookupCombo;
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
    qryProcVincDELETE: TwwQuery;
    updProcVincDELETE: TUpdateSQL;
    Label5: TLabel;
    dblcTipObj: TwwDBLookupCombo;
    Label6: TLabel;
    dbedValRecl: TDBRealEdit;
    Label40: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label7: TLabel;
    dbedPerc: TDBRealEdit;
    Label24: TLabel;
    edValor: TRealEdit;
    lblValReal: TLabel;
    Label39: TLabel;
    dbmemObserv: TDBMemo;
    CMProcuraLitisEmpresa: TCMProcuraSubTipo;
    sbtnProcurarLitis: TToolbarButton97;
    dbedValReal: TDBRealEdit;
    spbtnParcelamento: TSpeedButton;
    dbrgCategoria: TDBRadioGroup;
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
    procedure CMProcuraRequerenteExit(Sender: TObject);
    procedure qryLitisBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryEtapaBeforeEdit(DataSet: TDataSet);
    procedure dblcTipoEtpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
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
    procedure IniciaValoresContabeis;
    procedure dblcMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcRegraNormalCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure rgSituacaoChange(Sender: TObject);
    procedure qryLitisAfterScroll(DataSet: TDataSet);
    procedure dblcMotivoReqChange(Sender: TObject);
    procedure dblcMotivoLitChange(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure qryObjetoCalcFields(DataSet: TDataSet);
    procedure qryObjetoAfterPost(DataSet: TDataSet);
    procedure qryObjetoBeforeEdit(DataSet: TDataSet);
    procedure qryObjetoAfterInsert(DataSet: TDataSet);
    procedure qryObjetoBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarLitisClick(Sender: TObject);
    procedure spbtnParcelamentoClick(Sender: TObject);
    procedure qryBeforeInsert(DataSet: TDataSet);
    procedure dbedNumJCJExit(Sender: TObject);
  private
    iIDPatro, iIDPlanoPrev: Integer;
    iCodDocumento, iUltIdBanco, iPortadorFormaDefault: integer;

    procedure MudaCidade;
    procedure MudaReclamante;
  public
    procedure BuscaProcesso(NumProcTrab: real);
  end;

var
  frmCadProcesso: TfrmCadProcesso;
  ValAntes, ValorReclamadoDepois, ValorProvavelDepois, ValorTotalAntes, ValorApoio: double;
  ValorReclamadoAntes, ValorProvavelAntes, CodObj: Variant;
  ProxSeq, Ind, Tam, liExercicio, liPeriodo, iEmpresa, FlgSitAntes, FlgSitDepois: integer;
  sMensagem, sMascara, sMesRef, sSql: string;
  FazContab, FazCAP, AlterouValores: boolean;

implementation

uses uCMTypes, uMensErro, uDataBase, uValorAtual, fValorReal, fTelaAut, uSistema, uLancContab,
  uFuncoesUteisRH, uDocumento, fPrincipal, fParcelaAcordo;

{$R *.DFM}

procedure TfrmCadProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  sMesRef := copy(DateToStr(Date),7,4) + copy(DateToStr(Date),3,2);

  tblParam.Open;
  qryMoeda.Open;
  qryRegra.Open;
  tblTipObj.Open;
  qryTipoObj.Open;
  qryVara.Open;
  tblTipSent.Open;
  qryTRT.Open;
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
  if (tblParam.FieldByName('FLGINTEGRACONT').AsInteger = 1) then
  begin
    qryAux2.Close;
    qryAux2.SQL.Clear;
    qryAux2.SQL.Add('SELECT PL.MASCARA, PR.PLANO FROM PLANO PL, PARAMCONTAB PR ');
    qryAux2.SQL.Add('WHERE PR.PLANO = PL.PLANO AND PR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
    qryAux2.Open;
    sMascara  := qryAux2.Fields[0].AsString;
    qryAux2.Close;

    qryAux2.SQL.Clear;
    qryAux2.SQL.Add ('SELECT IDPATRO, IDPLANOPREV FROM PARALMOX');
    qryAux2.Open;
    iIDPatro     := IFF(Sistema.UsaPlanoPatro, qryAux2.FieldByName('IDPATRO').asInteger, -1);
    iIDPlanoPrev := IFF(Sistema.UsaPlanoPatro, qryAux2.FieldByName('IDPLANOPREV').asInteger, -1);
    qryAux2.Close;

    qryTipoOper.Open;
  end;

  if (tblParam.FieldByName('FLGINTEGRACAP').AsInteger = 1) then
  begin
    qryTipoDoc.Open;
    qryTipoDesemb.Open;
    dtPagamento.Date := Date;
  end;
  gbxContabilizacao.Visible := (tblParam.FieldByName('FLGINTEGRACONT').AsInteger = 1);
  pgCtrlOutrosDados.ActivePageIndex := 0;

  // Atribuo componentes Regra do Form para o Cálculo
  compRegra  := Regra;
  qryInRegra := qryIn;
end;

procedure TfrmCadProcesso.bbtnConfirmarClick(Sender: TObject);
begin
  if (ds.Dataset.State = dsInsert) and not(qry.FieldByName('DATANOTIF').IsNull) then
    qry.FieldByName('DATAPREVENCER').Value := qry.FieldByName('DATANOTIF').Value + int(365.25 * 5);

  sMensagem    := '';
  iEmpresa     := Sistema.idEmpresa;
  FlgSitDepois := rgSituacao.ItemIndex;

  FazContab := (tblParam.FieldByName('FLGINTEGRACONT').AsInteger = 1) and
      (AlterouValores) and (TESTAPERIODO(True,'BaseDados',DateToStr(Date),
        IntToStr(Sistema.idModulo),liExercicio,liPeriodo,iEmpresa, sMensagem) = 0);

  FazCAP := (gbxCAP.Visible) and (FlgSitDepois = 1) and (AlterouValores);

  if (((FazContab) and (dblcTipOper.Text = '')) or
      ((FazCAP) and ((dblcTipoDoc.Text = '') or (dblcTipoDesemb.Text = ''))))  then
  begin
    pgCtrlOutrosDados.ActivePage := tbsContabCAP;
    pgctrlDetalhe.ActivePage     := tbshOutrosDados;
    tbcDetalhe.TabIndex          := tbshOutrosDados.PageIndex;
    tbcDetalhe.Repaint;
    MsgDlg('Complemente os dados requeridos para a integração Contábil e/ou do Contas a Pagar',
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

  gbxAcordo.Visible := rgTipEncer.ItemIndex = 1;
  gbxSent.Visible   := rgTipEncer.ItemIndex = 3;
end;

procedure TfrmCadProcesso.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    BuscaProcesso(StrToFloat(MontaSelect.ValoresChave[0]));
end;


procedure TfrmCadProcesso.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  gbxCAP.Visible := (tblParam.Active) and (rgSituacao.ItemIndex = 1) and
                    (tblParam.FieldByName('FLGINTEGRACAP').AsInteger = 1);

  lblSitReq.Caption := iff(qry.FieldByName('IDMOTIVO').IsNull, 'Normal', 'Excl. Por');

  qryEtapa.Close;
  qryEtapa.ParamByName('NumProcTrab').AsFloat := qry.FieldByName('NUMPROCTRAB').AsFloat;
  qryEtapa.Open;

  tbshEncer.Visible    := rgSituacao.ItemIndex = 1;
  rgTipEncer.Visible   := rgSituacao.ItemIndex = 1;
  gbxDataEncer.Visible := rgSituacao.ItemIndex = 1;
  gbxAcordo.Visible    := rgTipEncer.ItemIndex = 1;
  gbxSent.Visible      := rgTipEncer.ItemIndex = 3;
  lblValReal.Visible   := rgSituacao.ItemIndex = 1;
  dbedValReal.Visible  := rgSituacao.ItemIndex = 1;
  dbreCustoChange(Self);
  MudaReclamante;
  spbApagaVinc.Enabled := qry.FieldByName('IDPROCVINCULADO').Value <> Null;
  MudaCidade;
end;

procedure TfrmCadProcesso.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) and
     (Trim(CMProcuraLitisEmpregado.Text) = '') and
     (Trim(CMProcuraLitisEmpresa.Text)   = '') then
  begin
    MsgDlg('Litisconsorte Não Identificado','Aviso',mtInformation,[mbOk,mbHelp],0);
    CMProcuraLitisEmpregado.SetFocus;
    exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(dblcTipObj.Text) = '')  then
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
      Exit;
    end;

    if (dblcTipoEtp.Text = '') then
    begin
      MsgDlg('Preencha o Tipo de Etapa','Aviso',mtInformation,[mbOk,mbHelp],0);
      dblcTipoEtp.SetFocus;
      Exit;
    end;

{    if (dbedAssunto.Text = '') then
    begin
      MsgDlg('Preencha o Assunto','Aviso',mtInformation,[mbOk,mbHelp],0);
      dbedAssunto.SetFocus;
      Exit;
    end;
}    
  end;

  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    AlterouValores := True;
end;

procedure TfrmCadProcesso.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('NUMPROCTRAB').Value   := LeUltRegistro(nil,'PROCESSOTRAB');
  qry.FieldByName('FLGSITPROC').Value    := 0;
  qry.FieldByName('CUSTOPROC').Value     := 0;
  qry.FieldByName('DESPESAPROC').Value   := 0;
  qry.FieldByName('DATAPREVENCER').Value := Date + round(365.25 * 5);
  qry.FieldByName('INDMATERIA').Value    := 1;
  qry.FieldByName('INDTAXACONV').Value   := 0;
  qry.FieldByName('MOEDAPROCTRAB').Value := tblParam.FieldByName('MOEDAPROCTRAB').Value;
  ProxSeq := 1;
  ValorTotalAntes := 0;
  AlterouValores  := false;
end;

procedure TfrmCadProcesso.dbreCustoChange(Sender: TObject);
begin
  inherited;
  if  not  qryPartic.Active  then  exit;
  redValorAtual.Value := ValorAtual(qry.FieldByName('CUSTOPROC').AsFloat,
                                    iff(dbedDem.Text='',
                                        qry.FieldByName('DATANOTIF').AsString,
                                        dbedDem.Text),
                                    qry.FieldByName('MOEDAPROCTRAB').AsString,
                                    qry.FieldByName('IDREGRA').AsString,
                                    qry.FieldByName('NUMPROCTRAB').AsString,
                                    dbrgIndTaxaConv.ItemIndex);
end;

procedure TfrmCadProcesso.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then dblcTipObj.SetFocus;
  if (pgctrlDetalhe.ActivePage = tbsEtapas) then dblcTipoEtp.SetFocus;
end;

procedure TfrmCadProcesso.spbProcVincClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')  and
     ((ds.Dataset.State = dsInsert) or (ds.Dataset.State = dsEdit))
  then begin
       qry.FieldByName('IDPROCVINCULADO').Value :=
         StrToFloat(MontaSelect.ValoresChave[0]);
       spbApagaVinc.Enabled := True;
  end;

end;

procedure TfrmCadProcesso.rgSituacaoClick(Sender: TObject);
begin
  inherited;
  if  rgSituacao.ItemIndex = 0  then begin
      if MsgDlg('Deseja Reabrir o Processo ?', LerMensagem(4),
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then begin
          qry.FieldByName('FLGSITPROC').Value := 0;
          qry.FieldByName('DATAEFETENC').Value := Null;
          bbtnConfirmarClick(rgSituacao);
      end
      else begin
          rgSituacao.OnClick := Nil;
          rgSituacao.ItemIndex := 1;
          rgSituacao.OnClick := rgSituacaoClick;
      end;
  end

  else begin
      if MsgDlg('Deseja Encerrar o Processo ?', LerMensagem(4),
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes
      then begin
          bbtnCancelarClick(rgSituacao);
          rgSituacao.OnClick := Nil;
          rgSituacao.ItemIndex := 0;
          rgSituacao.OnClick := rgSituacaoClick;
      end
      else  begin
          qry.FieldByName('DATAEFETENC').Value := date;
          pgctrlDetalhe.ActivePage := tbshEncer;
          AlterouValores := True;
      end;
  end;
  tbshEncer.Visible    := rgSituacao.ItemIndex = 1;
  rgTipEncer.Visible   := rgSituacao.ItemIndex = 1;
  gbxDataEncer.Visible := rgSituacao.ItemIndex = 1;
  lblValReal.Visible   := rgSituacao.ItemIndex = 1;
  dbedValReal.Visible  := rgSituacao.ItemIndex = 1;
end;

procedure TfrmCadProcesso.MudaReclamante;
begin
  qryPartic.Close;
  qryPartic.ParamByName('IDRECLAMANTE').asInteger := qry.FieldByName('IDRECLAMANTE').asInteger;
  qryPartic.Open;
end;

procedure TfrmCadProcesso.spbApagaVincClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a Excluão do Vínculo ?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then  exit;
  if  (ds.State <> dsEdit) and  (ds.State <> dsInsert) then ds.Dataset.Edit;
  qry.FieldByName('IDPROCVINCULADO').Value := Null;
  qry.FieldByName('FLGVINCULADO').Value := Null;
  spbApagaVinc.Enabled := False;
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
  if (pgctrlDetalhe.ActivePage = tbsDet) and (dblcTipObj.CanFocus) then
    dblcTipObj.SetFocus;
  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) and (CMProcuraLitisEmpregado.CanFocus) then
    CMProcuraLitisEmpregado.SetFocus;
  if (pgctrlDetalhe.ActivePage = tbsEtapas) and (dblcTipoEtp.CanFocus) then
    dblcTipoEtp.SetFocus;
end;                       

procedure TfrmCadProcesso.CmeCadastroConfirma(Sender: TObject);
var
  Ind1, NumDias,NumMeses,NumAnos: integer;
  planilha, Pln: LongInt;
  ValCAP, dTotal: double;
begin
  if (tblParam.FieldByName('FLGCRIASUBCONTA').asInteger = 1) then
  begin
    qrySubContaAux.Close;
    qrySubContaAux.ParamByName('IDPESSOA').asInteger    := Sistema.IdEmpresa;
    qrySubContaAux.ParamByName('NOMESUBCONTA').asString := Trim(CMProcuraReclamante.Text);
    qrySubContaAux.Open;

    if not(qrySubContaAux.EOF) then
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
      qrySubConta.FieldByName('NOMESUBCONTA').asString := trim(CMProcuraReclamante.Text);
      qrySubConta.Post;

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

  if (FazContab) or (FazCAP) then // Contabilização e/ou Contas a Pagar
  begin
    qryValores.Close;
    qryValores.ParamByName('NumProcTrab').AsFloat := qry.FieldByName('NUMPROCTRAB').AsFloat;
    qryValores.Open;
    while not(qryValores.EOF) do
    begin
      {ValorReclamadoDepois := ValorAtual(qryValores.FieldByName('ValorReclamado').AsFloat,
                                 iff(dbedDem.Text='',
                                     qry.FieldByName('DATANOTIF').AsString,
                                     dbedDem.Text),
                                 qry.FieldByName('MOEDAPROCTRAB').AsString,
                                 qry.FieldByName('IDREGRA').AsString,
                                 qry.FieldByName('NUMPROCTRAB').AsString,
                                 qry.FieldByName('INDTAXACONV').AsInteger);}

      ValorApoio := qryValores.FieldByName('ValorProvavel').AsFloat;
      if (qry.FieldByName('FLGSITPROC').AsInteger = 1) then
        ValorApoio := qryValores.FieldByName('ValorSentenca').AsFloat;

      ValorReclamadoDepois := ValorApoio;
      ValorProvavelDepois  := ValorAtual(ValorApoio,
                                IFF(qry.FieldByName('FLGSITPROC').AsInteger = 0,
                                    iff(dbedDem.Text='',
                                        qry.FieldByName('DATANOTIF').AsString,
                                        dbedDem.Text),
                                    qry.FieldByName('DATAEFETENC').AsString),
                                qry.FieldByName('MOEDAPROCTRAB').AsString,
                                qry.FieldByName('IDREGRA').AsString,
                                qry.FieldByName('NUMPROCTRAB').AsString,
                                qry.FieldByName('INDTAXACONV').AsInteger) - ValorApoio;

      if (FazCAP) and (flgSitAntes = 0) then
        ValCAP := ValCAP + ValorProvavelDepois + ValorApoio;

      if (ValorTotalAntes > 0) then
        for Ind:=1 to Tam do
          if qryValores.FieldByName('CODTIPOOBJETO').AsInteger = CodObj[Ind] then
          begin
            ValorReclamadoDepois := ValorReclamadoDepois - ValorReclamadoAntes[Ind];
            ValorProvavelDepois  := ValorProvavelDepois  - ValorprovavelAntes[Ind];
            if (FazCAP) and (flgSitAntes = 1) then
              ValCAP := ValCAP + ValorProvavelDepois + ValorReclamadoDepois;
          end;

        // Rotina de Lançamento Contabil e/ou Contas a Pagar
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
            CalculaDifData(iff(qry.FieldByName('FLGSITPROC').AsInteger = 0,
                               qry.FieldByName('DATANOTIF').AsString,
                               qry.FieldByName('DATAEFETENC').AsString),
                           DateToStr(Date), NumDias, NumMeses, NumAnos);

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
                  ' WHERE (C.CODTIPOOBJETO = '+qryValores.FieldByName('CODTIPOOBJETO').AsString+')'+
                  ' AND (C.INDMATERIA = ' + qry.FieldByName('INDMATERIA').AsString + ')'+
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
                    ' WHERE (C.CODTIPOOBJETO = '+qryValores.FieldByName('CODTIPOOBJETO').AsString+')'+
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
              try
                Planilha := LANCACONTAB(True,'BASEDADOS',DateToStr(Date),
                  InttoStr(Sistema.IdModulo),'0',
                  'D','','','','','','','','','','',sMesRef,
                  copy(qryValores.FieldByName('CODTIPOOBJETO').asString + '     ',1,7),
                  copy(qryAux2.FieldByName('DESCRICAO').asString,1,40),
                  sMesRef, '', '',
                  qryTipoOper.FieldByName('TIPCODIGO').AsString,
                  '',
                  qryAux2.FieldByName('CONTADEBITO').asString,
                  '',
                  '',
                  liExercicio, liPeriodo,Sistema.IdEmpresa,
                  Sistema.IdUsuario,
                  qryAux2.FieldByName('IDPLANO2').asInteger,
                  ValorApoio,0,0,0,0,0,0,0,0,'',
                  False,0,0,qry.FieldByName('CODSUBCONTA').asString,'',
                  '','',Pln, sMensagem,sMascara,True,0,
                  iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
                pln := planilha;
              except
                on E:EDBEngineError do
                begin
                  MostrarErro(E);
                  pln := planilha;
                  if pln < 0 then
                    break;
                end;
              end;

              if (Trim(qryAux2.FieldByName('CONTACREDITO').asString) <> '') then
              try
                Planilha := LANCACONTAB(True,'BASEDADOS',DateToStr(Date),
                  InttoStr(Sistema.IdModulo),'1',
                  'C','','','','','','','','','','',sMesRef,
                  copy(qryValores.FieldByName('CODTIPOOBJETO').asString + '     ',1,7),
                  copy(qryAux2.FieldByName('DESCRICAO').asString,1,40),
                  sMesRef, '', '',
                  qryTipoOper.FieldByName('TIPCODIGO').AsString,
                  '',
                  '',
                  '',
                  qryAux2.FieldByName('CONTACREDITO').asString,
                  liExercicio, liPeriodo,Sistema.IdEmpresa,
                  Sistema.IdUsuario,
                  qryAux2.FieldByName('IDPLANO1').asInteger,
                  ValorApoio,0,0,0,0,0,0,0,0,'',
                  False, 0, 0, '', qry.FieldByName('CODSUBCONTA').asString,
                  '','',Pln, sMensagem,sMascara,True,0,
                  iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
                pln := planilha;
              except
                on E:EDBEngineError do
                begin
                  MostrarErro(E);
                  pln := planilha;
                  if pln < 0 then
                    break;
                end;
              end;
            end;
          end; // Fim ValorApoio <> 0 and FazContab (Rotina de Lançamento Contabil)
        end;   // Fim da Rotina de Lançamento Contabil e/ou CAP
        qryValores.Next;
      end;  // Fim do Loop de qryValores

      if (FazCAP) and (ValCAP > 0) then // Contas a Pagar
      begin
        qryDocumentos.ParamByName('CODDOCUMENTO').asInteger := -1;
        qryDocumentos.Prepare;
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
            'D',
            ValCAP,
            sMensagem,
            0,
            '')) then
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

          iUltIdBanco :=  qry.FieldByName('IDRECLAMANTE').asInteger;
          qryDocumentos.First;
          iCodDocumento := DescarregaQryDocumentos(
            qryDocumentos,
            iUltIdBanco,
            pln,
            IntToStr(iPortadorFormaDefault),
            Copy(sMesRef,5,2),
            Copy(sMesRef,1,4),
            dTotal,
            StrToDate(dtPagamento.Text),
            Documento,
            false);
          qryDocumentos.CancelUpdates;

          //dtmBaseDados.dbBaseDados.Commit;
          MsgDlg('Contas a Pagar do Processo efetuada: AP Num. ' + IntToStr(iCodDocumento),
                 'Informação',mtInformation,[mbOk,mbHelp],0);
        end;
        qryDocumentos.Close;
      end;  // Fim da Rotina de Lançamento Contas a Pagar

      IniciaValoresContabeis; // a nova situação passa a ser a "anterior", caso
                              // o usuário faça nova atualização
   end;

  if (FazContab) and (pln > 0) then
  begin
    qryAux2.Close;
    qryAux2.SQL.Clear;
    qryAux2.SQL.Add('SELECT PLNPLANIL FROM PLANILHA WHERE PLNCODIGO = ' + IntToStr(pln));
    qryAux2.Open;
    Pln := qryAux2.FieldByName('PLNPLANIL').asInteger;
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
    qryLitis.FieldByName('NUMPROCTRAB').asString := //MontaSelect.ValoresChave[0];
      qry.FieldByName('NUMPROCTRAB').AsString;
    if (CMProcuraLitisEmpregado.CanFocus) then
      CMProcuraLitisEmpregado.SetFocus;
  end;

  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
  begin
    qryEtapa.FieldByName('NUMPROCTRAB').AsString := //MontaSelect.ValoresChave[0];
      qry.FieldByName('NUMPROCTRAB').AsString;
    if (dblcTipoEtp.CanFocus) then
      dblcTipoEtp.SetFocus;
  end;
end;

procedure TfrmCadProcesso.CMProcuraRequerenteExit(Sender: TObject);
begin
  inherited;
  MudaReclamante;
end;

procedure TfrmCadProcesso.qryLitisBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (Trim(CMProcuraLitisEmpregado.Text) <> '') then
    qryLitis.FieldByName('NOME').asString := CMProcuraLitisEmpregado.Text
  else
    qryLitis.FieldByName('NOME').asString := CMProcuraLitisEmpresa.Text;

  qryLitis.FieldByName('SITUACAO').AsString :=
    iff(dblcMotivoLit.Text = '', 'Normal', dblcMotivoLit.Text);

  qryLitis.FieldByName('CATEGORIA').AsString :=
    iff(qryLitis.FieldByName('INDTESTEMUNHA').AsInteger = 0, 'Listisconsorte C.Parte',
        iff(qryLitis.FieldByName('INDTESTEMUNHA').AsInteger = 1,'Testemunha C.Parte',
        iff(qryLitis.FieldByName('INDTESTEMUNHA').AsInteger = 2,'Nossa Testemunha',
        'Nossa Listisconsorte')));
end;

procedure TfrmCadProcesso.sbtnProcurarClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'sbtnProcurar') then
  begin
    MontaSelect.Filtro.Clear;
    MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA   = 1');
    MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA');
    MontaSelect.Filtro.Add('PROCESSOTRAB.CODIGOTRT    = TRT.CODIGOTRT(+)');
    MontaSelect.Tabelas.Clear;
    MontaSelect.Tabelas.Add('PESSOA');
    MontaSelect.Tabelas.Add('PROCESSOTRAB');
    MontaSelect.Tabelas.Add('TRT');
  end;
  inherited;
end;

procedure TfrmCadProcesso.sbtnProcurarLitisClick(Sender: TObject);
begin
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    = 1');
  MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR   (COPARTPROCTRAB.IDPESSOA   = PESSOA.IDPESSOA)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.CODIGOTRT     = TRT.CODIGOTRT(+)');
  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  MontaSelect.Tabelas.Add('PROCESSOTRAB');
  MontaSelect.Tabelas.Add('TRT');
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

procedure TfrmCadProcesso.dblcTipoEtpCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if  (sbtnInsDet.Down) and (qryEtapa.FieldByName('ValorHonor').AsFloat <> 0)  then
  begin
     lblHonor.Visible := True;
     redHonor.Visible := True;
     redHonor.Value  := qryEtapa.FieldByName('ValorHonor').AsFloat;
  end;
end;

procedure TfrmCadProcesso.qryEtapaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dtedDataReal.Text := '';
  mskedHora.Text    := '';
  if qryEtapa.FieldByName('DATAREALOCOR').Value <> Null then begin
     dtedDataReal.Date  := StrToDate(DateToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime));
     //mskedHora.Text     := TimeToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime);
     mskedHora.Text     := copy(qryEtapa.FieldByName('DATAREALOCOR').AsString,12,5);
  end;
end;

procedure TfrmCadProcesso.qryEtapaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryEtapa.State = dsInsert) then
  begin
    qryEtapa.FieldByName('NumProcTrab').Value := qry.FieldByName('NumProcTrab').Value;
  end;
  qryEtapa.FieldByName('Descricao').AsString := qryTipoEtapa.FieldByName('Descricao').AsString;

  // Deposito e Despesa entram no campo DESPESAPROC
  //qry.Edit;

  qry.FieldByName('DESPESAPROC').AsFloat :=
              qry.FieldByName('DESPESAPROC').AsFloat +
              qryEtapa.FieldByName('VALORREC').AsFloat *
              (1 - qryEtapa.FieldByName('FLGVALORABATE').asInteger) - ValAntes;

  //qry.Post;

  if  (redHonor.Value  <> 0) and (redHonor.Visible) and
      (qry.FieldByName('IDADVOGRECDA').Value <> Null) then
  begin
      if  not  tblHonor.Active  then  tblHonor.Open;
      tblHonor.Insert;
      tblHonor.FieldByName('NUMPROCTRAB').Value := qry.FieldByName('NUMPROCTRAB').Value;
      tblHonor.FieldByName('DATAPAGTOHONOR').Value := Date;
      tblHonor.FieldByName('IDFORNSERV').Value :=  qry.FieldByName('IDADVOGRECDA').Value;
      tblHonor.FieldByName('VALORHONOR').AsFloat :=  redHonor.Value;
      tblHonor.Post;
  end;
  lblHonor.Visible := False;
  redHonor.Visible := False;
  redHonor.Value  := 0;

  if mskedHora.Text = '  :  ' then
     qryEtapa.FieldByName('DATAREALOCOR').Value := dtedDataReal.Date
  else
     qryEtapa.FieldByName('DATAREALOCOR').AsDateTime := dtedDataReal.Date +
                                                        StrToTime(mskedHora.Text);
end;

procedure TfrmCadProcesso.qryEtapaBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  ProxSeq := ProxSeq + 1;
end;

procedure TfrmCadProcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
     qryNumSeq.Close;
     qryNumSeq.ParamByName('NumProc').AsString :=
        //StrToFloat(MontaSelect.ValoresChave[0]);
        qry.FieldByName('NUMPROCTRAB').AsString;
     qryNumSeq.Open;
     ProxSeq := qryNumSeq.FieldByName('ULTSEQ').AsInteger;
end;

procedure TfrmCadProcesso.bbtnCancelarDetClick(Sender: TObject);
begin
  if (ds2.Dataset.State = dsInsert) and (pgctrlDetalhe.ActivePage = tbsEtapas) then
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
  if (ds2.Dataset.State = dsInsert) and (pgctrlDetalhe.ActivePage = tbsEtapas) then
     ProxSeq := ProxSeq - 1;
  inherited;

end;

procedure TfrmCadProcesso.MudaCidade;
begin
  qryUF.Close;
  qryUF.ParamByName('IdCidades').AsInteger := qry.FieldByName('IdCidades').AsInteger;
  qryUF.Open;
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

procedure TfrmCadProcesso.IniciaValoresContabeis;
begin
   AlterouValores := False;
   FlgSitAntes := qry.FieldByName('FLGSITPROC').AsInteger;
   if (tblParam.FieldByName('FLGINTEGRACONT').AsInteger = 1) or
      (tblParam.FieldByName('FLGINTEGRACAP').AsInteger = 1)  then
   begin
      qryValores.Close;
      qryValores.ParamByName('NumProcTrab').AsFloat := qry.FieldByName('NumProcTrab').AsFloat;
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
         CodObj[Ind] := qryValores.FieldByName('CODTIPOOBJETO').AsInteger;
         {ValorReclamadoAntes[Ind] := ValorAtual(qryValores.FieldByName('ValorReclamado').AsFloat,
                                    iff(dbedDem.Text='',
                                        qry.FieldByName('DATANOTIF').AsString,
                                        dbedDem.Text),
                                     qry.FieldByName('MOEDAPROCTRAB').AsString,
                                     qry.FieldByName('IDREGRA').AsString,
                                     qry.FieldByName('NUMPROCTRAB').AsString,
                                     qry.FieldByName('INDTAXACONV').AsInteger);
         }
         ValorApoio := qryValores.FieldByName('ValorProvavel').AsFloat;
         if qry.FieldByName('FLGSITPROC').AsInteger = 1 then
            ValorApoio := qryValores.FieldByName('ValorSentenca').AsFloat;
         ValorReclamadoAntes[Ind] := ValorApoio;
         ValorProvavelAntes[Ind]  := ValorAtual(ValorApoio,
                                     iff(qry.FieldByName('FLGSITPROC').AsInteger = 0,
                                        iff(dbedDem.Text='',
                                            qry.FieldByName('DATANOTIF').AsString,
                                            dbedDem.Text),
                                         qry.FieldByName('DATAEFETENC').AsString),
                                     qry.FieldByName('MOEDAPROCTRAB').AsString,
                                     qry.FieldByName('IDREGRA').AsString,
                                     qry.FieldByName('NUMPROCTRAB').AsString,
                                     qry.FieldByName('INDTAXACONV').AsInteger)
                                     - ValorApoio;
         ValorTotalAntes := ValorTotalAntes + ValorApoio;
         qryValores.Next;
      end;
   end;
end;

procedure TfrmCadProcesso.dblcMoedaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if  modified  then  dbreCustoChange(Self);
end;

procedure TfrmCadProcesso.dblcRegraNormalCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if  modified  then  dbreCustoChange(Self);
end;

procedure TfrmCadProcesso.rgSituacaoChange(Sender: TObject);
begin
  gbxCAP.Visible := (tblParam.Active) and (rgSituacao.ItemIndex = 1) and
                    (tblParam.FieldByName('FLGINTEGRACAP').AsInteger = 1);
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

   if not qryTipoEtapa.Active then qryTipoEtapa.Open;

   qryNumSeq.Close;
   qryNumSeq.ParamByName('NumProc').Value := NumProcTrab;
   qryNumSeq.Open;
   ProxSeq := qryNumSeq.FieldByName('ULTSEQ').AsInteger;

   IniciaValoresContabeis;

   qryAfterScroll(ds.Dataset);
end;

procedure TfrmCadProcesso.qryLitisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lblSitLit.Caption := iff(qryLitis.FieldByName('IDMOTIVO').IsNull, 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcesso.dblcMotivoReqChange(Sender: TObject);
begin
  inherited;
  lblSitReq.Caption := iff(dblcMotivoReq.Text = '', 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcesso.dblcMotivoLitChange(Sender: TObject);
begin
  inherited;
  lblSitLit.Caption := iff(dblcMotivoLit.Text = '', 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcesso.CmeCadastroDelete(Sender: TObject);
begin
  // CAMILLE - FUNCEF - 30.08.2001
  if (qryDocumentos.Active) and (qryDocumentos.CachedUpdates)
  then begin
     qryDocumentos.First;
     while not qryDocumentos.Eof do qryDocumentos.Delete;
  end;

  if (qryEtapa.Active) and (qryEtapa.CachedUpdates)
  then begin
     qryEtapa.First;
     while not qryEtapa.Eof do qryEtapa.Delete;
  end;

  if (qryLitis.Active) and (qryLitis.CachedUpdates)
  then begin
     qryLitis.First;
     while not qryLitis.Eof do qryLitis.Delete;
  end;

  if (qryObjeto.Active) and (qryObjeto.CachedUpdates)
  then begin
     qryObjeto.First;
     while not qryObjeto.Eof do qryObjeto.Delete;
  end;

  if (qrySubConta.Active) and (qrySubConta.CachedUpdates)
  then begin
     qrySubConta.First;
     while not qrySubConta.Eof do qrySubConta.Delete;
  end;

  with qryHonorDELETE do
  begin
     Close;
     ParamByName('NUMPROCTRAB').AsInteger := qry.FieldByName('NUMPROCTRAB').AsInteger;
     Open;
     First;
     while not Eof do Delete;
  end;

  with qryProcVincDELETE do
  begin
    Close;
    ParamByName('NUMPROCTRAB').AsInteger := qry.FieldByName('NUMPROCTRAB').AsInteger;
    Open;

    First;
    while not(EOF) do
    begin
      Edit;
      FieldByName('IDPROCVINCULADO').asString := '';
      Post;
      Next;
    end;
  end;

  try
    if (CmeCadastro.Operacao  = opApagar) then
      AplicaAlteracoes([qryProcVincDELETE, qryObjeto, qryHonorDELETE, qryDocumentos, qryEtapa, qryLitis, qrySubConta])
  except
    raise;
  end;

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
  if qryObjeto.FieldByName('VALORSENTENCA').AsFloat = 0 then
    ValAntes := qryObjeto.FieldByName('VALORESPERADO').AsFloat
  else
    ValAntes := qryObjeto.FieldByName('VALORSENTENCA').AsFloat;
end;

procedure TfrmCadProcesso.qryObjetoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryObjeto.FieldByName('NUMPROCTRAB').AsFloat   := qry.FieldByName('NUMPROCTRAB').AsFloat;
  qryObjeto.FieldByName('VALORSENTENCA').AsFloat := 0;
end;

procedure TfrmCadProcesso.qryObjetoBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryObjeto.FieldByName('DESCRICAO').AsString := dblcTipObj.Text;
end;

procedure TfrmCadProcesso.spbtnParcelamentoClick(Sender: TObject);
begin
  inherited;
  if (rgTipEncer.ItemIndex = 1) and (sbspeParc.Value < 1) then
  begin
    sbspeParc.SetFocus;
    MsgDlg('Informe o Número de Parcelas a Pagar','Informação',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;
  AbrirFormModal(frmParcelaAcordo, TfrmParcelaAcordo);
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
