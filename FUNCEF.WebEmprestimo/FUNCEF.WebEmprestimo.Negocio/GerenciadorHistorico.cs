using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.Componentes.Utilidades;

using FUNCEF.Planus.Componentes;//William Moreira da Silva - SOL 207977

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que gerencia Histórico.
    /// </summary>
    public class GerenciadorHistorico
    {
        #region Atributos

        private IAcessoHistorico acesso = FabricaObjetos.instancia.obterAcessoHistorico();

        #endregion

        /// <summary>
        /// Excluir histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        public void excluir(long idHistorico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluir(idHistorico);
                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Inclui histórico do contrato.
        /// </summary>
        /// <param name="historico"></param>
        public void incluir(List<Historico> historico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                foreach (Historico item in historico)
                {
                    if (item.item.valor == 0)
                    {
                        if (item.item.gravaZero == 1)
                            acesso.incluir(item);
                    }
                    else
                    {
                        acesso.incluir(item);
                    }
                }

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Inclui histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        public void incluirNovo(List<Historico> historico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                foreach (Historico item in historico)
                {

                    if (item.valorPrevisto == 0)
                    {
                        if (item.gravaZero == 1)
                        {
                            acesso.incluirNovo(item);
                        }
                    }
                    else
                    {
                        acesso.incluirNovo(item);
                    }
                }

                //Completa a transação
                transacao.Complete();
            }
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o item foi enviado para a folha.
        /// </summary>
        /// <param name="idHistMovEmptmo"></param>
        /// <returns></returns>
        public void verificaSitEnvio(List<long> ids)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                for (int i = 0; i < ids.Count; i++)
                {
                    int sitenvio = acesso.verificaSitEnvio(ids[i]);
                    if (sitenvio == 0)
                    {
                        throw new ExcecaoPlanus("Pelo menos um dos itens selecionados está enviado para folha aguardando recebimento. Não será possível realizar o processo.");
                    }
                    if (sitenvio == 2)
                    {
                        throw new ExcecaoPlanus("Pelo menos um dos itens selecionados já foi recebido na folha. Não será possível realizar o processamento.");
                    }
                }
                transacao.Complete();
            }
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        public bool verificaItensRecebidoseBaixados(List<Historico> itensTratados)
        {
            return acesso.verificaItensRecebidoseBaixados(itensTratados);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        public bool verificaItemRecebidoseBaixados(Historico itemTratado)
        {
            return acesso.verificaItemRecebidoseBaixados(itemTratado);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Inseri os novos itens e altera o vencimento do que já existem
        /// </summary>
        /// <param name="itensaTratar">Itens que serão alterados</param>
        public void gravarAlteracoesHistorico(List<Historico> itensaTratar, int funcionalidade)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Historico> itensaInserir = itensaTratar.Where(t1 => t1.id == 0).ToList();

                if (itensaInserir.Count != 0)
                {
                    this.incluirNovo(itensaInserir);
                }

                List<Historico> itensaAlterar = itensaTratar.Where(t1 => t1.id != 0).ToList();

                if (itensaAlterar.Count != 0)
                {
                    foreach (var item in itensaAlterar)
                    {
                        if ((item.centraliza == 1) && (funcionalidade == 5 || funcionalidade == 6))
                        {
                            acesso.atualizarHistoricoSuspensaoItensCentralizados(item);
                        }
                        else
                        {
                            this.atualizarHistorico(item);
                        }
                    }
                }
                transacao.Complete();
            }
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// 
        /// </summary>
        /// <param name="historico"></param>
        public void atualizarHistoricoSuspensaoItensCentralizados(Historico historico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.atualizarHistoricoSuspensaoItensCentralizados(historico);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Atualizar histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        public void atualizarHistorico(Historico historico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.atualizarHistorico(historico);

                //Completa a transação
                transacao.Complete();
            }
        }



        /// <summary>
        /// Consulta o histórico do contrato.
        /// </summary>
        /// <param name="historico"></param>
        public List<Historico> consultar(Historico historico, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (historico == null)
                    throw new ArgumentNullException("historico");

                List<Historico> historicos = acesso.consultar(historico, ref parametros);

                //Completa a transação
                transacao.Complete();

                return historicos;
            }
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Consultar detalhes do item do historico
        /// </summary>
        /// <param name="idHistorico"></param>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public Historico consultarDetalheContrato(long idHistorico, long numeroContrato)
        {
            return acesso.consultarDetalhe(idHistorico, numeroContrato);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se alguma da parcelas selecionadas já foi tratada anteriormente
        /// </summary>
        /// <param name="parcelas">Parcelas a serem verificadas</param>
        /// <param name="numeroContrato">Numero do Contrato</param>
        /// <param name="data">data em que a parcela foi tratada</param>
        /// <returns>Verdadeiro se a parcela já tiver sido tratada</returns>
        public bool verificaParcelaTratada(List<int> parcelas, long numeroContrato, ref DateTime data, ref DateTime dataVencimento)
        {
            return acesso.verificaParcelaTratada(parcelas, numeroContrato, ref data, ref dataVencimento);
        }

        /// <summary>
        /// Consulta um Histórico
        /// </summary>
        /// <param name="historico">ID do Histórico</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o históricos encontrado.</returns>
        public Historico consultarDetalheContrato(long idHistorico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Historico historico = acesso.consultarDetalhe(idHistorico);

                #region Flags

                historico.flags = new List<Flag>();
                if (historico.envio == null)
                    historico.flags.Add(new Flag("Envio"));
                if (historico.baixado == null)
                    historico.flags.Add(new Flag("Baixado"));
                if (historico.baixaManual == 1)
                    historico.flags.Add(new Flag("Baixa Manual"));
                if (historico.suspenso == 1)
                    historico.flags.Add(new Flag("Suspenso"));
                if (historico.estorno == 1)
                    historico.flags.Add(new Flag("Estorno"));
                if (historico.abonado == 1)
                    historico.flags.Add(new Flag("Abonado"));
                if (historico.quitado == 1)
                    historico.flags.Add(new Flag("Quitado"));
                if (historico.centraliza == 1)
                    historico.flags.Add(new Flag("Centraliza"));
                if (historico.destacado == 1)
                    historico.flags.Add(new Flag("Destacado"));
                if (historico.divergencia == 1)
                    historico.flags.Add(new Flag("Divergência"));
                if (historico.divergenciaTratada == 1)
                    historico.flags.Add(new Flag("Divergência Tratada"));

                #endregion

                //Completa a transação
                transacao.Complete();

                return historico;
            }
        }

        /// <summary>
        /// Altera a observação do histórico.
        /// </summary>
        /// <param name="idHistorico">ID do histórico.</param>
        /// <param name="observacao">Observação do Histórico.</param>
        public void alterarObservacao(long idHistorico, string observacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarObservacao(idHistorico, observacao);

                //Completa a transação
                transacao.Complete();
            }
        }

        public List<Historico> consultarHistoricoEnvio(long idHistorico)
        {
            List<Historico> lista = new List<Historico>();

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                lista = acesso.consultarHistoricoEnvio(idHistorico);

                //Completa a transação
                transacao.Complete();
            }

            return lista;
        }

        public List<Historico> consultarEventoCobranca(long idContrato, long? idEvento)
        {
            List<Historico> lista = new List<Historico>();

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                lista = acesso.consultarEventoCobranca(idContrato, idEvento);

                //Completa a transação
                transacao.Complete();
            }

            return lista;

        }

        public List<Historico> consultarParcelaCobranca(long idContrato, int idTipoEvento, DateTime dataEvento)
        {

            List<Historico> lista = new List<Historico>();

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                lista = acesso.consultarParcelaCobranca(idContrato, idTipoEvento, dataEvento);

                //Completa a transação
                transacao.Complete();
            }

            return lista;


        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verificar se existema itens não recebidos 
        /// </summary>
        /// <param name="idHistoricos"></param>
        /// <returns>retona true se existir algum item que tenha sido recebido</returns>
        public bool existeItensNaoRecebidos(List<long> idHistoricos)
        {
            bool retorno;

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                retorno = acesso.existeItensNaoRecebidos(idHistoricos);
                transacao.Complete();
            }
            return retorno;
        }

        //William Moreira da Silva - SOL 207977
        public int consultaQuantItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            return acesso.consultaQuantItensAberto(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos);
        }


        public Historico consultarHistoricoChaveMestre(long idHistorico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Historico historico = acesso.consultarHistoricoChaveMestre(idHistorico);

                //Completa a transação
                transacao.Complete();

                return historico;
            }

        }

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
        public List<Historico> consultarItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Historico> historico = acesso.consultarItensAberto(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos);

                transacao.Complete();

                return historico;
            }
        }

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
        public List<Historico> consultarItensAbertoParticionado(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Historico> historico = acesso.consultarItensAbertoParticionado(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos, index);

                transacao.Complete();

                return historico;
            }
        }

        //SIG 67808 - Campanha Descontos - Matias
        public List<Historico> ConsultarItensAbertosParticionadoAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Historico> historico = acesso.ConsultarItensAbertosParticionadoAgrupados(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos, index);

                transacao.Complete();

                return historico;
            }
        }

        //SIG 67808 - Campanha Descontos - Matias
        public List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Historico> historico = acesso.ConsultarItensAbertosAgrupados(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos);

                transacao.Complete();

                return historico;
            }
        }

        //Campanha Desconto
        public List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, long idPessoa, DateTime dataCalculo, int tipoProposta, long idCalculo = 0)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Historico> historico = acesso.ConsultarItensAbertosAgrupados(numeroContrato, idPessoa, dataCalculo, tipoProposta, idCalculo);

                transacao.Complete();

                return historico;
            }
        }
        public EmptmoDocFinanceiroDTO AtualizarEnvioParcelasInadimplentes(long numeroContrato, DateTime dataVencimento, string origemRecurso, int tipoProposta)
        {
            //using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            //{
            EmptmoDocFinanceiroDTO DocumentoFinanceiro = acesso.AtualizarEnvioParcelasInadimplentes(numeroContrato, dataVencimento, string.Empty, tipoProposta);

            //transacao.Complete();

            return DocumentoFinanceiro;
            //}
        }

        public bool ValidarData(DateTime dataOperacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool resultado = acesso.ValidarData(dataOperacao);

                transacao.Complete();

                return resultado;
            }
        }

        public List<Historico> buscarHistoricoDePrestacoesEmAberto(long numeroContrato, List<int> prestacoes)
        {
            return acesso.buscarHistoricoDePrestacoesEmAberto(numeroContrato, prestacoes);
        }

        public bool liberarSuspensao(List<Historico> itens)
        {
            return acesso.liberarSuspensao(itens);
        }

        public List<Historico> ConsultarItensAbertosAgrupadosPorParcela(long NumeroContrato, DateTime? DataLimite)
        {
            return acesso.ConsultarItensAbertosAgrupadosPorParcela(NumeroContrato, DataLimite);
        }


        
    }
}