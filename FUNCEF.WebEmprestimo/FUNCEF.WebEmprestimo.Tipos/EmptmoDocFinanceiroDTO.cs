using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
   public class EmptmoDocFinanceiroDTO
    {
        public Int32 portadorForma { get; set; }
        public double numDocumento { get; set; }
        public double valorDocumento { get; set; }
        public string msgErro { get; set; }
        public string codErro { get; set; }
    }
}
