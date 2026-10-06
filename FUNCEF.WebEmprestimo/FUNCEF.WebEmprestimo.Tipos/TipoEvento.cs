using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [Serializable, DataContract]
    public class TipoEvento : TipoEnumeradorBase<int>
    {
        #region Construtor

        private TipoEvento()
        {
        }

        #endregion

        #region Membros

        public static readonly TipoEvento nenhum = new TipoEvento() { chave = -1, descricao = "Nenhum" };
        public static readonly TipoEvento concessao = new TipoEvento() { chave = 0, descricao = "Concessão/Renovação" };
        public static readonly TipoEvento prestacao = new TipoEvento() { chave = 1, descricao = "Prestação" };
        public static readonly TipoEvento amortizacao = new TipoEvento() { chave = 2, descricao = "Amortização/Refinanciamento" };
        public static readonly TipoEvento quitacao = new TipoEvento() { chave = 3, descricao = "Quitação" };
        public static readonly TipoEvento atualizacaoDebito = new TipoEvento() { chave = 4, descricao = "Atualização de Débitos" };
        public static readonly TipoEvento atualizacaoSaldo = new TipoEvento() { chave = 5, descricao = "Atualização de Saldo Devedor" };
        public static readonly TipoEvento importacao = new TipoEvento() { chave = 6, descricao = "Importação/Migração" };
        public static readonly TipoEvento ajustesCobrancaDevolucao = new TipoEvento() { chave = 7, descricao = "Ajustes de Cobrança e Devolução)" };
        public static readonly TipoEvento ajustesSaldoDevedor = new TipoEvento() { chave = 8, descricao = "Ajustes de Saldo Devedor" };

        #endregion
    }
}