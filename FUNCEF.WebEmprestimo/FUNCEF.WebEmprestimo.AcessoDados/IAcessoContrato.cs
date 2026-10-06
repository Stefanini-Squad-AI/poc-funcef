#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// Criação de fucionalidade para importar modelos de contratos de empréstimo.
///
#endregion
#region SIG 90605
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 10/10/2019
///
/// Descrição da Alteração:
/// Busca de prestação com FGQC
///
#endregion
#region SIG 21529
///
/// Autor:
/// Thayane Rabonato/Darivaldo Alencar
///
/// Data da Alteração:
/// 12/09/2017
///
/// Descrição da Alteração:
/// Criação da opção de renegociação de dívidas de emprestimo
///
#endregion
#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Criação do método consultarAssinaturas e consultarContratos
///
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion
#region SOL 251082 / PPM 724410
/// Autor:
/// William Moreira da Silva
///
/// Data da Atualização:
/// 25/03/2015
///
/// Descrição da Alteração:
/// Alteração para o conector realizar concessões passando o numero do contrato
/// e um metodo para gerar o numero do contrato
#endregion
#region SOL 255960 / PPM 843375
/// - SOL: 255960 PPM: 843375
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Atualização:
/// 23/06/2015
///
/// Descrição da Alteração:
/// Correção na rontina de verificação de atualização diária, quando o contrato estiver com situação de encerrado
/// o sistema não deve apresentar a mensagem de indicação de falta de atualização diária. A regra diz que os contratos
/// com situação "E" de encerrado não tem atualização diária.
/// 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados dos contratos.
    /// </summary>
    public interface IAcessoContrato : IObjetoAcesso
    {

        void EncerrarBloqueioConcessao(int IdPessoa, DateTime DataQuitacao); // Felipe A. Santos SOL 224034/17909 PPM 1165556
        bool isAcordoJudicial(long Numerocontrato, ref int IdPessoa); // Felipe A. Santos SOL 224034/17909 PPM 1165556

        //William Moreira da Silva - SOL 246823 - Envio
        List<PlanoPrevidenciario> obterPlanosPrevidenciarios();
        List<Patrocinadora> obterPatrocinadoras();

        //Bruno.silva PPM:984370 SOL:255322/17559
        /// <summary>
        /// Busca Tipo Excepcional
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        int[] buscaTiposExcepcional(long numeroContrato);
        

        /// <summary>
        /// Obtem as informações do envio que esta pendente
        /// </summary>
        /// <returns>Informações do envio pendente</returns>
        ObjetoEnvio obterInfosEnvioProcessando();

        void incluirInformacoesEnvioETL(ObjetoEnvio envio);
        //William Moreira da Silva - SOL 246823 - Envio

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        List<Contrato> consultarAtivos(Contrato contrato, ref ParametrosConsulta parametros);

        /// <summary>
        /// Consulta contratos quitados
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        List<Contrato> consultarContratosQuitados(long numeroContrato);


        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        Contrato consultar(long numero, bool veioConector);

        ////Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Inicio
        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <param name="pIsConcessao">Chamada da tela de concessão</param>/// 
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        Contrato consultar(long numero, bool veioConector, bool pIsConcessao);
        ////Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Fim

        // Thiago Melo SOL 208661 Kintana 2021125
        /// <summary>
        /// Verificar se existe itens em aberto por matricula.
        /// </summary>        
        /// <param name="matricula">matricula.</param>
        bool temItensAbertoPorMatricula(String matricula);

        /// <summary>
        /// Verifica se a pessoa tem itens em aberto em alguma contrato
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns></returns>
        //William Moreira da Silva - SOL 260829 PPM 1045813
        bool verificaItensAberto(int idPessoa, int idTitular);

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        Contrato consultarContaCorrente(long numero);

        /// <summary>
        /// Pesquisa contratos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        List<Contrato> pesquisar(Contrato contrato, ref ParametrosConsulta parametros);

        //William Moreira da Silva - SOL 241797
        /// <summary>
        /// Obtem saldo devedor do contrato através da ultima data de atualização.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        double obterUltSaldoDevedor(long numeroContrato);

        /// <summary>
        /// Consulta se uma data é feriado ou não.
        /// </summary>
        /// <param name="data">Data a ser verificada.</param>
        /// <returns><see cref="System.Boolean"/> com verdadeiro se a data é feriado ou falso se a data não for.</returns>
        bool verificarDataFeriado(DateTime data);

        /// <summary>
        /// Verifica se exite mais de uma atualização do Saldo devedor do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        /// <param name="tipoEvento">Tipo de Evento.</param>
        bool verificarAtualizacaoSaldo(long numeroContrato, DateTime dataReferencia, TipoEvento tipoEvento);

        /// <summary>
        /// Verifica se existe atualização diária para uma data no histórico do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        bool verificarAtualizacaoDiaria(long numeroContrato, DateTime dataReferencia);

        // Xavier SOL 177146 inicio.
        /// <summary>
        /// Verificar se existe débito comandado anterior à alguma prestação
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataVencimento"></param>
        /// <returns></returns>
        bool VerificarValorAmortizacao(long numeroContrato, DateTime dataVencimento);
        // Xavier SOL 177146 Final.

        /// <summary>
        /// Verificar se existe parcela atrasada em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        bool parcelaAtrasadaEmAberto(long numeroContrato, DateTime dataReferencia);

        /// <summary>
        /// Obtem itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        List<ItemContrato> obterItensEmAberto(long numeroContrato, ref ParametrosConsulta parametros);

        /// <summary>
        /// Retorna parcela atual do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        int obterParcelaAtual(long numeroContrato);

        //William Moreira da Silva SOL 211419
        /// <summary>
        /// Verifica se existe parcela posterior.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        bool existeParcelaPosterior(long numeroContrato, DateTime dataAmortizacao);
        //William Moreira da Silva SOL 211419

        //William Moreira da Silva SOL 211704
        /// <summary>
        /// Verifica se a parcela do mês já foi gerada
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        DateTime? verificaParcelaGerada(long numeroContrato);

        /// <summary>
        /// Retorna caso a parcela já tenha sido gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        bool verificaEnvio(long numeroContrato, int parcela);//William Moreira da Silva SOL 211418

        /// <summary>
        /// Obtem parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        // Ajustado por Saulo / FUNCEF 
        int obterNumParcelasRestantes(long numeroContrato);

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        double obterSaldoDevedor(long numeroContrato, DateTime dataPrevista);

        /// <summary>
        /// Obtem data de atualizacao.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        DateTime obterDataAtualizacao(long numeroContrato);

        /// <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        double obterPrestacaoAtual(long numeroContrato);//William Moreira da Silva SOL 144458

        /// <summary>
        /// 
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        double obterPrestacaoAtualComFGQC(long numeroContrato);//SIG90605

        /// <summary>
        /// Altera informações do contrato.
        /// </summary>
        /// <param name="contrato">Contrato com os dados para alteração.</param>
        void alterarInformacoesContratuais(Contrato contrato);

        /// <summary>
        /// Altera informações do contrato.
        /// </summary>
        /// <param name="contrato">Contrato com os dados para alteração.</param>
        void alterarFormaCobranca(string formaCobranca, long numeroContrato);

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        // Esse método será usado para quando a situação for alterada pela chave mestra da tela de consulta de contratos
        //Willliam Moreira da Silva - SOL 225203
        void alterarSituacao(long numeroContrato, SituacaoContrato situacao);

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        //Willliam Moreira da Silva - SOL 225203
        string alterarSituacao(long numeroContrato);

        /// <summary>
        /// Altera informações de suspensão do contrato.
        /// </summary>
        /// <param name="suspensao">Dados da suspensão.</param>
        void alterarSuspensao(HistoricoSuspensao suspensao);

        /// <summary>
        /// Retira informações de suspensão do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        void retirarSuspensao(long numeroContrato, string UsuarioLogado);

        /// <summary>
        /// Obtem lista de itens
        /// </summary>
        /// <returns></returns>
        List<ItemContrato> listarItens();

        /// <summary>
        /// Executa procedure de Ajuste de Saldo
        /// </summary>
        /// <param name="numeroContrato">Número do contrato</param>
        /// <param name="dataAtualiza">Data da atualiza</param>
        /// <param name="saldoDevedor">Saldo devedor</param>
        void executarAjusteSaldo(long numeroContrato, DateTime dataAtualiza, double saldoDevedor);

        //William Moreira da Silva SOL 209315/14752
        /// <summary>
        /// Executa a procedure de atualização diaria
        /// </summary>
        void executarAtualizacaoDiaria(long numeroContrato, DateTime ultAtualizacao, DateTime dataCondiderar);
        //William Moreira da Silva SOL 209315/14752

        //William Moreira da Silva SOL 209315/14752
        /// <summary>
        /// Retorna a data da ultima atualização diaria 
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        DateTime diaUltimaAtualizacao(long numeroContrato);
        //William Moreira da Silva SOL 209315/14752

        //William Moreira da Silva - SOL 251082
        /// <summary>
        /// Obtem o novo numero de contrato
        /// </summary>
        /// <returns>Retorna o novo numero de contrato</returns>
        long obterNumeroContrato();

        /// <summary>
        /// Verifica se o numero de contrato já existe
        /// </summary>
        /// <param name="numeroContrato">Número do contrato que esta sendo contratado</param>
        /// <returns>Retorna verdadeiro se já existir </returns>
        bool verificanumeroContrato(long numeroContrato);
        //William Moreira da Silva - SOL 251082

        /// <summary>
        /// Inclui um contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna numero do contrato inserido</returns>
        long incluir(Contrato contrato);

        /// <summary>
        /// Inclui inscricao de empréstimo do contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna id da inscricao inserido</returns>
        long incluirInscricao(Contrato contrato);

        /// <summary>
        /// Inclui histórico da incrição de emprestimo do contrato
        /// </summary>
        /// <param name="idInscricao">ID da inscrição</param>
        /// <param name="item">Item do contrato</param>
        void incluirInscricaoHistorico(long idInscricao, ItemContrato item);

        /// <summary>
        /// Consulta historico de suspensão de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="idHistoricoSuspensao">Identificador do histórico de suspensão.</param>
        List<HistoricoSuspensao> consultarHistoricoSuspensao(long numeroContrato, long idHistoricoSuspensao);

        /// <summary>
        /// Consulta Log de um contrato.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        List<LogContrato> consultarLog(LogContrato logContrato);

        //William Moreira da Silva - SOL 219785 KTN 2052123
        /// <summary>
        /// Método retorna o log do contrato em partes
        /// </summary>
        /// <param name="logContrato"></param>
        /// <param name="linhaInicial"></param>
        /// <returns>Retorna 3500 registros do log do contrato a partir da linha passada como parâmetro</returns>
        List<LogContrato> consultarLogParticionado(LogContrato logContrato, int linhaInicial);

        /// <summary>
        /// Retorna a quantidade de linhas que exitems de logs
        /// </summary>
        /// <param name="logContrato"></param>
        /// <returns>A quantidade de logs existenteas na tabelas</returns>
        int consultarQuantLog(LogContrato logContrato);
        //William Moreira da Silva - SOL 219785 KTN 2052123

        //William Moreira da Silva
        /// <summary>
        ///Consulta Log de um contrato pela origem.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        List<LogContrato> consultarLogOrigem(LogContrato logContrato, int origem);
        //William Moreira da Silva

        /// <summary>
        /// Inclui o log de um contrato.
        /// </summary>
        /// <param name="logContrato">Log do contrato.</param>
        void incluirLog(LogContrato logContrato);

        /// <summary>
        /// Inclui log se a Conta Corrente for alterada
        /// </summary>
        void incluirLogDadosContratuais(Int64 idContrato, int idContaBancaria, string usuario);

        // SOL 199759
        /// <summary>
        /// Inclui idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA 
        /// </summary>
        void incluirAvalista(Int32 idAvalista, long idContratoEmptmo);
        // SOL 199759

        // SOL 199759
        /// <summary>
        /// Excluir idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA 
        /// </summary>
        void excluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria);
        // SOL 199759


        /// <summary>
        /// Coloca o numero do contrato de Quitação no contrato quitado
        /// </summary>
        void alterarContratoQuitacao(long contratoNovo, long contratoQuitado);

        /// <summary>
        /// Coloca data de quitação no contrato
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataQuitacao"></param>
        void alterarDataQuitacao(long numeroContrato, DateTime dataQuitacao);

        ValoresContrato obterDadosAnteriorPosteriorContrato(long numeroContrato, DateTime dataReferencia);

        long? consultarAutoEmprestimo(long codigoAutoEmprestimo);

        bool validarContratoPadrao(int idContratoPadrao);

        void incluirAssinaturaPadrao(Assinatura assinaturaContrato);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica a situação na patrocinadora se estiver ativa
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato</param>
        /// <returns>Verdadeiro se a situação estiver ativa</returns>
        bool situacaoPatrocianadora(long numeroContrato);

        /// <summary>
        /// Verifica se o mutuario tem vinculo empregaticio
        /// </summary>
        /// <param name="numeroContrato">Numero do contraro</param>
        /// <returns>Verdadeiro se o mutuario do contrato tiver vinculo</returns>
        bool verificaVinculoEmpregaticio(long numeroContrato);
        //William Moreira da Silva - SOL 207977

        /// <summary>
        /// Consulta logs de dados contratuais
        /// </summary>
        List<Contrato> consultarLogDadosContratuais(long numero);

        /// <summary>
        /// Obtem suspensão dos contratos anteriores em aberto
        /// </summary>
        /// <param name="dataCredito">Data crédito da concessão</param>
        /// <param name="listaContratos">Lista contratos (separados por ",")</param>
        List<HistoricoSuspensao> consultarSuspensaoAnteriores(DateTime dataCredito, string listaContratos);

        //William Moreira/Xavier SOL 218639 KTN 2050361 Inicio
        /// <summary>
        /// Acerta o plano origem ao conceder o contrato
        /// </summary>
        /// <param name="contrato">Contrato que esta sendo concedido</param>
        void acertaPlanoOrigem(Contrato contrato, long numeroContrato);

        /// <summary>
        /// Busca o plano origem da BENEFBFICIARIO
        /// </summary>
        /// <param name="contrato">O Contrato que esta sendo concedido</param>
        void buscaPlanoContabil(Contrato contrato, long numeroContrato);


        /// <summary>
        /// Atualiza o plano contabil
        /// </summary>
        /// <param name="contrato">Contrato que esta sendo concedido</param>
        /// <param name="idPlanoOrigem">Id plano origem que será inserido</param>
        void atualizaPlanoContabil(long numeroContrato, int idPlanoOrigem);
        //William Moreira/Xavier SOL 218639 KTN 2050361 FIM

        //Saulo/FUNCEF
        /// <summary>
        /// Busca as informações básicas de um contrato
        /// </summary>
        /// <param name="numContrato">Identificador do contrato</param>
        Dictionary<string, object> buscaInfoContrato(long numContrato);

        //Saulo/FUNCEF
        /// <summary>
        /// Busca as informações financeiras de um contrato
        /// </summary>
        /// <param name="numContrato">Identificador do contrato</param>
        Dictionary<string, object> buscaInfoFinanceiras(long numContrato);

        //Saulo/FUNCEF
        /// <summary>
        /// Busca demais informações de um contrato
        /// </summary>
        /// <param name="numContrato">Identificador do contrato</param>
        Dictionary<string, object> buscaInfoAdicionais(long numContrato);

        //Saulo / FUNCEF
        /// <summary>
        /// Busca as informações da suspensão de um contrato
        /// </summary>
        /// <param name="idSuspensao">Identificador do tipo de suspensão</param>
        Dictionary<string, object> buscaInfoSuspensao(long numContrato, int idSuspensao, DateTime dataInicio);

        /// <summary>
        /// Busca informações da patrocinadora de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações da patrocinadora do contrato</returns>
        //Saulo / FUNCEF
        Dictionary<string, object> buscaInfoPatrocinadora(long numContrato);

        /// <summary>
        /// Busca informações do plano de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações do plano do contrato</returns>
        //Saulo / FUNCEF
        Dictionary<string, object> buscaInfoPlano(long numContrato);

        //William Moreira da Silva - SOL 143476/16437
        /// <summary>
        /// Incluir informações do contrato que foi impresso
        /// </summary>
        /// <param name="relatorio">Objeto com todas as informações do contrato</param>
        void incluirInformacoesDadosContratoEmptmo(RelatorioContrato relatorio);

        void inseriLeiout(LeioutContrato leiout);

        LeioutContrato consultarleiout(int idTipoContratoEmptmo, DateTime? dataInicioVigencia);
		
		//Wylliam Leite da Silva - SOL: 255960 PPM: 843375 - Inicio
        /// <summary>
        /// Verifica a situação atual do contrato
        /// </summary>
        /// <param name="prNumeroContrato">Número do contrato.</param>
        string verificaSituacaoContrato(long prNumeroContrato);
        //Wylliam Leite da Silva - SOL: 255960 PPM: 843375 - Fim

        #region SIG 28915 - Eliamar Tani - Criação de método para listar assinaturas
        List<Assinatura> consultarAssinaturas(Mutuario contrato, ref ParametrosConsulta parametros, ref string infoMutuario, ref string mensagemExcecao);

        List<ContratoPadrao> consultarContratos();

        Assinatura obterAssinaturaContrato(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura);

        bool excluirAssinaturaContratoPadrao(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura);

        void salvarAssinaturaContrato(Assinatura item);
        #endregion
                
        #region SIG 28915 - Darivaldo Alencar
        bool NupEstaVinculado(string idPessoa, string protocolo);
        #endregion

        //Campanha Desconto
        List<ItemContrato> ObterItensEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros);

        LeioutContrato ConsultarLeioutCampanhaDesconto(int idTipoContratoEmptmo);

        void IncluirDadosCampanhaDesconto(long numeroContrato, int idItemEmptmo, double percentualDesconto, double ValorNominal, int tipoProposta, int mesAtraso, DateTime dataOperacao, double valorDesconto);

        ContratoDTO BuscarDadosContratoImpressao(long NumeroContrato);

        //SIG 48294
        List<Contrato> BuscarContratosParaCancelamento(Contrato contrato, ref ParametrosConsulta parametros);
        //SIG 48294
        void CancelarInscricao(long IdInscricaoContrato);
        //SIG 48294
        void CancelarContrato(long NumeroContrato, string ProtocoloCRM);
        //SIG 48294
        void CancelarConcessao(long NumeroContrato, string UsuarioSistema);
        //SIG 48294
        void EstornarAtualizacaoSaldo(long NumeroContrato, string UsuarioLogado);
        //SIG 48294
        void DesfazerQuitacaoContrato(long NumeroContrato);
        //SIG 48294
        void EstornarConcesssao(long NumeroContrato, string UsuarioLogado);
        //SIG 48294
        void EstornarQuitacaoContratos(long NumeroContrato, string UsuarioLogado);

        //SIG 48294
        void ReativarContratosQuitados(long NumeroContrato);

        //SIG 48294
        void IncluirLogOpcao(long NumeroContrato, string UsuarioLogado);

        //SIG 48294
        bool VerificarDocumentoBaixado(long NumeroContrato);

        bool VerificaExistenciaPrestacoes(long NumeroContrato);
        //SIG 63057
        void GravarContrato(long NumeroContrato, string ContratoHTML);

        string ObterAmbienteBancoDados();

        void AlterarItensSuspensao(HistoricoSuspensao Suspensao);

        //William Santana - SIG 50871 - início 
        List<ModeloContratoEmp> consultarModelosContratos(string tipocontrato, DateTime? DataInicioVigencia, ref ParametrosConsulta parametros);
        
        string InsAltDelModContratos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao);
        //William Santana - SIG 50871 - fim

        //void CancelarConcessao(long numeroContrato, string usuarioSistema);

        List<ContratoRenegociacao> consultarParcelasRenegociacao(IDictionary<String, object> parametros);  // Thayane Rabonato SIG 21529

        int ContratoDecimoTerceito(string pNumContrato); //SIG21529

        bool DataCreditoPossuiINPC(string pDataCredito); //SIG21529

        //SIG 21529/52136
        List<ItemContrato> ObterItensEmAbertoAgrupadosComData(long numeroContrato);

        EmptmoDocFinanceiroDTO EnviarBoletoBancario(long NumeroContrato, int NumeroParcela, DateTime DataVencimento, int TipoMovimento);

        string VerificarMesRefParcela(long NumeroContrato, int NumeroParcela);

        List<ItemContrato> obterItensEmAberto(long NumeroContrato, int NumeroParcela);

        //SIG 129005
        void SalvarMinutasContratosAntigos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao);

        RelatorioContrato BuscarDadosContratosAutoAtendimento(long NumeroContrato);

        List<ModeloContratoEmp> ConsultarModelosContratosSemMinuta(int IdMinutaContrato);

        //WO3200
        void CancelarBloqueioConcessao(int IdPessoa, string UsuarioResponsavel, bool RenegociacaoInadimplencia = false);
        //WO3200
        void ExcluirEventoCobranca(long NumeroContrato, int IdTipoEventoCobranca);

        //WO3200
        bool VerificarRenegociacaoInadP3(long NumeroContrato);
    }
}
