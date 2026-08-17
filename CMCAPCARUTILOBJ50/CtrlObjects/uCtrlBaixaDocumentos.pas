{
Atender...........: WO22484
Data..............: 23/06/2025
Responsável.......: Luis Ferrari
Descrição.........: Correção para truncar a data na query.
--------------------------------------------------------------------------------------------------------
N. SIG............: 118650
Data..............: 17/08/2021
Responsável.......: Ewerton Beltramini
Descrição.........: Correção da inexistência do campo da data de baixa.
--------------------------------------------------------------------------------------------------------
Rotina............: ProcessaBaixaManual
N. SIG............: 115974
Data..............: 12/07/2021
Responsável.......: Edilaine
Descrição.........: ajuste na data de lançamento do arquivo SIACC no movimento financeiro
--------------------------------------------------------------------------------------------------------
Rotina............: AcertaDifRateio
N. SIG............: 100873
Data..............: 12/01/2021
Responsável.......: Edilaine
Descrição.........: Rateio financeiro x contabil divergente na multiplas baixas
--------------------------------------------------------------------------------------------------------
Rotina............: AcertaDifRateio
N. SIG............: SIG101374
Data..............: 16/09/2020
Responsável.......: Edilaine
Descrição.........: Rateio financeiro x contabil divergente com alterador negativo
--------------------------------------------------------------------------------------------------------
Rotina............: BuscaDebCreFromAlterador, ProcessaBaixaManual e LancaAlteradores
N. SIG............: SIG112203
Data..............: 04/01/2020
Responsável.......: André Imakawa
Descrição.........: Buscar historico do alterador da tabela MODELOSCNAB
--------------------------------------------------------------------------------------------------------
Rotina............: AcertaDifRateio
N. SIG............: SIG56764
Data..............: 18/10/2017
Responsável.......: Osni Cavalcante
Descrição.........: Desfazimento das alterações realizadas no SIG33462
--------------------------------------------------------------------------------------------------------
Rotina............: AcertaDifRateio
N. SIG............: SIG33462
Data..............: 19/01/2016
Responsável.......: Peterson Victor
Descrição.........: Acerto de diferenças na baixa
--------------------------------------------------------------------------------------------------------
Rotina............: AcertaDifRateio
N. SIG............: 28992
Data..............: 13/05/2016
Responsável.......: Peterson Victor
Descrição.........: Correção diferença na baixa
--------------------------------------------------------------------------------------------------------
N. SIG............: 26730
Data..............: 04/08/2016
Responsável.......: Peterson Victor
Descrição.........: Correção diferença na baixa
--------------------------------------------------------------------------------------------------
Rotina............: documento.update
N. Sol............: 257204
N. PPM............: 991062
Data..............: 28/07/2015
Responsável.......: William Moreira da Silva
Descrição.........: Ajuste na validação de emissão de boleto
--------------------------------------------------------------------------------------------------
Rotina............: BaixaDocumento
N. Sol............: 199439-16087
N. PPM............: 383261
Data..............: 19/09/2013
Responsável.......: Edilaine Ferraresi
Descrição.........: Ajustes para divergencia entre planos
--------------------------------------------------------------------------------------------------
Nº SOL......: 235849
Nº PPM......: 459943
Data........: 23/07/2014
Responsável.: Paulo Nobre SOL 235849 PPM 459943
Descrição...: Ajuste na baixa automatica
=====================================================================================
//Rotina                : GetEmptyCdsBaixa
//N. Sol..........      : 214738_15892
//N. Kintana......      : 2057238
//Data da Alteração:    : 13/03/2014
//Alteração Form:       : FBaixaIntBancoMT
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão do campo virtual FLGMARCADO
//******************************************************************************************
{ --------------------------------------------------------------------------------------------------
Rotina......: GetEmptyCdsBaixa
Nº SOL......: 221352
Nº KINTANA..: 2053933
Data........: 26/11/2013
Responsável.: Edilaine Ferraresi
Descrição...: flag para baixa total
{ --------------------------------------------------------------------------------------------------
Rotina............: ProcessaBaixaAutomatica, ProcessaBaixaManual, DocumentoComBaixaMista
N. Sol............: 124845-14262
N. Kintana........: 1977287
Data..............: 23/05/2013
Responsável.......: Edilaine Ferraresi
Descrição.........: Ajuste da rotina de arredondamento para diferença de centavos
{ --------------------------------------------------------------------------------------------------
Rotina..........: GerarArquivo
N. Sol..........: 187427-13894
N. Kintana......: 1920585
Data............: 24/01/2013
Responsável.....: Edilaine Ferraresi
Descrição.......: Incluir Codigo do modelo CNAB no arquivo ETL
-----------------------------------------------------------------------------
Nº SOL......: 187427/12463
Nº KINTANA..: 185959
Data........: 12/12/2012
Responsável.: TADEU PASSOS
Descrição...: Inclusão de novo campo na função GetEmptyCdsBaixa()
-----------------------------------------------------------------------------
Nº SOL......: 197595
Nº KINTANA..: 1894470
Data........: 26/12/2012
Responsável.: Edilaine Ferraresi
Rotina......: ProcessaBaixaManual
Descrição...: Validar se a baixa é de documento a pagar e não passar pela rotina de FDO
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}
{
--------------------------------------------------------------------------------------------------
Rotina..........: ProcessaBaixaManual
N. Sol..........: 191915
N. Kintana......: 1823081
Data............: 24/10/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: barra de processamento, commit dentro processamento dos documentos
--------------------------------------------------------------------------------------------------
Rotina......: BuscaDocFilho ,BuscaDocFilhoBaixado
Nº SOL......: 126261/1121
Nº KINTANA..: 760963
Data........: 10/01/2012
Responsável.: Helen V Bianchi
Descrição...: Adicionado a Data Disponibilidade, criação BuscaDocFilhoBaixado ,DadosFilhoBaixado
--------------------------------------------------------------------------------------------------
Rotina......: BaixaDocumento
Nº SOL......: 173082
Nº KINTANA..: 1562005
Data........: 31/01/2012
Responsável.: Helen V Bianchi
Descrição...: Na Descricao , filtrar apenas LOTES ATIVOS
Rotina......: BaixaDocumento
--------------------------------------------------------------------------------------------------
Rotina......: BaixaDocumento, ProcessaBaixaManual
Nº SOL......: 151965
Nº KINTANA..: 1124894
Data........: 07/12/2011
Responsável.: Arnaldo Vicente Scarin
Descrição...: Inclusão de um flag para indicar a baixa do arquivo de retorno SIGCB
Rotina......: BaixaDocumento, ProcessaBaixaManual
--------------------------------------------------------------------------------------------------
Nº SOL......: 151965
Nº KINTANA..: 1124894
Data........: 07/12/2011
Responsável.: Arnaldo Vicente Scarin
Descrição...: Inclusão de um flag para indicar a baixa do arquivo de retorno SIGCB
--------------------------------------------------------------------------------------------------
Rotina......: GetEmptyCdsBaixa
Nº SOL......: 155003
Nº KINTANA..: 1195982
Data........: 21/03/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do campo "DATABAIXA".
---------------------------------------------------------------------------------------------------}
{
Rotina............: LocalizaDocSemLancFinanc, BaixaDocumento
N. Sol.............: 111077
N. Kintana......: 509193
Data...............: 10/03/2009
Responsável...: Ricardo Alves
Descrição........: Baixa manual/automática não estava sensibilizando
  o financeiro. Também não estava agrupando as contas.
}
{
Rotina............: LocalizaDocSemLancFinanc
N. Sol.............: 110723
N. Kintana......: 506793
Data...............: 05/03/2009
Responsável...: Ricardo Alves
Descrição........: Baixa manual de apenas um documento não estava sensibilizando
  o financeiro.
}
{
Rotina............: LocalizaDocSemLancFinanc, BaixaDocumento
N. Sol.............: 110469, 110532
N. Kintana......: 505144, 505141
Data...............: 04/03/2009
Responsável...: Ricardo Alves
Descrição........: Lançamentos financeiros de um mesmo portador são
  agrupados em um único lançamento.
}
{
Rotina............: ProcessaBaixaManual, BaixaDocumento
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
     da memória após sua utilização.
}
{
--------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaAutomatica e ProcessaBaixaManual
Data      : 22.03.2007
Autor     : Marcus Oliveira
pendência : 24309
Descrição : Passar a observação para o historico de acordo com o parametro contabil
--------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumentos
Data      : 08.02.2007
Autor     : David Ayrolla
pendência : 21696
Descrição : Envio de e-mail na regularização de lançamentos não identificados.
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 28/11/2006
Autor     : David Ayrolla
Descrição : Implementar chamadas ao Rad+
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : ProcessaBaixaAutomática
Data      : 26/09/2006
Pendência : 23041
Autor     : Andre Tavares
Descrição : Caso haja documentos no lote com parametrização contábil errada (exemplo),
informar seus números na mensagem de erro.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 01/09/2006
Pendência : 23195
Autor     : Andre Tavares
Descrição : Utilizar o float do código de liquidação de baixa se o mesmo estiver preenchido.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.LancaRateioContab
Data      : 21/08/2006
Pendência : 22528
Autor     : Andre Tavares
Descrição : Deve constar no histórico contábil o Nº do lote do documento se o mesmo se encontar em um lote
(isso só ocorre se o documento for CAP).
--------------------------------------------------------------------------------
}
{-------------------------------------------------------------------------------
Pendência: 23081
Data     : 17/08/2006
Autor    : Andre Tavares
Descrição: Fazer a baixa dos documentos com o portadorforma original dos documentos.
-------------------------------------------------------------------------------}

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : Diversas
//  Data       : 30/05/2006
//  Pendência  : 21102
//  Descrição  : Adaptação para fazer o lançamento no cfinan de acordo com o
//  portadorforma de retorno (vide sicob Cef CNAB 240 nota 42)
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : BaixaDocumentos
//  Data       : 11/04/2006
//  Pendência  : 21647
//  Descrição  : Atualiza o campo emisbloc = 'N' na tabela documento no momento
//  da baixa para que seja possíveel fazer operações de lançamento de alteradores, bem como
//  alterações.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : ValidaDataBaixa
//  Data       : 31/01/2006
//  Pendência  : 21352
//  Descrição  : Permite que se baixe um documento antecipadamente (antecipação de receita).
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : Diversas
//  Data       : 31/01/2006
//  Pendência  : 21352
//  Descrição  : No Cap não estava considerando o float nos lançamentos no Financeiro.
//------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 19/01/2005
Autor     : André Tavares
pendência : 21198
Descrição : Se parametrizado no Cfinan, colocar a databaixa da tabela recebpagto igual à data do lançmento não identicficado no financeiro.
{ --------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 16/01/2006
Autor     : Rodolpho da Silva
pendência : 21257
Descrição : Passar o id dos relacionamentos aqui, pois na função
            CtrlFinanceiro.GravaRelacionados isso não é mais feito.
{ --------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaManual
Data      : 21/12/2005
Autor     : Rodolpho da Silva
Pendência : 20932
Descrição : Contabilizar ou não o alterador conforme cadastro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreParametros
Data      : 13/12/2005
Autor     : Alex Pereira
Pendência :
Descrição : Criado método único para abertura dos parâmetros do sistema
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 23/08/2005
Autor     : Alex Pereira
Pendência :
Descrição : Retirado o objeto _LancaContab, que era instanciado e não utilizado.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 08/06/2005
Autor     : Rodolpho da Silva
Pendência : 19038
Descrição : Passar a gravar a data da disponibilidade na baixa de documentos, vindo de todos os módulos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocuemnto
Data      : 03/05/2005
Autor     : Rodolpho da Silva
Pendência : 17761
Descrição : Mudar status do documento não-identificado gerado no CFinan para "J" (Estorno).
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DefineDatafloat
Data      : 25/04/2005
Autor     : andré tavares
Pendência : 18693
Descrição : acerto da função AjustaFloat da uctrlDocumento e extinção da função DefineDataFloat.
---------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.BaixaDocumento
Data      : 18/02/2005
Autor     : Rodolpho da Silva
Pendência : 18696
Descrição : Ao fazer o recebimento manual o sistema não estava considerando, o parametro considera FLOATS
            para fins de semana, qdo tem feriado subsequente ao fim de semana.

{---------------------------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.BaixaDocumento
Data      : 15/02/2005
Autor     : Rodolpho da Silva
Pendência : 18584
Descrição : Correção da variável _DataBaixa, pois não estava respeitando os parâmetros cadastrados
            na PARAMCAPCAR

{---------------------------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.BaixaDocumento
Data      : 25/01/2005
Autor     : Fabio Fagundes
Pendência : 17666
Descrição : Gravação da Data de Disponibilidade na Documento qdo módulo de Investimento
            pela funçao Documento.UpdateDataDisponib
{ --------------------------------------------------------------------------------------------------

{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 14/09/2004
Autor     : andré tavares
Pendência : 16954
Descrição : criação de parâmetro que permite que o float do CAR considere ou não somente os dias úteis.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 24/08/2004
Autor     : Marchetti
Pendência : 14404
Descrição : Passado o parametro com o valor do CODLANCFINANC não identificado para ser gravado na
            tabela RECBTOPAGTO, pois sem esse campo preenchido o processo de exclusão de baixa não
            fazia os updates nas tabelas de forma correta
---------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Rotinas   : ProcessoRadLiberado
Data      : 05/07/2004 (Término)
Autor     : David Ayrolla
Pendência : 14646
Descrição : Criação de função que retorna se o documento foi liberado no RAD.
-------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaAutomatica
Data      : 24/06/2004
Autor     : André Tavares
Pendência : 16855
Descrição : Verifica se o lote já foi baixado antes de processar a baixa.
Isso evita que usuários concorrentes que tenham selecionado o mesmo lote processem a mesma baixa.
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 28/04/2004
Autor     : André Tavares
Pendência : 16170 e 3138
Descrição : Ajuste da pendência 3138 e resolução da pendência 16170
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 15/01/2004
Autor     : Fabio Fagundes
Pendência : 14177
Descrição : colocado o parâmetro bEstorno no método BaixaDocumento
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaManual
Data      : 02/03/2004
Autor     : Marchetti
Pendência : 16107 e 16119
Descrição : Alteração das datas de lançamento para data de baixa para os documentos não identificados
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 15/01/2004
Autor     : Fabio Fagundes
Pendência :
Descrição : Passagem do parametro de Data de Disponibilidade para a função BaixaDocumento
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento e ProcessaBaixaManual
Data      : 10/07/2003
Autor     : André Pontes
Pendência : 14177
Descrição : criação do parâmetro bEstorno: Boolean = False, para que o lançamento no financeiro possa
            identificar um estorno, e alterar o histórico de acordo
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 07/10/2003
Autor     : Alex Pereira
Pendência : 14818
Descrição : Incorporados os fontes do Beraldo devido a erros no conceituais.
            Instruido por Rosane, exitiam problemas na troca do status do campo
            MOVIMFINANC.STATUSCONCILIA
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento e Constructor Create
Data      : 13/11/2003
Autor     : Alex Pereira
Pendência : 15631
Descrição : A Propriedade do CtrlFinanceiro.UsaPlanoPatro estava sendo atribuida como false,
            fazendo com que o rateiofinanc ficasse errado.
----------------------------------------------------------------------------------------------------}

Unit uCtrlBaixaDocumentos;

Interface

Uses SysUtils, Controls, Classes, DbClient, uCmControlObject, uCMTypes, Db, Forms,
   uCtrlDocumento, uCtrlFinanc, DCtrlDocCapCar, uCMSqlParams,
   uCtrlTalaoCheque, uCtrlImpostoRetido, fListaRetencoesMT, uCtrlPadroes,
   dBaseDados, usistema, uCtrlParamIntegra, uDiasUteis, uCtrlMensagens,
   uCtrlSintetizaContabil,
   uCtrlRad,
   uCtrlRADPlus;

Const
   QUEBRADELINHA = (#13 + #10);
   MSG_ERRO_BAIXALOTE = 'Não foi possível pagar o Lote nº %s, verifique. ';
   MSG_ERRO_VERIFICADATA = 'A data de baixa é menor que a data do lançamento ( %s ). Verifique. ';
   MSG_ERRO_BAIXAMANUAL = 'Não foi possível baixar o lote manual nº %s, verifique. ';

Type

   TEventoBaixa = Procedure(vParam: Array Of Variant) Of Object;

   TEventoLogFinan = Procedure(Const sLog: String) Of Object; // evento para o log do financeiro - pendência 27101

   TCtrlBaixaDocumentos = Class(TCmControlObject)

   Private

      //David Ayrolla - Implementar chamadas ao Rad+
      CtrlRad: TCtrlRAD;
      CtrlRadPlus: TCtrlRADPlus;

      _Documento: TCtrlDocumento;
      _Financeiro: TCtrlFinanc;
      _TalaoCheque: TCtrlCheque;
      _ImpostoBaixa: TCtrlImpostoRetido;
      _Padroes: TCtrlPadroes;

      _DtmCtrlDocCapCar: TDtmCtrlDocCapCar;

      //Variáveis obrigatórias para a execuçã do método BaixaDocumento
      _DataBaixa: TDateTime;
      _PlanoConta: Integer;
      _UsaPlanoPatro: Boolean;
      _IntegraContab: Boolean;
      _IdPessoa: Integer;
      _IdUsuarioInclusao: Integer;
      _IdEspAcesso: Integer;

      //Variáveis para controle de contabilização e lançamento no financeiro internas aos
      //processos de baixa
      _CodLancFinanc: Double;
      _PlanilhaBaixa: Integer;

      _LancaBaixaFloat: boolean;
      _CODLANCFINANCnIdent: Integer;

      _TotalBaixa: Double;
      _IdModulo: Integer;
      _RecPag, _DebCred: String;
      _rNumChqBordero: Double;

      _CdsParamCAP, // Alex aberto apenas em AbreParametros
      _CdsLotes,
         _CdsDocumentos,
         _CdsFazRateioCapCar: TClientDataSet;

      _DataDiferido: TDateTime;
      FNumLancto: Integer;
      FObservacao: String; (* Gustavo - 24/04/2003 *)
      iRegCorr: Integer; //andré tavares - pendência 23195 - para saber o registro corrente dos documentos sendo baixados

      Function getPorformaBaixa(Const codPortForma: integer): boolean;

      Procedure ValidaDataBaixa(iCodDocumento: LongInt; dDataPagto: TDateTime);

      Procedure BaixaDocumento(sBDocumento: String;
         Var bLancaFinanceiro: Boolean;
         iNumLote: Integer;
         SistemaLancto: TSistemaLancto;
         bContabilizaBaixaCheques,
         bBaixaLotes,
         bPartidaDobrada: Boolean;
         iNumBaixaRecXPagto: Integer;
         dDataLancamento: TDateTime; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
         dDataDisp: TDateTime = 0;
         // André Pontes - 10/07/2003 - pendência 14177
         bEstorno: Boolean = False;
         Const bUsaPortFormaRetorno: boolean = false;
         Const iCodPortForma: integer = 0;
         Const bSintetizaContabilizacao: Boolean = false;
         Const oPlanilhaSintetica: TSinglePlanilha = Nil;
         Const bSIGCB: Boolean = false);
      // FIM André Pontes - 10/07/2003 - pendência 14177
      Procedure SetDadosModulo(SistemaLancto: TSistemaLancto; rValorLanc: Double = 0);
      Procedure SetNumLancto(Const Value: Integer);

      // Alex 13/12/05
      Procedure AbreParametros(Const SistemaLancto: TSistemaLancto; Const iIdPessoa: integer);
      Procedure SetObservacao(Const Value: String);

      Function ContabilizaPlanilhaSintetica(Const oPlanilha: TSinglePlanilha): Boolean;
   Protected
      Procedure AfterInitialize; Override;

   Public

      OnBaixa: TEventoBaixa;
      OnLogFinan: TEventoLogFinan; // evento para o log do financeiro pendência 27101

      Constructor Create; Override;
      Destructor Destroy; Override;

      Function GetEmptyCdsBaixa(bAddCodAlteradorBaixa: Boolean = false): OleVariant;

      //DAVID - Pendência 14646
      Function ProcessoRadLiberado(CodDocumento: Longint): boolean;

      //Bruno Bastos - Sol 126261 - Início
      Function DocTemPai(piCodDocumento: Integer; piNumLote: integer): boolean;
      Function BuscaDocFilho(piCodDocumento: integer; piNumLote: integer): OleVariant;
      //Bruno Bastos - Sol 126261 - Fim

      //Helen - Sol: 126261/1121 - Kintana: 760963 - Inicio
      Function BuscaDocFilhoBaixado(piCodDocumento: integer; piNumLote: integer): OleVariant;
      Function DadosFilhoBaixado(piCodDocumento: integer): OleVariant;
      //Helen - Sol: 126261/1121 - Kintana: 760963 - Fim

      Function DocumentoComBaixaMista(piCodDocumento: integer): boolean;

      Function ProcessaBaixaAutomatica(Const ovLotes: OleVariant;
         dDataLancamento, //Paulo Nobre SOL 235849 PPM 459943
         dDataBaixa: TDateTime; SistemaLancto: TSistemaLancto; bLancaBaixaFloat: Boolean;
         iIdUsuarioInclusao, iIdPessoa, IdEspAcesso, iPLanoContabil: Integer;
         bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean; sRecPag: String
         ): Boolean;

      Function ProcessaBaixaManual(bControlaEmissaoCheque: Boolean;
         iCodPortForma: Integer;
         rNumChqBordero: Double;
         Const ovDocumentos: OleVariant;
         dDataLancamento, dDataBaixa: TDateTime; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
         SistemaLancto: TSistemaLancto;
         bLancaBaixaFloat: Boolean;
         iIdUsuarioInclusao,
         iIdPessoa,
         IdEspAcesso,
         iPLanoContabil: Integer;
         bUsaPlanoPatro,
         bLancaContab,
         bPartidaDobrada: Boolean;
         bCalculaImposto: Boolean;
         iNumBaixaRecXPagto: Integer;
         iPlnCodigo: Integer = 0;
         iCodLancFinanc: Integer = -1;
         bLancaFinancBaixa: boolean = True;
         dDataDiferido: TDateTime = 0;
         CODLANCFINANCnIdent: integer = 0;
         dDataDisp: TDateTime = 0;
         // André Pontes - 10/07/2003 - pendência 14177
         Const bEstorno: Boolean = False;
         // FIM André Pontes - 10/07/2003 - pendência 14177
         Const bUsaPortFormaRetorno: boolean = false; //andré tavares - pendência 21102 - 24/05/2006
         bLancHistContabLoteOrig: boolean = False; // Rodolpho da Silva - P: 22526 - 18/07/2006
         sBaixaObservacao: String = '';
         Const iTotReg: integer = 0;
         blnTransacaoInterna: Boolean = True;
         bSintetizaContabilizacao: Boolean = False;
         bSIGCB: Boolean = False): Boolean; (* Gustavo - 24/04/2003 *)

      Function UpdateEmissBloq(Const coddocumento: double): Boolean;

      //andré tavares - pendeência 21601 - 24/08/2006
      //verifica se existe relacionamento portadorConta X Plano relacionado a um portadorforma
      Function VerificaPortadorContaXPlano(Const coddocumento: int64;
         Const codportForma: integer): Boolean;

      Property PlnCodigoBaixa: Integer Read _PlanilhaBaixa;
      Property CodLancFinancBaixa: Double Read _CodLancFinanc;
      Property NumLancto: Integer Read FNumLancto Write SetNumLancto;
      //Marcus
      Property Observacao: String Read FObservacao Write SetObservacao;

   End;

Implementation

Uses uDataBase, JclMath, WWQuery,
   UCtrlOrcamento //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   ;

{ TCtrlBaixaDocumentos }

Procedure TCtrlBaixaDocumentos.AfterInitialize;
Begin
   Inherited;
   _Documento.InitializeAs(Self);
   _Documento.OpenTransaction := false;

   _Financeiro.InitializeAs(Self);
   _Financeiro.OpenTransaction := false;

   _TalaoCheque.InitializeAs(Self);
   _TalaoCheque.OpenTransaction := false;

   _ImpostoBaixa.InitializeAs(Self);
   _ImpostoBaixa.OpenTransaction := false;

   _Padroes.InitializeAs(Self);
   _Padroes.OpenTransaction := false;

   //David Ayrolla - Implementar chamadas ao Rad+
   CtrlRAD.InitializeAs(Self);
   CtrlRAD.OpenTransaction := false;
   CtrlRADPlus.InitializeAs(Self);
   CtrlRADPlus.OpenTransaction := false;

End;

Procedure TCtrlBaixaDocumentos.BaixaDocumento(sBdocumento: String;
   Var bLancaFinanceiro: Boolean;
   iNumLote: Integer;
   SistemaLancto: TSistemaLancto;
   bContabilizaBaixaCheques,
   bBaixaLotes,
   bPartidaDobrada: Boolean;
   iNumBaixaRecXPagto: Integer;
   dDataLancamento: TDateTime; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
   dDataDisp: TDateTime = 0;
   // André Pontes - 10/07/2003 - pendência 14177
   bEstorno: Boolean = False;
   Const bUsaPortFormaRetorno: boolean = false;
   Const iCodPortForma: integer = 0;
   Const bSintetizaContabilizacao: Boolean = false;
   Const oPlanilhaSintetica: TSinglePlanilha = Nil;
   Const bSIGCB: Boolean = false);
// FIM André Pontes - 10/07/2003 - pendência 14177
Var
   DataFloat, dDataBaixa: TDateTime;
   rValorlanc: Double;
   iNumLancto, iDiasFloat: LongInt;
   sHistAdto, sContabaixa,
      sNumcheque, sHstAux: String;
   Marca: TbookMark;
   bInsereLanc: Boolean;
   iNumLoteManual: Integer;
   iAuxLotes: Integer;
   //Iferreira Pendencia 27308
   _CdsDocEstornado,
      _CdsRateioFinanc,
      _cdsLocal: TClientDataSet; // andre tavares - pendência 19170
   sSubContaNaoIdent: Integer;
   //08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
   sCampoXouN: String;
   CODLANCFINANCEstorno: Double;
   //fim 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo

   // Rodolpho da Silva - P: 21257 - 16/01/2006
   fIdRelacionani: Double;

   qryLocal: TwwQuery;
   _cdsDocFilho: TClientDataset; //Helen - Sol: 126261/1121 - Kintana: 760963
   _AlteradorBaixa : TCtrlDocumento;       // edilaine - SOL 199439-16087 / PPM 383261
Begin
   _cdsDocFilho := TClientDataset.Create(Nil); //Helen - Sol: 126261/1121 - Kintana: 760963
   If (assigned(self.OnLogFinan)) And (trim(_CdsParamCap.fieldByName('FLGGERALOGFINAN').asString) = 'S') Then
      _Financeiro.onlLogFinan := self.OnLogFinan; //evento para gravar o log do financeiro - pendência 27101

   sHstAux := ''; // andre tavares - pendência 19170
   RvalorLanc := _CdsDocumentos.FieldByName('VALOR').AsFloat;

   // Rodolpho da Silva - P: 21257 - 16/01/2006
   fIdRelacionani := 0;

   // Se for um lançamento de adiantamento...
   If _CdsDocumentos.FieldByName('OPERACAO').AsString = '14' Then
      Begin
         _Documento.Prepare(OpLanctoDocum, odlBaixaAdiantamento);

         // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
         _Cds.Close;

         // 08/10 - Alex - Pend 14818 - incorporando fontes beraldo
         _Cds.Data := GetDataPacket('SELECT NUMLANCTO, HISTORICOCOMPL FROM LANCTODOCUM WHERE OPERACAO = 14 AND CODDOCUMENTO = ' + _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString);
         iNumLancto := _Cds.fieldbyname('NUMLANCTO').AsInteger;
         // 08/10 - Alex - Pend 14818 - incorporando fontes beraldo
         sHistAdto := _Cds.fieldbyname('HISTORICOCOMPL').AsString;
         _Cds.Close;

         bInsereLanc := false;
      End
   Else
      Begin
         _Documento.Prepare(OpLanctoDocum, odlBaixa);
         iNumLancto := 0;
         // 08/10 - Alex - Pend 14818 - incorporando fontes beraldo

         //Marcus P. 22240 06/10/06 Inicio
         If (((_CdsDocumentos.FieldByName('OPERACAO').AsString) = '2') Or ((_CdsDocumentos.FieldByName('OPERACAO').AsString) = '3')) Then
            sHistAdto := sHistAdto + ' ' + observacao
         Else
            sHistAdto := '';

         //Marcus P. 22240 06/10/06 Fim
         bInsereLanc := true;
      End;

   //cátia p:22474 01/06/2006
   _Documento.CodDocumento := _CdsDocumentos.FieldByName('CODDOCUMENTO').AsFloat;

   _Documento.PartidaDobrada := bPartidaDobrada;
   // Validação do debcre de acordo com o sistema de origem do lançamentos para lançamentos de baixa
   SetDadosModulo(SistemaLancto, rValorLanc);
   //Helen - Sol: 126261/1121 - Kintana: 760963 - Inicio
   If bEstorno = true Then
      Begin
         _cdsDocFilho.data :=
            GetDataPacket(' SELECT RECPAG FROM DOCUMENTO D, DOCUMXDOCUM DD   ' +
            ' WHERE D.CODDOCUMENTO = DD.IDDOCUMENTO AND ' +
            '       D.CODDOCUMENTO = ' + _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString);
         If Not _cdsDocFilho.eof Then
            Begin
               If _cdsDocFilho.FieldByName('RECPAG').AsString = 'P' Then
                  _DebCred := 'C'
               Else
                  _DebCred := 'D';
            End;
      End;
   //Helen - Sol: 126261/1121 - Kintana: 760963 - Fim

   _Documento.IdEspAcesso := _IdEspAcesso;
   _Documento.IdUsuario := _IdUsuarioInclusao;
   _Documento.IdModulo := _IdModulo;
   _Documento.UsaPlanoPatro := _UsaPlanoPatro;

   _Documento.SintetizaContabilizacao := bSintetizaContabilizacao;
   _Documento.PlanilhaSintetica := oPlanilhaSintetica;

   _Documento.UpdateDataDisponib(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, dDataDisp);

   // 13/11/03 Alex Pend 15631 - Na criação do CFINAN pela baixa de um CAR não
   // estava gerando os rateiofinanc corretos.
   _Financeiro.UsaPlanoPatro := _UsaPlanoPatro;
   rValorLanc := Abs(rValorLanc);

   If bBaixaLotes Then
      Begin
         If Not _CdsDocumentos.FieldByName('NUMCHQBORDERO').IsNull Then
            sNumcheque := _CdsDocumentos.FieldByName('NUMCHQBORDERO').AsString
         Else
            snumcheque := IntToStr(iNumLote);

         iNumLoteManual := 0;
         iAuxLotes := inumlote
      End
   Else
      Begin
         snumcheque := FloatToStr(_rNumChqBordero);
         iNumLoteManual := iNumLote;
         iAuxLotes := 0;
      End;

   // Efetivação do lançamento verificando parâmetros da portador forma
   If _LancaBaixaFloat Then
      iDiasFloat := _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger
   Else
      iDiasFloat := 0;

   {* Clementino - 25/04/2003 *}
   sSubContaNaoIdent := 0;
   sContabaixa := '';

   If (_DtmCtrlDocCapCar.CdsPortForma.FieldByName('FLGCONTABEMISCHQ').AsString = 'S') And
      (Trim(_DtmCtrlDocCapCar.CdsPortForma.FieldByName('PLACONTACONTABCHQ').AsString) <> '') And
      (bContabilizaBaixaCheques) Then
      sContabaixa := _DtmCtrlDocCapCar.CdsPortForma.FieldByName('PLACONTACONTABCHQ').AsString
   Else
      Begin
         If (_CODLANCFINANCnIdent > 0) Then
            Begin
               // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
               _Cds.Close;

               _Cds.Data := GetDataPacket('SELECT CONTALANCNAOIDENT, SUBCONTANAOIDENT FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr(_IdPessoa));
               If Not _Cds.IsEmpty Then
                  Begin
                     sContabaixa := _Cds.FieldByName('CONTALANCNAOIDENT').AsString;
                     sSubContaNaoIdent := _Cds.FieldByName('SUBCONTANAOIDENT').AsInteger;
                     // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
                     _Cds.Close;
                  End
               Else
                  Begin
                     sContabaixa := '';
                     sSubContaNaoIdent := 0;
                  End;
            End;
      End;
   {* Clementino - 25/04/2003 *}
   _Documento.Lote.NumLote := iAuxLotes;

   // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
   If dDatalancamento <> 0 Then
      dDataBaixa := dDatalancamento
   Else
      //  Início - Rodolpho da Silva - P: 18584 - 14/02/2005
      dDataBaixa := _DataBaixa;

   If (_CdsDocumentos.FindField('FLOATFORMAPAG') <> Nil) And (_CdsDocumentos.FieldByName('FLOATFORMAPAG').asString <> '') And
      (_CdsDocumentos.FieldByName('FLOATFORMAPAG').AsInteger <> 0) Then //andre tavares - 01/09/2006 - pendência 23195 - se este float estiver preenchido
      DataFloat := dDataBaixa + _CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger
   Else
      DataFloat := dDataBaixa + _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger;

   //início - andré tavares - pendência 23195 08/12/2006 - uma nova planilha será aberta se mudar a data
   If trunc(_CodLancFinanc) = 0 Then
      Begin
         _PlanilhaBaixa := 0;
      End;
   //fim - andré tavares - pendência 23195 08/12/2006 - uma nova planilha será aberta se mudar a data

   If (ParamIntegra.RecPag = 'R') Then
      Begin
         If Not bSIGCB Then
            Begin
               // Verifica se o flg que indica  que o Float só pode cair em dias
               // úteis, está ativado e se estiver, ajusta a data do Float...
               If (_CdsParamCap.fieldByName('FLGFLOATDIAUTIL').asInteger = 1) Then
                  Begin
                     //início - André tavares - pendência 18693 -25/04/2005
                     If (_CdsDocumentos.FindField('FLOATFORMAPAG') <> Nil) And (_CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger > 0) Then //andre tavares - 01/09/2006 - pendência 23195 - se este float estiver preenchido
                        DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger, SistemaLancto)
                     Else
                        DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger, SistemaLancto)
                           //fim - André tavares - pendência 18693 -25/04/2005
                  End;
            End
         Else
            Begin
               If (_CdsDocumentos.FindField('FLOATFORMAPAG') <> Nil) And (_CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger > 0) Then //andre tavares - 01/09/2006 - pendência 23195 - se este float estiver preenchido
                  DataFloat := dDataBaixa + _CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger
               Else
                  DataFloat := dDataBaixa + _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger
            End;
      End
         //início - andre tavares - pendência 21352 - deve-se chamar a rotina ajuatadatafloat também para o CAR
   Else Begin
         If (_CdsDocumentos.FindField('FLOATFORMAPAG') <> Nil) And (_CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger > 0) Then //andre tavares - 01/09/2006 - pendência 23195 - se este float estiver preenchido
            DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger, SistemaLancto)
         Else
            DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger, SistemaLancto)
      End;
   //fim - andre tavares - pendência 21352

   //  Se ativado o flg, considera a data da baixa semelhante à do Float
   If (_CdsParamCap.fieldByName('FLGLANCAFLOAT').AsString = 'S') Then
      dDataBaixa := DataFloat;

   // edilaine - SOL 199439-16087 / PPM 383261 - inicio
  (* Verifica se existem alteradores lançados com a opção de "Contabilizar na Baixa" e
     efetua a contabilização dos mesmos alterando o lançamento de origem
  *)
   try
     _cdsLocal      := TClientDataSet.Create( nil );
     _cdsLocal.Data := _Documento.TemAlteradorParaContabilizar(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger);

     if (_IntegraContab) and (not _cdsLocal.isEmpty) then
     begin
       _AlteradorBaixa := TCtrlDocumento.Create;   
       _AlteradorBaixa.InitializeAs(Self);
       _AlteradorBaixa.OpenTransaction := false;

       While Not _cdsLocal.Eof do
       begin
         _AlteradorBaixa.OPeracaoLancto := olSoContabiliza;

         //William Moreira da Silva - SOL 257204 - PPM 991062 - incluido paramentro sdocBaixado
         _AlteradorBaixa.Prepare(OpLanctoDocum, odlAlterador, sdocBaixado);
         //William Moreira da Silva - SOL 257204 - PPM 991062 - incluido paramentro sdocBaixado

         _AlteradorBaixa.PartidaDobrada := _Documento.PartidaDobrada;
         _AlteradorBaixa.bFlgExecutaAcertoDifCentavos := _Documento.bFlgExecutaAcertoDifCentavos;

         _AlteradorBaixa.Lanctodocum.SetValues(dDataBaixa,
                  _cdsLocal.FieldByName('CODDOCUMENTO').AsInteger,
                  _cdsLocal.FieldByName('NUMLANCTO').AsInteger,
                  _cdsLocal.FieldByName('VLRLIQUIDO').AsFloat,
                  _cdsLocal.FieldByName('VALOROUTRAMOEDA').AsFloat,
                  _cdsLocal.FieldByName('VALOR').AsFloat,
                  _cdsLocal.FieldByName('UNIDNEGOC').AsInteger,
                  _cdsLocal.FieldByName('PLNCODIGO').AsInteger,
                  0,
                  _IdUsuarioInclusao,
                  _cdsLocal.FieldByName('IDPESSOA').AsInteger,
                  0,
                  _cdsLocal.FieldByName('ESTORNO').AsInteger,
                  0,
                  0,
                  _cdsLocal.FieldByName('CODALTERADOR').AsInteger,
                  '4',
                  '',
                  '',
                  '',
                  _cdsLocal.FieldByName('HISTORICOCOMPL').AsString,
                  '',
                  '',
                  '',
                  _cdsLocal.FieldByName('DEBCRE').AsString,
                  _IdModulo,
                  _cdsLocal.FieldByName('PLANO').AsInteger,
                  _UsaPlanoPatro,
                  True
                  );

         if not _AlteradorBaixa.Update then
            raise Exception.Create( _AlteradorBaixa.MessageInfo );

         _cdsLocal.Next

       end;
     end;
   finally
     _cdsLocal.Close;
     FreeAndNil( _cdsLocal );
     if _AlteradorBaixa <> nil then
        FreeAndNil( _AlteradorBaixa );
   end;
   // edilaine - SOL 199439-16087 / PPM 383261 - fim


   _Documento.Lanctodocum.SetValues(
      dDataBaixa,
      _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
      iNumLancto,
      rValorLanc,
      0,
      rValorLanc,
      0,
      _PlanilhaBaixa,
      iNumLoteManual,
      _IdUsuarioInclusao,
      _IdPessoa,
      0,
      0,
      _CdsDocumentos.FieldByName('CODTIPDOC').AsInteger,
      0,
      0,
      '',
      sNumCheque,
      '',
      '',
      sHistAdto,
      '',
      '',
      '',
      _DebCred,
      _IdModulo,
      _PlanoConta,
      _UsaPlanoPatro,
      _IntegraContab,
      _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsInteger,
      0,
      sContabaixa,
      sSubContaNaoIdent);

   If bInsereLanc Then
      Begin
         If Not _Documento.Insert Then Raise Exception.Create(_Documento.MessageInfo);
      End
   Else
      If Not _Documento.Update Then Raise Exception.Create(_Documento.MessageInfo);

   fNumLancto := _Documento.Lanctodocum.NumLancto;

   // Arnaldo V. Scarin - alterado em 26/08/2010
   // Essa alteração foi feita, pois quando existe a sintetização dos lançamentos contábeis,
   // o Numero da Planilha que já foi gravada não pode ser zerado, e como os documentos só são
   // lançados numa rotina específica, o código abaixo acaba zerando o codigo da planilha,
   // fazendo com que sejam criadas novas planilhas.
   If Not bSintetizaContabilizacao Then
      _PlanilhaBaixa := _Documento.PlnCodigo;

   //  Início do processo de gravação no financeiro
   // Se gravar no Financeiro
   If (_DtmCtrlDocCapCar.CdsPortForma.FieldByName('LancaFinanc').AsString = 'S') Then
      Begin
         qryLocal := TwwQuery.Create(Nil);
         Try
            qryLocal.DatabaseName := 'BaseDados';
            qryLocal.SQL.Text :=
               ' SELECT L.FLAGCANCEL, L.NUMLOTE FROM LOTEPAGTO L, LOTEXDOCUM LX ' +
               ' WHERE  L.NUMLOTE = LX.NUMLOTE AND  LX.CODDOCUMENTO = ' +
               _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString +
               //Helen - SOL: 173082 KTN: 1562005
            ' AND L.FLAGCANCEL <> ''C''';
            qryLocal.Open();

            If Not qryLocal.IsEmpty Then
               sHstAux := 'Baixa do Lote Nº: ' + intToStr(iNumLote)
                  //Este histórico é pro movimento financeiro
            Else
               sHstAux := '';
         Finally
            FreeAndNil(qryLocal);
         End;

         // início - andre tavares - pendência 19170 -
         // para verificar se o documento está em um lote
  //       _cdsLocal := TClientDataSet.Create( nil );
  //       try
  //         _cdsLocal.Data := getDataPacket(
  //           ' SELECT L.FLAGCANCEL, L.NUMLOTE FROM LOTEPAGTO L, LOTEXDOCUM LX '+
  //           ' WHERE  L.NUMLOTE = LX.NUMLOTE AND  LX.CODDOCUMENTO = ' +
  //           _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString
  //         );
  //
  //         if not _cdsLocal.IsEmpty then
  //           sHstAux := 'Baixa do Lote Nº: '+ intToStr( iNumLote ) //Este histórico é pro movimento financeiro
  //         else
  //           sHstAux := '';
  //       finally
  //         FreeAndNil( _cdsLocal );
  //       end;
         // fim - andre tavares - pendência 19170

         If bLancaFinanceiro Then
            Begin
               Marca := _CdsDocumentos.GetBookMark;
               _CdsFazRateioCapCar.Data := _CdsDocumentos.Data;
               _CdsFazRateioCapCar.EmptyDataSet;
                          
               If bUsaPortFormaRetorno Then
                  Begin
                     _CdsDocumentos.Filtered := false;
                     _CdsDocumentos.Filter := ' CODPORTFORMA = ' + intToStr(iCodPortForma);
                     _CdsDocumentos.Filtered := true;
                  End;

               _CdsDocumentos.First;
               While Not _CdsDocumentos.eof Do
                  Begin
                     MoveFields(_CdsDocumentos, _CdsFazRateioCapCar, OpInserir, false);
                     _CdsDocumentos.next;
                  End;

               If bUsaPortFormaRetorno Then
                  Begin
                     _CdsDocumentos.Filtered := false;
                  End;

               _CdsDocumentos.Gotobookmark(Marca); (* Gustavo Viegas - 24/04/2003 *)
               _CdsDocumentos.freebookmark(Marca); (* Gustavo Viegas - 24/04/2003 *)

               _CdsFazRateioCapCar.First;

               If (_CdsDocumentos.FieldByName('OPERACAO').AsString = '14') Then
                  _Documento.UpdateStatusBaixaAdianto(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _PlanilhaBaixa,
                     iNumLancto, dDataBaixa, SistemaLancto);

               // 08/10/03 - Alex - incorporando fontes beraldo
               sCampoXouN := 'N';
               If _CODLANCFINANCnIdent > 0 Then
                  Begin
                     sCampoXouN := 'X';
                     // 19/02/2004 - Pendência 16119 - Gravação da data de conciliação

                     //  Rodolpho da Silva - P: 17761 - 03/05/2005
                     _Financeiro.MudaStatusConcilia('J', dDataBaixa, _CODLANCFINANCnIdent);
                     // Fim Pendência 16119
                  End;
               // fim 08/10/03 - Alex - incorporando fontes beraldo

               If (_DataDiferido > 0) Then (* Gustavo - 24/04/2003 *)
                  Begin
                     // 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
                     If Not _Financeiro.FazerRateioCAPCAR(
                        _CdsFazRateioCapCar.Data,
                        sCampoXouN,
                        snumcheque,
                        _RecPag,
                        _DataDiferido,
                        iAuxLotes,
                        _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsFloat,
                        _CodLancFinanc,
                        _IdPessoa,
                        _IdModulo,
                        _IdUsuarioInclusao,
                        _PlanoConta,
                        bEstorno,
                        _IntegraContab,
                        dDataDisp,
                        dDataBaixa,
                        sHstAux) Then
                        Raise Exception.Create(_Financeiro.MessageInfo); (* Gustavo - 24/04/2003 *)
                     _DataDiferido := 0; (* Gustavo - 24/04/2003 *)
                  End
               Else
                  // 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
                  If Not _Financeiro.FazerRateioCAPCAR(
                     _CdsFazRateioCapCar.Data,
                     sCampoXouN,
                     snumcheque,
                     _RecPag,
                     DataFloat,
                     iAuxLotes,
                     _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsFloat,
                     _CodLancFinanc,
                     _IdPessoa,
                     _IdModulo,
                     _IdUsuarioInclusao,
                     _PlanoConta,
                     bEstorno,
                     _IntegraContab,
                     dDataDisp,
                     dDataBaixa,
                     sHstAux) Then
                     Raise Exception.Create(_Financeiro.MessageInfo);
               _CdsFazRateioCapCar.Close;

               {* Clementino - 25/04/2003 *}

               If _CODLANCFINANCnIdent > 0 Then
                  Begin
                     _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"

                     // Grava relacionados no Financeiro
                     _Cds.Data := GetDataPacket(_Financeiro.sSqlRelacionados);

                     // Rodolpho da Silva - P: 21257 - 16/01/2006
                     fIdRelacionani := GetSequence('RELACIONANI');

                     _Cds.Append;
                     _Cds.FieldByName('CODLANCFINANC').AsFloat := _CODLANCFINANCnIdent;

                     // 19/02/2004 - Pendência 16107 - Gravação da data de conciliação
                     _Cds.FieldByName('DATADISP').AsDateTime := _DataBaixa;
                     _Cds.FieldByName('FLGNI').AsString := 'I';

                     // Rodolpho da Silva - P: 21257 - 16/01/2006
                     _Cds.FieldByName('IDRELACIONANI').AsFloat := fIdRelacionani;

                     // Rodolpho da Silva - P: 24574 - 01/03/2007
                     _Cds.FieldByName('IDMODORIGEMREGU').AsFloat := _IdModulo;

                     _Cds.Post;
                     _Cds.Append;
                     _Cds.FieldByName('CODLANCFINANC').AsFloat := _CodLancFinanc;
                     _Cds.FieldByName('DATADISP').AsDateTime := dDataDisp;
                     _Cds.FieldByName('FLGNI').AsString := 'N';

                     // Rodolpho da Silva - P: 21257 - 16/01/2006
                     _Cds.FieldByName('IDRELACIONANI').AsFloat := fIdRelacionani;

                     // Rodolpho da Silva - P: 24574 - 01/03/2007
                     _Cds.FieldByName('IDMODORIGEMREGU').AsFloat := _IdModulo;

                     _Cds.Post;
                     If Not _Financeiro.GravaRelacionados(_Cds.Data) Then
                        Raise Exception.Create(_Financeiro.MessageInfo);

                     CODLANCFINANCEstorno := _CODLANCFINANCnIdent;
                     //Muda o Status do Lançamento da baixa para J

                     //Iferreira Pendencia 27308
                     _CdsDocEstornado := TClientDataSet.Create(Nil);
                     Try
                        _CdsDocEstornado.Data := GetDataPacket('SELECT ROWID FROM MOVIMFINANC WHERE CODLANCFINANC = ' + IntToStr(_CODLANCFINANCnIdent) + ' AND FLGESTORNADO IS NULL ');
                        If Not _CdsDocEstornado.Eof Then
                           Begin
                              _Financeiro.MudaStatusConcilia('J', DataFloat, _CODLANCFINANCnIdent);

                              If Not _Financeiro.EstornoFinanceiro(dDataBaixa,
                                 dDataDisp,
                                 True,
                                 CODLANCFINANCEstorno,
                                 _IdPessoa,
                                 _IdModulo,
                                 _IdUsuarioInclusao,
                                 _PlanoConta,
                                 _IntegraContab) Then
                                 Raise Exception.Create(_Financeiro.MessageInfo);
                           End;
                        _CdsDocEstornado.Close;
                     Finally
                        FreeAndNil(_CdsDocEstornado);
                     End;
                     // fim 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
                  End;
               {* Clementino - 25/04/2003 *}

               bLancaFinanceiro := False;
            End
         Else
            If (_CdsDocumentos.FieldByName('OPERACAO').AsString = '14') Then
               _Documento.UpdateStatusBaixaAdianto(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _PlanilhaBaixa,
                  iNumLancto, dDataBaixa, SistemaLancto); (* Gustavo Viegas - 24/04/2003 *)
      End
         //  Fim do processo de gravação no financeiro

   Else
      If (_CdsDocumentos.FieldByName('OPERACAO').AsString = '14') Then
         _Documento.UpdateStatusBaixaAdianto(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
            _PlanilhaBaixa,
            iNumLancto,
            dDataBaixa,
            SistemaLancto);

   If iNumLancto = 0 Then
      iNumLancto := _Documento.Lanctodocum.NumLancto;

   //início - andré tavares - 18/01/2006 - pendência 21198
{
   with TclientDataset.Create(nil) do
   begin
     try
       Data := GetDataPacket( ' SELECT NVL(FLGALTDTBAIXA, ''N'') AS FLGALTDTBAIXA FROM PARAMFINANC WHERE IDPESSOA = '+ intToStr(_IDPessoa) );
       if (fieldByName('FLGALTDTBAIXA').asString = 'S') and (_CODLANCFINANCnIdent > 0) then
       begin
         data := GetDataPacket(' SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC = '+ intTostr(_CODLANCFINANCnIdent) );
         _DataBaixa := fieldByName('DATALANCFINAN').asDateTime;
       end;
     finally
       close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
       free;
     end;
   end;
}
   Try
      _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
      _cds.Data := GetDataPacket(' SELECT NVL(FLGALTDTBAIXA, ''N'') AS FLGALTDTBAIXA FROM PARAMFINANC WHERE IDPESSOA = ' + intToStr(_IDPessoa));
      If (_cds.fieldByName('FLGALTDTBAIXA').asString = 'S') And (_CODLANCFINANCnIdent > 0) Then
         Begin
            _cds.data := GetDataPacket(' SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC = ' + intTostr(_CODLANCFINANCnIdent));
            _DataBaixa := _cds.fieldByName('DATALANCFINAN').asDateTime;
         End;
   Finally
      _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   End;

   //fim - andré tavares - 18/01/2006 - pendência 21198

   If Not _Documento.RecbToPagto.Inserir(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
      iNumLancto,
      _IdUsuarioInclusao,
      Trunc(_CodLancFinanc),
      _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsInteger,
      iNumLote,
      _CODLANCFINANCnIdent,
      iNumBaixaRecXPagto,
      sNumCheque,
      DateToStr(DataFloat),
      DateToStr(_DataBaixa)) Then //  Rodolpho da Silva - 24/02/2005 /  Refere-se à uma pendência do André Pontes: 18584
      Raise Exception.Create(_Documento.MessageInfo);

   //início - andré tavares - pendência 21647 - 11/04/2006
   UpdateEmissBloq(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger);
   //fim - andré tavares - pendência 21647 - 11/04/2006

   // 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
   If bBaixaLotes Then
      _Documento.Lote.BaixaDoc(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, iNumLote)
   Else
      {
         with TClientDataSet.Create(nil) do
         try
            Data := GetDataPacket('SELECT  LOTE.NUMLOTE, LOTEX.FLGBAIXA ' + #13 +
                                  '  FROM  ' + #13 +
                                  '   LOTEXDOCUM LOTEX ,  ' + #13 +
                                  '   LOTEPAGTO LOTE  ' + #13 +
                                  '  WHERE LOTEX.CODDOCUMENTO = '+ _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString + ' AND ' +#13 +
                                  '        (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' + #13 +
                                  '        LOTE.NUMLOTE    = LOTEX.NUMLOTE AND ' + #13 +
                                  '        (LOTE.FLAGCANCEL = '' '' OR LOTE.FLAGCANCEL IS NULL)');
            if not isempty then
               _Documento.Lote.BaixaDoc( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, FieldByName('NumLote').AsInteger);
         finally
           close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
           free;
         end;
      }
      Try
         _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
         _cds.Data := GetDataPacket('SELECT  LOTE.NUMLOTE, LOTEX.FLGBAIXA ' + #13 +
            '  FROM  ' + #13 +
            '   LOTEXDOCUM LOTEX ,  ' + #13 +
            '   LOTEPAGTO LOTE  ' + #13 +
            '  WHERE LOTEX.CODDOCUMENTO = ' + _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString + ' AND ' + #13 +
            '        (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' + #13 +
            '        LOTE.NUMLOTE    = LOTEX.NUMLOTE AND ' + #13 +
            '        (LOTE.FLAGCANCEL = '' '' OR LOTE.FLAGCANCEL IS NULL)');
         If Not _cds.isempty Then
            _Documento.Lote.BaixaDoc(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _cds.FieldByName('NumLote').AsInteger);
      Finally
         _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
      End;

   // fim 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
End;

Constructor TCtrlBaixaDocumentos.Create;
Var
   x: Integer;
Begin
   Inherited;
   OnLogFinan := Nil;

   iRegCorr := 0;
   OnBaixa := Nil; //*** andre tavares - 07/12/2006
   _Documento := TCtrlDocumento.Create;

   // by Alex - Pend 15631 - o default para usa planopatro no totalprev é true
   _Financeiro := TCtrlFinanc.Create(0, 0, 0, true);
   _TalaoCheque := TCtrlCheque.Create;
   _ImpostoBaixa := TCtrlImpostoRetido.Create;
   _Padroes := TCtrlPadroes.Create;

   _CdsLotes := TClientDataSet.Create(Nil);
   _CdsDocumentos := TClientDataSet.Create(Nil);
   _CdsParamCAP := TClientDataSet.Create(Nil);
   _CdsFazRateioCapCar := TClientDataSet.Create(Nil);

   // Cria o DataModulo e atribui ao ControlObject dos SqlParam a Control
   _DtmCtrlDocCapCar := tDtmCtrlDocCapCar.Create(Nil);
   For X := 0 To _DtmCtrlDocCapCar.ComponentCount - 1 Do
      If _DtmCtrlDocCapCar.Components[x] Is TCMSqlParams Then
         TCMSqlParams(_DtmCtrlDocCapCar.Components[x]).ControlObject := Self;

   _DataDiferido := 0; (* Gustavo - 24/04/2003 *)
   _CODLANCFINANCnIdent := 0; {* Clementino - 25/04/2003 *}
   FNumLancto := 0;

   CtrlRAD := TCtrlRAD.Create;
   CtrlRADPlus := TCtrlRADPlus.Create;
End;

Destructor TCtrlBaixaDocumentos.Destroy;
Begin
   FreeAndNil(_Documento);
   FreeAndNil(_Financeiro);
   FreeAndNil(_TalaoCheque);
   FreeAndNil(_ImpostoBaixa);
   FreeAndNil(_Padroes);
   FreeAndNil(_CdsLotes);
   FreeAndNil(_CdsDocumentos);
   FreeAndNil(_CdsParamCAP);
   FreeAndNil(_CdsFazRateioCapCar);
   FreeAndNil(_DtmCtrlDocCapCar);
   FreeAndNil(CtrlRAD);
   FreeAndNil(CtrlRADPlus);

   Inherited;
End;

Function TCtrlBaixaDocumentos.ProcessaBaixaAutomatica(Const ovLotes: OleVariant;
   dDataLancamento, dDataBaixa: TDateTime; SistemaLancto: TSistemaLancto; bLancaBaixaFloat: Boolean;
   iIdUsuarioInclusao, iIdPessoa, IdEspAcesso, iPLanoContabil: Integer;
   bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean; sRecPag: String
   ): Boolean;
Var
   bLancFinanc, bErro_Baixa: Boolean;
   sFaixa, ssql, sDocs, sBdocumento: String;
   // início - andre tavares - pendência 16855 - 24/06/2004
   // Esta function verifica se o lote já foi baixado
   Function isLoteBaixado(NumLote: Extended): Boolean;
   Var _cdsAux: TClientDataset;
   Begin
      _cdsAux := TClientDataset.Create(Nil);
      Try
         _cdsAux.data := GetDataPacket(' SELECT FLAGCANCEL FROM LOTEPAGTO WHERE FLAGCANCEL = ''B'' AND NUMLOTE = ' + floatToStr(NumLote));
      Finally
         isLoteBaixado := (_cdsAux.IsEmpty = false);
         _cdsAux.free;
      End;
   End;

   // fim - andre tavares - pendência 16855 - 24/06/2004

Begin
   If ConnectionSide = cnsClient Then
      Begin

         Result := Connection.AppServer.ProcessaBaixaAutomatica(ovLotes,
            dDataBaixa, Integer(SistemaLancto), bLancaBaixaFloat, iIdUsuarioInclusao,
            iIdPessoa, IdEspAcesso, iPLanoContabil, bUsaPlanoPatro, bLancaContab,
            bPartidaDobrada, sRecPag,
            Observacao);

         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            // 13/12/2005 Alex Abrir a query de parâmetros um única vez
            AbreParametros(SistemaLancto, iIdPessoa);

            _TotalBaixa := 0;
            _CdsLotes.Data := ovLotes;
            sFaixa := '';
            _CdsLotes.First;
            // início - andre tavares - pendência 16855 - 24/06/2004
            GetDataPacket('SELECT RECPAG FROM PARAMCAP WHERE RECPAG = ' + quotedStr(sRecPag) + ' FOR UPDATE');
            // fim - andre tavares - pendência 16855 - 24/06/2004
            While Not _CdsLotes.Eof Do
               Begin
                  // início - andre tavares - pendência 16855 - 24/06/2004
                  If isLoteBaixado(_CdsLotes.FieldByName('NUMLOTE').asFloat) Then
                     Raise Exception.Create(' O Lote ' + _CdsLotes.FieldByName('NUMLOTE').AsString + ' já foi baixado');
                  // fim - andre tavares - pendência 16855 - 24/06/2004

                  sFaixa := sFaixa + _CdsLotes.FieldByName('NUMLOTE').AsString + ',';
                  _CdsLotes.Next;
               End;
            sFaixa := '(' + Copy(sFaixa, 1, Length(sFaixa) - 1) + ')';

            // na baixa automatica todos os documentos são baixados TOTAIS, nesse caso é possível fazer o acerto sem problemas
            _Financeiro.bFlgExecutaAcertoDifCentavos := true; // Edilaine - SOL 124845-14262 / KTN 1977287
            _Documento.bFlgExecutaAcertoDifCentavos := true; // Edilaine - SOL 124845-14262 / KTN 1977287

            If sRecPag = 'P' Then
               ssql := ' SELECT  (''D'') as DEBCRE, ' + #13
            Else
               ssql := ' SELECT  (''C'') as DEBCRE, ' + #13;
            ssql := ssql + '  DOC.DATAPROGRAMADA, ' + #13 +
               '  LOTE.CODPORTFORMA, ' + #13 +
               '  DOC.IDPESSOA, ' + #13 +
               '  PESS.RAZAOSOCIAL AS NOME, ' + #13 +
               '  DOC.DATAVENCTO, ' + #13 +
               '  DOC.NoDOCUMENTO, ' + #13 +
               '  DOC.COMPLDOCUMENTO, ' + #13 +
               '  DOC.CODTIPDOC, ' + #13 +
               '  DOC.CODDOCUMENTO, ' + #13 +
               '  DOC.OPERACAO, ' + #13 +
               '  LOTE.NUMLOTE, ' + #13 +
               '  DOC.PLANO , ' + #13 +
               '  DOC.PLACONTA, ' + #13 +
               '  DOC.CODSUBCONTA, ' + #13 +
               '  DOC.CODCENTROCUSTO, ' + #13 +
               '  LOTE.CODLANCFINANC, ' + #13 +
               '  LOTEX.VALOR, ' + #13 +
               '  LOTE.NUMCHQBORDERO, ' + #13 +
               '  LOTEX.FLGBAIXA, DOC.NUMSLIP, LOTE.NUMSLIP AS NUMORDEMPAGO, LOTE.FAVORECIDO ' + #13 +
               '  FROM  ' + #13 +
               '   DOCUMENTO DOC,  ' + #13 +
               '   PESSOA PESS,  ' + #13 +
               '   LOTEXDOCUM LOTEX ,  ' + #13 +
               '   LOTEPAGTO LOTE  ' + #13 +
               '  WHERE LOTEX.NUMLOTE IN ' + sFaixa + ' AND  ' + #13 +
               '        DOC.IDPESSOA = ' + IntToStr(iIdPessoa) + ' AND  ' + #13 +
               '        DOC.RECPAG = ''' + sRecPag + ''' AND  ' + #13 +
               '        (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' + #13 +
               '        LOTE.NUMLOTE    = LOTEX.NUMLOTE AND ' + #13 +
               '        DOC.IDFORCLI = PESS.IDPESSOA AND ' + #13 +
               '        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO ';

            _CdsDocumentos.Data := GetDataPacket(ssql);

            _LancaBaixaFloat := bLancaBaixaFloat;
            _DataBaixa := dDataBaixa;
            _PlanoConta := iPLanoContabil;
            _UsaPlanoPatro := bUsaPlanoPatro;
            _IntegraContab := bLancaContab;
            _IdPessoa := iIdPessoa;
            _IdUsuarioInclusao := iIdUsuarioInclusao;
            _IdEspAcesso := IdEspAcesso;

            //Marcus Oliveira 23/03/2007 24309
            _Documento.sCtrlDocObs := observacao;

            _CdsDocumentos.Filter := '';
            _CdsDocumentos.Filtered := True;

            _CdsLotes.First;

            While Not _CdsLotes.Eof Do
               Begin
                  //início - andre tavares - pendência 23081 - 16/08/2006
                  getPorformaBaixa(_CdsLotes.FieldByName('CODPORTFORMA').AsInteger);
                  //fim - andre tavares - pendência 23081 - 16/08/2006

                  _PlanilhaBaixa := 0;

                  _CdsDocumentos.filter := 'NUMLOTE = ''' + _CdsLotes.FieldByName('NUMLOTE').AsString + '''';
                  _CdsDocumentos.First;

                  _Cds.Data := GetDataPacket('SELECT DATADIFERIDO FROM LOTEPAGTO WHERE NUMLOTE = ' + _CdsLotes.FieldByName('NUMLOTE').AsString); (* Gustavo - 24/04/2003 *)
                  _DataDiferido := _Cds.Fields[0].AsDateTime; (* Gustavo - 24/04/2003 *)
                  _Cds.Close; (* Gustavo - 24/04/2003 *)

                  While (Not _CdsDocumentos.Eof) Do
                     Begin
                        ValidaDataBaixa(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _DataBaixa);
                        _CdsDocumentos.next;
                     End;

                  _CdsDocumentos.First;
                  bLancFinanc := True;
                  _CodLancFinanc := -1;

                  sDocs := ''; //andre tavares - pendência 23041 - 26/09/2006
                  bErro_Baixa := false;
                  While Not _CdsDocumentos.eof Do
                     Begin
                        Try //andre tavares - pendência 23041 - 26/09/2006

                           If _CdsDocumentos.FieldByName('OPERACAO').AsString <> '10' Then
                              BaixaDocumento(sBdocumento,
                                 bLancFinanc,
                                 _CdsLotes.FieldByName('NUMLOTE').AsInteger,
                                 SistemaLancto,
                                 (Not _CdsLotes.FieldByName('PLNCODIGO').IsNull),
                                 true,
                                 bPartidaDobrada,
                                 0,
                                 dDatalancamento, //Paulo Nobre SOL 235849 PPM 459943
                                 dDataBaixa);
                        Except //andre tavares - pendência 23041 - 26/09/2006 - guarda os números dos documentos do lote com problema
                           bErro_Baixa := true;
                           sDocs := sDocs + _CdsDocumentos.fieldByName('NODOCUMENTO').asString + '/' + _CdsDocumentos.fieldByName('COMPLDOCUMENTO').asString + #13
                        End;

                        _CdsDocumentos.next;

                     End;

                  If Not _Documento.Lote.BaixaLote(_CdsLotes.FieldByName('NUMLOTE').AsInteger) Then
                     Raise Exception.Create(_Documento.MessageInfo);

                  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                  If sRecPag = 'P' Then
                     _Documento.Orcamento.FDO(fdoBaixa, _CdsDocumentos);
                  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

                  _CdsLotes.Next;
               End;

            If bErro_Baixa Then //andre tavares - pendência 23041 - 26/09/2006
               Raise Exception.Create(_Documento.MessageInfo);

            If Not _Padroes.GravaLogOperacoes(iIdPessoa, Integer(SistemaLancto) + 3, iIdUsuarioInclusao, 'Pagamento Automatico', False) Then
               Raise Exception.Create(_Padroes.MessageInfo);

            Commit;

            Result := True;
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := False;
                  //início - andre tavares - pendência 23041 - 26/09/2006
                  MessageInfo := Format(MSG_ERRO_BAIXALOTE, [_CdsLotes.FieldByName('NUMLOTE').AsString]) + QUEBRADELINHA +
                  sDocs + E.Message;
                  //fim - andre tavares - pendência 23041 - 26/09/2006
               End;
         End;
      End;
End;

Function TCtrlBaixaDocumentos.ProcessaBaixaManual(bControlaEmissaoCheque: Boolean;
   iCodPortForma: Integer;
   rNumChqBordero: Double;
   Const ovDocumentos: OleVariant;
   dDataLancamento, dDataBaixa: TDateTime; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
   SistemaLancto: TSistemaLancto;
   bLancaBaixaFloat: Boolean;
   iIdUsuarioInclusao,
   iIdPessoa,
   IdEspAcesso,
   iPLanoContabil: Integer;
   bUsaPlanoPatro,
   bLancaContab,
   bPartidaDobrada: Boolean;
   bCalculaImposto: Boolean;
   iNumBaixaRecXPagto: Integer;
   iPlnCodigo: Integer = 0;
   iCodLancFinanc: Integer = -1;
   bLancaFinancBaixa: boolean = True;
   dDataDiferido: TDateTime = 0;
   CODLANCFINANCnIdent: integer = 0;
   dDataDisp: TDateTime = 0;
   // André Pontes - 10/07/2003 - pendência 14177
   Const bEstorno: Boolean = False;
   // FIM André Pontes - 10/07/2003 - pendência 14177
   Const bUsaPortFormaRetorno: boolean = false; //andré tavares - pendência 21102 - 24/05/2006
   bLancHistContabLoteOrig: boolean = False; // Rodolpho da Silva - P: 22526 - 18/07/2006
   sBaixaObservacao: String = '';
   //andre tavares pendencia 23195 - para mostar o progresso das baixas
   Const iTotReg: integer = 0; (* Gustavo - 24/04/2003 *)
   // Ricardo Alves SOL 103843
   blnTransacaoInterna: Boolean = True;
   bSintetizaContabilizacao: Boolean = False;
   bSIGCB: Boolean = False): Boolean;
Var
   iCodPortFormaAnt: integer; //andre tavares - pendencia 21102 - 30/05/2006
   iNumLoteManual: Integer;
   bContabilizaAlterador, // Rodolpho da Silva - P: 20932 - 21/12/2005
   bLancFinanc: Boolean;
   sDebCre, sNomeAlterador: String;
   cdsAux, cdsTipoDocXAltXModulo: TClientDataset; // andre tavares 17/06/2004
   iNumLanc: integer;
   iNumReg: integer; // Edilaine - SOL 124845-14262 / KTN 1977287
   objCtrlMens: TCtrlMensagens;
   dDataBaixadoc : TDateTime;    //edilaine SIG115974
   iCodTipDoc, iIdModulo: integer;

   qrylocal: TwwQuery;

   oPlanilhaSintetica: TSinglePlanilha;

   Procedure BuscaDebCreFromAlterador(iCodAlteradorDebCre: Integer;
                                      iModeloCNAB: Integer = 0;
                                      sCodOcorrencia: string = '');
   Var
      cds: TClientDataSet;
   Begin
      cds := TClientDataSet.Create(Nil);
      Try
         Try
            cds.Data := GetDataPacket('SELECT ACRESDECRES, DESCRICAO FROM' +
               ' TIPOALTERADOR WHERE CODALTERADOR = ' +
               IntToStr(iCodAlteradorDebCre)
               );
            sDebCre := cds.Fields[0].AsString;
            sNomeAlterador := cds.Fields[1].AsString;
            //Andre Imakawa - SIG 112203 - Inicio
            if iModeloCNAB <> 0 then
            begin
              cds.Data := GetDataPacket('SELECT C.DESCRICAO ' +
                        'FROM ' +
                        '  CODIGOSCNAB C ' +
                        'WHERE ' +
                        '  (C.IDMODELOSCNAB = ' + IntToStr(iModeloCNAB) + ') AND ' +
                        '  (C.CODIGO = ' + QuotedStr(sCodOcorrencia) + ') AND ' +
                        '  (C.RECPAG = ''R'') AND ' +
                        '  (C.TIPO = ''T'') ');
              if not(cds.IsEmpty) then
                sNomeAlterador := cds.FieldByName('DESCRICAO').AsString;
            end;
            //Andre Imakawa - SIG 112203 - Fim
         Except
            On E: Exception Do
               Begin
                  Result := False;
                  MessageInfo := E.Message;
                  Raise Exception.Create(MessageInfo);
               End;
         End;
      Finally
         FreeAndNil(cds);
      End;
   End;

   Procedure LancaAlteradores(iCodDocLancto, iCodAlterador: Integer; rValor, rValorOutraMoeda: Double; dDataLancto: TDateTime;
                              iModeloCNAB: Integer = 0;         // Andre Imakawa - SIG 112203
                              sCodOcorrencia: string = '');     // Andre Imakawa - SIG 112203
   Begin
      If (Not IsFloatZero(rValor)) And (iCodAlterador > 0) Then
         Begin
            BuscaDebCreFromAlterador(iCodAlterador);

            _Documento.Prepare(OpLanctoDocum, odlAlterador);
            _Documento.PartidaDobrada := bPartidaDobrada;
            _Documento.IdEspAcesso := _IdEspAcesso;
            _Documento.IdUsuario := _IdUsuarioInclusao;
            _Documento.IdModulo := _IdModulo;
            _Documento.UsaPlanoPatro := _UsaPlanoPatro;

            _Documento.Lanctodocum.SetValues(dDataLancto,
               iCodDocLancto,
               0,
               rValor,
               0,
               rValor,
               0,
               0,
               0,
               _IdUsuarioInclusao,
               _IdPessoa,
               0,
               0,
               0,
               0,
               iCodAlterador,
               '4',
               '',
               '',
               '',
               sNomeAlterador,
               '',
               '',
               '',
               sDebCre,
               _IdModulo,
               _PlanoConta,
               _UsaPlanoPatro,
               _IntegraContab);
            Result := _Documento.Insert;
            //Fim do Lançamento do alterador para a baixa do documento

            If Result Then
               Begin
                  result := ExecSQL(' UPDATE LANCTODOCUM SET FLGLANCBAIXA = ''S'' WHERE CODDOCUMENTO = ' +
                     IntToStr(iCodDocLancto) + ' AND NUMLANCTO = ' +
                     IntToStr(_Documento.Lanctodocum.NumLancto)
                     );

                  If Not result Then
                     Exception.Create(MessageInfo);
               End
            Else
               // Rodolpho da Silva - P: 25538 - 14/06/2007
               Raise Exception.Create('Erro ao lançar o alterador "' + sNomeAlterador +
                  '". Motivo: ' + _Documento.MessageInfo);
         End;
   End;

  procedure AcertaDifRateio(iNumBordero : string); // Peterson Victor SIG 26730
  var qryRat,qryLanc, qryAlt  : TwwQuery;
      NumLanc : string;
      iSinal  : integer;    //edilaine SIG101374
  begin

        if sistema.IdModulo <> 4 then
       Exit;

    try

      qryRat := TwwQuery.Create(Nil);
      qryLanc := TwwQuery.Create(Nil);
      qryAlt := TwwQuery.Create(Nil);

      qryRat.DatabaseName  := 'BaseDados';
      qryLanc.DatabaseName := 'BaseDados';
      qryAlt.DatabaseName  := 'BaseDados';

      NumLanc := '';

      qryLanc.Close;
      qryLanc.SQL.Text := 'SELECT M.CODLANCFINANC, M.VALORLANCFINAN FROM MOVIMFINANC M WHERE M.NUMCHQBORDERO = ' + QuotedStr(iNumBordero);
      qryLanc.Open;

      qryLanc.First;

      if qryLanc.IsEmpty then
         Exit;

      NumLanc := qryLanc.FieldByName('CODLANCFINANC').AsString;

      qryRat.Close;
      qryRat.SQL.Text := ' SELECT SUM(RA.VALOR) AS VALOR ' +
                         ' FROM RATEIOFINANC RA ' +
                         ' WHERE RA.CODLANCFINANC IN (' + NumLanc + ' )';
      qryRat.Open;

      qryRat.First;

      if qryRat.IsEmpty then
         Exit;

      if qryLanc.FieldByName('VALORLANCFINAN').AsFloat = qryRat.FieldByName('VALOR').AsFloat then
         Exit;
//----------------------------------------------------------------------------------------------------------------------------------


      qryRat.Close;
      qryRat.SQL.Text := ' SELECT RA.IDRATEIOFINANC, RA.IDPLANOPREV as IDPLANOPREV, RA.VALOR AS VALOR, ' +
                         '        DECODE(SIGN(RA.VALOR), -1, -1, 1) AS SINAL ' +    //edilaine SIG101374
                         ' FROM RATEIOFINANC RA ' +
                         ' WHERE RA.CODLANCFINANC IN (' + NumLanc + ' )';
      qryRat.Open;

      if qryRat.IsEmpty then
         Exit;

      qryRat.First;
      while not qryRat.Eof do
      begin
         qryLanc.Close;

         qryLanc.SQL.Text := ' SELECT L.IDPLANOPREV AS IDPLANOPREV, SUM(L.LACVALOR) AS VALOR ' +
                             ' FROM LANCAMENTO L ' +
                             ' WHERE L.PLNCODIGO IN ' +
                             //edilaine SIG100873 : inicio
                             '       (SELECT L1.PLNCODIGO ' +
                             '          FROM LANCTODOCUM L1 ' +
                             '         WHERE L1.OPERACAO = 5 ' +
                             '           AND L1.NUMLANCTO = (SELECT MAX(L2.NUMLANCTO) '+
                             '                                 FROM LANCTODOCUM L2    '+
                             '                                WHERE L2.OPERACAO = 5   '+
                             '                                  AND L2.CODDOCUMENTO = L1.CODDOCUMENTO ) '+
                             '           AND L1.CODDOCUMENTO IN ' +
                             //edilaine SIG100873 : fim
                             '               (SELECT CODDOCUMENTO ' +
                             '                  FROM RECBTOPAGTO R ' +
                             '                 WHERE R.CODLANCFINANC = ' + NumLanc + ' )) ' +
                             '   AND L.LACDEBCRE = ' + QuotedStr('C') +
                             '   AND L.IDPLANOPREV = ' +  qryRat.FieldByName('IDPLANOPREV').AsString + ' GROUP BY IDPLANOPREV ';

         qryLanc.Open;
         qryLanc.First;

         if qryLanc.IsEmpty then
           Exit;

         if qryLanc.FieldByName('VALOR').AsFloat <> Abs(qryRat.FieldByName('VALOR').AsFloat) then    //edilaine SIG101374
         begin
            iSinal := qryRat.FieldByName('SINAL').AsInteger;    //edilaine SIG101374

            qryAlt.Close;
            qryAlt.SQL.Text := ' UPDATE RATEIOFINANC ' +
                               //edilaine SIG101374 : inicio
                               //' SET VALOR = ' + StringReplace(qryLanc.FieldByName('VALOR').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]) +
                               ' SET VALOR = ' + StringReplace(FloatToStr(qryLanc.FieldByName('VALOR').AsFloat * iSinal), ',', '.', [rfReplaceAll, rfIgnoreCase]) +
                               //edilaine SIG101374 : fim
                               ' WHERE IDRATEIOFINANC = ' + qryRat.FieldByName('IDRATEIOFINANC').AsString;

                               //' WHERE CODLANCFINANC = ' + QuotedStr(NumLanc) + ' AND IDPLANOPREV = ' + qryLanc.FieldByName('IDPLANOPREV').AsString;
            qryAlt.ExecSQL;
         end;
         qryRat.Next;
      end;

//----------------------------------------------------------------------------------------------------------------------------------

      qryLanc.Close;
      qryLanc.SQL.Text := 'SELECT M.CODLANCFINANC, M.VALORLANCFINAN FROM MOVIMFINANC M WHERE M.NUMCHQBORDERO = ' + QuotedStr(iNumBordero);
      qryLanc.Open;

      qryLanc.First;

      if qryLanc.IsEmpty then
         Exit;

      qryRat.Close;
      qryRat.SQL.Text := ' SELECT SUM(RA.VALOR) AS VALOR ' +
                         ' FROM RATEIOFINANC RA ' +
                         ' WHERE RA.CODLANCFINANC IN (' + NumLanc + ' )';
      qryRat.Open;

      qryRat.First;

      if qryRat.IsEmpty then
         Exit;

      if qryLanc.FieldByName('VALORLANCFINAN').AsFloat = qryRat.FieldByName('VALOR').AsFloat then
         Exit;

//----------------------------------------------------------------------------------------------------------------------------------

      qryRat.Close;
      qryRat.SQL.Text := ' SELECT R.IDRATEIOFINANC, R.IDPLANOPREV AS PLANO, T.PLACONTA AS CONTA, R.VALOR AS VALOR ' +
                         ' FROM RATEIOFINANC R, TIPORECEBDESEMB T ' +
                         ' WHERE R.CODLANCFINANC = ' + NumLanc +
                         '       AND R.CODTIPRECDES = T.CODTIPRECDES ' +
                         '       AND R.RECPAG = T.RECPAG ' +
                         '       AND T.ATIVO = ' + QuotedStr('S') +
                         ' ORDER BY R.IDPLANOPREV, T.PLACONTA, R.VALOR';
      qryRat.Open;

      qryRat.First;

      if qryRat.IsEmpty then
         Exit;

      while not qryRat.Eof do
      begin
         if ( Trim(qryRat.FieldByName('CONTA').AsString) <> '') and
            ( Trim(qryRat.FieldByName('PLANO').AsString) <> '') then
         begin

           qryLanc.Close;
           qryLanc.SQL.Text := ' SELECT L.IDPLANOPREV AS PLANO, L.PLACONTA AS CONTA, SUM(L.LACVALOR) AS VALOR ' +
                               ' FROM LANCAMENTO L ' +
                               ' WHERE L.PLNCODIGO IN (SELECT LC.PLNCODIGO ' +
                               '                       FROM LANCTODOCUM LC ' +
                               '                       WHERE LC.OPERACAO = 5 ' +
                               '                             AND LC.CODDOCUMENTO IN (SELECT CODDOCUMENTO ' +
                               '                                                     FROM RECBTOPAGTO R ' +
                               '                                                     WHERE R.CODLANCFINANC = ' + NumLanc + ' )) ' +
                               '       AND L.LACDEBCRE = ' + QuotedStr('C') +
                               '       AND L.LACNUMDOC = ' + QuotedStr(iNumBordero) +
                               '       AND L.IDPLANOPREV = ' + qryRat.FieldByName('PLANO').AsString +
                               '       AND L.PLACONTA    = ' + QuotedStr(qryRat.FieldByName('CONTA').AsString) +
                               ' GROUP BY L.PLACONTA, L.IDPLANOPREV ORDER BY PLANO, CONTA, VALOR ' ;
           qryLanc.Open;

           qryLanc.First;

           if qryLanc.IsEmpty then
              Exit;

           if qryLanc.FieldByName('VALOR').AsFloat <> qryRat.FieldByName('VALOR').AsFloat then
           begin
              qryAlt.Close;
              qryAlt.SQL.Text := ' UPDATE RATEIOFINANC ' +
                                 ' SET VALOR = ' + StringReplace(qryLanc.FieldByName('VALOR').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]) +
                                 ' WHERE IDRATEIOFINANC = ' +  qryRat.FieldByName('IDRATEIOFINANC').AsString;

              qryAlt.ExecSQL;
           end;
         end;

         qryRat.Next;
      end;

    Finally
      FreeAndNil(qryRat);
      FreeAndNil(qryLanc);
      FreeAndNil(qryAlt);

    end;
  end;

Begin

   oPlanilhaSintetica := TSinglePlanilha.Create;

   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.ProcessaBaixaManual(bControlaEmissaoCheque,
            iCodPortForma, rNumChqBordero, ovDocumentos, dDataLancamento, dDataBaixa,
            Integer(SistemaLancto), bLancaBaixaFloat, iIdUsuarioInclusao,
            iIdPessoa, IdEspAcesso, iPLanoContabil, bUsaPlanoPatro,
            bLancaContab, bPartidaDobrada, bCalculaImposto, iNumBaixaRecXPagto,
            iPlnCodigo, iCodLancFinanc, bLancaFinancBaixa, dDataDiferido,
            CODLANCFINANCnIdent, dDataDisp, bEstorno, bUsaPortFormaRetorno,
            bLancHistContabLoteOrig, sBaixaObservacao);

         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         cdsTipoDocXAltXModulo := TClientDataSet.Create(Nil);
         cdsAux := TClientDataSet.Create(Nil);
         qrylocal := TwwQuery.Create(Nil);
         Try
            qrylocal.DatabaseName := 'BaseDados';
            iCodPortFormaAnt := iCodPortForma;
            _Documento.EstornaDocumento := bEstorno;
            _DataDiferido := dDataDiferido;
            _CODLANCFINANCnIdent := CODLANCFINANCnIdent;
            iNumLoteManual := 0;

            //Marcus Oliveira 23/03/2007 24309  Inicio
            observacao := sBaixaObservacao;
            _Documento.sCtrlDocObs := observacao;
            //Marcus Oliveira 23/03/2007 24309 Fim

            // não utilizada na baixa automática
            If blnTransacaoInterna Then
               StartTransaction;

            Try
               Result := True;

               AbreParametros(SistemaLancto, iIdPessoa);

               _CdsDocumentos.Data := ovDocumentos;

               (* Gustavo - 06/03/2003 - Início
                   Trata os documentos a serem baixados pelo alterador e exclui os registros
                   dess tipo de baixa do grid para baixa efetiva
                *)

                // Edilaine - SOL 124845-14262 / KTN 1977287
               iNumReg := _CdsDocumentos.recordcount;
               If _CdsDocumentos.Fields.FindField('FLGBAIXATOTAL') <> Nil Then // verifica se vai ajustar centavos
                  Begin
                     _CdsDocumentoS.Filtered := false;
                     _CdsDocumentoS.Filter := 'FLGBAIXATOTAL = ''S'' ';
                     _CdsDocumentoS.Filtered := true;

                     // rateio só será ajustado caso não haja baixa total e parcial junto
                     If _CdsDocumentos.recordcount > 0 Then
                        Begin
                           _Financeiro.bFlgExecutaAcertoDifCentavos := (_CdsDocumentos.recordcount = iNumReg);
                           _Documento.bFlgExecutaAcertoDifCentavos := (_CdsDocumentos.recordcount = iNumReg);
                        End
                     Else
                        Begin
                           // se for tudo baixa parceial permite o ajuste também
                           _CdsDocumentos.Filtered := false;
                           _CdsDocumentos.Filter := 'FLGBAIXATOTAL = ''N'' ';
                           _CdsDocumentos.Filtered := true;

                           _Financeiro.bFlgExecutaAcertoDifCentavos := (_CdsDocumentos.recordcount = 1) And (iNumReg = 1);
                           _Documento.bFlgExecutaAcertoDifCentavos := (_CdsDocumentos.recordcount = 1) And (iNumReg = 1);
                        End;

                     _CdsDocumentos.Filtered := false;
                  End
               Else
                  Begin
                     _Financeiro.bFlgExecutaAcertoDifCentavos := false;
                     _Documento.bFlgExecutaAcertoDifCentavos := false;
                  End;
               // Edilaine - SOL 124845-14262 / KTN 1977287 - fim

               If _CdsDocumentos.Fields.FindField('CODALTERADORBAIXA') <> Nil Then
                  Begin
                     _CdsDocumentos.First;
                     While Not _CdsDocumentos.EOF Do
                        Begin
                           If _CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsFloat <> 0 Then
                              Begin

                                 // Edilaine - SOL 191915 / KTN 1823081
                                 iRegCorr := iRegCorr + 1;
                                 If Assigned(OnBaixa) Then
                                    OnBaixa([4, iRegCorr, 0, 1, iTotReg, 'Processando Baixa dos Documentos ( Não Efetivados )']);
                                 // Edilaine - SOL 191915 / KTN 1823081 - fim

                                 (* Gustavo - 26/03/2003 - Início *)
                                 BuscaDebCreFromAlterador(_CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsInteger,
                                                          _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                                          _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString);    // Andre Imakawa - SIG 112203

                                 // Início - Rodolpho da Silva - P: 20932
                                 bContabilizaAlterador := _IntegraContab;

                                 If bContabilizaAlterador Then
                                    bContabilizaAlterador :=
                                       (_CdsDocumentos.FieldByName('FLGCONTABALTERADOR').AsString = 'S');
                                 // Início - Rodolpho da Silva - P: 20932

                                 //Lança o alterador para efetivação da baixa do documento
                                 SetDadosModulo(SistemaLancto,
                                    _CdsDocumentos.FieldByName('VALOR').AsFloat);

                                 _Documento.Prepare(OpLanctoDocum, odlAlterador);
                                 _Documento.PlanilhaSintetica := oPlanilhaSintetica;
                                 _Documento.PartidaDobrada := bPartidaDobrada;
                                 _Documento.IdEspAcesso := _IdEspAcesso;
                                 _Documento.IdUsuario := _IdUsuarioInclusao;
                                 _Documento.IdModulo := _IdModulo;
                                 _Documento.UsaPlanoPatro := _UsaPlanoPatro;
                                 _Documento.Lanctodocum.SetValues(dDataBaixa,
                                    _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                    0,
                                    _CdsDocumentos.FieldByName('VALOR').AsFloat,
                                    0,
                                    _CdsDocumentos.FieldByName('VALOR').AsFloat,
                                    0,
                                    0,
                                    0,
                                    _IdUsuarioInclusao,
                                    _IdPessoa,
                                    0,
                                    0,
                                    0,
                                    0,
                                    _CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsInteger,
                                    '4',
                                    '',
                                    '',
                                    '',
                                    sNomeAlterador,
                                    '',
                                    '',
                                    '',
                                    sDebCre,
                                    _IdModulo,
                                    _PlanoConta,
                                    _UsaPlanoPatro,
                                    //Rodolpho da Silva - P: 20932 - 21/12/2005
                                    bContabilizaAlterador);

                                 Result := _Documento.Insert;
                                 //Fim do Lançamento do alterador para a baixa do documento

                                 // início - 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
                                 //if not Result then Raise Exception.Create(MessageInfo);
                                 If Not result Then //para não abortar todo o processamento por causa de um único documento que teve algum problema.
                                    self.messageInfo := _Documento.MessageInfo;
                                 //fim - 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"

                                 _CdsDocumentos.Delete;
                              End
                           Else
                              _CdsDocumentos.Next;
                        End;
                     _CdsDocumentos.First;
                  End;

               //  Instanciando variáveis
               _LancaBaixaFloat := bLancaBaixaFloat;
               _DataBaixa := dDataBaixa;
               _PlanoConta := iPLanoContabil;
               _UsaPlanoPatro := bUsaPlanoPatro;
               _IntegraContab := bLancaContab;
               _IdPessoa := iIdPessoa;
               _IdUsuarioInclusao := iIdUsuarioInclusao;
               _IdEspAcesso := IdEspAcesso;
               _rNumChqBordero := rNumChqBordero;

               //  Pega os dados do PortadorForma
               //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
               If bUsaPortFormaRetorno Then
                  Begin
                     iCodPortForma := _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger;
                     bLancFinanc := true;
                     If iCodPortFormaAnt <> _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger Then //andré tavares - pendência 23789 - 22/11/2006
                        _CodLancFinanc := 0;
                  End;

               GetPorformaBaixa(iCodPortForma);

               If (bControlaEmissaoCheque) Or
                  ((Not bControlaEmissaoCheque) And
                  (_DtmCtrlDocCapCar.CdsPortForma.FieldByName('FLGCONTROLACHEQUE').AsString = 'S')) Then
                  Begin
                     _TalaoCheque.ValidaPrimeiroCheque := True;
                     _TalaoCheque.MostraMsg := True;
                     _TalaoCheque.VerificaChq := True;
                     _TalaoCheque.CodPortador := _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTADOR').AsInteger;
                     _TalaoCheque.NumCheque := rNumChqBordero;
                     _TalaoCheque.GravaNumChq := True;

                     If (_TalaoCheque.ValidaNumCheque = vcError) Then
                        Raise Exception.Create('Não foi possível validar o número do Cheque.');
                  End;
               //  Instanciando variáveis
               iNumLoteManual := GetSequence('LOTEMANUAL');
               bLancFinanc := bLancaFinancBaixa;
               _PlanilhaBaixa := iPlnCodigo;
               _CodLancFinanc := iCodLancFinanc;
               SetDadosModulo(SistemaLancto);

               iCodTipDoc := -1;
               iIdModulo := -1;
               _CdsDocumentos.first;
               _CdsDocumentos.LogChanges := false; // andre tavares 09/12/2005

               While Not (_CdsDocumentos.eof) Do
                  Begin
                     iRegCorr := iRegCorr + 1; //andre tavares - 18/12/2006 - pend 23195 -
                     // para saber o registro corrente
                     //Incrementa o progresso tela FBaixaIntBancoMT

                     If Assigned(OnBaixa) Then
                        OnBaixa([4, iRegCorr, 0, 1, iTotReg, 'Processando Baixa dos Documentos ( Efetivados ) ']); //*** andre tavares 07/12/2006

                     //andre tavares - pendencia 21102 - 30/05/2006
                     If bUsaPortFormaRetorno And (iCodPortFormaAnt <>
                        _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger) Then
                        Begin
                           _CodLancFinanc := 0;
                           //andre tavares - pendência 23789 - 22/11/2006
                           iCodPortFormaAnt := _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger;
                           iCodPortForma := _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger;
                           getPorformaBaixa(iCodPortForma);
                        End;

                     //  Alex 07/12/05 - esta query não precisa ser executada a cada linha do laço
                     If ((_CdsDocumentos.FieldByName('CODTIPDOC').AsInteger <> iCodTipDoc) Or
                        (_CdsDocumentos.FieldByName('IDMODULO').AsInteger <> iIdModulo)) Then
                        Begin

                           // se for a primeira linha é preciso esta atribuição
                           iCodTipDoc := _CdsDocumentos.FieldByName('CODTIPDOC').AsInteger;
                           iIdModulo := _CdsDocumentos.FieldByName('IDMODULO').AsInteger;

                           // início - André Tavares - pendência 3138
                           // busca alteradores específicos do módulo de origem do documento

                           cdsTipoDocXAltXModulo.Close; // 25/06/2008 - 28197 André tavares -
                           // para consertar o erro "insufficient memory for this operation"

                           cdsTipoDocXAltXModulo.Data := GetDataPacket(
                              ' SELECT CODALTJUROS as CODALTERADORJUROS, CODALTDESC as CODALTERADORDESC, ' +
                              ' CODALTABAT as CODALTERADORABAT, CODALTOUTROS as CODALTERADORTARIF ' +
                              ' FROM TPDOCXALTXMODULO T  ' +
                              ' WHERE  T.TIPODOC = ' + IntToStr(iCodTipDoc) +
                              ' AND T.IDMODULO = ' + IntToStr(iIdModulo));

                        End
                     Else
                        Begin
                           iCodTipDoc := _CdsDocumentos.FieldByName('CODTIPDOC').AsInteger;
                           iIdModulo := _CdsDocumentos.FieldByName('IDMODULO').AsInteger;
                        End;

                     ValidaDataBaixa(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _DataBaixa);

                     (* Lança Alteradores Referentes ao processamento da baixa do documento *)
                     If (_CdsDocumentos.FindField('ABATIMENTO') <> Nil) And
                        (_CdsDocumentos.FieldByName('OPERACAO').AsString <> '10') Then
                        Begin
                           If cdsTipoDocXAltXModulo.fieldByName('CODALTERADORABAT').isNull Then // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 _CdsParamCAP.FieldByName('CODALTERADORABAT').AsInteger,
                                 _CdsDocumentos.FieldByName('ABATIMENTO').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString)     // Andre Imakawa - SIG 112203
                           Else // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 cdsTipoDocXAltXModulo.fieldByName('CODALTERADORABAT').AsInteger,
                                 _CdsDocumentos.FieldByName('ABATIMENTO').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString);    // Andre Imakawa - SIG 112203

                           If cdsTipoDocXAltXModulo.fieldByName('CODALTERADORDESC').isNull Then // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 _CdsParamCAP.FieldByName('CODALTERADORDESC').AsInteger,
                                 _CdsDocumentos.FieldByName('DESCONTOS').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString)     // Andre Imakawa - SIG 112203
                           Else // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 cdsTipoDocXAltXModulo.fieldByName('CODALTERADORDESC').AsInteger,
                                 _CdsDocumentos.FieldByName('DESCONTOS').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString);    // Andre Imakawa - SIG 112203

                           If cdsTipoDocXAltXModulo.fieldByName('CODALTERADORJUROS').isNull Then // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 _CdsParamCAP.FieldByName('CODALTERADORJUROS').AsInteger,
                                 _CdsDocumentos.FieldByName('JUROS').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString)     // Andre Imakawa - SIG 112203
                           Else // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 cdsTipoDocXAltXModulo.fieldByName('CODALTERADORJUROS').AsInteger,
                                 _CdsDocumentos.FieldByName('JUROS').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString);    // Andre Imakawa - SIG 112203

                           If cdsTipoDocXAltXModulo.fieldByName('CODALTERADORTARIF').isNull Then // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 _CdsParamCAP.FieldByName('CODALTERADORTARIF').AsInteger,
                                 _CdsDocumentos.FieldByName('TARIFABANCARIA').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString)     // Andre Imakawa - SIG 112203
                           Else // andre tavares 17/06/2004
                              LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                 cdsTipoDocXAltXModulo.fieldByName('CODALTERADORTARIF').AsInteger,
                                 _CdsDocumentos.FieldByName('TARIFABANCARIA').AsFloat,
                                 0,
                                 _DataBaixa,
                                 _CdsDocumentos.FieldByName('IDMODELOCNAB').AsInteger,     // Andre Imakawa - SIG 112203
                                 _CdsDocumentos.FieldByName('CODOCORRENCIA').AsString);    // Andre Imakawa - SIG 112203

                        End;

                     //  Se for para calcular imposto...
                     If bCalculaImposto Then
                        Begin
                           //Cálculo da CPMF e outras retenções de imposto/agregado
                           _ImpostoBaixa.CodPortForma := iCodPortForma;
                           _ImpostoBaixa.UsaPlanoPatro := bUsaPlanoPatro;
                           _ImpostoBaixa.PartidaDobrada := bPartidaDobrada;
                           _ImpostoBaixa.IdPlanoConta := _PlanoConta;
                           _ImpostoBaixa.IntegraContab := _IntegraContab;
                           _ImpostoBaixa.IdEmpresa := _IdPessoa;
                           _ImpostoBaixa.NumLote := -1;
                           _ImpostoBaixa.NumLoteManual := iNumLoteManual;
                           _ImpostoBaixa.RecPag := _RecPag[1];
                           _ImpostoBaixa.IdUsuario := _IdUsuarioInclusao;

                           //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
                           _ImpostoBaixa.IdEspAcesso := _IdEspAcesso;

                           _ImpostoBaixa.IdModulo := _IdModulo;
                           _ImpostoBaixa.DataProgramada := _DataBaixa;
                           _ImpostoBaixa.OperacaoDocumento := _CdsDocumentos.FieldByName('OPERACAO').AsString;
                           _ImpostoBaixa.IdForCli := _CdsDocumentos.FieldByName('IDFORCLI').AsInteger;
                           _ImpostoBaixa.CodDocumento := _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
                           _ImpostoBaixa.NumLancto := _CdsDocumentos.FieldByName('NUMLANCTO').AsInteger;
                           _ImpostoBaixa.ValorLancto := _CdsDocumentos.FieldByName('VALOR').AsFloat;
                           _ImpostoBaixa.ValorLiquido := _CdsDocumentos.FieldByName('VLRLIQUIDO').AsFloat;
                           _ImpostoBaixa.DataLancto := _DataBaixa;
                           _ImpostoBaixa.DataEmissao := _DataBaixa;

                           If _CdsDocumentos.FieldByName('DEBCRE').AsString = 'D' Then
                              _ImpostoBaixa.DebCre := 'C'
                           Else
                              _ImpostoBaixa.DebCre := 'D';

                           _ImpostoBaixa.MomentoLancamento := mlBaixa;
                           _ImpostoBaixa.Incluir;

                           If (_ImpostoBaixa.ValorAlteradores <> 0) And
                              (_ImpostoBaixa.AlteraRetencao) Then
                              Begin
                                 FrmListaRetencoesMT := TFrmListaRetencoesMT.Create(
                                    Application, _CdsDocumentos.FieldByName('NUMLANCTO').AsInteger,
                                    _CdsDocumentos.FieldByName('VALOR').AsFloat);
                                 Try

                                    FrmListaRetencoesMT.VlrRetencao := _ImpostoBaixa.ValorAlteradores;

                                    If (FrmListaRetencoesMT.ShowModal = mrAbort) Then
                                       Raise Exception.Create('Erro ao Cancelar\Alterar Retenções: ' +
                                          FrmListaRetencoesMT.ErrorMessage);

                                    _CdsDocumentos.Edit;
                                    _CdsDocumentos.FieldByName('VALOR').AsFloat :=
                                       _CdsDocumentos.FieldByName('VALOR').AsFloat +
                                       FrmListaRetencoesMT.VlrRetencao;
                                    _CdsDocumentos.Post;
                                 Finally
                                    FreeAndNil(FrmListaRetencoesMT);
                                 End;
                              End;
                        End;

                     //andre tavares - no CAR é necessário, pois não existe o parâmetro de lançamento no financeiro para baixa
                     If (ParamIntegra.RecPag = 'R') Then
                        bLancFinanc := true; //simplesmente ignoro o parâmero do CAP

                     //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
                     If bUsaPortFormaRetorno And (iCodPortFormaAnt <>
                        _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger) Then
                        Begin
                           iCodPortFormaAnt := _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger; //andre tavares - pendencia 21102 - 30/05/2006
                           _CodLancFinanc := 0;
                           iCodPortForma := _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger;
                           //andre tavares - pendência 23789 - 22/11/2006
                           iCodPortFormaAnt := _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger;

                           //início - andre tavares - pendência 23081 - 16/08/2006
                           getPorformaBaixa(iCodPortForma);

                        End; //if

                     // Início - Rodolpho da Silva - P: 22526 - 18/07/2006
                     If bLancHistContabLoteOrig Then
                        Begin
                           qrylocal.Close();
                           qryLocal.DatabaseName := 'BaseDados';
                           qryLocal.SQL.Text := ' SELECT L.NUMLOTE FROM LOTEPAGTO L, LOTEXDOCUM LX ' +
                              ' WHERE  L.NUMLOTE = LX.NUMLOTE AND  LX.CODDOCUMENTO = ' +
                              _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString;
                           qrylocal.Open();

                           //                _Cds.Data := getDataPacket(' SELECT L.NUMLOTE FROM LOTEPAGTO L, LOTEXDOCUM LX '+
                           //                  ' WHERE  L.NUMLOTE = LX.NUMLOTE AND  LX.CODDOCUMENTO = ' +
                           //                  _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString);
                           iNumLoteManual := qrylocal.FieldByName('NUMLOTE').AsInteger;
                        End;
                     // Fim - Rodolpho da Silva - P: 22526 - 18/07/2006

                     //início - andré Tavares - pendência 22528 - pega o lote do documento para colocar no histórico contábil
                     If (_CdsDocumentos.FindField('NUMLOTE') <> Nil) And
                        (_CdsDocumentos.FieldByName('NUMLOTE').asInteger > 0) Then
                     begin
                        //edilaine 115974 : inicio
                        if dDatalancamento = 0 then
                           dDataBaixadoc := _CdsDocumentos.FieldByName('DATABAIXA').AsDateTime
                        else
                           dDataBaixadoc := dDatalancamento;
                        //edilaine 115974 : fim

                        BaixaDocumento(
                           sBaixaObservacao,
                           bLancFinanc,
                           _CdsDocumentos.FieldByName('NUMLOTE').AsInteger,
                           SistemaLancto,
                           false,
                           false,
                           bPartidaDobrada,
                           iNumBaixaRecXPagto,
                           //dDatalancamento, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                           dDataBaixadoc, //edilaine SIG115974
                           dDataDisp,
                           bestorno,
                           bUsaPortFormaRetorno,
                           iCodPortForma,
                           bSintetizaContabilizacao,
                           oPlanilhaSintetica,
                           bSIGCB
                           ) // andre tavares - pendência 14177
                     end
                     Else
                        //fim - andré Tavares - pendência 22528
                        If _CdsDocumentos.FindField('NUMEROLOTE') <> Nil Then
                           Begin
                              //edilaine 115974 : inicio
                              if dDatalancamento = 0 then
                                 //dDataBaixadoc := _CdsDocumentos.FieldByName('DATABAIXA').AsDateTime
                                 dDataBaixadoc := _DataBaixa //Ewerton Beltramini - 17/08/2021 - SIG118650
                              else
                                 dDataBaixadoc := dDatalancamento;
                              //edilaine 115974 : fim

                              If _CdsDocumentos.FieldByName('NUMEROLOTE').AsInteger > -1 Then
                                 BaixaDocumento(
                                    sBaixaObservacao,
                                    bLancFinanc,
                                    _CdsDocumentos.FieldByName('NUMEROLOTE').AsInteger,
                                    SistemaLancto,
                                    False,
                                    False,
                                    bPartidaDobrada,
                                    iNumBaixaRecXPagto,
                                    //dDatalancamento, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                                    dDataBaixadoc, //edilaine SIG115974
                                    dDataDisp,
                                    bestorno,
                                    bUsaPortFormaRetorno,
                                    iCodPortForma,
                                    bSintetizaContabilizacao,
                                    oPlanilhaSintetica,
                                    bSIGCB
                                    ) // andre tavares - pendência 14177
                              Else
                                 BaixaDocumento(
                                    sBaixaObservacao,
                                    bLancFinanc,
                                    iNumLoteManual,
                                    SistemaLancto,
                                    False,
                                    False,
                                    bPartidaDobrada,
                                    iNumBaixaRecXPagto,
                                    //dDatalancamento, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                                    dDataBaixadoc, //edilaine SIG115974
                                    dDataDisp,
                                    bestorno,
                                    bUsaPortFormaRetorno,
                                    iCodPortForma,
                                    bSintetizaContabilizacao,
                                    oPlanilhaSintetica,
                                    bSIGCB
                                    ); // andre tavares - pendência 14177
                           End
                        Else
                           Begin
                              //edilaine 115974 : inicio
                              if dDatalancamento = 0 then
                                 //dDataBaixadoc := _CdsDocumentos.FieldByName('DATABAIXA').AsDateTime
                                 dDataBaixadoc := _DataBaixa //Ewerton Beltramini - 17/08/2021 - SIG118650
                              else
                                 dDataBaixadoc := dDatalancamento;
                              //edilaine 115974 : fim

                              BaixaDocumento(
                                 sBaixaObservacao,
                                 bLancFinanc,
                                 iNumLoteManual,
                                 SistemaLancto,
                                 False,
                                 False,
                                 bPartidaDobrada,
                                 iNumBaixaRecXPagto,
                                 //dDatalancamento, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                                 dDataBaixadoc, //edilaine SIG115974
                                 dDataDisp,
                                 bestorno,
                                 bUsaPortFormaRetorno,
                                 iCodPortForma,
                                 bSintetizaContabilizacao,
                                 oPlanilhaSintetica,
                                 bSIGCB
                                 ); // andre tavares - pendência 14177
                           End;

                     If bCalculaImposto Then
                        Begin
                           //DAVID - Pendência 26898 - UPDATE não traz NUMLANCTO preenchido
                           If _Documento.Lanctodocum.NumLancto > 0 Then
                              iNumLanc := _Documento.Lanctodocum.NumLancto
                           Else
                              Begin
                                 cdsAux.Data := GetDataPacket(' select NUMLANCTO from LANCTODOCUM' +
                                    ' where CODDOCUMENTO = ' +
                                    _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString
                                    );
                                 iNumLanc := cdsAux.Fields[0].AsInteger;
                              End;
                           _ImpostoBaixa.AlteraNumLancOrigem(_ImpostoBaixa.NumLancto, iNumLanc);
                        End;

                     _CdsDocumentos.next;
                  End;
               //  Fim do loop do CdsDocumentos

               // Edilaine - SOL 197595 / KTN 1894470
               If _RecPag[1] = 'P' Then
                  Begin
                     //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                     If bEstorno Then _Documento.Orcamento.FDO(fdoEstornoBaixa, _CdsDocumentos)
                     Else _Documento.Orcamento.FDO(fdoBaixa, _CdsDocumentos);
                     //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                  End;
               // Edilaine - SOL 197595 / KTN 1894470

               If bSintetizaContabilizacao Then
                  Begin
                     Result := ContabilizaPlanilhaSintetica(oPlanilhaSintetica);
                     _PlanilhaBaixa := oPlanilhaSintetica.Planilha;
                  End;

               If bCalculaImposto Then
                  Begin
                     _ImpostoBaixa.NumLote := -1;
                     _ImpostoBaixa.NumLoteManual := iNumLoteManual;
                     _ImpostoBaixa.CodPortForma := iCodPortForma;
                     _ImpostoBaixa.EfetivaNovoDocumento;
                  End;

               If Not _Padroes.GravaLogOperacoes(_idPessoa,
                  Integer(SistemaLancto) + 3,
                  _IdUsuarioInclusao,
                  'Pagamento Manual') Then
                  Raise Exception.Create(_Padroes.MessageInfo);

               AcertaDifRateio(FloatToStr(rNumChqBordero)); // Peterson Victor SIG 26730
			   
               // baixa automática não utiliza transação interna
               If blnTransacaoInterna Then
                  Commit;

               //DAVID - 07/02/07 - Pendência 21696
               If _CODLANCFINANCnIdent > 0 Then
                  Begin
                     cdsAux.Data := GetDataPacket(
                        ' select * from movimfinanc where codlancfinanc = ' +
                        IntToStr(_CODLANCFINANCnIdent));

                     objCtrlMens := TCtrlMensagens.Create;
                     Try
                        objCtrlMens.InitializeAs(Self);
                        objCtrlMens.EnviaMensagemContexto(iIdUsuarioInclusao, 1,
                           ['CODLANCFINANC',
                           'DATACONCILIA',
                              'VALOR'],
                              [IntToStr(_CODLANCFINANCnIdent),
                           FormatDateTime('dd/mm/yyyy', cdsAux.FieldByName('DATACONCILIACAO').AsDateTime),
                              FormatFloat('#,##0.00', cdsAux.FieldByName('VALORLANCFINAN').AsFloat)]);
                     Finally
                        FreeAndNil(objCtrlMens);
                     End;
                  End;

               If bCalculaImposto Then
                  _ImpostoBaixa.CancelaAcumulaImposto;
            Except
               On E: Exception Do
                  Begin
                     If blnTransacaoInterna Then
                        Rollback;

                     Result := False;
                     MessageInfo := Format(MSG_ERRO_BAIXAMANUAL, [IntToStr(iNumLoteManual)]) +
                     QUEBRADELINHA + E.Message;
                     If bCalculaImposto Then
                        _ImpostoBaixa.CancelaAcumulaImposto;
                  End;
            End;
         Finally
            // 25/06/2008 - 28197 André tavares - para consertar o erro
            // "insufficient memory for this operation"
            FreeAndNil(cdsTipoDocXAltXModulo);
            FreeAndNil(cdsAux);
            FreeAndNil(qrylocal);

            If iTotReg = iRegCorr Then
               iRegCorr := 0; //andre tavares - 18/12/2006 - pendencia 23195
         End;
      End;
End;

Function TCtrlBaixaDocumentos.ContabilizaPlanilhaSintetica(Const oPlanilha: TSinglePlanilha): Boolean;
Begin
   _Documento.PlanilhaSintetica := oPlanilha;
   Result := _Documento.ContabilizaPlanilhaSintetica(_PlanilhaBaixa);
End;

Procedure TCtrlBaixaDocumentos.ValidaDataBaixa(iCodDocumento: LongInt; dDataPagto: TDateTime);
Var
   bRecebAtecip: boolean;
   _cdsLocal: TClientDataset; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
Begin
   //início andré tavares - pendência 20316 - 27/01/2005
   bRecebAtecip := False;

   // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   _Cds.Close;
   _Cds.Data := GetDataPacket(
      'SELECT DATALANCTO, OPERACAO FROM LANCTODOCUM WHERE CODDOCUMENTO = ' +
      //fim andré tavares - pendência 20316 - 27/01/2005
      IntToStr(iCodDocumento) +
      ' AND OPERACAO IN (''2'',''3'',''1'',''14'') AND ' +
      ' trunc(DATALANCTO) > TO_DATE(' + QuotedStr(DateToStr(dDataPagto)) + ',' + '''DD/MM/YYYY'')'    // WO22484 Ferrari
      );

   //início andré tavares - pendência 20316 - 27/01/2005 - não testa a data se estiver baixando
     //um documento com recebimento antecipado (com a coluna placontaant preenchida).
  {
     with TClientDataSet.Create(nil) do
     begin
       try
         data := GetDataPacket(' SELECT PLACONTAANT FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento));
         bRecebAtecip := trim(fieldByName('PLACONTAANT').asString) <> '';
       finally
         close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
         free;
       end;//try
     end; //with
  }
     // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   _cdsLocal := TClientDataSet.Create(Nil);
   Try
      _cdsLocal.Data := GetDataPacket(
         ' SELECT PLACONTAANT FROM DOCUMENTO WHERE CODDOCUMENTO = ' +
         IntToStr(iCodDocumento)
         );
      bRecebAtecip := Trim(_cdsLocal.fieldByName('PLACONTAANT').asString) <> '';
   Finally
      FreeAndNil(_cdsLocal);
   End; //try

   If (Not _Cds.IsEmpty) And (Not bRecebAtecip) Then
      //fim andré tavares - pendência 20316 - 27/01/2005
      Raise Exception.Create(Format(MSG_ERRO_VERIFICADATA,
         [_Cds.fieldbyname('datalancto').asstring]));

   _cds.Close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
End;

Procedure TCtrlBaixaDocumentos.SetDadosModulo(SistemaLancto: TSistemaLancto; rValorLanc: Double = 0);
Begin
   If SistemaLancto = slCap Then
      Begin
         _IdModulo := 3;
         _RecPag := 'P';

         If rValorLanc > 0 Then
            _DebCred := 'D'
         Else
            _DebCred := 'C';
      End
   Else
      Begin
         _IdModulo := 4;
         _RecPag := 'R';

         If rValorLanc > 0 Then
            _DebCred := 'C'
         Else
            _DebCred := 'D';
      End;
End;

Function TCtrlBaixaDocumentos.GetEmptyCdsBaixa(bAddCodAlteradorBaixa: Boolean = false): OleVariant;
Var
   sCodAltBaixa: String;
Begin
   (* Gustavo - 06/03/2003 - Início *)
   If bAddCodAlteradorBaixa Then
      sCodAltBaixa := ', (0) AS CODALTERADORBAIXA, '' '' AS FLGCONTABALTERADOR '
   Else
      sCodAltBaixa := '';
   (* Gustavo - 06/03/2003 - Fim *)

   Result := GetDataPacket(' SELECT ' +
      // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
      '   ''S'' FLGMARCADO, ' +
      '   D.IDFORCLI, ' +
      '   D.OPERACAO, ' +
      '   D.CODTIPDOC, ' +
      '   D.IDPESSOA, ' +
      '   D.CODDOCUMENTO, ' +
      '   D.NODOCUMENTO, ' +
      '   D.COMPLDOCUMENTO, ' +
      '   D.DATAPROGRAMADA, ' +
      '   D.DATAVENCTO, ' +
      '   D.RECPAG, ' +
      '   P.NOME, ' +
      '   D.STATUS, ' +
      '   D.MOECODIGO, ' +
      '   D.PLANO, ' +
      '   D.PLACONTA, ' +

      // Rodolpho da Silva - P: 18013 - 07/11/2005
      '   D.IDMODULO, ' +

      '   D.CODSUBCONTA, ' +
      '   D.CODCENTROCUSTO, ' +
      '   D.CODGRUPOCNAB, ' +
      '   D.NOSSONUMERO, ' +
      '   L.HISTORICOCOMPL, ' +
      '   L.NUMLANCTO, ' +
      '   L.VLRLIQUIDO, ' +
      '   L.VALOR, ' +
      '   L.VALOROUTRAMOEDA, ' +
      '   L.DEBCRE, ' +
      // 08/10/03 - Alex - Pend 14818 - Incorporando fontes Beraldo
      '   -1 AS NUMEROLOTE, ' + {* Clementino - 19/04/2003 foi criado para guardar o numero do lote *}
      '   DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO, ' +
      '  (0) AS JUROS, (0) AS DESCONTOS, (0) AS ABATIMENTO, (0) AS TARIFABANCARIA, ' + (* Gustavo - 26/03/2003 *)

      // André Tavares - pendência 22528  - não estava correto - 21/08/2006
      ' (-1) AS NUMLOTE, ' +

      ' 0 as CODPORTFORMA, ' + //andré tavares - pendência 21102 - 24/05/2006
      '   2 AS STATUSVALOR ' + sCodAltBaixa + (* Gustavo - 06/03/2003 *)
      ', 0 as FLOATFORMAPAG ' + //andré tavares - pendência 23195 - 04/09/2006
      ', CAST(null as DATE) as DATABAIXA ' + // Alterado por FHBS - SOL: 155003 KTN: 1195982
      ', L.CODOCORRENCIA, ' + // SOL 187427/12463 KINTANA 185959, TADEU PASSOS
      ' 0 as IDMODELOCNAB,  ' + // Edilaine - SOL 187427-13894 / KTN 1920585

      ' ''S'' AS  FLGBAIXATOTAL ' + // Edilaine Ferraresi - SOL 221352 / KTN 2053933

      ' FROM ' +
      '   DOCUMENTO D, ' +
      '   PESSOA P, ' +
      '   LANCTODOCUM L ' +
      ' WHERE ' +
      '   1 = 2 ');
End;

Procedure TCtrlBaixaDocumentos.SetNumLancto(Const Value: Integer);
Begin
   FNumLancto := Value;
End;

Function TCtrlBaixaDocumentos.ProcessoRadLiberado(CodDocumento: Integer): boolean;
Var
   cdsAux: TClientDataset;
Begin
   Result := True;
   cdsAux := TClientDataset.Create(Nil);
   Try
      cdsAux.Data := GetDataPacket(
         ' SELECT IDPROCESSO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(CodDocumento));
      Result := cdsAux.FieldByName('IDPROCESSO').IsNull;
      If Not Result Then
         Begin
            If CtrlRADPlus.RecuperaVersaoRAD = '+' Then
               Result := (CtrlRADPlus.SituacaoProcesso(cdsAux.FieldByName('IDPROCESSO').AsInteger) = 'S')
            Else
               Result := CtrlRAD.SituacaoProcesso(cdsAux.FieldByName('IDPROCESSO').AsInteger);

         End;

   Finally
      cdsAux.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
      cdsAux.Free;
   End;
End;

Procedure TCtrlBaixaDocumentos.AbreParametros(
   Const SistemaLancto: TSistemaLancto; Const iIdPessoa: integer);
Var
   sSql: String;
Begin
   If Not _CdsParamCAP.Active Then
      Begin
         // seta os dados do módulo : RECPAG
         SetDadosModulo(SistemaLancto);

         sSql := 'SELECT * FROM PARAMCAP ' + #13 +
            'WHERE IDPESSOA = ' + IntToStr(iIdPessoa) + #13 +
            '  AND RECPAG   = ' + QuotedStr(_RecPag);

         _CdsParamCap.Data := GetDataPacket(sSql);
      End;

End;

//início - andré tavares - pendência 21647 - 11/04/2006

Function TCtrlBaixaDocumentos.UpdateEmissBloq(Const coddocumento: double): Boolean;
Begin
   result := true;
   Try
      execSql('UPDATE DOCUMENTO SET EMISBLOQ = ''N'' WHERE CODDOCUMENTO = ' + floatToStr(coddocumento));
   Except
      result := false;
      messageInfo := 'Erro ao atualizar o campo EMISSBLOC da tabela DOCUMENTO. Documento não Baixado.';
      Raise Exception.Create('messageInfo');
   End; //try
End;
//fim - andré tavares - pendência 21647 - 11/04/2006

Function TCtrlBaixaDocumentos.getPorformaBaixa(Const codPortForma: integer): boolean;
Begin
   Result := true;
   Try
      _DtmCtrlDocCapCar.SqlPortForma.Prepare;
      _DtmCtrlDocCapCar.SqlPortForma.ParamByName('CODPORTFORMA').AsInteger := codPortForma;
      _DtmCtrlDocCapCar.SqlPortForma.Open;
   Except
      Result := False;
   End;
End;

//início - andré tavares - pendeência 21601 - 24/08/2006
//verifica se existe relacionamento portadorConta X Plano relacionado a um portadorforma no rateio do documento

Function TCtrlBaixaDocumentos.VerificaPortadorContaXPlano(Const coddocumento: int64;
   Const codportForma: integer): Boolean;
Var cdsRelacionamento: TClientDataset;
Begin
   result := false;
   cdsRelacionamento := TClientDataSet.Create(Nil);
   Try
      cdsRelacionamento.data := GetDataPacket(
         ' SELECT DISTINCT IDPLANOPREV FROM RATEIODOCUM ' + #13 +
         ' WHERE CODDOCUMENTO = ' + intToStr(coddocumento) +
         '   AND IDPLANOPREV NOT IN  ( ' + #13 +
         '                         SELECT P.IDPLANOPREV ' + #13 +
         '                         FROM PORTCONTAXPLANO P, PORTADORFORMA PF ' + #13 +
         '                         WHERE  P.CODPORTADOR = PF.CODPORTADOR AND ' + #13 +
         '                                PF.CODPORTFORMA = ' + intToStr(codportForma) + #13 +
         '                        )');

      result := cdsRelacionamento.IsEmpty Or cdsRelacionamento.fieldByName('IDPLANOPREV').IsNull;

      cdsRelacionamento.data := GetDataPacket(
         '                         SELECT P.IDPLANOPREV ' + #13 +
         '                         FROM PORTCONTAXPLANO P, PORTADORFORMA PF ' + #13 +
         '                         WHERE  P.CODPORTADOR = PF.CODPORTADOR AND ' + #13 +
         '                                PF.CODPORTFORMA = ' + intToStr(codportForma));

      result := result Or cdsRelacionamento.IsEmpty;

   Finally
      cdsRelacionamento.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
      cdsRelacionamento.free;
   End; //try
End;
//fim - andré tavares - pendeência 21601 - 24/08/2006

Procedure TCtrlBaixaDocumentos.SetObservacao(Const Value: String);
Begin
   FObservacao := Value;
End;

Function TCtrlBaixaDocumentos.DocTemPai(piCodDocumento: Integer; piNumLote: integer): boolean;
Var
   cdsAux: TClientDataset;
Begin
   Result := False;
   cdsAux := TClientDataset.Create(Nil);
   Try
      If piNumLote > 0 Then
         cdsAux.Data := GetDataPacket(' SELECT 1 FROM lotexdocum  lxd, DOCUMXDOCUM dxd ' +
            ' WHERE lxd.numlote = ' + IntToStr(piNumLote) +
            '   AND DXD.IDDOCUMENTO = LXD.CODDOCUMENTO ')
      Else
         cdsAux.Data := GetDataPacket(' SELECT 1 FROM DOCUMXDOCUM WHERE IDDOCUMENTO = ' + IntToStr(piCodDocumento));

      Result := Not cdsAux.IsEmpty;
   Finally
      cdsAux.close;
      cdsAux.Free;
   End;
End;

Function TCtrlBaixaDocumentos.BuscaDocFilho(piCodDocumento: integer; piNumLote: integer): OleVariant;
Begin
   If piCodDocumento > 0 Then
      Result := GetDataPacket('SELECT ' +
         '  0 AS VALORPAGO, ' +
         '  0 as VALORPAGOOOTRMOE, ' +
         '  U.SALDO, ' +
         '  U.SALDO1, ' +
         '  D.IDFORCLI, ' +
         '  D.OPERACAO, ' +
         '  D.IDPESSOA, ' +
         '  D.CODDOCUMENTO, ' +
         '  D.NODOCUMENTO, ' +
         '  D.COMPLDOCUMENTO, ' +
         '  D.DATAPROGRAMADA, ' +
         '  D.DATADISPONIB, ' + //Helen - SOL: 126261/1121 KTN: 760963
         '  D.CODTIPDOC, ' +
         '  D.IDMODULO, ' +

         '  D.DATAVENCTO, ' +
         '  D.RECPAG, ' +
         '  P.NOME, ' +
         '  D.STATUS, ' +
         '  D.MOECODIGO, ' +
         '  D.PLANO, ' +
         '  D.PLACONTA, ' +
         '  D.CODCENTROCUSTO, ' +
         '  D.CODSUBCONTA, ' +
         '  D.CODGRUPOCNAB, ' +
         '  D.NOSSONUMERO, ' +
         '  L.NUMLANCTO, ' +
         '  L.VLRLIQUIDO, ' +
         '  L.DEBCRE, ' +
         '  L.VALOROUTRAMOEDA, ' +
         '  0 AS IMPRET, ' +
         '  0 AS IMP, ' +
         '  0 AS DIF, ' +
         '  ''                    '' AS PLANOPREV ' +
         ' FROM ' +
         '   DOCUMENTO D, ' +
         '   PESSOA P, ' +
         '   LANCTODOCUM L, ' +
         '   DOCUMXDOCUM DXD, ' +

         '  (SELECT L.CODDOCUMENTO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ' +
         '   FROM LANCTODOCUM L, DOCUMENTO D, DOCUMXDOCUM DXD ' +
         '   WHERE D.CODDOCUMENTO = L.CODDOCUMENTO ' +
         '     AND D.STATUS <> ''2'' ' +
         '     AND DXD.IDDOCUMENTOPAI = ' + IntToStr(piCodDocumento) +
         '     AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '   GROUP BY L.CODDOCUMENTO) U ' +

         ' WHERE DXD.IDDOCUMENTOPAI = ' + IntToStr(piCodDocumento) +
         '   AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '   AND DXD.IDDOCUMENTO    = L.CODDOCUMENTO ' +
         '   AND U.CODDOCUMENTO     = DXD.IDDOCUMENTO ' +
         '   AND D.STATUS          <> ''2'' ' +
         '   AND D.IDFORCLI         = P.IDPESSOA ')
   Else
      Result := GetDataPacket('SELECT ' +
         '  0 AS VALORPAGO, ' +
         '  0 as VALORPAGOOOTRMOE, ' +
         '  U.SALDO, ' +
         '  U.SALDO1, ' +
         '  D.IDFORCLI, ' +
         '  D.OPERACAO, ' +
         '  D.IDPESSOA, ' +
         '  D.CODDOCUMENTO, ' +
         '  D.NODOCUMENTO, ' +
         '  D.COMPLDOCUMENTO, ' +
         '  D.DATAPROGRAMADA, ' +
         '  D.DATADISPONIB, ' + //Helen - SOL: 126261/1121 KTN: 760963
         '  D.CODTIPDOC, ' +
         '  D.IDMODULO, ' +

         '  D.DATAVENCTO, ' +
         '  D.RECPAG, ' +
         '  P.NOME, ' +
         '  D.STATUS, ' +
         '  D.MOECODIGO, ' +
         '  D.PLANO, ' +
         '  D.PLACONTA, ' +
         '  D.CODCENTROCUSTO, ' +
         '  D.CODSUBCONTA, ' +
         '  D.CODGRUPOCNAB, ' +
         '  D.NOSSONUMERO, ' +
         '  L.NUMLANCTO, ' +
         '  L.VLRLIQUIDO, ' +
         '  L.DEBCRE, ' +
         '  L.VALOROUTRAMOEDA, ' +
         '  0 AS IMPRET, ' +
         '  0 AS IMP, ' +
         '  0 AS DIF, ' +
         '  ''                    '' AS PLANOPREV ' +
         ' FROM ' +
         '   DOCUMENTO D, ' +
         '   PESSOA P, ' +
         '   LANCTODOCUM L, ' +
         '   DOCUMXDOCUM DXD, ' +
         '   LOTEXDOCUM LXD, ' +
         '  (SELECT L.CODDOCUMENTO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ' +
         '   FROM LANCTODOCUM L, DOCUMENTO D, DOCUMXDOCUM DXD, LOTEXDOCUM LXD ' +
         '   WHERE D.CODDOCUMENTO = L.CODDOCUMENTO ' +
         '     AND D.STATUS <> ''2'' ' +
         '     AND DXD.IDDOCUMENTOPAI = LXD.CODDOCUMENTO ' +
         '     AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '     AND LXD.NUMLOTE        = ' + IntToStr(piNumLote) +
         '   GROUP BY L.CODDOCUMENTO) U ' +

         ' WHERE DXD.IDDOCUMENTOPAI = LXD.CODDOCUMENTO ' +
         '   AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '   AND DXD.IDDOCUMENTO    = L.CODDOCUMENTO ' +
         '   AND U.CODDOCUMENTO     = DXD.IDDOCUMENTO ' +
         '   AND D.STATUS          <> ''2'' ' +
         '   AND LXD.NUMLOTE        = ' + IntToStr(piNumLote) +
         '   AND D.IDFORCLI         = P.IDPESSOA ');
End;

Function TCtrlBaixaDocumentos.BuscaDocFilhoBaixado(piCodDocumento: integer; piNumLote: integer): OleVariant;
Begin //Helen - Sol: 126261/1121 - Kintana: 760963
   If piCodDocumento > 0 Then
      Result := GetDataPacket('SELECT distinct  ' +
         '  0 AS VALORPAGO, ' +
         '  0 as VALORPAGOOOTRMOE, ' +
         '  U.SALDO, ' +
         '  U.SALDO1, ' +
         '  D.IDFORCLI, ' +
         '  D.OPERACAO, ' +
         '  D.IDPESSOA, ' +
         '  D.CODDOCUMENTO, ' +
         '  D.NODOCUMENTO, ' +
         '  D.COMPLDOCUMENTO, ' +
         '  D.DATAPROGRAMADA, ' +
         '  D.DATADISPONIB, ' +
         '  D.CODTIPDOC, ' +
         '  D.IDMODULO, ' +
         '  D.DATAVENCTO, ' +
         '  D.RECPAG, ' +
         '  P.NOME, ' +
         '  D.STATUS, ' +
         '  D.MOECODIGO, ' +
         '  D.PLANO, ' +
         '  D.PLACONTA, ' +
         '  D.CODCENTROCUSTO, ' +
         '  D.CODSUBCONTA, ' +
         '  D.CODGRUPOCNAB, ' +
         '  D.NOSSONUMERO, ' +
         '  ''  ''  as NUMLANCTO /*L.NUMLANCTO*/, ' +
         '  L.VLRLIQUIDO, ' +
         '  ''  ''  as DEBCRE /*L.DEBCRE*/, ' +
         '  L.VALOROUTRAMOEDA, ' +
         '  0 AS IMPRET, ' +
         '  0 AS IMP, ' +
         '  0 AS DIF, ' +
         '  ''                    '' AS PLANOPREV ' +
         ' FROM ' +
         '   DOCUMENTO D, ' +
         '   PESSOA P, ' +
         '   LANCTODOCUM L, ' +
         '   DOCUMXDOCUM DXD, ' +
         '  (SELECT L.CODDOCUMENTO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ' +
         '   FROM LANCTODOCUM L, DOCUMENTO D, DOCUMXDOCUM DXD ' +
         '   WHERE D.CODDOCUMENTO = L.CODDOCUMENTO ' +
         '     AND D.STATUS = ''2'' ' +
         '     AND DXD.IDDOCUMENTOPAI = ' + IntToStr(piCodDocumento) +
         '     AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '   GROUP BY L.CODDOCUMENTO) U ' +
         ' WHERE DXD.IDDOCUMENTOPAI = ' + IntToStr(piCodDocumento) +
         '   AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '   AND DXD.IDDOCUMENTO    = L.CODDOCUMENTO ' +
         '   AND U.CODDOCUMENTO     = DXD.IDDOCUMENTO ' +
         '   AND D.STATUS           = ''2'' ' +
         '   AND D.IDFORCLI         = P.IDPESSOA ')
   Else
      Result := GetDataPacket('SELECT ' +
         '  0 AS VALORPAGO, ' +
         '  0 as VALORPAGOOOTRMOE, ' +
         '  U.SALDO, ' +
         '  U.SALDO1, ' +
         '  D.IDFORCLI, ' +
         '  D.OPERACAO, ' +
         '  D.IDPESSOA, ' +
         '  D.CODDOCUMENTO, ' +
         '  D.NODOCUMENTO, ' +
         '  D.COMPLDOCUMENTO, ' +
         '  D.DATAPROGRAMADA, ' +
         '  D.DATADISPONIB, ' +
         '  D.CODTIPDOC, ' +
         '  D.IDMODULO, ' +
         '  D.DATAVENCTO, ' +
         '  D.RECPAG, ' +
         '  P.NOME, ' +
         '  D.STATUS, ' +
         '  D.MOECODIGO, ' +
         '  D.PLANO, ' +
         '  D.PLACONTA, ' +
         '  D.CODCENTROCUSTO, ' +
         '  D.CODSUBCONTA, ' +
         '  D.CODGRUPOCNAB, ' +
         '  D.NOSSONUMERO, ' +
         '  L.NUMLANCTO, ' +
         '  L.VLRLIQUIDO, ' +
         '  L.DEBCRE, ' +
         '  L.VALOROUTRAMOEDA, ' +
         '  0 AS IMPRET, ' +
         '  0 AS IMP, ' +
         '  0 AS DIF, ' +
         '  ''                    '' AS PLANOPREV ' +
         ' FROM ' +
         '   DOCUMENTO D, ' +
         '   PESSOA P, ' +
         '   LANCTODOCUM L, ' +
         '   DOCUMXDOCUM DXD, ' +
         '   LOTEXDOCUM LXD, ' +
         '  (SELECT L.CODDOCUMENTO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ' +
         '     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ' +
         '   FROM LANCTODOCUM L, DOCUMENTO D, DOCUMXDOCUM DXD, LOTEXDOCUM LXD ' +
         '   WHERE D.CODDOCUMENTO = L.CODDOCUMENTO ' +
         '     AND D.STATUS = ''2'' ' +
         '     AND DXD.IDDOCUMENTOPAI = LXD.CODDOCUMENTO ' +
         '     AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '     AND LXD.NUMLOTE        = ' + IntToStr(piNumLote) +
         '   GROUP BY L.CODDOCUMENTO) U ' +
         ' WHERE DXD.IDDOCUMENTOPAI = LXD.CODDOCUMENTO ' +
         '   AND DXD.IDDOCUMENTO    = D.CODDOCUMENTO ' +
         '   AND DXD.IDDOCUMENTO    = L.CODDOCUMENTO ' +
         '   AND U.CODDOCUMENTO     = DXD.IDDOCUMENTO ' +
         '   AND D.STATUS           = ''2'' ' +
         '   AND LXD.NUMLOTE        = ' + IntToStr(piNumLote) +
         '   AND D.IDFORCLI         = P.IDPESSOA ');
End;

Function TCtrlBaixaDocumentos.DadosFilhoBaixado(piCodDocumento: integer): OleVariant;
Begin //Helen - Sol: 126261/1121 - Kintana: 760963
   If piCodDocumento > 0 Then
      Result := GetDataPacket(
         ' SELECT                                                                         ' +
         '    L.OPERACAO, L.CODDOCUMENTO, L.VALOR, L.VALOROUTRAMOEDA,                     ' +
         '    L.NUMLANCTO, L.DEBCRE, RP.CODPORTFORMA,                                     ' +
         '    (LTRIM(RTRIM(RP.NUMCHQBORDERO))) AS NUMCHQBORDERO,                          ' +
         '    to_number(LTRIM(RTRIM(RP.NUMCHQBORDERO))) AS NUMCHQBORDERO2, (1) AS ESTORNA,' +
         '    D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAPROGRAMADA, P.RAZAOSOCIAL AS NOME,   ' +
         '     NVL(RP.CODLANCFINANC,LP.CODLANCFINANC) AS CODLANCFINANC,                   ' +
         '    D.IDFORCLI, D.OPERACAO AS OPERORI, D.CODTIPDOC, D.IDMODULO, D.IDPESSOA,     ' +
         '    D.DATAVENCTO, D.RECPAG,                                                     ' +
         '    P.NOME AS NOMETABCLI, D.STATUS, D.MOECODIGO, D.PLANO, D.PLACONTA, D.CODSUBCONTA,' +
         '    D.CODCENTROCUSTO, D.CODGRUPOCNAB, D.NOSSONUMERO, L.VLRLIQUIDO,' +
         '    DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO    ' +
         '  FROM                                                            ' +
         '     DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO RP, PESSOA P, PORTADORFORMA PF,' +
         '     LOTEXDOCUM LD, LOTEPAGTO LP ' +
         '  WHERE                          ' +
         '      (D.CODDOCUMENTO = ' + IntToStr(piCodDocumento) + ' ) AND  ' +
         '      (L.ESTORNO IS NULL)              AND       ' +
         '      (RTRIM(L.OPERACAO) = ''5'')        AND     ' +
         '      (P.IDPESSOA = D.IDFORCLI)        AND       ' +
         '      (L.CODDOCUMENTO = RP.CODDOCUMENTO) AND     ' +
         '      (L.NUMLANCTO    = RP.NUMLANCTO)    AND     ' +
         '      (PF.CODPORTFORMA= RP.CODPORTFORMA) AND     ' +
         '      (D.CODDOCUMENTO = LD.CODDOCUMENTO (+)) AND ' +
         '      (LD.NUMLOTE     = LP.NUMLOTE(+))       AND ' +
         '      LD.FLGBAIXA(+) <> ''C'' AND                ' +
         '      ( ( LD.FLGESTORNO IS NULL ) OR ( TRIM( LD.FLGESTORNO ) = ''N'' ) ) AND ' +
         '      (L.CODDOCUMENTO = D.CODDOCUMENTO)          ' +
         '  ');
End;

Function TCtrlBaixaDocumentos.DocumentoComBaixaMista(
   piCodDocumento: integer): boolean;
Var
   sSQL: String;
   cdsAux: TClientDataset;
Begin
   cdsAux := TClientDataset.Create(Nil);
   Try
      sSQL := 'SELECT COUNT(CODDOCUMENTO) QTDDOCS ' +
         '  FROM (SELECT COUNT(REE.CODLANCFINANC) QTD, REE.CODDOCUMENTO ' +
         '          FROM RECBTOPAGTO REE ' +
         '         WHERE REE.CODLANCFINANC IN  ' +
         '               (SELECT RE.CODLANCFINANC ' +
         '                  FROM RECBTOPAGTO RE ' +
         '                 WHERE RE.CODDOCUMENTO = ' + IntToStr(piCodDocumento) + ') ' +
         '         GROUP BY REE.CODDOCUMENTO) ' +
         ' WHERE CODDOCUMENTO <> ' + IntToStr(piCodDocumento);

      cdsAux.Data := GetDataPacket(sSQL);

      Result := (cdsAux.Fields[0].Value <> 0);

   Finally
      cdsAux.close;
      cdsAux.Free;
   End;
End;

End.

