using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Outras Dividas
    /// </summary>
    [DataContract]
    [Serializable]
    public class OutrasDividas
    {
        [DataMember]
        public string tipo
        {
            get;
            set;
        }

        [DataMember]
        public double valorCalculado
        {
            get;
            set;
        }
        // SOL 199759
        [DataMember]
        public string mesReferencia
        {
            get;
            set;
        }
        [DataMember]
        public string mesCobranca
        {
            get;
            set;
        }
        [DataMember]
        public DateTime dataPrevista
        {
            get;
            set;
        }
        [DataMember]
        public int parcela
        {
            get;
            set;
        }

        // SOL 199759
    }
}