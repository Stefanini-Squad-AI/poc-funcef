using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class ItemContrato
    {
        [DataMember]
        public long id
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
        public double valor
        {
            get;
            set;
        }

        [DataMember]
        public TipoEvento tipoEvento
        {
            get;
            set;
        }

        [DataMember]
        public int prioridade
        {
            get;
            set;
        }

        [DataMember]
        public int centraliza
        {
            get;
            set;
        }

        [DataMember]
        public int destacado
        {
            get;
            set;
        }

        [DataMember]
        public int? rubrica
        {
            get;
            set;
        }

        [DataMember]
        public string pagarReceber
        {
            get;
            set;
        }

        [DataMember]
        public Regra regra
        {
            get;
            set;
        }

        [DataMember]
        public DateTime competencia
        {
            get;
            set;
        }

        [DataMember]
        public string dataCobranca
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

        [DataMember]
        public int sequencia
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
        public DateTime dataVencimento
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataEfetiva
        {
            get;
            set;
        }

        [DataMember]
        public double? taxaJuros
        {
            get;
            set;
        }

        [DataMember]
        public double? saldoDevedor
        {
            get;
            set;
        }

        [DataMember]
        public double? valorEfetivo
        {
            get;
            set;
        }

        [DataMember]
        public int? trataSaldoDevedor
        {
            get;
            set;
        }

        [DataMember]
        public int gravaZero
        {
            get;
            set;
        }

        //Xavier SOL 230843
        /// <summary>
        /// Parametro para verificar se veio do Conector Web
        /// </summary>
        [DataMember]
        public bool veioConector
        {
            get;
            set;
        }
        //Xavier SOL 230843

        //William Moreira da Silva - SOL 207977
        [DataMember]
        public string tipoTratamento
        {
            get;
            set;
        }

        /// <summary>
        /// Verifica se esse item pode ou não ser suspenso
        /// </summary>
        [DataMember]
        public int? suspensao
        {
            get;
            set;
        }

        [DataMember]
        public int numeroParcelas
        {
            get;
            set;
        }

        [DataMember]
        public int parcelaAlternativa
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 207977
        [DataMember]
        public double valorComDesconto
        {
            get;
            set;
        }
        [DataMember]
        public double percentualDesconto
        {
            get;
            set;
        }
        [DataMember]
        public bool flgCampanhaDesconto
        {
            get;
            set;
        }
    }
}