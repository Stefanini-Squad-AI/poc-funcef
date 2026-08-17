unit uCtrlPaisTeste;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPaisTeste, uDbEstadoTeste, uCMTypes;

Type

  TCtrlPaisTeste = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    FcdsPais: TClientDataSet;
    FdbPaisteste: TDbPaisTeste;
    FcdsEstado: TClientDataSet;
    FdbEstadoTeste: TDbEstadoTeste;
    procedure SetcdsPais(const Value: TClientDataSet);
    procedure SetdbPaisteste(const Value: TDbPaisTeste);
    procedure SetcdsEstado(const Value: TClientDataSet);
    procedure SetdbEstadoTeste(const Value: TDbEstadoTeste);
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------

  Public
    Property cdsPais: TClientDataSet read FcdsPais write SetcdsPais;  // Mestre
    property cdsEstado: TClientDataSet read FcdsEstado write SetcdsEstado; // Detalhe
    Property dbPaisteste: TDbPaisTeste read FdbPaisteste write SetdbPaisteste;
    property dbEstadoTeste: TDbEstadoTeste read FdbEstadoTeste write SetdbEstadoTeste;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function  ListaPais( const IdPais: Integer = -1): OleVariant;
    Function  Gravar: Boolean;
    function GravarMestreDetalhe: boolean;
    function ExcluirMestreDetalhe: boolean;
//    function ExcluirMestreDetalhe: boolean;
  End;

implementation

{ TCtrlPaisTeste }

constructor TCtrlPaisTeste.Create;
begin
  inherited;
  //amf:07.12.2005 - Instancia os DbObjects
  FdbPaisteste := TDbPaisTeste.Create (self);
  FDbEstadoTeste := TDbEstadoTeste.Create(Self);

  // Instancia os ClientDataSets deste CtrlObject
  FcdsPais := TClientDataSet.Create (nil);
  FCdsEstado := TClientDataSet.Create(nil);
end;

destructor TCtrlPaisTeste.Destroy;
begin
  FreeAndNil(FdbPaisteste);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil(FcdsPais);
  end;
  inherited;

end;

procedure TCtrlPaisTeste.DoChangeDataBase;
begin
  inherited;
  // Atribui o DataBase a propriedade DataBaseName do DbObject
  FdbPaisteste.DataBaseName := DataBaseName;
  FDbEstadoTeste.DataBaseName := DataBaseName;
end;

{function TCtrlPaisTeste.ExcluirMestreDetalhe: boolean;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ExcluirMestreDetalhe(FcdsEstado.Data, FcdsPais.Data);
     if not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     try
       StartTransaction;

       //amf:08.12.2005 - Cds Filho(Detalhe)
       Result := ApplyCds(fCdsEstado, FDbEstadoTeste, [FDbPaisTeste.Idpais],
                 [FDbEstadoTeste.Idpais]);
       MessageInfo := fDbEstadoTeste.MessageInfo;

       if not Result then
          Raise Exception.Create(MessageInfo);

       //amf:08.12.2005 - Cds Pai(Mestre)
       Result := ApplyCds(FcdsPais,FdbPaisTeste,[],[] );
       MessageInfo := FdbPaisTeste.MessageInfo;
       if not Result then
          Raise Exception.Create(MessageInfo);

       Commit;
     Except
       on E:Exception do
       begin
          Result :=False;
          RollBack;
          MessageInfo := E.Message;
       end;
     end;
  end;
end;
}

function TCtrlPaisTeste.ExcluirMestreDetalhe: boolean;
begin
  if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.ExcluirMestreDetalhe( FCdsEstado.data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      FcdsEstado.First;
      while not FCdsEstado.Eof do
      begin
         FCdsEstado.Delete;
         FCdsEstado.Prior;
      end;

      //amf:08.12.2005 - Excluir Detalhe
      Result := ApplyCds( FcdsEstado, dbEstadoTeste, [], []);
      if not Result then
         raise Exception.Create( dbEstadoTeste.MessageInfo );

      //amf:08.12.2005 - Excluir Mestre
      Result := ApplyCds( FcdsPais, dbPaisTeste, [], [] );
      if not Result then
         raise Exception.Create( dbPaisTeste.MessageInfo );

      Commit;
    except
      on E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlPaisTeste.Gravar: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.Gravar( FCdsPais.data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( FcdsPais, dbPaisteste, [], [] );
      if not Result then raise Exception.Create( dbPaisteste.MessageInfo );

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

function TCtrlPaisTeste.GravarMestreDetalhe: Boolean;
Var
   Msg  : String;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.Gravar(fCdsPais.Data, FcdsEstado.Data);
     if not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
     begin
     try
           StartTransaction;
           //amf:07.12.2005 - Cds Pai(Mestre)
           Result := ApplyCds(FcdsPais,FdbPaisTeste,[],[] );
           Msg    := FdbPaisTeste.MessageInfo;
           if not Result then Raise Exception.Create(Msg);

           //amf:07.12.2005 - Cds Filho(Detalhe)
           Result := ApplyCds(fCdsEstado, FDbEstadoTeste, [FDbPaisTeste.Idpais],
                     [FDbEstadoTeste.Idpais]);
           Msg    := fDbEstadoTeste.MessageInfo;

           if not Result then
              Raise Exception.Create(Msg);

           Commit;
        except
           on E:Exception do
           begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            end;
        end;
     end;
end;

Function  TCtrlPaisTeste.ListaPais( const IdPais: Integer = -1): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT  ' + #13 +
           '   IDPAIS, NOMEPAIS, NOMENACIONALIDADE, CODRECEITAFEDERAL,' + #13 +
           '   CODINTERNACIONAL, MASCARACPOSTAL, CODREGIAO ' + #13 +
           'FROM PAIS ' + #13;

   if IdPais <> -1 then
     sSql := sSql + 'WHERE IDPAIS = ' + IntToStr (IdPais);

   Result := GetDataPacket (sSql);
end;

procedure TCtrlPaisTeste.SetcdsEstado(const Value: TClientDataSet);
begin
  FcdsEstado := Value;
end;

procedure TCtrlPaisTeste.SetcdsPais(const Value: TClientDataSet);
begin
  FcdsPais := Value;
end;

procedure TCtrlPaisTeste.SetdbEstadoTeste(const Value: TDbEstadoTeste);
begin
  FdbEstadoTeste := Value;
end;

procedure TCtrlPaisTeste.SetdbPaisteste(const Value: TDbPaisTeste);
begin
  FdbPaisteste := Value;
end;

end.
