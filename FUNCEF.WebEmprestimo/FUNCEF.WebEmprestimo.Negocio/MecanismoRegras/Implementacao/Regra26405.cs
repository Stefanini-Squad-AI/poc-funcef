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

//BRUNO AZEVEDO - CRIAÇÃO DA REGRA DE IOF
//19/09/2012

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra26405 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>(6);
            
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDITEMEMPTMO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("IDCONTRATOAQUITAR_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("NUMPARCELAS_P", null); 
            parametros.Add("TAXAJUROS_P", null); 
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("DATAPRIMEIRAPARCELA_P", null);
            parametros.Add("DATAASSINATURA_P", null);
            parametros.Add("VALORSOLICITADO_P", null);
            parametros.Add("LIQUIDOZERO_P", null);
            // parametros.Add("EXCEPCIONAL_P", null); // Felipe A. Santos SOL 208770 Kintana 2016022
            parametros.Add("EXCEPCIONALOUTROS_P", null); // Felipe A. Santos SOL 208770 Kintana 2016022 
                
            parametros.Add("IDCALCULO_P", null); 
            parametros.Add("USUARIO_P", null); 

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra26405(parametros);
        }
    }
}
