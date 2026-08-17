unit uCtrlWebHstAcesso;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     uDbWebHstAcesso;

Type
  TCtrlWebHstAcesso = class(TCmControlObject)
  private
    FCdsWebHstAcesso: TCMClientDataSet;
    FDbWebHstAcesso: TDbWebHstAcesso;
    procedure SetCdsWebHstAcesso(const Value: TCMClientDataSet);
    procedure SetDbWebHstAcesso(const Value: TDbWebHstAcesso);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebHstAcesso : TDbWebHstAcesso read FDbWebHstAcesso write SetDbWebHstAcesso;
    property CdsWebHstAcesso : TCMClientDataSet read FCdsWebHstAcesso write SetCdsWebHstAcesso;

    function QtdeAcessosPorUsuario( iIdPessoa : integer ) : integer;
    function InsereWebHstAcesso( iIdPessoa, iIdWebInterface : integer ) : integer;

  published

end;

implementation

{ TCtrlWebHstAcesso }

procedure TCtrlWebHstAcesso.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebHstAcesso.DataBaseName    := DataBaseName
  else
    FDbWebHstAcesso.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlWebHstAcesso.Create;
begin
  inherited;
  FDbWebHstAcesso  := TDbWebHstAcesso.Create( self );
end;

destructor TCtrlWebHstAcesso.Destroy;
begin
  FDbWebHstAcesso.Free;
  if IsAppServer then FCdsWebHstAcesso.Free;
  inherited;
end;

function TCtrlWebHstAcesso.InsereWebHstAcesso( iIdPessoa, iIdWebInterface : integer ) : integer;
var
  cdsLocal : TCmClientDataSet;
  i : integer;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' select max( SEQACESSO ) as MAXIMO ' +
                                    ' from   WEBHSTACESSO               ' +
                                    ' where  IDPESSOA =                 ' + IntToStr( iIdPessoa ) );

    i := cdsLocal.FieldByName('MAXIMO').AsInteger + 1;

    ExecSQL( ' insert into WEBHSTACESSO        ' +
             '             ( IDPESSOA,         ' +
             '               SEQACESSO,        ' +
             '               DATAHORA,         ' +
             '               IDWEBINTERFACE  ) ' +
             ' values                   ' +
             '             ( ' + IntToStr( iIdPessoa ) + ', ' +
             '               ' + IntToStr( i         ) + ', ' +
             '               sysdate                      , ' +
             '               ' + IntToStr( iIdWebInterface ) + ' ) ' );

    Result := i;

  finally
    cdsLocal.Free;
  end;
end;

procedure TCtrlWebHstAcesso.OnCreateAppServer;
begin
  inherited;
  FCdsWebHstAcesso := TCMClientDataSet.Create( nil );
end;

function TCtrlWebHstAcesso.QtdeAcessosPorUsuario( iIdPessoa : integer ): integer;
var
  cdsLocal : TCmClientDataSet;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' select count(*) as QTDE ' +
                                    ' from   WEBHSTACESSO     ' +
                                    ' where  IDPESSOA =       ' + IntToStr( iIdPessoa ) );

    Result := cdsLocal.FieldByName('QTDE').AsInteger;
  finally
    cdsLocal.Free;
  end;
end;

procedure TCtrlWebHstAcesso.SetCdsWebHstAcesso( const Value: TCMClientDataSet);
begin
  FCdsWebHstAcesso := Value;
end;

procedure TCtrlWebHstAcesso.SetDbWebHstAcesso( const Value: TDbWebHstAcesso);
begin
  FDbWebHstAcesso := Value;
end;

end.
