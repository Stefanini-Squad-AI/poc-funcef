#region SOL 254373 / PPM 797160
///
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Alteração:
/// 21/05/2015 12:46:00
///
/// Descrição da Alteração:
/// Al alterar a data de vencimento, a funcionalidade está limpando os registros (hmevlrprevisto) que foram abonados.
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
using System.Reflection;//William Moreira da Silva - SOL 250843
using System.Configuration;
using Oracle.ManagedDataAccess.Client;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    /// <summary>
    /// Objeto de acesso a dados de histórico.
    /// </summary>
    public class AcessoHistorico : ObjetoAcessoDados, IAcessoHistorico
    {
        #region Constantes

        #region Consultar

        private const int EVENTO_HISTORICO = 0;
        private const int IDITEMEMPTMO_HISTORICO = 1;
        private const int ITEDESCRICAO_HISTORICO = 2;
        private const int HMEPARCELA_HISTORICO = 3;
        private const int HMENUMPARCELAS_HISTORICO = 4;
        private const int HMESEQCOBRANCA_HISTORICO = 5;
        private const int HMEVLRPREVISTO_HISTORICO = 6;
        private const int HMEMESCOMPETENCIA_HISTORICO = 7;
        private const int HMEANOCOMPETENCIA_HISTORICO = 8;
        private const int HMEMESCOBRANCA_HISTORICO = 9;
        private const int HMEANOCOBRANCA_HISTORICO = 10;
        private const int HMEDATAVENCTO_HISTORICO = 11;
        private const int HMEDATAPREVISTA_HISTORICO = 12;
        private const int HMEDATAEFETIVA_HISTORICO = 13;
        private const int HMEVLREFETIVO_HISTORICO = 14;
        private const int HMESALDODEV_HISTORICO = 15;
        private const int FLGENVIO_HISTORICO = 16;
        private const int HMEDATAENVIO_HISTORICO = 17;
        private const int HMEDATARECEB_HISTORICO = 18;
        private const int HMETXJUROS_HISTORICO = 19;
        private const int IDTIPOSUSPEMPTMO_HISTORICO = 20;
        private const int TSEDESCRICAO_HISTORICO = 21;
        private const int HMETIPOMOV_HISTORICO = 22;
        private const int IDHISTMOVEMPTMO_HISTORICO = 23;
        private const int HMEVLREFETIVO_HISTORICO_TEXTO = 24;
        private const int HMEPARCELAALT_HISTORICO = 25;

        #endregion

        #region Consultar Detalhe

        private const int IDHISTMOVEMPTMO = 0;
        private const int IDCONTRATOEMPTMO = 1;
        private const int IDITEMCENTRALIZA = 2;
        private const int IDITEMEMPTMO = 3;
        private const int ITEDESCRICAO = 4;
        private const int HMEPARCELA = 5;
        private const int EVENTO = 6;
        private const int ORIGEM = 7;
        private const int HMEFORMACOBRANCA = 8;
        private const int HMESEQCOBRANCA = 9;
        private const int HMEPRIORIDADE = 10;
        private const int HMECENTRALIZA = 11;
        private const int HMEDESTACADO = 12;
        private const int HMEDATA = 13;
        private const int HMEDATAPREVISTA = 14;
        private const int HMEDATAEFETIVA = 15;
        private const int HMEDATAATUALIZA = 16;
        private const int HMEANOCOMPETENCIA = 17;
        private const int HMEMESCOMPETENCIA = 18;
        private const int HMEANOCOBRANCA = 19;
        private const int HMEMESCOBRANCA = 20;
        private const int HMEVLRPREVISTO = 21;
        private const int HMEVLREFETIVO = 22;
        private const int HMESALDODEV = 23;
        private const int HMETXJUROS = 24;
        private const int IDREGRA = 25;
        private const int FLGSUSPENSAO = 26;
        private const int HMEANOSUSPENSAO = 27;
        private const int HMEMESSUSPENSAO = 28;
        private const int FLGESTORNADO = 29;
        private const int FLGBAIXADO = 30;
        private const int FLGABONADO = 31;
        private const int FLGENVIO = 32;
        private const int PLNCODIGO = 33;
        private const int PLNCODIGOESTORNO = 34;
        private const int CODDOCUMENTO = 35;
        private const int IDRUBRICA = 36;
        private const int HMERECPAG = 37;
        private const int FLGDIVERGPEND = 38;
        private const int HMENUMPARCELAS = 39;
        private const int HMETIPOFOLHA = 40;
        private const int PLNCODIGORECEB = 41;
        private const int FLGRECEBIMENTO = 42;
        private const int CODDOCUMENTORECEB = 43;
        private const int IDLANCIRRF = 44;
        private const int HMEDATAVENCTO = 45;
        private const int FLGQUITADO = 46;
        private const int HMEDATAQUITABONO = 47;
        private const int FLGTIPODIVERG = 48;
        private const int FLGBAIXAMANUAL = 49;
        private const int FLGDIVERGTRAT = 50;
        private const int IDUSUARIOINDIV = 51;
        private const int IDUSUARIODIVERG = 52;
        private const int FLGTIPODIVERGTRAT = 53;
        private const int HMEDATADIVERGTRAT = 54;
        private const int FLGTRATINDIV = 55;
        private const int FLGTIPOTRATINDIV = 56;
        private const int HMEDATATRATINDIV = 57;
        private const int HMEDATAESTORNO = 58;
        private const int FLGENTRADAMANUAL = 59;
        private const int TRGDTINCLUSAO = 60;
        private const int TRGUSERINCLUSAO = 61;
        private const int VERSAO = 62;
        private const int HMEDATARECEB = 63;
        private const int HMEOBSERVACAO = 64;
        private const int FLGSUSPMANUAL = 65;
        private const int CCDEBFINAN = 66;
        private const int CCCREDFINAN = 67;
        private const int CCDEBFOLHA = 68;
        private const int CCCREDFOLHA = 69;
        private const int HMEDATAENVIO = 70;
        private const int HMEVLRBASE = 71;
        private const int IDUSUARIOESTORNO = 72;
        private const int IDTMPDESC = 73;
        private const int HMEPARCELAALT = 74;
        private const int HMEDATAESTORNOALT = 75;
        private const int IDTIPOSUSPEMPTMO = 76;
        private const int IDMODULO = 77;
        private const int CODDOCUMENTOPROC = 78;
        private const int IDCBANCARIA = 79;
        private const int IDPLANOPREVCONTAB = 80;
        private const int IDPATRO = 81;
        private const int IDTIPORECURSO = 82;
        private const int ORIGEMRECURSO = 83;
        private const int HMETIPOMOV = 84;
        private const int TSEDESCRICAO = 85;
        private const int NOMEUSUARIO = 86;
        //William Moreira da Silva SOL 220958 KTN 2053543
        private const int NODOCUMENTO = 87;
        private const int SITENVIO = 88;
        private const int PLNPLANIL = 89;
        private const int PLANIL_ESTORNO = 90;
        private const int STATUS_DOC = 91;
        //William Moreira da Silva SOL 220958 KTN 2053543
        private const int NOMEUSUARIOESTORNO = 92;
        #endregion

        #endregion

        #region Inclusão

        /// <summary>
        /// Inclui histórico do contrato.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        public void incluir(Historico historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            historico.id = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQHISTMOVEMPTMO", true);

            AcessoContrato acessoContrato = new AcessoContrato();
            string login = string.Format("CM{0}", acessoContrato.obterIdPlanus(historico.usuarioInclusao));

            string query;

            query = @" INSERT INTO HISTMOVEMPTMO H 
             (
                 H.IDHISTMOVEMPTMO,
                 H.IDCONTRATOEMPTMO,
                 H.IDITEMCENTRALIZA,
                 H.IDITEMEMPTMO,
                 H.HMEPARCELA,
                 H.HMETIPOMOV,
                 H.HMEORIGEM,
                 H.HMEFORMACOBRANCA,
                 H.HMESEQCOBRANCA,
                 H.HMEPRIORIDADE,
                 H.HMECENTRALIZA,
                 H.HMEDESTACADO,
                 H.HMEDATA,
                 H.HMEDATAPREVISTA,
                 H.HMEDATAEFETIVA,
                 H.HMEDATAATUALIZA,
                 H.HMEANOCOMPETENCIA,
                 H.HMEMESCOMPETENCIA,
                 H.HMEANOCOBRANCA,
                 H.HMEMESCOBRANCA,
                 H.HMEVLRPREVISTO,
                 H.HMEVLREFETIVO,
                 H.HMESALDODEV,
                 H.HMETXJUROS,
                 H.IDREGRA,
                 H.FLGBAIXADO,
                 H.FLGENVIO,
                 H.IDRUBRICA,
                 H.HMERECPAG,
                 H.HMENUMPARCELAS,
                 H.HMEDATAVENCTO,
                 H.FLGTIPODIVERG,
                 H.TRGDTINCLUSAO,
                 H.TRGUSERINCLUSAO,
                 H.VERSAO,
                 H.HMEPARCELAALT,
                 H.IDPATRO,
                 H.ORIGEMRECURSO, 
                 H.IDCBANCARIA
             )
             VALUES
             (
                 :IDHISTMOVEMPTMO_P,
                 :NUMEROCONTRATO_P,
                 :IDITEMCENTRALIZA_P,
                 :IDITEM_P,
                 :PARCELA_P,
                 :TIPOMOVIMENTO_P,
                 :ORIGEM_P,
                 :FORMACOBRANCA_P,
                 :SEQUENCIACOBRANCA_P,
                 :PRIORIDADE_P,
                 :CENTRALIZA_P,
                 :DESTACADO_P,
                 :DATA_P,
                 :DATAPREVISTA_P,
                 :DATAEFETIVA_P,
                 :DATAATUALIZACAO_P,
                 :ANOCOMPETENCIA_P,
                 :MESCOMPETENCIA_P,
                 :ANOCOBRANCA_P,
                 :MESCOBRANCA_P,
                 :VALORPREVISTO_P,
                 :VALOREFETIVO_P,
                 :SALDODEVEDOR_P,
                 :TAXAJUROS_P,
                 :IDREGRA_P,
                 :BAIXADO_P,
                 :ENVIADO_P,
                 :RUBRICA_P,
                 :PAGARRECEBER_P,
                 :NUMEROPARCELAS_P,
                 :DATAVENCIMENTO_P,
                 :TIPODIVERGENCIA_P,
                 :DATAINCLUSAO_P,
                 :USUARIOINCLUSAO_P,
                 :VERSAO_P,
                 :PARCELAALTERNATIVA_P,
                 :IDPATROCINADORA_P,
                 :ORIGEMRECURSO_P,
                 :IDCBANCARIA_P
             )";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, historico.id);
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, historico.numeroContrato);

                if (historico.itemCentraliza != null)
                    bancoDeDados.AddInParameter(comando, "IDITEMCENTRALIZA_P", DbType.Int32, historico.itemCentraliza.id);
                else
                    bancoDeDados.AddInParameter(comando, "IDITEMCENTRALIZA_P", DbType.Int32, null);

                bancoDeDados.AddInParameter(comando, "IDITEM_P", DbType.Int32, historico.item.id);
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, historico.parcela);
                bancoDeDados.AddInParameter(comando, "TIPOMOVIMENTO_P", DbType.Int32, historico.tipoMovimento?.chave);
                bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, historico.origem.chave);
                bancoDeDados.AddInParameter(comando, "FORMACOBRANCA_P", DbType.String, historico.formaCobranca);
                bancoDeDados.AddInParameter(comando, "SEQUENCIACOBRANCA_P", DbType.Int32, historico.sequenciaCobranca);
                bancoDeDados.AddInParameter(comando, "PRIORIDADE_P", DbType.Int32, historico.prioridade);
                bancoDeDados.AddInParameter(comando, "CENTRALIZA_P", DbType.Int32, historico.centraliza);
                bancoDeDados.AddInParameter(comando, "DESTACADO_P", DbType.Int32, historico.destacado);
                bancoDeDados.AddInParameter(comando, "DATA_P", DbType.DateTime, historico.data);
                bancoDeDados.AddInParameter(comando, "DATAPREVISTA_P", DbType.DateTime, historico.dataPrevista);

                if (historico.dataEfetiva.HasValue)
                    bancoDeDados.AddInParameter(comando, "DATAEFETIVA_P", DbType.DateTime, historico.dataEfetiva.Value);
                else
                    bancoDeDados.AddInParameter(comando, "DATAEFETIVA_P", DbType.DateTime, null);

                bancoDeDados.AddInParameter(comando, "DATAATUALIZACAO_P", DbType.DateTime, historico.dataAtualizacao);
                bancoDeDados.AddInParameter(comando, "ANOCOMPETENCIA_P", DbType.Int32, historico.anoCompetencia);
                bancoDeDados.AddInParameter(comando, "MESCOMPETENCIA_P", DbType.Int32, historico.mesCompetencia);
                bancoDeDados.AddInParameter(comando, "ANOCOBRANCA_P", DbType.Int32, historico.anoCobranca);
                bancoDeDados.AddInParameter(comando, "MESCOBRANCA_P", DbType.Int32, historico.mesCobranca);
                bancoDeDados.AddInParameter(comando, "VALORPREVISTO_P", DbType.Double, historico.valorPrevisto);

                if (historico.valorEfetivo.HasValue)
                    bancoDeDados.AddInParameter(comando, "VALOREFETIVO_P", DbType.Double, historico.valorEfetivo.Value);
                else
                    bancoDeDados.AddInParameter(comando, "VALOREFETIVO_P", DbType.Double, null);

                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, historico.saldoDevedor);

                if (historico.taxaJuros.HasValue)
                    bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, historico.taxaJuros.Value);
                else
                    bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, null);

                bancoDeDados.AddInParameter(comando, "IDREGRA_P", DbType.Int32, historico.item?.regra?.id);
                bancoDeDados.AddInParameter(comando, "BAIXADO_P", DbType.Int32, historico.baixado);
                bancoDeDados.AddInParameter(comando, "ENVIADO_P", DbType.Int32, historico.enviado);
                bancoDeDados.AddInParameter(comando, "RUBRICA_P", DbType.Int32, historico.rubrica);
                bancoDeDados.AddInParameter(comando, "PAGARRECEBER_P", DbType.String, historico.pagarReceber);
                bancoDeDados.AddInParameter(comando, "NUMEROPARCELAS_P", DbType.Int32, historico.numeroParcelas);
                bancoDeDados.AddInParameter(comando, "DATAVENCIMENTO_P", DbType.DateTime, historico.dataVencimento);
                bancoDeDados.AddInParameter(comando, "TIPODIVERGENCIA_P", DbType.Int32, historico.tipoDivergencia);
                bancoDeDados.AddInParameter(comando, "DATAINCLUSAO_P", DbType.DateTime, historico.dataInclusao);
                bancoDeDados.AddInParameter(comando, "USUARIOINCLUSAO_P", DbType.String, login);
                //William Moreira da Silva - SOL 250843
                //bancoDeDados.AddInParameter(comando, "VERSAO_P", DbType.String, historico.versao);
                bancoDeDados.AddInParameter(comando, "VERSAO_P", DbType.String, String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "W"));
                //William Moreira da Silva - SOL 250843
                bancoDeDados.AddInParameter(comando, "PARCELAALTERNATIVA_P", DbType.Int32, historico.parcelaAlternativa);
                bancoDeDados.AddInParameter(comando, "IDPATROCINADORA_P", DbType.Int32, historico.patrocinadora.id);
                bancoDeDados.AddInParameter(comando, "ORIGEMRECURSO_P", DbType.String, historico.origemRecurso);

                //William Moreira da Silva - SOL 216458 KTN - INICIO
                if (historico.dadosBancarios != null)
                {
                    bancoDeDados.AddInParameter(comando, "IDCBANCARIA_P", DbType.Int32, historico.dadosBancarios.id);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "IDCBANCARIA_P", DbType.Int32, null);
                }
                //William Moreira da Silva - SOL 216458 KTN - FIM

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        /// <summary>
        /// Inclui histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        public void incluirNovo(Historico historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            historico.id = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQHISTMOVEMPTMO", true);

            AcessoContrato acessoContrato = new AcessoContrato();
            string login = string.Format("CM{0}", acessoContrato.obterIdPlanus(historico.usuarioInclusao));

            string query;

            query = @" INSERT INTO HISTMOVEMPTMO H 
             (
                 H.IDHISTMOVEMPTMO,
                 H.IDCONTRATOEMPTMO,
                 H.HMETIPOMOV,
                 H.IDITEMEMPTMO,
                 H.HMEPARCELA,
                 H.HMEPARCELAALT,
                 H.HMESEQCOBRANCA,
                 H.HMENUMPARCELAS,
                 H.HMEMESCOMPETENCIA,
                 H.HMEANOCOMPETENCIA,
                 H.HMEMESCOBRANCA,
                 H.HMEANOCOBRANCA,
                 H.HMEFORMACOBRANCA,
                 H.HMETIPOFOLHA,
                 H.HMEDATAPREVISTA,
                 H.HMEDATAVENCTO,
                 H.HMEDATAEFETIVA,
                 H.HMESALDODEV,
                 H.HMEDATAATUALIZA,
                 H.HMEVLRPREVISTO,
                 H.HMEVLREFETIVO,
                 H.HMEVLRBASE,
                 H.HMETXJUROS,
                 H.PLNCODIGO,
                 H.FLGABONADO,
                 H.FLGQUITADO,
                 H.HMEDATAQUITABONO,
                 H.FLGBAIXADO,
                 H.FLGBAIXAMANUAL,
                 H.HMEDATAESTORNO,
                 H.FLGESTORNADO,
                 H.PLNCODIGOESTORNO,
                 H.FLGENVIO,
                 H.CODDOCUMENTO,
                 H.IDTMPDESC,
                 H.FLGDIVERGPEND,
                 H.FLGTIPODIVERG,
                 H.FLGDIVERGTRAT,
                 H.FLGENTRADAMANUAL,
                 H.FLGSUSPENSAO,
                 H.IDTIPOSUSPEMPTMO,
                 H.HMERECPAG,
                 H.HMECENTRALIZA,
                 H.HMEDESTACADO,
                 H.IDTIPORECURSO,
                 H.ORIGEMRECURSO,
                 H.FLGTRATINDIV,
                 H.HMEDATATRATINDIV,
                 H.HMEOBSERVACAO,
                 H.HMEORIGEM,
                 H.TRGUSERINCLUSAO,
                 H.HMEDATADIVERGTRAT,
                 H.VERSAO,
                 H.HMEPRIORIDADE,
                 H.HMEDATA
             )
             VALUES
             (
                 :IDHISTMOVEMPTMO_P,
                 :IDCONTRATOEMPTMO_P,
                 :HMETIPOMOV_P,
                 :IDITEMEMPTMO_P,
                 :HMEPARCELA_P,
                 :HMEPARCELAALT_P,
                 :HMESEQCOBRANCA_P,
                 :HMENUMPARCELAS_P,
                 :HMEMESCOMPETENCIA_P,
                 :HMEANOCOMPETENCIA_P,
                 :HMEMESCOBRANCA_P,
                 :HMEANOCOBRANCA_P,
                 :HMEFORMACOBRANCA_P,
                 :HMETIPOFOLHA_P,
                 :HMEDATAPREVISTA_P,
                 :HMEDATAVENCTO_P,
                 :HMEDATAEFETIVA_P,
                 :HMESALDODEV_P,
                 :HMEDATAATUALIZA_P,
                 :HMEVLRPREVISTO_P,
                 :HMEVLREFETIVO_P,
                 :HMEVLRBASE_P,
                 :HMETXJUROS_P,
                 :PLNCODIGO_P,
                 :FLGABONADO_P,
                 :FLGQUITADO_P,
                 :HMEDATAQUITABONO_P,
                 :FLGBAIXADO_P,
                 :FLGBAIXAMANUAL_P,
                 :HMEDATAESTORNO_P,
                 :FLGESTORNADO_P,
                 :PLNCODIGOESTORNO_P,
                 :FLGENVIO_P,
                 :CODDOCUMENTO_P,
                 :IDTMPDESC_P,
                 :FLGDIVERGPEND_P,
                 :FLGTIPODIVERG_P,
                 :FLGDIVERGTRAT_P,
                 :FLGENTRADAMANUAL_P,
                 :FLGSUSPENSAO_P,
                 :IDTIPOSUSPEMPTMO_P,
                 :HMERECPAG_P,
                 :HMECENTRALIZA_P,
                 :HMEDESTACADO_P,
                 :IDTIPORECURSO_P,
                 :ORIGEMRECURSO_P,
                 :FLGTRATINDIV_P,
                 :HMEDATATRATINDIV_P,
                 :HMEOBSERVACAO_P,
                 :HMEORIGEM_P,
                 :TRGUSERINCLUSAO,
                 :DATADIVERGTRAT_P,
                 :VERSAO_P,
                 :HMEPRIORIDADE_P,
                 :HMEDATA_P )";
            //William Moreira da Silva - SOL 250843 - Inclusão do paramentro DATADIVERGTRAT e VERSAO

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //IDHISTMOVEMPTMO
                bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, historico.id);

                //Numero Contrato
                if (historico.numeroContrato > 0)
                    bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, historico.numeroContrato);
                else
                    bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, DBNull.Value);

                //Evento
                //Willliam Moreira da Silva - SOL 207977
                if (historico.tipoMovimento.chave > 0)
                    bancoDeDados.AddInParameter(comando, "HMETIPOMOV_P", DbType.Int64, historico.tipoMovimento.chave);
                //Willliam Moreira da Silva - SOL 207977
                else
                    bancoDeDados.AddInParameter(comando, "HMETIPOMOV_P", DbType.Int64, DBNull.Value);

                //Item
                if (historico.item.id > 0)
                    bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, historico.item.id);
                else
                    bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, DBNull.Value);

                //Parcela
                if (historico.parcela.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEPARCELA_P", DbType.Int64, historico.parcela);
                else
                    bancoDeDados.AddInParameter(comando, "HMEPARCELA_P", DbType.Int64, DBNull.Value);

                //Parcela Alt
                if (historico.parcelaAlternativa > 0)
                    bancoDeDados.AddInParameter(comando, "HMEPARCELAALT_P", DbType.Int64, historico.parcelaAlternativa);
                else
                    bancoDeDados.AddInParameter(comando, "HMEPARCELAALT_P", DbType.Int64, DBNull.Value);

                //Seq - 
                if (historico.sequenciaCobranca > 0)
                    bancoDeDados.AddInParameter(comando, "HMESEQCOBRANCA_P", DbType.Int64, historico.sequenciaCobranca);
                else
                    bancoDeDados.AddInParameter(comando, "HMESEQCOBRANCA_P", DbType.Int64, DBNull.Value);

                //Restam - Numero Parcela
                if (historico.numeroParcelas > 0)
                    bancoDeDados.AddInParameter(comando, "HMENUMPARCELAS_P", DbType.Int64, historico.numeroParcelas);
                else
                    bancoDeDados.AddInParameter(comando, "HMENUMPARCELAS_P", DbType.Int64, DBNull.Value);

                //Mes competencia
                if (historico.mesCompetencia.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEMESCOMPETENCIA_P", DbType.Int64, historico.mesCompetencia);
                else
                    bancoDeDados.AddInParameter(comando, "HMEMESCOMPETENCIA_P", DbType.Int64, DBNull.Value);

                //Ano competencia
                if (historico.anoCompetencia.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEANOCOMPETENCIA_P", DbType.Int64, historico.anoCompetencia);
                else
                    bancoDeDados.AddInParameter(comando, "HMEANOCOMPETENCIA_P", DbType.Int64, DBNull.Value);

                //Mes cobrança
                if (historico.mesCobranca.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEMESCOBRANCA_P", DbType.Int64, historico.mesCobranca);
                else
                    bancoDeDados.AddInParameter(comando, "HMEMESCOBRANCA_P", DbType.Int64, DBNull.Value);

                //Ano cobrança
                if (historico.anoCobranca.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEANOCOBRANCA_P", DbType.Int64, historico.anoCobranca);
                else
                    bancoDeDados.AddInParameter(comando, "HMEANOCOBRANCA_P", DbType.Int64, DBNull.Value);

                //Forma Cobranca
                bancoDeDados.AddInParameter(comando, "HMEFORMACOBRANCA_P", DbType.String, historico.formaCobranca);

                //Tipo Folha
                bancoDeDados.AddInParameter(comando, "HMETIPOFOLHA_P", DbType.String, historico.tipoFolha);

                //Data Prevista
                if (historico.dataPrevista.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAPREVISTA_P", DbType.DateTime, historico.dataPrevista);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAPREVISTA_P", DbType.DateTime, DBNull.Value);

                //Data Vencimento
                if (historico.dataVencimento.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAVENCTO_P", DbType.DateTime, historico.dataVencimento);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAVENCTO_P", DbType.DateTime, DBNull.Value);

                //Data Efetiva
                if (historico.dataEfetiva.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAEFETIVA_P", DbType.DateTime, historico.dataEfetiva);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAEFETIVA_P", DbType.DateTime, DBNull.Value);

                //Saldo Devedor
                if (historico.saldoDevedor > 0)
                    bancoDeDados.AddInParameter(comando, "HMESALDODEV_P", DbType.Double, historico.saldoDevedor);
                else
                    bancoDeDados.AddInParameter(comando, "HMESALDODEV_P", DbType.Double, DBNull.Value);

                //Data Atualizacao
                if (historico.dataAtualizacao > DateTime.MinValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAATUALIZA_P", DbType.DateTime, historico.dataAtualizacao);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAATUALIZA_P", DbType.DateTime, DBNull.Value);

                //Valor Previsto
                if (historico.valorPrevisto > 0)
                    bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, historico.valorPrevisto);
                else
                    bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, DBNull.Value);

                //Valor Efetivo
                if (historico.valorEfetivo.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEVLREFETIVO_P", DbType.Double, historico.valorEfetivo);
                else
                    bancoDeDados.AddInParameter(comando, "HMEVLREFETIVO_P", DbType.Double, DBNull.Value);

                //Valor Base
                if (historico.valorBase.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEVLRBASE_P", DbType.Double, historico.valorBase);
                else
                    bancoDeDados.AddInParameter(comando, "HMEVLRBASE_P", DbType.Double, DBNull.Value);

                //Taxa Juros
                if (historico.taxaJuros.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMETXJUROS_P", DbType.Double, historico.taxaJuros.Value);
                else
                    bancoDeDados.AddInParameter(comando, "HMETXJUROS_P", DbType.Double, DBNull.Value);

                //Planilha - PLNCODIGO
                if (historico.planilha.HasValue)
                    bancoDeDados.AddInParameter(comando, "PLNCODIGO_P", DbType.Int64, historico.planilha);
                else
                    bancoDeDados.AddInParameter(comando, "PLNCODIGO_P", DbType.Int64, DBNull.Value);

                //Abonado
                if (historico.abonado.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGABONADO_P", DbType.Int64, historico.abonado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGABONADO_P", DbType.Int64, DBNull.Value);

                //Quitado
                if (historico.quitado.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGQUITADO_P", DbType.Int64, historico.quitado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGQUITADO_P", DbType.Int64, DBNull.Value);

                //Data Abono/Quitacao
                if (historico.dataAbonoQuitacao.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAQUITABONO_P", DbType.DateTime, historico.dataAbonoQuitacao);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAQUITABONO_P", DbType.DateTime, DBNull.Value);

                //Baixado
                if (historico.baixado.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGBAIXADO_P", DbType.Int64, historico.baixado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGBAIXADO_P", DbType.Int64, DBNull.Value);

                //Baixa Manual
                if (historico.baixaManual.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGBAIXAMANUAL_P", DbType.Int64, historico.baixaManual);
                else
                    bancoDeDados.AddInParameter(comando, "FLGBAIXAMANUAL_P", DbType.Int64, DBNull.Value);

                //Data Estorno
                if (historico.dataDoEstorno.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAESTORNO_P", DbType.DateTime, historico.dataDoEstorno);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAESTORNO_P", DbType.DateTime, DBNull.Value);

                //Estornado
                if (historico.estorno.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGESTORNADO_P", DbType.Int64, historico.estorno);
                else
                    bancoDeDados.AddInParameter(comando, "FLGESTORNADO_P", DbType.Int64, DBNull.Value);

                //PLN
                if (historico.plnCodEstorno.HasValue)
                    bancoDeDados.AddInParameter(comando, "PLNCODIGOESTORNO_P", DbType.Int64, historico.plnCodEstorno);
                else
                    bancoDeDados.AddInParameter(comando, "PLNCODIGOESTORNO_P", DbType.Int64, DBNull.Value);

                //Enviado
                //William Moreira da Silva - SOL 207977
                //if(historico.enviado.HasValue)
                if (historico.envio.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, historico.enviado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, DBNull.Value);


                //Cod Documento
                if (historico.codigoDocumento.HasValue)
                    bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, historico.codigoDocumento);
                else
                    bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, DBNull.Value);

                //IdTmpDesc
                if (historico.idTipoSusp.HasValue)
                    bancoDeDados.AddInParameter(comando, "IDTMPDESC_P", DbType.Int64, historico.codigoDocumento);
                else
                    bancoDeDados.AddInParameter(comando, "IDTMPDESC_P", DbType.Int64, DBNull.Value);

                //Divergente
                if (historico.divergencia.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGPEND_P", DbType.Int64, historico.divergencia);
                else
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGPEND_P", DbType.Int64, DBNull.Value);

                //Motivo Divergencia
                if (historico.tipoDivergencia > 0)
                    bancoDeDados.AddInParameter(comando, "FLGTIPODIVERG_P", DbType.Int64, historico.tipoDivergencia);
                else
                    bancoDeDados.AddInParameter(comando, "FLGTIPODIVERG_P", DbType.Int64, DBNull.Value);

                //Divergencia Tratada
                if (historico.divergenciaTratada.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGTRAT_P", DbType.Int64, historico.divergenciaTratada);
                else
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGTRAT_P", DbType.Int64, DBNull.Value);

                //Entrada Manual
                if (historico.entradaManual.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGENTRADAMANUAL_P", DbType.Int64, historico.entradaManual);
                else
                    bancoDeDados.AddInParameter(comando, "FLGENTRADAMANUAL_P", DbType.Int64, DBNull.Value);

                //Suspencao
                if (historico.suspenso.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGSUSPENSAO_P", DbType.Int64, historico.suspenso);
                else
                    bancoDeDados.AddInParameter(comando, "FLGSUSPENSAO_P", DbType.Int64, DBNull.Value);

                //IdTipoSusp
                if (historico.idTipoSusp.HasValue)
                    bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int64, historico.idTipoSusp);
                else
                    bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int64, DBNull.Value);

                //Pagar Receber
                bancoDeDados.AddInParameter(comando, "HMERECPAG_P", DbType.String, historico.pagarReceber);

                //Centralizado
                if (historico.centraliza.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMECENTRALIZA_P", DbType.Int64, historico.centraliza);
                else
                    bancoDeDados.AddInParameter(comando, "HMECENTRALIZA_P", DbType.Int64, DBNull.Value);

                //Destacado
                if (historico.destacado.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDESTACADO_P", DbType.Int64, historico.destacado);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDESTACADO_P", DbType.Int64, DBNull.Value);

                //William Moreira da Silva - SOL 207977
                if (historico.tipoRecurso != null && historico.tipoRecurso.id > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDTIPORECURSO_P", DbType.Int32, historico.tipoRecurso.id);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "IDTIPORECURSO_P", DbType.Int32, DBNull.Value);
                }
                bancoDeDados.AddInParameter(comando, "ORIGEMRECURSO_P", DbType.String, historico.origemRecurso);

                if (historico.tratamentoIndividual.HasValue)
                {
                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int32, historico.tratamentoIndividual);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, historico.data);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int32, DBNull.Value);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, DBNull.Value);
                }
                bancoDeDados.AddInParameter(comando, "HMEOBSERVACAO_P", DbType.String, historico.observacao);

                if (historico.origem.chave > 0)
                {
                    bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, historico.origem.chave);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, DBNull.Value);
                }
                //William Moreira da Silva - SOL 207977

                bancoDeDados.AddInParameter(comando, "TRGUSERINCLUSAO", DbType.String, login);

                //William Moreira da Silva - SOL 250843
                bancoDeDados.AddInParameter(comando, "DATADIVERGTRAT_P", DbType.DateTime, DateTime.Today);

                //bancoDeDados.AddInParameter(comando, "VERSAO_P", DbType.String, historico.versao);
                bancoDeDados.AddInParameter(comando, "VERSAO_P", DbType.String, String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "W"));

                bancoDeDados.AddInParameter(comando, "HMEPRIORIDADE_P", DbType.Int32, historico.prioridade);

                bancoDeDados.AddInParameter(comando, "HMEDATA_P", DbType.DateTime, historico.dataPrevista);
                //William Moreira da Silva - SOL 250843

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        #endregion

        #region Consulta

        /// <summary>
        /// Consulta histórico
        /// </summary>
        /// <param name="historico">Histórico a ser filtrado</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o(s) histórico(s) encontrado(s).</returns>
        public List<Historico> consultar(Historico historico, ref ParametrosConsulta parametros)
        {
            StringBuilder query = new StringBuilder();

            bool envio = Convert.ToBoolean(historico.envio);
            bool internos = historico.filtroHistorico.internos;
            int estorno = historico.filtroHistorico.estorno;
            int emAberto = historico.filtroHistorico.emAberto;
            bool atualizacaoDiaria = historico.filtroHistorico.atualizacaoDiaria;
            bool evento = historico.tipoMovimento != TipoEvento.nenhum;
            bool itemFiltro = historico.item != null && historico.item.id >= 0;
            bool dataCobrancaDe = historico.filtroHistorico.mesCobrancaDe != null && historico.filtroHistorico.anoCobrancaDe != null;
            bool dataCobrancaAte = historico.filtroHistorico.mesCobrancaAte != null && historico.filtroHistorico.anoCobrancaAte != null;
            bool dataPrevistaDe = historico.filtroHistorico.dataPrevistaDe != null;
            bool dataPrevistaAte = historico.filtroHistorico.dataPrevistaAte != null;
            bool parcela = historico.parcela != null;
            bool campoOrdenacao = historico.filtroHistorico.campoOrdenacao != null && !String.IsNullOrEmpty(historico.filtroHistorico.campoOrdenacao);

            // Consulta
            query.Append("SELECT DECODE(H.HMETIPOMOV, ");
            query.Append("          0, 'Concessão/Renovação', ");
            query.Append("          1, 'Prestação ', ");
            query.Append("          2, 'Amortização/Refinanciamento', ");
            query.Append("          3, 'Quitação', ");
            query.Append("          4, 'Atualização de Débito', ");
            query.Append("          5, 'Atualização de Saldo (Diária)', ");
            query.Append("          6, 'Importação/Migração', ");
            query.Append("          7, 'Ajustes (Cobrança/Devolução)', ");
            query.Append("          8, 'Ajustes (Saldo Devedor)') AS EVENTO, ");
            query.Append("       H.IDITEMEMPTMO, ");
            query.Append("       I.ITEDESCRICAO, ");
            query.Append("       NVL(H.HMEPARCELA,0), ");
            query.Append("       NVL(H.HMENUMPARCELAS,0), ");
            query.Append("       H.HMESEQCOBRANCA, ");
            query.Append("       to_char(H.HMEVLRPREVISTO), ");
            query.Append("       H.HMEMESCOMPETENCIA, ");
            query.Append("       H.HMEANOCOMPETENCIA, ");
            query.Append("       H.HMEMESCOBRANCA, ");
            query.Append("       H.HMEANOCOBRANCA, ");
            query.Append("       H.HMEDATAVENCTO, ");
            query.Append("       H.HMEDATAPREVISTA, ");
            query.Append("       H.HMEDATAEFETIVA, ");
            query.Append("       TO_CHAR(H.HMEVLREFETIVO) AS HMEVLREFETIVO, ");
            query.Append("       to_char(NVL(H.HMESALDODEV,0)), ");
            query.Append("       H.FLGENVIO, ");
            query.Append("       H.HMEDATAENVIO, ");
            query.Append("       H.HMEDATARECEB, ");
            query.Append("       to_char(H.HMETXJUROS), ");
            query.Append("       H.IDTIPOSUSPEMPTMO, ");
            query.Append("       S.TSEDESCRICAO, ");
            query.Append("       H.HMETIPOMOV, ");
            query.Append("       H.IDHISTMOVEMPTMO, ");
            // SOL 202210
            query.Append("       case ");
            query.Append("          when (h.flgestornado = 1) then ");
            query.Append("             '(estornado)' ");
            query.Append("          when (h.flgabonado = 1) then ");
            query.Append("             '(abonado)' ");
            query.Append("          when (h.flgquitado = 1) then ");
            query.Append("             '(quitado)' ");
            query.Append("          when (h.flgsuspensao = 1) then ");
            query.Append("             '(suspenso)' ");
            query.Append("          else ");
            //query.Append("             to_char(nvl(H.HMEVLREFETIVO, 0)) ");
            query.Append("  NVL( TO_CHAR ( H.HMEVLREFETIVO,'FM999G999G990D00' ),'' ) ");//William Moreira da Silva - SOL 235173
            query.Append("       end HMEVLREFETIVOTEXTO, ");
            query.Append("       NVL(H.HMEPARCELAALT,0) ");
            // SOL 202210  
            query.Append("  FROM HISTMOVEMPTMO H, CM.ITEMEMPTMO I, CM.TIPOSUSPEMPTMO S, CM.ITEMXTIPOCONTR T, CM.CONTRATOEMPTMO C ");
            query.Append(" WHERE I.IDITEMEMPTMO = H.IDITEMEMPTMO ");
            query.Append("       AND   H.IDTIPOSUSPEMPTMO  = S.IDTIPOSUSPEMPTMO (+)  ");
            query.Append("       AND   T.IDITEMEMPTMO      = H.IDITEMEMPTMO ");
            query.Append("       AND   T.IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO ");
            query.Append("       AND   C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO ");
            query.Append("       AND   H.IDCONTRATOEMPTMO  = :NUMERO_P ");

            // Filtros
            if (envio && !internos)
            {
                query.Append(" AND (H.HMECENTRALIZA = 1 OR H.HMEDESTACADO = 1) ");//Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Fim 
                //query.Append(" AND (((H.HMECENTRALIZA = 1) OR (H.HMEDESTACADO = 1)) OR (H.HMETIPOMOV = 3 AND H.HMEORIGEM = 8)) ");//William Moreira da Silva SOL 210452 KINTANA 2029466
            }

            if (internos && !envio)
            {
                query.Append(" AND HMECENTRALIZA = 0 AND HMEDESTACADO = 0 ");
            }

            //Estorno
            switch (estorno)
            {
                case 2:
                    query.Append(" AND NVL(H.FLGESTORNADO,0) = 0 ");
                    break;
                case 3:
                    query.Append(" AND H.FLGESTORNADO = 1 ");
                    break;
            }

            //Em Aberto
            switch (emAberto)
            {
                case 2:
                    query.Append(" AND (H.HMEDATAEFETIVA IS NOT NULL AND H.HMEVLREFETIVO IS NOT NULL AND NVL(H.FLGBAIXADO,1) = 1 )");
                    break;
                case 3:
                    query.Append(" AND (H.HMEDATAEFETIVA IS NULL AND H.HMEVLREFETIVO IS NULL AND H.FLGBAIXADO = 0 ) ");
                    break;
            }

            //Atualização diária e evento
            if (!atualizacaoDiaria && evento)
                query.Append("AND (H.HMETIPOMOV <> 5 AND H.HMETIPOMOV = :EVENTO_P  ) ");
            else if (!atualizacaoDiaria)
                query.Append(" AND H.HMETIPOMOV <> 5 ");
            else if (evento)
                query.Append(" AND H.HMETIPOMOV = :EVENTO_P ");

            if (itemFiltro)
                query.Append(" AND H.IDITEMEMPTMO = :ITEM_P ");

            if (parcela)
                query.Append("AND H.HMEPARCELA = :PARCELA_P ");

            if (dataCobrancaDe && dataCobrancaAte)
            {
                query.Append("AND H.HMEMESCOBRANCA BETWEEN  :MESCOBRANCADE_P AND :MESCOBRANCAATE_P ");
                query.Append("AND H.HMEANOCOBRANCA BETWEEN  :ANOCOBRANCADE_P AND :ANOCOBRANCAATE_P ");
            }
            else if (dataCobrancaDe)
            {
                query.Append("AND H.HMEMESCOBRANCA >= :MESCOBRANCADE_P ");
                query.Append("AND H.HMEANOCOBRANCA >= :ANOCOBRANCADE_P ");
            }
            else if (dataCobrancaAte)
            {
                query.Append("AND H.HMEMESCOBRANCA <= :MESCOBRANCAATE_P ");
                query.Append("AND H.HMEANOCOBRANCA <= :ANOCOBRANCAATE_P ");
            }

            if (dataPrevistaDe && dataPrevistaAte)
                query.Append("AND H.HMEDATAPREVISTA BETWEEN :DATAPREVISTADE_P  AND :DATAPREVISTAATE_P ");
            else if (dataPrevistaDe)
                query.Append("AND H.HMEDATAPREVISTA >= :DATAPREVISTADE_P ");
            else if (dataPrevistaAte)
                query.Append("AND H.HMEDATAPREVISTA <= :DATAPREVISTAATE_P ");

            if (campoOrdenacao)
                // Thiago Melo SOL 201148 KINTANA 1944054 INI                
                query.AppendFormat("ORDER BY {0} ", historico.filtroHistorico.campoOrdenacao);
            //query.AppendFormat("ORDER BY {0}, T.ITCSEQCALCULO ", historico.filtroHistorico.campoOrdenacao);                               
            // Thiago Melo SOL 201148 KINTANA 1944054 FIM
            //William Moreira da Silva - SOL 220732 KTN 2053571

            //William Moreira da Silva SOL 235173
            query.Append(" ,NVL(T.ITCORDEMEXTRATO, 0) ");
            //William Moreira da Silva SOL 235173

            query.Append("  ,H.HMEPARCELA");
            query.Append(" ,Decode(H.HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8)");//William Moreira da Silva - SOL 201217
            query.Append("   ,H.HMECENTRALIZA, ");
            query.Append(" H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA, ");
            query.Append(" H.HMEANOCOBRANCA, H.HMEMESCOBRANCA, ");
            query.Append(" H.HMESEQCOBRANCA, T.ITCSEQCALCULO ");
            //William Moreira da Silva - SOL 220732 KTN 2053571

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando;
            if (parametros != null && parametros.paginacao != null)
                comando = bancoDeDados.GetSqlStringCommand(UtilidadesAcessoDados.obterQueryPaginada(query.ToString(), parametros.paginacao.indiceLinha, parametros.paginacao.maximoLinhas));
            else
                comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.String, historico.numeroContrato.ToString());

            if (evento)
                bancoDeDados.AddInParameter(comando, "EVENTO_P", DbType.String, historico.tipoMovimento.chave.ToString());

            if (itemFiltro)
                bancoDeDados.AddInParameter(comando, "ITEM_P", DbType.Int32, historico.item.id);

            if (parcela)
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, historico.parcela);

            if (dataCobrancaDe)
            {
                bancoDeDados.AddInParameter(comando, "MESCOBRANCADE_P", DbType.Int32, historico.filtroHistorico.mesCobrancaDe);
                bancoDeDados.AddInParameter(comando, "ANOCOBRANCADE_P", DbType.Int32, historico.filtroHistorico.anoCobrancaDe);
            }

            if (dataCobrancaAte)
            {
                bancoDeDados.AddInParameter(comando, "MESCOBRANCAATE_P", DbType.Int32, historico.filtroHistorico.mesCobrancaAte);
                bancoDeDados.AddInParameter(comando, "ANOCOBRANCAATE_P", DbType.Int32, historico.filtroHistorico.anoCobrancaAte);
            }

            if (dataPrevistaDe)
                bancoDeDados.AddInParameter(comando, "DATAPREVISTADE_P", DbType.DateTime, historico.filtroHistorico.dataPrevistaDe);

            if (dataPrevistaAte)
                bancoDeDados.AddInParameter(comando, "DATAPREVISTAATE_P", DbType.DateTime, historico.filtroHistorico.dataPrevistaAte);

            // Popula objetos resultantes
            List<Historico> historicos = new List<Historico>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Historico itemHistorico = new Historico();
                    itemHistorico.id = Convert.ToInt64(leitor.GetValue(IDHISTMOVEMPTMO_HISTORICO));
                    itemHistorico.parcela = Convert.ToInt32(leitor.GetValue(HMEPARCELA_HISTORICO));
                    itemHistorico.numeroParcelas = Convert.ToInt32(leitor.GetValue(HMENUMPARCELAS_HISTORICO));
                    itemHistorico.sequenciaCobranca = Convert.ToInt32(leitor.GetValue(HMESEQCOBRANCA_HISTORICO));
                    itemHistorico.valorPrevisto = (double)leitor.obterDecimal(HMEVLRPREVISTO_HISTORICO);
                    itemHistorico.mesCompetencia = leitor.obterValorInteiro(HMEMESCOMPETENCIA_HISTORICO) != null ? leitor.obterValorInteiro(HMEMESCOMPETENCIA_HISTORICO) : null;
                    itemHistorico.anoCompetencia = leitor.obterValorInteiro(HMEANOCOMPETENCIA_HISTORICO) != null ? leitor.obterValorInteiro(HMEANOCOMPETENCIA_HISTORICO) : null;
                    itemHistorico.mesCobranca = leitor.obterValorInteiro(HMEMESCOBRANCA_HISTORICO);
                    itemHistorico.anoCobranca = leitor.obterValorInteiro(HMEANOCOBRANCA_HISTORICO);
                    itemHistorico.dataPrevista = leitor.GetDateTime(HMEDATAPREVISTA_HISTORICO);
                    itemHistorico.dataEfetiva = leitor.obterValorData(HMEDATAEFETIVA_HISTORICO);
                    itemHistorico.valorEfetivo = leitor.obterValorDecimal(HMEVLREFETIVO_HISTORICO) != null ? (double?)leitor.obterValorDecimal(HMEVLREFETIVO_HISTORICO) : null;
                    itemHistorico.valorEfetivoTexto = leitor.obterString(HMEVLREFETIVO_HISTORICO_TEXTO); // SOL 202210
                    itemHistorico.saldoDevedor = (double)leitor.obterDecimal(HMESALDODEV_HISTORICO);
                    itemHistorico.enviado = leitor.obterValorInteiro(FLGENVIO_HISTORICO);
                    itemHistorico.dataEnvio = leitor.obterValorData(HMEDATAENVIO_HISTORICO);
                    itemHistorico.dataRecebimento = leitor.obterValorData(HMEDATARECEB_HISTORICO);
                    itemHistorico.taxaJuros = leitor.obterValorDecimal(HMETXJUROS_HISTORICO) != null ? (double?)leitor.obterValorDecimal(HMETXJUROS_HISTORICO) : null;
                    itemHistorico.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(HMETIPOMOV_HISTORICO)));

                    itemHistorico.item = new ItemContrato()
                    {
                        id = Convert.ToInt32(leitor.GetValue(IDITEMEMPTMO_HISTORICO)),
                        descricao = leitor.obterString(ITEDESCRICAO_HISTORICO),
                    };

                    itemHistorico.tipoSuspensao = new TipoSuspensao()
                    {
                        descricao = leitor.obterString(TSEDESCRICAO_HISTORICO)
                    };
                    itemHistorico.dataVencimento = leitor.obterValorData(HMEDATAVENCTO_HISTORICO);
                    //William Moreira da Silva SOL 235173
                    itemHistorico.parcelaCompleta = string.Format("{0}/{1}/{2}", Convert.ToInt32(leitor.GetValue(HMEPARCELAALT_HISTORICO)).ToString().PadLeft(2, '0'), Convert.ToInt32(leitor.GetValue(HMEPARCELA_HISTORICO)).ToString().PadLeft(2, '0'), Convert.ToInt32(leitor.GetValue(HMENUMPARCELAS_HISTORICO)).ToString().PadLeft(2, '0'));
                    //parcelaCompleta = string.Format("{0} / {1} / {2}", leitor.GetValue(HMEPARCELA_HISTORICO).ToString().PadLeft(2, '0'), leitor.GetValue(HMEPARCELA_HISTORICO).ToString().PadLeft(2, '0'), leitor.GetValue(HMENUMPARCELAS_HISTORICO).ToString().PadLeft(2, '0'))
                    //William Moreira da Silva SOL 235173
                    itemHistorico.DescricaoItem = itemHistorico.item.descricao;//William Moreira da Silva - SOL 200709
                    historicos.Add(itemHistorico);
                }
            }

            // Total de Regristros
            parametros = (parametros == null) ? new ParametrosConsulta() : parametros;
            parametros.totalRegistros = UtilidadesAcessoDados.obterTotalRegistros(bancoDeDados, comando, query.ToString());

            // Retorna informações
            parametros.prepararRetorno();
            return historicos;
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o item foi enviado para a folha.
        /// </summary>
        /// <param name="idHistMovEmptmo"></param>
        /// <returns>0 para aguardando processamento e 2 para item recebido</returns>
        public int verificaSitEnvio(long idHistMovEmptmo)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @"SELECT TMP.SITENVIO
                              FROM HISTMOVEMPTMO HST
                              JOIN CM.TMPDESC TMP ON TMP.IDTMPDESC = HST.IDTMPDESC
                             WHERE HST.IDHISTMOVEMPTMO IN (:IDHISTMOVEMPTMO_P) ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, idHistMovEmptmo);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        return leitor.obterInt(0);
                    }
                }
                return -1;
            }
        }

        //207977
        /// <summary>
        /// Retorna os detalhes do item do contrato contrato
        /// </summary>
        /// <param name="idHistorico"></param>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public Historico consultarDetalhe(long idHistorico, long numeroContrato)
        {
            string query;

            query = @"SELECT TO_CHAR(H.HMEVLRPREVISTO),
                      TO_CHAR(H.HMEVLREFETIVO),
       H.HMEANOCOBRANCA,
       LPAD (H.HMEMESCOBRANCA,2,0),
       HMEPARCELA,
       DECODE(H.HMETIPOMOV,
              0,
              'Concessão/Renovação',
              1,
              'Prestação ',
              2,
              'Amortização/Refinanciamento',
              3,
              'Quitação',
              4,
              'Atualização de Débito',
              5,
              'Atualização de Saldo (Diária)',
              6,
              'Importação/Migração',
              7,
              'Ajustes (Cobrança/Devolução)',
              8,
              'Ajustes (Saldo Devedor)') AS EVENTO,
                I.ITEDESCRICAO,
                H.IDCONTRATOEMPTMO,
                H.IDHISTMOVEMPTMO
                  FROM HISTMOVEMPTMO H, CM.ITEMEMPTMO I
                 WHERE H.IDHISTMOVEMPTMO = :IDHISTORICO_P
                   AND H.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P
                   AND I.IDITEMEMPTMO = H.IDITEMEMPTMO";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

                // Popula objeto resultante
                Historico historico = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        historico = new Historico()
                        {
                            valorPrevisto = (double)leitor.obterDecimal(0),
                            valorEfetivo = leitor.obterValorDecimal(1) != null ? (double?)leitor.obterValorDecimal(1) : null,
                            anoCobranca = leitor.obterValorInteiro(2),
                            mesCobranca = leitor.obterValorInteiro(3),
                            anoMesCobranca = String.Format("{0}/{1}", leitor.obterValorInteiro(2).ToString(), leitor.obterValorInteiro(3).ToString()),
                            parcela = Convert.ToInt32(leitor.GetValue(4)),

                            item = new ItemContrato
                            {
                                descricao = leitor.obterString(6)
                            },
                            id = Convert.ToInt64(leitor.GetValue(8))

                        };
                    }
                }

                return historico;
            }
        }

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Historico consultarDetalhe(long idHistorico)
        {
            string query;

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

            // Consulta
            //SELECT CON.IDPESSOA, ");
            query = @"SELECT H.IDHISTMOVEMPTMO, 
                    H.IDCONTRATOEMPTMO, 
                    H.IDITEMCENTRALIZA, 
                    H.IDITEMEMPTMO, 
                    I.ITEDESCRICAO, 
                    H.HMEPARCELA, 
                    DECODE(H.HMETIPOMOV, 0, 'Concessão/Renovação', 1, 'Prestação ', 2, 'Amortização/Refinanciamento', 3, 'Quitação', 4, 'Atualização de Débito', 5, 'Atualização de Saldo (Diária)' , 6, 'Importação/Migração', 7, 'Ajustes (Cobrança/Devolução)', 8, 'Ajustes (Saldo Devedor)' ) AS EVENTO, 
                    H.HMEORIGEM, 
             DECODE(H.HMEFORMACOBRANCA, 'C', 'Financeiro', 'F', 'Folha', '') AS FORMACOBRANCA, 
                    H.HMESEQCOBRANCA, 
                    H.HMEPRIORIDADE, 
                    H.HMECENTRALIZA, 
                    H.HMEDESTACADO, 
                    H.HMEDATA, 
                    H.HMEDATAPREVISTA, 
                    H.HMEDATAEFETIVA, 
                    H.HMEDATAATUALIZA, 
                    H.HMEANOCOMPETENCIA, 
                    H.HMEMESCOMPETENCIA, 
                    H.HMEANOCOBRANCA, 
                    H.HMEMESCOBRANCA, 
                    TO_CHAR(H.HMEVLRPREVISTO), 
                    TO_CHAR(H.HMEVLREFETIVO), 
                    TO_CHAR(H.HMESALDODEV), 
                    TO_CHAR(H.HMETXJUROS), 
                    H.IDREGRA, 
                    H.FLGSUSPENSAO, 
                    H.HMEANOSUSPENSAO, 
                    H.HMEMESSUSPENSAO, 
                    H.FLGESTORNADO, 
                    H.FLGBAIXADO, 
                    H.FLGABONADO, 
                    H.FLGENVIO, 
                    H.PLNCODIGO, 
                    H.PLNCODIGOESTORNO, 
                    H.CODDOCUMENTO, 
                    H.IDRUBRICA, 
                    H.HMERECPAG, 
                    H.FLGDIVERGPEND, 
                    H.HMENUMPARCELAS, 
             DECODE(H.HMETIPOFOLHA, 'B', 'Benefício', 'P', 'Patrocinadora', '') AS TIPOFOLHA, 
                    H.PLNCODIGORECEB, 
                    H.FLGRECEBIMENTO, 
                    H.CODDOCUMENTORECEB, 
                    H.IDLANCIRRF, 
                    H.HMEDATAVENCTO, 
                    H.FLGQUITADO, 
                    H.HMEDATAQUITABONO, 
                    H.FLGTIPODIVERG, 
                    H.FLGBAIXAMANUAL, 
                    H.FLGDIVERGTRAT, 
                    H.IDUSUARIOINDIV, 
                    H.IDUSUARIODIVERG, 
                    DECODE(H.FLGTIPODIVERGTRAT, 0, 'Cálculo de Encargos', 1, 'Ignorar (datas)', 2, 'Apenas atualização vencimento') AS TIPODIVERGTRAT,
                    H.HMEDATADIVERGTRAT, 
                    H.FLGTRATINDIV, 
                    H.FLGTIPOTRATINDIV, 
                    H.HMEDATATRATINDIV, 
                    H.HMEDATAESTORNO, 
                    H.FLGENTRADAMANUAL, 
                    H.TRGDTINCLUSAO, 
                    H.TRGUSERINCLUSAO, 
                    H.VERSAO, 
                    H.HMEDATARECEB, 
                    H.HMEOBSERVACAO, 
                    H.FLGSUSPMANUAL, 
                    H.CCDEBFINAN, 
                    H.CCCREDFINAN, 
                    H.CCDEBFOLHA, 
                    H.CCCREDFOLHA, 
                    H.HMEDATAENVIO, 
                    to_char(H.HMEVLRBASE), 
                    H.IDUSUARIOESTORNO, 
                    H.IDTMPDESC, 
                    H.HMEPARCELAALT, 
                    H.HMEDATAESTORNOALT, 
                    H.IDTIPOSUSPEMPTMO, 
                    H.IDMODULO, 
                    H.CODDOCUMENTOPROC, 
                    H.IDCBANCARIA, 
                    H.IDPLANOPREVCONTAB, 
                    H.IDPATRO, 
                    H.IDTIPORECURSO, 
                    H.ORIGEMRECURSO, 
                    H.HMETIPOMOV, 
                    S.TSEDESCRICAO, 
                    NVL(U.NOMEUSUARIO, H.TRGUSERINCLUSAO) AS NOMEUSUARIO, 
                    D.NODOCUMENTO,   
                    DECODE(T.SITENVIO, '0', 'Em cobrança', '1', 'Rec. Diverg.', '2', 'Rec. OK', 'X', 'NÃO Recebido', '9', 'Baixado EP') AS SITENVIO, 
                    PL.PLNPLANIL, 
                    PA.PLNPLANIL AS PLANIL_ESTORNO, 
                    DECODE(D.STATUS, '0', 'Em aberto', '2', 'Baixado', '') AS STATUS_DOC,
                    NVL(UE.NOMEUSUARIO, TO_CHAR(H.IDUSUARIOESTORNO)) AS NOMEUSUARIO
              FROM HISTMOVEMPTMO H, CM.ITEMEMPTMO I, CM.TIPOSUSPEMPTMO S, CM.USUARIOSISTEMA U, CM.DOCUMENTO D, CM.TMPDESC T, CM.PLANILHA PL, CM.PLANILHA PA, CM.USUARIOSISTEMA UE
              WHERE I.IDITEMEMPTMO = H.IDITEMEMPTMO 
              AND   S.IDTIPOSUSPEMPTMO (+) = H.IDTIPOSUSPEMPTMO 
              AND U.IDUSUARIO(+) = regexp_substr(H.TRGUSERINCLUSAO, '[[:digit:]]+')
              AND UE.IDUSUARIO(+) = H.IDUSUARIOESTORNO
              AND   H.IDHISTMOVEMPTMO = :IDHISTORICO_P 
              AND H.IDTMPDESC = T.IDTMPDESC(+) 
              AND D.Coddocumento(+) = H.CODDOCUMENTO 
              AND H.PLNCODIGO = PL.PLNCODIGO(+) 
              AND H.PLNCODIGOESTORNO = PA.PLNCODIGO(+)";
            //William Moreira da Silva SOL 220958 KTN 2053543 - FIM
            //William Moreira da Silva - SOL 242048

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);

                // Popula objeto resultante
                Historico historico = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        historico = new Historico();
                        historico.id = (long)leitor.obterValorInt64(IDHISTMOVEMPTMO);
                        //William Moreira da Silva SOL 220958 KTN 2053543
                        historico.formaCobranca = leitor.obterString(HMEFORMACOBRANCA);
                        historico.codigoDocumento = leitor.obterValorInt64(CODDOCUMENTO);
                        historico.rubrica = leitor.obterValorInteiro(IDRUBRICA);
                        historico.tipoFolha = leitor.obterString(HMETIPOFOLHA);
                        historico.dataEnvio = leitor.obterValorData(HMEDATAENVIO);
                        historico.idTMPDesc = leitor.obterValorInt64(IDTMPDESC);
                        historico.numeroDocumento = leitor.obterValorInt64(NODOCUMENTO);
                        historico.sitEnvio = leitor.obterString(SITENVIO);
                        historico.statusDocumento = leitor.obterString(STATUS_DOC);
                        historico.tipoTratamento = leitor.obterString(FLGTIPODIVERGTRAT);
                        historico.dataTratamento = leitor.obterValorData(HMEDATADIVERGTRAT);

                        historico.planilha = leitor.obterValorInt64(PLNCODIGO);
                        historico.plnPlanil = leitor.obterInt(PLNPLANIL);
                        historico.cContabilDebito = leitor.obterString(CCDEBFINAN);
                        historico.cContabilCredito = leitor.obterString(CCCREDFINAN);
                        historico.plnCodEstorno = leitor.obterValorInt64(PLNCODIGOESTORNO);
                        historico.plnPlanilEstorno = leitor.obterInt(PLANIL_ESTORNO);
                        //William Moreira da Silva SOL 220958 KTN 2053543

                        historico.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(leitor.obterInt(HMETIPOMOV));
                        historico.origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.obterInt(ORIGEM));
                        historico.data = leitor.obterValorData(HMEDATA).Value;
                        historico.dataInclusao = leitor.obterValorData(TRGDTINCLUSAO).Value;
                        historico.versao = leitor.obterString(VERSAO);
                        historico.dataPrevista = leitor.obterValorData(HMEDATAPREVISTA);
                        historico.dataVencimento = leitor.obterValorData(HMEDATAVENCTO);
                        historico.dataEfetiva = leitor.obterValorData(HMEDATAEFETIVA);
                        historico.valorPrevisto = (double)leitor.obterDecimal(HMEVLRPREVISTO);
                        historico.valorEfetivo = leitor.obterValorDecimal(HMEVLREFETIVO) != null ? (double?)leitor.obterValorDecimal(HMEVLREFETIVO) : null;
                        historico.taxaJuros = leitor.obterValorDecimal(HMETXJUROS) != null ? (double?)leitor.obterValorDecimal(HMETXJUROS) : null;
                        historico.saldoDevedor = (double)leitor.obterDecimal(HMESALDODEV);
                        historico.dataAtualizacao = leitor.obterValorData(HMEDATAATUALIZA).Value;
                        historico.observacao = leitor.obterString(HMEOBSERVACAO);
                        historico.dataRecebimento = leitor.obterValorData(HMEDATARECEB);
                        historico.dataAbonoQuitacao = leitor.obterValorData(HMEDATAQUITABONO);
                        historico.item = new ItemContrato()
                        {
                            descricao = leitor.obterString(ITEDESCRICAO),
                            id = leitor.obterInt(IDITEMEMPTMO)
                        };
                        historico.anoCompetencia = leitor.obterValorInteiro(HMEANOCOMPETENCIA);
                        historico.mesCompetencia = leitor.obterValorInteiro(HMEMESCOMPETENCIA);
                        historico.anoCobranca = leitor.obterValorInteiro(HMEANOCOBRANCA);
                        historico.mesCobranca = leitor.obterValorInteiro(HMEMESCOBRANCA);

                        //William Moreira da Silva - SOL 207977
                        historico.anoMesCobranca = string.Format("{0}/{1}", leitor.obterValorInteiro(HMEANOCOBRANCA).ToString(), leitor.obterValorInteiro(HMEMESCOBRANCA).ToString());
                        historico.parcela = leitor.obterValorInteiro(HMEPARCELA);
                        historico.numeroParcelas = leitor.obterInt(HMENUMPARCELAS);
                        //William Moreira da Silva - SOL 207977

                        //Flags
                        historico.envio = leitor.obterValorInteiro(FLGENVIO);
                        historico.baixado = leitor.obterValorInteiro(FLGBAIXADO);
                        historico.baixaManual = leitor.obterValorInteiro(FLGBAIXAMANUAL);
                        historico.suspenso = leitor.obterValorInteiro(FLGSUSPENSAO);
                        historico.estorno = leitor.obterValorInteiro(FLGESTORNADO);
                        historico.abonado = leitor.obterValorInteiro(FLGABONADO);
                        historico.quitado = leitor.obterValorInteiro(FLGQUITADO);
                        historico.centraliza = leitor.obterValorInteiro(HMECENTRALIZA);
                        historico.destacado = leitor.obterValorInteiro(HMEDESTACADO);
                        historico.divergencia = leitor.obterValorInteiro(FLGDIVERGPEND);
                        historico.divergenciaTratada = leitor.obterValorInteiro(FLGDIVERGTRAT);
                        historico.tipoDivergencia = leitor.IsDBNull(FLGTIPODIVERG) ? 0 : leitor.obterInt(FLGTIPODIVERG);
                        historico.valorBase = !leitor.IsDBNull(HMEVLRBASE) ? Convert.ToDouble(leitor.obterString(HMEVLRBASE)) : 0;
                        historico.entradaManual = leitor.obterValorInteiro(FLGENTRADAMANUAL);
                        historico.pagarReceber = leitor.obterString(HMERECPAG);
                        historico.usuarioInclusao = leitor.obterString(NOMEUSUARIO);
                        historico.tipoSuspensao = new TipoSuspensao()
                        {
                            descricao = leitor.obterString(TSEDESCRICAO)
                        };
                        historico.usuario = leitor.obterString(NOMEUSUARIOESTORNO);
                    }
                }

                return historico;
            }
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        public bool verificaItemRecebidoseBaixados(Historico itemTratado)
        {
            string query = @" SELECT 1
                              FROM HISTMOVEMPTMO HST, CM.lanctodocum LANC
                             WHERE HST.IDHISTMOVEMPTMO = " + itemTratado.id.ToString() + @"
                               AND HST.CODDOCUMENTO = LANC.CODDOCUMENTO
                               AND LANC.OPERACAO = 5";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        public bool verificaItensRecebidoseBaixados(List<Historico> itensTratados)
        {
            string idsHistorico = "";
            for (int i = 0; i < itensTratados.Count; i++)
            {
                if (itensTratados[i].id != 0)
                {
                    idsHistorico = idsHistorico + itensTratados[i].id.ToString();
                    if (!((itensTratados.Count - 1) == i))
                    {
                        idsHistorico = idsHistorico + " , ";
                    }
                }
            }

            if (itensTratados.Count > 999)
            {
                for (int i = 0; i < itensTratados.Count; i++)
                {

                    string query = @" SELECT 1
                              FROM HISTMOVEMPTMO HST, CM.lanctodocum LANC
                             WHERE HST.IDHISTMOVEMPTMO IN
                                   (" + itensTratados[i].id.ToString() + @")
                               AND HST.CODDOCUMENTO = LANC.CODDOCUMENTO
                               AND LANC.OPERACAO = 5";

                    // Cria comando de consulta
                    Database bancoDeDados = this.obterBancoDeDados();
                    using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                    {

                        using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                        {
                            if (leitor.Read())
                            {
                                return true;
                            }
                        }
                    }
                }
            }
            else
            {
                string query = @" SELECT 1
                              FROM HISTMOVEMPTMO HST, CM.lanctodocum LANC
                             WHERE HST.IDHISTMOVEMPTMO IN
                                   (" + idsHistorico + @")
                               AND HST.CODDOCUMENTO = LANC.CODDOCUMENTO
                               AND LANC.OPERACAO = 5";

                // Cria comando de consulta
                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read())
                        {

                            return true;
                        }
                    }
                }
            }
            return false;
        }

        /// <summary>
        /// Verifica se alguma da parcelas selecionadas já foi tratada anteriormente
        /// </summary>
        /// <param name="parcelas">Parcelas a serem verificadas</param>
        /// <param name="numeroContrato">Numero do Contrato</param>
        /// <param name="data">data em que a parcela foi tratada</param>
        /// <returns>Verdadeiro se a parcela já tiver sido tratada</returns>
        public bool verificaParcelaTratada(List<int> parcelas, long numeroContrato, ref DateTime data, ref DateTime dataVencimento)
        {
            string query;
            string sParcelas = "";

            for (int i = 0; i < parcelas.Count; i++)
            {
                sParcelas = sParcelas + parcelas[i].ToString();
                if (!((parcelas.Count - 1) == i))
                {
                    sParcelas = sParcelas + " , ";
                }
            }

            query = @"SELECT NVL(HMEDATATRATINDIV,HMEDATADIVERGTRAT) AS HMEDATADIVERGTRAT,
                   HMEDATAVENCTO,
                   FLGTRATINDIV 
            FROM HISTMOVEMPTMO
            WHERE IDCONTRATOEMPTMO= :IDCONTRATOEMPTMO_P
            AND   HMEDATAVENCTO >= TRUNC(SYSDATE)
            AND   hmecentraliza = 1
            AND   FLGENVIO = 0
            AND   FLGTRATINDIV = 1
            AND   HMEPARCELA IN(" + sParcelas + @") ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, numeroContrato);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        if (Convert.ToInt32(leitor.GetValue(2)) == 1)
                        {
                            data = leitor.GetDateTime(0);
                            dataVencimento = leitor.GetDateTime(1);
                            return true;
                        }
                    }
                }

                return false;
            }
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verificar se existema itens não recebidos 
        /// </summary>
        /// <param name="idHistoricos"></param>
        /// <returns>retona true se existir algum item que tenha sido recebido</returns>
        public bool existeItensNaoRecebidos(List<long> idHistoricos)
        {
            string query;
            string ids = "";

            for (int i = 0; i < idHistoricos.Count; i++)
            {
                ids = ids + idHistoricos[i].ToString();
                if (!((idHistoricos.Count - 1) == i))
                {
                    ids = ids + " , ";
                }
            }

            if (idHistoricos.Count > 999)
            {
                for (int i = 0; i < idHistoricos.Count; i++)
                {
                    query = @"SELECT DOC.STATUS
                     FROM HISTMOVEMPTMO HST, CM.DOCUMENTO DOC
                     WHERE HST.IDHISTMOVEMPTMO IN (" + idHistoricos[i].ToString() + @")
                     AND HST.CODDOCUMENTO = DOC.CODDOCUMENTO
                     AND DOC.STATUS IN (0,1)";

                    // Cria comando de consulta
                    Database bancoDeDados = this.obterBancoDeDados();
                    using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                    {
                        // Parâmetros
                        //bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.String, ids);

                        using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                        {
                            if (leitor.Read())
                            {

                                return true;
                            }
                        }
                    }
                }
            }
            else
            {
                query = @"SELECT DOC.STATUS
                     FROM HISTMOVEMPTMO HST, CM.DOCUMENTO DOC
                     WHERE HST.IDHISTMOVEMPTMO IN (" + ids + @")
                     AND HST.CODDOCUMENTO = DOC.CODDOCUMENTO
                     AND DOC.STATUS IN (0,1)";

                // Cria comando de consulta
                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {

                    // Parâmetros
                    //bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.String, ids);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read())
                        {
                            comando.Connection.Close();
                            comando.Dispose();

                            return true;
                        }
                    }
                }

            }
            return false;
        }

        public Historico consultarHistoricoChaveMestre(long idHistorico)
        {
            string query;

            query = @" SELECT H.IDHISTMOVEMPTMO,
                 H.IDCONTRATOEMPTMO,
                 H.HMETIPOMOV,
                 H.IDITEMEMPTMO,
                 H.HMEPARCELA,
                 H.HMEPARCELAALT,
                 H.HMESEQCOBRANCA,
                 H.HMENUMPARCELAS,
                 H.HMEMESCOMPETENCIA,
                 H.HMEANOCOMPETENCIA,
                 H.HMEMESCOBRANCA,
                 H.HMEANOCOBRANCA,
                 H.HMEFORMACOBRANCA,
                 H.HMETIPOFOLHA,
                 H.HMEDATAPREVISTA,
                 H.HMEDATAVENCTO,
                 H.HMEDATAEFETIVA,
                 TO_CHAR(H.HMESALDODEV) AS HMESALDODEV, --Evitar erro no Tibero (retorna zero)
                 H.HMEDATAATUALIZA,
                 TO_CHAR(H.HMEVLRPREVISTO) AS HMEVLRPREVISTO, --Evitar erro no Tibero (retorna zero)
                 TO_CHAR(H.HMEVLREFETIVO) AS HMEVLREFETIVO, --Evitar erro no Tibero (retorna zero)
                 TO_CHAR(H.HMEVLRBASE) AS HMEVLRBASE, --Evitar erro no Tibero (retorna zero)
                 TO_CHAR(H.HMETXJUROS) AS HMETXJUROS, --Evitar erro no Tibero (retorna zero)
                 H.PLNCODIGO,
                 H.FLGABONADO,
                 H.FLGQUITADO,
                 H.HMEDATAQUITABONO,
                 H.FLGBAIXADO,
                 H.FLGBAIXAMANUAL,
                 H.HMEDATAESTORNO,
                 H.FLGESTORNADO,
                 H.PLNCODIGOESTORNO,
                 H.FLGENVIO,
                 H.CODDOCUMENTO,
                 H.IDTMPDESC,
                 H.FLGDIVERGPEND,
                 H.FLGTIPODIVERG,
                 H.FLGDIVERGTRAT,
                 H.FLGENTRADAMANUAL,
                 H.FLGSUSPENSAO,
                 H.IDTIPOSUSPEMPTMO,
                 H.HMERECPAG,
                 H.HMECENTRALIZA,
                 H.HMEDESTACADO
               FROM HISTMOVEMPTMO H 
               WHERE   H.IDHISTMOVEMPTMO = :IDHISTORICO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {


                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);

                Historico historico = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        historico = new Historico();

                        historico.id = Int64.Parse(leitor["IDHISTMOVEMPTMO"].ToString());

                        historico.eventoCobranca = new TipoEventoCobranca();
                        if (!string.IsNullOrEmpty(leitor["HMETIPOMOV"].ToString()))
                            historico.eventoCobranca.id = int.Parse(leitor["HMETIPOMOV"].ToString());

                        historico.item = new ItemContrato();
                        if (!string.IsNullOrEmpty(leitor["IDITEMEMPTMO"].ToString()))
                            historico.item.id = Int64.Parse(leitor["IDITEMEMPTMO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["IDCONTRATOEMPTMO"].ToString()))
                            historico.numeroContrato = Int64.Parse(leitor["IDCONTRATOEMPTMO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEPARCELA"].ToString()))
                            historico.parcela = int.Parse(leitor["HMEPARCELA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEPARCELAALT"].ToString()))
                            historico.parcelaAlternativa = int.Parse(leitor["HMEPARCELAALT"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMESEQCOBRANCA"].ToString()))
                            historico.sequenciaCobranca = int.Parse(leitor["HMESEQCOBRANCA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMENUMPARCELAS"].ToString()))
                            historico.numeroParcelas = int.Parse(leitor["HMENUMPARCELAS"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEMESCOMPETENCIA"].ToString()))
                            historico.mesCompetencia = int.Parse(leitor["HMEMESCOMPETENCIA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEANOCOMPETENCIA"].ToString()))
                            historico.anoCompetencia = int.Parse(leitor["HMEANOCOMPETENCIA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEMESCOBRANCA"].ToString()))
                            historico.mesCobranca = int.Parse(leitor["HMEMESCOBRANCA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEANOCOBRANCA"].ToString()))
                            historico.anoCobranca = int.Parse(leitor["HMEANOCOBRANCA"].ToString());

                        historico.formaCobranca = leitor["HMEFORMACOBRANCA"].ToString();
                        historico.tipoFolha = leitor["HMETIPOFOLHA"].ToString();

                        if (!string.IsNullOrEmpty(leitor["HMEDATAPREVISTA"].ToString()))
                            historico.dataPrevista = DateTime.Parse(leitor["HMEDATAPREVISTA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEDATAVENCTO"].ToString()))
                            historico.dataVencimento = DateTime.Parse(leitor["HMEDATAVENCTO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEDATAEFETIVA"].ToString()))
                            historico.dataEfetiva = DateTime.Parse(leitor["HMEDATAEFETIVA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMESALDODEV"].ToString()))
                            historico.saldoDevedor = double.Parse(leitor["HMESALDODEV"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEDATAATUALIZA"].ToString()))
                            historico.dataAtualizacao = DateTime.Parse(leitor["HMEDATAATUALIZA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEVLRPREVISTO"].ToString()))
                            historico.valorPrevisto = double.Parse(leitor["HMEVLRPREVISTO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEVLREFETIVO"].ToString()))
                            historico.valorEfetivo = double.Parse(leitor["HMEVLREFETIVO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEVLRBASE"].ToString()))
                            historico.valorBase = double.Parse(leitor["HMEVLRBASE"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMETXJUROS"].ToString()))
                            historico.taxaJuros = double.Parse(leitor["HMETXJUROS"].ToString());

                        if (!string.IsNullOrEmpty(leitor["PLNCODIGO"].ToString()))
                            historico.planilha = long.Parse(leitor["PLNCODIGO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGABONADO"].ToString()))
                            historico.abonado = int.Parse(leitor["FLGABONADO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGQUITADO"].ToString()))
                            historico.quitado = int.Parse(leitor["FLGQUITADO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEDATAQUITABONO"].ToString()))
                            historico.dataAbonoQuitacao = DateTime.Parse(leitor["HMEDATAQUITABONO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGBAIXADO"].ToString()))
                            historico.baixado = int.Parse(leitor["FLGBAIXADO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGBAIXAMANUAL"].ToString()))
                            historico.baixaManual = int.Parse(leitor["FLGBAIXAMANUAL"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEDATAESTORNO"].ToString()))
                            historico.dataDoEstorno = DateTime.Parse(leitor["HMEDATAESTORNO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGESTORNADO"].ToString()))
                            historico.estorno = int.Parse(leitor["FLGESTORNADO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["PLNCODIGOESTORNO"].ToString()))
                            historico.plnCodEstorno = long.Parse(leitor["PLNCODIGOESTORNO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGENVIO"].ToString()))
                            historico.enviado = int.Parse(leitor["FLGENVIO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["CODDOCUMENTO"].ToString()))
                            historico.codigoDocumento = long.Parse(leitor["CODDOCUMENTO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["IDTMPDESC"].ToString()))
                            historico.idTMPDesc = long.Parse(leitor["IDTMPDESC"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGDIVERGPEND"].ToString()))
                            historico.divergencia = int.Parse(leitor["FLGDIVERGPEND"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGTIPODIVERG"].ToString()))
                            historico.tipoDivergencia = int.Parse(leitor["FLGTIPODIVERG"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGDIVERGTRAT"].ToString()))
                            historico.divergenciaTratada = int.Parse(leitor["FLGDIVERGTRAT"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGENTRADAMANUAL"].ToString()))
                            historico.entradaManual = int.Parse(leitor["FLGENTRADAMANUAL"].ToString());

                        if (!string.IsNullOrEmpty(leitor["FLGSUSPENSAO"].ToString()))
                            historico.suspenso = int.Parse(leitor["FLGSUSPENSAO"].ToString());

                        if (!string.IsNullOrEmpty(leitor["IDTIPOSUSPEMPTMO"].ToString()))
                            historico.idTipoSusp = long.Parse(leitor["IDTIPOSUSPEMPTMO"].ToString());

                        historico.pagarReceber = leitor["HMERECPAG"].ToString();

                        if (!string.IsNullOrEmpty(leitor["HMECENTRALIZA"].ToString()))
                            historico.centraliza = int.Parse(leitor["HMECENTRALIZA"].ToString());

                        if (!string.IsNullOrEmpty(leitor["HMEDESTACADO"].ToString()))
                            historico.destacado = int.Parse(leitor["HMEDESTACADO"].ToString());
                    }
                }

                return historico;
            }
        }


        public List<Historico> consultarHistoricoEnvio(long idHistorico)
        {
            string query;

            /* SELECT");
             H.IDHISTMOVEMPTMO,");
             H.DATAENVIO,");
             DECODE(H.FORMACOBRANCA,'C','Financeiro','F','Folha') AS FORMACOBRANCA,");
             DECODE(H.TIPOFOLHA,'B','Benefícios','P','Patrocinadora') AS TIPOFOLHA,");
             H.IDTMPDESC,");
             H.CODDOCUMENTO,");
             H.IDRUBRICA,");
             H.DATAVENCTO,");
             (SELECT NOMEUSUARIO FROM CM.USUARIOSISTEMA USUA WHERE 'CM'||TO_CHAR(USUA.IDUSUARIO) = H.TRGUSERINCLUSAO) NOMEUSUARIO, ");
             L.HISTORICOCOMPL ");//William Moreira da Silva - SOL 199847 KINTANA 1926357

            // FROM CM.HISTENVIOEMPTMO H ");
             FROM CM.HISTENVIOEMPTMO H, CM.LANCTODOCUM L ");//William Moreira da Silva - SOL 199847 KINTANA 1926357
             WHERE IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO_P");
             AND L.CODDOCUMENTO = H.CODDOCUMENTO ");//William Moreira da Silva - SOL 199847 KINTANA 1926357*/

            query = @" SELECT 
              H.IDHISTMOVEMPTMO, 
              H.DATAENVIO, 
              DECODE(H.FORMACOBRANCA,'C','Financeiro','F','Folha') AS FORMACOBRANCA, 
              DECODE(H.TIPOFOLHA,'B','Benefícios','P','Patrocinadora') AS TIPOFOLHA, 
              H.IDTMPDESC, 
              H.CODDOCUMENTO, 
              H.IDRUBRICA, 
              H.DATAVENCTO, 
              (SELECT NOMEUSUARIO FROM CM.USUARIOSISTEMA USUA WHERE 'CM'||TO_CHAR(USUA.IDUSUARIO) = H.TRGUSERINCLUSAO) NOMEUSUARIO,  
              (SELECT l.historicocompl 
              FROM CM.lanctodocum l 
              WHERE l.coddocumento = h.coddocumento 
              AND   l.operacao = (SELECT MAX(la.operacao) 
                                   FROM CM.lanctodocum la 
                                   WHERE la.coddocumento = l.coddocumento 
                                   AND   la.operacao <> 2)) AS HISTORICOCOMPL 
              FROM CM.HISTENVIOEMPTMO H 
              WHERE IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO_P 
              ORDER BY DATAENVIO DESC ";
            //William Moreira da Silva - SOL 199847 KINTANA 1926357


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, idHistorico);

                List<Historico> listaHistorico = new List<Historico>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        String destinoEnvio = String.Format("{0} {1}", leitor.obterString(2), leitor.obterString(3));//William Moreira da Silva SOL 220958 KTN 2053543
                        Historico historico = new Historico()
                        {
                            id = Convert.ToInt64(leitor.GetValue(0)),
                            dataEnvio = leitor.GetDateTime(1),
                            //William Moreira da Silva SOL 220958 KTN 2053543
                            //formaCobranca = leitor.obterString(2),
                            //tipoFolha = leitor.obterString(3),
                            formaCobranca = destinoEnvio,
                            //William Moreira da Silva SOL 220958 KTN 2053543
                            chaveFolha = leitor.obterValorInt64(4),
                            codigoDocumento = leitor.obterValorInt64(5),
                            rubrica = leitor.obterValorInteiro(6),
                            dataVencimento = leitor.GetDateTime(7),
                            usuarioInclusao = leitor.obterString(8),
                            observacao = leitor.obterString(9)//William Moreira da Silva - SOL 199847 KINTANA 1926357
                        };
                        listaHistorico.Add(historico);
                    }
                }

                return listaHistorico;
            }
        }

        public List<Historico> consultarEventoCobranca(long idContrato, long? idEvento)
        {
            string query;

            query = @" SELECT 
             HST.IDCONTRATOEMPTMO,
             HST.IDHISTEVENTOCOBEMPTMO,
             HST.IDTIPOEVENTOCOBEMPTMO,
             T.DESCEVENTOCOB,
             HST.DATAEVENTOCOB,
             HST.OBSCOB 
             FROM CM.HISTEVENTOCOBEMPTMO HST,
             CM.TIPOEVENTOCOBEMPTMO T,
             CM.EVENTOCOBXHISTMOVEMPTMO E ";

            if (idEvento == null)
                query = query + @" WHERE HST.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ";
            else
                query = query + @" WHERE HST.IDHISTEVENTOCOBEMPTMO = :IDHISTEVENTOCOBEMPTMO_P ";

            query = query + @" AND HST.IDTIPOEVENTOCOBEMPTMO = T.IDTIPOEVENTOCOBEMPTMO 
             AND HST.IDHISTEVENTOCOBEMPTMO = E.IDHISTEVENTOCOBEMPTMO(+)
             GROUP BY HST.IDCONTRATOEMPTMO,
             HST.IDHISTEVENTOCOBEMPTMO,
             HST.IDTIPOEVENTOCOBEMPTMO,
             T.DESCEVENTOCOB,
             HST.DATAEVENTOCOB,
             HST.OBSCOB
             ORDER BY DATAEVENTOCOB ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                if (idEvento == null)
                    bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
                else
                    bancoDeDados.AddInParameter(comando, "IDHISTEVENTOCOBEMPTMO_P", DbType.Int64, idEvento);

                List<Historico> listaHistorico = new List<Historico>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Historico historico = new Historico();
                        historico.numeroContrato = Convert.ToInt64(leitor.GetValue(0));
                        historico.id = Convert.ToInt64(leitor.GetValue(1));
                        historico.eventoCobranca = new TipoEventoCobranca() { id = Convert.ToInt32(leitor.GetValue(2)), descricao = leitor.obterString(3) };
                        historico.data = leitor.GetDateTime(4);
                        historico.observacao = leitor.obterString(5);

                        listaHistorico.Add(historico);
                    }
                }

                return listaHistorico;
            }
        }

        public List<Historico> consultarParcelaCobranca(long idContrato, int idTipoEvento, DateTime dataEvento)
        {
            string query;

            query = @" SELECT 
             HME.IDCONTRATOEMPTMO,
             HME.IDHISTMOVEMPTMO,
             HME.HMEPARCELAALT || '/' || HME.HMEPARCELA || '/' || HME.HMENUMPARCELAS AS PARCELAS,
             HME.HMEDATAPREVISTA,
             HME.HMEVLRPREVISTO,
             HME.HMEDATAEFETIVA,
             HME.HMEVLREFETIVO,
             HME.HMEDATAVENCTO,
             IT.ITEDESCRICAO AS ITEM,
             HME.HMEVLRPREVISTO AS VALORENCARGO
             FROM HISTMOVEMPTMO HME, CM.ITEMEMPTMO IT
             WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P
             AND HME.IDHISTMOVEMPTMO IN

             (SELECT IDHISTMOVEMPTMO
             FROM CM.HISTEVENTOCOBEMPTMO H, CM.EVENTOCOBXHISTMOVEMPTMO E
             WHERE H.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P
             AND H.IDTIPOEVENTOCOBEMPTMO = :IDTIPOEVENTOCOBEMPTMO_P
             AND H.DATAEVENTOCOB = :DATAEVENTOCOB_P
             AND H.IDHISTEVENTOCOBEMPTMO = E.IDHISTEVENTOCOBEMPTMO)

             AND HME.HMETIPOMOV = 1
             AND (HME.HMECENTRALIZA + HME.HMEDESTACADO) = 1
             AND HME.HMEORIGEM = 1
             AND NVL(HME.FLGESTORNADO, 0) = 0
             AND IT.IDITEMEMPTMO = HME.IDITEMEMPTMO
             ORDER BY HMEDATAPREVISTA ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
                bancoDeDados.AddInParameter(comando, "IDTIPOEVENTOCOBEMPTMO_P", DbType.Int32, idTipoEvento);
                bancoDeDados.AddInParameter(comando, "DATAEVENTOCOB_P", DbType.DateTime, dataEvento);

                List<Historico> listaHistorico = new List<Historico>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Historico historico = new Historico()
                        {
                            numeroContrato = Convert.ToInt64(leitor.GetValue(0)),
                            id = Convert.ToInt64(leitor.GetValue(1)),
                            parcelaCompleta = leitor.obterString(2),
                            dataPrevista = leitor.obterValorData(3),
                            valorPrevisto = (double)leitor.obterDecimal(4),
                            dataEfetiva = leitor.obterValorData(5),
                            valorEfetivo = leitor.obterValorDecimal(6) != null ? (double?)leitor.obterValorDecimal(6) : null,
                            dataVencimento = leitor.obterValorData(7),
                            item = new ItemContrato() { descricao = leitor.obterString(8) }
                        };
                        listaHistorico.Add(historico);
                    }
                }

                return listaHistorico;
            }
        }

        /// <summary>
        /// Verifica se um item pertence a um documento ainda não baixado
        /// </summary>
        /// <param name="idItemhistorico">ID do item na HistMovEmptmo</param>
        /// <returns>Retorna true se o item pertencer a um documento não baixado</returns>
        //William Moreira da Silva - SOL 207977 PPM
        public bool verificaItemDocumento(long idItemhistorico)
        {
            string query;

            query = @" SELECT * FROM HISTMOVEMPTMO H, CM.DOCUMENTO D 
             WHERE H.Coddocumento = d.coddocumento 
             AND d.STATUS = 0
             AND h.idhistmovemptmo =  :IDHISTMOVEMPTMO ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO", DbType.Int64, idItemhistorico);


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
        /// Método para o retorno dos itens em aberto da Fucionalidade de tratamento individual de Parcelas
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato a ser tratado</param>
        /// <param name="idTipoContrato">Identificação do tipo de contrato</param>
        /// <param name="itensBaixadosManualmente">bool para mostrar itens baixados manualmente</param>
        /// <param name="itensSuspensos">bool para mostrar apenas itens suspensos</param>
        /// <param name="itensPrestEncargos">bool para mostrar itens de pestações e encargos</param>
        /// <param name="itensSuspensos">bool para não mostrar itens suspensos</param>
        /// <returns>Lista dos itens em aberto</returns>
        //William Moreira da Silva - SOL 207977 PPM
        public List<Historico> consultarItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            StringBuilder query = new StringBuilder();

            //Consulta
            query.Append(" SELECT ");
            query.Append(" 0 AS FLGESCOLHA, ");
            query.Append(" HME.IDHISTMOVEMPTMO, ");
            query.Append(" IRC.ITEDESCRICAO, ");
            query.Append(" TO_CHAR(HME.HMEMESCOMPETENCIA, '00') || '/' || HME.HMEANOCOMPETENCIA AS ANOMES, ");
            query.Append(" HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANCA, ");
            query.Append(" HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO  ,  NVL(HME.FLGBAIXADO,0), ");
            query.Append(" HME.HMEDATAPREVISTA  , TO_CHAR(HME.HMEVLRPREVISTO) HMEVLRPREVISTO   , TO_CHAR(HME.HMESALDODEV) HMESALDODEV  ,  HME.PLNCODIGO, ");
            query.Append(" TO_CHAR(HME.HMETXJUROS) HMETXJUROS, ");
            query.Append(" HME.HMEPARCELA, ");
            query.Append(" HME.HMEPARCELAALT, ");
            query.Append(" HME.HMENUMPARCELAS, ");
            query.Append(" HME.HMEDATAATUALIZA, ");
            query.Append(" HME.HMEDATAEFETIVA   , TO_CHAR(HME.HMEVLREFETIVO) HMEVLREFETIVO    , HME.HMERECPAG,       HME.IDITEMCENTRALIZA, ");
            query.Append(" NVL(HME.IDREGRA,0) IDREGRA          , HME.HMEORIGEM        , HME.HMEPRIORIDADE, ");
            query.Append(" HME.HMETIPOMOV, ");
            query.Append(" HME.HMEFORMACOBRANCA, ");
            query.Append(" HME.IDRUBRICA, ");
            query.Append(" CON.IDPATRO, ");
            query.Append(" HME.CODDOCUMENTO, HME.IDTMPDESC, ");
            query.Append(" HME.HMECENTRALIZA, ");
            query.Append(" HME.HMEDESTACADO, ");
            query.Append(" HME.HMEANOCOBRANCA, ");
            query.Append(" HME.HMEMESCOBRANCA, ");
            query.Append(" HME.HMEDATAVENCTO, NVL(HME.FLGENVIO,0), ");
            query.Append(" HME.FLGBAIXAMANUAL, ");
            query.Append(" HME.FLGSUSPENSAO, ");
            query.Append(" DECODE(HME.HMEFORMACOBRANCA,'F','Folha', 'C','Financeiro') AS FORMACOBRANCA, ");
            query.Append(" DECODE(HME.FLGBAIXAMANUAL, 1, 'Baixa Manual', DECODE(HME.FLGSUSPENSAO, 1, 'Suspenso', NULL)) AS STATUS, ");
            query.Append(" TSE.TSEDESCRICAO, NVL(TSE.FLGATUALSALDOPARC,0) FLGATUALSALDOPARC, IRT.IDREGRACALC, HME.IDTIPOSUSPEMPTMO, IRT.FLGSUSPENSO, TSE.FLGCOBRJUDICIAL, HME.FLGTIPODIVERG "); //William Moreira da Silva - SOL 250843
            query.Append(" FROM ");
            query.Append(" HISTMOVEMPTMO  HME, ");
            query.Append(" CM.CONTRATOEMPTMO CON, ");
            query.Append(" CM.TIPOSUSPEMPTMO TSE, ");
            query.Append(" CM.ITEMXTIPOCONTR IRT, ");
            query.Append(" CM.ITEMEMPTMO     IRC ");
            query.Append(" WHERE ");
            query.Append(" HME.IDCONTRATOEMPTMO     = :ID_CONTRATOEMPTMO ");
            query.Append(" AND IRT.IDTIPOCONTREMPTMO    = :ID_TIPOCONTRATOEMPTMO ");
            query.Append(" AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO    = 1 ) ");
            query.Append(" AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 7) ");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append(" AND NVL(HME.FLGABONADO, 0)   = 0 ");
            query.Append(" AND NVL(HME.FLGQUITADO, 0)   = 0 ");
            query.AppendFormat(" AND ( HME.FLGBAIXADO         = 0 OR ( {0} = 1 AND HME.FLGBAIXAMANUAL = 1) ) ", itensBaixadosManualmente.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (HME.FLGSUSPENSAO = 1 AND 0 = tse.flgenvia))) ", itensApenasSuspensos.ToString(), itensApenasSuspensos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND HME.HMETIPOMOV IN (1, 4)) ) ", itensPrestEncargos.ToString(), itensPrestEncargos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR 1 = tse.flgenvia))) ", itensNaoSuspensos.ToString(), itensNaoSuspensos.ToString());
            query.Append(" AND HME.IDITEMEMPTMO         = IRT.IDITEMEMPTMO ");
            query.Append(" AND IRT.IDITEMEMPTMO         = IRC.IDITEMEMPTMO ");
            query.Append(" AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO ");
            query.Append(" AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append(" ORDER BY ");
            query.Append(" HME.HMEPARCELA, ");
            query.Append(" HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, ");
            query.Append(" HME.HMETIPOMOV, HME.HMESEQCOBRANCA ");
            
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString()))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "ID_CONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "ID_TIPOCONTRATOEMPTMO", DbType.Int32, idTipoContrato);

                // Popula objeto resultante
                List<Historico> itensemAberto = new List<Historico>();

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Historico hist = new Historico();
                        hist.id = Convert.ToInt64(leitor.GetValue(1));

                        hist.item = new ItemContrato()
                        {
                            id = Convert.ToInt32(leitor.GetValue(9)),
                            descricao = leitor.obterString(2),
                            regra = new Regra()
                            {
                                id = Convert.ToInt32(leitor.GetValue(45))
                            },
                            suspensao = Convert.ToInt32(leitor.GetValue(47))
                        };
                        hist.anoMesCobranca = leitor.obterString(3);
                        hist.anoCompetencia = leitor.obterValorInteiro(4);
                        hist.mesCompetencia = leitor.obterValorInteiro(5);
                        hist.sequenciaCobranca = Convert.ToInt32(leitor.GetValue(6));
                        hist.numeroContrato = Convert.ToInt64(leitor.GetValue(8));
                        hist.baixado = leitor.obterValorInteiro(10);
                        hist.dataPrevista = leitor.obterValorData(11);
                        hist.valorPrevisto = (double)leitor.obterDecimal(12);
                        hist.saldoDevedor = (double)leitor.obterDecimal(13);
                        hist.taxaJuros = leitor.obterValorDecimal(15) != null ? (double?)leitor.obterValorDecimal(15) : null;
                        hist.parcela = leitor.obterValorInteiro(16);
                        hist.parcelaAlternativa = Convert.ToInt32(leitor.GetValue(17));
                        hist.numeroParcelas = Convert.ToInt32(leitor.GetValue(18));
                        hist.dataEfetiva = leitor.obterValorData(20);//Segundo o PLANUS essa data é a data da baixa
                        hist.valorEfetivo = leitor.obterValorDecimal(21) != null ? (double?)leitor.obterValorDecimal(21) : null;
                        hist.itemCentraliza = (leitor.IsDBNull(23) ? null : new ItemContrato { id = Convert.ToInt64(leitor.GetValue(23)) });
                        hist.idRegra = leitor.obterInt(24);
                        hist.origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(Convert.ToInt32(leitor.GetValue(25)));
                        hist.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(27)));
                        //histformaCobranca = leitor.obterString(28);
                        hist.codigoDocumento = leitor.obterValorInt64(31);
                        hist.centraliza = leitor.obterValorInteiro(33);
                        hist.destacado = leitor.obterValorInteiro(34);
                        hist.anoCobranca = leitor.obterValorInteiro(35);
                        hist.mesCobranca = leitor.obterValorInteiro(36);
                        //histanoMesCobranca = String.Format("{1:D2}/{0}", Convert.ToInt32(leitor.GetValue(35)), leitor.GetValue(36).ToString());
                        hist.dataVencimento = leitor.obterValorData(37);
                        hist.envio = leitor.obterValorInteiro(38);
                        hist.baixaManual = leitor.obterValorInteiro(39);
                        hist.suspenso = leitor.obterValorInteiro(40);
                        hist.formaCobranca = leitor.obterString(41);
                        hist.statusDocumento = leitor.obterString(42);
                        hist.tipoSuspensao = (leitor.IsDBNull(46) ? null : new TipoSuspensao()
                        {
                            descricao = leitor.obterString(43),
                            atualizaSaldoDevedor = leitor.obterInt(44),
                            id = Convert.ToInt32(leitor.GetValue(46))
                        });
                        hist.tipoDivergencia = leitor.obterInt(49);//William Moreira da Silva - SOL 250843
                        itensemAberto.Add(hist);
                    }
                }

                return itensemAberto;
            }
        }

        //William Moreira da Silva - SOL 207977
        public int consultaQuantItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            int i = 0;

            //Consulta
            string query = @"SELECT COUNT(IDHISTMOVEMPTMO)
FROM HMEALL HME
     JOIN CM.CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO
     JOIN CM.ITEMXTIPOCONTR IRT ON HME.IDITEMEMPTMO = IRT.IDITEMEMPTMO
                                AND CON.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO
     JOIN CM.ITEMEMPTMO IRC ON IRC.IDITEMEMPTMO = IRT.IDITEMEMPTMO
     LEFT JOIN CM.TIPOSUSPEMPTMO TSE ON HME.IDTIPOSUSPEMPTMO = TSE.IDTIPOSUSPEMPTMO
WHERE HME.IDCONTRATOEMPTMO     = :ID_CONTRATOEMPTMO 
AND   IRT.IDTIPOCONTREMPTMO    = :ID_TIPOCONTRATOEMPTMO
AND   HME.NATUREZAITEM > 0 
AND   HME.TIPOMOV IN (1, 2, 3, 4, 7)
AND   HME.FLGQUITABONOESTORNO = 0
AND ( HME.FLGBAIXADO = 0 OR ( :BAIXAMANUAL = 1 AND HME.FLGBAIXAMANUAL = 1) )
AND ( :APENASSUSPENSO_1 = 0 OR ( :APENASSUSPENSO_2 = 1 AND (HME.IDTIPOSUSPEMPTMO IS NOT NULL AND 0 = TSE.FLGENVIA)))
AND ( :APENASPRESTENCARGOS_1 = 0 OR ( :APENASPRESTENCARGOS_2 = 1 AND HME.TIPOMOV IN (1, 4)) )
AND ( :NAOSUSPENSOS_1 = 0 OR ( :NAOSUSPENSOS_1 = 1 AND (NVL(HME.IDTIPOSUSPEMPTMO, 0) = 0 OR 1 = TSE.FLGENVIA)))
";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "ID_CONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "ID_TIPOCONTRATOEMPTMO", DbType.Int32, idTipoContrato);
                bancoDeDados.AddInParameter(comando, "BAIXAMANUAL", DbType.Int32, itensBaixadosManualmente);
                bancoDeDados.AddInParameter(comando, "APENASSUSPENSO_1", DbType.Int32, itensApenasSuspensos);
                bancoDeDados.AddInParameter(comando, "APENASSUSPENSO_2", DbType.Int32, itensApenasSuspensos);
                bancoDeDados.AddInParameter(comando, "APENASPRESTENCARGOS_1", DbType.Int32, itensPrestEncargos);
                bancoDeDados.AddInParameter(comando, "APENASPRESTENCARGOS_2", DbType.Int32, itensPrestEncargos);
                bancoDeDados.AddInParameter(comando, "NAOSUSPENSOS_1", DbType.Int32, itensNaoSuspensos);
                bancoDeDados.AddInParameter(comando, "NAOSUSPENSOS_2", DbType.Int32, itensNaoSuspensos);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        i = Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                return i;
            }
        }

        //William Moreira da Silva - SOL 207977
        public List<Historico> consultarItensAbertoParticionado(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index)
        {
            int i = 0;
            StringBuilder query = new StringBuilder();

            //Consulta
            query.Append(" SELECT ");
            query.Append(" 0 AS FLGESCOLHA, ");
            query.Append(" HME.IDHISTMOVEMPTMO, ");
            query.Append(" IRC.ITEDESCRICAO, ");
            query.Append(" TO_CHAR(HME.HMEMESCOMPETENCIA, '00') || '/' || HME.HMEANOCOMPETENCIA AS ANOMES, ");
            query.Append(" HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANCA, ");
            query.Append(" HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO  ,  NVL(HME.FLGBAIXADO,0), ");
            query.Append(" HME.HMEDATAPREVISTA  , TO_CHAR(HME.HMEVLRPREVISTO) HMEVLRPREVISTO   , TO_CHAR(HME.HMESALDODEV) HMESALDODEV   ,  HME.PLNCODIGO, ");
            query.Append(" TO_CHAR(HME.HMETXJUROS) HMETXJUROS, ");
            query.Append(" HME.HMEPARCELA, ");
            query.Append(" HME.HMEPARCELAALT, ");
            query.Append(" HME.HMENUMPARCELAS, ");
            query.Append(" HME.HMEDATAATUALIZA, ");
            query.Append(" HME.HMEDATAEFETIVA   , TO_CHAR(HME.HMEVLREFETIVO) HMEVLREFETIVO    , HME.HMERECPAG,       HME.IDITEMCENTRALIZA, ");
            query.Append(" HME.IDREGRA          , HME.HMEORIGEM        , HME.HMEPRIORIDADE, ");
            query.Append(" HME.HMETIPOMOV, ");
            query.Append(" HME.HMEFORMACOBRANCA, ");
            query.Append(" HME.IDRUBRICA, ");
            query.Append(" CON.IDPATRO, ");
            query.Append(" HME.CODDOCUMENTO, HME.IDTMPDESC, ");
            query.Append(" HME.HMECENTRALIZA, ");
            query.Append(" HME.HMEDESTACADO, ");
            query.Append(" HME.HMEANOCOBRANCA, ");
            query.Append(" HME.HMEMESCOBRANCA, ");
            query.Append(" HME.HMEDATAVENCTO, NVL(HME.FLGENVIO,0), ");
            query.Append(" HME.FLGBAIXAMANUAL, ");
            query.Append(" HME.FLGSUSPENSAO, ");
            query.Append(" DECODE(HME.HMEFORMACOBRANCA,'F','Folha', 'C','Financeiro') AS FORMACOBRANCA, ");
            query.Append(" DECODE(HME.FLGBAIXAMANUAL, 1, 'Baixa Manual', DECODE(HME.FLGSUSPENSAO, 1, 'Suspenso', NULL)) AS STATUS, ");
            query.Append(" TSE.TSEDESCRICAO, TSE.FLGATUALSALDOPARC, IRT.IDREGRACALC, HME.IDTIPOSUSPEMPTMO, IRT.FLGSUSPENSO, TSE.FLGCOBRJUDICIAL, HME.FLGTIPODIVERG "); //William Moreira da Silva - SOL 250843
            query.Append(" FROM ");
            query.Append(" HISTMOVEMPTMO  HME, ");
            query.Append(" CM.CONTRATOEMPTMO CON, ");
            query.Append(" CM.TIPOSUSPEMPTMO TSE, ");
            query.Append(" CM.ITEMXTIPOCONTR IRT, ");
            query.Append(" CM.ITEMEMPTMO     IRC ");
            query.Append(" WHERE ");
            query.Append(" HME.IDCONTRATOEMPTMO     = :ID_CONTRATOEMPTMO ");
            query.Append(" AND IRT.IDTIPOCONTREMPTMO    = :ID_TIPOCONTRATOEMPTMO ");
            query.Append(" AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO    = 1 ) ");
            query.Append(" AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 7) ");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append(" AND NVL(HME.FLGABONADO, 0)   = 0 ");
            query.Append(" AND NVL(HME.FLGQUITADO, 0)   = 0 ");
            query.AppendFormat(" AND ( HME.FLGBAIXADO         = 0 OR ( {0} = 1 AND HME.FLGBAIXAMANUAL = 1) ) ", itensBaixadosManualmente.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (HME.FLGSUSPENSAO = 1 AND 0 = tse.flgenvia))) ", itensApenasSuspensos.ToString(), itensApenasSuspensos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND HME.HMETIPOMOV IN (1, 4)) ) ", itensPrestEncargos.ToString(), itensPrestEncargos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR 1 = tse.flgenvia))) ", itensNaoSuspensos.ToString(), itensNaoSuspensos.ToString());
            query.Append(" AND HME.IDITEMEMPTMO         = IRT.IDITEMEMPTMO ");
            query.Append(" AND IRT.IDITEMEMPTMO         = IRC.IDITEMEMPTMO ");
            query.Append(" AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO ");
            query.Append(" AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append(" ORDER BY ");
            query.Append(" HME.HMEPARCELA, ");
            query.Append(" HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, ");
            query.Append(" HME.HMETIPOMOV, HME.HMESEQCOBRANCA ");

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString()))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "ID_CONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "ID_TIPOCONTRATOEMPTMO", DbType.Int32, idTipoContrato);

                // Popula objeto resultante
                List<Historico> itensemAberto = new List<Historico>();

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read()) //@TODO: alterar a busca do RANGE utilizando ROWNUM direto na Query
                    {
                        if (i >= index && i < (index + 400))
                        {
                            Historico hist = new Historico()
                            {
                                id = Convert.ToInt64(leitor.GetValue(1)),
                                item = new ItemContrato()
                                {
                                    id = Convert.ToInt32(leitor.GetValue(9)),
                                    descricao = leitor.obterString(2),
                                    regra = new Regra()
                                    {
                                        id = Convert.ToInt32(leitor.GetValue(45))
                                    },
                                    suspensao = Convert.ToInt32(leitor.GetValue(47))
                                },
                                anoMesCobranca = leitor.obterString(3),
                                anoCompetencia = leitor.obterValorInteiro(4),
                                mesCompetencia = leitor.obterValorInteiro(5),
                                sequenciaCobranca = Convert.ToInt32(leitor.GetValue(6)),
                                numeroContrato = Convert.ToInt64(leitor.GetValue(8)),
                                baixado = leitor.obterValorInteiro(10),
                                dataPrevista = leitor.obterValorData(11),
                                valorPrevisto = (double)leitor.obterDecimal(12),
                                saldoDevedor = (double)leitor.obterDecimal(13),
                                taxaJuros = leitor.obterValorDecimal(15) != null ? (double?)leitor.obterValorDecimal(15) : null,
                                parcela = leitor.obterValorInteiro(16),
                                parcelaAlternativa = Convert.ToInt32(leitor.GetValue(17)),
                                numeroParcelas = Convert.ToInt32(leitor.GetValue(18)),
                                dataEfetiva = leitor.obterValorData(20),//Segundo o PLANUS essa data é a data da baixa
                                valorEfetivo = leitor.obterValorDecimal(21) != null ? (double?)leitor.obterValorDecimal(21) : null,
                                itemCentraliza = (leitor.IsDBNull(23) ? null : new ItemContrato { id = Convert.ToInt64(leitor.GetValue(23)) }),
                                idRegra = leitor.obterInt(24),
                                origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(Convert.ToInt32(leitor.GetValue(25))),
                                tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(27))),
                                //formaCobranca = leitor.obterString(28),
                                codigoDocumento = leitor.obterValorInt64(31),
                                centraliza = leitor.obterValorInteiro(33),
                                destacado = leitor.obterValorInteiro(34),
                                anoCobranca = leitor.obterValorInteiro(35),
                                mesCobranca = leitor.obterValorInteiro(36),
                                //anoMesCobranca = String.Format("{1:D2}/{0}", Convert.ToInt32(leitor.GetValue(35)), leitor.GetValue(36).ToString()),
                                dataVencimento = leitor.obterValorData(37),
                                envio = leitor.obterValorInteiro(38),
                                baixaManual = leitor.obterValorInteiro(39),
                                suspenso = leitor.obterValorInteiro(40),
                                formaCobranca = leitor.obterString(41),
                                statusDocumento = leitor.obterString(42),
                                tipoSuspensao = (leitor.IsDBNull(46) ? null : new TipoSuspensao()
                                {
                                    descricao = leitor.obterString(43),
                                    atualizaSaldoDevedor = leitor.obterInt(44),
                                    id = leitor.obterInt(46)
                                }),
                                tipoDivergencia = leitor.obterInt(49)//William Moreira da Silva - SOL 250843
                            };
                            itensemAberto.Add(hist);
                        }
                        i++;
                    }
                }
                return itensemAberto;
            }
        }

        //SIG 67808 - Campanha Descontos- Matias
        public List<Historico> ConsultarItensAbertosParticionadoAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index)
        {
            int i = 0;
            StringBuilder query = new StringBuilder();

            //Consulta
            query.Append(" SELECT ");
            query.Append(" IRC.ITEDESCRICAO, ");
            query.Append(" NULL AS ANOMES, ");
            query.Append(" 0 HMEANOCOMPETENCIA, ");
            query.Append(" 0 HMEMESCOMPETENCIA, ");
            query.Append(" 0 HMESEQCOBRANCA, ");
            query.Append(" 0 HMETIPOMOV, ");
            query.Append(" HME.IDCONTRATOEMPTMO, ");
            query.Append(" HME.IDITEMEMPTMO, ");
            query.Append(" 0 FLGBAIXADO, ");
            query.Append(" NULL AS HMEDATAPREVISTA, ");
            query.Append(" TO_CHAR(SUM(HME.HMEVLRPREVISTO)) AS HMEVLRPREVISTO, ");
            query.Append(" 0 HMESALDODEV, ");
            query.Append(" 0 PLNCODIGO, ");
            query.Append(" 0 HMETXJUROS, ");
            query.Append(" 0 HMEPARCELA, ");
            query.Append(" 0 HMEPARCELAALT, ");
            query.Append(" 0 HMENUMPARCELAS, ");
            query.Append(" 0 HMEDATAATUALIZA, ");
            query.Append(" NULL HMEDATAEFETIVA, ");
            query.Append(" 0 HMEVLREFETIVO, ");
            query.Append(" 0 HMERECPAG, ");
            query.Append(" 0 IDITEMCENTRALIZA, ");
            query.Append(" 0 IDREGRA, ");
            query.Append(" 0 HMEORIGEM, ");
            query.Append(" 0 HMETIPOMOV, ");
            query.Append(" 0 CODDOCUMENTO, ");
            query.Append(" 0 HMECENTRALIZA, ");
            query.Append(" 0 HMEDESTACADO, ");
            query.Append(" 0 HMEANOCOBRANCA, ");
            query.Append(" 0 HMEMESCOBRANCA, ");
            query.Append(" NULL HMEDATAVENCTO,");
            query.Append(" 0 FLGENVIO, ");
            query.Append(" 0 FLGBAIXAMANUAL, ");
            query.Append(" 0 FLGSUSPENSAO, ");
            query.Append(" NULL AS FORMACOBRANCA ");
            query.Append(" FROM ");
            query.Append(" HISTMOVEMPTMO  HME, ");
            query.Append(" CM.CONTRATOEMPTMO CON, ");
            query.Append(" CM.TIPOSUSPEMPTMO TSE, ");
            query.Append(" CM.ITEMXTIPOCONTR IRT, ");
            query.Append(" CM.ITEMEMPTMO     IRC ");
            query.Append(" WHERE ");
            query.Append(" HME.IDCONTRATOEMPTMO     = :ID_CONTRATOEMPTMO ");
            query.Append(" AND IRT.IDTIPOCONTREMPTMO    = :ID_TIPOCONTRATOEMPTMO ");
            query.Append(" AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO    = 1 ) ");
            query.Append(" AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 7) ");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append(" AND NVL(HME.FLGABONADO, 0)   = 0 ");
            query.Append(" AND NVL(HME.FLGQUITADO, 0)   = 0 ");
            query.AppendFormat(" AND ( HME.FLGBAIXADO         = 0 OR ( {0} = 1 AND HME.FLGBAIXAMANUAL = 1) ) ", itensBaixadosManualmente.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (HME.FLGSUSPENSAO = 1 AND 0 = tse.flgenvia))) ", itensApenasSuspensos.ToString(), itensApenasSuspensos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND HME.HMETIPOMOV IN (1, 4)) ) ", itensPrestEncargos.ToString(), itensPrestEncargos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR 1 = tse.flgenvia))) ", itensNaoSuspensos.ToString(), itensNaoSuspensos.ToString());
            query.Append(" AND HME.IDITEMEMPTMO         = IRT.IDITEMEMPTMO ");
            query.Append(" AND IRT.IDITEMEMPTMO         = IRC.IDITEMEMPTMO ");
            query.Append(" AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO ");
            query.Append(" AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append(" GROUP BY IRC.ITEDESCRICAO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO");
            query.Append(" ORDER BY IRC.ITEDESCRICAO");


            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString()))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "ID_CONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "ID_TIPOCONTRATOEMPTMO", DbType.Int32, idTipoContrato);

                // Popula objeto resultante
                List<Historico> itensemAberto = new List<Historico>();

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        if (i >= index && i < (index + 400))
                        {
                            Historico hist = new Historico();

                            hist.id = 0;
                            hist.item = new ItemContrato()
                            {
                                id = Convert.ToInt32(leitor.GetValue(7)),
                                descricao = leitor.obterString(0).Replace("Parcela em Atraso - ", ""),
                                regra = new Regra()
                                {
                                    id = 0
                                },
                                suspensao = 0
                            };
                            hist.anoMesCobranca = leitor.obterString(1);
                            hist.anoCompetencia = leitor.obterValorInteiro(2);
                            hist.mesCompetencia = leitor.obterValorInteiro(3);
                            hist.sequenciaCobranca = Convert.ToInt32(leitor.GetValue(4));
                            hist.numeroContrato = Convert.ToInt64(leitor.GetValue(6));
                            hist.baixado = leitor.obterValorInteiro(10);
                            hist.dataPrevista = leitor.obterValorData(9);
                            hist.valorPrevisto = (double)leitor.obterDecimal(10);
                            hist.saldoDevedor = (double)leitor.obterDecimal(10); //leitor.GetDouble(11);
                            hist.taxaJuros = leitor.obterValorDecimal(13) != null ? (double?)leitor.obterValorDecimal(13) : null;
                            hist.parcela = leitor.obterValorInteiro(14);
                            hist.parcelaAlternativa = Convert.ToInt32(leitor.GetValue(15));
                            hist.numeroParcelas = Convert.ToInt32(leitor.GetValue(16));
                            hist.dataEfetiva = leitor.obterValorData(18);
                            hist.valorEfetivo = leitor.obterValorDecimal(19) != null ? (double?)leitor.obterValorDecimal(19) : null;
                            hist.itemCentraliza = (leitor.IsDBNull(21) ? null : new ItemContrato { id = Convert.ToInt64(leitor.GetValue(21)) });
                            hist.idRegra = leitor.obterInt(22);
                            hist.origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(Convert.ToInt32(leitor.GetValue(23)));
                            hist.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(24)));
                            hist.codigoDocumento = leitor.obterValorInt64(25);
                            hist.centraliza = leitor.obterValorInteiro(26);
                            hist.destacado = leitor.obterValorInteiro(27);
                            hist.anoCobranca = leitor.obterValorInteiro(28);
                            hist.mesCobranca = leitor.obterValorInteiro(29);
                            hist.dataVencimento = null;
                            hist.envio = 0;
                            hist.baixaManual = leitor.obterValorInteiro(30);
                            hist.suspenso = leitor.obterValorInteiro(31);
                            hist.formaCobranca = null;
                            hist.statusDocumento = null;
                            hist.tipoSuspensao = new TipoSuspensao()
                            {
                                descricao = null,
                                atualizaSaldoDevedor = 0,
                                id = 0
                            };
                            hist.tipoDivergencia = 0;

                            itensemAberto.Add(hist);
                        }
                        i++;
                    }
                }
                return itensemAberto;
            }
        }

        //SIG 67808 - Campanha Descontos- Matias
        public List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            StringBuilder query = new StringBuilder();

            //Consulta
            query.Append(" SELECT ");
            query.Append(" NULL AS FLGESCOLHA, ");
            query.Append(" 0 IDHISTMOVEMPTMO, ");
            query.Append(" IRC.ITEDESCRICAO, ");
            query.Append(" NULL AS ANOMES, ");
            query.Append(" 0 HMEANOCOMPETENCIA,");
            query.Append(" 0 HMEMESCOMPETENCIA,");
            query.Append(" 0 HMESEQCOBRANCA, ");
            query.Append(" 0 HMETIPOMOV,");
            query.Append(" HME.IDCONTRATOEMPTMO,");
            query.Append(" HME.IDITEMEMPTMO,");
            query.Append(" 0 FLGBAIXADO,");
            query.Append(" NULL HMEDATAPREVISTA,");
            query.Append(" TO_CHAR(SUM(HME.HMEVLRPREVISTO)) HMEVLRPREVISTO,");
            query.Append(" 0 HMESALDODEV,");
            query.Append(" 0 PLNCODIGO, ");
            query.Append(" 0 HMETXJUROS, ");
            query.Append(" 0 HMEPARCELA, ");
            query.Append(" 0 HMEPARCELAALT, ");
            query.Append(" 0 HMENUMPARCELAS, ");
            query.Append(" NULL HMEDATAATUALIZA, ");
            query.Append(" NULL HMEDATAEFETIVA,");
            query.Append(" 0 HMEVLREFETIVO,");
            query.Append(" 0 HMERECPAG,");
            query.Append(" 0 IDITEMCENTRALIZA, ");
            query.Append(" 0 IDREGRA,");
            query.Append(" 0 HMEORIGEM,");
            query.Append(" 0 HMEPRIORIDADE, ");
            query.Append(" 0 HMETIPOMOV,");
            query.Append(" 0 HMEFORMACOBRANCA,");
            query.Append(" 0 IDRUBRICA,");
            query.Append(" 0 IDPATRO,");
            query.Append(" 0 CODDOCUMENTO,");
            query.Append(" 0 IDTMPDESC,");
            query.Append(" 0 HMECENTRALIZA,");
            query.Append(" 0 HMEDESTACADO,");
            query.Append(" 0 HMEANOCOBRANCA,");
            query.Append(" 0 HMEMESCOBRANCA,");
            query.Append(" NULL HMEDATAVENCTO,");
            query.Append(" 0 FLGENVIO, ");
            query.Append(" 0 FLGBAIXAMANUAL, ");
            query.Append(" 0 FLGSUSPENSAO, ");
            query.Append(" NULL AS FORMACOBRANCA ");
            //query.Append(" DECODE(HME.FLGBAIXAMANUAL, 1, 'Baixa Manual', DECODE(HME.FLGSUSPENSAO, 1, 'Suspenso', NULL)) AS STATUS, ");
            //query.Append(" TSE.TSEDESCRICAO, TSE.FLGATUALSALDOPARC, IRT.IDREGRACALC, HME.IDTIPOSUSPEMPTMO, IRT.FLGSUSPENSO, TSE.FLGCOBRJUDICIAL, HME.FLGTIPODIVERG "); //William Moreira da Silva - SOL 250843
            query.Append(" FROM ");
            query.Append(" HISTMOVEMPTMO  HME, ");
            query.Append(" CM.CONTRATOEMPTMO CON, ");
            query.Append(" CM.TIPOSUSPEMPTMO TSE, ");
            //query.Append(" CM.ITEMXTIPOCONTR IRT, ");
            query.Append(" CM.ITEMEMPTMO     IRC ");
            query.Append(" WHERE ");
            query.Append(" HME.IDCONTRATOEMPTMO     = :ID_CONTRATOEMPTMO ");
            //query.Append(" AND IRT.IDTIPOCONTREMPTMO    = :ID_TIPOCONTRATOEMPTMO ");
            query.Append(" AND HME.IDITEMEMPTMO         = IRC.IDITEMEMPTMO ");
            //query.Append(" AND IRT.IDITEMEMPTMO         = IRC.IDITEMEMPTMO ");
            query.Append(" AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO ");
            query.Append(" AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) ");
            query.Append(" AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO    = 1 ) ");
            query.Append(" AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 7) ");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append(" AND NVL(HME.FLGABONADO, 0)   = 0 ");
            query.Append(" AND NVL(HME.FLGQUITADO, 0)   = 0 ");
            query.AppendFormat(" AND ( HME.FLGBAIXADO         = 0 OR ( {0} = 1 AND HME.FLGBAIXAMANUAL = 1) ) ", itensBaixadosManualmente.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (HME.FLGSUSPENSAO = 1 AND 0 = tse.flgenvia))) ", itensApenasSuspensos.ToString(), itensApenasSuspensos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND HME.HMETIPOMOV IN (1, 4)) ) ", itensPrestEncargos.ToString(), itensPrestEncargos.ToString());
            query.AppendFormat(" AND ( NVL( {0} , 0) = 0 OR ( {1} = 1 AND (NVL(HME.FLGSUSPENSAO, 0) = 0 OR 1 = tse.flgenvia))) ", itensNaoSuspensos.ToString(), itensNaoSuspensos.ToString());
            query.Append(" GROUP BY IRC.ITEDESCRICAO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO");
            query.Append(" ORDER BY IRC.ITEDESCRICAO");
            //query.Append(" HME.HMEPARCELA, ");
            //query.Append(" HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, ");
            //query.Append(" HME.HMETIPOMOV, HME.HMESEQCOBRANCA ");

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString()))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "ID_CONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "ID_TIPOCONTRATOEMPTMO", DbType.Int32, idTipoContrato);

                // Popula objeto resultante
                List<Historico> itensemAberto = new List<Historico>();

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Historico hist = new Historico();
                       
                            hist.id = Convert.ToInt64(leitor.GetValue(1));
                            hist.item = new ItemContrato()
                            {
                                id = Convert.ToInt64(leitor.GetValue(9)),
                                descricao = leitor.obterString(2).Replace("Parcela em Atraso - ", ""),
                                regra = new Regra()
                                {
                                    id = 0 //Convert.ToInt32(leitor.GetValue(45))
                                },
                                suspensao = 0// Convert.ToInt32(leitor.GetValue(47))
                            };
                            hist.anoMesCobranca = leitor.obterString(3);
                            hist.anoCompetencia = leitor.obterValorInteiro(4);
                            hist.mesCompetencia = leitor.obterValorInteiro(5);
                            hist.sequenciaCobranca = Convert.ToInt32(leitor.GetValue(6));
                            hist.numeroContrato = Convert.ToInt64(leitor.GetValue(8));
                            hist.baixado = leitor.obterValorInteiro(10);
                            hist.dataPrevista = leitor.obterValorData(11);
                            hist.valorPrevisto = (double)leitor.obterDecimal(12);
                            hist.saldoDevedor = (double)leitor.obterDecimal(13);//leitor.GetDouble(13);
                            hist.taxaJuros = leitor.obterValorDecimal(15) != null ? (double?)leitor.obterValorDecimal(15) : null;
                            hist.parcela = leitor.obterValorInteiro(16);
                            hist.parcelaAlternativa = Convert.ToInt32(leitor.GetValue(17));
                            hist.numeroParcelas = Convert.ToInt32(leitor.GetValue(18));
                            hist.dataEfetiva = leitor.obterValorData(20);//Segundo o PLANUS essa data é a data da baixa
                            hist.valorEfetivo = leitor.obterValorDecimal(21) != null ? (double?)leitor.obterValorDecimal(21) : null;
                            hist.itemCentraliza = new ItemContrato { id = Convert.ToInt64(leitor.GetValue(23)) };
                            hist.idRegra = Convert.ToInt32(leitor.GetValue(24));
                            hist.origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(Convert.ToInt32(leitor.GetValue(25)));
                            hist.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(27)));
                            
                            hist.codigoDocumento = leitor.obterValorInt64(31);
                            hist.centraliza = leitor.obterValorInteiro(33);
                            hist.destacado = leitor.obterValorInteiro(34);
                            hist.anoCobranca = leitor.obterValorInteiro(35);
                            hist.mesCobranca = leitor.obterValorInteiro(36);
                            //anoMesCobranca = String.Format("{1:D2}/{0}"; Convert.ToInt32(leitor.GetValue(35)); leitor.GetValue(36).ToString());
                            hist.dataVencimento = leitor.obterValorData(37);
                            hist.envio = 0; //Convert.ToInt32(leitor.GetValue(38));
                            hist.baixaManual = 0; //Convert.ToInt32(leitor.GetValue(39));
                            hist.suspenso = 0; //Convert.ToInt32(leitor.GetValue(40));
                            hist.formaCobranca = null; //leitor.obterString(41);
                            hist.statusDocumento = null; //leitor.obterString(42);
                        hist.tipoSuspensao = new TipoSuspensao()
                        {
                            descricao = null, //leitor.obterString(43),
                            atualizaSaldoDevedor = 0,// Convert.ToInt32(leitor.GetValue(44)),
                                id = 0 //Convert.ToInt32(leitor.GetValue(46))
                         };
                        hist.tipoDivergencia = 0;// Convert.ToInt32(leitor.GetValue(49))//William Moreira da Silva - SOL 250843
                       
                        itensemAberto.Add(hist);
                    }
                }
                return itensemAberto;
            }
        }
        #endregion

        #region Alteração

        /// <summary>
        /// Atualiza o historico do contrato com uma suspensao.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        public void atualizarHistoricoAbono(Historico historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query = "";

            query = @" UPDATE HISTMOVEMPTMO H
                           SET H.FLGABONADO =   		:FLGABONADO_P,
                           H.HMEDATAQUITABONO =   	:HMEDATAQUITABONO_P,
                           H.FLGTRATINDIV =          :FLGTRATINDIV_P,
                           H.HMEDATATRATINDIV =      :HMEDATATRATINDIV_P
                           WHERE ((" + historico.parcela + @" = HMEPARCELA AND HMECENTRALIZA = 1)
                               OR (" + historico.parcela + @" = HMEPARCELA AND HMECENTRALIZA = 0 AND HMEDESTACADO = 0))
                              AND IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //Suspencao
                if (historico.abonado.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGABONADO_P", DbType.Int64, historico.abonado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGABONADO_P", DbType.Int64, null);

                //Data Abono/Quitacao
                if (historico.dataAbonoQuitacao.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAQUITABONO_P", DbType.DateTime, historico.dataAbonoQuitacao);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAQUITABONO_P", DbType.DateTime, null);

                //Tratamento individual
                if (historico.tratamentoIndividual.HasValue)
                {
                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int64, historico.tratamentoIndividual);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, historico.data);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int64, DBNull.Value);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, DBNull.Value);
                }

                //IDHISTMOVEMPTMO - Where do Update
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, historico.numeroContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        /// <summary>
        /// Atualiza o historico do contrato com uma suspensao.
        /// </summary>
        /// <param name="historico">Dados do item de histórico.</param>
        public void atualizarHistoricoSuspensaoItensCentralizados(Historico historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query = "";

            query = @" UPDATE HISTMOVEMPTMO H
                           SET H.FLGSUSPENSAO =      :FLGSUSPENSAO_P,
                           H.IDTIPOSUSPEMPTMO =   	 :IDTIPOSUSPEMPTMO_P,
                           H.FLGTRATINDIV =          :FLGTRATINDIV_P,
                           H.HMEDATATRATINDIV =      :HMEDATATRATINDIV_P
                           WHERE ((" + historico.parcela + @" = HMEPARCELA AND HMECENTRALIZA = 1)
                               OR (" + historico.parcela + @" = HMEPARCELA AND HMECENTRALIZA = 0 AND HMEDESTACADO = 0))
                              AND IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //Suspencao
                if (historico.suspenso.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGSUSPENSAO_P", DbType.Int64, historico.suspenso);
                else
                    bancoDeDados.AddInParameter(comando, "FLGSUSPENSAO_P", DbType.Int64, null);

                //TIPOSUSP
                if (historico.idTipoSusp.HasValue)
                    bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int64, historico.idTipoSusp);
                else
                    bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int64, null);

                //Tratamento individual
                if (historico.tratamentoIndividual.HasValue)
                {
                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int64, historico.tratamentoIndividual);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, historico.data);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int64, DBNull.Value);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, DBNull.Value);
                }

                //IDHISTMOVEMPTMO - Where do Update
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, historico.numeroContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        public void atualizarHistorico(Historico historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE HISTMOVEMPTMO H 
            	SET H.HMETIPOMOV =   	:HMETIPOMOV_P,
              H.HMEPARCELA =		    :HMEPARCELA_P,
              H.HMEPARCELAALT =    	:HMEPARCELAALT_P,
              H.HMESEQCOBRANCA =   	:HMESEQCOBRANCA_P,
              H.HMENUMPARCELAS =   	:HMENUMPARCELAS_P,
              H.HMEMESCOMPETENCIA =  	:HMEMESCOMPETENCIA_P,
              H.HMEANOCOMPETENCIA =  	:HMEANOCOMPETENCIA_P,
              H.HMEMESCOBRANCA =   	:HMEMESCOBRANCA_P,
              H.HMEANOCOBRANCA =   	:HMEANOCOBRANCA_P,
              H.HMEFORMACOBRANCA =   	:HMEFORMACOBRANCA_P,
              H.HMETIPOFOLHA =   	    :HMETIPOFOLHA_P,
              H.HMEDATAPREVISTA =   	:HMEDATAPREVISTA_P,
              H.HMEDATAVENCTO =   	:HMEDATAVENCTO_P,
              H.HMEDATAEFETIVA =   	:HMEDATAEFETIVA_P,
              H.HMESALDODEV =   		:HMESALDODEV_P,
              H.HMEDATAATUALIZA =  	:HMEDATAATUALIZA_P,
              H.HMEVLRPREVISTO =   	:HMEVLRPREVISTO_P,
              H.HMEVLREFETIVO =   	:HMEVLREFETIVO_P,
              H.HMEVLRBASE =   		:HMEVLRBASE_P,
              H.HMETXJUROS =   		:HMETXJUROS_P,
              H.PLNCODIGO =    		:PLNCODIGO_P,
              H.FLGABONADO =   		:FLGABONADO_P,
              H.FLGQUITADO =   		:FLGQUITADO_P,
              H.HMEDATAQUITABONO =   	:HMEDATAQUITABONO_P,
              H.FLGBAIXADO =   		:FLGBAIXADO_P,
              H.FLGBAIXAMANUAL =   	:FLGBAIXAMANUAL_P,
              H.HMEDATAESTORNO =   	:HMEDATAESTORNO_P,
              H.FLGESTORNADO =   	    :FLGESTORNADO_P,
              H.PLNCODIGOESTORNO =   	:PLNCODIGOESTORNO_P,
              H.FLGENVIO =   		    :FLGENVIO_P,
              H.CODDOCUMENTO =   	    :CODDOCUMENTO_P,
              H.IDTMPDESC =   		:IDTMPDESC_P,
              H.FLGDIVERGPEND =   	:FLGDIVERGPEND_P,
              H.FLGTIPODIVERG =   	:FLGTIPODIVERG_P,
              H.FLGDIVERGTRAT =   	:FLGDIVERGTRAT_P,
              H.FLGENTRADAMANUAL =   	:FLGENTRADAMANUAL_P,
              H.FLGSUSPENSAO =   	    :FLGSUSPENSAO_P,
              H.IDTIPOSUSPEMPTMO =   	:IDTIPOSUSPEMPTMO_P,
              H.HMERECPAG =   		    :HMERECPAG_P,
              H.HMECENTRALIZA =   	    :HMECENTRALIZA_P,
              H.HMEDESTACADO =   	    :HMEDESTACADO_P,
              H.IDTIPORECURSO =         :IDTIPORECURSO_P,
              H.ORIGEMRECURSO =         :ORIGEMRECURSO_P,
              H.FLGTRATINDIV =          :FLGTRATINDIV_P,
              H.HMEDATATRATINDIV =      :HMEDATATRATINDIV_P,
              H.HMEOBSERVACAO =         :HMEOBSERVACAO_P 

              WHERE   H.IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                //Evento
                //William Moreira da Silva - SOL 207977
                if (historico.tipoMovimento.chave > 0)
                    bancoDeDados.AddInParameter(comando, "HMETIPOMOV_P", DbType.Int64, historico.tipoMovimento.chave);
                //William Moreira da Silva - SOL 207977
                else
                    bancoDeDados.AddInParameter(comando, "HMETIPOMOV_P", DbType.Int64, null);

                //Item
                //if (historico.item.id > 0)
                //    bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, historico.item.id);
                //else
                //    bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, null);

                //Parcela
                if (historico.parcela.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEPARCELA_P", DbType.Int64, historico.parcela);
                else
                    bancoDeDados.AddInParameter(comando, "HMEPARCELA_P", DbType.Int64, null);

                //Parcela Alt
                if (historico.parcelaAlternativa > 0)
                    bancoDeDados.AddInParameter(comando, "HMEPARCELAALT_P", DbType.Int64, historico.parcelaAlternativa);
                else
                    bancoDeDados.AddInParameter(comando, "HMEPARCELAALT_P", DbType.Int64, null);

                //Seq - 
                if (historico.sequenciaCobranca > 0)
                    bancoDeDados.AddInParameter(comando, "HMESEQCOBRANCA_P", DbType.Int64, historico.sequenciaCobranca);
                else
                    bancoDeDados.AddInParameter(comando, "HMESEQCOBRANCA_P", DbType.Int64, null);

                //Restam - Numero Parcela
                if (historico.numeroParcelas > 0)
                    bancoDeDados.AddInParameter(comando, "HMENUMPARCELAS_P", DbType.Int64, historico.numeroParcelas);
                else
                    bancoDeDados.AddInParameter(comando, "HMENUMPARCELAS_P", DbType.Int64, null);

                //Mes competencia
                if (historico.mesCompetencia.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEMESCOMPETENCIA_P", DbType.Int64, historico.mesCompetencia);
                else
                    bancoDeDados.AddInParameter(comando, "HMEMESCOMPETENCIA_P", DbType.Int64, null);

                //Ano competencia
                if (historico.anoCompetencia.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEANOCOMPETENCIA_P", DbType.Int64, historico.anoCompetencia);
                else
                    bancoDeDados.AddInParameter(comando, "HMEANOCOMPETENCIA_P", DbType.Int64, null);

                //Mes cobrança
                if (historico.mesCobranca.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEMESCOBRANCA_P", DbType.Int64, historico.mesCobranca);
                else
                    bancoDeDados.AddInParameter(comando, "HMEMESCOBRANCA_P", DbType.Int64, null);

                //Ano cobrança
                if (historico.anoCobranca.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEANOCOBRANCA_P", DbType.Int64, historico.anoCobranca);
                else
                    bancoDeDados.AddInParameter(comando, "HMEANOCOBRANCA_P", DbType.Int64, null);

                //Forma Cobranca
                bancoDeDados.AddInParameter(comando, "HMEFORMACOBRANCA_P", DbType.String, historico.formaCobranca);

                //Tipo Folha
                bancoDeDados.AddInParameter(comando, "HMETIPOFOLHA_P", DbType.String, historico.tipoFolha);

                //Data Prevista
                if (historico.dataPrevista.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAPREVISTA_P", DbType.DateTime, historico.dataPrevista);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAPREVISTA_P", DbType.DateTime, null);

                //Data Vencimento
                if (historico.dataVencimento.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAVENCTO_P", DbType.DateTime, historico.dataVencimento);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAVENCTO_P", DbType.DateTime, null);

                //Data Efetiva
                if (historico.dataEfetiva.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAEFETIVA_P", DbType.DateTime, historico.dataEfetiva);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAEFETIVA_P", DbType.DateTime, null);

                //Saldo Devedor
                if (historico.saldoDevedor > 0)
                    bancoDeDados.AddInParameter(comando, "HMESALDODEV_P", DbType.Double, historico.saldoDevedor);
                else
                    bancoDeDados.AddInParameter(comando, "HMESALDODEV_P", DbType.Double, null);

                //Data Atualizacao
                if (historico.dataAtualizacao > DateTime.MinValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAATUALIZA_P", DbType.DateTime, historico.dataAtualizacao);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAATUALIZA_P", DbType.DateTime, null);

                //Wylliam Leite da Silva - SOL: 254373 PPM: 797160 - Início
                //Valor Previsto
                //if (historico.valorPrevisto > 0)
                bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, historico.valorPrevisto);
                //else
                //bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, null);
                //Wylliam Leite da Silva - SOL: 254373 PPM: 797160 - Fim

                //Valor Efetivo
                if (historico.valorEfetivo.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEVLREFETIVO_P", DbType.Double, historico.valorEfetivo);
                else
                    bancoDeDados.AddInParameter(comando, "HMEVLREFETIVO_P", DbType.Double, null);

                //Valor Base
                if (historico.valorBase.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEVLRBASE_P", DbType.Double, historico.valorBase);
                else
                    bancoDeDados.AddInParameter(comando, "HMEVLRBASE_P", DbType.Double, null);

                //Taxa Juros
                if (historico.taxaJuros.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMETXJUROS_P", DbType.Double, historico.taxaJuros.Value);
                else
                    bancoDeDados.AddInParameter(comando, "HMETXJUROS_P", DbType.Double, null);

                //Planilha - PLNCODIGO
                if (historico.planilha.HasValue)
                    bancoDeDados.AddInParameter(comando, "PLNCODIGO_P", DbType.Int64, historico.planilha);
                else
                    bancoDeDados.AddInParameter(comando, "PLNCODIGO_P", DbType.Int64, null);

                //Abonado
                if (historico.abonado.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGABONADO_P", DbType.Int64, historico.abonado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGABONADO_P", DbType.Int64, null);

                //Quitado
                if (historico.quitado.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGQUITADO_P", DbType.Int64, historico.quitado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGQUITADO_P", DbType.Int64, null);

                //Data Abono/Quitacao
                if (historico.dataAbonoQuitacao.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAQUITABONO_P", DbType.DateTime, historico.dataAbonoQuitacao);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAQUITABONO_P", DbType.DateTime, null);

                //Baixado
                if (historico.baixado.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGBAIXADO_P", DbType.Int64, historico.baixado);
                else
                    bancoDeDados.AddInParameter(comando, "FLGBAIXADO_P", DbType.Int64, null);

                //Baixa Manual
                if (historico.baixaManual.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGBAIXAMANUAL_P", DbType.Int64, historico.baixaManual);
                else
                    bancoDeDados.AddInParameter(comando, "FLGBAIXAMANUAL_P", DbType.Int64, null);

                //Data Estorno
                if (historico.dataDoEstorno.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDATAESTORNO_P", DbType.DateTime, historico.dataDoEstorno);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDATAESTORNO_P", DbType.DateTime, null);

                //Estornado
                if (historico.estorno.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGESTORNADO_P", DbType.Int64, historico.estorno);
                else
                    bancoDeDados.AddInParameter(comando, "FLGESTORNADO_P", DbType.Int64, null);

                //PLN
                if (historico.plnCodEstorno.HasValue)
                    bancoDeDados.AddInParameter(comando, "PLNCODIGOESTORNO_P", DbType.Int64, historico.plnCodEstorno);
                else
                    bancoDeDados.AddInParameter(comando, "PLNCODIGOESTORNO_P", DbType.Int64, null);

                //Enviado
                //William Moreira da Silva - SOL 207977
                //if (historico.enviado.HasValue)
                if (historico.envio.HasValue)
                    //William Moreira da Silva - SOL 207977
                    //bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, historico.enviado);
                    bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, historico.envio);
                else
                    bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, null);


                //Cod Documento
                if (historico.codigoDocumento.HasValue)
                    bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, historico.codigoDocumento);
                else
                    bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, null);

                //IdTmpDesc
                if (historico.idTipoSusp.HasValue)
                    bancoDeDados.AddInParameter(comando, "IDTMPDESC_P", DbType.Int64, historico.idTipoSusp);
                else
                    bancoDeDados.AddInParameter(comando, "IDTMPDESC_P", DbType.Int64, null);

                //Divergente
                if (historico.divergencia.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGPEND_P", DbType.Int64, historico.divergencia);
                else
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGPEND_P", DbType.Int64, null);

                //Motivo Divergencia
                if (historico.tipoDivergencia > 0)
                    bancoDeDados.AddInParameter(comando, "FLGTIPODIVERG_P", DbType.Int64, historico.tipoDivergencia);
                else
                    bancoDeDados.AddInParameter(comando, "FLGTIPODIVERG_P", DbType.Int64, null);

                //Divergencia Tratada
                if (historico.divergenciaTratada.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGTRAT_P", DbType.Int64, historico.divergenciaTratada);
                else
                    bancoDeDados.AddInParameter(comando, "FLGDIVERGTRAT_P", DbType.Int64, null);

                //Entrada Manual
                if (historico.entradaManual.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGENTRADAMANUAL_P", DbType.Int64, historico.entradaManual);
                else
                    bancoDeDados.AddInParameter(comando, "FLGENTRADAMANUAL_P", DbType.Int64, null);

                //Suspencao
                if (historico.suspenso.HasValue)
                    bancoDeDados.AddInParameter(comando, "FLGSUSPENSAO_P", DbType.Int64, historico.suspenso);
                else
                    bancoDeDados.AddInParameter(comando, "FLGSUSPENSAO_P", DbType.Int64, null);

                //IdTipoSusp
                if (historico.idTipoSusp.HasValue)
                    bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int64, historico.idTipoSusp);
                else
                    bancoDeDados.AddInParameter(comando, "IDTIPOSUSPEMPTMO_P", DbType.Int64, null);

                //Pagar Receber
                bancoDeDados.AddInParameter(comando, "HMERECPAG_P", DbType.String, historico.pagarReceber);

                //Centralizado
                if (historico.centraliza.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMECENTRALIZA_P", DbType.Int64, historico.centraliza);
                else
                    bancoDeDados.AddInParameter(comando, "HMECENTRALIZA_P", DbType.Int64, null);

                //Destacado
                if (historico.destacado.HasValue)
                    bancoDeDados.AddInParameter(comando, "HMEDESTACADO_P", DbType.Int64, historico.destacado);
                else
                    bancoDeDados.AddInParameter(comando, "HMEDESTACADO_P", DbType.Int64, null);

                //William Moreira da Silva - SOL 207977
                //id do tipo do recurso
                if (historico.tipoRecurso != null && historico.tipoRecurso.id > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDTIPORECURSO_P", DbType.Int32, historico.tipoRecurso.id);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "IDTIPORECURSO_P", DbType.Int32, DBNull.Value);
                }

                //Origem do Recurso
                bancoDeDados.AddInParameter(comando, "ORIGEMRECURSO_P", DbType.String, historico.origemRecurso);

                //Tratamento individual
                if (historico.tratamentoIndividual.HasValue)
                {

                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int64, historico.tratamentoIndividual);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, historico.data);
                }
                else
                {
                    bancoDeDados.AddInParameter(comando, "FLGTRATINDIV_P", DbType.Int64, DBNull.Value);
                    bancoDeDados.AddInParameter(comando, "HMEDATATRATINDIV_P", DbType.DateTime, DBNull.Value);
                }
                bancoDeDados.AddInParameter(comando, "HMEOBSERVACAO_P", DbType.String, historico.observacao);

                //William Moreira da Silva - SOL 207977

                //IDHISTMOVEMPTMO - Where do Update
                bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, historico.id);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        /// <summary>
        /// Altera a observação do histórico.
        /// </summary>
        /// <param name="idHistorico">ID do histórico.</param>
        /// <param name="observacao">Observação do Histórico.</param>
        public void alterarObservacao(long idHistorico, string observacao)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE HISTMOVEMPTMO 
             SET HMEOBSERVACAO  = :OBSERVACAO_P 
             WHERE  IDHISTMOVEMPTMO = :IDHISTORICO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "OBSERVACAO_P", DbType.String, observacao);
                bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        #endregion

        #region Excluir

        public void excluir(long idHistorico)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" DELETE HISTMOVEMPTMO 
             WHERE  IDHISTMOVEMPTMO = :IDHISTORICO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        #endregion

        #region IAcessoHistorico Members

        #endregion

        #region IAcessoHistorico Members

        #endregion

        //Campanha Desconto
        public List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, long idPessoa, DateTime dataCalculo, int tipoProposta, long idCalculo = 0)
        {
            List<Historico> ListaHistoricos = new List<Historico>();

            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(conexaoOracle))
            {
                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "cm.PCK_AA_EMPTMO_DESCONTO.pr_busca_desconto_inad";

                    cmd.Parameters.Add("pIdContratoEmptmo", OracleDbType.Int64).Value = numeroContrato;
                    cmd.Parameters.Add("pIdPessoa", OracleDbType.Int64).Value = idPessoa;
                    cmd.Parameters.Add("pDataCalculo", OracleDbType.Date).Value = dataCalculo.Date;
                    cmd.Parameters.Add("pTipoProposta", OracleDbType.Int32).Value = tipoProposta;
                    cmd.Parameters.Add("pIdCalculo", OracleDbType.Int64).Value = idCalculo;


                    cmd.Parameters.Add("pTotalParcela", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pTotalFGQC", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pTotalCorrMonet", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pTotalJurosRemu", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pTotalJurosMora", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pTotalMulta", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pTotalIofCompl", OracleDbType.Double).Direction = ParameterDirection.Output;

                    cmd.Parameters.Add("pPercParcela", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pPercFGQC", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pPercCorrMonet", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pPercJurosRemu", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pPercJurosMora", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pPercMulta", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pPercIofCompl", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pSaldoDev", OracleDbType.Double).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("pErro", OracleDbType.NVarchar2, 1000).Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    string mensagemErro = cmd.Parameters["pErro"].Value != null ? cmd.Parameters["pErro"].Value.ToString() : string.Empty;
                    double totalParcela;
                    double totalFGQC;
                    double totalCorrecaoMonet;
                    double totalJuros;
                    double totalJurosMora;
                    double totalMulta;
                    double totalIOFCompl;

                    double percentualParcela;
                    double percentualFGQC;
                    double percentualCorrMonet;
                    double percentualJurosRemune;
                    double percentualJurosMora;
                    double percentualMulta;
                    double percentualIofComple;
                    double percentualSaldoDevedor;

                    if (mensagemErro.Length > 0)
                    {
                        totalParcela = 0;
                        totalFGQC = 0;
                        totalCorrecaoMonet = 0;
                        totalJuros = 0;
                        totalJurosMora = 0;
                        totalMulta = 0;
                        totalIOFCompl = 0;

                        percentualParcela = 0;
                        percentualFGQC = 0;
                        percentualCorrMonet = 0;
                        percentualJurosRemune = 0;
                        percentualJurosMora = 0;
                        percentualMulta = 0;
                        percentualIofComple = 0;
                        percentualSaldoDevedor = 0;
                    }
                    else
                    {
                        totalParcela = Convert.ToDouble(cmd.Parameters["pTotalParcela"].Value);
                        totalFGQC = Convert.ToDouble(cmd.Parameters["pTotalFGQC"].Value);
                        totalCorrecaoMonet = Convert.ToDouble(cmd.Parameters["pTotalCorrMonet"].Value);
                        totalJuros = Convert.ToDouble(cmd.Parameters["pTotalJurosRemu"].Value);
                        totalJurosMora = Convert.ToDouble(cmd.Parameters["pTotalJurosMora"].Value);
                        totalMulta = Convert.ToDouble(cmd.Parameters["pTotalMulta"].Value);
                        totalIOFCompl = Convert.ToDouble(cmd.Parameters["pTotalIofCompl"].Value);

                        percentualParcela = Convert.ToDouble(cmd.Parameters["pPercParcela"].Value);
                        percentualFGQC = Convert.ToDouble(cmd.Parameters["pPercFGQC"].Value);
                        percentualCorrMonet = Convert.ToDouble(cmd.Parameters["pPercCorrMonet"].Value);
                        percentualJurosRemune = Convert.ToDouble(cmd.Parameters["pPercJurosRemu"].Value);
                        percentualJurosMora = Convert.ToDouble(cmd.Parameters["pPercJurosMora"].Value);
                        percentualMulta = Convert.ToDouble(cmd.Parameters["pPercMulta"].Value);
                        percentualIofComple = Convert.ToDouble(cmd.Parameters["pPercIofCompl"].Value);
                        percentualSaldoDevedor = Convert.ToDouble(cmd.Parameters["pSaldoDev"].Value);
                    }

                    string descricaoItem;
                    double? valorItem = null;
                    double? percentualItem = 0;
                    double valorDesconto = 0;
                    for (int i = 0; i < 7; i++)
                    {
                        Historico historico = new Historico();
                        switch (i)
                        {
                            case 0:
                                descricaoItem = "Parcela";
                                valorItem = totalParcela;
                                percentualItem = percentualParcela;
                                break;
                            case 1:
                                descricaoItem = "FGQC";
                                valorItem = totalFGQC;
                                percentualItem = percentualFGQC;
                                break;
                            case 2:
                                descricaoItem = "Correção monetária";
                                valorItem = totalCorrecaoMonet;
                                percentualItem = percentualCorrMonet;
                                break;
                            case 3:
                                descricaoItem = "Juros remuneratórios";
                                valorItem = totalJuros;
                                percentualItem = percentualJurosRemune;
                                break;
                            case 4:
                                descricaoItem = "Juros moratórios";
                                valorItem = totalJurosMora;
                                percentualItem = percentualJurosMora;
                                break;
                            case 5:
                                descricaoItem = "Multa por atraso";
                                valorItem = totalMulta;
                                percentualItem = percentualMulta;
                                break;
                            case 6:
                                descricaoItem = "IOF complementar";
                                valorItem = totalIOFCompl;
                                percentualItem = 0;
                                break;
                            default:
                                descricaoItem = "Indefinido";
                                valorItem = percentualSaldoDevedor;
                                break;
                        }
                        historico.id = i;
                        historico.anoMesCobranca = "0";
                        historico.parcela = 0;
                        historico.sequenciaCobranca = 0;
                        historico.formaCobranca = "-";
                        historico.dataPrevista = null;
                        historico.dataVencimento = null;
                        historico.dataEfetiva = null;
                        historico.valorPrevisto = (double)valorItem;
                        historico.valorEfetivo = 0;
                        historico.statusDocumento = percentualItem > 0 ? percentualItem.ToString() + "%" : "-";
                        historico.codigoDocumento = 0;
                        historico.taxaJuros = null;
                        valorDesconto = Math.Round((double)valorItem - ((double)valorItem * (double)percentualItem / 100), 2);
                        historico.saldoDevedor = ((double)valorItem - valorDesconto);
                        historico.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(-1);
                        historico.tipoSuspensao = new TipoSuspensao()
                        {
                            descricao = null,
                            atualizaSaldoDevedor = 0,
                            id = 0
                        };

                        historico.item = new ItemContrato()
                        {
                            id = i,
                            descricao = descricaoItem,
                            valor = (double)valorItem,
                            valorComDesconto = (double)valorDesconto,
                            percentualDesconto = (double)percentualItem,
                            regra = new Regra()
                            {
                                id = i,
                            },
                            suspensao = 0
                        };

                        ListaHistoricos.Add(historico);
                    }
                }
            }



            /*Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("cm.PCK_AA_EMPTMO_DESCONTO.pr_busca_desconto_inad"))
            {

                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "pIdPessoa", DbType.Int32, idPessoa);
                bancoDeDados.AddInParameter(comando, "pDataCalculo", DbType.DateTime, dataCalculo);
                bancoDeDados.AddInParameter(comando, "pTipoProposta", DbType.Int32, tipoProposta);
                bancoDeDados.AddInParameter(comando, "pIdCalculo", DbType.Int64, idCalculo);

                bancoDeDados.AddOutParameter(comando, "pTotalParcela", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pTotalFGQC", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pTotalCorrMonet", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pTotalJurosRemu", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pTotalJurosMora", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pTotalMulta", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pTotalIofCompl", DbType.Double, 30);

                bancoDeDados.AddOutParameter(comando, "pPercParcela", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pPercFGQC", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pPercCorrMonet", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pPercJurosRemu", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pPercJurosMora", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pPercMulta", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pPercIofCompl", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pSaldoDev", DbType.Double, 30);
                bancoDeDados.AddOutParameter(comando, "pErro", DbType.String, 250);
                bancoDeDados.ExecuteNonQuery(comando);

                double? totalParcela = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pTotalParcela").ToString());
                double? totalFGQC = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pTotalFGQC").ToString());
                double? totalCorrecaoMonet = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pTotalCorrMonet").ToString());
                double? totalJuros = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pTotalJurosRemu").ToString());
                double? totalJurosMora = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pTotalJurosMora").ToString());
                double? totalMulta = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pTotalMulta").ToString());
                double? totalIOFCompl = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pTotalIofCompl").ToString());

                double? percentualParcela = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pPercParcela").ToString());
                double? percentualFGQC = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pPercFGQC").ToString());
                double? percentualCorrMonet = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pPercCorrMonet").ToString());
                double? percentualJurosRemune = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pPercJurosRemu").ToString());
                double? percentualJurosMora = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pPercJurosMora").ToString());
                double? percentualMulta = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pPercMulta").ToString());
                double? percentualSaldoDevedor = Convert.ToDouble(bancoDeDados.GetParameterValue(comando, "pSaldoDev").ToString());
                string mensagemErro = bancoDeDados.GetParameterValue(comando, "pErro").ToString();

                string descricaoItem;
                double? valorItem = null;
                double? percentualItem = 0;
                double valorDesconto = 0;
                for (int i = 0; i < 7; i++)
                {
                    Historico historico = new Historico();
                    switch (i)
                    {
                        case 0:
                            descricaoItem = "Parcela";
                            valorItem = totalParcela;
                            percentualItem = percentualParcela;
                            break;
                        case 1:
                            descricaoItem = "FGQC";
                            valorItem = totalFGQC;
                            percentualItem = percentualFGQC;
                            break;
                        case 2:
                            descricaoItem = "Correção monetária";
                            valorItem = totalCorrecaoMonet;
                            percentualItem = percentualCorrMonet;
                            break;
                        case 3:
                            descricaoItem = "Juros remuneratórios";
                            valorItem = totalJuros;
                            percentualItem = percentualJurosRemune;
                            break;
                        case 4:
                            descricaoItem = "Juros moratórios";
                            valorItem = totalJurosMora;
                            percentualItem = percentualJurosMora;
                            break;
                        case 5:
                            descricaoItem = "Multa por atraso";
                            valorItem = totalMulta;
                            percentualItem = percentualMulta;
                            break;
                        case 6:
                            descricaoItem = "IOF complementar";
                            valorItem = totalIOFCompl;
                            percentualItem = 0;
                            break;
                        default:
                            descricaoItem = "Indefinido";
                            valorItem = percentualSaldoDevedor;
                            break;
                    }
                    historico.id = i;
                    historico.anoMesCobranca = "0";
                    historico.parcela = 0;
                    historico.sequenciaCobranca = 0;
                    historico.formaCobranca = "-";
                    historico.dataPrevista = null;
                    historico.dataVencimento = null;
                    historico.dataEfetiva = null;
                    historico.valorPrevisto = (double)valorItem;
                    historico.valorEfetivo = 0;
                    historico.statusDocumento = percentualItem > 0 ? percentualItem.ToString() + "%" : "-";
                    historico.codigoDocumento = 0;
                    historico.taxaJuros = null;
                    valorDesconto = Math.Round((double)valorItem - ((double)valorItem * (double)percentualItem / 100), 2);
                    historico.saldoDevedor = ((double)valorItem - valorDesconto);
                    historico.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(-1);
                    historico.tipoSuspensao = new TipoSuspensao()
                    {
                        descricao = null,
                        atualizaSaldoDevedor = 0,
                        id = 0
                    };

                    historico.item = new ItemContrato()
                    {
                        id = i,
                        descricao = descricaoItem,
                        valor = (double)valorItem,
                        valorComDesconto = (double)valorDesconto,
                        percentualDesconto = (double)percentualItem,
                        regra = new Regra()
                        {
                            id = i,
                        },
                        suspensao = 0
                    };

                    ListaHistoricos.Add(historico);
                }
            }*/
            return ListaHistoricos;

        }

        public EmptmoDocFinanceiroDTO AtualizarEnvioParcelasInadimplentes(long idContratoEmptmo, DateTime DataVencimento, string origemRecurso, int tipoProposta)
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

                        cmd.CommandText = "cm.PCK_AA_EMPTMO_PRESTACAO.pr_atualiza_parcelas_inad";

                        cmd.Parameters.Add("pIdContratoEmptmo", OracleDbType.Double).Value = idContratoEmptmo;
                        cmd.Parameters.Add("pDataLancamento", OracleDbType.Date).Value = DataVencimento;
                        cmd.Parameters.Add("pOrigemRecurso", OracleDbType.NVarchar2, UInt16.MaxValue).Value = origemRecurso;
                        cmd.Parameters.Add("pTipoProposta", OracleDbType.Int32).Value = tipoProposta;
                        cmd.Parameters.Add("pNumeroIP", OracleDbType.NVarchar2, 10).Value = "0";
                        cmd.Parameters.Add("pSessionID", OracleDbType.NVarchar2, 200).Value = "0";
                        cmd.Parameters.Add("pDadosContratoHash", OracleDbType.NVarchar2, 200).Value = "0";
                        cmd.Parameters.Add("pHashAssin", OracleDbType.NVarchar2, 200).Value = "0";
                        cmd.Parameters.Add("pDataHoraAssin", OracleDbType.NVarchar2, 200).Value = DateTime.Now.ToString();
                        cmd.Parameters.Add("pTimezoneOffset", OracleDbType.NVarchar2, 200).Value = "0";
                        cmd.Parameters.Add("pNumCarimbo", OracleDbType.NVarchar2, 200).Value = "0";
                        cmd.Parameters.Add("pCarimboBase64", OracleDbType.NVarchar2, 200).Value = "0";


                        cmd.ExecuteNonQuery();

                        cmd.Parameters.Clear();

                        cmd.CommandText = "cm.PCK_AA_EMPTMO_FINANCEIRO.pr_realiza_envio_boleto";

                        cmd.Parameters.Add("pidcontratoemptmo", OracleDbType.Double).Value = idContratoEmptmo;
                        cmd.Parameters.Add("pdatavencto", OracleDbType.Date).Value = DataVencimento;
                        cmd.Parameters.Add("ptipomov", OracleDbType.Double).Value = 1;
                        cmd.Parameters.Add("pnumparcela", OracleDbType.Double).Value = 0;
                        cmd.Parameters.Add("pvlrdocumento", OracleDbType.Double).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("pportforma", OracleDbType.Double).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("pcoddocumento", OracleDbType.Double).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("perro", OracleDbType.NVarchar2, UInt16.MaxValue).Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("perrcode", OracleDbType.NVarchar2, UInt16.MaxValue).Direction = ParameterDirection.Output;

                        cmd.ExecuteNonQuery();

                        docFinanceiroDTO.portadorForma = Convert.ToInt32(cmd.Parameters["pportforma"].Value);
                        docFinanceiroDTO.numDocumento = Convert.ToDouble(cmd.Parameters["pvlrdocumento"].Value);
                        docFinanceiroDTO.valorDocumento = Convert.ToDouble(cmd.Parameters["pcoddocumento"].Value);
                        docFinanceiroDTO.msgErro = cmd.Parameters["perro"].Value != null && cmd.Parameters["perro"].Value.ToString().Equals("null") ? String.Empty : (cmd.Parameters["perro"].Value != null ? cmd.Parameters["perro"].Value.ToString() : string.Empty);

                        string erro = cmd.Parameters["perrcode"].Value != null && cmd.Parameters["perrcode"].Value.ToString().Equals("null") ? String.Empty : (cmd.Parameters["perrcode"].Value != null ? cmd.Parameters["perrcode"].Value.ToString() : string.Empty);
                        docFinanceiroDTO.codErro = erro; 
                    } 
                }

            }
            catch (Exception ex)
            {
                docFinanceiroDTO = null;
                throw ex;
            }
            return docFinanceiroDTO;
        }

        public bool ValidarData(DateTime dataOperacao)
        {
            DateTime dataLimiteMax = ObterProximoDiaUtil(DateTime.Today);
            DateTime dataLimiteMin = ObterUltimoDiaUtilBoleto();
            return ValidarDatas(dataOperacao);
        }

        public DateTime ObterUltimoDiaUtilBoleto()
        {
            DateTime ultimoDiaUtil = DateTime.Now.Date;
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @" SELECT cm.PCK_AA_EMPTMO_FINANCEIRO.fn_ultimo_dia_util_boleto FROM DUAL";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        ultimoDiaUtil = leitor.obterValorData(0).Value;
                    }
                } 
            }
            return ultimoDiaUtil;
        }

        public DateTime ObterProximoDiaUtil(DateTime data)
        {
            DateTime diaUtil = DateTime.Now.Date;
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @" SELECT cm.pck_aa_funcao_emptmo.fn_proximo_dia_util(:pDataVerificar) FROM DUAL";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pDataVerificar", DbType.Date, data);
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        diaUtil = leitor.obterValorData(0).Value;
                    }
                } 
            }

            return diaUtil;
        }

        private bool ValidarDatas(DateTime DataVencimento)
        {
            bool resultado = false;
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @" SELECT cm.pck_aa_funcao_emptmo.fn_verifica_dia_util(:pData) FROM DUAL";
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pData", DbType.Date, DataVencimento);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        resultado = Convert.ToBoolean(leitor.GetValue(0));
                    }
                }
            }

            return resultado;
        }

        //Campanha desconto
        public List<Historico> buscarHistoricoDePrestacoesEmAberto(long numeroContrato, List<int> prestacoes)
        {
            List<Historico> itensHistorico = new List<Historico>();

            Database bancoDeDados = this.obterBancoDeDados();

            string query = @"SELECT LTRIM(to_char(hp.vlrprevisto,'999999999990d00')), --evitar erro de NLS_LANG do TIBERO
       hp.parcela,
       hp.parcelaalt,
       hp.datavencto,
       hp.dataprevista,
       1 AS TIPOMOV,
       to_char(nvl(c.txjuros,0)), --evitar erro de NLS_LANG do TIBERO
       to_char(nvl(hp.saldodev,0)), --evitar erro de NLS_LANG do TIBERO
       hp.origem,
       hp.naturezaitem,
       hp.flgbaixamanual,
       hp.flgbaixado,
       hp.flgenvio,
       hp.seqcobranca,
       hp.numparcelas,
       ixt.flggravazero,
       hp.recpag,
       hp.idhistmovemptmo,
       hp.iditememptmo,
       i.itedescricao,
       hp.idtiposuspemptmo,
       henv.coddocumento,
       hp.formacobranca,
       ht.flgtipodiverg,
       (SELECT itc.iditememptmo
        FROM itemxtipocontr itc
        WHERE itc.itcevento = 1
        AND   itc.flgcentraliza = 1
        AND   itc.idtipocontremptmo = c.idtipocontremptmo) AS ITEMCENTRALIZA,
       ts.idtiposuspemptmo,
       ts.tsedescricao,
       ts.flgatualsaldoparc
FROM hmeprestacao hp
     JOIN contratoemptmo c ON c.idcontratoemptmo = hp.idcontratoemptmo
     JOIN itemxtipocontr ixt ON ixt.iditememptmo = hp.iditememptmo
                             AND ixt.idtipocontremptmo = c.idtipocontremptmo
     JOIN itememptmo i ON i.iditememptmo = hp.iditememptmo
     LEFT JOIN hmeenvio henv ON henv.idhistmovemptmo = hp.idhistmovemptmo
     LEFT JOIN hmetratadiverg ht ON ht.idhistmovemptmo = hp.idhistmovemptmo
     LEFT JOIN tiposuspemptmo ts ON ts.idtiposuspemptmo = hp.idtiposuspemptmo
WHERE hp.idcontratoemptmo = ?
AND   hp.parcela = ?
AND   hp.naturezaitem > 0 
AND   hp.flgquitabonoestorno = 0
AND   hp.vlrprevisto > 0
AND   hp.origem IN (1,11,12)
AND   hp.vlrefetivo is null
UNION ALL
SELECT LTRIM(to_char(he.vlrprevisto,'999999999990d00')), --evitar erro de NLS_LANG do TIBERO
       he.parcela,
       he.parcelaalt,
       he.datavencto,
       he.dataprevista,
       4 AS TIPOMOV,
       to_char(nvl(c.txjuros,0)), --evitar erro de NLS_LANG do TIBERO
       to_char(nvl(he.saldodev,0)), --evitar erro de NLS_LANG do TIBERO
       he.origem,
       he.naturezaitem,
       he.flgbaixamanual,
       he.flgbaixado,
       he.flgenvio,
       he.seqcobranca,
       he.numparcelas,
       ixt.flggravazero,
       he.recpag,
       he.idhistmovemptmo,
       he.iditememptmo,
       i.itedescricao,
       NULL AS idtiposuspemptmo,
       henv.coddocumento,
       he.formacobranca,
       ht.flgtipodiverg,
       (SELECT itc.iditememptmo
        FROM itemxtipocontr itc
        WHERE itc.itcevento = 4
        AND   itc.flgcentraliza = 1
        AND   itc.idtipocontremptmo = c.idtipocontremptmo) AS ITEMCENTRALIZA,
       NULL AS idtiposuspemptmo,
       NULL AS tsedescricao,
       NULL AS flgatualsaldoparc
FROM hmeencargos he
     JOIN contratoemptmo c ON c.idcontratoemptmo = he.idcontratoemptmo
     JOIN itemxtipocontr ixt ON ixt.iditememptmo = he.iditememptmo
                             AND ixt.idtipocontremptmo = c.idtipocontremptmo
     JOIN itememptmo i ON i.iditememptmo = he.iditememptmo
     LEFT JOIN hmeenvio henv ON henv.idhistmovemptmo = he.idhistmovemptmo
     LEFT JOIN hmetratadiverg ht ON ht.idhistmovemptmo = he.idhistmovemptmo
WHERE he.idcontratoemptmo = ?
AND   he.parcela = ?
AND   he.naturezaitem > 0 
AND   he.flgquitabonoestorno = 0
AND   he.vlrefetivo is null
ORDER BY parcela,
         dataprevista,
         iditememptmo";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pNumContrato_1", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "pNumParcela_1", DbType.Int32);
                bancoDeDados.AddInParameter(comando, "pNumContrato_2", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "pNumParcela_2", DbType.Int32);

                foreach (int numPrestacao in prestacoes)
                {
                    bancoDeDados.SetParameterValue(comando, "pNumParcela_1", numPrestacao);
                    bancoDeDados.SetParameterValue(comando, "pNumParcela_2", numPrestacao);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        while (leitor.Read())
                        {
                            Historico historico = new Historico()
                            {
                                valorPrevisto = Convert.ToDouble(leitor.obterString(0)),
                                parcela = leitor.obterInt(1),
                                parcelaAlternativa = leitor.obterInt(2),
                                dataVencimento = leitor.obterValorData(3),
                                item = new ItemContrato()
                                { 
                                    id = leitor.obterInt(18),
                                    descricao = leitor.obterString(19)
                                }, 
                                tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(leitor.GetValue(5))),
                                numeroContrato = numeroContrato,
                                origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(Convert.ToInt32(leitor.GetValue(8))),
                                data = ((DateTime)leitor.obterValorData(3)),
                                mesCobranca = ((DateTime)leitor.obterValorData(3)).Month,
                                anoCobranca = ((DateTime)leitor.obterValorData(3)).Year,
                                anoCompetencia = ((DateTime)leitor.obterValorData(4)).Year,
                                mesCompetencia = ((DateTime)leitor.obterValorData(4)).Month,
                                anoMesCobranca = ((DateTime)leitor.obterValorData(4)).ToString("yyyy/MM"),
                                taxaJuros = Convert.ToDouble(leitor.obterString(6)),
                                saldoDevedor = Convert.ToDouble(leitor.obterString(7)),
                                centraliza = leitor.obterInt(9) == 2 ? 1 : 0,
                                destacado = leitor.obterInt(9) == 1 ? 1 : 0,
                                baixaManual = leitor.obterInt(10),
                                baixado = leitor.obterInt(11),
                                envio = leitor.obterInt(12),
                                itemCentraliza = leitor.IsDBNull(24) ? null : new ItemContrato { id = Convert.ToInt64(leitor.GetValue(24)) }, 
                                sequenciaCobranca = leitor.obterInt(13),
                                dataPrevista = (DateTime)leitor.obterValorData(4),
                                numeroParcelas = leitor.obterInt(14),
                                gravaZero = leitor.obterInt(15),
                                pagarReceber = leitor.obterString(16),
                                id = (long)leitor.obterValorInt64(17),
                                codigoDocumento = leitor.IsDBNull(21) ? null : leitor.obterValorInt64(20),
                                formaCobranca = leitor.obterString(22),
                                tipoDivergencia = leitor.obterInt(23),
                                tipoSuspensao = (leitor.IsDBNull(25) ? null : new TipoSuspensao()
                                {
                                    id = leitor.obterInt(25),
                                    descricao = leitor.obterString(26),
                                    atualizaSaldoDevedor = leitor.obterInt(27)                                    
                                })
                            };

                            itensHistorico.Add(historico);
                        }
                    }
                }
            }

            return itensHistorico;
        }

        public bool liberarSuspensao(List<Historico> itens)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            //WO12132 - Incluído trim para atualizar registro fantasma no tibero
            string query = @" UPDATE CM.HMEPRESTACAO
                             SET IDTIPOSUSPEMPTMO = NULL
                             WHERE TRIM(IDHISTMOVEMPTMO) = :IDHISTMOVEMPTMO_P ";

            try
            {
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64);

                    foreach (var item in itens)
                    {
                        if (item.tipoMovimento == TipoEvento.prestacao)
                        {
                            bancoDeDados.SetParameterValue(comando, "IDHISTMOVEMPTMO_P", item.id);
                            bancoDeDados.ExecuteNonQuery(comando);
                        }
                    }
                }
                return true;
            }
            catch
            {
                return false;
            }
        }        

        public List<Historico> ConsultarItensAbertosAgrupadosPorParcela(long NumeroContrato, DateTime? DataLimite)
        {
            List<Historico> itensHistorico = new List<Historico>();

            Database bancoDeDados = this.obterBancoDeDados();

            string query = @"SELECT 
                                    HME.IDCONTRATOEMPTMO, 
	                                HMEPARCELA, 
	                                --HMEDATAPREVISTA,
                                    (SELECT MAX(HMEDATAPREVISTA) 
                                         FROM HISTMOVEMPTMO 
                                         WHERE IDCONTRATOEMPTMO = :NumeroContrato 
                                         AND IDITEMEMPTMO = 13
                                         AND HMEPARCELA = HME.HMEPARCELA) HMEDATAPREVISTA,
	                                IRC.ITEDESCRICAO,  
	                                HME.IDITEMEMPTMO,    	                              
	                                TO_CHAR(SUM(HME.HMEVLRPREVISTO))HMEVLRPREVISTO, 	                                
	                                TO_CHAR(NVL((SELECT MIN(HMESALDODEV) 
                                                 FROM HISTMOVEMPTMO 
                                                 WHERE IDCONTRATOEMPTMO = :NumeroContrato2  
	                                             AND IDITEMEMPTMO = 13 
                                    AND HMEDATAPREVISTA <= (SELECT MAX(HMEDATAPREVISTA) 
                                                            FROM HISTMOVEMPTMO 
                                                            WHERE IDCONTRATOEMPTMO = :NumeroContrato3
                                                            AND IDITEMEMPTMO = 13
                                                            AND HMEPARCELA = HME.HMEPARCELA
                                                            AND HMEDATAPREVISTA <= :DataLimite)
                                            ),0)) HMESALDODEV,
                                    HMENUMPARCELAS,
                                    DECODE(HME.HMEFORMACOBRANCA, 'C', 'Financeiro', 'F', 'Folha', '') AS FORMACOBRANCA
                                FROM  
                                    HISTMOVEMPTMO      HME,  
                                    CM.CONTRATOEMPTMO CON,  
                                    CM.TIPOSUSPEMPTMO TSE,  
                                    CM.ITEMEMPTMO     IRC 
                                WHERE  HME.IDCONTRATOEMPTMO  = :NumeroContrato4
                                --AND HMEPARCELA IN (58)
                                AND HME.HMEVLREFETIVO IS NULL
                                AND HME.IDITEMEMPTMO         = IRC.IDITEMEMPTMO  
                                AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO  
                                AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+)
                                AND HME.HMETIPOMOV IN (1, 2, 3, 4, 7)  
                                AND NVL(HME.FLGESTORNADO, 0) = 0 
                                AND NVL(HME.FLGABONADO, 0)   = 0  
                                AND NVL(HME.FLGQUITADO, 0)   = 0  
                                AND HME.FLGBAIXADO         = 0
                                AND (HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO  = 1)
                                GROUP BY  HME.IDCONTRATOEMPTMO, HME.HMEPARCELA, IRC.ITEDESCRICAO, HME.IDITEMEMPTMO, HMENUMPARCELAS, HME.HMEFORMACOBRANCA
                                ORDER BY  HME.HMEPARCELA DESC, HME.IDITEMEMPTMO ASC";

            try
            {
                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {
                    bancoDeDados.AddInParameter(comando, "NumeroContrato", DbType.Int64, NumeroContrato);
                    bancoDeDados.AddInParameter(comando, "NumeroContrato2", DbType.Int64, NumeroContrato);
                    bancoDeDados.AddInParameter(comando, "NumeroContrato3", DbType.Int64, NumeroContrato);


                    if (DataLimite != null)
                        bancoDeDados.AddInParameter(comando, "DataLimite", DbType.DateTime, DataLimite);

                    bancoDeDados.AddInParameter(comando, "NumeroContrato4", DbType.Int64, NumeroContrato);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        while (leitor.Read())
                        {
                            Historico historico = new Historico()
                            {
                                numeroContrato = NumeroContrato,
                                parcela = leitor.obterInt(1),
                                dataVencimento = leitor.obterValorData(2),
                                item = new ItemContrato()
                                {
                                    id = leitor.obterInt(4),
                                    descricao = leitor.obterString(3)
                                },

                                valorPrevisto = Convert.ToDouble(leitor.obterString(5)),
                                saldoDevedor = Convert.ToDouble(leitor.obterString(6)),
                                numeroParcelas = leitor.obterInt(7),
                                formaCobranca = leitor.obterString(8)
                            };

                            itensHistorico.Add(historico);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return itensHistorico;
        }
    }
}
