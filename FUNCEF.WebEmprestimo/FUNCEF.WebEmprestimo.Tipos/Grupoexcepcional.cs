using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    // xavier SOL 178579
    /// <summary>
    /// Classe que representa Grupo Excepcional
    /// </summary>
    [DataContract]
    [Serializable]
    public class Grupoexcepcional
    {
        /// <summary>
        /// Id do grupo excepcional
        /// </summary>
        [DataMember]
        public int idgrupoexcepcional
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição do grupo excepcional
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }

        // xavier SOL 178579
    }
}
