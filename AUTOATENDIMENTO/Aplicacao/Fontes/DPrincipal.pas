{
--------------------------------------------------------------------------------
Pendência   : SOL 150726 KINTANA 1099530
Responsável : BRUNO AZEVEDO
Data        : 15/06/2011
Descrição   : Criação do histórico de endereços.
--------------------------------------------------------------------------------
Pendência   : SOL 168419 Kintana 1494159
Responsável : Fanuel Junior
Data        : 28/11/2011
Descrição   : Erro ao acessar Conta
-------------------------------------------------------------------------
Pendência   : SOL 166624 Kintana 1452532
Responsável : Fanuel Junior
Data        : 21/10/2011
Descrição   : Mesmo colocando a senha correta, o sitema acusa como senha incorreta
-------------------------------------------------------------------------
Pendência   : SOL 163061 Kintana 1406488
Responsável : Fanuel Junior
Data        : 02/09/2011
Descrição   : Corrigido o erro em casos de login duplicado
-------------------------------------------------------------------------
Pendência   : SOL 111643 KINTANA 515405
Responsável : BRUNO AZEVEDO
Data        : 30/08/2010
Descrição   : Criação da possibilidade de receber ou não as publicações.
--------------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
}
unit DPrincipal;

interface

uses
  SysUtils, HTTPApp, ADODB, Db, Jpeg, extctrls, graphics, JCLStrings, uConstPaginasCampos,
  uCmFileUtils, DModAutoAtendimento, Classes, uCtrlPadroes, uCmTypes, uVersoes, JCLSysUtils,
  uCtrlFuncoesAA, 
  uWebDadosCadastrais, uWebTempoServico, uWebContribuicoes, uWebCadastroTempoServico, uWebReserva, uWebEventosPrev,
  uWebQuadroSalarial, uWebContraCheque, uWebHistBenef, uWebConsignacao, uWebManutEnderecos,
  uWebAlteracaoSenha, uWebManutDependentes, uWebEmpConsEmprestimos, uWebEmpSimulacaoInscricao,
  uWebTransfPlano, uWebBeneficio, uWebInformeRendimentos, uWebExtResPer, uWebNovoUsuario,
  uWebSitAtualBenef, uWebManutTelefones, XMLBrokr,
  uWebRelatorioDinamico;

type
  TwmdlAutoAtendimento = class(TWebModule)
    pgpResposta: TPageProducer;
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure pgpRespostaHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure wmdlAutoAtendimentoConectaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaTempoServicoAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaContribuicoesAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaDadosCadastraisAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaPartPatroAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaPartPlanosAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoTestaAplicacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoLogoutAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConfirmaLogoutAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaExtratoReservaAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaSaldoReservaAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoHomeAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaEventosPrevAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaDadosEventosPrevAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaQuadroSalarialAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoSobreAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaContraChequeAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaHistBenefAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoImagemAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaConsignacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaDadosConsigJudicialAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoAbrePaginaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoManutEnderecoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoAlteracaoEnderecoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoSalvaEnderecoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExclusaoEnderecoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExcluirEnderecoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoAlteracaoSenhaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoSalvarSenhaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoManutDependentesAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoAlteracaoDependenteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoSalvarDependenteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExclusaoDependenteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExcluirDependenteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpExtratoExpEmprestimosAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpParamConsultaContratoAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpConsultaContratoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpSelTpContratoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpDadosSimulacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoTransfPlanoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoCamposTransfPlanoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoOpcoesTransfPlanoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoOptarTransfPlanoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpSimulacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEstimaTransfPlanoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoCamposEstimaTransfPlanoAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoBenefSimulacaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpParamEmptmoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpSalvaEmptmo(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpExtratoAgrEmprestimosAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpConsultaInscricaoAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpParamConsultaInscricaoAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoImprimeRelatorioAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEmpExcluirInscricaoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoInformeRendimentosAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoBenefSimulaCamposAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoBenefSimulaResultadosAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExtResPerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoImpExtResPerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaEventosPrevAtivosAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoNovoUsuarioAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoCadSenhaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoLembreteSenhaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoManutTelefonesAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoAlteracaoTelefoneAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoSalvarTelefoneAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExcluirTelefoneAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExclusaoTelefoneAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaSitAtualBenefParAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaSitAtualBenefTabelaAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoConsultaSitAtualBenefDetalhesAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoCancelamentoDependenteAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoCancelarDependenteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoRestaurarDependenteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEnvioSenhaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoEsqueciMinhaSenhaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoRelatorioDinamicoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoTempoServicoConsultaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoAlteracaoTempoServicoAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoSalvarTempoServicoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoExclusaoTempoServicoAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoExcluirTempoServicoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoAlterarDadosCadastraisAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure wmdlAutoAtendimentoSalvarDadosCadastraisAction(
      Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wmdlAutoAtendimentoHistoricoEnderecosAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private

  public

  end;

var
  wmdlAutoAtendimento: TwmdlAutoAtendimento;

implementation

{$R *.DFM}


procedure TwmdlAutoAtendimento.WebModuleCreate(Sender: TObject);
begin
  inherited;

  try

    //Inicializa o Data Modulo
    dtmModAutoAtendimento := TdtmModAutoAtendimento.Create( nil );

    //Inicializa o Auto-Atendimento.
    Inicializa;

  except
    On E : Exception do
    begin
      CMDebugToFile( 'Erro ao inicializar aplicação: ' + E.Message, 'C:\AAErro.txt' );
    end;
  end;
end; {WebModuleCreate}



procedure TwmdlAutoAtendimento.WebModuleDestroy(Sender: TObject);
begin
  dtmModAutoAtendimento.Free;
  
  inherited;
end; {WebModuleDestroy}



procedure TwmdlAutoAtendimento.pgpRespostaHTMLTag(Sender: TObject;
  Tag: TTag; const TagString: String; TagParams: TStrings;
  var ReplaceText: String);
begin
  //Hidden Fields
  if TagString = 'hiddenfields'    then ReplaceText := HiddenFields;

  //Título da página
  if TagString = 'titulo'          then ReplaceText := sTitulo;

  //E-mail de contato
  if TagString = 'email'           then ReplaceText := sEMail;

  //IdPessoa
  if TagString = 'idpessoa'        then ReplaceText := IntToStr( iIdPessoa );

  //LoginPessoal
  if TagString = 'loginpessoal'    then ReplaceText := sLoginPessoal;

  //Nome completo do usuário conectado
  if TagString = 'nomeusuario'     then ReplaceText := sNomeUsuario;

  //Tipo de usuário
  if TagString = 'tipousuario'     then ReplaceText := sTipoUsuario;

  //Data e hora correntes
  if TagString = 'datahora'        then ReplaceText := FormatDateTime(
   'dd/MM/yyyy hh:nn', Now );

  //Sigla da Fundação
  if TagString = 'fundacao'        then ReplaceText := sFundacao;

  //Primeiro nome do usuário
  if TagString = 'prenome'         then ReplaceText := StrToName( Copy (
   sNomeUsuario, 1, Pos( ' ', sNomeUsuario ) - 1 ) );

  //JavaScript do menu dinâmico
  if TagString = 'javamenu'        then ReplaceText := sJavaMenu;

  //JavaScript do menu dinâmico
  if TagString = 'javalayers'      then ReplaceText := sJavaLayers;

  //JavaScript dos links dinâmicos
  if TagString = 'linkmenu'        then ReplaceText := sLinkMenu;

  //Menu dinâmico
  if TagString = 'menu'            then ReplaceText := sMenu;

  //Reservada para inclusão de código JavaScript específico para cada página
  if TagString = 'javascript'      then ReplaceText := sJavaScript;

  //Sessão
  if TagString = 'sessao'          then ReplaceText := sIdSessao;

  //Nome do arquivo da aplicação
  if TagString = 'nomearqapl'      then ReplaceText := sNomeArqApl;

  //Matrícula do participante
  if TagString = 'matricula'       then ReplaceText := sMatricula;

  //Matrícula do participante
  if TagString = 'inscricaonumero' then ReplaceText := sInscricaoNumero;

  //Quantidade de acessos
  if TagString = 'qtdeacessos'     then ReplaceText := IntToStr( iQtdeAcessos );

  //SeqAcesso
  if TagString = 'seqacesso'        then ReplaceText := IntToStr( iSeqAcesso );

  //Pendência 19090
  if TagString = 'IdWebReports'     then ReplaceText := IntToStr( iIdWebReports );

end; {pgpRespostaHTMLTag}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConectaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sSenhaBanco, sSenhaPagina : String;
  sLoginPessoalLocal, sLoginMasterLocal : string;
  sSenhaMasterLocal : string;
  iPos, iFlgStatus : integer;
  sFiltro, sTp, sAux : string;
begin
  try


    sLoginPessoalLocal := trim( Request.ContentFields.Values['vLoginPessoal'] );

    sLoginMasterLocal  := trim( Request.ContentFields.Values['vLoginMaster'] );

    sSenhaPagina       := trim( Request.ContentFields.Values['vSenha'] );

    //Se a senha não é case-sensitive...
    if not bSenhaCase then
      sSenhaPagina := UpperCase( sSenhaPagina );

    //Verifica se existe login master cadastrado para o sistema
    if sLoginMaster <> '' then
    begin

      //Se a senha é criptografada
      if bSenhaCripto then
        sSenhaMasterLocal := trim( CMCrypto.CMDecryptStr( StrPadRight( trim( sSenhaMaster ), 20, ' ' ),
         '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

      //Se a senha não é case-sensitive...
      if not bSenhaCase then
        sSenhaMasterLocal := UpperCase( sSenhaMasterLocal );

      //Se não há nenhum login master passado pela página...
      if sLoginMasterLocal = '' then
      begin

        //Se o login passado como login pessoal é o login master...
        if sLoginPessoalLocal = sLoginMaster then
        begin

          //Testa senha master
          if trim( sSenhaMasterLocal ) <> trim( sSenhaPagina ) then
            raise Exception.Create( 'Senha incorreta.');

          //Abre a página para seleção de usuário
          pgpResposta.HTMLDoc.Text := StrSubst( LeHTML( 'loginmaster.htm' ),
           '#loginmaster', sLoginMaster );

          Response.Content := pgpResposta.Content;

          exit;

        end; //if sLoginLocal = sLoginMaster then

      end
      else
      begin

        //Verifica validade do login master
        if sLoginMasterLocal <> sLoginMaster then
          raise Exception.Create( 'Login master inválido.');

        //Testa senha master
        if trim( sSenhaMasterLocal ) <> trim( sSenhaPagina ) then
          raise Exception.Create( 'Senha master incorreta.');

        sLoginPessoal := sLoginPessoalLocal;

        //Recupera os dados da pessoa física
        if not SelecionaAA( sSenhaBanco, iFlgStatus ) then
          raise Exception.Create( 'Login não encontrado.');

        sSenhaPagina := sSenhaBanco;

        if bSenhaCripto then
          sSenhaPagina := trim( CMCrypto.CMDecryptStr( StrPadRight( trim( sSenhaPagina ), 20, ' ' ),
           '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

      end; //if sLoginMasterLocal = '' then

    end; //if sLoginMaster <> '' then

    sLoginPessoal := sLoginPessoalLocal;

    //Recupera os dados da pessoa física
    if not SelecionaAA( sSenhaBanco, iFlgStatus ) then
      raise Exception.Create( 'Login não encontrado.');

    //Fanuel Junior SOL166624 Kintana1452532
    if dtmModAutoAtendimento.cdsLoginPessoal.RecordCount > 1 then
    begin
       Response.Content := StrSubst( LeHTML( 'erro.htm' ), '<#msgerro>', ' Erro no código de acesso <BR> '+
                                                                         ' Gentileza entrar em contato com a FUNCEF 0800 7069000 ' );
       exit;
    end;


    //Se o acesso estiver bloqueado, não permite o acesso.
    if iFlgStatus = 1 then
      raise Exception.Create( 'Acesso bloqueado.<BR>Entre em contato com a Fundação para efetuar o desbloqueio.');

    if bSenhaCripto then
      sSenhaBanco := trim( CMCrypto.CMDecryptStr( StrPadRight( trim( sSenhaBanco ), 20, ' ' ),
       '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

    //Se a senha não é case-sensitive ou o login é o master
    if ( not bSenhaCase ) or ( sLoginMasterLocal <> '' ) then
    begin
      sSenhaBanco  := UpperCase( sSenhaBanco  );
      sSenhaPagina := UpperCase( sSenhaPagina );
    end;

    if trim( sSenhaBanco ) <> trim( sSenhaPagina ) then
    begin
      //Altera a quantidade de acessos. Se a função retronar TRUE, a senha foi bloqueada
      if not WebAcesso.AlteraQtdeAcessos( iIdPessoa, 1, iNumSenhaBlq ) then
        raise Exception.Create( 'Senha incorreta.')
      else
        raise Exception.Create( 'Senha incorreta.<BR>' +
        'O seu acesso foi bloqueado por ter sido excedida a quantidade de tentativas permitida.<BR>' +
        'Entre em contato com a Fundação para efetuar o desbloqueio.');
    end;

    //Se acessou, zera a quantidade de erros.
    WebAcesso.AlteraQtdeAcessos( iIdPessoa, 0, iNumSenhaBlq );

    //Cria uma nova sessão.
    sIdSessao := CriaSessao( sLoginPessoal );

    //Registra o acesso.
    iSeqAcesso := WebHstAcesso.InsereWebHstAcesso( iIdPessoa, iIdWebInterface );

    //Quantidade de acessos
    iQtdeAcessos := WebHstAcesso.QtdeAcessosPorUsuario( iIdPessoa );

    if sMsgCtrl <> '' then
      raise Exception.Create( sMsgCtrl );

    //Executa o comando pós-conexão
    if trim( sComandoConexao ) <> '' then
    begin
      sAux := sComandoConexao;
      sAux := StringReplace( sAux, '[', '''', [rfReplaceAll] );
      sAux := StringReplace( sAux, ']', '''', [rfReplaceAll] );
      sAux := StringReplace( sAux, ':IDPESSOA', IntToStr( iIdPessoa ), [rfReplaceAll] );
      sAux := StringReplace( sAux, ':SEQACESSO', IntToStr( iSeqAcesso ), [rfReplaceAll] );
      WebHstAcesso.ExecSQL( sAux );
    end;

    CarregaPaginasCampos;

    MontaAcessoForms;
    if bFlgUsaMenu   then MontaAcessoMenu;
    if bFlgUsaLayers then MontaAcessoLayers;

    //Se não tiver acesso a página nenhuma, interrompe a conexão
    try
      sFiltro := '';
      sTp := sTipoUsuario;
      while sTp <> '' do
      begin
        iPos := Pos( ',', sTp );
        if iPos = 0 then
        begin
          sAux := sTp;
          sTp  := '';
        end
        else
        begin
          sAux := StrLeft( sTp, iPos - 1 );
          sTp  := StrRight( sTp, length( sTp ) - iPos );
        end;

        if sFiltro <> '' then sFiltro := sFiltro + ' or ';
        sFiltro := sFiltro + '( IDTIPOUSUARIO = ' + sAux + ' )';
      end;

      sFiltro := '(' + sFiltro + ')';

      if sFiltro <> '' then sFiltro := sFiltro + ' and ';
      sFiltro := sFiltro + '( ( FLGDISPONIVEL = ''S'' ) and ( FLGSEMPREHAB <> ''S'' ) )';
      
      dtmModAutoAtendimento.cdsWebPagina.Filter   := sFiltro;
      dtmModAutoAtendimento.cdsWebPagina.Filtered := True;

      //Fanuel Junior SOL163061 Kintana1406488
      {cmdebugtofile(IntToStr(dtmModAutoAtendimento.cdsLoginPessoal.RecordCount), 'C:\planus\temp\antonio.txt');
      if dtmModAutoAtendimento.cdsLoginPessoal.RecordCount > 1 then
      begin
        Response.Content := StrSubst( LeHTML( 'erro.htm' ), '<#msgerro>', ' Erro no código de acesso <BR> '+
                                                                          ' Gentileza entrar em contato com a FUNCEF 0800 7069000 ' );
        exit;
      end;
      }

      if dtmModAutoAtendimento.cdsWebPagina.IsEmpty then
      begin
        Response.Content := StrSubst( LeHTML( 'erro.htm' ), '<#msgerro>', 'Usuário não possui acesso a esta interface.' );
        exit;
      end;

      //Pendência 18467 - 30/10/2007
      if not TemAcessoPagina( sTipoUsuario, pHome, sAux ) then
      begin
        cmdebugtofile('teste 2', 'C:\planus\temp\antonio.txt');
        Response.Content := StrSubst( LeHTML( 'erro.htm' ), '<#msgerro>', 'Usuário não possui acesso a esta interface.' );
        exit;
      end;
      //Fim Pendência 18467

    finally
      dtmModAutoAtendimento.cdsWebPagina.Filtered := False;
      dtmModAutoAtendimento.cdsWebPagina.Filter   := '';
    end;

    //Se é obrigado a mudar de senha, abre a página de alteração de senha
    if iFlgStatus = 2 then
    begin
      sTitulo := 'Alteração de Senha';
      pgpResposta.HTMLDoc.Text := StrSubst( LeHTML( 'obriganovasenha.htm' ), '<#hiddenfields>', HiddenFields );
    end
    else
    begin //Se não, abre a janela de home normalmente
      sTitulo := TituloPagina( pHome );
      pgpResposta.HTMLDoc.Text := MontaPagina( pHome, LeHTML( 'home.htm' ) );
    end;

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  LimpaVariaveis;
end; {wmdlAutoAtendimentoConectaAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaTempoServicoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTempoDeServico ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaTempoServico( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaTempoServicoAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaDadosCadastraisAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDadosDoParticipante ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaDadosParticipante( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaDadosCadastraisAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaPartPatroAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pParticipanteNaPatrocinadora ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaDadosPartPatro( iIdPessoa, sMatricula );//Fanuel Junior SOL168419 Kintana1494159
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaPartPatroAction}



procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaPartPlanosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pParticipanteNosPlanos ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaDadosPartPlanos( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaPartPatroAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoTestaAplicacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Response.Content := FormatDateTime( 'dd/mm/yy hh:nn:ss', Now ) +
   '<BR><H2>A aplicação está sendo executada pelo servidor web.</H2>' ;
end; {wmdlAutoAtendimentoTestaAplicacaoAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoLogoutAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    CarregaHidden( Request );

    DestroiSessao( sIdSessao );

    pgpResposta.HTMLDoc.Text :=
     '<html>                                                                  ' + CR +
     '  <head>                                                                ' + CR +
     '    <script>                                                            ' + CR +
     '      function otherload() { top.location = "'+ sEndLogin + '"; }       ' + CR +
     '    </script>                                                           ' + CR +
     '  </head>                                                               ' + CR +
     '  <body onload="setTimeout(''otherload()'',1)">                         ' + CR +
     '    <font face="Arial" size="2">                                        ' + CR +
     '      Obrigado por utilizar o <b><i>Auto-Atendimento</i></b>.           ' + CR +
     '      <BR>                                                              ' + CR +
     '      Caso a tela de login não abra automaticamente,                    ' + CR +
     '      <a href="'+ sEndLogin + '">clique aqui</a>.                       ' + CR +
     '    </font>                                                             ' + CR +
     '  </body>                                                               ' + CR +
     '</html>                                                                 ' ;
     
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  LimpaVariaveis;
end; {wmdlAutoAtendimentoLogoutAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConfirmaLogoutAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin         
  try

    if IniciaAcao( Request, pLogout ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    sTitulo := TituloPagina( pLogout );

    pgpResposta.HTMLDoc.Text := MontaPagina( pLogout, '' );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConfirmaLogoutAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaExtratoReservaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pExtratoDeReserva ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

//Pendência 22997 - 18/08/2006
    pgpResposta.HTMLDoc.Text := PaginaExtratoReserva( Request.ContentFields.Values['cmbAno'], Request.ContentFields.Values['cmbReserva'], iIdPessoa );
//Fim Pendência 22997

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaExtratoReservaAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaSaldoReservaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pSaldoDeReserva ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSaldoReserva( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaSaldoReservaAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoHomeAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pHome ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    sTitulo := TituloPagina( pHome );

    pgpResposta.HTMLDoc.Text := MontaPagina( pHome, LeHTML( 'home.htm' ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoHomeAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaEventosPrevAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEventosPrevidenciarios ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEventosPrev( iIdPessoa, True );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaEventosPrevAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaDadosEventosPrevAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDadosEventosPrevidenciarios ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaDadosEventosPrev( StrToInt( Request.ContentFields.Values['vIdEventoPrev'] ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaDadosEventosPrevAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaQuadroSalarialAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pQuadroSalarial ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaQuadroSalarial( Request.ContentFields.Values['cmbAno'], iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaQuadroSalarialAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSobreAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  i, iNumOcorr : integer;
  sConexao, sAux,
  sVersao       : String;
begin

  if cntConexao = cntADO then
    sConexao := 'ADO'
  else
    sConexao := 'BDE';

  with dtmModAutoAtendimento do
  begin
    cdsBpl.Close;
    cdsBpl.CreateDataset;

    CMResourceManager.ExeName := sPath + sNomeArqApl;
    CMResourceManager.ObterVersao;
    sVersao := CMResourceManager.Versao;

    iNumOcorr := CMResourceManager.RetornaBplsAssociadas;

    for i:= 0 to iNumOcorr-1 do begin
      cdsBpl.Insert;
      cdsBpl.FieldByName('BPL').AsString       := CMResourceManager.BplsAssociadas(i).BPL;
      cdsBpl.FieldByName('CAMINHO').AsString   := CMResourceManager.BplsAssociadas(i).Caminho;
      cdsBpl.FieldByName('DATA').AsDateTime    := CMResourceManager.BplsAssociadas(i).Data;
      cdsBpl.FieldByName('DESCRICAO').AsString := CMResourceManager.BplsAssociadas(i).Descricao;
      cdsBpl.FieldByName('VERSAO').AsString    := CMResourceManager.BplsAssociadas(i).Versao;
      cdsBpl.Post;
    end;
    cdsBpl.First;


    sAux :=
     '<html>                                                                      ' + CR +
     '  <head> <title>Auto-Atendimento [Sobre...] </title> </head>                ' + CR +
     '  </body>                                                                   ' + CR +
     '    <font face="Arial" size="20" color="darkred"> <b> <i>                   ' + CR +
     '      Auto-Atendimento                                                      ' + CR +
     '    </font> </i> </b>                                                       ' + CR +
     '    <hr>                                                                    ' + CR +
     '    <font face="Verdana" size="2" color="black">                            ' + CR +
     '      <b>                                                                   ' + CR +
     '        Versão&nbsp;&nbsp;' + sVersao                                         + CR +
     '      </b>                                                                  ' + CR +
     '      <br><br><br>                                                          ' + CR +
     '      Direitos reservados a:                                                ' + CR +
     '      <br>                                                                  ' + CR +
     '      <b>CM Soluções Informática Ltda.</b>                                  ' + CR +
     '      <br>                                                                  ' + CR +
     '      Rua Campos Sales, 55 - Tijuca - Rio de Janeiro                        ' + CR +
     '      <br>                                                                  ' + CR +
     '      Telefone: (021) 2568-7159   Fax: (021) 2284-0882                      ' + CR +
     '      <br>                                                                  ' + CR +
     '      <a href="http://www.cmsolucoes.com.br">www.cmsolucoes.com.br</a>      ' + CR +
     '      <br><br><br>                                                          ' + CR +
     '      Base: ' + sBase                                                         + CR +
     '      <br>                                                                  ' + CR +
     '      Id. da Interface: ' + IntToStr( iIdWebInterface )                       + CR +
     '      <br>                                                                  ' + CR +
     '      Tecnologia de acesso: ' + sConexao                                      + CR +
     '      <br>                                                                  ' + CR +
     '      Hora Atual: '+ FormatDateTime( 'dd/mm/yyyy hh:nn:ss', Now )             + CR +
     '      <br><br><br>                                                          ' + CR +
     '      Bilbliotecas:                                                         ' + CR +
     '      <table border="0" width="750" cellspacing="0" cellpadding="0" >       ' + CR +
     '        <tr>                                                                ' + CR +
     '          <td width="3"> </td>                                              ' + CR +
     '          <td width="210" bgcolor="silver"                                  ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              BPL                                                           ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="75" bgcolor="silver"                                   ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Versão                                                        ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="82" bgcolor="silver"                                   ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Modificado                                                    ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="190" bgcolor="silver"                                  ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Pasta                                                         ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '          <td width="190" bgcolor="silver"                                  ' + CR +
     '              style="border-right-style: solid; border-right-color: white"> ' + CR +
     '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
     '              Descrição                                                     ' + CR +
     '            </font>                                                         ' + CR +
     '          </td>                                                             ' + CR +
     '        </tr>                                                               ' + CR ;

    while not cdsBpl.Eof do
    begin
      sAux := sAux +
        '        <tr>                                                            ' + CR +
        '          <td> </td>                                                    ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        cdsBpl.FieldByName('BPL').AsString                                         + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        cdsBpl.FieldByName('VERSAO').AsString                                      + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        FormatDateTime( 'dd/mm/yyyy', cdsBpl.FieldByName('DATA').AsDateTime )      + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        Copy( cdsBpl.FieldByName('CAMINHO').AsString, 1, 22 ) + '...'                 + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '          <td>                                                          ' + CR +
        '            <font face="Courier New" style="font-size: 11px" color="black"> ' + CR +
        Copy( cdsBpl.FieldByName('DESCRICAO').AsString, 1, 22 ) + '...'               + CR +
        '            </font>                                                     ' + CR +
        '          </td>                                                         ' + CR +
        '        </tr>                                                           ' + CR ;
      cdsBpl.Next;
    end;

    sAux := sAux +
     '      </table border="0" width="100%" cellspacing="0" cellpadding="0" >     ' + CR +
     '    </font>                                                                 ' + CR +
     '  </body>                                                                   ' + CR +
     '</html>                                                                     ' ;

  end;

  Response.Content := sAux;
end; {wmdlAutoAtendimentoSobreAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaContraChequeAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pContraCheque ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaDoContraCheque( StrToIntDef(
     Request.ContentFields.Values['cmbIdHstFolhaBenef'], 0 ), iIdPessoa,
     StrToIntDef( Request.ContentFields.Values['edtFlgFiltro'], 0 ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaContraChequeAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaHistBenefAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pHistoricoDeBeneficios ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaHistBenef( Request.ContentFields.Values['cmbAno'], iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaHistBenefAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoImagemAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  Jpg: TJpegImage;
  Img : TPicture;
  S: TMemoryStream;
begin
  try

    Jpg := TJpegImage.Create;
    Img := TPicture.Create;
    S := TMemoryStream.Create;
    try
      cdsAux.Close;
      cdsAux.Data := WebImagem.SelecionaImagem(
       StrToInt( Request.QueryFields.Values['idimagem'] ) );

      Img.Assign( cdsAux.FieldByName('IMAGEM') );
      Jpg.Assign( Img.Graphic );

      Jpg.SaveToStream( S );
      S.Position := 0;
      Response.ContentType := 'image/jpeg';
      Response.ContentStream := S;
      Response.SendResponse;

    finally
      Jpg.Free;
      Img.Free;
      cdsAux.Close;
      S.Free;
    end;

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  LimpaVariaveis;
end; {wmdlAutoAtendimentoImagemAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaConsignacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pConsignacaoJudicial ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaConsignacao( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaConsignacaoAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaDadosConsigJudicialAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDadosConsignacaoJudicial ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaDadosConsigJudicial(
     Request.ContentFields.Values['cmbAno'],
     StrToInt( Request.ContentFields.Values['vIdFavorecido'] ), iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaDadosConsigJudicialAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAbrePaginaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, 0 ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := MontaPagina( 0, LeTXT( Request.ContentFields.Values['vPagina'] ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoAbrePaginaAction}


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoManutEnderecoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pManutEnderecos ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaManutEnderecos( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoManutEnderecoAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAlteracaoEnderecoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try

    if StrToIntDef( Request.ContentFields.Values['edtIdEndereco'], 0 ) = 0 then
      iIdPagina := pEndInclusao
    else
      iIdPagina := pEndAlteracao;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaAlteracaoEndereco( iIdPessoa,
     StrToIntDef( Request.ContentFields.Values['edtIdEndereco'], 0 ) );
     
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSalvaEnderecoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try

    if StrToIntDef( Request.ContentFields.Values['edtIdEndereco'], 0 ) = 0 then
      iIdPagina := pEndConfInclusao
    else
      iIdPagina := pEndConfAlteracao;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSalvarEndereco( iIdPessoa, Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExclusaoEnderecoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEndExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaExclusaoEndereco( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdEndereco'] ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExcluirEnderecoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEndConfExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaExcluirEndereco( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdEndereco'] ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAlteracaoSenhaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pAlteraSenha ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaAlteracaoSenha( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSalvarSenhaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pConfSenha ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSalvarSenha( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoManutDependentesAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pManutDependentes ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaManutDependentes( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAlteracaoDependenteAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try

    if StrToIntDef( Request.ContentFields.Values['edtIdDependente'], 0 ) = 0 then
      iIdPagina := pDepInclusao
    else
      iIdPagina := pDepAlteracao;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaAlteracaoDependente( iIdPessoa,
     StrToIntDef( Request.ContentFields.Values['edtIdDependente'], 0 ),
     ( StrToIntDef( Request.ContentFields.Values['edtIgnoraCancelamento'], 0 ) = 1 ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSalvarDependenteAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try

    if StrToIntDef( Request.ContentFields.Values['edtIdDependente'], 0 ) = 0 then
      iIdPagina := pDepConfInclusao
    else
      iIdPagina := pDepConfAlteracao;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSalvarDependente( iIdPessoa, Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExclusaoDependenteAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDepExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaExclusaoDependente( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdDependente'] ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExcluirDependenteAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDepConfExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaExcluirDependente( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdDependente'] ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpExtratoExpEmprestimosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sAux : string;
  bSelecionado : boolean;

  sIdContratoEmptmo  : string;
  fIdContratoEmptmo  : extended;
  sSomenteAbertos: String;
begin
  try

    CarregaHidden( Request );
    CarregaPaginasCampos;

    bSelecionado := ( Request.ContentFields.Values['edtFlgFiltro'] = '1' );

    if not bSelecionado then
    begin
      if TemAcessoPagina( sTipoUsuario, pEmpParExtratoEmptmo, sAux ) then
      begin

        if IniciaAcao( Request, pEmpParExtratoEmptmo ) then
        begin
          Response.Content := LeHTML( 'expira.htm' );
          exit;
        end;

        pgpResposta.HTMLDoc.Text := PaginaParamExtratoEmptmo( 1 );

      end
      else
      begin

        if IniciaAcao( Request, pEmpExtratoExpEmprestimos ) then
        begin
          Response.Content := LeHTML( 'expira.htm' );
          exit;
        end;

        pgpResposta.HTMLDoc.Text := PaginaEmpExtratoExpEmprestimos( iIdPessoa, iIdTitular, 0,
         iff( bFlgExtEmptmoAtv, 'A', '' ), 0, 0, 'S', '' ); //BRUNO AZEVEDO

      end;
    end
    else
    begin

      if IniciaAcao( Request, pEmpExtratoExpEmprestimos ) then
      begin
        Response.Content := LeHTML( 'expira.htm' );
        exit;
      end;

      sIdContratoEmptmo := trim( Request.ContentFields.Values['edtIdContratoEmptmo'] );
      if sIdContratoEmptmo <> '' then
        fIdContratoEmptmo := StrToFloat( sIdContratoEmptmo )
      else
        fIdContratoEmptmo := 0;

        //BRUNO AZEVEDO
        sSomenteAbertos := 'S';
        if (trim(Request.ContentFields.Values['bSomenteAbertos']) <> '') then begin
          sSomenteAbertos := Request.ContentFields.Values['bSomenteAbertos'];
        end;
        //BRUNO AZEVEDO

      pgpResposta.HTMLDoc.Text := PaginaEmpExtratoExpEmprestimos( iIdPessoa, iIdTitular,
        fIdContratoEmptmo,
        Request.ContentFields.Values['cmbFlgSituacao'],
        StrToIntDef( Request.ContentFields.Values['cmbIdTipoEmptmo'], 0 ),
        StrToIntDef( Request.ContentFields.Values['cmbIdTipoContrEmptmo'], 0 ),
        sSomenteAbertos,    //BRUNO AZEVEDO
        trim(Request.ContentFields.Values['Contrato']) );

    end;

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;

end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpParamConsultaContratoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sAux : string;
begin
  try

    CarregaHidden( Request );
    CarregaPaginasCampos;

    if TemAcessoPagina( sTipoUsuario, pEmpParConsContrato, sAux ) then
    begin

      if IniciaAcao( Request, pEmpParConsContrato ) then
      begin
        Response.Content := LeHTML( 'expira.htm' );
        exit;
      end;

      pgpResposta.HTMLDoc.Text := PaginaParamConsultaContrato(iIdPessoa, iIdTitular);

    end
    else
    begin

      if IniciaAcao( Request, pEmpDadosContrato ) then
      begin
        Response.Content := LeHTML( 'expira.htm' );
        exit;
      end;

      pgpResposta.HTMLDoc.Text := PaginaConsultaContrato( iIdPessoa, 0, '', 0, 0, '' );

    end;

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpConsultaContratoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sIdContratoEmptmo : string;
  fIdContratoEmptmo : extended;
begin
  try
    if IniciaAcao( Request, pEmpDadosContrato ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    sIdContratoEmptmo := trim( Request.ContentFields.Values['edtIdContratoEmptmo'] );
    if sIdContratoEmptmo <> '' then
      fIdContratoEmptmo := StrToFloat( sIdContratoEmptmo )
    else
      fIdContratoEmptmo := 0;

    pgpResposta.HTMLDoc.Text := PaginaConsultaContrato( iIdPessoa,
     fIdContratoEmptmo,
     trim( Request.ContentFields.Values['cmbFlgSituacao'] ),
     StrToIntDef( trim( Request.ContentFields.Values['cmbIdTipoEmptmo'] ), 0 ),
     StrToIntDef( trim( Request.ContentFields.Values['cmbIdTipoContrEmptmo'] ), 0 ),
     Request.ContentFields.Values['edtDataQuitacao'] );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpSelTpContratoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEmpSelecaoTpContrato ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEmpSelTpContrato( iIdPessoa );
    
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpDadosSimulacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEmpParamSimulacao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEmpParamSimulacao( iIdPessoa, Request );
    
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoTransfPlanoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTpOpcaoSelecionada ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaTransfPlano( iIdPessoa );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoCamposTransfPlanoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTpDadosOpcoesTransacao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaCamposTransfPlano( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoOpcoesTransfPlanoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTpOpcoesTransacao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaOpcoesTransfPlano( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoOptarTransfPlanoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTransfPlano ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaOptarTransfPlano( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpSimulacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEmpParcelas ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEmpSimulacao( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEstimaTransfPlanoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTpEstimativasTransacao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEstimaTransfPlano( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoCamposEstimaTransfPlanoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTpDadosEstimativas ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaCamposEstimaTransfPlano( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoBenefSimulacaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pBenefSelecao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaBenefSelecao( iIdPessoa );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpParamEmptmoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEmpParamEmptmo ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEmpParamEmptmo( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpSalvaEmptmo(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iTipoGravacao : integer;
  iPagina : integer;
begin
  try
    iTipoGravacao := StrToInt( Request.ContentFields.Values['empTipoGravacao'] );

    if iTipoGravacao = 1 then
      iPagina := pEmpInscricao
    else
      iPagina := pEmpContratacao;

    if IniciaAcao( Request, iPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEmpSalvaEmptmo( iIdPessoa, iTipoGravacao, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;


procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpExtratoAgrEmprestimosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sAux : string;
  bSelecionado : boolean;

  sIdContratoEmptmo  : string;
  fIdContratoEmptmo  : extended;
  sSomenteAbertos: String;
begin
  try

    CarregaHidden( Request );
    CarregaPaginasCampos;

    bSelecionado := ( Request.ContentFields.Values['edtFlgFiltro'] = '1' );

    if not bSelecionado then
    begin
      if TemAcessoPagina( sTipoUsuario, pEmpParExtratoEmptmo, sAux ) then
      begin

        if IniciaAcao( Request, pEmpParExtratoEmptmo ) then
        begin
          Response.Content := LeHTML( 'expira.htm' );
          exit;
        end;

        pgpResposta.HTMLDoc.Text := PaginaParamExtratoEmptmo( 0 );

      end
      else
      begin

        if IniciaAcao( Request, pEmpExtratoAgrEmprestimos ) then
        begin
          Response.Content := LeHTML( 'expira.htm' );
          exit;
        end;

        pgpResposta.HTMLDoc.Text := PaginaEmpExtratoAgrEmprestimos( iIdPessoa, iIdTitular, 0,
         iff( bFlgExtEmptmoAtv, 'A', '' ), 0, 0, 'S', '' );   //BRUNO AZEVEDO

      end;

    end
    else
    begin

      if IniciaAcao( Request, pEmpExtratoAgrEmprestimos ) then
      begin
        Response.Content := LeHTML( 'expira.htm' );
        exit;
      end;

      sIdContratoEmptmo := trim( Request.ContentFields.Values['edtIdContratoEmptmo'] );
      if sIdContratoEmptmo <> '' then
        fIdContratoEmptmo := StrToFloat( sIdContratoEmptmo )
      else
        fIdContratoEmptmo := 0;

        //BRUNO AZEVEDO
        sSomenteAbertos := 'S';
        if (trim(Request.ContentFields.Values['bSomenteAbertos']) <> '') then begin
          sSomenteAbertos := Request.ContentFields.Values['bSomenteAbertos'];
        end;
        //BRUNO AZEVEDO
        
      pgpResposta.HTMLDoc.Text := PaginaEmpExtratoAgrEmprestimos( iIdPessoa, iIdTitular,
        fIdContratoEmptmo,
        Request.ContentFields.Values['cmbFlgSituacao'],
        StrToIntDef( Request.ContentFields.Values['cmbIdTipoEmptmo'], 0 ),
        StrToIntDef( Request.ContentFields.Values['cmbIdTipoContrEmptmo'], 0 ),
        sSomenteAbertos,    //BRUNO AZEVEDO
        trim(Request.ContentFields.Values['Contrato']) );  //BRUNO AZEVEDO

    end;
    
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;

end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpConsultaInscricaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sIdInscricaoEmptmo : string;
  fIdInscricaoEmptmo : extended;
begin
  try

    if IniciaAcao( Request, pEmpDadosInscricao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    sIdInscricaoEmptmo := trim( Request.ContentFields.Values['edtIdInscricaoEmptmo'] );
    if sIdInscricaoEmptmo <> '' then
      fIdInscricaoEmptmo := StrToFloat( sIdInscricaoEmptmo )
    else
      fIdInscricaoEmptmo := 0;

    pgpResposta.HTMLDoc.Text := PaginaConsultaInscricao( iIdPessoa, iIdTitular,
     fIdInscricaoEmptmo,
     trim( Request.ContentFields.Values['cmbFlgSituacao'] ),
     StrToIntDef( trim( Request.ContentFields.Values['cmbIdTipoEmptmo'] ), 0 ),
     StrToIntDef( trim( Request.ContentFields.Values['cmbIdTipoContrEmptmo'] ), 0 ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;

end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpParamConsultaInscricaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  sAux : string;
begin
  try

    CarregaHidden( Request );
    CarregaPaginasCampos;

    if TemAcessoPagina( sTipoUsuario, pEmpParConsInscricao, sAux ) then
    begin

      if IniciaAcao( Request, pEmpParConsInscricao ) then
      begin
        Response.Content := LeHTML( 'expira.htm' );
        exit;
      end;

      pgpResposta.HTMLDoc.Text := PaginaParamConsultaInscricao;

    end
    else
    begin

      if IniciaAcao( Request, pEmpDadosInscricao ) then
      begin
        Response.Content := LeHTML( 'expira.htm' );
        exit;
      end;

      pgpResposta.HTMLDoc.Text := PaginaConsultaInscricao( iIdPessoa, iIdTitular, 0, '', 0, 0 );

    end;

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoImprimeRelatorioAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    CarregaHidden( Request );

    Response.Content := ImprimeRelatorio( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEmpExcluirInscricaoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEmpExclusaoInscricao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaConfirmaExclInscricao( 
     StrToIntDef( trim( Request.ContentFields.Values['edtIdInscricaoEmptmo'] ), 0 ),
     StrToIntDef( trim( Request.ContentFields.Values['edtFlgExclui'] ), 0 ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoInformeRendimentosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pInformeRendimentos ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaInformeRendimentos( iIdPessoa,
     StrToIntDef( Request.ContentFields.Values['edtFlgFiltro'], 0 ),
     StrToIntDef( Request.ContentFields.Values['cmbAno'], 0 ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoBenefSimulaCamposAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pBenefCampos ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaBenefSimulaCampos( iIdPessoa,
     StrToInt( Request.ContentFields.Values['cmbIdSimulaBenef'] ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoBenefSimulaCamposAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoBenefSimulaResultadosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin

  try

    if IniciaAcao( Request, pBenefResultados ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaBenefSimulaResultados( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;

end; {wmdlAutoAtendimentoBenefSimulaResultadosAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExtResPerAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin

  try

    if IniciaAcao( Request, pExtResPer ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaExtResPer( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;

end; {wmdlAutoAtendimentoExtResPerAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoImpExtResPerAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin

  try

    if IniciaAcao( Request, pExtResPer ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaImpExtResPer( iIdPessoa, Request );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;

end; {wmdlAutoAtendimentoImpExtResPerAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaEventosPrevAtivosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pEventosPrevidenciarios ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaEventosPrev( iIdPessoa, False );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaEventosPrevAtivosAction}

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoNovoUsuarioAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try
    pgpResposta.HTMLDoc.Text := PaginaValidaNovoUsuario( Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;
  Response.Content := pgpResposta.Content;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoCadSenhaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try
    pgpResposta.HTMLDoc.Text := PaginaCadastraSenha( Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;
  Response.Content := pgpResposta.Content;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoLembreteSenhaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try
    pgpResposta.HTMLDoc.Text := PaginaLembreteSenha( Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;
  Response.Content := pgpResposta.Content;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoManutTelefonesAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pManutEnderecos ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaManutTelefones( iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAlteracaoTelefoneAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try

    if StrToIntDef( Request.ContentFields.Values['edtIdTelefone'], 0 ) = 0 then
      iIdPagina := pTelInclusao
    else
      iIdPagina := pTelAlteracao;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaAlteracaoTelefone( iIdPessoa,
     StrToIntDef( Request.ContentFields.Values['edtIdTelefone'], 0 ) );
     
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSalvarTelefoneAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;  
begin
  try

    if StrToIntDef( Request.ContentFields.Values['edtIdTelefone'], 0 ) = 0 then
      iIdPagina := pTelConfInclusao
    else
      iIdPagina := pTelConfAlteracao;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSalvarTelefone( iIdPessoa, Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExcluirTelefoneAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTelConfExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaExcluirTelefone( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdTelefone'] ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExclusaoTelefoneAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTelExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaExclusaoTelefone( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdTelefone'] ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaSitAtualBenefParAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pSitAtualBenefPar ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSitAtualBenefPar( iIdPessoa );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaSitAtualBenefTabelaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pSitAtualBenef ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSitAtualBenefTabela( iIdPessoa,
     StrToIntDef( Request.ContentFields.Values['cmbIdBeneficio'], 0 ),
     StrToIntDef( Request.ContentFields.Values['cmbIdSitBeneficio'], 0 ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaSitAtualBenefDetalhesAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pSitAtualBenef ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaSitAtualBenefDetalhes(
     StrToIntDef( Request.ContentFields.Values['vIdBeneficio']    , 0 ),
     StrToIntDef( Request.ContentFields.Values['vNumeroProcesso'] , 0 ),
     StrToIntDef( Request.ContentFields.Values['vIdPlanoPrev']    , 0 ),
     StrToIntDef( Request.ContentFields.Values['vIdTitular']      , 0 ),
     StrToIntDef( Request.ContentFields.Values['vIdPessJur']      , 0 ),
     StrToIntDef( Request.ContentFields.Values['vIdPessoa']       , 0 ),
     StrToIntDef( Request.ContentFields.Values['vSeqProposta']    , 0 ),
     StrToIntDef( Request.ContentFields.Values['vIdPlanoOrigem']  , 0 ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoCancelamentoDependenteAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDepCancelamento ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaCancelamentoDependente( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdDependente'] ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoCancelarDependenteAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDepConfCancelamento ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaCancelarDependente( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdDependente'] ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoRestaurarDependenteAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pDepConfCancelamento ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaRestauraDependente( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdDependente'] ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

//Pendência 23402 - 28/02/2007 - Padrão 14
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEnvioSenhaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try
    pgpResposta.HTMLDoc.Text := PaginaEnvioSenha( Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;
  Response.Content := pgpResposta.Content;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoEsqueciMinhaSenhaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try
    if (sFlgEnvioSenha = 'E') then
       pgpResposta.HTMLDoc.Text := LeHTML( 'esquecisenhaenvio.htm' )
    else
       pgpResposta.HTMLDoc.Text := LeHTML( 'esquecisenha.htm' );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;
  Response.Content := pgpResposta.Content;
end;
//Fim Pendência 23402

//Pendência 19090
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoRelatorioDinamicoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, 0 ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    iIdWebReports := StrToInt( Request.ContentFields.Values['vIdReports'] );

    pgpResposta.HTMLDoc.Text := PaginaRelatorioDinamico( iIdWebReports, Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;
//Fim Pendência 19090

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoConsultaContribuicoesAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pHistoricoDeContribuicoes ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := PaginaContribuicoes( Request.ContentFields.Values['cmbAno'], iIdPessoa );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end; {wmdlAutoAtendimentoConsultaContribuicoesAction}

//BRUNO AZEVEDO SOL 124251 KINTANA 651677
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoTempoServicoConsultaAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try
    if IniciaAcao(Request, pTempoServicoConsulta) then
    begin
      Response.Content := LeHTML('expira.htm');
      exit;
    end;

    pgpResposta.HTMLDoc.Text := ConsultaTempoServico(iIdPessoa);
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes(E);
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;
//BRUNO AZEVEDO SOL 124251 KINTANA 651677

//BRUNO AZEVEDO SOL 124251 KINTANA 651677
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAlteracaoTempoServicoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try
    if StrToIntDef( Request.ContentFields.Values['pIdTempoServico'], 0 ) = 0 then
      iIdPagina := pTempoServicoInclusao
    else
      iIdPagina := pTempoServicoAlteracao;

    if IniciaAcao( Request, pTempoServicoConsulta ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := AlteracaoTempoServico( iIdPessoa,
                                                       StrToIntDef( Request.ContentFields.Values['pIdTempoServico'],0));
     
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;
//BRUNO AZEVEDO SOL 124251 KINTANA 651677

//BRUNO AZEVEDO SOL 124251 KINTANA 651677
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSalvarTempoServicoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try
    if StrToIntDef( Request.ContentFields.Values['edtIdTempoServico'], 0 ) = 0 then
      iIdPagina := pTempoServicoConfInclusao
    else
      iIdPagina := pTempoServicoConfAlteracao;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := SalvarTempoServico( iIdPessoa, Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;
//BRUNO AZEVEDO SOL 124251 KINTANA 651677

//BRUNO AZEVEDO SOL 124251 KINTANA 651677
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExclusaoTempoServicoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try        
    if IniciaAcao( Request, pTempoServicoExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := ExclusaoTempoServico( iIdPessoa,
     StrToInt( Request.ContentFields.Values['pIdTempoServico'] ) );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;
//BRUNO AZEVEDO SOL 124251 KINTANA 651677

//BRUNO AZEVEDO SOL 124251 KINTANA 651677
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoExcluirTempoServicoAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  try

    if IniciaAcao( Request, pTempoServicoConfExclusao ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := ExcluirTempoServico( iIdPessoa,
     StrToInt( Request.ContentFields.Values['edtIdTempoServico'] ) );

  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;
//BRUNO AZEVEDO SOL 124251 KINTANA 651677

//BRUNO AZEVEDO SOL 91655 KINTANA 394002
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoAlterarDadosCadastraisAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try
    iIdPagina := pManutDadosCadastrais;

    if IniciaAcao( Request, pManutDadosCadastrais ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := AlterarDadosCadastrais( iIdPessoa );
     
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;

procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoSalvarDadosCadastraisAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try
    iIdPagina := pManutDadosCadastrais;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;

    pgpResposta.HTMLDoc.Text := SalvarDadosCadastrais( iIdPessoa, Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
end;
//BRUNO AZEVEDO SOL 91655 KINTANA 394002

//BRUNO AZEVEDO SOL 150726 KINTANA 1099530
procedure TwmdlAutoAtendimento.wmdlAutoAtendimentoHistoricoEnderecosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  iIdPagina : integer;
begin
  try
    iIdPagina := pManutEnderecos;

    if IniciaAcao( Request, iIdPagina ) then
    begin
      Response.Content := LeHTML( 'expira.htm' );
      exit;
    end;
    //Fanuel Junior SOL
    pgpResposta.HTMLDoc.Text := CarregaHistoricoEnderecos( StrToInt(Request.ContentFields.Values['IdEndereco'] ) , Request );
  except
    On E : Exception do
    begin
      pgpResposta.HTMLDoc.Text := TrataWebExcecoes( E );
    end;
  end;

  Response.Content := pgpResposta.Content;

  FinalizaAcao;
  //BRUNO AZEVEDO SOL 150726 KINTANA 1099530
end;

end.
