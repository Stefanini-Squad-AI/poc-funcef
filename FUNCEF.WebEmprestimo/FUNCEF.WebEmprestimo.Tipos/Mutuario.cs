using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
	/// <summary>
	/// Classe que representa Mutuário
	/// </summary>
    [DataContract]
    [Serializable]
    public class Mutuario 
    {
		/// <summary>
		/// Id da tabela pessoa que representa o mutuário
		/// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Id da tabela pessoa que representa o titular
        /// </summary>
        [DataMember]
        public int idTitular
        {
            get;
            set;
        }

        /// <summary>
        /// CPF do mutuário
        /// </summary>
        [DataMember]
        public string cpf
        {
            get;
            set;
        }

        /// <summary>
        /// Matrícula do mutuário
        /// </summary>
        [DataMember]
        public string matricula
        {
            get;
            set;
        }

        /// <summary>
        /// Nome do mutuário
        /// </summary>
        [DataMember]
        public string nome
        {
            get;
            set;
        }

		/// <summary>
		/// Situacao do participante (mutuário)
		/// </summary>
        [DataMember]
        public string situacao
        {
            get;
            set;
        }

        /// <summary>
        /// Contratos do mutuário
        /// </summary>
        [DataMember]
        public List<Contrato> contratos
        {
            get;
            set;
        }

        /// <summary>
        /// Data de Falecimento do mutuário.
        /// </summary>
        [DataMember]
        public DateTime? dataFalecimento
        {
            get;
            set;
        }

        /// <summary>
        /// Inscrição  Previdanciária do mutuário.
        /// </summary>
        [DataMember]
        public long inscricaoPrevidenciaria
        {
            get;
            set;
        }

        /// <summary>
        /// Dados Bancários do mutuário.
        /// </summary>
        [DataMember]
        public DadosBancarios dadosBancarios
        {
            get;
            set;
        }

        /// <summary>
        /// Plano Previdenciario do mutuário.
        /// </summary>
        [DataMember]
        public PlanoPrevidenciario plano
        {
            get;
            set;
        }

        /// <summary>
        /// Patrocinadora do mutuário.
        /// </summary>
        [DataMember]
        public Patrocinadora patrocinadora
        {
            get;
            set;
        }

        /// <summary>
        /// Tipo do mutuário.
        /// </summary>
        [DataMember]
        public string tipo
        {
            get;
            set;
        }
        // xavier alterar a assinatura da regra 6170 conforme e-mail
        /// <summary>
        /// Flag interno da Situação do Participante.
        /// </summary>
        [DataMember]
        public string flginternoParticipante
        {
            get;
            set;
        }

        /// <summary>
        /// Situação do plano do participante.
        /// </summary>
        [DataMember]
        public int idsitpart
        {
            get;
            set;
        }
        // xavier alterar a assinatura da regra 6170 conforme e-mail 

        [DataMember]
        public string RG
        {
            get;
            set;
        }

        [DataMember]
        public string Email
        {
            get;
            set;
        }

        [DataMember]
        public int IdPessoa
        {
            get;
            set;
        }
    }
}