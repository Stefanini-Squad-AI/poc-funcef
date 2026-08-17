//******************************************************************************
// Autor     : Marco Turon
// Data      : 28/05/2008
// Código    : AL_1
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Desenvolvimento da nova Ctrl
//******************************************************************************
unit uCtrlEmpAcoes;

interface

uses Windows, sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     Messages, uCMClientDataSet, uCMTypes, uCMFileUtils,
     uCtrlPadroes, uCtrlRendaVariavel, uCtrlParamInvest, uCtrlInvContab,
     uDBOperEmpAcoes, uDBHistEmpAcoes, uOperComum, uFuncoesInvest,
     Wwquery, URegra, uCtrlRegra, uTiposRegraMT, uDbLancVigEmp ;

type

   {*****************************************************************************
     > TCTRLPERSISTENTOBJECT
     Classe ancestral para persistência de dados em funções de acesso as
     classes de persistência de forma que essas fiquem em escopo privado a
     classe de controle.
   *****************************************************************************}
   TCtrlPersistentObject = Class
   private
     //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
     _Cds: TCMClientDataSet;
     fOwner: TCmControlObject;
     FDataBaseName: String;
   protected
     procedure SetDataBaseName(const Value: String); Virtual;
     procedure Clear; Virtual;
   public
     Constructor Create(Aowner: TCmControlObject); Virtual;
     Destructor Destroy; Override;
     property Owner: TCmControlObject read fOwner;
     property DataBaseName: String read FDataBaseName write SetDataBaseName;
   End;

//***************************************************************************
//  > BUSCA SALDOS - Inicio
//*****************************************************************************
   TBuscaSaldoEmp = Class(TCtrlPersistentObject)
   private
      FHSSldPriEmp: Double;
      FHSVlrMovEmp: Double;
      FOPPUOperacao: Double;
      FHSVlrFinEmp: Double;
      FOPTaxaOperacao: Double;
      FOPVlrResgate: Double;
      FHSSldJurEmp: Double;
      FHSVlrJurEmp: Double;
      FHSVlrJEsEmp: Double;
      FHSVlrPriEmp: Double;
      FHSSldVlrEmp: Double;
      FHSSldFinEmp: Double;
      FOPVlrOperacao: Double;
      FHSIDTipoOperacao: Integer;
      FHSIDOperEmpAcoes: Integer;
      FHSIDOperEmpAcoesAP: Integer;
      FHSIDCarteiraInvest: Integer;
      FHSSldQtdEmp: Integer;
      FHSIDHistEmpAcoes: Integer;
      FPPIDPlanPrevCtbPatr: Integer;
      FHSQtdMovEmp: Integer;
      FHSIDInvestimento: Integer;
      FOPQtdOperacao: Integer;
      FHSIDCustodiante: Integer;
      FOPFlgPreco: String;
      FPPPlanPrevCtbPatr: String;
      FHSNaturMov: String;
      FOPFlgReversao: String;
      FTPFlgGeraContab: String;
      FIVDescInvestimento: String;
      FTPDescTipoOperacao: String;
      FTPCodTipDoc: String;
      FTPFlgGeraCapCar: String;
      FOPDataOperacao: TDateTime;
      FOPDataVencOpe: TDateTime;
      FHSDataHistEmpAcoes: TDateTime;
      FINVSaldoQtdCC: Integer;
      FINVSaldoQtdCCI: Integer;
      procedure SetHSDataHistEmpAcoes(const Value: TDateTime);
      procedure SetHSIDCarteiraInvest(const Value: Integer);
      procedure SetHSIDCustodiante(const Value: Integer);
      procedure SetHSIDHistEmpAcoes(const Value: Integer);
      procedure SetHSIDInvestimento(const Value: Integer);
      procedure SetHSIDOperEmpAcoes(const Value: Integer);
      procedure SetHSIDOperEmpAcoesAP(const Value: Integer);
      procedure SetHSIDTipoOperacao(const Value: Integer);
      procedure SetHSNaturMov(const Value: String);
      procedure SetHSQtdMovEmp(const Value: Integer);
      procedure SetHSSldFinEmp(const Value: Double);
      procedure SetHSSldJurEmp(const Value: Double);
      procedure SetHSSldPriEmp(const Value: Double);
      procedure SetHSSldQtdEmp(const Value: Integer);
      procedure SetHSSldVlrEmp(const Value: Double);
      procedure SetHSVlrFinEmp(const Value: Double);
      procedure SetHSVlrJEsEmp(const Value: Double);
      procedure SetHSVlrJurEmp(const Value: Double);
      procedure SetHSVlrMovEmp(const Value: Double);
      procedure SetHSVlrPriEmp(const Value: Double);
      procedure SetIVDescInvestimento(const Value: String);
      procedure SetOPDataOperacao(const Value: TDateTime);
      procedure SetOPDataVencOpe(const Value: TDateTime);
      procedure SetOPFlgPreco(const Value: String);
      procedure SetOPFlgReversao(const Value: String);
      procedure SetOPPUOperacao(const Value: Double);
      procedure SetOPQtdOperacao(const Value: Integer);
      procedure SetOPTaxaOperacao(const Value: Double);
      procedure SetOPVlrOperacao(const Value: Double);
      procedure SetOPVlrResgate(const Value: Double);
      procedure SetPPIDPlanPrevCtbPatr(const Value: Integer);
      procedure SetPPPlanPrevCtbPatr(const Value: String);
      procedure SetTPCodTipDoc(const Value: String);
      procedure SetTPDescTipoOperacao(const Value: String);
      procedure SetTPFlgGeraCapCar(const Value: String);
      procedure SetTPFlgGeraContab(const Value: String);
      procedure SetINVSaldoQtdCC(const Value: Integer);
      procedure SetINVSaldoQtdCCI(const Value: Integer);

   public
      //----------------  Métodos Próprios  ------------------------------------
      Constructor Create(Aowner: TCmControlObject); Override;
      Destructor Destroy; Override;

      //----------------  Métodos de Listagem  ---------------------------------
      function ListSldEmpAcoes(dDataSaldo: TDateTime;
                               iOperEmpAp: Integer = -1;
                               iInvestimento: Integer = -1;
                               iPlanoPatro: Integer = -1): OleVariant;

      function ListSldQtdInvEmpAcoes(dDataSaldo: TDateTime;
                                     iInvestimento: Integer;
                                     iPlanoPatro: Integer = -1;
                                     iCustodiante: Integer = -1;
                                     iTipoConta: Integer = 0): OleVariant;

      //----------------  Métodos de Busca  ------------------------------------
      function Executa(dDataSaldo: TDateTime;
                       iOperEmpAP: Integer = -1;
                       iInvestimento: Integer = -1;
                       iPlanoPatro: Integer = -1): Boolean;

      function ExecutaQtdInv(dDataSaldo: TDateTime;
                             iInvestimento: Integer;
                             iPlanoPatro: Integer = -1;
                             iCustodiante: Integer = -1): Boolean;

      //----------------  Properties  ------------------------------------------
      property HSIDHistEmpAcoes: Integer read FHSIDHistEmpAcoes write SetHSIDHistEmpAcoes;         //HS.IDHISTEMPACOES
      property HSIDOperEmpAcoes: Integer read FHSIDOperEmpAcoes write SetHSIDOperEmpAcoes;         //HS.IDOPEREMPACOES
      property HSIDOperEmpAcoesAP: Integer read FHSIDOperEmpAcoesAP write SetHSIDOperEmpAcoesAP;   //HS.IDOPEREMPACOESAP
      property HSDataHistEmpAcoes: TDateTime read FHSDataHistEmpAcoes write SetHSDataHistEmpAcoes; //HS.DATAHISTEMPACOES
      property HSVlrMovEmp: Double read FHSVlrMovEmp write SetHSVlrMovEmp;                         //HS.VLRHISTEMPACOES
      property HSSldVlrEmp: Double read FHSSldVlrEmp write SetHSSldVlrEmp;                         //HS.SLDHISTEMPACOES
      property HSQtdMovEmp: Integer read FHSQtdMovEmp write SetHSQtdMovEmp;                        //HS.QTDHISTEMPACOES
      property HSSldQtdEmp: Integer read FHSSldQtdEmp write SetHSSldQtdEmp;                        //HS.SLDQTDHISTEMPACOE
      property HSVlrPriEmp: Double read FHSVlrPriEmp write SetHSVlrPriEmp;                         //HS.VLRPRINCIPAL
      property HSSldPriEmp: Double read FHSSldPriEmp write SetHSSldPriEmp;                         //HS.SLDPRINCIPAL
      property HSVlrJurEmp: Double read FHSVlrJurEmp write SetHSVlrJurEmp;                         //HS.VLRJUROS
      property HSVlrJEsEmp: Double read FHSVlrJEsEmp write SetHSVlrJEsEmp;                         //HS.VLRJUROSEST
      property HSSldJurEmp: Double read FHSSldJurEmp write SetHSSldJurEmp;                         //HS.SLDJUROS
      property HSVlrFinEmp: Double read FHSVlrFinEmp write SetHSVlrFinEmp;                         //HS.VLRFINAL
      property HSSldFinEmp: Double read FHSSldFinEmp write SetHSSldFinEmp;                         //HS.SLDFINAL
      property HSNaturMov: String read FHSNaturMov write SetHSNaturMov;                            //HS.NATURMOV
      property HSIDTipoOperacao: Integer read FHSIDTipoOperacao write SetHSIDTipoOperacao;         //HS.IDTIPOOPERACAO
      property HSIDInvestimento: Integer read FHSIDInvestimento write SetHSIDInvestimento;         //HS.IDINVESTIMENTO
      property HSIDCarteiraInvest: Integer read FHSIDCarteiraInvest write SetHSIDCarteiraInvest;   //HS.IDCARTEIRAINVEST
      property HSIDCustodiante: Integer read FHSIDCustodiante write SetHSIDCustodiante;            //HS.IDCUSTODIANTE

      property OPDataOperacao: TDateTime read FOPDataOperacao write SetOPDataOperacao;             //OP.DATAOPERACAO
      property OPTaxaOperacao: Double read FOPTaxaOperacao write SetOPTaxaOperacao;                //OP.TAXAOPERACAO
      property OPQtdOperacao: Integer read FOPQtdOperacao write SetOPQtdOperacao;                  //OP.QTDOPERACAO
      property OPPUOperacao: Double read FOPPUOperacao write SetOPPUOperacao;                      //OP.PUOPERACAO
      property OPVlrOperacao: Double read FOPVlrOperacao write SetOPVlrOperacao;                   //OP.VLROPERACAO
      property OPDataVencOpe: TDateTime read FOPDataVencOpe write SetOPDataVencOpe;                //OP.DATAVENCOPER
      property OPFlgReversao: String read FOPFlgReversao write SetOPFlgReversao;                   //OP.FLGREVERSAO
      property OPFlgPreco: String read FOPFlgPreco write SetOPFlgPreco;                            //OP.FLGPRECO
      property OPVlrResgate: Double read FOPVlrResgate write SetOPVlrResgate;                      //OP.VLRRESGATE

      property IVDescInvestimento: String read FIVDescInvestimento write SetIVDescInvestimento;    //IV.DESCINVESTIMENTO

      property TPDescTipoOperacao: String read FTPDescTipoOperacao write SetTPDescTipoOperacao;    //TP.DESCTIPOOPERACAO
      property TPFlgGeraContab: String read FTPFlgGeraContab write SetTPFlgGeraContab;             //TP.FLGGERACONTAB
      property TPFlgGeraCapCar: String read FTPFlgGeraCapCar write SetTPFlgGeraCapCar;             //TP.FLGGERACAPCAR
      property TPCodTipDoc: String read FTPCodTipDoc write SetTPCodTipDoc;                         //TP.CODTIPDOC

      property PPIDPlanPrevCtbPatr: Integer read FPPIDPlanPrevCtbPatr write SetPPIDPlanPrevCtbPatr;//PP.IDPLANPREVCTBPATR
      property PPPlanPrevCtbPatr: String read FPPPlanPrevCtbPatr write SetPPPlanPrevCtbPatr;       //PP.PLANPRVCONTABPATRO

      property INVSaldoQtdCC: Integer read FINVSaldoQtdCC write SetINVSaldoQtdCC;
      property INVSaldoQtdCCI: Integer read FINVSaldoQtdCCI write SetINVSaldoQtdCCI;


   protected


   end;
//*****************************************************************************

//*****************************************************************************
//  > CtrlEmpAcoes - Inicio
//*****************************************************************************
   TCtrlEmpAcoes = Class(TCmControlObject)
   private
      CtrlRV: TCtrlRendaVariavel;
      FBuscaSaldoEmp: TBuscaSaldoEmp;
      FIdOperEmpAcoes: Integer;
      FIdHistEmpAcoes: Integer;
      FCdsOperEmpAcoes: TClientDataSet;
      FCdsResgEmpAcoes: TClientDataSet;
      FDBOperEmpAcoes: TDbOperEmpAcoes;
      FCdsHistEmpAcoes: TClientDataSet;
      FDBHistEmpAcoes: TDbHistEmpAcoes;
      FSaldoQtdCCI: Integer;
      FSaldoQtdCC: Integer;
      FCotacaoValor: Double;
      FCotacaoLote: Integer;
      FCotacaoData: TDateTime;
      FRegraResult: Double;
      FPlano: Integer;
      FPlanilha: Integer;
      FDocumento: Integer;

     //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      FCdsLancVigEmp: TClientDataSet;
      FDbLancVigEmp : TDbLancVigEmp;

      procedure SetBuscaSaldoEmp(const Value: TBuscaSaldoEmp);
      procedure SetIdOperEmpAcoes(const Value: Integer);
      procedure SetIdHistEmpAcoes(const Value: Integer);
      procedure SetCdsOperEmpAcoes(const Value: TClientDataSet);
      procedure SetCdsResgEmpAcoes(const Value: TClientDataSet);
      procedure SetDBOperEmpAcoes(const Value: TDbOperEmpAcoes);
      procedure SetCdsHistEmpAcoes(const Value: TClientDataSet);
      procedure SetDBHistEmpAcoes(const Value: TDbHistEmpAcoes);
      procedure SetSaldoQtdCC(const Value: Integer);
      procedure SetSaldoQtdCCI(const Value: Integer);
      procedure SetCotacaoData(const Value: TDateTime);
      procedure SetCotacaoLote(const Value: Integer);
      procedure SetCotacaoValor(const Value: Double);
      procedure SetRegraResult(const Value: Double);
      procedure SetPlano(const Value: Integer);
      procedure SetDocumento(const Value: Integer);
      procedure SetPlanilha(const Value: Integer);

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      procedure SetCdsLancVigEmp(const Value: TClientDataSet);
      procedure SetDbLancVigEmp(const Value: TDbLancVigEmp);

   public
      AtualizaProcesso: procedure(sMsg: String = ''; iMax: Integer = -1) of object;

      //----------------  Métodos Próprios  ------------------------------------
      constructor Create; override;
      destructor Destroy; override;

      //----------------  Objeto BUSCASALDOS  ----------------------------------
      property BuscaSaldoEmp: TBuscaSaldoEmp read FBuscaSaldoEmp write SetBuscaSaldoEmp;

      //----------------  Objetos para cadastros  ------------------------------
      property CdsOperEmpAcoes: TClientDataSet read FCdsOperEmpAcoes write SetCdsOperEmpAcoes;
      property CdsResgEmpAcoes: TClientDataSet read FCdsResgEmpAcoes write SetCdsResgEmpAcoes;
      property DBOperEmpAcoes: TDbOperEmpAcoes read FDBOperEmpAcoes write SetDBOperEmpAcoes;
      property CdsHistEmpAcoes: TClientDataSet read FCdsHistEmpAcoes write SetCdsHistEmpAcoes;
      property DBHistEmpAcoes: TDbHistEmpAcoes read FDBHistEmpAcoes write SetDBHistEmpAcoes;


      //----------------  Objetos Diversos     ---------------------------------
      property IdOperEmpAcoes: Integer read FIdOperEmpAcoes write SetIdOperEmpAcoes;
      property IdHistEmpAcoes: Integer read FIdHistEmpAcoes write SetIdHistEmpAcoes;

      property SaldoQtdCC: Integer read FSaldoQtdCC write SetSaldoQtdCC;
      property SaldoQtdCCI: Integer read FSaldoQtdCCI write SetSaldoQtdCCI;

      property CotacaoData: TDateTime read FCotacaoData write SetCotacaoData;
      property CotacaoValor: Double read FCotacaoValor write SetCotacaoValor;
      property CotacaoLote: Integer read FCotacaoLote write SetCotacaoLote;

      property RegraResult: Double read FRegraResult write SetRegraResult;

      property Plano: Integer read FPlano write SetPlano;
      property Planilha: Integer read FPlanilha write SetPlanilha;
      property Documento: Integer read FDocumento write SetDocumento;

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      property CdsLancVigEmp : TClientDataSet read FCdsLancVigEmp write SetCdsLancVigEmp;
      property DbLancVigEmp  : TDbLancVigEmp read FDbLancVigEmp write SetDbLancVigEmp;

      //----------------  Métodos de Listagem  ---------------------------------
      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      function ListOperEmpAcoes(iOperEmpAcoes: Integer = 0; sNumContratro : String = ''): OleVariant;
      function ListOperHistEmpAcoes(iOperEmpAcoesAp: Integer = 0; sNumContratro : String = ''): OleVariant;
      function ListOperResgEmpAcoes(iOperEmpAcoesAp: Integer = 0; sNumContratro : String = ''): OleVariant;
      function ListRelBoleta(iOperEmpAcoes: Integer = 0): OleVariant;

      //----------------  Métodos de Update em Banco  --------------------------
      function GravaOperEmpAcoes: Boolean;
      function ExcluiOperEmpAcoes: Boolean;
      function GravaHistEmpAcoes(iOperEmpAcoes: Integer = -1;
                                 dDataProc: TDateTime = 0; iOperAP: Integer = -1; iInv: Integer = -1; iPlano: Integer = -1;
                                 fValor: Double = 0): Boolean;

      function AtualizaEmpAcoes(dDataProc: TDateTime;
                                iPlano: Integer = -1; iInv: Integer = -1; iOperAplic: Integer = -1): Boolean;

      function ExcluiHistoricos(dDataRef: TDateTime; iOperEmpAcoes: Integer; iHistorico: Integer = -1; bExcluiFuturo: Boolean = True): Boolean;

      //----------------  Métodos Diversos  ------------------------------------
      function GetSequence(Sufixo: String): Cardinal; Override;
      function VerificaSaldoEmp(dDataSaldo: TDateTime;
                                iPlanoPatro: Integer = -1;
                                iInvestimento: Integer = -1;
                                iCustodiante: Integer = -1;
                                iTipoOper: Integer = 0): Boolean;

      function BuscaCotacao(dDataSaldo: TDateTime; iInvestimento: Integer): Boolean;
      function FazRegra(iRegra: Integer; cds: TCMClientDataSet = nil; sSql: String = ''): Boolean;
      function GeraBoleta(dDataBoleta: TDateTime): String;
      function MudaFlgReproc(dDataProc: TDateTime; bMarca: Boolean = True;
                             iOperEmpAP: Integer = -1; iInv: Integer = -1; iPlano: Integer = -1): Boolean;
      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      function EmpMarcado(iOperEmpAcoesAP: Integer = 0;  sNumContratro : String = ''): Boolean;

      //----------------  Métodos Contábeis e Financeiros  ---------------------
      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      function IntegraContabCapCar(iInvestimento, iTipoOperacao, iCarteiraInvest, iPlanPrevPatro,
                                   iForCli, iTipoDespInvest :integer;
                                   fValor, fEstornoJuros :Double;
                                   dDataProc, dDataVenc : TDateTime;
                                   iFlgContaInvest : Integer = 0;
                                   sHitoricoComp : String = ''): Boolean;

      function LancaDocumento(fValor: Double; iTipoDoc, iForCli: Integer; sDataLanc, sDataVenc: String; iFlgContaInvest : Integer = 0): Boolean;

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      function AplicaAtualLancVigEmp : boolean;

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253 
      function ListLancVigEmp(iLancVigEmp : Integer = 0; dDataVigente: TDateTime = 0): OleVariant;

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      function AtualizaHistorico(dDataRef: TDateTime; iInvest, iPlanPrev: Integer): Boolean;

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253      
      function ContabilizaJuros(dDataRef : TDateTime;
                                iInvest, iPlanPrev : Integer): Boolean;

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      function BuscaDataVigEmpAcoes(dDataOper: TDateTime): TDateTime;

   protected
      //----------------  Métodos Protegidos Próprios  -------------------------
      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;
      procedure AfterInitialize;  Override;
   end;
//*****************************************************************************

var CtrlEmpAcoes: TCtrlEmpAcoes;
    AtualizaProc: procedure(sMsg: String = ''; iMax: Integer = -1);

implementation

uses fCadEmpAcoesMT;

//*****************************************************************************
{ TCtrlPersistentObject - Inicio}
//*****************************************************************************

procedure TCtrlPersistentObject.Clear;
begin

end;

constructor TCtrlPersistentObject.Create(Aowner: TCmControlObject);
begin
   FOwner := Aowner;
    //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   _Cds := TCMClientDataSet.Create(nil);
end;

destructor TCtrlPersistentObject.Destroy;
begin
   FreeAndNil(_Cds);
   inherited;
end;

procedure TCtrlPersistentObject.SetDataBaseName(const Value: String);
begin
   FDataBaseName := Value;
end;
//*****************************************************************************



//*****************************************************************************
{ TBuscaSaldoEmp - Inicio}
//*****************************************************************************

//----------------  Métodos Próprios  ------------------------------------
constructor TBuscaSaldoEmp.Create(Aowner: TCmControlObject);
begin
   inherited;
   //Criar objetos a serem utilizados na BuscaSaldos
   //Ex. CDSs Persistentes (Para manter posnteirado)

end;

destructor TBuscaSaldoEmp.Destroy;
begin
   inherited;
   //Destruir os objetos criados na BuscaSaldos

end;

//----------------  Métodos de Listagem  ---------------------------------
function TBuscaSaldoEmp.ListSldEmpAcoes(dDataSaldo: TDateTime;
                                        iOperEmpAp: Integer = -1;
                                        iInvestimento: Integer = -1;
                                        iPlanoPatro: Integer = -1): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT DISTINCT HS.DATAHISTEMPACOES, ' + #13 +
           '       HS.VLRHISTEMPACOES, HS.SLDHISTEMPACOES, ' + #13 +
           '       HS.QTDHISTEMPACOES, HS.SLDQTDHISTEMPACOE, ' + #13 +
           '       HS.VLRPRINCIPAL, HS.SLDPRINCIPAL, ' + #13 +
           '       HS.VLRJUROS, HS.VLRJUROSEST, HS.SLDJUROS, ' + #13 +
           '       HS.VLRFINAL, HS.SLDFINAL,  ' + #13 +
           '       HS.NATURMOV, HS.IDHISTEMPACOES, HS.IDOPEREMPACOES, HS.IDOPEREMPACOESAP, ' + #13 +
           '       HS.IDTIPOOPERACAO, HS.IDINVESTIMENTO, HS.IDCARTEIRAINVEST, HS.IDCUSTODIANTE, ' + #13 +
           '       OP.DATAOPERACAO, OP.TAXAOPERACAO, OP.QTDOPERACAO, OP.PUOPERACAO, OP.VLROPERACAO, ' + #13 +
           '       OP.DATAVENCOPER, OP.FLGREVERSAO, OP.FLGPRECO, OP.VLRRESGATE, ' + #13 +
           '       IV.DESCINVESTIMENTO, ' + #13 +
           '       TP.DESCTIPOOPERACAO, TP.FLGGERACONTAB, TP.FLGGERACAPCAR, TP.CODTIPDOC, ' + #13 +
           '       PP.IDPLANPREVCTBPATR, PP.PLANPRVCONTABPATRO ' + #13 +
           'FROM HISTEMPACOES HS, OPEREMPACOES OP, INVESTIMENTO IV, TIPOOPERACAO TP, VWPLANPREVCTBPATR PP ' + #13 +
           'WHERE HS.IDHISTEMPACOES IN (SELECT MAX(H.IDHISTEMPACOES) ' + #13 +
           '                            FROM HISTEMPACOES H ' + #13 +
           '                            WHERE (H.DATAHISTEMPACOES <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSaldo)) + ',' + QuotedStr('DD/MM/YYYY') + ')) ' + #13;
   if iPlanoPatro > 0 then
      sSql := sSql +
           '                              AND (H.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro) + ') ' + #13;
   if iInvestimento > 0 then
      sSql := sSql +
           '                              AND (H.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iOperEmpAp > 0 then
      sSql := sSql +
           '                              AND (H.IDOPEREMPACOESAP = ' + IntToStr(iOperEmpAp) + ') ' + #13;

   sSql := sSql +
           '                            GROUP BY H.IDOPEREMPACOESAP) ' + #13 +
           '  AND (OP.IDOPEREMPACOES   = HS.IDOPEREMPACOESAP) ' + #13 +
           '  AND (OP.IDOPEREMPACOES   = OP.IDOPEREMPACOESAP) ' + #13 +
           '  AND (HS.DATAHISTEMPACOES <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSaldo)) + ',' + QuotedStr('DD/MM/YYYY') + ')) ' + #13 +
           '  AND (OP.DATAVENCOPER     >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSaldo)) + ',' + QuotedStr('DD/MM/YYYY') + ')) ' + #13;

   if iPlanoPatro > 0 then
      sSql := sSql +
           '  AND (HS.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro) + ') ' + #13;
   if iInvestimento > 0 then
      sSql := sSql +
           '  AND (HS.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iOperEmpAp > 0 then
      sSql := sSql +
           '  AND (HS.IDOPEREMPACOESAP = ' + IntToStr(iOperEmpAp) + ') ' + #13;

   sSql := sSql +
           '  AND (HS.SLDQTDHISTEMPACOE > 0) ' + #13 +
           '  AND (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO) ' + #13 +
           '  AND (HS.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) ' + #13 +
           '  AND (HS.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR) ' + #13 +
           'ORDER BY DATAHISTEMPACOES, IDHISTEMPACOES';

   Result := TCtrlEmpAcoes(Owner).GetDataPacket(sSQL);

   // CMDebugToFile(sSql, 'C:\sSql.txt');

end;

function TBuscaSaldoEmp.ListSldQtdInvEmpAcoes(dDataSaldo: TDateTime;
                                              iInvestimento: Integer;
                                              iPlanoPatro: Integer = -1;
                                              iCustodiante: Integer = -1;
                                              iTipoConta: Integer = 0): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT SUM(HS.SLDQTDHISTEMPACOE) AS SLDQTDHIST ' + #13 +
           'FROM HISTEMPACOES HS, OPEREMPACOES OP ' + #13 +
           'WHERE HS.IDHISTEMPACOES IN ' + #13 +
           '          (SELECT MAX(H.IDHISTEMPACOES) ' + #13 +
           '           FROM HISTEMPACOES H ' + #13 +
           '           WHERE (H.DATAHISTEMPACOES <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSaldo)) + ',' + QuotedStr('DD/MM/YYYY') + ')) ' + #13;
   if iPlanoPatro > 0 then
      sSql := sSql +
           '             AND (H.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro) + ') ' + #13;
   if iInvestimento > 0 then
      sSql := sSql +
           '             AND (H.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCustodiante > 0 then
      sSql := sSql +
           '             AND (H.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ') ' + #13;

   sSql := sSql +
           '           GROUP BY H.IDOPEREMPACOESAP) ' + #13 +
           '  AND (HS.SLDQTDHISTEMPACOE > 0) ' + #13 +
           '  AND (NVL(OP.FLGTIPOCONTA,0) = ' + IntToStr(iTipoConta) + ') ' + #13 +
           '  AND (HS.IDOPEREMPACOESAP = OP.IDOPEREMPACOES)';

   Result := TCtrlEmpAcoes(Owner).GetDataPacket(sSQL);

   // CMDebugToFile(sSql, 'C:\sSql.txt');

end;

//----------------  Métodos de Busca  ------------------------------------
function TBuscaSaldoEmp.Executa(dDataSaldo: TDateTime;
                                iOperEmpAP: Integer = -1;
                                iInvestimento: Integer = -1;
                                iPlanoPatro: Integer = -1): Boolean;
begin
   try // Finally
      try // Except
         // Zera todas as properties
         TCtrlEmpAcoes(Owner).MessageInfo := '';
         FHSSldPriEmp := 0;
         FHSVlrMovEmp := 0;
         FOPPUOperacao := 0;
         FHSVlrFinEmp := 0;
         FOPTaxaOperacao := 0;
         FOPVlrResgate := 0;
         FHSSldJurEmp := 0;
         FHSVlrJurEmp := 0;
         FHSVlrJEsEmp := 0;
         FHSVlrPriEmp := 0;
         FHSSldVlrEmp := 0;
         FHSSldFinEmp := 0;
         FOPVlrOperacao := 0;
         FHSIDTipoOperacao := 0;
         FHSIDOperEmpAcoes := 0;
         FHSIDOperEmpAcoesAP := 0;
         FHSIDCarteiraInvest := 0;
         FHSSldQtdEmp := 0;
         FHSIDHistEmpAcoes := 0;
         FPPIDPlanPrevCtbPatr := 0;
         FHSQtdMovEmp := 0;
         FHSIDInvestimento := 0;
         FOPQtdOperacao := 0;
         FHSIDCustodiante := 0;
         FOPFlgPreco := '';
         FPPPlanPrevCtbPatr := '';
         FHSNaturMov := '';
         FOPFlgReversao := '';
         FTPFlgGeraContab := '';
         FIVDescInvestimento := '';
         FTPDescTipoOperacao := '';
         FTPCodTipDoc := '';
         FTPFlgGeraCapCar := '';
         FOPDataOperacao := 0;
         FOPDataVencOpe := 0;
         FHSDataHistEmpAcoes := 0;

         _Cds.Data := ListSldEmpAcoes(dDataSaldo, iOperEmpAP, iInvestimento, iPlanoPatro);
         //_Cds.SaveToFile('C:_Cds.cds');

         if not _Cds.IsEmpty then
         begin
            FHSIDHistEmpAcoes := _Cds.FieldByName('IDHISTEMPACOES').AsInteger;
            FHSIDOperEmpAcoes := _Cds.FieldByName('IDOPEREMPACOES').AsInteger;
            FHSIDOperEmpAcoesAP := _Cds.FieldByName('IDOPEREMPACOESAP').AsInteger;
            FHSDataHistEmpAcoes := _Cds.FieldByName('DATAHISTEMPACOES').AsDateTime;
            FHSVlrMovEmp := _Cds.FieldByName('VLRHISTEMPACOES').AsFloat;
            FHSSldVlrEmp := _Cds.FieldByName('SLDHISTEMPACOES').AsFloat;
            FHSQtdMovEmp := _Cds.FieldByName('QTDHISTEMPACOES').AsInteger;
            FHSSldQtdEmp := _Cds.FieldByName('SLDQTDHISTEMPACOE').AsInteger;
            FHSVlrPriEmp := _Cds.FieldByName('VLRPRINCIPAL').AsFloat;
            FHSSldPriEmp := _Cds.FieldByName('SLDPRINCIPAL').AsFloat;
            FHSVlrJurEmp := _Cds.FieldByName('VLRJUROS').AsFloat;
            FHSVlrJEsEmp := _Cds.FieldByName('VLRJUROSEST').AsFloat;
            FHSSldJurEmp := _Cds.FieldByName('SLDJUROS').AsFloat;
            FHSVlrFinEmp := _Cds.FieldByName('VLRFINAL').AsFloat;
            FHSSldFinEmp := _Cds.FieldByName('SLDFINAL').AsFloat;
            FHSNaturMov := _Cds.FieldByName('NATURMOV').AsString;
            FHSIDTipoOperacao := _Cds.FieldByName('IDTIPOOPERACAO').AsInteger;
            FHSIDInvestimento := _Cds.FieldByName('IDINVESTIMENTO').AsInteger;
            FHSIDCarteiraInvest := _Cds.FieldByName('IDCARTEIRAINVEST').AsInteger;
            FHSIDCustodiante := _Cds.FieldByName('IDCUSTODIANTE').AsInteger;

            FOPDataOperacao := _Cds.FieldByName('DATAOPERACAO').AsDateTime;
            FOPTaxaOperacao := _Cds.FieldByName('TAXAOPERACAO').AsFloat;
            FOPQtdOperacao := _Cds.FieldByName('QTDOPERACAO').AsInteger;
            FOPPUOperacao := _Cds.FieldByName('PUOPERACAO').AsFloat;
            FOPVlrOperacao := _Cds.FieldByName('VLROPERACAO').AsFloat;
            FOPDataVencOpe := _Cds.FieldByName('DATAVENCOPER').AsDateTime;
            FOPFlgReversao := _Cds.FieldByName('FLGREVERSAO').AsString;
            FOPFlgPreco := _Cds.FieldByName('FLGPRECO').AsString;
            FOPVlrResgate := _Cds.FieldByName('VLRRESGATE').AsFloat;

            FIVDescInvestimento := _Cds.FieldByName('DESCINVESTIMENTO').AsString;

            FTPDescTipoOperacao := _Cds.FieldByName('DESCTIPOOPERACAO').AsString;
            FTPFlgGeraContab := _Cds.FieldByName('FLGGERACONTAB').AsString;
            FTPFlgGeraCapCar := _Cds.FieldByName('FLGGERACAPCAR').AsString;
            FTPCodTipDoc := _Cds.FieldByName('CODTIPDOC').AsString;

            FPPIDPlanPrevCtbPatr := _Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            FPPPlanPrevCtbPatr := _Cds.FieldByName('PLANPRVCONTABPATRO').AsString;

         end;

         Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            TCtrlEmpAcoes(Owner).MessageInfo := E.Message;
         end;
      end;
   finally
      _cds.Close;
   end;
end;

function TBuscaSaldoEmp.ExecutaQtdInv(dDataSaldo: TDateTime;
                                      iInvestimento: Integer;
                                      iPlanoPatro: Integer = -1;
                                      iCustodiante: Integer = -1): Boolean;
begin
   try // Finally
      try // Except

         TCtrlEmpAcoes(Owner).MessageInfo := '';

         // Zera todas as properties
         FINVSaldoQtdCC := 0;
         FINVSaldoQtdCCI := 0;

         // Busca o saldo CC
         _Cds.Data := ListSldQtdInvEmpAcoes(dDataSaldo, iInvestimento, iPlanoPatro, iCustodiante);
         //_Cds.SaveToFile('C:_Cds.cds');

         if not _Cds.IsEmpty then
            FINVSaldoQtdCC := _Cds.FieldByName('SLDQTDHIST').AsInteger;

         // Busca o Saldo CCI
         _Cds.Data := ListSldQtdInvEmpAcoes(dDataSaldo, iInvestimento, iPlanoPatro, iCustodiante, 1);
         //_Cds.SaveToFile('C:_Cds.cds');

         if not _Cds.IsEmpty then
            FINVSaldoQtdCCI := _Cds.FieldByName('SLDQTDHIST').AsInteger;

         Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            TCtrlEmpAcoes(Owner).MessageInfo := E.Message;
         end;
      end;
   finally
      _cds.Close;
   end;
end;

procedure TBuscaSaldoEmp.SetHSDataHistEmpAcoes(const Value: TDateTime);
begin
  FHSDataHistEmpAcoes := Value;
end;

procedure TBuscaSaldoEmp.SetHSIDCarteiraInvest(const Value: Integer);
begin
  FHSIDCarteiraInvest := Value;
end;

procedure TBuscaSaldoEmp.SetHSIDCustodiante(const Value: Integer);
begin
  FHSIDCustodiante := Value;
end;

procedure TBuscaSaldoEmp.SetHSIDHistEmpAcoes(const Value: Integer);
begin
  FHSIDHistEmpAcoes := Value;
end;

procedure TBuscaSaldoEmp.SetHSIDInvestimento(const Value: Integer);
begin
  FHSIDInvestimento := Value;
end;

procedure TBuscaSaldoEmp.SetHSIDOperEmpAcoes(const Value: Integer);
begin
  FHSIDOperEmpAcoes := Value;
end;

procedure TBuscaSaldoEmp.SetHSIDOperEmpAcoesAP(const Value: Integer);
begin
  FHSIDOperEmpAcoesAP := Value;
end;

procedure TBuscaSaldoEmp.SetHSIDTipoOperacao(const Value: Integer);
begin
  FHSIDTipoOperacao := Value;
end;

procedure TBuscaSaldoEmp.SetHSNaturMov(const Value: String);
begin
  FHSNaturMov := Value;
end;

procedure TBuscaSaldoEmp.SetHSQtdMovEmp(const Value: Integer);
begin
  FHSQtdMovEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSSldFinEmp(const Value: Double);
begin
  FHSSldFinEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSSldJurEmp(const Value: Double);
begin
  FHSSldJurEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSSldPriEmp(const Value: Double);
begin
  FHSSldPriEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSSldQtdEmp(const Value: Integer);
begin
  FHSSldQtdEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSSldVlrEmp(const Value: Double);
begin
  FHSSldVlrEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSVlrFinEmp(const Value: Double);
begin
  FHSVlrFinEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSVlrJurEmp(const Value: Double);
begin
  FHSVlrJurEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSVlrJEsEmp(const Value: Double);
begin
  FHSVlrJEsEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSVlrMovEmp(const Value: Double);
begin
  FHSVlrMovEmp := Value;
end;

procedure TBuscaSaldoEmp.SetHSVlrPriEmp(const Value: Double);
begin
  FHSVlrPriEmp := Value;
end;

procedure TBuscaSaldoEmp.SetIVDescInvestimento(const Value: String);
begin
  FIVDescInvestimento := Value;
end;

procedure TBuscaSaldoEmp.SetOPDataOperacao(const Value: TDateTime);
begin
  FOPDataOperacao := Value;
end;

procedure TBuscaSaldoEmp.SetOPDataVencOpe(const Value: TDateTime);
begin
  FOPDataVencOpe := Value;
end;

procedure TBuscaSaldoEmp.SetOPFlgPreco(const Value: String);
begin
  FOPFlgPreco := Value;
end;

procedure TBuscaSaldoEmp.SetOPFlgReversao(const Value: String);
begin
  FOPFlgReversao := Value;
end;

procedure TBuscaSaldoEmp.SetOPPUOperacao(const Value: Double);
begin
  FOPPUOperacao := Value;
end;

procedure TBuscaSaldoEmp.SetOPQtdOperacao(const Value: Integer);
begin
  FOPQtdOperacao := Value;
end;

procedure TBuscaSaldoEmp.SetOPTaxaOperacao(const Value: Double);
begin
  FOPTaxaOperacao := Value;
end;

procedure TBuscaSaldoEmp.SetOPVlrOperacao(const Value: Double);
begin
  FOPVlrOperacao := Value;
end;

procedure TBuscaSaldoEmp.SetOPVlrResgate(const Value: Double);
begin
  FOPVlrResgate := Value;
end;

procedure TBuscaSaldoEmp.SetPPIDPlanPrevCtbPatr(const Value: Integer);
begin
  FPPIDPlanPrevCtbPatr := Value;
end;

procedure TBuscaSaldoEmp.SetPPPlanPrevCtbPatr(const Value: String);
begin
  FPPPlanPrevCtbPatr := Value;
end;

procedure TBuscaSaldoEmp.SetTPCodTipDoc(const Value: String);
begin
  FTPCodTipDoc := Value;
end;

procedure TBuscaSaldoEmp.SetTPDescTipoOperacao(const Value: String);
begin
  FTPDescTipoOperacao := Value;
end;

procedure TBuscaSaldoEmp.SetTPFlgGeraCapCar(const Value: String);
begin
  FTPFlgGeraCapCar := Value;
end;

procedure TBuscaSaldoEmp.SetTPFlgGeraContab(const Value: String);
begin
  FTPFlgGeraContab := Value;
end;

procedure TBuscaSaldoEmp.SetINVSaldoQtdCC(const Value: Integer);
begin
  FINVSaldoQtdCC := Value;
end;

procedure TBuscaSaldoEmp.SetINVSaldoQtdCCI(const Value: Integer);
begin
  FINVSaldoQtdCCI := Value;
end;


//*****************************************************************************


//*****************************************************************************
{ TCtrlEmpAcoes - Inicio}
//*****************************************************************************
//----------------  Métodos Próprios  ------------------------------------
constructor TCtrlEmpAcoes.Create;
begin
   inherited;
   FBuscaSaldoEmp := TBuscaSaldoEmp.Create(Self);
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
   FDBOperEmpAcoes := TDbOperEmpAcoes.Create(Self);
   FDBHistEmpAcoes := TDbHistEmpAcoes.Create(Self);
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   FDbLancVigEmp   := TDbLancVigEmp.Create(Self);
end;

destructor TCtrlEmpAcoes.Destroy;
begin
   FreeAndNil(FBuscaSaldoEmp);
   FreeAndNil(CtrlRV);
   FreeAndNil(FDBOperEmpAcoes);
   FreeAndNil(FDBHistEmpAcoes);
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   FreeAndNil(FDbLancVigEmp);
   if IsAppServer then
      FreeAndNil(FCdsOperEmpAcoes);
   if IsAppServer then
      FreeAndNil(FCdsHistEmpAcoes);
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   if IsAppServer then
      FreeAndNil(FCdsLancVigEmp);
   inherited;
end;

//----------------  Métodos de Listagem  ---------------------------------
//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.ListOperEmpAcoes(iOperEmpAcoes: Integer = 0; sNumContratro : String = ''): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT DATAOPERACAO, DATAVENCOPER, ' + #13 +
           '       VLROPERACAO, QTDOPERACAO, PUOPERACAO, TAXAOPERACAO, VLRIR, FLGREVERSAO, FLGPRECO, VLRRESGATE, VLRJUROS, ' + #13 +
           '       0 AS VLRRESGATEATU, VLRRESGATE-VLROPERACAO AS VALOREMPRESTIMO, ' + #13 +
           '       CODDOCUMENTO, PLNCODIGO, PLANO, TIPOCONFIRMADO, IDCARTEIRACUSTODIANTE, ' + #13 +
           '       IDOPEREMPACOES, IDOPEREMPACOESAP, IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDINVESTIMENTO, IDTIPOOPERACAO, ' + #13 +
           '       IDTIPOINVEST, IDCUSTODIANTE, IDBOLETA, NVL(FLGTIPOCONTA,0) AS FLGTIPOCONTA, TIPOLANCAMENTO, NUMCONTRATOCUSTODIA ' + #13 +
           'FROM OPEREMPACOES ' + #13;
   if iOperEmpAcoes > 0 then
      sSql := sSql + 'WHERE IDOPEREMPACOES = IDOPEREMPACOESAP ' + #13 +
                     '  AND IDOPEREMPACOES = ' + IntToStr(iOperEmpAcoes) + #13
   else if TRIM(sNumContratro) <> '' then
      sSql := sSql + ' WHERE NUMCONTRATOCUSTODIA = ' + QuotedStr(TRIM(sNumContratro)) + #13 +
                     '   AND IDTIPOOPERACAO IN  (-52,-10052) '+#13
   else
      sSql := sSql + ' WHERE 1 =2 ' + #13;

   sSql := sSql + 'ORDER BY DATAOPERACAO, IDOPEREMPACOES';
   Result := GetDataPacket(sSql);
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.ListOperHistEmpAcoes(iOperEmpAcoesAp: Integer = 0; sNumContratro : String = ''): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT H.DATAHISTEMPACOES, ' + #13 +
           '       T.DESCTIPOOPERACAO, ' + #13 +
           '       NVL(H.VLRHISTEMPACOES, 0) AS VLRHISTEMPACOES, ' + #13 +
           '       NVL(H.SLDHISTEMPACOES, 0) AS SLDHISTEMPACOES, ' + #13 +
           '       NVL(H.QTDHISTEMPACOES, 0) AS QTDHISTEMPACOES, ' + #13 +
           '       NVL(H.SLDQTDHISTEMPACOE, 0) AS SLDQTDHISTEMPACOE, ' + #13 +
           '       NVL(H.VLRPRINCIPAL, 0) AS VLRPRINCIPAL, NVL(H.SLDPRINCIPAL, 0) AS SLDPRINCIPAL, ' + #13 +
           '       NVL(H.VLRJUROS, 0) AS VLRJUROS, NVL(H.VLRJUROSEST, 0) AS VLRJUROSEST, NVL(H.SLDJUROS, 0) AS SLDJUROS, ' + #13 +
           '       NVL(H.VLRJUROSIMPORTA, 0) AS VLRJUROSIMPORTA, NVL(H.SLDJUROSIMPORTA, 0) AS SLDJUROSIMPORTA, ' + #13 +
           '       NVL(H.VLRFINAL, 0) AS VLRFINAL, NVL(H.SLDFINAL, 0) AS SLDFINAL, ' + #13 +
           '       NVL(H.VLRPRINCIPAL, 0) AS VLRPRINCIPAL, NVL(H.SLDPRINCIPAL, 0) AS SLDPRINCIPAL, ' + #13 +
           '       H.IDTIPOOPERACAO, H.IDPLANPREVCTBPATR, H.IDINVESTIMENTO, H.NUMCONTRATOCUSTODIA, ' + #13 +
           '       H.IDOPEREMPACOES, H.IDOPEREMPACOESAP, H.IDHISTEMPACOES, H.PLANO, H.PLNCODIGO, H.CODDOCUMENTO, H.TIPOLANCAMENTO ' + #13 +
           'FROM HISTEMPACOES H, TIPOOPERACAO T ' + #13;
   if iOperEmpAcoesAp > 0 then
      sSql := sSql + 'WHERE H.IDOPEREMPACOESAP = ' + IntToStr(iOperEmpAcoesAp) + ' ' + #13
   else if TRIM(sNumContratro) <> '' then
      sSql := sSql +
           'WHERE H.NUMCONTRATOCUSTODIA = ' + QuotedStr(TRIM(sNumContratro)) + ' ' + #13
   else
      sSql := sSql +
           'WHERE 1 = 2 '+ #13;
   sSql := sSql +
           '  AND H.IDTIPOOPERACAO = T.IDTIPOOPERACAO ' + #13 +
           'ORDER BY H.DATAHISTEMPACOES, H.IDHISTEMPACOES ';
   Result := GetDataPacket(sSql);
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.ListOperResgEmpAcoes(iOperEmpAcoesAp : Integer = 0; sNumContratro : String = ''): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT DATAOPERACAO, DATAVENCOPER, ' + #13 +
           '       VLROPERACAO, QTDOPERACAO, PUOPERACAO, TAXAOPERACAO, VLRIR, FLGREVERSAO, FLGPRECO, VLRRESGATE, VLRJUROS, ' + #13 +
           '       0 AS VLRRESGATEATU, (VLRRESGATE-VLROPERACAO) AS VALOREMPRESTIMO, (VLROPERACAO-VLRJUROS) AS VLRPRINCIPAL, VLRJUROSEST, ' + #13 +
           '       CODDOCUMENTO, PLNCODIGO, PLANO, TIPOCONFIRMADO, IDCARTEIRACUSTODIANTE, ' + #13 +
           '       IDOPEREMPACOES, IDOPEREMPACOESAP, IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDINVESTIMENTO, IDTIPOOPERACAO, ' + #13 +
           '       IDTIPOINVEST, IDCUSTODIANTE, IDBOLETA, NVL(FLGTIPOCONTA,0) AS FLGTIPOCONTA, TIPOLANCAMENTO, NUMCONTRATOCUSTODIA ' + #13 +
           'FROM OPEREMPACOES ' + #13;
   if iOperEmpAcoesAp > 0 then
      sSql := sSql + 'WHERE IDOPEREMPACOES <> IDOPEREMPACOESAP ' + #13 +
                     '  AND IDOPEREMPACOES = ' + IntToStr(iOperEmpAcoesAp) + #13
   else if TRIM(sNumContratro) <> '' then
      sSql := sSql + ' WHERE NUMCONTRATOCUSTODIA = ' + QuotedStr(TRIM(sNumContratro)) + #13 +
                     '   AND IDTIPOOPERACAO IN  (-53,-10053) '+#13
   else
      sSql := sSql + ' WHERE 1 = 2 ' + #13;

   sSql := sSql + 'ORDER BY DATAOPERACAO, IDOPEREMPACOES';
   Result := GetDataPacket(sSql);
end;

function TCtrlEmpAcoes.ListRelBoleta(iOperEmpAcoes: Integer): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT OP.IDOPEREMPACOES, OP.IDCUSTODIANTE, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, ' + #13 +
           '   OP.IDTIPOINVEST, OP.IDTIPOOPERACAO, OP.DATAOPERACAO, OP.DATAVENCOPER, OP.VLROPERACAO, ' + #13 +
           '   OP.QTDOPERACAO, OP.PUOPERACAO, OP.TAXAOPERACAO, OP.VLRIR, OP.FLGREVERSAO, OP.FLGPRECO, ' + #13 +
           '   OP.IDOPEREMPACOESAP, OP.VLRRESGATE, OP.VLRJUROS, OP.TIPOCONFIRMADO, 0 AS VLRRESGATEATU, ' + #13 +
           '   VLRRESGATE-VLROPERACAO AS VALOREMPRESTIMO, IV.DESCINVESTIMENTO, CU.SGLCUSTODIANTE, ' + #13 +
           '   TP.DESCTIPOOPERACAO, OP.PLNCODIGO, OP.CODDOCUMENTO, OP.IDPLANPREVCTBPATR ' + #13 +
           'FROM OPEREMPACOES OP, INVESTIMENTO IV, TIPOOPERACAO TP, CUSTODIANTE CU ' + #13 +
           'WHERE IDOPEREMPACOES = ' + IntToStr(iOperEmpAcoes) + #13 +
           '   AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO ' + #13 +
           '   AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ' + #13 +
           '   AND OP.IDCUSTODIANTE  = CU.IDCUSTODIANTE';
   Result := GetDataPacket(sSql);
end;


//----------------  Métodos de Update em Banco  --------------------------
{function TCtrlEmpAcoes.GravaOperEmpAcoes: Boolean;
var cdsBoleta: TCMClientDataSet;
    bComita: Boolean;
    sBoleta: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaOperEmpAcoes;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally

         try // Except

            // ---------  Se não existe uma transação aberta, abre uma
            if not InTransaction then
            begin
               bComita := True;
               StartTransaction;
            end
            else
               bComita := False;

            if (FCdsOperEmpAcoes.FieldByName('IDTIPOOPERACAO').AsInteger = -52) or
               (FCdsOperEmpAcoes.FieldByName('IDTIPOOPERACAO').AsInteger = -10052) then
            begin
               // ---------  Grava a Boleta -- Somente para o empréstimo
               if FCdsOperEmpAcoes.FieldByName('IDBOLETA').AsString = '' then
                  sBoleta := 'EM-'+ Copy(DateToStr(FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime),9,2)+'/'+FormatFloat('0000',
                                     LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime),9,2)))
               else
                  sBoleta := FCdsOperEmpAcoes.FieldByName('IDBOLETA').AsString;

               FCdsOperEmpAcoes.Edit;
               FCdsOperEmpAcoes.FieldByName('IDBOLETA').AsString := sBoleta;
               FCdsOperEmpAcoes.Post;
            end;

            // ---------  Grava a operação
            DBOperEmpAcoes.Clear;
            Result := ApplyCds(FCdsOperEmpAcoes,DBOperEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create(DBOperEmpAcoes.MessageInfo);

            // ---------  Grava o histórico da operação
            FCdsOperEmpAcoes.First;
            while not FCdsOperEmpAcoes.eof do
            begin
               if FCdsOperEmpAcoes.UpdateStatus In [usInserted] then
               begin
                  DBOperEmpAcoes.Clear;
                  Result := GravaHistEmpAcoes(FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOES').AsInteger);
                  if not Result then
                     Raise Exception.Create(DBOperEmpAcoes.MessageInfo);
               end;
               FCdsOperEmpAcoes.Next;
            end;

            // ---------  Só comita se a transação foi aberta aqui
            if bComita then
               Commit
         except
            on E:Exception do
            begin
               Result := False;
               if bComita then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally
         DBOperEmpAcoes.Clear;
      end;
   end;
end; }

{function TCtrlEmpAcoes.ExcluiOperEmpAcoes(iOperEmpAcoes: Integer = -1): Boolean;
var bTransacao: Boolean;
    iOperacao: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExcluiOperEmpAcoes(iOperEmpAcoes);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally

         try // Except
            bTransacao := False;
            if not InTransaction then
            begin
               bTransacao := True;
               StartTransaction;
            end;

            // ---------  Capta a operação a ser excluída
            iOperacao := FIdOperEmpAcoes;
            if iOperEmpAcoes = -1 then
            begin
               if not FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOES').IsNull then
                  iOperacao := FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOES').AsInteger
            end
            else
               if iOperEmpAcoes > 0 then
                  iOperacao := iOperEmpAcoes;

            // ---------  Busca o registro da operação no banco
            FDBOperEmpAcoes.Clear;
            FDBOperEmpAcoes.Idoperempacoes.AsInteger := iOperacao;
            if not FDBOperEmpAcoes.LoadFromDb then
               Raise Exception.Create('Não foi possível localizar a operação a ser excluída');

            // ---------  Busca os históricos da aplicação
            _Cds.Data := ListOperHistEmpAcoes(FDBOperEmpAcoes.Idoperempacoesap.AsInteger);

            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('Excluindo históricos da operação', _Cds.RecordCount + 1);

            // ---------  Exclui os históricos da operação e posteriores
            while not _Cds.eof do
            begin
               // ---------  Exclui se:
               //            A Data do histórico for superior a da operação
               //            O Tipo de operação do histórico for igual ao da operação e a data igual
               if (_Cds.FieldByName('DATAHISTEMPACOES').AsDateTime > FDBOperEmpAcoes.Dataoperacao.AsDateTime) or
                  ((_Cds.FieldByName('IDTIPOOPERACAO').AsInteger = FDBOperEmpAcoes.Idtipooperacao.AsInteger) and
                   (_Cds.FieldByName('IDOPEREMPACOES').AsInteger = FDBOperEmpAcoes.Idoperempacoes.AsInteger) and
                   (_Cds.FieldByName('DATAHISTEMPACOES').AsDateTime = FDBOperEmpAcoes.Dataoperacao.AsDateTime)) then
               begin

                  FDBHistEmpAcoes.Clear;
                  FDBHistEmpAcoes.Idhistempacoes.AsInteger := _Cds.FieldByName('IDHISTEMPACOES').AsInteger;
                  if not FDBHistEmpAcoes.LoadFromDb then
                     Raise Exception.Create('Não foi possível localizar um histórico da operação');

                  if not FDBHistEmpAcoes.Plncodigo.IsNull then
                  begin
                     if not CtrlInvContab.InvExcluiLanc(FDBHistEmpAcoes.Plncodigo.AsInteger, 0, CtrlInvContab.UsaPlanoPatro, False, 1) then
                        Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + FDBHistEmpAcoes.Plncodigo.AsString + #13 +
                                               'Mensagem: ' + CtrlInvContab.MessageInfo);
                  end;

                  if not FDBHistEmpAcoes.Delete then
                     Raise Exception.Create('Não foi possível excluir um histórico da operação' + #13 +
                                            'Mensagem: ' + FDBHistEmpAcoes.MessageInfo);

               end;

               _Cds.Next;

               if Assigned(AtualizaProcesso) then
                  AtualizaProcesso('');
            end;

            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('Excluindo a operação');

            // ---------  Exclui a operação
            DBOperEmpAcoes.Clear;
            Result := ApplyCds(FCdsOperEmpAcoes,DBOperEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create('Não foi possível excluir a operação' + #13 +
                                      'Mensagem: ' + FDBOperEmpAcoes.MessageInfo);

//            if not FDBOperEmpAcoes.Delete then
//               Raise Exception.Create('Não foi possível excluir a operação' + #13 +
//                                      'Mensagem: ' + FDBOperEmpAcoes.MessageInfo);

            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('', -3);

            if bTransacao then
               Commit;
            Result := True;
         except
            on E:Exception do
            begin
               Result := False;
               if bTransacao then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally
         FDBOperEmpAcoes.Clear;
         FDBHistEmpAcoes.Clear;
         _Cds.Close;
      end;
   end;
end; }

function TCtrlEmpAcoes.GravaOperEmpAcoes: Boolean;
var sBoleta: String;
    //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
    bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaOperEmpAcoes;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         try // Except

            MessageInfo := '';

            if Assigned(AtualizaProc) then
               AtualizaProc('', 10);

            //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
            bComitLocal := False;
            if not InTransaction then
            begin
               bComitLocal := True;
               StartTransaction;
            end;

            // ---------  Gera a Boleta na inclusão de Empréstimo (Ou nos antigos que ainda não tem)
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, gravando a boleta', 0);
            if (FCdsOperEmpAcoes.UpdateStatus In [usInserted]) or (FCdsOperEmpAcoes.State = dsEdit) then
            begin
               if FCdsOperEmpAcoes.FieldByName('IDBOLETA').IsNull then
                  FCdsOperEmpAcoes.FieldByName('IDBOLETA').AsString := GeraBoleta(FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime);
            end;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // ---------  Grava a operação de Empréstimo
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, gravando a operação de empréstimo', 0);
            DBOperEmpAcoes.Clear;
            Result := ApplyCds(FCdsOperEmpAcoes,DBOperEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create(DBOperEmpAcoes.MessageInfo);
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // ---------  Grava as exclusões dos históricos exibidos na tela
            // Exclui os lançamentos contábeis dos registros excluídos
            FCdsHistEmpAcoes.StatusFilter := [usDeleted];
            FCdsHistEmpAcoes.Filtered := True;
            FCdsHistEmpAcoes.First;
            while not FCdsHistEmpAcoes.Eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, excluíndo contábilidade de históricos excluidos', 0);
               if not FCdsHistEmpAcoes.FieldByName('PLNCODIGO').IsNull then
               begin
                  if not CtrlInvContab.InvExcluiLanc(FCdsHistEmpAcoes.FieldByName('PLNCODIGO').AsInteger, 0,
                                                     CtrlInvContab.UsaPlanoPatro, False, 1) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' +
                                            FCdsHistEmpAcoes.FieldByName('PLNCODIGO').AsString + #13 +
                                            'Mensagem: ' + CtrlInvContab.MessageInfo);
               end;
               if FCdsHistEmpAcoes.FieldByName('DATAHISTEMPACOES').AsDateTime < CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsHistEmpAcoes.FieldByName('DATAHISTEMPACOES').AsDateTime,
                                       True, FCdsHistEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');
               end;
               FCdsHistEmpAcoes.Next;
            end;
            FCdsHistEmpAcoes.StatusFilter := [];
            FCdsHistEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // Exclui os históricos
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, excluindo históricos', 0);
            DBHistEmpAcoes.Clear;
            Result := ApplyCds(FCdsHistEmpAcoes, DBHistEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create(DBHistEmpAcoes.MessageInfo);
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);


            // ---------  Grava o histórico das novas operação de empréstimo
            FCdsOperEmpAcoes.StatusFilter := [usInserted];
            FCdsOperEmpAcoes.Filtered := True;
            FCdsOperEmpAcoes.First;
            while not FCdsOperEmpAcoes.eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, gravando históricos', 0);
               Result := GravaHistEmpAcoes(FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOES').AsInteger);
               if not Result then
                  Raise Exception.Create(MessageInfo);
               if FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime <= CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime, True,
                                       FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');
               end;
               FCdsOperEmpAcoes.Next;
            end;
            FCdsOperEmpAcoes.StatusFilter := [];
            FCdsOperEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);


            // ---------  Atualiza histórico das operação de alteradas
            FCdsOperEmpAcoes.StatusFilter := [usModified];
            FCdsOperEmpAcoes.Filtered := True;
            FCdsOperEmpAcoes.First;
            while not FCdsOperEmpAcoes.eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, atualizando históricos', 0);

               if not ExecSQL('DELETE FROM HISTEMPACOES ' + #13 +
                       'WHERE HISTEMPACOES.IDOPEREMPACOESAP = ' + FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOES').AsString + #13 +
                       '  AND HISTEMPACOES.IDOPEREMPACOES = HISTEMPACOES.IDOPEREMPACOESAP') then
                  Raise Exception.Create('Não foi possível excluir um histórico existente');

               Result := GravaHistEmpAcoes(FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOES').AsInteger);
               if not Result then
                  Raise Exception.Create(MessageInfo);
               if FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime <= CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime, True,
                                       FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');
               end;
               FCdsOperEmpAcoes.Next;
            end;
            FCdsOperEmpAcoes.StatusFilter := [];
            FCdsOperEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // ---------  Grava a operação de Resgate
            //            Contabiliza os resgates antes para gravar o CodDocumento e o PlnCodigo no Cds
            //            Obs.: Não pode filtrar o Cds. Cds Filtrado não aceita Edição.
            FCdsResgEmpAcoes.First;
            FPlano := -1;
            FPlanilha := -1;
            FDocumento := -1;
            while not FCdsResgEmpAcoes.eof do
            begin
               if FCdsResgEmpAcoes.UpdateStatus In [usInserted] then
               begin
                  if Assigned(AtualizaProc) then
                     AtualizaProc('Aguarde, gravando operações de resgate', 0);
                  if not IntegraContabCapCar(FCdsResgEmpAcoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                             FCdsResgEmpAcoes.FieldByName('IDTIPOOPERACAO').AsInteger,
                                             CtrlPInv.IdCartEmpAcoes,
                                             FCdsResgEmpAcoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                             FCdsResgEmpAcoes.FieldByName('IDCUSTODIANTE').AsInteger,
                                             -1,
                                             FCdsResgEmpAcoes.FieldByName('VLRJUROS').AsFloat,
                                             FCdsResgEmpAcoes.FieldByName('VLRJUROSEST').AsFloat,
                                             FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime,
                                             FCdsResgEmpAcoes.FieldByName('DATAVENCOPER').AsDateTime,
                                             FuncoesInvest.IIF(FCdsResgEmpAcoes.FieldByName('IDTIPOOPERACAO').AsInteger < 10000, 1, 0),'') then
                     Raise Exception.Create('Não foi possível realizar a integração contabil/financeira.' + #13 +
                                            'Mensagen: ' + CtrlInvContab.MessageInfo + #13 +
                                            '          ' + MessageInfo);
                  //         Grava a Planilha e Documento na tabela de operação
                  FCdsResgEmpAcoes.Edit;
                  if Plano > 0 then
                     FCdsResgEmpAcoes.FieldByName('PLANO').AsInteger := Plano;
                  if Planilha > 0 then
                     FCdsResgEmpAcoes.FieldByName('PLNCODIGO').AsInteger :=  Planilha;
                  if Documento > 0 then
                     FCdsResgEmpAcoes.FieldByName('CODDOCUMENTO').AsInteger := Documento;

                  FCdsResgEmpAcoes.Post;

                  FPlano := -1;
                  FPlanilha := -1;
                  FDocumento := -1;
               end;
               FCdsResgEmpAcoes.Next;
            end;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            //            Grava as alterações do Cds no banco
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, gravando resgates', 0);
            DBOperEmpAcoes.Clear;
            Result := ApplyCds(FCdsResgEmpAcoes, DBOperEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create(DBOperEmpAcoes.MessageInfo);
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            //            Exclui os lançamentos contábeis e financeiros dos registros excluídos
            FCdsResgEmpAcoes.StatusFilter := [usDeleted];
            FCdsResgEmpAcoes.Filtered := True;
            FCdsResgEmpAcoes.First;
            while not FCdsResgEmpAcoes.Eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, excluindo contábil / financeiro dos resgates', 0);
               if not FCdsResgEmpAcoes.FieldByName('PLNCODIGO').IsNull then
               begin
                  if not CtrlInvContab.InvExcluiLanc(FCdsResgEmpAcoes.FieldByName('PLNCODIGO').AsInteger, 0,
                                                     CtrlInvContab.UsaPlanoPatro, False, 1) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis' + #13 +
                                            'Mensagem: ' + CtrlInvContab.MessageInfo);
                  if not CtrlInvContab.Documento.Delete(FCdsResgEmpAcoes.FieldByName('CODDOCUMENTO').AsInteger) then
                     Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                                            'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
               end;
               if FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime < CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime,
                                       True, FCdsResgEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento' + #13 +
                                            'Mensagem: ' + MessageInfo);
               end;
               FCdsResgEmpAcoes.Next;
            end;
            FCdsResgEmpAcoes.StatusFilter := [];
            FCdsResgEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);


            //            Grava o histórico dos novos resgates
            FCdsResgEmpAcoes.StatusFilter := [usInserted];
            FCdsResgEmpAcoes.Filtered := True;
            FCdsResgEmpAcoes.First;
            FPlano := -1;
            FPlanilha := -1;
            FDocumento := -1;
            while not FCdsResgEmpAcoes.eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, gravando histórico de resgate', 0);
               Result := GravaHistEmpAcoes(FCdsResgEmpAcoes.FieldByName('IDOPEREMPACOES').AsInteger);
               if not Result then
                  Raise Exception.Create(MessageInfo);
               if FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime <= CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime, True,
                                       FCdsResgEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');
               end;
               FCdsResgEmpAcoes.Next;
            end;
            FCdsResgEmpAcoes.StatusFilter := [];
            FCdsResgEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
            if bComitLocal then
               Commit;
               
            Result := True;
         except
            on E:Exception do
            begin
               FCdsOperEmpAcoes.StatusFilter := [];
               FCdsOperEmpAcoes.Filtered := False;
               FCdsResgEmpAcoes.StatusFilter := [];
               FCdsResgEmpAcoes.Filtered := False;
               FCdsResgEmpAcoes.StatusFilter := [];
               FCdsResgEmpAcoes.Filtered := False;
               FCdsHistEmpAcoes.StatusFilter := [];
               FCdsHistEmpAcoes.Filtered := False;
               
               Result := False;

               //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
               if bComitLocal then
                  RollBack;
                  
               MessageInfo := E.Message;
            end;
         end;
      finally
         DBOperEmpAcoes.Clear;
         DBHistEmpAcoes.Clear;
         if Assigned(AtualizaProc) then
            AtualizaProc('', -3);
      end;
   end;
end;

function TCtrlEmpAcoes.ExcluiOperEmpAcoes: Boolean;
var bTransacao: Boolean;
    iOperacao: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExcluiOperEmpAcoes;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         try // Except

            MessageInfo := '';

            if Assigned(AtualizaProc) then
               AtualizaProc('', 7);

            if not InTransaction then
            begin
               bTransacao := True;
               StartTransaction;
            end
            else
               bTransacao := False;

            // ---------  Se for exclusão do pai...
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, preparando registros para exclusão', 0);
            FCdsOperEmpAcoes.StatusFilter := [usDeleted];
            FCdsOperEmpAcoes.Filtered := True;
            if not FCdsOperEmpAcoes.IsEmpty then
            begin
               FCdsResgEmpAcoes.First;
               while not FCdsResgEmpAcoes.eof do
                  FCdsResgEmpAcoes.Delete;
               FCdsHistEmpAcoes.First;
               while not FCdsHistEmpAcoes.eof do
                  FCdsHistEmpAcoes.Delete;
            end
            else
            begin
               //Filtra os deletados
               FCdsResgEmpAcoes.StatusFilter := [usDeleted];
               FCdsResgEmpAcoes.Filtered := True;
               //Ordena pela Data e Operação
               FCdsResgEmpAcoes.IndexFieldNames := 'DATAOPERACAO;IDOPEREMPACOES';
               //Posiciona na mais antiga
               FCdsResgEmpAcoes.Last;
               //Posiciona no primeiro histórico com data igual a da operação
               FCdsHistEmpAcoes.Locate('DATAOPERACAO', FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime, []);
               while not FCdsHistEmpAcoes.eof do
               begin
                  if ((FCdsHistEmpAcoes.FieldByName('IDTIPOOPERACAO').AsInteger = FCdsResgEmpAcoes.FieldByName('IDTIPOOPERACAO').AsInteger) and
                      (FCdsHistEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime = FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime)) or
                     (FCdsHistEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime > FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime) then
                      FCdsHistEmpAcoes.Delete
                  else
                     FCdsHistEmpAcoes.Next;
               end;
            end;
            FCdsResgEmpAcoes.IndexFieldNames := '';
            FCdsOperEmpAcoes.StatusFilter := [];
            FCdsOperEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);


            // ---------  Exclui os históricos
            // Aplica alterações no banco
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, excluindo históricos', 0);
            DBHistEmpAcoes.Clear;
            Result := ApplyCds(FCdsHistEmpAcoes, DBHistEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create(DBHistEmpAcoes.MessageInfo);
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // Exclui os lancamentos contábeis
            FCdsHistEmpAcoes.StatusFilter := [usDeleted];
            FCdsHistEmpAcoes.Filtered := True;
            FCdsHistEmpAcoes.First;
            while not FCdsHistEmpAcoes.eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, excluindo contabilidade', 0);
               if not FCdsHistEmpAcoes.FieldByName('PLNCODIGO').IsNull then
               begin
                  if not CtrlInvContab.InvExcluiLanc(FCdsHistEmpAcoes.FieldByName('PLNCODIGO').AsInteger, 0,
                                                     CtrlInvContab.UsaPlanoPatro, False, 1) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' +
                                            FCdsHistEmpAcoes.FieldByName('PLNCODIGO').AsString);
               end;
               if FCdsHistEmpAcoes.FieldByName('DATAHISTEMPACOES').AsDateTime < CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsHistEmpAcoes.FieldByName('DATAHISTEMPACOES').AsDateTime,
                                       True, FCdsHistEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');
               end;
               FCdsHistEmpAcoes.Next;
            end;
            FCdsHistEmpAcoes.StatusFilter := [];
            FCdsHistEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // ---------  Exclui os resgates
            // Aplica alterações no banco
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, excluindo resgates', 0);
            DBOperEmpAcoes.Clear;
            Result := ApplyCds(FCdsResgEmpAcoes, DBOperEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create(DBOperEmpAcoes.MessageInfo);
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // Exclui Contabil e Financeiro
            FCdsResgEmpAcoes.StatusFilter := [usDeleted];
            FCdsResgEmpAcoes.Filtered := True;
            FCdsResgEmpAcoes.First;
            while not FCdsResgEmpAcoes.eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, excluindo contabil e financeiro dos resgates', 0);
               if not FCdsResgEmpAcoes.FieldByName('PLNCODIGO').IsNull then
               begin
                  // Exclui os lancamentos contábeis
                  if not CtrlInvContab.InvExcluiLanc(FCdsResgEmpAcoes.FieldByName('PLNCODIGO').AsInteger, 0,
                                                     CtrlInvContab.UsaPlanoPatro, False, 1) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis ' + #13 +
                                            'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
               end;
               if not FCdsResgEmpAcoes.FieldByName('CODDOCUMENTO').IsNull then
               begin
                  // Exclui os lancamentos Financeiros
                  if not CtrlInvContab.Documento.Delete(FCdsResgEmpAcoes.FieldByName('CODDOCUMENTO').AsInteger) then
                     Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                                            'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
               end;
               if FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime < CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsResgEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime,
                                       True, FCdsResgEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');
               end;
               FCdsResgEmpAcoes.Next;
            end;
            FCdsResgEmpAcoes.StatusFilter := [];
            FCdsResgEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // ---------  Exclui a operação de Empréstimo
            // Aplica as alterações no banco
            if Assigned(AtualizaProc) then
               AtualizaProc('Aguarde, excluindo empréstimo', 0);
            DBOperEmpAcoes.Clear;
            Result := ApplyCds(FCdsOperEmpAcoes,DBOperEmpAcoes,[],[]);
            if not Result then
               Raise Exception.Create(DBOperEmpAcoes.MessageInfo);
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            // Exclui Contábil e Financeiro
            FCdsOperEmpAcoes.StatusFilter := [usDeleted];
            FCdsOperEmpAcoes.Filtered := True;
            FCdsOperEmpAcoes.First;
            while not FCdsOperEmpAcoes.eof do
            begin
               if Assigned(AtualizaProc) then
                  AtualizaProc('Aguarde, excluindo contabil e financeiro dos empréstimos', 0);
               if not FCdsOperEmpAcoes.FieldByName('PLNCODIGO').IsNull then
               begin
                  // Exclui os lancamentos contábeis
                  if not CtrlInvContab.InvExcluiLanc(FCdsOperEmpAcoes.FieldByName('PLNCODIGO').AsInteger, 0,
                                                     CtrlInvContab.UsaPlanoPatro, False, 1) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis ' + #13 +
                                            'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
               end;
               if not FCdsOperEmpAcoes.FieldByName('CODDOCUMENTO').IsNull then
               begin
                  // Exclui os lancamentos Financeiros
                  if not CtrlInvContab.Documento.Delete(FCdsOperEmpAcoes.FieldByName('CODDOCUMENTO').AsInteger) then
                     Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                                            'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
               end;
               if FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime < CtrlPInv.DataUltFechEmp then
               begin
                  if not MudaFlgReproc(FCdsOperEmpAcoes.FieldByName('DATAOPERACAO').AsDateTime,
                                       True, FCdsOperEmpAcoes.FieldByName('IDOPEREMPACOESAP').AsInteger) then
                     Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');
               end;
               FCdsOperEmpAcoes.Next;
            end;
            FCdsOperEmpAcoes.StatusFilter := [];
            FCdsOperEmpAcoes.Filtered := False;
            if Assigned(AtualizaProc) then
               AtualizaProc('', -1);

            if bTransacao then
               Commit;
            Result := True;
         except
            on E:Exception do
            begin
               FCdsOperEmpAcoes.StatusFilter := [];
               FCdsOperEmpAcoes.Filtered := False;
               FCdsResgEmpAcoes.StatusFilter := [];
               FCdsResgEmpAcoes.Filtered := False;
               FCdsResgEmpAcoes.StatusFilter := [];
               FCdsResgEmpAcoes.Filtered := False;
               FCdsResgEmpAcoes.IndexFieldNames := '';
               Result := False;
               if bTransacao then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally
         FDBOperEmpAcoes.Clear;
         FDBHistEmpAcoes.Clear;
         _Cds.Close;
         if Assigned(AtualizaProc) then
            AtualizaProc('', -3);
      end;
   end;
end;

function TCtrlEmpAcoes.GravaHistEmpAcoes(iOperEmpAcoes: Integer = -1;
                                         dDataProc: TDateTime = 0; iOperAP: Integer = -1; iInv: Integer = -1; iPlano: Integer = -1;
                                         fValor: Double = 0): Boolean;
var bTransacao: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaHistEmpAcoes(iOperEmpAcoes);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally

         MessageInfo := '';

         try // Except
            bTransacao := False;
            if not InTransaction then
            begin
               bTransacao := True;
               StartTransaction;
            end;

            // ---------  Caso seja histórico de uma operação
            if iOperEmpAcoes > 0 then
            begin
               // ---------  Prepara o DBObject
               FDBOperEmpAcoes.Clear;
               FDBOperEmpAcoes.Idoperempacoes.AsInteger := iOperEmpAcoes;
               FDBOperEmpAcoes.LoadFromDb;

               // ---------  Captura o último saldo
               BuscaSaldoEmp.Executa(FDBOperEmpAcoes.Dataoperacao.AsDateTime,
                                     FDBOperEmpAcoes.Idoperempacoesap.AsInteger,
                                     FDBOperEmpAcoes.Idinvestimento.AsInteger,
                                     FDBOperEmpAcoes.Idplanprevctbpatr.AsInteger);

               // ---------  Carrega os valores atuais no DBObject
               FDBHistEmpAcoes.Clear;
               FDBHistEmpAcoes.Idempresaprop.AsInteger := CtrlPInv.IDEmpresa;
               FDBHistEmpAcoes.Idmodulo.AsInteger := CtrlPInv.IDModulo;
               FDBHistEmpAcoes.Idplanprevctbpatr.AsInteger := FDBOperEmpAcoes.Idplanprevctbpatr.AsInteger;
               FDBHistEmpAcoes.Idcustodiante.AsInteger := FDBOperEmpAcoes.Idcustodiante.AsInteger;
               FDBHistEmpAcoes.Idcarteirainvest.AsInteger := FDBOperEmpAcoes.Idcarteirainvest.AsInteger;
               FDBHistEmpAcoes.Idinvestimento.AsInteger := FDBOperEmpAcoes.Idinvestimento.AsInteger;
               FDBHistEmpAcoes.Idtipoinvest.AsInteger := 2;
               FDBHistEmpAcoes.Idtipooperacao.AsInteger := FDBOperEmpAcoes.Idtipooperacao.AsInteger;
               FDBHistEmpAcoes.Idoperempacoes.AsInteger := FDBOperEmpAcoes.Idoperempacoes.AsInteger;
               FDBHistEmpAcoes.Idoperempacoesap.AsInteger := FDBOperEmpAcoes.Idoperempacoesap.AsInteger;
               FDBHistEmpAcoes.Datahistempacoes.AsDateTime := FDBOperEmpAcoes.Dataoperacao.AsDateTime;
               FDBHistEmpAcoes.Qtdhistempacoes.AsInteger := FDBOperEmpAcoes.Qtdoperacao.AsInteger;

               // ---------  Verifica se é para reprocessar
//               if FDBOperEmpAcoes.Dataoperacao.AsDateTime < CtrlPInv.DataUltFechEmp then
//                  FDBHistEmpAcoes.Flgrecalc.AsString := 'S';

               // ---------  Calcula saldos de Empréstimo novo
               if (FDBOperEmpAcoes.Idtipooperacao.AsInteger = -52) or
                  (FDBOperEmpAcoes.Idtipooperacao.AsInteger = -10052) then      // Empréstimo
               begin
                  FDBHistEmpAcoes.Vlrhistempacoes.AsFloat := Abs(FDBOperEmpAcoes.Vlroperacao.AsFloat);  // Verificar este valor {fVlrOper - VLRRESGATEATU}
                  FDBHistEmpAcoes.Sldhistempacoes.AsFloat := BuscaSaldoEmp.HSSldVlrEmp + FDBOperEmpAcoes.Vlroperacao.AsFloat;
                  FDBHistEmpAcoes.Sldqtdhistempacoe.AsFloat := BuscaSaldoEmp.HSSldQtdEmp + FDBOperEmpAcoes.Qtdoperacao.AsFloat;
                  FDBHistEmpAcoes.Vlrfinal.AsFloat := Abs(FDBOperEmpAcoes.Vlrresgate.AsFloat);
                  FDBHistEmpAcoes.Sldfinal.AsFloat := BuscaSaldoEmp.HSSldFinEmp + Abs(FDBOperEmpAcoes.Vlrresgate.AsFloat);
                  FDBHistEmpAcoes.Vlrprincipal.AsFloat := Abs(FDBOperEmpAcoes.Vlroperacao.AsFloat);
                  FDBHistEmpAcoes.Sldprincipal.AsFloat := BuscaSaldoEmp.HSSldPriEmp + Abs(FDBOperEmpAcoes.Vlroperacao.AsFloat);
                  FDBHistEmpAcoes.Naturmov.AsString := 'A';
               end
               // ---------  Calcula saldos de resgate
               else if (FDBOperEmpAcoes.Idtipooperacao.AsInteger = -53) or
                       (FDBOperEmpAcoes.Idtipooperacao.AsInteger = -10053) then // Reversão
               begin
                  FDBHistEmpAcoes.Vlrhistempacoes.AsFloat := Abs(FDBOperEmpAcoes.Vlroperacao.AsFloat) * -1;  // Verificar este valor {fVlrOper - VLRRESGATEATU}
                  FDBHistEmpAcoes.Sldhistempacoes.AsFloat := BuscaSaldoEmp.HSSldVlrEmp - FDBOperEmpAcoes.Vlroperacao.AsFloat;
                  FDBHistEmpAcoes.Sldqtdhistempacoe.AsFloat := BuscaSaldoEmp.HSSldQtdEmp - FDBOperEmpAcoes.Qtdoperacao.AsFloat;
                  FDBHistEmpAcoes.Vlrfinal.AsFloat := Abs(FDBOperEmpAcoes.Vlrresgate.AsFloat) * -1;
                  FDBHistEmpAcoes.Sldfinal.AsFloat := BuscaSaldoEmp.HSSldFinEmp - Abs(FDBOperEmpAcoes.Vlrresgate.AsFloat);
                  FDBHistEmpAcoes.Vlrprincipal.AsFloat := (Abs(FDBOperEmpAcoes.Vlroperacao.AsFloat) - Abs(FDBOperEmpAcoes.Vlrjuros.AsFloat) + FDBOperEmpAcoes.Vlrjurosest.AsFloat)* -1;
                  FDBHistEmpAcoes.Sldprincipal.AsFloat := BuscaSaldoEmp.HSSldPriEmp - Abs(FDBHistEmpAcoes.Vlrprincipal.AsFloat);
                  FDBHistEmpAcoes.Vlrjuros.AsFloat := Abs(FDBOperEmpAcoes.Vlrjuros.AsFloat) * -1;
                  FDBHistEmpAcoes.VlrJurosEst.AsFloat := FDBOperEmpAcoes.Vlrjurosest.AsFloat;
                  FDBHistEmpAcoes.Sldjuros.AsFloat := BuscaSaldoEmp.HSSldJurEmp - Abs(FDBOperEmpAcoes.Vlrjuros.AsFloat) + FDBOperEmpAcoes.Vlrjurosest.AsFloat;
                  FDBHistEmpAcoes.Naturmov.AsString := 'D';
                  //Se o saldo for zero (Resgate Total) exclui históricos posteriores

               end;
            end
            else
            //Caso seja histórico de Atualização
            begin
               // ---------  Prepara o DBObject - Busca a Operação Origem
               FDBOperEmpAcoes.Clear;
               FDBOperEmpAcoes.Idoperempacoes.AsInteger := iOperAP;
               FDBOperEmpAcoes.LoadFromDb;

               // ---------  Captura o último saldo
               BuscaSaldoEmp.Executa(dDataProc, iOperAP, iInv, iPlano);

               // ---------  Carrega os valores atuais no DBObject
               FDBHistEmpAcoes.Clear;
               FDBHistEmpAcoes.Idempresaprop.AsInteger := CtrlPInv.IDEmpresa;
               FDBHistEmpAcoes.Idmodulo.AsInteger := CtrlPInv.IDModulo;
               FDBHistEmpAcoes.Idplanprevctbpatr.AsInteger := FDBOperEmpAcoes.Idplanprevctbpatr.AsInteger;
               FDBHistEmpAcoes.Idcustodiante.AsInteger := FDBOperEmpAcoes.Idcustodiante.AsInteger;
               FDBHistEmpAcoes.Idcarteirainvest.AsInteger := FDBOperEmpAcoes.Idcarteirainvest.AsInteger;
               FDBHistEmpAcoes.Idinvestimento.AsInteger := FDBOperEmpAcoes.Idinvestimento.AsInteger;
               FDBHistEmpAcoes.Idtipoinvest.AsInteger := 2;
               FDBHistEmpAcoes.Idtipooperacao.AsInteger := -54;
               FDBHistEmpAcoes.Idoperempacoes.AsInteger := FDBOperEmpAcoes.Idoperempacoes.AsInteger;
               FDBHistEmpAcoes.Idoperempacoesap.AsInteger := FDBOperEmpAcoes.Idoperempacoesap.AsInteger;

               FDBHistEmpAcoes.Datahistempacoes.AsDateTime := dDataProc;
               FDBHistEmpAcoes.Qtdhistempacoes.AsInteger := 0;

               // ---------  Verifica se é para reprocessar
//               if dDataProc < CtrlPInv.DataUltFechEmp then
//                  FDBHistEmpAcoes.Flgrecalc.AsString := 'S';

               // ---------  Calcula saldos de Atualização
               FDBHistEmpAcoes.Vlrhistempacoes.AsFloat := fValor;
               FDBHistEmpAcoes.Sldhistempacoes.AsFloat := BuscaSaldoEmp.HSSldVlrEmp + fValor;
               FDBHistEmpAcoes.Sldqtdhistempacoe.AsFloat := BuscaSaldoEmp.HSSldQtdEmp;
               FDBHistEmpAcoes.Vlrfinal.AsFloat := 0;
               FDBHistEmpAcoes.Sldfinal.AsFloat := BuscaSaldoEmp.HSSldFinEmp;
               FDBHistEmpAcoes.Vlrprincipal.AsFloat := 0;
               FDBHistEmpAcoes.Sldprincipal.AsFloat := BuscaSaldoEmp.HSSldPriEmp;
               FDBHistEmpAcoes.Vlrjuros.AsFloat := fValor;
               FDBHistEmpAcoes.VlrJurosEst.AsFloat := 0;
               FDBHistEmpAcoes.Sldjuros.AsFloat := BuscaSaldoEmp.HSSldJurEmp + fValor;
               FDBHistEmpAcoes.Naturmov.AsString := 'N';

            end;
            //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
            FDBHistEmpAcoes.tipolancamento.AsString := 'M';

            // ---------  Grava o histórico no banco
            if not FDBHistEmpAcoes.Insert then
               Raise Exception.Create(FDBHistEmpAcoes.MessageInfo)
            else
            // ---------  Carrega a property com o ID recém incluído
               FIdHistEmpAcoes := FDBHistEmpAcoes.Idhistempacoes.AsInteger;

            if bTransacao then
               Commit;
            Result := True;
         except
            on E:Exception do
            begin
               Result := False;
               if bTransacao then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally
         FDBOperEmpAcoes.Clear;
         FDBHistEmpAcoes.Clear;
      end;
   end;

end;


function TCtrlEmpAcoes.AtualizaEmpAcoes(dDataProc: TDateTime;
                                        iPlano: Integer = -1; iInv: Integer = -1; iOperAplic: Integer = -1): Boolean;
var sSql: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AtualizaEmpAcoes(dDataProc, iPlano, iInv, iOperAplic);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         MessageInfo := '';
         try // Except


            // TERMINAR O MÉTODO

{            sSql := 'SELECT ' + #13 +
                    QuotedStr(FormatDateTime('dd/mm/yyyy',dtOperacao.Date))   + ' AS DATAEMISSAO,' + #13 +
                    QuotedStr(FormatDateTime('dd/mm/yyyy',dtVencimento.Date)) + ' AS DATAATUAL,' + #13 +
                    QuotedStr(cdsTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString) + ' AS NATUREZAOPER,' + #13 +
                    FuncoesInvest.TrocaVirgulaPonto(FormatFloat('0.##',dbreValor.Value))    + ' AS VLRPRINCIPAL,' + #13 +
                    FuncoesInvest.TrocaVirgulaPonto(FormatFloat('0.##',dbreTaxa.Value))     + ' AS TAXA,' + #13 +
                    '1 AS IDPAIS, -1 AS IDCIDADES, -1 AS CODESTADO' + #13 +
                    'FROM DUAL';

            CtrlEmpAcoes.FazRegra(CtrlPInv.IdRegraEmpAcoes, nil, sSql);
            dbreVlrMaxResgate.Value := CtrlEmpAcoes.RegraResult; }



         except
            on E:Exception do
            begin
               Result := False;
               MessageInfo := E.Message;
            end;
         end;
      finally

      end;
   end;
end;

function TCtrlEmpAcoes.ExcluiHistoricos(dDataRef: TDateTime; iOperEmpAcoes: Integer; iHistorico: Integer = -1; bExcluiFuturo: Boolean = True): Boolean;
var bTransacao: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExcluiHistoricos(dDataRef, iOperEmpAcoes, iHistorico, bExcluiFuturo);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         MessageInfo := '';
         try // Except
            if not InTransaction then
            begin
               StartTransacao;
               bTransacao := True;
            end
            else bTransacao := False;

            _Cds.Data := GetDataPacket(
                                 'SELECT IDHISTEMPACOES ' +
                                 'FROM HISTEMPACOES ' +
                                 'WHERE IDOPEREMPACOESAP = ' + IntToStr(iOperEmpAcoes) + ' ' +
                                 '  AND DATAHISTEMPACOES ' + FuncoesInvest.IIF(bExcluiFuturo, '>', '=') + ' TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' +
                                 FuncoesInvest.IIF((iHistorico > 0), '  AND IDHISTEMPACOES = ' + IntToStr(iHistorico), '') +
                                 'ORDER BY DATAHISTEMPACOES, IDHISTEMPACOES ');
            while not _Cds.eof do
            begin
               DBHistEmpAcoes.IdHistEmpAcoes.AsInteger := _Cds.FieldByName('IDHISTEMPACOES').AsInteger;
               DBHistEmpAcoes.LoadFromDb;
               if not DBHistEmpAcoes.Delete then
                  Raise Exception.Create(DBHistEmpAcoes.MessageInfo);
               _Cds.Next;
            end;

            if bTransacao then
               Commit;

         except
            on E:Exception do
            begin
               Result := False;
               if bTransacao then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally

      end;
   end;
end;

//----------------  Métodos Diversos  ------------------------------------
function TCtrlEmpAcoes.GetSequence(Sufixo: String): Cardinal;
begin
   Result := Inherited GetSequence(Sufixo);
end;

function TCtrlEmpAcoes.VerificaSaldoEmp(dDataSaldo: TDateTime;
                                        iPlanoPatro: Integer = -1;
                                        iInvestimento: Integer = -1;
                                        iCustodiante: Integer = -1;
                                        iTipoOper: Integer = 0): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.VerificaSaldoEmp(dDataSaldo, iPlanoPatro, iInvestimento, iCustodiante, iTipoOper);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         MessageInfo := '';
         try // Except
            CtrlRV.BuscaSaldoRV.Executa(dDataSaldo, iPlanoPatro, iInvestimento, CtrlPInv.IdCartEmpAcoes, -1, MaxInt, iCustodiante, '', CtrlPInv.IdMotBloqEmpAC);

            BuscaSaldoEmp.ExecutaQtdInv(dDataSaldo, iInvestimento, iPlanoPatro, iCustodiante);

            FSaldoQtdCC := 0;
            FSaldoQtdCCI := 0;

            Case iTipoOper of
               -52, -10052:
               begin
                  //No Empréstimo, é o saldo a ser emprestado
                  FSaldoQtdCC := (Round(CtrlRV.BuscaSaldoRV.SldQtdCustodiaCC) - BuscaSaldoEmp.INVSaldoQtdCC);
                  FSaldoQtdCCI := (Round(CtrlRV.BuscaSaldoRV.SldQtdCustodiaCCI) - BuscaSaldoEmp.INVSaldoQtdCCI);
               end;
               -53, -10053:
               begin
                  //Na Reversão, é o saldo emprestado
                  FSaldoQtdCC := BuscaSaldoEmp.INVSaldoQtdCC;
                  FSaldoQtdCCI := BuscaSaldoEmp.INVSaldoQtdCCI;
               end;
               -54, -10054:
               begin
                  //Na Atualização, é o saldo emprestado
                  FSaldoQtdCC := BuscaSaldoEmp.INVSaldoQtdCC;
                  FSaldoQtdCCI := BuscaSaldoEmp.INVSaldoQtdCCI;
               end;
            end;
         except
            on E:Exception do
            begin
               FSaldoQtdCC := 0;
               FSaldoQtdCCI := 0;
               Result := False;
               MessageInfo := E.Message;
            end;
         end;
      finally

      end;
   end;
end;

function TCtrlEmpAcoes.BuscaCotacao(dDataSaldo: TDateTime; iInvestimento: Integer): Boolean;
begin
   try
      MessageInfo := '';
      try
         _Cds.Data := CtrlRV.ListCotacaoInvest(dDataSaldo, iInvestimento);
         if _Cds.IsEmpty then
            Raise Exception.Create('Não foi encotrada cotação para este investimento até esta data');
         FCotacaoData := _Cds.FieldByName('DATACOTACAO').AsDateTime;
         FCotacaoValor := _Cds.FieldByName('VLRCONTABIL').AsFloat / _Cds.FieldByName('QTDTITLOTE').AsInteger;
         FCotacaoLote := _Cds.FieldByName('QTDTITLOTE').AsInteger;
         Result := True;
      except On E: Exception do
         begin
            FCotacaoData := 0;
            FCotacaoValor := 0;
            FCotacaoLote := 0;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      _Cds.Close;
   end;
end;

function TCtrlEmpAcoes.FazRegra(iRegra: Integer; cds: TCMClientDataSet = nil; sSql: String = ''): Boolean;
var RegraMT : TCtrlRegra;
begin
   MessageInfo := '';
   if (cds = nil) and (sSql = '') then
   begin
      Result := False;
      FRegraResult := 0;
      MessageInfo := 'Faltam parâmetros de entrada para cálculo da regra';
      Exit;
   end;

   try
      RegraMT := TCtrlRegra.Create;
      RegraMT.InitializeAs( Padroes );
      RegraMT.IdEmpresa   := CtrlPInv.IDEmpresa;
      RegraMT.TipoCliente := tcFundacao;
      try
         RegraMT.RuleNumber := IntToStr(iRegra);
         if cds <> nil then
            RegraMT.ClientDataSetIn := cds
         else if sSql <> '' then
            RegraMT.GeraDataSet(sSql);
         RegraMT.Execute;
         FRegraResult := StrToFloat(FuncoesInvest.TrocaPontoVirgula(RegraMT.Result));
         Result := True;
      except
         on E: Exception do
         begin
            Result := False;
            FRegraResult := 0;
            MessageInfo := E.Message;
         end;
      end;
   finally
      FreeAndNil(RegraMT);
   end;
end;

function TCtrlEmpAcoes.GeraBoleta(dDataBoleta: TDateTime): String;
var sData: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GeraBoleta(dDataBoleta);
      if (Result = '') then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';
      try
         sData := FormatDateTime('dd/mm/yyyy', dDataBoleta);
         Result := 'EM-' + Copy(sData, 9, 2) + '/' + FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(sData, 9, 2)));
      except
         on E: Exception do
         begin
            Result := '';
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlEmpAcoes.MudaFlgReproc(dDataProc: TDateTime; bMarca: Boolean = True;
                                      iOperEmpAP: Integer = -1; iInv: Integer = -1; iPlano: Integer = -1): Boolean;
var sSql: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.MarcaFlgReproc(dDataProc, bMarca, iOperEmpAP, iInv, iPlano);
      if Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         MessageInfo := '';
         sSql := 'UPDATE HISTEMPACOES SET FLGRECALC = ' + FuncoesInvest.IIF(bMarca, QuotedStr('S'), 'NULL') + #13 +
                 'WHERE (IDHISTEMPACOES IN ' + #13 +
                 '        (SELECT MIN(H2.IDHISTEMPACOES) ' + #13 +
                 '         FROM HISTEMPACOES H2 ' + #13 +
                 '         WHERE ((H2.DATAHISTEMPACOES || H2.IDINVESTIMENTO || H2.IDOPEREMPACOESAP || H2.IDPLANPREVCTBPATR) IN ' + #13 +
                 '                   (SELECT (MAX(H3.DATAHISTEMPACOES) || H3.IDINVESTIMENTO || H3.IDOPEREMPACOESAP || H3.IDPLANPREVCTBPATR) ' + #13 +
                 '                    FROM HISTEMPACOES H3 ' + #13 +
                 '                    WHERE (H3.DATAHISTEMPACOES <= TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ',' + QuotedStr('DD/MM/YYYY') + '))' + #13;
         if iOperEmpAP > 0 then
            sSql := sSql +
                 '                      AND (H3.IDOPEREMPACOESAP = ' + intToStr(iOperEmpAP) + ' ) ' + #13;
         if iInv > 0 then
            sSql := sSql +
                 '                      AND (H3.IDINVESTIMENTO = ' + intToStr(iInv) + ' ) ' + #13;
         if iPlano > 0 then
            sSql := sSql +
                 '                      AND (H3.IDPLANPREVCTBPATR = ' + intToStr(iPlano) + ' ) ' + #13;
         sSql := sSql +
                 '                    GROUP BY H3.IDINVESTIMENTO, H3.IDOPEREMPACOESAP, H3.IDPLANPREVCTBPATR) ) ' + #13;
         if iOperEmpAP > 0 then
            sSql := sSql +
                 '           AND (H2.IDOPEREMPACOESAP = ' + intToStr(iOperEmpAP) + ' ) ' + #13;
         if iInv > 0 then
            sSql := sSql +
                 '           AND (H2.IDINVESTIMENTO = ' + intToStr(iInv) + ' ) ' + #13;
         if iPlano > 0 then
            sSql := sSql +
                 '           AND (H2.IDPLANPREVCTBPATR = ' + intToStr(iPlano) + ' ) ' + #13;
         sSql := sSql +
                 '           AND (NOT EXISTS (SELECT H4.IDOPEREMPACOES ' + #13 +
                 '                            FROM HISTEMPACOES H4 ' + #13 +
                 '                            WHERE H4.IDINVESTIMENTO = H2.IDINVESTIMENTO ' + #13 +
                 '                              AND H4.IDOPEREMPACOESAP = H2.IDOPEREMPACOESAP ' + #13 +
                 '                              AND H4.DATAHISTEMPACOES = H2.DATAHISTEMPACOES ' + #13 +
                 '                              AND ((H4.SLDQTDHISTEMPACOE = 0) OR (H4.FLGRECALC = ' + FuncoesInvest.IIF(bMarca, 'NULL', QuotedStr('S')) + ')) )) ' + #13 +
                 '         GROUP BY H2.IDINVESTIMENTO, H2.IDOPEREMPACOESAP, H2.IDPLANPREVCTBPATR)) ' + #13 +
                 '  AND (SLDQTDHISTEMPACOE > 0)';

         if not ExecSQL(sSql) then
            Raise Exception.Create(MessageInfo);

         Result := True;
      except
         on E: Exception do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.EmpMarcado(iOperEmpAcoesAP: Integer = 0; sNumContratro : String = ''): Boolean;
var sSql: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := not Connection.AppServer.EmpMarcado(iOperEmpAcoesAP,sNumContratro);
      if Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         MessageInfo := '';
         try // Except

            // -----       ATENÇÃO: O Result deste método é invertido
            //                      Resulta True se estiver marcado
            sSql := 'SELECT DATAHISTEMPACOES' + #13 +
                    'FROM HISTEMPACOES' + #13;
            if iOperEmpAcoesAP > 0 then
               sSql := sSql + 'WHERE IDOPEREMPACOESAP = ' + IntToStr(iOperEmpAcoesAP) + #13
            else if  Trim(sNumContratro) <> '' then
               sSql := sSql + 'WHERE NUMCONTRATOCUSTODIA = ' + QuotedStr(TRIM(sNumContratro)) + #13
            else
               sSql := sSql + 'WHERE 1 = 2 ' + #13;

            sSql := sSql +
                    '  AND FLGRECALC = ' + QuotedStr('S') + #13 +
                    'ORDER BY 1';
                    
            _Cds.Data := GetDataPacket(sSql);

            if not _Cds.IsEmpty then
               Raise Exception.Create('Empréstimo marcado para reprocessamento em ' + _Cds.FieldByName('DATAHISTEMPACOES').AsString);

            Result := False;
         except
            on E: Exception do
            begin
               Result := True;
               MessageInfo := E.Message;
            end;
         end;
      finally
         _Cds.Close;
      end;
   end;
end;

//----------------  Métodos Contábeis e Financeiros  ---------------------
//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.IntegraContabCapCar(iInvestimento, iTipoOperacao, iCarteiraInvest, iPlanPrevPatro,
                                           iForCli, iTipoDespInvest: integer; fValor,
                                           fEstornoJuros: Double; dDataProc, dDataVenc: TDateTime;
                                           iFlgContaInvest: Integer = 0;
                                           sHitoricoComp : String = ''): Boolean;
var iFlgGeraContab, iFlgGeraCapCar, iFlgContaInv, iTipoDoc,
    iPlanoPrev, iPatro, iPlanilha : Integer;
    sMensErro, sDescTipoOper, sDescTipoDesp: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.IntegraContabCapCar(iInvestimento, iTipoOperacao, iCarteiraInvest, iPlanPrevPatro,
                                                         iForCli, iTipoDespInvest,
                                                         fValor, fEstornoJuros, dDataProc, dDataVenc, iFlgContaInvest, sHitoricoComp);
      if Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      if CtrlInvContab.IntegraCtbFinModulo then
      begin
         try  //Finally
            MessageInfo := '';
            try  //Except
               // --------  Capta os parametros de contabilização da TipoOperacao e TipoDespInvest
               _Cds.Close;
               _Cds.Data := GetDataPacket('SELECT TIPOOPERACAO.DESCTIPOOPERACAO, TIPOOPERACAO.FLGGERACONTAB, ' + #13 +
                                          '       TIPOOPERACAO.FLGGERACAPCAR, TIPOOPERACAO.CODTIPDOC, TIPOOPERACAO.FLGCONTAINVEST ' + #13 +
                                          'FROM TIPOOPERACAO ' + #13 +
                                          'WHERE TIPOOPERACAO.IDTIPOINVEST = 2 '+ #13 +
                                          '  AND TIPOOPERACAO.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao));

               iFlgGeraContab := _Cds.FieldByName('FLGGERACONTAB').AsInteger;
               iFlgGeraCapCar := _Cds.FieldByName('FLGGERACAPCAR').AsInteger;
               iFlgContaInv   := _Cds.FieldByName('FLGCONTAINVEST').AsInteger;
               iTipoDoc       := _Cds.FieldByName('CODTIPDOC').AsInteger;
               sDescTipoOper  := _Cds.FieldByName('DESCTIPOOPERACAO').AsString;

               if ((iFlgGeraContab = 0) and (iFlgGeraCapCar = 0)) then
               begin
                  _Cds.Close;               
                  Result := True;
                  exit;
               end;

               _Cds.Close;
               _Cds.Data := GetDataPacket('SELECT TIPODESPINVEST.DESCTIPODESPINV ' + #13 +
                                          'FROM DESPESASXTIPOOPER, TIPODESPINVEST ' + #13 +
                                          'WHERE DESPESASXTIPOOPER.IDTIPOINVEST     = 2' + #13 +
                                          '  AND DESPESASXTIPOOPER.IDTIPOOPERACAO   =  ' + IntToStr(iTipoOperacao)+ #13 +
                                          '  AND TIPODESPINVEST.IDTIPODESPINVEST    =  ' + IntToStr(iTipoDespInvest)+ #13 +
                                          '  AND DESPESASXTIPOOPER.IDTIPODESPINVEST = TIPODESPINVEST.IDTIPODESPINVEST');

               sDescTipoDesp  := _Cds.FieldByName('DESCTIPODESPINV').AsString;
               if _Cds.IsEmpty then
                  iTipoDespInvest := 0;

               _Cds.Close;
               _Cds.Data := GetDataPacket('SELECT VWPL.PLANPRVCONTABPATRO, VWPL.PLANOCONTABIL, VWPL.PATROCINADORA, ' + #13 +
                                          '       VWPL.IDPLANPREVCTBPATR, VWPL.IDPLANOPREV, VWPL.IDPATRO ' + #13 +
                                          'FROM VWPLANPREVCTBPATR VWPL ' + #13 +
                                          'WHERE IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevPatro));
               iPlanoPrev := _Cds.FieldByName('IDPLANOPREV').AsInteger;
               iPatro     := _Cds.FieldByName('IDPATRO').AsInteger;

               // Parametros para segregação
               CtrlInvContab.Plano := CtrlInvContab.BuscaPadrLanc.Plano;
               CtrlInvContab.Patro := iPatro;
               CtrlInvContab.PlanPrev := iPlanoPrev;


               // Busca o Padrão de lançamento contábil e financeiro
               if not CtrlInvContab.BuscaPadrLanc.ExecutaEmp(OperComum.RetornaSegmentacaoRV(iInvestimento), iPlanPrevPatro, 2, iTipoOperacao,
                                                             iInvestimento, iCarteiraInvest, iTipoDespInvest, 'OPE', fValor, dDataProc) then
                  Raise Exception.Create('Não foi encontrada parametrização contábil para ' + #13 +
                                         'Operação: ' + sDescTipoOper + #13 +
                                         'Despesa : ' + sDescTipoDesp);

               // Integra Contabilidade ( Testa pelo tipo de operacao e valor )
               if (iFlgGeraContab = 1) and (fValor <> 0) then
               begin
                  iPlanilha := FuncoesInvest.IIF(FPlanilha = -1, 0, FPlanilha);
                  if not OperComum.LancamentoContabil(CtrlPInv.IDEmpresa, CtrlPInv.IDModulo,
                                                      CtrlInvContab.BuscaPadrLanc.Plano,
                                                      CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                      CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                      CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                      iForCli,
                                                      iPlanoPrev,
                                                      iPatro,
                                                      CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                      CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                      CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                      CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                      CtrlInvContab.BuscaPadrLanc.Historico+'  -  '+sHitoricoComp,
                                                      CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                      CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                      dDataProc,
                                                      ABS(fValor),
                                                      False, iPlanilha, sMensErro)  then
                  begin
                     if sMensErro = '' then
                        Raise Exception.Create('Não foi possível efetuar o lançamento contábil')
                     else
                        Raise Exception.Create(sMensErro);
                  end;
                  FPlanilha := iPlanilha;
                  FPlano := FuncoesInvest.IIF(iPlanilha > 0, CtrlInvContab.BuscaPadrLanc.Plano, 0);
               end;

               // Integra Financeiro ( Testa pelo tipo de operacao e valor )
               if ((iFlgGeraCapCar = 1) and (CtrlInvContab.BuscaPadrLanc.RecPagNao <> 'N') and (fValor <> 0)) then
               begin
                  if not LancaDocumento(fValor, iTipoDoc, iForCli, DateToStr(dDataProc), DateToStr(dDataVenc), iFlgContaInv) then
                     Raise Exception.Create('Não foi possível lançar o documento financeiro da operação');
               end;


               // Integra Contabilidade ( Extorna Juros )
               if fEstornoJuros <> 0 then
               begin
                  if not CtrlInvContab.BuscaPadrLanc.ExecutaEmp(OperComum.RetornaSegmentacaoRV(iInvestimento), iPlanPrevPatro, 2, iTipoOperacao,
                                                                iInvestimento, iCarteiraInvest, -6, 'DOP', fEstornoJuros, dDataProc) then
                     Raise Exception.Create('Não foi encontrada parametrização contábil para ' + #13 +
                                            'Estorno de Juros da operação de ' + sDescTipoOper);

                  iPlanilha := FuncoesInvest.IIF(FPlanilha = -1, 0, FPlanilha);
                  if not OperComum.LancamentoContabil(CtrlPInv.IDEmpresa, CtrlPInv.IDModulo,
                                                      CtrlInvContab.BuscaPadrLanc.Plano,
                                                      CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                      CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                      CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                      iForCli,
                                                      iPlanoPrev,
                                                      iPatro,
                                                      CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                      CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                      CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                      CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                      CtrlInvContab.BuscaPadrLanc.Historico,
                                                      CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                      CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                      dDataProc,
                                                      ABS(fEstornoJuros),
                                                      False, iPlanilha, sMensErro)  then
                  begin
                     if sMensErro = '' then
                        Raise Exception.Create('Não foi possível efetuar o lançamento contábil')
                     else
                        Raise Exception.Create(sMensErro);
                  end;

               end;
               Result := True;
            except
               On E: Exception do
               begin
                  Result := False;
                  MessageInfo := E.Message;
               end;
            end;
         finally
            _Cds.Close;
         end;
      end
      else
         Result := True;
   end;
end;

function TCtrlEmpAcoes.LancaDocumento(fValor: Double; iTipoDoc, iForCli : Integer; sDataLanc, sDataVenc: String; iFlgContaInvest: Integer = 0): Boolean;
var iPortador, fNoDocumento, iNumFatura: Integer;
    sComplemento, sStatus, sOperacao, sContaDoc, sDebCre: String;
begin
   Result := False;

   fValor := abs(fValor);
   iPortador := -1;

   // Prepara um novo documento
   CtrlInvContab.Documento.Prepare;

   CtrlInvContab.Documento.GetNoDocumento;
   fNoDocumento := CtrlInvContab.Documento.NoDocumento;

   sComplemento      := '79';
   sStatus           := '';
   iNumFatura        := 0;
   sOperacao         := '2';
   if CtrlInvContab.BuscaPadrLanc.RecPagNao = 'P' then
   begin
      sContaDoc := CtrlInvContab.BuscaPadrLanc.ContaCre;
      sDebCre   := 'C';
   end
   else
   begin
      sContaDoc := CtrlInvContab.BuscaPadrLanc.ContaDeb;
      sDebCre   := 'D';
   end;

   // gera o identificador incremental da tabela DOCUMENTO
   if CtrlInvContab.Documento.GetDocSequence then
      FDocumento := CtrlInvContab.Documento.CodDocumento;

   if Trim(CtrlInvContab.BuscaPadrLanc.RecPagNao) = '' then
      Raise Exception.Create('Tipo de Recebimento/Desembolso não especificado.');
      
   if CtrlInvContab.BuscaPadrLanc.RecPagNao <> 'N' then
   begin
      if Trim(CtrlInvContab.BuscaPadrLanc.TipoRecDes) = '' then
         Raise Exception.Create('Tipo de Recebimento/Desembolso não especificado.');
   end;
   // Cria Documento
   if not CtrlInvContab.Documento.SetValues(FDocumento,
                                            fNoDocumento, sComplemento, sStatus,
                                            CtrlInvContab.BuscaPadrLanc.RecPagNao, sOperacao,
                                            '' {sNumslip}, ''{sNumleitcodbarras},
                                            sContaDoc, CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                            ''{sNossonumero}, ''{sNumdigcodbarras}, ''{sGrupodoc}, ''{sFlgemitelancbaix},
                                            ''{sFlgconfirmarecpag}, ''{sEmisbloq}, ''{sReferencia}, ''{sObs},
                                            StrToDate(sDataVenc) {dDatavencto}, StrToDate(sDataLanc) {dDataemissao},
                                            StrToDate(sDataVenc) {dDataprogramada}, 0{dDataremessa}, 0{dDatalimite}, 0{dDatacorrecao},
                                            0{rVlrmulta}, 0{rValorjuros}, 0{rValordesconto}, 0{rPercjurossimples}, 0{rPercjurosatuarial},
                                            iTipoDoc, CtrlPInv.IDEmpresa, CtrlPInv.IDModulo, iForCli, iNumFatura,
                                            0{liIdcbancaria}, CtrlInvContab.BuscaPadrLanc.UnidNegoc, CtrlInvContab.BuscaPadrLanc.Plano, 0{liNumcpbaixa}, 0{liNumapgr},
                                            CtrlPInv.MoeCodigo, 0{liLotetransmissao}, -1{liIndicecorrecao},
                                            CtrlPInv.IDUsuario, CtrlPInv.IDEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
                                            CtrlInvContab.BuscaPadrLanc.SubContaCre, iPortador, 0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
                                            StrToDate(sDataVenc) {dDataDisp},
                                            CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
      Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

   if iFlgContaInvest > 0 then
      CtrlInvContab.Documento.ContaInvest := iFlgContaInvest;

   if CtrlInvContab.BuscaPadrLanc.RecPagNao <> 'N' then
   begin
      // Cria Rateio
      if not CtrlInvContab.Documento.RateioDocumSetValues(
                           fValor, 0{rValorOM}, 0{rVlrresorcamen},
                           0{liIdrateiodocum}, CtrlPInv.idEmpresa {liIdpessoa},
                           FDocumento, CtrlInvContab.BuscaPadrLanc.UnidNegoc, 0{liMoecodigo}, CtrlPInv.IdUsuario,
                           0{liIdreservaorcamen},
                           CtrlInvContab.Plano, CtrlInvContab.PlanPrev, CtrlInvContab.Patro,
                           CtrlPInv.IdPrograma, // dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                           0{liIdprocesso}, CtrlPInv.idEmpresa,
                           CtrlInvContab.BuscaPadrLanc.TipoRecDes, CtrlInvContab.BuscaPadrLanc.RecPagNao,
                           CtrlInvContab.BuscaPadrLanc.CentroRespon, CtrlInvContab.BuscaPadrLanc.CentroCustoCred, ''{sNumimovel}) then
         Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
   end;

   // Cria LanctoDocum em 3 camadas
   if not CtrlInvContab.Documento.LancoDocumSetValues(
                        StrToDate(sDataLanc), FDocumento, 0 {iNumLancamento},
                        fValor, 0{rValorOM}, fValor,
                        CtrlInvContab.BuscaPadrLanc.UnidNegoc, CtrlInvContab.Planilha, 0{liNumlotemanual},
                        CtrlPInv.idUsuario, CtrlPInv.idEmpresa,
                        0{liIdnflivro}, 0{liEstorno}, iTipoDoc, 0{liCoddocinss}, 0{liCodalterador},
                        sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                        CtrlInvContab.BuscaPadrLanc.Historico, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                        sDebCre, CtrlPInv.IdModulo, CtrlInvContab.Plano,
                        CtrlInvContab.UsaPlanoPatro) then
      Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

   // Finaliza o Documento e gera o CodDocumento
   if CtrlInvContab.Documento.DocumentoPendente then
   begin
      if not CtrlInvContab.Documento.Insert then
         Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
   end;

   Result := True;
end;



//----------------  Métodos Protegidos Próprios  -------------------------
procedure TCtrlEmpAcoes.DoChangeDataBase;
begin
   inherited;
   BuscaSaldoEmp.DataBaseName := DataBaseName;
   FDBOperEmpAcoes.DataBaseName := DataBaseName;
   FDBHistEmpAcoes.DataBaseName := DataBaseName;
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   FDbLancVigEmp.DataBaseName := DataBaseName;
end;

procedure TCtrlEmpAcoes.OnCreateAppServer;
begin
   inherited;
   FCdsOperEmpAcoes := TClientDataSet.Create(nil);
   FCdsHistEmpAcoes := TClientDataSet.Create(nil);
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   FCdsLancVigEmp   := TClientDataSet.Create(nil);
end;

procedure TCtrlEmpAcoes.AfterInitialize;
begin
  inherited;

end;

//----------------  Métodos das properties  -----------------------------
procedure TCtrlEmpAcoes.SetBuscaSaldoEmp(const Value: TBuscaSaldoEmp);
begin
  FBuscaSaldoEmp := Value;
end;

procedure TCtrlEmpAcoes.SetIdOperEmpAcoes(const Value: Integer);
begin
  FIdOperEmpAcoes := Value;
end;

procedure TCtrlEmpAcoes.SetIdHistEmpAcoes(const Value: Integer);
begin
  FIdHistEmpAcoes := Value;
end;

procedure TCtrlEmpAcoes.SetCdsOperEmpAcoes(const Value: TClientDataSet);
begin
  FCdsOperEmpAcoes := Value;
end;

procedure TCtrlEmpAcoes.SetCdsResgEmpAcoes(const Value: TClientDataSet);
begin
  FCdsResgEmpAcoes := Value;
end;

procedure TCtrlEmpAcoes.SetDBOperEmpAcoes(const Value: TDbOperEmpAcoes);
begin
  FDBOperEmpAcoes := Value;
end;

procedure TCtrlEmpAcoes.SetCdsHistEmpAcoes(const Value: TClientDataSet);
begin
  FCdsHistEmpAcoes := Value;
end;

procedure TCtrlEmpAcoes.SetDBHistEmpAcoes(const Value: TDbHistEmpAcoes);
begin
  FDBHistEmpAcoes := Value;
end;

procedure TCtrlEmpAcoes.SetSaldoQtdCC(const Value: Integer);
begin
  FSaldoQtdCC := Value;
end;

procedure TCtrlEmpAcoes.SetSaldoQtdCCI(const Value: Integer);
begin
  FSaldoQtdCCI := Value;
end;

procedure TCtrlEmpAcoes.SetCotacaoData(const Value: TDateTime);
begin
  FCotacaoData := Value;
end;

procedure TCtrlEmpAcoes.SetCotacaoLote(const Value: Integer);
begin
  FCotacaoLote := Value;
end;

procedure TCtrlEmpAcoes.SetCotacaoValor(const Value: Double);
begin
  FCotacaoValor := Value;
end;

procedure TCtrlEmpAcoes.SetRegraResult(const Value: Double);
begin
  FRegraResult := Value;
end;

procedure TCtrlEmpAcoes.SetPlano(const Value: Integer);
begin
  FPlano := Value;
end;

procedure TCtrlEmpAcoes.SetDocumento(const Value: Integer);
begin
  FDocumento := Value;
end;

procedure TCtrlEmpAcoes.SetPlanilha(const Value: Integer);
begin
  FPlanilha := Value;
end;

//******************************************************************************
//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.AplicaAtualLancVigEmp : boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualLancVigEmp(FCdsLancVigEmp.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         Result := ApplyCds(FCdsLancVigEmp ,DbLancVigEmp,[],[]);

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbLancVigEmp.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
procedure TCtrlEmpAcoes.SetCdsLancVigEmp(const Value: TClientDataSet);
begin
   FCdsLancVigEmp := Value;
end;

procedure TCtrlEmpAcoes.SetDbLancVigEmp(const Value: TDbLancVigEmp);
begin
   FDbLancVigEmp := Value;
end;

function TCtrlEmpAcoes.ListLancVigEmp(iLancVigEmp : Integer = 0;
                                      dDataVigente: TDateTime = 0): OleVariant;
var sSql : String;
    bPrimeiro : Boolean;
begin
   sSql := '';
   sSql := sSql + 'SELECT LANCVIGEMP.IDLANCVIGEMP, ';
   sSql := sSql + '       LANCVIGEMP.DATAVIGENTE, ';
   sSql := sSql + '       LANCVIGEMP.TIPOLANC, ';
   sSql := sSql + '       case LANCVIGEMP.TIPOLANC ';
   sSql := sSql + '        when ''I'' then ''Importado''';
   sSql := sSql + '        when ''M'' then ''Manual''';
   sSql := sSql + '        else ';
   sSql := sSql + '             ''Campo em branco ou valor incorreto''';
   sSql := sSql + '        end as DESCRICAO ';
   sSql := sSql + 'FROM LANCVIGEMP ';
   bPrimeiro := (iLancVigEmp > 0);
   if iLancVigEmp > 0 then
      sSql := sSql + 'WHERE LANCVIGEMP.IDLANCVIGEMP = ' + IntToStr(iLancVigEmp);

   if dDataVigente > 0 then
   begin
      if bPrimeiro then
         sSql := sSql + ' AND '
      else
         sSql := sSql + ' WHERE ';

      sSql := sSql + ' LANCVIGEMP.DATAVIGENTE = (SELECT MAX(P.DATAVIGENTE) AS DATAVIGENTE ';
      sSql := sSql + ' FROM LANCVIGEMP P ';
      sSql := sSql + ' WHERE ';
      sSql := sSql + '      P.DATAVIGENTE <= TO_DATE('+QuotedStr(DateToStr(dDataVigente))+','+QuotedStr('DD/MM/YYYY')+'))';
   end;

   sSql := sSql + ' ORDER BY LANCVIGEMP.DATAVIGENTE DESC';

   Result := GetDataPacket(sSql);

end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.AtualizaHistorico(dDataRef : TDateTime; iInvest, iPlanPrev : Integer): Boolean;
var bTransacao: Boolean;
    CdsAux : TCMClientDataSet;
    fSldJuros, fValor : Double;
    sSql : String;
//    QryRegra :TwwQuery;
//  RegraLocal: TRegra ;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AtualizaHistorico(dDataRef, iInvest, iPlanPrev);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         MessageInfo := '';

{               QryRegra                 := TwwQuery.Create(Nil);
               QryRegra.DatabaseName    := 'BaseDados';
     RegraLocal               := TRegra.Create(Nil);
     RegraLocal.DatabaseName  := 'BaseDados';  }

         try // Except
            if not InTransaction then
            begin
               StartTransacao;
               bTransacao := True;
            end
            else bTransacao := False;

            _Cds.Data := GetDataPacket('SELECT DISTINCT H.IDHISTEMPACOES, H.SLDPRINCIPAL, O.TAXAOPERACAO, O.DATAOPERACAO, O.NUMCONTRATOCUSTODIA ' +
                                       'FROM HISTEMPACOES H, ' +
                                       '(SELECT MAX(O1.DATAOPERACAO) DATAOPERACAO, O1.NUMCONTRATOCUSTODIA, O1.TAXAOPERACAO '+
                                       ' FROM OPEREMPACOES O1 '+
                                       ' WHERE  O1.DATAOPERACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' +
                                       ' AND O1.NUMCONTRATOCUSTODIA IS NOT NULL '+
                                       ' GROUP BY O1.NUMCONTRATOCUSTODIA, O1.TAXAOPERACAO) O '+
                                       'WHERE H.DATAHISTEMPACOES = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' +
                                        FuncoesInvest.IIF((iInvest > 0), '  AND H.IDINVESTIMENTO = ' + IntToStr(iInvest), ' ') +
                                        FuncoesInvest.IIF((iPlanPrev > 0), '  AND H.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev), ' ') +
                                       '  AND H.NUMCONTRATOCUSTODIA = O.NUMCONTRATOCUSTODIA ' +
                                       '  AND H.SLDQTDHISTEMPACOE > 0 ' +
                                       '  AND H.PLNCODIGO IS NULL  '+
                                       'ORDER BY H.IDHISTEMPACOES ');
            while not _Cds.eof do
            begin 
               fSldJuros := 0;

               try
                  CdsAux := TCMClientDataSet.Create(nil);
                  CdsAux.Close;
                  
                  CdsAux.Data := GetDataPacket('SELECT H.SLDJUROS FROM HISTEMPACOES H '+
                                               'WHERE  H.NUMCONTRATOCUSTODIA = ' + _Cds.FieldByName('NUMCONTRATOCUSTODIA').AsString +
                                               '  AND  H.DATAHISTEMPACOES = '+
                                               '  (SELECT MAX(H1.DATAHISTEMPACOES) AS DATAHISTEMPACOES '+
                                               '   FROM HISTEMPACOES H1 '+
                                               '   WHERE H1.DATAHISTEMPACOES < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('dd/mm/yyyy') + ') '+
                                               '     AND H1.NUMCONTRATOCUSTODIA = '+ _Cds.FieldByName('NUMCONTRATOCUSTODIA').AsString + ') '+
                                               '  AND H.SLDQTDHISTEMPACOE > 0 ');

                  fSldJuros := CdsAux.FieldByName('SLDJUROS').AsFloat;
               finally
                  CdsAux.Close;
                  FreeAndNil(CdsAux);
               end;

               sSql := 'SELECT '+
                        QuotedStr(FormatDateTime('dd/mm/yyyy',_Cds.FieldByName('DATAOPERACAO').AsDateTime)) + ' AS DATAEMISSAO, '+
                        QuotedStr(FormatDateTime('dd/mm/yyyy',dDataRef)) + ' AS DATAATUAL, '+
                        QuotedStr('N') + ' AS NATUREZAOPER, '+
                        FuncoesInvest.TrocaVirgulaPonto(FormatFloat('0.##',_Cds.FieldByName('SLDPRINCIPAL').AsFloat))     + ' AS VLRPRINCIPAL, '+
                        FuncoesInvest.TrocaVirgulaPonto(FormatFloat('0.##',_Cds.FieldByName('TAXAOPERACAO').AsFloat))     + ' AS TAXA, '+
                        '1 AS IDPAIS, '+
                        '-1 AS IDCIDADES, '+
                        '-1 AS CODESTADO '+
                        'FROM DUAL';       

               FazRegra(CtrlPInv.IdRegraEmpAcoes, nil, sSql); 

               fValor := FRegraResult-fSldJuros;

              { FazQuery(QryRegra, sSql);

               RegraLocal.RuleName := IntToStr(CtrlPInv.IdRegraEmpAcoes);
               RegraLocal.QueryIn  := QryRegra;
               Try
                  RegraLocal.Execute;
               Except
                  Raise;
               End;

               fValor := StrToFloat(FuncoesInvest.TrocaPontoVirgula(RegraLocal.Result))-fSldJuros;}

               FDBHistEmpAcoes.IdHistEmpAcoes.AsInteger := _Cds.FieldByName('IDHISTEMPACOES').AsInteger;
               FDBHistEmpAcoes.LoadFromDb;

               FDBHistEmpAcoes.Vlrjuros.AsFloat := fValor;
               FDBHistEmpAcoes.Sldjuros.AsFloat := fSldJuros + fValor;

               if not FDBHistEmpAcoes.Update then
                  Raise Exception.Create(FDBHistEmpAcoes.MessageInfo);

               _Cds.Next;
            end;

            if bTransacao then
               Commit;

            Result := True;
         except
            on E:Exception do
            begin
               Result := False;
               if bTransacao then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally
         _Cds.Close;
         if CdsAux = nil then
            FreeAndNil(CdsAux);
      end;
   end;
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.ContabilizaJuros(dDataRef : TDateTime; iInvest, iPlanPrev : Integer): Boolean;
var bTransacao: Boolean;
    CdsAux : TCMClientDataSet;
    sSql : String;
    dDataVig : TDateTime;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ConbailizaJuros(dDataRef, iInvest, iPlanPrev);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         MessageInfo := '';

         CdsAux := TCMClientDataSet.Create(nil);
         CdsAux.Data := ListLancVigEmp(0,dDataRef);
         dDataVig := CdsAux.FieldByName('DATAVIGENTE').AsDateTime;
         CdsAux.Close;

         try // Except
            if not InTransaction then
            begin
               StartTransacao;
               bTransacao := True;
            end
            else bTransacao := False;

            sSql := ''; 
            sSql := sSql +'SELECT H.* ' +#13+
                          'FROM HISTEMPACOES H' +#13+
                          'WHERE H.DATAHISTEMPACOES BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataVig)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' +#13+
                          '                             AND TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' +#13+
                           FuncoesInvest.IIF((iInvest > 0), '  AND H.IDINVESTIMENTO = ' + IntToStr(iInvest), ' ') +#13+
                           FuncoesInvest.IIF((iPlanPrev > 0), '  AND H.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev), ' ') +#13+
                          '  AND H.IDTIPOOPERACAO IN (-54,-10054) ' +#13+
                          '  AND NVL(H.VLRJUROSIMPORTA,0) > 0 '+#13+
                          '  AND H.PLNCODIGO IS NULL ' +#13+
                          'ORDER BY H.DATAHISTEMPACOES, H.IDINVESTIMENTO, H.IDPLANPREVCTBPATR, H.IDHISTEMPACOES ';

            CdsAux.Data := GetDataPacket(sSql);

            while not CdsAux.eof do
            begin
               FPlano := -1;
               FPlanilha := -1;
               if not IntegraContabCapCar(CdsAux.FieldByName('IDINVESTIMENTO').AsInteger,
                                          CdsAux.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          CdsAux.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          CdsAux.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          CdsAux.FieldByName('IDCUSTODIANTE').AsInteger,
                                          -1,
                                          CdsAux.FieldByName('VLRJUROSIMPORTA').AsFloat,
                                          0,
                                          CdsAux.FieldByName('DATAHISTEMPACOES').AsDateTime,
                                          CdsAux.FieldByName('DATAHISTEMPACOES').AsDateTime,
                                          FuncoesInvest.IIF(CdsAux.FieldByName('IDTIPOOPERACAO').AsInteger < 10000, 1, 0),
                                          CdsAux.FieldByName('NUMCONTRATOCUSTODIA').AsString) then
                  Raise Exception.Create('Não foi possível contabilizar o resgate' + #13 +
                                         'Mensagen: ' + CtrlInvContab.MessageInfo + #13 +
                                         '          ' + MessageInfo);

               if FPlanilha > 0 then
               begin
                  FDBHistEmpAcoes.IdHistEmpAcoes.AsInteger := CdsAux.FieldByName('IDHISTEMPACOES').AsInteger;
                  FDBHistEmpAcoes.LoadFromDb;

                  FDBHistEmpAcoes.Plano.AsInteger := FPlano;
                  FDBHistEmpAcoes.PlnCodigo.AsInteger := FPlanilha;

                  if not FDBHistEmpAcoes.Update then
                     Raise Exception.Create(FDBHistEmpAcoes.MessageInfo);
               end;
               CdsAux.Next;
            end;

            if bTransacao then
               Commit;

            Result := True;
         except
            on E:Exception do
            begin
               Result := False; 
               if bTransacao then
                  Rollback;
               MessageInfo := E.Message;
            end;         
         end;
      finally
         CdsAux.Close;
         FreeAndNil(CdsAux);
      end;
   end;
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TCtrlEmpAcoes.BuscaDataVigEmpAcoes(dDataOper: TDateTime) : TDateTime;
Var
   CtrlEmpAcoes: TCtrlEmpAcoes;
   CdsAux : TCMClientDataSet;
Begin
   Result := dDataOper; 
                                                                                
   CdsAux := TCMClientDataSet.Create(nil);
   CdsAux.Data := ListLancVigEmp(0, dDataOper);
   Result := CdsAux.FieldByName('DATAVIGENTE').AsDateTime;
   CdsAux.Close;

   if Result <= 0 then
      Result := dDataOper;
end;


end.
