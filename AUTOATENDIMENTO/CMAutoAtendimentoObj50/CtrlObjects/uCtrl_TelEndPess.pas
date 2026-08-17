{
-------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
}
unit uCtrl_TelEndPess;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDb_TelEndPess, DB, uCtrlFuncoesAA, uCMFileUtils;

Type

  TUpdateStatus = (usUnmodified, usModified, usInserted, usDeleted);

  TCtrl_TelEndPess = class(TCmControlObject)
  private
    FCdsTelEndPess: TCMClientDataSet;
    FDb_TelEndPess: TDb_TelEndPess;
    procedure SetCdsTelEndPess(const Value: TCMClientDataSet);
    procedure SetDb_TelEndPess(const Value: TDb_TelEndPess);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property Db_TelEndPess : TDb_TelEndPess read FDb_TelEndPess write SetDb_TelEndPess;
    property CdsTelEndPess : TCMClientDataSet read FCdsTelEndPess write SetCdsTelEndPess;

    function SelecionaTelefonesPorPessoa( iIdPessoa : integer ) : OleVariant;
    function SelecionaTelefone( iIdTelefone : integer ) : OleVariant;
    function SelecionaTelefoneLogradouro( iIdTelefone : integer ) : OleVariant;
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    function SelecionaTelefoneEndereco( iIdEndereco : integer ) : OleVariant;
    function IncluirTelEndPess : Integer;
    function AlterarTelEndPess : Boolean;
    function GravaTelEndPess : Boolean;
    procedure ExcluiTelEndPess( iIdTelefone : integer );

  published

end;

implementation

{ TCtrl_TelEndPess }

procedure TCtrl_TelEndPess.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_TelEndPess.DataBaseName    := DataBaseName
  else
    FDb_TelEndPess.DbAdoConnection := DbAdoConnection;
end;

function TCtrl_TelEndPess.AlterarTelEndPess: Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarTelEndPess( FCdsTelEndPess.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      StartTransaction;

      sSQL := ' update TELENDPESS    '                                                                     +
              ' set    IDENDERECO  = ' + FCdsTelEndPess.FieldByName('IDENDERECO').AsString          + ', ' +
              '        DDI         = ' + QuotedStr( FCdsTelEndPess.FieldByName('DDI').AsString )    + ', ' +
              '        DDD         = ' + QuotedStr( FCdsTelEndPess.FieldByName('DDD').AsString )    + ', ' +
              '        TIPO        = ' + QuotedStr( FCdsTelEndPess.FieldByName('TIPO').AsString )   + ', ' +
              '        NUMERO      = ' + QuotedStr( FCdsTelEndPess.FieldByName('NUMERO').AsString )        +
              ' where  IDTELEFONE  = ' + FCdsTelEndPess.FieldByName('IDTELEFONE').AsString                 ;

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );
      
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

constructor TCtrl_TelEndPess.Create;
begin
  inherited;
  FDb_TelEndPess  := TDb_TelEndPess.Create( self );
end;

destructor TCtrl_TelEndPess.Destroy;
begin
  FDb_TelEndPess.Free;
  if IsAppServer then FCdsTelEndPess.Free;
  inherited;
end;

procedure TCtrl_TelEndPess.ExcluiTelEndPess( iIdTelefone : integer );
begin
  ExecSQL( 'delete from TELENDPESS where IDTELEFONE = ' + IntToStr( iIdTelefone ) );
end;

function TCtrl_TelEndPess.GravaTelEndPess: Boolean;
var
  Msg : String; 
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaTelEndPess( FCdsTelEndPess.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds( FCdsTelEndPess, FDb_TelEndPess, [], [] );
      Msg := FDb_TelEndPess.MessageInfo;
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

function TCtrl_TelEndPess.IncluirTelEndPess: Integer;
var
  sSQL : string;
  bOk : boolean;
begin
  Result := 0;

  if ConnectionSide = cnsClient then
  begin
    bOk := ( Connection.AppServer.IncluirTelEndPess( FCdsTelEndPess.Data ) > 0 );
    if not bOk then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not ( FCdsTelEndPess.State in [dsEdit, dsInsert] ) then
      begin
        FCdsTelEndPess.Edit;
        FCdsTelEndPess.FieldByName('IDTELEFONE').AsInteger := ProxId( Self, 'TELENDPESS' );
        FCdsTelEndPess.Post;
      end;

      StartTransaction;

      sSQL := ' insert into TELENDPESS    ' +
              ' (           IDTELEFONE,   ' +
              '             IDENDERECO,   ' +
              '             DDI,          ' +
              '             DDD,          ' +
              '             TIPO,         ' +
              '             NUMERO        ' +
              ' ) values (                ' +
              FCdsTelEndPess.FieldByName('IDTELEFONE').AsString               + ', ' +
              FCdsTelEndPess.FieldByName('IDENDERECO').AsString               + ', ' +
              QuotedStr( FCdsTelEndPess.FieldByName('DDI').AsString )         + ', ' +
              QuotedStr( FCdsTelEndPess.FieldByName('DDD').AsString )         + ', ' +
              QuotedStr( FCdsTelEndPess.FieldByName('TIPO').AsString )        + ', ' +
              QuotedStr( FCdsTelEndPess.FieldByName('NUMERO').AsString )                         +
              ' ) ';

      bOk := ExecSQL( sSQL );

      if not bOk then raise Exception.Create( MessageInfo );

      Commit;

      Result := FCdsTelEndPess.FieldByName('IDTELEFONE').AsInteger;

    except
      On E : Exception Do
      begin
        Result := 0;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrl_TelEndPess.OnCreateAppServer;
begin
  inherited;
  FCdsTelEndPess := TCMClientDataSet.Create( nil );
end;

function TCtrl_TelEndPess.SelecionaTelefone( iIdTelefone : integer ): OleVariant;
begin
  FDb_TelEndPess.IdTelefone.AsInteger := iIdTelefone;
  //Result := GetDataPacket( FDb_TelEndPess.SSqlSelect );

  Result := GetDataPacket(
   ' select     t.IDENDERECO,                                               ' +
   '            t.IDTELEFONE,                                               ' +
   '            t.DDI,                                                      ' +
   '            t.DDD,                                                      ' +
   '            t.TIPO,                                                     ' +
   '            t.NUMERO                                                    ' +
   ' from       TELENDPESS t                                                ' +
   ' where      t.IDTELEFONE = ' + IntToStr( iIdTelefone )                    );
    
end;

function TCtrl_TelEndPess.SelecionaTelefoneLogradouro( iIdTelefone : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' select     e.IDENDERECO,                                               ' +
   '            e.LOGRADOURO,                                               ' +
   '            t.IDTELEFONE,                                               ' +
   '            t.DDI,                                                      ' +
   '            t.DDD,                                                      ' +
   '            t.TIPO,                                                     ' +
   '            t.NUMERO                                                    ' +
   ' from       TELENDPESS t,                                               ' +
   '            ENDPESS    e                                                ' +
   ' where      t.IDTELEFONE = ' + IntToStr( iIdTelefone )                    +
   '   and      t.IDENDERECO = e.IDENDERECO                                 ' );
end;

//BRUNO AZEVEDO SOL 91655 KINTANA 394002
function TCtrl_TelEndPess.SelecionaTelefoneEndereco( iIdEndereco : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' select     e.IDENDERECO,                                               ' +
   '            e.LOGRADOURO,                                               ' +
   '            t.IDTELEFONE,                                               ' +
   '            t.DDI,                                                      ' +
   '            t.DDD,                                                      ' +
   '            t.TIPO,                                                     ' +
   '            t.NUMERO                                                    ' +
   ' from       TELENDPESS t,                                               ' +
   '            ENDPESS    e                                                ' +
   ' where      t.IDENDERECO = ' + IntToStr( iIdEndereco ) +
   '   AND      e.idendereco = t.idendereco ');
end;
//BRUNO AZEVEDO SOL 91655 KINTANA 394002

function TCtrl_TelEndPess.SelecionaTelefonesPorPessoa( iIdPessoa: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select     e.IDENDERECO,                                               ' +
   '            e.LOGRADOURO,                                               ' +
   '            t.IDTELEFONE,                                               ' +
   '            t.DDI,                                                      ' +
   '            t.DDD,                                                      ' +
   '            t.TIPO,                                                     ' +
   '            t.NUMERO                                                    ' +
   ' from       TELENDPESS t,                                               ' +
   '            ENDPESS    e                                                ' +
   ' where      e.IDPESSOA   = ' + IntToStr( iIdPessoa )                      +
   '   and      t.IDENDERECO = e.IDENDERECO                                 ' +
   //BRUNO AZEVEDO SOL 91655 KINTANA 394002
   '   and e.idendereco IN(SELECT p.idendcorresp                            ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendcomercial                                       ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendentrega                                         ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendresidencial                                     ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendcobranca                                        ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +')' );
   //BRUNO AZEVEDO SOL 91655 KINTANA 394002
end;

procedure TCtrl_TelEndPess.SetCdsTelEndPess(const Value: TCMClientDataSet);
begin
  FCdsTelEndPess := Value;
end;

procedure TCtrl_TelEndPess.SetDb_TelEndPess(const Value: TDb_TelEndPess);
begin
  FDb_TelEndPess := Value;
end;

end.
