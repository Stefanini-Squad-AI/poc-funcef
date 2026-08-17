//******************************************************************************
// Rotina     : ListaRelHistCustodia();
// SOL        : 126262
// Kintana    : 661559
// Data       : 30/10/2009
// Responsável: William M. Santos
// Descrição  : Ajuste no filtro da qry para não trazer registros do tipo transferência de IOF.
//******************************************************************************
// Data      : 31/08/2007
// Código    : AL_7
// Pendencia : 26199
// SOL       :
// Desc      : Alteração da ListaOperCustodia para aceitar retorno vazio
//             ExcluiOperCustodia e GravaOperCustodia
//******************************************************************************
// Data      : 28/11/2006
// Código    : AL_6
// Pendencia : 23891
// SOL       : 42459
// Desc      : Adaptação na GravaOperCustodia com o sTipoBoleta
//******************************************************************************
// Data     : 29/11/2006
// Código   : AL_5
// Pendencia: 22984
// SOL      :
// Desc     : Segregação de Planos
//            Não usa mais CC e CCI na Custodia
//******************************************************************************
// Data     : 02/10/2006
// Código   : AL_4
// Pendencia: 22967
// SOL      :
// Desc     : Implementação da ListSaldosCustodia
//******************************************************************************
// Data     : 22/08/2006
// Código   : AL_3
// Pendencia:
// SOL      :
// Desc     : Implementação da ListSaldosCustodia
//******************************************************************************
// Data     : 25/04/2006
// Código   : AL_2
// Pendencia:
// SOL      :
// Desc     : Implementação da transferência de custodia
//            Implementação das rotinas básicas de custódia em 3 camadas
//******************************************************************************
// Data     : 06/04/2006
// Código   : AL_1
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************

unit uCtrlCustodia;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uDbBolsavalores, uDbOperCustodia, uCtrlRendaVariavel, uCtrlPadroes, uDBBoleta,
     uDbHistcustodia, uCMFileUtils
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlCustodia = Class(TCmControlObject)
   private
      // AL_1
      FDbOperCustodia  : TDbOperCustodia;
      FCdsOperCustodia : TClientDataSet;

      FDbHistCustodia: TDbHistCustodia;
      FCdsHistCustodia: TClientDataSet;

      // AL_2
      CtrlRendaVariavel: TCtrlRendaVariavel;

      FIdHistCustOrig: Integer;
      FIdHistCustDest: Integer;

      procedure SetCdsOperCustodia(const Value: TClientDataSet);
      procedure SetDbOperCustodia(const Value: TDbOperCustodia);
      procedure SetCdsHistCustodia(const Value: TClientDataSet);
      procedure SetDbHistCustodia(const Value: TDbHistCustodia);
      procedure SetIdHistCustDest(const Value: Integer);
      procedure SetIdHistCustOrig(const Value: Integer);

   public
      // AL_1
      property CdsOperCustodia : TClientDataSet  read FCdsOperCustodia write SetCdsOperCustodia;
      property DbOperCustodia  : TDbOperCustodia read FDbOperCustodia  write SetDbOperCustodia;
      property CdsHistCustodia : TClientDataSet  read FCdsHistCustodia write SetCdsHistCustodia;
      property DbHistCustodia  : TDbHistCustodia read FDbHistCustodia  write SetDbHistCustodia;

      property IdHistCustOrig: Integer read FIdHistCustOrig write SetIdHistCustOrig;
      property IdHistCustDest: Integer read FIdHistCustDest write SetIdHistCustDest;


      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      // AL_2 - Alteração de Nome
      function ListaRelHistCustodia(dDataIni, dDataFim: TdateTime;
                                    iPlanoPrev: Integer = -1;
                                    iCarteira: Integer = -1;
                                    iCustodiante: Integer = -1;
                                    iInvestimento: Integer = -1;
                                    iMotBloq: Integer = -1): OleVariant;

      // AL_2 - Alteração de Nome
      function ListaRelSaldoCustodia(dDataBase: TdateTime;
                                     iPlanoPatro: Integer = -1;
                                     iCarteira: Integer = -1;
                                     iCustodiante: Integer = -1;
                                     iInvestimento: Integer = -1;
                                     iMotBloq: Integer = -1): OleVariant;

      // AL_1
      function ListaOperCustodia(sBoleta: String = ''; dDataOperacao: TDateTime = 0;
                                 iInvestimento: Integer = -1; iCustodiante: Integer = -1;
                                 iMotBloqueio: Integer = 0): OleVariant;
      // AL_2 - Inicio
      function ListaSldOrigCustodia(dDataSaldo: TDateTime; iInvestimento: Integer;
                                    idCustodia: Integer = -1; sLote: String = ''): OleVariant;
      function ListaHistCustodia(idCustodia: Integer = 0): OleVariant;
      function ListaHistAtualizar: OleVariant;

      //AL_6
      function GravaOperCustodia(sTipoBoleta : string;
                                 iOperacao: Integer = -1;
                                 cdsOperCust: TCMClientDataSet = nil): Boolean;

      function ExcluiOperCustodia(iOperacao: Integer): Boolean;

      function GravaHistCustodia(iCarteira, iInvestimento, iCustodiante, iMotBloq, iPlanPrev: Integer;
                                 dDataMov: TdateTime; fQtdeMov: Double;
                                 sTipoMov: String;
                                 iOperacaoInvest: Integer = -1; iOperCustodia: Integer = -1; sLote: String = '';
                                 iTipoConta: Integer = 1): Boolean;
      function AtualizaSaldos: Boolean;
      function MarcaFlgHist(iCustodia: Integer = -1; iOperacaoInvest: Integer = -1; iOperCustodia: Integer = -1): Boolean;

      //AL_3
      function ListSaldosCustodia(dDataBase: TdateTime;
                                  iInvestimento: Integer = -1;
                                  iCarteira: Integer = -1;
                                  iCustodiante: Integer = -1;
                                  iMotBloq: Integer = -1): OleVariant;

      // AL_2 - Fim
   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{TCtrlCustodia}

constructor TCtrlCustodia.Create;
begin
   inherited;
   // AL_2
   FDbOperCustodia := TDbOperCustodia.Create(Self);
   FDbHistCustodia := TDbHistcustodia.Create(Self);
   // Cria e Inicializa a Control Renda Variável
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);
end;

destructor TCtrlCustodia.Destroy;
begin
   // AL_2
   FreeAndNil(FDbOperCustodia);
   FreeAndNil(FDbHistCustodia);
   FreeAndNil(CtrlRendaVariavel);
   if IsAppServer then FreeAndNil(FCdsOperCustodia);

   inherited;
end;

procedure TCtrlCustodia.OnCreateAppServer;
begin
   inherited;
   // AL_2
   FCdsOperCustodia := TClientDataSet.Create(nil);
   FCdsHistCustodia := TClientDataSet.Create(nil);
end;

procedure TCtrlCustodia.DoChangeDataBase;
begin
   inherited;
   // AL_2
   FDbOperCustodia.DataBaseName := DataBaseName;
   FDbHistCustodia.DataBaseName := DataBaseName;
end;

// AL_2
procedure TCtrlCustodia.SetCdsOperCustodia(const Value: TClientDataSet);
begin
   FCdsOperCustodia := Value;
end;

// AL_2
procedure TCtrlCustodia.SetDbOperCustodia(const Value: TDbOperCustodia);
begin
   FDbOperCustodia := Value;
end;

// AL_2
procedure TCtrlCustodia.SetCdsHistCustodia(const Value: TClientDataSet);
begin
  FCdsHistCustodia := Value;
end;

// AL_2
procedure TCtrlCustodia.SetDbHistCustodia(const Value: TDbHistCustodia);
begin
  FDbHistCustodia := Value;
end;

// AL_2
procedure TCtrlCustodia.SetIdHistCustDest(const Value: Integer);
begin
  FIdHistCustDest := Value;
end;

// AL_2
procedure TCtrlCustodia.SetIdHistCustOrig(const Value: Integer);
begin
  FIdHistCustOrig := Value;
end;

function TCtrlCustodia.ListaRelHistCustodia(dDataIni, dDataFim: TdateTime;
                                            iPlanoPrev: Integer = -1;
                                            iCarteira: Integer = -1;
                                            iCustodiante: Integer = -1;
                                            iInvestimento: Integer = -1;
                                            iMotBloq: Integer = -1): OleVariant;
var sSQL: String;
begin
   // AL_2 - Implementação das colunas CC e CCI
   sSql := 'SELECT PP.PLANPRVCONTABPATRO, CTI.DESCCARTINVEST, CUT.SGLCUSTODIANTE, INV.DESCINVESTIMENTO, ' + #13 +
           '       MOT.SIGLAMOTBLOQ || '' - '' || MOT.DESCMOTBLOQ AS DESCMOTBLOQ, ' + #13 +
           '       HIS.DATAMOVCUSTOD, ' + #13 +
           '       DECODE(HIS.TIPOCUSTODIA, ''I'', ''SALDO INICIAL'', ' + #13 +
           '              DECODE(TOP.DESCTIPOOPERACAO,NULL , ' + #13 +
           '                     DECODE(TOC.DESCTIPOOPERACAO, NULL, ''MOVIMENTAÇÃO NA CUSTODIA'', TOC.DESCTIPOOPERACAO), TOP.DESCTIPOOPERACAO)) AS DESCTIPOOPERACAO, ' + #13 +
           '       DECODE(HIS.IDMOTIVOBLOQUEIO, ' + #13 +
           '              -1, DECODE(HIS.TIPOCUSTODIA, ''C'', (NVL(HIS.SALDOLIBERADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''V'', (NVL(HIS.SALDOLIBERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''B'', (NVL(HIS.SALDOLIBERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''D'', (NVL(HIS.SALDOLIBERADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''X'', (NVL(HIS.SALDOLIBERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''Y'', (NVL(HIS.SALDOLIBERADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''Z'', (NVL(HIS.SALDOLIBERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0))), ' + #13 +
           '                  DECODE(HIS.TIPOCUSTODIA, ''C'', (NVL(HIS.SALDOBLOQUEADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''V'', (NVL(HIS.SALDOBLOQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''B'', (NVL(HIS.SALDOBLOQUEADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''D'', (NVL(HIS.SALDOBLOQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''X'', (NVL(HIS.SALDOBLOQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''Y'', (NVL(HIS.SALDOBLOQUEADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), ' + #13 +
           '                                           ''Z'', (NVL(HIS.SALDOBLOQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)))) AS SALDOANTERIOR, ' + #13 +
           '       NVL(HIS.QTDEMOVCUSTOD,0) AS QTDEMOVCUSTOD, ' + #13 +
           '       DECODE(HIS.IDMOTIVOBLOQUEIO, -1, NVL(HIS.SALDOLIBERADO,0), NVL(HIS.SALDOBLOQUEADO,0) ) AS SALDOATUAL, ' + #13 +
           '       DECODE(HIS.TIPOCUSTODIA, ''I'', ''I - Saldo Inicial'', ' + #13 +
           '                                ''C'', ''C - Compra'', ' + #13 +
           '                                ''V'', ''V - Venda'', ' + #13 +
           '                                ''B'', ''B - Bloqueio'', ' + #13 +
           '                                ''D'', ''D - Desbloqueio'', ' + #13 +
           '                                ''X'', ''X - Desbloqueia e vende'', ' + #13 +
           '                                ''Y'', ''Y - Aumenta saldo bloqueado'', ' + #13 +
           '                                ''Z'', ''Z - Diminui saldo bloqueado'') AS MOVIMENTO, ' + #13 +
           '       HIS.IDCUSTODIA, HIS.IDOPERACAOINVEST, HIS.IDCARTEIRAINVEST, HIS.IDINVESTIMENTO, ' + #13 +
           '       HIS.IDCUSTODIANTE, HIS.IDMOTIVOBLOQUEIO, HIS.TIPOCUSTODIA ' + #13 +
           ' ' + #13 +
           'FROM HISTCUSTODIA HIS, OPERACAOINVEST OPI, TIPOOPERACAO TOP, OPERCUSTODIA OPC, TIPOOPERACAO TOC, ' + #13 +
           '     MOTIVOBLOQUEIO MOT, CUSTODIANTE CUT, CARTEIRAINVEST CTI, INVESTIMENTO INV, VWPLANPREVCTBPATR PP ' + #13 +
           'WHERE HIS.DATAMOVCUSTOD BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ', ' + QuotedStr('DD/MM/YYYY') + ' ) AND' + #13 +
           '                                TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13;
   if iPlanoPrev > 0 then
      sSQL := sSQL + '  AND (HIS.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPrev) + ') ' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '  AND (HIS.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   if iCustodiante > 0 then
      sSQL := sSQL + '  AND (HIS.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ') ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '  AND (HIS.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iMotBloq <> -1 then
   begin
      if iMotBloq = -2 then
         // Todos os saldos bloqueados (Todos os motivos de bloqueio)
         sSQL := sSQL + '  AND (HIS.IDMOTIVOBLOQUEIO > 0)' + #13
      else
         sSQL := sSQL + '  AND (HIS.IDMOTIVOBLOQUEIO = ' + IntToStr(iMotBloq) + ') ' + #13;
   end;

   sSQL := sSQL + '  AND (HIS.IDOPERACAOINVEST = OPI.IDOPERACAOINVEST(+)) ' + #13 +
           '  AND (OPI.IDTIPOOPERACAO = TOP.IDTIPOOPERACAO(+)) ' + #13 +
           '  AND (HIS.IDOPERCUSTODIA = OPC.IDOPERCUSTODIA(+)) ' + #13 +
           '  AND (OPC.IDTIPOOPERACAO = TOC.IDTIPOOPERACAO(+)) ' + #13 +
//William M. Santos - Sol nº 126262 Kintana nº 661559 - INI
           '  AND (INV.IDTIPOINVEST = TOP.IDTIPOINVEST)        ' + #13 +
//William M. Santos - Sol nº 126262 Kintana nº 661559 - FIM
           '  AND (HIS.IDCUSTODIANTE  = CUT.IDCUSTODIANTE) ' + #13 +
           '  AND (HIS.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR) ' + #13 +
           '  AND (HIS.IDCARTEIRAINVEST = CTI.IDCARTEIRAINVEST) ' + #13 +
           '  AND (HIS.IDINVESTIMENTO = INV.IDINVESTIMENTO) ' + #13 +
           '  AND (HIS.IDMOTIVOBLOQUEIO = MOT.IDMOTIVOBLOQUEIO) ' + #13 +
           ' ' + #13 +
           'ORDER BY PP.PLANPRVCONTABPATRO, CTI.DESCCARTINVEST, CUT.SGLCUSTODIANTE, INV.DESCINVESTIMENTO, ' + #13 +
           '         HIS.DATAMOVCUSTOD, HIS.IDCUSTODIA ';

   CMDebugToFile(sSql, 'C:\ProjetosCM5\Investimentos\Temp\RelHistCustodia.txt');
   Result := GetDataPacket(sSql);

end;

function TCtrlCustodia.ListaRelSaldoCustodia(dDataBase: TdateTime;
                                             iPlanoPatro: Integer = -1;
                                             iCarteira: Integer = -1;
                                             iCustodiante: Integer = -1;
                                             iInvestimento: Integer = -1;
                                             iMotBloq: Integer = -1): OleVariant;
var sSQL: String;
begin
   // AL_2 - Implementação das colunas CC e CCI
   sSql := 'SELECT PP.PLANPRVCONTABPATRO, CT.SGLCUSTODIANTE AS CUSTODIANTE, IV.DESCINVESTIMENTO, ' + #13 +
           '       CA.DESCCARTINVEST, MB.DESCMOTBLOQ, ' + #13 +
           '       NVL(HC.SALDOQTDECPMF,0) AS SALDOCC, ' + #13 +
           '       DECODE(HC.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0) - NVL(HC.SALDOQTDECPMF,0), NVL(HC.SALDOBLOQUEADO,0)-NVL(HC.SALDOQTDECPMF,0)) AS SALDOCCI, ' + #13 +
           '       DECODE(HC.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0), NVL(HC.SALDOBLOQUEADO,0)) AS SALDOTOTAL, ' + #13 +
           '       HC.IDCARTEIRAINVEST, HC.IDCUSTODIANTE, HC.IDINVESTIMENTO, HC.IDLOTE, HC.IDCUSTODIA, ' + #13 +
           '       LPAD(HC.IDCARTEIRAINVEST, 2, ''0'') || LPAD(HC.IDCUSTODIANTE, 5, ''0'') || LPAD(HC.IDINVESTIMENTO, 5, ''0'') AS GRUPO ' + #13 +
           ' ' + #13 +
           'FROM HISTCUSTODIA HC, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTODIANTE CT, MOTIVOBLOQUEIO MB, ' + #13 +
           '     VWPLANPREVCTBPATR PP ' + #13 +
           ' ' + #13 +
           'WHERE HC.IDCUSTODIA IN ' + #13 +
           '         (SELECT MAX(H2.IDCUSTODIA) ' + #13 +
           '          FROM HISTCUSTODIA H2 ' + #13 +
           '          WHERE (H2.DATAMOVCUSTOD <= TO_DATE(' + QuotedStr(DateToStr(dDataBase)) + ', ' + QuotedStr('DD/MM/YYYY') + '))' + #13;
   if iPlanoPatro > 0 then
      sSQL := sSQL + '            AND (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro) + ') ' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '            AND (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '            AND (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCustodiante > 0 then
      sSQL := sSQL + '            AND (H2.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ') ' + #13;
   if iMotBloq <> -1 then
   begin
      if iMotBloq = -2 then
         // Todos os saldos bloqueados (Todos os motivos de bloqueio)
         sSQL := sSQL + '            AND (H2.IDMOTIVOBLOQUEIO > 0)' + #13
      else
         sSQL := sSQL + '            AND (H2.IDMOTIVOBLOQUEIO = ' + IntToStr(iMotBloq) + ') ' + #13;
   end;

   sSQL := sSQL + '            AND (H2.DATAMOVCUSTOD || H2.IDPLANPREVCTBPATR || H2.IDCARTEIRAINVEST || H2.IDCUSTODIANTE || H2.IDINVESTIMENTO || H2.IDMOTIVOBLOQUEIO) IN ' + #13 +
           '                     (SELECT MAX(H3.DATAMOVCUSTOD) || H3.IDPLANPREVCTBPATR || H3.IDCARTEIRAINVEST || H3.IDCUSTODIANTE || H3.IDINVESTIMENTO || H3.IDMOTIVOBLOQUEIO ' + #13 +
           '                      FROM HISTCUSTODIA H3 ' + #13 +
           '                      WHERE H3.DATAMOVCUSTOD <= TO_DATE(' + QuotedStr(DateToStr(dDataBase)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13;
   if iPlanoPatro > 0 then
      sSQL := sSQL + '                        AND (H3.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro) + ') ' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '                        AND (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '                        AND (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCustodiante > 0 then
      sSQL := sSQL + '                        AND (H3.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ') ' + #13;
   if iMotBloq <> -1 then
   begin
      if iMotBloq = -2 then
         // Todos os saldos bloqueados (Todos os motivos de bloqueio)
         sSQL := sSQL + '                        AND (H3.IDMOTIVOBLOQUEIO > 0)' + #13
      else
         sSQL := sSQL + '                        AND (H3.IDMOTIVOBLOQUEIO = ' + IntToStr(iMotBloq) + ') ' + #13;
   end;
   sSQL := sSQL + '                      GROUP BY H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST, H3.IDCUSTODIANTE, H3.IDINVESTIMENTO, H3.IDMOTIVOBLOQUEIO) ' + #13 +
           '          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDCUSTODIANTE, H2.IDINVESTIMENTO, H2.IDMOTIVOBLOQUEIO ) ' + #13 +
           '  AND (HC.IDINVESTIMENTO = IV.IDINVESTIMENTO)' + #13 +
           '  AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) ' + #13 +
           '  AND (HC.IDCUSTODIANTE = CT.IDCUSTODIANTE)' + #13 +
           '  AND (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO) ' + #13 +
           '  AND (HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)' + #13 +
           '  AND ((NVL(HC.SALDOLIBERADO,0) + NVL(HC.SALDOBLOQUEADO,0)) <> 0) ' + #13 +

           ' ' + #13 +
           'ORDER BY PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, CT.SGLCUSTODIANTE, IV.DESCINVESTIMENTO, MB.DESCMOTBLOQ';

   Result := GetDataPacket(sSql);
end;

// AL_2
function TCtrlCustodia.ListaOperCustodia(sBoleta: String = ''; dDataOperacao: TDateTime = 0;
                                         iInvestimento: Integer = -1; iCustodiante: Integer = -1;
                                         iMotBloqueio: Integer = 0): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT O.IDBOLETA, O.DATAMOVCUSTOD, ' + #13 +
           '       I.DESCINVESTIMENTO AS INVESTIMENTO, C.DESCCARTINVEST, O.QUANTIDADE, ' + #13 +
           '       CO.SGLCUSTODIANTE AS CUSTODIANTEORIG, CD.SGLCUSTODIANTE AS CUSTODIANTEDEST, ' + #13 +
           '       MO.DESCMOTBLOQ AS MOTIVOBLOQORIG, MD.DESCMOTBLOQ AS MOTIVOBLOQDEST, ' + #13 +
           '       DECODE(NVL(O.FLGTIPOCONTAORIG,0), 0, ''CONTA CORRENTE'',''CONTA INVESTIMENTO'') AS CONTAORIGEM, ' + #13 +
           '       DECODE(NVL(O.FLGTIPOCONTADEST,0), 0, ''CONTA CORRENTE'',''CONTA INVESTIMENTO'') AS CONTADESTINO, ' + #13 +
           ' ' + #13 +
           '       O.IDOPERCUSTODIA, O.IDINVESTIMENTO, O.IDCARTEIRAORIG, O.IDCARTEIRADEST, ' + #13 +
           '       O.IDCUSTODIANTEORIG, O.IDCUSTODIANTEDEST, O.IDMOTIVOBLOQORIG, O.IDMOTIVOBLOQDEST, ' + #13 +
           '       NVL(O.FLGTIPOCONTAORIG,0) AS FLGTIPOCONTAORIG, NVL(O.FLGTIPOCONTADEST,0) AS FLGTIPOCONTADEST, ' + #13 +
           '       O.IDPLANPREVCTBPATR, O.IDPLANPREVCTBDEST, O.IDLOTE, ' + #13 +
           '       O.IDHISTCARTINVORIG, O.IDHISTCARTINVDEST, O.IDCUSTODIAORIG, O.IDCUSTODIADEST, ' + #13 +
           '       O.IDTIPOINVEST, O.IDTIPOOPERACAO, O.IDTIPOOPERORIG, O.IDTIPOOPERDEST ' + #13 +
           ' ' + #13 +
           'FROM OPERCUSTODIA O, INVESTIMENTO I, CARTEIRAINVEST C, CUSTODIANTE CO, CUSTODIANTE CD, TIPOOPERACAO TP, ' + #13 +
           '     MOTIVOBLOQUEIO MO, MOTIVOBLOQUEIO MD ' + #13 +
           'WHERE O.IDCARTEIRAORIG = O.IDCARTEIRADEST ' + #13 +
           '  AND ((O.IDCUSTODIANTEORIG <> O.IDCUSTODIANTEDEST) OR ' + #13 +
           '       (O.IDMOTIVOBLOQORIG <> O.IDMOTIVOBLOQDEST) OR ' + #13 +
           '       (O.FLGTIPOCONTAORIG <> O.FLGTIPOCONTADEST) ) ' + #13 +
           '  AND (O.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) ' + #13 +
           //AL_5
           '  AND (O.IDTIPOINVEST = TP.IDTIPOINVEST) ' + #13 +
           '  AND (O.IDINVESTIMENTO = I.IDINVESTIMENTO) ' + #13 +
           '  AND (O.IDCARTEIRAORIG = C.IDCARTEIRAINVEST)' + #13 +
           '  AND (O.IDCUSTODIANTEORIG = CO.IDCUSTODIANTE)' + #13 +
           '  AND (O.IDCUSTODIANTEDEST = CD.IDCUSTODIANTE)' + #13 +
           '  AND (O.IDMOTIVOBLOQORIG = MO.IDMOTIVOBLOQUEIO)' + #13 +
           '  AND (O.IDMOTIVOBLOQDEST = MD.IDMOTIVOBLOQUEIO)';
   if Trim(sBoleta) <> '' then
      sSql := sSql + '  AND O.IDBOLETA = ' + QuotedStr(sBoleta) + ' ';
   if dDataOperacao <> 0 then
   begin
      //AL_7
      if dDataOperacao = -1 then
         dDataOperacao := 0;
      sSql := sSql + '  AND O.DATAMOVCUSTOD = TO_DATE(' + QuotedStr(DateToStr(dDataOperacao)) + ',' + QuotedStr('DD/MM/YYYY') + ') ';
   end;

   if iInvestimento > 0 then
      sSql := sSql + '  AND O.IDINVESTIMENTO = ' + IntToStr(iInvestimento);

   sSql := sSql + ' ' + #13 + 'ORDER BY O.DATAMOVCUSTOD, IDBOLETA';

   Result := GetDataPacket(sSql);
end;

// AL_2
function TCtrlCustodia.ListaSldOrigCustodia(dDataSaldo: TDateTime; iInvestimento: Integer;
                                            idCustodia: Integer = -1; sLote: String = ''): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, CT.SGLCUSTODIANTE, MB.DESCMOTBLOQ, ' + #13 +
           '       DECODE(MB.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0), NVL(HC.SALDOBLOQUEADO,0)) AS SALDOTOTAL, ' + #13 +
           '       HC.SALDOQTDECPMF AS SALDOCC, ' + #13 +
           '       DECODE(MB.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0)-NVL(HC.SALDOQTDECPMF,0), NVL(HC.SALDOBLOQUEADO,0)-NVL(HC.SALDOQTDECPMF,0)) AS SALDOCCI, ' + #13 +
           '       HC.IDCUSTODIA, HC.IDINVESTIMENTO, HC.IDCARTEIRAINVEST, HC.IDCUSTODIANTE, HC.IDMOTIVOBLOQUEIO, HC.IDPLANPREVCTBPATR, ' + #13 +
           '       NVL(HC.FLGCONTAINVEST,0) AS FLGCONTAINVEST, ' + #13 +
           '       DECODE(MB.IDMOTIVOBLOQUEIO, -1, 0, 1) AS ORDEM ' + #13 +
           ' ' + #13 +
           'FROM HISTCUSTODIA HC, CARTEIRAINVEST CA, CUSTODIANTE CT, MOTIVOBLOQUEIO MB, VWPLANPREVCTBPATR PP ' + #13 +
           ' ' + #13 +
           'WHERE HC.IDCUSTODIA IN ' + #13 +
           '         (SELECT MAX(H2.IDCUSTODIA) ' + #13 +
           '          FROM HISTCUSTODIA H2 ' + #13 +
           '          WHERE (H2.DATAMOVCUSTOD <= TO_DATE(' + QuotedStr(DateToStr(dDataSaldo)) + ', ' + QuotedStr('DD/MM/YYYY') + '))' + #13;
   if iInvestimento > 0 then sSQL := sSQL +
           '            AND (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if idCustodia > 0 then sSQL := sSQL +
           '            AND (H2.IDCUSTODIA < ' + IntToStr(idCustodia) + ') ' + #13;
   if sLote <> '' then sSQL := sSQL +
           '            AND (H2.IDLOTE = ' + QuotedStr(sLote) + ') ' + #13
   else sSQL := sSQL +
           '            AND (H2.IDLOTE IS NULL) ' + #13;
   sSQL := sSQL +
           '            AND (H2.DATAMOVCUSTOD || H2.IDPLANPREVCTBPATR || H2.IDCARTEIRAINVEST || H2.IDINVESTIMENTO || H2.IDCUSTODIANTE || H2.IDMOTIVOBLOQUEIO || H2.IDLOTE) IN' + #13 +
           '                     (SELECT MAX(H3.DATAMOVCUSTOD) || H3.IDPLANPREVCTBPATR || H3.IDCARTEIRAINVEST || H3.IDINVESTIMENTO || H3.IDCUSTODIANTE || H3.IDMOTIVOBLOQUEIO || H3.IDLOTE' + #13 +
           '                      FROM HISTCUSTODIA H3 ' + #13 +
           '                      WHERE H3.DATAMOVCUSTOD <= TO_DATE(' + QuotedStr(DateToStr(dDataSaldo)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13;
   if iInvestimento > 0 then sSQL := sSQL +
           '                        AND (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if idCustodia > 0 then sSQL := sSQL +
           '                        AND (H3.IDCUSTODIA < ' + IntToStr(idCustodia) + ') ' + #13;
   if sLote <> '' then sSQL := sSQL +
           '                        AND (H3.IDLOTE = ' + QuotedStr(sLote) + ') ' + #13
   else sSQL := sSQL +
           '                        AND (H3.IDLOTE IS NULL) ' + #13;

   sSQL := sSQL +
           '                      GROUP BY H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO, H3.IDCUSTODIANTE, H3.IDMOTIVOBLOQUEIO, H3.IDLOTE) ' + #13 +
           '          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.IDCUSTODIANTE, H2.IDMOTIVOBLOQUEIO, H2.IDLOTE ) ' + #13 +
           '  AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) ' + #13 +
           '  AND (HC.IDCUSTODIANTE = CT.IDCUSTODIANTE)' + #13 +
           '  AND (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO) ' + #13 +
           '  AND (HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR) ' + #13 +
           '  AND (((HC.IDMOTIVOBLOQUEIO = -1) AND (HC.SALDOLIBERADO > 0)) OR ' + #13 +
           '       ((HC.IDMOTIVOBLOQUEIO <> -1) AND (HC.SALDOBLOQUEADO > 0))) ' + #13 +
           ' ' + #13 +
           'ORDER BY PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, CT.SGLCUSTODIANTE, ORDEM';

   Result := GetDataPacket(sSql);
end;

// AL_2
function TCtrlCustodia.ListaHistCustodia(idCustodia: Integer = 0): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT IDCUSTODIA, IDOPERACAOINVEST, IDCARTEIRAINVEST, ' + #13 +
           '       IDINVESTIMENTO, IDCUSTODIANTE, DATAMOVCUSTOD, ' + #13 +
           '       QTDEMOVCUSTOD, SALDOLIBERADO, SALDOBLOQUEADO, ' + #13 +
           '       FLGCALCSALDO, IDLOTE, TIPOCUSTODIA, IDMOTIVOBLOQUEIO, ' + #13 +
           '       IDPLANPREVCTBPATR, IDOPERCUSTODIA, SALDOQTDECPMF, FLGCONTAINVEST ' + #13 +
           'FROM HISTCUSTODIA ';
   if idCustodia <> 0 then
      sSql := sSql + #13 + 'WHERE IDCUSTODIA = ' + IntToStr(idCustodia);
   Result := GetDataPacket(sSql);
end;

function TCtrlCustodia.ListaHistAtualizar: OleVariant;
var sSQL: String;
begin
// -------- Não carregar em um CDS somente os registros que forem ser atualizados --------------------
//          Em um cds, todos os registros que não foram carregados originalmente, em caso de update
//             são substituidos por NULL.
//          Carregar sempre todos os registros da tabela a ser editada, ou somente a chave primária
//             para carregar o DBObject e editar pelo DBObject.
// ---------------------------------------------------------------------------------------------------
   sSql := 'SELECT H.IDCUSTODIA, H.IDOPERACAOINVEST, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, ' + #13 +
           '       H.IDLOTE, H.DATAMOVCUSTOD, H. QTDEMOVCUSTOD, H.IDCUSTODIANTE, ' + #13 +
           '       H.SALDOLIBERADO, H.SALDOBLOQUEADO, H.FLGCALCSALDO, H.SALDOQTDECPMF, ' + #13 +
           '       H.FLGCONTAINVEST, H.TIPOCUSTODIA, H.IDMOTIVOBLOQUEIO, H.IDPLANPREVCTBPATR ' + #13 +
           'FROM HISTCUSTODIA H, ' + #13 +
           '     (SELECT H1.IDCUSTODIA, H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.IDLOTE, H1.DATAMOVCUSTOD, ' + #13 +
           '             H1.IDCUSTODIANTE, H1.IDMOTIVOBLOQUEIO, H1.FLGCONTAINVEST ' + #13 +
           '      FROM HISTCUSTODIA H1 ' + #13 +
           '      WHERE H1.FLGCALCSALDO = 1) M ' + #13 +
           'WHERE (H.IDCARTEIRAINVEST = M.IDCARTEIRAINVEST) ' + #13 +
           '  AND (H.IDINVESTIMENTO   = M.IDINVESTIMENTO) ' + #13 +
           '  AND (NVL(M.IDLOTE,' + QuotedStr(' ') + ') = NVL(H.IDLOTE,' + QuotedStr(' ') + ')) ' + #13 +
           '  AND ((H.DATAMOVCUSTOD > M.DATAMOVCUSTOD) OR ' + #13 +
           '       ((H.DATAMOVCUSTOD = M.DATAMOVCUSTOD) AND ' + #13 +
           '        (H.IDCUSTODIA >= M.IDCUSTODIA))) ' + #13 +
           '  AND (H.IDCUSTODIANTE = M.IDCUSTODIANTE) ' + #13 +
           '  AND (H.IDMOTIVOBLOQUEIO = M.IDMOTIVOBLOQUEIO) ' + #13 +
           'ORDER BY IDINVESTIMENTO, IDCARTEIRAINVEST, IDCUSTODIANTE, IDMOTIVOBLOQUEIO, ' + #13 +
           '      DATAMOVCUSTOD, IDCUSTODIA';
   Result := GetDataPacket(sSql);
end;

// AL_2
//AL_6
function TCtrlCustodia.GravaOperCustodia(sTipoBoleta : string;
                                         iOperacao: Integer = -1;
                                         cdsOperCust: TCMClientDataSet = nil): Boolean;
var cdsBoleta: TCMClientDataSet;
    sTipMov: String;
    iOperCustodia, iHistOrig, iHistDest, iCustOrig, iCustDest: Integer;
    bComita: Boolean;
    //AL_7
    sBoleta : string;
begin
   if ConnectionSide = cnsClient then
   begin
      //AL_6
      Result := Connection.AppServer.GravaOperCustodia(sTipoBoleta, iOperacao);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         // Cria os Cds das tabelas a serem alimantadas na operação
         cdsBoleta := TCMClientDataSet.Create(nil);

         // ---------  Caso seja passado um Cds para inclusão, preenche a property e o iOperacao
         if iOperacao = -1 then
         begin
            if cdsOperCust = nil then
            begin
               MessageInfo := 'Não existe operação a ser gravada.';
               Result := False;
               Exit;
            end;
            // Obs.: Esta parte ainda não foi testada
            FCdsOperCustodia := cdsOperCust;
            iOperacao := FCdsOperCustodia.FieldByName('IDOPERCUSTODIA').AsInteger;
         end;

         try // Except

            // ---------  Se não existe uma transação aberta, abre uma
            if not InTransaction then
            begin
               bComita := True;
               StartTransaction;
            end
            else
               bComita := False;

            // ---------  Seleciona a Operacao
            FCdsOperCustodia.Locate('IDOPERCUSTODIA', iOperacao, []);

            // ---------  Grava a Boleta
            CtrlRendaVariavel.CdsBoleta := cdsBoleta;
            // Seleciona a boleta da operação, se já existe ela é alterada

            //AL_7 Ini
            if FCdsOperCustodia.FieldByName('IDBOLETA').AsString = '' then
               sBoleta := 'RV-'+ Copy(DateToStr(FCdsOperCustodia.FieldByName('DATAMOVCUSTOD').AsDateTime),9,2)+'/'+FormatFloat('0000',
                                  LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(FCdsOperCustodia.FieldByName('DATAMOVCUSTOD').AsDateTime),9,2)))
            else
               sBoleta := FCdsOperCustodia.FieldByName('IDBOLETA').AsString;

            cdsBoleta.Data := CtrlRendaVariavel.ListBoleta(sBoleta);
            if cdsBoleta.IsEmpty then
               cdsBoleta.Insert
            else
               cdsBoleta.Edit;

            cdsBoleta.FieldByName('IDBOLETA').AsString := sBoleta;
            //AL_7 Fim

            cdsBoleta.FieldByName('STATUS').AsString := 'F';
            //AL_6
            cdsBoleta.FieldByName('TIPMOVBOLETA').AsString := sTipoBoleta;
            cdsBoleta.FieldByName('DATABOLETA').AsDateTime := FCdsOperCustodia.FieldByName('DATAMOVCUSTOD').AsDateTime;
            cdsBoleta.Post;
            //AL_3
            CtrlRendaVariavel.AplicaAtualBoleta;

            // ---------  Grava a OperCustodia
            iOperCustodia := FCdsOperCustodia.FieldByName('IDOPERCUSTODIA').AsInteger;
            //AL_5 - Capta ID do Histórico de Custódia
            iHistOrig := FCdsOperCustodia.FieldByName('IDCUSTODIAORIG').AsInteger;
            iHistDest := FCdsOperCustodia.FieldByName('IDCUSTODIADEST').AsInteger;
            // Limpa Histórico de Custódia da Operação
            FCdsOperCustodia.Edit;
            FCdsOperCustodia.FieldByName('IDCUSTODIAORIG').AsFloat := 0;
            FCdsOperCustodia.FieldByName('IDCUSTODIADEST').AsFloat := 0;
            //AL_7
            FCdsOperCustodia.FieldByName('IDBOLETA').AsString := sBoleta;
            FCdsOperCustodia.Post;

            Result := ApplyCds(FCdsOperCustodia,DbOperCustodia,[],[]);
            if not Result then
               Raise Exception.Create(DbOperCustodia.MessageInfo);
            // Posiciona o cds na operação recém incluída
            //AL_7
            if iOperCustodia = 0 then
               iOperCustodia := DbOperCustodia.Idopercustodia.AsInteger;

            FCdsOperCustodia.Locate('IDOPERCUSTODIA', iOperCustodia, []);

            // ---------  Apaga HistCustodia anteriores no caso de alteração
            // Verifica se existe o histórico de origem
            if iHistOrig <> 0 then
            begin
               // Carrega da tabela para o DBObject
               FDbHistCustodia.Idcustodia.AsInteger := iHistOrig;
               FDbHistCustodia.LoadFromDb;
               if not FDbHistCustodia.Delete then
                  Raise Exception.Create('Não foi possível excluir o histórico origem' + #13 +
                                         DbHistCustodia.MessageInfo);
            end;

            // Verifica se existe o histórico de destino
            if iHistDest <> 0 then
            begin
               // Carrega da tabela para o DBObject
               FDbHistCustodia.Idcustodia.AsInteger := iHistDest;
               FDbHistCustodia.LoadFromDb;
               if not FDbHistCustodia.Delete then
                  Raise Exception.Create('Não foi possível excluir o histórico destino' + #13 +
                                         DbHistCustodia.MessageInfo);
            end;

            // ---------  Grava HistCustodia
            // Grava o histórico de Origem
            //AL_7
            if (sTipoBoleta <> 'INI')  then // Tratar DEPOIS os demais tipos de Boleta que não geram destino
            begin
               if FCdsOperCustodia.FieldByName('IDMOTIVOBLOQORIG').AsInteger = -1 then
                  sTipMov := 'V'
               else
                  sTipMov := 'Z';
               //AL_5
               if not GravaHistCustodia(FCdsOperCustodia.FieldByName('IDCARTEIRAORIG').AsInteger,
                                        FCdsOperCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                        FCdsOperCustodia.FieldByName('IDCUSTODIANTEORIG').AsInteger,
                                        FCdsOperCustodia.FieldByName('IDMOTIVOBLOQORIG').AsInteger,
                                        FCdsOperCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        FCdsOperCustodia.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                        FCdsOperCustodia.FieldByName('QUANTIDADE').AsFloat,
                                        sTipMov, -1, iOperCustodia , '',
                                        FCdsOperCustodia.FieldByName('FLGTIPOCONTAORIG').AsInteger) then
                  Raise Exception.Create('Não foi possível gravar o histórico de origem');

               iHistOrig := IdHistCustOrig;
            end;

            // Grava o histórico de Destino
            if FCdsOperCustodia.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
               sTipMov := 'C'
            else
               sTipMov := 'Y';

            //AL_5
            if not GravaHistCustodia(FCdsOperCustodia.FieldByName('IDCARTEIRADEST').AsInteger,
                                     FCdsOperCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                     FCdsOperCustodia.FieldByName('IDCUSTODIANTEDEST').AsInteger,
                                     FCdsOperCustodia.FieldByName('IDMOTIVOBLOQDEST').AsInteger,
                                     FCdsOperCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                     FCdsOperCustodia.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                     FCdsOperCustodia.FieldByName('QUANTIDADE').AsFloat,
                                     sTipMov, -1, iOperCustodia, '',
                                     FCdsOperCustodia.FieldByName('FLGTIPOCONTADEST').AsInteger,) then
               Raise Exception.Create('Não foi possível gravar o histórico de destino');

            iHistDest := IdHistCustOrig;

            // ---------  Atualiza Saldos
            if not AtualizaSaldos then
               Raise Exception.Create(MessageInfo);

            // ---------  Atualiza IDCustodia Origem e Destino na OperCustodia
            FDbOperCustodia.Idopercustodia.AsInteger := iOperCustodia;
            FDbOperCustodia.LoadFromDb;
            FDbOperCustodia.Idcustodiaorig.AsFloat := iHistOrig;
            FDbOperCustodia.Idcustodiadest.AsFloat := iHistDest;
            FDbOperCustodia.Update;
            // Só comita se a transação foi aberta aqui
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
         FreeAndNil(cdsBoleta);
      end;
   end;
end;

// AL_2
function TCtrlCustodia.ExcluiOperCustodia(iOperacao: Integer): Boolean;
var iHistOrig, iHistDest: Integer;
    bComit: Boolean;
    //AL_7
    iHistCartOrig, iHistCartDest: Integer;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ExcluiOperCustodia(iOperacao);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          try
             Result := False;
             if not InTransaction then
             begin
                StartTransaction;
                bComit := True;
             end
             else bComit := False;

             // ------   Marca FLG para atualizar
             if not MarcaFlgHist(-1,-1, iOperacao) then
                Raise Exception.Create('Marcando registros para recalculo. ' + #13 + MessageInfo);

             // ------   Busca a Operação
             DbOperCustodia.Idopercustodia.AsInteger := iOperacao;
             DbOperCustodia.LoadFromDb;

             // ------   Capta os Históricos Origem e Destino da operação
             iHistOrig := DbOperCustodia.Idcustodiaorig.AsInteger;
             iHistDest := DbOperCustodia.Idcustodiadest.AsInteger;
             //AL_7
             iHistCartOrig := DbOperCustodia.IdHistCartinvdest.AsInteger;
             iHistCartDest := DbOperCustodia.IdHistCartinvorig.AsInteger;

             // ------   Limpa os Históricos Origem e Destino da operação
             DbOperCustodia.Idcustodiaorig.Clear;
             DbOperCustodia.Idcustodiadest.Clear;
             //AL_7
             DbOperCustodia.IdHistCartinvDest.Clear;
             DbOperCustodia.IdHistCartinvOrig.Clear;

             if not DbOperCustodia.Update then
                Raise Exception.Create('Limpando históricos da operação. ' + #13 + DbOperCustodia.MessageInfo);

             //AL_7
             // ------   Exclui históricos de Origem e Destino da HistCartinv
             CtrlRendaVariavel.DbHistCartinv.IdHistCartinv.AsInteger := iHistCartOrig;
             CtrlRendaVariavel.DbHistCartinv.LoadFromDb;
             if not CtrlRendaVariavel.DbHistCartinv.Delete then
                Raise Exception.Create('Excluíndo histórico origem. ' + #13 + CtrlRendaVariavel.DbHistCartinv.MessageInfo);

             CtrlRendaVariavel.DbHistCartinv.IdHistCartinv.AsInteger := iHistCartDest;
             CtrlRendaVariavel.DbHistCartinv.LoadFromDb;
             if not CtrlRendaVariavel.DbHistCartinv.Delete then
                Raise Exception.Create('Excluíndo histórico destino. ' + #13 + CtrlRendaVariavel.DbHistCartinv.MessageInfo);

             // ------   Exclui históricos de Origem e Destino
             FDbHistCustodia.Idcustodia.AsInteger := iHistOrig;
             FDbHistCustodia.LoadFromDb;
             if not FDbHistCustodia.Delete then
                Raise Exception.Create('Excluíndo histórico origem. ' + #13 + FDbHistCustodia.MessageInfo);

             FDbHistCustodia.Idcustodia.AsInteger := iHistDest;
             FDbHistCustodia.LoadFromDb;
             if not FDbHistCustodia.Delete then
                Raise Exception.Create('Excluíndo histórico destino. ' + #13 + FDbHistCustodia.MessageInfo);

             // --------- Exclui a OperCustodia
             if not DbOperCustodia.Delete then
                Raise Exception.Create('Excluindo a operação. ' + #13 + DbOperCustodia.MessageInfo);

             // ------   Exclui a Boleta
             CtrlRendaVariavel.DbBoleta.Idboleta.AsString := DbOperCustodia.Idboleta.AsString;
             CtrlRendaVariavel.DbBoleta.LoadFromDb;
             if not CtrlRendaVariavel.DbBoleta.Delete then
                Raise Exception.Create('Excluíndo a boleta. ' + #13 + CtrlRendaVariavel.MessageInfo);

             // ---------  Atualiza Saldos
             if not AtualizaSaldos then
                Raise Exception.Create('Atualizando saldos. ' + #13 + MessageInfo);

             if bComit then
                Commit;
             Result := True;
          except
             on E:Exception do
             begin
                Result := False;
                if bComit then
                   Rollback;
                MessageInfo := E.Message;
             end;
          end;
       finally
          DbOperCustodia.Clear;
          FDbHistCustodia.Clear;
          CtrlRendaVariavel.DbBoleta.Clear;
       end;
    end;
end;

// AL_2
//-------------------------------------------------------------------------------------------
// Função que Insere Registro no HistCustodia
//    Tipo de Movimento - I - Inicialização
//                        C - Compra
//                        V - Venda
//                        B - Bloqueia
//                        D - Desbloqueio
//                        X - Desbloqueia e Vende
//                        Y - Aumenta Saldo Bloqueado
//                        Z - Diminui Saldo Bloqueado
//-------------------------------------------------------------------------------------------
function TCtrlCustodia.GravaHistCustodia(iCarteira, iInvestimento, iCustodiante, iMotBloq, iPlanPrev: Integer;
                                         dDataMov: TdateTime; fQtdeMov: Double;
                                         sTipoMov: String;
                                         iOperacaoInvest: Integer = -1; iOperCustodia: Integer = -1; sLote: String = '';
                                         iTipoConta: Integer = 1): Boolean;
var bTransacao: Boolean;
    sTpMovOrig, sTpMovDest: String;
    iMotBolqOrig, iMotBloqDest: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaHistCustodia(iCarteira, iInvestimento, iCustodiante, iMotBloq, iPlanPrev,
                                                       dDataMov, fQtdeMov, iTipoConta, sTipoMov, iOperacaoInvest, iOperCustodia, sLote);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         try // Except
            bTransacao := False;
            if not InTransaction then
            begin
               bTransacao := True;
               StartTransaction;
            end;

            //AL_5 - Usa sempre CCI, para utilizar sempre os campos antigos de saldo SALDOLIBERADO, SALDOBLOQUEADO e
            iTipoConta := 1;

            // --------- Gravando as Operações
            if (sTipoMov <> 'B') and (sTipoMov <> 'D') then
            begin
               FDbHistCustodia.Clear;
               FDbHistCustodia.Idcarteirainvest.AsInteger := iCarteira;
               FDbHistCustodia.Idinvestimento.AsInteger := iInvestimento;
               FDbHistCustodia.Idcustodiante.AsInteger := iCustodiante;
               FDbHistCustodia.Datamovcustod.AsDateTime := dDataMov;
               FDbHistCustodia.Qtdemovcustod.AsFloat := fQtdeMov;
               FDbHistCustodia.Saldoliberado.AsFloat := 0;
               FDbHistCustodia.Saldobloqueado.AsFloat := 0;
               FDbHistCustodia.Flgcalcsaldo.AsString := '1';
               FDbHistCustodia.Tipocustodia.AsString := sTipoMov;
               FDbHistCustodia.Idmotivobloqueio.AsInteger := iMotBloq;
               FDbHistCustodia.Idplanprevctbpatr.AsInteger := iPlanPrev;
               FDbHistCustodia.Flgcontainvest.AsInteger := iTipoConta;
               if iOperacaoInvest > 0 then
                  FDbHistCustodia.Idoperacaoinvest.AsInteger := iOperacaoInvest;
               if iOperCustodia > 0 then
                  FDbHistCustodia.Idopercustodia.AsInteger := iOperCustodia;
               if sLote <> '' then
                  FDbHistCustodia.Idlote.AsString := sLote;

               // Aplica a alteração na Tabela
               if not FDbHistCustodia.Insert then
                  Raise Exception.Create(FDbHistCustodia.MessageInfo)
               else
               begin
                  // Seta a propriedade de Histórico Origem
                  IdHistCustOrig := FDbHistCustodia.Idcustodia.AsInteger;
                  IdHistCustDest := 0;
               end;
            end
            else
            begin
               if sTipoMov = 'B' then
               begin // Bloqueia - Diminui Saldo Liberado, Aumenta Saldo Bloqueado
                  sTpMovOrig   := 'V';
                  iMotBolqOrig := -1;
                  sTpMovDest   := 'Y';
                  iMotBloqDest := iMotBloq;
               end
               else
               begin // Desbloqueia - Diminui Saldo Bloqueado, Aumenta Saldo Liberado
                  sTpMovOrig   := 'Z';
                  iMotBolqOrig := iMotBloq;
                  sTpMovDest   := 'C';
                  iMotBloqDest := -1;
               end;
               // Dimiui Saldo na Origem
               FDbHistCustodia.Clear;
               FDbHistCustodia.Idcarteirainvest.AsInteger := iCarteira;
               FDbHistCustodia.Idinvestimento.AsInteger := iInvestimento;
               FDbHistCustodia.Idcustodiante.AsInteger := iCustodiante;
               FDbHistCustodia.Datamovcustod.AsDateTime := dDataMov;
               FDbHistCustodia.Qtdemovcustod.AsFloat := fQtdeMov;
               FDbHistCustodia.Saldoliberado.AsFloat := 0;
               FDbHistCustodia.Saldobloqueado.AsFloat := 0;
               FDbHistCustodia.Flgcalcsaldo.AsString := '1';
               FDbHistCustodia.Tipocustodia.AsString := sTpMovOrig;
               FDbHistCustodia.Idmotivobloqueio.AsInteger := iMotBolqOrig;
               FDbHistCustodia.Idplanprevctbpatr.AsInteger := iPlanPrev;
               FDbHistCustodia.Flgcontainvest.AsInteger := iTipoConta;
               if iOperacaoInvest > 0 then
                  FDbHistCustodia.Idoperacaoinvest.AsInteger := iOperacaoInvest;
               if iOperCustodia > 0 then
                  FDbHistCustodia.Idopercustodia.AsInteger := iOperCustodia;
               if sLote <> '' then
                  FDbHistCustodia.Idlote.AsString := sLote;

               // Aplica a alteração na Tabela
               if not FDbHistCustodia.Insert then
                  Raise Exception.Create(FDbHistCustodia.MessageInfo)
               else
                  // Seta a propriedade de Histórico Origem
                  IdHistCustOrig := FDbHistCustodia.Idcustodia.AsInteger;

               // Aumenta Saldo no Destino
               FDbHistCustodia.Clear;
               FDbHistCustodia.Idcarteirainvest.AsInteger := iCarteira;
               FDbHistCustodia.Idinvestimento.AsInteger := iInvestimento;
               FDbHistCustodia.Idcustodiante.AsInteger := iCustodiante;
               FDbHistCustodia.Datamovcustod.AsDateTime := dDataMov;
               FDbHistCustodia.Qtdemovcustod.AsFloat := fQtdeMov;
               FDbHistCustodia.Saldoliberado.AsFloat := 0;
               FDbHistCustodia.Saldobloqueado.AsFloat := 0;
               FDbHistCustodia.Flgcalcsaldo.AsString := '1';
               FDbHistCustodia.Tipocustodia.AsString := sTpMovDest;
               FDbHistCustodia.Idmotivobloqueio.AsInteger := iMotBloqDest;
               FDbHistCustodia.Idplanprevctbpatr.AsInteger := iPlanPrev;
               FDbHistCustodia.Flgcontainvest.AsInteger := iTipoConta;
               if iOperacaoInvest > 0 then
                  FDbHistCustodia.Idoperacaoinvest.AsInteger := iOperacaoInvest;
               if iOperCustodia > 0 then
                  FDbHistCustodia.Idopercustodia.AsInteger := iOperCustodia;
               if sLote <> '' then
                  FDbHistCustodia.Idlote.AsString := sLote;

               // Aplica a alteração na Tabela
               if not FDbHistCustodia.Insert then
                  Raise Exception.Create(FDbHistCustodia.MessageInfo)
               else
                  // Seta a propriedade de Histórico Origem
                  IdHistCustDest := FDbHistCustodia.Idcustodia.AsInteger;
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
         FDbHistCustodia.Clear;
      end;
   end;
end;

function TCtrlCustodia.AtualizaSaldos: Boolean;
var cdsHistAtualizar: TCMClientDataSet;
    fTotLiberado, fTotBloqueado, fTotCPMF: Double;
    iTipoConta: Integer;
    bTransacao: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AtualizaSaldos;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try// Finally
         // Capta os Históricos a atualizar
         cdsHistAtualizar := TCMClientDataSet.Create(nil);
         cdsHistAtualizar.Data := ListaHistAtualizar;

         try// Except
            if not InTransaction then
            begin
               bTransacao := True;
               StartTransaction;
            end;

            iTipoConta := cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger;
            while not cdsHistAtualizar.Eof do
            begin
               // Se for o registro marcado ou mudar o tipo de conta
               if (cdsHistAtualizar.FieldByName('FLGCALCSALDO').AsString = '1') then
               begin
                  // Busca Saldo anterior
                  CtrlRendaVariavel.BuscaSaldoRV.Executa(cdsHistAtualizar.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                                         cdsHistAtualizar.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                         cdsHistAtualizar.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         cdsHistAtualizar.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         -1 {Carteira Gerencial},
                                                         9999999 {IDHistCartInv},
                                                         cdsHistAtualizar.FieldByName('IDCUSTODIANTE').AsInteger,
                                                         cdsHistAtualizar.FieldByName('IDLOTE').AsString,
                                                         cdsHistAtualizar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                                         cdsHistAtualizar.FieldByName('IDCUSTODIA').AsInteger,
                                                         cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger);
                  fTotLiberado := CtrlRendaVariavel.BuscaSaldoRV.SldQtdLibCustodia;
                  fTotBloqueado := CtrlRendaVariavel.BuscaSaldoRV.SldQtdBloqCustodia;
                  fTotCPMF := CtrlRendaVariavel.BuscaSaldoRV.SldQtdCustodiaCC;
                  iTipoConta := cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger;
               end;

               // Calcula novo saldo
               if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'I' then // Inicialização / Grupamento
               begin
                  if cdsHistAtualizar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
                     fTotLiberado  := fTotLiberado + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat
                  else
                     fTotBloqueado := fTotBloqueado + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;

                  if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                     fTotCPMF := fTotCPMF + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
               end
               else if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'C' then  // Compra
               begin
                  fTotLiberado  := fTotLiberado + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                     fTotCPMF := fTotCPMF + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
               end
               else if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'V' then  // Venda
               begin
                  fTotLiberado  := fTotLiberado - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                     fTotCPMF := fTotCPMF - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
               end
               else if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'B' then  // Bloqueio
               begin
                  if cdsHistAtualizar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
                  begin
                     fTotLiberado  := fTotLiberado - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                     if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                        fTotCPMF := fTotCPMF - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  end
                  else
                  begin
                     fTotBloqueado := fTotBloqueado + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                     if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                        fTotCPMF := fTotCPMF + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  end;
               end
               else if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'D' then  // Desbloqueio
               begin
                  if cdsHistAtualizar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
                  begin
                     fTotLiberado := fTotLiberado + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                     if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                        fTotCPMF := fTotCPMF + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  end
                  else
                  begin
                     fTotBloqueado := fTotBloqueado - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                     if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                        fTotCPMF := fTotCPMF - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  end;
               end
               else if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'X' then  // Desbloqueia e vende
               begin
                  fTotBloqueado := fTotBloqueado - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                     fTotCPMF := fTotCPMF - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
               end
               else if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'Y' then  // Aumenta Saldo Bloqueado
               begin
                  fTotBloqueado := fTotBloqueado + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                     fTotCPMF := fTotCPMF + cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
               end
               else if cdsHistAtualizar.FieldByName('TIPOCUSTODIA').AsString = 'Z' then  // Diminui Saldo Bloqueado
               begin
                  fTotBloqueado := fTotBloqueado - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
                  if cdsHistAtualizar.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                     fTotCPMF := fTotCPMF - cdsHistAtualizar.FieldByName('QTDEMOVCUSTOD').AsFloat;
               end;

               // Atualiza o saldo
               FDbHistCustodia.Idcustodia.AsInteger := cdsHistAtualizar.FieldByName('IDCUSTODIA').AsInteger;
               FDbHistCustodia.LoadFromDb;
               if cdsHistAtualizar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
                  FDbHistCustodia.Saldoliberado.AsFloat := fTotLiberado
               else
                  FDbHistCustodia.Saldobloqueado.AsFloat := fTotBloqueado;
               FDbHistCustodia.Saldoqtdecpmf.AsFloat := fTotCPMF;
               FDbHistCustodia.Flgcalcsaldo.Clear;
               if not FDbHistCustodia.Update then
                  Raise Exception.Create(DbHistCustodia.MessageInfo);

               // Atualiza o próximo registro
               cdsHistAtualizar.Next;
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
         FreeAndNil(cdsHistAtualizar);
      end;
   end;
end;

function TCtrlCustodia.MarcaFlgHist(iCustodia: Integer = -1;
                                    iOperacaoInvest: Integer = -1;
                                    iOperCustodia: Integer = -1): Boolean;
var cdsExcluidos, cdsBuscaMarca: TCMClientDataSet;
    SQL: String;
    bTransacao: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.MarcaFlgHist(iCustodia, iOperacaoInvest, iOperCustodia);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         // ---------  Cria os Cds
         cdsExcluidos := TCMClientDataSet.Create(nil);
         cdsBuscaMarca := TCMClientDataSet.Create(nil);
         Result := False;
         try
            if not InTransaction then
            begin
               bTransacao := True;
               StartTransaction;
            end;

            // ---------  Seleciona os registros que vão ser excluídos
            SQL := 'SELECT IDCUSTODIA, FLGCALCSALDO, IDCARTEIRAINVEST, IDINVESTIMENTO, ' + #13 +
                   '       IDLOTE, IDCUSTODIANTE, DATAMOVCUSTOD ' + #13 +
                   'FROM HISTCUSTODIA' + #13;
            if iOperCustodia > 0 then
               SQL := SQL + 'WHERE IDOPERCUSTODIA = ' + IntToStr(iOperCustodia)
            else
            if iOperacaoInvest > 0 then
               SQL := SQL + 'WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacaoInvest)
            else
            if iCustodia > 0 then
               SQL := SQL + 'WHERE IDCUSTODIA = ' + IntToStr(iCustodia);

            cdsExcluidos.data := GetDataPacket(SQL);

            while not cdsExcluidos.Eof do
            begin
               // ---------  Para cada Registro excluído, busca o registro sequinte
               SQL := 'SELECT IDCUSTODIA FROM HISTCUSTODIA ' + #13 +
                      'WHERE IDCARTEIRAINVEST = ' + cdsExcluidos.FieldByName('IDCARTEIRAINVEST').AsString + #13 +
                      '  AND IDINVESTIMENTO = ' + cdsExcluidos.FieldByName('IDINVESTIMENTO').AsString + #13 +
                      '  AND IDCUSTODIANTE = ' + cdsExcluidos.FieldByName('IDCUSTODIANTE').AsString;
               if cdsExcluidos.FieldByName('IDLOTE').IsNull then
                  SQL := SQL +
                      '  AND IDLOTE IS NULL'
               else
                  SQL := SQL +
                      '  AND IDLOTE = ' + cdsExcluidos.FieldByName('IDLOTE').AsString;
               SQL := SQL +
                      '  AND ((DATAMOVCUSTOD > TO_DATE(' + QuotedStr(cdsExcluidos.FieldByName('DATAMOVCUSTOD').AsString) + ')) OR ' + #13 +
                      '       ((DATAMOVCUSTOD = TO_DATE(' + QuotedStr(cdsExcluidos.FieldByName('DATAMOVCUSTOD').AsString) + ')) AND ' + #13 +
                      '        (IDCUSTODIA > ' + cdsExcluidos.FieldByName('IDCUSTODIA').AsString + ')))' + #13 +
                      'ORDER BY DATAMOVCUSTOD, IDCUSTODIA';
               cdsBuscaMarca.Data := GetDataPacket(SQL);
               if not cdsBuscaMarca.IsEmpty then
               begin
                  // ---------  Marca o registro sequinte ao excluído
                  if not ExecSQL('UPDATE HISTCUSTODIA SET FLGCALCSALDO = ''1'' WHERE IDCUSTODIA =  ' + cdsBuscaMarca.FieldByName('IDCUSTODIA').AsString) then
                     Raise Exception.Create(MessageInfo);
               end;
               cdsExcluidos.Next;
            end;

            Result := True;

            if bTransacao then
               Commit;
         except
            on E: Exception do
            begin
               Result := False;
               if bTransacao then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally
         // ---------  Destroi os Cds
         FreeAndNil(cdsExcluidos);
         FreeAndNil(cdsBuscaMarca);
      end;
   end;
end;

//AL_3
function TCtrlCustodia.ListSaldosCustodia(dDataBase: TdateTime;
                                          iInvestimento: Integer = -1;
                                          iCarteira: Integer = -1;
                                          iCustodiante: Integer = -1;
                                          iMotBloq: Integer = -1): OleVariant;
var sSQL: String;
begin
   //AL_5 - Segregação de Planos
   sSql := 'SELECT PP.PLANPRVCONTABPATRO, ' + #13 +
           '       CT.SGLCUSTODIANTE AS CUSTODIANTE, IV.DESCINVESTIMENTO, ' + #13 +
           '       (''Carteira: '' || CA.DESCCARTINVEST) AS DESCCARTINVEST, MB.DESCMOTBLOQ, ' + #13 +
           '       NVL(HC.SALDOQTDECPMF,0) AS SALDOCC, ' + #13 +
           '       DECODE(HC.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0) - NVL(HC.SALDOQTDECPMF,0), NVL(HC.SALDOBLOQUEADO,0)-NVL(HC.SALDOQTDECPMF,0)) AS SALDOCCI, ' + #13 +
           '       DECODE(HC.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0), NVL(HC.SALDOBLOQUEADO,0)) AS SALDOTOTAL, ' + #13 +
           '       HC.IDCARTEIRAINVEST, HC.IDCUSTODIANTE, HC.IDINVESTIMENTO, HC.IDLOTE, HC.IDCUSTODIA, ' + #13 +
           '       LPAD(HC.IDCARTEIRAINVEST, 2, ''0'') || LPAD(HC.IDCUSTODIANTE, 5, ''0'') || LPAD(HC.IDINVESTIMENTO, 5, ''0'') AS GRUPO ' + #13 +
           ' ' + #13 +
           'FROM HISTCUSTODIA HC, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTODIANTE CT, MOTIVOBLOQUEIO MB, ' + #13 +
           '     PESSOA PE, VWPLANPREVCTBPATR PP ' + #13 +
           ' ' + #13 +
           'WHERE HC.IDCUSTODIA IN ' + #13 +
           '         (SELECT MAX(H2.IDCUSTODIA) ' + #13 +
           '          FROM HISTCUSTODIA H2 ' + #13 +
           '          WHERE (H2.DATAMOVCUSTOD <= TO_DATE(' + QuotedStr(DateToStr(dDataBase)) + ', ' + QuotedStr('DD/MM/YYYY') + '))' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '            AND (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '            AND (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCustodiante > 0 then
      sSQL := sSQL + '            AND (H2.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ') ' + #13;
   if iMotBloq <> -1 then
   begin
      if iMotBloq = -2 then
         // Todos os saldos bloqueados (Todos os motivos de bloqueio)
         sSQL := sSQL + '            AND (H2.IDMOTIVOBLOQUEIO > 0)' + #13
      else
         sSQL := sSQL + '            AND (H2.IDMOTIVOBLOQUEIO = ' + IntToStr(iMotBloq) + ') ' + #13;
   end;

   sSQL := sSQL + '            AND (H2.DATAMOVCUSTOD || H2.IDPLANPREVCTBPATR || H2.IDCARTEIRAINVEST || H2.IDINVESTIMENTO || H2.IDCUSTODIANTE || H2.IDMOTIVOBLOQUEIO) IN' + #13 +
           '                     (SELECT MAX(H3.DATAMOVCUSTOD) || H3.IDPLANPREVCTBPATR || H3.IDCARTEIRAINVEST || H3.IDINVESTIMENTO || H3.IDCUSTODIANTE || H3.IDMOTIVOBLOQUEIO' + #13 +
           '                      FROM HISTCUSTODIA H3 ' + #13 +
           '                      WHERE H3.DATAMOVCUSTOD <= TO_DATE(' + QuotedStr(DateToStr(dDataBase)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '                        AND (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '                        AND (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCustodiante > 0 then
      sSQL := sSQL + '                        AND (H3.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ') ' + #13;
   if iMotBloq <> -1 then
   begin
      if iMotBloq = -2 then
         // Todos os saldos bloqueados (Todos os motivos de bloqueio)
         sSQL := sSQL + '                        AND (H3.IDMOTIVOBLOQUEIO > 0)' + #13
      else
         sSQL := sSQL + '                        AND (H3.IDMOTIVOBLOQUEIO = ' + IntToStr(iMotBloq) + ') ' + #13;
   end;
   sSQL := sSQL + '                      GROUP BY H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO, H3.IDCUSTODIANTE, H3.IDMOTIVOBLOQUEIO) ' + #13 +
           '          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.IDCUSTODIANTE, H2.IDMOTIVOBLOQUEIO ) ' + #13 +
           '  AND (HC.IDINVESTIMENTO = IV.IDINVESTIMENTO)' + #13 +
           '  AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) ' + #13 +
           '  AND (HC.IDCUSTODIANTE = CT.IDCUSTODIANTE)' + #13 +
           '  AND (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO) ' + #13 +
           '  AND (HC.IDCUSTODIANTE = PE.IDPESSOA)' + #13 +
           '  AND (HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)' + #13 +
           '  AND ((NVL(HC.SALDOLIBERADO,0) + NVL(HC.SALDOBLOQUEADO,0)) <> 0) ' + #13 +

           ' ' + #13 +
           'ORDER BY PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, CT.SGLCUSTODIANTE, IV.DESCINVESTIMENTO, MB.DESCMOTBLOQ';

   Result := GetDataPacket(sSql);
end;


end.
