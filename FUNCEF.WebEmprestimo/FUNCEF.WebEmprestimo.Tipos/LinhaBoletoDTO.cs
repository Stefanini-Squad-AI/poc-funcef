using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class LinhaBoletoDTO
    {
        public string Rubrica { get; set; }
        public string Discriminacao { get; set; }
        public string Mes { get; set; }
        public decimal? Parcelas { get; set; }
        public decimal? ValorRecebido { get; set; }
    }
}
