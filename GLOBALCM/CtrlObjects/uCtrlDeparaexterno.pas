unit uCtrlDeparaexterno;

interface

Uses DB, uDataBase, uDbDeparaexterno, uCmControlObject, dbclient, sysutils,Provider,
      ComCtrls,CMProcuraMask, CMProcura,DBTables, uCMTypes;

  Type

    TCtrlDeparaexterno = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbDeparaExterno  : TDbDeparaexterno;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsDeparaExterno : TClientDataSet;

      procedure SetcdsDeparaExterno(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsDeparaExterno: TClientDataSet Read FCdsDeparaExterno Write SetCdsDeparaExterno;

      {Esta função tem o Objetivo de retornar registros da tabela campo De-Para}
      Function ListaDeparaExterno(idDeparaExterno : integer = 0):OleVariant;
      function Gravar: boolean;
    End;


implementation

{ TCtrlDeparaexterno }



constructor TCtrlDeparaexterno.Create;
begin
  inherited;
  _dbDeparaExterno  := TDbDeparaexterno.Create(Self);
end;



destructor TCtrlDeparaexterno.Destroy;
begin
  inherited;

  _dbDeparaExterno.Free;
  if isAppServer then FCdsDeparaExterno.Free;
end;



procedure TCtrlDeparaexterno.DoChangeDataBase;
begin
  inherited;
  _dbDeparaExterno.DataBaseName := DataBaseName;

end;



procedure TCtrlDeparaexterno.SetCdsDeparaExterno(const Value: TClientDataSet);
begin
  FCdsDeparaExterno := Value;
end;



procedure TCtrlDeparaexterno.OnCreateAppServer;
begin
  inherited;
  FCdsDeparaExterno := TClientDataSet.Create(nil);
end;



function TCtrlDeparaexterno.ListaDeparaExterno(idDeparaExterno: integer = 0): OleVariant;
var
  sSql, sFiltro, sOrdem :string;
begin
  sFiltro := '';
  if idDeparaExterno <> 0 then
    sFiltro := ' AND IDDEPARAEXTERNO = '+ intToStr(idDeparaExterno);

  sSql := ' SELECT * FROM DEPARAEXTERNO WHERE 1 = 1 '+ sFiltro;

  result := getDataPacket(sSql);
end;




function TCtrlDeparaexterno.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Apagar ( FCdsDeparaExterno.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FCdsDeparaExterno,_dbDeparaExterno,[],[] );
           Msg    := _dbDeparaExterno.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;

        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;



end.
