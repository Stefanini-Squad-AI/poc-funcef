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
    public class Telefone
    {

        [DataMember]
        public Int32 idTelefone
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
        public Int32 ddi
        {
            get;
            set;
        }
        
        [DataMember]
        public Int32 ddd
        {
            get;
            set;
        }

        [DataMember]
        public String numero
        {
            get;
            set;
        }

        [DataMember]
        public string tipo
        {
            get;
            set;
        }

        [DataMember]
        public string telComercial
        {
            get;
            set;
        }

        [DataMember]
        public string telParticular
        {
            get;
            set;
        }

        [DataMember]
        public string telFax
        {
            get;
            set;
        }

        [DataMember]
        public string telCelular
        {
            get;
            set;
        }

        [DataMember]
        public string telRecado
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

        //William Moreira da Silva
        [DataMember]
        public Int32 idContato
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
    }
}
