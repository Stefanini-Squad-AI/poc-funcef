using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Representa as informações de paginação e ordenação das consultas.
    /// </summary>
    [DataContract]
    [Serializable]
    public sealed class ParametrosConsulta
    {
        /// <summary>
        /// Retorna uma nova intância de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ParametrosConsulta"/>.
        /// </summary>
        public ParametrosConsulta()
        {
            this.totalRegistros = 0;
        }

        /// <summary>
        /// Retorna uma nova intância de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ParametrosConsulta"/> com as informações de paginação fornecidas.
        /// </summary>
        /// <param name="indiceLinha">Índice da linha inicial a ser retornada.</param>
        /// <param name="maximoLinhas">Máximo de linhas a serem retornadas.</param>
        public ParametrosConsulta(int indiceLinha, int maximoLinhas)
        {
            this.paginacao = new Paginacao()
            {
                indiceLinha = indiceLinha,
                maximoLinhas = maximoLinhas
            };
            this.totalRegistros = 0;
        }

        /// <summary>
        /// Retorna uma nova intância de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ParametrosConsulta"/> com as informações de ordenação fornecidas.
        /// </summary>
        /// <param name="criterio">Critério de ordenação da consulta.</param>
        public ParametrosConsulta(string criterio)
        {
            this.ordenacao = new Ordenacao()
            {
                criterio = criterio
            };
            this.totalRegistros = 0;
        }

        /// <summary>
        /// Retorna uma nova intância de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ParametrosConsulta"/> com as informações de paginação e ordenação fornecidas.
        /// </summary>
        /// <param name="indiceLinha">Índice da linha inicial a ser retornada.</param>
        /// <param name="maximoLinhas">Máximo de linhas a serem retornadas.</param>
        /// <param name="criterio">Critério de ordenação da consulta.</param>
        public ParametrosConsulta(int indiceLinha, int maximoLinhas, string criterio)
        {
            this.paginacao = new Paginacao()
            {
                indiceLinha = indiceLinha,
                maximoLinhas = maximoLinhas
            };

            this.ordenacao = new Ordenacao()
            {
                criterio = criterio
            };
            this.totalRegistros = 0;
        }

        #region Propriedades

        /// <summary>
        /// Obtém ou atribui as informações de paginação da consulta.
        /// </summary>
        [DataMember]
        public Paginacao paginacao
        {
            get;
            set;
        }

        /// <summary>
        /// Obtém ou atribui as informações de ordenação da consulta.
        /// </summary>
        [DataMember]
        public Ordenacao ordenacao
        {
            get;
            set;
        }

        /// <summary>
        /// Obtém ou atribui o total de registros encontrados.
        /// </summary>
        [DataMember]
        public int totalRegistros
        {
            get;
            set;
        }

        #endregion

        /// <summary>
        /// Prepara a intância para ser retornada, limpando as informações de paginação e ordenação.
        /// </summary>
        public void prepararRetorno()
        {
            this.paginacao = null;
            this.ordenacao = null;
        }
    }
}
