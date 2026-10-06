using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Representa as informações de ordenação das consultas.
    /// </summary>
    [DataContract]
    [Serializable]
    public sealed class Ordenacao
    {
        #region Propriedades

        /// <summary>
        /// Obtém ou atribui o critério de ordenação.
        /// </summary>
        [DataMember]
        public string criterio
        {
            get;
            set;
        }

        #endregion
    }
}
