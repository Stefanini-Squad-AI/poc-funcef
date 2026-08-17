//******************************************************************************
//N. Chamado....: SIG130578
//Dt Alteração..: 07/05/2024
//Responsável...: Arnaldo Vicente Scarin
//Descrição.....: Foi criado no Objeto CtrlDocumento uma nova propriedade
//                que contem os planos previdenciarios que serão escolhidos
//                na tela de Lançamento de Alteradores, para que possam
//                ser utilizados no Rateio dos dados.
//                Essa propriedade conterá somente os planos escolhidos para
//                o Rateio dos Alteradores, e esses lançamentos serão
//                armazenados na tabela RateioDocum com o Campo Valor Zerado
//                Tambem será criada uma nova tabela, para que haja o
//                relacionamento entre a Linha do Alterador que está na
//                tabela LanctoDocum e as linhas que estão na Tabela RateioDocum
//                para que haja rastreabilidade e em caso de exclusão do
//                alterador, possam ser excluidos os rateios .
//******************************************************************************
{-------------------------------------------------------------------------------
Rotina............: FazerRateioDocum
Nº SIG............: 114041
Data..............: 12/07/2021
Responsável.......: Edilaine
Descrição.........: Rateio financeiro duplicado na baixa de documentos
--------------------------------------------------------------------------------------------------------
Rotina............: AcertaDifRateio
N. SIG............: SIG101374
Data..............: 16/09/2020
Responsável.......: Edilaine
Descrição.........: Rateio financeiro x contabil divergente com alterador negativo
--------------------------------------------------------------------------------------------------------
Rotina............: FazerRateioDocum
N. SIG............: 71448
Data..............: 17/07/2019
Responsável.......: Fabio Sampaio
Descrição.........: Ajuste na Query, pois quando o valor do documento era igual, 
                    o mesmo era ignorado, então foi adicionado
                    o PLNCODIGO. Exemplo CODDOCUMENTO = 10978488
--------------------------------------------------------------------------------
Rotina............: BuscaRateio
N. SIG............: 86798
Data..............: 27/06/2019
Responsável.......: Edilaine
Descrição.........: Problema na baixa manual duplicando valores quando há alterador
--------------------------------------------------------------------------------
Rotina............: FazerRateioDocum
N. SIG............: 82993
Data..............: 09/04/2019
Responsável.......: Edilaine
Descrição.........: Problema na baixa manual quando há rateio com valor negativo
--------------------------------------------------------------------------------
Rotina............: FazerRateioDocum
N. SIG............: 78944
Data..............: 30/11/2018
Responsável.......: Everson Cunha
Descrição.........: Problema na baixa automática quando o rateio do documento
                    (RATEIODOCUM) estava com valor negativo, devido ao FILTER
                    VALOR > 0, o cdsRateioDocum ficava vazio.
--------------------------------------------------------------------------------
Rotina............: FazerRateioDocum
N. Sol............: 237305
N. PPM............: 483869
Data..............: 13/08/2014
Responsável.......: Edilaine Ferraresi
Descrição.........: rateio de valores no financeiro e contábil errado qdo na
                    baixa há docs baixados parcialmente
--------------------------------------------------------------------------------
Rotina......: FazerRateioDocum
Nº SOL......: 222635-15558
Nº KINTANA..: 2056379
Data........: 17/02/2014
Responsável.: Edilaine Ferraresi
Descrição...: ajuste na condição de busca do rateio financeiro
--------------------------------------------------------------------------------
Rotina......: FazerRateioDocum
Nº SOL......: 221860
Nº KINTANA..: 2054992
Data........: 10/12/2013
Responsável.: Edilaine Ferraresi
Descrição...: ajusta valor do documento para contabilização sintética
--------------------------------------------------------------------------------
Rotina............: ArredondaRateio, FazerRateioDocum
N. Sol............: 211487
N. Kintana........: 2046190
Data..............: 19/09/2013
Responsável.......: Edilaine Ferraresi/ Marcio Sanches Spinosa
Descrição.........: Ajuste da rotina de arredondamento para diferença
                    de centavos
--------------------------------------------------------------------------------
Rotina............: ArredondaRateio, FazerRateioDocum
N. Sol............: 124845-14262
N. Kintana........: 1977287
Data..............: 08/04/2013
Responsável.......: Edilaine Ferraresi
Descrição.........: Ajuste da rotina de arredondamento para diferença
                    de centavos
--------------------------------------------------------------------------------
N. Sol..........: 31714/12862
N. Kintana......: 1875635
Data............: 04/12/2012
Responsável.....: Paulo Nobre
Descrição.......: Conciliado Definitvo pela NOVA Conciliação Bancária
--------------------------------------------------------------------------------
N. Sol..........: 31714_38358
N. Kintana......: 523349_523362
Data............: 05/07/2012
Responsável.....: Paulo Nobre
Descrição.......: Inclusao de rotina em MudaStatusConcilia para atender
                  a NOVA Conciliação Bancária
--------------------------------------------------------------------------------
Rotina......: LancaRatFinRateio
Nº SOL......: 165317
Nº KINTANA..: 1430837
Data........: 04/10/2011
Responsável.: Eraldo Silva da Silva.
Descrição...: Correcao da diferenca entre planos da baixa da AP 169283
              com o contábil.
--------------------------------------------------------------------------------
Rotina......: FazerRateioDocum, LancaRateioFinanc
Nº SOL......: 124845/2201
Nº KINTANA..: 902943
Data........: 30/09/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Criação da função ArredondaRateio para tratamento do
              arredontamento.
              no CodDocumento 1713829, estava fazendo a seguinte operação:
              Trunc(4191,36 * 100) / 100 = 4191,35
              no Lote 3099, estava fazendo a seguinte operação:
              Trunc(0,49 * 100) / 100 = 0,48
--------------------------------------------------------------------------------
 Alterado por Arnaldo V. Scarin, em 28/12/2009
 SOL.: 128563 Kintana: 690151
 Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
 deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
 para o plano "Operações Comuns", e esse deverá ser trocado para o plano
 específico para o PGA
--------------------------------------------------------------------------------
Rotina............: FazerRateioCAPCAR
N. Sol.............: 111077
N. Kintana......: 509193
Data...............: 10/03/2009
Responsável...: Ricardo Alves
Descrição........: Baixa manual/automática não estava sensibilizando
  o financeiro. Também não estava agrupando as contas.
--------------------------------------------------------------------------------
Rotina............: FazerRateioCAPCAR, FezLancFinanc
N. Sol.............: 110469, 110532
N. Kintana......: 505144, 505141
Data...............: 04/03/2009
Responsável...: Ricardo Alves
Descrição........: Lançamentos financeiros de um mesmo portador são
  agrupados em um único lançamento.
--------------------------------------------------------------------------------
Rotina...........: Destroy, FazerRateioCAPCAR, LancafRateioFinanc
N. Sol...........: 103843
N. Kintana.......: 464129
Data.............: 02/02/2009
Responsável......: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente
                   liberados da memória após sua utilização.
--------------------------------------------------------------------------------
Data      : 28/06/2007
Autor     : Rodolpho da Silva
pendência : 25718
Descrição : Corrigido o erro em que tentava-se gravar na tabela FLUXOPREVISTO
            com o campo UNINEGOC nulo, ou seja, gerava a crítica do DbObject
--------------------------------------------------------------------------------
Data      : 12/06/2007
Autor     : Rodolpho da Silva
pendência : 25587
Descrição : Corrigir erro de UPDATE, onde retornava mais de uma linha
            para documentos com baixas parciais (operação 5 2x)
--------------------------------------------------------------------------------
// catia - pendência 22482
--------------------------------------------------------------------------------
Data      : 28/02/2007
Autor     : Rodolpho da Silva
pendência : 24574
Descrição : Implementar nova rotina para desregularização do lançamento-não
            identificado
Metodo    : Diversos
--------------------------------------------------------------------------------
Data      : 05/01/2007
Autor     : Rodolpho da Silva
pendência : 18194
Descrição : Implementar nova rotina de FLUXO DE CAIXA
Metodo    : Diversos
--------------------------------------------------------------------------------
Data      : 30/05/2006
Autor     : Catia Azevedo
pendência : 22482
Descrição : Acerto para recálculo de alteradores no documento da
            ADMINISTRAÇÃO IMOBILIÁRIA.
Metodo    : FazerRateioCapCar
--------------------------------------------------------------------------------
// andre tavares - pendência 19170
--------------------------------------------------------------------------------
Data      : 13/12/2004
Autor     : Andre tavares
pendência : 19170
Descrição : inclusão do parâmetro sHistExt. Se preenchido utilizar o mesmo,
            senão montar o histórico como antes.
Metodo    : FazerRateioCapCar
--------------------------------------------------------------------------------
Rotina    :
Data      : 01/02/2005
Autor     : Rodolpho da Silva
pendência : 18549
Descrição : Não estava verificando se o PortadorForma está habilitado ou não
            à inserir no CFinan
Metodo    : FazerRateioCapCar
--------------------------------------------------------------------------------
Rotina    :
Data      : 13/12/2004
Autor     : Andre tavares
pendência : 18013 do CAR
Descrição : se passar o parâmetro rCodLancFinanc > 0, então atualiza o
            lançamento com acumulo de valores, senão insere um novo lançamento.
Metodo    : LancaRateioFinanc
--------------------------------------------------------------------------------
Rotina    : Divs
Data      : 28/10/2004
Autor     : Alex Pereira
pendência : 17193
Descrição : Segregação de recursos - Implementar a segregação de
            recursos na origem

Metodo    : LancaRatFinRateio  ==> modificado o escopo para private
            LancaRateioFinanc  ==> implementado sub-método para segregação
            na origem
--------------------------------------------------------------------------------
Rotina    : ExcluiFinanceiro
Data      : 24/08/2004
Autor     : Marchetti
Pendência : 14404
Descrição : Colocada a deleção do registro tambem na tabela RELACIONANI,
            pois estava dando erro de constraint
--------------------------------------------------------------------------------
Rotina    : TestaDispFinanc
Data      : 17/08/2004
Autor     : Fabio Fagundes
Descrição : A TestaDispFinanc passa bloquear qualquer data e não mais somente a
            data em bloqueio - Solicitação Karina Funcef
--------------------------------------------------------------------------------
Rotina    : FazerRateioCapCar
Data      : 22/03/2004
Autor     : Marchetti
Pendência : 16119
Descrição : Criado Parametro com data da baixa para lancamento no financeiro
--------------------------------------------------------------------------------
Rotina    : IncluiContabilidade
Data      : 21/01/2004
Autor     : Alex Pereira
Pendência : 14451 - Nova Segregação
Descrição : Pendente para análise futura - 29/01/04 resolvido
--------------------------------------------------------------------------------
// Alterado por: André Tavares - pendência 14438
--------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 07/10/2003
Autor     : Alex Pereira
Pendência : 14818
Descrição : Incorporados os fontes do Beraldo devido a erros no conceituais.
            Instruido por Rosane, exitiam problemas na troca do status do campo
            MOVIMFINANC.STATUSCONCILIA
--------------------------------------------------------------------------------}


unit uCtrlFinanc;

interface

uses SysUtils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet, Classes,
     uDbMovimFinanc, uDbRateioFinanc, uDbRelacionaNI, uGeralFinanc, Wwquery, uCtrlLancamento,
     uDbFluxoPrevisto, uDbFluxoReal, uDbFluxoOrcado, uCtrlModeloHistorico, uListaCamposHistCapCar,
     uCtrlSegregacao, uCtrlPeriodo, uDiasUteis, dialogs, uCmMath;

type
   TRelacionados = record
     IdModOrigRegu : Integer;

     CodLancFinanc : Double;
     DataDisp      : TDateTime;
     FlgNI         : String;
   end;

   TEventoLogFin = procedure(const sLog: string) of object; // evento para o log do financeiro

   TCtrlFinanc = Class(TCmControlObject)


   private
      CtrlGeralFinanc     : TGeralFinanc;
      CtrlLancamento      : TCtrlLancamento;
      CtrlModeloHistorico : TCtrlModeloHistorico;
      CtrlSegregacao      : TCtrlSegregacao;
      CtrlPeriodo         : TCtrlPeriodo;

      FDbMovimFinanc      : TDbMovimFinanc;
      FDbRateioFinanc     : TDbRateioFinanc;
      FDbFluxoPrevisto    : TDbFluxoPrevisto;
      FDbFluxoReal        : TDbFluxoReal;
      FDbFluxoOrcado      : TDbFluxoOrcado;
      FDbRelacionaNI      : TDbRelacionaNI;

      F_rIDPessoa     : Double;
      F_rIDModulo     : Double;
      F_rIDUsuario    : Double;
      F_bUsaPlanoPatro: Boolean;
      FbFlgExecutaAcertoDifCentavos: boolean;

      function LancaRatFinRateio(rUnidNegoc,rMoeCodigo,rIDPessoa,rCodPortador,
                                 rValorCorrente,rValorOutraMoeda:Double;
                                 sCodTipRecDes,sRecPag,sCodCentroRespon: String;
                                 rCodLancFinanc: Double; sCodCentroCusto:String;
                                 rIDPrograma,rIDPatro,rIDPlanoPrev,rCodTipDoc : Double;
                                 const iIdSegregaCriter: integer): Boolean;
      // Alterado por Arnaldo V. Scarin, em 28/12/2009
      // SOL.: 128563 Kintana: 690151
      // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
      // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
      // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
      // específico para o PGA
      function SelecionaPlanoPGA(var pIdPlano, pIdPatro: Double): Boolean;

      // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
      //function ArredondaRateio(Value: Double): Double;                               // Edilaine - SOL 124845-14262 / KTN 1977287 - comentado
      function ArredondaRateio(Value: Double; const bArred5 : boolean = true): Double; // Edilaine - SOL 124845-14262 / KTN 1977287
      procedure SetbFlgExecutaAcertoDifCentavos(const Value: boolean);                 // Edilaine - SOL 124845-14262 / KTN 1977287

   public
      onlLogFinan: TEventoLogFin; // evento para o log do financeiro

      sSqlRelacionados  : String;
      DadosVazio : OleVariant;

//      bFezLanctoFinanc : boolean;    // Edilaine - SOL 124845-14262 / KTN 1977287

      // Alterado por Arnaldo V. Scarin, em 28/12/2009
      // SOL.: 128563 Kintana: 690151
      // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
      // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
      // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
      // específico para o PGA
      F_bUsaPlanoPatro2010 : Boolean;

      function GetIntegraDispFin: boolean;

      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;
      property IntegraDispFinanc: boolean read GetIntegraDispFin;
      property bFlgExecutaAcertoDifCentavos : boolean read FbFlgExecutaAcertoDifCentavos write SetbFlgExecutaAcertoDifCentavos;


      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      function GravaTransFundos(rCodLancDe,rCodLancPara: Double): Boolean;

      function ConciliaConta(rCodPortador: Double; dDataExtrato: TDateTime): Boolean;

      function ExcluiFinanceiro(rCodLancFinanc: Double): Boolean;

      function ExcluiRateioFinanc(rCodLancFinanc: Double): Boolean;

      function MudaStatusConcilia(sStatus:String; dDataConcilia: TDateTime; rCodLancFinanc: Double): Boolean;

      function LancaFinanceiro(DadosContabeis: OleVariant; rIDModulo,rHistPad, rMoeCodigo,
                               rIDUsuario, rCodPortador, rIDPessoa, rValorCorrente,
                               rValorOutraMoeda: Double; dDataLanc, dDataConcilia, dDataDisp: TDateTime;
                               sNumDocum, sEntradaSaida, sHistorico, sStatusConcilia: string;
                               var rCodLancFinanc, rPlnCodigo: Double;  rIDPlano: Double;
                               bIntegraContabil: boolean;
                               bEstorno: boolean = false
                               ): Boolean;

      function AlteraFinanceiro(DadosContabeis: OleVariant; rHistPad, rIDModulo,
                                rMoeCodigo, rIDUsuario, rCodPortador, rIDPessoa, rValorCorrente,
                                rValorOutraMoeda: Double; dDataLanc, dDataConcilia: TDateTime; sNumDocum,
                                sEntradaSaida, sHistorico, sStatusConcilia: string;
                                var rPlnCodigo: Double; rCodLancFinanc, rIDPlano: Double;
                                bIntegraContabil: Boolean): Boolean;

      function LancaRateioFinanc(rUnidNegoc,rMoeCodigo,rIDPessoa,rCodPortador: Double;
                                 rValorCorrente,rValorOutraMoeda:Double;
                                 sCodTipRecDes,sRecPag,sCodCentroRespon:string;
                                 dDataLanc: TDateTime; rCodLancFinanc: Double;
                                 sCodCentroCusto:string;
                                 rIDPrograma, rIDPatro, rIDPlanoPrev, rCodTipDoc,
                                 rIDPlano : Double;
                                 const iIdSegregaCriter: Integer = -1;
                                 const bSegregaOrigem: Boolean = true): Boolean;

      function FazRateioAdm(sTipoRecDesemb,
                            sRecPag: String;
                            rUnidNegoc,
                            rIdPessoa,
                            rIDPlano: Double): OleVariant;

      function FazerRateioCAPCAR(DadosDocPagRec: OleVariant;
                                 sLugarBaixa,sNumChqBor,sRecPag:String;
                                 dDataFloat: TDateTime;
                                 rNumLote, rCodPortador:Double; var rCodLancFinanc: Double;
                                 rIDPessoa, rIDModulo, rIDUsuario, rIDPlano: Double;
                                 bEstornoDocum, bIntegraContabil: Boolean;
                                 dDataDisp:TDateTime = -1; DataBaixa : TDateTime = 0;
                                 sHstExt : string = ''): Boolean;

      procedure VerificaFezRateioFinanceiro( ovDados: OleVariant; sNumChqBor : String );  // Edilaine - SOL 124845-14262 / KTN 1977287

      function FazerRateioDocum(rCodPortador,rCodDocumento: Double; dData: TDateTime;
                                rTotalDocGeral,rTotalDocOMGeral,rSaldoCorrente,rSaldoMoeda,
                                rValorCotacao : currency;                                // Edilaine - SOL 124845-14262 / KTN 1977287
                                rIDPessoa, rIDPlano: Double; var rCodLancFinan :Double;  // Edilaine - SOL 124845-14262 / KTN 1977287
                                sOperacao, sEntradaSaida,sRecPag: String;
                                const bPrimeiraBaixa : boolean = true                    // Edilaine - SOL 124845-14262 / KTN 1977287
                                ): Boolean;

      function IncluiContabilidade(DadosContabeis: OleVariant;
                                   dDataLanc: TDateTime;
                                   rIDModulo,rIDPessoa,rIDUsuario:Double;
                                   var rPlnCodigo: Double; rIDPlano: Double;
                                   bIntegraContabil: Boolean): Boolean;

      function EstornoFinanceiro(dDataEstorno, dDataDisp: TDateTime ; bRegNaoIdent: Boolean;
                                var rCodLancFinanc: Double; rIDPessoa, rIDModulo,
                                rIDUsuario, rIDPlano: Double;
                                bIntegraContabil: Boolean): Boolean;

      procedure CalculaSaldoFinanc(rCodPortador: Double;
                                   dDataLimite: TDateTime;
                                   sStatusConcilia,
                                   sTipoData:string;
                                   var rSaldoValorCorrente,
                                       rSaldoValorOutraMoeda:Double);

      procedure FazerAcumulaRateio(rCodDocumento: Double;var rTotalDocumento,rTotalDocOM :Double);

      function GravaRelacionados(Relacionados: OleVariant): Boolean; overload;
      function GravaRelacionados(aRelacionados: array of TRelacionados): Boolean; overload;

      function GravaFluxoPrev(sCRespon,sCodTipRecDes,sRecPag,sPrev:String;dData: TdateTime;
                              rUnidNeg: Double;rValorCorrente:Double;sCodCentroCusto:String;
                              rIDpessoa,rIDPrograma,rIDPatro,rIDPlanoPrev,rCodTipDoc : Double): Boolean;

      function GravaFluxoReal(sCRespon,sCodTipRecDes,sRecPag,sCodCentroCusto: String;dData: TDateTime;
                              rMoeCodigo,rUnidNeg,rValor,rIDPessoa,rIDPrograma,rIDPatro,rIDPlanoPrev,
                              rCodTipDoc,
                              rCodPortador: Double): Boolean;

      function GravaFluxoOrc(rIDPessoa: Double; dDataProgramada: TDateTime;
                             sCodTipRecDes, sRecPag, sCodCentroRespon, sPrazo: String;
                             rUnidNeg, rValor, rCodTipDoc: Double): Boolean;


      function TestaDispFinanc(iIdPessoa, iIdUsuario: Integer;
               dDataOper: TDateTime): Boolean;


      function DesfazerRegularizacao(const iCodLancFinanc,iIdPessoa,iIdModulo: integer): boolean;


   protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


   end;




implementation
{ TCtrlFinanc }




constructor TCtrlFinanc.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;
   onlLogFinan := nil;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;


   // Alterado por Arnaldo V. Scarin, em 28/12/2009
   // SOL.: 128563 Kintana: 690151
   // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
   // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
   // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
   // específico para o PGA
   F_bUsaPlanoPatro2010 := False;

   FDbMovimFinanc:=TDbMovimFinanc.Create(Self);

   FDbRateioFinanc:=TDbRateioFinanc.Create(Self);

   FDbFluxoPrevisto:=TDbFluxoPrevisto.Create(Self);
   FDbFluxoReal:=TDbFluxoReal.Create(Self);
   FDbFluxoOrcado:=TDbFluxoOrcado.Create(Self);

   FDbRelacionaNI:=TDbRelacionaNI.Create(Self);

   CtrlGeralFinanc:=TGeralFinanc.Create;
   CtrlLancamento:=TCtrlLancamento.Create;

   CtrlModeloHistorico:=TCtrlModeloHistorico.Create;

   CtrlSegregacao := TCtrlSegregacao.Create;

   CtrlPeriodo := TCtrlPeriodo.Create;

   FbFlgExecutaAcertoDifCentavos := true;   // Edilaine - SOL 124845-14262 / KTN 1977287

//   bFezLanctoFinanc := false;  // Edilaine - SOL 124845-14262 / KTN 1977287

   sSqlRelacionados:='SELECT IDRELACIONANI,CODLANCFINANC, '+
                     '       IDMODORIGEMREGU, ' +

                     '       TO_DATE(''01/01/2001'',''dd/mm/yyyy'') AS DATADISP,'+
                     '       FLGNI, '+
                     '       FLGMARCADO '+
                     'FROM RELACIONANI '+
                     'WHERE (1=2) /*+OPTIMIZER_MODE RULE*/';
end;




destructor TCtrlFinanc.Destroy;
begin

  // 27/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
{
   FDbMovimFinanc.Free;
   FDbRateioFinanc.Free;
   FDbRelacionaNI.Free;
   FDbFluxoPrevisto.Free;
   FDbFluxoReal.Free;
   FDbFluxoOrcado.Free;

   CtrlGeralFinanc.Free;
   CtrlLancamento.Free;
   CtrlModeloHistorico.Free;
   CtrlSegregacao.Free;
   CtrlPeriodo.Free;
}


   FreeAndNil(FDbMovimFinanc);
   FreeAndNil(FDbRateioFinanc);
   FreeAndNil(FDbRelacionaNI);
   FreeAndNil(FDbFluxoPrevisto);
   FreeAndNil(FDbFluxoReal);
   FreeAndNil(FDbFluxoOrcado);
   FreeAndNil(CtrlGeralFinanc);
   FreeAndNil(CtrlLancamento);
   FreeAndNil(CtrlModeloHistorico);
   FreeAndNil(CtrlSegregacao);
   FreeAndNil(CtrlPeriodo);

   inherited;
end;




procedure TCtrlFinanc.AfterInitialize;
begin
   inherited;

   CtrlGeralFinanc.InitializeAs(Self);
   CtrlLancamento.InitializeAs(Self);
   CtrlModeloHistorico.InitializeAs(Self);
   CtrlSegregacao.InitializeAs(Self);
   CtrlPeriodo.InitializeAs(self);

   CtrlLancamento.OpenTransaction := False;
end;




procedure TCtrlFinanc.DoChangeDataBase;
begin
   inherited;

   FDbMovimFinanc.DataBaseName   := DataBaseName;
   FDbRateioFinanc.DataBaseName  := DataBaseName;
   FDbFluxoPrevisto.DataBaseName := DataBaseName;
   FDbFluxoReal.DataBaseName     := DataBaseName;
   FDbFluxoOrcado.DataBaseName   := DataBaseName;
   FDbRelacionaNI.DataBaseName   := DataBaseName;

   DadosVazio:=GetDataPacket('SELECT * FROM DUAL WHERE (1=2) /*+OPTIMIZER_MODE RULE*/ ');
end;




function TCtrlFinanc.GravaTransFundos(rCodLancDe, rCodLancPara: Double): Boolean;
var
   sSql: String;
begin
   Result:=True;
   MessageInfo:='';

   sSql :='UPDATE MOVIMFINANC SET CODLANCTRANSF = '+FloatToStr(rCodLancDe)+
          'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancPara)+') ';

   if not(ExecSQL(sSql)) then
    begin
       Result:=False;
       Exit;
    end
   else
    begin
       sSql :='UPDATE MOVIMFINANC SET CODLANCTRANSF = '+FloatToStr(rCodLancPara)+
              'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancDe)+') ';

       if not(ExecSQL(sSql)) then
        begin
           Result:=False;
           Exit;
        end;
    end;
end;




function TCtrlFinanc.FazRateioAdm(sTipoRecDesemb, sRecPag: String;
                                  rUnidNegoc, rIdPessoa, rIDPlano: Double): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   CR.UNIDNEGOC, CR.PERCRATEIO,  U.UNECODIGO, '+
                           '   U.NOME, RE.UNIDNEGOC AS UNIDARAT ' +
                           'FROM  ' +
                           '   PLANOCONTA P,  COMPORATEIOAP CR, UNIDNEGOCIO U, '+
                           '   RATEIOAPEXTRA RE, TIPORECEBDESEMB T ' +
                           'WHERE ' +
                           '   (CR.IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '   (P.PLANO = ' + FloatToStr(rIDPlano) + ') AND ' +
                           '   (RTRIM(T.CODTIPRECDES) = ''' + Trim(sTipoRecDesemb)+ ''') AND ' +
                           '   (RTRIM(T.RECPAG) = ''' + sRecPag + ''') AND ' +
                           '   (RTRIM(T.IDPESSOA) = ' + FloatToStr(rIdPessoa)+ ') AND ' +
                           '   (RE.UNIDNEGOC  = ' + FloatToStr(rUnidNegoc)+ ')  AND ' +
                           '   (P.IDRATEIOAPEXTRA=CR.IDRATEIOAPEXTRA) AND ' +
                           '   (P.IDRATEIOAPEXTRA=RE.IDRATEIOAPEXTRA) AND ' +
                           '   (P.PLACONTA = T.PLACONTA) AND '+
                           '   (P.PLANO = T.PLANO) AND '+
                           '   (CR.UNIDNEGOC = U.UNIDNEGOC) AND ' +
                           '   (CR.IDPESSOA = U.IDPESSOA) AND ' +
                           '   (CR.IDPESSOA = RE.IDPESSOA) ');
end;

function TCtrlFinanc.FazerRateioCAPCAR(
         DadosDocPagRec: OleVariant;
         sLugarBaixa,
         sNumChqBor,
         sRecPag: String;
         dDataFloat: TDateTime;
         rNumLote,
         rCodPortador: Double;
         var rCodLancFinanc: Double;
         rIDPessoa,
         rIDModulo,
         rIDUsuario,
         rIDPlano: Double;
         bEstornoDocum,
         bIntegraContabil: Boolean;
         dDataDisp: TDateTime = -1;
         DataBaixa: TDateTime = 0;
         sHstExt: string = ''
         ): Boolean;
var
  cdsAux              : TCMClientDataSet;
  cdsDocPagRec        : TCMClientDataSet;
  cdsDocumento        : TCMClientDataSet;
  cdsParamCap         : TCMClientDataSet;
  cdsPortadorForma    : TCMClientDataSet;
  cdsFatura           : TCMClientDataSet;
  cdsVerPortForma     : TCMClientDataSet;

  dDataAux            : TDateTime;
  rTotalCorrenteGeral : Double;
  rCodLancFinancAux   : Double;
  sEntradaSaida       : String;
  sHistorico          : String;

  sNumOP              : String;
  sNumSlip            : String;
  sFavorecido         : String;

  rPlnCodigo          : Double;
  rSaldoDoc           : Double;
  rSaldoOM            : Double;
  rSaldoDocAux        : Double;
  rSaldoOMAux         : Double;
  rSaldoTot           : Double;
  rSaldoTotOM         : Double;
  rTotalDocumento     : Double;
  rTotalDocumentoOM   : Double;
  rTotalDocGeral      : Double;
  rTotalDocOMGeral    : Double;

  bFezLanctoFinanc: boolean;   // Edilaine - SOL 124845-14262 / KTN 1977287 - comentado

  function FezLancFinanc( ovDados: OleVariant ): Boolean;
  var
    CdsAux: TClientDataSet;
  begin
    try
      CdsAux      := TClientDataSet.Create(nil);
      CdsAux.Data := ovDados;
      result      := false;

      CdsAux.first;
      if ( CdsAux.fieldByName( 'OPERACAO' ).asString = '2' ) then
      begin
        if ( CdsAux.recordcount = 1 ) then
          result := false;

        while ( not CdsAux.Eof ) and ( CdsAux.recordcount > 1 ) and ( not Result ) do
        begin
          // 14/06/2008 - ### André tavares - para consertar o erro
          // "insufficient memory for this operation"
          // andré tavares - tem que colocar entre aspas pois em alumas
          // ver do oracle não funciona sem aspas
          _cds.Close;
          _cds.Data := getDataPacket(
                    ' SELECT R.CODLANCFINANC FROM RECBTOPAGTO R, MOVIMFINANC M ' +
                    ' WHERE R.CODDOCUMENTO = ' +
                    CdsAux.FieldByName( 'CODDOCUMENTO' ).asString +
                    ' AND ' +
                    ' M.CODLANCFINANC = R.CODLANCFINANC AND M.FLGESTORNADO ' +
                    ' IS NULL AND R.NUMCHQBORDERO = ' +
                    quotedStr( sNumChqBor )
                    );
            result := ( _cds.FieldByName( 'CODLANCFINANC' ).asInteger > 0 );

          _cds.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"

          CdsAux.next;
        end;
      end;

    finally
      CdsAux.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
      CdsAux.Free;
    end;
  end;

begin
  Result:=True;
  MessageInfo:='';

  //sLugarBaixa =>C = quando a baixa é feita pela emissão do cheque
  //               N = quando a baixa é feita pela baixa do documento

  cdsAux           := TCMClientDataSet.Create( nil );
  cdsDocPagRec     := TCMClientDataSet.Create( nil );
  cdsDocumento     := TCMClientDataSet.Create( nil );
  cdsParamCap      := TCMClientDataSet.Create( nil );
  cdsPortadorForma := TCMClientDataSet.Create( nil );
  cdsFatura        := TCMClientDataSet.Create( nil );
  try
    try
      dDataAux := dDataFloat;
      if ( sRecPag='R' ) then
      begin
        if DayOfWeek( dDataAux ) = 1 then
          dDataAux := dDataAux + 1;
        if DayOfWeek( dDataAux ) = 7 then
          dDataAux := dDataAux + 2;
      end
      else
      begin
        if DayOfWeek( dDataAux ) = 1 then
          dDataAux := dDataAux - 2;
        if DayOfWeek( dDataAux ) = 7 then
          dDataAux := dDataAux - 1;
      end;

      if ( sLugarBaixa = 'N' ) and ( rNumLote <> 0 ) then
      begin
        cdsAux.Close;
        // 14/06/2008 - ### André tavares -
        // para consertar o erro "insufficient memory for this operation"
        cdsAux.Data := GetDataPacket(
                    'SELECT CODLANCFINANC ' +
                    'FROM LOTEPAGTO ' +
                    'WHERE (NUMLOTE = ' + FloatToStr( rNumLote ) + ') '
                    );
        rCodLancFinancAux:=cdsAux.FieldByName( 'CODLANCFINANC' ).AsFloat;

        // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
        cdsAux.Close;

        if ( rCodLancFinancAux <> 0 ) then
        begin
          cdsAux.Close;
          cdsAux.Data := GetDataPacket(
                      'SELECT STATUSCONCILIA ' +
                      'FROM MOVIMFINANC '+
                      'WHERE (CODLANCFINANC = ' +
                      FloatToStr( rCodLancFinancAux ) + ') '
                      );

          if cdsAux.FieldByName( 'STATUSCONCILIA' ).AsString = 'C' then
            Result := MudaStatusConcilia( sLugarBaixa, 0, rCodLancFinancAux );

          cdsAux.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
          Exit;
        end;
      end;

      // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
      cdsParamCap.Close;
      cdsParamCap.Data := GetDataPacket(
                       'SELECT HISTPADFINAN ' +
                       'FROM PARAMCAP ' +
                       'WHERE (IDPESSOA = ' + FloatToStr( rIDPessoa ) + ') AND ' +
                       ' (RECPAG = ''' + sRecPag + ''') '
                       );

      // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
      cdsPortadorForma.Close;
      cdsPortadorForma.Data:=GetDataPacket(
              'SELECT P.CODPORTADOR,F.DESCRICAO, P.DESCFINAN ' +
              'FROM PORTADORFORMA P, FORMARECPAG F ' +
              'WHERE (P.CODPORTFORMA = ' +
              FloatToStr( rCodPortador ) + ') AND ' +
              ' (P.CODFORMA = F.CODFORMA)'
              );

      rTotalCorrenteGeral := 0;
      cdsDocPagRec.Data := DadosDocPagRec;


      cdsDocPagRec.First;

      bFezLanctoFinanc := FezLancFinanc( cdsDocPagRec.Data );  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190

      while not( cdsDocPagRec.Eof ) do
      begin
        if ( cdsDocPagRec.FieldByName( 'DEBCRE' ).asString = 'D' ) then
          rTotalCorrenteGeral := rTotalCorrenteGeral +
            cdsDocPagRec.FieldByName( 'VALOR' ).asFloat
        else
          rTotalCorrenteGeral := rTotalCorrenteGeral -
            cdsDocPagRec.FieldByName( 'VALOR' ).asFloat;

        if not bFezLanctoFinanc then
        begin
          if Assigned( onlLogFinan ) then //inicia o log do financeiro
          begin
            if ( cdsDocPagRec.Recno = 1 ) then  //inicia o log do financeiro
            begin
              onlLogFinan( '' );
              onlLogFinan( '////////////////////////////////////////////////////////////////////////////////////////////////////////' );
              onlLogFinan( dateTimeToStr( now ) +
                 '  ---- Início do Lançamento no Financeiro ----' );
            end;

            onlLogFinan(
                ' Documento: ' + cdsDocPagRec.fieldByName( 'CODDOCUMENTO' ).asString +
                StringOfChar( ' ', 10 - Length( cdsDocPagRec.fieldByName( 'CODDOCUMENTO' ).asString ) )+
                ' - Valor: '+ FormatFloat( '#,##0.00;(#,##0.00)', cdsDocPagRec.FieldByName( 'VALOR' ).asFloat ) +
                StringOfChar( ' ', 25 - Length( FormatFloat( '#,##0.00;(#,##0.00)', cdsDocPagRec.FieldByName( 'VALOR' ).asFloat ) ) ) +
                ' - Subtotal '+ FormatFloat( '#,##0.00;(#,##0.00)', rTotalCorrenteGeral ) + ' está sendo contemplado para lançamento no financeiro. ' );

            if ( cdsDocPagRec.RecNo = cdsDocPagRec.RecordCount ) then
              onlLogFinan( 'Total de Documentos a Baixar da "Conta Caixa X Forma de Pagamento '+ cdsDocPagRec.fieldByName('CODPORTFORMA').asString + '" = ' + intToStr(cdsDocPagRec.recordCount) );
          end; //if
        end;//if

        cdsDocPagRec.Next;
      end;

      cdsDocPagRec.First;
      sEntradaSaida := 'S';

      if Trim( sHstExt ) <> '' then
        sHistorico := Trim( sHstExt )
      else
      begin
        if cdsPortadorForma.FieldByName( 'DESCFINAN' ).IsNull then
          sHistorico :=
            Trim( cdsPortadorForma.FieldByName( 'DESCRICAO' ).asString ) + ' N. ' +
            Trim( sNumChqBor )
        else
          sHistorico :=
            Trim( cdsPortadorForma.FieldByName( 'DESCFINAN' ).asString ) + ' N. ' +
            Trim( sNumChqBor );

        if bEstornoDocum then
          sHistorico := 'ESTORNO ' + sHistorico;

        if ( cdsDocPagRec.RecordCount = 1) then
          sHistorico := sHistorico + ' ref. doc. ' +
            Trim( cdsDocPagRec.FieldByName( 'NODOCUMENTO' ).AsString ) +
            Trim( cdsDocPagRec.FieldByName( 'COMPLDOCUMENTO' ).AsString ) + ' ' +
            Trim( cdsDocPagRec.FieldByName( 'NOME' ).AsString );
      end; //else

      if (rTotalCorrenteGeral<0) then
      begin
        rTotalCorrenteGeral := Abs( rTotalCorrenteGeral );
        sEntradaSaida := 'E';
      end;

      sNumOP:='';
      sNumSlip:='';
      sFavorecido:='';

      if ( cdsDocPagRec.Fields.FindField( 'NUMORDEMPAGO' ) <> nil ) then
        sNumOP := cdsDocPagRec.Fields.FindField( 'NUMORDEMPAGO' ).AsString;

      if ( cdsDocPagRec.Fields.FindField( 'NUMSLIP' ) <> nil ) then
        sNumSlip := cdsDocPagRec.Fields.FindField( 'NUMSLIP' ).AsString;

      if ( cdsDocPagRec.Fields.FindField( 'FAVORECIDO' ) <> nil ) then
        sFavorecido := cdsDocPagRec.Fields.FindField( 'FAVORECIDO' ).AsString;

      sHistorico := GetHistoricoCapCar(
                 CtrlModeloHistorico,
                 rIDPessoa,
                 trunc(rIDModulo),
                 4,
                 sHistorico,
                 [sFavorecido,
                 sNumChqBor,
                 sNumOP]
                 );

      rPlnCodigo:=0;

      try
         cdsVerPortForma      := TCMClientDataSet.Create(nil);
         cdsVerPortForma.Data := GetDataPacket(
                 'SELECT LANCAFINANC FROM PORTADORFORMA WHERE CODPORTFORMA = ' +
                 FloatToStr( rCodPortador )
                 );

         //  Só insere no financeiro se o PortadorForma estiver habilitado...
        if ( cdsVerPortForma.FieldByName( 'LANCAFINANC' ).AsString = 'S' ) then
        begin
          bFezLanctoFinanc := FezLancFinanc( cdsDocPagRec.Data );   // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190

          if ( Trim( sLugarBaixa ) = '' ) then
            sLugarBaixa := 'N';

          if not bFezLanctoFinanc then
          begin

            Result := LancaFinanceiro(
                   DadosVazio,
                   rIDModulo,
                   cdsParamCap.FieldByName( 'HISTPADFINAN' ).AsFloat,
                   0,
                   rIDUsuario,
                   cdsPortadorForma.FieldByName( 'CODPORTADOR' ).AsFloat,
                   rIDPessoa,
                   rTotalCorrenteGeral,
                   0,
                   dDataAux,
                   DataBaixa,
                   dDataDisp,
                   sNumChqBor,
                   sEntradaSaida,
                   sHistorico,
                   sLugarBaixa,
                   rCodLancFinanc,
                   rPlnCodigo,
                   rIDPlano,
                   bIntegraContabil,
                   bEstornoDocum
                   );
            if not( Result ) then
            begin
              if Assigned( onlLogFinan ) then //inicia o log do financeiro
                onlLogFinan(
                  '*** Código do Lanc. Financ.: '+
                  FloatTostr( rCodLancFinanc ) +
                  ' *** Subtotal NÃO Contemplado no Financeiro = ' +
                  FormatFloat( '#,##0.00;(#,##0.00)', rTotalCorrenteGeral ) +
                  ' - Erro: ' + Self.MessageInfo
                  );
              Exit;
            end
            else //senão lançou no financeiro, então grava o log de lançamentos do financeiro
            begin
              if Assigned( onlLogFinan ) then //inicia o log do financeiro
                onlLogFinan(
                  'Código do Lanc. Financ.: ' +
                  FloatTostr( rCodLancFinanc ) +
                  ' Subtotal Contemplado no Financeiro = ' +
                  FormatFloat( '#,##0.00;(#,##0.00)', rTotalCorrenteGeral ) +
                  ' - Lançamento Financeiro OK '
                  );
            end;
          end;
        end;
      finally
        cdsVerPortForma.free;
      end;

      rTotalDocumento:=0;
      rTotalDocumentoOM:=0;

      if not bFezLanctoFinanc then
      begin
        cdsDocPagRec.First;
        while not( cdsDocPagRec.Eof ) do
        begin
          rSaldoDoc:=cdsDocPagRec.FieldByName( 'VALOR' ).asFloat;
          rSaldoOM := 0;

          cdsDocumento.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
          cdsDocumento.Data := GetDataPacket(
                  'SELECT RECPAG,CODDOCUMENTO,OPERACAO,NUMFATURA ' +
                  'FROM DOCUMENTO ' +
                  'WHERE (CODDOCUMENTO = ' +
                  FloatToStr( cdsDocPagRec.FieldByName('CODDOCUMENTO').AsFloat ) +
                  ') '
                  );

          if (StrToIntDef(cdsDocumento.FieldByName('OPERACAO').AsString,0) in [1,2,10,11,12,14,15,16]) then
          begin
            FazerAcumulaRateio( cdsDocumento.FieldByName( 'CODDOCUMENTO' ).AsFloat,
              rTotalDocumento, rTotalDocumentoOM );
            rTotalDocGeral := rTotalDocumento;
            rTotalDocOMGeral := rTotalDocumentoOM;

            Result := FazerRateioDocum(
                   cdsPortadorForma.FieldByName( 'CODPORTADOR' ).AsFloat,
                   cdsDocumento.FieldByName( 'CODDOCUMENTO' ).AsFloat,
                   dDataFloat,
                   rTotalDocGeral,
                   rTotalDocOMGeral,
                   rSaldoDoc,
                   rSaldoOM,
                   0,
                   rIDPessoa,
                   rIDPlano,
                   rCodLancFinanc,
                   'MF',
                   sEntradaSaida,
                   sRecPag,
                   cdsDocPagRec.recno=1
                   );
            if not( Result ) then
              Exit;
          end
          else
          begin
            cdsFatura.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"

            cdsFatura.Data := GetDataPacket(
                           'SELECT D.CODDOCUMENTO, L.VALOR, L.VALOROUTRAMOEDA '+
                           'FROM DOCUMENTO D, LANCTODOCUM L '+
                           'WHERE (D.NUMFATURA = ' +
                           FloatToStr( cdsDocumento.FieldByName( 'NUMFATURA' ).AsFloat ) +
                           ') AND ' +
                           ' (RTRIM(D.OPERACAO) = ''1'' OR ' +
                           ' RTRIM(D.OPERACAO) = ''11'') AND ' +
                           ' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                           ' (D.OPERACAO = L.OPERACAO)'
                           );
            rTotalDocGeral   := 0;
            rTotalDocOMGeral := 0;

            cdsFatura.First;
            while not( cdsFatura.eof ) do
            begin
              FazerAcumulaRateio(
                      cdsFatura.FieldByName( 'CODDOCUMENTO' ).AsFloat,
                      rTotalDocumento,
                      rTotalDocumentoOM
                      );

              rTotalDocGeral := rTotalDocGeral + rTotalDocumento;
              rTotalDocOMGeral := rTotalDocOMGeral + rTotalDocumentoOM;
              cdsFatura.Next;
            end;

            rSaldoTot := 0;
            rSaldoTotOM := 0;

            cdsFatura.First;
            while not( cdsFatura.eof ) do
            begin

              if ( rTotalDocGeral <> 0 ) then
                rSaldoDocAux := cdsFatura.FieldByName( 'VALOR' ).asFloat *
                  rSaldoDoc / rTotalDocGeral
              else
                rSaldoDocAux := rSaldoDoc;

              if ( rTotalDocOMGeral <> 0 ) then
                rSaldoOMAux := cdsFatura.FieldByName( 'VALOROUTRAMOEDA' ).asFloat *
                  rSaldoOM / rTotalDocOMGeral
              else
                rSaldoOMAux := rSaldoOM;

              rSaldoDocAux := StrToFloat( Format( '%17.2f', [ rSaldoDocAux ] ) );
              rSaldoOMAux := StrToFloat( Format( '%17.2f', [ rSaldoOMAux ] ) );

              rSaldoTot := rSaldoTot + rSaldoDocAux;
              rSaldoTotOM := rSaldoTotOM + rSaldoOMAux;

              Result := FazerRateioDocum(
                     cdsPortadorForma.FieldByName( 'CODPORTADOR' ).AsFloat,
                     cdsFatura.FieldByName( 'CODDOCUMENTO' ).AsFloat,
                     dDataFloat,
                     rTotalDocGeral,
                     rTotalDocOMGeral,
                     rSaldoDocAux,
                     rSaldoOMAux,
                     0,
                     rIDPessoa,
                     rIDPlano,
                     rCodLancFinanc,
                     'MF',
                     sEntradaSaida,
                     sRecPag,
                     cdsDocPagRec.recno=1
                     );
              if not ( Result ) then
                Exit;

              cdsFatura.Next;
            end;
          end;
          cdsDocPagRec.Next;
          cdsDocumento.Close; //início - 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
          cdsFatura.Close; //início - 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
        end;
      end;
    finally
      //início - 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
      cdsAux.Close;
      cdsDocPagRec.Close;
      cdsDocumento.Close;
      cdsParamCap.Close;
      cdsPortadorForma.Close;
      cdsFatura.Close;
      //fim - 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"

      cdsAux.Free;
      cdsDocPagRec.Free;
      cdsDocumento.Free;
      cdsParamCap.Free;
      cdsPortadorForma.Free;
      cdsFatura.Free;
    end;
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;



function TCtrlFinanc.FazerRateioDocum(rCodPortador,rCodDocumento: Double;
                                      dData: TDateTime; rTotalDocGeral,rTotalDocOMGeral,
                                      rSaldoCorrente,rSaldoMoeda,rValorCotacao : currency;  // Edilaine - SOL 124845-14262 / KTN 1977287
                                      rIDPessoa, rIDPlano: Double;
                                      var rCodLancFinan :Double;
                                      sOperacao,sEntradaSaida,sRecPag: String;
                                      const bPrimeiraBaixa : boolean                        // Edilaine - SOL 124845-14262 / KTN 1977287
                                      ): Boolean;
var
   iDigCAR         : Integer;
   iDigCAP         : Integer;
   iNumDig         : Integer;
   iNumRef         : Integer;
   rPropRateio     : Double;
   rPropRateioPerc : Double;
   rTotGer         : Double;
   rUnidNegoc      : Double;
   sPrev           : String;
   sCodTipRecDes   : String;
   cdsAux          : TCMClientDataSet;
   cdsParamFinanc  : TCMClientDataSet;
   cdsRateioDocum  : TCMClientDataSet;

   // Edilaine - SOL 124845-14262 / KTN 1977287
   bArredonda5     : boolean;
   cdsValDoc       : TCMClientDataSet;
   rSobra          : double;
   bBaixaFinal     : boolean;
   sFiltro         : TStringList;        //edilaine SIG86978
   sSQL            : string;
   // Edilaine - SOL 124845-14262 / KTN 1977287
begin
   Result:=True;
   MessageInfo:='';
   iDigCAR := 0;
   iDigCAP := 0;

   sFiltro := TStringList.create;        //edilaine SIG86978

   cdsValDoc    :=TCMClientDataSet.Create(nil);

   sSql := 'SELECT D.RECPAG, '+
           '       DECODE(D.RECPAG, ''R'', sum( decode(L.debcre, ''D'', L.valor, L.valor*-1)), '+
           '                             sum( decode(L.debcre, ''C'', L.valor, L.valor*-1))    '+
           '             ) as SALDOBAIXA  '+
           '  FROM LANCTODOCUM L, DOCUMENTO D '+
           ' WHERE L.CODDOCUMENTO = D.CODDOCUMENTO '+
           '   AND D.CODDOCUMENTO = '+FloatToStr(rCodDocumento);

  if (bPrimeiraBaixa) then
     sSql := sSql + '   AND NVL(L.PLNCODIGO,0) <> (SELECT MAX(LD.PLNCODIGO) '+
                    '                                FROM LANCTODOCUM LD '+
                    '                               WHERE LD.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +
                    '                                 AND LD.OPERACAO = 5)';

  sSql := sSql + '  GROUP BY D.RECPAG ';

  cdsValDoc.data := GetDataPacket( sSQL );


   bBaixaFinal := (cdsValDoc.Fields[1].asCurrency - rSaldoCorrente) = 0;


   sFiltro.text :=  'SELECT X.UNIDNEGOC,  '+#13+
                    '       X.IDPLANOPREV,  '+#13+
                    '       X.IDPATRO,      '+#13+
                    '       X.VALDOC,       '+#13+
                    '       X.VLR_CONTAB_BAIXA_PARCIAL, '+#13+  // edilaine - SOL 237305 / PPM 483869
                    '       X.VLR_CONTABIL_BAIXA, '+#13+
                    '       x.VLR_FINANC, '+#13+
                    '       X.VLRACUM,'+#13+
                    // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
                    // Alterado por Arnaldo V. Scarin em 08/05/2024
                    // O Case Abaixo era utilizado para fazer com que os valores do rateio fossem
                    // feitos de acordo com a situação selecionada
                    // Mas como foi implementado os lancamentos de rateio para alteradores, que
                    // são guardados na tabela RateioDocum, com o campo Valor Zerado,
                    // foi feita a alteração para que seja utilizado o valor que está no campo
                    // SomaValorOper.
                    //'       CASE                  '+
                    //'          WHEN (X.ALTERADOR_PLN = 0) AND (X.QTDPLN > 0) THEN X.ALTERADOR_MEDIA '+   //edilaine SIG114041
                    //'          WHEN (QTDALT > QTDPLN) AND (QTDPLN > 0) THEN (X.ALTERADOR_MEDIA-X.ALTERADOR_PLN)+X.ALTERADOR_PLN '+
                    //'          WHEN (QTDALT = QTDPLN) THEN X.ALTERADOR_PLN  '+
                    //'          ELSE X.ALTERADOR_MEDIA '+
                    //'       END VLRALTERADOR          '+
                    '       X.SOMAVALOROPER VLRALTERADOR'+#13+
                    'FROM (     '+#13+
                    'SELECT R.UNIDNEGOC,              '+#13+
                    '       R.IDPLANOPREV,            '+#13+
                    '       R.IDPATRO,                '+#13+
                    '       R.MAIORPLANO,                 '+#13+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '       A.VLRALTERADOR AS TOT_ALT,    '+#13+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '       SUM(R.VALOR) AS VALDOC,   '+#13+
                    '       SUM(R.SOMAVALOROPER) as SOMAVALOROPER,' +#13+
                    '       nvl(VLR_CONTABIL_BAIXA, 0) VLR_CONTABIL_BAIXA, '+#13+  // Edilaine Ferraresi - SOL 221860 / KTN 2054992

                    '       NVL(PARC.VLR_CONTAB_BAIXA_PARCIAL, 0) VLR_CONTAB_BAIXA_PARCIAL, '+#13+ //XXX

                    '       F.VLR_FINANC, '+#13+

                    //edilaine SIG101374 : inicio
                    '       (DECODE(SIGN(R.VALOR), 0, 1, SIGN(R.VALOR)) * NVL(APLN.VLRALTERADOR, 0)) ALTERADOR_PLN,  '+#13+
                    '       (DECODE(SIGN(R.VALOR), 0, 1, SIGN(R.VALOR)) * NVL(DECODE(APLN.VLRALTERADOR,              '+#13+
                    '                      NULL,  ROUND((R.VALOR / A.VALOR_DOC) * NVL(A.VLRALTERADOR, 0), 2),        '+#13+
                    '                             NVL(APLN.VLRALTERADOR, 0)), 0 '+#13+
                    '          )) VLRALTERADOR,    '+#13+
                    //edilaine SIG101374 : fim

                    '       DECODE(R.MAIORPLANO, ''N'', ROUND((R.VALOR / A.VALOR_DOC) * NVL(A.VLRALTERADOR, 0), 2), /*  -- calcula percentual    */       '+#13+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '                                 ROUND((R.VALOR / A.VALOR_DOC) * NVL(A.VLRALTERADOR, 0), 2) +  /* -- calc percentual e calcula dif  */ '+#13+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '                                 (A.VLRALTERADOR -                                                                               '+#13+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '                                 SUM( ROUND((R.VALOR / A.VALOR_DOC) * NVL(A.VLRALTERADOR, 0), 2) ) OVER(ORDER BY R.IDPLANOPREV)) '+#13+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '             ) ALTERADOR_MEDIA,                                                                                                  '+#13+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190

                    //'       ROUND((R.VALOR / A.VALOR_DOC) * NVL(A.VLRALTERADOR, 0), 2) ALTERADOR_MEDIA,                                 '+  // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190

                    '       0 as VLRACUM,  '+#13+
                    '       ( SELECT COUNT(*)             '+#13+
                    '           FROM LANCTODOCUM L2       '+#13+
                    '          WHERE L2.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                    '            AND L2.OPERACAO = 4 '+#13+
                    '            AND L2.PLNCODIGO IS NOT NULL                   '+#13+
                    '        ) QTDPLN,            '+#13+

                    '       ( SELECT COUNT(*)     '+#13+
                    '           FROM LANCTODOCUM L3  '+#13+
                    '          WHERE L3.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                    '            AND L3.OPERACAO = 4 '+#13+
                    '        ) QTDALT            '+#13+
                    '    FROM      '+#13+
                    '        (select ra.coddocumento, sum(ra.valor) AS VALOR, ra.unidnegoc, ra.idplanoprev, ra.idpatro, '+#13+
                    '                SUM(ROUND(RA.SOMAVALOROPER,2)) AS SOMAVALOROPER,'+#13+
                    '                DECODE(LEAD(RA.IDPLANOPREV, 1, 0) OVER(ORDER BY RA.IDPLANOPREV),0,''S'',''N'') AS MAIORPLANO     '+#13+ // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '           from RATEIODOCUM RA '+#13+
                    '          where ra.coddocumento = '+FloatToStr(rCodDocumento) +#13+
                    '          group by ra.coddocumento, ra.unidnegoc, ra.idplanoprev, ra.idpatro '+#13+
                    '          ORDER BY RA.IDPLANOPREV   '+#13+ // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                    '        ) R, '+#13+
                    //edilaine - SIG82993 - inicio
                    //'       ( SELECT SUM(A2.VLRALTERADOR) VLRALTERADOR,         '+
                    '     (SELECT SUM(AT.VLRALTERADOR) VLRALTERADOR, AT.IDPLANOPREV, AT.UNIDNEGOC, AT.IDPATRO  FROM '+#13+  //edilaine SIG86798
                    //edilaine SIG101374 : inicio
                    //'       (SELECT CASE   '+
                    //'                  WHEN ABS(SUM(A2.VLRALTERADOR)) > ABS(A2.LANC_DOC) THEN A2.LANC_DOC  '+
                    //'                  ELSE SUM(A2.VLRALTERADOR)                                           '+
                    //'                END VLRALTERADOR,                                                     '+
                    '       (SELECT SUM(A2.VLRALTERADOR) AS VLRALTERADOR, '+#13+
                    //edilaine SIG101374 : fim
                    //edilaine - SIG82993 - fim
                    '               A2.PLNCODIGO, '+#13+ // Alterado por FHBS - 17/07/2019 - SIG71448
                    '               A2.IDPLANOPREV, A2.UNIDNEGOC, A2.IDPATRO    '+#13+
                    '           FROM                      '+#13+
                    '       (SELECT DECODE(DC.RECPAG,     '+#13+
                    '                      ''R'',           '+#13+
                    '                      DECODE(DC.DEBCRE,                    '+#13+
                    '                             ''D'',                        '+#13+
                    '                             sum(LA.LACVALOR / 2),         '+#13+
                    '                             sum(LA.LACVALOR / 2) * -1),   '+#13+
                    '                      DECODE(DC.DEBCRE,      '+#13+
                    '                             ''C'',            '+#13+
                    '                             sum(LA.LACVALOR / 2),  '+#13+
                    '                             sum(LA.LACVALOR / 2) * -1)) VLRALTERADOR,'+#13+
                    '                      LA.PLNCODIGO, '+#13+ // Alterado por FHBS - 17/07/2019 - SIG71448
                    '                      DC.VALOR AS LANC_DOC,  '+#13+                                                  //edilaine - SIG82993
                    '               LA.IDPLANOPREV, LA.UNIDNEGOC, LA.IDPATRO               '+#13+
                    '          FROM LANCAMENTO LA,                '+#13+
                    '               (SELECT L.PLNCODIGO, D.RECPAG, L.DEBCRE,   '+#13+
                    '                       DECODE(D.RECPAG, ''R'', DECODE(L.DEBCRE, ''D'', L.VALOR, -L.VALOR), '+#13+    //edilaine - SIG82993
                    '                                               DECODE(L.DEBCRE, ''C'', L.VALOR, -L.VALOR)  '+#13+    //edilaine - SIG82993
                    '                       ) AS VALOR '+#13+                                                             //edilaine - SIG82993
                    '                  FROM LANCTODOCUM L, DOCUMENTO D        '+#13+
                    '                 WHERE D.CODDOCUMENTO = L.CODDOCUMENTO   '+#13+
                    '                   AND L.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                    '                   AND L.OPERACAO = 4 '+#13+
                    '               ) DC    '+#13+
                    '         WHERE LA.PLNCODIGO = DC.PLNCODIGO               '+#13+
                    '         GROUP BY DC.RECPAG, DC.DEBCRE, LA.IDPLANOPREV, LA.UNIDNEGOC, LA.IDPATRO, DC.VALOR, LA.PLNCODIGO ) A2   '+#13+  //edilaine - SIG82993 // Alterado por FHBS - 17/07/2019 - SIG71448
                    //edilaine SIG101374 : inicio
                    //'         GROUP BY A2.IDPLANOPREV, A2.UNIDNEGOC, A2.IDPATRO, A2.LANC_DOC, A2.PLNCODIGO '+    //edilaine - SIG82993 // Alterado por FHBS - 17/07/2019 - SIG71448
                    '         GROUP BY A2.IDPLANOPREV, A2.UNIDNEGOC, A2.IDPATRO, A2.PLNCODIGO '+#13+
                    //edilaine SIG101374 : fim
                    '         ) AT  GROUP BY AT.IDPLANOPREV, AT.UNIDNEGOC, AT.IDPATRO  '+#13+  //edilaine - SIG86798
                    '       ) APLN, '+#13+
                    '       (SELECT SUM(A1.VLRALTERADOR) VLRALTERADOR,      '+#13+
                    '               A1.IDPLANOPREV,      '+#13+
                    '               A1.VALOR_DOC,         '+#13+
                    '               A1.UNIDNEGOC, A1.IDPATRO '+#13+
                    '          FROM (SELECT DECODE(D.RECPAG,                '+#13+
                    '                              ''R'',                     '+#13+
                    '                              DECODE(LA.DEBCRE,        '+#13+
                    '                                     ''D'',              '+#13+
                    '                                     sum(LA.VALOR),    '+#13+
                    '                                     sum(LA.VALOR) * -1),'+#13+
                    '                              DECODE(LA.DEBCRE,    '+#13+
                    '                                     ''C'',          '+#13+
                    '                                     sum(LA.VALOR),  '+#13+
                    '                                     sum(LA.VALOR) * -1)) VLRALTERADOR,'+#13+
                    '                       (select l1.valor            '+#13+
                    '                          from lanctodocum l1      '+#13+
                    '                         where L1.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                    '                           and L1.operacao = 2) VALOR_DOC,'+#13+
                    '                       R.IDPLANOPREV, R.UNIDNEGOC, R.IDPATRO'+#13+
                    '                  FROM LANCTODOCUM LA, DOCUMENTO D,'+#13+

                    '                       (select ra.coddocumento, sum(ra.valor) AS VALOR, ra.unidnegoc, ra.idplanoprev, ra.idpatro '+#13+
                    '                          from RATEIODOCUM RA'+#13+
                    '                         where ra.coddocumento = '+FloatToStr(rCodDocumento) +#13+
                    '                         group by ra.coddocumento, ra.unidnegoc, ra.idplanoprev, ra.idpatro'+#13+
                    '                        ) R'+#13+

                    '                 WHERE D.CODDOCUMENTO = LA.CODDOCUMENTO         '+#13+
                    '                   AND R.CODDOCUMENTO = LA.CODDOCUMENTO         '+#13+
                    '                   AND LA.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                    '                   AND LA.OPERACAO = 4 '+#13+
                    '                 GROUP BY D.RECPAG, LA.DEBCRE, R.IDPLANOPREV, R.UNIDNEGOC, R.IDPATRO) A1    '+#13+
                    '         GROUP BY A1.IDPLANOPREV, A1.VALOR_DOC, A1.UNIDNEGOC, A1.IDPATRO '+#13+
                    '       ) A,    '+#13+

                    '       (SELECT sum (RA.VALOR) VLR_FINANC, RA.IDPLANOPREV, RA.UNIDNEGOC, RA.IDPATRO '+#13+
                    '          FROM RATEIOFINANC RA '+#13+
                    '         WHERE RA.CODLANCFINANC in (SELECT RE.CODLANCFINANC '+#13+
                    '                                      FROM RECBTOPAGTO RE '+#13+
                    '                                     WHERE RE.CODDOCUMENTO = '+FloatToStr(rCodDocumento);

                    { // Edilaine - SOL 222635-15558 / KTN 2056379
                    if rCodLancFinan > 0 then
                       sFiltro := sFiltro +
                                  '                                        OR RE.CODLANCFINANC = ' + IntToStr(Trunc(rCodLancFinan));
                    } // Edilaine - SOL 222635-15558 / KTN 2056379 - fim

  sFiltro.text := sFiltro.text +#13+
                  '                                    ) '+#13+
                  '         GROUP BY RA.IDPLANOPREV, RA.UNIDNEGOC, RA.IDPATRO ) F,'+#13+

                          // edilaine - SOL 237305 / PPM 483869 - inicio
                  '       (SELECT sum(LA.LACVALOR / 2) VLR_CONTAB_BAIXA_PARCIAL, LA.IDPLANOPREV, LA.UNIDNEGOC, LA.IDPATRO'+#13+
                  '          FROM LANCAMENTO LA   '+#13+
                  '         WHERE LA.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                  '           AND LA.PLNCODIGO IN (SELECT PLNCODIGO '+#13+
                  '                                  FROM LANCTODOCUM  '+#13+
                  '                                 WHERE CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                  '                                   AND OPERACAO = 5 ) ';

  if (bBaixaFinal) and (bPrimeiraBaixa) then
      sFiltro.text := sFiltro.text +#13+
                      '         AND LA.PLNCODIGO <> (SELECT MAX(PLNCODIGO) '+#13+
                      '                               FROM LANCTODOCUM  '+#13+
                      '                              WHERE CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                      '                                AND OPERACAO = 5) ';

  sFiltro.text := sFiltro.text +#13+
                  '         GROUP BY LA.IDPLANOPREV, LA.UNIDNEGOC, LA.IDPATRO  '+#13+
                  '       ) PARC, '+#13+
                          // edilaine - SOL 237305 / PPM 483869 - fim

                  '       (SELECT sum(LA.LACVALOR / 2) VLR_CONTABIL_BAIXA, LA.IDPLANOPREV, LA.UNIDNEGOC, LA.IDPATRO'+#13+
                  '          FROM LANCAMENTO LA'+#13+
                  '         WHERE LA.PLNCODIGO in (SELECT L.PLNCODIGO'+#13+
                  '                                  FROM LANCTODOCUM L    '+#13+
                  '                                 WHERE L.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                  '                                   AND L.OPERACAO = 5)  ';

   if (bBaixaFinal) and (bPrimeiraBaixa) then
      sFiltro.text := sFiltro.text +#13+
                      '                                   AND LA.PLNCODIGO <> (SELECT MAX(PLNCODIGO) '+#13+
                      '                                                         FROM LANCTODOCUM  '+#13+
                      '                                                        WHERE CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                      '                                                          AND OPERACAO = 5)';

   sFiltro.text := sFiltro.text +#13+
                   '         GROUP BY LA.IDPLANOPREV, LA.UNIDNEGOC, LA.IDPATRO  '+#13+
                   '       ) P     '+#13+
                   ' WHERE R.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +#13+
                   '   AND P.IDPLANOPREV(+) = R.IDPLANOPREV           '+#13+
                   '   AND F.IDPLANOPREV(+) = R.IDPLANOPREV '+#13+
                   '   AND A.IDPLANOPREV(+) = R.IDPLANOPREV           '+#13+
                   '   AND APLN.IDPLANOPREV(+) = R.IDPLANOPREV        '+#13+
                   '   AND PARC.IDPLANOPREV(+) = R.IDPLANOPREV        '+#13+  // edilaine - SOL 237305 / PPM 483869
                   '   AND P.UNIDNEGOC(+) = R.UNIDNEGOC  '+#13+
                   '   AND F.UNIDNEGOC(+) = R.UNIDNEGOC  '+#13+
                   '   AND A.UNIDNEGOC(+) = R.UNIDNEGOC  '+#13+
                   '   AND APLN.UNIDNEGOC(+) = R.UNIDNEGOC '+#13+
                   '   AND PARC.UNIDNEGOC(+) = R.UNIDNEGOC  '+#13+  // edilaine - SOL 237305 / PPM 483869
                   '   AND P.IDPATRO(+) = R.IDPATRO        '+#13+
                   '   AND F.IDPATRO(+) = R.IDPATRO        '+#13+
                   '   AND A.IDPATRO(+) = R.IDPATRO        '+#13+
                   '   AND APLN.IDPATRO(+) = R.IDPATRO     '+#13+
                   '   AND PARC.IDPATRO(+) = R.IDPATRO        '+#13+  // edilaine - SOL 237305 / PPM 483869
                   ' GROUP BY R.UNIDNEGOC,     '+#13+
                   '          R.IDPLANOPREV,   '+#13+
                   '          R.IDPATRO,       '+#13+
                   '          R.MAIORPLANO,     '+#13+ // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                   '          VLR_CONTABIL_BAIXA,'+#13+
                   '          VLR_CONTAB_BAIXA_PARCIAL, ' +#13+ // edilaine - SOL 237305 / PPM 483869
                   '          A.VLRALTERADOR,'+#13+
                   '          A.VALOR_DOC,'+#13+
                   '          R.VALOR,'+#13+
                   '          APLN.VLRALTERADOR,'+#13+
                   '          VLR_FINANC'+#13+
                   ' ORDER BY R.IDPLANOPREV       ' +#13+ // Edilaine Ferraresi/ Marcio Sanches Spinosa SOL 211487 KINTANA 2046190
                   ') X       '+#13;
{' GROUP BY x.UNIDNEGOC,   '+
'          x.IDPLANOPREV, '+
'          x.IDPATRO,     '+
'          X.VLR_CONTABIL_BAIXA, '+
'          x.VLR_FINANC ';
'          X.VLRACUM, '+
'          X.QTDALT, '+
'          X.QTDPLN, '+
'          X.ALTERADOR_MEDIA, '+
'          X.ALTERADOR_PLN  ';
}

{



   'SELECT R.CODDOCUMENTO, R.UNIDNEGOC, R.IDPLANOPREV, R.IDPATRO, '+
              '       SUM(R.VALOR) AS VALDOC, P.VLR_CONTABIL_BAIXA, VLR_FINANC, '+
//              '       ROUND((SUM(R.VALOR) / A.VALOR_DOC) * NVL(A.VLRALTERADOR,0),2) VLRALTERADOR, '+
//              '       NVL(A.VLRALTERADOR, 0) VLRALTERADOR,  '+
              '         DECODE(APLN.VLRALTERADOR, NULL, ROUND((R.VALOR / A.VALOR_DOC) * NVL(A.VLRALTERADOR,0),2), '+
              '                                   NVL(APLN.VLRALTERADOR, 0)) VLRALTERADOR, '+
              '       0 as VLRACUM '+
              '  FROM RATEIODOCUM R, '+

              '        (SELECT  DECODE(DC.RECPAG, ''R'', DECODE(DC.DEBCRE, ''D'', sum(LA.LACVALOR / 2), sum(LA.LACVALOR / 2)*-1), '+
              '                                          DECODE(DC.DEBCRE, ''C'', sum(LA.LACVALOR / 2), sum(LA.LACVALOR / 2)*-1) '+
              '                ) VLRALTERADOR, LA.IDPLANOPREV '+
              '           FROM LANCAMENTO LA, '+
              '                (SELECT L.PLNCODIGO, D.RECPAG, L.DEBCRE '+
              '                   FROM LANCTODOCUM L, DOCUMENTO D '+
              '                  WHERE D.CODDOCUMENTO = L.CODDOCUMENTO '+
              '                    AND L.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +
              '                    AND L.OPERACAO = 4 '+
              '                 ) DC  '+
              '           WHERE LA.PLNCODIGO = DC.PLNCODIGO '+
              '           GROUP BY DC.RECPAG,DC.DEBCRE, LA.IDPLANOPREV '+
              '        )  APLN, '+

              '       (SELECT SUM(A1.VLRALTERADOR) VLRALTERADOR, A1.IDPLANOPREV, A1.VALOR_DOC FROM ( '+
              '        SELECT DECODE(D.RECPAG, ''R'', DECODE(LA.DEBCRE, ''D'', sum(LA.VALOR ), sum(LA.VALOR)*-1), '+
              '                                        DECODE(LA.DEBCRE,''C'', sum(LA.VALOR),  sum(LA.VALOR)*-1)   '+
              '               ) VLRALTERADOR, '+
              '               (select l1.valor from lanctodocum l1 where L1.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +' and L1.operacao = 2) VALOR_DOC, '+
              '               R.IDPLANOPREV '+
              '          FROM LANCTODOCUM LA, DOCUMENTO D, RATEIODOCUM R '+
              '         WHERE D.CODDOCUMENTO = LA.CODDOCUMENTO '+
              '           AND R.CODDOCUMENTO = LA.CODDOCUMENTO '+
              '           AND LA.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +
              '           AND LA.OPERACAO = 4 '+
              '         GROUP BY D.RECPAG,LA.DEBCRE, R.IDPLANOPREV '+
              '        ) A1 '+
              '        GROUP BY A1.IDPLANOPREV,A1.VALOR_DOC '+
              '       ) A, '+

{
              '       (SELECT  DECODE(DC.RECPAG, ''R'', DECODE(DC.DEBCRE, ''D'', sum(LA.LACVALOR / 2), sum(LA.LACVALOR / 2)*-1), '+
              '                                         DECODE(DC.DEBCRE, ''C'', sum(LA.LACVALOR / 2), sum(LA.LACVALOR / 2)*-1)  '+
              '                      ) VLRALTERADOR, LA.IDPLANOPREV '+
              '            FROM LANCAMENTO LA, '+
              '                 (SELECT L.PLNCODIGO, D.RECPAG, L.DEBCRE '+
              '                    FROM LANCTODOCUM L, DOCUMENTO D '+
              '                   WHERE D.CODDOCUMENTO = L.CODDOCUMENTO '+
              '                     AND L.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +
              '                     AND L.OPERACAO = 4 '+
              '                 ) DC '+
              '           WHERE LA.PLNCODIGO = DC.PLNCODIGO '+
              '           GROUP BY DC.RECPAG,DC.DEBCRE, LA.IDPLANOPREV '+
              '       ) A, '+
}
{              '       (SELECT sum (RA.VALOR) VLR_FINANC, RA.IDPLANOPREV '+
              '          FROM RATEIOFINANC RA '+
              '         WHERE RA.CODLANCFINANC in (SELECT RE.CODLANCFINANC '+
              '                                      FROM RECBTOPAGTO RE '+
              '                                     WHERE RE.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +') '+
              '         GROUP BY RA.IDPLANOPREV ) F,'+
              '       (SELECT sum (LA.LACVALOR/2) VLR_CONTABIL_BAIXA, LA.IDPLANOPREV '+
              '          FROM LANCAMENTO LA '+
              '         WHERE LA.PLNCODIGO in (SELECT L.PLNCODIGO FROM LANCTODOCUM L '+
              '                                 WHERE L.CODDOCUMENTO = '+FloatToStr(rCodDocumento) +
              '                                   AND L.OPERACAO = 5 ';


   if (bBaixaFinal) and (bPrimeiraBaixa) then
      sFiltro := sFiltro +
              '                                   AND L.PLNCODIGO <> (SELECT MAX(PLNCODIGO) '+
              '                                                         FROM LANCTODOCUM  '+
              '                                                        WHERE CODDOCUMENTO = '+FloatToStr(rCodDocumento) +
              '                                                          AND OPERACAO = 5) ';
   sFiltro := sFiltro +
              '                                ) '+
              '         GROUP BY LA.IDPLANOPREV ) P '+
              ' WHERE R.CODDOCUMENTO = '+ FloatToStr(rCodDocumento) +
              '   AND P.IDPLANOPREV(+) = R.IDPLANOPREV '+
              '   AND F.IDPLANOPREV(+) = R.IDPLANOPREV '+
              '   AND A.IDPLANOPREV(+) = R.IDPLANOPREV '+
              '   AND APLN.IDPLANOPREV(+) = R.IDPLANOPREV '+
              ' GROUP BY R.CODDOCUMENTO,R.UNIDNEGOC, R.IDPLANOPREV, R.IDPATRO, '+
              '          P.VLR_CONTABIL_BAIXA, VLR_FINANC, A.VLRALTERADOR, A.VALOR_DOC, R.VALOR, APLN.VLRALTERADOR ';
              }

   //sFiltro.SaveToFile('c:\planus\temp\Rateiofinanceiro.sql');

   cdsValDoc.data := GetDataPacket( sFiltro.text );
   // Edilaine - SOL 124845-14262 / KTN 1977287 - fim

   try
      cdsAux:=TCMClientDataSet.Create(nil);
      cdsParamFinanc:=TCMClientDataSet.Create(nil);
      cdsRateioDocum:=TCMClientDataSet.Create(nil);
      try
         //sOPERACAO => 'FP' = Fluxo Previsto
         //             'MF' = Movimento Financeiro
         cdsParamFinanc.Data:=GetDataPacket('SELECT FLGSEPARADATA, TRDFINALCAR, TRDFINALCAP '+
                                            'FROM PARAMFINANC '+
                                            'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ');
         sPrev:='N';
         if (sOperacao='FP') then
          begin
             cdsAux.Data:=GetDataPacket('SELECT OPERACAO '+
                                        'FROM DOCUMENTO '+
                                        'WHERE (CODDOCUMENTO = '+FloatToStr(rCodDocumento)+') ');
             cdsAux.First;

             if (StrToIntDef(cdsAux.FieldByName('OPERACAO').AsString,0) >= 11) and
                (StrToIntDef(cdsAux.FieldByName('OPERACAO').AsString,0) <= 13) then sPrev:='S';
          end;

         cdsRateioDocum.Close;
         if (cdsParamFinanc.FieldByName('FLGSEPARADATA').AsString='S') or
            (cdsParamFinanc.FieldByName('FLGSEPARADATA').AsString = 'V') then
            cdsRateioDocum.Data:=GetDataPacket('SELECT ' +
                                               '   R.CODDOCUMENTO, R.CODTIPRECDES, '+
                                               '   R.RECPAG, R.IDPESSOA, R.CODCENTRORESPON, '+
                                               '   R.UNIDNEGOC, R.MOECODIGO, R.VALOR, '+
                                               '   R.VALOROUTRAMOEDA, R.IDRATEIODOCUM, R.IDEMPRESA, '+
                                               '   R.CODCENTROCUSTO, R.IDPLANOPREV, R.IDPATRO, '+
                                               'R.IDPROGRAMA, L.DATALANCTO,D.CodTipDoc, D.DATAPROGRAMADA '+
                                               'FROM '+
                                               '   RATEIODOCUM R, DOCUMENTO D, LANCTODOCUM L '+
                                               'WHERE (D.CODDOCUMENTO = '+
                                                      FloatToStr(rCodDocumento)+') AND '+
                                               '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                                               '      (D.CODDOCUMENTO = R.CODDOCUMENTO) AND '+
                                               '      (D.OPERACAO = L.OPERACAO) ' +
                                               'ORDER BY R.IDRATEIODOCUM') // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
         else
            cdsRateioDocum.Data:=GetDataPacket('SELECT '+
                                               '   R.CODDOCUMENTO,R.CODTIPRECDES,R.RECPAG,R.IDPESSOA, '+
                                               '   R.CODCENTRORESPON,R.UNIDNEGOC,R.MOECODIGO,R.VALOR, '+
                                               '   R.VALOROUTRAMOEDA,R.IDRATEIODOCUM,R.IDEMPRESA, '+
                                               '   R.CODCENTROCUSTO,R.IDPLANOPREV,R.IDPATRO,R.IDPROGRAMA, ' +
                                               '   D.CodTipDoc, D.DATAPROGRAMADA '+
                                               'FROM '+
                                               '   RATEIODOCUM R, DOCUMENTO D '+
                                               'WHERE (R.CODDOCUMENTO = '+
                                                       FloatToStr(rCodDocumento)+') AND '+
                                               '      (D.CODDOCUMENTO = R.CODDOCUMENTO) '+
                                               'ORDER BY R.IDRATEIODOCUM '); // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
         rTotGer   := 0;
         rUnidNegoc:= 0;
         if (((sEntradaSaida = 'E') and (sRecPag = 'P')) or
             ((sEntradaSaida = 'S') and (sRecPag = 'R'))) and
             (sOperacao <> 'MF') then
          begin
             rSaldoCorrente:=-rSaldoCorrente;
             rSaldoMoeda   :=-rSaldoMoeda;
          end;

         if (cdsParamFinanc.FieldByName('FLGSEPARADATA').AsString = 'S') or
            (cdsParamFinanc.FieldByName('FLGSEPARADATA').AsString = 'V') then
          begin
             iDigCAR:=Length(Trim(cdsParamFinanc.FieldByName('TRDFINALCAR').AsString));
             iDigCAP:=Length(Trim(cdsParamFinanc.FieldByName('TRDFINALCAP').AsString));
          end;

          // Edilaine - SOL 124845-14262 / KTN 1977287
          bArredonda5 := CtrlLancamento.VerificaSobraRateio(cdsRateioDocum, rSaldoCorrente, rSaldoMoeda,
                                                            rValorCotacao, rTotalDocGeral, rTotalDocOMGeral,
                                                            cdsRateioDocum.fieldbyname('VALOROUTRAMOEDA').asfloat, 'VALOR');


         cdsRateioDocum.First;
         sCodTipRecDes := cdsRateioDocum.FieldByName('CODTIPRECDES').asString;
         while not(cdsRateioDocum.Eof) do
         begin
            sCodTipRecDes:=cdsRateioDocum.fieldbyname('CODTIPRECDES').asString;
            iNumDig:=Length(Trim(sCodTipRecDes));

            if (cdsParamFinanc.FieldByName('FLGSEPARADATA').AsString='S') and
               (Copy(cdsRateioDocum.FieldByName('DATALANCTO').AsString,4,7)<>
                Copy(FormatDateTime('dd/mm/yyyy',dData),4,7)) then
             begin
                if (cdsRateioDocum.FieldByName('RECPAG').AsString='R') and
                   not(cdsParamFinanc.FieldByName('TRDFINALCAR').isNull) then
                 begin
                    iNumRef:=iNumDig-iDigCAR;
                    sCodTipRecDes:=Trim(Copy(sCodTipRecDes,1,iNumRef)+
                                             cdsParamFinanc.FieldByName('TRDFINALCAR').AsString);
                 end;

                if (cdsRateioDocum.FieldByName('RECPAG').asString = 'P') and
                   not(cdsParamFinanc.FieldByName('TRDFINALCAP').isNull) then
                 begin
                    iNumRef:=iNumDig-iDigCAP;
                    sCodTipRecDes:=Trim(Copy(sCodTipRecDes,1,iNumRef)+
                                             cdsParamFinanc.FieldByName('TRDFINALCAP').AsString);
                 end;

                cdsAux.Close;
                cdsAux.Data:=GetDataPacket('SELECT CODTIPRECDES '+
                                           'FROM TIPORECEBDESEMB '+
                                           'WHERE (RTRIM(CODTIPRECDES) = '''+sCodTipRecDes+''') AND '+
                                           '      (RECPAG = '''+cdsRateioDocum.FieldByName('RECPAG').asString+''') AND '+
                                           '      (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                           '      (ANASINT = ''A'')');
                if cdsAux.IsEmpty then
                   sCodTipRecDes:=cdsRateioDocum.FieldByName('CODTIPRECDES').asString;
             end;

            if (cdsParamFinanc.FieldByName('FLGSEPARADATA').AsString = 'V') and
               (dData<cdsRateioDocum.FieldByName('DATAPROGRAMADA').AsDateTime) then
             begin
                if (cdsRateioDocum.fieldbyname('RECPAG').asString = 'R') and
                   not(cdsParamFinanc.FieldByName('TRDFINALCAR').isNull) then
                 begin
                    iNumRef:=iNumDig-iDigCAR;
                    sCodTipRecDes:=Trim(Copy(sCodTipRecDes,1,iNumRef)+
                                             cdsParamFinanc.FieldByName('TRDFINALCAR').AsString);
                 end;

                if (cdsRateioDocum.fieldbyname('RECPAG').asString = 'P') and
                   not(cdsParamFinanc.FieldByName('TRDFINALCAP').isNull) then
                 begin
                    iNumRef:=iNumDig-iDigCAP;
                    sCodTipRecDes:=Trim(Copy(sCodTipRecDes,1,iNumRef)+
                                             cdsParamFinanc.FieldByName('TRDFINALCAP').AsString);
                 end;

                cdsAux.Close;
                cdsAux.Data:=GetDataPacket('SELECT CODTIPRECDES '+
                                           'FROM TIPORECEBDESEMB '+
                                           'WHERE (RTRIM(CODTIPRECDES) = '''+sCodTipRecDes+''') AND '+
                                           '      (RECPAG = '''+
                                                 cdsRateioDocum.fieldbyname('RECPAG').asString+''') AND '+
                                           '      (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                                           '      (ANASINT = ''A'')');
                if cdsAux.IsEmpty then
                   sCodTipRecDes:=cdsRateioDocum.fieldbyname('CODTIPRECDES').asString;
             end;

            rPropRateio:=0;
            if (rValorCotacao<>0) and (rTotalDocOMGeral<>0) and (rSaldoMoeda<>0) then
                rPropRateio:=(cdsRateioDocum.fieldbyname('VALOROUTRAMOEDA').asfloat/
                              rTotalDocOMGeral*rSaldoMoeda)*rValorCotacao
            else
               if (rTotalDocGeral<>0) then
                  // Eraldo Luis da Silva SOL 165317 KINTANA 1430837 INICIO
                  //rPropRateio:=cdsRateioDocum.fieldbyname('VALOR').asfloat/rTotalDocGeral*rSaldoCorrente;
                  rPropRateio:=(rSaldoCorrente*cdsRateioDocum.fieldbyname('VALOR').asfloat)/rTotalDocGeral;
                  // Eraldo Luis da Silva SOL 165317 KINTANA 1430837 FIM

            //Testa se é Fluxo Previsto
            if (sOperacao='FP') then
             begin
                cdsAux.Close;
                cdsAux.Data:=FazRateioAdm(sCodTipRecDes,cdsRateioDocum.FieldByName('RECPAG').AsString,
                                               cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                               cdsRateioDocum.FieldByName('IDPESSOA').AsFloat,rIDPlano);

                if not(cdsAux.IsEmpty) then
                 begin
                    cdsAux.First;
                    while not(cdsAux.Eof) do
                    begin
                       rPropRateioPerc:=rPropRateio*(cdsAux.FieldByName('PERCRATEIO').AsFloat/100);

                       // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
                       rPropRateioPerc := ArredondaRateio(rPropRateioPerc, bArredonda5); //StrToFloat(FormatFloat('#0.00',rPropRateioPerc));    // Edilaine - SOL 124845-14262 / KTN 1977287

                       rTotGer:=rTotGer+rPropRateioPerc;

                       if (rUnidNegoc=0) then
                          rUnidNegoc:=cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat;

                       Result:=GravaFluxoPrev(cdsRateioDocum.FieldByName('CODCENTRORESPON').AsString,
                                              sCodTipRecDes,cdsRateioDocum.FieldByName('RECPAG').AsString,
                                              sPrev,dData,cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                              rPropRateioPerc,
                                              cdsRateioDocum.FieldByName('CODCENTROCUSTO').AsString,
                                              rIDPessoa,cdsRateioDocum.FieldByName('IDPROGRAMA').AsFloat,
                                              cdsRateioDocum.FieldByName('IDPATRO').AsFloat,
                                              cdsRateioDocum.FieldByName('IDPLANOPREV').AsFloat,
                                              cdsRateioDocum.FieldByName('CODTIPDOC').AsFloat);

                       if not(Result) then Exit;

                       cdsAux.Next;
                    end;
                 end
                else
                 begin
                    // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
                    rPropRateio := ArredondaRateio(rPropRateio, bArredonda5); //StrToFloat(FormatFloat('#0.00',rPropRateio));    // Edilaine - SOL 124845-14262 / KTN 1977287

                    rTotGer:=rTotGer+rPropRateio;

                    if (rUnidNegoc=0) then
                        rUnidNegoc :=cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat;

                    Result:=GravaFluxoPrev(cdsRateioDocum.FieldByname('CODCENTRORESPON').AsString,
                                           sCodTipRecDes,cdsRateioDocum.FieldByName('RECPAG').AsString,
                                           sPrev,dData,cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                           rPropRateio,
                                           cdsRateioDocum.FieldByName('CODCENTROCUSTO').AsString,
                                           rIDPessoa,cdsRateioDocum.FieldByName('IDPROGRAMA').AsFloat,
                                           cdsRateioDocum.FieldByName('IDPATRO').AsFloat,
                                           cdsRateioDocum.fieldbyname('IDPLANOPREV').AsFloat,
                                           cdsRateioDocum.fieldbyname('CODTIPDOC').AsFloat);
                    if not(Result) then Exit;
                 end;
             end
            else
             begin
                //Corrige CodTipRecDes do CAPCAR
                Result:=ExecSQL('UPDATE RATEIODOCUM '+
                                'SET CODTIPRECDES = '''+sCodTipRecDes+''' '+
                                'WHERE (IDRATEIODOCUM = '+
                                    FloatToStr(cdsRateioDocum.FieldByName('IDRATEIODOCUM').AsFloat)+') ');
                if not(Result) then Exit;

                // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
                rPropRateio := ArredondaRateio(rPropRateio, bArredonda5); //StrToFloat(FormatFloat('#0.00',rPropRateio));    // Edilaine - SOL 124845-14262 / KTN 1977287

                rTotGer := rTotGer + rPropRateio;

                if (rUnidNegoc=0) then
                   rUnidNegoc:=cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat;

                Result:=LancaRateioFinanc(cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                          0,rIDPessoa,rCodPortador,rPropRateio,0,
                                          sCodTipRecDes,
                                          cdsRateioDocum.FieldByName('RECPAG').AsString,
                                          cdsRateioDocum.FieldByName('CODCENTRORESPON').AsString,
                                          dData,rCodLancFinan,
                                          cdsRateioDocum.FieldByName('CODCENTROCUSTO').AsString,
                                          cdsRateioDocum.FieldByName('IDPROGRAMA').AsFloat,
                                          cdsRateioDocum.FieldByName('IDPATRO').AsFloat,
                                          cdsRateioDocum.FieldByName('IDPLANOPREV').AsFloat,
                                          cdsRateioDocum.FieldByName('CODTIPDOC').AsFloat,
                                          rIDPlano);
                if not(Result) then Exit;
             end;

             // Edilaine - SOL 124845-14262 / KTN 1977287
             // acumulando valor para verificar eventuais divergencias com o contabil
             if cdsValDoc.Locate('UNIDNEGOC;IDPLANOPREV',VarArrayOf([cdsRateioDocum.FieldByName('UNIDNEGOC').AsInteger,cdsRateioDocum.FieldByName('IDPLANOPREV').AsInteger]), [loPartialKey]) then
             begin
               cdsValDoc.edit;
               if (sOperacao='FP') then
                  cdsValDoc.FieldByName('VLRACUM').asCurrency := cdsValDoc.FieldByName('VLRACUM').asCurrency + rPropRateioPerc
               else
                  cdsValDoc.FieldByName('VLRACUM').asCurrency := cdsValDoc.FieldByName('VLRACUM').asCurrency + rPropRateio;
               cdsValDoc.Post;
             end;
             // Edilaine - SOL 124845-14262 / KTN 1977287 - fim

            cdsRateioDocum.Next;
         end;

         rPropRateio    := 0;
         // Edilaine - SOL 124845-14262 / KTN 1977287 - comentado
         {
         if (rValorCotacao<>0) and (rTotalDocOMGeral<>0) and (rSaldoMoeda<>0) then
          begin
             if (rTotGer <> rSaldoMoeda) then
               rPropRateio := StrToFloat(FloatToStr(rSaldoMoeda)) - StrToFloat(FloatToStr(rTotGer));
          end
         else
          if (rTotGer <> rSaldoCorrente) then
             rPropRateio := StrToFloat(FloatToStr(rSaldoCorrente)) - StrToFloat(FloatToStr(rTotGer));
         }// Edilaine - SOL 124845-14262 / KTN 1977287 - fim



         //if ((rPropRateio <> 0) and (not cdsRateioDocum.IsEmpty)) then   // Edilaine - SOL 124845-14262 / KTN 1977287 - comentado
         if (not cdsValDoc.isEmpty) and (self.bFlgExecutaAcertoDifCentavos) then
         begin
           // Edilaine - SOL 124845-14262 / KTN 1977287
           cdsValDoc.first;
           while (not cdsValDoc.eof) do
           begin
             if bBaixaFinal then
                rPropRateio := cdsValDoc.FieldByName('VALDOC').AsCurrency + cdsValDoc.FieldByName('VLRALTERADOR').AsCurrency -
                               //(cdsValDoc.FieldByName('VLRACUM').AsCurrency + cdsValDoc.FieldByName('VLR_CONTABIL_BAIXA').AsCurrency -        // edilaine - SOL 237305 / PPM 483869 - comentado
                               (cdsValDoc.FieldByName('VLRACUM').AsCurrency + cdsValDoc.FieldByName('VLR_CONTAB_BAIXA_PARCIAL').AsCurrency -    // edilaine - SOL 237305 / PPM 483869
                               (cdsValDoc.FieldByName('VLR_CONTABIL_BAIXA').AsCurrency - cdsValDoc.FieldByName('VLR_FINANC').AsCurrency))

             // Edilaine Ferraresi - SOL 221860 / KTN 2054992
             else if cdsValDoc.FieldByName('VLR_CONTABIL_BAIXA').AsCurrency = 0 then
                rPropRateio := cdsValDoc.FieldByName('VALDOC').AsCurrency + cdsValDoc.FieldByName('VLRALTERADOR').AsCurrency - cdsValDoc.FieldByName('VLRACUM').AsCurrency

             else
                rPropRateio := cdsValDoc.FieldByName('VLR_CONTABIL_BAIXA').AsCurrency - (cdsValDoc.FieldByName('VLR_FINANC').AsCurrency + cdsValDoc.FieldByName('VLRACUM').AsCurrency);

             rPropRateio := RoundCM(rPropRateio,2);

             if rPropRateio <> 0 then
             begin
               cdsRateioDocum.Filtered := false;
               //cdsRateioDocum.Filter   := 'IDPLANOPREV = '+cdsValDoc.FieldByName('IDPLANOPREV').AsString +' AND VALOR > 0';   //edilaine SIG101374
               cdsRateioDocum.Filter   := 'IDPLANOPREV = '+cdsValDoc.FieldByName('IDPLANOPREV').AsString +' AND VALOR <> 0';    //edilaine SIG101374
               cdsRateioDocum.Filtered := true;

               //cdsRateioDocum.First;   // Edilaine - SOL 124845-14262 / KTN 1977287 - comentado

               if not cdsRateioDocum.IsEmpty then //Everson Cunha - SIG78944
                 if sOperacao = 'FP' then
                   Result:=GravaFluxoPrev(cdsRateioDocum.FieldByName('CODCENTRORESPON').AsString,
                                          sCodTipRecDes,
                                          cdsRateioDocum.FieldByName('RECPAG').AsString,
                                          sPrev,dData,rUnidNegoc,rPropRateio,
                                          cdsRateioDocum.FieldByName('CODCENTROCUSTO').AsString,
                                          rIDPessoa,cdsRateioDocum.FieldByName('IDPROGRAMA').AsFloat,
                                          cdsRateioDocum.FieldByName('IDPATRO').AsFloat,
                                          cdsRateioDocum.fieldbyname('IDPLANOPREV').AsFloat,
                                          cdsRateioDocum.fieldbyname('CODTIPDOC').AsFloat)
                 else
                   Result:=LancaRateioFinanc(cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                             0,rIDPessoa,rCodPortador,rPropRateio,0,
                                             cdsRateioDocum.FieldByName('CODTIPRECDES').asString,
                                             cdsRateioDocum.FieldByName('RECPAG').AsString,
                                             cdsRateioDocum.FieldByName('CODCENTRORESPON').AsString,
                                             dData,rCodLancFinan,
                                             cdsRateioDocum.FieldByName('CODCENTROCUSTO').AsString,
                                             cdsRateioDocum.FieldByName('IDPROGRAMA').AsFloat,
                                             cdsRateioDocum.FieldByName('IDPATRO').AsFloat,
                                             cdsRateioDocum.FieldByName('IDPLANOPREV').AsFloat,
                                             cdsRateioDocum.FieldByName('CODTIPDOC').AsFloat,
                                             rIDPlano);


             end;
             cdsValDoc.next;
           end;
         end;


      finally
         //26/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"

         cdsAux.Close;
         cdsParamFinanc.Close;
         cdsRateioDocum.Close;

         cdsValDoc.Close;   // Edilaine - SOL 124845-14262 / KTN 1977287
         cdsValDoc.Free;    // Edilaine - SOL 124845-14262 / KTN 1977287

         cdsAux.Free;
         cdsParamFinanc.Free;
         cdsRateioDocum.Free;
         FreeAndNil(sFiltro);    //edilaine SIG86978
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
         if (cdsParamFinanc<>nil) then cdsParamFinanc.Free;
         if (cdsRateioDocum<>nil) then cdsRateioDocum.Free;
      end;
   end;
end;




function TCtrlFinanc.ConciliaConta(rCodPortador: Double; dDataExtrato: TDateTime): Boolean;
var
  sSql: String;
begin
   Result:=True;
   MessageInfo:='';

   sSql :='UPDATE MOVIMFINANC SET STATUSCONCILIA = ''X'', '+
          '                       DATACONCILIACAO = TO_DATE('''+
                                     FormatDateTime('dd/mm/yyyy',dDataExtrato)+''',''dd/mm/YYYY'')'+
          'WHERE (STATUSCONCILIA = ''P'') AND (CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

   if not(ExecSQL(sSql)) then Result:=False;
end;



function TCtrlFinanc.ExcluiFinanceiro(rCodLancFinanc: Double): Boolean;
var
   sSql: String;
   cdsAux : TCMClientDataSet;
   rCodLancTransf : Double;
   rPlnCodigo     : Double;
begin
   Result:=True;
   MessageInfo:='';
   try
      cdsAux:=TCMClientDataSet.Create(nil);
      try
         cdsAux.Data:=GetDataPacket('SELECT PLNCODIGO,CODLANCTRANSF,DATALANCFINAN '+
                                    'FROM MOVIMFINANC '+
                                    'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') ');

         rCodLancTransf:=cdsAux.FieldByName('CODLANCTRANSF').AsFloat;
         rPlnCodigo:=cdsAux.FieldByName('PLNCODIGO').AsFloat;

         //========================================================================
         if (rCodLancTransf<>0) then
          begin

             ExecSQL('DELETE IMPOSTORETIDO '+ 'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancTransf)+') ');

             ExecSQL('DELETE IMPOSTORETIDO '+ 'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') ');

             sSql:= 'DELETE FROM RATEIOFINANC '+
                    'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') OR '+
                    '      (CODLANCFINANC = '+FloatToStr(rCodLancTransf)+') ';

             if ExecSQL(sSql) then //Exclui Rateio
              begin
                 sSql:= 'DELETE FROM RELACIONANI '+
                        'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') OR '+
                        '      (CODLANCFINANC = '+FloatToStr(rCodLancTransf)+') ';

                 if not(ExecSQL(sSql)) then //Exclui Movimento
                  begin
                     Result:=False;
                     Exit;
                  end;

                 sSql:= 'DELETE FROM MOVIMFINANC '+
                        'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') OR '+
                        '      (CODLANCFINANC = '+FloatToStr(rCodLancTransf)+') ';

                 if not(ExecSQL(sSql)) then //Exclui Movimento
                  begin
                     Result:=False;
                     Exit;
                  end;
              end
             else
              begin
                 Result:=False;
                 Exit;
              end;
          end
         else  //------------------------------------------------------------------
          begin
             sSql:= 'DELETE FROM RATEIOFINANC '+
                    'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') ';

             if ExecSQL(sSql) then //Exclui Rateio
              begin
                 sSql := 'DELETE FROM RELACIONANI '+
                         'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') ';
                 if not(ExecSQL(sSql)) then //Exclui Movimento
                  begin
                     Result:=False;
                     Exit;
                  end;

                 sSql := 'DELETE FROM MOVIMFINANC '+
                         'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') ';

                 if not(ExecSQL(sSql)) then //Exclui Movimento
                  begin
                     Result:=False;
                     Exit;
                  end;
              end
             else
              begin
                 Result:=False;
                 Exit;
              end;
          end;
         //========================================================================

         if (rPlnCodigo<>0) then
          begin
             //Exclui/Estorno contab
             Result:=CtrlLancamento.ExcluiLancaContab(F_rIDUsuario,rPlnCodigo,F_rIDModulo,0,
                                                      F_bUsaPlanoPatro,True);
             if not(Result) then
              begin
                 MessageInfo:=CtrlLancamento.MessageInfo;
                 Exit;
              end;
          end;

      finally
         cdsAux.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
         cdsAux.Free;
      end;
   except
      on E:Exception do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;



function TCtrlFinanc.LancaFinanceiro(DadosContabeis: OleVariant; rIDModulo,
  rHistPad, rMoeCodigo, rIDUsuario, rCodPortador, rIDPessoa, rValorCorrente,
  rValorOutraMoeda: Double; dDataLanc, dDataConcilia, dDataDisp: TDateTime;
  sNumDocum, sEntradaSaida, sHistorico, sStatusConcilia: string;
  var rCodLancFinanc, rPlnCodigo: Double;  rIDPlano: Double; bIntegraContabil,
  bEstorno: boolean
  ): Boolean;
var
   rValorCotacao    : Double;
   rMoeCodigoAux    : Double;
begin
   MessageInfo:='';
   try
      rMoeCodigoAux:=0;
      if not(CtrlGeralFinanc.TestaPortadorAtivo(rIDPessoa,rCodPortador,rMoeCodigoAux)) then
       begin
          Result:=False;
          MessageInfo:=CtrlGeralFinanc.MessageInfo;
          Exit;
       end;

      if (rValorOutraMoeda=0) and (rMoeCodigoAux<>0) then
       begin
          if CtrlGeralFinanc.TestaCotacaoMoeda(rMoeCodigoAux,dDataLanc,True,rValorCotacao) then
           begin
              rMoeCodigo:=rMoeCodigoAux;
              rValorOutraMoeda:=rValorCorrente/rValorCotacao;
           end
          else
           begin
              Result:=False;
              MessageInfo:=CtrlGeralFinanc.MessageInfo;
              Exit;
           end;
       end;

      Result:=IncluiContabilidade(DadosContabeis,dDataLanc,rIDModulo,rIDPessoa,rIDUsuario,rPlnCodigo,
                                  rIDPlano,bIntegraContabil);

      if not(Result) then Exit;

      if rCodLancFinanc > 0 then begin   // carregar os atributos antes da alteração
        FDbMovimFinanc.Codlancfinanc.AsFloat := rCodLancFinanc;
        FDbMovimFinanc.LoadFromDb;

        if bEstorno then
           FDbMovimFinanc.FlgEstornado.AsString := 'S';

        FDbMovimFinanc.Valorlancfinan.AsFloat:=FDbMovimFinanc.Valorlancfinan.AsFloat + rValorCorrente;
        FDbMovimFinanc.Valoroutramoeda.AsFloat:=FDbMovimFinanc.Valoroutramoeda.AsFloat+rValorOutraMoeda;
        Result:=FDbMovimFinanc.Update;
      end else begin   // senão insere um novo lançamento no financeiro


        //Carrega campos da MovimFinanc
        FDbMovimFinanc.Idmodulo.AsFloat           := rIDModulo;
        FDbMovimFinanc.Histpadfinan.AsFloat       := rHistPad;
        FDbMovimFinanc.Moecodigo.AsFloat          := rMoeCodigo;
        FDbMovimFinanc.Plncodigo.AsFloat          := rPlnCodigo;
        FDbMovimFinanc.Idusuarioinclusao.AsFloat  := rIDUsuario;
        FDbMovimFinanc.Codportador.AsFloat        := rCodPortador;
        FDbMovimFinanc.Idpessoa.AsFloat           := rIDPessoa;
        FDbMovimFinanc.Valorlancfinan.AsFloat     := rValorCorrente;
        FDbMovimFinanc.Valoroutramoeda.AsFloat    := rValorOutraMoeda;
        FDbMovimFinanc.Numchqbordero.AsString     := Trim(sNumDocum);
        FDbMovimFinanc.Datalancfinan.AsDateTime   := dDataLanc;
        FDbMovimFinanc.Dataconciliacao.AsDateTime := dDataConcilia;
        FDbMovimFinanc.Entradasaida.AsString      := sEntradaSaida;

        if bEstorno then
           FDbMovimFinanc.FlgEstornado.AsString := 'S';

        if Length(Trim(sHistorico))>60 then
           FDbMovimFinanc.Historico.AsString:=Copy(sHistorico,1,60)
        else
           FDbMovimFinanc.Historico.AsString:=sHistorico;

        FDbMovimFinanc.Statusconcilia.AsString:=sStatusConcilia;
        FDbMovimFinanc.Datadispfinanc.AsDateTime:=dDataDisp;
        Result:=FDbMovimFinanc.Insert;
      end;

      if not(Result) then
       begin
          MessageInfo:=FDbMovimFinanc.MessageInfo;
          Exit;
       end;

      rCodLancFinanc:=FDbMovimFinanc.Codlancfinanc.AsFloat;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlFinanc.AlteraFinanceiro(DadosContabeis: OleVariant; rHistPad, rIDModulo,
  rMoeCodigo, rIDUsuario, rCodPortador, rIDPessoa, rValorCorrente,
  rValorOutraMoeda: Double; dDataLanc, dDataConcilia: TDateTime; sNumDocum,
  sEntradaSaida, sHistorico, sStatusConcilia: string;
  var rPlnCodigo: Double; rCodLancFinanc, rIDPlano: Double;
  bIntegraContabil: Boolean): Boolean;
var
   rMoeCodigoAux  : Double;
   rPlnCodigoAux  : Double;
   rValorCotacao  : Double;
   cdsContabil    : TCMClientDataSet;
begin
   MessageInfo:='';
   cdsContabil:=TCMClientDataSet.Create(nil);
   try
      try
         // Guarda Código da Planilha
         rPlnCodigoAux:=rPlnCodigo;

         //Testa se o portador está ativo
         rMoeCodigoAux:=0;
         if not(CtrlGeralFinanc.TestaPortadorAtivo(rIDPessoa,rCodPortador,rMoeCodigoAux)) then
          begin
             Result:=False;
             MessageInfo:=CtrlGeralFinanc.MessageInfo;
             Exit;
          end;

         if (rValorOutraMoeda=0) and (rMoeCodigoAux<>0) then
          begin
             if CtrlGeralFinanc.TestaCotacaoMoeda(rMoeCodigoAux,dDataLanc,True,rValorCotacao) then
              begin
                 rMoeCodigo:=rMoeCodigoAux;
                 rValorOutraMoeda:=rValorCorrente/rValorCotacao;
              end
             else
              begin
                 Result:=False;
                 MessageInfo:=CtrlGeralFinanc.MessageInfo;
                 Exit;
              end;
          end;

         //Cria uma nova planilha e inclui lançamentos
         rPlnCodigo:=0;
         Result:=IncluiContabilidade(DadosContabeis,dDataLanc,rIDModulo,rIDPessoa,rIDUsuario,rPlnCodigo,
                                     rIDPlano,bIntegraContabil);
         if not(Result) then Exit;

         //Posiciona no Lancamento da MovimFinanc
         FDbMovimFinanc.Codlancfinanc.AsFloat:=rCodLancFinanc;
         FDbMovimFinanc.LoadFromDb;

         //Carrega campos da MovimFinanc
         FDbMovimFinanc.Histpadfinan.AsFloat:=rHistPad;
         FDbMovimFinanc.Moecodigo.AsFloat:=rMoeCodigo;
         FDbMovimFinanc.Plncodigo.AsFloat:=rPlnCodigo;
         FDbMovimFinanc.Idusuarioinclusao.AsFloat:=rIDUsuario;
         FDbMovimFinanc.Codportador.AsFloat:=rCodPortador;
         FDbMovimFinanc.Idpessoa.AsFloat:=rIDPessoa;
         FDbMovimFinanc.Valorlancfinan.AsFloat:=rValorCorrente;
         FDbMovimFinanc.Valoroutramoeda.AsFloat:=rValorOutraMoeda;
         FDbMovimFinanc.Numchqbordero.AsString:=Trim(sNumDocum);
         FDbMovimFinanc.Datalancfinan.AsDateTime:=dDataLanc;
         FDbMovimFinanc.Dataconciliacao.AsDateTime:=dDataConcilia;
         FDbMovimFinanc.Entradasaida.AsString:=sEntradaSaida;

         if Length(Trim(sHistorico))>60 then
            FDbMovimFinanc.Historico.AsString:=Copy(sHistorico,1,60)
         else
            FDbMovimFinanc.Historico.AsString:=sHistorico;

         FDbMovimFinanc.Statusconcilia.AsString:=sStatusConcilia;

         //Altera MovimFinanc
         Result:=FDbMovimFinanc.Update;
         if not(Result) then
          begin
              MessageInfo:=FDbMovimFinanc.MessageInfo;
              Exit;
          end;

         //Exclui a Planilha Antiga e seus Lancamentos
         if (rPlnCodigoAux<>0) then
          begin
             Result:=CtrlLancamento.ExcluiLancaContab(rIDUsuario,rPlnCodigoAux,rIDModulo,0,
                                                      F_bUsaPlanoPatro,True);
             if not(Result) then
              begin
                  MessageInfo:=CtrlLancamento.MessageInfo;
                  Exit;
              end;
          end;

      finally
         cdsContabil.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;



function TCtrlFinanc.LancaRateioFinanc(rUnidNegoc, rMoeCodigo,
  rIDPessoa, rCodPortador, rValorCorrente, rValorOutraMoeda: Double;
  sCodTipRecDes, sRecPag, sCodCentroRespon: string; dDataLanc: TDateTime;
  rCodLancFinanc: Double; sCodCentroCusto: string; rIDPrograma, rIDPatro,
  rIDPlanoPrev, rCodTipDoc, rIDPlano: Double;
  const iIdSegregaCriter: Integer;
  const bSegregaOrigem: Boolean): Boolean;
var
   cdsAux : TCMClientDataSet;
   rValorCotacao    : Double;
   rMoeCodigoAux    : Double;
   rTotGer          : Double;
   rTotOMGer        : Double;
   rValorRateio     : Double;
   rValorOMRateio   : Double;

   //***************************************************************************
   // gerar o rateio da rateio docum na origem (Segregação Virtual na Origem)
   //***************************************************************************
   function SegregaRateioFinancOrigem: boolean;
   var bSegregaLanctoOrigem: boolean;
   begin
     Result := false;  // caso o result seja true o lançamento foi interceptado

     bSegregaLanctoOrigem := (rIDPlanoPrev = CtrlSegregacao.PlanoPrevComum) and
                             (rIDPatro     = CtrlSegregacao.PatroComum) and
                             (CtrlSegregacao.SegregaOrComum) and
                             (iIdSegregaCriter > 0);

     if (not bSegregaLanctoOrigem) and (CtrlSegregacao.PlanoPrevAdm > 0) then
       bSegregaLanctoOrigem := (rIDPlanoPrev = CtrlSegregacao.PlanoPrevAdm) and
                               (rIDPatro     = CtrlSegregacao.PatroComum) and
                               (CtrlSegregacao.SegregaOrAdm) and
                               (iIdSegregaCriter > 0);

     if bSegregaLanctoOrigem then begin

       if not CtrlSegregacao.RateiaValor(rValorCorrente, iIdSegregaCriter, dDataLanc) then
         raise exception.create (CtrlSegregacao.MessageInfo);

       // fazer o rateio aqui;
       CtrlSegregacao.CdsRateio.first;
       while not CtrlSegregacao.CdsRateio.eof do begin

       if not LancaRateioFinanc(rUnidNegoc, rMoeCodigo,
           rIDPessoa, rCodPortador,
           CtrlSegregacao.CdsRateio.FieldByName('VALOR').AsFloat, 0,
           sCodTipRecDes, sRecPag, sCodCentroRespon, dDataLanc,
           rCodLancFinanc, sCodCentroCusto, rIDPrograma,
           CtrlSegregacao.CdsRateio.FieldByName('IDPATRO').AsInteger,
           CtrlSegregacao.CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
           rCodTipDoc, rIDPlano, iIdSegregaCriter, false) then
         raise exception.Create (MessageInfo);

         CtrlSegregacao.CdsRateio.next;
         Result := true;
       end;
     end;
   end;

begin
   Result:=True;
   MessageInfo:='';

   cdsAux:=TCMClientDataSet.Create(nil);

   try
      try
         rMoeCodigoAux:=0;
         if not(CtrlGeralFinanc.TestaPortadorAtivo(rIDPessoa,rCodPortador,rMoeCodigoAux)) then
          begin
             Result:=False;
             MessageInfo:=CtrlGeralFinanc.MessageInfo;
             Exit;
          end;

         if (rValorOutraMoeda=0) and (rMoeCodigoAux<>0) then
          begin
             if CtrlGeralFinanc.TestaCotacaoMoeda(rMoeCodigoAux,dDataLanc,True,rValorCotacao) then
              begin
                 rMoeCodigo:=rMoeCodigoAux;
                 rValorOutraMoeda:=rValorCorrente/rValorCotacao;
              end
             else
              begin
                 Result:=False;
                 MessageInfo:=CtrlGeralFinanc.MessageInfo;
                 Exit;
              end;
          end;

         if not CtrlSegregacao.Active then
           CtrlSegregacao.GetParams(trunc(rIdPessoa));
         if (CtrlSegregacao.SegregaVirtual) and (bSegregaOrigem) then begin
           if SegregaRateioFinancOrigem then exit; // o lançamento foi intercepatado pela segregação e já foi feito
         end;

         cdsAux.Data:=FazRateioAdm(sCodTipRecDes,sRecPag,rUnidNegoc,rIDPessoa,rIDPlano);

         if not(cdsAux.IsEmpty) then
          begin
             rTotGer:=0;
             rTotOMGer:=0;
             cdsAux.First;
             while not(cdsAux.Eof) do
             begin
                rValorRateio:=rValorCorrente*(cdsAux.FieldByName('PERCRATEIO').AsFloat/100);

                //Acerta casas decimais
                // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
                rValorRateio := ArredondaRateio(rValorRateio); //StrToFloat(FormatFloat('#0.00',rValorRateio));

                //Adiciona valor ao total
                rTotGer:=rTotGer+rValorRateio;

                rValorOMRateio:=rValorOutraMoeda*(cdsAux.FieldByName('PERCRATEIO').AsFloat/100);
                //Acerta casas decimais
                // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
                rValorOMRateio := ArredondaRateio(rValorOMRateio); //StrToFloat(FormatFloat('#0.00',rValorOMRateio));

                //Adiciona valor da outra moeda ao total de outra moeda
                rTotOMGer:=rTotOMGer+rValorOMRateio;

                Result:= LancaRatFinRateio(cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                           rMoeCodigo,rIDPessoa,rCodPortador,
                                           rValorRateio,rValorOMRateio,sCodTipRecDes,
                                           sRecPag,sCodCentroRespon,
                                           rCodLancFinanc,sCodCentroCusto,
                                           rIDPrograma,rIDPatro,rIDPlanoPrev,
                                           rCodTipDoc,
                                           iIdSegregaCriter);

                if not(Result) then Exit;

                cdsAux.Next;
             end;

            //Gera lançamento de diferença, caso exista
            if (rTotGer <> rValorCorrente) or (rTotOMGer <> rValorOutraMoeda) then
             begin
                 // Alterado por FHBS - SOL: 124845/2201 KTN: 902943
                 rValorRateio  := StrToFloat(FloatToStr(rValorCorrente))   - StrToFloat(FloatToStr(rTotGer));
                 rValorOMRateio:= StrToFloat(FloatToStr(rValorOutraMoeda)) - StrToFloat(FloatToStr(rTotOMGer));

                 cdsAux.First;

                 Result:=LancaRatFinRateio(cdsAux.FieldByName('UNIDNEGOC').AsInteger,
                                           rMoeCodigo,rIDPessoa,rCodPortador,
                                           rValorRateio,rValorOMRateio,sCodTipRecDes,
                                           sRecPag,sCodCentroRespon,
                                           rCodLancFinanc,sCodCentroCusto,
                                           rIDPrograma,rIDPatro,rIDPlanoPrev,
                                           rCodTipDoc,
                                           iIdSegregaCriter);

                 if not(Result) then Exit;
             end;
          end
         else
          begin
             Result:= LancaRatFinRateio(rUnidNegoc,rMoeCodigo,rIDPessoa,rCodPortador,
                                        rValorCorrente,rValorOutraMoeda,sCodTipRecDes,
                                        sRecPag,sCodCentroRespon,
                                        rCodLancFinanc,sCodCentroCusto,
                                        rIDPrograma,rIDPatro,rIDPlanoPrev,
                                        rCodTipDoc,
                                        iIdSegregaCriter);

             if not(Result) then Exit;
          end;
      finally
         cdsAux.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlFinanc.LancaRatFinRateio(rUnidNegoc, rMoeCodigo,
  rIDPessoa, rCodPortador, rValorCorrente, rValorOutraMoeda: Double;
  sCodTipRecDes, sRecPag, sCodCentroRespon: String;
  rCodLancFinanc: Double; sCodCentroCusto: String; rIDPrograma, rIDPatro,
  rIDPlanoPrev, rCodTipDoc: Double;
  const iIdSegregaCriter: integer): Boolean;
var
   sSql: String;
   cdsAux  : TCMClientDataSet;
begin
   MessageInfo:='';

   try
      cdsAux:=TCMClientDataSet.Create(nil);
      try
         sSql:='SELECT '+
               '   IDRATEIOFINANC, '+
               '   VALOR, '+
               '   VALOROUTRAMOEDA '+
               'FROM RATEIOFINANC '+
               'WHERE '+
               '   (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
               '   (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+')  AND '+
               '   (CODCENTRORESPON = '''+sCodCentroRespon+''') AND '+
               '   (UNIDNEGOC = '+FloatToStr(rUnidNegoc)+') AND '+
               '   (CODTIPRECDES = '''+sCodTipRecDes+''') AND '+
               '   (RECPAG = '''+sRecPag+''') ';

         if sCodCentroCusto = '' then
            sSql:=sSql+' AND (CODCENTROCUSTO IS NULL) '
         else
            sSql:=sSql+' AND (CODCENTROCUSTO = '''+sCodCentroCusto+''') ';

         if rCodTipDoc <= 0 then
            sSql:=sSql+' AND (CODTIPDOC IS NULL) '
         else
            sSql:=sSql+' AND (CODTIPDOC = '+FloatToStr(rCodTipDoc)+') ';

         if F_bUsaPlanoPatro then
          begin
             if (rIDPatro > 0) and (rIDPlanoPrev > 0) then
              begin
                 sSql:=sSql+' AND (IDPATRO = '+FloatToStr(rIDPatro)+') '+
                            ' AND (IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

                 if (rIDPrograma > 0) then
                    sSql:=sSql+' AND (IDPROGRAMA = '+FloatToStr(rIDPrograma)+') '
                 else
                    sSql:=sSql+' AND (IDPROGRAMA IS NULL) ';
              end;
          end;

         cdsAux.Data:=GetDataPacket(sSql);

         if cdsAux.IsEmpty then
          begin
             //Carrega Campos da Rateio Financ com os Valores

             if iIdSegregaCriter = -1 then
               FDbRateioFinanc.Idsegregacriter.Clear
             else
               FDbRateioFinanc.Idsegregacriter.AsInteger := iIdSegregaCriter;

             FDbRateioFinanc.Codlancfinanc.AsFloat:=rCodLancFinanc;
             FDbRateioFinanc.Moecodigo.AsFloat:=rMoeCodigo;
             FDbRateioFinanc.Idpessoa.AsFloat:=rIDPessoa;
             FDbRateioFinanc.Valor.AsFloat:=rValorCorrente;
             FDbRateioFinanc.Valoroutramoeda.AsFloat:=rValorOutraMoeda;
             FDbRateioFinanc.Unidnegoc.AsFloat:=rUnidNegoc;
             FDbRateioFinanc.Codtiprecdes.AsString:=sCodTipRecDes;
             FDbRateioFinanc.Recpag.AsString:=sRecPag;
             FDbRateioFinanc.Codcentrorespon.AsString:=sCodCentroRespon;

             if (Trim(sCodCentroRespon)<>'') then
                FDbRateioFinanc.Idempresa.AsFloat:=rIDPessoa
             else
                FDbRateioFinanc.Idempresa.Clear;

             FDbRateioFinanc.Codcentrocusto.AsString:=sCodCentroCusto;
             FDbRateioFinanc.Idprograma.AsFloat:=rIDPrograma;
             FDbRateioFinanc.Idpatro.AsFloat:=rIDPatro;
             FDbRateioFinanc.Idplanoprev.AsFloat:=rIDPlanoPrev;
             FDbRateioFinanc.Codtipdoc.AsFloat:=rCodTipDoc;

             if (F_bUsaPlanoPatro) and ((rIDPlanoPrev<=0) or (rIDPatro<=0)) then
              begin
                 Result:=False;
                 MessageInfo:='Plano Previdenciário e/ou Patrocinador não'+#10+#13+
                              'foram informados.';
                 Exit;
              end;

             Result:=FDbRateioFinanc.Insert;
             if not(Result) then
              begin
                 MessageInfo:=FDbRateioFinanc.MessageInfo;
                 Exit;
              end;
          end
         else
          begin
             sSql:='UPDATE RATEIOFINANC '+
                   'SET VALOR = '+
                         CtrlGeralFinanc.ConvNumOracle(rValorCorrente+
                                                       cdsAux.FieldByName('VALOR').AsFloat)+' , '+
                   '    VALOROUTRAMOEDA = '+
                         CtrlGeralFinanc.ConvNumOracle(rValorOutraMoeda+
                                                       cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat)+
                   ' WHERE (IDRATEIOFINANC = '+
                            FloatToStr(cdsAux.FieldByName('IDRATEIOFINANC').AsFloat)+') ';

             Result:=ExecSQL(sSql);
          end;
      finally
         cdsAux.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;



function TCtrlFinanc.IncluiContabilidade(DadosContabeis: OleVariant;
  dDataLanc: TDateTime; rIDModulo, rIDPessoa, rIDUsuario: Double;
  var rPlnCodigo: Double; rIDPlano: Double; bIntegraContabil: Boolean): Boolean;
var
   cdsAux       : TCMClientDataSet;
   cdsContabAux : TCMClientDataSet;
   sCCustDeb,sCCustCre,sContaCre,sContaDeb : String;
   bPartidaDobrada  : Boolean;
   rSubContaDeb,rSubContaCre,rUnidNegoc,rValHistDed,rValHistCre: Double;
   rIDPlanoPrev, rIdPatro : Double;
begin
   Result:=True;
   MessageInfo:='';
   rUnidNegoc:=0;

   //Carrega Flag de Partida Dobrada
   bPartidaDobrada:=False;
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+
                          FloatToStr(F_rIDPessoa)+') ');
      bPartidaDobrada:=(FieldByName('PACDOBRADA').AsString='S');
   finally
      Free;
   end;

   cdsAux:=TCMClientDataSet.Create(nil);
   cdsContabAux:=TCMClientDataSet.Create(nil);
   try
      try
         cdsContabAux.Data:=DadosContabeis;
         if not(cdsContabAux.IsEmpty) and bIntegraContabil then
          begin
             cdsAux.Data:=GetDataPacket('SELECT USAABC,UNIDNEGOC,CODCENTRORESPON '+
                                        'FROM PARAMGLOBAL '+
                                        'WHERE (IDPESSOA = ' +FloatToStr(rIDPessoa)+') ');

             //Testa se existe um número par de Registros para Partida Dobrada
             if (bPartidaDobrada) and
                ((cdsContabAux.RecordCount mod 2) <> 0) then
              begin
                 MessageInfo:='Contabilização com número inválido de Lançamentos, para '+#10#13+
                              'Partida Dobrada';
                 Result:=False;
                 Exit;
              end;

             cdsContabAux.AddIndex('INDEXADOR','LACNUMLAN',[ixCaseInsensitive]);
             cdsContabAux.IndexName:='INDEXADOR';

             cdsContabAux.First;
             while not(cdsContabAux.Eof) do
             begin
                if (cdsContabAux.FieldByName('UNIDNEGOC').AsFloat=0) then
                   rUnidNegoc:=cdsAux.FieldByName('UNIDNEGOC').AsFloat
                else
                   rUnidNegoc:=cdsContabAux.FieldByName('UNIDNEGOC').AsFloat;

                // Alterado por Arnaldo V. Scarin, em 28/12/2009
                // SOL.: 128563 Kintana: 690151
                // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
                // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
                // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
                // específico para o PGA
                If F_bUsaPlanoPatro2010 then
                  SelecionaPlanoPGA(rIdPlanoPrev, rIdPatro)
                else
                begin
                  rIdPlanoPrev := cdsContabAux.FieldByName('IDPLANOPREV').AsFloat;
                  rIdPatro     := cdsContabAux.FieldByName('IDPATRO').AsFloat;
                end;

                if cdsContabAux.FieldByName('LACDEBCRE').AsString='D' then
                 begin
                    sCCustDeb   :=cdsContabAux.FieldByName('CODCENTROCUSTO').AsString;
                    sContaDeb   :=cdsContabAux.FieldByName('PLACONTA').AsString;
                    rValHistDed :=cdsContabAux.FieldByName('LACVALHIST').AsFloat;
                    rSubContaDeb:=cdsContabAux.FieldByName('CODSUBCONTA').AsFloat;
                    //Teste de Partida Dobrada
                    if not(bPartidaDobrada) then
                     begin
                        sCCustCre   :='';
                        sContaCre   :='';
                        rValHistCre :=0;
                        rSubContaCre:=0;
                     end
                    else
                     begin
                        cdsContabAux.Next;
                        sCCustCre   :=cdsContabAux.FieldByName('CODCENTROCUSTO').AsString;;
                        sContaCre   :=cdsContabAux.FieldByName('PLACONTA').AsString;
                        rValHistCre :=cdsContabAux.FieldByName('LACVALHIST').AsFloat;
                        rSubContaCre:=cdsContabAux.FieldByName('CODSUBCONTA').AsFloat;
                     end;
                 end
                else
                 begin
                    sCCustCre   :=cdsContabAux.FieldByName('CODCENTROCUSTO').AsString;
                    sContaCre   :=cdsContabAux.FieldByName('PLACONTA').AsString;
                    rValHistCre :=cdsContabAux.FieldByName('LACVALHIST').AsFloat;
                    rSubContaCre:=cdsContabAux.FieldByName('CODSUBCONTA').AsFloat;

                    //Teste de Partida Dobrada
                    if not(bPartidaDobrada) then
                     begin
                        sCCustDeb   :='';
                        sContaDeb   :='';
                        rValHistDed :=0;
                        rSubContaDeb:=0;
                     end
                    else
                     begin
                        cdsContabAux.Next;
                        sCCustDeb   :=cdsContabAux.FieldByName('CODCENTROCUSTO').AsString;
                        sContaDeb   :=cdsContabAux.FieldByName('PLACONTA').AsString;
                        rValHistDed :=cdsContabAux.FieldByName('LACVALHIST').AsFloat;
                        rSubContaDeb:=cdsContabAux.FieldByName('CODSUBCONTA').AsFloat;
                     end;
                 end;

                CtrlLancamento.lcValHisCre:=rValHistCre;
                CtrlLancamento.lcValHisDeb:=rValHistDed;

                if not(bPartidaDobrada) then
                   Result:=CtrlLancamento.InsereLancaContab(cdsContabAux.FieldByName('LACTIPO').AsString[1],
                                                      rIDPessoa,rIDModulo,rIDUsuario,rIDPlano,
                                                      rUnidNegoc,rSubContaDeb,rSubContaCre,
                                                      rIdPlanoPrev, // Alterado por Arnaldo V. Scarin SOL 182563
                                                      rIdPatro,
                                                      rPlnCodigo,0,FormatDateTime('dd/mm/yyyy',dDataLanc),
                                                      cdsContabAux.FieldByName('LACNUMDOC').AsString,
                                                      cdsContabAux.FieldByName('LACHIST1').AsString,
                                                      cdsContabAux.FieldByName('LACHIST2').AsString,
                                                      cdsContabAux.FieldByName('LACHIST3').AsString,
                                                      cdsContabAux.FieldByName('LACHIST4').AsString,
                                                      cdsContabAux.FieldByName('LACHIST5').AsString,
                                                      '03',sCCustDeb,sContaDeb,sCCustCre,sContaCre,'',
                                                      cdsContabAux.FieldByName('LACVALOR').AsFloat,
                                                      False,F_bUsaPlanoPatro,
                                                      cdsContabAux.FieldByName('IDSEGREGACRITER').AsInteger,
                                                      dDataLanc)
                else
                   Result:=CtrlLancamento.InsereLancaContab('2',
                                                      rIDPessoa,rIDModulo,rIDUsuario,rIDPlano,
                                                      rUnidNegoc,rSubContaDeb,rSubContaCre,
                                                      rIdPlanoPrev, // Alterado por Arnaldo V. Scarin SOL 182563
                                                      rIdPatro,
                                                      rPlnCodigo,0,FormatDateTime('dd/mm/yyyy',dDataLanc),
                                                      cdsContabAux.FieldByName('LACNUMDOC').AsString,
                                                      cdsContabAux.FieldByName('LACHIST1').AsString,
                                                      cdsContabAux.FieldByName('LACHIST2').AsString,
                                                      cdsContabAux.FieldByName('LACHIST3').AsString,
                                                      cdsContabAux.FieldByName('LACHIST4').AsString,
                                                      cdsContabAux.FieldByName('LACHIST5').AsString,
                                                      '03',sCCustDeb,sContaDeb,sCCustCre,sContaCre,'',
                                                      cdsContabAux.FieldByName('LACVALOR').AsFloat,
                                                      False,F_bUsaPlanoPatro,
                                                      cdsContabAux.FieldByName('IDSEGREGACRITER').AsInteger,
                                                      dDataLanc);

                if not(Result) then
                 begin
                    MessageInfo:=CtrlLancamento.MessageInfo;
                    Break;
                 end;

                 //Retorna o Código da Planilha
                 rPlnCodigo:=CtrlLancamento.RetornoPlnCodigo;

                cdsContabAux.Next;
             end;
          end;
      finally
         cdsAux.Free;
         cdsContabAux.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

// Alterado por Arnaldo V. Scarin, em 28/12/2009
// SOL.: 128563 Kintana: 690151
// Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
// deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
// para o plano "Operações Comuns", e esse deverá ser trocado para o plano
// específico para o PGA
Function TCtrlFinanc.SelecionaPlanoPGA(var pIdPlano, pIdPatro : Double) : Boolean;
var oQry : TClientDataSet;
begin
  pIdPlano := -1;
  pIdPatro := -1;
  oQry := TClientDataSet.Create(Nil);
  Try
    With oQry do
    Begin
      Data := GetDataPacket('select ppc.idplanoprev,' + #13#10 +
                            '       ppcp.idpatro' + #13#10 +
                            'from PlanPrevContabil ppc,' + #13#10 +
                            '     PlanPrevContabPatro ppcp' + #13#10 +
                            'where ppc.idplanoprev = ppcp.idplanoprev' + #13#10 +
                            '  and ppc.flgusopga = ''S''' + #13#10 +
                            '  and ppc.ativo = ''S''');
      Open;
      Result := Not IsEmpty;
      If Result then
      begin
        pIdPlano := FieldByName('IdPlanoPrev').asFloat;
        pIdPatro := FieldByName('IdPatro').asFloat;
      end;
      Close;
    end;
  finally
    FreeAndNil(oQry);
  end;
end;


function TCtrlFinanc.EstornoFinanceiro(dDataEstorno, dDataDisp: TDateTime;
                     bRegNaoIdent: Boolean; var rCodLancFinanc: Double;
                     rIDPessoa, rIDModulo, rIDUsuario, rIDPlano: Double;
                     bIntegraContabil: Boolean): Boolean;
var
   cdsMovim                 : TCMClientDataSet;
   cdsRateio                : TCMClientDataSet;
   rPlnCodigoAux            : Double;
   rPlnCodigoOrigAux        : Double;
   rCodLancTransf           : Double;
   rCodLancFinancEstorno    : Double;
   rCodLancFinancEstTransf  : Double;
   sEntradaSaida            : String;
   rIdPlanoPrev             : Double;
   rIdPatro                 : Double;
begin
   MessageInfo := '';
   cdsMovim    := TCMClientDataSet.Create(nil);
   cdsRateio   := TCMClientDataSet.Create(nil);
   try
      try
         cdsMovim.Data  := GetDataPacket('SELECT * '+
                                         'FROM MOVIMFINANC '+
                                         'WHERE (CODLANCFINANC='+FloatToStr(rCodLancFinanc)+') ');
         cdsRateio.Data := GetDataPacket('SELECT * '+
                                         'FROM RATEIOFINANC '+
                                         'WHERE (CODLANCFINANC='+FloatToStr(rCodLancFinanc)+') ');

         rCodLancTransf := cdsMovim.FieldByName('CODLANCTRANSF').AsFloat;

         rPlnCodigoAux := 0;
         if not(bRegNaoIdent) and (bIntegraContabil) and
            (cdsMovim.FieldByName('PLNCODIGO').AsFloat<>0) then
          begin
             //Exclui/Estorno contab
             CtrlLancamento.F_bUsaPlanoPatro2010 := F_bUsaPlanoPatro2010;
             Result := CtrlLancamento.EstornaLancaContab(rIDUsuario,
                                                         cdsMovim.FieldByName('PLNCODIGO').AsFloat,
                                                         rIDModulo,
                                                         rIDPessoa,
                                                         F_bUsaPlanoPatro,
                                                         FormatDateTime('dd/mm/yyyy',dDataEstorno));
             if not(Result) then
              begin
                 MessageInfo := CtrlLancamento.MessageInfo;
                 Exit;
              end;
              rPlnCodigoAux := CtrlLancamento.RetornoPlnCodigo;
          end;

         if (cdsMovim.FieldByName('ENTRADASAIDA').AsString='E') then
            sEntradaSaida:='S'
         else
            sEntradaSaida:='E';

         // Faz o lançamento da linha de estorno
         //e obtem o CODLANCFINANC
         rCodLancFinancEstorno := 0;
         Result := LancaFinanceiro(DadosVazio,rIDModulo,
                                   cdsMovim.FieldByName('HISTPADFINAN').AsFloat,
                                   cdsMovim.FieldByName('MOECODIGO').AsFloat,
                                   rIDUsuario,cdsMovim.FieldByName('CODPORTADOR').AsFloat,
                                   rIDPessoa,cdsMovim.FieldByName('VALORLANCFINAN').AsFloat,
                                   cdsMovim.FieldByName('VALOROUTRAMOEDA').AsFloat,dDataEstorno,
                                   cdsMovim.FieldByName('DATACONCILIACAO').AsDateTime,dDataDisp,
                                   cdsMovim.FieldByName('NUMCHQBORDERO').AsString,sEntradaSaida,
                                   'ESTORNO '+cdsMovim.FieldByName('HISTORICO').AsString,
                                   cdsMovim.FieldByName('STATUSCONCILIA').AsString,rCodLancFinancEstorno,
                                   rPlnCodigoAux,rIDPlano,bIntegraContabil);

         if not(Result) then Exit;

         // Insere a linha de rateio do lançamento de estorno
         cdsRateio.First;
         while not(cdsRateio.EOF) do
         begin

            // Alterado por Arnaldo V. Scarin, em 28/12/2009
            // SOL.: 128563 Kintana: 690151
            // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
            // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
            // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
            // específico para o PGA
            If F_bUsaPlanoPatro2010 then
              SelecionaPlanoPGA(rIdPlanoPrev,rIdPatro)
            else
            begin
              rIdPlanoPrev := cdsRateio.FieldByName('IDPLANOPREV').AsFloat;
              rIdPatro     := cdsRateio.FieldByName('IDPATRO').AsFloat;
            end;

            Result := LancaRateioFinanc(cdsRateio.FieldByName('UNIDNEGOC').AsFloat,
                                       cdsRateio.FieldByName('MOECODIGO').AsFloat,
                                       rIDPessoa,cdsMovim.FieldByName('CODPORTADOR').AsFloat,
                                       -cdsRateio.FieldByName('VALOR').AsFloat,
                                       -cdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                       cdsRateio.FieldByName('CODTIPRECDES').AsString,
                                       cdsRateio.FieldByName('RECPAG').AsString,
                                       cdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                       dDataEstorno,rCodLancFinancEstorno,
                                       cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                       cdsRateio.FieldByName('IDPROGRAMA').AsFloat,
                                       rIdPatro,
                                       rIdPlanoPrev, // Alterado por Arnaldo V. Scarin SOL 182563
                                       cdsRateio.FieldByName('CODTIPDOC').AsFloat,
                                       rIDPlano);

            if not(Result) then Exit;
            cdsRateio.Next;
         end;

         //===============================================================================
         //Marca Lançamentos como Estornados
         //===============================================================================
         // Lançamento original
         Result:=ExecSQL('Update MovimFinanc Set FLGESTORNADO = ''S'' '+
                         'Where (CodLancFinanc = '+FloatToStr(rCodLancFinanc)+') ');
         if not(Result) then Exit;

         // Lançamento de estorno
         Result:=ExecSQL('Update MovimFinanc Set FLGESTORNADO = ''S'' '+
                         'Where (CodLancFinanc = '+FloatToStr(rCodLancFinancEstorno)+') ');
         if not(Result) then Exit;


         if (rCodLancTransf <> 0) then
          begin
             rCodLancFinancEstTransf := 0;
             cdsMovim.Close;
             cdsMovim.Data := GetDataPacket('SELECT * '+
                                            'FROM MOVIMFINANC '+
                                            'WHERE (CODLANCFINANC='+FloatToStr(rCodLancTransf)+') ');

             if (cdsMovim.FieldByName('ENTRADASAIDA').AsString='E') then
                sEntradaSaida := 'S'
             else
                sEntradaSaida := 'E';

             // Faz o lançamento de estorno para lançamentos de trânsferência
             // e obtem o CODLANCFINANC
             Result := LancaFinanceiro(DadosVazio,rIDModulo,
                                       cdsMovim.FieldByName('HISTPADFINAN').AsFloat,
                                       cdsMovim.FieldByName('MOECODIGO').AsFloat,
                                       rIDUsuario,cdsMovim.FieldByName('CODPORTADOR').AsFloat,
                                       rIDPessoa,cdsMovim.FieldByName('VALORLANCFINAN').AsFloat,
                                       cdsMovim.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                       dDataEstorno,
                                       cdsMovim.FieldByName('DATACONCILIACAO').AsDateTime,
                                       dDataDisp,cdsMovim.FieldByName('NUMCHQBORDERO').AsString,
                                       sEntradaSaida,
                                       'ESTORNO '+cdsMovim.FieldByName('HISTORICO').AsString,
                                       cdsMovim.FieldByName('STATUSCONCILIA').AsString,
                                       rCodLancFinancEstTransf,rPlnCodigoAux,rIDPlano,
                                       bIntegraContabil);
             if not(Result) then Exit;

             // Faz o link de estorno original e destino, caso tenha transferência entre fundos
             Result := GravaTransFundos(rCodLancFinancEstorno,rCodLancFinancEstTransf);
             if not(Result) then Exit;

             //===============================================================================
             //Marca Lançamentos como Estornados
             //===============================================================================
             // Lançamento original
             Result := ExecSQL('Update MovimFinanc Set FLGESTORNADO = ''S'' '+
                               'Where (CodLancFinanc = '+FloatToStr(rCodLancTransf)+') ');
             if not(Result) then Exit;

             // Lançamento de estorno
             Result := ExecSQL('Update MovimFinanc Set FLGESTORNADO = ''S'' '+
                               'Where (CodLancFinanc = '+FloatToStr(rCodLancFinancEstTransf)+') ');
             if not(Result) then Exit;

          end;


      finally
         cdsMovim.Free;
         cdsRateio.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;




function TCtrlFinanc.ExcluiRateioFinanc(rCodLancFinanc: Double): Boolean;
begin
   Result:=True;
   MessageInfo:='';
   if not(ExecSQL('DELETE FROM RATEIOFINANC '+
                  'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') ')) then Result := False;
end;

function TCtrlFinanc.MudaStatusConcilia(sStatus: String;
  dDataConcilia: TDateTime; rCodLancFinanc: Double): Boolean;
var
   sSql : String;
begin
   MessageInfo := '';

   sSql := 'UPDATE MOVIMFINANC SET STATUSCONCILIA = ''' + sStatus + ''' ';

   // Sol 31714_38358 Kintana 523349_523362 - Paulo Nobre
   // X  - Conciliado
   If sStatus = 'X' Then
      Begin
         sSql := sSql + ',CONCILIADO = ''D''  '; // Conciliado Definitvo pela NOVA Conciliação Bancária
         sSql := sSql + ',DATACONCILIACAOBANCARIA = TO_DATE(''' +
         FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'') ';
      End;
   // FIM - Sol 31714_38358 Kintana 523349_523362

   If dDataConcilia <> 0 Then
      sSql := sSql + ',DATACONCILIACAO = TO_DATE(''' +
         FormatDateTime('dd/mm/yyyy', dDataConcilia) + ''',''dd/MM/yyyy'') '
   Else
      sSql := sSql + ',DATACONCILIACAO = NULL ';

   sSql := sSql + ' WHERE (CODLANCFINANC = ' + FloatToStr(rCodLancFinanc) + ') AND (STATUSCONCILIA <> ''X'' ) ';

   Result := ExecSQL(sSql);
end;

procedure TCtrlFinanc.CalculaSaldoFinanc(rCodPortador: Double;dDataLimite: TDateTime;
                                        sStatusConcilia,sTipoData:string;
                                        var rSaldoValorCorrente,
                                            rSaldoValorOutraMoeda:Double);
var
   sSql : String;
   CdsAux: TCMClientDataSet;
begin
   //TipoData => 'L' = Data de lançamento ou 'C' = Data da conciliação
   //Status   => 'N' = Não bateu no banco
   //            'C' = Cheque na Casa
   //            'X' = Bateu no banco
   //            'I' = Não identificado
   //            'P' = Conciliação provisória

   CdsAux:=TCMClientDataSet.Create(nil);
   try
      sSql :='SELECT '+
             '   SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN,-VALORLANCFINAN)) AS SaldoMCorrente, '+
             '   SUM(DECODE(ENTRADASAIDA,''E'',VALOROUTRAMOEDA,-VALOROUTRAMOEDA)) AS SaldoMOutra '+
             'FROM '+
             '	  MOVIMFINANC '+
             'WHERE (CODPORTADOR = '+FloatToStr(rCodPortador)+') AND '+
             '      (STATUSCONCILIA IN ('''+sStatusConcilia+''')) AND ';

      if sTipoData = 'L' then
         sSql :=sSql+'      (DATALANCFINAN <= TO_DATE('''+
                        FormatDateTime('dd/mm/yyyy',dDataLimite)+''',''dd/MM/yyyy'')) '
      else
         sSql :=sSql+'      (DATACONCILIACAO <= TO_DATE('''+
                        FormatDateTime('dd/mm/yyyy',dDataLimite)+''',''dd/MM/yyyy'')) ';

      CdsAux.Data:=GetDataPacket(sSql);

      rSaldoValorCorrente:=CdsAux.FieldByName('SaldoMCorrente').AsFloat;
      rSaldoValorOutraMoeda:=CdsAux.FieldByName('SaldoMOutra').AsFloat;

      CdsAux.Close;
   finally
      CdsAux.Free;
   end;
end;

procedure TCtrlFinanc.FazerAcumulaRateio(rCodDocumento: Double;
  var rTotalDocumento, rTotalDocOM: Double);
var
   cdsAux : TCMClientDataSet;
begin
   rTotalDocOM:=0;
   rTotalDocumento:=0;
   cdsAux := TCMClientDataSet.Create(nil);
   try
      cdsAux.Data:=GetDataPacket('SELECT SUM(VALOR) AS SomaValor, SUM(VALOROUTRAMOEDA) AS SomaOutra '+
                                 'FROM RATEIODOCUM WHERE (CODDOCUMENTO = '+FloatToStr(rCodDocumento)+') ');
      rTotalDocumento:=cdsAux.FieldByName('SomaValor').AsFloat;
      rTotalDocOM:=cdsAux.FieldByName('SomaOutra').AsFloat;
   finally
      cdsAux.Close; // 26/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
      cdsAux.Free;
   end;
end;

function TCtrlFinanc.GravaRelacionados(Relacionados: OleVariant): Boolean;
var
   cdsRelacionados  : TClientDataSet;
   rIDRelacionaNI   : Double;
   bPrimeiraVez     : Boolean;
   bDatasIguais     : Boolean;
   dDataValida      : TDateTime;
begin
   Result:=True;
   MessageInfo:='';

   try
      cdsRelacionados:=TCMClientDataSet.Create(nil);
      try
         cdsRelacionados.Data:=Relacionados;
         if (cdsRelacionados.IsEmpty) then Exit;

         dDataValida:=0;
         bDatasIguais:=True;
         bPrimeiraVez:=True;

         //Testa se a Data dos Identificados é igual e retorna a mesma caso seja
         cdsRelacionados.First;
         while not(cdsRelacionados.Eof) do
         begin
            if (cdsRelacionados.FieldByName('FLGNI').AsString='I') then
               if bPrimeiraVez then
                begin
                   dDataValida:=cdsRelacionados.FieldByName('DATADISP').AsDateTime;
                   bPrimeiraVez:=False;
                end
               else
                if (cdsRelacionados.FieldByName('DATADISP').AsDateTime<>dDataValida) then
                   bDatasIguais:=False;

            cdsRelacionados.Next;
         end;

         Result:=ApplyCds(cdsRelacionados,FDbRelacionaNI,[],[]);
         if not(Result) then
          begin
             MessageInfo:=FDbRelacionaNI.MessageInfo;
             Exit;
          end;

         //Altera a Data da Disponibilidade
         cdsRelacionados.First;
         while not(cdsRelacionados.Eof) do
         begin
            if cdsRelacionados.FieldByName('FLGNI').AsString='N' then
             begin
                FDbMovimFinanc.Codlancfinanc.AsFloat:=
                               cdsRelacionados.FieldByName('CODLANCFINANC').AsFloat;
                if FDbMovimFinanc.LoadFromDb then
                 begin
                    if (bDatasIguais) and (dDataValida<>0) then
                       FDbMovimFinanc.Datadispfinanc.AsDateTime:=dDataValida
                    else
                       FDbMovimFinanc.Datadispfinanc.Clear;

                    Result:=FDbMovimFinanc.Update;
                    if not(Result) then
                     begin
                        MessageInfo:=FDbMovimFinanc.MessageInfo;
                        Exit;
                     end;
                 end;
             end;
            cdsRelacionados.Next;
         end;
      finally
         cdsRelacionados.Close; // 26/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
         cdsRelacionados.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlFinanc.GravaRelacionados(
  aRelacionados: array of TRelacionados): Boolean;
var
   iIndice    : Integer;
   iNumTermos : Integer;
   cdsAux     : TCMClientDataSet;
begin
   iNumTermos:=Length(aRelacionados);
   Result:=(iNumTermos<1);
   MessageInfo:='';
   if not(Result) then
    begin
       MessageInfo:='Não foram fornecidos dados de Relacionamento.';
       Exit;
    end;

   cdsAux:=TCMClientDataSet.Create(nil);
   try
      try
         for iIndice:=1 to iNumTermos do
         begin
            cdsAux.Append;
            cdsAux.FieldByName('IDMODORIGEMREGU').AsFloat := aRelacionados[iIndice].IdModOrigRegu;
            cdsAux.FieldByName('CODLANCFINANC').AsFloat:=aRelacionados[iIndice].CodLancFinanc;
            cdsAux.FieldByName('DATADISP').AsDateTime:=aRelacionados[iIndice].DataDisp;
            cdsAux.FieldByName('FLGNI').AsString:=aRelacionados[iIndice].FlgNI;
            cdsAux.Post;
         end;

         Result:=GravaRelacionados(cdsAux.Data);

      finally
         cdsAux.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlFinanc.GravaFluxoPrev(sCRespon, sCodTipRecDes, sRecPag,
  sPrev: String; dData: TdateTime; rUnidNeg, rValorCorrente: Double;
  sCodCentroCusto: String; rIDpessoa, rIDPrograma, rIDPatro, rIDPlanoPrev,
  rCodTipDoc: Double): Boolean;
var
   sSql           : String;
   sValorCorrente : String;
   cdsAux         : TCMClientDataSet;
begin
   cdsAux:=TCMClientDataSet.Create(nil);
   try
      try
         sSql:='SELECT * '+
               'FROM FLUXOPREVISTO '+
               'WHERE (IDPESSOA = '+FloatToStr(rIDpessoa)+') AND '+
               '      (DATAPROGRAMADA = TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',dData)+''',''dd/MM/yyyy'')) AND '+
               '      (CODTIPRECDES = '''+sCodTipRecDes+''') AND '+
               '      (RECPAG = '''+sRecPag+''') AND '+
               '      (UNIDNEGOC = '+FloatToStr(rUnidNeg)+') AND '+
               '      (CODCENTRORESPON = '''+ sCRespon + ''') ';

         if (sCodCentroCusto = '') then
            sSql:=sSql+' AND (CODCENTROCUSTO IS NULL) '
         else
            sSql:=sSql+' AND (CODCENTROCUSTO = '''+ sCodCentroCusto + ''') ';

         if (rIDPrograma <=0) then
            sSql:=sSql+' AND (IDPROGRAMA IS NULL) '
         else
            sSql:=sSql+' AND (IDPROGRAMA = '+FloatToStr(rIDPrograma)+') ';

         if (rIDPatro <=0) then
            sSql:=sSql+' AND (IDPATRO IS NULL) '
         else
            sSql:=sSql+' AND (IDPATRO = '+FloatToStr(rIDPatro)+')';

         if (rIDPlanoPrev <=0) then
            sSql:=sSql+' AND (IDPLANOPREV IS NULL) '
         else
            sSql:=sSql+' AND (IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+')';

         if (rCodTipDoc <=0) then
            sSql:=sSql+' AND (CODTIPDOC IS NULL) '
         else
            sSql:=sSql+' AND (CODTIPDOC = '+FloatToStr(rCodTipDoc)+')';

         cdsAux.Data:=GetDataPacket(sSql);

         if cdsAux.IsEmpty then
          begin

             //Carrega Campos
             FDbFluxoPrevisto.Idpessoa.AsFloat:=rIDpessoa;
             FDbFluxoPrevisto.Dataprogramada.AsDateTime:=dData;
             FDbFluxoPrevisto.Codtiprecdes.AsString:=sCodTipRecDes;
             FDbFluxoPrevisto.Recpag.AsString:=sRecPag;
             FDbFluxoPrevisto.Valor.AsFloat:=rValorCorrente;
             FDbFluxoPrevisto.Unidnegoc.AsFloat:=rUnidNeg;
             FDbFluxoPrevisto.Codcentrorespon.AsString:=sCRespon;

             if (sCodCentroCusto<>'') then
              begin
                 FDbFluxoPrevisto.Idempresa.AsFloat:=rIDpessoa;
                 FDbFluxoPrevisto.Codcentrocusto.AsString:=sCodCentroCusto;
              end
             else
              begin
                 FDbFluxoPrevisto.Idempresa.Clear;
                 FDbFluxoPrevisto.Codcentrocusto.Clear;
              end;

             FDbFluxoPrevisto.Idplanoprev.AsFloat:=rIDPlanoPrev;
             FDbFluxoPrevisto.Idpatro.AsFloat:=rIDPatro;
             FDbFluxoPrevisto.Idprograma.AsFloat:=rIDPrograma;
             FDbFluxoPrevisto.Codtipdoc.AsFloat:=rCodTipDoc;

             if (sPrev='S') then
                FDbFluxoPrevisto.Flgprevisao.AsString:= 'S'
             else
                FDbFluxoPrevisto.Flgprevisao.AsString:= '';

             Result:=FDbFluxoPrevisto.Insert;
             if not(Result) then
              begin
                 MessageInfo:=FDbFluxoPrevisto.MessageInfo;
                 Exit;
              end;
          end
         else
          begin

             sValorCorrente:=FloatTosTr(rValorCorrente);
             if Pos(',',sValorCorrente)<>0 then sValorCorrente[Pos(',',sValorCorrente)]:='.';

             if (sPrev='S') then
                sSql:='UPDATE FluxoPrevisto '+
                                'SET VALOR=(VALOR + '+sValorCorrente+'),'+
                                '    FLGPREVISAO = ''S'' '+
                                'WHERE (IDFLUXOPREVISTO = '+
                                   cdsAux.FieldByName('IDFLUXOPREVISTO').AsString+') '
             else
                sSql:='UPDATE FluxoPrevisto '+
                                'SET VALOR=(VALOR + '+sValorCorrente+') '+
                                'WHERE (IDFLUXOPREVISTO = '+
                                   cdsAux.FieldByName('IDFLUXOPREVISTO').AsString+') ';

             Result:=ExecSQL(sSql);
             if not(Result) then Exit;
          end;

      finally
         cdsAux.Free;
      end;
   except
      on E:Exception do
       begin
          Result := False;
          MessageInfo := E.Message;
       end;
   end;
end;



function TCtrlFinanc.GravaFluxoReal(sCRespon, sCodTipRecDes, sRecPag,
  sCodCentroCusto: String; dData: TDateTime; rMoeCodigo, rUnidNeg, rValor,
  rIDPessoa, rIDPrograma, rIDPatro, rIDPlanoPrev,
  rCodTipDoc, rCodPortador: Double): Boolean;
var
   sSql   : String;
   cdsAux : TCMClientDataSet;
begin
   try
      cdsAux:=TCMClientDataSet.Create(nil);
      try
         sSql:='SELECT * '+
               'FROM FLUXOREAL '+
               'WHERE '+
               '   (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
               '   (DATACFLOAT = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dData)+
                                         ''',''dd/MM/yyyy'')) AND '+
               '   (CODTIPRECDES = '''+sCodTipRecDes+''') AND '+
               '   (RECPAG = '''+sRecPag+''') AND '+
               '   (UNIDNEGOC = '+FloatToStr(rUnidNeg)+') AND '+
               '   (CODCENTRORESPON = '''+ sCRespon + ''') AND '+
               '   (MOECODIGO = '+FloatToStr(rMoeCodigo)+') AND ';

         if (sCodCentroCusto<>'') then
            sSql:=sSql+'   (CODCENTROCUSTO = '''+ sCodCentroCusto + ''') '
         else
            sSql:=sSql+'   (CODCENTROCUSTO IS NULL) ';

         if (rIDPrograma<=0) then
            sSql:=sSql+' AND (IDPROGRAMA IS NULL) '
         else
            sSql:=sSql+' AND (IDPROGRAMA = '+FloatToStr(rIDPrograma)+')';

         if (rIDPatro<=0) then
            sSql:=sSql+' AND (IDPATRO IS NULL) '
         else
            sSql:=sSql+' AND (IDPATRO = '+FloatToStr(rIDPatro)+')';

         if (rIDPlanoPrev<=0) then
            sSql:=sSql+' AND (IDPLANOPREV IS NULL) '
         else
            sSql:=sSql+' AND (IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+')';

         if (rCodTipDoc<=0) then
            sSql:=sSql+' AND (CODTIPDOC IS NULL) '
         else
            sSql:=sSql+' AND (CODTIPDOC = '+FloatToStr(rCodTipDoc)+')';

         if (rCodPortador <=0) then
            sSql:=sSql+' AND (CODPORTADOR IS NULL) '
         else
            sSql:=sSql+' AND (CODPORTADOR = '+FloatToStr(rCodPortador)+')';


         cdsAux.Data:=GetDataPacket(sSql);

         cdsAux.First;
         if (cdsAux.IsEmpty) then
          begin
             //Carrega Campos
             FDbFluxoReal.Idpessoa.AsFloat:=rIDPessoa;
             FDbFluxoReal.Datacfloat.AsDateTime:=dData;
             FDbFluxoReal.Codtiprecdes.AsString:=sCodTipRecDes;
             FDbFluxoReal.Recpag.AsString:=sRecPag;
             FDbFluxoReal.Valor.AsFloat:=rValor;
             FDbFluxoReal.Unidnegoc.AsFloat:=rUnidNeg;
             FDbFluxoReal.Codcentrorespon.AsString:=sCRespon;
             FDbFluxoReal.Moecodigo.AsFloat:=rMoeCodigo;

             FDbFluxoReal.CodPortador.AsFloat := rCodPortador;

             if (sCodCentroCusto<>'') then
              begin
                 FDbFluxoReal.Idempresa.AsFloat:=rIDpessoa;
                 FDbFluxoReal.Codcentrocusto.AsString:=sCodCentroCusto;
              end
             else
              begin
                 FDbFluxoReal.Idempresa.Clear;
                 FDbFluxoReal.Codcentrocusto.Clear;
              end;

             FDbFluxoReal.Idplanoprev.AsFloat:=rIDPlanoPrev;
             FDbFluxoReal.Idpatro.AsFloat:=rIDPatro;
             FDbFluxoReal.Idprograma.AsFloat:=rIDPrograma;
             FDbFluxoReal.Codtipdoc.AsFloat:=rCodTipDoc;

             Result:=FDbFluxoReal.Insert;
             if not(Result) then
              begin
                 MessageInfo:=FDbFluxoReal.MessageInfo;
                 Exit;
              end;
          end
         else
          begin
             FDbFluxoReal.Idfluxoreal.AsFloat:=cdsAux.FieldByName('IDFLUXOREAL').AsFloat;
             FDbFluxoReal.LoadFromDb;
             FDbFluxoReal.Valor.AsFloat:=cdsAux.FieldByName('VALOR').AsFloat+rValor;

             Result:=FDbFluxoReal.Update;
             if not(Result) then
              begin
                 MessageInfo:=FDbFluxoReal.MessageInfo;
                 Exit;
              end;
          end;

      finally
         cdsAux.Free;
      end;
   except
      on E:Exception do
       begin
          Result := False;
          MessageInfo := E.Message;
       end;
   end;
end;

function TCtrlFinanc.GravaFluxoOrc(rIDPessoa: Double;
  dDataProgramada: TDateTime; sCodTipRecDes, sRecPag, sCodCentroRespon,
  sPrazo: String; rUnidNeg, rValor, rCodTipDoc: Double): Boolean;
begin
   MessageInfo:='';
   try
      FDbFluxoOrcado.Idpessoa.AsFloat          := rIDPessoa;
      FDbFluxoOrcado.Dataprogramada.AsDateTime := dDataProgramada;
      FDbFluxoOrcado.Codtiprecdes.AsString     := sCodTipRecDes;
      FDbFluxoOrcado.Recpag.AsString           := sRecPag;
      FDbFluxoOrcado.Codcentrorespon.AsString  := sCodCentroRespon;
      FDbFluxoOrcado.Prazo.AsString            := sPrazo;
      FDbFluxoOrcado.Unidnegoc.AsFloat         := rUnidNeg;
      FDbFluxoOrcado.Valor.AsFloat             := rValor;
      FDbFluxoOrcado.Codtipdoc.AsFloat         := rCodTipDoc;

      Result:=FDbFluxoOrcado.Insert;
      if not(Result) then
       begin
          MessageInfo:=FDbFluxoOrcado.MessageInfo;
          Exit;
       end;
   except
      on E:Exception do
       begin
          Result := False;
          MessageInfo := E.Message;
       end;
   end;
end;




function TCtrlFinanc.GetIntegraDispFin: boolean;
var
  sSql :string;
begin
   sSql := 'SELECT FLGINTDISPFIN FROM PARAMFINANC WHERE IDPESSOA = ' + FloatToStr(F_rIDPessoa);

    _cds.Close; // 27/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
    _cds.Data := GetDataPacket(sSql);
   if Not _cds.isEmpty Then
   begin
      if _cds.FieldByName('FLGINTDISPFIN').AsString = 'Y' then
         Result := True
      else
         Result := False;
   end;
   _cds.Close;
end;



function TCtrlFinanc.TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                                           dDataOper : TDateTime): Boolean;
var
   sSql,fDispBloq,fUsuBloq : string;
   dDataDisp : TDateTime;
begin
  Result := True;

  try
    if IntegraDispFinanc then // Verifico se Faz Integracao com Disp. Financeiro
    begin
       // 1-Verifica se a disponibilidade financeira está bloqueada
       sSql := 'SELECT                                             ' +
               '   PAR.FLGDISPBLOQ, PAR.DATABLOQDISPFINAN,         ' +
               '   USU.IDUSUARIO, USU.FLGDISPFINANC                ' +
               'FROM  PARAMFINANC PAR,USUARIOSISTEMA USU           ' +
               'WHERE                                              ' +
               '   (PAR.IDPESSOA =  '+IntToStr(iIdPessoa)+' )      ' +
               '   AND (USU.IDUSUARIO = '+IntToStr(iIdUsuario)+' ) ' ;

       _cds.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
       _Cds.Data  := GetDataPacket(sSql);

       if not _Cds.isEmpty then
       begin
          dDataDisp := _Cds.FieldByName('DATABLOQDISPFINAN').AsDateTime;
          // Somente valido se o lancto for no mesmo dia da Disponibilidade
          if ((dDataOper <= dDataDisp) and (dDataOper > 0)) then
          begin
             fDispBloq := _Cds.FieldByName('FLGDISPBLOQ').AsString;
             fUsuBloq  := _Cds.FieldByName('FLGDISPFINANC').AsString;

             // Verifico se a Disp. está bloqueada para lanctos
             if fDispBloq = 'Y' then
             begin
                if fUsuBloq <> 'Y' then
                begin
                   Result := False;
                   // Rodolpho da Silva - P: 19904 - 07/03/2006
                   MessageInfo := 'A Disponibilidade está Bloqueada e o Usuário não possui autorização para executar lançamentos';
                   Exit;
                end;
             end;
          end;
       end;
    end;
  finally
    _cds.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
  end;
end;



function TCtrlFinanc.DesfazerRegularizacao(const iCodLancFinanc,iIdPessoa,iIdModulo: integer): boolean;
var
   iCodLancNaoIdent,
   iCodLancContrNaoIdent,
   iIdRelacionaNI,
   iIdModuloOrigem: integer;
   sNumChqNordero: string;

begin
   try
      // Busca os respectivos códigos de lançamentos no financeiro
      // Extrai o id de relacionamento entre não-identificado e não-conciliado
      _Cds.Data := GetDataPacket('SELECT IDRELACIONANI, IDMODORIGEMREGU FROM RELACIONANI WHERE CODLANCFINANC = ' +IntToStr(iCodLancFinanc));

      // Se não existir relacionamento, sai do método
      if _Cds.IsEmpty then
      begin
         Result := true;
         Exit;
      end;

      iIdRelacionaNI  := _Cds.FieldByName('IDRELACIONANI').AsInteger;
      iIdModuloOrigem := _Cds.FieldByName('IDMODORIGEMREGU').AsInteger;

      // Extrai o código do não-identificado
      _Cds.Data        := GetDataPacket('SELECT CODLANCFINANC FROM RELACIONANI WHERE FLGNI = ''I'' AND IDRELACIONANI = ' +IntToStr(iIdRelacionaNI));
      iCodLancNaoIdent := _Cds.FieldByName('CODLANCFINANC').AsInteger;


      // Extrai o código do lançamento "contrário" do Não-identificado
      _Cds.Data := GetDataPacket('SELECT ' +
                                 '   M.CODLANCFINANC, ' +
                                 '   M.NUMCHQBORDERO ' +
                                 'FROM ' +
                                 '   MOVIMFINANC M, ' +
                                 '   (SELECT ' +
                                 '       F.CODLANCFINANC, ' +
                                 '       DECODE(F.ENTRADASAIDA,''E'',''S'',''E'') AS ENTRADASAIDA, ' +
                                 '       F.NUMCHQBORDERO, ' +
                                 '       F.STATUSCONCILIA, ' +
                                 '       F.HISTPADFINAN, ' +
                                 '       F.VALORLANCFINAN, ' +
                                 '       F.CODPORTADOR, ' +
                                 '       F.FLGESTORNADO ' +
                                 '    FROM ' +
                                 '       MOVIMFINANC F ' +
                                 '    WHERE (F.CODLANCFINANC = (SELECT CODLANCFINANC ' +
                                 '                             FROM RELACIONANI ' +
                                 '                             WHERE IDRELACIONANI = ' + IntToStr(iIdRelacionaNI) +' AND ' +
                                 '                                   FLGNI = ''I''))) E ' +
                                 'WHERE ' +
                                 '   (M.NUMCHQBORDERO  = E.NUMCHQBORDERO) AND ' +
                                 '   (M.ENTRADASAIDA   = E.ENTRADASAIDA) AND ' +
                                 '   (M.STATUSCONCILIA = E.STATUSCONCILIA) AND ' +
                                 '   (M.HISTPADFINAN   = E.HISTPADFINAN) AND ' +
                                 '   (M.VALORLANCFINAN = E.VALORLANCFINAN) AND ' +
                                 '   (M.CODPORTADOR    = E.CODPORTADOR) AND ' +
                                 '   (M.IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                                 '   (M.FLGESTORNADO   = E.FLGESTORNADO) ');
      sNumChqNordero        := _Cds.FieldByName('NUMCHQBORDERO').AsString;
      iCodLancContrNaoIdent := _Cds.FieldByName('CODLANCFINANC').AsInteger;

      // Mantido apenas para atender os lançamentos anteriores
      if iIdModuloOrigem = 0 then
         iIdModuloOrigem := iIdModulo;


      // Módulo em que se está tentando desfazer a regularização
      case iIdModulo of
         // CAR
         4: begin
               // Se a desregularização estiver sende executada pelo CAR,
               //permitir executar a mesma, já que existe uma advertência
               //na tela informando tal procedimento será executado
            end;

         // CFinan
         9: if (iIdModuloOrigem = 4) then
               raise Exception.Create('O documento Não-Identificado nº ' + sNumChqNordero + ' lançado no financeiro foi regularizado/conciliado diretamente no CAR. ' +
                                      'Para dezfazer esta regularização/conciliação, é necessário excluir a baixa do documento no CAR.');
      end;



      // Retorna o status de "X-Conciliado" para "N-Não conciliado" do lançamento gerado pelo CAR/CAP
      if not ExecSql('UPDATE MOVIMFINANC SET STATUSCONCILIA = ''N'', DATACONCILIACAO = NULL  WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinanc)) then
         raise Exception.Create(MessageInfo);


      //  Marca na tabela RECBTOPAGTO a data da baixa igual a do documento,
      //devolvendo a databaixa anterior
      _Cds.Data := GetDataPacket( ' SELECT NVL(FLGALTDTBAIXA, ''N'') AS FLGALTDTBAIXA FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr(iIdPessoa));
      if (_Cds.FieldByName('FLGALTDTBAIXA').AsString = 'S') then
      begin
        if not ExecSql(' UPDATE RECBTOPAGTO R SET R.DATABAIXA = (SELECT L.DATALANCTO '+ #13+
                       '                                         FROM LANCTODOCUM L  '+ #13+
                       '                                         WHERE (R.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                                                 '     (R.NUMLANCTO = L.NUMLANCTO) AND ' +
                       '                                               (L.OPERACAO = 5)) '+ #13+
                       ' WHERE R.CODLANCNAOIDENT = ' + IntToStr(iCodLancNaoIdent)) then
           raise Exception.Create(MessageInfo);
      end;


      //Deletando o lançamento contrário do Não-identificado
      if not ExecSQL('DELETE FROM RATEIOFINANC WHERE IDPESSOA = ' + IntToStr(iIdPessoa) + ' AND CODLANCFINANC = ' + IntToStr(iCodLancContrNaoIdent)) then
         raise Exception.Create(MessageInfo);
      if not ExecSQL('DELETE FROM MOVIMFINANC WHERE IDPESSOA = ' + IntToStr(iIdPessoa) + ' AND CODLANCFINANC = ' + IntToStr(iCodLancContrNaoIdent)) then
         raise Exception.Create(MessageInfo);


      // Deletando o link de relacionamento
      if not ExecSQL('DELETE FROM RELACIONANI WHERE IDRELACIONANI = ' + IntToStr(iIdRelacionaNI)) then
         raise Exception.Create('Não foi possível excluir o relacionamento de identificação dos lançamentos conciliados. ' + #13 +
                                'Motivo: ' + MessageInfo);


      // Muda o status do Não-identificado de "J"(estorno) para "I"(Não-identificado)
      if not ExecSQL('UPDATE MOVIMFINANC ' +
                     'SET FLGESTORNADO    = NULL, ' +
                     '    DATACONCILIACAO = NULL, ' +
                     '    STATUSCONCILIA  = ''I'' ' +
                     'WHERE IDPESSOA = ' + IntToStr(iIdPessoa) + ' AND ' +
                     '      CODLANCFINANC = ' + IntToStr(iCodLancNaoIdent) ) then
         raise Exception.Create(MessageInfo);



      Result := true;

   except
      on E:Exception do
      begin
         MessageInfo := E.Message;
         Result      := false;
      end;
   end;
end;

function TCtrlFinanc.ArredondaRateio(Value: Double; const bArred5 : boolean): Double;  // Edilaine - SOL 124845-14262 / KTN 1977287
begin

  RESULT := CtrlLancamento.RoundNExtend(VALUE, 2, bArred5 );   // Edilaine - SOL 124845-14262 / KTN 1977287

  { // Edilaine - SOL 124845-14262 / KTN 1977287 - comentado
  Result := StrToFloat(FloatToStr(Value * 1000));
  Result := Trunc(Result);
  Result := Result / 10;
  Result := Trunc(Result);
  Result := Result / 100;
  } // Edilaine - SOL 124845-14262 / KTN 1977287
end;


// Edilaine - SOL 124845-14262 / KTN 1977287
procedure TCtrlFinanc.VerificaFezRateioFinanceiro( ovDados: OleVariant; sNumChqBor : String );
var
   CdsAux: TClientDataSet;
begin
  try
    CdsAux      := TClientDataSet.Create(nil);
    CdsAux.Data := ovDados;
    {
    if not bFezLanctoFinanc then
    begin
      CdsAux.first;

      if ( CdsAux.recordcount = 1 ) then
         bFezLanctoFinanc := false
      else
      begin
        while ( not CdsAux.Eof ) and ( not bFezLanctoFinanc  ) do
        begin
          _cds.Close;
          _cds.Data := getDataPacket(
                          ' SELECT R.CODLANCFINANC FROM RECBTOPAGTO R, MOVIMFINANC M ' +
                          '  WHERE R.CODDOCUMENTO = ' + CdsAux.FieldByName( 'CODDOCUMENTO' ).asString +
                          '    AND M.CODLANCFINANC = R.CODLANCFINANC '+
                          '    AND M.FLGESTORNADO IS NULL '+
                          '    AND R.NUMCHQBORDERO = '+quotedStr( sNumChqBor )
                       );

            bFezLanctoFinanc := ( _cds.FieldByName( 'CODLANCFINANC' ).asInteger > 0 );

          _cds.Close;

          CdsAux.next;
        end;
      end;
    end;
    }
  finally
    CdsAux.Close;
    CdsAux.Free;
  end;
end;
// Edilaine - SOL 124845-14262 / KTN 1977287 - FIM

procedure TCtrlFinanc.SetbFlgExecutaAcertoDifCentavos(
  const Value: boolean);
begin
  FbFlgExecutaAcertoDifCentavos := Value;
end;

end.
