//Xavier - CRIAÇÃO DA REGRA DE IOF
//06/11/2012

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra26433 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(8);

            parametros.Add("IDCONTRATO_P", null);
            parametros.Add("IDITEMEMPTMO_P", null);
            parametros.Add("VLRAMORTIZACAO_P", null);
            parametros.Add("DATAAMORTIZACAO_P", null);
            parametros.Add("NOVOPRAZO_P", null);
            parametros.Add("PRAZOANT_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);
                        
            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26433(parametros);
        }
    }
}
