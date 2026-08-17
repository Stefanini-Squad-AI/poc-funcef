unit uCtrlContratoProd;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbContratoProd,
     sysUtils, dbclient,Provider, uSistema, uCMTypes;

Type
  TCtrlContratoProd = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
     _DbContratoProd : TDbContratoProd;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos de Presistencia
    //-------------------------------------------------------------------------
    Function  Gravar : Boolean;
    Function  Procurar( IdContratoProd : Double = 0 ) : OleVariant;
    {**
       Pega todos os contratos existentes para este artigo
    **}
    Function  GetContrato( CodArtigo : String ) : OleVariant;

  End;

implementation

{ TCtrlContratoProd }

constructor TCtrlContratoProd.Create;
begin
  inherited;
  _DbContratoProd  := TDbContratoProd.Create(Self);
  FCds             := TClientDataSet.Create(nil);
end;

destructor TCtrlContratoProd.Destroy;
begin
  If Fcds.Active Then Fcds.Close;
  Fcds := nil;
  Fcds.Free;

  _DbContratoProd.Free;

 inherited;

end;

procedure TCtrlContratoProd.DoChangeDataBase;
begin
  inherited;
  _DbContratoProd.DataBaseName := DataBaseName;
end;

function TCtrlContratoProd.GetContrato(CodArtigo: String): OleVariant;
Var
   SQL : String;
begin
   CodArtigo := Copy(CodArtigo + '                            ',1,14);

   SQL := ' SELECT C.IDCONTRATOPROD, C.CODARTIGO, C.CODMEDIDA,   C.VLRUNITARIO, '+
          '        C.QTDEESPERADA, C.IDFORCLI, C.PRAZOPAG,  C.IDCOMPRADOR,      '+
          '        P.RAZAOSOCIAL '+
          ' FROM   PESSOA P,  CONTRATOPROD C '+
          ' WHERE  (C.CODARTIGO = '+QuotedStr(CodArtigo)+')  '+
          '    AND (C.IDFORCLI = P.IDPESSOA)  '+
          ' ORDER BY C.IDCONTRATOPROD ';
          
  Result := GetDataPacket( SQL );
end;

function TCtrlContratoProd.Gravar: Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarContratoProd( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FCds, _DbContratoProd,[],[]);
           If Not Result Then
              Raise Exception.Create( _DbContratoProd.MessageInfo );

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
End;


Function TCtrlContratoProd.Procurar(IdContratoProd: Double) : OleVariant;
Begin
   _dbContratoProd.IdContratoProd.AsFloat := IdContratoProd;
   Result := GetDataPacket( _dbContratoProd.SSqlSelect );
end;

procedure TCtrlContratoProd.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
