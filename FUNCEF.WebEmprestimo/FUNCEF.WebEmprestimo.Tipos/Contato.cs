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
    public class Contato
    {

        [DataMember]
        public Int32 idContato
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idPessoa
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idEndereco
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

        [DataMember]
        public string email
        {
            get;
            set;
        }

        [DataMember]
        public string cargo
        {
            get;
            set;
        }

        [DataMember]
        public string setor
        {
            get;
            set;
        }

        [DataMember]
        public DateTime nascimento
        {
            get;
            set;
        }

        [DataMember]
        public string obs
        {
            get;
            set;
        }

        //William Moreira da  Silva
        [DataMember]
        public Int32 idTelefone
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idTelContato
        {
            get;
            set;
        }

        [DataMember]
        public string telefone
        {
            get;
            set;
        }

        [DataMember]
        public string evento
        {
            get;
            set;
        }

    }


}
