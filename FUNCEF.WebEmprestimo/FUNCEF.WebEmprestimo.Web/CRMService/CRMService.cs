using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FuncefCRM.Service;
using FuncefCRM.Transport;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Net;
using Newtonsoft.Json;
using System.Text;
using System.Configuration;
using System.Security.Policy;

namespace FUNCEF.Planus.WebEmprestimo.Web.CRMService
{
    //WO5535
    public class CRMService
    {
        public string Url { get; private set; }

        public string LinkIntegraCRM
        {
            get
            {
                try
                {
                    var link = ConfigurationManager.AppSettings["linkCRM"];

                    if (string.IsNullOrEmpty(link))
                    {
                        throw new Exception("Verifique o link do CRM no arquivo de configuração do seu sistema");
                    }

                    return link;
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao buscar o link do CRM", ex);
                }
            }
        }

        public ChamadoCRM BuscarChamado(string numeroChamado)
        {
            try
            {
                var link = LinkIntegraCRM + "/BuscarChamado";
                //JsonHelper<ChamadoCRM> jsonHelper = new JsonHelper<ChamadoCRM>(link);
                var retornoJson = LerJson(new { numeroChamado });

                return retornoJson.resultado;
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao buscar o chamado do CRM", ex);
            }
        }

        public RetornoJson<T> LerJson(object parametro)
        {
            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            httpClient.DefaultRequestHeaders.Add("TokenSistema", TokenSistema);
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            StringContent stringContent = new StringContent(JsonConvert.SerializeObject(parametro), Encoding.UTF8, "application/json");
            stringContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            HttpResponseMessage result = httpClient.PostAsync(Url, stringContent).Result;
            if (!result.IsSuccessStatusCode)
            {
                throw new CoreException(result.ReasonPhrase);
            }

            return JsonConvert.DeserializeObject<RetornoJson<T>>(result.Content.ReadAsStringAsync().Result);
        }

        public JsonHelper(string url)
        {
            Url = url;
        }
    }

    public class RetornoJson<T>
    {
        public T resultado { get; set; }

        public int qtdRegistros { get; set; }

        public string mensagem { get; set; }

        public string codNotificacao { get; set; }
    }

    public class ChamadoCRM
    {
        public string Id { get; set; }

        public string Matricula { get; set; }

        public int? IdPessoa { get; set; }

        public int? IdArea { get; set; }

        public string Titulo { get; set; }

        public string Conteudo { get; set; }

        public string Nivel { get; set; }

        public Assunto1SimplesDTO Assunto1 { get; set; }

        public Assunto2SimplesDTO Assunto2 { get; set; }

        public Assunto3DTO Assunto3 { get; set; }

        public OrigemDTO Origem { get; set; }

        public PrioridadeDTO Prioridade { get; set; }

        public SituacaoDTO Situacao { get; set; }

        public TipoDTO Tipo { get; set; }

        public string Resposta { get; set; }

        public DateTime? DataCriacao { get; set; }

        public DateTime? DataAlteracao { get; set; }

        public List<ArquivoDTO> Arquivos { get; set; }
    }
}
}