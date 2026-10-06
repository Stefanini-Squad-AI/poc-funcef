using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25530 :RegraBase, IRegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(13);
            
            parametros.Add("IDCONTRATO_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
 			parametros.Add("IDMUTUARIO_P", null);
 		    parametros.Add("IDTITULAR_P",null);
  			parametros.Add("IDPATRO_P",null);
 			parametros.Add("IDOPERACAO_P",null);
            parametros.Add("IDTIPOSUSPENSAO_P",null);
            parametros.Add("DATAINICIOSUSP_P",null);
            parametros.Add("EXCEPCIONAL_P",null);
            parametros.Add("QTDMESES_P",null);
            parametros.Add("FLGINTERNO_P",null);
            parametros.Add("IDCALCULO_P",null);
            parametros.Add("USUARIO_P", null);

            return parametros;

        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25530(parametros);
        }

        #region IRegraBase Members

        public object executarRetorno(IDictionary<string, object> parametros, ref string mensagem)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25530(parametros, ref mensagem);
        }

        #endregion
    }
}
