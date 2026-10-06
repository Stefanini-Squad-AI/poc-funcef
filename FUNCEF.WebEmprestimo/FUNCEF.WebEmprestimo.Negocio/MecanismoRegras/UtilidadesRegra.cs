using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras
{
    public static class UtilidadesRegra
    {
        public static void associarParametros(IDictionary<string, object> dicionarioBase, IDictionary<string, object> destino)
        {

            foreach (KeyValuePair<string, object> item in dicionarioBase)
            {
                if (destino.ContainsKey(item.Key))
                {
                    destino[item.Key] = item.Value;
                }
            }
        }
    }
}
