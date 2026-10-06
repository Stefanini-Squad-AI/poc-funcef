using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra6062 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(7);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("IDITEMEMPTMO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("SALDOANTERIOR_P", null);
            parametros.Add("VALORDESCONTO_P", null);
            parametros.Add("IDCONTRATOAQUITAR_P", null);
            parametros.Add("IDCALCULO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("USUARIO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra6062(parametros);
        }
    }
}
