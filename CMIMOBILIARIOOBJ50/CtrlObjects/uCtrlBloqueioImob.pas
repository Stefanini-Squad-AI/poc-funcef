unit uCtrlBloqueioImob;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uDbBloqueioImob,uCMTypes;

Type TCtrlBloqueioImob = class(TCmControlObject)
     private
       FCdsBloqueioImob: TCMClientDataSet;
       FDbBloqueioImob: TDbBloqueioImob;
       procedure SetCdsBloqueioImob(const Value: TCMClientDataSet);
       procedure SetDbBloqueioImob(const Value: TDbBloqueioImob);

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbBloqueioImob  : TDbBloqueioImob read FDbBloqueioImob write SetDbBloqueioImob;
       property CdsBloqueioImob : TCMClientDataSet read FCdsBloqueioImob write SetCdsBloqueioImob;

       function GravaBloqueioImob  : Boolean;
       function ApagaBloqueioImob(const iDocumento : Integer;
                                  const iContrato  : Integer) : Boolean;
                                  
       function LookupBloqueioImob(const iIdBloqueioImob  : Integer = -1;
                                   const iIdDocumentoBloq : Integer = -1;
                                   const iIdDocumentoLib  : Integer = -1;
                                   const iIDContrato      : Integer = -1) : OLEVariant;

       function LookupLancamentoBloqueado(const iContrato : Integer = -1;
                                          const iDocumento: Integer = -1;
                                          const bBloqueado: Boolean = True) : OleVariant;

     published

end;



implementation

{ TCtrlBloqueioImob }

constructor TCtrlBloqueioImob.Create;
begin
   inherited;
   // Cria os DbOjbects
   FDbBloqueioImob := TDBBloqueioImob.Create( Self );
end;



destructor TCtrlBloqueioImob.Destroy;
begin
   // Destrói os DbObjects criados
   FDbBloqueioImob.Free;
   // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
   if isAppServer then FCdsBloqueioImob.Free;
   inherited;
end;



procedure TCtrlBloqueioImob.OnCreateAppServer;
begin
   inherited;
   // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
   // aplicação cliente, os mesmos já foram criados.
   FCdsBloqueioImob := TCMClientDataSet.Create( nil );
end;



procedure TCtrlBloqueioImob.AfterInitialize;
begin
   inherited;
   // define o DataBase a ser utilizado
   FDbBloqueioImob.DataBaseName := DataBaseName;
end;



function TCtrlBloqueioImob.GravaBloqueioImob: Boolean;
var
   bTransacao : Boolean;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   bTransacao := InTransaction;
   if ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.GravaBloqueioImob( CdsBloqueioImob.Data );
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      try
         if not bTransacao then StartTransaction;

         // Aplica as alterações do Cds através do DbObject
         Result := ApplyCds( CdsBloqueioImob, DbBloqueioImob, [], [] );
         if not Result then raise Exception.Create( DbBloqueioImob.MessageInfo );
         if not bTransacao then Commit;
      except
         on E : Exception do begin
            Result := False;
            if not bTransacao then Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlBloqueioImob.ApagaBloqueioImob(const iDocumento, iContrato: Integer): Boolean;
var
   sSQL : String;
begin
   sSQL        := 'DELETE FROM BLOQUEIOIMOB WHERE IDDOCUMENTOBLOQ = ' + IntToStr(iDocumento) + ' AND IDCONTRATOIMOVEL = ' + IntToStr(iContrato);
   MessageInfo := '';
   Result      := True;

   try
      ExecSql(sSQL);
   except
      Result := False;
      MessageInfo := 'Erro ao excluir o Bloqueio do Documento';
   end;
end;



function TCtrlBloqueioImob.LookupBloqueioImob(const iIdBloqueioImob  : Integer = -1;
                                              const iIdDocumentoBloq : Integer = -1;
                                              const iIdDocumentoLib  : Integer = -1;
                                              const iIDContrato      : Integer = -1) : OLEVariant;
var
   sSql, sParam : String;
begin
   sParam := 'WHERE 1 = 1';
   if iIdBloqueioImob  <> -1 then sParam := sParam + ' AND IDBLOQUEIOIMOB   = ' + IntToStr(iIdBloqueioImob)  + #13;
   if iIdDocumentoBloq <> -1 then sParam := sParam + ' AND IDDOCUMENTOBLOQ  = ' + IntToStr(iIdDocumentoBloq) + #13;
   if iIdDocumentoLib  <> -1 then sParam := sParam + ' AND IDDOCUMENTOLIB   = ' + IntToStr(iIdDocumentoLib)  + #13;
   if iIdContrato      <> -1 then sParam := sParam + ' AND IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)      + #13;

   sSql := 'SELECT  * ' +#13+
           '  FROM  BLOQUEIOIMOB ' + #13+ sParam;
   Result := GetDataPacket( sSql );
end;



procedure TCtrlBloqueioImob.SetCdsBloqueioImob(const Value: TCMClientDataSet);
begin
   FCdsBloqueioImob := Value;
end;



procedure TCtrlBloqueioImob.SetDbBloqueioImob(const Value: TDbBloqueioImob);
begin
   FDbBloqueioImob := Value;
end;



function TCtrlBloqueioImob.LookupLancamentoBloqueado(const iContrato,iDocumento: Integer; const bBloqueado: Boolean): OleVariant;
var
   sSQL, sParam : String;
begin
   sParam := '';
   if iContrato  <> -1 then sParam := sParam + 'AND B.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + #13;
   if iDocumento <> -1 then sParam := sParam + 'AND B.IDDOCUMENTOBLOQ  = ' + IntToStr(iDocumento) + #13;
   if bBloqueado then       sParam := sParam + 'AND B.IDDOCUMENTOBLOQ  = L.IDDOCUMENTO AND B.IDDOCUMENTOLIB IS NULL' + #13
   else                     sParam := sParam + 'AND B.IDDOCUMENTOLIB   = L.IDDOCUMENTO' + #13;

   sSQL :=
   'SELECT'                                        + #13+
   '    0 AS FLGESCOLHA,'                          + #13+
   '    B.IDBLOQUEIOIMOB,'                         + #13+
   '    B.IDDOCUMENTOBLOQ,'                        + #13+
   '    B.IDDOCUMENTOLIB,'                         + #13+
   '    B.IDCONTRATOIMOVEL,'                       + #13+
   '    B.DATAPAGTO,'                              + #13+
   '    B.VLRPAGTO,'                               + #13+
   '    L.ANOCOMPETENCIA,'                         + #13+
   '    L.MESCOMPETENCIA,'                         + #13+
   '    L.IDFORCLI,'                               + #13+
   '    L.IDTIPOCUSTORECIMO,'                      + #13+
   '    L.CODFORMA,'                               + #13+
   '    L.CODPORTFORMA,'                           + #13+
   '    L.IDRESERVAORCAMEN,'                       + #13+
   '    L.MOEDARECEB,'                             + #13+
   '    L.NUMAPALT,'                               + #13+
   '    L.REFERENCIAAP,'                           + #13+
   '    L.OBS,'                                    + #13+
   '    L.CODCENTROCUSTO,'                         + #13+
   '    L.DATAVENCIMENTO,'                         + #13+
   '    L.DATALANCAMENTO,'                         + #13+
   '    L.DATAEMISSAO,'                            + #13+
   '    L.DTFIMCTBDIARIA,'                         + #13+
   '    L.DTINICTBDIARIA,'                         + #13+
   '    T.DESCCUSTORECIMO,'                        + #13+
   '    L.IDCBANCARIA,'                            + #13+
   '    P.DESCRICAO,'                              + #13+
   '    C.CONNUMERO,'                              + #13+
   '    C.CONNOME,'                                + #13+
   '    SUM(L.VLRLANCRECEB) AS VLRLANCRECEB'       + #13+
   'FROM'                                          + #13+
   '    BLOQUEIOIMOB B,'                           + #13+
   '    LANCAMENTOSIMOVEL L,'                      + #13+
   '    TIPOCUSTORECIMOV T,'                       + #13+
   '    PORTADORFORMA P,'                          + #13+
   '    CONTRATOIMOVEL C'                          + #13+
   'WHERE'                                         + #13+
   '    B.IDCONTRATOIMOVEL = L.IDCONTRATOIMOVEL'   + #13+
   'AND L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO' + #13+
   'AND C.IDCONTRATOIMOVEL = B.IDCONTRATOIMOVEL'   + #13+
   'AND L.CODPORTFORMA = P.CODPORTFORMA'           + #13+ sParam;

   sSQL := sSQL +
   'GROUP BY'                                      + #13+
   '    B.IDBLOQUEIOIMOB,'                         + #13+
   '    B.IDDOCUMENTOBLOQ,'                        + #13+
   '    B.IDDOCUMENTOLIB,'                         + #13+
   '    B.IDCONTRATOIMOVEL,'                       + #13+
   '    B.DATAPAGTO,'                              + #13+
   '    B.VLRPAGTO,'                               + #13+
   '    L.ANOCOMPETENCIA,'                         + #13+
   '    L.MESCOMPETENCIA,'                         + #13+
   '    L.IDFORCLI,'                               + #13+
   '    L.IDTIPOCUSTORECIMO,'                      + #13+
   '    L.CODFORMA,'                               + #13+
   '    L.CODPORTFORMA,'                           + #13+
   '    L.IDRESERVAORCAMEN,'                       + #13+
   '    L.MOEDARECEB,'                             + #13+
   '    L.NUMAPALT,'                               + #13+
   '    L.REFERENCIAAP,'                           + #13+
   '    L.OBS,'                                    + #13+
   '    L.CODCENTROCUSTO,'                         + #13+
   '    L.DATAVENCIMENTO,'                         + #13+
   '    L.DATALANCAMENTO,'                         + #13+
   '    L.DATAEMISSAO,'                            + #13+
   '    L.DTFIMCTBDIARIA,'                         + #13+
   '    L.DTINICTBDIARIA,'                         + #13+
   '    T.DESCCUSTORECIMO,'                        + #13+
   '    L.IDCBANCARIA,'                            + #13+
   '    P.DESCRICAO,'                              + #13+
   '    C.CONNUMERO,'                              + #13+
   '    C.CONNOME'                                 + #13;

   Result := GetDataPacket( sSql );
end;




end.



