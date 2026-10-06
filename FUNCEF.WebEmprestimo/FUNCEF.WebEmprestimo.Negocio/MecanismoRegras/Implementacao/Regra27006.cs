using System.Collections.Generic;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra27006 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(13);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDCONTRATOEMPTMO", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("PARCELA_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("VLRPARCELA_P", null);
            parametros.Add("DATAPARCELA_P", null);
            parametros.Add("DATAEVENTO_P", null);
            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);
            parametros.Add("TIPOPROPOSTA_P", null);

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra27006(parametros);
        }
    }
}
