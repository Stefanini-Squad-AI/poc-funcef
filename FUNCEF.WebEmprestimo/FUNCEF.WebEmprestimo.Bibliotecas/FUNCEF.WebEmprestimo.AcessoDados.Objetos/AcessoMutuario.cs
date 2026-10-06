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
    /// Objeto de acesso a dados de mutuario do sistema.
    /// </summary>
    public class AcessoMutuario : ObjetoAcessoDados, IAcessoMutuario
    {
        #region Constantes

        #region Consultar Mutuário

        private const int NOME_DEP_MUTUARIO = 0;
        private const int MATRICULA_DEP_MUTUARIO = 1;
        private const int CPF_DEP_MUTUARIO = 2;
        private const int TIPO_MUTUARIO = 3;
        private const int NOME_TIT_MUTUARIO = 4;
        private const int MATRICULA_TIT_MUTUARIO = 5;
        private const int CPF_TIT_MUTUARIO = 6;
        private const int INSCRICAOPREV_TIT_MUTUARIO = 7;
        private const int SITUACAO_PARTICIPANTE_MUTUARIO = 8;
        private const int SITUACAO_PLANO_MUTUARIO = 9;
        private const int NOME_PATRO_MUTUARIO = 10;
        private const int NOME_PLANOPREV_MUTUARIO = 11;
        private const int IDPLANOPREV_MUTUARIO = 12;
        private const int ID_PATROCINADORA_MUTUARIO = 13;
        private const int ID_PESSOA_TIT = 14;
        private const int ID_PESSOA_DEP = 15;
        private const int FLGINTERNO_MUTUARIO = 16;
        private const int SITPARTFUNDACAO = 16; // xavier alterar a assinatura da regra 6170 conforme e-mail
        private const int IDSITPART = 17; // xavier alterar a assinatura da regra conforme e-mail
        private const int IDPLANPREVCONTAB_P = 18;//William Moreira da Silva - SOL 217507 KTN 2047224



        #endregion

        #region Consultar Dados Bancários

        private const int IDCBANCARIA = 0;
        private const int FLAGCONTAPREF = 1;
        private const int TIPOCONTA = 2;
        private const int IDBANCO = 3;
        private const int NOMEBANCO = 4;
        private const int NUMAGENCIA = 5;
        private const int CONTACORRENTE = 6;
        private const int DADOS = 7;
        private const int NUMEROBANCO = 8;

        #endregion

        #region Consultar Lista Caixa

        private const int IDPORTOFORMA_CONTACAIXA = 0;
        private const int DESCRICAO_CONTACAIXA = 1;
        private const int RECPAG_CONTACAIXA = 2;
        private const int PORTFORMPAGTO = 3;

        #endregion

        #region Listar Tipo Recurso

        private const int IDTIPORECURSO = 0;
        private const int NOME_TIPORECURSO = 1;

        #endregion

        #region Verificar Assinatura

        private const int CTPDATAINICIO_ASSINATURA = 4;
        private const int FLGBLOQUEIO_ASSINATURA = 7;

        #endregion

        #region Obter itens em aberto

        private const int IDPESSOA_ITENSABERTOS = 0;
        private const int EVENTO_ITENSABERTOS = 1;
        private const int HMEMESCOMPETENCIA_ITENSABERTOS = 2;
        private const int HMEANOCOMPETENCIA_ITENSABERTOS = 3;
        private const int HMEPARCELA_ITENSABERTOS = 4;
        private const int HMESEQCOBRANCA_ITENSABERTOS = 5;
        private const int ITEDESCRICAO_ITENSABERTOS = 6;
        private const int HMEDATAPREVISTA_ITENSABERTOS = 7;
        private const int HMEDATAVENCTO_ITENSABERTOS = 8;
        private const int HMEVLRPREVISTO_ITENSABERTOS = 9;
        private const int HMETXJUROS_ITENSABERTOS = 10;
        private const int HMESALDODEV_ITENSABERTOS = 11;
        private const int IDCONTRATOEMPTMO_ITENSABERTOS = 12;
        private const int HMETIPOMOV_ITENSABERTOS = 13;

        #endregion

        #endregion

        #region Consultas

        //BRUNO AZEVEDO SOL 164128
        /// <summary>
        /// Consulta Plano Contábil do Mutuário.
        /// </summary>
        /// <param name="mutuario">Mutuário a ser filtrado</param>
        /// <param name="parametros">Plano previdenciário a ser consultado.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) planos dos Mutuário(s) encontrado(s).</returns>
        public int consultarPlanoContabilMutuario(int idmutuario, int idplanoprev)
        {
            int idplanocontabil = 0;

            StringBuilder query = new StringBuilder();

            query.Append(" SELECT CTB.IDPLANOPREV ");
            query.Append("   FROM PARTPREVPLAN ATU, ");
            query.Append("        PARTPREVPLAN ANT, ");
            query.Append("        PLANPREVCONTABIL CTB ");
            query.Append("  WHERE ATU.IDPESSOA = :PIDPESSOA ");
            query.Append("    AND ATU.IDPLANOPREV = 74 ");
            query.Append("    AND CTB.IDPLANOPREVPREV = ANT.IDPLANOPREV ");
            query.Append("    AND CTB.IDPLANOPREV = 28 ");
            query.Append("    AND ANT.IDPESSOA = ATU.IDPESSOA ");
            query.Append("    AND ANT.INSCRICAODATA = ");
            query.Append("         (SELECT MAX(INSCRICAODATA) ");
            query.Append("          FROM   PARTPREVPLAN ");
            query.Append("          WHERE  IDPESSOA = ATU.IDPESSOA ");
            query.Append("          AND    IDPLANOPREV = 2 ");
            query.Append("          AND    IDSITPLANOPREV IN (25,27,28,29) ");
            query.Append("          AND    FLGDESATIVADO = 1 ");
            query.Append("          AND    INSCRICAODATA < ATU.INSCRICAODATA) ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "PIDPESSOA", DbType.Int32, idmutuario);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    idplanocontabil = leitor.GetInt32(0);
                }
            }
         
            //NÃO ENCONTROU O PLANO CONTABIL, PROCURAR NA BENEFBFCIARIO
            if (idplanocontabil == 0)
            {
                StringBuilder query2 = new StringBuilder();
                
                query2.Append(" SELECT DISTINCT ");
                query2.Append("        IDPLANPREVCONTAB, ");
                query2.Append("        IDTITULAR, ");
                query2.Append("        IDPESSOA, ");
                query2.Append("        IDPLANOPREV, ");
                query2.Append("        IDPLANPREVCONTAB ");        
                query2.Append("   FROM BENEFBFCIARIO ");
                query2.Append("  WHERE IDPESSOA       = :PIDPESSOA ");
                query2.Append("    AND IDPLANOPREV    = :PIDPLANOPREV ");
                query2.Append("    AND IDSITBENEFICIO = 1 ");

                Database bancoDeDados2 = this.obterBancoDeDados();
                DbCommand comando2 = bancoDeDados2.GetSqlStringCommand(query2.ToString());

                bancoDeDados2.AddInParameter(comando2, "PIDPESSOA", DbType.Int32, idmutuario);
                bancoDeDados2.AddInParameter(comando2, "PIDPLANOPREV", DbType.Int32, idplanoprev);

                using (IDataReader leitor = bancoDeDados2.ExecuteReader(comando2))
                {
                    if (leitor.Read())
                    {
                        idplanocontabil = leitor.GetInt32(0);
                    }
                }
            }

            return idplanocontabil;
        }
        //BRUNO AZEVEDO SOL 164128

        /// <summary>
        /// Consulta Mutuário.
        /// </summary>
        /// <param name="mutuario">Mutuário a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) Mutuário(s) encontrado(s).</returns>
        public List<Mutuario> consultarMutuario(Mutuario mutuario, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            bool buscarMatricula = mutuario != null && !String.IsNullOrEmpty(mutuario.matricula);
            bool buscarCPF = mutuario != null && !String.IsNullOrEmpty(mutuario.cpf);
            bool buscarNome = mutuario != null && !String.IsNullOrEmpty(mutuario.nome);

            //Se a primeira vier nulo uma segunda query é executada. 
            //Isso ocorre porque a primeira query não engloba os pensionistas, 
            //que então são selecionados pela segunda query.

            // Consulta
            query.Append("SELECT  ");
            query.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP,  ");
            query.Append("   DECODE(DEP.IDTITULAR, NULL, '',  ");
            query.Append("   DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  ");
            query.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, ");
            query.Append("   DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO,  "); //NILTON - CORRECAO - 31/01/13
            query.Append("   PEP.NOME AS NOME_TIT,      ");
            query.Append("   ELP.MATRICULA AS MATRICULA_TIT,  ");
            query.Append("   PEP.NUMDOCUMENTO AS CPF_TIT,   ");
            query.Append("   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  ");
            query.Append("   SIP.DESCRICAO AS SIT_PART,  ");
            query.Append("   SPP.DESCRICAO AS SIT_PLANO,  ");
            query.Append("   PPA.NOME AS NOME_PATRO,  ");
            query.Append("   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, ");
            query.Append("   PLP.IDPLANOPREV, ");
            query.Append("   PPA.IDPESSOA AS IDPATRO, ");
            query.Append("   PEP.IDPESSOA AS ID_TIT, ");
            query.Append("   DEP.IDPESSOA AS ID_DEP ");
            query.Append("   , SIP.FLGINTERNO AS SITPARTFUNDACAO "); // xavier alterar a assinatura da regra 6170 conforme e-mail
            query.Append("   , PPP.IDSITPART AS IDSITPART "); // xavier alterar a assinatura da regra conforme e-mail
            query.Append("   , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB ");//William Moreira da Silva - SOL 217507 KTN 2047224
            query.Append("FROM  ");
            query.Append("  ELEGPATRO ELP  ");
            query.Append("  JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA ");
            query.Append("  JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA ");
            query.Append("  JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR ");
            query.Append("                         AND ELP.IDPESSOA = PPP.IDPESSOA  ");
            query.Append("  JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV ");
            query.Append("  JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART ");
            query.Append("  JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ");
            query.Append("  JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA ");
            query.Append("  JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA ");
            query.Append("  LEFT JOIN (SELECT DISTINCT BNF.IDPESSOA, ");
            query.Append("                BNF.IDTITULAR, ");
            query.Append("                BNF.IDPLANOPREV, ");
            query.Append("                BNF.IDPLANOORIGEM, ");
            query.Append("                BNF.IDPLANPREVCONTAB ");
            query.Append("  FROM BENEFBFCIARIO BNF ");
            query.Append("  WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)  ");
            query.Append("  AND BNF.FONTEPAGADORA = 1 ");
            query.Append("  AND BNF.IDSITBENEFICIO IN ");
            query.Append("  (SELECT MIN(SB1.IDSITBENEFICIO) ");
            query.Append("  FROM BENEFBFCIARIO SB1 ");
            query.Append("  WHERE BNF.IDPESSOA = SB1.IDPESSOA ");
            query.Append("  AND BNF.IDTITULAR = SB1.IDTITULAR ");
            query.Append("  AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA ");
            query.Append("                                            AND BFC.IDTITULAR =  DEP.IDTITULAR ");
            query.Append("                                            AND bfc.Idplanoprev = ppp.idplanoprev ");
            query.Append("  LEFT JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV ");
            query.Append("  WHERE dep.idtitular = dep.idpessoa ");
            query.Append("  AND  (PPP.IDSITPLANOPREV = 25 OR  ");
            query.Append("  PPP.IDPLANOPREV =  (SELECT MAX(PPP2.IDPLANOPREV) ");
            query.Append("                      FROM PARTPREVPLAN PPP2 ");
            query.Append("                      WHERE PPP2.FLGDESATIVADO = 0 ");
            query.Append("                      AND PPP2.Idsitplanoprev <> 25 ");
            query.Append("                      AND PPP2.IDPESSOA = PPP.IDPESSOA ");
            query.Append("                      AND NOT EXISTS (SELECT 1 ");
            query.Append("                                      FROM PARTPREVPLAN PPP3 ");
            query.Append("                                      WHERE PPP3.IDPESSOA = PPP2.IDPESSOA ");
            query.Append("                                      AND PPP3.IDSITPLANOPREV = 25))) ");



            // Filtros
            if (buscarMatricula)
            {
                query.Append("  AND DEP.MATRICULA LIKE :MATRICULA_P ");
            }
            if (buscarCPF)
            {
                query.Append("  AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE :CPF_P || '%' ");
            }
            if (buscarNome)
            {
                query.Append("  AND PEP.NOME LIKE :NOME_P || '%' ");
                query.Append("  AND PDP.NOME LIKE :NOME1_P || '%' ");
            }

            // Ordenação
            query.Append(this.obterQueryOrdenacao("PEP", "NOME ASC", parametros));

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros

            if (buscarMatricula)
            {
                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, mutuario.matricula);
            }
            if (buscarCPF)
                bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, mutuario.cpf);
            if (buscarNome)
            {
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, mutuario.nome.ToUpper());
                bancoDeDados.AddInParameter(comando, "NOME1_P", DbType.String, mutuario.nome.ToUpper());
            }

            // Popula objetos resultantes

            bool bExisteMutuarios = false;

            List<Mutuario> mutuarios = new List<Mutuario>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {

                while (leitor.Read())
                {
                    bExisteMutuarios = true;
                    Mutuario item = new Mutuario()
                    {
                        nome = leitor.GetString(NOME_DEP_MUTUARIO),
                        matricula = leitor.GetString(MATRICULA_DEP_MUTUARIO),
                        cpf = leitor.GetString(CPF_TIT_MUTUARIO),
                        inscricaoPrevidenciaria = leitor.GetInt64(INSCRICAOPREV_TIT_MUTUARIO),
                        situacao = leitor.GetString(SITUACAO_PARTICIPANTE_MUTUARIO),
                        tipo = leitor.GetString(TIPO_MUTUARIO),
                        id = leitor.GetInt32(ID_PESSOA_DEP),
                        idTitular = leitor.GetInt32(ID_PESSOA_TIT),
                        flginternoParticipante = leitor.GetString(FLGINTERNO_MUTUARIO),  // xavier alterar a assinatura da regra 6170 conforme e-mail
                        idsitpart = leitor.GetInt32(IDSITPART),  // xavier alterar a assinatura conforme e-mail
                        plano = new PlanoPrevidenciario()
                        {
                            id = leitor.GetInt32(IDPLANOPREV_MUTUARIO),
                            situacao = leitor.GetString(SITUACAO_PLANO_MUTUARIO),
                            descricao = leitor.GetString(NOME_PLANOPREV_MUTUARIO),
                            flagInterno = leitor.GetString(FLGINTERNO_MUTUARIO),
                            IdPlanoOrigem = leitor.GetInt32(IDPLANPREVCONTAB_P)//William Moreira da Silva - SOL 217507 KTN 2047224
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            id = leitor.GetInt32(ID_PATROCINADORA_MUTUARIO),
                            nome = leitor.GetString(NOME_PATRO_MUTUARIO)
                        }
                    };
                    mutuarios.Add(item);
                }
                // Total de Regristros
                parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
                parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query.ToString());

            }

            if (!bExisteMutuarios)
            {

                StringBuilder querypensionista = new StringBuilder();

                // Consulta
                querypensionista.Append("SELECT  ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP,  ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, NULL, '',  ");
                querypensionista.Append("   DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO,  "); //NILTON - CORRECAO - 31/01/13
                querypensionista.Append("   PEP.NOME AS NOME_TIT,      ");
                querypensionista.Append("   ELP.MATRICULA AS MATRICULA_TIT,  ");
                querypensionista.Append("   PEP.NUMDOCUMENTO AS CPF_TIT,   ");
                querypensionista.Append("   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  ");
                querypensionista.Append("   SIP.DESCRICAO AS SIT_PART,  ");
                querypensionista.Append("   SPP.DESCRICAO AS SIT_PLANO,  ");
                querypensionista.Append("   PPA.NOME AS NOME_PATRO,  ");
                querypensionista.Append("   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, ");
                //querypensionista.Append("   PLP.IDPLANOPREV, ");
                querypensionista.Append("   PLP2.IDPLANOPREV,        ");//William Moreira da Silva - SOL 217194/15192 - KTN 2046539
                querypensionista.Append("   PPA.IDPESSOA AS IDPATRO, ");
                querypensionista.Append("   PEP.IDPESSOA AS ID_TIT, ");
                querypensionista.Append("   DEP.IDPESSOA AS ID_DEP ");
                querypensionista.Append("   , SIP.FLGINTERNO AS SITPARTFUNDACAO "); // xavier alterar a assinatura da regra 6170 conforme e-mail
                querypensionista.Append("   , PPP.IDSITPART AS IDSITPART "); // xavier alterar a assinatura da regra conforme e-mail
                querypensionista.Append("   , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB ");//William Moreira da Silva - SOL 217507 KTN 2047224                
                querypensionista.Append("FROM  ");
                querypensionista.Append("   ELEGPATRO ELP  ");
                querypensionista.Append("   JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA  ");
                querypensionista.Append("   JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA ");
                querypensionista.Append("   JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR ");
                querypensionista.Append("                         AND ELP.IDPESSOA = PPP.IDPESSOA ");
                querypensionista.Append("   JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV ");
                querypensionista.Append("   JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART ");
                querypensionista.Append("   JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ");
                querypensionista.Append("   JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA ");
                querypensionista.Append("   JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA ");
                querypensionista.Append("   JOIN (SELECT DISTINCT BNF.IDPESSOA, ");
                querypensionista.Append("                BNF.IDTITULAR, ");
                querypensionista.Append("                BNF.IDPLANOPREV, ");
                querypensionista.Append("                BNF.IDPLANOORIGEM, ");
                querypensionista.Append("                BNF.IDPLANPREVCONTAB ");
                querypensionista.Append("         FROM BENEFBFCIARIO BNF ");
                querypensionista.Append("         WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE) ");
                querypensionista.Append("         AND BNF.FONTEPAGADORA = 1  ");
                querypensionista.Append("         AND BNF.IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO) ");
                querypensionista.Append("                                    FROM BENEFBFCIARIO SB1 ");
                querypensionista.Append("                                    WHERE BNF.IDPESSOA = SB1.IDPESSOA  ");
                querypensionista.Append("                                    AND BNF.IDTITULAR = SB1.IDTITULAR ");
                querypensionista.Append("                                    AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA ");
                querypensionista.Append("                                                                              AND BFC.IDTITULAR =  DEP.IDTITULAR ");
                querypensionista.Append("   JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV ");
                querypensionista.Append("   WHERE ((BFC.IDPLANPREVCONTAB = 28 OR ");
                querypensionista.Append("   (BFC.IDPLANPREVCONTAB <> 28) ");
                querypensionista.Append("   AND NOT EXISTS (SELECT 1 ");
                querypensionista.Append("                   FROM BENEFBFCIARIO BF ");
                querypensionista.Append("                   WHERE (BF.DATAFINAL IS NULL OR BF.DATAFINAL > SYSDATE) ");
                querypensionista.Append("                   AND BF.IDPESSOA = BFC.IDPESSOA ");
                querypensionista.Append("                   AND BF.IDTITULAR = BFC.IDTITULAR ");
                querypensionista.Append("                   AND BF.FONTEPAGADORA = 1 ");
                querypensionista.Append("                   AND BF.IDTPPAGTOBENEFIC = 1 ");
                querypensionista.Append("                   AND BF.IDPLANPREVCONTAB = 28  ");
                querypensionista.Append("                   AND BF.IDSITBENEFICIO IN ");
                querypensionista.Append("                   (SELECT MIN(SB1.IDSITBENEFICIO) ");
                querypensionista.Append("                   FROM BENEFBFCIARIO SB1 ");
                querypensionista.Append("                   WHERE BF.IDPESSOA = SB1.IDPESSOA ");
                querypensionista.Append("                   AND BF.IDTITULAR = SB1.IDTITULAR ");
                querypensionista.Append("                   AND SB1.IDSITBENEFICIO IN (1, 2, 7))))) ");
                querypensionista.Append("   AND bfc.idpessoa <> bfc.idtitular ");
                querypensionista.Append("   AND ppp.idplanoprev = (SELECT MAX(PPP2.IDPLANOPREV) ");
                querypensionista.Append("                          FROM PARTPREVPLAN PPP2 ");
                querypensionista.Append("                          WHERE PPP2.IDPESSOA = PPP.IDPESSOA) ");



                // Filtros
                if (buscarMatricula)
                {
                    querypensionista.Append("  AND DEP.MATRICULA LIKE :MATRICULA_P ");
                }
                if (buscarCPF)
                {
                    querypensionista.Append("  AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE :CPF_P || '%' ");
                }
                if (buscarNome)
                {
                    querypensionista.Append("  AND PEP.NOME LIKE :NOME_P || '%' ");
                    querypensionista.Append("  AND PDP.NOME LIKE :NOME1_P || '%' ");
                }

                // Ordenação
                querypensionista.Append(this.obterQueryOrdenacao("PEP", "NOME ASC", parametros));

                // Cria comando de consulta
                Database bancoDeDadospensionista = this.obterBancoDeDados();
                DbCommand comandopensionista;
                if (parametros != null && parametros.paginacao != null)
                    comandopensionista = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(querypensionista.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
                else
                    comandopensionista = bancoDeDados.GetSqlStringCommand(querypensionista.ToString());

                // Parâmetros

                if (buscarMatricula)
                {
                    bancoDeDados.AddInParameter(comandopensionista, "MATRICULA_P", DbType.String, mutuario.matricula);
                }
                if (buscarCPF)
                    bancoDeDados.AddInParameter(comandopensionista, "CPF_P", DbType.String, mutuario.cpf);
                if (buscarNome)
                {
                    bancoDeDados.AddInParameter(comandopensionista, "NOME_P", DbType.String, mutuario.nome.ToUpper());
                    bancoDeDados.AddInParameter(comandopensionista, "NOME1_P", DbType.String, mutuario.nome.ToUpper());
                }

                // Popula objetos resultantes

                //List<Mutuario> mutuariospensionista = new List<Mutuario>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comandopensionista))
                {

                    while (leitor.Read())
                    {
                        bExisteMutuarios = true;
                        Mutuario item = new Mutuario()
                        {
                            nome = leitor.GetString(NOME_DEP_MUTUARIO),
                            matricula = leitor.GetString(MATRICULA_DEP_MUTUARIO),
                            //cpf = leitor.GetString(CPF_TIT_MUTUARIO),
                            cpf = leitor.GetString(CPF_DEP_MUTUARIO),
                            // Thiago Melo
                            inscricaoPrevidenciaria = leitor.GetInt64(INSCRICAOPREV_TIT_MUTUARIO),
                            situacao = leitor.GetString(SITUACAO_PARTICIPANTE_MUTUARIO),
                            tipo = leitor.GetString(TIPO_MUTUARIO),
                            id = leitor.GetInt32(ID_PESSOA_DEP),
                            idTitular = leitor.GetInt32(ID_PESSOA_TIT),
                            flginternoParticipante = leitor.GetString(FLGINTERNO_MUTUARIO),  // xavier alterar a assinatura da regra 6170 conforme e-mail
                            idsitpart = leitor.GetInt32(IDSITPART),  // xavier alterar a assinatura conforme e-mail
                            plano = new PlanoPrevidenciario()
                            {
                                id = leitor.GetInt32(IDPLANOPREV_MUTUARIO),
                                situacao = leitor.GetString(SITUACAO_PLANO_MUTUARIO),
                                descricao = leitor.GetString(NOME_PLANOPREV_MUTUARIO),
                                flagInterno = leitor.GetString(FLGINTERNO_MUTUARIO),
                                IdPlanoOrigem = leitor.GetInt32(IDPLANPREVCONTAB_P)//William Moreira da Silva - SOL 217507 KTN 2047224
                            },
                            patrocinadora = new Patrocinadora()
                            {
                                id = leitor.GetInt32(ID_PATROCINADORA_MUTUARIO),
                                nome = leitor.GetString(NOME_PATRO_MUTUARIO)
                            }
                        };
                        mutuarios.Add(item);
                    }
                    // Total de Regristros
                    parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
                    parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDadospensionista, comandopensionista, querypensionista.ToString());
                }

            }



            // Retorna informações
            parametros.prepararRetorno();
            return mutuarios;
       
       

        }

        /// <summary>
        /// Consulta Avalista.
        /// </summary>
        /// <param name="mutuario">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            bool buscarRazaoSocial = avalista != null && !String.IsNullOrEmpty(avalista.razaoSocial);
            bool buscarCPF = avalista != null && !String.IsNullOrEmpty(avalista.cpf);
            bool buscarNome = avalista != null && !String.IsNullOrEmpty(avalista.nome);


            // Consulta
            query.Append(" SELECT    P.NOME ,    P.RAZAOSOCIAL , P.NUMDOCUMENTO ,    ");
            query.Append(" A.MARGEMCONSIG,   A.RENDACOMP, A.IDAVALISTA   ");
            query.Append(" FROM    PESSOA P,    AVALISTA A WHERE  ( A.IDAVALISTA = P.IDPESSOA ) AND ( A.MARGEMCONSIG > 0 )");

            // Filtros
            if (buscarRazaoSocial)
            {
                query.Append("  AND P.RAZAOSOCIAL LIKE :RAZAOSOCIAL_P ");
            }
            if (buscarCPF)
            {
                query.Append("  AND UPPER(P.NUMDOCUMENTO) LIKE :CPF_P || '%' ");
            }
            if (buscarNome)
            {
                query.Append("  AND P.NOME LIKE :NOME_P || '%' ");
                //query.Append("  AND PDP.NOME LIKE :NOME1_P || '%' ");
            }

            // Ordenação
            query.Append(this.obterQueryOrdenacao("P", "NOME ASC", parametros));

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros

            if (buscarRazaoSocial)
            {
                bancoDeDados.AddInParameter(comando, "RAZAOSOCIAL_P", DbType.String, avalista.razaoSocial);
            }
            if (buscarCPF)
                bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, avalista.cpf);
            if (buscarNome)
            {
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, avalista.nome.ToUpper());
                //bancoDeDados.AddInParameter(comando, "NOME1_P", DbType.String, mutuario.nome.ToUpper());
            }

            // Popula objetos resultantes

            bool bExisteAvalistas = false;

            List<Avalistas> avalistas = new List<Avalistas>();

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    bExisteAvalistas = true;
                    Avalistas item = new Avalistas()
                    {
                        nome = leitor.GetString(0),
                        razaoSocial = leitor.GetString(1),
                        cpf = leitor.GetString(2),
                        renda = leitor.GetDouble(4),
                        id = leitor.GetInt32(5),
                    };
                    avalistas.Add(item);
                }
                // Total de Regristros
                parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
                parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query.ToString());

            }

            // Retorna informações
            parametros.prepararRetorno();
            return avalistas;
        }

        /// <summary>
        /// Obtem dados do Mutuario.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>

        public Mutuario obterDadosMutuario(string matricula) // Thiago Melo SOL 206149
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT  ");
            query.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP,  ");
            query.Append("   DECODE(DEP.IDTITULAR, NULL, '',  ");
            query.Append("   DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  ");
            query.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, ");
            query.Append("   DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO,  ");//NILTON - CORRECAO - 31/01/13 
            query.Append("   PEP.NOME AS NOME_TIT,      ");
            query.Append("   ELP.MATRICULA AS MATRICULA_TIT,  ");
            query.Append("   PEP.NUMDOCUMENTO AS CPF_TIT,   ");
            query.Append("   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  ");
            query.Append("   SIP.DESCRICAO AS SIT_PART,  ");
            query.Append("   SPP.DESCRICAO AS SIT_PLANO,  ");
            query.Append("   PPA.NOME AS NOME_PATRO,  ");
            query.Append("   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, ");
            query.Append("   PLP.IDPLANOPREV, ");
            query.Append("   PPA.IDPESSOA AS IDPATRO, ");
            query.Append("   PEP.IDPESSOA AS ID_TIT, ");
            query.Append("   DEP.IDPESSOA AS ID_DEP ");
            query.Append("   , SIP.FLGINTERNO AS SITPARTFUNDACAO "); // xavier alterar a assinatura da regra 6170 conforme e-mail
            query.Append("   , PPP.IDSITPART AS IDSITPART "); // xavier alterar a assinatura da regra conforme e-mail
            query.Append("   , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB ");//William Moreira da Silva - SOL 217507 KTN 2047224
            query.Append("FROM  ");
            query.Append("  ELEGPATRO ELP  ");
            query.Append("  JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA ");
            query.Append("  JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA ");
            query.Append("  JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR ");
            query.Append("                         AND ELP.IDPESSOA = PPP.IDPESSOA  ");
            query.Append("  JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV ");
            query.Append("  JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART ");
            query.Append("  JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ");
            query.Append("  JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA ");
            query.Append("  JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA ");
            query.Append("  LEFT JOIN (SELECT DISTINCT BNF.IDPESSOA, ");
            query.Append("                BNF.IDTITULAR, ");
            query.Append("                BNF.IDPLANOPREV, ");
            query.Append("                BNF.IDPLANOORIGEM, ");
            query.Append("                BNF.IDPLANPREVCONTAB ");
            query.Append("  FROM BENEFBFCIARIO BNF ");
            query.Append("  WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)  ");
            query.Append("  AND BNF.FONTEPAGADORA = 1 ");
            query.Append("  AND BNF.IDSITBENEFICIO IN ");
            query.Append("  (SELECT MIN(SB1.IDSITBENEFICIO) ");
            query.Append("  FROM BENEFBFCIARIO SB1 ");
            query.Append("  WHERE BNF.IDPESSOA = SB1.IDPESSOA ");
            query.Append("  AND BNF.IDTITULAR = SB1.IDTITULAR ");
            query.Append("  AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA ");
            query.Append("                                            AND BFC.IDTITULAR =  DEP.IDTITULAR ");
            query.Append("                                            AND bfc.Idplanoprev = ppp.idplanoprev ");
            query.Append("  LEFT JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV ");
            query.Append("  WHERE dep.idtitular = dep.idpessoa ");
            query.Append("  AND  (PPP.IDSITPLANOPREV = 25 OR  ");
            query.Append("  PPP.IDPLANOPREV =  (SELECT MAX(PPP2.IDPLANOPREV) ");
            query.Append("                      FROM PARTPREVPLAN PPP2 ");
            query.Append("                      WHERE PPP2.FLGDESATIVADO = 0 ");
            query.Append("                      AND PPP2.Idsitplanoprev <> 25 ");
            query.Append("                      AND PPP2.IDPESSOA = PPP.IDPESSOA ");
            query.Append("                      AND NOT EXISTS (SELECT 1 ");
            query.Append("                                      FROM PARTPREVPLAN PPP3 ");
            query.Append("                                      WHERE PPP3.IDPESSOA = PPP2.IDPESSOA ");
            query.Append("                                      AND PPP3.IDSITPLANOPREV = 25))) ");

            // xavier fim - adicionado a mesma verificação que existe no Planus. inicio

            // Filtro
            // Thiago Melo SOL 206149
            //query.Append("  AND DEP.IDPESSOA = :ID_PESSOA_P ");
            query.Append("  AND DEP.MATRICULA = :MATRICULA_P ");
            // Thiago Melo SOL 206149

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            // Thiago Melo SOL 206149
            //bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);
            bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, matricula);
            // Thiago Melo SOL 206149


            // Popula objetos resultantes

            bool bExisteMutuario = false;


            Mutuario mutuario = new Mutuario();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    bExisteMutuario = true;
                    mutuario = new Mutuario()
                    {
                        nome = leitor.GetString(NOME_DEP_MUTUARIO),
                        matricula = leitor.GetString(MATRICULA_DEP_MUTUARIO),
                        cpf = leitor.GetString(CPF_TIT_MUTUARIO),
                        inscricaoPrevidenciaria = leitor.GetInt64(INSCRICAOPREV_TIT_MUTUARIO),
                        situacao = leitor.GetString(SITUACAO_PARTICIPANTE_MUTUARIO),
                        tipo = leitor.GetString(TIPO_MUTUARIO),
                        id = leitor.GetInt32(ID_PESSOA_DEP),
                        idTitular = leitor.GetInt32(ID_PESSOA_TIT),
                        flginternoParticipante = leitor.GetString(SITPARTFUNDACAO), // xavier alterar a assinatura da regra 6170 conforme e-mail
                        idsitpart = leitor.GetInt32(IDSITPART),  // xavier alterar a assinatura conforme e-mail
                        plano = new PlanoPrevidenciario()
                        {
                            id = leitor.GetInt32(IDPLANOPREV_MUTUARIO),
                            situacao = leitor.GetString(SITUACAO_PLANO_MUTUARIO),
                            descricao = leitor.GetString(NOME_PLANOPREV_MUTUARIO),
                            IdPlanoOrigem = leitor.GetInt32(IDPLANPREVCONTAB_P)//William Moreira da Silva - SOL 217507 KTN 2047224
                            // Thiago Melo SOL 206149
                            //IdPlanoOrigem = this.consultarPlanoContabilMutuario(idPessoa, leitor.GetInt32(IDPLANOPREV_MUTUARIO))                            
                            //IdPlanoOrigem = this.consultarPlanoContabilMutuario(leitor.GetInt32(ID_PESSOA_DEP), leitor.GetInt32(IDPLANOPREV_MUTUARIO))
                            // Thiago Melo SOL 206149
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            id = leitor.GetInt32(ID_PATROCINADORA_MUTUARIO),
                            nome = leitor.GetString(NOME_PATRO_MUTUARIO)
                        }
                    };

                }
            }

            if (!bExisteMutuario)
            {
                StringBuilder querypensionista = new StringBuilder();

                querypensionista.Append("SELECT  ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP,  ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, NULL, '',  ");
                querypensionista.Append("   DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, ");
                querypensionista.Append("   DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO,  "); //NILTON - CORRECAO - 31/01/13
                querypensionista.Append("   PEP.NOME AS NOME_TIT,      ");
                querypensionista.Append("   ELP.MATRICULA AS MATRICULA_TIT,  ");
                querypensionista.Append("   PEP.NUMDOCUMENTO AS CPF_TIT,   ");
                querypensionista.Append("   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  ");
                querypensionista.Append("   SIP.DESCRICAO AS SIT_PART,  ");
                querypensionista.Append("   SPP.DESCRICAO AS SIT_PLANO,  ");
                querypensionista.Append("   PPA.NOME AS NOME_PATRO,  ");
                querypensionista.Append("   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, ");
                querypensionista.Append("   PLP2.IDPLANOPREV, "); //NILTON - CORRECAO 30/01/13
                querypensionista.Append("   PPA.IDPESSOA AS IDPATRO, ");
                querypensionista.Append("   PEP.IDPESSOA AS ID_TIT, ");
                querypensionista.Append("   DEP.IDPESSOA AS ID_DEP ");
                querypensionista.Append("   , SIP.FLGINTERNO AS SITPARTFUNDACAO "); // xavier alterar a assinatura da regra 6170 conforme e-mail
                querypensionista.Append("   , PPP.IDSITPART AS IDSITPART "); // xavier alterar a assinatura da regra conforme e-mail
                querypensionista.Append("   , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB ");//William Moreira da Silva - SOL 217507 KTN 2047224
                querypensionista.Append("FROM  ");
                querypensionista.Append("   ELEGPATRO ELP  ");
                querypensionista.Append("   JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA  ");
                querypensionista.Append("   JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA ");
                querypensionista.Append("   JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR ");
                querypensionista.Append("                         AND ELP.IDPESSOA = PPP.IDPESSOA ");
                querypensionista.Append("   JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV ");
                querypensionista.Append("   JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART ");
                querypensionista.Append("   JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ");
                querypensionista.Append("   JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA ");
                querypensionista.Append("   JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA ");
                querypensionista.Append("   JOIN (SELECT DISTINCT BNF.IDPESSOA, ");
                querypensionista.Append("                BNF.IDTITULAR, ");
                querypensionista.Append("                BNF.IDPLANOPREV, ");
                querypensionista.Append("                BNF.IDPLANOORIGEM, ");
                querypensionista.Append("                BNF.IDPLANPREVCONTAB ");
                querypensionista.Append("         FROM BENEFBFCIARIO BNF ");
                querypensionista.Append("         WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE) ");
                querypensionista.Append("         AND BNF.FONTEPAGADORA = 1  ");
                querypensionista.Append("         AND BNF.IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO) ");
                querypensionista.Append("                                    FROM BENEFBFCIARIO SB1 ");
                querypensionista.Append("                                    WHERE BNF.IDPESSOA = SB1.IDPESSOA  ");
                querypensionista.Append("                                    AND BNF.IDTITULAR = SB1.IDTITULAR ");
                querypensionista.Append("                                    AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA ");
                querypensionista.Append("                                                                              AND BFC.IDTITULAR =  DEP.IDTITULAR ");
                querypensionista.Append("   JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV ");
                querypensionista.Append("   WHERE ((BFC.IDPLANPREVCONTAB = 28 OR ");
                querypensionista.Append("   (BFC.IDPLANPREVCONTAB <> 28) ");
                querypensionista.Append("   AND NOT EXISTS (SELECT 1 ");
                querypensionista.Append("                   FROM BENEFBFCIARIO BF ");
                querypensionista.Append("                   WHERE (BF.DATAFINAL IS NULL OR BF.DATAFINAL > SYSDATE) ");
                querypensionista.Append("                   AND BF.IDPESSOA = BFC.IDPESSOA ");
                querypensionista.Append("                   AND BF.IDTITULAR = BFC.IDTITULAR ");
                querypensionista.Append("                   AND BF.FONTEPAGADORA = 1 ");
                querypensionista.Append("                   AND BF.IDTPPAGTOBENEFIC = 1 ");
                querypensionista.Append("                   AND BF.IDPLANPREVCONTAB = 28  ");
                querypensionista.Append("                   AND BF.IDSITBENEFICIO IN ");
                querypensionista.Append("                   (SELECT MIN(SB1.IDSITBENEFICIO) ");
                querypensionista.Append("                   FROM BENEFBFCIARIO SB1 ");
                querypensionista.Append("                   WHERE BF.IDPESSOA = SB1.IDPESSOA ");
                querypensionista.Append("                   AND BF.IDTITULAR = SB1.IDTITULAR ");
                querypensionista.Append("                   AND SB1.IDSITBENEFICIO IN (1, 2, 7))))) ");
                querypensionista.Append("   AND bfc.idpessoa <> bfc.idtitular ");
                querypensionista.Append("   AND ppp.idplanoprev = (SELECT MAX(PPP2.IDPLANOPREV) ");
                querypensionista.Append("                          FROM PARTPREVPLAN PPP2 ");
                querypensionista.Append("                          WHERE PPP2.IDPESSOA = PPP.IDPESSOA) ");


                // Filtro               
                // Thiago Melo SOL 206149
                //querypensionista.Append("  AND DEP.IDPESSOA = :ID_PESSOA_P ");
                querypensionista.Append("  AND DEP.MATRICULA = :MATRICULA_P ");
                // Thiago Melo SOL 206149

                // Cria comando de consulta
                Database bancoDeDadosPensionista = this.obterBancoDeDados();
                DbCommand comandopensionista = bancoDeDados.GetSqlStringCommand(querypensionista.ToString());

                // Parâmetros                
                // Thiago Melo SOL 206149
                //bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);
                bancoDeDados.AddInParameter(comandopensionista, "MATRICULA_P", DbType.String, matricula);
                // Thiago Melo SOL 206149

                // Popula objetos resultantes


                //Mutuario mutuario = new Mutuario();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comandopensionista))
                {
                    while (leitor.Read())
                    {
                        mutuario = new Mutuario()
                        {
                            nome = leitor.GetString(NOME_DEP_MUTUARIO),
                            matricula = leitor.GetString(MATRICULA_DEP_MUTUARIO),
                            // Thiago Melo                             
                            //cpf = leitor.GetString(CPF_TIT_MUTUARIO),
                            cpf = leitor.GetString(CPF_DEP_MUTUARIO),
                            // Thiago Melo
                            inscricaoPrevidenciaria = leitor.GetInt64(INSCRICAOPREV_TIT_MUTUARIO),
                            situacao = leitor.GetString(SITUACAO_PARTICIPANTE_MUTUARIO),
                            tipo = leitor.GetString(TIPO_MUTUARIO),
                            id = leitor.GetInt32(ID_PESSOA_DEP),
                            idTitular = leitor.GetInt32(ID_PESSOA_TIT),
                            flginternoParticipante = leitor.GetString(SITPARTFUNDACAO), // xavier alterar a assinatura da regra 6170 conforme e-mail
                            idsitpart = leitor.GetInt32(IDSITPART),  // xavier alterar a assinatura conforme e-mail
                            plano = new PlanoPrevidenciario()
                            {
                                id = leitor.GetInt32(IDPLANOPREV_MUTUARIO),
                                situacao = leitor.GetString(SITUACAO_PLANO_MUTUARIO),
                                descricao = leitor.GetString(NOME_PLANOPREV_MUTUARIO),
                                IdPlanoOrigem = leitor.GetInt32(IDPLANPREVCONTAB_P)//William Moreira da Silva - SOL 217507 KTN 2047224
                            },
                            patrocinadora = new Patrocinadora()
                            {
                                id = leitor.GetInt32(ID_PATROCINADORA_MUTUARIO),
                                nome = leitor.GetString(NOME_PATRO_MUTUARIO)
                            }
                        };

                    }
                }
                // fim da busca dos pensionistas

            }

            return mutuario;
        }

        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário</param>
        /// <param name="idDadosBancario">Identificação dos dados Bancários</param>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public List<DadosBancarios> consultarContaBancaria(int idMutuario, int idDadosBancario, long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            bool buscarNumero = numeroContrato > 0;
            bool buscarMutuario = idMutuario > 0;
            bool buscarDadoBancario = idDadosBancario > 0;

            // Consulta

            query.Append("SELECT ");
            query.Append("   CTB.IDCBANCARIA, ");
            query.Append("   NVL(CTB.FLGCONTAPREF, 0) AS FLGCONTAPREF, ");
            query.Append("   CTB.TIPOCONTA, ");
            query.Append("   AGB.IDBANCO, ");
            query.Append("   BAN.NOME AS BANCO, ");
            query.Append("   AGB.NUMAGENCIA AS AGENCIA, ");
            query.Append("   CTB.CONTACORRENTE AS CONTA_CORRENTE, ");
            query.Append("   BAN.NOME || ' - ' || AGB.NUMAGENCIA || ' - ' || CTB.CONTACORRENTE AS DADOS, ");
            query.Append("   BCO.NUMBANCO ");
            query.Append("FROM ");
            query.Append("   PESSOA          BAN, ");
            query.Append("   AGENCIABANCARIA AGB, ");
            query.Append("   BANCO           BCO, ");

            if (buscarNumero)
                query.Append("   CONTRATOEMPTMO CON, ");

            query.Append("   CONTABANCARIA   CTB ");

            query.Append("WHERE CTB.IDAGENCIA = AGB.IDPESSOA ");
            query.Append("   AND AGB.IDBANCO   = BAN.IDPESSOA ");
            query.Append("   AND BAN.IDPESSOA  = BCO.IDPESSOA ");

            if (buscarMutuario)
                query.Append(" AND CTB.IDPESSOA = :IDMUTUARIO_P ");

            if (buscarDadoBancario)
                query.Append(" AND CTB.IDCBANCARIA = :IDDADOSBANCARIO_P  ");

            if (buscarNumero)
            {
                query.Append(" AND CON.IDCBANCARIA =  CTB.IDCBANCARIA ");
                query.Append(" AND CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            }

            query.Append("ORDER BY ");
            query.Append("   NVL(CTB.FLGCONTAPREF, 0) DESC ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            if (buscarMutuario)
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);

            if (buscarDadoBancario)
                bancoDeDados.AddInParameter(comando, "IDDADOSBANCARIO_P", DbType.Int32, idDadosBancario);

            if (buscarNumero)
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Executa a consulta
            List<DadosBancarios> dadosBancarios = null;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    DadosBancarios dado = new DadosBancarios()
                    {
                        id = leitor.GetInt32(IDCBANCARIA),
                        banco = leitor.GetInt32(IDBANCO),
                        agencia = leitor.GetString(NUMAGENCIA),
                        nomeBanco = leitor.GetString(NOMEBANCO),
                        numeroBanco = leitor.GetString(NUMEROBANCO),
                        contaCorrente = leitor.GetString(CONTACORRENTE),
                        dados = leitor.GetString(DADOS),
                        contraPreferencial = leitor.GetInt32(FLAGCONTAPREF)
                    };

                    if (dadosBancarios == null)
                        dadosBancarios = new List<DadosBancarios>();

                    dadosBancarios.Add(dado);
                }
            }

            return dadosBancarios;        
        }



        // Thiago Melo SOL 209377 Kintana 2021339
        /// <summary>
        /// Consulta nome do responsavel
        /// </summary>
        /// <param name="idPessoa">Identificação do titular</param>
        /// <param name="idBenef">Identificação do mutuário</param>                
        public string retornaNomeResponsavel(int idPessoa, int idBenef)
        {
            StringBuilder query = new StringBuilder();

            query.Append("SELECT ");
            query.Append("   BTP.IDRESPONNAOREC AS IDRESPONSAVEL, ");
            query.Append("   PES.NOME AS NOMERESPONSAVEL ");
            query.Append("  FROM ");
            query.Append("   BENEFBFCIARIO BFC, BFCIARIOTITPLAN BTP, PESSOA PES ");
            query.Append(" WHERE ");
            query.Append("       IDSITBENEFICIO      IN (1,2,7) ");
            query.Append("   AND BFC.IDTITULAR       = :IDPESSOA_P ");
            query.Append("   AND BFC.IDPESSOA        = :IDBENEF_P ");
            query.Append("   AND BFC.IDTITULAR       = BTP.IDTITULAR ");
            query.Append("   AND BFC.IDPESSOA        = BTP.IDPESSOA ");
            query.Append("   AND BFC.IDBENEFICIO     = BTP.IDBENEFICIO ");
            query.Append("   AND BTP.IDRESPONNAOREC  = PES.IDPESSOA ");
            query.Append("   AND BFC.IDPLANOPREV     = BTP.IDPLANOPREV ");
            query.Append("   AND ( DATAFIMRECEB IS NULL OR DATAFIMRECEB > SYSDATE ) ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int64, idPessoa);
            bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int64, idBenef);

            string nomeresponsavel = "";
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    nomeresponsavel = leitor.GetString(1);
                }
            }

            return nomeresponsavel;
        }
        // Thiago Melo SOL 209377 Kintana 2021339


        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancaria(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            bool buscarNumero = numeroContrato > 0;

            // Consulta
            query.Append("SELECT ");
            query.Append("   CTB.IDCBANCARIA, ");
            query.Append("   NVL(CTB.FLGCONTAPREF, 0) AS FLGCONTAPREF, ");
            query.Append("   CTB.TIPOCONTA, ");
            query.Append("   AGB.IDBANCO, ");
            query.Append("   BAN.NOME AS BANCO, ");
            query.Append("   AGB.NUMAGENCIA AS AGENCIA, ");
            query.Append("   CTB.CONTACORRENTE AS CONTA_CORRENTE, ");
            query.Append("   BAN.NOME || ' - ' || AGB.NUMAGENCIA || ' - ' || CTB.CONTACORRENTE AS DADOS ");
            query.Append("FROM ");
            query.Append("   PESSOA          BAN, ");
            query.Append("   AGENCIABANCARIA AGB, ");

            if (buscarNumero)
                query.Append("   CONTRATOEMPTMO CON, ");

            query.Append("   CONTABANCARIA   CTB ");

            query.Append("WHERE CTB.IDAGENCIA = AGB.IDPESSOA ");
            query.Append("   AND AGB.IDBANCO   = BAN.IDPESSOA ");

            if (buscarNumero)
            {
                query.Append(" AND CON.IDCBANCARIA =  CTB.IDCBANCARIA ");
                query.Append(" AND CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            }

            query.Append(" ORDER BY ");
            query.Append("   NVL(CTB.FLGCONTAPREF, 0) DESC ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            if (buscarNumero)
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Executa a consulta
            DadosBancarios dadosBancarios = null;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    dadosBancarios = new DadosBancarios()
                    {
                        id = leitor.GetInt32(IDCBANCARIA),
                        banco = leitor.GetInt32(IDBANCO),
                        agencia = leitor.GetString(NUMAGENCIA),
                        nomeBanco = leitor.GetString(NOMEBANCO),
                        contaCorrente = leitor.GetString(CONTACORRENTE),
                        dados = leitor.GetString(DADOS),
                        contraPreferencial = leitor.GetInt32(FLAGCONTAPREF)
                    };

                }
            }

            return dadosBancarios;
        }

        //BRUNO AZEVEDO - SOL 164198
        /// <summary>
        /// Consulta se o mutuário está bloqueado por plano ou não.
        /// </summary>
        public bool consultarBloqueioPlanoPrevidenciario(int idplanoprev, string idplanocontabil)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT sxp.idplanoprev, ");
            query.Append("        sxp.idplanoprevcontabil, ");
            query.Append("        sxp.dtinicio, ");
            query.Append("        sxp.dtfim, ");
            query.Append("        sxp.flgprazoindeterminado "); 
            query.Append("   FROM suspxplanoprevemptmo sxp ");
            query.Append("  WHERE sxp.idplanoprev = :IDPLANOPREV_P ");
            query.Append("    AND sxp.dtinicio <= TRUNC(SYSDATE) ");
            query.Append("    AND (sxp.dtfim >= TRUNC(SYSDATE) OR sxp.dtfim IS NULL)");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDPLANOPREV_P", DbType.Int64, idplanoprev);

            // Executa a consulta
            bool bBloqueado = false;
            string sIdPlanosContabeis = "";
            string sIdPlanoPrev = "";
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                //Trouxe registro de bloqueio, verificar excessão contábil.
                if (leitor.Read())
                {
                    sIdPlanoPrev = leitor.GetString(0);
                    sIdPlanosContabeis = leitor.GetString(1);

                    if (sIdPlanoPrev.Contains(idplanoprev.ToString()) && !sIdPlanosContabeis.Contains(idplanocontabil))
                    {
                        bBloqueado = true;
                    }
                    /*if (sIdPlanosContabeis.Contains(idplanocontabil)) 
                    {
                        bBloqueado = false;
                    }*/
                }
            }

            return bBloqueado;
        }
        //BRUNO AZEVEDO - SOL 164198

        //BRUNO AZEVEDO - SOL 167098
        /// <summary>
        /// Consulta o código do banco da conta bancária do mutuário.
        /// </summary>
        /// <param name="idContaBancaria">Código da conta bancária.</param>
        public int consultarCodigoBanco(int idContaBancaria)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(@"SELECT ab.idbanco
            FROM contabancaria cb 
                 JOIN agenciabancaria ab ON ab.idpessoa = cb.idagencia
            WHERE cb.idcbancaria = :IDCONTA_P");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDCONTA_P", DbType.Int64, idContaBancaria);

            // Executa a consulta
            int iIdConta = 0; 
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    iIdConta = leitor.GetInt32(0);
                }
            }

            return iIdConta;
        }
        //BRUNO AZEVEDO - SOL 167098

        /// <summary>
        /// Pesquisa as Contas da Caixa no sistema.
        /// </summary>
        /// <returns>Uma lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ContaCaixa"/> com os dados encontrados.</returns>
        public List<ContaCaixa> listarContaCaixa()
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT PF.CODPORTFORMA, PF.DESCRICAO, PF.RECPAG, PAR.PORTFORMAPAGTO ");
            query.Append("  FROM PORTADORFORMA PF, PARAMEMPTMO PAR ");
            query.Append(" WHERE PF.CODPORTFORMA = PAR.PORTFORMAPAGTO(+) ");
            query.Append("   AND PF.IDPESSOA = 1 ");
            query.Append("   AND NVL(PF.FLGATIVO, 'S') = 'S' ");
            query.Append("   AND (NOT EXISTS ");
            query.Append("        (SELECT * ");
            query.Append("           FROM PORTFORMAXMODULO PFM, PORTADORFORMA PFO ");
            query.Append("          WHERE PFM.CODPORTFORMA = PFO.CODPORTFORMA) OR EXISTS ");
            query.Append("        (SELECT * FROM PORTFORMAXMODULO WHERE CODPORTFORMA = PF.CODPORTFORMA)) ");
            query.Append(" ORDER BY PF.DESCRICAO, PF.RECPAG ");


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            List<ContaCaixa> listaContaCaixa = new List<ContaCaixa>();
            ContaCaixa contaCaixa = null;
            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    contaCaixa = new ContaCaixa
                    {
                        id = leitor.GetInt32(IDPORTOFORMA_CONTACAIXA),
                        descricao = leitor.GetString(DESCRICAO_CONTACAIXA),
                        recPagamento = leitor.GetString(RECPAG_CONTACAIXA),
                        portFormaPagamento = leitor.obterValorInteiro(PORTFORMPAGTO)
                    };
                    listaContaCaixa.Add(contaCaixa);
                }
            }
            return listaContaCaixa;
        }

        /// <summary>
        /// Lista tipo de recurso.
        /// </summary>
        public List<TipoRecurso> listarTipoRecurso()
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT IDTIPORECURSO, NOME ");
            query.Append(" FROM TIPORECURSO ");
            query.Append(" WHERE IDMODULO = 15 OR IDMODULO IS NULL ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            List<TipoRecurso> listaTipoRecurso = new List<TipoRecurso>();

            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    TipoRecurso tipo = new TipoRecurso()
                    {
                        id = leitor.GetInt32(IDTIPORECURSO),
                        descricao = leitor.GetString(NOME_TIPORECURSO)
                    };

                    listaTipoRecurso.Add(tipo);
                }
            }

            return listaTipoRecurso;
        }

        /// <summary>
        /// Verifica se o mutuário tem uma assinatura.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <param name="idTipoContrato">Identificador do tipo de contraro para filtro.</param>
        /// <returns>Dados da assinatura para validação.</returns>        
        public Assinatura verificarAssinatura(int idTitular, int idMutuario, int idTipoContrato)// Thiago Melo SOL 204452 KTN 1976411
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT ");
            query.Append("   ACP.IDPESSOA, ACP.IDBENEF, ");
            query.Append("   ACP.IDCONTRATOPADRAO, ");
            query.Append("   ACP.ACPDATAASSINAT, ");
            query.Append("   CTP.CTPDATAINICIO, ");
            query.Append("   SIT.FLGINTERNO, ");
            query.Append("   PPP.IDPLANOPREV, ");
            query.Append("   NVL(ACP.FLGBLOQUEIO, 0) AS FLGBLOQUEIO, ");
            query.Append("   NVL(CTP.CTPOBRIGATORIO, 0) AS CTPOBRIGATORIO ");
            query.Append("FROM ");
            query.Append("   ASSINCONTRPADRAO     ACP, ");
            query.Append("   CONTRATOPADRAO       CTP, ");
            query.Append("   CONTRPADRXTIPOCONTR  CPT, ");
            query.Append("   PARTPREVPLAN         PPP, ");
            query.Append("   TIPOCONTREMPTMO      TCE, ");
            query.Append("   SITPART              SIT, ");
            query.Append("   DEPENTIT             DEP ");
            query.Append("WHERE ");
            // Thiago Melo SOL 204452 KTN 1976411 INI
            //// SOL 204585 KTN 1977699 Otacilio ** Inicio **
            ////query.Append("  ACP.IDPESSOA           = :IDTITULAR_P  ");
            //query.Append("   DEP.IDPESSOA           = :IDTITULAR_P  ");
            //// SOL 204585 KTN 1977699 Otacilio ** Fim **
            // Thiago Melo SOL 204452 KTN 1976411 FIM


            // Thiago Melo SOL 204452 KTN 1976411 INI
            query.Append("   ACP.IDPESSOA               = :IDTITULAR_P");
            query.Append("   AND ACP.IDBENEF            = :IDBENEF_P");
            // Thiago Melo SOL 204452 KTN 1976411 FIM
            query.Append("   AND CPT.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ");
            query.Append("   AND ACP.IDCONTRATOPADRAO   = CTP.IDCONTRATOPADRAO ");
            query.Append("   AND CTP.IDCONTRATOPADRAO   = CPT.IDCONTRATOPADRAO ");
            query.Append("   AND TCE.IDTIPOCONTREMPTMO  = CPT.IDTIPOCONTREMPTMO(+) ");
            query.Append("   AND ACP.IDPESSOA           = DEP.IDTITULAR ");
            query.Append("   AND ACP.IDBENEF            = DEP.IDPESSOA ");
            query.Append("   AND PPP.IDSITPART          = SIT.IDSITPART ");
            query.Append("   AND ACP.IDPESSOA           = PPP.IDPESSOA ");
            query.Append("   AND PPP.FLGDESATIVADO      = 0 ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            Assinatura dadosAssinatura = null;
          
            // Thiago Melo SOL 204452 KTN 1976411
            bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, idTitular);
            bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int32, idMutuario);
            // Thiago Melo SOL 204452 KTN 1976411
            bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, idTipoContrato);

            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    dadosAssinatura = new Assinatura()
                    {
                        dataInicio = leitor.obterValorData(CTPDATAINICIO_ASSINATURA),
                        flagBloqueio = leitor.GetInt32(FLGBLOQUEIO_ASSINATURA)
                    };
                }
            }

            return dadosAssinatura;
        }

        /// <summary>
        ///  Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.OutrasDividas"/> com a(s) Outra(s) Divida(s) encontrada(s).</returns>
        public List<OutrasDividas> consultarOutrasDividas(Int32 idMutuario)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            //William Moreira da Silva - SOL 204977 KTN 1982395 - Madança na QUERY
            /*query.Append(" SELECT 'Previdenciária' AS TIPO, ");
            query.Append(" DECODE(SUBSTR(MESREFERENCIA,6,12),'01', 'Janeiro/'  || SUBSTR(MESREFERENCIA,1,4), ");
            query.Append(" '02', 'Fevereiro/'|| SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '03', 'Março/'    || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '04', 'Abril/'    || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '05', 'Maio/'     || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '06', 'Junho/'    || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '07', 'Julho/'    || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '08', 'Agosto/'   || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '09', 'Setembro/' || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '10', 'Outubro/'  || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '11', 'Novembro/' || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '12', 'Dezembro/' || SUBSTR(MESREFERENCIA,1,4),               ");
            query.Append(" '13','Contrib. sobre 13º Sal/' || SUBSTR(MESREFERENCIA,1,4),  ");
            query.Append(" SUBSTR(MESREFERENCIA,6,12) || '/' || SUBSTR(MESREFERENCIA,1,4)) AS MESREFERENCIA, ");
            query.Append(" DECODE(SUBSTR(MESCOBRANCA,6,12),'01', 'Janeiro/'  || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '02', 'Fevereiro/'|| SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '03', 'Março/'    || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '04', 'Abril/'    || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '05', 'Maio/'     || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '06', 'Junho/'    || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '07', 'Julho/'    || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '08', 'Agosto/'   || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '09', 'Setembro/' || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '10', 'Outubro/'  || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '11', 'Novembro/' || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '12', 'Dezembro/' || SUBSTR(MESCOBRANCA,1,4),  ");
            query.Append(" '13','Contrib. sobre 13º Sal/' || SUBSTR(MESCOBRANCA,1,4), ");
            query.Append("       SUBSTR(MESCOBRANCA,6,12) || '/' || SUBSTR(MESCOBRANCA,1,4)) AS MESCOBRANCA, ");
            query.Append(" DATAPREVISAORECE,   0 AS NUMPARCELA, ");
            query.Append(" SUM(DECODE(FLGDEVOLUCAO,1,-VALORESPERADO,VALORESPERADO)) AS VALORCALCULADO ");
            query.Append(" FROM    HSTCONTRIBPREV ");
            query.Append("WHERE ");
            query.Append("IDPESSOA = :IDMUTUARIO_P  ");
            //query.Append("IDPESSOA =  390000 ");           
            query.Append(" AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0) ");
            query.Append("AND DATAPREVISAORECE < TRUNC(SYSDATE) ");
            query.Append(" GROUP BY IDPESSOA,  MESREFERENCIA, MESCOBRANCA, DATAPREVISAORECE    ");*/


            query.Append(" SELECT 'Previdenciária' AS TIPO, ");
            query.Append(" DECODE(SUBSTR(MESREFERENCIA, 6, 12), ");
            query.Append("   '01', 'Janeiro/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '02', 'Fevereiro/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '03', 'Março/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '04', 'Abril/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '05', 'Maio/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '06', 'Junho/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '07', 'Julho/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '08', 'Agosto/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '09', 'Setembro/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '10', 'Outubro/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '11', 'Novembro/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '12', 'Dezembro/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append("   '13', 'Contrib. sobre 13º Sal/' || SUBSTR(MESREFERENCIA, 1, 4), ");
            query.Append(" SUBSTR(MESREFERENCIA, 6, 12) || '/' || ");
            query.Append(" SUBSTR(MESREFERENCIA, 1, 4)) AS MESREFERENCIA, ");
            query.Append(" DECODE(SUBSTR(MESCOBRANCA, 6, 12), ");
            query.Append("   '01', 'Janeiro/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '02', 'Fevereiro/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '03', 'Março/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '04', 'Abril/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '05', 'Maio/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '06', 'Junho/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '07', 'Julho/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '08', 'Agosto/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '09', 'Setembro/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '10', 'Outubro/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '11', 'Novembro/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '12', 'Dezembro/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   '13', 'Contrib. sobre 13º Sal/' || SUBSTR(MESCOBRANCA, 1, 4), ");
            query.Append("   SUBSTR(MESCOBRANCA, 6, 12) || '/' || SUBSTR(MESCOBRANCA, 1, 4)) AS MESCOBRANCA, ");
            query.Append("   DATAPREVISAORECE, ");
            query.Append("   0 AS NUMPARCELA, ");
            query.Append("   round(SUM(DECODE(FLGDEVOLUCAO, 1, -VALORESPERADO, VALORESPERADO)),2) AS VALORCALCULADO ");
            query.Append("    FROM HSTCONTRIBPREV ");
            query.Append("    WHERE IDPESSOA = :IDMUTUARIO_P ");
            query.Append("        AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0) ");
            query.Append("       AND DATAPREVISAORECE < TRUNC(SYSDATE) ");
            query.Append("     GROUP BY IDPESSOA, MESREFERENCIA, MESCOBRANCA, DATAPREVISAORECE ");
            //William Moreira da Silva - SOL 204977 KTN 1982395

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            //if (parametros != null && parametros.paginacao != null)
            //    comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            //else
            comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            List<OutrasDividas> listaOutrasDividas = new List<OutrasDividas>();

            bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);

            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    OutrasDividas outrasDividas = new OutrasDividas()
                    {
                        tipo = leitor.GetString(0), // TIPO
                        mesReferencia = leitor.GetString(1), // MESREFERENCIA
                        mesCobranca = leitor.GetString(2), // MESCOBRANCA   
                        dataPrevista = leitor.GetDateTime(3), //DATAPREVISTA
                        parcela = leitor.GetInt32(4), //PARCELA
                        valorCalculado = leitor.GetDouble(5), //VALORCALCULADO                        
                    };
                    listaOutrasDividas.Add(outrasDividas);
                }
            }

            return listaOutrasDividas;
        }


        /// <summary>
        ///  Verifica se mutuário possui Avalistas.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Identificador do mutuário para filtro.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Avalistas"/> Avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarAvalistas(long idInscricaoEmptmo)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT P.NOME,  A.RENDACOMP,   A.MARGEMCONSIG, A.IDAVALISTA ");
            query.Append(" FROM   CONTRATOXAVALISTA CA, PESSOA P, AVALISTA A ");
            query.Append(" WHERE  A.IDAVALISTA = P.IDPESSOA ");
            query.Append(" AND    CA.IDAVALISTA = A.IDAVALISTA ");
            query.Append(" AND    CA.IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            List<Avalistas> listaAvalistas = new List<Avalistas>();

            bancoDeDados.AddInParameter(comando, "IDINSCRICAOEMPTMO_P", DbType.Int64, idInscricaoEmptmo);

            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Avalistas Avalistas = new Avalistas()
                    {
                        nome = leitor.GetString(0), // Nome
                        renda = leitor.GetDouble(1), // Renda
                        margem = leitor.GetDouble(2), // Margem
                        id = leitor.GetInt32(3), // idAvalista

                    };
                    listaAvalistas.Add(Avalistas);
                }
            }

            return listaAvalistas;
        }

        /// <summary>
        /// Consulta contratos em aberto do mutuário
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) Contrato(s) encontrado(s).</returns>
        public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoemprestimo, int idTipoContrato, DateTime dataCredito)// Thiago Melo SOL 206149
        {

            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT DISTINCT ");
            query.Append("CON.IDCONTRATOEMPTMO    AS CONTRATO, ");
            query.Append("TCE.IDTIPOCONTREMPTMO   AS ID_TIPO_CONTRATO, ");
            query.Append("TCE.TCEDESCRICAO        AS TIPO_CONTRATO, ");
            query.Append("CON.VLRCONTRATO         AS VLR_CONTRATO, ");
            query.Append("CON.DATACREDITO         AS DATA_CREDITO, ");
            query.Append("CON.NUMPARCELAS         AS PRAZO, ");
            query.Append("CON.VLRPARCELA          AS PARCELA, ");
            query.Append("SLD.HMESALDODEV         AS SALDO_DEV, ");
            query.Append("NVL(VAL.VLRTOTAL, 0)    AS VLREMABERTO, ");
            query.Append("NVL(PAR.NUMPARCPAGAS, 0)AS NUMPARCPAGAS, ");
            query.Append("ATU.ULT_PARC            AS ULT_PARCELA, ");
            query.Append("DECODE(VLP.HMEVLRPREVISTO,0,CON.VLRPARCELA,NVL(VLP.HMEVLRPREVISTO,CON.VLRPARCELA)) AS VLRULTPARCELA, ");
            query.Append("VAL.DATA_VENCIMENTO, ");
            query.Append("CON.DATAFIMSUSP, ");
            query.Append("CON.IDTIPOSUSPEMPTMO,  ");
            query.Append("CON.FLGPERDAEFETIVA ");    
            query.Append("FROM ");
            query.Append("CONTRATOEMPTMO  CON, ");
            query.Append("TIPOCONTREMPTMO TCE, ");
            query.Append("( ");
            query.Append("SELECT ");
            query.Append("H.IDCONTRATOEMPTMO, MAX(H.HMEPARCELA) AS ULT_PARC ");
            query.Append("FROM ");
            query.Append("HISTMOVEMPTMO H, ");
            query.Append("CONTRATOEMPTMO C ");
            query.Append("WHERE ");
            query.Append("( C.IDBENEF          =  :idMutuario ) ");
            query.Append("AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) ");
            query.Append("GROUP BY ");
            query.Append("H.IDCONTRATOEMPTMO ");
            query.Append(") ATU, ");
            query.Append("( ");
            query.Append("SELECT ");
            query.Append("COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS, ");
            query.Append("C.IDCONTRATOEMPTMO ");
            query.Append("FROM ");
            query.Append("CONTRATOEMPTMO C, ");
            query.Append("( ");
            query.Append("SELECT ");
            query.Append("H.IDCONTRATOEMPTMO, ");
            query.Append("H.HMEPARCELA, ");
            query.Append("SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL ");
            query.Append("FROM ");
            query.Append("HISTMOVEMPTMO H, ");
            query.Append("CONTRATOEMPTMO C ");
            query.Append("WHERE ");
            query.Append("( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 ) ");
            query.Append("AND ( C.IDBENEF        =  :idMutuario ) ");
            query.Append("AND ( C.FLGSITUACAO      NOT IN ('C', 'Q') ) ");
            query.Append("AND ( H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO = 0 ) ");
            query.Append("AND ( H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO = 0 ) ");
            query.Append("AND ( H.FLGABONADO       IS NULL OR H.FLGABONADO = 0 ) ");
            query.Append("AND ( H.HMETIPOMOV       = 1 ) ");
            query.Append("AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) ");
            query.Append("GROUP BY ");
            query.Append("H.IDCONTRATOEMPTMO, H.HMEPARCELA ");
            query.Append("HAVING ");
            query.Append("( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) <= 0 ) ");
            query.Append("AND ( HMEPARCELA <> 0 ) ");
            query.Append(") PAG ");
            query.Append("WHERE ");
            query.Append("( C.IDBENEF            =  :idMutuario ) ");
            query.Append("AND ( C.FLGSITUACAO        NOT IN ('C', 'Q') ) ");
            query.Append("AND ( C.IDCONTRATOEMPTMO   = PAG.IDCONTRATOEMPTMO(+) ) ");
            query.Append("GROUP BY ");
            query.Append("C.IDCONTRATOEMPTMO ");
            query.Append(") PAR, ");
            query.Append("( ");
            query.Append("SELECT ");
            query.Append("H.IDHISTMOVEMPTMO, H.HMESALDODEV, H.IDCONTRATOEMPTMO ");
            query.Append("FROM ");
            query.Append("HISTMOVEMPTMO H, ");
            query.Append("( ");
            query.Append("SELECT ");
            query.Append("MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO ");
            query.Append("FROM ");
            query.Append("HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, ");
            query.Append("ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE ");
            query.Append("WHERE CON.IDBENEF  =  :idMutuario ");
            query.Append("AND   HME.HMEDATAATUALIZA   <= :dataCredito ");
            query.Append("AND   ITC.ITCTRATASALDODEV  <> 0 ");
            query.Append("AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) ");
            query.Append("AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ");
            query.Append("AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ");
            query.Append("AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ");
            query.Append("AND TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ");
            query.Append("AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ");
            query.Append("GROUP BY ");
            query.Append("HME.IDCONTRATOEMPTMO ");
            query.Append(") ULT ");
            query.Append("WHERE ");
            query.Append("( H.HMEDATAATUALIZA <= :dataCredito ) ");
            query.Append("AND     ( H.IDHISTMOVEMPTMO = ULT.IDHISTMOVEMPTMO ) ");
            query.Append(") SLD, ");
            query.Append("( ");
            query.Append("SELECT ");
            query.Append("SUM(H.HMEVLRPREVISTO) AS VLRTOTAL, MIN(H.HMEDATAVENCTO) AS DATA_VENCIMENTO, H.IDCONTRATOEMPTMO ");
            query.Append("FROM ");
            query.Append("HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOSUSPEMPTMO TSE ");
            query.Append("WHERE ");
            query.Append("( C.IDBENEF               =  :idMutuario) ");
            query.Append("AND ( H.HMEDATAVENCTO         < :dataCredito ) ");
            query.Append("AND ( h.hmedataprevista + 7   < :dataCredito ) ");
            query.Append("AND ( H.HMETIPOMOV            NOT IN (0, 5, 8) ) ");
            query.Append("AND ( H.HMEDATAEFETIVA        IS NULL) ");
            query.Append("AND ( H.HMEVLREFETIVO         IS NULL) ");
            query.Append("AND ( (H.HMECENTRALIZA        = 1) OR (H.HMEDESTACADO   = 1) ) ");
            query.Append("AND ( (H.FLGQUITADO           IS NULL) OR (H.FLGQUITADO = 0) ) ");
            query.Append("AND ( (H.FLGABONADO           IS NULL) OR (H.FLGABONADO = 0) ) ");
            query.Append("AND ( (H.FLGESTORNADO         IS NULL) OR (H.FLGESTORNADO = 0) ) ");
            query.Append("AND ( H.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO ) ");
            query.Append("AND H.IDTIPOSUSPEMPTMO        = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append("AND ( ");
            query.Append("NVL(H.FLGSUSPENSAO, 0) = 0 OR ");
            query.Append("(NVL(H.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) ");
            query.Append(") ");
            query.Append("GROUP BY ");
            query.Append("H.IDCONTRATOEMPTMO ");
            query.Append(") VAL, ");
            query.Append("( SELECT ");
            query.Append("H.IDCONTRATOEMPTMO, ABS(NVL(H.HMEVLRPREVISTO,0)) AS HMEVLRPREVISTO ");
            query.Append("FROM ");
            query.Append("HISTMOVEMPTMO H, CONTRATOEMPTMO C ");
            query.Append("WHERE ");
            query.Append("( C.IDBENEF            =  :idMutuario ) ");
            query.Append("AND ( H.HMETIPOMOV         = 1 ) ");
            query.Append("AND ( H.HMEORIGEM          = 1 ) ");
            query.Append("AND ( H.HMECENTRALIZA      = 1 ) ");
            query.Append("AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0) ) ");
            query.Append("AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) ");
            query.Append("AND H.HMEPARCELA = (SELECT MAX(HME.HMEPARCELA) ");
            query.Append("FROM ");
            query.Append("HISTMOVEMPTMO HME, CONTRATOEMPTMO CON ");
            query.Append("WHERE ");
            query.Append("( CON.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) ");
            query.Append("AND ( HME.HMETIPOMOV         = 1 ) ");
            query.Append("AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) ");
            query.Append("AND ( HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )  ");
            query.Append(") ");
            query.Append(") VLP ");
            query.Append("WHERE ");
            query.Append("( CON.IDBENEF               =  :idMutuario ) ");
            query.Append("AND (CON.IDPESSOA           =  :idPessoa) "); // Thiago Melo SOL 206149
            query.Append("AND ( TCE.IDTIPOEMPTMO        = :idTipoemprestimo ) ");
            query.Append("AND ( CON.FLGSITUACAO         NOT IN ('C', 'Q') ) ");
            query.Append("AND ( VAL.VLRTOTAL > 0        OR SLD.HMESALDODEV > 0 ) ");
            query.Append("AND ( 1 IS NULL OR CON.IDTIPOCONTREMPTMO IN ");
            query.Append("( SELECT IDTIPOCONTRQUIT FROM TIPOCONTRXQUIT WHERE IDTIPOCONTREMPTMO = :idTipoContrato )) ");
            query.Append("AND ( CON.IDCONTRATOEMPTMO    = PAR.IDCONTRATOEMPTMO(+) ) ");
            query.Append("AND ( CON.IDCONTRATOEMPTMO    = SLD.IDCONTRATOEMPTMO(+) ) ");
            query.Append("AND ( CON.IDCONTRATOEMPTMO    = VAL.IDCONTRATOEMPTMO(+) ) ");
            query.Append("AND ( CON.IDCONTRATOEMPTMO    = ATU.IDCONTRATOEMPTMO(+) ) ");
            query.Append("AND ( CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO ) ");
            query.Append("AND ( CON.IDCONTRATOEMPTMO    = VLP.IDCONTRATOEMPTMO(+) ) ");
            query.Append("ORDER BY CON.IDCONTRATOEMPTMO ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            List<Contrato> contratos = new List<Contrato>();

            bancoDeDados.AddInParameter(comando, "idMutuario", DbType.Int32, idMutuario);
            bancoDeDados.AddInParameter(comando, "idPessoa", DbType.Int32, idTitular);// Thiago Melo SOL 206149
            bancoDeDados.AddInParameter(comando, "idTipoContrato", DbType.Int32, idTipoContrato);
            bancoDeDados.AddInParameter(comando, "idTipoemprestimo", DbType.Int32, idTipoemprestimo);
            bancoDeDados.AddInParameter(comando, "dataCredito", DbType.DateTime, dataCredito);

            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Contrato contrato = new Contrato();
                    contrato.numero = leitor.GetInt64(0);
                    contrato.tipo = new TipoContrato()
                    {
                        id = leitor.GetInt32(1),
                        descricao = leitor.GetString(2)
                    };
                    contrato.valorContrato = leitor.obterValorDouble(3);
                    contrato.dataCredito = leitor.obterValorData(4);
                    contrato.totalParcelas = leitor.GetInt32(5);
                    contrato.valorParcela = leitor.obterValorDouble(6);
                    contrato.saldoDevedor = leitor.GetDouble(7);
                    contrato.valorEmAberto = leitor.GetDouble(8);
                    contrato.parcelasPagas = leitor.GetInt32(9);
                    contrato.numeroParcelasAtrasadas = leitor.GetInt32(10);
                    contrato.valorUltimaParcela = leitor.GetDouble(11);
                    contrato.dataVencimento = leitor.GetDateTime(12);
                    contrato.dataFimSuspensao = leitor.obterValorData(13);
                    contrato.suspensao = new Suspensao()
                    {
                        tipo = new TipoSuspensao { id = leitor.obterValorInteiro(14) == null ? 0 : leitor.GetInt32(14) }
                    };
                    //Sadi Freire Sol213592_Kintana2040335
                    if (leitor.GetInt32(15) == 1)
                    {
                        contrato.efetiva = true;
                    }
                    else
                    {
                        contrato.efetiva = false;
                    }

                  // contrato.efetiva = leitor.GetBoolean(15);
                   
                    contrato.mutuario = new Mutuario()
                    {
                        id = idMutuario
                    };

                    contratos.Add(contrato);
                }
            }

            return contratos;

        }

        /// <summary>
        /// Verifica a atualização diaria do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário.</param>
        /// <param name="dataCredito">Data de Crédito.</param>
        /// <returns>Caso existe atualização.</returns>
        public bool verificarAtualizacaoDiaria(int idMutuario, DateTime dataCredito)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT COUNT(HME.HMEDATAPREVISTA) AS QTDE ");
            query.Append("  FROM HISTMOVEMPTMO HME, CONTRATOEMPTMO CON ");
            query.Append(" WHERE HME.HMETIPOMOV = 5 ");
            query.Append("   AND CON.IDPESSOA = :IDMUTUARIO_P ");
            query.Append("   AND HME.HMEDATAPREVISTA = :DATAREFERENCIA_P ");
            query.Append("   AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append("   AND CON.FLGSITUACAO NOT IN ('C', 'Q') ");
            query.Append("   AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ");
            query.Append(" GROUP BY CON.IDCONTRATOEMPTMO ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            int quantidade = 0;

            bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);//Sadi SOL213592_Kintana2040335
            bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataCredito);

            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    quantidade = leitor.GetInt32(0);
                }
            }

            return (quantidade != 0);
        }

        /// <summary>
        /// Consultar forma de pagamento.
        /// </summary>
        /// <param name="codigo">Código da forma de pagamento.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.FormaPagamento"/> com a(s) Forma(s) de Pagamento encontrada(s).</returns>
        public List<FormaPagamento> consultarFormaPagamento(string codigo)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT FRP.CODFORMA, ");
            query.Append("        PAR.CODFORMAPAGTO, ");
            query.Append("        FRP.RECPAG, ");
            query.Append("        FRP.DESCRICAO, ");
            query.Append("        FRP.IDPESSOA ");
            query.Append("   FROM FORMARECPAG FRP, PARAMEMPTMO PAR ");
            query.Append("  WHERE FRP.CODFORMA = PAR.CODFORMAPAGTO(+) ");
            query.Append("    AND (FRP.IDPESSOA = 1) ");
            query.Append("    AND (FRP.RECPAG = :CODIGO_P) ");
            query.Append("  ORDER BY FRP.DESCRICAO ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "CODIGO_P", DbType.String, codigo);

            // Executa a consulta
            List<FormaPagamento> listaFormaPagamenteo = new List<FormaPagamento>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    FormaPagamento formaPagamento = new FormaPagamento()
                    {
                        id = leitor.GetInt32(0), // CODFORMA
                        idForma = leitor.GetInt32(1), // CODFORMPAGTO
                        recPag = leitor.GetString(2), // RECPAG
                        descricao = leitor.GetString(3), // DESCRICAO
                        idPessoa = leitor.GetInt32(4) // IDPESSOA
                    };

                    listaFormaPagamenteo.Add(formaPagamento);
                }
            }

            return listaFormaPagamenteo;
        }

        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificador do Mutuário</param>
        public List<ItemContrato> obterItensEmAberto(long idContratoEmptmo)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT ");
            query.Append("    CON.IDBENEF, ");
            query.Append("    DECODE(HME.HMETIPOMOV, ");
            query.Append("          0, 'Concessão/Renovação', ");
            query.Append("          1, 'Prestação ', ");
            query.Append("          2, 'Amortização/Refinanciamento', ");
            query.Append("          3, 'Quitação', ");
            query.Append("          4, 'Atualização de Débito', ");
            query.Append("          5, 'Atualização de Saldo (Diária)' , ");
            query.Append("          6, 'Importação/Migração', ");
            query.Append("          7, 'Ajustes (Cobrança/Devolução)', ");
            query.Append("          8, 'Ajustes (Saldo Devedor)' ");
            query.Append("         ) AS EVENTO, ");
            query.Append("   HME.HMEMESCOMPETENCIA, ");
            query.Append("   HME.HMEANOCOMPETENCIA, ");
            query.Append("   HME.HMEPARCELA, ");
            query.Append("   HME.HMESEQCOBRANCA, ");
            query.Append("   ITE.ITEDESCRICAO, ");
            query.Append("   HME.HMEDATAPREVISTA, ");
            query.Append("   HME.HMEDATAVENCTO, ");
            query.Append("   HME.HMEVLRPREVISTO, ");
            query.Append("   HME.HMETXJUROS, ");
            query.Append("   HME.HMESALDODEV, ");
            query.Append("   HME.IDCONTRATOEMPTMO, ");
            query.Append("   HME.HMETIPOMOV ");
            query.Append(" FROM ");
            query.Append("   HISTMOVEMPTMO  HME, ");
            query.Append("   TIPOSUSPEMPTMO TSE, ");
            query.Append("   ITEMEMPTMO     ITE, ");
            query.Append("   CONTRATOEMPTMO CON ");
            //query.Append(" WHERE CON.IDBENEF = :IDMUTUARIO_P ");
            query.Append(" WHERE CON.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P "); //NILTON - SOL201249 KTN1945208 - 22/02/2013
            query.Append("   AND   ( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 ) ");
            query.Append("   AND    HME.HMETIPOMOV     IN  (1, 2, 3, 4, 7) ");
            query.Append("   AND HME.FLGBAIXADO            = 0 ");
            query.Append("   AND HME.HMEVLREFETIVO    IS NULL ");
            query.Append("   AND HME.HMEDATAEFETIVA   IS NULL ");
            query.Append("   AND NVL(HME.FLGQUITADO, 0)    = 0 ");
            query.Append("   AND NVL(HME.FLGABONADO, 0)    = 0 ");
            query.Append("   AND NVL(HME.FLGESTORNADO, 0)  = 0 ");
            query.Append("   AND ( NVL(HME.FLGSUSPENSAO, 0)  = 0  ");
            query.Append("            OR(NVL(HME.FLGSUSPENSAO, 0) <> 0  ");
            query.Append("            AND NVL(TSE.FLGEMABERTO, 0) = 1) ) ");
            query.Append("   AND HME.IDITEMEMPTMO          = ITE.IDITEMEMPTMO ");
            query.Append("   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append("   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO ");
            query.Append(" ORDER BY HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContratoEmptmo);

            // Executa a consulta
            List<ItemContrato> itens = new List<ItemContrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    ItemContrato item = new ItemContrato();
                    item.tipoEvento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(leitor.GetInt32(HMETIPOMOV_ITENSABERTOS));
                    item.tipoEvento.descricao = leitor.GetString(EVENTO_ITENSABERTOS);
                    item.competencia = new DateTime(leitor.GetInt32(HMEANOCOMPETENCIA_ITENSABERTOS), leitor.GetInt32(HMEMESCOMPETENCIA_ITENSABERTOS), 1);
                    item.parcela = leitor.GetInt32(HMEPARCELA_ITENSABERTOS);
                    item.sequencia = leitor.GetInt32(HMESEQCOBRANCA_ITENSABERTOS);
                    item.descricao = leitor.GetString(ITEDESCRICAO_ITENSABERTOS);
                    item.dataPrevista = leitor.GetDateTime(HMEDATAPREVISTA_ITENSABERTOS);
                    item.dataVencimento = leitor.GetDateTime(HMEDATAVENCTO_ITENSABERTOS);
                    item.valor = leitor.GetDouble(HMEVLRPREVISTO_ITENSABERTOS);
                    item.taxaJuros = leitor.obterDouble(HMETXJUROS_ITENSABERTOS);
                    item.saldoDevedor = leitor.obterDouble(HMESALDODEV_ITENSABERTOS);
                    item.valor = leitor.obterDouble(HMEVLRPREVISTO_ITENSABERTOS);

                    itens.Add(item);
                }
            }

            return itens;
        }

        
        #endregion
    }
}
