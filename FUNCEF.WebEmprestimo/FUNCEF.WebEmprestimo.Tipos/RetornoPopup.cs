using System;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class RetornoPopup
    {
        [DataMember]
        public bool retorno { get; set; }
        [DataMember]
        public string caixaTexto { get; set; }
    }
}
