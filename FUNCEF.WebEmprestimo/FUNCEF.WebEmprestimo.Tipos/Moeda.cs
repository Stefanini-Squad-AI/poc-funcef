using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Moeda
    /// </summary>
    [DataContract]
    [Serializable]
    public class Moeda
    {
        /// <summary>
        /// Código da moeda
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição da moeda
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }

        /// <summary>
        /// Sigla da moeda
        /// </summary>
        [DataMember]
        public string sigla
        {
            get;
            set;
        }

        /*[DataMember] Saulo - FUNCEF - Moeda não pode possuir contrato
        public Contrato contrato
        {
            get;
            set;
        }*/
    }
}