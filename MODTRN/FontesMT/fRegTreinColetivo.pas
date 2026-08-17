unit fRegTreinColetivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit,
  wwdblook, Db, DBTables, checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, uCMClientDataSet, ComCtrls, uCtrlRegTrein, uCtrlListTerceirosRH,
  uCtrlCurso, MontaSelect, Mask, wwdbedit, uCmSqlParams, ColorCheckListBox;

type
  TfrmRegTreinColetivo = class(TfrmSairAjuda)
    dsHstTrn: TwwDataSource;
    CdsCurso: TCMClientDataSet;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    bbtnSelecionaInscricoes: TBitBtn;
    bbtnAtualizaInscricoes: TBitBtn;
    tbntbDados: TNotebook;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnImprimirCarta: TSpeedButton;
    chklstPessoasNaoInscritas: TColorCheckListBox;
    chklstPessoasInscritas: TColorCheckListBox;
    pnlPessoasNaoInscritas: TPanel;
    spbNome: TSpeedButton;
    spbTipo: TSpeedButton;
    spbtnCandFunc: TSpeedButton;
    pnlPessoasInscritas: TPanel;
    dbgdHistoricoTreinamento: TwwDBGrid;
    bbtnApanha: TBitBtn;
    bbtnNovo: TBitBtn;
    CdsInstrutor: TCMClientDataSet;
    CdsEntid: TCMClientDataSet;
    CdsHstTrn: TCMClientDataSet;
    CdsPrincipal: TCMClientDataSet;
    MontaSelectLocal: TMontaSelect;
    sbtnImprimirRelat: TSpeedButton;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    PageControl1: TPageControl;
    tbshDadosBasicos: TTabSheet;
    tbshDadosComplementares: TTabSheet;
    bvIdent: TBevel;
    gbxCurso: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    dblckCurso: TwwDBLookupCombo;
    dblckEntid: TwwDBLookupCombo;
    dblckInstrutor: TwwDBLookupCombo;
    rgControle: TRadioGroup;
    rgAvalCurs: TRadioGroup;
    gbxDatas: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtedIniPlan: TCMDateTimePicker;
    dtedFimPlan: TCMDateTimePicker;
    dtedIniReal: TCMDateTimePicker;
    dtedFimReal: TCMDateTimePicker;
    gbxCarga: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    redTeoria: TRealEdit;
    redPratica: TRealEdit;
    redTotal: TRealEdit;
    gbxDespesas: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    redValCurso: TRealEdit;
    redValViagem: TRealEdit;
    redValHosp: TRealEdit;
    redValOutras: TRealEdit;
    Label2: TLabel;
    edLocalCurso: TEdit;
    bbtnProcLocal: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    bbtnAlimenta: TBitBtn;
    bbtnBuscaInstrutorExterno: TBitBtn;
    bbtnBuscaInstrutorInterno: TBitBtn;
    MontaSelectExterno: TMontaSelect;
    MontaSelectInterno: TMontaSelect;
    edDataHora: TwwDBEdit;
    edInstrutores: TwwDBEdit;
    CdsMemos: TCMClientDataSet;
    sqlMemos: TCMSqlParams;
    dsMemos: TwwDataSource;
    cbxRateia: TCheckBox;
    sbtnImprimirCertif: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure dblckCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnApanhaClick(Sender: TObject);
    procedure bbtnNovoClick(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure bbtnAtualizaInscricoesClick(Sender: TObject);
    procedure bbtnSelecionaInscricoesClick(Sender: TObject);
    procedure spbtnCandFuncClick(Sender: TObject);
    procedure dblckEntidChange(Sender: TObject);
    procedure sbtnImprimirCartaClick(Sender: TObject);
    procedure dblckEntidEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbNomeClick(Sender: TObject);
    procedure bbtnProcLocalClick(Sender: TObject);
    procedure sbtnImprimirRelatClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnAlimentaClick(Sender: TObject);
    procedure bbtnBuscaInstrutorExternoClick(Sender: TObject);
    procedure bbtnBuscaInstrutorInternoClick(Sender: TObject);
    procedure sbtnImprimirCertifClick(Sender: TObject);
  private
    CtrlRegTrein: TCtrlRegTrein;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCurso: TCtrlCurso;

    NovoTreinamento, OrdemPorNome, bEmpregado: boolean;
    sListaCodPessoas, sListaProxNumSeq, sDataFinalAntes, sDataFinalDepois,
    sDataIniAntes, sDataIniDepois: string;
    IdTipoProcesso: Longint;
    ListaCodPessoasNaoInscritas, ListaCodPessoasInscritas, ListaNumSeqPessoasInscritas: TStringList;

    procedure SelPessoas;
    procedure SelPessoasNaoInscritas(Ordem: TOrdemPessoas);
    procedure SelPessoasInscritas;
    procedure LimparDadosTela;
    procedure PreencherDadosTela;
    function  Validar(Operacao: string): boolean;
    procedure InscreverPessoas;
  end;

var
  frmRegTreinColetivo: TfrmRegTreinColetivo;

implementation

uses uCMTypes, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uRAD, uSistema, dCds, CorreioCM,
  fSelTreinColetivo, RCartaConvoc, fListaPessoas, fAguarde, uCtrlUsoGeralRH, RRelEvento,
  RCertificado;

{$R *.DFM}

procedure TfrmRegTreinColetivo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegTrein := TCtrlRegTrein.Create(true, Sistema.UsaRAD, false, false, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
  CtrlRegTrein.CdsHistTrein := CdsPrincipal;

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  ListaCodPessoasNaoInscritas := TStringList.Create;
  ListaCodPessoasInscritas := TStringList.Create;
  ListaNumSeqPessoasInscritas := TStringList.Create;

  CdsPrincipal.Data := CtrlRegTrein.ListHistorico_Treinamento_em_Branco;

  if (Sistema.IdModulo = 417) then
    HelpContext := 4170013;

  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    MsgDlg('Utilize a Tela de Registro Individual.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    Close;
    exit;
  end;                            

  CdsCurso.Data := CtrlCurso.ListGeral;
  CdsEntid.Data := CtrlRegTrein.ListEntid;
  CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F');
  CdsHstTrn.Data := CtrlRegTrein.ListHistoricoTreinamentoPorCurso(-1);

  if (Sistema.UsaRAD) then
    IdTipoProcesso := CtrlListTerceirosRH.GetIdTipoProcesso(Sistema.IdUsuario, 20)
  else
    IdTipoProcesso := -1;

  tbntbDados.PageIndex := 0;
  OrdemPorNome := true;
  bEmpregado := true;

  sqlMemos.Open;
end;

procedure TfrmRegTreinColetivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCurso);
  FreeAndNil(ListaCodPessoasNaoInscritas);
  FreeAndNil(ListaCodPessoasInscritas);
  FreeAndNil(ListaNumSeqPessoasInscritas);
  inherited;
end;

procedure TfrmRegTreinColetivo.dblckCursoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
  begin
    tbntbDados.PageIndex := 0;
    LimparDadosTela;

    if not(CdsCurso.FieldByName('IDENTIDINSTR').IsNull) then
    begin
      CdsEntid.Locate('IDPESSOA', CdsCurso.FieldByName('IDENTIDINSTR').asFloat,[]);
      dblckEntid.LookupValue := CdsEntid.FieldByName('IDPESSOA').asString;
      dblckEntid.Update;
    end;

    CdsHstTrn.Data := CtrlRegTrein.ListHistoricoTreinamentoPorCurso(
      CdsCurso.FieldByName('IDCURSO').asFloat);
    bbtnApanha.Enabled := not(CdsHstTrn.IsEmpty);
  end;

  if (Trim(dblckCurso.Text) <> '') then
    bbtnNovo.Enabled := true;
end;

procedure TfrmRegTreinColetivo.dblckEntidEnter(Sender: TObject);
begin
  if (dblckCurso.Text <> '') then
    CdsEntid.Data := CtrlRegTrein.ListEntid(CdsCurso.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmRegTreinColetivo.dblckEntidChange(Sender: TObject);
begin
  if (dblckEntid.Text <> '') then
    CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F',
      CdsEntid.FieldByName('IDPESSOA').asFloat);
end;

procedure TfrmRegTreinColetivo.bbtnApanhaClick(Sender: TObject);
begin
  PreencherDadosTela;
  NovoTreinamento := false;
  SelPessoas;
  tbntbDados.PageIndex := 1;
  sDataFinalAntes := dtedFimReal.Text;
  sDataIniAntes := dtedIniReal.Text;
  bbtnSelTodos.Visible := True;
  bbtnInverteSel.Visible := True;
end;

procedure TfrmRegTreinColetivo.bbtnNovoClick(Sender: TObject);
begin
  LimparDadosTela;
  NovoTreinamento := true;
  SelPessoas;
  tbntbDados.PageIndex := 1;
  sDataFinalAntes := '';
  sDataIniAntes := '';
  redTeoria.Value := CdsCurso.FieldByName('DUR_TEOR').asInteger;
  redPratica.Value := CdsCurso.FieldByName('DUR_PRAT').asInteger;
  redTotal.Value := redTeoria.Value + redPratica.Value;
  redValCurso.Value := CdsCurso.FieldByName('VALOR').asFloat;
  bbtnSelTodos.Visible := True;
  bbtnInverteSel.Visible := True;

  if not(CdsCurso.FieldByName('IDENTIDINSTR').IsNull) then
  begin
    CdsEntid.Locate('IDPESSOA', CdsCurso.FieldByName('IDENTIDINSTR').asFloat, []);
    dblckEntid.LookupValue := CdsEntid.FieldByName('IDPESSOA').asString;
    dblckEntid.Update;
  end;
end;

procedure TfrmRegTreinColetivo.spbNomeClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'spbNome') then
    SelPessoasNaoInscritas(opNome)
  else
    SelPessoasNaoInscritas(opTipoNome);
end;

procedure TfrmRegTreinColetivo.spbtnCandFuncClick(Sender: TObject);
begin
  bEmpregado := not(bEmpregado);
  if (bEmpregado) then
    pnlPessoasNaoInscritas.Caption := 'Empregados Não Inscritos'
  else
    pnlPessoasNaoInscritas.Caption := 'Candidatos Não Inscritos';
  SelPessoas;
end;

procedure TfrmRegTreinColetivo.sbtnImprimirCartaClick(Sender: TObject);
var
  c: integer;
  Rpt: TRptCartaConvoc;
begin
  Rpt := TRptCartaConvoc.Create(Application);

  if (Rpt.CmpRptCM.Execute) then
  begin
    case (Rpt.CmpRptCM.ParamByName('Todos').asInteger) of
      0 :
      begin
        Rpt.sPessoasInscritas := '';
        for c:=0 to ListaCodPessoasInscritas.Count-1 do
          if (Rpt.sPessoasInscritas = '') then
            Rpt.sPessoasInscritas := ListaCodPessoasInscritas[c]
          else
            Rpt.sPessoasInscritas := Rpt.sPessoasInscritas +','+ ListaCodPessoasInscritas[c];
      end;
      1 : FU.CriaListaOpcoes(chklstPessoasInscritas, ListaCodPessoasInscritas,
                             Rpt.sPessoasInscritas, ',', false);
    end;

    Rpt.sCurso := dblckCurso.Text;
    Rpt.sEntid := dblckEntid.Text;
    Rpt.sInstrutor := dblckInstrutor.Text;
    Rpt.sIdCurso := CdsCurso.FieldByName('IDCURSO').asString;
    Rpt.sIdEntid := CdsEntid.FieldByName('IDPESSOA').asString;
    Rpt.sIdInstrutor := CdsInstrutor.FieldByName('IDPESSOA').asString;
    Rpt.sIniPlan := dtedIniPlan.Text;
    Rpt.sFimPlan := dtedFimPlan.Text;
    Rpt.sIniReal := dtedIniReal.Text;
    Rpt.sFimReal := dtedFimReal.Text;
    Rpt.sDataIni := FU.IFF(dtedIniPlan.Text='', dtedIniReal.Text, dtedIniPlan.Text);
    Rpt.sDataFim := FU.IFF(dtedFimPlan.Text='', dtedFimReal.Text, dtedFimPlan.Text);

    Rpt.CrmRptCM.IdReports := 3838;
    Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    Rpt.CrmRptCM.OrigemCM := 1;
    Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
    Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
    Rpt.CrmRptCM.Print;
  end;
  FreeAndNil(Rpt);
end;

procedure TfrmRegTreinColetivo.sbtnAdicionarClick(Sender: TObject);
begin
  if (Validar('Inscrição')) then
    InscreverPessoas;
end;

procedure TfrmRegTreinColetivo.sbtnRemoverClick(Sender: TObject);
var
  c: integer;
  bOk: boolean;
begin
  if (Validar('Exclusão')) then
  begin
    frmAguarde.Mostra('Eliminando Pessoas...');
    sListaCodPessoas := '';
    sListaProxNumSeq := '';

    for c:=0 to chklstPessoasInscritas.Items.Count-1 do
    begin
      if (chklstPessoasInscritas.Checked[c]) then
      begin
        if (sListaCodPessoas = '') then
        begin
          sListaCodPessoas := ListaCodPessoasInscritas[c];
          sListaProxNumSeq := ListaNumSeqPessoasInscritas[c];
        end
        else
        begin
          sListaCodPessoas := sListaCodPessoas +','+ ListaCodPessoasInscritas[c];
          sListaProxNumSeq := sListaProxNumSeq +','+ ListaNumSeqPessoasInscritas[c];
        end;
      end;
    end;

    bOk := (CtrlRegTrein.EliminarInscricoes(sListaCodPessoas, sListaProxNumSeq,
      CdsCurso.FieldByName('IDCURSO').asFloat));

    frmAguarde.Apaga;
    if (bOk) then
    begin
      SelPessoas;
      tbntbDados.PageIndex := 1;
    end
    else
      raise Exception.Create(CtrlRegTrein.MessageInfo);
  end;
end;

procedure TfrmRegTreinColetivo.bbtnAtualizaInscricoesClick(Sender: TObject);
var
  bAtuOutros: boolean;
  iRateio: integer;
begin
  sDataFinalDepois := dtedFimReal.Text;
  sDataIniDepois := dtedIniReal.Text;

  // Verifica Processos RAD não concluídos
  if (Sistema.UsaRAD) and (IdTipoProcesso > 0) and (rgControle.ItemIndex = 0) and
     ((sDataIniAntes = '') and (sDataIniDepois <> '') or (sDataFinalAntes = '') and
     (sDataFinalDepois <> '')) and (CtrlRegTrein.ExisteRAD_Nao_Concluido) then
  begin
    MsgDlg(CtrlRegTrein.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
    exit;
  end;

  if (MsgDlg('Confirma a Alteração da(s) Pessoa(s) Inscrita(s)?',
      'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
    exit;

  bAtuOutros := (MsgDlg('Atualiza Também os Valores de Viagem, Hospedagem e Outras?',
    'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes);

  iRateio := FU.IFF(cbxRateia.Checked, chklstPessoasInscritas.Items.Count, 1);

  frmAguarde.Mostra('Atualizando Inscrições...');
  if not(CtrlRegTrein.AtualizarInscricoes(bEmpregado, bAtuOutros, IdTipoProcesso,
      1 - rgControle.ItemIndex, 1 - rgAvalCurs.ItemIndex,
      FU.IFF(Trim(dblckCurso.Text)<>'',CdsCurso.FieldByName('IDCURSO').asFloat, 0),
      FU.IFF(Trim(dblckInstrutor.Text)<>'',CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
      FU.IFF(Trim(dblckEntid.Text)<>'',CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
      dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date,
      redTeoria.Value, redPratica.Value,
      redValCurso.Value/iRateio, redValViagem.Value/iRateio,
      redValHosp.Value/iRateio, redValOutras.Value/iRateio,
      Trim(dblckCurso.Text), edLocalCurso.Text,
      CdsMemos.FieldByName('DATAHORA').asString, CdsMemos.FieldByName('INSTRUTORES').asString,
      (rgControle.ItemIndex = 0) and (rgAvalCurs.ItemIndex = 0) and
      (sDataFinalAntes = '') and (sDataFinalDepois <> ''))) then
    MsgDlg(CtrlRegTrein.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

  frmAguarde.Apaga;
end;

procedure TfrmRegTreinColetivo.bbtnSelecionaInscricoesClick(Sender: TObject);
var
  iPos, c: integer;
  frm: TfrmSelTreinColetivo;
begin
  if (Validar('Inscrição')) then
  begin
    frm := TfrmSelTreinColetivo.Create(Application);
    
    frm.cbxCandidatos.Checked := not(bEmpregado);
    frm.cbxCandidatos.Enabled := not(bEmpregado);
    frm.cbxEfetivos.Enabled := (bEmpregado);
    frm.cbxEspeciais.Enabled := (bEmpregado);
    frm.cbxTemporarios.Enabled := (bEmpregado);
    frm.cbxEstagiarios.Enabled := (bEmpregado);
    frm.cbxTerceiros.Enabled := (bEmpregado);
    frm.cbxPropDirSemVinc.Enabled := (bEmpregado);
    frm.cbxAutonomos.Enabled := (bEmpregado);

    if (frm.ShowModal = mrOk) then
    begin
      if (frm.ListaCodFunc.Count > 0) then
      begin
        for c:=0 to chklstPessoasNaoInscritas.Items.Count-1 do
          chklstPessoasNaoInscritas.Checked[c] := false;

        for c:=0 to frm.ListaCodFunc.Count-1 do
        begin
          iPos := ListaCodPessoasNaoInscritas.IndexOf(frm.ListaCodFunc[c]);
          if (iPos > -1) then
            chklstPessoasNaoInscritas.Checked[iPos] := true;
        end;

        InscreverPessoas;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmRegTreinColetivo.SelPessoas;
begin
  // Pessoas Não Inscritas
  if (OrdemPorNome) then
    SelPessoasNaoInscritas(opNome)
  else
    SelPessoasNaoInscritas(opTipoNome);

  // Pessoas Inscritas
  SelPessoasInscritas;

  CtrlRegTrein.AtualizarWherePessoas(bEmpregado, CdsCurso.FieldByName('IDCURSO').asFloat,
    FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
    FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
    dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date,
    edLocalCurso.Text, edDataHora.Text);

  bbtnAtualizaInscricoes.Enabled := (chklstPessoasInscritas.Items.Count > 0);
  bbtnSelecionaInscricoes.Enabled := (chklstPessoasNaoInscritas.Items.Count > 0);
  sbtnImprimirCarta.Enabled := (chklstPessoasNaoInscritas.Items.Count > 0);
  cbxRateia.Visible := (chklstPessoasInscritas.Items.Count > 0);
end;

procedure TfrmRegTreinColetivo.SelPessoasNaoInscritas(Ordem: TOrdemPessoas);
begin
  dmCds.Cds.Data := CtrlRegTrein.ListPessoasNaoInscritasNoCurso(
    bEmpregado, FU.IFF(NovoTreinamento, -1, CdsCurso.FieldByName('IDCURSO').asFloat),
    FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
    FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
    dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date, Ordem,
    edLocalCurso.Text, edDataHora.Text);

  chklstPessoasNaoInscritas.Items.BeginUpdate;
  ListaCodPessoasNaoInscritas.Clear;
  chklstPessoasNaoInscritas.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstPessoasNaoInscritas.Items.Add(Copy(dmCds.Cds.FieldByName('NOME').asString +
      FU.Replicate(' ',37),1,32) +' '+ dmCds.Cds.FieldByName('TIPOCONTRATO').asString);
    ListaCodPessoasNaoInscritas.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    dmCds.Cds.Next;
  end;
  chklstPessoasNaoInscritas.Items.EndUpdate;
  OrdemPorNome := (Ordem = opNome);
end;

procedure TfrmRegTreinColetivo.SelPessoasInscritas;
begin
  dmCds.Cds.Data := CtrlRegTrein.ListPessoasInscritasNoCurso(true,
    FU.IFF(NovoTreinamento, -1, CdsCurso.FieldByName('IDCURSO').asFloat),
    FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
    FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
    dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date,
    edLocalCurso.Text, edDataHora.Text);

  chklstPessoasInscritas.Items.BeginUpdate;
  ListaCodPessoasInscritas.Clear;
  ListaNumSeqPessoasInscritas.Clear;
  chklstPessoasInscritas.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstPessoasInscritas.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    ListaCodPessoasInscritas.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    ListaNumSeqPessoasInscritas.Add(dmCds.Cds.FieldByName('NUMSEQ').asString);
    dmCds.Cds.Next;
  end;
  chklstPessoasInscritas.Items.EndUpdate;
end;

procedure TfrmRegTreinColetivo.LimparDadosTela;
begin
  dblckEntid.Text := '';
  edLocalCurso.Text := '';
  CdsMemos.Edit;
  CdsMemos.FieldByName('DATAHORA').asString := '';
  CdsMemos.FieldByName('INSTRUTORES').asString := '';
  CdsMemos.Post;
  rgControle.ItemIndex := 0;
  dtedIniPlan.Text := '';
  dtedFimPlan.Text := '';
  dtedIniReal.Text := '';
  dtedFimReal.Text := '';
  redTeoria.Value := 0;
  redPratica.Value := 0;
  redTotal.Value := 0;
  redValCurso.Value := 0;
  redValViagem.Value := 0;
  redValHosp.Value := 0;
  redValOutras.Value := 0;
  bbtnAtualizaInscricoes.Enabled := false;
  bbtnSelecionaInscricoes.Enabled := false;
  sbtnImprimirCarta.Enabled := false;
  bbtnSelTodos.Visible := False;
  bbtnInverteSel.Visible := False;
  cbxRateia.Visible := False;
  cbxRateia.Checked := False;
end;

procedure TfrmRegTreinColetivo.PreencherDadosTela;
begin
  LimparDadosTela;
  dblckEntid.Text := CdsHstTrn.FieldByName('NOME').asString;
  CdsEntid.Locate('IDPESSOA', CdsHstTrn.FieldByName('IDENTIDINSTR').asInteger,[]);
  dblckInstrutor.Text := CdsHstTrn.FieldByName('INSTRUTOR').asString;
  CdsInstrutor.Locate('IDPESSOA',CdsHstTrn.FieldByName('IDINSTRUTOR').asInteger,[]);

  edLocalCurso.Text    := CdsHstTrn.FieldByName('LOCALCURSO').asString;
  CdsMemos.EmptyDataSet;
  CdsMemos.Insert;
  CdsMemos.FieldByName('DATAHORA').asString := CdsHstTrn.FieldByName('DATAHORA').asString;
  CdsMemos.FieldByName('INSTRUTORES').asString := CdsHstTrn.FieldByName('INSTRUTORES').asString;
  CdsMemos.Post;
  rgAvalCurs.ItemIndex := 1 - CdsHstTrn.FieldByName('FLGAVALCURS').asInteger;
  rgControle.ItemIndex := 1 - CdsHstTrn.FieldByName('FLGCONTROLE').asInteger;

  if not(CdsHstTrn.FieldByName('DATPLINI').IsNull) then
    dtedIniPlan.Date := CdsHstTrn.FieldByName('DATPLINI').asDateTime;

  if not(CdsHstTrn.FieldByName('DATPLFIM').IsNull) then
    dtedFimPlan.Date := CdsHstTrn.FieldByName('DATPLFIM').asDateTime;

  if not(CdsHstTrn.FieldByName('DATREINI').IsNull) then
    dtedIniReal.Date := CdsHstTrn.FieldByName('DATREINI').asDateTime;

  if not(CdsHstTrn.FieldByName('DATREFIM').IsNull) then
    dtedFimReal.Date := CdsHstTrn.FieldByName('DATREFIM').asDateTime;

  redTeoria.Value := CdsCurso.FieldByName('DUR_TEOR').asFloat;
  redPratica.Value := CdsCurso.FieldByName('DUR_PRAT').asFloat;
  redTotal.Value := redTeoria.Value + redPratica.Value;
  redValCurso.Value := CdsCurso.FieldByName('VALOR').asFloat;
end;

function TfrmRegTreinColetivo.Validar(Operacao: string): boolean;
begin
  Result :=
    ((dtedFimReal.Text <> '') and
     (MsgDlg('Curso Já Realizado.'+CR_LF+
             'Confirma a ' +Operacao+ ' da(s) Pessoa(s) Selecionada(s)?',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes)) or
    ((dtedFimReal.Text = '') and (dtedIniReal.Text <> '') and
     (MsgDlg('Curso Já Iniciado.'+CR_LF+
             'Confirma a ' +Operacao+ ' da(s) Pessoa(s) Selecionada(s)?',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes)) or
    ((dtedFimReal.Text = '') and (dtedIniReal.Text = '') and
     (MsgDlg('Confirma a ' +Operacao+ ' da(s) Pessoa(s) Selecionada(s)?',
           'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes));
end;

procedure TfrmRegTreinColetivo.InscreverPessoas;
var
  bOk: boolean;
  c, iProxNumSeq: integer;
  sListaCodPessoas, sListaNomePessoas, sListaCodPessoasComCurso,
  sListaNomePessoasComCurso: string;
  ListaCodPessoas, ListaNomePessoas, ListaProxNumSeqPessoas: TStringList;
begin
  ListaCodPessoas := TStringList.Create;
  ListaNomePessoas := TStringList.Create;
  ListaProxNumSeqPessoas := TStringList.Create;

  sDataFinalDepois := dtedFimReal.Text;
  sDataIniDepois := dtedIniReal.Text;
  sListaCodPessoas := '';
  sListaNomePessoas := '';

  dmCds.Cds.Data := CtrlRegTrein.GetUltNumSeq(CdsCurso.FieldByName('IDCURSO').asFloat);
  for c:=0 to chklstPessoasNaoInscritas.Items.Count-1 do
  begin
    if (chklstPessoasNaoInscritas.Checked[c]) then
    begin
      if (dmCds.Cds.Locate('IDPESSOA', ListaCodPessoasNaoInscritas[c], [])) then
        iProxNumSeq := dmCds.Cds.FieldByName('ULT_NUM_SEQ').asInteger + 1
      else
        iProxNumSeq := 1;

      if (iProxNumSeq > 1) then
      begin
        ListaCodPessoas.Add(ListaCodPessoasNaoInscritas[c]);
        ListaNomePessoas.Add(Trim(Copy(chklstPessoasNaoInscritas.Items[c],1,32)));
        ListaProxNumSeqPessoas.Add(IntToStr(iProxNumSeq));
      end
      else
      if (sListaCodPessoas = '') then
      begin
        sListaCodPessoas := ListaCodPessoasNaoInscritas[c];
        sListaNomePessoas := Trim(Copy(chklstPessoasNaoInscritas.Items[c],1,32));
      end
      else
      begin
        sListaCodPessoas := sListaCodPessoas +','+ ListaCodPessoasNaoInscritas[c];
        sListaNomePessoas := sListaNomePessoas +','+
          Trim(Copy(chklstPessoasNaoInscritas.Items[c],1,32));
      end;
    end;
  end;

  ListarPessoasComCurso(sListaCodPessoasComCurso, sListaNomePessoasComCurso,
    ListaCodPessoas, ListaNomePessoas, ListaProxNumSeqPessoas, dblckCurso.Text);
  if (sListaCodPessoasComCurso <> '') then
    if (sListaCodPessoas = '') then
    begin
      sListaCodPessoas := sListaCodPessoasComCurso;
      sListaNomePessoas := sListaNomePessoasComCurso;
    end
    else
    begin
      sListaCodPessoas := sListaCodPessoas +','+ sListaCodPessoasComCurso;
      sListaNomePessoas := sListaNomePessoas +','+ sListaNomePessoasComCurso;
    end;

  if (sListaCodPessoas = '') then
    bOk := true
  else
  begin
    frmAguarde.Mostra('Inscrevendo Pessoas...');
    bOk := (CtrlRegTrein.EfetuarInscricoes(
      bEmpregado, IdTipoProcesso, sListaCodPessoas, sListaNomePessoas,
      CdsCurso.FieldByName('IDCURSO').asFloat, 1 - rgControle.ItemIndex,
      1 - rgAvalCurs.ItemIndex,
      FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
      FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
      dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date,
      redTeoria.Value, redPratica.Value, redValCurso.Value, redValViagem.Value,
      redValHosp.Value, redValOutras.Value, dblckCurso.Text, edLocalCurso.Text,
      CdsMemos.FieldByName('DATAHORA').asString, CdsMemos.FieldByName('INSTRUTORES').asString,
      (sDataFinalAntes = '') and (sDataFinalDepois <> '') and (rgAvalCurs.ItemIndex = 0) and
      (rgControle.ItemIndex = 0)));
    frmAguarde.Apaga;
  end;

  if (bOk) then
  begin
    NovoTreinamento := false;
    SelPessoas;
    tbntbDados.PageIndex := 1;
  end
  else
    raise Exception.Create(CtrlRegTrein.MessageInfo);

  ListaCodPessoas.Free;
  ListaNomePessoas.Free;
  ListaProxNumSeqPessoas.Free;
end;

procedure TfrmRegTreinColetivo.bbtnProcLocalClick(Sender: TObject);
begin
  inherited;
  MontaSelectLocal.Executar;
  if (MontaSelectLocal.RetornouValor) then
    edLocalCurso.Text := MontaSelectLocal.ValoresChave[2];

end;

procedure TfrmRegTreinColetivo.sbtnImprimirRelatClick(Sender: TObject);
var
  Rpt: TRptRelEvento;
begin
  Rpt := TRptRelEvento.Create(Application);

  Rpt.sCurso := dblckCurso.Text;
  Rpt.sEntid := dblckEntid.Text;
  Rpt.sInstrutor := dblckInstrutor.Text;
  Rpt.sLocal      := edLocalCurso.Text;
  Rpt.sDataHora   := CdsMemos.FieldByName('DATAHORA').asString;
  Rpt.sInstrutores:= CdsMemos.FieldByName('INSTRUTORES').asString;
  Rpt.sCarga   := redTotal.Text;
  Rpt.sIdCurso := CdsCurso.FieldByName('IDCURSO').asString;
  Rpt.sIdEntid := CdsEntid.FieldByName('IDPESSOA').asString;
  Rpt.sIdInstrutor := CdsInstrutor.FieldByName('IDPESSOA').asString;
  Rpt.sIniPlan := dtedIniPlan.Text;
  Rpt.sFimPlan := dtedFimPlan.Text;
  Rpt.sIniReal := dtedIniReal.Text;
  Rpt.sFimReal := dtedFimReal.Text;
  Rpt.sDataIni := FU.IFF(dtedIniPlan.Text='', dtedIniReal.Text, dtedIniPlan.Text);
  Rpt.sDataFim := FU.IFF(dtedFimPlan.Text='', dtedFimReal.Text, dtedFimPlan.Text);

  //Rpt.CrmRptCMBeforePrint(Sender);
  Rpt.CrmRptCM.IdReports := 4005;
  Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  Rpt.CrmRptCM.OrigemCM := 1;
  Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
  Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  Rpt.CrmRptCM.Print;
  FreeAndNil(Rpt);
end;

procedure TfrmRegTreinColetivo.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstPessoasInscritas.Items.Count-1 do
    chklstPessoasInscritas.Checked[c] := true;
  chklstPessoasInscritas.Repaint;
end;

procedure TfrmRegTreinColetivo.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstPessoasInscritas.Items.Count-1 do
    chklstPessoasInscritas.Checked[c] := not(chklstPessoasInscritas.Checked[c]);
  chklstPessoasInscritas.Repaint;
end;

procedure TfrmRegTreinColetivo.bbtnAlimentaClick(Sender: TObject);
var
  sDataIni, sDataFim, sDataRef: string;
  i, j: integer;
begin
  inherited;
  sDataIni := FU.iff(dtedIniReal.Text = '', dtedIniPlan.Text, dtedIniReal.Text);
  sDataFim := FU.iff(dtedFimReal.Text = '', dtedFimPlan.Text, dtedFimReal.Text);
  if (sDataIni = '') or (sDataFim = '') then
  begin
    MsgDlg('Datas Insuficientes para Esta Função.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (CdsMemos.FieldByName('DATAHORA').asString <> '') and (MsgDlg('Este Procedimento Limpa o Texto Existente. Confirma?',
      'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
    exit;


  CdsMemos.Edit;
  CdsMemos.FieldByName('DATAHORA').asString := '';
  j := 0;
  for i:=1 to Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1) do
  begin
    if ((DayOfWeek((StrToDate(sDataIni) + i - 1)) in [2,3,4,5,6]) or
        (MsgDlg('Haverá aula no '+
         FU.iff(DayOfWeek(StrToDate(sDataIni)+i-1)=1,'domingo','sábado')+
         ' dia '+DateToStr(StrToDate(sDataIni)+i-1)+' ?',
         'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes)) then
    begin
      inc(j);
      if j > 1 then
         CdsMemos.FieldByName('DATAHORA').asString :=
           CdsMemos.FieldByName('DATAHORA').asString + CR_LF;
      sDataRef := DateToStr(StrToDate(sDataIni) + i - 1);
      CdsMemos.FieldByName('DATAHORA').asString :=
        CdsMemos.FieldByName('DATAHORA').asString + sDataRef +
                         ':   das __:__ às __:__ hs.    ';
    end;
  end;

  if length(CdsMemos.FieldByName('DATAHORA').asString) > 1000 then
    CdsMemos.FieldByName('DATAHORA').asString :=
      copy(CdsMemos.FieldByName('DATAHORA').asString, 1, 1000);

  CdsMemos.Post;
end;

procedure TfrmRegTreinColetivo.bbtnBuscaInstrutorExternoClick(
  Sender: TObject);
begin
  inherited;
  if dblckEntid.Text = '' then
  begin
    MsgDlg('Dados Insuficientes para Esta Função.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  MontaSelectExterno.Filtro.Clear;
  MontaSelectExterno.Filtro.Add('IDGRUPO = ' + CdsEntid.FieldByName('IDPESSOA').asString);
  MontaSelectExterno.Executar;
  if (MontaSelectExterno.RetornouValor) then
  begin
    CdsMemos.Edit;
    if CdsMemos.FieldByName('INSTRUTORES').asString <> '' then
      CdsMemos.FieldByName('INSTRUTORES').asString :=
        CdsMemos.FieldByName('INSTRUTORES').asString + ', ' + CR_LF;
    CdsMemos.FieldByName('INSTRUTORES').asString :=
      CdsMemos.FieldByName('INSTRUTORES').asString + MontaSelectExterno.ValoresChave[1];

    if length(CdsMemos.FieldByName('INSTRUTORES').asString) > 1000 then
      CdsMemos.FieldByName('INSTRUTORES').asString :=
        copy(CdsMemos.FieldByName('INSTRUTORES').asString, 1, 1000);

    CdsMemos.Post;
  end;

end;

procedure TfrmRegTreinColetivo.bbtnBuscaInstrutorInternoClick(
  Sender: TObject);
begin
  inherited;
  MontaSelectInterno.Filtro.Clear;
  MontaSelectInterno.Filtro.Add('IE.IDPESSOA = F.IDPESSOA');
  MontaSelectInterno.Filtro.Add('IE.IDPESSOA = P.IDPESSOA');
  MontaSelectInterno.Filtro.Add('IE.IDCURSO  = ' + CdsCurso.FieldByName('IDCURSO').asString);
  MontaSelectInterno.Executar;
  if (MontaSelectInterno.RetornouValor) then
  begin
    CdsMemos.Edit;
    if CdsMemos.FieldByName('INSTRUTORES').asString <> '' then
      CdsMemos.FieldByName('INSTRUTORES').asString :=
        CdsMemos.FieldByName('INSTRUTORES').asString + ', ' + CR_LF;
    CdsMemos.FieldByName('INSTRUTORES').asString :=
      CdsMemos.FieldByName('INSTRUTORES').asString + MontaSelectInterno.ValoresChave[1];

    if length(CdsMemos.FieldByName('INSTRUTORES').asString) > 1000 then
      CdsMemos.FieldByName('INSTRUTORES').asString :=
        copy(CdsMemos.FieldByName('INSTRUTORES').asString, 1, 1000);

    CdsMemos.Post;
  end;
end;

procedure TfrmRegTreinColetivo.sbtnImprimirCertifClick(Sender: TObject);
var
  c: integer;
  Rpt: TRptCertificado;
begin
  if (dtedFimReal.Text = '') then
  begin
    MsgDlg(Translate('Cerrtificado Apenas para Curso Já Concluído.'), Translate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  Rpt := TRptCertificado.Create(Application);

  if (Rpt.CmpRptCM.Execute) then
  begin
    case (Rpt.CmpRptCM.ParamByName('Todos').asInteger) of
      0 :
      begin
        Rpt.sPessoasInscritas := '';
        for c:=0 to ListaCodPessoasInscritas.Count-1 do
          if (Rpt.sPessoasInscritas = '') then
            Rpt.sPessoasInscritas := ListaCodPessoasInscritas[c]
          else
            Rpt.sPessoasInscritas := Rpt.sPessoasInscritas +','+ ListaCodPessoasInscritas[c];
      end;
      1 : FU.CriaListaOpcoes(chklstPessoasInscritas, ListaCodPessoasInscritas,
                             Rpt.sPessoasInscritas, ',', false);
    end;

    Rpt.sCurso := dblckCurso.Text;
    Rpt.sEntid := dblckEntid.Text;
    Rpt.sInstrutor := dblckInstrutor.Text;
    Rpt.sIdCurso := CdsCurso.FieldByName('IDCURSO').asString;
    Rpt.sIdEntid := CdsEntid.FieldByName('IDPESSOA').asString;
    Rpt.sIdInstrutor := CdsInstrutor.FieldByName('IDPESSOA').asString;
    Rpt.sIniPlan := dtedIniPlan.Text;
    Rpt.sFimPlan := dtedFimPlan.Text;
    Rpt.sIniReal := dtedIniReal.Text;
    Rpt.sFimReal := dtedFimReal.Text;
    Rpt.sDataIni := dtedIniReal.Text;
    Rpt.sDataFim := dtedFimReal.Text;

    Rpt.CrmRptCM.IdReports := 4377;
    Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    Rpt.CrmRptCM.OrigemCM := 1;
    Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
    Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
    Rpt.CrmRptCM.Print;
  end;
  FreeAndNil(Rpt);
end;

end.
