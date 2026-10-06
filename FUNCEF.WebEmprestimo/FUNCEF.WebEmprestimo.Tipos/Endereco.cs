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
    public class Endereco
    {

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
        public Cidade cidade
        {
            get;
            set;
        }

        [DataMember]
        public UF uf
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

        [DataMember]
        public string logradouro
        {
            get;
            set;
        }

        [DataMember]
        public string numero
        {
            get;
            set;
        }

        [DataMember]
        public string complemento
        {
            get;
            set;
        }
        
        [DataMember]
        public string bairro
        {
            get;
            set;
        }       

        [DataMember]
        public string cep
        {
            get;
            set;
        }

        [DataMember]
        public string local
        {
            get;
            set;
        }

        [DataMember]
        public string tipoEndereco
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

        [DataMember]
        public bool endComercial
        {
            get;
            set;
        }

        [DataMember]
        public bool endCorrespondencia
        {
            get;
            set;
        }

        [DataMember]
        public bool endEntrega
        {
            get;
            set;
        }

        [DataMember]
        public bool endResidencial
        {
            get;
            set;
        }

        [DataMember]
        public bool endCobranca
        {
            get;
            set;
        }

  
    }
}
