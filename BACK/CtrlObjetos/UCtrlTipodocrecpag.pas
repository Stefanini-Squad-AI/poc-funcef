unit uCtrlTipodocrecpag;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipodocrecpag, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505} {$ELSE} ,uCMTypes{$ENDIF};

type

  TCtrlTipodocrecpag = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _DbTipodocrecpag : TDbTipodocrecpag;
    Fcds      : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function ListTipodocrecpag( RECPAG : string; CODTIPDOC : double ): OleVariant;
    Function ListTipoDocAgrupo( Recpag : string; idusuario : integer) : OleVariant;
    Function ListTipoDocLanc( Recpag : string; idusuario : integer) : OleVariant;
    function GravarTipodocrecpag     : Boolean;
End;


implementation

{ TCtrlTipodocrecpag }

constructor TCtrlTipodocrecpag.Create;
begin
  inherited;
  _DbTipodocrecpag := TDbTipodocrecpag.Create( Self );
end;

destructor TCtrlTipodocrecpag.Destroy;
begin
  _DbTipodocrecpag.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlTipodocrecpag.DoChangeDataBase;
begin
  inherited;
  _DbTipodocrecpag.DataBaseName := DataBaseName;
end;

function TCtrlTipodocrecpag.ListTipodocrecpag( RECPAG : string; CODTIPDOC : double ): OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipodocrecpag( RECPAG, CODTIPDOC );
   MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
Begin
   ssql := 'SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, FLGDOCFISCAL'+
        ' FROM TIPODOCRECPAG WHERE RECPAG = '''+RECPAG+'''';
   if CODTIPDOC <> 0 then
      ssql := ssql + ' and  CODTIPDOC = '+floattostr(CODTIPDOC) ;
   ssql := ssql +  'ORDER BY DEBCRE DESC,DESCRICAO';
   Result := GetDataPacket(ssql);
end;
end;

procedure TCtrlTipodocrecpag.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTipodocrecpag.GravarTipodocrecpag: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipodocrecpag(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbTipodocrecpag,[],[]);
        Msg    := _DbTipodocrecpag.MessageInfo;

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

procedure TCtrlTipodocrecpag.OnCreateAppServer;
begin
  inherited;
  FCds                := TClientDataSet.Create(nil);
end;

function TCtrlTipodocrecpag.ListTipoDocAgrupo(Recpag : string; idusuario : integer): OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipoDocAgrupo(Recpag,  idusuario) ;
   MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
Begin
    ssql:='  SELECT recpag, CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
          '  FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
          ' WHERE a.RECPAG =  '+#39+recpag+#39+' AND ((FLGENGLOBAPARCELA <> ''S'') OR (FLGENGLOBAPARCELA IS NULL)) '+
          ' and not exists (select 1 from UsuarioxTpdocto b where recpag='+#39+recpag+#39+' and b.idusuario='+inttostr(IdUsuario)+') '+
          ' union SELECT recpag,CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
          ' FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
          ' WHERE a.RECPAG =  '+#39+recpag+#39+' AND ((FLGENGLOBAPARCELA <> ''S'') OR (FLGENGLOBAPARCELA IS NULL)) '+
          ' and  exists '+
          ' (select 1 from UsuarioxTpdocto b where recpag='+#39+recpag+#39+' and a.codtipdoc=b.codtipdoc  '+
          ' and b.idusuario='+inttostr(IdUsuario)+') ORDER BY DEBCRE DESC,DESCRICAO  ';
   Result := GetDataPacket(ssql);
end;
end;

function TCtrlTipodocrecpag.ListTipoDocLanc(Recpag: string;
  idusuario: integer): OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipoDocLanc(Recpag,  idusuario) ;
   MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
Begin
    ssql:='  SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
        '  FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
        ' WHERE a.RECPAG =  '+#39+recpag+#39+
        ' and not exists (select 1 from UsuarioxTpdocto b where recpag='+#39+recpag+#39+' and b.idusuario='+Inttostr(IdUsuario)+') '+
        ' union SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
        ' FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
        ' WHERE a.RECPAG =  '+#39+recpag+#39+' and  exists '+
        ' (select 1 from UsuarioxTpdocto b where recpag='+#39+recpag+#39+' and a.codtipdoc=b.codtipdoc  '+
        ' and b.idusuario='+Inttostr(IdUsuario)+') ORDER BY DEBCRE DESC,DESCRICAO  ';
   Result := GetDataPacket(ssql);
end;
end;

end.
