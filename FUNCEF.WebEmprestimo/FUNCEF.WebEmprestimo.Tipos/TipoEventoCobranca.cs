using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class TipoEventoCobranca
    {
        [DataMember]
        public int id
        {
            get;
            set;
        }

        [DataMember]
        public string descricao
        {
            get;
            set;
        }

    }
}
