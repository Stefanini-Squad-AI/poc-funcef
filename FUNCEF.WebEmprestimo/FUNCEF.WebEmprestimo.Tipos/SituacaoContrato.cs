using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Representa uma possível situação de um contrato.
    /// </summary>
    [DataContract, Serializable]
    public class SituacaoContrato : TipoBase
    {
        /// <summary>
        /// Inicializa uma nova instância de <see cref="SituacaoContrato"/>.
        /// </summary>
        public SituacaoContrato()
        {

        }

        /// <summary>
        /// Inicializa uma nova instância de <see cref="SituacaoContrato"/> com as informações fornecidas.
        /// </summary>
        /// <param name="codigo">Código da situação.</param>
        /// <param name="descricao">Descrição da situação.</param>
        public SituacaoContrato(string codigo, string descricao)
        {
            this.codigo = codigo;
            this.descricao = descricao;
        }

        /// <summary>
        /// Obtém ou atribui o código da situação do contrato.
        /// </summary>
        [DataMember]
        public string codigo
        {
            get;
            set;
        }

        /// <summary>
        /// Obtém ou atribui a descrição da situação do contrato.
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }
    }
}
