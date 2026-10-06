using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Plano Previdenciario
    /// </summary>
    [DataContract]
    [Serializable]
    public class PlanoPrevidenciario
    {
        /// <summary>
        /// Código do Plano Previdenciário
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição do plano previdenciário
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }

        //Saulo - FUNCEF: plano não possui contrato
        /*[DataMember]
        public Contrato contrato
        {
            get;
            set;
        }*/

        /// <summary>
        /// Situação do plano previdenciário
        /// </summary>
        [DataMember]
        public string situacao
        {
            get;
            set;
        }

        /// <summary>
        /// Plano Origem
        /// </summary>
        [DataMember]
        public string planoOrigem
        {
            get;
            set;
        }

        /// <summary>
        /// Id plano Origem
        /// </summary>
        [DataMember]
        public int IdPlanoOrigem
        {
            get;
            set;
        }

        /// <summary>
        /// Flag Interno da situação do plano
        /// </summary>
        [DataMember]
        public string flagInterno
        {
            get;
            set;
        }
    }
}