using System;
using System.Runtime.Serialization;

//Objeto que recebera as informações do contrato que será impresso
namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class ParcelaDescontoCampanha
    {
        [DataMember]
        public int numParcela { get; set; }

        [DataMember]
        public string competencia { get; set; }

        [DataMember]
        public double valorParcela { get; set; }

        [DataMember]
        public double percentualParcela { get; set; }

        [DataMember]
        public double valorFGQC { get; set; }

        [DataMember]
        public double percentualFGQC { get; set; }

        [DataMember]
        public double valorCorrMonet { get; set; }

        [DataMember]
        public double percentualCorrMonet { get; set; }

        [DataMember]
        public double valorJurosRem { get; set; }

        [DataMember]
        public double percentualJurosRem { get; set; }

        [DataMember]
        public double valorJurosMora { get; set; }

        [DataMember]
        public double percentualJurosMora { get; set; }

        [DataMember]
        public double valorMulta { get; set; }

        [DataMember]
        public double percentualMulta { get; set; }

        [DataMember]
        public double valorIOFComplementar { get; set; }

        [DataMember]
        public double percentualIOFComplementar { get; set; }

        [DataMember]
        public double valorTotal { get; set; }

        [DataMember]
        public double valorTotalComDesconto { get; set; }
    }
}
