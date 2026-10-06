using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Tipo de Suspensão
    /// </summary>
    [DataContract]
    [Serializable]
    public class TipoSuspensao
    {
        [DataMember]
        public int id
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
        public Regra regraSuspensao
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
        public double? percentual
        {
            get;
            set;
        }

        [DataMember]
        public bool ferias
        {
            get;
            set;
        }

        [DataMember]
        public bool cobrancaJudicial
        {
            get;
            set;
        }

        [DataMember]
        public bool apenasConcessao
        {
            get;
            set;
        }

        //WIlliam MOreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se a suspensao atualiza ou não o saldo devedor
        /// </summary>
        [DataMember]
        public int atualizaSaldoDevedor
        {
            get;
            set;
        }

        [DataMember]
        public int flgSuspensaoItem
        {
            get;
            set;
        }
        //WIlliam MOreira da Silva

    }
}