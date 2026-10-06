#region SIG 117302
///
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Alteração:
/// 03/09/2021
///
/// Descrição da Alteração:
/// Apenas validar rubrica de margem se o flag 'política de renegociação' estiver desmarcado.
///
#endregion
#region SIG 93932
///
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Alteração:
/// 03/09/2021
///
/// Descrição da Alteração:
/// Apenas validar rubrica de margem se o flag 'política de renegociação' estiver desmarcado.
///
#endregion
#region SIG 57675
///
/// Autor:
/// Marcelo Valério Ferreira
///
/// Data da Alteração:
/// 09/01/2018 13:05:00
///
/// Descrição da Alteração:
/// Verificação de duplicidade de concessão de 13º salário para o participante.
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
#region SOL 27305
///
/// Autor:
/// William Santana
///
/// Data da Atualização:
/// 12/08/2016
///
/// Descrição da Alteração:
/// Inscrição/Concessão/Renovação visto que o sistema não está respeitando o valor inserido no campo 
/// Margem Consignável para calcular o Valor Máximo Permitido.
/// 
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
#region SOL 208770 / Kintana 2016022
///
/// Autor:
/// Felipe Azevedo dos Santos
///
/// Data da Alteração:
/// 18/03/2015
///
/// Descrição da Alteração:
/// Mudança nas regras de excepcionalização.
///
#endregion
#region SOL 238788 / PPM 507684
///
/// Autor:
/// William Moreira da Silva
///
/// Data da Alteração:
/// 08/09/2014 16:44:33
///
/// Descrição da Alteração:
/// Corrigir erro que ocorre ao final do processo de concessão de novos empréstimos
///
#endregion
#region SOL 237425 / PPM 504553
///
/// Autor:
/// William Moreira da Silva
///
/// Data da Alteração:
/// 08/09/2014 16:39:57
///
/// Descrição da Alteração:
/// O sistema deveria apresentar critica de bloqueio
///
#endregion
#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Jessica Y. Oshiro
///
/// Data da Alteração:
/// 27/04/2016 09:21:53
///
/// Descrição da Alteração:
/// Adição do cálculo do FGQC Base, regra 25209
///
#endregion
#region SIG 20023
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 02/05/2016 12:37:55
///
/// Descrição da Alteração:
/// Não existe regra para Credinâmico 13º
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
using System.Collections;
using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.Componentes.Utilidades;
using System.Web;
using System.Data;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que representa regras de Concessão do sistema.
    /// </summary>
    public class GerenciadorConcessao
    {
        #region Atributos

        int? idBarraProgresso;//William Moreira da Silva - SOL 247419

        private IAcessoConcessao acesso = FabricaObjetos.instancia.obterAcessoConcessao();
        //BRUNO AZEVEDO
        private IAcessoRegra regra = FabricaObjetos.instancia.obterAcessoRegra();
        private IAcessoMutuario acessoMutuario = FabricaObjetos.instancia.obterAcessoMutuario();
        //BRUNO AZEVEDO

        private IAcessoTipoContrato TipoContrato = FabricaObjetos.instancia.obterAcessoTipoContrato();
        #endregion

        #region Consultas

        /// <summary>
        /// Calcula a data da primeira parcela.
        /// </summary>
        /// <param name="idPatrocinadora">Identificação da Patrocinadora para filtro.</param>
        /// <param name="idPlanoPrevidenciario">Identificação do Plano Previdenciario para filtro.</param>
        /// <returns>Data da Cobrança.</returns>
        public DateTime calcularPrimeiraParcela(int idPatrocinadora, int idPlanoPrevidenciario, DateTime dataCredito)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                // Valida os indentificadores.
                Validacao.identificadorValido(idPatrocinadora);
                Validacao.identificadorValido(idPlanoPrevidenciario);

                // Valida data.
                Validacao.dataValida(dataCredito, "Data de Crédito");

                // Obtem data da parcela.
                DateTime dataPrimeiraParcela = acesso.calcularPrimeiraParcela(idPatrocinadora, idPlanoPrevidenciario, dataCredito);

                //Completa a transação
                transacao.Complete();

                return dataPrimeiraParcela;
            }
        }

        /// <summary>
        /// Verficia se existe suspensão associada ao mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário a ser filtrada.</param>
        /// <param name="dataReferencia">Data de referência da suspensão a ser filtrada.</param>
        /// <param name="veioConector">Para para indentificar se a requisição vem do conetor ou do webemprestimo</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Suspensao"/> com os dados encontrados.</returns>
        //William Moreira da Silva - SOL 224562 KTN 2059616 - parametro veioConector para identificar de onde esta vindo a requisição
        public Suspensao consultarSuspensao(int idMutuario, int idTipoContratoEmpto, DateTime dataReferencia, bool veioConector, out string aviso)//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                aviso = String.Empty;

                // Valida os parametros.
                Validacao.identificadorValido(idMutuario);
                Validacao.dataValida(dataReferencia, "Data de Referência");

                // Executa a pesquisa.
                Suspensao suspensao = acesso.consultarSuspensao(idMutuario, idTipoContratoEmpto, dataReferencia);//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567

                if (suspensao != null)
                {
                    StringBuilder msg = new StringBuilder();
                    if (!veioConector)
                    {
                        //William Moreira da Silva - SOL 237425 PPM 504553
                        //aviso = "Bloqueio de Concessão\\n";
                        //if (suspensao.dataFinal != null)
                        //{
                        //    aviso = aviso + string.Format("Fim:{0}\\n", suspensao.dataFinal);
                        //}
                        //aviso = aviso + string.Format("Motivo:{0}\\n", suspensao.motivosSuspensao);

                        msg.Append("Bloqueio de Concessão\\n");
                        msg.AppendFormat("Início:{0}\\n", suspensao.dataInicio);
                        if (suspensao.dataFinal != null)
                        {
                            msg.AppendFormat("Fim:{0}\\n", suspensao.dataFinal);
                        }
                        msg.AppendFormat("Motivo:{0}", suspensao.motivosSuspensao);
                        aviso = msg.ToString();
                        //William Moreira da Silva - SOL 237425 PPM 504553 
                    }
                    else
                    {
                        msg.Append("A solicitação de empréstimo deverá ser avaliada pela Funcef. Por gentileza entre em contato com a Central de Relacionamento e Atendimento Funcef (0800 706 9000 ou gerat@funcef.com.br)");
                        throw new ExcecaoPlanus(msg.ToString());//William Moreira da Silva - SOL 
                    }
                    //throw new ExcecaoPlanus(msg.ToString());
                    //William Moreira da Silva - SOL 224562 KTN 2059616 - Condição para a mensagem apresentada no conector seja diferente do web Emprestimo
                }

                //Completa a transação
                transacao.Complete();

                // retorna o valor encontrado.
                return suspensao;
            }
        }
        // xavier SOL 178579

        // Thiago Melo SOL 202311 KINTANA 1956671
        public void consultarContratosAnteriores(int idpessoa, int idMutuario, DateTime hmeData, int idTipoEmprestimo, int quitavel, int idTipoContrato, bool flgExcepcional, out string aviso, string contratosSelecionados = null)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                aviso = String.Empty;

                // Valida os parametros.
                Validacao.identificadorValido(idpessoa);
                Validacao.identificadorValido(idMutuario);
                Validacao.dataValida(hmeData, "Data de Credito");
                Validacao.identificadorValido(idTipoEmprestimo);
                Validacao.identificadorValido(quitavel);
                Validacao.identificadorValido(idTipoContrato);

                // Executa a pesquisa.                
                List<Contrato> contratos = acesso.consultarContratosAnteriores(idpessoa, idMutuario, hmeData, idTipoEmprestimo, quitavel, idTipoContrato, flgExcepcional, contratosSelecionados);

                //Saulo Cirineu
                if (contratos != null)
                {
                    StringBuilder msg = new StringBuilder();

                    if (!flgExcepcional)
                    {
                        for (int i = 0; i < contratos.Count; i++)
                        {
                            if (contratos[i].flgPrazoQuitacao == 0)
                            {
                                if (contratos[i].parcelasPagas < contratos[i].tcemirenova)
                                {
                                    msg.Append("Número de parcelas pagas do contrato anterior é inferior ao permitido!");
                                    //throw new ExcecaoPlanus(msg.ToString()); // Felipe A. Santos SOL 228385 KTN 2063118
                                    aviso = msg.ToString();
                                }
                            }
                        }
                    }
                }

                //Completa a transação
                transacao.Complete();

                // retorna o valor encontrado.               
            }
        }
        // Thiago Melo SOL 202311 KINTANA 1956671 FIM

        //MARCIO SANCHES SPINOSA - SOL 204760 INI
        public List<long> obterContratoEmptmo(int idMutuario, int idBeneficiario, DateTime dataCredito)
        {
            List<long> contratoEmptmo = new List<long>();

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                contratoEmptmo = acesso.obterContratoEmptmo(idMutuario, idBeneficiario, dataCredito);

                //Completa a transação
                transacao.Complete();
                // retorna o valor encontrado.               
            }
            return contratoEmptmo;
        }


        public double existemItensEmAberto(long idcontratoemptmo, bool usaData, DateTime dataCredito, bool usaMes, int ano, int mes, out string aviso)
        {
            double vlrResult = 0;

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                aviso = String.Empty;
                StringBuilder msg = new StringBuilder();
                vlrResult = acesso.existemItensEmAberto(idcontratoemptmo, usaData, dataCredito, usaMes, ano, mes);

                if (vlrResult != 0)
                {
                    // SOL 205183 KTN 1984449 - Otacilio ** Inicio ** 
                    //msg.Append("Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.");
                    //throw new ExcecaoPlanus(msg.ToString());
                    aviso = "Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.";
                    // SOL 205183 KTN 1984449 - Otacilio ** Fim **
                }

                //Completa a transação
                transacao.Complete();

                return vlrResult;
            }
        }
        //MARCIO SANCHES SPINOSA - SOL 204760 FIM




        /// <summary>
        /// Consulta Grupo Excepcional
        /// </summary>        
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) Grupo(s) Excepcionais encontrado(s).</returns>
        public List<Grupoexcepcional> listarGrupoExcepcional()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {

                List<Grupoexcepcional> grupoexcepcional = acesso.listarGrupoExcepcional();

                //Completa a transação
                transacao.Complete();

                return grupoexcepcional;
            }
        }

        /// <summary>
        /// Inclui Grupo Excepcional e Contratoemptmo na CONTRATOEMPTMOXEXCEPCIONAL
        /// </summary>
        public void incluirContratoEmptmoXExcepcional(Int64 idContrato, int idGrupoExcepcional)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirContratoEmptmoXExcepcional(idContrato, idGrupoExcepcional);

                //Completa a transação
                transacao.Complete();
            }

        }

        // xavier SOL 178579

        /// <summary>
        /// Incluir endereco da pessoa
        /// </summary>
        public Int32 IncluirEndereco(Endereco endPessoa)
        {
            Int32 idEndereco = 0;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                idEndereco = acesso.IncluirEndereco(endPessoa);

                //Completa a transação
                transacao.Complete();
            }
            return idEndereco;
        }

        /// <summary>
        /// Incluir a pessoa
        /// </summary>
        public Int32 incluirPessoa(List<Pessoa> pessoa)
        {
            Int32 idPessoa = 0;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                idPessoa = acesso.incluirPessoa(pessoa);

                //Completa a transação
                transacao.Complete();
            }
            return idPessoa;
        }

        /// <summary>
        /// Incluir documento pessoa
        /// </summary>
        public void incluirDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirDocPessoa(documentoPessoa, idPessoa);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// alterar documento pessoa
        /// </summary>
        public void alterarDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarDocPessoa(documentoPessoa, idPessoa);

                //Completa a transação
                transacao.Complete();
            }
        }



        /// <summary>
        /// alterar a pessoa
        /// </summary>
        public void alterarPessoa(List<Pessoa> pessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarPessoa(pessoa);

                //Completa a transação
                transacao.Complete();
            }
        }


        /// <summary>
        /// excluir a pessoa
        /// </summary>
        public void excluirPessoa(List<Pessoa> pessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirPessoa(pessoa);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Incluir a avalista
        /// </summary>
        public void incluirNovoAvalista(List<Avalistas> avalista)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirNovoAvalista(avalista);

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// Alterar a avalista
        /// </summary>
        public void alterarNovoAvalista(List<Avalistas> avalista)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarNovoAvalista(avalista);

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// Excluir endereço da pessoa
        /// </summary>
        public void excluirTelefoneEndereco(Int32 idEndereco)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirTelefoneEndereco(idEndereco);

                //Completa a trasação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Excluir a avalista
        /// </summary>
        public void excluirNovoAvalista(Int32 idAvalista)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirNovoAvalista(idAvalista);

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// Metodo para incluir o telefone e o contato, e retornar seus respectivos id para inserção na tabela telContato
        /// </summary>
        /// <param name="telefone"></param>
        /// <param name="contato"></param>
        public void incluirTelefoneContato(List<Telefone> telefones, List<Contato> contatos, int idEndereco)
        {
            int? aux = 0;
            int ids = 0;
            List<TelContato> telcontatos = new List<TelContato>();

            if (telefones != null && telefones.Count > 0)
            {
                for (int i = 0; i < telefones.Count; i++)
                {
                    if (telefones[i].idContato != 0)
                    {
                        telcontatos.Add(new TelContato()
                        {
                            idTelefone = telefones[i].idTelefone,
                            idContato = telefones[i].idContato
                        });
                    }
                }
            }

            if (contatos != null && contatos.Count > 0)
            {
                for (int i = 0; i < contatos.Count; i++)
                {
                    if (contatos[i].idTelefone != 0)
                    {
                        telcontatos.Add(new TelContato()
                        {
                            idTelefone = contatos[i].idTelefone,
                            idContato = contatos[i].idContato
                        });
                    }
                }
            }

            if (telefones != null && telefones.Count > 0)
            {
                for (int i = 0; i < telefones.Count; i++)
                {
                    ids = telefones[i].idTelefone;
                    telefones[i].idEndereco = idEndereco;
                    aux = acesso.incluirTelefone(telefones[i]);
                    if (telcontatos != null && telcontatos.Count > 0)
                    {
                        for (int j = 0; j < telcontatos.Count; j++)
                        {
                            if (telcontatos[j].idTelefone == ids)
                            {
                                telcontatos[j].idTelefone = aux;
                            }
                        }
                    }
                }
            }

            if (contatos != null && contatos.Count > 0)
            {
                for (int i = 0; i < contatos.Count; i++)
                {
                    ids = contatos[i].idContato;
                    contatos[i].idEndereco = idEndereco;
                    aux = acesso.incluirContato(contatos[i]);
                    if (telcontatos != null && telcontatos.Count > 0)
                    {
                        for (int j = 0; j < telcontatos.Count; j++)
                        {
                            if (telcontatos[j].idContato == ids)
                            {
                                telcontatos[j].idContato = aux;
                            }
                        }
                    }
                }
            }

            if (telcontatos != null && telcontatos.Count > 0)
            {
                for (int i = 0; i < telcontatos.Count; i++)
                {
                    acesso.incluirTelContato(telcontatos[i]);
                }
            }
        }

        /// <summary>
        /// Excluir apenas o relacionamento entre contato e Telefone
        /// </summary>
        /// <param name="idTelContato"></param>
        public void excluirTelContato(Int32 idTelContato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirTelContato(idTelContato);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Incluir telefone
        /// </summary>
        public void incluirTelefone(Telefone telefone)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirTelefone(telefone);

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// Alterar telefone
        /// </summary>
        public void alterarTelefone(Telefone telefone)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarTelefone(telefone);

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// excluir telefone
        /// </summary>
        public void excluirTelefone(Telefone telefone)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirTelefone(telefone);

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// excluir telefone
        /// </summary>
        public void excluirTelefones(List<Telefone> telefones)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                for (int i = 0; i < telefones.Count; i++)
                {
                    acesso.excluirTelefone(telefones[i]);
                }

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// inserir contato
        /// </summary>
        public void incluirContato(Contato contato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirContato(contato);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// alterar a pessoa
        /// </summary>
        public void alterarContato(Contato contato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarContato(contato);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// excluir a pessoa
        /// </summary>
        public void excluirContato(Contato contato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirContato(contato);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// excluir a pessoa
        /// </summary>
        public void excluirContatos(List<Contato> contatos)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                for (int i = 0; i < contatos.Count; i++)
                {
                    acesso.excluirContato(contatos[i]);
                }

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Alterar endereco da pessoa
        /// </summary>
        public void alterarEndereco(Endereco endPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarEndereco(endPessoa);

                //Completa a transação
                transacao.Complete();
            }

        }

        /// <summary>
        /// Inclui Grupo Excepcional e Contratoemptmo na CONTRATOEMPTMOXEXCEPCIONAL
        /// </summary>
        public void excluirEndereco(Int32 idEndereco)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirEndereco(idEndereco);

                //Completa a transação
                transacao.Complete();
            }

        }

        //Sadi Sol213592_Kintana2040335
        /// <summary>
        /// Inclui  e Contratoemptmo na CONTRATOEMPTMOXEXCEPCIONAL
        /// </summary>
        public void incluirContratoEmptmoSuspconcessao(Int64 idContrato, int idPessoa, string Observacao, int IdTipoSuspensao, int QtdMesesSuspensao, string ModalidadesBloqueio)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirContratoEmptmoSuspconcessao(idContrato, idPessoa, Observacao, IdTipoSuspensao, QtdMesesSuspensao, ModalidadesBloqueio);

                //Completa a transação
                transacao.Complete();
            }

        }

        // SADI FREIRE SOL213592_Kintana2040335 

        /// <summary>
        /// Verifica se existe concessao não efetivada
        /// </summary>
        /// <param name="tipoContrato"></param>
        /// <param name="idMutuario"></param>
        /// <returns></returns>
        public bool verificarConcessaoNaoEfetivada(TipoContrato tipoContrato, int idMutuario)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retorno = acesso.verificarConcessaoNaoEfetivada(tipoContrato, idMutuario);

                //Completa a transação
                transacao.Complete();

                return retorno;
            }

        }

        /// <summary>
        /// //Tipo de contrato em aberto impede contratação!
        /// </summary>
        /// <param name="tipoContrato"></param>
        /// <param name="mutuario"></param>
        /// <returns></returns>
        public bool verificarDisponibilidadeEmprestimo(TipoContrato tipoContrato, Mutuario mutuario, int? idCalculo)
        {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            string mensagem = String.Empty;

            Regra regraContratosEmAberto = new Regra()
            {
                id = 25789
            };

            parametros.Add("IDPESSOA_P", mutuario.id);
            //parametros.Add("IDTITULAR_P", mutuario.id);// Felipe A. Santos SOL 223534 Kintana 2057264
            parametros.Add("IDTITULAR_P", mutuario.idTitular);// Felipe A. Santos SOL 223534 Kintana 2057264
            parametros.Add("IDTIPOCONTRATO_P", tipoContrato.id);
            parametros.Add("IDOPERACAO_P", TipoOperacao.concessao.chave);
            parametros.Add("DATAATUALIZA_P", DateTime.Now);
            parametros.Add("IDTIPOEMPRESTIMO_P", tipoContrato.tipoEmprestimo.id);
            parametros.Add("IDCALCULO_P", idCalculo);
            parametros.Add("USUARIO_P", Contexto.obterUsuario());

            object contratosEmAberto = gerenciadorRegra.executar(regraContratosEmAberto, parametros);

            return (bool)contratosEmAberto;

        }

        #endregion

        #region Inclusões

        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - início
        public void IncluirBloqueioConcessaoPorAcordoJudicial(Contrato contrato, long ContratoConcedido)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.IncluirBloqueioConcessaoAcordoJudicial(contrato, ContratoConcedido);

                transacao.Complete();
            }

        }

        public int obterEventoJudicial()
        {
            return acesso.obterEventoJudicial();
        }

        public void IncluirEventoDeCobranca(double NumeroContrato, DateTime DataOperacao, int IdTipoEvento, string Observacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                int id = acesso.IncluirEventoDeCobranca(NumeroContrato, DataOperacao, IdTipoEvento, Observacao);

                this.InserirItensEmAbertoAoEventoJudicial(this.ConsultarItensDeInadimplencia((long)NumeroContrato, DataOperacao), id);

                transacao.Complete();
            }
        }

        public List<long> ConsultarItensDeInadimplencia(long numeroContrato, DateTime dataCredito)
        {
            return acesso.ConsultarItensDeInadimplencia(numeroContrato, dataCredito);
        }

        public void InserirItensEmAbertoAoEventoJudicial(List<long> ListaIdHistMovEmptmo, int IdHistEventoCobEmptmo)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.InserirItensEmAbertoAoEventoJudicial(ListaIdHistMovEmptmo, IdHistEventoCobEmptmo);

                transacao.Complete();
            }
        }
        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - fim


        //William Moreira da Silva - SOL 143476/16437 - incluido o paramentro do relatorio
        public long gravar(Contrato contrato, List<Historico> itensHistorico, List<ItemContrato> itensContrato, List<Contrato> contratosAQuitar, RelatorioContrato relatorio, string ContratoHTML)
        {
            try
            {
                string aviso = string.Empty;

                if (!this.verificarAtualizaoDiaria(contratosAQuitar, contrato.dataCredito.Value, out aviso))
                {
                    throw new ExcecaoPlanus(aviso);
                }

                if (!this.verificarQuitacoes(contratosAQuitar, out aviso))
                {
                    throw new ExcecaoPlanus(aviso);
                }

                //Verificações
                GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();

                gerenciadorRegra.verificarBloqueioContabil(contrato.dataCredito.Value);

                gerenciadorRegra.verificarPeriodo(contrato.dataCredito.Value);

                GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();


                using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
                {
                    GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
                    GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();

                    long idInscricao = gerenciadorContrato.incluirInscricao(contrato);

                    foreach (ItemContrato item in itensContrato.FindAll(t1 => t1.centraliza == 0))
                    {
                        gerenciadorContrato.incluirInscricaoHistorico(idInscricao, item);
                    }

                    //Inclui o Id da inscrição no contrato
                    contrato.inscricaoEmprestimo = new InscricaoEmprestimo { id = idInscricao };
                    long numeroContrato = gerenciadorContrato.incluir(contrato);
                    contrato.numero = numeroContrato;


                    //William Moreira da Silva - SOL 238788 PPM 507684
                    if (contrato.avalistas != null)
                    {
                        //William Moreira da Silva - SOL 199759
                        for (int i = 0; i < contrato.avalistas.Count; i++)
                        {
                            gerenciadorContrato.incluirAvalista(contrato.avalistas[i], numeroContrato);
                        }
                        //William Moreira da Silva - SOL 199759
                    }
                    //William Moreira da Silva - SOL 238788 PPM 507684

                    //William Moreira da Silva - SOL 143476/16437
                    if (relatorio != null && relatorio.impresso == 1)
                    {
                        relatorio.numeroContrato = numeroContrato;
                        gerenciadorContrato.incluirInformacoesDadosContratoEmptmo(relatorio);
                    }
                    //William Moreira da Silva - SOL 143476/16437

                    ItemContrato ItemCentralizador = itensContrato.Find(t1 => t1.centraliza == 1);

                    for (int i = 0; i < itensHistorico.Count; i++)
                    {
                        itensHistorico[i].numeroContrato = numeroContrato;
                        itensHistorico[i].itemCentraliza = ItemCentralizador;
                    }

                    gerenciadorHistorico.incluir(itensHistorico);

                    this.quitarContratosEmAberto(contrato, contratosAQuitar, itensHistorico); //Xavier SOL 230843 // Thiago Melo SOL 207152 Ktn 2013631

                    //WO7659 - Comentado bloco abaixo - suspensão dessa regra no Web Empréstimo, tendo em vista que não está mais em conformidade com as atuais regras para a novação
                    //foreach (Contrato item in contratosAQuitar.FindAll(t1 => t1.efetiva == true))
                    //{
                    //    this.incluirContratoEmptmoSuspconcessao(item.numero, item.mutuario.id);

                    //    break;
                    //}

                  

                    // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - início 
                    if (contrato.FlagAcordoJudicial == 1)
                    {
                        this.IncluirBloqueioConcessaoPorAcordoJudicial(contrato, contrato.numero);
                    }
                    // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - fim

                    //SIG 63057
                    if (!string.IsNullOrEmpty(ContratoHTML))
                        gerenciadorContrato.GravarContrato(numeroContrato, ContratoHTML);

                    //Completa a transação
                    transacao.Complete();

                    return numeroContrato;
                }
            }
            catch (Exception e)
            {
                throw new ExcecaoPlanus(e.Message);
            }
        }

        private void quitarContratosEmAberto(Contrato contratoNovo, List<Contrato> contratos, List<Historico> itensHis) //Xavier SOL 230843 // Thiago Melo SOL 207152 Ktn 2013631
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
                GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
                GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();

                for (int i = 0; i < contratos.Count; i++)
                {
                    if (contratos[i].valorAQuitar > 0) // Felipe A. Santos SOL 223708 KINTANA 2061209 
                    {
                        List<Historico> listaHistorico = new List<Historico>();

                        for (int x = 0; x < contratos[i].itens.Count; x++)
                        {
                            Historico itemHistorico = new Historico();

                            itemHistorico.numeroContrato = contratos[i].numero;
                            itemHistorico.itemCentraliza = contratos[i].itens.Find(it => it.centraliza == 1);
                            itemHistorico.item = contratos[i].itens[x];
                            itemHistorico.parcela = 0;
                            itemHistorico.tipoMovimento = contratos[i].itens[x].tipoEvento;

                            // Thiago Melo SOL 207152 Kintana 2013631
                            //itemHistorico.origem = Origem.quitacao;
                            itemHistorico.origem = itensHis[0].origem;
                            // Thiago Melo SOL 207152 Kintana 2013631

                            //itemHistorico.formaCobranca = listaOpcoesFormaEnvio.SelectedValue;
                            itemHistorico.sequenciaCobranca = 1;
                            itemHistorico.prioridade = contratos[i].itens[x].prioridade;
                            itemHistorico.centraliza = contratos[i].itens[x].centraliza;
                            itemHistorico.destacado = contratos[i].itens[x].destacado;
                            itemHistorico.data = DateTime.Now;
                            itemHistorico.dataPrevista = contratoNovo.dataCredito;
                            itemHistorico.dataAtualizacao = contratoNovo.dataCredito.Value;
                            itemHistorico.anoCompetencia = contratoNovo.dataCredito.Value.Year;
                            itemHistorico.mesCompetencia = contratoNovo.dataCredito.Value.Month;
                            itemHistorico.anoCobranca = contratoNovo.dataCredito.Value.Year;
                            itemHistorico.mesCobranca = contratoNovo.dataCredito.Value.Month;
                            itemHistorico.valorPrevisto = contratos[i].itens[x].valor;

                            if (contratos[i].itens[x].centraliza == 1)
                            {
                                itemHistorico.dataEfetiva = contratoNovo.dataCredito;
                                itemHistorico.valorEfetivo = contratos[i].itens[x].valor;
                                itemHistorico.baixado = null;
                            }
                            else
                            {
                                itemHistorico.dataEfetiva = null;
                                itemHistorico.valorEfetivo = null;
                                itemHistorico.baixado = 0;
                            }

                            itemHistorico.saldoDevedor = 0;
                            itemHistorico.taxaJuros = 0;
                            itemHistorico.enviado = 0;
                            itemHistorico.rubrica = contratos[i].itens[x].rubrica;
                            itemHistorico.pagarReceber = contratos[i].itens[x].pagarReceber;
                            itemHistorico.numeroParcelas = 0;
                            itemHistorico.dataVencimento = contratoNovo.dataCredito;
                            itemHistorico.tipoDivergencia = 0;
                            itemHistorico.dataInclusao = DateTime.Now;
                            itemHistorico.usuarioInclusao = contratoNovo.usuario.login;
                            itemHistorico.versao = contratoNovo.versao;
                            itemHistorico.patrocinadora = contratoNovo.patrocinadora;
                            //itemHistorico.tipoRecurso = new TipoRecurso() { id = Convert.ToInt32(comboTipoRecurso.SelectedValue) };
                            //itemHistorico.origemRecurso = caitaTextoOrigemRecurso.Text;
                            itemHistorico.parcelaAlternativa = 0;

                            listaHistorico.Add(itemHistorico);

                        }

                        //William Moreira da Silva - SOL 201217 KINTANA 1944822
                        //gerenciadorQuitacao.estornarItensAVencer(contratos[i].numero, contratoNovo.dataAssinatura.Value);
                        //gerenciadorQuitacao.estornarItensAtualizacao(contratos[i].numero, contratoNovo.dataAssinatura.Value);
                        //gerenciadorQuitacao.quitarItensEmAberto(contratos[i].numero, contratoNovo.dataCredito.Value);
                        gerenciadorQuitacao.estornarItensAVencer(contratos[i].numero, contratoNovo.dataCredito.Value);
                        gerenciadorQuitacao.estornarItensAtualizacao(contratos[i].numero, contratoNovo.dataCredito.Value);
                        //gerenciadorQuitacao.quitarItensEmAberto(contratos[i].numero, contratoNovo.dataCredito.Value);
                        gerenciadorQuitacao.quitarItensEmAberto(contratos[i].numero, contratoNovo.dataCredito.Value, TipoOperacao.concessao.chave); // Felipe A. Santos SOL 224874 Kintana 2058420 - passado o tipo operação

                        gerenciadorHistorico.incluir(listaHistorico);
                        //gerenciadorContrato.alterarSituacao(contratos[i].numero, new SituacaoContrato() { codigo = "K" });
                        gerenciadorContrato.ajustarSituacao(contratos[i].numero, contratoNovo.dataCredito.Value);
                        gerenciadorContrato.alterarDataQuitacao(contratos[i].numero, contratoNovo.dataCredito.Value);
                        gerenciadorContrato.alterarContratoQuitacao(contratoNovo.numero, contratos[i].numero);

                        double saldoDevedor = gerenciadorContrato.obterSaldoDevedor(contratos[i].numero, contratoNovo.dataCredito.Value.AddDays(-1));
                        gerenciadorContrato.executarAjusteSaldo(contratos[i].numero, contratoNovo.dataCredito.Value, saldoDevedor);
                        //William Moreira da Silva - SOL 201217 KINTANA 1944822

                        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - início
                        if (contratoNovo.FlagAcordoJudicial == 1)
                            //Evento acordo judicial = 20
                            IncluirEventoDeCobranca(contratos[i].numero, contratoNovo.dataCredito.Value, 20, "Evento inserido automaticamente por uma concessão por acordo judicial.");
                        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - fim

                        LogContrato logContrato = new LogContrato()
                        {
                            descricao = string.Format(String.Concat(Origem.quitacao.descricao, ":{0}"), contratoNovo.dataCredito.Value.ToString("dd/MM/yyyy")),
                            numeroContrato = contratos[i].numero,
                            origem = Origem.concessao,
                        };


                        gerenciadorContrato.incluirLog(logContrato);
                    } // Felipe A. Santos SOL 223708 KINTANA 2061209
                }

                //Completa a transação
                transacao.Complete();

            }

        }

        #endregion

        //William Moreira da Silva - SOL 247419
        public int? consultarUltimoIdTabela(string tabela)
        {
            return acesso.consultarUltimoIdTabela(tabela);
        }

        #region Calculos
        //BRUNO AZEVEDO SOL213592_KTN2040335
        public List<Contrato> calcular(int idMutuario, int idTipoContrato, string matricula, ref Concessao concessao, ref List<ItemContrato> itensConcessao, List<long> contratosSelecionados, out List<string> listaMensagens, bool bCalculaAnteriores, List<Contrato> ContratosCalculados, int? idBarra, bool CampanhaDescontos = false) // Thiago Melo SOL 206149
        {
            string UsuarioCalc = string.Empty;
            double ValorUltimaPrestacaoFGQC = 0;
            try
            {
                GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
                GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
                GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
                GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();

                idBarraProgresso = idBarra;
                int? IdCalculo = regra.consultarUltimoIdCalculo();
                UsuarioCalc = string.IsNullOrEmpty(Contexto.obterUsuario()) ? IdCalculo.ToString() : Contexto.obterUsuario();
                //Campanha Desconto
                concessao.idCalculo = IdCalculo;

                if (!concessao.veioConector) // SOL 230843
                {
                    acesso.deletaStatusBarraProgresso(UsuarioCalc); //WILLIAM MOREIRA DA SILVA barraProgresso
                    //idBarraProgresso = acesso.consultarUltimoIdTabela("TB_EMP_BARRAPROGRESSO");//William Moreira da Silva - SOL 247419                    
                }
                int quantRegras = 0;//WILLIAM MOREIRA DA SILVA barraProgresso

                Mutuario mutuario = gerenciadorMutuario.obterDadosMutuario(matricula);// Thiago Melo SOL 206149

                TipoContrato tipoContrato = gerenciadorTipoContrato.consultar(idTipoContrato, concessao.veioConector);//Xavier SOL 230843

                //WILLIAM MOREIRA DA SILVA barraProgresso
                List<Contrato> contratosRegras = gerenciadorMutuario.consultarContratosEmabertoItens(mutuario.id, mutuario.idTitular, tipoContrato.tipoEmprestimo.id, tipoContrato.id);


                Contrato contratoCountRegra = new Contrato();
                contratoCountRegra.itens = gerenciadorTipoContrato.obterItens(tipoContrato, TipoEvento.concessao);
                contratosRegras.Add(contratoCountRegra);

                //BRUNO AZEVEDO SOL213592_KTN2040335
                if (bCalculaAnteriores)
                {
                    for (int i = 0; i < contratosRegras.Count; i++)
                    {
                        quantRegras += contratosRegras[i].itens.Count;
                    }
                }
                //BRUNO AZEVEDO

                //int? IdCalculo = regra.consultarUltimoIdCalculo();

                //barraProgresso WILLIAM MOREIRA DA SILVA
                int regExecutando = 1;
                if (!concessao.veioConector) // SOL 230843
                {
                    //William Moreira da Silva - SIG 27879 - Aumento na quantidade de regras a serem executadas por contrato
                    acesso.incluirIdbarraProgresso(idBarraProgresso, UsuarioCalc, (9 + quantRegras + this.obtemQuantRegras(concessao, tipoContrato)));
                }
                //barraProgresso WILLIAM MOREIRA DA SILVA

                //Tipo de contrato em aberto impede contratação!
                if (!this.verificarDisponibilidadeEmprestimo(tipoContrato, mutuario, IdCalculo))//NILTON 09/01/13
                    throw new ExcecaoPlanus("Tipo de contrato em aberto impede contratação!");

                //Verifica se existe contratos não efetivados
                List<String> Mensagens = new List<string>();
                if (tipoContrato.verificaContratoEfetivado > 0)
                {
                    if (this.verificarConcessaoNaoEfetivada(tipoContrato, idMutuario))
                    {

                        if (concessao.veioConector)
                        {
                            throw new ExcecaoPlanus("Participante não poderá solicitar Empréstimo pois possui outro anterior não efetivado.");
                        }

                        Mensagens.Add("Participante não poderá solicitar Empréstimo pois possui outro anterior não efetivado.");

                    }
                }

                Dictionary<string, object> parametros = new Dictionary<string, object>();

                //IDs
                parametros.Add("MATRICULA_P", mutuario.matricula);
                parametros.Add("TXJUROS_P", 0); // xavier alterar a assinatura conforme e-mail
                parametros.Add("ORIGEM_P", 0); // xavier alterar a assinatura conforme e-mail            
                parametros.Add("SITFUNDACAO_P", mutuario.flginternoParticipante); // xavier alterar a assinatura da regra 6170 conforme e-mail
                parametros.Add("IDPATRO_P", mutuario.patrocinadora.id); // xavier alterar a assinatura da regra 6170 conforme e-mail
                parametros.Add("IDTITULAR_P", mutuario.idTitular); // Xavier SOL 171546
                parametros.Add("IDTITULAR", mutuario.idTitular); // NILTON - CORRECAO
                parametros.Add("IDSITPART_P", mutuario.idsitpart); // xavier alterar a assinatura da regra conforme e-mail
                parametros.Add("IDPLANOPREV_P", mutuario.plano.id); // xavier alterar a assinatura da regra conforme e-mail
                parametros.Add("IDMUTUARIO_P", mutuario.id);
                parametros.Add("IDPESSOA_P", mutuario.id);//William Moreira da Silva
                parametros.Add("IDCONTRATO_P", null);
                parametros.Add("IDTIPOCONTRATO_P", idTipoContrato);
                parametros.Add("IDPLANO_P", mutuario.plano.id);
                parametros.Add("IDCONTRATOEMPTMO", null); // Willamy Henrique SOL- 239238 PPM 514531
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                parametros.Add("IDPESSJUR_P", mutuario.patrocinadora.id);

                //int? IdCalculo = regra.consultarUltimoIdCalculo();
                parametros.Add("IDCALCULO_P", IdCalculo);
                parametros.Add("USUARIO_P", UsuarioCalc);//contextoSistema.usuarioAtual.nomeCompleto);
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                //William Moreira da Silva - SIG 27879 - Inicio
                parametros.Add("MOECODIGO_P", tipoContrato.moeda.id);
                //William Moreira da Silva - SIG 27879 - Fim

                parametros.Add("INPUTVALORDIVIDA_P", concessao.valordivida);
                parametros.Add("INPUTVALORAMORTIZACAO_P", concessao.valoramortizacao);
                parametros.Add("INPUTVALORQUITACAO_P", concessao.valorquitacao);

                parametros.Add("VALORFINANHAB_P", concessao.valorquitacao + concessao.valoramortizacao);

                parametros.Add("IDPLANOCONTABIL_P", mutuario.plano.IdPlanoOrigem);
                parametros.Add("IDOPERACAO_P", TipoOperacao.concessao.chave);
                parametros.Add("IDTIPOCONTRATOANTERIOR_P", null);
                parametros.Add("IDCONTRATOANTERIOR_P", null);
                parametros.Add("IDTIPOEMPRESTIMO_P", tipoContrato.tipoEmprestimo.id);
                parametros.Add("IDPATROCINADORA_P", mutuario.patrocinadora.id);

                //Flags
                //parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(concessao.excepcional)); // Xavier SOL 178579
                //parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(concessao.grupoExcepcional)); // Xavier SOL 178579 // Felipe A. Santos SOL 208770 PPM 201602 - comentado

                parametros.Add("FINANCIAMENTO_P", Convert.ToInt32(concessao.financiamento));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                parametros.Add("LIQUIDOZERO_P", Convert.ToInt32(concessao.liquidozero));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                //Datas                    
                //parametros.Add("DATAASSINATURA_P", concessao.dataAssinatura); // Felipe A. Santos - SOL 219054 KTN 2058728
                parametros.Add("DATAASSINATURA_P", DateTime.Today);// Felipe A. Santos - SOL 219054 KTN 2058728
                parametros.Add("DATASOLICITACAO_P", concessao.dataSolicitacao); 
                //parametros.Add("DATAREFERENCIA_P", concessao.dataReferencia); // Felipe A. Santos - SOL 219054 KTN 2058728
                parametros.Add("DATAREFERENCIA_P", DateTime.Today); // Felipe A. Santos - SOL 219054 KTN 2058728
                parametros.Add("DATAEVENTO_P", concessao.dataEvento);
                parametros.Add("DATAATUALIZA_P", concessao.dataAtualiza);
                parametros.Add("DATAEFETIVA_P", concessao.dataEfetiva);
                parametros.Add("DATAPREVISTA_P", concessao.dataPrevista);

                //Imput
                parametros.Add("AMORTIZACAOFH_P", concessao.valorAmortizacaoFH);
                parametros.Add("JUROSFH_P", concessao.jurosFH);

                parametros.Add("PARCELAATUAL_P", 0);

                //Valores
                parametros.Add("VALORPRIMEIRAPARCELA_P", null);
                parametros.Add("VALORDEBITO_P", concessao.valorDebito);

                if (!concessao.veioConector) // SOL 230843
                {
                    //William Moreira da Silva - SOL 221362
                    acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                    //gerenciadorRegra.executar(tipoContrato.regraElegibilidade, parametros);
                    //William Moreira da Silva - SOL 221362
                    parametros.Add("FLGINTERNET_P", 0);
                }
                else
                {
                    //Se vinher do conector o FLGINTERNET para a regra de elegibilidade deve ser igual a 1
                    parametros.Add("FLGINTERNET_P", 1);//William Moreira da Silva - SOL 235470 PPM 450255
                }
                //SIG 67808 - Campanha Descontos - Matias
                parametros.Add("TIPOPROPOSTA_P", concessao.CampanhaDescontos ? 3 : 0); // tipo 3 = novação com descontos
                // Excepcional
                // Felipe A. Santos  SOL 208770 Kintana 2016022  - início
                parametros.Add("EXCEPCIONALMARGEM_P", concessao.excepcionalMargem);
                parametros.Add("EXCEPCIONALELEGIBILIDADE_P", concessao.excepcionalElegibilidade);
                parametros.Add("EXCEPCIONALINADIMPLENCIA_P", concessao.excepcionalInadimplencia);
                parametros.Add("EXCEPCIONALOUTROS_P", concessao.excepcionalOutros);
                // Felipe A. Santos  SOL 208770 Kintana 2016022 - fim

                //WO24172 - Ajuste de prazo conforme idade do participante.
                try
                {
                    gerenciadorRegra.executar(tipoContrato.regraElegibilidade, parametros);
                }
                catch (Exception e) when (e.Message.Contains("Olá! O empréstimo solicitado está indisponível.")  && CampanhaDescontos)
                {
                    // Ignora e segue a execução normalmente
                }
                catch
                {
                    throw; // relança qualquer outra exceção
                }

                //Prazo Máximo
                //barraProgresso
                if (!concessao.veioConector) // SOL 230843
                {
                    acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                }
                concessao.prazoMaximo = Convert.ToInt32(gerenciadorRegra.executar(tipoContrato.regraPrazoMaximo, parametros));
                if (concessao.numeroParcelas.HasValue && concessao.numeroParcelas != 0)
                {
                    if(concessao.numeroParcelas > concessao.prazoMaximo)
                    {
                        concessao.numeroParcelas = concessao.prazoMaximo;
                    }
                    parametros.Add("NUMPARCELAS_P", concessao.numeroParcelas);
                }
                else
                {
                    parametros.Add("NUMPARCELAS_P", concessao.prazoMaximo);
                    concessao.numeroParcelas = concessao.prazoMaximo;
                }

                //BarraProgresso
                //Data Crédito
                //acesso.atualizaBarraProgresso(Contexto.obterUsuario(), 3, 0, 0);
                if (!concessao.dataCredito.HasValue)
                {
                    if (!concessao.veioConector) // SOL 230843
                    {
                        acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                    }
                    concessao.dataCredito = Convert.ToDateTime(gerenciadorRegra.executar(tipoContrato.regraDataCredito, parametros));
                }

                //William Moreira da Silva - SOL 204765 KTN 1984008
                string aviso = string.Empty;

                //William Moreira da Silva - SOL 249745
                List<Contrato> listaContratosRetorno;
                if (bCalculaAnteriores)
                {
                    listaContratosRetorno = gerenciadorMutuario.consultarContratosEmAberto(mutuario.id,
                                                                                            mutuario.idTitular,
                                                                                            tipoContrato.tipoEmprestimo.id,
                                                                                            idTipoContrato,
                                                                                            (DateTime)concessao.dataCredito,
                                                                                            concessao.dataSolicitacao,
                                                                                            concessao.excepcional,
                                                                                            out listaMensagens,
                                                                                            contratosSelecionados,
                                                                                            IdCalculo, // Thiago Melo SOL 206149
                                                                                            true,//); //Marcio Sanches Spinosa SOL 211734
                                                                                            tipoContrato.veioConector,// SOL 230843 
                                                                                            idBarraProgresso,
                                                                                            concessao.CampanhaDescontos); //William Moreira da Silva - SOL 247419
                }
                else
                {
                    listaContratosRetorno = ContratosCalculados;
                    //BRUNO AZEVEDO, CASO NÃO CALCULE NOVAMENTE, O SISTEMA APENAS IDENTIFICA OS CONTRATOS MARCADOS PARA QUITAÇÃO
                    for (int i = 0; i < contratosSelecionados.Count; i++)
                    {
                        for (int x = 0; x < listaContratosRetorno.Count; x++)
                        {
                            if (listaContratosRetorno[x].numero == contratosSelecionados[i])
                            {
                                listaContratosRetorno[x].quitar = true;
                            }
                        }
                    }
                }

                //SIG 62003 e 67808 - Matias
                //SIG 82500 - Saulo Cirineu
                if (concessao.liquidozero)
                {
                    //Se o participante não quitar outros contratos não poderá continuar a simulação.
                    if (listaContratosRetorno.Count == 0)
                    {
                        throw new ExcecaoPlanus("Participante não possui contratos para novação. Concessão com líquido zero não disponível.");
                    }
                    //Para contratos que obriguem a concessão por líquido zero deve haver a quitação de outros contratos que não sejam do tipo 13º
                    else if (tipoContrato.flgObrigaLiquidoZero && listaContratosRetorno.Count == 1 && listaContratosRetorno[0].tipo.maximoParcelas == 1)
                    {
                        throw new ExcecaoPlanus("Modalidade não permitida para novação apenas de contrato do tipo 13º.");
                    }

                    foreach (var item in listaContratosRetorno)
                    {
                        ValorUltimaPrestacaoFGQC += acessoMutuario.BuscaUltimaPrestacaoFGQC(item.numero);
                    }
                    concessao.ValorUltimaPrestacaoFGQC = ValorUltimaPrestacaoFGQC;

                }

                if (!concessao.veioConector)
                {
                    regExecutando = this.obterStatusBarraProgresso(idBarraProgresso)[1];
                }
                //William Moreira da Silva - SOL 249745

                List<long> listaObterContratoEmptmo = new List<long>();
                listaObterContratoEmptmo = this.obterContratoEmptmo(mutuario.idTitular, idMutuario, DateTime.Parse(concessao.dataCredito.ToString()));

                //William Moreira da Silva - SOL 251170
                if (!this.verificarQuitacoes(listaObterContratoEmptmo, out aviso))
                {
                    throw new ExcecaoPlanus(aviso);
                }
                //William Moreira da Silva - SOL 251170

                foreach (var idContrato in listaObterContratoEmptmo)
                {
                    long idContratoEmptmo = idContrato;

                    // Se não for excepcionalizar a inadimplência, então verifica se tem itens abertos
                    if (!concessao.excepcional) // Felipe A. Santos SOL 208770 Kintana 2016022
                    {
                        this.existemItensEmAberto(idContratoEmptmo, true, DateTime.Parse(concessao.dataCredito.ToString()), true, Convert.ToInt32(concessao.dataCredito.Value.Year), Convert.ToInt32(concessao.dataCredito.Value.Month), out aviso);
                    }

                    if (!String.IsNullOrEmpty(aviso) && (concessao.veioConector))
                    {
                        throw new ExcecaoPlanus(aviso);
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(aviso))
                        {
                            Mensagens.Remove(aviso);//William Moreira da Silva - SOL 237425 PPM 504553
                            Mensagens.Add(aviso);
                        }

                    }
                }
                //William Moreira da Silva - SOL 204765 KTN 1984008

                parametros.Add("DATACREDITO_P", concessao.dataCredito);

                //Prazos de Concessão
                //barraProgresso
                if (!concessao.veioConector) // SOL 230843
                {
                    acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                }
                gerenciadorRegra.executar(tipoContrato.regraPrazosConcessao, parametros);

                //Salário Base
                //barraProgresso
                if (!concessao.salarioBase.HasValue)
                {
                    if (!concessao.veioConector) // SOL 230843
                    {
                        acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                    }
                    concessao.salarioBase = (double?)gerenciadorRegra.executar(tipoContrato.regraSalarioBase, parametros);
                }

                parametros.Add("SALARIOBASE_P", concessao.salarioBase);

                List<Contrato> listaContratos = new List<Contrato>();
                //Filtra contratos marcados para quitar ou quitação obrigatória
                listaContratos = listaContratosRetorno.FindAll(c => c.quitar == true || c.quitacaoObrigatoria == 1);

                //Se houver ao menos um contrato que a quitação é obrigatória FLGQUITA_P = 1
                if (listaContratosRetorno.FindAll(c => c.quitacaoObrigatoria == 1).Count > 0)
                {
                    parametros.Add("FLGQUITA_P", 1);
                    concessao.contratosEmAberto = true;
                }
                else
                {
                    parametros.Add("FLGQUITA_P", 0);
                    concessao.contratosEmAberto = false;
                }

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 
                //Lista contato à quitar
                if (listaContratos.Count != 0)
                {
                    parametros.Add("SALDOEMPTMOQUITAR_P", this.obtemListaContratosValorAQuitar(listaContratos));
                }
                else
                {
                    parametros.Add("SALDOEMPTMOQUITAR_P", null);
                }
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 


                // Preenche valores com os dados dos contratos em aberto.
                concessao.valorAQuitar = listaContratos.Sum(contrato => contrato.valorAQuitar);
                concessao.valorPoliticaDescontos = listaContratos.Sum(contrato => contrato.valorDesconto);
                //concessao.valorTotalParcelas = listaContratos.Sum(contrato => contrato.valorUltimaParcela); SOL 230843
                concessao.valorEmAberto = listaContratos.Sum(contrato => contrato.valorEmAberto);

                //Total de parcelas em aberto
                //parametros.Add("TOTALPARCELAS_P", concessao.valorTotalParcelas); // SOL 230843

                //Lista contato à quitar
                if (listaContratos.Count != 0)
                {
                    parametros.Add("IDCONTRATOAQUITAR_P", this.obtemListaContratos(listaContratos));
                }
                else
                {
                    parametros.Add("IDCONTRATOAQUITAR_P", null);
                }

                //BRUNO AZEVEDO FIM AQUIAQUI

                //Margem
                // Comentado por Xavier
                //INICIO - NILTON - CORRECAO 08/02/13 --  SOLUCAO PALIATIVA
                //if (concessao.valorMargem == null || concessao.valorMargem == 0d)
                //{                         
                //    concessao.valorMargem = (double?)gerenciadorRegra.executar(tipoContrato.regraMargem, parametros); //NILTON - 30/01/13
                //}
                //else
                //{                
                //    double? valorMargemAnterior = concessao.valorMargem;                                
                //    double? valorMargemAtual = (double?)gerenciadorRegra.executar(tipoContrato.regraMargem, parametros);

                //    if (valorMargemAnterior != valorMargemAtual)
                //        concessao.valorMargem = valorMargemAnterior;                
                //}
                //FINAL - NILTON - CORRECAO 08/02/13
                // Fim do comentario por Xavier


                //Margem 
                //barraProgresso
                //acesso.atualizaBarraProgresso(Contexto.obterUsuario(), 7, 0, 0);
                //William Moreira da Silva - SOL 253185 - Consulta refatorada pelo projeto de segregação da HISTMOVEMPTMo
                //TAES - SIG117302
                if (concessao.CampanhaDescontos == false)
                {
                    if (concessao.evento != "btnCalcular")  // SOL 201223  //SIG 27305 - William Santana - descomentado o if
                    {
                        if (!concessao.veioConector) // SOL 230843
                        {
                            acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                        }
                        concessao.valorMargem = (double?)gerenciadorRegra.executar(tipoContrato.regraMargem, parametros);
                    }
                    else if (concessao.excepcionalOutros == 0 && concessao.valorMargem == null)
                    {
                        concessao.valorMargem = (double?)gerenciadorRegra.executar(tipoContrato.regraMargem, parametros);
                    }
                    //William Moreira da Silva - SOL 253185 - Consulta refatorada pelo projeto de segregação da HISTMOVEMPTMo

                    //barraProgresso
                    if (!concessao.veioConector) // SOL 230843
                    {
                        acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                    }

                    //Campanha Desconto
                    if (concessao.CampanhaDescontos == false && concessao.valorMargem == null)
                    {
                        concessao.valorMargem = (double?)gerenciadorRegra.executar(tipoContrato.regraMargem, parametros);
                    }
                    //Fim - Campanha Desconto

                    if (concessao.valorMargem == null)
                    {
                        throw new ExcecaoPlanus("Valor Margem Consignável não informado");
                    }
                }
                else
                {
                    concessao.valorMargem = 0;
                }
                parametros.Add("VALORMARGEM_P", concessao.valorMargem);

                //Taxa de Juros Concessao
                //barraProgresso
                if (!concessao.veioConector) // SOL 230843
                {
                    acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                }
                concessao.taxaJurosConcessao = (double)gerenciadorRegra.executar(tipoContrato.regraJurosConcessao, parametros); //NILTON - 18/12/12
                parametros.Add("TAXAJUROS_P", concessao.taxaJurosConcessao);


                //William Moreira da Silva - 27879 - INICIO
                if (!concessao.veioConector)
                {
                    acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                }
                if (tipoContrato.regraCorrecaoMonetaria.id == 0 || tipoContrato.regraCorrecaoMonetaria == null)
                {
                    parametros.Add("TAXACORRECAO_P", 0.00);
                }
                else
                {
                    concessao.taxaCorrecao = (double)gerenciadorRegra.executar(tipoContrato.regraCorrecaoMonetaria, parametros);
                    parametros.Add("TAXACORRECAO_P", concessao.taxaCorrecao);
                }
                //William Moreira da Silva - 27879 - FIM

                //Taxa de Juros Exibir
                //NILTON - 20/12/12
                //barraProgresso
                //acesso.atualizaBarraProgresso(Contexto.obterUsuario(), 10, 0, 0);
                if (tipoContrato.regraJurosExibir.id == 0) // Se não existir TAXA DE JUROS EXIBIR deve ser usado TAXA DE JUROS CONCESSAO            
                    concessao.taxaJurosExibir = concessao.taxaJurosConcessao;
                else
                {
                    if (!concessao.veioConector) // SOL 230843
                    {
                        acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                    }
                    concessao.taxaJurosExibir = (double)gerenciadorRegra.executar(tipoContrato.regraJurosExibir, parametros); //NILTON - 18/12/12
                }

                //Reserva
                //barraProgresso
                if (!concessao.veioConector) // SOL 230843
                {
                    acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                }
                concessao.valorReserva = (double)gerenciadorRegra.executar(tipoContrato.regraReservaPoupanca, parametros);

                //Tipo de Contrato
                ParametroSistema parametrosSistema = gerenciadorRegra.consultarParametroSistema();
                if (parametrosSistema.idRegraTipoContrato.HasValue)
                {
                    //barraProgresso
                    if (!concessao.veioConector) // SOL 230843
                    {
                        acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                    }
                    Regra regraTipoContrato = new Regra { id = (int)parametrosSistema.idRegraTipoContrato };
                    gerenciadorRegra.executar(regraTipoContrato, parametros);
                }

                //Data Primeira Parcela
                //barraProgresso
                //acesso.atualizaBarraProgresso(Contexto.obterUsuario(), 13, 0, 0);
                if (!concessao.dataPrimeiraParcela.HasValue)
                {
                    if (tipoContrato.regraPrimeiraParcela.id == 0)
                        concessao.dataPrimeiraParcela = this.calcularPrimeiraParcela(mutuario.patrocinadora.id, mutuario.plano.id, (DateTime)concessao.dataCredito);
                    else
                    {
                        //barraProgresso
                        if (!concessao.veioConector) // SOL 230843
                        {
                            acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                        }
                        concessao.dataPrimeiraParcela = (DateTime)gerenciadorRegra.executar(tipoContrato.regraPrimeiraParcela, parametros);
                    }
                }

                //William Moreira da Silva - SOL 217685 KTN 2047920
                string dtPrimParc = Convert.ToString(String.Format("{0:dd/MM/yyyy}", concessao.dataPrimeiraParcela));
                concessao.dataPrimeiraParcela = DateTime.Parse(dtPrimParc);
                //William Moreira da Silva - SOL 217685 KTN 2047920

                parametros.Add("DATAPRIMEIRAPARCELA_P", concessao.dataPrimeiraParcela);
                parametros.Add("SALDODEVEDOR_P", concessao.valorAQuitar);
                parametros.Add("SALDOANTERIOR_P", concessao.valorAQuitar);
                parametros.Add("VALORDESCONTO_P", concessao.valorPoliticaDescontos);
                parametros.Add("VALORPERMITIDO_P", concessao.valorMaximo);
                parametros.Add("VALORMAXIMO_P", concessao.valorMaximo);

                //Meses suspensão
                if (concessao.mesesSuspensao.HasValue)
                {
                    parametros.Add("QTDMESES_P", concessao.mesesSuspensao);
                }
                else
                {
                    parametros.Add("QTDMESES_P", 0);
                }


                //Valor solicitado
                /*bool valorSolicitadoNaoSelecionado = false;

                if (concessao.evento != "btnCalcular")
                {
                    if (!concessao.valorSolicitado.HasValue)
                    {
                        concessao.valorSolicitado = 0d;
                        valorSolicitadoNaoSelecionado = true;
                    }

                }
                // Thiago Melo SOL 204910 
                else if (concessao.evento == "btnCalcular" && concessao.valorSolicitado == 0d)
                {
                    if (concessao.valorSolicitado.HasValue)
                    {
                        concessao.valorSolicitado = 0d;
                        valorSolicitadoNaoSelecionado = true;
                    }
                }*/
                // Thiago Melo SOL 204910 


                /* Felipe Comentado SOL 225172 KTN 2058946 
                if (concessao.valorSolicitado == 0d && concessao.valorEmAberto > 0d)
                {
                    concessao.valorSolicitado = concessao.valorEmAberto;
                }

                parametros.Add("VALORSOLICITADO_P", concessao.valorSolicitado);
                Felipe SOL 225172 KTN 2058946 */

                //Executa regra valor máximo permitido
                string mensagem = string.Empty;
                //barraProgresso
                if (!concessao.veioConector) // SOL 230843
                {
                    acesso.atualizaBarraProgresso(UsuarioCalc, regExecutando++, 0, 0);
                }
                concessao.valorMaximo = (double)gerenciadorRegra.executarRetorno(tipoContrato.regraValorMaximo, parametros, ref mensagem);

                if (!concessao.valorSolicitado.HasValue)
                {
                    concessao.valorSolicitado = concessao.valorMaximo;
                }

                    //if (valorSolicitadoNaoSelecionado || concessao.valorSolicitado == 0d)//NILTON - CORRECAO - 05/02/13.
                    /*if (concessao.evento != "btnCalcular") // SOL 201223
                    {
                        //if (concessao.valorSolicitado == 0d) // Thiago Melo SOL 205979 Kintana 1991779
                        //if (concessao.valorSolicitado == 0d || Convert.ToInt32(concessao.liquidozero) == 0)//William Moreira da Silva - SOL 237420 PPM 485696
                        if (concessao.valorSolicitado == 0d || Convert.ToInt32(concessao.liquidozero) == 0 && !concessao.veioConector)//William Moreira da Silva - SOL 239295 PPM 516313
                        {
                            concessao.valorSolicitado = concessao.valorMaximo;
                        }
                    }
                    // Thiago Melo SOL 204910 
                    else if (concessao.evento == "btnCalcular")
                    {
                        if (valorSolicitadoNaoSelecionado && concessao.valorSolicitado == 0d)
                        {
                            concessao.valorSolicitado = concessao.valorMaximo;
                        }
                    }
                    // Thiago Melo SOL 204910 

                    // Felipe A. Santos SOL 225172 KTN 2058946 - inicio
                    if (concessao.valorSolicitado == 0d && concessao.valorEmAberto > 0d)
                    {
                        concessao.valorSolicitado = concessao.valorEmAberto;
                    }*/

                parametros.Add("VALORSOLICITADO_P", concessao.valorSolicitado);
                // Felipe A. Santos SOL 225172 KTN 2058946 - fim

                parametros["VALORSOLICITADO_P"] = concessao.valorSolicitado;
                parametros["VALORMAXIMO_P"] = concessao.valorMaximo;
                parametros["CARENCIA_P"] = 12;
                //Itens de concessão
                itensConcessao = gerenciadorTipoContrato.obterItens(tipoContrato, TipoEvento.concessao);

                //Itens de Parcela
                itensConcessao.AddRange(gerenciadorTipoContrato.obterItens(tipoContrato, TipoEvento.prestacao).FindAll(t => t.centraliza == 1));
                //itensConcessao.AddRange(gerenciadorTipoContrato.obterItens(tipoContrato, TipoEvento.prestacao));


                //Calcula Itens            
                //itensConcessao = gerenciadorTipoContrato.calcularItens(itensConcessao, parametros);
                itensConcessao = gerenciadorTipoContrato.calcularItensConcessao(itensConcessao, idBarraProgresso, parametros);//William Moreira da Silva - SOL 247419

                //Valor Solicitado
                concessao.valorSolicitado = itensConcessao[0].valor;

                //Valor Líquido Geral
                concessao.valorLiquido = itensConcessao.Where(t1 => t1.centraliza == 1 && t1.tipoEvento.chave == TipoEvento.concessao.chave).Sum(t1 => t1.valor);

                //Valor da Prestação
                concessao.valorPrestacao = itensConcessao.Where(t1 => t1.centraliza == 1 && t1.tipoEvento.chave == TipoEvento.prestacao.chave).Sum(t1 => t1.valor);
                
                /*
                // INICIO - NILTON - CORRECAO - 08/02/13
                for (int i = 0; i < itensConcessao.Count; i++)
                {
                    if (concessao.liquidozero && itensConcessao[i].descricao == "Valor Solicitado")
                    {
                        concessao.valorSolicitado = itensConcessao[i].valor;
                    }

                    //William Moreira da Silva - SOL 235732 
                    //O controle do valor deve vir das REGRAS! -- Saulo Cirineu
                    if (itensConcessao[i].id == 70) //Financiamento - Quitação
                    {
                        itensConcessao[i].valor = concessao.valorquitacao;
                        if (!concessao.liquidozero)
                        {
                            concessao.valorLiquido = concessao.valorLiquido - itensConcessao[i].valor;//Caso haja quitação habitacional, retirar esse valor do valor liquido
                            for (int j = 0; j < itensConcessao.Count; j++)
                            {
                                if (itensConcessao[j].id == 6)
                                {
                                    itensConcessao[j].valor = itensConcessao[j].valor - itensConcessao[i].valor;//Caso haja quitação habitacional, retirar esse valor do valor liquido
                                }
                            }
                        }

                        if (concessao.liquidozero && (listaContratosRetorno == null || listaContratosRetorno.Count == 0))
                        {
                            itensConcessao[i].valor = 0;
                        }
                    }

                    if (itensConcessao[i].id == 69) //Financiamento - Amortização
                    {
                        itensConcessao[i].valor = concessao.valoramortizacao;
                        if (!concessao.liquidozero)
                        {
                            concessao.valorLiquido = concessao.valorLiquido - itensConcessao[i].valor;//Caso haja quitação habitacional, retirar esse valor do valor liquido
                            for (int j = 0; j < itensConcessao.Count; j++)
                            {
                                if (itensConcessao[j].id == 6)
                                {
                                    itensConcessao[j].valor = itensConcessao[j].valor - itensConcessao[i].valor;//Caso haja quitação habitacional, retirar esse valor do valor liquido
                                }
                            }
                        }

                        if (concessao.liquidozero && (listaContratosRetorno == null || listaContratosRetorno.Count == 0))
                        {
                            itensConcessao[i].valor = 0;
                        }
                    }
                    //William Moreira da Silva - SOL 235732
                }
                // INICIO - NILTON - CORRECAO - 08/02/13
                */

                // Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 - início
                //William Moreira da Silva - SIG 24060
                parametros["SALDODEVEDOR_P"] = concessao.valorSolicitado;
                //William Moreira da Silva - SIG 24060
                tipoContrato.regraFGQCbase = new Regra()
                {
                    id = gerenciadorTipoContrato.consultarRegraFGQC(tipoContrato, TipoEvento.prestacao)
                };

                #region SIG 20023 - Eliamar Tani
                //Não existe regra para Credinâmico 13º.
                //Retornará 0 por não existir regra.
                //Calcular somente quando for Credinâmico Fixo ou Variável
                if (tipoContrato.regraFGQCbase.id > 0)
                {
                    concessao.FGQCbase = (double)gerenciadorRegra.executar(tipoContrato.regraFGQCbase, parametros);
                }
                #endregion
                // Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 - fim

                //Valor Descontos                
                
                concessao.valorDescontos = Math.Round(itensConcessao.Where(t1 => t1.centraliza == 0 && t1.id != 158).Sum(t1 => t1.valor * (t1.pagarReceber == "P" ? 1 : -1)) - concessao.valorAQuitar - (double)concessao.valorSolicitado, 2);


                //SIG 128871 - Aplicação de desconto sobre o SGQC, se estivar na vigência..........................
                tipoContrato.regraDescFGQCbase = new Regra()
                {
                    id = gerenciadorTipoContrato.consultarRegraDescFGQC(tipoContrato, TipoEvento.prestacao)
                };
              
                if (tipoContrato.regraDescFGQCbase.id > 0)
                {
                    concessao.DescFGQCbase = (double)gerenciadorRegra.executar(tipoContrato.regraDescFGQCbase, parametros);
                }
                //SIG 128871 - Fim..................................................................................

                listaMensagens = Mensagens;

                return listaContratosRetorno;
            }
            catch (Exception e)
            {
                //William Moreira da Silva - SOL 252533
                if (e.Message.Contains("ORA-12520"))
                {
                    throw new ExcecaoPlanus("Servidor ocupado, tente novamente em alguns minutos.");
                }
                else
                {
                    throw new ExcecaoPlanus(e.Message);
                }
                //William Moreira da Silva - SOL 252533
            }
        }

        private string obtemListaContratos(List<Contrato> listaContratos)
        {
            StringBuilder contratos = new StringBuilder();

            listaContratos.OrderByDescending(c => c.numero).ToList<Contrato>().ForEach(c => contratos.Append(c.numero).Append(","));

            return contratos.ToString().TrimEnd(',', ' ');

        }

        //BRUNO AZEVEDO
        private string obtemListaContratosValorAQuitar(List<Contrato> listaContratos)
        {
            StringBuilder contratos = new StringBuilder();

            listaContratos.OrderByDescending(c => c.numero).ToList<Contrato>().ForEach(c => contratos.Append(c.valorAQuitar).Append(";"));

            return contratos.ToString().TrimEnd(';', ' ');
        }
        //BRUNO AZEVEDO

        /// <summary>
        /// Verifica se os contratos em aberto possuem atualização diária
        /// </summary>
        private bool verificarAtualizaoDiaria(List<Contrato> listaContratos, DateTime dataReferencia, out string aviso)
        {
            int contador = 0;

            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();

            StringBuilder numerosContratos = new StringBuilder(100);

            for (int i = 0; i < listaContratos.Count; i++)
            {
                //if (!gerenciadorContrato.verificarAtualizacaoDiaria(listaContratos[i].numero, dataReferencia)) // Felipe A. Santos SOL 223708 KINTANA 2061209
                //Wylliam Leite da Silva - SOL: 255960 PPM: 843375 - Adicionada a verificação da situação de contrato, só vamos verificar a atualização diária para contratos que não sejam "E" de encerrados
                if ((!gerenciadorContrato.verificarAtualizacaoDiaria(listaContratos[i].numero, dataReferencia) && listaContratos[i].valorAQuitar > 0) && (!gerenciadorContrato.verificaSituacaoContrato(listaContratos[i].numero).Equals("E")))// Felipe A. Santos SOL 223708 KINTANA 2061209
                {
                    numerosContratos.Append(listaContratos[i].numero.ToString());
                    numerosContratos.Append(",");
                    contador++;
                }
            }

            if (contador > 0)
            {
                if (contador == 1)
                    aviso = string.Format("O contrato {0} não possui atualização diária para data de crédito {1}.", numerosContratos.ToString().TrimEnd(','), dataReferencia.ToString("dd/MM/yyyy"));
                else
                    aviso = string.Format("Os contratos {0} não possuem atualizações diária para data de crédito {1}.", numerosContratos.ToString().TrimEnd(','), dataReferencia.ToString("dd/MM/yyyy"));

                return false;
            }
            else
            {
                aviso = string.Empty;
                return true;
            }

        }

        /// <summary>
        /// Verifica se os contratos em aberto não possuem quitação lançada
        /// </summary>
        public bool verificarQuitacoes(List<Contrato> listaContratos, out string aviso)
        {
            int contador = 0;

            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();

            StringBuilder numerosContratos = new StringBuilder(100);

            for (int i = 0; i < listaContratos.Count; i++)
            {
                if (gerenciadorQuitacao.verificarQuitacaoLancada(listaContratos[i].numero))
                {
                    numerosContratos.Append(listaContratos[i].numero.ToString());
                    numerosContratos.Append(",");
                    contador++;
                }
            }

            if (contador > 0)
            {
                if (contador == 1)
                    aviso = string.Format("O contrato {0} está em quitação.", numerosContratos.ToString().TrimEnd(','));
                else
                    aviso = string.Format("Os contratos {0} estão em quitação.", numerosContratos.ToString().TrimEnd(','));

                return false;
            }
            else
            {
                aviso = string.Empty;
                return true;
            }

        }

        //William Moreira da Silva - SOL 251170
        /// <summary>
        /// Verifica se os contratos em aberto não possuem quitação lançada
        /// </summary>
        public bool verificarQuitacoes(List<long> listaContratos, out string aviso)
        {
            int contador = 0;

            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();

            StringBuilder numerosContratos = new StringBuilder(100);

            for (int i = 0; i < listaContratos.Count; i++)
            {
                if (gerenciadorQuitacao.verificarQuitacaoLancada(listaContratos[i]))
                {
                    numerosContratos.Append(listaContratos[i].ToString());
                    numerosContratos.Append(",");
                    contador++;
                }
            }

            if (contador > 0)
            {
                if (contador == 1)
                    aviso = string.Format("O contrato {0} está em quitação.", numerosContratos.ToString().TrimEnd(','));
                else
                    aviso = string.Format("Os contratos {0} estão em quitação.", numerosContratos.ToString().TrimEnd(','));

                return false;
            }
            else
            {
                aviso = string.Empty;
                return true;
            }

        }

        #endregion

        #region Verificações

        /// SIG 57675 - Início
        /// <summary>
        /// Verifica se existe outras Concessões.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa para filtro.</param>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <param name="dtPrimeiraParcela">Data da primeira parcela do empréstimo.</param>
        /// <returns>Se existe concessão de 13º salário para o participante não quitado.</returns>
        public bool verificarConcessao13(int idPessoa, int idMutuario, DateTime? dtPrimeiraParcela)
        {
            using (TransactionScope transacao = new TransactionScope())
            {
                bool retorno_verificarConcessao13 = acesso.verificarConcessao13(idPessoa, idMutuario, dtPrimeiraParcela);
                transacao.Complete();

                return retorno_verificarConcessao13;
            }
        }
        /// SIG 57675 - Fim

        /// <summary>
        /// Verifica se existe outras Concessões.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <param name="dataReferencia">Data de refêrencia para filtro.</param>
        /// <param name="idTipocontrato">Identificação do tipo do contrato para filtro.</param>
        /// <returns>Se existe Concessões associadas.</returns>
        public bool verificarConcessaoExistente(int idMutuario, DateTime dataReferencia, int idTipoContrato, out string aviso)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                aviso = String.Empty;

                //Busca primeiro por tipo de contrato
                bool existeConcessao = this.verificarConcessaoExistente(idMutuario, dataReferencia, idTipoContrato);

                //Se existir
                if (existeConcessao)
                    throw new ExcecaoPlanus("Já existe outro Contrato concedido para essa data ou posterior!");

                return this.verificarConcessaoExistente(idMutuario, dataReferencia, null);

            }
        }

        //Jessica Y. Oshiro - SOL 235314
        /// <summary>
        /// Verifica se data credito é dia util.
        /// </summary>
        /// <param name="dataCredito">Data credito como parametro</param>
        /// <returns>Se data credito é dia util.</returns> 
        public bool verificaDataUtil(DateTime dataUtil)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                //Busca primeiro por tipo de contrato
                bool existeDataUtil = acesso.verificaDataUtil(dataUtil);
                return existeDataUtil;
            }
        }

        private bool verificarConcessaoExistente(int idMutuario, DateTime dataReferencia, int? idTipoContrato)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {

                bool existeConcessao = acesso.verificarConcessaoExistente(idMutuario, dataReferencia, idTipoContrato);

                transacao.Complete();

                return existeConcessao;
            }

        }

        //WILLIAM MOREIRA DA SILVA barraProgresso
        /// <summary>
        /// Retorna o status atual da barraProgresso
        /// </summary>
        /// <param name="usuario">Usúario que esta relizando o processo</param>
        /// <returns>Retorna a quantidade de regras e itens, a serem executado e já executados</returns>
        public List<int> obterStatusBarraProgresso()
        {
            return acesso.obterStatusBarraProgresso(Contexto.obterUsuario(), idBarraProgresso);
        }

        //William Moreira da Silva - SOL 247419
        public List<int> obterStatusBarraProgresso(int? idBarraProgresso)
        {
            return acesso.obterStatusBarraProgresso(Contexto.obterUsuario(), idBarraProgresso);
        }

        //William Moreira da Silva - SOL 247419
        public void atualizaBarraProgresso(string usuario, int regras, int quantItens, int itens, int? idBarra)
        {
            acesso.atualizaBarraProgresso(idBarra, usuario, regras, quantItens, itens);
        }

        /// <summary>
        /// Atualiza a tabela que controla a barra de progresso
        /// </summary>
        /// <param name="usuario">Usúario que esta fazendo o processo</param>
        /// <param name="regras">Quantidade de regras já calculadas</param>
        /// <param name="quantItens">Quantidade de itens no total</param>
        /// <param name="itens">Quantidade de itens já calculados</param>
        public void atualizaBarraProgresso(string usuario, int regras, int quantItens, int itens)
        {
            acesso.atualizaBarraProgresso(idBarraProgresso, usuario, regras, quantItens, itens);
        }

        /// <summary>
        /// Obtem a quantidade de regras que serão executadas
        /// </summary>
        /// <param name="concessao"></param>
        /// <param name="tipoContrato"></param>
        /// <returns>Retorna a quantidade de regras que serão executadas</returns>
        public int obtemQuantRegras(Concessao concessao, TipoContrato tipoContrato)
        {
            int i = 0;

            if (!concessao.dataCredito.HasValue) i++;
            if (!concessao.salarioBase.HasValue) i++;
            if (concessao.evento != "btnCalcular") i++;
            if (tipoContrato.regraJurosExibir.id != 0) i++;
            if (!concessao.dataPrimeiraParcela.HasValue && tipoContrato.regraPrimeiraParcela.id != 0) i++;

            return i;
        }
        //WILLIAM MOREIRA DA SILVA barraProgresso

        public List<Contrato> BuscarContratosAbertos(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            List<Contrato> listaContratosRetorno = gerenciadorMutuario.consultarContratosEmAberto(idMutuario,
                                                                        idTitular,
                                                                        idTipoEmprestimo,
                                                                        idTipoContrato,
                                                                        dataCredito);
            return listaContratosRetorno;
        }

        public bool VerificaExistenciaContratoInadimplente(double IdPessa)
        {
            bool retorno = false;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                retorno = acesso.VerificaExistenciaContratoInadimplente(IdPessa);

                transacao.Complete();

            }
            return retorno;
        }

        //Campanha Desconto
        public DateTime BuscarDataCredito(long idPessoa, long idTitular, int idPlano, int idPatrocinadora)
        {
            DateTime retorno = DateTime.MinValue.Date;
            //using (TransactionScope transacao = new TransactionScope())
            //{
            retorno = acesso.BuscarDataCredito(idPessoa, idTitular, idPlano, idPatrocinadora);

            //    transacao.Complete();

            //}
            return retorno;
        }

        public DescontoInadimplencia BuscaInadimplenciaDesconto(long NumeroContrato, long IdPessoa, DateTime DataCalculo, int TipoProposta, double saldoDevedor, List<ItemDescontoContrato> descontoQuitacao, long IdCalculo = 0)
        {
            DescontoInadimplencia retorno = new DescontoInadimplencia();
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                retorno = acesso.BuscaInadimplenciaDesconto(NumeroContrato, IdPessoa, DataCalculo, TipoProposta, saldoDevedor, descontoQuitacao, IdCalculo);
                transacao.Complete();
            }
            return retorno;
        }

        //SIG 48294
        public void CancelarConcessaoEmprestimo(Contrato Contrato, string ProtocoloCRM, string UsuarioLogado)
        {
            Dictionary<string, long> ContratosRenegociados = new Dictionary<string, long>();
            string AcaoCancelamento = string.Empty;
            //Situacao para cancelamento de contrato              
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();            

            //Obtenado assinatura contrato padrão
            Assinatura assinatura = gerenciadorMutuario.ObterAssinaturaContrato(Contrato.mutuario.id, Contrato.mutuario.idTitular, Contrato.idTipoContratoEmpto);                  

            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            try
            {
                using (TransactionScope transacao = new TransactionScope())
                {
                    //Alterando situação do contrato           
                    AcaoCancelamento = "Cancelamento de Concessão.";
                    gerenciadorContrato.CancelarContrato(Contrato.numero, ProtocoloCRM);
                    //log
                    IncluirLogCancelamentoConcessao(Contrato.numero, AcaoCancelamento);

                    //Busca os contratos quitados na novação
                    AcaoCancelamento = "Busca contratos quitados.";
                    List<Contrato> contratosQuitados = gerenciadorContrato.consultarContratosQuitados(Contrato.numero);

                    foreach (var item in contratosQuitados)
                    {
                        //Estorna atualização diária dos contratos quitados
                        //gerenciadorContrato.EstornarAtualizacaoSaldo(item.numero, UsuarioLogado); //TAES - SIG93932

                        //Atualiza situação contrato na Histmoveemptmo
                        //gerenciadorContrato.DesfazerQuitacaoContrato(item.numero);

                        //Estorna a quitação dos contratos na Hmequitacao
                        AcaoCancelamento = $"Desmarca TODOS ({contratosQuitados.Count}) itens quitados.";
                        gerenciadorContrato.EstornarQuitacaoContratos(item.numero, UsuarioLogado);

                        //log
                        IncluirLogCancelamentoConcessao(item.numero, AcaoCancelamento);

                        if (gerenciadorContrato.VerificarRenegociacaoInadP3(item.numero))
                        {
                            ContratosRenegociados.Add("contrato-" + item.numero.ToString(), item.numero);
                        }
                    }

                    if (contratosQuitados.Count > 0)
                    {
                        //Reativa os contratos quitados na novação
                        AcaoCancelamento = $"Ativar contratos quitados {Contrato.numero}.";
                        gerenciadorContrato.ReativarContratosQuitados(Contrato.numero);
                    }

                    //Estorna atualização diária do contrato
                    AcaoCancelamento = $"Estorna atualização de saldo do contrato {Contrato.numero}.";
                    gerenciadorContrato.EstornarAtualizacaoSaldo(Contrato.numero, UsuarioLogado);

                    //Alterando inscrição do contrato
                    AcaoCancelamento = $"Cancela inscrição número {Contrato.inscricaoEmprestimo.id}.";
                    gerenciadorContrato.CancelarInscricao(Contrato.inscricaoEmprestimo.id);

                    //Inclui log opção ?? 
                    //gerenciadorContrato.IncluirLogOpcao(Contrato.numero, UsuarioLogado);

                    //Estornar concessão de empréstimo na Hmeconcessao
                    AcaoCancelamento = "Cancelamento de concessão.";
                    gerenciadorContrato.CancelarConcessao(Contrato.numero, UsuarioLogado);

                    //log
                    IncluirLogCancelamentoConcessao(Contrato.numero, AcaoCancelamento);

                    //WO3200 - Cancelando o bloqueio e excluindo o evento de cobrança dos contratos quitados  
                    foreach (KeyValuePair<string, long> entry in ContratosRenegociados)
                    {
                        AcaoCancelamento = "Cancelando suspensão de contrato após Cancelamento de concessão.";
                        gerenciadorContrato.CancelarBloqueioConcessao(Contrato.mutuario.id, UsuarioLogado, true);
                        IncluirLogCancelamentoSuspensao(entry.Value, AcaoCancelamento);

                        AcaoCancelamento = "Excluindo evento de cobrança após Cancelamento de concessão.";
                        gerenciadorContrato.ExcluirEventoCobranca(entry.Value, 32);
                        IncluirLogExclusaoEventosCobranca(entry.Value, AcaoCancelamento);
                    }

                    //WO3200 - Excluindo o evento de cobrança
                    AcaoCancelamento = "Excluindo evento de cobrança após Cancelamento de concessão.";
                    gerenciadorContrato.ExcluirEventoCobranca(Contrato.numero, 32);           
                    IncluirLogExclusaoEventosCobranca(Contrato.numero, AcaoCancelamento);

                    AcaoCancelamento = "Cancelando suspensão de contrato após Cancelamento de concessão.";
                    gerenciadorContrato.CancelarBloqueioConcessao(Contrato.mutuario.id, UsuarioLogado, true);
                    IncluirLogCancelamentoSuspensao(Contrato.numero, AcaoCancelamento);


                    transacao.Complete();
                }
            }
            catch (Exception ex)
            {
                
                throw new Exception (AcaoCancelamento + " | " + ex.Message);
            }
            
        }
        public void IncluirLogCancelamentoConcessao(long NumeroContrato, string DescricaoLog)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            LogContrato logContrato = new LogContrato();

            logContrato.modulo = 15;
            logContrato.numeroContrato = NumeroContrato;
            logContrato.origem = Origem.cancelamentoConcessao;
            logContrato.descricao = DescricaoLog;
            gerenciadorContrato.incluirLog(logContrato);
        }

        //WO3200 - incluído método
        public void IncluirLogCancelamentoSuspensao(long NumeroContrato, string DescricaoLog)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            LogContrato logContrato = new LogContrato();

            logContrato.modulo = 15;
            logContrato.numeroContrato = NumeroContrato;
            logContrato.origem = Origem.cancelamentoConcessao;
            logContrato.descricao = DescricaoLog;
            gerenciadorContrato.incluirLog(logContrato);
        }

        public void IncluirLogExclusaoEventosCobranca(long NumeroContrato, string DescricaoLog)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            LogContrato logContrato = new LogContrato();

            logContrato.modulo = 15;
            logContrato.numeroContrato = NumeroContrato;
            logContrato.origem = Origem.cancelamentoConcessao;
            logContrato.descricao = DescricaoLog;
            gerenciadorContrato.incluirLog(logContrato);
        }

        #endregion
    }
}