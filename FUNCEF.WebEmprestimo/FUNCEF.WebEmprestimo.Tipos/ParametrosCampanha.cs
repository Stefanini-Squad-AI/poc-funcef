using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class ParametrosCampanha
    {
        [DataMember]
        public long IdCampanha { get; set; }
        [DataMember]
        public int IdTipoPropostaCampanha { get; set; }
        [DataMember]
        public string TipoPropostaCampanha { get; set; }
        [DataMember]
        public DateTime DataInicio { get; set; }
        [DataMember]
        public DateTime DataFim { get; set; }
    }
}
