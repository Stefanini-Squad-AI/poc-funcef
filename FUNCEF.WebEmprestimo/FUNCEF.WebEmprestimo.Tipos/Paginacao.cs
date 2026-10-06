using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Representa as informações de paginação das consultas.
    /// </summary>
    [DataContract]
    [Serializable]
    public sealed class Paginacao
    {
        #region Propriedades

        /// <summary>
        /// Obtém ou atribui o índice da linha inicial a ser retornada.
        /// </summary>
        [DataMember]
        public int indiceLinha
        {
            get;
            set;
        }

        /// <summary>
        /// Obtém ou atribui o máximo de linhas a serem retornadas.
        /// </summary>
        [DataMember]
        public int maximoLinhas
        {
            get;
            set;
        }

        #endregion
    }
}
