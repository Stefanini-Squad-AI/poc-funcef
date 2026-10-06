using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Representa Campos que foram alterados, informação Atual e Anterior.
    /// </summary>
    [DataContract]
    [Serializable]
    public sealed class CamposAlterados
    {
        #region Propriedades
        /// <summary>
        /// Nome do campo.
        /// </summary>
        [DataMember]
        public string nome
        {
            get;
            set;
        }

        /// <summary>
        /// Informacao Atual.
        /// </summary>
        [DataMember]
        public string informacaoAtual
        {
            get;
            set;
        }

        /// <summary>
        /// Informacao Anterior.
        /// </summary>
        [DataMember]
        public string informacaoAnterior
        {
            get;
            set;
        }

        #endregion

    }
}
