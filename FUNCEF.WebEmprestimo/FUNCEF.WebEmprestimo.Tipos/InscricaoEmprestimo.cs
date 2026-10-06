using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa InscricaoEmprestimo
    /// </summary>
    [DataContract]
    [Serializable]
    public class InscricaoEmprestimo
    {       
        /// <summary>
        /// Id da Inscrição do Empréstimo.
        /// </summary>
        [DataMember]
        public long id 
        { 
            get; 
            set; 
        }
    }
}
