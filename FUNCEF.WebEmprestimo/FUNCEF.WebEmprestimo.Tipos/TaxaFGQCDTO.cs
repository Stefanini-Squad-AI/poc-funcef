
using System;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class TaxaFGQCDTO 
    {
        public virtual int? Id { get; set; }
        public virtual string FaixaEtariaMax { get; set; }
        public virtual decimal Taxa { get; set; }
        public virtual int TipoContrato { get; set; }
    }
}
