unit uCtrlEventoDocum;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, Db, uCMTypes, uCtrlDocumento,
     uCtrlPadroes, uDbEventoxDocum, uDbTipoEventoDocum, uSistema;

Type
  TCtrlEventoDocum = Class(TCmControlObject)
  private
    DbEventoxdocum      : TDbEventoxDocum;
    DbTipoeventodocum   : TDbTipoeventodocum;
    FCdsTipoEventoDocum : TClientDataSet;
    FCdsEventoxDocum    : TClientDataSet;
    procedure SetCdsEventoxDocum(const Value: TClientDataSet);
    procedure SetCdsTipoEventoDocum(const Value: TClientDataSet);
  protected
    procedure OnCreateAppServer; Override;
    procedure AfterInitialize; Override;
  public
    Property CdsTipoEventoDocum : TClientDataSet read FCdsTipoEventoDocum write SetCdsTipoEventoDocum;
    Property CdsEventoxDocum    : TClientDataSet read FCdsEventoxDocum    write SetCdsEventoxDocum;
    Constructor Create; Override;
    Destructor Destroy; Override;

    Function ListaTipoEventoDocum( IdTipoEventoDocum: Double = -1): OleVariant;
    Function ListaEventoxDocum(CodDocumento: Double = -1) : OleVariant;
    Function GravarTipoEventoDocum:Boolean;
    Function GravarEventoxDocum:Boolean;

    function GravaLogEvento( iIdTipoEventoDocum : double;
                             iIdUsuario         : double;
                             iCodDocumento      : double;
                             sDescricao         : string ) : boolean;


  end;

implementation

{ TCtrlLancAlteradores }

constructor TCtrlEventoDocum.Create;
begin
  inherited;
  DbEventoxDocum      := TDbEventoxdocum.Create(Self);
  DbTipoeventodocum   := TDbTipoeventodocum.Create(Self);
end;


destructor TCtrlEventoDocum.Destroy;
begin
  if IsAppServer then begin
     FreeAndNil(FCdsTipoEventoDocum);
     FreeAndNil(FCdsEventoxDocum);
  end;

  FreeAndNil(DbEventoxdocum);
  FreeAndNil(DbTipoeventodocum);
  inherited;
end;


procedure TCtrlEventoDocum.OnCreateAppServer;
begin
  inherited;
  FCdsTipoEventoDocum := TClientDataSet.Create( nil );
  FCdsEventoxDocum    := TClientDataSet.Create( nil );
end;


procedure TCtrlEventoDocum.AfterInitialize;
begin
  inherited;
  DbTipoeventodocum.DataBaseName := DataBaseName;
  DbEventoxdocum.DataBaseName    := DataBaseName;
end;


function TCtrlEventoDocum.GravarTipoEventoDocum: Boolean;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarTipoEvento( FCdsTipoEventoDocum.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( CdsTipoEventoDocum, DbTipoeventodocum, [], [] );
        If Not Result Then
           Raise Exception.Create( DbTipoeventodocum.MessageInfo );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;


function TCtrlEventoDocum.GravarEventoxDocum: Boolean;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarEventoxDocum( FCdsEventoxDocum.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( CdsEventoxDocum, DbEventoxdocum, [], [] );
        If Not Result Then
           Raise Exception.Create( DbEventoxdocum.MessageInfo );
        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
End;


function TCtrlEventoDocum.ListaTipoEventoDocum(IdTipoEventoDocum: Double): OleVariant;
var
  Sql    : String;
  sParam : String;
begin
  sParam := '';
  If IdTipoEventoDocum <> 0 then
   sParam := 'AND IDTIPOEVENTODOCUM = ' + FloatToStr( IdTipoEventoDocum ) +#13;

  If IdTipoEventoDocum = -1000 then
   sParam := 'AND IDTIPOEVENTODOCUM > 0 ' + #13;

  Sql := ' SELECT IDTIPOEVENTODOCUM,     '  +#13+
         '       IDMODULO,               '  +#13+
         '       DESCRICAO,              '  +#13+
         '       FLGATIVO                '  +#13+
         '  FROM TIPOEVENTODOCUM         '  +#13+
         '  WHERE IDMODULO = '+ IntToStr( Sistema.IdModulo ) +#13+
         sParam +
         ' ORDER BY DESCRICAO'              +#13;
  Result := GetDataPacket( Sql );
end;


function TCtrlEventoDocum.ListaEventoxDocum(CodDocumento: Double) : OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT  PU.NOME AS NOME_USUARIO,        ' +#13+
         '        ED.IDEVENTOXDOCUM,              ' +#13+
         '        ED.CODDOCUMENTO,                ' +#13+
         '        ED.IDTIPOEVENTODOCUM,           ' +#13+
         '        ED.IDUSUARIO,                   ' +#13+
         '        ED.DATAEVENTO,                  ' +#13+
         '        ED.DESCRICAO,                   ' +#13+
         '        P.NOME,                         ' +#13+
         '        P.RAZAOSOCIAL,                  ' +#13+
         '        T.DESCRICAO AS DESC_TIPOEVENTO, ' +#13+
         '        RTRIM(TO_CHAR(D.NODOCUMENTO)) || '' '' || D.COMPLDOCUMENTO AS DOCCOMPL, ' +#13+
         '        D.DATAPROGRAMADA                ' +#13+
         '  FROM  EVENTOXDOCUM ED, PESSOA P, DOCUMENTO D, TIPOEVENTODOCUM T, ' +#13+
         '        PESSOA PU                                                  ' +#13+
         ' WHERE  D.IDFORCLI          = P.IDPESSOA           AND             ' +#13+
         '        ED.CODDOCUMENTO     = D.CODDOCUMENTO       AND             ' +#13+
         '        T.IDTIPOEVENTODOCUM = ED.IDTIPOEVENTODOCUM AND             ' +#13+
         '        PU.IDPESSOA         = ED.IDUSUARIO         AND             ' +#13+
         '        T.FLGATIVO          = 1                    AND             ' +#13+
         '        D.CODDOCUMENTO      = ' + FloatToStr(CodDocumento)           +#13+
         'ORDER BY DESCRICAO                                                 ' +#13;

  Result := GetDataPacket( Sql );
end;


procedure TCtrlEventoDocum.SetCdsEventoxDocum(const Value: TClientDataSet);
begin
  FCdsEventoxDocum := Value;
end;


procedure TCtrlEventoDocum.SetCdsTipoEventoDocum(const Value: TClientDataSet);
begin
  FCdsTipoEventoDocum := Value;
end;


function TCtrlEventoDocum.GravaLogEvento( iIdTipoEventoDocum : double;
                                          iIdUsuario         : double;
                                          iCodDocumento      : double;
                                          sDescricao         : string ) : boolean;
var
  Seq : Double;
begin
  _Cds.Data := GetDataPacket(
   ' select FLGATIVO from TIPOEVENTODOCUM where IDTIPOEVENTODOCUM = ' + FloatToStr( iIdTipoEventoDocum ) );

  if _Cds.FieldByName( 'FLGATIVO' ).AsInteger <> 1 then
  begin
    Result := True;
    exit;
  end;

  Seq := GetSequence( 'EVENTOXDOCUM' );
  Result := ExecSQL(
   ' insert into EVENTOXDOCUM ' +
   ' ( IDEVENTOXDOCUM    ,    ' +
   '   IDTIPOEVENTODOCUM ,    ' +
   '   IDUSUARIO         ,    ' +
   '   CODDOCUMENTO      ,    ' +
   '   DESCRICAO         ,    ' +
   '   DATAEVENTO        )    ' +
   ' values                   ' +
   ' ( ' + FloatToStr( Seq ) + ', ' +
           FloatToStr( iIdTipoEventoDocum ) + ', ' +
           FloatToStr( iIdUsuario ) + ', ' +
           FloatToStr( iCodDocumento ) + ', ' +
           QuotedStr( sDescricao ) + ', ' +
   '   sysdate ) ' );
end;

end.
