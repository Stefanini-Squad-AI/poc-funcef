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

            StringBuilder query = new StringBuilder();

            query.Append(" INSERT INTO HISTMOVEMPTMO H ");
            query.Append(" (");
            query.Append("     H.IDHISTMOVEMPTMO,");
            query.Append("     H.IDCONTRATOEMPTMO,");
            query.Append("     H.IDITEMCENTRALIZA,");
            query.Append("     H.IDITEMEMPTMO,");
            query.Append("     H.HMEPARCELA,");
            query.Append("     H.HMETIPOMOV,");
            query.Append("     H.HMEORIGEM,");
            query.Append("     H.HMEFORMACOBRANCA,");
            query.Append("     H.HMESEQCOBRANCA,");
            query.Append("     H.HMEPRIORIDADE,");
            query.Append("     H.HMECENTRALIZA,");
            query.Append("     H.HMEDESTACADO,");
            query.Append("     H.HMEDATA,");
            query.Append("     H.HMEDATAPREVISTA,");
            query.Append("     H.HMEDATAEFETIVA,");
            query.Append("     H.HMEDATAATUALIZA,");
            query.Append("     H.HMEANOCOMPETENCIA,");
            query.Append("     H.HMEMESCOMPETENCIA,");
            query.Append("     H.HMEANOCOBRANCA,");
            query.Append("     H.HMEMESCOBRANCA,");
            query.Append("     H.HMEVLRPREVISTO,");
            query.Append("     H.HMEVLREFETIVO,");
            query.Append("     H.HMESALDODEV,");
            query.Append("     H.HMETXJUROS,");
            query.Append("     H.IDREGRA,");
            query.Append("     H.FLGBAIXADO,");
            query.Append("     H.FLGENVIO,");
            query.Append("     H.IDRUBRICA,");
            query.Append("     H.HMERECPAG,");
            query.Append("     H.HMENUMPARCELAS,");
            query.Append("     H.HMEDATAVENCTO,");
            query.Append("     H.FLGTIPODIVERG,");
            query.Append("     H.TRGDTINCLUSAO,");
            query.Append("     H.TRGUSERINCLUSAO,");
            query.Append("     H.VERSAO,");
            query.Append("     H.HMEPARCELAALT,");
            query.Append("     H.IDPATRO,");
            //query.Append("     H.ORIGEMRECURSO ");
            query.Append("     H.ORIGEMRECURSO, ");
            query.Append("     H.IDCBANCARIA ");//William Moreira da Silva - SOL 216458 KTN
            query.Append(" )");
            query.Append(" VALUES");
            query.Append(" (");
            query.Append("     :IDHISTMOVEMPTMO_P,");
            query.Append("     :NUMEROCONTRATO_P,");
            query.Append("     :IDITEMCENTRALIZA_P,");
            query.Append("     :IDITEM_P,");
            query.Append("     :PARCELA_P,");
            query.Append("     :TIPOMOVIMENTO_P,");
            query.Append("     :ORIGEM_P,");
            query.Append("     :FORMACOBRANCA_P,");
            query.Append("     :SEQUENCIACOBRANCA_P,");
            query.Append("     :PRIORIDADE_P,");
            query.Append("     :CENTRALIZA_P,");
            query.Append("     :DESTACADO_P,");
            query.Append("     :DATA_P,");
            query.Append("     :DATAPREVISTA_P,");
            query.Append("     :DATAEFETIVA_P,");
            query.Append("     :DATAATUALIZACAO_P,");
            query.Append("     :ANOCOMPETENCIA_P,");
            query.Append("     :MESCOMPETENCIA_P,");
            query.Append("     :ANOCOBRANCA_P,");
            query.Append("     :MESCOBRANCA_P,");
            query.Append("     :VALORPREVISTO_P,");
            query.Append("     :VALOREFETIVO_P,");
            query.Append("     :SALDODEVEDOR_P,");
            query.Append("     :TAXAJUROS_P,");
            query.Append("     :IDREGRA_P,");
            query.Append("     :BAIXADO_P,");
            query.Append("     :ENVIADO_P,");
            query.Append("     :RUBRICA_P,");
            query.Append("     :PAGARRECEBER_P,");
            query.Append("     :NUMEROPARCELAS_P,");
            query.Append("     :DATAVENCIMENTO_P,");
            query.Append("     :TIPODIVERGENCIA_P,");
            query.Append("     :DATAINCLUSAO_P,");
            query.Append("     :USUARIOINCLUSAO_P,");
            query.Append("     :VERSAO_P,");
            query.Append("     :PARCELAALTERNATIVA_P,");
            query.Append("     :IDPATROCINADORA_P,");
            //query.Append("     :ORIGEMRECURSO_P");
            query.Append("     :ORIGEMRECURSO_P,");
            query.Append("     :IDCBANCARIA_P");//William Moreira da Silva - SOL 216458 KTN
            query.Append(" )");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, historico.id);
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, historico.numeroContrato);

            if (historico.itemCentraliza != null)
                bancoDeDados.AddInParameter(comando, "IDITEMCENTRALIZA_P", DbType.Int32, historico.itemCentraliza.id);
            else
                bancoDeDados.AddInParameter(comando, "IDITEMCENTRALIZA_P", DbType.Int32, null);

            bancoDeDados.AddInParameter(comando, "IDITEM_P", DbType.Int32, historico.item.id);
            bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, historico.parcela);
            bancoDeDados.AddInParameter(comando, "TIPOMOVIMENTO_P", DbType.Int32, historico.tipoMovimento.chave);
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

            bancoDeDados.AddInParameter(comando, "IDREGRA_P", DbType.Int32, historico.item.regra.id);
            bancoDeDados.AddInParameter(comando, "BAIXADO_P", DbType.Int32, historico.baixado);
            bancoDeDados.AddInParameter(comando, "ENVIADO_P", DbType.Int32, historico.enviado);
            bancoDeDados.AddInParameter(comando, "RUBRICA_P", DbType.Int32, historico.rubrica);
            bancoDeDados.AddInParameter(comando, "PAGARRECEBER_P", DbType.String, historico.pagarReceber);
            bancoDeDados.AddInParameter(comando, "NUMEROPARCELAS_P", DbType.Int32, historico.numeroParcelas);
            bancoDeDados.AddInParameter(comando, "DATAVENCIMENTO_P", DbType.DateTime, historico.dataVencimento);
            bancoDeDados.AddInParameter(comando, "TIPODIVERGENCIA_P", DbType.Int32, historico.tipoDivergencia);
            bancoDeDados.AddInParameter(comando, "DATAINCLUSAO_P", DbType.DateTime, historico.dataInclusao);
            bancoDeDados.AddInParameter(comando, "USUARIOINCLUSAO_P", DbType.String, login);
            bancoDeDados.AddInParameter(comando, "VERSAO_P", DbType.String, historico.versao);
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

            StringBuilder query = new StringBuilder();

            query.Append(" INSERT INTO HISTMOVEMPTMO H ");
            query.Append(" (");
            query.Append("     H.IDHISTMOVEMPTMO,");
            query.Append("     H.IDCONTRATOEMPTMO,");
            query.Append("     H.HMETIPOMOV,");
            query.Append("     H.IDITEMEMPTMO,");
            query.Append("     H.HMEPARCELA,");
            query.Append("     H.HMEPARCELAALT,");
            query.Append("     H.HMESEQCOBRANCA,");
            query.Append("     H.HMENUMPARCELAS,");
            query.Append("     H.HMEMESCOMPETENCIA,");
            query.Append("     H.HMEANOCOMPETENCIA,");
            query.Append("     H.HMEMESCOBRANCA,");
            query.Append("     H.HMEANOCOBRANCA,");
            query.Append("     H.HMEFORMACOBRANCA,");
            query.Append("     H.HMETIPOFOLHA,");
            query.Append("     H.HMEDATAPREVISTA,");
            query.Append("     H.HMEDATAVENCTO,");
            query.Append("     H.HMEDATAEFETIVA,");
            query.Append("     H.HMESALDODEV,");
            query.Append("     H.HMEDATAATUALIZA,");
            query.Append("     H.HMEVLRPREVISTO,");
            query.Append("     H.HMEVLREFETIVO,");
            query.Append("     H.HMEVLRBASE,");
            query.Append("     H.HMETXJUROS,");
            query.Append("     H.PLNCODIGO,");
            query.Append("     H.FLGABONADO,");
            query.Append("     H.FLGQUITADO,");
            query.Append("     H.HMEDATAQUITABONO,");
            query.Append("     H.FLGBAIXADO,");
            query.Append("     H.FLGBAIXAMANUAL,");
            query.Append("     H.HMEDATAESTORNO,");
            query.Append("     H.FLGESTORNADO,");
            query.Append("     H.PLNCODIGOESTORNO,");
            query.Append("     H.FLGENVIO,");
            query.Append("     H.CODDOCUMENTO,");
            query.Append("     H.IDTMPDESC,");
            query.Append("     H.FLGDIVERGPEND,");
            query.Append("     H.FLGTIPODIVERG,");
            query.Append("     H.FLGDIVERGTRAT,");
            query.Append("     H.FLGENTRADAMANUAL,");
            query.Append("     H.FLGSUSPENSAO,");
            query.Append("     H.IDTIPOSUSPEMPTMO,");
            query.Append("     H.HMERECPAG,");
            query.Append("     H.HMECENTRALIZA,");
            query.Append("     H.HMEDESTACADO");
            query.Append(" )");
            query.Append(" VALUES");
            query.Append(" (");
            query.Append("     :IDHISTMOVEMPTMO_P,");
            query.Append("     :IDCONTRATOEMPTMO_P,");
            query.Append("     :HMETIPOMOV_P,");
            query.Append("     :IDITEMEMPTMO_P,");
            query.Append("     :HMEPARCELA_P,");
            query.Append("     :HMEPARCELAALT_P,");
            query.Append("     :HMESEQCOBRANCA_P,");
            query.Append("     :HMENUMPARCELAS_P,");
            query.Append("     :HMEMESCOMPETENCIA_P,");
            query.Append("     :HMEANOCOMPETENCIA_P,");
            query.Append("     :HMEMESCOBRANCA_P,");
            query.Append("     :HMEANOCOBRANCA_P,");
            query.Append("     :HMEFORMACOBRANCA_P,");
            query.Append("     :HMETIPOFOLHA_P,");
            query.Append("     :HMEDATAPREVISTA_P,");
            query.Append("     :HMEDATAVENCTO_P,");
            query.Append("     :HMEDATAEFETIVA_P,");
            query.Append("     :HMESALDODEV_P,");
            query.Append("     :HMEDATAATUALIZA_P,");
            query.Append("     :HMEVLRPREVISTO_P,");
            query.Append("     :HMEVLREFETIVO_P,");
            query.Append("     :HMEVLRBASE_P,");
            query.Append("     :HMETXJUROS_P,");
            query.Append("     :PLNCODIGO_P,");
            query.Append("     :FLGABONADO_P,");
            query.Append("     :FLGQUITADO_P,");
            query.Append("     :HMEDATAQUITABONO_P,");
            query.Append("     :FLGBAIXADO_P,");
            query.Append("     :FLGBAIXAMANUAL_P,");
            query.Append("     :HMEDATAESTORNO_P,");
            query.Append("     :FLGESTORNADO_P,");
            query.Append("     :PLNCODIGOESTORNO_P,");
            query.Append("     :FLGENVIO_P,");
            query.Append("     :CODDOCUMENTO_P,");
            query.Append("     :IDTMPDESC_P,");
            query.Append("     :FLGDIVERGPEND_P,");
            query.Append("     :FLGTIPODIVERG_P,");
            query.Append("     :FLGDIVERGTRAT_P,");
            query.Append("     :FLGENTRADAMANUAL_P,");
            query.Append("     :FLGSUSPENSAO_P,");
            query.Append("     :IDTIPOSUSPEMPTMO_P,");
            query.Append("     :HMERECPAG_P,");
            query.Append("     :HMECENTRALIZA_P,");
            query.Append("     :HMEDESTACADO_P");
            query.Append(" )");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            //IDHISTMOVEMPTMO
            bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, historico.id);

            //Numero Contrato
            if (historico.numeroContrato > 0)
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, historico.numeroContrato);
            else
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, null);

            //Evento
            if (historico.eventoCobranca.id > 0)
                bancoDeDados.AddInParameter(comando, "HMETIPOMOV_P", DbType.Int64, historico.eventoCobranca.id);
            else
                bancoDeDados.AddInParameter(comando, "HMETIPOMOV_P", DbType.Int64, null);

            //Item
            if (historico.item.id > 0)
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, historico.item.id);
            else
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, null);

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

            //Valor Previsto
            if (historico.valorPrevisto > 0)
                bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, historico.valorPrevisto);
            else
                bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, null);

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
            if (historico.enviado.HasValue)
                bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, historico.enviado);
            else
                bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, null);


            //Cod Documento
            if (historico.codigoDocumento.HasValue)
                bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, historico.codigoDocumento);
            else
                bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, null);

            //IdTmpDesc
            if (historico.idTipoSusp.HasValue)
                bancoDeDados.AddInParameter(comando, "IDTMPDESC_P", DbType.Int64, historico.codigoDocumento);
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


            bancoDeDados.ExecuteNonQuery(comando);
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
            query.Append("       H.HMEPARCELA, ");
            query.Append("       H.HMENUMPARCELAS, ");
            query.Append("       H.HMESEQCOBRANCA, ");
            query.Append("       H.HMEVLRPREVISTO, ");
            query.Append("       H.HMEMESCOMPETENCIA, ");
            query.Append("       H.HMEANOCOMPETENCIA, ");
            query.Append("       H.HMEMESCOBRANCA, ");
            query.Append("       H.HMEANOCOBRANCA, ");
            query.Append("       H.HMEDATAVENCTO, ");
            query.Append("       H.HMEDATAPREVISTA, ");
            query.Append("       H.HMEDATAEFETIVA, ");
            query.Append("       H.HMEVLREFETIVO, ");
            query.Append("       H.HMESALDODEV, ");
            query.Append("       H.FLGENVIO, ");
            query.Append("       H.HMEDATAENVIO, ");
            query.Append("       H.HMEDATARECEB, ");
            query.Append("       H.HMETXJUROS, ");
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
            query.Append("             to_char(nvl(H.HMEVLREFETIVO, 0)) ");
            query.Append("       end HMEVLREFETIVOTEXTO ");
            // SOL 202210  
            query.Append("  FROM HISTMOVEMPTMO H, ITEMEMPTMO I, TIPOSUSPEMPTMO S, ITEMXTIPOCONTR T, CONTRATOEMPTMO C ");
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
                    Historico itemHistorico = new Historico()
                    {
                        id = leitor.GetInt64(IDHISTMOVEMPTMO_HISTORICO),
                        parcela = leitor.GetInt32(HMEPARCELA_HISTORICO),
                        numeroParcelas = leitor.GetInt32(HMENUMPARCELAS_HISTORICO),
                        sequenciaCobranca = leitor.GetInt32(HMESEQCOBRANCA_HISTORICO),
                        valorPrevisto = leitor.obterDouble(HMEVLRPREVISTO_HISTORICO),
                        mesCompetencia = leitor.obterValorInteiro(HMEMESCOMPETENCIA_HISTORICO) != null ? leitor.obterValorInteiro(HMEMESCOMPETENCIA_HISTORICO) : null,
                        anoCompetencia = leitor.obterValorInteiro(HMEANOCOMPETENCIA_HISTORICO) != null ? leitor.obterValorInteiro(HMEANOCOMPETENCIA_HISTORICO) : null,
                        mesCobranca = leitor.obterValorInteiro(HMEMESCOBRANCA_HISTORICO),
                        anoCobranca = leitor.obterValorInteiro(HMEANOCOBRANCA_HISTORICO),
                        dataPrevista = leitor.GetDateTime(HMEDATAPREVISTA_HISTORICO),
                        dataEfetiva = leitor.obterValorData(HMEDATAEFETIVA_HISTORICO),
                        valorEfetivo = leitor.obterValorDouble(HMEVLREFETIVO_HISTORICO),
                        valorEfetivoTexto = leitor.GetString(HMEVLREFETIVO_HISTORICO_TEXTO), // SOL 202210
                        saldoDevedor = leitor.GetDouble(HMESALDODEV_HISTORICO),
                        enviado = leitor.obterValorInteiro(FLGENVIO_HISTORICO),
                        dataEnvio = leitor.obterValorData(HMEDATAENVIO_HISTORICO),
                        dataRecebimento = leitor.obterValorData(HMEDATARECEB_HISTORICO),
                        taxaJuros = leitor.obterValorDouble(HMETXJUROS_HISTORICO),
                        tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(leitor.GetInt32(HMETIPOMOV_HISTORICO)),

                        item = new ItemContrato()
                        {
                            id = leitor.GetInt32(IDITEMEMPTMO_HISTORICO),
                            descricao = leitor.GetString(ITEDESCRICAO_HISTORICO),
                        },

                        tipoSuspensao = new TipoSuspensao()
                        {
                            descricao = leitor.GetString(TSEDESCRICAO_HISTORICO)
                        },
                        dataVencimento = leitor.obterValorData(HMEDATAVENCTO_HISTORICO),
                        parcelaCompleta = string.Format("{0} / {1} / {2}", leitor.GetInt32(HMEPARCELA_HISTORICO).ToString().PadLeft(2, '0'), leitor.GetInt32(HMEPARCELA_HISTORICO).ToString().PadLeft(2, '0'), leitor.GetInt32(HMENUMPARCELAS_HISTORICO).ToString().PadLeft(2, '0'))
                    };
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

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Historico consultarDetalhe(long idHistorico)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            //query.Append("SELECT CON.IDPESSOA, ");
            query.Append(" SELECT H.IDHISTMOVEMPTMO, ");
            query.Append("        H.IDCONTRATOEMPTMO, ");
            query.Append("        H.IDITEMCENTRALIZA, ");
            query.Append("        H.IDITEMEMPTMO, ");
            query.Append("        I.ITEDESCRICAO, ");
            query.Append("        H.HMEPARCELA, ");
            query.Append("        DECODE(H.HMETIPOMOV, ");
            query.Append("                0, 'Concessão/Renovação', ");
            query.Append("                1, 'Prestação ', ");
            query.Append("                2, 'Amortização/Refinanciamento', ");
            query.Append("                3, 'Quitação', ");
            query.Append("                4, 'Atualização de Débito', ");
            query.Append("                5, 'Atualização de Saldo (Diária)' , ");
            query.Append("                6, 'Importação/Migração', ");
            query.Append("                7, 'Ajustes (Cobrança/Devolução)', ");
            query.Append("                8, 'Ajustes (Saldo Devedor)' ");
            query.Append("               ) AS EVENTO, ");
            query.Append("        H.HMEORIGEM, ");
            //William Moreira da Silva SOL 220958 KTN 2053543
            //query.Append("        H.HMEFORMACOBRANCA, ");
            query.Append(" DECODE(H.HMEFORMACOBRANCA, 'C', 'Financeiro', 'F', 'Folha', '') AS FORMACOBRANCA, ");
            query.Append("        H.HMESEQCOBRANCA, ");
            query.Append("        H.HMEPRIORIDADE, ");
            query.Append("        H.HMECENTRALIZA, ");
            query.Append("        H.HMEDESTACADO, ");
            query.Append("        H.HMEDATA, ");
            query.Append("        H.HMEDATAPREVISTA, ");
            query.Append("        H.HMEDATAEFETIVA, ");
            query.Append("        H.HMEDATAATUALIZA, ");
            query.Append("        H.HMEANOCOMPETENCIA, ");
            query.Append("        H.HMEMESCOMPETENCIA, ");
            query.Append("        H.HMEANOCOBRANCA, ");
            query.Append("        H.HMEMESCOBRANCA, ");
            query.Append("        H.HMEVLRPREVISTO, ");
            query.Append("        H.HMEVLREFETIVO, ");
            query.Append("        H.HMESALDODEV, ");
            query.Append("        H.HMETXJUROS, ");
            query.Append("        H.IDREGRA, ");
            query.Append("        H.FLGSUSPENSAO, ");
            query.Append("        H.HMEANOSUSPENSAO, ");
            query.Append("        H.HMEMESSUSPENSAO, ");
            query.Append("        H.FLGESTORNADO, ");
            query.Append("        H.FLGBAIXADO, ");
            query.Append("        H.FLGABONADO, ");
            query.Append("        H.FLGENVIO, ");
            query.Append("        H.PLNCODIGO, ");
            query.Append("        H.PLNCODIGOESTORNO, ");
            query.Append("        H.CODDOCUMENTO, ");
            query.Append("        H.IDRUBRICA, ");
            query.Append("        H.HMERECPAG, ");
            query.Append("        H.FLGDIVERGPEND, ");
            query.Append("        H.HMENUMPARCELAS, ");
            //William Moreira da Silva SOL 220958 KTN 2053543
            //query.Append("        H.HMETIPOFOLHA, ");
            query.Append(" DECODE(H.HMETIPOFOLHA, 'B', 'Benefício', 'P', 'Patrocinadora', '') AS TIPOFOLHA, ");
            query.Append("        H.PLNCODIGORECEB, ");
            query.Append("        H.FLGRECEBIMENTO, ");
            query.Append("        H.CODDOCUMENTORECEB, ");
            query.Append("        H.IDLANCIRRF, ");
            query.Append("        H.HMEDATAVENCTO, ");
            query.Append("        H.FLGQUITADO, ");
            query.Append("        H.HMEDATAQUITABONO, ");
            query.Append("        H.FLGTIPODIVERG, ");
            query.Append("        H.FLGBAIXAMANUAL, ");
            query.Append("        H.FLGDIVERGTRAT, ");
            query.Append("        H.IDUSUARIOINDIV, ");
            query.Append("        H.IDUSUARIODIVERG, ");
            query.Append("        H.FLGTIPODIVERGTRAT, ");
            query.Append("        H.HMEDATADIVERGTRAT, ");
            query.Append("        H.FLGTRATINDIV, ");
            query.Append("        H.FLGTIPOTRATINDIV, ");
            query.Append("        H.HMEDATATRATINDIV, ");
            query.Append("        H.HMEDATAESTORNO, ");
            query.Append("        H.FLGENTRADAMANUAL, ");
            query.Append("        H.TRGDTINCLUSAO, ");
            query.Append("        H.TRGUSERINCLUSAO, ");
            query.Append("        H.VERSAO, ");
            query.Append("        H.HMEDATARECEB, ");
            query.Append("        H.HMEOBSERVACAO, ");
            query.Append("        H.FLGSUSPMANUAL, ");
            query.Append("        H.CCDEBFINAN, ");
            query.Append("        H.CCCREDFINAN, ");
            query.Append("        H.CCDEBFOLHA, ");
            query.Append("        H.CCCREDFOLHA, ");
            query.Append("        H.HMEDATAENVIO, ");
            query.Append("        H.HMEVLRBASE, ");
            query.Append("        H.IDUSUARIOESTORNO, ");
            query.Append("        H.IDTMPDESC, ");
            query.Append("        H.HMEPARCELAALT, ");
            query.Append("        H.HMEDATAESTORNOALT, ");
            query.Append("        H.IDTIPOSUSPEMPTMO, ");
            query.Append("        H.IDMODULO, ");
            query.Append("        H.CODDOCUMENTOPROC, ");
            query.Append("        H.IDCBANCARIA, ");
            query.Append("        H.IDPLANOPREVCONTAB, ");
            query.Append("        H.IDPATRO, ");
            query.Append("        H.IDTIPORECURSO, ");
            query.Append("        H.ORIGEMRECURSO, ");
            query.Append("        H.HMETIPOMOV, ");
            query.Append("        S.TSEDESCRICAO, ");
            query.Append("        U.NOMEUSUARIO, ");
            
            //William Moreira da Silva SOL 220958 KTN 2053543 - INI
            query.Append("        D.NODOCUMENTO,   ");
            query.Append("        DECODE(T.SITENVIO, '0', 'Em cobrança', '1', 'Rec. Diverg.', '2', 'Rec. OK', ");
            query.Append("        'X', 'NÃO Recebido', '9', 'Baixado EP') AS SITENVIO, ");
            query.Append("        PL.PLNPLANIL, ");
            query.Append("        PA.PLNPLANIL AS PLANIL_ESTORNO, ");
            query.Append("        DECODE(D.STATUS, '0', 'Em aberto', '2', 'Baixado', '') AS STATUS_DOC  ");
            query.Append("  FROM HISTMOVEMPTMO H, ITEMEMPTMO I, TIPOSUSPEMPTMO S, USUARIOSISTEMA U, DOCUMENTO D");
            query.Append("  , TMPDESC T, PLANILHA PL, PLANILHA PA");
            //William Moreira da Silva SOL 220958 KTN 2053543 - FIM
            
            query.Append("  WHERE I.IDITEMEMPTMO = H.IDITEMEMPTMO ");
            query.Append("  AND   S.IDTIPOSUSPEMPTMO (+) = H.IDTIPOSUSPEMPTMO ");
            query.Append("  AND   U.IDUSUARIO(+) = H.IDUSUARIOESTORNO ");
            query.Append("  AND   H.IDHISTMOVEMPTMO = :IDHISTORICO_P ");
            
            //William Moreira da Silva SOL 220958 KTN 2053543 - INICIO
            query.Append("  AND H.IDTMPDESC = T.IDTMPDESC(+) ");
            query.Append("  AND D.Coddocumento(+) = H.CODDOCUMENTO ");
            query.Append("  AND H.PLNCODIGO = PL.PLNCODIGO(+) ");
            query.Append("  AND H.PLNCODIGOESTORNO = PA.PLNCODIGO(+) ");
            //William Moreira da Silva SOL 220958 KTN 2053543 - FIM

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);

            // Popula objeto resultante
            Historico historico = null;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    historico = new Historico()
                    {
                        /*
                        IDHISTMOVEMPTMO = 0;
                        IDCONTRATOEMPTMO = 1;
                        IDITEMCENTRALIZA = 2;
                        IDITEMEMPTMO = 3;
                        IDREGRA = 25;
                        IDLANCIRRF = 44;
                        IDUSUARIOINDIV = 51;
                        IDUSUARIODIVERG = 52;
                        IDRUBRICA = 36;
                        IDUSUARIOESTORNO = 72;
                        IDTMPDESC = 73;
                        IDTIPOSUSPEMPTMO = 76;
                        IDMODULO = 77
                        IDCBANCARIA = 79;
                        IDPLANOPREVCONTAB = 80;
                        IDPATRO = 81;
                        IDTIPORECURSO = 82;
                        ORIGEMRECURSO = 83;
                        HMEFORMACOBRANCA = 8;
                        HMESEQCOBRANCA = 9;
                        HMEPRIORIDADE = 10;
                        HMEANOSUSPENSAO = 27;
                        HMEMESSUSPENSAO = 28;
                        HMEANOCOMPETENCIA = 17;
                        HMEMESCOMPETENCIA = 18;
                        HMEANOCOBRANCA = 19;
                        HMEMESCOBRANCA = 20;
                        HMERECPAG = 37;
                        HMENUMPARCELAS = 39;
                        HMETIPOFOLHA = 40;
                        HMEDATAQUITABONO = 47;
                        HMEDATADIVERGTRAT = 54;
                        HMEDATATRATINDIV = 57;
                        HMEDATAESTORNO = 58; 
                        HMEPARCELAALT = 74;
                        HMEDATAESTORNOALT = 75;
                        CODDOCUMENTO = 35;
                        CODDOCUMENTORECEB = 43;
                        CCDEBFINAN = 66;
                        CCCREDFINAN = 67;
                        CCDEBFOLHA = 68;
                        CCCREDFOLHA = 69;;
                        CODDOCUMENTOPROC = 78;
                        PLNCODIGO = 33;
                        PLNCODIGOESTORNO = 34;
                        PLNCODIGORECEB = 41;
                        TRGDTINCLUSAO = 60;
                        TRGUSERINCLUSAO = 61;
                         
                        /*
                        FLGTIPODIVERGTRAT = 53;
                        FLGTRATINDIV = 55;
                        FLGTIPOTRATINDIV = 56;
                        FLGDIVERGPEND = 38;
                        FLGTIPODIVERG = 48;
                        FLGDIVERGTRAT = 50;
                        FLGSUSPMANUAL = 65;
                        FLGRECEBIMENTO = 42;
                        NODOCUMENTO = 87;
                        
                        
                        EVENTO = 6;
                        --HMEDATA = 13;        
                        */
                        //William Moreira da Silva SOL 220958 KTN 2053543
                        formaCobranca = leitor.GetString(HMEFORMACOBRANCA),
                        codigoDocumento = leitor.GetInt64(CODDOCUMENTO),
                        rubrica = leitor.GetInt32(IDRUBRICA),
                        tipoFolha = leitor.GetString(HMETIPOFOLHA),
                        dataEnvio = leitor.obterValorData(HMEDATAENVIO),
                        idTMPDesc = leitor.GetInt64(IDTMPDESC),
                        numeroDocumento = leitor.GetInt64(NODOCUMENTO),
                        sitEnvio = leitor.GetString(SITENVIO),
                        statusDocumento = leitor.GetString(STATUS_DOC),
                        
                        planilha = leitor.GetInt32(PLNCODIGO),
                        plnPlanil = leitor.GetInt32(PLNPLANIL),
                        cContabilDebito = leitor.GetString(CCDEBFINAN),
                        cContabilCredito = leitor.GetString(CCCREDFINAN),
                        plnCodEstorno = leitor.GetInt32(PLNCODIGOESTORNO),
                        plnPlanilEstorno = leitor.GetInt32(PLANIL_ESTORNO),
                        //William Moreira da Silva SOL 220958 KTN 2053543

                        tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(leitor.GetInt32(HMETIPOMOV)),
                        origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(leitor.GetInt32(ORIGEM)),
                        data = leitor.GetDateTime(HMEDATA),
                        dataInclusao = leitor.GetDateTime(TRGDTINCLUSAO),
                        versao = leitor.GetString(VERSAO),
                        dataPrevista = leitor.obterValorData(HMEDATAPREVISTA),
                        dataVencimento = leitor.obterValorData(HMEDATAVENCTO),
                        dataEfetiva = leitor.obterValorData(HMEDATAEFETIVA),
                        valorPrevisto = leitor.GetDouble(HMEVLRPREVISTO),
                        valorEfetivo = leitor.GetDouble(HMEVLREFETIVO),
                        //parcela = leitor.GetInt32(HMEPARCELA),
                        taxaJuros = leitor.GetDouble(HMETXJUROS),
                        saldoDevedor = leitor.GetDouble(HMESALDODEV),
                        dataAtualizacao = leitor.GetDateTime(HMEDATAATUALIZA),
                        observacao = leitor.GetString(HMEOBSERVACAO),
                        dataRecebimento = leitor.obterValorData(HMEDATARECEB),
                        item = new ItemContrato()
                        {
                            descricao = leitor.GetString(ITEDESCRICAO),

                        },
                        anoCompetencia = leitor.obterValorInteiro(HMEANOCOMPETENCIA),
                        mesCompetencia = leitor.obterValorInteiro(HMEMESCOMPETENCIA),
                        anoCobranca = leitor.obterValorInteiro(HMEANOCOBRANCA),
                        mesCobranca = leitor.obterValorInteiro(HMEMESCOBRANCA),


                        //Flags
                        envio = leitor.obterValorInteiro(FLGENVIO),
                        baixado = leitor.obterValorInteiro(FLGBAIXADO),
                        baixaManual = leitor.obterValorInteiro(FLGBAIXAMANUAL),
                        suspenso = leitor.obterValorInteiro(FLGSUSPENSAO),
                        estorno = leitor.obterValorInteiro(FLGESTORNADO),
                        abonado = leitor.obterValorInteiro(FLGABONADO),
                        quitado = leitor.obterValorInteiro(FLGQUITADO),
                        centraliza = leitor.obterValorInteiro(HMECENTRALIZA),
                        destacado = leitor.obterValorInteiro(HMEDESTACADO),
                        divergencia = leitor.obterValorInteiro(FLGDIVERGPEND),
                        divergenciaTratada = leitor.obterValorInteiro(FLGDIVERGTRAT),

                        //tipoDivergencia = leitor.GetInt32(),
                        //dataTratamento = leitor.GetDateTime(),
                        //tipoTratamento = leitor.GetString(),
                        //dataParaEstorno = leitor.GetDateTime(),
                        //dataDoEstorno = leitor.GetDateTime(),
                        //dataQuitacao = leitor.GetDateTime(),
                        //dataAbono = leitor.GetDateTime(),
                        valorBase = leitor.GetDouble(HMEVLRBASE),
                        entradaManual = leitor.obterValorInteiro(FLGENTRADAMANUAL),
                        pagarReceber = leitor.GetString(HMERECPAG),
                        usuario = leitor.GetString(NOMEUSUARIO),
                        tipoSuspensao = new TipoSuspensao()
                        {
                            descricao = leitor.GetString(TSEDESCRICAO)
                        }

                    };
                }
            }

            return historico;
        }

        public Historico consultarHistoricoChaveMestre(long idHistorico)
        {
            StringBuilder query = new StringBuilder();

            query.Append("     SELECT H.IDHISTMOVEMPTMO,");
            query.Append("     H.IDCONTRATOEMPTMO,");
            query.Append("     H.HMETIPOMOV,");
            query.Append("     H.IDITEMEMPTMO,");
            query.Append("     H.HMEPARCELA,");
            query.Append("     H.HMEPARCELAALT,");
            query.Append("     H.HMESEQCOBRANCA,");
            query.Append("     H.HMENUMPARCELAS,");
            query.Append("     H.HMEMESCOMPETENCIA,");
            query.Append("     H.HMEANOCOMPETENCIA,");
            query.Append("     H.HMEMESCOBRANCA,");
            query.Append("     H.HMEANOCOBRANCA,");
            query.Append("     H.HMEFORMACOBRANCA,");
            query.Append("     H.HMETIPOFOLHA,");
            query.Append("     H.HMEDATAPREVISTA,");
            query.Append("     H.HMEDATAVENCTO,");
            query.Append("     H.HMEDATAEFETIVA,");
            query.Append("     H.HMESALDODEV,");
            query.Append("     H.HMEDATAATUALIZA,");
            query.Append("     H.HMEVLRPREVISTO,");
            query.Append("     H.HMEVLREFETIVO,");
            query.Append("     H.HMEVLRBASE,");
            query.Append("     H.HMETXJUROS,");
            query.Append("     H.PLNCODIGO,");
            query.Append("     H.FLGABONADO,");
            query.Append("     H.FLGQUITADO,");
            query.Append("     H.HMEDATAQUITABONO,");
            query.Append("     H.FLGBAIXADO,");
            query.Append("     H.FLGBAIXAMANUAL,");
            query.Append("     H.HMEDATAESTORNO,");
            query.Append("     H.FLGESTORNADO,");
            query.Append("     H.PLNCODIGOESTORNO,");
            query.Append("     H.FLGENVIO,");
            query.Append("     H.CODDOCUMENTO,");
            query.Append("     H.IDTMPDESC,");
            query.Append("     H.FLGDIVERGPEND,");
            query.Append("     H.FLGTIPODIVERG,");
            query.Append("     H.FLGDIVERGTRAT,");
            query.Append("     H.FLGENTRADAMANUAL,");
            query.Append("     H.FLGSUSPENSAO,");
            query.Append("     H.IDTIPOSUSPEMPTMO,");
            query.Append("     H.HMERECPAG,");
            query.Append("     H.HMECENTRALIZA,");
            query.Append("     H.HMEDESTACADO");
            query.Append("   FROM HISTMOVEMPTMO H ");
            query.Append("   WHERE   H.IDHISTMOVEMPTMO = :IDHISTORICO_P ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());


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


        public List<Historico> consultarHistoricoEnvio(long idHistorico)
        {
            StringBuilder query = new StringBuilder();

            /*query.Append(" SELECT");
            query.Append(" H.IDHISTMOVEMPTMO,");
            query.Append(" H.DATAENVIO,");
            query.Append(" DECODE(H.FORMACOBRANCA,'C','Financeiro','F','Folha') AS FORMACOBRANCA,");
            query.Append(" DECODE(H.TIPOFOLHA,'B','Benefícios','P','Patrocinadora') AS TIPOFOLHA,");
            query.Append(" H.IDTMPDESC,");
            query.Append(" H.CODDOCUMENTO,");
            query.Append(" H.IDRUBRICA,");
            query.Append(" H.DATAVENCTO,");
            query.Append(" (SELECT NOMEUSUARIO FROM USUARIOSISTEMA USUA WHERE 'CM'||TO_CHAR(USUA.IDUSUARIO) = H.TRGUSERINCLUSAO) NOMEUSUARIO, ");
            query.Append(" L.HISTORICOCOMPL ");//William Moreira da Silva - SOL 199847 KINTANA 1926357

            //query.Append(" FROM HISTENVIOEMPTMO H ");
            query.Append(" FROM HISTENVIOEMPTMO H, LANCTODOCUM L ");//William Moreira da Silva - SOL 199847 KINTANA 1926357
            query.Append(" WHERE IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO_P");
            query.Append(" AND L.CODDOCUMENTO = H.CODDOCUMENTO ");//William Moreira da Silva - SOL 199847 KINTANA 1926357*/

            query.Append("  SELECT ");
            query.Append("  H.IDHISTMOVEMPTMO, ");
            query.Append("  H.DATAENVIO, ");
            query.Append("  DECODE(H.FORMACOBRANCA,'C','Financeiro','F','Folha') AS FORMACOBRANCA, ");
            query.Append("  DECODE(H.TIPOFOLHA,'B','Benefícios','P','Patrocinadora') AS TIPOFOLHA, ");
            query.Append("  H.IDTMPDESC, ");
            query.Append("  H.CODDOCUMENTO, ");
            query.Append("  H.IDRUBRICA, ");
            query.Append("  H.DATAVENCTO, ");
            query.Append("  (SELECT NOMEUSUARIO FROM USUARIOSISTEMA USUA WHERE 'CM'||TO_CHAR(USUA.IDUSUARIO) = H.TRGUSERINCLUSAO) NOMEUSUARIO,  ");
            query.Append("  (SELECT l.historicocompl ");
            query.Append("  FROM lanctodocum l ");
            query.Append("  WHERE l.coddocumento = h.coddocumento ");
            query.Append("  AND   l.operacao = (SELECT MAX(la.operacao) ");
            query.Append("                       FROM lanctodocum la ");
            query.Append("                       WHERE la.coddocumento = l.coddocumento ");
            query.Append("                       AND   la.operacao <> 2)) AS HISTORICOCOMPL ");
            query.Append("  FROM HISTENVIOEMPTMO H ");
            query.Append("  WHERE IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO_P ");
            query.Append("  ORDER BY DATAENVIO DESC ");
            //William Moreira da Silva - SOL 199847 KINTANA 1926357


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, idHistorico);

            List<Historico> listaHistorico = new List<Historico>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    String destinoEnvio = String.Format("{0} {1}", leitor.GetString(2), leitor.GetString(3));//William Moreira da Silva SOL 220958 KTN 2053543
                    Historico historico = new Historico()
                    {
                        id = leitor.GetInt64(0),
                        dataEnvio = leitor.GetDateTime(1),
                        //William Moreira da Silva SOL 220958 KTN 2053543
                        //formaCobranca = leitor.GetString(2),
                        //tipoFolha = leitor.GetString(3),
                        formaCobranca = destinoEnvio,
                        //William Moreira da Silva SOL 220958 KTN 2053543
                        chaveFolha = leitor.obterValorInt64(4),
                        codigoDocumento = leitor.obterValorInt64(5),
                        rubrica = leitor.obterValorInteiro(6),
                        dataVencimento = leitor.GetDateTime(7),
                        usuarioInclusao = leitor.GetString(8),
                        observacao = leitor.GetString(9)//William Moreira da Silva - SOL 199847 KINTANA 1926357
                    };
                    listaHistorico.Add(historico);
                }
            }

            return listaHistorico;

        }

        public List<Historico> consultarEventoCobranca(long idContrato, long? idEvento)
        {
            StringBuilder query = new StringBuilder();

            query.Append("SELECT ");
            query.Append(" HST.IDCONTRATOEMPTMO,");
            query.Append(" HST.IDHISTEVENTOCOBEMPTMO,");
            query.Append(" HST.IDTIPOEVENTOCOBEMPTMO,");
            query.Append(" T.DESCEVENTOCOB,");
            query.Append(" HST.DATAEVENTOCOB,");
            query.Append(" HST.OBSCOB ");
            query.Append(" FROM HISTEVENTOCOBEMPTMO HST,");
            query.Append(" TIPOEVENTOCOBEMPTMO T,");
            query.Append(" EVENTOCOBXHISTMOVEMPTMO E");

            if (idEvento == null)
                query.Append(" WHERE HST.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P");
            else
                query.Append(" WHERE HST.IDHISTEVENTOCOBEMPTMO = :IDHISTEVENTOCOBEMPTMO_P");

            query.Append(" AND HST.IDTIPOEVENTOCOBEMPTMO = T.IDTIPOEVENTOCOBEMPTMO");
            query.Append(" AND HST.IDHISTEVENTOCOBEMPTMO = E.IDHISTEVENTOCOBEMPTMO(+)");
            query.Append(" GROUP BY HST.IDCONTRATOEMPTMO,");
            query.Append(" HST.IDHISTEVENTOCOBEMPTMO,");
            query.Append(" HST.IDTIPOEVENTOCOBEMPTMO,");
            query.Append(" T.DESCEVENTOCOB,");
            query.Append(" HST.DATAEVENTOCOB,");
            query.Append(" HST.OBSCOB");
            query.Append(" ORDER BY DATAEVENTOCOB");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                    Historico historico = new Historico()
                    {
                        numeroContrato = leitor.GetInt64(0),
                        id = leitor.GetInt64(1),
                        eventoCobranca = new TipoEventoCobranca() { id = leitor.GetInt32(2), descricao = leitor.GetString(3) },
                        data = leitor.GetDateTime(4),
                        observacao = leitor.GetString(5)
                    };
                    listaHistorico.Add(historico);
                }
            }

            return listaHistorico;

        }

        public List<Historico> consultarParcelaCobranca(long idContrato, int idTipoEvento, DateTime dataEvento)
        {
            StringBuilder query = new StringBuilder();

            query.Append("SELECT ");
            query.Append(" HME.IDCONTRATOEMPTMO,");
            query.Append(" HME.IDHISTMOVEMPTMO,");
            query.Append(" HME.HMEPARCELAALT || '/' || HME.HMEPARCELA || '/' || HME.HMENUMPARCELAS AS PARCELAS,");
            query.Append(" HME.HMEDATAPREVISTA,");
            query.Append(" HME.HMEVLRPREVISTO,");
            query.Append(" HME.HMEDATAEFETIVA,");
            query.Append(" HME.HMEVLREFETIVO,");
            query.Append(" HME.HMEDATAVENCTO,");
            query.Append(" IT.ITEDESCRICAO AS ITEM,");
            query.Append(" HME.HMEVLRPREVISTO AS VALORENCARGO");
            query.Append(" FROM HISTMOVEMPTMO HME, ITEMEMPTMO IT");
            query.Append(" WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P");
            query.Append(" AND HME.IDHISTMOVEMPTMO IN");

            query.Append(" (SELECT IDHISTMOVEMPTMO");
            query.Append(" FROM HISTEVENTOCOBEMPTMO H, EVENTOCOBXHISTMOVEMPTMO E");
            query.Append(" WHERE H.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO_P");
            query.Append(" AND H.IDTIPOEVENTOCOBEMPTMO = :IDTIPOEVENTOCOBEMPTMO_P");
            query.Append(" AND TO_DATE(H.DATAEVENTOCOB, 'DD/MM/RRRR') = :DATAEVENTOCOB_P");
            query.Append(" AND H.IDHISTEVENTOCOBEMPTMO = E.IDHISTEVENTOCOBEMPTMO)");

            query.Append(" AND HME.HMETIPOMOV = 1");
            query.Append(" AND (HME.HMECENTRALIZA + HME.HMEDESTACADO) = 1");
            query.Append(" AND HME.HMEORIGEM = 1");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0");
            query.Append(" AND IT.IDITEMEMPTMO = HME.IDITEMEMPTMO");
            query.Append(" ORDER BY HMEDATAPREVISTA");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

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
                        numeroContrato = leitor.GetInt64(0),
                        id = leitor.GetInt64(1),
                        parcelaCompleta = leitor.GetString(2),
                        dataPrevista = leitor.obterValorData(3),
                        valorPrevisto = leitor.obterDouble(4),
                        dataEfetiva = leitor.obterValorData(5),
                        valorEfetivo = leitor.obterValorDouble(6),
                        dataVencimento = leitor.obterValorData(7),
                        item = new ItemContrato() { descricao = leitor.GetString(8) }
                    };
                    listaHistorico.Add(historico);
                }
            }

            return listaHistorico;

        }

        #endregion

        #region Alteração


        public void atualizarHistorico(Historico historico)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append("	UPDATE HISTMOVEMPTMO H ");
            query.Append("	SET H.HMETIPOMOV =   	:HMETIPOMOV_P,");
            query.Append("  H.HMEPARCELA =		    :HMEPARCELA_P,");
            query.Append("  H.HMEPARCELAALT =    	:HMEPARCELAALT_P,");
            query.Append("  H.HMESEQCOBRANCA =   	:HMESEQCOBRANCA_P,");
            query.Append("  H.HMENUMPARCELAS =   	:HMENUMPARCELAS_P,");
            query.Append("  H.HMEMESCOMPETENCIA =  	:HMEMESCOMPETENCIA_P,");
            query.Append("  H.HMEANOCOMPETENCIA =  	:HMEANOCOMPETENCIA_P,");
            query.Append("  H.HMEMESCOBRANCA =   	:HMEMESCOBRANCA_P,");
            query.Append("  H.HMEANOCOBRANCA =   	:HMEANOCOBRANCA_P,");
            query.Append("  H.HMEFORMACOBRANCA =   	:HMEFORMACOBRANCA_P,");
            query.Append("  H.HMETIPOFOLHA =   	    :HMETIPOFOLHA_P,");
            query.Append("  H.HMEDATAPREVISTA =   	:HMEDATAPREVISTA_P,");
            query.Append("  H.HMEDATAVENCTO =   	:HMEDATAVENCTO_P,");
            query.Append("  H.HMEDATAEFETIVA =   	:HMEDATAEFETIVA_P,");
            query.Append("  H.HMESALDODEV =   		:HMESALDODEV_P,");
            query.Append("  H.HMEDATAATUALIZA =  	:HMEDATAATUALIZA_P,");
            query.Append("  H.HMEVLRPREVISTO =   	:HMEVLRPREVISTO_P,");
            query.Append("  H.HMEVLREFETIVO =   	:HMEVLREFETIVO_P,");
            query.Append("  H.HMEVLRBASE =   		:HMEVLRBASE_P,");
            query.Append("  H.HMETXJUROS =   		:HMETXJUROS_P,");
            query.Append("  H.PLNCODIGO =    		:PLNCODIGO_P,");
            query.Append("  H.FLGABONADO =   		:FLGABONADO_P,");
            query.Append("  H.FLGQUITADO =   		:FLGQUITADO_P,");
            query.Append("  H.HMEDATAQUITABONO =   	:HMEDATAQUITABONO_P,");
            query.Append("  H.FLGBAIXADO =   		:FLGBAIXADO_P,");
            query.Append("  H.FLGBAIXAMANUAL =   	:FLGBAIXAMANUAL_P,");
            query.Append("  H.HMEDATAESTORNO =   	:HMEDATAESTORNO_P,");
            query.Append("  H.FLGESTORNADO =   	    :FLGESTORNADO_P,");
            query.Append("  H.PLNCODIGOESTORNO =   	:PLNCODIGOESTORNO_P,");
            query.Append("  H.FLGENVIO =   		    :FLGENVIO_P,");
            query.Append("  H.CODDOCUMENTO =   	    :CODDOCUMENTO_P,");
            query.Append("  H.IDTMPDESC =   		:IDTMPDESC_P,");
            query.Append("  H.FLGDIVERGPEND =   	:FLGDIVERGPEND_P,");
            query.Append("  H.FLGTIPODIVERG =   	:FLGTIPODIVERG_P,");
            query.Append("  H.FLGDIVERGTRAT =   	:FLGDIVERGTRAT_P,");
            query.Append("  H.FLGENTRADAMANUAL =   	:FLGENTRADAMANUAL_P,");
            query.Append("  H.FLGSUSPENSAO =   	    :FLGSUSPENSAO_P,");
            query.Append("  H.IDTIPOSUSPEMPTMO =   	:IDTIPOSUSPEMPTMO_P,");
            query.Append("  H.HMERECPAG =   		:HMERECPAG_P,");
            query.Append("  H.HMECENTRALIZA =   	:HMECENTRALIZA_P,");
            query.Append("  H.HMEDESTACADO =   	    :HMEDESTACADO_P");
            query.Append("  WHERE   H.IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            //Evento
            if (historico.eventoCobranca.id > 0)
                bancoDeDados.AddInParameter(comando, "HMETIPOMOV_P", DbType.Int64, historico.eventoCobranca.id);
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

            //Valor Previsto
            if (historico.valorPrevisto > 0)
                bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, historico.valorPrevisto);
            else
                bancoDeDados.AddInParameter(comando, "HMEVLRPREVISTO_P", DbType.Double, null);

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
            if (historico.enviado.HasValue)
                bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, historico.enviado);
            else
                bancoDeDados.AddInParameter(comando, "FLGENVIO_P", DbType.Int64, null);


            //Cod Documento
            if (historico.codigoDocumento.HasValue)
                bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, historico.codigoDocumento);
            else
                bancoDeDados.AddInParameter(comando, "CODDOCUMENTO_P", DbType.Int64, null);

            //IdTmpDesc
            if (historico.idTipoSusp.HasValue)
                bancoDeDados.AddInParameter(comando, "IDTMPDESC_P", DbType.Int64, historico.codigoDocumento);
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

            //IDHISTMOVEMPTMO - Where do Update
            bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, historico.id);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        /// <summary>
        /// Altera a observação do histórico.
        /// </summary>
        /// <param name="idHistorico">ID do histórico.</param>
        /// <param name="observacao">Observação do Histórico.</param>
        public void alterarObservacao(long idHistorico, string observacao)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE HISTMOVEMPTMO ");
            query.Append(" SET HMEOBSERVACAO  = :OBSERVACAO_P ");
            query.Append(" WHERE  IDHISTMOVEMPTMO = :IDHISTORICO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "OBSERVACAO_P", DbType.String, observacao);
            bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        #endregion

        #region Excluir

        public void excluir(long idHistorico)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" DELETE HISTMOVEMPTMO ");
            query.Append(" WHERE  IDHISTMOVEMPTMO = :IDHISTORICO_P ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDHISTORICO_P", DbType.Int64, idHistorico);

            bancoDeDados.ExecuteNonQuery(comando);
        }



        #endregion

        #region IAcessoHistorico Members

        #endregion

        #region IAcessoHistorico Members




        #endregion
    }
}
