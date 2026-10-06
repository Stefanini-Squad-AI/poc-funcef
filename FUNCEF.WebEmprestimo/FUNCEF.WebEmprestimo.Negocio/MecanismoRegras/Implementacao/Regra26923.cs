#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra26923 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(8);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null); 
            parametros.Add("TXJUROS_P", null);
            parametros.Add("ORIGEM_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("DATAREFERENCIA_P", null);
            parametros.Add("MOECODIGO_P", null);
            parametros.Add("NUMPARCELAS_P", null);      
            parametros.Add("IDCALCULO_P", null);        
            parametros.Add("USUARIO_P", null);          

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26923(parametros);
        }
    }
}
