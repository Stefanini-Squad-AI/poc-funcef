using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Amortização.
    /// </summary>
    [DataContract]
    [Serializable]
    public class Amortizacao
    {
        /// <summary>
        /// Data de Amortizacao
        /// </summary>
        public DateTime dataAmortizacao
        {
            get;
            set;
        }

        /// <summary>
        /// Data limite para amortização
        /// </summary>
        public DateTime dataLimite
        {
            get;
            set;
        }
    }
}