using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25773 : RegraBase, IRegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(16);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDCONTRATO_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("IDTIPOEMPRESTIMO_P", null);
            parametros.Add("IDPLANO_P", null);
            parametros.Add("IDCONTRATOAQUITAR_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("SALDODEVEDOR_P", null);
            parametros.Add("SALDOANTERIOR_P", null);
            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("VALORMARGEM_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("DATAASSINATURA_P", null);
            parametros.Add("DATAPRIMEIRAPARCELA_P", null);
            parametros.Add("VALORSOLICITADO_P", null);
            parametros.Add("EXCEPCIONAL_P", null);

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25773(parametros);
        }

        #region IRegraBase Members

        public object executarRetorno(IDictionary<string, object> parametros, ref string mensagem)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25773(parametros, ref mensagem);
        }

        #endregion
    }
}
