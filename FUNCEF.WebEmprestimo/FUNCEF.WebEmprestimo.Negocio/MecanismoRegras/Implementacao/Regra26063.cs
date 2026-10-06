#region SOL 208770 / Kintana 2016022
///
/// Autor:
/// Felipe Azevedo dos Santos
///
/// Data da Alteração:
/// 18/03/2015
///
/// Descrição da Alteração:
/// Alteração no parâmetro EXCEPCIONAL.
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra26063 : RegraBase, IRegraBase       
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(15);
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
            parametros.Add("VALORMARGEM_P", null);
            parametros.Add("QTDMESES_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("VALORSOLICITADO_P", null);
            // parametros.Add("EXCEPCIONAL_P", null); // Felipe A. Santos SOL 208770 Kintana 2016022
            parametros.Add("EXCEPCIONALOUTROS_P", null); // Felipe A. Santos SOL 208770 Kintana 2016022 
            parametros.Add("IDCALCULO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("USUARIO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26063(parametros);
        }

        #region IRegraBase Members

        public object executarRetorno(IDictionary<string, object> parametros, ref string mensagem)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26063(parametros, ref mensagem);
        }

        #endregion
    }
}
