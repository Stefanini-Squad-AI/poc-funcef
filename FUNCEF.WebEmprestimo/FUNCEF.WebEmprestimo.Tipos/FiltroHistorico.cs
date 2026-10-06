using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa filtro do histórico.
    /// </summary>
    [DataContract]
    [Serializable]
    public class FiltroHistorico
    {
        [DataMember]
        public bool internos
        {
            get;
            set;
        }

        [DataMember]
        public int emAberto
        {
            get;
            set;
        }

        [DataMember]
        public int estorno
        {
            get;
            set;
        }

        [DataMember]
        public bool atualizacaoDiaria
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataPrevistaDe
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataPrevistaAte
        {
            get;
            set;
        }

        [DataMember]
        public string campoOrdenacao
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? mesAnoCobrancaDe
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? mesAnoCobrancaAte
        {
            get;
            set;
        }

        [DataMember]
        public int? anoCobrancaDe
        {
            get;
            set;
        }

        [DataMember]
        public int? mesCobrancaDe
        {
            get;
            set;
        }

        [DataMember]
        public int? anoCobrancaAte
        {
            get;
            set;
        }

        [DataMember]
        public int? mesCobrancaAte
        {
            get;
            set;
        }
    }
}