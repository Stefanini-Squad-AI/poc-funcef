unit uCtrlFormaCalcImob;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
     uDBFormaCalcImob, uDbFormacalcimobxitem;

Type
  TCtrlFormaCalcImob = class(TCmControlObject)
  private
    FDBFormaCalcImob: TDbFormacalcimob;
    FCdsFormaCalcImob: TCMClientDataSet;
    FDbFormacalcimobxitem: TDbFormacalcimobxitem;
    FCdsItemFormaCalc: TCMClientDataSet;

    procedure SetDBFormaCalcImob     (const Value : TDbFormacalcimob);
    procedure SetCdsFormaCalcImob    (const Value : TCMClientDataSet);
    procedure SetDbFormacalcimobxitem(const Value : TDbFormacalcimobxitem);
    procedure SetCdsItemFormaCalc    (const Value : TCMClientDataSet);

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize;   override;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbFormacalcimobxitem : TDbFormacalcimobxitem read FDbFormacalcimobxitem write SetDbFormacalcimobxitem;
    property DBFormaCalcImob      : TDbFormacalcimob      read  FDBFormaCalcImob     write SetDBFormaCalcImob;

    property CdsFormaCalcImob : TCMClientDataSet read FCdsFormaCalcImob write SetCdsFormaCalcImob;
    property CdsItemFormaCalc : TCMClientDataSet read FCdsItemFormaCalc write SetCdsItemFormaCalc;

    function GravaFormaCalcImob     : Boolean;
    function GravaItemFormaCalcImob : Boolean;

    function LookupFormaCalcImob   (const idModulo: Integer = -1) : OLEVariant;

    function LookupItemXFormaCalc  (const iFormaCalculo : Integer;
                                    const iTipoMov : Integer = -1;
                                    const iItem : Integer = -1;
                                    const bCentralizador : Boolean = False) : OleVariant;

    function LookupItemXForma     (const iFormaCalculo : Integer) : OleVariant;

    function LookupItemNaoAssociado(const iModulo : Integer;
                                    const iFormaCalculo : Integer) : OleVariant;


  published

end;


implementation

{ TCtrlFormaCalcImob }

procedure TCtrlFormaCalcImob.AfterInitialize;
begin
   inherited;
   FDBFormaCalcImob.DataBaseName      := DataBaseName;
   FDbFormacalcimobxitem.DataBaseName := DataBaseName;
end;



constructor TCtrlFormaCalcImob.Create;
begin
   inherited;
   FDBFormaCalcImob      := TDBFormaCalcImob.Create( Self );
   FDbFormacalcimobxitem := TDbFormacalcimobxitem.Create( Self );
end;



destructor TCtrlFormaCalcImob.Destroy;
begin
   inherited;
   FreeAndNil(FDBFormaCalcImob);
   FreeAndNil(FDbFormacalcimobxitem);

   if isAppServer then begin
     FreeAndNil(FCdsFormaCalcImob);
     FreeAndNil(FCdsItemFormaCalc);
   end;
end;



function TCtrlFormaCalcImob.GravaFormaCalcImob: Boolean;
var
   sMsg : string;
begin
   if ConnectionSide = cnsclient then begin
      Result := Connection.AppServer.GravaFormaCalcImob (CdsFormaCalcImob.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      try
         StartTransaction;
         Result := ApplyCds(CdsFormaCalcImob, DBFormaCalcImob, [], []);
         sMsg := DBFormaCalcImob.MessageInfo;

         if  not Result then raise Exception.Create(sMsg);

         Commit;
      except
         on E:Exception do begin
            Result := false;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlFormaCalcImob.GravaItemFormaCalcImob: Boolean;
var
   sMsg : string;
begin
   if ConnectionSide = cnsclient then begin
      Result := Connection.AppServer.GravaItemFormaCalcImob(CdsItemFormaCalc.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      try
         StartTransaction;
         Result := ApplyCds(CdsItemFormaCalc, DbFormacalcimobxitem, [], []);
         sMsg := DbFormacalcimobxitem.MessageInfo;

         if  not Result then raise Exception.Create(sMsg);

         Commit;
      except
         on E:Exception do begin
            Result := false;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlFormaCalcImob.LookupFormaCalcImob(const idModulo: Integer): OLEVariant;
var
   sSql,sParam : String;
begin
   sParam := '';
   if idModulo <> -1           then sParam := sParam + ' WHERE ( IDMODULO = '          + IntToStr(idModulo)+' ) '+#13;

   sSql := 'SELECT * FROM FORMACALCIMOB ' + #13 +
           sParam + #13 +
           ' ORDER BY NOME'+#13;

   Result := GetDataPacket( sSql );
end;



function TCtrlFormaCalcImob.LookupItemNaoAssociado(const iModulo, iFormaCalculo: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                                     + #13 +
   '    TC.IDTIPOCUSTORECIMO,'                                                                  + #13 +
   '    TC.DESCCUSTORECIMO,'                                                                    + #13 +
   '    TC.CODTIPDOC,'                                                                          + #13 +
   '    TC.RECCUSTO,'                                                                           + #13 +
   '    DECODE(TC.RECCUSTO,''R'',1,0) AS FLGCENTRALIZA'                                         + #13 +
   'FROM'                                                                                       + #13 +
   '    TIPOCUSTORECIMOV TC'                                                                    + #13 +
   'WHERE'                                                                                      + #13 +
   '    TC.RECCUSTO    IN (''I'',''R'')'                                                        + #13 +
   'AND TC.IDMODULO    = ' + IntToStr(iModulo)                                                  + #13 +
   'AND TC.IDTIPOCUSTORECIMO NOT IN (SELECT IDTIPOCUSTORECIMO'                                  + #13 +
   '                                 FROM   FORMACALCIMOBXITEM'                                 + #13 +
   '                                 WHERE  IDFORMACALCIMOB = ' + IntToStr(iFormaCalculo) + ')' + #13 +
   'ORDER BY TC.DESCCUSTORECIMO ASC, TC.RECCUSTO DESC'                                          + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlFormaCalcImob.LookupItemXForma(const iFormaCalculo: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                             + #13 +
   '    FC.NOME AS FORMACALCULO,'                                                       + #13 +
   '    TC.DESCCUSTORECIMO AS NOMEITEM,'                                                + #13 +
   '    R.NOMEREGRA,'                                                                   + #13 +
   '    DECODE(FCI.TIPOEVENTO, 0, ''Geração de Parcelas'','                             + #13 +
   '                           1, ''Descontos'','                                       + #13 +
   '                           2, ''Amortização Extra'','                               + #13 +
   '                           3, ''Atualização de Saldo Devedor'') AS DESCEVENTO, '    + #13 +
   '    FCI.IDFORMAXITEM,'                                                              + #13 +
   '    FCI.IDTIPOCUSTORECIMO,'                                                         + #13 +
   '    FCI.IDFORMACALCIMOB,'                                                           + #13 +
   '    FCI.IDREGRA,'                                                                   + #13 +
   '    FCI.TIPOEVENTO,'                                                                + #13 +
   '    FCI.TRATASALDODEV,'                                                             + #13 +
   '    FCI.FLGGRAVAZERO,'                                                              + #13 +
   '    FCI.SEQCALCULO,'                                                                + #13 +
   '    NVL(FCI.FLGCENTRALIZA,0) AS FLGCENTRALIZA'                                      + #13 +
   'FROM'                                                                               + #13 +
   '    FORMACALCIMOB FC,'                                                              + #13 +
   '    FORMACALCIMOBXITEM FCI,'                                                        + #13 +
   '    TIPOCUSTORECIMOV TC,'                                                           + #13 +
   '    REGRA R'                                                                        + #13 +
   'WHERE'                                                                              + #13 +
   '    FCI.IDFORMACALCIMOB   = FC.IDFORMACALCIMOB'                                     + #13 +
   'AND FCI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO'                                   + #13 +
   'AND R.IDREGRA(+)          = FCI.IDREGRA'                                            + #13 +
   'AND FC.IDFORMACALCIMOB    = ' + IntToStr(iFormaCalculo)                             + #13;

   sSQL := sSQL +
   'ORDER BY FCI.TIPOEVENTO ASC, NVL(FCI.FLGCENTRALIZA,0) DESC'     + #13;

   Result := GetDataPacket(sSQL);
end;

function TCtrlFormaCalcImob.LookupItemXFormaCalc(const iFormaCalculo : Integer;
                                                 const iTipoMov : Integer = -1;
                                                 const iItem : Integer = -1;
                                                 const bCentralizador : Boolean = False) : OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                             + #13 +
   '    FC.NOME AS FORMACALCULO,'                                                       + #13 +
   '    TC.DESCCUSTORECIMO AS NOMEITEM,'                                                + #13 +
   '    R.NOMEREGRA,'                                                                   + #13 +
   '    DECODE(FCI.TIPOEVENTO, 0, ''Geração de Parcelas'','                             + #13 +
   '                           1, ''Descontos'','                                       + #13 +
   '                           2, ''Amortização Extra'','                               + #13 +
   '                           3, ''Atualização de Saldo Devedor'') AS DESCEVENTO, '    + #13 +
   '    FCI.IDFORMAXITEM,'                                                              + #13 +
   '    FCI.IDTIPOCUSTORECIMO,'                                                         + #13 +
   '    FCI.IDFORMACALCIMOB,'                                                           + #13 +
   '    FCI.IDREGRA,'                                                                   + #13 +
   '    FCI.TIPOEVENTO,'                                                                + #13 +
   '    FCI.TRATASALDODEV,'                                                             + #13 +
   '    FCI.FLGGRAVAZERO,'                                                              + #13 +
   '    FCI.SEQCALCULO,'                                                                + #13 +
   '    NVL(FCI.FLGCENTRALIZA,0) AS FLGCENTRALIZA'                                      + #13 +
   'FROM'                                                                               + #13 +
   '    FORMACALCIMOB FC,'                                                              + #13 +
   '    FORMACALCIMOBXITEM FCI,'                                                        + #13 +
   '    TIPOCUSTORECIMOV TC,'                                                           + #13 +
   '    REGRA R'                                                                        + #13 +
   'WHERE'                                                                              + #13 +
   '    FCI.IDFORMACALCIMOB   = FC.IDFORMACALCIMOB'                                     + #13 +
   'AND FCI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO'                                   + #13 +
   'AND R.IDREGRA(+)          = FCI.IDREGRA'                                            + #13 +
   'AND FC.IDFORMACALCIMOB    = ' + IntToStr(iFormaCalculo)                             + #13;

   if iTipoMov <> -1 then sSQL := sSQL + 'AND FCI.TIPOEVENTO = ' + IntToStr(iTipoMov) + #13;

   if iItem <> -1 then sSQL := sSQL + 'AND FCI.IDTIPOCUSTORECIMO = ' + IntToStr(iItem)  + #13;

   if bCentralizador then sSQL := sSQL + 'AND NVL(FCI.FLGCENTRALIZA,0) = 1' + #13;

   sSQL := sSQL +
   'ORDER BY FCI.TIPOEVENTO ASC, FCI.SEQCALCULO ASC'     + #13;

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlFormaCalcImob.onCreateAppServer;
begin
   inherited;
   FCdsFormaCalcImob := TCMClientDataSet.Create(nil);
   FCdsItemFormaCalc := TCMClientDataSet.Create(nil);
end;



procedure TCtrlFormaCalcImob.SetCdsFormaCalcImob(const Value: TCMClientDataSet);
begin
   FCdsFormaCalcImob := Value;
end;



procedure TCtrlFormaCalcImob.SetCdsItemFormaCalc(const Value: TCMClientDataSet);
begin
   FCdsItemFormaCalc := Value;
end;



procedure TCtrlFormaCalcImob.SetDBFormaCalcImob(const Value: TDbFormacalcimob);
begin
   FDBFormaCalcImob := Value;
end;



procedure TCtrlFormaCalcImob.SetDbFormacalcimobxitem(const Value: TDbFormacalcimobxitem);
begin
   FDbFormacalcimobxitem := Value;
end;



end.
