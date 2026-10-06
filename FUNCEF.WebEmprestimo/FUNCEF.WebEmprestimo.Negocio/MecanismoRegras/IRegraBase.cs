using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras
{
    public interface IRegraBase
    {
        object executarRetorno(IDictionary<string, object> parametros, ref string mensagem);
    }
}
