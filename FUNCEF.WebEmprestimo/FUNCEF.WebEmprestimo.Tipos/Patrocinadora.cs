using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Patrocinadora
    /// </summary>
    [DataContract]
    [Serializable]
    public class Patrocinadora
    {
        /// <summary>
        /// Código da patrocinadora
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Nome da patrocinadora
        /// </summary>
        [DataMember]
        public string nome
        {
            get;
            set;
        }

        //Saulo - FUNCEF : Patrocinadora não possui contrato
        /*[DataMember] 
        public Contrato contrato
        {
            get;
            set;
        }*/

        /// <summary>
        /// Situação Funcional
        /// </summary>
        [DataMember]
        public string situacaoFuncional
        {
            get;
            set;
        }        

        /// <summary>
        /// Nome Cedido
        /// </summary>
        [DataMember]
        public string nomeCedido
        {
            get;
            set;
        }
    }
}