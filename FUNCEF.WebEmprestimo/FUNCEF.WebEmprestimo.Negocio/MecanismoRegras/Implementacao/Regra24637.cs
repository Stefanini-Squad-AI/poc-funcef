using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra24637 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(8);
            //William Moreira da Silva - Conforme Email
            parametros.Add("IDMUTUARIO_P",null);
            parametros.Add("IDTITULAR_P",null);
            parametros.Add("IDTIPOCONTRATO_P",null);
            parametros.Add("TAXAJUROS_P",null);
            parametros.Add("IDOPERACAO_P",null);
            parametros.Add("DATACREDITO_P",null);
            parametros.Add("VALORSOLICITADO_P",null);
            parametros.Add("DATAPRIMEIRAPARCELA_P",null);
            parametros.Add("IDCALCULO_P",null);
            parametros.Add("USUARIO_P", null);
            //William Moreira da Silva - Conforme Email

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra24637(parametros);
        }
    }
}
