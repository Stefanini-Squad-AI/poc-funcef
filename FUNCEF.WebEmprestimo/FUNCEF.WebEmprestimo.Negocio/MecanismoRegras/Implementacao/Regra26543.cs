using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    public class Regra26543 : RegraBase
    {
        //NILTON - 19/12/12
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(10);            
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDITEMEMPTMO_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);
            parametros.Add("TAXAJUROS_P", null);            
            parametros.Add("IDCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATAQUITACAO_P", null);

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();
            return acesso.regra26543(parametros);
        }
    }
}
