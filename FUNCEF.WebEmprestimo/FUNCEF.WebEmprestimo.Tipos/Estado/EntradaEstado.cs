using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos.Estado
{
    /// <summary>
    /// Representa uma entrada de estado para a máquina de estado do sistema.
    /// </summary>
    [Serializable]
    public sealed class EntradaEstado : TipoBase
    {
        /// <summary>
        /// Obtém ou atribui uma chave para a entrada.
        /// </summary>
        public string chave
        {
            get;
            set;
        }

        /// <summary>
        /// Obtém ou atribui os dados referentes a esta entrada.
        /// </summary>
        public byte[] dados
        {
            get;
            set;
        }

        /// <summary>
        /// Obtém ou atribui a data da entrada.
        /// </summary>
        public DateTime dataEntrada
        {
            get;
            set;
        }
    }
}
