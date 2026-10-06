using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que Representa Operação para execução das regras
    /// </summary>
    [Serializable, DataContract]
    public class TipoOperacao : TipoEnumeradorBase<int>
    {
                
        #region Construtor

        private TipoOperacao()
        {
        }

        #endregion

        #region Membros

        public static readonly TipoOperacao concessao = new TipoOperacao() { chave = 1, descricao = "Concessão" };
        public static readonly TipoOperacao quitacaoConcessao = new TipoOperacao() { chave = 2, descricao = "Quitação por Concessão" };
        public static readonly TipoOperacao alteracaoPrazo = new TipoOperacao() { chave = 3, descricao = "Alterãção Prazo Contratual" };
        public static readonly TipoOperacao suspensaoParcelas = new TipoOperacao() { chave = 4, descricao = "Suspensão de Parcelas" };
        public static readonly TipoOperacao amortizacao = new TipoOperacao() { chave = 5, descricao = "Amortização" };
        public static readonly TipoOperacao alteracaoConta = new TipoOperacao() { chave = 6, descricao = "Alteração Conta Corrente" };
        public static readonly TipoOperacao consultaContrato = new TipoOperacao() { chave = 7, descricao = "Consulta Contrato" };
        public static readonly TipoOperacao quitacao = new TipoOperacao() { chave = 8, descricao = "Quitação Antecipada" };
        public static readonly TipoOperacao quitacaoMorte = new TipoOperacao() { chave = 9, descricao = "Quitação por Morte" };
        public static readonly TipoOperacao quitacaoDesligamento = new TipoOperacao() { chave = 10, descricao = "Quitação por Desligamento" };
 
        #endregion

    }
}
