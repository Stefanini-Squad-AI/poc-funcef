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
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados das concessões.
    /// </summary>
    public interface IAcessoConcessao : IObjetoAcesso
    {

        void IncluirBloqueioConcessaoAcordoJudicial(Contrato contrato, long ContratoConcedido); // Felipe A. Santos - SOL 224034/17909 PPM 1165556 
        int IncluirEventoDeCobranca(double NumeroContrato, DateTime DataOperacao, int IdTipoEvento, string Observacao); // Felipe A. Santos - SOL 224034/17909 PPM 1165556 
        int obterEventoJudicial(); // Felipe A. Santos - SOL 224034/17909 PPM 1165556 
        List<long> ConsultarItensDeInadimplencia(long numeroContrato, DateTime dataCredito); // Felipe A. Santos - SOL 224034/17909 PPM 1165556
        void InserirItensEmAbertoAoEventoJudicial(List<long> ListaIdHistMovEmptmo, int IdHistEventoCobEmptmo); // Felipe A. Santos - SOL 224034/17909 PPM 1165556

        /// <summary>
        /// Pesquisa o dia da cobrança.
        /// </summary>
        /// <param name="idPatrocinadora">Identificação da Patrocinadora para filtro.</param>
        /// <param name="idPlanoPrevidenciario">Identificação do Plano Previdenciario para filtro.</param>
        /// <param name="idPlanoPrevidenciario">Data credito.</param>
        /// <returns>Dia da Cobrança.</returns>
        DateTime calcularPrimeiraParcela(int idPatrocinadora, int idPlanoPrevidenciario, DateTime dataCredito);

        /// <summary>
        /// Verifica se existe outras Concessões.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <param name="dataReferencia">Data de refêrencia para filtro.</param>
        /// <param name="idTipocontrato">Identificação do tipo do contrato para filtro.</param>
        /// <returns>Se existe Concessões associadas.</returns>
        bool verificarConcessaoExistente(int idMutuario, DateTime dataReferencia, int? idTipoContrato);

        /// <summary>
        /// Verifica se existe suspensão associada ao mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário a ser filtrada.</param>
        /// <param name="dataReferencia">Data de referência da suspensão a ser filtrada.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Suspensao"/> com os dados encontrados.</returns>
        Suspensao consultarSuspensao(int idMutuario, int idTipoContratoEmpto, DateTime dataReferencia);//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567

        //Jessica Y. Oshiro - SOL 235314
        /// <summary>
        /// Verifica se data credito é dia util.
        /// </summary>
        /// <param name="idMutuario">Data credito como parametro</param>
        /// <returns>Se data credito é dia util.</returns>
        bool verificaDataUtil(DateTime dataUtil);

        // Thiago Melo SOL 202311 KINTANA 1956671 INI
        List<Contrato> consultarContratosAnteriores(int idpessoa, int idMutuario, DateTime hmeData, int idTipoEmprestimo, int quitavel, int idTipoContrato, bool flgExcepcional, string contratosSelecionados = null);

        Contrato consultarFlgPrazoTpQuitacao(int IdTipoContrato);

        bool primeiraRenovacao2006(int idPessoa, int idBenef, int idTipoContrato);

        int verContratoQuitavel(int tipoContrato, int tipoContratoQuitavel);
        // Thiago Melo SOL 202311 KINTANA 1956671

        //MARCIO SANCHES SPINOSA - SOL 204760
        List<long> obterContratoEmptmo(int idMutuario, int idBeneficiario, DateTime dataCredito);

        double existemItensEmAberto(long idcontratoemptmo, bool usaData, DateTime dataCredito, bool usaMes, int ano, int mes);
        //MARCIO SANCHES SPINOSA - SOL 204760

        /// <summary>
        /// Verifica se existe concessao não efetivada
        /// </summary>
        /// <param name="tipoContrato"></param>
        /// <param name="idMutuario"></param>
        /// <returns></returns>
        bool verificarConcessaoNaoEfetivada(TipoContrato tipoContrato, int idMutuario);

        // xavier SOL 178579
        /// <summary>
        /// Grupo Excepcional.
        /// </summary>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.GrupoExcepcional"/> com os dados encontrados.</returns>         
        List<Grupoexcepcional> listarGrupoExcepcional();

        /// <summary>
        /// Inclui Grupo Excepcional e Contratoemptmo na CONTRATOEMPTMOXEXCEPCIONAL
        /// </summary>
        void incluirContratoEmptmoXExcepcional(Int64 idContrato, int idGrupoExcepcional);

        //Sadi Freire SOL213592_Kintana2040335
        /// <summary>
        /// Inclui idContrato e idPessoa na SUSPCONCESSAO
        /// </summary>
        void incluirContratoEmptmoSuspconcessao(Int64 idContrato, int idPessoa, string Observacao, int IdTipoSuspensao, int QtdMesesSuspensao, string ModalidadesBloqueio);

		
        /// <summary>
        /// Incluir endereço da pessoa
        /// </summary>
        Int32 IncluirEndereco(Endereco endPessoa);

        /// <summary>
        /// Alterar endereço da pessoa
        /// </summary>
        void alterarEndereco(Endereco endPessoa);

        /// <summary>
        /// Excluir endereço da pessoa
        /// </summary>
        void excluirEndereco(Int32 idEndereco);

        /// <summary>
        /// Exclui os telefones associados ao endereço
        /// </summary>
        void excluirTelefoneEndereco(Int32 idEndereco);

        /// <summary>
        /// Incluir  documento da pessoa
        /// </summary>
        void incluirDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa);

        /// <summary>
        /// alterar  documento da pessoa
        /// </summary>
        void alterarDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa);

        /// <summary>
        /// Incluir  a pessoa
        /// </summary>
        Int32 incluirPessoa(List<Pessoa> pessoa);

        /// <summary>
        /// Alterar  a pessoa
        /// </summary>
        void alterarPessoa(List<Pessoa> pessoa);

        /// <summary>
        /// Excluir  a pessoa
        /// </summary>
        void excluirPessoa(List<Pessoa> pessoa);

        /// <summary>
        /// Incluir  a avalista
        /// </summary>
        void incluirNovoAvalista(List<Avalistas> avalista);

        /// <summary>
        /// alterar  a avalista
        /// </summary>
        void alterarNovoAvalista(List<Avalistas> avalista);

        /// <summary>
        /// excluir  a avalista
        /// </summary>
        void excluirNovoAvalista(Int32 idAvalista);

        /// <summary>
        /// Incluir  telefone
        /// </summary>
        int? incluirTelefone(Telefone telefone);

        /// <summary>
        /// Alterar  telefone
        /// </summary>
        void alterarTelefone(Telefone telefone);

        /// <summary>
        /// excluir  telefone
        /// </summary>
        void excluirTelefone(Telefone telefone);

        /// <summary>
        /// inserir  contato
        /// </summary>
        int? incluirContato(Contato contato);

        /// <summary>
        /// alterar  contato
        /// </summary>
        void alterarContato(Contato contato);

        /// <summary>
        /// Excluir  contato
        /// </summary>
        void excluirContato(Contato contato);

        /// <summary>
        /// inserir  contato
        /// </summary>
        void incluirTelContato(TelContato TelContato);

        /// <summary>
        /// alterar  contato
        /// </summary>
        void alterarTelContato(TelContato TelContato);

        /// <summary>
        /// Excluir  contato
        /// </summary>
        void excluirTelContato(Int32 idTelContato);

        //BarraProgresso
        /// <summary>
        /// Inseri o usuario na tabela que ira controlar a barraProgresso
        /// </summary>
        ///<param name="usuario">Usúario que esta realizando o processo</param>
        ///<param name="quantRegras">Quantidade de regras realizadas pelo o processo</param>
        void incluirIdbarraProgresso(string usuario, int quantRegras);

        //BarraProgresso
        /// <summary>
        /// Inseri o id na tabela que ira controlar a barraProgresso
        /// </summary>
        ///<param name="idBarraProgresso">Id do processo que esta sendo realizado</param>
        ///<param name="quantRegras">Quantidade de regras realizadas pelo o processo</param>
        void incluirIdbarraProgresso(int? idBarraProgresso, string usuario, int quantRegras);//William Moreira da Silva - SOL 247419

        /// <summary>
        /// Atualiza a tabela que controla a barraProgresso
        /// </summary>
        ///<param name="usuario">Usúario que esta realizando o processo</param>
        ///<param name="quantRegras">Quantidade de regras ja realizadas</param>
        ///<param name="itens">Quantidade de itens ja realizados</param>
        void atualizaBarraProgresso(string usuario, int regras, int quantItens, int itens);

        //William Moreira da Silva - SOL 247419
        /// <summary>
        /// 
        /// </summary>
        /// <param name="idBarraProgresso"></param>
        /// <param name="usuario"></param>
        /// <param name="regras"></param>
        /// <param name="quantItens"></param>
        /// <param name="itens"></param>
        void atualizaBarraProgresso(int? idBarraProgresso, string usuario, int regras, int quantItens, int itens);

        /// <summary>
        /// Retorna o Status que controla a barraProgresso
        /// </summary>
        ///<param name="usuario">Usúario que esta realizando o processo</param>
        List<Int32> obterStatusBarraProgresso(string usuario);

        //William Moreira da Silva - SOL 247419
        List<Int32> obterStatusBarraProgresso(string usuario, int? idBarraProgresso);

        /// <summary>
        /// Deleta a instancia da barra de progresso
        /// </summary>
        /// <param name="usuario">Usúario que esta fazendo o processo</param>
        void deletaStatusBarraProgresso(string usuario);
        //BarraProgresso

        //William Moreira da Silva - SOL 247419
        int? consultarUltimoIdTabela(string nomeSeqTabela);
        //BarraProgresso

        /// SIG 57675 - Início
        /// <summary>
        /// Verifica se existe outras Concessões.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <param name="dataReferencia">Data de refêrencia para filtro.</param>
        /// <returns>Se existe Concessões associadas.</returns>
        bool verificarConcessao13(int idPessoa, int idMutuario, DateTime? dtPrimeiraParcela);
        /// SIG 57675 - Fim


        //SIG 67808 - Matias || Campanha Desconto
        bool VerificaExistenciaContratoInadimplente(double IdPessa);
        DateTime BuscarDataCredito(long idPessoa, long idTitular, int idPlano, int idPatrocinadora);
        DescontoInadimplencia BuscaInadimplenciaDesconto(long NumeroContrato, long IdPessoa, DateTime DataCalculo, int TipoProposta, double saldoDevedor, List<ItemDescontoContrato> descontoQuitacao, long IdCalculo = 0);
    }
}
