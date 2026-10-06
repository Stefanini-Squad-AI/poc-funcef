using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Tipo de Recurso
    /// </summary>
    [DataContract]
    [Serializable]
    public class TipoRecurso
    {
        /// <summary>
        /// Código do tipo de empréstimo
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição do tipo de empréstimo
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }
    }
}