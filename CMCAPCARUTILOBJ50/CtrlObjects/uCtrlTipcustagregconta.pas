unit uCtrlTipcustagregconta;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipcustagregconta, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505}  {$ELSE}, uCMTypes {$ENDIF};

type

  TCtrlTipcustagregconta = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _DbTipcustagregconta : TDbTipcustagregconta;
    Fcds   : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor Destroy; Override;
    Function ListTipcustagregconta( idpessoa : double = 0; RECPAG : string = ''; codalterador : double = 0) : OleVariant;
    function GravarTipcustagregconta  : Boolean;
End;

implementation

{ TCtrlTipcustagregconta }

constructor TCtrlTipcustagregconta.Create;
begin
  inherited;
  _DbTipcustagregconta := TDbTipcustagregconta.Create(self);
end;

destructor TCtrlTipcustagregconta.Destroy;
begin
  _DbTipcustagregconta.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlTipcustagregconta.DoChangeDataBase;
begin
  inherited;
  _DbTipcustagregconta.DataBaseName := DataBaseName;
end;

function TCtrlTipcustagregconta.ListTipcustagregconta( idpessoa : double = 0;
                                               RECPAG : string = '';
                                               codalterador : double=0) : OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipcustagregconta( idpessoa, RECPAG, codalterador);
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
           '       Tipcustagregconta T  where (1=1) ';
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

procedure TCtrlTipcustagregconta.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTipcustagregconta.GravarTipcustagregconta: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipcustagregconta(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbTipcustagregconta,[],[]);
        Msg    := _DbTipcustagregconta.MessageInfo;
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

procedure TCtrlTipcustagregconta.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.
