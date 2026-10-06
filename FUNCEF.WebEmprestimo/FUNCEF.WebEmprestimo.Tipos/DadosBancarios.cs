#region SOL 258704/17636 / PPM 1008709
/// - SOL 258704/17636 / PPM 1008709
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 12/08/2015
///
/// Descrição da Alteração:
/// Criação do Método ObterContaBancaria no conectorWeb.
/// 
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa os dados bancário.
    /// </summary>
    [DataContract]
    [Serializable]
    public class DadosBancarios
    {
        /// <summary>
        /// id dos dados bancários.
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// identificação do banco dos dados bancários.
        /// </summary>
        [DataMember]
        public int banco
        {
            get;
            set;
        }

        /// <summary>
        /// numero do banco do mutuario.
        /// </summary>
        [DataMember]
        public string numeroBanco
        {
            get;
            set;
        }

        /// <summary>
        /// banco do mutuario.
        /// </summary>
        [DataMember]
        public string nomeBanco
        {
            get;
            set;
        }

        /// <summary>
        /// agência do mutuario.
        /// </summary>
        [DataMember]
        public string agencia
        {
            get;
            set;
        }

        /// <summary>
        /// Conta Corrente do mutuario.
        /// </summary>
        [DataMember]
        public string contaCorrente
        {
            get;
            set;
        }

        /// <summary>
        /// Dados do mutuario.
        /// </summary>
        [DataMember]
        public string dados
        {
            get;
            set;
        }

        /// <summary>
        /// Flag da conta preferencia dos dados bancários.
        /// </summary>
        [DataMember]
        public int contraPreferencial
        {
            get;
            set;
        }

        /// <summary>
        /// Operação da conta corrente.
        /// </summary>
        [DataMember]
        public string operacao
        {
            get;
            set;
        }

        [DataMember]
        public int Tipo
        {
            get;
            set;
        }
    }
}
