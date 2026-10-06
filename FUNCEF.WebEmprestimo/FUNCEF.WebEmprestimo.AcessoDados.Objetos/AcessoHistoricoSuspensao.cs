using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
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
            string query;

            bool existeSuspensao = true;

            //Consulta
            query = @" SELECT COUNT(IDCONTRATOEMPTMO) FROM HISTMOVEMPTMO
             WHERE idcontratoemptmo = :numeroContrato
             AND iditememptmo = 13
             AND ((hmedataprevista >= :dataIni) AND (hmedataprevista <= :dataFim)) ";

            //Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();            
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //Definindo os parâmentros
                bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "dataIni", DbType.DateTime, dataIni);
                bancoDeDados.AddInParameter(comando, "dataFim", DbType.DateTime, dataFim);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existeSuspensao = (Convert.ToInt32(leitor.GetValue(IDCONTRATOEMPTMO_SUSP)) == 0);
                    }

                }

                return existeSuspensao; 
            }
        }//William Moreira da Silva SOL161447


        //William Moreira da Silva SOL161201
        /// <summary>
        /// Verifica se algum tem contrato ativo
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificaContratoAtivo(long numeroContrato)
        {
            string query;

            bool existeContratoAtivo = false;

            //Consulta
            //Select para verificar se temos contratos ativos
            query = @" SELECT COUNT(IDCONTRATOEMPTMO) FROM CONTRATOEMPTMO 
             WHERE IDCONTRATOEMPTMO = :numeroContrato 
             AND FLGSITUACAO = 'A' ";

            Database bancoDeDados = this.obterBancoDeDados();            
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, numeroContrato);
                //bancoDeDados.AddInParameter(comando, "idPessoa", DbType.Int32, idPessoa);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existeContratoAtivo = (Convert.ToInt32(leitor.GetValue(IDCONTRATOEMPTMO_ATIVOS)) >= 1);
                    }
                }

                return existeContratoAtivo; 
            }
        }
        //William Moreira da Silva SOL161201

        /// <summary>
        /// Verifica a existencia de uma suspensão ativa.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificarSuspensaoAtiva(long numeroContrato)
        {
            string query;

            bool existeSuspensao = false;
            DateTime? dataFinalSuspensao = null;
            string flgSituacao = string.Empty;

            // Consulta
            query = @"SELECT IDTIPOSUSPEMPTMO,HSCINICIOSUSP, HSCFINALSUSP,FLGSTATUS,FLGPRAZOINDETERMINADO --COUNT(IDCONTRATOEMPTMO) 
                      FROM CM.HISTSUSPCOBEP 
                      WHERE  IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
                      AND FLGSTATUS = 'A' ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existeSuspensao = (Convert.ToInt32(leitor.GetValue(IDCONTRATOEMPTMO_SUSP)) > 0);
                        flgSituacao = leitor.GetValue(3).ToString();
                        if (leitor.GetValue(2) != DBNull.Value)
                            dataFinalSuspensao = Convert.ToDateTime(leitor.GetValue(2));

                    }
                }

                //WO7740
                if (dataFinalSuspensao != null) 
                { 
                    int diferencaMeses = (DateTime.Today.Year - Convert.ToDateTime(dataFinalSuspensao).Year) * 12 + DateTime.Today.Month - Convert.ToDateTime(dataFinalSuspensao).Month;

                    if (flgSituacao == "A" && diferencaMeses >= 12)
                    {
                        existeSuspensao = false;
                    }
                }

                return existeSuspensao; 
            }
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

            string query;

            query = @" INSERT INTO CM.HISTSUSPCOBEP  
             ( 
                 IDHISTSUSPCOBEP, 
                 IDTIPOSUSPEMPTMO, 
                 IDCONTRATOEMPTMO, 
                 FLGSTATUS, 
                 FLGFERIAS, 
                 HSCINICIOSUSP, 
                 HSCFINALSUSP, 
                 HSCMESES, 
                 HSCUSUATEND, 
                 HSCDATAATEND, 
                 HSCDATAATU, 
                 HSCANOCOBRANCA, 
                 HSCMESCOBRANCA, 
                 TRGDTINCLUSAO, 
                 TRGUSERINCLUSAO, 
                 OBSERVACAO,
                FLGPRAZOINDETERMINADO
             ) 
             VALUES 
             ( 
                 :IDHISTSUSPCOBEP_P, 
                 :IDTIPOSUSPEMPTMO_P, 
                 :NUMEROCONTRATO_P, 
                 :FLGSTATUS_P, 
                 :FLGFERIAS_P, 
                 :HSCINICIOSUSP_P, 
                 :HSCFINALSUSP_P, 
                 :HSCMESES_P, 
                 :HSCUSUATEND_P, 
                 :HSCDATAATEND_P, 
                 :HSCDATAATU_P, 
                 :HSCANOCOBRANCA_P, 
                 :HSCMESCOBRANCA_P, 
                 :TRGDTINCLUSAO_P, 
                 :TRGUSERINCLUSAO_P, 
                 :OBSERVACAO_P,
                 :FLGPRAZOINDETERMINADO

             ) ";
            
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
                bancoDeDados.AddInParameter(comando, "FLGPRAZOINDETERMINADO", DbType.String, historico.prazoIndeterminado);

                bancoDeDados.ExecuteNonQuery(comando); 
            }
            
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

            string query;

            query = @" UPDATE CM.HISTSUSPCOBEP SET 
             FLGSTATUS 	= :FLGSTATUS_P, 
             HSCDATALIBER = :HSCDATALIBER_P, 
             HSCUSULIBER 	= :HSCUSULIBER_P, 
             HSCDATAATU 	= :HSCDATAATU_P, 
             HSCANOCOBRANCA = :HSCANOCOBRANCA_P, 
             HSCMESCOBRANCA = :HSCMESCOBRANCA_P, 
             OBSERVACAO = :OBSERVACAO_P ";

            //WO11809 - retirada a alteração da coluna 
            ////William Moreira da Silva SOL 235167
            //if (historico.status == "E")
            //{
            //    query = query +@" , HSCFINALSUSP = TRUNC(SYSDATE) ";
            //}

            query = query + @" WHERE IDHISTSUSPCOBEP = :IDHISTSUSPCOBEP_P ";
            //query.Append(" WHERE IDHISTSUSPCOBEP = :IDHISTSUSPCOBEP_P ");
            //William Moreira da Silva SOL 235167			
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
            
        }

        public int BuscarQtdParcelasSuspensas(long NumeroContrato)
        {
            string query;            
            
            query = @"SELECT COUNT(*)
                     FROM hmeprestacao
                     WHERE idcontratoemptmo = :NumeroContrato                    
                     AND NVL(idtiposuspemptmo,0) > 0
                     AND iditememptmo = 13";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
           
                bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Int64, NumeroContrato);
                           
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        return Convert.ToInt16(leitor.GetValue(0));
                    }
                }

                return 0;
            }
        }

        #endregion
    }
}
