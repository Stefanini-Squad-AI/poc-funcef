using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Mutuário
    /// </summary>
    [DataContract]
    [Serializable]
    public class Cidade
    {

        [DataMember]
        public Int32 idCidade
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

        //William Moreira da Silva
        //[DataMember]
        //public string estado
        //{
        //    get;
        //    set;
        //}
        [DataMember]
        public UF estado
        {
            get;
            set;
        }

        [DataMember]
        public Pais pais
        {
            get;
            set;
        }
        //public string pais
        //{
        //    get;
        //    set;
        //}
        //William Moreira da Silva
    }
}
