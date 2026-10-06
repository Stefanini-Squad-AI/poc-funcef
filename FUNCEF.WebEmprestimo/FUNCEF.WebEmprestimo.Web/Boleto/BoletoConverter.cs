using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.Web.Boleto
{
    //Campanha Desconto
    public static class BoletoConverter
    {
        public static Tipos.Boleto GetDTO(this BoletoEmprestimo boleto)
        {

            FUNCEF.Planus.WebEmprestimo.Tipos.Boleto botetoDTO = new FUNCEF.Planus.WebEmprestimo.Tipos.Boleto()
            {
                CodDocumento = boleto.CodDocumento,
                RepresentacaoNumerica = boleto.RepresentacaoNumerica,
                LocalDePagamento = boleto.LocalDePagamento,
                Beneficiario = boleto.Beneficiario,
                DataDoDocumento = boleto.DataDoDocumento,
                NumeroDoDocumento = boleto.NumeroDoDocumento,
                EspecieDoc = boleto.EspecieDoc,
                Aceite = boleto.Aceite,
                DataDeProcessamento = boleto.DataDeProcessamento,
                NumeroDaContaRespo = boleto.NumeroDaContaRespo,
                Carteira = boleto.Carteira,
                Especie = boleto.Especie,
                Quantidade = boleto.Quantidade,
                DataDeVencimento = boleto.DataDeVencimento,
                Agencia = boleto.Agencia,
                CodigoBeneficiario = boleto.CodigoBeneficiario,
                NossoNumero = boleto.NossoNumero,
                ValorDoDocumento = boleto.ValorDoDocumento,
                ValorDoDesconto = boleto.ValorDoDesconto,
                VrDocumento = (double)boleto.VrDocumento,
                NomeDaPessoa = boleto.NomeDaPessoa,
                CPF = boleto.CPF,
                Matricula = boleto.Matricula,
                Inscricao = boleto.Inscricao,
                REF = boleto.REF,
                FacEvAtiv = boleto.FacEvAtiv,
                Logradouro = boleto.Logradouro,
                Bairro = boleto.Bairro,
                Cidade = boleto.Cidade,
                Estado = boleto.Estado,
                CEP = boleto.CEP,
                CodigoBaixa = boleto.CodigoBaixa,
                CodigoDeBarras = boleto.CodigoDeBarras,
                ImagemCodigoDeBarras = boleto.ImagemCodigoDeBarras,
                Modalidade = boleto.Modalidade,
                NumeroContrato = boleto.NumeroContrato,
                DataConcessao = boleto.DataConcessao,
                ObservacoesAdicionais = boleto.ObservacoesAdicionais
            };

            return botetoDTO;
        }
    }
}