using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [Serializable, DataContract]
    public class InstrucaoLike : TipoEnumeradorBase<int>
    {
        #region Construtor

        private InstrucaoLike()
        {
        }

        #endregion

        #region Membros

        public static readonly InstrucaoLike igual = new InstrucaoLike() { chave = 0, descricao = "Igual" };
        public static readonly InstrucaoLike comecaCom = new InstrucaoLike() { chave = 1, descricao = "Começa com" };
        public static readonly InstrucaoLike contem = new InstrucaoLike() { chave = 2, descricao = "Contém" };
    
        #endregion

    }
}
