#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SOL 208770 / Kintana 2016022
///
/// Autor:
/// Felipe Azevedo dos Santos
///
/// Data da Alteração:
/// 18/03/2015
///
/// Descrição da Alteração:
/// criação das propriedades referente a opção EXCEPCIONAL.
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
/// Adição da propriedade FGQCbase
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
    /// Classe que representa Contrato
    /// </summary>
    [DataContract]
    [Serializable]
    public class Concessao
    {

        // Felipe A. Santos - SOL 225057/18141 PPM 1315874 - início
        [DataMember]
        public double FGQCbase
        {
            get;
            set;
        }
        // Felipe A. Santos - SOL 225057/18141 PPM 1315874 - fim

        /// <summary>
        /// Número de parcelas
        /// </summary>
        [DataMember]
        public int? numeroParcelas
        {
            get;
            set;
        }

        /// <summary>
        /// Valor máximo permitido
        /// </summary>
        [DataMember]
        public double? valorMaximo
        {
            get;
            set;
        }

        /// <summary>
        /// Prazo máximo
        /// </summary>
        [DataMember]
        public int prazoMaximo
        {
            get;
            set;
        }

        /// <summary>
        /// Data crédito
        /// </summary>
        [DataMember]
        public DateTime? dataCredito
        {
            get;
            set;
        }

        /// <summary>
        /// Salário Base
        /// </summary>
        [DataMember]
        public double? salarioBase
        {
            get;
            set;
        }

        /// <summary>
        /// Valor margem consignável
        /// </summary>
        [DataMember]
        public double? valorMargem
        {
            get;
            set;
        }

        /// <summary>
        /// Taxa de juros concessao
        /// </summary>
        [DataMember]
        public double taxaJurosConcessao
        {
            get;
            set;
        }

        //NILTON 18/12/12
        /// <summary>
        /// Taxa de juros Exibir
        /// </summary>
        [DataMember]
        public double taxaJurosExibir
        {
            get;
            set;
        }


        /// <summary>
        /// Valor reserva de poupança
        /// </summary>
        [DataMember]
        public double valorReserva
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataPrimeiraParcela
        {
            get;
            set;
        }

        [DataMember]
        public bool excepcional
        {
            get;
            set;
        }

        // Felipe A. Santos SOL 208770 PPM 201602 - início
        [DataMember]
        public int excepcionalMargem
        {
            get;
            set;
        }


        [DataMember]
        public int excepcionalElegibilidade
        {
            get;
            set;
        }


        [DataMember]
        public int excepcionalInadimplencia
        {
            get;
            set;
        }

        [DataMember]
        public int excepcionalOutros
        {
            get;
            set;
        }
        // Felipe A. Santos SOL 208770 PPM 201602 - fim

        [DataMember]
        public bool financiamento
        {
            get;
            set;
        }

        //BRUNO AZEVEDO
        [DataMember]
        public bool liquidozero
        {
            get;
            set;
        }
        //BRUNO AZEVEDO

        [DataMember]
        public double valorAQuitar
        {
            get;
            set;
        }

        [DataMember]
        public double valorTotalParcelas
        {
            get;
            set;
        }

        [DataMember]
        public double valorEmAberto
        {
            get;
            set;
        }

        [DataMember]
        public double? valorSolicitado
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataAssinatura // Felipe A. Santos adicionado o ? - SOL 219054
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataSolicitacao
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataReferencia // Felipe A. Santos adicionado o ? - SOL219054
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataEvento
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataAtualiza
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataEfetiva
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataPrevista
        {
            get;
            set;
        }

        /// <summary>
        /// Valor de amortização financiamento habitacional
        /// </summary>
        [DataMember]
        public double? valorAmortizacaoFH
        {
            get;
            set;
        }

        /// <summary>
        /// Juros Financiamento habitacional
        /// </summary>
        [DataMember]
        public double? jurosFH
        {
            get;
            set;
        }

        /// <summary>
        /// Quantidade meses suspensão 
        /// </summary>
        [DataMember]
        public int? mesesSuspensao
        {
            get;
            set;
        }

        /// <summary>
        /// Valor da prestação após cálculo
        /// </summary>
        [DataMember]
        public double? valorPrestacao
        {
            get;
            set;
        }

        /// <summary>
        /// Valor líquido após cálculo
        /// </summary>
        [DataMember]
        public double? valorLiquido
        {
            get;
            set;
        }

        /// <summary>
        /// Flag que identifica se existe ao menos um contrato obrigatório a quitar
        /// </summary>
        [DataMember]
        public bool contratosEmAberto
        {
            get;
            set;
        }


        /// <summary>
        /// Valor total dos descontos
        /// </summary>
        [DataMember]
        public double? valorDescontos
        {
            get;
            set;
        }

        /// <summary>
        /// Valor débito utilizado para o valor da dívida previdenciária.
        /// </summary>
        [DataMember]
        public double? valorDebito
        {
            get;
            set;
        }

        [DataMember]
        public int grupoExcepcional
        {
            get;
            set;
        }

        // Xavier SOL 172525
        /// <summary>
        /// Contrato com numero de protocolo
        /// </summary>
        [DataMember]
        public string numProtocolo//William Moreira da Silva - SOL 213725 KINTANA 2040469
        {
            get;
            set;
        }
        // Xavier SOL 172525

        // Xavier Parametros inputregra
        /// <summary>
        /// Parametro InputRegra Valor Divida
        /// </summary>
        [DataMember]
        public double valordivida
        {
            get;
            set;
        }
        /// <summary>
        /// Parametro InputRegra Valor Amortização
        /// </summary>
        [DataMember]
        public double valoramortizacao
        {
            get;
            set;
        }
        /// <summary>
        /// Parametro InputRegra Valor Quitação
        /// </summary>
        [DataMember]
        public double valorquitacao
        {
            get;
            set;
        }

        [DataMember]
        public string evento
        {
            get;
            set;
        }

        //William Moreira da Silva SOL 205183 KTN 1984449
        /// <summary>
        /// Parametro para verificar se veio do Conector Web
        /// </summary>
        [DataMember]
        public bool veioConector
        {
            get;
            set;
        }
        //William Moreira da Silva SOL 205183 KTN 1984449
        // Xavier Parametros inputregra

        //William Moreira da Silva - SIG27879 - INICIO
        /// <summary>
        /// Taxa de juros de Correção Monetari
        /// </summary>
        [DataMember]
        public double taxaCorrecao
        {
            get;
            set;
        }
        //William Moreira da Silva - SIG27879 - FIM

        [DataMember]
        public double? ValorUltimaPrestacaoFGQC
        {
            get;
            set;
        }

        [DataMember]
        public bool CampanhaDescontos
        {
            get;
            set;
        }

        //Campanha Desconto
        [DataMember]
        public int? idCalculo
        {
            get;
            set;
        }
        
        [DataMember]
        public double valorPoliticaDescontos
        {
            get;
            set;
        }

        //SIG 128871 - Inclusão da propriedade abaixo
        [DataMember]
        public double DescFGQCbase
        {
            get;
            set;
        }
    }
}
