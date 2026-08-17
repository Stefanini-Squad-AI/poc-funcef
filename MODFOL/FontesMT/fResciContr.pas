{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
Nº Solicitação...: WO 23256
Data da Alteração: 27/06/2025
Responsável......: Leandro Pocebon
Descrição........: ajuste para quando seleciona resciçao complenetar utilizar IdMotivoRescisaoCompl
--------------------------------------------------------------------------------
Nº Solicitação...: WO 18460
Data da Alteração: 04/02/2025
Responsável......: Leandro Pocebon
Descrição........: chamada da função procesar a lista de funcionarios selecionados
                   na tela d opções
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
--------------------------------------------------------------------------------
N. SIG.............: 38475
Data da Alteração..: 08/01/2021
Responsável........: Everson Cunha
Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
N. SIG..........   : 97073
Data da Alteração  : 31/01/2020
Responsável:       : Everson Cunha
Descrição.......   : Aumentar o tamanho de digitação do campo Nº Atestado Óbito
                     de 30 para 32 posições.
--------------------------------------------------------------------------------
Rotina             :
N. SIG..........   : 38475.84907
Data da Alteração  : 16/04/2019
Alteração Form:    : fResciContr
Responsável:       : Everson Cunha
Descrição.......   : Adequação da funcionalidade para atendimento aos leiautes
                     s-2250 e s-2299 do eSocial. Versão 2.5.01 do manual.
--------------------------------------------------------------------------------
Rotina             : FormCreate, dbRgpPensaoVerbRescClick, CmeCadastroConfirma,
N. SIG..........   : 38475.60440
Data da Alteração  : 19/12/2017
Alteração Form:    : fResciContr
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Inclusão de campos para o tratamento de possíveis
                     designações de Pensão Alimentícia sobre Verbas Rescisórias.
--------------------------------------------------------------------------------
Nº SOL............: 1019926
Nº PPM............: 231118/17674
Data da Alteração.: 24/08/2015
Responsável.......: Felipe A. Santos
Descrição.........: gravação das rubricas Assistenciais na estrutura RETASSIST
                    quando é gerado a folha de rescisão normal e complementar.
--------------------------------------------------------------------------------
Nº SOL............: 250387/17326
Nº PPM............: 832518
Data da Alteração.: 01/07/2015
Responsável.......: Felipe A. Santos
Descrição.........: Inclusão do campo Data de Fim da Quarentena.
--------------------------------------------------------------------------------
Nº SOL............: 229881.16648
Nº PPM............: 565999
Data da Alteração.: 20/02/2015
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229881.
--------------------------------------------------------------------------------
Nº SOL............: 244940
Nº PPM............: 610711
Data da Alteração.: 15/12/2014
Responsável.......: Fernando Xavier
Descrição.........: Erro no cadastro de rescisões.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 144594
Nº KINTANA..: 954455
Data........: 08/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Incluir campos "Pensão Alimenticia sobre FGTS" e "Percentual"
--------------------------------------------------------------------------------}

unit fResciContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT, Db,
  cmseldlg, wwidlg, Wwdatsrc, TB97, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask,
  wwdblook, DBTables, TREdit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbedit, Spin,
  MontaSelect, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, wwDialog, ImgList,
  ComCtrls, fcLabel, Gauges, DBClient, uCMClientDataSet, uCtrlSitFunc, uCtrlMotivo,
  uCtrlVincEmpr, uCtrlFormFGTS, uCtrlMovContrCAGED, uCtrlAfastRAIS, uCtrlPessoaFuncionario,
  uCtrlGeraFolPagResc, uCtrlIntegraPrevRH, fProgresso_GeraCalc,
  uCtrlGeraFolPagNormal, Wwdotdot, Wwdbcomb; // Felipe A. Santos SOL 231118/17674 PPM 1019926

type
  TfrmResciContr = class(TFrmCadastroMT)
    Bevel1: TBevel;
    sbtnCalcular: TBitBtn;
    CdsSitFunc: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsVinculo: TCMClientDataSet;
    CdsFormFGTS: TCMClientDataSet;
    CdsMovContr: TCMClientDataSet;
    CdsAfastRAIS: TCMClientDataSet;
    Label12: TLabel;
    dbedNome: TwwDBEdit;
    Label8: TLabel;
    dbedCargo: TwwDBEdit;
    Label9: TLabel;
    dbedSalAtual: TDBRealEdit;
    dbrgTipoSalar: TDBRadioGroup;
    Label10: TLabel;
    dbedDtAdmiss: TwwDBEdit;
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    dbrgTipContra: TDBRadioGroup;
    gbxContrato: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    dbedFimContr: TDBEdit;
    redDiasRest: TRealEdit;
    Label23: TLabel;
    dbedDatSaida: TCMDateTimePicker;
    Label19: TLabel;
    edDataHomol: TCMDateTimePicker;
    Label3: TLabel;
    dblckSitFunc: TwwDBLookupCombo;
    Label2: TLabel;
    Label4: TLabel;
    dblckMotivo1: TwwDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    dblckMotivo2: TwwDBLookupCombo;
    Label14: TLabel;
    dblckRescFGTS: TwwDBLookupCombo;
    Label15: TLabel;
    dblckVinculo: TwwDBLookupCombo;
    Label16: TLabel;
    dblckMovContr: TwwDBLookupCombo;
    Label17: TLabel;
    dblckAfastRAIS: TwwDBLookupCombo;
    cbxEnviaMensagem: TCheckBox;
    Bevel2: TBevel;
    chkLOG: TCheckBox;
    gbxNivel: TGroupBox;
    Label18: TLabel;
    dbredNivel: TDBRealEdit;
    lblProcessoTrab: TLabel;
    dbeProcessoTrab: TDBEdit;
    CdsMotivoGer: TCMClientDataSet;

    // Felipe A. Santos SOL 250387/17326 PPM 832518 {fim dtpDtFimQuarentena}
    lblDtFimQuarentena: TLabel;
    dtpDtFimQuarentena: TCMDateTimePicker;
    grpAvisoPrevio: TGroupBox;
    lblTipoAviso: TLabel;
    dbcmbTipoAviso: TwwDBComboBox;
    lblDtCancelamento: TLabel;
    dtpDtCancelamento: TCMDateTimePicker;
    dbcmbMotivCancelamento: TwwDBComboBox;
    lblMotivCancelamento: TLabel;
    Label7: TLabel;
    dbedDatAviso: TCMDateTimePicker;
    Label20: TLabel;
    cboAvisoTrab: TComboBox;
    lblTerminoAviso: TLabel;
    tmpDtTerminoAviso: TCMDateTimePicker;
    grpPensaoAlimenticia: TGroupBox;
    dbRgpPensaoVerbResc: TDBRadioGroup;
    lblPercPensaoResc: TLabel;
    dbEdtPercPensaoResc: TDBRealEdit;
    lblValorPensaoResc: TLabel;
    dbEdtValorPensaoResc: TDBRealEdit;
    cdsAuxETL: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsBeforePost(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dblckSitFuncChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnCalcularClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbRgpPensaoVerbRescClick(Sender: TObject);
    procedure cboAvisoTrabChange(Sender: TObject);
    procedure dtpDtCancelamentoExit(Sender: TObject);
    procedure cboAvisoTrabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlGeraFolPagResc: TCtrlGeraFolPagResc;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlMotivo: TCtrlMotivo;
    CtrlFormFGTS: TCtrlFormFGTS;
    CtrlVincEmpr: TCtrlVincEmpr;
    CtrlMovContrCAGED: TCtrlMovContrCAGED;
    CtrlAfastRAIS: TCtrlAfastRAIS;

    TelaProgresso: TfrmProgresso_GeraCalc;

    sDataHomolAntes: string;

    wAno, wMes, wDia, wDia_Aux : Word; //Everson Cunha - WO 11765
    bETL: Boolean; //Everson Cunha - WO 11765

    procedure Sel(IdPessoa: double);
    procedure EnviarMensagemDemissao;
    procedure Progresso(Args: array of variant);
    function  VerificaOpcoesConfirmar: boolean;
    function  VerificaOpcoesCalcular: boolean;
    procedure selfFuncoes;   //Everson Cunha - SIG38475-84907
    function Exec_ETL(sListaFuncSel: string; dDataPagamento: TDate): Boolean; //Everson Cunha - WO 11765
  end;

var
  frmResciContr: TfrmResciContr;

implementation

uses uCMTypes, uMensErro, uSistema, uModulo, uCtrlFuncoesRH, dCds, fAguarde, fOpcRescisao,
  uCtrlPadroes, uCtrlParamIntegra, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmResciContr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral, false, false,
  Sistema.IdEmpresa, Sistema.UsaRAD, Sistema.IdUsuario);
  CtrlPessoaFuncionario.InitializeAs(Padroes);
  CtrlPessoaFuncionario.CdsSubTipo := Cds;
  CtrlPessoaFuncionario.UsaEstrangeiro := false;
  CtrlPessoaFuncionario.UsaUltimosEmpregos := false;

  CtrlGeraFolPagResc := TCtrlGeraFolPagResc.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlGeraFolPagResc.InitializeAs(Padroes);
  CtrlGeraFolPagResc.CdsPessoa := Cds;
  CtrlGeraFolPagResc.Progresso := Progresso;

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlFormFGTS := TCtrlFormFGTS.Create;
  CtrlFormFGTS.InitializeAs(Padroes);

  CtrlVincEmpr := TCtrlVincEmpr.Create;
  CtrlVincEmpr.InitializeAs(Padroes);

  CtrlMovContrCAGED := TCtrlMovContrCAGED.Create;
  CtrlMovContrCAGED.InitializeAs(Padroes);

  CtrlAfastRAIS := TCtrlAfastRAIS.Create;
  CtrlAfastRAIS.InitializeAs(Padroes);

  frmOpcRescisao := TfrmOpcRescisao.Create(Self);
  TelaProgresso := TfrmProgresso_GeraCalc.Create(Self);
  TelaProgresso.Titulo := 'Gerando Rescisão';

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  CdsSitFunc.Data := CtrlSitFunc.ListGeral(0, '', 'R,G');
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D');
  CdsFormFGTS.Data := CtrlFormFGTS.ListGeral;
  CdsVinculo.Data := CtrlVincEmpr.ListGeral;
  CdsMovContr.Data := CtrlMovContrCAGED.ListGeral;
  CdsAfastRAIS.Data := CtrlAfastRAIS.ListGeral;

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

  gbxNivel.Visible := (Modulo.IdContraCheque = FUNCEF);

  CdsMotivoGer.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D'); //William Santana - SOL 229881.16648 PPM 565999

  HelpContext := 210072; // Felipe A. Santos SOL 250387/17326 PPM 832518 - incluído em todas as mensagens que possuem help

  //Everson Cunha - SIG38475-84907 - Início

  //Cássio Rovaroto - SIG nº 38475.60440 - Início
  //lblTpPensaoResc.Visible := False;
  //dbEdtVlrpensaoResc.Visible := False;
  //Cássio Rovaroto - SIG nº 38475.60440 - Fim

  selfFuncoes;
  //Everson Cunha - SIG38475-84907 - Fim
end;

procedure TfrmResciContr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlFormFGTS);
  FreeAndNil(CtrlVincEmpr);
  FreeAndNil(CtrlMovContrCAGED);
  FreeAndNil(CtrlAfastRAIS);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlGeraFolPagResc);
  FreeAndNil(CtrlIntegraPrevRH);

  FreeAndNil(TelaProgresso);  
  FreeAndNil(frmOpcRescisao);

  inherited;
end;

procedure TfrmResciContr.CmeCadastroConfirma(Sender: TObject);
begin
  //Everson Cunha - SIG38475-84907 - Início
  //Cássio Rovaroto - SIG n 38475.60440 - Início
	//if dbRgpPensaoVerbResc.ItemIndex  = -1 then
  //  dbRgpPensaoVerbResc.ItemIndex := 2;

  if dbRgpPensaoVerbResc.ItemIndex = 0 then
  begin
   	if dbEdtPercPensaoResc.Value <= 0 then
    begin
      MsgDlg('Defina um percentual para a Pensão Alimetícia sobre Verbas Rescisórias', 'Aviso', mtWarning, [mbOk], 0);
      dbEdtPercPensaoResc.SetFocus;
      Abort;
    end;
  end;
  //Everson Cunha - SIG38475-84907 - Fim

  //if dbRgpPensaoVerbResc.ItemIndex <> 2 then //Everson Cunha - SIG38475-84907
  if dbRgpPensaoVerbResc.ItemIndex = 1 then   //Everson Cunha - SIG38475-84907
  begin
  	//if dbEdtVlrpensaoResc.Value <= 0 then //Everson Cunha - SIG38475-84907
   	if dbEdtValorPensaoResc.Value <= 0 then   //Everson Cunha - SIG38475-84907
    begin
      MsgDlg('Defina um valor para a Pensão Alimetícia sobre Verbas Rescisórias', 'Aviso', mtWarning, [mbOk], 0);
      dbEdtValorPensaoResc.SetFocus;
      Abort;
    end;
  end;
  //Cássio Rovaroto - SIG n 38475.60440 - Fim

  //Everson Cunha - SIG38475-84907 - Início
  if dbRgpPensaoVerbResc.ItemIndex = 2 then
  begin
   	if (dbEdtPercPensaoResc.Value <= 0) or (dbEdtValorPensaoResc.Value <= 0) then
    begin
      MsgDlg('Defina um percentual e valor para a Pensão Alimetícia sobre Verbas Rescisórias', 'Aviso', mtWarning, [mbOk], 0);
      Abort;
    end;
  end;
  //Everson Cunha - SIG38475-84907 - Fim

  inherited;

  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (Sistema.TipoEmpresa = 'P') then
  begin
    frmAguarde.Mostra('Atualizando Dados Previdenciários...');
    frmAguarde.Pos := 0;

    if not(CtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
           Sistema.IdEmpresa, Cds.FieldByName('IDPESSOA').asFloat)) then
      MsgDlg(CtrlIntegraPrevRH.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], HelpContext);

    frmAguarde.Apaga;
  end;
end;

procedure TfrmResciContr.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //nherited;
end;

procedure TfrmResciContr.CmeCadastroApplyEdit(Sender: TObject; var Accept: Boolean);
var
  sMsg: string;
begin
  inherited;
  Accept := (CtrlPessoaFuncionario.GravarSubTipos(opAlterar, sMsg));
  if (sMsg <> '') then
  begin
    if (Accept) then
      MsgDlg(sMsg, 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext)
    else
      MsgDlg(sMsg, 'Erro', mtError, [mbOk,mbHelp], HelpContext);
  end;
end;

procedure TfrmResciContr.CdsBeforePost(DataSet: TDataSet);
begin
  Cds.FieldByName('DATARETORNO').Clear;
  Cds.FieldByName('HOMOLOGACAONUMERO').asString := edDataHomol.Text;
  inherited;
end;

procedure TfrmResciContr.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDatSaida.CanFocus) then
    dbedDatSaida.SetFocus;
end;

procedure TfrmResciContr.dblckSitFuncChange(Sender: TObject);
begin
  if (Cds.State in [dsEdit, dsInsert]) then
    CtrlPessoaFuncionario.MudouSituacao := true;
end;

procedure TfrmResciContr.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
    selfFuncoes; //Everson Cunha - SIG38475-84907
  end;

end;

procedure TfrmResciContr.bbtnConfirmarClick(Sender: TObject);
begin
  if not(VerificaOpcoesConfirmar) then
    //exit; //Everson Cunha - SIG35478-84907
    abort;  //Everson Cunha - SIG35478-84907

  Cds.FieldByName('SALARIOTIPO').AsString := IntToStr(cboAvisoTrab.ItemIndex + 1); //William Santana - SOL 229881.16648 PPM 565999

  //Everson Cunha - SIG38475-84907 - Início (Retirado do CMECONFIRMA)
  if dbRgpPensaoVerbResc.ItemIndex  = -1 then
   Cds.FieldByName('FLGPENSAORESC').AsString := 'N';
  //Everson Cunha - SIG38475-84907 - Fim

  // Obtém os Dados necessários à alteração da Situação Funcional
  if (CtrlPessoaFuncionario.MudouSituacao) then
  begin
    CtrlPessoaFuncionario.IdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);   //SOL 244940 PPM 610711
    CtrlPessoaFuncionario.SelDadosSitFunc(CdsSitFunc.FieldByName('TIPOSIT').asString);
  end;
  inherited;

  // Gravo o histórico de Alteração da Situação Funcional
  if (CtrlPessoaFuncionario.MudouSituacao) then
  begin
    CtrlPessoaFuncionario.GravarHistorico(false, false, Sistema.IdEmpresa);

    if (CtrlPessoaFuncionario.MessageInfo <> '') then
      raise Exception.Create(CtrlPessoaFuncionario.MessageInfo);

    CtrlPessoaFuncionario.MudouSituacao := false;
  end;

  // Envia Mensagem ao Demitido
  EnviarMensagemDemissao;

  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmResciContr.sbtnCalcularClick(Sender: TObject);
var
  bOk: boolean;
  _ArqLOG: TStringList;
  DataPagamento: TDate;
  sListaEmpregadoSel: string;
begin
  if (edDataHomol.Text <> '') then
    frmOpcRescisao.dtDataPag.Date := edDataHomol.Date
  else
    frmOpcRescisao.dtDataPag.Date := dbedDatSaida.Date;

  if (frmOpcRescisao.ShowModal = mrCancel) then
    exit;

  bETL := frmOpcRescisao.chkETL.Checked;

  if not(VerificaOpcoesCalcular) then
    exit;

  DataPagamento := frmOpcRescisao.dtDataPag.Date;

  //Everson Cunha ETL - Inicio
  if trim(frmOpcRescisao.ListaEmpregadoSel) = '' then
    sListaEmpregadoSel := Cds.FieldByName('IDPESSOA').AsString
  else
    sListaEmpregadoSel := frmOpcRescisao.ListaEmpregadoSel + Cds.FieldByName('IDPESSOA').AsString; //Na montagem da lista já tem a última virgula
  //Everson Cunha ETL - Fim

  Self.Enabled := false;
  TelaProgresso.HoraIni := Time;
  TelaProgresso.QtdeFunc := 0;
  //TelaProgresso.TempoDecorr := '00:00:00'; //Everson Cunha - WO 11765
  TelaProgresso.TempoDecorr := '';           //Everson Cunha - WO 11765
  TelaProgresso.Progresso := 0;
  TelaProgresso.Processo := 'Preparando Dados Iniciais do Processo. Aguarde...';
  TelaProgresso.Pessoa := '';
  Application.ProcessMessages;
  TelaProgresso.Mostrar;
  TelaProgresso.BringToFront;
  Application.ProcessMessages;

  //Everson Cunha - WO 11765 - Inicio
  if (bETL) then
  begin
    bOk := Exec_ETL(sListaEmpregadoSel, DataPagamento);

    if bOk then
      MsgDlg('Processo de geração da Folha efetuado com sucesso', 'Aviso', mtInformation, [mbOK], 0);
  end
  else
  begin
  //Everson Cunha - WO 11765 - Fim

    // Processo de Geração da Rescisão
    CtrlGeraFolPagResc.CreateThreadProgresso;
    bOk := CtrlGeraFolPagResc.Processar(Modulo.IdContraCheque, Sistema.IdEmpresa,
      Sistema.TipoEmpresa, frmOpcRescisao.SelTodosNoPeriodo, frmOpcRescisao.DataInicial,
      frmOpcRescisao.DataFinal, frmOpcRescisao.ListaTipoContratoSel, Sistema.IdUsuario,
      frmOpcRescisao.NormalIni, frmOpcRescisao.NormalFim, frmOpcRescisao.Processo,
      frmOpcRescisao.OpcaoPrevia, frmOpcRescisao.TipoSelMotivo, frmOpcRescisao.IdMotivo,
      frmOpcRescisao.FazRescisaoCompl, frmOpcRescisao.IdMotivoRescisaoCompl,
      FU.IFF(frmOpcRescisao.SelRubricas, frmOpcRescisao.ListaIdRubricaSel, ''),
      frmOpcRescisao.FazPagEletronico, frmOpcRescisao.FazCAP, Date,
      DataPagamento, frmOpcRescisao.CriarDocIndividual, frmOpcRescisao.ConsTipoDesemb,
      frmOpcRescisao.RateioCC,
      ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
      FU.IFF(frmOpcRescisao.CodTipoDoc>0, frmOpcRescisao.CodTipoDoc, -1),
      frmOpcRescisao.CodPortForma, frmOpcRescisao.Plano, frmOpcRescisao.Conta,
      frmOpcRescisao.ListaTipoDesembSel, frmOpcRescisao.DiretorioArqPag, Sistema.UsaPlanoPatro,
      ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal,
      frmOpcRescisao.rgProcLancPrev.ItemIndex=0, frmOpcRescisao.cbxTmpDesc.Checked, chkLOG.Checked,
      //Cds.FieldByName('IDPESSOA').AsInteger); // Felipe A. Santos SOL 231118/17674 PPM 1019926 //wo18460 leandro
      Cds.FieldByName('IDPESSOA').AsInteger, sListaEmpregadoSel);  //wo18460 leandro
    CtrlGeraFolPagResc.FreeThreadProgresso;

    if (chkLOG.Checked) then
    begin
      _ArqLOG := TStringList.Create;
      _ArqLOG.Text := CtrlGeraFolPagResc.LOG;
      _ArqLOG.SaveToFile(ExtractFilePath(Application.ExeName) + 'LOG_RESC_PAG.TXT');
      _ArqLOG.Free;
    end;

    if (bOk) then
      MsgDlg(CtrlGeraFolPagResc.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], HelpContext)
    else
      MsgDlg(CtrlGeraFolPagResc.MessageInfo, 'Erro', mtWarning, [mbOk,mbHelp], HelpContext);
  end;

  Self.Enabled := true;
  TelaProgresso.Hide;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmResciContr.Sel(IdPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListFuncNaRescisao(IdPessoa);
  CtrlPessoaFuncionario.MudouSituacao := false;

  sbtnAlterar.Enabled := not(Cds.IsEmpty);
  sbtnCalcular.Enabled := (CdsSitFunc.FieldByName('TIPOSIT').asString = 'D');
  gbxContrato.Visible := not(Cds.FieldByName('DATAFIMCONTRATO').IsNull);

  redDiasRest.Value := 0;
  sDataHomolAntes := edDataHomol.Text;
  edDataHomol.Text := Cds.FieldByName('HOMOLOGACAONUMERO').asString;

  if (gbxContrato.Visible) and (Cds.FieldByName('DATAFIMCONTRATO').asDateTime > Date) then
    redDiasRest.Value := Cds.FieldByName('DATAFIMCONTRATO').asDateTime - Date;

  //Início - William Santana - SOL 229881.16648 PPM 565999
  try
   if (Cds.FieldByName('SALARIOTIPO').AsString = EmptyStr) then
     cboAvisoTrab.ItemIndex := -1
   else
    cboAvisoTrab.ItemIndex := (Cds.FieldByName('SALARIOTIPO').AsInteger -1 );

  except
   cboAvisoTrab.ItemIndex := -1;
  end;
  //Término - William Santana - SOL 229881.16648 PPM 565999
end;

procedure TfrmResciContr.EnviarMensagemDemissao;
begin
  if (cbxEnviaMensagem.Checked) and (sDataHomolAntes = '') and (edDataHomol.Text <> '') Then
  begin
    dmCds.Cds.Data := CtrlMotivo.ListGeral(Cds.FieldByName('IDMOTIVODESLIGRAIS').asInteger);

    if not(FU.EnviarMensagemCM(
      Sistema.IdUsuario, Cds.FieldByName('IDPESSOA').asInteger,
      Sistema.NomeUsuario, 'Aviso Referente ao Seu Desligamento',
      tdUsuario,
      FU.IFF(dmCds.Cds.FieldByName('OBSERVACAO').asString <> '',
          dmCds.Cds.FieldByName('OBSERVACAO').asString,
          'Favor comparecer ao Setor de Pessoal para as devidas providências.') +
      FU.IFF((Cds.FieldByName('DATADESLIGAMENTO').Value -
           Cds.FieldByName('DATAADMISSAO').Value > 365),
           ' Rescisão a ser homologada no Sindicato em ' +edDataHomol.Text+ '.', ''))) then
      MsgDlg('Não foi possível enviar a mensagem.', 'Erro', mtError, [mbOk,mbHelp], HelpContext);
  end;
end;

function TfrmResciContr.VerificaOpcoesConfirmar: boolean;
begin
  Result := false;
  if (Trim(dblckSitFunc.Text) = '') then
  begin
    MsgDlg('Informe a Nova Situação Funcional.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
    dblckSitFunc.SetFocus;
    exit;
  end;

  // Felipe A. Santos SOL 250387/17326 PPM 832518 - início
  if (dtpDtFimQuarentena.Text <> '') and (dbedFimContr.Text <> '') then
  begin
     if (dtpDtFimQuarentena.Date <= StrToDate(dbedFimContr.Text)) then
     begin
       MsgDlg('Informe uma data de fim de quarentena maior que a data final do contrato.', 'Aviso', mtInformation, [mbOk, mbHelp], HelpContext);
       if dtpDtFimQuarentena.CanFocus then dtpDtFimQuarentena.SetFocus;
       exit;
     end;
  end;
  // Felipe A. Santos SOL 250387/17326 PPM 832518 - fim

  if (CdsSitFunc.FieldByName('TIPOSIT').asString = 'D') then
  begin
    if (Trim(dbedDatSaida.Text) = '') then
    begin
      MsgDlg('Informe a Data de Desligamento.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dbedDatSaida.SetFocus;
      exit;
    end;

    if (Trim(dblckMotivo1.Text) = '') then
    begin
      MsgDlg('Informe o Motivo de Desligamento RAIS.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dblckMotivo1.SetFocus;
      exit;
    end;

    if (Trim(dblckMotivo2.Text) = '') then
    begin
      MsgDlg('Informe o Motivo de Desligamento Gerencial.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dblckMotivo2.SetFocus;
      exit;
    end;

    if (Trim(dblckRescFGTS.Text) = '') then
    begin
      MsgDlg('Informe a Forma de Rescisão para FGTS.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dblckRescFGTS.SetFocus;
      exit;
    end;

    if (Trim(dbedDatAviso.Text) <> '') and
       (StrToDate(Trim(dbedDatAviso.Text)) > dbedDatSaida.Date) then
    begin
      MsgDlg('Data do Aviso Não Pode Ser Posterior ao Desligamento.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dbedDatAviso.SetFocus;
      exit;
    end;

    //Início - William Santana - SOL 229881.16648 PPM 565999
    if (cboAvisoTrab.ItemIndex = 0) and (tmpDtTerminoAviso.Text = EmptyStr) then
    begin
      MsgDlg('Informe a Dt. Término de Aviso Prévio Indenizado', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      tmpDtTerminoAviso.SetFocus;
      exit;
    end
    else
    if (cboAvisoTrab.ItemIndex = -1) then
    begin
      MsgDlg('Informe se o Aviso Prévio foi Trabalhado', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      cboAvisoTrab.SetFocus;
      exit;
    end;
    //Término - William Santana - SOL 229881.16648 PPM 565999

    //if (Trim(dbedDatAviso.Text) = '') and (dbrgAvisoTrab.ItemIndex > -1) then //William Santana - SOL 229881.16648 PPM 565999
    if (Trim(dbedDatAviso.Text) = '') and (cboAvisoTrab.ItemIndex > -1) then    //William Santana - SOL 229881.16648 PPM 565999
    begin
      MsgDlg('Informe a Data do Aviso.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dbedDatAviso.SetFocus;
      exit;
    end;

    //if (dbrgAvisoTrab.ItemIndex = 1) and (StrToDate(Trim(dbedDatAviso.Text)) <> dbedDatSaida.Date) then //William Santana - SOL 229881.16648 PPM 565999
    if (cboAvisoTrab.ItemIndex = 2) and
    (StrToDate(Trim(dbedDatAviso.Text)) <> dbedDatSaida.Date) then  //William Santana - SOL 229881.16648 PPM 565999
    begin
      MsgDlg('Aviso Não Trabalhado: Data do Aviso Deve Ser Igual ao Desligamento.', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dbedDatAviso.SetFocus;
      exit;
    end;

    if (Trim(dbedDatAviso.Text) <> '') and
       (StrToDate(Trim(dbedDatAviso.Text)) < dbedDatSaida.Date - 30) and
       (MsgDlg('Data do Aviso com mais de 30 dias antes do Desligamento.'+CR_LF+
               'Confirma?', 'Confirmação', mtConfirmation, [mbYes,mbNo], HelpContext) <> mrYes) then
    begin
      dbedDatAviso.SetFocus;
      exit;
    end;

    //Everson Cunha - SIG38475-84907 - Início
    if (Trim(dtpDtCancelamento.Text) <> '') and (dbcmbMotivCancelamento.ItemIndex = -1) then
    begin
      MsgDlg('Informe o Motivo do Cancelamento do Aviso Prévio', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dbcmbMotivCancelamento.SetFocus;
      dbcmbMotivCancelamento.DropDown;
      Exit;
    end;

    if (cboAvisoTrab.ItemIndex = 1) and (dbcmbTipoAviso.ItemIndex = -1) then
    begin
      MsgDlg('Informe o Tipo Aviso - eSocial', 'Aviso', mtInformation, [mbOk,mbHelp], HelpContext);
      dbcmbTipoAviso.SetFocus;
      dbcmbTipoAviso.DropDown;
      Exit;
    end;
    //Everson Cunha - SIG38475-84907 - Fim

    sbtnCalcular.Enabled := true;
  end;
  Result := true;
end;

function TfrmResciContr.VerificaOpcoesCalcular: boolean;
begin
  Result := false;

  //if (frmOpcRescisao.Processo = 0) then             //Everson Cunha - WO 11765
  if (frmOpcRescisao.Processo = 0) and not(bETL) then //Everson Cunha - WO 11765
  begin
    if ((frmOpcRescisao.OpcaoPrevia = 0) and
        (MsgDlg('Qualquer Prévia Anterior Será Destruída.'+CR_LF+
                'Confirma a Execução?', 'Confirmação', mtConfirmation,
                [mbYes,mbNo,mbHelp], HelpContext) = mrNo)) or
       ((frmOpcRescisao.OpcaoPrevia = 1) and
        (MsgDlg('Prévia Desse(s) Tipo(s) de Folha Será Destruída.'+CR_LF+
                'Confirma a Execução?', 'Confirmação', mtConfirmation,
                [mbYes,mbNo,mbHelp], HelpContext) = mrNo)) or
       ((frmOpcRescisao.OpcaoPrevia = 2) and
        (MsgDlg('Prévia da(s) Pessoa(s) Selecionada(s) Será Destruída.'+CR_LF+
                'Confirma a Execução?', 'Confirmação', mtConfirmation,
                [mbYes,mbNo,mbHelp], HelpContext) = mrNo)) or
       ((frmOpcRescisao.OpcaoPrevia = 3) and
        (MsgDlg('Prévia Desse(s) Tipo(s) de Folha e da(s) Pessoa(s) Selecionada(s) Será Destruída.'+CR_LF+
                'Confirma a Execução?', 'Confirmação', mtConfirmation,
                [mbYes,mbNo,mbHelp], HelpContext) = mrNo)) or
       ((frmOpcRescisao.OpcaoPrevia = 4) and
        (MsgDlg('Nenhuma Prévia Será Destruída.'+CR_LF+
                'Confirma a Execução?', 'Confirmação', mtConfirmation,
                [mbYes,mbNo,mbHelp], HelpContext) = mrNo)) then
      exit;
  end;

  Result := true;
end;

procedure TfrmResciContr.Progresso(Args: array of variant);
var
  iNumArgs: integer;
begin
  iNumArgs := High(Args);
  if (iNumArgs >= 0) then
    if (Args[0] <> '') then
      TelaProgresso.Processo := Args[0];

  if (iNumArgs >= 1) then
    if (Args[1] <> '') then
      TelaProgresso.TempoDecorr := Args[1];

  if (iNumArgs >= 2) then
    if (Args[2] > 0) then
      TelaProgresso.QtdeFunc := Args[2];

  if (iNumArgs >= 3) then
    if (Args[3] <> '') then
      TelaProgresso.Pessoa := Args[3];

  if (iNumArgs >= 4) then
    if (Args[4] > 0) then
      TelaProgresso.MaxProgresso := Args[4];

  if (iNumArgs >= 5) then
    if (Args[5] > 0) then
      TelaProgresso.Progresso := Args[5];

  Self.Update;
  TelaProgresso.Mostrar;
end;

//Início - William Santana - SOL 229881.16648 PPM 565999
procedure TfrmResciContr.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  try
   if (Cds.FieldByName('SALARIOTIPO').AsString = EmptyStr) then
     cboAvisoTrab.ItemIndex := -1
   else
    cboAvisoTrab.ItemIndex := (Cds.FieldByName('SALARIOTIPO').AsInteger -1 );

  except
   cboAvisoTrab.ItemIndex := -1;
  end;
end;
//Término - William Santana - SOL 229881.16648 PPM 565999

procedure TfrmResciContr.dbRgpPensaoVerbRescClick(Sender: TObject);
begin
  inherited;
  //Everson Cunha - SIG38475-84907 - Início (Criação do campo AMBOS e mudança no comportamento dos campos, ao invés de visible:=false, será enable:=false)
 {	//Cássio Rovaroto - SIG nº 38475.60440 - Início
  case dbRgpPensaoVerbResc.ItemIndex of
  	0: begin
        lblTpPensaoResc.Caption :=  'Percentual';
        dbEdtVlrpensaoResc.Value := 0;
        dbEdtVlrpensaoResc.Visible := True;
        lblTpPensaoResc.Visible := True;
        dbEdtVlrpensaoResc.SetFocus;
    	 end;
  	1: begin
    		lblTpPensaoResc.Caption :=  'Valor';
        dbEdtVlrpensaoResc.Value := 0;
        dbEdtVlrpensaoResc.Visible := True;
        lblTpPensaoResc.Visible := True;
        dbEdtVlrpensaoResc.SetFocus;
       end;
  	2: begin
        dbEdtVlrpensaoResc.Value := 0;
        dbEdtVlrpensaoResc.Visible := False;
        lblTpPensaoResc.Visible := False;
    	 end;
  end;
  //Cássio Rovaroto - SIG nº 38475.60440 - Fim          }

  case dbRgpPensaoVerbResc.ItemIndex of
  	0: begin
        dbEdtPercPensaoResc.Enabled := True;
        dbEdtPercPensaoResc.Value := 0;
        dbEdtPercPensaoResc.Color := clWhite;
        if dbEdtPercPensaoResc.CanFocus then
          dbEdtPercPensaoResc.SetFocus;

        dbEdtValorPensaoResc.Enabled := False;
        dbEdtValorPensaoResc.Value := 0;
        dbEdtValorPensaoResc.Color := clSilver;
    	 end;
  	1: begin
        dbEdtPercPensaoResc.Enabled := False;
        dbEdtPercPensaoResc.Value := 0;
        dbEdtPercPensaoResc.Color := clSilver;

        dbEdtValorPensaoResc.Enabled := True;
        dbEdtValorPensaoResc.Value := 0;
        dbEdtValorPensaoResc.Color := clWhite;
        if dbEdtValorPensaoResc.CanFocus then
          dbEdtValorPensaoResc.SetFocus;
       end;
    2: begin
        dbEdtPercPensaoResc.Enabled := True;
        dbEdtPercPensaoResc.Value := 0;
        dbEdtPercPensaoResc.Color := clWhite;
        if dbEdtPercPensaoResc.CanFocus then
          dbEdtPercPensaoResc.SetFocus;

        dbEdtValorPensaoResc.Enabled := True;
        dbEdtValorPensaoResc.Value := 0;
        dbEdtValorPensaoResc.Color := clWhite;
       end;
  else
    begin
      dbEdtPercPensaoResc.Enabled := False;
      dbEdtPercPensaoResc.Value := 0;
      dbEdtPercPensaoResc.Color := clSilver;

      dbEdtValorPensaoResc.Enabled := False;
      dbEdtValorPensaoResc.Value := 0;
      dbEdtValorPensaoResc.Color := clSilver;
    end;
  end;
  //Everson Cunha - SIG38475-84907 - Fim
end;

procedure TfrmResciContr.cboAvisoTrabChange(Sender: TObject);
begin
  //Everson Cunha - SIG38475-84907 - Início
  if cboAvisoTrab.ItemIndex = 0 then
  begin
    tmpDtTerminoAviso.Enabled := True;
    tmpDtTerminoAviso.Color := clWhite;

    dbcmbTipoAviso.Enabled := False;
    dbcmbTipoAviso.Color := clSilver;
    dbcmbTipoAviso.Value := '';
    dbcmbTipoAviso.ItemIndex := -1;
    if cds.State = dsEdit then
      Cds.FieldByName('TIPOAVISOPREV').AsString := '';

    dtpDtCancelamento.Enabled := False;
    dtpDtCancelamento.Color := clSilver;
    dtpDtCancelamento.Text := '';
    if cds.State = dsEdit then
      Cds.FieldByName('DATACANCEL_AVISOPREV').AsString := '';

    dbcmbMotivCancelamento.Enabled := False;
    dbcmbMotivCancelamento.Color := clSilver;
    dbcmbMotivCancelamento.Value := '';
    dbcmbMotivCancelamento.ItemIndex := -1;
    if cds.State = dsEdit then
      Cds.FieldByName('MOTIVOCANCEL_AVISOPREV').AsString := '';
  end
  else
  if cboAvisoTrab.ItemIndex = 1 then
  begin
    tmpDtTerminoAviso.Enabled := False;
    tmpDtTerminoAviso.Color := clSilver;
    tmpDtTerminoAviso.Text := '';
    if cds.State = dsEdit then
      Cds.FieldByName('DATATERMINOAVISO').AsString := '';

    dbcmbTipoAviso.Enabled := True;
    dbcmbTipoAviso.Color := clWhite;

    dtpDtCancelamento.Enabled := True;
    dtpDtCancelamento.Color := clWhite;
  end
  else
  begin
    tmpDtTerminoAviso.Enabled := False;
    tmpDtTerminoAviso.Color := clSilver;
    tmpDtTerminoAviso.Text := '';
    if cds.State = dsEdit then
      Cds.FieldByName('DATATERMINOAVISO').AsString := '';

    dbcmbTipoAviso.Enabled := False;
    dbcmbTipoAviso.Color := clSilver;
    dbcmbTipoAviso.Value := '';
    dbcmbTipoAviso.ItemIndex := -1;
    if cds.State = dsEdit then
      Cds.FieldByName('TIPOAVISOPREV').AsString := '';

    dtpDtCancelamento.Enabled := False;
    dtpDtCancelamento.Color := clSilver;
    dtpDtCancelamento.Text := '';
    if cds.State = dsEdit then
      Cds.FieldByName('DATACANCEL_AVISOPREV').AsString := '';

    dbcmbMotivCancelamento.Enabled := False;
    dbcmbMotivCancelamento.Color := clSilver;
    dbcmbMotivCancelamento.Value := '';
    dbcmbMotivCancelamento.ItemIndex := -1;
    if cds.State = dsEdit then
      Cds.FieldByName('MOTIVOCANCEL_AVISOPREV').AsString := '';
  end;
  //Everson Cunha - SIG38475-84907 - Fim
end;

procedure TfrmResciContr.dtpDtCancelamentoExit(Sender: TObject);
begin
  //Everson Cunha - SIG38475-84907 - Início
  if dtpDtCancelamento.Text <> '' then
  begin
    dbcmbMotivCancelamento.Enabled := True;
    dbcmbMotivCancelamento.Color := clWhite;
  end
  else
  begin
    dbcmbMotivCancelamento.Enabled := False;
    dbcmbMotivCancelamento.Color := clSilver;
    dbcmbMotivCancelamento.Value := '';
    dbcmbMotivCancelamento.ItemIndex := -1;
    if cds.State = dsEdit then
      Cds.FieldByName('MOTIVOCANCEL_AVISOPREV').AsString := '';
  end;
  //Everson Cunha - SIG38475-84907 - Fim
end;

procedure TfrmResciContr.selfFuncoes;
begin
  //Everson Cunha - SIG38475-84907 - Início
  cboAvisoTrabChange(self);
  dtpDtCancelamentoExit(Self);
  dbRgpPensaoVerbRescClick(Self);
  //Everson Cunha - SIG38475-84907 - Fim
end;

procedure TfrmResciContr.cboAvisoTrabKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //Everson Cunha - SIG38475-84907 - Início
//  inherited;
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
    cboAvisoTrab.ItemIndex := -1;
    cboAvisoTrab.Text := '';
  end;
  //Everson Cunha - SIG38475-84907 - Fim
end;

//Everson Cunha - WO 11765 - Inicio
function TfrmResciContr.Exec_ETL(sListaFuncSel: string; dDataPagamento: TDate): Boolean;
var
  sSql, dataParaArquivos, subPath, DBConnectionCM,
  anoMesRef, normal_Inicio, normal_Fim, dataPagamento,
  path_EventWait, path_Completo_Ew,
  path_ArquivosParam, path_Completo_Param_Preparo, path_Completo_Param_Previa,
  path_Completo_Param_Final, sUsuarioProcessoAtivo,
  sDataInicioProcessoAtivo, sQtdEmpregadosProcessoAtivo, sNomeWF : String;
  iQtdProcessos, iTempoRepete, iTempoAborta, iContador, iContadorAborta,
  idProcesso, iQtdEmpregados, iFlgAdiantaPgtoFerias : Integer;
  dtNormalFim : TDate;

  function verificaStatusETL : Boolean;
  begin
    //Não atualizar progresso pois essa função é chamada várias vezes durante o processamento
    Progresso(['Verificando status do processamento - ETL']);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    //WO23256 Leandro - inicio
    if not frmOpcRescisao.FazRescisaoCompl then
      sSql := 'select e.*, trim(us.nomeusuario) nomeusuario ' +
            '  from cm.etl_folha_funcef e ' +
            '  join cm.usuariosistema us on us.idusuario = regexp_replace(e.idusuario, ''\D'') ' +
            ' where e.idmotivo = ' + IntToStr(frmOpcRescisao.IdMotivo) +
            '   and e.processo = ' + IntToStr(frmOpcRescisao.Processo) +
            '   and e.data_inicio is not null and e.data_fim is null '
    else
      sSql := 'select e.*, trim(us.nomeusuario) nomeusuario ' +
            '  from cm.etl_folha_funcef e ' +
            '  join cm.usuariosistema us on us.idusuario = regexp_replace(e.idusuario, ''\D'') ' +
            ' where e.idmotivo = ' + IntToStr(frmOpcRescisao.IdMotivoRescisaoCompl) +
            '   and e.processo = ' + IntToStr(frmOpcRescisao.Processo) +
            '   and e.data_inicio is not null and e.data_fim is null ';
    //WO23256 Leandro - fim

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    sUsuarioProcessoAtivo := cdsAuxETL.fieldbyname('nomeusuario').AsString;
    sDataInicioProcessoAtivo := cdsAuxETL.fieldbyname('data_inicio').AsString;
    sQtdEmpregadosProcessoAtivo := cdsAuxETL.fieldbyname('qtd_empregados').AsString;

    Result := cdsAuxETL.IsEmpty;
  end;

  function buscaParamETL : Boolean;
  begin
    Progresso(['Selecionando os parâmetros - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    sSql := 'select * from cm.parametlplanus where idmodulo = 21 and idparametl = 6'; //GERA FOLHA PAGTO - PARAMETROS

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    if cdsAuxETL.IsEmpty then
    begin
      Result := False;
      Exit;
    end
    else
    begin
      if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
        path_ArquivosParam := cdsAuxETL.FieldByName('DIRETORIO_PROD').AsString
      else
        path_ArquivosParam := cdsAuxETL.FieldByName('DIRETORIO_DEV').AsString;

      if (path_ArquivosParam = '') then
      begin
        Result := False;
        Exit;
      end
      else
        Result := True;
    end;

    case frmOpcRescisao.Processo of
      0 : sSql := 'select * from cm.parametlplanus where idmodulo = 21 and idparametl = 7'; //GERA FOLHA PAGTO - PREVIA
      1 : sSql := 'select * from cm.parametlplanus where idmodulo = 21 and idparametl = 8'; //GERA FOLHA PAGTO - FINAL
    end;

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    if cdsAuxETL.IsEmpty then
    begin
      Result := False;
      Exit;
    end
    else
    begin
      if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
        path_EventWait := cdsAuxETL.FieldByName('DIRETORIO_PROD').AsString
      else
        path_EventWait := cdsAuxETL.FieldByName('DIRETORIO_DEV').AsString;

      iTempoRepete := cdsAuxETL.FieldByName('TEMPO_REPETE').AsInteger;
      iTempoAborta := cdsAuxETL.FieldByName('TEMPO_ABORTA').AsInteger;

      if (iTempoRepete <= 0) then
        iTempoRepete := 15000; //15 segundos por padrão

      if (iTempoAborta <= 0) then
        iTempoAborta := 0;

      if (path_EventWait = '') then
      begin
        Result := False;
        Exit;
      end
      else
        Result := True;
    end;
  end;

  function preparaDados : Boolean;
  begin
    Progresso(['Preparando dados - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    sSql := 'select cm.seq_etl_folha_funcef.nextval seq from dual';

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    if cdsAuxETL.IsEmpty then
    begin
      Result := False;
      Exit;
    end
    else
      idProcesso := cdsAuxETL.FieldByName('SEQ').AsInteger;

    if frmOpcRescisao.IdMotivo = 14 then
      DecodeDate(Cds.FieldByName('DATADESLIGAMENTO').AsDateTime, wAno, wMes, wDia) //Pega o mês de referência do empregado que está na tela, não leva em consideração a data de desligamento de cada empregado caso seja gerado em LISTA
    else
      DecodeDate(dDataPagamento, wAno, wMes, wDia);

    anoMesRef := IntToStr(wAno) +'/'+ FU.PoeZero(wMes);

    normal_Inicio := '01' +'/'+ FU.PoeZero(wMes) +'/'+ IntToStr(wAno);

    dtNormalFim := EncodeDate(wAno, wMes, 1);  //Dia 01
    dtNormalFim := IncMonth(dtNormalFim, 1); //Inclui um mês a data
    dtNormalFim := dtNormalFim - 1;          //Volta um dia, para chegar no último dia do mês
    DecodeDate(dtNormalFim, wAno, wMes, wDia_Aux);

    normal_Fim := IntToStr(wDia_Aux) +'/'+FU.PoeZero(wMes) +'/'+ IntToStr(wAno);

    dataPagamento := DateToStr(dDataPagamento);

    dataParaArquivos := 'ID' + FormatFloat('#00000', idProcesso) + '_' + IntToStr(wAno) + FU.PoeZero(wMes) + '_' + FormatDateTime('YYYYMMDDHHMMSS', Now);

    //WO23256 Leandro - inicio
    //case frmOpcRescisao.idmotivo of
    //  14 : //Folha de Rescisão de Contrato
    //  begin
    //    subPath := 'RESCISAO';
    //    sNomeWF := '14_RESCISAO';
    //  end;
    //  15 : //Folha de Rescisão Complementar
    //  begin
    //    subPath := 'RESCISAO_COMPLEMENTAR';
    //    sNomeWF := '15_RESCISAO_COMPLEMENTAR';
    //  end;
    //end;

    if not frmOpcRescisao.FazRescisaoCompl then
    begin
        subPath := 'RESCISAO';
        sNomeWF := '14_RESCISAO';
    end
    else
    begin
        subPath := 'RESCISAO_COMPLEMENTAR';
        sNomeWF := '15_RESCISAO_COMPLEMENTAR';
    end;

    //WO23256 Leandro - fim

    if frmOpcRescisao.Processo = 0 then
      path_Completo_Ew := path_EventWait + subPath + '\EventWait_PreviaFolpag.ew'
    else
      path_Completo_Ew := path_EventWait + subPath + '\EventWait_FinalFolpag.ew';

    path_Completo_Param_Preparo := path_ArquivosParam + subPath + '\param_preparo.par';
    path_Completo_Param_Previa  := path_ArquivosParam + subPath + '\param_previa.par';
    path_Completo_Param_Final   := path_ArquivosParam + subPath + '\param_final.par';

    if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
      DBConnectionCM := 'RPROD_ETL_FOLHA_FUNCEF'
    else
      DBConnectionCM := 'TIBERO_ETL_FOLHA_FUNCEF';

    Result := True;
  end;

  function insereControleETL : Boolean;
  var
    i: Integer;
  begin
    Progresso(['Inserindo controles para o processamento - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    iQtdEmpregados := 0;

    for i:= 1 to Length(sListaFuncSel) do
    begin
      if sListaFuncSel[i] = ',' then
        inc(iQtdEmpregados);
    end;

    if iQtdEmpregados <= 0 then
      iQtdEmpregados := 1;


    //WO23256 Leandro - inicio
     if not frmOpcRescisao.FazRescisaoCompl then
       sSql := 'insert into cm.etl_folha_funcef (id, idusuario, data_inicio, ' +
               ' idmotivo, anomesref, data_pagamento, processo, idpessoa_lista, qtd_empregados)' +
               ' values ( ' + IntToStr(idProcesso) + ', ' + IntToStr(Sistema.IdUsuario) + ', ' +
               ' sysdate, ' + IntToStr(frmOpcRescisao.idmotivo) + ', ' + QuotedStr(anoMesRef) + ', ' + QuotedStr(dataPagamento) +
               ', ' + IntToStr(frmOpcRescisao.Processo) + ', ' + QuotedStr(sListaFuncSel) + ', ' + IntToStr(iQtdEmpregados) + ')'
     else
       sSql := 'insert into cm.etl_folha_funcef (id, idusuario, data_inicio, ' +
               ' idmotivo, anomesref, data_pagamento, processo, idpessoa_lista, qtd_empregados)' +
               ' values ( ' + IntToStr(idProcesso) + ', ' + IntToStr(Sistema.IdUsuario) + ', ' +
               ' sysdate, ' + IntToStr(frmOpcRescisao.IdMotivoRescisaoCompl) + ', ' + QuotedStr(anoMesRef) + ', ' + QuotedStr(dataPagamento) +
               ', ' + IntToStr(frmOpcRescisao.Processo) + ', ' + QuotedStr(sListaFuncSel) + ', ' + IntToStr(iQtdEmpregados) + ')';
    //WO23256 Leandro - fim


    if fu.ExecSQL(sSql) then
    begin
      fu.Commit;
      Result := True;
    end
    else
    begin
      fu.Rollback;
      Result := False;
    end;
  end;
          
  function insereBWParamPreparo : Boolean;
  var F : textFile;
  begin
    Progresso(['Montando arquivo de parâmetros para o Preparo - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    AssignFile(F, path_Completo_Param_Preparo);

    ReWrite(F);

    Writeln(F, '[FOLHA_FUNCEF.WF:WF_' + sNomeWF + '_100_PREPARO]');
    Writeln(F, '$ParamOwnerCM  =CM');
    Writeln(F, '$DBConnectionCM=' + DBConnectionCM);
    Writeln(F);
    Writeln(F, '$$id_Processo   =' + inttoStr(idProcesso));
    Writeln(F, '$$idPessoa_lista=' + sListaFuncSel);
    Writeln(F);
    Writeln(F, '$$param_ANOMES_REF=' + anoMesRef);
    Writeln(F, '$$param_NORMAL_INI=' + normal_Inicio);
    Writeln(F, '$$param_NORMAL_FIM=' + normal_Fim);
    Writeln(F);
    Writeln(F, '$ParamOutputFilename_Preparo    =' + dataParaArquivos + '_preparo.txt');
    Writeln(F, '$ParamOutputFilename_Integracoes=' + dataParaArquivos + '_lkp_integracoes.txt');

    Closefile(F);

    Result := True;
  end;

  function insereBWParamPrevia : Boolean;
  var F : textFile;
  begin
    Progresso(['Montando arquivo de parâmetros para a Prévia - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    AssignFile(F, path_Completo_Param_Previa);
    ReWrite(F);

    Writeln(F, '[FOLHA_FUNCEF.WF:WF_' + sNomeWF + '_200_PREVIA]');
    Writeln(F, '$ParamOwnerCM  =CM');
    Writeln(F, '$DBConnectionCM=' + DBConnectionCM);
    Writeln(F);
    Writeln(F, '$$id_Processo   =' + inttoStr(idProcesso));
    //WO23256 Leandro - inicio
    if not frmOpcRescisao.FazRescisaoCompl then
      Writeln(F, '$$param_IDMOTIVO=' + inttoStr(frmOpcRescisao.idmotivo))
    else
      Writeln(F, '$$param_IDMOTIVO=' + inttoStr(frmOpcRescisao.IdMotivoRescisaoCompl));
    //WO23256 Leandro - fim
    Writeln(F, '$$idPessoa_lista=' + sListaFuncSel);
    Writeln(F);
    Writeln(F, '$$param_ANOMES_REF=' + anoMesRef);
    Writeln(F, '$$param_NORMAL_INI=' + normal_Inicio);
    Writeln(F, '$$param_NORMAL_FIM=' + normal_Fim);
    Writeln(F, '$$param_DATAPAGTO =' + dataPagamento);
    Writeln(F);
    Writeln(F, '$ParamSourceFilename_Preparo     =' + dataParaArquivos + '_preparo.txt');
    Writeln(F, '$ParamOutputFilename_PreviaFolpag=' + dataParaArquivos + '_previafolpag.txt');
    Writeln(F, '$ParamOutputFilename_ApagaPrevia =' + dataParaArquivos + '_delete_previafolpag.log');
    Writeln(F, '$ParamLKP_Integracoes            =' + dataParaArquivos + '_lkp_integracoes.txt');
    Writeln(F, '$ParamLKP_SomaHistrubsal         =' + inttoStr(wAno) + FU.PoeZero(wMes) + '_lkp_somahistrubsal.txt');

    Closefile(F);

    Result := True;
  end;

  function insereBWParamFinal : Boolean;
  var F : textFile;
  begin
    Progresso(['Montando arquivo de parâmetros para a Final - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    AssignFile(F, path_Completo_Param_Final);
    ReWrite(F);

    Writeln(F, '[FOLHA_FUNCEF.WF:WF_' + sNomeWF + '_350_FINAL]');
    Writeln(F, '$ParamOwnerCM  =CM');
    Writeln(F, '$DBConnectionCM=' + DBConnectionCM);
    Writeln(F);
    Writeln(F, '$$id_Processo             =' + inttoStr(idProcesso));
    //WO23256 Leandro - inicio
    if not frmOpcRescisao.FazRescisaoCompl then
      Writeln(F, '$$param_IDMOTIVO          =' + inttoStr(frmOpcRescisao.idmotivo))
    else
      Writeln(F, '$$param_IDMOTIVO          =' + inttoStr(frmOpcRescisao.IdMotivoRescisaoCompl));
    //wo23256 Leandro - fim
    Writeln(F, '$$FLG_ADIANTA_PAGTO_FERIAS=' + inttoStr(iFlgAdiantaPgtoFerias));
    Writeln(F);
    Writeln(F, '$$idPessoa_lista=' + sListaFuncSel);
    Writeln(F);
    Writeln(F, '$$param_ANOMES_REF=' + anoMesRef);
    Writeln(F, '$$param_DATAPAGTO =' + dataPagamento);

    Closefile(F);

    Result := True;
  end;

  function insereArquivosParamETL : Boolean;
  begin
    if frmOpcRescisao.Processo = 0 then
    begin

      if not (insereBWParamPreparo) then
        Exit
      else
      if not (insereBWParamPrevia) then
        Exit;
    end
    else
    begin
      if not (insereBWParamFinal) then
        Exit;
    end;

    Result := True;
  end;

  function insereEventWaitETL : Boolean;
  var F : textFile;
  begin
    Progresso(['Iniciando o processamento - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;

    if FileExists(path_Completo_Ew) then
    begin
      Result := False;
      Exit;
    end
    else
    begin
      Sleep(15000); //Aguardo 15 segundos antes de colocar o arquivo no path do EventWait para garantir que o WF foi totalmente finalizado da execução anterior

      AssignFile(F, path_Completo_Ew);
      ReWrite(F);
      Closefile(F);

      Result := True;
    end;
    
  end;
begin
  try
    //Quantidade de processos para atualizar no frmProgresso_GeraCalc
    iQtdProcessos := 8;

    //Inicia variáveis
    iFlgAdiantaPgtoFerias := -1;

    Progresso(['Processo iniciado ...', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(1500); //Só pra mensagem ficar na tela por 1,5 segundos antes de ir pra próxima

    if not (verificaStatusETL) then
    begin
      MsgDlg('Existe um processo em execução, aguarde!' +#10#13 + #10#13+
             'Usuário: ' + sUsuarioProcessoAtivo + #10#13+
             'Início: ' + sDataInicioProcessoAtivo + #10#13+
             'Qtd: ' + sQtdEmpregadosProcessoAtivo, 'Aviso', mtInformation, [mbOK], 0);
      Exit;
    end
    else
    if not (buscaParamETL) then
    begin
      MsgDlg('Problemas ao buscar as parametrizações para o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
      Exit;
    end
    else
    if not (preparaDados) then
    begin
      MsgDlg('Problemas ao preparar os dados para o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
      Exit;
    end
    else
    begin
      if not (insereControleETL) then
      begin
        MsgDlg('Problemas ao inserir as informações de controle para o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
        Exit;
      end
      else
      begin
        if not (insereArquivosParamETL) then
        begin
          MsgDlg('Problemas ao indicar os arquivos de parâmetros para o ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
          Exit;
        end
        else
        begin
          if not (insereEventWaitETL) then
          begin
            MsgDlg('Problemas ao iniciar o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
            Exit;
          end
          else
          begin
            iContador := 0;
            iContadorAborta := 0;

            if iTempoAborta <> 0 then
              iContadorAborta := Trunc((iTempoAborta / iTempoRepete));

            Result := True;

            Progresso(['Processo de geração da folha em execução pelo ETL', '', iQtdEmpregados, '', iQtdProcessos, 1]);
            Application.ProcessMessages;

            while not (verificaStatusETL) do
            begin
              Progresso(['Processo de geração da folha em execução pelo ETL', '', iQtdEmpregados]); //Não atualizar progresso
              Application.ProcessMessages;

              Sleep(iTempoRepete);
              inc(iContador);

              if (iContadorAborta <> 0) and (iContador = iContadorAborta) then
              begin
                Result := False;


                MsgDlg('Processo atingiu o tempo limite de espera e foi abortado no PLANUS. ' +
                       'Verifique com a equipe GETEC o status do processamento no ETL', 'Erro', mtError, [mbOK], 0);
                Break;
              end;

            end;

            Progresso(['Processo de geração da folha FINALIZADO', '', iQtdEmpregados, '', iQtdProcessos, 1]);
            Application.ProcessMessages;
          end;
        end;
      end;
    end;
  except
    On E : Exception do
    Begin
      Result := False;
      MsgDlg('Erro: ' + E.Message, 'Erro', mtError, [mbOK], 0);
    End;
  end;
end;
//Everson Cunha - WO 11765 - Fim

end.
