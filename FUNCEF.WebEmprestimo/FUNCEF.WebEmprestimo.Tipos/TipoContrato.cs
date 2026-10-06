#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Felipe A. Santos
///
/// Data da Alteração:
/// 27/04/2016 09:21:53
///
/// Descrição da Alteração:
/// Adição da propriedade regraFGQCbase
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
    /// Classe que representa Tipo do Contrato
    /// </summary>
    [DataContract]
    [Serializable]
    public class TipoContrato
    {
        /// <summary>
        /// Código do tipo do contrato.
        /// </summary>
        [DataMember]
        public int id
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição do tipo do contrato.
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }

        /// <summary>
        /// Quantidade máxima de parcelas do contrato.
        /// </summary>
        [DataMember]
        public int maximoParcelas
        {
            get;
            set;
        }

        /// <summary>
        /// Quantidade máxima permitida de contratos em aberto.
        /// </summary>
        [DataMember]
        public int maximoContrato
        {
            get;
            set;
        }

        /// <summary>
        /// Código da regra da margem consignável.
        /// </summary>
        [DataMember]
        public Regra regraMargem
        {
            get;
            set;
        }

        /// <summary>
        /// Identificação da regra de elegibilidade.
        /// </summary>
        [DataMember]
        public Regra regraElegibilidade
        {
            get;
            set;
        }

        /// <summary>
        /// Identificação da regra de limites de prazo e valor.
        /// </summary>
        [DataMember]
        public Regra regraLimites
        {
            get;
            set;
        }

        /// <summary>
        /// Identificação da regra de reserva de poupança.
        /// </summary>
        [DataMember]
        public Regra regraReservaPoupanca
        {
            get;
            set;
        }

        /// <summary>
        /// Identificação da regra dos prazos de concessão permitidos.
        /// </summary>
        [DataMember]
        public Regra regraPrazosConcessao
        {
            get;
            set;
        }

        /// <summary>
        /// Identificação da regra de cálculo da taxa de juros (instantânea).
        /// </summary>
        [DataMember]
        public Regra regraJurosConcessao
        {
            get;
            set;
        }

        //NILTON - 17/12/12
        /// <summary>
        /// Identificação da regra de cálculo da taxa de juros (Para exibir).
        /// </summary>
        [DataMember]
        public Regra regraJurosExibir
        {
            get;
            set;
        }



        /// <summary>
        /// ID da regra de cálculo do prazo de um contrato quando do refinanciamento.
        /// </summary>
        [DataMember]
        public Regra regraPrazoMaximo
        {
            get;
            set;
        }

        /// <summary>
        /// ID da regra que retornará o salário base do participante.
        /// </summary>
        [DataMember]
        public Regra regraSalarioBase
        {
            get;
            set;
        }

        /// <summary>
        /// ID da regra que determina a data de crédito.
        /// </summary>
        [DataMember]
        public Regra regraDataCredito
        {
            get;
            set;
        }

        /// <summary>
        /// ID da regra que define quais itens serão marcados como quitados na quitação.
        /// </summary>
        [DataMember]
        public Regra regraQuitado
        {
            get;
            set;
        }

        /// <summary>
        /// ID da regra de valor máximo permitido.
        /// </summary>
        [DataMember]
        public Regra regraValorMaximo
        {
            get;
            set;
        }
        
        // Felipe A. Santos - SOL 225057/18141 PPM 1315874 - início
        public Regra regraFGQCbase
        {
            get;
            set;
        }
        // Felipe A. Santos - SOL 225057/18141 PPM 1315874 - fim

        /// <summary>
        /// Representa o contrato.
        /// </summary>
        [DataMember]
        public Contrato contrato
        {
            get;
            set;
        }

        /// <summary>
        /// O item do contrato.
        /// </summary>
        [DataMember]
        public ItemContrato itemContrato
        {
            get;
            set;
        }

        /// <summary>
        /// Regra Valor do contrato.
        /// </summary>
        [DataMember]
        public Regra regraValor
        {
            get;
            set;
        }

        /// <summary>
        /// Flag de Reginanciamento.
        /// </summary>
        [DataMember]
        public bool naoRefinancia
        {
            get;
            set;
        }

        /// <summary>
        /// Moeda do Contrato
        /// </summary>
        [DataMember]
        public Moeda moeda
        {
            get;
            set;
        }

        /// <summary>
        /// Tipo de Emprestimo do Contrato
        /// </summary>
        [DataMember]
        public TipoEmprestimo tipoEmprestimo
        {
            get;
            set;
        }

        /// <summary>
        /// Forma de Recebimento do tipo do contrato.
        /// </summary>
        [DataMember]
        public string formaRecebimento
        {
            get;
            set;
        }

        /// <summary>
        /// Forma de Pagamentp do tipo do contrato.
        /// </summary>
        [DataMember]
        public string formaPagamento
        {
            get;
            set;
        }

        /// <summary>
        /// ID da regra que define quais itens serão marcados como quitados na quitação.
        /// </summary>
        [DataMember]
        public Regra regraPrimeiraParcela
        {
            get;
            set;
        }

        /// <summary>
        /// Verifica contratos efetivados na concessão: 0-não verifica; 1-mesmo tipo; 2-qualquer tipo     
        /// </summary>
        public int verificaContratoEfetivado
        {
            get;
            set;
        }

        //William Moreira da Silva - SOL 205048 KTN 1983964
        /// <summary>
        /// Verifica se o contrato precisa ou não de número de protocolo
        /// </summary>
        [DataMember]
        public bool flgNumeroProtocolo
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 205048 KTN 1983964

        //Xavier SOL 230843
        /// <summary>
        /// Parametro para verificar se veio do Conector Web
        /// </summary>
        [DataMember]
        public bool veioConector
        {
            get;
            set;
        }
        //Xavier SOL 230843

        //William Moreira da Silva - 27879 - INICIO
        /// <summary>
        /// ID da regra que define quais itens serão marcados como quitados na quitação.
        /// </summary>
        [DataMember]
        public Regra regraCorrecaoMonetaria
        {
            get;
            set;
        }
        //William Moreira da Silva - 27879 - Fim

        //Saulo Cirineu Araújo
        /// <summary>
        /// Verifica se obriga concessão com líquido zero
        /// </summary>
        [DataMember]
        public bool flgObrigaLiquidoZero
        {
            get;
            set;
        }

        [DataMember]
        public string SistemaAmortizacao
        {
            get;
            set;
        }

        [DataMember]
        public Regra regraDescFGQCbase
        {
            get;
            set;
        }
    }
}