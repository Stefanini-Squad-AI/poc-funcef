unit uCtrlCotatipooper;

interface

uses  DB, uDatabase, uCmControlObject, dbClient, StdCtrls, Sysutils,
      uSistema, dBasedados, uCmTypes, CmEventosCadastro, uCmClientdataset,
      dbtables, uMidasUtil, uCmSQLParams, Classes, uDbCotatipooper;



type
    TCtrlCotatipooper = class(TCmControlObject)


    private
    FcdsCotatipooper: TCmClientDataSet;
    FDbCotatipooper: TDbCotatipooper;
    procedure SetcdsCotatipooper(const Value: TCmClientDataSet);
    procedure SetDbCotatipooper(const Value: TDbCotatipooper);


     protected
             procedure AfterInitialize; override;
             procedure OnCreateAppserver; override;


     public
             constructor Create;  override;
             destructor Destroy;  override;

             property cdsCotatipooper : TCmClientDataSet read FcdsCotatipooper write SetcdsCotatipooper;
             property DbCotatipooper : TDbCotatipooper read FDbCotatipooper write SetDbCotatipooper;


             function GravarCota : Boolean;
             function ListaCota : OleVariant;
             function VerificaLancCadastrado(const sDescricao : string; const iIdCotatipoOper : integer = -1): Boolean;

     published



end;



implementation


procedure TCtrlCotatipooper.AfterInitialize;
begin
  inherited;
  FDbcotatipooper.DataBaseName := DataBAsename;
end;


constructor TCtrlCotatipooper.Create;
begin
inherited;
 FDbCotatipooper := TDbCotaTipoOper.Create(Self);
end;



destructor TCtrlCotatipooper.Destroy;
begin
  FreeAndNil (FDbCOtaTipoOper);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then
    begin
      FreeAndNil (FCdsCotaTipoOper);
    end;
  inherited;

end;

function TCtrlCotatipooper.GravarCota: Boolean;
begin

// verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
// através da aplicação servidora
  if ConnectionSide = cnsClient then
      begin
        Result := Connection.AppServer.GravaCota( cdsCotatipooper.Data );

//exibe uma mensagem de erro vinda da aplicacao servidora, caso exista erro
        if not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
        end
      else

      begin
        try

//inicia a transacao
         StartTransaction;

// Aplica as alterações do Cds através do DbObject
         Result := ApplyCds( CdsCotaTipoOper, DbCOtaTipoOper, [], [] );
         if not Result then
         raise Exception.Create(DbCotaTipoOper.MessageInfo);
         Commit;

//em caso de erro, anula transacao
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



function TCtrlCotatipooper.ListaCota: OleVariant;
var
sSQL : string;
begin

//esta funcao monta a qry
      sSQL := 'SELECT * FROM COTATIPOOPER'+ #13 +
              'ORDER BY DESCTIPOOPER';

      Result := GetDataPacket(sSQL);

end;




procedure TCtrlCotatipooper.OnCreateAppserver;
begin
  inherited;
  FCdsCotaTipoOper := TCMClientDataSet.Create( nil );

end;

procedure TCtrlCotatipooper.SetcdsCotatipooper(
  const Value: TCmClientDataSet);
begin
  FcdsCotatipooper := Value;
end;

procedure TCtrlCotatipooper.SetDbCotatipooper(
  const Value: TDbCotatipooper);
begin
  FDbCotatipooper := Value;
end;



function TCtrlCotatipooper.VerificaLancCadastrado(const sDescricao: string;
  const iIdCotatipoOper: integer): Boolean;
var
sSQL : string;

begin
  Result := False;
  sSQL := 'SELECT IDCOTATIPOOPER FROM COTATIPOOPER '                     + #13 +
          'WHERE '                                                       + #13 +
          'UPPER(DESCTIPOOPER) = ' + QuotedStr(AnsiUpperCase(sDescricao));
          if iIdCotaTipoOper <> -1 then
            sSQL := sSQL + ' AND IDCOTATIPOOPER <> ' + IntToStr(iIdCotatipoOper);

  _Cds.Data := GetDataPacket(sSQL);
  if _Cds.RecordCount > 0 then
  Result := True;

end;

end.
