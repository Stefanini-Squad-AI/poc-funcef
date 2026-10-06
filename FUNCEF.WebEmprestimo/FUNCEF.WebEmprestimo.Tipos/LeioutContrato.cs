using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class LeioutContrato
    {
        [DataMember]
        public int idContratoEmptmo { get; set; }

        [DataMember]
        public byte[] leioutContrato { get; set; }

        //Campanha Desconto
        [DataMember]
        public string linkPortalFuncef { get; set; }

    }
}
