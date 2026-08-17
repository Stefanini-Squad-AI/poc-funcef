unit uCtrlConfDocReg;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbRelacionaNI, uCMClientDataSet
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlConfDocReg = Class(TCmControlObject)
   private
      FDbRelacionaNI  : TDbRelacionaNI;
      FCdsRelacionaNI : TCMClientDataSet;
   public
      property CdsRelacionaNI  : TCMClientDataSet read FCdsRelacionaNI  write FCdsRelacionaNI;

      constructor Create; override;
      destructor Destroy; override;

      function ListRegularizados(rCodPortador, rIDPessoa: Double; dDataInicial,
               dDataFinal: TdateTime; sMarcado: String): OleVariant;
      function ListRateioRegularizados(rCodPortador, rIDPessoa: Double; dDataInicial,
               dDataFinal: TdateTime; sMarcado: String): OleVariant;
      function ListRelacionados(rCodPortador, rIDPessoa: Double; dDataInicial,
               dDataFinal: TdateTime; sMarcado: String): OleVariant;
      function ListRateioRelacionados(rCodPortador, rIDPessoa: Double; dDataInicial,
               dDataFinal: TdateTime; sMarcado: String): OleVariant;

      function AtualizaDados: Boolean;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation


constructor TCtrlConfDocReg.Create;
begin
  inherited;
  FDbRelacionaNI:=TDbRelacionaNI.Create(Self);
end;

destructor TCtrlConfDocReg.Destroy;
begin
  FDbRelacionaNI.Free;
  if IsAppServer then FCdsRelacionaNI.Free;
  inherited;
end;

procedure TCtrlConfDocReg.DoChangeDataBase;
begin
  inherited;
  FDbRelacionaNI.DataBaseName:=DataBaseName;
end;

procedure TCtrlConfDocReg.OnCreateAppServer;
begin
  inherited;
  FCdsRelacionaNI:=TCMClientDataSet.Create(nil);
end;

function TCtrlConfDocReg.ListRegularizados(rCodPortador,rIDPessoa: Double;
                                           dDataInicial,dDataFinal: TdateTime;
                                           sMarcado: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   R.CODLANCFINANC, '+
         '   P.DESCRICAO, '+
         '   M.HISTORICO, '+
         '   M.VALORLANCFINAN, '+
         '   M.DATALANCFINAN, '+
         '   R.IDRELACIONANI, '+
         '   R.FLGMARCADO, '+
         '   R.FLGNI '+
         'FROM '+
         '   RelacionaNI R, '+
         '   MovimFinanc M, '+
         '   PortadorConta P '+
         'WHERE '+
         '   (R.CODLANCFINANC=M.CODLANCFINANC) AND '+
         '   (M.CODPORTADOR=P.CODPORTADOR) AND '+
         '   (R.FLGMARCADO = '''+sMarcado+''') AND '+
         '   (R.FLGNI=''I'') AND '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rCodPortador<>0) then
      sSql:=sSql+'   AND (M.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

   if (dDataInicial<>0) and (dDataFinal<>0) then
      sSql:=sSql+'   AND (M.DATALANCFINAN >= TO_DATE( '''+DateToStr(dDataInicial)+
                                                      ''',''dd/mm/yyyy'')) '+
                 '   AND (M.DATALANCFINAN <= TO_DATE( '''+DateToStr(dDataFinal)+
                                                      ''',''dd/mm/yyyy'')) ';

   sSql:=sSql+'ORDER BY R.IDRELACIONANI,P.DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlConfDocReg.ListRateioRegularizados(rCodPortador,rIDPessoa: Double;
                                                 dDataInicial,dDataFinal: TdateTime;
                                                 sMarcado: String): OleVariant;
var
   sSql: String;                                          
begin
   sSql:='SELECT '+
         '  P.NOME, '+
         '  R.RECPAG, '+
         '  R.VALOR, '+
         '  R.CODLANCFINANC '+
         'FROM '+
         '   PlanPrevContabil P, '+
         '   RateioFinanc R '+
         'WHERE '+
         '   (R.IDPLANOPREV=P.IDPLANOPREV(+)) AND '+
         '   (R.CODLANCFINANC IN (SELECT '+
         '                           R1.CODLANCFINANC '+
         '                        FROM '+
         '                           RelacionaNI R1, '+
         '                           MovimFinanc M1, '+
         '                           PortadorConta P1 '+
         '                        WHERE '+
         '                           (R1.CODLANCFINANC=M1.CODLANCFINANC) AND '+
         '                           (M1.CODPORTADOR=P1.CODPORTADOR) AND '+
         '                           (R1.FLGMARCADO = '''+sMarcado+''') AND '+
         '                           (R1.FLGNI=''I'') AND '+
         '                           (M1.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rCodPortador<>0) then
      sSql:=sSql+'   AND (M1.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

   if (dDataInicial<>0) and (dDataFinal<>0) then
      sSql:=sSql+'   AND (M1.DATALANCFINAN >= TO_DATE( '''+DateToStr(dDataInicial)+
                                                       ''',''dd/mm/yyyy'')) '+
                 '   AND (M1.DATALANCFINAN <= TO_DATE( '''+DateToStr(dDataFinal)+
                                                       ''',''dd/mm/yyyy'')) ';

   sSql:=sSql+')) ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlConfDocReg.ListRelacionados(rCodPortador,rIDPessoa: Double;
                                          dDataInicial,dDataFinal: TdateTime;
                                          sMarcado: String): OleVariant;
var
   sSql : String;                                           
begin
   sSql:='SELECT '+
         '   R.CODLANCFINANC, '+
         '   P.DESCRICAO, '+
         '   M.HISTORICO, '+
         '   M.VALORLANCFINAN, '+
         '   M.DATALANCFINAN, '+
         '   R.IDRELACIONANI, '+
         '   R.FLGNI '+         
         'FROM '+
         '   RelacionaNI R, '+
         '   MovimFinanc M, '+
         '   PortadorConta P '+
         'WHERE '+
         '   (R.CODLANCFINANC=M.CODLANCFINANC) AND '+
         '   (M.CODPORTADOR=P.CODPORTADOR) AND '+
         '   (R.FLGNI=''N'') AND '+
         '   (R.IDRELACIONANI  IN (SELECT '+
         '                            R1.IDRELACIONANI '+
         '                         FROM '+
         '                            RelacionaNI R1, '+
         '                            MovimFinanc M1, '+
         '                            PortadorConta P1 '+
         '                         WHERE '+
         '                            (R1.CODLANCFINANC=M1.CODLANCFINANC) AND '+
         '                            (M1.CODPORTADOR=P1.CODPORTADOR) AND '+
         '                            (R1.FLGMARCADO = '''+sMarcado+''') AND '+
         '                            (R1.FLGNI=''I'') AND '+
         '                            (M1.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rCodPortador<>0) then
      sSql:=sSql+'   AND (M1.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

   if (dDataInicial<>0) and (dDataFinal<>0) then
      sSql:=sSql+'   AND (M1.DATALANCFINAN >= TO_DATE( '''+DateToStr(dDataInicial)+
                                                       ''',''dd/mm/yyyy'')) '+
                 '   AND (M1.DATALANCFINAN <= TO_DATE( '''+DateToStr(dDataFinal)+
                                                       ''',''dd/mm/yyyy'')) ';

   sSql:=sSql+')) ';

   sSql:=sSql+'ORDER BY R.IDRELACIONANI,P.DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlConfDocReg.ListRateioRelacionados(rCodPortador,
  rIDPessoa: Double; dDataInicial, dDataFinal: TdateTime;
  sMarcado: String): OleVariant;
var
   sSql: String;                                          
begin
   sSql:='SELECT '+
         '  P.NOME, '+
         '  R.RECPAG, '+
         '  R.VALOR, '+
         '  R.CODLANCFINANC '+         
         'FROM '+
         '   PlanPrevContabil P, '+
         '   RateioFinanc R '+
         'WHERE '+
         '   (R.IDPLANOPREV=P.IDPLANOPREV(+)) AND '+
         '   (R.CODLANCFINANC IN (SELECT '+
         '                           R1.CODLANCFINANC '+
         '                        FROM '+
         '                           RelacionaNI R1, '+
         '                           MovimFinanc M1, '+
         '                           PortadorConta P1 '+
         '                        WHERE '+
         '                           (R1.CODLANCFINANC=M1.CODLANCFINANC) AND '+
         '                           (M1.CODPORTADOR=P1.CODPORTADOR) AND '+
         '                           (R1.FLGNI=''N'') AND '+
         '                           (R1.IDRELACIONANI  IN (SELECT '+
         '                                                     R2.IDRELACIONANI '+
         '                                                  FROM '+
         '                                                     RelacionaNI R2, '+
         '                                                     MovimFinanc M2, '+
         '                                                     PortadorConta P2 '+
         '                                                  WHERE '+
         '                                                     (R2.CODLANCFINANC=M2.CODLANCFINANC) AND '+
         '                                                     (M2.CODPORTADOR=P2.CODPORTADOR) AND '+
         '                                                     (R2.FLGMARCADO = '''+sMarcado+''') AND '+
         '                                                     (R2.FLGNI=''I'') AND '+
         '                                                     (M2.IDPESSOA = '+FloatToStr(rIDPessoa)+')';

   if (rCodPortador<>0) then
      sSql:=sSql+'   AND (M2.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

   if (dDataInicial<>0) and (dDataFinal<>0) then
      sSql:=sSql+'   AND (M2.DATALANCFINAN >= TO_DATE( '''+DateToStr(dDataInicial)+
                                                       ''',''dd/mm/yyyy'')) '+
                 '   AND (M2.DATALANCFINAN <= TO_DATE( '''+DateToStr(dDataFinal)+
                                                       ''',''dd/mm/yyyy'')) ';
   sSql:=sSql+')))) ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlConfDocReg.AtualizaDados: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.AtualizaDados(FCdsRelacionaNI.Data);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds(FCdsRelacionaNI,FDbRelacionaNI,[],[]);

          if not(Result) then
           begin
              MessageInfo:=FDbRelacionaNI.MessageInfo;
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

end.
