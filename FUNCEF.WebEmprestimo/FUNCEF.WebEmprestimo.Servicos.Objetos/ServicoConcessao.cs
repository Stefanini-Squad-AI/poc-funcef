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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF;
using FUNCEF.Planus.Componentes.ServicoWeb;
using FUNCEF.Planus.WebEmprestimo.Negocio;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Collections;

namespace FUNCEF.Planus.WebEmprestimo.Servicos.Objetos
{
    /// <summary>
    /// Serviço de manutenção de estado do sistema.
    /// </summary>
    [ExceptionShielding("Politica Sistema")]
    [InspecaoRequisicao()]
    public class ServicoConcessao : ServicoBase, IServicoConcessao
    {

        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - início
        public int obterEventoJudicial()
        {
            GerenciadorConcessao gerenciador = new GerenciadorConcessao();
            return gerenciador.obterEventoJudicial();
        }
        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - fim

        /// <summary>
        /// Calcula a data da primeira parcela.
        /// </summary>
        /// <param name="idPatrocinadora">Identificação da Patrocinadora para filtro.</param>
        /// <param name="idPlanoPrevidenciario">Identificação do Plano Previdenciario para filtro.</param>
        /// <returns>Data da Cobrança.</returns>
        public DateTime calcularPrimeiraParcela(int idPatrocinadora, int idPlanoPrevidenciario, DateTime dataCredito)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.calcularPrimeiraParcela(idPatrocinadora, idPlanoPrevidenciario, dataCredito);
        }

        /// <summary>
        /// Verifica se o mutuário tem uma assinatura.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <param name="idTipoContrato">Identificador do tipo de contraro para filtro.</param>
        /// <returns>Validade da assinatura.</returns>

        // Thiago Melo SOL 204452 KTN 1976411
        public bool verificarAssinatura(int idTitular, int idMutuario, int idTipoContrato, int? flgtrataassinat, out List<string> listaAvisos)
        {
            GerenciadorMutuario gerenciadorMuturio = new GerenciadorMutuario();
            return gerenciadorMuturio.verificarAssinatura(idTitular, idMutuario, idTipoContrato, flgtrataassinat, out listaAvisos);
        }
        // Thiago Melo SOL 204452 KTN 1976411 INI (Adicionado parametro flgtrataassinat)

        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        public bool consultarOutrasDividas(int idMutuario, out string aviso)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarOutrasDividas(idMutuario, out aviso);
        }

        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        public List<OutrasDividas> obterOutrasDividas(int idMutuario)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterOutrasDividas(idMutuario);
        }

        // SOL 199759

        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui Avalistas.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Identificador da inscricao emprestimo para filtro.</param>
        /// <returns></returns>
        public List<Avalistas> obterAvalistas(long idInscricaoEmptmo)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterAvalistas(idInscricaoEmptmo);
        }
        // SOL 199759

        /// <summary>
        /// Verifica se existe outras Concessões.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <param name="dataReferencia">Data de refêrencia para filtro.</param>
        /// <param name="idTipocontrato">Identificação do tipo do contrato para filtro.</param>
        /// <returns>Se existe Concessões associadas.</returns>
        public bool verificarConcessaoExistente(int idMutuario, DateTime dataReferencia, int idTipoContrato, out string aviso)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.verificarConcessaoExistente(idMutuario, dataReferencia, idTipoContrato, out aviso);
        }

        //Jessica Y. Oshiro - SOL 235314
        /// <summary>
        /// Verifica se data credito é dia util.
        /// </summary>
        /// <param name="dataCredito">Data credito como parametro</param>
        /// <returns>Se data credito é dia util.</returns>        
        public bool verificaDataUtil(DateTime dataUtil)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.verificaDataUtil(dataUtil);
        }


        /// <summary>
        /// Verficia se existe suspensão associada ao mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário a ser filtrada.</param>
        /// <param name="dataReferencia">Data de referência da suspensão a ser filtrada.</param>
        /// <param name="veioConector">Para para indentificar se a requisição vem do conetor ou do webemprestimo</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Suspensao"/> com os dados encontrados.</returns>
        //William Moreira da Silva - SOL 224562 KTN 2059616 - Inclusão do parametro veioConector
        public Suspensao consultarSuspensao(int idMutuario, int idTipoContratoEmpto, DateTime dataReferencia, bool veioConector, out string aviso)//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.consultarSuspensao(idMutuario, idTipoContratoEmpto, dataReferencia, veioConector, out aviso);//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567
        }

        // Thiago Melo SOL 202311 KINTANA 1956671        
        public void consultarContratosAnteriores(int idpessoa, int idMutuario, DateTime hmeData, int idTipoEmprestimo, int quitavel, int idTipoContrato, bool flgExcepcional, out string aviso, string contratosSelecionados = null)
        {
            GerenciadorConcessao consultarContratosAnteriores = new GerenciadorConcessao();
            consultarContratosAnteriores.consultarContratosAnteriores(idpessoa, idMutuario, hmeData, idTipoEmprestimo, quitavel, idTipoContrato, flgExcepcional, out aviso, contratosSelecionados);
        }
        // Thiago Melo SOL 202311 KINTANA 1956671   

        //William Moreira da Silva - SOL 204765 KTN 1984008 agora faz-se a verificação na camada de gerenciamento
        //MARCIO SANCHES SPINOSA - SOL 204760       
        public List<long> obterContratoEmptmo(int idMutuario, int idBeneficiario, DateTime dataCredito)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.obterContratoEmptmo(idMutuario, idBeneficiario, dataCredito);
        }

        public double existemItensEmAberto(long idcontratoemptmo, bool usaData, DateTime dataCredito, bool usaMes, int ano, int mes, out string aviso)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.existemItensEmAberto(idcontratoemptmo, usaData, dataCredito, usaMes, ano, mes, out aviso);
        }
        //MARCIO SANCHES SPINOSA - SOL 204760
        //William Moreira da Silva - SOL 204765 KTN 1984008 agora faz-se a verificação na camada de gerenciamento

        //SIG 63057
        //William Moreira da Silva - SOL 143476/16437 - incluido o paramentro do relatorio
        public long gravar(Contrato contrato, List<Historico> itensHistorico, List<ItemContrato> itensContrato, List<Contrato> contratosAQuitar, RelatorioContrato relatorio, string ContratoHTML)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.gravar(contrato, itensHistorico, itensContrato, contratosAQuitar, relatorio, ContratoHTML);
        }
        //BRUNO AZEVEDO SOL213592_KTN2040335
        public List<Contrato> calcular(int idMutuario, int idTipoContrato, string matricula, ref Concessao concessao, ref List<ItemContrato> itensConcessao, List<long> contratosSelecionados, out List<string> listaMensagens, bool bCalculaAnteriores, List<Contrato> ContratosCalculados, int? idBarra, bool CampanhaInadimplencia = false) // Thiago Melo SOL 206149
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();                                                                                   //BRUNO AZEVEDO SOL213592_KTN2040335
            return gerenciadorConcessao.calcular(idMutuario, idTipoContrato, matricula, ref concessao, ref itensConcessao, contratosSelecionados, out listaMensagens, bCalculaAnteriores, ContratosCalculados, idBarra, CampanhaInadimplencia); // Thiago Melo SOL 206149
        }

        //SIG 57675 - Marcelo Valério Ferreira
        public bool verificarConcessao13(int idPessoa, int idMutuario, DateTime? dtPrimeiraParcela)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.verificarConcessao13(idPessoa, idMutuario, dtPrimeiraParcela);
        }

        //William Moreira da Silva - SOL 247419
        public int? consultarUltimoIdTabela(string tabela)
        {
            GerenciadorConcessao gerenciador = new GerenciadorConcessao();
            return gerenciador.consultarUltimoIdTabela(tabela);
        }


        // xavier SOL 178579
        /// <summary>
        /// listar Grupo Excepcional 
        /// </summary>
        public List<Grupoexcepcional> listarGrupoExcepcional()
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.listarGrupoExcepcional();
        }

        /// <summary>
        /// Inclui Grupo Excepcional e Contratoemptmo na CONTRATOEMPTMOXEXCEPCIONAL
        /// </summary>
        public void incluirContratoEmptmoXExcepcional(Int64 idContrato, int idGrupoExcepcional)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.incluirContratoEmptmoXExcepcional(idContrato, idGrupoExcepcional);
        }
        // xavier SOL 178579


        /// <summary>
        /// Inclui idContrato e idPessoa na suspconcessao
        /// </summary>
        public void incluirContratoEmptmoSuspconcessao(Int64 idContrato, int idPessoa, string Observacao, int IdTipoSuspensao, int QtdMesesSuspensao, string ModalidadesBloqueio)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.incluirContratoEmptmoSuspconcessao(idContrato, idPessoa, Observacao, IdTipoSuspensao, QtdMesesSuspensao, ModalidadesBloqueio);
        }
        //Sadi SOL213592_Kintana2040335 




        //Nilton 
        public TipoContrato ConsultarTipoContrato(int idTipoContrato)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            TipoContrato tipoContrato = gerenciadorTipoContrato.consultar(idTipoContrato, false);
            return tipoContrato;
        }

        //WILLIAM MOREIRA DA SILVA barraProgresso
        /// <summary>
        /// Obtem a quantidade de regras já realizadas na barraProgresso
        /// </summary>
        /// <returns>Retorna uma lista contendo a quantidade de regras total, quantas faltam e assim como os itens</returns>
        public List<int> obterStatusBarraProgresso(int? idBarraProgresso)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.obterStatusBarraProgresso(idBarraProgresso);
        }
        //WILLIAM MOREIRA DA SILVA barraProgresso

        /// <summary>
        /// Incluir endereço da pessoa
        /// </summary>
        public Int32 IncluirEndereco(Endereco endPessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.IncluirEndereco(endPessoa);
        }


        /// <summary>
        /// Incluir documento da pessoa
        /// </summary>
        public void incluirDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.incluirDocPessoa(documentoPessoa, idPessoa);

        }

        /// <summary>
        /// alterar documento da pessoa
        /// </summary>
        public void alterarDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.alterarDocPessoa(documentoPessoa, idPessoa);

        }

        /// <summary>
        /// Incluir a pessoa
        /// </summary>
        public Int32 incluirPessoa(List<Pessoa> pessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.incluirPessoa(pessoa);

        }

        /// <summary>
        /// alterar a pessoa
        /// </summary>
        public void alterarPessoa(List<Pessoa> pessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.alterarPessoa(pessoa);
        }

        /// <summary>
        /// excluir a pessoa
        /// </summary>
        public void excluirPessoa(List<Pessoa> pessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirPessoa(pessoa);
        }

        /// <summary>
        /// Incluir endereço da pessoa
        /// </summary>
        public void incluirNovoAvalista(List<Avalistas> avalista)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.incluirNovoAvalista(avalista);
        }

        /// <summary>
        /// Alterar endereço da pessoa
        /// </summary>
        public void alterarNovoAvalista(List<Avalistas> avalista)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.alterarNovoAvalista(avalista);
        }

        /// <summary>
        /// Excluir endereço da pessoa
        /// </summary>
        public void excluirNovoAvalista(Int32 idAvalista)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirNovoAvalista(idAvalista);
        }

        /// <summary>
        /// Incluir telefone
        /// </summary>
        public void incluirTelefone(Telefone telefone)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.incluirTelefone(telefone);
        }

        /// <summary>
        /// Alterar telefone
        /// </summary>
        public void alterarTelefone(Telefone telefone)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.alterarTelefone(telefone);
        }

        /// <summary>
        /// Excluir telefone
        /// </summary>
        public void excluirTelefones(List<Telefone> telefones)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirTelefones(telefones);
        }

        /// <summary>
        /// Excluir telefone
        /// </summary>
        public void excluirTelefone(Telefone telefone)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirTelefone(telefone);
        }

        /// <summary>
        /// inserir contato
        /// </summary>
        public void incluirContato(Contato contato)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.incluirContato(contato);
        }

        /// <summary>
        /// alterar contato
        /// </summary>
        public void alterarContato(Contato contato)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.alterarContato(contato);
        }

        /// <summary>
        /// excluir contato
        /// </summary>
        public void excluirContato(Contato contato)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirContato(contato);
        }

        /// <summary>
        /// Excluir relacionamento entre Telefone e Contato
        /// </summary>
        /// <param name="idTelContato"></param>
        public void excluirTelContato(Int32 idTelContato)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirTelContato(idTelContato);
        }

        /// <summary>
        /// excluir contato
        /// </summary>
        public void excluirContatos(List<Contato> contatos)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirContatos(contatos);
        }

        /// <summary>
        /// Alterar endereço da pessoa
        /// </summary>
        public void alterarEndereco(Endereco endPessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.alterarEndereco(endPessoa);
        }

        public void incluirTelefoneContato(List<Telefone> telefones, List<Contato> contatos, int idEndereco)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.incluirTelefoneContato(telefones, contatos, idEndereco);
        }

        /// <summary>
        /// Excluir endereço da pessoa
        /// </summary>
        public void excluirEndereco(Int32 idEndereco)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirEndereco(idEndereco);
        }

        public void excluirTelefoneEndereco(Int32 idEndereco)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.excluirTelefoneEndereco(idEndereco);
        }

        #region IServicoConcessao Members   



        #endregion

        public List<Contrato> BuscarContratosAbertos(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.BuscarContratosAbertos(idMutuario, idTitular, idTipoEmprestimo, idTipoContrato, dataCredito);
        }

        public bool VerificaExistenciaContratoInadimplente(int IdPessoa)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.VerificaExistenciaContratoInadimplente(IdPessoa);
        }

        //Campanha Desconto
        public DateTime BuscarDataCredito(long idPessoa, long idTitular, int idPlano, int idPatrocinadora)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.BuscarDataCredito(idPessoa, idTitular, idPlano, idPatrocinadora);
        }

        public DescontoInadimplencia BuscaInadimplenciaDesconto(long NumeroContrato, long IdPessoa, DateTime DataCalculo, int TipoProposta, double saldoDevedor, List<ItemDescontoContrato> descontoQuitacao, long IdCalculo = 0)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            return gerenciadorConcessao.BuscaInadimplenciaDesconto(NumeroContrato, IdPessoa, DataCalculo, TipoProposta, saldoDevedor, descontoQuitacao, IdCalculo);
        }

        public void CancelarConcessaoEmprestimo(Contrato contrato, string protocoloCRM, string UsuarioLogado)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.CancelarConcessaoEmprestimo(contrato, protocoloCRM, UsuarioLogado);
        }

        public void IncluirEventoDeCobranca(double NumeroContrato, DateTime DataOperacao, int IdTipoEvento, string Observacao)
        {
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            gerenciadorConcessao.IncluirEventoDeCobranca(NumeroContrato, DataOperacao, IdTipoEvento, Observacao);
        }        
    }
}
