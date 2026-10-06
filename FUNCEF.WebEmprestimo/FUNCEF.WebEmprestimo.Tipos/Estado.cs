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
    public class UF
    {

        [DataMember]
        public Int32 idEstado
        {
            get;
            set;
        }

        [DataMember]
        public string codEstado
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
