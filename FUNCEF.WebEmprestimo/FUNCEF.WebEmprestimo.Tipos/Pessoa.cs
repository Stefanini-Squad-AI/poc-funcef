using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa Avalistas
    /// </summary>
    [DataContract]
    [Serializable]
    public class Pessoa
    {
        [DataMember]
        public Int32 idPessoa
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
        public string tipo
        {
            get;
            set;
        }

        [DataMember]
        public string razaoSocial
        {
            get;
            set;
        }

        [DataMember]
        public string numDocumento
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idDocumento
        {
            get;
            set;
        }

        /// <summary>
        /// documentos da pessoa
        /// </summary>
        [DataMember]
        public List<Documento> documentos
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
        public Int32 idGrupo
        {
            get;
            set;
        }

        [DataMember]
        public string nomeGrupo
        {
            get;
            set;
        }
 
        [DataMember]
        public string homePage
        {
            get;
            set;
        }
 
        [DataMember]
        public Int32 idModuloRespon
        {
            get;
            set;
        }

        [DataMember]
        public string nomeModulo
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idEndComercial
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idEndResidencial
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idEndEntrega
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idEndCobranca
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idEndCorresp
        {
            get;
            set;
        }

        [DataMember]
        public bool possuiVinculo
        {
            get;
            set;
        }

        
        /// <summary>
        /// Enderecos da pessoa
        /// </summary>
        [DataMember]
        public List<Endereco> enderecos
        {
            get;
            set;
        }

        /// <summary>
        /// Telefone da pessoa
        /// </summary>
        [DataMember]
        public List<Telefone> telefones
        {
            get;
            set;
        }


        /// <summary>
        /// Contatos da pessoa
        /// </summary>
        [DataMember]
        public List<Contato> contatos
        {
            get;
            set;
        }

        /// <summary>
        /// Avalista da pessoa
        /// </summary>
        [DataMember]
        public Avalistas avalista
        {
            get;
            set;
        }

        //William Moreira da Silva SOL - 199759
        //Classe para fazer a integração entre o telefone e o contato
        /// <summary>
        /// Avalista da pessoa
        /// </summary>
        [DataMember]
        public List<TelContato> telContato
        {
            get;
            set;
        }

        //Campanha Desconto
        [DataMember]
        public string conjuge
        {
            get;
            set;
        }

    }
}
