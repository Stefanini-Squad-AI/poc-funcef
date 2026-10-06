#region SOL 258704/17636 / PPM 1008709
/// - SOL 258704/17636 / PPM 1008709
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 12/08/2015
///
/// Descrição da Alteração:
/// Criação do Método ObterContaBancaria.
/// 
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Conector.ComponentesBase
{
    /// <summary>
    /// Classe que representa parâmetros para serem passasos aos métodos.
    /// </summary>
    [DataContract]
    [Serializable]
    public class Parametros
    {
        /// <summary>
        /// Id do Tipo do contrato
        /// </summary>
        [DataMember]
        public int idTipoContrato
        {
            get;
            set;
        }

        /// <summary>
        /// Id do Tipo do contrato de Entrada
        /// </summary>
        [DataMember]
        public string idTipoContratoIN
        {
            get;
            set;
        }

        /// <summary>
        /// Matrícula do mutuário
        /// </summary>
        [DataMember]
        public string matricula
        {
            get;
            set;
        }

        /// <summary>
        /// Valor solicitado
        /// </summary>
        [DataMember]
        public double? valorSolicitado
        {
            get;
            set;
        }

        /// <summary>
        /// Valor solicitado de entrada
        /// </summary>
        [DataMember]
        public string valorSolicitadoIN
        {
            get;
            set;
        }

        /// <summary>
        /// Prazo solicitado
        /// </summary>
        [DataMember]
        public int? prazo
        {
            get;
            set;
        }

        /// <summary>
        /// Prazo solicitado de entrada
        /// </summary>
        [DataMember]
        public string prazoIN
        {
            get;
            set;
        }

        [DataMember]
        public string contratosAQuitar
        {
            get;
            set;
        }
        
        /// <summary>
        /// Chave de identificação
        /// </summary>
        [DataMember]
        public string chave
        {
            get;
            set;
        }

        /// <summary>
        /// Código enviado pelo programa PAR
        /// </summary>
        [DataMember]
        public long codigoAutoEmprestimo
        {
            get;
            set;
        }

        /// <summary>
        /// Código enviado pelo programa PAR de entrada
        /// </summary>
        [DataMember]
        public string codigoAutoEmprestimoIN
        {
            get;
            set;
        }

        /// <summary>
        /// ID tipo da suspensão
        /// </summary>
        [DataMember]
        public int idTipoSuspensao
        {
            get;
            set;
        }

        /// <summary>
        /// ID tipo da suspensão de entrada
        /// </summary>
        [DataMember]
        public string idTipoSuspensaoIN
        {
            get;
            set;
        }

        /// <summary>
        /// Numero de meses de suspensao
        /// </summary>
        public int? mesesSuspensao
        {
            get;
            set;
        }

        /// <summary>
        /// Numero de meses de suspensao de entrada
        /// </summary>
        public string mesesSuspensaoIN
        {
            get;
            set;
        }

        /// <summary>
        /// Id do contrato padrao
        /// </summary>
        public int idContratoPadrao
        {
            get;
            set;
        }

        /// <summary>
        /// Id do contrato padrao de entrada
        /// </summary>
        public string idContratoPadraoIN
        {
            get;
            set;
        }
        
        /// <summary>
        /// Número do comprovante de aprovação do Contrato
        /// </summary>
        public string numeroContrato
        {
            get;
            set;
        }

        /// <summary>
        /// Data de assinatura do contrato padrão
        /// </summary>
        public DateTime dataAssinatura
        {
            get;
            set;
        }

        /// <summary>
        /// Data de assinatura do contrato padrão de entrada
        /// </summary>
        public string dataAssinaturaIN
        {
            get;
            set;
        }


        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
        /// <sumary>
        /// Conta bancária do mutuário
        /// </sumary>
        public string IdcontaBancaria
        {
            get;
            set;
        }
        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - fim
    }
}
