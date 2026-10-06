#region SOL 224034/17909 PPM 1165556
/// Autor:
/// William Moreira da Silva
///
/// Data da Atualização:
/// 30/01/2017
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Runtime.Serialization;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.WebEmprestimo.Servicos;

namespace FUNCEF.Planus.WebEmprestimo.ObjetosNegocio
{
    /// <summary>
    /// Classe que representa um contrato, trabalha de forma otimizada com o banco de dados
    /// com o intuito de evitar alta carga gerada pelo conjunto Contrato.cs e GerenciadorContrato.cs.
    /// </summary>
    /// <param name="numContrato">Identificador do contrato</param>
    /// <param name="origemConector">Indica se o processo veio do ConectorWeb.</param>
    [DataContract]
    [Serializable]
    public class ObjetoContrato : Contrato
    {
        #region Atributos

        private int idPessoa;
        private int idTitular;
        private bool carregouSuspensao = false;
        private bool carregouDadosAdicionais = false;
        private bool carregouFalecimento = false;
        private bool carregouDadosFinanceiros = false;

        private Mutuario _mutuario;

        private Patrocinadora _patrocinadora;

        private string _formaPagamento;
        private string _portadorCredito;
        private string _portadorDebito;

        private Moeda _indexador;

        private Suspensao _suspensao;

        private PlanoPrevidenciario _plano;

        private int? _parcelasRestantes;

        private int _isDocumentoObito;
        private int _numeroDocumentoParamPrev;

        private DateTime? _dataSolicitacao;
        private string _nomeResponsavel;
        private int _nrContratosQuitados;
        private double _valorMaxPrestacao;
        private DateTime? _dataInicioVlrMax;
        private DateTime? _dataFinalVlrMax;

      

        private string conexao;

        #endregion

        #region Construtores

        public ObjetoContrato(long numContrato)
        {
            this.Construtor(numContrato, false);
        }

        public ObjetoContrato(long numContrato, bool origemConector)
        {
            this.Construtor(numContrato, origemConector);
        }

        private void Construtor(long numContrato, bool origemConector)
        {
            this.veioConector = origemConector;
            this.conexao = this.BuscaTipoConexao();
            Dictionary<string, object> infoContrato;

            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    infoContrato = cliente.contrato.buscaInfoContrato(numContrato);
                }
            }
            else
            {
                IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();
                infoContrato = acesso.buscaInfoContrato(numContrato);
            }
            if (infoContrato.Count > 0)
            {                
                this.numero = numContrato;
                this.idPessoa = ConvertInt(infoContrato["IDBENEF"]);
                this.idTitular = ConvertInt(infoContrato["IDPESSOA"]);
                this.dataAssinatura = (DateTime?)infoContrato["DATAASSINATURA"];
                this.dataCredito = (DateTime?)infoContrato["DATACREDITO"];
                this.dataPrimeiraParcela = (DateTime?)infoContrato["DATAPRIMPARC"];
                this.totalParcelas = ConvertInt(infoContrato["NUMPARCELAS"]);
                this.valorParcela = (double?)infoContrato["VLRPARCELA"];
                this.taxaJuros = (double?)infoContrato["TXJUROS"];
                this.idSituacao = (string)infoContrato["FLGSITUACAO"];
                this.valorMargem = (double?)infoContrato["VLRMARGEM"];
                this.dataCancelamento = (DateTime?)infoContrato["DATACANC"];
                this.salarioBase = (double?)infoContrato["VLRSALBASE"];
                this.inscricaoEmprestimo = new InscricaoEmprestimo { id = (long)infoContrato["IDINSCRICAOEMPTMO"] };
                this.formaRecebimento = (string)infoContrato["FLGFORMAREC"];
                this.flagFormaRecebimento = (string)infoContrato["FLGFORMAREC"];
                this.formaPagamento = (string)infoContrato["FLGFORMAPAG"];
                this.flagFormaPagamento = (string)infoContrato["FLGFORMAPAG"];
                this.contratoQuitacao = (long)infoContrato["IDCONTRQUITACAO"];
                this.codigoAutoEmprestimo = (long)infoContrato["CODAUTOEMP"];
                this.dataInicioSuspensao = (DateTime?)infoContrato["DATAINICIOSUSP"];
                this.dataFimSuspensao = (DateTime?)infoContrato["DATAFIMSUSP"];
                this.excepcional = (Boolean)infoContrato["FLGEXCEPCIONAL"];
                this.efetiva = (Boolean)infoContrato["FLGPERDAEFETIVA"];
                this.internet = (Boolean)infoContrato["FLGINTERNET"];
                this.numProtocolo = (string)infoContrato["NUMPROTOCOLO"];
                this.mesesSuspencao = ConvertInt(infoContrato["TSEMESES"]);
                this.idTipoContratoEmpto = ConvertInt(infoContrato["IDTIPOCONTREMPTMO"]);
                this.numeroParcelasAtrasadas = ConvertInt(infoContrato["NUMPARCDESCONTO"]);
                this.valorContrato = (double?)infoContrato["VLRCONTRATO"];
                this.valorMaximo = ConvertDouble(infoContrato["VLRMAXPERMIT"]);

                //William Moreira da Silva - SOL 224034/17909
                this.FlagAcordoJudicial = ConvertInt(infoContrato["FLGACORDOJUDICIAL"]);
                //William Moreira da Silva - SOL 224034/17909

                this.situacao = new SituacaoContrato(this.idSituacao, (string)infoContrato["SITCONTRATO"]);
                //SIG 130739
                this.ProvisaoPerda =  (string)infoContrato["PROVISAO_PERDA"];

                this.beneficiario = new Beneficiario()
                {
                    id = ConvertInt(infoContrato["IDBENEF"])
                };
                this.tipo = new TipoContrato()
                {
                    id = this.idTipoContratoEmpto,
                    descricao = (string)infoContrato["TCEDESCRICAO"],
                    SistemaAmortizacao = infoContrato["SISTEMA_AMORTIZACAO"].ToString().Trim()
                };
                this.tipoEmprestimo = new TipoEmprestimo()
                {
                    id = ConvertInt(infoContrato["IDTIPOEMPTMO"]),
                    descricao = (string)infoContrato["DESCTIPOEMPTMO"]
                };

                _suspensao = new Suspensao();
                if (ConvertInt(infoContrato["IDSUSPENSAO"]) == 0)
                {
                    carregouSuspensao = true;
                }
                else
                {
                    _suspensao.id = ConvertInt(infoContrato["IDSUSPENSAO"]);
                }
                this.ProtocoloCRM = infoContrato["PROTOCOLOCRM"].ToString();
                this.DataInclusao = (DateTime) infoContrato["DATA_INCLUSAO"];
            }
            else //Contrato não encontrado
            {
                this.numero = 0;
                _parcelasRestantes = 0;
                this.beneficiario = new Beneficiario();
                this.tipo = new TipoContrato();
                this.situacao = new SituacaoContrato();
                this.tipoEmprestimo = new TipoEmprestimo();
                this.inscricaoEmprestimo = new InscricaoEmprestimo();
                _suspensao = new Suspensao();
                _mutuario = new Mutuario();
                _patrocinadora = new Patrocinadora();
                _plano = new PlanoPrevidenciario();
                _indexador = new Moeda();
                carregouSuspensao = true;
                carregouDadosAdicionais = true;
                carregouFalecimento = true;
                carregouDadosFinanceiros = true;
            }
        }
        #endregion

        #region Busca informações conforme demanda (lazyload)
        public override Mutuario mutuario
        {
            get
            {
                if (_mutuario == null)
                {
                    this.carregaMutuario();
                }
                return _mutuario;
            }
            set
            {
                _mutuario = value;
            }
        }

        public override Patrocinadora patrocinadora
        {
            get
            {
                if (_patrocinadora == null)
                {
                    this.carregaPatrocinadora();
                }
                return _patrocinadora;
            }
            set
            {
                _patrocinadora = value;
            }
        }

        public override PlanoPrevidenciario plano
        {
            get
            {
                if (_plano == null)
                {
                    this.carregaPlano();
                }
                return _plano;
            }
            set
            {
                _plano = value;
            }
        }

        public override Suspensao suspensao
        {
            get
            {
                if (!carregouSuspensao)
                {
                    this.carregaSuspensao();
                }
                return _suspensao;
            }
            set
            {
                _suspensao = value;
            }
        }

        public override int? parcelasRestantes
        {
            get
            {
                if (_parcelasRestantes == null)
                {
                    this.obterParcelasRestantes();
                }
                return _parcelasRestantes;
            }
            set
            {
                _parcelasRestantes = value;
            }
        }

        public override string formaPagamento
        {
            get
            {
                if (!carregouDadosFinanceiros)
                {
                    this.buscaInfoFinanceiras();
                }
                return _formaPagamento;
            }
            set
            {
                _formaPagamento = value;
            }
        }

        public override string portadorCredito
        {
            get
            {
                if (!carregouDadosFinanceiros)
                {
                    this.buscaInfoFinanceiras();
                }
                return _portadorCredito;
            }
            set
            {
                _portadorCredito = value;
            }
        }

        public override string portadorDebito
        {
            get
            {
                if (!carregouDadosFinanceiros)
                {
                    this.buscaInfoFinanceiras();
                }
                return _portadorDebito;
            }
            set
            {
                _portadorDebito = value;
            }
        }

        public override Moeda indexador
        {
            get
            {
                if (!carregouDadosFinanceiros)
                {
                    this.buscaInfoFinanceiras();
                }
                return _indexador;
            }
            set
            {
                _indexador = value;
            }
        }

        public override int isDocumentoObito
        {
            get
            {
                if (!carregouFalecimento)
                {
                    this.carregaMutuario();
                }
                return _isDocumentoObito;
            }
            set
            {
                _isDocumentoObito = value;
            }
        }

        public override int numeroDocumentoParamPrev
        {
            get
            {
                if (!carregouFalecimento)
                {
                    this.buscaInfoFalecimento();
                }
                return _numeroDocumentoParamPrev;
            }
            set
            {
                _numeroDocumentoParamPrev = value;
            }
        }

        public override DateTime? dataSolicitacao
        {
            get
            {
                if (!carregouDadosAdicionais)
                {
                    this.carregaDadosAdicionais();
                }
                return _dataSolicitacao;
            }
            set
            {
                _dataSolicitacao = value;
            }
        }

        public override string nomeResponsavel
        {
            get
            {
                if (!carregouDadosAdicionais)
                {
                    this.carregaDadosAdicionais();
                }
                return _nomeResponsavel;
            }
            set
            {
                _nomeResponsavel = value;
            }
        }

        public override int nrContratosQuitados
        {
            get
            {
                if (!carregouDadosAdicionais)
                {
                    this.carregaDadosAdicionais();
                }
                return _nrContratosQuitados;
            }
            set
            {
                _nrContratosQuitados = value;
            }
        }

        public override double valorMaxPrestacao
        {
            get
            {
                if (!carregouDadosAdicionais)
                {
                    this.carregaDadosAdicionais();
                }
                return _valorMaxPrestacao;
            }
            set
            {
                _valorMaxPrestacao = value;
            }
        }

        public override DateTime? dataInicioVlrMax
        {
            get
            {
                if (!carregouDadosAdicionais)
                {
                    this.carregaDadosAdicionais();
                }
                return _dataInicioVlrMax;
            }
            set
            {
                _dataInicioVlrMax = value;
            }
        }

        public override DateTime? dataFinalVlrMax
        {
            get
            {
                if (!carregouDadosAdicionais)
                {
                    this.carregaDadosAdicionais();
                }
                return _dataFinalVlrMax;
            }
            set
            {
                _dataFinalVlrMax = value;
            }
        }

        #region Consulta Informações

        private void buscaInfoFinanceiras()
        {
            Dictionary<string, object> infoFinanceiras;
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    infoFinanceiras = cliente.contrato.buscaInfoFinanceiras(this.numero);
                }
            }
            else
            {
                IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();
                infoFinanceiras = acesso.buscaInfoFinanceiras(this.numero);
            }
            if (infoFinanceiras.Count > 0)
            {
                this.formaPagamento = (string)infoFinanceiras["FORMAPAGAMENTO"];
                this.portadorCredito = (string)infoFinanceiras["PORTADORPAGAMENTO"];
                this.portadorDebito = (string)infoFinanceiras["PORTADORRECEBIMENTO"];
                this.indexador = new Moeda()
                {
                    id = (int)infoFinanceiras["MOECODIGO"],
                    descricao = (string)infoFinanceiras["MOEDESCRICAO"],
                    sigla = (string)infoFinanceiras["MOESIGLA"]
                };
            }
            this.carregouDadosFinanceiros = true;
        }

        //Método Não utilizado. Pode ser utilizado quando for implementado o lazyload no mutuário (ObjetoMutuario)
        private void buscaInfoFalecimento()
        {
            Dictionary<string, object> infoFalecimento;
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    infoFalecimento = cliente.contrato.buscaInfoFalecimento(this.idPessoa);
                }
            }
            else
            {
                IAcessoMutuario acesso = FabricaObjetos.instancia.obterAcessoMutuario();
                infoFalecimento = acesso.buscaInfoFalecimento(this.idPessoa);
            }
            if (infoFalecimento.Count > 0)
            {
                _isDocumentoObito = ConvertInt(infoFalecimento["ISDOCUMENTOOBITO"]);
                _numeroDocumentoParamPrev = ConvertInt(infoFalecimento["IDDOCUMENTO"]);
                if (_mutuario == null)
                    this.carregaMutuario();
                _mutuario.dataFalecimento = (DateTime?)infoFalecimento["DATAFALECIMENTO"];
            }
            this.carregouFalecimento = true;
        }

        private void carregaMutuario()
        {
            Dictionary<string, object> infoMutuario;
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    infoMutuario = cliente.contrato.buscaInfoMutuario(this.numero);
                }
            }
            else
            {
                IAcessoMutuario acesso = FabricaObjetos.instancia.obterAcessoMutuario();
                infoMutuario = acesso.buscaInfoMutuario(this.numero);
            }
            if (infoMutuario.Count > 0)
            {
                _mutuario = new Mutuario()
                {
                    id = this.idPessoa,
                    idTitular = this.idTitular,
                    matricula = (string)infoMutuario["MATRICULA"],
                    nome = (string)infoMutuario["NOME"],
                    cpf = (string)infoMutuario["CPF"],
                    situacao = (string)infoMutuario["SITUACAOPART"],
                    idsitpart = ConvertInt(infoMutuario["IDSITPART"]),
                    dataFalecimento = (DateTime?)infoMutuario["DATAMORTE"],
                    inscricaoPrevidenciaria = (long)infoMutuario["INSCRICAOPREV"],
                    flginternoParticipante = (string)infoMutuario["FLGINTERNO"],
                    plano = new PlanoPrevidenciario()
                    {
                        id = ConvertInt(infoMutuario["IDPLANOPREV"]),
                        descricao = (string)infoMutuario["PLANO"],
                        situacao = (string)infoMutuario["SITPLANO"],
                        flagInterno = (string)infoMutuario["FLGINTERNO"]
                    },
                    dadosBancarios = new DadosBancarios()
                    {
                        id = ConvertInt(infoMutuario["IDCONTABANCARIA"])
                    }
                };
                _isDocumentoObito = ConvertInt(infoMutuario["FLGDOCOBITO"]);
                _numeroDocumentoParamPrev = ConvertInt(infoMutuario["IDDOCUMENTO"]);
                this.carregouFalecimento = true;

                //Completa dados do beneficiário (dados redundantes com o mutuário, provavelmente devido a não entendimento do negócio pelos criadores da estrutura do Web Empréstimo)
                this.beneficiario.nome = (string)infoMutuario["NOME"];
                this.beneficiario.dadosBancarios = new DadosBancarios()
                {
                    id = ConvertInt(infoMutuario["IDCONTABANCARIA"])
                };
            }
            else
            {
                _mutuario = new Mutuario();
            }
        }

        private void carregaPatrocinadora()
        {
            Dictionary<string, object> infoPatrocinadora;
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    infoPatrocinadora = cliente.contrato.buscaInfoPatrocinadora(this.numero);
                }
            }
            else
            {
                IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();
                infoPatrocinadora = acesso.buscaInfoPatrocinadora(this.numero);
            }
            if (infoPatrocinadora.Count > 0)
            {
                _patrocinadora = new Patrocinadora()
                {
                    id = ConvertInt(infoPatrocinadora["IDPATRO"]),
                    nome = (string)infoPatrocinadora["NOME"],
                    situacaoFuncional = (string)infoPatrocinadora["SITFUNCIONAL"],
                    nomeCedido = (string)infoPatrocinadora["CEDIDO"]
                };
            }
            else
            {
                _patrocinadora = new Patrocinadora();
            }
        }

        private void carregaPlano()
        {
            Dictionary<string, object> infoPlano;
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    infoPlano = cliente.contrato.buscaInfoPlano(this.numero);
                }
            }
            else
            {
                IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();
                infoPlano = acesso.buscaInfoPlano(this.numero);
            }
            if (infoPlano.Count > 0)
            {
                _plano = new PlanoPrevidenciario()
                {
                    id = ConvertInt(infoPlano["IDPLANOPREV"]),
                    descricao = (string)infoPlano["PLANOPREV"],
                    situacao = (string)infoPlano["SITPLANO"],
                    IdPlanoOrigem = ConvertInt(infoPlano["IDPLANOORIGEM"]),
                    planoOrigem = (string)infoPlano["PLANOCONTABIL"],
                    flagInterno = (string)infoPlano["FLGINTERNO"]
                };
            }
            else
            {
                _plano = new PlanoPrevidenciario();
            }
        }

        private void obterParcelasRestantes()
        {
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    _parcelasRestantes = cliente.contrato.obterNumParcelasRestantes(this.numero);
                }
            }
            else
            {
                IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();
                _parcelasRestantes = acesso.obterNumParcelasRestantes(this.numero);
            }
        }

        private void carregaDadosAdicionais()
        {
            Dictionary<string, object> infoAdicionais;
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    infoAdicionais = cliente.contrato.buscaInfoAdicionais(this.numero);
                }
            }
            else
            {
                IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();
                infoAdicionais = acesso.buscaInfoAdicionais(this.numero);
            }
            if (infoAdicionais.Count > 0)
            {
                _dataSolicitacao = (DateTime?)infoAdicionais["DATAINSCRICAO"];
                _nomeResponsavel = (string)infoAdicionais["NOMERESP"];
                _nrContratosQuitados = ConvertInt(infoAdicionais["QTDECONTRATO"]);
                _valorMaxPrestacao = ConvertDouble(infoAdicionais["VALORMAXPREST"]);
                _dataInicioVlrMax = (DateTime?)infoAdicionais["DTINICIOVLRMAX"];
                _dataFinalVlrMax = (DateTime?)infoAdicionais["DTFIMVLRMAX"];
            }
            this.carregouDadosAdicionais = true;
        }

        private void carregaSuspensao()
        {
            Dictionary<string, object> infoSuspensao;
            if (this.conexao == "SERVICOS")
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    infoSuspensao = cliente.contrato.buscaInfoSuspensao(this.numero, _suspensao.id, (DateTime)this.dataInicioSuspensao);
                }
            }
            else
            {
                IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();
                infoSuspensao = acesso.buscaInfoSuspensao(this.numero, _suspensao.id, (DateTime)this.dataInicioSuspensao);
            }
            if (infoSuspensao.Count > 0)
            {
                _suspensao.descricao = (string)infoSuspensao["DESCRICAO"];
                _suspensao.dataInicio = (DateTime)infoSuspensao["DATAINICIO"];
                if (infoSuspensao["DATAFINAL"] != null)
                    _suspensao.dataFinal =  (DateTime)infoSuspensao["DATAFINAL"];
            }
            this.carregouSuspensao = true;
        }

        #endregion
        #endregion

        private string BuscaTipoConexao()
        {
            string tipoConexao;
            //Verifica se é Web Empréstimo
            if (ConfigurationManager.AppSettings["globalWeb.chaveAplicacao"] == "WEBEMP")
            {
                tipoConexao = "SERVICOS";
            }
            else
            {
                //Verifica se é Conector Web
                if (!String.IsNullOrEmpty(ConfigurationManager.AppSettings["conector.chavePrivada"]))
                    tipoConexao = "SERVICOS";
                else
                    //Instanciado pelo Serviço Web Empréstimo
                    tipoConexao = "LOCAL";
            }
            return tipoConexao;
        }

        private int ConvertInt(object v)
        {
            try
            {
                int x = Convert.ToInt32(v);
                return x;
            }
            catch (Exception)
            {
                return 0;
            }
        }

        private double ConvertDouble(object v)
        {
            try
            {
                double x = Convert.ToDouble(v);
                return x;
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}