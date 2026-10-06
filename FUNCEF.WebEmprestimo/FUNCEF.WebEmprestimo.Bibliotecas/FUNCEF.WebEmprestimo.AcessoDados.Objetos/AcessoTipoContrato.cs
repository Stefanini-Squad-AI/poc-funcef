using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using Oracle.ManagedDataAccess.Types;
using Oracle.ManagedDataAccess.Client;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.Componentes.AcessoDados;

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
        public TipoContrato consultar(int id)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT TIC.IDTIPOCONTREMPTMO, ");
            query.Append("        TIC.TCEDESCRICAO, ");
            query.Append("        TIC.TCEMAXPARC, ");
            query.Append("        TIC.TCEMAXCONTRATO, ");
            query.Append("        TIC.IDREGRAELEG, ");
            query.Append("        TIC.IDREGRAMARGEM, ");
            query.Append("        TIC.IDREGRARESERVA, ");
            query.Append("        TIC.IDREGRALIMITES, ");
            query.Append("        TIC.IDREGRAPRAZOSCONC, ");
            query.Append("        TIC.IDREGRAJURCONC AS IDREGRAJUROS, ");   //NILTON 18/12/12
            query.Append("        TIC.IDREGRAJUREXIBE,   ");                //NILTON 18/12/12
            query.Append("        TIC.IDREGRAPRAZOMAX, ");
            query.Append("        TIC.IDREGRASALBAS, ");
            query.Append("        TIC.IDREGRADATACRED, ");
            query.Append("        TIC.IDREGRAQUITADO, ");
            query.Append("        TIC.IDREGRAVLRMAX, ");
            query.Append("        TIC.FLGNAOREFINANCIA, ");
            query.Append("        MOE.MOECODIGO, ");
            query.Append("        MOE.MOESIGLA, ");
            query.Append("        TIC.FLGFORMAREC, ");
            query.Append("        TIC.FLGFORMAPAG, ");
            query.Append("        TIC.IDTIPOEMPTMO, ");
            query.Append("        TIC.IDREGRAPRIMPARC, ");
            query.Append("        NVL(TIC.FLGVERIFICACONTRATO,2) AS FLGVERIFICACONTRATO, ");
            query.Append("        NVL(TIC.FLGOBRIGANUMPROTOCOLO, 0) ");//William Moreira da Silva - SOL 205048 KTN 1983964
            query.Append("   FROM TIPOCONTREMPTMO TIC, MOEDA MOE, TIPOEMPTMO TIE ");
            //query.Append("  WHERE TIC.FLGSITUACAO IN ('A', 'P') ");
            query.Append("  WHERE TIC.MOECODIGO = MOE.MOECODIGO ");
            query.Append("    AND TIC.IDTIPOEMPTMO = TIE.IDTIPOEMPTMO ");
            query.Append("    AND TIC.IDREGRAELEG IS NOT NULL ");
            query.Append("    AND  TIC.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        id = leitor.GetInt32(IDTIPOCONTREMPTMO_TPCONTRATO),
                        descricao = leitor.GetString(TCEDESCRICAO_TPCONTRATO),
                        maximoParcelas = leitor.GetInt32(TCEMAXPARC_TPCONTRATO),
                        maximoContrato = leitor.GetInt32(TCEMAXCONTRATO_TPCONTRATO),
                        formaRecebimento = leitor.GetString(FLGFORMAREC_TPCONTRATO),
                        formaPagamento = leitor.GetString(FLGFORMAPAG_TPCONTRATO),
                        tipoEmprestimo = new TipoEmprestimo()
                        {
                            id = leitor.GetInt32(IDTIPOEMPTMO_TPCONTRATO)
                        },
                        regraElegibilidade = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRAELEG_TPCONTRATO)
                        },
                        regraMargem = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRAMARGEM_TPCONTRATO)
                        },
                        regraLimites = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRALIMITES_TPCONTRATO)
                        },
                        regraReservaPoupanca = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRARESERVA_TPCONTRATO)
                        },
                        regraPrazosConcessao = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRAPRAZOSCONC_TPCONTRATO)
                        },
                        regraJurosConcessao = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRAJURCONC_TPCONTRATO)
                        },
                        regraJurosExibir= new Regra()//NILTON 18/12/12
                        {
                            id = leitor.GetInt32(IDREGRAJUREXIBE_TPCONTRATO)
                        },
                        regraPrazoMaximo = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRAPRAZOMAX_TPCONTRATO)
                        },
                        regraSalarioBase = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRASALBAS_TPCONTRATO)
                        },
                        regraDataCredito = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRADATACRED_TPCONTRATO)
                        },
                        regraQuitado = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRAQUITADO_TPCONTRATO)
                        },
                        regraValorMaximo = new Regra()
                        {
                            id = leitor.GetInt32(IDREGRAVLRMAX_TPCONTRATO)
                        },
                        naoRefinancia = leitor.GetInt32(FLGNAOREFINANCIA_TPCONTRATO) == 1,
                        moeda = new Moeda()
                        {
                            id = leitor.GetInt32(MOECODIGO_TPCONTRATO),
                            sigla = leitor.GetString(MOESIGLA_TPCONTRATO)
                        },
                        regraPrimeiraParcela = new Regra()
                        {
                            id = leitor.obterValorInteiro(IDREGRAPRIMPARC_TPCONTRATO) == null ? 0 : leitor.GetInt32(IDREGRAPRIMPARC_TPCONTRATO)    
                        },
                        verificaContratoEfetivado = leitor.GetInt32(FLGVERIFICACONTRATO_TPCONTRATO),
                        flgNumeroProtocolo = leitor.GetBoolean(FLGNUMEROPROTOCOLO_TPCONTRATO)//William Moreira da Silva - SOL 205048 KTN 1983964
                    };
                }
            }

            return tipoContrato;
        }

        /// <summary>
        /// Retorna Itens de cálculo do tipo do contrato e tipo de evento.
        /// </summary>
        /// <param name="tipoContrato">Identificador do tipo de contrato</param>
        /// <param name="tipoEvento">Tipo de evento.</param>
        public List<ItemContrato> obterItens(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT ");
            query.Append(" 	IT.ITEDESCRICAO, ");
            query.Append(" 	IT.IDITEMEMPTMO, ");
            query.Append("  IC.IDREGRACALC, ");
            query.Append(" 	IC.ITCEVENTO, ");
            query.Append(" 	DECODE(IC.ITCEVENTO, ");
            query.Append("    	0, 'Concessão/Renovação', ");
            query.Append("    	1, 'Prestação ', ");
            query.Append("    	2, 'Amortização/Refinanciamento', ");
            query.Append("    	3, 'Quitação') AS EVENTO, ");
            query.Append(" 	IC.ITCPRIORIDADE, ");
            query.Append(" 	IC.FLGCENTRALIZA, ");
            query.Append(" 	IC.FLGDESTACADO, ");
            query.Append(" 	IC.IDPROVENTON, ");
            query.Append(" 	IC.ITCRECPAG, ");
            query.Append(" 	IC.ITCTRATASALDODEV, ");
            query.Append(" 	IC.FLGGRAVAZERO ");
            query.Append(" FROM   ITEMXTIPOCONTR IC, ITEMEMPTMO IT   ");
            query.Append(" WHERE  IC.IDITEMEMPTMO = IT.IDITEMEMPTMO ");
            query.Append(" AND    IC.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P  ");
            query.Append(" AND    IC.ITCEVENTO = :IDTIPOEVENTO_P  ");
            query.Append(" ORDER BY ITCSEQCALCULO ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                    item.id = leitor.GetInt32(IDITEMEMPTMO_ITENS);
                    item.descricao = leitor.GetString(ITEDESCRICAO_ITENS);
                    item.regra = new Regra()
                    {
                        id = leitor.GetInt32(IDREGRACALC_ITENS)
                    };
                    item.tipoEvento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(leitor.GetInt32(ITCEVENTO_ITENS));
                    item.tipoEvento.descricao = leitor.GetString(EVENTO_ITENS);
                    item.prioridade = leitor.GetInt32(ITCPRIORIDADE_ITENS);
                    item.centraliza = leitor.GetInt32(FLGCENTRALIZA_ITENS);
                    item.destacado = leitor.GetInt32(FLGDESTACADO_ITENS);
                    item.rubrica = leitor.obterValorInteiro(IDPROVENTON_ITENS);
                    item.pagarReceber = leitor.GetString(ITCRECPAG_ITENS);
                    item.trataSaldoDevedor = leitor.obterValorInteiro(ITCTRATASALDODEV_ITENS);
                    item.gravaZero = leitor.GetInt32(FLGGRAVAZERO_ITENS);
                    itens.Add(item);
                }
            }

            // Retorna informações
            return itens;
        }
        // SOL 204001
        public bool validarPermissao(long idTipoContrato)
        {
            StringBuilder query = new StringBuilder();

            query.Append("  SELECT * ");
            query.Append("  FROM TB_GLW_GRUPO_PERMISSAO GP, TB_GLW_TIPOCONT_PERMISSAO TCP ");
            query.Append("  WHERE GP.CD_PERMISSAO = TCP.CD_PERMISSAO ");
            query.Append("  AND TCP.IDTIPOCONTRATO = :IDTIPOCONTRATO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
        // SOL 204001

        /// <summary>
        /// Lista os Tipos de Contrato do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o(s) tipo(s) de contratos(s) encontrado(s).</returns>
        public List<TipoContrato> listar()
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT ");
            query.Append("       TIC.IDTIPOCONTREMPTMO, ");
            query.Append("       TIC.TCEDESCRICAO ");
            query.Append("  FROM TIPOCONTREMPTMO TIC ");
            query.Append(" WHERE TIC.FLGSITUACAO IN ('A', 'P') ");
            query.Append(" AND   TIC.FLGUSOEMPTMO = 1 ");
            query.Append(" AND   TIC.IDREGRAELEG IS NOT NULL  ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Popula objeto resultante
            List<TipoContrato> listaTipoContrato = new List<TipoContrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    TipoContrato tipoContrato = new TipoContrato()
                    {
                        id = leitor.GetInt32(IDTIPOCONTRATO_LISTAR),
                        descricao = leitor.GetString(TCEDESCRICAO_LISTAR)
                    };
                    listaTipoContrato.Add(tipoContrato);
                }
            }

            return listaTipoContrato;
        }

        /// <summary>
        /// Consulta se a quitação é obrigatória para o tipo de contrato
        /// </summary>
        /// <param name="idTipoContrato">Tipo do Contrato novo</param>
        /// <param name="tipoContratoAQuitar">Tipo do Contrato a quitar</param>
        /// <returns></returns>
        public int consultarTipoContratoQuitacao(int idTipoContrato, int tipoContratoAQuitar)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT FLGOBRIGATORIO FROM TIPOCONTRXQUIT ");
            query.Append(" WHERE  IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ");
            query.Append(" AND    IDTIPOCONTRQUIT = :IDTIPOCONTRQUIT_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, idTipoContrato);
            bancoDeDados.AddInParameter(comando, "IDTIPOCONTRQUIT_P", DbType.Int32, tipoContratoAQuitar);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                   return leitor.GetInt32(0);
                }
                else
                {
                    return -1; 
                }
            }

        }


        #endregion
    }
}
