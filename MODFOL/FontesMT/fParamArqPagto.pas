// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina.............: bbtnGerarDadosClick
//N. SIG.............: 133912
//Responsável........: Cássio Florêncio Rovaroto
//Descrição..........: Inclusão do uso de convênio bancário de Float antecipado.
//***************************************************************************************
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//***************************************************************************************
//Rotina.............: bbtnGerarDadosClick
//N. SIG.............: 101266
//Data da Alteração..: 30/07/2020
//Responsável........: Cássio Florêncio Rovaroto
//Descrição..........: Inclusão do código NSA na interface de geração do arquivo.
//***************************************************************************************
//Rotina             : rbtnGerarClick, bbtnGerarDadosClick, HabilitaBtOk, gbxTipContraExit
//N. SIG..........   : 61776 
//Data da Alteração: : 27/07/2020
//Alteração Form:    : fParamArqPagto
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Ocultando os componentes que permitem a seleção do arquivo
//                     eletrônico criado. 
//***************************************************************************************
// Autor(a)    : Ricardo de Freitas Araújo
// Data        : 11/10/2010
// Pendência   : SOL 166478 KINTANA 1448711
// Descricao   : Adicionado controle de transação
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    :  Henrique Massão
// Data        :  20/10/2009
// Pendência   : SOL 124276 KINTANA 629634
// Descricao   :  Alteração nos captions dos tipos de contratos
//------------------------------------------------------------------------------
unit fParamArqPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  IvDictio, IvMulti, IvEMulti, ComCtrls, fcLabel, FileCtrl, wwdbdatetimepicker, DBClient,
  CMDateTimePicker, fSairAjuda, uCMClientDataSet, uCtrlGlobalRH, uCtrlMotivo,
  uCtrlParamArqPagto, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario,
  ColorCheckListBox,dBaseDados;

type
  TfrmParamArqPagto = class(TfrmSairAjuda)
    pnlDiretorio: TPanel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    bbtnOkDir: TBitBtn;
    bbtnCancelarDir: TBitBtn;
    rbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Bevel3: TBevel;
    CdsEstab: TCMClientDataSet;
    Label1: TLabel;
    gbxTipPag: TGroupBox;
    chklstTipoFolha: TColorCheckListBox;
    bbtnSelTodosTipoFolha: TBitBtn;
    bbtnInvSelTipoFolha: TBitBtn;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxDataCredito: TGroupBox;
    dtedDtCredito: TCMDateTimePicker;
    rgProcesso: TRadioGroup;
    gbxEstab: TGroupBox;
    dblckEstab: TwwDBLookupCombo;
    gbxFunc: TGroupBox;
    Paginas: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    Bevel1: TBevel;
    lblDiretorio: TLabel;
    spbtnProcurarArquivo: TSpeedButton;
    ToolbarSep971: TToolbarSep97;
    bbtnGerarDados: TBitBtn;
    chkConvenioFloat: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblckEstabChange(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnOkDirClick(Sender: TObject);
    procedure bbtnCancelarDirClick(Sender: TObject);
    procedure DirectoryListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure pnlDiretorioExit(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure dblkcbMotivoChange(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure bbtnSelTodosTipoFolhaClick(Sender: TObject);
    procedure bbtnInvSelTipoFolhaClick(Sender: TObject);
    procedure spbtnProcurarArquivoClick(Sender: TObject);
    procedure bbtnGerarDadosClick(Sender: TObject);
  private
    CtrlParamArqPagto: TCtrlParamArqPagto;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    ListaIdFunc, ListaTipoFolha: TStringList;

    sIdEstab: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    // Atualiza Tela de Progresso
    procedure Progresso(Args: array of variant);
    procedure LimpaSelecao; 
  end;

var
  frmParamArqPagto: TfrmParamArqPagto;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamArqPagto.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  CtrlParamArqPagto := TCtrlParamArqPagto.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamArqPagto.InitializeAs(Padroes);
  CtrlParamArqPagto.Progresso := Progresso;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  ListaIdFunc := TStringList.Create;
  ListaTipoFolha := TStringList.Create;

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  // Monta ChekListBox de Tipo de Folha
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F');
  while not(dmCds.Cds.EOF) do
  begin
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    ListaTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    dmCds.Cds.Next;
  end;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));

  lblDiretorio.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  Paginas.ActivePageIndex := 1;
end;

procedure TfrmParamArqPagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamArqPagto);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaTipoFolha);
  inherited;
end;

procedure TfrmParamArqPagto.dblckEstabChange(Sender: TObject);
begin
  dblckEstab.Text := Trim(dblckEstab.Text);

  if (dblckEstab.LookupValue <> sIdEstab) then
  begin
    MontaListaFuncionarios;
    sIdEstab := dblckEstab.LookupValue;
  end;

  if (Paginas.ActivePage = tbshListaFunc) then
    chklstFunc.Repaint;
end;

procedure TfrmParamArqPagto.dblkcbMotivoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.DirectoryListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
    pnlDiretorio.Visible := false;
end;

procedure TfrmParamArqPagto.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamArqPagto.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
  //Cássio Rovaroto - SIG nº 61776 - Início
  begin
    MontaListaFuncionarios;
    rbtnGerar.Visible := False;
  end;
  //Cássio Rovaroto - SIG nº 61776 - Fim
end;

procedure TfrmParamArqPagto.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamArqPagto.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamArqPagto.pnlDiretorioExit(Sender: TObject);
begin
  pnlDiretorio.Visible := false;
end;

procedure TfrmParamArqPagto.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.bbtnSelTodosTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := true;
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.bbtnInvSelTipoFolhaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    chklstTipoFolha.Checked[c] := not(chklstTipoFolha.Checked[c]);
  chklstTipoFolha.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmParamArqPagto.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmParamArqPagto.bbtnOkDirClick(Sender: TObject);
begin
  lblDiretorio.Caption := DirectoryListBox1.Directory;
  pnlDiretorio.Visible := false;
end;

procedure TfrmParamArqPagto.bbtnCancelarDirClick(Sender: TObject);
begin
  pnlDiretorio.Visible := false;
end;

procedure TfrmParamArqPagto.spbtnProcurarArquivoClick(Sender: TObject);
begin
  pnlDiretorio.Left := 125;
  pnlDiretorio.Top := 72;
  pnlDiretorio.BringToFront;
  pnlDiretorio.Visible := true;
end;

procedure TfrmParamArqPagto.rbtnGerarClick(Sender: TObject);
var
  wNum: word;
  //K: integer;
  bOk: boolean;
  sListaIdFunc, sListaIdTipoFolha: string;
begin
  //Cássio Rovaroto -  SIG 61776 - Início
  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFunc, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFunc := '';

  // Rubricas para Remuneração selecionadas
  //K := FU.CriaListaOpcoes(chklstTipoFolha, ListaTipoFolha, sListaIdTipoFolha, ',', true);

  //if (K > 1) and (MsgDlg('Confirma Mesmo Arquivo para Mais de um Tipo de Pagamento?',
  //                       'Confirmação ', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
  //  exit;
  if MsgDlg('Confirma a geração do arquivo de pagamento?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit
  else
  begin
    frmAguarde.Max := 1;
    frmAguarde.Mostra('Gerando o Arquivo...');

     if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then   //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
        Application.MessageBox(pchar('Em bases de testes, os arquivos são gravados em C:\Planus\Temp\RemessaEletronica\Remessa\ '), 'Atenção !', MB_ICONEXCLAMATION + MB_OK);

    try
      //Ricardo - SOL 166478 KINTANA 1448711
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
        dtmBaseDados.dbBaseDados.StartTransaction;
      end;

      // Processamento
      CtrlParamArqPagto.CreateThreadProgresso;
      bOk := CtrlParamArqPagto.ProcessarGeracao(Sistema.IdEmpresa,
        CdsEstab.FieldByName('IDPESSOA').asFloat, cmbMes.ItemIndex+1, speAno.Value,
        dtedDtCredito.Date, rgProcesso.ItemIndex = 0, sListaIdTipoFolha, sListaIdFunc,
        lblDiretorio.Caption, FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked,
        cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
        cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
        cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked));

      CtrlParamArqPagto.FreeThreadProgresso;
      frmAguarde.Apaga;

    finally
      if bOk then
      begin
        dtmBaseDados.dbBaseDados.Commit;
        rbtnGerar.Visible := False;
      end
      else
        dtmBaseDados.dbBaseDados.Rollback;
    end;
    //Ricardo - SOL 166478 KINTANA 1448711 - fim


    if (bOk) or (CtrlParamArqPagto.DadosIncompletos) then
      MsgDlg(CtrlParamArqPagto.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0)
    else
      raise Exception.Create(CtrlParamArqPagto.MessageInfo);

    if bOk then
      LimpaSelecao;
  end;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamArqPagto.MontaListaFuncionarios;
begin
  if (Trim(dblckEstab.Text) <> '') then
  begin
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', CdsEstab.FieldByName('IDPESSOA').asString, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked));

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamArqPagto.HabilitaBtOk;
var
  c: integer;
  bSel: boolean;
begin
  bSel := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSel := true;
      break;
    end;

  //Cássio Rovaroto - SIG nº 61776 - Início
  //rbtnGerar.Enabled := (bSel) and (Trim(speAno.Text) <> '') and
  //  (Trim(dtedDtCredito.Text) <> '') and (Trim(dblckEstab.Text) <> '');
  if (bSel) and (Trim(speAno.Text) <> '') and
    (Trim(dtedDtCredito.Text) <> '') and (Trim(dblckEstab.Text) <> '') then
  begin
      bbtnGerarDados.Enabled := True;
      rbtnGerar.Visible := False;
  end;
  //Cássio Rovaroto - SIG nº 61776 - Fim
end;

procedure TfrmParamArqPagto.Progresso(Args: array of variant);
begin
  frmAguarde.Apaga;
end;

procedure TfrmParamArqPagto.bbtnGerarDadosClick(Sender: TObject);
var
  wNum: word;
  K: integer;
  bOk: boolean;
  sListaIdFunc, sListaIdTipoFolha: string;
begin
  inherited;
  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFunc, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFunc := '';

  // Rubricas para Remuneração selecionadas
  K := FU.CriaListaOpcoes(chklstTipoFolha, ListaTipoFolha, sListaIdTipoFolha, ',', true);

  if ((MsgDlg('Serão geradas apenas as informações para o arquivo. Deseja continuar?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) and (K > 1)) then
    Exit
    else
    begin
      //Cássio Rovaroto - SIG nº 101266 - Início
      //if (MsgDlg('Confirma Mesmo Arquivo para Mais de um Tipo de Pagamento?',
      //                     'Confirmação ', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
      //  Exit;
      //Cássio Rovaroto - SIG nº 101266 - Fim

      //Cássio Rovaroto - SIG nº 133912 - Início
      if chkConvenioFloat.Checked then
        if (MsgDlg('Confirma o uso de convênio bancário de FLOAT antecipado?',
                           'Confirmação ', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
          Exit;
      //Cássio Rovaroto - SIG nº 133912 - Fim
      frmAguarde.Max := 1;
      frmAguarde.Mostra('Gerando dados para o Arquivo...');

      try
        if not dtmBaseDados.dbBaseDados.InTransaction then
        begin
          dtmBaseDados.dbBaseDados.StartTransaction;
        end;

        CtrlParamArqPagto.CreateThreadProgresso;
        bOk :=  CtrlParamArqPagto.ProcessarDados(Sistema.IdEmpresa,
                                                 CdsEstab.FieldByName('IDPESSOA').asFloat, cmbMes.ItemIndex+1, speAno.Value,
                                                 dtedDtCredito.Date, rgProcesso.ItemIndex = 0, sListaIdTipoFolha, sListaIdFunc,
                                                 lblDiretorio.Caption, FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked,
                                                 cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(cbxEfetivos.Checked,
                                                 cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
                                                 cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
                                                 chkConvenioFloat.Checked); //Cássio Rovaroto - SIG nº 133912
        CtrlParamArqPagto.FreeThreadProgresso;
        frmAguarde.Apaga;
      finally
        if bOk then
        begin
          //dtmBaseDados.dbBaseDados.Commit;
          rbtnGerar.Visible := True;
          rbtnGerar.Enabled := True;
        end;
        //else
        //  dtmBaseDados.dbBaseDados.Rollback;
      end;

      if (bOk) or (CtrlParamArqPagto.DadosIncompletos) then
        MsgDlg(CtrlParamArqPagto.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0)
      else
        raise Exception.Create(CtrlParamArqPagto.MessageInfo);
    end;
  //end
  //else
  //  MsgDlg('Necessária a definição de mais informações para geração.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
end;

procedure TfrmParamArqPagto.LimpaSelecao;
var
  i: integer;
  dDataIni: TDate;
begin
  for i := 0 to chklstTipoFolha.Items.Count -1 do
    if chklstTipoFolha.Checked[i] then
      chklstTipoFolha.Checked[i] := False;

  for i := 0 to chklstFunc.Items.Count -1 do
    if chklstFunc.Checked[i] then
      chklstFunc.Checked[i] := False;
                                          
  chklstTipoFolha.Repaint;
  chklstFunc.Repaint;
  dblckEstab.DisplayValue := '';
  dtedDtCredito.Text := '';

  dDataIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(dDataIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(dDataIni));
  Paginas.ActivePageIndex := 1;

end;

end.
