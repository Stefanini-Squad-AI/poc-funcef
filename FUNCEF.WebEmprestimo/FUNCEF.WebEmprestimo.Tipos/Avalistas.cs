using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Avalistas
    /// </summary>
    [DataContract]
    [Serializable]
    public class Avalistas
    {
        [DataMember]
        public string nome
        {
            get;
            set;
        }

        [DataMember]
        public string origem
        {
            get;
            set;
        }

        [DataMember]
        public string razaoSocial
        {
            get;
            set;
        }

        [DataMember]
        public String cpf
        {
            get;
            set;
        }
        [DataMember]
        public double renda
        {
            get;
            set;
        }
        [DataMember]
        public double margem
        {
            get;
            set;
        }

        [DataMember]
        public Int32 id
        {
            get;
            set;
        }

        //William Moreira da Silva - SOL 143476/16437
        [DataMember]
        public string nomeConjugue
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idConjugue
        {
            get;
            set;
        }

        [DataMember]
        public bool eConjuge
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 143476/16437
    }
}
