// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Nº Solicitação...: WO 18459
//Data da Alteração: 03/02/2025
//Responsável......: Leandro Pocebon
//Descrição........: Alterada busca funcionarios para lista quando
//                   "Rescisão de Contrato" ID 14 ou "Rescisão Complementar" ID 15
//--------------------------------------------------------------------------------
//Nº SIG...........: 130109
//Data da Alteração: 28/10/2022
//Responsável......: Everson Cunha
//Descrição........: Verificar se campo data não está vazio
// *****************************************************************************
//Nº SIG...........: 128334 / 128733
//Data da Alteração: 23/08/2022
//Responsável......: Everson Cunha
//Descrição........: Retorno da margem 35%
// *****************************************************************************
//Nº SIG...........: 122148
//Data da Alteração: 10/01/2022
//Responsável......: Ewerton Beltramini
//Descrição........: Descomentando a margem a 30% e comentando a margem a 35%.
//******************************************************************************
//Nº SIG...........: 120985   (Alteração comentada em atendimento ao SIG 121387)
//Data da Alteração: 25/11/2021
//Responsável......: Ewerton Beltramini
//Descrição........: Alteração para não considerar os lançamentos da APCEF/DF.
//******************************************************************************
//Nº SIG...........: 116218
//Data da Alteração: 21/05/2021
//Responsável......: Everson Cunha
//Descrição........: Alteração do cálculo do excesso de débito para considerar
//                   a margem de 35% no lugar de 30%
//******************************************************************************
//Nº SIG...........: 84696
//Data da Alteração: 19/02/2021
//Responsável......: Andre Imakawa
//Descrição........: Rotina para verificar Cessação do IR.
//******************************************************************************
//Nº SIG...........: 102705
//Data da Alteração: 02/10/2020
//Responsável......: Everson Cunha
//Descrição........: Problemas na geração de férias
//******************************************************************************
//Nº SIG...........: 99768
//Data da Alteração: 18/05/2020
//Responsável......: Everson Cunha
//Descrição........: Incluir opção se o empregado deseja ou não receber o adian-
//                   tamento do pagamento de férias
//******************************************************************************
//Nº SIG...........: 100668
//Data da Alteração: 29/06/2020
//Responsável......: Andre Imakawa
//Descrição........: Monitoramento da folha de pagamento
//******************************************************************************
//Nº SIG...........: 94268
//Data da Alteração: 13/11/2019
//Responsável......: Everson Cunha
//Descrição........: Adicionar condição para acessar a rotina Apagar Previa por
//                   funcionário
//******************************************************************************
//Rotina...........: ApagarPreviaPessoa e GerarFolhaNormal
//Nº SIG...........: 87548
//Data da Alteração: 09/07/2019
//Responsável......: Andre Imakawa
//Descrição........: Apagar Previa da Folha de Pagamento por funcionário
//******************************************************************************
//Nº SIG...........: 94225
//Data da Alteração: 12/11/2019
//Responsável......: Everson Cunha
//Descrição........: FMesRef estava ficando vazio ''
//******************************************************************************
//Rotina...........: GerarFolhaNormal, Processar
//Nº SIG...........: 93310
//Data da Alteração: 28/10/2019
//Responsável......: Darivaldo Alencar
//Descrição........: Regra 2621 alterada
//******************************************************************************
//Nº SIG...........: 33023
//Data da Alteração: 14/10/2019
//Responsável......: Everson Cunha
//Descrição........: Implementação do cálculo para a rubrica 23860.
//******************************************************************************
//Rotina...........: Processar
//Nº SIG...........: 92477
//Data da Alteração: 10/10/2019
//Responsável......: Fabio Sampaio
//Descrição........: Correção para zerar o IdPessoa no inicio do processo, pois
//                   quando o cálculo era feito para a mesma pessoa não ocorria
//                   a busca do valor correto do salário.
//******************************************************************************
//Rotina...........: GerarFolhaNormal
//Nº SIG...........: 58721
//Data da Alteração: 09/09/2019
//Responsável......: Everson Cunha
//Descrição........: Melhoria na regra de desconto/excesso de débito das
//                   parcelas de empréstimo, para que desconte até o limite
//                   da margem consignável de 30%. Atualmente o sistema só
//                   desconta 100% da parcela. Deverá descontar até o limite da
//                   margem e o restante jogar como excesso de débito.
//                   Diminuindo assim a inadimplência.
//******************************************************************************
//Rotina...........: GerarFolhaNormal
//Nº SIG...........: 73541
//Data da Alteração: 31/08/2018
//Responsável......: Darivaldo Alencar
//Descrição........: Validação de data antes de inserir contribuição
//******************************************************************************
//Rotina...........: ValidaEGravaValoresPlanos
//Nº SIG...........: 34125
//Data da Alteração: 01/06/2017
//Responsável......: Andre Imakawa
//Descrição........: Ratear a Rubrica verificando o campo FLGRATEARPORDEPENDENTE
//******************************************************************************
//Nº SIG............: 238909/18349
//Data da Alteração.: 15/02/2017
//Alteração.........: Atualizar TMPDESC, quando do lançamento de rubricas com excesso de debito
//Responsável.......: William Moreira da Silva
//Descrição.........: As rubricas de empréstimos enviadas para a folha de pagamento quando
// quando caem em excesso de débito devem refletir na TMPDESC no campo SITENVIO como "1".
//***************************************************************************************************
//Nº SIG............: 27026
//Data da Alteração.: 09/08/2016
//Alteração.........: Verificar a variavel "bMaisDeUmFavorecido" antes de FCdsRubEsp.Next
//Responsável.......: André Imakawa
//Descrição.........: Solicitamos verficação de erro ocorrido na geração da folha de férias do empregado
//                    ROBERTO RODRIGUES DA SILVA. Solicitamos urgência no atendimento por motivo do
//                    prazo para pagamento dessas férias.
//***************************************************************************************************
//Nº SIG............: 19778
//Data da Alteração.: 26/05/2016
//Alteração.........:
//Responsável.......: André Imakawa
//Descrição.........: Solicitamos acertar a rotina do cálculo da folha de pagamento
//                    referente a rubrica PENSAO ALIMENTICIA ADIANTAMENTO 13 SAL
//***************************************************************************************************
//Nº SOL............: 1019926
//Nº PPM............: 231118/17674
//Data da Alteração.: 24/08/2015
//Alteração.........: Chamando a rotina ValidaEGravaValoresPlanos na folha de rescisão.
//Responsável.......: Felipe A. Santos
//Descrição.........: gravação das rubricas Assistenciais na estrutura RETASSIST quando é gerado
//                    a folha de rescisão normal e complementar.
//***************************************************************************************************
//Rotina                : ValidaEGravaValoresPlanos
//N. Sol..........      : 246069
//N. PPM..........      : 664826
//Data da Alteração:    : 23/02/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Alterado o local de chamada da rotina de deleção da RETASSIST.
//                        Será somente acionada quando existir lançamentos das rubricas
//                        assistenciais (Saúde e Odontológica).
{***************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : SelRubDependSomenteRegra, PrepararRubEspeciais, SelLancSemIncidencia
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}
//Rotina                : ValidaEGravaValoresPlanos
//N. Sol..........      : 220895
//N. Kintana......      : 2054130
//Data da Alteração:    : 03/01/2014
//Alteração Form:       : --
//Responsável:          : Paulo Nobre
//Descrição:            : Refeito todo o conceito de atualização dos valores das rubricas
//                        assistenciais de Plano de Saúde e Odonto na tabela RETASSIST.
//                        Agora, o valor da rubrica lançada para o Titular no ano/mês,
//                        será rateado entre este e seus Dependentes. Agora a exclusão da RETASSIST
//                        sempre será feita antes dos rateios. 
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 225868
Nº KINTANA..: 2059484
Data........: 12/02/2014
Responsável.: William Moreira da Silva
Descrição...: A rotina de deleção não apaga a rubrica que foi gravada errada na geração anterior.
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 154980
Nº KINTANA..: 1197282
Data........: 02/07/2012
Responsável.: FELIPE AZEVEDO DOS SANTOS
Descrição...: Alteração na rotina AplicaDescontoExcessoDebito , Rubricas de  empréstimo descontam
              Agora Até o limite 30% , rubricas de Excesso de Debito descontam até o limite de 40%
---------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina......: ValidaEGravaValoresPlanos
Nº SOL......: 192150
Nº KINTANA..: 1891254
Data........: 28/12/2012
Responsável.: Fernando Xavier
Descrição...: Gravar na tabela RETASSIST somente se a flag FLGPLSAUDE e FLGPLODONTO estiver marcada
---------------------------------------------------------------------------------------------------
Nº SOL......: 154980
Nº KINTANA..: 1197282
Data........: 02/07/2012
Responsável.: Monica da Silva Gonzaga
Descrição...: Flag Rubricas de Cedidos e Beneficios
---------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
Rotina......: ValidaEGravaValoresPlanos
Nº SOL......: 182072
Nº KINTANA..: 1693080
Data........: 13/06/2012
Responsável.: Fernando Xavier
Descrição...: corrigir erro "Quano encontra um titular, não grava na tabela RETASSIST."
---------------------------------------------------------------------------------------------------}
{Rotina......: GeraFolhaNormal
Nº SOL......: 125633/9081
Nº KINTANA..: 1632926
Data........: 16/04/2012
Responsável.: José Roberto Marque - JRM6
Descrição...: Correção para quando for selecionada alguma rubrica, não sendo todas, não é para fazer
              o processo de excesso de débito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: GeraFolhaNormal
Nº SOL......: 150520
Nº KINTANA..: 1093864
Data........: 22/12/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para quando for selecionada alguma rubrica, não sendo todas, não é para fazer
              o processo de excesso de débito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: GeraFolhaNormal
Nº SOL......: 149480
Nº KINTANA..: 1073549
Data........: 22/12/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para salvar a situação dos campos IDLOTE, ANOMESREF, NUMOCORRENCIAS antes
              do recalculo por Excesso de Débito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: PrepararRubEspeciais, AplicaDescontoExcessoDebito, GerarFolhaNormal
Nº SOL......: 149200
Nº KINTANA..: 1063437
Data........: 15/12/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para excluir da FCdsRubEsp no processo de recalculo,
              as rubricas calculadas como excesso de débito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: GerarFolhaNormal
Nº SOL......: 148055
Nº KINTANA..: 1031910
Data........: 19/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para desfazer os lançamentos caso ocorra o recalculo por
              excesso de débito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: SelLancSemIncidencia
Nº SOL......: 147224
Nº KINTANA..: 1013674
Data........: 11/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação da Flag para Excluir as Rubricas de Excesso de Debito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: SelLancSemIncidencia; GerarFolhaNormal
Nº SOL......: 144468
Nº KINTANA..: 952342
Data........: 15/10/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: - Alteração da SelLancSemIncidencia para ignorar as rubricas de excesso de débito;
              - Alteração da GerarFolhaNormal para reprocessar o calculo quando existir um excesso
              de débito
              - Alteração de procedure para function a "AplicaDescontoExcessoDebito"
              - Exclusão da procedure IncluiValorRubricaTotalizadoExcessoDebito;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: AplicaDescontoExcessoDebito
Nº SOL......: 142253
Nº KINTANA..: 905697
Data........: 18/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio / Bruno Bastos
Descrição...: Inclusão de rubricas na rotina IncluiValorRubricaTotalizadoExcessoDebito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: GerarFolhaNormal
Nº SOL......: 141270, 126446
Nº KINTANA..: 890829, 668959
Data........: 11/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação das Rotinas
              AplicaDescontoExcessoDebito e IncluiValorRubricaTotalizadoExcessoDebito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: GerarFolhaNormal
Nº SOL......: 130502
Nº KINTANA..: 738531
Data........: 19/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção efetuada para gerar corretamente o número de parcelas descontadas no
              contracheque para as rúbricas (07170 e 07175)
---------------------------------------------------------------------------------------------------}
//Rotina: SelRubDependSomenteRegra, PrepararRubEspeciais, GerarFolhaNormal
//Nº SOL: 126964
//Nº KINTANA: 668955
//Data da Alteração: 29/01/2010
//Responsável: Marilza Colpani
//Descrição: Desvincular a flag FLGESPECIAL do módulo Folha de Pagamento,
//                 substituindo pelo flag FLGESPECIALFP, que receberá todos os
//                 valores da flag desvinculada.
//------------------------------------------------------------------------------
// Funcionalidade: AdicionaFiltroLicSemVencimentos
// Autor(a)    : Marilza Colpani
// Data        : 23/03/2010
// Pendência   : SOL 132783 KINTANA 767797
// Descricao   : Inclusão da condição "H1.DATAREAL IS NULL" para que os funcionários
//              que estão em "Licença sem Vencimentos" não sejam listados.
// Autor(a)    :  Arnaldo V. Scarin
// Data        :  14/01/2010
// Pendência   : SOL 127407 KINTANA 675286
// Descricao   : Inclusão de Filtro para que os funcionários que estão
//               em "Licença sem Vencimentos" não seja listados
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
Unit uCtrlGeraFolPagNormal;

Interface

Uses SysUtils, Controls, Classes, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
   StringListEx, uFuncoesUteisRH, uCtrlGeraFolPag, uCtrlGlobalRH, uCtrlAntec13,
   USistema, uCMMath, Dialogs, uCMFileUtils;

Const
   // Mensagens de PROCESSAMENTO
   MSG_SEL_DADOS_PESSOAS = 'Selecionando dados das Pessoas...';
   MSG_PROCESSANDO = 'Processando dados da Pessoa indicada abaixo. Aguarde...';
   MSG_INICIO_PROCESSO = 'Iniciando Processo...';
   MSG_GERACAO_OK = 'Geração da Folha de Pagamento efetuada com sucesso.';
   // Mensagens de ERRO
   MSG_ERRO_ALOCACAO_OBJETOS = '* Alocação de memória para os objetos' + CR_LF +
      'envolvidos no processo de Geração da Rescisão.' + MSG_ERRO;
   MSG_ERRO_SEM_PESSOAS = '* Não foi possível selecionar os dados da(s) Pessoa(s).' + CR_LF +
      'Verifique-os e tente novamente.';
   MSG_ERRO_SELECAO_PESSOAS = '* Na seleção dos dados da(s) Pessoa(s).' + MSG_ERRO;
   MSG_ERRO_PREPARO_LANC_SEM_INCID = '* Ao preparar Lançamentos sem incidência.' + MSG_ERRO;
   MSG_ERRO_PREPARO_RUB_DEPEND_REGRA =
      '* Ao preparar Rubricas dependentes somente de Regras/Formas de Cálculo.' + MSG_ERRO;
   MSG_ERRO_PREPARO_FERIAS = '* Ao preparar os dados das férias do Empregado ' + CR_LF;
   MSG_ERRO_PREPARO_RUB_ESPECIAIS = '* Ao carregar a lista das Rubricas Especiais.' + MSG_ERRO;
   MSG_ERRO_ALIMENTAR_PREVIA = '* Não foi possível alimentar a Prévia.' + MSG_ERRO;
   MSG_ERRO_EXCLUSAO_PREVIA = '* Na eliminação da Prévia anterior.' + MSG_ERRO;
   MSG_ERRO_CALC_RETROATIVO = '* No cálculo do Retroativo.' + MSG_ERRO;
   MSG_ERRO_GERACAO = 'Ocorreu um erro na Geração da Folha de Pagamento.' + CR_LF;

Type
   TCtrlGeraFolPagNormal = Class(TCtrlGeraFolPag)
   Private
    //FMesRef: String; //Everson Cunha - SIG94225
      Function AdicionaFiltroLicSemVencimentos(Const pSQL,
         pPeriodo: String): String;
      // Alterado por FHBS - SOL: 144468 KTN: 952342
      Function AplicaDescontoExcessoDebito: Boolean;
      // Alterado por FHBS - SOL: 126446 KTN: 668959
      //procedure AplicaDescontoExcessoDebito;
      //procedure IncluiValorRubricaTotalizadoExcessoDebito(const pIdRubrica: Integer;
      //                                                    const pVlrRubrica: Double);
      // Alterado por FHBS
      // Fim - Alterado por FHBS - SOL: 144468 KTN: 952342
      Procedure PreencheListaDependentes(Const pIdPessoa: Double);
      // SOL 220895  KTN 2054130 - Paulo Nobre
      //Procedure ValidaEGravaValoresPlanos(Const pIdTitular: String); // Felipe A. Santos SOL 231118/17674 PPM 1019926

      //Everson Cunha - SIG33023 - Início
      function ListTabReb2002 : OleVariant;
      function ListEmpregadosCalcRubP13 : OleVariant;
      procedure CalcRubP13ContRebEmpresaMes;
      //Everson Cunha - SIG33023 - Fim

   Protected
      FCtrlGlobalRH: TCtrlGlobalRH;
      FCtrlAntec13: TCtrlAntec13;

      FCdsParamRH: TCMClientDataSet;
      FCdsAntec13: TCMClientDataSet;
      FCdsAux: TCMClientDataSet;
      FCdsRubXSit: TCMClientDataSet;
      FCdsDependPessoa: TCmClientDataSet;

      //Everson Cunha - SIG33023 - Início
      FcdsTabReb2002 : TCMClientDataSet;
      FcdsCalcRubP13ContRebEmpresaMes : TCMClientDataSet;
      //Everson Cunha - SIG33023 - Fim

      FListaRubBase: TStringListEx;
      FListaRubComplem: TStringListEx;
      FListaRubResult: TStringListEx;
      FListaRubTipoCalc: TStringListEx;

      FListaResultSemBase: TStringList;

      FTotSemBase: integer;
      FQuantMesesRetroativo: integer;
      FIdMotivoPadrao: integer;
      FNumSeqFerias: integer;
      FNumRegProcessados: integer;
      FTempoDecorridoTotal: integer;
      FTempoDecorridoPessoa: integer;
      FHoraInicialPessoa: integer;

      FPercRetroativo: double;

      FDataFeriasIni: TDate;
      FDataFeriasFim: TDate;

      FGerarRetroativo: boolean;
      FSelPessoasRetroativo: boolean;
      FUsaRAD: boolean;
      FForcarGeracao13: boolean;
      FGerouFerias: boolean;
      FPodeGerarFerias: boolean;
      FGerarFeriasNaFolhaMensal: boolean; //Everson Cunha - SIG99768
      FGerouAntec13: boolean;
      FPodeGerarAntec13: boolean;
      FRADFeriasOk: boolean;

      FMsgResult: String;
      FListaEmpregado: String;
      FListaIdEmpresa: String;
      FListaIdEstab: String;
      FListaIdRubrica: String;
      FListaTipoContrato: String;
      FListaIdFuncRetroativo: String;
      FDataFer1: String;
      FDataFer2: String;
      FDataFer3: String;

      // Andre Imakawa - SIG 19778 - Inicio
      ListaFavorecido, AuxFavorecido, AuxRegistro  : String;
      bMaisDeUmFavorecido             : boolean;
      // Andre Imakawa - SIG 19778 - Fim

      FParitario : Boolean; //Everson Cunha - SIG33023

      Function ListHistoricoPessoaMes: OleVariant;
      Function ListRubXSit: OleVariant;

      // Comentado por não haver mais necessidade - SOL 220895  KTN 2054130 - Paulo Nobre
//      Procedure delRetassist(Const sidPessoa: String); //William Moreira da Silva - SOL 225868 - KINTANA 2059484

      Procedure SelDadosEmpresaAtual;
      Function SelRubDependSomenteRegra: boolean;
      Function SelLancSemIncidencia(bExcluiRubricasExcessoDebito: Boolean = False): boolean;
      Procedure InitRetroativo;

      Function GetValorRubrica(ListaIdRubrica, AnoBarraMes: String): double;

      Procedure SetFeriasParaProcessada(DataIniPer: TDate; NumSeqFerias: integer);
      Procedure SetAntec13ParaProcessada;

      Function PrepararFerias: boolean;
      Function PrepararRubEspeciais: boolean; Override;

      Procedure SetReferenciaRubDelolucaoFerias1;
      Procedure SetReferenciaRubDelolucaoFerias2;

      Function AlimentarPrevia: boolean;
      Function ApagarPrevia: boolean; Override;
      Function ApagarPreviaPessoa: boolean; // Andre Imakawa - SIG 87548
      Function CalcRetroativo(IdRubrica: String; Var ValBase: double): boolean;
      Function GerarFolhaNormal: boolean;

      Function CriarObjetos_Geracao: boolean; Override;
      Procedure DestruirObjetos_Geracao; Override;
      Function AbrirSQLFunc: boolean; Override;   

      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;
   Public
      Constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: String); Override;
      Destructor Destroy; Override;

      Procedure ValidaEGravaValoresPlanos(Const pIdTitular: String); // Felipe A. Santos SOL 231118/17674 PPM 1019926

      Function GetLinhasArquivo_SERPROS(ArqEmprestimo: boolean): String;

      Function ListFuncionarios(ListaIdEmpresa: String;
         AgrupaCCusto: boolean;
         ListaIdEstab,
         ListaCodCCusto,
         ListaIdSindicato,
         ListaSitFunc,
         ListaTipoContr: String;
         bRetiraLicSemVencto: Boolean = false;
         pPeriodo: String = ''): OleVariant;

      Function Processar(Mes, Ano, TipoCliente, IdEmpresa: integer; TipoEmpresa: String;
         Processo: integer; DataProcessamento: TDate; TipoMotivo, IdMotivo, IdMotivoPadrao,
         OpcaoPrevia: integer; DataFeriasIni, DataFeriasFim: TDate; ListaIdEmpresa, ListaIdEstab,
         ListaEmpregado, ListaIdRubrica, ListaTipoContrato: String; GerarRetroativo: boolean;
         QuantMesesRetroativo: integer; PercRetroativo: double; ListaRubBaseRetroativo,
         ListaRubComplemRetroativo, ListaRubResultRetroativo, ListaTipoCalcRubRetroativo: String;
         SelPessoasRetroativo: boolean; ListaIdFuncRetroativo: String;
         Integra_PagEletronico, Integra_CAP: boolean; DataPagamento, DataEmissao: TDateTime;
         RateioCC, CriarDocIndividual, ConsTipoDesemb: boolean;
         IdUsuario, CodTipDoc, CodPortForma, PlanoPadrao: integer;
         ContaPadrao, DiretorioArqPag: String; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean;
         PlanoPrevGlobal, PatroGlobal: integer; ListaTipoDesemb: String; UsaRAD,
         ForcarGeracao13, MantemTmpDesc: boolean; UsaLOG: boolean = false): boolean;

      Procedure CriaLog(sArquivo, sTexto : String);     // Andre Imakawa - SIG 100668
      Procedure DeletaLog(sArquivo : String);           // Andre Imakawa - SIG 100668

      Property NumRegProcessados: integer Read FNumRegProcessados;
      Property TempoDecorridoTotal: integer Read FTempoDecorridoTotal;
      Property TempoDecorridoPessoa: integer Read FTempoDecorridoPessoa;

      property MesRef : String read FMesRef write FMesRef; // Felipe A. Santos SOL 231118/17674 PPM 1019926

   End;

Implementation

Uses Db, fAguarde, uCtrlCalcRub, uCtrlFuncoesRH;

{ TCtrlGeraFolPagNormal }

Constructor TCtrlGeraFolPagNormal.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: String);
Begin
   Inherited Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

   FCtrlGlobalRH := TCtrlGlobalRH.Create;
   FCtrlAntec13 := TCtrlAntec13.Create;
End;

Destructor TCtrlGeraFolPagNormal.Destroy;
Begin
   FreeAndNil(FCtrlGlobalRH);
   FreeAndNil(FCtrlAntec13);
   Inherited;
End;

Procedure TCtrlGeraFolPagNormal.OnCreateAppServer;
Begin
   Inherited;
End;

Procedure TCtrlGeraFolPagNormal.AfterInitialize;
Begin
   Inherited;
   FCtrlGlobalRH.InitializeAs(Self);
   FCtrlAntec13.InitializeAs(Self);
End;

Procedure TCtrlGeraFolPagNormal.DoChangeDataBase;
Begin
   Inherited;
   FCtrlGlobalRH.DataBase := DataBase;
   FCtrlAntec13.DataBase := DataBase;
End;

Function TCtrlGeraFolPagNormal.CriarObjetos_Geracao: boolean;
Begin
   Try
      Result := Inherited CriarObjetos_Geracao;
      If (Result) Then
         Begin
            FCdsParamRH := TCMClientDataSet.Create(Nil);
            FCdsAntec13 := TCMClientDataSet.Create(Nil);
            FCdsRubXSit := TCMClientDataSet.Create(Nil);
            FCdsDependPessoa := TCmClientDataSet.Create(Nil);

            //Everson Cunha - SIG33023 - Início
            FcdsTabReb2002 := TCMClientDataSet.Create(Nil);
            FcdsCalcRubP13ContRebEmpresaMes := TCMClientDataSet.Create(Nil);
            //Everson Cunha - SIG33023 - Fim

            If (FGerarRetroativo) Then
               Begin
                  FListaRubBase := TStringListEx.Create;
                  FListaRubComplem := TStringListEx.Create;
                  FListaRubResult := TStringListEx.Create;
                  FListaRubTipoCalc := TStringListEx.Create;
                  FListaResultSemBase := TStringList.Create;
               End;
         End;
   Except
      On E: Exception Do
         Begin
            Result := false;
            MessageInfo := MSG_ERRO_ALOCACAO_OBJETOS + E.Message;
         End;
   End;
End;

Procedure TCtrlGeraFolPagNormal.DestruirObjetos_Geracao;
Begin
   Try
      Inherited;
      FreeAndNil(FCdsParamRH);
      FreeAndNil(FCdsAntec13);
      FreeAndNil(FCdsRubXSit);
      FreeAndNil(FCdsDependPessoa);

      //Everson Cunha - SIG33023 - Início
      FreeAndNil(FcdsTabReb2002);
      FreeAndNil(FcdsCalcRubP13ContRebEmpresaMes);
      //Everson Cunha - SIG33023 - Fim

      If (FGerarRetroativo) Then
         Begin
            FreeAndNil(FListaRubBase);
            FreeAndNil(FListaRubComplem);
            FreeAndNil(FListaRubResult);
            FreeAndNil(FListaRubTipoCalc);
            FreeAndNil(FListaResultSemBase);
         End;
   Except
   End;
End;

Function TCtrlGeraFolPagNormal.AbrirSQLFunc: boolean;
Var
   _SQL: TStringList;
Begin
   Result := Inherited AbrirSQLFunc;


   Try
      _SQL := TStringList.Create;
      With (_SQL) Do
         Begin
            Clear;
            Add('SELECT');
            Add('  F.IDSITFUNC, F.IDPESSOA, F.IDEMPRESA, F.MATRICULA, SF.TIPOSIT,');
            Add('  PF.NUMDEPIRRF, EP.NOMEEMPRESA, F.CODCENTROCUSTO, P.NOME, F.DATAADMISSAO');
            Add('FROM');
            Add('  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, SITFUNC SF, EMPRESAPROP EP');
            Add('WHERE');

            If (Pos(',', FListaIdEmpresa) > 0) Then
               Add('  (EP.IDPESSOA    IN (' + FListaIdEmpresa + ')) AND')
            Else
               Add('  (EP.IDPESSOA     = ' + FListaIdEmpresa + ') AND');

            // WO18459 Leandro inicio
            if (FIdMotivo = 14) or (FIdMotivo = 15) then
              Add('  (SF.TIPOSIT     = ''D'') AND')
            else
              Add('  (SF.TIPOSIT     <> ''D'') AND');
            //WO18459 Leandro Fim

            Add('  (SF.IDSITFUNC    = F.IDSITFUNC) AND');

            If (Trim(FListaEmpregado) <> '') Then
               If (Pos(',', FListaEmpregado) > 0) Then
                  Add('  (F.IDPESSOA     IN (' + FListaEmpregado + ')) AND')
               Else
                  Add('  (F.IDPESSOA      = ' + FListaEmpregado + ') AND');

            If (Trim(FListaTipoContrato) <> '') Then
               If (Pos(',', FListaTipoContrato) > 0) Then
                  Add('  (F.TIPOCONTRATO IN (' + QuotedListaString(FListaTipoContrato, ',') + ')) AND')
               Else
                  Add('  (F.TIPOCONTRATO  = ' + QuotedListaString(FListaTipoContrato, ',') + ') AND');

            If (Pos(',', FListaIdEstab) > 0) Then
               Add('  (F.IDESTAB      IN (' + FListaIdEstab + ')) AND')
            Else
               Add('  (F.IDESTAB       = ' + FListaIdEstab + ') AND');

            Add('  (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') <= ' + QuotedStr(FMesRef) + ') AND');
            Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
            Add('  (F.IDPESSOA      = P.IDPESSOA) AND');
            Add('  (EP.IDPESSOA     = F.IDEMPRESA)');
            Add('ORDER BY');
            Add('  IDEMPRESA, MATRICULA');
            //SaveToFile('c:\qry.txt');
            SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\qry.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         End;
      DoProgresso([MSG_SEL_DADOS_PESSOAS]);
      FCdsFunc.Close;

      FCdsFunc.Data := GetDataPacket(_SQL.Text);
      DoProgresso(['', GetTempoDecorrido, 0, '', FCdsFunc.RecordCount]);

      Result := Not (FCdsFunc.IsEmpty);
      If Not (Result) Then
         MessageInfo := MSG_ERRO_SEM_PESSOAS;

      _SQL.Free;
   Except
      On E: Exception Do
         MessageInfo := MSG_ERRO_SELECAO_PESSOAS + E.Message;
   End;
End;

Function TCtrlGeraFolPagNormal.GetLinhasArquivo_SERPROS(ArqEmprestimo: boolean): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);
   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  LPAD(DP.NUMDOCUMENTO,9,''0'') ||' + CR_LF +
      '    SUBSTR(H.MES,6,2) || SUBSTR(H.MES,1,4) ||' + CR_LF +
      '    LPAD(H.CODPROVDESC,4,''0'') ||' + CR_LF +
      '    LPAD(TO_CHAR(H.VALORPROVENTO * 100),12,''0'') AS LINHA' + CR_LF +
      'FROM' + CR_LF +
      '  HISTRUBSAL H, DOCPESSOA DP, PROVDESC PD' + CR_LF +
      'WHERE' + CR_LF +
      '  (DP.IDDOCUMENTO = 145) AND' + CR_LF +
      '  (PD.CODRUBCLT   = ' + IFF(ArqEmprestimo, '89999', '89998') + ') AND' + CR_LF +
      '  (H.MES          = ' + QuotedStr(FMesRef) + ') AND' + CR_LF +
      '  (H.IDMOTIVO     = ' + IntToStr(FIdMotivo) + ') AND' + CR_LF +
      '  (H.IDRUBRICA    = PD.IDPROVENTO) AND' + CR_LF +
      '  (H.IDPESSOA     = DP.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  LINHA');

   Result := _CdsAux.FieldByName('LINHA').asString;
   _CdsAux.Free;
End;

Function TCtrlGeraFolPagNormal.ListFuncionarios(ListaIdEmpresa: String;
   AgrupaCCusto: boolean;
   ListaIdEstab,
   ListaCodCCusto,
   ListaIdSindicato,
   ListaSitFunc,
   ListaTipoContr: String;
   bRetiraLicSemVencto: Boolean;
   pPeriodo: String): OleVariant;
Begin
   FSQL :=
      'SELECT' + CR_LF +
      '  F.IDPESSOA, F.MATRICULA, PF.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA PF, ' + CR_LF;

   If ((ListaIdSindicato <> '') And (AgrupaCCusto)) Then
      FSQL := FSQL + 'PESSOAFISICA PFIS,' + CR_LF;

   FSQL := FSQL +
      ' FUNCIONARIO F, SITFUNC ST' + CR_LF +
      'WHERE' + CR_LF +
      '  (ST.TIPOSIT  <> ''D'') AND' + CR_LF;

   If ((ListaIdSindicato <> '') And (AgrupaCCusto)) Then
      Begin
         FSQL := FSQL + '  (F.IDPESSOA = PFIS.IDPESSOA) AND' + CR_LF;

         If (Pos(',', ListaIdSindicato) > 0) Then
            FSQL := FSQL + '  (PFIS.IDSINDICATO  IN (' + ListaIdSindicato + ')) AND' + CR_LF
         Else
            FSQL := FSQL + '  (PFIS.IDSINDICATO   = ' + ListaIdSindicato + ') AND' + CR_LF;
      End;

   If (Pos(',', ListaIdEmpresa) > 0) Then
      FSQL := FSQL + '  (F.IDEMPRESA      IN (' + ListaIdEmpresa + ')) AND' + CR_LF
   Else
      FSQL := FSQL + '  (F.IDEMPRESA       = ' + ListaIdEmpresa + ') AND' + CR_LF;

   If (ListaIdEstab <> '') Then
      If (Pos(',', ListaIdEstab) > 0) Then
         FSQL := FSQL + '  (F.IDESTAB        IN (' + ListaIdEstab + ')) AND' + CR_LF
      Else
         FSQL := FSQL + '  (F.IDESTAB         = ' + ListaIdEstab + ') AND' + CR_LF;

   If (Pos(',', ListaTipoContr) > 0) Then
      FSQL := FSQL + '  (F.TIPOCONTRATO    IN (' + QuotedListaString(ListaTipoContr, ',') + ')) AND' + CR_LF
   Else
      FSQL := FSQL + '  (F.TIPOCONTRATO     = ' + QuotedListaString(ListaTipoContr, ',') + ') AND' + CR_LF;

   If (AgrupaCCusto) Then
      Begin
         If (ListaSitFunc <> '') Then
            If (Pos(',', ListaSitFunc) > 0) Then
               FSQL := FSQL + '  (ST.TIPOSIT        IN (' + QuotedListaString(ListaSitFunc, ',') + ')) AND' + CR_LF
            Else
               FSQL := FSQL + '  (ST.TIPOSIT         = ' + QuotedListaString(ListaSitFunc, ',') + ') AND' + CR_LF;

         If (ListaCodCCusto <> '') Then
            If (Pos(',', ListaCodCCusto) > 0) Then
               FSQL := FSQL + '  (F.CODCENTROCUSTO  IN (' + QuotedListaString(ListaCodCCusto, ',') + ')) AND' + CR_LF
            Else
               FSQL := FSQL + '  (F.CODCENTROCUSTO   = ' + QuotedListaString(ListaCodCCusto, ',') + ') AND' + CR_LF;
      End;

   // Alterado por Arnaldo V. Scarin em 12/01/2010
   // SOL 127407 KTN 675286
   // Inclusão de Filtro para que os funcionários que estão
   // em "Licença sem Vencimentos" não seja listados
   If bRetiraLicSemVencto Then
      FSQL := AdicionaFiltroLicSemVencimentos(FSQL, pPeriodo);

   FSQL := FSQL +
      '  (ST.IDSITFUNC      = F.IDSITFUNC) AND' + CR_LF +
      '  (F.IDPESSOA        = PF.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  UPPER(NOME)';

   Result := GetDataPacket(FSQL);
End;

Function TCtrlGeraFolPagNormal.AdicionaFiltroLicSemVencimentos(Const pSQL,
   pPeriodo: String): String;
Begin
   Result := pSQl +
      '    Not Exists (SELECT 1' + #13#10 +
      '                FROM PESSOA PF1,FUNCIONARIO F1,SITFUNC ST1,HSTASMED H1' + #13#10 +
      '                WHERE (ST1.TIPOSIT = ''F'')' + #13#10 +
      '                  AND (   (ST1.DESCRICAO = ''LICENCA SEM VENCIMENTOS'')' + #13#10 +
      '                       OR (ST1.IDSITFUNC = 102) )' + #13#10 +
      '                  AND (F1.IDESTAB = f.IDESTAB)' + #13#10 +
      '                  AND (F1.IDPESSOA = F.IDPESSOA)' + #13#10 +
      '                  AND (H1.IDPESSOA = F1.IDPESSOA)' + #13#10 +
      '                  AND (ST1.IDSITFUNC = F1.IDSITFUNC)' + #13#10 +
      '                  AND (F1.IDPESSOA = PF1.IDPESSOA)' + #13#10 +
      '                  AND (TO_CHAR(F1.DATADESLIGAMENTO,''YYYYMM'') <= ' + QuotedStr(pPeriodo) + ')' + #13#10 +
      //       '                  AND (TO_CHAR(H1.DATAREAL,''YYYYMM'') >= '+ QuotedStr(pPeriodo) + ') ) AND' + #13#10;
//Marilza Colpani - SOL 132783/KTN 767797
// Inclusão da condição "H1.DATAREAL IS NULL" para que os funcionários que estão
// em "Licença sem Vencimentos" não seja listados.
//            '                AND (TO_CHAR(H1.DATAREAL,''YYYYMM'') >= '+ QuotedStr(pPeriodo) + ') ) AND' + #13#10;
   '                  AND ( (TO_CHAR(H1.DATAREAL,''YYYYMM'') >= ' + QuotedStr(pPeriodo) + ') OR H1.DATAREAL IS NULL) ) AND' + #13#10;
End;

Function TCtrlGeraFolPagNormal.SelLancSemIncidencia(bExcluiRubricasExcessoDebito: Boolean): boolean;
Begin
   Try
      FSQL :=
         'SELECT' + CR_LF +
         '  RI.IDPESSOA, RI.IDEMPRESA, RI.IDRUBRICA, RI.NUMOCORRENCIAS,' + CR_LF +
         '  RI.SEQRUBRICAINDIV, RI.IDFAVORECIDO, NVL(RI.VALORRUBRICA,0.00) AS VALORRUBRICA,' + CR_LF +
         '  RI.ANOMESINICIO, RI.FLGPERMANENTE, RI.PARCELAS,' + CR_LF;
      // inicio - edilaine - SOL 191668 / KTN 1820235 - troca PD. por RXE.
      Case (FTipoMotivo) Of
         {FOLHA_NORMAL,
            FOLHA_ESPECIAL: FSQL := FSQL + '  RI.IDREGRACALCULO,' + CR_LF;}
         FOLHA_NORMAL  : FSQL := FSQL + '  RI.IDREGRACALCULO,' + CR_LF;
         FOLHA_ESPECIAL: FSQL := FSQL + '  NVL(RXE.IDREGRAOUTROS, RI.IDREGRACALCULO) AS IDREGRACALCULO,' + CR_LF;
         FOLHA_FERIAS  : FSQL := FSQL + '  NVL(RXE.IDREGRAFERIAS, RI.IDREGRACALCULO) AS IDREGRACALCULO,' + CR_LF;
         FOLHA_13SAL   : FSQL := FSQL + '  NVL(RXE.IDREGRA13, RI.IDREGRACALCULO) AS IDREGRACALCULO,' + CR_LF;
      End;

      FSQL := FSQL +
         '  PD.DESCRICAO, NVL(RXE.FLGDECIMOTERCEIRO,0) FLGDECIMOTERCEIRO, NVL(RXE.FLGFERIAS,0) FLGFERIAS, ' + CR_LF +
         '  NVL(RXE.FLGSALFAMILIA,0) FLGSALFAMILIA, ' + CR_LF +
         '  PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF, PD.FLGDESCONTO, PD.FLGIRRF,' + CR_LF +
         '  PD.FLGASSISTENCIAL,' + CR_LF +
         '  RXE.IDREGRAFERIAS, RXE.IDREGRA13, PD.CODRUBCLT, F.IDPESSOA, RP.CODPROVDESC' + CR_LF +
      // fim - edilaine - SOL 191668 / KTN 1820235 - troca PD. por RXE.
         'FROM' + CR_LF +
         '  FUNCIONARIO F, PROVDESC PD, RUBRICAINDIV RI, RUBRICAXPESS RP, VW_RUBXEVENTO RXE ' + CR_LF +  //edilaine - SOL 191668 / KTN 1820235 - inclusao vw_rubxevento
         'WHERE' + CR_LF +
         '  (F.IDPESSOA         = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
         '  (RI.IDPESSOA        = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
         '  (RI.ANOMESINICIO   <= ' + QuotedStr(FMesRef) + ') AND' + CR_LF +
         '  (PD.FLGCONSTAFOLHA  = 1) AND' + CR_LF +
         '  (RI.FLGTPRUBMANUT   = ''2'') AND' + CR_LF +
         '  ((RI.FLGPERMANENTE  = 1) OR' + CR_LF +
         '   (RI.NUMOCORRENCIAS < RI.PARCELAS)) AND' + CR_LF +
         '  (RP.IDPESSOA        = ' + FloatToStr(FIdEmpresa) + ') AND' + CR_LF +
         '  (RP.IDRUBRICA       = PD.IDPROVENTO) AND' + CR_LF +

         '  (PD.IDPROVENTO      = RXE.IDPROVENTO(+)) AND' + CR_LF +      //edilaine - SOL 191668 / KTN 1820235 - inclusao vw_rubxevento

         '  (RI.IDRUBRICA NOT  IN (SELECT DISTINCT IDRUBSECUND FROM RUBXRUB)) AND' + CR_LF +
         '  (RI.IDRUBRICA       = PD.IDPROVENTO)';

      If (FListaIdRubrica <> '') Then
         Begin
            FSQL := FSQL + ' AND' + CR_LF;

            If (Pos(',', FListaIdRubrica) > 0) Then
               FSQL := FSQL + '  ((RI.IDRUBRICA IN (' + FListaIdRubrica + ')) OR' + CR_LF
            Else
               FSQL := FSQL + '  ((RI.IDRUBRICA  = ' + FListaIdRubrica + ') OR' + CR_LF;

            FSQL := FSQL +
               '   (RI.IDRUBRICA IN (SELECT DISTINCT IDRUBPRINC' + CR_LF +
               '                     FROM   RUBXRUB' + CR_LF;

            If (Pos(',', FListaIdRubrica) > 0) Then
               FSQL := FSQL + '                     WHERE  (IDRUBSECUND IN (' + FListaIdRubrica + ')))))'
            Else
               FSQL := FSQL + '                     WHERE  (IDRUBSECUND  = ' + FListaIdRubrica + '))))';
         End;

      //Everson Cunha - SIG58721 - Início
      // Alterado por FHBS - SOL: 144468 KTN: 952342
      // Ignorando as Rubricas de Excesso de Débito
      {If bExcluiRubricasExcessoDebito Then // Alterado por FHBS - SOL: 147224 KTN: 1013674
         Begin
            FSQL := FSQL + ' AND ' + CR_LF;
            FSQL := FSQL + '  NOT EXISTS (SELECT 1 FROM ' + FNomeTabela + ' H' + CR_LF +
               '               WHERE H.IDPESSOA      = ' + FloatToStr(FIdPessoa) + CR_LF +
               '                 AND H.MES           = ' + QuotedStr(FMesRef) + CR_LF +
               '                 AND H.IDPESSJUR     = ' + IntToStr(FIdEmpresa) + CR_LF +
               '                 AND H.IDMOTIVO      = ' + IntToStr(FIdMotivo) + CR_LF +
               '                 AND H.IDRUBRICA     = PD.IDPROVENTOEXCESSODEB' + CR_LF +
               '                 AND H.VALORPROVENTO = RI.VALORRUBRICA' + CR_LF +
               '                 AND H.' + CAMPO_SEQ_ORIGINAL + ' = RI.SEQRUBRICAINDIV)';
         End;}
      // Fim - Alterado por FHBS - SOL: 144468 KTN: 952342

      If bExcluiRubricasExcessoDebito Then
      begin
        FSQL := FSQL +
        '   AND RI.IDRUBRICA NOT IN' + CR_LF +
        '       (SELECT IDPROVENTOEXCESSODEB' + CR_LF +
        '          FROM PROVDESC' + CR_LF +
        '         WHERE FLGEXCESSODEB = 1' + CR_LF +
        '           AND IDPROVENTOEXCESSODEB IS NOT NULL   ' + CR_LF +
        '   UNION ALL                                      ' + CR_LF +
        '   SELECT                                         ' + CR_LF +
        '     TI.IDPROVENTO                                ' + CR_LF +
        '   FROM                                           ' + CR_LF +
        '     TMPDESC TI                                   ' + CR_LF +
        '   WHERE                                          ' + CR_LF +
        '     TI.IDPESSOA        = ' + FloatToStr(FIdPessoa) + CR_LF +
        '     AND TI.MESCOBRANCA = ' + QuotedStr(FMesRef)    + CR_LF +
        '   UNION ALL                                      ' + CR_LF +
        '   SELECT IDPROVENTO                              ' + CR_LF +
        '     FROM PROVDESC                                ' + CR_LF +
        '    WHERE NVL(FLGEMPRESTIMOFINAN, 0) = 1 )        ';
      end;
      //Everson Cunha - SIG58721 - Fim

      FCdsAux.Close;
      FCdsAux.Data := GetDataPacket(FSQL);
      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := MSG_ERRO_PREPARO_LANC_SEM_INCID + E.Message;
            Result := false;
         End;
   End;
End;

Function TCtrlGeraFolPagNormal.ListHistoricoPessoaMes: OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  H.VALORPROVENTO, H.IDPESSJUR, H.IDPESSOA, H.MES,' + CR_LF +
      '  H.IDRUBRICA, H.SEQRUBRICA, H.' + CAMPO_SEQ_ORIGINAL + ', PD.*' + CR_LF +
      'FROM' + CR_LF +
      '  ' + FNomeTabela + ' H, PROVDESC PD' + CR_LF +
      'WHERE' + CR_LF +
      '  (H.IDPESSOA  = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
      '  (H.MES       = ' + QuotedStr(FMesRef) + ') AND' + CR_LF +
      '  (H.IDMOTIVO  = ' + IntToStr(FIdMotivo) + ') AND' + CR_LF +
      '  (H.IDPESSJUR = ' + IntToStr(FIdEmpresa) + ') AND' + CR_LF +
      '  (H.IDRUBRICA = PD.IDPROVENTO)');
End;

Function TCtrlGeraFolPagNormal.ListRubXSit: OleVariant;
Begin
   Result := GetDataPacket('SELECT IDPROVENTO, IDSITFUNC FROM RUBXSIT');
End;

Procedure TCtrlGeraFolPagNormal.SelDadosEmpresaAtual;
Begin
   If (FCdsFunc.FieldByName('IDEMPRESA').asInteger <> FIdEmpresa) Then
      Begin
         FIdEmpresa := FCdsFunc.FieldByName('IDEMPRESA').asInteger;

         SelDadosIntegracaoEmpresa;

         FMsgResult := CR_LF +
            'Empresa: ' + AnsiUpperCase(FCdsFunc.FieldByName('NOMEEMPRESA').asString) + CR_LF +
            Replicate('-', 50) + CR_LF;

         DoProgresso(['', '', 0, '', 0, 0, FMsgResult]);
      End;
End;

Function TCtrlGeraFolPagNormal.SelRubDependSomenteRegra: boolean;
Var
   sAux: String;
Begin
   Try
      FSQL :=
         'SELECT DISTINCT' + CR_LF +
         '  PD.IDPROVENTO AS IDRUBRICA, PD.NUMPRIORIDADE, PD.NUMPRIORIDESC, PD.CODRUBCLT,' + CR_LF +
         '  PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF, PD.FLGDESCONTO, PD.FLGIRRF,' + CR_LF +
         //Marilza Colpani - SOL 126964/KTN 668955
//      '  PD.FLGESPECIAL, PD.FLGCONSTAFOLHA, PD.FLGDECIMOTERCEIRO, PD.FLGFERIAS,' +CR_LF+
         //inicio - edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
         '  PD.FLGESPECIALFP, PD.FLGCONSTAFOLHA, NVL(RXE.FLGDECIMOTERCEIRO,0) FLGDECIMOTERCEIRO, NVL(RXE.FLGFERIAS,0) FLGFERIAS, ' + CR_LF +
         '  NVL(RXE.FLGSALFAMILIA,0) FLGSALFAMILIA, NVL(RXE.FLGRESCISAO,0) FLGRESCISAO, PD.IDREGRA, RXE.IDREGRAFERIAS,' + CR_LF +
         '  PD.FLGASSISTENCIAL,' + CR_LF +
         '  RXE.IDREGRA13, 0 AS FLGPERMANENTE, 1 AS PARCELAS, 0 AS NUMOCORRENCIAS,' + CR_LF +
         //fim - edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
         '  0.00 AS VALORRUBRICA, 1 AS SEQRUBRICAINDIV, RP.CODPROVDESC,' + CR_LF +
         '  ' + FloatToStr(FIdPessoa) + ' AS IDPESSOA,' + CR_LF +
         '  ' + IntToStr(FIdEmpresa) + ' AS IDEMPRESA,' + CR_LF +
         '  ' + QuotedStr(FMesRef) + ' AS ANOMESINICIO,' + CR_LF;

      Case (FTipoMotivo) Of
         // inicio - edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
         {FOLHA_NORMAL,
            FOLHA_ESPECIAL: FSQL := FSQL + '  PD.IDREGRA AS IDREGRACALCULO' + CR_LF;  }
         FOLHA_NORMAL  : FSQL := FSQL + '  PD.IDREGRA AS IDREGRACALCULO' + CR_LF;
         FOLHA_ESPECIAL: FSQL := FSQL + '  NVL(RXE.IDREGRAOUTROS, PD.IDREGRA) AS IDREGRACALCULO' + CR_LF;
         FOLHA_FERIAS  : FSQL := FSQL + '  NVL(RXE.IDREGRAFERIAS, PD.IDREGRA) AS IDREGRACALCULO' + CR_LF;
         FOLHA_13SAL   : FSQL := FSQL + '  NVL(RXE.IDREGRA13, PD.IDREGRA) AS IDREGRACALCULO' + CR_LF;
         // fim- edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
      End;

      FSQL := FSQL +
         'FROM' + CR_LF +
         '  PROVDESC PD, RUBRICAXPESS RP, VW_RUBXEVENTO RXE ' + CR_LF;   //edilaine - SOL 191668 / KTN 1820235 - inclui VW_RUBXEVENTO

      Case (FTipoMotivo) Of
         FOLHA_FERIAS: sAux := 'FLGFERIAS';
         FOLHA_13SAL: sAux := 'FLGDECIMOTERCEIRO';
         //inicio - edilaine - SOL 191668 / KTN 1820235
         //FOLHA_ESPECIAL: If FIdMotivo = 68 Then sAux := 'FLGCEDIDOS'; // Monica
         FOLHA_ESPECIAL: sAux := 'FLGOUTROS';
         //fim - edilaine - SOL 191668 / KTN 1820235
      End;

      If (FTipoMotivo In [FOLHA_FERIAS, FOLHA_13SAL]) Or
         ((FTipoMotivo = FOLHA_ESPECIAL) {And (FIdMotivo = 68)}) Then // Monica    //edilaine - SOL 191668 / KTN 1820235 - comentado
      begin
         FSQL := FSQL +
            ', (SELECT RR.IDRUBPRINC' + CR_LF +
            '   FROM   RUBXRUB RR, PROVDESC PD' + CR_LF +
            //inicio - edilaine - SOL 191668 / KTN 1820235 - incluir vw_rubxevento
            {'   WHERE  (PD.' + sAux + ' = 1) AND' + CR_LF + }
            '    WHERE  (PD.IDPROVENTO = RR.IDRUBSECUND) '+ CR_LF +
            '      AND  exists (select 1 from  RUBXEVENTO RXE          '+ CR_LF +
            '                    where PD.IDPROVENTO = RXE.IDPROVENTO '+ CR_LF+
            '                      and RXE.IDMOTIVO = '+IntToStr(FIdMotivo)+' ) ' + CR_LF;
            //fim - edilaine - SOL 191668 / KTN 1820235 - incluir vw_rubxevento}
         FSQL := FSQL +
            '  ) RUB_RUB' + CR_LF;
      end;

      FSQL := FSQL + 'WHERE' + CR_LF;

      Case (FTipoMotivo) Of
         // inicio - edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
         {FOLHA_NORMAL,
            FOLHA_ESPECIAL: FSQL := FSQL + '  (PD.IDREGRA IS NOT NULL) AND' + CR_LF; }
         FOLHA_NORMAL  : FSQL := FSQL + '  (PD.IDREGRA IS NOT NULL) AND' + CR_LF;
         FOLHA_ESPECIAL: FSQL := FSQL + '  (NVL(RXE.IDREGRAOUTROS, PD.IDREGRA) IS NOT NULL) AND' + CR_LF;
         FOLHA_FERIAS  : FSQL := FSQL + '  (NVL(RXE.IDREGRAFERIAS, PD.IDREGRA) IS NOT NULL) AND' + CR_LF;
         FOLHA_13SAL   : FSQL := FSQL + '  (NVL(RXE.IDREGRA13, PD.IDREGRA) IS NOT NULL) AND' + CR_LF;
         // inicio - edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
      End;

      FSQL := FSQL +
         '  (RP.IDPESSOA        = ' + IntToStr(FIdEmpresa) + ') AND' + CR_LF +
         //Marilza Colpani - SOL 126964/KTN 668955
//      '  (PD.FLGESPECIAL     > 0) AND' +CR_LF+
         '  (PD.FLGESPECIALFP     > 0) AND' + CR_LF +
         '  (PD.NUMPRIORIDADE  IS NOT NULL) AND' + CR_LF +
         '  (PD.IDPROVENTO      = RP.IDRUBRICA) AND' + CR_LF +
         '  (PD.IDPROVENTO      = RXE.IDPROVENTO(+)) AND' + CR_LF +   //edilaine - SOL 191668 / KTN 1820235
         '  (PD.IDPROVENTO NOT IN (SELECT DISTINCT IDRUBSECUND FROM RUBXRUB)) AND' + CR_LF;

      Case (FTipoMotivo) Of
         FOLHA_NORMAL,
            FOLHA_ESPECIAL:
            Begin
               //inicio - edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
               If (FIdMotivo = FIdMotivoPadrao) Then
                  FSQL := FSQL + '  (RXE.FLGSALFAMILIA   = 1)'+ CR_LF
               Else
                  {FSQL := FSQL + '  (PD.FLGSALFAMILIA   = 0)';}
                  FSQL := FSQL + ' ( (exists (select 1 from  RUBXEVENTO r1      ' + CR_LF+
                                 '             where pd.IDPROVENTO = r1.IDPROVENTO ' + CR_LF+
                                 '               and r1.IDMOTIVO = '+IntToStr(FIdMotivo) + CR_LF+
                                 '           )) ' + CR_LF+
                                 '   OR (PD.IDPROVENTO   = RUB_RUB.IDRUBPRINC) )';

               //inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
               {If FIdMotivo = 68 Then
                  FSQL := FSQL +
                     '  AND ((RXE.' + sAux + '   = 1) OR' + CR_LF +
                     '   (PD.IDPROVENTO   = RUB_RUB.IDRUBPRINC))';
               }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado
            End;
         FOLHA_FERIAS,
            FOLHA_13SAL: FSQL := FSQL +
            '  ((RXE.' + sAux + '   = 1) OR' + CR_LF +              //edilaine - SOL 191668 / KTN 1820235 - trocar PD. por RXE.
               '   (PD.IDPROVENTO   = RUB_RUB.IDRUBPRINC))';
      End;

      If (FListaIdRubrica <> '') Then
         Begin
            FSQL := FSQL + ' AND' + CR_LF;

            If (Pos(',', FListaIdRubrica) > 0) Then
               FSQL := FSQL + '  ((PD.IDPROVENTO    IN (' + FListaIdRubrica + ')) OR' + CR_LF
            Else
               FSQL := FSQL + '  ((PD.IDPROVENTO     = ' + FListaIdRubrica + ') OR' + CR_LF;

            FSQL := FSQL +
               '   (PD.IDPROVENTO    IN (SELECT DISTINCT IDRUBPRINC' + CR_LF +
               '                         FROM   RUBXRUB' + CR_LF;

            If (Pos(',', FListaIdRubrica) > 0) Then
               FSQL := FSQL + '                         WHERE  (IDRUBSECUND IN (' + FListaIdRubrica + ')))))'
            Else
               FSQL := FSQL + '                         WHERE  (IDRUBSECUND  = ' + FListaIdRubrica + '))))';
         End;

      FSQL := FSQL + CR_LF +
         'ORDER BY' + CR_LF +
         '  PD.NUMPRIORIDADE, PD.NUMPRIORIDESC, PD.IDPROVENTO';

      FCdsAux.Close;
      FCdsAux.Data := GetDataPacket(FSQL);
      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := MSG_ERRO_PREPARO_RUB_DEPEND_REGRA + E.Message;      
            Result := false;
         End;
   End;
End;

Procedure TCtrlGeraFolPagNormal.InitRetroativo;
Var
   c: integer;
Begin
   FTotSemBase := 0;
   If (FGerarRetroativo) Then
      Begin
         For c := 0 To FListaRubBase.Count - 1 Do
            Begin
               If (Trim(FListaRubBase.GetFieldItem(c, 2)) = 'XXXXXXXXXX') Then
                  Begin
                     Inc(FTotSemBase);
                     FListaResultSemBase.Add(Trim(FListaRubResult.GetFieldItem(c, 2)));
                  End;
            End;
      End;
End;

Function TCtrlGeraFolPagNormal.GetValorRubrica(ListaIdRubrica, AnoBarraMes: String): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);
   _CdsAux.Data := GetDataPacket(
      'SELECT' + CR_LF +
      '  SUM(VALORPROVENTO) AS VALOR' + CR_LF +
      'FROM' + CR_LF +
      '  HISTRUBSAL' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDPESSOA   = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
      '  (MES        = ' + QuotedStr(AnoBarraMes) + ') AND' + CR_LF +
      IFF(Pos(',', ListaIdRubrica) > 0,
      '  (IDRUBRICA IN (' + ListaIdRubrica + '))',
      '  (IDRUBRICA  = ' + ListaIdRubrica + ')'));

   Result := _CdsAux.FieldByName('VALOR').asFloat;
   _CdsAux.Free;
End;

Procedure TCtrlGeraFolPagNormal.SetFeriasParaProcessada(DataIniPer: TDate;
   NumSeqFerias: integer);
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);
   _CdsAux.Data := GetDataPacket(
      'SELECT FLGOCORRIDA' + CR_LF +
      'FROM   FERIAS' + CR_LF +
      'WHERE  (IDPESSOA         = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
      '       (INIPERIODOFERIAS = TO_DATE(' + QuotedStr(DateToStr(DataIniPer)) + ',''DD/MM/YYYY'')) AND' + CR_LF +
      '       (NUMSEQ           = ' + IntToStr(NumSeqFerias) + ')');

   If Not (_CdsAux.IsEmpty) Then
      ExecSQL(
         'UPDATE FERIAS' + CR_LF +
         'SET    FLGOCORRIDA = 1' + CR_LF +
         'WHERE  (IDPESSOA         = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
         '       (INIPERIODOFERIAS = TO_DATE(' + QuotedStr(DateToStr(DataIniPer)) + ',''DD/MM/YYYY'')) AND' + CR_LF +
         '       (NUMSEQ           = ' + IntToStr(NumSeqFerias) + ')');

   _CdsAux.Free;
End;

Procedure TCtrlGeraFolPagNormal.SetAntec13ParaProcessada;
Begin
   If (FCdsAntec13.Locate('IDPESSOA', FIdPessoa, [])) Then
      ExecSQL(
         'UPDATE ANTECIP13' + CR_LF +
         'SET    FLGOCORRIDA = 1' + CR_LF +
         'WHERE  (IDPESSOA = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
         '       (ANO      = ' + FCdsAntec13.FieldByName('ANO').asString + ') AND' + CR_LF +
         '       (MES      = ' + FCdsAntec13.FieldByName('MES').asString + ')');
End;

Function TCtrlGeraFolPagNormal.PrepararFerias: boolean;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   Try
      FSQL :=
         'SELECT' + CR_LF +
         '  FR.INIPERIODOFERIAS, FR.INIGOZOFERIAS,' + CR_LF +
         '  FR.FIMGOZOFERIAS, FR.NUMSEQ, FR.FLGOCORRIDA' + CR_LF +
         '  , FR.FLGADIANTAPAGTOFERIAS '; //Everson Cunha - SIG 99768

      If (FUsaRAD) Then
         FSQL := FSQL + ', RAD.FLGOK'
      Else
         FSQL := FSQL + ', ''N'' AS FLGOK';

      FSQL := FSQL + CR_LF +
         'FROM' + CR_LF +
         '  FERIAS FR, PARAMRH PR';

      If (FUsaRAD) Then
         FSQL := FSQL + ', RADINSTPROCESSO RAD';

      FSQL := FSQL + CR_LF +
         'WHERE' + CR_LF +
         '  (FR.IDPESSOA    = ' + FloatToStr(FIdPessoa) + ') AND' + CR_LF +
         //'  (FR.FLGOCORRIDA = 0) AND' + CR_LF;    //Everson Cunha - SIG99768
         '  ((FR.FLGOCORRIDA = 0) or (FR.FLGOCORRIDA = 1 and FR.FLGADIANTAPAGTOFERIAS = ''0'')) AND' + CR_LF +  //Everson Cunha - SIG99768

      //Everson Cunha - SIG102705 - Ini
         '   ((FR.INIGOZOFERIAS BETWEEN ADD_MONTHS(PR.FERIASFIM, -1) +1 AND PR.FERIASFIM)  ' + CR_LF +
         ' OR (FR.FIMGOZOFERIAS BETWEEN ADD_MONTHS(PR.FERIASFIM, -1) +1 AND PR.FERIASFIM)) ' + CR_LF;
      {
      If (FDataFeriasIni > FCdsParamRH.FieldByName('FERIASINI').asDateTime) Then
         FSQL := FSQL + '  (TO_DATE(' + QuotedStr(DateToStr(FDataFeriasIni)) +
            ',''DD/MM/YYYY'') <= FR.INIGOZOFERIAS) AND' + CR_LF
      Else
         FSQL := FSQL + '  (PR.FERIASINI <= FR.INIGOZOFERIAS) AND' + CR_LF;

      If (FDataFeriasFim < FCdsParamRH.FieldByName('FERIASFIM').asDateTime) Then
         FSQL := FSQL + '  (TO_DATE(' + QuotedStr(DateToStr(FDataFeriasFim)) +
            ',''DD/MM/YYYY'') >= FR.INIGOZOFERIAS)'
      Else
         FSQL := FSQL + '  (PR.FERIASFIM >= FR.INIGOZOFERIAS)'; }
      //Everson Cunha - SIG102705 - Fim

      If (FUsaRAD) Then
         FSQL := FSQL + 'AND(FR.IDPROCESSO  = RAD.IDPROCESSO(+))' + CR_LF;

      _CdsAux.Data := GetDataPacket(FSQL);

      FRADFeriasOk := Not (_CdsAux.FieldByName('FLGOK').asString = 'N');
      FDataFer1 := _CdsAux.FieldByName('INIPERIODOFERIAS').asString;
      FDataFer2 := _CdsAux.FieldByName('INIGOZOFERIAS').asString;
      FDataFer3 := _CdsAux.FieldByName('FIMGOZOFERIAS').asString;
      FNumSeqFerias := _CdsAux.FieldByName('NUMSEQ').asInteger;
      FGerouFerias := false;
      FGerouAntec13 := false;

      FPodeGerarFerias := (FTipoMotivo = FOLHA_FERIAS) And (FDataFer2 <> '') And
         (_CdsAux.FieldByName('FLGOCORRIDA').asInteger = 0)
         and (_CdsAux.FieldByName('FLGADIANTAPAGTOFERIAS').AsString = '1'); //Everson Cunha - SIG99768

      //Everson Cunha - SIG99768 - Início
      FGerarFeriasNaFolhaMensal := (FTipoMotivo = FOLHA_NORMAL) and
                                   (_CdsAux.FieldByName('FLGADIANTAPAGTOFERIAS').AsString = '0');
      //Everson Cunha - SIG99768 - Fim

      FPodeGerarAntec13 := (FTipoMotivo = FOLHA_13SAL) And
         ((FPodeGerarFerias) Or (FForcarGeracao13) Or
         FCdsAntec13.Locate('IDPESSOA', FIdPessoa, []));

      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := MSG_ERRO_PREPARO_FERIAS + FCdsFunc.FieldByName('NOME').asString +
               MSG_ERRO + E.Message;
            Result := false;
         End;
   End;
   _CdsAux.Free;
End;

Function TCtrlGeraFolPagNormal.PrepararRubEspeciais: boolean;
Var
   sAux: String;
Begin
   Result := Inherited PrepararRubEspeciais;
   Try
      FSQL :=
         'SELECT DISTINCT' + CR_LF +
         '  PD.IDPROVENTO, PD.NUMPRIORIDADE, RP.CODPROVDESC, PD.CODRUBCLT,' + CR_LF +
         //Marilza Colpani - SOL 126964/KTN 668955
//      '  PD.FLGESPECIAL, PD.FLGCONSTAFOLHA, PD.FLGDECIMOTERCEIRO, PD.FLGFERIAS,' +CR_LF+
         // inicio - edilaine - SOL 191668 / KTN 1820235 -  troca PD. por RXE.
         '  PD.FLGESPECIALFP, PD.FLGCONSTAFOLHA, NVL(RXE.FLGDECIMOTERCEIRO,0) FLGDECIMOTERCEIRO, NVL(RXE.FLGFERIAS,0) FLGFERIAS, ' + CR_LF +
         '  NVL(RXE.FLGSALFAMILIA,0) FLGSALFAMILIA, NVL(RXE.FLGRESCISAO,0) FLGRESCISAO, PD.FLGDESCONTO, PD.IDREGRA, RXE.IDREGRA13,' + CR_LF +
         '  RXE.IDREGRAFERIAS, RXE.IDREGRARESCISAO, RR.INDPERIODO, RR.FLGTIPOFOLHA,' + CR_LF +
         // fim - edilaine - SOL 191668 / KTN 1820235 -  troca PD. por RXE.
         '  PD.FLGEXCESSODEB, PD.IDPROVENTOEXCESSODEB, ' + CR_LF + // Alterado por FHBS - SOL: 149200 KTN: 1063437
         '  0.00 AS VALESPECIAIS' + CR_LF +
         'FROM' + CR_LF +
         '  PROVDESC PD, RUBXRUB RR, RUBRICAXPESS RP, VW_RUBXEVENTO RXE ' + CR_LF;  //edilaine - SOL 191668 / KTN 1820235 -  inclui VW_RUBXEVENTO

      If (FTipoMotivo In [FOLHA_NORMAL, FOLHA_ESPECIAL]) And (FIdMotivo <> FIdMotivoPadrao) Then
         FSQL := FSQL +
            ' ,(SELECT R.IDRUBSECUND AS IDRUB' + CR_LF +
            '   FROM   RUBXRUB R, PROVDESC P' + CR_LF +
            //inicio - edilaine - SOL 191668 / KTN 1820235 -  inclui RUBXEVENTO
            {'   WHERE  (P.FLGFERIAS         = 0) AND' + CR_LF +
            '          (P.FLGDECIMOTERCEIRO = 0) AND' + CR_LF +
            '          (P.FLGSALFAMILIA     = 0) AND' + CR_LF +}
            '    where (P.IDPROVENTO        = R.IDRUBPRINC) ' + CR_LF +
            '      and exists (select 1               ' + CR_LF +
            '                    from RUBXEVENTO RE  ' + CR_LF +
            '                   where P.IDPROVENTO = RE.IDPROVENTO   ' + CR_LF +
            '                     and RE.IDMOTIVO = '+ IntToStr(FIdMotivo) + CR_LF +
            '                 ) ' + CR_LF +
            '   ) RUB_RUB_ESP' + CR_LF;
            //fim - edilaine - SOL 191668 / KTN 1820235 -  inclui VW_RUBXEVENTO

      Case (FTipoMotivo) Of
         FOLHA_FERIAS: sAux := 'FLGFERIAS';
         FOLHA_13SAL: sAux := 'FLGDECIMOTERCEIRO';
         //inicio - edilaine - SOL 191668 / KTN 1820235
         //FOLHA_ESPECIAL: If FIdMotivo = 68 Then sAux := 'FLGCEDIDOS'; // Monica
         FOLHA_ESPECIAL: sAux := 'FLGOUTROS';
         //fim - edilaine - SOL 191668 / KTN 1820235
      End;

      If (FTipoMotivo In [FOLHA_FERIAS, FOLHA_13SAL]) Or
         ((FTipoMotivo = FOLHA_ESPECIAL) {And (FIdMotivo = 68)  edi}) Then // Monica
         FSQL := FSQL +
            // inicio - edilaine - SOL 191668 / KTN 1820235 - inclui RUBXEVENTO
            ' ,(SELECT R.IDRUBPRINC AS IDRUB' + CR_LF +
            '   FROM   RUBXRUB R, PROVDESC P ' + CR_LF +
            //'   WHERE  (P.' + sAux + ' = 1) AND' + CR_LF +
            '   WHERE (R.IDRUBSECUND = P.IDPROVENTO)' + CR_LF +
            '     AND exists (select 1 from RUBXEVENTO RXE1 ' + CR_LF +
            '                  where P.IDPROVENTO  = RXE1.IDPROVENTO AND RXE1.IDMOTIVO = '+ IntToStr(FIdMotivo) +')'+ CR_LF +
            '   UNION' + CR_LF +
            '   SELECT R.IDRUBSECUND AS IDRUB' + CR_LF +
            '   FROM   RUBXRUB R, PROVDESC P ' + CR_LF +
            //'   WHERE  (P.' + sAux + ' = 1) AND' + CR_LF +
            '   WHERE  (P.IDPROVENTO   = R.IDRUBPRINC) AND' + CR_LF +
            '          (R.FLGTIPOFOLHA = 1) AND' + CR_LF +
            '          exists (select 1 from RUBXEVENTO RXE2  ' + CR_LF +
            '                   where P.IDPROVENTO  = RXE2.IDPROVENTO AND RXE2.IDMOTIVO = '+ IntToStr(FIdMotivo) +')'+ CR_LF +
            '  ) RUB_RUB' + CR_LF;
            // fim - edilaine - SOL 191668 / KTN 1820235

      FSQL := FSQL +
         'WHERE' + CR_LF;

      If (Pos(',', FListaIdEmpresa) > 0) Then
         FSQL := FSQL + '  (RP.IDPESSOA      IN (' + FListaIdEmpresa + ')) AND' + CR_LF
      Else
         FSQL := FSQL + '  (RP.IDPESSOA       = ' + FListaIdEmpresa + ') AND' + CR_LF;

      FSQL := FSQL +
         '  (RP.IDRUBRICA      = PD.IDPROVENTO) AND' + CR_LF +
         '  (PD.IDPROVENTO     = RR.IDRUBSECUND) AND' + CR_LF +

         '  (PD.IDPROVENTO     = RXE.IDPROVENTO(+)) AND' + CR_LF +    // edilaine - SOL 191668 / KTN 1820235

         //Marilza Colpani - SOL 126964/KTN 668955
//      '  (PD.FLGESPECIAL    > 0) AND' +CR_LF+
         '  (PD.FLGESPECIALFP    > 0) AND' + CR_LF +
         '  (PD.NUMPRIORIDADE IS NOT NULL)';

      If (FTipoMotivo In [FOLHA_NORMAL, FOLHA_ESPECIAL]) And (FIdMotivo <> FIdMotivoPadrao) Then
         FSQL := FSQL + ' AND' + CR_LF +
            // inicio - edilaine - SOL 191668 / KTN 1820235
            {'  ((PD.FLGSALFAMILIA = 0) OR' + CR_LF +
            '   (PD.IDPROVENTO    = RUB_RUB_ESP.IDRUB))';  }
            '   ( not exists (select 1 from  RUBXEVENTO r1       '+ CR_LF +
            '                  where pd.idprovento = r1.IDPROVENTO  '+ CR_LF +
            '                    and (R1.IDMOTIVO = 1)         '+ CR_LF +
            '           )  '+ CR_LF +
            '     OR (PD.IDPROVENTO    = RUB_RUB_ESP.IDRUB))';
            // fim - edilaine - SOL 191668 / KTN 1820235


      If (FTipoMotivo In [FOLHA_FERIAS, FOLHA_13SAL]) Or
         ((FTipoMotivo = FOLHA_ESPECIAL) {And (FIdMotivo = 68)}) Then // MONICA
         FSQL := FSQL + ' AND' + CR_LF +
            //'  ((P.' + sAux + ' = 1) OR' + CR_LF +
            '  ((exists (select 1 from  RUBXEVENTO r2       '+ CR_LF +
            '             where pd.idprovento = r2.IDPROVENTO  '+ CR_LF +
            '               and R2.IDMOTIVO = '+ IntToStr(FIdMotivo) +')) OR '+ CR_LF +
            '   (PD.IDPROVENTO = RUB_RUB.IDRUB))';

      // Será processada a Folha Normal que está no ParamRH
      If (FTipoMotivo In [FOLHA_NORMAL, FOLHA_ESPECIAL]) And (FIdMotivo = FIdMotivoPadrao) Then
         FSQL := FSQL + ' AND' + CR_LF +
            '  (RXE.FLGSALFAMILIA  = 1)';

      If (Trim(FListaIdRubrica) <> '') Then
         Begin
            FSQL := FSQL + ' AND' + CR_LF +
               '  NOT((RR.IDRUBPRINC IS NOT NULL) AND' + CR_LF;

            If (Pos(',', FListaIdRubrica) > 0) Then
               FSQL := FSQL + '      (RR.IDRUBPRINC NOT IN (' + FListaIdRubrica + ')) AND' + CR_LF
            Else
               FSQL := FSQL + '      (RR.IDRUBPRINC     <> ' + FListaIdRubrica + ') AND' + CR_LF;

            FSQL := FSQL + '      (RR.IDRUBSECUND IS NOT NULL) AND' + CR_LF;

            If (Pos(',', FListaIdRubrica) > 0) Then
               FSQL := FSQL + '      (RR.IDRUBSECUND NOT IN (' + FListaIdRubrica + ')))'
            Else
               FSQL := FSQL + '      (RR.IDRUBSECUND     <> ' + FListaIdRubrica + '))';
         End;

      FSQL := FSQL + CR_LF +
         'ORDER BY' + CR_LF +
         '  NUMPRIORIDADE, IDPROVENTO, INDPERIODO, FLGTIPOFOLHA';

      FCdsRubEsp.Close;
      FCdsRubEsp.Data := GetDataPacket(FSQL);
      Result := true;
   Except
      On E: Exception Do
         MessageInfo := MSG_ERRO_PREPARO_RUB_ESPECIAIS + E.Message;
   End;
End;

Procedure TCtrlGeraFolPagNormal.SetReferenciaRubDelolucaoFerias1;
Begin
  if FCtrlCalcRub.sDataFer2 <> '' then //Everson Cunha - SIG130109
   FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
      StrToDate(FCtrlCalcRub.sDataFer2))) + 1 - FCtrlCalcRub.IndMesDevol) + '/' +
      IntToStr(FCtrlCalcRub.QtdParcFer);

   If (FTipoCliente = REFER) And
      (Copy(FCtrlCalcRub.sDataFer2, 4, 2) <> Copy(FCtrlCalcRub.sDataFer3, 4, 2)) And
      (Copy(FCtrlCalcRub.sDataFer3, 1, 2) > '04') Then
      FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
         StrToDate(FCtrlCalcRub.sDataFer2))) - 1) + '/' +
         IntToStr(FCtrlCalcRub.QtdParcFer);
End;

Procedure TCtrlGeraFolPagNormal.SetReferenciaRubDelolucaoFerias2;
Begin
  if FCtrlCalcRub.sDataFer22 <> '' then //Everson Cunha - SIG130109
   FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
      StrToDate(FCtrlCalcRub.sDataFer22))) + 1 - FCtrlCalcRub.IndMesDevol2) + '/' +
      IntToStr(FCtrlCalcRub.QtdParcFer2);

   If (FTipoCliente = REFER) And
      (Copy(FCtrlCalcRub.sDataFer22, 4, 2) <> Copy(FCtrlCalcRub.sDataFer32, 4, 2)) And
      (Copy(FCtrlCalcRub.sDataFer32, 1, 2) > '04') Then
      FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
         StrToDate(FCtrlCalcRub.sDataFer22))) - 1) + '/' +
         IntToStr(FCtrlCalcRub.QtdParcFer2);
End;

Function TCtrlGeraFolPagNormal.AlimentarPrevia: boolean;
Begin
   Try
      Result := ExecSQL(
         'INSERT INTO PREVIAFOLPAG (' + CR_LF +
         '  IDPESSOA, MESCOBRANCA, IDMOTIVO, MES, IDPESSJUR, REFERENCIA, IDRUBRICA,' + CR_LF +
         '  CODPROVDESC, IDRETROATIVO, CODMOEDA, VALORPROVENTO, IDREGRACALCULO,' + CR_LF +
         '  FLGCOMPOESALPART, FLGCOMPOESALBENEF, FLGIRRF, VALORCOTAS, SEQRUBRICA,' + CR_LF +
         '  VLRANTRETROATIVO, IDPATRO, FLGCOMPOEREMTOTAL, FLGPREVIA, FLGSRB,' + CR_LF +
         '  IDRESPONSAVEL, IDLANCIRRF, FLGCONCESSAO)' + CR_LF +
         'SELECT' + CR_LF +
         '  H.IDPESSOA, H.MESCOBRANCA, H.IDMOTIVO, H.MES, H.IDPESSJUR, H.REFERENCIA,' + CR_LF +
         '  H.IDRUBRICA, H.CODPROVDESC, H.IDRETROATIVO, H.CODMOEDA, H.VALORPROVENTO,' + CR_LF +
         '  H.IDREGRACALCULO, H.FLGCOMPOESALPART, H.FLGCOMPOESALBENEF, H.FLGIRRF,' + CR_LF +
         '  H.VALORCOTAS, H.SEQRUBRICA, H.VLRANTRETROATIVO, H.IDPATRO, H.FLGCOMPOEREMTOTAL,' + CR_LF +
         '  H.FLGPREVIA, H.FLGSRB, H.IDRESPONSAVEL, H.IDLANCIRRF, H.FLGCONCESSAO' + CR_LF +
         'FROM' + CR_LF +
         '  HISTRUBSAL H, FUNCIONARIO F' + CR_LF +
         'WHERE' + CR_LF +
         '  (H.MES           = ' + QuotedStr(FMesRef) + ') AND' + CR_LF +
         '  (H.IDMOTIVO      = ' + IntToStr(FIdMotivo) + ') AND' + CR_LF +
         IFF(FListaEmpregado <> '',
         IFF(Pos(',', FListaEmpregado) > 0,
         '  (F.IDPESSOA     IN (' + FListaEmpregado + ')',
         '  (F.IDPESSOA      = ' + FListaEmpregado) + ') AND' + CR_LF, '') +
         IFF(Pos(',', FListaTipoContrato) > 0,
         '  (F.TIPOCONTRATO IN (' + QuotedListaString(FListaTipoContrato, ',') + ')',
         '  (F.TIPOCONTRATO  = ' + QuotedStr(FListaTipoContrato)) + ') AND' + CR_LF +
         '  (F.IDPESSOA      = H.IDPESSOA)');

      If Not (Result) Then
         Raise Exception.Create(MessageInfo);
   Except
      On E: Exception Do
         Begin
            MessageInfo := MSG_ERRO_ALIMENTAR_PREVIA + E.Message;
            Result := false;
         End;
   End;
End;

Function TCtrlGeraFolPagNormal.ApagarPrevia: boolean;
Var
   sTiposFolha: String;
Begin
   Result := Inherited ApagarPrevia;
   Try
      // Criação da Lista de Empregados Selecionados
      If (FIdMotivo > 0) Then
         sTiposFolha := IntToStr(FIdMotivo)
      Else
         sTiposFolha := IntToStr(FIdMotivoPadrao);

      FSQL := '';
      If (FOpcaoPrevia In [1, 3]) Or ((FOpcaoPrevia = 2) And (FListaEmpregado <> '')) Then
         Begin
            FSQL := 'WHERE ';

            If (FOpcaoPrevia In [1, 3]) Then
               If (Pos(',', sTiposFolha) = 0) Then
                  FSQL := FSQL + '(IDMOTIVO = ' + sTiposFolha + ')'
               Else
                  FSQL := FSQL + '(IDMOTIVO IN (' + sTiposFolha + '))';

            If (FOpcaoPrevia = 3) And (FListaEmpregado <> '') Then
               FSQL := FSQL + ' AND ';

            If (FOpcaoPrevia In [2, 3]) And (FListaEmpregado <> '') Then
               If (Pos(',', FListaEmpregado) = 0) Then
                  FSQL := FSQL + '(IDPESSOA = ' + FListaEmpregado + ')'
               Else
                  FSQL := FSQL + '(IDPESSOA IN (' + FListaEmpregado + '))';
         End;

      ExecSQL('DELETE FROM PREVIAFOLPAG ' + FSQL);
      Result := true;
   Except
      On E: Exception Do
         MessageInfo := MSG_ERRO_EXCLUSAO_PREVIA + E.Message;
   End;
End;

Function TCtrlGeraFolPagNormal.CalcRetroativo(IdRubrica: String; Var ValBase: double): boolean;
Var
   CdsAux: TCMClientDataSet;
   Ind, Ind1: integer;
   dValCalcRetro, dValorRub, dValRegra: double;
   sListaIdRubBase, sIdRubResult, sTipoCalc, sRubComp, sIdRegra: String;
Begin
   CdsAux := TCMClientDataSet.Create(Nil);
   Result := false;
   Try
      Try
         sRubComp := IdRubrica;
         For Ind1 := 0 To FTotSemBase Do
            Begin
               If ((IdRubrica = 'XXXXXXXXXX') And (Ind1 = FTotSemBase)) Or
                  ((IdRubrica <> 'XXXXXXXXXX') And (Ind1 > 0)) Then
                  break;

               sListaIdRubBase := '';
               sIdRubResult := '';
               dValCalcRetro := 0;

               If (IdRubrica = 'XXXXXXXXXX') Then
                  sRubComp := FListaResultSemBase[Ind1];

               // Montar Rubricas a serem processadas
               For Ind := 0 To FListaRubBase.Count - 1 Do
                  Begin
                     If ((IdRubrica <> 'XXXXXXXXXX') And
                        (Trim(FListaRubBase.GetFieldItem(Ind, 2)) = sRubComp)) Or
                        ((IdRubrica = 'XXXXXXXXXX') And
                        (Trim(FListaRubResult.GetFieldItem(Ind, 2)) = sRubComp)) Then
                        Begin
                           sIdRubResult := Trim(FListaRubResult.GetFieldItem(Ind, 2));
                           sIdRegra := Trim(FListaRubResult.GetFieldItem(Ind, 3));
                           sTipoCalc := Trim(FListaRubTipoCalc[Ind]);

                           If (IdRubrica <> 'XXXXXXXXXX') Then
                              Begin
                                 If (Pos(',', sListaIdRubBase) = 0) Then
                                    sListaIdRubBase := IdRubrica
                                 Else
                                    sListaIdRubBase := sListaIdRubBase + ',' + IdRubrica;
                              End
                           Else
                              If (FListaRubComplem.Count > 0) And
                                 (Trim(FListaRubComplem.GetFieldItem(Ind, 2)) <> 'XXXXXXXXXX') Then
                                 Begin
                                    If (Pos(',', sListaIdRubBase) = 0) Then
                                       sListaIdRubBase := Trim(FListaRubComplem.GetFieldItem(Ind, 2))
                                    Else
                                       sListaIdRubBase := sListaIdRubBase + ',' + Trim(FListaRubComplem.GetFieldItem(Ind, 2));
                                 End;
                        End;
                  End;

               // Não faz este ítem caso o usuário não selecione rubrica base alguma e o cálculo
               // não seja por Regra/Forma de Cálculo
               If (Trim(sListaIdRubBase) = '') And (sTipoCalc <> '3') Then
                  continue;

               For Ind := 1 To FQuantMesesRetroativo Do
                  Begin
                     If (Trim(sListaIdRubBase) <> '') Then
                        Begin
                           dValorRub := GetValorRubrica(sListaIdRubBase, IncDataAM(FMesRef, -Ind));

                           If (dValorRub > 0) Then
                              Begin
                                 Case (sTipoCalc[1]) Of
                                    '1': If (dValorRub < ValBase) Then
                                          dValCalcRetro := dValCalcRetro + ValBase - dValorRub;
                                    '2': dValCalcRetro := dValCalcRetro + Round(FPercRetroativo * dValorRub) / 100;
                                    '3': ValBase := dValorRub;
                                 End;
                              End;
                        End;

                     If (sTipoCalc = '3') Then // Cálculo por Regra
                        Begin
                           FCtrlCalcRub.CalcRetroativo(FIdMotivo, sIdRegra, FloatToStr(FIdPessoa), dValRegra,
                              ValBase, FPercRetroativo, Ind, FTotalGeral_Prov, FTotalGeral_Desc);
                           dValCalcRetro := dValCalcRetro + dValRegra;
                        End;
                  End;

               If (dValCalcRetro = 0) Then
                  continue;

               CdsAux.Close;
               CdsAux.Data := GetDataPacket(
                  'SELECT' + CR_LF +
                  '  RP.CODPROVDESC, PD.FLGDESCONTO' + CR_LF +
                  'FROM' + CR_LF +

                  'RP RUBRICAXPESS, PROVDESC PD' + CR_LF +
                  'WHERE' + CR_LF +
                  '  (RP.IDRUBRICA = ' + sIdRubResult + ') AND' + CR_LF +
                  '  (RP.IDPESSOA  = ' + IntToStr(FIdEmpresa) + ') AND' + CR_LF +
                  '  (RP.IDRUBRICA = PD.IDPROVENTO)');

               If Not (GravarRubrica(StrToFloat(sIdRubResult), CdsAux.FieldByName('CODPROVDESC').asString,
                  FIdMotivo, FMesRef, FMesPagto, '***', 0, 0, 0, 1, 0, dValCalcRetro)) Then
                  Raise Exception.Create(MessageInfo);

               SomarTotalGeral(CdsAux.FieldByName('FLGDESCONTO').asInteger, dValCalcRetro);

               If (FIntegra_CAP) Or (FIntegra_PagEletronico) Then
                  If Not (AtualizarIntegracao(Nil,
                     StrToFloat(sIdRubResult), dValCalcRetro)) Then
                     Raise Exception.Create(MessageInfo);

               // Acumula nas Rubricas Secundárias
               CdsAux.Close;
               CdsAux.Data := GetDataPacket(
                  'SELECT' + CR_LF +
                  '  IDRUBSECUND, FLGTIPOFOLHA, INDPERIODO, FLGACAOINCIDE' + CR_LF +
                  'FROM' + CR_LF +
                  '  RUBXRUB' + CR_LF +
                  'WHERE' + CR_LF +
                  '  (IDRUBPRINC  = ' + sIdRubResult + ')');

               While Not (CdsAux.EOF) Do
                  Begin
                     If (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                        VarArrayOf([CdsAux.FieldByName('IDRUBSECUND').asFloat,
                        CdsAux.FieldByName('FLGTIPOFOLHA').asInteger,
                           CdsAux.FieldByName('INDPERIODO').asInteger]), [])) Then
                        Begin
                           FCdsRubEsp.Edit;
                           FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat :=
                              FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat + dValCalcRetro *
                              (1 - CdsAux.FieldByName('FLGACAOINCIDE').asInteger * 2);
                           FCdsRubEsp.Post;
                        End;
                     CdsAux.Next;
                  End;
            End;
         Result := true;
      Except
         On E: Exception Do
            Begin
               Result := false;
               MessageInfo := MSG_ERRO_CALC_RETROATIVO + E.Message;
            End;
      End;
   Finally
      FreeAndNil(CdsAux);
   End;
End;

// Alterado por FHBS - SOL: 144468 KTN: 952342
{
procedure TCtrlGeraFolPagNormal.AplicaDescontoExcessoDebito;
var
  _CdsAux, _CdsSum: TCMClientDataSet;
  dValorLiquido: Double;
  dVlrCosignado: Double;
  dVlrCompensado: Double;

  Procedure _ExcluiRubrica(const pCodRubrica : Integer);
  begin
    _CdsSum.Data := GetDataPacket('SELECT H.ROWID,' + CR_LF +
                                  '       H.IDRUBRICA,' + CR_LF +
                                  '       H.VALORPROVENTO' + CR_LF +
                                  '  FROM ' + FNomeTabela + ' H,' + CR_LF +
                                  '       RUBRICAXPESS RP,' + CR_LF +
                                  '       PROVDESC     PD' + CR_LF +
                                  ' WHERE (H.IDPESSOA = ' + FloatToStr(FIdPessoa) + ')' + CR_LF +
                                  '   AND (H.MES = ' + QuotedStr(FMesRef) + ')' + CR_LF +
                                  '   AND (H.IDRUBRICA = PD.IDPROVENTO)' + CR_LF +
                                  '   AND (RP.IDPESSOA = ' + IntToStr(FIdEmpresa) + ')' + CR_LF +
                                  '   AND (H.IDRUBRICA = RP.IDRUBRICA)' + CR_LF +
                                  '   AND (H.IDRUBRICA = '+IntToStr(pCodRubrica)+')');
     If Not _CdsSum.IsEmpty then
       ExecSql('Delete FROM ' + FNomeTabela + CR_LF +
               'WHERE ROWID = ' + QuotedStr(_CdsSum.FieldByName('ROWID').AsString));
  end;

  Procedure _AnalisaExcessoDebito(const pRubricaExcesso,
                                        pRubricaAcerto : Integer);
  var rRubExcesso, rRubAcerto : Double;
  begin
    rRubExcesso := FCtrlCalcRub.ValorRubrica(IntToStr(pRubricaExcesso));
    _CdsSum.Data := GetDataPacket('SELECT H.ROWID,' + CR_LF +
                                  '       H.IDRUBRICA,' + CR_LF +
                                  '       H.VALORPROVENTO' + CR_LF +
                                  '  FROM ' + FNomeTabela + ' H,' + CR_LF +
                                  '       RUBRICAXPESS RP,' + CR_LF +
                                  '       PROVDESC     PD' + CR_LF +
                                  ' WHERE (H.IDPESSOA = ' + FloatToStr(FIdPessoa) + ')' + CR_LF +
                                  '   AND (H.MES = ' + QuotedStr(FMesRef) + ')' + CR_LF +
                                  '   AND (H.IDRUBRICA = PD.IDPROVENTO)' + CR_LF +
                                  '   AND (RP.IDPESSOA = ' + IntToStr(FIdEmpresa) + ')' + CR_LF +
                                  '   AND (H.IDRUBRICA = RP.IDRUBRICA)' + CR_LF +
                                  '   AND (H.IDRUBRICA = '+IntToStr(pRubricaAcerto)+')');
    rRubAcerto := _CdsSum.FieldByName('VALORPROVENTO').AsFloat;
    If (rRubExcesso <> 0) and
       (rRubAcerto <> 0) and
       Not _cdsSum.IsEmpty then
      If rRubAcerto - rRubExcesso > 0 then
        ExecSql('Update ' + FNomeTabela + CR_LF +
                'Set ValorProvento  = ' + OraNumero(FloatToStr(rRubAcerto - rRubExcesso)) + CR_LF +
                'WHERE ROWID = ' + QuotedStr(_CdsSum.FieldByName('ROWID').AsString))
      else
        ExecSql('Delete FROM ' + FNomeTabela + CR_LF +
                'WHERE ROWID = ' + QuotedStr(_CdsSum.FieldByName('ROWID').AsString));
  end;

begin

  try
    _CdsAux := TCMClientDataSet.Create(nil);
    _CdsSum := TCMClientDataSet.Create(nil);
    _CdsAux.Data := GetDataPacket('SELECT H.ROWID,' + CR_LF +
                                  '       H.IDRUBRICA,' + CR_LF +
                                  '       H.VALORPROVENTO,' + CR_LF +
                                  '       PD.IDPROVENTOEXCESSODEB,' + CR_LF +
                                  '       RPE.CODPROVDESC AS CODPROVDESCEXCESSODEB,' + CR_LF +
                                  '       NVL(PDE.IDREGRA, 0) AS IDREGRAEXCESSODEB' + CR_LF +
                                  '  FROM ' + FNomeTabela + ' H,' + CR_LF +
                                  '       RUBRICAXPESS RP,' + CR_LF +
                                  '       PROVDESC     PD,' + CR_LF +
                                  '       PROVDESC     PDE,' + CR_LF +
                                  '       RUBRICAXPESS RPE' + CR_LF +
                                  ' WHERE (H.IDPESSOA = ' + FloatToStr(FIdPessoa) + ')' + CR_LF +
                                  '   AND (H.MES = ' + QuotedStr(FMesRef) + ')' + CR_LF +
                                  '   AND (H.IDMOTIVO = ' + IntToStr(FIdMotivo) + ')' + CR_LF +
                                  '   AND (PD.FLGTPRUBRICA LIKE ''%F%'')' + CR_LF +
                                  '   AND (H.IDRUBRICA = PD.IDPROVENTO)' + CR_LF +
                                  '   AND (RP.IDPESSOA = ' + IntToStr(FIdEmpresa) + ')' + CR_LF +
                                  '   AND (H.IDRUBRICA = RP.IDRUBRICA)' + CR_LF +
                                  '   AND (PD.FLGDESCONTO = 1)' + CR_LF +
                                  '   AND (PD.FLGEXCESSODEB = 1)' + CR_LF +
                                  '   AND (PDE.IDPROVENTO = RPE.IDRUBRICA)' + CR_LF +
                                  '   AND (PDE.IDPROVENTO = PD.IDPROVENTOEXCESSODEB)' + CR_LF +
                                  ' ORDER BY PD.NUMPRIORIDADE,' + CR_LF +
                                  '          PD.NUMPRIORIDESC,' + CR_LF +
                                  '          DECODE(INSTR(H.REFERENCIA, ''/''),' + CR_LF +
                                  '                 0,' + CR_LF +
                                  '                 0,' + CR_LF +
                                  '                 SUBSTR(H.REFERENCIA, 1, INSTR(H.REFERENCIA, ''/'') - 1)) DESC,' + CR_LF +
                                  '          H.VALORPROVENTO DESC');

    // Limite de Desconto
    dVlrCosignado := FCtrlCalcRub.ValorRubrica('18000');
    dVlrCompensado := 0;

    _CdsAux.First;
    while not(_CdsAux.Eof) do
    begin
      dValorLiquido := (dVlrCosignado - dVlrCompensado);

      If (dValorLiquido - _CdsAux.FieldByName('VALORPROVENTO').AsFloat) >= 0 then
        dVlrCompensado := dVlrCompensado + _CdsAux.FieldByName('VALORPROVENTO').AsFloat
      else
      begin
        ExecSQL('UPDATE ' + FNomeTabela + CR_LF +
                'SET IDRUBRICA = ' + _CdsAux.FieldByName('IDPROVENTOEXCESSODEB').AsString + ',' + CR_LF +
                '    CODPROVDESC = ' + QuotedStr(_CdsAux.FieldByName('CODPROVDESCEXCESSODEB').AsString) + ',' + CR_LF +
                '    IDREGRACALCULO = ' + _CdsAux.FieldByName('IDREGRAEXCESSODEB').AsString + CR_LF +
                'WHERE ROWID = ' + QuotedStr(_CdsAux.FieldByName('ROWID').AsString));

        IncluiValorRubricaTotalizadoExcessoDebito(39884, _CdsAux.FieldByName('VALORPROVENTO').AsFloat);

        //Bruno Bastos - Sol 142253 - Início
        IncluiValorRubricaTotalizadoExcessoDebito(11640, _CdsAux.FieldByName('VALORPROVENTO').AsFloat);
        IncluiValorRubricaTotalizadoExcessoDebito(39167, _CdsAux.FieldByName('VALORPROVENTO').AsFloat);
        IncluiValorRubricaTotalizadoExcessoDebito(72,    _CdsAux.FieldByName('VALORPROVENTO').AsFloat);
        IncluiValorRubricaTotalizadoExcessoDebito(18010, _CdsAux.FieldByName('VALORPROVENTO').AsFloat * -1);
        IncluiValorRubricaTotalizadoExcessoDebito(39842, _CdsAux.FieldByName('VALORPROVENTO').AsFloat * -1);
        //Bruno Bastos - Sol 142253 - Fim

        // Alterado por FHBS - SOL: 142253 KTN: 905697
        //IncluiValorRubricaTotalizadoExcessoDebito(39885, _CdsAux.FieldByName('VALORPROVENTO').AsFloat);
        //Bruno Bastos - Sol 142253 - Coloquei o join com a Provdesc e o filtro pelo flgsalfamilia
        _CdsSum.Data := GetDataPacket('SELECT RXR.IDRUBPRINC, RXR.IDRUBSECUND, RXR.FLGACAOINCIDE' + #13#10 +
                                      '  FROM RUBXRUB RXR, PROVDESC PRD ' + #13#10 +
                                      ' WHERE RXR.IDRUBPRINC    = ' + _CdsAux.FieldByName('IDRUBRICA').AsString+
                                        ' AND RXR.IDRUBSECUND   = PRD.IDPROVENTO '+
                                        ' AND PRD.FLGSALFAMILIA = 1 ');

        while not(_CdsSum.Eof) do
        begin
          if _CdsSum.FieldByName('FLGACAOINCIDE').AsInteger = 1 then
            IncluiValorRubricaTotalizadoExcessoDebito(_CdsSum.FieldByName('IDRUBSECUND').AsInteger,
                                                      _CdsAux.FieldByName('VALORPROVENTO').AsFloat)
          else
            IncluiValorRubricaTotalizadoExcessoDebito(_CdsSum.FieldByName('IDRUBSECUND').AsInteger,
                                                      _CdsAux.FieldByName('VALORPROVENTO').AsFloat * -1);
          _CdsSum.Next;
        end;
        _CdsSum.Close;
        // Fim - Alterado por FHBS

      end;

      _CdsAux.Next;
    end;

    // Alterado por Arnaldo V. Scarin em 16/09/2010
    // Sol 144099 KTN: 943868
    // Correção da rotina de Validação de Excesso de Débito, pois
    // quando existe a rubrica "00060 - Insuficiência Saldo Mes" e
    // a Rubrica "11640" está positiva, não há necessidade da existencia
    // da rubrica "00060". O processo será validar a existencia da mesma, e
    // caso exista, exclui-la do comprovante de pagamento.
    If FCtrlCalcRub.ValorRubrica('11640') > 0 then
      _ExcluiRubrica(60)
    else
      _AnalisaExcessoDebito(39884,60);

    _CdsSum.Close;
    _CdsAux.Close;

    FreeAndNil(_CdsSum);
    FreeAndNil(_CdsAux);
  except
    on E: Exception do
    begin
      MessageInfo := MSG_ERRO_ESCREVE_RUB + E.Message;
    end;
  end;
end;

procedure TCtrlGeraFolPagNormal.IncluiValorRubricaTotalizadoExcessoDebito(Const pIdRubrica : Integer;
                                                                          Const pVlrRubrica : Double);
var CdsAux: TCMClientDataSet;
    sSql : String;
    dVlrProvento : Double;
begin
  try
    cdsAux := tCmClientDataSet.Create(nil);
    cdsAux.data := GetDataPacket('Select IdRubrica,'+CR_LF+
                                 '       ValorProvento'+CR_LF+
                                 ' from '+FNomeTabela+CR_LF+
                                 'Where Idpessoa     = ' + FloatToStr(FIdPessoa) + CR_LF +
                                 '  and MES          = ' + QuotedStr(FMesRef) + CR_LF +
                                 '  and IdRubrica    = ' + IntToStr(pIdRubrica));

    If Not CdsAux.IsEmpty then
    begin
      dVlrProvento := CdsAux.FieldByName('ValorProvento').asFloat + pVlrRubrica;
      sSql := 'Update ' + FNomeTabela + CR_LF +
              'Set ValorProvento  = ' + OraNumero(FloatToStr(dVlrProvento)) + CR_LF +
              'Where Idpessoa     = ' + FloatToStr(FIdPessoa) + CR_LF +
              '  and MES          = ' + QuotedStr(FMesRef) + CR_LF +
              '  and IdRubrica    = ' + IntToStr(pIdRubrica);
      ExecSQL(sSql);
    end
    else
    begin
      cdsAux.data := GetDataPacket('select NVL(p.codprovdesc,r.codprovdesc) codprovdesc'+CR_LF+
                                   'from provdesc p, rubricaxpess r'+CR_LF+
                                   'where p.idprovento = r.idrubrica'+CR_LF+
                                   '  and p.idprovento = '+IntToStr(pIdRubrica));
      GravarRubrica(pIdRubrica,
                    CdsAux.FieldByName('CODPROVDESC').asString,
                    FIdMotivo,
                    FMesRef,
                    FMesPagto,
                    '***',
                    0,
                    0,
                    0,
                    1,
                    0,
                    pVlrRubrica);
    end;
    cdsAux.Close;
    FreeAndNil(cdsAux);
  except
    on E: Exception do
    begin
      MessageInfo := MSG_ERRO_ESCREVE_RUB + E.Message;
    end;
  end;
end;
}

Function TCtrlGeraFolPagNormal.AplicaDescontoExcessoDebito: Boolean;
Var
   _CdsAux: TCMClientDataSet;
   dValorLiquido: Double;
   dVlrCosignado: Double;
   dTotalLiquido: Double; //Everson Cunha - SIG58721
   dVlrCompensado: Double;
   iEmprestimoFinan: Byte;

Begin
   Result := False;
   Try
      _CdsAux := TCMClientDataSet.Create(Nil);
      Try
         dVlrCompensado := 0; // Alterado por FELIPE SANTOS - SOL: 177438 KTN: 1635220
         For iEmprestimoFinan := 1 Downto 0 Do // Alterado por FELIPE SANTOS - SOL: 177438 KTN: 1635220
            Begin
               _CdsAux.Data := GetDataPacket('SELECT H.ROWID,' + CR_LF +
                  '       H.IDRUBRICA,' + CR_LF +
                  '       H.VALORPROVENTO,' + CR_LF +
                  '       PD.IDPROVENTOEXCESSODEB,' + CR_LF +
                  '       RPE.CODPROVDESC AS CODPROVDESCEXCESSODEB,' + CR_LF +
                  '       NVL(PDE.IDREGRA, 0) AS IDREGRAEXCESSODEB,' + CR_LF +
                  '       H.' + CAMPO_SEQ_ORIGINAL + CR_LF + // Alterado por FHBS - SOL: 149200 KTN: 1063437
                  '      ,H.REFERENCIA           ' + CR_LF + //Everson Cunha - SIG58721
                  '  FROM ' + FNomeTabela + ' H,' + CR_LF +
                  '       RUBRICAXPESS RP,' + CR_LF +
                  '       PROVDESC     PD,' + CR_LF +
                  '       PROVDESC     PDE,' + CR_LF +
                  '       RUBRICAXPESS RPE' + CR_LF +
                  ' WHERE (H.IDPESSOA = ' + FloatToStr(FIdPessoa) + ')' + CR_LF +
                  '   AND (H.MES = ' + QuotedStr(FMesRef) + ')' + CR_LF +
                  '   AND (H.IDMOTIVO = ' + IntToStr(FIdMotivo) + ')' + CR_LF +
                  '   AND (PD.FLGTPRUBRICA LIKE ''%F%'')' + CR_LF +
                  '   AND (H.IDRUBRICA = PD.IDPROVENTO)' + CR_LF +
                  '   AND (RP.IDPESSOA = ' + IntToStr(FIdEmpresa) + ')' + CR_LF +
                  '   AND (H.IDRUBRICA = RP.IDRUBRICA)' + CR_LF +
                  '   AND (PD.FLGDESCONTO = 1)' + CR_LF +
                  '   AND (PD.FLGEXCESSODEB = 1)' + CR_LF +
                  '   AND (NVL(PD.FLGEMPRESTIMOFINAN,0) = ' + IntToStr(iEmprestimoFinan) + ')' + CR_LF + // Alterado por FELIPE SANTOS - SOL: 177438 KTN: 1635220
                  '   AND (PDE.IDPROVENTO = RPE.IDRUBRICA)' + CR_LF +
                  '   AND (PDE.IDPROVENTO = PD.IDPROVENTOEXCESSODEB)' + CR_LF +
                //  '   AND H.IDRUBRICA NOT IN (7310,7313)' + CR_LF +  //Ewerton Beltramini - SIG 120985 - 25/11/2021. (Não pode conter os lançamentos da APCEF/DF)  (Comentado em atendimento ao sig 121387)
                  ' ORDER BY PD.NUMPRIORIDADE,' + CR_LF +
                  '          PD.NUMPRIORIDESC,' + CR_LF +
                  '          DECODE(INSTR(H.REFERENCIA, ''/''),' + CR_LF +
                  '                 0,' + CR_LF +
                  '                 0,' + CR_LF +
                  '                 SUBSTR(H.REFERENCIA, 1, INSTR(H.REFERENCIA, ''/'') - 1)) DESC,' + CR_LF +
                  //'          H.VALORPROVENTO DESC');  //Everson Cunha - SIG58721
                  '          H.VALORPROVENTO');         //Everson Cunha - SIG58721

               // Limite de Desconto
               If (iEmprestimoFinan = 1) Then
               begin
                 //Everson Cunha - SIG58721 - Início
                 dTotalLiquido := FCtrlCalcRub.ValorRubrica('11640'); //Rubrica: TOTAL LIQUIDO

                 //Devolve ao total líquido as parcelas de empréstimo que foram abatidas
                 _CdsAux.First;
                 While Not (_CdsAux.Eof) Do
                 Begin
                   dTotalLiquido := dTotalLiquido + _CdsAux.FieldByName('VALORPROVENTO').AsFloat;
                   _CdsAux.Next;
                 end;
                 //Everson Cunha - SIG58721 - Fim

                 //Everson Cunha - SIG128334 - Ini - Retornar a margem 35%
                 //Ewerton Beltramini - 10/01/2022 - SIG122148  - Descomentando a margem a 30% e comentando a margem a 35%.
                 //Base Margem Consignável 30%
                 //dVlrCosignado := FCtrlCalcRub.ValorRubrica('18000'); //Everson Cunha - SIG116218
                 //Base Margem Consignável 35%                          //Everson Cunha - SIG116218
                 dVlrCosignado := FCtrlCalcRub.ValorRubrica('41529');   //Everson Cunha - SIG116218
                 //Ewerton Beltramini - 10/01/2022 - SIG122148  - Descomentando a margem a 30% e comentando a margem a 35%.
                 //Everson Cunha - SIG128334 - Ini - Retornar a margem 35%

                 //Everson Cunha - SIG58721 - Início
                 //Verifica se o total que tem líquido é menor que a margem 30%
                 //Se o líquido for menor, então utiliza o líquido para calcular
                 if dTotalLiquido < dVlrCosignado then
                   dVlrCosignado := dTotalLiquido;
                 //Everson Cunha - SIG58721 - Fim

               end
               Else
                  // Alterado por FELIPE SANTOS - SOL: 177438 KTN: 1635220
                  // pega o limite de desconto de 40% das demais rubricas - 30% que já foi descontado do empréstimo
                  dVlrCosignado := FCtrlCalcRub.ValorRubrica('18005') - dVlrCompensado;

               dVlrCompensado := 0;

               _CdsAux.First;
               While Not (_CdsAux.Eof) Do
                  Begin
                     dValorLiquido := (dVlrCosignado - dVlrCompensado);
                     If (dValorLiquido - _CdsAux.FieldByName('VALORPROVENTO').AsFloat) >= 0 Then
                        dVlrCompensado := dVlrCompensado + _CdsAux.FieldByName('VALORPROVENTO').AsFloat
                     Else
                        Begin
                          //Everson Cunha - SIG58721 - Início
                          if dValorLiquido > 0 then
                          begin

                            If Not (Result) Then
                              FCdsRubEsp.CancelUpdates;

                            ExecSQL('UPDATE ' + FNomeTabela + CR_LF +
                                    'SET VALORPROVENTO = ' + OraNumero(FloatToStr(dValorLiquido)) + CR_LF +
                                    'WHERE ROWID = ' + QuotedStr(_CdsAux.FieldByName('ROWID').AsString));

                            GravarRubrica(_CdsAux.FieldByName('IDPROVENTOEXCESSODEB').AsFloat, _CdsAux.FieldByName('CODPROVDESCEXCESSODEB').AsString, FIdMotivo, FMesRef, FMesPagto,
                                          IFF(_CdsAux.FieldByName('REFERENCIA').AsString = '', IFF(FReferencia = '', '***', FReferencia), _CdsAux.FieldByName('REFERENCIA').AsString),
                                          _CdsAux.FieldByName('IDREGRAEXCESSODEB').AsFloat, 0, 0, 0, _CdsAux.FieldByName(CAMPO_SEQ_ORIGINAL).AsInteger,
                                          _CdsAux.FieldByName('VALORPROVENTO').AsFloat - dValorLiquido);

                            If (FProcesso = FINAL) and (FTipoEmpresa = 'P') and (FProcTmpDesc) Then
                            Begin

                              ExecSQL('UPDATE TMPDESC' + CR_LF +
                                      'SET SITENVIO      = ''1'',' + CR_LF +
                                      '  VALORRECEBIDO   = ' +OraNumero(FloatToStr(dValorLiquido))+ ',' +CR_LF+
                                      '  DATARECEBIMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataProcessamento))+ ',''DD/MM/YYYY''),' +CR_LF+
                                      '  IDSEQINTERNOFB  = ' +IntToStr(FIdMotivo)       +CR_LF+
                                      'WHERE IDPESSOA    = ' + FloatToStr(FIdPessoa)    + CR_LF +
                                      '  AND IDSEQINTERNOFB = ' + FloatToStr(FIdMotivo) + CR_LF +
                                      '  AND MESCOBRANCA    = ' + QuotedStr(FMesRef)    + CR_LF +
                                      '  AND IDPROVENTO     = ' + FloatToStr(_CdsAux.FieldByName('IDRUBRICA').AsFloat));
                            End;

                            dVlrCompensado := dVlrCompensado + dValorLiquido;
                          end
                          else
                          begin
                          //Everson Cunha - SIG58721 - Fim

                           // Alterado por FHBS - SOL: 149200 KTN: 1063437
                           If Not (Result) Then
                              FCdsRubEsp.CancelUpdates;

                           FCdsRubEsp.First;
                           While Not FCdsRubEsp.Eof Do
                              Begin
                                 If (FCdsRubEsp.FieldByName('IDPROVENTOEXCESSODEB').AsFloat = _CdsAux.FieldByName('IDPROVENTOEXCESSODEB').AsFloat) And
                                    (FCdsRubEsp.FieldByName('IDPROVENTO').AsFloat = _CdsAux.FieldByName('IDRUBRICA').AsFloat) And
                                    (FCdsRubEsp.FieldByName('FLGEXCESSODEB').AsInteger = 1) And
                                    (_CdsAux.FieldByName(CAMPO_SEQ_ORIGINAL).IsNull) Then
                                    Begin
                                       FCdsRubEsp.Delete;
                                       Break;
                                    End;

                                 FCdsRubEsp.Next;
                              End;
                           // Fim - Alterado por FHBS - SOL: 149200 KTN: 1063437

                           ExecSQL('UPDATE ' + FNomeTabela + CR_LF +
                              'SET IDRUBRICA = ' + _CdsAux.FieldByName('IDPROVENTOEXCESSODEB').AsString + ',' + CR_LF +
                              '    CODPROVDESC = ' + QuotedStr(_CdsAux.FieldByName('CODPROVDESCEXCESSODEB').AsString) + ',' + CR_LF +
                              '    IDREGRACALCULO = ' + _CdsAux.FieldByName('IDREGRAEXCESSODEB').AsString + CR_LF +
                              'WHERE ROWID = ' + QuotedStr(_CdsAux.FieldByName('ROWID').AsString));

                              //Everson Cunha - SIG58721 - Início
                              If (FProcesso = FINAL) and (FTipoEmpresa = 'P') and (FProcTmpDesc) Then
                              Begin
                                ExecSQL('UPDATE TMPDESC         ' + CR_LF +
                                   'SET SITENVIO        = ''1'',' + CR_LF +
                                   '    DATARECEBIMENTO = NULL, ' + CR_LF +
                                   '    VALORRECEBIDO   = NULL, ' + CR_LF +
                                   '    IDSEQINTERNOFB  = NULL  ' + CR_LF +
                                   'WHERE IDPESSOA    = ' + FloatToStr(FIdPessoa)    + CR_LF +
                                   '  AND IDSEQINTERNOFB = ' + FloatToStr(FIdMotivo) + CR_LF +
                                   '  AND MESCOBRANCA    = ' + QuotedStr(FMesRef)    + CR_LF +
                                   '  AND IDPROVENTO     = ' + FloatToStr(_CdsAux.FieldByName('IDRUBRICA').AsFloat));
                              end;
                              //Everson Cunha - SIG58721 - Fim

                          end;
                           Result := True;
                        End;
                     _CdsAux.Next;
                  End;
            End;

      Finally
         If _CdsAux.Active Then _CdsAux.Close;
         FreeAndNil(_CdsAux);
      End;
   Except
      On E: Exception Do
         Begin
            MessageInfo := MSG_ERRO_ESCREVE_RUB + E.Message;
         End;
   End;
End;
// Fim - Alterado por FHBS - SOL: 144468 KTN: 952342

Procedure TCtrlGeraFolPagNormal.PreencheListaDependentes(Const pIdPessoa: Double);
Begin
   FCdsDependPessoa.Close;
   FCdsDependPessoa.data := GetDataPacket('select idtitular,' + #13#10 +
      '       idpessoa,' + #13#10 +
      '       flgplsaude,' + #13#10 +
      '       flgplodonto' + #13#10 +
      '  from depentit d' + #13#10 +
      ' where idtitular = ' + IntToStr(Trunc(pIdPessoa)));
   //                                         ' and (d.flgplsaude = 1 or d.flgplodonto = 1)' + #13#10 + // SOL 182072 KINTANA 1693080 comentado
End;

// SOL 220895  KTN 2054130 - Paulo Nobre

Procedure TCtrlGeraFolPagNormal.ValidaEGravaValoresPlanos(Const pIdTitular: String);
Var _SQL: TStringList;
  oSql, oSqlDepen, oSqlRubricas: TCmClientDataSet;
  sSql, sMes, sAno, sIdPessoa, sIdRubrica: String;
  iQtdDepen, iQtdTmp: Integer;
  dValorRubrica, dValorUnitDepen, dValorAcum, dValorGravaDepen: Double;
Begin
  oSql := TCmClientDataSet.Create(Nil);
  oSqlDepen := TCmClientDataSet.Create(Nil);
  oSqlRubricas := TCmClientDataSet.Create(Nil);
  _SQL := TStringList.Create;

  sAno := Copy(FMesRef, 1, 4);
  sMes := Copy(FMesRef, 6, 2);
  Try
    Try
      // SOL 246069  PPM 664826 - Paulo Nobre
      // 1 - Selecionando as Rubricas especificas para os tipos de Assistência (1 - Saúde, 2 - Odonto)
      dValorRubrica := 0;
      dValorUnitDepen := 0;
      With (_SQL) Do
        Begin
          Clear;
          Add('SELECT H.IDRUBRICA, P.FLGASSISTENCIAL, H.VALORPROVENTO, P.FLGRATEARPORDEPENDENTE '); // Andre Imakawa - SIG 34125
          Add('FROM HISTRUBSAL H, PROVDESC P  ');
          Add('WHERE H.IDRUBRICA = P.IDPROVENTO');
          Add('      AND H.MES = ' + QuotedStr(sAno + '/' + sMes));
          Add('      AND H.IDPESSOA = ' + pIdTitular);

          If (FListaIdRubrica <> '') Then
            Begin
              If Pos(',', FListaIdRubrica) > 0 Then
                Add('  AND H.IDRUBRICA IN (' + FListaIdRubrica + ')')
              Else
                Add('  AND H.IDRUBRICA  = ' + FListaIdRubrica);
            End;

          Add('      AND P.FLGASSISTENCIAL IN (1,2)    ');
          Add('ORDER BY P.FLGASSISTENCIAL, H.IDRUBRICA ');
        End;
      oSqlRubricas.Close;
      oSqlRubricas.Data := GetDataPacket(_SQL.Text);
      oSqlRubricas.First;
      If Not oSqlRubricas.EOF Then
        Begin
          // 2 - Deletando da RETASSIST todas as Rubricas lançadas para o Titular + Dependentes no ano/mes
          sSql := 'Delete from RETASSIST' + #13#10 +
            'where idTitular  = ' + pIdTitular + #13#10 +
            '  and ano        = ' + QuotedStr(sAno) + #13#10 +
            '  and mes        = ' + QuotedStr(sMes);
          ExecSql(sSql);

          // 3. Começando a atualização da RETASSIST para o Titular e Dependentes + Rubricas dentro do ano/mes.
          While Not oSqlRubricas.EOF Do
            Begin
              sIdRubrica := oSqlRubricas.FieldByName('IDRUBRICA').asString;
              dValorRubrica := oSqlRubricas.FieldByName('VALORPROVENTO').asFloat;

              // 4 - Se forem estas rubricas, então não haverá rateio e o valor total será atribuído ao Titular
              // Andre Imakawa - SIG 34125 - Inicio
              //If (sIdRubrica = '39227') Or // SAUDE ODONTO - PARTICIPAÇÃO
              //(sIdRubrica = '39864') Then // SAUDE ODONTO - PARTICIPAÇÃO - EXCESSO DÉBITO
              If (oSqlRubricas.FieldByName('FLGRATEARPORDEPENDENTE').asString = 'N') Then
              // Andre Imakawa - SIG 34125 - Fim
                Begin
                  sSql := 'Insert Into RETASSIST (idtitular,idpessoa,idprovento,ano,mes,valor)' + #13#10 +
                    'Values(' + pIdTitular + ',' + #13#10 +
                    pIdTitular + ',' + #13#10 +
                    sIdRubrica + ',' + #13#10 +
                    QuotedStr(sAno) + ',' + #13#10 +
                    QuotedStr(sMes) + ',' + #13#10 +
                    StringReplace(floattostrf(dValorRubrica, ffnumber, 10, 2), ',', '.', []) + ')';
                  ExecSQL(sSql);
                End
              Else // Entra para o rateio
                Begin
                  // 5 - Selecionando os dependentes do Titular, incluindo o proprio
                  //     Para garantir que o reteio seja feito de forma correto, é necessário que SEMPRE
                  //     o Titular venha em ultimo lugar, conforme o select abaixo, pois para o Titular será
                  //     SEMPRE lançado com o valor restante ( da sobra do rateio). Ex.: 33,33 / 33,33 / 33,34 = 100,00
                  With (_SQL) Do
                    Begin
                      Clear;
                      Add('SELECT d.idtitular, d.idpessoa');
                      Add('FROM depentit d');
                      Add('WHERE d.idtitular = ' + pIdTitular);
                      Add('      AND (d.flgplsaude = 1 or d.flgplodonto = 1)');
                      Add('ORDER BY d.numsequencia DESC, d.idpessoa DESC');
                    End;
                  oSqlDepen.Close;
                  oSqlDepen.Data := GetDataPacket(_SQL.Text);
                  oSqlDepen.First;
                  iQtdDepen := oSqlDepen.RecordCount;
                  dValorUnitDepen := RoundCM((dValorRubrica / iQtdDepen), 2);
                  iQtdTmp := 1;
                  dValorAcum := 0;
                  dValorGravaDepen := 0;
                  While Not oSqlDepen.Eof Do
                    Begin
                      sIdPessoa := oSqlDepen.FieldByName('idpessoa').asString;

                      If iQtdTmp < iQtdDepen Then
                        Begin
                          dValorGravaDepen := dValorUnitDepen;
                          dValorAcum := dValorAcum + dValorUnitDepen;
                          inc(iQtdTmp);
                        End
                      Else
                        dValorGravaDepen := dValorRubrica - dValorAcum; // Acha o valor do Titular pela diferença restante

                      // Se forem as Rubricas abaixo, então devem ser lançadas negativas
                      If (sIdRubrica = '40292') Or // PLANO SAÚDE - DEV CONT EMPREGADO
                      (sIdRubrica = '40293') Or // PLANO ODONTO - DEV CONT EMPREGADO
                      (sIdRubrica = '40370') Or // PLANO SAÚDE - DEVOLUCAO DEMITIDOS
                      (sIdRubrica = '40445') Then // PLANO ODONTO - DEVOLUCAO DEMITIDOS
                        dValorGravaDepen := dValorGravaDepen * -1;

                      sSql := 'Insert Into RETASSIST (idtitular,idpessoa,idprovento,ano,mes,valor)' + #13#10 +
                        'Values(' + pIdTitular + ',' + #13#10 +
                        sIdPessoa + ',' + #13#10 +
                        sIdRubrica + ',' + #13#10 +
                        QuotedStr(sAno) + ',' + #13#10 +
                        QuotedStr(sMes) + ',' + #13#10 +
                        StringReplace(floattostrf(dValorGravaDepen, ffnumber, 10, 2), ',', '.', []) + ')';
                      ExecSQL(sSql);

                      oSqlDepen.Next;
                    End;
                End;

              oSqlRubricas.Next;
            End;
        End;
    Except
    End;
  Finally
    FreeAndNil(oSql);
    FreeAndNil(oSqlDepen);
    FreeAndNil(_SQL);
  End;
End;

Function TCtrlGeraFolPagNormal.GerarFolhaNormal: boolean;
Var
   _ListaNumSeqRub: TStringList;
   bmMarca: TBookMark;

   sCodProvDescFGTS, sValor, sRefSal, sRefPto: String;
   bAchouBase, bProcRub, bTemParcelas, bBookMark: boolean;
   dIdRegraCalculo, dTotDesc, ValProv, dValBase, dValRubInd: double;
   IndTipoRub, c, TemLanc, QtdParc, QtdOcor: integer;

   // Comentado por não haver mais necessidade - SOL 220895  KTN 2054130 - Paulo Nobre
//   bFglDeletou: Boolean; //William Moreira da Silva - SOL 225868 - KINTANA 2059484

   bRecalculandoExcessoDebito: Boolean; // Alterado por FHBS - SOL: 144468 KTN: 952342
   CdsBckRubIndiv: TCMClientDataSet; // Alterado por FHBS - SOL: 149480 KTN: 1073549

   bValoresLimite : Boolean; //Everson Cunha - SIG33023 - Fim
Begin
   DoProgresso([MSG_PROCESSANDO]);

   //Everson Cunha - SIG33023 - Início
   bValoresLimite := False;
   FParitario := False;
   //Everson Cunha - SIG33023 - Fim

   Try
      FCdsAux := TCMClientDataSet.Create(Nil);

      _ListaNumSeqRub := TStringList.Create;

      DecodeTime(Time, FH.Hora, FH.Minuto, FH.Segundo, FH.MicroSegundo);
      FHoraInicialPessoa := FH.MicroSegundo + 1000 * FH.Segundo + 60000 * FH.Minuto + 3600000 * FH.Hora;

      FNumRegProcessados := 0;
      FIdEmpresa := -1;
      dValBase := 0;


      If (FCriarDocIndividual) Then
         FCodDocumentoCAP := 0
      Else
         FCodDocumentoCAP := -1;

      bRecalculandoExcessoDebito := False; // Alterado por FHBS - SOL: 144468 KTN: 952342
      CriaLog(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LOG_LISTA_FUNCIONARIOS.TXT', 'LISTA DE IDPESSOA: ' + FListaEmpregado); // Andre Imakawa - SIG 100668

      While Not (FCdsFunc.EOF) Do
         Begin
            FCtrlCalcRub.dVlrInssOutrasEmp := 0; //SIG93310

            If Not (bRecalculandoExcessoDebito) Then //Everson Cunha - SIG94268
            begin
              // Andre Imakawa - SIG 87548 - Inicio
              if InTransaction then
              begin
                Commit;
                StartTransaction;
              end
              else
                StartTransaction;

              FIdPessoa := FCdsFunc.FieldByName('IDPESSOA').asFloat;

              CriaLog(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LOG_EXECUCAO.TXT','IDPESSOA EM PROCESSAMENTO: ' + FCdsFunc.FieldByName('IDPESSOA').asstring); // Andre Imakawa - SIG 100668

              If (FProcesso = PREVIA) Then
                If (FOpcaoPrevia < 4) Then
                  ApagarPreviaPessoa;
              // Andre Imakawa - SIG 87548 - Fim
            end
            else
              FIdPessoa := FCdsFunc.FieldByName('IDPESSOA').asFloat;  //Everson Cunha - SIG94268

            If Not (bRecalculandoExcessoDebito) Then // Alterado por FHBS - SOL: 144468 KTN: 952342
               Inc(FNumRegProcessados);

            If Not (bRecalculandoExcessoDebito) Then // Alterado por FHBS - SOL: 149200 KTN: 1063437
               FCdsRubEsp.CancelUpdates;

            // Mensagem do Empregado atual
            DoProgresso(['', GetTempoDecorrido, FNumRegProcessados,
               'Matr: ' + Trim(FCdsFunc.FieldByName('MATRICULA').asString) +
                  '  Nome: ' + Trim(FCdsFunc.FieldByName('NOME').asString)]);

            //FIdPessoa := FCdsFunc.FieldByName('IDPESSOA').asFloat; // Andre Imakawa - SIG 87548

            PreencheListaDependentes(fIdPessoa);

            dTotDesc := 0;
            FUltValorLiquido := 0;
            FTotalGeral_Prov := 0;
            FTotalGeral_Desc := 0;
            sRefSal := '';
            sRefPto := '';
            bTemParcelas := false;

            // Incrementar contador de documentos individuais
            IncCodDocumento;

            // Selecionar dados da Empresa do empregado atual se esta for diferente dos demais
            SelDadosEmpresaAtual;

            // Preparar Datas de Férias se for o caso
            If Not (PrepararFerias) Then
               Raise Exception.Create(MessageInfo);

            // Próxima Pessoa para o caso de geração de férias mas a pessoa não possui
            If ((FTipoMotivo = FOLHA_FERIAS) And Not (FPodeGerarFerias)) Or
               ((FTipoMotivo = FOLHA_13SAL) And Not (FPodeGerarAntec13)) Then
               Begin
                  DoProgresso(['', GetTempoDecorrido, 0, '', 0, 1]);
                  FCdsFunc.Next;
                  Continue;
               End;

            // Testar o RAD das Férias
            If (FPodeGerarFerias) And (FUsaRAD) And Not (FRADFeriasOk) Then
               Begin
                  FMsgResult :=
                     'Processo RAD não está concluído. Férias não processadas.' + CR_LF +
                     'Empregado.........: ' + FCdsFunc.FieldByName('NOME').asString + CR_LF +
                     'Início Gozo Férias: ' + FDataFer2 + CR_LF +
                     Replicate('-', 50);

                  DoProgresso(['', GetTempoDecorrido, 0, '', 0, 1, FMsgResult]);
                  FCdsFunc.Next;
                  Continue;
               End;

            // Selecionar dados para a Integração CAP e geração do Arquivo de Pagamento Eletrônico
            SelDadosIntegracaoPessoa;

            For IndTipoRub := 1 To 2 Do
               Begin
                  Case (IndTipoRub) Of
                     1: // Apanhar as Rubricas Lançadas (RUBRICAINDIV) que não dependem de outras
                        If Not (SelLancSemIncidencia(bRecalculandoExcessoDebito)) Then // Alterado por FHBS - SOL: 144468 KTN: 952342
                           Raise Exception.Create(MessageInfo);

                     2: // Rubricas que só dependem da regra (não têm incidência, mas são especiais)
                        If Not (SelRubDependSomenteRegra) Then
                           Raise Exception.Create(MessageInfo);
                  End;

                  // Comentado por não haver mais necessidade - SOL 220895  KTN 2054130 - Paulo Nobre
                              //William Moreira da Silva - SOL 225868 - KINTANA 2059484
            {                  While Not (FCdsAux.EOF) Do
                                 Begin
                                    If (FCdsAux.FieldByName('FLGASSISTENCIAL').asFloat > 0) Then
                                       Begin
                                          delRetassist(FloatToStr(fIdPessoa));
                                          bFglDeletou := True;
                                          Break;
                                       End;
                                    FCdsAux.Next;
                                 End;

                              FCdsAux.First;
                              //William Moreira da Silva - SOL 225868 - KINTANA 2059484}

                              // Geração do Histórico de Rubricas Salariais
                  While Not (FCdsAux.EOF) Do
                     Begin
                        bProcRub := (Trim(FListaIdRubrica) = '');

                        If Not (bProcRub) And
                           (VerificaCodigoEm(FListaIdRubrica,
                           FCdsAux.FieldByName('IDRUBRICA').asString, ',') = 1) Then
                           Begin
                              bProcRub := true;
                           End;

                        bProcRub := (bProcRub) And
                           ((FTipoMotivo In [FOLHA_NORMAL, FOLHA_ESPECIAL]) And
                           ((FIdMotivo = FIdMotivoPadrao) And
                           (FCdsAux.FieldByName('FLGSALFAMILIA').asInteger = 1)) Or
                           ((FIdMotivo <> FIdMotivoPadrao) And
                           (FCdsAux.FieldByName('FLGSALFAMILIA').asInteger = 0)))
                           Or
                           ((FTipoMotivo = FOLHA_FERIAS) And
                           (FCdsAux.FieldByName('FLGFERIAS').asInteger = 1))
                           Or
                           ((FTipoMotivo = FOLHA_13SAL) And
                           (FCdsAux.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1));

                        // Verifica se o Afastado "tem" esta rubrica
                        If (FCdsFunc.FieldByName('TIPOSIT').asString = 'F') And
                           Not (FCdsRubXSit.Locate('IDPROVENTO;IDSITFUNC',
                           VarArrayOf([FCdsAux.FieldByName('IDRUBRICA').asFloat,
                           FCdsFunc.FieldByName('IDSITFUNC').asInteger]), [])) Then
                           Begin
                              FCdsAux.Next;
                              continue;
                           End;

                        bTemParcelas := (FCdsAux.FieldByName('FLGPERMANENTE').asInteger = 0) And
                           (FCdsAux.FieldByName('PARCELAS').asInteger > 1) And
                           (FCdsAux.FieldByName('CODRUBCLT').asString <> '90005');

                        If (bTemParcelas) Then
                           FReferencia := Trim(IntToStr(FCdsAux.FieldByName('NUMOCORRENCIAS').asInteger + 1)) +
                              '/' + Trim(FCdsAux.FieldByName('PARCELAS').asString)
                        Else
                           FReferencia := '***';

                        // CLT 90004 -> Anos Completos de Casa (Anuênio)
                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '90004') Then
                           Begin
                              FReferencia := IntToStr(Round(Int((FNormalFim -
                                 FCdsFunc.FieldByName('DATAADMISSAO').asDateTime) / 365.25)));

                              // Para a REFER estes anos não são calculados para a Referência mas
                              // vêm de uma Tabela Genérica
                              If (FTipoCliente = REFER) Then
                                 CalcAnuenioREFER(FCdsFunc.FieldByName('MATRICULA').asString, FReferencia);
                           End;

                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '40001') And (sRefSal <> '') Then
                           FReferencia := sRefSal;

                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '90009') And (sRefPto <> '') Then
                           FReferencia := sRefPto;

                        // CLT 90013 -> Avos para 13º
                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '90013') Then
                           FReferencia := IntToStr(FCtrlCalcRub.Avos13) + '/12';

                        // CLT 90014 -> Avos Integrais para Férias
                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '90014') Then
                           FReferencia := IntToStr(FCtrlCalcRub.AvosFerias) + '/12';

                        // CLT 90015 -> Avos para Férias (mod 12)
                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '90015') Then
                           FReferencia := IntToStr(FCtrlCalcRub.AvosFerias Mod 12 +
                              iff(FCtrlCalcRub.ValorRubrica(FCtrlCalcRub.TrazCodProvDescCLT('43691')) > 0,
                              1, 0)) + '/12';

                        // CLT 99xxx -> Raferencia com Valor da Rubrica indicada na CLT 99xxx
                        If (copy(FCdsAux.FieldByName('CODRUBCLT').asString, 1, 2) = '99') Then
                           FReferencia :=
                              FloatToStr(FCtrlCalcRub.ValorRubrica(
                              FCtrlCalcRub.TrazCodProvDescCLT(FCdsAux.FieldByName('CODRUBCLT').asString)));

                        sValor := FCdsAux.FieldByName('VALORRUBRICA').asString;
                        If (sValor = '') Then
                           ValProv := 0
                        Else
                           ValProv := StrToFloat(sValor);

                        // Testar se o valor deve ser recalculado
                        dIdRegraCalculo := 0;
                        If (Trim(FCdsAux.FieldByName('IDREGRACALCULO').asString) <> '') Then
                           Begin
                              If (ValProv <> 0) Then
                                 Begin
                                    If (FCdsAux.FieldByName('CODRUBCLT').asString <> '90005') And
                                       Not (bTemParcelas) Then
                                       FReferencia := sValor;

                                    If (StringEm(FCdsAux.FieldByName('CODRUBCLT').asString,
                                       ['90002', '40520', '40530', '40540']) <> -1) Then
                                       FReferencia := IntToStr(Trunc(ValProv / 60)) + 'h:' +
                                          IntToStr(Trunc((ValProv / 60 - Trunc(ValProv / 60)) * 60)) + 'm';
                                 End;

                              // Executa a Regra de Cálculo
                              dIdRegraCalculo := FCdsAux.FieldByName('IDREGRACALCULO').asFloat;
                              dValBase := 0;
                              TemLanc := 2 - IndTipoRub;
                              QtdParc := FCdsAux.FieldByName('PARCELAS').asInteger;
                              QtdOcor := FCdsAux.FieldByName('NUMOCORRENCIAS').asInteger;
                              FCtrlCalcRub.CalcBeneficio(FIdMotivo, FloatToStr(dIdRegraCalculo),
                                 FloatToStr(FIdPessoa), ValProv, dValBase, TemLanc, QtdParc, QtdOcor,
                                 FTotalGeral_Prov, FTotalGeral_Desc);

                              If (ValProv <> 0) Then
                                 Begin
                                    ValProv := Round(ValProv * 100) / 100;
                                    sValor := FloatToStr(ValProv); // Regra/Forma de Cálculo retornou valor

                                    // CLT 90030 / 90031 -> Desconto Ferias Automatico (Devolução de Férias)
                                    // Referência = Diferença em meses entre a última férias e o mês de referência
                                    // da geração "/" Quantidade de Parcelas de Devolução das Férias
                                    If (FCdsAux.FieldByName('CODRUBCLT').asString = '90030') Then
                                       SetReferenciaRubDelolucaoFerias1;

                                    If (FCdsAux.FieldByName('CODRUBCLT').asString = '90031') Then
                                       SetReferenciaRubDelolucaoFerias2;
                                 End
                              Else
                                 sValor := '';
                           End;

                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '90006') Then
                           sRefSal := sValor;

                        If (FCdsAux.FieldByName('CODRUBCLT').asString = '90008') Then
                           sRefPto := sValor;

                        // Acumular nas Secundárias porque não vai gravar em HISTRUBSAL
                        If Not (bProcRub) Then
                           Begin
                              FCdsRubXRub.Filter := 'IDRUBPRINC = ' + FCdsAux.FieldByName('IDRUBRICA').asString;
                              FCdsRubXRub.First;
                              While Not (FCdsRubXRub.EOF) Do
                                 Begin
                                    If (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                                       VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asInteger,
                                       FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                          FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), [])) Then
                                       Begin
                                          If (FCdsAux.FieldByName('CODRUBCLT').asString = '90003') And
                                             (FTipoMotivo In [FOLHA_NORMAL, FOLHA_ESPECIAL]) And
                                             (FIdMotivo = FIdMotivoPadrao) Then
                                             Begin
                                                FCdsRubXRub.Next;
                                                continue;
                                             End;
                                          SomarValorRubEspecial(ValProv, dValBase, true);
                                       End;
                                    FCdsRubXRub.Next;
                                 End;
                              FCdsAux.Next;
                              continue;
                           End;

                        // Não existe no Histórico -> 1o. preparo
                        If (sValor = '') Then
                           sValor := '0';

                        If (ValProv <> 0) Then
                           Begin
                              If Not (GravarRubrica(FCdsAux.FieldByName('IDRUBRICA').asFloat,
                                 FCdsAux.FieldByName('CODPROVDESC').asString, FIdMotivo, FMesRef, FMesPagto,
                                 IFF(FReferencia = '', '***', FReferencia), dIdRegraCalculo, 0, 0, 0,
                                 FCdsAux.FieldByName('SEQRUBRICAINDIV').asInteger, ValProv)) Then
                                 Begin
                                    Raise Exception.Create(MessageInfo);
                                 End;

                              // Somar valor ao Total Geral
                              SomarTotalGeral(FCdsAux.FieldByName('FLGDESCONTO').asInteger, ValProv);

                              If (FPodeGerarFerias) And
                                 (FCdsAux.FieldByName('FLGFERIAS').asInteger = 1) Then
                                 FGerouFerias := true;

                              If (FPodeGerarAntec13) And
                                 (FCdsAux.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1) Then
                                 FGerouAntec13 := true;

                              // Calcular Retroativo
                              If (FGerarRetroativo) And ((FSelPessoasRetroativo) Or
                                 (VerificaCodigoEm(FListaIdFuncRetroativo, FloatToStr(FIdPessoa), ',') = 1)) Then
                                 Begin
                                    If Not (CalcRetroativo(FCdsAux.FieldByName('IDRUBRICA').asString, ValProv)) Then
                                       Raise Exception.Create(MessageInfo);
                                 End;

                              If (FIntegra_CAP) Or (FIntegra_PagEletronico) Then
                                 If Not (AtualizarIntegracao(FCdsAux,
                                    FCdsAux.FieldByName('IDRUBRICA').asFloat, ValProv)) Then
                                    Raise Exception.Create(MessageInfo);
                           End;

                        FCdsAux.Next;
                     End;
               End;

            // SOL 220895  KTN 2054130 - Comentado por Paulo Nobre
            //
            // 1.Alterado Por Arnaldo V. Scarin em 13/12/2011
            // Essa rotina é responsável pela gravação dos dados
            // dos Dependentes dos Funcionarios na tabela RETASSIST
            //            If (FProcesso = FINAL) And (FCdsAux.FieldByName('FLGASSISTENCIAL').asFloat > 0) Then
            //               ValidaEGravaValoresPlanos(FloatToStr(fIdPessoa));

            FIdPatro := 0; // Código da Patro processada pela TMPDESC
            FIdPlanoContab := 0; // Código do Plano Contábil processado pela TMPDESC

            // Cálculo dos Descontos Previdenciários(FLGATRASODEVOL <> N), Assistenciais e
            // Empréstimos. Tem que ser de algum plano existente
            //If (FProcTmpDesc) Then                                    //Everson Cunha - SIG58721
            If (FProcTmpDesc) and not (bRecalculandoExcessoDebito) Then //Everson Cunha - SIG58721
               Begin
                  FCdsDescFolha.Close;
                  // Alterado por Arnaldo V. Scarin em 06/11/2010 - SOL 147224 KTN 1013674
                  FCdsDescFolha.Data := ListDescFolha(FLimDem, 'V', bRecalculandoExcessoDebito, FListaIdRubrica);
                  ProcDescFolha(FIdMotivo, 0, 'V', dTotDesc, dValBase);
                  FCdsDescFolha.Close;
                  // Alterado por Arnaldo V. Scarin em 06/11/2010 - SOL 147224 KTN 1013674
                  FCdsDescFolha.Data := ListDescFolha(FLimDem, 'T', bRecalculandoExcessoDebito, FListaIdRubrica);
               End;

            // Processamento do que já está preparado em HISTRUBSAL ou PREVIAFOLPAG (Cf. o caso)
            // ---------------------------------------------------------------------------------
            // Selecionar Histórico de Rubricas do mês
            FCdsAux.Close;
            FCdsAux.Data := ListHistoricoPessoaMes;

            // Comentado por não haver mais necessidade - SOL 220895  KTN 2054130 - Paulo Nobre
                  //William Moreira da Silva - SOL 225868 - KINTANA 2059484
      {            While Not (FCdsAux.EOF) Do
                     Begin
                        If (FCdsAux.FieldByName('FLGASSISTENCIAL').asFloat > 0) And (Not bFglDeletou) Then
                           Begin
                              delRetassist(FloatToStr(fIdPessoa));
                              Break;
                           End;
                        FCdsAux.Next;
                     End;

                  FCdsAux.First;
                  //William Moreira da Silva - SOL 225868 - KINTANA 2059484  }

            If (FCdsAux.RecordCount > 0) Then
               Begin
                  While Not (FCdsAux.EOF) Do
                     Begin
                        ValProv := FCdsAux.FieldByName('VALORPROVENTO').asFloat;

                        // SOL 220895  KTN 2054130 - Comentado por Paulo Nobre
                        //
                        // 2.Alterado Por Arnaldo V. Scarin em 13/12/2011
                        // Essa rotina é responsável pela gravação dos dados
                        // dos Dependentes dos Funcionarios na tabela RETASSIST
                        //          If (FProcesso = FINAL) And (FCdsAux.FieldByName('FLGASSISTENCIAL').asFloat > 0) Then
                        //             ValidaEGravaValoresPlanos(FloatToStr(fIdPessoa)); // SOL 220895  KTN 2054130 - Paulo Nobre

                        // Armazena o Valor Informado
                        dValBase := 0;
                        If (FCdsRubIndiv.Locate('IDPESSOA;IDEMPRESA;IDRUBRICA;SEQRUBRICAINDIV',
                           VarArrayOf([FCdsAux.FieldByName('IDPESSOA').asFloat, FIdEmpresa,
                           FCdsAux.FieldByName('IDRUBRICA').asFloat,
                              FCdsAux.FieldByName(CAMPO_SEQ_ORIGINAL).asInteger]), [])) Then
                           Begin
                              Repeat
                                 If (FCdsRubIndiv.FieldByName('ANOMESINICIO').asString <= FMesRef) Then
                                    Begin
                                       dValBase := FCdsRubIndiv.FieldByName('VALORRUBRICA').asFloat;

                                       // Atualizar Número de Ocorrências
                                       If (FProcesso = FINAL) Then
                                          Begin
                                             // SOL 125633/9081 KTN 1632926  - JRM6
                                             // Verifica se a rubrica em foco está selecionada
                                             If (FListaIdRubrica = '') Then
                                                Begin
                                                   If Not (SetRubricaIndiv_JaProcessada(FIdMotivo,
                                                      FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat,
                                                      FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger)) Then
                                                      Begin
                                                         Raise Exception.Create(MessageInfo);
                                                      End;
                                                End
                                             Else
                                                Begin
                                                   If Pos(FCdsRubIndiv.FieldByName('IDRUBRICA').AsString, FListaIdRubrica) > 0 Then
                                                      Begin
                                                         If Not (SetRubricaIndiv_JaProcessada(FIdMotivo,
                                                            FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat,
                                                            FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger)) Then
                                                            Begin
                                                               Raise Exception.Create(MessageInfo);
                                                            End;
                                                      End;
                                                   // SOL 125633/9081 KTN 1632926  - JRM6
                                                End;
                                          End;
                                    End;
                                 FCdsRubIndiv.Next;
                              Until (FCdsRubIndiv.EOF) Or
                                 ((FCdsRubIndiv.FieldByName('IDPESSOA').asFloat <>
                                 FCdsAux.FieldByName('IDPESSOA').asFloat) Or
                                 (FCdsRubIndiv.FieldByName('IDEMPRESA').asFloat <>
                                 FCdsAux.FieldByName('IDPESSJUR').asFloat) Or
                                 (FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat <>
                                 FCdsAux.FieldByName('IDRUBRICA').asFloat) Or
                                 (FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger <>
                                 FCdsAux.FieldByName(CAMPO_SEQ_ORIGINAL).asInteger));
                           End;

                        // Soma Esta Rubrica Nas Bases que Ela Compõe
                        FCdsRubXRub.Filter := 'IDRUBPRINC = ' + FCdsAux.FieldByName('IDRUBRICA').asString;
                        FCdsRubXRub.First;

                        While Not (FCdsRubXRub.EOF) Do
                           Begin
                              If FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                                 VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asInteger,
                                 FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                    FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), []) Then
                                 Begin
                                    SomarValorRubEspecial(ValProv, dValBase, true);
                                 End;
                              FCdsRubXRub.Next;
                           End;
                        FCdsAux.Next;
                     End;
               End;

            // Processa Retroativo sem Rubricas Base
            ValProv := 0;
            If (FGerarRetroativo) And (FTotSemBase > 0) And ((FSelPessoasRetroativo) Or
               (VerificaCodigoEm(FListaIdFuncRetroativo, FloatToStr(FIdPessoa), ',') = 1)) Then
               Begin
                  If Not (CalcRetroativo('XXXXXXXXXX', ValProv)) Then
                     Raise Exception.Create(MessageInfo);
               End;

            // Calcula Valor das Rubricas "Secundárias"
            FCdsRubEsp.First;
            AuxFavorecido := '0'; // Andre Imakawa - SIG 19778
            bMaisDeUmFavorecido := False; // Andre Imakawa - SIG27026 
            While Not (FCdsRubEsp.EOF) Do
               Begin
                  If ((FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat <> 0) Or
                     //Marilza Colpani - SOL 126964/KTN 668955
                     //(FCdsRubEsp.FieldByName('FLGESPECIAL').asInteger = 1) or
                     (FCdsRubEsp.FieldByName('FLGESPECIALFP').asInteger = 1) Or
                     (FCdsRubEsp.FieldByName('FLGCONSTAFOLHA').asInteger = 0) Or
                     ((FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1) And
                     (FPodeGerarAntec13)) Or
                     ((FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 1) And
                     (FPodeGerarFerias))) Then
                     Begin
                        // Verifica se o Afastado "tem" esta rubrica
                        if not bMaisDeUmFavorecido then // Andre Imakawa - SIG27026
                        Begin
                          If (FCdsFunc.FieldByName('TIPOSIT').asString = 'F') And
                             Not (FCdsRubXSit.Locate('IDPROVENTO;IDSITFUNC',
                             VarArrayOf([FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                             FCdsFunc.FieldByName('IDSITFUNC').asInteger]), [])) Then
                             Begin
                                FCdsRubEsp.Next;
                                continue;
                             End;
                        end;
                        
                        FCdsRubXRub.Filter := 'IDRUBPRINC = ' + FCdsRubEsp.FieldByName('IDPROVENTO').asString;
                        FCdsRubXRub.First;

                        sCodProvDescFGTS := FCdsRubEsp.FieldByName('CODPROVDESC').asString;
                        bAchouBase := False;
                        dValBase := 0;
                        FReferencia := '***';

                        FIdPatro := 0; // Código da Patro processada pela TMPDESC
                        FIdPlanoContab := 0; // Código do Plano Contábil processado pela TMPDESC
                        // Calculo dos Descontos Previdenciários(FLGATRASODEVOL = N)
                        // Tem que ser de qualquer plano que haja
                        If (FProcTmpDesc) Then
                           Begin
                              dTotDesc := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat;

                              // Rotina para verificar se esta secundária entra em outras
                               if not bMaisDeUmFavorecido then // Andre Imakawa - SIG27026
                               Begin
                                   If (ProcDescFolha(FIdMotivo, FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                                   'T', dTotDesc, dValBase)) Then
                                   Begin
                                      If (dTotDesc <> 0) Then
                                         Begin
                                            bmMarca := FCdsRubEsp.GetBookmark;
                                            bBookMark := false;

                                            // Arredonda valor da Rubrica
                                            ValProv := Round(dTotDesc * 100) / 100;

                                            If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90006') Then
                                               sRefSal := FloatToStr(ValProv);

                                            If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90008') Then
                                               sRefPto := FloatToStr(ValProv);

                                            // CLT 90030 / 90031 -> Desconto Ferias Automatico (Devolução de Férias)
                                            // Referência = Diferença em meses entre a última férias e o mês de referência
                                            // da geração "/" Quantidade de Parcelas de Devolução das Férias
                                            If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90030') Then
                                               SetReferenciaRubDelolucaoFerias1;

                                            If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90031') Then
                                               SetReferenciaRubDelolucaoFerias2;

                                            While Not (FCdsRubXRub.EOF) And
                                               (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90001') Do
                                               Begin
                                                  If FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                                                     VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asInteger,
                                                     FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                                        FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), []) Then
                                                     Begin
                                                        bBookMark := true;
                                                        SomarValorRubEspecial(ValProv, dValBase, true);
                                                     End;
                                                  FCdsRubXRub.Next;
                                               End;

                                            If (bBookMark) Then
                                               FCdsRubEsp.GotoBookmark(bmMarca);
                                            FCdsRubEsp.FreeBookmark(bmMarca);
                                         End;
                                      FCdsRubEsp.Next;
                                      Continue;
                                   End;
                               End;
                           End;

                        If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90004') Then
                           Begin
                              FReferencia := IntToStr(Round(Int((FNormalFim -
                                 FCdsFunc.FieldByName('DATAADMISSAO').asDateTime) / 365.25)));

                              If (FTipoCliente = REFER) Then
                                 CalcAnuenioREFER(FCdsFunc.FieldByName('MATRICULA').asString, FReferencia);
                           End;

                        // Referência
                        If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '40001') And (sRefSal <> '') Then
                           FReferencia := sRefSal;

                        If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90009') And (sRefPto <> '') Then
                           FReferencia := sRefPto;

                        // CLT 90013 -> Avos para 13º
                        If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90013') Then
                           FReferencia := IntToStr(FCtrlCalcRub.Avos13) + '/12';

                        // CLT 90014 -> Avos Integrias para Férias
                        If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90014') Then
                           FReferencia := IntToStr(FCtrlCalcRub.AvosFerias) + '/12';

                        // CLT 90015 -> Avos para Férias (mod 12)
                        If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90015') Then
                           FReferencia := IntToStr(FCtrlCalcRub.AvosFerias Mod 12 +
                              iff(FCtrlCalcRub.ValorRubrica(FCtrlCalcRub.TrazCodProvDescCLT('43691')) > 0,
                              1, 0)) + '/12';

                        // CLT 99xxx -> Raferencia com Valor da Rubrica indicada na CLT 99xxx
                        If (copy(FCdsRubEsp.FieldByName('CODRUBCLT').asString, 1, 2) = '99') Then
                           FReferencia :=
                              FloatToStr(FCtrlCalcRub.ValorRubrica(
                              FCtrlCalcRub.TrazCodProvDescCLT(FCdsRubEsp.FieldByName('CODRUBCLT').asString)));

                        // Regra/Forma de Cálculo a ser executada
                        dIdRegraCalculo := FCdsRubEsp.FieldByName('IDREGRA').asFloat;
                        If (FTipoMotivo = FOLHA_FERIAS) And
                           Not (FCdsRubEsp.FieldByName('IDREGRAFERIAS').IsNull) Then
                           dIdRegraCalculo := FCdsRubEsp.FieldByName('IDREGRAFERIAS').asFloat;

                        If (FTipoMotivo = FOLHA_13SAL) And
                           Not (FCdsRubEsp.FieldByName('IDREGRA13').IsNull) Then
                           dIdRegraCalculo := FCdsRubEsp.FieldByName('IDREGRA13').asFloat;

                        _ListaNumSeqRub.Clear;
                        dValRubInd := 0;
                        If (FCdsRubIndiv.Locate('IDPESSOA;IDEMPRESA;IDRUBRICA',
                           VarArrayOf([FIdPessoa, FIdEmpresa,
                           FCdsRubEsp.FieldByName('IDPROVENTO').asFloat]), [])) Then
                           Begin
                              // Andre Imakawa - SIG 19778 - Inicio
                              AuxRegistro := FloatToStr(FIdPessoa) + '_' + FloatToStr(FIdEmpresa) + '_'
                                               + FCdsRubIndiv.FieldByName('IDRUBRICA').AsString;
                              AuxFavorecido := FCdsRubIndiv.FieldByName('IDFAVORECIDO').AsString;
                              bMaisDeUmFavorecido := False;

                              While (FCdsRubIndiv.FieldByName('IDPESSOA').asFloat = FIdPessoa) And
                                 (FCdsRubIndiv.FieldByName('IDEMPRESA').asInteger = FIdEmpresa) And
                                 (FCdsRubIndiv.FieldByName('IDRUBRICA').asInteger =
                                 FCdsRubEsp.FieldByName('IDPROVENTO').asInteger) And
                                 Not (FCdsRubIndiv.EOF) Do
                                 Begin

                                    If Pos('.'+AuxFavorecido+'.', ListaFavorecido) <= 0 then
                                    Begin
                                      If (FCdsRubIndiv.FieldByName('ANOMESINICIO').asString <= FMesRef) Then
                                         Begin
                                            bmMarca := FCdsRubIndiv.GetBookmark; // Alterado por FHBS - SOL: 130502 KTN: 738531

                                            bAchouBase := True;
                                            dValRubInd := dValRubInd + FCdsRubIndiv.FieldByName('VALORRUBRICA').asFloat;
                                            dIdRegraCalculo := FCdsRubIndiv.FieldByName('IDREGRACALCULO').asFloat;
                                            _ListaNumSeqRub.Add(FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asString);

                                            bTemParcelas :=
                                               (FCdsRubIndiv.FieldByName('FLGPERMANENTE').asInteger = 0) And
                                               (FCdsRubIndiv.FieldByName('PARCELAS').asInteger > 1) And
                                               (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90005');

                                            // Guardar a Regra de Cálculo para o caso de existir
                                            If (bTemParcelas) Then
                                               FReferencia := Trim(IntToStr(
                                                  FCdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger + 1)) + '/' +
                                                  Trim(FCdsRubIndiv.FieldByName('PARCELAS').asString);
                                         End;
                                    end;
                                    FCdsRubIndiv.Next;

                                    If Not (FCdsRubIndiv.EOF) and
                                       (AuxRegistro = FloatToStr(FIdPessoa) + '_' + FloatToStr(FIdEmpresa) + '_'
                                               + FCdsRubIndiv.FieldByName('IDRUBRICA').AsString) Then
                                       Begin
                                       If (AuxFavorecido <> FCdsRubIndiv.FieldByName('IDFAVORECIDO').AsString) and
                                          (Pos('.'+AuxFavorecido+'.', ListaFavorecido) <= 0) then
                                          begin
                                             bMaisDeUmFavorecido := True;
                                             ListaFavorecido := ListaFavorecido + '.' + AuxFavorecido + '.';
                                             Break;
                                          end;
                                       end
                                    else
                                       Begin
                                          ListaFavorecido := '';
                                          Break;
                                       end;


                                     AuxFavorecido := FCdsRubIndiv.FieldByName('IDFAVORECIDO').AsString;

                                 End;
                              // Andre Imakawa - SIG 19778 - Fim
                              // Alterado por FHBS - SOL: 130502 KTN: 738531
                              If bAchouBase Then
                                 Begin
                                    FCdsRubIndiv.GotoBookmark(bmMarca);
                                    FCdsRubIndiv.FreeBookmark(bmMarca);
                                 End;
                              // Fim - Alterado por FHBS

                           End;

                        // Considerar a Regra em RubIndiv se esta Existir ou da Rubrica
                        If (dIdRegraCalculo = 0) Then
                           ValProv := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat
                        Else
                           Begin
                              If (bAchouBase) Then
                                 Begin
                                    ValProv := dValRubInd;

                                    If (ValProv <> 0) Then
                                       Begin
                                          If (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90005') And
                                             Not (bTemParcelas) Then
                                             FReferencia := FloatToStr(ValProv);

                                          If (StringEm(FCdsRubEsp.FieldByName('CODRUBCLT').asString,
                                             ['90002', '40520', '40530', '40540']) <> -1) Then
                                             FReferencia := IntToStr(Trunc(ValProv / 60)) + 'h:' +
                                                IntToStr(Trunc((ValProv / 60 - Trunc(ValProv / 60)) * 60)) + 'm';
                                       End;
                                    TemLanc := 1;
                                    QtdParc := FCdsRubIndiv.FieldByName('PARCELAS').asInteger;
                                    QtdOcor := FCdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger;
                                 End
                              Else
                                 Begin
                                    ValProv := 0;
                                    TemLanc := 0;
                                    QtdParc := 0;
                                    QtdOcor := 0;
                                 End;
                              dValBase := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat;

                              FCtrlCalcRub.CalcBeneficio(FIdMotivo, FloatToStr(dIdRegraCalculo),
                                 FloatToStr(FIdPessoa), ValProv, dValBase, TemLanc, QtdParc, QtdOcor,
                                 FTotalGeral_Prov, FTotalGeral_Desc);
                           End;

                        //Everson Cunha - SIG33023 - Início
                        //Cálculo da Rubrica P13 - CONT REB EMPRESA MES
                        if (FCdsRubEsp.FieldByName('IDPROVENTO').AsInteger = 32878) and (Pos('32878', FListaIdRubrica) > 0) then
                        begin
                          if not (bValoresLimite) then
                          begin
                            CalcRubP13ContRebEmpresaMes;
                            bValoresLimite := True;
                          end;

                          if FParitario then
                          begin
                            FcdsCalcRubP13ContRebEmpresaMes.Filtered := False;
                            FcdsCalcRubP13ContRebEmpresaMes.Filter := ' IDPESSOA = ' + FloatToStr(FIdPessoa);
                            FcdsCalcRubP13ContRebEmpresaMes.Filtered := True;

                            ValProv := FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('cont_empr').asFloat
                          end
                          else
                          begin
                            FcdsCalcRubP13ContRebEmpresaMes.Filtered := False;
                            FcdsCalcRubP13ContRebEmpresaMes.Filter := ' IDPESSOA = ' + FloatToStr(FIdPessoa);
                            FcdsCalcRubP13ContRebEmpresaMes.Filtered := True;
                            
                            ValProv := FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('cont_patro').asFloat;
                          end;
                        end;
                        //Everson Cunha - SIG33023 - Fim

                        // Rotina para verificar se esta secundária entra em outras
                        If (ValProv <> 0) Then
                           Begin
                              bmMarca := FCdsRubEsp.GetBookmark;
                              bBookMark := false;

                              // Arredondar valor da Rubrica
                              ValProv := Round(ValProv * 100) / 100;

                              // Referência
                              If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90006') Then
                                 sRefSal := FloatToStr(ValProv);

                              If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90008') Then
                                 sRefPto := FloatToStr(ValProv);

                              // CLT 90030 / 90031 -> Desconto Ferias Automatico (Devolução de Férias)
                              // Referência = Diferença em meses entre a última férias e o mês de referência
                              // da geração "/" Quantidade de Parcelas de Devolução das Férias
                              If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90030') Then
                                 SetReferenciaRubDelolucaoFerias1;

                              If (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90031') Then
                                 SetReferenciaRubDelolucaoFerias2;

                              While Not (FCdsRubXRub.EOF) And
                                 (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90001') Do
                                 Begin
                                    If (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                                       VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asFloat,
                                       FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                          FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), [])) Then
                                       Begin
                                          bBookMark := true;
                                          SomarValorRubEspecial(ValProv, dValRubInd, bAchouBase);
                                       End;
                                    FCdsRubXRub.Next;
                                 End;
                              If (bBookMark) Then
                                 FCdsRubEsp.GotoBookmark(bmMarca);
                              FCdsRubEsp.FreeBookmark(bmMarca);
                           End;

                        // Calcular só se for especial ou se tiver lançamento em RubricaIndiv
                        // Ou se vai entrar nos cálculos de férias e/ou 13.o
                        //Marilza Colpani - SOL 126964/KTN 668955
              //          if (not(bAchouBase) and (FCdsRubEsp.FieldByName('FLGESPECIAL').asInteger = 0)) or

                        if not bMaisDeUmFavorecido then // Andre Imakawa - SIG27026
                        Begin
                           If (Not (bAchouBase) And (FCdsRubEsp.FieldByName('FLGESPECIALFP').asInteger = 0)) Or
                             (((ValProv = 0) And
                             (((FIdMotivo <> FIdMotivoPadrao) And
                             (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 1))
                             Or
                             ((FIdMotivo = FIdMotivoPadrao) And
                             (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 0))))
                             And
                             ((Not (FPodeGerarAntec13) Or
                             (FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 0)) And
                             (Not (FPodeGerarFerias) Or
                             (FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 0)))) Then
                             Begin
                                FCdsRubEsp.Next;
                                continue;
                             End;
                        End;

                        // Gravar o valor em HISTRUBSAL (FLGSALFAMILIA SIGNIFICA: "ENTRA NA FOLHA NORMAL?")
                        If ((ValProv <> 0) Or (bAchouBase)) And
                           (
                           (
                           (FIdMotivo <> FIdMotivoPadrao) And
                           (
                           (FCdsRubEsp.FieldByName('FLGTIPOFOLHA').asInteger = 1) Or
                           (
                           // (FIdMotivo = FIdMotivoPadrao) and 16/09/2003
                           (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 0)
                           )
                           )
                           ) Or
                           (
                           (FIdMotivo = FIdMotivoPadrao) And
                           (FCdsRubEsp.FieldByName('FLGTIPOFOLHA').asInteger = 0) And
                           (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 1)
                           ) Or
                           (
                           (FPodeGerarFerias) And
                           (FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 1)
                           ) Or
                           (
                           (FPodeGerarAntec13) And
                           (FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1)
                           )
                           ) Then
                           Begin
                              If (ValProv <> 0) Then
                                 Begin
                                    If Not (GravarRubrica(
                                       FCdsRubEsp.FieldByName('IDPROVENTO').asFloat, sCodProvDescFGTS,
                                       IFF(FCdsRubEsp.FieldByName('FLGTIPOFOLHA').asInteger = 0, FIdMotivo, FIdMotivoPadrao),
                                       IncDataAM(FMesRef, FCdsRubEsp.FieldByName('INDPERIODO').asInteger),
                                       IncDataAM(FMesPagto, FCdsRubEsp.FieldByName('INDPERIODO').asInteger),
                                       IFF(FReferencia = '', '***', FReferencia), dIdRegraCalculo, 0, 0, 1, 0, ValProv,StrToIntDef(AuxFavorecido,0)// Andre Imakawa - SIG 19778
                                       ,True //Darivaldo Alencar SIG73541
                                       )) Then
                                       Begin
                                          Raise Exception.Create(MessageInfo);
                                       End;

                                    // Somar valor ao Total Geral
                                    SomarTotalGeral(FCdsRubEsp.FieldByName('FLGDESCONTO').asInteger, ValProv);

                                    If (FPodeGerarFerias) And (FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 1) Then
                                       FGerouFerias := true;

                                    If (FPodeGerarAntec13) And (FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1) Then
                                       FGerouAntec13 := true;

                                    // Calcular Retroativo
                                    If (FGerarRetroativo) And ((FSelPessoasRetroativo) Or
                                       (VerificaCodigoEm(FListaIdFuncRetroativo, FloatToStr(FIdPessoa), ',') = 1)) Then
                                       Begin
                                          If Not (CalcRetroativo(FCdsRubEsp.FieldByName('IDPROVENTO').asString, ValProv)) Then
                                             Raise Exception.Create(MessageInfo);
                                       End;

                                    If (FIntegra_CAP) Or (FIntegra_PagEletronico) Then
                                       If Not (AtualizarIntegracao(FCdsRubEsp,
                                          FCdsRubEsp.FieldByName('IDPROVENTO').asFloat, ValProv)) Then
                                          Raise Exception.Create(MessageInfo);

                                 End; // if (ValProv <> 0)

                              // Atualizar Número de Ocorrências
                              If (bAchouBase) And (FProcesso = FINAL) Then
                                 Begin
                                    For c := 0 To _ListaNumSeqRub.Count - 1 Do
                                       If Not (SetRubricaIndiv_JaProcessada(FIdMotivo,
                                          FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                                          StrToInt(_ListaNumSeqRub[c]))) Then
                                          Begin
                                             Raise Exception.Create(MessageInfo);
                                          End;
                                 End;
                           End;
                     End;
                  // Andre Imakawa - SIG 19778 - Inicio
                  if not bMaisDeUmFavorecido then
                     Begin
                        FCdsRubEsp.Next;
                        AuxFavorecido := '0';
                     End;
                   // Andre Imakawa - SIG 19778 - Fim  
               End;

            // Alterado por FHBS - SOL: 150520 KTN: 1093864
            // Acordado com o Pedro Jackson (Funcef) e o Wanderley (Funcef) juntamente com o Renato (Softek)
            // Quando for selecionada alguma rubrica, não sendo todas, não é para fazer o processo de excesso de débito
            // Alterado por FHBS - SOL: 144468 KTN: 952342
            If (FListaIdRubrica = '') And Not (bRecalculandoExcessoDebito) And (AplicaDescontoExcessoDebito) Then
               Begin
                  CdsBckRubIndiv := TCMClientDataSet.Create(Nil); // Alterado por FHBS - SOL: 149480 KTN: 1073549

                  // Alterado por FHBS - SOL: 148055 KTN: 1031910
                  If (FProcesso = FINAL) Then
                     Begin
                        // Alterado por FHBS - SOL: 149480 KTN: 1073549
                        CdsBckRubIndiv.Data := GetDataPacket('SELECT ROWID, IDLOTE, ANOMESREF, NUMOCORRENCIAS' + CR_LF +
                           '  FROM RUBRICAINDIV' + CR_LF +
                           ' WHERE IDPESSOA  = ' + FloatToStr(FIdPessoa) + CR_LF +
                           '   AND IDLOTE    = ' + FloatToStr(FIdMotivo) + CR_LF +
                           '   AND ANOMESREF = ' + QuotedStr(FMesRef));
                        // Fim - Alterado por FHBS - SOL: 149480 KTN: 1073549

                        ExecSQL('UPDATE RUBRICAINDIV' + CR_LF +
                           'SET NUMOCORRENCIAS = NUMOCORRENCIAS - 1,' + CR_LF +
                           '    IDLOTE         = NULL,' + CR_LF +
                           '    ANOMESREF      = NULL' + CR_LF +
                           'WHERE IDPESSOA  = ' + FloatToStr(FIdPessoa) + CR_LF +
                           '  AND IDLOTE    = ' + FloatToStr(FIdMotivo) + CR_LF +
                           '  AND ANOMESREF = ' + QuotedStr(FMesRef));

                        //Everson Cunha - SIG58721 - Início
                        {If (FTipoEmpresa = 'P') Then
                           Begin
						      //William Moreira da Silva - SIG 238909/18349 - 1 (um) no lugar do 0(zero) para rubricas lançadas
                              //como excesso de debito
                              ExecSQL('UPDATE TMPDESC' + CR_LF +
                                 'SET SITENVIO        = ''1'',' + CR_LF +
                                 '    DATARECEBIMENTO = NULL,' + CR_LF +
                                 '    VALORRECEBIDO   = NULL,' + CR_LF +
                                 '    IDSEQINTERNOFB  = NULL' + CR_LF +
                                 'WHERE IDPESSOA    = ' + FloatToStr(FIdPessoa) + CR_LF +
                                 '  AND IDSEQINTERNOFB = ' + FloatToStr(FIdMotivo) + CR_LF +
                                 '  AND MESCOBRANCA    = ' + QuotedStr(FMesRef));
                           End;}
                           //Everson Cunha - SIG58721 - Fim

                     End;
                  // Fim - Alterado por FHBS - SOL: 148055 KTN: 1031910

                  ExecSQL('DELETE FROM ' + FNomeTabela + CR_LF +
                     ' WHERE IDPESSOA      = ' + FloatToStr(FIdPessoa) + CR_LF +
                     '   AND MES           = ' + QuotedStr(FMesRef) + CR_LF +
                     '   AND IDPESSJUR     = ' + IntToStr(FIdEmpresa) + CR_LF +
                     '   AND IDMOTIVO      = ' + IntToStr(FIdMotivo) + CR_LF +
                     IFF(UpperCase(FNomeTabela) = 'PREVIAFOLPAG', '', ' AND IDMODULO = 21 ') + CR_LF + // Alterado por FHBS - SOL: 149200 KTN: 1063437
                     '   AND IDRUBRICA NOT IN' + CR_LF +
                     '       (SELECT IDPROVENTOEXCESSODEB' + CR_LF +
                     '          FROM PROVDESC' + CR_LF +
                     '         WHERE FLGEXCESSODEB = 1' + CR_LF +
                     '           AND IDPROVENTOEXCESSODEB IS NOT NULL   ' + CR_LF +
                     //Everson Cunha - SIG58721 - Início
                     '   UNION ALL                                      ' + CR_LF +
                     '   SELECT                                         ' + CR_LF +
                     '     TI.IDPROVENTO                                ' + CR_LF +
                     '   FROM                                           ' + CR_LF +
                     '     TMPDESC TI                                   ' + CR_LF +
                     '   WHERE                                          ' + CR_LF +
                     '     TI.IDPESSOA        = ' + FloatToStr(FIdPessoa) + CR_LF +
                     '     AND TI.MESCOBRANCA = ' + QuotedStr(FMesRef)    + CR_LF +
                     '   UNION ALL                                      ' + CR_LF +
                     '   SELECT IDPROVENTO                              ' + CR_LF +
                     '     FROM PROVDESC                                ' + CR_LF +
                     '    WHERE NVL(FLGEMPRESTIMOFINAN, 0) = 1 )        ');
                     //Everson Cunha - SIG58721 - Fim

                  bRecalculandoExcessoDebito := True;
                  Continue;
               End;

            // Alterado por FHBS - SOL: 149480 KTN: 1073549
            If (bRecalculandoExcessoDebito) Then
               Begin
                  If CdsBckRubIndiv.Active Then
                     Begin
                        CdsBckRubIndiv.First;
                        While Not CdsBckRubIndiv.Eof Do
                           Begin
                              ExecSQL('UPDATE RUBRICAINDIV' + CR_LF +
                                 'SET NUMOCORRENCIAS = ' + IFF(CdsBckRubIndiv.FieldByName('NUMOCORRENCIAS').IsNull, 'NULL', CdsBckRubIndiv.FieldByName('NUMOCORRENCIAS').AsString) + ',' + CR_LF +
                                 '    IDLOTE         = ' + IFF(CdsBckRubIndiv.FieldByName('IDLOTE').IsNull, 'NULL', CdsBckRubIndiv.FieldByName('IDLOTE').AsString) + ',' + CR_LF +
                                 '    ANOMESREF      = ' + IFF(CdsBckRubIndiv.FieldByName('ANOMESREF').IsNull, 'NULL', QuotedStr(CdsBckRubIndiv.FieldByName('ANOMESREF').AsString)) + CR_LF +
                                 'WHERE ROWID  = ' + QuotedStr(CdsBckRubIndiv.FieldByName('ROWID').AsString));
                              CdsBckRubIndiv.Next;
                           End;

                        CdsBckRubIndiv.Close;
                     End;

                  FreeAndNil(CdsBckRubIndiv);
               End;
            // Fim - Alterado por FHBS - SOL: 149480 KTN: 1073549

            bRecalculandoExcessoDebito := False;
            // Fim - Alterado por FHBS - SOL: 144468 KTN: 952342

            // Atualizar Flag das Férias
            If (FProcesso = FINAL) And ((FGerouFerias) Or ((FTipoCliente = SERPROS) And
               (FIdMotivo = FIdMotivoPadrao) And (FDataFer1 <> ''))
               or FGerarFeriasNaFolhaMensal) Then //Everson Cunha - SIG99768
               Begin
                  SetFeriasParaProcessada(StrToDate(FDataFer1), FNumSeqFerias);
               End;

            // Atualiza Flag da Antecipação do 13.o Salário
            If (FProcesso = FINAL) And ((FGerouAntec13) Or ((FTipoCliente = SERPROS) And
               (FIdMotivo = FIdMotivoPadrao))) Then
               Begin
                  SetAntec13ParaProcessada;
               End;

            // Adicionar contaliquido na query apenas para forma de pagto eletronico
            If (FIntegra_PagEletronico) Then
               SetDadosPagEletronico;

            // Alterado por FHBS - SOL: 144468 KTN: 952342
            //AplicaDescontoExcessoDebito; // Alterado por FHBS - SOL: 126446 KTN: 668959
            // Fim - Alterado por FHBS - SOL: 144468 KTN: 952342

            // SOL 220895  KTN 2054130 - Função Inclusa nesta posição por Paulo Nobre
            //
            ValidaEGravaValoresPlanos(FloatToStr(fIdPessoa));
            //

            // Próxima pessoa
      // Comentado por não haver mais necessidade - SOL 220895  KTN 2054130 - Paulo Nobre
//            bFglDeletou := false; //William Moreira da Silva - SOL 225868 - KINTANA 2059484
            FCdsFunc.Next;
            DoProgresso(['', GetTempoDecorrido, 0, '', 0, 1]);

         End;

      // Gravar CAP
      If (FIntegra_CAP) Then
         If Not (GerarIntegracaoCAP) Then
            Raise Exception.Create(MessageInfo);

      // Gravar no Banco o Pagamento Eletrônico
      If (FIntegra_PagEletronico) Then
         If Not (GerarPagEletronico) Then
            Raise Exception.Create(MessageInfo);

      FCdsAux.Free;
      _ListaNumSeqRub.Free;

      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            Result := false;
         End;
   End;
End;

Function TCtrlGeraFolPagNormal.Processar(Mes, Ano, TipoCliente, IdEmpresa: integer;
   TipoEmpresa: String; Processo: integer; DataProcessamento: TDate; TipoMotivo, IdMotivo,
   IdMotivoPadrao, OpcaoPrevia: integer; DataFeriasIni, DataFeriasFim: TDate; ListaIdEmpresa,
   ListaIdEstab, ListaEmpregado, ListaIdRubrica, ListaTipoContrato: String;
   GerarRetroativo: boolean; QuantMesesRetroativo: integer; PercRetroativo: double;
   ListaRubBaseRetroativo, ListaRubComplemRetroativo, ListaRubResultRetroativo,
   ListaTipoCalcRubRetroativo: String; SelPessoasRetroativo: boolean;
   ListaIdFuncRetroativo: String; Integra_PagEletronico, Integra_CAP: boolean; DataPagamento,
   DataEmissao: TDateTime; RateioCC, CriarDocIndividual, ConsTipoDesemb: boolean; IdUsuario, CodTipDoc,
   CodPortForma, PlanoPadrao: integer; ContaPadrao, DiretorioArqPag: String; UsaPlanoPatro, ObrigaAbc,
   ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer; ListaTipoDesemb: String;
   UsaRAD, ForcarGeracao13, MantemTmpDesc, UsaLOG: boolean): boolean;
Var
   bTransacaoAberta: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.Processar(Mes, Ano, TipoCliente, IdEmpresa,
            TipoEmpresa, Processo, DataProcessamento, TipoMotivo, IdMotivo, IdMotivoPadrao,
            OpcaoPrevia, DataFeriasIni, DataFeriasFim, ListaIdEmpresa, ListaIdEstab, ListaEmpregado,
            ListaIdRubrica, ListaTipoContrato, GerarRetroativo, QuantMesesRetroativo, PercRetroativo,
            ListaRubBaseRetroativo, ListaRubComplemRetroativo, ListaRubResultRetroativo,
            ListaTipoCalcRubRetroativo, SelPessoasRetroativo, ListaIdFuncRetroativo,
            Integra_PagEletronico, DataPagamento, DataEmissao, RateioCC, CriarDocIndividual, ConsTipoDesemb,
            IdUsuario, CodTipDoc, CodPortForma, DiretorioArqPag, UsaPlanoPatro, ObrigaAbc,
            ObrigaCRespon, PlanoPrevGlobal, PatroGlobal, ListaTipoDesemb, UsaRAD,
            ForcarGeracao13, MantemTmpDesc, UsaLOG, FLOG);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         bTransacaoAberta := false;
         MessageInfo := '';
         FTempoDecorridoTotal := 0;
         FMantemTmpDesc := MantemTmpDesc;
         FCtrlCalcRub.dVlrInssOutrasEmp := 0; //SIG93310

         DecodeTime(Time, FH.Hora, FH.Minuto, FH.Segundo, FH.MicroSegundo);
         FH.HoraInicial := FH.MicroSegundo + 1000 * FH.Segundo + 60000 * FH.Minuto + 3600000 * FH.Hora;
         Try


            // Atribuir variáveis
            FGeracaoFolhaNormal := true;
            FIntegra_CAP := Integra_CAP;
            FIntegra_PagEletronico := Integra_PagEletronico;
            FTipoCliente := TipoCliente;
            FIdEmpresa := IdEmpresa;
            FTipoEmpresa := TipoEmpresa;
            FProcesso := Processo;
            FDataProcessamento := DataProcessamento;
            FTipoMotivo := TipoMotivo;
            FIdMotivo := IdMotivo;
            FIdMotivoPadrao := IdMotivoPadrao;
            FOpcaoPrevia := OpcaoPrevia;
            FDataFeriasIni := DataFeriasIni;
            FDataFeriasFim := DataFeriasFim;
            FListaIdEmpresa := ListaIdEmpresa;
            FListaIdEstab := ListaIdEstab;
            FListaEmpregado := ListaEmpregado;
            FListaIdRubrica := ListaIdRubrica;
            FListaTipoContrato := ListaTipoContrato;
            FGerarRetroativo := GerarRetroativo;
            FQuantMesesRetroativo := QuantMesesRetroativo;
            FPercRetroativo := PercRetroativo;
            FSelPessoasRetroativo := SelPessoasRetroativo;
            FListaIdFuncRetroativo := ListaIdFuncRetroativo;
            FDataPagamento := DataPagamento;
            FDataEmissao := DataEmissao;
            FRateioCC := RateioCC;
            FCriarDocIndividual := CriarDocIndividual;
            FConsTipoDesemb := ConsTipoDesemb;
            FCodPortForma := CodPortForma;
            FDiretorioArqPag := DiretorioArqPag;
            FUsaPlanoPatro := UsaPlanoPatro;
            FPlanoPrevGlobal := PlanoPrevGlobal;
            FPatroGlobal := PatroGlobal;
            FListaTipoDesemb := ListaTipoDesemb;
            FUsaRAD := UsaRAD;
            FForcarGeracao13 := ForcarGeracao13;
            FPlanoPadrao := PlanoPadrao;
            FContaPadrao := ContaPadrao;

            FMesRef := IntToStr(Ano) + '/' + PoeZero(Mes);
            FMesPagto := IntToStr(ExtraiAno(FDataProcessamento)) + '/' +
               PoeZero(ExtraiMes(FDataProcessamento));

            // Criação dos objetos de armazenamento
            If Not (CriarObjetos_Geracao) Then
               Raise Exception.Create(MessageInfo);

            FCdsAntec13.Close;
            FCdsAntec13.Data := FCtrlAntec13.ListAntecipacao13(0, Mes, Ano);
            FCdsParamRH.Close;
            FCdsParamRH.Data := FCtrlGlobalRH.GetParamRH('NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, LIMDEM');
            FNormalFim := FCdsParamRH.FieldByName('NORMALFIM').asDateTime;
            FLimDem := FCdsParamRH.FieldByName('LIMDEM').asInteger;

            If (FGerarRetroativo) Then
               Begin
                  FListaRubBase.Text := ListaRubBaseRetroativo;
                  FListaRubComplem.Text := ListaRubComplemRetroativo;
                  FListaRubResult.Text := ListaRubResultRetroativo;
                  FListaRubTipoCalc.Text := ListaTipoCalcRubRetroativo;
                  InitRetroativo;
               End;

            FCtrlIntegraRH.CdsDocumentos := FCdsDocumentos;
            FCtrlIntegraRH.ObrigaAbc := ObrigaAbc;
            FCtrlIntegraRH.ObrigaCRespon := ObrigaCRespon;
            FCtrlIntegraRH.IdEmpresa := FIdEmpresa;
            FCtrlIntegraRH.IdModulo := MODFOL;
            FCtrlIntegraRH.IdUsuario := IdUsuario;
            FCtrlIntegraRH.CodTipDoc := CodTipDoc;

            If (UsaLOG) Then
               FCtrlCalcRub.LOG := '';

            FCtrlCalcRub.IdEmpresa := FIdEmpresa;
            FCtrlCalcRub.TipoEmpresa := FTipoEmpresa;
            FCtrlCalcRub.TipoExecucao := texNormal;

            FCtrlCalcRub.IdPessoa := ''; // Alterado por FHBS - 10/10/2019 - SIG92477                                    

            DoProgresso([MSG_INICIO_PROCESSO]);

            // Andre Imakawa - SIG 84696 - Inicio
            if not(InTransaction) then
              StartTransaction;

            FU.VerificaCessacaoIR(0,FListaEmpregado);

            Commit;
            // Andre Imakawa - SIG 84696 - Fim

            FCtrlCalcRub.ListaIdPessoa := FListaEmpregado;
            FCtrlCalcRub.UsaLOG := UsaLOG;
            FCtrlCalcRub.IniFormaCalc(IFF(GerarRetroativo, GERACAO_RETROATIVO, GERACAO_NORMAL));

            // Abrir Querys auxiliares
            FCdsRubIndiv.Close;
            FCdsRubIndiv.Data := ListRubricaIndiv;

            FCdsRubXRub.Filter := '';
            FCdsRubXRub.Close;
            FCdsRubXRub.Data := ListRubXRub;
            FCdsRubXRub.Filtered := true;

            FCdsRubXSit.Close;
            FCdsRubXSit.Data := ListRubXSit;

            DoProgresso(['', GetTempoDecorrido]);

            If Not (Init_Integracao) Or Not (AbrirSQLFunc) Then
               Raise Exception.Create(MessageInfo);

            DoProgresso(['', GetTempoDecorrido]);

            // Verificar se há lançamentos na TMPDESC para a(s) pessoa(s) envolvida(s) no processo
            If (FTipoEmpresa = 'P') Then
               FProcTmpDesc := ExisteRegistro_TmpDesc(FListaEmpregado)
            Else
               FProcTmpDesc := false;

            // Preparar Rubrica Especiais (Rubricas de Incidência)
            If (PrepararRubEspeciais) Then
               DoProgresso(['', GetTempoDecorrido])
            Else
               Raise Exception.Create(MessageInfo);

            // Início da Transação
            StartTransaction;
            bTransacaoAberta := true;

            If (FProcesso = PREVIA) Then
               Begin
                  FNomeTabela := 'PREVIAFOLPAG';

                  // Apagar Prévia anterior de acordo com os parâmetros especificados
                  If (FOpcaoPrevia < 4) Then
                     Begin
                        If (ApagarPrevia) Then
                           DoProgresso(['', GetTempoDecorrido])
                        Else
                           Raise Exception.Create(MessageInfo);
                     End;

                  // Alimentar Prévia com valores armazenados no mês para o Tipo de Folha especificado
                  If (AlimentarPrevia) Then
                     DoProgresso(['', GetTempoDecorrido])
                  Else
                     Raise Exception.Create(MessageInfo);
               End
            Else
               FNomeTabela := 'HISTRUBSAL';

            FCtrlCalcRub.NomeTabela := FNomeTabela;
            FCtrlCalcRub.MesRef := FMesRef;

            If Not (GerarFolhaNormal) Then
               Raise Exception.Create(MessageInfo);

            Commit;

            MessageInfo := MSG_GERACAO_OK;
            Result := true;

            DecodeTime(Time, FH.Hora, FH.Minuto, FH.Segundo, FH.MicroSegundo);
            FH.HoraAtual := FH.MicroSegundo + 1000 * FH.Segundo + 60000 * FH.Minuto + 3600000 * FH.Hora;
            FTempoDecorridoTotal := FH.HoraAtual - FH.HoraInicial;
            FTempoDecorridoPessoa := FH.HoraAtual - FHoraInicialPessoa;
            DoProgresso(['', GetTempoDecorrido]);
         Except
            On E: Exception Do
               Begin
                  Result := false;

                  If (bTransacaoAberta) Then
                     Rollback;

                  MessageInfo := MSG_ERRO_GERACAO + CR_LF + E.Message;
               End;
         End;
         // Destruição dos objetos de armazenamento
         DestruirObjetos_Geracao;

         If (UsaLOG) Then
            FLOG := FCtrlCalcRub.LOG;
      End;
End;

// Andre Imakawa - SIG 87548 - Inicio
Function TCtrlGeraFolPagNormal.ApagarPreviaPessoa: boolean;
Var
   sTiposFolha: String;
Begin
  Result := False;
  Try

    If (FIdMotivo > 0) Then
      sTiposFolha := IntToStr(FIdMotivo)
    Else
      sTiposFolha := IntToStr(FIdMotivoPadrao);

    FSQL := 'WHERE (IDPESSOA = ' + FloatToStr(FIdPessoa) + ' )';

    If (FOpcaoPrevia In [1, 3]) Then
      If (Pos(',', sTiposFolha) = 0) Then
        FSQL := FSQL + ' AND (IDMOTIVO = ' + sTiposFolha + ')'
      Else
        FSQL := FSQL + ' AND (IDMOTIVO IN (' + sTiposFolha + '))';


    ExecSQL('DELETE FROM PREVIAFOLPAG ' + FSQL);
    Result := true;
  Except
    On E: Exception Do
       MessageInfo := MSG_ERRO_EXCLUSAO_PREVIA + E.Message;
  End;
End;
// Andre Imakawa - SIG 87548 - Fim

      // Comentado por não haver mais necessidade - SOL 220895  KTN 2054130 - Paulo Nobre

//William Moreira da Silva - SOL 225868 - KINTANA 2059484
{Procedure TCtrlGeraFolPagNormal.delRetassist(Const sidPessoa: String);
Var sSql, sAno, sMes: String;
Begin
   sAno := Copy(FMesRef, 1, 4);
   sMes := Copy(FMesRef, 6, 2);

   // Deleta todos os dependentes do mes de processamento
   sSql := 'Delete from  RETASSIST' + #13#10 +
      'where idTitular  = ' + sidPessoa + #13#10 +
      '  and ano        = ' + QuotedStr(sAno) + #13#10 +
      '  and mes        = ' + QuotedStr(sMes);
   ExecSql(sSql);
End;
//William Moreira da Silva - SOL 225868 - KINTANA 2059484  }

procedure TCtrlGeraFolPagNormal.CalcRubP13ContRebEmpresaMes;
var
  cdsValorLimite, cdsContEmpre : TCMClientDataSet;
  ValorLimite, ContEmpre, pv1 : Double;
begin
  try
    cdsValorLimite := TCMClientDataSet.Create(Nil);
    cdsContEmpre := TCMClientDataSet.Create(Nil);

    //Tabela Genérica - Tab_Reb_2002
    FcdsTabReb2002.Data := ListTabReb2002;

    //Valor Limite
    cdsValorLimite.Data := GetDataPacket(
    'SELECT sum(h.VALORPROVENTO) vlr_limite                           '#13#10 +
    '  FROM ' + FNomeTabela + ' H                                     '#13#10 +
    '  JOIN cm.funcionario f ON f.IDPESSOA = h.IDPESSOA               '#13#10 +
    ' WHERE h.MES = ' + QuotedStr(FMesRef)                           + #13#10 +
    '   AND h.IDMOTIVO = ' + IntToStr(FIdMotivo)                     + #13#10 +
    '   AND h.IDRUBRICA IN (22340) /*P13 - PROVISAO 13 SALARIO MES*/  '#13#10 +
    '   AND EXISTS (SELECT 1                                          '#13#10 +
    '                 FROM ' + FNomeTabela + ' hi                     '#13#10 +
    '                WHERE hi.idpessoa = h.idpessoa                   '#13#10 +
    '                  AND hi.mes = h.mes                             '#13#10 +
    '                  AND hi.IDMOTIVO = h.idmotivo                   '#13#10 +
    '                  AND hi.IDRUBRICA IN (32831)/*P13 - CONT REB EMPREGADO MES*/)' );

    ValorLimite := cdsValorLimite.fieldbyname('vlr_limite').asFloat * FcdsTabReb2002.fieldbyname('PERC_PATROC').asFloat;

    //Rubricas Empregado
    cdsContEmpre.Data := GetDataPacket(
    'SELECT sum(h.VALORPROVENTO) cont_limite              '#13#10 +
    '  FROM ' + FNomeTabela + ' H                        '#13#10 +
    '  JOIN cm.funcionario f ON f.IDPESSOA = h.IDPESSOA  '#13#10 +
    ' WHERE h.MES = ' + QuotedStr(FMesRef)              + #13#10 +
    '   AND h.IDMOTIVO = ' + IntToStr(FIdMotivo)        + #13#10 +
    '   AND h.IDRUBRICA IN (32831) /*P13 - CONT REB EMPREGADO MES*/ ' );

    ContEmpre := cdsContEmpre.fieldbyname('cont_limite').asFloat;

    FcdsCalcRubP13ContRebEmpresaMes.Data := ListEmpregadosCalcRubP13;

    if ContEmpre <= ValorLimite then
    begin
      Fparitario := True;
    end
    else
    begin
      pv1 := ValorLimite - FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('soma_custeio').asFloat - FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('soma_risco').asFloat -
      FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('soma_pb').asFloat - FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('soma_pc').asFloat;

      FcdsCalcRubP13ContRebEmpresaMes.First;
      while not (FcdsCalcRubP13ContRebEmpresaMes.eof) do
      begin
        FcdsCalcRubP13ContRebEmpresaMes.Edit;

        FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('cont_patro').asFloat := FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('pb').asFloat +
        FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('pc').asFloat + (pv1 * FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('percprop').asFloat) +
        FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('risco').asFloat + FcdsCalcRubP13ContRebEmpresaMes.fieldbyname('custeio').asFloat;

        FcdsCalcRubP13ContRebEmpresaMes.Post;

        FcdsCalcRubP13ContRebEmpresaMes.Next;
      end;
    end;

  finally
    cdsValorLimite.Free;
    cdsContEmpre.Free;
  end;
end;

function TCtrlGeraFolPagNormal.ListTabReb2002: OleVariant;
begin
  result := GetDataPacket(
  'SELECT BRISCO_PARTIC.NUMLINHA, BRISCO_PARTIC.BRISCO_PARTIC,                   '#13#10 +
  '       BRISCO_PATROC.BRISCO_PATROC, DATA.DATA, DES_ADM_ASSIST.DES_ADM_ASSIST, '#13#10 +
  '       DES_ADM_ATIVO.DES_ADM_ATIVO, DES_ADM_PATR.DES_ADM_PATR,                '#13#10 +
  '       to_number(PERC_PATROC.PERC_PATROC, ''99999999999D9999999999999'', ''NLS_NUMERIC_CHARACTERS = ''''.,'''''') PERC_PATROC,  '#13#10 +
  '       UR.UR                                                                  '#13#10 +
  '  FROM (SELECT V1.NUMLINHA, V1.VALOR AS BRISCO_PARTIC                         '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''BRISCO_PARTIC'') BRISCO_PARTIC           '#13#10 +
  '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS BRISCO_PATROC                         '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''BRISCO_PATROC'') BRISCO_PATROC           '#13#10 +
  '            ON BRISCO_PATROC.NUMLINHA = BRISCO_PARTIC.NUMLINHA                '#13#10 +
  '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DATA                                  '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''DATA'') DATA                             '#13#10 +
  '            ON BRISCO_PARTIC.NUMLINHA = DATA.NUMLINHA                         '#13#10 +
  '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_ASSIST                        '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_ASSIST'') DES_ADM_ASSIST         '#13#10 +
  '            ON BRISCO_PARTIC.NUMLINHA = DES_ADM_ASSIST.NUMLINHA               '#13#10 +
  '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_ATIVO                         '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_ATIVO'') DES_ADM_ATIVO           '#13#10 +
  '            ON BRISCO_PARTIC.NUMLINHA = DES_ADM_ATIVO.NUMLINHA                '#13#10 +
  '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_PATR                          '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_PATR'') DES_ADM_PATR             '#13#10 +
  '            ON BRISCO_PARTIC.NUMLINHA = DES_ADM_PATR.NUMLINHA                 '#13#10 +
  '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS PERC_PATROC                           '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''PERC_PATROC'') PERC_PATROC               '#13#10 +
  '            ON BRISCO_PARTIC.NUMLINHA = PERC_PATROC.NUMLINHA                  '#13#10 +
  '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS UR                                    '#13#10 +
  '          FROM VALTABGENER V1                                                 '#13#10 +
  '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
  '           AND TRIM(V1.CODCAMPO) = ''UR'') UR                                 '#13#10 +
  '            ON BRISCO_PARTIC.NUMLINHA = UR.NUMLINHA                           '#13#10 +
  ' WHERE TO_DATE(DATA.DATA) = (SELECT MAX(TO_DATE(V1.VALOR)) AS DATA            '#13#10 +
  '                               FROM VALTABGENER V1                            '#13#10 +
  '                              WHERE V1.CODTABELA = ''TAB_REB_2002''           '#13#10 +
  '                                AND TRIM(V1.CODCAMPO) = ''DATA''              '#13#10 +
  '                                AND TO_DATE(V1.VALOR) <= TO_DATE(' + QuotedStr(FMesRef) + ', ''YYYY/MM''))' );
end;

function TCtrlGeraFolPagNormal.ListEmpregadosCalcRubP13: OleVariant;
begin
  result := GetDataPacket(
  '   WITH tb_cont_empregado AS (                   '#13#10 +
  ' SELECT hh.idpessoa, hh.VALORPROVENTO cont_empr  '#13#10 +
  '   FROM ' + FNomeTabela + ' hh                   '#13#10 +
  '  WHERE hh.MES = ' + QuotedStr(FMesRef)         + #13#10 +
  '    AND hh.IDMOTIVO = ' + IntToStr(FIdMotivo)   + #13#10 +
  '    AND hh.IDRUBRICA = 32831)                    '#13#10 +

  ' SELECT calc.*,                                  '#13#10 +
  '        cont_liq - nb - nc nv, nb pb, nc pc,     '#13#10 +
  '        CASE WHEN (sum(cont_liq - nb - nc) OVER ()) > 0 THEN       '#13#10 +
  '          (cont_liq - nb - nc) / (sum(cont_liq - nb - nc) OVER ()) '#13#10 +
  '        ELSE                                     '#13#10 +
  '          0                                      '#13#10 +
  '        END percprop,                            '#13#10 +
  '        sum(custeio) OVER () soma_custeio,       '#13#10 +
	'        sum(risco) OVER () soma_risco,           '#13#10 +
	'        sum(nb) OVER () soma_pb,                 '#13#10 +
	'        sum(nc) OVER () soma_pc,                 '#13#10 +
  '        0 as cont_patro                          '#13#10 +

  '   FROM (                                        '#13#10 +

  ' SELECT base.*,                                  '#13#10 +
  '        CASE WHEN nb1 < cont_liq THEN            '#13#10 +
  '          nb1                                    '#13#10 +
  '        ELSE                                     '#13#10 +
  '          cont_liq                               '#13#10 +
  '        END nb,                                  '#13#10 +
  '        CASE WHEN                                '#13#10 +
  '          cont_liq -                             '#13#10 +
  '        CASE WHEN nb1 < cont_liq THEN            '#13#10 +
  '          nb1                                    '#13#10 +
  '        ELSE                                     '#13#10 +
  '          cont_liq                               '#13#10 +
  '        END /*nc1*/ <                            '#13#10 +
  '        CASE WHEN (provisao - ' + FcdsTabReb2002.fieldbyname('UR').asString + ') * 0.06 < 0 THEN  '#13#10 +
  '          0                                      '#13#10 +
  '        ELSE                                     '#13#10 +
  '        (provisao - ' + FcdsTabReb2002.fieldbyname('UR').asString + ') * 0.06                     '#13#10 +
  '        END /*nc2*/ THEN                         '#13#10 +
  '        cont_liq -                               '#13#10 +
  '        CASE WHEN nb1 < cont_liq THEN            '#13#10 +
  '          nb1                                    '#13#10 +
  '        ELSE                                     '#13#10 +
  '          cont_liq                               '#13#10 +
  '        END /*nc1*/                              '#13#10 +
  '        ELSE                                     '#13#10 +
  '        CASE WHEN (provisao - ' + FcdsTabReb2002.fieldbyname('UR').asString + ') * 0.06 < 0 THEN  '#13#10 +
  '        0                                        '#13#10 +
  '        ELSE                                     '#13#10 +
  '        (provisao - ' + FcdsTabReb2002.fieldbyname('UR').asString + ') * 0.06                     '#13#10 +
  '        END /*nc2*/                              '#13#10 +
  '        END NC                                   '#13#10 +

  '   FROM (                                        '#13#10 +
  ' SELECT h.IDPESSOA, h.MES, h.VALORPROVENTO provisao, ce.cont_empr,                                         '#13#10 +
  '        ce.cont_empr * ' + FcdsTabReb2002.fieldbyname('DES_ADM_ATIVO').asString + ' custeio,               '#13#10 +
  '        h.VALORPROVENTO * ' + FcdsTabReb2002.fieldbyname('BRISCO_PARTIC').asString + ' risco,              '#13#10 +
  '        ce.cont_empr - (ce.cont_empr * ' + FcdsTabReb2002.fieldbyname('DES_ADM_ATIVO').asString + ') -     '#13#10 +
  '        (h.VALORPROVENTO * ' + FcdsTabReb2002.fieldbyname('BRISCO_PARTIC').asString + ') cont_liq,         '#13#10 +
  '        h.VALORPROVENTO * 0.02 nb1                                                                         '#13#10 +
  '   FROM ' + FNomeTabela + ' h                                                                              '#13#10 +
  '   JOIN tb_cont_empregado ce ON ce.idpessoa = h.idpessoa                                                   '#13#10 +
  '   JOIN cm.funcionario f ON f.IDPESSOA = h.IDPESSOA                                                        '#13#10 +
  '  WHERE h.MES = ' + QuotedStr(FMesRef)                                                                    + #13#10 +
  '    AND h.IDMOTIVO = ' + IntToStr(FIdMotivo)                                                              + #13#10 +
  '    AND h.IDRUBRICA IN (22340)                                                                             '#13#10 +
  '    AND EXISTS (SELECT 1                                                                                   '#13#10 +
  '                  FROM ' + FNomeTabela + ' hi                                                              '#13#10 +
  '                 WHERE hi.idpessoa = h.idpessoa                                                            '#13#10 +
  '                   AND hi.mes = h.mes                                                                      '#13#10 +
  '                   AND hi.IDMOTIVO = h.idmotivo                                                            '#13#10 +
  '                   AND hi.IDRUBRICA = 32831)) base )calc'  );
end;

// Andre Imakawa - SIG 100668 - Inicio
Procedure TCtrlGeraFolPagNormal.CriaLog(sArquivo, sTexto : String);
Var oArquivo : TextFile;
Begin
  try
    AssignFile(oArquivo, sArquivo);
    rewrite(oArquivo);
    //Reset (oArquivo);
    writeln(oArquivo, sTexto);
  finally
    CloseFile(oArquivo);
  end;
End;
Procedure TCtrlGeraFolPagNormal.DeletaLog(sArquivo : String);
Var oArquivo : TextFile;
Begin
  If FileExists(sArquivo) Then
    deletefile(sArquivo);

End;
// Andre Imakawa - SIG 100668 - Fim


End.
