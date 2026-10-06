#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SIG 27535
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação das regras 26921 e 26919
///
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados das regras.
    /// </summary>
    public interface IAcessoRegra : IObjetoAcesso
    {

        //BRUNO AZEVEDO - CRIAÇÃO CONSULTA DO ÚLTIMO IDCALCULO CONFORME EMAIL
        /// <summary>
        /// Consultar o último IdCalculo para passar de parâmetro para a regra.
        /// </summary>
        int? consultarUltimoIdCalculo();
        //BRUNO AZEVEDO - CRIAÇÃO CONSULTA DO ÚLTIMO IDCALCULO CONFORME EMAIL

        /// <summary>
        /// Verifica se existe bloqueio contábil.
        /// </summary>
        /// <param name="dataReferencia">Data de referência.</param>
        bool consultarContabilidadeBloqueada(DateTime dataReferencia);

        /// <summary>
        /// Verifica se existe bloqueio contábil.
        /// </summary>
        DateTime? consultarDataLimiteBloqueio();

        /// <summary>
        /// Verifica períodos.
        /// </summary>
        /// <param name="dataReferencia">Data de referência.</param>
        int verificarPeriodo(DateTime dataReferencia);

        /// <summary>
        /// Consulta parametros do sistema.
        /// </summary>
        /// <returns>Hora de encerramenteo do sistema.</returns>
        ParametroSistema consultarParametroSistema();

        /// <summary>
        /// Obtem propriedades da regra
        /// </summary>
        /// <param name="idRegra">Identificador da regra</param>
        /// <returns>Retorna regra com as propriedades</returns>
        Regra obterPropriedades(int idRegra);

        #region Procedures

        /// <summary>
        /// Regra que calcula Data de crédito
        /// </summary>
        /// <param name="parametros">Data de Crédito</param>
        /// <returns></returns>
        DateTime regra6170(IDictionary<string, object> parametros);

        /// <summary>
        /// Regra que calcula Elegibilidade
        /// </summary>
        /// <param name="parametros">Data de Crédito</param>
        /// <returns></returns>
        Boolean regra25208(IDictionary<string, object> parametros);

        /// <summary>
        /// Regra Prazo Máximo
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns></returns>
        int regra25730(IDictionary<string, object> parametros);

        /// <summary>
        /// Regra Prazo Máximo
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns></returns>
        int regra5204(IDictionary<string, object> parametros);

        /// <summary>
        /// Regra prazo concessão
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Se o prazo está ok</returns>
        Boolean regra6346(IDictionary<string, object> parametros);

        /// <summary>
        /// Regra Salario Base
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Salário Base</returns>
        double regra25207(IDictionary<string, object> parametros);

        /// <summary>
        /// Regra Valor Reserva
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Valor Reserva</returns>
        double regra6485(IDictionary<string, object> parametros);

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        double regra2550(IDictionary<string, object> parametros);

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        double regra24800(IDictionary<string, object> parametros);

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        double regra24801(IDictionary<string, object> parametros);

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        double regra25525(IDictionary<string, object> parametros);

        //William Moreira da Silva - SIG 27879
        double regra26923(IDictionary<string, object> parametros);
        //William Moreira da Silva - SIG 27879

        double regra6146(IDictionary<string, object> parametros);

        double regra6150(IDictionary<string, object> parametros);

        double regra26543(IDictionary<string, object> parametros);  //NILTON - 19/12/12

        double regra6171(IDictionary<string, object> parametros);

        double regra6173(IDictionary<string, object> parametros);

        double regra6174(IDictionary<string, object> parametros);

        double regra6175(IDictionary<string, object> parametros);

        double regra6181(IDictionary<string, object> parametros);

        double regra6214(IDictionary<string, object> parametros);

        double regra24862(IDictionary<string, object> parametros);

        double regra24863(IDictionary<string, object> parametros);

        double regra24864(IDictionary<string, object> parametros);

        double regra24865(IDictionary<string, object> parametros);

        double regra24896(IDictionary<string, object> parametros);

        double regra25080(IDictionary<string, object> parametros);

        double regra25081(IDictionary<string, object> parametros);

        double regra25082(IDictionary<string, object> parametros);

        double regra25083(IDictionary<string, object> parametros);

        double regra25833(IDictionary<string, object> parametros);

        double regra25866(IDictionary<string, object> parametros);

        DateTime regra24823(IDictionary<string, object> parametros, ref string mensagem);

        DateTime regra24823(IDictionary<string, object> parametros);

        DateTime regra25530(IDictionary<string, object> parametros, ref string mensagem);

        DateTime regra25530(IDictionary<string, object> parametros);

        Double regra26490(IDictionary<string, object> parametros, ref string mensagem);

        Double regra26490(IDictionary<string, object> parametros);

        Double regra26491(IDictionary<string, object> parametros, ref string mensagem);

        Double regra26491(IDictionary<string, object> parametros);


        int regra26047(IDictionary<string, object> parametros);

        double regra21710(IDictionary<string, object> parametros);

        double regra24578(IDictionary<string, object> parametros);

        double regra25234(IDictionary<string, object> parametros);

        double regra25782(IDictionary<string, object> parametros);

        double regra25210(IDictionary<string, object> parametros);

        double regra25210(IDictionary<string, object> parametros, ref string mensagem);

        double regra25307(IDictionary<string, object> parametros);

        double regra25307(IDictionary<string, object> parametros, ref string mensagem);

        double regra25666(IDictionary<string, object> parametros);

        double regra25666(IDictionary<string, object> parametros, ref string mensagem);

        double regra25762(IDictionary<string, object> parametros);

        double regra25762(IDictionary<string, object> parametros, ref string mensagem);

        double regra25763(IDictionary<string, object> parametros);

        double regra25763(IDictionary<string, object> parametros, ref string mensagem);

        double regra25764(IDictionary<string, object> parametros);

        double regra25764(IDictionary<string, object> parametros, ref string mensagem);

        double regra25773(IDictionary<string, object> parametros);

        double regra25773(IDictionary<string, object> parametros, ref string mensagem);

        double regra25835(IDictionary<string, object> parametros);

        double regra25835(IDictionary<string, object> parametros, ref string mensagem);

        double regra26063(IDictionary<string, object> parametros, ref string mensagem);

        //William Moreira da Silva - SIG 27535
        double regra26919(IDictionary<string, object> parametros, ref string mensagem);

        double regra26919(IDictionary<string, object> parametros);
        //William Moreira da Silva - SIG 27535

        double regra26063(IDictionary<string, object> parametros);

        double regra5188(IDictionary<string, object> parametros);

        double regra5190(IDictionary<string, object> parametros);

        double regra6044(IDictionary<string, object> parametros);

        double regra6193(IDictionary<string, object> parametros);

        double regra21711(IDictionary<string, object> parametros);

        double regra24363(IDictionary<string, object> parametros);

        double regra24392(IDictionary<string, object> parametros);

        double regra24393(IDictionary<string, object> parametros);

        double regra25235(IDictionary<string, object> parametros);

        double regra25703(IDictionary<string, object> parametros);

        double regra21701(IDictionary<string, object> parametros);

        double regra22550(IDictionary<string, object> parametros);

        //William Moreira da Silva - SIG 27535
        double regra26921(IDictionary<string, object> parametros);
        //William Moreira da Silva - SIG 27535

        double regra26433(IDictionary<string, object> parametros); //NILTON

        double regra22552(IDictionary<string, object> parametros);

        double regra22554(IDictionary<string, object> parametros);

        double regra24637(IDictionary<string, object> parametros);

        double regra25674(IDictionary<string, object> parametros);

        double regra25739(IDictionary<string, object> parametros);

        double regra25775(IDictionary<string, object> parametros);

        double regra24498(IDictionary<string, object> parametros);

        double regra26055(IDictionary<string, object> parametros);

        double regra6062(IDictionary<string, object> parametros);

        //Sadi Freire SOL213592_Kintana2040335
        double regra26761(IDictionary<string, object> parametros);

        double regra24766(IDictionary<string, object> parametros);

        double regra24768(IDictionary<string, object> parametros);

        double regra25098(IDictionary<string, object> parametros);

        double regra25206(IDictionary<string, object> parametros);

        double regra25504(IDictionary<string, object> parametros);

        double regra25523(IDictionary<string, object> parametros);

        double regra25664(IDictionary<string, object> parametros);

        double regra24635(IDictionary<string, object> parametros);

        double regra25205(IDictionary<string, object> parametros);

        double regra25701(IDictionary<string, object> parametros);

        double regra25731(IDictionary<string, object> parametros);

        double regra25745(IDictionary<string, object> parametros);

        double regra25747(IDictionary<string, object> parametros);

        double regra25748(IDictionary<string, object> parametros);

        double regra25791(IDictionary<string, object> parametros);

        double regra25836(IDictionary<string, object> parametros);

        double regra25839(IDictionary<string, object> parametros);

        double regra25974(IDictionary<string, object> parametros);

        double regra26129(IDictionary<string, object> parametros);

        double regra21712(IDictionary<string, object> parametros);

        Boolean regra24631(IDictionary<string, object> parametros);

        string regra25478(IDictionary<string, object> parametros);

        //BRUNO AZEVEDO - CRIAÇÃO DA REGRA DE IOF
        double regra26405(IDictionary<string, object> parametros);
        double regra25485(IDictionary<string, object> parametros);

        DateTime regra25522(IDictionary<string, object> parametros);

        DateTime regra25522(IDictionary<string, object> parametros, ref string mensagem);

        Boolean regra25662(IDictionary<string, object> parametros);

        double regra25702(IDictionary<string, object> parametros);

        Boolean regra25789(IDictionary<string, object> parametros);

        double regra25816(IDictionary<string, object> parametros);

        DateTime regra25837(IDictionary<string, object> parametros);

        double regra26116(IDictionary<string, object> parametros);

        Boolean regra5099(IDictionary<string, object> parametros);

        double regra6183(IDictionary<string, object> parametros);

        double regra6184(IDictionary<string, object> parametros);

        double regra25209(IDictionary<string, object> parametros);

        double regra24357(IDictionary<string, object> parametros);
        //HELEN BIANCHI - CRIAÇÃO DA REGRA - INICIO
        double regra26418(IDictionary<string, object> parametros);

        double regra26420(IDictionary<string, object> parametros);
        //HELEN BIANCHI - CRIAÇÃO DA REGRA - FIM

        //William Moreira da Silva - SOL 207977
        double regra6202(IDictionary<string, object> parametros);

        double regra6203(IDictionary<string, object> parametros);

        double regra6204(IDictionary<string, object> parametros);

        double regra6205(IDictionary<string, object> parametros);

        double regra26409(IDictionary<string, object> parametros);
        //William Moreira da Silva - SOL 207977
        double regra27006(IDictionary<string, object> parametros);
        double regra27007(IDictionary<string, object> parametros);
        double regra27009(IDictionary<string, object> parametros);
        double regra27010(IDictionary<string, object> parametros);
        double regra27011(IDictionary<string, object> parametros);
        double regra27012(IDictionary<string, object> parametros);
        double regra27013(IDictionary<string, object> parametros);


        //SIG 67808 - Matias || Campanha Desconto
        double regra26998(IDictionary<string, object> parametros);
        double regra27000(IDictionary<string, object> parametros);
        double regra27001(IDictionary<string, object> parametros);
        double regra27002(IDictionary<string, object> parametros);
        double regra27003(IDictionary<string, object> parametros);
        double regra27004(IDictionary<string, object> parametros);
        double regra27005(IDictionary<string, object> parametros);
        double regra27015(IDictionary<string, object> parametros);
        double regra27017(IDictionary<string, object> parametros);
        //----------------------------------------------------------

        double regra27090(IDictionary<string, object> parametros);
        double regra27091(IDictionary<string, object> parametros);

        //SIG 128871 - Aplicação de desconto no valor do FGQC - Criação a regra 27131 do novo item 159
        double regra27131(IDictionary<string, object> parametros);

        double regra27173(IDictionary<string, object> parametros);
        double regra27170(IDictionary<string, object> parametros);


        #endregion
    }
}
