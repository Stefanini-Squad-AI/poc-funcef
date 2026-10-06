using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25763 : RegraBase, IRegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(5);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("SALDOANTERIOR_P", null);
            parametros.Add("DATACREDITO_P", null);
            
            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25763(parametros);
        }

        #region IRegraBase Members

        public object executarRetorno(IDictionary<string, object> parametros, ref string mensagem)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25763(parametros, ref mensagem);
        }

        #endregion
    }
}
