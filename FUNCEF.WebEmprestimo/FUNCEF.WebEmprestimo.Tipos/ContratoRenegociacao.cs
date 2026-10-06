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
    [DataContract]
    [Serializable]
    public class ContratoRenegociacao
    {
        [DataMember]
        public string numeroContrato
        {
            get;
            set;
        }

        [DataMember]
        public string modalidade
        {
            get;
            set;
        }

        [DataMember]
        public List<Parcela> itens
        {
            get;
            set;
        }
    }
}
