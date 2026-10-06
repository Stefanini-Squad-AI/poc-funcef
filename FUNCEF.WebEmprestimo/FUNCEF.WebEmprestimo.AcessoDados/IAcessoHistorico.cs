using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados de histórico.
    /// </summary>
    public interface IAcessoHistorico : IObjetoAcesso
    {
        /// <summary>
        /// Inclui histórico do contrato.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        void incluir(Historico historico);

        /// <summary>
        /// Excluir histórico do contrato.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        void excluir(long idHistorico);

        /// <summary>
        /// Inclui histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        void incluirNovo(Historico historico);

        /// <summary>
        /// atualizar histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        void atualizarHistorico(Historico historico);

        /// <summary>
        /// Atualiza o historico do contrato com uma suspensao.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        void atualizarHistoricoAbono(Historico historico);

        /// <summary>
        /// Atualiza o historico do contrato com uma suspensao.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        void atualizarHistoricoSuspensaoItensCentralizados(Historico historico);

        /// <summary>
        /// Método para o retorno dos itens em aberto da Fucionalidade de tratamento individual de Parcelas
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato a ser tratado</param>
        /// <param name="idTipoContrato">Identificação do tipo de contrato</param>
        /// <param name="itensBaixadosManualmente">bool para mostrar itens baixados manualmente</param>
        /// <param name="itensSuspensos">bool para mostrar apenas itens suspensos</param>
        /// <param name="itensPrestEncargos">bool para mostrar itens de pestações e encargos</param>
        /// <param name="itensSuspensos">bool para não mostrar itens suspensos</param>
        /// <returns>Lista dos itens em aberto</returns>
        //William Moreira da Silva - SOL 207977 PPM
        List<Historico> consultarItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos);

        /// <summary>
        /// Verifica se um item pertence a um documento ainda não baixado
        /// </summary>
        /// <param name="idItemhistorico">ID do item na HistMovEmptmo</param>
        /// <returns>Retorna true se o item pertencer a um documento não baixado</returns>
        //William Moreira da Silva - SOL 207977 PPM
        bool verificaItemDocumento(long idItemhistorico);

        /// <summary>
        /// Consulta histórico do contrato.
        /// </summary>
        /// <param name="historico"></param>
        List<Historico> consultar(Historico historico, ref ParametrosConsulta parametros);

        /// <summary>
        /// Consulta um histórico
        /// </summary>
        /// <param name="historico">ID do Histórico</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o históricos encontrado.</returns>
        Historico consultarDetalhe(long idHistorico);

        //207977
        /// <summary>
        /// Consulta um histórico
        /// </summary>
        /// <param name="historico">ID do Histórico</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o históricos encontrado.</returns>
        Historico consultarDetalhe(long idHistorico, long numeroContrato);


        /// <summary>
        /// Consulta um histórico
        /// </summary>
        /// <param name="historico">ID do Histórico</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o históricos encontrado.</returns>
        Historico consultarHistoricoChaveMestre(long idHistorico);


        /// <summary>
        /// Altera a observação do histórico.
        /// </summary>
        /// <param name="idHistorico">ID do histórico.</param>
        /// <param name="observacao">Observação do Histórico.</param>
        void alterarObservacao(long idHistorico, string observacao);

        /// <summary>
        /// Consultar histórico de itens enviados
        /// </summary>
        /// <param name="idHistorico">ID do histórico.</param>
        /// <returns>Históricos de envio</returns>
        List<Historico> consultarHistoricoEnvio(long idHistorico);

        List<Historico> consultarEventoCobranca(long idContrato, long? idEvento);

        List<Historico> consultarParcelaCobranca(long idContrato, int idTipoEvento, DateTime dataEvento);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o item foi enviado para a folha.
        /// </summary>
        /// <param name="idHistMovEmptmo"></param>
        /// <returns>0 para aguardando processamento e 2 para item recebido</returns>
        int verificaSitEnvio(long idHistMovEmptmo);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verificar se existema itens não recebidos 
        /// </summary>
        /// <param name="idHistoricos"></param>
        /// <returns>retona true se existir algum item que tenha sido recebido</returns>
        bool existeItensNaoRecebidos(List<long> idHistoricos);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se alguma da parcelas selecionadas já foi tratada anteriormente
        /// </summary>
        /// <param name="parcelas">Parcelas a serem verificadas</param>
        /// <param name="numeroContrato">Numero do Contrato</param>
        /// <param name="data">data em que a parcela foi tratada</param>
        /// <returns>Verdadeiro se a parcela já tiver sido tratada</returns>
        bool verificaParcelaTratada(List<int> parcelas, long numeroContrato, ref DateTime data, ref DateTime dataVencimento);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        bool verificaItensRecebidoseBaixados(List<Historico> itensTratados);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        bool verificaItemRecebidoseBaixados(Historico itemTratado);

        //William Moreira da Silva - SOL 207977
        int consultaQuantItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos);

        //William Moreira da Silva - SOL 207977
        List<Historico> consultarItensAbertoParticionado(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index);

        //Campanha Desconto
        //SIG 67808 - Campanha Descontos - Matias
        List<Historico> ConsultarItensAbertosParticionadoAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index);

        //SIG 67808 - Campanha Descontos - Matias
        List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos);

        //SIG 67808 - Campanha Descontos - Matias
        List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, long idPessoa, DateTime dataCalculo, int tipoProposta, long idCalculo = 0);

        EmptmoDocFinanceiroDTO AtualizarEnvioParcelasInadimplentes(long idContratoEmptmo, DateTime DataVencimento, string origemRecurso, int tipoProposta);

        bool ValidarData(DateTime dataOperacao);

        //Campanha Desconto
        List<Historico> buscarHistoricoDePrestacoesEmAberto(long numeroContrato, List<int> prestacoes);

        bool liberarSuspensao(List<Historico> itens);

        List<Historico> ConsultarItensAbertosAgrupadosPorParcela(long NumeroContrato, DateTime? DataLimite);
    }
}
