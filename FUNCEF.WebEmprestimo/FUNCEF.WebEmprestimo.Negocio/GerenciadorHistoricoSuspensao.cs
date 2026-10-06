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
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que gerencia historico de suspensão de um contrato.
    /// </summary>
    public class GerenciadorHistoricoSuspensao
    {
        #region Atributos

        private IAcessoHistoricoSuspensao acesso = FabricaObjetos.instancia.obterAcessoHistoricoSuspensao();

        #endregion

        /// <summary>
        /// Alterar registro no histórico de suspensão passando o histórico de suspensão.
        /// </summary>
        /// <param name="historico">Dados da suspensão</param>
        public void alterar(HistoricoSuspensao historico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                historico.usuarioLogado = Contexto.obterUsuario();
                acesso.alterar(historico);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Verifica a existencia de uma suspensão ativa.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificarSuspensaoAtiva(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoVerificacao = acesso.verificarSuspensaoAtiva(numeroContrato);

                transacao.Complete();
                return retornoVerificacao;
            }
        }

        /// <summary>
        /// Verifica se algum tem contrato ativo
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public bool verificaContratoAtivo(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool existeContratoAtivo = acesso.verificaContratoAtivo(numeroContrato);

                transacao.Complete();
                return existeContratoAtivo;
            }

        }

        /// <summary>
        /// Verifica se teve suspensão no periodo cadastrado
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public bool verificaSuspensaoPeriodo(long numeroContrato, DateTime dataIni, DateTime dataFim)//William Moreira da Silva SOL161447 
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoVerificacao = acesso.verificaSuspensaoPeriodo(numeroContrato, dataIni, dataFim);

                transacao.Complete();
                return retornoVerificacao;
            }

        }//William Moreira da Silva SOL161447

        /// <summary>
        /// Inclui historico de suspensão de um contrato.
        /// </summary>
        /// <param name="historioSuspensao">Dados da suspensão.</param>
        public void incluir(HistoricoSuspensao historico)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                historico.usuarioLogado = Contexto.obterUsuario();
                acesso.incluir(historico);

                //Completa a transação
                transacao.Complete();
            }
        }

        public int BuscarQtdParcelasSuspensas(long NumeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {               
              int qtdParcelasSuspensas = acesso.BuscarQtdParcelasSuspensas(NumeroContrato);
                
              transacao.Complete();
              return qtdParcelasSuspensas;
            }
        }

    }
}