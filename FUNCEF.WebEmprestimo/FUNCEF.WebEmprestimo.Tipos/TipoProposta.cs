using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class TipoProposta
    {
        [DataMember]
        public int id { get; set; }
        [DataMember]
        public string descricao { get; set; }
    }
}
