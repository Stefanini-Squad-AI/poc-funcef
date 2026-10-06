
using System;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
   public class TaxaJurosDTO 
    {
        public int? Id { get; set; }
        public int MesInicial { get; set; }
        public int MesFinal { get; set; }
        public decimal Taxa { get; set; }
        public string InicioVigencia { get; set; }        
        public DateTime DataInicio { get; set; }
        public DateTime DataTermino { get; set; }
        public int TipoContrato { get; set; }
        public int PrazoMaximo { get; set; }
        public string Periodo { get; set; }        
    }
}
