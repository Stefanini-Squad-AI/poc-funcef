using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.Componentes.AcessoDados;
using System.Configuration;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    public class AcessoDesconto : ObjetoAcessoDados, IAcessoDesconto
    {
        public List<int> itensParaDesconto(int tipoContrato)
        {
            List<int> itensElegiveisDesconto = new List<int>();
            // Consulta
            string query = @"SELECT iditememptmo
FROM itemxtipocontr
WHERE itcevento IN (1,4)
AND   itcrecpag = 'R'
AND   flgcentraliza + flgdestacado > 0
AND   idtipocontremptmo = :TIPOCONTRATO_P
ORDER BY itcevento, iditememptmo";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "TIPOCONTRATO_P", DbType.Int64, tipoContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        itensElegiveisDesconto.Add(leitor.obterInt(0));
                    }
                }
            }
            return itensElegiveisDesconto;
        }

        public Dictionary<string, DateTime> buscarQuantidadeMenorMaiorDataAtraso(long numContrato, DateTime dataCalculo)
        {
            Dictionary<string, DateTime> datasAtraso = new Dictionary<string, DateTime>();

            string query = @"SELECT MIN(h.dataprevista), MAX(h.dataprevista)
                                FROM hmeprestacao h
                                WHERE h.idcontratoemptmo = ?
                                AND   h.dataprevista <= ?
                                AND   h.iditememptmo = 13
                                AND   (h.flgquitabonoestorno = 0 OR h.dataquitabonoestorno >= ?)
                                AND   h.vlrefetivo IS NULL
                                AND   h.dataefetiva IS NULL
                                AND   h.origem in (1,11)
                                AND   h.vlrprevisto > 0
                                AND   (h.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                                          FROM tiposuspemptmo ts
                                                                          WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))";
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "P1", DbType.Int64, numContrato);
                bancoDeDados.AddInParameter(comando, "P2", DbType.Date, dataCalculo);
                bancoDeDados.AddInParameter(comando, "P3", DbType.Date, dataCalculo);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        if(leitor.obterValorData(0).HasValue && leitor.obterValorData(0).HasValue)
                        {
                            datasAtraso.Add("Primeira_Data", (DateTime)leitor.obterValorData(0));
                            datasAtraso.Add("Ultima_Data", (DateTime)leitor.obterValorData(1));
                        }
                    }
                }
            }
            return datasAtraso;
        }

        public double obterPercentualDesconto(int item, int tipoProposta, int qtdMesesAtraso)
        {
            double percentual = 0;

            Database bancoDeDados = this.obterBancoDeDados();
            string query = @" SELECT CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(?,?,?) FROM DUAL";
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pIdItemEmptmo", DbType.Int32, item);
                bancoDeDados.AddInParameter(comando, "pTipoProposta", DbType.Int32, tipoProposta);
                bancoDeDados.AddInParameter(comando, "pQtdMesesAtraso", DbType.Int32, qtdMesesAtraso);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        percentual = (double)leitor.obterDecimal(0);
                    }
                }
            }
            return percentual/100;
        }

        public void registraDescontoConcedido(long numeroContrato, int tipoProposta, int qtdMesesAtraso, List<ItemDescontoContrato> itensDesconto, DateTime dataOperacao, int qtdDiasAtraso)
        {
            string query;

            query = @" INSERT INTO CM.DESCONTOCAMPANHAEMPTMO
                      (IDCONTRATOEMPTMO,
                       IDITEMEMPTMO,
                       PERCDESCONTO,
                       VALORNOMINAL,
                       TIPOPROPOSTA,
                       MESESATRASO,
                       DATAOPERACAO,
                       VALORDESCONTO,
                       QTDDIASATRASO
                      )
                    VALUES
                      (:numeroContrato,
                       :idItemEmptmo,
                       :percentualDesconto,
                       :ValorNominal,
                       :tipoProposta,
                       :mesesAtraso,                                    
                       :dataOperacao,
                       :valorDesconto,
                       :qtdDiasAtraso) ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64);
                bancoDeDados.AddInParameter(comando, "idItemEmptmo", DbType.Int32);
                bancoDeDados.AddInParameter(comando, "percentualDesconto", DbType.Double);
                bancoDeDados.AddInParameter(comando, "ValorNominal", DbType.Double);
                bancoDeDados.AddInParameter(comando, "tipoProposta", DbType.Int32);
                bancoDeDados.AddInParameter(comando, "mesesAtraso", DbType.Int32);
                bancoDeDados.AddInParameter(comando, "dataOperacao", DbType.Date);
                bancoDeDados.AddInParameter(comando, "valorDesconto", DbType.Double);
                bancoDeDados.AddInParameter(comando, "qtdDiasAtraso", DbType.Int16);
                

                foreach (var item in itensDesconto)
                {
                    bancoDeDados.SetParameterValue(comando, "numeroContrato", numeroContrato);
                    bancoDeDados.SetParameterValue(comando, "idItemEmptmo", item.idItem);
                    bancoDeDados.SetParameterValue(comando, "percentualDesconto", item.percentualDesconto);
                    bancoDeDados.SetParameterValue(comando, "ValorNominal", item.valorNominal);
                    bancoDeDados.SetParameterValue(comando, "tipoProposta", tipoProposta);
                    bancoDeDados.SetParameterValue(comando, "mesesAtraso", qtdMesesAtraso);
                    bancoDeDados.SetParameterValue(comando, "dataOperacao", dataOperacao);
                    bancoDeDados.SetParameterValue(comando, "valorDesconto", item.valorDesconto);
                    bancoDeDados.SetParameterValue(comando, "qtdDiasAtraso", qtdDiasAtraso);

                    bancoDeDados.ExecuteNonQuery(comando);
                }
            }
        }

        public string buscaDescricaoItem(int idItem)
        {
            string descricaoItem = "";

            Database bancoDeDados = this.obterBancoDeDados();
            string query = @"SELECT itedescricao FROM itememptmo WHERE iditememptmo = :iditem";
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "iditem", DbType.Int32, idItem);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        descricaoItem = leitor.obterString(0);
                    }
                }
            }
            return descricaoItem;
        }

        public bool verificaCampanhaPendente(long numeroContrato, int tipoProposta)
        {
            bool possuiCampanha = false;
            string query;

            #region Define Query
            switch (tipoProposta)
            {
                case 1:
                    query = @"SELECT DISTINCT 1
FROM hmequitacao h
     JOIN contratoemptmo c ON c.idcontratoemptmo = h.idcontratoemptmo
     JOIN itemxtipocontr ixt ON ixt.iditememptmo = h.iditememptmo
                             AND ixt.idtipocontremptmo = c.idtipocontremptmo
                             AND ixt.itcevento = 3
                             AND ixt.flgcampanhadesconto = 1
WHERE h.idcontratoemptmo = :pIdContratoEmptmo
AND   h.flgestornado = 0
AND   h.origem = 3
AND   h.naturezaitem = 0
AND   h.vlrprevisto <> 0
AND   EXISTS (SELECT 1 FROM hmequitacao hq
              WHERE hq.idcontratoemptmo = h.idcontratoemptmo
              AND   hq.origem = h.origem
              AND   hq.dataprevista = h.dataprevista
              AND   hq.flgestornado = 0
              AND   hq.naturezaitem = 2
              AND   hq.vlrefetivo IS NULL)";
                    break;
                case 2:
                    query = @"SELECT DISTINCT 1
FROM hmeencargos h
     JOIN contratoemptmo c ON c.idcontratoemptmo = h.idcontratoemptmo
     JOIN itemxtipocontr ixt ON ixt.iditememptmo = h.iditememptmo
                             AND ixt.idtipocontremptmo = c.idtipocontremptmo
                             AND ixt.itcevento = 4
                             AND ixt.flgcampanhadesconto = 1
WHERE h.idcontratoemptmo = :pIdContratoEmptmo
AND   h.flgquitabonoestorno = 0
AND   h.origem = 4
AND   h.naturezaitem = 1
AND   h.vlrprevisto <> 0";
                    break;
                case 3:
                    query = @"SELECT DISTINCT 1
FROM hmequitacao h
     JOIN contratoemptmo c ON c.idcontratoemptmo = h.idcontratoemptmo
     JOIN itemxtipocontr ixt ON ixt.iditememptmo = h.iditememptmo
                             AND ixt.idtipocontremptmo = c.idtipocontremptmo
                             AND ixt.itcevento = 3
                             AND ixt.flgcampanhadesconto = 1
WHERE h.idcontratoemptmo = :pIdContratoEmptmo
AND   h.flgestornado = 0
AND   h.origem = 0
AND   h.naturezaitem = 0
AND   h.vlrprevisto <> 0
AND   EXISTS (SELECT 1 FROM hmequitacao hq
              WHERE hq.idcontratoemptmo = h.idcontratoemptmo
              AND   hq.origem = h.origem
              AND   hq.dataprevista = h.dataprevista
              AND   hq.flgestornado = 0
              AND   hq.naturezaitem = 2
              AND   hq.vlrefetivo IS NULL)";
                    break;
                default:
                    query = "";
                    throw new NotImplementedException("Não é possível verficiar se há pendências porque esse tipo de proposta não foi implementado.");
                    break;
            }
            #endregion

            Database bancoDeDados = this.obterBancoDeDados();
            
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Int64, numeroContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        possuiCampanha = true;
                    }
                }
            }

            return possuiCampanha;
        }

        public List<ParametrosCampanha> obterParametrosCampanha(DateTime? DataInicio, DateTime? DataFim)
        {
            List<ParametrosCampanha> parametrosCampanha = new List<ParametrosCampanha>();
            // Consulta
            string query = @"SELECT C.IDCAMPANHAEMPTMO, TC.IDTIPOPROPOSTACAMPANHAEMPTMO, TC.DESCRICAO, C.DATAINICIO, C.DATAFIM 
                            FROM CM.CAMPANHAEMPTMO C
                            JOIN CM.TIPOPROPOSTACAMPANHAEMPTMO TC ON TC.IDTIPOPROPOSTACAMPANHAEMPTMO = C.IDTIPOPROPOSTACAMPANHAEMPTMO";

            if(DataInicio.HasValue || DataFim.HasValue)
            {
                query += " WHERE " + (DataInicio.HasValue ? "C.DATAINICIO >= :DATAINICIO " : "") + ((DataFim.HasValue && DataInicio.HasValue) ? "AND C.DATAFIM <= :DATAFIM" : (DataFim.HasValue ? "C.DATAFIM <= :DATAFIM" : ""));
            }
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "DATAINICIO", DbType.DateTime, DataInicio);
                bancoDeDados.AddInParameter(comando, "DATAFIM", DbType.DateTime, DataFim);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        ParametrosCampanha item = new ParametrosCampanha();
                        item.IdCampanha = leitor.obterValorInt64(0).Value;
                        item.IdTipoPropostaCampanha = leitor.obterInt(1);
                        item.TipoPropostaCampanha = leitor.obterString(2);
                        item.DataInicio = leitor.obterValorData(3).Value;
                        item.DataFim = leitor.obterValorData(4).Value;
                        parametrosCampanha.Add(item);
                    }
                }
            }
            return parametrosCampanha;
        }

        /// <summary>
        /// Lista os Tipos de Contrato do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o(s) tipo(s) de contratos(s) encontrado(s).</returns>
        public List<TipoProposta> listarTipoProposta()
        {
            string query;

            // Consulta
            query = @" SELECT 
                            TP.IDTIPOPROPOSTACAMPANHAEMPTMO, 
                            TP.DESCRICAO 
                      FROM CM.TIPOPROPOSTACAMPANHAEMPTMO TP
                      ORDER BY TP.IDTIPOPROPOSTACAMPANHAEMPTMO";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Popula objeto resultante
                List<TipoProposta> listaTipoProposta = new List<TipoProposta>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        TipoProposta tipoProposta = new TipoProposta()
                        {
                            id = Convert.ToInt32(leitor.GetValue(0)),
                            descricao = leitor.obterString(1)
                        };
                        listaTipoProposta.Add(tipoProposta);
                    }
                }

                return listaTipoProposta;
            }
        }

        /// <summary>
        /// Inclui histórico do contrato.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        public void incluirParametrosCampanha(ParametrosCampanha parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            parametros.IdCampanha = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "CM.SEQCAMPANHAEMPTMO", true);
            
            string query = @" INSERT INTO CM.CAMPANHAEMPTMO C
                            (
                                IDCAMPANHAEMPTMO, 
                                IDTIPOPROPOSTACAMPANHAEMPTMO, 
                                DATAINICIO, 
                                DATAFIM
                            ) 
                            VALUES
                            (
                                :IDCAMPANHAEMPTMO,
                                :IDTIPOPROPOSTACAMPANHAEMPTMO,
                                :DATAINICIO,
                                :DATAFIM
                            )";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "IDCAMPANHAEMPTMO", DbType.Int64, parametros.IdCampanha);
                bancoDeDados.AddInParameter(comando, "IDTIPOPROPOSTACAMPANHAEMPTMO", DbType.Int64, parametros.IdTipoPropostaCampanha);
                bancoDeDados.AddInParameter(comando, "DATAINICIO", DbType.DateTime, parametros.DataInicio);
                bancoDeDados.AddInParameter(comando, "DATAFIM", DbType.DateTime, parametros.DataFim);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        public void atualizarParametrosCampanha(ParametrosCampanha parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            

            string query = $@" UPDATE CM.CAMPANHAEMPTMO C
                        SET C.DATAINICIO = TO_DATE('{parametros.DataInicio.ToString("dd/MM/yyyy")}', 'DD/MM/YYYY'), 
                            C.DATAFIM = TO_DATE('{parametros.DataFim.ToString("dd/MM/yyyy")}', 'DD/MM/YYYY'), 
                            C.IDTIPOPROPOSTACAMPANHAEMPTMO = {parametros.IdTipoPropostaCampanha}
                        WHERE C.IDCAMPANHAEMPTMO = {parametros.IdCampanha}";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        //WO13621
        public int ObterQtdDiasDeAtraso(double NumeroContrato, DateTime DataCalculo)
        {
            int qtdDiasDeAtraso = 0;

            string query = @" SELECT CM.PCK_EMPRESTIMO.FN_BUSCA_QTD_DIAS_ATRASO(:pIdContratoEmptmo, :pDataCalculo) FROM DUAL";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Double, NumeroContrato);
                bancoDeDados.AddInParameter(comando, "pDataCalculo", DbType.Date, DataCalculo);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        qtdDiasDeAtraso = leitor.obterInt(0);
                    }
                }
            }
            return qtdDiasDeAtraso;
        }

        public double ObterPercentualDescontoDias(int Item, int TipoProposta, int QtdDiasDeAtraso)
        {
            double percentual = 0;

            Database bancoDeDados = this.obterBancoDeDados();
            string query = @"SELECT CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO_DIAS(:pIdItemEmptmo, :pTipoProposta, :pQtdDiasAtraso) FROM DUAL";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pIdItemEmptmo", DbType.Int32, Item);
                bancoDeDados.AddInParameter(comando, "pTipoProposta", DbType.Int32, TipoProposta);
                bancoDeDados.AddInParameter(comando, "pQtdDiasAtraso", DbType.Int32, QtdDiasDeAtraso);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        percentual = (double)leitor.obterDecimal(0);
                    }
                }
            }
            return percentual / 100;
        }
    }
}
