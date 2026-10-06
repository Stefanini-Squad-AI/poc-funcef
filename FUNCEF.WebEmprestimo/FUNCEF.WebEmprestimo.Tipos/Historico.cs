using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa histórico.
    /// </summary>
    [DataContract]
    [Serializable]
    public class Historico
    {
        [DataMember]
        public long id
        {
            get;
            set;
        }

        [DataMember]
        public long numeroContrato
        {
            get;
            set;
        }

        [DataMember]
        public FiltroHistorico filtroHistorico
        {
            get;
            set;
        }

        [DataMember]
        public ItemContrato item
        {
            get;
            set;
        }

        [DataMember]
        public ItemContrato itemCentraliza
        {
            get;
            set;
        }

        [DataMember]
        public int? parcela
        {
            get;
            set;
        }

        [DataMember]
        public TipoEvento tipoMovimento
        {
            get;
            set;
        }

        [DataMember]
        public Origem origem
        {
            get;
            set;
        }

        [DataMember]
        public string formaCobranca
        {
            get;
            set;
        }

        [DataMember]
        public int sequenciaCobranca
        {
            get;
            set;
        }

        [DataMember]
        public int prioridade
        {
            get;
            set;
        }

        [DataMember]
        public int? centraliza
        {
            get;
            set;
        }

        [DataMember]
        public int? destacado
        {
            get;
            set;
        }

        [DataMember]
        public int? divergencia
        {
            get;
            set;
        }

        [DataMember]
        public int? divergenciaTratada
        {
            get;
            set;
        }

        [DataMember]
        public DateTime data
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataPrevista
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataEfetiva
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataEnvio
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataRecebimento
        {
            get;
            set;
        }        

        [DataMember]
        public DateTime dataAtualizacao
        {
            get;
            set;
        }

        [DataMember]
        public int? anoCompetencia
        {
            get;
            set;
        }

        [DataMember]
        public int? mesCompetencia
        {
            get;
            set;
        }

        [DataMember]
        public int? anoCobranca
        {
            get;
            set;
        }

        [DataMember]
        public int? mesCobranca
        {
            get;
            set;
        }

        [DataMember]
        public double valorPrevisto
        {
            get;
            set;
        }

        [DataMember]
        public double? valorEfetivo
        {
            get;
            set;
        }
        // SOL 202210
        [DataMember]
        public string valorEfetivoTexto
        {
            get;
            set;
        }
        // SOL 202210
        [DataMember]
        public double saldoDevedor
        {
            get;
            set;
        }

        [DataMember]
        public double? taxaJuros
        {
            get;
            set;
        }

        [DataMember]
        public int? baixado
        {
            get;
            set;
        }

        [DataMember]
        public int? baixaManual
        {
            get;
            set;
        }

        [DataMember]
        public int? rubrica
        {
            get;
            set;
        }

        [DataMember]
        public string pagarReceber
        {
            get;
            set;
        }

        [DataMember]
        public int numeroParcelas
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataVencimento
        {
            get;
            set;
        }

        [DataMember]
        public int tipoDivergencia
        {
            get;
            set;
        }

        [DataMember]
        public DateTime dataInclusao
        {
            get;
            set;
        }

        [DataMember]
        public string usuarioInclusao
        {
            get;
            set;
        }

        [DataMember]
        public string versao
        {
            get;
            set;
        }

        [DataMember]
        public Patrocinadora patrocinadora
        {
            get;
            set;
        }

        [DataMember]
        public TipoRecurso tipoRecurso
        {
            get;
            set;
        }

        [DataMember]
        public TipoSuspensao tipoSuspensao
        {
            get;
            set;
        }

        [DataMember]
        public string origemRecurso
        {
            get;
            set;
        }

        [DataMember]
        public int? envio
        {
            get;
            set;
        }

        [DataMember]
        public int? enviado
        {
            get;
            set;
        }

        [DataMember]
        public int? estorno
        {
            get;
            set;
        }

        /// <summary>
        /// preenchido com número da prestação paga e reiniciado toda vez que ocorrer um
        /// refinanciamento, ou seja, o refinanciamento preenche esse campo com o valor
        /// igual a 0.
        /// </summary>
        [DataMember]
        public int parcelaAlternativa
        {
            get;
            set;
        }

        [DataMember]
        public string observacao
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataTratamento
        {
            get;
            set;
        }

        [DataMember]
        public string tipoTratamento
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataParaEstorno
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataDoEstorno
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataQuitacao
        {
            get;
            set;
        }

        [DataMember]
        public DateTime? dataAbono
        {
            get;
            set;
        }

        [DataMember]
        public int? suspenso
        {
            get;
            set;
        }

        [DataMember]
        public double? valorBase
        {
            get;
            set;
        }

        [DataMember]
        public int? entradaManual
        {
            get;
            set;
        }

        [DataMember]
        public string usuario
        {
            get;
            set;
        }

        [DataMember]
        public int? abonado
        {
            get;
            set;
        }

        [DataMember]
        public int? quitado
        {
            get;
            set;
        }

        [DataMember]
        public List<Flag> flags
        {
            get;
            set;
        }

        [DataMember]
        public string parcelaCompleta
        {
            get;
            set;
        }

        [DataMember]
        public string tipoFolha
        {
            get;
            set;
        }

        [DataMember]
        public long? chaveFolha
        {
            get;
            set;
        }

        [DataMember]
        public long? codigoDocumento
        {
            get;
            set;
        }

        //William Moreira da Silva SOL 220958 KTN 2053543
        [DataMember]
        public long? numeroDocumento
        {
            get;
            set;
        }

        [DataMember]
        public String sitEnvio
        {
            get;
            set;
        }

        [DataMember]
        public String cContabilDebito
        {
            get;
            set;
        }

        [DataMember]
        public String cContabilCredito
        {
            get;
            set;
        }

        [DataMember]
        public int plnPlanil
        {
            get;
            set;
        }

        [DataMember]
        public int plnPlanilEstorno
        {
            get;
            set;
        }

        [DataMember]
        public string statusDocumento
        {
            get;
            set;
        }
        //William Moreira da Silva SOL 220958 KTN 2053543

        [DataMember]
        public TipoEventoCobranca eventoCobranca
        {
            get;
            set;
        }

        //PLNCodigo
        [DataMember]
        public long? planilha
        {
            get;
            set;
        }

        //HMEDATAQUITABONO
        [DataMember]
        public DateTime? dataAbonoQuitacao
        {
            get;
            set;
        }

        //IDTMPDESC
        [DataMember]
        public long? idTMPDesc
        {
            get;
            set;
        }


        //PLNCODIGOESTORNO -- PLN
        [DataMember]
        public long? plnCodEstorno
        {
            get;
            set;
        }
        
        //IDTIPOSUSPEMPTMO
        [DataMember]
        public long? idTipoSusp
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 200709
        [DataMember]
        public String DescricaoItem
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 200709

        //William Moreira da Silva - SOL 216458 KTN
        [DataMember]
        public DadosBancarios dadosBancarios
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 216458 KTN

        //William Moreira da Silva - SOL 207977 PPM
        [DataMember]
        public string anoMesCobranca
        {
            get;
            set;
        }

        [DataMember]
        public Int32 idRegra
        {
            get;
            set;
        }

        [DataMember]
        public int? tratamentoIndividual
        {
            get;
            set;
        }

        [DataMember]
        public bool selecionado
        {
            get;
            set;
        }

        [DataMember]
        public string mesSuspensao
        {
            get;
            set;
        }

        [DataMember]
        public string anoSuspensao
        {
            get;
            set;
        }

        [DataMember]
        public int gravaZero
        {
            get;
            set;
        }

        //Propriedade usada para quando o usuario utilizar o botão voltar, e não precisa calcular novamente os encargos
        [DataMember]
        public bool calculado
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 207977 PPM

        [DataMember]
        public bool flgCampanhaDesconto
        {
            get;
            set;
        }

        [DataMember]
        public bool LiquidoZero {get;set;}
    }
}