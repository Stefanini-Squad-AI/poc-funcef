#region SIG 27179
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Alteração da regra 25525
///
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25525 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(7);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null); // xavier alterado conforme e-mail
            parametros.Add("TXJUROS_P", null); // xavier alterado conforme e-mail
            parametros.Add("ORIGEM_P", null); // xavier alterado conforme e-mail

            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("DATAREFERENCIA_P", null);

            parametros.Add("NUMPARCELAS_P", null);//William Moreira da Silva - SIG 27179 

            parametros.Add("IDCALCULO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("USUARIO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25525(parametros);
        }
    }
}
