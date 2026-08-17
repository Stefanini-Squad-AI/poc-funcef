{{---------------------------------------------------------------------------------------------------
Data      : 12/06/2007
Autor     : Rodolpho da Silva
pendência : 25587
Descrição : Corrigir erro de UPDATE, onde retornava mais de uma linha para documentos
com baixas parciais (operação 5 2x)
---------------------------------------------------------------------------------------------------
// catia - pendência 22482
{{---------------------------------------------------------------------------------------------------
Data      : 28/02/2007
Autor     : Rodolpho da Silva
pendência : 24574
Descrição : Implementar nova rotina para desregularização do lançamento-não identificado
Metodo    : Diversos
---------------------------------------------------------------------------------------------------
Data      : 05/01/2007
Autor     : Rodolpho da Silva
pendência : 18194
Descrição : Implementar nova rotina de FLUXO DE CAIXA
Metodo    : Diversos
---------------------------------------------------------------------------------------------------
Data      : 30/05/2006
Autor     : Catia Azevedo
pendência : 22482
Descrição : Acerto para recálculo de alteradores no documento da ADMINISTRAÇÃO IMOBILIÁRIA.
Metodo    : FazerRateioCapCar
---------------------------------------------------------------------------------------------------}
// andre tavares - pendência 19170
{---------------------------------------------------------------------------------------------------
Data      : 13/12/2004
Autor     : Andre tavares
pendência : 19170
Descrição : inclusão do parâmetro sHistExt. Se preenchido utilizar o mesmo, senão montar o histórico como antes.
Metodo    : FazerRateioCapCar
---------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    :
Data      : 01/02/2005
Autor     : Rodolpho da Silva
pendência : 18549
Descrição : Não estava verificando se o PortadorForma está habilitado ou não à inserir no CFinan
Metodo    : FazerRateioCapCar

---------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    :
Data      : 13/12/2004
Autor     : Andre tavares
pendência : 18013 do CAR
Descrição : se passar o parâmetro rCodLancFinanc > 0, então atualiza o lançamento com acumulo de valores, senão insere um novo lançamento.
Metodo    : LancaRateioFinanc
---------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : Divs
Data      : 28/10/2004
Autor     : Alex Pereira
pendência : 17193
Descrição : Segregação de recursos - Implementar a segregação de recursos na origem

Metodo    : LancaRatFinRateio  ==> modificado o escopo para private
            LancaRateioFinanc  ==> implementado sub-método para segregação na origem


---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExcluiFinanceiro
Data      : 24/08/2004
Autor     : Marchetti
Pendência : 14404
Descrição : Colocada a deleção do registro tambem na tabela RELACIONANI, pois estava dando erro de
            constraint
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TestaDispFinanc
Data      : 17/08/2004
Autor     : Fabio Fagundes
Descrição : A TestaDispFinanc passa bloquear qualquer data e não mais somente a
            data em bloqueio - Solicitação Karina Funcef
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : FazerRateioCapCar
Data      : 22/03/2004
Autor     : Marchetti
Pendência : 16119
Descrição : Criado Parametro com data da baixa para lancamento no financeiro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : IncluiContabilidade
Data      : 21/01/2004
Autor     : Alex Pereira
Pendência : 14451 - Nova Segregação
Descrição : Pendente para análise futura - 29/01/04 resolvido
---------------------------------------------------------------------------------------------------}

// Alterado por: André Tavares - pendência 14438

{ --------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 07/10/2003
Autor     : Alex Pereira
Pendência : 14818
Descrição : Incorporados os fontes do Beraldo devido a erros no conceituais.
            Instruido por Rosane, exitiam problemas na troca do status do campo
            MOVIMFINANC.STATUSCONCILIA
---------------------------------------------------------------------------------------------------}

unit uCtrlFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet, classes,
     uDbMovimFinanc, uDbRateioFinanc, uDbRelacionaNI, uGeralFinanc, Wwquery, uCtrlLancamento,
     uDbFluxoPrevisto, uDbFluxoReal, uDbFluxoOrcado, uCtrlModeloHistorico, uListaCamposHistCapCar,
     // Alex 28/10/04 17193
     uCtrlSegregacao,

     // Rodolpho da Silva - P: 19904 - 07/03/2006
     uCtrlPeriodo, uDiasUteis;

type
   TRelacionados = record
                      // Rodolpho ds Silva - P: 24574 - 01/03/2007
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
      // 07/10/03 - by Alex - Pend 14818 - incorporando fontes beraldo
      CtrlModeloHistorico : TCtrlModeloHistorico;
      // 28/10/04 - Alex - 17193
      CtrlSegregacao : TCtrlSegregacao;

      // Rodolpho da Silva - P: 19904 - 07/03/2006
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

      // Alex 28/10 tirado o escopo do método de público para privado 17193
      function LancaRatFinRateio(rUnidNegoc,rMoeCodigo,rIDPessoa,rCodPortador,
                                 rValorCorrente,rValorOutraMoeda:Double;
                                 sCodTipRecDes,sRecPag,sCodCentroRespon: String;
                                 rCodLancFinanc: Double; sCodCentroCusto:String;
                                 rIDPrograma,rIDPatro,rIDPlanoPrev,rCodTipDoc : Double;
                                 // Alex 29/10/04 17193 - nova estrutura RATEIOFINANC.IDSEGREGACRITER
                                 const iIdSegregaCriter: integer): Boolean;


   public
      onlLogFinan: TEventoLogFin; // evento para o log do financeiro

      sSqlRelacionados  : String;
      DadosVazio : OleVariant;

      function GetIntegraDispFin: boolean;
      //Catia p: 22510   - 02/06/2006   - anulada pela pendência 1994   -29/11/06
      //function GetOrcDispFin: boolean;

      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;
      property IntegraDispFinanc: boolean read GetIntegraDispFin;
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
                               //Rodolpho da Silva - P: 23874 - 30/11/2006
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
                                 // Alex 29/10/04 17193 ==> criar a estrutura RATEIOFINANC.IDSEGREGACRITER
                                 const iIdSegregaCriter: Integer = -1;
                                 // Alex 28/10/04 17193 ==> este parâmetro sempre deve ser passado como true.
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
                                 sHstExt : string = ''): Boolean; // andre tavares - pendência 19170

      function FazerRateioDocum(rCodPortador,rCodDocumento: Double; dData: TDateTime;
                                rTotalDocGeral,rTotalDocOMGeral,rSaldoCorrente,rSaldoMoeda,
                                rValorCotacao, rIDPessoa, rIDPlano: Double; var rCodLancFinan :Double;
                                sOperacao, sEntradaSaida,sRecPag: String): Boolean;

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
                              // Rodolpho da Silva - P: 18194 - 05/01/2007
                              rCodPortador: Double): Boolean;

      function GravaFluxoOrc(rIDPessoa: Double; dDataProgramada: TDateTime;
                             sCodTipRecDes, sRecPag, sCodCentroRespon, sPrazo: String;
                             rUnidNeg, rValor, rCodTipDoc: Double): Boolean;


      function TestaDispFinanc(iIdPessoa, iIdUsuario: Integer;
               dDataOper: TDateTime): Boolean;


      // Rodolpho da Silva - P: 24574 - 28/02/2007
      function DesfazerRegularizacao(const iCodLancFinanc,iIdPessoa,iIdModulo: integer): boolean;         


      // 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo
{      function GetHistoricoCapCar(Obj: TCtrlModeloHistorico;
                                  IdPessoa, IdModulo, Tipo: Double;
                                  HistDefault : String;Args: Array of String ) : String;
      procedure SetListaCamposHistCapCar(iTipo: Integer; Lst: TStrings);
}      // Fim 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;


implementation

{ TCtrlFinanc }


constructor TCtrlFinanc.Create(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;
   onlLogFinan := nil;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   FDbMovimFinanc:=TDbMovimFinanc.Create(Self);

   FDbRateioFinanc:=TDbRateioFinanc.Create(Self);

   FDbFluxoPrevisto:=TDbFluxoPrevisto.Create(Self);
   FDbFluxoReal:=TDbFluxoReal.Create(Self);
   FDbFluxoOrcado:=TDbFluxoOrcado.Create(Self);

   FDbRelacionaNI:=TDbRelacionaNI.Create(Self);

   CtrlGeralFinanc:=TGeralFinanc.Create;
   CtrlLancamento:=TCtrlLancamento.Create;

   // 07/10/03 - by Alex - Pend 14818 - incorporando fontes beraldo
   CtrlModeloHistorico:=TCtrlModeloHistorico.Create;

   // 28/10/04 Alex 17193
   CtrlSegregacao := TCtrlSegregacao.Create;


   // Rodolpho da Silva - P: 19904 - 07/03/2006
   CtrlPeriodo := TCtrlPeriodo.Create;


   sSqlRelacionados:='SELECT IDRELACIONANI,CODLANCFINANC, '+

                     // Rodolpho da Silva - P: 24574 - 28/02/2007
                     '       IDMODORIGEMREGU, ' +

                     '       TO_DATE(''01/01/2001'',''dd/mm/yyyy'') AS DATADISP,'+
                     '       FLGNI, '+
                     '       FLGMARCADO '+
                     'FROM RELACIONANI '+
                     'WHERE (1=2) /*+OPTIMIZER_MODE RULE*/';
end;




destructor TCtrlFinanc.Destroy;
begin
   FDbMovimFinanc.Free;
   FDbRateioFinanc.Free;
   FDbRelacionaNI.Free;
   FDbFluxoPrevisto.Free;
   FDbFluxoReal.Free;
   FDbFluxoOrcado.Free;
   CtrlGeralFinanc.Free;
   CtrlLancamento.Free;
   // 07/10/03 - by Alex - Pend 14818 - incorporando fontes beraldo
   CtrlModeloHistorico.Free;
   // 28/10/04 Alex 17193
   CtrlSegregacao.Free;

   // Rodolpho da Silva - P: 19904 - 07/03/2006
   FreeAndNil(CtrlPeriodo);

   inherited;
end;




procedure TCtrlFinanc.AfterInitialize;
begin
   inherited;
   CtrlGeralFinanc.InitializeAs(Self);
   CtrlLancamento.InitializeAs(Self);
   // 07/10/03 - by Alex - Pend 14818 - incorporando fontes beraldo
   CtrlModeloHistorico.InitializeAs(Self);
   // 28/10/04 Alex 17193
   CtrlSegregacao.InitializeAs(Self);

   // Rodolpho da Silva - P: 19904 - 07/03/2006
   CtrlPeriodo.InitializeAs(self);

   CtrlLancamento.OpenTransaction:=False;
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




function TCtrlFinanc.GravaTransFundos(rCodLancDe,
  rCodLancPara: Double): Boolean;
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
   Result:=GetDataPacket('SELECT ' +
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

function TCtrlFinanc.FazerRateioCAPCAR(DadosDocPagRec: OleVariant;
                                       sLugarBaixa,sNumChqBor,sRecPag:String;
                                       dDataFloat: TDateTime;
                                       rNumLote, rCodPortador:Double; var rCodLancFinanc:Double;
                                       rIDPessoa, rIDModulo, rIDUsuario, rIDPlano: Double;
                                       bEstornoDocum, bIntegraContabil: Boolean;
                                       dDataDisp : TDateTime = -1; DataBaixa : TDateTime = 0;
                                       sHstExt: string = ''): Boolean; // andre tavares - pendência 19170
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
   // 07/10/03 - by Alex - Pend 14818
   sNumOP              : String;
   sNumSlip            : String;
   sFavorecido         : String;
   // Fim 07/10/03 - by Alex - Pend 14818
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

   //*** andre tavares - 18/12/2006 - pendencia 23195 - retorna true se ao menos 1 documento do pacote fez lançamento no financeiro
   // Rodolpho - P: 24119 - 04/01/2007
   bFezLanctoFinanc: boolean;


   function FezLancFinanc(ovDados: OleVariant): Boolean; //*** andre tavares - pendencia 23195 - retorna true se ao menos 1 documento do pacote fez lançamento no financeiro
   var
      // Rodolpho da Silva - P:24119 - 04/01/2007
      CdsAux: TClientDataSet;

   begin
     // Rodolpho da Silva - P:24119 - 04/01/2007
     try
        CdsAux      := TClientDataSet.Create(nil);
        CdsAux.Data := ovDados;
        result      := false;

        CdsAux.first;
        if CdsAux.fieldByName('OPERACAO').asString = '2' then // se operação de baixa de documento
        begin
          if CdsAux.recordcount = 1 then //início andré tavares - pendência 24200 - 15/01/2007
          begin
            result := false;


          end;
            while (not CdsAux.eof) and (CdsAux.recordcount > 1) and (not result) do
            begin
              //início andré tavares - pendência 24200 - 15/01/2007 - Não podemos esquecer os estornos e baixas parciais
              _cds.Data := getDataPacket(' SELECT R.CODLANCFINANC FROM RECBTOPAGTO R, MOVIMFINANC M '+
                                         ' WHERE R.CODDOCUMENTO = '+ CdsAux.fieldByName('CODDOCUMENTO').asString +' AND '+
                                         ' M.CODLANCFINANC = R.CODLANCFINANC AND M.FLGESTORNADO IS NULL AND R.NUMCHQBORDERO = '+ quotedStr(sNumChqBor) ); // andré tavares - tem que colocar entre aspas pois em alumas ver do oracle não funciona sem aspas
              //andré tavares - pendência 24315 - 29/01/2007 - adicionado o filtro NUMCHQBORDERO para que funcione também para documento que já tenham alguma baixa parcial


              //início - andre tavares - pendência 24315 - 26/01/2007


              result := (_cds.FieldByName('CODLANCFINANC').asInteger > 0);

              //fim - andre tavares - pendência 24315 - 26/01/2007


              //fim andré tavares - pendência 24200 - 15/01/2007
              CdsAux.next;
            end;
          end;

     finally
        FreeAndNil(CdsAux);
     end;
   end;


begin
   Result:=True;
   MessageInfo:='';
   //sLugarBaixa =>C = quando a baixa é feita pela emissão do cheque
   //               N = quando a baixa é feita pela baixa do documento
   cdsAux:=TCMClientDataSet.Create(nil);
   cdsDocPagRec:=TCMClientDataSet.Create(nil);
   cdsDocumento:=TCMClientDataSet.Create(nil);
   cdsParamCap:=TCMClientDataSet.Create(nil);
   cdsPortadorForma:=TCMClientDataSet.Create(nil);
   cdsFatura:=TCMClientDataSet.Create(nil);
   try
      try
         dDataAux:=dDataFloat;
         if (sRecPag='R') then
          begin
             if DayOfWeek(dDataAux) = 1 then dDataAux:=dDataAux+1;
             if DayOfWeek(dDataAux) = 7 then dDataAux:=dDataAux+2;
          end
         else
          begin
             if DayOfWeek(dDataAux) = 1 then dDataAux:=dDataAux-2;
             if DayOfWeek(dDataAux) = 7 then dDataAux:=dDataAux-1;
          end;

         if (sLugarBaixa='N') and (rNumLote<>0) then
          begin
             cdsAux.Data:=GetDataPacket('SELECT CODLANCFINANC '+
                                         'FROM LOTEPAGTO '+
                                         'WHERE (NUMLOTE = '+FloatToStr(rNumLote)+') ');
             rCodLancFinancAux:=cdsAux.FieldByName('CODLANCFINANC').AsFloat;

             if (rCodLancFinancAux<>0) then
              begin
                 cdsAux.Close;
                 cdsAux.Data:=GetDataPacket('SELECT STATUSCONCILIA '+
                                            'FROM MOVIMFINANC '+
                                            'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinancAux)+') ');

                 if cdsAux.FieldByName('STATUSCONCILIA').AsString = 'C' then
                    Result:=MudaStatusConcilia(sLugarBaixa,0,rCodLancFinancAux);

                 Exit;
              end;
          end;

         cdsParamCap.Data:=GetDataPacket('SELECT HISTPADFINAN '+
                                         'FROM PARAMCAP '+
                                         'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                                         '      (RECPAG = '''+sRecPag+''') ');

         cdsPortadorForma.Data:=GetDataPacket('SELECT P.CODPORTADOR,F.DESCRICAO, P.DESCFINAN '+
                                              'FROM PORTADORFORMA P, FORMARECPAG F '+
                                              'WHERE (P.CODPORTFORMA = '+
                                                      FloatToStr(rCodPortador)+') AND '+
                                              '      (P.CODFORMA = F.CODFORMA)');


         rTotalCorrenteGeral:=0;
         cdsDocPagRec.Data := DadosDocPagRec;
         cdsDocPagRec.First;

         while not(cdsDocPagRec.Eof) do
         begin
            if cdsDocPagRec.FieldByName('DEBCRE').asString = 'D' then
               rTotalCorrenteGeral := rTotalCorrenteGeral + cdsDocPagRec.FieldByName('VALOR').asFloat
            else
               rTotalCorrenteGeral := rTotalCorrenteGeral - cdsDocPagRec.FieldByName('VALOR').asFloat;
            cdsDocPagRec.Next;
         end;

         cdsDocPagRec.First;
         sEntradaSaida:='S';

         if trim(sHstExt) <> '' then // andre tavares - pendência 19170
           sHistorico := trim(sHstExt)
         else begin
           if cdsPortadorForma.FieldByName('DESCFINAN').IsNull then
              sHistorico:=Trim(cdsPortadorForma.FieldByName('DESCRICAO').asString)+
                          ' N. '+Trim(sNumChqBor)
           else
              sHistorico:=Trim(cdsPortadorForma.FieldByName('DESCFINAN').asString)+' N. '+
                          Trim(sNumChqBor);

           if bEstornoDocum then sHistorico := 'ESTORNO '+sHistorico;

           if (cdsDocPagRec.RecordCount=1) then
              sHistorico:=sHistorico + ' ref. doc. '+
                                       Trim(cdsDocPagRec.FieldByName('NODOCUMENTO').AsString)+
                                       Trim(cdsDocPagRec.FieldByName('COMPLDOCUMENTO').AsString)+
                                       ' '+Trim(cdsDocPagRec.FieldByName('NOME').AsString);
         end; //else

         if (rTotalCorrenteGeral<0) then
          begin
             rTotalCorrenteGeral := Abs(rTotalCorrenteGeral);
             sEntradaSaida:='E';
          end;

         // 07/10/03 - by Alex - Pend 14818 - fontes incorporados do beraldo
         //Código provisório até que seja disponibilizado o campo no cdsDocPagRec
         sNumOP:='';
         sNumSlip:='';
         sFavorecido:='';

         if (cdsDocPagRec.Fields.FindField('NUMORDEMPAGO') <> nil ) then
             sNumOP:=cdsDocPagRec.Fields.FindField('NUMORDEMPAGO').AsString;

         if (cdsDocPagRec.Fields.FindField('NUMSLIP') <> nil ) then
             sNumSlip:=cdsDocPagRec.Fields.FindField('NUMSLIP').AsString;

         if (cdsDocPagRec.Fields.FindField('FAVORECIDO') <> nil ) then
             sFavorecido:=cdsDocPagRec.Fields.FindField('FAVORECIDO').AsString;

         sHistorico:=GetHistoricoCapCar(CtrlModeloHistorico,
                                        rIDPessoa,
                                        trunc(rIDModulo),
                                        4,
                                        sHistorico,
                                        [sFavorecido,
                                         sNumChqBor,
                                         sNumOP]);
         // fim 07/10/03 - by Alex - Pend 14818 - fontes incorporados do beraldo

         rPlnCodigo:=0;


         //  Início - Rodolpho da Silva - P: 18549 - 02/02/2005
         try
            cdsVerPortForma      := TCMClientDataSet.Create(nil);
            cdsVerPortForma.Data := GetDataPacket('SELECT LANCAFINANC FROM PORTADORFORMA WHERE CODPORTFORMA = ' + FloatToStr(rCodPortador));

            //  Só insere no financeiro se o PortadorForma estiver habilitado...
            if cdsVerPortForma.FieldByName('LANCAFINANC').AsString = 'S' then
            begin
            //  Fim  - Rodolpho da Silva - P: 18549 - 02/05/2004

              // Rodolpho e Tavares - P: 24119 - 04/01/2007
              bFezLanctoFinanc := FezLancFinanc(cdsDocPagRec.Data);

              // 07/10/03 - by Alex - Pend 14818 - fontes incorporados do beraldo
              if (Trim(sLugarBaixa)='') then sLugarBaixa:='N';

              //*** andre tavares - 18/12/2006 - pendencia 23195 - retorna true se ao menos 1 documento do pacote fez lançamento no financeiro
              if not bFezLanctoFinanc then
              begin
                 if (assigned(onlLogFinan)) and (cdsDocPagRec.Recno = 1) then
                 begin
                   onlLogFinan('');
                   onlLogFinan('////////////////////////////////////////////////////////////////////////////////////////////////////////' );
                   onlLogFinan( dateTimeToStr(now)+ '  ---- Início do Lançamento no Financeiro ----' );
                   onlLogFinan( 'Total de Documentos a Baixar da "Conta Caixa X Forma de Pagamento '+ cdsDocPagRec.fieldByName('CODPORTFORMA').asString + '" = '+ intToStr(cdsDocPagRec.recordCount) );
                  end;

                  Result := LancaFinanceiro(DadosVazio,
                                          rIDModulo,cdsParamCap.FieldByName('HISTPADFINAN').AsFloat,0,
                                          rIDUsuario,cdsPortadorForma.FieldByName('CODPORTADOR').AsFloat,
                                          rIDPessoa,rTotalCorrenteGeral,0,dDataAux,DataBaixa, dDataDisp,sNumChqBor,
                                          sEntradaSaida,sHistorico,sLugarBaixa,rCodLancFinanc,rPlnCodigo,
                                          rIDPlano,bIntegraContabil,
                                         // Rodolpho da Silva - P: 23874 - 30/11/2006
                                          bEstornoDocum
                                         );
                  if not(Result) then
                  begin
                    if assigned(onlLogFinan) then
                      onlLogFinan( ' **** Documento não lançado no financeiro: '+ cdsDocPagRec.fieldByName('CODDOCUMENTO').asString +
                                   stringOfChar(' ', 10 - length(cdsDocPagRec.fieldByName('CODDOCUMENTO').asString))+
                                   ' - Valor: '+ formatFloat('#,##0.00;(#,##0.00)', cdsDocPagRec.FieldByName('VALOR').asFloat) +
                                   stringOfChar(' ', 25 - length(formatFloat('#,##0.00;(#,##0.00)', cdsDocPagRec.FieldByName('VALOR').asFloat))) +
                                   ' - Subtotal '+ formatFloat('#,##0.00;(#,##0.00)', rTotalCorrenteGeral) + ' - Erro: '+ self.MessageInfo);
                    Exit;
                  end
                  else //senão lançou no financeiro, então grava o log de lançamentos do financeiro
                  begin
                    if assigned(onlLogFinan) then
                      onlLogFinan( 'Código do Lanc. Financ.: '+ floatTostr(rCodLancFinanc) + ' - Documento: '+ cdsDocPagRec.fieldByName('CODDOCUMENTO').asString +
                                   stringOfChar(' ', 10 - length(cdsDocPagRec.fieldByName('CODDOCUMENTO').asString))+
                                   ' - Valor: '+ formatFloat('#,##0.00;(#,##0.00)', cdsDocPagRec.FieldByName('VALOR').asFloat) +
                                   stringOfChar(' ', 25 - length(formatFloat('#,##0.00;(#,##0.00)', cdsDocPagRec.FieldByName('VALOR').asFloat))) +
                                   ' - Subtotal '+ formatFloat('#,##0.00;(#,##0.00)', rTotalCorrenteGeral) + ' - Lançamento Financ. OK ');
                  end;
              end;

            //  Início - Rodolpho da Silva - P: 18549 - 02/02/2005
            end;
         finally
            if (assigned(onlLogFinan)) and (cdsDocPagRec.Recno = cdsDocPagRec.RecordCount) then
              onlLogFinan( dateTimeToStr(now)+ ' ---- Fim do Lançamento no Financeiro ----' );

            FreeAndNil(cdsVerPortForma);
         end;
         //  Fim  - Rodolpho da Silva - P: 18549 - 02/05/2004


         // rSaldoDocAux:=0;
         //rSaldoOMAux:=0;
         rTotalDocumento:=0;
         rTotalDocumentoOM:=0;

         // Rodolpho e Tavares - P: 24119 - 04/01/2007
         if not bFezLanctoFinanc then
         begin
            cdsDocPagRec.First;
            while not(cdsDocPagRec.Eof) do
            begin
               rSaldoDoc:=cdsDocPagRec.FieldByName('VALOR').asFloat;
               rSaldoOM :=0;
               cdsDocumento.Data:=GetDataPacket('SELECT RECPAG,CODDOCUMENTO,OPERACAO,NUMFATURA '+
                                                'FROM DOCUMENTO '+
                                                'WHERE (CODDOCUMENTO = '+FloatToStr(
                                                cdsDocPagRec.FieldByName('CODDOCUMENTO').AsFloat)+') ');

               if (StrToIntDef(cdsDocumento.FieldByName('OPERACAO').AsString,0) in [1,2,10,11,12,14,15,16]) then
                begin
                   FazerAcumulaRateio(cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat,
                                      rTotalDocumento,rTotalDocumentoOM);
                   rTotalDocGeral:=rTotalDocumento;
                   rTotalDocOMGeral:=rTotalDocumentoOM;

                   Result:=FazerRateioDocum(cdsPortadorForma.FieldByName('CODPORTADOR').AsFloat,
                                            cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat,
                                            dDataFloat,rTotalDocGeral,rTotalDocOMGeral,rSaldoDoc,
                                            rSaldoOM,0,rIDPessoa,rIDPlano,rCodLancFinanc,'MF',
                                            sEntradaSaida,sRecPag);
                   if not(Result) then Exit;
                end
               else
                begin
                   cdsFatura.Data:=GetDataPacket('SELECT D.CODDOCUMENTO, L.VALOR, L.VALOROUTRAMOEDA '+
                                                 'FROM DOCUMENTO D, LANCTODOCUM L '+
                                                 'WHERE (D.NUMFATURA = '+FloatToStr(
                                                   cdsDocumento.FieldByName('NUMFATURA').AsFloat)+') AND '+
                                                 '      (RTRIM(D.OPERACAO) = ''1'' OR '+
                                                 '       RTRIM(D.OPERACAO) = ''11'') AND '+
                                                 '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                                                 '      (D.OPERACAO = L.OPERACAO)');
                   rTotalDocGeral  :=0;
                   rTotalDocOMGeral:=0;

                   cdsFatura.First;
                   while not(cdsFatura.eof) do
                   begin
                      FazerAcumulaRateio(cdsFatura.FieldByName('CODDOCUMENTO').AsFloat,
                                         rTotalDocumento,rTotalDocumentoOM);

                      rTotalDocGeral:=rTotalDocGeral+rTotalDocumento;
                      rTotalDocOMGeral:=rTotalDocOMGeral+rTotalDocumentoOM;
                      cdsFatura.Next;
                   end;

                   rSaldoTot:=0;
                   rSaldoTotOM:=0;

                  cdsFatura.First;
                  while not(cdsFatura.eof) do
                  begin

                     if (rTotalDocGeral<>0) then
                        rSaldoDocAux:=cdsFatura.FieldByName('VALOR').asFloat*rSaldoDoc/rTotalDocGeral
                     else
                        rSaldoDocAux :=rSaldoDoc;

                     if (rTotalDocOMGeral<>0) then
                        rSaldoOMAux:=cdsFatura.FieldByName('VALOROUTRAMOEDA').asFloat*rSaldoOM/rTotalDocOMGeral
                     else
                        rSaldoOMAux:=rSaldoOM;

                     rSaldoDocAux:=StrToFloat(Format('%17.2f',[rSaldoDocAux]));
                     rSaldoOMAux:=StrToFloat(Format('%17.2f',[rSaldoOMAux]));

                     rSaldoTot:=rSaldoTot+rSaldoDocAux;
                     rSaldoTotOM:=rSaldoTotOM+rSaldoOMAux;

                     Result:=FazerRateioDocum(cdsPortadorForma.FieldByName('CODPORTADOR').AsFloat,
                                              cdsFatura.FieldByName('CODDOCUMENTO').AsFloat,
                                              dDataFloat,rTotalDocGeral,rTotalDocOMGeral,rSaldoDocAux,
                                              rSaldoOMAux,0,rIDPessoa,rIDPlano,rCodLancFinanc,'MF',
                                              sEntradaSaida,sRecPag);
                     if not(Result) then Exit;

                     cdsFatura.Next;
                  end;
               end;
               cdsDocPagRec.Next;
            end;
         end;
      finally
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
                                      rSaldoCorrente,rSaldoMoeda,rValorCotacao,
                                      rIDPessoa, rIDPlano: Double;
                                      var rCodLancFinan :Double;
                                      sOperacao,sEntradaSaida,sRecPag: String): Boolean;
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
begin
   Result:=True;
   MessageInfo:='';
   iDigCAR := 0;
   iDigCAP := 0;

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
                                               '      (D.OPERACAO = L.OPERACAO) ')
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
                                               '      (D.CODDOCUMENTO = R.CODDOCUMENTO) ');
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

         cdsRateioDocum.First;
         sCodTipRecDes:=cdsRateioDocum.FieldByName('CODTIPRECDES').asString;
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

            // Rosane Alterou aqui 20/02/2002
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
                  rPropRateio:=cdsRateioDocum.fieldbyname('VALOR').asfloat/rTotalDocGeral*rSaldoCorrente;

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
                       rPropRateioPerc:=StrToFloat(FormatFloat('#0.00',rPropRateioPerc));
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


                    rPropRateio:=StrToFloat(FormatFloat('#0.00',rPropRateio));
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

                rPropRateio:=StrToFloat(FormatFloat('#0.00',rPropRateio));
                rTotGer:=rTotGer+rPropRateio;

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
            cdsRateioDocum.Next;
         end;

         rPropRateio:=0;
         if (rValorCotacao<>0) and (rTotalDocOMGeral<>0) and (rSaldoMoeda<>0) then
          begin
             if (rTotGer<>rSaldoMoeda) then rPropRateio:=rSaldoMoeda-rTotGer;
          end
         else
          if (rTotGer<>rSaldoCorrente) then rPropRateio:=rSaldoCorrente-rTotGer;

         // Rodolpho da Silva - P: 25718 - 28/06/2007
         //if (rPropRateio<>0) then
         if ((rPropRateio<>0) and (not cdsRateioDocum.IsEmpty)) then
         begin
            cdsRateioDocum.First;
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
         end;
      finally
         //Destrói Cds's
         cdsAux.Free;
         cdsParamFinanc.Free;
         cdsRateioDocum.Free;
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
                 // Marchetti - Pendencia 14404
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

                 // Marchetti - Pendencia 14404
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
  //Rodolpho da Silva - P: 23874 - 30/11/2006
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
      // inicio - Andre tavares - pendência 18013 - faz igula no lançamento contábil, se rColancFinanc > 0 então somente atualiza com acumulo de valores
      if rCodLancFinanc > 0 then begin   // carregar os atributos antes da alteração
        FDbMovimFinanc.Codlancfinanc.AsFloat := rCodLancFinanc;
        FDbMovimFinanc.LoadFromDb;

        // Rodolpho da Silva - P: 23874 - 30/11/2006
        if bEstorno then
           FDbMovimFinanc.FlgEstornado.AsString := 'S';

        FDbMovimFinanc.Valorlancfinan.AsFloat := FDbMovimFinanc.Valorlancfinan.AsFloat + rValorCorrente;
        FDbMovimFinanc.Valoroutramoeda.AsFloat := FDbMovimFinanc.Valoroutramoeda.AsFloat+rValorOutraMoeda;
        Result:=FDbMovimFinanc.Update;
      end else begin   // senão insere um novo lançamento no financeiro
      // fim - Andre tavares - pendência 18013

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

        // Rodolpho da Silva - P: 23874 - 30/11/2006
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
  // Alex 29/10/04 17193 ==> criar a estrutura RATEIOFINANC.IDSEGREGACRITER
  const iIdSegregaCriter: Integer;
  // Alex 28/10/04 17193 ==> este parâmetro sempre deve ser passado como true.
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

         // Alex 29/10/04 17193
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
                rValorRateio:=StrToFloat(FormatFloat('#0.00',rValorRateio));

                //Adiciona valor ao total
                rTotGer:=rTotGer+rValorRateio;

                rValorOMRateio:=rValorOutraMoeda*(cdsAux.FieldByName('PERCRATEIO').AsFloat/100);
                //Acerta casas decimais
                rValorOMRateio:=StrToFloat(FormatFloat('#0.00',rValorOMRateio));

                //Adiciona valor da outra moeda ao total de outra moeda
                rTotOMGer:=rTotOMGer+rValorOMRateio;

                Result:= LancaRatFinRateio(cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                           rMoeCodigo,rIDPessoa,rCodPortador,
                                           rValorRateio,rValorOMRateio,sCodTipRecDes,
                                           sRecPag,sCodCentroRespon,
                                           rCodLancFinanc,sCodCentroCusto,
                                           rIDPrograma,rIDPatro,rIDPlanoPrev,
                                           rCodTipDoc,
                                           // Alex 29/10/04 17193 nova estrutura RATEIOFINANC.SEGREGACRITER
                                           iIdSegregaCriter);

                if not(Result) then Exit;

                cdsAux.Next;
             end;

            //Gera lançamento de diferença, caso exista
            if (rTotGer <> rValorCorrente) or (rTotOMGer <> rValorOutraMoeda) then
             begin
                 rValorRateio:=rValorCorrente-rTotGer;
                 rValorOMRateio:=rValorOutraMoeda-rTotOMGer;

                 cdsAux.First;

                 Result:=LancaRatFinRateio(cdsAux.FieldByName('UNIDNEGOC').AsInteger,
                                           rMoeCodigo,rIDPessoa,rCodPortador,
                                           rValorRateio,rValorOMRateio,sCodTipRecDes,
                                           sRecPag,sCodCentroRespon,
                                           rCodLancFinanc,sCodCentroCusto,
                                           rIDPrograma,rIDPatro,rIDPlanoPrev,
                                           rCodTipDoc,
                                           // Alex 29/10/04 17193 nova estrutura RATEIOFINANC.SEGREGACRITER
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
                                        // Alex 29/10/04 17193 nova estrutura RATEIOFINANC.SEGREGACRITER
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
  // Alex 29/10/04 17193 - nova estrutura RATEIOFINANC.IDSEGREGACRITER
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

             // Alex 29/10/04 17193 - nova estrutura RATEIOFINANC.IDSEGREGACRITER
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
                                                      cdsContabAux.FieldByName('IDPLANOPREV').AsFloat,
                                                      cdsContabAux.FieldByName('IDPATRO').AsFloat,
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
                                                      // 29/01/04 Alex 14451
                                                      cdsContabAux.FieldByName('IDSEGREGACRITER').AsInteger,
                                                      dDataLanc)
                else
                   Result:=CtrlLancamento.InsereLancaContab('2',
                                                      rIDPessoa,rIDModulo,rIDUsuario,rIDPlano,
                                                      rUnidNegoc,rSubContaDeb,rSubContaCre,
                                                      cdsContabAux.FieldByName('IDPLANOPREV').AsFloat,
                                                      cdsContabAux.FieldByName('IDPATRO').AsFloat,
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
                                                      // 29/01/04 Alex 14451
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
             Result := CtrlLancamento.EstornaLancaContab(rIDUsuario,
                                                         cdsMovim.FieldByName('PLNCODIGO').AsFloat,
                                                         rIDModulo,
                                                         rIDPessoa,F_bUsaPlanoPatro,
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
                                       cdsRateio.FieldByName('IDPATRO').AsFloat,
                                       cdsRateio.FieldByName('IDPLANOPREV').AsFloat,
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
             //e obtem o CODLANCFINANC
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
   MessageInfo:='';

   sSql:='UPDATE MOVIMFINANC SET STATUSCONCILIA = '''+sStatus+''' ';

   if dDataConcilia <> 0 then
      sSql:=sSql+',DATACONCILIACAO = TO_DATE('''+
            FormatDateTime('dd/mm/yyyy',dDataConcilia)+''',''dd/MM/yyyy'') '
   else
      sSql:=sSql +',DATACONCILIACAO = NULL ';

   sSql:=sSql+' WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') AND '+
              '       (STATUSCONCILIA <> ''X'') ';

   Result:=ExecSQL(sSql);
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
   cdsAux:=TCMClientDataSet.Create(nil);
   try
      cdsAux.Data:=GetDataPacket('SELECT SUM(VALOR) AS SomaValor, SUM(VALOROUTRAMOEDA) AS SomaOutra '+
                                 'FROM RATEIODOCUM WHERE (CODDOCUMENTO = '+FloatToStr(rCodDocumento)+') ');
      rTotalDocumento:=cdsAux.FieldByName('SomaValor').AsFloat;
      rTotalDocOM:=cdsAux.FieldByName('SomaOutra').AsFloat;
   finally
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

         // Rodolpho da Silva - P: 21257 - 16/01/2006
         //Gera IDRELACIONANI
         //rIDRelacionaNI:=GetSequence('RELACIONANI');

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

            //Atribui o IDRELACIONANI
            {cdsRelacionados.Edit;
            cdsRelacionados.FieldByName('IDRELACIONANI').AsFloat:=rIDRelacionaNI;
            cdsRelacionados.Post; }

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

            // Rodolpho da Silva - P: 24574 - 01/03/2007
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
//início - André Tavares - pendência 14438
             else
                FDbFluxoPrevisto.Flgprevisao.AsString:= '';
//Fim - André Tavares

{
             if FDbFluxoPrevisto.valor.asFloat = 1562 then
                FDbFluxoPrevisto.valor.asFloat := FDbFluxoPrevisto.valor.asFloat;
}
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

         // Rodolpho da Silva - P: 18194 - 05/01/2007
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

             // Rodolpho da Silva - P: 18194 - 05/01/2007
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
   sSql := 'SELECT FLGINTDISPFIN FROM PARAMFINANC WHERE IDPESSOA = ' +
FloatToStr(F_rIDPessoa);

    _cds.Data := GetDataPacket(sSql);
   if Not _cds.isEmpty Then
   begin
      if _cds.FieldByName('FLGINTDISPFIN').AsString = 'Y' then
         Result := True
      else
         Result := False;
   end;
 end;  
 //Catia p: 22510   - 02/06/2006   - anulada pela pendência 1994   -29/11/06
//function TCtrlFinanc.GetOrcDispFin: boolean;
//var
//  sSql :string;
//begin
//   sSql := 'SELECT FLGORCXDTDISP FROM PARAMFINANC WHERE IDPESSOA = ' +
//FloatToStr(F_rIDPessoa);

//    _cds.Data := GetDataPacket(sSql);
//   if Not _cds.isEmpty Then
//   begin
//      if _cds.FieldByName('FLGORCXDTDISP').AsString = 'Y' then
//         Result := True
//      else
//         Result := False;
//   end;
//end;




function TCtrlFinanc.TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                                           dDataOper : TDateTime): Boolean;
var
   sSql,fDispBloq,fUsuBloq : string;
   dDataDisp : TDateTime;
begin
   Result := True;

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

      // Rodolpho da Silva - Início - P: 19904 - 07/03/2006
      // 2-Se o CFinan estiver integrado com a contabilidade, verifica
      //se o período contábil está bloqueado
      // catia p:22482 - 30/05/2006 - inicio
{      _Cds.Data := GetDataPacket('SELECT INTEGRACONTAB FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr(iIdPessoa));
      if (_Cds.FieldByName('INTEGRACONTAB').AsString = 'S') then
      begin
         with TDiasUteis.Create do
         try
            if CtrlPeriodo.TestaPeriodoBloqueado(iIdPessoa,tbBloqOuInt,ExtraiMes(dDataOper),
                                                     ExtraiAno(dDataOper),False) then
            begin
               MessageInfo := 'Não foi possível lançar no financeiro. Período contábil bloqueado/integrado!';
               Result      := False;
            end;
         finally
            Free;
         end;
      end;
}      // Rodolpho da Silva - Fim - P: 19904 - 07/03/2006
//fim cátia p:22482
   end;

end;




// 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo
{function TCtrlFinanc.GetHistoricoCapCar(Obj: TCtrlModeloHistorico;
  IdPessoa, IdModulo, Tipo: Double; HistDefault: String;
  Args: array of String): String;
var
   x : Integer;
begin
   //Pega a lista de Campos referente ao tipo de Modelo
   SetListaCamposHistCapCar( Trunc(Tipo), Obj.FieldNames );

   //Prenche os valores referente aos campos da lista
   Obj.FieldValues.Clear;

   for x:= 0 to High( Args ) do
       Obj.FieldValues.add( Args[x] );

   Result := Obj.GetHistorico(Trunc(IdPessoa),Trunc(IdModulo),Trunc(Tipo),HistDefault);
end;

procedure TCtrlFinanc.SetListaCamposHistCapCar(iTipo: Integer;
  Lst: TStrings);
begin
   Lst.Clear;
   case iTipo of
      0, 3: begin //Baixa de Documento
               Lst.Add('Nº do Documento');
               Lst.Add('Complemento');
               Lst.Add('Razão Social');
               Lst.Add('Descrição do Lançamento');
               Lst.Add('Nº do Cheque\Borderô');
               Lst.Add('Nº do SLIP');
               Lst.Add('Nº Ordem de Pago');
               Lst.Add('Histórico Complementar');
            end;
         1: begin  //Lançamento de Documentos
               Lst.Add('Nº do Documento');
               Lst.Add('Complemento');
               Lst.Add('Razão Social');
               Lst.Add('Descrição do Lançamento');
               Lst.Add('Data de Vencimento');
               Lst.Add('Histórico Complementar');
            end;
         2: begin //Lançamento de Alteradores
               Lst.Add('Nº do Documento');
               Lst.Add('Complemento');
               Lst.Add('Razão Social');
               Lst.Add('Descrição do Lançamento');
               Lst.Add('Histórico Complementar');
            end;
         4: begin
               Lst.Add('Favorecido');
               Lst.Add('Nº do Cheque\Borderô');
               Lst.Add('Nº do Ordem de Pago');
            end;
   end;
end;
}// fim 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo




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
                                                                 // Rodolpho da Silva - P: 25587 - 12/06/2007
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

end.
