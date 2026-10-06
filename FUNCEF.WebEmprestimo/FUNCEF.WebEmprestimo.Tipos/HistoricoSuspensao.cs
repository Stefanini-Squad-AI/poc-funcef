using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Histórico de Suspensão
    /// </summary>
    [DataContract]
    [Serializable]
    public class HistoricoSuspensao
    {
        [DataMember]
        public long id
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataInicio
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataFim
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataLiberacao
        {
            get;
            set;
        }

        [DataMember]
        public int ferias
        {
            get;
            set;
        }

        [DataMember]
        public int? mesCobranca
        {
            get;
            set;
        }

        [DataMember]
        public int? anoCobranca
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataAtendimento
        {
            get;
            set;
        }

        [DataMember]
        public string responsavelAtendimento
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataAtualizacao
        {
            get;
            set;
        }

        [DataMember]
        public string responsavelAtualizacao
        {
            get;
            set;
        }

        [DataMember]
        public string status
        {
            get;
            set;
        }

        [DataMember]
        public int numeroMeses
        {
            get;
            set;
        }

        [DataMember]
        public TipoSuspensao tipoSuspensao
        {
            get;
            set;
        }

        [DataMember]
        public Contrato contrato
        {
            get;
            set;
        }

        [DataMember]
        public string usuarioLogado
        {
            get;
            set;
        }

        public long? numeroContrato
        {
            get
            {
                if (this.contrato != null)
                    return this.contrato.numero;
                else
                    return null;
            }
        }


        //William Moreira da Silva SOL 149705
        [DataMember]
        public string observacao
        {
            get;
            set;
        }
        //William Moreira da Silva SOL 149705

        //William Moreira da Silva SOL 235167
        [DataMember]
        public string descricaoTipoSuspAux
        {
            get;
            set;
        }
        //William Moreira da Silva SOL 235167

        [DataMember]
        public string prazoIndeterminado
        {
            get;
            set;
        }
    }
}