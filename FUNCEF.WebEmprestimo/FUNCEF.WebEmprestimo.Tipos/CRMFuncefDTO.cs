using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class CRMFuncefDTO
    {
        public string NivelAtendimento { get { return Tipo; } }
        public string CanalAtendimento { get { return Canal; } }
        public string Tipo { get; set; }
        public string Canal { get; set; }
        public string Assunto { get; set; }
        public string Assunto2 { get; set; }
        public string Assunto3 { get; set; }
        public string Protocolo { get; set; }
        public string Situacao { get; set; }
    }
    public class CrmListaDTO
    {
        public List<CRMFuncefDTO> resultado { get; set; }
    }
}
