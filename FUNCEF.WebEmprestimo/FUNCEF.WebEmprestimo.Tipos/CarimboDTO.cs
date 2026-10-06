using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [Serializable]
    public class CarimboDTO
    {
        public string CodErro { get; set; }
        public string MsgErro { get; set; }
        public string Codigo_Hash { get; set; }
        public string IDCarimbo { get; set; }
        public string ACTEmissor { get; set; }
        public string Algoritmo { get; set; }
        public string Carimbo { get; set; }
        public string DataHoraUTC { get; set; }
        public string DadosContratoHash { get; set; }
        public bool gerado { get; set; }
        public string HorasTimezone { get; set; }
    }
}
