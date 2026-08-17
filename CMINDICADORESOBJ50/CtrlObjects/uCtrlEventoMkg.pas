unit uCtrlEventoMkg;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE EVENTO DE MARKETING  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  21/05/2002
//      Data de Término :  21/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaEventoMkg         -  Ins,Alt,Del cadastro de Evento de Marketing   ( TLB )
//      GravaHistEventoMkg     -  Ins,Alt,Del cadastro de Histórico de Eventos  ( TLB )
//      LookupEventoMkg        -  Abre um ou mais registros de evento
//      SelecionaHistEventoMkg -  Abre um registro de histórico de evento
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbEventoMkg, uDbHistEventoMkg;

Type TCtrlEventoMkg = class(TCmControlObject)

     private
       FCdsEventoMkg    : TCMClientDataSet;
       FCdsHistEventoMkg: TCMClientDataSet;
       FDbEventoMkg     : TDbEventoMkg;
       FDbHistEventoMkg : TDbHistEventoMkg;
       procedure SetCdsEventoMkg    (const Value: TCMClientDataSet);
       procedure SetCdsHistEventoMkg(const Value: TCMClientDataSet);
       procedure SetDbEventoMkg     (const Value: TDbEventoMkg);
       procedure SetDbHistEventoMkg (const Value: TDbHistEventoMkg);
     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create; override;
       destructor Destroy; override;

       property DbEventoMkg      : TDbEventoMkg     read FDbEventoMkg      write SetDbEventoMkg;
       property DbHistEventoMkg  : TDbHistEventoMkg read FDbHistEventoMkg  write SetDbHistEventoMkg;
       property CdsEventoMkg     : TCMClientDataSet read FCdsEventoMkg     write SetCdsEventoMkg;
       property CdsHistEventoMkg : TCMClientDataSet read FCdsHistEventoMkg write SetCdsHistEventoMkg;

       function GravaEventoMkg     : Boolean;
       function GravaHistEventoMkg : Boolean;
       function LookupEventoMkg       (const iIdEventoMkg:Integer = -1 ): OLEVariant;
       function SelecionaHistEventoMkg(const iIdHistEventoMkg:Integer ) : OLEVariant;

    published

end;


implementation

{ TCtrlEventoMkg }

constructor TCtrlEventoMkg.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbEventoMkg     := TDBEventoMkg.Create( Self );
  FDbHistEventoMkg := TDBHistEventoMkg.Create( Self );
end;

destructor TCtrlEventoMkg.Destroy;
begin
  // Destrói os DbObjects criados
  FDbEventoMkg.Free;
  FDbHistEventoMkg.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  If IsAppServer Then FCdsEventoMkg.Free;
  If IsAppServer Then FCdsHistEventoMkg.Free;
  inherited;
end;

procedure TCtrlEventoMkg.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsEventoMkg     := TCMClientDataSet.Create( nil );
  FCdsHistEventoMkg := TCMClientDataSet.Create( nil );
end;

procedure TCtrlEventoMkg.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDBEventoMkg.DataBaseName     := DataBaseName;
  FDBHistEventoMkg.DataBaseName := DataBaseName;
end;

function TCtrlEventoMkg.GravaEventoMkg: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaEventoMkg( CdsEventoMkg.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsEventoMkg, DbEventoMkg, [], [] );
      if not Result then raise Exception.Create( DbEventoMkg.MessageInfo );
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

function TCtrlEventoMkg.LookupEventoMkg(const iIdEventoMkg:Integer ) : OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdEventoMkg <> -1 then sParam := ' WHERE IDEVENTO = ' + IntToStr(iIdEventoMkg);
  sSql := 'SELECT IDEVENTO, DESCRICAO ' +#13+
          '  FROM INDEVENTO ' +#13+ sParam +
          ' ORDER BY DESCRICAO ';
  Result := GetDataPacket( sSql );
end;

function TCtrlEventoMkg.GravaHistEventoMkg: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaHistEventoMkg( CdsHistEventoMkg.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsHistEventoMkg, DbHistEventoMkg, [], [] );
      if not Result then raise Exception.Create( DbHistEventoMkg.MessageInfo );
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

function TCtrlEventoMkg.SelecionaHistEventoMkg(const iIdHistEventoMkg: Integer): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT HE.IDHISTEVENTO, HE.IDIMOVEL, HE.IDEVENTO, ' +
          '       HE.DATAINICIO,   HE.DATAFIM, ' +
          '       IM.IMONOME ||' + QuotedStr(' - ') + '||I.IMONOME AS NOME_EXTENSO ' +
          '  FROM INDHISTEVENTO HE, ' +
          '       IMOVEL I, ' +
          '       IMOVEL IM  ' +
          ' WHERE HE.IDIMOVEL = I.IDIMOVEL ' +
          '   AND IM.IDIMOVEL = I.IDIMOVELMESTRE ' +
          '   AND HE.IDHISTEVENTO = ' + IntToStr(iIdHistEventoMkg);

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;

procedure TCtrlEventoMkg.SetCdsEventoMkg(const Value: TCMClientDataSet);
begin
  FCdsEventoMkg := Value;
end;

procedure TCtrlEventoMkg.SetDbEventoMkg(const Value: TDbEventoMkg);
begin
  FDbEventoMkg := Value;
end;

procedure TCtrlEventoMkg.SetCdsHistEventoMkg(const Value: TCMClientDataSet);
begin
  FCdsHistEventoMkg := Value;
end;

procedure TCtrlEventoMkg.SetDbHistEventoMkg(const Value: TDbHistEventoMkg);
begin
  FDbHistEventoMkg := Value;
end;

end.
