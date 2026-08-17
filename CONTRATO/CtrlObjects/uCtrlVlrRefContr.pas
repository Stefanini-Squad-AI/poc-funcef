unit uCtrlVlrRefContr;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uDbVlrRefContr, uDiasUteis
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlVlrRefContr = Class(TCmControlObject)

   private
      FDbVlrRefContr  : TDbVlrRefContr;
      FCdsVlrRefContr : TCMClientDataSet;
   public
      DiasUteis       :TDiasUteis;

      property CdsVlrRefContr: TCMClientDataSet read FCdsVlrRefContr write FCdsVlrRefContr;

      constructor Create; override;
      destructor Destroy; override;

      function ListVlrRefContr(rIdRefContr: Double; dData: TDateTime): OleVariant;
      function AplicaVlrRefContr: Boolean;
      function BuscaValorRef(rIDRefContr, rIDPessoa: Double; sFrequencia: String;
                             dData: TDateTime; var rValor: Double; var sNomeRef: String;
                             bDataEfetiva: Boolean): Boolean;
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;


implementation

{ TCtrlVlrRefContr }

constructor TCtrlVlrRefContr.Create;
begin
   inherited;
   FDbVlrRefContr:=TDbVlrRefContr.Create(Self);
   //Inicializa DiasUteis
   DiasUteis:=TDiasUteis.Create;
end;

procedure TCtrlVlrRefContr.OnCreateAppServer;
begin
   inherited;
   FCdsVlrRefContr:=TCMClientDataSet.Create(nil);
end;

destructor TCtrlVlrRefContr.Destroy;
begin
   FDbVlrRefContr.Free;
   DiasUteis.Free;
   if IsAppServer then FDbVlrRefContr.Free;
   inherited;
end;

procedure TCtrlVlrRefContr.AfterInitialize;
begin
   inherited;
   DiasUteis.InitializeAs(Self);
end;

procedure TCtrlVlrRefContr.DoChangeDataBase;
begin
   inherited;
   FDbVlrRefContr.DataBaseName:=DataBaseName;
end;

function TCtrlVlrRefContr.ListVlrRefContr(rIdRefContr: Double;
  dData: TDateTime): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT * FROM VLRREFCONTR WHERE (IDREFCONTR = '+FloatToStr(rIdRefContr)+') ';
   if (dData<>0) then
      sSql:=sSql+' AND (DATA = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dData)+''',''dd/mm/yyyy''))';
   Result:=GetDataPacket(sSql);
end;

function TCtrlVlrRefContr.BuscaValorRef(rIDRefContr, rIDPessoa: Double; sFrequencia: String;
                             dData: TDateTime; var rValor: Double; var sNomeRef: String;
                             bDataEfetiva: Boolean): Boolean;
var
   sSql: String;
begin
   MessageInfo:='';
   Result:=True;
   sSql:='SELECT V.IDREFCONTR, R.NOME, Sum(V.VALOR) AS VLRTOTAL '+
         'FROM REFERENCIACONTR R, VLRREFCONTR V '+
         'WHERE (R.IDREFCONTR = V.IDREFCONTR) AND '+
         '      (R.IDREFCONTR = '+FloatToStr(rIDRefContr)+') ';

   if (sFrequencia='D') then
       sSql:=sSql+'      AND (V.DATA = TO_DATE('''+
             FormatDateTime('dd/mm/yyyy',dData)+''',''dd/mm/yyyy'')) ';

   if (sFrequencia='M') then
       sSql:=sSql+'      AND (TO_CHAR(V.DATA,''mm'') = '''+FormatDateTime('mm',dData)+''') ';

   if (sFrequencia='A') then
       sSql:=sSql+'      AND (TO_CHAR(V.DATA,''yyyy'') = '''+FormatDateTime('yyyy',dData)+''') ';

   sSql:=sSql+'GROUP BY V.IDREFCONTR,R.NOME ';

   with TCMClientDataSet.Create(nil) do
   try
      rValor:=0;
      sNomeRef:='';

      Data:=GetDataPacket(sSql);
      Result:=not(IsEmpty);

      if not(Result) then
       begin
          Close;
          sSql:='SELECT R.NOME, R.FLGSABADOS, R.FLGDOMINGOS, R.FLGFERIADOS '+
                'FROM REFERENCIACONTR R '+
                'WHERE (R.IDREFCONTR = '+FloatToStr(rIDRefContr)+') ';
          Data:=GetDataPacket(sSql);
          sNomeRef:=FieldByName('NOME').AsString;

          if not(bDataEfetiva) and
             (( (DayOfWeek(dData)=1) and (FieldByName('FLGDOMINGOS').AsString='N') ) or
              ( (DayOfWeek(dData)=7) and (FieldByName('FLGSABADOS').AsString='N') ) or
              (  DiasUteis.Feriado(Trunc(rIDPessoa),dData,True,True)  and
                (FieldByName('FLGFERIADOS').AsString='N') )) then Result:=True;
       end
      else
       begin
          rValor:=FieldByName('VLRTOTAL').AsFloat;
          sNomeRef:=FieldByName('NOME').AsString;
       end;
   finally
      Free;
   end;
end;

function TCtrlVlrRefContr.AplicaVlrRefContr: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaVlrRefContr(FCdsVlrRefContr.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsVlrRefContr,FDbVlrRefContr,[],[]);
          if not Result then
           begin
              MessageInfo := FDbVlrRefContr.MessageInfo;
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
