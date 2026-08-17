unit uCtrlSitContImob;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE SITUAÇÃO DE CONTRATOS DO IMOBILIÁRIO  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//	Autor           :  Vinícius Meyer Lana
//	Data de Início  :  24/05/2002
//	Data de Término :  24/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaSitContImob  -  Ins,Alt,Del cadastro de Situação Contratual        ( TLB )
//      LookupSitContImob -  Abre um ou mais registros de situação contratual
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uDbSitContImob,
     uCMTypes;

type TCtrlSitContImob = class(TCmControlObject)
     private
       FCdsSitContImob: TCMClientDataSet;
       FDbSitContImob : TDbSitContImob;
       procedure SetCdsSitContImob(const Value: TCMClientDataSet);
       procedure SetDbSitContImob (const Value: TDbSitContImob);

     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;
     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbSitContImob  : TDbSitContImob   read FDbSitContImob  write SetDbSitContImob;
       property CdsSitContImob : TCMClientDataSet read FCdsSitContImob write SetCdsSitContImob;

       function GravaSitContImob  : Boolean;
       function LookupSitContImob (const iIdSitContImob:Integer = -1): OLEVariant;

     published

end;



implementation

{ TCtrlSitContImob }

constructor TCtrlSitContImob.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbSitContImob := TDBSitContImob.Create( Self );
end;

destructor TCtrlSitContImob.Destroy;
begin
  // Destrói os DbObjects criados
  FDbSitContImob.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsSitContImob.Free;
  inherited;
end;

procedure TCtrlSitContImob.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsSitContImob := TCMClientDataSet.Create( nil );
end;

procedure TCtrlSitContImob.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbSitContImob.DataBaseName := DataBaseName;
end;

function TCtrlSitContImob.GravaSitContImob: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaSitContImob( CdsSitContImob.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsSitContImob, DbSitContImob, [], [] );
      if not Result then raise Exception.Create( DbSitContImob.MessageInfo );
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


function TCtrlSitContImob.LookupSitContImob(const iIdSitContImob:Integer = -1): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdSitContImob > 0 then sParam := sParam + ' AND IDSITCONTIMOB = ' + IntToStr(iIdSitContImob);

  // Define Sql
  sSql := 'SELECT IDSITCONTIMOB, DESCRICAO ' +#13+
          '  FROM SITCONTIMOB ' +#13+
          ' WHERE 1=1 ' +#13+ sParam +#13+
          ' ORDER BY DESCRICAO ';
  Result := GetDataPacket( sSql );
end;



procedure TCtrlSitContImob.SetCdsSitContImob(const Value: TCMClientDataSet);
begin
  FCdsSitContImob := Value;
end;

procedure TCtrlSitContImob.SetDbSitContImob(const Value: TDbSitContImob);
begin
  FDbSitContImob := Value;
end;

end.
