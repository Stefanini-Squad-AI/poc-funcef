unit fRegAcesso2;

interface

uses
  Windows, Messages, SysUtils,Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, IvDictio, IvMulti, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DB, DBClient,
  uCMClientDataSet, Wwdatsrc, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel, TB97Tlwn,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Spin,
  uBiometria, uCtrlCargo, uCtrlListTerceirosRH, uCtrlPessoaFuncionario, uCtrlGlobalRH,
  uCtrlHoraTrab, uCtrlAssociaHorario, uCtrlRegAcessoFunc, uCtrlHorarioVariavel,
  uCtrlModeloAcesso, uCtrlModeloAcesso_Inner, uCtrlModeloAcesso_Rodbel,
  uCtrlModeloAcesso_Passo, IvEMulti, DBTables, uCmSqlParams;

type
  TfrmRegAcesso2 = class(TfrmTelaAutorizacao)
    dsImg: TwwDataSource;
    CdsImg: TCMClientDataSet;
    dsHorario: TwwDataSource;
    CdsHorario: TCMClientDataSet;
    tmHoraAtual: TTimer;
    CdsAcessoFunc: TCMClientDataSet;
    Bevel2: TBevel;
    lblMatricula: TLabel;
    lblNome: TLabel;
    lblCCusto: TLabel;
    lblCargo: TLabel;
    Bevel4: TBevel;
    bbtnEntrada: TBitBtn;
    bbtnSair: TBitBtn;
    Bevel3: TBevel;
    lblHorarioTrab: TLabel;
    wwDBGrid1: TwwDBGrid;
    pnlDocumento: TPanel;
    lblHora: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    imgPessoa: TDBImage;
    memDocumento: TMemo;
    tmInterrogacao: TTimer;
    CdsHorarioVariavel: TCMClientDataSet;
    CdsFuncionario: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    TimerVerificaDocumento: TTimer;
    bbtnSaidaIntervalo: TBitBtn;
    bbtnRetornoIntervalo: TBitBtn;
    bbtnSaida: TBitBtn;
    lblMensagem: TLabel;
    dbgrdBatidas: TwwDBGrid;
    dsAcessoFunc2: TDataSource;
    CdsAcessoFunc2: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure tmHoraAtualTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnEntradaClick(Sender: TObject);
    procedure memDocumentoChange(Sender: TObject);
    procedure tmInterrogacaoTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerVerificaDocumentoTimer(Sender: TObject);
    procedure bbtnSaidaClick(Sender: TObject);
    procedure bbtnSaidaIntervaloClick(Sender: TObject);
    procedure bbtnRetornoIntervaloClick(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlAssociaHorario: TCtrlAssociaHorario;
    CtrlRegAcessoFunc: TCtrlRegAcessoFunc;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;

    ModeloAcesso: TCtrlModeloAcesso;

    UltimoDigito, Data1, Data2: TDateTime;
    Log: TStringList;

    dIdPessoa: double;
    dIdEmpresa: double;
    dIdCargo: double;

    sCodCentroCusto: string;
    sNumDocumento: string;
    sModelo: string;

    bExecTimerInterrogacao: boolean;

    iSaldoAcessos: integer;

    bMsg_Aviso_Momentanea: boolean;
    sMsg_Aviso: string;
    Msg_Aviso_Cor: TColor;

    // Indicador da passagem, sendo:
    // 1º Caractere corresponde à situação da passagem.
    //    Abaixo encontra-se a Lista de Valores Permitidos:
    //    0=Normal;
    //    1=Forçada;
    //    2=Rejeitada;
    // 2º Caractere corresponde ao motivo da situação da passagem.
    //    Abaixo encontra-se a Lista de Valores Permitidos:
    //    0=Normal;
    //    1=Sit. Funcional;
    //    2=Dia de Trabalho;
    //    3=Horário Pessoa;
    //    4=Horário Estação;
    //    5=Quant. Acessos;
    //    6=Férias;
    sIndPassagem: string[2];

    FormaOperacao: TFormaOperacao;

    procedure SetIndPassagem(const Situacao, MotivoSituacao: char);

    procedure Procurar_Acesso_Anterior;
    procedure Mostrar_Mensagem_Acesso;
    procedure Travar_Dispositivo;
    procedure Destravar_Dispositivo;
    procedure SelPessoa;
    function  ProcurarPessoa: boolean;
    procedure ReiniciarTimer;
    procedure HabilitarBotoes(const Habilita: boolean);
    procedure ExecFocus(const ExecLimparTela: boolean = true);

    procedure Msg_Aviso(Cor: TColor; const Msg, OpcaoConfirma: string);

    //procedure Enviar_Mensagem_Acesso_Nao_Concluido;
    procedure Mensagem_Libera_Acesso;
    procedure Mensagem_Acesso_Dia_Folga;
    procedure Mostrar_Mensagem_Sem_Horario;
    procedure Mensagem_Cracha_Invalido;

    function Verificar_Acessos_Fora_de_Hora: boolean;
    function Verificar_Pessoa_Desligada: boolean;
    function Verificar_Pessoa_Afastada: boolean;
    function Verificar_Pessoa_Ferias: boolean;
    function IncSecond(const AValue: TDateTime;
      const ANumberOfSeconds: Int64): TDateTime;

    procedure MontarTelaInicial;

    // Biometria
    procedure LeituraBiometrica;
  public
    iColDocumento: integer;
    iTamDocumento: integer;
    iIndIdentificacao: integer;
    iFlgAfast: integer;
    iFlgFerias: integer;
    iFlgAltera: integer;

    dIdDocumento: double;

    procedure Limpar_memDocumento;
    procedure LimparTela;
  end;

var
  frmRegAcesso2: TfrmRegAcesso2;


implementation

uses  uSistema, uMensErro, uCtrlPadroes, uModulo, uCtrlFuncoesRH, uCtrlUsoGeralRH,
  uBiometriaTypes, fPrincipal, dCds, uCmCustomCdbObject;

const
  // Indicador da passagem, sendo:
  // Valores da situação da passagem:
  IND_PASSAGEM_NORMAL = '0';
  IND_PASSAGEM_FORCADA = '1';
  IND_PASSAGEM_REJEITADA = '2';
  // Valores do motivo da situação da passagem:
  IND_MOTIVO_PASSAGEM_NORMAL = '0';
  IND_MOTIVO_PASSAGEM_SIT_FUNC = '1';
  IND_MOTIVO_PASSAGEM_DIA_TRAB = '2';
  IND_MOTIVO_PASSAGEM_HORARIO = '3';
  IND_MOTIVO_PASSAGEM_HORA_ESTACAO = '4';
  IND_MOTIVO_PASSAGEM_QUANT_ACESSOS = '5';
  IND_MOTIVO_PASSAGEM_FERIAS = '6';

  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SALDO = ' Saldo :1.';
  MSG_SALDO_AUTOM = ' Saldo Antes de Passar :1.';
  MSG_ACESSOS_PERM = 'Acessos Permitidos (:1) Excedidos.';
  MSG_CRACHA_NAO_REC = 'Crachá ":1" não reconhecido.';

{$R *.dfm}

procedure TfrmRegAcesso2.FormCreate(Sender: TObject);
begin
 inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlAssociaHorario := TCtrlAssociaHorario.Create;
  CtrlAssociaHorario.InitializeAs(Padroes);

  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);

  CtrlRegAcessoFunc := TCtrlRegAcessoFunc.Create;
  CtrlRegAcessoFunc.InitializeAs(Padroes);
  CtrlRegAcessoFunc.CdsAcessoFunc := CdsAcessoFunc;

  CdsAux.Data := CtrlGlobalRH.GetParamRH('PONTOINI, PONTOFIM, '+
    'IDDOCUMENTO, COLDOCUMENTO, TAMDOCUMENTO, TAMANHOMATRIC, '+
    'FLGMARCAAFAST, FLGMARCAFERIAS, FLGALTERAPONTO, PRAZOPONTO');
  dIdDocumento := CdsAux.FieldByName('IDDOCUMENTO').asFloat;
  iColDocumento := CdsAux.FieldByName('COLDOCUMENTO').asInteger;
  iTamDocumento := CdsAux.FieldByName('TAMDOCUMENTO').asInteger;

  iFlgAfast := CdsAux.FieldByName('FLGMARCAAFAST').asInteger;
  iFlgFerias := CdsAux.FieldByName('FLGMARCAFERIAS').asInteger;
  iFlgAltera := CdsAux.FieldByName('FLGALTERAPONTO').asInteger;

  Data1 := CdsAux.FieldByName('PONTOINI').asDateTime;
  Data2 := CdsAux.FieldByName('PONTOFIM').asDateTime;

  ultimoDigito := CtrlRegAcessoFunc.GetDataHora;

  if (Date > Data2) and (Date <= Data2 + CdsAux.FieldByName('PRAZOPONTO').asInteger) then
    MsgDlg(fu.CMTranslate('Certifique-se de que seu ponto do período '+CR_LF+
      DateToStr(Data1) + ' a ' + DateToStr(Data2) + ' já foi apurado.'),
      fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);


end;
procedure TfrmRegAcesso2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
end;

procedure TfrmRegAcesso2.FormDestroy(Sender: TObject);
begin
  // Desligar os Timers
  tmInterrogacao.Enabled := false;
  tmHoraAtual.Enabled := false;

  // Liberar os recursos das classes de controle instanciadas
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlAssociaHorario);
  FreeAndNil(CtrlRegAcessoFunc);
  FreeAndNil(CtrlHorarioVariavel);

  // Desabilitar Teclados na Tela Principal
  frmPrincipal.sbtnTeclado.Visible := false;
  frmPrincipal.sbtnTecladoMatric.Visible := false;
  inherited;
end;

procedure TfrmRegAcesso2.FormShow(Sender: TObject);
begin
  // Inicializar o Label que mostra a Hora Atual
  lblHora.Caption := DateTimeToStr(CtrlRegAcessoFunc.GetDataHora);
  tmHoraAtual.Enabled := true;
  SelPessoa;
  //LimparTela;
  MontarTelaInicial;

   inherited;
end;

procedure TfrmRegAcesso2.tmHoraAtualTimer(Sender: TObject);
begin
  lblHora.Caption := DateTimeToStr(IncSecond(StrToDateTime(lblHora.Caption), 1));
  lblHora.Update;
end;

procedure TfrmRegAcesso2.tmInterrogacaoTimer(Sender: TObject);
begin
  tmInterrogacao.Enabled := false;

  if (iIndIdentificacao = IDENTIF_BIOMETRICA) then
    LeituraBiometrica
  else
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    memDocumento.Text := ModeloAcesso.Interrogacao;

  // Acionar o temporizador somente para as opções necessárias
  // Opção Assistida não pode habilitar o Timer agora
//  tmInterrogacao.Enabled :=
//    (Modulo.IndLiberacao in [AUTOM_COM_CATRACA, AUTOM_SEM_CATRACA]) or
//    (iIndIdentificacao = IDENTIF_BIOMETRICA);
  tmInterrogacao.Enabled := bExecTimerInterrogacao;
end;

procedure TfrmRegAcesso2.memDocumentoChange(Sender: TObject);
begin
  UltimoDigito := CtrlRegAcessoFunc.GetDataHora;
  
  if (Length(memDocumento.Text) >= (iColDocumento + iTamDocumento - 1)) then
    SelPessoa;
end;

procedure TfrmRegAcesso2.bbtnEntradaClick(Sender: TObject);
var
  dDataAcesso: TDateTime;
begin
  Procurar_Acesso_Anterior;
  dDataAcesso := CtrlRegAcessoFunc.GetDataHora;

  // Caso seja o primeiro acesso ou a estação permita Somente Entrada, inserir o acesso
  if (CdsAcessoFunc.IsEmpty) or (Trunc(CdsAcessoFunc.FieldByName('ENTRADA').asDateTime) <> Trunc(dDataAcesso)) or
     ((Trunc(CdsAcessoFunc.FieldByName('ENTRADA').asDateTime) = Trunc(dDataAcesso)) and
      (not CdsAcessoFunc.FieldByName('SAIDA').IsNull) and
      (MsgDlg(FU.CMTranslate('Tem Certeza de que Deseja Inserir Nova Entrada Neste Dia ?'),
       FU.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) = mrYes))  then
  begin
    CdsAcessoFunc.Insert;
    CdsAcessoFunc.FieldByName('IDPESSOA').asFloat := dIdPessoa;
    CdsAcessoFunc.FieldByName('IDESTACAOACESSO').asFloat := Modulo.IdEstacaoEcesso;
    CdsAcessoFunc.FieldByName('INDFUNCAO').asString := 'P';
    CdsAcessoFunc.FieldByName('ENTRADA').asDateTime := dDataAcesso;
    CdsAcessoFunc.FieldByName('FLGABONADO').asInteger := 0;
    CdsAcessoFunc.FieldByName('INDPASSAGEM').asString := sIndPassagem[1] + sIndPassagem[2];
    // Preencher com 1 o campo QTDEVEZES para marcar o acesso como "já fechado" e
    // portanto, não deve ser utilizado em outras entradas. Isto foi feito porque
    // uma estação que está como só para Entrada pode mudar para Entrada e Saída e
    // caso alguém que tenha feito acesso nesta estação, o sistema pegava o primeiro
    // acesso e marcava-o como saída. O que ele faz agora, é criar um novo registro
    // de entrada.
    if (FormaOperacao = tpoEntrada) then
      CdsAcessoFunc.FieldByName('QTDEVEZES').asInteger := 1
    else
      CdsAcessoFunc.FieldByName('QTDEVEZES').Clear;
      CdsAcessoFunc.FieldByName('ENTRADA').asDateTime := dDataAcesso;
    CdsAcessoFunc.Post;
  end
  else // Demais casos, editar o último acesso
  begin
    if (iFlgAltera = 0) or (MsgDlg(FU.CMTranslate('Tem Certeza de que Deseja Alterar a Entrada ?'),
      FU.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) = mrNo) then
      exit;
    CdsHorario.Locate('IDDIASEMANA', DayOfWeek(Date), []);
    CdsAcessoFunc.Edit;
    CdsAcessoFunc.FieldByName('ENTRADA').asDateTime := dDataAcesso;
    CdsAcessoFunc.Post;
  end;

  if not(CtrlRegAcessoFunc.GravarAcessoFunc) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text :=
      fu.CMTranslate('Ocorreu um erro ao tentar gravar o acesso.') +CR_LF+
      fu.CMTranslate('Erro:') +CR_LF+ CtrlRegAcessoFunc.MessageInfo;
    dmCds.CmErroDlg.Execute;
    exit;
  end;

  CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc2(dIdPessoa, 'P');
end;

procedure TfrmRegAcesso2.bbtnSairClick(Sender: TObject);
begin
  CdsAcessoFunc.Active :=false;
  Close;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmRegAcesso2.SetIndPassagem(const Situacao, MotivoSituacao: char);
begin
  sIndPassagem[1] := Situacao;
  if (MotivoSituacao <> #0) then
    sIndPassagem[2] := MotivoSituacao;
end;

procedure TfrmRegAcesso2.MontarTelaInicial;
begin
  frmPrincipal.sbtnTeclado.Visible := (iIndIdentificacao <> IDENTIF_TECLADO);
  frmPrincipal.sbtnTecladoMatric.Visible :=
    (iIndIdentificacao <> IDENTIF_TECLADO) and (dIdDocumento > 0);

  if (iIndIdentificacao = IDENTIF_BIOMETRICA) or (sModelo = RODBEL_RBC_2801) then
    //lblMensagem2.Caption := fu.CMTranslate('Aguardando Identificação')
  else
  if (iIndIdentificacao in [IDENTIF_LEITOR_SEM_CATRACA, IDENTIF_LEITOR_COM_CATRACA]) then
    //lblMensagem2.Caption := fu.CMTranslate('Passe o Cartão')
  else
   // lblMensagem2.Caption := '';
  end;

procedure TfrmRegAcesso2.Limpar_memDocumento;
begin
  memDocumento.OnChange := nil;
  memDocumento.Text := '';
  memDocumento.OnChange := memDocumentoChange;
end;

procedure TfrmRegAcesso2.LimparTela;
begin
  Limpar_memDocumento;
  //edDocumento.Text := '';
  lblMensagem.Caption := '';
  imgPessoa.Visible := false;
  lblNome.Caption := '';
  lblMatricula.Caption := '';
  lblCCusto.Caption := '';
  lblCargo.Caption := '';
  lblHorarioTrab.Caption := '';
  //lblMensagem2.Visible := not(iIndIdentificacao = IDENTIF_TECLADO);
  HabilitarBotoes(false);
  CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(-1);
  CdsAcessoFunc.Data :=CtrlRegAcessoFunc.ListAcessoEntradaFunc(dIdPessoa, 'A');
end;

procedure TfrmRegAcesso2.ExecFocus(const ExecLimparTela: boolean);
begin
  if (ExecLimparTela) then
    LimparTela;
end;

procedure TfrmRegAcesso2.Msg_Aviso(Cor: TColor; const Msg, OpcaoConfirma: string);
begin

end;

function TfrmRegAcesso2.Verificar_Acessos_Fora_de_Hora: boolean;
var
  Hora: TTime;
  iMinInicio: integer;
begin
  Result := true;   // estava false - coloquei true para forçar a não verificação
{  if (Config.cbxTolerancia.Checked) then
  begin
    Hora := Time;
    // Precisa verificar:
    // 1) Se é a primeira batida do dia
    // 2) Se a tolerância foi ultrapassada
    iMinInicio :=
      StrToInt(Copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,1,2))*60+
      StrToInt(Copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,4,2));

    Procurar_Acesso_Anterior;
    if (((Hora-Int(Hora)) * 24 * 60 < iMinInicio - Config.spedMin.Value) or
        ((Hora-Int(Hora)) * 24 * 60 > iMinInicio + Config.spedMin.Value)) and
       ((CdsAcessoFunc.IsEmpty) or (FormaOperacao = tpoEntrada)) then
    begin
      // Fora da Tolerância de Horário
      SetIndPassagem(IND_PASSAGEM_FORCADA, IND_MOTIVO_PASSAGEM_HORARIO);

      if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
        ModeloAcesso.Enviar_Mensagem_Acessos_Fora_de_Hora;

      Msg_Aviso(clRed, fu.CMTranslate('Acesso Fora do Horário.'), fu.CMTranslate(' Confirma?'));
      bMsg_Aviso_Momentanea := (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
      Result := true;
    end;
  end; }
end;

procedure TfrmRegAcesso2.Mensagem_Libera_Acesso;
begin

end;

{procedure TfrmRegAcesso.Enviar_Mensagem_Acesso_Nao_Concluido;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    ModeloAcesso.Enviar_Mensagem(CMTranslate('Acesso não Concluído.'));

  Msg_Aviso(clRed, CMTranslate('Acesso não Concluído.'), 'Passe o Cartão Novamente.');
  bMsg_Aviso_Momentanea := true;
end;}

procedure TfrmRegAcesso2.Mensagem_Acesso_Dia_Folga;
begin
  SetIndPassagem(IND_PASSAGEM_REJEITADA, IND_MOTIVO_PASSAGEM_DIA_TRAB);

  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    ModeloAcesso.Enviar_Mensagem_Acesso_Dia_Folga;

  Msg_Aviso(clRed, fu.CMTranslate('Acesso em Dia de Folga.'), fu.CMTranslate(' Confirma?'));
  bMsg_Aviso_Momentanea := (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
end;

procedure TfrmRegAcesso2.Mostrar_Mensagem_Sem_Horario;
begin
  Msg_Aviso(clRed, fu.CMTranslate('Sem Horário de Trabalho Cadastrado. Passagem não Permitida'), '');
  bMsg_Aviso_Momentanea := true;
end;

function TfrmRegAcesso2.Verificar_Pessoa_Desligada: boolean;
begin
  Result := (CdsFunc.FieldByName('TIPOSIT').asString = 'D');
end;

function TfrmRegAcesso2.Verificar_Pessoa_Afastada: boolean;
begin
  Result := (CdsFunc.FIeldByName('TIPOSIT').asString = 'F');
end;

function TfrmRegAcesso2.Verificar_Pessoa_Ferias: boolean;
begin
  Result :=
    (CtrlRegAcessoFunc.PessoaEmFerias(CdsFunc.FieldByName('IDPESSOA').asFloat, Date));
end;

procedure TfrmRegAcesso2.Mensagem_Cracha_Invalido;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    ModeloAcesso.Enviar_Mensagem_Cracha_Invalido;

  Msg_Aviso(clRed, fu.CMTranslateMsg(MSG_CRACHA_NAO_REC, [sNumDocumento]), '');
  bMsg_Aviso_Momentanea := true;
  Limpar_memDocumento;
  ExecFocus(false);
end;

procedure TfrmRegAcesso2.Procurar_Acesso_Anterior;
begin
  CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc2(dIdPessoa, 'P');
end;

procedure TfrmRegAcesso2.Mostrar_Mensagem_Acesso;
begin

end;

procedure TfrmRegAcesso2.Travar_Dispositivo;
begin

end;

procedure TfrmRegAcesso2.Destravar_Dispositivo;
begin

end;

procedure TfrmRegAcesso2.SelPessoa;
var
  sComplemento: string;
begin
 // if (Trim(memDocumento.Text) = '') then
  // exit;

  sMsg_Aviso := '';
  sComplemento := '';
  SetIndPassagem(IND_PASSAGEM_NORMAL, IND_MOTIVO_PASSAGEM_NORMAL);
  bExecTimerInterrogacao := false;

  if (ProcurarPessoa) then
  begin
    CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc2(dIdPessoa, 'P');
    // Obter o Centro de Custo da Pessoa
    //CdsAux.Data := CtrlListTerceirosRH.ListCCusto(FloatToStr(dIdEmpresa), sCodCentroCusto);
    lblCCusto.Caption := CdsFunc.FieldByName('CENTROCUSTO').asString;

    // Obter o Cargo da Pessoa
    CdsAux.Data := CtrlCargo.ListCargo(dIdCargo);
    lblCargo.Caption := CdsAux.FieldByName('TITULO').asString;

    CdsHorario.DisableControls;

    if (not Verificar_Pessoa_Ferias) or (iFlgFerias = 1) then
    begin
      if (CdsHorario.IsEmpty) then
        Mostrar_Mensagem_Sem_Horario
      else
      if (CdsHorario.Locate('IDDIASEMANA', DayOfWeek(Date), [])) then
      begin
        if not(Verificar_Acessos_Fora_de_Hora) then
        begin
          // Mensagem de liberação da passagem a ser exibida na tela
          if (Modulo.IndLiberacao in [AUTOM_COM_CATRACA, AUTOM_SEM_CATRACA]) then
          begin
            if (sComplemento = '') then
              Msg_Aviso(clTeal, fu.CMTranslate('Acesso Liberado'), '')
            else
              Msg_Aviso(clTeal, sComplemento, fu.CMTranslate('Acesso Liberado'));
          end
          else
          begin
            if (sComplemento = '') then
              Msg_Aviso(clTeal, fu.CMTranslate('Confirma Acesso?'), '')
            else
              Msg_Aviso(clTeal, sComplemento, fu.CMTranslate('Confirma Acesso?'));
          end;
          bMsg_Aviso_Momentanea :=
            (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
        end;
      end
      else
        Mensagem_Acesso_Dia_Folga;
    end
    else
    begin
      MsgDlg(fu.CMTranslate('Você Está Em Gozo de Férias. Acesso Negado.'),
        fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
      Close;
    end;
  end;
end;

function TfrmRegAcesso2.ProcurarPessoa: boolean;
var
  iIdHorario: integer;
begin
  dIdPessoa := Sistema.IdUsuario;

  CdsFunc.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(dIdPessoa,
    '  P.IDPESSOA, P.NOME, F.MATRICULA, F.IDCARGO, F.CODCENTROCUSTO, F.IDEMPRESA,' +CR_LF+
    '  P.IDIMAGEM, F.IDHORARIO, F.FLGMARCAINTERVALO, TIPOSIT, CC.NOME AS CENTROCUSTO');

  Result := not(CdsFunc.IsEmpty);
  if (Result) then
  begin
    if (Verificar_Pessoa_Desligada) then
    begin
      MsgDlg(fu.CMTranslate('Você Está Desligado da Empresa. Acesso Negado.'),
        fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
      Close;
    end;

    if (iFlgAfast = 0) and (Verificar_Pessoa_Afastada) then
    begin
      MsgDlg(fu.CMTranslate('Você Está em Situação de Afastamento. Acesso Negado.'),
        fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
      Close;
    end;

    bbtnSaidaIntervalo.Enabled := CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1;
    bbtnRetornoIntervalo.Enabled := bbtnSaidaIntervalo.Enabled;

    // Obter a Foto da Pessoa
    CdsImg.Data := CtrlListTerceirosRH.ListImagem(CdsFunc.FieldByName('IDIMAGEM').asFloat);
    imgPessoa.Visible := not(CdsImg.IsEmpty) and not(CdsFunc.FieldByName('IDIMAGEM').IsNull);

    // Preencher os campos da tela
    lblNome.Caption := CdsFunc.FieldByName('NOME').asString;
    lblMatricula.Caption := fu.CMTranslate('Matrícula: ')+ CdsFunc.FieldByName('MATRICULA').asString;

    sCodCentroCusto := CdsFunc.FieldByName('CODCENTROCUSTO').asString;
    dIdEmpresa := CdsFunc.FieldByName('IDEMPRESA').asFloat;
    dIdCargo := CdsFunc.FieldByName('IDCARGO').asFloat;

    // Preencher o horário da pessoa
    CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
      dIdPessoa, DateToStr(Date), DateToStr(Date));

    if (CdsHorarioVariavel.IsEmpty) then
      iIdHorario := CdsFunc.FieldByName('IDHORARIO').asInteger
    else
      iIdHorario := CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;

    if (iIdHorario = 0) then
      CdsAux.Data := CtrlHoraTrab.ListHoraTrab(-1)
    else
      CdsAux.Data := CtrlHoraTrab.ListHoraTrab(iIdHorario);

    lblHorarioTrab.Caption := fu.CMTranslate('Horário: ') + CdsAux.FieldByName('NOMEHORARIO').asString;
    CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(CdsAux.FieldByName('IDHORARIO').asInteger);
    CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc2(dIdPessoa, 'P');
    CdsAcessoFunc.Active :=true;
  end
  else
    Mensagem_Cracha_Invalido;
end;

procedure TfrmRegAcesso2.ReiniciarTimer;
begin
  ExecFocus;
  // Acionar o temporizador somente para as opções necessárias
  bExecTimerInterrogacao :=
    (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) or
    (iIndIdentificacao = IDENTIF_BIOMETRICA);
  tmInterrogacao.Enabled := bExecTimerInterrogacao;
  //if (bExecTimerInterrogacao) then
  //  Destravar_Dispositivo;
end;

procedure TfrmRegAcesso2.HabilitarBotoes(const Habilita: boolean);
begin
  //*bbtnOk.Enabled := Habilita;
 // bbtnRejeitar.Enabled := Habilita;
end;

procedure TfrmRegAcesso2.LeituraBiometrica;
const
  Meu_SecuBSPERROR_USER_CANCEL = 513;
var
  bAchou: boolean;
  CmBSP: TCmBSP;
begin
  bAchou := false;
  Application.ProcessMessages;

  CmBSP := TCmBSP.Create;
  try
    if (CmBSP.Open) then
    begin
      CmBSP.LoadFromDb(Sistema.IdUsuario);

      if (CmBSP.CapturarParaComparar) then
      begin
        CdsFuncionario.First;
        while not(CdsFuncionario.EOF) do
        begin
          bAchou := CmBSP.Comparar(CdsFuncionario.FieldByName('FIR').asString);

          if (bAchou) then
            break
          else
            CdsFuncionario.Next;
        end;
      end;
    end;
  finally
    CmBSP.Free;
  end;

  if (bAchou) then
    memDocumento.Text := CdsFuncionario.FieldByName('MATRICULA').asString
  else
  if (CmBSP.ErrorCode = Meu_SecuBSPERROR_USER_CANCEL) then
  begin
    MsgDlg(fu.CMTranslate('Identificação cancelada pelo usuário.'),
      fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
    Close;
  end
  else
  if (CmBSP.ErrorCode <> SecuBSPERROR_NONE) and
     (CmBSP.ErrorCode <> SecuBSPERROR_CAPTURE_TIMEOUT) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text :=
      fu.CMTranslate('Ocorreu um erro na leitura biométrica.') +CR_LF+
      fu.CMTranslate('Erro: ') +CmBSP.ErrorMessage +CR_LF+
      fu.CMTranslate('Favor efetuar a identificação novamente.');
    dmCds.CmErroDlg.Execute;
  end;

  Application.ProcessMessages;
end;

procedure TfrmRegAcesso2.TimerVerificaDocumentoTimer(Sender: TObject);
var
  TempoDecorrido: integer;
begin
  inherited;
  TempoDecorrido := 100;


  if (Length(memDocumento.Text) < (iColDocumento + iTamDocumento - 1)) and (TempoDecorrido > 500) then
  begin
    Limpar_memDocumento;
  end;
end;

procedure TfrmRegAcesso2.bbtnSaidaClick(Sender: TObject);
var
  dDataAcesso: TDateTime;
begin
  Procurar_Acesso_Anterior;
  dDataAcesso := CtrlRegAcessoFunc.GetDataHora;

  if (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) and
     ((CdsAcessoFunc.FieldByName('SAIDAINTERVALO').IsNull) or
      (CdsAcessoFunc.FieldByName('RETORNOINTERVALO').IsNull)) then
  begin
    MsgDlg(fu.CMTranslate('Ação Incompatível: Marque primeiro a Saída e/ou o Retorno do Intervalo !!'),
      fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  if (not CdsAcessoFunc.FieldByName('SAIDA').isNull) and
    ((iFlgAltera = 0) or (MsgDlg(FU.CMTranslate('Tem Certeza de que Deseja Alterar a Saída ?'),
      FU.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) = mrNo)) then
    exit;
  CdsHorario.Locate('IDDIASEMANA', DayOfWeek(Date), []);
  CdsAcessoFunc.Edit;
  CdsAcessoFunc.FieldByName('SAIDA').asDateTime := dDataAcesso;
  CdsAcessoFunc.Post;

  if not(CtrlRegAcessoFunc.GravarAcessoFunc) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text :=
      fu.CMTranslate('Ocorreu um erro ao tentar gravar o acesso.') +CR_LF+
      fu.CMTranslate('Erro:') +CR_LF+ CtrlRegAcessoFunc.MessageInfo;
    dmCds.CmErroDlg.Execute;
    exit;
  end;
   CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc2(dIdPessoa, 'P');
  // Executar o Focus no campo correto e reiniciar o temporizador
 // ReiniciarTimer;
end;

procedure TfrmRegAcesso2.bbtnSaidaIntervaloClick(Sender: TObject);
var
  dDataAcesso: TDateTime;
begin
  Procurar_Acesso_Anterior;
  dDataAcesso := CtrlRegAcessoFunc.GetDataHora;

  if (not CdsAcessoFunc.FieldByName('SAIDAINTERVALO').isNull) and
     ((iFlgAltera = 0) or (MsgDlg(FU.CMTranslate('Tem Certeza de que Deseja Alterar a Saída para Intervalo ?'),
    FU.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) = mrNo)) then
    exit;
  CdsHorario.Locate('IDDIASEMANA', DayOfWeek(Date), []);
  CdsAcessoFunc.Edit;
  CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asDateTime := dDataAcesso;
  CdsAcessoFunc.Post;

  if not(CtrlRegAcessoFunc.GravarAcessoFunc) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text :=
      fu.CMTranslate('Ocorreu um erro ao tentar gravar o acesso.') +CR_LF+
      fu.CMTranslate('Erro:') +CR_LF+ CtrlRegAcessoFunc.MessageInfo;
    dmCds.CmErroDlg.Execute;
    exit;
  end;
   CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc2(dIdPessoa, 'P');
end;

procedure TfrmRegAcesso2.bbtnRetornoIntervaloClick(Sender: TObject);
var
  dDataAcesso: TDateTime;
begin
  Procurar_Acesso_Anterior;
  dDataAcesso := CtrlRegAcessoFunc.GetDataHora;

  if (CdsAcessoFunc.FieldByName('SAIDAINTERVALO').IsNull) then
  begin
    MsgDlg(fu.CMTranslate('Ação Incompatível: Marque primeiro a Saída para Intervalo !!'),
      fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  if (not CdsAcessoFunc.FieldByName('RETORNOINTERVALO').isNull) and
     ((iFlgAltera = 0) or (MsgDlg(FU.CMTranslate('Tem Certeza de que Deseja Alterar o Retorno do Intervalo ?'),
    FU.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) = mrNo)) then
    exit;
  CdsHorario.Locate('IDDIASEMANA', DayOfWeek(Date), []);
  CdsAcessoFunc.Edit;
  CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asDateTime := dDataAcesso;
  CdsAcessoFunc.Post;

  if not(CtrlRegAcessoFunc.GravarAcessoFunc) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text :=
      fu.CMTranslate('Ocorreu um erro ao tentar gravar o acesso.') +CR_LF+
      fu.CMTranslate('Erro:') +CR_LF+ CtrlRegAcessoFunc.MessageInfo;
    dmCds.CmErroDlg.Execute;
    exit;
  end;
   CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc2(dIdPessoa, 'P');
end;

function TfrmRegAcesso2.IncSecond(const AValue: TDateTime;
  const ANumberOfSeconds: Int64): TDateTime;
begin
  Result := ((AValue * SecsPerDay) + ANumberOfSeconds) / SecsPerDay;
end;

end.
