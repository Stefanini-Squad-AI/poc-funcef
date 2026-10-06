using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25789 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(8);
            parametros.Add("IDPESSOA_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATAATUALIZA_P", null);
            parametros.Add("IDTIPOEMPRESTIMO_P", null);
            parametros.Add("IDCALCULO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("USUARIO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();
            return acesso.regra25789(parametros);
        }
    }
}
