using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    //SIG 128871 - Aplicação de desconto no valor do FGQC - Criação a regra 27131 do novo item 159
    internal class Regra27131 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>();

            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDCONTRATOEMPTMO", null); 
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("DATAPRIMEIRAPARCELA_P", null);
            parametros.Add("DATAEVENTO_P", null);
            parametros.Add("IDTIPOSUSPENSAO_P", 0);
            parametros.Add("VALORSOLICITADO_P", 0);
            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("SALDODEVEDOR_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);          

            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra27131(parametros);
        }
    }
}
