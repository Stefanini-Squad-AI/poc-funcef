#region SIG 21529
///
/// Autor:
/// Thayane Rabonato
///
/// Data da Alteração:
/// 12/09/2017
///
/// Descrição da Alteração:
/// Criação da opção de renegociação de dívidas de emprestimo
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
    /// Classe que representa parcela que são apresentadas no Refinanciamento
    /// </summary>
    [DataContract]
    [Serializable]
    public class Parcela
    {
        /// <summary>
        /// Identificador
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        [DataMember]
        public string numeroContrato
        {
            get;
            set;
        }

        [DataMember]
        public string Modalidade
        {
            get;
            set;
        }

        [DataMember]
        public string MesReferencia
        {
            get;
            set;
        }

        [DataMember]
        public string ItemPrestacao
        {
            get;
            set;
        }

        [DataMember]
        public Double ValorItemPrestacao
        {
            get;
            set;
        }

        [DataMember]
        public Boolean IsMarcado
        {
            get;
            set;
        }

        [DataMember]
        public int NumeroParcela
        {
            get;
            set;
        }

    }
}
