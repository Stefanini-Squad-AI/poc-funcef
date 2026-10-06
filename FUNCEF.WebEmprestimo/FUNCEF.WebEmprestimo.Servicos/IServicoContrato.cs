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
#region SIG 21529.52136
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 16/12/2019
///
/// Descrição da Alteração:
/// Criação da opção de renegociação de dívidas de emprestimo
///
#endregion
#region SIG 21529
///
/// Autor:
/// Thayane Rabonato
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Collections;

namespace FUNCEF.Planus.WebEmprestimo.Servicos
{
    /// <summary>
    /// Serviço de manutenção de estado do sistema.
    /// </summary>
    [ServiceContract(Namespace = ConstantesServico.namespaceServicos)]
    
    public interface IServicoContrato : IServicoBase
    {
        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - início
        [OperationContract]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void EncerrarBloqueioConcessao(int IdPessoa, DateTime DataQuitacao);
        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - fim

        //William Moreira da Silva - SOL 246823 - Envio
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<PlanoPrevidenciario> obterPlanosPrevidenciarios();

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Patrocinadora> obterPatrocinadoras();


        /// <summary>
        /// Obtem as informações do envio que esta pendente
        /// </summary>
        /// <returns>Informações do envio pendente</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        ObjetoEnvio obterInfosEnvioProcessando();

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirInformacoesEnvioETL(ObjetoEnvio envio);
        //William Moreira da Silva - SOL 246823 - Envio

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contrato> consultarAtivos(Contrato contrato, ref ParametrosConsulta parametros);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o item foi enviado para a folha.
        /// </summary>
        /// <param name="idHistMovEmptmo"></param>
        /// <returns>0 para aguardando processamento e 2 para item recebido</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void verificaSitEnvio(List<long> ids);

        //William Moreira da Silva - SOL 251082
        /// <summary>
        /// Obtem o novo numero de contrato
        /// </summary>
        /// <returns>Retorna o novo numero de contrato</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        long obterNumeroContrato();

        /// <summary>
        /// Verifica se o numero de contrato já existe
        /// </summary>
        /// <param name="numeroContrato">Número do contrato que esta sendo contratado</param>
        /// <returns>Retorna verdadeiro se já existir </returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificanumeroContrato(long numeroContrato);
        //William Moreira da Silva - SOL 251082

        /// <summary>
        /// Retorna parcela atual do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        // William Moreira da Silva 207977
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int obterParcelaAtual(long numeroContrato);

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Contrato consultarContrato(long numero);

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Contrato consultarContaCorrente(long numero);

        /// <summary>
        /// Consulta os beneficiários do contrato.
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Beneficiario"/> com o(s) beneficiário(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Beneficiario> consultarBeneficiarios(long numero);

        
        //Bruno.silva PPM:984370 SOL:255322/17559
        /// <summary>
        /// Busca Tipos de Excepcional
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int[] buscaTiposExcepcional(long numeroContrato);

        /// <summary>
        /// Consulta os contrato quitados.
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contratos"/> com o(s) Contrato(s) Quitado(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contrato> consultarContratosQuitados(long numero);

        //William Moreira da Silva SOL 211704
        /// <summary>
        /// Verifica se a parcela do mês já foi gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime? verificaParcelaGerada(long numeroContrato);

        /// <summary>
        /// Calcula data limite considerando feriados
        /// </summary>
        /// <param name="dataCalculo">Data base para cálculo</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime calcularDataLimite(DateTime dataCalculo);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime calcularDataLimiteDebito(DateTime dataCalculo);

        /// <summary>
        /// Valida a amortização.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        /// <param name="dataCredito">Data de crédito do contrato.</param>
        /// <param name="dataLimite">Data limite para amortização.</param>
        /// <param name="excepcional">Indica se é uma amortização excepcional ou não.</param>
        /// <returns>Verdadeiro se a amortização é válida.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool validarAmortizacao(long numeroContrato, DateTime dataAmortizacao, DateTime dataCredito, DateTime dataLimite, bool excepcional);

        // SOL 204001
        /// <summary>
        /// Valida permissao por tipo de contrato.
        /// </summary>
        /// <param name="idTipoContrato">Tipo do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool validarPermissaoTipoContrato(long idTipoContrato);
        // SOL 204001

        // Xavier SOL 177146 inicio.
        /// <summary>
        /// o sistema apresenta aviso para os casos de amortização em que o débito for comandado anterior à alguma prestação
        /// se na última parcela a data HMEDATAPREVISTA for > que Data da Amortização ... Será apresentada a msg.
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataVencimento"></param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool VerificarValorAmortizacao(long numeroContrato, DateTime dataVencimento);
        // Xavier SOL 177146 Final.
        /// <summary>
        /// Valida a quitação.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="dataCredito">Data de crédito do contrato.</param>
        /// <param name="dataLimite">Data limite para quitação.</param>
        /// <param name="excepcional">Indica se é uma quitação excepcional ou não.</param>
        /// <returns>Verdadeiro se a quitação é válida.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        // SOL 204424 KTN 1976597 Otacilio
        // Verificar se a quitação é por falecimento acrescentado o parametro "bfalecimento"
        bool validarQuitacao(long numeroContrato, DateTime dataQuitacao, DateTime dataCredito, DateTime dataLimite, bool excepcional, bool bfalecimento);

        /// <summary>
        /// Verifica se teve suspensão no periodo cadastrado
        /// </summary>
        /// <param name="historico"></param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaSuspensaoPeriodo(long numeroContrato, DateTime dataIni, DateTime dataFim);//William Moreira da Silva SOL161447

        /// <summary>
        /// Obtém as possíveis situações de um contrato.
        /// </summary>
        /// <returns>As possíveis situações de um contrato.</returns>
        [OperationContract()]
        List<SituacaoContrato> listarSituacao();

        /// <summary>
        /// Consulta contratos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contrato> pesquisarContratos(Contrato contrato, ref ParametrosConsulta parametros);

        /// <summary>
        /// Obtem itens do contrato em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> obterItensContratoEmAberto(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens);

        /// <summary>
        /// Obtem parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int obterParcelasRestantes(long numeroContrato, DateTime dataReferencia);

        //William Moreira da Silva SOL 211419
        /// <summary>
        /// Retorna caso haja parcela posterior.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool existeParcelaPosterior(long numeroContrato, DateTime dataReferencia);
        //William Moreira da Silva SOL 211419

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        double obterSaldoDevedor(long numeroContrato, DateTime dataPrevista);

        /// <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        double obterPrestacaoAtual(long numeroContrato);//William Moreira da Silva SOL 144458

        // <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        double obterPrestacaoAtualComFGQC(long numeroContrato); //SIG90605

        /// <summary>
        /// Consulta um tipo de contrato
        /// </summary>
        /// <param name="id">Identificador do tipo de contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o tipo de contrato encontrado.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        TipoContrato consultarTipoContrato(int id, bool veioConector);

        /// <summary>
        /// Executa regra passando os parâmetros obtdos.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        /// <param name="parametros">Parâmetros da regra.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        object executarRegra(Regra regra, IDictionary<string, object> parametros);

        /// <summary>
        /// Executa regra passando os parâmetros obtdos.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        /// <param name="parametros">Parâmetros da regra.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        object executarRegraRetorno(Regra regra, IDictionary<string, object> parametros, ref string mensagem);

        /// <summary>
        /// Obtém parâmetros da regra.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        IDictionary<string, object> obterParametrosRegra(Regra regra);

        /// <summary>
        /// Retorna itens calculados.
        /// </summary>
        /// <param name="idTipoContrato">Identificador do tipo de contrato.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> calcularItensAmortizacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataAmortizacao, int novoPrazo, double? valorAmortizacao, double? valorMargem);

        /// <summary>
        /// Retorna itens calculados.
        /// </summary>
        /// <param name="idTipoContrato">Identificador do tipo de contrato.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> calcularItensQuitacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataQuitacao, TipoOperacao operacao, bool CampanhaInadimplencia);

        /// <summary>
        /// Altera informações do contrato.
        /// </summary>
        /// <param name="contrato">Contrato com os dados para alteração.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool alterarInformacoesContratuais(Contrato contrato);

        /// <summary>
        /// Altera forma de cobrança do contrato.
        /// </summary>
        /// <param name="formaCobranca">Nova forma de cobrança.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool alterarFormaCobranca(string formaCobranca, long numeroContrato);

        /// <summary>
        /// Aplica tratamento nas informações de histórico de amortização do contrato.
        /// </summary>
        /// <param name="historico"></param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> tratarHistoricoAmortizacao(List<Historico> historico);

        /// <summary>
        /// Executa a atualização diária.
        /// </summary>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void executarAtualizacaoDiaria(long numeroContrato);//William Moreira da Silva SOL 209315/14752

        /// <summary>
        /// Inclui histórico do contrato.
        /// </summary>
        /// <param name="historico"></param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirHistorico(List<Historico> historico);

        /// <summary>
        /// Inclui histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirHistoricoNovo(List<Historico> historico);

        /// <summary>
        /// Excluir histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluir(long idHistorico);


        /// <summary>
        /// Atualizar histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void atualizarHistorico(Historico historico);


        /// <summary>
        /// Lista os Tipos de Contrato do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o(s) tipo(s) de contratos(s) encontrado(s).</returns>
        [OperationContract()]
        List<TipoContrato> listarTipoContrato();

        /// <summary>
        /// Lista os Tipos de Propostas da campanha.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoProposta"/> com o(s) tipo(s) de proposta(s) encontrado(s).</returns>
        [OperationContract()]
        List<TipoProposta> listarTipoProposta();

        /// <summary>
        /// Lista as Moeda do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Moeda"/> com a(s) Moeda(s) encontrado(s).</returns>
        [OperationContract()]
        List<Moeda> listarMoeda();

        /// <summary>
        /// Estorna Itens a Vencer Atualização diária.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void estornarItensAtualizacao(long numeroContrato, DateTime dataQuitacao);

        /// <summary>
        /// Estorna itens a vencer.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void estornarItensAVencer(long numeroContrato, DateTime dataQuitacao);

        /// <summary>
        /// Quitar itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void quitarItensEmAberto(long numeroContrato, DateTime dataQuitacao);

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarSituacaoContrato(long numeroContrato, SituacaoContrato situacao);

        /// <summary>
        /// Altera informações de suspensão do contrato.
        /// </summary>
        /// <param name="suspensao">Dados da suspensão.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarSuspensaoParcelaContrato(HistoricoSuspensao suspensao);

        /// <summary>
        /// Retira informações de suspensão do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void retirarSuspensaoParcelaContrato(long numeroContrato, string UsuarioLogado);

        /// <summary>
        /// Lista todos tipos de suspensão.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        [OperationContract()]
        List<TipoSuspensao> listarTipoSuspensao();

        /// <summary>
        /// Consulta os tipos de suspensão.
        /// </summary>
        /// <param name="idTipoContrato">Identificação do contrato a ser filtrado.</param>
        /// <param name="idTipoSuspensao">Identificação do tipo de suspensão a ser filtrado.</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        [OperationContract()]
        List<TipoSuspensao> consultarTipoSuspensao(int idTipoContrato, int? idTipoSuspensao);

        /// <summary>
        /// Consulta contratos em aberto do mutuário e verifica condições de concessão
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <param name="excepcional">Flag para exceção na verificação</param>
        /// <param name="idTipoContratoConcessao">Tipo do contrato da concessão</param>
        /// <returns>Retorna contratos em aberto</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito, DateTime dataSolicitacao, bool excepcional, out List<string> listaAvisos, List<long> contratosSelecionados);// Thiago Melo SOL 206149

        /// <summary>
        /// Consulta históricos do contrato.
        /// </summary>
        /// <param name="historico">Tipo Histórico com os filtros</param>
        /// <returns>Retorna históricos do contrato</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> consultarHistorico(Historico historico, ref ParametrosConsulta parametros);

        /// <summary>
        /// Consulta históricos do contrato.
        /// </summary>
        /// <param name="historico">Tipo Histórico com os filtros</param>
        /// <returns>Retorna históricos do contrato</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Historico consultarHistoricoChaveMestre(long idHistorico);


        /// <summary>
        /// Verifica se existe atualização diária para uma data no histórico do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarAtualizacaoDiaria(long numeroContrato, DateTime dataReferencia);

        /// <summary>
        /// Retorna Itens de cálculo do tipo do contrato e tipo de evento.
        /// </summary>
        /// <param name="idTipoContrato">Identificador do tipo de contrato</param>
        /// <param name="idTipoEvento">Tipo de evento</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> obterItens(TipoContrato tipoContrato, TipoEvento tipoEvento);

        /// <summary>
        /// Executar regra para cada item da lista.
        /// </summary>
        /// <param name="itensContrato">Lista de itens de contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> calcularItens(List<ItemContrato> itensContrato, Dictionary<string, object> parametros);

        /// <summary>
        /// Consulta historico de suspensão de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="idHistoricoSuspensao">Identificador do histórico de suspensão.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<HistoricoSuspensao> consultarHistoricoSuspensao(long numeroContrato, long idHistoricoSuspensao);

        /// <summary>
        /// Consulta um Histórico
        /// </summary>
        /// <param name="idHistorico">ID do Histórico</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o históricos encontrado.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Historico consultarDetalheContrato(long idHistorico);

        /// <summary>
        /// Inclui um contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna numero do contrato inserido</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        long incluirContrato(Contrato contrato);

        /// <summary>
        /// Inclui inscricao de empréstimo do contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna id da inscricao inserido</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        long incluirInscricao(Contrato contrato);

        /// <summary>
        /// Inclui histórico da incrição de emprestimo do contrato
        /// </summary>
        /// <param name="idInscricao">ID da inscrição</param>
        /// <param name="item">Item do contrato</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirInscricaoHistorico(long idInscricao, ItemContrato item);

        /// <summary>
        /// Executa o ajuste de Saldo.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataPrevista">Data Prevista.</param>
        /// <param name="saldoDevedor">Saldo Devedor.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void executarAjusteSaldo(long numeroContrato, DateTime dataAtualiza, double saldoDevedor);

        /// <summary>
        /// Verificar Bloqueio Contabil e Periodo.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataPrevista">Data Prevista.</param>        
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarBloqueioContabilPeriodo(long numeroContrato, DateTime dataPrevista);



        /// <summary>
        /// Executa o ajuste da Situação.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void ajustarSituacao(long numeroContrato, DateTime dataReferencia);

        /// <summary>
        /// Verifica a existencia de uma suspensão ativa.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarSuspensaoAtiva(long numeroContrato);

        /// <summary>
        /// Inclui historico de suspensão de um contrato.
        /// </summary>
        /// <param name="historioSuspensao">Dados da suspensão.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirHistoricoSuspensao(HistoricoSuspensao historico);

        /// <summary>
        /// Altera historico de suspensão de um contrato.
        /// </summary>
        /// <param name="historioSuspensao">Dados da suspensão.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarHistoricoSuspensao(HistoricoSuspensao historico);

        /// <summary>
        /// Verifica se algum tem contrato ativo
        /// </summary>
        /// <param name="historico"></param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaContratoAtivo(long numeroContrato);//William Moreira da Silva SOL161201

        /// <summary>
        /// Altera a observação do histórico.
        /// </summary>
        /// <param name="idHistorico">ID do histórico.</param>
        /// <param name="observacao">Observação do Histórico.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarObservacaoHistorico(long idHistorico, string observacao);

        /// <summary>
        /// Consulta Itens de um contrato.
        /// </summary>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> listarItens();

        /// <summary>
        /// Consulta Log de um contrato.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<LogContrato> consultarLog(LogContrato logContrato);

        //William Moreira da Silva - SOL 219785 KTN 2052123
        /// <summary>
        /// Método retorna o log do contrato em partes
        /// </summary>
        /// <param name="logContrato"></param>
        /// <param name="linhaInicial"></param>
        /// <returns>Retorna 3500 registros do log do contrato a partir da linha passada como parâmetro</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<LogContrato> consultarLogParticionado(LogContrato logContrato, int linhaInicial);

        /// <summary>
        /// Retorna a quantidade de linhas que exitems de logs
        /// </summary>
        /// <param name="logContrato"></param>
        /// <returns>A quantidade de logs existenteas na tabelas</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int consultarQuantLog(LogContrato logContrato);
        //William Moreira da Silva - SOL 219785 KTN 2052123


        //William Moreira da Silva
        /// <summary>
        ///Consulta Log de um contrato pela origem.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<LogContrato> consultarLogOrigem(LogContrato logContrato, int origem);
        //William Moreira da Silva

        /// <summary>
        /// Inclu o log de um contrato.
        /// </summary>
        /// <param name="logContrato">Log do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirLog(LogContrato logContrato);

        // SOL 199759

        /// <summary>
        /// Inclui o Avalista de um contrato.
        /// </summary>
        /// <param name="Avalistas">Log do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirAvalista(Int32 idAvalista, long idContratoEmptmo);

        /// <summary>
        /// Inclu o Avalista de um contrato.
        /// </summary>
        /// <param name="Avalistas">Log do contrato.</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria);

        // SOL 199759

        /// <summary>
        /// Inclui log se a Conta Corrente for alterada
        /// </summary>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirLogDadosContratuais(Int64 idContrato, int idContaBancaria, string usuario);

        /// <summary>
        /// Grava quitação de um contrato
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataQuitacao"></param>
        /// <param name="itensQuitacao"></param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void gravarQuitacao(long numeroContrato, DateTime dataQuitacao, List<Historico> itensQuitacao);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        double calcularGravarDesconto(long numeroContrato, int tipoContrato, DateTime dataDesconto, List<ItemContrato> itensContrato, int origem, int tipoProposta);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemDescontoContrato> obterDesconto(long numeroContrato, int tipoContrato, DateTime dataDesconto, List<ItemContrato> itensContrato, int origem, int tipoProposta);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool parcelaAtrasadaEmAberto(long numeroContrato, DateTime dataReferencia);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        long? consultarAutoEmprestimo(long codigoAutoEmprestimo);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool validarContratoPadrao(int idContratoPadrao);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirAssinaturaPadrao(Assinatura assinaturaContrato);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contrato> consultarLogDadosContratuais(long numero);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> consultarHistoricoEnvio(long idHistorico);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> consultarEventoCobranca(long idContrato, long? idEvento);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> consultarParcelaCobranca(long idContrato, int idTipoEvento, DateTime dataEvento);

        //William Moreira da Silva - SOL 207977 PPM
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> consultarItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos);

        //William Moreira da Silva - SOL 207977 PPM
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> consultarItensAbertoParticionado(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<int, string> obterItensDaCampanha(int tipoContrato);       

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ParcelaDescontoCampanha> obterItensAbertoDesconto(long numeroContrato, int tipoContrato, DateTime dataLimite, int tipoProposta, bool IofCalculado);        

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaCampanhaPendente(long numeroContrato, int tipoProposta);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool efetivarTratamentoParcelas(long numeroContrato, DateTime dataCalculo, int numParcela, string origemRecurso, int tipoProposta);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaParcelaTratada(List<int> parcelas, long numeroContrato, ref DateTime data, ref DateTime dataVencimento);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int consultaQuantItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos);
        //William Moreira da Silva - SOL 207977 PPM

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarSuspensaoAnteriores(DateTime dataCredito, string listaContratos);
        // Xavier SOL 168644
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int? consultarUltimoIdCalculo();
        // Xavier SOL 168644

        // Thiago Melo SOL 208661 Kintana 2021125
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool temItensAbertoPorMatricula(String matricula);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns></returns>
        //William Moreira da Silva - SOL 260829 PPM 1045813
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaItensAberto(int idPessoa, int idTitular);
        //William Moreira da Silva - SOL 260829 PPM 1045813

        //William Moreira da Silva - SOL 207977 PPM
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> calcularEncargosVencimento(List<Historico> itensTratados, long numeroContrato, bool calcularEncargos, List<int> parcelas, DateTime dataVencimento, DateTime dataEvento, int tipoProposta);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime obterDataCredito(long numeroContrato, bool veioConector);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool situacaoPatrocianadora(long numeroContrato);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaVinculoEmpregaticio(long numeroContrato);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Inseri os novos itens e altera o vencimento do que já existem
        /// </summary>
        /// <param name="itensaTratar">Itens que serão alterados</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void gravarAlteracoesHistorico(List<Historico> itensaTratar, int funcionalidade);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaItensRecebidoseBaixados(List<Historico> itensTratados);

        //William Moreira da Silva - SOL 207977
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void atualizarHistoricoSuspensaoItensCentralizados(Historico historico);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaItemRecebidoseBaixados(Historico itemTratado);

        /// <summary>
        /// Verifica se o tipo do contrato esta ativo
        /// </summary>
        /// <param name="idTipoContrato">id do contrato a ser validado</param>
        /// <returns>Retorna se o contato esta ativo ou não</returns>
        //William Moreira da Silva - SOL 214635 KTN 2044698
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool validaContratoAtivo(int idTipoContrato);

        /// <summary>
        /// Verifica se o tipo do contrato esta ativo
        /// </summary>
        /// <param name="idTipoContrato">id do contrato a ser validado</param>
        /// <returns>Retorna se o contato esta ativo ou não</returns>
        //William Moreira da Silva - SOL 207977
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool existeItensNaoRecebidos(List<long> idHistoricos);

        /// <summary>
        /// Busca informações básicas de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações básicas do contrato</returns>
        //Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoContrato(long numContrato);

        /// <summary>
        /// Busca informações financeiras de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações financeiras do contrato</returns>
        //Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoFinanceiras(long numContrato);

        /// <summary>
        /// Busca informações adicionais de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações adicionais do contrato</returns>
        //Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoAdicionais(long numContrato);

        /// <summary>
        /// Busca informações da suspensão de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <param name="idSuspensao">Identificador da suspensão do contrato</param>
        /// <param name="dataInicio">Data início da suspensão do contrato</param>
        /// <returns>Retorna Dictionary com as informações da suspensão do contrato</returns>
        //Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoSuspensao(long numContrato, int idSuspensao, DateTime dataInicio);

        /// <summary>
        /// Busca informações da patrocinadora de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações da patrocinadora do contrato</returns>
        //Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoPatrocinadora(long numContrato);

        /// <summary>
        /// Busca informações do plano de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações do plano do contrato</returns>
        //Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoPlano(long numContrato);

        /// <summary>
        /// Obtém quantidade de parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        // Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int obterNumParcelasRestantes(long numeroContrato);
        
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void inseriLeiout(LeioutContrato leiout);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        LeioutContrato consultarleiout(int idTipoContratoEmptmo, DateTime? dataInicioVigencia);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> ConsultarItensAbertosParticionadoAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos);

        #region SIG 28915 - Eliamar Tani - Criação de método para listar assinaturas
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<Assinatura> consultarAssinaturas(Mutuario contrato, ref ParametrosConsulta parametros, ref string infoMutuario, ref string mensagemExcecao);
        
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<ContratoPadrao> consultarContratos();

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        Assinatura obterAssinaturaContrato(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura);
        
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        bool excluirAssinaturaContratoPadrao(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        void salvarAssinaturaContrato(Assinatura item);
        #endregion

        #region SIG 28915 -Darivaldo Alencar
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        bool NupEstaVinculado(string idPessoa, string protocolo);
        #endregion

        
        //Campanha Desconto
        //[OperationContract()]
        //[FaultContract(typeof(ContratoFaltaNegocio))]
        ////List<ItemContrato> ObterItensContratoEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens);               
        //List<Historico> ObterItensContratoEmAbertoAgrupados(long numeroContrato, long idPessoa, DateTime dataCalculo, int tipoProposta, long idCalculo = 0);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        //List<ItemContrato> ObterItensContratoEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens);               
        List<ItemContrato> ObterItensContratoEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        LeioutContrato ConsultarLeioutCampanhaDesconto(int idTipoContratoEmptmo);

        //SIG 67808 - Campanha Descontos - Saulo Cirineu
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        double buscaSaldoInadimplente(long numeroContrato, DateTime dataInadimplencia);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        EmptmoDocFinanceiroDTO AtualizarEnvioParcelasInadimplentes(long numeroContrato, DateTime dataVencimento, string origemRecurso, int tipoProposta);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool ValidarData(DateTime dataOperacao);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        string ObterNossoNumeroPorCodDocumento(double codDocumento);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool VerificarDocumentoEmitido(double codDocumento);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        string ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(int codPortForma);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void AtualizarNossoNumero(string nossoNumero, int codPortForma);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void AtualizarNossoNumeroCoddocumento(double codDocumento, string nossoNumero);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Boleto ObterBoletoPorCodDocumento(double codDocumento, int portForma, bool blDocumentoEmitido, int tipoMovimento);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void AtualizarCampoEmisBloqParaS(double codDocumento);

        //SIG 67808 - Campanha Descontos - Matias
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        EmptmoDocFinanceiroDTO RetornarDocumentoEnviado(double idContratoEmptmo, int tipoMovimento, int numParcela, DateTime dataVencimento);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        ContratoDTO BuscarDadosContratoImpressao(long NumeroContrato);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime ObterUltimoDiaUtilBoleto();

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime ObterProximoDiaUtil(DateTime data);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        InformacoesQuitacao CalcularQuitacaoCampanhaDescontos(long numeroContrato, DateTime dataQuitacao, long idCalculo = 0, int tipoProposta = 0);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> buscarHistoricoDePrestacoesEmAberto(long numeroContrato, List<int> prestacoes);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool liberarSuspensao(List<Historico> itens);

        //SIG 48294 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contrato> BuscarContratosParaCancelamento(Contrato contrato, ref ParametrosConsulta parametros);

        //SIG 48294
        [OperationContract()]
        bool VerificarDocumentoBaixado(long NumeroContrato);

        [OperationContract()]
        bool VerificaExistenciaPrestacoes(long NumeroContrato);

        //SIG 63057
        [OperationContract()]
        ContratoDTO ToContratoDTO(RelatorioContrato relatorioContrato);

        [OperationContract()]
        string ObterAmbienteBancoDados();

        //SIG 42330
        [OperationContract()]
        List<Serasa> BuscarContratosInclusaoSerasa(int NumeroRemessa, string Usuario, DateTime DataEventoCobranca);   

        //SIG 42330
        [OperationContract()]
        void GravarDataGeracaoArquivoSerasa(decimal NumeroContrato, int NumeroRemessa, int IdEventoCobranca);

        //SIG 42330
        [OperationContract()]
        int ObterNumeroRemessaArquivo();

        [OperationContract()]
        List<ParametrosCampanha> ObterParametrosCampanha(DateTime? DataInicio, DateTime? DataFim);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void atualizarParametrosCampanha(ParametrosCampanha parametros);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirParametrosCampanha(ParametrosCampanha parametros);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        TipoContrato ObterTipoContrato(long NumeroContrato);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<long> BuscarContratosInadimplentes(int IdPessoa);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        itemPrestacaoDTO BuscarResumoInadimplencia(long NumeroContrato, DateTime DataPrevista);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime diaUltimaAtualizacao(long numeroContrato);
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void AlterarItensSuspensao(HistoricoSuspensao Suspensao);

        //William Santana - SIG 50871 - Início
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<ModeloContratoEmp> consultarModelosContratos(string tipocontrato, DateTime? DataInicioVigencia, ref ParametrosConsulta parametros);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        string InsAltDelModContratos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao);
        //William Santana - SIG 50871 - fim

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        void DesfazerRemessaSerasa(int NumeroRemessa, double IdUsuarioLogado);

        //Sig 21529
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<ContratoRenegociacao> consultarParcelasRenegociacao(IDictionary<String, object> parametros);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        int ContratoDecimoTerceito(string pNumContrato);

        //Sig 21529

        //SIG21529.52136
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        bool DataCreditoPossuiINPC(string pDataCredito);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, double> EncargosDaParcela(ItemContrato parcela, Int64 numeroContrato, DateTime dataLimite, bool IofCalculado);

        //SIG21529.52136
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> ObterItensEmAbertoAgrupadosComData(long numeroContrato);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        EmptmoDocFinanceiroDTO EnviarBoletoBancario(long NumeroContrato, int NumeroParcela, DateTime DataVencimento, int TipoMovimento);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        string VerificarMesRefParcela(long NumeroContrato, int NumeroParcela);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> obterItensEmAberto(long NumeroContrato, int NumeroParcela);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> ObterParcelasEmAberto(long NumeroContrato, DateTime DataLimite);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        void ExecutarRelatorioInadimplencia(long NumeroContrato, DateTime DataLimite);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<Historico> ConsultarItensAbertosAgrupadosPorParcela(long NumeroContrato, DateTime? DataLimite);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<long> BuscarContratosAtivosEncerrados();

        //SIG 129005
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<TipoContrato> ListarTodas();

        //SIG 129005
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        void SalvarMinutasContratosAntigos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao);

        //SIG 129005
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        RelatorioContrato BuscarDadosContratosAutoAtendimento(long NumeroContrato);

        //SIG 129005
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        List<ModeloContratoEmp> ConsultarModelosContratosSemMinuta(int IdMinutaContrato);

        //WO3200
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        void CancelarBloqueioConcessao(int IdPessoa, string UsuarioResponsavel, bool RenegociacaoInadimplencia = false);

        //WO3200
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        void ExcluirEventoCobranca(long NumeroContrato, int IdTipoEventoCobranca);

        //WO3200
        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        bool VerificarRenegociacaoInadP3(long NumeroContrato);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]
        int BuscarQtdParcelasSuspensas(long NumeroContrato);

        [OperationContract, FaultContract(typeof(ContratoFaltaNegocio))]        
        void AtualizarDataArquivoEmLote(List<decimal> contratos, int numeroRemessa, DateTime dataEvento);
    }
}
