unit uCtrl_PessoaFisica;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDb_PessoaFisica, DB, uCtrlFuncoesAA;

Type
  TCtrl_PessoaFisica = class(TCmControlObject)
  private
    FCdsPessoaFisica: TCMClientDataSet;
    FDb_PessoaFisica: TDb_PessoaFisica;
    procedure SetCdsPessoaFisica(const Value: TCMClientDataSet);
    procedure SetDb_PessoaFisica(const Value: TDb_PessoaFisica);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property Db_PessoaFisica : TDb_PessoaFisica read FDb_PessoaFisica write SetDb_PessoaFisica;
    property CdsPessoaFisica : TCMClientDataSet read FCdsPessoaFisica write SetCdsPessoaFisica;

    //Seleciona todos os dados
    function SelecionaPessoaFisica( iIdPessoa : integer ) : OleVariant;

    //Salva alterações
    function GravaPessoaFisica : Boolean;

    function IncluirPessoaFisica( bEmTransacao : boolean = False )  : boolean;
    function AlterarPessoaFisica( bEmTransacao : boolean = False )  : Boolean;
    function ExcluirPessoaFisica( iIdPessoa : integer; bEmTransacao : boolean = False ) : Boolean;

    function AlterarTotais( bEmTransacao : boolean = False )  : Boolean;

  published

end;

implementation

{ TCtrl_PessoaFisica }

constructor TCtrl_PessoaFisica.Create;
begin
  inherited;
  FDb_PessoaFisica  := TDb_PessoaFisica.Create( self );
end;

destructor TCtrl_PessoaFisica.Destroy;
begin
  FDb_PessoaFisica.Free;
  if IsAppServer then FCdsPessoaFisica.Free;
  inherited;
end;

procedure TCtrl_PessoaFisica.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_PessoaFisica.DataBaseName    := DataBaseName
  else
    FDb_PessoaFisica.dbADOConnection := dbADOConnection;
end;

function TCtrl_PessoaFisica.GravaPessoaFisica: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Gravar_PessoaFisica( CdsPessoaFisica.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsPessoaFisica, FDb_PessoaFisica, [], [] );

      Msg := FDb_PessoaFisica.MessageInfo;

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

procedure TCtrl_PessoaFisica.OnCreateAppServer;
begin
  inherited;
  FCdsPessoaFisica := TCMClientDataSet.Create( nil );
end;

function TCtrl_PessoaFisica.SelecionaPessoaFisica( iIdPessoa : integer ) : OleVariant;
begin
  FDb_PessoaFisica.Idpessoa.AsInteger := iIdPessoa;
  Result := GetDataPacket( FDb_PessoaFisica.SSqlSelect );
end;

procedure TCtrl_PessoaFisica.SetCdsPessoaFisica(
  const Value: TCMClientDataSet);
begin
  FCdsPessoaFisica := Value;
end;

procedure TCtrl_PessoaFisica.SetDb_PessoaFisica(
  const Value: TDb_PessoaFisica);
begin
  FDb_PessoaFisica := Value;
end;

function TCtrl_PessoaFisica.AlterarPessoaFisica( bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarPessoa( FCdsPessoaFisica.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' update PESSOAFISICA       '                                                                                 +
              ' set    SEXO             = ' + QuotedStr( FCdsPessoaFisica.FieldByName('SEXO').AsString  )            + ', ' +
              '        ESTCIVIL         = ' + QuotedStr( FCdsPessoaFisica.FieldByName('ESTCIVIL').AsString  )        + ', ' ;

      if not FCdsPessoaFisica.FieldByName('DATANASC').IsNull then
        sSQL := sSQL +
              '        DATANASC         = ' + DateToStrOracle( FCdsPessoaFisica.FieldByName('DATANASC').AsDateTime ) + ', ' ;

      //Pendência 23274 - 28/12/2007
      if not FCdsPessoaFisica.FieldByName('DATAMORTE').IsNull then
        sSQL := sSQL +
              '        DATAMORTE        = ' + DateToStrOracle( FCdsPessoaFisica.FieldByName('DATAMORTE').AsDateTime ) + ', ' ;
      //Fim Pendência 23274

      sSQL := sSQL +
              '        NOMEPAI          = ' + QuotedStr( FCdsPessoaFisica.FieldByName('NOMEPAI').AsString  )         + ', ' +
              '        NOMEMAE          = ' + QuotedStr( FCdsPessoaFisica.FieldByName('NOMEMAE').AsString  )         + ', ' ;

      if not FCdsPessoaFisica.FieldByName('IDGRINSTR').IsNull then
        sSQL := sSQL +
              '        IDGRINSTR        = ' + FCdsPessoaFisica.FieldByName('IDGRINSTR').AsString                     + ', ' ;
              
      sSQL := sSQL +
              '        FLGISENTOIRRF    = ' + FCdsPessoaFisica.FieldByName('FLGISENTOIRRF').AsString                 + ', ' +
              '        FLGMOLESTIAGRAVE = ' + FCdsPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsString                     +
              ' where  IDPESSOA         = ' + FCdsPessoaFisica.FieldByName('IDPESSOA').AsString                             ;

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

function TCtrl_PessoaFisica.ExcluirPessoaFisica( iIdPessoa: integer; bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluirPessoaFisica( iIdPessoa );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' delete from PESSOAFISICA  ' +
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

function TCtrl_PessoaFisica.IncluirPessoaFisica( bEmTransacao : boolean ) : boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluirPessoaFisica( FCdsPessoaFisica.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' insert into PESSOAFISICA      ' +
              ' (           IDPESSOA,         ' +
              '             SEXO,             ' +
              '             ESTCIVIL,         ' ;

      if not FCdsPessoaFisica.FieldByName('DATANASC').IsNull then
        sSQL := sSQL +
              '             DATANASC,         ' ;

      //Pendência 23274 - 28/12/2007
      if not FCdsPessoaFisica.FieldByName('DATAMORTE').IsNull then
        sSQL := sSQL +
              '             DATAMORTE,        ' ;
      //Fim Pendência 23274

      sSQL := sSQL +
              '             NOMEPAI,          ' +
              '             NOMEMAE,          ' ;

      if not FCdsPessoaFisica.FieldByName('IDGRINSTR').IsNull then
        sSQL := sSQL +
              '             IDGRINSTR,        ' ;

      sSQL := sSQL +
              '             FLGISENTOIRRF,    ' +
              '             FLGMOLESTIAGRAVE  ' +
              ' ) values (                    ' +
              FCdsPessoaFisica.FieldByName('IDPESSOA').AsString                       + ', ' +
              QuotedStr( FCdsPessoaFisica.FieldByName('SEXO').AsString  )             + ', ' +
              QuotedStr( FCdsPessoaFisica.FieldByName('ESTCIVIL').AsString  )         + ', ' ;

      if not FCdsPessoaFisica.FieldByName('DATANASC').IsNull then
        sSQL := sSQL +
              DateToStrOracle( FCdsPessoaFisica.FieldByName('DATANASC').AsDateTime  ) + ', ' ;

      //Pendência 23274 - 28/12/2007
      if not FCdsPessoaFisica.FieldByName('DATAMORTE').IsNull then
        sSQL := sSQL +
              DateToStrOracle( FCdsPessoaFisica.FieldByName('DATAMORTE').AsDateTime  ) + ', ' ;
      //Fim Pendência 23274

      sSQL := sSQL +
              QuotedStr( FCdsPessoaFisica.FieldByName('NOMEPAI').AsString  )          + ', ' +
              QuotedStr( FCdsPessoaFisica.FieldByName('NOMEMAE').AsString  )          + ', ' ;

      if not FCdsPessoaFisica.FieldByName('IDGRINSTR').IsNull then
        sSQL := sSQL +
              FCdsPessoaFisica.FieldByName('IDGRINSTR').AsString + ', ' ;

      sSQL := sSQL +
              FCdsPessoaFisica.FieldByName('FLGISENTOIRRF').AsString                  + ', ' +
              FCdsPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsString                      +
              ' ) ';

      Result := ExecSQL( sSQL );

      if not Result then raise Exception.Create( MessageInfo );

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

function TCtrl_PessoaFisica.AlterarTotais(bEmTransacao: boolean): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarPessoa( FCdsPessoaFisica.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' update PESSOAFISICA       '                                                                                 +
              ' set    NUMDEPTOT        = ' + FCdsPessoaFisica.FieldByName('NUMDEPTOT').AsString  + ', ' +
              '        NUMDEPIRRF       = ' + FCdsPessoaFisica.FieldByName('NUMDEPIRRF').AsString + ', ' +
              '        NUMDEPSALF       = ' + FCdsPessoaFisica.FieldByName('NUMDEPSALF').AsString        +
              ' where  IDPESSOA         = ' + FCdsPessoaFisica.FieldByName('IDPESSOA').AsString                             ;

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

end.

