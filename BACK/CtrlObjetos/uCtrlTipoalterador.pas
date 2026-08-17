unit uCtrlTipoalterador;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipoalterador, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505} {$ELSE} ,uCMTypes{$ENDIF};

type

  TCtrlTipoalterador = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer; Override;
  private
    _DbTipoalterador : TDbTipoalterador;
    Fcds   : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function  ListTipoalterador( idpessoa : double = 0; RECPAG : string = ''; codalterador : double = 0) : OleVariant;
    Function  ListTipoAlteradorImpXAgreg( idpessoa : double = 0; RECPAG : string = ''; PACRESDECRES : string = '') : OleVariant;
    function GravarTipoalterador  : Boolean;
End;

implementation

{ TCtrlTipoalterador }

constructor TCtrlTipoalterador.Create;
begin
  inherited;
  _DbTipoalterador := TDbTipoalterador.Create( Self );
end;

destructor TCtrlTipoalterador.Destroy;
begin
  _DbTipoalterador.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlTipoalterador.DoChangeDataBase;
begin
  inherited;
  _DbTipoalterador.DataBaseName := DataBaseName;
end;

function TCtrlTipoalterador.ListTipoalterador( idpessoa : double = 0;
                                               RECPAG : string = '';
                                               codalterador : double=0) : OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipoalterador( idpessoa, RECPAG, codalterador );
   MessageInfo := Connection.AppServer.MessageInfo;
End
Else
Begin
   ssql := 'SELECT                   ' +
           '  CODALTERADOR,          ' +
           '  IDPESSOA ,             ' +
           '  CODSUBCONTA,           ' +
           '  IDEMPRESA ,            ' +
           '  PLANO   ,              ' +
           '  CODCENTROCUSTO ,       ' +
           '  PLACONTA    ,          ' +
           '  RECPAG    ,            ' +
           '  DESCRICAO  ,           ' +
           '  ACRESDECRES ,          ' +
           '  CONVERTE  ,            ' +
           '  IDUSUARIOINCLUSAO  ,   ' +
           '  FLGCALCULAIMPOSTO ,    ' +
           '  FLGAGREGABAIXA  ,      ' +
           '  FLGAGREGASALDO ,       ' +
           '  CODNATUREZA,           ' +
           '  CODCORRESP             ' +
           'FROM                     ' +
           '       Tipoalterador T  where (1=1) ';
   if idpessoa <> 0 then
      ssql := ssql + ' and iDPESSOA = ' + floattostr(IDPESSOA);
   if trim(RECPAG) <> '' then
      ssql := ssql + ' and RECPAG = ' + quotedstr(RECPAG);
   if codalterador <> 0 then
      ssql := ssql + ' and codalterador = ' + floattostr(codalterador);
   ssql := ssql + ' ORDER BY DESCRICAO  ';
   Result := GetDataPacket(ssql);
end;
end;

procedure TCtrlTipoalterador.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTipoalterador.GravarTipoalterador: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipoalterador(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbTipoalterador,[],[]);
        Msg    := _DbTipoalterador.MessageInfo;
        If Not Result Then Raise Exception.create(Msg);
          Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

function TCtrlTipoalterador.ListTipoAlteradorImpXAgreg( idpessoa : double = 0;
                               RECPAG : string = '';
                               PACRESDECRES : string = '') : OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipoAlteradorImpXAgreg( idpessoa, RECPAG, PACRESDECRES );
   MessageInfo := Connection.AppServer.MessageInfo;
End
Else
Begin
   ssql := 'SELECT CODALTERADOR,DESCRICAO,ACRESDECRES '+
        '  FROM TIPOALTERADOR                      '+
        ' WHERE (RECPAG = '''+RECPAG+''') AND '+
        '   (IDPESSOA = '+Floattostr(IDPESSOA)+') AND            '+
        '   (ACRESDECRES = '''+PACRESDECRES+''') AND      '+
        ' ((FLGCALCULAIMPOSTO = ''N'') OR (FLGCALCULAIMPOSTO IS NULL))';
   Result := GetDataPacket(ssql);
end;
end;

procedure TCtrlTipoalterador.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.
