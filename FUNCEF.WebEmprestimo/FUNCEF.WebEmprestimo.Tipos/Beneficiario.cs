using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
	/// <summary>
	/// Classe que representa o Beneficiário do seguro.
	/// </summary>
    [DataContract]
    [Serializable]
    public class Beneficiario
    {
        /// <summary>
        /// Id do beneficiário do seguro.
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Nome do beneficiário do seguro
        /// </summary>
        [DataMember]
        public string nome
        {
            get;
            set;
        }

        /// <summary>
        /// Dados Bancários do beneficiário
        /// </summary>
        [DataMember]
        public DadosBancarios dadosBancarios
        {
            get;
            set;
        }

        /// <summary>
        /// Percentual do beneficiário.
        /// </summary>
        [DataMember]
        public double percentual
        {
            get;
            set;
        }

        /// <summary>
        /// Outras Informações do beneficiário.
        /// </summary>
        [DataMember]
        public string outrasInformacoes
        {
            get;
            set;
        }

        /// <summary>
        /// Valor da Fundação do benefiário.
        /// </summary>
        [DataMember]
        public double? valorFundacao
        {
            get;
            set;
        }

        /// <summary>
        /// Valor do Benefício.
        /// </summary>
        [DataMember]
        public double? valorBeneficio
        {
            get;
            set;
        }

        /// <summary>
        /// Data do Depósito.
        /// </summary>
        [DataMember]
        public DateTime? dataDeposito
        {
            get;
            set;
        }
    }
}