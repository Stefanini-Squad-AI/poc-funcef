

using System;
using System.Text.RegularExpressions;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.Web.Boleto
{
    //Campanha Desconto
    public class BoletoEmprestimo
    {
        #region propriedades
        public double CodDocumento { get; set; }

        public string RepresentacaoNumerica { get; set; }

        public string LocalDePagamento { get; set; }

        public string Beneficiario { get; set; }

        public DateTime DataDoDocumento { get; set; }

        public string NumeroDoDocumento { get; set; }

        public string EspecieDoc { get; set; }

        public string Aceite { get; set; }

        public DateTime DataDeProcessamento { get; set; }

        public string NumeroDaContaRespo { get; set; }

        public string Carteira { get; set; }

        public string Especie { get; set; }

        public int Quantidade { get; set; }

        public DateTime DataDeVencimento { get; set; }

        public string Agencia { get; set; }

        public string CodigoBeneficiario { get; set; }

        public string NossoNumero { get; set; }

        public string ValorDoDocumento { get; set; }

        public double ValorDoDesconto { get; set; }

        public double VrDocumento { get; set; }

        public string NomeDaPessoa { get; set; }

        public string CPF { get; set; }

        public string Matricula { get; set; }

        public string Inscricao { get; set; }

        public string REF { get; set; }

        public string FacEvAtiv { get; set; }

        public string Logradouro { get; set; }

        public string Bairro { get; set; }

        public string Cidade { get; set; }

        public string Estado { get; set; }

        public string CEP { get; set; }

        public string CodigoBaixa { get; set; }

        public string CodigoDeBarras { get; set; }

        public byte[] ImagemCodigoDeBarras { get; set; }

        public string Modalidade { get; set; }
        public string NumeroContrato { get; set; }
        public DateTime DataConcessao { get; set; }
        public string ObservacoesAdicionais { get; set; }
        #endregion


        public BoletoEmprestimo(double codDocumento, int codPortForma, int tipoMovimento)
        {
            ObterBoletoBancarioPorCodDocumento(codDocumento, codPortForma, tipoMovimento);

        }

        #region Methods GerarBoleto
        public  void ObterBoletoBancarioPorCodDocumento(double codDocumento, int codPortForma, int tipoMovimento)
        {
            try
            {
                string nossoNumero = null;
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    bool blDocumentoEmitido =  cliente.contrato.VerificarDocumentoEmitido(codDocumento); 

                    if (blDocumentoEmitido)
                        nossoNumero = cliente.contrato.ObterNossoNumeroPorCodDocumento(codDocumento);
                    else
                        nossoNumero = AtualizarNossoNumeroDocumento(codDocumento, codPortForma);

                    PreparaBoleto(codDocumento, codPortForma, tipoMovimento, nossoNumero, blDocumentoEmitido);                  

                    if (!blDocumentoEmitido)
                    {
                        cliente.contrato.AtualizarCampoEmisBloqParaS(codDocumento);
                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void PreparaBoleto(double codDocumento, int codPortForma, int tipoMovimento, string nossoNumero, bool situacaoDocumento)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {                
                Tipos.Boleto boleto = cliente.contrato.ObterBoletoPorCodDocumento(codDocumento, codPortForma, situacaoDocumento, tipoMovimento);
                this.CEP = boleto.CEP;
                this.Estado = boleto.Estado;
                this.Cidade = boleto.Cidade;
                this.Bairro = boleto.Bairro;
                this.Logradouro = boleto.Logradouro;
                this.CPF = boleto.CPF;
                this.NomeDaPessoa = boleto.NomeDaPessoa;
                this.ValorDoDesconto = boleto.ValorDoDesconto;
                this.DataDeVencimento = boleto.DataDeVencimento;
                this.DataDoDocumento = boleto.DataDoDocumento;
                this.NossoNumero = boleto.NossoNumero;
                this.VrDocumento = boleto.VrDocumento;
                this.ValorDoDocumento = boleto.ValorDoDocumento;
                this.NumeroDoDocumento = boleto.NumeroDoDocumento;
                this.Agencia = boleto.Agencia;
                this.Modalidade = boleto.Modalidade;
                this.DataConcessao = boleto.DataConcessao;
                this.NumeroContrato = boleto.NumeroContrato;
                this.ObservacoesAdicionais = boleto.ObservacoesAdicionais;

                this.NossoNumero = Obter_nosso_numero_com_modalidade_de_cobranca_emissao_do_boleto_e_digito_verificador(nossoNumero);
                this.CodigoDeBarras = Obter_codigo_de_barras(boleto.DataDeVencimento, boleto.ValorDoDocumento.Replace(".", ""), nossoNumero);
                this.RepresentacaoNumerica = Obter_representacao_numerica_do_codigo_de_barras(this.CodigoDeBarras);
                this.EspecieDoc = "OU";
                this.Aceite = "N";
                this.Carteira = "SR";
                this.Especie = "R$";
                this.DataDeProcessamento = DateTime.Now;
                this.ImagemCodigoDeBarras = new C2of5i(this.CodigoDeBarras, 1, 50).ToByte();

                //this.CEP = "18115710";
                //this.Estado = "SP";
                //this.Cidade = "Votorantim";
                //this.Bairro = "Teste";
                //this.Logradouro = "Teste";
                //this.CPF = "12345678910";
                //this.NomeDaPessoa = "Teste Nome";
                //this.ValorDoDesconto = 0.0;
                //this.DataDeVencimento = DateTime.Now;
                //this.DataDoDocumento = DateTime.Now;
                //this.NossoNumero = "11111111";
                //this.VrDocumento = 10.0;
                //this.ValorDoDocumento = "500,00";
                //this.NumeroDoDocumento = "123456";
                //this.Agencia = "123";
                //this.Modalidade = "Teste";
                //this.DataConcessao = DateTime.Today;
                //this.NumeroContrato = "123456789";
                //this.ObservacoesAdicionais = "Teste Obs";

                //this.NossoNumero = Obter_nosso_numero_com_modalidade_de_cobranca_emissao_do_boleto_e_digito_verificador(nossoNumero);
                //this.CodigoDeBarras = "11111111111111111111111111";
                //this.RepresentacaoNumerica = "11111111111111111111111111";
                //this.EspecieDoc = "OU";
                //this.Aceite = "N";
                //this.Carteira = "SR";
                //this.Especie = "R$";
                //this.DataDeProcessamento = DateTime.Now;
                //this.ImagemCodigoDeBarras = new C2of5i(this.CodigoDeBarras, 1, 50).ToByte();
            }
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                ContratoDTO dadosContrato = cliente.contrato.BuscarDadosContratoImpressao(Convert.ToInt64(this.NumeroContrato));

                this.CEP = dadosContrato.Cep;
                this.Estado = dadosContrato.Uf;
                this.Cidade = dadosContrato.Cidade;
                this.Bairro = dadosContrato.Bairro;
                this.Logradouro = dadosContrato.Logradouro;

                //this.CEP = "12345678";
                //this.Estado = "SP";
                //this.Cidade = "Sao Paulo";
                //this.Bairro = "Teste";
                //this.Logradouro = "Teste";
            }
        }

        private int Calcular_resultado_de_digito_verificador_por_soma_e_quociente_10(int soma)
        {
            return Calcular_resultado_de_digito_verificador_por_soma_e_quociente(soma, 10);
        }

        private int Calcular_resultado_de_digito_verificador_por_soma_e_quociente_11(int soma)
        {
            return Calcular_resultado_de_digito_verificador_por_soma_e_quociente(soma, 11);
        }

        private int Calcular_digito_verificador_dos_campos_da_representacao_numerica(string campo)
        {
            int soma = Calcular_soma_com_indice_de_multiplicacao_1_e_2_da_direira_para_esquerda(campo);
            return Calcular_resultado_de_digito_verificador_por_soma_e_quociente_10(soma);
        }

        private int Calcular_resultado_de_digito_verificador_por_soma_e_quociente(int soma, int quociente)
        {
            if (soma < quociente)
                return quociente - soma;

            int resto = soma % quociente;

            int resultado = quociente - resto;

            if (resultado > 9)
                return 0;

            return resultado;
        }

        private int Calcular_soma_com_indice_de_multiplicacao_2_ate_9_da_direira_para_esquerda(string sequenciaAVerificar)
        {
            int soma = 0, peso = 2;

            int quantidadeIteracoes = sequenciaAVerificar.Length - 1;

            for (int i = quantidadeIteracoes; i >= 0; i--)
            {
                int numero = int.Parse(sequenciaAVerificar[i].ToString());
                soma += numero * peso;
                if (peso == 9)
                    peso = 2;
                else
                    peso++;
            }

            return soma;
        }
      
        private int Calcular_digito_verificador_do_cedente(string codigoCedente)
        {
            int soma = Calcular_soma_com_indice_de_multiplicacao_2_ate_9_da_direira_para_esquerda(codigoCedente);
            return Calcular_resultado_de_digito_verificador_por_soma_e_quociente_11(soma);
        }
   
        private int Calcular_digito_verificador_do_campo_livre(string campoLivre)
        {
            int soma = Calcular_soma_com_indice_de_multiplicacao_2_ate_9_da_direira_para_esquerda(campoLivre);
            return Calcular_resultado_de_digito_verificador_por_soma_e_quociente_11(soma);
        }

      
        private int Calcular_digito_verificador_do_campo_um_da_representacao_numerica(string numero)
        {
            if (!new Regex("^[0-9]{9}$").IsMatch(numero))
                throw new Exception("O campo deve ter somente número e 9 caracteres.");

            return Calcular_digito_verificador_dos_campos_da_representacao_numerica(numero);
        }

     
        private int Calcular_digito_verificador_do_campo_dois_da_representacao_numerica(string numero)
        {
            if (!new Regex("^[0-9]{10}$").IsMatch(numero))
                throw new Exception("O campo deve ter somente número e 10 caracteres.");

            return Calcular_digito_verificador_dos_campos_da_representacao_numerica(numero);
        }

     
        private int Calcular_digito_verificador_do_campo_tres_da_representacao_numerica(string numero)
        {
            if (!new Regex("^[0-9]{10}$").IsMatch(numero))
                throw new Exception("O campo deve ter somente número e 10 caracteres.");

            return Calcular_digito_verificador_dos_campos_da_representacao_numerica(numero);
        }

        private int Calcular_soma_com_indice_de_multiplicacao_1_e_2_da_direira_para_esquerda(string campo)
        {
            int soma = 0;
            try
            {
                int quantidadeIteracoes = campo.Length - 1;
                int multiplicador = 2;
                for (int i = quantidadeIteracoes; i >= 0; i--)
                {
                    int numero = int.Parse(campo[i].ToString());
                    int resultadoMultiplicacao = numero * multiplicador;

                    if (resultadoMultiplicacao > 9)
                    {
                        int digitoUm = int.Parse(resultadoMultiplicacao.ToString()[0].ToString());
                        int digitoDois = int.Parse(resultadoMultiplicacao.ToString()[1].ToString());
                        int numeroASomar = digitoUm + digitoDois;
                        soma += numeroASomar;
                    }
                    else
                    {
                        soma += resultadoMultiplicacao;
                    }

                    if (multiplicador == 2)
                        multiplicador = 1;
                    else
                        multiplicador = 2;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return soma;
        }
   
        private int Calcular_digito_verificador_geral_do_codigo_de_barras(string campo)
        {
            int soma = Calcular_soma_com_indice_de_multiplicacao_2_ate_9_da_direira_para_esquerda(campo);
            int digitoVerificador = Calcular_resultado_de_digito_verificador_por_soma_e_quociente_11(soma);
            if (digitoVerificador == 0)
            {
                return 1;
            }
            return digitoVerificador;
        }
 
        private int Calcular_digito_verificador_do_nosso_numero(string nossoNumero)
        {
            int soma = Calcular_soma_com_indice_de_multiplicacao_2_ate_9_da_direira_para_esquerda(nossoNumero);
            return Calcular_resultado_de_digito_verificador_por_soma_e_quociente_11(soma);
        }

        private string Obter_nosso_numero_com_modalidade_de_cobranca_emissao_do_boleto_e_digito_verificador(string nossoNumero)
        {
            if (nossoNumero.StartsWith("0"))
            {
                string codigoModalidadeCobrancaSemRegistro = "2";
                string codigoEmissaoDoBloquetoPeloCedente = "4";
                nossoNumero = string.Format("{0}{1}{2}", codigoModalidadeCobrancaSemRegistro, codigoEmissaoDoBloquetoPeloCedente, nossoNumero);
            }
            nossoNumero = string.Format("{0}-{1}", nossoNumero, Calcular_digito_verificador_do_nosso_numero(nossoNumero));
            return nossoNumero;
        }

      
        private string Obter_proximo_nosso_numero_do_convenio_por_codigo_portador_forma_atualizado(int codPortForma)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                string nossoNumeroSemZeros = cliente.contrato.ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(codPortForma);

                cliente.contrato.AtualizarNossoNumero(nossoNumeroSemZeros, codPortForma);

                int tamanhoNossoNumero = nossoNumeroSemZeros.Length;
                int quantidadeDeZeros = 15 - tamanhoNossoNumero;
                string nossoNumero = string.Format("{0}{1}", new String('0', quantidadeDeZeros), nossoNumeroSemZeros);
                return nossoNumero;
            }
        }
        
        private string Obter_campo_livre(string nossoNumero)
        {
            if (!nossoNumero.StartsWith("0"))
            {
                nossoNumero = nossoNumero.Substring(2);
            }
            string codigoClienteCedente = "391400"; // Código cedente COPART/EMPREST
            int digitoVerificadorCedente = Calcular_digito_verificador_do_cedente(codigoClienteCedente);
            string primeiraParteNossoNumero = nossoNumero.Substring(0, 3);
            string constanteDefinicaoCarteira = "2"; // Modalidade/Carteira de Cobrança (1-Registrada/2-Sem Registro)
            string segundaParteNossoNumero = nossoNumero.Substring(3, 3);
            string constanteDefinicaoImpressaoBloqueto = "4"; // Emissão do boleto (4-Beneficiário)
            string terceiraParteNossoNumero = nossoNumero.Substring(6, 9);
            string campoLivreSemDigitoVerificador = string.Format("{0}{1}{2}{3}{4}{5}{6}", codigoClienteCedente, digitoVerificadorCedente, primeiraParteNossoNumero, constanteDefinicaoCarteira, segundaParteNossoNumero, constanteDefinicaoImpressaoBloqueto, terceiraParteNossoNumero);
            int digitoVerificadorCampoLivre = Calcular_digito_verificador_do_campo_livre(campoLivreSemDigitoVerificador);
            string campoLivre = string.Format("{0}{1}", campoLivreSemDigitoVerificador, digitoVerificadorCampoLivre);
            return campoLivre;
        }
  
        private int Calcular_fator_de_vencimento(DateTime dataDeVencimento)
        {
            int fator = 1000;
            try
            {
                DateTime dataDeReferencia = new DateTime(2000, 7, 3);

                while (dataDeVencimento != dataDeReferencia)
                {
                    fator++;
                    dataDeReferencia = dataDeReferencia.AddDays(1);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return fator;
        }
              
        private string Obter_codigo_de_barras(DateTime dataDeVencimento, string valorDoDocumento, string nossoNumero)
        {
            string codigoDeBarras = string.Empty;
            try
            {
                string codigoDoBanco = "104";
                string codigoDaMoeda = "9";
                int favorDeVencimento = Calcular_fator_de_vencimento(dataDeVencimento);
                string valor = Obter_valor_formatado(valorDoDocumento);
                string campoLivre = Obter_campo_livre(nossoNumero);
                string codigoDeBarrasSemDigitoVerificador = string.Format("{0}{1}{2}{3}{4}", codigoDoBanco, codigoDaMoeda, favorDeVencimento, valor, campoLivre);
                string antesDigitoVerificador = codigoDeBarrasSemDigitoVerificador.Substring(0, 4);
                int digitoVerificadorGeralCodigoDeBarras = Calcular_digito_verificador_geral_do_codigo_de_barras(codigoDeBarrasSemDigitoVerificador);
                string depoisDigitoVerificador = codigoDeBarrasSemDigitoVerificador.Substring(4);
                codigoDeBarras = string.Format("{0}{1}{2}", antesDigitoVerificador, digitoVerificadorGeralCodigoDeBarras, depoisDigitoVerificador);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return codigoDeBarras;
        }
      
        private string Obter_valor_formatado(string valorDoDocumento)
        {
            string valor = valorDoDocumento.Replace(",", "");
            int tamanhoValor = valor.Length;
            int quantidadeDeZeros = 10 - tamanhoValor;
            valor = string.Format("{0}{1}", new String('0', quantidadeDeZeros), valor);
            return valor;
        }

   
        private string Obter_campo_um_da_representacao_numerica(string codigoDeBarras)
        {
            string codigoDoBanco = codigoDeBarras.Substring(0, 3);
            string codigoDaMoeda = codigoDeBarras.Substring(3, 1);
            string cincoPrimeirasPosicoesDoCampoLivre = codigoDeBarras.Substring(19, 5);
            string campoUm = string.Format("{0}{1}{2}", codigoDoBanco, codigoDaMoeda, cincoPrimeirasPosicoesDoCampoLivre);
            int digitoVerificadorCampoUm = Calcular_digito_verificador_do_campo_um_da_representacao_numerica(campoUm);
            campoUm = string.Format("{0}{1}", campoUm, digitoVerificadorCampoUm);
            campoUm = string.Format("{0}.{1}", campoUm.Substring(0, 5), campoUm.Substring(5));
            return campoUm;
        }

      
        private string Obter_campo_dois_da_representacao_numerica(string codigoDeBarras)
        {
            string posicoesSeisAQuinzeDoCampoLivre = codigoDeBarras.Substring(24, 10);
            int digitoVerificadoCampoDois = Calcular_digito_verificador_do_campo_dois_da_representacao_numerica(posicoesSeisAQuinzeDoCampoLivre);
            string campoDois = string.Format("{0}{1}", posicoesSeisAQuinzeDoCampoLivre, digitoVerificadoCampoDois);
            campoDois = string.Format("{0}.{1}", campoDois.Substring(0, 5), campoDois.Substring(5));
            return campoDois;
        }

 
        private string Obter_campo_tres_da_representacao_numerica(string codigoDeBarras)
        {
            int tamanho = codigoDeBarras.Length;

            string posicoesDezesseisAVinteECincoDoCampoLivre = codigoDeBarras.Substring(34, 10);
            int digitoVerificadorCampoTres = Calcular_digito_verificador_do_campo_tres_da_representacao_numerica(posicoesDezesseisAVinteECincoDoCampoLivre);
            string campoTres = string.Format("{0}{1}", posicoesDezesseisAVinteECincoDoCampoLivre, digitoVerificadorCampoTres);
            campoTres = string.Format("{0}.{1}", campoTres.Substring(0, 5), campoTres.Substring(5));
            return campoTres;
        }


        private string Obter_campo_quatro_da_representacao_numerica(string codigoDeBarras)
        {
            string digitoVerificadorGeral = codigoDeBarras.Substring(4, 1);
            return digitoVerificadorGeral;
        }

    
        private string Obter_campo_cinco_da_representacao_numerica(string codigoDeBarras)
        {
            string fatorDeVencimento = codigoDeBarras.Substring(5, 4);
            string valorNominal = codigoDeBarras.Substring(9, 10);
            string campoCinco = string.Format("{0}{1}", fatorDeVencimento, valorNominal);
            return campoCinco;
        }

   
        private string Obter_representacao_numerica_do_codigo_de_barras(string codigoDeBarras)
        {
            string campoUm = Obter_campo_um_da_representacao_numerica(codigoDeBarras);
            string campoDois = Obter_campo_dois_da_representacao_numerica(codigoDeBarras);
            string campoTres = Obter_campo_tres_da_representacao_numerica(codigoDeBarras);
            string campoQuatro = Obter_campo_quatro_da_representacao_numerica(codigoDeBarras);
            string campoCinco = Obter_campo_cinco_da_representacao_numerica(codigoDeBarras);
            string representacaoNumerica = string.Format("{0} {1} {2} {3} {4}", campoUm, campoDois, campoTres, campoQuatro, campoCinco);
            return representacaoNumerica;
        }

     
        private string AtualizarNossoNumeroDocumento(double codDocumento, int codPortForma)
        {
            string nossoNumero = Obter_proximo_nosso_numero_do_convenio_por_codigo_portador_forma_atualizado(codPortForma);
            string codigoModalidadeCobrancaSemRegistro = "2";
            string codigoEmissaoDoBloquetoPeloCedente = "4";
            nossoNumero = string.Format("{0}{1}{2}", codigoModalidadeCobrancaSemRegistro, codigoEmissaoDoBloquetoPeloCedente, nossoNumero);
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                cliente.contrato.AtualizarNossoNumeroCoddocumento(codDocumento, nossoNumero);
            }
                
            return nossoNumero;
        }
       
        #endregion
      
    }
}
