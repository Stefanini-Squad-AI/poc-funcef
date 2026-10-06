using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class Usuario
    {
        [DataMember]
        public int? id
        {
            get;
            set;
        }

        [DataMember]
        public string login
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