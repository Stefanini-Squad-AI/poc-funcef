using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25702 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(13);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR", null);//NILTON - CORRECAO 
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDITEMEMPTMO_P", null); 
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("DATAPRIMEIRAPARCELA_P", null);
            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("VALORSOLICITADO_P", null);
            parametros.Add("SALDOANTERIOR_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("IDCALCULO_P", null); 
            parametros.Add("USUARIO_P", null); 

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25702(parametros);
        }
    }
}
