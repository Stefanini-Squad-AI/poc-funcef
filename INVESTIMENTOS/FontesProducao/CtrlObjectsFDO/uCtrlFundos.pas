//******************************************************************************
// Data      : 06/12/2007
// Código    : AL_10
// Pendencia : 
// SOL       :
// Desc      : Implementação do "TRUNC" nas list´s que fazem join com a tabela de
//             cadastro de fundo(HISTFUNDOINVEST). Essa inclusão trata a busca
//             independente da hora.
//******************************************************************************
// Data      : 16/02/2007
// Codigo    : AL_9
// Pendência : 24475
// Sol       :
// Motivo    : Implementação da lista da consulta da boleta de operação de Fundos
//             ListConsBoleta( ...
//******************************************************************************
// Data      : 14/02/2007
// Código    : AL_8
// Pendencia : 22229
// SOL       : 42585
// Desc      : Implementação de Controls para gravação da Amortização Bloqueada
//******************************************************************************
// Data      : 23/01/2007
// Código    : AL_7
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************
// Data      : 17/01/2007
// Código    : AL_6
// Pendencia : 22229
// SOL       :
// Motivo    : Implementação da consulta de Fundos pela FUNDOINVEST e da consulta
//             de Amortizações Recebidas
//******************************************************************************
// Data      : 18/05/2006
// Código    : AL_5
// Pendencia :
// SOL       :
// Motivo    : Implementação do Fundo
//******************************************************************************
// Data      : 17/05/2006
// Código    : AL_4
// Pendencia :
// SOL       :
// Motivo    : Implementação do Risco de Fundo
//******************************************************************************
// Data      : 17/05/2006
// Código    : AL_3
// Pendencia :
// SOL       :
// Motivo    : Acerto na rotina ListClassifAnbid, essa so identificava se havia cadastro para
//             a data de vigencia passada.
//******************************************************************************
// Data      : 12/05/2006
// Código    : AL_2
// Pendencia :
// SOL       :
// Motivo    : Implementação da funcionalidade ListTipoFundoInvest
//*****************************************************************************
//Data	     : 26/01/2006
//Código     : Al_1
//Motivo(S)  : Implementação da uDbClassifanbid e suas funções
//*****************************************************************************

unit uCtrlFundos;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     //AL_1
     uDbClassifAnbid,
     //AL_4
     uDbRiscoFundoInvest,
     //Al_5
     uDbFundoInvest,
     //AL_7
     UFuncoesInvest, uDbPedidofundo,
     //AL_8
     uDbOperacaofundo
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlFundos = Class(TCmControlObject)
   private
      //AL_1
      FCdsClassifAnbid    : TClientDataSet;
      FDbClassifAnbid     : TDbClassifAnbid;

      //AL_4
      FCdsRiscoFundo      : TClientDataSet;
      FDbRiscoFundo       : TDbRiscoFundoInvest;

      //AL_5
      FCdsFundoInvest     : TClientDataSet;
      FDbFundoInvest      : TDbFundoInvest;

      //AL_7
      FCdsPedidoFundo     : TClientDataSet;
      FDbPedidoFundo      : TDbPedidoFundo;
      FIdPedidoFundo      : Integer;

      //AL_8
      FCdsOperacaoFundo: TClientDataSet;
      FDbOperacaoFundo: TDbOperacaofundo;
      FIdOperacaoFundo: Integer;

      //AL_1
      procedure SetCdsClassifAnbid(const Value: TClientDataSet);
      procedure SetDbClassifAnbid(const Value: TDbClassifAnbid);

      //AL_4
      procedure SetCdsRiscoFundo(const Value: TClientDataSet);
      procedure SetDbRiscoFundo(const Value: TDbRiscoFundoInvest);

      //AL_5
      procedure SetCdsFundoInvest(const Value: TClientDataSet);
      procedure SetDbFundoInvest(const Value: TDbFundoInvest);
      //AL_7
      procedure SetCdsPedidoFundo(const Value: TClientDataSet);
      procedure SetDbPedidoFundo(const Value: TDbPedidoFundo);
      procedure SetIdPedidoFundo(const Value: Integer);
      //AL_8
      procedure SetCdsOperacaoFundo(const Value: TClientDataSet);
      procedure SetDbOperacaoFundo(const Value: TDbOperacaofundo);
      procedure SetIdOperacaoFundo(const Value: Integer);

   public
      //AL_1
      property CdsClassifAnbid : TClientDataSet read  FCdsClassifAnbid write SetCdsClassifAnbid;
      property DbClassifAnbid  : TDbClassifAnbid read FDbClassifAnbid write SetDbClassifAnbid;

      //AL_4
      property CdsRiscoFundo : TClientDataSet read  FCdsRiscoFundo write SetCdsRiscoFundo;
      property DbRiscoFundo  : TDbRiscoFundoInvest read FDbRiscoFundo write SetDbRiscoFundo;

      //AL_7
      property CdsPedidoFundo : TClientDataSet read FCdsPedidoFundo write SetCdsPedidoFundo;
      property DbPedidoFundo  : TDbPedidoFundo read FDbPedidoFundo write SetDbPedidoFundo;
      property IdPedidoFundo  : Integer read FIdPedidoFundo write SetIdPedidoFundo;

      //AL_8
      Property CdsOperacaoFundo: TClientDataSet read FCdsOperacaoFundo write SetCdsOperacaoFundo;
      Property DbOperacaoFundo: TDbOperacaofundo read FDbOperacaoFundo write SetDbOperacaoFundo;
      property IdOperacaoFundo: Integer read FIdOperacaoFundo write SetIdOperacaoFundo;

      //AL_5
      //property CdsRiscoFundo : TClientDataSet read  FCdsRiscoFundo write SetCdsRiscoFundo;
      //property DbRiscoFundo  : TDbRiscoFundoInvest read FDbRiscoFundo write SetDbRiscoFundo;

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      //Al_2
      function ListTipoFundoInvest(iIdTipoInvest : Integer = -1; iIdTipoFundoInvest : Integer = -1): OleVariant;

      //Al_3
      //AL_1
      function ListClassifAnbid(dDtVigencia : TDateTime;
                                sCodClassifAnbid : String = ''): OleVariant;

      function AplicaAtualClassifAnbid: Boolean;

      //AL_4
      function ListRiscoFundo(iIdRisco : Integer = -1; sSigla : String = ''; iTipoBusca : Integer = 0) : OleVariant;

      //AL_4
      function GravaRiscoFundo : Boolean;

      //AL_6
      function ListFundoInvest(iIdTipoInvest  : Integer = -1; iIdTipoFundoInvest : Integer = -1;
                               iIdFundoInvest : Integer = -1): OleVariant;

      //AL_6
      function ListConsAmortRec(dDataIni : String = '';
                                dDataFim : String = '';
                                iIdTipoInvest      : Integer = -1;
                                iIdTipoFundoInvest : Integer = -1;
                                iIdFundoInvest     : Integer = -1;
                                iIdPlanoPrev       : Integer = -1;
                                iIdTipoOper        : Integer = 0): OleVariant;

      //AL_7
      function ListPedidoFundo(iIdPedidoFundo : Integer = -1;
                               dDataPedido : TDateTime = 0): OleVariant;

      //AL_7
      function ListOperBloqueioFundo(iIdTipoInvest : Integer;
                                     sNaturMov : string): OleVariant;

      //AL_7
      function GravaPedidoFundo: Boolean;

      //AL_7
      function ListCotaFundo(iIdFundoInvet : Integer;
                             dDataCota : TDateTime;
                             iTipoCota : Integer = -1): OleVariant;

      //AL_7
      function ListHistFundoInvest(dDataRef : TDateTime;
                                   iIdTipoInvest  : Integer = -1;
                                   iIdFundoInvest : Integer = -1): OleVariant;

      //AL_8
      Function AplicaAmortizacaoBloqueada: Boolean;
      function ListConsAmortBloq(dDataIni : TdateTime = -1;
                                 dDataFim : TdateTime = -1;
                                 iIdTipoInvest      : Integer = -1;
                                 iIdTipoFundoInvest : Integer = -1;
                                 iIdFundoInvest     : Integer = -1;
                                 iIdPlanoPrev       : Integer = -1): OleVariant;

      //AL_8
      function ListConsBoleta(dDataIni : String = '';
                              dDataFim : String = '';
                              iIdTipoInvest      : Integer = -1;
                              iIdTipoFundoInvest : Integer = -1;
                              iIdFundoInvest     : Integer = -1;
                              iIdPlanoPrev       : Integer = -1): OleVariant;

   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{TCtrlFundos}

constructor TCtrlFundos.Create;
begin
   inherited;
   //AL_1
   FDbClassifAnbid  := TDbClassifAnbid.Create(Self);
   //AL_4
   FDbRiscoFundo    := TDbRiscoFundoInvest.Create(Self);
   FCdsRiscoFundo   := TClientDataSet.Create(nil);
   //AL_7
   FDbPedidoFundo   := TDbPedidofundo.Create(Self);
   //AL_8
   FDbOperacaoFundo:= TDbOperacaofundo.Create(Self);;

end;

destructor TCtrlFundos.Destroy;
begin
   //AL_1
   FreeAndNil(FDbClassifAnbid);
   if IsAppServer then FreeAndNil(FCdsClassifAnbid);

   //AL_4
   FreeAndNil(FDbRiscoFundo);
   FreeAndNil(FCdsRiscoFundo);
   //AL_7
   FreeAndNil(FDbPedidoFundo);
   if IsAppServer then FreeAndNil(FCdsRiscoFundo);

   //AL_8
   FreeAndNil(FDbOperacaoFundo);
   if IsAppServer then FreeAndNil(FCdsOperacaoFundo);

   inherited;
end;

procedure TCtrlFundos.OnCreateAppServer;
begin
   inherited;
   //AL_1
   FCdsClassifAnbid   := TClientDataSet.Create(nil);
   FCdsRiscoFundo     := TClientDataSet.Create(nil);
   //AL_8
   FCdsOperacaoFundo :=  TClientDataSet.Create(nil);
end;

procedure TCtrlFundos.DoChangeDataBase;
begin
   inherited;
   FDbClassifAnbid.DataBaseName := DataBaseName;
   //AL_4
   FDbRiscoFundo.DataBaseName   := DataBaseName;
   //AL_7
   FDbPedidoFundo.DataBaseName := DataBaseName;
   //AL_8
   FDbOperacaoFundo.DataBaseName := DataBaseName;
end;

//Al_12
function TCtrlFundos.ListTipoFundoInvest(iIdTipoInvest : Integer = -1; iIdTipoFundoInvest : Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '     IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV, DATAULTFECH  ';
   sSql := sSql + 'FROM TIPOFUNDOINVEST    ';
   if iIdTipoInvest > 0 then
      sSql := sSql + 'WHERE IDTIPOINVEST = ' + IntToStr(iIdTipoInvest);
   if iIdTipoFundoInvest > 0 then
   begin
      if iIdTipoInvest > 0 then
         sSql := sSql + '  AND   '
      else
         sSql := sSql + 'WHERE   ';
      sSql := sSql + 'IDTIPOFUNDOINVEST = ' + IntToStr(iIdTipoFundoInvest);
   end;
   sSql := sSql + '  ORDER BY DESCTIPOFUNDOINV  ';
   Result := GetDataPacket(sSql);
end;

//AL_1
function TCtrlFundos.ListClassifAnbid(dDtVigencia : TDateTime; sCodClassifAnbid : String = ''): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                ';
   sSql := sSql + '     DATAVIGENCIA, IDCLASSIFANBID,                    ';
   sSql := sSql + '     CODCLASSIFANBID, DESCLASSIFANBID, CLASSIFANALIT  ';
   sSql := sSql + 'FROM CLASSIFANBID                                     ';
   sSql := sSql + 'WHERE 1 = 1                                           ';
   sSql := sSql + '   AND DATAVIGENCIA IN (SELECT MAX(DATAVIGENCIA)      ';
   sSql := sSql + '                    FROM CLASSIFANBID                 ';
   sSql := sSql + '                    WHERE DATAVIGENCIA <= TO_DATE(' + QuotedStr(DateToStr(dDtVigencia)) +',''DD/MM/YYYY'')) ';
   //Al_3
   if Trim(sCodClassifAnbid) <> '' then
      sSql := sSql + 'AND CODCLASSIFANBID = ' + QuotedStr(sCodClassifAnbid);
   sSql := sSql + 'ORDER BY CODCLASSIFANBID ';
   Result := GetDataPacket(sSql);
end;

//AL_1
procedure TCtrlFundos.SetCdsClassifAnbid(const Value: TClientDataSet);
begin
  FCdsClassifAnbid := Value;
end;

//AL_1
procedure TCtrlFundos.SetDbClassifAnbid(const Value: TDbClassifAnbid);
begin
  FDbClassifAnbid := Value;
end;

//AL_1
function TCtrlFundos.AplicaAtualClassifAnbid: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualClassifAnbid(FCdsClassifAnbid.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsClassifAnbid,FDbClassifAnbid,[],[]);
          if not Result then
           begin
              MessageInfo := FDbClassifAnbid.MessageInfo;
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


//AL_4
function TCtrlFundos.ListRiscoFundo(iIdRisco: Integer; sSigla: String; iTipoBusca: Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '     IDRISCOFUNDOINVES, SIGLARISCOFUNDO, NOMERISCOFUNDO  ';
   sSql := sSql + 'FROM RISCOFUNDOINVEST    ';
   if iIdRisco > 0 then
      sSql := sSql + 'WHERE IDRISCOFUNDOINVES  = ' + IntToStr(iIdRisco)
   else if trim(sSigla) <> '' then
   begin
      if iTipoBusca = 0 then
         sSql := sSql + ' WHERE SIGLARISCOFUNDO = ' + QuotedStr(sSigla)
      else
         sSql := sSql + ' WHERE SIGLARISCOFUNDO LIKE ' + QuotedStr(sSigla)+'%';
   end;
   sSql := sSql + '  ORDER BY NOMERISCOFUNDO ';
   Result := GetDataPacket(sSql);
end;

//AL_4
procedure TCtrlFundos.SetCdsRiscoFundo(const Value: TClientDataSet);
begin
  FCdsRiscoFundo := Value;
end;

//AL_4
procedure TCtrlFundos.SetDbRiscoFundo(const Value: TDbRiscoFundoInvest);
begin
  FDbRiscoFundo := Value;
end;

//AL_4
function TCtrlFundos.GravaRiscoFundo: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.GravaRiscoFundo(FCdsRiscoFundo.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsRiscoFundo,FDbRiscoFundo,[],[]);
          if not Result then
           begin
              MessageInfo := FDbRiscoFundo.MessageInfo;
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

procedure TCtrlFundos.SetCdsFundoInvest(const Value: TClientDataSet);
begin
  FCdsClassifAnbid := Value;
end;

procedure TCtrlFundos.SetDbFundoInvest(const Value: TDbFundoInvest);
begin

end;

//AL_6
function TCtrlFundos.ListFundoInvest(iIdTipoInvest  : Integer = -1; iIdTipoFundoInvest : Integer = -1;
                                     iIdFundoInvest : Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + 'FI.IDFUNDOINVEST, FI.DESCFUNDOINVEST, FI.IDGESTORCARTEIRA, FI.MOECODIGO, FI.IDCARTEIRAINVEST, ';
   sSql := sSql + 'FI.IDTIPOFUNDOINVEST, FI.CNPJFUNDO, FI.STAEXCLUSIVO, FI.PZOCARENCIA, FI.PZOANIVERSARIO, ';
   sSql := sSql + 'FI.PZOLIQAPLIC, FI.PZOLIQRESG, FI.QTDDECQTD, FI.QTDDECVALOR, FI.STAFUNDO, FI.PZOAMORTIZACAO, ';
   sSql := sSql + 'FI.PERCTXPERFORM, FI.PERCTXADM, FI.CODFUNCETIP, FI.STAPROVISIONAIR, FI.STAPROVISIONAIOF, ';
   sSql := sSql + 'FI.CONTRCETIP, FI.IDCATEGORIAFUNDO, FI.DATAINICIOFUNDO, FI.PZOCOTAPLIC, FI.PZOCOTRESG, ';
   sSql := sSql + 'FI.DATACOTIZACAO, FI.IDREGRA, FI.VLRCOTAINICIAL, FI.MOECORCOTA, FI.STAVERCOTA, FI.DATAINIAPLIC, ';
   sSql := sSql + 'FI.DTAVIGENCIA, FI.IDCARTEIRASPC, FI.DTAINIPROC, FI.QTDTOTINTEGRALIZA, FI.IDTIPOCOTA, ';
   sSql := sSql + 'FI.IDCLASSIFANBID, FI.IDADMFDOINVEST, FI.IDCUSTODIANTE, FI.CODANBID, FI.CODISIN, ';
   sSql := sSql + 'FI.IDRISCOFUNDOINVES ';
   sSql := sSql + 'FROM FUNDOINVEST FI, TIPOFUNDOINVEST TF ';

   if iIdTipoFundoInvest > 0 then
      sSql := sSql + 'WHERE FI.IDTIPOFUNDOINVEST = ' + IntToStr(iIdTipoFundoInvest)+' ';

   if iIdFundoInvest > 0 then
   begin
      if iIdTipoFundoInvest > 0 then
         sSql := sSql + '  AND '
      else
         sSql := sSql + 'WHERE ';
      sSql := sSql + 'IDFUNDOINVEST = ' + IntToStr(iIdFundoInvest)+' ';
   end;

   if iIdTipoInvest > 0 then
   begin
      if ((iIdTipoFundoInvest > 0) or (iIdFundoInvest > 0)) then
         sSql := sSql + '  AND '
      else
         sSql := sSql + 'WHERE ';
      sSql := sSql + 'IDTIPOINVEST = ' + IntToStr(iIdTipoInvest)+' ';
   end;

   if (iIdTipoFundoInvest > 0) or (iIdFundoInvest > 0) or (iIdTipoInvest > 0) then
      sSql := sSql + '  AND ';

   sSql := sSql + 'FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST ';
   sSql := sSql + 'ORDER BY DESCFUNDOINVEST  ';
   Result := GetDataPacket(sSql);
end;

//AL_6
function TCtrlFundos.ListConsAmortRec(dDataIni : String = '';
                                      dDataFim : String = '';
                                      iIdTipoInvest      : Integer = -1;
                                      iIdTipoFundoInvest : Integer = -1;
                                      iIdFundoInvest     : Integer = -1;
                                      iIdPlanoPrev       : Integer = -1;
                                      iIdTipoOper        : Integer = 0): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + 'TF.DESCTIPOFUNDOINV, PL.PLANPRVCONTABPATRO, FI.DESCFUNDOINVEST, TP.DESCTIPOOPERACAO, ';
   sSql := sSql + 'OP.DATAOPERACAO, OP.VLROPERACAO ';
   sSql := sSql + 'FROM OPERACAOFUNDO OP, TIPOFUNDOINVEST TF, TIPOOPERACAO TP, ';
   sSql := sSql + '   (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO ';
   sSql := sSql + '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL ';
   sSql := sSql + '    WHERE  (PA.IDPATRO = PE.IDPESSOA(+)) ';
   sSql := sSql + '       AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL, ';
   sSql := sSql + '   (SELECT DESCFUNDOINVEST, IDFUNDOINVEST, IDTIPOFUNDOINVEST ';
   sSql := sSql + '    FROM HISTFUNDOINVEST ';
   sSql := sSql + '    WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ';
   sSql := sSql + '               (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ';
   sSql := sSql + '                FROM HISTFUNDOINVEST ';
   //AL_10   
   sSql := sSql + '                WHERE (TRUNC(DTAVIGENCIA) < TO_DATE('+QuotedStr(dDataFim)+','+QuotedStr('DD/MM/YYYY')+')+1) ';
   sSql := sSql + '                GROUP BY IDFUNDOINVEST))) FI ';
   sSql := sSql + 'WHERE ';

   if iIdTipoInvest > 0 then
      sSql := sSql + '    OP.IDTIPOINVEST      = '+ IntToStr(iIdTipoInvest)+' '
   else
      sSql := sSql + '    OP.IDTIPOINVEST      > 0 ';

   if iIdPlanoPrev > 0 then
      sSql := sSql + 'AND OP.IDPLANPREVCTBPATR = '+ IntToStr(iIdPlanoPrev)+' '
   else
      sSql := sSql + 'AND OP.IDPLANPREVCTBPATR > 0 ';

   if iIdFundoInvest > 0 then
      sSql := sSql + 'AND OP.IDFUNDOINVEST = '+ IntToStr(iIdFundoInvest)+' '
   else
      sSql := sSql + 'AND OP.IDFUNDOINVEST     > 0 ';

   sSql := sSql + 'AND OP.DATAOPERACAO BETWEEN TO_DATE('+QuotedStr(dDataIni)+','+QuotedStr('DD/MM/YYYY')+') AND ';
   sSql := sSql + '                            TO_DATE('+QuotedStr(dDataFim)+','+QuotedStr('DD/MM/YYYY')+') ';

   if iIdTipoOper <> 0 then
      sSql := sSql + 'AND OP.IDTIPOOPERACAO = '+ IntToStr(iIdTipoOper)+' '
   else
      sSql := sSql + 'AND OP.IDTIPOOPERACAO IN (-43, -143) ';

   if iIdTipoFundoInvest > 0 then
      sSql := sSql + 'AND FI.IDTIPOFUNDOINVEST = ' + IntToStr(iIdTipoFundoInvest)+' ';

   sSql := sSql + 'AND OP.IDFUNDOINVEST      = FI.IDFUNDOINVEST ';
   sSql := sSql + 'AND OP.IDPLANPREVCTBPATR  = PL.IDPLANPREVCTBPATR ';
   sSql := sSql + 'AND TF.IDTIPOINVEST       = OP.IDTIPOINVEST ';
   sSql := sSql + 'AND TF.IDTIPOFUNDOINVEST  = FI.IDTIPOFUNDOINVEST ';
   sSql := sSql + 'AND TP.IDTIPOINVEST       = OP.IDTIPOINVEST ';
   sSql := sSql + 'AND TP.IDTIPOOPERACAO     = OP.IDTIPOOPERACAO ';
   sSql := sSql + 'ORDER BY TF.DESCTIPOFUNDOINV, OP.DATAOPERACAO, PL.PLANPRVCONTABPATRO, FI.DESCFUNDOINVEST ';
   Result := GetDataPacket(sSql);
end;

//AL_7
function TCtrlFundos.ListPedidoFundo(iIdPedidoFundo : Integer = -1;
                                     dDataPedido : TDateTime = 0): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   IDPEDIDOFUNDO, IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST, DATAPEDIDO, ';
   sSql := sSql + '   DATALIQUIDACAO, VLRPEDIDO, IDPLANPREVCTBPATR, DATACOTIZACAO, CODDOCUMENTO, ';
   sSql := sSql + '   NUMLANCTO, PLNCODIGO, PLANO, IDCOMPOSICAOFUNDO, STAESPECIFICADO, VLRCOTA, ';
   sSql := sSql + '   VLRCOLOCACAO, VLRTAXAS, VLRCORRETAGEM, OBSERVACAO, IDTIPOCOTA, VLRTAXAPERF, ';
   sSql := sSql + 'FROM PEDIDOFUNDO ';
   sSql := sSql + 'WHERE IDPEDIDOFUNDO ' + FuncoesInvest.IIF(iIdPedidoFundo > 0, ' = '+ IntToStr(iIdPedidoFundo), 'IS NOT NULL') + #13;
   sSql := sSql + '   AND DATAPEDIDO ' + FuncoesInvest.IIF(dDataPedido = 0, ' = '+ DateToStr(dDataPedido), ' > '+ DateToStr(dDataPedido)) + #13;
   sSql := sSql + 'ORDER BY DATAPEDIDO';
   Result := GetDataPacket(sSql);
end;

//AL_7
procedure TCtrlFundos.SetCdsPedidoFundo(const Value: TClientDataSet);
begin
  FCdsPedidoFundo := Value;
end;

//AL_7
procedure TCtrlFundos.SetDbPedidoFundo(const Value: TDbPedidoFundo);
begin
  FDbPedidoFundo := Value;
end;

//AL_7
function TCtrlFundos.GravaPedidoFundo: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.GravaPedidoFundo(FCdsPedidoFundo.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsPedidoFundo,FDbPedidoFundo,[],[]);
          if not Result then
           begin
              MessageInfo := FDbPedidoFundo.MessageInfo;
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

//AL_7
procedure TCtrlFundos.SetIdPedidoFundo(const Value: Integer);
begin
  FIdPedidoFundo := Value;
end;

//AL_7
function TCtrlFundos.ListOperBloqueioFundo(iIdTipoInvest : Integer;
                                           sNaturMov : string): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDTIPOOPERACAO, IDTIPOINVEST, DESCTIPOOPERACAO, TIPOMOVTO, NATUREZAOPERACAO ';
   sSql := sSql + 'FROM TIPOOPERACAO  ';
   sSql := sSql + 'WHERE IDTIPOINVEST NOT IN (-1,1,2,3,4,8) ';
   sSql := sSql + '   AND TIPOMOVTO = ''BLQ'' ';
   sSql := sSql + '   AND NATUREZAOPERACAO = ' + QuotedStr(sNaturMov);
   sSql := sSql + '   AND IDTIPOINVEST = '+ IntToStr(iIdTipoInvest) + ' ';
   sSql := sSql + 'ORDER BY DESCTIPOOPERACAO ';
   Result := GetDataPacket(sSql);
end;

//AL_7
function TCtrlFundos.ListCotaFundo(iIdFundoInvet : Integer;
                                   dDataCota : TDateTime;
                                   iTipoCota : Integer = -1):OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT DATACOTA, IDTIPOCOTA, VLRCOTA ';
   sSql := sSql + 'FROM COTAFUNDO ';
   sSql := sSql + 'WHERE IDFUNDOINVEST = ' + IntToStr(iIdFundoInvet);
   sSql := sSql + '   AND DATACOTA = '+ QuotedStr(DateToStr(dDataCota));
   if iTipoCota < 0 then
      sSql := sSql + ' AND IDTIPOCOTA IS NULL '
   else
      sSql := sSql + ' AND IDTIPOCOTA = ' + IntToStr(iTipoCota);
   Result := GetDataPacket(sSql);
end;

//AL_7
function TCtrlFundos.ListHistFundoInvest(dDataRef : TDateTime;
                                         iIdTipoInvest  : Integer = -1;
                                         iIdFundoInvest : Integer = -1): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCARTEIRA  , FUN.TRGDTINCLUSAO     , ';
   sSql := sSql + '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , ';
   sSql := sSql + '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERSARIO    , ';
   sSql := sSql + '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD         , FUN.QTDDECVALOR       , ';
   sSql := sSql + '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERFORM     , FUN.PERCTXADM         , ';
   sSql := sSql + '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP        , ';
   sSql := sSql + '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTAPLIC       , TFI.IDTIPOINVEST      , FUN.DTAINIPROC          ';
   sSql := sSql + 'FROM ';
   sSql := sSql + '  (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ';
   sSql := sSql + '           (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') ';
   sSql := sSql + '            FROM HISTFUNDOINVEST ';
   //AL_10   
   sSql := sSql + '            WHERE TRUNC(DTAVIGENCIA) <= TO_DATE('+ QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') ';
   sSql := sSql + '            GROUP BY IDFUNDOINVEST))) FUN,  TIPOFUNDOINVEST TFI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '   (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) ';
   sSql := sSql + '   AND (((' + IntToStr(iIdTipoInvest) + ' <> 0) AND (TFI.IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ')) OR (' + IntToStr(iIdTipoInvest) + ' = 0) ) ';
   sSql := sSql + '   AND FUN.IDFUNDOINVEST ' + FuncoesInvest.IIF(iIdFundoInvest > 0, ' = '+ IntToStr(iIdFundoInvest), 'IS NOT NULL');
   sSql := sSql + ' ORDER BY  FUN.DESCFUNDOINVEST ';

   Result := GetDataPacket(sSql);
end;

//AL_8
procedure TCtrlFundos.SetIdOperacaoFundo(const Value: Integer);
begin
  FIdOperacaoFundo := Value;
end;

//AL_8
function TCtrlFundos.AplicaAmortizacaoBloqueada: Boolean;
begin
    if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAmortizacaoBloqueada;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsOperacaoFundo,FDbOperacaoFundo,[],[]);

          //Pegando o id da operacao apply
          IdOperacaoFundo := FDbOperacaoFundo.Idoperacaofundo.AsInteger;

          if not Result then
           begin
              MessageInfo := FDbOperacaoFundo.MessageInfo;
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

//AL_8
procedure TCtrlFundos.SetCdsOperacaoFundo(const Value: TClientDataSet);
begin
  FCdsOperacaoFundo := Value;
end;

//AL_8
procedure TCtrlFundos.SetDbOperacaoFundo(const Value: TDbOperacaofundo);
begin
  FDbOperacaoFundo := Value;
end;

//AL_8
function TCtrlFundos.ListConsAmortBloq(dDataIni, dDataFim: TDateTime;
                                       iIdTipoInvest,
                                       iIdTipoFundoInvest,
                                       iIdFundoInvest,
                                       iIdPlanoPrev: Integer): OleVariant;
Var
 sSql: String;
begin
   sSql := '';
   sSql := sSql + 'SELECT '+#13;
   sSql := sSql + '   OP.IDOPERACAOFUNDO       ,TF.DESCTIPOFUNDOINV  , OP.IDFUNDOINVEST,'+#13;
   sSql := sSql + '   FI.DESCFUNDOINVEST       ,OP.DATAOPERACAO      ,OP.IDPLANPREVCTBPATR,'+#13;
   sSql := sSql + '   PATRO.PLANPRVCONTABPATRO ,FI.IDTIPOFUNDOINVEST ,OP.IDTIPOOPERACAO,'+#13;
   sSql := sSql + '   TPOP.DESCTIPOOPERACAO    ,OP.QTDOPERACAO       ,OP.VLROPERACAO,'+#13;
   sSql := sSql + '   OP.IDTIPOINVEST          ,OP.OBSERVACAO        ,FI.QTDDECQTD'+#13;
   sSql := sSql + 'FROM OPERACAOFUNDO OP, TIPOOPERACAO TPOP,VWPLANPREVCTBPATR PATRO,TIPOFUNDOINVEST TF,'+#13;
   sSql := sSql + '     HISTFUNDOINVEST FI ' + #13;
   sSql := sSql + 'WHERE (FI.IDFUNDOINVEST || TO_CHAR(FI.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'')) IN '+ #13;
   sSql := sSql + '              (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') ' +#13;
   sSql := sSql + '               FROM HISTFUNDOINVEST ' +#13;
   //AL_10   
   sSql := sSql + '               WHERE TRUNC(DTAVIGENCIA) <= OP.DATAOPERACAO '+#13;
   sSql := sSql + '               GROUP BY IDFUNDOINVEST)'+#13;
   sSql := sSql + '  AND OP.IDTIPOOPERACAO=''-171'' ' +#13;
   sSql := sSql + '  AND OP.IDTIPOINVEST=' + QuotedStr(IntToStr(iIdTipoInvest)) + #13;
   sSql := sSql + '  AND OP.IDFUNDOINVEST = FI.IDFUNDOINVEST ' +#13;
   sSql := sSql + '  AND OP.IDTIPOOPERACAO = TPOP.IDTIPOOPERACAO ' +#13 ;
   sSql := sSql + '  AND OP.IDTIPOINVEST = TPOP.IDTIPOINVEST '+#13;
   sSql := sSql + '  AND OP.IDPLANPREVCTBPATR = PATRO.IDPLANPREVCTBPATR ' +#13;
   sSql := sSql + '  AND OP.IDFUNDOINVEST = FI.IDFUNDOINVEST '+#13;
   sSql := sSql + '  AND OP.IDTIPOINVEST = TF.IDTIPOINVEST ' +#13;
   sSql := sSql + '  AND FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST'+ #13;

   if iIdTipoFundoInvest > 0 then
      sSql := sSql + '  AND FI.IDTIPOFUNDOINVEST = ' + QUOTEDSTR(INTTOSTR(iIdTipoFundoInvest))+ #13;

   if iIdPlanoPrev > 0 then
      sSql := sSql + '  AND OP.IDPLANPREVCTBPATR = ' + QUOTEDSTR(INTTOSTR(iIdPlanoPrev))+ #13;

   if iIdFundoInvest > 0 then
      sSql := sSql + '  AND OP.IDFUNDOINVEST = '+ QUOTEDSTR(INTTOSTR(iIdFundoInvest))+ #13;

   //AL_8 Ini
   If  (dDataIni > -1)  and  (dDataFim > -1) then
   begin
      sSql := sSql + '  AND OP.DATAOPERACAO BETWEEN TO_DATE('+QuotedStr(datetostr(dDataIni))+','+QuotedStr('DD/MM/YYYY')+') AND '+ #13;
      sSql := sSql + '                              TO_DATE('+QuotedStr(datetostr(dDataFim))+','+QuotedStr('DD/MM/YYYY')+') '+ #13;
   end
   else If dDataIni > -1 then
   begin
      sSql := sSql + 'AND OP.DATAOPERACAO >= TO_DATE('+QuotedStr(datetostr(dDataIni))+','+QuotedStr('DD/MM/YYYY')+')'+ #13;
   end
   else If dDataFim > -1 then
   begin
      sSql := sSql + 'AND OP.DATAOPERACAO <= TO_DATE('+QuotedStr(datetostr(dDataFim))+','+QuotedStr('DD/MM/YYYY')+')'+ #13;
   end;
   //AL_8 Fim

   Result := GetDataPacket(sSql);
end;

//AL_8
function TCtrlFundos.ListConsBoleta(dDataIni : String = ''; dDataFim : String = '';
                                    iIdTipoInvest      : Integer = -1;
                                    iIdTipoFundoInvest : Integer = -1;
                                    iIdFundoInvest     : Integer = -1;
                                    iIdPlanoPrev       : Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   TF.DESCTIPOFUNDOINV, PL.PLANPRVCONTABPATRO, FI.DESCFUNDOINVEST, TP.DESCTIPOOPERACAO, ';
   sSql := sSql + '   OP.DATAOPERACAO, OP.DATALIQUIDACAO, OP.DATAVENCIMENTO, OP.VLROPERACAO, OP.QTDOPERACAO, ';
   sSql := sSql + '   OP.VLRCOTA, OP.OBSERVACAO, OP.IDBOLETA, CT.SGLCUSTODIANTE, ';
   sSql := sSql + '  (OP.DATAVENCIMENTO-OP.DATAOPERACAO) AS PRAZO, NOME ';
   sSql := sSql + 'FROM OPERACAOFUNDO OP, TIPOFUNDOINVEST TF, TIPOOPERACAO TP, CUSTODIANTE CT, PESSOA PS,';
   sSql := sSql + '  (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO ';
   sSql := sSql + '   FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL ';
   sSql := sSql + '   WHERE  (PA.IDPATRO = PE.IDPESSOA(+)) ';
   sSql := sSql + '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL, ';
   sSql := sSql + '  (SELECT DESCFUNDOINVEST, IDFUNDOINVEST, IDTIPOFUNDOINVEST, IDCUSTODIANTE, IDGESTORCARTEIRA ';
   sSql := sSql + '   FROM HISTFUNDOINVEST ';
   sSql := sSql + '   WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ';
   sSql := sSql + '         (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ';
   sSql := sSql + '          FROM HISTFUNDOINVEST ';
   //AL_10   
   sSql := sSql + '          WHERE (TRUNC(DTAVIGENCIA) < TO_DATE('+QuotedStr(dDataFim)+','+QuotedStr('DD/MM/YYYY')+')+1) ';
   if iIdTipoFundoInvest > 0 then
      sSql := sSql + '            AND (IDTIPOFUNDOINVEST = ' + IntToStr(iIdTipoFundoInvest)+') ';
   sSql := sSql + '          GROUP BY IDFUNDOINVEST))) FI ';
   sSql := sSql + 'WHERE ';

   if iIdTipoInvest > 0 then
      sSql := sSql + '    OP.IDTIPOINVEST      = '+ IntToStr(iIdTipoInvest)+' '
   else
      sSql := sSql + '    OP.IDTIPOINVEST      > 0 ';

   if iIdPlanoPrev > 0 then
      sSql := sSql + 'AND OP.IDPLANPREVCTBPATR = '+ IntToStr(iIdPlanoPrev)+' '
   else
      sSql := sSql + 'AND OP.IDPLANPREVCTBPATR > 0 ';

   if iIdFundoInvest > 0 then
      sSql := sSql + 'AND OP.IDFUNDOINVEST = '+ IntToStr(iIdFundoInvest)+' '
   else
      sSql := sSql + 'AND OP.IDFUNDOINVEST     > 0 ';

   sSql := sSql + 'AND OP.DATAOPERACAO BETWEEN TO_DATE('+QuotedStr(dDataIni)+','+QuotedStr('DD/MM/YYYY')+') AND ';
   sSql := sSql + '                            TO_DATE('+QuotedStr(dDataFim)+','+QuotedStr('DD/MM/YYYY')+') ';

   sSql := sSql + 'AND OP.IDFUNDOINVEST      = FI.IDFUNDOINVEST ';
   sSql := sSql + 'AND OP.IDPLANPREVCTBPATR  = PL.IDPLANPREVCTBPATR ';
   sSql := sSql + 'AND TF.IDTIPOINVEST       = OP.IDTIPOINVEST ';
   sSql := sSql + 'AND TF.IDTIPOFUNDOINVEST  = FI.IDTIPOFUNDOINVEST ';
   sSql := sSql + 'AND TP.IDTIPOINVEST       = OP.IDTIPOINVEST ';
   sSql := sSql + 'AND TP.IDTIPOOPERACAO     = OP.IDTIPOOPERACAO ';
   //AL_9
   sSql := sSql + 'AND CT.IDCUSTODIANTE(+)   = FI.IDCUSTODIANTE ';
   sSql := sSql + 'AND PS.IDPESSOA(+)        = FI.IDGESTORCARTEIRA ';
   sSql := sSql + 'ORDER BY TF.DESCTIPOFUNDOINV, OP.DATAOPERACAO, PL.PLANPRVCONTABPATRO, FI.DESCFUNDOINVEST, OP.IDBOLETA ';
   Result := GetDataPacket(sSql);
end;

end.
