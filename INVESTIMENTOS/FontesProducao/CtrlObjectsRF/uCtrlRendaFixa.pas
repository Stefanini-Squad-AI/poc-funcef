//******************************************************************************
// Data      : 07/11/2007
// Código    : AL_8
// Pendencia : 25684
// SOL       :
// Desc      : Criação dos métodos
//             GetSequence e InsereItensRFNeg(Cadastra os itens obrigatórios)
//             Ajuste na AplicaAtualItemRenFix para alterar o IDItemRenFix
//******************************************************************************
// Data      : 28/08/2007
// Código    : AL_7
// Desc      : Organização das rotinas
//******************************************************************************
// Data      : 08/02/2007
// Código    : AL_6
// Pendencia : 24453
// Desc      : Implementação do Cadastro de Renda Fixa (3 camadas) que não funcionava
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_5
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação da OperRenfix, HistRenfix
//             OperRenfixCurvas e HistRenfixXitens para a Integração de Bloqueio
//             de Penhora com o Jurídico
//             Implementação da ListCarteiraRixa
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_4
// Pendencia : 23861
// SOL       : 43516
// Desc      : Inclusão do Campo FLGUSAQTD na CLASSETITRENFIX
//             UPDATE CLASSETITRENFIX SET FLGUSAQTD='N' WHERE IDCLASSETIT IN (3,4,14,20)
//******************************************************************************
// Data     : 22/11/2006
// Código   : AL_3
// Pendencia: 23787
// SOL      : 43633
// Desc     : Implementação da ListOperTrcPlanos
//*****************************************************************************
//Data	    : 03/01/2006
//Código    : Al_2
//Motivo(S) : Implementação da uDbClassriscorenfix e suas funções
//*****************************************************************************
//Data	    : 29/12/2005
//Código    : Al_1
//Motivo(S) : Implementação da uDbCurvasrenfix e suas funções
//*****************************************************************************
unit uCtrlRendaFixa;

interface

//AL_1
//AL_2
//AL_5
//AL_7
uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, Messages,
     uDbItemRenfix, uDbClasseRenfix, uDbCurvasrenfix, uCMFileUtils, uDbClassriscorenfix,
     uDbOperRenFix, uDbOperRenFixXCurvas, uDbHistRenFix, uDbHistRenFixXItens,
     uCtrlPadroes, uFuncoesInvest, uCtrlRegra, uCMClientDataSet, uCtrlParamInvest,
     uTiposRegraMT
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
    TParamRecI = Record
                    NewValue: Integer;
                    OldValue: Integer;
                 end;
    TParamRecS = Record
                    NewValue: String;
                    OldValue: String;
                 end;

   {*****************************************************************************
     > TCTRLPERSISTENTOBJECT
     Classe ancestral para persistência de dados em funções de acesso as
     classes de persistência de forma que essas fiquem em escopo privado a
     classe de controle.
   *****************************************************************************}
   TCtrlPersistentObject = Class
   private
     _Cds: TClientDataSet;
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

//AL_5
//***************************************************************************
//  > BUSCA SALDOS
//*****************************************************************************

   TBuscaSaldoRF = Class(TCtrlPersistentObject)
   private
      FIdHistRenFix : Integer;
      FIdOperRenFix : Integer;
      FCdsSldOperRenFix        : TClientDataSet;
      FCdsSldOperRenFixXCurvas : TClientDataSet;
      FCdsSldHistRenFix        : TClientDataSet;
      FCdsSldHistRenFixXItens  : TClientDataSet;
      FCdsSldOperRenFixPoup        : TClientDataSet;
      FCdsSldOperRenFixXCurvasPoup : TClientDataSet;
      FCdsSldHistRenFixPoup        : TClientDataSet;
      FCdsSldHistRenFixXItensPoup  : TClientDataSet;

      procedure SetCdsSldOperRenFix(const Value: TClientDataSet);
      procedure SetCdsSldOperRenFixXCurvas(const Value: TClientDataSet);
      procedure SetCdsSldHistRenFix(const Value: TClientDataSet);
      procedure SetCdsSldHistRenFixXItens(const Value: TClientDataSet);
      procedure SetIdHistRenFix(const Value: Integer);
      procedure SetIdOperRenFix(const Value: Integer);
      procedure SetCdsSldHistRenFixPoup(const Value: TClientDataSet);
      procedure SetCdsSldHistRenFixXItensPoup(const Value: TClientDataSet);
      procedure SetCdsSldOperRenFixPoup(const Value: TClientDataSet);
      procedure SetCdsSldOperRenFixXCurvasPoup(const Value: TClientDataSet);

   public
      property IdHistRenFix : Integer read FIdHistRenFix write SetIdHistRenFix;
      property IdOperRenFix : Integer read FIdOperRenFix write SetIdOperRenFix;
      property CdsSldOperRenFix        : TClientDataSet read FCdsSldOperRenFix write SetCdsSldOperRenFix;
      property CdsSldOperRenFixXCurvas : TClientDataSet read FCdsSldOperRenFixXCurvas write SetCdsSldOperRenFixXCurvas;
      property CdsSldHistRenFix        : TClientDataSet read FCdsSldHistRenFix write SetCdsSldHistRenFix;
      property CdsSldHistRenFixXItens  : TClientDataSet read FCdsSldHistRenFixXItens write SetCdsSldHistRenFixXItens;
      property CdsSldOperRenFixPoup        : TClientDataSet read FCdsSldOperRenFixPoup write SetCdsSldOperRenFixPoup;
      property CdsSldOperRenFixXCurvasPoup : TClientDataSet read FCdsSldOperRenFixXCurvasPoup write SetCdsSldOperRenFixXCurvasPoup;
      property CdsSldHistRenFixPoup        : TClientDataSet read FCdsSldHistRenFixPoup write SetCdsSldHistRenFixPoup;
      property CdsSldHistRenFixXItensPoup  : TClientDataSet read FCdsSldHistRenFixXItensPoup write SetCdsSldHistRenFixXItensPoup;

      Constructor Create(Aowner: TCmControlObject); Override;
      Destructor Destroy; Override;

      function Executa(dDataSaldo: TDateTime;
                       iInvestimento: Integer = -1;
                       iOperacao: Integer = -1;
                       iClasseTit: Integer = -1;
                       iTipoProc: Integer = 1;
                       bOper: Boolean = False): Boolean;

      function ExecutaPoup(dDataSaldo: TDateTime;
                           iInvestimento: Integer = -1;
                           iOperacao: Integer = -1;
                           iClasseTit: Integer = -1;
                           iClassePoupBloq : Integer = -1;
                           iTipoProc: Integer = 1;
                           iOper: Boolean = False): Boolean;

      function ListSldHistRenFix(dDataSaldo: TDateTime;
                                 iInvestimento: Integer = -1;
                                 iOperacao: Integer = -1;
                                 iClasseTit: Integer = -1;
                                 iTipoProc: Integer = 1;
                                 bOper: Boolean = False) : OleVariant;

      function ListSldHistRenFixXItens(iIdHistRenFix: Integer) : OleVariant;

      function ListSldOperRenFix(iIdOperRenFix: Integer) : OleVariant;

      function ListSldOperRenFixXCurvas(iIdOperRenFix: Integer) : OleVariant;

      function ListSldHistRenFixPoup(dDataSaldo: TDateTime;
                                     iInvestimento: Integer = -1;
                                     iOperacao: Integer = -1;
                                     iClasseTit: Integer = -1;
                                     iClassePoupBloq : Integer = -1;
                                     iTipoProc: Integer = 1;
                                     iOper: Boolean = False) : OleVariant;

      function ListSldHistRenFixXItensPoup(iIdHistRenFix: Integer) : OleVariant;

      function ListSldOperRenFixPoup(iIdOperRenFix: Integer) : OleVariant;

      function ListSldOperRenFixXCurvasPoup(iIdOperRenFix: Integer) : OleVariant;

   protected

   end;

//***************************************************************************
//  > Renda Fixa
//*****************************************************************************
   TCtrlRendaFixa = Class(TCmControlObject)
   private
      FDbItemRenFix      : TDbItemRenFix;
      FCdsItemRenFix     : TClientDataSet;
      FDbClasseRenFix    : TDbClasseRenFix;
      FCdsClasseRenFix   : TClientDataSet;
      //AL_1
      FCdsCurvaRenFix    : TClientDataSet;
      FDbCurvaRenFix     : TDbCurvasRenFix;
      //AL_2
      FDbClassRiscoRenFix   : TDbClassRiscoRenFix;
      FCdsClassRiscoRenFix  : TClientDataSet;

      CdsAux                : TClientDataSet;

      //AL_5
      FDbOperRenFix         : TDbOperRenFix;
      FCdsOperRenFix        : TClientDataSet;
      FDbOperRenFixXCurvas  : TDbOperRenFixXCurvas;
      FCdsOperRenFixXCurvas : TClientDataSet;
      FDbHistRenFix         : TDbHistRenFix;
      FCdsHistRenFix        : TClientDataSet;
      FDbHistRenFixXItens   : TDbHistRenFixXItens;
      FCdsHistRenFixXItens  : TClientDataSet;
      FBuscaSaldoRF         : TBuscaSaldoRF;
      FBuscaSaldoRFPoup     : TBuscaSaldoRF;
      //AL_6
      FIdItemRenFix         : Integer;

      FRegraResult          : Double;

      procedure SetDbClasseRenFix(const Value: TDbClasseRenFix);
      procedure SetDbItemRenFix(const Value: TDbItemRenFix);
      procedure SetCdsClasseRenFix(const Value: TClientDataSet);
      procedure SetCdsItemRenFix(const Value: TClientDataSet);
      //AL_1
      procedure SetCdsCurvaRenFix(const Value: TClientDataSet);
      procedure SetDbCurvaRenFix(const Value: TDbCurvasRenFix);
      //AL_2
      procedure SetCdsClassRiscoRenFix(const Value: TClientDataSet);
      procedure SetDbClassRiscoRenFix(const Value: TDbClassRiscoRenFix);
      //AL_5
      procedure SetCdsOperRenFix(const Value: TClientDataSet);
      procedure SetDbOperRenFix(const Value: TDbOperRenFix);
      procedure SetCdsOperRenFixXCurvas(const Value: TClientDataSet);
      procedure SetDbOperRenFixXCurvas(const Value: TDbOperRenFixXCurvas);
      procedure SetCdsHistRenFix(const Value: TClientDataSet);
      procedure SetDbHistRenFix(const Value: TDbHistRenFix);
      procedure SetCdsHistRenFixXItens(const Value: TClientDataSet);
      procedure SetDbHistRenFixXItens(const Value: TDbHistRenFixXItens);
      procedure SetBuscaSaldoRF(const Value: TBuscaSaldoRF);
      procedure SetBuscaSaldoRFPoup(const Value: TBuscaSaldoRF);

      //AL_6
      procedure SetIdItemRenFix(const Value: Integer);

      procedure SetRegraResult(const Value: Double);

   //AL_7 - Ini
   public
      //----------------  Métodos Próprios  ------------------------------------
      constructor Create; override;
      destructor Destroy; override;

      //----------------  Objeto BUSCASALDOS  ----------------------------------
      property BuscaSaldoRF: TBuscaSaldoRF read FBuscaSaldoRF write SetBuscaSaldoRF;
      property BuscaSaldoRFPoup: TBuscaSaldoRF read FBuscaSaldoRFPoup write SetBuscaSaldoRFPoup;


      //----------------  Objetos para cadastros  ------------------------------
      property CdsItemRenFix   : TClientDataSet  read FCdsItemRenFix   write SetCdsItemRenFix;
      property DbItemRenFix    : TDbItemRenFix   read FDbItemRenFix    write SetDbItemRenFix;

      property CdsClasseRenFix : TClientDataSet  read FCdsClasseRenFix write SetCdsClasseRenFix;
      property DbClasseRenFix  : TDbClasseRenFix read FDbClasseRenFix  write SetDbClasseRenFix;

      //AL_1
      property CdsCurvaRenFix : TClientDataSet read FCdsCurvaRenFix write SetCdsCurvaRenFix;
      property DbCurvaRenFix  : TDbCurvasRenFix read FDbCurvaRenFix write SetDbCurvaRenFix;

      //AL_2
      property CdsClassRiscoRenFix : TClientDataSet read FCdsClassRiscoRenFix write SetCdsClassRiscoRenFix;
      property DbClassRiscoRenFix  : TDbClassRiscoRenFix read FDbClassRiscoRenFix write SetDbClassRiscoRenFix;

      //AL_5
      property CdsOperRenFix : TClientDataSet read FCdsOperRenFix write SetCdsOperRenFix;
      property DbOperRenFix  : TDbOperRenFix read FDbOperRenFix write SetDbOperRenFix;

      property CdsOperRenFixXCurvas : TClientDataSet read FCdsOperRenFixXCurvas write SetCdsOperRenFixXCurvas;
      property DbOperRenFixXCurvas  : TDbOperRenFixXCurvas read FDbOperRenFixXCurvas write SetDbOperRenFixXCurvas;

      property CdsHistRenFix : TClientDataSet read FCdsHistRenFix write SetCdsHistRenFix;
      property DbHistRenFix  : TDbHistRenFix read FDbHistRenFix write SetDbHistRenFix;

      property CdsHistRenFixXItens : TClientDataSet read FCdsHistRenFixXItens write SetCdsHistRenFixXItens;
      property DbHistRenFixXItens  : TDbHistRenFixXItens read FDbHistRenFixXItens write SetDbHistRenFixXItens;


      //----------------  Objetos Diversos     ---------------------------------
      //AL_6
      property IdItemRenFix: Integer read FIdItemRenFix write SetIdItemRenFix;

      property RegraResult: Double read FRegraResult write SetRegraResult;


      //----------------  Métodos de Listagem  ---------------------------------
      function ListItemRenFix(iIdItemRenFix : Integer = -1): OleVariant;
      function ListUsuarioRenFix(iIdUsuario : Integer = -1): OleVariant;
      function ListClasseRenFix(iIdClasse : Integer = -1): OleVariant;
      function ListCarteiraRenFix(iIdCarteiraInvest : Integer = -1): OleVariant;
      function ListInvestimentoRenFix(iIdInvestimento : Integer = -1): OleVariant;
      function ListAux(sSql: String): OleVariant;
      function ListCurvaRenFix(iIdCurva : Integer = -1): OleVariant;
      function ListClassRiscoRenFix(iIdClassRisco: Integer = -1): OleVariant;
      //AL_3
      function ListOperTrcPlanos(dDataIni : TDateTime = 0;
                                 dDataFim : TDateTime = 0;
                                 iInvestimento : Integer = -1;
                                 iClasseTit : Integer = -1;
                                 iPlanPrevOrig  : Integer = -1) : OleVariant;
      function ListOperRenFix(iOperRenFix : Integer = -1;
                              dDataIni : TDateTime = 0;
                              dDataFim : TDateTime = 0;
                              iOperAplic : Integer = -1;
                              iInvestimento : Integer = -1;
                              iTipoOperacao : Integer = -1;
                              iOperOrig : Integer = -1;
                              iPlanPrev : Integer = -1;
                              iCustodiante : Integer = -1;
                              iCarteiraInvest : Integer = -1): OleVariant;
      function ListOperRenFixXCurvas(iOperRenFix : Integer = -1;
                                     iCurvaRenFix : Integer = -1;
                                     iItemRenFix : Integer = -1): OleVariant;
      function ListHistRenFix(iHistRenFix : Integer = -1;
                              dDataIni : TDateTime = 0;
                              dDataFim : TDateTime = 0;
                              iOperAplic : Integer = -1;
                              iInvestimento : Integer = -1;
                              iTipoOperacao : Integer = -1;
                              iOperOrig : Integer = -1;
                              iPlanPrev : Integer = -1;
                              iCarteiraInvest : Integer = -1): OleVariant;
      function ListHistRenFixXItens(iHistRenFix : Integer = -1;
                                    iCurvaRenFix : Integer = -1;
                                    iItemRenFix : Integer = -1): OleVariant;
      function ListItemXOpeXInv(iInvestimento : Integer): OleVariant;
      function ListCarteiraRixa : OleVariant;
      function ListClasseRiscoRenFix : Olevariant;

      //----------------  Métodos de Update em Banco  --------------------------
      //AL_6
      function AplicaAtualItemRenFix(Codigo: TParamRecS; sDescricao:String; sAcao:String; IDItem: TParamRecI):Boolean;
      function AplicaAtualClasseRenFix: Boolean;
      //AL_1
      function AplicaAtualCurvaRenFix: Boolean;
      //AL_2
      function AplicaAtualClassRiscoRenFix: Boolean;
      //AL_5
      function AplicaAtualOperRenFix: Boolean;
      function AplicaAtualOperRenFixXCurvas: Boolean;
      function AplicaAtualHistRenFix: Boolean;
      function AplicaAtualHistRenFixXItens: Boolean;


      //----------------  Métodos Diversos  ------------------------------------
      function VerEmRendaFixaAbertura: Boolean;
      //AL_8 - Ini
      function GetSequence(Sufixo: String): Cardinal; Override;
      function InsereItensRFNeg: Boolean;
      //AL_8 - Fim

      function FazRegra(iRegra: Integer; cds: TCMClientDataSet = nil; sSql: String = ''): Boolean;

   protected
      //----------------  Métodos Protegidos Próprios  -------------------------
      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;
      procedure AfterInitialize;  Override;
   end;
   //AL_7 - Fim

var CtrlRendaFixa: TCtrlRendaFixa;

implementation

{TCtrlRendaFixa}

constructor TCtrlRendaFixa.Create;
begin
   inherited;
   FDbItemRenFix        := TDbItemRenFix.Create(Self);
   FDbClasseRenFix      := TDbClasseRenFix.Create(Self);
   //AL_1
   FDbCurvaRenFix       := TDbCurvasRenFix.Create(Self);
   //AL_2
   FDbClassRiscoRenFix  := TDbClassRiscoRenFix.Create(Self);

   //AL_5
   FBuscaSaldoRF         := TBuscaSaldoRF.Create(Self);
   FBuscaSaldoRFPoup     := TBuscaSaldoRF.Create(Self);
   FDbOperRenFix         := TDbOperRenFix.Create(Self);
   FDbOperRenFixXCurvas  := TDbOperRenFixXCurvas.Create(Self);
   FDbHistRenFix         := TDbHistRenFix.Create(Self);
   FDbHistRenFixXItens   := TDbHistRenFixXItens.Create(Self);
end;

destructor TCtrlRendaFixa.Destroy;
begin
   FreeAndNil(FDbItemRenFix);
   if IsAppServer then
      FreeAndNil(FCdsItemRenFix);
   FreeAndNil(FDbClasseRenFix);
   if IsAppServer then
      FreeAndNil(FCdsClasseRenFix);
   //AL_1
   FreeAndNil(FDbCurvaRenFix);
   if IsAppServer then
      FreeAndNil(FCdsCurvaRenFix);
   //AL_2
   FreeAndNil(FDbClassRiscoRenFix);
   if IsAppServer then
      FreeAndNil(FCdsClassRiscoRenFix);

   CdsAux.Free;

   //AL_5
   FreeAndNil(FBuscaSaldoRF);
   FreeAndNil(FBuscaSaldoRFPoup);
   FreeAndNil(FDbOperRenFix);
   FreeAndNil(FDbOperRenFixXCurvas);
   FreeAndNil(FDbHistRenFix);
   FreeAndNil(FDbHistRenFixXItens);
   inherited;
end;

procedure TCtrlRendaFixa.OnCreateAppServer;
begin
   inherited;
   FCdsItemRenFix   := TClientDataSet.Create(nil);
   FCdsClasseRenFix := TClientDataSet.Create(nil);
   //AL_1
   FCdsCurvaRenFix  := TClientDataSet.Create(nil);
   //AL_2
   FCdsClassRiscoRenFix := TClientDataSet.Create(nil);
end;

procedure TCtrlRendaFixa.DoChangeDataBase;
begin
   inherited;
   FDbItemRenFIx.DataBaseName   := DataBaseName;
   FDbClasseRenFIx.DataBaseName := DataBaseName;
   //AL_1
   FDbCurvaRenFIx.DataBaseName  := DataBaseName;
   //AL_2
   FDbClassRiscoRenFIx.DataBaseName := DataBaseName;

   //AL_5
   BuscaSaldoRF.DataBaseName := DataBaseName;
   BuscaSaldoRFPoup.DataBaseName := DataBaseName;
   FDbOperRenFix.DataBaseName := DataBaseName;
   FDbHistRenFix.DataBaseName := DataBaseName;
   FDbOperRenFixXCurvas.DataBaseName := DataBaseName;
   FDbHistRenFixXItens.DataBaseName := DataBaseName;
end;

function TCtrlRendaFixa.ListAux(sSql : String): OleVariant;
begin
   Result:=GetDataPacket(sSql);
end;

//AL_5
function TCtrlRendaFixa.ListItemRenFix(iIdItemRenFix : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDITEMRENFIX, DESCITEMRENFIX, CODITEMRENFIX, TIPOITEM, FLGREGRA ';
   sSql := sSql + 'FROM ITEMRENFIX  ';
   if iIdItemRenFix <> -1 then
      sSql := sSql + 'WHERE IDITEMRENFIX = ' + IntToStr(iIdItemRenFix);
   sSql := sSql + 'ORDER BY DESCITEMRENFIX ';

   Result:=GetDataPacket(sSql);
end;


function TCtrlRendaFixa.ListUsuarioRenFix(iIdUsuario : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT P.NOME, U.IDUSUARIO ';
   sSql := sSql + 'FROM USUARIOSISTEMA U, PESSOA P ';
   sSql := sSql + 'WHERE U.IDUSUARIO = P.IDPESSOA ';
   if iIdUsuario <> -1 then
      sSql := sSql + 'AND IDPESSOA = ' + IntToStr(iIdUsuario);
   sSql := sSql + 'ORDER BY P.NOME ';

   Result:=GetDataPacket(sSql);
end;


function TCtrlRendaFixa.ListClasseRenFix(iIdClasse : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   //AL_4
   sSql := sSql + 'SELECT IDCLASSETIT, DESCCLASSETIT, CODTIPTITULO, FLGATIVA, FLGUSAQTD, IDCLASSERISCO ';
   sSql := sSql + 'FROM CLASSETITRENFIX ';
   if iIdClasse <> -1 then
   sSql := sSql + 'WHERE IDCLASSETIT = ' + IntToStr(iIdClasse);
   sSql := sSql + 'ORDER BY DESCCLASSETIT ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlRendaFixa.AplicaAtualClasseRenFix: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualClasseRenFix(FCdsClasseRenFix.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result := ApplyCds(FCdsClasseRenFix,DbClasseRenFix,[],[]);
          if not Result then
           begin
              MessageInfo := DbClasseRenFix.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlRendaFixa.ListCarteiraRenFix(iIdCarteiraInvest: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                            ';
   sSql := sSql + '   IDTIPOINVEST, IDPLANOPREV, IDPATROCINADORA, IDMERCADO,         ';
   sSql := sSql + '   IDGESTORCARTEIRA, IDDAIEACART, IDCARTEIRAINVEST, FLGTRATALOTE, ';
   sSql := sSql + '   FLGORDMOVINV, FLGCARTTERC, FLGCARTPROP, FLGCARTLASTRO,         ';
   sSql := sSql + '   FLGCALCDIARIO, DESCCARTINVEST, DATAULTFECH, DATAINICIO         ';
   sSql := sSql + 'FROM CARTEIRAINVEST                                               ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 1                                            ';
   if iIdCarteiraInvest <> -1 then
      sSql := sSql + 'AND IDCARTEIRAINVEST = ' + IntToStr(iIdCarteiraInvest);
   sSql := sSql + 'ORDER BY DESCCARTINVEST ';
   Result := GetDataPacket(sSql);
end;

function TCtrlRendaFixa.ListInvestimentoRenFix(iIdInvestimento: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                          ';
   sSql := sSql + '   IDINVESTIMENTO, DESCINVESTIMENTO, STAOPCAO, OBSINVESTIMENTO, ';
   sSql := sSql + '   IDTIPOINVEST, IDMOEDACONTAB, IDINVESTPRP, IDEMISSOR,         ';
   sSql := sSql + '   IDCLASSETIT, IDCARTEIRASPC, FLGRFXANTIGO, FLGREPACTUA,       ';
   sSql := sSql + '   FLGINVESTPRP, FLGATIVO, DESCCLASSINVEST, CODISIN, CARENCIA   ';
   sSql := sSql + 'FROM INVESTIMENTO                                               ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 1                                          ';
   if iIdInvestimento <> -1 then
      sSql := sSql + 'AND IDINVESTIMENTO = ' + IntToStr(iIdInvestimento);
   sSql := sSql + 'ORDER BY DESCINVESTIMENTO ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlRendaFixa.SetDbClasseRenFix(const Value: TDbClasseRenFix);
begin
  FDbClasseRenFix := Value;
end;

procedure TCtrlRendaFixa.SetDbItemRenFix(const Value: TDbItemRenFix);
begin
  FDbItemRenFix := Value;
end;

function TCtrlRendaFixa.VerEmRendaFixaAbertura: Boolean;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                    ';
   sSql := sSql + '   SELECT PA.FLGRFEMABERTURA, PE.NOME     ';
   sSql := sSql + 'FROM PARAMINVEST PA, PESSOA PE            ';
   sSql := sSql + 'WHERE PA.IDUSUARIOPROCRF = PE.IDPESSOA(+) ';
   CdsAux.Data := GetDataPacket(sSql);
end;

//AL_8
function TCtrlRendaFixa.GetSequence(Sufixo: String): Cardinal;
begin
   Result := Inherited GetSequence(Sufixo);
end;

//AL_8
function TCtrlRendaFixa.InsereItensRFNeg: Boolean;
var i,j: byte;
    sSql: String;
    bInsere: Boolean;
Const
    aCampos: Array[0..4] of String = ('IDITEMRENFIX', 'DESCITEMRENFIX', 'CODITEMRENFIX', 'FLGREGRA', 'TIPOITEM');
    aItens:  Array[1..24, 0..4] of String =
                   (('-1' ,'Principal'                  ,'VLRPRINCIPAL','N','V'),
                    ('-2' ,'Quantidade'                 ,'QUANTIDADE'  ,'N','V'),
                    ('-3' ,'PU de Emissão'              ,'PUEMISSAO'   ,'N','P'),
                    ('-4' ,'PU da Operação'             ,'PUOPERACAO'  ,'N','P'),
                    ('-5' ,'Valor Líquido'              ,'VLRLIQUIDO'  ,'Y','V'),
                    ('-6' ,'Valor Bruto'                ,'VLRBRUTO'    ,'Y','V'),
                    ('-7' ,'Imposto de Renda'           ,'VLRIR'       ,'Y','I'),
                    ('-8' ,'IOF'                        ,'VLRIOF'      ,'Y','I'),
                    ('-9' ,'Lucro'                      ,'LUCPREJ'     ,'Y','L'),
                    ('-10','Prejuizo'                   ,'LUCPREJ'     ,'Y','L'),
                    ('-11','PU Atualizado'              ,'PUATUALIZADO','Y','P'),
                    ('-12','TAXA DA BOLSA'              ,'VLRTXBOLSA'  ,'N','V'),
                    ('-13','TAXA DE EMOLUMENTOS'        ,'VLRTXEMOL'   ,'N','V'),
                    ('-14','Valor Bruto Provisionado'   ,'VLRBRUPROPER','Y','V'),
                    ('-15','Provisão para Perda'        ,'VLRPROPERDA' ,'Y','V'),
                    ('-16','Correção Negativa'          ,'PUCORNEG'    ,'Y','M'),
                    ('-17','Rendimento'                 ,'RENDIMENTO'  ,'Y','M'),
                    ('-18','IR Provisionado RET'        ,'IRPROVRET'   ,'Y','I'),
                    ('-19','Agio'                       ,'VLRAGIO'     ,'Y','V'),
                    ('-20','Deságio'                    ,'VLRDESAGIO'  ,'Y','V'),
                    ('-21','PU Mercado na Compra'       ,'PUMERCCP'    ,'Y','P'),
                    ('-22','Valor Bloqueado por Penhora','VLRBLOQPEN'  ,'N','V'),
                    ('-23','Quantidade Bloq por Penhora','QTDBLOQPEN'  ,'N','V'),
                    ('-24','Valor de Mercado'           ,'VALORMKT'    ,'Y','N'));


    aCPCmPbd: Array[0..4] of String = ('IDCAMPO', 'NOMEDOCAMPO', 'DESCRICAODOCAMPO', 'CAMPODOBANCO', 'IDTIPODADO');
    aCmPbd:   Array[1..24, 0..4] of String =
                   (('INV_VLRPRINC' ,'VLRPRINCIPAL','Principal'                  ,'2','1'),
                    ('INV_QUANTIDA' ,'QUANTIDADE'  ,'Quantidade'                 ,'2','1'),
                    ('INV_PUEMI'    ,'PUEMISSAO'   ,'PU de Emissão'              ,'2','1'),
                    ('INV_PUOPER'   ,'PUOPERACAO'  ,'PU da Operação'             ,'2','1'),
                    ('INV_VLRLIQUI' ,'VLRLIQUIDO'  ,'Valor Líquido'              ,'2','1'),
                    ('INV_VLRBRUTO' ,'VLRBRUTO'    ,'Valor Bruto'                ,'2','1'),
                    ('INV_VLRIR'    ,'VLRIR'       ,'Imposto de Renda'           ,'2','1'),
                    ('INV_VLRIOF'   ,'VLRIOF'      ,'IOF'                        ,'2','1'),
                    ('INV_LUCPREJ'  ,'LUCPREJ'     ,'Lucro / Prejuízo'           ,'2','1'),
                    ('INV_LUCPREJ'  ,'LUCPREJ'     ,'Lucro / Prejuízo'           ,'2','1'),
                    ('INV_PUATUALI' ,'PUATUALIZADO','PU ATUALIZADO'              ,'2','1'),
                    ('INV_VLRTXBOL' ,'VLRTXBOLSA'  ,'TAXA DA BOLSA'              ,'2','1'),
                    ('INV_VLRTXEMO' ,'VLRTXEMOL'   ,'TAXA DE EMOLUMENTOS'        ,'2','1'),
                    ('INV_VLRBPRPE' ,'VLRBRUPROPER','Valor Bruto Provisionado'   ,'2','1'),
                    ('INV_VLRPROPE' ,'VLRPROPERDA' ,'Provisão para Perda'        ,'2','1'),
                    ('INV_PUCORNEG' ,'PUCORNEG'    ,'Correção Negativa'          ,'2','1'),
                    ('INV_RENDIMEN' ,'RENDIMENTO'  ,'Rendimento'                 ,'2','1'),
                    ('INV_IRPROVRE' ,'IRPROVRET'   ,'IR Provisionado RET'        ,'2','1'),
                    ('INV_VLRAGIO'  ,'VLRAGIO'     ,'Agio'                       ,'2','1'),
                    ('INV_VLRDESAG' ,'VLRDESAGIO'  ,'Deságio'                    ,'2','1'),
                    ('INV_PUMERCCP' ,'PUMERCCP'    ,'PU Mercado na Compra'       ,'2','1'),
                    ('INV_VLRBLOQP' ,'VLRBLOQPEN'  ,'Valor Bloqueado por Penhora','2','1'),
                    ('INV_QTDBLOQP' ,'QTDBLOQPEN'  ,'Quantidade Bloq por Penhora','2','1'),
                    ('INV_VALORMKT' ,'VALORMKT'    ,'Valor de Mercado'           ,'2','1'));

    aCPCmPbdGrp: Array[0..1] of String = ('CODGRUPOARQUIVO', 'IDCAMPO');
    aCmPbdGrp:   Array[1..24, 0..1] of String =
                   (('INVEST','INV_VLRPRINC'),
                    ('INVEST','INV_QUANTIDA'),
                    ('INVEST','INV_PUEMI'   ),
                    ('INVEST','INV_PUOPER'  ),
                    ('INVEST','INV_VLRLIQUI'),
                    ('INVEST','INV_VLRBRUTO'),
                    ('INVEST','INV_VLRIR'   ),
                    ('INVEST','INV_VLRIOF'  ),
                    ('INVEST','INV_LUCPREJ' ),
                    ('INVEST','INV_LUCPREJ' ),
                    ('INVEST','INV_PUATUALI'),
                    ('INVEST','INV_VLRTXBOL'),
                    ('INVEST','INV_VLRTXEMO'),
                    ('INVEST','INV_VLRBPRPE'),
                    ('INVEST','INV_VLRPROPE'),
                    ('INVEST','INV_PUCORNEG'),
                    ('INVEST','INV_RENDIMEN'),
                    ('INVEST','INV_IRPROVRE'),
                    ('INVEST','INV_VLRAGIO' ),
                    ('INVEST','INV_VLRDESAG'),
                    ('INVEST','INV_PUMERCCP'),
                    ('INVEST','INV_VLRBLOQP'),
                    ('INVEST','INV_QTDBLOQP'),
                    ('INVEST','INV_VALORMKT'));
begin

   for i := 1 to Length(aItens) do
   begin
      sSql := 'INSERT INTO ITEMRENFIX (';

      for j := 0 to Length(aCampos)-1 do
      begin
         sSql := sSql + aCampos[j];
         if j < Length(aCampos)-1 then
            sSql := sSql + ', ';
      end;
      sSql := sSql + ') ' + #13 + 'VALUES (';

      for j := 0 to Length(aItens[i])-1 do
      begin
         sSql := sSql + QuotedStr(aItens[i,j]);
         if j < Length(aItens[i])-1 then
            sSql := sSql + ', ';
      end;
      sSql := sSql + ') ';

      StartTransaction;

      try
         bInsere := ExecSQL(sSql);
      except
         // Abafa o erro quando já existir o registro
      end;

      if bInsere then
      begin
         // Se inseriu o item, cadastra no regra
         //aCmPbd
         sSql := 'INSERT INTO CMPBD (ENTIDADE, CHAVE' ;
         for j := 0 to Length(aCPCmPbd)-1 do
            sSql := sSql + ', ' + aCPCmPbd[j];

         sSql := sSql + ') ' + #13 + 'VALUES (' + QuotedStr('DUAL') + ', 0' ;
         for j := 0 to Length(aCmPbd[i])-1 do
            sSql := sSql + ', ' + QuotedStr(aCmPbd[i,j]);

         sSql := sSql + ') ';

         try
            ExecSQL(sSql);
         except
            // Abafa o erro quando já existir o registro
         end;

         //aCmPbdGrp
         sSql := 'INSERT INTO CMPBDGRP (' ;
         for j := 0 to Length(aCPCmPbdGrp)-1 do
         begin
            sSql := sSql + aCPCmPbdGrp[j];
            if j < Length(aCPCmPbdGrp)-1 then
               sSql := sSql + ', ';
         end;

         sSql := sSql + ') ' + #13 + 'VALUES (';
         for j := 0 to Length(aCmPbdGrp[i])-1 do
         begin
            sSql := sSql + QuotedStr(aCmPbdGrp[i,j]);
            if j < Length(aCPCmPbdGrp)-1 then
               sSql := sSql + ', ';
         end;

         sSql := sSql + ') ';

         try
            ExecSQL(sSql);
         except
            // Abafa o erro quando já existir o registro
         end;

      end;

      Commit;

   end;

end;

//AL_1
procedure TCtrlRendaFixa.SetCdsClasseRenFix(const Value: TClientDataSet);
begin
  FCdsClasseRenFix := Value;
end;
//AL_1
procedure TCtrlRendaFixa.SetCdsItemRenFix(const Value: TClientDataSet);
begin
  FCdsItemRenFix := Value;
end;
//AL_1
procedure TCtrlRendaFixa.SetCdsCurvaRenFix(const Value: TClientDataSet);
begin
  FCdsCurvaRenFix := Value;
end;
//AL_1
procedure TCtrlRendaFixa.SetDbCurvaRenFix(const Value: TDbCurvasRenFix);
begin
  FDbCurvaRenFix := Value;
end;
//AL_1
function TCtrlRendaFixa.AplicaAtualCurvaRenFix: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualCurvaRenFix(FCdsCurvaRenFix.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result := ApplyCds(FCdsCurvaRenFix,DbCurvaRenFix,[],[]);
          if not Result then
           begin
              MessageInfo := DbCurvaRenFix.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;
//AL_1
function TCtrlRendaFixa.ListCurvaRenFix(iIdCurva : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                            ';
   sSql := sSql + '   IDCURVARENFIX, DESCCURVARENFIX ';
   sSql := sSql + 'FROM CURVASRENFIX                 ';
   if iIdCurva <> -1 then
      sSql := sSql + 'WHERE IDCURVARENFIX = ' + IntToStr(iIdCurva);
   sSql := sSql + 'ORDER BY DESCCURVARENFIX ';
   Result := GetDataPacket(sSql);
end;

//AL_2
procedure TCtrlRendaFixa.SetCdsClassRiscoRenFix(const Value: TClientDataSet);
begin
  FCdsClassRiscoRenFix := Value;
end;

//AL_2
procedure TCtrlRendaFixa.SetDbClassRiscoRenFix(const Value: TDbClassRiscoRenFix);
begin
  FDbClassRiscoRenFix := Value;
end;

//AL_2
function TCtrlRendaFixa.AplicaAtualClassRiscoRenFix: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualClassRiscoRenFix(FCdsClassRiscoRenFix.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result := ApplyCds(FCdsClassRiscoRenFix,DbClassRiscoRenFix,[],[]);
          if not Result then
           begin
              MessageInfo := DbClassRiscoRenFix.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

//AL_2
function TCtrlRendaFixa.ListClassRiscoRenFix(iIdClassRisco : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                            ';
   sSql := sSql + '   IDCLASSRISCORENFIX, NOMECLASSRISCO, NIVELCLASSRISCO, CORCLASSRISCO ';
   sSql := sSql + 'FROM CLASSRISCORENFIX                 ';
   if iIdClassRisco <> -1 then
      sSql := sSql + 'WHERE IDCLASSRISCORENFIX = ' + IntToStr(iIdClassRisco);
   sSql := sSql + 'ORDER BY NOMECLASSRISCO ';
   Result := GetDataPacket(sSql);
end;

//AL_3
function TCtrlRendaFixa.ListOperTrcPlanos(dDataIni : TDateTime = 0;
                                          dDataFim : TDateTime = 0;
                                          iInvestimento : Integer = -1;
                                          iClasseTit : Integer = -1;
                                          iPlanPrevOrig  : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := 'SELECT OP.BOLETA, PPO.PLANOPATROORIG, PPD.PLANOPATRODEST, CL.DESCCLASSETIT, IV.DESCINVESTIMENTO, ' + #13 +
           '       OP.DATAOPERACAO, OP.VENCOPERACAO, OP.QTDEOPERACAO, OP.VLROPERACAO, ' + #13 +
           '       PPO.IDPLANPREVCTBPATR, PPD.IDPLANPREVCTBPATR, IV.IDCLASSETIT, OP.IDINVESTIMENTO, OP.PERCTRANSF ' + #13 +
           'FROM OPERRENFIX OP, OPERRENFIX OD, INVESTIMENTO IV, CLASSETITRENFIX CL, ' + #13 +
           '     (SELECT (PL.NOME ||'' - ''|| PE.NOME) AS PLANOPATROORIG, PA.IDPLANPREVCTBPATR ' + #13 +
           '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL ' + #13 +
           '      WHERE (PA.IDPATRO = PE.IDPESSOA(+)) ' + #13 +
           '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO, ' + #13 +
           '     (SELECT (PL.NOME ||'' - ''|| PE.NOME) AS PLANOPATRODEST, PA.IDPLANPREVCTBPATR ' + #13 +
           '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL ' + #13 +
           '      WHERE (PA.IDPATRO = PE.IDPESSOA(+)) ' + #13 +
           '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPD ' + #13 +
           'WHERE OP.DATAOPERACAO BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDataIni)) +',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(DateToStr(dDataFim)) +',''DD/MM/YYYY'') '+ #13;

   if iInvestimento > 0 then
      sSQL := sSQL + '  AND (OP.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iClasseTit > 0 then
      sSQL := sSQL + '  AND (CL.IDCLASSETIT = ' + IntToStr(iClasseTit) + ') ' + #13;
   if iPlanPrevOrig > 0 then
      sSQL := sSQL + '  AND (PPO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevOrig) + ') ' + #13;

      sSQL := sSQL +'  AND OP.IDTIPOOPERACAO = -97 ' + #13 +
           '  AND OP.BOLETA = OD.BOLETA ' + #13 +
           '  AND OD.IDTIPOOPERACAO <> -97 ' + #13 +
           '  AND OD.IDOPERRENFIXORIG = OP.IDOPERRENFIXAPLIC ' + #13 +
           '  AND OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATR ' + #13 +
           '  AND OD.IDPLANPREVCTBPATR = PPD.IDPLANPREVCTBPATR ' + #13 +
           '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO ' + #13 +
           '  AND IV.IDCLASSETIT = CL.IDCLASSETIT ' + #13 +
           'ORDER BY OP.DATAOPERACAO, OP.BOLETA ';

//   CMDebugToFile(sSql, 'C:\temp\sSql.txt');
   Result := GetDataPacket(sSql);
end;

//AL_5
function TCtrlRendaFixa.AplicaAtualOperRenFix: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualOperRenFix(FCdsOperRenFix.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsOperRenFix,FDbOperRenFix,[],[]);
          if not Result then
           begin
              MessageInfo := FDbOperRenFix.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

//AL_5
function TCtrlRendaFixa.AplicaAtualOperRenFixXCurvas: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualOperRenFixXCurvas(FCdsOperRenFixXCurvas.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsOperRenFixXCurvas,FDbOperRenFixXCurvas,[],[]);
          if not Result then
           begin
              MessageInfo := FDbOperRenFixXCurvas.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

//AL_5
function TCtrlRendaFixa.AplicaAtualHistRenFix: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualHistRenFix(FCdsHistRenFix.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsHistRenFix,FDbHistRenFix,[],[]);
          if not Result then
           begin
              MessageInfo := FDbHistRenFix.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

//AL_5
function TCtrlRendaFixa.AplicaAtualHistRenFixXItens: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualHistRenFixXItens;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsHistRenFix,FDbHistRenFix,[],[]);
          if not Result then
           begin
              MessageInfo := FDbHistRenFix.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

//AL_5
procedure TCtrlRendaFixa.SetCdsHistRenFix(const Value: TClientDataSet);
begin
  FCdsHistRenFix := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetCdsHistRenFixXItens(const Value: TClientDataSet);
begin
  FCdsHistRenFixXItens := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetCdsOperRenFix(const Value: TClientDataSet);
begin
  FCdsOperRenFix := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetCdsOperRenFixXCurvas(const Value: TClientDataSet);
begin
  FCdsOperRenFixXCurvas := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetDbHistRenFix(const Value: TDbHistRenFix);
begin
   FDbHistRenFix := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetDbHistRenFixXItens(const Value: TDbHistRenFixXItens);
begin
   FDbHistRenFixXItens := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetDbOperRenFix(const Value: TDbOperRenFix);
begin
   FDbOperRenFix := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetDbOperRenFixXCurvas(const Value: TDbOperRenFixXCurvas);
begin
   FDbOperRenFixXCurvas := Value;
end;

//AL_5
function TCtrlRendaFixa.ListOperRenFix(iOperRenFix : Integer = -1;
                                       dDataIni : TDateTime = 0;
                                       dDataFim : TDateTime = 0;
                                       iOperAplic : Integer = -1;
                                       iInvestimento : Integer = -1;
                                       iTipoOperacao : Integer = -1;
                                       iOperOrig : Integer = -1;
                                       iPlanPrev : Integer = -1;
                                       iCustodiante : Integer = -1;
                                       iCarteiraInvest : Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + 'IDOPERRENFIX, IDINVESTIMENTO, IDCUSTODIANTE, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, IDFORCLI, ';
   sSql := sSql + 'MOECODIGO, DATAOPERACAO, PUOPERACAO, PUEMISSAO, VLROPERACAO, QTDEOPERACAO, VENCOPERACAO,    ';
   sSql := sSql + 'OBSERVACAO, IDTIPOOPERACAO, IDTIPOINVEST, DATAEMISSAO, IDUSUARIO, IDOPERRENFIXAPLIC,        ';
   sSql := sSql + 'TXBOLSA, TXOPERACIONAL, FLGOPERIMPLANT, PUMERCADO, DATALEILAO, FLGNEGOCIACAO,               ';
   sSql := sSql + 'CODDOCUMENTO, PLNCODIGO, BOLETA, IDCLASSRISCORENFIX, FLGCARTHIPO, QTDCARTHIPO,              ';
   sSql := sSql + 'FLGRECALC, PERCTRANSF, FLGDTRENTAB, DATALIQUIDACAO, IDOPERRENFIXORIG                        ';
   sSql := sSql + 'FROM OPERRENFIX ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 1';
   if iOperRenFix <> -1 then
      sSql := sSql + '  AND IDOPERRENFIX = ' + IntToStr(iOperRenFix);
   if dDataIni > 0 then
      sSql := sSql + '  AND DATAOPERACAO >= TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   if dDataFim > 0 then
      sSql := sSql + '  AND DATAOPERACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   if iInvestimento > 0 then
      sSql := sSql + '  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento);
   if iTipoOperacao > 0 then
      sSql := sSql + '  AND IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao);
   if iOperAplic > 0 then
      sSql := sSql + '  AND IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic);
   if iOperOrig > 0 then
      sSql := sSql + '  AND IDOPERRENFIXORIG = ' + IntToStr(iOperOrig);
   if iPlanPrev > 0 then
      sSql := sSql + '  AND IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev);
   if iCustodiante > 0 then
      sSql := sSql + '  AND IDCUSTODIANTE = ' + IntToStr(iCustodiante);
   if iCarteiraInvest > 0 then
      sSql := sSql + '  AND IDCARTEIRAINVEST = ' + IntToStr(iCarteiraInvest);

   sSql := sSql + 'ORDER BY IDOPERRENFIX  ';
   Result := GetDataPacket(sSql);
end;

//AL_5
function TCtrlRendaFixa.ListOperRenFixXCurvas(iOperRenFix : Integer = -1;
                                              iCurvaRenFix : Integer = -1;
                                              iItemRenFix : Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + 'IDOPERRENFIX, IDCURVARENFIX, IDITEMRENFIX, ';
   sSql := sSql + 'MOECODIGO, VLRCURVA, PERCCURVA, TXJUROS    ';
   sSql := sSql + 'FROM OPERRENFIXXCURVAS ';
   sSql := sSql + 'WHERE 1 = 1';
   if iOperRenFix <> -1 then
      sSql := sSql + '  AND IDOPERRENFIX = ' + IntToStr(iOperRenFix);
   if iCurvaRenFix > 0 then
      sSql := sSql + '  AND IDCURVARENFIX = ' + IntToStr(iCurvaRenFix);
   if iItemRenFix > 0 then
      sSql := sSql + '  AND IDITEMRENFIX = ' + IntToStr(iItemRenFix);

   sSql := sSql + 'ORDER BY IDOPERRENFIX, IDCURVARENFIX, IDITEMRENFIX  ';
   Result := GetDataPacket(sSql);
end;

//AL_5
function TCtrlRendaFixa.ListHistRenFix(iHistRenFix : Integer = -1;
                                       dDataIni : TDateTime = 0;
                                       dDataFim : TDateTime = 0;
                                       iOperAplic : Integer = -1;
                                       iInvestimento : Integer = -1;
                                       iTipoOperacao : Integer = -1;
                                       iOperOrig : Integer = -1;
                                       iPlanPrev : Integer = -1;
                                       iCarteiraInvest : Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + 'IDHISTRENFIX, IDEMPRESAPROP, IDMODULO, IDPLANPREVCTBPATR, PLNCODIGO, CODDOCUMENTO,                  ';
   sSql := sSql + 'IDTIPOINVEST, IDTIPOOPERACAO, IDCARTEIRAINVEST, IDOPERRENFIXAPLIC, IDOPERRENFIX,                    ';
   sSql := sSql + 'IDINVESTIMENTO, DATAHISTRENFIX, VLRHISTRENFIX, QTDHISTRENFIX, SALDOVLRHISTRENFI,                    ';
   sSql := sSql + 'SALDOQTDHISTRENFI, TIPMOVHISRENFIX, NATURMOVHISTRENFI, HISTMOVRENFIX, FLGRECALC, IDOPERRENFIXORIG   ';
   sSql := sSql + 'FROM HISTRENFIX ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 1';
   if iHistRenFix <> -1 then
      sSql := sSql + '  AND IDHISTRENFIX = ' + IntToStr(iHistRenFix);
   if dDataIni > 0 then
      sSql := sSql + '  AND DATAHISTRENFIX >= TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   if dDataFim > 0 then
      sSql := sSql + '  AND DATAHISTRENFIX <= TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   if iInvestimento > 0 then
      sSql := sSql + '  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento);
   if iTipoOperacao > 0 then
      sSql := sSql + '  AND IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao);
   if iOperAplic > 0 then
      sSql := sSql + '  AND IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic);
   if iOperOrig > 0 then
      sSql := sSql + '  AND IDOPERRENFIXORIG = ' + IntToStr(iOperOrig);
   if iPlanPrev > 0 then
      sSql := sSql + '  AND IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev);
   if iCarteiraInvest > 0 then
      sSql := sSql + '  AND IDCARTEIRAINVEST = ' + IntToStr(iCarteiraInvest);

   sSql := sSql + 'ORDER BY IDHISTRENFIX  ';
   Result := GetDataPacket(sSql);
end;

//AL_5
function TCtrlRendaFixa.ListHistRenFixXItens(iHistRenFix : Integer = -1;
                                            iCurvaRenFix : Integer = -1;
                                            iItemRenFix : Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + 'IDHISTRENFIX, IDCURVARENFIX, IDREGRACALCULO, IDITEMRENFIX, PUITEM, PUACUITEM, VLRITEM, VLRACUITEM ';
   sSql := sSql + 'FROM HISTRENFIXXITENS ';
   sSql := sSql + 'WHERE 1 = 1';
   if iHistRenFix <> -1 then
      sSql := sSql + '  AND IDHISTRENFIX = ' + IntToStr(iHistRenFix);
   if iCurvaRenFix > 0 then
      sSql := sSql + '  AND IDCURVARENFIX = ' + IntToStr(iCurvaRenFix);
   if iItemRenFix > 0 then
      sSql := sSql + '  AND IDITEMRENFIX = ' + IntToStr(iItemRenFix);

   sSql := sSql + 'ORDER BY IDHISTRENFIX  ';
   Result := GetDataPacket(sSql);
end;

//AL_5
function TCtrlRendaFixa.ListItemXOpeXInv(iInvestimento : Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT CI.IDCURVARENFIX, CR.DESCCURVARENFIX, IC.FLGCURVACONTABIL, CI.IDITEMRENFIX, IT.DESCITEMRENFIX, ' + #13 +
                  '       CI.FLGMOEDA, CI.IDREGRA, CI.FLGDESTACADO, CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.TIPOITEM , ' + #13 +
                  '       IV.IDCLASSETIT, IC.FLGCURVACONTABIL, IC.FLGTPCURVASWAP, IC.FLGCOTRENFIX  ' + #13 +
                  'FROM INVESTIMENTO IV, ITEMRENFIX IT, CURVASRENFIX CR,' + #13 +
                  '     INVESTXCURVARENFIX IC, CURVASXITEMRENFIX CI ' + #13 +
                  'WHERE IV.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' AND ' + #13 +
                  '      IT.IDITEMRENFIX = CI.IDITEMRENFIX AND ' + #13 +
                  '      CI.IDCURVARENFIX = CR.IDCURVARENFIX AND ' + #13 +
                  '      IC.IDCURVARENFIX = CR.IDCURVARENFIX AND ' + #13 +
                  '      IC.IDINVESTIMENTO = IV.IDINVESTIMENTO ' + #13 +
                  'ORDER BY IC.FLGCURVACONTABIL, CI.IDCURVARENFIX, SEQCALCULO ';
   Result := GetDataPacket(sSql);
end;

//AL_5
procedure TCtrlRendaFixa.AfterInitialize;
begin
  inherited;
   //
end;

//AL_5
procedure TCtrlRendaFixa.SetBuscaSaldoRF(const Value: TBuscaSaldoRF);
begin
   FBuscaSaldoRF := Value;
end;

//AL_5
procedure TCtrlRendaFixa.SetBuscaSaldoRFPoup(const Value: TBuscaSaldoRF);
begin
   FBuscaSaldoRFPoup := Value;
end;

//AL_5
function TCtrlRendaFixa.ListCarteiraRixa : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDCARTEIRAINVEST, DESCCARTINVEST FROM CARTEIRAINVEST ' + #13 +
                  'WHERE IDTIPOINVEST = 1 ORDER BY DESCCARTINVEST ';
   Result := GetDataPacket(sSql);
end;

//AL_5
function TCtrlRendaFixa.ListClasseRiscoRenFix : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDCLASSRISCORENFIX, NOMECLASSRISCO, NIVELCLASSRISCO ' + #13 +
                  'FROM CLASSRISCORENFIX ORDER BY NIVELCLASSRISCO ';
   Result := GetDataPacket(sSql);
end;

function TCtrlRendaFixa.AplicaAtualItemRenFix(Codigo: TParamRecS; sDescricao, sAcao: String; IDItem: TParamRecI): Boolean;
Var
  sSql: String;
  sGrpArquivo: String;
  bExisteOld, bExisteNew, bInsGrpArquivo: Boolean;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualItemRenFix(FCdsItemRenFix.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      Try
         //AL_8 - Ini
         bExisteOld := False;
         bExisteNew := False;
         bInsGrpArquivo := False;

         // Verifica se existe INV_sOldCodigo em CMPBD
         sSQL := 'SELECT * FROM CMPBD WHERE IDCAMPO = '+ QuotedStr('INV_'+Trim(Copy(Codigo.OldValue,1,8)));
         _Cds.Data := GetDataPacket(sSql);
         If Not _Cds.IsEmpty then
            bExisteOld := True;

         // Verifica se existe INV_sNewCodigo em CMPBD
         sSQL := 'SELECT * FROM CMPBD WHERE IDCAMPO = '+ QuotedStr('INV_'+Trim(Copy(Codigo.NewValue,1,8)));
         _Cds.Data := GetDataPacket(sSql);
         If Not _Cds.IsEmpty then
            bExisteNew := True;

         // Verifica se já existe um grupo Investimento
         sSQL := 'SELECT CODGRUPOARQUIVO FROM GRPARQUIVO WHERE UPPER(DESCGRUPOARQUIVO) = ''INVESTIMENTO''';
         _Cds.Data := GetDataPacket(sSql);
         If Not _Cds.IsEmpty then
            sGrpArquivo := _Cds.Fieldbyname('CODGRUPOARQUIVO').AsString
         else
         begin
            sGrpArquivo := 'INVEST';
            bInsGrpArquivo := True;
         end;

         StartTransaction;

         //AL_6
         // Inserindo o Grupo de Investimento em GRPARQUIVO
         If bInsGrpArquivo then //Não existe vou criar
         begin
            sSql:= '';
            sSql:= 'INSERT INTO GRPARQUIVO (CODGRUPOARQUIVO, DESCGRUPOARQUIVO) VALUES (''INVEST'', ''INVESTIMENTO'')';
            if not ExecSQL(sSql, False) Then
               Raise Exception.Create('');
            sGrpArquivo := 'INVEST';
         end; // Caso contrário fico com o Grupo já existente passado pelo parâmetro

         If sAcao = 'A' then
         begin
            If Codigo.OldValue = Codigo.NewValue then
            begin
               //Vou alterar pois pode ter referencia na regra, por isso não posso excluir
               sSql := '';
               sSql := sSql + 'UPDATE CMPBD ' ;
               sSql := sSql + 'SET IDCAMPO = ''INV_' + Copy(Codigo.NewValue,1,8) + ''', ' ;
               sSql := sSql + '    ENTIDADE = ''DUAL'',' ;
               sSql := sSql + '    NOMEDOCAMPO = ''' + Codigo.NewValue + ''', ' ;
               sSql := sSql + '    DESCRICAODOCAMPO = ''' + sDescricao + ''',' ;
               sSql := sSql + '    CAMPODOBANCO = 2, IDTIPODADO = 1 ' ;
               sSql := sSql + 'WHERE IDCAMPO = ''INV_' + Copy(Trim(Codigo.OldValue),1,8) + '''';
               if not ExecSQL(sSql, False) Then
                  Raise Exception.Create('');

               sSql := '';
               sSql := sSql + 'UPDATE CMPBDGRP ' ;
               sSql := sSql + 'SET IDCAMPO = ''INV_' + Copy(Codigo.NewValue,1,8) + ''', ' ;
               sSql := sSql + '    CODGRUPOARQUIVO = ' + quotedstr(Trim(sGrpArquivo)) ;
               sSql := sSql + 'WHERE IDCAMPO = ''INV_' + Copy(Trim(Codigo.OldValue),1,8) + '''';
               if not ExecSQL(sSql, False) Then
                  Raise Exception.Create('');
            end
            else
            begin
               If bExisteOld then // Existe Inv_SOldCodigo
               begin
                  If bExisteNew then
                     Raise Exception.Create('Código já existe!') //ok
                  else
                  begin
                     //É diferente, existe o old e não existe o new, não vou poder alterar pois é chave primaria
                     // Vou tentar excluir o old e incluir o new, porém se tiver regra vai dar erro de constraint
                     //Apagando Inv_sOldCodigo de CMPBDGRP
                     sSql:='';
                     sSql:= sSql + ('DELETE FROM CMPBDGRP WHERE IDCAMPO = ''INV_' + Copy(Codigo.OldValue,1,8)+ '''');
                     sSql:= sSql + ('AND CODGRUPOARQUIVO=' + quotedstr(sGrpArquivo));
                     if not ExecSQL(sSql, False) Then
                        Raise Exception.Create('');

                     //Apagando Inv_sOldCodigo de CMPBD
                     sSql:='';
                     sSql:= sSql + ('DELETE FROM CMPBD WHERE IDCAMPO = ''INV_' + Copy(Codigo.OldValue,1,8)+ '''');
                     if not ExecSQL(sSql, False) Then
                        Raise Exception.Create('');

                     // Vou inserir somente SNewCodigo em CMPBD
                     sSql:= '';
                     sSql:= sSql + 'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES' ;
                     sSql:= sSql + '('+quotedstr('INV_' + Copy(Codigo.NewValue,1,8))+ ','+ quotedstr('DUAL')+','+quotedstr(Codigo.NewValue) + ', ' + quotedstr(sDescricao) + ','+ '2, 1'+')';
                     if not ExecSQL(sSql, False) Then
                        Raise Exception.Create('');

                     // Vou inserir somente SNewCodigo em CMPBDGRP
                     sSql:= '';
                     sSql:= sSql + 'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES ';
                     sSql:= sSql + '(''' + sGrpArquivo + ''', ''INV_' + Copy(Codigo.NewValue,1,8) + ''')';
                     if not ExecSQL(sSql, False) Then
                        Raise Exception.Create('');

                  end;
               end
               else // Senão existe old
               begin
                  If bExisteNew then // Não existe o old e existe o new erro
                     Raise Exception.Create('Código já existe!')
                  else
                  begin
                     // Vou inserir somente SNewCodigo em CMPBD
                     sSql:= '';
                     sSql:= sSql + 'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES' ;
                     sSql:= sSql + '('+QuotedStr('INV_' + Copy(Codigo.NewValue,1,8))+ ','+ QuotedStr('DUAL')+','+QuotedStr(Codigo.NewValue) + ', ' + QuotedStr(sDescricao) + ','+ '2, 1'+')';
                     if not ExecSQL(sSql, False) Then
                        Raise Exception.Create('');

                     // Vou inserir somente SNewCodigo em CMPBDGRP
                     sSql:= '';
                     sSql:= sSql + 'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES ';
                     sSql:= sSql + '(''' + sGrpArquivo + ''', ''INV_' + Copy(Codigo.NewValue,1,8) + ''')';
                     if not ExecSQL(sSql, False) Then
                        Raise Exception.Create('');
                  end;
               end;
            end;
         end
         else If sAcao = 'I' then
         begin
            If (Codigo.OldValue = '') and not(bExisteNew) then
            begin
               // Vou inserir SNewCodigo em CMPBD
               sSql:= '';
               sSql:= sSql + 'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES ';
               sSql:= sSql + '('+QuotedStr('INV_' + Copy(Codigo.NewValue,1,8))+ ','+ QuotedStr('DUAL')+','+ QuotedStr(Codigo.NewValue) + ', ' +QuotedStr(sDescricao) + ','+ '2, 1'+')';
               if not ExecSQL(sSql, False) Then
                  Raise Exception.Create('');

               // Vou inserir SNewCodigo em CMPBDGRP
               sSql:= '';
               sSql:= sSql + 'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES ' ;
               sSql:= sSql + '(''' + sGrpArquivo + ''', ''INV_' + Copy(Codigo.NewValue,1,8) + ''')' ;
               if not ExecSQL(sSql, False) Then
                  Raise Exception.Create('');

            end; // O já existe é validado lá fora
         end
         else if sAcao = 'E' then
         begin
            sSql:='';
            sSql:= sSql + ('DELETE FROM CMPBDGRP WHERE IDCAMPO = ''INV_' + Copy(Codigo.OldValue,1,8)+ '''');
            sSql:= sSql + ('AND CODGRUPOARQUIVO=' + quotedstr(sGrpArquivo));
            if not ExecSQL(sSql, False) Then
              Raise Exception.Create('');

            sSql:='';
            sSql:= sSql + ('DELETE FROM CMPBD WHERE IDCAMPO = ''INV_' + Copy(Codigo.OldValue,1,8)+ '''');
            if not ExecSQL(sSql, False) Then
              Raise Exception.Create('');
         end;

          // *****************   Fim AL_6 ********************************

         Result := ApplyCds(FCdsItemRenFix,FDbItemRenFix,[],[]);

         if (IDItem.OldValue <> 0) and (IDItem.OldValue <> IDItem.NewValue) and (sAcao <> 'E') then
         begin
            if not ExecSQL('UPDATE ITEMRENFIX SET IDITEMRENFIX = ' + IntToStr(IDItem.NewValue) + ' WHERE IDITEMRENFIX = ' + IntToStr(IDItem.OldValue)) then
               Raise Exception.Create('Não foi possível alterar o Identificador do Item')
            else
               IdItemRenFix := IDItem.NewValue;
         end
         else
            //Al_6
            IdItemRenFix := DbItemRenFix.IdItemRenFix.AsInteger;
         
         //AL_8 - Fim

         if not Result then
            Raise Exception.Create(FDbItemRenFix.MessageInfo);

         Commit;
      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;


procedure TCtrlRendaFixa.SetIdItemRenFix(const Value: Integer);
begin
  FIdItemRenFix := Value;
end;

function TCtrlRendaFixa.FazRegra(iRegra: Integer; cds: TCMClientDataSet; sSql: String): Boolean;
var RegraMT : TCtrlRegra;
begin
   if (cds = nil) and (sSql = '') then
   begin
      Result := False;
      FRegraResult := 0;
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

procedure TCtrlRendaFixa.SetRegraResult(const Value: Double);
begin
  FRegraResult := Value;
end;

{TCtrlPersistentObject }
procedure TCtrlPersistentObject.Clear;
begin
   //
end;

//AL_5
constructor TCtrlPersistentObject.Create(Aowner: TCmControlObject);
begin
   FOwner := Aowner;
   _Cds := TClientDataSet.Create(nil);
end;
//AL_5
destructor TCtrlPersistentObject.Destroy;
begin
   FreeAndNil(_Cds);
  inherited;
end;
//AL_5
procedure TCtrlPersistentObject.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;

{ TBuscaSaldoRF }
//AL_5
constructor TBuscaSaldoRF.Create(Aowner: TCmControlObject);
begin
  inherited;
   //AL_5
   CdsSldOperRenFix        := TClientDataSet.Create(nil);
   CdsSldOperRenFixXCurvas := TClientDataSet.Create(nil);
   CdsSldHistRenFix        := TClientDataSet.Create(nil);
   CdsSldHistRenFixXItens  := TClientDataSet.Create(nil);
   CdsSldOperRenFixPoup        := TClientDataSet.Create(nil);
   CdsSldOperRenFixXCurvasPoup := TClientDataSet.Create(nil);
   CdsSldHistRenFixPoup        := TClientDataSet.Create(nil);
   CdsSldHistRenFixXItensPoup  := TClientDataSet.Create(nil);
end;
//AL_5
destructor TBuscaSaldoRF.Destroy;
begin
  inherited;
   FreeAndNil(FCdsSldOperRenFix);
   FreeAndNil(FCdsSldOperRenFixXCurvas);
   FreeAndNil(FCdsSldHistRenFix);
   FreeAndNil(FCdsSldHistRenFixXItens);
   FreeAndNil(FCdsSldOperRenFixPoup);
   FreeAndNil(FCdsSldOperRenFixXCurvasPoup);
   FreeAndNil(FCdsSldHistRenFixPoup);
   FreeAndNil(FCdsSldHistRenFixXItensPoup);
end;
//AL_5
procedure TBuscaSaldoRF.SetCdsSldHistRenFix(const Value: TClientDataSet);
begin
   FCdsSldHistRenFix := Value;
end;
//AL_5
procedure TBuscaSaldoRF.SetCdsSldHistRenFixXItens(const Value: TClientDataSet);
begin
   FCdsSldHistRenFixXItens := Value;
end;
//AL_5
procedure TBuscaSaldoRF.SetCdsSldOperRenFix(const Value: TClientDataSet);
begin
   FCdsSldOperRenFix := Value;
end;
//AL_5
procedure TBuscaSaldoRF.SetCdsSldOperRenFixXCurvas(const Value: TClientDataSet);
begin
   FCdsSldOperRenFixXCurvas := Value;
end;
//AL_5
procedure TBuscaSaldoRF.SetIdHistRenFix(const Value: Integer);
begin
   FIdHistRenFix := Value;
end;
//AL_5
procedure TBuscaSaldoRF.SetIdOperRenFix(const Value: Integer);
begin
   FIdOperRenFix := Value;
end;

// AL_5
function TBuscaSaldoRF.Executa(dDataSaldo: TDateTime;
                               iInvestimento: Integer = -1;
                               iOperacao: Integer = -1;
                               iClasseTit: Integer = -1;
                               iTipoProc: Integer = 1;
                               bOper: Boolean = False): Boolean;
begin
   Try
      //Abre os Cds´s  Vazios
      CdsSldHistRenFix.Data := ListSldHistRenFix(dDataSaldo,
                                                 iInvestimento, iOperacao, iClasseTit, iTipoProc, bOper);
      if CdsSldHistRenFix.IsEmpty then
          Raise Exception.Create('Saldo não encontrado no Histórico.')
      else
      begin
         CdsSldHistRenFixXItens.Data  := ListSldHistRenFixXItens(CdsSldHistRenFix.FieldByName('IDHISTRENFIX').AsInteger);
         CdsSldOperRenFix.Data        := ListSldOperRenFix(CdsSldHistRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
         CdsSldOperRenFixXCurvas.Data := ListSldOperRenFixXCurvas(CdsSldHistRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
      end;
   except
      on E:Exception do
      begin
         Result := False;
         TCtrlRendaFixa(owner).MessageInfo := E.Message;
      end;
   end;
end;

// AL_5
function TBuscaSaldoRF.ExecutaPoup(dDataSaldo: TDateTime;
                                   iInvestimento: Integer = -1;
                                   iOperacao: Integer = -1;
                                   iClasseTit: Integer = -1;
                                   iClassePoupBloq : Integer = -1;
                                   iTipoProc: Integer = 1;
                                   iOper: Boolean = False): Boolean;
begin
   Try
      //Abre os Cds´s  Vazios
      CdsSldHistRenFixPoup.Data := ListSldHistRenFixPoup(dDataSaldo,
                                                         iInvestimento, iOperacao, iClasseTit, iClassePoupBloq, iTipoProc, iOper);
      if CdsSldHistRenFixPoup.IsEmpty then
          Raise Exception.Create('Saldo não encontrado no Histórico.')
      else
      begin
         CdsSldHistRenFixXItensPoup.Data  := ListSldHistRenFixXItensPoup(CdsSldHistRenFixPoup.FieldByName('IDHISTRENFIX').AsInteger);
         CdsSldOperRenFixPoup.Data        := ListSldOperRenFixPoup(CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
         CdsSldOperRenFixXCurvasPoup.Data := ListSldOperRenFixXCurvasPoup(CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
      end;
   except
      on E:Exception do
      begin
         Result := False;
         TCtrlRendaFixa(owner).MessageInfo := E.Message;
      end;
   end;
end;

// AL_5
function TBuscaSaldoRF.ListSldHistRenFix(dDataSaldo: TDateTime;
                                         iInvestimento: Integer = -1;
                                         iOperacao: Integer = -1;
                                         iClasseTit: Integer = -1;
                                         iTipoProc: Integer = 1;
                                         bOper: Boolean = False) : OleVariant;
var
   sSql : String;
begin
   sSql := '';

   sSql := sSql + 'SELECT  ' + #13 +
                  '   HR.IDHISTRENFIX,HR.IDEMPRESAPROP,HR.IDMODULO,HR.IDPLANPREVCTBPATR,HR.PLNCODIGO, ' + #13 +
                  '   HR.CODDOCUMENTO,HR.IDTIPOINVEST,HR.IDTIPOOPERACAO,HR.IDCARTEIRAINVEST,HR.IDOPERRENFIXAPLIC, ' + #13 +
                  '   HR.IDOPERRENFIX,HR.IDINVESTIMENTO,HR.DATAHISTRENFIX,HR.VLRHISTRENFIX,HR.QTDHISTRENFIX, ' + #13 +
                  '   HR.SALDOVLRHISTRENFI,HR.SALDOQTDHISTRENFI,HR.TIPMOVHISRENFIX,HR.NATURMOVHISTRENFI,HR.HISTMOVRENFIX, ' + #13 +
                  '   IV.DESCINVESTIMENTO, IV.IDCLASSETIT, IV.CARENCIA, EM.SIGLAEMISSOR, CL.DESCCLASSETIT, ' + #13 +
                  '   HR.IDOPERRENFIXORIG, CL.FLGUSAQTD  ' + #13 +
                  'FROM  HISTRENFIX HR, INVESTIMENTO IV, EMISSOR EM, CLASSETITRENFIX CL ' + #13 +
                  'WHERE ' + #13 +
                  '   (HR.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
                  '  AND HR.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL') + #13 +
                  '  AND HR.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL') + #13 +
                  '  AND (HR.IDHISTRENFIX IN ' + #13 +
                  '          (SELECT MAX(H1.IDHISTRENFIX) ' + #13 +
                  '           FROM HISTRENFIX H1 ' + #13 +
                  '           WHERE (H1.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
                  '             AND H1.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL') + #13 +
                  '             AND H1.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL') + #13 +
                  '              AND ((('+ IntToStr(iTipoProc) +' IN (0,2)) AND ' + #13 +
                  '                    (H1.TIPMOVHISRENFIX = ''OPE'') AND ' + #13 +
                  '                    (H1.IDTIPOOPERACAO NOT IN (-166,-167)) AND ' + #13 +
                  '                    (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY''))) OR  ' + #13 +
                  '                   (' + IntToStr(iTipoProc) +' = 1) OR ' + #13 +
                  '                   ((' + IntToStr(iTipoProc) +' = 3) AND ' + #13 +
                  '                    (H1.TIPMOVHISRENFIX = ''TRC'') AND ' + #13 +
                  '                    (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')))) ' + #13 +
                  '              AND ((H1.IDTIPOOPERACAO NOT IN (-17,-18,-19)) OR (' + FuncoesInvest.IIF(bOper, '1 IS NOT NULL', 'NULL IS NOT NULL')+ ')) ' + #13 +
                  '              AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN ' + #13 +
                  '                       (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC ' + #13 +
                  '                        FROM HISTRENFIX H2 ' + #13 +
                  '                        WHERE (H2.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
                  '                          AND H2.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL') + #13 +
                  '                          AND H2.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL') + #13 +
                  '                          AND ((('+ IntToStr(iTipoProc) +' IN (0,2)) AND  ' + #13 +
                  '                                (H2.TIPMOVHISRENFIX = ''OPE'') AND ' + #13 +
                  '                                (H2.IDTIPOOPERACAO NOT IN (-166,-167)) AND ' + #13 +
                  '                                (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY''))) OR ' + #13 +
                  '                               ('+ IntToStr(iTipoProc) +' = 1) OR  ' + #13 +
                  '                               (('+ IntToStr(iTipoProc) +' = 3) AND ' + #13 +
                  '                                (H2.TIPMOVHISRENFIX = ''TRC'') AND ' + #13 +
                  '                                (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')))) ' + #13 +
                  '                          AND ((H2.IDTIPOOPERACAO NOT IN (-17,-18,-19)) OR (' + FuncoesInvest.IIF(bOper, '1 IS NOT NULL', 'NULL IS NOT NULL') + ')) ' + #13 +
                  '                        GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)) ' + #13 +
                  '            GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC)) ';// + #13 +

   if iClasseTit > 0 then
      sSql := sSql + '  AND IV.IDCLASSETIT  = '+ IntToStr(iClasseTit);

   sSql := sSql + '  AND ((('+ IntToStr(iTipoProc) +' IN (0,2)) AND ' + #13 +
                  '        (HR.TIPMOVHISRENFIX = ''OPE'') AND ' + #13 +
                  '         (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY''))) OR ' + #13 +
                  '        ('+ IntToStr(iTipoProc) +' = 1) OR  ' + #13 +
                  '        (('+ IntToStr(iTipoProc) +' = 3) AND ' + #13 +
                  '         (HR.TIPMOVHISRENFIX = ''TRC'') AND  ' + #13 +
                  '         (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')))) ' + #13 +
                  '   AND (HR.SALDOQTDHISTRENFI > 0) ' + #13 +
                  '   AND (IV.IDTIPOINVEST = 1)  ' + #13 +
                  '   AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO) ' + #13 +
                  '   AND (IV.IDEMISSOR = EM.IDEMISSOR) ' + #13 +
                  '   AND (IV.IDCLASSETIT = CL.IDCLASSETIT) ' + #13 +
                  ' ORDER BY DESCCLASSETIT, DESCINVESTIMENTO  ';

   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);
end;

// AL_5
function TBuscaSaldoRF.ListSldHistRenFixXItens(iIdHistRenFix: Integer) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  ' + #13 +
                  '   HT.IDHISTRENFIX, HT.IDCURVARENFIX, HT.IDITEMRENFIX, HT.PUITEM, HT.PUACUITEM, ' + #13 +
                  '   HT.IDREGRACALCULO, TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX, ' + #13 +
                  '   CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO, ' + #13 +
                  '   CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX, IT.TIPOITEM, ' + #13 +
                  '   HT.VLRITEM, HT.VLRACUITEM ' + #13 +
                  'FROM   HISTRENFIXXITENS HT, ITEMRENFIX IT, CURVASXITEMRENFIX CI  ' + #13 +
                  'WHERE  HT.IDHISTRENFIX = ' + IntToStr(iIdHistRenFix) +' AND ' + #13 +
                  '       HT.IDITEMRENFIX = IT.IDITEMRENFIX AND ' + #13 +
                  '       HT.IDCURVARENFIX = CI.IDCURVARENFIX AND ' + #13 +
                  '       HT.IDITEMRENFIX = CI.IDITEMRENFIX ' + #13 +
                  'ORDER BY CI.SEQCALCULO ';

   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);
end;

// AL_5
function TBuscaSaldoRF.ListSldOperRenFix(iIdOperRenFix: Integer) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT OP.IDOPERRENFIX, OP.IDINVESTIMENTO, OP.IDCUSTODIANTE, OP.IDCARTEIRAINVEST, ' + #13 +
                  '   OP.IDPLANPREVCTBPATR, OP.IDFORCLI, OP.MOECODIGO, OP.DATAOPERACAO, OP.PUOPERACAO, ' + #13 +
                  '   OP.PUEMISSAO, OP.VLROPERACAO, OP.QTDEOPERACAO, OP.VENCOPERACAO, OP.OBSERVACAO, ' + #13 +
                  '   OP.IDTIPOOPERACAO, OP.DATAEMISSAO, TP.NATUREZAOPERACAO, TP.FLGGERACONTAB, ' + #13 +
                  '   OP.IDUSUARIO, OP.FLGOPERIMPLANT, OP.DATALEILAO, OP.FLGCARTHIPO, OP.QTDCARTHIPO, ' + #13 +
                  '   OP.IDOPERRENFIXAPLIC,OP.TXBOLSA,OP.TXOPERACIONAL,OP.PUMERCADO,OP.FLGNEGOCIACAO, ' + #13 +
                  '   OP.CODDOCUMENTO,OP.PLNCODIGO,OP.BOLETA,OP.IDCLASSRISCORENFIX,OP.FLGRECALC, ' + #13 +
                  '   OP.DATALIQUIDACAO, OP.IDOPERRENFIXORIG, (OP1.DATAOPERACAO) AS DATAOPERACAOORIG, ' + #13 +
                  '   (OP1.PUOPERACAO) AS PUOPERACAOORIG ' + #13 +
                  'FROM  ' + #13 +
                  '   OPERRENFIX OP, TIPOOPERACAO TP, OPERRENFIX OP1  ' + #13 +
                  'WHERE ' + #13 +
                  '   OP.IDOPERRENFIX = ' + IntToStr(iIdOperRenFix) + ' ' + #13 +
                  '   AND OP.IDOPERRENFIXORIG = OP1.IDOPERRENFIX(+) ' + #13 +
                  '   AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ';
   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);
end;

function TBuscaSaldoRF.ListSldOperRenFixXCurvas(iIdOperRenFix: Integer) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT OP.IDOPERRENFIX, OP.IDITEMRENFIX, OP.IDCURVARENFIX, OP.MOECODIGO, OP.VLRCURVA, ' + #13 +
                  '       OP.PERCCURVA, TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX, ' + #13 +
                  '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO, ' + #13 +
                  '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX, MO.MOESIGLA, IT.TIPOITEM ' + #13 +
                  'FROM   OPERRENFIXXCURVAS OP, ITEMRENFIX IT, CURVASXITEMRENFIX CI, MOEDA MO ' + #13 +
                  'WHERE  OP.IDOPERRENFIX = ' + IntToStr(iIdOperRenFix) + ' AND ' + #13 +
                  '       OP.IDITEMRENFIX = IT.IDITEMRENFIX AND ' + #13 +
                  '       OP.IDCURVARENFIX = CI.IDCURVARENFIX AND ' + #13 +
                  '       OP.IDITEMRENFIX = CI.IDITEMRENFIX AND ' + #13 +
                  '       OP.MOECODIGO = MO.MOECODIGO(+) ' + #13 +
                  'ORDER BY CI.SEQCALCULO ';
   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);
end;

// AL_5
function TBuscaSaldoRF.ListSldHistRenFixPoup(dDataSaldo: TDateTime;
                                             iInvestimento: Integer = -1;
                                             iOperacao: Integer = -1;
                                             iClasseTit: Integer = -1;
                                             iClassePoupBloq : Integer = -1;
                                             iTipoProc: Integer = 1;
                                             iOper: Boolean = False) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ' + #13 +
                  '   HR.IDHISTRENFIX,HR.IDEMPRESAPROP,HR.IDMODULO,HR.IDPLANPREVCTBPATR,HR.PLNCODIGO, ' + #13 +
                  '   HR.CODDOCUMENTO,HR.IDTIPOINVEST,HR.IDTIPOOPERACAO,HR.IDCARTEIRAINVEST,HR.IDOPERRENFIXAPLIC, ' + #13 +
                  '   HR.IDOPERRENFIX,HR.IDINVESTIMENTO,HR.DATAHISTRENFIX,HR.VLRHISTRENFIX,HR.QTDHISTRENFIX, ' + #13 +
                  '   HR.SALDOVLRHISTRENFI,HR.SALDOQTDHISTRENFI,HR.TIPMOVHISRENFIX,HR.NATURMOVHISTRENFI,HR.HISTMOVRENFIX, ' + #13 +
                  '   IV.DESCINVESTIMENTO, IV.CARENCIA, IV.IDCLASSETIT, HR.IDOPERRENFIXORIG ' + #13 +
                  'FROM   HISTRENFIX HR, INVESTIMENTO IV ' + #13 +
                  'WHERE ' + #13 +
                  '   (HR.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
                  '  AND HR.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NULL') + #13 +
                  '  AND HR.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NULL') + #13 +
                  '  AND HR.IDHISTRENFIX IN ' + #13 +
                  '         (SELECT MAX(H1.IDHISTRENFIX) ' + #13 +
                  '          FROM HISTRENFIX H1 ' + #13 +
                  '           WHERE (H1.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
                  '             AND H1.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NULL') + #13 +
                  '             AND H1.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NULL') + #13 +
                  '            AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN  ' + #13 +
                  '                     (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC ' + #13 +
                  '                      FROM HISTRENFIX H2 ' + #13 +
                  '                        WHERE (H2.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
                  '                          AND H2.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NULL') + #13 +
                  '                          AND H2.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NULL') + #13 +
                  '                      GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)) ' + #13 +
                  '          GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC) ' + #13 +
                  '  AND ((IV.IDCLASSETIT ' + FuncoesInvest.IIF(iClasseTit > 0, ' = '+ IntToStr(iClasseTit), 'IS NULL') + ') OR ' + #13 +
                  '       (IV.IDCLASSETIT ' + FuncoesInvest.IIF(iClassePoupBloq > 0, ' = '+ IntToStr(iClassePoupBloq), 'IS NULL') + ')) ' + #13 +
                  '  AND (IV.IDTIPOINVEST = 1) ' + #13 +
                  '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO) ' + #13 +
                  '  AND (HR.SALDOVLRHISTRENFI > 0)' ;
   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);

end;

// AL_5
function TBuscaSaldoRF.ListSldHistRenFixXItensPoup(iIdHistRenFix: Integer) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT HT.IDHISTRENFIX, HT.IDCURVARENFIX, HT.IDITEMRENFIX, HT.PUITEM, HT.PUACUITEM, ' + #13 +
                  '       HT.IDREGRACALCULO, TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX,' + #13 +
                  '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO, ' + #13 +
                  '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX ' + #13 +
                  'FROM   HISTRENFIXXITENS HT, ITEMRENFIX IT, CURVASXITEMRENFIX CI ' + #13 +
                  'WHERE  HT.IDHISTRENFIX = ' + IntToStr(iIdHistRenFix) +' AND ' + #13 +
                  '       HT.IDITEMRENFIX = IT.IDITEMRENFIX AND ' + #13 +
                  '       HT.IDCURVARENFIX = CI.IDCURVARENFIX AND ' + #13 +
                  '       HT.IDITEMRENFIX = CI.IDITEMRENFIX  ' + #13 +
                  'ORDER BY CI.SEQCALCULO';
   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);
end;

// AL_5
function TBuscaSaldoRF.ListSldOperRenFixPoup(iIdOperRenFix: Integer) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT OP.IDOPERRENFIX, OP.IDINVESTIMENTO, OP.IDCUSTODIANTE, OP.IDCARTEIRAINVEST, ' + #13 +
                  '       OP.IDPLANPREVCTBPATR, OP.IDFORCLI, OP.MOECODIGO, OP.DATAOPERACAO, OP.PUOPERACAO, ' + #13 +
                  '       OP.PUEMISSAO, OP.VLROPERACAO, OP.QTDEOPERACAO, OP.VENCOPERACAO, OP.OBSERVACAO, ' + #13 +
                  '       OP.IDTIPOOPERACAO, OP.DATAEMISSAO, TP.NATUREZAOPERACAO, TP.FLGGERACONTAB ' + #13 +
                  'FROM OPERRENFIX OP, TIPOOPERACAO TP ' + #13 +
                  'WHERE IDOPERRENFIX = ' + IntToStr(iIdOperRenFix) + ' AND ' + #13 +
                  '      OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ';
   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);
end;

function TBuscaSaldoRF.ListSldOperRenFixXCurvasPoup(iIdOperRenFix: Integer) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT OP.IDOPERRENFIX, OP.IDITEMRENFIX, OP.IDCURVARENFIX, OP.MOECODIGO, OP.VLRCURVA, ' + #13 +
                  '       OP.PERCCURVA, TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX, ' + #13 +
                  '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO, ' + #13 +
                  '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX, MO.MOESIGLA ' + #13 +
                  'FROM   OPERRENFIXXCURVAS OP, ITEMRENFIX IT, CURVASXITEMRENFIX CI, MOEDA MO ' + #13 +
                  'WHERE  OP.IDOPERRENFIX =  ' + IntToStr(iIdOperRenFix) + ' AND ' + #13 +
                  '       OP.IDITEMRENFIX = IT.IDITEMRENFIX AND ' + #13 +
                  '       OP.IDCURVARENFIX = CI.IDCURVARENFIX AND ' + #13 +
                  '       OP.IDITEMRENFIX = CI.IDITEMRENFIX AND ' + #13 +
                  '       OP.MOECODIGO = MO.MOECODIGO(+) ' + #13 +
                  'ORDER BY CI.SEQCALCULO ';
   Result := TCtrlRendaFixa(Owner).GetDataPacket(sSql);
end;

procedure TBuscaSaldoRF.SetCdsSldHistRenFixPoup(const Value: TClientDataSet);
begin
  FCdsSldHistRenFixPoup := Value;
end;

procedure TBuscaSaldoRF.SetCdsSldHistRenFixXItensPoup(const Value: TClientDataSet);
begin
  FCdsSldHistRenFixXItensPoup := Value;
end;

procedure TBuscaSaldoRF.SetCdsSldOperRenFixPoup(const Value: TClientDataSet);
begin
  FCdsSldOperRenFixPoup := Value;
end;

//AL_6
procedure TBuscaSaldoRF.SetCdsSldOperRenFixXCurvasPoup(const Value: TClientDataSet);
begin
  FCdsSldOperRenFixXCurvasPoup := Value;
end;

end.



