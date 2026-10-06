using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25083 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            //William Moreira da Silva - Conforme Email
            IDictionary<string, object> parametros = new Dictionary<string, object>(10);//NILTON CORRECAO
            parametros.Add("IDCONTRATO_P", null);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("IDITEMEMPTMO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATAQUITACAO_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);
            parametros.Add("RESULTADO_P", null);
            parametros.Add("RETORNO_P", null);
            //William Moreira da Silva - Conforme Email
            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25083(parametros);
        }
    }
}
