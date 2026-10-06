using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Forma de pagamento
    /// </summary>
    [DataContract]
    [Serializable]
    public class FormaPagamento
    {

        /// <summary>
        /// Código da forma de pagamento.
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Código da forma de pagamento.
        /// </summary>
        [DataMember]
        public int idForma
        {
            get;
            set;
        }

        /// <summary>
        /// Código da forma de pagamento.
        /// </summary>
        [DataMember]
        public string recPag
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição da forma de pagamento.
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }

        /// <summary>
        /// Código da forma da pessoa.
        /// </summary>
        public int idPessoa
        {
            get;
            set;

        }
    }
}