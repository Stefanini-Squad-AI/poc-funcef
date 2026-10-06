using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra26055 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(13);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("IDCONTRATOEMPTMO", null);//Willamy Henrique SOL- 239238 PPM - 514531
            parametros.Add("IDTIPOCONTRATO_P", null); 
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("DATAPRIMEIRAPARCELA_P", null);
            parametros.Add("DATAEVENTO_P", null);//NILTON CORRECAO
            parametros.Add("IDTIPOSUSPENSAO_P", null);
            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("SALDODEVEDOR_P", null);//NILTON CORRECAO
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("IDCALCULO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("USUARIO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26055(parametros);
        }
    }
}