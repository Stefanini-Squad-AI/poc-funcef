/*
Pendência   : 201769
Kintana     : 1950540
Responsável : Marcio Sanches Spinosa SOL 201769 Kintana 1950540
Data        : 04/03/2013
Descrição   : Ajuste no metodo obterSaldoDevedor, onde é passado a data de amortização,
mas esta utilizando dentro do metodo a data de atualização.
 */

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
using System.Reflection;
using FUNCEF.Planus.Componentes;

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

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> consultarAtivos(Contrato contrato, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            bool buscarNumero = contrato.numero > 0;
            bool buscarMatricula = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.matricula);
            bool buscarCPF = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.cpf);
            bool buscarNome = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.nome);

            // Consulta
            query.Append("SELECT CON.IDCONTRATOEMPTMO, ");
            query.Append("       CON.DATAASSINATURA, ");
            query.Append("       TCE.IDTIPOCONTREMPTMO, ");
            query.Append("       TCE.TCEDESCRICAO, ");
            query.Append("       DEP.MATRICULA, ");
            query.Append("       PDP.NOME, ");
            query.Append("       PDP.NUMDOCUMENTO, ");
            query.Append("       CON.DATACREDITO, ");
            query.Append("       SIP.DESCRICAO AS SIT_PART, ");
            query.Append("       SPP.DESCRICAO AS SIT_PLANO, ");
            query.Append("       PPA.NOME AS NOME_PATRO, ");
            query.Append("       PPP.INSCRICAONUMERO AS INSCRICAO_PREV, ");
            query.Append("       PLP.NOME AS NOME_PLANO, ");
            query.Append("       TPE.DESCTIPOEMPTMO, ");
            query.Append("       DEP.IDTITULAR "); //HELEN BIANCHI - ADD CAMPO CONFORME EMAIL
            query.Append("  FROM PESSOA          PDP, ");
            query.Append("       PESSOA          PPA, ");
            query.Append("       DEPENTIT        DEP, ");
            query.Append("       PARTPREVPLAN    PPP, ");
            query.Append("       PLANPREV        PLP, ");
            query.Append("       SITPART         SIP, ");
            query.Append("       SITPLANOPREV    SPP, ");
            query.Append("       CONTRATOEMPTMO  CON, ");
            query.Append("       TIPOCONTREMPTMO TCE, ");
            query.Append("       TIPOEMPTMO      TPE ");
            query.Append(" WHERE CON.IDPATRO = PPA.IDPESSOA ");
            query.Append("   AND CON.IDBENEF = PDP.IDPESSOA ");
            query.Append("   AND CON.IDPESSOA = DEP.IDTITULAR ");
            query.Append("   AND CON.IDBENEF = DEP.IDPESSOA  ");
            query.Append("   AND DEP.IDTITULAR = PPP.IDPESSOA ");
            query.Append("   AND PPP.IDSITPART = SIP.IDSITPART ");
            query.Append("   AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ");
            query.Append("   AND CON.IDPLANOPREV = PLP.IDPLANOPREV ");
            query.Append("   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO ");
            query.Append("   AND TPE.IDTIPOEMPTMO = TCE.IDTIPOEMPTMO ");
            query.Append("   AND PPP.FLGDESATIVADO = 0 ");//William Moreira da Silva SOL 209315/14772 KINTANA 2028658
            //Retirado, pois o problema só acontecia na TST, provavelmente era problema de base
            query.Append("   AND CON.FLGSITUACAO NOT IN ('C', 'K', 'Q') ");

            // Filtros
            if (buscarMatricula)
                query.Append("   AND DEP.MATRICULA LIKE :MATRICULA_P ");
            if (buscarNumero)
                query.Append("   AND CON.IDCONTRATOEMPTMO LIKE :NUMERO_P || '%' ");
            if (buscarCPF)
                query.Append("   AND PDP.NUMDOCUMENTO LIKE :CPF_P || '%' ");
            if (buscarNome)
                query.Append("   AND PDP.NOME LIKE :NOME_P || '%' ");

            // Ordenação
            query.Append(this.obterQueryOrdenacao("CON", "DATAASSINATURA DESC", parametros));

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        numero = leitor.GetInt64(IDCONTRATOEMPTMO_ATIVOS),
                        dataAssinatura = leitor.GetDateTime(DATAASSINATURA_ATIVOS),
                        dataCredito = leitor.GetDateTime(DATACREDITO_ATIVOS),
                        tipo = new TipoContrato()
                        {
                            id = leitor.GetInt32(IDTIPOCONTREMPTMO_ATIVOS),
                            descricao = leitor.GetString(TCEDESCRICAO_ATIVOS)
                        },
                        mutuario = new Mutuario()
                        {
                            matricula = leitor.GetString(MATRICULA_ATIVOS),
                            nome = leitor.GetString(NOME_ATIVOS),
                            cpf = leitor.GetString(NUMDOCUMENTO_ATIVOS),
                            situacao = leitor.GetString(SIT_PARTICIPANTE_ATIVOS),
                            inscricaoPrevidenciaria = leitor.GetInt64(INSCRICAO_PREVIDENCIARIA_ATIVOS),
                            idTitular = leitor.GetInt32(IDTITULAR_ATIVOS)//HELEN BIANCHI - ADD CAMPO CONFORME EMAIL
                        },
                        plano = new PlanoPrevidenciario()
                        {
                            situacao = leitor.GetString(SIT_PLANO_ATIVOS),
                            descricao = leitor.GetString(NOME_PLANO_ATIVOS)
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            nome = leitor.GetString(NOME_PATRO_ATIVOS)
                        },
                        tipoEmprestimo = new TipoEmprestimo()
                        {
                            descricao = leitor.GetString(DESCTIPOEMPTMO_ATIVOS)
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
            return contratos;
        }

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultar(long numero)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT CON.IDBENEF, ");
            query.Append("       CON.IDCONTRATOEMPTMO AS CONTRATO, ");
            query.Append("       PES.NOME AS MUTUARIO, ");
            query.Append("       DEP.MATRICULA, ");
            query.Append("       PES.NUMDOCUMENTO AS CPF, ");
            query.Append("       SIP.DESCRICAO AS SIT_PARTICIPANTE, ");
            query.Append("       PPA.NOME AS PATROCINADORA, ");
            query.Append("       PLP.NOME AS PLANO_PREVIDENCIARIO, ");
            query.Append("       TPE.DESCTIPOEMPTMO AS TIPO_EMPRESTIMO, ");
            query.Append("       CON.IDTIPOCONTREMPTMO, ");
            query.Append("       TPC.TCEDESCRICAO AS TIPO_CONTRATO, ");
            query.Append("       MOE.MOESIGLA AS INDEXADOR, ");
            query.Append("       CON.DATAASSINATURA, ");
            query.Append("       CON.DATACREDITO, ");
            query.Append("       CON.DATAPRIMPARC, ");
            query.Append("       CON.TXJUROS, ");
            query.Append("       CON.VLRCONTRATO, ");
            query.Append("       CON.NUMPARCELAS, ");
            query.Append("       CON.VLRPARCELA, ");
            //query.Append("       PEF.DATAMORTE, ");
            //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
            query.Append("  DECODE((SELECT DOC.DATAEMISSAO ");
            query.Append("  FROM DOCPESSOA DOC ");
            query.Append("  INNER JOIN PARAMEMPTMO PAR ");
            query.Append("  ON PAR.IDDOCUMENTO = DOC.IDDOCUMENTO ");
            query.Append("  WHERE DOC.IDPESSOA = CON.IDBENEF), ");
            query.Append(" NULL, PEF.DATAMORTE, ");
            query.Append(" (SELECT DOC.DATAEMISSAO ");
            query.Append(" FROM DOCPESSOA DOC ");
            query.Append(" INNER JOIN PARAMEMPTMO PAR ");
            query.Append("  ON PAR.IDDOCUMENTO = DOC.IDDOCUMENTO ");
            query.Append(" WHERE DOC.IDPESSOA = CON.IDBENEF)) AS DATAMORTE, ");
            //marcio sanches spinosa sol 199356 kintana 1931062 - Fim
            query.Append("       CON.IDBENEF, ");
            query.Append("       DECODE(CON.FLGSITUACAO, ");
            query.Append("          'A','ATIVO', ");
            query.Append("          'E','ENCERRADO', ");
            query.Append("          'J','EM COBRANÇA JURÍDICA', ");
            query.Append("          'K','EM QUITAÇÃO', ");
            query.Append("          'Q','QUITADO', ");
            query.Append("          'R','RENOVADO', ");
            query.Append("          'C','CANCELADO') AS SIT_CONTRATO, ");
            query.Append("       CON.IDINSCRICAOEMPTMO, ");
            query.Append("       CON.DATASITUACAO, ");
            query.Append("       CON.DATACANC, ");
            query.Append("       CON.VLRSALBASE, ");
            query.Append("       CON.VLRMARGEM, ");
            query.Append("       SPP.DESCRICAO AS SIT_PLANO, ");
            query.Append("       PPP.INSCRICAONUMERO AS INSC_PREVIDENCIARIA, ");
            query.Append("       INS.DATAINSC AS DATA_SOLICITACAO, ");
            query.Append("       SFU.DESCRICAO AS SITUACAO_FUN, ");
            query.Append("       PPC.NOME      AS PLANOORIGEM, ");
            query.Append("       CON.IDRESPONSAVEL, ");
            query.Append("       NVL(CON.NUMPARCDESCONTO, 0) AS NUMPARCDESCONTO, ");
            query.Append("       CON.CODAUTOEMP, ");
            query.Append("       TSE.TSEDESCRICAO AS DESC_SUSPENCAO, ");
            query.Append("       CON.DATAINICIOSUSP, ");
            query.Append("       CON.DATAFIMSUSP, ");
            query.Append("       RES.NOME AS NOMERESPONSAVEL, ");
            query.Append("       CED.NOME AS CEDIDO, ");
            query.Append("       CON.IDCONTRQUITACAO, ");
            query.Append("       FRP.DESCRICAO AS FORMA_PGTO_CRE, ");
            query.Append("       PTF_PAG.DESCRICAO AS CONTA_CAIXA, ");
            query.Append("       PTF_REC.DESCRICAO AS FORMA_PGTO_DEB, ");
            query.Append("       CON.FLGSITUACAO, ");
            query.Append("       CON.FLGFORMAREC, ");
            query.Append("       CON.FLGFORMAPAG, ");
            query.Append("       CON.IDPATRO, ");
            query.Append("       PLP.IDPLANOPREV, ");
            query.Append("       TPE.IDTIPOEMPTMO, ");
            query.Append("       NVL(CON.FLGEXCEPCIONAL,0) FLGEXCEPCIONAL, ");
            query.Append("       NVL(CON.FLGINTERNET,0) FLGINTERNET, ");
            query.Append("       DEP.IDTITULAR, "); //HELEN BIANCHI - ADD CAMPO CONFORME EMAIL
            query.Append("       NVL(CON.TSEMESES, 0) AS QTDEMESSUSP, ");
            query.Append("       (SELECT COUNT(1) FROM CONTRATOEMPTMO WHERE IDCONTRQUITACAO = CON.IDCONTRATOEMPTMO) AS QTDECONTQUITADO, ");
            query.Append("       NVL(CON.VLRMAXPERMIT, 0) AS VLRMAXPERMIT, ");
            query.Append("       NVL(VLR.VALORMAX, 0) AS VALORMAXPRESTACAO, ");
            query.Append("       SIP.FLGINTERNO, "); //NILTON
            query.Append("       CON.NUMPROTOCOLO, ");//William Moreira da Silva
            query.Append("       VLR.DATAINICIO,  ");
            query.Append("       VLR.DATAFIM,  ");
            query.Append("       NVL(CON.FLGPERDAEFETIVA,0) FLGPERDAEFETIVA, ");
            //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
            query.Append("  DECODE((SELECT DOC.DATAEMISSAO ");
            query.Append("  FROM DOCPESSOA DOC ");
            query.Append("  INNER JOIN PARAMEMPTMO PAR ");
            query.Append("  ON PAR.IDDOCUMENTO = DOC.IDDOCUMENTO ");
            query.Append("  WHERE DOC.IDPESSOA = CON.IDBENEF), ");
            query.Append(" NULL, 0, 1) ISDOCUMENTOOBITO, ");
            query.Append(" (SELECT IDDOCUMENTO FROM PARAMEMPTMO) AS IDDOCUMENTO ");
            //marcio sanches spinosa sol 199356 kintana 1931062 - Fim
            query.Append("  FROM CONTRATOEMPTMO   CON, ");
            query.Append("       PESSOA           PES, ");
            query.Append("       DEPENTIT         DEP, ");
            query.Append("       ELEGPATRO        ELP, ");
            query.Append("       PATRO            PAT, ");
            query.Append("       PESSOA           PPA, ");
            query.Append("       TIPOCONTREMPTMO  TPC, ");
            query.Append("       MOEDA            MOE, ");
            query.Append("       TIPOEMPTMO       TPE, ");
            query.Append("       PLANPREV         PLP, ");
            query.Append("       PARTPREVPLAN     PPP, ");
            query.Append("       SITPART          SIP, ");
            query.Append("       PESSOAFISICA     PEF, ");
            query.Append("       SITPLANOPREV     SPP, ");
            query.Append("       SITFUNC          SFU, ");
            query.Append("       PLANPREVCONTABIL PPC, ");
            query.Append("       INSCRICAOEMPTMO  INS, ");
            query.Append("       TIPOSUSPEMPTMO   TSE, ");
            query.Append("       PESSOA           RES, ");
            query.Append("       PESSOA           CED, ");
            query.Append("       FORMARECPAG      FRP, ");
            query.Append("       PORTADORFORMA PTF_PAG, ");
            query.Append("       PORTADORFORMA PTF_REC, ");
            query.Append("       VALORMAXPRESTEP VLR ");
            query.Append(" WHERE CON.IDBENEF = PES.IDPESSOA ");
            query.Append("   AND CON.IDPESSOA = DEP.IDTITULAR ");
            query.Append("   AND CON.IDBENEF = DEP.IDPESSOA ");
            query.Append("   AND CON.IDPESSOA = ELP.IDPESSOA ");
            query.Append("   AND CON.IDTIPOCONTREMPTMO = TPC.IDTIPOCONTREMPTMO ");
            query.Append("   AND CON.IDPLANOPREV = PLP.IDPLANOPREV ");
            query.Append("   AND CON.MOECODIGO = MOE.MOECODIGO ");
            query.Append("   AND CON.IDPATRO = PAT.IDPESSOA ");
            query.Append("   AND PAT.IDPESSOA = PPA.IDPESSOA ");
            query.Append("   AND TPC.IDTIPOEMPTMO = TPE.IDTIPOEMPTMO ");
            query.Append("   AND ELP.IDPESSOA = PPP.IDPESSOA ");
            query.Append("   AND PPP.IDSITPART = SIP.IDSITPART ");
            query.Append("   AND CON.IDBENEF = PEF.IDPESSOA (+) ");
            query.Append("   AND PPP.IDSITPLANOPREV     = SPP.IDSITPLANOPREV ");
            query.Append("   AND CON.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO(+) ");
            query.Append("   AND ELP.IDSITFUNC          = SFU.IDSITFUNC ");
            query.Append("   AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV ");
            query.Append("   AND CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append("   AND CON.IDRESPONSAVEL      = RES.IDPESSOA(+) ");
            query.Append("   AND ELP.IDPESSJURCEDIDO    = CED.IDPESSOA(+) ");
            query.Append("   AND CON.CODFORMAPAG       = FRP.CODFORMA ");
            query.Append("   AND CON.PORTFORMAPAG      = PTF_PAG.CODPORTFORMA ");
            query.Append("   AND CON.PORTFORMAREC      = PTF_REC.CODPORTFORMA ");
            query.Append("   AND CON.IDCONTRATOEMPTMO  = VLR.IDCONTRATOEMPTMO(+) "); // SOL163624
            // SOL 204373 KTN 1975310 ** INICIO **
            //query.Append("   AND PPP.FLGDESATIVADO      = 0 ");
            query.Append("   AND (PPP.IDPLANOPREV =                               ");
            query.Append("   (SELECT MAX(PPP2.IDPLANOPREV) FROM PARTPREVPLAN PPP2 ");
            query.Append("   WHERE PPP2.FLGDESATIVADO = 0                         ");
            query.Append("   AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                 ");
            query.Append("   (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                ");
            query.Append("   (SELECT 1 FROM PARTPREVPLAN PPP1                     ");
            query.Append("   WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   ");
            query.Append("   AND PPP1.FLGDESATIVADO = 0) AND                      ");
            query.Append("   (PPP.IDSITPLANOPREV = 25 OR                          ");
            query.Append("   (PPP.IDPLANOPREV = (SELECT MAX(PPP1.IDPLANOPREV)     ");
            query.Append("   FROM PARTPREVPLAN PPP1                               ");
            query.Append("   WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   ");
            query.Append("   AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =      ");
            query.Append("   (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE)) ");
            query.Append("   FROM PARTPREVPLAN PPP2                               ");
            query.Append("   WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)                 ");
            query.Append("   AND NOT EXISTS (SELECT 1 FROM PARTPREVPLAN PPP2      ");
            query.Append("   WHERE PPP2.IDPESSOA = PPP1.IDPESSOA                  ");
            query.Append("   AND PPP2.IDSITPLANOPREV = 25))))))                   ");
            // SOL 204373 KTN 1975310 ** FIM **

            query.Append("   AND CON.IDCONTRATOEMPTMO = :NUMERO_P ");



            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        numero = leitor.GetInt64(NUMCONTRATO_CONTRATO),
                        dataAssinatura = leitor.obterValorData(DATAASSINATURA_CONTRATO),
                        dataCredito = leitor.obterValorData(DATACREDITO_CONTRATO),
                        dataPrimeiraParcela = leitor.obterValorData(DATAPRIMPARC_CONTRATO),
                        taxaJuros = leitor.obterValorDouble(TXJUROS_CONTRATO),
                        valorContrato = leitor.obterValorDouble(VLRCONTRATO_CONTRATO),
                        totalParcelas = leitor.GetInt32(NUMPARCELAS_CONTRATO),
                        valorParcela = leitor.obterValorDouble(VLRPARCELA_CONTRATO),
                        valorMargem = leitor.obterValorDouble(VALOR_MARGEM_CONTRATO),
                        dataCancelamento = leitor.obterValorData(DATA_CANCELAMENTO_CONTRATO),
                        salarioBase = leitor.obterValorDouble(SALARIO_BASE_CONTRATO),
                        contratoQuitacao = leitor.GetInt64(IDCONTRQUITACAO),
                        dataSolicitacao = leitor.obterValorData(DATA_SOLICITACAO),
                        nomeResponsavel = leitor.GetString(NOMERESPONSAVEL),
                        numeroParcelasAtrasadas = leitor.GetInt32(NUMPARCDESCONTO),
                        codigoAutoEmprestimo = leitor.GetInt64(CODAUTOEMP),
                        dataInicioSuspensao = leitor.obterValorData(DATAINICIOSUSP),
                        dataFimSuspensao = leitor.obterValorData(DATAFIMSUSP),
                        formaPagamento = leitor.GetString(FORMA_PGTO_CRE),
                        portadorCredito = leitor.GetString(CONTA_CAIXA),
                        portadorDebito = leitor.GetString(FORMA_PGTO_DEB),
                        flagFormaPagamento = leitor.GetString(FLGFORMAPAG_CONTRATO),
                        flagFormaRecebimento = leitor.GetString(FLGFORMAREC_CONTRATO),
                        excepcional = Convert.ToBoolean(leitor.GetInt32(FLGEXCEPCIONAL_CONTRATO)),
                        internet = Convert.ToBoolean(leitor.GetInt32(FLGINTERNET_CONTRATO)),
						//Sadi Sol213592_Kintana2040335
                        efetiva = Convert.ToBoolean(leitor.GetInt32(FLGPERDAEFETIVA_CONTRATO)),
                        //William Moreira da Silva
                        //numProtocolo = leitor.GetInt64(NUMPROTOCOLO),
                        numProtocolo = leitor.GetString(NUMPROTOCOLO),//William Moreira da Silva - SOL 213725 KINTANA 2040469
                        dataFinalVlrMax = leitor.obterValorData(DATAFINALVLRMAX),
                        dataInicioVlrMax = leitor.obterValorData(DATAINICIOVLRMAX),
                        //William Moreira da Silva

                        situacao = new SituacaoContrato()
                        {
                            codigo = leitor.GetString(FLGSITUACAO_CONTRATO),
                            descricao = leitor.GetString(SITUACAO_CONTRATO)
                        },

                        tipo = new TipoContrato()
                        {
                            id = leitor.GetInt32(IDTIPOCONTREMPTMO_CONTRATO),
                            descricao = leitor.GetString(TIPO_CONTRATO_CONTRATO)
                        },
                        mutuario = new Mutuario()
                        {
                            id = leitor.GetInt32(IDPESSOA_CONTRATO),
                            matricula = leitor.GetString(MATRICULA_MUTUARIO_CONTRATO),
                            nome = leitor.GetString(NOME_MUTUARIO_CONTRATO),
                            cpf = leitor.GetString(NUMDOCUMENTO_CONTRATO),
                            situacao = leitor.GetString(SIT_PARTICIPANTE_CONTRATO),
                            dataFalecimento = leitor.obterValorData(DATA_FALECIMENTO),
                            inscricaoPrevidenciaria = leitor.GetInt64(INSCRICAO_PREVIDENCIARIA),
                            idTitular = leitor.GetInt32(IDTITULAR_CONTRATO),//HELEN BIANCHI - ADD CAMPO CONFORME EMAIL
                            flginternoParticipante = leitor.GetString(FLGINTERNO),
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            id = leitor.GetInt32(IDPATROCINADORA_CONTRATO),
                            nome = leitor.GetString(PATROCINADORA_CONTRATO),
                            situacaoFuncional = leitor.GetString(SITUACAO_FUN),
                            nomeCedido = leitor.GetString(CEDIDO)
                        },
                        plano = new PlanoPrevidenciario()
                        {
                            id = leitor.GetInt32(IDPLANOPREVIDENCIAO_CONTRATO),
                            descricao = leitor.GetString(PLANO_PREVIDENCIARIO_CONTRATO),
                            situacao = leitor.GetString(SITUACAO_PLANO),
                            planoOrigem = leitor.GetString(PLANO_ORIGEM)
                        },
                        tipoEmprestimo = new TipoEmprestimo()
                        {
                            id = leitor.GetInt32(IDTIPOEMPRESTIMO_CONTRATO),
                            descricao = leitor.GetString(TIPO_EMPRESTIMO_CONTRATO)
                        },
                        indexador = new Moeda()
                        {
                            sigla = leitor.GetString(INDEXADOR_CONTRATO)
                        },
                        beneficiario = new Beneficiario()
                        {
                            id = leitor.GetInt32(IDBENEFICIARIO)
                        },
                        inscricaoEmprestimo = new InscricaoEmprestimo()
                        {
                            id = leitor.GetInt64(IDINSCRICAO_EMPRESTIMO)
                        },
                        suspensao = new Suspensao()
                        {
                            descricao = leitor.GetString(DESC_SUSPENCAO)
                        },
                        mesesSuspencao = leitor.GetInt32(QTDEMESSUSP),
                        nrContratosQuitados = leitor.GetInt32(QTDECONTQUITADO),
                        valorMaximo = leitor.GetDouble(VLRMAXPERMIT),
                        valorMaxPrestacao = leitor.GetDouble(VALORMAXPRESTACAO),
                        //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
                        isDocumentoObito = leitor.GetInt32(ISDOCUMENTOOBITO),
                        numeroDocumentoParamPrev = leitor.GetInt32(NUMERODOCUMENTOPARAMPREV)
                        //marcio sanches spinosa sol 199356  kintana 1931062 - Fim
                    };
                }
            }

            return contrato;
        }
        ////Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Inicio
        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <param name="pIsConcessao">Chamada da tela de concessão</param>/// 
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultar(long numero, bool pIsConcessao)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT CON.IDBENEF, ");
            query.Append("       CON.IDCONTRATOEMPTMO AS CONTRATO, ");
            query.Append("       DEP.MATRICULA, ");
            query.Append("       CON.IDTIPOCONTREMPTMO, ");
            query.Append("       CON.TXJUROS, ");
            query.Append("       PEF.DATAMORTE, ");
            query.Append("       DEP.IDTITULAR, ");
            query.Append("       DEP.IDPESSOA  ");//William Moreira da Silva SOL 211940
            query.Append("       FROM CONTRATOEMPTMO   CON, ");
            query.Append("       DEPENTIT         DEP, ");
            query.Append("       PESSOAFISICA     PEF ");
            query.Append("       WHERE CON.IDPESSOA = DEP.IDTITULAR ");
            query.Append("       AND CON.IDBENEF = DEP.IDPESSOA ");
            query.Append("       AND CON.IDBENEF = PEF.IDPESSOA ");
            query.Append("       AND CON.IDCONTRATOEMPTMO = :NUMERO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        numero = leitor.GetInt64(NUMCONTRATO_CONTRATO),
                        taxaJuros = leitor.obterValorDouble(4),
                        mutuario = new Mutuario()
                        {
                            id = leitor.GetInt32(7),//William Moreira da Silva SOL 211940
                            matricula = leitor.GetString(2),
                            dataFalecimento = leitor.obterValorData(5),
                            idTitular = leitor.GetInt32(6)
                        },
                        beneficiario = new Beneficiario()
                        {
                            id = leitor.GetInt32(0)
                        }
                    };
                }
            }

            return contrato;
        }
        ////Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Fim 
        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultarContaCorrente(long numero)
        {
            StringBuilder query = new StringBuilder();

            #region Query

            // Consulta
            query.Append("SELECT INS.IDINSCRICAOEMPTMO AS INSCRICAO, ");
            query.Append("       CNT.DATAASSINATURA, ");
            query.Append("       CNT.IDCONTRATOEMPTMO, ");
            query.Append("       CNT.IDBENEF, ");
            query.Append("       CNT.DATACREDITO, ");
            query.Append("       CNT.VLRCONTRATO, ");
            query.Append("       CNT.FLGFORMAPAG, ");
            query.Append("       CNT.FLGFORMAREC, ");
            query.Append("       CNT.PORTFORMAPAG, ");
            query.Append("       CNT.PORTFORMAREC, ");
            query.Append("       CNT.IDCBANCARIADEB, ");
            query.Append("       DECODE(CNT.FLGSITUACAO, ");
            query.Append("              'A', ");
            query.Append("              'Ativo', ");
            query.Append("              'C', ");
            query.Append("              'Cancelado', ");
            query.Append("              'E', ");
            query.Append("              'Encerrado', ");
            query.Append("              'Q', ");
            query.Append("              'Quitado', ");
            query.Append("              'R', ");
            query.Append("              'Refinanciado', ");
            query.Append("              'S', ");
            query.Append("              'Suspenso', ");
            query.Append("              'K', ");
            query.Append("              'Pendente de Quitação') AS DESCSITCONTRATO, ");
            query.Append("       CNT.IDTIPOSUSPEMPTMO, ");
            query.Append("       CNT.DATAINICIOSUSP, ");
            query.Append("       CNT.DATAFIMSUSP, ");
            query.Append("       CNT.DATALIBSUSP, ");
            query.Append("       CNT.HORALIBSUSP, ");
            query.Append("       CNT.USUARIOLIBSUSP, ");
            query.Append("       CNT.IDTIPOCONTREMPTMO, ");
            query.Append("       CNT.FLGSUSPENSAOAUTO, ");
            query.Append("       CNT.ANOSUSPENSAO, ");
            query.Append("       CNT.MESSUSPENSAO, ");
            query.Append("       CNT.NUMPARCDESCONTO, ");
            query.Append("       PPP.INSCRICAONUMERO, ");
            query.Append("       SIT.DESCRICAO AS SITUACAO, ");
            query.Append("       PLV.NOME AS PLANOPREV, ");
            query.Append("       JUR.NOME AS PATRO, ");
            query.Append("       ELP.MATRICULA, ");
            query.Append("       TIT.NOME AS TITULAR, ");
            query.Append("       BEN.NOME AS BENEFICIARIO, ");
            query.Append("       TIP.TCEDESCRICAO, ");
            query.Append("       TEM.DESCTIPOEMPTMO, ");
            query.Append("       BAN.NOME AS BANCO, ");
            query.Append("       CTB.CONTACORRENTE, ");
            query.Append("       AGB.NUMAGENCIA, ");
            query.Append("       NVL(FLGOBRIGBENEF, 0) AS FLGOBRIGBENEF ,");
            query.Append("       CNT.IDPESSOA ");
            query.Append("  FROM PESSOA          JUR, ");
            query.Append("       PESSOA          TIT, ");
            query.Append("       PESSOA          BEN, ");
            query.Append("       PESSOA          BAN, ");
            query.Append("       AGENCIABANCARIA AGB, ");
            query.Append("       CONTABANCARIA   CTB, ");
            query.Append("       PARTPREVPLAN    PPP, ");
            query.Append("       ELEGPATRO       ELP, ");
            query.Append("       TIPOCONTREMPTMO TIP, ");
            query.Append("       TIPOEMPTMO      TEM, ");
            query.Append("       SITPART         SIT, ");
            query.Append("       CONTRATOEMPTMO  CNT, ");
            query.Append("       INSCRICAOEMPTMO INS, ");
            query.Append("       PLANPREV        PLV ");
            query.Append(" WHERE CNT.IDCONTRATOEMPTMO = :NUMERO_P ");
            query.Append("   AND CNT.IDPESSOA = PPP.IDPESSOA ");
            query.Append("   AND CNT.IDPATRO = PPP.IDPESSJUR ");
            query.Append("   AND SIT.IDSITPART = PPP.IDSITPART ");
            query.Append("   AND CNT.IDPLANOPREV = PLV.IDPLANOPREV ");
            query.Append("   AND CNT.IDPATRO = JUR.IDPESSOA ");
            query.Append("   AND CNT.IDPESSOA = ELP.IDPESSOA ");
            query.Append("   AND CNT.IDPATRO = ELP.IDPESSJUR ");
            query.Append("   AND CNT.IDPESSOA = TIT.IDPESSOA ");
            query.Append("   AND CNT.IDBENEF = BEN.IDPESSOA ");
            query.Append("   AND CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ");
            query.Append("   AND TIP.IDTIPOEMPTMO = TEM.IDTIPOEMPTMO ");
            query.Append("   AND CNT.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO(+) ");
            query.Append("   AND INS.IDCBANCARIADEB = CTB.IDCBANCARIA(+) ");
            query.Append("   AND CTB.IDAGENCIA = AGB.IDPESSOA(+) ");
            query.Append("   AND AGB.IDBANCO = BAN.IDPESSOA(+) ");
            query.Append("   AND PPP.INSCRICAODATA = ");
            query.Append("       (SELECT MAX(B.INSCRICAODATA) ");
            query.Append("          FROM PARTPREVPLAN B ");
            query.Append("         WHERE B.IDPESSOA = PPP.IDPESSOA ");
            query.Append("           AND B.IDPESSJUR = PPP.IDPESSJUR) ");

            #endregion

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        numero = leitor.GetInt64(IDCONTRATO_DADOS),
                        dataAssinatura = leitor.GetDateTime(DATASSINATURA_DADOS),
                        dataCredito = leitor.GetDateTime(DATACREDITO_DADOS),
                        valorContrato = leitor.GetDouble(VALORCONTRATO_DADOS),
                        formaRecebimento = leitor.GetString(FORMARECEBIMENTO_DADOS),
                        numeroParcelasAtrasadas = leitor.GetInt32(NUMPARCELASDESCO_DADOS),
                        inscricaoEmprestimo = new InscricaoEmprestimo()
                        {
                            id = leitor.GetInt64(INCRICAO_DADOS)
                        },
                        situacao = new SituacaoContrato()
                        {
                            descricao = leitor.GetString(DESCSITCONTRATO_DADOS)
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            nome = leitor.GetString(PATRO_DADOS)
                        },
                        mutuario = new Mutuario()
                        {
                            id = leitor.GetInt32(IDPESSOA_DADOS),
                            nome = leitor.GetString(TITULAR_DADOS),
                            matricula = leitor.GetString(MATRICULA_DADOS),
                            situacao = leitor.GetString(SITUACAO_DADOSBANCARIOS_DADOS),
                            dadosBancarios = new DadosBancarios()
                            {
                                id = leitor.GetInt32(IDCONTABANCARIADEBITO_DADOS)
                            },
                            inscricaoPrevidenciaria = leitor.GetInt32(INSCRICAONUMERO_DADOS)
                        },
                        beneficiario = new Beneficiario()
                        {
                            nome = leitor.GetString(BENEFICIARIO_DADOS)
                        },
                        tipoEmprestimo = new TipoEmprestimo()
                        {
                            descricao = leitor.GetString(TCEDESCRICAO_DADOSBANCARIOS_DADOS)
                        },
                        tipo = new TipoContrato()
                        {
                            descricao = leitor.GetString(DESCTIPOEMPTMO_DADOS)
                        },
                        plano = new PlanoPrevidenciario()
                        {
                            descricao = leitor.GetString(PLANOPREV_DADOS)
                        }
                    };
                }
            }

            return contrato;
        }

        /// <summary>
        /// Consulta logs de dados contratuais
        /// </summary>
        public List<Contrato> consultarLogDadosContratuais(long numero)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT ");
            query.Append(" H.IDCONTRATOEMPTMO,");
            query.Append(" B.NOME || ' - ' || TRIM(A.NUMAGENCIA) || ' - ' || C.CONTACORRENTE AS CONTACORRENTE,");
            query.Append(" H.TRGUSERINCLUSAO,");
            query.Append(" H.TRGDTINCLUSAO ");
            query.Append(" FROM HSTCBANCARIAEMPTMO H, CONTABANCARIA C, PESSOA B, AGENCIABANCARIA A ");
            query.Append(" WHERE H.IDCBANCARIADEB = IDCBANCARIA ");
            query.Append(" AND   C.IDAGENCIA = A.IDPESSOA");
            query.Append(" AND   A.IDBANCO = B.IDPESSOA");
            query.Append(" AND   H.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ");
            query.Append(" ORDER BY H.TRGDTINCLUSAO DESC ");

            //Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numero);

            List<Contrato> logs = new List<Contrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Contrato contrato = new Contrato();
                    contrato.mutuario = new Mutuario { dadosBancarios = new DadosBancarios { contaCorrente = leitor.GetString(1) } };
                    contrato.usuario = new Usuario { login = leitor.GetString(2) };
                    contrato.dataSolicitacao = leitor.obterValorData(3);

                    logs.Add(contrato);
                }
            }

            return logs;

        }

        /// <summary>
        /// Pesquisa Contratos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> pesquisar(Contrato contrato, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            bool buscarNumero = contrato.numero > 0;
            bool buscarSituacao = contrato.idSituacao != null && contrato.idSituacao != "0";
            bool buscarMatricula = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.matricula);
            bool buscarCPF = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.cpf);
            bool buscarNome = contrato.mutuario != null && !String.IsNullOrEmpty(contrato.mutuario.nome);
            bool buscarSuspensao = contrato.suspensao != null && contrato.suspensao.tipo != null && contrato.suspensao.tipo.id > 0;

            // Consulta
            query.Append("SELECT CON.IDCONTRATOEMPTMO, ");
            query.Append("       CON.FLGSITUACAO, ");
            query.Append("       DECODE(CON.FLGSITUACAO, ");
            query.Append("           'A', 'ATIVO', ");
            query.Append("           'E', 'ENCERRADO', ");
            query.Append("           'J', 'EM COBRANÇA JURÍDICA', ");
            query.Append("           'K', 'EM QUITAÇÃO', ");
            query.Append("           'Q', 'QUITADO', ");
            query.Append("           'R', 'RENOVADO', ");
            query.Append("           'C','CANCELADO') AS SITUACAO, ");
            query.Append("       PDP.NOME, ");
            query.Append("       DEP.MATRICULA, ");
            query.Append("       TCE.TCEDESCRICAO, ");
            query.Append("       CON.DATAASSINATURA, ");
            query.Append("       CON.DATACREDITO, ");
            query.Append("       TSE.TSEDESCRICAO, ");
            query.Append("       TEM.DESCTIPOEMPTMO, ");
            query.Append("       PLP.NOME AS NOME_PLANO, ");
            query.Append("       PPA.NOME AS PATROCINADORA, ");
            query.Append("       CON.IDINSCRICAOEMPTMO, ");
            query.Append("       PDP.NUMDOCUMENTO AS CPF, ");
            query.Append("       CON.IDTIPOCONTREMPTMO, ");
            query.Append("       SPP.DESCRICAO AS SIT_PLANO, ");
            query.Append("       TEM.IDTIPOEMPTMO ");
            query.Append("  FROM PESSOA PDP, ");
            query.Append("       PESSOA PPA, ");
            query.Append("       DEPENTIT DEP, ");
            query.Append("       CONTRATOEMPTMO  CON, ");
            query.Append("       TIPOCONTREMPTMO TCE, ");
            query.Append("       TIPOSUSPEMPTMO  TSE, ");
            query.Append("       TIPOEMPTMO      TEM, ");
            query.Append("       PLANPREV        PLP, ");
            query.Append("       PARTPREVPLAN    PPP, ");
            query.Append("       SITPLANOPREV    SPP, ");
            //OTACILIO SOL 204373 KTN 1975310 ** INICIO **
            query.Append("       ELEGPATRO       ELP  ");

            //WILLIAM MOREIRA DA SILVA - SOL 217314 KTN 2047240
            //query.Append(" WHERE ELP.IDPESSOA  = PDP.IDPESSOA  ");
            //query.Append("   AND ELP.IDPESSJUR = PPA.IDPESSOA  ");
            query.Append(" WHERE ELP.IDPESSJUR = PPA.IDPESSOA  ");
            //WILLIAM MOREIRA DA SILVA - SOL 217314 KTN 2047240
            query.Append("   AND ELP.IDPESSJUR = PPP.IDPESSJUR ");
            query.Append("   AND ELP.IDPESSOA  = PPP.IDPESSOA  ");
            query.Append("   AND ELP.IDPESSOA  = DEP.IDTITULAR ");
            query.Append("   AND CON.IDPATRO   = PPA.IDPESSOA  ");
            //OTACILIO SOL 204373 KTN 1975310 ** FIM **
            query.Append("   AND CON.IDPESSOA = DEP.IDTITULAR ");
            query.Append("   AND CON.IDBENEF = DEP.IDPESSOA   ");
            query.Append("   AND CON.IDBENEF = PDP.IDPESSOA   ");
            query.Append("   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO    ");
            query.Append("   AND CON.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO (+) ");
            query.Append("   AND CON.IDPLANOPREV       = PLP.IDPLANOPREV          ");
            query.Append("   AND TCE.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO         ");
            query.Append("   AND DEP.IDTITULAR         = PPP.IDPESSOA             ");
            query.Append("   AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV       ");
            //OTACILIO SOL 204373 KTN 1975310 ** INICIO **
            //query.Append("   AND PPP.FLGDESATIVADO   = 0 "); 
            query.Append("   AND (PPP.IDPLANOPREV =                               ");
            query.Append("   (SELECT MAX(PPP2.IDPLANOPREV) FROM PARTPREVPLAN PPP2 ");
            query.Append("   WHERE PPP2.FLGDESATIVADO = 0                         ");
            query.Append("   AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                 ");
            query.Append("   (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                ");
            query.Append("   (SELECT 1 FROM PARTPREVPLAN PPP1                     ");
            query.Append("   WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   ");
            query.Append("   AND PPP1.FLGDESATIVADO = 0) AND                      ");
            query.Append("   (PPP.IDSITPLANOPREV = 25 OR                          ");
            query.Append("   (PPP.IDPLANOPREV = (SELECT MAX(PPP1.IDPLANOPREV)     ");
            query.Append("   FROM PARTPREVPLAN PPP1                               ");
            query.Append("   WHERE PPP1.IDPESSOA = PPP.IDPESSOA                   ");
            query.Append("   AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =      ");
            query.Append("   (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE)) ");
            query.Append("   FROM PARTPREVPLAN PPP2                               ");
            query.Append("   WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)                 ");
            query.Append("   AND NOT EXISTS (SELECT 1 FROM PARTPREVPLAN PPP2      ");
            query.Append("   WHERE PPP2.IDPESSOA = PPP1.IDPESSOA                  ");
            query.Append("   AND PPP2.IDSITPLANOPREV = 25))))))                   ");

            // Filtros
            if (buscarMatricula)
                query.Append("AND  (DEP.MATRICULA LIKE :MATRICULA_P OR ELP.MATRICULA LIKE :MATRICULA_P) ");
            //OTACILIO SOL 204373 KTN 1975310 ** FIM **

            if (buscarNumero)
                query.Append("AND  CON.IDCONTRATOEMPTMO LIKE  :NUMERO_P || '%' ");
            if (buscarSituacao)
                query.Append("AND  CON.FLGSITUACAO = :FLGSITUACAO_P ");
            if (buscarCPF)
                query.Append("AND  PDP.NUMDOCUMENTO LIKE :CPF_P || '%' ");
            if (buscarNome)
                query.Append("AND  PDP.NOME LIKE :NOME_P || '%' ");
            if (buscarSuspensao)
                query.Append("AND  CON.IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO_P ");

            // Ordenação
            query.Append(" ORDER BY DECODE(CON.FLGSITUACAO, 'A', 'A', 'K', 'B', 'E', 'C', 'Q', 'D', 'C', 'Z', 'Y'), CON.DATACREDITO DESC ");//NILTON - CORRECAO - 06/02/13.
            //query.Append(this.obterQueryOrdenacao("CON", "DATAASSINATURA DESC", parametros));
            //query.Append(this.obterQueryOrdenacao("CON", "FLGSITUACAO", parametros)); //William Moreira da Silva - Alteração na ordenação

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.obterComandoPorSql(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            if (buscarMatricula)
                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, contrato.mutuario.matricula);
            if (buscarNumero)
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.String, contrato.numero.ToString());
            if (buscarCPF)
                bancoDeDados.AddInParameter(comando, "CPF_P", DbType.String, contrato.mutuario.cpf);
            if (buscarNome)
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, contrato.mutuario.nome.ToUpper());
            if (buscarSituacao)
                bancoDeDados.AddInParameter(comando, "FLGSITUACAO_P", DbType.String, contrato.idSituacao.ToString());
            if (buscarSuspensao)
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int32, contrato.suspensao.tipo.id);

            // Popula objetos resultantes
            List<Contrato> contratos = new List<Contrato>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Contrato item = new Contrato()
                    {
                        numero = leitor.GetInt64(IDCONTRATOEMPTMO_PESQUISAR),
                        idSituacao = leitor.GetString(SITUACAO_PESQUISAR),
                        dataAssinatura = leitor.obterValorData(DATAASSINATURA_PESQUISAR),
                        dataCredito = leitor.obterValorData(DATACREDITO_PESQUISAR),
                        tipo = new TipoContrato()
                        {
                            id = leitor.GetInt32(IDTIPOCONTREMPTMO_PESQUISAR),
                            descricao = leitor.GetString(TCEDESCRICAO_PESQUISAR)
                        },
                        mutuario = new Mutuario()
                        {
                            matricula = leitor.GetString(MATRICULA_PESQUISAR),
                            nome = leitor.GetString(NOME_PESQUISAR),
                            cpf = leitor.GetString(CPF_PESQUISAR)
                        },
                        tipoEmprestimo = new TipoEmprestimo()
                        {
                            id = leitor.GetInt32(IDTIPOEMPTMO_PESQUISAR),
                            descricao = leitor.GetString(DESCTIPOEMPTMO_PESQUISAR)
                        },
                        plano = new PlanoPrevidenciario()
                        {
                            descricao = leitor.GetString(NOME_PLANO_PESQUISAR),
                            situacao = leitor.GetString(SIT_PLANO_PESQUISAR)
                        },
                        patrocinadora = new Patrocinadora()
                        {
                            nome = leitor.GetString(PATROCINADORA_PESQUISAR)
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
            return contratos;
        }

        /// <summary>
        /// Consulta se uma data é feriado ou não.
        /// </summary>
        /// <param name="data">Data a ser verificada.</param>
        /// <returns><see cref="System.Boolean"/> com verdadeiro se a data é feriado ou falso se a data não for.</returns>
        public bool verificarDataFeriado(DateTime data)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT DATAFERIADO ");
            query.Append("FROM FERIADOS ");
            query.Append("WHERE TRUNC(DATAFERIADO) = TRUNC(:DATA_P) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "DATA_P", DbType.DateTime, data);

            // Executa a consulta
            bool feriado = false;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                feriado = leitor.Read();
            }

            return feriado;
        }

        /// <summary>
        /// Verifica se exite mais de uma atualização do Saldo devedor do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        /// <param name="tipoEvento">Tipo de Evento.</param>
        public bool verificarAtualizacaoSaldo(long numeroContrato, DateTime dataReferencia, TipoEvento tipoEvento)
        {
            StringBuilder query = new StringBuilder();

            bool existeAtualizacao = false;

            // Consulta
            query.Append(" SELECT ");
            query.Append("   COUNT(IDHISTMOVEMPTMO) QTDE ");
            query.Append(" FROM ");
            query.Append("   HISTMOVEMPTMO HME, CONTRATOEMPTMO CON ");
            query.Append(" WHERE  HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append("   AND HME.HMETIPOMOV = :ID_TIPOEVENTO_P ");
            query.Append("   AND TRUNC(HME.HMEDATAPREVISTA) > TRUNC(:DATAAMORTIZACAO_P) ");
            query.Append("   AND ( HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL ) ");
            query.Append("   AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "ID_TIPOEVENTO_P", DbType.Int32, tipoEvento.chave);
            bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, dataReferencia);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    existeAtualizacao = (leitor.GetInt32(QTDE_ATU_SALDO) <= 1);
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
            StringBuilder query = new StringBuilder();

            bool existeAtualizacao = false;

            // Consulta
            query.Append(" SELECT COUNT(HMEDATAATUALIZA) QTDE ");
            query.Append(" 	 FROM HISTMOVEMPTMO HME, CONTRATOEMPTMO CON ");
            query.Append("  WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append("    AND  TRUNC(HME.HMEDATAATUALIZA) = TRUNC(:DATAREFERENCIA_P) ");
            query.Append("    AND  HME.HMETIPOMOV = 5 ");
            query.Append("    AND (HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL) ");
            query.Append("    AND  HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataReferencia);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    existeAtualizacao = (leitor.GetInt32(QTDE_ATU_DIARIA) > 0);
                }
            }

            return existeAtualizacao;
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
            StringBuilder query = new StringBuilder();

            bool resultado = false;

            // Consulta
            query.Append(" SELECT HME.HMEDATAPREVISTA FROM HISTMOVEMPTMO HME ");
            query.Append(" WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND HMETIPOMOV = 1 AND HMEORIGEM = 1 AND HMECENTRALIZA = 1 ");
            query.Append(" AND HMEDATAPREVISTA >= :DATAVENCTO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
        // Xavier SOL 177146 Final.

        /// <summary>
        /// Verificar se existe parcela atrasada em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        public bool parcelaAtrasadaEmAberto(long numeroContrato, DateTime dataReferencia)
        {
            StringBuilder query = new StringBuilder();

            bool existeParcela = false;

            // Consulta
            query.Append(" SELECT count( HME.IDHISTMOVEMPTMO) QTDE ");
            query.Append(" FROM ");
            query.Append("   HISTMOVEMPTMO HME ");
            query.Append(" WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append("   AND HME.HMETIPOMOV           NOT IN (0, 5, 8) ");
            query.Append("   AND HME.FLGBAIXADO = 0 ");
            query.Append("   AND HMEDATAEFETIVA IS NULL ");
            query.Append("   AND HMEVLREFETIVO IS NULL ");
            query.Append("   AND HME.HMEVLRPREVISTO      <> 0 ");
            query.Append("   AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1) ");
            query.Append("   AND (NVL(HME.FLGESTORNADO, 0) = 0) ");
            query.Append("   AND (NVL(HME.FLGSUSPENSAO, 0) = 0) ");
            query.Append("   AND (NVL(HME.FLGQUITADO, 0)   = 0) ");
            query.Append("   AND (NVL(HME.FLGABONADO, 0)   = 0) ");

            query.Append("   AND (:DATAREFERENCIA_P            IS NULL OR (:DATAREFERENCIA_P IS NOT NULL AND HME.HMEDATAVENCTO + 7 < :DATAREFERENCIA_P)) ");
            query.Append("   AND (:MES_DATAREFERENCIA_P        IS NULL OR (:MES_DATAREFERENCIA_P  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'0000')) || trim(TO_CHAR(HME.HMEMESCOBRANCA,'00')) < :ANO_DATAREFERENCIA_P || :MES_DATAREFERENCIA_P))) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataReferencia);
            bancoDeDados.AddInParameter(comando, "MES_DATAREFERENCIA_P", DbType.Int32, dataReferencia.Month);
            bancoDeDados.AddInParameter(comando, "ANO_DATAREFERENCIA_P", DbType.Int32, dataReferencia.Year);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    existeParcela = (leitor.GetInt32(QTDE_PARCELA_ATRASADA) > 0);
                }
            }

            return existeParcela;
        }

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
            query.Append("          FROM CONTRATOEMPTMO C, DEPENTIT D");
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
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                existeItem = leitor.Read();
            }

            return existeItem;
        }
        // Thiago Melo SOL 208661 Kintana 2021125


        /// <summary>
        /// Obtem itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public List<ItemContrato> obterItensEmAberto(long numeroContrato, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT HME.HMETIPOMOV, ");
            query.Append("        DECODE(HME.HMETIPOMOV, ");
            query.Append("        0, 'Concessão/Renovação', ");
            query.Append("        1, 'Prestação ', ");
            query.Append("        2, 'Amortização/Refinanciamento', ");
            query.Append("        3, 'Quitação', ");
            query.Append("        4, 'Atualização de Débito', ");
            query.Append("        5, 'Atualização de Saldo (Diária)' , ");
            query.Append("        6, 'Importação/Migração', ");
            query.Append("        7, 'Ajustes (Cobrança/Devolução)', ");
            query.Append("        8, 'Ajustes (Saldo Devedor)' ");
            query.Append("        ) AS EVENTO, ");
            query.Append("   HME.HMEMESCOMPETENCIA, ");
            query.Append("   HME.HMEANOCOMPETENCIA, ");
            query.Append("   TO_CHAR(HME.HMEMESCOMPETENCIA, '00') || '/' || HME.HMEANOCOMPETENCIA AS ANOMESCOMP, ");
            query.Append("   HME.HMEPARCELA, ");
            query.Append("   HME.HMESEQCOBRANCA, ");
            query.Append("   ITE.ITEDESCRICAO, ");
            query.Append("   HME.HMEDATAPREVISTA, ");
            query.Append("   HME.HMEDATAVENCTO, ");
            query.Append("   HME.HMEVLRPREVISTO, ");
            query.Append("   HME.HMETXJUROS, ");
            query.Append("   HME.HMESALDODEV, ");
            query.Append("   HME.HMEDATAEFETIVA, ");
            query.Append("   HME.HMEVLREFETIVO, ");
            query.Append("   TO_CHAR(HME.HMEMESCOBRANCA, '00') || '/' || HME.HMEANOCOBRANCA AS ANOMESCOBR ");
            query.Append(" FROM HISTMOVEMPTMO  HME, ");
            query.Append("   TIPOSUSPEMPTMO TSE, ");
            query.Append("   ITEMEMPTMO     ITE  ");
            query.Append(" WHERE  HME.IDCONTRATOEMPTMO   = :NUMEROCONTRATO_P ");
            query.Append("   AND 	( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 ) ");
            query.Append("   AND 	 HME.HMETIPOMOV   IN  (1, 2, 3, 4, 7) ");
            query.Append("   AND HME.FLGBAIXADO       = 0 ");
            query.Append("   AND HME.HMEVLREFETIVO    IS NULL ");
            query.Append("   AND HME.HMEDATAEFETIVA   IS NULL ");
            query.Append("   AND NVL(HME.FLGQUITADO, 0)    = 0 ");
            query.Append("   AND NVL(HME.FLGABONADO, 0)    = 0 ");
            query.Append("   AND NVL(HME.FLGESTORNADO, 0)  = 0 ");
            query.Append("   AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR ");
            query.Append("       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1))");
            query.Append("   AND HME.IDITEMEMPTMO          = ITE.IDITEMEMPTMO ");
            query.Append("   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append(" ORDER BY HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;

            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query.ToString());


            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.String, numeroContrato.ToString());

            // Popula objetos resultantes
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
                    item.dataEfetiva = leitor.obterValorData(HMEDATAEFETIVA_ITENSABERTOS);
                    item.valorEfetivo = leitor.GetInt32(HMEVLREFETIVO_ITENSABERTOS);
                    item.dataCobranca = leitor.GetString(ANOMESCOBR_ITENSABERTOS);

                    itens.Add(item);
                }
            }

            // Total de Registros
            parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query.ToString());

            // Retorna informações
            parametros.prepararRetorno();

            // Retorna informações
            return itens;
        }

        //William Moreira da Silva SOL 211704
        /// <summary>
        /// Verifica se a parcela do mês já foi gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificaParcelaGerada(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT * FROM HISTMOVEMPTMO HST ");
            query.Append(" WHERE HST.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND HST.IDITEMEMPTMO = 13 ");
            query.Append(" AND NVL(HST.Flgestornado, 0) <> 1 ");
            query.Append(" AND HST.HMEDATAPREVISTA = ");
            query.Append(" (SELECT MAX(H.HMEDATAPREVISTA) ");
            query.Append(" FROM HISTMOVEMPTMO H ");
            query.Append(" WHERE H.IDCONTRATOEMPTMO = HST.IDCONTRATOEMPTMO ");
            query.Append(" AND SYSDATE < H.HMEDATAPREVISTA ");
            query.Append(" AND H.IDITEMEMPTMO = 13) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
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
        //William Moreira da Silva SOL 211704

        //William Moreira da Silva SOL 211418
        /// <summary>
        /// Retorna caso a parcela já tenha sido gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificaEnvio(long numeroContrato, int parcela)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT  FLGENVIO ");
            query.Append(" FROM HISTMOVEMPTMO ");
            query.Append(" WHERE IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND NVL(FLGESTORNADO, 0) = 0 ");
            query.Append(" AND (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) ");
            query.Append(" AND HMETIPOMOV = 1");
            query.Append(" AND HMEPARCELA = :PARCELA_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parcela);

            // Popula objetos resultantes
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
        //William Moreira da Silva SOL 211418

        //William Moreira da Silva SOL 211419
        /// <summary>
        /// Verifica se existe parcela posterior.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool existeParcelaPosterior(long numeroContrato, DateTime dataAmortizacao)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT IDHISTMOVEMPTMO ");
            query.Append(" FROM HISTMOVEMPTMO  HME, ");
            query.Append(" CONTRATOEMPTMO CON ");
            query.Append(" WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND HME.HMETIPOMOV NOT IN (4, 5) ");
            query.Append(" AND HME.HMEDATAPREVISTA > :PHMEDATAPREVISTA_P ");
            query.Append(" AND (HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL) ");
            //William Moreira da Silva SOL 211419

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

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
        //William Moreira da Silva SOL 211419

        /// <summary>
        /// Retorna parcela atual do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public int obterParcelaAtual(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            int parcelaAtual = 0;

            //William Moreira da Silva SOL 211418
            // Consulta
            //query.Append(" SELECT MAX(HMEPARCELA) PARCELA_ATUAL ");
            //query.Append(" FROM HISTMOVEMPTMO H    ");
            //query.Append(" WHERE H.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            //query.Append(" AND H.HMETIPOMOV in (1, 2, 3) ");

            query.Append(" SELECT MAX(HMEPARCELA) ");
            query.Append(" FROM HISTMOVEMPTMO ");
            query.Append(" WHERE IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND NVL(FLGESTORNADO, 0) = 0 ");
            query.Append(" AND (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) ");
            query.Append(" AND HMETIPOMOV = 1");
            //William Moreira da Silva SOL 211418

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    parcelaAtual = leitor.GetInt32(SALDO_DEVEDOR);
                }
            }

            return parcelaAtual;
        }

        /// <summary>
        /// Obtem parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public int obterParcelasRestantes(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            int parcelasRestantes = 0;

            // Consulta
            query.Append(" SELECT MIN(HMENUMPARCELAS) PARCELA_REST ");
            query.Append(" FROM HISTMOVEMPTMO H ");
            query.Append(" WHERE H.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND H.HMETIPOMOV in (1, 2, 3) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    parcelasRestantes = leitor.GetInt32(SALDO_DEVEDOR);
                }
            }

            return parcelasRestantes;
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

            DbCommand comando = bancoDeDados.GetStoredProcCommand("pck_emp_funcao_saldo.pr_buscasaldo_ant_pos");

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


        /// <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        public double obterPrestacaoAtual(long numeroContrato) //William Moreira da Silva - SOL 144458
        {
            StringBuilder query = new StringBuilder();

            double prestacaoAtual = 0;

            //Consulta
            query.Append("SELECT HMEVLRPREVISTO  ");
            query.Append(" FROM HISTMOVEMPTMO    ");
            query.Append(" WHERE IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND HMETIPOMOV = 1 ");
            query.Append(" AND HMECENTRALIZA = 1 ");
            query.Append(" AND HMEDATAPREVISTA = (SELECT MAX(HMEDATAPREVISTA) ");
            query.Append(" FROM HISTMOVEMPTMO ");
            query.Append(" where idcontratoemptmo = :NUMEROCONTRATO_P ");
            query.Append(" AND HMETIPOMOV = 1 ");
            query.Append(" AND HMECENTRALIZA = 1) ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {

                    prestacaoAtual = leitor.GetDouble(HMEVLRPREVISTO);
                }
            }

            return prestacaoAtual;
        }//William Moreira da Silva - SOL 144458

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public DateTime obterDataAtualizacao(long numeroContrato)
        {


            StringBuilder query = new StringBuilder();

            query.Append(" SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) INDEX(HME XIE29HISTMOVEMPTMO) */ ");
            query.Append(" MAX(HMEDATAPREVISTA) AS HMEDATAATUALIZA FROM    HISTMOVEMPTMO   HME, ");
            query.Append(" CONTRATOEMPTMO  CON,    ITEMXTIPOCONTR  ITC,    TIPOCONTREMPTMO TCE ");
            query.Append(" WHERE CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append(" AND ITC.ITCTRATASALDODEV    <> 0    AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append(" AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO  AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO ");
            query.Append(" AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO  AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ");


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            DateTime ultDataAtualizacao = DateTime.Today; ;

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

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public double obterSaldoDevedor(long numeroContrato, DateTime dataPrevista)
        {

            StringBuilder queryParametro = new StringBuilder();
            queryParametro.Append(" SELECT PEP.FLGCALCDIA FROM PARAMEMPTMO PEP WHERE PEP.IDEMPRESAPROP = 1 ");
            // Cria comando de consulta
            Database bancoDeDadosParametro = this.obterBancoDeDados();
            DbCommand comandoParametro = bancoDeDadosParametro.obterComandoPorSql(queryParametro.ToString());

            // Popula objetos resultantes
            double pFlgCalcDia = 0;
            using (IDataReader leitorParametro = bancoDeDadosParametro.ExecuteReader(comandoParametro))
            {
                if (leitorParametro.Read())
                {
                    pFlgCalcDia = leitorParametro.GetDouble(0);
                }
            }

            DateTime DataAtualizacao = obterDataAtualizacao(numeroContrato);
            StringBuilder query = new StringBuilder();
            if (pFlgCalcDia == 1)
            {
                // Consulta
                query.Append(" SELECT /*+LEADING(HME) */  HMESALDODEV  FROM (SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ");
                query.Append("  HME.HMESALDODEV  FROM HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, ITEMXTIPOCONTR ITC ");
                query.Append("  WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P  ");
                query.Append("  AND HME.HMETIPOMOV between 0 and 9 AND HME.HMEDATAPREVISTA = :DATAPREVISTA_P ");
                query.Append("  AND ITC.ITCTRATASALDODEV <> 0 AND NVL(HME.FLGESTORNADO, 0) = 0 AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO  ");
                query.Append("  AND CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO AND HME.IDITEMEMPTMO = ITC.IDITEMEMPTMO ");
                query.Append("  ORDER BY ITC.ITCORDEMEXTRATO DESC, HME.HMESEQCOBRANCA  DESC, HME.IDHISTMOVEMPTMO DESC) WHERE ROWNUM = 1  ");
            }
            else
            {
                // Consulta
                query.Append("  SELECT /*+INDEX(HME XPKHISTMOVEMPTMO) */  HMESALDODEV FROM  HISTMOVEMPTMO HME, ");
                query.Append("  (  SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) INDEX(HME XIE29HISTMOVEMPTMO) */ ");
                query.Append("  MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO ");
                query.Append("  FROM  HISTMOVEMPTMO   HME,   CONTRATOEMPTMO  CON,   ITEMXTIPOCONTR  ITC,   TIPOCONTREMPTMO TCE ");
                query.Append("  WHERE  ( CON.IDCONTRATOEMPTMO   = :NUMEROCONTRATO_P ) ");
                query.Append("  AND ( ITC.ITCTRATASALDODEV  <> 0 )  AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) ");
                query.Append("  AND ( HME.HMEDATAATUALIZA    =   ( ");
                query.Append("  SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) INDEX(HME XIE29HISTMOVEMPTMO) */ ");
                query.Append("  MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA ");
                query.Append("  FROM  HISTMOVEMPTMO   H, CONTRATOEMPTMO  C, ITEMXTIPOCONTR  I  ");
                query.Append("  WHERE  ( C.IDCONTRATOEMPTMO   = :NUMEROCONTRATO_P ) ");
                query.Append("  AND ( H.HMEDATAATUALIZA   <= :DATAPREVISTA_P ) ");
                query.Append("  AND ( I.ITCTRATASALDODEV  <> 0 ) AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNADO IS NULL) ) ");
                query.Append("  AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )  AND ( C.IDTIPOCONTREMPTMO  = I.IDTIPOCONTREMPTMO )  ");
                query.Append("  AND ( H.IDITEMEMPTMO       = I.IDITEMEMPTMO )   )   ) ");
                query.Append("  AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )    AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) ");
                query.Append("  AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )    AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) ");
                query.Append("  ) MAX ");
                query.Append("  WHERE  ( HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO )  ");

            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            //Marcio Sanches Spinosa SOL 201769 Kintana 1950540 - Inicio
            //bancoDeDados.AddInParameter(comando, "DATAPREVISTA_P", DbType.DateTime, DataAtualizacao);
            bancoDeDados.AddInParameter(comando, "DATAPREVISTA_P", DbType.DateTime, dataPrevista);
            //Marcio Sanches Spinosa SOL 201769 Kintana 1950540 - Fim

            double saldoDevedor = 0;
            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    saldoDevedor = leitor.GetDouble(0);
                }
            }

            return saldoDevedor;
        }

        /// <summary>
        /// Obtem lista de itens
        /// </summary>
        /// <returns></returns>
        public List<ItemContrato> listarItens()
        {

            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT IDITEMEMPTMO, ITEDESCRICAO FROM ITEMEMPTMO ORDER BY ITEDESCRICAO ASC ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());


            List<ItemContrato> itens = new List<ItemContrato>();

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    itens.Add(new ItemContrato() { id = leitor.GetInt32(0), descricao = leitor.GetString(1) });
                }
            }

            return itens;

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

            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT ");
            query.Append(" HSC.IDHISTSUSPCOBEP, ");
            query.Append(" HSC.IDTIPOSUSPEMPTMO, ");
            query.Append(" TSE.TSEDESCRICAO, ");
            query.Append(" HSC.FLGSTATUS, ");
            query.Append(" DECODE(HSC.FLGSTATUS, ");
            query.Append("        'A','Ativa', ");
            query.Append("        'C','Cancelada', ");
            query.Append("        'E','Encerrada') AS STATUS, ");
            query.Append(" HSC.HSCMESES, ");
            query.Append(" HSC.HSCINICIOSUSP, ");
            query.Append(" HSC.HSCFINALSUSP, ");
            query.Append(" HSC.FLGFERIAS, ");
            query.Append(" HSC.HSCDATALIBER, ");
            query.Append(" HSC.HSCMESCOBRANCA, ");
            query.Append(" HSC.HSCANOCOBRANCA, ");
            query.Append(" HSC.HSCUSUATEND, ");
            query.Append(" HSC.HSCDATAATEND, ");
            query.Append(" HSC.HSCDATAATU, ");
            query.Append(" HSC.HSCUSULIBER, ");
            query.Append(" ELE.MATRICULA, ");
            query.Append(" PES.NOME, ");
            query.Append(" CON.IDCONTRATOEMPTMO, ");
            query.Append(" HSC.OBSERVACAO ");//William Moreira da Silva SOL 149705
            query.Append(" FROM HISTSUSPCOBEP  HSC, ");
            query.Append("    TIPOSUSPEMPTMO TSE, ");
            query.Append("    CONTRATOEMPTMO CON, ");
            query.Append("    ELEGPATRO      ELE, ");
            query.Append("    PESSOA         PES ");
            query.Append(" WHERE TSE.IDTIPOSUSPEMPTMO = HSC.IDTIPOSUSPEMPTMO ");
            query.Append("  AND CON.IDCONTRATOEMPTMO = HSC.IDCONTRATOEMPTMO ");
            query.Append("  AND CON.IDPESSOA = PES.IDPESSOA ");
            query.Append("  AND ELE.IDPESSOA = CON.IDPESSOA ");

            if (buscaContrato)
                query.Append("  AND HSC.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");

            if (buscaHistorico)
                query.Append("  AND HSC.IDHISTSUSPCOBEP = :IDHISTORICOSUSPENSAO_P ");

            query.Append(" ORDER BY HSC.HSCDATAATEND DESC ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                    item.id = leitor.GetInt64(IDHISTSUSPCOBEP_HISTSUSP);
                    item.tipoSuspensao = new TipoSuspensao();
                    item.tipoSuspensao.id = leitor.GetInt32(IDTIPOSUSPEMPTMO_HISTSUSP);
                    item.tipoSuspensao.descricao = leitor.GetString(TSEDESCRICAO_HISTSUSP);
                    item.status = leitor.GetString(STATUS_HISTSUSP);
                    item.numeroMeses = leitor.GetInt32(HSCMESES_HISTSUSP);
                    item.dataInicio = leitor.GetDateTime(HSCINICIOSUSP_HISTSUSP);
                    item.dataFim = leitor.obterValorData(HSCFINALSUSP_HISTSUSP);
                    item.ferias = leitor.GetInt32(FLGFERIAS_HISTSUSP);
                    item.dataLiberacao = leitor.obterValorData(HSCDATALIBER_HISTSUSP);
                    item.mesCobranca = leitor.obterValorInteiro(HSCMESCOBRANCA_HISTSUSP);
                    item.anoCobranca = leitor.obterValorInteiro(HSCANOCOBRANCA_HISTSUSP);
                    item.responsavelAtendimento = leitor.GetString(HSCUSUATEND_HISTSUSP);
                    item.dataAtendimento = leitor.obterValorData(HSCDATAATEND_HISTSUSP);
                    item.dataAtualizacao = leitor.obterValorData(HSCDATAATU_HISTSUSP);
                    item.responsavelAtualizacao = leitor.GetString(HSCUSULIBER_HISTSUSP);
                    item.contrato = new Contrato();
                    item.contrato.mutuario = new Mutuario();
                    item.contrato.mutuario.matricula = leitor.GetString(MATRICULA_HISTSUSP);
                    item.contrato.mutuario.nome = leitor.GetString(NOME_HISTSUSP);
                    item.contrato.numero = leitor.GetInt64(IDCONTRATOEMPTMO_HISTSUSP);
                    item.observacao = leitor.GetString(OBSERVACAO_HISTSUSP);//William Moreira da Silva SOL 149705

                    itens.Add(item);
                }
            }

            // Retorna informações
            return itens;
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
            query.Append(" FROM HISTSUSPCOBEP HS, TIPOSUSPEMPTMO TS");
            query.Append(" WHERE HS.IDTIPOSUSPEMPTMO =  TS.IDTIPOSUSPEMPTMO ");
            query.AppendFormat(" AND HS.IDCONTRATOEMPTMO IN ({0})", listaContratos);
            query.Append(" AND HSCFINALSUSP >= :DATACREDITO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, dataCredito);

            // Popula objetos resultantes
            List<HistoricoSuspensao> itens = new List<HistoricoSuspensao>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    HistoricoSuspensao item = new HistoricoSuspensao();
                    item.tipoSuspensao = new TipoSuspensao() { apenasConcessao = leitor.GetInt32(0) > 0 };
                    itens.Add(item);
                }
            }

            return itens;

        }



        /// <summary>
        /// Consulta Log de um contrato.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLog(LogContrato logContrato)
        {
            StringBuilder query = new StringBuilder();

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query.Append("   SELECT LTP.IDLOGTOTALPREV,");
            query.Append("          LTP.IDMODULO,");
            query.Append("          LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,");
            query.Append("          LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,");
            query.Append("          LTP.ORIGEM,");
            query.Append("          LTP.DESCOPERACAO,");
            query.Append("          LTP.DATA,");
            query.Append("          LTP.IDUSUARIO,");
            query.Append("          USU.NOMEUSUARIO,");
            query.Append("          PSU.NOME,");
            query.Append("          LTP.VERSAO");
            query.Append("     FROM PESSOA         PSU,");
            query.Append("          LOGTOTALPREV   LTP,");
            query.Append("          USUARIOSISTEMA USU");
            query.Append("    WHERE LTP.IDMODULO   = :MODULO_P");

            if (!idHistorico)
                query.Append("      AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P");
            else
                query.Append("      AND LTP.IDPESQUISA2  = :IDHISTORICO_P");

            query.Append("      AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)");
            query.Append("      AND USU.IDUSUARIO    = PSU.IDPESSOA(+)");
            query.Append(" ORDER BY LTP.DATA DESC");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        id = leitor.GetInt32(IDLOGTOTALPREV_LOG),
                        numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                        idHistorico = leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                        descricao = leitor.GetString(DESCOPERACAO_LOG),
                        data = leitor.GetDateTime(DATA_LOG),
                        versao = leitor.GetString(VERSAO_LOG),

                        origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.GetInt32(ORIGEM_LOG)),

                        usuario = new Usuario()
                        {
                            id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                            login = leitor.GetString(NOMEUSUARIO_LOG),
                            nome = leitor.GetString(NOME_LOG)
                        }
                    };
                    logs.Add(log);
                }
            }

            // Retorna informações
            return logs;
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
            StringBuilder query = new StringBuilder();

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query.Append("   SELECT LTP.IDLOGTOTALPREV,");
            query.Append("          LTP.IDMODULO,");
            query.Append("          LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,");
            query.Append("          LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,");
            query.Append("          LTP.ORIGEM,");
            query.Append("          LTP.DESCOPERACAO,");
            query.Append("          LTP.DATA,");
            query.Append("          LTP.IDUSUARIO,");
            query.Append("          USU.NOMEUSUARIO,");
            query.Append("          PSU.NOME,");
            query.Append("          LTP.VERSAO");
            query.Append("     FROM PESSOA         PSU,");
            query.Append("          LOGTOTALPREV   LTP,");
            query.Append("          USUARIOSISTEMA USU");
            query.Append("    WHERE LTP.IDMODULO   = :MODULO_P");

            if (!idHistorico)
                query.Append("      AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P");
            else
                query.Append("      AND LTP.IDPESQUISA2  = :IDHISTORICO_P");

            query.Append("      AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)");
            query.Append("      AND USU.IDUSUARIO    = PSU.IDPESSOA(+)");
            query.Append(" ORDER BY LTP.DATA DESC");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        id = leitor.GetInt32(IDLOGTOTALPREV_LOG),
                        numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                        idHistorico = leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                        descricao = leitor.GetString(DESCOPERACAO_LOG),
                        data = leitor.GetDateTime(DATA_LOG),
                        versao = leitor.GetString(VERSAO_LOG),

                        origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.GetInt32(ORIGEM_LOG)),

                        usuario = new Usuario()
                        {
                            id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                            login = leitor.GetString(NOMEUSUARIO_LOG),
                            nome = leitor.GetString(NOME_LOG)
                        }
                    };
                    logs.Add(log);
                    i++;
                }
            }

            // Retorna informações
            return i;
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
            StringBuilder query = new StringBuilder();

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query.Append("   SELECT LTP.IDLOGTOTALPREV,");
            query.Append("          LTP.IDMODULO,");
            query.Append("          LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,");
            query.Append("          LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,");
            query.Append("          LTP.ORIGEM,");
            query.Append("          LTP.DESCOPERACAO,");
            query.Append("          LTP.DATA,");
            query.Append("          LTP.IDUSUARIO,");
            query.Append("          USU.NOMEUSUARIO,");
            query.Append("          PSU.NOME,");
            query.Append("          LTP.VERSAO");
            query.Append("     FROM PESSOA         PSU,");
            query.Append("          LOGTOTALPREV   LTP,");
            query.Append("          USUARIOSISTEMA USU");
            query.Append("    WHERE LTP.IDMODULO   = :MODULO_P");

            if (!idHistorico)
                query.Append("      AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P");
            else
                query.Append("      AND LTP.IDPESQUISA2  = :IDHISTORICO_P");

            query.Append("      AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)");
            query.Append("      AND USU.IDUSUARIO    = PSU.IDPESSOA(+)");
            query.Append(" ORDER BY LTP.DATA DESC");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                            id = leitor.GetInt32(IDLOGTOTALPREV_LOG),
                            numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                            idHistorico = leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                            descricao = leitor.GetString(DESCOPERACAO_LOG),
                            data = leitor.GetDateTime(DATA_LOG),
                            versao = leitor.GetString(VERSAO_LOG),

                            origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.GetInt32(ORIGEM_LOG)),

                            usuario = new Usuario()
                            {
                                id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                                login = leitor.GetString(NOMEUSUARIO_LOG),
                                nome = leitor.GetString(NOME_LOG)
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
        //William Moreira da Silva - SOL 219785 KTN 2052123 - FIM

        //William Moreira da Silva
        /// <summary>
        /// Consulta Log de um contrato pela origem.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLogOrigem(LogContrato logContrato, int origem)
        {
            StringBuilder query = new StringBuilder();

            bool idHistorico = logContrato.idHistorico != null;

            // Consulta
            query.Append("   SELECT LTP.IDLOGTOTALPREV,");
            query.Append("          LTP.IDMODULO,");
            query.Append("          LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,");
            query.Append("          LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,");
            query.Append("          LTP.ORIGEM,");
            query.Append("          LTP.DESCOPERACAO,");
            query.Append("          LTP.DATA,");
            query.Append("          LTP.IDUSUARIO,");
            query.Append("          USU.NOMEUSUARIO,");
            query.Append("          PSU.NOME,");
            query.Append("          LTP.VERSAO");
            query.Append("     FROM PESSOA         PSU,");
            query.Append("          LOGTOTALPREV   LTP,");
            query.Append("          USUARIOSISTEMA USU");
            query.Append("    WHERE LTP.IDMODULO   = :MODULO_P");
            query.Append("    AND   LTP.ORIGEM       = :ORIGEM_P");

            if (!idHistorico)
                query.Append("      AND LTP.IDPESQUISA1  = :NUMEROCONTRATO_P");
            else
                query.Append("      AND LTP.IDPESQUISA2  = :IDHISTORICO_P");

            query.Append("      AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)");
            query.Append("      AND USU.IDUSUARIO    = PSU.IDPESSOA(+)");
            query.Append(" ORDER BY LTP.DATA DESC");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros

            bancoDeDados.AddInParameter(comando, "MODULO_P", DbType.Int32, logContrato.modulo);
            bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, origem);

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
                        id = leitor.GetInt32(IDLOGTOTALPREV_LOG),
                        numeroContrato = leitor.obterValorInt64(IDCONTRATOEMPTMO_LOG),
                        idHistorico = leitor.obterValorInt64(IDHISTMOVEMPTMO_LOG),
                        descricao = leitor.GetString(DESCOPERACAO_LOG),
                        data = leitor.GetDateTime(DATA_LOG),
                        versao = leitor.GetString(VERSAO_LOG),

                        origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.GetInt32(ORIGEM_LOG)),

                        usuario = new Usuario()
                        {
                            id = leitor.obterValorInteiro(IDUSUARIO_LOG),
                            login = leitor.GetString(NOMEUSUARIO_LOG),
                            nome = leitor.GetString(NOME_LOG)
                        }
                    };
                    logs.Add(log);
                }
            }

            // Retorna informações
            return logs;
        }
        //William Moreira da Silva

        public long? consultarAutoEmprestimo(long codigoAutoEmprestimo)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT IDCONTRATOEMPTMO ");
            query.Append(" FROM CONTRATOEMPTMO ");
            query.Append(" WHERE CODAUTOEMP = :CODAUTOEMP_P ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "CODAUTOEMP_P", DbType.Int64, codigoAutoEmprestimo);

            long? numeroContrato = null;

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    numeroContrato = leitor.GetInt64(0);
                }
            }

            return numeroContrato;

        }

        public bool validarContratoPadrao(int idContratoPadrao)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT IDCONTRATOPADRAO FROM CONTRATOPADRAO WHERE IDCONTRATOPADRAO = :IDCONTRATOPADRAO_P ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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

        #endregion

        #region Alteração

        /// <summary>
        /// Altera informações do contrato.
        /// </summary>
        /// <param name="contrato">Contrato com os dados para alteração.</param>
        public void alterarInformacoesContratuais(Contrato contrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append("UPDATE CONTRATOEMPTMO ");
            query.Append("   SET FLGFORMAREC = :FLGFORMAREC_P, ");
            query.Append("                     PORTFORMAREC = :PORTFORMAREC_P, ");
            query.Append("                     IDCBANCARIADEB = :IDCBANCARIADEB_P, ");
            query.Append("                     NUMPARCDESCONTO = :NUMPARCDESCONTO_P ");
            query.Append(" WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "FLGFORMAREC_P", DbType.String, contrato.formaRecebimento);
            bancoDeDados.AddInParameter(comando, "PORTFORMAREC_P", DbType.Int32, contrato.portadorRecebimento);
            bancoDeDados.AddInParameter(comando, "IDCBANCARIADEB_P", DbType.Int32, contrato.mutuario.dadosBancarios.id);
            bancoDeDados.AddInParameter(comando, "NUMPARCDESCONTO_P", DbType.Int32, contrato.numeroParcelasAtrasadas);
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, contrato.numero);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        /// <summary>
        /// Altera forma de cobrança do contrato.
        /// </summary>
        /// <param name="formaCobranca">Nova forma de cobrança.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        public void alterarFormaCobranca(string formaCobranca, long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append("UPDATE HISTMOVEMPTMO ");
            query.Append("   SET HMEFORMACOBRANCA = :FLGFORMAREC_P ");
            query.Append(" WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ");
            query.Append("   AND (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) ");
            query.Append("   AND HMETIPOMOV <> 5 ");
            query.Append("   AND HMEVLREFETIVO IS NULL ");
            query.Append("   AND FLGENVIO = 0 ");
            query.Append("   AND IDTMPDESC IS NULL ");
            query.Append("   AND CODDOCUMENTO IS NULL ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "FLGFORMAREC_P", DbType.String, formaCobranca);
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        public void alterarSituacao(long numeroContrato, SituacaoContrato situacao)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE CONTRATOEMPTMO CON SET CON.FLGSITUACAO = :SITUACAO_P ");
            query.Append(" WHERE CON.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "SITUACAO_P", DbType.String, situacao.codigo);
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        /// <summary>
        /// Altera informações de suspensão do contrato.
        /// </summary>
        /// <param name="suspensao">Dados da suspensão.</param>
        public void alterarSuspensao(HistoricoSuspensao suspensao)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE CONTRATOEMPTMO ");
            query.Append(" SET DATAINICIOSUSP        = :DATAINICIOSUSP_P, ");
            query.Append(" DATAFIMSUSP           = :DATAFIMSUSP_P, ");
            query.Append(" USUARIOLIBSUSP        = :USUARIOLIBSUSP_P, ");
            query.Append(" DATALIBSUSP           = :DATALIBSUSP_P, ");
            query.Append(" ANOSUSPENSAO          = :ANOSUSPENSAO_P, ");
            query.Append(" MESSUSPENSAO          = :MESSUSPENSAO_P, ");
            query.Append(" IDTIPOSUSPEMPTMO      = :IDTIPOSUSP_P ");//William Mroeira da Silva - SOL 211038 KINTANA 2033107
            query.Append(" WHERE  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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

            bancoDeDados.AddInParameter(comando, "IDTIPOSUSP_P", DbType.Int32, suspensao.tipoSuspensao.id);//William Moreira da Silva - SOL 211038 KINTANA 2033107


            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, suspensao.contrato.numero);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        /// <summary>
        /// Retira informações de suspensão do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public void retirarSuspensao(long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE CONTRATOEMPTMO ");
            query.Append(" SET IDTIPOSUSPEMPTMO  = null, ");
            query.Append(" DATAINICIOSUSP        = null, ");
            query.Append(" DATAFIMSUSP           = null, ");
            query.Append(" USUARIOLIBSUSP        =  null, ");
            query.Append(" DATALIBSUSP           = null, ");
            query.Append(" ANOSUSPENSAO          = null, ");
            query.Append(" MESSUSPENSAO          = null ");
            query.Append(" WHERE  IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        /// <summary>
        /// Coloca o numero do contrato de Quitação no contrato quitado
        /// </summary>
        public void alterarContratoQuitacao(long contratoNovo, long contratoQuitado)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE CONTRATOEMPTMO ");
            query.Append(" SET IDCONTRQUITACAO  = :CONTRATONOVO_P");
            query.Append(" WHERE IDCONTRATOEMPTMO = :CONTRATOQUITADO_P");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "CONTRATONOVO_P", DbType.Int64, contratoNovo);
            bancoDeDados.AddInParameter(comando, "CONTRATOQUITADO_P", DbType.Int64, contratoQuitado);

            bancoDeDados.ExecuteNonQuery(comando);

        }

        public void alterarDataQuitacao(long numeroContrato, DateTime dataQuitacao)
        {

            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE CONTRATOEMPTMO ");
            query.Append(" SET DATACANC = :DATAQUITACAO_P");
            query.Append(" WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

            bancoDeDados.ExecuteNonQuery(comando);

        }

        #endregion

        #region Inclusão

        public void incluirAssinaturaPadrao(Assinatura assinaturaContrato)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" INSERT INTO ASSINCONTRPADRAO( ");
            query.Append(" IDPESSOA,");
            query.Append(" IDCONTRATOPADRAO,");
            query.Append(" ACPDATAASSINAT,");
            query.Append(" TRGDTINCLUSAO,");
            query.Append(" TRGUSERINCLUSAO,");
            query.Append(" OBS,");
            query.Append(" IDBENEF,");
            query.Append(" NUMCOMPROVA)");
            query.Append(" VALUES (");
            query.Append(" :IDPESSOA_P,");
            query.Append(" :IDCONTRATOPADRAO_P,");
            query.Append(" :ACPDATAASSINAT_P,");
            query.Append(" SYSDATE,");
            query.Append(" 'CM_WEB_AUTO',");
            query.Append(" :OBS_P,");
            query.Append(" :IDBENEF_P,");
            query.Append(" :NUMCOMPROVA_P)");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, assinaturaContrato.mutuario.idTitular);
            bancoDeDados.AddInParameter(comando, "IDCONTRATOPADRAO_P", DbType.Int32, assinaturaContrato.idContratoPadrao);
            bancoDeDados.AddInParameter(comando, "ACPDATAASSINAT_P", DbType.DateTime, assinaturaContrato.dataAssinatura);
            bancoDeDados.AddInParameter(comando, "OBS_P", DbType.String, assinaturaContrato.observacao);
            bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int32, assinaturaContrato.mutuario.id);
            bancoDeDados.AddInParameter(comando, "NUMCOMPROVA_P", DbType.String, assinaturaContrato.numeroComprovante);

            bancoDeDados.ExecuteNonQuery(comando);

        }

        /// <summary>
        /// Inclui um contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna numero do contrato inserido</returns>
        public long incluir(Contrato contrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            long numeroContrato = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQCONTRATOEMPTMO", true);

            string login = string.Format("CM{0}", this.obterIdPlanus(contrato.usuario.login));

            query.Append("INSERT INTO CONTRATOEMPTMO ( ");
            query.Append("   IDCONTRATOEMPTMO, ");
            query.Append("   IDPESSOA, ");
            query.Append("   IDTIPOCONTREMPTMO, ");
            query.Append("   IDINSCRICAOEMPTMO, ");
            query.Append("   IDPLANOPREV, ");
            query.Append("   IDPATRO, ");
            query.Append("   IDBENEF, ");
            query.Append("   IDCBANCARIA, ");
            query.Append("   CODFORMAPAG, ");
            query.Append("   PORTFORMAPAG, ");
            query.Append("   PORTFORMAREC, ");
            query.Append("   NUMPARCELAS, ");
            query.Append("   DATACREDITO, ");
            query.Append("   DATAASSINATURA, ");
            query.Append("   DATAPRIMPARC, ");
            query.Append("   VLRCONTRATO, ");
            query.Append("   VLRPARCELA, ");
            query.Append("   TXJUROS, ");
            query.Append("   FLGSITUACAO, ");
            query.Append("   FLGFORMAREC, ");
            query.Append("   FLGFORMAPAG, ");
            query.Append("   VLRSALBASE, ");
            query.Append("   VLRMARGEM, ");
            query.Append("   VLRMAXPERMIT, ");
            query.Append("   MOECODIGO, ");
            query.Append("   IDTIPOSUSPEMPTMO, ");
            query.Append("   DATAINICIOSUSP, ");
            query.Append("   DATAFIMSUSP, ");
            query.Append("   ANOSUSPENSAO, ");
            query.Append("   MESSUSPENSAO, ");
            query.Append("   IDCBANCARIADEB, ");
            query.Append("   IDPLANOORIGEM, ");
            query.Append("   FLGEXCEPCIONAL, ");
            query.Append("   NUMPROTOCOLO, "); // Xavier SOL 172525
            query.Append("   TRGDTINCLUSAO, ");
            query.Append("   TRGUSERINCLUSAO,  ");
            query.Append("   FLGINTERNET,      ");//William Moreira da Silva - SOL 200852 KINTANA 1941359
            query.Append("   CODAUTOEMP )      ");//William Moreira da Silva - SOL 200852 KINTANA 1941359

            query.Append("VALUES( ");

            query.Append(":numeroContrato, ");
            query.Append(":mutuarioid, ");
            query.Append(":tipoid, ");
            query.Append(":inscricaoid, ");
            query.Append(":planoid, ");
            query.Append(":patrocinadoraid, ");
            query.Append(":beneficiarioid, ");
            query.Append(":dadosBancariosid, ");
            query.Append(":formaPagamento, ");
            query.Append(":portadorCredito, ");
            query.Append(":portadorDebito, ");
            query.Append(":totalParcelas, ");
            query.Append(":dataCredito, ");
            query.Append(":dataAssinatura, ");
            query.Append(":dataParcela, ");
            query.Append(":valorContrato, ");
            query.Append(":valorParcela, ");
            query.Append(":taxaJuros, ");
            query.Append(":situacao, ");
            query.Append("'C', ");
            query.Append("'C', ");
            query.Append(":salarioBase, ");
            query.Append(":valorMargem, ");
            query.Append(":valorMaximo, ");
            query.Append(":indexadorid, ");
            query.Append(":suspensaoid, ");
            query.Append(":InicioSuspensao, ");
            query.Append(":FimSuspensao, ");
            query.Append(":AnoSuspensao, ");
            query.Append(":MesSuspensao, ");
            query.Append(":dadosBancariosid1, ");
            query.Append(":idPlanoOrigem, ");
            query.Append(":excepcional, ");
            query.Append(":numprotocolo, "); // Xavier SOL 172525
            query.Append(":TRGDTINCLUSAO, ");
            query.Append(":login,                 ");
            query.Append(":internet,              ");//William Moreira da Silva - SOL 200852 KINTANA 1941359
            query.Append(":codigoAutoEmprestimo   ) ");//William Moreira da Silva - SOL 200852 KINTANA 1941359


            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

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
            //bancoDeDados.AddInParameter(comando, "dataParcela", DbType.DateTime, contrato.dataPrimeiraParcela);            
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

            bancoDeDados.ExecuteNonQuery(comando);

            //chamar metodo para acertar o o idPlanoPrevOrigem da ContratoEmptmo.
            this.acertaPlanoOrigem(contrato, numeroContrato);
            //William Moreira/Xavier

            return numeroContrato;

        }

        //William Moreira/Xavier SOL 218639 KTN 2050361 Inicio
        /// <summary>
        /// Acerta o plano origem ao conceder o contrato
        /// </summary>
        /// <param name="contrato">Contrato que esta sendo concedido</param>
        public void acertaPlanoOrigem(Contrato contrato, long numeroContrato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT   CTB.IDPLANOPREV ");
            query.Append(" FROM     PARTPREVPLAN ATU, ");
            query.Append(" PARTPREVPLAN ANT, ");
            query.Append(" PLANPREVCONTABIL CTB ");
            query.Append(" WHERE    ATU.IDPESSOA = :IDPESSOA_P ");
            query.Append(" AND      ATU.IDPLANOPREV = 74 ");
            query.Append(" AND      CTB.IDPLANOPREVPREV = ANT.IDPLANOPREV ");
            query.Append(" AND      CTB.IDPLANOPREV = 28 ");
            query.Append(" AND      ANT.IDPESSOA = ATU.IDPESSOA ");
            query.Append(" AND      ANT.INSCRICAODATA = ");
            query.Append(" (SELECT MAX(INSCRICAODATA) ");
            query.Append(" FROM   PARTPREVPLAN ");
            query.Append(" WHERE  IDPESSOA = ATU.IDPESSOA ");
            query.Append(" AND    IDPLANOPREV = 2 ");
            query.Append(" AND    IDSITPLANOPREV IN (25,27,28,29) ");
            query.Append(" AND    FLGDESATIVADO = 1 ");
            query.Append(" AND    INSCRICAODATA < ATU.INSCRICAODATA) ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, contrato.mutuario.id);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    if (leitor.GetInt32(0) > 0)
                    {
                        this.atualizaPlanoContabil(numeroContrato, leitor.GetInt32(0));
                    }
                }
                else
                {
                    buscaPlanoContabil(contrato, numeroContrato);
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
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT DISTINCT ");
            query.Append(" IDPESSOA, ");
            query.Append(" IDTITULAR, ");
            query.Append(" IDPLANOORIGEM, ");
            query.Append(" IDPLANOPREV, ");
            query.Append(" IDPLANPREVCONTAB ");
            query.Append(" FROM ");
            query.Append(" BENEFBFCIARIO ");
            query.Append(" WHERE ");
            query.Append(" IDPESSOA       = :IDPESSOA_P ");
            query.Append(" AND IDPLANOPREV    = :IDPLANOPREV_P ");
            query.Append(" AND IDSITBENEFICIO = 1 ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, contrato.mutuario.id);
            bancoDeDados.AddInParameter(comando, "IDPLANOPREV_P", DbType.Int32, contrato.mutuario.plano.id);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    if (leitor.GetInt32(4) > 0)
                    {
                        atualizaPlanoContabil(numeroContrato, leitor.GetInt32(4));
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
            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE ");
            query.Append(" CONTRATOEMPTMO  ");
            query.Append(" SET ");
            query.Append(" IDPLANOORIGEM    =:IDPLANOORIGEM_P ");
            query.Append(" WHERE ");
            query.Append(" IDCONTRATOEMPTMO =:IDCONTRATOEMPTMO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDPLANOORIGEM_P", DbType.Int32, idPlanoOrigem);
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

            bancoDeDados.ExecuteNonQuery(comando);
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
            StringBuilder query = new StringBuilder();

            long idInscricao = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQINSCRICAOEMPTMO", true);

            query.Append("INSERT INTO INSCRICAOEMPTMO ");
            query.Append("  (IDINSCRICAOEMPTMO, ");
            query.Append("   IDTIPOCONTREMPTMO, ");
            query.Append("   MOECODIGO, ");
            query.Append("   IDPESSOA, ");
            query.Append("   IDPATRO, ");
            query.Append("   IDPLANOPREV, ");
            query.Append("   IDBENEF, ");
            query.Append("   IDCBANCARIA, ");
            query.Append("   IDCBANCARIADEB, ");
            query.Append("   FLGSITUACAO, ");
            query.Append("   FLGFORMAREC, ");
            query.Append("   FLGFORMAPAG, ");
            query.Append("   CODFORMAPAG, ");
            query.Append("   PORTFORMAPAG, ");
            query.Append("   PORTFORMAREC, ");
            query.Append("   DATAINSC, ");
            query.Append("   VLRSOLIC, ");
            query.Append("   NUMPARCELAS, ");
            query.Append("   FLGSUSPENSAOAUTO, ");
            query.Append("   VLRSALBASE, ");
            query.Append("   VLRMARGEM, ");
            query.Append("   VLRMAXPERMIT, ");
            query.Append("   VLRPARCELAMES, ");
            query.Append("   DATACREDITO ) ");

            query.Append(" VALUES ( ");

            query.Append(":idInscricao, ");
            query.Append(":tipoid, ");
            query.Append(":indexadorid, ");
            query.Append(":mutuarioid, ");
            query.Append(":patrocinadoraid, ");
            query.Append(":planoid, ");
            query.Append(":beneficiarioid, ");
            query.Append(":dadosBancariosid, ");
            query.Append(":dadosBancariosid1, ");
            query.Append("'A', ");
            query.Append("'F', ");
            query.Append("'C', ");
            query.Append(":formaPagamento, ");
            query.Append(":portadorCredito, ");
            query.Append(":portadorDebito, ");
            query.Append("Sysdate, ");
            query.Append(":valorContrato, ");
            query.Append(":totalParcelas, ");
            query.Append("0, ");
            query.Append(":salarioBase, ");
            query.Append(":valorMargem, ");
            query.Append(":valorMaximo, ");
            query.Append(":valorParcela, ");
            query.Append(":dataCredito ) ");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

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
            bancoDeDados.AddInParameter(comando, "valorContrato", DbType.Double, contrato.valorContrato);
            bancoDeDados.AddInParameter(comando, "totalParcelas", DbType.Int32, contrato.totalParcelas);
            bancoDeDados.AddInParameter(comando, "salarioBase", DbType.Double, contrato.salarioBase);
            bancoDeDados.AddInParameter(comando, "valorMargem", DbType.Double, contrato.valorMargem);
            bancoDeDados.AddInParameter(comando, "valorMaximo", DbType.Double, contrato.valorMaximo);
            bancoDeDados.AddInParameter(comando, "valorParcela", DbType.Double, contrato.valorParcela);
            bancoDeDados.AddInParameter(comando, "dataCredito", DbType.DateTime, contrato.dataCredito);

            bancoDeDados.ExecuteNonQuery(comando);

            return idInscricao;
        }

        /// <summary>
        /// Inclui histórico da incrição de emprestimo do contrato
        /// </summary>
        /// <param name="idInscricao">ID da inscrição</param>
        /// <param name="item">Item do contrato</param>
        public void incluirInscricaoHistorico(long idInscricao, ItemContrato item)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append("INSERT INTO HISTMOVINSCRICAO ");
            query.Append("(IDINSCRICAOEMPTMO, ");
            query.Append("IDHISTMOVINSC, ");
            query.Append("IDREGRA, ");
            query.Append("IDITEMEMPTMO, ");
            query.Append("HMICENTRALIZA, ");
            query.Append("HMIDESTACADO, ");
            query.Append("HMIVLRPREVISTO) ");

            query.Append("VALUES (");

            query.Append(":idInscricao, ");
            query.Append("SEQHISTMOVINSCRICAO.NEXTVAL, ");
            query.Append(":regraid, ");
            query.Append(":id, ");
            query.Append(":centraliza, ");
            query.Append(":destacado, ");
            query.Append(":valor ) ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "idInscricao", DbType.Int64, idInscricao);
            bancoDeDados.AddInParameter(comando, "regraid", DbType.Int32, item.regra.id);
            bancoDeDados.AddInParameter(comando, "id", DbType.Int32, item.id);
            bancoDeDados.AddInParameter(comando, "centraliza", DbType.Int32, item.centraliza);
            bancoDeDados.AddInParameter(comando, "destacado", DbType.Int32, item.destacado);
            bancoDeDados.AddInParameter(comando, "valor", DbType.Double, item.valor);

            bancoDeDados.ExecuteNonQuery(comando);

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
            StringBuilder query = new StringBuilder();

            query.Append("INSERT INTO LOGTOTALPREV ");
            query.Append("  (IDLOGTOTALPREV, ");
            query.Append("   IDMODULO, ");
            query.Append("   DESCOPERACAO, ");
            query.Append("   IDUSUARIO, ");
            query.Append("   DATA, ");
            query.Append("   IDPESQUISA1, ");
            query.Append("   IDPESQUISA2, ");
            query.Append("   ORIGEM, ");
            query.Append("   VERSAO) ");
            query.Append("VALUES ");
            query.Append("  (SEQLOGTOTALPREV.NEXTVAL, ");
            query.Append("   :IDMODULO_P, ");
            query.Append("   :DESCOPERACAO_P, ");
            query.Append("   :IDUSUARIO_P, ");
            query.Append("   SYSDATE, ");
            query.Append("   :IDPESQUISA1_P, ");
            query.Append("   :IDPESQUISA2_P, ");
            query.Append("   :ORIGEM_P, ");
            query.Append("   :VERSAO_P) ");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDMODULO_P", DbType.Int32, logContrato.modulo);
            bancoDeDados.AddInParameter(comando, "DESCOPERACAO_P", DbType.String, logContrato.descricao);
            bancoDeDados.AddInParameter(comando, "IDUSUARIO_P", DbType.Int64, logContrato.idPlanus);
            bancoDeDados.AddInParameter(comando, "IDPESQUISA1_P", DbType.Int64, logContrato.numeroContrato);
            bancoDeDados.AddInParameter(comando, "IDPESQUISA2_P", DbType.Int64, logContrato.idHistorico);
            bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, logContrato.origem.chave);
            bancoDeDados.AddInParameter(comando, "VERSAO_P", DbType.String, logContrato.versao);

            bancoDeDados.ExecuteNonQuery(comando);
        }


        /// <summary>
        /// Inclui log se a Conta Corrente for alterada
        /// </summary>
        public void incluirLogDadosContratuais(Int64 idContrato, int idContaBancaria, string usuario)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            string login = string.Format("CM{0}", obterIdPlanus(usuario));

            query.Append(" INSERT INTO HSTCBANCARIAEMPTMO(");
            query.Append(" IDHSTCBANCARIAEMPTMO,");
            query.Append(" IDCONTRATOEMPTMO,");
            query.Append(" TRGDTINCLUSAO,");
            query.Append(" TRGUSERINCLUSAO,");
            query.Append(" IDCBANCARIADEB)");
            query.Append("VALUES( ");
            query.Append(" SEQHSTCBANCARIAEMPTMO.NEXTVAL, ");
            query.Append(" :IDCONTRATOEMPTMO_P, ");
            query.Append(" SYSDATE, ");
            query.Append(" :TRGUSERINCLUSAO_P,");
            query.Append(" :IDCBANCARIADEB_P ) ");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
            bancoDeDados.AddInParameter(comando, "TRGUSERINCLUSAO_P", DbType.String, login);
            bancoDeDados.AddInParameter(comando, "IDCBANCARIADEB_P", DbType.Int32, idContaBancaria);

            bancoDeDados.ExecuteNonQuery(comando);

        }

        // xavier SOL xxxxxx
        /// <summary>
        /// Inclui idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA
        /// </summary>
        public void incluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" insert into CONTRATOXAVALISTA ");
            query.Append(" (IDINSCRICAOEMPTMO, IDAVALISTA) ");
            query.Append(" values ( ");
            query.Append(" :IDINSCRICAOEMPTMO_P, ");
            query.Append(" :IDAVALISTA_P ) ");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDINSCRICAOEMPTMO_P", DbType.Int64, inscricaoPrevidenviaria);
            bancoDeDados.AddInParameter(comando, "IDAVALISTA_P", DbType.Int32, idAvalista);

            bancoDeDados.ExecuteNonQuery(comando);

        }

        // xavier SOL xxxxxx

        // xavier SOL xxxxxx
        /// <summary>
        /// Inclui idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA
        /// </summary>
        public void excluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" delete from CONTRATOXAVALISTA ");
            query.Append(" where ");
            query.Append("  ");
            query.Append(" IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO_P and ");
            query.Append(" IDAVALISTA = :IDAVALISTA_P ");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDINSCRICAOEMPTMO_P", DbType.Int64, inscricaoPrevidenviaria);
            bancoDeDados.AddInParameter(comando, "IDAVALISTA_P", DbType.Int32, idAvalista);

            bancoDeDados.ExecuteNonQuery(comando);

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

            DbCommand comando = bancoDeDados.GetStoredProcCommand("sp_atualiza_diaria");

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

            DbCommand comando = bancoDeDados.GetStoredProcCommand("sp_emp_atualizasaldodev");

            bancoDeDados.AddInParameter(comando, "IIDCONTRATOEMPTMO", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DDATAATUALIZA", DbType.DateTime, dataAtualiza);
            bancoDeDados.AddInParameter(comando, "FSALDODEV", DbType.Double, saldoDevedor);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        public List<Contrato> consultarContratosQuitados(long numeroContrato)
        {
            List<Contrato> listContrato = new List<Contrato>();
            StringBuilder query = new StringBuilder();
            Contrato contrato;

            query.Append("SELECT DISTINCT CN.IDCONTRATOEMPTMO, ");
            query.Append(" CN.DATACREDITO, ");
            query.Append(" (SELECT SUM(H.HMEVLRPREVISTO) FROM HISTMOVEMPTMO H WHERE H.IDCONTRATOEMPTMO = CN.IDCONTRATOEMPTMO ");
            query.Append(" AND H.HMETIPOMOV = 3 AND H.HMECENTRALIZA = 1 AND NVL(H.FLGESTORNADO, 0) = 0) AS VALOR_QUITACAO, ");
            query.Append(" TIP.TCEDESCRICAO ");
            query.Append(" FROM CONTRATOEMPTMO CN, TIPOCONTREMPTMO TIP, HISTMOVEMPTMO H ");
            query.Append(" WHERE CN.IDCONTRQUITACAO = :IDCONTRATOEMPTMO_P ");
            query.Append(" AND H.IDCONTRATOEMPTMO = CN.IDCONTRATOEMPTMO(+) ");
            query.Append(" AND CN.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO(+) ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Double, numeroContrato);

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    contrato = new Contrato();
                    contrato.numero = leitor.GetInt64(NUMERO_CONTRATO);
                    contrato.dataCredito = leitor.GetDateTime(DATA_CREDITO);
                    contrato.valorQuitado = leitor.obterValorDouble(VALOR_QUITACAO);
                    contrato.modalidade = leitor.GetString(MODALIDADE);
                    listContrato.Add(contrato);
                }
            }

            return listContrato;
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
            StringBuilder query = new StringBuilder();

            query.Append("SELECT MAX(HME.HMEDATAATUALIZA) AS HMEDATAATUALIZA");
            query.Append(" FROM HISTMOVEMPTMO HME");
            query.Append(" WHERE HME.IDCONTRATOEMPTMO = :NUM_CONTRATO ");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0 ");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "NUM_CONTRATO", DbType.Int64, numeroContrato);

            DateTime ultAtualizao = DateTime.Today;

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    ultAtualizao = leitor.GetDateTime(0);
                }
            }
            return ultAtualizao;
        }
        //William Moreira da Silva SOL 209315/14752

        public long obterIdPlanus(string loginUsuario)
        {
            StringBuilder query = new StringBuilder();

            query.Append("SELECT IDUSUARIO FROM USUARIOSISTEMA WHERE TRIM(UPPER(NOMEUSUARIO)) = :NOMEUSUARIO_P");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "NOMEUSUARIO_P", DbType.String, loginUsuario.ToUpper());

            long idPlanus = 0;

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    idPlanus = leitor.GetInt64(0);
                }
            }

            return idPlanus;
        }

        #endregion
    }
}
