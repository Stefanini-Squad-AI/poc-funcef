using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class ObjetoEnvio
    {
        public long idContratoEmptmo{ get; set; }

        public string patrocinadoras { get; set; }

        public string planos { get; set; }

        public int flgFolhaPatro { get; set; }

        public int flgFolhaBenef { get; set; }

        public int flgFinanRec { get; set; }

        public DateTime dataVencto { get; set; }

        public string usuario { get; set; }

        public DateTime dataHora { get; set; }

        public int flgDesativaConc { get; set; }
    }
}
