using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class itemPrestacaoDTO
    {
        public long NumeroContrato { get; set; }
        public double Parcela { get; set; }
        public double CorrecaoMonetaria { get; set; }
        public double JurosRemuneratorios { get; set; }
        public double JurosMora { get; set; }
        public double Multa { get; set; }
        public double IofComplementar { get; set; }
        public double SaldoDevedor { get; set; }
        public double TotalEncargos { get; set; }        
        public double ValorTotal { get; set; }
        public double SaldoDevedorVencido { get; set; }
        public double FGQC { get; set; }
    }
}

