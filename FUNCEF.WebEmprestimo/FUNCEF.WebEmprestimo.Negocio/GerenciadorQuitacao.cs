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
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que gerencia Quitação.
    /// </summary>
    public class GerenciadorQuitacao
    {
        #region Atributos

        private IAcessoQuitacao acesso = FabricaObjetos.instancia.obterAcessoQuitacao();
        //BRUNO AZEVEDO
        private IAcessoRegra regra = FabricaObjetos.instancia.obterAcessoRegra();
        private IAcessoContrato contrato = FabricaObjetos.instancia.obterAcessoContrato();
        //BRUNO AZEVEDO

        #endregion

        /// <summary>
        /// Valida a amortização.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="dataCredito">Data de crédito do contrato.</param>
        /// <param name="dataLimite">Data limite para quitação.</param>
        /// <param name="excepcional">Indica se é uma quitação excepcional ou não.</param>
        /// <returns></returns>
        // SOL 204424 KTN 1976597 Otacilio
        // Verificar se a quitação é por falecimento acrescentado variavel bfalecimento
        public bool validar(long numeroContrato, DateTime dataQuitacao, DateTime dataCredito, DateTime dataLimite, bool excepcional, bool bfalecimento)
        {
            //Campanha Desconto - Transaction comentado. Deve ficar?
            //using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            //{
            // Zera a hora das datas
            dataQuitacao = new DateTime(dataQuitacao.Year, dataQuitacao.Month, dataQuitacao.Day);
            dataCredito = new DateTime(dataCredito.Year, dataCredito.Month, dataCredito.Day);
            dataLimite = new DateTime(dataLimite.Year, dataLimite.Month, dataLimite.Day);

            // SOL 204424 KTN 1976597 Otacilio
            // Verificar se a quitação é por falecimento acrescentado variavel bfalecimento
            this.validarDatas(dataQuitacao, dataCredito, dataLimite, excepcional, bfalecimento);

            GerenciadorAmortizacao gerenciadorAmortizacao = new GerenciadorAmortizacao();
            gerenciadorAmortizacao.verificarAmortizacaoAnterior(numeroContrato, dataQuitacao);
            gerenciadorAmortizacao.verificarAmortizacaoExistente(numeroContrato, dataQuitacao);

            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            if (!gerenciadorContrato.verificarAtualizacaoSaldo(numeroContrato, dataQuitacao, TipoEvento.amortizacao))
                throw new ExcecaoPlanus("Há mais de uma atualização do Saldo Devedor posterior à Data de Quitação.");

            //William Moreira da SIlva - SOL 241797
            if (!gerenciadorContrato.verificarAtualizacaoDiaria(numeroContrato, dataQuitacao) && gerenciadorContrato.obterUltSaldoDevedor(numeroContrato) != 0)
                throw new ExcecaoPlanus("Não existe atualização diária para a data informada.");

            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            gerenciadorRegra.verificarBloqueioContabil(dataQuitacao);
            gerenciadorRegra.verificarPeriodo(dataQuitacao);

            if (this.verificarQuitacaoLancada(numeroContrato))
                throw new ExcecaoPlanus("Já existe uma quitação lançada.");

            //transacao.Complete();

            return true;
            //}
        }

        /// <summary>
        /// Valida datas para quitação.
        /// </summary>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="dataCredito">Data de cédito do contrato a ser amortizado.</param>
        /// <param name="dataLimite">Data limite calculada para amortização do contrato.</param>
        /// <param name="excepcional">Define se é uma quitação excepcional.</param>
        // SOL 204424 KTN 1976597 Otacilio
        // Verificar se a quitação é por falecimento acrescentado variavel bfalecimento
        public bool validarDatas(DateTime dataQuitacao, DateTime dataCredito, DateTime dataLimite, bool excepcional, bool bfalecimento)
        {
            if (dataQuitacao <= dataCredito)
                throw new ExcecaoPlanus("Data de Quitação deve ser maior que Data de Crédito.");
            else
            {
                if (!excepcional)
                {
                    DateTime dataAtual = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);


                    // SOL 204424 KTN 1976597 Otacilio
                    // Verificar se a quitação é por falecimento acrescentado variavel bfalecimento
                    if ((dataQuitacao < dataLimite) && (!bfalecimento))
                        throw new ExcecaoPlanus(String.Format("Data de Quitação não pode ser menor que Data Limite ({0}).", dataLimite.ToString("dd/MM/yyyy")));

                    if (dataQuitacao < dataAtual)
                        throw new ExcecaoPlanus("Data de Quitação não pode ser menor que Data Atual.");

                }
            }

            return true;
        }

        /// <summary>
        /// Verifica se existe quitação lançada para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificarQuitacaoLancada(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoVerificacao = acesso.verificarQuitacaoLancada(numeroContrato);

                transacao.Complete();
                return retornoVerificacao;
            }
        }

        // SOL 201048
        /// <summary>
        /// Verifica se existe quitação lançada para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool existeQuitacao(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoVerificacao = acesso.existeQuitacao(numeroContrato);

                transacao.Complete();
                return retornoVerificacao;
            }
        }
        // SOL 201048

        // SOL 201048
        /// <summary>
        /// Verifica menor data de vencimento.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public DateTime dataMinVencto(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                DateTime retornoVerificacao = acesso.dataMinVencto(numeroContrato);

                transacao.Complete();
                return retornoVerificacao;
            }
        }
        // SOL 201048


        // Xavier SOL 168644
        /// <summary>
        /// Chamada do metodo consultarUltimoIdCalculo da interface AcessoRegra
        /// </summary>
        /// <returns></returns>
        public int? consultarUltimoIdCalculo()
        {
            return regra.consultarUltimoIdCalculo();
        }
        // Xavier SOL 168644
        /// <summary>
        /// Estorna Itens a Vencer Atualização diária.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        public void estornarItensAtualizacao(long numeroContrato, DateTime dataQuitacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.estornarItensAtualizacao(numeroContrato, dataQuitacao, Contexto.obterUsuario());

                transacao.Complete();
            }
        }

        /// <summary>
        /// Estorna itens a vencer.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        public void estornarItensAVencer(long numeroContrato, DateTime dataQuitacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.estornarItensAVencer(numeroContrato, dataQuitacao, Contexto.obterUsuario());

                transacao.Complete();
            }
        }

        //BRUNO AZEVEDO
        /// <summary>
        /// PROCEDIMENTO QUE CARREGA TODOS OS ITENS DO CONTRATO PASSADO
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public string carregaHistoricosQuitar(long numeroContrato)
        {
            string sRetorno = "";
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                sRetorno = acesso.carregaHistoricosQuitar(numeroContrato);

                transacao.Complete();
            }
            return sRetorno;
        }
        //BRUNO AZEVEDO

        /// <summary>
        /// Quitar itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        public void quitarItensEmAberto(long numeroContrato, DateTime dataQuitacao) //Xavier SOL 230843
        {
            ObjetoContrato contr = new ObjetoContrato(numeroContrato, false);

            int? idCalculo = regra.consultarUltimoIdCalculo();
            bool sucesso = acesso.quitarItensEmAberto_Procedure(numeroContrato, dataQuitacao, TipoOperacao.concessao.chave, idCalculo, out string msgErro);

            if (!sucesso)
                throw new ExcecaoPlanus("Não foi possível marcar os itens como quitado: " + msgErro);

            /*
            //BRUNO AZEVEDO - VERIFICAR AQUI SE PODE OU NAO QUITAR O ITEM
            string sHistoricosQuitar = "";
            sHistoricosQuitar = this.carregaHistoricosQuitar(numeroContrato);

            if (sHistoricosQuitar != string.Empty)
            {
                GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
                GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();

                //Saulo - FUNCEF
                //Contrato contr = contrato.consultar(numeroContrato, false);
                ObjetoContrato contr = new ObjetoContrato(numeroContrato, false);

                TipoContrato tipoContrato = gerenciadorTipoContrato.consultar(contr.tipo.id, false); //Xavier SOL 230843

                string[] ArrayLinha = new string[20];
                ArrayLinha = sHistoricosQuitar.Split(',');
                // Thiago Melo SOL 218914 Kintana 2050631                    
                List<string> listItens = new List<string>();
                string sResult;
                // Thiago Melo SOL 218914 Kintana 2050631                    

                sHistoricosQuitar = "";
                int? IdCalculo = regra.consultarUltimoIdCalculo();
                for (int j = 0; j <= ArrayLinha.Count() - 1; j++)
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>();
                    parametros.Add("IDHISTMOVEMPTMO_P", Convert.ToInt64(ArrayLinha[j]));
                    parametros.Add("IDOPERACAO_P", TipoOperacao.concessao.chave);
                    parametros.Add("DATAEVENTO_P", dataQuitacao);
                    parametros.Add("IDCALCULO_P", IdCalculo);
                    parametros.Add("USUARIO_P", Contexto.obterUsuario());

                    // Thiago Melo SOL 218914 Kintana 2050631                    
                    if (tipoContrato.regraQuitado.id == 0)
                    {
                        sResult = "S";
                    }
                    else
                    {
                        sResult = Convert.ToString(gerenciadorRegra.executar(tipoContrato.regraQuitado, parametros));
                    }
                    //string sResult = Convert.ToString(gerenciadorRegra.executar(tipoContrato.regraQuitado, parametros));
                    // Thiago Melo SOL 218914 Kintana 2050631

                    parametros.Clear();

                    if (sResult == "S")
                    {
                        sHistoricosQuitar = sHistoricosQuitar + ArrayLinha[j] + ',';
                        listItens.Add(ArrayLinha[j]);// Thiago Melo SOL 218914 Kintana 2050631
                    }
                }

                if (sHistoricosQuitar.Length > 0) // Xavier - adicionado para quando "sHistoricosQuitar" for "" da erro no Substring
                {
                    sHistoricosQuitar = sHistoricosQuitar.Substring(0, sHistoricosQuitar.Length - 1);

                    using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
                    {
                        // Thiago Melo SOL 218914 Kintana 2050631                    
                        //acesso.quitarItensEmAberto(numeroContrato, dataQuitacao, Contexto.obterUsuario(), sHistoricosQuitar);
                        acesso.quitarItensEmAberto(numeroContrato, dataQuitacao, Contexto.obterUsuario(), listItens);
                        // Thiago Melo SOL 218914 Kintana 2050631                    
                        transacao.Complete();
                    }
                }
            }
            //BRUNO AZEVEDO - VERIFICAR AQUI SE PODE OU NAO QUITAR O ITEM
            */
        }

        /// <summary>
        /// Quitar itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="tipoOperacao">Operação do contrato</param>
        public void quitarItensEmAberto(long numeroContrato, DateTime dataQuitacao, int tipoOperacao) // Felipe A. Santos SOL 224874 Kintana 2058420- Sobreposição do método
        {
            ObjetoContrato contr = new ObjetoContrato(numeroContrato, false);
            if (tipoOperacao != 1)
            {
                if (contr.mutuario.dataFalecimento.HasValue)
                {
                    tipoOperacao = TipoOperacao.quitacaoMorte.chave;
                }
                else
                {
                    tipoOperacao = TipoOperacao.quitacao.chave;
                }
            }
            int? idCalculo = regra.consultarUltimoIdCalculo();
            bool sucesso = acesso.quitarItensEmAberto_Procedure(numeroContrato, dataQuitacao, tipoOperacao, idCalculo, out string msgErro);

            if (!sucesso)
                throw new ExcecaoPlanus("Não foi possível marcar os itens como quitado: " + msgErro);

            /*
            //Tranferido todo o processamento para PROCEDURE devido a problema de performance
            //BRUNO AZEVEDO - VERIFICAR AQUI SE PODE OU NAO QUITAR O ITEM
            string sHistoricosQuitar = "";
            sHistoricosQuitar = this.carregaHistoricosQuitar(numeroContrato);

            if (sHistoricosQuitar != string.Empty)
            {
                GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
                GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
                //Contrato contr = contrato.consultar(numeroContrato, false);
                ObjetoContrato contr = new ObjetoContrato(numeroContrato, false);

                if (tipoOperacao != 1)
                {
                    if (contr.mutuario.dataFalecimento.HasValue)
                    {
                        tipoOperacao = TipoOperacao.quitacaoMorte.chave;
                    }
                    else
                    {
                        tipoOperacao = TipoOperacao.quitacao.chave;
                    }
                }

                TipoContrato tipoContrato = gerenciadorTipoContrato.consultar(contr.tipo.id, false); //Xavier SOL 230843

                string[] ArrayLinha = new string[20];
                ArrayLinha = sHistoricosQuitar.Split(',');
                // Thiago Melo SOL 218914 Kintana 2050631                    
                List<string> listItens = new List<string>();
                string sResult;
                // Thiago Melo SOL 218914 Kintana 2050631                    

                sHistoricosQuitar = "";
                int? IdCalculo = regra.consultarUltimoIdCalculo();
                for (int j = 0; j <= ArrayLinha.Count() - 1; j++)
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>();
                    parametros.Add("IDHISTMOVEMPTMO_P", Convert.ToInt64(ArrayLinha[j]));
                    parametros.Add("IDOPERACAO_P", tipoOperacao);
                    parametros.Add("DATAEVENTO_P", dataQuitacao);
                    parametros.Add("IDCALCULO_P", IdCalculo);
                    parametros.Add("USUARIO_P", Contexto.obterUsuario());

                    // Thiago Melo SOL 218914 Kintana 2050631                    
                    if (tipoContrato.regraQuitado.id == 0)
                    {
                        sResult = "S";
                    }
                    else
                    {
                        sResult = Convert.ToString(gerenciadorRegra.executar(tipoContrato.regraQuitado, parametros));
                    }
                    //string sResult = Convert.ToString(gerenciadorRegra.executar(tipoContrato.regraQuitado, parametros));
                    // Thiago Melo SOL 218914 Kintana 2050631

                    parametros.Clear();

                    if (sResult == "S")
                    {
                        sHistoricosQuitar = sHistoricosQuitar + ArrayLinha[j] + ',';
                        listItens.Add(ArrayLinha[j]);// Thiago Melo SOL 218914 Kintana 2050631
                    }
                }

                if (sHistoricosQuitar.Length > 0) // Xavier - adicionado para quando "sHistoricosQuitar" for "" da erro no Substring
                {
                    sHistoricosQuitar = sHistoricosQuitar.Substring(0, sHistoricosQuitar.Length - 1);

                    using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
                    {
                        // Thiago Melo SOL 218914 Kintana 2050631                    
                        //acesso.quitarItensEmAberto(numeroContrato, dataQuitacao, Contexto.obterUsuario(), sHistoricosQuitar);
                        acesso.quitarItensEmAberto(numeroContrato, dataQuitacao, Contexto.obterUsuario(), listItens);
                        // Thiago Melo SOL 218914 Kintana 2050631                    
                        transacao.Complete();
                    }
                }
            }
            //BRUNO AZEVEDO - VERIFICAR AQUI SE PODE OU NAO QUITAR O ITEM
            */
        }

        public void gravar(long numeroContrato, DateTime dataQuitacao, List<Historico> itensQuitacao, bool pveioConector) //Xavier SOL 230843
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                // Felipe A. Santos SOL 224034/17909 PPM 1165556  - início
                GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();

                int IdPessoa = 0;

                if (gerenciadorContrato.isAcordoJudicial(numeroContrato, ref IdPessoa))
                    gerenciadorContrato.EncerrarBloqueioConcessao(IdPessoa, dataQuitacao);

                // Felipe A. Santos SOL 224034/17909 PPM 1165556  - fim

                //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Inicio
                //bool falecimento = false;//William Moreira da Silva SOL 210452 KINTANA 2029466
                //DateTime dtaEfetiva = DateTime.Today;
                //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Fim 
                this.quitarItensEmAberto(numeroContrato, dataQuitacao, TipoOperacao.quitacao.chave); // Felipe A. Santos SOL 224874 Kintana 2058420 - passado o tipo operação
                this.estornarItensAVencer(numeroContrato, dataQuitacao);
                this.estornarItensAtualizacao(numeroContrato, dataQuitacao);
                //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Inicio
                //William Moreira da Silva SOL 210452 KINTANA 2029466
                //falecimento = itensQuitacao.Exists(t1 => t1.id == 17);
                //if (falecimento)
                //{
                //    if (!itensQuitacao.Find(t1 => t1.id == 17).dataEfetiva.HasValue)
                //    {
                //        falecimento = false;
                //    }
                //}
                //William Moreira da Silva SOL 210452 KINTANA 2029466
                //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Fim 

                GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
                gerenciadorHistorico.incluir(itensQuitacao);

                // GerenciadorContrato gerenciadorContrato = new GerenciadorContrato(); // Felipe A. Santos SOL 224034/17909 PPM 1165556 
                //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Inicio 
                //William Moreira da Silva SOL 210452 KINTANA 2029466
                //if(falecimento)
                //{
                //    gerenciadorContrato.alterarSituacao(numeroContrato, new SituacaoContrato() { codigo = "Q" });
                //}
                //else
                //{
                //gerenciadorContrato.alterarSituacao(numeroContrato, new SituacaoContrato() { codigo = "K" });

                gerenciadorContrato.alterarSituacao(numeroContrato);//Willliam Moreira da Silva - SOL 225203
                //}
                //William Moreira da Silva SOL 210452 KINTANA 2029466
                //Marcio Sanches Spinosa SOL 217811 KINTANA 2047962 - Fim 
                gerenciadorContrato.alterarDataQuitacao(numeroContrato, dataQuitacao);

                LogContrato logContrato = new LogContrato()
                {
                    descricao = string.Format(String.Concat(Origem.quitacao.descricao, ":{0}"), dataQuitacao.ToString("dd/MM/yyyy")),
                    numeroContrato = numeroContrato,
                    origem = Origem.quitacao,
                };

                gerenciadorContrato.incluirLog(logContrato);

                transacao.Complete();
            }

        }

        //Campanha Desconto
        //SIG 67808
        public InformacoesQuitacao CalcularQuitacaoCampanhaDescontos(long numeroContrato, DateTime dataQuitacao, long idCalculo, int tipoProposta)
        {
            //using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            //{
            InformacoesQuitacao informacoes = acesso.CalcularQuitacaoCampanhaDescontos(numeroContrato, dataQuitacao, idCalculo, tipoProposta);

            //transacao.Complete();
            return informacoes;
            //}

        }

    }
}