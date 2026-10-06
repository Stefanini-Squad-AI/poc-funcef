using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Reflection;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class LogContrato
    {
        [DataMember]
        public int? id
        {
            get;
            set;
        }
        
        [DataMember]
        public long idPlanus
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

        [DataMember]
        public long? numeroContrato
        {
            get;
            set;
        }

        [DataMember]
        public long? idHistorico
        {
            get;
            set;
        }

        [DataMember]
        public Origem origem
        {
            get;
            set;
        }

        [DataMember]
        public string versao
        {
            get;
            set;
        }

        [DataMember]
        public DateTime data
        {
            get;
            set;
        }

        [DataMember]
        public int modulo
        {
            get { return 15; }
            set { }
        }

        [DataMember]
        public Usuario usuario
        {
            get;
            set;
        }
    }
}