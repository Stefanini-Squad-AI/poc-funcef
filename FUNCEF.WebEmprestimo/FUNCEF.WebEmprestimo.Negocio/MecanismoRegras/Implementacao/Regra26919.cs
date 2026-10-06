#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
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
    internal class Regra26919 : RegraBase, IRegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(16);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("IDTIPOEMPRESTIMO_P", null);
            parametros.Add("IDPLANO_P", null);
            parametros.Add("IDCONTRATOAQUITAR_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("SALDODEVEDOR_P", null);
            parametros.Add("TAXAJUROS_P", null);
            //William Moreira da Silva - SIG 27879 - INICIO
            parametros.Add("TAXACORRECAO_P", null);
            //William Moreira da Silva - SIG 27879 - Fim
            parametros.Add("VALORMARGEM_P", null);
            parametros.Add("QTDMESES_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("VALORSOLICITADO_P", null);
            parametros.Add("EXCEPCIONALOUTROS_P", null);
          
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26919(parametros);
        }

        #region IRegraBase Members

        public object executarRetorno(IDictionary<string, object> parametros, ref string mensagem)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26919(parametros, ref mensagem);
        }

        #endregion
    }
}
