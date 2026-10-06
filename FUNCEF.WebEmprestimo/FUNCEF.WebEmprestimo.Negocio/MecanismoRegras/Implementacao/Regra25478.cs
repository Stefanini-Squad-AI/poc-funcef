using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25478 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME COMBINADO COM O SAULO
            IDictionary<string, object> parametros = new Dictionary<string, object>(8);
            parametros.Add("IDHISTMOVEMPTMO_P", null); 
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATAEVENTO_P", null);
            parametros.Add("IDCALCULO_P", null); 
            parametros.Add("USUARIO_P", null); 
            //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME COMBINADO COM O SAULO

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25478(parametros);
        }
    }
}
