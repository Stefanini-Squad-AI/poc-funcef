unit uCtrlConfissaoDivida;

interface

Uses SysUtils, Db, DbClient, uCmControlObject, uCmDbObject, uCmClientDataSet, uDbConfDividaImob, uDbConfDividaImobXDoc,
     uDbConfDividaImobXContr, uDbConfDividaImobXOper, uCMTypes;

Type TCtrlConfissaoDivida = class(TCmControlObject)
     private
       FDbConfDividaImobXContr: TDbConfDividaImobXContr;
       FDbConfDividaImob: TDbConfDividaImob;
       FDbConfDividaImobXDoc: TDbConfDividaImobXDoc;
       FDbConfDividaImobXOper: TDbConfDividaImobXOper;

       FCdsConfDividaImobXContr: TCMClientDataSet;
       FCdsConfDividaImobXDoc: TCMClientDataSet;
       FCdsConfDividaImob: TCMClientDataSet;
       FCdsConfDividaImobXOper: TCMClientDataSet;

       FIdContratoResult: Integer;

       procedure SetCdsConfDividaImob(const Value: TCMClientDataSet);
       procedure SetCdsConfDividaImobXContr(const Value: TCMClientDataSet);
       procedure SetCdsConfDividaImobXDoc(const Value: TCMClientDataSet);
       procedure SetCdsConfDividaImobXOper(const Value: TCMClientDataSet);
       procedure SetDbConfDividaImob(const Value: TDbConfDividaImob);
       procedure SetDbConfDividaImobXContr(const Value: TDbConfDividaImobXContr);
       procedure SetDbConfDividaImobXDoc(const Value: TDbConfDividaImobXDoc);
       procedure SetDbConfDividaImobXOper(const Value: TDbConfDividaImobXOper);
       procedure SetIdContratoResult(const Value: Integer);

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;
       procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property IdContratoResult       : Integer                 read FIdContratoResult       write SetIdContratoResult;
       property DbConfDividaImob       : TDbConfDividaImob       read FDbConfDividaImob       write SetDbConfDividaImob;
       property DbConfDividaImobXDoc   : TDbConfDividaImobXDoc   read FDbConfDividaImobXDoc   write SetDbConfDividaImobXDoc;
       property DbConfDividaImobXContr : TDbConfDividaImobXContr read FDbConfDividaImobXContr write SetDbConfDividaImobXContr;
       property DbConfDividaImobXOper  : TDbConfDividaImobXOper  read FDbConfDividaImobXOper  write SetDbConfDividaImobXOper;

       property CdsConfDividaImob       : TCMClientDataSet read FCdsConfDividaImob       write SetCdsConfDividaImob;
       property CdsConfDividaImobXDoc   : TCMClientDataSet read FCdsConfDividaImobXDoc   write SetCdsConfDividaImobXDoc;
       property CdsConfDividaImobXContr : TCMClientDataSet read FCdsConfDividaImobXContr write SetCdsConfDividaImobXContr;
       property CdsConfDividaImobXOper  : TCMClientDataSet read FCdsConfDividaImobXOper  write SetCdsConfDividaImobXOper;

       function GravaConfissao : Boolean;
       function ApagaConfissao : Boolean;


       function LookupContratos(const iLocatario : Integer) : OleVariant;
       function LookupDocumentos : OleVariant;
       function LookupConfissao(const iContrato : Integer = -1) : OleVariant;
       function LookupConfissaoContratos(const iContrato : Integer = -1) : OleVariant;
       function LookupConfissaoDocumentos(const iContrato : Integer = -1) : OleVariant;
       function LookupConfissaoOperacoes(const iContrato : Integer = -1; const iCondPagImovel  : Integer = -1) : OleVariant;
       function LookupTipoOperacao(const iModulo : Integer) : OleVariant;

       function LookupImovelDocumento(const iDocumento : Integer = -1; const iImovel : Integer = -1) : OleVariant;

     published

end;

implementation

{ TCtrlConfissaoDivida }

procedure TCtrlConfissaoDivida.AfterInitialize;
begin
   inherited;
   FDbConfDividaImobXContr.DataBaseName  := DataBaseName;
   FDbConfDividaImob.DataBaseName        := DataBaseName;
   FDbConfDividaImobXDoc.DataBaseName    := DataBaseName;
   FDbConfDividaImobXOper.DataBaseName   := DataBaseName;
end;



function TCtrlConfissaoDivida.ApagaConfissao: Boolean;
var sMsg : String;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.ApagaConfissao( CdsConfDividaImob.Data, CdsConfDividaImobXContr.Data,
                                                    CdsConfDividaImobXDoc.Data, CdsConfDividaImobXOper.Data );
     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
     try

       StartTransaction;

       CdsConfDividaImobXOper.First;
       CdsConfDividaImobXDoc.First;
       CdsConfDividaImobXContr.First;
       CdsConfDividaImob.First;

       while not CdsConfDividaImobXOper.eof  do CdsConfDividaImobXOper.Delete;
       while not CdsConfDividaImobXDoc.eof   do CdsConfDividaImobXDoc.Delete;
       while not CdsConfDividaImobXContr.eof do CdsConfDividaImobXContr.Delete;
       while not CdsConfDividaImob.eof       do CdsConfDividaImob.Delete;

       Result := ApplyCds( CdsConfDividaImobXOper, DbConfDividaImobXOper, [], [] );
       if not Result then raise Exception.Create( DbConfDividaImobXOper.MessageInfo );

       Result := ApplyCds( CdsConfDividaImobXDoc, DbConfDividaImobXDoc, [], [] );
       if not Result then raise Exception.Create( DbConfDividaImobXDoc.MessageInfo );

       Result := ApplyCds( CdsConfDividaImobXContr, DbConfDividaImobXContr, [], [] );
       if not Result then raise Exception.Create( DbConfDividaImobXContr.MessageInfo );

       Result := ApplyCds( CdsConfDividaImob, DbConfDividaImob, [], [] );
       if not Result then raise Exception.Create( DbConfDividaImob.MessageInfo );

       Commit;

     except
       on E : Exception do begin
         Result := False;
         Rollback;
         MessageInfo := E.Message;
       end;
     end;
   end;
end;

constructor TCtrlConfissaoDivida.Create;
begin
   inherited;
   FDbConfDividaImobXContr := TDbConfDividaImobXContr.Create(Self);
   FDbConfDividaImob       := TDbConfDividaImob.Create(Self);
   FDbConfDividaImobXDoc   := TDbConfDividaImobXDoc.Create(Self);
   FDbConfDividaImobXOper  := TDbConfDividaImobXOper.Create(Self);
end;



destructor TCtrlConfissaoDivida.Destroy;
begin
   inherited;
   FreeAndNil( FDbConfDividaImobXContr );
   FreeAndNil( FDbConfDividaImob );
   FreeAndNil( FDbConfDividaImobXDoc );
   FreeAndNil( FDbConfDividaImobXOper );

   // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
   if isAppServer then
   begin
      FreeAndNil(FCdsConfDividaImobXContr);
      FreeAndNil(FCdsConfDividaImobXDoc);
      FreeAndNil(FCdsConfDividaImob);
      FreeAndNil(FCdsConfDividaImobXOper);
   end;
end;



function TCtrlConfissaoDivida.GravaConfissao : Boolean;
var sMsg : String;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.GravaConfissao( CdsConfDividaImob.Data, CdsConfDividaImobXContr.Data,
                                                    CdsConfDividaImobXDoc.Data, CdsConfDividaImobXOper.Data );
     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
     try
       StartTransaction;

       Result := ApplyCds( CdsConfDividaImob, DbConfDividaImob, [], [] );
       if not Result then raise Exception.Create( DbConfDividaImob.MessageInfo );

       Result := ApplyCds( CdsConfDividaImobXContr, DbConfDividaImobXContr, [DbConfDividaImob.IdConfDividaImob], [DbConfDividaImobXContr.IdConfDividaImob] );
       if not Result then raise Exception.Create( DbConfDividaImobXContr.MessageInfo );

       Result := ApplyCds( CdsConfDividaImobXDoc, DbConfDividaImobXDoc, [DbConfDividaImob.IdConfDividaImob], [DbConfDividaImobXDoc.IdConfDividaImob] );
       if not Result then raise Exception.Create( DbConfDividaImobXDoc.MessageInfo );

       Result := ApplyCds( CdsConfDividaImobXOper, DbConfDividaImobXOper, [DbConfDividaImob.IdConfDividaImob], [DbConfDividaImobXOper.IdConfDividaImob] );
       if not Result then raise Exception.Create( DbConfDividaImobXOper.MessageInfo );

       Commit;

     except
       on E : Exception do begin
         Result := False;
         Rollback;
         MessageInfo := E.Message;
       end;
     end;
   end;
end;



function TCtrlConfissaoDivida.LookupConfissao(const iContrato: Integer): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT '                                            + #13 +
   '    CI.CONNUMERO, '                                 + #13 +
   '    CI.CONNOME, '                                   + #13 +
   '    CD.CDIDATA, '                                   + #13 +
   '    CD.CDIVALOR, '                                  + #13 +
   '    CD.IDCONTRATORESULT, '                          + #13 +
   '    US.NOMEUSUARIO, '                               + #13 +
   '    CD.IDCONFDIVIDAIMOB, '                          + #13 +
   '    CD.IDUSUARIO, '                                 + #13 +
   '    CD.PLNCODIGO '                                  + #13 +
   'FROM '                                              + #13 +
   '    CONFDIVIDAIMOB CD, '                            + #13 +
   '    CONTRATOIMOVEL CI, '                            + #13 +
   '    USUARIOSISTEMA US '                             + #13 +
   'WHERE '                                             + #13 +
   '    CI.IDCONTRATOIMOVEL = CD.IDCONTRATORESULT '     + #13 +
   'AND US.IDUSUARIO        = CD.IDUSUARIO '            + #13 +
   'AND CD.IDCONTRATORESULT = ' + IntToStr(iContrato)   + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlConfissaoDivida.LookupConfissaoContratos(const iContrato: Integer): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT '                                            + #13 +
   '    CI.CONNUMERO, '                                 + #13 +
   '    CI.CONNOME, '                                   + #13 +
   '    CDC.IDCONFDIVIDAIMOB, '                         + #13 +
   '    CDC.IDCONTRATOIMOVEL '                            + #13 +
   'FROM '                                              + #13 +
   '    CONFDIVIDAIMOB CD, '                            + #13 +
   '    CONFDIVIDAIMOBXCONTR CDC, '                     + #13 +
   '    CONTRATOIMOVEL CI '                             + #13 +
   'WHERE '                                             + #13 +
   '    CI.IDCONTRATOIMOVEL  = CDC.IDCONTRATOIMOVEL '     + #13 +
   'AND CDC.IDCONFDIVIDAIMOB = CD.IDCONFDIVIDAIMOB '    + #13 +
   'AND CD.IDCONTRATORESULT  = ' + IntToStr(iContrato)  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlConfissaoDivida.LookupConfissaoDocumentos(const iContrato: Integer): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT '                                            + #13 +
   '    CDD.CODDOCUMENTO, '                             + #13 +
   '    DOC.NODOCUMENTO, '                              + #13 +
   '    DOC.DATAPROGRAMADA, '                           + #13 +
   '    LDO.VALOR, '                                    + #13 +
   '    CDD.IDCONFDIVIDAIMOB, '                         + #13 +
   '    CDD.IDCONTRATOIMOVEL, '                         + #13 +
   '    CDD.IDLANCTODOCUMLIQ '                          + #13 +
   'FROM '                                              + #13 +
   '    CONFDIVIDAIMOB CD, '                            + #13 +
   '    CONFDIVIDAIMOBXCONTR CDC, '                     + #13 +
   '    CONFDIVIDAIMOBXDOC CDD, '                       + #13 +
   '    DOCUMENTO DOC, '                                + #13 +
   '    LANCTODOCUM LDO '                               + #13 +
   'WHERE '                                             + #13 +
   '    CDC.IDCONFDIVIDAIMOB = CD.IDCONFDIVIDAIMOB '    + #13 +
   'AND CDD.IDCONFDIVIDAIMOB = CDC.IDCONFDIVIDAIMOB '   + #13 +
   'AND CDD.IDCONTRATOIMOVEL = CDC.IDCONTRATOIMOVEL '   + #13 +
   'AND DOC.CODDOCUMENTO     = CDD.CODDOCUMENTO '       + #13 +
   'AND LDO.CODDOCUMENTO     = DOC.CODDOCUMENTO '       + #13 +
   'AND LDO.NUMLANCTO        = CDD.IDLANCTODOCUMLIQ '   + #13 +
   'AND CD.IDCONTRATORESULT  = ' + IntToStr(iContrato)  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlConfissaoDivida.LookupConfissaoOperacoes(const iContrato, iCondPagImovel: Integer): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT '                                                            + #13 +
   '    TCR.DESCCUSTORECIMO, '                                          + #13 +
   '    CDO.FLGTIPO, '                                                  + #13 +
   '    DECODE(CDO.FLGTIPO, ''D'', ''Desconto'',''Acréscimo'') AS DESCTIPO,' + #13 +
   '    CDO.VLROPERACAO, '                                              + #13 +
   '    CDO.OBSERVACAO, '                                               + #13 +
   '    CDO.FLGDESCCONDIC, '                                            + #13 +
   '    DECODE(CDO.FLGDESCCONDIC, 0, ''Não'',''Sim'') AS DESCCOND,'     + #13 +
   '    CDO.IDCONFDIVIDAIMOB, '                                         + #13 +
   '    CDO.IDCONDPAGIMOVEL, '                                          + #13 +
   '    CDO.IDTIPOCUSTORECIMO, '                                        + #13 +
   '    CDO.IDCONFDIVIDAXOPER, '                                        + #13 +
   '    DECODE(CDO.IDCONDPAGIMOVEL,NULL,0,1) AS FLGESCOLHA'             + #13 +
   'FROM '                                                              + #13 +
   '    CONFDIVIDAIMOB CD, '                                            + #13 +
   '    CONFDIVIDAIMOBXOPER CDO, '                                      + #13 +
   '    TIPOCUSTORECIMOV TCR '                                          + #13 +
   'WHERE '                                                             + #13 +
   '    CDO.IDCONFDIVIDAIMOB  = CD.IDCONFDIVIDAIMOB '                   + #13 +
   'AND TCR.IDTIPOCUSTORECIMO = CDO.IDTIPOCUSTORECIMO '                 + #13 +
   'AND CD.IDCONTRATORESULT  = ' + IntToStr(iContrato)                  + #13;

   if iCondPagImovel > -1 then
      sSQL := sSQL + 'AND CDO.IDCONDPAGIMOVEL = ' + IntToStr(iCondPagImovel) + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlConfissaoDivida.LookupContratos(const iLocatario: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL   := 'SELECT * FROM CONTRATOIMOVEL WHERE FLGSTATUS IN (''V'',''S'') AND IDLOCATARIO = ' + IntToStr(iLocatario) + #13 +
             'ORDER BY CONDATAINICIO';
   Result := GetDataPacket(sSQL);
end;



function TCtrlConfissaoDivida.LookupDocumentos: OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT ' + #13 +
   '    0        AS FLGESCOLHA, ' + #13 +
   '    0        AS CODDOCUMENTO, ' + #13 +
   '    ''      '' AS COMPETENCIA, ' + #13 +
   '    SYSDATE  AS DATAVENCTO, ' + #13 +
   '    SYSDATE  AS DATALIMITE, ' + #13 +
   '    SYSDATE  AS DATABAIXA, ' + #13 +
   '    0        AS TOT_RECEBIDO, ' + #13 +
   '    0        AS TOT_RECEBER, ' + #13 +
   '    0        AS DIFERENCA, ' + #13 +
   '    0        AS CORRECAO, ' + #13 +
   '    0        AS JUROS, ' + #13 +
   '    0        AS MULTA, ' + #13 +
   '    0        AS IDCONTRATOIMOVEL, ' + #13 +
   '    ''                                                                                '' AS NOME_EXTENSO ' + #13 +
   'FROM ' + #13 +
   '    DUAL ' + #13 +
   'WHERE 1 = 2 ' + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlConfissaoDivida.LookupImovelDocumento(const iDocumento : Integer = -1; const iImovel : Integer = -1) : OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                     + #13 +
   '    IDIMOVEL, VLRLANCRECEB' + #13 +
   'FROM'                       + #13 +
   '    LANCAMENTOSIMOVEL'      + #13 +
   'WHERE'                      + #13 +
   '    1 = 1'                  + #13;

   if iDocumento > 0 then sSQL := sSQL + 'AND CODDOCUMENTO = ' + IntToSTr(iDocumento)  + #13;
   if iIMovel > 0    then sSQL := sSQL + 'AND IDIMOVEL     = ' + IntToSTr(iImovel)     + #13;

   Result := GetDataPacket(sSQL);

end;



function TCtrlConfissaoDivida.LookupTipoOperacao(const iModulo: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT * FROM TIPOCUSTORECIMOV WHERE RECCUSTO = ''O'' AND IDMODULO = ' + IntToStr(iModulo) + #13 +
   'ORDER BY DESCCUSTORECIMO';

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlConfissaoDivida.OnApplyCdsRecord(aCds: TClientDataSet; const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
begin
   inherited;
   Accept := True;
   if AnsiUpperCase(sTableName) = 'CONFDIVIDAIMOB' then begin
     if CdsState in [usInserted] then begin
        aCds.Edit;
        aCds.FieldByName('IDCONTRATORESULT').asInteger := FIdContratoResult;
        aCds.Post;
     end;
   end;
end;



procedure TCtrlConfissaoDivida.OnCreateAppServer;
begin
   inherited;
   FCdsConfDividaImobXContr := TCMClientDataSet.Create( nil );
   FCdsConfDividaImobXDoc   := TCMClientDataSet.Create( nil );
   FCdsConfDividaImob       := TCMClientDataSet.Create( nil );
   FCdsConfDividaImobXOper  := TCMClientDataSet.Create( nil );
end;



procedure TCtrlConfissaoDivida.SetCdsConfDividaImob(const Value: TCMClientDataSet);
begin
   FCdsConfDividaImob := Value;
end;



procedure TCtrlConfissaoDivida.SetCdsConfDividaImobXContr(const Value: TCMClientDataSet);
begin
   FCdsConfDividaImobXContr := Value;
end;



procedure TCtrlConfissaoDivida.SetCdsConfDividaImobXDoc(const Value: TCMClientDataSet);
begin
   FCdsConfDividaImobXDoc := Value;
end;



procedure TCtrlConfissaoDivida.SetCdsConfDividaImobXOper(const Value: TCMClientDataSet);
begin
   FCdsConfDividaImobXOper := Value;
end;



procedure TCtrlConfissaoDivida.SetDbConfDividaImob(const Value: TDbConfDividaImob);
begin
   FDbConfDividaImob := Value;
end;



procedure TCtrlConfissaoDivida.SetDbConfDividaImobXContr(const Value: TDbConfDividaImobXContr);
begin
   FDbConfDividaImobXContr := Value;
end;



procedure TCtrlConfissaoDivida.SetDbConfDividaImobXDoc(const Value: TDbConfDividaImobXDoc);
begin
   FDbConfDividaImobXDoc := Value;
end;



procedure TCtrlConfissaoDivida.SetDbConfDividaImobXOper(const Value: TDbConfDividaImobXOper);
begin
   FDbConfDividaImobXOper := Value;
end;



procedure TCtrlConfissaoDivida.SetIdContratoResult(const Value: Integer);
begin
   FIdContratoResult := Value;
end;



end.
