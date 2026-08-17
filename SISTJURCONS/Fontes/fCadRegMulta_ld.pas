unit fCadRegMulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
  DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
  CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  BfDialogs, BrowseFolder, uProcuraDir, uCtrlEtapaProcesso, uCtrlListTerceirosRH,
  ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, MontaSelect,
  Menus, ComCtrls, CMProcuraSubTipo, uCtrlPeriodo, uCtrlGlobalRH;

type
  TfrmCadRegMulta = class(TfrmOkCancelar)
    dsEtapa: TwwDataSource;
    PageControl: TPageControl;
    tbshCondicoes: TTabSheet;
    Label17: TLabel;
    dbredValorMulta: TDBRealEdit;
    dbrgIndMulta: TDBRadioGroup;
    dtedInicial: TCMDateTimePicker;
    Label9: TLabel;
    tbshPagamento: TTabSheet;
    Label1: TLabel;
    dtedPagamento: TCMDateTimePicker;
    Label5: TLabel;
    dbredValorPago: TDBRealEdit;
    gbxCAP: TGroupBox;
    Label3: TLabel;
    dblckTipoDoc: TwwDBLookupCombo;
    gbxContab: TGroupBox;
    Label4: TLabel;
    dblckTipOper: TwwDBLookupCombo;
    CdsTipoDesemb: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    lblMultaPaga: TLabel;
    gbxCapContab: TGroupBox;
    Label2: TLabel;
    dblckTipoDesemb: TwwDBLookupCombo;
    cmprocFonecedor: TCMProcuraForCli;
    btnPagar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtedPagamentoChange(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnPagarClick(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    CdsEtapa: TCMClientDataSet;
    CdsObjeto: TCMClientDataSet;

    IdPatro, IdPlanoPrev: integer;
    bFazCAP, bFazContab: boolean;
    ValorAntes: variant;
    IndAntes: variant;
  public
    class function ExibirTelaMulta(CdsEtapaOrigem, CdsObjetoOrigem: TCMClientDataSet): boolean;
  end;

var
  frmCadRegMulta: TfrmCadRegMulta;

implementation

uses dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro,
     uCtrlParamIntegra, fAguarde;


{$R *.DFM}

procedure TfrmCadRegMulta.FormShow(Sender: TObject);
begin
  inherited;
  if (CdsEtapa.FieldByName('DATAPAGMULTA').IsNull) then
  begin
    CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlEtapaProcesso.InitializeAs(Padroes);

    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.InitializeAs(Padroes);

    CtrlGlobalRH := TCtrlGlobalRH.Create;
    CtrlGlobalRH.InitializeAs(Padroes);

    CtrlPeriodo := TCtrlPeriodo.Create;
    CtrlPeriodo.InitializeAs(Padroes);

    // Integração com o CAP
    dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT');
    bFazCAP := (dmCds.Cds.FieldByName('FLGINTEGRACAP').asInteger = 1);
    gbxCAP.Visible := bFazCAP;

    if (bFazCAP) then
    begin
      CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');
      CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(
        Sistema.IdEmpresa, 'P', true);
    end;

    // Integração com a Contabilidade
    bFazContab := (dmCds.Cds.FieldByName('FLGINTEGRACONT').asInteger = 1) and
      (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));
    gbxContab.Visible := bFazContab;

    if (bFazContab) then
    begin
      // Pega o ID da Patrocinadora e do Plano Previdenciário
      if (Sistema.UsaPlanoPatro) then
      begin
        IdPatro := CtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);
        IdPlanoPrev := CtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
      end
      else
      begin
        IdPatro := -1;
        IdPlanoPrev := -1;
      end;

      CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacao;
    end;

    if (bFazContab) or (bFazCAP) then
    begin
      CtrlEtapaProcesso.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
        Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
        ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
        ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
      CtrlEtapaProcesso.CdsEtapas := CdsEtapa;
    end;

  end
  else
  begin
    tbshCondicoes.Enabled := false;
    tbshPagamento.Enabled := false;
    lblMultaPaga.Visible := true;
    btnPagar.Visible := false;
  end;

end;

procedure TfrmCadRegMulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlEtapaProcesso);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlListTerceirosRH);
  Action := caHide;
end;

class function TfrmCadRegMulta.ExibirTelaMulta(CdsEtapaOrigem, CdsObjetoOrigem: TCMClientDataSet): boolean;
var
  frm: TfrmCadRegMulta;
begin
  frm := TfrmCadRegMulta.Create(Application);
  frm.dtedPagamento.OnChange := nil;
  frm.CdsEtapa := CdsEtapaOrigem;
  frm.dsEtapa.DataSet := CdsEtapaOrigem;
  frm.CdsObjeto := CdsObjetoOrigem;
  frm.ValorAntes := frm.CdsEtapa.FieldByName('VALORMULTA').Value;
  frm.IndAntes := frm.CdsEtapa.FieldByName('INDMULTA').Value;
  frm.dtedPagamento.OnChange := frm.dtedPagamentoChange;
  Result := (frm.ShowModal = mrOk);
  frm.CdsEtapa := Nil;
  frm.CdsObjeto := Nil;
  frm.Free;
end;

procedure TfrmCadRegMulta.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
  CdsEtapa.FieldByName('VALORMULTA').Value := ValorAntes;
  CdsEtapa.FieldByName('INDMULTA').Value := IndAntes;
end;

procedure TfrmCadRegMulta.bbtnConfirmarClick(Sender: TObject);
var
  iCodTipDoc: integer;
  sTipCodigo: string;
  bOk: boolean;
begin
  ModalResult := mrOK;
  if (dbredValorMulta.Value > 0) and (dbrgIndMulta.ItemIndex < 0) then
  begin
    MsgDlg('Informe a que se refere esta multa', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbrgIndMulta.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (dbredValorMulta.Value = 0) and (dbrgIndMulta.ItemIndex >= 0) then
  begin
    MsgDlg('Informe o valor ou % desta multa', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbrgIndMulta.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (dbredValorMulta.Value > 100) and (dbrgIndMulta.ItemIndex < 15) and
     (MsgDlg('% Acima de 100. Confirma ?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    ModalResult := mrNone;
    exit;
  end;

  if (bFazCAP) and (PageControl.ActivePageIndex = 1) and
     ((dblckTipoDoc.Text = '') or (dblckTipoDesemb.Text = '') or (cmprocFonecedor.Text = '')) and
     (MsgDlg('Não será gerado Contas a Pagar desta multa. Confirma ?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    ModalResult := mrNone;
    exit;
  end
  else if (dblckTipoDoc.Text = '') or (dblckTipoDesemb.Text = '') or (cmprocFonecedor.Text = '') then
    bFazCAP := false;

  if (bFazContab) and (PageControl.ActivePageIndex = 1) and
     ((dblckTipOper.Text = '') or (dblckTipoDesemb.Text = '') or (cmprocFonecedor.Text = '')) and
     (MsgDlg('Não será feita a contabilização desta multa. Confirma ?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    ModalResult := mrNone;
    exit;
  end
  else if (dblckTipOper.Text = '') or (dblckTipoDesemb.Text = '') or (cmprocFonecedor.Text = '') then
    bFazContab := false;

  if (PageControl.ActivePageIndex = 0) and (btnPagar.Visible) then
  begin
    MsgDlg('O pagamento desta multa não será feito neste momento', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    CdsEtapa.FieldByName('DATAPAGMULTA').Value := Null;
    CdsEtapa.FieldByName('VALORMULTAPAGA').Value := Null;
    bFazContab := false;
    bFazCAP := false;
  end;

  inherited;

  if (bFazCAP) or (bFazContab) then
  begin
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Mostra('Fazendo Integração...');

    if (bFazCAP) then
      iCodTipDoc := CdsTipoDoc.FieldByName('CODTIPDOC').asInteger
    else
      iCodTipDoc := 0;

    if (bFazContab) then
      sTipCodigo := CdsTipoOper.FieldByName('TIPCODIGO').asString
    else
      sTipCodigo := '';

    bOk := CtrlEtapaProcesso.GerarIntegracao(
      bFazCAP, bFazContab, Date, FU.IFF(dtedPagamento.Text='',Date,dtedPagamento.Date),
      cmprocFonecedor.ForCliReg.Id,
      IdPlanoPrev, IdPatro, CdsTipoDesemb.FieldByName('PLACONTA').asString,
      CdsTipoDesemb.FieldByName('PLANO').asInteger,
      CdsTipoDesemb.FieldByName('PLACONTACREDITO').asString,
      sTipCodigo, CdsTipoDesemb.FieldByName('CODTIPRECDES').asString, iCodTipDoc,
      0,0,0,0, dbredValorPago.Value);

    frmAguarde.pbAguarde.Visible := true;
    frmAguarde.Apaga;

    if (bOk) then
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;

  CdsEtapa.Edit;

end;

procedure TfrmCadRegMulta.PageControlChange(Sender: TObject);
var
  iNumDias, iNumMeses, iNumAnos: integer;
  dValorObj, dValCausa, dValOrig, dValAtual, dValReal: double;
begin
  inherited;
  if PageControl.ActivePageIndex = 1 then
  begin
    if dtedPagamento.Text = '' then
      CdsEtapa.FieldByName('DATAPAGMULTA').asString := DateToStr(Date);

    if dbredValorPago.Value = 0 then
    begin
      if (dbrgIndMulta.ItemIndex < 12) then
      begin
        if (CdsObjeto = Nil) then
        begin
          // Rotina para trazer os valores do Banco de Dados
          CtrlEtapaProcesso.GetValores(CdsEtapa.FieldByName('NumProcTrab').AsFloat,
            dValCausa, dValOrig, dValAtual, dValReal);
          if (dbrgIndMulta.ItemIndex in [0,1,2]) then
            dValorObj := dValCausa
          else if (dbrgIndMulta.ItemIndex in [3,4,5]) then
            dValorObj := dValOrig
          else if (dbrgIndMulta.ItemIndex in [6,7,8]) then
            dValorObj := dValAtual
          else
            dValorObj := dValReal;
        end
        else
        begin
          // Rotina para trazer os valores do Cds ativo
          dValorObj := 0;
          CdsObjeto.First;
          while not CdsObjeto.Eof do
          begin
            if (dbrgIndMulta.ItemIndex in [0,1,2]) then
              dValorObj := dValorObj + CdsObjeto.FieldByName('VALORRECL').asFloat
            else if (dbrgIndMulta.ItemIndex in [3,4,5]) then
              dValorObj := dValorObj + CdsObjeto.FieldByName('VALORRECL').asFloat *
                CdsObjeto.FieldByName('PERCORIG').asFloat / 100
            else if (dbrgIndMulta.ItemIndex in [6,7,8]) then
              dValorObj := dValorObj + CdsObjeto.FieldByName('VALORRECL').asFloat *
                CdsObjeto.FieldByName('PERCORIG').asFloat / 100 *
                CdsObjeto.FieldByName('PERCPROB').asFloat / 100
            else
              dValorObj := dValorObj + CdsObjeto.FieldByName('VALORSENTENCA').asFloat;

            CdsObjeto.Next;
          end;
          CdsObjeto.First;
        end;

        if (dbrgIndMulta.ItemIndex in [0,3,6,9]) then
          dbredValorPago.Value := dbredValorMulta.Value *
            (dtedPagamento.Date - dtedInicial.Date) *
            dValorObj / 100
        else if (dbrgIndMulta.ItemIndex in [1,4,7,10]) then
        begin
          FU.CalculaData(dtedInicial.Text, dtedPagamento.Text, iNumDias,
            iNumMeses, iNumAnos);
          dbredValorPago.Value := dbredValorMulta.Value * iNumMeses *
            dValorObj / 100;
        end
        else
          dbredValorPago.Value := dbredValorMulta.Value / 100 *
            dValorObj;

      end;

      if (dbrgIndMulta.ItemIndex = 12) then
        dbredValorPago.Value := dbredValorMulta.Value *
          (dtedPagamento.Date - dtedInicial.Date) *
          CdsEtapa.FieldByName('VALORREC').asFloat / 100
      else if (dbrgIndMulta.ItemIndex = 13) then
      begin
        FU.CalculaData(dtedInicial.Text, dtedPagamento.Text, iNumDias,
          iNumMeses, iNumAnos);
        dbredValorPago.Value := dbredValorMulta.Value * iNumMeses *
          CdsEtapa.FieldByName('VALORREC').asFloat / 100;
      end
      else if (dbrgIndMulta.ItemIndex = 14) then
        dbredValorPago.Value := dbredValorMulta.Value / 100 *
          CdsEtapa.FieldByName('VALORREC').asFloat
      else if (dbrgIndMulta.ItemIndex = 15) then
        dbredValorPago.Value := dbredValorMulta.Value *
          (dtedPagamento.Date - dtedInicial.Date)
      else if (dbrgIndMulta.ItemIndex = 16) then
      begin
        FU.CalculaData(dtedInicial.Text, dtedPagamento.Text, iNumDias,
          iNumMeses, iNumAnos);
        dbredValorPago.Value := dbredValorMulta.Value * iNumMeses;
      end
      else if (dbrgIndMulta.ItemIndex = 17) then
        dbredValorPago.Value := dbredValorMulta.Value;
    end;
  end;
end;

procedure TfrmCadRegMulta.dtedPagamentoChange(Sender: TObject);
var
  iNumDias, iNumMeses, iNumAnos: integer;
  dValorObj, dValCausa, dValOrig, dValAtual, dValReal: double;
begin
  inherited;
  if dtedPagamento.Enabled then
  begin
    if (dbrgIndMulta.ItemIndex < 12) then
    begin
      if (CdsObjeto = Nil) then
      begin
        // Rotina para trazer os valores do Banco de Dados
        CtrlEtapaProcesso.GetValores(CdsEtapa.FieldByName('NumProcTrab').AsFloat,
          dValCausa, dValOrig, dValAtual, dValReal);
        if (dbrgIndMulta.ItemIndex in [0,1,2]) then
          dValorObj := dValCausa
        else if (dbrgIndMulta.ItemIndex in [3,4,5]) then
          dValorObj := dValOrig
        else if (dbrgIndMulta.ItemIndex in [6,7,8]) then
          dValorObj := dValAtual
        else
          dValorObj := dValReal;
      end
      else
      begin
        // Rotina para trazer os valores do Cds ativo
        dValorObj := 0;
        CdsObjeto.First;
        while not CdsObjeto.Eof do
        begin
          if (dbrgIndMulta.ItemIndex in [0,1,2]) then
            dValorObj := dValorObj + CdsObjeto.FieldByName('VALORRECL').asFloat
          else if (dbrgIndMulta.ItemIndex in [3,4,5]) then
            dValorObj := dValorObj + CdsObjeto.FieldByName('VALORRECL').asFloat *
              CdsObjeto.FieldByName('PERCORIG').asFloat / 100
          else if (dbrgIndMulta.ItemIndex in [6,7,8]) then
            dValorObj := dValorObj + CdsObjeto.FieldByName('VALORRECL').asFloat *
              CdsObjeto.FieldByName('PERCORIG').asFloat / 100 *
              CdsObjeto.FieldByName('PERCPROB').asFloat / 100
          else
            dValorObj := dValorObj + CdsObjeto.FieldByName('VALORSENTENCA').asFloat;

          CdsObjeto.Next;
        end;
        CdsObjeto.First;
      end;

      if (dbrgIndMulta.ItemIndex in [0,3,6,9]) then
        dbredValorPago.Value := dbredValorMulta.Value *
          (dtedPagamento.Date - dtedInicial.Date) *
          dValorObj / 100
      else if (dbrgIndMulta.ItemIndex in [1,4,7,10]) then
      begin
        FU.CalculaData(dtedInicial.Text, dtedPagamento.Text, iNumDias,
          iNumMeses, iNumAnos);
        dbredValorPago.Value := dbredValorMulta.Value * iNumMeses *
          dValorObj / 100;
      end
      else
        dbredValorPago.Value := dbredValorMulta.Value / 100 *
          dValorObj;

    end;

    if (dbrgIndMulta.ItemIndex = 12) then
      dbredValorPago.Value := dbredValorMulta.Value *
        (dtedPagamento.Date - dtedInicial.Date) *
        CdsEtapa.FieldByName('VALORREC').asFloat / 100
    else if (dbrgIndMulta.ItemIndex = 13) then
    begin
      FU.CalculaData(dtedInicial.Text, dtedPagamento.Text, iNumDias,
        iNumMeses, iNumAnos);
      dbredValorPago.Value := dbredValorMulta.Value * iNumMeses *
        CdsEtapa.FieldByName('VALORREC').asFloat / 100;
    end
    else if (dbrgIndMulta.ItemIndex = 14) then
      dbredValorPago.Value := dbredValorMulta.Value / 100 *
        CdsEtapa.FieldByName('VALORREC').asFloat
    else if (dbrgIndMulta.ItemIndex = 15) then
      dbredValorPago.Value := dbredValorMulta.Value *
        (dtedPagamento.Date - dtedInicial.Date)
    else if (dbrgIndMulta.ItemIndex = 16) then
    begin
      FU.CalculaData(dtedInicial.Text, dtedPagamento.Text, iNumDias,
        iNumMeses, iNumAnos);
      dbredValorPago.Value := dbredValorMulta.Value * iNumMeses;
    end
    else if (dbrgIndMulta.ItemIndex = 17) then
      dbredValorPago.Value := dbredValorMulta.Value;
  end;
end;

procedure TfrmCadRegMulta.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := PageControl.ActivePageIndex = 1;
end;

procedure TfrmCadRegMulta.btnPagarClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := 1;
  PageControlChange(Self);
end;

end.
