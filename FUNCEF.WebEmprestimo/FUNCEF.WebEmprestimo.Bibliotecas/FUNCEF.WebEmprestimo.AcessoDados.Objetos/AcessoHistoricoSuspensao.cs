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
    /// Objeto de acesso a dados de histórico de suspensão.
    /// </summary>
    public class AcessoHistoricoSuspensao : ObjetoAcessoDados, IAcessoHistoricoSuspensao
    {
        #region Constantes

        #region Consultar

        private const int _HISTORICO = 0;

        #endregion

        #region Verificar suspensão ativa/supensão no periodo

        private const int IDCONTRATOEMPTMO_SUSP = 0;//William Moreira da Silva SOL161447 

        #endregion

        #region Verificar se temos contratos ativos

        private const int IDCONTRATOEMPTMO_ATIVOS = 0;//William Moreira da Silva SOL161201

        #endregion

        #endregion

        #region Consulta

        /// <summary>
        /// Verifica se teve suspensão no periodo cadastrado
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public bool verificaSuspensaoPeriodo(long numeroContrato, DateTime dataIni, DateTime dataFim)//William Moreira da Silva SOL161447 
        {
            StringBuilder query = new StringBuilder();

            bool existeSuspensao = true;

            //Consulta
            query.Append(" SELECT COUNT(IDCONTRATOEMPTMO) FROM histmovemptmo");
            query.Append(" WHERE idcontratoemptmo = :numeroContrato");
            query.Append(" AND iditememptmo = 13");
            query.Append(" AND ((hmedataprevista >= :dataIni) AND (hmedataprevista <= :dataFim))");

            //Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            //Definindo os parâmentros
            bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "dataIni", DbType.DateTime, dataIni);
            bancoDeDados.AddInParameter(comando, "dataFim", DbType.DateTime, dataFim);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    existeSuspensao = (leitor.GetInt32(IDCONTRATOEMPTMO_SUSP) == 0);
                }

            }
            return existeSuspensao;
        }//William Moreira da Silva SOL161447


        //William Moreira da Silva SOL161201
        /// <summary>
        /// Verifica se algum tem contrato ativo
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificaContratoAtivo(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            bool existeContratoAtivo = false;

            //Consulta
            //Select para verificar se temos contratos ativos
            query.Append(" SELECT COUNT(IDCONTRATOEMPTMO) FROM CONTRATOEMPTMO ");
            query.Append(" WHERE IDCONTRATOEMPTMO = :numeroContrato ");
            //query.Append(" AND IDPESSOA = :idPessoa ");
            query.Append(" AND FLGSITUACAO = 'A'");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, numeroContrato);
            //bancoDeDados.AddInParameter(comando, "idPessoa", DbType.Int32, idPessoa);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    existeContratoAtivo = (leitor.GetInt32(IDCONTRATOEMPTMO_ATIVOS) >= 1);
                }
            }
            return existeContratoAtivo;

        }
        //William Moreira da Silva SOL161201

        /// <summary>
        /// Verifica a existencia de uma suspensão ativa.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificarSuspensaoAtiva(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            bool existeSuspensao = false;

            // Consulta
            query.Append(" SELECT COUNT(IDCONTRATOEMPTMO) FROM HISTSUSPCOBEP ");
            query.Append(" WHERE  IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND    FLGSTATUS        =  'A' ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    existeSuspensao = (leitor.GetInt32(IDCONTRATOEMPTMO_SUSP) > 0);
                }
            }

            return existeSuspensao;
        }

        #endregion

        #region Inclusão

        /// <summary>
        /// Inclui historico de suspensão de um contrato.
        /// </summary>
        /// <param name="historioSuspensao">Dados da suspensão.</param>
        public void incluir(HistoricoSuspensao historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            historico.id = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQHISTSUSPCOBEP", true);

            AcessoContrato acessoContrato = new AcessoContrato();
            string login = string.Format("CM{0}", acessoContrato.obterIdPlanus(historico.usuarioLogado));

            StringBuilder query = new StringBuilder();

            query.Append(" INSERT INTO HISTSUSPCOBEP  ");
            query.Append(" ( ");
            query.Append("     IDHISTSUSPCOBEP, ");
            query.Append("     IDTIPOSUSPEMPTMO, ");
            query.Append("     IDCONTRATOEMPTMO, ");
            query.Append("     FLGSTATUS, ");
            query.Append("     FLGFERIAS, ");
            query.Append("     HSCINICIOSUSP, ");
            query.Append("     HSCFINALSUSP, ");
            query.Append("     HSCMESES, ");
            query.Append("     HSCUSUATEND, ");
            query.Append("     HSCDATAATEND, ");
            query.Append("     HSCDATAATU, ");
            query.Append("     HSCANOCOBRANCA, ");
            query.Append("     HSCMESCOBRANCA, ");
            query.Append("     TRGDTINCLUSAO, ");
            query.Append("     TRGUSERINCLUSAO, ");
            query.Append("     OBSERVACAO ");//William Moreira da Silva SOL 149705
            query.Append(" ) ");
            query.Append(" VALUES ");
            query.Append(" ( ");
            query.Append("     :IDHISTSUSPCOBEP_P, ");
            query.Append("     :IDTIPOSUSPEMPTMO_P, ");
            query.Append("     :NUMEROCONTRATO_P, ");
            query.Append("     :FLGSTATUS_P, ");
            query.Append("     :FLGFERIAS_P, ");
            query.Append("     :HSCINICIOSUSP_P, ");
            query.Append("     :HSCFINALSUSP_P, ");
            query.Append("     :HSCMESES_P, ");
            query.Append("     :HSCUSUATEND_P, ");
            query.Append("     :HSCDATAATEND_P, ");
            query.Append("     :HSCDATAATU_P, ");
            query.Append("     :HSCANOCOBRANCA_P, ");
            query.Append("     :HSCMESCOBRANCA_P, ");
            query.Append("     :TRGDTINCLUSAO_P, ");
            query.Append("     :TRGUSERINCLUSAO_P, ");
            query.Append("     :OBSERVACAO_P ");//William Moreira da Silva SOL 149705
            query.Append(" ) ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDHISTSUSPCOBEP_P", DbType.Int64, historico.id);
            bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int32, historico.tipoSuspensao.id);
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, historico.contrato.numero);
            bancoDeDados.AddInParameter(comando, "FLGSTATUS_P", DbType.String, historico.status);
            bancoDeDados.AddInParameter(comando, "FLGFERIAS_P", DbType.Int32, historico.ferias);
            bancoDeDados.AddInParameter(comando, "HSCINICIOSUSP_P", DbType.DateTime, historico.dataInicio);
            bancoDeDados.AddInParameter(comando, "HSCFINALSUSP_P", DbType.DateTime, historico.dataFim);
            bancoDeDados.AddInParameter(comando, "HSCMESES_P", DbType.Int32, historico.numeroMeses);
            bancoDeDados.AddInParameter(comando, "HSCUSUATEND_P", DbType.String, historico.responsavelAtendimento);
            bancoDeDados.AddInParameter(comando, "HSCDATAATEND_P", DbType.DateTime, historico.dataAtendimento);
            bancoDeDados.AddInParameter(comando, "HSCDATAATU_P", DbType.DateTime, historico.dataAtualizacao);
            bancoDeDados.AddInParameter(comando, "HSCANOCOBRANCA_P", DbType.Int32, historico.anoCobranca);
            bancoDeDados.AddInParameter(comando, "HSCMESCOBRANCA_P", DbType.Int32, historico.mesCobranca);
            bancoDeDados.AddInParameter(comando, "TRGDTINCLUSAO_P", DbType.DateTime, DateTime.Now);
            bancoDeDados.AddInParameter(comando, "TRGUSERINCLUSAO_P", DbType.String, login);
            bancoDeDados.AddInParameter(comando, "OBSERVACAO_P", DbType.String, historico.observacao);//William Moreira da Silva SOL 149705

            bancoDeDados.ExecuteNonQuery(comando);
        }

        #endregion

        #region Alterar

        /// <summary>
        /// Alterar registro no histórico de suspensão passando o histórico de suspensão.
        /// </summary>
        /// <param name="historico">Dados da suspensão</param>
        public void alterar(HistoricoSuspensao historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            //historico.id = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQHISTSUSPCOBEP");

            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE HISTSUSPCOBEP SET ");
            query.Append(" FLGSTATUS 	= :FLGSTATUS_P, ");
            query.Append(" HSCDATALIBER = :HSCDATALIBER_P, ");
            query.Append(" HSCUSULIBER 	= :HSCUSULIBER_P, ");
            query.Append(" HSCDATAATU 	= :HSCDATAATU_P, ");
            query.Append(" HSCANOCOBRANCA = :HSCANOCOBRANCA_P, ");
            query.Append(" HSCMESCOBRANCA = :HSCMESCOBRANCA_P, ");
            query.Append(" OBSERVACAO = :OBSERVACAO_P ");//William Moreira da Silva SOL 149705
            query.Append(" WHERE IDHISTSUSPCOBEP = :IDHISTSUSPCOBEP_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "FLGSTATUS_P", DbType.String, historico.status);
            bancoDeDados.AddInParameter(comando, "HSCDATALIBER_P", DbType.DateTime, historico.dataLiberacao);
            bancoDeDados.AddInParameter(comando, "HSCUSULIBER_P", DbType.String, historico.usuarioLogado);
            bancoDeDados.AddInParameter(comando, "HSCDATAATU_P", DbType.Date, historico.dataAtualizacao);
            bancoDeDados.AddInParameter(comando, "HSCANOCOBRANCA_P", DbType.Int32, historico.anoCobranca);
            bancoDeDados.AddInParameter(comando, "HSCMESCOBRANCA_P", DbType.Int32, historico.mesCobranca);
            bancoDeDados.AddInParameter(comando, "OBSERVACAO_P", DbType.String, historico.observacao);//William Moreira da Silva SOL 149705
            bancoDeDados.AddInParameter(comando, "IDHISTSUSPCOBEP", DbType.Int64, historico.id);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        #endregion
    }
}
