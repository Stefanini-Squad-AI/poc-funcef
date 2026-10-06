using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa valores de um contrato
    /// </summary>
    [DataContract]
    [Serializable]
    public class ValoresContrato
    {

        [DataMember]
        public double saldoDevedorAnterior
        {
            get;
            set;
        }

        [DataMember]
        public double taxaJurosAnterior
        {
            get;
            set;
        }

        [DataMember]
        public int parcelaAnterior
        {
            get;
            set;
        }

        [DataMember]
        public int parcelaRestanteAnterior
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataAtualizacaoAnterior
        {
            get;
            set;
        }


        [DataMember]
        public double saldoDevedorPosterior
        {
            get;
            set;
        }

        [DataMember]
        public double taxaJurosPosterior
        {
            get;
            set;
        }

        [DataMember]
        public int parcelaPosterior
        {
            get;
            set;
        }

        [DataMember]
        public int parcelaRestantePosterior
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataAtualizacaoPosterior
        {
            get;
            set;
        }

    }
}
