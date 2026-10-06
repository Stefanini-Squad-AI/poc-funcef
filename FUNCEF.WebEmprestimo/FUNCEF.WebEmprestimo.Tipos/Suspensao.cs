using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Suspensão
    /// </summary>
    [DataContract]
    [Serializable]
    public class Suspensao
    {
        //Saulo
        /// <summary>
        /// Identificador da Suspensão
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição da Suspensão
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }

        /// <summary>
        /// Tipo da Suspensão
        /// </summary>
        [DataMember]
        public TipoSuspensao tipo
        {
            get;
            set;
        }

        /// <summary>
        /// Data do inicio da suspensão.
        /// </summary>
        [DataMember]
        public DateTime dataInicio
        {
            get;
            set;
        }

        /// <summary>
        /// Data do final da suspensão.
        /// </summary>
        [DataMember]
        public DateTime? dataFinal
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição do motivo da suspensão.
        /// </summary>
        [DataMember]
        public string motivosSuspensao
        { 
            get; 
            set; 
        }
    }
}