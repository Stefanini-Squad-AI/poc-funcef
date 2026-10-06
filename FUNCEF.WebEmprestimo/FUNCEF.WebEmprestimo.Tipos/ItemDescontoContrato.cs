using System;
using System.Runtime.Serialization;

//Objeto que recebera as informações do contrato que será impresso
namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class ItemDescontoContrato
    {
        [DataMember]
        public string descItem { get; set; }

        [DataMember]
        public int idItem { get; set; }

        [DataMember]
        public double valorNominal { get; set; }

        [DataMember]
        public double percentualDesconto { get; set; }

        [DataMember]
        public double valorComDesconto { get; set; }
        [DataMember]
        public double valorDesconto { get; set; }
    }
}
