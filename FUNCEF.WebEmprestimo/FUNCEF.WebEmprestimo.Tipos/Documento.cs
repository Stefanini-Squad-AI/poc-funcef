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
    public class Documento
    {
        [DataMember]
        public Int32 idDocumento
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
        public Int32 idPessoa
        {
            get;
            set;
        }
        [DataMember]
        public Int32 idImagem
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
        public string mascara
        {
            get;
            set;
        }

        [DataMember]
        public string obrigaUf
        {
            get;
            set;
        }

        [DataMember]
        public string obrigaOrgao
        {
            get;
            set;
        }


        [DataMember]
        public string obrigaEmissao
        {
            get;
            set;
        }

        [DataMember]
        public string orgao
        {
            get;
            set;
        }

        [DataMember]
        public string flgObrigaValidade
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataEmissao
        {
            get;
            set;
        }


        [DataMember]
        public DateTime dataValidade
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
        public UF uf
        {
            get;
            set;
        }


    }

    
             
    
             
             
             
}
