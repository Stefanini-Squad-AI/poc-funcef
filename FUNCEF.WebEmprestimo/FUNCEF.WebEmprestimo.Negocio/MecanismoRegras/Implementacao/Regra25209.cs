#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 27/04/2016 09:12:00
///
/// Descrição da Alteração:
/// Incremento do parâmetro VALORSOLICITADO_P
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras.Implementacao
{
    internal class Regra25209 : RegraBase
    {
        public override IDictionary<string, object> obterAssinaturaParametros()
        {
            IDictionary<string, object> parametros = new Dictionary<string, object>();
            /*parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDCONTRATO_P", null);
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATAASSINATURA_P", null);
            parametros.Add("SALDODEVEDOR_P", null);*/


            //William Moreira da Silva SOL 201773 KINTANA 1950518
            parametros.Add("IDMUTUARIO_P", null);
            parametros.Add("IDTITULAR_P", null);
            parametros.Add("IDCONTRATOEMPTMO", null); //Willamy Henriquen SOL - 239238 PPM - 514531
            parametros.Add("IDTIPOCONTRATO_P", null);
            parametros.Add("IDOPERACAO_P", null);
            parametros.Add("DATACREDITO_P", null);
            parametros.Add("DATAPRIMEIRAPARCELA_P", null);
            parametros.Add("DATAEVENTO_P", null);

            #region Eliamar Tani - SOL 225057/18141 PPM 1315874
            parametros.Add("IDTIPOSUSPENSAO_P", 0);
            parametros.Add("VALORSOLICITADO_P", 0);
            #endregion

            parametros.Add("TAXAJUROS_P", null);
            parametros.Add("SALDODEVEDOR_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("USUARIO_P", null);
            //William Moreira da Silva SOL 201773 KINTANA 1950518


            return parametros;
        }

        public override object executar(IDictionary<string, object> parametros)
        {
            IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

            return acesso.regra25209(parametros);
        }
    }
}
