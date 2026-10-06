#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
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
    public class Contrato
    {
        /// <summary>
        /// Número do contrato
        /// </summary>
        [DataMember]
        public long numero
        {
            get;
            set;
        }

        /// <summary>
        /// Data assinatura do contrato
        /// </summary>
        [DataMember]
        public DateTime? dataAssinatura
        {
            get;
            set;
        }

        /// <summary>
        /// Data do crédito do empréstimo
        /// </summary>
        [DataMember]
        public DateTime? dataCredito
        {
            get;
            set;
        }

        /// <summary>
        /// Data do vencimento da primeira parcela
        /// </summary>
        [DataMember]
        public DateTime? dataPrimeiraParcela
        {
            get;
            set;
        }

        /// <summary>
        /// Número total de parcelas do contrato
        /// </summary>
        [DataMember]
        public int totalParcelas
        {
            get;
            set;
        }

        /// <summary>
        /// Valor das parcelas
        /// </summary>
        [DataMember]
        public double? valorParcela
        {
            get;
            set;
        }

        /// <summary>
        /// Taxa de juros do contrato
        /// </summary>
        [DataMember]
        public double? taxaJuros
        {
            get;
            set;
        }

        /// <summary>
        /// Valor  solicitado do contrato
        /// </summary>
        [DataMember]
        public double? valorContrato
        {
            get;
            set;
        }

        /// <summary>
        /// Valor  Quitado
        /// </summary>
        [DataMember]
        public double? valorQuitado
        {
            get;
            set;
        }

        /// <summary>
        /// Modalidade
        /// </summary>
        [DataMember]
        public string modalidade
        {
            get;
            set;
        }

        [DataMember]
        public virtual Mutuario mutuario
        {
            get;
            set;
        }

        [DataMember]
        public TipoContrato tipo
        {
            get;
            set;
        }

        [DataMember]
        public virtual Patrocinadora patrocinadora
        {
            get;
            set;
        }

        [DataMember]
        public virtual PlanoPrevidenciario plano
        {
            get;
            set;
        }

        [DataMember]
        public TipoEmprestimo tipoEmprestimo
        {
            get;
            set;
        }

        [DataMember]
        public virtual Moeda indexador
        {
            get;
            set;
        }

        /// <summary>
        /// Identificaçao da situão do contrato.
        /// </summary>
        [DataMember]
        public string idSituacao
        {
            get;
            set;
        }

        [DataMember]
        public SituacaoContrato situacao
        {
            get;
            set;
        }

        /// <summary>
        /// Valor das margens
        /// </summary>
        [DataMember]
        public double? valorMargem
        {
            get;
            set;
        }

        /// <summary>
        /// Identificaçao da Data do Cancelamento do contrato.
        /// </summary>
        [DataMember]
        public DateTime? dataCancelamento
        {
            get;
            set;
        }

        [DataMember]
        public Beneficiario beneficiario
        {
            get;
            set;
        }

        /// <summary>
        /// Salário Base do contrato
        /// </summary>
        [DataMember]
        public double? salarioBase
        {
            get;
            set;
        }

        /// <summary>
        /// Número da Inscrição do Empréstimo.
        /// </summary>
        [DataMember]
        public InscricaoEmprestimo inscricaoEmprestimo
        {
            get;
            set;
        }

        /// <summary>
        /// Número de Parcelas atrasadas.
        /// </summary>
        [DataMember]
        public int numeroParcelasAtrasadas
        {
            get;
            set;
        }

        /// <summary>
        /// Forma de recebimento.
        /// </summary>
        [DataMember]
        public string formaRecebimento
        {
            get;
            set;
        }

        /// <summary>
        /// Forma de Pagamento.
        /// </summary>
        [DataMember]
        public virtual string formaPagamento
        {
            get;
            set;
        }

        /// <summary>
        /// Nome do Responsável
        /// </summary>
        [DataMember]
        public virtual string nomeResponsavel
        {
            get;
            set;
        }

        /// <summary>
        /// Data da Solicitação
        /// </summary>
        [DataMember]
        public virtual DateTime? dataSolicitacao
        {
            get;
            set;
        }

        /// <summary>
        /// Quitado Por
        /// </summary>
        [DataMember]
        public long contratoQuitacao
        {
            get;
            set;
        }

        /// <summary>
        /// Situação do Participante.
        /// </summary>
        [DataMember]
        public string situacaoParticipante
        {
            get;
            set;
        }

        /// <summary>
        /// Portador Recebimento.
        /// </summary>
        [DataMember]
        public string portadorRecebimento
        {
            get;
            set;
        }

        /// <summary>
        /// Código do Auto-Empréstimo;
        /// </summary>
        [DataMember]
        public long codigoAutoEmprestimo
        {
            get;
            set;
        }

        /// <summary>
        /// Descrição da Suspensão.
        /// </summary>
        [DataMember]
        public virtual Suspensao suspensao
        {
            get;
            set;
        }

        /// <summary>
        /// Data Início da Suspensão
        /// </summary>
        [DataMember]
        public DateTime? dataInicioSuspensao
        {
            get;
            set;
        }

        /// <summary>
        /// Data Fim da Suspensão
        /// </summary>
        [DataMember]
        public DateTime? dataFimSuspensao
        {
            get;
            set;
        }

        /// <summary>
        /// Portador Crédito.
        /// </summary>
        [DataMember]
        public virtual string portadorCredito
        {
            get;
            set;
        }

        /// <summary>
        /// Portador Débito.
        /// </summary>
        [DataMember]
        public virtual string portadorDebito
        {
            get;
            set;
        }

        /// <summary>
        /// Saldo Devedor
        /// </summary>
        [DataMember]
        public double saldoDevedor
        {
            get;
            set;
        }

        /// <summary>
        /// Valor última parcela
        /// </summary>
        [DataMember]
        public double valorUltimaParcela
        {
            get;
            set;
        }

        /// <summary>
        /// Parcelas pagas
        /// </summary>
        [DataMember]
        public int parcelasPagas
        {
            get;
            set;
        }

        /// <summary>
        /// Valor em Aberto
        /// </summary>
        [DataMember]
        public double valorEmAberto
        {
            get;
            set;
        }

        /// <summary>
        /// Valor a Quitar
        /// </summary>
        [DataMember]
        public double valorAQuitar
        {
            get;
            set;
        }

        /// <summary>
        /// Valor desconto (Política de Renegociação)
        /// </summary>
        [DataMember]
        public double valorDesconto
        {
            get;
            set;
        }

        /// <summary>
        /// Valor máximo permitido
        /// </summary>
        [DataMember]
        public double valorMaximo
        {
            get;
            set;
        }

        /// <summary>
        /// Contrato criado com opção de excepcional
        /// </summary>
        [DataMember]
        public Boolean excepcional
        {
            get;
            set;
        }


        /// <summary>
        /// Contrato criado com perda efetiva
        /// </summary>
        [DataMember]
        public Boolean efetiva
        {
            get;
            set;
        }
        //Sadi SOL213592_Kintana2040335
     




     

        /// <summary>
        /// Lista dos itens em contrato
        /// </summary>
        [DataMember]
        public List<ItemContrato> itens
        {
            get;
            set;
        }

        [DataMember]
        public string flagFormaRecebimento { get; set; }

        [DataMember]
        public string flagFormaPagamento { get; set; }

        [DataMember]
        public Usuario usuario { get; set; }

        [DataMember]
        public string versao { get; set; }

        [DataMember]
        public int quitacaoObrigatoria { get; set; }

        [DataMember]
        public bool quitar { get; set; } 

        /// <summary>
        /// Contrato criado com opção de excepcional
        /// </summary>
        [DataMember]
        public Boolean internet
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataVencimento
        {
            get;
            set;
        }

        // Xavier SOL 172525
        /// <summary>
        /// Contrato com numero de protocolo
        /// </summary>
        [DataMember]
        public String numProtocolo//William Moreira da Silva - SOL 213725 KINTANA 2040469
        {
            get;
            set;
        }
        // Xavier SOL 172525

        /// <summary>
        /// Meses da suspenção.
        /// </summary>
        [DataMember]
        public int mesesSuspencao
        {
            get;
            set;
        }


        /// <summary>
        /// Numero contratos quitados.
        /// </summary>
        [DataMember]
        public virtual int nrContratosQuitados
        {
            get;
            set;
        }

        /// <summary>
        /// Valor máximo prestação.
        /// </summary>
        [DataMember]
        public virtual double valorMaxPrestacao
        {
            get;
            set;
        }

        //William Moreira da Silva
        /// <summary>
        /// Data de Inicio do valor máximo prestação.
        /// </summary>
        [DataMember]
        public virtual DateTime? dataInicioVlrMax
        {
            get;
            set;
        }

        /// <summary>
        /// Data final do valor máximo prestação.
        /// </summary>
        [DataMember]
        public virtual DateTime? dataFinalVlrMax
        {
            get;
            set;
        }
        //William Moreira da Silva


        // Thiago Melo SOL 202311 KINTANA 1956671
        [DataMember]
        public int tcemirenova
        {
            get;
            set;
        }

        [DataMember]
        public int flgPrazoQuitacao
        {
            get;
            set;
        }

        [DataMember]
        public double vlrEmAberto
        {
            get;
            set;
        }

        [DataMember]
        public int flgObrigatorio
        {
            get;
            set;
        }

        [DataMember]
        public int idTipoContratoEmpto
        {
            get;
            set;
        }


        // Thiago Melo SOL 202311 KINTANA 1956671

        //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
        [DataMember]
        public virtual int isDocumentoObito { get; set; }

        [DataMember]
        public virtual int numeroDocumentoParamPrev { get; set; }
        //marcio sanches spinosa sol 199356  kintana 1931062 - Fim

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

        //Saulo / FUNCEF (A forma de busca de parcelas restante por meio da procedure 
        // CM.PCK_EMP_FUNCAO_SALDO.PR_BuscaSaldo_Ant_Pos está incorreto e menos performático
        // do que utilizar uma query direta)
        [DataMember]
        public virtual int? parcelasRestantes
        {
            get;
            set;
        }

        //William Moreira da Silva - SOL 199759
        [DataMember]
        public List<Int32> avalistas
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 199759

        //William Moreira da Silva - SIG27879 - INICIO
        /// <summary>
        /// Taxa de juros de Correção Monetari
        /// </summary>
        [DataMember]
        public double? taxaCorrecao
        {
            get;
            set;
        }
        //William Moreira da Silva - SIG27879 - FIM

        // Felipe A. Santos SOL 224034/17909 PPM 1165556  - início
        [DataMember]
        public int FlagAcordoJudicial
        {
            get;
            set;
        }
        //SIG 67808 - Campanha Descontos- Matias  
        [DataMember]
        public int FlgCampanhaDescontos
        {
            get;
            set;
        }

        //SIG 48294
        [DataMember]
        public string ProtocoloCRM
        {
            get;
            set;
        }

        [DataMember]
        public bool LiquidoZero {get;set;}
        
        [DataMember]
        public string SistemaAmortizacao { get; set; }

        public string MatriculaMutuario { get; set; }

        [DataMember]
        public string DataLimite  {get; set;}

        //SIG 130739

        [DataMember]
        public string ProvisaoPerda { get; set; }

        [DataMember]
        public DateTime DataInclusao { get; set; }

        [DataMember]
        public string MensagemErro { get; set; }


    }
}