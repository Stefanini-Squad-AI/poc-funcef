using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Mutuário
    /// </summary>
    [DataContract]
    [Serializable]
    public class Pais
    {

        [DataMember]
        public Int32 idPais
        {
            get;
            set;
        }

        [DataMember]
        public string nome
        {
            get;
            set;
        }

    }
}