using System;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class UF
    {
        [DataMember]
        public Int32 idEstado { get; set; }

        [DataMember]
        public string codEstado { get; set; }

        [DataMember]
        public string nome { get; set; }
    }
}
