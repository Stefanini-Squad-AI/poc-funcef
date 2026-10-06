#region SIG 27535
///
/// Autor:
/// William Moreira da Silva
///
/// Data da Alteração:
/// 16/08/2016
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra26921 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(11);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("IDCONTRATOAQUITAR_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("VALORSOLICITADO_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26921(parametros);
        }
    }
}
