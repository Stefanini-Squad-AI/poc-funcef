#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// incluir novas tags/indicadores aos modelos de contrato de empréstimo.
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

//Objeto que recebera as informações do contrato que será impresso
namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class RelatorioContrato
    {
        [DataMember]
        public Mutuario mutuario { get; set; }

        [DataMember]
        public TipoContrato tipoContrato { get; set; }

        [DataMember]
        public DadosBancarios conta { get; set; }

        [DataMember]
        public string identidade { get; set; }

        [DataMember]
        public string logradouro { get; set; }

        [DataMember]
        //William Moreire da Silva - SOL 257695 PPM 964306
        //public int numero { get; set; }
        public string numero { get; set; }
        //William Moreire da Silva - SOL 257695 PPM 964306

        [DataMember]
        public string complemento { get; set; }

        [DataMember]
        public string bairro { get; set; }

        [DataMember]
        public Cidade cidade { get; set; }

        [DataMember]
        public UF uf { get; set; }

        [DataMember]
        public string cep { get; set; }

        [DataMember]
        public string numeroCelular { get; set; }

        [DataMember]
        public string numeroResidencial { get; set; }

        [DataMember]
        public string numeroComercial { get; set; }

        [DataMember]
        public string emailComercial { get; set; }

        [DataMember]
        public string emailPessoal { get; set; }

        [DataMember]
        public string nomeTest1 { get; set; }

        [DataMember]
        public string cpfTest1 { get; set; }

        [DataMember]
        public string nomeTest2 { get; set; }

        [DataMember]
        public string cpfTest2 { get; set; }

        [DataMember]
        public string profissao { get; set; }

        [DataMember]
        public long numeroContrato { get; set; }

        [DataMember]
        public double valorMaximo { get; set; }

        [DataMember]
        public double valorSolicitado { get; set; }

        [DataMember]
        public int prazo { get; set; }

        [DataMember]
        public Avalistas[] fiadores { get; set; }

        [DataMember]
        public bool financiamento { get; set; }

        [DataMember]
        public double valorFinanciamento { get; set; }

        [DataMember]
        public string contratosQuitados { get; set; }

        [DataMember]
        public double SaldoDevedor { get; set; }

        [DataMember]
        public double SaldoInadimplente { get; set; }

        [DataMember]
        public int impresso { get; set; }

        //William Moreira da Silva - SOL 257106 - PPM 956387
        [DataMember]
        public DateTime dataAssinatura { get; set; }
        //William Moreira da Silva - SOL 257106 - PPM 956387

        //Campanha Desconto
        [DataMember]
        public bool CampanhaDesconto { get; set; }
        [DataMember]
        public TipoCobranca tipoCobranca { get; set; }
        [DataMember]
        public DateTime? DataCredito { get; set; }

        [DataMember]
        public string Modalidade { get; set; }
        [DataMember]
        public int PropostaCampanha { get; set; }

        [DataMember]
        private List<DescontoInadimplencia> _descontos;
        public List<DescontoInadimplencia> descontoInadimplencia
        {
            get
            {
                if (_descontos == null)
                    _descontos = new List<DescontoInadimplencia>();
                return _descontos;
            }
            set
            {
                _descontos = value;
            }
        }
        public DateTime? DataVencimento { get; set; }
        //William Santana - SIG 50871 - Início
        [DataMember]
        public double txfgqc34 { get; set; }

        [DataMember]
        public double txfgqc35a49 { get; set; }

        [DataMember]
        public double txfgqc50a59 { get; set; }

        [DataMember]
        public double txfgqc60a74 { get; set; }

        [DataMember]
        public double txfgqc85 { get; set; }

        [DataMember]
        public double txfgqc75a84 { get; set; }

        [DataMember]
        public double txjuros24 { get; set; }

        [DataMember]
        public double txjuros25a48 { get; set; }

        [DataMember]
        public double txjuros49a72 { get; set; }

        [DataMember]
        public double txjuros73a96 { get; set; }

        [DataMember]
        public double txjuros97a120 { get; set; }

        [DataMember]
        public double txjuros12 { get; set; }

        [DataMember]
        public double txjuros13a24 { get; set; }

        [DataMember]
        public double txjuros25a36 { get; set; }

        [DataMember]
        public double txjuros37a48 { get; set; }

        [DataMember]
        public double txjuros13sal { get; set; }

        [DataMember]
        public string txadm { get; set; }

        [DataMember]
        public String dtiniciovegencia { get; set; }
        //William Santana - SIG 50871 - Fim

        //SIG 129005 - Identifica que o contrato utilizará as minutas antigas inseridas pela COPART
        [DataMember]
        public bool ContratoAntigoSemMinuta { get; set; }

        [DataMember]
        public DateTime? DataInicioVigencia { get; set; }

        [DataMember]
        public CarimboDTO Carimbo { get; set; }

        [DataMember]
        public string SeloCarimboTempo { get; set; }

        [DataMember]
        public byte[] ImagemSeloCarimbo { get; set; }


        [DataMember]
        public string DataInclusaoAssinatContratoP { get; set; }
        [DataMember]
        public string HorasTimezone { get; set; }
        [DataMember]
        public bool ContratacaoInternet { get; set; }
        [DataMember]
        public string DataCarimboTempo { get; set; }

        public DateTime DataInclusao { get; set; }

    }
}
