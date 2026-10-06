#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// Criação de fucionalidade para importar modelos de contratos de empréstimo.
///
#endregion
#region SOL 258704/17636 / PPM 1008709
/// - SOL 258704/17636 / PPM 1008709
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 12/08/2015
///
/// Descrição da Alteração:
/// Criação do Método ObterContaBancaria no conectorWeb.
/// 
#endregion

#region SOL 244386 / PPM 601624
///
/// Autor:
/// Petri Nocentini
///
/// Data da Alteração:
/// 08/12/2014 17:06
///
/// Descrição da Alteração:
/// Erro ao trazer data de falecimento nas telas Contratos e Parcelas e Quitação antecipada/ por falecimento
///
#endregion

#region SOL 238824 / PPM 508902
///
/// Autor:
/// Fernando Francisco Xavier
///
/// Data da Alteração:
/// 09/09/2014 15:39:10
///
/// Descrição da Alteração:
/// O Sistema não diferenciava conta de credito e debito
///
#endregion

using FUNCEF.Planus.Componentes.AcessoDados; 
using FUNCEF.Planus.WebEmprestimo.Tipos;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;

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
        private const int CONFIG_BARRAS = 4;

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

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o mutuario tem um beneficio Ativo
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns>Verdadeiro se o mutuario possuir beneficio ativo</returns>
        public bool verificarBeneficioAtivo(int idPessoa, int idTitular)
        {
            string query = @"  SELECT 1
                            FROM CM.BENEFBFCIARIO
                           WHERE FONTEPAGADORA = 1
                             AND IDSITBENEFICIO = 1
                             AND IDTPPAGTOBENEFIC = 1
                             AND IDTITULAR = :IDTITULAR_P
                             AND IDPESSOA = :IDPESSOA_P";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, idPessoa);
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idTitular);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        return true;
                    }
                }
                return false;
            }
        }

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

            string query;

            query = @" SELECT CTB.IDPLANOPREV 
               FROM CM.PARTPREVPLAN ATU, 
                    CM.PARTPREVPLAN ANT, 
                    CM.PLANPREVCONTABIL CTB 
              WHERE ATU.IDPESSOA = :PIDPESSOA 
                AND ATU.IDPLANOPREV = 74 
                AND CTB.IDPLANOPREVPREV = ANT.IDPLANOPREV 
                AND CTB.IDPLANOPREV = 28 
                AND ANT.IDPESSOA = ATU.IDPESSOA 
                AND ANT.INSCRICAODATA = 
                     (SELECT MAX(INSCRICAODATA) 
                      FROM   CM.PARTPREVPLAN 
                      WHERE  IDPESSOA = ATU.IDPESSOA 
                      AND    IDPLANOPREV = 2 
                      AND    IDSITPLANOPREV IN (25,27,28,29) 
                      AND    FLGDESATIVADO = 1 
                      AND    INSCRICAODATA < ATU.INSCRICAODATA) ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "PIDPESSOA", DbType.Int32, idmutuario);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        idplanocontabil = Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                //NÃO ENCONTROU O PLANO CONTABIL, PROCURAR NA BENEFBFCIARIO
                if (idplanocontabil == 0)
                {
                    string query2;

                    query2 = @" SELECT DISTINCT 
                        IDPLANPREVCONTAB, 
                        IDTITULAR, 
                        IDPESSOA, 
                        IDPLANOPREV, 
                        IDPLANPREVCONTAB         
                   FROM CM.BENEFBFCIARIO 
                  WHERE IDPESSOA       = :PIDPESSOA 
                    AND IDPLANOPREV    = :PIDPLANOPREV 
                    AND IDSITBENEFICIO = 1 ";

                    Database bancoDeDados2 = this.obterBancoDeDados();
                    using (DbCommand comando2 = bancoDeDados2.GetSqlStringCommand(query2))
                    {

                        bancoDeDados2.AddInParameter(comando2, "PIDPESSOA", DbType.Int32, idmutuario);
                        bancoDeDados2.AddInParameter(comando2, "PIDPLANOPREV", DbType.Int32, idplanoprev);

                        using (IDataReader leitor = bancoDeDados2.ExecuteReader(comando2))
                        {
                            if (leitor.Read())
                            {
                                idplanocontabil = Convert.ToInt32(leitor.GetValue(0));
                            }
                        }
                    }
                }

                return idplanocontabil;
            }
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
            string query;

            bool buscarMatricula = mutuario != null && !String.IsNullOrEmpty(mutuario.matricula);
            bool buscarCPF = mutuario != null && !String.IsNullOrEmpty(mutuario.cpf);
            bool buscarNome = mutuario != null && !String.IsNullOrEmpty(mutuario.nome);

            //Se a primeira vier nulo uma segunda query é executada. 
            //Isso ocorre porque a primeira query não engloba os pensionistas, 
            //que então são selecionados pela segunda query.

            // Consulta
            //query.Append("SELECT  ");
            //query.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP,  ");
            //query.Append("   DECODE(DEP.IDTITULAR, NULL, '',  ");
            //query.Append("   DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  ");
            //query.Append("   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, ");
            //query.Append("   DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO,  "); //NILTON - CORRECAO - 31/01/13
            //query.Append("   PEP.NOME AS NOME_TIT,      ");
            //query.Append("   ELP.MATRICULA AS MATRICULA_TIT,  ");
            //query.Append("   PEP.NUMDOCUMENTO AS CPF_TIT,   ");
            //query.Append("   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  ");
            //query.Append("   SIP.DESCRICAO AS SIT_PART,  ");
            //query.Append("   SPP.DESCRICAO AS SIT_PLANO,  ");
            //query.Append("   PPA.NOME AS NOME_PATRO,  ");
            //query.Append("   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, ");
            //query.Append("   PLP.IDPLANOPREV, ");
            //query.Append("   PPA.IDPESSOA AS IDPATRO, ");
            //query.Append("   PEP.IDPESSOA AS ID_TIT, ");
            //query.Append("   DEP.IDPESSOA AS ID_DEP ");
            //query.Append("   , SIP.FLGINTERNO AS SITPARTFUNDACAO "); // xavier alterar a assinatura da regra 6170 conforme e-mail
            //query.Append("   , PPP.IDSITPART AS IDSITPART "); // xavier alterar a assinatura da regra conforme e-mail
            //query.Append("   , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB ");//William Moreira da Silva - SOL 217507 KTN 2047224
            //query.Append("FROM  ");
            //query.Append("  CM.ELEGPATRO ELP  ");
            //query.Append("  JOIN CM.PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA ");
            //query.Append("  JOIN CM.PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA ");
            //query.Append("  JOIN CM.PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR ");
            //query.Append("                         AND ELP.IDPESSOA = PPP.IDPESSOA  ");
            //query.Append("  JOIN CM.PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV ");
            //query.Append("  JOIN CM.SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART ");
            //query.Append("  JOIN CM.SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ");
            //query.Append("  JOIN CM.DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA ");
            //query.Append("  JOIN CM.PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA ");
            //query.Append("  LEFT JOIN (SELECT DISTINCT BNF.IDPESSOA, ");
            //query.Append("                BNF.IDTITULAR, ");
            //query.Append("                BNF.IDPLANOPREV, ");
            //query.Append("                BNF.IDPLANOORIGEM, ");
            //query.Append("                BNF.IDPLANPREVCONTAB ");
            //query.Append("  FROM CM.BENEFBFCIARIO BNF ");
            //query.Append("  WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)  ");
            //query.Append("  AND BNF.FONTEPAGADORA = 1 ");
            //query.Append("  AND BNF.IDSITBENEFICIO IN ");
            //query.Append("  (SELECT MIN(SB1.IDSITBENEFICIO) ");
            //query.Append("  FROM CM.BENEFBFCIARIO SB1 ");
            //query.Append("  WHERE BNF.IDPESSOA = SB1.IDPESSOA ");
            //query.Append("  AND BNF.IDTITULAR = SB1.IDTITULAR ");
            //query.Append("  AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA ");
            //query.Append("                                            AND BFC.IDTITULAR =  DEP.IDTITULAR ");
            //query.Append("                                            AND bfc.Idplanoprev = ppp.idplanoprev ");
            //query.Append("  LEFT JOIN CM.PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV ");
            //query.Append("  WHERE dep.idtitular = dep.idpessoa ");
            //query.Append("  AND  (PPP.IDSITPLANOPREV = 25 OR  ");
            //query.Append("  PPP.IDPLANOPREV =  (SELECT MAX(PPP2.IDPLANOPREV) ");
            //query.Append("                      FROM CM.PARTPREVPLAN PPP2 ");
            //query.Append("                      WHERE PPP2.FLGDESATIVADO = 0 ");
            //query.Append("                      AND PPP2.Idsitplanoprev <> 25 ");
            //query.Append("                      AND PPP2.IDPESSOA = PPP.IDPESSOA ");
            //query.Append("                      AND NOT EXISTS (SELECT 1 ");
            //query.Append("                                      FROM CM.PARTPREVPLAN PPP3 ");
            //query.Append("                                      WHERE PPP3.IDPESSOA = PPP2.IDPESSOA ");
            //query.Append("                                      AND PPP3.IDSITPLANOPREV = 25))) ");


            // Consulta
            query = @" SELECT  
               DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP, 
               DECODE(DEP.IDTITULAR, NULL, '',  
               DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  
               DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, 
               DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO, 
               PEP.NOME AS NOME_TIT,      
               ELP.MATRICULA AS MATRICULA_TIT,  
               PEP.NUMDOCUMENTO AS CPF_TIT,   
               PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  
               SIP.DESCRICAO AS SIT_PART,  
               SPP.DESCRICAO AS SIT_PLANO,  
               PPA.NOME AS NOME_PATRO,  
               NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, 
               PLP.IDPLANOPREV, 
               PPA.IDPESSOA AS IDPATRO, 
               PEP.IDPESSOA AS ID_TIT, 
               DEP.IDPESSOA AS ID_DEP 
               , SIP.FLGINTERNO AS SITPARTFUNDACAO
               , PPP.IDSITPART AS IDSITPART 
               , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB
            FROM  
              CM.ELEGPATRO ELP  
              JOIN CM.PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA 
              JOIN CM.PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA 
              JOIN CM.PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR 
                                     AND ELP.IDPESSOA = PPP.IDPESSOA  
              JOIN CM.PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV 
              JOIN CM.SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART 
              JOIN CM.SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV 
              JOIN CM.DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA 
              JOIN CM.PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA 
              LEFT JOIN (SELECT DISTINCT BNF.IDPESSOA, 
                            BNF.IDTITULAR, 
                            BNF.IDPLANOPREV, 
                            BNF.IDPLANOORIGEM, 
                            BNF.IDPLANPREVCONTAB 
              FROM CM.BENEFBFCIARIO BNF 
              WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)  
              AND BNF.FONTEPAGADORA = 1 
              AND BNF.IDSITBENEFICIO IN 
              (SELECT MIN(SB1.IDSITBENEFICIO) 
              FROM CM.BENEFBFCIARIO SB1 
              WHERE BNF.IDPESSOA = SB1.IDPESSOA 
              AND BNF.IDTITULAR = SB1.IDTITULAR 
              AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA 
                                                        AND BFC.IDTITULAR =  DEP.IDTITULAR 
                                                        AND bfc.Idplanoprev = ppp.idplanoprev 
              LEFT JOIN CM.PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV 
            WHERE DEP.IDTITULAR = DEP.IDPESSOA
            AND (
                -- AND (PPP.IDSITPLANOPREV = 25  SIG XXXXX INICIO
                -- ALTERAÇÃO REALIZADA PARA DESCONSIDERAR O PLANO DO PARTICIPANTE COM BENEFICIO SALDADO E É AUTOPATROCINADO EM OUTRO PLANO (NOVO PLANO)
                (PPP.IDSITPLANOPREV = 25 AND (NOT EXISTS(SELECT 1 FROM PARTPREVPLAN PPP5 
                                                                WHERE PPP5.IDSITPART=2 
                                                                AND PPP5.IDPESSOA=PPP.IDPESSOA) 
                                                OR 
                                                SIP.FLGINTERNO = 'AS'))
                -- ALTERAÇÃO REALIZADA PARA CONSIDERAR O PLANO DO PARTICIPANTE QUE É AUTOPATROCINADO() NOVO PLANO E POSSUI UM SALDADO COM SITUÇÃO INTERNA IGUAL A AT                                                                                                                                                                    
                OR
                PPP.IDPLANOPREV = (SELECT MAX(PPP2.IDPLANOPREV) 
                                    FROM  CM.PARTPREVPLAN PPP2 
                                    WHERE PPP2.IDSITPART = 2
                                    AND   PPP2.IDPESSOA = PPP.IDPESSOA 
                                    AND   EXISTS (SELECT 1 FROM CM.PARTPREVPLAN PPP3 
                                                    WHERE  PPP3.IDPESSOA = PPP2.IDPESSOA 
                                                    AND    PPP3.IDSITPLANOPREV = 25
                                                    AND    PPP3.IDSITPART IN (SELECT IDSITPART FROM SITPART WHERE FLGINTERNO <> 'AS')))                                                   
                -- AND (PPP.IDSITPLANOPREV = 25  SIG XXXXX FIM       
                OR  
                PPP.IDPLANOPREV = (SELECT MAX(PPP2.IDPLANOPREV) 
                            FROM CM.PARTPREVPLAN PPP2 
                            WHERE PPP2.FLGDESATIVADO = 0 
                            AND PPP2.Idsitplanoprev <> 25 
                            AND PPP2.IDPESSOA = PPP.IDPESSOA 
                            AND NOT EXISTS (SELECT 1 
                                            FROM CM.PARTPREVPLAN PPP3 
                                            WHERE PPP3.IDPESSOA = PPP2.IDPESSOA 
                                            AND PPP3.IDSITPLANOPREV = 25))
                OR
                PPP.IDPLANOPREV = (SELECT MAX(PPP4.IDPLANOPREV) 
                                    FROM CM.PARTPREVPLAN PPP4 
                                    WHERE PPP4.IDPESSOA = PPP.IDPESSOA 
                                    AND   PPP4.IDSITPLANOPREV = 3
                                    AND NOT EXISTS (SELECT 1 
                                                    FROM CM.PARTPREVPLAN PPP5 
                                                    WHERE PPP5.IDPESSOA = PPP4.IDPESSOA 
                                                    AND PPP5.IDSITPLANOPREV NOT IN (3,24,26)))) ";

            // Filtros
            if (buscarMatricula)
            {
                query = query + @" AND DEP.MATRICULA LIKE :MATRICULA_P ";
            }
            if (buscarCPF)
            {
                query = query + @" AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE :CPF_P || '%' ";
            }
            if (buscarNome)
            {
                query = query + @" AND PEP.NOME LIKE :NOME_P || '%' 
                  AND PDP.NOME LIKE :NOME1_P || '%' ";
            }

            // Ordenação
            query = query + this.obterQueryOrdenacao("PEP", "NOME ASC", parametros);

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query);

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
                    Mutuario item = new Mutuario();

                    item.nome = leitor.obterString(NOME_DEP_MUTUARIO);
                    item.matricula = leitor.obterString(MATRICULA_DEP_MUTUARIO);
                    item.cpf = leitor.obterString(CPF_TIT_MUTUARIO);
                    item.inscricaoPrevidenciaria = leitor.obterValorInt64(INSCRICAOPREV_TIT_MUTUARIO).Value;
                    item.situacao = leitor.obterString(SITUACAO_PARTICIPANTE_MUTUARIO);
                    item.tipo = leitor.obterString(TIPO_MUTUARIO);
                    item.id = leitor.obterInt(ID_PESSOA_DEP);
                    item.idTitular = leitor.obterInt(ID_PESSOA_TIT);
                    item.flginternoParticipante = leitor.obterString(FLGINTERNO_MUTUARIO);  // xavier alterar a assinatura da regra 6170 conforme e-mail
                    item.idsitpart = leitor.obterInt(IDSITPART);  // xavier alterar a assinatura conforme e-mail
                    item.plano = new PlanoPrevidenciario();
                    item.plano.id = leitor.obterInt(IDPLANOPREV_MUTUARIO);
                    item.plano.situacao = leitor.obterString(SITUACAO_PLANO_MUTUARIO);
                    item.plano.descricao = leitor.obterString(NOME_PLANOPREV_MUTUARIO);
                    item.plano.flagInterno = leitor.obterString(FLGINTERNO_MUTUARIO);

                    var valor = leitor.GetValue(IDPLANPREVCONTAB_P);
                    item.plano.IdPlanoOrigem = (valor == DBNull.Value) ? 0 : leitor.obterInt(IDPLANPREVCONTAB_P);

                    item.patrocinadora = new Patrocinadora()
                    {
                        id = leitor.obterInt(ID_PATROCINADORA_MUTUARIO),
                        nome = leitor.obterString(NOME_PATRO_MUTUARIO)
                    };

                    mutuarios.Add(item);
                }
            }
            // Total de Regristros
            parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query);

            if (!bExisteMutuarios)
            {

                string querypensionista;

                // Consulta
                querypensionista = @" SELECT  
                    DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP,  
                    DECODE(DEP.IDTITULAR, NULL, '',  
                    DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  
                    DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, 
                    DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO,
                    PEP.NOME AS NOME_TIT,      
                    ELP.MATRICULA AS MATRICULA_TIT,  
                    PEP.NUMDOCUMENTO AS CPF_TIT,   
                    PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  
                    SIP.DESCRICAO AS SIT_PART,  
                    SPP.DESCRICAO AS SIT_PLANO,  
                    PPA.NOME AS NOME_PATRO,  
                    NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, 
                    PLP2.IDPLANOPREV,        
                    PPA.IDPESSOA AS IDPATRO, 
                    PEP.IDPESSOA AS ID_TIT, 
                    DEP.IDPESSOA AS ID_DEP 
                    , SIP.FLGINTERNO AS SITPARTFUNDACAO 
                    , PPP.IDSITPART AS IDSITPART 
                    , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB               
                 FROM  
                    CM.ELEGPATRO ELP  
                    JOIN CM.PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA  
                    JOIN CM.PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA 
                    JOIN CM.PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR 
                                          AND ELP.IDPESSOA = PPP.IDPESSOA 
                    JOIN CM.PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV 
                    JOIN CM.SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART 
                    JOIN CM.SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV 
                    JOIN CM.DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA 
                    JOIN CM.PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA 
                    JOIN (SELECT DISTINCT BNF.IDPESSOA, 
                                 BNF.IDTITULAR, 
                                 BNF.IDPLANOPREV, 
                                 BNF.IDPLANOORIGEM, 
                                 BNF.IDPLANPREVCONTAB 
                          FROM CM.BENEFBFCIARIO BNF 
                          WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE OR BNF.IDSITBENEFICIO = 3 AND BNF.DATAFINAL < SYSDATE) 
                          AND BNF.FONTEPAGADORA = 1  
                          AND (BNF.IDSITBENEFICIO = (SELECT MIN(SB1.IDSITBENEFICIO) 
                                                     FROM CM.BENEFBFCIARIO SB1 
                                                     WHERE BNF.IDPESSOA = SB1.IDPESSOA  
                                                     AND BNF.IDTITULAR = SB1.IDTITULAR 
                                                     AND SB1.IDSITBENEFICIO IN (1, 2, 7))
                               OR 
                                   BNF.IDSITBENEFICIO = 3 
                               AND NOT EXISTS (SELECT 1 FROM CM.BENEFBFCIARIO SB2
                                               WHERE BNF.IDPESSOA = SB2.IDPESSOA  
                                               AND BNF.IDTITULAR = SB2.IDTITULAR 
                                               AND SB2.IDSITBENEFICIO IN (1, 2, 7))
                               AND BNF.DATAFINAL = (SELECT MAX(SB3.DATAFINAL) FROM CM.BENEFBFCIARIO SB3
                                                    WHERE BNF.IDPESSOA = SB3.IDPESSOA  
                                                    AND BNF.IDTITULAR = SB3.IDTITULAR 
                                                    AND SB3.IDSITBENEFICIO = 3))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA 
                                                                                      AND BFC.IDTITULAR =  DEP.IDTITULAR 
                    JOIN CM.PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV 
                    WHERE ((BFC.IDPLANPREVCONTAB = 28 
                             OR 
                            BFC.IDPLANPREVCONTAB <> 28 
                            AND NOT EXISTS (SELECT 1 
                                            FROM CM.BENEFBFCIARIO BF 
                                            WHERE (BF.DATAFINAL IS NULL OR BF.DATAFINAL > SYSDATE) 
                                            AND BF.IDPESSOA = BFC.IDPESSOA 
                                            AND BF.IDTITULAR = BFC.IDTITULAR 
                                            AND BF.FONTEPAGADORA = 1 
                                            AND BF.IDTPPAGTOBENEFIC = 1 
                                            AND BF.IDPLANPREVCONTAB = 28  
                                            AND BF.IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO) 
                                                                      FROM CM.BENEFBFCIARIO SB1 
                                                                      WHERE BF.IDPESSOA = SB1.IDPESSOA 
                                                                      AND BF.IDTITULAR = SB1.IDTITULAR 
                                                                      AND SB1.IDSITBENEFICIO IN (1, 2, 7))))) 
                    AND bfc.idpessoa <> bfc.idtitular 
                    AND ppp.idplanoprev = (SELECT MAX(PPP2.IDPLANOPREV) 
                                           FROM CM.PARTPREVPLAN PPP2 
                                           WHERE PPP2.IDPESSOA = PPP.IDPESSOA) ";



                // Filtros
                if (buscarMatricula)
                {
                    querypensionista = querypensionista + @"  AND DEP.MATRICULA = :MATRICULA_P ";
                }
                if (buscarCPF)
                {
                    querypensionista = querypensionista + @"  AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE :CPF_P || '%' ";
                }
                if (buscarNome)
                {
                    querypensionista = querypensionista + @"  AND PEP.NOME LIKE :NOME_P || '%' 
                    AND PDP.NOME LIKE :NOME1_P || '%' ";
                }

                // Ordenação
                querypensionista = querypensionista + this.obterQueryOrdenacao("PEP", "NOME ASC", parametros);

                // Cria comando de consulta
                Database bancoDeDadospensionista = this.obterBancoDeDados();
                DbCommand comandopensionista;
                if (parametros != null && parametros.paginacao != null)
                    comandopensionista = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(querypensionista, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
                else
                    comandopensionista = bancoDeDados.GetSqlStringCommand(querypensionista);

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
                            nome = leitor.obterString(NOME_DEP_MUTUARIO),
                            matricula = leitor.obterString(MATRICULA_DEP_MUTUARIO),
                            cpf = leitor.obterString(CPF_DEP_MUTUARIO),
                            // Thiago Melo
                            inscricaoPrevidenciaria = leitor.obterValorInt64(INSCRICAOPREV_TIT_MUTUARIO).Value,
                            situacao = leitor.obterString(SITUACAO_PARTICIPANTE_MUTUARIO),
                            tipo = leitor.obterString(TIPO_MUTUARIO),
                            id = leitor.obterInt(ID_PESSOA_DEP),
                            idTitular = leitor.obterInt(ID_PESSOA_TIT),
                            flginternoParticipante = leitor.obterString(FLGINTERNO_MUTUARIO),  // xavier alterar a assinatura da regra 6170 conforme e-mail
                            idsitpart = leitor.obterInt(IDSITPART),  // xavier alterar a assinatura conforme e-mail
                            plano = new PlanoPrevidenciario()
                            {
                                id = leitor.obterInt(IDPLANOPREV_MUTUARIO),
                                situacao = leitor.obterString(SITUACAO_PLANO_MUTUARIO),
                                descricao = leitor.obterString(NOME_PLANOPREV_MUTUARIO),
                                flagInterno = leitor.obterString(FLGINTERNO_MUTUARIO),
                                IdPlanoOrigem = leitor.obterInt(IDPLANPREVCONTAB_P)//William Moreira da Silva - SOL 217507 KTN 2047224
                            },
                            patrocinadora = new Patrocinadora()
                            {
                                id = leitor.obterInt(ID_PATROCINADORA_MUTUARIO),
                                nome = leitor.obterString(NOME_PATRO_MUTUARIO)
                            }
                        };
                        mutuarios.Add(item);
                    }
                }
                // Total de Regristros
                parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
                parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDadospensionista, comandopensionista, querypensionista.ToString());
            }

            // Retorna informações
            parametros.prepararRetorno();

            comando.Connection.Close();
            comando.Dispose();

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
            string query;

            bool buscarRazaoSocial = avalista != null && !String.IsNullOrEmpty(avalista.razaoSocial);
            bool buscarCPF = avalista != null && !String.IsNullOrEmpty(avalista.cpf);
            bool buscarNome = avalista != null && !String.IsNullOrEmpty(avalista.nome);


            // Consulta
            query = @" SELECT P.NOME,
        P.RAZAOSOCIAL,
        RTRIM(P.NUMDOCUMENTO),
        A.MARGEMCONSIG,
        TO_CHAR(A.RENDACOMP),
        A.IDAVALISTA   
FROM CM.PESSOA P,
     CM.AVALISTA A 
WHERE A.IDAVALISTA = P.IDPESSOA
AND   A.MARGEMCONSIG > 0 ";

            // Filtros
            if (buscarRazaoSocial)
            {
                query = query + @" AND  P.RAZAOSOCIAL LIKE :RAZAOSOCIAL_P ";
            }
            if (buscarCPF)
            {
                query = query + @" AND TRIM(P.NUMDOCUMENTO) = :CPF_P ";
            }
            if (buscarNome)
            {
                query = query + @" AND UPPER(P.NOME) = UPPER(:NOME_P) ";//William Moreira da Silva - SOL 143476/16437
                //  AND PDP.NOME LIKE :NOME1_P || '%' ");
            }

            // Ordenação
            query = query + this.obterQueryOrdenacao("P", "NOME ASC", parametros);

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query);

            // Parâmetros

            if (buscarRazaoSocial)
            {
                bancoDeDados.AddInParameter(comando, "RAZAOSOCIAL_P", DbType.String, avalista.razaoSocial.Trim());
            }
            if (buscarCPF)
                bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, avalista.cpf.Trim());
            if (buscarNome)
            {
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, avalista.nome.ToUpper().Trim());
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
                        nome = leitor.obterString(0),
                        razaoSocial = leitor.obterString(1),
                        cpf = leitor.obterString(2),
                        renda = (double)leitor.obterDecimal(4),
                        id = leitor.obterInt(5)
                    };
                    avalistas.Add(item);
                }
                // Total de Regristros
                parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
                parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query);

            }

            // Retorna informações
            parametros.prepararRetorno();

            return avalistas;
        }

        /// <summary>
        /// Obtém informações dos avalistas passados no parâmetro.
        /// </summary>
        /// <param name="avalistas">Avalista a ser buscados</param>
        public void obterInfoAvalista(ref Avalistas avalista)
        {
            string query = @"SELECT P.NOME,
       P.RAZAOSOCIAL,
       A.MARGEMCONSIG,
       TO_CHAR(A.RENDACOMP),
       A.IDAVALISTA
FROM CM.PESSOA P,
     CM.AVALISTA A 
WHERE A.IDAVALISTA = P.IDPESSOA
AND   RTRIM(P.NUMDOCUMENTO) = :CPF_P";

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, avalista.cpf);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        avalista.nome = leitor.obterString(0);
                        avalista.razaoSocial = leitor.obterString(1);
                        avalista.margem = leitor.IsDBNull(2) ? 0 : (double)leitor.obterDecimal(2);
                        avalista.renda = leitor.IsDBNull(3) ? 0 : (double)leitor.obterDecimal(3);
                        avalista.id = leitor.IsDBNull(4) ? 0 : leitor.obterInt(4);
                    }
                }
            }
        }

        /// <summary>
        /// Consulta Grupo Avalista.
        /// </summary>
        /// <param name="mutuario">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarGrupoAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            bool buscarRazaoSocial = avalista != null && !String.IsNullOrEmpty(avalista.razaoSocial);
            bool buscarCPF = avalista != null && !String.IsNullOrEmpty(avalista.cpf);
            bool buscarNome = avalista != null && !String.IsNullOrEmpty(avalista.nome);


            // Consulta
            query.Append(" SELECT    P.NOME ,    P.RAZAOSOCIAL , P.NUMDOCUMENTO ,    ");
            query.Append(" P.IDPESSOA  ");
            query.Append(" FROM    CM.PESSOA P WHERE ( P.TIPO = 'J' )  ");

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
                query.Append("  AND ÙPPER(P.NOME) LIKE ÙPPER(:NOME_P) || '%' ");//William Moreira da Silva - SOL 143476/16437
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
                        nome = leitor.obterString(0),
                        razaoSocial = leitor.obterString(1),
                        cpf = leitor.obterString(2),
                        id = leitor.obterInt(3)
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
        /// Consulta Novo Avalista.
        /// </summary>
        /// <param name="mutuario">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarNovoAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            bool buscarRazaoSocial = avalista != null && !String.IsNullOrEmpty(avalista.razaoSocial);
            bool buscarCPF = avalista != null && !String.IsNullOrEmpty(avalista.cpf);
            bool buscarNome = avalista != null && !String.IsNullOrEmpty(avalista.nome);

            // Consulta
            query.Append(" SELECT P.NOME , P.RAZAOSOCIAL , P.NUMDOCUMENTO , P.IDPESSOA");
            query.Append(" FROM  CM.PESSOA P,  CM.AVALISTA A  ");
            query.Append(" WHERE  ( P.IDPESSOA = A.IDAVALISTA ) AND ");
            query.Append(" ( A.IDAVALISTA = P.IDPESSOA )  ");

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
                query.Append("  AND UPPER(P.NOME) LIKE UPPER(:NOME_P) || '%' ");//William Moreira da Silva - SOL 143476/16437

            }

            // Ordenação
            query.Append(this.obterQueryOrdenacao("P", "NOME ASC", parametros));

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
            {
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            }
            else
            {
                comando = bancoDeDados.GetSqlStringCommand(query.ToString());
            }

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
                        nome = leitor.obterString(0),
                        razaoSocial = leitor.obterString(1),
                        cpf = leitor.obterString(2),
                        id = leitor.obterInt(3)
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

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Retorna a matricula do mutuario pelo o seu idpessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <returns>Matricula do participante</returns>
        public string obterMatricula(int idPessoa)
        {
            string query = @"SELECT MATRICULA FROM CM.DEPENTIT WHERE IDPESSOA = :IDPESSOA_P";
            string matricula = "";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        matricula = leitor.obterString(0);
                    }
                }

                return matricula;
            }
        }

        /// <summary>
        /// Obtem dados do Mutuario.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public Mutuario obterDadosMutuario(string matricula) // Thiago Melo SOL 206149
        {
            StringBuilder query = new StringBuilder();

            // Saulo / FUNCEF  - Alterado notação para @"" a fim de melhorar performance
            // Consulta 
            query.Append(@"SELECT  
        DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP, 
        DECODE(DEP.IDTITULAR, NULL, '', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,  
        DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP, 
        DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO, 
        PEP.NOME AS NOME_TIT,      
        ELP.MATRICULA AS MATRICULA_TIT,  
        PEP.NUMDOCUMENTO AS CPF_TIT,   
        PPP.INSCRICAONUMERO AS INSCRICAO_TIT,  
        SIP.DESCRICAO AS SIT_PART,  
        SPP.DESCRICAO AS SIT_PLANO,  
        PPA.NOME AS NOME_PATRO,  
        NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, 
        PLP.IDPLANOPREV, 
        PPA.IDPESSOA AS IDPATRO, 
        PEP.IDPESSOA AS ID_TIT, 
        DEP.IDPESSOA AS ID_DEP 
        , SIP.FLGINTERNO AS SITPARTFUNDACAO
        , PPP.IDSITPART AS IDSITPART 
        , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB
    FROM  
        CM.ELEGPATRO ELP  
        JOIN CM.PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA 
        JOIN CM.PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA 
        JOIN CM.PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR 
                                AND ELP.IDPESSOA = PPP.IDPESSOA  
        JOIN CM.PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV 
        JOIN CM.SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART 
        JOIN CM.SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV 
        JOIN CM.DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA 
        JOIN CM.PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA 
        LEFT JOIN (SELECT DISTINCT BNF.IDPESSOA, 
                    BNF.IDTITULAR, 
                    BNF.IDPLANOPREV, 
                    BNF.IDPLANOORIGEM, 
                    BNF.IDPLANPREVCONTAB 
        FROM CM.BENEFBFCIARIO BNF 
        WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)  
        AND BNF.FONTEPAGADORA = 1 
        AND BNF.IDSITBENEFICIO IN 
        (SELECT MIN(SB1.IDSITBENEFICIO) 
        FROM CM.BENEFBFCIARIO SB1 
        WHERE BNF.IDPESSOA = SB1.IDPESSOA 
        AND BNF.IDTITULAR = SB1.IDTITULAR 
        AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA 
                                                AND BFC.IDTITULAR =  DEP.IDTITULAR 
                                                AND bfc.Idplanoprev = ppp.idplanoprev 
        LEFT JOIN CM.PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV 
    WHERE dep.idtitular = dep.idpessoa 
    AND (
            -- AND (PPP.IDSITPLANOPREV = 25  SIG XXXXX INICIO
            -- ALTERAÇÃO REALIZADA PARA DESCONSIDERAR O PLANO DO PARTICIPANTE COM BENEFICIO SALDADO E É AUTOPATROCINADO EM OUTRO PLANO (NOVO PLANO)
            (PPP.IDSITPLANOPREV = 25 AND (NOT EXISTS(SELECT 1 FROM PARTPREVPLAN PPP5 
                                                            WHERE PPP5.IDSITPART=2 
                                                            AND PPP5.IDPESSOA=PPP.IDPESSOA) 
                                            OR 
                                            SIP.FLGINTERNO = 'AS'))
            -- ALTERAÇÃO REALIZADA PARA CONSIDERAR O PLANO DO PARTICIPANTE QUE É AUTOPATROCINADO() NOVO PLANO E POSSUI UM SALDADO COM SITUÇÃO INTERNA IGUAL A AT                                                                                                                                                                    
            OR
            PPP.IDPLANOPREV = (SELECT MAX(PPP2.IDPLANOPREV) 
                                FROM  CM.PARTPREVPLAN PPP2 
                                WHERE PPP2.IDSITPART = 2
                                AND   PPP2.IDPESSOA = PPP.IDPESSOA 
                                AND   EXISTS (SELECT 1 FROM CM.PARTPREVPLAN PPP3 
                                                WHERE  PPP3.IDPESSOA = PPP2.IDPESSOA 
                                                AND    PPP3.IDSITPLANOPREV = 25
                                                AND    PPP3.IDSITPART IN (SELECT IDSITPART FROM SITPART WHERE FLGINTERNO <> 'AS')))                                                   
            -- AND (PPP.IDSITPLANOPREV = 25  SIG XXXXX FIM       
            OR  
            PPP.IDPLANOPREV = (SELECT MAX(PPP2.IDPLANOPREV) 
                                FROM CM.PARTPREVPLAN PPP2 
                                WHERE PPP2.FLGDESATIVADO = 0 
                                AND PPP2.Idsitplanoprev <> 25 
                                AND PPP2.IDPESSOA = PPP.IDPESSOA 
                                AND NOT EXISTS (SELECT 1 
                                                FROM CM.PARTPREVPLAN PPP3 
                                                WHERE PPP3.IDPESSOA = PPP2.IDPESSOA 
                                                AND PPP3.IDSITPLANOPREV = 25))
            OR
            PPP.IDPLANOPREV = (SELECT MAX(PPP4.IDPLANOPREV) 
                                FROM CM.PARTPREVPLAN PPP4 
                                WHERE PPP4.IDPESSOA = PPP.IDPESSOA 
                                AND   PPP4.IDSITPLANOPREV = 3
                                AND NOT EXISTS (SELECT 1 
                                                FROM CM.PARTPREVPLAN PPP5 
                                                WHERE PPP5.IDPESSOA = PPP4.IDPESSOA 
                                                AND PPP5.IDSITPLANOPREV NOT IN (3,24,26)))) ");

            // xavier fim - adicionado a mesma verificação que existe no Planus. inicio

            // Filtro
            // Thiago Melo SOL 206149
            //  AND DEP.IDPESSOA = :ID_PESSOA_P ");
            query.Append(@" AND DEP.MATRICULA = :MATRICULA_P ");
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
                    var valor = leitor.GetValue(IDPLANPREVCONTAB_P);

                    bExisteMutuario = true;
                    mutuario = new Mutuario()
                    {
                        nome = leitor.obterString(NOME_DEP_MUTUARIO),
                        matricula = leitor.obterString(MATRICULA_DEP_MUTUARIO),
                        cpf = leitor.obterString(CPF_TIT_MUTUARIO),
                        inscricaoPrevidenciaria = Convert.ToInt64(leitor.GetValue(INSCRICAOPREV_TIT_MUTUARIO)),
                        situacao = leitor.obterString(SITUACAO_PARTICIPANTE_MUTUARIO),
                        tipo = leitor.obterString(TIPO_MUTUARIO),
                        id = leitor.obterInt(ID_PESSOA_DEP),
                        idTitular = leitor.obterInt(ID_PESSOA_TIT),
                        flginternoParticipante = leitor.obterString(SITPARTFUNDACAO), // xavier alterar a assinatura da regra 6170 conforme e-mail
                        idsitpart = leitor.obterInt(IDSITPART),  // xavier alterar a assinatura conforme e-mail
                        plano = new PlanoPrevidenciario()
                        {
                            id = leitor.obterInt(IDPLANOPREV_MUTUARIO),
                            situacao = leitor.obterString(SITUACAO_PLANO_MUTUARIO),
                            descricao = leitor.obterString(NOME_PLANOPREV_MUTUARIO),
                            IdPlanoOrigem = (valor == DBNull.Value) ? 0 : leitor.obterInt(IDPLANPREVCONTAB_P)//William Moreira da Silva - SOL 217507 KTN 2047224
                            // Thiago Melo SOL 206149
                            //IdPlanoOrigem = this.consultarPlanoContabilMutuario(idPessoa, Convert.ToInt32(leitor.GetValue(IDPLANOPREV_MUTUARIO))                            
                            //IdPlanoOrigem = this.consultarPlanoContabilMutuario(Convert.ToInt32(leitor.GetValue(ID_PESSOA_DEP), Convert.ToInt32(leitor.GetValue(IDPLANOPREV_MUTUARIO))
                            // Thiago Melo SOL 206149
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            id = leitor.obterInt(ID_PATROCINADORA_MUTUARIO),
                            nome = leitor.obterString(NOME_PATRO_MUTUARIO)
                        }
                    };

                }
            }

            if (!bExisteMutuario)
            {
                StringBuilder querypensionista = new StringBuilder();

                querypensionista.Append(@"SELECT
   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME_DEP,
   DECODE(DEP.IDTITULAR, NULL, '', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_DEP,
   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF_DEP,
   DECODE(DEP.IDTITULAR, NULL, 'Não Participante', DEP.IDPESSOA, 'Participante','Pensionista') AS TIPO, -- NILTON - CORRECAO - 31/01/13
   PEP.NOME AS NOME_TIT,
   ELP.MATRICULA AS MATRICULA_TIT,
   PEP.NUMDOCUMENTO AS CPF_TIT,
   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,
   SIP.DESCRICAO AS SIT_PART,
   SPP.DESCRICAO AS SIT_PLANO,
   PPA.NOME AS NOME_PATRO,
   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO,
   PLP2.IDPLANOPREV, -- NILTON - CORRECAO 30/01/13
   PPA.IDPESSOA AS IDPATRO,
   PEP.IDPESSOA AS ID_TIT,
   DEP.IDPESSOA AS ID_DEP
   , SIP.FLGINTERNO AS SITPARTFUNDACAO -- xavier alterar a assinatura da regra 6170 conforme e-mail
   , PPP.IDSITPART AS IDSITPART -- xavier alterar a assinatura da regra conforme e-mail
   , BFC.IDPLANPREVCONTAB AS IDPLANOCONTAB -- William Moreira da Silva - SOL 217507 KTN 2047224
FROM
   CM.ELEGPATRO ELP
   JOIN CM.PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA
   JOIN CM.PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA
   JOIN CM.PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR
                         AND ELP.IDPESSOA = PPP.IDPESSOA
   JOIN CM.PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV
   JOIN CM.SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART
   JOIN CM.SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV
   JOIN CM.DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA
   JOIN CM.PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA
   JOIN (SELECT DISTINCT BNF.IDPESSOA,
                BNF.IDTITULAR,
                BNF.IDPLANOPREV,
                BNF.IDPLANOORIGEM,
                BNF.IDPLANPREVCONTAB
         FROM CM.BENEFBFCIARIO BNF
         WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE OR BNF.IDSITBENEFICIO = 3 AND BNF.DATAFINAL < SYSDATE)
         AND BNF.FONTEPAGADORA = 1
         AND (BNF.IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO)
                                    FROM CM.BENEFBFCIARIO SB1
                                    WHERE BNF.IDPESSOA = SB1.IDPESSOA
                                    AND BNF.IDTITULAR = SB1.IDTITULAR
                                    AND SB1.IDSITBENEFICIO IN (1, 2, 7))
              OR 
                  BNF.IDSITBENEFICIO = 3 
              AND NOT EXISTS (SELECT 1 FROM CM.BENEFBFCIARIO SB2
                              WHERE BNF.IDPESSOA = SB2.IDPESSOA  
                              AND BNF.IDTITULAR = SB2.IDTITULAR 
                              AND SB2.IDSITBENEFICIO IN (1, 2, 7))
              AND BNF.DATAFINAL = (SELECT MAX(SB3.DATAFINAL) FROM CM.BENEFBFCIARIO SB3
                                   WHERE BNF.IDPESSOA = SB3.IDPESSOA  
                                   AND BNF.IDTITULAR = SB3.IDTITULAR 
                                   AND SB3.IDSITBENEFICIO = 3))) BFC ON BFC.IDPESSOA = DEP.IDPESSOA
                                                                     AND BFC.IDTITULAR =  DEP.IDTITULAR
   JOIN CM.PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV
   WHERE ((BFC.IDPLANPREVCONTAB = 28 OR
   (BFC.IDPLANPREVCONTAB <> 28)
   AND NOT EXISTS (SELECT 1
                   FROM CM.BENEFBFCIARIO BF
                   WHERE (BF.DATAFINAL IS NULL OR BF.DATAFINAL > SYSDATE)
                   AND BF.IDPESSOA = BFC.IDPESSOA
                   AND BF.IDTITULAR = BFC.IDTITULAR
                   AND BF.FONTEPAGADORA = 1
                   AND BF.IDTPPAGTOBENEFIC = 1
                   AND BF.IDPLANPREVCONTAB = 28
                   AND BF.IDSITBENEFICIO IN
                   (SELECT MIN(SB1.IDSITBENEFICIO)
                   FROM CM.BENEFBFCIARIO SB1
                   WHERE BF.IDPESSOA = SB1.IDPESSOA
                   AND BF.IDTITULAR = SB1.IDTITULAR
                   AND SB1.IDSITBENEFICIO IN (1, 2, 7)))))
   AND bfc.idpessoa <> bfc.idtitular
   AND ppp.idplanoprev = (SELECT MAX(PPP2.IDPLANOPREV)
                          FROM CM.PARTPREVPLAN PPP2
                          WHERE PPP2.IDPESSOA = PPP.IDPESSOA)");


                // Filtro               
                // Thiago Melo SOL 206149
                //querypensionista.Append("  AND DEP.IDPESSOA = :ID_PESSOA_P ");
                querypensionista.Append("  AND DEP.MATRICULA = :MATRICULA_P ");
                // Thiago Melo SOL 206149

                // Cria comando de consulta
                //Database bancoDeDadosPensionista = this.obterBancoDeDados(); Saulo / FUNCEF
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
                            nome = leitor.obterString(NOME_DEP_MUTUARIO),
                            matricula = leitor.obterString(MATRICULA_DEP_MUTUARIO),
                            // Thiago Melo                             
                            //cpf = leitor.obterString(CPF_TIT_MUTUARIO),
                            cpf = leitor.obterString(CPF_DEP_MUTUARIO),
                            // Thiago Melo
                            inscricaoPrevidenciaria = Convert.ToInt64(leitor.GetValue(INSCRICAOPREV_TIT_MUTUARIO)),
                            situacao = leitor.obterString(SITUACAO_PARTICIPANTE_MUTUARIO),
                            tipo = leitor.obterString(TIPO_MUTUARIO),
                            id = Convert.ToInt32(leitor.GetValue(ID_PESSOA_DEP)),
                            idTitular = Convert.ToInt32(leitor.GetValue(ID_PESSOA_TIT)),
                            flginternoParticipante = leitor.obterString(SITPARTFUNDACAO), // xavier alterar a assinatura da regra 6170 conforme e-mail
                            idsitpart = Convert.ToInt32(leitor.GetValue(IDSITPART)),  // xavier alterar a assinatura conforme e-mail
                            plano = new PlanoPrevidenciario()
                            {
                                id = Convert.ToInt32(leitor.GetValue(IDPLANOPREV_MUTUARIO)),
                                situacao = leitor.obterString(SITUACAO_PLANO_MUTUARIO),
                                descricao = leitor.obterString(NOME_PLANOPREV_MUTUARIO),
                                IdPlanoOrigem = Convert.ToInt32(leitor.GetValue(IDPLANPREVCONTAB_P))//William Moreira da Silva - SOL 217507 KTN 2047224
                            },
                            patrocinadora = new Patrocinadora()
                            {
                                id = Convert.ToInt32(leitor.GetValue(ID_PATROCINADORA_MUTUARIO)),
                                nome = leitor.obterString(NOME_PATRO_MUTUARIO)
                            }
                        };

                    }
                }
                // fim da busca dos pensionistas
            }

            comando.Connection.Close();
            comando.Dispose();

            return mutuario;
        }

        //William Moreira da Silva SOL 238689
        /// <summary>
        /// Verifica se o usuario para o qual o processo esta sendo realizado é o mesmo que esta realizando o processo
        /// </summary>
        /// <param name="idPessoa">ID da pessoa o qual se esta realizando o processo</param>
        /// <param name="usuarioLogado">Usuario o qual esta logado</param>
        /// <returns>Verdadeiro se o Usuario é o mesmo e falso se for diferente.</returns>
        public bool verificaMutuario(int idPessoa, string usuarioLogado)
        {
            bool mesmoMutuario = false;
            int idUsuarioLogado = 0;

            AcessoContrato aContrato = new AcessoContrato();
            idUsuarioLogado = (int)aContrato.obterIdPlanus(usuarioLogado);

            if (idUsuarioLogado == idPessoa)
            {
                mesmoMutuario = true;
            }

            return mesmoMutuario;
        }

        /// <summary>
        /// Obtem documentos da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Documento> obterDocPessoa(int idPessoa)
        {
            string query;

            // Consulta
            query = @" SELECT TIPODOCPESSOA.IDDOCUMENTO, 
             TIPODOCPESSOA.NOMEDOCUMENTO , 
             TIPODOCPESSOA.MASCARA, 
             TIPODOCPESSOA.OBRIGAUF , 
             TIPODOCPESSOA.OBRIGAORGAO , 
             TIPODOCPESSOA.OBRIGAEMISSAO , 
             DOCPESSOA.IDPESSOA, 
             DOCPESSOA.IDIMAGEM , 
             DOCPESSOA.IDPAIS , 
             NVL(DOCPESSOA.IDESTADO,0) IDESTADO, 
             DOCPESSOA.NUMDOCUMENTO, 
             DOCPESSOA.ORGAO , 
             DOCPESSOA.DATAEMISSAO, 
             TIPODOCPESSOA.FLGOBRIGAVALIDADE, 
             DOCPESSOA.DATAVALIDADE 
             FROM CM.DOCPESSOA, CM.TIPODOCPESSOA 
             WHERE 
             ( TIPODOCPESSOA.IDDOCUMENTO=DOCPESSOA.IDDOCUMENTO) 
              AND DOCPESSOA.IDPESSOA = :ID_PESSOA_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);

                // Popula objetos resultantes
                List<Documento> docPessoa = new List<Documento>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Documento item = new Documento();
                        item.idDocumento = Convert.ToInt32(leitor.GetValue(0)); ;
                        item.nome = leitor.obterString(1);
                        item.mascara = leitor.obterString(2);
                        item.obrigaUf = leitor.obterString(3);
                        item.obrigaOrgao = leitor.obterString(4);
                        item.obrigaEmissao = leitor.obterString(5);
                        item.idPessoa = leitor.IsDBNull(6) ? 0 : Convert.ToInt32(leitor.GetValue(6));
                        item.idImagem = leitor.IsDBNull(7) ? 0 : Convert.ToInt32(leitor.GetValue(7));
                        item.numDocumento = leitor.obterString(10);
                        item.orgao = leitor.obterString(11);
                        item.dataEmissao = leitor.IsDBNull(12) ? DateTime.MinValue : DateTime.Parse(leitor.obterString(12));
                        item.flgObrigaValidade = leitor.obterString(13);
                        item.dataValidade = leitor.IsDBNull(14) ? DateTime.MaxValue : DateTime.Parse(leitor.obterString(14));
                        UF uf = new UF();
                        uf.idEstado = leitor.IsDBNull(9) ? 0 : Convert.ToInt32(leitor.GetValue(9));
                        item.uf = uf;

                        docPessoa.Add(item);
                    }
                }

                return docPessoa;
            }
        }

        /// <summary>
        /// Obtem dados da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public Pessoa obterInfPessoa(int idPessoa)
        {
            string query;

            // Consulta
            query = @" SELECT  PESSOA.IDPESSOA ,
             PESSOA.IDIMAGEM, 
             PESSOA.NOME , 
             PESSOA.TIPO , 
             PESSOA.RAZAOSOCIAL , 
             PESSOA.NUMDOCUMENTO , 
             PESSOA.IDDOCUMENTO , 
             PESSOA.EMAIL , 
             PESSOA.IDGRUPO, 
             PESSOA.IDENDCOMERCIAL, 
             PESSOA.IDENDRESIDENCIAL, 
             PESSOA.IDENDENTREGA, 
             PESSOA.IDENDCOBRANCA, 
             PESSOA.IDENDCORRESP, 
             G.NOME AS NOMEGRUPO,
             PESSOA.HOMEPAGE, 
             PESSOA.IDMODULORESPON, 
             MODULO.NOMEMODULO 
             FROM CM.PESSOA, CM.PESSOA G, CM.MODULO 
             WHERE  
             ( PESSOA.IDGRUPO = G.IDPESSOA(+) ) AND 
             ( PESSOA.IDMODULORESPON = MODULO.IDMODULO(+) )  
              AND PESSOA.IDPESSOA = :ID_PESSOA_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);

                // Popula objetos resultantes
                Pessoa infPessoa = new Pessoa();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        Pessoa item = new Pessoa();

                        item.idPessoa = Convert.ToInt32(leitor.GetValue(0));
                        item.nome = leitor.obterString(2);
                        item.tipo = leitor.obterString(3);
                        item.razaoSocial = leitor.obterString(4);
                        item.numDocumento = leitor.obterString(5);
                        item.idDocumento = leitor.IsDBNull(6) ? 0 : Convert.ToInt32(leitor.GetValue(6));
                        item.email = leitor.obterString(7);
                        item.idGrupo = leitor.IsDBNull(8) ? 0 : Convert.ToInt32(leitor.GetValue(8));
                        item.idEndComercial = leitor.IsDBNull(9) ? 0 : Convert.ToInt32(leitor.GetValue(9));
                        item.idEndResidencial = leitor.IsDBNull(10) ? 0 : Convert.ToInt32(leitor.GetValue(10));
                        item.idEndEntrega = leitor.IsDBNull(11) ? 0 : Convert.ToInt32(leitor.GetValue(11));
                        item.idEndCobranca = leitor.IsDBNull(12) ? 0 : Convert.ToInt32(leitor.GetValue(12));
                        item.idEndCorresp = leitor.IsDBNull(13) ? 0 : Convert.ToInt32(leitor.GetValue(13));
                        item.nomeGrupo = leitor.obterString(14);
                        item.homePage = leitor.obterString(15);
                        item.idModuloRespon = leitor.IsDBNull(16) ? 0 : Convert.ToInt32(leitor.GetValue(16));
                        item.nomeModulo = leitor.obterString(17);


                        infPessoa = item;
                    }
                }

                return infPessoa;
            }
        }

        /// <summary>
        /// Obtem dados da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Endereco> obterEndPessoa(int idPessoa)
        {
            string query;

            // Consulta
            query = @" SELECT   ENDPESS.IDPESSOA , 
             ENDPESS.IDENDERECO ,  
             ENDPESS.LOGRADOURO , 
             ENDPESS.NUMERO , 
             ENDPESS.COMPLEMENTO , 
             ENDPESS.BAIRRO ,            
             ENDPESS.CEP , 
             ENDPESS.IDCIDADES, 
             C.NOME AS NOMECIDADE,
             E.IDESTADO, 
             E.NOMEESTADO, 
             P.IDPAIS, 
             P.NOMEPAIS, 
             ENDPESS.tipoendereco, 
             ENDPESS.nome, 
             NVL(PE.IDENDCORRESP,0) IDENDCORRESP , 
             NVL(PE.IDENDCOMERCIAL,0) IDENDCOMERCIAL,
             NVL(PE.IDENDENTREGA,0) IDENDENTREGA, 
             NVL(PE.IDENDRESIDENCIAL,0) IDENDRESIDENCIAL, 
             NVL(PE.IDENDCOBRANCA,0) IDENDCOBRANCA 
             FROM 
             CM.ENDPESS, 
             CM.CIDADES C, 
             CM.ESTADO E, 
             CM.PAIS P, 
             CM.PESSOA PE 
             WHERE 
             (E.IDPAIS = P.IDPAIS(+)) AND 
             (E.IDESTADO(+) = C.IDESTADO) AND 
             (C.IDCIDADES(+) = ENDPESS.IDCIDADES )
             AND (ENDPESS.IDPESSOA = PE.IDPESSOA) 
              AND  ( ENDPESS.IDPESSOA =  :ID_PESSOA_P ) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);

                // Popula objetos resultantes
                List<Endereco> endPessoa = new List<Endereco>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Endereco item = new Endereco()
                        {
                            idPessoa = Convert.ToInt32(leitor.GetValue(0)),
                            idEndereco = Convert.ToInt32(leitor.GetValue(1)),
                            logradouro = leitor.obterString(2),
                            numero = leitor.obterString(3),
                            complemento = leitor.obterString(4),
                            bairro = leitor.obterString(5),
                            cep = leitor.obterString(6),
                            cidade = new Cidade()
                            {
                                idCidade = leitor.IsDBNull(7) ? 0 : Convert.ToInt32(leitor.GetValue(7)),
                                nome = leitor.obterString(8)
                            },
                            uf = new UF()
                            {
                                idEstado = leitor.IsDBNull(9) ? 0 : Convert.ToInt32(leitor.GetValue(9)),
                                nome = leitor.obterString(10)
                            },
                            pais = new Pais()
                            {
                                idPais = leitor.IsDBNull(11) ? 0 : Convert.ToInt32(leitor.GetValue(11)),
                                nome = leitor.obterString(12)
                            },
                            tipoEndereco = leitor.obterString(13),
                            local = leitor.obterString(14),
                            endCorrespondencia = Convert.ToInt32(leitor.GetValue(15)) > 0,
                            endComercial = Convert.ToInt32(leitor.GetValue(16)) > 0,
                            endEntrega = Convert.ToInt32(leitor.GetValue(17)) > 0,
                            endResidencial = Convert.ToInt32(leitor.GetValue(18)) > 0,
                            endCobranca = Convert.ToInt32(leitor.GetValue(19)) > 0,
                        };
                        endPessoa.Add(item);
                    }
                }

                return endPessoa;
            }
        }

        /// <summary>
        /// Obtem dados da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public bool verificarVinculo(int idPessoa)
        {
            string query;

            // Consulta
            query = @" SELECT F.*, S.IDSITFUNC, S.DESCRICAO
             FROM CM.FUNCIONARIO F, CM.SITFUNC S
             WHERE S.IDSITFUNC = F.IDSITFUNC 
             AND S.TIPOSIT  IN ('A', 'F') 
             AND F.IDPESSOA =   :ID_PESSOA_P  ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);

                // Popula objetos resultantes


                bool vinculoPessoa = false;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        vinculoPessoa = true;
                    }
                }

                return vinculoPessoa;
            }
        }

        /// <summary>
        /// Obtem endereco selecionado da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação do endereco que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Endereco> obterEndSelecionado(int idEndereco)
        {
            string query;

            // Consulta
            query = @" SELECT   ENDPESS.IDPESSOA , 
             ENDPESS.IDENDERECO ,   
             ENDPESS.LOGRADOURO , 
             ENDPESS.NUMERO , 
             ENDPESS.COMPLEMENTO ,
             ENDPESS.BAIRRO ,            
             ENDPESS.CEP , 
             ENDPESS.IDCIDADES, 
             C.NOME AS NOMECIDADE, 
             E.IDESTADO, 
             E.NOMEESTADO, 
             P.IDPAIS,
             P.NOMEPAIS 
             FROM 
             CM.ENDPESS, 
             CM.CIDADES C, 
             CM.ESTADO E, 
             CM.PAIS P 
             WHERE 
             (E.IDPAIS = P.IDPAIS(+)) AND 
             (E.IDESTADO(+) = C.IDESTADO) AND 
             (C.IDCIDADES(+) = ENDPESS.IDCIDADES ) 
              AND  ( ENDPESS.IDENDERECO =  :ID_ENDERECO_P ) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_ENDERECO_P", DbType.Int32, idEndereco);

                // Popula objetos resultantes
                List<Endereco> endPessoa = new List<Endereco>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        Endereco item = new Endereco()
                        {
                            idPessoa = Convert.ToInt32(leitor.GetValue(0)),
                            idEndereco = Convert.ToInt32(leitor.GetValue(1)),
                            logradouro = leitor.obterString(2),
                            numero = leitor.obterString(3),
                            complemento = leitor.obterString(4),
                            bairro = leitor.obterString(5),
                            cep = leitor.obterString(6),
                            cidade = new Cidade()
                            {
                                idCidade = Convert.ToInt32(leitor.GetValue(7)),
                                nome = leitor.obterString(8)
                            },
                            uf = new UF()
                            {
                                idEstado = Convert.ToInt32(leitor.GetValue(9)),
                                nome = leitor.obterString(10)
                            },
                            pais = new Pais()
                            {
                                idPais = Convert.ToInt32(leitor.GetValue(11)),
                                nome = leitor.obterString(12)
                            },

                        };
                        endPessoa.Add(item);
                    }
                }

                return endPessoa;
            }
        }

        /// <summary>
        /// Obtem telefones da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Telefone> obterTelSelecionado(int idTelefone)
        {
            string query;

            // Consulta
            query = @" SELECT TELENDPESS.IDTELEFONE, 
             ENDPESS.IDPESSOA, 
             TELENDPESS.IDENDERECO, 
             TELENDPESS.DDI, 
             TELENDPESS.DDD, 
             TELENDPESS.NUMERO, 
             TELENDPESS.TIPO, 
             decode(TELENDPESS.TIPO,'C','Sim') AS Comercial, 
             decode(TELENDPESS.TIPO,'P','Sim') AS Particular, 
             decode(TELENDPESS.TIPO,'F','Sim') AS Fax, 
             decode(TELENDPESS.TIPO,'L','Sim') AS Celular, 
             decode(TELENDPESS.TIPO,'R','Sim') AS Recado 
             FROM CM.TELENDPESS, CM.ENDPESS 
             WHERE (TELENDPESS.IDENDERECO = ENDPESS.IDENDERECO)
             AND  ( TELENDPESS.IDTELEFONE =  :IDTELEFONE_P ) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "IDTELEFONE_P", DbType.Int32, idTelefone);

                // Popula objetos resultantes
                List<Telefone> telSelecionado = new List<Telefone>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        Telefone item = new Telefone()
                        {
                            idTelefone = Convert.ToInt32(leitor.GetValue(0)),
                            idPessoa = Convert.ToInt32(leitor.GetValue(1)),
                            idEndereco = Convert.ToInt32(leitor.GetValue(2)),
                            ddi = Convert.ToInt32(leitor.GetValue(3)),
                            ddd = Convert.ToInt32(leitor.GetValue(4)),
                            numero = leitor.obterString(5),
                            tipo = leitor.obterString(6),
                            telComercial = leitor.obterString(7),
                            telParticular = leitor.obterString(8),
                            telFax = leitor.obterString(9),
                            telCelular = leitor.obterString(10),
                            telRecado = leitor.obterString(11),
                        };
                        telSelecionado.Add(item);
                    }
                }

                return telSelecionado;
            }
        }

        /// <summary>
        /// obtem lista de documentos
        /// </summary>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>        
        /// <returns></returns>
        public List<Documento> obterDocumentos(string tipoPessoa)
        {
            string query;

            // Consulta
            query = @" select T.IDDOCUMENTO, T.NOMEDOCUMENTO from CM.TIPODOCPESSOA T 
              WHERE  ( T.FISICAJURIDICA =  :FISICAJURIDICA_P ) 
             ORDER BY T.IDDOCUMENTO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "FISICAJURIDICA_P", DbType.String, tipoPessoa);

                // Popula objetos resultantes
                List<Documento> listaDocumentos = new List<Documento>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Documento item = new Documento()
                        {
                            idDocumento = leitor.obterInt(0),
                            nome = leitor.obterString(1)
                        };
                        listaDocumentos.Add(item);
                    }
                }

                return listaDocumentos;
            }
        }

        /// <summary>
        /// obtem lista de UF
        /// </summary>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>        
        /// <returns></returns>
        public List<UF> obterUF()
        {
            string query;

            // Consulta
            query = @" SELECT E.IDESTADO, E.CODESTADO, E.NOMEESTADO  FROM CM.ESTADO E, CM.PAIS P 
            WHERE (E.IDPAIS = P.IDPAIS)  AND (P.IDPAIS = 1)  ORDER BY E.NOMEESTADO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Popula objetos resultantes
                List<UF> listaUF = new List<UF>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        UF item = new UF()
                        {
                            idEstado = Convert.ToInt32(leitor.GetValue(0)),
                            codEstado = leitor.obterString(1),
                            nome = leitor.obterString(2)
                        };
                        listaUF.Add(item);
                    }

                }

                return listaUF;
            }
        }

        //William Moreira da Silva
        /// <summary>
        /// obtem lista de Cidade
        /// </summary>
        /// <param name="idCidade">Identificador do id da cidade para filtro.</param>       
        /// <returns>Informações de estado e pais de aconrdo com a cidade</returns>
        public Cidade obterInfosCidade(int idCidade)
        {
            string query;

            // Consulta
            query = @" SELECT C.IDCIDADES, C.NOME AS NOMECIDADE,  
             E.IDESTADO, E.NOMEESTADO, 
             P.IDPAIS, P.NOMEPAIS 
             FROM CM.CIDADES C, CM.ESTADO E, 
             PAIS P  WHERE (C.IDESTADO = E.IDESTADO) 
             AND (E.IDPAIS = P.IDPAIS) AND 
             (C.IDCIDADES = :IDCIDADE) ORDER BY C.NOME ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idCidade);

                Cidade cidade = new Cidade();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    if (leitor.Read())
                    {
                        cidade.idCidade = Convert.ToInt32(leitor.GetValue(0));
                        cidade.nome = leitor.obterString(1);
                        cidade.estado = new UF()
                        {
                            idEstado = Convert.ToInt32(leitor.GetValue(2)),
                            nome = leitor.obterString(3)
                        };
                        cidade.pais = new Pais()
                        {
                            idPais = Convert.ToInt32(leitor.GetValue(4)),
                            nome = leitor.obterString(5)
                        };
                    }
                }

                return cidade;
            }
        }

        /// <summary>
        /// obtem lista de Cidade
        /// </summary>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>        
        /// <returns></returns>
        public List<Cidade> obterCidades()
        {
            string query;

            // Consulta
            query = @" SELECT C.IDCIDADES, C.NOME AS NOMECIDADE, E.NOMEESTADO, p.nomepais 
             FROM CM.CIDADES C, CM.ESTADO E, CM.PAIS P  WHERE (C.IDESTADO = E.IDESTADO) 
             AND (E.IDPAIS = P.IDPAIS) AND (P.IDPAIS = 1)  ORDER BY C.NOME ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Popula objetos resultantes
                List<Cidade> listaCidades = new List<Cidade>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        Cidade item = new Cidade()
                        {
                            idCidade = Convert.ToInt32(leitor.GetValue(0)),
                            nome = leitor.obterString(1),
                            estado = new UF()
                            {
                                nome = leitor.obterString(2)
                            },
                            pais = new Pais()
                            {
                                nome = leitor.obterString(3)
                            }
                        };
                        listaCidades.Add(item);
                    }

                }

                return listaCidades;
            }
        }

        /// <summary>
        /// obtem lista de UF
        /// </summary>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>        
        /// <returns></returns>
        public List<Pais> obterPais()
        {
            string query;
            // Consulta
            query = @" SELECT p.idpais, p.nomepais   FROM CM.PAIS P   ORDER BY p.nomepais ";
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Popula objetos resultantes
                List<Pais> listaPais = new List<Pais>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Pais item = new Pais()
                        {
                            idPais = Convert.ToInt32(leitor.GetValue(0)),
                            nome = leitor.obterString(1)
                        };
                        listaPais.Add(item);
                    }
                }

                return listaPais;
            }
        }

        /// <summary>
        /// Obtem dados da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Contato> obterContPessoa(int idPessoa)
        {
            string query;

            // Consulta
            query = @" SELECT   CONTATOPESS.IDCONTATO , 
             ENDPESS.IDPESSOA ,               
             CONTATOPESS.IDENDERECO ,         
             CONTATOPESS.NOME ,               
             CONTATOPESS.EMAIL ,              
             CONTATOPESS.CARGO ,              
             CONTATOPESS.SETOR,               
             CONTATOPESS.NASCIMENTO,          
             CONTATOPESS.OBS,                 
             TELCONTATO.IDTELEFONE, 
             TELCONTATO.IDTELCONTATO 
             FROM CM.CONTATOPESS , CM.ENDPESS, CM.TELCONTATO 
             WHERE  
             ( CONTATOPESS.IDENDERECO = ENDPESS.IDENDERECO ) 
             AND (TELCONTATO.IDCONTATO(+) = CONTATOPESS.IDCONTATO)  
              AND  ( ENDPESS.IDPESSOA =  :ID_PESSOA_P ) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);

                // Popula objetos resultantes
                List<Contato> contPessoa = new List<Contato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Contato item = new Contato()
                        {
                            idContato = Convert.ToInt32(leitor.GetValue(0)),
                            idPessoa = Convert.ToInt32(leitor.GetValue(1)),
                            idEndereco = Convert.ToInt32(leitor.GetValue(2)),
                            nome = leitor.obterString(3),
                            email = leitor.obterString(4),
                            cargo = leitor.obterString(5),
                            setor = leitor.obterString(6),
                            nascimento = leitor.GetDateTime(7),
                            obs = leitor.obterString(8),
                            telefone = string.Empty,
                            idTelefone = Convert.ToInt32(leitor.GetValue(9)),
                            idTelContato = Convert.ToInt32(leitor.GetValue(10))
                        };
                        contPessoa.Add(item);
                    }
                }

                return contPessoa;
            }
        }

        /// <summary>
        /// Obtem telefones da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Telefone> obterTelPessoa(int idPessoa)
        {
            string query;

            // Consulta
            query = @" SELECT TELENDPESS.IDTELEFONE, 
             ENDPESS.IDPESSOA, 
             TELENDPESS.IDENDERECO, 
             TELENDPESS.DDI,        
             TELENDPESS.DDD,        
             TELENDPESS.NUMERO,     
             TELENDPESS.TIPO,       
             decode(TRIM(TELENDPESS.TIPO),'C','Sim') AS Comercial, 
             decode(TRIM(TELENDPESS.TIPO),'P','Sim') AS Particular, 
             decode(TRIM(TELENDPESS.TIPO),'F','Sim') AS Fax, 
             decode(TRIM(TELENDPESS.TIPO),'L','Sim') AS Celular, 
             decode(TRIM(TELENDPESS.TIPO),'R','Sim') AS Recado, 
             TELCONTATO.IDCONTATO,            
             TELCONTATO.IDTELCONTATO         
             FROM CM.TELENDPESS, CM.ENDPESS, CM.TELCONTATO  
             WHERE (TELENDPESS.IDENDERECO = ENDPESS.IDENDERECO) 
             AND (TELCONTATO.IDTELEFONE(+) = TELENDPESS.IDTELEFONE)
             AND TELENDPESS.NUMERO IS NOT NULL
             AND  ( ENDPESS.IDPESSOA =  :ID_PESSOA_P ) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);

                // Popula objetos resultantes
                List<Telefone> telPessoa = new List<Telefone>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Telefone item = new Telefone()
                        {
                            idTelefone = Convert.ToInt32(leitor.GetValue(0)),
                            idPessoa = Convert.ToInt32(leitor.GetValue(1)),
                            idEndereco = Convert.ToInt32(leitor.GetValue(2)),
                            ddi = leitor.IsDBNull(3) ? 55 : Convert.ToInt32(leitor.GetValue(3)),
                            ddd = leitor.IsDBNull(4) ? 0 : Convert.ToInt32(leitor.GetValue(4)),
                            numero = leitor.obterString(5),
                            tipo = leitor.obterString(6),
                            telComercial = leitor.obterString(7),
                            telParticular = leitor.obterString(8),
                            telFax = leitor.obterString(9),
                            telCelular = leitor.obterString(10),
                            telRecado = leitor.obterString(11),
                            idContato = leitor.IsDBNull(12) ? 0 : Convert.ToInt32(leitor.GetValue(12)),
                            idTelContato = leitor.IsDBNull(13) ? 0 : Convert.ToInt32(leitor.GetValue(13))
                        };
                        telPessoa.Add(item);
                    }
                }

                return telPessoa;
            }
        }

        /// <summary>
        /// Obtem telefones da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public Avalistas obterAvalistaPessoa(int idPessoa)
        {
            string query;

            query = @"SELECT av.idavalista,
       pes.nome, 
       to_char(av.origemrend), 
       to_char(av.rendacomp), 
       to_char(av.margemconsig), 
       RTRIM(NVL(av.cpf, pes.numdocumento)),
       pes.razaosocial
FROM CM.avalista av
     JOIN CM.pessoa pes ON av.idavalista = pes.idpessoa
WHERE idavalista = :ID_PESSOA_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros            
                bancoDeDados.AddInParameter(comando, "ID_PESSOA_P", DbType.Int32, idPessoa);
                // Popula objetos resultantes
                Avalistas avalista = new Avalistas();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        avalista.id = Convert.ToInt32(leitor.GetValue(0));
                        avalista.nome = leitor.obterString(1);
                        avalista.origem = leitor.obterString(2);
                        avalista.renda = (double)leitor.obterDecimal(3);
                        avalista.margem = (double)leitor.obterDecimal(4);
                        avalista.cpf = leitor.obterString(5);
                        avalista.razaoSocial = leitor.obterString(6);
                    }
                }

                return avalista;
            }
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
            string query;

            bool buscarNumero = numeroContrato > 0;
            bool buscarMutuario = idMutuario > 0;
            bool buscarDadoBancario = idDadosBancario > 0;

            // Consulta

            query = @" SELECT 
               CTB.IDCBANCARIA, 
               NVL(CTB.FLGCONTAPREF, 0) AS FLGCONTAPREF, 
               CTB.TIPOCONTA, 
               AGB.IDBANCO, 
               BAN.NOME AS BANCO, 
               AGB.NUMAGENCIA AS AGENCIA, 
               CTB.CONTACORRENTE AS CONTA_CORRENTE, 
               BAN.NOME || ' - ' || AGB.NUMAGENCIA || ' - ' || CTB.CONTACORRENTE AS DADOS, 
               BCO.NUMBANCO 
            FROM 
               CM.PESSOA          BAN, 
               CM.AGENCIABANCARIA AGB, 
               CM.BANCO           BCO, ";

            if (buscarNumero)
                query = query + @" CONTRATOEMPTMO CON, ";

            query = query + @" CM.CONTABANCARIA   CTB ";

            query = query + @" WHERE CTB.IDAGENCIA = AGB.IDPESSOA
               AND AGB.IDBANCO   = BAN.IDPESSOA 
               AND BAN.IDPESSOA  = BCO.IDPESSOA
               AND CTB.tipoconta <> 2
               AND AGB.IDBANCO = 91008";

            if (buscarMutuario)
                query = query + @" AND CTB.IDPESSOA = :IDMUTUARIO_P ";

            if (buscarDadoBancario)
                query = query + @" AND CTB.IDCBANCARIA = :IDDADOSBANCARIO_P  ";

            if (buscarNumero)
            {
                query = query + @" AND CON.IDCBANCARIA =  CTB.IDCBANCARIA 
                 AND CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ";
            }

            query = query + @" ORDER BY 
               NVL(CTB.FLGCONTAPREF, 0) DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                // Parâmetros
                if (buscarMutuario)
                    bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);

                if (buscarDadoBancario)
                    bancoDeDados.AddInParameter(comando, "IDDADOSBANCARIO_P", DbType.Int32, idDadosBancario);

                if (buscarNumero)
                    bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                // Executa a consulta
                List<DadosBancarios> dadosBancarios = new List<DadosBancarios>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        DadosBancarios dado = new DadosBancarios()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDCBANCARIA)),
                            banco = Convert.ToInt32(leitor.GetValue(IDBANCO)),
                            agencia = leitor.obterString(NUMAGENCIA),
                            nomeBanco = leitor.obterString(NOMEBANCO),
                            numeroBanco = leitor.obterString(NUMEROBANCO),
                            contaCorrente = leitor.obterString(CONTACORRENTE),
                            dados = leitor.obterString(DADOS),
                            contraPreferencial = Convert.ToInt32(leitor.GetValue(FLAGCONTAPREF))
                        };

                        if (dadosBancarios == null)
                            dadosBancarios = new List<DadosBancarios>();

                        dadosBancarios.Add(dado);
                    }
                }

                return dadosBancarios;
            }
        }

        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início

        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="matricula">Número da matrícula.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public List<DadosBancarios> consultarContaBancaria(string matricula)
        {
            string query;

            query = @"SELECT cb.idcbancaria,
                       SUBSTR(ab.numagencia, 1, 4) AS AGENCIA,
                       SUBSTR(cb.contacorrente, 1, 3) AS OPERACAO,
                       SUBSTR(REPLACE(cb.contacorrente, '-'), 4, 8) || '-' ||
                       SUBSTR(REPLACE(cb.contacorrente, '-'), 12, 1) AS CONTA,
                       cb.flgcontapref
                  FROM CM.contabancaria cb
                  JOIN CM.depentit d
                    ON d.idpessoa = cb.idpessoa
                  JOIN CM.agenciabancaria ab
                    ON ab.idpessoa = cb.idagencia
                 WHERE d.matricula = :MATRICULA_P
                   AND ab.idbanco = 91008
                   AND SUBSTR(cb.contacorrente, 1, 3) <> '037'
                   AND (ab.idbanco = 91008 AND cb.flgcontapref = 1 AND EXISTS
                        (SELECT 1
                           FROM CM.contabancaria cb1
                           JOIN CM.agenciabancaria ab1
                             ON ab1.idpessoa = cb1.idagencia
                          WHERE cb1.idpessoa = cb.idpessoa
                            AND ab1.idbanco = 91008
                            AND cb1.flgcontapref = 1) OR NOT EXISTS
                        (SELECT 1
                           FROM CM.contabancaria cb1
                           JOIN CM.agenciabancaria ab1
                             ON ab1.idpessoa = cb1.idagencia
                          WHERE cb1.idpessoa = cb.idpessoa
                            AND ab1.idbanco = 91008
                            AND cb1.flgcontapref = 1))";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, matricula);

                List<DadosBancarios> dadosBancarios = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        DadosBancarios dado = new DadosBancarios()
                        {
                            id = Convert.ToInt32(leitor.GetValue(0)), // IDCBANCARIA
                            agencia = leitor.obterString(1), // AGENCIA
                            operacao = leitor.obterString(2), // OPERACAO
                            contaCorrente = leitor.obterString(3), // CONTA CORRENTE
                            contraPreferencial = Convert.ToInt32(leitor.GetValue(4)) // FLGCONTAPREFERENCIAL
                        };

                        if (dadosBancarios == null)
                            dadosBancarios = new List<DadosBancarios>();

                        dadosBancarios.Add(dado);
                    }
                }

                return dadosBancarios;
            }
        }
        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - fim

        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Inicio
        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="PIdCBancaria">Identificação dos dados Bancários</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancariaOperacao(int PIdCBancaria)
        {
            string query;

            // Consulta

            query = @" SELECT CTB.IDCBANCARIA, 
                              CTB.CONTACORRENTE, 
                              BCO.IDPESSOA, 
                              CTB.TIPOCONTA
            FROM 
             CM.PESSOA BAN, CM.AGENCIABANCARIA AGB, CM.BANCO BCO, CM.CONTABANCARIA CTB 
             WHERE CTB.IDAGENCIA = AGB.IDPESSOA 
             AND AGB.IDBANCO = BAN.IDPESSOA 
             AND BAN.IDPESSOA = BCO.IDPESSOA 
             AND CTB.IDCBANCARIA = :IDCBANCARIA_P 
             ORDER BY NVL(CTB.FLGCONTAPREF, 0) DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDCBANCARIA_P", DbType.Int32, PIdCBancaria);

                // Executa a consulta
                DadosBancarios dadosBancarios = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        dadosBancarios = new DadosBancarios()
                        {
                            id = Convert.ToInt32(leitor.GetValue(0)),
                            contaCorrente = leitor.obterString(1),
                            banco = Convert.ToInt32(leitor.GetValue(2)),
                            Tipo = Convert.ToInt32(leitor.GetValue(3))
                        };

                    }
                }

                return dadosBancarios;
            }
        }
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Fim

        // Thiago Melo SOL 209377 Kintana 2021339
        /// <summary>
        /// Consulta nome do responsavel
        /// </summary>
        /// <param name="idPessoa">Identificação do titular</param>
        /// <param name="idBenef">Identificação do mutuário</param>                
        public string retornaNomeResponsavel(int idPessoa, int idBenef)
        {
            string query;

            query = @" SELECT 
               BTP.IDRESPONNAOREC AS IDRESPONSAVEL, 
               PES.NOME AS NOMERESPONSAVEL 
              FROM 
               CM.BENEFBFCIARIO BFC, CM.BFCIARIOTITPLAN BTP, CM.PESSOA PES 
             WHERE 
                   IDSITBENEFICIO      IN (1,2,7) 
               AND BFC.IDTITULAR       = :IDPESSOA_P 
               AND BFC.IDPESSOA        = :IDBENEF_P 
               AND BFC.IDTITULAR       = BTP.IDTITULAR 
               AND BFC.IDPESSOA        = BTP.IDPESSOA 
               AND BFC.IDBENEFICIO     = BTP.IDBENEFICIO 
               AND BTP.IDRESPONNAOREC  = PES.IDPESSOA 
               AND BFC.IDPLANOPREV     = BTP.IDPLANOPREV 
               AND ( DATAFIMRECEB IS NULL OR DATAFIMRECEB > SYSDATE ) ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int64, idPessoa);
                bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int64, idBenef);

                string nomeresponsavel = "";
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        nomeresponsavel = leitor.obterString(1);
                    }
                }

                return nomeresponsavel;
            }
        }
        // Thiago Melo SOL 209377 Kintana 2021339


        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancaria(long numeroContrato)
        {
            string query;

            bool buscarNumero = numeroContrato > 0;

            // Consulta
            query = @" SELECT 
               CTB.IDCBANCARIA, 
               NVL(CTB.FLGCONTAPREF, 0) AS FLGCONTAPREF, 
               CTB.TIPOCONTA, 
               AGB.IDBANCO, 
               BAN.NOME AS BANCO, 
               AGB.NUMAGENCIA AS AGENCIA, 
               CTB.CONTACORRENTE AS CONTA_CORRENTE, 
               BAN.NOME || ' - ' || AGB.NUMAGENCIA || ' - ' || CTB.CONTACORRENTE AS DADOS 
            FROM 
               CM.PESSOA          BAN, 
               CM.AGENCIABANCARIA AGB, ";

            if (buscarNumero)
                query = query + @" CONTRATOEMPTMO CON, ";

            query = query + @" CM.CONTABANCARIA   CTB 

            WHERE CTB.IDAGENCIA = AGB.IDPESSOA 
               AND AGB.IDBANCO   = BAN.IDPESSOA ";

            if (buscarNumero)
            {
                query = query + @" AND CON.IDCBANCARIA =  CTB.IDCBANCARIA 
                 AND CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ";
            }

            query = query + @"  ORDER BY 
               NVL(CTB.FLGCONTAPREF, 0) DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

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
                            id = Convert.ToInt32(leitor.GetValue(IDCBANCARIA)),
                            banco = Convert.ToInt32(leitor.GetValue(IDBANCO)),
                            agencia = leitor.obterString(NUMAGENCIA),
                            nomeBanco = leitor.obterString(NOMEBANCO),
                            contaCorrente = leitor.obterString(CONTACORRENTE),
                            dados = leitor.obterString(DADOS),
                            contraPreferencial = Convert.ToInt32(leitor.GetValue(FLAGCONTAPREF))
                        };

                    }
                }

                return dadosBancarios;
            }
        }

        // Fernando Francisco Xavier - SOL 238824 PPM 508902
        /// <summary>
        /// Consulta a conta bancária Debito do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancariaDebito(long numeroContrato)
        {
            string query;

            bool buscarNumero = numeroContrato > 0;

            // Consulta
            query = @" SELECT 
               CTB.IDCBANCARIA, 
               NVL(CTB.FLGCONTAPREF, 0) AS FLGCONTAPREF, 
               CTB.TIPOCONTA, 
               AGB.IDBANCO, 
               BAN.NOME AS BANCO, 
               AGB.NUMAGENCIA AS AGENCIA, 
               CTB.CONTACORRENTE AS CONTA_CORRENTE, 
               BAN.NOME || ' - ' || AGB.NUMAGENCIA || ' - ' || CTB.CONTACORRENTE AS DADOS 
            FROM 
               CM.PESSOA          BAN, 
               CM.AGENCIABANCARIA AGB, ";

            if (buscarNumero)
                query = query + @" CONTRATOEMPTMO CON, ";

            query = query + @" CM.CONTABANCARIA   CTB 

            WHERE CTB.IDAGENCIA = AGB.IDPESSOA 
               AND AGB.IDBANCO   = BAN.IDPESSOA ";

            if (buscarNumero)
            {
                query = query + @" AND CON.IDCBANCARIADEB =  CTB.IDCBANCARIA 
                 AND CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ";
            }

            query = query + @"  ORDER BY 
               NVL(CTB.FLGCONTAPREF, 0) DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

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
                            id = Convert.ToInt32(leitor.GetValue(IDCBANCARIA)),
                            banco = Convert.ToInt32(leitor.GetValue(IDBANCO)),
                            agencia = leitor.obterString(NUMAGENCIA),
                            nomeBanco = leitor.obterString(NOMEBANCO),
                            contaCorrente = leitor.obterString(CONTACORRENTE),
                            dados = leitor.obterString(DADOS),
                            contraPreferencial = Convert.ToInt32(leitor.GetValue(FLAGCONTAPREF))
                        };

                    }
                }

                return dadosBancarios;
            }
        }
        // Fernando Francisco Xavier - SOL 238824 PPM 508902

        //BRUNO AZEVEDO - SOL 164198
        /// <summary>
        /// Consulta se o mutuário está bloqueado por plano ou não.
        /// </summary>
        public bool consultarBloqueioPlanoPrevidenciario(int idplanoprev, string idplanocontabil)
        {
            string query;

            // Consulta
            query = @" SELECT sxp.idplanoprev, 
                    sxp.idplanoprevcontabil, 
                    sxp.dtinicio, 
                    sxp.dtfim, 
                    sxp.flgprazoindeterminado  
               FROM CM.suspxplanoprevemptmo sxp 
              WHERE sxp.idplanoprev = :IDPLANOPREV_P 
                AND sxp.dtinicio <= TRUNC(SYSDATE) 
                AND (sxp.dtfim >= TRUNC(SYSDATE) OR sxp.dtfim IS NULL) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

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
                        sIdPlanoPrev = leitor.obterString(0);
                        sIdPlanosContabeis = leitor.obterString(1);

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
            FROM CM.contabancaria cb 
                 JOIN CM.agenciabancaria ab ON ab.idpessoa = cb.idagencia
            WHERE cb.idcbancaria = :IDCONTA_P");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString()))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDCONTA_P", DbType.Int64, idContaBancaria);

                // Executa a consulta
                int iIdConta = 0;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        iIdConta = Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                return iIdConta;
            }
        }
        //BRUNO AZEVEDO - SOL 167098

        /// <summary>
        /// Pesquisa as Contas da Caixa no sistema.
        /// </summary>
        /// <returns>Uma lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ContaCaixa"/> com os dados encontrados.</returns>
        public List<ContaCaixa> listarContaCaixa()
        {
            string query;

            // Consulta
            query = @" SELECT PF.CODPORTFORMA, PF.DESCRICAO, PF.RECPAG, PAR.PORTFORMAPAGTO, PF.IDCONFIGBARRAS
              FROM CM.PORTADORFORMA PF, CM.PARAMEMPTMO PAR 
             WHERE PF.CODPORTFORMA = PAR.PORTFORMAPAGTO(+) 
               AND PF.IDPESSOA = 1 
               AND NVL(PF.FLGATIVO, 'S') = 'S' 
               AND (NOT EXISTS 
                    (SELECT * 
                       FROM CM.PORTFORMAXMODULO PFM, CM.PORTADORFORMA PFO 
                      WHERE PFM.CODPORTFORMA = PFO.CODPORTFORMA) OR EXISTS 
                    (SELECT * FROM CM.PORTFORMAXMODULO WHERE CODPORTFORMA = PF.CODPORTFORMA)) 
             ORDER BY PF.DESCRICAO, PF.RECPAG ";


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                List<ContaCaixa> listaContaCaixa = new List<ContaCaixa>();
                ContaCaixa contaCaixa = null;
                // Executa a consulta
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        contaCaixa = new ContaCaixa
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDPORTOFORMA_CONTACAIXA)),
                            descricao = leitor.obterString(DESCRICAO_CONTACAIXA),
                            recPagamento = leitor.obterString(RECPAG_CONTACAIXA),
                            portFormaPagamento = leitor.obterValorInteiro(PORTFORMPAGTO),
                            configBarras = leitor.obterValorInteiro(CONFIG_BARRAS)
                        };
                        listaContaCaixa.Add(contaCaixa);
                    }
                }

                return listaContaCaixa;
            }
        }

        /// <summary>
        /// Lista tipo de recurso.
        /// </summary>
        public List<TipoRecurso> listarTipoRecurso()
        {
            string query;

            // Consulta
            query = @" SELECT IDTIPORECURSO, NOME 
             FROM CM.TIPORECURSO 
             WHERE IDMODULO = 15 OR IDMODULO IS NULL ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                List<TipoRecurso> listaTipoRecurso = new List<TipoRecurso>();

                // Executa a consulta
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        TipoRecurso tipo = new TipoRecurso()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPORECURSO)),
                            descricao = leitor.obterString(NOME_TIPORECURSO)
                        };

                        listaTipoRecurso.Add(tipo);
                    }
                }

                return listaTipoRecurso;
            }
        }

        /// <summary>
        /// Verifica se o mutuário tem uma assinatura.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <param name="idTipoContrato">Identificador do tipo de contraro para filtro.</param>
        /// <returns>Dados da assinatura para validação.</returns>        
        public Assinatura verificarAssinatura(int idTitular, int idMutuario, int idTipoContrato)// Thiago Melo SOL 204452 KTN 1976411
        {
            string query;

            // Consulta
            query = @" SELECT 
               ACP.IDPESSOA, ACP.IDBENEF, 
               ACP.IDCONTRATOPADRAO, 
               ACP.ACPDATAASSINAT, 
               CTP.CTPDATAINICIO, 
               SIT.FLGINTERNO, 
               PPP.IDPLANOPREV, 
               NVL(ACP.FLGBLOQUEIO, 0) AS FLGBLOQUEIO, 
               NVL(CTP.CTPOBRIGATORIO, 0) AS CTPOBRIGATORIO 
            FROM 
               CM.ASSINCONTRPADRAO     ACP, 
               CM.CONTRATOPADRAO       CTP, 
               CM.CONTRPADRXTIPOCONTR  CPT, 
               CM.PARTPREVPLAN         PPP, 
               CM.TIPOCONTREMPTMO      TCE, 
               CM.SITPART              SIT, 
               CM.DEPENTIT             DEP 
            WHERE 
               ACP.IDPESSOA               = :IDTITULAR_P
               AND ACP.IDBENEF            = :IDBENEF_P
               AND CPT.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P 
               AND ACP.IDCONTRATOPADRAO   = CTP.IDCONTRATOPADRAO 
               AND CTP.IDCONTRATOPADRAO   = CPT.IDCONTRATOPADRAO 
               AND TCE.IDTIPOCONTREMPTMO  = CPT.IDTIPOCONTREMPTMO(+) 
               AND ACP.IDPESSOA           = DEP.IDTITULAR 
               AND ACP.IDBENEF            = DEP.IDPESSOA 
               AND PPP.IDSITPART          = SIT.IDSITPART 
               AND ACP.IDPESSOA           = PPP.IDPESSOA 
               AND PPP.FLGDESATIVADO      = 0 ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
                            flagBloqueio = Convert.ToInt32(leitor.GetValue(FLGBLOQUEIO_ASSINATURA)),
                            idContratoPadrao = leitor.obterInt(2),
                            dataAssinatura = (DateTime) leitor.obterValorData(3)
                    };
                    }
                }

                return dadosAssinatura;
            }
        }

        /// <summary>
        ///  Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.OutrasDividas"/> com a(s) Outra(s) Divida(s) encontrada(s).</returns>
        public List<OutrasDividas> consultarOutrasDividas(Int32 idMutuario)
        {
            string query;

            // Consulta
            //William Moreira da Silva - SOL 204977 KTN 1982395 - Madança na QUERY
            /* SELECT 'Previdenciária' AS TIPO, ");
             DECODE(SUBSTR(MESREFERENCIA,6,12),'01', 'Janeiro/'  || SUBSTR(MESREFERENCIA,1,4), ");
             '02', 'Fevereiro/'|| SUBSTR(MESREFERENCIA,1,4),               ");
             '03', 'Março/'    || SUBSTR(MESREFERENCIA,1,4),               ");
             '04', 'Abril/'    || SUBSTR(MESREFERENCIA,1,4),               ");
             '05', 'Maio/'     || SUBSTR(MESREFERENCIA,1,4),               ");
             '06', 'Junho/'    || SUBSTR(MESREFERENCIA,1,4),               ");
             '07', 'Julho/'    || SUBSTR(MESREFERENCIA,1,4),               ");
             '08', 'Agosto/'   || SUBSTR(MESREFERENCIA,1,4),               ");
             '09', 'Setembro/' || SUBSTR(MESREFERENCIA,1,4),               ");
             '10', 'Outubro/'  || SUBSTR(MESREFERENCIA,1,4),               ");
             '11', 'Novembro/' || SUBSTR(MESREFERENCIA,1,4),               ");
             '12', 'Dezembro/' || SUBSTR(MESREFERENCIA,1,4),               ");
             '13','Contrib. sobre 13º Sal/' || SUBSTR(MESREFERENCIA,1,4),  ");
             SUBSTR(MESREFERENCIA,6,12) || '/' || SUBSTR(MESREFERENCIA,1,4)) AS MESREFERENCIA, ");
             DECODE(SUBSTR(MESCOBRANCA,6,12),'01', 'Janeiro/'  || SUBSTR(MESCOBRANCA,1,4),  ");
             '02', 'Fevereiro/'|| SUBSTR(MESCOBRANCA,1,4),  ");
             '03', 'Março/'    || SUBSTR(MESCOBRANCA,1,4),  ");
             '04', 'Abril/'    || SUBSTR(MESCOBRANCA,1,4),  ");
             '05', 'Maio/'     || SUBSTR(MESCOBRANCA,1,4),  ");
             '06', 'Junho/'    || SUBSTR(MESCOBRANCA,1,4),  ");
             '07', 'Julho/'    || SUBSTR(MESCOBRANCA,1,4),  ");
             '08', 'Agosto/'   || SUBSTR(MESCOBRANCA,1,4),  ");
             '09', 'Setembro/' || SUBSTR(MESCOBRANCA,1,4),  ");
             '10', 'Outubro/'  || SUBSTR(MESCOBRANCA,1,4),  ");
             '11', 'Novembro/' || SUBSTR(MESCOBRANCA,1,4),  ");
             '12', 'Dezembro/' || SUBSTR(MESCOBRANCA,1,4),  ");
             '13','Contrib. sobre 13º Sal/' || SUBSTR(MESCOBRANCA,1,4), ");
                   SUBSTR(MESCOBRANCA,6,12) || '/' || SUBSTR(MESCOBRANCA,1,4)) AS MESCOBRANCA, ");
             DATAPREVISAORECE,   0 AS NUMPARCELA, ");
             SUM(DECODE(FLGDEVOLUCAO,1,-VALORESPERADO,VALORESPERADO)) AS VALORCALCULADO ");
             FROM    CM.HSTCONTRIBPREV ");
            WHERE ");
            IDPESSOA = :IDMUTUARIO_P  ");
            //IDPESSOA =  390000 ");           
             AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0) ");
            AND DATAPREVISAORECE < TRUNC(SYSDATE) ");
             GROUP BY IDPESSOA,  MESREFERENCIA, MESCOBRANCA, DATAPREVISAORECE    ");*/


            query = @" SELECT 'Previdenciária' AS TIPO, 
             DECODE(SUBSTR(MESREFERENCIA, 6, 12), 
               '01', 'Janeiro/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '02', 'Fevereiro/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '03', 'Março/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '04', 'Abril/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '05', 'Maio/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '06', 'Junho/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '07', 'Julho/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '08', 'Agosto/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '09', 'Setembro/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '10', 'Outubro/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '11', 'Novembro/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '12', 'Dezembro/' || SUBSTR(MESREFERENCIA, 1, 4), 
               '13', 'Contrib. sobre 13º Sal/' || SUBSTR(MESREFERENCIA, 1, 4), 
             SUBSTR(MESREFERENCIA, 6, 12) || '/' || 
             SUBSTR(MESREFERENCIA, 1, 4)) AS MESREFERENCIA, 
             DECODE(SUBSTR(MESCOBRANCA, 6, 12), 
               '01', 'Janeiro/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '02', 'Fevereiro/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '03', 'Março/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '04', 'Abril/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '05', 'Maio/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '06', 'Junho/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '07', 'Julho/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '08', 'Agosto/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '09', 'Setembro/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '10', 'Outubro/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '11', 'Novembro/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '12', 'Dezembro/' || SUBSTR(MESCOBRANCA, 1, 4), 
               '13', 'Contrib. sobre 13º Sal/' || SUBSTR(MESCOBRANCA, 1, 4), 
               SUBSTR(MESCOBRANCA, 6, 12) || '/' || SUBSTR(MESCOBRANCA, 1, 4)) AS MESCOBRANCA, 
               DATAPREVISAORECE, 
               0 AS NUMPARCELA, 
               TO_CHAR(round(SUM(DECODE(FLGDEVOLUCAO, 1, -VALORESPERADO, VALORESPERADO)),2)) AS VALORCALCULADO 
                FROM CM.HSTCONTRIBPREV 
                WHERE IDPESSOA = :IDMUTUARIO_P 
                    AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0) 
                   AND DATAPREVISAORECE < TRUNC(SYSDATE) 
                 GROUP BY IDPESSOA, MESREFERENCIA, MESCOBRANCA, DATAPREVISAORECE ";
            //William Moreira da Silva - SOL 204977 KTN 1982395

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);

            //if (parametros != null && parametros.paginacao != null)
            //    comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            //else
            comando = bancoDeDados.GetSqlStringCommand(query);

            List<OutrasDividas> listaOutrasDividas = new List<OutrasDividas>();

            bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);

            // Executa a consulta
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    OutrasDividas outrasDividas = new OutrasDividas()
                    {
                        tipo = leitor.obterString(0), // TIPO
                        mesReferencia = leitor.obterString(1), // MESREFERENCIA
                        mesCobranca = leitor.obterString(2), // MESCOBRANCA   
                        dataPrevista = leitor.GetDateTime(3), //DATAPREVISTA
                        parcela = Convert.ToInt32(leitor.GetValue(4)), //PARCELA
                        valorCalculado = Convert.ToDouble(leitor.obterString(5)), //VALORCALCULADO                        
                    };
                    listaOutrasDividas.Add(outrasDividas);
                }
            }

            comando.Connection.Close();
            comando.Dispose();

            return listaOutrasDividas;
        }


        /// <summary>
        ///  Verifica se mutuário possui Avalistas.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Identificador do mutuário para filtro.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Avalistas"/> Avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarAvalistas(long idInscricaoEmptmo)
        {
            string query;

            // Consulta
            query = @" SELECT P.NOME,  A.RENDACOMP,   A.MARGEMCONSIG, A.IDAVALISTA 
             FROM   CM.CONTRATOXAVALISTA CA, CM.PESSOA P, CM.AVALISTA A 
             WHERE  A.IDAVALISTA = P.IDPESSOA 
             AND    CA.IDAVALISTA = A.IDAVALISTA 
             AND    CA.IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                List<Avalistas> listaAvalistas = new List<Avalistas>();

                bancoDeDados.AddInParameter(comando, "IDINSCRICAOEMPTMO_P", DbType.Int64, idInscricaoEmptmo);

                // Executa a consulta
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Avalistas Avalistas = new Avalistas()
                        {
                            nome = leitor.obterString(0), // Nome
                            renda = (double)leitor.obterDecimal(1), // Renda
                            margem = (double)leitor.obterDecimal(2), // Margem
                            id = Convert.ToInt32(leitor.GetValue(3)), // idAvalista

                        };
                        listaAvalistas.Add(Avalistas);
                    }
                }

                return listaAvalistas;
            }
        }

        /// <summary>
        /// Consulta contratos em aberto do mutuário
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) Contrato(s) encontrado(s).</returns>
        //Willamy SOL 219089
        public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoemprestimo, int idTipoContrato, DateTime dataCredito)// Thiago Melo SOL 206149
        {

            //StringBuilder query = new StringBuilder();

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO
            string query = $@" SELECT CON.IDCONTRATOEMPTMO AS CONTRATO,
       TCE.IDTIPOCONTREMPTMO AS ID_TIPO_CONTRATO,
       TCE.TCEDESCRICAO AS TIPO_CONTRATO,
       TO_CHAR(CON.VLRCONTRATO) AS VLR_CONTRATO,
       CON.DATACREDITO AS DATA_CREDITO,
       CON.NUMPARCELAS AS PRAZO,
       TO_CHAR(CON.VLRPARCELA) AS PARCELA,
        TO_CHAR(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(CON.IDCONTRATOEMPTMO, TO_DATE('{dataCredito:dd/MM/yyyy}', 'DD/MM/YYYY'))) SALDO_DEV,       
        TO_CHAR(NVL(CM.PCK_EMPRESTIMO.FN_VALOREMABERTO_CONCESSAO(CON.IDCONTRATOEMPTMO, TO_DATE('{dataCredito:dd/MM/yyyy}', 'DD/MM/YYYY'), 7), 0)) VLREMABERTO,
        NVL(CM.PCK_EMPRESTIMO.FN_QUANTPARCELASPAGAS(CON.IDCONTRATOEMPTMO), 0) NUMPARCPAGAS,       
        CM.PCK_EMPRESTIMO.FN_DATAVALOREMABERTO_CONCESSAO(CON.IDCONTRATOEMPTMO, TO_DATE('{dataCredito:dd/MM/yyyy}', 'DD/MM/YYYY'), 7) DATA_VENCIMENTO,
       CON.DATAFIMSUSP,
       CON.IDTIPOSUSPEMPTMO,
       CON.FLGPERDAEFETIVA
  FROM CONTRATOEMPTMO CON
                      JOIN CM.TIPOCONTREMPTMO TCE
                        ON CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO
                     WHERE con.idbenef IN
                           ((SELECT p.idpessoa
                              FROM CM.pessoa p";
            if (idMutuario != idTitular)
            {
                query = query + $@" WHERE CON.IDBENEF = {idMutuario}
   AND CON.IDPESSOA = {idTitular}
                              AND CON.idbenef <> CON.idpessoa )) ";
            }
            else
            {
                query = query + $@" WHERE p.numdocumento =
                                   (SELECT p2.numdocumento
                                      FROM CM.pessoa p2
                                                  WHERE p2.idpessoa = {idMutuario})))
                             AND con.idbenef = con.idpessoa";
            }
            query = query + $@" AND TCE.IDTIPOEMPTMO = {idTipoemprestimo}
   AND CON.FLGSITUACAO NOT IN ('C', 'Q')
                       AND CON.IDTIPOCONTREMPTMO IN
                           (SELECT IDTIPOCONTRQUIT
                                 FROM CM.TIPOCONTRXQUIT
                                 WHERE IDTIPOCONTREMPTMO = {idTipoContrato})
                      AND (NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(CON.IDCONTRATOEMPTMO, TO_DATE('{dataCredito:dd/MM/yyyy}', 'DD/MM/YYYY')),1) >  0 OR
                           CM.PCK_EMPRESTIMO.FN_VALOREMABERTO_CONCESSAO(CON.IDCONTRATOEMPTMO, TO_DATE('{dataCredito:dd/MM/yyyy}', 'DD/MM/YYYY'), 7) > 0)
                     ORDER BY CON.IDCONTRATOEMPTMO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString()))
            {

                List<Contrato> contratos = new List<Contrato>();

                // Executa a consulta
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Contrato contrato = new Contrato();
                        contrato.numero = Convert.ToInt64(leitor.GetValue(0));
                        contrato.tipo = new TipoContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(1)),
                            descricao = leitor.obterString(2)
                        };
                        contrato.valorContrato = leitor.obterValorDecimal(3) != null ? (double?)leitor.obterValorDecimal(3) : null;
                        contrato.dataCredito = leitor.obterValorData(4);
                        contrato.totalParcelas = Convert.ToInt32(leitor.GetValue(5));
                        contrato.valorParcela = leitor.obterValorDecimal(6) != null ? (double?)leitor.obterValorDecimal(6) : null;
                        contrato.saldoDevedor = leitor.obterValorDecimal(7).HasValue ? (double)leitor.obterValorDecimal(7).Value : 0;
                        contrato.valorEmAberto = leitor.obterValorDecimal(8).HasValue ? (double)leitor.obterValorDecimal(8).Value : 0;
                        contrato.parcelasPagas = Convert.ToInt32(leitor.GetValue(9));
                        contrato.dataVencimento = leitor.obterValorData(10).HasValue ? leitor.obterValorData(10).Value : DateTime.MinValue; // SOL 230843
                        contrato.dataFimSuspensao = leitor.obterValorData(11);
                        contrato.suspensao = new Suspensao()
                        {
                            tipo = new TipoSuspensao { id = leitor.obterValorInteiro(12) == null ? 0 : Convert.ToInt32(leitor.GetValue(12)) }
                        };
                        //Sadi Freire Sol213592_Kintana2040335
                        if (Convert.ToInt32(leitor.GetValue(13)) == 1)
                        {
                            contrato.efetiva = true;
                        }
                        else
                        {
                            contrato.efetiva = false;
                        }
                        // contrato.efetiva = leitor.GetBoolean(13);                   
                        contrato.mutuario = new Mutuario()
                        {
                            id = idMutuario
                        };

                        contratos.Add(contrato);
                    }
                }

                return contratos;
            }

        }


        /// <summary>
        /// Verifica a atualização diaria do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário.</param>
        /// <param name="dataCredito">Data de Crédito.</param>
        /// <returns>Caso existe atualização.</returns>
        public bool verificarAtualizacaoDiaria(int idMutuario, DateTime dataCredito)
        {
            string query;

            // Consulta
            query = @" SELECT COUNT(HME.HMEDATAPREVISTA) AS QTDE 
              FROM HISTMOVEMPTMO HME, CONTRATOEMPTMO CON 
             WHERE HME.HMETIPOMOV = 5 
               AND CON.IDPESSOA = :IDMUTUARIO_P 
               AND HME.HMEDATAPREVISTA = :DATAREFERENCIA_P 
               AND NVL(HME.FLGESTORNADO, 0) = 0 
               AND CON.FLGSITUACAO NOT IN ('C', 'Q') 
               AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO 
             GROUP BY CON.IDCONTRATOEMPTMO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                int quantidade = 0;

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);//Sadi SOL213592_Kintana2040335
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataCredito);

                // Executa a consulta
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        quantidade = Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                return (quantidade != 0);
            }
        }

        /// <summary>
        /// Consultar forma de pagamento.
        /// </summary>
        /// <param name="codigo">Código da forma de pagamento.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.FormaPagamento"/> com a(s) Forma(s) de Pagamento encontrada(s).</returns>
        public List<FormaPagamento> consultarFormaPagamento(string codigo)
        {
            string query;

            // Consulta
            query = @" SELECT FRP.CODFORMA, 
                    PAR.CODFORMAPAGTO, 
                    FRP.RECPAG, 
                    FRP.DESCRICAO, 
                    FRP.IDPESSOA 
               FROM CM.FORMARECPAG FRP, CM.PARAMEMPTMO PAR 
              WHERE FRP.CODFORMA = PAR.CODFORMAPAGTO(+) 
                AND (FRP.IDPESSOA = 1) 
                AND (FRP.RECPAG = :CODIGO_P) 
              ORDER BY FRP.DESCRICAO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

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
                            id = Convert.ToInt32(leitor.GetValue(0)), // CODFORMA
                            idForma = (leitor.GetValue(1) == DBNull.Value) ? 0 : Convert.ToInt32(leitor.GetValue(1)), // CODFORMPAGTO
                            recPag = leitor.obterString(2), // RECPAG
                            descricao = leitor.obterString(3), // DESCRICAO
                            idPessoa = Convert.ToInt32(leitor.GetValue(4)) // IDPESSOA
                        };

                        listaFormaPagamenteo.Add(formaPagamento);
                    }
                }

                return listaFormaPagamenteo;
            }
        }

        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificador do Mutuário</param>
        public List<ItemContrato> obterItensEmAberto(long idContratoEmptmo)
        {
            string query;

            // Consulta
            query = @" SELECT 
                CON.IDBENEF, 
                DECODE(HME.HMETIPOMOV, 
                      0, 'Concessão/Renovação', 
                      1, 'Prestação ', 
                      2, 'Amortização/Refinanciamento', 
                      3, 'Quitação', 
                      4, 'Atualização de Débito', 
                      5, 'Atualização de Saldo (Diária)' , 
                      6, 'Importação/Migração', 
                      7, 'Ajustes (Cobrança/Devolução)', 
                      8, 'Ajustes (Saldo Devedor)' 
                     ) AS EVENTO, 
               HME.HMEMESCOMPETENCIA, 
               HME.HMEANOCOMPETENCIA, 
               HME.HMEPARCELA, 
               HME.HMESEQCOBRANCA, 
               ITE.ITEDESCRICAO, 
               HME.HMEDATAPREVISTA, 
               HME.HMEDATAVENCTO, 
               TO_CHAR(HME.HMEVLRPREVISTO), 
               TO_CHAR(HME.HMETXJUROS), 
               TO_CHAR(HME.HMESALDODEV), 
               HME.IDCONTRATOEMPTMO, 
               HME.HMETIPOMOV 
             FROM 
               HISTMOVEMPTMO  HME, 
               CM.TIPOSUSPEMPTMO TSE, 
               CM.ITEMEMPTMO     ITE, 
               CONTRATOEMPTMO CON 
             WHERE CON.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P 
               AND   ( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 ) 
               AND    HME.HMETIPOMOV     IN  (1, 2, 3, 4, 7) 
               AND HME.FLGBAIXADO            = 0 
               AND HME.HMEVLREFETIVO    IS NULL 
               AND HME.HMEDATAEFETIVA   IS NULL 
               AND NVL(HME.FLGQUITADO, 0)    = 0 
               AND NVL(HME.FLGABONADO, 0)    = 0 
               AND NVL(HME.FLGESTORNADO, 0)  = 0 
               AND ( NVL(HME.FLGSUSPENSAO, 0)  = 0  
                        OR(NVL(HME.FLGSUSPENSAO, 0) <> 0  
                        AND NVL(TSE.FLGEMABERTO, 0) = 1) ) 
               AND HME.IDITEMEMPTMO          = ITE.IDITEMEMPTMO 
               AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+) 
               AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO 
             ORDER BY HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContratoEmptmo);

                // Executa a consulta
                List<ItemContrato> itens = new List<ItemContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        ItemContrato item = new ItemContrato();
                        item.tipoEvento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(HMETIPOMOV_ITENSABERTOS)));
                        item.tipoEvento.descricao = leitor.obterString(EVENTO_ITENSABERTOS);
                        item.competencia = new DateTime(Convert.ToInt32(leitor.GetValue(HMEANOCOMPETENCIA_ITENSABERTOS)), Convert.ToInt32(leitor.GetValue(HMEMESCOMPETENCIA_ITENSABERTOS)), 1);
                        item.parcela = Convert.ToInt32(leitor.GetValue(HMEPARCELA_ITENSABERTOS));
                        item.sequencia = Convert.ToInt32(leitor.GetValue(HMESEQCOBRANCA_ITENSABERTOS));
                        item.descricao = leitor.obterString(ITEDESCRICAO_ITENSABERTOS);
                        item.dataPrevista = leitor.obterValorData(HMEDATAPREVISTA_ITENSABERTOS).Value;
                        item.dataVencimento = leitor.obterValorData(HMEDATAVENCTO_ITENSABERTOS).Value;
                        item.valor = (double)leitor.obterDecimal(HMEVLRPREVISTO_ITENSABERTOS);
                        item.taxaJuros = leitor.obterValorDecimal(HMETXJUROS_ITENSABERTOS) != null ? (double?)leitor.obterValorDecimal(HMETXJUROS_ITENSABERTOS) : null;
                        item.saldoDevedor = leitor.obterValorDecimal(HMESALDODEV_ITENSABERTOS) != null ? (double?)leitor.obterValorDecimal(HMESALDODEV_ITENSABERTOS) : null;
                        item.valor = (double)leitor.obterDecimal(HMEVLRPREVISTO_ITENSABERTOS);

                        itens.Add(item);
                    }
                }

                return itens;
            }
        }

        /// <summary>
        /// Busca as informações de falecimento de um mutuário
        /// </summary>
        /// <param name="idPessoa">Identificador do mutuário</param>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoFalecimento(int idPessoa)
        {
            Dictionary<string, object> infoFalecimento = new Dictionary<string, object>();

            string query;
            //Busca informações financeiras de um contrato
            #region Query Busca informações fincanceiras
            //Utilizado notação @"" a fim de otimizar o processamento
            query = @"SELECT NVL(doc.dataemissao, pf.datamorte) AS DATAFALECIMENTO,
       NVL2(doc.iddocumento,1,0) AS ISDOCUMENTOOBITO,
       NVL(p.iddocumento,0) AS IDDOCUMENTO
FROM CM.pessoafisica pf
     LEFT JOIN (SELECT dp.iddocumento,
                       dp.idpessoa,
                       dp.dataemissao
                FROM CM.docpessoa dp 
                     JOIN CM.paramemptmo pe ON dp.iddocumento = pe.iddocumento) doc ON doc.idpessoa = pf.idpessoa,
     paramemptmo p
WHERE pf.idpessoa = :IDPESSOA";
            #endregion
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int32, idPessoa.ToString());

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        infoFalecimento.Add("DATAFALECIMENTO", leitor.obterValorData(0));
                        infoFalecimento.Add("ISDOCUMENTOOBITO", Convert.ToInt32(leitor.GetValue(1)));
                        infoFalecimento.Add("IDDOCUMENTO", Convert.ToInt32(leitor.GetValue(2)));
                    }
                }

                return infoFalecimento;
            }
        }

        /// <summary>
        /// Busca os dados do mutuário do contrato.
        /// </summary>
        /// <param name="numContrato">Identificador do contrato.</param>
        /// <returns>Dictionary com as informações do mutuário do contrato pesquisado.</returns>
        public Dictionary<string, object> buscaInfoMutuario(long numContrato) //Saulo - FUNCEF
        {
            Dictionary<string, object> infoMutuario = new Dictionary<string, object>();
            string query;

            // Consulta
            #region Query que busca as informações do mutuário
            ///SOL 244386 / PPM 601624
            ///Autor: Petri Nocentini
            ///DATAMORTE estava sendo apresentada como NVL(doc.dataemissao, pf.datamorte)
            ///Era apresentada a data da emissão da certidao de obito no lugar da data de falecimento
            ///Alterada para apresentar data de falecimento
            query = @"SELECT p.nome,
           dep.matricula,
           TRIM(p.numdocumento) AS CPF,
           pf.datamorte AS DATAMORTE,
           NVL2(doc.dataemissao,1,0) AS FLGDOCOBITO,
           NVL(doc.iddocumento,0) AS IDDOCUMENTO,
           sp.idsitpart,
           CASE
             WHEN sp.flginterno = 'CA' AND dep.idpessoa <> dep.idtitular THEN 'PENSIONISTA'
             ELSE sp.descricao 
           END AS SITUACAOPLANO,
           sp.flginterno,
           ppp.inscricaonumero,
           ppp.idplanoprev,
           pp.nome AS PLANO,
           spp.descricao AS SITPLANO,
           con.idcbancariadeb
    FROM CONTRATOEMPTMO con
         JOIN CM.pessoa p ON p.idpessoa = con.idbenef
         JOIN CM.pessoafisica pf ON pf.idpessoa = con.idbenef
         JOIN CM.depentit dep ON dep.idpessoa = con.idbenef
                           AND dep.idtitular = con.idpessoa
         JOIN CM.elegpatro el ON el.idpessoa = con.idpessoa
         JOIN CM.partprevplan ppp ON ppp.idpessoa = el.idpessoa
         JOIN CM.planprev pp ON pp.idplanoprev = ppp.idplanoprev
         JOIN CM.sitpart sp ON sp.idsitpart = ppp.idsitpart
         JOIN CM.sitplanoprev spp ON spp.idsitplanoprev = ppp.idsitplanoprev
         LEFT JOIN (SELECT dp.iddocumento,
                           dp.idpessoa,
                           dp.dataemissao
                    FROM CM.docpessoa dp 
                         JOIN CM.paramemptmo pe ON dp.iddocumento = pe.iddocumento) doc ON doc.idpessoa = pf.idpessoa
    WHERE con.idcontratoemptmo = :NUMCONTRATO
    AND   (ppp.idplanoprev = (SELECT MAX(ppp2.idplanoprev) FROM CM.partprevplan ppp2
                              WHERE ppp2.flgdesativado = 0
                              AND   ppp2.idpessoa = ppp.idpessoa)
           OR 
           (ppp.flgdesativado = 1 
            AND NOT EXISTS (SELECT 1 FROM CM.partprevplan ppp1
                            WHERE ppp1.idpessoa = ppp.idpessoa
                            AND   ppp1.flgdesativado = 0)
            AND (ppp.idsitplanoprev = 25 
                 OR
                 ppp.idplanoprev = (SELECT MAX(ppp1.idplanoprev) FROM CM.partprevplan ppp1
                                    WHERE ppp1.idpessoa = ppp.idpessoa
                                    AND   NVL(ppp1.datacancelamento, TRUNC(SYSDATE)) = (SELECT NVL(MAX(ppp2.datacancelamento),TRUNC(SYSDATE)) FROM CM.partprevplan ppp2
                                                                                        WHERE ppp2.idpessoa = ppp1.idpessoa
                                                                                        AND   NOT EXISTS (SELECT 1 FROM CM.partprevplan ppp2
                                                                                                          WHERE ppp2.idpessoa = ppp1.idpessoa
                                                                                                          AND   ppp2.idsitplanoprev = 25))))))";
            #endregion
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, numContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        infoMutuario.Add("NOME", leitor.obterString(0));
                        infoMutuario.Add("MATRICULA", leitor.obterString(1));
                        infoMutuario.Add("CPF", leitor.obterString(2));
                        infoMutuario.Add("DATAMORTE", leitor.obterValorData(3));
                        infoMutuario.Add("FLGDOCOBITO", Convert.ToInt32(leitor.GetValue(4)));
                        infoMutuario.Add("IDDOCUMENTO", Convert.ToInt32(leitor.GetValue(5)));
                        infoMutuario.Add("IDSITPART", Convert.ToInt32(leitor.GetValue(6)));
                        infoMutuario.Add("SITUACAOPART", leitor.obterString(7));
                        infoMutuario.Add("FLGINTERNO", leitor.obterString(8));
                        infoMutuario.Add("INSCRICAOPREV",leitor.GetValue(9) == DBNull.Value ? 0 : Convert.ToInt64(leitor.GetValue(9)));
                        infoMutuario.Add("IDPLANOPREV", Convert.ToInt32(leitor.GetValue(10)));
                        infoMutuario.Add("PLANO", leitor.obterString(11));
                        infoMutuario.Add("SITPLANO", leitor.obterString(12));
                        infoMutuario.Add("IDCONTABANCARIA", leitor.GetValue(13) == DBNull.Value ? 0 : Convert.ToInt32(leitor.GetValue(13)));
                    }
                }

                return infoMutuario;
            }
        }

        //Petri Nocentini SOL 143476/16437 PPM 491462
        //public Dictionary<string, object> buscaInfoImpressaoContrato(int idPessoa)
        public RelatorioContrato buscaInfoImpressaoContrato(int idPessoa)
        {
            string query;

            query = @" SELECT ep.logradouro AS LOGRADOURO,
                                    ep.numero AS NUMERO,
                                    ep.complemento AS COMPLEMENTO,
                                    ep.bairro AS BAIRRO,
                                    ci.nome AS CIDADE,
                                    ci.uf AS UF,
                                    ep.cep AS CEP,
                                    substr(trim(replace(replace(telCel.Ddd,'('),')')),length(trim(replace(replace(telCel.Ddd,'('),')')))-1,2)
                                    || replace(trim(telCel.numero),'-') AS TELCEL,
                                    substr(trim(replace(replace(telCom.Ddd,'('),')')),length(trim(replace(replace(telCom.Ddd,'('),')')))-1,2)
                                    || replace(trim(telCom.numero),'-') AS TELCOM,
                                    substr(trim(replace(replace(telRes.Ddd,'('),')')),length(trim(replace(replace(telRes.Ddd,'('),')')))-1,2)
                                    || REPLACE(trim(telRes.numero),'-') AS TELRES,
                                    dp.numdocumento || ' ' || dp.orgao || '/' || docuf.codestado,
                                    ci.idestado,
                                    pf.EMAILFUNCEF as EMAIL_PESSOAL,
                                    p.EMAIL as EMAIL_COMERCIAL
                        FROM CM.pessoa p 
                        LEFT JOIN CM.docpessoa dp ON dp.idpessoa = p.idpessoa AND dp.iddocumento = 11 
                        LEFT JOIN CM.estado docuf ON docuf.idestado = dp.idestado 
                        LEFT JOIN CM.endpess ep ON ep.idendereco = COALESCE(p.idendcorresp,p.idendresidencial,p.idendcobranca) 
                        LEFT JOIN CM.cidades ci ON ci.idcidades = ep.idcidades 
                        LEFT JOIN CM.telendpess telCel ON telCel.idpessoa = p.idpessoa AND telCel.Tipo LIKE '%L%' 
                        LEFT JOIN CM.telendpess telCom ON telCom.idpessoa = p.idpessoa AND telCom.Tipo LIKE '%C%' 
                        LEFT JOIN CM.telendpess telRes ON telRes.idpessoa = p.idpessoa AND telRes.Tipo LIKE '%P%'
                        LEFT JOIN pessoafisica pf on pf.idpessoa=p.idpessoa
                        WHERE p.idpessoa = :IDPESSOA
                            AND   (telCel.Idtelefone = (SELECT max(t.idtelefone)
                                                         FROM CM.telendpess t
                                                        WHERE t.idpessoa = p.idpessoa
                                                          AND   t.tipo LIKE '%L%') OR telCel.Idtelefone IS NULL)
                            AND   (telCom.Idtelefone = (SELECT max(t.idtelefone)
                                                         FROM CM.telendpess t
                                                        WHERE t.idpessoa = p.idpessoa
                                                          AND   t.tipo LIKE '%C%') OR telCom.Idtelefone IS NULL)
                            AND   (telRes.Idtelefone = (SELECT max(t.idtelefone)
                                                         FROM CM.telendpess t
                                                        WHERE t.idpessoa = p.idpessoa
                                                          AND   t.tipo LIKE '%P%') OR TELRES.IDTELEFONE IS NULL) ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int32, idPessoa.ToString());

                RelatorioContrato relatorio = new RelatorioContrato();

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {

                        relatorio.identidade = leitor.obterString(10);
                        relatorio.logradouro = leitor.obterString(0);
                        //William Moreire da Silva - SOL 257695 PPM 964306
                        //relatorio.numero = Convert.ToInt32(leitor.GetValue(1);
                        relatorio.numero = leitor.obterString(1);
                        //William Moreire da Silva - SOL 257695 PPM 964306
                        relatorio.complemento = leitor.obterString(2);
                        relatorio.bairro = leitor.obterString(3);
                        relatorio.cidade = new Cidade()
                        {
                            nome = leitor.obterString(4)
                        };
                        relatorio.uf = new UF()
                        {
                            idEstado = Convert.ToInt32(leitor.GetValue(11)),
                            nome = leitor.obterString(5)
                        };
                        relatorio.cep = leitor.obterString(6);
                        relatorio.numeroCelular = leitor.obterString(7);
                        relatorio.numeroComercial = leitor.obterString(8);
                        relatorio.numeroResidencial = leitor.obterString(9);
                        relatorio.emailPessoal = leitor.obterString(12);
                        relatorio.emailComercial = leitor.obterString(13);
                    }
                }

                return relatorio;
            }
        }

        public bool verificarExistenciaEquacionamento(int IdPessoa, int IdTitular)
        {
            string query = @"select COUNT(*)
                from CM.HSTCONTRIBPREV HC
                JOIN CM.CONTRIBUICAO C ON C.IDCONTRIBUICAO=HC.IDCONTRIBUICAO
                JOIN CM.TPCONTRIBUICAO T ON T.IDTPCONTRIBUICAO = C.IDTPCONTRIBUICAO
                JOIN CM.CONTPREV CP ON C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO AND HC.IDPLANOPREV = CP.IDPLANOPREV
                WHERE CP.FLGPAGADOR = 'C' 
                AND T.FLGDEFICIT = 1 
                AND HC.IDPESSOA=:idpessoa 
                AND HC.IDTITULAR=:idtitular 
                AND HC.DATARECEBIMENTO IS NOT NULL
                GROUP BY NVL(HC.IDPLANPREVCONTAB,CP.IDPLANPREVCONTAB), HC.IDPLANOPREV, CP.FLGINTERNO";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "idpessoa", DbType.Int32, IdPessoa);
                bancoDeDados.AddInParameter(comando, "idtitular", DbType.Int32, IdTitular);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public double BuscaUltimaPrestacaoFGQC(double IdContratoEmptmo)
        {
            string query = @" 
                            SELECT TO_CHAR(ValorPrestacao) ValorPrestacao
                            FROM(
                                    SELECT
                                        NVL(SUM(hp.vlrprevisto),0) AS ValorPrestacao, hp.parcela
                                    FROM CM.HmePrestacao hp
                                        JOIN CM.contratoemptmo ct ON hp.idcontratoemptmo = ct.idcontratoemptmo
                                    WHERE hp.idcontratoemptmo = :IdContratoEmptmo
                                    AND hp.Iditememptmo IN (13, 99)
                                    AND hp.origem = 1
                                    AND hp.flgquitabonoestorno = 0
                                    AND ct.idtipocontremptmo IN (SELECT tc.idtipocontremptmo
                                                                    FROM CM.tipocontremptmo tc
                                                                    WHERE tc.tcemaxparc >= 12)
                                    GROUP BY hp.parcela
                                    ORDER BY hp.parcela desc
                                )
                            WHERE rownum = 1";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "IdContratoEmptmo", DbType.Int64, IdContratoEmptmo);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        return (double)leitor.obterDecimal(0);
                    }
                }
            }
            return 0;
        }

        public int VerificaTempoInadPrimeiraPrestatacao(long NumContrato)
        {

            string query;
            int PeriodoDataInad = 0;

            query = @" SELECT CM.PCK_EMPRESTIMO.FN_PRIMEIRADATAEMABERTO(:pIdContratoEmptmo, :pDataLimite, :pDiasTolerancia) FROM DUAL";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Double, NumContrato);
                bancoDeDados.AddInParameter(comando, "pDataLimite", DbType.Date, DateTime.Now.Date);
                bancoDeDados.AddInParameter(comando, "pDiasTolerancia", DbType.Int16, 0);
                //cmd.AddInParameter("vDataValorAberto", DbType.Int16).Direction = ParameterDirection.ReturnValue;

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        PeriodoDataInad = leitor.obterInt(0);
                    }
                }
            }
            return PeriodoDataInad;
        }

        //William Santana - SIG 50871 - começo

        private class Taxas
        {
            public String tipo { get; set; }
            public Int32 faixa { get; set; }
            public Double taxa { get; set; }
            public DateTime vigencia { get; set; }
        }

        private string DataContrato(DateTime d)
        {
            DateTime data = d == null ? DateTime.Now : d;

            System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("pt-BR");
            System.Globalization.DateTimeFormatInfo dtfi = culture.DateTimeFormat;

            string mes = culture.TextInfo.ToLower(dtfi.GetMonthName(data.Month));

            return "a partir de " + data.Day.ToString() + " de " + mes + " de " + data.Year.ToString() + ".";

        }

        public RelatorioContrato buscaInfoTaxas(string ptipoContrato, DateTime dataRef)
        {

            RelatorioContrato relatorio = new RelatorioContrato();

            Database bancoDeDados = this.obterBancoDeDados();
            string query = @"{CALL CM.PCK_EMPRESTIMO.PR_BUSCA_TAXASJUROS_ATUAL(:pTipoContratoFixo,
                                                                               :pTipoContratoVariavel, 
                                                                               :pTipoContrato13Sal, 
                                                                               :pDataRef)}";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "pTipoContratoFixo", DbType.Int32, 90);
                bancoDeDados.AddInParameter(comando, "pTipoContratoVariavel", DbType.Int32, 89);
                bancoDeDados.AddInParameter(comando, "pTipoContrato13Sal", DbType.Int32, 92);
                bancoDeDados.AddInParameter(comando, "pDataRef", DbType.Date, dataRef);
                bancoDeDados.AddInParameter(comando, "pResultado", DbType.Binary, null);
                try
                {
                    var listTaxa = new List<Taxas>();

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        while (leitor.Read())
                        {
                            Taxas taxa = new Taxas()
                            {
                                tipo = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("TIPOCONTRATO"))),
                                faixa = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("MESINICIAL"))),
                                taxa = Convert.ToDouble(leitor.GetValue(leitor.GetOrdinal("TAXAJUROS"))),
                                vigencia = Convert.ToDateTime(leitor.GetValue(leitor.GetOrdinal("INICIOVIGENCIA")))
                            };

                            listTaxa.Add(taxa);
                        }
                    }

                    //se esta lista retorna nula, verificar a procedure do banco
                    if (listTaxa != null)
                    {
                        //string tipo = listTaxa.Where(a => a.tipo == "13salario" && a.faixa == 1).Select(b => b.tipo).FirstOrDefault();

                        if (ptipoContrato == "92")
                        {
                            relatorio.txjuros13sal = Convert.ToDouble(listTaxa.Where(a => a.tipo == "13salario" && a.faixa == 1).Select(b => b.taxa).First());
                        }
                        else if (ptipoContrato == "90")
                        {
                            relatorio.txjuros12 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "fixo" && a.faixa == 1).Select(b => b.taxa).First());
                            relatorio.txjuros13a24 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "fixo" && a.faixa == 13).Select(b => b.taxa).First());
                            relatorio.txjuros25a36 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "fixo" && a.faixa == 25).Select(b => b.taxa).First());
                            relatorio.txjuros37a48 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "fixo" && a.faixa == 37).Select(b => b.taxa).First());
                        }
                        else
                        {
                            relatorio.txjuros24 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "variável" && a.faixa == 1).Select(b => b.taxa).First());
                            relatorio.txjuros25a48 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "variável" && a.faixa == 25).Select(b => b.taxa).First());
                            relatorio.txjuros49a72 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "variável" && a.faixa == 49).Select(b => b.taxa).First());
                            relatorio.txjuros73a96 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "variável" && a.faixa == 73).Select(b => b.taxa).First());
                            relatorio.txjuros97a120 = Convert.ToDouble(listTaxa.Where(a => a.tipo == "variável" && a.faixa == 97).Select(b => b.taxa).First());
                        }
                        
                        relatorio.dtiniciovegencia = DataContrato(listTaxa.Select(a => a.vigencia).First());
                    }

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand("{CALL CM.PCK_EMPRESTIMO.PR_BUSCA_TAXASFGQC_ATUAL(:pDataRef)}"))
            {
                bancoDeDados.AddInParameter(comando, "pDataRef", DbType.Date, dataRef);
                bancoDeDados.AddInParameter(comando, "pResultado", DbType.Binary, null);

                try
                {                    
                    var listTaxa = new List<Taxas>();

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        while (leitor.Read())
                        {
                            Taxas taxa = new Taxas()
                            {
                                faixa = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("FAIXAETARIAMAX"))),
                                taxa = Convert.ToDouble(leitor.GetValue(leitor.GetOrdinal("TAXAFGQC")))
                            };

                            listTaxa.Add(taxa);
                        }
                    }

                    if (listTaxa != null)
                    {
                        relatorio.txfgqc34 = Convert.ToDouble(listTaxa.Where(a => a.faixa == 34).Select(b => b.taxa).First());
                        relatorio.txfgqc35a49 = Convert.ToDouble(listTaxa.Where(a => a.faixa == 49).Select(b => b.taxa).First());
                        relatorio.txfgqc50a59 = Convert.ToDouble(listTaxa.Where(a => a.faixa == 59).Select(b => b.taxa).First());
                        relatorio.txfgqc60a74 = Convert.ToDouble(listTaxa.Where(a => a.faixa == 74).Select(b => b.taxa).First());
                        relatorio.txfgqc75a84 = Convert.ToDouble(listTaxa.Where(a => a.faixa == 84).Select(b => b.taxa).First());
                        relatorio.txfgqc85 = Convert.ToDouble(listTaxa.Where(a => a.faixa == 200).Select(b => b.taxa).First());
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand("{CALL CM.PCK_EMPRESTIMO.PR_BUSCA_TAXAADM_ATUAL(:pDataRef, :pResultado)}"))
            {
                bancoDeDados.AddInParameter(comando, "pDataRef", DbType.Date, dataRef);
                bancoDeDados.AddOutParameter(comando, "pResultado", DbType.String, 10);

                try
                {
                    bancoDeDados.ExecuteNonQuery(comando);

                    //String txAdm = '0' + Convert.ToString(bancoDeDados.GetParameterValue(comando, "pResultado"));
                    String txAdm = Convert.ToString(bancoDeDados.GetParameterValue(comando, "pResultado"));
                    relatorio.txadm = txAdm;

                }
                catch (Exception)
                {
                    throw;
                }
            }

            return relatorio;
        }

        //William Santana - SIG 50871 - fim
        #endregion


        public RelatorioContrato buscaInfoImpressaoEmprestimoSemContrato(long NumeroContrato)
        {
            string query = $@" SELECT 
                                   c.LOGRADOURO,
                                   c.NUMERO,
                                   c.COMPLEMENTO,
                                   c.BAIRRO,
                                   c.CIDADE,
                                   c.UF,
                                   c.CEP,
                                   c.TELCELULAR,
                                   c.TELCOMERCIAL,
                                   c.TELRESIDENCIAL,
                                   c.IDENTIDADE,
                                   null idestado,
                                   c.EMAILPESSOAL,
                                   c.EMAILCOMERCIAL,
                                   c.IDCBANCARIA,     
                                   acp.numcomprova, 
                                   CAST(CAST(acp.datahoracarimbotempo AT TIME ZONE acp.timezone_contratacao AS TIMESTAMP) AS DATE) AS DATAHORACARIMBOTEMPO,              
                                   acp.hashassinatura,
                                   acp.trgDtInclusao,
                                   ( select MIN(DATAHORACARIMBOTEMPO)
                                     from  assincontrpadrao
                                     where idbenef = ce.idbenef
                                     and dadosassinhash like '%{NumeroContrato}%'
                                     and DATAHORACARIMBOTEMPO like '%America/Sao_Paulo') data,
                                   TIMEZONE_CONTRATACAO TimeZone,
                                   acp.datahoracarimbotempo datahoracarimbotempo2
                            FROM dadoscontratoemptmo c
                            JOIN cm.contratoemptmo ce ON c.idcontratoemptmo = ce.idcontratoemptmo     
                            JOIN cm.contrpadrxtipocontr cxt ON cxt.idtipocontremptmo = ce.idtipocontremptmo
                            JOIN cm.assincontrpadrao acp ON acp.idcontratopadrao = cxt.idcontratopadrao and trunc(acp.acpdataassinat) = trunc(ce.dataassinatura) AND acp.idbenef = ce.idbenef and acp.idpessoa = ce.idpessoa
                            WHERE ce.IDCONTRATOEMPTMO = :NumeroContrato";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int64, NumeroContrato);

                RelatorioContrato relatorio = new RelatorioContrato();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        relatorio.identidade = leitor.obterString(10);
                        relatorio.logradouro = leitor.obterString(0);   
                        relatorio.numero = leitor.obterString(1);              
                        relatorio.complemento = leitor.obterString(2);
                        relatorio.bairro = leitor.obterString(3);
                        relatorio.cidade = new Cidade()
                        {
                            nome = leitor.obterString(4)
                        };
                        relatorio.uf = new UF()
                        {
                            idEstado = 0, //Convert.ToInt32(leitor.GetValue(11)),
                            nome = leitor.obterString(5)
                        };
                        relatorio.cep = leitor.obterString(6);
                        relatorio.numeroCelular = leitor.obterString(7);
                        relatorio.numeroComercial = leitor.obterString(8);
                        relatorio.numeroResidencial = leitor.obterString(9);
                        relatorio.emailPessoal = leitor.obterString(12);
                        relatorio.emailComercial = leitor.obterString(13);         
                        
                        if (leitor.GetValue(14) != DBNull.Value)
                            relatorio.conta = new DadosBancarios() { id = leitor.obterInt(14) };

                        relatorio.Carimbo = new CarimboDTO()
                        {
                            IDCarimbo = leitor.obterString(15),
                            DataHoraUTC = leitor.obterString(16),
                            Codigo_Hash = leitor.obterString(17),
                            HorasTimezone = leitor.obterString(20)
                        };
                        relatorio.DataInclusao = (DateTime)leitor.obterValorData(18);
                        relatorio.DataInclusaoAssinatContratoP = leitor.obterString(19);
                        relatorio.HorasTimezone = leitor.obterString(20);
                        relatorio.DataCarimboTempo = leitor.obterString(21);

                    }
                }

                return relatorio;
            }
        }

    }
}
