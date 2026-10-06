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
    internal class Regra6170 : RegraBase 
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(8);
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null); // xavier alterar a assinatura da regra 6170 conforme e-mail
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDPLANO_P", null); // xavier alterar a assinatura da regra 6170 conforme e-mail
            parametros.Add("SITFUNDACAO_P", null); // xavier alterar a assinatura da regra 6170 conforme e-mail
            parametros.Add("IDPATRO_P", null);     // xavier alterar a assinatura da regra 6170 conforme e-mail            
            parametros.Add("DATAASSINATURA_P", null);
            //parametros.Add("EXCEPCIONAL_P", null); // Felipe A. Santos SOL 208770 Kintana 2016022
            parametros.Add("EXCEPCIONALOUTROS_P", null); // Felipe A. Santos SOL 208770 Kintana 2016022
            parametros.Add("IDCALCULO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
            parametros.Add("USUARIO_P", null); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                                               
            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra6170(parametros);

        }
    }
}
