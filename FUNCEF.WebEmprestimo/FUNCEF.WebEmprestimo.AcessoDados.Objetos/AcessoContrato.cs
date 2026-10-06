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
#region SIG 93932
///
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Alteração:
/// 26/12/2019
///
/// Descrição da Alteração:
/// Ajuste no Cancelamento de Concessão
///
#endregion
#region SIG 90605
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 10/10/2019
///
/// Descrição da Alteração:
/// Busca de prestação com FGQC
///
#endregion
#region SIG 21529
///
/// Autor:
/// Thayane Rabonato/Darivaldo Alencar
///
/// Data da Alteração:
/// 12/09/2017
///
/// Descrição da Alteração:
/// Criação da opção de renegociação de dívidas de emprestimo
///
#endregion
#region SIG 71652
///
/// Autor:
/// Marcelo Ferreira
///
/// Descrição da Alteração:
/// Inclusão do getdatetime no retorno da select
///
#endregion
#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Criação do método consultarAssinaturas e consultarContratos
///
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion
#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SOL 261154 / PPM 1062246
/// Autor:
/// William Moreira da Silva
///
/// Data da Atualização:
/// 30/09/2015
///
/// Descrição da Alteração: alteração da consulta do método verificaItensAberto
/// 
#endregion
#region SOL 251082 / PPM 724410
/// Autor:
/// William Moreira da Silva
///
/// Data da Atualização:
/// 25/03/2015
///
/// Descrição da Alteração:
/// Alteração para o conector realizar concessões passando o numero do contrato
/// e um metodo para gerar o numero do contrato
#endregion
#region SOL 255960 / PPM 843375
/// - SOL: 255960 PPM: 843375
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Atualização:
/// 23/06/2015
///
/// Descrição da Alteração:
/// Correção na rontina de verificação de atualização diária, quando o contrato estiver com situação de encerrado
/// o sistema não deve apresentar a mensagem de indicação de falta de atualização diária. A regra diz que os contratos
/// com situação "E" de encerrado não tem atualização diária.
/// 
#endregion
#region SOL 239029 / PPM 512118
///
/// Autor:
/// Marcio Sanches Spinosa
///
/// Data da Alteração:
/// 11/09/2014 
///
/// Descrição da Alteração:
/// Ajustar a query que carrega as matriculas deixando igualmente a do Emprestimo/ Planus
///
#endregion
#region SOL 201769 / Kintana 1950540
/*
Pendência   : 201769
Kintana     : 1950540
Responsável : Marcio Sanches Spinosa SOL 201769 Kintana 1950540
Data        : 04/03/2013
Descrição   : Ajuste no metodo obterSaldoDevedor, onde é passado a data de amortização,
mas esta utilizando dentro do metodo a data de atualização.
 */
#endregion
#region SIG94124
/*
SIG         : 94124
Responsável : Taffarel Sevaybriker
Data        : 19/11/2019
Descrição   : Ajuste para não passa valor nulo.
*/
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
using System.Reflection;
using FUNCEF.Planus.Componentes;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    /// <summary>
    /// Objeto de acesso a dados de estado do sistema.
    /// </summary>
    public class AcessoContrato : ObjetoAcessoDados, IAcessoContrato
    {
        #region Constantes

        #region Consultar Ativos

        private const int IDCONTRATOEMPTMO_ATIVOS = 0;
        private const int DATAASSINATURA_ATIVOS = 1;
        private const int IDTIPOCONTREMPTMO_ATIVOS = 2;
        private const int TCEDESCRICAO_ATIVOS = 3;
        private const int MATRICULA_ATIVOS = 4;
        private const int NOME_ATIVOS = 5;
        private const int NUMDOCUMENTO_ATIVOS = 6;
        private const int DATACREDITO_ATIVOS = 7;
        private const int SIT_PARTICIPANTE_ATIVOS = 8;
        private const int SIT_PLANO_ATIVOS = 9;
        private const int NOME_PATRO_ATIVOS = 10;
        private const int INSCRICAO_PREVIDENCIARIA_ATIVOS = 11;
        private const int NOME_PLANO_ATIVOS = 12;
        private const int DESCTIPOEMPTMO_ATIVOS = 13;
        private const int IDTITULAR_ATIVOS = 14; //HELEN BIANCHI - ADD CAMPO CONFORME EMAIL

        #endregion

        #region Consultar Contrato

        private const int IDPESSOA_CONTRATO = 0;
        private const int NUMCONTRATO_CONTRATO = 1;
        private const int NOME_MUTUARIO_CONTRATO = 2;
        private const int MATRICULA_MUTUARIO_CONTRATO = 3;
        private const int NUMDOCUMENTO_CONTRATO = 4;
        private const int SIT_PARTICIPANTE_CONTRATO = 5;
        private const int PATROCINADORA_CONTRATO = 6;
        private const int PLANO_PREVIDENCIARIO_CONTRATO = 7;
        private const int TIPO_EMPRESTIMO_CONTRATO = 8;
        private const int IDTIPOCONTREMPTMO_CONTRATO = 9;
        private const int TIPO_CONTRATO_CONTRATO = 10;
        private const int INDEXADOR_CONTRATO = 11;
        private const int DATAASSINATURA_CONTRATO = 12;
        private const int DATACREDITO_CONTRATO = 13;
        private const int DATAPRIMPARC_CONTRATO = 14;
        private const int TXJUROS_CONTRATO = 15;
        private const int VLRCONTRATO_CONTRATO = 16;
        private const int NUMPARCELAS_CONTRATO = 17;
        private const int VLRPARCELA_CONTRATO = 18;
        private const int DATA_FALECIMENTO = 19;
        private const int IDBENEFICIARIO = 20;
        private const int SITUACAO_CONTRATO = 21;
        private const int IDINSCRICAO_EMPRESTIMO = 22;
        private const int DATA_SITUACAO = 23;
        private const int DATA_CANCELAMENTO_CONTRATO = 24;
        private const int SALARIO_BASE_CONTRATO = 25;
        private const int VALOR_MARGEM_CONTRATO = 26;
        private const int SITUACAO_PLANO = 27;
        private const int INSCRICAO_PREVIDENCIARIA = 28;
        private const int DATA_SOLICITACAO = 29;
        private const int SITUACAO_FUN = 30;
        private const int PLANO_ORIGEM = 31;
        private const int IDRESPONSAVEL = 32;
        private const int NUMPARCDESCONTO = 33;
        private const int CODAUTOEMP = 34;
        private const int DESC_SUSPENCAO = 35;
        private const int DATAINICIOSUSP = 36;
        private const int DATAFIMSUSP = 37;
        private const int NOMERESPONSAVEL = 38;
        private const int CEDIDO = 39;
        private const int IDCONTRQUITACAO = 40;
        private const int FORMA_PGTO_CRE = 41;
        private const int CONTA_CAIXA = 42;
        private const int FORMA_PGTO_DEB = 43;
        private const int FLGSITUACAO_CONTRATO = 44;
        private const int FLGFORMAREC_CONTRATO = 45;
        private const int FLGFORMAPAG_CONTRATO = 46;
        private const int IDPATROCINADORA_CONTRATO = 47;
        private const int IDPLANOPREVIDENCIAO_CONTRATO = 48;
        private const int IDTIPOEMPRESTIMO_CONTRATO = 49;
        private const int FLGEXCEPCIONAL_CONTRATO = 50;
        private const int FLGINTERNET_CONTRATO = 51;
        private const int IDTITULAR_CONTRATO = 52; //HELEN BIANCHI - ADD CAMPO CONFORME EMAIL
        private const int QTDEMESSUSP = 53;
        private const int QTDECONTQUITADO = 54;
        private const int VLRMAXPERMIT = 55;
        private const int VALORMAXPRESTACAO = 56;
        private const int FLGINTERNO = 57;
        private const int NUMPROTOCOLO = 58; //William Moreira da Silva
        private const int DATAINICIOVLRMAX = 59; //William Moreira da Silva
        private const int DATAFINALVLRMAX = 60; //William Moreira da Silva
        private const int FLGPERDAEFETIVA_CONTRATO = 61; //Sadi Freire SOL213592_Kintana2040335;
        private const int ISDOCUMENTOOBITO = 62;//Marcio Sanches Spinosa
        private const int NUMERODOCUMENTOPARAMPREV = 63;//Marcio Sanches Spinosa


        #endregion

        #region Consultar Conta Corrente

        private const int INCRICAO_DADOS = 0;
        private const int DATASSINATURA_DADOS = 1;
        private const int IDCONTRATO_DADOS = 2;
        private const int IDBENEFICIARIO_DADOS = 3;
        private const int DATACREDITO_DADOS = 4;
        private const int VALORCONTRATO_DADOS = 5;
        private const int FORMAPAGAMENTO_DADOS = 6;
        private const int FORMARECEBIMENTO_DADOS = 7;
        private const int PORTFORMAPAGAMENTO_DADOS = 8;
        private const int PORTFORMAREC_DADOS = 9;
        private const int IDCONTABANCARIADEBITO_DADOS = 10;
        private const int DESCSITCONTRATO_DADOS = 11;
        private const int IDTIPOSUSP_DADOS = 12;
        private const int DARAINICIOSUSP_DADOS = 13;
        private const int DATAFIMSUSP_DADOS = 14;
        private const int DATALIBSUSP_DADOS = 15;
        private const int HORALIBSUSP_DADOS = 16;
        private const int USUARIOLIBSUSP_DADOS = 17;
        private const int IDTIPOCONTRATO_DADOS = 18;
        private const int SUSPENSAOAUTO_DADOS = 19;
        private const int ANOSUSP_DADOS = 20;
        private const int MESUSP_DADOS = 21;
        private const int NUMPARCELASDESCO_DADOS = 22;
        private const int INSCRICAONUMERO_DADOS = 23;
        private const int SITUACAO_DADOSBANCARIOS_DADOS = 24;
        private const int PLANOPREV_DADOS = 25;
        private const int PATRO_DADOS = 26;
        private const int MATRICULA_DADOS = 27;
        private const int TITULAR_DADOS = 28;
        private const int BENEFICIARIO_DADOS = 29;
        private const int TCEDESCRICAO_DADOSBANCARIOS_DADOS = 30;
        private const int DESCTIPOEMPTMO_DADOS = 31;
        private const int BANCO_DADOS = 32;
        private const int CONTACORRENTE_DADOS = 33;
        private const int NUMAGENCIA_DADOS = 34;
        private const int FLGOBRIGBENEF_DADOS = 35;
        private const int IDPESSOA_DADOS = 36;

        #endregion

        #region Consultar Beneficiários

        private const int NOME_BENEF = 0;
        private const int PERCENTUAL_BENEF = 1;
        private const int NUMBANCO_BENEF = 2;
        private const int AGENCIA_BENEF = 3;
        private const int CONTACORRENTE_BENEF = 4;
        private const int OUTRASINFO_BENEF = 5;

        #endregion

        #region Consultar Contratos Quitados

        private const int NUMERO_CONTRATO = 0;
        private const int DATA_CREDITO = 1;
        private const int VALOR_QUITACAO = 2;
        private const int MODALIDADE = 3;

        #endregion

        #region Pesquisar

        private const int IDCONTRATOEMPTMO_PESQUISAR = 0;
        private const int FLGSITUACAO_PESQUISAR = 1;
        private const int SITUACAO_PESQUISAR = 2;
        private const int NOME_PESQUISAR = 3;
        private const int MATRICULA_PESQUISAR = 4;
        private const int TCEDESCRICAO_PESQUISAR = 5;
        private const int DATAASSINATURA_PESQUISAR = 6;
        private const int DATACREDITO_PESQUISAR = 7;
        private const int TSEDESCRICAO_PESQUISAR = 8;
        private const int DESCTIPOEMPTMO_PESQUISAR = 9;
        private const int NOME_PLANO_PESQUISAR = 10;
        private const int PATROCINADORA_PESQUISAR = 11;
        private const int IDINSCRICAOEMPTMO_PESQUISAR = 12;
        private const int CPF_PESQUISAR = 13;
        private const int IDTIPOCONTREMPTMO_PESQUISAR = 14;
        private const int SIT_PLANO_PESQUISAR = 15;
        private const int IDTIPOEMPTMO_PESQUISAR = 16;


        #endregion

        #region Verificar atualização saldo

        private const int QTDE_ATU_SALDO = 0;

        #endregion

        #region Verificar atualização diária

        private const int QTDE_ATU_DIARIA = 0;

        #endregion

        #region Consultar parcela atrasada em aberto

        private const int QTDE_PARCELA_ATRASADA = 0;

        #endregion

        #region Obter itens em aberto

        private const int HMETIPOMOV_ITENSABERTOS = 0;
        private const int EVENTO_ITENSABERTOS = 1;
        private const int HMEMESCOMPETENCIA_ITENSABERTOS = 2;
        private const int HMEANOCOMPETENCIA_ITENSABERTOS = 3;
        private const int ANOMESCOMP_ITENSABERTOS = 4;
        private const int HMEPARCELA_ITENSABERTOS = 5;
        private const int HMESEQCOBRANCA_ITENSABERTOS = 6;
        private const int ITEDESCRICAO_ITENSABERTOS = 7;
        private const int HMEDATAPREVISTA_ITENSABERTOS = 8;
        private const int HMEDATAVENCTO_ITENSABERTOS = 9;
        private const int HMEVLRPREVISTO_ITENSABERTOS = 10;
        private const int HMETXJUROS_ITENSABERTOS = 11;
        private const int HMESALDODEV_ITENSABERTOS = 12;
        private const int HMEDATAEFETIVA_ITENSABERTOS = 13;
        private const int HMEVLREFETIVO_ITENSABERTOS = 14;
        private const int ANOMESCOBR_ITENSABERTOS = 15;

        #endregion

        #region Obter Prestação atual

        private const int HMEVLRPREVISTO = 0;
        private const int HMEPARCELA = 1; //SIG90605

        #endregion

        #region Obter saldo devedor

        private const int SALDO_DEVEDOR = 0;

        #endregion

        #region Obter parcelas restantes

        private const int PARCELA_REST = 0;

        #endregion

        #region Consultar histórico suspensão

        private const int IDHISTSUSPCOBEP_HISTSUSP = 0;
        private const int IDTIPOSUSPEMPTMO_HISTSUSP = 1;
        private const int TSEDESCRICAO_HISTSUSP = 2;
        private const int FLGSTATUS_HISTSUSP = 3;
        private const int STATUS_HISTSUSP = 4;
        private const int HSCMESES_HISTSUSP = 5;
        private const int HSCINICIOSUSP_HISTSUSP = 6;
        private const int HSCFINALSUSP_HISTSUSP = 7;
        private const int FLGFERIAS_HISTSUSP = 8;
        private const int HSCDATALIBER_HISTSUSP = 9;
        private const int HSCMESCOBRANCA_HISTSUSP = 10;
        private const int HSCANOCOBRANCA_HISTSUSP = 11;
        private const int HSCUSUATEND_HISTSUSP = 12;
        private const int HSCDATAATEND_HISTSUSP = 13;
        private const int HSCDATAATU_HISTSUSP = 14;
        private const int HSCUSULIBER_HISTSUSP = 15;
        private const int MATRICULA_HISTSUSP = 16;
        private const int NOME_HISTSUSP = 17;
        private const int IDCONTRATOEMPTMO_HISTSUSP = 18;
        private const int OBSERVACAO_HISTSUSP = 19;//William Moreira da Silva SOL 149705

        #endregion

        #region Consultar Log

        private const int IDLOGTOTALPREV_LOG = 0;
        private const int IDMODULO_LOG = 1;
        private const int IDCONTRATOEMPTMO_LOG = 2;
        private const int IDHISTMOVEMPTMO_LOG = 3;
        private const int ORIGEM_LOG = 4;
        private const int DESCOPERACAO_LOG = 5;
        private const int DATA_LOG = 6;
        private const int IDUSUARIO_LOG = 7;
        private const int NOMEUSUARIO_LOG = 8;
        private const int NOME_LOG = 9;
        private const int VERSAO_LOG = 10;

        #endregion

        #endregion

        #region Consultas

        //William Moreira da Silva - SOL 246823 - Envio
        /// <summary>
        /// Obtem os planos previdenciarios
        /// </summary>
        /// <returns>Lista com os planos previdenciarios</returns>
        public List<PlanoPrevidenciario> obterPlanosPrevidenciarios()
        {
            string query = "";
            List<PlanoPrevidenciario> planos = new List<PlanoPrevidenciario>();

            query = @"SELECT IDPLANOPREV, NOME
                        FROM CM.PLANPREV
                        ORDER BY NOME ";

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        PlanoPrevidenciario plano = new PlanoPrevidenciario();

                        plano.id = Convert.ToInt32(leitor.GetValue(0));
                        plano.descricao = leitor.obterString(1);

                        planos.Add(plano);
                    }
                }

                return planos;
            }
        }

        public List<Patrocinadora> obterPatrocinadoras()
        {
            string query = "";
            List<Patrocinadora> patrocinadoras = new List<Patrocinadora>();

            query = @"SELECT PT.IDPESSOA, P.NOME
                        FROM CM.PATRO PT
                             JOIN CM.PESSOA P ON P.IDPESSOA = PT.IDPESSOA
                        ORDER BY P.NOME ";

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        Patrocinadora patrocinadora = new Patrocinadora();

                        patrocinadora.id = Convert.ToInt32(leitor.GetValue(0));
                        patrocinadora.nome = leitor.obterString(1);

                        patrocinadoras.Add(patrocinadora);
                    }

                }

                return patrocinadoras;
            }
        }

        /// <summary>
        /// Obtem as informações do envio que esta pendente
        /// </summary>
        /// <returns>Informações do envio pendente</returns>
        public ObjetoEnvio obterInfosEnvioProcessando()
        {
            string query = "";

            query = @"SELECT idcontratoemptmo, 
                            datavencto,
                            planos,
                            patrocinadoras,
                            flgfinanrec,
                            flgfolhapatro, 
                            flgfolhabenef,       
                            usuario,
                            datahora
                    FROM (SELECT idcontratoemptmo, 
                                    patrocinadoras, 
                                    planos, 
                                    flgfolhapatro, 
                                    flgfolhabenef, 
                                    flgfinanrec, 
                                    datavencto,
                                    datahora,
                                    upper(usuario) as usuario
                            FROM ETL_EMPTMO.PARAM_ETL_002_ENVIO
                            ORDER BY datahora DESC)
                    WHERE ROWNUM = 1 ";

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                ObjetoEnvio envio = new ObjetoEnvio();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        envio = new ObjetoEnvio()
                        {
                            idContratoEmptmo = Convert.ToInt64(leitor.GetValue(0)),
                            dataVencto = leitor.obterValorData(1).Value,
                            planos = leitor.obterString(2),
                            patrocinadoras = leitor.obterString(3),
                            flgFinanRec = Convert.ToInt32(leitor.GetValue(4)),
                            flgFolhaPatro = Convert.ToInt32(leitor.GetValue(5)),
                            flgFolhaBenef = Convert.ToInt32(leitor.GetValue(6)),
                            usuario = leitor.obterString(7),
                            dataHora = leitor.obterValorData(8).Value
                        };
                    }
                }

                return envio;
            }
        }
        //William Moreira da Silva - SOL 246823 - Envio

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> consultarAtivos(Contrato contrato, ref ParametrosConsulta parametros)
        {
            String query;

            bool buscarNumero = contrato.numero > 0;
            bool buscarMatricula = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.matricula);
            bool buscarCPF = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.cpf);
            bool buscarNome = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.nome);

            // Consulta
            query = @"SELECT CON.IDCONTRATOEMPTMO,
                  CON.DATAASSINATURA, 
                  TCE.IDTIPOCONTREMPTMO, 
                  TCE.TCEDESCRICAO, 
                  DEP.MATRICULA, 
                  PDP.NOME, 
                  PDP.NUMDOCUMENTO, 
                  CON.DATACREDITO, 
                  SIP.DESCRICAO AS SIT_PART, 
                  SPP.DESCRICAO AS SIT_PLANO, 
                  PPA.NOME AS NOME_PATRO, 
                  PPP.INSCRICAONUMERO AS INSCRICAO_PREV, 
                  PLP.NOME AS NOME_PLANO, 
                  TPE.DESCTIPOEMPTMO, 
                  DEP.IDTITULAR
              FROM CM.PESSOA          PDP, 
                   CM.PESSOA          PPA, 
                   CM.DEPENTIT        DEP, 
                   CM.PARTPREVPLAN    PPP, 
                   CM.PLANPREV        PLP, 
                   CM.SITPART         SIP, 
                   CM.SITPLANOPREV    SPP, 
                   CM.CONTRATOEMPTMO  CON, 
                   CM.TIPOCONTREMPTMO TCE, 
                   CM.TIPOEMPTMO      TPE 
             WHERE CON.IDPATRO = PPA.IDPESSOA 
               AND CON.IDBENEF = PDP.IDPESSOA 
               AND CON.IDPESSOA = DEP.IDTITULAR 
               AND CON.IDBENEF = DEP.IDPESSOA  
               AND DEP.IDTITULAR = PPP.IDPESSOA 
               AND PPP.IDSITPART = SIP.IDSITPART 
               AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV 
               AND CON.IDPLANOPREV = PLP.IDPLANOPREV 
               AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO 
               AND TPE.IDTIPOEMPTMO = TCE.IDTIPOEMPTMO 
/* MARCIO SANCHES SPINOSA SOL239029 PPM 512118 
               AND PPP.FLGDESATIVADO = 0 */
               AND CON.FLGSITUACAO NOT IN ('C', 'K', 'Q') 
              AND (ppp.idplanoprev = 
                    (SELECT MAX(ppp2.idplanoprev) 
                      FROM CM.partprevplan ppp2 
                     WHERE ppp2.flgdesativado = 0 
                       AND ppp2.idpessoa = ppp.idpessoa) OR 
                    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS 
                    (SELECT 1 
                       FROM CM.partprevplan ppp1 
                      WHERE ppp1.idpessoa = ppp.idpessoa 
                        AND ppp1.flgdesativado = 0) AND 
                    (ppp.idsitplanoprev = 25 OR 
                    (PPP.idplanoprev = 
                    (SELECT MAX(ppp1.idplanoprev)
                         FROM CM.partprevplan ppp1 
                        WHERE ppp1.idpessoa = ppp.idpessoa 
                          AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = 
                              (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) 
                                 FROM CM.partprevplan ppp2 
                                WHERE ppp2.idpessoa = ppp1.idpessoa) 
                          AND NOT EXISTS (SELECT 1 
                                 FROM CM.partprevplan ppp2 
                                WHERE ppp2.idpessoa = ppp1.idpessoa 
                                  AND ppp2.idsitplanoprev = 25))))))  
/*MARCIO SANCEHS SPINOSA SOL239029 PPM 512118  */
                           ";

            // Filtros
            if (buscarMatricula)
                query = query + @" AND DEP.MATRICULA LIKE :MATRICULA_P ";
            if (buscarNumero)
                query = query + @" AND CON.IDCONTRATOEMPTMO LIKE :NUMERO_P || '%' ";
            if (buscarCPF)
                query = query + @" AND PDP.NUMDOCUMENTO LIKE :CPF_P || '%' ";
            if (buscarNome)
                query = query + @" AND PDP.NOME LIKE :NOME_P || '%' ";

            // Ordenação
            query = query + this.obterQueryOrdenacao("CON", "DATAASSINATURA DESC", parametros);

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            DbCommand cmd;
            if (parametros != null && parametros.paginacao != null)
                cmd = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                cmd = bancoDeDados.GetSqlStringCommand(query);

            using (DbCommand comando = cmd)
            {
                // Parâmetros
                if (buscarMatricula)
                    bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, contrato.mutuario.matricula);
                if (buscarNumero)
                    bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.String, contrato.numero.ToString());
                if (buscarCPF)
                    bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, contrato.mutuario.cpf);
                if (buscarNome)
                    bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, contrato.mutuario.nome.ToUpper());

                // Popula objetos resultantes
                List<Contrato> contratos = new List<Contrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Contrato item = new Contrato()
                        {
                            numero = Convert.ToInt64(leitor.GetValue(IDCONTRATOEMPTMO_ATIVOS)),
                            dataAssinatura = leitor.obterValorData(DATAASSINATURA_ATIVOS).Value,
                            dataCredito = leitor.obterValorData(DATACREDITO_ATIVOS).Value,
                            tipo = new TipoContrato()
                            {
                                id = Convert.ToInt32(leitor.GetValue(IDTIPOCONTREMPTMO_ATIVOS)),
                                descricao = leitor.obterString(TCEDESCRICAO_ATIVOS)
                            },
                            mutuario = new Mutuario()
                            {
                                matricula = leitor.obterString(MATRICULA_ATIVOS),
                                nome = leitor.obterString(NOME_ATIVOS),
                                cpf = leitor.obterString(NUMDOCUMENTO_ATIVOS),
                                situacao = leitor.obterString(SIT_PARTICIPANTE_ATIVOS),
                                inscricaoPrevidenciaria =  leitor.GetValue(INSCRICAO_PREVIDENCIARIA_ATIVOS) != DBNull.Value ? Convert.ToInt64(leitor.GetValue(INSCRICAO_PREVIDENCIARIA_ATIVOS)) : 0,
                                idTitular = Convert.ToInt32(leitor.GetValue(IDTITULAR_ATIVOS))//HELEN BIANCHI - ADD CAMPO CONFORME EMAIL
                            },
                            plano = new PlanoPrevidenciario()
                            {
                                situacao = leitor.obterString(SIT_PLANO_ATIVOS),
                                descricao = leitor.obterString(NOME_PLANO_ATIVOS)
                            },
                            patrocinadora = new Patrocinadora()
                            {
                                nome = leitor.obterString(NOME_PATRO_ATIVOS)
                            },
                            tipoEmprestimo = new TipoEmprestimo()
                            {
                                descricao = leitor.obterString(DESCTIPOEMPTMO_ATIVOS)
                            }
                        };
                        contratos.Add(item);
                    }


                }

                // Total de Regristros
                parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
                parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query);

                // Retorna informações
                parametros.prepararRetorno();

                return contratos;
            }
        }

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultar(long numero, bool veioConector)
        {
            //William Moreira da Silva - SOL 253185 - SOL de refatoração da HISTMOVEMPTMO
            string query = @"SELECT CON.IDBENEF, 
                   CON.IDCONTRATOEMPTMO AS CONTRATO, 
                   PES.NOME AS MUTUARIO, 
                   DEP.MATRICULA, 
                   PES.NUMDOCUMENTO AS CPF, 
                   SIP.DESCRICAO AS SIT_PARTICIPANTE, 
                   PPA.NOME AS PATROCINADORA, 
                   PLP.NOME AS PLANO_PREVIDENCIARIO, 
                   TPE.DESCTIPOEMPTMO AS TIPO_EMPRESTIMO, 
                   CON.IDTIPOCONTREMPTMO, 
                   TPC.TCEDESCRICAO AS TIPO_CONTRATO, 
                   MOE.MOESIGLA AS INDEXADOR, 
                   CON.DATAASSINATURA, 
                   CON.DATACREDITO, 
                   CON.DATAPRIMPARC, 
                   CON.TXJUROS, 
                   CON.VLRCONTRATO, 
                   CON.NUMPARCELAS, 
                   CON.VLRPARCELA, 
              DECODE((SELECT DOC.DATAEMISSAO 
              FROM CM.DOCPESSOA DOC 
              INNER JOIN CM.PARAMEMPTMO PAR 
              ON PAR.IDDOCUMENTO = DOC.IDDOCUMENTO 
              WHERE DOC.IDPESSOA = CON.IDBENEF), 
             NULL, PEF.DATAMORTE, 
             (SELECT DOC.DATAEMISSAO 
             FROM CM.DOCPESSOA DOC 
             INNER JOIN CM.PARAMEMPTMO PAR 
              ON PAR.IDDOCUMENTO = DOC.IDDOCUMENTO 
             WHERE DOC.IDPESSOA = CON.IDBENEF)) AS DATAMORTE, 
                   CON.IDBENEF, 
                   DECODE(CON.FLGSITUACAO, 
                      'A','ATIVO', 
                      'E','ENCERRADO', 
                      'J','EM COBRANÇA JURÍDICA', 
                      'K','EM QUITAÇÃO', 
                      'Q','QUITADO', 
                      'R','RENOVADO', 
                      'C','CANCELADO') AS SIT_CONTRATO, 
                   CON.IDINSCRICAOEMPTMO, 
                   CON.DATASITUACAO, 
                   CON.DATACANC, 
                   CON.VLRSALBASE, 
                   CON.VLRMARGEM, 
                   SPP.DESCRICAO AS SIT_PLANO, 
                   PPP.INSCRICAONUMERO AS INSC_PREVIDENCIARIA, 
                   INS.DATAINSC AS DATA_SOLICITACAO, 
                   SFU.DESCRICAO AS SITUACAO_FUN, 
                   PPC.NOME      AS PLANOORIGEM, 
                   CON.IDRESPONSAVEL, 
                   NVL(CON.NUMPARCDESCONTO, 0) AS NUMPARCDESCONTO, 
                   CON.CODAUTOEMP, 
                   TSE.TSEDESCRICAO AS DESC_SUSPENCAO, 
                   CON.DATAINICIOSUSP, 
                   CON.DATAFIMSUSP, 
                   RES.NOME AS NOMERESPONSAVEL, 
                   CED.NOME AS CEDIDO, 
                   CON.IDCONTRQUITACAO, 
                   FRP.DESCRICAO AS FORMA_PGTO_CRE, 
                   PTF_PAG.DESCRICAO AS CONTA_CAIXA, 
                   PTF_REC.DESCRICAO AS FORMA_PGTO_DEB, 
                   CON.FLGSITUACAO, 
                   CON.FLGFORMAREC, 
                   CON.FLGFORMAPAG, 
                   CON.IDPATRO, 
                   PLP.IDPLANOPREV, 
                   TPE.IDTIPOEMPTMO, 
                   NVL(CON.FLGEXCEPCIONAL,0) FLGEXCEPCIONAL, 
                   NVL(CON.FLGINTERNET,0) FLGINTERNET, 
                   DEP.IDTITULAR, 
                   NVL(CON.TSEMESES, 0) AS QTDEMESSUSP, 
                   (SELECT COUNT(1) FROM CONTRATOEMPTMO WHERE IDCONTRQUITACAO = CON.IDCONTRATOEMPTMO) AS QTDECONTQUITADO, 
                   TO_CHAR(NVL(CON.VLRMAXPERMIT, 0)) AS VLRMAXPERMIT, 
                   TO_CHAR(NVL(VLR.VALORMAX, 0)) AS VALORMAXPRESTACAO, 
                   SIP.FLGINTERNO, 
                   CON.NUMPROTOCOLO, 
                   VLR.DATAINICIO,  
                   VLR.DATAFIM,  
                   NVL(CON.FLGPERDAEFETIVA,0) FLGPERDAEFETIVA, 
              DECODE((SELECT DOC.DATAEMISSAO 
              FROM CM.DOCPESSOA DOC 
              INNER JOIN CM.PARAMEMPTMO PAR 
              ON PAR.IDDOCUMENTO = DOC.IDDOCUMENTO 
              WHERE DOC.IDPESSOA = CON.IDBENEF), 
             NULL, 0, 1) ISDOCUMENTOOBITO, 
             (SELECT IDDOCUMENTO FROM PARAMEMPTMO) AS IDDOCUMENTO 
              FROM CM.CONTRATOEMPTMO   CON, 
                   CM.PESSOA           PES, 
                   CM.DEPENTIT         DEP, 
                   CM.ELEGPATRO        ELP, 
                   CM.PATRO            PAT, 
                   CM.PESSOA           PPA, 
                   CM.TIPOCONTREMPTMO  TPC, 
                   CM.MOEDA            MOE, 
                   CM.TIPOEMPTMO       TPE, 
                   CM.PLANPREV         PLP, 
                   CM.PARTPREVPLAN     PPP, 
                   CM.SITPART          SIP, 
                   CM.PESSOAFISICA     PEF, 
                   CM.SITPLANOPREV     SPP, 
                   CM.SITFUNC          SFU, 
                   CM.PLANPREVCONTABIL PPC, 
                   CM.INSCRICAOEMPTMO  INS, 
                   CM.TIPOSUSPEMPTMO   TSE, 
                   CM.PESSOA           RES, 
                   CM.PESSOA           CED, 
                   CM.FORMARECPAG      FRP, 
                   CM.PORTADORFORMA PTF_PAG, 
                   CM.PORTADORFORMA PTF_REC, 
                   CM.VALORMAXPRESTEP VLR 
             WHERE CON.IDBENEF = PES.IDPESSOA 
               AND CON.IDPESSOA = DEP.IDTITULAR 
               AND CON.IDBENEF = DEP.IDPESSOA 
               AND CON.IDPESSOA = ELP.IDPESSOA 
               AND CON.IDTIPOCONTREMPTMO = TPC.IDTIPOCONTREMPTMO 
               AND CON.IDPLANOPREV = PLP.IDPLANOPREV 
               AND CON.MOECODIGO = MOE.MOECODIGO 
               AND CON.IDPATRO = PAT.IDPESSOA 
               AND PAT.IDPESSOA = PPA.IDPESSOA 
               AND TPC.IDTIPOEMPTMO = TPE.IDTIPOEMPTMO 
               AND ELP.IDPESSOA = PPP.IDPESSOA 
               AND PPP.IDSITPART = SIP.IDSITPART 
               AND CON.IDBENEF = PEF.IDPESSOA (+) 
               AND PPP.IDSITPLANOPREV     = SPP.IDSITPLANOPREV 
               AND CON.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO(+) 
               AND ELP.IDSITFUNC          = SFU.IDSITFUNC 
               AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV 
               AND CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+) 
               AND CON.IDRESPONSAVEL      = RES.IDPESSOA(+) 
               AND ELP.IDPESSJURCEDIDO    = CED.IDPESSOA(+) 
               AND CON.CODFORMAPAG       = FRP.CODFORMA 
               AND CON.PORTFORMAPAG      = PTF_PAG.CODPORTFORMA 
               AND CON.PORTFORMAREC      = PTF_REC.CODPORTFORMA 
               AND CON.IDCONTRATOEMPTMO  = VLR.IDCONTRATOEMPTMO(+) 
               AND (PPP.IDPLANOPREV =                               
               (SELECT MAX(PPP2.IDPLANOPREV) FROM CM.PARTPREVPLAN PPP2 
               WHERE PPP2.FLGDESATIVADO = 0                         
               AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                 
               (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                
               (SELECT 1 FROM CM.PARTPREVPLAN PPP1                     
               WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   
               AND PPP1.FLGDESATIVADO = 0) AND                      
               (PPP.IDSITPLANOPREV = 25 OR                          
               (PPP.IDPLANOPREV = (SELECT MAX(PPP1.IDPLANOPREV)     
               FROM CM.PARTPREVPLAN PPP1                               
               WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   
               AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =      
               (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE)) 
               FROM CM.PARTPREVPLAN PPP2                               
               WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)                 
               AND NOT EXISTS (SELECT 1 FROM CM.PARTPREVPLAN PPP2      
               WHERE PPP2.IDPESSOA = PPP1.IDPESSOA                  
               AND PPP2.IDSITPLANOPREV = 25))))))                   
               AND CON.IDCONTRATOEMPTMO = :NUMERO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.Int64, numero.ToString());

                // Popula objeto resultante
                Contrato contrato = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        contrato = new Contrato();
                        contrato.numero = Convert.ToInt64(leitor.GetValue(NUMCONTRATO_CONTRATO));
                        contrato.dataAssinatura = leitor.obterValorData(DATAASSINATURA_CONTRATO);
                        contrato.dataCredito = leitor.obterValorData(DATACREDITO_CONTRATO);
                        contrato.dataPrimeiraParcela = leitor.obterValorData(DATAPRIMPARC_CONTRATO);
                        contrato.taxaJuros = leitor.obterValorDecimal(TXJUROS_CONTRATO) != null ? (double?)leitor.obterValorDecimal(TXJUROS_CONTRATO) : null;
                        contrato.valorContrato = leitor.obterValorDecimal(VLRCONTRATO_CONTRATO) != null ? (double?)leitor.obterValorDecimal(VLRCONTRATO_CONTRATO) : null;
                        contrato.totalParcelas = Convert.ToInt32(leitor.GetValue(NUMPARCELAS_CONTRATO));
                        contrato.valorParcela = leitor.obterValorDecimal(VLRPARCELA_CONTRATO) != null ? (double?)leitor.obterValorDecimal(VLRPARCELA_CONTRATO) : null;
                        contrato.valorMargem = leitor.obterValorDecimal(VALOR_MARGEM_CONTRATO) != null ? (double?)leitor.obterValorDecimal(VALOR_MARGEM_CONTRATO) : null;
                        contrato.dataCancelamento = leitor.obterValorData(DATA_CANCELAMENTO_CONTRATO);
                        contrato.salarioBase = leitor.obterValorDecimal(SALARIO_BASE_CONTRATO) != null ? (double?)leitor.obterValorDecimal(SALARIO_BASE_CONTRATO) : null;
                        contrato.contratoQuitacao = !string.IsNullOrEmpty(leitor.obterString(IDCONTRQUITACAO)) ? Convert.ToInt64(leitor.GetValue(IDCONTRQUITACAO)) : 0;
                        contrato.dataSolicitacao = leitor.obterValorData(DATA_SOLICITACAO);
                        contrato.nomeResponsavel = leitor.obterString(NOMERESPONSAVEL);
                        contrato.numeroParcelasAtrasadas = Convert.ToInt32(leitor.GetValue(NUMPARCDESCONTO));
                        contrato.codigoAutoEmprestimo = !string.IsNullOrEmpty(leitor.obterString(CODAUTOEMP)) ? Convert.ToInt64(leitor.GetValue(CODAUTOEMP)) : 0;
                        contrato.dataInicioSuspensao = leitor.obterValorData(DATAINICIOSUSP);
                        contrato.dataFimSuspensao = leitor.obterValorData(DATAFIMSUSP);
                        contrato.formaPagamento = leitor.obterString(FORMA_PGTO_CRE);
                        contrato.portadorCredito = leitor.obterString(CONTA_CAIXA);
                        contrato.portadorDebito = leitor.obterString(FORMA_PGTO_DEB);
                        contrato.flagFormaPagamento = leitor.obterString(FLGFORMAPAG_CONTRATO);
                        contrato.flagFormaRecebimento = leitor.obterString(FLGFORMAREC_CONTRATO);
                        contrato.excepcional = Convert.ToBoolean(Convert.ToInt32(leitor.GetValue(FLGEXCEPCIONAL_CONTRATO)));
                        contrato.internet = Convert.ToBoolean(Convert.ToInt32(leitor.GetValue(FLGINTERNET_CONTRATO)));
                        contrato.efetiva = Convert.ToBoolean(Convert.ToInt32(leitor.GetValue(FLGPERDAEFETIVA_CONTRATO)));
                        contrato.numProtocolo = leitor.obterString(NUMPROTOCOLO);
                        contrato.dataFinalVlrMax = leitor.obterValorData(DATAFINALVLRMAX);
                        contrato.dataInicioVlrMax = leitor.obterValorData(DATAINICIOVLRMAX);

                        contrato.situacao = new SituacaoContrato()
                        {
                            codigo = leitor.obterString(FLGSITUACAO_CONTRATO),
                            descricao = leitor.obterString(SITUACAO_CONTRATO)
                        };

                        contrato.tipo = new TipoContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOCONTREMPTMO_CONTRATO)),
                            descricao = leitor.obterString(TIPO_CONTRATO_CONTRATO)
                        };
                        contrato.mutuario = new Mutuario()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDPESSOA_CONTRATO)),
                            matricula = leitor.obterString(MATRICULA_MUTUARIO_CONTRATO),
                            nome = leitor.obterString(NOME_MUTUARIO_CONTRATO),
                            cpf = leitor.obterString(NUMDOCUMENTO_CONTRATO),
                            situacao = leitor.obterString(SIT_PARTICIPANTE_CONTRATO),
                            dataFalecimento = leitor.obterValorData(DATA_FALECIMENTO),
                            inscricaoPrevidenciaria = Convert.ToInt64(leitor.GetValue(INSCRICAO_PREVIDENCIARIA)),
                            idTitular = Convert.ToInt32(leitor.GetValue(IDTITULAR_CONTRATO)),//HELEN BIANCHI - ADD CAMPO CONFORME EMAIL
                            flginternoParticipante = leitor.obterString(FLGINTERNO),
                        };
                        contrato.patrocinadora = new Patrocinadora()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDPATROCINADORA_CONTRATO)),
                            nome = leitor.obterString(PATROCINADORA_CONTRATO),
                            situacaoFuncional = leitor.obterString(SITUACAO_FUN),
                            nomeCedido = leitor.obterString(CEDIDO)
                        };
                        contrato.plano = new PlanoPrevidenciario()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDPLANOPREVIDENCIAO_CONTRATO)),
                            descricao = leitor.obterString(PLANO_PREVIDENCIARIO_CONTRATO),
                            situacao = leitor.obterString(SITUACAO_PLANO),
                            planoOrigem = leitor.obterString(PLANO_ORIGEM)
                        };
                        contrato.tipoEmprestimo = new TipoEmprestimo()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOEMPRESTIMO_CONTRATO)),
                            descricao = leitor.obterString(TIPO_EMPRESTIMO_CONTRATO)
                        };
                        contrato.indexador = new Moeda()
                        {
                            sigla = leitor.obterString(INDEXADOR_CONTRATO)
                        };
                        contrato.beneficiario = new Beneficiario()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDBENEFICIARIO))
                        };
                        contrato.inscricaoEmprestimo = new InscricaoEmprestimo()
                        {
                            id = Convert.ToInt64(leitor.GetValue(IDINSCRICAO_EMPRESTIMO))
                        };
                        contrato.suspensao = new Suspensao()
                        {
                            descricao = leitor.obterString(DESC_SUSPENCAO)
                        };
                        contrato.mesesSuspencao = Convert.ToInt32(leitor.GetValue(QTDEMESSUSP));
                        contrato.nrContratosQuitados = Convert.ToInt32(leitor.GetValue(QTDECONTQUITADO));
                        contrato.valorMaximo = (double)leitor.obterDecimal(VLRMAXPERMIT);
                        contrato.valorMaxPrestacao = (double)leitor.obterDecimal(VALORMAXPRESTACAO);
                        //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
                        contrato.isDocumentoObito = Convert.ToInt32(leitor.GetValue(ISDOCUMENTOOBITO));
                        contrato.numeroDocumentoParamPrev = Convert.ToInt32(leitor.GetValue(NUMERODOCUMENTOPARAMPREV));
                        //marcio sanches spinosa sol 199356  kintana 1931062 - Fim

                        contrato.veioConector = veioConector;
                    }
                }

                return contrato;
            }
        }
        ////Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Inicio
        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <param name="pIsConcessao">Chamada da tela de concessão</param>/// 
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultar(long numero, bool veioConector, bool pIsConcessao)
        {
            string query;

            //// Consulta
            query = @" SELECT CON.IDBENEF, 
                    CON.IDCONTRATOEMPTMO AS CONTRATO, 
                    DEP.MATRICULA, 
                    CON.IDTIPOCONTREMPTMO, 
                    CON.TXJUROS, 
                    PEF.DATAMORTE, 
                    DEP.IDTITULAR, 
                    DEP.IDPESSOA
                    FROM CM.CONTRATOEMPTMO   CON, 
                    CM.DEPENTIT         DEP, 
                    CM.PESSOAFISICA     PEF 
                    WHERE CON.IDPESSOA = DEP.IDTITULAR 
                    AND CON.IDBENEF = DEP.IDPESSOA 
                    AND CON.IDBENEF = PEF.IDPESSOA 
                    AND CON.IDCONTRATOEMPTMO = :NUMERO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.Int64, numero.ToString());

                // Popula objeto resultante
                Contrato contrato = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        contrato = new Contrato()
                        {
                            /*Não foram utilizados ainda.
                                DATA_SITUACAO                            
                                IDRESPONSAVEL
                            */
                            numero = Convert.ToInt64(leitor.GetValue(NUMCONTRATO_CONTRATO)),
                            taxaJuros = leitor.obterValorDecimal(4) != null ? (double?)leitor.obterValorDecimal(4) : null,
                            mutuario = new Mutuario()
                            {
                                id = Convert.ToInt32(leitor.GetValue(7)),//William Moreira da Silva SOL 211940
                                matricula = leitor.obterString(2),
                                dataFalecimento = leitor.obterValorData(5),
                                idTitular = Convert.ToInt32(leitor.GetValue(6))
                            },
                            beneficiario = new Beneficiario()
                            {
                                id = Convert.ToInt32(leitor.GetValue(0))
                            },
                            veioConector = veioConector
                        };
                    }
                }

                return contrato;
            }
        }
        ////Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Fim 
        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultarContaCorrente(long numero)
        {
            string query;

            #region Query

            // Consulta
            query = @" SELECT INS.IDINSCRICAOEMPTMO AS INSCRICAO, 
                   CNT.DATAASSINATURA, 
                   CNT.IDCONTRATOEMPTMO, 
                   CNT.IDBENEF, 
                   CNT.DATACREDITO, 
                   CNT.VLRCONTRATO, 
                   CNT.FLGFORMAPAG, 
                   CNT.FLGFORMAREC, 
                   CNT.PORTFORMAPAG, 
                   CNT.PORTFORMAREC, 
                   CNT.IDCBANCARIADEB, 
                   DECODE(CNT.FLGSITUACAO, 
                          'A', 
                          'Ativo', 
                          'C', 
                          'Cancelado', 
                          'E', 
                          'Encerrado', 
                          'Q', 
                          'Quitado', 
                          'R', 
                          'Refinanciado', 
                          'S', 
                          'Suspenso', 
                          'K', 
                          'Pendente de Quitação') AS DESCSITCONTRATO, 
                   CNT.IDTIPOSUSPEMPTMO, 
                   CNT.DATAINICIOSUSP, 
                   CNT.DATAFIMSUSP, 
                   CNT.DATALIBSUSP, 
                   CNT.HORALIBSUSP, 
                   CNT.USUARIOLIBSUSP, 
                   CNT.IDTIPOCONTREMPTMO, 
                   CNT.FLGSUSPENSAOAUTO, 
                   CNT.ANOSUSPENSAO, 
                   CNT.MESSUSPENSAO, 
                   CNT.NUMPARCDESCONTO, 
                   PPP.INSCRICAONUMERO, 
                   SIT.DESCRICAO AS SITUACAO, 
                   PLV.NOME AS PLANOPREV, 
                   JUR.NOME AS PATRO, 
                   ELP.MATRICULA, 
                   TIT.NOME AS TITULAR, 
                   BEN.NOME AS BENEFICIARIO, 
                   TIP.TCEDESCRICAO, 
                   TEM.DESCTIPOEMPTMO, 
                   BAN.NOME AS BANCO, 
                   CTB.CONTACORRENTE, 
                   AGB.NUMAGENCIA, 
                   NVL(FLGOBRIGBENEF, 0) AS FLGOBRIGBENEF ,
                   CNT.IDPESSOA 
              FROM CM.PESSOA          JUR, 
                   CM.PESSOA          TIT, 
                   CM.PESSOA          BEN, 
                   CM.PESSOA          BAN, 
                   CM.AGENCIABANCARIA AGB, 
                   CM.CONTABANCARIA   CTB, 
                   CM.PARTPREVPLAN    PPP, 
                   CM.ELEGPATRO       ELP, 
                   CM.TIPOCONTREMPTMO TIP, 
                   CM.TIPOEMPTMO      TEM, 
                   CM.SITPART         SIT, 
                   CM.CONTRATOEMPTMO  CNT, 
                   CM.INSCRICAOEMPTMO INS, 
                   CM.PLANPREV        PLV 
             WHERE CNT.IDCONTRATOEMPTMO = :NUMERO_P 
               AND CNT.IDPESSOA = PPP.IDPESSOA 
               AND CNT.IDPATRO = PPP.IDPESSJUR 
               AND SIT.IDSITPART = PPP.IDSITPART 
               AND CNT.IDPLANOPREV = PLV.IDPLANOPREV 
               AND CNT.IDPATRO = JUR.IDPESSOA 
               AND CNT.IDPESSOA = ELP.IDPESSOA 
               AND CNT.IDPATRO = ELP.IDPESSJUR 
               AND CNT.IDPESSOA = TIT.IDPESSOA 
               AND CNT.IDBENEF = BEN.IDPESSOA 
               AND CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO 
               AND TIP.IDTIPOEMPTMO = TEM.IDTIPOEMPTMO 
               AND CNT.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO(+) 
               AND INS.IDCBANCARIADEB = CTB.IDCBANCARIA(+) 
               AND CTB.IDAGENCIA = AGB.IDPESSOA(+) 
               AND AGB.IDBANCO = BAN.IDPESSOA(+) 
               AND PPP.INSCRICAODATA = 
                   (SELECT MAX(B.INSCRICAODATA) 
                      FROM CM.PARTPREVPLAN B 
                     WHERE B.IDPESSOA = PPP.IDPESSOA 
                       AND B.IDPESSJUR = PPP.IDPESSJUR) ";

            #endregion

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.Int64, numero.ToString());

                // Popula objeto resultante
                Contrato contrato = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        contrato = new Contrato()
                        {
                            numero = Convert.ToInt64(leitor.GetValue(IDCONTRATO_DADOS)),
                            dataAssinatura = leitor.obterValorData(DATASSINATURA_DADOS),
                            dataCredito = leitor.obterValorData(DATACREDITO_DADOS),
                            valorContrato = leitor.obterValorDecimal(VALORCONTRATO_DADOS) != null ? (double?)leitor.obterValorDecimal(VALORCONTRATO_DADOS) : null,
                            formaRecebimento = leitor.obterString(FORMARECEBIMENTO_DADOS),
                            numeroParcelasAtrasadas = Convert.ToInt32(leitor.GetValue(NUMPARCELASDESCO_DADOS)),
                            inscricaoEmprestimo = new InscricaoEmprestimo()
                            {
                                id = Convert.ToInt64(leitor.GetValue(INCRICAO_DADOS))
                            },
                            situacao = new SituacaoContrato()
                            {
                                descricao = leitor.obterString(DESCSITCONTRATO_DADOS)
                            },
                            patrocinadora = new Patrocinadora()
                            {
                                nome = leitor.obterString(PATRO_DADOS)
                            },
                            mutuario = new Mutuario()
                            {
                                id = Convert.ToInt32(leitor.GetValue(IDPESSOA_DADOS)),
                                nome = leitor.obterString(TITULAR_DADOS),
                                matricula = leitor.obterString(MATRICULA_DADOS),
                                situacao = leitor.obterString(SITUACAO_DADOSBANCARIOS_DADOS),
                                dadosBancarios = new DadosBancarios()
                                {
                                    id = Convert.ToInt32(leitor.GetValue(IDCONTABANCARIADEBITO_DADOS))
                                },
                                inscricaoPrevidenciaria = Convert.ToInt32(leitor.GetValue(INSCRICAONUMERO_DADOS))
                            },
                            beneficiario = new Beneficiario()
                            {
                                nome = leitor.obterString(BENEFICIARIO_DADOS)
                            },
                            tipoEmprestimo = new TipoEmprestimo()
                            {
                                descricao = leitor.obterString(TCEDESCRICAO_DADOSBANCARIOS_DADOS)
                            },
                            tipo = new TipoContrato()
                            {
                                descricao = leitor.obterString(DESCTIPOEMPTMO_DADOS)
                            },
                            plano = new PlanoPrevidenciario()
                            {
                                descricao = leitor.obterString(PLANOPREV_DADOS)
                            }
                        };
                    }
                }

                return contrato;
            }
        }

        /// <summary>
        /// Consulta logs de dados contratuais
        /// </summary>
        public List<Contrato> consultarLogDadosContratuais(long numero)
        {
            string query;

            query = @" SELECT 
             H.IDCONTRATOEMPTMO,
             B.NOME || ' - ' || TRIM(A.NUMAGENCIA) || ' - ' || C.CONTACORRENTE AS CONTACORRENTE,
             H.TRGUSERINCLUSAO,
             H.TRGDTINCLUSAO 
             FROM CM.HSTCBANCARIAEMPTMO H, CM.CONTABANCARIA C, CM.PESSOA B, CM.AGENCIABANCARIA A 
             WHERE H.IDCBANCARIADEB = IDCBANCARIA 
             AND   C.IDAGENCIA = A.IDPESSOA
             AND   A.IDBANCO = B.IDPESSOA
             AND   H.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P 
             ORDER BY H.TRGDTINCLUSAO DESC ";

            //Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numero);

                List<Contrato> logs = new List<Contrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Contrato contrato = new Contrato();
                        contrato.mutuario = new Mutuario { dadosBancarios = new DadosBancarios { contaCorrente = leitor.obterString(1) } };
                        contrato.usuario = new Usuario { login = leitor.obterString(2) };
                        contrato.dataSolicitacao = leitor.obterValorData(3);

                        logs.Add(contrato);
                    }
                }

                return logs;
            }

        }

        /// <summary>
        /// Pesquisa Contratos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> pesquisar(Contrato contrato, ref ParametrosConsulta parametros)
        {
            string query;

            bool buscarNumero = contrato.numero > 0;
            bool buscarSituacao = contrato.idSituacao != null && contrato.idSituacao != "0";
            bool buscarMatricula = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.matricula);
            bool buscarCPF = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.cpf);
            bool buscarNome = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.nome);
            bool buscarSuspensao = contrato.suspensao != null && contrato.suspensao.tipo != null && contrato.suspensao.tipo.id > 0;

            // Consulta
            query = @" SELECT CON.IDCONTRATOEMPTMO,
                   CON.FLGSITUACAO, 
                   DECODE(CON.FLGSITUACAO, 
                       'A', 'ATIVO', 
                       'E', 'ENCERRADO', 
                       'J', 'EM COBRANÇA JURÍDICA', 
                       'K', 'EM QUITAÇÃO', 
                       'Q', 'QUITADO', 
                       'R', 'RENOVADO', 
                       'C','CANCELADO') AS SITUACAO, 
                   PDP.NOME, 
                   DEP.MATRICULA, 
                   TCE.TCEDESCRICAO, 
                   CON.DATAASSINATURA, 
                   CON.DATACREDITO, 
                   TSE.TSEDESCRICAO, 
                   TEM.DESCTIPOEMPTMO, 
                   PLP.NOME AS NOME_PLANO, 
                   PPA.NOME AS PATROCINADORA, 
                   CON.IDINSCRICAOEMPTMO, 
                   PDP.NUMDOCUMENTO AS CPF, 
                   CON.IDTIPOCONTREMPTMO, 
                   SPP.DESCRICAO AS SIT_PLANO, 
                   TEM.IDTIPOEMPTMO, 
                   PDP.IDPESSOA
              FROM CM.PESSOA PDP, 
                   CM.PESSOA PPA, 
                   CM.DEPENTIT DEP, 
                   CM.CONTRATOEMPTMO  CON, 
                   CM.TIPOCONTREMPTMO TCE, 
                   CM.TIPOSUSPEMPTMO  TSE, 
                   CM.TIPOEMPTMO      TEM, 
                   CM.PLANPREV        PLP, 
                   CM.PARTPREVPLAN    PPP, 
                   CM.SITPLANOPREV    SPP, 
                   CM.ELEGPATRO       ELP  
             WHERE ELP.IDPESSJUR = PPA.IDPESSOA  
               AND ELP.IDPESSJUR = PPP.IDPESSJUR 
               AND ELP.IDPESSOA  = PPP.IDPESSOA  
               AND ELP.IDPESSOA  = DEP.IDTITULAR 
               AND CON.IDPATRO   = PPA.IDPESSOA  
               AND CON.IDPESSOA = DEP.IDTITULAR 
               AND CON.IDBENEF = DEP.IDPESSOA   
               AND CON.IDBENEF = PDP.IDPESSOA   
               AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO    
               AND CON.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO (+) 
               AND CON.IDPLANOPREV       = PLP.IDPLANOPREV          
               AND TCE.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO         
               AND DEP.IDTITULAR         = PPP.IDPESSOA             
               AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV       
               AND (PPP.IDPLANOPREV =                               
               (SELECT MAX(PPP2.IDPLANOPREV) FROM CM.PARTPREVPLAN PPP2 
               WHERE PPP2.FLGDESATIVADO = 0                         
               AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                 
               (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                
               (SELECT 1 FROM CM.PARTPREVPLAN PPP1                     
               WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   
               AND PPP1.FLGDESATIVADO = 0) AND                      
               (PPP.IDSITPLANOPREV = 25 OR                          
               (PPP.IDPLANOPREV = (SELECT MAX(PPP1.IDPLANOPREV)     
               FROM CM.PARTPREVPLAN PPP1                               
               WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   
               AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =      
               (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE)) 
               FROM CM.PARTPREVPLAN PPP2                               
               WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)                 
               AND NOT EXISTS (SELECT 1 FROM CM.PARTPREVPLAN PPP2      
               WHERE PPP2.IDPESSOA = PPP1.IDPESSOA                  
               AND PPP2.IDSITPLANOPREV = 25))))))                   ";

            // Filtros
            if (buscarMatricula)
                //query = query + $@" AND  (DEP.MATRICULA LIKE '{contrato.mutuario.matricula}' OR ELP.MATRICULA LIKE '{contrato.mutuario.matricula}') ";
                query = query + $@" AND  DEP.MATRICULA = '{contrato.mutuario.matricula}'";
            //OTACILIO SOL 204373 KTN 1975310 ** FIM **

            if (buscarNumero)
                query = query + $@" AND  CON.IDCONTRATOEMPTMO LIKE '{contrato.numero.ToString()}' || '%' ";
            if (buscarSituacao)
                query = query + $@" AND  CON.FLGSITUACAO = '{contrato.idSituacao.ToString()}' ";
            if (buscarCPF)
                query = query + $@" AND  PDP.NUMDOCUMENTO LIKE '{contrato.mutuario.cpf}' || '%' ";
            if (buscarNome)
                query = query + $@" AND  PDP.NOME LIKE '{contrato.mutuario.nome.ToUpper()}' || '%' ";
            if (buscarSuspensao)
                query = query + $@" AND  CON.IDTIPOSUSPEMPTMO = {contrato.suspensao.tipo.id} ";

            // Ordenação
            query = query + @" ORDER BY DECODE(CON.FLGSITUACAO, 'A', 'A', 'K', 'B', 'E', 'C', 'Q', 'D', 'C', 'Z', 'Y'), CON.DATACREDITO DESC ";//NILTON - CORRECAO - 06/02/13.

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.obterComandoPorSql(UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.obterComandoPorSql(query);

            // Parâmetros
            //if (buscarMatricula)
            //    bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, contrato.mutuario.matricula);
            //    bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, contrato.mutuario.matricula);
            //if (buscarNumero)
            //    bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.String, contrato.numero.ToString());
            //if (buscarCPF)
            //    bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, contrato.mutuario.cpf);
            //if (buscarNome)
            //    bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, contrato.mutuario.nome.ToUpper());
            //if (buscarSituacao)
            //    bancoDeDados.AddInParameter(comando, "FLGSITUACAO_P", DbType.String, contrato.idSituacao.ToString());
            //if (buscarSuspensao)
            //    bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int32, contrato.suspensao.tipo.id);

            // Popula objetos resultantes
            List<Contrato> contratos = new List<Contrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Contrato item = new Contrato()
                    {
                        numero = Convert.ToInt64(leitor.GetValue(IDCONTRATOEMPTMO_PESQUISAR)),
                        idSituacao = leitor.obterString(SITUACAO_PESQUISAR),
                        dataAssinatura = leitor.obterValorData(DATAASSINATURA_PESQUISAR),
                        dataCredito = leitor.obterValorData(DATACREDITO_PESQUISAR),
                        tipo = new TipoContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOCONTREMPTMO_PESQUISAR)),
                            descricao = leitor.obterString(TCEDESCRICAO_PESQUISAR)
                        },
                        mutuario = new Mutuario()
                        {
                            matricula = leitor.obterString(MATRICULA_PESQUISAR),
                            nome = leitor.obterString(NOME_PESQUISAR),
                            cpf = leitor.obterString(CPF_PESQUISAR),
                            IdPessoa = leitor.obterInt(17),

                        },
                        tipoEmprestimo = new TipoEmprestimo()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOEMPTMO_PESQUISAR)),
                            descricao = leitor.obterString(DESCTIPOEMPTMO_PESQUISAR)
                        },
                        plano = new PlanoPrevidenciario()
                        {
                            descricao = leitor.obterString(NOME_PLANO_PESQUISAR),
                            situacao = leitor.obterString(SIT_PLANO_PESQUISAR)
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            nome = leitor.obterString(PATROCINADORA_PESQUISAR)
                        }
                    };

                    contratos.Add(item);
                }
            }

            // Total de Regristros
            parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query.ToString());

            // Retorna informações
            parametros.prepararRetorno();

            //comando.Connection.Close();
            comando.Dispose();

            return contratos;
        }

        //William Moreira da Silva - SOL 243166 PPM 603594
        /// <summary>
        /// Busca as informações sobre a localização da FUNCEF
        /// </summary>
        /// <returns>Informações da cidade, estado e pais onde a FUNCEF esta localizada</returns>
        public Cidade buscaLogradouro()
        {
            string query;
            Cidade cidade = new Cidade();

            // Consulta
            query = @" SELECT ES.IDPAIS, ES.CODESTADO, C.IDCIDADES 
                FROM CM.PESSOA P, CM.ENDPESS E, CM.CIDADES C, CM.ESTADO  ES 
                WHERE (P.IDPESSOA =  1) AND 
                      (P.IDPESSOA = E.IDPESSOA) AND 
                      (P.IDENDCOMERCIAL = E.IDENDERECO) AND 
                      (E.IDCIDADES = C.IDCIDADES) AND 
                      (C.IDESTADO = ES.IDESTADO) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                using (IDataReader reader = bancoDeDados.ExecuteReader(comando))
                {
                    if (reader.Read())
                    {
                        cidade.pais = new Pais()
                        {
                            idPais = Convert.ToInt32(reader.GetValue(0))
                        };
                        cidade.estado = new UF()
                        {
                            codEstado = reader.obterString(1)

                        };
                        cidade.idCidade = Convert.ToInt32(reader.GetValue(2));
                    }
                }

                return cidade;
            }
        }
        //William Moreira da Silva - SOL 243166 PPM 603594

        /// <summary>
        /// Consulta se uma data é feriado ou não.
        /// </summary>
        /// <param name="data">Data a ser verificada.</param>
        /// <returns><see cref="System.Boolean"/> com verdadeiro se a data é feriado ou falso se a data não for.</returns>
        public bool verificarDataFeriado(DateTime data)
        {
            string query;

            //William Moreira da Silva - SOL 243166 PPM 603594
            bool calculaTodosFeriado = true;

            Cidade cidade = this.buscaLogradouro();
            int idPais = cidade.pais.idPais;
            string codEstado = cidade.estado.codEstado;
            int idCidades = cidade.idCidade;
            //William Moreira da Silva - SOL 243166 PPM 603594

            // Consulta
            query = @" SELECT DATAFERIADO 
            FROM CM.FERIADOS 
            WHERE TRUNC(DATAFERIADO) = TRUNC(:DATA_P) ";

            //William Moreira da Silva - SOL 243166 PPM 603594
            if (calculaTodosFeriado)
            {
                query = query + @"  AND (((IDPAIS = " + idPais.ToString() + @") AND (IDCIDADES IS NULL) AND (CODESTADO IS NULL)) OR
              ((IDPAIS = " + idPais.ToString() + @") AND (IDCIDADES IS NULL) AND (CODESTADO = '" + codEstado + @"')) OR
              ((IDPAIS = " + idPais.ToString() + @") AND (IDCIDADES = " + idCidades.ToString() + @") AND (CODESTADO = '" + codEstado + @"'))) ";
            }
            //William Moreira da Silva - SOL 243166 PPM 603594

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "DATA_P", DbType.DateTime, data);

                // Executa a consulta
                bool feriado = false;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    feriado = leitor.Read();
                }

                //Marcio Sanches Spinosa - SOL 243166 PPM 603594
                ////comando.Connection.Close();
                //comando.Dispose();
                //Marcio Sanches Spinosa - SOL 243166 PPM 603594

                return feriado;
            }
        }

        /// <summary>
        /// Verifica se exite mais de uma atualização do Saldo devedor do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        /// <param name="tipoEvento">Tipo de Evento.</param>
        public bool verificarAtualizacaoSaldo(long numeroContrato, DateTime dataReferencia, TipoEvento tipoEvento)
        {
            string query;

            bool existeAtualizacao = false;

            // Consulta
            query = @" SELECT 
               COUNT(IDHISTMOVEMPTMO) QTDE 
             FROM 
               HISTMOVEMPTMO HME, CM.CONTRATOEMPTMO CON 
             WHERE  HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
               AND HME.HMETIPOMOV = :ID_TIPOEVENTO_P 
               AND TRUNC(HME.HMEDATAPREVISTA) > TRUNC(:DATAAMORTIZACAO_P) 
               AND ( HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL ) 
               AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "ID_TIPOEVENTO_P", DbType.Int32, tipoEvento.chave);
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, dataReferencia);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existeAtualizacao = (Convert.ToInt32(leitor.GetValue(QTDE_ATU_SALDO)) <= 1);
                    }
                }
            }

            return existeAtualizacao;
        }

        /// <summary>
        /// Verifica se existe atualização diária para uma data no histórico do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        public bool verificarAtualizacaoDiaria(long numeroContrato, DateTime dataReferencia)
        {
            string query;

            bool existeAtualizacao = false;

            // Consulta
            query = @"SELECT COUNT(DATAPREVISTA) QTDE
FROM HMEATUDIARIA HME
              WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
AND  HME.DATAPREVISTA = :DATAREFERENCIA_P
AND  HME.FLGESTORNADO = 0";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataReferencia);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existeAtualizacao = (Convert.ToInt32(leitor.GetValue(QTDE_ATU_DIARIA)) > 0);
                    }
                }

                return existeAtualizacao;
            }
        }

        // Xavier SOL 177146 inicio.
        /// <summary>
        /// o sistema apresenta aviso para os casos de amortização em que o débito for comandado anterior à alguma prestação
        /// se na última parcela a data HMEDATAPREVISTA for > que Data da Amortização ... Será apresentada a msg.
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataVencimento"></param>
        /// <returns></returns>
        public bool VerificarValorAmortizacao(long numeroContrato, DateTime dataVencimento)
        {
            string query;

            bool resultado = false;

            // Consulta
            query = @" SELECT HME.HMEDATAPREVISTA FROM HISTMOVEMPTMO HME 
             WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
             AND HMETIPOMOV = 1 AND HMEORIGEM = 1 AND HMECENTRALIZA = 1 
             AND HMEDATAPREVISTA >= :DATAVENCTO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "DATAVENCTO_P", DbType.DateTime, dataVencimento);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        resultado = true;
                    }
                }

                return resultado;
            }
        }
        // Xavier SOL 177146 Final.

        /// <summary>
        /// Verificar se existe parcela atrasada em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        public bool parcelaAtrasadaEmAberto(long numeroContrato, DateTime dataReferencia)
        {
            string query;

            bool existeParcela = false;

            // Consulta
            query = $@" SELECT count( HME.IDHISTMOVEMPTMO) QTDE 
             FROM 
               HISTMOVEMPTMO HME 
             WHERE HME.IDCONTRATOEMPTMO = {numeroContrato} 
               AND HME.HMETIPOMOV           NOT IN (0, 5, 8) 
               AND HME.FLGBAIXADO = 0 
               AND HMEDATAEFETIVA IS NULL 
               AND HMEVLREFETIVO IS NULL 
               AND HME.HMEVLRPREVISTO      <> 0 
               AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1) 
               AND (NVL(HME.FLGESTORNADO, 0) = 0) 
               AND (NVL(HME.FLGSUSPENSAO, 0) = 0) 
               AND (NVL(HME.FLGQUITADO, 0)   = 0) 
               AND (NVL(HME.FLGABONADO, 0)   = 0) 

               AND (TO_DATE('{dataReferencia:dd/MM/yyyy}', 'DD/MM/YYYY')            IS NULL OR (TO_DATE('{dataReferencia:dd/MM/yyyy}', 'DD/MM/YYYY') IS NOT NULL AND HME.HMEDATAVENCTO + 7 < TO_DATE('{dataReferencia:dd/MM/yyyy}', 'DD/MM/YYYY'))) 
               AND ({dataReferencia.Month}        IS NULL OR ({dataReferencia.Month}  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'0000')) || trim(TO_CHAR(HME.HMEMESCOBRANCA,'00')) < {dataReferencia.Year} || {dataReferencia.Month}))) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                // Parâmetros
                //bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                //bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataReferencia);
                //bancoDeDados.AddInParameter(comando, "MES_DATAREFERENCIA_P", DbType.Int32, dataReferencia.Month);
                //bancoDeDados.AddInParameter(comando, "ANO_DATAREFERENCIA_P", DbType.Int32, dataReferencia.Year);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existeParcela = (Convert.ToInt32(leitor.GetValue(QTDE_PARCELA_ATRASADA)) > 0);
                    }
                }

            }
            return existeParcela;
        }

        /// <summary>
        /// Verifica se a pessoa tem itens em aberto em alguma contrato
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns></returns>
        //William Moreira da Silva - SOL 260829 PPM 1045813
        public bool verificaItensAberto(int idPessoa, int idTitular)
        {

            string query;
            //DateTime dtVcto = DateTime.Today;
            bool existeItem = false;

            query = @"select idcontratoemptmo
                        from CM.CONTRATOEMPTMO c
                        where c.idbenef = " + idPessoa + @" and
                              c.idpessoa = " + idTitular + @" and
                              exists ( 
                 select 1
                 from CM.hmeprestacao HME
                 where HME.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO
                       AND HME.FLGBAIXADO = 0
                       AND HME.DATAEFETIVA IS NULL
                       AND HME.VLREFETIVO IS NULL
                       AND HME.VLRPREVISTO <> 0
                       AND HME.NATUREZAITEM > 0
                       AND HME.FLGQUITABONOESTORNO = 0
                       AND HME.IDTIPOSUSPEMPTMO IS NULL
                       AND HME.DATAVENCTO < trunc(sysdate, 'month')
                 union all
                 select 1
                 from CM.hmequitacao HME
                 where HME.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO
                       AND HME.FLGBAIXADO = 0
                       AND HME.DATAEFETIVA IS NULL
                       AND HME.VLREFETIVO IS NULL
                       AND HME.VLRPREVISTO <> 0
                       AND HME.NATUREZAITEM > 0
                       AND HME.FLGESTORNADO = 0
                       AND HME.DATAVENCTO < trunc(sysdate, 'month')
                 union all
                 select 1
                 from CM.hmeamortizacao HME
                 where HME.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO
                       AND HME.FLGBAIXADO = 0
                       AND HME.DATAEFETIVA IS NULL
                       AND HME.VLREFETIVO IS NULL
                       AND HME.VLRPREVISTO <> 0
                       AND HME.NATUREZAITEM > 0
                       AND HME.FLGQUITABONOESTORNO = 0
                       AND HME.DATAVENCTO < trunc(sysdate, 'month')
                 union all
                 select 1
                 from CM.hmeencargos HME
                 where HME.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO
                       AND HME.FLGBAIXADO = 0
                       AND HME.DATAEFETIVA IS NULL
                       AND HME.VLREFETIVO IS NULL
                       AND HME.VLRPREVISTO <> 0
                       AND HME.NATUREZAITEM > 0
                       AND HME.FLGQUITABONOESTORNO = 0
                       AND HME.DATAVENCTO < trunc(sysdate, 'month')
                 union all
                 select 1
                 from CM.hmeajustecobranca HME
                 where HME.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO
                       AND HME.FLGBAIXADO = 0
                       AND HME.DATAEFETIVA IS NULL
                       AND HME.VLREFETIVO IS NULL
                       AND HME.VLRPREVISTO <> 0
                       AND HME.NATUREZAITEM > 0
                       AND HME.FLGQUITABONOESTORNO = 0
                       AND HME.DATAVENCTO < trunc(sysdate, 'month') ) ";

            //William Moreira da Silva - SOL 261154 PPM 1062246 - Alteração da consulta

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString()))
            {
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    existeItem = leitor.Read();
                }

                return existeItem;
            }
        }
        //William Moreira da Silva - SOL 260829 PPM 1045813

        // Thiago Melo SOL 208661 Kintana 2021125
        public bool temItensAbertoPorMatricula(String matricula)
        {
            StringBuilder query = new StringBuilder();

            DateTime dtVcto = DateTime.Today;
            bool existeItem = false;

            query.Append("SELECT HME.IDCONTRATOEMPTMO,");
            query.Append("       HME.IDHISTMOVEMPTMO,");
            query.Append("       HME.HMEANOCOMPETENCIA,");
            query.Append("       HME.HMEMESCOMPETENCIA,");
            query.Append("       HME.HMEDATAPREVISTA,");
            query.Append("       HME.HMEDATAVENCTO,");
            query.Append("       HME.HMEVLRPREVISTO");
            query.Append("  FROM HISTMOVEMPTMO HME");
            query.Append(" WHERE HME.IDCONTRATOEMPTMO IN");
            query.Append("       (SELECT C.IDCONTRATOEMPTMO");
            query.Append("          FROM CM.CONTRATOEMPTMO C, CM.DEPENTIT D");
            query.Append("         WHERE C.IDPESSOA  = D.IDTITULAR");
            query.Append("           AND C.IDBENEF   = D.IDPESSOA");
            query.Append("           AND D.MATRICULA = '" + matricula + "' )");
            query.Append("   AND HME.HMETIPOMOV NOT IN (0, 5, 8)");
            query.Append("   AND HME.FLGBAIXADO = 0");
            query.Append("   AND HME.HMEDATAEFETIVA IS NULL");
            query.Append("   AND HME.HMEVLREFETIVO  IS NULL");
            query.Append("   AND HME.HMEVLRPREVISTO <> 0");
            query.Append("   AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)");
            query.Append("   AND NVL(HME.FLGESTORNADO, 0) = 0");
            query.Append("   AND NVL(HME.FLGSUSPENSAO, 0) = 0");
            query.Append("   AND NVL(HME.FLGQUITADO, 0) = 0");
            query.Append("   AND NVL(HME.FLGABONADO, 0) = 0");
            query.Append("   AND (1 IS NULL OR (1 IS NOT NULL AND HME.HMEDATAVENCTO <");
            query.Append("       TO_DATE('" + Convert.ToString(String.Format("{0:dd/MM/yyyy}", dtVcto)) + "', 'DD/MM/YYYY')))");
            query.Append("   AND (1 IS NULL OR (1 IS NOT NULL AND (HME.HMEMESCOBRANCA <> TRIM(TO_CHAR(" + Convert.ToString(dtVcto.Month) + ",'00')) OR");
            query.Append("       HME.HMEANOCOBRANCA <> TRIM(TO_CHAR(" + Convert.ToString(dtVcto.Year) + ",'0000')))))");

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString()))
            {
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    existeItem = leitor.Read();
                }

                return existeItem;
            }
        }
        // Thiago Melo SOL 208661 Kintana 2021125


        /// <summary>
        /// Obtem itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public List<ItemContrato> obterItensEmAberto(long numeroContrato, ref ParametrosConsulta parametros)
        {
            string query;

            // Consulta
            query = $@" SELECT HME.HMETIPOMOV, 
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
               TO_CHAR(HME.HMEMESCOMPETENCIA, '00') || '/' || HME.HMEANOCOMPETENCIA AS ANOMESCOMP, 
               HME.HMEPARCELA, 
               HME.HMESEQCOBRANCA, 
               ITE.ITEDESCRICAO, 
               HME.HMEDATAPREVISTA, 
               HME.HMEDATAVENCTO, 
               TO_CHAR(HME.HMEVLRPREVISTO), 
               TO_CHAR(HME.HMETXJUROS), 
               TO_CHAR(HME.HMESALDODEV),  
               HME.HMEDATAEFETIVA, 
               TO_CHAR(HME.HMEVLREFETIVO), 
               TO_CHAR(HME.HMEMESCOBRANCA, '00') || '/' || HME.HMEANOCOBRANCA AS ANOMESCOBR 
             FROM HISTMOVEMPTMO  HME, 
               CM.TIPOSUSPEMPTMO TSE, 
               CM.ITEMEMPTMO     ITE  
             WHERE  HME.IDCONTRATOEMPTMO   = '{numeroContrato}' 
               AND 	( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 ) 
               AND 	 HME.HMETIPOMOV   IN  (1, 2, 3, 4, 7) 
               AND HME.FLGBAIXADO       = 0 
               AND HME.HMEVLREFETIVO    IS NULL 
               AND HME.HMEDATAEFETIVA   IS NULL 
               AND NVL(HME.FLGQUITADO, 0)    = 0 
               AND NVL(HME.FLGABONADO, 0)    = 0 
               AND NVL(HME.FLGESTORNADO, 0)  = 0 
               AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR 
                   (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1))
               AND HME.IDITEMEMPTMO          = ITE.IDITEMEMPTMO 
               AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+) 
             ORDER BY HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand cmd;

            if (parametros != null && parametros.paginacao != null)
                cmd = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                cmd = bancoDeDados.GetSqlStringCommand(query);

            using (DbCommand comando = cmd)
            {
                // Parâmetros
                //bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.String, numeroContrato);

                // Popula objetos resultantes
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
                        item.dataPrevista = leitor.GetDateTime(HMEDATAPREVISTA_ITENSABERTOS);
                        item.dataVencimento = leitor.GetDateTime(HMEDATAVENCTO_ITENSABERTOS);
                        item.valor = (double)leitor.obterDecimal(HMEVLRPREVISTO_ITENSABERTOS);
                        item.taxaJuros = leitor.obterValorDecimal(HMETXJUROS_ITENSABERTOS) != null ? (double?)leitor.obterValorDecimal(HMETXJUROS_ITENSABERTOS) : null;
                        item.saldoDevedor = leitor.obterValorDecimal(HMESALDODEV_ITENSABERTOS) != null ? (double?)leitor.obterValorDecimal(HMESALDODEV_ITENSABERTOS) : null;
                        item.dataEfetiva = leitor.obterValorData(HMEDATAEFETIVA_ITENSABERTOS);
                        item.valorEfetivo = leitor.obterValorInteiro(HMEVLREFETIVO_ITENSABERTOS);
                        item.dataCobranca = leitor.obterString(ANOMESCOBR_ITENSABERTOS);

                        itens.Add(item);
                    }
                }

                // Total de Registros
                parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
                parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query);

                // Retorna informações
                parametros.prepararRetorno();

                // Retorna informações
                return itens;
            }
        }

        //William Moreira da Silva SOL 211704
        /// <summary>
        /// Verifica se a parcela do mês já foi gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public DateTime? verificaParcelaGerada(long numeroContrato)
        {
            string query;
            DateTime? dataRetorno= null;

            query = @" SELECT HMEDATAVENCTO 
                       FROM HISTMOVEMPTMO HST 
                       WHERE HST.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
                       AND HST.IDITEMEMPTMO = 13 
                       AND NVL(HST.Flgestornado, 0) <> 1 
                      AND HST.HMEDATAPREVISTA = (SELECT MAX(H.HMEDATAPREVISTA) 
                                                FROM HISTMOVEMPTMO H 
                                                WHERE H.IDCONTRATOEMPTMO = HST.IDCONTRATOEMPTMO 
                                                AND SYSDATE < H.HMEDATAPREVISTA 
                                                AND H.IDITEMEMPTMO = 13) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        dataRetorno = leitor.GetDateTime(0);
                    }      
                }
                return dataRetorno;
            }
        }
        //William Moreira da Silva SOL 211704

        //William Moreira da Silva SOL 211418
        /// <summary>
        /// Retorna caso a parcela já tenha sido gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificaEnvio(long numeroContrato, int parcela)
        {
            string query;

            query = @" SELECT  FLGENVIO 
             FROM HMEALL 
             WHERE IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
             AND FLGQUITABONOESTORNO = 0 
             AND NATUREZAITEM > 0
             AND TIPOMOV = 1
             AND PARCELA = :PARCELA_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parcela);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        //comando.Connection.Close();
                        //comando.Dispose();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        //William Moreira da Silva SOL 211418

        //William Moreira da Silva SOL 211419
        /// <summary>
        /// Verifica se existe parcela posterior.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool existeParcelaPosterior(long numeroContrato, DateTime dataAmortizacao)
        {
            string query;

            query = @" SELECT IDHISTMOVEMPTMO 
             FROM HISTMOVEMPTMO  HME, 
             CM.CONTRATOEMPTMO CON 
             WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
             AND HME.HMETIPOMOV NOT IN (4, 5) 
             AND HME.HMEDATAPREVISTA > :PHMEDATAPREVISTA_P 
             AND (HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL) ";
            //William Moreira da Silva SOL 211419

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "PHMEDATAPREVISTA_P", DbType.DateTime, dataAmortizacao);

                // Popula objetos resultantes
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
        //William Moreira da Silva SOL 211419

        /// <summary>
        /// Retorna parcela atual do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public int obterParcelaAtual(long numeroContrato)
        {
            string query;

            int parcelaAtual = 0;

            //William Moreira da Silva SOL 211418
            // Consulta
            // SELECT MAX(HMEPARCELA) PARCELA_ATUAL ");
            // FROM HISTMOVEMPTMO H    ");
            // WHERE H.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            // AND H.HMETIPOMOV in (1, 2, 3) ");

            query = @" SELECT MAX(HMEPARCELA) 
             FROM HISTMOVEMPTMO 
             WHERE IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
             AND NVL(FLGESTORNADO, 0) = 0 
             AND (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) 
             AND HMETIPOMOV = 1";
            //William Moreira da Silva SOL 211418

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        parcelaAtual = leitor.GetValue(SALDO_DEVEDOR) == DBNull.Value ? 0 : Convert.ToInt32(leitor.GetValue(SALDO_DEVEDOR));
                    }
                }

                return parcelaAtual;
            }
        }

        /// <summary>
        /// Obtem parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        //Ajustado por Saulo / FUNCEF
        public int obterNumParcelasRestantes(long numeroContrato)
        {
            string query;

            int parcelasRestantes = 0;

            // Consulta
            query = @"SELECT hmenumparcelas
			FROM (SELECT h.hmenumparcelas
      FROM HISTMOVEMPTMO h
      WHERE h.hmetipomov IN (1,2,3)
      AND   h.hmecentraliza + h.hmedestacado = 1
      AND   NVL(h.flgestornado,0) = 0
      AND   h.idcontratoemptmo = :NUMEROCONTRATO_P
      ORDER BY h.hmedataprevista DESC)
WHERE ROWNUM = 1";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString()))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        parcelasRestantes = leitor.GetValue(0) == DBNull.Value ? 0 : Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                return parcelasRestantes;
            }
        }

        /// <summary>
        /// Busca dados anteriores do contrato utilizando PACKAGE
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataReferencia"></param>
        public ValoresContrato obterDadosAnteriorPosteriorContrato(long numeroContrato, DateTime dataReferencia)
        {
            ValoresContrato valoresContrato = new ValoresContrato();

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.pck_emp_funcao_saldo.pr_buscasaldo_ant_pos"))
            {
                bancoDeDados.AddInParameter(comando, "INIDCONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "INDATA", DbType.DateTime, dataReferencia);
                bancoDeDados.AddInParameter(comando, "INVERIFICAPARCELA", DbType.Int32, 1);

                bancoDeDados.AddOutParameter(comando, "OUTSALDODEVANT", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "OUTTXJUROSANT", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "OUTPARCELAANT", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "OUTPARCRESTAANT", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "OUTDATAATUANT", DbType.DateTime, 10);

                bancoDeDados.AddOutParameter(comando, "OUTSALDODEVPOS", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "OUTTXJUROSPOS", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "OUTPARCELAPOS", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "OUTPARCRESTAPOS", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "OUTDATAATUPOS", DbType.DateTime, 10);

                bancoDeDados.ExecuteNonQuery(comando);

                valoresContrato.saldoDevedorAnterior = (double)bancoDeDados.GetParameterValue(comando, "OUTSALDODEVANT");
                valoresContrato.taxaJurosAnterior = (double)bancoDeDados.GetParameterValue(comando, "OUTTXJUROSANT");
                valoresContrato.parcelaAnterior = (int)bancoDeDados.GetParameterValue(comando, "OUTPARCELAANT");
                valoresContrato.parcelaRestanteAnterior = (int)bancoDeDados.GetParameterValue(comando, "OUTPARCRESTAANT");
                valoresContrato.dataAtualizacaoAnterior = (DateTime)bancoDeDados.GetParameterValue(comando, "OUTDATAATUANT");

                valoresContrato.saldoDevedorPosterior = (double)bancoDeDados.GetParameterValue(comando, "OUTSALDODEVPOS");
                valoresContrato.taxaJurosPosterior = (double)bancoDeDados.GetParameterValue(comando, "OUTTXJUROSPOS");
                valoresContrato.parcelaPosterior = (int)bancoDeDados.GetParameterValue(comando, "OUTPARCELAPOS");
                valoresContrato.parcelaRestantePosterior = (int)bancoDeDados.GetParameterValue(comando, "OUTPARCRESTAPOS");
                valoresContrato.dataAtualizacaoPosterior = (DateTime)bancoDeDados.GetParameterValue(comando, "OUTDATAATUPOS");

                return valoresContrato;
            }

        }


        /// <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        public double obterPrestacaoAtual(long numeroContrato) //William Moreira da Silva - SOL 144458
        {
            string query;
            double prestacaoAtual = 0;            

            //Consulta
            //William Moreira da Silva - SOL 270100 - PPM 1321148 -- Consulta modificada, incluindo a condição AND 'FLGESTORNADO <> 1'

            query = $@" SELECT HMEVLRPREVISTO  
             FROM HISTMOVEMPTMO    
             WHERE IDCONTRATOEMPTMO = {numeroContrato} 
             AND HMETIPOMOV = 1 
             AND HMECENTRALIZA = 1
             AND FLGESTORNADO <> 1 
             AND HMEDATAPREVISTA = (SELECT MAX(HMEDATAPREVISTA) 
             FROM HISTMOVEMPTMO 
             where idcontratoemptmo = {numeroContrato}
             AND HMETIPOMOV = 1
             AND FLGESTORNADO <> 1
             AND HMECENTRALIZA = 1) ";

            Database bancoDeDados = this.obterBancoDeDados();            

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                //bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        prestacaoAtual = (double)leitor.obterDecimal(HMEVLRPREVISTO);                        
                    }
                }

                return prestacaoAtual;                
            }

        }//William Moreira da Silva - SOL 144458


        //SIG90605 -Inicio
        public double obterPrestacaoAtualComFGQC(long numeroContrato) 
        {
            string query;
            double prestacaoAtual = 0;
            int numParcela = 0;             
            
            query = $@"SELECT NVL(TO_CHAR(TO_NUMBER(HMEVLRPREVISTO)), 0) AS HMEVLRPREVISTO, NVL(HMEPARCELA,0) AS HMEPARCELA  
             FROM HISTMOVEMPTMO    
             WHERE IDCONTRATOEMPTMO = {numeroContrato} 
             AND HMETIPOMOV = 1 
             AND HMECENTRALIZA = 1
             AND FLGESTORNADO <> 1 
             AND HMEDATAPREVISTA = (SELECT MAX(HMEDATAPREVISTA) 
             FROM HISTMOVEMPTMO 
             where idcontratoemptmo = {numeroContrato}
             AND HMETIPOMOV = 1
             AND FLGESTORNADO <> 1
             AND HMECENTRALIZA = 1) ";

            Database bancoDeDados = this.obterBancoDeDados();

            IAcessoInadimplencia acesso = FabricaObjetos.instancia.obterAcessoInadimplencia();

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {                
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        prestacaoAtual = (double)leitor.obterDecimal(HMEVLRPREVISTO);
                        numParcela = leitor.obterInt(HMEPARCELA);
                    }
                }

                double vlrFGQC = acesso.calculaFGQC(numeroContrato, numParcela,false);                
                return prestacaoAtual + vlrFGQC;
            }
        }
        //SIG90605 - Fim

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public DateTime obterDataAtualizacao(long numeroContrato)
        {
            string query;

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

            query = @" SELECT
             MAX(HMEDATAPREVISTA) AS HMEDATAATUALIZA FROM    HISTMOVEMPTMO   HME, 
             CM.CONTRATOEMPTMO  CON,    CM.ITEMXTIPOCONTR  ITC,    CM.TIPOCONTREMPTMO TCE 
             WHERE CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
             AND ITC.ITCTRATASALDODEV    <> 0    AND NVL(HME.FLGESTORNADO, 0) = 0 
             AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO  AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO 
             AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO  AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ";


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                DateTime ultDataAtualizacao = DateTime.Today;

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        ultDataAtualizacao = leitor.GetDateTime(0);
                    }

                }

                return ultDataAtualizacao;
            }

        }

        //William Moreira da Silva - SOL 241797
        /// <summary>
        /// Obtem saldo devedor do contrato através da ultima data de atualização.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public double obterUltSaldoDevedor(long numeroContrato)
        {

            string query;
            query = @" SELECT NVL(PEP.FLGCALCDIA, 0) FLGCALCDIA FROM CM.PARAMEMPTMO PEP WHERE PEP.IDEMPRESAPROP = 1 ";

            // Cria comando de consulta
            Database bancoDeDadosParametro = this.obterBancoDeDados();
            DbCommand comandoParametro = bancoDeDadosParametro.obterComandoPorSql(query);

            // Popula objetos resultantes
            double pFlgCalcDia = 0;
            using (IDataReader leitorParametro = bancoDeDadosParametro.ExecuteReader(comandoParametro))
            {
                if (leitorParametro.Read())
                {
                    pFlgCalcDia = Convert.ToDouble(leitorParametro.GetValue(0));
                }
            }

            DateTime DataAtualizacao = obterDataAtualizacao(numeroContrato);
            query = "";
            if (pFlgCalcDia == 1)
            {
                // Consulta

                //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

                //William Moreira da Silva - SOL SOL 260665 PPM 1039568 - Segregação HISTMOVEMPTMO 2º pt - Inicio
                //query = $@" SELECT  HMESALDODEV  FROM (SELECT 
                //  HME.HMESALDODEV  FROM HISTMOVEMPTMO HME, CM.CONTRATOEMPTMO CON, CM.ITEMXTIPOCONTR ITC 
                //  WHERE HME.IDCONTRATOEMPTMO = {numeroContrato}  
                //  AND HME.HMETIPOMOV between 0 and 9 AND HME.HMEDATAPREVISTA = :DATAPREVISTA_P 
                //  AND ITC.ITCTRATASALDODEV <> 0 AND NVL(HME.FLGESTORNADO, 0) = 0 AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO  
                //  AND CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO AND HME.IDITEMEMPTMO = ITC.IDITEMEMPTMO 
                //  ORDER BY ITC.ITCORDEMEXTRATO DESC, HME.HMESEQCOBRANCA  DESC, HME.IDHISTMOVEMPTMO DESC) WHERE ROWNUM = 1  ";

                query = $@" select TO_CHAR(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR({numeroContrato}, :DATAPREVISTA_P)) from dual ";
                //William Moreira da Silva - SOL SOL 260665 PPM 1039568 - Segregação HISTMOVEMPTMO 2º pt - Fim
            }
            else
            {
                // Consulta

                //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

                query = $@"  
                            SELECT  TO_CHAR(HMESALDODEV) SALDO_DEVEDOR
                            FROM  HISTMOVEMPTMO HME,
                                  (  
                                    SELECT 
                  MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO 
                                    FROM  HISTMOVEMPTMO   HME,   CM.CONTRATOEMPTMO  CON,   CM.ITEMXTIPOCONTR  ITC,   CM.TIPOCONTREMPTMO TCE 
                                    WHERE CON.IDCONTRATOEMPTMO   = {numeroContrato}  
                                    AND ITC.ITCTRATASALDODEV  <> 0   AND ((HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL)) 
                                    AND HME.HMEDATAATUALIZA =  ( 
                  SELECT 
                  MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA 
                                                                FROM  HISTMOVEMPTMO   H, CM.CONTRATOEMPTMO  C, CM.ITEMXTIPOCONTR  I  
                                                                WHERE  ( C.IDCONTRATOEMPTMO   = {numeroContrato} ) 
                                                                AND H.HMEDATAATUALIZA   <= :DATAPREVISTA_P  
                                                                AND I.ITCTRATASALDODEV <> 0  AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNADO IS NULL) ) 
                  AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )  AND ( C.IDTIPOCONTREMPTMO  = I.IDTIPOCONTREMPTMO )  
                  AND ( H.IDITEMEMPTMO       = I.IDITEMEMPTMO )   )   ) 
                  AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )    AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) 
                  AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )    AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) 
                  ) MAX 
                            WHERE HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO";
            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query);

            // Parâmetros
            //bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAPREVISTA_P", DbType.DateTime, DataAtualizacao);

            double saldoDevedor = 0;
            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    saldoDevedor = (double)leitor.obterDecimal(0);
                }
            }

            //comando.Connection.Close();
            comando.Dispose();

            return saldoDevedor;
        }
        //William Moreira da Silva - SOL 241797

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public double obterSaldoDevedor(long numeroContrato, DateTime dataPrevista)
        {
            //DateTime DataAtualizacao = obterDataAtualizacao(numeroContrato);

            string query;
            query = @" SELECT TO_CHAR(PEP.FLGCALCDIA) FLGCALCDIA FROM CM.PARAMEMPTMO PEP WHERE PEP.IDEMPRESAPROP = 1 ";

            // Cria comando de consulta
            Database bancoDeDadosParametro = this.obterBancoDeDados();
            DbCommand comandoParametro = bancoDeDadosParametro.obterComandoPorSql(query);

            // Popula objetos resultantes
            double pFlgCalcDia = 0;
            using (IDataReader leitorParametro = bancoDeDadosParametro.ExecuteReader(comandoParametro))
            {
                if (leitorParametro.Read())
                {
                    pFlgCalcDia = Convert.ToDouble(leitorParametro.GetValue(0));
                }
            }

            query = "";
            if (pFlgCalcDia == 1)
            {

                //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

                //William Moreira da Silva - SOL 260665 PPM 1039568 - Segregação HISTMOVEMPTMO 2º pt - Inicio
                // Consulta
                //query = $@" SELECT   HMESALDODEV  FROM (SELECT 
                //  HME.HMESALDODEV  FROM HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, ITEMXTIPOCONTR ITC 
                //  WHERE HME.IDCONTRATOEMPTMO = {numeroContrato}  
                //  AND HME.HMETIPOMOV between 0 and 9 AND HME.HMEDATAPREVISTA = :DATAPREVISTA_P 
                //  AND ITC.ITCTRATASALDODEV <> 0 AND NVL(HME.FLGESTORNADO, 0) = 0 AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO  
                //  AND CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO AND HME.IDITEMEMPTMO = ITC.IDITEMEMPTMO 
                //  ORDER BY ITC.ITCORDEMEXTRATO DESC, HME.HMESEQCOBRANCA  DESC, HME.IDHISTMOVEMPTMO DESC) WHERE ROWNUM = 1  ";

                query = $@" select TO_CHAR(NVL(PCK_EMPRESTIMO.FN_SALDODEVEDOR({numeroContrato}, :DATAPREVISTA_P),0)) from dual ";
                //William Moreira da Silva - SOL 260665 PPM 1039568 - Segregação HISTMOVEMPTMO 2º pt - Fim
            }
            else
            {
                //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

                // Consulta
                query = $@"  SELECT NVL(HMESALDODEV, 0) FROM  HISTMOVEMPTMO HME,
                  (  SELECT 
                  MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO 
                  FROM  HISTMOVEMPTMO   HME,   CONTRATOEMPTMO  CON,   ITEMXTIPOCONTR  ITC,   TIPOCONTREMPTMO TCE 
                  WHERE  ( CON.IDCONTRATOEMPTMO   = {numeroContrato} ) 
                  AND ( ITC.ITCTRATASALDODEV  <> 0 )  AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) 
                  AND ( HME.HMEDATAATUALIZA    =   ( 
                  SELECT 
                  MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA 
                  FROM  HISTMOVEMPTMO   H, CONTRATOEMPTMO  C, ITEMXTIPOCONTR  I  
                  WHERE  ( C.IDCONTRATOEMPTMO   = {numeroContrato} ) 
                  AND ( H.HMEDATAATUALIZA   <= :DATAPREVISTA_P ) 
                  AND ( I.ITCTRATASALDODEV  <> 0 ) AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNADO IS NULL) ) 
                  AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )  AND ( C.IDTIPOCONTREMPTMO  = I.IDTIPOCONTREMPTMO )  
                  AND ( H.IDITEMEMPTMO       = I.IDITEMEMPTMO )   )   ) 
                  AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )    AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) 
                  AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )    AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) 
                  ) MAX 
                  WHERE  ( HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO )  ";

            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query);

            // Parâmetros
            //bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            //Marcio Sanches Spinosa SOL 201769 Kintana 1950540 - Inicio
            //bancoDeDados.AddInParameter(comando, "DATAPREVISTA_P", DbType.DateTime, DataAtualizacao);
            bancoDeDados.AddInParameter(comando, "DATAPREVISTA_P", DbType.DateTime, dataPrevista);
            //Marcio Sanches Spinosa SOL 201769 Kintana 1950540 - Fim

            double saldoDevedor = 0;

            // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - alterado
            IDataReader leitor = bancoDeDados.ExecuteReader(comando);

            // Popula objetos resultantes
            using (leitor)
            {
                if (leitor.Read())
                {
                    saldoDevedor = leitor.GetValue(0) != DBNull.Value ? Convert.ToDouble(leitor.GetValue(0)) : 0;
                }
            }
            // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - alterado - fim

            //comando.Connection.Close();
            comando.Dispose();

            return saldoDevedor;
        }

        /// <summary>
        /// Obtem lista de itens
        /// </summary>
        /// <returns></returns>
        public List<ItemContrato> listarItens()
        {

            string query;

            // Consulta
            query = @" SELECT IDITEMEMPTMO, ITEDESCRICAO FROM CM.ITEMEMPTMO ORDER BY ITEDESCRICAO ASC ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                List<ItemContrato> itens = new List<ItemContrato>();

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        itens.Add(new ItemContrato() { id = Convert.ToInt32(leitor.GetValue(0)), descricao = leitor.obterString(1) });
                    }
                }

                return itens;
            }

        }

        /// <summary>
        /// Consulta historico de suspensão de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="idHistoricoSuspensao">Identificador do histórico de suspensão.</param>
        public List<HistoricoSuspensao> consultarHistoricoSuspensao(long numeroContrato, long idHistoricoSuspensao)
        {
            bool buscaContrato = numeroContrato > 0;
            bool buscaHistorico = idHistoricoSuspensao > 0;

            string query;

            // Consulta
            query = @" SELECT 
             HSC.IDHISTSUSPCOBEP, 
             HSC.IDTIPOSUSPEMPTMO, 
             TSE.TSEDESCRICAO, 
             HSC.FLGSTATUS, 
             DECODE(HSC.FLGSTATUS, 
                    'A','Ativa', 
                    'C','Cancelada', 
                    'E','Encerrada') AS STATUS, 
             HSC.HSCMESES, 
             HSC.HSCINICIOSUSP, 
             HSC.HSCFINALSUSP, 
             HSC.FLGFERIAS, 
             HSC.HSCDATALIBER, 
             HSC.HSCMESCOBRANCA, 
             HSC.HSCANOCOBRANCA, 
             HSC.HSCUSUATEND, 
             HSC.HSCDATAATEND, 
             HSC.HSCDATAATU, 
             HSC.HSCUSULIBER, 
             ELE.MATRICULA, 
             PES.NOME, 
             CON.IDCONTRATOEMPTMO, ";

            query = query + @" HSC.OBSERVACAO ";//William Moreira da Silva SOL 149705
            query = query + @", HSC.FLGPRAZOINDETERMINADO
            FROM CM.HISTSUSPCOBEP  HSC,  
                CM.TIPOSUSPEMPTMO TSE, 
                CM.CONTRATOEMPTMO CON, 
                CM.ELEGPATRO      ELE, 
                CM.PESSOA         PES 
             WHERE TSE.IDTIPOSUSPEMPTMO = HSC.IDTIPOSUSPEMPTMO 
              AND CON.IDCONTRATOEMPTMO = HSC.IDCONTRATOEMPTMO 
              AND CON.IDPESSOA = PES.IDPESSOA 
              AND ELE.IDPESSOA = CON.IDPESSOA ";

            if (buscaContrato)
                query = query + @" AND HSC.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ";

            if (buscaHistorico)
                query = query + @"  AND HSC.IDHISTSUSPCOBEP = :IDHISTORICOSUSPENSAO_P ";

            query = query + @" ORDER BY HSC.HSCDATAATEND DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                if (buscaContrato)
                    bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                if (buscaHistorico)
                    bancoDeDados.AddInParameter(comando, "IDHISTORICOSUSPENSAO_P", DbType.Int64, idHistoricoSuspensao);

                // Popula objetos resultantes
                List<HistoricoSuspensao> itens = new List<HistoricoSuspensao>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        HistoricoSuspensao item = new HistoricoSuspensao();
                        item.id = Convert.ToInt64(leitor.GetValue(IDHISTSUSPCOBEP_HISTSUSP));
                        item.tipoSuspensao = new TipoSuspensao();
                        item.tipoSuspensao.id = Convert.ToInt32(leitor.GetValue(IDTIPOSUSPEMPTMO_HISTSUSP));
                        item.descricaoTipoSuspAux = leitor.obterString(TSEDESCRICAO_HISTSUSP);//William Moreira da Silva SOL 235167
                        item.tipoSuspensao.descricao = leitor.obterString(TSEDESCRICAO_HISTSUSP);
                        item.status = leitor.obterString(STATUS_HISTSUSP);
                        item.numeroMeses = Convert.ToInt32(leitor.GetValue(HSCMESES_HISTSUSP));
                        item.dataInicio = leitor.obterValorData(HSCINICIOSUSP_HISTSUSP).Value;
                        item.dataFim = leitor.obterValorData(HSCFINALSUSP_HISTSUSP);
                        item.ferias = Convert.ToInt32(leitor.GetValue(FLGFERIAS_HISTSUSP));
                        item.dataLiberacao = leitor.obterValorData(HSCDATALIBER_HISTSUSP);
                        item.mesCobranca = leitor.obterValorInteiro(HSCMESCOBRANCA_HISTSUSP);
                        item.anoCobranca = leitor.obterValorInteiro(HSCANOCOBRANCA_HISTSUSP);
                        item.responsavelAtendimento = leitor.obterString(HSCUSUATEND_HISTSUSP);
                        item.dataAtendimento = leitor.obterValorData(HSCDATAATEND_HISTSUSP);
                        item.dataAtualizacao = leitor.obterValorData(HSCDATAATU_HISTSUSP);
                        item.responsavelAtualizacao = leitor.obterString(HSCUSULIBER_HISTSUSP);
                        item.contrato = new Contrato();
                        item.contrato.mutuario = new Mutuario();
                        item.contrato.mutuario.matricula = leitor.obterString(MATRICULA_HISTSUSP);
                        item.contrato.mutuario.nome = leitor.obterString(NOME_HISTSUSP);
                        item.contrato.numero = Convert.ToInt64(leitor.GetValue(IDCONTRATOEMPTMO_HISTSUSP));
                        item.observacao = leitor.obterString(OBSERVACAO_HISTSUSP);//William Moreira da Silva SOL 149705
                        item.observacao = leitor.obterString(OBSERVACAO_HISTSUSP);
                        item.prazoIndeterminado = leitor.obterString(20);

                        itens.Add(item);
                    }
                }

                // Retorna informações
                return itens;
            }
        }

        /// <summary>
        /// Obtem suspensão dos contratos anteriores em aberto
        /// </summary>
        /// <param name="dataCredito">Data crédito da concessão</param>
        /// <param name="listaContratos">Lista contratos (separados por ",")</param>
        public List<HistoricoSuspensao> consultarSuspensaoAnteriores(DateTime dataCredito, string listaContratos)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT NVL(TS.FLGSUSAPENASCONC,0) AS FLGSUSAPENASCONC");
            query.Append(" FROM CM.HISTSUSPCOBEP HS, CM.TIPOSUSPEMPTMO TS");
            query.Append(" WHERE HS.IDTIPOSUSPEMPTMO =  TS.IDTIPOSUSPEMPTMO ");
            query.AppendFormat(" AND HS.IDCONTRATOEMPTMO IN ({0})", listaContratos);
            query.Append(" AND HSCFINALSUSP >= :DATACREDITO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString()))
            {

                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, dataCredito);

                // Popula objetos resultantes
                List<HistoricoSuspensao> itens = new List<HistoricoSuspensao>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        HistoricoSuspensao item = new HistoricoSuspensao();
                        item.tipoSuspensao = new TipoSuspensao() { apenasConcessao = Convert.ToInt32(leitor.GetValue(0)) > 0 };
                        itens.Add(item);
                    }
                }

                return itens;
            }

        }



        /// <summary>
        /// Consulta Log de um contrato.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLog(LogContrato logContrato)
        {
            string query;

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query = @" SELECT LTP.IDLOGTOTALPREV,
                      LTP.IDMODULO,
                      LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,
                      LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,
                      LTP.ORIGEM,
                      LTP.DESCOPERACAO,
                      LTP.DATA,
                      LTP.IDUSUARIO,
                      USU.NOMEUSUARIO,
                      PSU.NOME,
                      LTP.VERSAO
                 FROM CM.PESSOA         PSU,
                      CM.LOGTOTALPREV   LTP,
                      CM.USUARIOSISTEMA USU
                WHERE LTP.IDMODULO   = :MODULO_P ";

            if (!idHistorico)
                query = query + @" AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P ";
            else
                query = query + @" AND LTP.IDPESQUISA2  = :IDHISTORICO_P ";

            query = query + @" AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)
                  AND USU.IDUSUARIO    = PSU.IDPESSOA(+)
             ORDER BY LTP.DATA DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros

                bancoDeDados.AddInParameter(comando, "MODULO_P", DbType.Int32, logContrato.modulo);

                if (!idHistorico)
                    bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Double, logContrato.numeroContrato);
                else
                    bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, logContrato.idHistorico);



                // Popula objetos resultantes
                List<LogContrato> logs = new List<LogContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        LogContrato log = new LogContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDLOGTOTALPREV_LOG)),
                            numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                            idHistorico = leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                            descricao = leitor.obterString(DESCOPERACAO_LOG),
                            data = leitor.obterValorData(DATA_LOG).Value,
                            versao = leitor.obterString(VERSAO_LOG),

                            origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.obterInt(ORIGEM_LOG)),

                            usuario = new Usuario()
                            {
                                id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                                login = leitor.obterString(NOMEUSUARIO_LOG),
                                nome = leitor.obterString(NOME_LOG)
                            }
                        };
                        logs.Add(log);
                    }
                }

                // Retorna informações
                return logs;
            }
        }

        //William Moreira da Silva - SOL 219785 KTN 2052123 - INI
        /// <summary>
        /// Retorna a quantidade de linhas que exitems de logs
        /// </summary>
        /// <param name="logContrato"></param>
        /// <returns>A quantidade de logs existenteas na tabelas</returns>
        public int consultarQuantLog(LogContrato logContrato)
        {
            int i = 0;
            string query;

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query = @" SELECT LTP.IDLOGTOTALPREV,
                      LTP.IDMODULO,
                      LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,
                      LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,
                      LTP.ORIGEM,
                      LTP.DESCOPERACAO,
                      LTP.DATA,
                      LTP.IDUSUARIO,
                      USU.NOMEUSUARIO,
                      PSU.NOME,
                      LTP.VERSAO
                 FROM CM.PESSOA         PSU,
                      CM.LOGTOTALPREV   LTP,
                      CM.USUARIOSISTEMA USU
                WHERE LTP.IDMODULO   = :MODULO_P ";

            if (!idHistorico)
                query = query + @" AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P ";
            else
                query = query + @" AND LTP.IDPESQUISA2  = :IDHISTORICO_P ";

            query = query + @" AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)
                  AND USU.IDUSUARIO    = PSU.IDPESSOA(+)
             ORDER BY LTP.DATA DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros

                bancoDeDados.AddInParameter(comando, "MODULO_P", DbType.Int32, logContrato.modulo);

                if (!idHistorico)
                    bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Double, logContrato.numeroContrato);
                else
                    bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, logContrato.idHistorico);

                // Popula objetos resultantes
                List<LogContrato> logs = new List<LogContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        LogContrato log = new LogContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDLOGTOTALPREV_LOG)),
                            numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                            idHistorico = leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                            descricao = leitor.obterString(DESCOPERACAO_LOG),
                            data = leitor.obterValorData(DATA_LOG) == null ? DateTime.MinValue : leitor.obterValorData(DATA_LOG).Value,
                            versao = leitor.obterString(VERSAO_LOG),

                            origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.obterInt(ORIGEM_LOG)),

                            usuario = new Usuario()
                            {
                                id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                                login = leitor.obterString(NOMEUSUARIO_LOG),
                                nome = leitor.obterString(NOME_LOG)
                            }
                        };
                        logs.Add(log);
                        i++;
                    }
                }

                // Retorna informações
                return i;
            }
        }

        /// <summary>
        /// Método retorna o log do contrato em partes
        /// </summary>
        /// <param name="logContrato"></param>
        /// <param name="linhaInicial"></param>
        /// <returns>Retorna 3500 registros do log do contrato a partir da linha passada como parâmetro</returns>
        public List<LogContrato> consultarLogParticionado(LogContrato logContrato, int linhaInicial)
        {
            int i = 0;
            string query;

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query = @"   SELECT LTP.IDLOGTOTALPREV,
                      LTP.IDMODULO,
                      LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,
                      LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,
                      LTP.ORIGEM,
                      LTP.DESCOPERACAO,
                      LTP.DATA,
                      LTP.IDUSUARIO,
                      USU.NOMEUSUARIO,
                      PSU.NOME,
                      LTP.VERSAO
                 FROM CM.PESSOA         PSU,
                      CM.LOGTOTALPREV   LTP,
                      CM.USUARIOSISTEMA USU
                WHERE LTP.IDMODULO   = :MODULO_P ";

            if (!idHistorico)
                query = query + @" AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P ";
            else
                query = query + @" AND LTP.IDPESQUISA2  = :IDHISTORICO_P ";

            query = query + @" AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)
                  AND USU.IDUSUARIO    = PSU.IDPESSOA(+)
             ORDER BY LTP.DATA DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros

                bancoDeDados.AddInParameter(comando, "MODULO_P", DbType.Int32, logContrato.modulo);

                if (!idHistorico)
                    bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Double, logContrato.numeroContrato);
                else
                    bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, logContrato.idHistorico);

                // Popula objetos resultantes
                List<LogContrato> logs = new List<LogContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        if (i >= linhaInicial && i < (linhaInicial + 3500))
                        {
                            LogContrato log = new LogContrato()
                            {
                                id = Convert.ToInt32(leitor.GetValue(IDLOGTOTALPREV_LOG)),
                                numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                                idHistorico = leitor.GetValue(IDHISTMOVEMPTMO_LOG) == null ? null : leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                                descricao = leitor.obterString(DESCOPERACAO_LOG),
                                data = leitor.obterValorData(DATA_LOG) == null ? DateTime.MinValue : leitor.obterValorData(DATA_LOG).Value,
                                versao = leitor.obterString(VERSAO_LOG),

                                origem = (leitor.IsDBNull(ORIGEM_LOG) ? null : TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(Convert.ToInt32(leitor.GetValue(ORIGEM_LOG)))),

                                usuario = new Usuario()
                                {
                                    id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                                    login = leitor.obterString(NOMEUSUARIO_LOG),
                                    nome = leitor.obterString(NOME_LOG)
                                }
                            };
                            logs.Add(log);
                        }
                        i++;
                    }
                }

                // Retorna informações
                return logs;
            }
        }
        //William Moreira da Silva - SOL 219785 KTN 2052123 - FIM

        //William Moreira da Silva
        /// <summary>
        /// Consulta Log de um contrato pela origem.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLogOrigem(LogContrato logContrato, int origem)
        {
            string query;

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query = @"   SELECT LTP.IDLOGTOTALPREV,
                      LTP.IDMODULO,
                      LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,
                      LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,
                      LTP.ORIGEM,
                      LTP.DESCOPERACAO,
                      LTP.DATA,
                      LTP.IDUSUARIO,
                      USU.NOMEUSUARIO,
                      PSU.NOME,
                      LTP.VERSAO
                 FROM CM.PESSOA         PSU,
                      CM.LOGTOTALPREV   LTP,
                      CM.USUARIOSISTEMA USU
                WHERE LTP.IDMODULO   =  :MODULO_P ";
            //    AND   LTP.ORIGEM       = :ORIGEM_P");

            //if (!idHistorico)
            //      AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P");
            //else
            //      AND LTP.IDPESQUISA2  = :IDHISTORICO_P");

            if (!idHistorico)
                query = query + @" AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P ";
            else
                query = query + @" AND LTP.IDPESQUISA2  = :IDHISTORICO_P ";
            //William Moreira da Silva SOL 235167

            query = query + @" AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)
                  AND USU.IDUSUARIO    = PSU.IDPESSOA(+)
             ORDER BY LTP.DATA DESC ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros

                bancoDeDados.AddInParameter(comando, "MODULO_P", DbType.Int32, logContrato.modulo);
                //bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, origem);//William Moreira da Silva SOL 235167

                if (!idHistorico)
                    bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Double, logContrato.numeroContrato);
                else
                    bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, logContrato.idHistorico);

                // Popula objetos resultantes
                List<LogContrato> logs = new List<LogContrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        LogContrato log = new LogContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDLOGTOTALPREV_LOG)),
                            numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                            idHistorico = leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                            descricao = leitor.obterString(DESCOPERACAO_LOG),
                            data = leitor.obterValorData(DATA_LOG).Value,
                            versao = leitor.obterString(VERSAO_LOG),

                            origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(Convert.ToInt32(leitor.GetValue(ORIGEM_LOG))),

                            usuario = new Usuario()
                            {
                                id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                                login = leitor.obterString(NOMEUSUARIO_LOG),
                                nome = leitor.obterString(NOME_LOG)
                            }
                        };
                        logs.Add(log);
                    }
                }

                // Retorna informações
                return logs;
            }
        }
        //William Moreira da Silva

        public long? consultarAutoEmprestimo(long codigoAutoEmprestimo)
        {
            string query;

            query = @" SELECT IDCONTRATOEMPTMO 
             FROM CM.CONTRATOEMPTMO 
             WHERE CODAUTOEMP = :CODAUTOEMP_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "CODAUTOEMP_P", DbType.Int64, codigoAutoEmprestimo);

                long? numeroContrato = null;

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        numeroContrato = Convert.ToInt64(leitor.GetValue(0));
                    }
                }

                return numeroContrato;
            }

        }

        public bool validarContratoPadrao(int idContratoPadrao)
        {
            string query;

            query = @" SELECT IDCONTRATOPADRAO FROM CM.CONTRATOPADRAO WHERE IDCONTRATOPADRAO = :IDCONTRATOPADRAO_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //Parâmetros
                bancoDeDados.AddInParameter(comando, "IDCONTRATOPADRAO_P", DbType.Int32, idContratoPadrao);

                bool existe = false;

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existe = true;
                    }
                }

                return existe;
            }
        }

        //Wylliam Leite da Silva - SOL: 255960 PPM: 843375 - Inicio
        public string verificaSituacaoContrato(long prNumContrato)
        {
            string query;
            string sFLGSITUACAO = String.Empty;

            query = @"SELECT FLGSITUACAO" +
                    " FROM CM.CONTRATOEMPTMO" +
                    " WHERE IDCONTRATOEMPTMO = :prIDCONTRATOEMPTMO" +
                    " AND ROWNUM = 1";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "prIDCONTRATOEMPTMO", DbType.Int64, prNumContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        sFLGSITUACAO = leitor.obterString(0);
                    }
                }

                return sFLGSITUACAO;
            }
        }
        //Wylliam Leite da Silva - SOL: 255960 PPM: 843375 - Fim                

        #region SIG 28915 - Eliamar Tani - Criação de método para listar assinaturas
        public List<Assinatura> consultarAssinaturas(Mutuario mutuario, ref ParametrosConsulta parametros, ref string infoMutuario, ref string mensagemExcecao)
        {
            mensagemExcecao = "";

            // Declaração de variáveis
            bool buscarMatricula = mutuario != null && !String.IsNullOrEmpty(mutuario.matricula);
            bool buscarCPF = mutuario != null && !String.IsNullOrEmpty(mutuario.cpf);
            int total_registros = 0;

            List<Assinatura> assinaturas = new List<Assinatura>();
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder sbWhere = new StringBuilder();

            parametros = parametros ?? new ParametrosConsulta();

            // Consulta
            string query = @"SELECT ACP.IDCONTRATOPADRAO,
       ACP.IDBENEF,
       ACP.IDPESSOA,
       ACP.ACPDATAASSINAT,
       ACP.NUMPROTOCOLO,
       CTP.CTPDESCRICAO,
       DEP.MATRICULA,
       PES.NOME AS MUTUARIO,
       ({0}) TOTAL_LINHAS
  FROM CM.ASSINCONTRPADRAO ACP
   ,
   PESSOA PES,
   CONTRATOPADRAO CTP,
   DEPENTIT DEP
WHERE 
   ( ACP.IDPESSOA         = DEP.IDTITULAR ) AND
   ( ACP.IDBENEF          = DEP.IDPESSOA ) AND
   ( ACP.IDCONTRATOPADRAO = CTP.IDCONTRATOPADRAO ) AND
   ( DEP.IDPESSOA         = PES.IDPESSOA )";

            // Filtros

            ////todo: Somente caso seja necessário filtrar por assinatura de contrato sem bloqueio
            //sbWhere.Append(" NVL(ACP.FLGBLOQUEIO,0) = 1 ");

            if (buscarMatricula)
                sbWhere.Append(" AND DEP.MATRICULA = '" + mutuario.matricula + "' ");

            if (buscarCPF)
                sbWhere.Append(" AND PES.NUMDOCUMENTO LIKE '" + mutuario.cpf + "' || '%' ");

            // Paginação
            var countSql = string.Concat(query, sbWhere);

            countSql = string.Concat("SELECT COUNT(1) ", countSql.Substring(countSql.IndexOf("FROM CM.ASSINCONTRPADRAO ACP")));

            query = string.Format(query, countSql);

            // Ordenação
            query = string.Concat(query, sbWhere, " ORDER BY CTP.CTPDESCRICAO ASC ");

            if (parametros.paginacao != null)
                query = UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas);

            // Cria comando de consulta (1)
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                //if (buscarMatricula)
                //    bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, mutuario.matricula);

                //if (buscarCPF)
                //    bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, mutuario.cpf);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        assinaturas.Add(new Assinatura()
                        {
                            idContratoPadrao = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDCONTRATOPADRAO"))),
                            dataAssinatura = Convert.ToDateTime(leitor.GetValue(leitor.GetOrdinal("ACPDATAASSINAT"))),
                            numProtocolo = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("NUMPROTOCOLO"))),
                            observacao = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("CTPDESCRICAO"))),
                            mutuario = new Mutuario
                            {
                                id = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDBENEF"))),
                                matricula = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("MATRICULA"))),
                                nome = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("MUTUARIO"))),
                                idTitular = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDPESSOA")))
                            }
                        });

                        if (total_registros == 0)
                        {
                            total_registros = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("TOTAL_LINHAS")));
                        }
                    }
                }

                if (assinaturas.Count == 0)
                {
                    // Cria comando de consulta (2)
                    string queryCount = string.Concat(@"SELECT DEP.IDPESSOA, 
       DEP.IDTITULAR,
       DEP.MATRICULA
FROM CM.DEPENTIT DEP
     JOIN CM.PESSOA PES ON DEP.IDPESSOA = PES.IDPESSOA
     JOIN CM.ELEGPATRO ELP ON DEP.IDTITULAR = ELP.IDPESSOA
     JOIN CM.PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR AND ELP.IDPESSOA = PPP.IDPESSOA
WHERE (PPP.IDSITPLANOPREV = 25 
       OR
       PPP.IDPLANOPREV = (SELECT MAX(PPP2.IDPLANOPREV)
                          FROM CM.PARTPREVPLAN PPP2
                                                                  WHERE PPP2.FLGDESATIVADO = 0
                                                                    AND PPP2.Idsitplanoprev <> 25
                                                                    AND PPP2.IDPESSOA = PPP.IDPESSOA
                                                                    AND NOT EXISTS (SELECT 1
                                          FROM CM.PARTPREVPLAN PPP3
                                                                          WHERE PPP3.IDPESSOA = PPP2.IDPESSOA
                                                                            AND PPP3.IDSITPLANOPREV = 25)))", sbWhere);

                    using (DbCommand cmdCount = bancoDeDados.GetSqlStringCommand(queryCount))
                    {
                        // Parâmetros
                        if (buscarMatricula)
                            bancoDeDados.AddInParameter(cmdCount, "MATRICULA_P", DbType.String, mutuario.matricula);

                        if (buscarCPF)
                            bancoDeDados.AddInParameter(cmdCount, "CPF_P", DbType.String, mutuario.cpf);

                        using (var reader = bancoDeDados.ExecuteReader(cmdCount))
                        {
                            if (reader.Read())
                            {
                                var idbeneficiario = Convert.ToString(reader.GetValue(0));
                                var idPessoa = Convert.ToString(reader.GetValue(1));
                                var matricula = Convert.ToString(reader.GetValue(2));

                                infoMutuario = string.Format("idBeneficiario={0};idPessoa={1};matricula={2}", idbeneficiario, idPessoa, matricula);

                                mensagemExcecao = "O participante não possui nenhuma assinatura cadastrada.";
                            }
                            else
                            {
                                mensagemExcecao = "O participante não foi encontrado.";
                            }

                            return new List<Assinatura>();
                        }
                    }
                }
                else
                {
                    infoMutuario = string.Format("idBeneficiario={0};idPessoa={1};matricula={2}", assinaturas[0].mutuario.id, assinaturas[0].mutuario.idTitular, assinaturas[0].mutuario.matricula);
                }

                // Total de Regristros
                parametros.totalRegistros = total_registros;

                // Retorna informações
                parametros.prepararRetorno();
            }

            return assinaturas;
        }

        public List<ContratoPadrao> consultarContratos()
        {
            List<ContratoPadrao> itens = new List<ContratoPadrao>();
            Database bancoDeDados = this.obterBancoDeDados();

            // Consulta
            string query = @"SELECT
                    IDCONTRATOPADRAO,
                    IDTIPOCONTREMPTMO,
                    UPPER(CTPDESCRICAO) CTPDESCRICAO,
                    CTPOBRIGATORIO,
                    CTPDATAINICIO,
                    TRGDTINCLUSAO
                FROM CM.CONTRATOPADRAO
                ORDER BY CTPDESCRICAO";

            // Cria comando de consulta
            // Popula objetos resultantes
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    var contrato = new ContratoPadrao();

                    contrato.IdContratoPadrao = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDCONTRATOPADRAO")));
                    contrato.Descricao = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("CTPDESCRICAO")));
                    contrato.DataInicio = Convert.ToDateTime(leitor.GetValue(leitor.GetOrdinal("CTPDATAINICIO")));
                    contrato.DataInclusao = Convert.ToDateTime(leitor.GetValue(leitor.GetOrdinal("TRGDTINCLUSAO")));

                    if (leitor.GetValue(leitor.GetOrdinal("IDTIPOCONTREMPTMO")) != DBNull.Value)
                        contrato.IdTipoContrEmptmo = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDTIPOCONTREMPTMO")));

                    if (leitor.GetValue(leitor.GetOrdinal("CTPOBRIGATORIO")) != DBNull.Value)
                        contrato.Obrigatorio = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("CTPOBRIGATORIO"))) == "1";

                    itens.Add(contrato);
                }

                return itens;
            }
        }

        public Assinatura obterAssinaturaContrato(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura)
        {
            var model = new Assinatura();
            string query = @"SELECT IDPESSOA,
                                    IDCONTRATOPADRAO,
                                    ACPDATAASSINAT,
                                    FLGBLOQUEIO,
                                    OBS,
                                    IDBENEF,
                                    NUMCOMPROVA,
                                    NUMPROTOCOLO,
                                    TRGDTINCLUSAO
                                    FROM CM.ASSINCONTRPADRAO
                                    WHERE
                                    IDPESSOA = :IDPESSOA_P
                                    AND IDCONTRATOPADRAO = :IDCONTRATOPADRAO_P
                                    AND ACPDATAASSINAT = :ACPDATAASSINAT_P
                                    AND IDBENEF = :IDBENEF_P";
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOPADRAO_P", DbType.Int32, idContratoPadrao);
                bancoDeDados.AddInParameter(comando, "ACPDATAASSINAT_P", DbType.DateTime, dataAssinatura);
                bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int32, idBenef);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        model.idContratoPadrao = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDCONTRATOPADRAO")));
                        model.dataAssinatura = Convert.ToDateTime(leitor.GetValue(leitor.GetOrdinal("ACPDATAASSINAT")));
                        model.dataInicio = Convert.ToDateTime(leitor.GetValue(leitor.GetOrdinal("TRGDTINCLUSAO")));
                        model.numProtocolo = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("NUMPROTOCOLO")));
                        model.observacao = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("OBS")));
                        model.mutuario = new Mutuario
                        {
                            id = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDBENEF"))),
                            idTitular = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("IDPESSOA")))
                        };
                        model.numeroComprovante = Convert.ToString(leitor.GetValue(leitor.GetOrdinal("NUMCOMPROVA")));

                        if (leitor.GetValue(leitor.GetOrdinal("FLGBLOQUEIO")) != DBNull.Value)
                            model.flagBloqueio = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("FLGBLOQUEIO")));
                    }

                    return model;
                }
            }
        }

        public bool excluirAssinaturaContratoPadrao(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura)
        {
            string query = @"DELETE CM.ASSINCONTRPADRAO
                             WHERE
                                IDPESSOA = :IDPESSOA_P
                                AND IDCONTRATOPADRAO = :IDCONTRATOPADRAO_P
                                AND ACPDATAASSINAT = :ACPDATAASSINAT_P
                                AND IDBENEF = :IDBENEF_P";
            Database bancoDeDados = this.obterBancoDeDados();

            try
            {
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);
                    bancoDeDados.AddInParameter(comando, "IDCONTRATOPADRAO_P", DbType.Int32, idContratoPadrao);
                    bancoDeDados.AddInParameter(comando, "ACPDATAASSINAT_P", DbType.DateTime, dataAssinatura);
                    bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int32, idBenef);

                    return Convert.ToInt32(bancoDeDados.ExecuteScalar(comando)) > 0;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void salvarAssinaturaContrato(Assinatura item)
        {
            string query = @"MERGE INTO CM.ASSINCONTRPADRAO ACP
                          USING (SELECT :IDPESSOA_P IDPESSOA, 
                                        :IDCONTRATOPADRAO_P IDCONTRATOPADRAO,
                                        :ACPDATAASSINAT_P ACPDATAASSINAT,
                                        :IDBENEF_P IDBENEF,
                                        :FLGBLOQUEIO_P FLGBLOQUEIO,
                                        :OBS_P OBS,
                                        :NUMPROTOCOLO_P NUMPROTOCOLO,
                                        :TRGDTINCLUSAO_P TRGDTINCLUSAO FROM DUAL) TMP
                            ON (ACP.IDPESSOA = TMP.IDPESSOA
                                AND ACP.IDCONTRATOPADRAO = TMP.IDCONTRATOPADRAO
                                AND ACP.TRGDTINCLUSAO = TMP.TRGDTINCLUSAO
                                AND ACP.IDBENEF = TMP.IDBENEF)
                          WHEN MATCHED THEN
                            UPDATE SET
                              ACP.OBS = TMP.OBS,
                              ACP.NUMPROTOCOLO = TMP.NUMPROTOCOLO,
                              ACP.ACPDATAASSINAT = TMP.ACPDATAASSINAT
                          WHEN NOT MATCHED THEN
                            INSERT (ACP.IDPESSOA, ACP.IDCONTRATOPADRAO, ACP.ACPDATAASSINAT, ACP.FLGBLOQUEIO, ACP.OBS, ACP.IDBENEF, ACP.NUMPROTOCOLO)
                            VALUES(TMP.IDPESSOA, TMP.IDCONTRATOPADRAO, TMP.ACPDATAASSINAT, TMP.FLGBLOQUEIO, TMP.OBS, TMP.IDBENEF, TMP.NUMPROTOCOLO)";
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, item.mutuario.idTitular);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOPADRAO_P", DbType.Int32, item.idContratoPadrao);
                bancoDeDados.AddInParameter(comando, "ACPDATAASSINAT_P", DbType.DateTime, item.dataAssinatura);
                bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int32, item.mutuario.id);
                bancoDeDados.AddInParameter(comando, "FLGBLOQUEIO_P", DbType.Int32, item.flagBloqueio);
                bancoDeDados.AddInParameter(comando, "OBS_P", DbType.String, item.observacao);
                bancoDeDados.AddInParameter(comando, "NUMPROTOCOLO_P", DbType.String, item.numProtocolo);
                bancoDeDados.AddInParameter(comando, "TRGDTINCLUSAO_P", DbType.DateTime, item.dataInicio);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }
        #endregion

        //William Santana - SIG 50871 - começo
        public List<ModeloContratoEmp> consultarModelosContratos(string tipocontrato, DateTime? DataInicioVigencia, ref ParametrosConsulta parametros)
        {

            List<ModeloContratoEmp> modelo = new List<ModeloContratoEmp>();

            // Consulta
            string query = @"SELECT T.ID_TB_EMP_CONTRATOS,
                                    T.IDTIPOCONTREMPTMO,  
                                    --T.CONTRATO,           
                                    T.LINK_PORTAL_FUNCEF, 
                                    T.TRGDTINCLUSAO,      
                                    -- TO_CHAR(TO_DATE(T.TRGDTINCLUSAO), 'DD/MM/YYYY') AS TRGDTINCLUSAO,
                                    T.TRGUSERINCLUSAO,    
                                    TC.TCEDESCRICAO,
                                    hist.dt_inicio_vigencia,
                                    hist.id_contrato_historico,
                                    hist.nu_versao,
                                    hist.dt_final_vigencia
                                FROM CM.TB_EMP_CONTRATOS T   
                                INNER JOIN cm.TIPOCONTREMPTMO TC ON T.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO 
                                LEFT JOIN cm.tb_contrato_historico hist ON t.id_tb_emp_contratos = hist.id_tb_emp_contratos";                                           

            if (!String.IsNullOrEmpty(tipocontrato))     
                query = string.Concat(query, " WHERE T.IDTIPOCONTREMPTMO = :pIDTIPOCONTREMPTMO ");                      
            
            if (DataInicioVigencia != null)
                query = string.Concat(query, " AND hist.dt_inicio_vigencia = :DataInicioVigencia");

            query += @" UNION
                            SELECT
                                    T.ID_TB_EMP_CONTRATOS,
                                    T.IDTIPOCONTREMPTMO,                 
                                    t.LINK_PORTAL_FUNCEF, 
                                    t.TRGDTINCLUSAO,  
                                    t.TRGUSERINCLUSAO,    
                                    TC.TCEDESCRICAO,
                                    hist.dt_inicio_vigencia,
                                    hist.id_contrato_historico,
                                    hist.nu_versao,
                                    hist.dt_final_vigencia
                        FROM CM.TB_EMP_CONTRATOS T
                        INNER JOIN cm.TIPOCONTREMPTMO TC ON T.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO                
                        LEFT JOIN cm.tb_contrato_historico hist ON t.id_tb_emp_contratos = hist.id_tb_emp_contratos
                        WHERE T.IDTIPOCONTREMPTMO = :tipocontrato ";

            query = string.Concat(query, " order by hist.nu_versao desc, hist.dt_inicio_vigencia desc ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);

            if (!String.IsNullOrEmpty(tipocontrato)) { } 
                bancoDeDados.AddInParameter(comando, "pIDTIPOCONTREMPTMO", DbType.String, tipocontrato);

            if (DataInicioVigencia != null)
                bancoDeDados.AddInParameter(comando, "DataInicioVigencia", DbType.Date, DataInicioVigencia);

            if (!String.IsNullOrEmpty(tipocontrato)) { }
            bancoDeDados.AddInParameter(comando, "tipocontrato", DbType.String, tipocontrato);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    DateTime? data = null;
                     if (leitor.GetValue(leitor.GetOrdinal("dt_inicio_vigencia")) != DBNull.Value)
                        data = leitor.obterValorData(leitor.GetOrdinal("dt_inicio_vigencia")).GetValueOrDefault();
                    modelo.Add(new ModeloContratoEmp()
                    {
                        idtbEmpContrato = leitor.obterInt(leitor.GetOrdinal("ID_TB_EMP_CONTRATOS")),
                        idTipoContratoEmptmo = leitor.obterInt(leitor.GetOrdinal("IDTIPOCONTREMPTMO")),
                        tipoContrEmptmo = leitor.obterString(leitor.GetOrdinal("TCEDESCRICAO")),
                        link = leitor.obterString(leitor.GetOrdinal("LINK_PORTAL_FUNCEF")),
                        dataInclusao = leitor.obterValorData(leitor.GetOrdinal("TRGDTINCLUSAO")).GetValueOrDefault(),
                        usuarioInclusao = leitor.obterString(leitor.GetOrdinal("TRGUSERINCLUSAO")) ,                        
                        DataInicioVigencia = data,
                        IdMinutaHistorico = leitor.obterInt(leitor.GetOrdinal("id_contrato_historico")),
                        NuVersaoMinuta = leitor.obterInt(leitor.GetOrdinal("nu_versao")),
                        DataFimVigencia = leitor.GetValue(9) == DBNull.Value? (DateTime?) null : leitor.obterValorData(leitor.GetOrdinal("dt_final_vigencia")).GetValueOrDefault()

                });
                };
            }

            // Total de Regristros
            parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query);

            // Retorna informações
            parametros.prepararRetorno();

            comando.Connection.Close();
            comando.Dispose();

            return modelo;
        }

        public string InsAltDelModContratos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao)
        {

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            int IdTbEmpContratos = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "CM.SEQ_TB_EMP_CONTRATOS");          

            try
            {
                //operacao == I -> inserir | A -> alterar | E -> excluir 
                string query = "";
                if (operacao == "I")
                {
                    query = "INSERT INTO CM.TB_EMP_CONTRATOS " +
                            " (ID_TB_EMP_CONTRATOS, " +
                            " IDTIPOCONTREMPTMO,   " +
                            " CONTRATO,            " +
                            " LINK_PORTAL_FUNCEF,  " +
                            " TRGDTINCLUSAO,       " +
                            " TRGUSERINCLUSAO )   " +
                            " VALUES              " +
                            " (:IdContratoHistorico, " +
                            " :pIDTIPOCONTREMPTMO,   " +
                            " :pCONTRATO,            " +
                            " :pLINK_PORTAL_FUNCEF,  " +
                            " :pTRGDTINCLUSAO,       " +
                            " :pTRGUSERINCLUSAO )    ";

                    comando = bancoDeDados.GetSqlStringCommand(query);

                    bancoDeDados.AddInParameter(comando, "IdTbEmpContratos", DbType.Int32, IdTbEmpContratos);
                    bancoDeDados.AddInParameter(comando, "pIDTIPOCONTREMPTMO", DbType.Int32, modContrato.idTipoContratoEmptmo);
                    bancoDeDados.AddInParameter(comando, "pCONTRATO", DbType.Binary, leiaute.leioutContrato);
                    bancoDeDados.AddInParameter(comando, "pLINK_PORTAL_FUNCEF", DbType.String, modContrato.link);
                    bancoDeDados.AddInParameter(comando, "pTRGDTINCLUSAO", DbType.DateTime, modContrato.dataInclusao);
                    bancoDeDados.AddInParameter(comando, "pTRGUSERINCLUSAO", DbType.String, modContrato.usuarioInclusao);

                    bancoDeDados.ExecuteNonQuery(comando);

                }

                if (operacao == "A")
                {
                    query = " UPDATE CM.TB_EMP_CONTRATOS SET " +                          
                            " TRGDTINCLUSAO   =  :pTRGDTINCLUSAO , " +
                            " TRGUSERINCLUSAO  =  :pTRGUSERINCLUSAO ";

                   // " LINK_PORTAL_FUNCEF = :pLINK_PORTAL_FUNCEF, " +
                    if (leiaute.leioutContrato != null)
                    {
                        query = query + " ,CONTRATO = :pCONTRATO ";
                    }
                    query = query + " WHERE IDTIPOCONTREMPTMO = :pIDTIPOCONTREMPTMO ";

                    comando = bancoDeDados.GetSqlStringCommand(query);

                    bancoDeDados.AddInParameter(comando, "pLINK_PORTAL_FUNCEF", DbType.String, modContrato.link);
                    bancoDeDados.AddInParameter(comando, "pTRGDTINCLUSAO", DbType.DateTime, modContrato.dataInclusao);
                    bancoDeDados.AddInParameter(comando, "pTRGUSERINCLUSAO", DbType.String, modContrato.usuarioInclusao);

                    if (leiaute.leioutContrato != null)
                    {
                        bancoDeDados.AddInParameter(comando, "pCONTRATO", DbType.Binary, leiaute.leioutContrato);
                    }

                    bancoDeDados.AddInParameter(comando, "pIDTIPOCONTREMPTMO", DbType.Int32, modContrato.idTipoContratoEmptmo);

                    bancoDeDados.ExecuteNonQuery(comando);
                }

                if (operacao == "E")
                {
                    query = "DELETE FROM CM.TB_EMP_CONTRATOS WHERE IDTIPOCONTREMPTMO = :pIDTIPOCONTREMPTMO";

                    comando = bancoDeDados.GetSqlStringCommand(query);
                    bancoDeDados.AddInParameter(comando, "pIDTIPOCONTREMPTMO", DbType.Int32, modContrato.idTipoContratoEmptmo);
                    bancoDeDados.ExecuteNonQuery(comando);

                }                
                return string.Empty;
            }
            catch(Exception ex)
            {
                return ex.Message;
            }            
        }

        //William Santana - SIG 50871 - término


        //SIG 21529 - INÍCIO     
        public bool DataCreditoPossuiINPC(string pDataCredito)
        {
            string query = @"SELECT  NVL(TO_CHAR(TO_NUMBER(SUM(1 + cm.cotvalor / 100))),0) as VLRINPC  
                             FROM cotacaomoeda cm
                             WHERE cm.moecodigo = 7
                             AND cm.cotmesref = to_char(add_months(:pDataCredito, -2), 'MMYYYY')";

            double? vlrINPC = 0d;
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "pDataCredito", DbType.String, pDataCredito);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                        vlrINPC =  (double)leitor.obterDecimal(0);
                }
            }
            return vlrINPC > 0d;
        }

        public List<ContratoRenegociacao> consultarParcelasRenegociacao(IDictionary<String, object> parametros)
        {
            var reneg = new List<ContratoRenegociacao>();
            Database bancoDeDados = this.obterBancoDeDados();

            try
            {

                string SQLProcedure = @"{CALL CM.PCK_EMP_RENEG_INADIMPLENCIA.SP_EMP_RENEGOCIACAO_LIQ_ZERO(:pIdPessoa,:pIdTitular,:pIDTipoContratoEmptmo,
                                                                                                              :pIDContratoAntAQuitar,:pDtCredito,:pDtPrimeiraParcela,
                                                                                                              :pTXJuros,:pNumParcela,:pValorSaldoQuitar,
                                                                                                              :pValorSolicitado,:pValorMaximoPermitido,:pIdCalculo,:pUsuario)}";
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(SQLProcedure))
                {
                    bancoDeDados.AddInParameter(comando, "pIdPessoa", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pIdPessoa").Value);
                    bancoDeDados.AddInParameter(comando, "pIdTitular", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pIdTitular").Value);
                    bancoDeDados.AddInParameter(comando, "pIDTipoContratoEmptmo", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pIDTipoContratoEmptmo").Value);
                    bancoDeDados.AddInParameter(comando, "pIDContratoAntAQuitar", DbType.String, parametros.FirstOrDefault(x => x.Key == "pIDContratoAntAQuitar").Value);
                    bancoDeDados.AddInParameter(comando, "pDtCredito", DbType.Date, parametros.FirstOrDefault(x => x.Key == "pDtCredito").Value);
                    bancoDeDados.AddInParameter(comando, "pDtPrimeiraParcela", DbType.Date, parametros.FirstOrDefault(x => x.Key == "pDtPrimeiraParcela").Value);
                    bancoDeDados.AddInParameter(comando, "pTXJuros", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pTXJuros").Value);
                    bancoDeDados.AddInParameter(comando, "pNumParcela", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pNumParcela").Value);
                    bancoDeDados.AddInParameter(comando, "pValorSaldoQuitar", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pValorSaldoQuitar").Value);
                    bancoDeDados.AddInParameter(comando, "pValorSolicitado", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pValorSolicitado").Value);
                    bancoDeDados.AddInParameter(comando, "pValorMaximoPermitido", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pValorMaximoPermitido").Value);
                    bancoDeDados.AddInParameter(comando, "pIdCalculo", DbType.Double, parametros.FirstOrDefault(x => x.Key == "pIdCalculo").Value);
                    bancoDeDados.AddInParameter(comando, "pUsuario", DbType.String, parametros.FirstOrDefault(x => x.Key == "pUsuario").Value);
                    bancoDeDados.AddInParameter(comando, "pResultado", DbType.Binary, null);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        while (leitor.Read())
                        {
                            Parcela p = new Parcela();

                            p.Modalidade = leitor.GetValue(leitor.GetOrdinal("Modalidade")).ToString();
                            p.numeroContrato = leitor.GetValue(leitor.GetOrdinal("Contrato")).ToString();
                            p.MesReferencia = leitor.GetValue(leitor.GetOrdinal("MesReferencia")).ToString();
                            p.ItemPrestacao = leitor.GetValue(leitor.GetOrdinal("ItemPrestacao")).ToString();
                            //decimal valorItem = Convert.ToDecimal(leitor.GetValue((leitor.GetOrdinal("VlrItemPrestacao"))));
                            string valorItem = leitor.obterString(leitor.GetOrdinal("VlrItemPrestacao"));
                            p.ValorItemPrestacao = Convert.ToDouble(valorItem);
                            p.IsMarcado = Convert.ToBoolean(leitor.GetValue(leitor.GetOrdinal("IsMarcado")));
                            p.NumeroParcela = Convert.ToInt32(leitor.GetValue(leitor.GetOrdinal("Parcela")));

                            if (reneg.Find(a => a.modalidade == p.Modalidade && a.numeroContrato == p.numeroContrato) == null)
                            {
                                var parcelas = new List<Parcela>();
                                parcelas.Add(p);

                                ContratoRenegociacao c = new ContratoRenegociacao()
                                {
                                    modalidade = p.Modalidade,
                                    numeroContrato = p.numeroContrato,
                                    itens = parcelas
                                };
                                reneg.Add(c);
                            }
                            else
                            {
                                foreach (ContratoRenegociacao c in reneg)
                                {
                                    if (c.modalidade == p.Modalidade && c.numeroContrato == p.numeroContrato)
                                    {
                                        c.itens.Add(p);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return reneg;
        }

        public int ContratoDecimoTerceito(string pNumContrato)
        {
            string query;
            int retorno = 0;
            query = @" SELECT COUNT(1) AS QTDE
                         FROM Contratoemptmo cont 
                         JOIN TipoContremptmo tipo ON tipo.idtipocontremptmo = cont.idtipocontremptmo
                        WHERE tcemaxparc = 1
                      AND cont.idcontratoemptmo in (:pNumContrato)";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "pNumContrato", DbType.String, pNumContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        retorno = leitor.obterInt(0);
                    }
                }
                return retorno;
            }
        }
        //SIG 21529 - Fim
        #endregion

        #region SIG 28915 - Darivaldo Alencar
        public bool NupEstaVinculado(string idPessoa, string protocolo)
        {
            bool NupVinculado = false;
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @"SELECT COUNT(1)
                             FROM CM.ASSINCONTRPADRAO A 
                             WHERE REPLACE(REPLACE(A.NUMPROTOCOLO, '.', ''), '/', '') = :NUMPROTOCOLO_P
                             AND A.IDPESSOA <> :IDPESSOA_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "NUMPROTOCOLO_P", DbType.String, protocolo);
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.String, idPessoa);

                NupVinculado = Convert.ToInt32(bancoDeDados.ExecuteScalar(comando)) > 0;
            }

            return NupVinculado;
        }
        #endregion

        #region Alteração

        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - início 
        public void EncerrarBloqueioConcessao(int IdPessoa, DateTime DataQuitacao)
        {
            string query = @"UPDATE CM.SUSPCONCESSAO SET
                                FLGSTATUS = 'E',
                                SUCDATAFINAL = :SUCDATAFINAL
                              WHERE IDMOTIVOSUSPCONCESSAO = 23
                                AND FLGSTATUS = 'A'
                                AND IDPESSOA = :IDPESSOA";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "SUCDATAFINAL", DbType.DateTime, DataQuitacao);
                bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int32, IdPessoa);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        //WO3200 - Criação do método
        public void CancelarBloqueioConcessao(int IdPessoa, string UsuarioResponsavel, bool RenegociacaoInadimplencia=false)
        {
            string query = @"UPDATE CM.SUSPCONCESSAO SET FLGSTATUS = 'C', 
                                                         SUCUSERALTERACAO = :UsuarioResponsavel, 
                                                         SUCDTALTERACAO = SYSDATE                             
                             WHERE IDPESSOA = :IDPESSOA
                             AND FLGSTATUS = 'A'";

            //if (RenegociacaoInadimplencia)
            //    query += "AND SUCMOTIVOSUSP like '%renegociação de inadimplência.'";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "UsuarioResponsavel", DbType.String, UsuarioResponsavel);
                bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int32, IdPessoa);                
                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        public bool isAcordoJudicial(long Numerocontrato, ref int IdPessoa)
        {
            string query = @"SELECT FLGACORDOJUDICIAL, IDPESSOA FROM CM.CONTRATOEMPTMO WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, Numerocontrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        IdPessoa = int.Parse(leitor["IDPESSOA"].ToString());
                        return leitor["FLGACORDOJUDICIAL"].ToString() == "1";
                    }
                }

                return false;
            }
        }

        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - fim

        /// <summary>
        /// Altera informações do contrato.
        /// </summary>
        /// <param name="contrato">Contrato com os dados para alteração.</param>
        public void alterarInformacoesContratuais(Contrato contrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.CONTRATOEMPTMO 
               SET FLGFORMAREC = :FLGFORMAREC_P, 
                                 PORTFORMAREC = :PORTFORMAREC_P, 
                                 IDCBANCARIADEB = :IDCBANCARIADEB_P, 
                                 NUMPARCDESCONTO = :NUMPARCDESCONTO_P 
             WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "FLGFORMAREC_P", DbType.String, contrato.formaRecebimento);
                bancoDeDados.AddInParameter(comando, "PORTFORMAREC_P", DbType.Int32, contrato.portadorRecebimento);
                bancoDeDados.AddInParameter(comando, "IDCBANCARIADEB_P", DbType.Int32, contrato.mutuario.dadosBancarios.id);
                bancoDeDados.AddInParameter(comando, "NUMPARCDESCONTO_P", DbType.Int32, contrato.numeroParcelasAtrasadas);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, contrato.numero);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Altera forma de cobrança do contrato.
        /// </summary>
        /// <param name="formaCobranca">Nova forma de cobrança.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        public void alterarFormaCobranca(string formaCobranca, long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE HISTMOVEMPTMO 
               SET HMEFORMACOBRANCA = :FLGFORMAREC_P 
             WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P 
               AND (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) 
               AND HMETIPOMOV <> 5 
               AND HMEVLREFETIVO IS NULL 
               AND FLGENVIO = 0 
               AND IDTMPDESC IS NULL 
               AND CODDOCUMENTO IS NULL ";


            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "FLGFORMAREC_P", DbType.String, formaCobranca);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }


        }

        /// <summary>
        /// Altera a situação do contrato, quando se tem o tipo em que o contrato ira ficar, exemplo da chave mestre na 
        /// tela de consulta de contratos
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        //Willliam Moreira da Silva - SOL 225203
        public void alterarSituacao(long numeroContrato, SituacaoContrato situacao)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.CONTRATOEMPTMO CON SET CON.FLGSITUACAO = :SITUACAO_P 
             WHERE CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "SITUACAO_P", DbType.String, situacao.codigo);
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        //public void alterarSituacao(long numeroContrato, SituacaoContrato situacao)
        public string alterarSituacao(long numeroContrato)
        {   //Willliam Moreira da Silva - SOL 225203
            //A situação agora é alterada pela procedure
            /*Database bancoDeDados = this.obterBancoDeDados();
            string query;

             UPDATE CM.CONTRATOEMPTMO CON SET CON.FLGSITUACAO = :SITUACAO_P ");
             WHERE CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "SITUACAO_P", DbType.String, situacao.codigo);
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            bancoDeDados.ExecuteNonQuery(comando);*/

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_AJUSTA_SITUACAO_CONTR"))
            {

                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "pDataAtuDiaria ", DbType.DateTime, null);

                bancoDeDados.AddOutParameter(comando, "pNovaSit", DbType.String, 1);

                bancoDeDados.ExecuteNonQuery(comando);

                if (bancoDeDados.GetParameterValue(comando, "pNovaSit") == DBNull.Value)
                {
                    return string.Empty;
                }
                else
                {
                    ////comando.Connection.Close();
                    //comando.Dispose();
                    return (string)bancoDeDados.GetParameterValue(comando, "pNovaSit");
                }
            }
            //Willliam Moreira da Silva - SOL 225203
        }

        /// <summary>
        /// Altera informações de suspensão do contrato.
        /// </summary>
        /// <param name="suspensao">Dados da suspensão.</param>
        public void alterarSuspensao(HistoricoSuspensao suspensao)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            //query.Append(" UPDATE CM.CONTRATOEMPTMO ");
            //query.Append(" SET DATAINICIOSUSP        = :DATAINICIOSUSP_P, ");
            //query.Append(" DATAFIMSUSP           = :DATAFIMSUSP_P, ");
            //query.Append(" USUARIOLIBSUSP        = :USUARIOLIBSUSP_P, ");
            //query.Append(" DATALIBSUSP           = :DATALIBSUSP_P, ");
            //query.Append(" ANOSUSPENSAO          = :ANOSUSPENSAO_P, ");
            //query.Append(" MESSUSPENSAO          = :MESSUSPENSAO_P, ");
            //query.Append(" IDTIPOSUSPEMPTMO      = :IDTIPOSUSP_P ");//William Mroeira da Silva - SOL 211038 KINTANA 2033107
            //query.Append(" WHERE  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ");

            query = @" UPDATE CM.CONTRATOEMPTMO 
             SET DATAINICIOSUSP        = :DATAINICIOSUSP_P, 
             DATAFIMSUSP           = :DATAFIMSUSP_P, 
             USUARIOLIBSUSP        = :USUARIOLIBSUSP_P, 
             DATALIBSUSP           = :DATALIBSUSP_P, 
             ANOSUSPENSAO          = :ANOSUSPENSAO_P, 
             MESSUSPENSAO          = :MESSUSPENSAO_P ";

            if (suspensao.tipoSuspensao != null) //TAES - SIG94124
                query += ", IDTIPOSUSPEMPTMO      = :IDTIPOSUSP_P "; //TAES - SIG94124

            query += "WHERE  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "DATAINICIOSUSP_P", DbType.DateTime, suspensao.dataInicio);
                bancoDeDados.AddInParameter(comando, "DATAFIMSUSP_P", DbType.DateTime, suspensao.dataFim);
                bancoDeDados.AddInParameter(comando, "USUARIOLIBSUSP_P", DbType.String, suspensao.responsavelAtualizacao);
                bancoDeDados.AddInParameter(comando, "DATALIBSUSP_P", DbType.DateTime, suspensao.dataLiberacao);

                if (suspensao.dataLiberacao.HasValue)
                {
                    bancoDeDados.AddInParameter(comando, "ANOSUSPENSAO_P", DbType.Int32, suspensao.dataLiberacao.Value.Year);
                    bancoDeDados.AddInParameter(comando, "MESSUSPENSAO_P", DbType.Int32, suspensao.dataLiberacao.Value.Month);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "ANOSUSPENSAO_P", DbType.Int32, null);
                    bancoDeDados.AddInParameter(comando, "MESSUSPENSAO_P", DbType.Int32, null);
                }

                if(suspensao.tipoSuspensao != null) //TAES - SIG94124
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSP_P", DbType.Int32, suspensao.tipoSuspensao.id);//William Moreira da Silva - SOL 211038 KINTANA 2033107


                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, suspensao.contrato.numero);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Retira informações de suspensão do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public void retirarSuspensao(long NumeroContrato, string UsuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.CONTRATOEMPTMO 
             SET IDTIPOSUSPEMPTMO  = null, 
             DATAINICIOSUSP        = null, 
             DATAFIMSUSP           = null, 
             USUARIOLIBSUSP        = :UsuarioLogado, 
             DATALIBSUSP           = SYSDATE, 
             ANOSUSPENSAO          = null, 
             MESSUSPENSAO          = null 
             WHERE  IDCONTRATOEMPTMO = :NumeroContrato ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "UsuarioLogado", DbType.String, UsuarioLogado);
                bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Int64, NumeroContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Coloca o numero do contrato de Quitação no contrato quitado
        /// </summary>
        public void alterarContratoQuitacao(long contratoNovo, long contratoQuitado)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.CONTRATOEMPTMO 
             SET IDCONTRQUITACAO  = :CONTRATONOVO_P
             WHERE IDCONTRATOEMPTMO = :CONTRATOQUITADO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "CONTRATONOVO_P", DbType.Int64, contratoNovo);
                bancoDeDados.AddInParameter(comando, "CONTRATOQUITADO_P", DbType.Int64, contratoQuitado);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        public void alterarDataQuitacao(long numeroContrato, DateTime dataQuitacao)
        {

            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.CONTRATOEMPTMO 
             SET DATACANC = :DATAQUITACAO_P
             WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        //WO3200 - Criação do método
        public void ExcluirEventoCobranca(long NumeroContrato, int IdTipoEventoCobranca)
        {
            string query = @"DELETE CM.HISTEVENTOCOBEMPTMO
                             WHERE IDCONTRATOEMPTMO = :NumeroContrato 
                             AND IDTIPOEVENTOCOBEMPTMO = :IdTipoEventoCobranca";

            Database bancoDeDados = this.obterBancoDeDados();
          
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Double, NumeroContrato);
                bancoDeDados.AddInParameter(comando, "IdTipoEventoCobranca", DbType.Int32, IdTipoEventoCobranca);
                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        #endregion

        #region Inclusão

        //William Moreira da Silva - SOL 246823 - Envio
        public void incluirInformacoesEnvioETL(ObjetoEnvio envio)
        {
            string query;

            query = @" INSERT INTO 
                       ETL_EMPTMO.PARAM_ETL_002_ENVIO (
                       idcontratoemptmo, 
                       datavencto,
                       planos,
                       patrocinadoras,
                       flgfinanrec,
                       flgfolhapatro, 
                       flgfolhabenef,       
                       usuario,
                       FLGDESATIVACONC )
                       VALUES (
                       :idcontratoemptmo_P, 
                       :datavencto_P,
                       :planos_P,
                       :patrocinadoras_P,
                       :flgfinanrec_P,
                       :flgfolhapatro_P, 
                       :flgfolhabenef_P,       
                       :usuario_P,
                       :FLGDESATIVACONC_P )  ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                if (envio.idContratoEmptmo == 0)
                {
                    bancoDeDados.AddInParameter(comando, "idcontratoemptmo_P", DbType.Int64, DBNull.Value);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "idcontratoemptmo_P", DbType.Int64, envio.idContratoEmptmo);
                }
                bancoDeDados.AddInParameter(comando, "datavencto_P", DbType.DateTime, envio.dataVencto);
                bancoDeDados.AddInParameter(comando, "planos_P", DbType.String, envio.planos);
                bancoDeDados.AddInParameter(comando, "patrocinadoras_P", DbType.String, envio.patrocinadoras);
                bancoDeDados.AddInParameter(comando, "flgfinanrec_P", DbType.Int32, envio.flgFinanRec);
                bancoDeDados.AddInParameter(comando, "flgfolhapatro_P", DbType.Int32, envio.flgFolhaPatro);
                bancoDeDados.AddInParameter(comando, "flgfolhabenef_P", DbType.Int32, envio.flgFolhaBenef);
                bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, envio.usuario.ToUpper());
                bancoDeDados.AddInParameter(comando, "FLGDESATIVACONC_P", DbType.Int32, envio.flgDesativaConc);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }
        //William Moreira da Silva - SOL 246823 - Envio

        public void incluirAssinaturaPadrao(Assinatura assinaturaContrato)
        {
            string query;

            query = @" INSERT INTO CM.ASSINCONTRPADRAO( 
             IDPESSOA,
             IDCONTRATOPADRAO,
             ACPDATAASSINAT,
             TRGDTINCLUSAO,
             TRGUSERINCLUSAO,
             OBS,
             IDBENEF,
             NUMCOMPROVA)
             VALUES (
             :IDPESSOA_P,
             :IDCONTRATOPADRAO_P,
             :ACPDATAASSINAT_P,
             SYSDATE,
             'CM_WEB_AUTO',
             :OBS_P,
             :IDBENEF_P,
             :NUMCOMPROVA_P) ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, assinaturaContrato.mutuario.idTitular);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOPADRAO_P", DbType.Int32, assinaturaContrato.idContratoPadrao);
                bancoDeDados.AddInParameter(comando, "ACPDATAASSINAT_P", DbType.DateTime, assinaturaContrato.dataAssinatura);
                bancoDeDados.AddInParameter(comando, "OBS_P", DbType.String, assinaturaContrato.observacao);
                bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int32, assinaturaContrato.mutuario.id);
                bancoDeDados.AddInParameter(comando, "NUMCOMPROVA_P", DbType.String, assinaturaContrato.numeroComprovante);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        //William Moreira da Silva - SOL 251082
        /// <summary>
        /// Obtem o novo numero de contrato
        /// </summary>
        /// <returns>Retorna o novo numero de contrato</returns>
        public long obterNumeroContrato()
        {
            Database bancoDeDados = this.obterBancoDeDados();

            return UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQCONTRATOEMPTMO", true);
        }

        /// <summary>
        /// Verifica se o numero de contrato já existe
        /// </summary>
        /// <param name="numeroContrato">Número do contrato que esta sendo contratado</param>
        /// <returns>Retorna verdadeiro se já existir </returns>
        public bool verificanumeroContrato(long numeroContrato)
        {
            string query;

            query = @" SELECT 1 FROM CM.CONTRATOEMPTMO WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //Parâmetros
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

                bool existe = false;

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        existe = true;
                    }
                }

                return existe;
            }
        }
        //William Moreira da Silva - SOL 251082

        /// <summary>
        /// Inclui um contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna numero do contrato inserido</returns>
        public long incluir(Contrato contrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            //William Moreira da Silva - SOL 251082
            long numeroContrato;

            if (contrato.numero == 0)
            {
                numeroContrato = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQCONTRATOEMPTMO", true);
            }
            else
            {
                numeroContrato = contrato.numero;
            }
            //William Moreira da Silva - SOL 251082

            string login = string.Format("CM{0}", this.obterIdPlanus(contrato.usuario.login));

            //William Moreira da Silva - SIG27879 - Inicio
            // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - Inclusão da FLGACORDOJUDICIAL
            query = @" INSERT INTO CM.CONTRATOEMPTMO ( 
               IDCONTRATOEMPTMO, 
               IDPESSOA, 
               IDTIPOCONTREMPTMO, 
               IDINSCRICAOEMPTMO, 
               IDPLANOPREV, 
               IDPATRO, 
               IDBENEF, 
               IDCBANCARIA, 
               CODFORMAPAG, 
               PORTFORMAPAG, 
               PORTFORMAREC, 
               NUMPARCELAS, 
               DATACREDITO, 
               DATAASSINATURA, 
               DATAPRIMPARC, 
               VLRCONTRATO, 
               VLRPARCELA, 
               TXJUROS, 
               FLGSITUACAO, 
               FLGFORMAREC, 
               FLGFORMAPAG, 
               VLRSALBASE, 
               VLRMARGEM, 
               VLRMAXPERMIT, 
               MOECODIGO, 
               IDTIPOSUSPEMPTMO, 
               DATAINICIOSUSP, 
               DATAFIMSUSP, 
               ANOSUSPENSAO, 
               MESSUSPENSAO, 
               IDCBANCARIADEB, 
               IDPLANOORIGEM, 
               FLGEXCEPCIONAL, 
               NUMPROTOCOLO,  
               TRGDTINCLUSAO, 
               TRGUSERINCLUSAO,  
               FLGINTERNET,      
               CODAUTOEMP,
			   TXCORRECAO,
               FLGACORDOJUDICIAL
)        
            VALUES( 

            :numeroContrato, 
            :mutuarioid, 
            :tipoid, 
            :inscricaoid, 
            :planoid, 
            :patrocinadoraid, 
            :beneficiarioid, 
            :dadosBancariosid, 
            :formaPagamento, 
            :portadorCredito, 
            :portadorDebito, 
            :totalParcelas, 
            :dataCredito, 
            :dataAssinatura, 
            :dataParcela, 
            :valorContrato, 
            :valorParcela, 
            :taxaJuros, 
            :situacao, 
            'C', 
            'C', 
            :salarioBase, 
            :valorMargem, 
            :valorMaximo, 
            :indexadorid, 
            :suspensaoid, 
            :InicioSuspensao, 
            :FimSuspensao, 
            :AnoSuspensao, 
            :MesSuspensao, 
            :dadosBancariosid1, 
            :idPlanoOrigem, 
            :excepcional, 
            :numprotocolo,  
            :TRGDTINCLUSAO, 
            :login,                 
            :internet,               
            :codigoAutoEmprestimo,
			:TXCORRECAO,
            :FLGACORDOJUDICIAL) ";
            //William Moreira da Silva - SIG27879 - Fim

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "mutuarioid", DbType.Int32, contrato.mutuario.idTitular);
                bancoDeDados.AddInParameter(comando, "tipoid", DbType.Int32, contrato.tipo.id);
                bancoDeDados.AddInParameter(comando, "inscricaoid", DbType.Int64, contrato.inscricaoEmprestimo.id);
                bancoDeDados.AddInParameter(comando, "planoid", DbType.Int32, contrato.plano.id);
                bancoDeDados.AddInParameter(comando, "patrocinadoraid", DbType.Int32, contrato.patrocinadora.id);
                bancoDeDados.AddInParameter(comando, "beneficiarioid", DbType.Int32, contrato.mutuario.id);
                bancoDeDados.AddInParameter(comando, "dadosBancariosid", DbType.Int32, contrato.mutuario.dadosBancarios.id);
                bancoDeDados.AddInParameter(comando, "formaPagamento", DbType.Int32, int.Parse(contrato.formaPagamento));
                bancoDeDados.AddInParameter(comando, "portadorCredito", DbType.Int32, int.Parse(contrato.portadorCredito));
                bancoDeDados.AddInParameter(comando, "portadorDebito", DbType.Int32, int.Parse(contrato.portadorDebito));
                bancoDeDados.AddInParameter(comando, "totalParcelas", DbType.Int32, contrato.totalParcelas);
                bancoDeDados.AddInParameter(comando, "dataCredito", DbType.DateTime, contrato.dataCredito);
                bancoDeDados.AddInParameter(comando, "dataAssinatura", DbType.DateTime, contrato.dataAssinatura);
                // Thiago Melo SOL 216474 Kintana 2045796
                string dtPrimParc = Convert.ToString(String.Format("{0:dd/MM/yyyy}", contrato.dataPrimeiraParcela));
                bancoDeDados.AddInParameter(comando, "dataParcela", DbType.DateTime, DateTime.Parse(dtPrimParc));
                // Thiago Melo SOL 216474 Kintana 2045796

                bancoDeDados.AddInParameter(comando, "valorContrato", DbType.Double, contrato.valorContrato);
                bancoDeDados.AddInParameter(comando, "valorParcela", DbType.Double, contrato.valorParcela);
                bancoDeDados.AddInParameter(comando, "taxaJuros", DbType.Double, contrato.taxaJuros);
                bancoDeDados.AddInParameter(comando, "situacao", DbType.String, contrato.situacao.codigo);
                bancoDeDados.AddInParameter(comando, "salarioBase", DbType.Double, contrato.salarioBase);
                bancoDeDados.AddInParameter(comando, "valorMargem", DbType.Double, contrato.valorMargem);
                bancoDeDados.AddInParameter(comando, "valorMaximo", DbType.Double, contrato.valorMaximo);
                bancoDeDados.AddInParameter(comando, "indexadorid", DbType.Int32, contrato.indexador.id);

                //ID tipo do suspensão
                if (contrato.suspensao.tipo.id == 0)
                    bancoDeDados.AddInParameter(comando, "suspensaoid", DbType.Int32, DBNull.Value);
                else
                    bancoDeDados.AddInParameter(comando, "suspensaoid", DbType.Int32, contrato.suspensao.tipo.id);

                bancoDeDados.AddInParameter(comando, "InicioSuspensao", DbType.DateTime, contrato.dataInicioSuspensao);
                bancoDeDados.AddInParameter(comando, "FimSuspensao", DbType.DateTime, contrato.dataFimSuspensao);

                if (contrato.dataInicioSuspensao == null)
                {
                    bancoDeDados.AddInParameter(comando, "AnoSuspensao", DbType.Int32, DBNull.Value);
                    bancoDeDados.AddInParameter(comando, "MesSuspensao", DbType.Int32, DBNull.Value);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "AnoSuspensao", DbType.Int32, contrato.dataInicioSuspensao.Value.Year);
                    bancoDeDados.AddInParameter(comando, "MesSuspensao", DbType.Int32, contrato.dataInicioSuspensao.Value.Month);
                }

                bancoDeDados.AddInParameter(comando, "dadosBancariosid1", DbType.Int32, contrato.mutuario.dadosBancarios.id);
                //William Moreira/Xavier SOL 218639 KTN 2050361 - Ao inserir o contrato o mesmo insere o idPlanoOrigem como idPlanoPrev.
                bancoDeDados.AddInParameter(comando, "idPlanoOrigem", DbType.Int32, contrato.plano.id);
                //bancoDeDados.AddInParameter(comando, "idPlanoOrigem", DbType.Int32, contrato.plano.IdPlanoOrigem);//William Moreira da Silva - SOL 217507 KTN 2047224
                bancoDeDados.AddInParameter(comando, "excepcional", DbType.Int32, Convert.ToInt32(contrato.excepcional));

                //William Moreira da Silva - SOL 214687 KTN 2042821
                if (!string.IsNullOrEmpty(contrato.numProtocolo))
                {
                    //William Moreira da Silva - SOL 213725 KINTANA 2040469
                    string numProtocoloString = contrato.numProtocolo.ToString();
                    numProtocoloString = numProtocoloString.PadLeft(15, '0');
                    //bancoDeDados.AddInParameter(comando, "numprotocolo", DbType.Int64, Convert.ToInt64(numProtocoloString)); // Xavier SOL 172525
                    bancoDeDados.AddInParameter(comando, "numprotocolo", DbType.String, numProtocoloString);
                    //William Moreira da Silva - SOL 213725 KINTANA 2040469
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "numprotocolo", DbType.String, DBNull.Value);
                }
                //William Moreira da Silva - SOL 214687 KTN 2042821

                bancoDeDados.AddInParameter(comando, "TRGDTINCLUSAO", DbType.DateTime, DateTime.Now);
                bancoDeDados.AddInParameter(comando, "login", DbType.String, login);

                //William Moreira da Silva - SOL 200852 KINTANA 1941359
                if (contrato.internet == null)
                {
                    contrato.internet = false;
                }
                bancoDeDados.AddInParameter(comando, "internet", DbType.Int16, (contrato.internet.Equals(true) ? 1 : 0)); // SOL 204655
                bancoDeDados.AddInParameter(comando, "codigoAutoEmprestimo", DbType.Int64, contrato.codigoAutoEmprestimo);//William Moreira da Silva - SOL 200852 KINTANA 1941359

                bancoDeDados.AddInParameter(comando, "TXCORRECAO", DbType.Double, contrato.taxaCorrecao);//William Moreira da Silva - SIG27879

                bancoDeDados.AddInParameter(comando, "FLGACORDOJUDICIAL", DbType.Int32, contrato.FlagAcordoJudicial); // Felipe A. Santos - SOL 224034/17909 PPM 1165556 

                bancoDeDados.ExecuteNonQuery(comando);

                //chamar metodo para acertar o o idPlanoPrevOrigem da ContratoEmptmo.
                this.acertaPlanoOrigem(contrato, numeroContrato);
                //William Moreira/Xavier


                return numeroContrato;
            }

        }


        //William Moreira da Silva - SOL 143476/16437
        /// <summary>
        /// Incluir informações do contrato que foi impresso
        /// </summary>
        /// <param name="relatorio">Objeto com todas as informações do contrato</param>
        public void incluirInformacoesDadosContratoEmptmo(RelatorioContrato relatorio)
        {
            string query;

            query = @" INSERT INTO CM.DADOSCONTRATOEMPTMO
                      (IDCONTRATOEMPTMO,
                       IDENTIDADE,
                       LOGRADOURO,
                       NUMERO,
                       COMPLEMENTO,
                       BAIRRO,
                       CIDADE,
                       UF,
                       CEP,
                       TELCELULAR,
                       TELCOMERCIAL,
                       TELRESIDENCIAL,
                       EMAILPESSOAL,
                       EMAILCOMERCIAL,
                       TEST1NOME,
                       TEST1CPF,
                       TEST2NOME,
                       TEST2CPF,
                       PROFISSAO)
                    VALUES
                      (:IDCONTRATOEMPTMO_P,
                       :IDENTIDADE_P,
                       :LOGRADOURO_P,
                       :NUMERO_P,
                       :COMPLEMENTO_P,
                       :BAIRRO_P,
                       :CIDADE_P,
                       :UF_P,
                       :CEP_P,
                       :TELCELULAR_P,
                       :TELCOMERCIAL_P,
                       :TELRESIDENCIAL_P,
                       :EMAILPESSOAL_P,
                       :EMAILCOMERCIAL_P,
                       :TEST1NOME_P,
                       :TEST1CPF_P,
                       :TEST2NOME_P,
                       :TEST2CPF_P,
                       :PROFISSAO_P ) ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, relatorio.numeroContrato);
                bancoDeDados.AddInParameter(comando, "IDENTIDADE_P", DbType.String, relatorio.identidade);
                bancoDeDados.AddInParameter(comando, "LOGRADOURO_P", DbType.String, relatorio.logradouro);
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.Int32, relatorio.numero);
                bancoDeDados.AddInParameter(comando, "COMPLEMENTO_P", DbType.String, relatorio.complemento);
                bancoDeDados.AddInParameter(comando, "BAIRRO_P", DbType.String, relatorio.bairro);
                bancoDeDados.AddInParameter(comando, "CIDADE_P", DbType.String, relatorio.cidade.nome);
                bancoDeDados.AddInParameter(comando, "UF_P", DbType.String, relatorio.uf.nome.Trim());
                bancoDeDados.AddInParameter(comando, "CEP_P", DbType.String, relatorio.cep.Replace("-", ""));
                bancoDeDados.AddInParameter(comando, "TELCELULAR_P", DbType.String, relatorio.numeroCelular);
                bancoDeDados.AddInParameter(comando, "TELCOMERCIAL_P", DbType.String, relatorio.numeroComercial);
                bancoDeDados.AddInParameter(comando, "TELRESIDENCIAL_P", DbType.String, relatorio.numeroResidencial);
                bancoDeDados.AddInParameter(comando, "EMAILPESSOAL_P", DbType.String, relatorio.emailPessoal);
                bancoDeDados.AddInParameter(comando, "EMAILCOMERCIAL_P", DbType.String, relatorio.emailComercial);
                bancoDeDados.AddInParameter(comando, "TEST1NOME_P", DbType.String, relatorio.nomeTest1);
                bancoDeDados.AddInParameter(comando, "TEST1CPF_P", DbType.String, relatorio.cpfTest1.Replace(".", "").Replace("-", ""));
                bancoDeDados.AddInParameter(comando, "TEST2NOME_P", DbType.String, relatorio.nomeTest2);
                bancoDeDados.AddInParameter(comando, "TEST2CPF_P", DbType.String, relatorio.cpfTest2.Replace(".", "").Replace("-", ""));
                bancoDeDados.AddInParameter(comando, "PROFISSAO_P", DbType.String, relatorio.profissao);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }
        //William Moreira da Silva - SOL 143476/16437

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica a situação na patrocinadora se estiver ativa
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato</param>
        /// <returns>Verdadeiro se a situação estiver ativa</returns>
        public bool situacaoPatrocianadora(long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @"SELECT 1
                                FROM CM.elegpatro el
                                     JOIN CM.sitfunc sf ON sf.idsitfunc = el.idsitfunc
                                     JOIN CM.CONTRATOEMPTMO c ON c.idbenef = c.idpessoa
                                                           AND c.idbenef = el.idpessoa
                                WHERE el.idpessoa = c.idbenef
                                AND   c.idcontratoemptmo = :IDCONTRATOEMPTMO_P
                                AND   sf.tiposit = 'A' ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

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

        /// <summary>
        /// Verifica se o mutuario tem vinculo empregaticio
        /// </summary>
        /// <param name="numeroContrato">Numero do contraro</param>
        /// <returns>Verdadeiro se o mutuario do contrato tiver vinculo</returns>
        public bool verificaVinculoEmpregaticio(long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query = @"SELECT 1 
                            FROM CM.partprevplan ppp
                                 JOIN CM.sitpart sp ON ppp.idsitpart = sp.idsitpart
                                 JOIN CM.CONTRATOEMPTMO c ON c.idpessoa = ppp.idpessoa
                            WHERE c.idcontratoemptmo = :IDCONTRATOEMPTMO_P
                            AND   ppp.idsitplanoprev <> 3
                            AND   c.idpessoa = c.idbenef
                            AND   sp.flginterno IN ('AT','MP')";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

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
        //William Moreira da Silva - SOL 207977

        //William Moreira/Xavier SOL 218639 KTN 2050361 Inicio
        /// <summary>
        /// Acerta o plano origem ao conceder o contrato
        /// </summary>
        /// <param name="contrato">Contrato que esta sendo concedido</param>
        public void acertaPlanoOrigem(Contrato contrato, long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" SELECT   CTB.IDPLANOPREV 
             FROM     CM.PARTPREVPLAN ATU, 
             CM.PARTPREVPLAN ANT, 
             CM.PLANPREVCONTABIL CTB 
             WHERE    ATU.IDPESSOA = :IDPESSOA_P 
             AND      ATU.IDPLANOPREV = 74 
             AND      CTB.IDPLANOPREVPREV = ANT.IDPLANOPREV 
             AND      CTB.IDPLANOPREV = 28 
             AND      ANT.IDPESSOA = ATU.IDPESSOA 
             AND      ANT.INSCRICAODATA = 
             (SELECT MAX(INSCRICAODATA) 
             FROM   CM.PARTPREVPLAN 
             WHERE  IDPESSOA = ATU.IDPESSOA 
             AND    IDPLANOPREV = 2 
             AND    IDSITPLANOPREV IN (25,27,28,29) 
             AND    FLGDESATIVADO = 1 
             AND    INSCRICAODATA < ATU.INSCRICAODATA) ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, contrato.mutuario.id);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        if (Convert.ToInt32(leitor.GetValue(0)) > 0)
                        {

                            this.atualizaPlanoContabil(numeroContrato, Convert.ToInt32(leitor.GetValue(0)));
                        }
                    }
                    else
                    {

                        buscaPlanoContabil(contrato, numeroContrato);
                    }
                }
            }
        }

        /// <summary>
        /// Busca o plano origem da BENEFBFICIARIO
        /// </summary>
        /// <param name="contrato">O Contrato que esta sendo concedido</param>
        public void buscaPlanoContabil(Contrato contrato, long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" SELECT DISTINCT 
             IDPESSOA, 
             IDTITULAR, 
             IDPLANOORIGEM, 
             IDPLANOPREV, 
             IDPLANPREVCONTAB 
             FROM 
             CM.BENEFBFCIARIO 
             WHERE 
             IDPESSOA       = :IDPESSOA_P 
             AND IDPLANOPREV    = :IDPLANOPREV_P 
             AND IDSITBENEFICIO = 1 ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, contrato.mutuario.id);
                bancoDeDados.AddInParameter(comando, "IDPLANOPREV_P", DbType.Int32, contrato.mutuario.plano.id);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        if (Convert.ToInt32(leitor.GetValue(4)) > 0)
                        {
                            atualizaPlanoContabil(numeroContrato, Convert.ToInt32(leitor.GetValue(4)));
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Atualiza o plano contabil
        /// </summary>
        /// <param name="contrato">Contrato que esta sendo concedido</param>
        /// <param name="idPlanoOrigem">Id plano origem que será inserido</param>
        public void atualizaPlanoContabil(long numeroContrato, int idPlanoOrigem)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE 
             CM.CONTRATOEMPTMO  
             SET 
             IDPLANOORIGEM    =:IDPLANOORIGEM_P 
             WHERE 
             IDCONTRATOEMPTMO =:IDCONTRATOEMPTMO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDPLANOORIGEM_P", DbType.Int32, idPlanoOrigem);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }
        //William Moreira/Xavier SOL 218639 KTN 2050361 Inicio

        /// <summary>
        /// Inclui inscricao de empréstimo do contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna id da inscricao inserido</returns>
        public long incluirInscricao(Contrato contrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            long idInscricao = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQINSCRICAOEMPTMO", true);

            query = @" INSERT INTO CM.INSCRICAOEMPTMO 
              (IDINSCRICAOEMPTMO, 
               IDTIPOCONTREMPTMO, 
               MOECODIGO, 
               IDPESSOA, 
               IDPATRO, 
               IDPLANOPREV, 
               IDBENEF, 
               IDCBANCARIA, 
               IDCBANCARIADEB, 
               FLGSITUACAO, 
               FLGFORMAREC, 
               FLGFORMAPAG, 
               CODFORMAPAG, 
               PORTFORMAPAG, 
               PORTFORMAREC, 
               DATAINSC, 
               VLRSOLIC, 
               NUMPARCELAS, 
               FLGSUSPENSAOAUTO, 
               VLRSALBASE, 
               VLRMARGEM, 
               VLRMAXPERMIT, 
               VLRPARCELAMES, 
               DATACREDITO,
                TRGDTINCLUSAO
                ) 

             VALUES ( 

            :idInscricao, 
            :tipoid, 
            :indexadorid, 
            :mutuarioid, 
            :patrocinadoraid, 
            :planoid, 
            :beneficiarioid, 
            :dadosBancariosid, 
            :dadosBancariosid1, 
            'A', 
            'F', 
            'C', 
            :formaPagamento, 
            :portadorCredito, 
            :portadorDebito, 
            :DATAINSC_P, 
            :valorContrato, 
            :totalParcelas, 
            0, 
            :salarioBase, 
            :valorMargem, 
            :valorMaximo, 
            :valorParcela, 
            :dataCredito,
            :TRGDTINCLUSAO_P ) ";
            //William Moreira da Silva - alterado para passar para os valores DATAINSC e TRGUSERINCLUSAO valor datetime.today - SOL 252228

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "idInscricao", DbType.Int64, idInscricao);
                bancoDeDados.AddInParameter(comando, "tipoid", DbType.Int32, contrato.tipo.id);
                bancoDeDados.AddInParameter(comando, "indexadorid", DbType.Int32, contrato.indexador.id);
                bancoDeDados.AddInParameter(comando, "mutuarioid", DbType.Int32, contrato.mutuario.id);
                bancoDeDados.AddInParameter(comando, "patrocinadoraid", DbType.Int32, contrato.patrocinadora.id);
                bancoDeDados.AddInParameter(comando, "planoid", DbType.Int32, contrato.plano.id);
                bancoDeDados.AddInParameter(comando, "beneficiarioid", DbType.Int32, contrato.beneficiario.id);
                bancoDeDados.AddInParameter(comando, "dadosBancariosid", DbType.Int32, contrato.mutuario.dadosBancarios.id);
                bancoDeDados.AddInParameter(comando, "dadosBancariosid1", DbType.Int32, contrato.mutuario.dadosBancarios.id);
                bancoDeDados.AddInParameter(comando, "formaPagamento", DbType.Int32, int.Parse(contrato.formaPagamento));
                bancoDeDados.AddInParameter(comando, "portadorCredito", DbType.Int32, int.Parse(contrato.portadorCredito));
                bancoDeDados.AddInParameter(comando, "portadorDebito", DbType.Int32, int.Parse(contrato.portadorDebito));
                bancoDeDados.AddInParameter(comando, "DATAINSC_P", DbType.DateTime, DateTime.Today);//William Moreira da Silva - SOL 252228
                bancoDeDados.AddInParameter(comando, "valorContrato", DbType.Double, contrato.valorContrato);
                bancoDeDados.AddInParameter(comando, "totalParcelas", DbType.Int32, contrato.totalParcelas);
                bancoDeDados.AddInParameter(comando, "salarioBase", DbType.Double, contrato.salarioBase);
                bancoDeDados.AddInParameter(comando, "valorMargem", DbType.Double, contrato.valorMargem);
                bancoDeDados.AddInParameter(comando, "valorMaximo", DbType.Double, contrato.valorMaximo);
                bancoDeDados.AddInParameter(comando, "valorParcela", DbType.Double, contrato.valorParcela);
                bancoDeDados.AddInParameter(comando, "dataCredito", DbType.DateTime, contrato.dataCredito);
                bancoDeDados.AddInParameter(comando, "TRGDTINCLUSAO_P", DbType.DateTime, DateTime.Today);//William Moreira da Silva - SOL 252228

                bancoDeDados.ExecuteNonQuery(comando);

                return idInscricao;
            }
        }

        /// <summary>
        /// Inclui histórico da incrição de emprestimo do contrato
        /// </summary>
        /// <param name="idInscricao">ID da inscrição</param>
        /// <param name="item">Item do contrato</param>
        public void incluirInscricaoHistorico(long idInscricao, ItemContrato item)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" INSERT INTO CM.HISTMOVINSCRICAO 
            (IDINSCRICAOEMPTMO, 
            IDHISTMOVINSC, 
            IDREGRA, 
            IDITEMEMPTMO, 
            HMICENTRALIZA, 
            HMIDESTACADO, 
            HMIVLRPREVISTO) 

            VALUES (

            :idInscricao, 
            SEQHISTMOVINSCRICAO.NEXTVAL, 
            :regraid, 
            :id, 
            :centraliza, 
            :destacado, 
            :valor ) ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "idInscricao", DbType.Int64, idInscricao);
                bancoDeDados.AddInParameter(comando, "regraid", DbType.Int32, item.regra.id);
                bancoDeDados.AddInParameter(comando, "id", DbType.Int32, item.id);
                bancoDeDados.AddInParameter(comando, "centraliza", DbType.Int32, item.centraliza);
                bancoDeDados.AddInParameter(comando, "destacado", DbType.Int32, item.destacado);
                bancoDeDados.AddInParameter(comando, "valor", DbType.Double, item.valor);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Inclui o log de um contrato.
        /// </summary>
        /// <param name="logContrato">Log do contrato.</param>
        public void incluirLog(LogContrato logContrato)
        {
            // Preenche os dados do sistema.
            logContrato.versao = String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "W");
            logContrato.idPlanus = this.obterIdPlanus(Contexto.obterUsuario());

            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" INSERT INTO CM.LOGTOTALPREV 
              (IDLOGTOTALPREV, 
               IDMODULO, 
               DESCOPERACAO, 
               IDUSUARIO, 
               DATA, 
               IDPESQUISA1, 
               IDPESQUISA2, 
               ORIGEM, 
               VERSAO) 
            VALUES 
              (SEQLOGTOTALPREV.NEXTVAL, 
               :IDMODULO_P, 
               :DESCOPERACAO_P, 
               :IDUSUARIO_P, 
               SYSDATE, 
               :IDPESQUISA1_P, 
               :IDPESQUISA2_P, 
               :ORIGEM_P, 
               :VERSAO_P) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDMODULO_P", DbType.Int32, logContrato.modulo);
                bancoDeDados.AddInParameter(comando, "DESCOPERACAO_P", DbType.String, logContrato.descricao);
                bancoDeDados.AddInParameter(comando, "IDUSUARIO_P", DbType.Int64, logContrato.idPlanus);

                //William Moreira da Silva SOL 235167
                bancoDeDados.AddInParameter(comando, "IDPESQUISA1_P", DbType.Int64, logContrato.numeroContrato);
                bancoDeDados.AddInParameter(comando, "IDPESQUISA2_P", DbType.Int64, logContrato.idHistorico);
                //bancoDeDados.AddInParameter(comando, "IDPESQUISA1_P", DbType.Int64, logContrato.idHistorico);
                //bancoDeDados.AddInParameter(comando, "IDPESQUISA2_P", DbType.Int64, logContrato.numeroContrato);
                //William Moreira da Silva SOL 235167
                bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, logContrato.origem.chave);
                bancoDeDados.AddInParameter(comando, "VERSAO_P", DbType.String, !String.IsNullOrEmpty(logContrato.versao) ? logContrato.versao : string.Empty);//William Moreira da Silva SOL 235167

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }


        /// <summary>
        /// Inclui log se a Conta Corrente for alterada
        /// </summary>
        public void incluirLogDadosContratuais(Int64 idContrato, int idContaBancaria, string usuario)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            string login = string.Format("CM{0}", obterIdPlanus(usuario));

            query = @" INSERT INTO CM.HSTCBANCARIAEMPTMO(
             IDHSTCBANCARIAEMPTMO,
             IDCONTRATOEMPTMO,
             TRGDTINCLUSAO,
             TRGUSERINCLUSAO,
             IDCBANCARIADEB)
            VALUES( 
             SEQHSTCBANCARIAEMPTMO.NEXTVAL, 
             :IDCONTRATOEMPTMO_P, 
             SYSDATE, 
             :TRGUSERINCLUSAO_P,
             :IDCBANCARIADEB_P ) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
                bancoDeDados.AddInParameter(comando, "TRGUSERINCLUSAO_P", DbType.String, login);
                bancoDeDados.AddInParameter(comando, "IDCBANCARIADEB_P", DbType.Int32, idContaBancaria);

                bancoDeDados.ExecuteNonQuery(comando);

            }

        }

        // xavier SOL xxxxxx
        /// <summary>
        /// Inclui idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA
        /// </summary>
        public void incluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" insert into CM.CONTRATOXAVALISTA 
             (IDINSCRICAOEMPTMO, IDAVALISTA) 
             values ( 
             :IDINSCRICAOEMPTMO_P, 
             :IDAVALISTA_P ) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDINSCRICAOEMPTMO_P", DbType.Int64, inscricaoPrevidenviaria);
                bancoDeDados.AddInParameter(comando, "IDAVALISTA_P", DbType.Int32, idAvalista);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        // xavier SOL xxxxxx

        // xavier SOL xxxxxx
        /// <summary>
        /// Inclui idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA
        /// </summary>
        public void excluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" delete from CM.CONTRATOXAVALISTA 
             where 
             IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO_P and 
             IDAVALISTA = :IDAVALISTA_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDINSCRICAOEMPTMO_P", DbType.Int64, inscricaoPrevidenviaria);
                bancoDeDados.AddInParameter(comando, "IDAVALISTA_P", DbType.Int32, idAvalista);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        // xavier SOL xxxxxx


        #endregion

        #region Procedures

        //William Moreira da Silva SOL 209315/14752
        /// <summary>
        /// Executa a procedure de atualização diaria
        /// </summary>
        public void executarAtualizacaoDiaria(long numeroContrato, DateTime ultAtualizacao, DateTime dataCondiderar)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.sp_atualiza_diaria"))
            {

                bancoDeDados.AddInParameter(comando, "icontrato", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "itipoemptmo", DbType.Int32, -1);
                bancoDeDados.AddInParameter(comando, "itipocontrato", DbType.Int32, -1);
                bancoDeDados.AddInParameter(comando, "ipatro", DbType.Int32, -1);
                bancoDeDados.AddInParameter(comando, "iplano", DbType.Int32, -1);
                bancoDeDados.AddInParameter(comando, "bestorna", DbType.Int32, 1);
                bancoDeDados.AddInParameter(comando, "batualizasaldo", DbType.Int32, 1);
                bancoDeDados.AddInParameter(comando, "binarquivo", DbType.Int32, -1);
                bancoDeDados.AddInParameter(comando, "bnotinarquivo", DbType.Int32, -1);
                bancoDeDados.AddInParameter(comando, "ddataconsidera", DbType.Date, dataCondiderar);
                bancoDeDados.AddInParameter(comando, "ddatainicial", DbType.Date, DateTime.Today.AddDays(-1));
                bancoDeDados.AddInParameter(comando, "ddatafinal", DbType.Date, ultAtualizacao);
                bancoDeDados.AddInParameter(comando, "iempresa", DbType.Int32, 1);
                bancoDeDados.AddInParameter(comando, "icalculaprov", DbType.Int32, 0);
                bancoDeDados.AddInParameter(comando, "imodulo", DbType.Int32, -1);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }
        //William Moreira da Silva SOL 209315/14752

        /// <summary>
        /// Executa procedure de Ajuste de Saldo
        /// </summary>
        /// <param name="numeroContrato">Número do contrato</param>
        /// <param name="dataAtualiza">Data da atualiza</param>
        /// <param name="saldoDevedor">Saldo devedor</param>
        public void executarAjusteSaldo(long numeroContrato, DateTime dataAtualiza, double saldoDevedor)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.sp_emp_atualizasaldodev"))
            {

                bancoDeDados.AddInParameter(comando, "IIDCONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "DDATAATUALIZA", DbType.DateTime, dataAtualiza);
                bancoDeDados.AddInParameter(comando, "FSALDODEV", DbType.Double, saldoDevedor);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        public List<Contrato> consultarContratosQuitados(long numeroContrato)
        {
            List<Contrato> listContrato = new List<Contrato>();
            string query;
            Contrato contrato;

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

            query = @" SELECT CN.IDCONTRATOEMPTMO,
                             CN.DATACREDITO, 
                             TO_CHAR(CM.PCK_EMPRESTIMO.FN_VALORQUITACAO(CN.IDCONTRATOEMPTMO)) AS VALOR_QUITACAO,
                             TIP.TCEDESCRICAO 
                    FROM CM.CONTRATOEMPTMO CN
                    LEFT JOIN CM.TIPOCONTREMPTMO TIP ON CN.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO
                    WHERE CN.IDCONTRQUITACAO =  :IDCONTRATOEMPTMO_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Double, numeroContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        contrato = new Contrato();
                        contrato.numero = Convert.ToInt64(leitor.GetValue(NUMERO_CONTRATO));
                        contrato.dataCredito = leitor.obterValorData(DATA_CREDITO);
                        contrato.valorQuitado = leitor.obterValorDecimal(VALOR_QUITACAO) != null ? (double?)leitor.obterValorDecimal(VALOR_QUITACAO) : null;
                        contrato.modalidade = leitor.obterString(MODALIDADE);
                        listContrato.Add(contrato);
                    }
                }

                return listContrato;
            }
        }


        public bool VerificarRenegociacaoInadP3(long NumeroContrato)
        {
            string query;

            query = @"SELECT 1
                      FROM cm.descontocampanhaemptmo d
                          JOIN cm.contratoemptmo c ON c.idcontratoemptmo = d.idcontratoemptmo   
                      WHERE c.idcontratoemptmo = :NumeroContrato
                      AND d.tipoproposta = 3";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Int64, NumeroContrato);               

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


        #endregion

        #region Metodos Auxiliares

        //William Moreira da Silva SOL 209315/14752
        /// <summary>
        /// Retorna a ultima data de atualização
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public DateTime diaUltimaAtualizacao(long numeroContrato)
        {
            string query;

            query = @" SELECT MAX(HME.HMEDATAATUALIZA) AS HMEDATAATUALIZA
             FROM HISTMOVEMPTMO HME
             WHERE HME.IDCONTRATOEMPTMO = :NUM_CONTRATO 
             AND NVL(HME.FLGESTORNADO, 0) = 0 ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "NUM_CONTRATO", DbType.Int64, numeroContrato);

                DateTime ultAtualizao = DateTime.Today;

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        ultAtualizao = leitor.obterValorData(0).Value;
                    }
                }

                return ultAtualizao;
            }
        }
        //William Moreira da Silva SOL 209315/14752

        public long obterIdPlanus(string loginUsuario)
        {
            string query;

            query = @" SELECT IDUSUARIO FROM CM.USUARIOSISTEMA WHERE TRIM(UPPER(NOMEUSUARIO)) = :NOMEUSUARIO_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "NOMEUSUARIO_P", DbType.String, loginUsuario.ToUpper());

                long idPlanus = 0;

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        idPlanus = Convert.ToInt64(leitor.GetValue(0));
                    }
                }

                return idPlanus;
            }
        }

        #endregion

        #region Métodos para ObjetoContrato
        //Saulo/FUNCEF
        public Dictionary<string, object> buscaInfoContrato(long numContrato)
        {
            Dictionary<string, object> infoContrato = new Dictionary<string, object>();

            string query;
            //Busca informações básicas do contrato
            #region Query Busca informações contrato
            //Utilizado notação @"" a fim de otimizar o processamento
            query =
    @"SELECT con.idbenef,
         con.idpessoa,
         con.idtipocontremptmo,
         con.dataassinatura,
         con.datacredito,
         con.dataprimparc,
         TO_CHAR(con.txjuros) txjuros,
         TO_CHAR(con.vlrcontrato) vlrcontrato,
         con.numparcelas,
         TO_CHAR(con.vlrparcela) vlrparcela,
         DECODE(con.flgsituacao,
                'A', 'ATIVO',
                'E', 'ENCERRADO',
                'J', 'EM COBRANÇA JURÍDICA',
                'K', 'EM QUITAÇÃO',
                'Q', 'QUITADO',
                'R', 'RENOVADO',
                'C', 'CANCELADO') AS SIT_CONTRATO,
         con.idinscricaoemptmo,
         con.datasituacao,
         con.datacanc,
         TO_CHAR(con.vlrsalbase) vlrsalbase,
         TO_CHAR(con.vlrmargem) vlrmargem,
         con.idresponsavel,
         nvl(con.numparcdesconto,0) AS NUMPARCDESCONTO,
         con.codautoemp,
         con.datainiciosusp,
         con.datafimsusp,
         con.idcontrquitacao,
         con.flgsituacao,
         con.flgformarec,
         con.flgformapag,
         con.idpatro,
         nvl(con.flgexcepcional,0) AS FLGEXCEPCIONAL,
         nvl(con.flginternet,0) AS FLGINTERNET,
         nvl(con.tsemeses,0) AS QTDEMESESSUSP,
         TO_CHAR(con.numprotocolo) numprotocolo,
         nvl(con.flgperdaefetiva,0) AS FLGPERDAEFETIVA,
         tc.tcedescricao || ' (' || NVL(tc.SISTEMA_AMORTIZACAO,'-') || ')' AS tcedescricao,
         te.idtipoemptmo,
         te.desctipoemptmo,
         nvl(con.idtiposuspemptmo,0) AS IDTIPOSUSPEMPTMO,
         TO_CHAR(con.vlrmaxpermit) vlrmaxpermit,
         nvl(con.FLGACORDOJUDICIAL, 0) AS FLGACORDOJUDICIAL,
         con.PROTOCOLOCANCELAMENTO, 
        tc.SISTEMA_AMORTIZACAO, con.PROVISAO_PERDA, con.TRGDTINCLUSAO
FROM CM.CONTRATOEMPTMO con
     JOIN CM.tipocontremptmo tc ON tc.idtipocontremptmo = con.idtipocontremptmo
     JOIN CM.tipoemptmo te ON te.idtipoemptmo = tc.idtipoemptmo
WHERE con.idcontratoemptmo = :NUMCONTRATO";

            //William Moreira da Silva - SOL 224034/17909 - Query modificada
            #endregion
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, numContrato.ToString());

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        infoContrato.Add("IDBENEF", Convert.ToInt32(leitor.GetValue(0)));
                        infoContrato.Add("IDPESSOA", Convert.ToInt32(leitor.GetValue(1)));
                        infoContrato.Add("IDTIPOCONTREMPTMO", Convert.ToInt32(leitor.GetValue(2)));
                        infoContrato.Add("DATAASSINATURA", leitor.obterValorData(3));
                        infoContrato.Add("DATACREDITO", leitor.obterValorData(4));
                        infoContrato.Add("DATAPRIMPARC", leitor.obterValorData(5));
                        infoContrato.Add("TXJUROS", leitor.obterValorDecimal(6) != null ? (double?)leitor.obterValorDecimal(6) : null);
                        infoContrato.Add("VLRCONTRATO", leitor.obterValorDecimal(7) != null ? (double?)leitor.obterValorDecimal(7) : null);
                        infoContrato.Add("NUMPARCELAS", Convert.ToInt32(leitor.GetValue(8)));
                        infoContrato.Add("VLRPARCELA", leitor.obterValorDecimal(9) != null ? (double?)leitor.obterValorDecimal(9) : null);
                        infoContrato.Add("SITCONTRATO", leitor.obterString(10));
                        infoContrato.Add("IDINSCRICAOEMPTMO", Convert.ToInt64(leitor.GetValue(11)));
                        infoContrato.Add("DATACANC", leitor.obterValorData(13));
                        infoContrato.Add("VLRSALBASE", leitor.obterValorDecimal(14) != null ? (double?)leitor.obterValorDecimal(14) : null);
                        infoContrato.Add("VLRMARGEM", leitor.obterValorDecimal(15) != null ? (double?)leitor.obterValorDecimal(15) : null);
                        infoContrato.Add("NUMPARCDESCONTO", Convert.ToInt32(leitor.GetValue(17)));
                        infoContrato.Add("CODAUTOEMP", leitor.GetValue(18) == DBNull.Value ? 0 : Convert.ToInt64(leitor.GetValue(18)));
                        infoContrato.Add("DATAINICIOSUSP", leitor.obterValorData(19));
                        infoContrato.Add("DATAFIMSUSP", leitor.obterValorData(20));
                        infoContrato.Add("IDCONTRQUITACAO", leitor.GetValue(21) == DBNull.Value ? 0 : Convert.ToInt64(leitor.GetValue(21)));
                        infoContrato.Add("FLGSITUACAO", leitor.obterString(22));
                        infoContrato.Add("FLGFORMAREC", leitor.obterString(23));
                        infoContrato.Add("FLGFORMAPAG", leitor.obterString(24));
                        infoContrato.Add("IDPATRO", Convert.ToInt32(leitor.GetValue(25)));
                        infoContrato.Add("FLGEXCEPCIONAL", Convert.ToBoolean(Convert.ToInt32(leitor.GetValue(26))));
                        infoContrato.Add("FLGINTERNET", Convert.ToBoolean(Convert.ToInt32(leitor.GetValue(27))));
                        infoContrato.Add("TSEMESES", Convert.ToInt32(leitor.GetValue(28)));
                        infoContrato.Add("NUMPROTOCOLO", leitor.GetValue(29).ToString());
                        infoContrato.Add("FLGPERDAEFETIVA", Convert.ToBoolean(Convert.ToInt32(leitor.GetValue(30))));
                        infoContrato.Add("TCEDESCRICAO", leitor.obterString(31));
                        infoContrato.Add("IDTIPOEMPTMO", Convert.ToInt32(leitor.GetValue(32)));
                        infoContrato.Add("DESCTIPOEMPTMO", leitor.obterString(33));
                        infoContrato.Add("IDSUSPENSAO", Convert.ToInt32(leitor.GetValue(34)));
                        infoContrato.Add("VLRMAXPERMIT", leitor.obterValorDecimal(35) != null ? (double?)leitor.obterValorDecimal(35) : null);
                        //William Moreira da Silva - SOL 224034/17909
                        infoContrato.Add("FLGACORDOJUDICIAL", Convert.ToInt32(leitor.GetValue(36)));
                        //William Moreira da Silva - SOL 224034/17909
                        infoContrato.Add("PROTOCOLOCRM", leitor.obterString(37));
                        infoContrato.Add("SISTEMA_AMORTIZACAO", leitor.obterString(38));
                        infoContrato.Add("PROVISAO_PERDA", leitor.obterString(39));
                        infoContrato.Add("DATA_INCLUSAO", leitor.obterValorData(40));
                    }
                }

                return infoContrato;
            }
        }

        //Saulo/FUNCEF
        public Dictionary<string, object> buscaInfoFinanceiras(long numContrato)
        {
            Dictionary<string, object> infoFinanceiras = new Dictionary<string, object>();

            string query;
            //Busca informações financeiras de um contrato
            #region Query Busca informações fincanceiras
            //Utilizado notação @"" a fim de otimizar o processamento
            query =
    @"SELECT frp.descricao AS FORMAPAGAMENTO,
       pf_pag.descricao AS PORTADORPAGAMENTO,
       pf_rec.descricao AS PORTADORRECEBIMENTO,
       m.moecodigo,
       m.moedesc,
       m.moesigla
FROM CM.CONTRATOEMPTMO con
     JOIN CM.portadorforma pf_rec ON con.portformarec = pf_rec.codportforma
     JOIN CM.portadorforma pf_pag ON con.portformapag = pf_pag.codportforma
     JOIN CM.formarecpag frp ON con.codformapag = frp.codforma
     JOIN CM.moeda m ON con.moecodigo = m.moecodigo
WHERE con.idcontratoemptmo = :NUMCONTRATO";
            #endregion

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, numContrato.ToString());

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        infoFinanceiras.Add("FORMAPAGAMENTO", leitor.obterString(0));
                        infoFinanceiras.Add("PORTADORPAGAMENTO", leitor.obterString(1));
                        infoFinanceiras.Add("PORTADORRECEBIMENTO", leitor.obterString(2));
                        infoFinanceiras.Add("MOECODIGO", Convert.ToInt32(leitor.GetValue(3)));
                        infoFinanceiras.Add("MOEDESCRICAO", leitor.obterString(4));
                        infoFinanceiras.Add("MOESIGLA", leitor.obterString(5));
                    }
                }
                return infoFinanceiras;
            }
        }

        //Saulo/FUNCEF
        /// <summary>
        /// Busca demais informações de um contrato
        /// </summary>
        /// <param name="numContrato">Identificador do contrato</param>
        public Dictionary<string, object> buscaInfoAdicionais(long numContrato)
        {
            Dictionary<string, object> InfoAdicionais = new Dictionary<string, object>();

            string query;
            //Busca informações financeiras de um contrato
            #region Query Busca informações adicionais
            //Utilizado notação @"" a fim de otimizar o processamento
            query =
    @"SELECT ins.datainsc,
       res.nome AS NOME_RESPONSAVEL,
       (SELECT COUNT(1)
          FROM CM.CONTRATOEMPTMO C
         WHERE C.IDCONTRQUITACAO = CON.IDCONTRATOEMPTMO) AS QTDECONTQUITADO,
       vlrmax.valormax,
       vlrmax.datainicio,
       vlrmax.datafim
FROM CM.CONTRATOEMPTMO con
     JOIN CM.inscricaoemptmo ins ON con.idinscricaoemptmo = ins.idinscricaoemptmo
     LEFT JOIN CM.pessoa res ON res.idpessoa = con.idresponsavel
     LEFT JOIN CM.valormaxprestep vlrmax ON vlrmax.idcontratoemptmo = con.idcontratoemptmo
                                      AND vlrmax.datainicio <= TRUNC(SYSDATE)
                                      AND vlrmax.datafim >= TRUNC(SYSDATE)
WHERE con.idcontratoemptmo = :NUMCONTRATO";
            #endregion

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, numContrato.ToString());

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        InfoAdicionais.Add("DATAINSCRICAO", leitor.obterValorData(0));
                        InfoAdicionais.Add("NOMERESP", Convert.ToString(leitor.GetValue(1)));
                        InfoAdicionais.Add("QTDECONTRATO", Convert.ToInt32(leitor.GetValue(2)));
                        InfoAdicionais.Add("VALORMAXPREST", leitor.obterValorDecimal(3) != null ? (double?)leitor.obterValorDecimal(3) : null);
                        InfoAdicionais.Add("DTINICIOVLRMAX", leitor.obterValorData(4));
                        InfoAdicionais.Add("DTFIMVLRMAX", leitor.obterValorData(5));
                    }
                }

                return InfoAdicionais;
            }
        }

        //Bruno.silva PPM:984370 SOL:255322/17559 - Início
        public int[] buscaTiposExcepcional(long numeroContrato)
        {
            int[] tiposExcepcional;
            tiposExcepcional = new int[5];

            for (int i = 0; i < tiposExcepcional.Length; i++)
            {
                tiposExcepcional[i] = 0;
            }

            string query;
            query =
                @"SELECT * FROM
                CM.CONTRATOEMPTMOXEXCEPCIONAL CXE, CM.GRUPOEXCEPCIONALEMPTMO GRU 
                WHERE CXE.IDCONTRATOEMPTMO = CXE.IDCONTRATOEMPTMO
                AND GRU.IDGRUPOEXCEPCIONAL = CXE.IDGRUPOEXCEPCIONAL
                AND CXE.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);
            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, numeroContrato);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    tiposExcepcional[Convert.ToInt32(leitor.GetValue(0))] = 1;
                }
            }

            return tiposExcepcional;
        } //Bruno.silva PPM:984370 SOL:255322/17559 - FIM

        /// <summary>
        /// Busca informações da suspensão de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <param name="idSuspensao">Identificador da suspensão do contrato</param>
        /// <param name="dataInicio">Data início da suspensão do contrato</param>
        /// <returns>Retorna Dictionary com as informações da suspensão do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoSuspensao(long numContrato, int idSuspensao, DateTime dataInicio)
        {
            Dictionary<string, object> infoSuspensao = new Dictionary<string, object>();

            string query;
            //Busca informações básicas da suspensão
            #region Query Busca informações suspensão
            //Utilizado notação @"" a fim de otimizar o processamento
            query =
    @"SELECT ts.tsedescricao AS DESCRICAO,
       hsc.hsciniciosusp AS DATAINICIO,
       hsc.hscfinalsusp AS DATAFINAL
FROM CM.histsuspcobep hsc
     JOIN CM.tiposuspemptmo ts ON ts.idtiposuspemptmo = hsc.idtiposuspemptmo
WHERE hsc.hsciniciosusp = :DATAINICIO
AND   hsc.idcontratoemptmo = :NUMCONTRATO
AND   hsc.idtiposuspemptmo = :IDSUSPENSAO";
            #endregion

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "DATAINICIO", DbType.DateTime, dataInicio);
                bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, numContrato.ToString());
                bancoDeDados.AddInParameter(comando, "IDSUSPENSAO", DbType.Int32, idSuspensao.ToString());

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        infoSuspensao.Add("DESCRICAO", leitor.obterString(0));
                        infoSuspensao.Add("DATAINICIO", leitor.obterValorData(1)); // SIG 71652 - Marcelo Ferreira - Inclusão do obterValorData 
                        infoSuspensao.Add("DATAFINAL", leitor.obterValorData(2));  // SIG 71652 - Marcelo Ferreira - Inclusão do obterValorData 
                    }
                }

                return infoSuspensao;
            }
        }

        /// <summary>
        /// Busca informações da patrocinadora de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações da patrocinadora do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoPatrocinadora(long numContrato)
        {
            Dictionary<string, object> infoPatrocinadora = new Dictionary<string, object>();

            string query;
            //Busca informações básicas da suspensão
            #region Query Busca informações suspensão
            //Utilizado notação @"" a fim de otimizar o processamento
            query = @"SELECT con.idpatro,
       patro.nome,
       sf.descricao AS SITFUNCIONAL,
       ced.nome AS CEDIDO
FROM CM.CONTRATOEMPTMO con
     JOIN CM.pessoa patro ON patro.idpessoa = con.idpatro
     JOIN CM.elegpatro el ON el.idpessoa = con.idpessoa
     JOIN CM.sitfunc sf ON sf.idsitfunc = el.idsitfunc
     LEFT JOIN CM.pessoa ced ON ced.idpessoa = el.idpessjurcedido
WHERE con.idcontratoemptmo = :NUMCONTRATO";
            #endregion

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);
            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, numContrato.ToString());

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    infoPatrocinadora.Add("IDPATRO", Convert.ToInt32(leitor.GetValue(0)));
                    infoPatrocinadora.Add("NOME", leitor.obterString(1));
                    infoPatrocinadora.Add("SITFUNCIONAL", leitor.obterString(2));
                    infoPatrocinadora.Add("CEDIDO", leitor.GetValue(3).ToString());
                }
            }

            return infoPatrocinadora;
        }

        /// <summary>
        /// Busca informações do plano de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações do plano do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoPlano(long numContrato)
        {
            Dictionary<string, object> infoPlano = new Dictionary<string, object>();

            string query;
            //Busca informações básicas da suspensão
            #region Query Busca informações suspensão
            //Utilizado notação @"" a fim de otimizar o processamento
            query = @"SELECT con.idplanoprev,
       pp.nome AS PLANOPREV,
       con.idplanoorigem,
       ppc.nome AS PLANOCONTABIL,
       spp.descricao AS SITPLANO,
       sp.flginterno
FROM CM.CONTRATOEMPTMO con
     JOIN CM.planprev pp ON pp.idplanoprev = con.idplanoprev
     JOIN CM.planprevcontabil ppc ON ppc.idplanoprev = con.idplanoorigem
     JOIN CM.partprevplan ppp ON ppp.idpessoa = con.idpessoa
     JOIN CM.sitpart sp ON sp.idsitpart = ppp.idsitpart
     JOIN CM.sitplanoprev spp ON spp.idsitplanoprev = ppp.idsitplanoprev
WHERE con.idcontratoemptmo = :NUMCONTRATO
AND   ppp.idplanoprev = CASE
                          WHEN con.idpessoa = con.idbenef THEN con.idplanoprev
                          ELSE (SELECT MAX(ppp2.idplanoprev) 
                                FROM CM.partprevplan ppp2
                                WHERE ppp2.flgdesativado = 0
                                AND   ppp2.idpessoa = ppp.idpessoa
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
                                                                                                                                    AND   ppp2.idsitplanoprev = 25))))))
                        END";
            
            //query utilizada a partir do sig 131967
            query = @"SELECT con.idplanoprev,
                               pp.nome AS PLANOPREV,
                               con.idplanoorigem,
                               ppc.nome AS PLANOCONTABIL,
                               spp.descricao AS SITPLANO,
                               sp.flginterno
                        FROM CM.CONTRATOEMPTMO con
                             JOIN CM.planprev pp ON pp.idplanoprev = con.idplanoprev
                             JOIN CM.planprevcontabil ppc ON ppc.idplanoprev = con.idplanoorigem
                             JOIN CM.partprevplan ppp ON ppp.idpessoa = con.idpessoa
                             JOIN CM.sitpart sp ON sp.idsitpart = ppp.idsitpart
                             JOIN CM.sitplanoprev spp ON spp.idsitplanoprev = ppp.idsitplanoprev
                        WHERE con.idcontratoemptmo = :NUMCONTRATO
                            AND (ppp.idplanoprev =
                                (SELECT MAX(ppp2.idplanoprev)
                                  FROM partprevplan ppp2
                                 WHERE ppp2.flgdesativado = 0
                                   AND ppp2.idpessoa = ppp.idpessoa) OR
                                (PPP.FLGDESATIVADO = 1 
                                AND NOT EXISTS (SELECT 1
			                                    FROM partprevplan ppp1           
			                                    WHERE ppp1.idpessoa = ppp.idpessoa
			                                    AND ppp1.flgdesativado = 0) 
                                                AND (ppp.idsitplanoprev = 25 
                                                      OR (ppp.idplanoprev = (SELECT MAX(ppp1.idplanoprev)
                                                                             FROM partprevplan ppp1
                                                                             WHERE ppp1.idpessoa = ppp.idpessoa
                                                                             AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) =(SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE))
                                                                                                                             FROM partprevplan ppp2
                                                                                                                             WHERE ppp2.idpessoa = ppp1.idpessoa)
              										                         AND NOT EXISTS (SELECT 1
													                                         FROM partprevplan ppp2
													                                         WHERE ppp2.idpessoa = ppp1.idpessoa
													                                         AND ppp2.idsitplanoprev = 25))))))";

            #endregion

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);
            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, numContrato.ToString());

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    infoPlano.Add("IDPLANOPREV", Convert.ToInt32(leitor.GetValue(0)));
                    infoPlano.Add("PLANOPREV", leitor.obterString(1));
                    infoPlano.Add("IDPLANOORIGEM", Convert.ToInt32(leitor.GetValue(2)));
                    infoPlano.Add("PLANOCONTABIL", leitor.obterString(3));
                    infoPlano.Add("SITPLANO", leitor.obterString(4));
                    infoPlano.Add("FLGINTERNO", leitor.obterString(5));
                }
            }

            return infoPlano;
        }

        public void inseriLeiout(LeioutContrato leiout)
        {
            string query;

            //            query = @"  
            //                    INSERT INTO CM.TB_EMP_CONTRATOS
            //                      (ID_TB_EMP_CONTRATOS, IDTIPOCONTREMPTMO, CONTRATO)
            //                    VALUES
            //                      (5, :IDTIPOCONTREMPTMO, :CONTRATO)
            //                    ";

            query = @" UPDATE CM.TB_EMP_CONTRATOS
                       SET CONTRATO = :CONTRATO
                     WHERE IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO
                     ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //bancoDeDados.AddInParameter(comando, "IDTIPOCONTREMPTMO", DbType.Int32, leiout.idContratoEmptmo);
                bancoDeDados.AddInParameter(comando, "CONTRATO", DbType.Binary, leiout.leioutContrato);
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTREMPTMO", DbType.Int32, leiout.idContratoEmptmo);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        public LeioutContrato consultarleiout(int idTipoContratoEmptmo, DateTime? dataInicioVigencia)
        {
            string query;
            LeioutContrato leiout = new LeioutContrato();

            query = @"  
                    SELECT hist.bi_minuta_antiga, 
                           hist.dt_inicio_vigencia, 
                           cont.IdtipoContrEmptmo
                    FROM cm.tb_emp_contratos cont
                         join cm.tb_contrato_historico hist ON cont.id_tb_emp_contratos = hist.id_tb_emp_contratos
                    WHERE cont.IdTipoContrEmptmo = :IDTIPOCONTREMPTMO
                    AND bi_minuta_antiga IS NOT NULL
                    AND hist.dt_inicio_vigencia <= :dataInicioVigencia
                    AND hist.dt_final_vigencia >= :dataInicioVigencia2 
                    AND hist.nu_versao = (select max(nu_versao) 
                                          from cm.tb_contrato_historico c 
                                          where c.id_tb_emp_contratos = cont.id_tb_emp_contratos 
                                          and c.bi_minuta_antiga is not null
                                          and c.dt_inicio_vigencia <= :dataInicioVigencia3
                                          and c.dt_final_vigencia >= :dataInicioVigencia4)";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTREMPTMO", DbType.Int16, idTipoContratoEmptmo);
                bancoDeDados.AddInParameter(comando, "dataInicioVigencia", DbType.Date, dataInicioVigencia);
                bancoDeDados.AddInParameter(comando, "dataInicioVigencia2", DbType.Date, dataInicioVigencia);
                bancoDeDados.AddInParameter(comando, "dataInicioVigencia3", DbType.Date, dataInicioVigencia);
                bancoDeDados.AddInParameter(comando, "dataInicioVigencia4", DbType.Date, dataInicioVigencia);


                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        leiout.idContratoEmptmo = Convert.ToInt32(leitor.GetValue(2));
                        leiout.leioutContrato = leitor.GetValue(0) as Byte[];
                    }
                }

                bancoDeDados.ExecuteNonQuery(comando);

                return leiout;
            }
        }

        //Campanha Desconto
        public LeioutContrato ConsultarLeioutCampanhaDesconto(int idTipoContratoEmptmo)
        {
            string query;
            LeioutContrato leiout = new LeioutContrato();
            int idTipoContrato = 0;

            switch (idTipoContratoEmptmo)
            {
                case 89:
                    idTipoContrato = 12;
                    break;
                case 90:
                    idTipoContrato = 13;
                    break;
            }

            query = @"SELECT * FROM TB_EMP_CONTRATOS 
                      WHERE IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO
                      AND  ID_TB_EMP_CONTRATOS = : idTipoContrato";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTREMPTMO", DbType.Int32, idTipoContratoEmptmo);
                bancoDeDados.AddInParameter(comando, "idTipoContrato", DbType.Int32, idTipoContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        leiout.idContratoEmptmo = leitor.obterInt(1);
                        leiout.leioutContrato = leitor.GetValue(2) as Byte[];
                        leiout.linkPortalFuncef = leitor.obterString(3);
                    }
                }

                bancoDeDados.ExecuteNonQuery(comando);
                return leiout;
            }
        }

        public void IncluirDadosCampanhaDesconto(long numeroContrato, int idItemEmptmo, double percentualDesconto, double ValorNominal, int tipoProposta, int mesAtraso, DateTime dataOperacao, double valorDesconto)
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
                       VALORDESCONTO 
                      )
                    VALUES
                      (:numeroContrato,
                       :idItemEmptmo,
                       :percentualDesconto,
                       :ValorNominal,
                       :tipoProposta,
                       :mesAtraso,                                    
                       :dataOperacao,
                       :valorDesconto
                       ) ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "idItemEmptmo", DbType.Int32, idItemEmptmo);
                bancoDeDados.AddInParameter(comando, "percentualDesconto", DbType.Double, percentualDesconto);
                bancoDeDados.AddInParameter(comando, "ValorNominal", DbType.Double, ValorNominal);
                bancoDeDados.AddInParameter(comando, "tipoProposta", DbType.Int32, tipoProposta);
                bancoDeDados.AddInParameter(comando, "mesAtraso", DbType.Int32, mesAtraso);
                bancoDeDados.AddInParameter(comando, "dataOperacao", DbType.Date, dataOperacao);
                bancoDeDados.AddInParameter(comando, "valorDesconto", DbType.Double, valorDesconto);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        public ContratoDTO BuscarDadosContratoImpressao(long NumeroContrato)
        {
            string query = @"SELECT
     dep.matricula,
     pes.nome,
     LTRIM(pes.numdocumento) AS cpf,
     RG.numdocumento || NVL2(RG.orgao, ' ' || NVL2(DOCUF.codestado, RG.orgao || '/' || DOCUF.codestado, RG.orgao), NULL) AS rg,
     ep.logradouro || NVL2(ep.numero,' ,' || ep.numero, NULL) || NVL2(ep.complemento,' ,' || ep.complemento, NULL) AS logradouro,
     ep.bairro,
     NVL(ci.nome, ep.cidade) AS cidade,
     ci.uf,
     ep.cep,
     SUBSTR(TRIM(REPLACE(REPLACE(telCel.Ddd,'('),')')),LENGTH(TRIM(REPLACE(REPLACE(telCel.Ddd,'('),')')))-1,2) || REPLACE(TRIM(telCel.numero),'-') AS TelCelular,
     SUBSTR(TRIM(REPLACE(REPLACE(telCom.Ddd,'('),')')),LENGTH(TRIM(REPLACE(REPLACE(telCom.Ddd,'('),')')))-1,2) || replace(trim(telCom.numero),'-') AS TelComercial,
     SUBSTR(TRIM(REPLACE(REPLACE(telRes.Ddd,'('),')')),LENGTH(TRIM(REPLACE(REPLACE(telRes.Ddd,'('),')')))-1,2) || REPLACE(trim(telRes.numero),'-') AS TelResidencial,
     SUBSTR(agen.numagencia,1,4) AS agencia,
     SUBSTR(contb.contacorrente,1,3) AS operacao,
     REPLACE(SUBSTR(contb.contacorrente,4,LENGTH(contb.contacorrente)-4),'-') || '-' || SUBSTR(contb.contacorrente,LENGTH(contb.contacorrente),1) AS conta,
     pes.email || NVL2(pes.email, NVL2(pesf.emailfuncef, ', ' || pesf.emailfuncef, NULL), pesf.emailfuncef) AS emails,
     to_char(con.vlrmaxpermit) AS valorMaxPermitido,
     to_char(con.vlrcontrato) AS valorContrato,
     con.idtipocontremptmo AS idTipoContrato,
     con.numparcelas,
     cm.PCK_AA_EMPTMO_CONTRATO.FN_RETORNA_CONTRATOS_QUITADOS (con.idcontratoemptmo) AS contratoQuitaAnterior,
     con.dataCredito,
     con.idcontratoemptmo AS numContrato,
     con.flginternet AS concessaoInternet,
     dep.idPessoa,
     dep.idTitular,
     con.dataassinatura
FROM 
     cm.contratoemptmo con 
     JOIN depentit dep ON con.idbenef = dep.idpessoa AND con.idpessoa = dep.idtitular
     JOIN pessoa pes ON pes.idpessoa = dep.idpessoa
     JOIN pessoafisica pesf ON pesf.idpessoa = dep.idpessoa
     JOIN docpessoa RG ON RG.idpessoa = dep.idpessoa AND RG.iddocumento = 11
     LEFT JOIN estado DOCUF ON DOCUF.idestado = RG.idestado     
     LEFT JOIN contabancaria contb ON contb.idpessoa = dep.idpessoa AND contb.idcbancaria = con.idcbancaria     
     JOIN agenciabancaria agen ON agen.idpessoa = contb.idagencia
     JOIN endpess ep ON ep.idendereco = COALESCE(pes.idendcorresp, pes.idendresidencial, pes.idendcobranca)
     LEFT JOIN cidades ci ON ci.idcidades = ep.idcidades
     JOIN contrpadrxtipocontr cxt ON cxt.idtipocontremptmo = con.idtipocontremptmo
     LEFT JOIN assincontrpadrao acp ON acp.idcontratopadrao = cxt.idcontratopadrao AND TRUNC(acp.acpdataassinat) = TRUNC(con.dataassinatura) AND acp.idbenef = con.idbenef AND acp.idpessoa = con.idpessoa
     LEFT JOIN telendpess telCel ON telCel.idpessoa = dep.idpessoa AND telCel.Tipo LIKE '%L%'
     LEFT JOIN telendpess telCom ON telCom.idpessoa = dep.idpessoa AND telCom.Tipo LIKE '%C%'
     LEFT JOIN telendpess telRes ON telRes.idpessoa = dep.idpessoa AND telRes.Tipo LIKE '%P%'
WHERE
   (telCel.Idtelefone = (SELECT max(t.idtelefone)
                               FROM telendpess t
                              WHERE t.idpessoa = dep.idpessoa
                                AND t.tipo LIKE '%L%') OR
       telCel.Idtelefone IS NULL)
  AND (telCom.Idtelefone = (SELECT max(t.idtelefone)
                               FROM telendpess t
                              WHERE t.idpessoa = dep.idpessoa
                                AND t.tipo LIKE '%C%') OR
       telCom.Idtelefone IS NULL)
  AND (telRes.Idtelefone = (SELECT max(t.idtelefone)
                               FROM telendpess t
                              WHERE t.idpessoa = dep.idpessoa
                                AND t.tipo LIKE '%P%') OR
       telRes.Idtelefone IS NULL)
and con.idcontratoemptmo = :NUMCONTRATO";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "NUMCONTRATO", DbType.Int64, NumeroContrato);

                ContratoDTO contrato = new ContratoDTO(string.Empty);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        contrato.Matricula = leitor.obterString(0);
                        contrato.Nome = leitor.obterString(1);
                        contrato.Cpf = leitor.obterString(2);
                        contrato.Rg = leitor.obterString(3);
                        contrato.Logradouro = leitor.obterString(4);
                        contrato.Bairro = leitor.obterString(5);
                        contrato.Cidade = leitor.obterString(6);
                        contrato.Uf = leitor.obterString(7);
                        contrato.Cep = leitor.obterString(8);
                        contrato.TelCelular = leitor.obterString(9);
                        contrato.TelComercial = leitor.obterString(10);
                        contrato.TelResidencial = leitor.obterString(11);

                        contrato.Agencia = leitor.obterString(12);
                        contrato.Operacao = leitor.obterString(13);
                        contrato.Conta = leitor.obterString(14);
                        contrato.Emails = leitor.obterString(15);
                        contrato.ValorMaxPermitido = leitor.IsDBNull(16) ? 0 : Double.Parse(leitor.obterString(16));
                        contrato.ValorSolicitado = Double.Parse(leitor.obterString(17));

                        contrato.IdTipoContrato = leitor.obterInt(18);
                        contrato.NumParcelas = leitor.obterInt(19);
                        contrato.ContratoQuitaAnterior = leitor.obterString(20);
                        contrato.DataCredito = leitor.obterValorData(21);
                        contrato.NumeroContrato = leitor.obterValorInt64(22);
                        contrato.ConcessaoInternet = leitor.obterValorInteiro(23);
                        contrato.IdPessoa = leitor.obterValorInt64(24);
                        contrato.IdTitular = leitor.obterValorInt64(25);
                        contrato.DataAssinatura = leitor.obterValorData(26);
                    }
                }
                return contrato;
            }
        }

        public List<ItemContrato> ObterItensEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros)
        {
            string query;

            // Consulta
            query = @" SELECT
                    HME.HMETIPOMOV, 
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
               ITE.ITEDESCRICAO,                
               TO_CHAR(SUM(HME.HMEVLRPREVISTO)) HMEVLRPREVISTO
             FROM HISTMOVEMPTMO  HME, 
               TIPOSUSPEMPTMO TSE, 
               ITEMEMPTMO     ITE  
             WHERE  HME.IDCONTRATOEMPTMO   = :NUMEROCONTRATO_P 
               AND 	( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 ) 
               AND 	 HME.HMETIPOMOV   IN  (1, 2, 3, 4, 7) 
               AND HME.FLGBAIXADO       = 0 
               AND HME.HMEVLREFETIVO    IS NULL 
               AND HME.HMEDATAEFETIVA   IS NULL 
               AND NVL(HME.FLGQUITADO, 0)    = 0 
               AND NVL(HME.FLGABONADO, 0)    = 0 
               AND NVL(HME.FLGESTORNADO, 0)  = 0 
               AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR 
                   (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1))
               AND HME.IDITEMEMPTMO          = ITE.IDITEMEMPTMO 
               AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+) 
             GROUP BY ITE.ITEDESCRICAO, HME.HMETIPOMOV";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;

            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query);


            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.String, numeroContrato);

            // Popula objetos resultantes
            List<ItemContrato> itens = new List<ItemContrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    ItemContrato item = new ItemContrato();
                    item.tipoEvento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(HMETIPOMOV_ITENSABERTOS)));
                    item.tipoEvento.descricao = leitor.obterString(EVENTO_ITENSABERTOS);
                    item.competencia = DateTime.MinValue.Date;
                    item.parcela = 0;
                    item.sequencia = 0;
                    item.descricao = leitor.obterString(2);
                    item.dataPrevista = DateTime.MinValue.Date;
                    item.dataVencimento = DateTime.MinValue.Date;
                    item.valor = (double)leitor.obterDecimal(3);
                    item.taxaJuros = null;
                    item.saldoDevedor = null;
                    item.dataEfetiva = null;
                    item.valorEfetivo = null;
                    item.dataCobranca = "";

                    itens.Add(item);
                }
            }

            // Total de Registros
            parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query);

            // Retorna informações
            parametros.prepararRetorno();

            //comando.Connection.Close();
            comando.Dispose();

            // Retorna informações
            return itens;
        }


        //SIG 48294
        public List<Contrato> BuscarContratosParaCancelamento(Contrato contrato, ref ParametrosConsulta parametros)
        {
            string query;

            bool buscarNumero = contrato.numero > 0;
            bool buscarSituacao = contrato.idSituacao != null && contrato.idSituacao != "0";
            bool buscarMatricula = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.matricula);
            bool buscarCPF = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.cpf);
            bool buscarNome = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.nome);
            // bool buscarSuspensao = contrato.suspensao != null && contrato.suspensao.tipo != null && contrato.suspensao.tipo.id > 0;

            // Consulta
            query = @" SELECT 
                           CON.IDCONTRATOEMPTMO,
                           CON.FLGSITUACAO, 
                           DECODE(CON.FLGSITUACAO,
                               'A', 'ATIVO',
                               'E', 'ENCERRADO',
                               'J', 'EM COBRANÇA JURÍDICA',
                               'K', 'EM QUITAÇÃO',
                               'Q', 'QUITADO',
                               'R', 'RENOVADO',
                               'C', 'CANCELADO') AS SITUACAO,
                           PDP.NOME, 
                           DEP.MATRICULA, 
                           TCE.TCEDESCRICAO, 
                           CON.DATAASSINATURA, 
                           CON.DATACREDITO, 
                           TSE.TSEDESCRICAO, 
                           TEP.DESCTIPOEMPTMO, 
                           PLP.NOME AS NOME_PLANO, 
                           PPA.NOME AS PATROCINADORA, 
                           CON.IDINSCRICAOEMPTMO, 
                           PDP.NUMDOCUMENTO AS CPF, 
                           CON.IDTIPOCONTREMPTMO, 
                           SPP.DESCRICAO AS SIT_PLANO, 
                           TEP.IDTIPOEMPTMO, 
                           PDP.IDPESSOA                          
                        FROM 
                           CM.PESSOA          PDP, 
                           CM.PESSOA          PEP, 
                           CM.PESSOA          PPA, 
                           CM.DEPENTIT        DEP, 
                           CM.ELEGPATRO       ELP, 
                           CM.PARTPREVPLAN    PPP, 
                           CM.PLANPREV        PLP, 
                           CM.SITPART         SIP, 
                           CM.SITPLANOPREV    SPP, 
                           CM.CONTRATOEMPTMO  CON, 
                           CM.TIPOCONTREMPTMO TCE, 
                           CM.TIPOEMPTMO      TEP, 
                           CM.INSCRICAOEMPTMO INS,  
                           HISTMOVEMPTMO      HME,
                           CM.TIPOSUSPEMPTMO  TSE
                        WHERE 
                               ELP.IDPESSOA          = PEP.IDPESSOA 
                           AND ELP.IDPESSJUR         = PPA.IDPESSOA 
                           AND ELP.IDPESSJUR         = PPP.IDPESSJUR 
                           AND ELP.IDPESSOA          = PPP.IDPESSOA 
                           AND ELP.IDPESSOA          = DEP.IDTITULAR 
                           AND DEP.IDPESSOA          = PDP.IDPESSOA 
                           AND CON.IDPLANOPREV       = PLP.IDPLANOPREV 
                           AND PPP.IDSITPART         = SIP.IDSITPART 
                           AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV 
                           AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO 
                           AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO  
                           AND CON.IDBENEF           = PDP.IDPESSOA 
                           AND CON.IDPESSOA          = PEP.IDPESSOA 
                           AND CON.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO (+) 
                           AND CON.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO 
                                  AND (ppp.idplanoprev = 
                                (SELECT MAX(ppp2.idplanoprev) 
                                  FROM partprevplan ppp2 
                                 WHERE ppp2.flgdesativado = 0 
                                   AND ppp2.idpessoa = ppp.idpessoa) OR 
                                (PPP.FLGDESATIVADO = 1 AND NOT EXISTS 
                                (SELECT 1 
                                   FROM partprevplan ppp1 
                                  WHERE ppp1.idpessoa = ppp.idpessoa 
                                    AND ppp1.flgdesativado = 0) AND 
                                (ppp.idsitplanoprev = 25 OR 
                                (ppp.idplanoprev = 
                                (SELECT MAX(ppp1.idplanoprev)
                                     FROM partprevplan ppp1 
                                    WHERE ppp1.idpessoa = ppp.idpessoa 
                                      AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = 
                                          (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) 
                                             FROM partprevplan ppp2 
                                            WHERE ppp2.idpessoa = ppp1.idpessoa) 
                                      AND NOT EXISTS (SELECT 1 
                                             FROM partprevplan ppp2 
                                            WHERE ppp2.idpessoa = ppp1.idpessoa 
                                              AND ppp2.idsitplanoprev = 25)))))) 
                        AND CON.FLGSITUACAO       = 'A' 
                        AND (HME.FLGBAIXADO       = 0 OR HME.HMEVLREFETIVO = 0) 
                        AND HME.HMETIPOMOV        = 0 
                        AND HME.HMECENTRALIZA     = 1 
                        AND ((HME.HMEVLREFETIVO   IS NULL AND HME.HMEDATAEFETIVA IS NULL) OR HME.HMEVLREFETIVO = 0) 
                        AND ((HME.FLGESTORNADO    IS NULL)  OR (HME.FLGESTORNADO   = 0)) 
                        AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO 
                     ";

            // Filtros
            if (buscarMatricula)
                query = query + $@" AND  DEP.MATRICULA = '{contrato.mutuario.matricula}'";
            if (buscarNumero)
                query = query + $@" AND  CON.IDCONTRATOEMPTMO = '{contrato.numero.ToString()}'";
            if (buscarCPF)
                query = query + $@" AND  PDP.NUMDOCUMENTO = '{contrato.mutuario.cpf}'";
            if (buscarNome)
                query = query + $@" AND  PDP.NOME LIKE '{contrato.mutuario.nome.ToUpper()}' || '%' ";

            query = query + @" ORDER BY DECODE(CON.FLGSITUACAO, 'A', 'A', 'K', 'B', 'E', 'C', 'Q', 'D', 'C', 'Z', 'Y'), CON.DATACREDITO DESC  ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.obterComandoPorSql(UtilidadesAcessoDados.obterQueryPaginada(query, parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.obterComandoPorSql(query);

            // Popula objetos resultantes
            List<Contrato> contratos = new List<Contrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Contrato item = new Contrato()
                    {
                        numero = Convert.ToInt64(leitor.GetValue(IDCONTRATOEMPTMO_PESQUISAR)),
                        idSituacao = leitor.obterString(SITUACAO_PESQUISAR),
                        dataAssinatura = leitor.obterValorData(DATAASSINATURA_PESQUISAR),
                        dataCredito = leitor.obterValorData(DATACREDITO_PESQUISAR),
                        tipo = new TipoContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOCONTREMPTMO_PESQUISAR)),
                            descricao = leitor.obterString(TCEDESCRICAO_PESQUISAR)
                        },
                        mutuario = new Mutuario()
                        {
                            matricula = leitor.obterString(MATRICULA_PESQUISAR),
                            nome = leitor.obterString(NOME_PESQUISAR),
                            cpf = leitor.obterString(CPF_PESQUISAR),
                            idTitular= leitor.obterInt(17),
                            IdPessoa = leitor.obterInt(17)
                        },
                        tipoEmprestimo = new TipoEmprestimo()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOEMPTMO_PESQUISAR)),
                            descricao = leitor.obterString(DESCTIPOEMPTMO_PESQUISAR)
                        },
                        plano = new PlanoPrevidenciario()
                        {
                            descricao = leitor.obterString(NOME_PLANO_PESQUISAR),
                            situacao = leitor.obterString(SIT_PLANO_PESQUISAR)
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            nome = leitor.obterString(PATROCINADORA_PESQUISAR)
                        }
                    };

                    contratos.Add(item);
                }
            }

            // Total de Regristros
            parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query.ToString());

            // Retorna informações
            parametros.prepararRetorno();

            comando.Connection.Close();
            comando.Dispose();

            return contratos;
        }

        //SIG 48294
        public void CancelarContrato(long NumeroContrato, string ProtocoloCRM)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.CONTRATOEMPTMO CON 
                       SET  CON.FLGSITUACAO = :situacao, 
                            CON.DATACANC = :dataCancelamento,
                            CON.PROTOCOLOCANCELAMENTO = :protocoloCancelamento
                       WHERE CON.IDCONTRATOEMPTMO = :NumeroContrato ";

            using (DbCommand cmd = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(cmd, "situacao", DbType.String, "C");
                bancoDeDados.AddInParameter(cmd, "dataCancelamento", DbType.DateTime, DateTime.Today);
                bancoDeDados.AddInParameter(cmd, "protocoloCancelamento", DbType.String, ProtocoloCRM);
                bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);
                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }

        //SIG 48294
        public void CancelarInscricao(long IdInscricaoContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.INSCRICAOEMPTMO 
                       SET
                          FLGSITUACAO = :situacao,
                          DATACANCINSC = :dataCancelamento                          
                       WHERE IDINSCRICAOEMPTMO = :inscricaoContrato";

            using (DbCommand cmd = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(cmd, "situacao", DbType.String, "C");
                bancoDeDados.AddInParameter(cmd, "dataCancelamento", DbType.DateTime, DateTime.Today);
                bancoDeDados.AddInParameter(cmd, "inscricaoContrato", DbType.Int64, IdInscricaoContrato);

                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }

        //SIG 48294
        public void CancelarConcessao(long NumeroContrato, string UsuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            int idUsuarioLogado = (int)this.obterIdPlanus(UsuarioLogado);
            string query;

            query = @" UPDATE CM.HMECONCESSAO 
                       SET FLGESTORNADO = 1, 
	                        DATAESTORNO = DATAPREVISTA, 
	                        DATAESTORNOALT = :dataEstorno, 
	                        IDUSUARIOESTORNO = :UsuarioEstorno
                        WHERE IDCONTRATOEMPTMO = :NumeroContrato";

            using (DbCommand cmd = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(cmd, "dataEstorno", DbType.DateTime, DateTime.Now);
                bancoDeDados.AddInParameter(cmd, "UsuarioEstorno", DbType.Int32, idUsuarioLogado);
                bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);

                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }

        //SIG 48294
        public void EstornarAtualizacaoSaldo(long NumeroContrato, string UsuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();            
            int idUsuarioLogado = (int)this.obterIdPlanus(UsuarioLogado);
            string query;

            query = @" UPDATE CM.HMEATUDIARIA
                       SET
                         FLGESTORNADO = 1,
                         DATAESTORNOALT = SYSDATE,
                         DATAESTORNO = DATAPREVISTA,
                         IDUSUARIOESTORNO = :UsuarioEstorno
                       WHERE IDCONTRATOEMPTMO = :NumeroContrato                        
                         AND NVL(FLGESTORNADO,0) = 0";

            using (DbCommand cmd = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(cmd, "UsuarioEstorno", DbType.Int32, idUsuarioLogado);
                bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);                
                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }
        
        //SIG 48294
        public void EstornarConcesssao(long NumeroContrato, string UsuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            int idUsuarioLogado = (int)this.obterIdPlanus(UsuarioLogado);
            string query;

            query = @" UPDATE CM.HISTMOVEMPTMO
                       SET
                         FLGESTORNADO = 1,
                         HMEDATAESTORNOALT = SYSDATE,
                         HMEDATAESTORNO = TRUNC(SYSDATE),
                         IDUSUARIOESTORNO = :UsuarioEstorno
                       WHERE IDCONTRATOEMPTMO = :NumeroContrato 
                         AND HMETIPOMOV = 0";

            using (DbCommand cmd = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(cmd, "UsuarioEstorno", DbType.Int32, idUsuarioLogado);
                bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);                
                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }

        //SIG 48294
        public void DesfazerQuitacaoContrato(long NumeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.HISTMOVEMPTMO HME
                       SET
                          HME.FLGQUITADO = 0,
                          HME.HMEDATAQUITABONO = NULL,
                          HME.IDUSUARIOESTORNO = NULL
                       WHERE  HME.IDCONTRATOEMPTMO = :NumeroContrato
                          AND ((null  IS NULL) OR (HME.HMEDATAQUITABONO = null))
                          AND HME.HMETIPOMOV <> 3
                          AND HME.FLGBAIXADO = 0
                          AND HME.FLGQUITADO = 1
                          AND (HME.FLGESTORNADO = 0) OR (HME.FLGESTORNADO IS NULL)
                          AND (HME.FLGABONADO   = 0) OR (HME.FLGABONADO IS NULL)
                          AND (HME.HMECENTRALIZA = 1) OR (HME.HMEDESTACADO = 1)";

            using (DbCommand cmd = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);                
                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }

        //SIG 48294
        public void EstornarQuitacaoContratos(long NumeroContrato, string UsuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            int idUsuarioLogado = (int)this.obterIdPlanus(UsuarioLogado);
            string query;

            query = @"UPDATE CM.HMEQUITACAO
                      SET  
                        FLGESTORNADO = 1,                                              
                        IDUSUARIOESTORNO = :UsuarioEstorno, 
                        DATAESTORNOALT = SYSDATE,                                           
                        DATAESTORNO = TRUNC(SYSDATE) 
                      WHERE IDCONTRATOEMPTMO = :NumeroContrato
                        AND DATAPREVISTA = (SELECT MAX(DATAPREVISTA)
                                              FROM HMEQUITACAO WHERE IDCONTRATOEMPTMO = :NumeroContrato_)"; //TAES - SIG93932

            using (DbCommand cmd = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(cmd, "UsuarioEstorno", DbType.Int32, idUsuarioLogado);
                bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);
                bancoDeDados.AddInParameter(cmd, "NumeroContrato_", DbType.Int64, NumeroContrato); //TAES - SIG93932
                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }

        //SIG 48294
        public void ReativarContratosQuitados(long NumeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @"UPDATE CM.CONTRATOEMPTMO 
                      SET 
                        FLGSITUACAO = 'A',
                        DATACANC    = NULL,
                        IDCONTRQUITACAO = NULL 
                      WHERE IDCONTRQUITACAO = :NumeroContrato
                        AND NOT EXISTS (SELECT 1 FROM HMEQUITACAO WHERE IDCONTRATOEMPTMO = :NumeroContrato_ AND FLGESTORNADO = 0)"; //TAES - SIG93932

            using (DbCommand cmd = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);
                bancoDeDados.AddInParameter(cmd, "NumeroContrato_", DbType.Int64, NumeroContrato); //TAES - SIG93932
                bancoDeDados.ExecuteNonQuery(cmd);
            }
        }

        //SIG 48294
        public void IncluirLogOpcao(long NumeroContrato, string UsuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            int idUsuarioLogado = (int)this.obterIdPlanus(UsuarioLogado);
            string query;

            query = @" INSERT INTO CM.LOGOPCAO 
                       (IDLOGOPCAO, NOMEOPCAO, IDUSUARIO, IDPESSOA, IDMODULO, DATALOG) 
                       VALUES 
                       (SEQLOGOPCAO.NEXTVAL, :NOMEOPCAO, :IDUSUARIO, :IDPESSOA, :IDMODULO, TRUNC(SYSDATE))";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "NOMEOPCAO", DbType.String, "Cancelamento da concessão do Contrato " + NumeroContrato);
                bancoDeDados.AddInParameter(comando, "IDUSUARIO", DbType.Int32, idUsuarioLogado);
                bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int32, 1);
                bancoDeDados.AddInParameter(comando, "IDMODULO", DbType.Int32, 15);
                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        //SIG 48294
        public bool VerificarDocumentoBaixado(long NumeroContrato)
        {
            string query;

            query = @" SELECT 1
                        FROM CM.HISTMOVEMPTMO HST, 
                             CM.LANCTODOCUM LANC
                        WHERE HST.IDCONTRATOEMPTMO = :NumeroContrato
                        AND HST.CODDOCUMENTO = LANC.CODDOCUMENTO
                        AND LANC.OPERACAO IN (2, 5)"; //TAES - SIG93932

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Int64, NumeroContrato);                

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

        //SIG 48294
        public bool VerificaExistenciaPrestacoes(long NumeroContrato)
        {
            string query;

            query = @" SELECT 1
                        FROM CM.hmeprestacao                             
                        WHERE IdContratoEmptmo = :NumeroContrato
                        AND IdItemEmptmo IN (13,99)";
            
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Int64, NumeroContrato);

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

        //SIG 63057
        public void GravarContrato(long NumeroContrato, string ContratoHTML)
        {
            try
            {
                Database bancoDeDados = this.obterBancoDeDados();
                var update = @"UPDATE CM.CONTRATOEMPTMO 
                                                    SET TX_CONTRATO = :contrato
                               WHERE IDCONTRATOEMPTMO = :idContrato ";

                //using (DbCommand cmd = bancoDeDados.obterComandoPorSql(update))
                //{
                //    bancoDeDados.AddInParameter(cmd, "contrato",   DbType.String, ContratoHTML);
                //    bancoDeDados.AddInParameter(cmd, "idContrato", DbType.Int64, NumeroContrato);                    

                //    bancoDeDados.ExecuteNonQuery(cmd);
                //}

                string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(conexaoOracle))
                {
                    using (OracleCommand cmd = new OracleCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = update;

                        cmd.Parameters.Add("contrato", OracleDbType.NClob).Value = ContratoHTML;
                        cmd.Parameters.Add("idContrato", OracleDbType.Int64).Value = NumeroContrato;
                      

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();                        
                    }
                }


            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível gerar o contrato de empréstimo. Por gentileza entre em contato com a FUNCEF.");
            }
        }

        //SIG 94266
        public void AlterarItensSuspensao(HistoricoSuspensao Suspensao)
        {
            try
            {
                Database bancoDeDados = this.obterBancoDeDados();
                var update = $@"UPDATE hmeprestacao h
		                            SET h.idtiposuspemptmo = {Suspensao.tipoSuspensao.id}
                            WHERE h.idcontratoemptmo = {Suspensao.contrato.numero}   
                            AND   h.vlrefetivo IS NULL
                            --AND   h.idtiposuspemptmo IS NULL
                            AND   h.origem = 1
                            AND   h.flgquitabonoestorno = 0
                            AND   1 = (SELECT itc.flgsuspenso --indica se o item pode ser suspenso
                                     FROM itemxtipocontr itc
                                          JOIN contratoemptmo c ON c.idtipocontremptmo = itc.idtipocontremptmo
                                     WHERE c.idcontratoemptmo = h.idcontratoemptmo
                                     AND   itc.iditememptmo = h.iditememptmo)
                            AND   h.naturezaitem = CASE (SELECT t.flgsuspensaoitem --Indica quais itens devem ser suspensos: [{0} Todos | {1} Centralizadores e Internos | {2} Destacados]
                                                       FROM tiposuspemptmo t
                                                       WHERE t.idtiposuspemptmo = {Suspensao.tipoSuspensao.id})
                                                   WHEN 0 THEN h.naturezaitem --todos os itens
                                                   WHEN 1 THEN decode(h.naturezaitem, 0, 0, 2, 2, -1) --somente centralizadores e internos
                                                   WHEN 2 THEN 1 --somente destacados
                                                   ELSE -1 --nenhum item
                                                 END";

                using (DbCommand cmd = bancoDeDados.obterComandoPorSql(update))
                { 
                    bancoDeDados.ExecuteNonQuery(cmd);
                }
            }
            catch(Exception ex)
            {               
                throw new Exception("Não foi possível marcar os itens como suspensos.");
            }
        }   

        public string ObterAmbienteBancoDados()
        {
            string retorno = string.Empty;

            try
            {
                Database bancoDeDados = this.obterBancoDeDados();
                string [] array = bancoDeDados.ConnectionString.ToLower().Split(';');
                if (array[1].Contains("source"))
                {
                    retorno = array[1].Replace("data source=", "").Trim();
                }

                retorno = (retorno == "rprod" ? "Produção" : retorno);
            }
            catch (Exception)
            {            
            }
            return retorno;
        }   

        public List<ItemContrato> ObterItensEmAbertoAgrupadosComData(long numeroContrato)
        {
            string query;

           // Consulta
           query = $@"SELECT
                        HME.HMETIPOMOV, 
                        DECODE(HME.HMETIPOMOV,
                        0, 'Concessão/Renovação',
                        1, 'Prestação ',
                        2, 'Amortização/Refinanciamento',
                        3, 'Quitação',
                        4, 'Atualização de Débito',
                        5, 'Atualização de Saldo (Diária)',
                        6, 'Importação/Migração',
                        7, 'Ajustes (Cobrança/Devolução)',
                        8, 'Ajustes (Saldo Devedor)'
                        ) AS EVENTO,
                        ITE.ITEDESCRICAO,
                        TO_CHAR(SUM(HME.HMEVLRPREVISTO)) HMEVLRPREVISTO,
                        (SELECT MIN(HMEDATAPREVISTA) FROM HISTMOVEMPTMO WHERE IDCONTRATOEMPTMO = {numeroContrato} AND HMEPARCELA = HME.HMEPARCELA) AS DATAPREVISTA,
                         (SELECT MIN(HMEDATAVENCTO) FROM HISTMOVEMPTMO WHERE IDCONTRATOEMPTMO = {numeroContrato}  AND HMEPARCELA = HME.HMEPARCELA) AS DATAVENCTO,
                        HME.HMEPARCELA,
                        HME.HMENUMPARCELAS,
                        ITE.IDITEMEMPTMO
                 FROM HISTMOVEMPTMO HME,
                   TIPOSUSPEMPTMO TSE, 
                   ITEMEMPTMO ITE
                 WHERE HME.IDCONTRATOEMPTMO = {numeroContrato} 
                   AND(HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)
                   AND HME.HMETIPOMOV IN(1, 2, 3, 4, 7) 
                   AND HME.FLGBAIXADO = 0
                   AND HME.HMEVLREFETIVO IS NULL
                   AND HME.HMEDATAEFETIVA IS NULL
                   AND NVL(HME.FLGQUITADO, 0) = 0
                   AND NVL(HME.FLGABONADO, 0)    = 0
                   AND NVL(HME.FLGESTORNADO, 0)  = 0
                   AND(NVL(HME.FLGSUSPENSAO, 0) = 0 OR
                       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1))
                   AND HME.IDITEMEMPTMO = ITE.IDITEMEMPTMO
                   AND HME.IDTIPOSUSPEMPTMO = TSE.IDTIPOSUSPEMPTMO(+)             
                 GROUP BY ITE.ITEDESCRICAO, HME.HMETIPOMOV,
		                  HME.HMEPARCELA, HME.HMENUMPARCELAS,
                          ITE.IDITEMEMPTMO
                 ORDER BY HME.HMEPARCELA, ITE.IDITEMEMPTMO";           

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            comando = bancoDeDados.GetSqlStringCommand(query);

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
            List<ItemContrato> itens = new List<ItemContrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    ItemContrato item = new ItemContrato();
                    item.tipoEvento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(HMETIPOMOV_ITENSABERTOS)));
                    item.tipoEvento.descricao = leitor.obterString(EVENTO_ITENSABERTOS);
                    item.competencia = DateTime.MinValue.Date;
                    item.descricao = leitor.obterString(2);
                    item.valor = (double)leitor.obterDecimal(3);
                    item.dataPrevista = (DateTime)leitor.obterValorData(4);
                    item.dataVencimento = (DateTime)leitor.obterValorData(5);
                    item.parcela = (int)leitor.obterValorInteiro(6);
                    item.numeroParcelas = (int)leitor.obterValorInteiro(7);
                    item.id = (int)leitor.obterValorInteiro(8);

                    itens.Add(item);
                }
            }
       
            comando.Dispose();
            return itens;
        }

        public List<ItemContrato> obterItensEmAberto(long NumeroContrato, int NumeroParcela)
        {
            string query;

            // Consulta
            query = $@" SELECT HME.HMETIPOMOV, 
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
               TO_CHAR(HME.HMEMESCOMPETENCIA, '00') || '/' || HME.HMEANOCOMPETENCIA AS ANOMESCOMP, 
               HME.HMEPARCELA, 
               HME.HMESEQCOBRANCA, 
               ITE.ITEDESCRICAO, 
               HME.HMEDATAPREVISTA, 
               HME.HMEDATAVENCTO, 
               TO_CHAR(HME.HMEVLRPREVISTO), 
               TO_CHAR(HME.HMETXJUROS), 
               TO_CHAR(HME.HMESALDODEV),  
               HME.HMEDATAEFETIVA, 
               TO_CHAR(HME.HMEVLREFETIVO), 
               TO_CHAR(HME.HMEMESCOBRANCA, '00') || '/' || HME.HMEANOCOBRANCA AS ANOMESCOBR,
               HME.HMENUMPARCELAS,
               ITE.IDITEMEMPTMO
             FROM HISTMOVEMPTMO  HME, 
               CM.TIPOSUSPEMPTMO TSE, 
               CM.ITEMEMPTMO     ITE  
             WHERE  HME.IDCONTRATOEMPTMO   = :numeroContrato
               AND  HME.HMEPARCELA = :numeroPacela
               AND HME.IDITEMEMPTMO IN (13, 99)
               AND 	( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 ) 
               AND 	 HME.HMETIPOMOV   IN  (1, 2, 3, 4, 7) 
               AND HME.FLGBAIXADO       = 0 
               AND HME.HMEVLREFETIVO    IS NULL 
               AND HME.HMEDATAEFETIVA   IS NULL 
               AND NVL(HME.FLGQUITADO, 0)    = 0 
               AND NVL(HME.FLGABONADO, 0)    = 0 
               AND NVL(HME.FLGESTORNADO, 0)  = 0 
               AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR 
                   (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1))
               AND HME.IDITEMEMPTMO          = ITE.IDITEMEMPTMO 
               AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+) 
             ORDER BY HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand cmd;
            cmd = bancoDeDados.GetSqlStringCommand(query);

            bancoDeDados.AddInParameter(cmd, "numeroContrato", DbType.Int64, NumeroContrato);
            bancoDeDados.AddInParameter(cmd, "numeroPacela", DbType.Int32, NumeroParcela);

            using (DbCommand comando = cmd)
            {
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
                        item.dataPrevista = leitor.GetDateTime(HMEDATAPREVISTA_ITENSABERTOS);
                        item.dataVencimento = leitor.GetDateTime(HMEDATAVENCTO_ITENSABERTOS);
                        item.valor = (double)leitor.obterDecimal(HMEVLRPREVISTO_ITENSABERTOS);
                        item.taxaJuros = leitor.obterValorDecimal(HMETXJUROS_ITENSABERTOS) != null ? (double?)leitor.obterValorDecimal(HMETXJUROS_ITENSABERTOS) : null;
                        item.saldoDevedor = leitor.obterValorDecimal(HMESALDODEV_ITENSABERTOS) != null ? (double?)leitor.obterValorDecimal(HMESALDODEV_ITENSABERTOS) : null;
                        item.dataEfetiva = leitor.obterValorData(HMEDATAEFETIVA_ITENSABERTOS);
                        item.valorEfetivo = leitor.obterValorInteiro(HMEVLREFETIVO_ITENSABERTOS);
                        item.dataCobranca = leitor.obterString(ANOMESCOBR_ITENSABERTOS);
                        item.numeroParcelas = (int)leitor.obterValorInteiro(16);
                        item.id = (int)leitor.obterValorInteiro(17);

                        itens.Add(item);
                    }
                }   

                // Retorna informações
                return itens;
            }
        }

        public EmptmoDocFinanceiroDTO EnviarBoletoBancario(long NumeroContrato, int NumeroParcela, DateTime DataVencimento, int TipoMovimento)
        {
            EmptmoDocFinanceiroDTO docFinanceiroDTO = new EmptmoDocFinanceiroDTO();

            try
            {
                string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(conexaoOracle))
                {
                    using (OracleCommand cmd = new OracleCommand())
                    {
                        cmd.Connection = conn;
                        conn.Open();

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "cm.PCK_AA_EMPTMO_FINANCEIRO.pr_realiza_envio_boleto";

                        cmd.Parameters.Add("pidcontratoemptmo", OracleDbType.Double).Value = NumeroContrato;
                        cmd.Parameters.Add("pdatavencto", OracleDbType.Date).Value = DataVencimento;
                        cmd.Parameters.Add("ptipomov", OracleDbType.Double).Value = TipoMovimento;
                        cmd.Parameters.Add("pnumparcela", OracleDbType.Double).Value = NumeroParcela;

                        cmd.Parameters.Add("pvlrdocumento", OracleDbType.Double).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("pportforma", OracleDbType.Double).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("pcoddocumento", OracleDbType.Double).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("perro", OracleDbType.NVarchar2, UInt16.MaxValue).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("perrcode", OracleDbType.NVarchar2, UInt16.MaxValue).Direction = ParameterDirection.Output;

                        cmd.ExecuteNonQuery();

                        docFinanceiroDTO.portadorForma = Convert.ToInt32(cmd.Parameters["pportforma"].Value);
                        docFinanceiroDTO.numDocumento = Convert.ToDouble(cmd.Parameters["pvlrdocumento"].Value);
                        docFinanceiroDTO.valorDocumento = Convert.ToDouble(cmd.Parameters["pcoddocumento"].Value);
                        docFinanceiroDTO.msgErro = cmd.Parameters["perro"].Value.ToString().Equals("null") ? String.Empty : cmd.Parameters["perro"].Value.ToString();                                    
                        docFinanceiroDTO.codErro  = cmd.Parameters["perrcode"].Value.ToString().Equals("null") ? String.Empty : cmd.Parameters["perrcode"].Value.ToString();
                    }
                }
            }
            catch (Exception ex)
            {                
                throw ex;
            }
            return docFinanceiroDTO;
        }

        public string VerificarMesRefParcela(long NumeroContrato, int NumeroParcela)
        {
            string retorno = string.Empty;
            string query = @"SELECT 
                                to_char(hp.dataprevista,'YYYYMM')
                            FROM cm.hmeprestacao hp
                            WHERE hp.idcontratoemptmo = :numContrato
                            AND   hp.origem = 1
                            AND   hp.naturezaitem = 2
                            AND   hp.iditememptmo = 13
                            AND   hp.parcela = :numPacela";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            comando = bancoDeDados.GetSqlStringCommand(query);  

            bancoDeDados.AddInParameter(comando, "numContrato", DbType.Int64, NumeroContrato);
            bancoDeDados.AddInParameter(comando, "numPacela", DbType.Int32, NumeroParcela);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    retorno = leitor.obterString(0);
                }     
            }
            return retorno;
        }


        public void SalvarMinutasContratosAntigos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao)
        {

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;

            if (modContrato.IdMinutaHistorico == 0)
                operacao = "I";

            try
            {

                int NuVersaoMinuta = BuscarVersaoMinutaContratoAntigo(modContrato.idTipoContratoEmptmo, (DateTime)modContrato.DataInicioVigencia, (DateTime)modContrato.DataFimVigencia);
                //operacao == I -> inserir | A -> alterar | E -> excluir 
                string query = "";
                //if (operacao == "I")
                //{
                    int IdContratoHistorico = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "CM.SEQ_CONTRATO_HISTORICO");

                    query = @"INSERT INTO CM.TB_CONTRATO_HISTORICO 
                            (ID_CONTRATO_HISTORICO,
                             ID_TB_EMP_CONTRATOS, 
                             TX_CONTRATO, 
                             DT_INCLUSAO, 
                             ID_USUARIO_INCLUSAO, 
                             DT_PUBLICACAO, 
                             ID_USUARIO_PUBLICACAO, 
                             DT_INICIO_VIGENCIA, 
                             BI_MINUTA_ANTIGA,
                             NU_VERSAO,
                             DT_FINAL_VIGENCIA)
                             VALUES (
                                    :IdContratoHistorico,
                                    (select max(id_tb_emp_contratos) 
                                     from cm.tb_emp_contratos
                                     where idtipocontremptmo = :IdTipoContrato),
                                    :txContratos,
                                    SYSDATE,
                                    :idUsuarioInclusao1,
                                    SYSDATE,
                                    :idUsuarioInclusao2,
                                    :DataInicioVigencia,
                                    :MinutaContrato,
                                    :NuVersaoMinuta,
                                    :DataFinalVigencia
                                    )";

                    comando = bancoDeDados.GetSqlStringCommand(query); 

                    bancoDeDados.AddInParameter(comando, "IdContratoHistorico", DbType.Int32, IdContratoHistorico);
                    bancoDeDados.AddInParameter(comando, "IdTipoContrato", DbType.Int32, modContrato.idTipoContratoEmptmo);
                    //bancoDeDados.AddInParameter(comando, "idtbEmpContrato", DbType.Int32, modContrato.idtbEmpContrato);
                    bancoDeDados.AddInParameter(comando, "txContratos", DbType.String, "<Minuta contratos antigos>");
                    bancoDeDados.AddInParameter(comando, "idUsuarioInclusao1", DbType.String, modContrato.IdUsuario);
                    bancoDeDados.AddInParameter(comando, "idUsuarioInclusao2", DbType.String, modContrato.IdUsuario);
                    bancoDeDados.AddInParameter(comando, "DataInicioVigencia", DbType.DateTime, modContrato.DataInicioVigencia);
                    bancoDeDados.AddInParameter(comando, "MinutaContrato", DbType.Binary, leiaute.leioutContrato);
                    //bancoDeDados.AddInParameter(comando, "DataInicioVigencia2", DbType.DateTime, modContrato.DataInicioVigencia);
                    //bancoDeDados.AddInParameter(comando, "IdTipoContrato2", DbType.Int32, modContrato.idTipoContratoEmptmo);                    
                    bancoDeDados.AddInParameter(comando, "NuVersaoMinuta", DbType.Int32, NuVersaoMinuta);
                    bancoDeDados.AddInParameter(comando, "DataFinalVigencia", DbType.DateTime, modContrato.DataFimVigencia);
              
                bancoDeDados.ExecuteNonQuery(comando);
                //}              
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public LeioutContrato BuscarMinutaContratoAntigo(int idTipoContratoEmptmo)
        {
            string query;
            LeioutContrato leiout = new LeioutContrato();

            query = @"  
                    SELECT * FROM CM.TB_EMP_CONTRATOS WHERE IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO
                    ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTREMPTMO", DbType.Int32, idTipoContratoEmptmo);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        leiout.idContratoEmptmo = Convert.ToInt32(leitor.GetValue(1));
                        leiout.leioutContrato = leitor.GetValue(2) as Byte[];
                    }
                }

                bancoDeDados.ExecuteNonQuery(comando);

                return leiout;
            }
        }

        public int BuscarVersaoMinutaContratoAntigo(int IdTipoContrato, DateTime DataInicioVigencia, DateTime DataFinalVigencia)
        {
            int NuVersaoMinuta = 0;

            string query = @"  
                            select max(nvl(nu_versao,0)) +1
                            from cm.tb_contrato_historico 
                            where bi_minuta_antiga is not null
                            and dt_inicio_vigencia = :DataInicioVigencia
                            and dt_final_vigencia = :DataFinalVigencia
                            and id_tb_emp_contratos = (select max(id_tb_emp_contratos) 
                                                        from cm.tb_emp_contratos
                                                        where idtipocontremptmo = :IdTipoContrato2)";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                bancoDeDados.AddInParameter(comando, "DataInicioVigencia", DbType.Date, DataInicioVigencia);
                bancoDeDados.AddInParameter(comando, "DataFinalVigencia", DbType.Date, DataFinalVigencia);
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTREMPTMO", DbType.Int32, IdTipoContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {                        
                        NuVersaoMinuta = leitor.obterInt(0);
                    }
                }

                //bancoDeDados.ExecuteNonQuery(comando);

                return NuVersaoMinuta;
            }
        }

        public RelatorioContrato BuscarDadosContratosAutoAtendimento(long NumeroContrato)
        {
            RelatorioContrato emptmo = new RelatorioContrato();

            try
            {
                #region SQL
                var query = @"SELECT d.matricula,
                                       p.nome,
                                       LTRIM(p.numdocumento) AS CPF,
                                       RG.numdocumento || NVL2(RG.orgao, ' ' || NVL2(DOCUF.codestado, RG.orgao || '/' || DOCUF.codestado, RG.orgao), NULL) AS RG,
                                       ep.logradouro || NVL2(ep.numero,' ,' || ep.numero, NULL) || NVL2(ep.complemento,' ,' || ep.complemento, NULL) AS ENDERECO,
                                       ep.bairro,
                                       ci.nome AS CIDADE,
                                       ci.uf,
                                       ep.cep,
                                       SUBSTR(TRIM(REPLACE(REPLACE(telCel.Ddd,'('),')')),LENGTH(TRIM(REPLACE(REPLACE(telCel.Ddd,'('),')')))-1,2) || REPLACE(TRIM(telCel.numero),'-') AS TELCEL,
                                       SUBSTR(TRIM(REPLACE(REPLACE(telCom.Ddd,'('),')')),LENGTH(TRIM(REPLACE(REPLACE(telCom.Ddd,'('),')')))-1,2) || replace(trim(telCom.numero),'-') AS TELCOM,
                                       SUBSTR(TRIM(REPLACE(REPLACE(telRes.Ddd,'('),')')),LENGTH(TRIM(REPLACE(REPLACE(telRes.Ddd,'('),')')))-1,2) || REPLACE(trim(telRes.numero),'-') AS TELRES,
                                       SUBSTR(ab.numagencia,1,4) AS AGENCIA,
                                       SUBSTR(cb.contacorrente,1,3) AS OPERACAO,
                                       REPLACE(SUBSTR(cb.contacorrente,4,LENGTH(cb.contacorrente)-4),'-') || '-' || SUBSTR(cb.contacorrente,LENGTH(cb.contacorrente),1) AS CONTA,
                                       p.email || NVL2(p.email, NVL2(pf.emailfuncef, '; ' || pf.emailfuncef, NULL), pf.emailfuncef) AS EMAILS,
                                       ce.vlrmaxpermit,
                                       ce.vlrcontrato,
                                       acp.numcomprova, 
                                       CAST(CAST(acp.datahoracarimbotempo AT TIME ZONE acp.timezone_contratacao AS TIMESTAMP) AS DATE) AS DATAHORACARIMBOTEMPO,
                                       ce.idtipocontremptmo,
                                       acp.hashassinatura,
                                       ce.numparcelas, 
                                       cm.PCK_AA_EMPTMO_CONTRATO.FN_RETORNA_CONTRATOS_QUITADOS (:numeroContrato)  as contrQuitAnt,
                                       ce.datacredito,
                                       ce.dataassinatura
                                FROM CM.DADOSCONTRATOEMPTMO c
                                     JOIN cm.contratoemptmo ce ON c.idcontratoemptmo = ce.idcontratoemptmo
                                     JOIN cm.depentit d ON ce.idbenef = d.idpessoa AND ce.idpessoa = d.idtitular
                                     JOIN cm.pessoa p ON p.idpessoa = d.idpessoa
                                     JOIN cm.pessoafisica pf ON pf.idpessoa = d.idpessoa
                                     JOIN cm.docpessoa RG ON RG.idpessoa = d.idpessoa
                                                       AND RG.iddocumento = 11
                                     LEFT JOIN cm.estado DOCUF ON DOCUF.idestado = RG.idestado
                                     JOIN cm.contabancaria cb ON cb.idpessoa = d.idpessoa AND cb.idcbancaria = c.idcbancaria
                                     JOIN cm.agenciabancaria ab ON ab.idpessoa = cb.idagencia
                                     JOIN cm.endpess ep ON ep.idendereco = COALESCE(p.idendcorresp,p.idendresidencial,p.idendcobranca)
                                     JOIN cm.cidades ci ON ci.idcidades = ep.idcidades
                                     JOIN cm.contrpadrxtipocontr cxt on cxt.idtipocontremptmo = ce.idtipocontremptmo
                                     JOIN cm.assincontrpadrao acp on acp.idcontratopadrao = cxt.idcontratopadrao and trunc(acp.acpdataassinat) = trunc(ce.dataassinatura) AND acp.idbenef = ce.idbenef and acp.idpessoa = ce.idpessoa                                     
                                     LEFT JOIN cm.telendpess telCel ON telCel.idpessoa = d.idpessoa
                                                                 AND telCel.Tipo LIKE '%L%'
                                     LEFT JOIN cm.telendpess telCom ON telCom.idpessoa = d.idpessoa
                                                                 AND telCom.Tipo LIKE '%C%'
                                     LEFT JOIN cm.telendpess telRes ON telRes.idpessoa = d.idpessoa
                                                                 AND telRes.Tipo LIKE '%P%'
                                WHERE c.idcontratoemptmo = :numeroContrato2  
                                  --AND  d.idpessoa = :idPessoa
                                  --AND  d.idtitular = :idTitular
                                --AND  c.idcontratoemptmo = :numeroContrato2
                                  AND (telCel.Idtelefone = (SELECT max(t.idtelefone)
                                                               FROM cm.telendpess t
                                                              WHERE t.idpessoa = d.idpessoa
                                                                AND t.tipo LIKE '%L%') OR
                                       telCel.Idtelefone IS NULL)
                                  AND (telCom.Idtelefone = (SELECT max(t.idtelefone)
                                                               FROM cm.telendpess t
                                                              WHERE t.idpessoa = d.idpessoa
                                                                AND t.tipo LIKE '%C%') OR
                                       telCom.Idtelefone IS NULL)
                                  AND (telRes.Idtelefone = (SELECT max(t.idtelefone)
                                                               FROM cm.telendpess t
                                                              WHERE t.idpessoa = d.idpessoa
                                                                AND t.tipo LIKE '%P%') OR
                                       telRes.Idtelefone IS NULL)";
                #endregion

                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    //bancoDeDados.AddInParameter(comando, "idPessoa", DbType.Date, DataInicioVigencia);
                    //bancoDeDados.AddInParameter(comando, "idTitular", DbType.Date, DataFinalVigencia);
                    bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, NumeroContrato);
                    bancoDeDados.AddInParameter(comando, "numeroContrato2", DbType.Int64, NumeroContrato);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read())
                        {
                            //if (result.Count > 0)
                            //{
                                emptmo.numeroContrato = NumeroContrato;
                                emptmo.mutuario = new Mutuario()
                                {
                                    matricula = leitor.GetValue(0) == DBNull.Value ? "-" : leitor.obterString(0),
                                    nome = leitor.obterString(1),
                                    cpf = leitor.GetValue(2) == DBNull.Value ? "-" : leitor.obterString(2),
                                    RG = leitor.GetValue(3) == DBNull.Value ? "-" : leitor.obterString(3),
                                    Email = leitor.GetValue(5) == DBNull.Value ? "" : leitor.obterString(15)
                                };

           
                            emptmo.logradouro = leitor.GetValue(4) == DBNull.Value ? "-" : leitor.obterString(4);
                            emptmo.bairro = leitor.GetValue(5) == DBNull.Value ? "-" : leitor.obterString(5);
                            emptmo.cidade = leitor.GetValue(6) == DBNull.Value ? new Cidade() { nome = " - " } : new Cidade() { nome = leitor.obterString(6) };
                            emptmo.uf = leitor.GetValue(7) == DBNull.Value ? new UF() { idEstado = 0, nome = " - " } : new UF() { idEstado = 0, nome = leitor.obterString(5) };
                            emptmo.cep = leitor.GetValue(8) == DBNull.Value ? "-" : leitor.obterString(8);                       
                           

                            //emptmo.Telefone = new List<TelefonePessoaDTO>();

                            emptmo.numeroCelular = leitor.GetValue(9) == DBNull.Value ? "" : leitor.obterString(9);
                            emptmo.numeroComercial = leitor.GetValue(10) == DBNull.Value ? "" : leitor.obterString(10);
                            emptmo.numero = leitor.GetValue(11) == DBNull.Value ? "" : leitor.obterString(11);

                            //SUBSTR(TRIM(REPLACE(REPLACE(telCel.Ddd, '('), ')')), LENGTH(TRIM(REPLACE(REPLACE(telCel.Ddd, '('), ')'))) - 1, 2) || REPLACE(TRIM(telCel.numero), '-') AS TELCEL,
                            //SUBSTR(TRIM(REPLACE(REPLACE(telCom.Ddd, '('), ')')), LENGTH(TRIM(REPLACE(REPLACE(telCom.Ddd, '('), ')'))) - 1, 2) || replace(trim(telCom.numero), '-') AS TELCOM,
                            //SUBSTR(TRIM(REPLACE(REPLACE(telRes.Ddd, '('), ')')), LENGTH(TRIM(REPLACE(REPLACE(telRes.Ddd, '('), ')'))) - 1, 2) || REPLACE(trim(telRes.numero), '-') AS TELRES,

                                emptmo.conta = new DadosBancarios()
                                {
                                    agencia = leitor.GetValue(12) == DBNull.Value ? "-" : leitor.obterString(12),
                                    operacao = leitor.GetValue(13) == DBNull.Value ? "-" : leitor.obterString(13),
                                    contaCorrente = leitor.GetValue(14) == DBNull.Value ? "-" : leitor.obterString(14)
                                };

                                emptmo.Carimbo = new CarimboDTO()
                                {
                                    IDCarimbo = leitor.obterString(18),
                                    DataHoraUTC = leitor.obterString(19),
                                    Codigo_Hash = leitor.obterString(21)
                                }; 

                                emptmo.valorMaximo = leitor.GetValue(16) == DBNull.Value ? 0 : (double)leitor.obterValorDecimal(16).Value;
                                emptmo.valorSolicitado = leitor.GetValue(17) == DBNull.Value ? 0 : (double)leitor.obterValorDecimal(17).Value;
                                emptmo.tipoContrato = leitor.GetValue(20) == DBNull.Value ? new TipoContrato() : new TipoContrato(){ id = leitor.obterInt(20) };
                                emptmo.prazo = leitor.GetValue(22) == DBNull.Value ? 0 : (int) leitor.obterInt(22);
                                emptmo.contratosQuitados = leitor.GetValue(23) == DBNull.Value ? "" : leitor.obterString(23);
                                emptmo.DataCredito = leitor.GetValue(24) == DBNull.Value ? (DateTime?)null : leitor.obterValorData(24);
                                emptmo.dataAssinatura = (DateTime)leitor.obterValorData(25);
                            //emptmo.TaxasJuros = ObterTaxasJuros(emptmo.TipoContrato);
                            //emptmo.TaxasFGQC = ObterTaxasFGQC();
                            //emptmo.TaxaADM = ObterTaxaADM();

                        }
                    }
                }

                //qry.SetParameter("idPessoa", this.SessaoUsuario.UltimoPerfilUsado.IdPessoa);
                //qry.SetParameter("idTitular", this.SessaoUsuario.UltimoPerfilUsado.IdTitular);
                //qry.SetParameter("numeroContrato", numeroContrato);
                //var result = qry.List<object[]>().ToList();               


                return emptmo;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<ModeloContratoEmp> ConsultarModelosContratosSemMinuta(int IdMinutaContrato)
        {
            List<ModeloContratoEmp> modelo = new List<ModeloContratoEmp>();

            // Consulta
            string query = @"SELECT T.ID_TB_EMP_CONTRATOS,
                                    T.IDTIPOCONTREMPTMO,  
                                    --T.CONTRATO,           
                                    T.LINK_PORTAL_FUNCEF, 
                                    T.TRGDTINCLUSAO,      
                                    -- TO_CHAR(TO_DATE(T.TRGDTINCLUSAO), 'DD/MM/YYYY') AS TRGDTINCLUSAO,
                                    T.TRGUSERINCLUSAO,    
                                    TC.TCEDESCRICAO,
                                    hist.dt_inicio_vigencia,
                                    hist.id_contrato_historico,
                                    hist.nu_versao,
                                    hist.dt_final_vigencia
                                FROM CM.TB_EMP_CONTRATOS T   
                                INNER JOIN cm.TIPOCONTREMPTMO TC ON T.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO 
                                LEFT JOIN cm.tb_contrato_historico hist ON t.id_tb_emp_contratos = hist.id_tb_emp_contratos
                                WHERE hist.ID_CONTRATO_HISTORICO = :IdMinutaContrato ";                                                                                                                             

            //if (!String.IsNullOrEmpty(tipocontrato))
            //    query = string.Concat(query, " WHERE T.IDTIPOCONTREMPTMO = :pIDTIPOCONTREMPTMO ");

            //if (DataInicioVigencia != null)
            //    query = string.Concat(query, " AND hist.dt_inicio_vigencia = :DataInicioVigencia");

            query = string.Concat(query, " order by hist.nu_versao desc, hist.dt_inicio_vigencia desc ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);

            //if (!String.IsNullOrEmpty(tipocontrato))
            //    bancoDeDados.AddInParameter(comando, "pIDTIPOCONTREMPTMO", DbType.String, tipocontrato);

            //if (DataInicioVigencia != null)
            //    bancoDeDados.AddInParameter(comando, "DataInicioVigencia", DbType.Date, DataInicioVigencia);

            bancoDeDados.AddInParameter(comando, "IdMinutaContrato", DbType.Int16, IdMinutaContrato);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {    

                while (leitor.Read())
                {
                    DateTime? data = null;
                    if (leitor.GetValue(leitor.GetOrdinal("dt_inicio_vigencia")) != DBNull.Value)
                        data = leitor.obterValorData(leitor.GetOrdinal("dt_inicio_vigencia")).GetValueOrDefault();
                    modelo.Add(new ModeloContratoEmp()
                    {
                        idtbEmpContrato = leitor.obterInt(leitor.GetOrdinal("ID_TB_EMP_CONTRATOS")),
                        idTipoContratoEmptmo = leitor.obterInt(leitor.GetOrdinal("IDTIPOCONTREMPTMO")),
                        tipoContrEmptmo = leitor.obterString(leitor.GetOrdinal("TCEDESCRICAO")),
                        link = leitor.obterString(leitor.GetOrdinal("LINK_PORTAL_FUNCEF")),
                        dataInclusao = leitor.obterValorData(leitor.GetOrdinal("TRGDTINCLUSAO")).GetValueOrDefault(),
                        usuarioInclusao = leitor.obterString(leitor.GetOrdinal("TRGUSERINCLUSAO")),
                        DataInicioVigencia = data,
                        IdMinutaHistorico = leitor.obterInt(leitor.GetOrdinal("id_contrato_historico")),
                        NuVersaoMinuta = leitor.obterInt(leitor.GetOrdinal("nu_versao")),
                        DataFimVigencia = leitor.GetValue(9) == DBNull.Value ? (DateTime?)null : leitor.obterValorData(leitor.GetOrdinal("dt_final_vigencia")).GetValueOrDefault()

                    });
                };
            }

            //// Total de Regristros
            //parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            //parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query);

            //// Retorna informações
            //parametros.prepararRetorno();

            comando.Connection.Close();
            comando.Dispose();

            return modelo;
        }

        #endregion
    }
}







