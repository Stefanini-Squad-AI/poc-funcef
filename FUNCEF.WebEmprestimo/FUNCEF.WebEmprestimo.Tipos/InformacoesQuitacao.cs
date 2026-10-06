using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [Serializable]
    public class InformacoesQuitacao
    {
        public Dictionary<String, Double> itens { get; set; }
        public int origem { get; set; }
        public DateTime dataQuitacao { get; set; }
        public Double devolPrestEnviada { get; set; }
        public int sitBoleto { get; set; }
        public Double valorQuitacao { get; set; }
    }
}
