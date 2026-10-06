using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;


namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [Serializable]
    public class ContratoDTO 
    {
        public ContratoDTO(string json) 
        {
            if (!string.IsNullOrEmpty(json))
            {
                JObject jObject = JObject.Parse(json);
                JToken jcontrato = jObject["resultado"];

                NumeroContrato = (Int64)jcontrato["NumeroContrato"];
                //TipoErro = (int) jcontrato["TipoErro"];
                NumParcelas = (int)jcontrato["NumParcelas"];
                Prazo = (int)jcontrato["Prazo"];
                ParcelasPagas = jcontrato["ParcelasPagas"].ToString() == "" ? 0 : (int)jcontrato["ParcelasPagas"];
                FlgPossuiCarimbo = jcontrato["FlgPossuiCarimbo"].ToString() == "" ? 0 : (int)jcontrato["FlgPossuiCarimbo"];
                FlgEfetivado = jcontrato["FlgEfetivado"].ToString() == "" ? 0 : (int)jcontrato["FlgEfetivado"];
                FlgLiquidoZero = jcontrato["FlgLiquidoZero"].ToString() == "" ? 0 : (int)jcontrato["FlgLiquidoZero"];
                TaxaJuros = jcontrato["TaxaJuros"].ToString() == "" ? 0 : (double)jcontrato["TaxaJuros"];
                PrestacaoBasica = jcontrato["PrestacaoBasica"].ToString() == "" ? 0 : (double)jcontrato["PrestacaoBasica"];
                Fgqc = jcontrato["Fgqc"].ToString() == "" ? 0 : (double)jcontrato["Fgqc"];
                FgqcBasico = jcontrato["FgqcBasico"].ToString() == "" ? 0 : (double)jcontrato["FgqcBasico"];
                Iof = jcontrato["Iof"].ToString() == "" ? 0 : (double)jcontrato["Iof"];
                Margem = jcontrato["Margem"].ToString() == "" ? 0 : (double)jcontrato["Margem"];
                SalarioBase = jcontrato["SalarioBase"].ToString() == "" ? 0 : (double)jcontrato["SalarioBase"];
                ConcessaoTaxaAdministrativa = (string)jcontrato["ConcessaoTaxaAdministrativa"];
                ConcessaoEmptmoAnterior = jcontrato["ConcessaoEmptmoAnterior"].ToString() == "" ? 0 : (double)jcontrato["ConcessaoEmptmoAnterior"];
                SaldoDevedor = jcontrato["SaldoDevedor"].ToString() == "" ? 0 : (double)jcontrato["SaldoDevedor"];
                SaldoInadimplente = jcontrato["SaldoInadimplente"].ToString() == "" ? 0 : (double)jcontrato["SaldoInadimplente"];
                DescontoInad = jcontrato["DescontoInad"].ToString() == "" ? 0 : (double)jcontrato["DescontoInad"];

                ValorLiquido = jcontrato["ValorLiquido"].ToString() == "" ? 0 : (double)jcontrato["ValorLiquido"];
                ValorMaximo = jcontrato["ValorMaximo"].ToString() == "" ? 0 : (double)jcontrato["ValorMaximo"];
                ValorSolicitado = jcontrato["ValorSolicitado"].ToString() == "" ? 0 : (double)jcontrato["ValorSolicitado"];
                ValorParcela = jcontrato["ValorParcela"].ToString() == "" ? 0 : (double)jcontrato["ValorParcela"];
                ValorQuitacao = jcontrato["ValorQuitacao"].ToString() == "" ? 0 : (double)jcontrato["ValorQuitacao"];
                DataCredito = jcontrato["DataCredito"].ToString() == "" ? DateTime.MinValue : (DateTime)jcontrato["DataCredito"];
                DataParcela = jcontrato["DataParcela"].ToString() == "" ? DateTime.MinValue : (DateTime)jcontrato["DataParcela"];
                DataAssinatura = jcontrato["DataAssinatura"].ToString() == "" ? DateTime.MinValue : (DateTime)jcontrato["DataAssinatura"];
                DataSaldo = jcontrato["DataSaldo"].ToString() == "" ? DateTime.MinValue : (DateTime)jcontrato["DataSaldo"];
                Valido = (bool)jcontrato["Valido"];
                MsgErro = (string)jcontrato["MsgErro"];
                DadosBancarios = (string)jcontrato["DadosBancarios"];
                Modalidade = (string)jcontrato["Modalidade"];
                ModalidadeResumida = (string)jcontrato["ModalidadeResumida"];
                ContrAntQuit = (string)jcontrato["ContrAntQuit"];
                FlgObrigatorio = (string)jcontrato["FlgObrigatorio"];
                SeloCarimboTempo = (string)jcontrato["SeloCarimboTempo"];
                Ip = (string)jcontrato["Ip"];

                Matricula = (string)jcontrato["Matricula"];
                Nome = (string)jcontrato["Nome"];
                Cpf = (string)jcontrato["Cpf"];
                Rg = (string)jcontrato["Rg"];
                Logradouro = (string)jcontrato["Logradouro"];
                Bairro = (string)jcontrato["Bairro"];
                Cidade = (string)jcontrato["Cidade"];
                Uf = (string)jcontrato["Uf"];
                Cep = (string)jcontrato["Cep"];
                TelCelular = (string)jcontrato["TelCelular"];
                TelComercial = (string)jcontrato["TelComercial"];
                TelResidencial = (string)jcontrato["TelResidencial"];
                Agencia = (string)jcontrato["Agencia"];
                Operacao = (string)jcontrato["Operacao"];
                Conta = (string)jcontrato["Conta"];
                Emails = (string)jcontrato["Emails"];
                ValorMaxPermitido = (double)jcontrato["ValorMaxPermitido"];
                Codigo_Hash = (string)jcontrato["Codigo_Hash"];
                HashAssinatura = (string)jcontrato["HashAssinatura"];
                DataHoraCarimboTempo = (string)jcontrato["DataHoraCarimboTempo"];
                IdTipoContrato = (int)jcontrato["IdTipoContrato"];
                ContratoQuitaAnterior = (string)jcontrato["ContratoQuitaAnterior"];
                IdPessoa = (Int64)jcontrato["IdPessoa"];
                IdTitular = (Int64)jcontrato["IdTitular"];
                ConcessaoInternet = (int)jcontrato["ConcessaoInternet"];                
                ContratoImpressao = jcontrato["ContratoImpressao"].ToString() == "" ? null : (byte[])jcontrato["ContratoImpressao"];

                profissao = (string)jcontrato["profissao"];

                var aux = jcontrato["tipoCobranca"];
                tipoCobranca = (TipoCobranca)(int)jcontrato["tipoCobranca"];
                NomeTestemunha1 = jcontrato["NomeTestemunha1"] == null ? string.Empty : (string)jcontrato["NomeTestemunha1"];
                CpfTestemunha1 = jcontrato["CpfTestemunha1"] == null ? string.Empty : (string)jcontrato["CpfTestemunha1"];
                NomeTestemunha2 = jcontrato["NomeTestemunha2"] == null ? string.Empty : (string)jcontrato["NomeTestemunha2"];
                CpfTestemunha2 = jcontrato["CpfTestemunha2"] == null ? string.Empty : (string)jcontrato["CpfTestemunha2"];
                ContratoHTML = jcontrato["ContratoHTML"] == null ? string.Empty : jcontrato["ContratoHTML"].ToString();
                PossuiDesconto = Convert.ToBoolean(jcontrato["PossuiDesconto"]);
            }
        }
        

        public Int64? Id { get; set; }
        public Int64? NumeroContrato { get; set; }
        public int TipoErro { get; set; }
        public int NumParcelas { get; set; }
        public int TipoContrato { get; set; }
        public int Elegivel { get; set; }
        public int Prazo { get; set; }
        public int ParcelasPagas { get; set; }
        public int FlgPossuiCarimbo { get; set; }
        public int FlgEfetivado { get; set; }
        public int FlgLiquidoZero { get; set; }        
        public double? TaxaJuros { get; set; }
        public double? PrestacaoBasica { get; set; }
        public double? Fgqc { get; set; }
        public double? FgqcBasico { get; set; }
        public double? Iof { get; set; }
        public double? Margem { get; set; }
        public double? SalarioBase { get; set; }
        public string ConcessaoTaxaAdministrativa { get; set; }
        public double? ConcessaoEmptmoAnterior { get; set; }
        public double? SaldoDevedor { get; set; }
        public double? SaldoInadimplente { get; set; }
        public double? DescontoInad { get; set; }

        
        public double? ValorLiquido { get; set; }
        public double? ValorMaximo { get; set; }
        public double? ValorSolicitado { get; set; }
        public double? ValorParcela { get; set; }
        public double? ValorQuitacao { get; set; }


        public DateTime? DataCredito { get; set; }
        public DateTime? DataParcela { get; set; }
        public DateTime? DataAssinatura { get; set; }
        public DateTime? DataSaldo { get; set; }

        public bool Valido { get; set; } = false;
        public string MsgErro { get; set; }
        public string DadosBancarios { get; set; }
        public string Modalidade { get; set; }
        public string ModalidadeResumida { get; set; }
        public string ContrAntQuit { get; set; }
        public string FlgObrigatorio { get; set; }
        public string SeloCarimboTempo { get; set; }
        public string Ip { get; set; }

        public DateTime? DtVigenciaTaxaJuros { get; set; }

        public List<TaxaJurosDTO> TaxasJuros { get; set; }
        public List<TaxaJurosDTO> TaxasJuros13Sal { get; set; }
        public List<TaxaFGQCDTO> TaxasFGQC { get; set; }
        public string TaxaADM { get; set; }

        public int CodModalidadeVariavel { get; set; }
        public int CodModalidadeFixa { get; set; }
        public bool ParticipantePossuiEquacionamento { get; set; }
        public bool PossuiAssinaturaContratoPadraoDia { get; set; }


        public string Matricula { get; set; }
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Rg { get; set; }
        public string Logradouro { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public string Uf { get; set; }
        public string Cep { get; set; }
        public string TelCelular { get; set; }
        public string TelComercial { get; set; }
        public string TelResidencial { get; set; }
        public string Agencia { get; set; }
        public  string Operacao { get; set; }
        public  string Conta { get; set; }
        public  string Emails { get; set; }
        public double? ValorMaxPermitido { get; set; }
        public  string Codigo_Hash { get; set; }
        public  string HashAssinatura { get; set; }
        public  string DataHoraCarimboTempo { get; set; }
        public  int IdTipoContrato { get; set; }
        public  string ContratoQuitaAnterior { get; set; }

        public  Int64? IdPessoa { get; set; }
        public  Int64? IdTitular { get; set; }
        public int? ConcessaoInternet { get; set; }
        public byte[] ContratoImpressao { get; set; }

        public List<DescontoInadimplencia> descontoInadimplencia { get; set; }
        public List<Pessoa> fiadores { get; set; }

        public bool financiamento { get; set; }
        
        public double valorFinanciamento { get; set; }
        public int PropostaCampanha { get; set; }

        public string profissao { get; set; }

        public TipoCobranca tipoCobranca { get; set; }

        public string NomeTestemunha1 { get; set; }
        public string CpfTestemunha1 { get; set; }
        public string NomeTestemunha2 { get; set; }
        public string CpfTestemunha2 { get; set; }
        public string ContratoHTML { get; set; }
        public bool PossuiDesconto { get; set; }
    }
}
