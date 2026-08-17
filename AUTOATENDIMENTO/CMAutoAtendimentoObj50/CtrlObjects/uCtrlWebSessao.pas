//--------------------------------------------------------------------------------
//Pendência   : SOL 140165 KINTANA 875016
//Responsável : BRUNO AZEVEDO
//Data        : 26/07/2010
//Descrição   : Correção na criação de sessões.
//--------------------------------------------------------------------------------

unit uCtrlWebSessao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebSessao;

Type
  TCtrlWebSessao = class(TCmControlObject)
  private
    FCdsWebSessao: TCMClientDataSet;
    FDbWebSessao: TDbWebSessao;
    procedure SetCdsWebSessao(const Value: TCMClientDataSet);
    procedure SetDbWebSessao(const Value: TDbWebSessao);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebSessao : TDbWebSessao read FDbWebSessao write SetDbWebSessao;
    property CdsWebSessao : TCMClientDataSet read FCdsWebSessao write SetCdsWebSessao;

    function SelecionaWebSessao( sIdWebSessao : String ) : OleVariant;
    function GravaWebSessao : Boolean;
    function SelecionaPorSessaoLogin( sIdWebSessao, sLoginPessoal : String) : OleVariant;
    function ExcluiSessao( sIdWebSessao : String ) : Boolean;
    function IncluiSessao( sIdWebSessao, sLoginPessoal : string; iIdWebInterface : integer; sDataHora : String ) : Boolean;
    function AtualizaSessao( sIdWebSessao, sDataHora : String ) : Boolean;
    function ExcluiExpiradas( sDataHora : String ) : Boolean;
    function ExcluiTodos: Boolean;

    procedure StatusSistema( iIdWebInterface : integer; var iQtdeUsuarios : integer; var dUltAcesso : TDateTime ); 

    function ChecaSessao(sIdWebSessao: String): OleVariant;

  published

end;

implementation

{ TCtrlWebSessao }

constructor TCtrlWebSessao.Create;
begin
  inherited;
  FDbWebSessao  := TDbWebSessao.Create( self );
end;

destructor TCtrlWebSessao.Destroy;
begin
  FDbWebSessao.Free;
  if IsAppServer then FCdsWebSessao.Free;
  inherited;
end;

procedure TCtrlWebSessao.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebSessao.DataBaseName    := DataBaseName
  else
    FDbWebSessao.dbADOConnection := dbADOConnection;
end;

function TCtrlWebSessao.GravaWebSessao: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebSessao( CdsWebSessao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebSessao, FDbWebSessao, [], [] );

      Msg := FDbWebSessao.MessageInfo;

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

procedure TCtrlWebSessao.OnCreateAppServer;
begin
  inherited;
  FCdsWebSessao := TCMClientDataSet.Create( nil );
end;

function TCtrlWebSessao.SelecionaWebSessao(
  sIdWebSessao : String ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaWebSessao( sIdWebSessao )
  else
  begin
    FDbWebSessao.IdWebSessao.AsString := sIdWebSessao;
    Result := GetDataPacket( FDbWebSessao.SSqlSelect );
  end;
end;

procedure TCtrlWebSessao.SetCdsWebSessao(
  const Value: TCMClientDataSet);
begin
  FCdsWebSessao := Value;
end;

procedure TCtrlWebSessao.SetDbWebSessao(
  const Value: TDbWebSessao);
begin
  FDbWebSessao := Value;
end;

function TCtrlWebSessao.ExcluiExpiradas(sDataHora : String): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiExpiradas( sDataHora );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
    Result := ExecSQL( ' delete from WEBSESSAO     ' +
                       ' where       DTULTACESSO < ' + sDataHora );
end;

function TCtrlWebSessao.SelecionaPorSessaoLogin(sIdWebSessao, sLoginPessoal : String): OleVariant;
begin
  Result := GetDataPacket( ' select   to_char( DTINICIO, ''dd/mm/yyyy hh24:mi:ss'' ) as DTINICIO,      ' +
                           '          to_char( DTULTACESSO, ''dd/mm/yyyy hh24:mi:ss'' ) as DTULTACESSO ' +
                           '  from    WEBSESSAO      ' +
                           '  where   IDWEBSESSAO  = ' + QuotedStr( sIdWebSessao ) +
                           '    and   LOGINPESSOAL = ' + QuotedStr( sLoginPessoal ) );
end;

function TCtrlWebSessao.ExcluiSessao( sIdWebSessao : String ) : Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiSessao( sIdWebSessao );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
    Result := ExecSQL( ' delete from WEBSESSAO      ' +
                       ' where       IDWEBSESSAO  = ' + QuotedStr( sIdWebSessao ) );
end;


function TCtrlWebSessao.AtualizaSessao(sIdWebSessao,
  sDataHora: String): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AtualizaSessao( sIdWebSessao, sDataHora );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
    Result := ExecSQL( '  update  WEBSESSAO     ' +
                       '     set  DTULTACESSO = ' + sDataHora +
                       '   where  IDWEBSESSAO = ' + QuotedStr( sIdWebSessao ) );
end;

function TCtrlWebSessao.IncluiSessao( sIdWebSessao, sLoginPessoal : string; iIdWebInterface : integer; sDataHora : String ) : Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluiSessao( sIdWebSessao, sLoginPessoal, iIdWebInterface, sDataHora );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
    Result := ExecSQL( '  insert into WEBSESSAO                             ' +
                       '              ( IDWEBSESSAO,                        ' +
                       '                LOGINPESSOAL,                       ' +
                       '                DTINICIO,                           ' +
                       '                IDWEBINTERFACE,                     ' +
                       '                DTULTACESSO )                       ' +
                       '       values                                       ' +
                       '              ( ' + QuotedStr( sIdWebSessao )  + ', ' +
                       '                ' + QuotedStr( sLoginPessoal ) + ', ' +
                       '                ' + sDataHora                  + ', ' +
                                        IntToStr( iIdWebInterface )    + ', ' +            
                       '                ' + sDataHora                  + ') ' );
end;

function TCtrlWebSessao.ExcluiTodos: Boolean;
begin
  Result := ExecSQL( ' delete from WEBSESSAO  ');
end;


procedure TCtrlWebSessao.StatusSistema(iIdWebInterface: integer;
  var iQtdeUsuarios: integer; var dUltAcesso: TDateTime);
var
  cdsAux : TCMClientDataset;
  iTimeOut : integer;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket(
     ' select TIMEOUT / 60 as TIMEOUT from WEBINTERFACE where IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) );

    iTimeOut := cdsAux.FieldByName('TIMEOUT').AsInteger;

    iQtdeUsuarios := -1;
    dUltAcesso := 0;

    if iTimeOut > 0 then
    begin
      cdsAux.Data := GetDataPacket(
       ' select count(*) as QTDE ' +
       ' from   WEBSESSAO ' +
       ' where  IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
       '   and  DTULTACESSO > ( SYSDATE - ( 0.000694444444444444 * ' + IntToStr( iTimeOut ) + '  ) ) ' );
      iQtdeUsuarios := cdsAux.FieldByName('QTDE').AsInteger;
    end;

    cdsAux.Data := GetDataPacket(
     ' select max( DATAHORA ) as DATAHORA ' +
     ' from WEBHSTACESSO ' +
     ' where  IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) );

    if not cdsAux.IsEmpty then
      dUltAcesso := cdsAux.FieldByName('DATAHORA').AsDateTime;

  finally
    cdsAux.Free;
  end;    
end;

//BRUNO AZEVEDO SOL 140165 KINTANA 875016
function TCtrlWebSessao.ChecaSessao(sIdWebSessao: String): OleVariant;
begin
  Result := GetDataPacket( ' select   * ' +
                           '  from    WEBSESSAO      ' +
                           '  where   IDWEBSESSAO  = ' + QuotedStr( sIdWebSessao ) );
end;
//BRUNO AZEVEDO SOL 140165 KINTANA 875016

end.
