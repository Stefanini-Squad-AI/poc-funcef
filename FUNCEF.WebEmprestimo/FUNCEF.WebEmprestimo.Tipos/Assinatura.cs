#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Adição da propriedade numProtocolo e idBeneficio
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
    /// Classe que representa Assinatura.
    /// </summary>
    [DataContract]
    [Serializable]
    public class Assinatura
    {
        /// <summary>
        /// Flag de bloqueio da assinatura.
        /// </summary>
        [DataMember]
        public int flagBloqueio { get; set; }

        /// <summary>
        /// Data de inicio.
        /// </summary>
        [DataMember]
        public DateTime? dataInicio { get; set; }

        [DataMember]
        public Mutuario mutuario { get; set; }

        [DataMember]
        public string observacao { get; set; }

        [DataMember]
        public DateTime dataAssinatura { get; set; }

        [DataMember]
        public string numeroComprovante { get; set; }

        [DataMember]
        public int idContratoPadrao { get; set; }

        #region SIG 28915 - Eliamar Tani
        /*[DataMember]
        public int idBeneficio { get; set; }*/

        [DataMember]
        public string numProtocolo { get; set; }

        [DataMember]
        public string chave
        {
            get
            {
                if (mutuario == null)
                    throw new NullReferenceException("mutuario está nulo");

                string concatenado = string.Format("idContratoPadrao={0};idBeneficiario={1};idPessoa={2};dataAssinatura={3};matricula={4}", idContratoPadrao, mutuario.id, mutuario.idTitular, dataAssinatura, mutuario.matricula);

                return concatenado;
            }
            internal set { }
        }
        #endregion
    }
}
