
using System;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class Serasa

    {
        //Header
        public string Campo1 { get; set; }
        public string Campo2 { get; set; }   
        public string DataGeracao { get; set; }
        public string DDDResponsavel { get; set; }
        public string TelefoneResponsavel { get; set; }
        public string campo6 { get; set; }
        public string NomeResponsavel { get; set; }
        public string ConvenioSerasa { get; set; }
        public string NumRemessa { get; set; }
        public string Campo10 { get; set; }
        public string Campo11 { get; set; }
        public string Campo12 { get; set; }
        public string NumLogon { get; set; } 
        public string Campo14 { get; set; }
        public string Campo15 { get; set; }
        public string Campo16 { get; set; }

        //Body
        public string Modalidade { get; set; }
        public string NumeroContrato { get; set; }
        public double ValorContratado { get; set; }
        public string DataCredito { get; set; }       
        public DateTime DataInadimplencia { get; set; }
        public string NumeroPrestacao { get; set; }
        public double SaldoInadimplencia { get; set; }        
        public string FormaPagamento { get; set; }
        public string NomeParticipante { get; set; }
        public string DataNascimento { get; set; }
        public string Matricula { get; set; }
        public string NumCPF { get; set; }
        public string NomePai { get; set; }
        public string NomeMae { get; set; }

        public string Endereco { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public string UF { get; set; }
        public string CEP { get; set; }

        public string DDD { get; set; }
        public string Telefone { get; set; }

        //Body Contantes
        public string Campo1B { get; set; }
        public string Campo2B { get; set; }
        public string Campo3B { get; set; }  
        public string Campo7B { get; set; }
        public string Campo8B { get; set; }        
        public string Campo9 { get; set; }
        public string Campo12B { get; set; }
        public string Campo13B { get; set; }
        public string Campo14B { get; set; }
        public string Campo15B { get; set; }
        public string Campo16B { get; set; }
        public string Campo17B { get; set; }
        public string Campo18B { get; set; }
        public string Campo19B { get; set; }
        public string Campo20B { get; set; }
        public string Campo21B { get; set; }
        public string Campo33B { get; set; }
        public string Campo39B { get; set; }
        public string Campo40B { get; set; }
        public string Campo41B { get; set; }
        public string Campo42B { get; set; }

        //Trailler
        public string Sequencial { get; set; }
        public string Campo1T { get; set; }

        public string LinhaHeader { get; set; }
        public string LinhaBody { get; set; }
        public string LinhaTrailer { get; set; }

        public DateTime DataEventoCobranca { get; set; }
        //public DateTime DataFinal { get; set; }        
        public string LogonSerasa { get; set; }
        public int IdEventoCobranca { get; set; }

    }
}
