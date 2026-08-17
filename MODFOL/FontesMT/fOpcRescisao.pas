{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
Nº Solicitação...: WO 18460
Data da Alteração: 04/02/2025
Responsável......: Leandro Pocebon
Descrição........: Reajuste na funcionalidade de geração da folha de rescisão
                   para melhorar a usuabilidade do usuário ao selecionar mais de
                   um empregado para gerar a folha.
--------------------------------------------------------------------------------
Funcao...........: montaListaEmpregadoSelData
Nº Solicitação...: WO 18459
Data da Alteração: 29/01/2025
Responsável......: Leandro Pocebon
Descrição........: Alterada busca funcionarios para lista quando
                   "Rescisão de Contrato" ID 14 ou "Rescisão Complementar" ID 15
--------------------------------------------------------------------------------
Nº Solicitação...: WO18442
Data da Alteração: 23/01/2025
Responsável......: Everson Cunha
Descrição........: ETL para processamento da Folha de Rescisão Complementar
--------------------------------------------------------------------------------
Nº Solicitação...: WO 11765
Data da Alteração: 25/06/2024
Responsável......: Everson Cunha
Descrição........: Inclusão do ETL para processamento da Folha de Rescisão
--------------------------------------------------------------------------------}

unit fOpcRescisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  Db, DBClient, uCMClientDataSet, StdCtrls, CheckLst, ColorCheckListBox,
  wwdbdatetimepicker, CMDateTimePicker, Buttons, wwdblook, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn,  TB97Tlbr, TB97, DBTables, FileCtrl, fcLabel,
  TB97Tlwn, BfDialogs, Wwdatsrc, BrowseFolder, uProcuraDir,
  uCtrlGlobalRH, uCtrlMotivo, uCtrlListTerceirosRH, uCtrlBancoPortFolha, fParamCAP_GeraCalc,
  fSelRub_ResciContr, uCmSqlParams;

type
  TfrmOpcRescisao = class(TfrmOkCancelar)
    CdsMotivo: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    rgProcesso: TRadioGroup;
    rgRescisaoCompl: TRadioGroup;
    gbxFolhaRescCompl: TGroupBox;
    dblckMotivoCompl: TwwDBLookupCombo;
    rgSelTudo: TRadioGroup;
    gbxPeriodo: TGroupBox;
    dtedIni: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    rgSelRubricas: TRadioGroup;
    gbxTipoDoc: TGroupBox;
    dblckTipoDoc: TwwDBLookupCombo;
    rgProcLancPrev: TRadioGroup;
    sbtMostraSitFunc: TSpeedButton;
    gbxDataPag: TGroupBox;
    dtDataPag: TCMDateTimePicker;
    rbDataPagHomologacao: TRadioButton;
    rbDataPagInformada: TRadioButton;
    cbxTmpDesc: TCheckBox;
    chkETL: TCheckBox;
    cdsAux: TCMClientDataSet;
    gbxEmpregados: TGroupBox;
    chklstFunc: TColorCheckListBox;
    bbtnSelPessoa: TBitBtn;
    bbtnInvPessoa: TBitBtn;
    pnlSitFunc: TPanel;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    edtSelEmpregados: TEdit;
    btnSelEmpregados: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSelTudoClick(Sender: TObject);
    procedure rgRecisaoClick(Sender: TObject);
    procedure rgRescisaoComplClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgProcessoClick(Sender: TObject);
    procedure dblckTipoDocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgSelRubricasClick(Sender: TObject);
    procedure sbtMostraSitFuncClick(Sender: TObject);
    procedure pnlSitFuncEnter(Sender: TObject);
    procedure pnlSitFuncExit(Sender: TObject);
    procedure rbDataPagInformadaClick(Sender: TObject);
    procedure dblckMotivoChange(Sender: TObject);
    function montaListaEmpregadoSel(pListaTipoContratoSel: String; pDataInicial, pDataFinal: TDate) : Boolean;
    function montaListaEmpregadoSelData(pListaTipoContratoSel: String; pDataInicial, pDataFinal: TDate) : OleVariant;
    function CriarListaEmpregados(pDataInicial, pDataFinal: TDate) : Boolean;
    procedure dtedIniChange(Sender: TObject);
    procedure dtedFimChange(Sender: TObject);
    procedure bbtnSelPessoaClick(Sender: TObject);
    procedure bbtnInvPessoaClick(Sender: TObject);
    procedure btnSelEmpregadosClick(Sender: TObject); // WO18460 leandro
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlBancoPortFolha: TCtrlBancoPortFolha;

    TelaParamCAP: TfrmParamCAP_GeraCalc;
    TelaSelRubricas: TfrmSelRub_ResciContr;

    ListaTipoDesemb, ListaIdFunc,ListaMatFunc: TStringList; //wo18460 leandro  

    bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
  public
    SelRubricas: boolean;
    SelTodosNoPeriodo: boolean;
    FazPagEletronico: boolean;
    FazCAP: boolean;
    FazRescisaoCompl: boolean;
    RateioCC: boolean;
    CriarDocIndividual: boolean;
    ConsTipoDesemb: boolean;

    ListaIdRubricaSel: string;
    ListaTipoDesembSel: string;
    ListaTipoContratoSel: string;
    ListaEmpregadoSel: String; //Everson Cunha WO18442
    DiretorioArqPag: string;
    Conta: string;

    NormalIni: TDate;
    NormalFim: TDate;
    DataInicial: TDate;
    DataFinal: TDate;

    Processo: integer;
    TipoSelMotivo: integer;  
    IdMotivo: integer;
    IdMotivoRescisaoCompl: integer;
    OpcaoPrevia: integer;
    CodTipoDoc: integer;
    CodPortForma: integer;
    Plano: integer;
  end;

var
  frmOpcRescisao: TfrmOpcRescisao;

implementation

uses uMensErro, dCds, uSistema, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmOpcRescisao.FormCreate(Sender: TObject);
var
  IdMotivoPadrao: string;
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  CtrlBancoPortFolha.InitializeAs(Padroes);

  ListaTipoDesemb := TStringList.Create;

  ListaIdFunc := TStringList.Create; //wo18460 leandro
  ListaMatFunc := TStringList.Create; //wo18460 leandro

  TelaParamCAP := TfrmParamCAP_GeraCalc.Create(Self);
  TelaParamCAP.ExibeDataPagamento := false;
  TelaSelRubricas := TfrmSelRub_ResciContr.Create(Self);

  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');
  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH(
    'IDMOTIVORESCISAO, LIMADM, NORMALINI, NORMALFIM');

  //WO18460v Leandro inicio
  if (dmCds.Cds.FieldByName('LIMADM').asInteger < 5) then
  //  rgOpcaoPrevia.ItemIndex := dmCds.Cds.FieldByName('LIMADM').asInteger;
    OpcaoPrevia := dmCds.Cds.FieldByName('LIMADM').asInteger
  else
    OpcaoPrevia := 0;
  //WO18460v Leandro fim

  IdMotivoPadrao := dmCds.Cds.FieldByName('IDMOTIVORESCISAO').asString;

  //WO18460v Leandro inicio
  //dblckMotivo.LookupValue := IdMotivoPadrao;
  //dblckMotivo.Update;

  //if (dblckMotivo.LookupValue <> '') then
  //  rgMotivo.ItemIndex := 2
  //else
  //  rgMotivo.ItemIndex := TipoSelMotivo;
  //rgMotivoClick(Self);

  rgRescisaoComplClick(Self);
  rgSelTudoClick(Self);
  //WO18460v Leandro inicio

  NormalIni := dmCds.Cds.FieldByName('NORMALINI').asDateTime;
  NormalFim := dmCds.Cds.FieldByName('NORMALFIM').asDateTime;

  //dtedIni.Date := NormalIni; //wo18460 leandro
  dtedIni.Date :=  NormalIni;   //wo18460 leandro
  dtedFim.Date := NormalFim;

  rgProcLancPrev.Visible := (Sistema.TipoEmpresa = 'P');
  cbxTmpDesc.Visible := (Sistema.TipoEmpresa = 'P');
end;

procedure TfrmOpcRescisao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlBancoPortFolha);

  FreeAndNil(TelaParamCAP);
  FreeAndNil(TelaSelRubricas);

  FreeAndNil(ListaTipoDesemb);

  FreeAndNil(ListaIdFunc); //wo18460 leandro
  FreeAndNil(ListaMatFunc); //wo18460 leandro

  inherited;
end;

procedure TfrmOpcRescisao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Processo := rgProcesso.ItemIndex;
  //WO18460v Leandro inicio
  //TipoSelMotivo := rgMotivo.ItemIndex;
  TipoSelMotivo := 0;
  //WO18460v Leandro fim
  SelTodosNoPeriodo := boolean(rgSelTudo.ItemIndex);

  ListaTipoContratoSel := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, false);

  if (rgSelTudo.ItemIndex = 1) then
  begin
    DataInicial := dtedIni.Date;
    DataFinal := dtedFim.Date;

    montaListaEmpregadoSel(ListaTipoContratoSel, DataInicial, DataFinal); //Everson Cunha WO18442
  end
  else
  begin
    DataInicial := 0;
    DataFinal := 0;

    ListaEmpregadoSel := ''; //Everson Cunha WO18442
  end;

  FazRescisaoCompl := (rgRescisaoCompl.ItemIndex = 1);

  //wo18460 leandro inicio
  //TipoSelMotivo := rgMotivo.ItemIndex;
  TipoSelMotivo := 2;

  //if (rgMotivo.ItemIndex = 2) then
  //  IdMotivo := FU.StrInt(dblckMotivo.LookupValue)
  //else
  //  IdMotivo := 0;

  //TipoSelMotivo := rgMotivo.ItemIndex;

  if (rgRescisaoCompl.ItemIndex = 1) then
  begin
    IdMotivoRescisaoCompl := FU.StrInt(dblckMotivoCompl.LookupValue);
    IdMotivo := 0;
  end
  else
  begin
    IdMotivo := FU.StrInt(dblckMotivoCompl.LookupValue);
    IdMotivoRescisaoCompl := 0;
  end;
  //wo18460 leandro inicio

  SelRubricas := (rgSelRubricas.ItemIndex = 0);
  //OpcaoPrevia := rgOpcaoPrevia.ItemIndex; //WO18460 Leandro
  CodTipoDoc := FU.StrInt(dblckTipoDoc.LookupValue);
  FazPagEletronico := (TelaParamCAP.chkPagEletronico.Checked) and (Trim(dblckTipoDoc.Text)<>'');
  FazCAP := (TelaParamCAP.chkCAP.Checked) and (Trim(dblckTipoDoc.Text)<>'');

  CodPortForma := FU.StrInt(TelaParamCAP.dblckPortadorForma.LookupValue);
  DiretorioArqPag := TelaParamCAP.edPastaArqPag.Text;
  RateioCC := TelaParamCAP.chkRateioCC.Checked;
  CriarDocIndividual := TelaParamCAP.chkCriaDocIndividual.Checked;
  ConsTipoDesemb := TelaParamCAP.chkConsTipoDesemb.Checked;
  Plano := TelaParamCAP.iPlano;
  Conta := TelaParamCAP.CMProcuraMaskContabil.Conta.Numero;

  inherited;
  Action := caHide;
end;

procedure TfrmOpcRescisao.pnlSitFuncEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmOpcRescisao.pnlSitFuncExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end;

  CriarListaEmpregados(dtedIni.Date, dtedFim.Date); //wo18460 leandro

end;

procedure TfrmOpcRescisao.dblckTipoDocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Trim(dblckTipoDoc.Text) <> '') then
  begin
    if (TelaParamCAP.ShowModal <> mrOk) then
    begin
      dblckTipoDoc.Text := '';
      dblckTipoDoc.SetFocus;
    end;
    ListaTipoDesembSel := TelaParamCAP.sListaTipoDesembSel;
  end;
end;

procedure TfrmOpcRescisao.rgProcessoClick(Sender: TObject);
begin
  //rgOpcaoPrevia.Visible := (rgProcesso.ItemIndex = 0); //WO18460
end;

procedure TfrmOpcRescisao.rgSelTudoClick(Sender: TObject);
begin
  if (rgSelTudo.ItemIndex = 0) then
    Height := 307
  else
    Height := 595;

// Redefine o formulário para centralizar imediatamente
  Left := (Screen.Width div 2) - (Width div 2);
  Top := (Screen.Height div 2) - (Height div 2);

  CriarListaEmpregados(dtedIni.Date, dtedFim.Date); //wo18460 leandro

end;

procedure TfrmOpcRescisao.sbtMostraSitFuncClick(Sender: TObject);
begin
  pnlSitFunc.Visible := (sbtMostraSitFunc.Down) and (gbxPeriodo.Visible);
  if (pnlSitFunc.Visible) then
    pnlSitFunc.SetFocus;

  //wo18460 leandro inicio
  gbxEmpregados.Visible    := (sbtMostraSitFunc.Down) and (gbxPeriodo.Visible);
  edtSelEmpregados.Visible := (sbtMostraSitFunc.Down) and (gbxPeriodo.Visible);
  btnSelEmpregados.Visible := (sbtMostraSitFunc.Down) and (gbxPeriodo.Visible);
  //wo18460 leandro fim


end;

procedure TfrmOpcRescisao.rgRecisaoClick(Sender: TObject);
begin
  // gbxFolhaResc.Visible := (rgMotivo.ItemIndex = 2); // wo18460 leandro
end;

procedure TfrmOpcRescisao.rgRescisaoComplClick(Sender: TObject);
begin
  //WO18460 LEANDRO inicio
  // gbxFolhaRescCompl.Visible := (rgRescisaoCompl.ItemIndex = 1);
  if (rgRescisaoCompl.ItemIndex = 0) then
    dblckMotivoCompl.LookupValue := '14'
  else
    dblckMotivoCompl.LookupValue := '15';
  dblckMotivoCompl.Update;
  //WO18460 LEANDRO fim
end;

procedure TfrmOpcRescisao.rgSelRubricasClick(Sender: TObject);
begin
  if (rgSelRubricas.ItemIndex = 0) then
    if (TelaSelRubricas.ShowModal = mrOk) then
      ListaIdRubricaSel := TelaSelRubricas.ListaIdRubricaSel
    else
    begin
      ListaIdRubricaSel := '';
      rgSelRubricas.ItemIndex := 1;
    end;
end;

procedure TfrmOpcRescisao.rbDataPagInformadaClick(Sender: TObject);
begin
  dtDataPag.Visible := rbDataPagInformada.Checked;
end;

procedure TfrmOpcRescisao.bbtnConfirmarClick(Sender: TObject);
var
  bSelFunc: boolean;
  c : integer;
begin
  if (rgRescisaoCompl.ItemIndex = 1) and (Trim(dblckMotivoCompl.Text) = '') then
  begin
    MsgDlg('Informe o Tipo de Folha de Rescisão Complementar.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  //wo18460 leandro inicio
  if  rgSelTudo.ItemIndex = 1 then
  begin
    bSelFunc := false;
    for c:=0 to chklstFunc.Items.Count-1 do
      if (chklstFunc.Checked[c]) then
      begin
        bSelFunc := true;
        break;
      end;

    if not(bSelFunc) then
    begin
      MsgDlg('Pelo menos um Empregado deve ser selecionado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      chklstFunc.SetFocus;
      ModalResult := mrNone;
      exit;
    end;
  end;
  //wo18460 leandro fim
end;

//Everson Cunha - WO 11765 - Inicio
procedure TfrmOpcRescisao.dblckMotivoChange(Sender: TObject);
begin
  inherited;

  if CdsMotivo.FieldByName('flg_etl').AsString = 'N' then
  begin
    chkETL.Checked := False;
    chkETL.Enabled := False;
  end
  else
  if CdsMotivo.FieldByName('flg_etl').AsString = 'S' then
  begin
    chkETL.Checked := False;
    chkETL.Enabled := True;
  end
  else
  if CdsMotivo.FieldByName('flg_etl').AsString = 'O' then
  begin
    chkETL.Checked := True;
    chkETL.Enabled := False;
  end;
end;
//Everson Cunha - WO 11765 - Fim

//Everson Cunha - WO18442 - Ini
function TfrmOpcRescisao.montaListaEmpregadoSel(
  pListaTipoContratoSel: String; pDataInicial, pDataFinal: TDate): Boolean;
var
  _SQL: TStringList;
  c : integer;
begin
  ListaEmpregadoSel := '';

  if (pDataInicial <> 0) and (pListaTipoContratoSel <> '') then
  begin
    _SQL := TStringList.Create;

    //wo18460 leandro inicio
    {with (_SQL) do
    begin
      Clear;

      //Mesmo SQL do TCtrlGeraFolPagResc.AbrirSQLFunc
      Add('SELECT');
      Add('  F.IDPESSOA, F.IDEMPRESA, F.CODCENTROCUSTO, F.MATRICULA,');
      Add('  F.IDMOTIVODESLIGRAIS, F.IDMOTIVODESLIGGERENCIAL, P.NOME,');
      Add('  F.DATAADMISSAO, F.DATADESLIGAMENTO');
      Add('FROM');
      Add('  PESSOA P, FUNCIONARIO F, SITFUNC SF');
      Add('WHERE');
      Add('  (SF.TIPOSIT          = ''D'') AND');
      Add('  (SF.IDSITFUNC        = F.IDSITFUNC) AND');
      Add('  (F.DATADESLIGAMENTO >= TO_DATE(' +
        QuotedStr(DateToStr(pDataInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATADESLIGAMENTO <= TO_DATE(' +
        QuotedStr(DateToStr(pDataFinal))+',''DD/MM/YYYY'')) AND');
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',FU.QuotedListaString(pListaTipoContratoSel,','),5));
      Add('  (F.IDPESSOA          = P.IDPESSOA)');
      Add('ORDER BY');
      Add('  MATRICULA');
    end;
    }
    try
      {cdsAux.Data := FU.GetDataPacket(_SQL.Text);


      while not cdsAux.Eof do
      begin
        ListaEmpregadoSel := ListaEmpregadoSel + cdsAux.fieldbyname('IDPESSOA').AsString + ', ';

        cdsAux.Next;
      end;
      }

      for c:=0 to chklstFunc.Items.Count-1 do
      if (chklstFunc.Checked[c]) then
      begin
        ListaEmpregadoSel := ListaEmpregadoSel + ListaIdFunc[c] + ', ';

      end;

    //wo18460 leandro fim

      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        MsgDlg(E.Message, 'Aviso', mtError, [mbOk], 0);
      end;
    end;

    _SQL.Free;
  end;
end;
//Everson Cunha - WO18442 - Fim

//Leandro - WO18459 - Ini
function TfrmOpcRescisao.montaListaEmpregadoSelData(pListaTipoContratoSel: String; pDataInicial, pDataFinal: TDate) : OleVariant;
var
  _SQL: TStringList;
begin
  if (pDataInicial <> 0)  then
  begin
    _SQL := TStringList.Create;

    with (_SQL) do
    begin
      Clear;

      //Mesmo SQL do TCtrlGeraFolPagResc.AbrirSQLFunc
      Add('SELECT');
      Add('  F.IDPESSOA, F.IDEMPRESA, F.CODCENTROCUSTO, F.MATRICULA,');
      Add('  F.IDMOTIVODESLIGRAIS, F.IDMOTIVODESLIGGERENCIAL, P.NOME,');
      Add('  F.DATAADMISSAO, F.DATADESLIGAMENTO');
      Add('FROM');
      Add('  PESSOA P, FUNCIONARIO F, SITFUNC SF');
      Add('WHERE');
      Add('  (SF.TIPOSIT          = ''D'') AND');
      Add('  (SF.IDSITFUNC        = F.IDSITFUNC) AND');
      Add('  (F.DATADESLIGAMENTO >= TO_DATE(' +
        QuotedStr(DateToStr(pDataInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATADESLIGAMENTO <= TO_DATE(' +
        QuotedStr(DateToStr(pDataFinal))+',''DD/MM/YYYY'')) AND');
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',FU.QuotedListaString(pListaTipoContratoSel,','),5));
      Add('  (F.IDPESSOA          = P.IDPESSOA)');
      Add('ORDER BY');
      Add('  MATRICULA');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry2.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

    end;

  end;

  Result := FU.GetDataPacket(_SQL.Text);

end;

function TfrmOpcRescisao.CriarListaEmpregados(pDataInicial, pDataFinal: TDate): Boolean;
begin
  ListaEmpregadoSel := '';
  ListaTipoContratoSel := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
                                                       cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, false);

  if (pDataInicial <> 0) and (ListaTipoContratoSel <> '') then
  begin
    try

      cdsAux.Data := montaListaEmpregadoSelData(ListaTipoContratoSel, pDataInicial, pDataFinal);

      ListaIdFunc.Clear;
      ListaMatFunc.Clear;
      chklstFunc.Items.Clear;

      while not cdsAux.Eof do
      begin
        ListaIdFunc.Add(cdsAux.FieldByName('IDPESSOA').asString);
        ListaMatFunc.Add(cdsAux.FieldByName('MATRICULA').asString);
        chklstFunc.Items.Add(cdsAux.FieldByName('NOME').asString);
        chklstFunc.Checked[chklstFunc.Items.Count-1] := true;

        cdsAux.Next;
      end;

      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        MsgDlg(E.Message, 'Aviso', mtError, [mbOk], 0);
      end;
    end;

  end;
end;
//Leandro - WO18459 - Fim

procedure TfrmOpcRescisao.dtedIniChange(Sender: TObject);
begin
  inherited;
  CriarListaEmpregados(dtedIni.Date, dtedFim.Date); //wo18460 leandro

end;

procedure TfrmOpcRescisao.dtedFimChange(Sender: TObject);
begin
  inherited;
  CriarListaEmpregados(dtedIni.Date, dtedFim.Date); //wo18460 leandro

end;

procedure TfrmOpcRescisao.bbtnSelPessoaClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;

end;

procedure TfrmOpcRescisao.bbtnInvPessoaClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;

end;

procedure TfrmOpcRescisao.btnSelEmpregadosClick(Sender: TObject);
var
  slLista: TStringList;
  x, i: Integer;
  sLin, sIni, sFim: String;
  bIni, bFim: Boolean;
  sMatErro: String;

  function StrCount(SubStr, S: String): Integer;
  begin
    Result := 0;
    while Pos(SubStr, S) > 0 do
    begin
      Delete(S, Pos(SubStr, S), 1);
      Result := Result + 1;
    end;

  end;

begin
  inherited;

  if Trim(edtSelEmpregados.Text) <> '' then
  begin
    slLista := TStringList.Create;
    try
      slLista.Text := StringReplace(edtSelEmpregados.Text, ';', #13#10, [rfReplaceAll]);

      // Fazendo a validação dos dados
      //7.4. - Qualquer informação no novo campo texto, diferente de NNN e NNN;NNN;NNN;...
      //       e NNN-NNN e A e A;A;A;A;... e A-A o sistema vai emitir uma mensagem de erro
      //       informando que o formato do campo foi digitado errado pelo usuário
      for x := 0 to slLista.Count-1 do
      begin
        sLin := slLista[x];

        if (Trim(sLin) <> '') then
        begin

          case StrCount('-', sLin) of
            0: begin
                 sIni := sLin;
                 sFim := sLin;
               end;
            1: begin
                 sIni := Copy(sLin, 1, Pos('-', sLin)-1);
                 Delete(sLin, 1, Pos('-', sLin));
                 sFim := sLin;
               end;
          else
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados em branco
          if (Trim(sIni) = '') or (Trim(sFim) = '') then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados não numéricos com mais de um caracter: A e A;A;A;A;... e A-A
          if (( (Length(sIni) > 1) and not(sIni[1] in ['0'..'9']) ) or
              ( (Length(sFim) > 1) and not(sFim[1] in ['0'..'9']) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados numéricos: NNN e NNN;NNN;NNN;... e NNN-NNN
          if (( (sIni[1] in ['0'..'9']) and (StrToIntDef(sIni, -1) = -1) ) or
              ( (sFim[1] in ['0'..'9']) and (StrToIntDef(sFim, -1) = -1) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

        end;
      end;

      sMatErro := '';
      // Selecionando....
      for x := 0 to slLista.Count-1 do
      begin
        sLin := AnsiUpperCase(slLista[x]);

        if StrCount('-', sLin) > 0 then
        begin
          sIni := Copy(sLin, 1, Pos('-', sLin)-1);
          Delete(sLin, 1, Pos('-', sLin));
          sFim := sLin;
        end
        else
        begin
          sIni := sLin;
          sFim := sLin;
        end;

        if (sIni[1] in ['0'..'9']) then
        begin
          bIni := False;
          bFim := (StrToIntDef(sIni,0) = StrToIntDef(sFim,0));  // se for igual só vai validar se existe o sIni

          for i := 0 to chklstFunc.Items.Count-1 do
            if ( (StrToIntDef(ListaMatFunc[i],-1) >= StrToIntDef(sIni,0) ) and
                 (StrToIntDef(ListaMatFunc[i],-1) <= StrToIntDef(sFim,0) ) ) then
            begin
              if not(bIni) and (StrToIntDef(ListaMatFunc[i],-1) = StrToIntDef(sIni,0)) then bIni := True;
              if not(bFim) and (StrToIntDef(ListaMatFunc[i],-1) = StrToIntDef(sFim,0)) then bFim := True;
              chklstFunc.Checked[i] := True;
            end;

          if not(bIni) then
            sMatErro := sMatErro + ', ' + sIni;

          if not(bFim) then
            sMatErro := sMatErro + ', ' + sFim;
        end
        else
        begin

          for i := 0 to chklstFunc.Items.Count-1 do
            if ( (Copy(chklstFunc.Items[i], 1, Length(sIni)) >= sIni) and
                 (Copy(chklstFunc.Items[i], 1, Length(sFim)) <= sFim) ) then
              chklstFunc.Checked[i] := True;

        end;

      end;

      if Trim(sMatErro) <> '' then
      begin
        Delete(sMatErro, 1, 2);
        MsgDlg('Matrícula(s) '+sMatErro+' não existe(m)', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      end;

    finally
      FreeAndNil(slLista);
      chklstFunc.Repaint;
    end;
  end;
end;

end.
