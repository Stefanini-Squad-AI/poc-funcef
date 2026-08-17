unit uCtrlMarcas;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE MARCAS  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//	Autor           :  Vinícius Meyer Lana
//	Data de Início  :  22/05/2002
//	Data de Término :  22/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaMarcas  -  Insere, Altera e Exclui cadastro de Marcas              ( TLB )
//      LookupMarcas -  Abre um ou mais registros de Marcas
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uDbMarcas,
     uCMTypes;

type TCtrlMarcas = class(TCmControlObject)
     private
       FCdsMarcas: TCMClientDataSet;
       FDbMarcas : TDbMarcas;
       procedure SetCdsMarcas(const Value: TCMClientDataSet);
       procedure SetDbMarcas (const Value: TDbMarcas);

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;
     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbMarcas  : TDbMarcas        read FDbMarcas  write SetDbMarcas;
       property CdsMarcas : TCMClientDataSet read FCdsMarcas write SetCdsMarcas;

       function GravaMarcas  : Boolean;
       function LookupMarcas(const iIdMarca:Integer = -1) : OLEVariant;

     published

end;


implementation

{ TCtrlMarcas }

constructor TCtrlMarcas.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbMarcas := TDBMarcas.Create( Self );
end;

destructor TCtrlMarcas.Destroy;
begin
  // Destrói os DbObjects criados
  FDbMarcas.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsMarcas.Free;
  inherited;
end;

procedure TCtrlMarcas.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsMarcas := TCMClientDataSet.Create( nil );
end;

procedure TCtrlMarcas.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbMarcas.DataBaseName := DataBaseName;
end;

function TCtrlMarcas.GravaMarcas: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaMarcas( CdsMarcas.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsMarcas, DbMarcas, [], [] );
      if not Result then raise Exception.Create( DbMarcas.MessageInfo );
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

function TCtrlMarcas.LookupMarcas(const iIdMarca : Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdMarca <> -1 then sParam := ' WHERE IDMARCA = ' + IntToStr(iIdMarca);
  sSql := 'SELECT  IDMARCA, MRCNOME ' +#13+
          '  FROM  MARCAS ' +#13+ sParam +
          ' ORDER BY MRCNOME ';
  Result := GetDataPacket( sSql );
end;

procedure TCtrlMarcas.SetCdsMarcas(const Value: TCMClientDataSet);
begin
  FCdsMarcas := Value;
end;

procedure TCtrlMarcas.SetDbMarcas(const Value: TDbMarcas);
begin
  FDbMarcas := Value;
end;

end.
