unit uCtrl_Pessoa;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDb_Pessoa, DB, uCtrlFuncoesAA;

Type
  TCtrl_Pessoa = class(TCmControlObject)
  private
    FCdsPessoa: TCMClientDataSet;
    FDb_Pessoa: TDb_Pessoa;
    procedure SetCdsPessoa(const Value: TCMClientDataSet);
    procedure SetDb_Pessoa(const Value: TDb_Pessoa);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property Db_Pessoa : TDb_Pessoa read FDb_Pessoa write SetDb_Pessoa;
    property CdsPessoa : TCMClientDataSet read FCdsPessoa write SetCdsPessoa;

    function SelecionaPessoa( iIdPessoa : integer ) : OleVariant;
    function GravaPessoa : Boolean;

    function RecuperaNomePessoa( iIdPessoa : integer ) : OleVariant;

    function IncluirPessoa( bEmTransacao : boolean = False ) : Integer;
    function AlterarPessoa( bEmTransacao : boolean = False ) : Boolean;
    function ExcluirPessoa( iIdPessoa : integer; bEmTransacao : boolean = False ) : Boolean;

    //Pendência 23142 - 24/08/2006
    function ExcluirDependPessoa( iIdPessoa : integer; bEmTransacao : boolean = False ) : Boolean;
    //Fim Pendência 23142

  published

end;

implementation

{ TCtrl_Pessoa }

constructor TCtrl_Pessoa.Create;
begin
  inherited;
  FDb_Pessoa  := TDb_Pessoa.Create( Self );
end;

destructor TCtrl_Pessoa.Destroy;
begin
  FDb_Pessoa.Free;
  if IsAppServer then FCdsPessoa.Free;
  inherited;
end;

procedure TCtrl_Pessoa.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_Pessoa.DataBaseName    := DataBaseName
  else
    FDb_Pessoa.dbADOConnection := dbADOConnection;
end;

function TCtrl_Pessoa.GravaPessoa: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarPessoa( CdsPessoa.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsPessoa, FDb_Pessoa, [], [] );

      Msg := FDb_Pessoa.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

procedure TCtrl_Pessoa.OnCreateAppServer;
begin
  inherited;
  FCdsPessoa := TCMClientDataSet.Create( nil );
end;

function TCtrl_Pessoa.SelecionaPessoa( iIdPessoa : integer ) : OleVariant;
begin
  FDb_Pessoa.IdPessoa.AsInteger := iIdPessoa;
  Result := GetDataPacket( FDb_Pessoa.SSqlSelect );
end;

procedure TCtrl_Pessoa.SetCdsPessoa(
  const Value: TCMClientDataSet);
begin
  FCdsPessoa := Value;
end;

procedure TCtrl_Pessoa.SetDb_Pessoa(
  const Value: TDb_Pessoa);
begin
  FDb_Pessoa := Value;
end;

function TCtrl_Pessoa.RecuperaNomePessoa(iIdPessoa: integer): OleVariant;
begin
  Result := GetDataPacket( ' select NOME       ' +
                           '   from PESSOA     ' +
                           '  where IDPESSOA = ' + IntToStr( iIdPessoa ) );
end;

function TCtrl_Pessoa.AlterarPessoa( bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarPessoa( FCdsPessoa.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' update PESSOA             '                                                         +
              ' set    NOME             = ' + QuotedStr( FCdsPessoa.FieldByName('NOME').AsString  ) + ', ';
              //Pendência 23274 - 28/12/2007
              if not FCdsPessoa.FieldByName('NOME').IsNull then
                 sSQL := sSQL +
                 '     NUMDOCUMENTO = ' + QuotedStr( FCdsPessoa.FieldByName('NUMDOCUMENTO').AsString  ) + ', ';
              sSQL := sSQL +
              //Fim Pendência 23274
              '        IDENDCORRESP     = ' + IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDCORRESP').AsString, 0 ) )     + ', ' +
              '        IDENDCOMERCIAL   = ' + IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDCOMERCIAL').AsString, 0 ) )   + ', ' +
              '        IDENDENTREGA     = ' + IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDENTREGA').AsString, 0 ) )     + ', ' +
              '        IDENDRESIDENCIAL = ' + IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDRESIDENCIAL').AsString, 0 ) ) + ', ' +
              '        IDENDCOBRANCA    = ' + IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDCOBRANCA').AsString, 0 ) )    +
              ' where  IDPESSOA         = ' + FCdsPessoa.FieldByName('IDPESSOA').AsString           ;

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

   except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrl_Pessoa.ExcluirPessoa(iIdPessoa: integer; bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluirPessoa( iIdPessoa );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' delete from PESSOA  ' +
              ' where  IDPESSOA  = ' + IntToStr( iIdPessoa );

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

   except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrl_Pessoa.IncluirPessoa( bEmTransacao : boolean ): Integer;
var
  sSQL : string;
  bOk : boolean;
begin
  Result := 0;

  if ConnectionSide = cnsClient then
  begin
    bOk := ( Connection.AppServer.IncluirPessoa( FCdsPessoa.Data ) > 0 );
    if not bOk then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not ( FCdsPessoa.State in [dsEdit, dsInsert] ) then
      begin
        FCdsPessoa.Edit;
        FCdsPessoa.FieldByName('IDPESSOA').AsInteger := ProxId( Self, 'PESSOA' );
        FCdsPessoa.Post;
      end;

      if not bEmTransacao then StartTransaction;

      sSQL := ' insert into PESSOA            ' +
              ' (           IDPESSOA,         ' +
              '             NOME,             ' +
              //Pendência 23274 - 28/12/2007
              '             NUMDOCUMENTO,     ' +
              //Fim Pendência 23274
              '             IDENDCORRESP,     ' +
              '             IDENDCOMERCIAL,   ' +
              '             IDENDENTREGA,     ' +
              '             IDENDRESIDENCIAL, ' +
              '             IDENDCOBRANCA     ' +
              ' ) values (                    ' +
              FCdsPessoa.FieldByName('IDPESSOA').AsString           + ', ' +
              QuotedStr( FCdsPessoa.FieldByName('NOME').AsString  ) + ', ';
              //Pendência 23274 - 28/12/2007
              if FCdsPessoa.FieldByName('NOME').IsNull then sSQL := sSQL + 'NULL, ' else
                 sSQL := sSQL + QuotedStr( FCdsPessoa.FieldByName('NUMDOCUMENTO').AsString  ) + ', ';
              sSQL := sSQL +
              //Fim Pendência 23274
              IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDCORRESP').AsString, 0 ) )     + ', ' +
              IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDCOMERCIAL').AsString, 0 ) )   + ', ' +
              IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDENTREGA').AsString, 0 ) )     + ', ' +
              IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDRESIDENCIAL').AsString, 0 ) ) + ', ' +
              IntToStr( StrToIntDef( FCdsPessoa.FieldByName('IDENDCOBRANCA').AsString, 0 ) )    + '  ' +
              ' ) ';


      bOk := ExecSQL( sSQL );

      if not bOk then raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

      Result := FCdsPessoa.FieldByName('IDPESSOA').AsInteger

    except
      On E : Exception Do
      begin
        Result := 0;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

//Pendência 23142 - 24/08/2006
function TCtrl_Pessoa.ExcluirDependPessoa(iIdPessoa: integer; bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluirDependPessoa( iIdPessoa );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' delete from DEPENDPESSOA  ' +
              ' where  IDPESSOA  = ' + IntToStr( iIdPessoa );

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

   except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;
//Fim Pendência 23142

end.

