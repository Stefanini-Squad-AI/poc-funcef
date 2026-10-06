#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Jessica Y. Oshiro
///
/// Data da Alteração:
/// 27/04/2016 09:21:53
///
/// Descrição da Alteração:
/// Adição do método consultarRegraFGQC
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.Componentes.AcessoDados;
using System.Reflection.Emit;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    /// <summary>
    /// Objeto de acesso a dados de tipo de contrato.
    /// </summary>
    public class AcessoTipoContrato : ObjetoAcessoDados, IAcessoTipoContrato
    {
        #region Constantes

        #region Consultar Tipo de contrato

        private const int IDTIPOCONTREMPTMO_TPCONTRATO = 0;
        private const int TCEDESCRICAO_TPCONTRATO = 1;
        private const int TCEMAXPARC_TPCONTRATO = 2;
        private const int TCEMAXCONTRATO_TPCONTRATO = 3;
        private const int IDREGRAELEG_TPCONTRATO = 4;
        private const int IDREGRAMARGEM_TPCONTRATO = 5;
        private const int IDREGRARESERVA_TPCONTRATO = 6;
        private const int IDREGRALIMITES_TPCONTRATO = 7;
        private const int IDREGRAPRAZOSCONC_TPCONTRATO = 8;
        private const int IDREGRAJURCONC_TPCONTRATO = 9;
        private const int IDREGRAJUREXIBE_TPCONTRATO = 10;// NILTON 18/12/12
        private const int IDREGRAPRAZOMAX_TPCONTRATO = 11;
        private const int IDREGRASALBAS_TPCONTRATO = 12;
        private const int IDREGRADATACRED_TPCONTRATO = 13;
        private const int IDREGRAQUITADO_TPCONTRATO = 14;
        private const int IDREGRAVLRMAX_TPCONTRATO = 15;
        private const int FLGNAOREFINANCIA_TPCONTRATO = 16;
        private const int MOECODIGO_TPCONTRATO = 17;
        private const int MOESIGLA_TPCONTRATO = 18;
        private const int FLGFORMAREC_TPCONTRATO = 19;
        private const int FLGFORMAPAG_TPCONTRATO = 20;
        private const int IDTIPOEMPTMO_TPCONTRATO = 21;
        private const int IDREGRAPRIMPARC_TPCONTRATO = 22;
        private const int FLGVERIFICACONTRATO_TPCONTRATO = 23;
        private const int FLGNUMEROPROTOCOLO_TPCONTRATO = 24;//William Moreira da Silva - SOL 205048 KTN 1983964
        private const int IDREGRACORRMONET_TPCONTRATO = 25;//William Moreira da Silva - SIG 27879
        private const int FLGOBRIGACONCZERO_TPCONTRATO = 26;
        #endregion

        #region FGQC

        private const int IDREGRACALC_FGQC = 5; // Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874

        #endregion

        #region Obter Itens

        private const int ITEDESCRICAO_ITENS = 0;
        private const int IDITEMEMPTMO_ITENS = 1;
        private const int IDREGRACALC_ITENS = 2;
        private const int ITCEVENTO_ITENS = 3;
        private const int EVENTO_ITENS = 4;
        private const int ITCPRIORIDADE_ITENS = 5;
        private const int FLGCENTRALIZA_ITENS = 6;
        private const int FLGDESTACADO_ITENS = 7;
        private const int IDPROVENTON_ITENS = 8;
        private const int ITCRECPAG_ITENS = 9;
        private const int ITCTRATASALDODEV_ITENS = 10;
        private const int FLGGRAVAZERO_ITENS = 11;
        private const int SEQCALCULO_ITENS = 12;
        private const int FLGCAMPANHADESCONTO_ITENS = 13;

        #endregion

        #region Listar

        private const int IDTIPOCONTRATO_LISTAR = 0;
        private const int TCEDESCRICAO_LISTAR = 1;

        #endregion

        #endregion

        #region Consultas

        /// <summary>
        /// Retorna dados de um tipo de contrato.
        /// </summary>
        /// <param name="id">Identificador do tipo de contrato</param>
        public TipoContrato consultar(int id, bool pveioConector)
        {
            string query;

            //            // Consulta
            //query.Append(" SELECT TIC.IDTIPOCONTREMPTMO, ");
            //query.Append("        TIC.TCEDESCRICAO, ");
            //query.Append("        TIC.TCEMAXPARC, ");
            //query.Append("        TIC.TCEMAXCONTRATO, ");
            //query.Append("        TIC.IDREGRAELEG, ");
            //query.Append("        TIC.IDREGRAMARGEM, ");
            //query.Append("        TIC.IDREGRARESERVA, ");
            //query.Append("        TIC.IDREGRALIMITES, ");
            //query.Append("        TIC.IDREGRAPRAZOSCONC, ");
            //query.Append("        TIC.IDREGRAJURCONC AS IDREGRAJUROS, ");   //NILTON 18/12/12
            //query.Append("        TIC.IDREGRAJUREXIBE,   ");                //NILTON 18/12/12
            //query.Append("        TIC.IDREGRAPRAZOMAX, ");
            //query.Append("        TIC.IDREGRASALBAS, ");
            //query.Append("        TIC.IDREGRADATACRED, ");
            //query.Append("        TIC.IDREGRAQUITADO, ");
            //query.Append("        TIC.IDREGRAVLRMAX, ");
            //query.Append("        TIC.FLGNAOREFINANCIA, ");
            //query.Append("        MOE.MOECODIGO, ");
            //query.Append("        MOE.MOESIGLA, ");
            //query.Append("        TIC.FLGFORMAREC, ");
            //query.Append("        TIC.FLGFORMAPAG, ");
            //query.Append("        TIC.IDTIPOEMPTMO, ");
            //query.Append("        TIC.IDREGRAPRIMPARC, ");
            //query.Append("        NVL(TIC.FLGVERIFICACONTRATO,2) AS FLGVERIFICACONTRATO, ");
            //query.Append("        NVL(TIC.FLGOBRIGANUMPROTOCOLO, 0) ");//William Moreira da Silva - SOL 205048 KTN 1983964
            //query.Append("   FROM CM.TIPOCONTREMPTMO TIC, CM.MOEDA MOE, CM.TIPOEMPTMO TIE ");
            ////query.Append("  WHERE TIC.FLGSITUACAO IN ('A', 'P') ");
            //query.Append("  WHERE TIC.MOECODIGO = MOE.MOECODIGO ");
            //query.Append("    AND TIC.IDTIPOEMPTMO = TIE.IDTIPOEMPTMO ");
            //query.Append("    AND TIC.IDREGRAELEG IS NOT NULL ");
            //query.Append("    AND  TIC.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ");

            // Consulta
            query = @" SELECT 
                    TIC.IDTIPOCONTREMPTMO, 
                    TIC.TCEDESCRICAO, 
                    TIC.TCEMAXPARC, 
                    TIC.TCEMAXCONTRATO, 
                    TIC.IDREGRAELEG, 
                    TIC.IDREGRAMARGEM, 
                    TIC.IDREGRARESERVA, 
                    TIC.IDREGRALIMITES, 
                    TIC.IDREGRAPRAZOSCONC, 
                    TIC.IDREGRAJURCONC AS IDREGRAJUROS,    
                    TIC.IDREGRAJUREXIBE,                   
                    TIC.IDREGRAPRAZOMAX, 
                    TIC.IDREGRASALBAS, 
                    TIC.IDREGRADATACRED, 
                    TIC.IDREGRAQUITADO, 
                    TIC.IDREGRAVLRMAX, 
                    TIC.FLGNAOREFINANCIA, 
                    MOE.MOECODIGO, 
                    MOE.MOESIGLA, 
                    TIC.FLGFORMAREC, 
                    TIC.FLGFORMAPAG, 
                    TIC.IDTIPOEMPTMO, 
                    TIC.IDREGRAPRIMPARC, 
                    NVL(TIC.FLGVERIFICACONTRATO,2) AS FLGVERIFICACONTRATO, 
                    NVL(TIC.FLGOBRIGANUMPROTOCOLO, 0),
                    TIC.IDREGRATXCORRMONET,
                    TIC.FLGOBRIGACONCZERO,
                    TIC.SISTEMA_AMORTIZACAO
               FROM CM.TIPOCONTREMPTMO TIC, CM.MOEDA MOE, CM.TIPOEMPTMO TIE 
              WHERE TIC.MOECODIGO = MOE.MOECODIGO 
                AND TIC.IDTIPOEMPTMO = TIE.IDTIPOEMPTMO 
                AND TIC.IDREGRAELEG IS NOT NULL 
                AND  TIC.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ";
            //William Moreira da Silva - SIG 27879 - modificação da consulta

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, id);

                // Popula objeto resultante
                TipoContrato tipoContrato = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        tipoContrato = new TipoContrato()
                        {
                            id = leitor.obterInt(IDTIPOCONTREMPTMO_TPCONTRATO),
                            descricao = leitor.obterString(TCEDESCRICAO_TPCONTRATO),
                            maximoParcelas = leitor.obterInt(TCEMAXPARC_TPCONTRATO),
                            maximoContrato = leitor.obterInt(TCEMAXCONTRATO_TPCONTRATO),
                            formaRecebimento = leitor.obterString(FLGFORMAREC_TPCONTRATO),
                            formaPagamento = leitor.obterString(FLGFORMAPAG_TPCONTRATO),
                            tipoEmprestimo = new TipoEmprestimo()
                            {
                                id = leitor.obterInt(IDTIPOEMPTMO_TPCONTRATO)
                            },
                            regraElegibilidade = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAELEG_TPCONTRATO)
                            },
                            regraMargem = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAMARGEM_TPCONTRATO)
                            },
                            regraLimites = new Regra()
                            {
                                id = leitor.obterInt(IDREGRALIMITES_TPCONTRATO)
                            },
                            regraReservaPoupanca = new Regra()
                            {
                                id = leitor.obterInt(IDREGRARESERVA_TPCONTRATO)
                            },
                            regraPrazosConcessao = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAPRAZOSCONC_TPCONTRATO)
                            },
                            regraJurosConcessao = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAJURCONC_TPCONTRATO)
                            },
                            regraJurosExibir = new Regra()//NILTON 18/12/12
                            {
                                id = leitor.obterInt(IDREGRAJUREXIBE_TPCONTRATO)
                            },
                            regraPrazoMaximo = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAPRAZOMAX_TPCONTRATO)
                            },
                            regraSalarioBase = new Regra()
                            {
                                id = leitor.obterInt(IDREGRASALBAS_TPCONTRATO)
                            },
                            regraDataCredito = new Regra()
                            {
                                id = leitor.obterInt(IDREGRADATACRED_TPCONTRATO)
                            },
                            regraQuitado = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAQUITADO_TPCONTRATO)
                            },
                            regraValorMaximo = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAVLRMAX_TPCONTRATO)
                            },
                            naoRefinancia = (leitor.GetValue(FLGNAOREFINANCIA_TPCONTRATO) != DBNull.Value ? Convert.ToInt32(leitor.GetValue(FLGNAOREFINANCIA_TPCONTRATO)) : 0) == 1,
                            moeda = new Moeda()
                            {
                                id = leitor.obterInt(MOECODIGO_TPCONTRATO),
                                sigla = leitor.obterString(MOESIGLA_TPCONTRATO)
                            },
                            regraPrimeiraParcela = new Regra()
                            {
                                id = leitor.obterInt(IDREGRAPRIMPARC_TPCONTRATO)
                            },
                            verificaContratoEfetivado = leitor.obterInt(FLGVERIFICACONTRATO_TPCONTRATO),
                            flgNumeroProtocolo = Convert.ToBoolean(leitor.GetValue(FLGNUMEROPROTOCOLO_TPCONTRATO)),//William Moreira da Silva - SOL 205048 KTN 1983964

                            veioConector = pveioConector, //Xavier SOL 230843

                            //William Moreira da Silva - SIG 27879 - Inicio
                            regraCorrecaoMonetaria = new Regra()
                            {
                                id = leitor.obterInt(IDREGRACORRMONET_TPCONTRATO)
                            },
                            //William Moreira da Silva - SIG 27879 - Fim
                            flgObrigaLiquidoZero = leitor.IsDBNull(FLGOBRIGACONCZERO_TPCONTRATO) ? false : Convert.ToBoolean(leitor.GetValue(FLGOBRIGACONCZERO_TPCONTRATO)),
                            SistemaAmortizacao = leitor.obterString(27)
                        };
                    }
                }

                return tipoContrato;
            }
        }

        // Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874
        /// <summary>
        /// Retorna Regra FGQC.
        /// </summary>
        /// <param name="tipoContrato">Identificador do tipo de contrato</param>
        /// <param name="tipoEvento">Tipo de evento.</param>
        public Int32 consultarRegraFGQC(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {
            string query;
            Int32 FGQC = 0;
            query = @"SELECT
                            TCont.IdTipoContrEmptmo,
                            TCont.TceDescricao,
                            IxT.Itcevento,
                            IxT.IdItemEmptmo,
                            IEmp.Itedescricao,
                            Ixt.Idregracalc
                    FROM
                            CM.ItemxTipoContr IxT,
                            CM.TipoContrEmptmo TCont,
                            CM.ItemEmptmo IEmp
                    WHERE IxT.IdTipoContrEmptmo = TCont.IdTipoContrEmptmo
                    AND IxT.IdItemEmptmo = IEmp.IdItemEmptmo
                    AND IxT.FlgDestacado = 1
                    AND IxT.IdItemEmptmo <> 159
                    AND IxT.IdTipoContrEmptmo = :IDTIPOCONTRATO_P
                    AND IxT.ItcEvento = :IDTIPOEVENTO_P";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, tipoContrato.id);
                bancoDeDados.AddInParameter(comando, "IDTIPOEVENTO_P", DbType.Int32, tipoEvento.chave);
                // Popula objeto resultante
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        var valor = leitor.obterValorInteiro(IDREGRACALC_FGQC);

                        FGQC = valor.HasValue ? valor.Value : 0;
                    }
                }


                return FGQC;
            }
        }
        // Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 - fim

        /// <summary>
        /// Retorna Itens de cálculo do tipo do contrato e tipo de evento.
        /// </summary>
        /// <param name="tipoContrato">Identificador do tipo de contrato</param>
        /// <param name="tipoEvento">Tipo de evento.</param>
        public List<ItemContrato> obterItens(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {
            string query;

            // Consulta
            query = @" SELECT 
             	IT.ITEDESCRICAO, 
             	IT.IDITEMEMPTMO, 
                IC.IDREGRACALC, 
             	IC.ITCEVENTO, 
             	DECODE(IC.ITCEVENTO, 
                	0, 'Concessão/Renovação', 
                	1, 'Prestação', 
                	2, 'Amortização/Refinanciamento', 
                	3, 'Quitação',
                    4, 'Atualização de Débito',
                    5, 'Atualização de Saldo Diária',
                    6, 'Importação/Migração',
                    7, 'Ajustes de Cobrança e Devolução',
                    8, 'Ajuste de Saldo Devedor') AS EVENTO, 
             	IC.ITCPRIORIDADE, 
             	IC.FLGCENTRALIZA, 
             	IC.FLGDESTACADO, 
             	IC.IDPROVENTON, 
             	IC.ITCRECPAG, 
             	IC.ITCTRATASALDODEV, 
             	IC.FLGGRAVAZERO,
                IC.ITCSEQCALCULO,
                IC.FLGCAMPANHADESCONTO
             FROM   CM.ITEMXTIPOCONTR IC, CM.ITEMEMPTMO IT   
             WHERE  IC.IDITEMEMPTMO = IT.IDITEMEMPTMO 
             AND    IC.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P  
             AND    IC.ITCEVENTO = :IDTIPOEVENTO_P  
             ORDER BY ITCSEQCALCULO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, tipoContrato.id);
                bancoDeDados.AddInParameter(comando, "IDTIPOEVENTO_P", DbType.Int32, tipoEvento.chave);

                // Popula objetos resultantes
                List<ItemContrato> itens = new List<ItemContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        ItemContrato item = new ItemContrato();
                        item.id = Convert.ToInt32(leitor.GetValue(IDITEMEMPTMO_ITENS));
                        item.descricao = leitor.obterString(ITEDESCRICAO_ITENS);
                        item.regra = new Regra()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDREGRACALC_ITENS))
                        };
                        item.tipoEvento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(ITCEVENTO_ITENS)));
                        item.tipoEvento.descricao = leitor.obterString(EVENTO_ITENS);
                        item.prioridade = Convert.ToInt32(leitor.GetValue(ITCPRIORIDADE_ITENS));
                        item.centraliza = Convert.ToInt32(leitor.GetValue(FLGCENTRALIZA_ITENS));
                        item.destacado = Convert.ToInt32(leitor.GetValue(FLGDESTACADO_ITENS));
                        item.rubrica = leitor.obterValorInteiro(IDPROVENTON_ITENS);
                        item.pagarReceber = leitor.obterString(ITCRECPAG_ITENS);
                        item.trataSaldoDevedor = leitor.obterValorInteiro(ITCTRATASALDODEV_ITENS);
                        item.gravaZero = Convert.ToInt32(leitor.GetValue(FLGGRAVAZERO_ITENS));
                        item.sequencia = Convert.ToInt32(leitor.GetValue(SEQCALCULO_ITENS));
                        item.flgCampanhaDesconto = Convert.ToBoolean(leitor.GetValue(FLGCAMPANHADESCONTO_ITENS));
                        itens.Add(item);
                    }
                }


                // Retorna informações
                return itens;
            }
        }
        // SOL 204001
        public bool validarPermissao(long idTipoContrato)
        {
            string query;

            query = @"SELECT * 
              FROM CM.TB_GLW_GRUPO_PERMISSAO GP, CM.TB_GLW_TIPOCONT_PERMISSAO TCP 
              WHERE GP.CD_PERMISSAO = TCP.CD_PERMISSAO 
              AND TCP.IDTIPOCONTRATO = :IDTIPOCONTRATO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, idTipoContrato);

                // Popula objeto resultante
                bool bPermissao = false;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        bPermissao = true;
                    }
                }


                return bPermissao;
            }

        }
        // SOL 204001

        /// <summary>
        /// Lista os Tipos de Contrato do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o(s) tipo(s) de contratos(s) encontrado(s).</returns>
        public List<TipoContrato> listar()
        {
            string query;

            // Consulta
            query = @" SELECT 
                            TIC.IDTIPOCONTREMPTMO, 
                            TIC.TCEDESCRICAO,
                            NVL(TIC.SISTEMA_AMORTIZACAO,'-')
              FROM CM.TIPOCONTREMPTMO TIC 
              WHERE TIC.FLGSITUACAO IN ('A', 'P') 
              AND   TIC.FLGUSOEMPTMO = 1 
              AND   TIC.IDREGRAELEG IS NOT NULL  
              ORDER BY TIC.TCEDESCRICAO";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Popula objeto resultante
                List<TipoContrato> listaTipoContrato = new List<TipoContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        TipoContrato tipoContrato = new TipoContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOCONTRATO_LISTAR)),
                            descricao = leitor.obterString(TCEDESCRICAO_LISTAR) + " ( " + leitor.obterString(2) + " )"
                        };
                        listaTipoContrato.Add(tipoContrato);
                    }
                }

                return listaTipoContrato;
            }
        }

        /// <summary>
        /// Consulta se a quitação é obrigatória para o tipo de contrato
        /// </summary>
        /// <param name="idTipoContrato">Tipo do Contrato novo</param>
        /// <param name="tipoContratoAQuitar">Tipo do Contrato a quitar</param>
        /// <returns></returns>
        public int consultarTipoContratoQuitacao(int idTipoContrato, int tipoContratoAQuitar)
        {
            string query;

            query = @" SELECT NVL(FLGOBRIGATORIO,0) AS FLOBRIGATORIO FROM CM.TIPOCONTRXQUIT 
             WHERE  IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P 
             AND    IDTIPOCONTRQUIT = :IDTIPOCONTRQUIT_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, idTipoContrato);
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRQUIT_P", DbType.Int32, tipoContratoAQuitar);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        return Convert.ToInt32(leitor.GetValue(0));
                    }
                    else
                    {

                        return -1;
                    }
                }
            }

        }

        //William Moreira da Silva - SOL 207977 PPM
        /// <summary>
        /// Buscar os itens que serão calculados
        /// </summary>
        /// <param name="contrato">Número do contrato</param>
        /// <param name="parcela">Número da Parcela do Item</param>
        /// <returns>Retorna lista dos itens, e suas respectivas regras</returns>
        public List<ItemContrato> obterItensContrato(int idTipoContrato, int parcela)
        {
            //StringBuilder query = new StringBuilder();
            string query;


            query = @" SELECT
               RCT.IDITEMEMPTMO,
               RCT.ITCRECPAG,
               RCT.IDREGRACALC,
               RCT.ITCPRIORIDADE,
               RCT.IDPROVENTON,
               DECODE(RCT.ITCEVENTO, -2, -2, -1, -1, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO,
               RCT.ITCEVENTO,
               RCT.ITCSEQCALCULO,
               RCT.ITCTRATASALDODEV,
               RCT.FLGCENTRALIZA,
               RCT.FLGDESTACADO,
               RCT.FLGGRAVAZERO,
               TOTALGRUPO.IDITEMEMPTMO AS IDITEMCENTRALIZA,
               IRC.ITEDESCRICAO,
               RCT.FLGCAMPANHADESCONTO
            FROM
               CM.ITEMXTIPOCONTR RCT,
               CM.ITEMEMPTMO IRC,
               (
               SELECT
                  IDITEMEMPTMO, ITCEVENTO
               FROM
                  CM.ITEMXTIPOCONTR
               WHERE
                      ( IDTIPOCONTREMPTMO = " + idTipoContrato.ToString() + @" )
                  AND ( FLGCENTRALIZA     = 1 )
               ) TOTALGRUPO
            WHERE
                   ( RCT.IDTIPOCONTREMPTMO = " + idTipoContrato.ToString() + @" )
               AND
               (
               ((4 = 0) AND ((RCT.ITCEVENTO = 4 ) OR (RCT.ITCEVENTO = 1 AND RCT.FLGCENTRALIZA = 1)))
               OR
               ((4 <> 0) AND (RCT.ITCEVENTO = 4 ))
               )
               AND IRC.IDITEMEMPTMO > 0
               AND ( RCT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )
               AND ( RCT.ITCEVENTO         = TOTALGRUPO.ITCEVENTO(+) )
            ORDER BY
               RCT.ITCSEQCALCULO, RCT.ITCSEQCALCULO ";



            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                //bancoDeDados.AddInParameter(comando, "PIDTIPOCONTREMPTMO", DbType.Int32, idTipoContrato);
                //bancoDeDados.AddInParameter(comando, "PEVENTO", DbType.Int32, 4);

                List<ItemContrato> itens = new List<ItemContrato>();
                //ItemContrato item = new ItemContrato();

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        ItemContrato item = new ItemContrato()
                        {
                            descricao = leitor.obterString(13),
                            regra = new Regra()
                            {
                                id = Convert.ToInt32(leitor.GetValue(2))
                            },
                            id = Convert.ToInt64(leitor.GetValue(0)),
                            parcela = parcela,
                            tipoEvento = TipoEvento.atualizacaoDebito,
                            centraliza = Convert.ToInt32(leitor.GetValue(9)),
                            destacado = Convert.ToInt32(leitor.GetValue(10)),
                            gravaZero = Convert.ToInt32(leitor.GetValue(11)),
                            flgCampanhaDesconto = Convert.ToInt32(leitor.GetValue(14)) == 1 ? true : false
                        };

                        itens.Add(item);
                    }
                }

                return itens;
            }
        }


        /// <summary>
        /// Verifica se o tipo do contrato esta ativo
        /// </summary>
        /// <param name="idTipoContrato">id do contrato a ser validado</param>
        /// <returns>Retorna se o contato esta ativo ou não</returns>
        //William Moreira da Silva - SOL 214635 KTN 2044698
        public bool validaContratoAtivo(int idTipoContrato)
        {
            string query;

            query = @" SELECT FLGSITUACAO FROM CM.TIPOCONTREMPTMO 
             WHERE IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P 
             AND FLGSITUACAO IN ('A','P') ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, idTipoContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {

                        return true;
                    }
                    else
                    {

                        return false;
                    }
                }
            }
        }

        //William Moreira da Silva - SOL 214635 KTN 2044698

        public TipoContrato ObterTipoContrato(long NumeroContrato)
        {
            string query;
            TipoContrato tipoContrato = new TipoContrato();          

            query = @"         
                    SELECT
                        tc.idtipocontremptmo,
                        tc.tcedescricao,
                        tc.sistema_amortizacao
                    FROM CM.CONTRATOEMPTMO con
                         JOIN CM.tipocontremptmo tc ON tc.idtipocontremptmo = con.idtipocontremptmo
                    WHERE con.idcontratoemptmo = :NumeroContrato";
  
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Int64, NumeroContrato);               

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        tipoContrato.id =  Convert.ToInt32(leitor.GetValue(0));
                        tipoContrato.descricao = leitor.obterString(1);
                        tipoContrato.SistemaAmortizacao = leitor.obterString(2).ToUpper();                       
                    }                   
                }
            }
            return tipoContrato;
        }

        public List<TipoContrato> ListarTodas()
        {
            string query;

            // Consulta
            query = @" SELECT 
                            TIC.IDTIPOCONTREMPTMO, 
                            TIC.TCEDESCRICAO,
                            NVL(TIC.SISTEMA_AMORTIZACAO,'-')
              FROM CM.TIPOCONTREMPTMO TIC 
              --WHERE TIC.FLGSITUACAO IN ('A', 'P') 
              WHERE   TIC.FLGUSOEMPTMO = 1 
              AND   TIC.IDREGRAELEG IS NOT NULL  
              ORDER BY TIC.TCEDESCRICAO";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Popula objeto resultante
                List<TipoContrato> listaTipoContrato = new List<TipoContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        TipoContrato tipoContrato = new TipoContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOCONTRATO_LISTAR)),
                            descricao = leitor.obterString(TCEDESCRICAO_LISTAR) //+ " ( " + leitor.obterString(2) + " )"
                        };
                        listaTipoContrato.Add(tipoContrato);
                    }
                }

                return listaTipoContrato;
            }
        }

        //SIG 128871 - Inclsuão do método abaixo
        public Int32 consultarRegraDescFGQC(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {           
            Int32 DescFGQC = 0;
            string query = @"SELECT
                                    TCont.IdTipoContrEmptmo,
                                    TCont.TceDescricao,
                                    IxT.Itcevento,
                                    IxT.IdItemEmptmo,
                                    IEmp.Itedescricao,
                                    Ixt.Idregracalc
                            FROM
                                    CM.ItemxTipoContr IxT,
                                    CM.TipoContrEmptmo TCont,
                                    CM.ItemEmptmo IEmp
                            WHERE IxT.IdTipoContrEmptmo = TCont.IdTipoContrEmptmo
                            AND IxT.IdItemEmptmo = IEmp.IdItemEmptmo
                            AND IxT.IdItemEmptmo = 159
                            AND IxT.FlgDestacado = 1
                            AND IxT.IdTipoContrEmptmo = :IDTIPOCONTRATO_P
                            AND IxT.ItcEvento = :IDTIPOEVENTO_P";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, tipoContrato.id);
                bancoDeDados.AddInParameter(comando, "IDTIPOEVENTO_P", DbType.Int32, tipoEvento.chave);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        var valor = leitor.obterValorInteiro(5);
                        DescFGQC = valor.HasValue ? valor.Value : 0;
                    }
                }
                return DescFGQC;
            }
        }

        #endregion
    }
}
