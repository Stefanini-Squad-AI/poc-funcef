#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Jessica Y. Oshiro
///
/// Data da Alteração:
/// 27/04/2016 09:21:53
///
/// Descrição da Alteração:
/// Adição do método consultarRegraFGQC
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using System.Collections;
using FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que representa Tipo do Contrato
    /// </summary>
    public class GerenciadorTipoContrato
    {
        #region Atributos

        private IAcessoTipoContrato acesso = FabricaObjetos.instancia.obterAcessoTipoContrato();
        //BRUNO AZEVEDO
        private IAcessoRegra regra = FabricaObjetos.instancia.obterAcessoRegra();
        //BRUNO AZEVEDO

        /// <summary>
        /// Atributo para controlar o saldo devedor
        /// </summary>
        private double saldoDevedor;

        #endregion

        #region Consultas

        /// <summary>
        /// Retorna dados de um tipo de contrato.
        /// </summary>
        /// <param name="id">Identificador do tipo de contrato.</param>
        public TipoContrato consultar(int id, bool veioConector)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                TipoContrato tipoContrato = acesso.consultar(id, veioConector); //Xavier SOL 230843

                //Completa a transação
                transacao.Complete();

                return tipoContrato;
            }
        }

        /// <summary>
        /// Lista os Tipos de Contrato do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o(s) tipo(s) de contratos(s) encontrado(s).</returns>
        public List<TipoContrato> listar()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<TipoContrato> listaTipoContrato = acesso.listar();

                //Completa a transação
                transacao.Complete();

                return listaTipoContrato;
            }
        }

        public int consultarTipoContratoQuitacao(int idTipoContrato, int tipoContratoAQuitar)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                int retorno = acesso.consultarTipoContratoQuitacao(idTipoContrato, tipoContratoAQuitar);

                //Completa a transação
                transacao.Complete();

                return retorno;
            }
        }


        #endregion

        /// Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 - incluído o campo IDREGRACALC - Inicio
        /// <summary>
        /// Retorna Regra FGQC.
        /// </summary>
        /// <param name="tipoContrato">Identificador do tipo de contrato</param>
        /// <param name="tipoEvento">Tipo de evento.</param>
        public Int32 consultarRegraFGQC(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Int32 FGQC;
                FGQC = acesso.consultarRegraFGQC(tipoContrato, tipoEvento);

                //Completa a transação
                transacao.Complete();

                return FGQC;
            }
        }
        /// Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 - incluído o campo IDREGRACALC - Fim

        /// <summary>
        /// Retorna Itens de cálculo do tipo do contrato e tipo de evento.
        /// </summary>
        /// <param name="idTipoContrato">Identificador do tipo de contrato</param>
        /// <param name="idTipoEvento">Tipo de evento</param>
        public List<ItemContrato> obterItens(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<ItemContrato> itens = acesso.obterItens(tipoContrato, tipoEvento);

                //Completa a transação
                transacao.Complete();

                return itens;
            }
        }

        /// <summary>
        /// Metodo para calcular os encargos dos itens para uma nova data de vencimento
        /// </summary>
        /// <param name="itensContrato">itens do contrato depois de calculados</param>
        /// <returns>Lista com os itens tratados após passar pelas regras</returns>
        //William Moreira da Silva - SOL 207977 PPM
        //public List<ItemContrato> calcularEncargosVencimento(List<Historico> itensContrato, long numeroContrato, bool calcularEncargos, DateTime dataVencimento, DateTime dataEvento)
        public List<ItemContrato> calcularEncargosVencimento(List<Historico> itensTratados, long numeroContrato, bool calcularEncargos, List<int> parcelas, DateTime dataVencimento, DateTime dataEvento, int tipoProposta)
        {
            Dictionary<string, object> parametros = new Dictionary<string, object>();

            GerenciadorRegra executorRegra = new GerenciadorRegra();

            DateTime? dataParcela = DateTime.Today;
            int numeroParcela = 0;
            int parcelaAnt = 0;
            int parcelaAlternativa = 0;
            double valorPrevisto = 0;

            List<ItemContrato> itensEncargos = new List<ItemContrato>();
            List<Historico> itensCentralizados = itensTratados.Where(t1 => t1.centraliza == 1).ToList();
            ObjetoContrato contrato = new ObjetoContrato(numeroContrato);

            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);
            parametros.Add("IDCONTRATOEMPTMO", contrato.numero);
            parametros.Add("IDTIPOCONTRATO_P", contrato.tipo.id);

            parametros.Add("IDOPERACAO_P", 4);
            parametros.Add("DATACREDITO_P", contrato.dataCredito);

            //parametros.Add("NUMPARCELAS_P", contrato.parcelasRestantes);
            //parametros.Add("VLRPARCELA_P", contrato.valorParcela);

            parametros.Add("DATAEVENTO_P", dataVencimento);
            parametros.Add("TAXAJUROS_P", contrato.taxaJuros);

            //parametros.Add("IDCALCULO_P", regra.consultarUltimoIdCalculo());
            parametros.Add("USUARIO_P", Contexto.obterUsuario());

            //parametros.Add("IDITEMEMPTMO_P", null);
            parametros.Add("IDCALCULO_P", null);
            parametros.Add("PARCELA_P", null);
            parametros.Add("DATAPARCELA_P", null);
            parametros.Add("NUMPARCELAS_P", null);
            parametros.Add("VLRPARCELA_P", null);

            parametros.Add("TIPOPROPOSTA_P", tipoProposta);

            for (int i = 0; i < parcelas.Count; i++)
            {
                itensEncargos.AddRange(acesso.obterItensContrato(contrato.idTipoContratoEmpto, parcelas[i]));
            }

            for (int i = 0; i < itensEncargos.Count; i++)
            {
                parametros["PARCELA_P"] = itensEncargos[i].parcela;

                if (parcelaAnt != itensEncargos[i].parcela)
                {
                    parametros["IDCALCULO_P"] = regra.consultarUltimoIdCalculo();
                }

                for (int j = 0; j < itensCentralizados.Count; j++)
                {
                    if (itensCentralizados[j].parcela == itensEncargos[i].parcela)
                    {
                        dataParcela = itensCentralizados[j].dataPrevista;
                        numeroParcela = itensCentralizados[j].numeroParcelas;
                        valorPrevisto = itensCentralizados[j].valorPrevisto;
                        parcelaAlternativa = itensCentralizados[j].parcelaAlternativa;
                    }
                }

                parametros["DATAPARCELA_P"] = dataParcela;
                parametros["NUMPARCELAS_P"] = numeroParcela;
                parametros["VLRPARCELA_P"] = valorPrevisto;

                if (itensEncargos[i].regra == null)
                    throw new InvalidOperationException("O item de contrato deve possuir uma regra associada para esta operação.");

                parcelaAnt = itensEncargos[i].parcela;
                itensEncargos[i].valor = (double)executorRegra.executar(itensEncargos[i].regra, parametros);
                itensEncargos[i].numeroParcelas = numeroParcela;
                itensEncargos[i].parcelaAlternativa = parcelaAlternativa;
            }

            return itensEncargos;
        }

        /// <summary>
        /// Executar regra para cada item da lista.
        /// </summary>
        /// <param name="itensContrato">Lista de itens de contrato.</param>
        public List<ItemContrato> calcularItensAmortizacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataAmortizacao, int novoPrazo, double? valorAmortizacao, double? valorMargem)
        {
            List<ItemContrato> itensContrato = new List<ItemContrato>();
            //Itens de Amortização
            itensContrato.AddRange(this.obterItens(tipoContrato, TipoEvento.amortizacao));

            //Itens de Concessão
            //itensContrato.AddRange(this.obterItens(tipoContrato, TipoEvento.concessao));

            //Adiciona item centralizador do tipo parcela
            itensContrato.Add(this.obterItens(tipoContrato, TipoEvento.prestacao).Find(i => i.descricao == "FGQC"));//William Moreira da Silva SOL 201773 KINTANA 1950518
            itensContrato.Add(this.obterItens(tipoContrato, TipoEvento.prestacao).Find(i => i.centraliza == 1));



            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            // Saulo / FUNCEF
            //Contrato contrato = gerenciadorContrato.consultar(numeroContrato, tipoContrato.veioConector);
            ObjetoContrato contrato = new ObjetoContrato(numeroContrato, tipoContrato.veioConector);

            this.saldoDevedor = gerenciadorContrato.obterSaldoDevedor(numeroContrato, dataAmortizacao);

            if (!valorAmortizacao.HasValue)
                valorAmortizacao = 0d;

            if (!valorMargem.HasValue)
                valorMargem = 0d;

            double saldoDevedorAnterior = this.saldoDevedor - (double)valorAmortizacao;

            int parcela = gerenciadorContrato.obterParcelaAtual(numeroContrato);
            bool envio = gerenciadorContrato.verificaEnvio(numeroContrato, parcela);//William Moreira da Silva SOL 211418

            //Parâmetros regras
            Dictionary<string, object> parametros = new Dictionary<string, object>();

            //IDs
            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular); //CORRECAO NILTON
            parametros.Add("IDCONTRATOEMPTMO", numeroContrato); //Willamy Henrique SOL - 239238 PPM 514531
            parametros.Add("IDCONTRATO_P", numeroContrato);
            parametros.Add("IDTIPOCONTRATO_P", tipoContrato.id);
            parametros.Add("IDTIPOCONTRATOANTERIOR_P", null);
            parametros.Add("IDOPERACAO_P", TipoOperacao.amortizacao.chave);
            parametros.Add("IDCONTRATOANTERIOR_P", null);
            parametros.Add("IDPLANO_P", contrato.plano.id);
            parametros.Add("IDTIPOEMPRESTIMO_P", contrato.tipoEmprestimo.id);
            parametros.Add("IDITEMEMPTMO_P", itensContrato[0].id);//CORRECAO NILTON
            parametros.Add("IDTIPOSUSPENSAO_P", 0);
            //William Moreira da Silva SOL 201773 KINTANA 1950518
            int? IdCalculo = regra.consultarUltimoIdCalculo();
            parametros.Add("IDCALCULO_P", IdCalculo);
            //William Moreira da Silva SOL 201773 KINTANA 1950518

            parametros.Add("IDCONTRATOAQUITAR_P", numeroContrato.ToString());//William Moreira da Silva - SOL 211511.15023 KINTANA 2041799

            //Flags
            parametros.Add("FINANCIAMENTO_P", 0);
            parametros.Add("EXCEPCIONAL_P", 0);

            //Inteiros
            parametros.Add("NUMPARCELAS_P", novoPrazo);
            parametros.Add("NOVOPRAZO_P", novoPrazo);
            parametros.Add("PARCELAATUAL_P", parcela);

            //Datas
            //William Moreira da Silva - SOL 211511.15023 KINTANA 2041799
            //parametros.Add("DATACREDITO_P", contrato.dataCredito);
            parametros.Add("DATACREDITO_P", dataAmortizacao);
            //William Moreira da Silva - SOL 211511.15023 KINTANA 2041799

            //William Moreira da Silva - SOL 217685 KTN 2047920
            string dtPrimParc = Convert.ToString(String.Format("{0:dd/MM/yyyy}", contrato.dataPrimeiraParcela));
            contrato.dataPrimeiraParcela = DateTime.Parse(dtPrimParc);
            //William Moreira da Silva - SOL 217685 KTN 2047920

            parametros.Add("DATAPRIMEIRAPARCELA_P", contrato.dataPrimeiraParcela);
            parametros.Add("DATAAMORTIZACAO_P", dataAmortizacao);
            parametros.Add("DATAQUITACAO_P", dataAmortizacao);
            parametros.Add("DATAREFERENCIA_P", dataAmortizacao);
            parametros.Add("DATAEVENTO_P", dataAmortizacao);
            parametros.Add("DATAATUALIZA_P", dataAmortizacao);
            parametros.Add("DATAEFETIVA_P", dataAmortizacao);
            parametros.Add("DATAPREVISTA_P", dataAmortizacao);
            parametros.Add("DATAASSINATURA_P", contrato.dataAssinatura);
            parametros.Add("PRAZOANT_P", novoPrazo);

            //Valores
            parametros.Add("VLRAMORTIZACAO_P", valorAmortizacao); //CORRECAO NILTON
            parametros.Add("VALORAMORTIZACAO_P", valorAmortizacao);
            parametros.Add("VALORPRIMEIRAPARCELA_P", contrato.valorParcela);
            parametros.Add("VALORSOLICITADO_P", valorAmortizacao);
            parametros.Add("VALORDEBITO_P", saldoDevedor);
            parametros.Add("VALORMARGEM_P", valorMargem);
            parametros.Add("VALORMAXIMO_P", valorAmortizacao);
            parametros.Add("SALDODEVEDOR_P", saldoDevedorAnterior);
            parametros.Add("SALDOANTERIOR_P", saldoDevedorAnterior);
            parametros.Add("SALARIOBASE_P", contrato.salarioBase);
            parametros.Add("TAXAJUROS_P", contrato.taxaJuros);
            parametros.Add("AMORTIZACAOFH_P", null);
            parametros.Add("JUROSFH_P", null);

            //itensContrato = this.calcularItens(itensContrato, parametros);

            itensContrato.RemoveAll(i => i == null);
            //William Moreira da Silva - SOL 216458 KTN

            GerenciadorRegra executorRegra = new GerenciadorRegra();

            foreach (ItemContrato item in itensContrato)
            {
                item.valor = (double)executorRegra.executar(item.regra, parametros);
                item.saldoDevedor = this.tratarSaldoDevedor(item);
                parametros["SALDODEVEDOR_P"] = this.saldoDevedor;
                item.competencia = new DateTime(dataAmortizacao.Year, dataAmortizacao.Month, 1);
                //William Moreira da Silva SOL 211418
                if (envio)
                {
                    item.parcela = parcela;
                }
                else
                {
                    item.parcela = parcela + 1;
                }
                //William Moreira da Silva SOL 211418
                item.dataPrevista = dataAmortizacao;
                //item.saldoDevedor = this.tratarSaldoDevedor(item);
                item.taxaJuros = contrato.taxaJuros;
            }

            return itensContrato;
        }

        /// <summary>
        /// Executar regra para cada item da lista.
        /// </summary>
        /// <param name="itensContrato">Lista de itens de contrato.</param>                                                                                 //SIG 67808 - Matias
        public List<ItemContrato> calcularItensQuitacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataQuitacao, TipoOperacao operacao, bool CampanhaInadimplencia)//William Moreira da Silva - SOL 247419
        {
            try
            {
                GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
                // Saulo / FUNCEF
                //Contrato contrato = gerenciadorContrato.consultar(numeroContrato, tipoContrato.veioConector);
                ObjetoContrato contrato = new ObjetoContrato(numeroContrato, tipoContrato.veioConector);

                bool falecimento = false;//William Moreira da Silva

                this.saldoDevedor = gerenciadorContrato.obterSaldoDevedor(numeroContrato, dataQuitacao);
                int parcela = gerenciadorContrato.obterParcelaAtual(numeroContrato) + 1;

                if (tipoContrato.id == 0)
                {
                    tipoContrato = this.consultar(contrato.tipo.id, tipoContrato.veioConector); //Xavier SOL 230843
                }

                List<ItemContrato> itensContrato = this.obterItens(tipoContrato, TipoEvento.quitacao);

                //Parâmetros regras
                Dictionary<string, object> parametros = new Dictionary<string, object>();
                parametros.Add("IDCONTRATO_P", numeroContrato);
                parametros.Add("IDTIPOCONTRATO_P", tipoContrato.id);
                parametros.Add("DATAQUITACAO_P", dataQuitacao);
                parametros.Add("VALORPREVISTO_P", 0);
                parametros.Add("DATAAMORTIZACAO_P", dataQuitacao);
                parametros.Add("DATAEVENTO_P", DateTime.Now);
                parametros.Add("NOVOPRAZO_P", 0);
                parametros.Add("DATACREDITO_P", contrato.dataCredito);
                parametros.Add("IDCONTRATOEMPTMO", numeroContrato);//Willamy Henrique SOL - 239238 PPM - 514531
                if (CampanhaInadimplencia)
                {
                    int tipoProposta;
                    switch (operacao.chave)
                    {
                        case 1:
                            tipoProposta = 3;
                            break;
                        case 8:
                            tipoProposta = 1;
                            break;
                        default:
                            tipoProposta = 0;
                            break;
                    }
                    parametros.Add("TIPOPROPOSTA_P", tipoProposta); //SIG 67808 - Matias 
                }
                else
                {
                    parametros.Add("TIPOPROPOSTA_P", 0);
                }

                if (contrato.mutuario.dataFalecimento.HasValue)
                {
                    parametros.Add("IDOPERACAO_P", TipoOperacao.quitacaoMorte.chave);
                    //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - inicio 
                    //Quando for quitação por falecimento, remover o item "quitação saldo devedor"
                    //itensContrato.RemoveAll(t1 => t1.id == 35);//William Moreira da Silva SOL 210452 KINTANA 2029466
                    //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Fim 
                }
                else
                {
                    parametros.Add("IDOPERACAO_P", operacao.chave);
                }

                parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                //BRUNO AZEVEDO - ALTERAÇÃO CONFORME EMAIL
                parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);


                int? IdCalculo = regra.consultarUltimoIdCalculo();
                parametros.Add("IDCALCULO_P", IdCalculo);


                parametros.Add("USUARIO_P", Contexto.obterUsuario());
                //BRUNO AZEVEDO - ALTERAÇÃO CONFORME EMAIL

                parametros.Add("TAXAJUROS_P", contrato.taxaJuros);//HELEN BIANCHI - ALTERAÇÃO CONFORME EMAIL 
                parametros.Add("IDPLANOPREV_P", contrato.mutuario.plano.id);//SIG 62910
                

                itensContrato = this.calcularItens(itensContrato, parametros, 0);

                //Efetuando por referencia
                foreach (ItemContrato item in itensContrato)
                {
                    item.competencia = new DateTime(dataQuitacao.Year, dataQuitacao.Month, 1);
                    item.parcela = 0;
                    item.sequencia = 1;
                    item.dataPrevista = dataQuitacao;
                    item.saldoDevedor = this.tratarSaldoDevedor(item);
                    item.taxaJuros = contrato.taxaJuros;
                }

                return itensContrato;
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }

        }

        //William Moreira da Silva - SOL 206769/14424 KTN 1999211 - INICIO - Método Sobreposto
        public List<ItemContrato> calcularItensQuitacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataQuitacao, TipoOperacao operacao, int? idCalculo)
        {
            try
            {
                GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
                // Saulo / FUNCEF
                //Contrato contrato = gerenciadorContrato.consultar(numeroContrato, tipoContrato.veioConector);
                ObjetoContrato contrato = new ObjetoContrato(numeroContrato, tipoContrato.veioConector);

                this.saldoDevedor = gerenciadorContrato.obterSaldoDevedor(numeroContrato, dataQuitacao);
                int parcela = gerenciadorContrato.obterParcelaAtual(numeroContrato) + 1;

                if (tipoContrato.id == 0)
                {
                    tipoContrato = this.consultar(contrato.tipo.id, contrato.tipo.veioConector);
                }

                List<ItemContrato> itensContrato = this.obterItens(tipoContrato, TipoEvento.quitacao);

                // SOL 230843
                for (int i = 0; i < itensContrato.Count; i++)
                {
                    itensContrato[i].veioConector = tipoContrato.veioConector;
                }
                // SOL 230843

                //Parâmetros regras
                Dictionary<string, object> parametros = new Dictionary<string, object>();
                parametros.Add("IDCONTRATO_P", numeroContrato);
                parametros.Add("IDTIPOCONTRATO_P", tipoContrato.id);
                parametros.Add("DATAQUITACAO_P", dataQuitacao);
                parametros.Add("VALORPREVISTO_P", 0);
                parametros.Add("DATAAMORTIZACAO_P", dataQuitacao);
                parametros.Add("DATAEVENTO_P", DateTime.Now);
                parametros.Add("NOVOPRAZO_P", 0);

                if (contrato.mutuario.dataFalecimento.HasValue)
                {
                    parametros.Add("IDOPERACAO_P", TipoOperacao.quitacaoMorte.chave);
                }
                else
                {
                    parametros.Add("IDOPERACAO_P", operacao.chave);
                }

                parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                //BRUNO AZEVEDO - ALTERAÇÃO CONFORME EMAIL
                parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);

                if (idCalculo == 0)
                {
                    //int? IdCalculo = regra.consultarUltimoIdCalculo();
                    idCalculo = regra.consultarUltimoIdCalculo();
                }

                parametros.Add("IDCALCULO_P", idCalculo);
                parametros.Add("USUARIO_P", Contexto.obterUsuario());
                //BRUNO AZEVEDO - ALTERAÇÃO CONFORME EMAIL

                parametros.Add("TAXAJUROS_P", contrato.taxaJuros);//HELEN BIANCHI - ALTERAÇÃO CONFORME EMAIL                
                itensContrato = this.calcularItens(itensContrato, parametros, 0);

                foreach (ItemContrato item in itensContrato)
                {
                    item.competencia = new DateTime(dataQuitacao.Year, dataQuitacao.Month, 1);
                    item.parcela = 0;
                    item.sequencia = 1;
                    item.dataPrevista = dataQuitacao;
                    item.saldoDevedor = this.tratarSaldoDevedor(item);
                    item.taxaJuros = contrato.taxaJuros;
                }

                return itensContrato;
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }

        }
        //William Moreira da Silva - SOL 206769/14424 KTN 1999211 - FIM

        //Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Inicio                                                                                                                          //Campanha Desconto       //SIG 67808 - Matias
        public List<ItemContrato> calcularItensQuitacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataQuitacao, TipoOperacao operacao, int? idCalculo, bool pIsConcessao, int? idBarra, string evento, bool CampanhaInadimplencia = false)//William Moreira da Silva - SOL 247419
        {
            try
            {
                GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
                // Saulo / FUNCEF
                //Contrato contrato = gerenciadorContrato.consultar(numeroContrato, pIsConcessao);
                ObjetoContrato contrato = new ObjetoContrato(numeroContrato, pIsConcessao);

                this.saldoDevedor = gerenciadorContrato.obterSaldoDevedor(numeroContrato, dataQuitacao);
                int parcela = gerenciadorContrato.obterParcelaAtual(numeroContrato) + 1;

                if (tipoContrato.id == 0)
                {
                    tipoContrato = this.consultar(contrato.tipo.id, contrato.tipo.veioConector);//Xavier SOL 230843
                }

                List<ItemContrato> itensContrato = this.obterItens(tipoContrato, TipoEvento.quitacao);

                // SOL 230843
                for (int i = 0; i < itensContrato.Count; i++)
                {
                    itensContrato[i].veioConector = tipoContrato.veioConector;
                }
                // SOL 230843

                //Parâmetros regras
                Dictionary<string, object> parametros = new Dictionary<string, object>();
                parametros.Add("IDCONTRATO_P", numeroContrato);
                parametros.Add("IDTIPOCONTRATO_P", tipoContrato.id);
                parametros.Add("DATAQUITACAO_P", dataQuitacao);
                parametros.Add("VALORPREVISTO_P", 0);
                parametros.Add("DATAAMORTIZACAO_P", dataQuitacao);
                parametros.Add("DATAEVENTO_P", DateTime.Now);
                parametros.Add("NOVOPRAZO_P", 0);

                if (contrato.mutuario.dataFalecimento.HasValue)
                {
                    parametros.Add("IDOPERACAO_P", TipoOperacao.quitacaoMorte.chave);
                }
                else
                {
                    parametros.Add("IDOPERACAO_P", operacao.chave);
                }

                parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                //BRUNO AZEVEDO - ALTERAÇÃO CONFORME EMAIL
                parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);

                if (idCalculo == 0)
                {
                    //int? IdCalculo = regra.consultarUltimoIdCalculo();
                    idCalculo = regra.consultarUltimoIdCalculo();
                }

                parametros.Add("IDCALCULO_P", idCalculo);
                parametros.Add("USUARIO_P", Contexto.obterUsuario());
                //BRUNO AZEVEDO - ALTERAÇÃO CONFORME EMAIL

                parametros.Add("TAXAJUROS_P", contrato.taxaJuros);//HELEN BIANCHI - ALTERAÇÃO CONFORME EMAIL 
                if (CampanhaInadimplencia)
                {
                    int tipoProposta;
                    switch (operacao.chave)
                    {
                        case 1: //Novação da dívida
                            tipoProposta = 3;
                            break;
                        case 8: //Quitação total
                            tipoProposta = 1;
                            break;
                        default:
                            tipoProposta = 0;
                            break;
                    }
                    parametros.Add("TIPOPROPOSTA_P", tipoProposta); //SIG 67808 - Matias 
                }
                else
                {
                    parametros.Add("TIPOPROPOSTA_P", 0);
                }
                parametros.Add("IDPLANOPREV_P", contrato.mutuario.plano.id);

                itensContrato = this.calcularItens(itensContrato, parametros, idBarra);

                foreach (ItemContrato item in itensContrato)
                {
                    item.competencia = new DateTime(dataQuitacao.Year, dataQuitacao.Month, 1);
                    item.parcela = 0;
                    item.sequencia = 1;
                    item.dataPrevista = dataQuitacao;
                    item.saldoDevedor = this.tratarSaldoDevedor(item);
                    item.taxaJuros = contrato.taxaJuros;
                }

                return itensContrato;
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }

        }
        //Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Fim 


        /// <summary>
        /// Executar regra para cada item da lista.
        /// </summary>
        /// <param name="itensContrato">Lista de itens de contrato.</param>
        public List<ItemContrato> calcularItens(List<ItemContrato> itensContrato, Dictionary<string, object> parametros, int? idBarraProgresso)//William Moreira da Silva - SOL 247419
        {
            //WILLIAM MOREIRA DA SILVA barraProgresso
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            List<int> regraAtual = gerenciadorConcessao.obterStatusBarraProgresso(idBarraProgresso);
            int i = regraAtual[1] + 1;
            //WILLIAM MOREIRA DA SILVA barraProgresso

            if (itensContrato != null)
            {
                //Adiciona id do item 
                parametros.Add("IDITEMEMPTMO_P", null);

                GerenciadorRegra executorRegra = new GerenciadorRegra();

                foreach (ItemContrato item in itensContrato)
                {
                    if (item.regra == null)
                        throw new InvalidOperationException("O item de contrato deve possuir uma regra associada para esta operação.");

                    parametros["IDITEMEMPTMO_P"] = item.id;

                    if (!item.veioConector) // SOL 230843
                    {
                        //gerenciadorConcessao.atualizaBarraProgresso(Contexto.obterUsuario(), i, 0, 0);//WILLIAM MOREIRA DA SILVA barraProgresso
                        gerenciadorConcessao.atualizaBarraProgresso(Contexto.obterUsuario(), i, 0, 0, idBarraProgresso);//William Moreira da Silva - SOL 247419
                    }
                    item.valor = (double)executorRegra.executar(item.regra, parametros);
                    i++;//WILLIAM MOREIRA DA SILVA barraProgresso
                }
            }

            return itensContrato;
        }

        //William Moreira da Silva - SOL 247419
        public List<ItemContrato> calcularItensConcessao(List<ItemContrato> itensContrato, int? idBarraProgresso, Dictionary<string, object> parametros)
        {
            //WILLIAM MOREIRA DA SILVA barraProgresso
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            List<int> regraAtual = gerenciadorConcessao.obterStatusBarraProgresso(idBarraProgresso);
            int i = regraAtual[1] + 1;
            //WILLIAM MOREIRA DA SILVA barraProgresso

            if (itensContrato != null)
            {
                //Adiciona id do item 
                if (!parametros.ContainsKey("IDITEMEMPTMO_P"))
                    parametros.Add("IDITEMEMPTMO_P", null);

                GerenciadorRegra executorRegra = new GerenciadorRegra();

                foreach (ItemContrato item in itensContrato)
                {
                    if (item.regra == null)
                        throw new InvalidOperationException("O item de contrato deve possuir uma regra associada para esta operação.");

                    parametros["IDITEMEMPTMO_P"] = item.id;

                    if (!item.veioConector) // SOL 230843
                    {
                        //gerenciadorConcessao.atualizaBarraProgresso(Contexto.obterUsuario(), i, 0, 0);//WILLIAM MOREIRA DA SILVA barraProgresso
                        gerenciadorConcessao.atualizaBarraProgresso(Contexto.obterUsuario(), i, 0, 0, idBarraProgresso);//William Moreira da Silva - SOL 247419
                    }
                    if (item.id == 158)
                        item.regra = new Regra { id = 27090, chaveRegra= null, tipoMecanismoRegra = null};
                    item.valor = (double)executorRegra.executar(item.regra, parametros);

                    //@TODO: arrumar/organizar a funcionalidade de concessão e apagar esse código (não faz sentido a prestação base estar dentro dos itens de concessão)
                    if (item.id == 22)
                        parametros["VALORSOLICITADO_P"] = item.valor;

                    i++;//WILLIAM MOREIRA DA SILVA barraProgresso
                }
            }

            return itensContrato;
        }

        // SOL 204001
        /// <summary>
        /// valida permissão por Tipo de Contrato.
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public bool validarPermissao(long idTipoContrato)
        {
            bool bPermissao = acesso.validarPermissao(idTipoContrato);
            return bPermissao;
        }
        // SOL 204001
        /// <summary>
        /// Trata saldo devedor conforme parâmetro do item.
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        private double tratarSaldoDevedor(ItemContrato item)
        {
            //Subtrai
            if (item.trataSaldoDevedor == 1)
            {
                this.saldoDevedor -= item.valor;
                return this.saldoDevedor;
            }

            //Soma
            if (item.trataSaldoDevedor == 2)
            {
                this.saldoDevedor += item.valor;
                return this.saldoDevedor;
            }

            return this.saldoDevedor;
        }

        /// <summary>
        /// Verifica se o tipo do contrato esta ativo
        /// </summary>
        /// <param name="idTipoContrato">id do contrato a ser validado</param>
        /// <returns>Retorna se o contato esta ativo ou não</returns>
        //William Moreira da Silva - SOL 214635 KTN 2044698
        public bool validaContratoAtivo(int idTipoContrato)
        {
            return acesso.validaContratoAtivo(idTipoContrato);
        }

        public TipoContrato ObterTipoContrato(long NumeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                TipoContrato retorno = acesso.ObterTipoContrato(NumeroContrato);

                //Completa a transação
                transacao.Complete();

                return retorno;
            }
        }

        public List<TipoContrato> ListarTodas()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<TipoContrato> retorno = acesso.ListarTodas();

                //Completa a transação
                transacao.Complete();

                return retorno;
            }
        }

        //SIG 128871 - Inclusão do método abaixo
        public Int32 consultarRegraDescFGQC(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {             
                Int32 DescFGQC = acesso.consultarRegraDescFGQC(tipoContrato, tipoEvento);
         
                transacao.Complete();

                return DescFGQC;
            }
        }
    }
}

