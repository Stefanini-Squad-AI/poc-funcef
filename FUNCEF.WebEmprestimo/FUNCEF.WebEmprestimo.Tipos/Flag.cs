using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Representa uma flag no sistema.
    /// </summary>
    [DataContract, Serializable]
    public class Flag
    {
        /// <summary>
        /// Construtor da classe de Flag.
        /// </summary>
        /// <param name="descricao">Descrição da Flag.</param>
        public Flag(string descricao)
        {
            this.descricao = descricao;
        }

        /// <summary>
        /// Atribui ou obtem a descrição de uma flag.
        /// </summary>
        [DataMember]
        public string descricao{ get; set; }
    }
}
